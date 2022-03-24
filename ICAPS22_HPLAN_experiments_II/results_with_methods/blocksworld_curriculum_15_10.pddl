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
      ?auto_412781 - BLOCK
    )
    :vars
    (
      ?auto_412782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412781 ?auto_412782 ) ( CLEAR ?auto_412781 ) ( HAND-EMPTY ) ( not ( = ?auto_412781 ?auto_412782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412781 ?auto_412782 )
      ( !PUTDOWN ?auto_412781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_412784 - BLOCK
    )
    :vars
    (
      ?auto_412785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412784 ?auto_412785 ) ( CLEAR ?auto_412784 ) ( HAND-EMPTY ) ( not ( = ?auto_412784 ?auto_412785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412784 ?auto_412785 )
      ( !PUTDOWN ?auto_412784 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_412788 - BLOCK
      ?auto_412789 - BLOCK
    )
    :vars
    (
      ?auto_412790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412788 ) ( ON ?auto_412789 ?auto_412790 ) ( CLEAR ?auto_412789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412788 ) ( not ( = ?auto_412788 ?auto_412789 ) ) ( not ( = ?auto_412788 ?auto_412790 ) ) ( not ( = ?auto_412789 ?auto_412790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412789 ?auto_412790 )
      ( !STACK ?auto_412789 ?auto_412788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_412793 - BLOCK
      ?auto_412794 - BLOCK
    )
    :vars
    (
      ?auto_412795 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412793 ) ( ON ?auto_412794 ?auto_412795 ) ( CLEAR ?auto_412794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412793 ) ( not ( = ?auto_412793 ?auto_412794 ) ) ( not ( = ?auto_412793 ?auto_412795 ) ) ( not ( = ?auto_412794 ?auto_412795 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412794 ?auto_412795 )
      ( !STACK ?auto_412794 ?auto_412793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_412798 - BLOCK
      ?auto_412799 - BLOCK
    )
    :vars
    (
      ?auto_412800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412799 ?auto_412800 ) ( not ( = ?auto_412798 ?auto_412799 ) ) ( not ( = ?auto_412798 ?auto_412800 ) ) ( not ( = ?auto_412799 ?auto_412800 ) ) ( ON ?auto_412798 ?auto_412799 ) ( CLEAR ?auto_412798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412798 )
      ( MAKE-2PILE ?auto_412798 ?auto_412799 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_412803 - BLOCK
      ?auto_412804 - BLOCK
    )
    :vars
    (
      ?auto_412805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412804 ?auto_412805 ) ( not ( = ?auto_412803 ?auto_412804 ) ) ( not ( = ?auto_412803 ?auto_412805 ) ) ( not ( = ?auto_412804 ?auto_412805 ) ) ( ON ?auto_412803 ?auto_412804 ) ( CLEAR ?auto_412803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412803 )
      ( MAKE-2PILE ?auto_412803 ?auto_412804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_412809 - BLOCK
      ?auto_412810 - BLOCK
      ?auto_412811 - BLOCK
    )
    :vars
    (
      ?auto_412812 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412810 ) ( ON ?auto_412811 ?auto_412812 ) ( CLEAR ?auto_412811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412809 ) ( ON ?auto_412810 ?auto_412809 ) ( not ( = ?auto_412809 ?auto_412810 ) ) ( not ( = ?auto_412809 ?auto_412811 ) ) ( not ( = ?auto_412809 ?auto_412812 ) ) ( not ( = ?auto_412810 ?auto_412811 ) ) ( not ( = ?auto_412810 ?auto_412812 ) ) ( not ( = ?auto_412811 ?auto_412812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412811 ?auto_412812 )
      ( !STACK ?auto_412811 ?auto_412810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_412816 - BLOCK
      ?auto_412817 - BLOCK
      ?auto_412818 - BLOCK
    )
    :vars
    (
      ?auto_412819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412817 ) ( ON ?auto_412818 ?auto_412819 ) ( CLEAR ?auto_412818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412816 ) ( ON ?auto_412817 ?auto_412816 ) ( not ( = ?auto_412816 ?auto_412817 ) ) ( not ( = ?auto_412816 ?auto_412818 ) ) ( not ( = ?auto_412816 ?auto_412819 ) ) ( not ( = ?auto_412817 ?auto_412818 ) ) ( not ( = ?auto_412817 ?auto_412819 ) ) ( not ( = ?auto_412818 ?auto_412819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412818 ?auto_412819 )
      ( !STACK ?auto_412818 ?auto_412817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_412823 - BLOCK
      ?auto_412824 - BLOCK
      ?auto_412825 - BLOCK
    )
    :vars
    (
      ?auto_412826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412825 ?auto_412826 ) ( ON-TABLE ?auto_412823 ) ( not ( = ?auto_412823 ?auto_412824 ) ) ( not ( = ?auto_412823 ?auto_412825 ) ) ( not ( = ?auto_412823 ?auto_412826 ) ) ( not ( = ?auto_412824 ?auto_412825 ) ) ( not ( = ?auto_412824 ?auto_412826 ) ) ( not ( = ?auto_412825 ?auto_412826 ) ) ( CLEAR ?auto_412823 ) ( ON ?auto_412824 ?auto_412825 ) ( CLEAR ?auto_412824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_412823 ?auto_412824 )
      ( MAKE-3PILE ?auto_412823 ?auto_412824 ?auto_412825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_412830 - BLOCK
      ?auto_412831 - BLOCK
      ?auto_412832 - BLOCK
    )
    :vars
    (
      ?auto_412833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412832 ?auto_412833 ) ( ON-TABLE ?auto_412830 ) ( not ( = ?auto_412830 ?auto_412831 ) ) ( not ( = ?auto_412830 ?auto_412832 ) ) ( not ( = ?auto_412830 ?auto_412833 ) ) ( not ( = ?auto_412831 ?auto_412832 ) ) ( not ( = ?auto_412831 ?auto_412833 ) ) ( not ( = ?auto_412832 ?auto_412833 ) ) ( CLEAR ?auto_412830 ) ( ON ?auto_412831 ?auto_412832 ) ( CLEAR ?auto_412831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_412830 ?auto_412831 )
      ( MAKE-3PILE ?auto_412830 ?auto_412831 ?auto_412832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_412837 - BLOCK
      ?auto_412838 - BLOCK
      ?auto_412839 - BLOCK
    )
    :vars
    (
      ?auto_412840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412839 ?auto_412840 ) ( not ( = ?auto_412837 ?auto_412838 ) ) ( not ( = ?auto_412837 ?auto_412839 ) ) ( not ( = ?auto_412837 ?auto_412840 ) ) ( not ( = ?auto_412838 ?auto_412839 ) ) ( not ( = ?auto_412838 ?auto_412840 ) ) ( not ( = ?auto_412839 ?auto_412840 ) ) ( ON ?auto_412838 ?auto_412839 ) ( ON ?auto_412837 ?auto_412838 ) ( CLEAR ?auto_412837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412837 )
      ( MAKE-3PILE ?auto_412837 ?auto_412838 ?auto_412839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_412844 - BLOCK
      ?auto_412845 - BLOCK
      ?auto_412846 - BLOCK
    )
    :vars
    (
      ?auto_412847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412846 ?auto_412847 ) ( not ( = ?auto_412844 ?auto_412845 ) ) ( not ( = ?auto_412844 ?auto_412846 ) ) ( not ( = ?auto_412844 ?auto_412847 ) ) ( not ( = ?auto_412845 ?auto_412846 ) ) ( not ( = ?auto_412845 ?auto_412847 ) ) ( not ( = ?auto_412846 ?auto_412847 ) ) ( ON ?auto_412845 ?auto_412846 ) ( ON ?auto_412844 ?auto_412845 ) ( CLEAR ?auto_412844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412844 )
      ( MAKE-3PILE ?auto_412844 ?auto_412845 ?auto_412846 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412852 - BLOCK
      ?auto_412853 - BLOCK
      ?auto_412854 - BLOCK
      ?auto_412855 - BLOCK
    )
    :vars
    (
      ?auto_412856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412854 ) ( ON ?auto_412855 ?auto_412856 ) ( CLEAR ?auto_412855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412852 ) ( ON ?auto_412853 ?auto_412852 ) ( ON ?auto_412854 ?auto_412853 ) ( not ( = ?auto_412852 ?auto_412853 ) ) ( not ( = ?auto_412852 ?auto_412854 ) ) ( not ( = ?auto_412852 ?auto_412855 ) ) ( not ( = ?auto_412852 ?auto_412856 ) ) ( not ( = ?auto_412853 ?auto_412854 ) ) ( not ( = ?auto_412853 ?auto_412855 ) ) ( not ( = ?auto_412853 ?auto_412856 ) ) ( not ( = ?auto_412854 ?auto_412855 ) ) ( not ( = ?auto_412854 ?auto_412856 ) ) ( not ( = ?auto_412855 ?auto_412856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412855 ?auto_412856 )
      ( !STACK ?auto_412855 ?auto_412854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412861 - BLOCK
      ?auto_412862 - BLOCK
      ?auto_412863 - BLOCK
      ?auto_412864 - BLOCK
    )
    :vars
    (
      ?auto_412865 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412863 ) ( ON ?auto_412864 ?auto_412865 ) ( CLEAR ?auto_412864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412861 ) ( ON ?auto_412862 ?auto_412861 ) ( ON ?auto_412863 ?auto_412862 ) ( not ( = ?auto_412861 ?auto_412862 ) ) ( not ( = ?auto_412861 ?auto_412863 ) ) ( not ( = ?auto_412861 ?auto_412864 ) ) ( not ( = ?auto_412861 ?auto_412865 ) ) ( not ( = ?auto_412862 ?auto_412863 ) ) ( not ( = ?auto_412862 ?auto_412864 ) ) ( not ( = ?auto_412862 ?auto_412865 ) ) ( not ( = ?auto_412863 ?auto_412864 ) ) ( not ( = ?auto_412863 ?auto_412865 ) ) ( not ( = ?auto_412864 ?auto_412865 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412864 ?auto_412865 )
      ( !STACK ?auto_412864 ?auto_412863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412870 - BLOCK
      ?auto_412871 - BLOCK
      ?auto_412872 - BLOCK
      ?auto_412873 - BLOCK
    )
    :vars
    (
      ?auto_412874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412873 ?auto_412874 ) ( ON-TABLE ?auto_412870 ) ( ON ?auto_412871 ?auto_412870 ) ( not ( = ?auto_412870 ?auto_412871 ) ) ( not ( = ?auto_412870 ?auto_412872 ) ) ( not ( = ?auto_412870 ?auto_412873 ) ) ( not ( = ?auto_412870 ?auto_412874 ) ) ( not ( = ?auto_412871 ?auto_412872 ) ) ( not ( = ?auto_412871 ?auto_412873 ) ) ( not ( = ?auto_412871 ?auto_412874 ) ) ( not ( = ?auto_412872 ?auto_412873 ) ) ( not ( = ?auto_412872 ?auto_412874 ) ) ( not ( = ?auto_412873 ?auto_412874 ) ) ( CLEAR ?auto_412871 ) ( ON ?auto_412872 ?auto_412873 ) ( CLEAR ?auto_412872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_412870 ?auto_412871 ?auto_412872 )
      ( MAKE-4PILE ?auto_412870 ?auto_412871 ?auto_412872 ?auto_412873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412879 - BLOCK
      ?auto_412880 - BLOCK
      ?auto_412881 - BLOCK
      ?auto_412882 - BLOCK
    )
    :vars
    (
      ?auto_412883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412882 ?auto_412883 ) ( ON-TABLE ?auto_412879 ) ( ON ?auto_412880 ?auto_412879 ) ( not ( = ?auto_412879 ?auto_412880 ) ) ( not ( = ?auto_412879 ?auto_412881 ) ) ( not ( = ?auto_412879 ?auto_412882 ) ) ( not ( = ?auto_412879 ?auto_412883 ) ) ( not ( = ?auto_412880 ?auto_412881 ) ) ( not ( = ?auto_412880 ?auto_412882 ) ) ( not ( = ?auto_412880 ?auto_412883 ) ) ( not ( = ?auto_412881 ?auto_412882 ) ) ( not ( = ?auto_412881 ?auto_412883 ) ) ( not ( = ?auto_412882 ?auto_412883 ) ) ( CLEAR ?auto_412880 ) ( ON ?auto_412881 ?auto_412882 ) ( CLEAR ?auto_412881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_412879 ?auto_412880 ?auto_412881 )
      ( MAKE-4PILE ?auto_412879 ?auto_412880 ?auto_412881 ?auto_412882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412888 - BLOCK
      ?auto_412889 - BLOCK
      ?auto_412890 - BLOCK
      ?auto_412891 - BLOCK
    )
    :vars
    (
      ?auto_412892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412891 ?auto_412892 ) ( ON-TABLE ?auto_412888 ) ( not ( = ?auto_412888 ?auto_412889 ) ) ( not ( = ?auto_412888 ?auto_412890 ) ) ( not ( = ?auto_412888 ?auto_412891 ) ) ( not ( = ?auto_412888 ?auto_412892 ) ) ( not ( = ?auto_412889 ?auto_412890 ) ) ( not ( = ?auto_412889 ?auto_412891 ) ) ( not ( = ?auto_412889 ?auto_412892 ) ) ( not ( = ?auto_412890 ?auto_412891 ) ) ( not ( = ?auto_412890 ?auto_412892 ) ) ( not ( = ?auto_412891 ?auto_412892 ) ) ( ON ?auto_412890 ?auto_412891 ) ( CLEAR ?auto_412888 ) ( ON ?auto_412889 ?auto_412890 ) ( CLEAR ?auto_412889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_412888 ?auto_412889 )
      ( MAKE-4PILE ?auto_412888 ?auto_412889 ?auto_412890 ?auto_412891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412897 - BLOCK
      ?auto_412898 - BLOCK
      ?auto_412899 - BLOCK
      ?auto_412900 - BLOCK
    )
    :vars
    (
      ?auto_412901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412900 ?auto_412901 ) ( ON-TABLE ?auto_412897 ) ( not ( = ?auto_412897 ?auto_412898 ) ) ( not ( = ?auto_412897 ?auto_412899 ) ) ( not ( = ?auto_412897 ?auto_412900 ) ) ( not ( = ?auto_412897 ?auto_412901 ) ) ( not ( = ?auto_412898 ?auto_412899 ) ) ( not ( = ?auto_412898 ?auto_412900 ) ) ( not ( = ?auto_412898 ?auto_412901 ) ) ( not ( = ?auto_412899 ?auto_412900 ) ) ( not ( = ?auto_412899 ?auto_412901 ) ) ( not ( = ?auto_412900 ?auto_412901 ) ) ( ON ?auto_412899 ?auto_412900 ) ( CLEAR ?auto_412897 ) ( ON ?auto_412898 ?auto_412899 ) ( CLEAR ?auto_412898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_412897 ?auto_412898 )
      ( MAKE-4PILE ?auto_412897 ?auto_412898 ?auto_412899 ?auto_412900 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412906 - BLOCK
      ?auto_412907 - BLOCK
      ?auto_412908 - BLOCK
      ?auto_412909 - BLOCK
    )
    :vars
    (
      ?auto_412910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412909 ?auto_412910 ) ( not ( = ?auto_412906 ?auto_412907 ) ) ( not ( = ?auto_412906 ?auto_412908 ) ) ( not ( = ?auto_412906 ?auto_412909 ) ) ( not ( = ?auto_412906 ?auto_412910 ) ) ( not ( = ?auto_412907 ?auto_412908 ) ) ( not ( = ?auto_412907 ?auto_412909 ) ) ( not ( = ?auto_412907 ?auto_412910 ) ) ( not ( = ?auto_412908 ?auto_412909 ) ) ( not ( = ?auto_412908 ?auto_412910 ) ) ( not ( = ?auto_412909 ?auto_412910 ) ) ( ON ?auto_412908 ?auto_412909 ) ( ON ?auto_412907 ?auto_412908 ) ( ON ?auto_412906 ?auto_412907 ) ( CLEAR ?auto_412906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412906 )
      ( MAKE-4PILE ?auto_412906 ?auto_412907 ?auto_412908 ?auto_412909 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_412915 - BLOCK
      ?auto_412916 - BLOCK
      ?auto_412917 - BLOCK
      ?auto_412918 - BLOCK
    )
    :vars
    (
      ?auto_412919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412918 ?auto_412919 ) ( not ( = ?auto_412915 ?auto_412916 ) ) ( not ( = ?auto_412915 ?auto_412917 ) ) ( not ( = ?auto_412915 ?auto_412918 ) ) ( not ( = ?auto_412915 ?auto_412919 ) ) ( not ( = ?auto_412916 ?auto_412917 ) ) ( not ( = ?auto_412916 ?auto_412918 ) ) ( not ( = ?auto_412916 ?auto_412919 ) ) ( not ( = ?auto_412917 ?auto_412918 ) ) ( not ( = ?auto_412917 ?auto_412919 ) ) ( not ( = ?auto_412918 ?auto_412919 ) ) ( ON ?auto_412917 ?auto_412918 ) ( ON ?auto_412916 ?auto_412917 ) ( ON ?auto_412915 ?auto_412916 ) ( CLEAR ?auto_412915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412915 )
      ( MAKE-4PILE ?auto_412915 ?auto_412916 ?auto_412917 ?auto_412918 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_412925 - BLOCK
      ?auto_412926 - BLOCK
      ?auto_412927 - BLOCK
      ?auto_412928 - BLOCK
      ?auto_412929 - BLOCK
    )
    :vars
    (
      ?auto_412930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412928 ) ( ON ?auto_412929 ?auto_412930 ) ( CLEAR ?auto_412929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412925 ) ( ON ?auto_412926 ?auto_412925 ) ( ON ?auto_412927 ?auto_412926 ) ( ON ?auto_412928 ?auto_412927 ) ( not ( = ?auto_412925 ?auto_412926 ) ) ( not ( = ?auto_412925 ?auto_412927 ) ) ( not ( = ?auto_412925 ?auto_412928 ) ) ( not ( = ?auto_412925 ?auto_412929 ) ) ( not ( = ?auto_412925 ?auto_412930 ) ) ( not ( = ?auto_412926 ?auto_412927 ) ) ( not ( = ?auto_412926 ?auto_412928 ) ) ( not ( = ?auto_412926 ?auto_412929 ) ) ( not ( = ?auto_412926 ?auto_412930 ) ) ( not ( = ?auto_412927 ?auto_412928 ) ) ( not ( = ?auto_412927 ?auto_412929 ) ) ( not ( = ?auto_412927 ?auto_412930 ) ) ( not ( = ?auto_412928 ?auto_412929 ) ) ( not ( = ?auto_412928 ?auto_412930 ) ) ( not ( = ?auto_412929 ?auto_412930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412929 ?auto_412930 )
      ( !STACK ?auto_412929 ?auto_412928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_412936 - BLOCK
      ?auto_412937 - BLOCK
      ?auto_412938 - BLOCK
      ?auto_412939 - BLOCK
      ?auto_412940 - BLOCK
    )
    :vars
    (
      ?auto_412941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_412939 ) ( ON ?auto_412940 ?auto_412941 ) ( CLEAR ?auto_412940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_412936 ) ( ON ?auto_412937 ?auto_412936 ) ( ON ?auto_412938 ?auto_412937 ) ( ON ?auto_412939 ?auto_412938 ) ( not ( = ?auto_412936 ?auto_412937 ) ) ( not ( = ?auto_412936 ?auto_412938 ) ) ( not ( = ?auto_412936 ?auto_412939 ) ) ( not ( = ?auto_412936 ?auto_412940 ) ) ( not ( = ?auto_412936 ?auto_412941 ) ) ( not ( = ?auto_412937 ?auto_412938 ) ) ( not ( = ?auto_412937 ?auto_412939 ) ) ( not ( = ?auto_412937 ?auto_412940 ) ) ( not ( = ?auto_412937 ?auto_412941 ) ) ( not ( = ?auto_412938 ?auto_412939 ) ) ( not ( = ?auto_412938 ?auto_412940 ) ) ( not ( = ?auto_412938 ?auto_412941 ) ) ( not ( = ?auto_412939 ?auto_412940 ) ) ( not ( = ?auto_412939 ?auto_412941 ) ) ( not ( = ?auto_412940 ?auto_412941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_412940 ?auto_412941 )
      ( !STACK ?auto_412940 ?auto_412939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_412947 - BLOCK
      ?auto_412948 - BLOCK
      ?auto_412949 - BLOCK
      ?auto_412950 - BLOCK
      ?auto_412951 - BLOCK
    )
    :vars
    (
      ?auto_412952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412951 ?auto_412952 ) ( ON-TABLE ?auto_412947 ) ( ON ?auto_412948 ?auto_412947 ) ( ON ?auto_412949 ?auto_412948 ) ( not ( = ?auto_412947 ?auto_412948 ) ) ( not ( = ?auto_412947 ?auto_412949 ) ) ( not ( = ?auto_412947 ?auto_412950 ) ) ( not ( = ?auto_412947 ?auto_412951 ) ) ( not ( = ?auto_412947 ?auto_412952 ) ) ( not ( = ?auto_412948 ?auto_412949 ) ) ( not ( = ?auto_412948 ?auto_412950 ) ) ( not ( = ?auto_412948 ?auto_412951 ) ) ( not ( = ?auto_412948 ?auto_412952 ) ) ( not ( = ?auto_412949 ?auto_412950 ) ) ( not ( = ?auto_412949 ?auto_412951 ) ) ( not ( = ?auto_412949 ?auto_412952 ) ) ( not ( = ?auto_412950 ?auto_412951 ) ) ( not ( = ?auto_412950 ?auto_412952 ) ) ( not ( = ?auto_412951 ?auto_412952 ) ) ( CLEAR ?auto_412949 ) ( ON ?auto_412950 ?auto_412951 ) ( CLEAR ?auto_412950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_412947 ?auto_412948 ?auto_412949 ?auto_412950 )
      ( MAKE-5PILE ?auto_412947 ?auto_412948 ?auto_412949 ?auto_412950 ?auto_412951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_412958 - BLOCK
      ?auto_412959 - BLOCK
      ?auto_412960 - BLOCK
      ?auto_412961 - BLOCK
      ?auto_412962 - BLOCK
    )
    :vars
    (
      ?auto_412963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412962 ?auto_412963 ) ( ON-TABLE ?auto_412958 ) ( ON ?auto_412959 ?auto_412958 ) ( ON ?auto_412960 ?auto_412959 ) ( not ( = ?auto_412958 ?auto_412959 ) ) ( not ( = ?auto_412958 ?auto_412960 ) ) ( not ( = ?auto_412958 ?auto_412961 ) ) ( not ( = ?auto_412958 ?auto_412962 ) ) ( not ( = ?auto_412958 ?auto_412963 ) ) ( not ( = ?auto_412959 ?auto_412960 ) ) ( not ( = ?auto_412959 ?auto_412961 ) ) ( not ( = ?auto_412959 ?auto_412962 ) ) ( not ( = ?auto_412959 ?auto_412963 ) ) ( not ( = ?auto_412960 ?auto_412961 ) ) ( not ( = ?auto_412960 ?auto_412962 ) ) ( not ( = ?auto_412960 ?auto_412963 ) ) ( not ( = ?auto_412961 ?auto_412962 ) ) ( not ( = ?auto_412961 ?auto_412963 ) ) ( not ( = ?auto_412962 ?auto_412963 ) ) ( CLEAR ?auto_412960 ) ( ON ?auto_412961 ?auto_412962 ) ( CLEAR ?auto_412961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_412958 ?auto_412959 ?auto_412960 ?auto_412961 )
      ( MAKE-5PILE ?auto_412958 ?auto_412959 ?auto_412960 ?auto_412961 ?auto_412962 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_412969 - BLOCK
      ?auto_412970 - BLOCK
      ?auto_412971 - BLOCK
      ?auto_412972 - BLOCK
      ?auto_412973 - BLOCK
    )
    :vars
    (
      ?auto_412974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412973 ?auto_412974 ) ( ON-TABLE ?auto_412969 ) ( ON ?auto_412970 ?auto_412969 ) ( not ( = ?auto_412969 ?auto_412970 ) ) ( not ( = ?auto_412969 ?auto_412971 ) ) ( not ( = ?auto_412969 ?auto_412972 ) ) ( not ( = ?auto_412969 ?auto_412973 ) ) ( not ( = ?auto_412969 ?auto_412974 ) ) ( not ( = ?auto_412970 ?auto_412971 ) ) ( not ( = ?auto_412970 ?auto_412972 ) ) ( not ( = ?auto_412970 ?auto_412973 ) ) ( not ( = ?auto_412970 ?auto_412974 ) ) ( not ( = ?auto_412971 ?auto_412972 ) ) ( not ( = ?auto_412971 ?auto_412973 ) ) ( not ( = ?auto_412971 ?auto_412974 ) ) ( not ( = ?auto_412972 ?auto_412973 ) ) ( not ( = ?auto_412972 ?auto_412974 ) ) ( not ( = ?auto_412973 ?auto_412974 ) ) ( ON ?auto_412972 ?auto_412973 ) ( CLEAR ?auto_412970 ) ( ON ?auto_412971 ?auto_412972 ) ( CLEAR ?auto_412971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_412969 ?auto_412970 ?auto_412971 )
      ( MAKE-5PILE ?auto_412969 ?auto_412970 ?auto_412971 ?auto_412972 ?auto_412973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_412980 - BLOCK
      ?auto_412981 - BLOCK
      ?auto_412982 - BLOCK
      ?auto_412983 - BLOCK
      ?auto_412984 - BLOCK
    )
    :vars
    (
      ?auto_412985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412984 ?auto_412985 ) ( ON-TABLE ?auto_412980 ) ( ON ?auto_412981 ?auto_412980 ) ( not ( = ?auto_412980 ?auto_412981 ) ) ( not ( = ?auto_412980 ?auto_412982 ) ) ( not ( = ?auto_412980 ?auto_412983 ) ) ( not ( = ?auto_412980 ?auto_412984 ) ) ( not ( = ?auto_412980 ?auto_412985 ) ) ( not ( = ?auto_412981 ?auto_412982 ) ) ( not ( = ?auto_412981 ?auto_412983 ) ) ( not ( = ?auto_412981 ?auto_412984 ) ) ( not ( = ?auto_412981 ?auto_412985 ) ) ( not ( = ?auto_412982 ?auto_412983 ) ) ( not ( = ?auto_412982 ?auto_412984 ) ) ( not ( = ?auto_412982 ?auto_412985 ) ) ( not ( = ?auto_412983 ?auto_412984 ) ) ( not ( = ?auto_412983 ?auto_412985 ) ) ( not ( = ?auto_412984 ?auto_412985 ) ) ( ON ?auto_412983 ?auto_412984 ) ( CLEAR ?auto_412981 ) ( ON ?auto_412982 ?auto_412983 ) ( CLEAR ?auto_412982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_412980 ?auto_412981 ?auto_412982 )
      ( MAKE-5PILE ?auto_412980 ?auto_412981 ?auto_412982 ?auto_412983 ?auto_412984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_412991 - BLOCK
      ?auto_412992 - BLOCK
      ?auto_412993 - BLOCK
      ?auto_412994 - BLOCK
      ?auto_412995 - BLOCK
    )
    :vars
    (
      ?auto_412996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412995 ?auto_412996 ) ( ON-TABLE ?auto_412991 ) ( not ( = ?auto_412991 ?auto_412992 ) ) ( not ( = ?auto_412991 ?auto_412993 ) ) ( not ( = ?auto_412991 ?auto_412994 ) ) ( not ( = ?auto_412991 ?auto_412995 ) ) ( not ( = ?auto_412991 ?auto_412996 ) ) ( not ( = ?auto_412992 ?auto_412993 ) ) ( not ( = ?auto_412992 ?auto_412994 ) ) ( not ( = ?auto_412992 ?auto_412995 ) ) ( not ( = ?auto_412992 ?auto_412996 ) ) ( not ( = ?auto_412993 ?auto_412994 ) ) ( not ( = ?auto_412993 ?auto_412995 ) ) ( not ( = ?auto_412993 ?auto_412996 ) ) ( not ( = ?auto_412994 ?auto_412995 ) ) ( not ( = ?auto_412994 ?auto_412996 ) ) ( not ( = ?auto_412995 ?auto_412996 ) ) ( ON ?auto_412994 ?auto_412995 ) ( ON ?auto_412993 ?auto_412994 ) ( CLEAR ?auto_412991 ) ( ON ?auto_412992 ?auto_412993 ) ( CLEAR ?auto_412992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_412991 ?auto_412992 )
      ( MAKE-5PILE ?auto_412991 ?auto_412992 ?auto_412993 ?auto_412994 ?auto_412995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_413002 - BLOCK
      ?auto_413003 - BLOCK
      ?auto_413004 - BLOCK
      ?auto_413005 - BLOCK
      ?auto_413006 - BLOCK
    )
    :vars
    (
      ?auto_413007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413006 ?auto_413007 ) ( ON-TABLE ?auto_413002 ) ( not ( = ?auto_413002 ?auto_413003 ) ) ( not ( = ?auto_413002 ?auto_413004 ) ) ( not ( = ?auto_413002 ?auto_413005 ) ) ( not ( = ?auto_413002 ?auto_413006 ) ) ( not ( = ?auto_413002 ?auto_413007 ) ) ( not ( = ?auto_413003 ?auto_413004 ) ) ( not ( = ?auto_413003 ?auto_413005 ) ) ( not ( = ?auto_413003 ?auto_413006 ) ) ( not ( = ?auto_413003 ?auto_413007 ) ) ( not ( = ?auto_413004 ?auto_413005 ) ) ( not ( = ?auto_413004 ?auto_413006 ) ) ( not ( = ?auto_413004 ?auto_413007 ) ) ( not ( = ?auto_413005 ?auto_413006 ) ) ( not ( = ?auto_413005 ?auto_413007 ) ) ( not ( = ?auto_413006 ?auto_413007 ) ) ( ON ?auto_413005 ?auto_413006 ) ( ON ?auto_413004 ?auto_413005 ) ( CLEAR ?auto_413002 ) ( ON ?auto_413003 ?auto_413004 ) ( CLEAR ?auto_413003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413002 ?auto_413003 )
      ( MAKE-5PILE ?auto_413002 ?auto_413003 ?auto_413004 ?auto_413005 ?auto_413006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_413013 - BLOCK
      ?auto_413014 - BLOCK
      ?auto_413015 - BLOCK
      ?auto_413016 - BLOCK
      ?auto_413017 - BLOCK
    )
    :vars
    (
      ?auto_413018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413017 ?auto_413018 ) ( not ( = ?auto_413013 ?auto_413014 ) ) ( not ( = ?auto_413013 ?auto_413015 ) ) ( not ( = ?auto_413013 ?auto_413016 ) ) ( not ( = ?auto_413013 ?auto_413017 ) ) ( not ( = ?auto_413013 ?auto_413018 ) ) ( not ( = ?auto_413014 ?auto_413015 ) ) ( not ( = ?auto_413014 ?auto_413016 ) ) ( not ( = ?auto_413014 ?auto_413017 ) ) ( not ( = ?auto_413014 ?auto_413018 ) ) ( not ( = ?auto_413015 ?auto_413016 ) ) ( not ( = ?auto_413015 ?auto_413017 ) ) ( not ( = ?auto_413015 ?auto_413018 ) ) ( not ( = ?auto_413016 ?auto_413017 ) ) ( not ( = ?auto_413016 ?auto_413018 ) ) ( not ( = ?auto_413017 ?auto_413018 ) ) ( ON ?auto_413016 ?auto_413017 ) ( ON ?auto_413015 ?auto_413016 ) ( ON ?auto_413014 ?auto_413015 ) ( ON ?auto_413013 ?auto_413014 ) ( CLEAR ?auto_413013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413013 )
      ( MAKE-5PILE ?auto_413013 ?auto_413014 ?auto_413015 ?auto_413016 ?auto_413017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_413024 - BLOCK
      ?auto_413025 - BLOCK
      ?auto_413026 - BLOCK
      ?auto_413027 - BLOCK
      ?auto_413028 - BLOCK
    )
    :vars
    (
      ?auto_413029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413028 ?auto_413029 ) ( not ( = ?auto_413024 ?auto_413025 ) ) ( not ( = ?auto_413024 ?auto_413026 ) ) ( not ( = ?auto_413024 ?auto_413027 ) ) ( not ( = ?auto_413024 ?auto_413028 ) ) ( not ( = ?auto_413024 ?auto_413029 ) ) ( not ( = ?auto_413025 ?auto_413026 ) ) ( not ( = ?auto_413025 ?auto_413027 ) ) ( not ( = ?auto_413025 ?auto_413028 ) ) ( not ( = ?auto_413025 ?auto_413029 ) ) ( not ( = ?auto_413026 ?auto_413027 ) ) ( not ( = ?auto_413026 ?auto_413028 ) ) ( not ( = ?auto_413026 ?auto_413029 ) ) ( not ( = ?auto_413027 ?auto_413028 ) ) ( not ( = ?auto_413027 ?auto_413029 ) ) ( not ( = ?auto_413028 ?auto_413029 ) ) ( ON ?auto_413027 ?auto_413028 ) ( ON ?auto_413026 ?auto_413027 ) ( ON ?auto_413025 ?auto_413026 ) ( ON ?auto_413024 ?auto_413025 ) ( CLEAR ?auto_413024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413024 )
      ( MAKE-5PILE ?auto_413024 ?auto_413025 ?auto_413026 ?auto_413027 ?auto_413028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413036 - BLOCK
      ?auto_413037 - BLOCK
      ?auto_413038 - BLOCK
      ?auto_413039 - BLOCK
      ?auto_413040 - BLOCK
      ?auto_413041 - BLOCK
    )
    :vars
    (
      ?auto_413042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413040 ) ( ON ?auto_413041 ?auto_413042 ) ( CLEAR ?auto_413041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413036 ) ( ON ?auto_413037 ?auto_413036 ) ( ON ?auto_413038 ?auto_413037 ) ( ON ?auto_413039 ?auto_413038 ) ( ON ?auto_413040 ?auto_413039 ) ( not ( = ?auto_413036 ?auto_413037 ) ) ( not ( = ?auto_413036 ?auto_413038 ) ) ( not ( = ?auto_413036 ?auto_413039 ) ) ( not ( = ?auto_413036 ?auto_413040 ) ) ( not ( = ?auto_413036 ?auto_413041 ) ) ( not ( = ?auto_413036 ?auto_413042 ) ) ( not ( = ?auto_413037 ?auto_413038 ) ) ( not ( = ?auto_413037 ?auto_413039 ) ) ( not ( = ?auto_413037 ?auto_413040 ) ) ( not ( = ?auto_413037 ?auto_413041 ) ) ( not ( = ?auto_413037 ?auto_413042 ) ) ( not ( = ?auto_413038 ?auto_413039 ) ) ( not ( = ?auto_413038 ?auto_413040 ) ) ( not ( = ?auto_413038 ?auto_413041 ) ) ( not ( = ?auto_413038 ?auto_413042 ) ) ( not ( = ?auto_413039 ?auto_413040 ) ) ( not ( = ?auto_413039 ?auto_413041 ) ) ( not ( = ?auto_413039 ?auto_413042 ) ) ( not ( = ?auto_413040 ?auto_413041 ) ) ( not ( = ?auto_413040 ?auto_413042 ) ) ( not ( = ?auto_413041 ?auto_413042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413041 ?auto_413042 )
      ( !STACK ?auto_413041 ?auto_413040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413049 - BLOCK
      ?auto_413050 - BLOCK
      ?auto_413051 - BLOCK
      ?auto_413052 - BLOCK
      ?auto_413053 - BLOCK
      ?auto_413054 - BLOCK
    )
    :vars
    (
      ?auto_413055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413053 ) ( ON ?auto_413054 ?auto_413055 ) ( CLEAR ?auto_413054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413049 ) ( ON ?auto_413050 ?auto_413049 ) ( ON ?auto_413051 ?auto_413050 ) ( ON ?auto_413052 ?auto_413051 ) ( ON ?auto_413053 ?auto_413052 ) ( not ( = ?auto_413049 ?auto_413050 ) ) ( not ( = ?auto_413049 ?auto_413051 ) ) ( not ( = ?auto_413049 ?auto_413052 ) ) ( not ( = ?auto_413049 ?auto_413053 ) ) ( not ( = ?auto_413049 ?auto_413054 ) ) ( not ( = ?auto_413049 ?auto_413055 ) ) ( not ( = ?auto_413050 ?auto_413051 ) ) ( not ( = ?auto_413050 ?auto_413052 ) ) ( not ( = ?auto_413050 ?auto_413053 ) ) ( not ( = ?auto_413050 ?auto_413054 ) ) ( not ( = ?auto_413050 ?auto_413055 ) ) ( not ( = ?auto_413051 ?auto_413052 ) ) ( not ( = ?auto_413051 ?auto_413053 ) ) ( not ( = ?auto_413051 ?auto_413054 ) ) ( not ( = ?auto_413051 ?auto_413055 ) ) ( not ( = ?auto_413052 ?auto_413053 ) ) ( not ( = ?auto_413052 ?auto_413054 ) ) ( not ( = ?auto_413052 ?auto_413055 ) ) ( not ( = ?auto_413053 ?auto_413054 ) ) ( not ( = ?auto_413053 ?auto_413055 ) ) ( not ( = ?auto_413054 ?auto_413055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413054 ?auto_413055 )
      ( !STACK ?auto_413054 ?auto_413053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413062 - BLOCK
      ?auto_413063 - BLOCK
      ?auto_413064 - BLOCK
      ?auto_413065 - BLOCK
      ?auto_413066 - BLOCK
      ?auto_413067 - BLOCK
    )
    :vars
    (
      ?auto_413068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413067 ?auto_413068 ) ( ON-TABLE ?auto_413062 ) ( ON ?auto_413063 ?auto_413062 ) ( ON ?auto_413064 ?auto_413063 ) ( ON ?auto_413065 ?auto_413064 ) ( not ( = ?auto_413062 ?auto_413063 ) ) ( not ( = ?auto_413062 ?auto_413064 ) ) ( not ( = ?auto_413062 ?auto_413065 ) ) ( not ( = ?auto_413062 ?auto_413066 ) ) ( not ( = ?auto_413062 ?auto_413067 ) ) ( not ( = ?auto_413062 ?auto_413068 ) ) ( not ( = ?auto_413063 ?auto_413064 ) ) ( not ( = ?auto_413063 ?auto_413065 ) ) ( not ( = ?auto_413063 ?auto_413066 ) ) ( not ( = ?auto_413063 ?auto_413067 ) ) ( not ( = ?auto_413063 ?auto_413068 ) ) ( not ( = ?auto_413064 ?auto_413065 ) ) ( not ( = ?auto_413064 ?auto_413066 ) ) ( not ( = ?auto_413064 ?auto_413067 ) ) ( not ( = ?auto_413064 ?auto_413068 ) ) ( not ( = ?auto_413065 ?auto_413066 ) ) ( not ( = ?auto_413065 ?auto_413067 ) ) ( not ( = ?auto_413065 ?auto_413068 ) ) ( not ( = ?auto_413066 ?auto_413067 ) ) ( not ( = ?auto_413066 ?auto_413068 ) ) ( not ( = ?auto_413067 ?auto_413068 ) ) ( CLEAR ?auto_413065 ) ( ON ?auto_413066 ?auto_413067 ) ( CLEAR ?auto_413066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413062 ?auto_413063 ?auto_413064 ?auto_413065 ?auto_413066 )
      ( MAKE-6PILE ?auto_413062 ?auto_413063 ?auto_413064 ?auto_413065 ?auto_413066 ?auto_413067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413075 - BLOCK
      ?auto_413076 - BLOCK
      ?auto_413077 - BLOCK
      ?auto_413078 - BLOCK
      ?auto_413079 - BLOCK
      ?auto_413080 - BLOCK
    )
    :vars
    (
      ?auto_413081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413080 ?auto_413081 ) ( ON-TABLE ?auto_413075 ) ( ON ?auto_413076 ?auto_413075 ) ( ON ?auto_413077 ?auto_413076 ) ( ON ?auto_413078 ?auto_413077 ) ( not ( = ?auto_413075 ?auto_413076 ) ) ( not ( = ?auto_413075 ?auto_413077 ) ) ( not ( = ?auto_413075 ?auto_413078 ) ) ( not ( = ?auto_413075 ?auto_413079 ) ) ( not ( = ?auto_413075 ?auto_413080 ) ) ( not ( = ?auto_413075 ?auto_413081 ) ) ( not ( = ?auto_413076 ?auto_413077 ) ) ( not ( = ?auto_413076 ?auto_413078 ) ) ( not ( = ?auto_413076 ?auto_413079 ) ) ( not ( = ?auto_413076 ?auto_413080 ) ) ( not ( = ?auto_413076 ?auto_413081 ) ) ( not ( = ?auto_413077 ?auto_413078 ) ) ( not ( = ?auto_413077 ?auto_413079 ) ) ( not ( = ?auto_413077 ?auto_413080 ) ) ( not ( = ?auto_413077 ?auto_413081 ) ) ( not ( = ?auto_413078 ?auto_413079 ) ) ( not ( = ?auto_413078 ?auto_413080 ) ) ( not ( = ?auto_413078 ?auto_413081 ) ) ( not ( = ?auto_413079 ?auto_413080 ) ) ( not ( = ?auto_413079 ?auto_413081 ) ) ( not ( = ?auto_413080 ?auto_413081 ) ) ( CLEAR ?auto_413078 ) ( ON ?auto_413079 ?auto_413080 ) ( CLEAR ?auto_413079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413075 ?auto_413076 ?auto_413077 ?auto_413078 ?auto_413079 )
      ( MAKE-6PILE ?auto_413075 ?auto_413076 ?auto_413077 ?auto_413078 ?auto_413079 ?auto_413080 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413088 - BLOCK
      ?auto_413089 - BLOCK
      ?auto_413090 - BLOCK
      ?auto_413091 - BLOCK
      ?auto_413092 - BLOCK
      ?auto_413093 - BLOCK
    )
    :vars
    (
      ?auto_413094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413093 ?auto_413094 ) ( ON-TABLE ?auto_413088 ) ( ON ?auto_413089 ?auto_413088 ) ( ON ?auto_413090 ?auto_413089 ) ( not ( = ?auto_413088 ?auto_413089 ) ) ( not ( = ?auto_413088 ?auto_413090 ) ) ( not ( = ?auto_413088 ?auto_413091 ) ) ( not ( = ?auto_413088 ?auto_413092 ) ) ( not ( = ?auto_413088 ?auto_413093 ) ) ( not ( = ?auto_413088 ?auto_413094 ) ) ( not ( = ?auto_413089 ?auto_413090 ) ) ( not ( = ?auto_413089 ?auto_413091 ) ) ( not ( = ?auto_413089 ?auto_413092 ) ) ( not ( = ?auto_413089 ?auto_413093 ) ) ( not ( = ?auto_413089 ?auto_413094 ) ) ( not ( = ?auto_413090 ?auto_413091 ) ) ( not ( = ?auto_413090 ?auto_413092 ) ) ( not ( = ?auto_413090 ?auto_413093 ) ) ( not ( = ?auto_413090 ?auto_413094 ) ) ( not ( = ?auto_413091 ?auto_413092 ) ) ( not ( = ?auto_413091 ?auto_413093 ) ) ( not ( = ?auto_413091 ?auto_413094 ) ) ( not ( = ?auto_413092 ?auto_413093 ) ) ( not ( = ?auto_413092 ?auto_413094 ) ) ( not ( = ?auto_413093 ?auto_413094 ) ) ( ON ?auto_413092 ?auto_413093 ) ( CLEAR ?auto_413090 ) ( ON ?auto_413091 ?auto_413092 ) ( CLEAR ?auto_413091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413088 ?auto_413089 ?auto_413090 ?auto_413091 )
      ( MAKE-6PILE ?auto_413088 ?auto_413089 ?auto_413090 ?auto_413091 ?auto_413092 ?auto_413093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413101 - BLOCK
      ?auto_413102 - BLOCK
      ?auto_413103 - BLOCK
      ?auto_413104 - BLOCK
      ?auto_413105 - BLOCK
      ?auto_413106 - BLOCK
    )
    :vars
    (
      ?auto_413107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413106 ?auto_413107 ) ( ON-TABLE ?auto_413101 ) ( ON ?auto_413102 ?auto_413101 ) ( ON ?auto_413103 ?auto_413102 ) ( not ( = ?auto_413101 ?auto_413102 ) ) ( not ( = ?auto_413101 ?auto_413103 ) ) ( not ( = ?auto_413101 ?auto_413104 ) ) ( not ( = ?auto_413101 ?auto_413105 ) ) ( not ( = ?auto_413101 ?auto_413106 ) ) ( not ( = ?auto_413101 ?auto_413107 ) ) ( not ( = ?auto_413102 ?auto_413103 ) ) ( not ( = ?auto_413102 ?auto_413104 ) ) ( not ( = ?auto_413102 ?auto_413105 ) ) ( not ( = ?auto_413102 ?auto_413106 ) ) ( not ( = ?auto_413102 ?auto_413107 ) ) ( not ( = ?auto_413103 ?auto_413104 ) ) ( not ( = ?auto_413103 ?auto_413105 ) ) ( not ( = ?auto_413103 ?auto_413106 ) ) ( not ( = ?auto_413103 ?auto_413107 ) ) ( not ( = ?auto_413104 ?auto_413105 ) ) ( not ( = ?auto_413104 ?auto_413106 ) ) ( not ( = ?auto_413104 ?auto_413107 ) ) ( not ( = ?auto_413105 ?auto_413106 ) ) ( not ( = ?auto_413105 ?auto_413107 ) ) ( not ( = ?auto_413106 ?auto_413107 ) ) ( ON ?auto_413105 ?auto_413106 ) ( CLEAR ?auto_413103 ) ( ON ?auto_413104 ?auto_413105 ) ( CLEAR ?auto_413104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413101 ?auto_413102 ?auto_413103 ?auto_413104 )
      ( MAKE-6PILE ?auto_413101 ?auto_413102 ?auto_413103 ?auto_413104 ?auto_413105 ?auto_413106 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413114 - BLOCK
      ?auto_413115 - BLOCK
      ?auto_413116 - BLOCK
      ?auto_413117 - BLOCK
      ?auto_413118 - BLOCK
      ?auto_413119 - BLOCK
    )
    :vars
    (
      ?auto_413120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413119 ?auto_413120 ) ( ON-TABLE ?auto_413114 ) ( ON ?auto_413115 ?auto_413114 ) ( not ( = ?auto_413114 ?auto_413115 ) ) ( not ( = ?auto_413114 ?auto_413116 ) ) ( not ( = ?auto_413114 ?auto_413117 ) ) ( not ( = ?auto_413114 ?auto_413118 ) ) ( not ( = ?auto_413114 ?auto_413119 ) ) ( not ( = ?auto_413114 ?auto_413120 ) ) ( not ( = ?auto_413115 ?auto_413116 ) ) ( not ( = ?auto_413115 ?auto_413117 ) ) ( not ( = ?auto_413115 ?auto_413118 ) ) ( not ( = ?auto_413115 ?auto_413119 ) ) ( not ( = ?auto_413115 ?auto_413120 ) ) ( not ( = ?auto_413116 ?auto_413117 ) ) ( not ( = ?auto_413116 ?auto_413118 ) ) ( not ( = ?auto_413116 ?auto_413119 ) ) ( not ( = ?auto_413116 ?auto_413120 ) ) ( not ( = ?auto_413117 ?auto_413118 ) ) ( not ( = ?auto_413117 ?auto_413119 ) ) ( not ( = ?auto_413117 ?auto_413120 ) ) ( not ( = ?auto_413118 ?auto_413119 ) ) ( not ( = ?auto_413118 ?auto_413120 ) ) ( not ( = ?auto_413119 ?auto_413120 ) ) ( ON ?auto_413118 ?auto_413119 ) ( ON ?auto_413117 ?auto_413118 ) ( CLEAR ?auto_413115 ) ( ON ?auto_413116 ?auto_413117 ) ( CLEAR ?auto_413116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413114 ?auto_413115 ?auto_413116 )
      ( MAKE-6PILE ?auto_413114 ?auto_413115 ?auto_413116 ?auto_413117 ?auto_413118 ?auto_413119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413127 - BLOCK
      ?auto_413128 - BLOCK
      ?auto_413129 - BLOCK
      ?auto_413130 - BLOCK
      ?auto_413131 - BLOCK
      ?auto_413132 - BLOCK
    )
    :vars
    (
      ?auto_413133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413132 ?auto_413133 ) ( ON-TABLE ?auto_413127 ) ( ON ?auto_413128 ?auto_413127 ) ( not ( = ?auto_413127 ?auto_413128 ) ) ( not ( = ?auto_413127 ?auto_413129 ) ) ( not ( = ?auto_413127 ?auto_413130 ) ) ( not ( = ?auto_413127 ?auto_413131 ) ) ( not ( = ?auto_413127 ?auto_413132 ) ) ( not ( = ?auto_413127 ?auto_413133 ) ) ( not ( = ?auto_413128 ?auto_413129 ) ) ( not ( = ?auto_413128 ?auto_413130 ) ) ( not ( = ?auto_413128 ?auto_413131 ) ) ( not ( = ?auto_413128 ?auto_413132 ) ) ( not ( = ?auto_413128 ?auto_413133 ) ) ( not ( = ?auto_413129 ?auto_413130 ) ) ( not ( = ?auto_413129 ?auto_413131 ) ) ( not ( = ?auto_413129 ?auto_413132 ) ) ( not ( = ?auto_413129 ?auto_413133 ) ) ( not ( = ?auto_413130 ?auto_413131 ) ) ( not ( = ?auto_413130 ?auto_413132 ) ) ( not ( = ?auto_413130 ?auto_413133 ) ) ( not ( = ?auto_413131 ?auto_413132 ) ) ( not ( = ?auto_413131 ?auto_413133 ) ) ( not ( = ?auto_413132 ?auto_413133 ) ) ( ON ?auto_413131 ?auto_413132 ) ( ON ?auto_413130 ?auto_413131 ) ( CLEAR ?auto_413128 ) ( ON ?auto_413129 ?auto_413130 ) ( CLEAR ?auto_413129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413127 ?auto_413128 ?auto_413129 )
      ( MAKE-6PILE ?auto_413127 ?auto_413128 ?auto_413129 ?auto_413130 ?auto_413131 ?auto_413132 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413140 - BLOCK
      ?auto_413141 - BLOCK
      ?auto_413142 - BLOCK
      ?auto_413143 - BLOCK
      ?auto_413144 - BLOCK
      ?auto_413145 - BLOCK
    )
    :vars
    (
      ?auto_413146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413145 ?auto_413146 ) ( ON-TABLE ?auto_413140 ) ( not ( = ?auto_413140 ?auto_413141 ) ) ( not ( = ?auto_413140 ?auto_413142 ) ) ( not ( = ?auto_413140 ?auto_413143 ) ) ( not ( = ?auto_413140 ?auto_413144 ) ) ( not ( = ?auto_413140 ?auto_413145 ) ) ( not ( = ?auto_413140 ?auto_413146 ) ) ( not ( = ?auto_413141 ?auto_413142 ) ) ( not ( = ?auto_413141 ?auto_413143 ) ) ( not ( = ?auto_413141 ?auto_413144 ) ) ( not ( = ?auto_413141 ?auto_413145 ) ) ( not ( = ?auto_413141 ?auto_413146 ) ) ( not ( = ?auto_413142 ?auto_413143 ) ) ( not ( = ?auto_413142 ?auto_413144 ) ) ( not ( = ?auto_413142 ?auto_413145 ) ) ( not ( = ?auto_413142 ?auto_413146 ) ) ( not ( = ?auto_413143 ?auto_413144 ) ) ( not ( = ?auto_413143 ?auto_413145 ) ) ( not ( = ?auto_413143 ?auto_413146 ) ) ( not ( = ?auto_413144 ?auto_413145 ) ) ( not ( = ?auto_413144 ?auto_413146 ) ) ( not ( = ?auto_413145 ?auto_413146 ) ) ( ON ?auto_413144 ?auto_413145 ) ( ON ?auto_413143 ?auto_413144 ) ( ON ?auto_413142 ?auto_413143 ) ( CLEAR ?auto_413140 ) ( ON ?auto_413141 ?auto_413142 ) ( CLEAR ?auto_413141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413140 ?auto_413141 )
      ( MAKE-6PILE ?auto_413140 ?auto_413141 ?auto_413142 ?auto_413143 ?auto_413144 ?auto_413145 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413153 - BLOCK
      ?auto_413154 - BLOCK
      ?auto_413155 - BLOCK
      ?auto_413156 - BLOCK
      ?auto_413157 - BLOCK
      ?auto_413158 - BLOCK
    )
    :vars
    (
      ?auto_413159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413158 ?auto_413159 ) ( ON-TABLE ?auto_413153 ) ( not ( = ?auto_413153 ?auto_413154 ) ) ( not ( = ?auto_413153 ?auto_413155 ) ) ( not ( = ?auto_413153 ?auto_413156 ) ) ( not ( = ?auto_413153 ?auto_413157 ) ) ( not ( = ?auto_413153 ?auto_413158 ) ) ( not ( = ?auto_413153 ?auto_413159 ) ) ( not ( = ?auto_413154 ?auto_413155 ) ) ( not ( = ?auto_413154 ?auto_413156 ) ) ( not ( = ?auto_413154 ?auto_413157 ) ) ( not ( = ?auto_413154 ?auto_413158 ) ) ( not ( = ?auto_413154 ?auto_413159 ) ) ( not ( = ?auto_413155 ?auto_413156 ) ) ( not ( = ?auto_413155 ?auto_413157 ) ) ( not ( = ?auto_413155 ?auto_413158 ) ) ( not ( = ?auto_413155 ?auto_413159 ) ) ( not ( = ?auto_413156 ?auto_413157 ) ) ( not ( = ?auto_413156 ?auto_413158 ) ) ( not ( = ?auto_413156 ?auto_413159 ) ) ( not ( = ?auto_413157 ?auto_413158 ) ) ( not ( = ?auto_413157 ?auto_413159 ) ) ( not ( = ?auto_413158 ?auto_413159 ) ) ( ON ?auto_413157 ?auto_413158 ) ( ON ?auto_413156 ?auto_413157 ) ( ON ?auto_413155 ?auto_413156 ) ( CLEAR ?auto_413153 ) ( ON ?auto_413154 ?auto_413155 ) ( CLEAR ?auto_413154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413153 ?auto_413154 )
      ( MAKE-6PILE ?auto_413153 ?auto_413154 ?auto_413155 ?auto_413156 ?auto_413157 ?auto_413158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413166 - BLOCK
      ?auto_413167 - BLOCK
      ?auto_413168 - BLOCK
      ?auto_413169 - BLOCK
      ?auto_413170 - BLOCK
      ?auto_413171 - BLOCK
    )
    :vars
    (
      ?auto_413172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413171 ?auto_413172 ) ( not ( = ?auto_413166 ?auto_413167 ) ) ( not ( = ?auto_413166 ?auto_413168 ) ) ( not ( = ?auto_413166 ?auto_413169 ) ) ( not ( = ?auto_413166 ?auto_413170 ) ) ( not ( = ?auto_413166 ?auto_413171 ) ) ( not ( = ?auto_413166 ?auto_413172 ) ) ( not ( = ?auto_413167 ?auto_413168 ) ) ( not ( = ?auto_413167 ?auto_413169 ) ) ( not ( = ?auto_413167 ?auto_413170 ) ) ( not ( = ?auto_413167 ?auto_413171 ) ) ( not ( = ?auto_413167 ?auto_413172 ) ) ( not ( = ?auto_413168 ?auto_413169 ) ) ( not ( = ?auto_413168 ?auto_413170 ) ) ( not ( = ?auto_413168 ?auto_413171 ) ) ( not ( = ?auto_413168 ?auto_413172 ) ) ( not ( = ?auto_413169 ?auto_413170 ) ) ( not ( = ?auto_413169 ?auto_413171 ) ) ( not ( = ?auto_413169 ?auto_413172 ) ) ( not ( = ?auto_413170 ?auto_413171 ) ) ( not ( = ?auto_413170 ?auto_413172 ) ) ( not ( = ?auto_413171 ?auto_413172 ) ) ( ON ?auto_413170 ?auto_413171 ) ( ON ?auto_413169 ?auto_413170 ) ( ON ?auto_413168 ?auto_413169 ) ( ON ?auto_413167 ?auto_413168 ) ( ON ?auto_413166 ?auto_413167 ) ( CLEAR ?auto_413166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413166 )
      ( MAKE-6PILE ?auto_413166 ?auto_413167 ?auto_413168 ?auto_413169 ?auto_413170 ?auto_413171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_413179 - BLOCK
      ?auto_413180 - BLOCK
      ?auto_413181 - BLOCK
      ?auto_413182 - BLOCK
      ?auto_413183 - BLOCK
      ?auto_413184 - BLOCK
    )
    :vars
    (
      ?auto_413185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413184 ?auto_413185 ) ( not ( = ?auto_413179 ?auto_413180 ) ) ( not ( = ?auto_413179 ?auto_413181 ) ) ( not ( = ?auto_413179 ?auto_413182 ) ) ( not ( = ?auto_413179 ?auto_413183 ) ) ( not ( = ?auto_413179 ?auto_413184 ) ) ( not ( = ?auto_413179 ?auto_413185 ) ) ( not ( = ?auto_413180 ?auto_413181 ) ) ( not ( = ?auto_413180 ?auto_413182 ) ) ( not ( = ?auto_413180 ?auto_413183 ) ) ( not ( = ?auto_413180 ?auto_413184 ) ) ( not ( = ?auto_413180 ?auto_413185 ) ) ( not ( = ?auto_413181 ?auto_413182 ) ) ( not ( = ?auto_413181 ?auto_413183 ) ) ( not ( = ?auto_413181 ?auto_413184 ) ) ( not ( = ?auto_413181 ?auto_413185 ) ) ( not ( = ?auto_413182 ?auto_413183 ) ) ( not ( = ?auto_413182 ?auto_413184 ) ) ( not ( = ?auto_413182 ?auto_413185 ) ) ( not ( = ?auto_413183 ?auto_413184 ) ) ( not ( = ?auto_413183 ?auto_413185 ) ) ( not ( = ?auto_413184 ?auto_413185 ) ) ( ON ?auto_413183 ?auto_413184 ) ( ON ?auto_413182 ?auto_413183 ) ( ON ?auto_413181 ?auto_413182 ) ( ON ?auto_413180 ?auto_413181 ) ( ON ?auto_413179 ?auto_413180 ) ( CLEAR ?auto_413179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413179 )
      ( MAKE-6PILE ?auto_413179 ?auto_413180 ?auto_413181 ?auto_413182 ?auto_413183 ?auto_413184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413193 - BLOCK
      ?auto_413194 - BLOCK
      ?auto_413195 - BLOCK
      ?auto_413196 - BLOCK
      ?auto_413197 - BLOCK
      ?auto_413198 - BLOCK
      ?auto_413199 - BLOCK
    )
    :vars
    (
      ?auto_413200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413198 ) ( ON ?auto_413199 ?auto_413200 ) ( CLEAR ?auto_413199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413193 ) ( ON ?auto_413194 ?auto_413193 ) ( ON ?auto_413195 ?auto_413194 ) ( ON ?auto_413196 ?auto_413195 ) ( ON ?auto_413197 ?auto_413196 ) ( ON ?auto_413198 ?auto_413197 ) ( not ( = ?auto_413193 ?auto_413194 ) ) ( not ( = ?auto_413193 ?auto_413195 ) ) ( not ( = ?auto_413193 ?auto_413196 ) ) ( not ( = ?auto_413193 ?auto_413197 ) ) ( not ( = ?auto_413193 ?auto_413198 ) ) ( not ( = ?auto_413193 ?auto_413199 ) ) ( not ( = ?auto_413193 ?auto_413200 ) ) ( not ( = ?auto_413194 ?auto_413195 ) ) ( not ( = ?auto_413194 ?auto_413196 ) ) ( not ( = ?auto_413194 ?auto_413197 ) ) ( not ( = ?auto_413194 ?auto_413198 ) ) ( not ( = ?auto_413194 ?auto_413199 ) ) ( not ( = ?auto_413194 ?auto_413200 ) ) ( not ( = ?auto_413195 ?auto_413196 ) ) ( not ( = ?auto_413195 ?auto_413197 ) ) ( not ( = ?auto_413195 ?auto_413198 ) ) ( not ( = ?auto_413195 ?auto_413199 ) ) ( not ( = ?auto_413195 ?auto_413200 ) ) ( not ( = ?auto_413196 ?auto_413197 ) ) ( not ( = ?auto_413196 ?auto_413198 ) ) ( not ( = ?auto_413196 ?auto_413199 ) ) ( not ( = ?auto_413196 ?auto_413200 ) ) ( not ( = ?auto_413197 ?auto_413198 ) ) ( not ( = ?auto_413197 ?auto_413199 ) ) ( not ( = ?auto_413197 ?auto_413200 ) ) ( not ( = ?auto_413198 ?auto_413199 ) ) ( not ( = ?auto_413198 ?auto_413200 ) ) ( not ( = ?auto_413199 ?auto_413200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413199 ?auto_413200 )
      ( !STACK ?auto_413199 ?auto_413198 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413208 - BLOCK
      ?auto_413209 - BLOCK
      ?auto_413210 - BLOCK
      ?auto_413211 - BLOCK
      ?auto_413212 - BLOCK
      ?auto_413213 - BLOCK
      ?auto_413214 - BLOCK
    )
    :vars
    (
      ?auto_413215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413213 ) ( ON ?auto_413214 ?auto_413215 ) ( CLEAR ?auto_413214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413208 ) ( ON ?auto_413209 ?auto_413208 ) ( ON ?auto_413210 ?auto_413209 ) ( ON ?auto_413211 ?auto_413210 ) ( ON ?auto_413212 ?auto_413211 ) ( ON ?auto_413213 ?auto_413212 ) ( not ( = ?auto_413208 ?auto_413209 ) ) ( not ( = ?auto_413208 ?auto_413210 ) ) ( not ( = ?auto_413208 ?auto_413211 ) ) ( not ( = ?auto_413208 ?auto_413212 ) ) ( not ( = ?auto_413208 ?auto_413213 ) ) ( not ( = ?auto_413208 ?auto_413214 ) ) ( not ( = ?auto_413208 ?auto_413215 ) ) ( not ( = ?auto_413209 ?auto_413210 ) ) ( not ( = ?auto_413209 ?auto_413211 ) ) ( not ( = ?auto_413209 ?auto_413212 ) ) ( not ( = ?auto_413209 ?auto_413213 ) ) ( not ( = ?auto_413209 ?auto_413214 ) ) ( not ( = ?auto_413209 ?auto_413215 ) ) ( not ( = ?auto_413210 ?auto_413211 ) ) ( not ( = ?auto_413210 ?auto_413212 ) ) ( not ( = ?auto_413210 ?auto_413213 ) ) ( not ( = ?auto_413210 ?auto_413214 ) ) ( not ( = ?auto_413210 ?auto_413215 ) ) ( not ( = ?auto_413211 ?auto_413212 ) ) ( not ( = ?auto_413211 ?auto_413213 ) ) ( not ( = ?auto_413211 ?auto_413214 ) ) ( not ( = ?auto_413211 ?auto_413215 ) ) ( not ( = ?auto_413212 ?auto_413213 ) ) ( not ( = ?auto_413212 ?auto_413214 ) ) ( not ( = ?auto_413212 ?auto_413215 ) ) ( not ( = ?auto_413213 ?auto_413214 ) ) ( not ( = ?auto_413213 ?auto_413215 ) ) ( not ( = ?auto_413214 ?auto_413215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413214 ?auto_413215 )
      ( !STACK ?auto_413214 ?auto_413213 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413223 - BLOCK
      ?auto_413224 - BLOCK
      ?auto_413225 - BLOCK
      ?auto_413226 - BLOCK
      ?auto_413227 - BLOCK
      ?auto_413228 - BLOCK
      ?auto_413229 - BLOCK
    )
    :vars
    (
      ?auto_413230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413229 ?auto_413230 ) ( ON-TABLE ?auto_413223 ) ( ON ?auto_413224 ?auto_413223 ) ( ON ?auto_413225 ?auto_413224 ) ( ON ?auto_413226 ?auto_413225 ) ( ON ?auto_413227 ?auto_413226 ) ( not ( = ?auto_413223 ?auto_413224 ) ) ( not ( = ?auto_413223 ?auto_413225 ) ) ( not ( = ?auto_413223 ?auto_413226 ) ) ( not ( = ?auto_413223 ?auto_413227 ) ) ( not ( = ?auto_413223 ?auto_413228 ) ) ( not ( = ?auto_413223 ?auto_413229 ) ) ( not ( = ?auto_413223 ?auto_413230 ) ) ( not ( = ?auto_413224 ?auto_413225 ) ) ( not ( = ?auto_413224 ?auto_413226 ) ) ( not ( = ?auto_413224 ?auto_413227 ) ) ( not ( = ?auto_413224 ?auto_413228 ) ) ( not ( = ?auto_413224 ?auto_413229 ) ) ( not ( = ?auto_413224 ?auto_413230 ) ) ( not ( = ?auto_413225 ?auto_413226 ) ) ( not ( = ?auto_413225 ?auto_413227 ) ) ( not ( = ?auto_413225 ?auto_413228 ) ) ( not ( = ?auto_413225 ?auto_413229 ) ) ( not ( = ?auto_413225 ?auto_413230 ) ) ( not ( = ?auto_413226 ?auto_413227 ) ) ( not ( = ?auto_413226 ?auto_413228 ) ) ( not ( = ?auto_413226 ?auto_413229 ) ) ( not ( = ?auto_413226 ?auto_413230 ) ) ( not ( = ?auto_413227 ?auto_413228 ) ) ( not ( = ?auto_413227 ?auto_413229 ) ) ( not ( = ?auto_413227 ?auto_413230 ) ) ( not ( = ?auto_413228 ?auto_413229 ) ) ( not ( = ?auto_413228 ?auto_413230 ) ) ( not ( = ?auto_413229 ?auto_413230 ) ) ( CLEAR ?auto_413227 ) ( ON ?auto_413228 ?auto_413229 ) ( CLEAR ?auto_413228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_413223 ?auto_413224 ?auto_413225 ?auto_413226 ?auto_413227 ?auto_413228 )
      ( MAKE-7PILE ?auto_413223 ?auto_413224 ?auto_413225 ?auto_413226 ?auto_413227 ?auto_413228 ?auto_413229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413238 - BLOCK
      ?auto_413239 - BLOCK
      ?auto_413240 - BLOCK
      ?auto_413241 - BLOCK
      ?auto_413242 - BLOCK
      ?auto_413243 - BLOCK
      ?auto_413244 - BLOCK
    )
    :vars
    (
      ?auto_413245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413244 ?auto_413245 ) ( ON-TABLE ?auto_413238 ) ( ON ?auto_413239 ?auto_413238 ) ( ON ?auto_413240 ?auto_413239 ) ( ON ?auto_413241 ?auto_413240 ) ( ON ?auto_413242 ?auto_413241 ) ( not ( = ?auto_413238 ?auto_413239 ) ) ( not ( = ?auto_413238 ?auto_413240 ) ) ( not ( = ?auto_413238 ?auto_413241 ) ) ( not ( = ?auto_413238 ?auto_413242 ) ) ( not ( = ?auto_413238 ?auto_413243 ) ) ( not ( = ?auto_413238 ?auto_413244 ) ) ( not ( = ?auto_413238 ?auto_413245 ) ) ( not ( = ?auto_413239 ?auto_413240 ) ) ( not ( = ?auto_413239 ?auto_413241 ) ) ( not ( = ?auto_413239 ?auto_413242 ) ) ( not ( = ?auto_413239 ?auto_413243 ) ) ( not ( = ?auto_413239 ?auto_413244 ) ) ( not ( = ?auto_413239 ?auto_413245 ) ) ( not ( = ?auto_413240 ?auto_413241 ) ) ( not ( = ?auto_413240 ?auto_413242 ) ) ( not ( = ?auto_413240 ?auto_413243 ) ) ( not ( = ?auto_413240 ?auto_413244 ) ) ( not ( = ?auto_413240 ?auto_413245 ) ) ( not ( = ?auto_413241 ?auto_413242 ) ) ( not ( = ?auto_413241 ?auto_413243 ) ) ( not ( = ?auto_413241 ?auto_413244 ) ) ( not ( = ?auto_413241 ?auto_413245 ) ) ( not ( = ?auto_413242 ?auto_413243 ) ) ( not ( = ?auto_413242 ?auto_413244 ) ) ( not ( = ?auto_413242 ?auto_413245 ) ) ( not ( = ?auto_413243 ?auto_413244 ) ) ( not ( = ?auto_413243 ?auto_413245 ) ) ( not ( = ?auto_413244 ?auto_413245 ) ) ( CLEAR ?auto_413242 ) ( ON ?auto_413243 ?auto_413244 ) ( CLEAR ?auto_413243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_413238 ?auto_413239 ?auto_413240 ?auto_413241 ?auto_413242 ?auto_413243 )
      ( MAKE-7PILE ?auto_413238 ?auto_413239 ?auto_413240 ?auto_413241 ?auto_413242 ?auto_413243 ?auto_413244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413253 - BLOCK
      ?auto_413254 - BLOCK
      ?auto_413255 - BLOCK
      ?auto_413256 - BLOCK
      ?auto_413257 - BLOCK
      ?auto_413258 - BLOCK
      ?auto_413259 - BLOCK
    )
    :vars
    (
      ?auto_413260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413259 ?auto_413260 ) ( ON-TABLE ?auto_413253 ) ( ON ?auto_413254 ?auto_413253 ) ( ON ?auto_413255 ?auto_413254 ) ( ON ?auto_413256 ?auto_413255 ) ( not ( = ?auto_413253 ?auto_413254 ) ) ( not ( = ?auto_413253 ?auto_413255 ) ) ( not ( = ?auto_413253 ?auto_413256 ) ) ( not ( = ?auto_413253 ?auto_413257 ) ) ( not ( = ?auto_413253 ?auto_413258 ) ) ( not ( = ?auto_413253 ?auto_413259 ) ) ( not ( = ?auto_413253 ?auto_413260 ) ) ( not ( = ?auto_413254 ?auto_413255 ) ) ( not ( = ?auto_413254 ?auto_413256 ) ) ( not ( = ?auto_413254 ?auto_413257 ) ) ( not ( = ?auto_413254 ?auto_413258 ) ) ( not ( = ?auto_413254 ?auto_413259 ) ) ( not ( = ?auto_413254 ?auto_413260 ) ) ( not ( = ?auto_413255 ?auto_413256 ) ) ( not ( = ?auto_413255 ?auto_413257 ) ) ( not ( = ?auto_413255 ?auto_413258 ) ) ( not ( = ?auto_413255 ?auto_413259 ) ) ( not ( = ?auto_413255 ?auto_413260 ) ) ( not ( = ?auto_413256 ?auto_413257 ) ) ( not ( = ?auto_413256 ?auto_413258 ) ) ( not ( = ?auto_413256 ?auto_413259 ) ) ( not ( = ?auto_413256 ?auto_413260 ) ) ( not ( = ?auto_413257 ?auto_413258 ) ) ( not ( = ?auto_413257 ?auto_413259 ) ) ( not ( = ?auto_413257 ?auto_413260 ) ) ( not ( = ?auto_413258 ?auto_413259 ) ) ( not ( = ?auto_413258 ?auto_413260 ) ) ( not ( = ?auto_413259 ?auto_413260 ) ) ( ON ?auto_413258 ?auto_413259 ) ( CLEAR ?auto_413256 ) ( ON ?auto_413257 ?auto_413258 ) ( CLEAR ?auto_413257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413253 ?auto_413254 ?auto_413255 ?auto_413256 ?auto_413257 )
      ( MAKE-7PILE ?auto_413253 ?auto_413254 ?auto_413255 ?auto_413256 ?auto_413257 ?auto_413258 ?auto_413259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413268 - BLOCK
      ?auto_413269 - BLOCK
      ?auto_413270 - BLOCK
      ?auto_413271 - BLOCK
      ?auto_413272 - BLOCK
      ?auto_413273 - BLOCK
      ?auto_413274 - BLOCK
    )
    :vars
    (
      ?auto_413275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413274 ?auto_413275 ) ( ON-TABLE ?auto_413268 ) ( ON ?auto_413269 ?auto_413268 ) ( ON ?auto_413270 ?auto_413269 ) ( ON ?auto_413271 ?auto_413270 ) ( not ( = ?auto_413268 ?auto_413269 ) ) ( not ( = ?auto_413268 ?auto_413270 ) ) ( not ( = ?auto_413268 ?auto_413271 ) ) ( not ( = ?auto_413268 ?auto_413272 ) ) ( not ( = ?auto_413268 ?auto_413273 ) ) ( not ( = ?auto_413268 ?auto_413274 ) ) ( not ( = ?auto_413268 ?auto_413275 ) ) ( not ( = ?auto_413269 ?auto_413270 ) ) ( not ( = ?auto_413269 ?auto_413271 ) ) ( not ( = ?auto_413269 ?auto_413272 ) ) ( not ( = ?auto_413269 ?auto_413273 ) ) ( not ( = ?auto_413269 ?auto_413274 ) ) ( not ( = ?auto_413269 ?auto_413275 ) ) ( not ( = ?auto_413270 ?auto_413271 ) ) ( not ( = ?auto_413270 ?auto_413272 ) ) ( not ( = ?auto_413270 ?auto_413273 ) ) ( not ( = ?auto_413270 ?auto_413274 ) ) ( not ( = ?auto_413270 ?auto_413275 ) ) ( not ( = ?auto_413271 ?auto_413272 ) ) ( not ( = ?auto_413271 ?auto_413273 ) ) ( not ( = ?auto_413271 ?auto_413274 ) ) ( not ( = ?auto_413271 ?auto_413275 ) ) ( not ( = ?auto_413272 ?auto_413273 ) ) ( not ( = ?auto_413272 ?auto_413274 ) ) ( not ( = ?auto_413272 ?auto_413275 ) ) ( not ( = ?auto_413273 ?auto_413274 ) ) ( not ( = ?auto_413273 ?auto_413275 ) ) ( not ( = ?auto_413274 ?auto_413275 ) ) ( ON ?auto_413273 ?auto_413274 ) ( CLEAR ?auto_413271 ) ( ON ?auto_413272 ?auto_413273 ) ( CLEAR ?auto_413272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413268 ?auto_413269 ?auto_413270 ?auto_413271 ?auto_413272 )
      ( MAKE-7PILE ?auto_413268 ?auto_413269 ?auto_413270 ?auto_413271 ?auto_413272 ?auto_413273 ?auto_413274 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413283 - BLOCK
      ?auto_413284 - BLOCK
      ?auto_413285 - BLOCK
      ?auto_413286 - BLOCK
      ?auto_413287 - BLOCK
      ?auto_413288 - BLOCK
      ?auto_413289 - BLOCK
    )
    :vars
    (
      ?auto_413290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413289 ?auto_413290 ) ( ON-TABLE ?auto_413283 ) ( ON ?auto_413284 ?auto_413283 ) ( ON ?auto_413285 ?auto_413284 ) ( not ( = ?auto_413283 ?auto_413284 ) ) ( not ( = ?auto_413283 ?auto_413285 ) ) ( not ( = ?auto_413283 ?auto_413286 ) ) ( not ( = ?auto_413283 ?auto_413287 ) ) ( not ( = ?auto_413283 ?auto_413288 ) ) ( not ( = ?auto_413283 ?auto_413289 ) ) ( not ( = ?auto_413283 ?auto_413290 ) ) ( not ( = ?auto_413284 ?auto_413285 ) ) ( not ( = ?auto_413284 ?auto_413286 ) ) ( not ( = ?auto_413284 ?auto_413287 ) ) ( not ( = ?auto_413284 ?auto_413288 ) ) ( not ( = ?auto_413284 ?auto_413289 ) ) ( not ( = ?auto_413284 ?auto_413290 ) ) ( not ( = ?auto_413285 ?auto_413286 ) ) ( not ( = ?auto_413285 ?auto_413287 ) ) ( not ( = ?auto_413285 ?auto_413288 ) ) ( not ( = ?auto_413285 ?auto_413289 ) ) ( not ( = ?auto_413285 ?auto_413290 ) ) ( not ( = ?auto_413286 ?auto_413287 ) ) ( not ( = ?auto_413286 ?auto_413288 ) ) ( not ( = ?auto_413286 ?auto_413289 ) ) ( not ( = ?auto_413286 ?auto_413290 ) ) ( not ( = ?auto_413287 ?auto_413288 ) ) ( not ( = ?auto_413287 ?auto_413289 ) ) ( not ( = ?auto_413287 ?auto_413290 ) ) ( not ( = ?auto_413288 ?auto_413289 ) ) ( not ( = ?auto_413288 ?auto_413290 ) ) ( not ( = ?auto_413289 ?auto_413290 ) ) ( ON ?auto_413288 ?auto_413289 ) ( ON ?auto_413287 ?auto_413288 ) ( CLEAR ?auto_413285 ) ( ON ?auto_413286 ?auto_413287 ) ( CLEAR ?auto_413286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413283 ?auto_413284 ?auto_413285 ?auto_413286 )
      ( MAKE-7PILE ?auto_413283 ?auto_413284 ?auto_413285 ?auto_413286 ?auto_413287 ?auto_413288 ?auto_413289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413298 - BLOCK
      ?auto_413299 - BLOCK
      ?auto_413300 - BLOCK
      ?auto_413301 - BLOCK
      ?auto_413302 - BLOCK
      ?auto_413303 - BLOCK
      ?auto_413304 - BLOCK
    )
    :vars
    (
      ?auto_413305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413304 ?auto_413305 ) ( ON-TABLE ?auto_413298 ) ( ON ?auto_413299 ?auto_413298 ) ( ON ?auto_413300 ?auto_413299 ) ( not ( = ?auto_413298 ?auto_413299 ) ) ( not ( = ?auto_413298 ?auto_413300 ) ) ( not ( = ?auto_413298 ?auto_413301 ) ) ( not ( = ?auto_413298 ?auto_413302 ) ) ( not ( = ?auto_413298 ?auto_413303 ) ) ( not ( = ?auto_413298 ?auto_413304 ) ) ( not ( = ?auto_413298 ?auto_413305 ) ) ( not ( = ?auto_413299 ?auto_413300 ) ) ( not ( = ?auto_413299 ?auto_413301 ) ) ( not ( = ?auto_413299 ?auto_413302 ) ) ( not ( = ?auto_413299 ?auto_413303 ) ) ( not ( = ?auto_413299 ?auto_413304 ) ) ( not ( = ?auto_413299 ?auto_413305 ) ) ( not ( = ?auto_413300 ?auto_413301 ) ) ( not ( = ?auto_413300 ?auto_413302 ) ) ( not ( = ?auto_413300 ?auto_413303 ) ) ( not ( = ?auto_413300 ?auto_413304 ) ) ( not ( = ?auto_413300 ?auto_413305 ) ) ( not ( = ?auto_413301 ?auto_413302 ) ) ( not ( = ?auto_413301 ?auto_413303 ) ) ( not ( = ?auto_413301 ?auto_413304 ) ) ( not ( = ?auto_413301 ?auto_413305 ) ) ( not ( = ?auto_413302 ?auto_413303 ) ) ( not ( = ?auto_413302 ?auto_413304 ) ) ( not ( = ?auto_413302 ?auto_413305 ) ) ( not ( = ?auto_413303 ?auto_413304 ) ) ( not ( = ?auto_413303 ?auto_413305 ) ) ( not ( = ?auto_413304 ?auto_413305 ) ) ( ON ?auto_413303 ?auto_413304 ) ( ON ?auto_413302 ?auto_413303 ) ( CLEAR ?auto_413300 ) ( ON ?auto_413301 ?auto_413302 ) ( CLEAR ?auto_413301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413298 ?auto_413299 ?auto_413300 ?auto_413301 )
      ( MAKE-7PILE ?auto_413298 ?auto_413299 ?auto_413300 ?auto_413301 ?auto_413302 ?auto_413303 ?auto_413304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413313 - BLOCK
      ?auto_413314 - BLOCK
      ?auto_413315 - BLOCK
      ?auto_413316 - BLOCK
      ?auto_413317 - BLOCK
      ?auto_413318 - BLOCK
      ?auto_413319 - BLOCK
    )
    :vars
    (
      ?auto_413320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413319 ?auto_413320 ) ( ON-TABLE ?auto_413313 ) ( ON ?auto_413314 ?auto_413313 ) ( not ( = ?auto_413313 ?auto_413314 ) ) ( not ( = ?auto_413313 ?auto_413315 ) ) ( not ( = ?auto_413313 ?auto_413316 ) ) ( not ( = ?auto_413313 ?auto_413317 ) ) ( not ( = ?auto_413313 ?auto_413318 ) ) ( not ( = ?auto_413313 ?auto_413319 ) ) ( not ( = ?auto_413313 ?auto_413320 ) ) ( not ( = ?auto_413314 ?auto_413315 ) ) ( not ( = ?auto_413314 ?auto_413316 ) ) ( not ( = ?auto_413314 ?auto_413317 ) ) ( not ( = ?auto_413314 ?auto_413318 ) ) ( not ( = ?auto_413314 ?auto_413319 ) ) ( not ( = ?auto_413314 ?auto_413320 ) ) ( not ( = ?auto_413315 ?auto_413316 ) ) ( not ( = ?auto_413315 ?auto_413317 ) ) ( not ( = ?auto_413315 ?auto_413318 ) ) ( not ( = ?auto_413315 ?auto_413319 ) ) ( not ( = ?auto_413315 ?auto_413320 ) ) ( not ( = ?auto_413316 ?auto_413317 ) ) ( not ( = ?auto_413316 ?auto_413318 ) ) ( not ( = ?auto_413316 ?auto_413319 ) ) ( not ( = ?auto_413316 ?auto_413320 ) ) ( not ( = ?auto_413317 ?auto_413318 ) ) ( not ( = ?auto_413317 ?auto_413319 ) ) ( not ( = ?auto_413317 ?auto_413320 ) ) ( not ( = ?auto_413318 ?auto_413319 ) ) ( not ( = ?auto_413318 ?auto_413320 ) ) ( not ( = ?auto_413319 ?auto_413320 ) ) ( ON ?auto_413318 ?auto_413319 ) ( ON ?auto_413317 ?auto_413318 ) ( ON ?auto_413316 ?auto_413317 ) ( CLEAR ?auto_413314 ) ( ON ?auto_413315 ?auto_413316 ) ( CLEAR ?auto_413315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413313 ?auto_413314 ?auto_413315 )
      ( MAKE-7PILE ?auto_413313 ?auto_413314 ?auto_413315 ?auto_413316 ?auto_413317 ?auto_413318 ?auto_413319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413328 - BLOCK
      ?auto_413329 - BLOCK
      ?auto_413330 - BLOCK
      ?auto_413331 - BLOCK
      ?auto_413332 - BLOCK
      ?auto_413333 - BLOCK
      ?auto_413334 - BLOCK
    )
    :vars
    (
      ?auto_413335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413334 ?auto_413335 ) ( ON-TABLE ?auto_413328 ) ( ON ?auto_413329 ?auto_413328 ) ( not ( = ?auto_413328 ?auto_413329 ) ) ( not ( = ?auto_413328 ?auto_413330 ) ) ( not ( = ?auto_413328 ?auto_413331 ) ) ( not ( = ?auto_413328 ?auto_413332 ) ) ( not ( = ?auto_413328 ?auto_413333 ) ) ( not ( = ?auto_413328 ?auto_413334 ) ) ( not ( = ?auto_413328 ?auto_413335 ) ) ( not ( = ?auto_413329 ?auto_413330 ) ) ( not ( = ?auto_413329 ?auto_413331 ) ) ( not ( = ?auto_413329 ?auto_413332 ) ) ( not ( = ?auto_413329 ?auto_413333 ) ) ( not ( = ?auto_413329 ?auto_413334 ) ) ( not ( = ?auto_413329 ?auto_413335 ) ) ( not ( = ?auto_413330 ?auto_413331 ) ) ( not ( = ?auto_413330 ?auto_413332 ) ) ( not ( = ?auto_413330 ?auto_413333 ) ) ( not ( = ?auto_413330 ?auto_413334 ) ) ( not ( = ?auto_413330 ?auto_413335 ) ) ( not ( = ?auto_413331 ?auto_413332 ) ) ( not ( = ?auto_413331 ?auto_413333 ) ) ( not ( = ?auto_413331 ?auto_413334 ) ) ( not ( = ?auto_413331 ?auto_413335 ) ) ( not ( = ?auto_413332 ?auto_413333 ) ) ( not ( = ?auto_413332 ?auto_413334 ) ) ( not ( = ?auto_413332 ?auto_413335 ) ) ( not ( = ?auto_413333 ?auto_413334 ) ) ( not ( = ?auto_413333 ?auto_413335 ) ) ( not ( = ?auto_413334 ?auto_413335 ) ) ( ON ?auto_413333 ?auto_413334 ) ( ON ?auto_413332 ?auto_413333 ) ( ON ?auto_413331 ?auto_413332 ) ( CLEAR ?auto_413329 ) ( ON ?auto_413330 ?auto_413331 ) ( CLEAR ?auto_413330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413328 ?auto_413329 ?auto_413330 )
      ( MAKE-7PILE ?auto_413328 ?auto_413329 ?auto_413330 ?auto_413331 ?auto_413332 ?auto_413333 ?auto_413334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413343 - BLOCK
      ?auto_413344 - BLOCK
      ?auto_413345 - BLOCK
      ?auto_413346 - BLOCK
      ?auto_413347 - BLOCK
      ?auto_413348 - BLOCK
      ?auto_413349 - BLOCK
    )
    :vars
    (
      ?auto_413350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413349 ?auto_413350 ) ( ON-TABLE ?auto_413343 ) ( not ( = ?auto_413343 ?auto_413344 ) ) ( not ( = ?auto_413343 ?auto_413345 ) ) ( not ( = ?auto_413343 ?auto_413346 ) ) ( not ( = ?auto_413343 ?auto_413347 ) ) ( not ( = ?auto_413343 ?auto_413348 ) ) ( not ( = ?auto_413343 ?auto_413349 ) ) ( not ( = ?auto_413343 ?auto_413350 ) ) ( not ( = ?auto_413344 ?auto_413345 ) ) ( not ( = ?auto_413344 ?auto_413346 ) ) ( not ( = ?auto_413344 ?auto_413347 ) ) ( not ( = ?auto_413344 ?auto_413348 ) ) ( not ( = ?auto_413344 ?auto_413349 ) ) ( not ( = ?auto_413344 ?auto_413350 ) ) ( not ( = ?auto_413345 ?auto_413346 ) ) ( not ( = ?auto_413345 ?auto_413347 ) ) ( not ( = ?auto_413345 ?auto_413348 ) ) ( not ( = ?auto_413345 ?auto_413349 ) ) ( not ( = ?auto_413345 ?auto_413350 ) ) ( not ( = ?auto_413346 ?auto_413347 ) ) ( not ( = ?auto_413346 ?auto_413348 ) ) ( not ( = ?auto_413346 ?auto_413349 ) ) ( not ( = ?auto_413346 ?auto_413350 ) ) ( not ( = ?auto_413347 ?auto_413348 ) ) ( not ( = ?auto_413347 ?auto_413349 ) ) ( not ( = ?auto_413347 ?auto_413350 ) ) ( not ( = ?auto_413348 ?auto_413349 ) ) ( not ( = ?auto_413348 ?auto_413350 ) ) ( not ( = ?auto_413349 ?auto_413350 ) ) ( ON ?auto_413348 ?auto_413349 ) ( ON ?auto_413347 ?auto_413348 ) ( ON ?auto_413346 ?auto_413347 ) ( ON ?auto_413345 ?auto_413346 ) ( CLEAR ?auto_413343 ) ( ON ?auto_413344 ?auto_413345 ) ( CLEAR ?auto_413344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413343 ?auto_413344 )
      ( MAKE-7PILE ?auto_413343 ?auto_413344 ?auto_413345 ?auto_413346 ?auto_413347 ?auto_413348 ?auto_413349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413358 - BLOCK
      ?auto_413359 - BLOCK
      ?auto_413360 - BLOCK
      ?auto_413361 - BLOCK
      ?auto_413362 - BLOCK
      ?auto_413363 - BLOCK
      ?auto_413364 - BLOCK
    )
    :vars
    (
      ?auto_413365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413364 ?auto_413365 ) ( ON-TABLE ?auto_413358 ) ( not ( = ?auto_413358 ?auto_413359 ) ) ( not ( = ?auto_413358 ?auto_413360 ) ) ( not ( = ?auto_413358 ?auto_413361 ) ) ( not ( = ?auto_413358 ?auto_413362 ) ) ( not ( = ?auto_413358 ?auto_413363 ) ) ( not ( = ?auto_413358 ?auto_413364 ) ) ( not ( = ?auto_413358 ?auto_413365 ) ) ( not ( = ?auto_413359 ?auto_413360 ) ) ( not ( = ?auto_413359 ?auto_413361 ) ) ( not ( = ?auto_413359 ?auto_413362 ) ) ( not ( = ?auto_413359 ?auto_413363 ) ) ( not ( = ?auto_413359 ?auto_413364 ) ) ( not ( = ?auto_413359 ?auto_413365 ) ) ( not ( = ?auto_413360 ?auto_413361 ) ) ( not ( = ?auto_413360 ?auto_413362 ) ) ( not ( = ?auto_413360 ?auto_413363 ) ) ( not ( = ?auto_413360 ?auto_413364 ) ) ( not ( = ?auto_413360 ?auto_413365 ) ) ( not ( = ?auto_413361 ?auto_413362 ) ) ( not ( = ?auto_413361 ?auto_413363 ) ) ( not ( = ?auto_413361 ?auto_413364 ) ) ( not ( = ?auto_413361 ?auto_413365 ) ) ( not ( = ?auto_413362 ?auto_413363 ) ) ( not ( = ?auto_413362 ?auto_413364 ) ) ( not ( = ?auto_413362 ?auto_413365 ) ) ( not ( = ?auto_413363 ?auto_413364 ) ) ( not ( = ?auto_413363 ?auto_413365 ) ) ( not ( = ?auto_413364 ?auto_413365 ) ) ( ON ?auto_413363 ?auto_413364 ) ( ON ?auto_413362 ?auto_413363 ) ( ON ?auto_413361 ?auto_413362 ) ( ON ?auto_413360 ?auto_413361 ) ( CLEAR ?auto_413358 ) ( ON ?auto_413359 ?auto_413360 ) ( CLEAR ?auto_413359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413358 ?auto_413359 )
      ( MAKE-7PILE ?auto_413358 ?auto_413359 ?auto_413360 ?auto_413361 ?auto_413362 ?auto_413363 ?auto_413364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413373 - BLOCK
      ?auto_413374 - BLOCK
      ?auto_413375 - BLOCK
      ?auto_413376 - BLOCK
      ?auto_413377 - BLOCK
      ?auto_413378 - BLOCK
      ?auto_413379 - BLOCK
    )
    :vars
    (
      ?auto_413380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413379 ?auto_413380 ) ( not ( = ?auto_413373 ?auto_413374 ) ) ( not ( = ?auto_413373 ?auto_413375 ) ) ( not ( = ?auto_413373 ?auto_413376 ) ) ( not ( = ?auto_413373 ?auto_413377 ) ) ( not ( = ?auto_413373 ?auto_413378 ) ) ( not ( = ?auto_413373 ?auto_413379 ) ) ( not ( = ?auto_413373 ?auto_413380 ) ) ( not ( = ?auto_413374 ?auto_413375 ) ) ( not ( = ?auto_413374 ?auto_413376 ) ) ( not ( = ?auto_413374 ?auto_413377 ) ) ( not ( = ?auto_413374 ?auto_413378 ) ) ( not ( = ?auto_413374 ?auto_413379 ) ) ( not ( = ?auto_413374 ?auto_413380 ) ) ( not ( = ?auto_413375 ?auto_413376 ) ) ( not ( = ?auto_413375 ?auto_413377 ) ) ( not ( = ?auto_413375 ?auto_413378 ) ) ( not ( = ?auto_413375 ?auto_413379 ) ) ( not ( = ?auto_413375 ?auto_413380 ) ) ( not ( = ?auto_413376 ?auto_413377 ) ) ( not ( = ?auto_413376 ?auto_413378 ) ) ( not ( = ?auto_413376 ?auto_413379 ) ) ( not ( = ?auto_413376 ?auto_413380 ) ) ( not ( = ?auto_413377 ?auto_413378 ) ) ( not ( = ?auto_413377 ?auto_413379 ) ) ( not ( = ?auto_413377 ?auto_413380 ) ) ( not ( = ?auto_413378 ?auto_413379 ) ) ( not ( = ?auto_413378 ?auto_413380 ) ) ( not ( = ?auto_413379 ?auto_413380 ) ) ( ON ?auto_413378 ?auto_413379 ) ( ON ?auto_413377 ?auto_413378 ) ( ON ?auto_413376 ?auto_413377 ) ( ON ?auto_413375 ?auto_413376 ) ( ON ?auto_413374 ?auto_413375 ) ( ON ?auto_413373 ?auto_413374 ) ( CLEAR ?auto_413373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413373 )
      ( MAKE-7PILE ?auto_413373 ?auto_413374 ?auto_413375 ?auto_413376 ?auto_413377 ?auto_413378 ?auto_413379 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_413388 - BLOCK
      ?auto_413389 - BLOCK
      ?auto_413390 - BLOCK
      ?auto_413391 - BLOCK
      ?auto_413392 - BLOCK
      ?auto_413393 - BLOCK
      ?auto_413394 - BLOCK
    )
    :vars
    (
      ?auto_413395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413394 ?auto_413395 ) ( not ( = ?auto_413388 ?auto_413389 ) ) ( not ( = ?auto_413388 ?auto_413390 ) ) ( not ( = ?auto_413388 ?auto_413391 ) ) ( not ( = ?auto_413388 ?auto_413392 ) ) ( not ( = ?auto_413388 ?auto_413393 ) ) ( not ( = ?auto_413388 ?auto_413394 ) ) ( not ( = ?auto_413388 ?auto_413395 ) ) ( not ( = ?auto_413389 ?auto_413390 ) ) ( not ( = ?auto_413389 ?auto_413391 ) ) ( not ( = ?auto_413389 ?auto_413392 ) ) ( not ( = ?auto_413389 ?auto_413393 ) ) ( not ( = ?auto_413389 ?auto_413394 ) ) ( not ( = ?auto_413389 ?auto_413395 ) ) ( not ( = ?auto_413390 ?auto_413391 ) ) ( not ( = ?auto_413390 ?auto_413392 ) ) ( not ( = ?auto_413390 ?auto_413393 ) ) ( not ( = ?auto_413390 ?auto_413394 ) ) ( not ( = ?auto_413390 ?auto_413395 ) ) ( not ( = ?auto_413391 ?auto_413392 ) ) ( not ( = ?auto_413391 ?auto_413393 ) ) ( not ( = ?auto_413391 ?auto_413394 ) ) ( not ( = ?auto_413391 ?auto_413395 ) ) ( not ( = ?auto_413392 ?auto_413393 ) ) ( not ( = ?auto_413392 ?auto_413394 ) ) ( not ( = ?auto_413392 ?auto_413395 ) ) ( not ( = ?auto_413393 ?auto_413394 ) ) ( not ( = ?auto_413393 ?auto_413395 ) ) ( not ( = ?auto_413394 ?auto_413395 ) ) ( ON ?auto_413393 ?auto_413394 ) ( ON ?auto_413392 ?auto_413393 ) ( ON ?auto_413391 ?auto_413392 ) ( ON ?auto_413390 ?auto_413391 ) ( ON ?auto_413389 ?auto_413390 ) ( ON ?auto_413388 ?auto_413389 ) ( CLEAR ?auto_413388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413388 )
      ( MAKE-7PILE ?auto_413388 ?auto_413389 ?auto_413390 ?auto_413391 ?auto_413392 ?auto_413393 ?auto_413394 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413404 - BLOCK
      ?auto_413405 - BLOCK
      ?auto_413406 - BLOCK
      ?auto_413407 - BLOCK
      ?auto_413408 - BLOCK
      ?auto_413409 - BLOCK
      ?auto_413410 - BLOCK
      ?auto_413411 - BLOCK
    )
    :vars
    (
      ?auto_413412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413410 ) ( ON ?auto_413411 ?auto_413412 ) ( CLEAR ?auto_413411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413404 ) ( ON ?auto_413405 ?auto_413404 ) ( ON ?auto_413406 ?auto_413405 ) ( ON ?auto_413407 ?auto_413406 ) ( ON ?auto_413408 ?auto_413407 ) ( ON ?auto_413409 ?auto_413408 ) ( ON ?auto_413410 ?auto_413409 ) ( not ( = ?auto_413404 ?auto_413405 ) ) ( not ( = ?auto_413404 ?auto_413406 ) ) ( not ( = ?auto_413404 ?auto_413407 ) ) ( not ( = ?auto_413404 ?auto_413408 ) ) ( not ( = ?auto_413404 ?auto_413409 ) ) ( not ( = ?auto_413404 ?auto_413410 ) ) ( not ( = ?auto_413404 ?auto_413411 ) ) ( not ( = ?auto_413404 ?auto_413412 ) ) ( not ( = ?auto_413405 ?auto_413406 ) ) ( not ( = ?auto_413405 ?auto_413407 ) ) ( not ( = ?auto_413405 ?auto_413408 ) ) ( not ( = ?auto_413405 ?auto_413409 ) ) ( not ( = ?auto_413405 ?auto_413410 ) ) ( not ( = ?auto_413405 ?auto_413411 ) ) ( not ( = ?auto_413405 ?auto_413412 ) ) ( not ( = ?auto_413406 ?auto_413407 ) ) ( not ( = ?auto_413406 ?auto_413408 ) ) ( not ( = ?auto_413406 ?auto_413409 ) ) ( not ( = ?auto_413406 ?auto_413410 ) ) ( not ( = ?auto_413406 ?auto_413411 ) ) ( not ( = ?auto_413406 ?auto_413412 ) ) ( not ( = ?auto_413407 ?auto_413408 ) ) ( not ( = ?auto_413407 ?auto_413409 ) ) ( not ( = ?auto_413407 ?auto_413410 ) ) ( not ( = ?auto_413407 ?auto_413411 ) ) ( not ( = ?auto_413407 ?auto_413412 ) ) ( not ( = ?auto_413408 ?auto_413409 ) ) ( not ( = ?auto_413408 ?auto_413410 ) ) ( not ( = ?auto_413408 ?auto_413411 ) ) ( not ( = ?auto_413408 ?auto_413412 ) ) ( not ( = ?auto_413409 ?auto_413410 ) ) ( not ( = ?auto_413409 ?auto_413411 ) ) ( not ( = ?auto_413409 ?auto_413412 ) ) ( not ( = ?auto_413410 ?auto_413411 ) ) ( not ( = ?auto_413410 ?auto_413412 ) ) ( not ( = ?auto_413411 ?auto_413412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413411 ?auto_413412 )
      ( !STACK ?auto_413411 ?auto_413410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413421 - BLOCK
      ?auto_413422 - BLOCK
      ?auto_413423 - BLOCK
      ?auto_413424 - BLOCK
      ?auto_413425 - BLOCK
      ?auto_413426 - BLOCK
      ?auto_413427 - BLOCK
      ?auto_413428 - BLOCK
    )
    :vars
    (
      ?auto_413429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413427 ) ( ON ?auto_413428 ?auto_413429 ) ( CLEAR ?auto_413428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413421 ) ( ON ?auto_413422 ?auto_413421 ) ( ON ?auto_413423 ?auto_413422 ) ( ON ?auto_413424 ?auto_413423 ) ( ON ?auto_413425 ?auto_413424 ) ( ON ?auto_413426 ?auto_413425 ) ( ON ?auto_413427 ?auto_413426 ) ( not ( = ?auto_413421 ?auto_413422 ) ) ( not ( = ?auto_413421 ?auto_413423 ) ) ( not ( = ?auto_413421 ?auto_413424 ) ) ( not ( = ?auto_413421 ?auto_413425 ) ) ( not ( = ?auto_413421 ?auto_413426 ) ) ( not ( = ?auto_413421 ?auto_413427 ) ) ( not ( = ?auto_413421 ?auto_413428 ) ) ( not ( = ?auto_413421 ?auto_413429 ) ) ( not ( = ?auto_413422 ?auto_413423 ) ) ( not ( = ?auto_413422 ?auto_413424 ) ) ( not ( = ?auto_413422 ?auto_413425 ) ) ( not ( = ?auto_413422 ?auto_413426 ) ) ( not ( = ?auto_413422 ?auto_413427 ) ) ( not ( = ?auto_413422 ?auto_413428 ) ) ( not ( = ?auto_413422 ?auto_413429 ) ) ( not ( = ?auto_413423 ?auto_413424 ) ) ( not ( = ?auto_413423 ?auto_413425 ) ) ( not ( = ?auto_413423 ?auto_413426 ) ) ( not ( = ?auto_413423 ?auto_413427 ) ) ( not ( = ?auto_413423 ?auto_413428 ) ) ( not ( = ?auto_413423 ?auto_413429 ) ) ( not ( = ?auto_413424 ?auto_413425 ) ) ( not ( = ?auto_413424 ?auto_413426 ) ) ( not ( = ?auto_413424 ?auto_413427 ) ) ( not ( = ?auto_413424 ?auto_413428 ) ) ( not ( = ?auto_413424 ?auto_413429 ) ) ( not ( = ?auto_413425 ?auto_413426 ) ) ( not ( = ?auto_413425 ?auto_413427 ) ) ( not ( = ?auto_413425 ?auto_413428 ) ) ( not ( = ?auto_413425 ?auto_413429 ) ) ( not ( = ?auto_413426 ?auto_413427 ) ) ( not ( = ?auto_413426 ?auto_413428 ) ) ( not ( = ?auto_413426 ?auto_413429 ) ) ( not ( = ?auto_413427 ?auto_413428 ) ) ( not ( = ?auto_413427 ?auto_413429 ) ) ( not ( = ?auto_413428 ?auto_413429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413428 ?auto_413429 )
      ( !STACK ?auto_413428 ?auto_413427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413438 - BLOCK
      ?auto_413439 - BLOCK
      ?auto_413440 - BLOCK
      ?auto_413441 - BLOCK
      ?auto_413442 - BLOCK
      ?auto_413443 - BLOCK
      ?auto_413444 - BLOCK
      ?auto_413445 - BLOCK
    )
    :vars
    (
      ?auto_413446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413445 ?auto_413446 ) ( ON-TABLE ?auto_413438 ) ( ON ?auto_413439 ?auto_413438 ) ( ON ?auto_413440 ?auto_413439 ) ( ON ?auto_413441 ?auto_413440 ) ( ON ?auto_413442 ?auto_413441 ) ( ON ?auto_413443 ?auto_413442 ) ( not ( = ?auto_413438 ?auto_413439 ) ) ( not ( = ?auto_413438 ?auto_413440 ) ) ( not ( = ?auto_413438 ?auto_413441 ) ) ( not ( = ?auto_413438 ?auto_413442 ) ) ( not ( = ?auto_413438 ?auto_413443 ) ) ( not ( = ?auto_413438 ?auto_413444 ) ) ( not ( = ?auto_413438 ?auto_413445 ) ) ( not ( = ?auto_413438 ?auto_413446 ) ) ( not ( = ?auto_413439 ?auto_413440 ) ) ( not ( = ?auto_413439 ?auto_413441 ) ) ( not ( = ?auto_413439 ?auto_413442 ) ) ( not ( = ?auto_413439 ?auto_413443 ) ) ( not ( = ?auto_413439 ?auto_413444 ) ) ( not ( = ?auto_413439 ?auto_413445 ) ) ( not ( = ?auto_413439 ?auto_413446 ) ) ( not ( = ?auto_413440 ?auto_413441 ) ) ( not ( = ?auto_413440 ?auto_413442 ) ) ( not ( = ?auto_413440 ?auto_413443 ) ) ( not ( = ?auto_413440 ?auto_413444 ) ) ( not ( = ?auto_413440 ?auto_413445 ) ) ( not ( = ?auto_413440 ?auto_413446 ) ) ( not ( = ?auto_413441 ?auto_413442 ) ) ( not ( = ?auto_413441 ?auto_413443 ) ) ( not ( = ?auto_413441 ?auto_413444 ) ) ( not ( = ?auto_413441 ?auto_413445 ) ) ( not ( = ?auto_413441 ?auto_413446 ) ) ( not ( = ?auto_413442 ?auto_413443 ) ) ( not ( = ?auto_413442 ?auto_413444 ) ) ( not ( = ?auto_413442 ?auto_413445 ) ) ( not ( = ?auto_413442 ?auto_413446 ) ) ( not ( = ?auto_413443 ?auto_413444 ) ) ( not ( = ?auto_413443 ?auto_413445 ) ) ( not ( = ?auto_413443 ?auto_413446 ) ) ( not ( = ?auto_413444 ?auto_413445 ) ) ( not ( = ?auto_413444 ?auto_413446 ) ) ( not ( = ?auto_413445 ?auto_413446 ) ) ( CLEAR ?auto_413443 ) ( ON ?auto_413444 ?auto_413445 ) ( CLEAR ?auto_413444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_413438 ?auto_413439 ?auto_413440 ?auto_413441 ?auto_413442 ?auto_413443 ?auto_413444 )
      ( MAKE-8PILE ?auto_413438 ?auto_413439 ?auto_413440 ?auto_413441 ?auto_413442 ?auto_413443 ?auto_413444 ?auto_413445 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413455 - BLOCK
      ?auto_413456 - BLOCK
      ?auto_413457 - BLOCK
      ?auto_413458 - BLOCK
      ?auto_413459 - BLOCK
      ?auto_413460 - BLOCK
      ?auto_413461 - BLOCK
      ?auto_413462 - BLOCK
    )
    :vars
    (
      ?auto_413463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413462 ?auto_413463 ) ( ON-TABLE ?auto_413455 ) ( ON ?auto_413456 ?auto_413455 ) ( ON ?auto_413457 ?auto_413456 ) ( ON ?auto_413458 ?auto_413457 ) ( ON ?auto_413459 ?auto_413458 ) ( ON ?auto_413460 ?auto_413459 ) ( not ( = ?auto_413455 ?auto_413456 ) ) ( not ( = ?auto_413455 ?auto_413457 ) ) ( not ( = ?auto_413455 ?auto_413458 ) ) ( not ( = ?auto_413455 ?auto_413459 ) ) ( not ( = ?auto_413455 ?auto_413460 ) ) ( not ( = ?auto_413455 ?auto_413461 ) ) ( not ( = ?auto_413455 ?auto_413462 ) ) ( not ( = ?auto_413455 ?auto_413463 ) ) ( not ( = ?auto_413456 ?auto_413457 ) ) ( not ( = ?auto_413456 ?auto_413458 ) ) ( not ( = ?auto_413456 ?auto_413459 ) ) ( not ( = ?auto_413456 ?auto_413460 ) ) ( not ( = ?auto_413456 ?auto_413461 ) ) ( not ( = ?auto_413456 ?auto_413462 ) ) ( not ( = ?auto_413456 ?auto_413463 ) ) ( not ( = ?auto_413457 ?auto_413458 ) ) ( not ( = ?auto_413457 ?auto_413459 ) ) ( not ( = ?auto_413457 ?auto_413460 ) ) ( not ( = ?auto_413457 ?auto_413461 ) ) ( not ( = ?auto_413457 ?auto_413462 ) ) ( not ( = ?auto_413457 ?auto_413463 ) ) ( not ( = ?auto_413458 ?auto_413459 ) ) ( not ( = ?auto_413458 ?auto_413460 ) ) ( not ( = ?auto_413458 ?auto_413461 ) ) ( not ( = ?auto_413458 ?auto_413462 ) ) ( not ( = ?auto_413458 ?auto_413463 ) ) ( not ( = ?auto_413459 ?auto_413460 ) ) ( not ( = ?auto_413459 ?auto_413461 ) ) ( not ( = ?auto_413459 ?auto_413462 ) ) ( not ( = ?auto_413459 ?auto_413463 ) ) ( not ( = ?auto_413460 ?auto_413461 ) ) ( not ( = ?auto_413460 ?auto_413462 ) ) ( not ( = ?auto_413460 ?auto_413463 ) ) ( not ( = ?auto_413461 ?auto_413462 ) ) ( not ( = ?auto_413461 ?auto_413463 ) ) ( not ( = ?auto_413462 ?auto_413463 ) ) ( CLEAR ?auto_413460 ) ( ON ?auto_413461 ?auto_413462 ) ( CLEAR ?auto_413461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_413455 ?auto_413456 ?auto_413457 ?auto_413458 ?auto_413459 ?auto_413460 ?auto_413461 )
      ( MAKE-8PILE ?auto_413455 ?auto_413456 ?auto_413457 ?auto_413458 ?auto_413459 ?auto_413460 ?auto_413461 ?auto_413462 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413472 - BLOCK
      ?auto_413473 - BLOCK
      ?auto_413474 - BLOCK
      ?auto_413475 - BLOCK
      ?auto_413476 - BLOCK
      ?auto_413477 - BLOCK
      ?auto_413478 - BLOCK
      ?auto_413479 - BLOCK
    )
    :vars
    (
      ?auto_413480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413479 ?auto_413480 ) ( ON-TABLE ?auto_413472 ) ( ON ?auto_413473 ?auto_413472 ) ( ON ?auto_413474 ?auto_413473 ) ( ON ?auto_413475 ?auto_413474 ) ( ON ?auto_413476 ?auto_413475 ) ( not ( = ?auto_413472 ?auto_413473 ) ) ( not ( = ?auto_413472 ?auto_413474 ) ) ( not ( = ?auto_413472 ?auto_413475 ) ) ( not ( = ?auto_413472 ?auto_413476 ) ) ( not ( = ?auto_413472 ?auto_413477 ) ) ( not ( = ?auto_413472 ?auto_413478 ) ) ( not ( = ?auto_413472 ?auto_413479 ) ) ( not ( = ?auto_413472 ?auto_413480 ) ) ( not ( = ?auto_413473 ?auto_413474 ) ) ( not ( = ?auto_413473 ?auto_413475 ) ) ( not ( = ?auto_413473 ?auto_413476 ) ) ( not ( = ?auto_413473 ?auto_413477 ) ) ( not ( = ?auto_413473 ?auto_413478 ) ) ( not ( = ?auto_413473 ?auto_413479 ) ) ( not ( = ?auto_413473 ?auto_413480 ) ) ( not ( = ?auto_413474 ?auto_413475 ) ) ( not ( = ?auto_413474 ?auto_413476 ) ) ( not ( = ?auto_413474 ?auto_413477 ) ) ( not ( = ?auto_413474 ?auto_413478 ) ) ( not ( = ?auto_413474 ?auto_413479 ) ) ( not ( = ?auto_413474 ?auto_413480 ) ) ( not ( = ?auto_413475 ?auto_413476 ) ) ( not ( = ?auto_413475 ?auto_413477 ) ) ( not ( = ?auto_413475 ?auto_413478 ) ) ( not ( = ?auto_413475 ?auto_413479 ) ) ( not ( = ?auto_413475 ?auto_413480 ) ) ( not ( = ?auto_413476 ?auto_413477 ) ) ( not ( = ?auto_413476 ?auto_413478 ) ) ( not ( = ?auto_413476 ?auto_413479 ) ) ( not ( = ?auto_413476 ?auto_413480 ) ) ( not ( = ?auto_413477 ?auto_413478 ) ) ( not ( = ?auto_413477 ?auto_413479 ) ) ( not ( = ?auto_413477 ?auto_413480 ) ) ( not ( = ?auto_413478 ?auto_413479 ) ) ( not ( = ?auto_413478 ?auto_413480 ) ) ( not ( = ?auto_413479 ?auto_413480 ) ) ( ON ?auto_413478 ?auto_413479 ) ( CLEAR ?auto_413476 ) ( ON ?auto_413477 ?auto_413478 ) ( CLEAR ?auto_413477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_413472 ?auto_413473 ?auto_413474 ?auto_413475 ?auto_413476 ?auto_413477 )
      ( MAKE-8PILE ?auto_413472 ?auto_413473 ?auto_413474 ?auto_413475 ?auto_413476 ?auto_413477 ?auto_413478 ?auto_413479 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413489 - BLOCK
      ?auto_413490 - BLOCK
      ?auto_413491 - BLOCK
      ?auto_413492 - BLOCK
      ?auto_413493 - BLOCK
      ?auto_413494 - BLOCK
      ?auto_413495 - BLOCK
      ?auto_413496 - BLOCK
    )
    :vars
    (
      ?auto_413497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413496 ?auto_413497 ) ( ON-TABLE ?auto_413489 ) ( ON ?auto_413490 ?auto_413489 ) ( ON ?auto_413491 ?auto_413490 ) ( ON ?auto_413492 ?auto_413491 ) ( ON ?auto_413493 ?auto_413492 ) ( not ( = ?auto_413489 ?auto_413490 ) ) ( not ( = ?auto_413489 ?auto_413491 ) ) ( not ( = ?auto_413489 ?auto_413492 ) ) ( not ( = ?auto_413489 ?auto_413493 ) ) ( not ( = ?auto_413489 ?auto_413494 ) ) ( not ( = ?auto_413489 ?auto_413495 ) ) ( not ( = ?auto_413489 ?auto_413496 ) ) ( not ( = ?auto_413489 ?auto_413497 ) ) ( not ( = ?auto_413490 ?auto_413491 ) ) ( not ( = ?auto_413490 ?auto_413492 ) ) ( not ( = ?auto_413490 ?auto_413493 ) ) ( not ( = ?auto_413490 ?auto_413494 ) ) ( not ( = ?auto_413490 ?auto_413495 ) ) ( not ( = ?auto_413490 ?auto_413496 ) ) ( not ( = ?auto_413490 ?auto_413497 ) ) ( not ( = ?auto_413491 ?auto_413492 ) ) ( not ( = ?auto_413491 ?auto_413493 ) ) ( not ( = ?auto_413491 ?auto_413494 ) ) ( not ( = ?auto_413491 ?auto_413495 ) ) ( not ( = ?auto_413491 ?auto_413496 ) ) ( not ( = ?auto_413491 ?auto_413497 ) ) ( not ( = ?auto_413492 ?auto_413493 ) ) ( not ( = ?auto_413492 ?auto_413494 ) ) ( not ( = ?auto_413492 ?auto_413495 ) ) ( not ( = ?auto_413492 ?auto_413496 ) ) ( not ( = ?auto_413492 ?auto_413497 ) ) ( not ( = ?auto_413493 ?auto_413494 ) ) ( not ( = ?auto_413493 ?auto_413495 ) ) ( not ( = ?auto_413493 ?auto_413496 ) ) ( not ( = ?auto_413493 ?auto_413497 ) ) ( not ( = ?auto_413494 ?auto_413495 ) ) ( not ( = ?auto_413494 ?auto_413496 ) ) ( not ( = ?auto_413494 ?auto_413497 ) ) ( not ( = ?auto_413495 ?auto_413496 ) ) ( not ( = ?auto_413495 ?auto_413497 ) ) ( not ( = ?auto_413496 ?auto_413497 ) ) ( ON ?auto_413495 ?auto_413496 ) ( CLEAR ?auto_413493 ) ( ON ?auto_413494 ?auto_413495 ) ( CLEAR ?auto_413494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_413489 ?auto_413490 ?auto_413491 ?auto_413492 ?auto_413493 ?auto_413494 )
      ( MAKE-8PILE ?auto_413489 ?auto_413490 ?auto_413491 ?auto_413492 ?auto_413493 ?auto_413494 ?auto_413495 ?auto_413496 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413506 - BLOCK
      ?auto_413507 - BLOCK
      ?auto_413508 - BLOCK
      ?auto_413509 - BLOCK
      ?auto_413510 - BLOCK
      ?auto_413511 - BLOCK
      ?auto_413512 - BLOCK
      ?auto_413513 - BLOCK
    )
    :vars
    (
      ?auto_413514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413513 ?auto_413514 ) ( ON-TABLE ?auto_413506 ) ( ON ?auto_413507 ?auto_413506 ) ( ON ?auto_413508 ?auto_413507 ) ( ON ?auto_413509 ?auto_413508 ) ( not ( = ?auto_413506 ?auto_413507 ) ) ( not ( = ?auto_413506 ?auto_413508 ) ) ( not ( = ?auto_413506 ?auto_413509 ) ) ( not ( = ?auto_413506 ?auto_413510 ) ) ( not ( = ?auto_413506 ?auto_413511 ) ) ( not ( = ?auto_413506 ?auto_413512 ) ) ( not ( = ?auto_413506 ?auto_413513 ) ) ( not ( = ?auto_413506 ?auto_413514 ) ) ( not ( = ?auto_413507 ?auto_413508 ) ) ( not ( = ?auto_413507 ?auto_413509 ) ) ( not ( = ?auto_413507 ?auto_413510 ) ) ( not ( = ?auto_413507 ?auto_413511 ) ) ( not ( = ?auto_413507 ?auto_413512 ) ) ( not ( = ?auto_413507 ?auto_413513 ) ) ( not ( = ?auto_413507 ?auto_413514 ) ) ( not ( = ?auto_413508 ?auto_413509 ) ) ( not ( = ?auto_413508 ?auto_413510 ) ) ( not ( = ?auto_413508 ?auto_413511 ) ) ( not ( = ?auto_413508 ?auto_413512 ) ) ( not ( = ?auto_413508 ?auto_413513 ) ) ( not ( = ?auto_413508 ?auto_413514 ) ) ( not ( = ?auto_413509 ?auto_413510 ) ) ( not ( = ?auto_413509 ?auto_413511 ) ) ( not ( = ?auto_413509 ?auto_413512 ) ) ( not ( = ?auto_413509 ?auto_413513 ) ) ( not ( = ?auto_413509 ?auto_413514 ) ) ( not ( = ?auto_413510 ?auto_413511 ) ) ( not ( = ?auto_413510 ?auto_413512 ) ) ( not ( = ?auto_413510 ?auto_413513 ) ) ( not ( = ?auto_413510 ?auto_413514 ) ) ( not ( = ?auto_413511 ?auto_413512 ) ) ( not ( = ?auto_413511 ?auto_413513 ) ) ( not ( = ?auto_413511 ?auto_413514 ) ) ( not ( = ?auto_413512 ?auto_413513 ) ) ( not ( = ?auto_413512 ?auto_413514 ) ) ( not ( = ?auto_413513 ?auto_413514 ) ) ( ON ?auto_413512 ?auto_413513 ) ( ON ?auto_413511 ?auto_413512 ) ( CLEAR ?auto_413509 ) ( ON ?auto_413510 ?auto_413511 ) ( CLEAR ?auto_413510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413506 ?auto_413507 ?auto_413508 ?auto_413509 ?auto_413510 )
      ( MAKE-8PILE ?auto_413506 ?auto_413507 ?auto_413508 ?auto_413509 ?auto_413510 ?auto_413511 ?auto_413512 ?auto_413513 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413523 - BLOCK
      ?auto_413524 - BLOCK
      ?auto_413525 - BLOCK
      ?auto_413526 - BLOCK
      ?auto_413527 - BLOCK
      ?auto_413528 - BLOCK
      ?auto_413529 - BLOCK
      ?auto_413530 - BLOCK
    )
    :vars
    (
      ?auto_413531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413530 ?auto_413531 ) ( ON-TABLE ?auto_413523 ) ( ON ?auto_413524 ?auto_413523 ) ( ON ?auto_413525 ?auto_413524 ) ( ON ?auto_413526 ?auto_413525 ) ( not ( = ?auto_413523 ?auto_413524 ) ) ( not ( = ?auto_413523 ?auto_413525 ) ) ( not ( = ?auto_413523 ?auto_413526 ) ) ( not ( = ?auto_413523 ?auto_413527 ) ) ( not ( = ?auto_413523 ?auto_413528 ) ) ( not ( = ?auto_413523 ?auto_413529 ) ) ( not ( = ?auto_413523 ?auto_413530 ) ) ( not ( = ?auto_413523 ?auto_413531 ) ) ( not ( = ?auto_413524 ?auto_413525 ) ) ( not ( = ?auto_413524 ?auto_413526 ) ) ( not ( = ?auto_413524 ?auto_413527 ) ) ( not ( = ?auto_413524 ?auto_413528 ) ) ( not ( = ?auto_413524 ?auto_413529 ) ) ( not ( = ?auto_413524 ?auto_413530 ) ) ( not ( = ?auto_413524 ?auto_413531 ) ) ( not ( = ?auto_413525 ?auto_413526 ) ) ( not ( = ?auto_413525 ?auto_413527 ) ) ( not ( = ?auto_413525 ?auto_413528 ) ) ( not ( = ?auto_413525 ?auto_413529 ) ) ( not ( = ?auto_413525 ?auto_413530 ) ) ( not ( = ?auto_413525 ?auto_413531 ) ) ( not ( = ?auto_413526 ?auto_413527 ) ) ( not ( = ?auto_413526 ?auto_413528 ) ) ( not ( = ?auto_413526 ?auto_413529 ) ) ( not ( = ?auto_413526 ?auto_413530 ) ) ( not ( = ?auto_413526 ?auto_413531 ) ) ( not ( = ?auto_413527 ?auto_413528 ) ) ( not ( = ?auto_413527 ?auto_413529 ) ) ( not ( = ?auto_413527 ?auto_413530 ) ) ( not ( = ?auto_413527 ?auto_413531 ) ) ( not ( = ?auto_413528 ?auto_413529 ) ) ( not ( = ?auto_413528 ?auto_413530 ) ) ( not ( = ?auto_413528 ?auto_413531 ) ) ( not ( = ?auto_413529 ?auto_413530 ) ) ( not ( = ?auto_413529 ?auto_413531 ) ) ( not ( = ?auto_413530 ?auto_413531 ) ) ( ON ?auto_413529 ?auto_413530 ) ( ON ?auto_413528 ?auto_413529 ) ( CLEAR ?auto_413526 ) ( ON ?auto_413527 ?auto_413528 ) ( CLEAR ?auto_413527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413523 ?auto_413524 ?auto_413525 ?auto_413526 ?auto_413527 )
      ( MAKE-8PILE ?auto_413523 ?auto_413524 ?auto_413525 ?auto_413526 ?auto_413527 ?auto_413528 ?auto_413529 ?auto_413530 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413540 - BLOCK
      ?auto_413541 - BLOCK
      ?auto_413542 - BLOCK
      ?auto_413543 - BLOCK
      ?auto_413544 - BLOCK
      ?auto_413545 - BLOCK
      ?auto_413546 - BLOCK
      ?auto_413547 - BLOCK
    )
    :vars
    (
      ?auto_413548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413547 ?auto_413548 ) ( ON-TABLE ?auto_413540 ) ( ON ?auto_413541 ?auto_413540 ) ( ON ?auto_413542 ?auto_413541 ) ( not ( = ?auto_413540 ?auto_413541 ) ) ( not ( = ?auto_413540 ?auto_413542 ) ) ( not ( = ?auto_413540 ?auto_413543 ) ) ( not ( = ?auto_413540 ?auto_413544 ) ) ( not ( = ?auto_413540 ?auto_413545 ) ) ( not ( = ?auto_413540 ?auto_413546 ) ) ( not ( = ?auto_413540 ?auto_413547 ) ) ( not ( = ?auto_413540 ?auto_413548 ) ) ( not ( = ?auto_413541 ?auto_413542 ) ) ( not ( = ?auto_413541 ?auto_413543 ) ) ( not ( = ?auto_413541 ?auto_413544 ) ) ( not ( = ?auto_413541 ?auto_413545 ) ) ( not ( = ?auto_413541 ?auto_413546 ) ) ( not ( = ?auto_413541 ?auto_413547 ) ) ( not ( = ?auto_413541 ?auto_413548 ) ) ( not ( = ?auto_413542 ?auto_413543 ) ) ( not ( = ?auto_413542 ?auto_413544 ) ) ( not ( = ?auto_413542 ?auto_413545 ) ) ( not ( = ?auto_413542 ?auto_413546 ) ) ( not ( = ?auto_413542 ?auto_413547 ) ) ( not ( = ?auto_413542 ?auto_413548 ) ) ( not ( = ?auto_413543 ?auto_413544 ) ) ( not ( = ?auto_413543 ?auto_413545 ) ) ( not ( = ?auto_413543 ?auto_413546 ) ) ( not ( = ?auto_413543 ?auto_413547 ) ) ( not ( = ?auto_413543 ?auto_413548 ) ) ( not ( = ?auto_413544 ?auto_413545 ) ) ( not ( = ?auto_413544 ?auto_413546 ) ) ( not ( = ?auto_413544 ?auto_413547 ) ) ( not ( = ?auto_413544 ?auto_413548 ) ) ( not ( = ?auto_413545 ?auto_413546 ) ) ( not ( = ?auto_413545 ?auto_413547 ) ) ( not ( = ?auto_413545 ?auto_413548 ) ) ( not ( = ?auto_413546 ?auto_413547 ) ) ( not ( = ?auto_413546 ?auto_413548 ) ) ( not ( = ?auto_413547 ?auto_413548 ) ) ( ON ?auto_413546 ?auto_413547 ) ( ON ?auto_413545 ?auto_413546 ) ( ON ?auto_413544 ?auto_413545 ) ( CLEAR ?auto_413542 ) ( ON ?auto_413543 ?auto_413544 ) ( CLEAR ?auto_413543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413540 ?auto_413541 ?auto_413542 ?auto_413543 )
      ( MAKE-8PILE ?auto_413540 ?auto_413541 ?auto_413542 ?auto_413543 ?auto_413544 ?auto_413545 ?auto_413546 ?auto_413547 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413557 - BLOCK
      ?auto_413558 - BLOCK
      ?auto_413559 - BLOCK
      ?auto_413560 - BLOCK
      ?auto_413561 - BLOCK
      ?auto_413562 - BLOCK
      ?auto_413563 - BLOCK
      ?auto_413564 - BLOCK
    )
    :vars
    (
      ?auto_413565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413564 ?auto_413565 ) ( ON-TABLE ?auto_413557 ) ( ON ?auto_413558 ?auto_413557 ) ( ON ?auto_413559 ?auto_413558 ) ( not ( = ?auto_413557 ?auto_413558 ) ) ( not ( = ?auto_413557 ?auto_413559 ) ) ( not ( = ?auto_413557 ?auto_413560 ) ) ( not ( = ?auto_413557 ?auto_413561 ) ) ( not ( = ?auto_413557 ?auto_413562 ) ) ( not ( = ?auto_413557 ?auto_413563 ) ) ( not ( = ?auto_413557 ?auto_413564 ) ) ( not ( = ?auto_413557 ?auto_413565 ) ) ( not ( = ?auto_413558 ?auto_413559 ) ) ( not ( = ?auto_413558 ?auto_413560 ) ) ( not ( = ?auto_413558 ?auto_413561 ) ) ( not ( = ?auto_413558 ?auto_413562 ) ) ( not ( = ?auto_413558 ?auto_413563 ) ) ( not ( = ?auto_413558 ?auto_413564 ) ) ( not ( = ?auto_413558 ?auto_413565 ) ) ( not ( = ?auto_413559 ?auto_413560 ) ) ( not ( = ?auto_413559 ?auto_413561 ) ) ( not ( = ?auto_413559 ?auto_413562 ) ) ( not ( = ?auto_413559 ?auto_413563 ) ) ( not ( = ?auto_413559 ?auto_413564 ) ) ( not ( = ?auto_413559 ?auto_413565 ) ) ( not ( = ?auto_413560 ?auto_413561 ) ) ( not ( = ?auto_413560 ?auto_413562 ) ) ( not ( = ?auto_413560 ?auto_413563 ) ) ( not ( = ?auto_413560 ?auto_413564 ) ) ( not ( = ?auto_413560 ?auto_413565 ) ) ( not ( = ?auto_413561 ?auto_413562 ) ) ( not ( = ?auto_413561 ?auto_413563 ) ) ( not ( = ?auto_413561 ?auto_413564 ) ) ( not ( = ?auto_413561 ?auto_413565 ) ) ( not ( = ?auto_413562 ?auto_413563 ) ) ( not ( = ?auto_413562 ?auto_413564 ) ) ( not ( = ?auto_413562 ?auto_413565 ) ) ( not ( = ?auto_413563 ?auto_413564 ) ) ( not ( = ?auto_413563 ?auto_413565 ) ) ( not ( = ?auto_413564 ?auto_413565 ) ) ( ON ?auto_413563 ?auto_413564 ) ( ON ?auto_413562 ?auto_413563 ) ( ON ?auto_413561 ?auto_413562 ) ( CLEAR ?auto_413559 ) ( ON ?auto_413560 ?auto_413561 ) ( CLEAR ?auto_413560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413557 ?auto_413558 ?auto_413559 ?auto_413560 )
      ( MAKE-8PILE ?auto_413557 ?auto_413558 ?auto_413559 ?auto_413560 ?auto_413561 ?auto_413562 ?auto_413563 ?auto_413564 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413574 - BLOCK
      ?auto_413575 - BLOCK
      ?auto_413576 - BLOCK
      ?auto_413577 - BLOCK
      ?auto_413578 - BLOCK
      ?auto_413579 - BLOCK
      ?auto_413580 - BLOCK
      ?auto_413581 - BLOCK
    )
    :vars
    (
      ?auto_413582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413581 ?auto_413582 ) ( ON-TABLE ?auto_413574 ) ( ON ?auto_413575 ?auto_413574 ) ( not ( = ?auto_413574 ?auto_413575 ) ) ( not ( = ?auto_413574 ?auto_413576 ) ) ( not ( = ?auto_413574 ?auto_413577 ) ) ( not ( = ?auto_413574 ?auto_413578 ) ) ( not ( = ?auto_413574 ?auto_413579 ) ) ( not ( = ?auto_413574 ?auto_413580 ) ) ( not ( = ?auto_413574 ?auto_413581 ) ) ( not ( = ?auto_413574 ?auto_413582 ) ) ( not ( = ?auto_413575 ?auto_413576 ) ) ( not ( = ?auto_413575 ?auto_413577 ) ) ( not ( = ?auto_413575 ?auto_413578 ) ) ( not ( = ?auto_413575 ?auto_413579 ) ) ( not ( = ?auto_413575 ?auto_413580 ) ) ( not ( = ?auto_413575 ?auto_413581 ) ) ( not ( = ?auto_413575 ?auto_413582 ) ) ( not ( = ?auto_413576 ?auto_413577 ) ) ( not ( = ?auto_413576 ?auto_413578 ) ) ( not ( = ?auto_413576 ?auto_413579 ) ) ( not ( = ?auto_413576 ?auto_413580 ) ) ( not ( = ?auto_413576 ?auto_413581 ) ) ( not ( = ?auto_413576 ?auto_413582 ) ) ( not ( = ?auto_413577 ?auto_413578 ) ) ( not ( = ?auto_413577 ?auto_413579 ) ) ( not ( = ?auto_413577 ?auto_413580 ) ) ( not ( = ?auto_413577 ?auto_413581 ) ) ( not ( = ?auto_413577 ?auto_413582 ) ) ( not ( = ?auto_413578 ?auto_413579 ) ) ( not ( = ?auto_413578 ?auto_413580 ) ) ( not ( = ?auto_413578 ?auto_413581 ) ) ( not ( = ?auto_413578 ?auto_413582 ) ) ( not ( = ?auto_413579 ?auto_413580 ) ) ( not ( = ?auto_413579 ?auto_413581 ) ) ( not ( = ?auto_413579 ?auto_413582 ) ) ( not ( = ?auto_413580 ?auto_413581 ) ) ( not ( = ?auto_413580 ?auto_413582 ) ) ( not ( = ?auto_413581 ?auto_413582 ) ) ( ON ?auto_413580 ?auto_413581 ) ( ON ?auto_413579 ?auto_413580 ) ( ON ?auto_413578 ?auto_413579 ) ( ON ?auto_413577 ?auto_413578 ) ( CLEAR ?auto_413575 ) ( ON ?auto_413576 ?auto_413577 ) ( CLEAR ?auto_413576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413574 ?auto_413575 ?auto_413576 )
      ( MAKE-8PILE ?auto_413574 ?auto_413575 ?auto_413576 ?auto_413577 ?auto_413578 ?auto_413579 ?auto_413580 ?auto_413581 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413591 - BLOCK
      ?auto_413592 - BLOCK
      ?auto_413593 - BLOCK
      ?auto_413594 - BLOCK
      ?auto_413595 - BLOCK
      ?auto_413596 - BLOCK
      ?auto_413597 - BLOCK
      ?auto_413598 - BLOCK
    )
    :vars
    (
      ?auto_413599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413598 ?auto_413599 ) ( ON-TABLE ?auto_413591 ) ( ON ?auto_413592 ?auto_413591 ) ( not ( = ?auto_413591 ?auto_413592 ) ) ( not ( = ?auto_413591 ?auto_413593 ) ) ( not ( = ?auto_413591 ?auto_413594 ) ) ( not ( = ?auto_413591 ?auto_413595 ) ) ( not ( = ?auto_413591 ?auto_413596 ) ) ( not ( = ?auto_413591 ?auto_413597 ) ) ( not ( = ?auto_413591 ?auto_413598 ) ) ( not ( = ?auto_413591 ?auto_413599 ) ) ( not ( = ?auto_413592 ?auto_413593 ) ) ( not ( = ?auto_413592 ?auto_413594 ) ) ( not ( = ?auto_413592 ?auto_413595 ) ) ( not ( = ?auto_413592 ?auto_413596 ) ) ( not ( = ?auto_413592 ?auto_413597 ) ) ( not ( = ?auto_413592 ?auto_413598 ) ) ( not ( = ?auto_413592 ?auto_413599 ) ) ( not ( = ?auto_413593 ?auto_413594 ) ) ( not ( = ?auto_413593 ?auto_413595 ) ) ( not ( = ?auto_413593 ?auto_413596 ) ) ( not ( = ?auto_413593 ?auto_413597 ) ) ( not ( = ?auto_413593 ?auto_413598 ) ) ( not ( = ?auto_413593 ?auto_413599 ) ) ( not ( = ?auto_413594 ?auto_413595 ) ) ( not ( = ?auto_413594 ?auto_413596 ) ) ( not ( = ?auto_413594 ?auto_413597 ) ) ( not ( = ?auto_413594 ?auto_413598 ) ) ( not ( = ?auto_413594 ?auto_413599 ) ) ( not ( = ?auto_413595 ?auto_413596 ) ) ( not ( = ?auto_413595 ?auto_413597 ) ) ( not ( = ?auto_413595 ?auto_413598 ) ) ( not ( = ?auto_413595 ?auto_413599 ) ) ( not ( = ?auto_413596 ?auto_413597 ) ) ( not ( = ?auto_413596 ?auto_413598 ) ) ( not ( = ?auto_413596 ?auto_413599 ) ) ( not ( = ?auto_413597 ?auto_413598 ) ) ( not ( = ?auto_413597 ?auto_413599 ) ) ( not ( = ?auto_413598 ?auto_413599 ) ) ( ON ?auto_413597 ?auto_413598 ) ( ON ?auto_413596 ?auto_413597 ) ( ON ?auto_413595 ?auto_413596 ) ( ON ?auto_413594 ?auto_413595 ) ( CLEAR ?auto_413592 ) ( ON ?auto_413593 ?auto_413594 ) ( CLEAR ?auto_413593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413591 ?auto_413592 ?auto_413593 )
      ( MAKE-8PILE ?auto_413591 ?auto_413592 ?auto_413593 ?auto_413594 ?auto_413595 ?auto_413596 ?auto_413597 ?auto_413598 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413608 - BLOCK
      ?auto_413609 - BLOCK
      ?auto_413610 - BLOCK
      ?auto_413611 - BLOCK
      ?auto_413612 - BLOCK
      ?auto_413613 - BLOCK
      ?auto_413614 - BLOCK
      ?auto_413615 - BLOCK
    )
    :vars
    (
      ?auto_413616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413615 ?auto_413616 ) ( ON-TABLE ?auto_413608 ) ( not ( = ?auto_413608 ?auto_413609 ) ) ( not ( = ?auto_413608 ?auto_413610 ) ) ( not ( = ?auto_413608 ?auto_413611 ) ) ( not ( = ?auto_413608 ?auto_413612 ) ) ( not ( = ?auto_413608 ?auto_413613 ) ) ( not ( = ?auto_413608 ?auto_413614 ) ) ( not ( = ?auto_413608 ?auto_413615 ) ) ( not ( = ?auto_413608 ?auto_413616 ) ) ( not ( = ?auto_413609 ?auto_413610 ) ) ( not ( = ?auto_413609 ?auto_413611 ) ) ( not ( = ?auto_413609 ?auto_413612 ) ) ( not ( = ?auto_413609 ?auto_413613 ) ) ( not ( = ?auto_413609 ?auto_413614 ) ) ( not ( = ?auto_413609 ?auto_413615 ) ) ( not ( = ?auto_413609 ?auto_413616 ) ) ( not ( = ?auto_413610 ?auto_413611 ) ) ( not ( = ?auto_413610 ?auto_413612 ) ) ( not ( = ?auto_413610 ?auto_413613 ) ) ( not ( = ?auto_413610 ?auto_413614 ) ) ( not ( = ?auto_413610 ?auto_413615 ) ) ( not ( = ?auto_413610 ?auto_413616 ) ) ( not ( = ?auto_413611 ?auto_413612 ) ) ( not ( = ?auto_413611 ?auto_413613 ) ) ( not ( = ?auto_413611 ?auto_413614 ) ) ( not ( = ?auto_413611 ?auto_413615 ) ) ( not ( = ?auto_413611 ?auto_413616 ) ) ( not ( = ?auto_413612 ?auto_413613 ) ) ( not ( = ?auto_413612 ?auto_413614 ) ) ( not ( = ?auto_413612 ?auto_413615 ) ) ( not ( = ?auto_413612 ?auto_413616 ) ) ( not ( = ?auto_413613 ?auto_413614 ) ) ( not ( = ?auto_413613 ?auto_413615 ) ) ( not ( = ?auto_413613 ?auto_413616 ) ) ( not ( = ?auto_413614 ?auto_413615 ) ) ( not ( = ?auto_413614 ?auto_413616 ) ) ( not ( = ?auto_413615 ?auto_413616 ) ) ( ON ?auto_413614 ?auto_413615 ) ( ON ?auto_413613 ?auto_413614 ) ( ON ?auto_413612 ?auto_413613 ) ( ON ?auto_413611 ?auto_413612 ) ( ON ?auto_413610 ?auto_413611 ) ( CLEAR ?auto_413608 ) ( ON ?auto_413609 ?auto_413610 ) ( CLEAR ?auto_413609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413608 ?auto_413609 )
      ( MAKE-8PILE ?auto_413608 ?auto_413609 ?auto_413610 ?auto_413611 ?auto_413612 ?auto_413613 ?auto_413614 ?auto_413615 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413625 - BLOCK
      ?auto_413626 - BLOCK
      ?auto_413627 - BLOCK
      ?auto_413628 - BLOCK
      ?auto_413629 - BLOCK
      ?auto_413630 - BLOCK
      ?auto_413631 - BLOCK
      ?auto_413632 - BLOCK
    )
    :vars
    (
      ?auto_413633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413632 ?auto_413633 ) ( ON-TABLE ?auto_413625 ) ( not ( = ?auto_413625 ?auto_413626 ) ) ( not ( = ?auto_413625 ?auto_413627 ) ) ( not ( = ?auto_413625 ?auto_413628 ) ) ( not ( = ?auto_413625 ?auto_413629 ) ) ( not ( = ?auto_413625 ?auto_413630 ) ) ( not ( = ?auto_413625 ?auto_413631 ) ) ( not ( = ?auto_413625 ?auto_413632 ) ) ( not ( = ?auto_413625 ?auto_413633 ) ) ( not ( = ?auto_413626 ?auto_413627 ) ) ( not ( = ?auto_413626 ?auto_413628 ) ) ( not ( = ?auto_413626 ?auto_413629 ) ) ( not ( = ?auto_413626 ?auto_413630 ) ) ( not ( = ?auto_413626 ?auto_413631 ) ) ( not ( = ?auto_413626 ?auto_413632 ) ) ( not ( = ?auto_413626 ?auto_413633 ) ) ( not ( = ?auto_413627 ?auto_413628 ) ) ( not ( = ?auto_413627 ?auto_413629 ) ) ( not ( = ?auto_413627 ?auto_413630 ) ) ( not ( = ?auto_413627 ?auto_413631 ) ) ( not ( = ?auto_413627 ?auto_413632 ) ) ( not ( = ?auto_413627 ?auto_413633 ) ) ( not ( = ?auto_413628 ?auto_413629 ) ) ( not ( = ?auto_413628 ?auto_413630 ) ) ( not ( = ?auto_413628 ?auto_413631 ) ) ( not ( = ?auto_413628 ?auto_413632 ) ) ( not ( = ?auto_413628 ?auto_413633 ) ) ( not ( = ?auto_413629 ?auto_413630 ) ) ( not ( = ?auto_413629 ?auto_413631 ) ) ( not ( = ?auto_413629 ?auto_413632 ) ) ( not ( = ?auto_413629 ?auto_413633 ) ) ( not ( = ?auto_413630 ?auto_413631 ) ) ( not ( = ?auto_413630 ?auto_413632 ) ) ( not ( = ?auto_413630 ?auto_413633 ) ) ( not ( = ?auto_413631 ?auto_413632 ) ) ( not ( = ?auto_413631 ?auto_413633 ) ) ( not ( = ?auto_413632 ?auto_413633 ) ) ( ON ?auto_413631 ?auto_413632 ) ( ON ?auto_413630 ?auto_413631 ) ( ON ?auto_413629 ?auto_413630 ) ( ON ?auto_413628 ?auto_413629 ) ( ON ?auto_413627 ?auto_413628 ) ( CLEAR ?auto_413625 ) ( ON ?auto_413626 ?auto_413627 ) ( CLEAR ?auto_413626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413625 ?auto_413626 )
      ( MAKE-8PILE ?auto_413625 ?auto_413626 ?auto_413627 ?auto_413628 ?auto_413629 ?auto_413630 ?auto_413631 ?auto_413632 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413642 - BLOCK
      ?auto_413643 - BLOCK
      ?auto_413644 - BLOCK
      ?auto_413645 - BLOCK
      ?auto_413646 - BLOCK
      ?auto_413647 - BLOCK
      ?auto_413648 - BLOCK
      ?auto_413649 - BLOCK
    )
    :vars
    (
      ?auto_413650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413649 ?auto_413650 ) ( not ( = ?auto_413642 ?auto_413643 ) ) ( not ( = ?auto_413642 ?auto_413644 ) ) ( not ( = ?auto_413642 ?auto_413645 ) ) ( not ( = ?auto_413642 ?auto_413646 ) ) ( not ( = ?auto_413642 ?auto_413647 ) ) ( not ( = ?auto_413642 ?auto_413648 ) ) ( not ( = ?auto_413642 ?auto_413649 ) ) ( not ( = ?auto_413642 ?auto_413650 ) ) ( not ( = ?auto_413643 ?auto_413644 ) ) ( not ( = ?auto_413643 ?auto_413645 ) ) ( not ( = ?auto_413643 ?auto_413646 ) ) ( not ( = ?auto_413643 ?auto_413647 ) ) ( not ( = ?auto_413643 ?auto_413648 ) ) ( not ( = ?auto_413643 ?auto_413649 ) ) ( not ( = ?auto_413643 ?auto_413650 ) ) ( not ( = ?auto_413644 ?auto_413645 ) ) ( not ( = ?auto_413644 ?auto_413646 ) ) ( not ( = ?auto_413644 ?auto_413647 ) ) ( not ( = ?auto_413644 ?auto_413648 ) ) ( not ( = ?auto_413644 ?auto_413649 ) ) ( not ( = ?auto_413644 ?auto_413650 ) ) ( not ( = ?auto_413645 ?auto_413646 ) ) ( not ( = ?auto_413645 ?auto_413647 ) ) ( not ( = ?auto_413645 ?auto_413648 ) ) ( not ( = ?auto_413645 ?auto_413649 ) ) ( not ( = ?auto_413645 ?auto_413650 ) ) ( not ( = ?auto_413646 ?auto_413647 ) ) ( not ( = ?auto_413646 ?auto_413648 ) ) ( not ( = ?auto_413646 ?auto_413649 ) ) ( not ( = ?auto_413646 ?auto_413650 ) ) ( not ( = ?auto_413647 ?auto_413648 ) ) ( not ( = ?auto_413647 ?auto_413649 ) ) ( not ( = ?auto_413647 ?auto_413650 ) ) ( not ( = ?auto_413648 ?auto_413649 ) ) ( not ( = ?auto_413648 ?auto_413650 ) ) ( not ( = ?auto_413649 ?auto_413650 ) ) ( ON ?auto_413648 ?auto_413649 ) ( ON ?auto_413647 ?auto_413648 ) ( ON ?auto_413646 ?auto_413647 ) ( ON ?auto_413645 ?auto_413646 ) ( ON ?auto_413644 ?auto_413645 ) ( ON ?auto_413643 ?auto_413644 ) ( ON ?auto_413642 ?auto_413643 ) ( CLEAR ?auto_413642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413642 )
      ( MAKE-8PILE ?auto_413642 ?auto_413643 ?auto_413644 ?auto_413645 ?auto_413646 ?auto_413647 ?auto_413648 ?auto_413649 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_413659 - BLOCK
      ?auto_413660 - BLOCK
      ?auto_413661 - BLOCK
      ?auto_413662 - BLOCK
      ?auto_413663 - BLOCK
      ?auto_413664 - BLOCK
      ?auto_413665 - BLOCK
      ?auto_413666 - BLOCK
    )
    :vars
    (
      ?auto_413667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413666 ?auto_413667 ) ( not ( = ?auto_413659 ?auto_413660 ) ) ( not ( = ?auto_413659 ?auto_413661 ) ) ( not ( = ?auto_413659 ?auto_413662 ) ) ( not ( = ?auto_413659 ?auto_413663 ) ) ( not ( = ?auto_413659 ?auto_413664 ) ) ( not ( = ?auto_413659 ?auto_413665 ) ) ( not ( = ?auto_413659 ?auto_413666 ) ) ( not ( = ?auto_413659 ?auto_413667 ) ) ( not ( = ?auto_413660 ?auto_413661 ) ) ( not ( = ?auto_413660 ?auto_413662 ) ) ( not ( = ?auto_413660 ?auto_413663 ) ) ( not ( = ?auto_413660 ?auto_413664 ) ) ( not ( = ?auto_413660 ?auto_413665 ) ) ( not ( = ?auto_413660 ?auto_413666 ) ) ( not ( = ?auto_413660 ?auto_413667 ) ) ( not ( = ?auto_413661 ?auto_413662 ) ) ( not ( = ?auto_413661 ?auto_413663 ) ) ( not ( = ?auto_413661 ?auto_413664 ) ) ( not ( = ?auto_413661 ?auto_413665 ) ) ( not ( = ?auto_413661 ?auto_413666 ) ) ( not ( = ?auto_413661 ?auto_413667 ) ) ( not ( = ?auto_413662 ?auto_413663 ) ) ( not ( = ?auto_413662 ?auto_413664 ) ) ( not ( = ?auto_413662 ?auto_413665 ) ) ( not ( = ?auto_413662 ?auto_413666 ) ) ( not ( = ?auto_413662 ?auto_413667 ) ) ( not ( = ?auto_413663 ?auto_413664 ) ) ( not ( = ?auto_413663 ?auto_413665 ) ) ( not ( = ?auto_413663 ?auto_413666 ) ) ( not ( = ?auto_413663 ?auto_413667 ) ) ( not ( = ?auto_413664 ?auto_413665 ) ) ( not ( = ?auto_413664 ?auto_413666 ) ) ( not ( = ?auto_413664 ?auto_413667 ) ) ( not ( = ?auto_413665 ?auto_413666 ) ) ( not ( = ?auto_413665 ?auto_413667 ) ) ( not ( = ?auto_413666 ?auto_413667 ) ) ( ON ?auto_413665 ?auto_413666 ) ( ON ?auto_413664 ?auto_413665 ) ( ON ?auto_413663 ?auto_413664 ) ( ON ?auto_413662 ?auto_413663 ) ( ON ?auto_413661 ?auto_413662 ) ( ON ?auto_413660 ?auto_413661 ) ( ON ?auto_413659 ?auto_413660 ) ( CLEAR ?auto_413659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413659 )
      ( MAKE-8PILE ?auto_413659 ?auto_413660 ?auto_413661 ?auto_413662 ?auto_413663 ?auto_413664 ?auto_413665 ?auto_413666 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413677 - BLOCK
      ?auto_413678 - BLOCK
      ?auto_413679 - BLOCK
      ?auto_413680 - BLOCK
      ?auto_413681 - BLOCK
      ?auto_413682 - BLOCK
      ?auto_413683 - BLOCK
      ?auto_413684 - BLOCK
      ?auto_413685 - BLOCK
    )
    :vars
    (
      ?auto_413686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413684 ) ( ON ?auto_413685 ?auto_413686 ) ( CLEAR ?auto_413685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413677 ) ( ON ?auto_413678 ?auto_413677 ) ( ON ?auto_413679 ?auto_413678 ) ( ON ?auto_413680 ?auto_413679 ) ( ON ?auto_413681 ?auto_413680 ) ( ON ?auto_413682 ?auto_413681 ) ( ON ?auto_413683 ?auto_413682 ) ( ON ?auto_413684 ?auto_413683 ) ( not ( = ?auto_413677 ?auto_413678 ) ) ( not ( = ?auto_413677 ?auto_413679 ) ) ( not ( = ?auto_413677 ?auto_413680 ) ) ( not ( = ?auto_413677 ?auto_413681 ) ) ( not ( = ?auto_413677 ?auto_413682 ) ) ( not ( = ?auto_413677 ?auto_413683 ) ) ( not ( = ?auto_413677 ?auto_413684 ) ) ( not ( = ?auto_413677 ?auto_413685 ) ) ( not ( = ?auto_413677 ?auto_413686 ) ) ( not ( = ?auto_413678 ?auto_413679 ) ) ( not ( = ?auto_413678 ?auto_413680 ) ) ( not ( = ?auto_413678 ?auto_413681 ) ) ( not ( = ?auto_413678 ?auto_413682 ) ) ( not ( = ?auto_413678 ?auto_413683 ) ) ( not ( = ?auto_413678 ?auto_413684 ) ) ( not ( = ?auto_413678 ?auto_413685 ) ) ( not ( = ?auto_413678 ?auto_413686 ) ) ( not ( = ?auto_413679 ?auto_413680 ) ) ( not ( = ?auto_413679 ?auto_413681 ) ) ( not ( = ?auto_413679 ?auto_413682 ) ) ( not ( = ?auto_413679 ?auto_413683 ) ) ( not ( = ?auto_413679 ?auto_413684 ) ) ( not ( = ?auto_413679 ?auto_413685 ) ) ( not ( = ?auto_413679 ?auto_413686 ) ) ( not ( = ?auto_413680 ?auto_413681 ) ) ( not ( = ?auto_413680 ?auto_413682 ) ) ( not ( = ?auto_413680 ?auto_413683 ) ) ( not ( = ?auto_413680 ?auto_413684 ) ) ( not ( = ?auto_413680 ?auto_413685 ) ) ( not ( = ?auto_413680 ?auto_413686 ) ) ( not ( = ?auto_413681 ?auto_413682 ) ) ( not ( = ?auto_413681 ?auto_413683 ) ) ( not ( = ?auto_413681 ?auto_413684 ) ) ( not ( = ?auto_413681 ?auto_413685 ) ) ( not ( = ?auto_413681 ?auto_413686 ) ) ( not ( = ?auto_413682 ?auto_413683 ) ) ( not ( = ?auto_413682 ?auto_413684 ) ) ( not ( = ?auto_413682 ?auto_413685 ) ) ( not ( = ?auto_413682 ?auto_413686 ) ) ( not ( = ?auto_413683 ?auto_413684 ) ) ( not ( = ?auto_413683 ?auto_413685 ) ) ( not ( = ?auto_413683 ?auto_413686 ) ) ( not ( = ?auto_413684 ?auto_413685 ) ) ( not ( = ?auto_413684 ?auto_413686 ) ) ( not ( = ?auto_413685 ?auto_413686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413685 ?auto_413686 )
      ( !STACK ?auto_413685 ?auto_413684 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413696 - BLOCK
      ?auto_413697 - BLOCK
      ?auto_413698 - BLOCK
      ?auto_413699 - BLOCK
      ?auto_413700 - BLOCK
      ?auto_413701 - BLOCK
      ?auto_413702 - BLOCK
      ?auto_413703 - BLOCK
      ?auto_413704 - BLOCK
    )
    :vars
    (
      ?auto_413705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_413703 ) ( ON ?auto_413704 ?auto_413705 ) ( CLEAR ?auto_413704 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_413696 ) ( ON ?auto_413697 ?auto_413696 ) ( ON ?auto_413698 ?auto_413697 ) ( ON ?auto_413699 ?auto_413698 ) ( ON ?auto_413700 ?auto_413699 ) ( ON ?auto_413701 ?auto_413700 ) ( ON ?auto_413702 ?auto_413701 ) ( ON ?auto_413703 ?auto_413702 ) ( not ( = ?auto_413696 ?auto_413697 ) ) ( not ( = ?auto_413696 ?auto_413698 ) ) ( not ( = ?auto_413696 ?auto_413699 ) ) ( not ( = ?auto_413696 ?auto_413700 ) ) ( not ( = ?auto_413696 ?auto_413701 ) ) ( not ( = ?auto_413696 ?auto_413702 ) ) ( not ( = ?auto_413696 ?auto_413703 ) ) ( not ( = ?auto_413696 ?auto_413704 ) ) ( not ( = ?auto_413696 ?auto_413705 ) ) ( not ( = ?auto_413697 ?auto_413698 ) ) ( not ( = ?auto_413697 ?auto_413699 ) ) ( not ( = ?auto_413697 ?auto_413700 ) ) ( not ( = ?auto_413697 ?auto_413701 ) ) ( not ( = ?auto_413697 ?auto_413702 ) ) ( not ( = ?auto_413697 ?auto_413703 ) ) ( not ( = ?auto_413697 ?auto_413704 ) ) ( not ( = ?auto_413697 ?auto_413705 ) ) ( not ( = ?auto_413698 ?auto_413699 ) ) ( not ( = ?auto_413698 ?auto_413700 ) ) ( not ( = ?auto_413698 ?auto_413701 ) ) ( not ( = ?auto_413698 ?auto_413702 ) ) ( not ( = ?auto_413698 ?auto_413703 ) ) ( not ( = ?auto_413698 ?auto_413704 ) ) ( not ( = ?auto_413698 ?auto_413705 ) ) ( not ( = ?auto_413699 ?auto_413700 ) ) ( not ( = ?auto_413699 ?auto_413701 ) ) ( not ( = ?auto_413699 ?auto_413702 ) ) ( not ( = ?auto_413699 ?auto_413703 ) ) ( not ( = ?auto_413699 ?auto_413704 ) ) ( not ( = ?auto_413699 ?auto_413705 ) ) ( not ( = ?auto_413700 ?auto_413701 ) ) ( not ( = ?auto_413700 ?auto_413702 ) ) ( not ( = ?auto_413700 ?auto_413703 ) ) ( not ( = ?auto_413700 ?auto_413704 ) ) ( not ( = ?auto_413700 ?auto_413705 ) ) ( not ( = ?auto_413701 ?auto_413702 ) ) ( not ( = ?auto_413701 ?auto_413703 ) ) ( not ( = ?auto_413701 ?auto_413704 ) ) ( not ( = ?auto_413701 ?auto_413705 ) ) ( not ( = ?auto_413702 ?auto_413703 ) ) ( not ( = ?auto_413702 ?auto_413704 ) ) ( not ( = ?auto_413702 ?auto_413705 ) ) ( not ( = ?auto_413703 ?auto_413704 ) ) ( not ( = ?auto_413703 ?auto_413705 ) ) ( not ( = ?auto_413704 ?auto_413705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_413704 ?auto_413705 )
      ( !STACK ?auto_413704 ?auto_413703 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413715 - BLOCK
      ?auto_413716 - BLOCK
      ?auto_413717 - BLOCK
      ?auto_413718 - BLOCK
      ?auto_413719 - BLOCK
      ?auto_413720 - BLOCK
      ?auto_413721 - BLOCK
      ?auto_413722 - BLOCK
      ?auto_413723 - BLOCK
    )
    :vars
    (
      ?auto_413724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413723 ?auto_413724 ) ( ON-TABLE ?auto_413715 ) ( ON ?auto_413716 ?auto_413715 ) ( ON ?auto_413717 ?auto_413716 ) ( ON ?auto_413718 ?auto_413717 ) ( ON ?auto_413719 ?auto_413718 ) ( ON ?auto_413720 ?auto_413719 ) ( ON ?auto_413721 ?auto_413720 ) ( not ( = ?auto_413715 ?auto_413716 ) ) ( not ( = ?auto_413715 ?auto_413717 ) ) ( not ( = ?auto_413715 ?auto_413718 ) ) ( not ( = ?auto_413715 ?auto_413719 ) ) ( not ( = ?auto_413715 ?auto_413720 ) ) ( not ( = ?auto_413715 ?auto_413721 ) ) ( not ( = ?auto_413715 ?auto_413722 ) ) ( not ( = ?auto_413715 ?auto_413723 ) ) ( not ( = ?auto_413715 ?auto_413724 ) ) ( not ( = ?auto_413716 ?auto_413717 ) ) ( not ( = ?auto_413716 ?auto_413718 ) ) ( not ( = ?auto_413716 ?auto_413719 ) ) ( not ( = ?auto_413716 ?auto_413720 ) ) ( not ( = ?auto_413716 ?auto_413721 ) ) ( not ( = ?auto_413716 ?auto_413722 ) ) ( not ( = ?auto_413716 ?auto_413723 ) ) ( not ( = ?auto_413716 ?auto_413724 ) ) ( not ( = ?auto_413717 ?auto_413718 ) ) ( not ( = ?auto_413717 ?auto_413719 ) ) ( not ( = ?auto_413717 ?auto_413720 ) ) ( not ( = ?auto_413717 ?auto_413721 ) ) ( not ( = ?auto_413717 ?auto_413722 ) ) ( not ( = ?auto_413717 ?auto_413723 ) ) ( not ( = ?auto_413717 ?auto_413724 ) ) ( not ( = ?auto_413718 ?auto_413719 ) ) ( not ( = ?auto_413718 ?auto_413720 ) ) ( not ( = ?auto_413718 ?auto_413721 ) ) ( not ( = ?auto_413718 ?auto_413722 ) ) ( not ( = ?auto_413718 ?auto_413723 ) ) ( not ( = ?auto_413718 ?auto_413724 ) ) ( not ( = ?auto_413719 ?auto_413720 ) ) ( not ( = ?auto_413719 ?auto_413721 ) ) ( not ( = ?auto_413719 ?auto_413722 ) ) ( not ( = ?auto_413719 ?auto_413723 ) ) ( not ( = ?auto_413719 ?auto_413724 ) ) ( not ( = ?auto_413720 ?auto_413721 ) ) ( not ( = ?auto_413720 ?auto_413722 ) ) ( not ( = ?auto_413720 ?auto_413723 ) ) ( not ( = ?auto_413720 ?auto_413724 ) ) ( not ( = ?auto_413721 ?auto_413722 ) ) ( not ( = ?auto_413721 ?auto_413723 ) ) ( not ( = ?auto_413721 ?auto_413724 ) ) ( not ( = ?auto_413722 ?auto_413723 ) ) ( not ( = ?auto_413722 ?auto_413724 ) ) ( not ( = ?auto_413723 ?auto_413724 ) ) ( CLEAR ?auto_413721 ) ( ON ?auto_413722 ?auto_413723 ) ( CLEAR ?auto_413722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_413715 ?auto_413716 ?auto_413717 ?auto_413718 ?auto_413719 ?auto_413720 ?auto_413721 ?auto_413722 )
      ( MAKE-9PILE ?auto_413715 ?auto_413716 ?auto_413717 ?auto_413718 ?auto_413719 ?auto_413720 ?auto_413721 ?auto_413722 ?auto_413723 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413734 - BLOCK
      ?auto_413735 - BLOCK
      ?auto_413736 - BLOCK
      ?auto_413737 - BLOCK
      ?auto_413738 - BLOCK
      ?auto_413739 - BLOCK
      ?auto_413740 - BLOCK
      ?auto_413741 - BLOCK
      ?auto_413742 - BLOCK
    )
    :vars
    (
      ?auto_413743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413742 ?auto_413743 ) ( ON-TABLE ?auto_413734 ) ( ON ?auto_413735 ?auto_413734 ) ( ON ?auto_413736 ?auto_413735 ) ( ON ?auto_413737 ?auto_413736 ) ( ON ?auto_413738 ?auto_413737 ) ( ON ?auto_413739 ?auto_413738 ) ( ON ?auto_413740 ?auto_413739 ) ( not ( = ?auto_413734 ?auto_413735 ) ) ( not ( = ?auto_413734 ?auto_413736 ) ) ( not ( = ?auto_413734 ?auto_413737 ) ) ( not ( = ?auto_413734 ?auto_413738 ) ) ( not ( = ?auto_413734 ?auto_413739 ) ) ( not ( = ?auto_413734 ?auto_413740 ) ) ( not ( = ?auto_413734 ?auto_413741 ) ) ( not ( = ?auto_413734 ?auto_413742 ) ) ( not ( = ?auto_413734 ?auto_413743 ) ) ( not ( = ?auto_413735 ?auto_413736 ) ) ( not ( = ?auto_413735 ?auto_413737 ) ) ( not ( = ?auto_413735 ?auto_413738 ) ) ( not ( = ?auto_413735 ?auto_413739 ) ) ( not ( = ?auto_413735 ?auto_413740 ) ) ( not ( = ?auto_413735 ?auto_413741 ) ) ( not ( = ?auto_413735 ?auto_413742 ) ) ( not ( = ?auto_413735 ?auto_413743 ) ) ( not ( = ?auto_413736 ?auto_413737 ) ) ( not ( = ?auto_413736 ?auto_413738 ) ) ( not ( = ?auto_413736 ?auto_413739 ) ) ( not ( = ?auto_413736 ?auto_413740 ) ) ( not ( = ?auto_413736 ?auto_413741 ) ) ( not ( = ?auto_413736 ?auto_413742 ) ) ( not ( = ?auto_413736 ?auto_413743 ) ) ( not ( = ?auto_413737 ?auto_413738 ) ) ( not ( = ?auto_413737 ?auto_413739 ) ) ( not ( = ?auto_413737 ?auto_413740 ) ) ( not ( = ?auto_413737 ?auto_413741 ) ) ( not ( = ?auto_413737 ?auto_413742 ) ) ( not ( = ?auto_413737 ?auto_413743 ) ) ( not ( = ?auto_413738 ?auto_413739 ) ) ( not ( = ?auto_413738 ?auto_413740 ) ) ( not ( = ?auto_413738 ?auto_413741 ) ) ( not ( = ?auto_413738 ?auto_413742 ) ) ( not ( = ?auto_413738 ?auto_413743 ) ) ( not ( = ?auto_413739 ?auto_413740 ) ) ( not ( = ?auto_413739 ?auto_413741 ) ) ( not ( = ?auto_413739 ?auto_413742 ) ) ( not ( = ?auto_413739 ?auto_413743 ) ) ( not ( = ?auto_413740 ?auto_413741 ) ) ( not ( = ?auto_413740 ?auto_413742 ) ) ( not ( = ?auto_413740 ?auto_413743 ) ) ( not ( = ?auto_413741 ?auto_413742 ) ) ( not ( = ?auto_413741 ?auto_413743 ) ) ( not ( = ?auto_413742 ?auto_413743 ) ) ( CLEAR ?auto_413740 ) ( ON ?auto_413741 ?auto_413742 ) ( CLEAR ?auto_413741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_413734 ?auto_413735 ?auto_413736 ?auto_413737 ?auto_413738 ?auto_413739 ?auto_413740 ?auto_413741 )
      ( MAKE-9PILE ?auto_413734 ?auto_413735 ?auto_413736 ?auto_413737 ?auto_413738 ?auto_413739 ?auto_413740 ?auto_413741 ?auto_413742 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413753 - BLOCK
      ?auto_413754 - BLOCK
      ?auto_413755 - BLOCK
      ?auto_413756 - BLOCK
      ?auto_413757 - BLOCK
      ?auto_413758 - BLOCK
      ?auto_413759 - BLOCK
      ?auto_413760 - BLOCK
      ?auto_413761 - BLOCK
    )
    :vars
    (
      ?auto_413762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413761 ?auto_413762 ) ( ON-TABLE ?auto_413753 ) ( ON ?auto_413754 ?auto_413753 ) ( ON ?auto_413755 ?auto_413754 ) ( ON ?auto_413756 ?auto_413755 ) ( ON ?auto_413757 ?auto_413756 ) ( ON ?auto_413758 ?auto_413757 ) ( not ( = ?auto_413753 ?auto_413754 ) ) ( not ( = ?auto_413753 ?auto_413755 ) ) ( not ( = ?auto_413753 ?auto_413756 ) ) ( not ( = ?auto_413753 ?auto_413757 ) ) ( not ( = ?auto_413753 ?auto_413758 ) ) ( not ( = ?auto_413753 ?auto_413759 ) ) ( not ( = ?auto_413753 ?auto_413760 ) ) ( not ( = ?auto_413753 ?auto_413761 ) ) ( not ( = ?auto_413753 ?auto_413762 ) ) ( not ( = ?auto_413754 ?auto_413755 ) ) ( not ( = ?auto_413754 ?auto_413756 ) ) ( not ( = ?auto_413754 ?auto_413757 ) ) ( not ( = ?auto_413754 ?auto_413758 ) ) ( not ( = ?auto_413754 ?auto_413759 ) ) ( not ( = ?auto_413754 ?auto_413760 ) ) ( not ( = ?auto_413754 ?auto_413761 ) ) ( not ( = ?auto_413754 ?auto_413762 ) ) ( not ( = ?auto_413755 ?auto_413756 ) ) ( not ( = ?auto_413755 ?auto_413757 ) ) ( not ( = ?auto_413755 ?auto_413758 ) ) ( not ( = ?auto_413755 ?auto_413759 ) ) ( not ( = ?auto_413755 ?auto_413760 ) ) ( not ( = ?auto_413755 ?auto_413761 ) ) ( not ( = ?auto_413755 ?auto_413762 ) ) ( not ( = ?auto_413756 ?auto_413757 ) ) ( not ( = ?auto_413756 ?auto_413758 ) ) ( not ( = ?auto_413756 ?auto_413759 ) ) ( not ( = ?auto_413756 ?auto_413760 ) ) ( not ( = ?auto_413756 ?auto_413761 ) ) ( not ( = ?auto_413756 ?auto_413762 ) ) ( not ( = ?auto_413757 ?auto_413758 ) ) ( not ( = ?auto_413757 ?auto_413759 ) ) ( not ( = ?auto_413757 ?auto_413760 ) ) ( not ( = ?auto_413757 ?auto_413761 ) ) ( not ( = ?auto_413757 ?auto_413762 ) ) ( not ( = ?auto_413758 ?auto_413759 ) ) ( not ( = ?auto_413758 ?auto_413760 ) ) ( not ( = ?auto_413758 ?auto_413761 ) ) ( not ( = ?auto_413758 ?auto_413762 ) ) ( not ( = ?auto_413759 ?auto_413760 ) ) ( not ( = ?auto_413759 ?auto_413761 ) ) ( not ( = ?auto_413759 ?auto_413762 ) ) ( not ( = ?auto_413760 ?auto_413761 ) ) ( not ( = ?auto_413760 ?auto_413762 ) ) ( not ( = ?auto_413761 ?auto_413762 ) ) ( ON ?auto_413760 ?auto_413761 ) ( CLEAR ?auto_413758 ) ( ON ?auto_413759 ?auto_413760 ) ( CLEAR ?auto_413759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_413753 ?auto_413754 ?auto_413755 ?auto_413756 ?auto_413757 ?auto_413758 ?auto_413759 )
      ( MAKE-9PILE ?auto_413753 ?auto_413754 ?auto_413755 ?auto_413756 ?auto_413757 ?auto_413758 ?auto_413759 ?auto_413760 ?auto_413761 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413772 - BLOCK
      ?auto_413773 - BLOCK
      ?auto_413774 - BLOCK
      ?auto_413775 - BLOCK
      ?auto_413776 - BLOCK
      ?auto_413777 - BLOCK
      ?auto_413778 - BLOCK
      ?auto_413779 - BLOCK
      ?auto_413780 - BLOCK
    )
    :vars
    (
      ?auto_413781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413780 ?auto_413781 ) ( ON-TABLE ?auto_413772 ) ( ON ?auto_413773 ?auto_413772 ) ( ON ?auto_413774 ?auto_413773 ) ( ON ?auto_413775 ?auto_413774 ) ( ON ?auto_413776 ?auto_413775 ) ( ON ?auto_413777 ?auto_413776 ) ( not ( = ?auto_413772 ?auto_413773 ) ) ( not ( = ?auto_413772 ?auto_413774 ) ) ( not ( = ?auto_413772 ?auto_413775 ) ) ( not ( = ?auto_413772 ?auto_413776 ) ) ( not ( = ?auto_413772 ?auto_413777 ) ) ( not ( = ?auto_413772 ?auto_413778 ) ) ( not ( = ?auto_413772 ?auto_413779 ) ) ( not ( = ?auto_413772 ?auto_413780 ) ) ( not ( = ?auto_413772 ?auto_413781 ) ) ( not ( = ?auto_413773 ?auto_413774 ) ) ( not ( = ?auto_413773 ?auto_413775 ) ) ( not ( = ?auto_413773 ?auto_413776 ) ) ( not ( = ?auto_413773 ?auto_413777 ) ) ( not ( = ?auto_413773 ?auto_413778 ) ) ( not ( = ?auto_413773 ?auto_413779 ) ) ( not ( = ?auto_413773 ?auto_413780 ) ) ( not ( = ?auto_413773 ?auto_413781 ) ) ( not ( = ?auto_413774 ?auto_413775 ) ) ( not ( = ?auto_413774 ?auto_413776 ) ) ( not ( = ?auto_413774 ?auto_413777 ) ) ( not ( = ?auto_413774 ?auto_413778 ) ) ( not ( = ?auto_413774 ?auto_413779 ) ) ( not ( = ?auto_413774 ?auto_413780 ) ) ( not ( = ?auto_413774 ?auto_413781 ) ) ( not ( = ?auto_413775 ?auto_413776 ) ) ( not ( = ?auto_413775 ?auto_413777 ) ) ( not ( = ?auto_413775 ?auto_413778 ) ) ( not ( = ?auto_413775 ?auto_413779 ) ) ( not ( = ?auto_413775 ?auto_413780 ) ) ( not ( = ?auto_413775 ?auto_413781 ) ) ( not ( = ?auto_413776 ?auto_413777 ) ) ( not ( = ?auto_413776 ?auto_413778 ) ) ( not ( = ?auto_413776 ?auto_413779 ) ) ( not ( = ?auto_413776 ?auto_413780 ) ) ( not ( = ?auto_413776 ?auto_413781 ) ) ( not ( = ?auto_413777 ?auto_413778 ) ) ( not ( = ?auto_413777 ?auto_413779 ) ) ( not ( = ?auto_413777 ?auto_413780 ) ) ( not ( = ?auto_413777 ?auto_413781 ) ) ( not ( = ?auto_413778 ?auto_413779 ) ) ( not ( = ?auto_413778 ?auto_413780 ) ) ( not ( = ?auto_413778 ?auto_413781 ) ) ( not ( = ?auto_413779 ?auto_413780 ) ) ( not ( = ?auto_413779 ?auto_413781 ) ) ( not ( = ?auto_413780 ?auto_413781 ) ) ( ON ?auto_413779 ?auto_413780 ) ( CLEAR ?auto_413777 ) ( ON ?auto_413778 ?auto_413779 ) ( CLEAR ?auto_413778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_413772 ?auto_413773 ?auto_413774 ?auto_413775 ?auto_413776 ?auto_413777 ?auto_413778 )
      ( MAKE-9PILE ?auto_413772 ?auto_413773 ?auto_413774 ?auto_413775 ?auto_413776 ?auto_413777 ?auto_413778 ?auto_413779 ?auto_413780 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413791 - BLOCK
      ?auto_413792 - BLOCK
      ?auto_413793 - BLOCK
      ?auto_413794 - BLOCK
      ?auto_413795 - BLOCK
      ?auto_413796 - BLOCK
      ?auto_413797 - BLOCK
      ?auto_413798 - BLOCK
      ?auto_413799 - BLOCK
    )
    :vars
    (
      ?auto_413800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413799 ?auto_413800 ) ( ON-TABLE ?auto_413791 ) ( ON ?auto_413792 ?auto_413791 ) ( ON ?auto_413793 ?auto_413792 ) ( ON ?auto_413794 ?auto_413793 ) ( ON ?auto_413795 ?auto_413794 ) ( not ( = ?auto_413791 ?auto_413792 ) ) ( not ( = ?auto_413791 ?auto_413793 ) ) ( not ( = ?auto_413791 ?auto_413794 ) ) ( not ( = ?auto_413791 ?auto_413795 ) ) ( not ( = ?auto_413791 ?auto_413796 ) ) ( not ( = ?auto_413791 ?auto_413797 ) ) ( not ( = ?auto_413791 ?auto_413798 ) ) ( not ( = ?auto_413791 ?auto_413799 ) ) ( not ( = ?auto_413791 ?auto_413800 ) ) ( not ( = ?auto_413792 ?auto_413793 ) ) ( not ( = ?auto_413792 ?auto_413794 ) ) ( not ( = ?auto_413792 ?auto_413795 ) ) ( not ( = ?auto_413792 ?auto_413796 ) ) ( not ( = ?auto_413792 ?auto_413797 ) ) ( not ( = ?auto_413792 ?auto_413798 ) ) ( not ( = ?auto_413792 ?auto_413799 ) ) ( not ( = ?auto_413792 ?auto_413800 ) ) ( not ( = ?auto_413793 ?auto_413794 ) ) ( not ( = ?auto_413793 ?auto_413795 ) ) ( not ( = ?auto_413793 ?auto_413796 ) ) ( not ( = ?auto_413793 ?auto_413797 ) ) ( not ( = ?auto_413793 ?auto_413798 ) ) ( not ( = ?auto_413793 ?auto_413799 ) ) ( not ( = ?auto_413793 ?auto_413800 ) ) ( not ( = ?auto_413794 ?auto_413795 ) ) ( not ( = ?auto_413794 ?auto_413796 ) ) ( not ( = ?auto_413794 ?auto_413797 ) ) ( not ( = ?auto_413794 ?auto_413798 ) ) ( not ( = ?auto_413794 ?auto_413799 ) ) ( not ( = ?auto_413794 ?auto_413800 ) ) ( not ( = ?auto_413795 ?auto_413796 ) ) ( not ( = ?auto_413795 ?auto_413797 ) ) ( not ( = ?auto_413795 ?auto_413798 ) ) ( not ( = ?auto_413795 ?auto_413799 ) ) ( not ( = ?auto_413795 ?auto_413800 ) ) ( not ( = ?auto_413796 ?auto_413797 ) ) ( not ( = ?auto_413796 ?auto_413798 ) ) ( not ( = ?auto_413796 ?auto_413799 ) ) ( not ( = ?auto_413796 ?auto_413800 ) ) ( not ( = ?auto_413797 ?auto_413798 ) ) ( not ( = ?auto_413797 ?auto_413799 ) ) ( not ( = ?auto_413797 ?auto_413800 ) ) ( not ( = ?auto_413798 ?auto_413799 ) ) ( not ( = ?auto_413798 ?auto_413800 ) ) ( not ( = ?auto_413799 ?auto_413800 ) ) ( ON ?auto_413798 ?auto_413799 ) ( ON ?auto_413797 ?auto_413798 ) ( CLEAR ?auto_413795 ) ( ON ?auto_413796 ?auto_413797 ) ( CLEAR ?auto_413796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_413791 ?auto_413792 ?auto_413793 ?auto_413794 ?auto_413795 ?auto_413796 )
      ( MAKE-9PILE ?auto_413791 ?auto_413792 ?auto_413793 ?auto_413794 ?auto_413795 ?auto_413796 ?auto_413797 ?auto_413798 ?auto_413799 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413810 - BLOCK
      ?auto_413811 - BLOCK
      ?auto_413812 - BLOCK
      ?auto_413813 - BLOCK
      ?auto_413814 - BLOCK
      ?auto_413815 - BLOCK
      ?auto_413816 - BLOCK
      ?auto_413817 - BLOCK
      ?auto_413818 - BLOCK
    )
    :vars
    (
      ?auto_413819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413818 ?auto_413819 ) ( ON-TABLE ?auto_413810 ) ( ON ?auto_413811 ?auto_413810 ) ( ON ?auto_413812 ?auto_413811 ) ( ON ?auto_413813 ?auto_413812 ) ( ON ?auto_413814 ?auto_413813 ) ( not ( = ?auto_413810 ?auto_413811 ) ) ( not ( = ?auto_413810 ?auto_413812 ) ) ( not ( = ?auto_413810 ?auto_413813 ) ) ( not ( = ?auto_413810 ?auto_413814 ) ) ( not ( = ?auto_413810 ?auto_413815 ) ) ( not ( = ?auto_413810 ?auto_413816 ) ) ( not ( = ?auto_413810 ?auto_413817 ) ) ( not ( = ?auto_413810 ?auto_413818 ) ) ( not ( = ?auto_413810 ?auto_413819 ) ) ( not ( = ?auto_413811 ?auto_413812 ) ) ( not ( = ?auto_413811 ?auto_413813 ) ) ( not ( = ?auto_413811 ?auto_413814 ) ) ( not ( = ?auto_413811 ?auto_413815 ) ) ( not ( = ?auto_413811 ?auto_413816 ) ) ( not ( = ?auto_413811 ?auto_413817 ) ) ( not ( = ?auto_413811 ?auto_413818 ) ) ( not ( = ?auto_413811 ?auto_413819 ) ) ( not ( = ?auto_413812 ?auto_413813 ) ) ( not ( = ?auto_413812 ?auto_413814 ) ) ( not ( = ?auto_413812 ?auto_413815 ) ) ( not ( = ?auto_413812 ?auto_413816 ) ) ( not ( = ?auto_413812 ?auto_413817 ) ) ( not ( = ?auto_413812 ?auto_413818 ) ) ( not ( = ?auto_413812 ?auto_413819 ) ) ( not ( = ?auto_413813 ?auto_413814 ) ) ( not ( = ?auto_413813 ?auto_413815 ) ) ( not ( = ?auto_413813 ?auto_413816 ) ) ( not ( = ?auto_413813 ?auto_413817 ) ) ( not ( = ?auto_413813 ?auto_413818 ) ) ( not ( = ?auto_413813 ?auto_413819 ) ) ( not ( = ?auto_413814 ?auto_413815 ) ) ( not ( = ?auto_413814 ?auto_413816 ) ) ( not ( = ?auto_413814 ?auto_413817 ) ) ( not ( = ?auto_413814 ?auto_413818 ) ) ( not ( = ?auto_413814 ?auto_413819 ) ) ( not ( = ?auto_413815 ?auto_413816 ) ) ( not ( = ?auto_413815 ?auto_413817 ) ) ( not ( = ?auto_413815 ?auto_413818 ) ) ( not ( = ?auto_413815 ?auto_413819 ) ) ( not ( = ?auto_413816 ?auto_413817 ) ) ( not ( = ?auto_413816 ?auto_413818 ) ) ( not ( = ?auto_413816 ?auto_413819 ) ) ( not ( = ?auto_413817 ?auto_413818 ) ) ( not ( = ?auto_413817 ?auto_413819 ) ) ( not ( = ?auto_413818 ?auto_413819 ) ) ( ON ?auto_413817 ?auto_413818 ) ( ON ?auto_413816 ?auto_413817 ) ( CLEAR ?auto_413814 ) ( ON ?auto_413815 ?auto_413816 ) ( CLEAR ?auto_413815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_413810 ?auto_413811 ?auto_413812 ?auto_413813 ?auto_413814 ?auto_413815 )
      ( MAKE-9PILE ?auto_413810 ?auto_413811 ?auto_413812 ?auto_413813 ?auto_413814 ?auto_413815 ?auto_413816 ?auto_413817 ?auto_413818 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413829 - BLOCK
      ?auto_413830 - BLOCK
      ?auto_413831 - BLOCK
      ?auto_413832 - BLOCK
      ?auto_413833 - BLOCK
      ?auto_413834 - BLOCK
      ?auto_413835 - BLOCK
      ?auto_413836 - BLOCK
      ?auto_413837 - BLOCK
    )
    :vars
    (
      ?auto_413838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413837 ?auto_413838 ) ( ON-TABLE ?auto_413829 ) ( ON ?auto_413830 ?auto_413829 ) ( ON ?auto_413831 ?auto_413830 ) ( ON ?auto_413832 ?auto_413831 ) ( not ( = ?auto_413829 ?auto_413830 ) ) ( not ( = ?auto_413829 ?auto_413831 ) ) ( not ( = ?auto_413829 ?auto_413832 ) ) ( not ( = ?auto_413829 ?auto_413833 ) ) ( not ( = ?auto_413829 ?auto_413834 ) ) ( not ( = ?auto_413829 ?auto_413835 ) ) ( not ( = ?auto_413829 ?auto_413836 ) ) ( not ( = ?auto_413829 ?auto_413837 ) ) ( not ( = ?auto_413829 ?auto_413838 ) ) ( not ( = ?auto_413830 ?auto_413831 ) ) ( not ( = ?auto_413830 ?auto_413832 ) ) ( not ( = ?auto_413830 ?auto_413833 ) ) ( not ( = ?auto_413830 ?auto_413834 ) ) ( not ( = ?auto_413830 ?auto_413835 ) ) ( not ( = ?auto_413830 ?auto_413836 ) ) ( not ( = ?auto_413830 ?auto_413837 ) ) ( not ( = ?auto_413830 ?auto_413838 ) ) ( not ( = ?auto_413831 ?auto_413832 ) ) ( not ( = ?auto_413831 ?auto_413833 ) ) ( not ( = ?auto_413831 ?auto_413834 ) ) ( not ( = ?auto_413831 ?auto_413835 ) ) ( not ( = ?auto_413831 ?auto_413836 ) ) ( not ( = ?auto_413831 ?auto_413837 ) ) ( not ( = ?auto_413831 ?auto_413838 ) ) ( not ( = ?auto_413832 ?auto_413833 ) ) ( not ( = ?auto_413832 ?auto_413834 ) ) ( not ( = ?auto_413832 ?auto_413835 ) ) ( not ( = ?auto_413832 ?auto_413836 ) ) ( not ( = ?auto_413832 ?auto_413837 ) ) ( not ( = ?auto_413832 ?auto_413838 ) ) ( not ( = ?auto_413833 ?auto_413834 ) ) ( not ( = ?auto_413833 ?auto_413835 ) ) ( not ( = ?auto_413833 ?auto_413836 ) ) ( not ( = ?auto_413833 ?auto_413837 ) ) ( not ( = ?auto_413833 ?auto_413838 ) ) ( not ( = ?auto_413834 ?auto_413835 ) ) ( not ( = ?auto_413834 ?auto_413836 ) ) ( not ( = ?auto_413834 ?auto_413837 ) ) ( not ( = ?auto_413834 ?auto_413838 ) ) ( not ( = ?auto_413835 ?auto_413836 ) ) ( not ( = ?auto_413835 ?auto_413837 ) ) ( not ( = ?auto_413835 ?auto_413838 ) ) ( not ( = ?auto_413836 ?auto_413837 ) ) ( not ( = ?auto_413836 ?auto_413838 ) ) ( not ( = ?auto_413837 ?auto_413838 ) ) ( ON ?auto_413836 ?auto_413837 ) ( ON ?auto_413835 ?auto_413836 ) ( ON ?auto_413834 ?auto_413835 ) ( CLEAR ?auto_413832 ) ( ON ?auto_413833 ?auto_413834 ) ( CLEAR ?auto_413833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413829 ?auto_413830 ?auto_413831 ?auto_413832 ?auto_413833 )
      ( MAKE-9PILE ?auto_413829 ?auto_413830 ?auto_413831 ?auto_413832 ?auto_413833 ?auto_413834 ?auto_413835 ?auto_413836 ?auto_413837 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413848 - BLOCK
      ?auto_413849 - BLOCK
      ?auto_413850 - BLOCK
      ?auto_413851 - BLOCK
      ?auto_413852 - BLOCK
      ?auto_413853 - BLOCK
      ?auto_413854 - BLOCK
      ?auto_413855 - BLOCK
      ?auto_413856 - BLOCK
    )
    :vars
    (
      ?auto_413857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413856 ?auto_413857 ) ( ON-TABLE ?auto_413848 ) ( ON ?auto_413849 ?auto_413848 ) ( ON ?auto_413850 ?auto_413849 ) ( ON ?auto_413851 ?auto_413850 ) ( not ( = ?auto_413848 ?auto_413849 ) ) ( not ( = ?auto_413848 ?auto_413850 ) ) ( not ( = ?auto_413848 ?auto_413851 ) ) ( not ( = ?auto_413848 ?auto_413852 ) ) ( not ( = ?auto_413848 ?auto_413853 ) ) ( not ( = ?auto_413848 ?auto_413854 ) ) ( not ( = ?auto_413848 ?auto_413855 ) ) ( not ( = ?auto_413848 ?auto_413856 ) ) ( not ( = ?auto_413848 ?auto_413857 ) ) ( not ( = ?auto_413849 ?auto_413850 ) ) ( not ( = ?auto_413849 ?auto_413851 ) ) ( not ( = ?auto_413849 ?auto_413852 ) ) ( not ( = ?auto_413849 ?auto_413853 ) ) ( not ( = ?auto_413849 ?auto_413854 ) ) ( not ( = ?auto_413849 ?auto_413855 ) ) ( not ( = ?auto_413849 ?auto_413856 ) ) ( not ( = ?auto_413849 ?auto_413857 ) ) ( not ( = ?auto_413850 ?auto_413851 ) ) ( not ( = ?auto_413850 ?auto_413852 ) ) ( not ( = ?auto_413850 ?auto_413853 ) ) ( not ( = ?auto_413850 ?auto_413854 ) ) ( not ( = ?auto_413850 ?auto_413855 ) ) ( not ( = ?auto_413850 ?auto_413856 ) ) ( not ( = ?auto_413850 ?auto_413857 ) ) ( not ( = ?auto_413851 ?auto_413852 ) ) ( not ( = ?auto_413851 ?auto_413853 ) ) ( not ( = ?auto_413851 ?auto_413854 ) ) ( not ( = ?auto_413851 ?auto_413855 ) ) ( not ( = ?auto_413851 ?auto_413856 ) ) ( not ( = ?auto_413851 ?auto_413857 ) ) ( not ( = ?auto_413852 ?auto_413853 ) ) ( not ( = ?auto_413852 ?auto_413854 ) ) ( not ( = ?auto_413852 ?auto_413855 ) ) ( not ( = ?auto_413852 ?auto_413856 ) ) ( not ( = ?auto_413852 ?auto_413857 ) ) ( not ( = ?auto_413853 ?auto_413854 ) ) ( not ( = ?auto_413853 ?auto_413855 ) ) ( not ( = ?auto_413853 ?auto_413856 ) ) ( not ( = ?auto_413853 ?auto_413857 ) ) ( not ( = ?auto_413854 ?auto_413855 ) ) ( not ( = ?auto_413854 ?auto_413856 ) ) ( not ( = ?auto_413854 ?auto_413857 ) ) ( not ( = ?auto_413855 ?auto_413856 ) ) ( not ( = ?auto_413855 ?auto_413857 ) ) ( not ( = ?auto_413856 ?auto_413857 ) ) ( ON ?auto_413855 ?auto_413856 ) ( ON ?auto_413854 ?auto_413855 ) ( ON ?auto_413853 ?auto_413854 ) ( CLEAR ?auto_413851 ) ( ON ?auto_413852 ?auto_413853 ) ( CLEAR ?auto_413852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_413848 ?auto_413849 ?auto_413850 ?auto_413851 ?auto_413852 )
      ( MAKE-9PILE ?auto_413848 ?auto_413849 ?auto_413850 ?auto_413851 ?auto_413852 ?auto_413853 ?auto_413854 ?auto_413855 ?auto_413856 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413867 - BLOCK
      ?auto_413868 - BLOCK
      ?auto_413869 - BLOCK
      ?auto_413870 - BLOCK
      ?auto_413871 - BLOCK
      ?auto_413872 - BLOCK
      ?auto_413873 - BLOCK
      ?auto_413874 - BLOCK
      ?auto_413875 - BLOCK
    )
    :vars
    (
      ?auto_413876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413875 ?auto_413876 ) ( ON-TABLE ?auto_413867 ) ( ON ?auto_413868 ?auto_413867 ) ( ON ?auto_413869 ?auto_413868 ) ( not ( = ?auto_413867 ?auto_413868 ) ) ( not ( = ?auto_413867 ?auto_413869 ) ) ( not ( = ?auto_413867 ?auto_413870 ) ) ( not ( = ?auto_413867 ?auto_413871 ) ) ( not ( = ?auto_413867 ?auto_413872 ) ) ( not ( = ?auto_413867 ?auto_413873 ) ) ( not ( = ?auto_413867 ?auto_413874 ) ) ( not ( = ?auto_413867 ?auto_413875 ) ) ( not ( = ?auto_413867 ?auto_413876 ) ) ( not ( = ?auto_413868 ?auto_413869 ) ) ( not ( = ?auto_413868 ?auto_413870 ) ) ( not ( = ?auto_413868 ?auto_413871 ) ) ( not ( = ?auto_413868 ?auto_413872 ) ) ( not ( = ?auto_413868 ?auto_413873 ) ) ( not ( = ?auto_413868 ?auto_413874 ) ) ( not ( = ?auto_413868 ?auto_413875 ) ) ( not ( = ?auto_413868 ?auto_413876 ) ) ( not ( = ?auto_413869 ?auto_413870 ) ) ( not ( = ?auto_413869 ?auto_413871 ) ) ( not ( = ?auto_413869 ?auto_413872 ) ) ( not ( = ?auto_413869 ?auto_413873 ) ) ( not ( = ?auto_413869 ?auto_413874 ) ) ( not ( = ?auto_413869 ?auto_413875 ) ) ( not ( = ?auto_413869 ?auto_413876 ) ) ( not ( = ?auto_413870 ?auto_413871 ) ) ( not ( = ?auto_413870 ?auto_413872 ) ) ( not ( = ?auto_413870 ?auto_413873 ) ) ( not ( = ?auto_413870 ?auto_413874 ) ) ( not ( = ?auto_413870 ?auto_413875 ) ) ( not ( = ?auto_413870 ?auto_413876 ) ) ( not ( = ?auto_413871 ?auto_413872 ) ) ( not ( = ?auto_413871 ?auto_413873 ) ) ( not ( = ?auto_413871 ?auto_413874 ) ) ( not ( = ?auto_413871 ?auto_413875 ) ) ( not ( = ?auto_413871 ?auto_413876 ) ) ( not ( = ?auto_413872 ?auto_413873 ) ) ( not ( = ?auto_413872 ?auto_413874 ) ) ( not ( = ?auto_413872 ?auto_413875 ) ) ( not ( = ?auto_413872 ?auto_413876 ) ) ( not ( = ?auto_413873 ?auto_413874 ) ) ( not ( = ?auto_413873 ?auto_413875 ) ) ( not ( = ?auto_413873 ?auto_413876 ) ) ( not ( = ?auto_413874 ?auto_413875 ) ) ( not ( = ?auto_413874 ?auto_413876 ) ) ( not ( = ?auto_413875 ?auto_413876 ) ) ( ON ?auto_413874 ?auto_413875 ) ( ON ?auto_413873 ?auto_413874 ) ( ON ?auto_413872 ?auto_413873 ) ( ON ?auto_413871 ?auto_413872 ) ( CLEAR ?auto_413869 ) ( ON ?auto_413870 ?auto_413871 ) ( CLEAR ?auto_413870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413867 ?auto_413868 ?auto_413869 ?auto_413870 )
      ( MAKE-9PILE ?auto_413867 ?auto_413868 ?auto_413869 ?auto_413870 ?auto_413871 ?auto_413872 ?auto_413873 ?auto_413874 ?auto_413875 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413886 - BLOCK
      ?auto_413887 - BLOCK
      ?auto_413888 - BLOCK
      ?auto_413889 - BLOCK
      ?auto_413890 - BLOCK
      ?auto_413891 - BLOCK
      ?auto_413892 - BLOCK
      ?auto_413893 - BLOCK
      ?auto_413894 - BLOCK
    )
    :vars
    (
      ?auto_413895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413894 ?auto_413895 ) ( ON-TABLE ?auto_413886 ) ( ON ?auto_413887 ?auto_413886 ) ( ON ?auto_413888 ?auto_413887 ) ( not ( = ?auto_413886 ?auto_413887 ) ) ( not ( = ?auto_413886 ?auto_413888 ) ) ( not ( = ?auto_413886 ?auto_413889 ) ) ( not ( = ?auto_413886 ?auto_413890 ) ) ( not ( = ?auto_413886 ?auto_413891 ) ) ( not ( = ?auto_413886 ?auto_413892 ) ) ( not ( = ?auto_413886 ?auto_413893 ) ) ( not ( = ?auto_413886 ?auto_413894 ) ) ( not ( = ?auto_413886 ?auto_413895 ) ) ( not ( = ?auto_413887 ?auto_413888 ) ) ( not ( = ?auto_413887 ?auto_413889 ) ) ( not ( = ?auto_413887 ?auto_413890 ) ) ( not ( = ?auto_413887 ?auto_413891 ) ) ( not ( = ?auto_413887 ?auto_413892 ) ) ( not ( = ?auto_413887 ?auto_413893 ) ) ( not ( = ?auto_413887 ?auto_413894 ) ) ( not ( = ?auto_413887 ?auto_413895 ) ) ( not ( = ?auto_413888 ?auto_413889 ) ) ( not ( = ?auto_413888 ?auto_413890 ) ) ( not ( = ?auto_413888 ?auto_413891 ) ) ( not ( = ?auto_413888 ?auto_413892 ) ) ( not ( = ?auto_413888 ?auto_413893 ) ) ( not ( = ?auto_413888 ?auto_413894 ) ) ( not ( = ?auto_413888 ?auto_413895 ) ) ( not ( = ?auto_413889 ?auto_413890 ) ) ( not ( = ?auto_413889 ?auto_413891 ) ) ( not ( = ?auto_413889 ?auto_413892 ) ) ( not ( = ?auto_413889 ?auto_413893 ) ) ( not ( = ?auto_413889 ?auto_413894 ) ) ( not ( = ?auto_413889 ?auto_413895 ) ) ( not ( = ?auto_413890 ?auto_413891 ) ) ( not ( = ?auto_413890 ?auto_413892 ) ) ( not ( = ?auto_413890 ?auto_413893 ) ) ( not ( = ?auto_413890 ?auto_413894 ) ) ( not ( = ?auto_413890 ?auto_413895 ) ) ( not ( = ?auto_413891 ?auto_413892 ) ) ( not ( = ?auto_413891 ?auto_413893 ) ) ( not ( = ?auto_413891 ?auto_413894 ) ) ( not ( = ?auto_413891 ?auto_413895 ) ) ( not ( = ?auto_413892 ?auto_413893 ) ) ( not ( = ?auto_413892 ?auto_413894 ) ) ( not ( = ?auto_413892 ?auto_413895 ) ) ( not ( = ?auto_413893 ?auto_413894 ) ) ( not ( = ?auto_413893 ?auto_413895 ) ) ( not ( = ?auto_413894 ?auto_413895 ) ) ( ON ?auto_413893 ?auto_413894 ) ( ON ?auto_413892 ?auto_413893 ) ( ON ?auto_413891 ?auto_413892 ) ( ON ?auto_413890 ?auto_413891 ) ( CLEAR ?auto_413888 ) ( ON ?auto_413889 ?auto_413890 ) ( CLEAR ?auto_413889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_413886 ?auto_413887 ?auto_413888 ?auto_413889 )
      ( MAKE-9PILE ?auto_413886 ?auto_413887 ?auto_413888 ?auto_413889 ?auto_413890 ?auto_413891 ?auto_413892 ?auto_413893 ?auto_413894 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413905 - BLOCK
      ?auto_413906 - BLOCK
      ?auto_413907 - BLOCK
      ?auto_413908 - BLOCK
      ?auto_413909 - BLOCK
      ?auto_413910 - BLOCK
      ?auto_413911 - BLOCK
      ?auto_413912 - BLOCK
      ?auto_413913 - BLOCK
    )
    :vars
    (
      ?auto_413914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413913 ?auto_413914 ) ( ON-TABLE ?auto_413905 ) ( ON ?auto_413906 ?auto_413905 ) ( not ( = ?auto_413905 ?auto_413906 ) ) ( not ( = ?auto_413905 ?auto_413907 ) ) ( not ( = ?auto_413905 ?auto_413908 ) ) ( not ( = ?auto_413905 ?auto_413909 ) ) ( not ( = ?auto_413905 ?auto_413910 ) ) ( not ( = ?auto_413905 ?auto_413911 ) ) ( not ( = ?auto_413905 ?auto_413912 ) ) ( not ( = ?auto_413905 ?auto_413913 ) ) ( not ( = ?auto_413905 ?auto_413914 ) ) ( not ( = ?auto_413906 ?auto_413907 ) ) ( not ( = ?auto_413906 ?auto_413908 ) ) ( not ( = ?auto_413906 ?auto_413909 ) ) ( not ( = ?auto_413906 ?auto_413910 ) ) ( not ( = ?auto_413906 ?auto_413911 ) ) ( not ( = ?auto_413906 ?auto_413912 ) ) ( not ( = ?auto_413906 ?auto_413913 ) ) ( not ( = ?auto_413906 ?auto_413914 ) ) ( not ( = ?auto_413907 ?auto_413908 ) ) ( not ( = ?auto_413907 ?auto_413909 ) ) ( not ( = ?auto_413907 ?auto_413910 ) ) ( not ( = ?auto_413907 ?auto_413911 ) ) ( not ( = ?auto_413907 ?auto_413912 ) ) ( not ( = ?auto_413907 ?auto_413913 ) ) ( not ( = ?auto_413907 ?auto_413914 ) ) ( not ( = ?auto_413908 ?auto_413909 ) ) ( not ( = ?auto_413908 ?auto_413910 ) ) ( not ( = ?auto_413908 ?auto_413911 ) ) ( not ( = ?auto_413908 ?auto_413912 ) ) ( not ( = ?auto_413908 ?auto_413913 ) ) ( not ( = ?auto_413908 ?auto_413914 ) ) ( not ( = ?auto_413909 ?auto_413910 ) ) ( not ( = ?auto_413909 ?auto_413911 ) ) ( not ( = ?auto_413909 ?auto_413912 ) ) ( not ( = ?auto_413909 ?auto_413913 ) ) ( not ( = ?auto_413909 ?auto_413914 ) ) ( not ( = ?auto_413910 ?auto_413911 ) ) ( not ( = ?auto_413910 ?auto_413912 ) ) ( not ( = ?auto_413910 ?auto_413913 ) ) ( not ( = ?auto_413910 ?auto_413914 ) ) ( not ( = ?auto_413911 ?auto_413912 ) ) ( not ( = ?auto_413911 ?auto_413913 ) ) ( not ( = ?auto_413911 ?auto_413914 ) ) ( not ( = ?auto_413912 ?auto_413913 ) ) ( not ( = ?auto_413912 ?auto_413914 ) ) ( not ( = ?auto_413913 ?auto_413914 ) ) ( ON ?auto_413912 ?auto_413913 ) ( ON ?auto_413911 ?auto_413912 ) ( ON ?auto_413910 ?auto_413911 ) ( ON ?auto_413909 ?auto_413910 ) ( ON ?auto_413908 ?auto_413909 ) ( CLEAR ?auto_413906 ) ( ON ?auto_413907 ?auto_413908 ) ( CLEAR ?auto_413907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413905 ?auto_413906 ?auto_413907 )
      ( MAKE-9PILE ?auto_413905 ?auto_413906 ?auto_413907 ?auto_413908 ?auto_413909 ?auto_413910 ?auto_413911 ?auto_413912 ?auto_413913 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413924 - BLOCK
      ?auto_413925 - BLOCK
      ?auto_413926 - BLOCK
      ?auto_413927 - BLOCK
      ?auto_413928 - BLOCK
      ?auto_413929 - BLOCK
      ?auto_413930 - BLOCK
      ?auto_413931 - BLOCK
      ?auto_413932 - BLOCK
    )
    :vars
    (
      ?auto_413933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413932 ?auto_413933 ) ( ON-TABLE ?auto_413924 ) ( ON ?auto_413925 ?auto_413924 ) ( not ( = ?auto_413924 ?auto_413925 ) ) ( not ( = ?auto_413924 ?auto_413926 ) ) ( not ( = ?auto_413924 ?auto_413927 ) ) ( not ( = ?auto_413924 ?auto_413928 ) ) ( not ( = ?auto_413924 ?auto_413929 ) ) ( not ( = ?auto_413924 ?auto_413930 ) ) ( not ( = ?auto_413924 ?auto_413931 ) ) ( not ( = ?auto_413924 ?auto_413932 ) ) ( not ( = ?auto_413924 ?auto_413933 ) ) ( not ( = ?auto_413925 ?auto_413926 ) ) ( not ( = ?auto_413925 ?auto_413927 ) ) ( not ( = ?auto_413925 ?auto_413928 ) ) ( not ( = ?auto_413925 ?auto_413929 ) ) ( not ( = ?auto_413925 ?auto_413930 ) ) ( not ( = ?auto_413925 ?auto_413931 ) ) ( not ( = ?auto_413925 ?auto_413932 ) ) ( not ( = ?auto_413925 ?auto_413933 ) ) ( not ( = ?auto_413926 ?auto_413927 ) ) ( not ( = ?auto_413926 ?auto_413928 ) ) ( not ( = ?auto_413926 ?auto_413929 ) ) ( not ( = ?auto_413926 ?auto_413930 ) ) ( not ( = ?auto_413926 ?auto_413931 ) ) ( not ( = ?auto_413926 ?auto_413932 ) ) ( not ( = ?auto_413926 ?auto_413933 ) ) ( not ( = ?auto_413927 ?auto_413928 ) ) ( not ( = ?auto_413927 ?auto_413929 ) ) ( not ( = ?auto_413927 ?auto_413930 ) ) ( not ( = ?auto_413927 ?auto_413931 ) ) ( not ( = ?auto_413927 ?auto_413932 ) ) ( not ( = ?auto_413927 ?auto_413933 ) ) ( not ( = ?auto_413928 ?auto_413929 ) ) ( not ( = ?auto_413928 ?auto_413930 ) ) ( not ( = ?auto_413928 ?auto_413931 ) ) ( not ( = ?auto_413928 ?auto_413932 ) ) ( not ( = ?auto_413928 ?auto_413933 ) ) ( not ( = ?auto_413929 ?auto_413930 ) ) ( not ( = ?auto_413929 ?auto_413931 ) ) ( not ( = ?auto_413929 ?auto_413932 ) ) ( not ( = ?auto_413929 ?auto_413933 ) ) ( not ( = ?auto_413930 ?auto_413931 ) ) ( not ( = ?auto_413930 ?auto_413932 ) ) ( not ( = ?auto_413930 ?auto_413933 ) ) ( not ( = ?auto_413931 ?auto_413932 ) ) ( not ( = ?auto_413931 ?auto_413933 ) ) ( not ( = ?auto_413932 ?auto_413933 ) ) ( ON ?auto_413931 ?auto_413932 ) ( ON ?auto_413930 ?auto_413931 ) ( ON ?auto_413929 ?auto_413930 ) ( ON ?auto_413928 ?auto_413929 ) ( ON ?auto_413927 ?auto_413928 ) ( CLEAR ?auto_413925 ) ( ON ?auto_413926 ?auto_413927 ) ( CLEAR ?auto_413926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_413924 ?auto_413925 ?auto_413926 )
      ( MAKE-9PILE ?auto_413924 ?auto_413925 ?auto_413926 ?auto_413927 ?auto_413928 ?auto_413929 ?auto_413930 ?auto_413931 ?auto_413932 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413943 - BLOCK
      ?auto_413944 - BLOCK
      ?auto_413945 - BLOCK
      ?auto_413946 - BLOCK
      ?auto_413947 - BLOCK
      ?auto_413948 - BLOCK
      ?auto_413949 - BLOCK
      ?auto_413950 - BLOCK
      ?auto_413951 - BLOCK
    )
    :vars
    (
      ?auto_413952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413951 ?auto_413952 ) ( ON-TABLE ?auto_413943 ) ( not ( = ?auto_413943 ?auto_413944 ) ) ( not ( = ?auto_413943 ?auto_413945 ) ) ( not ( = ?auto_413943 ?auto_413946 ) ) ( not ( = ?auto_413943 ?auto_413947 ) ) ( not ( = ?auto_413943 ?auto_413948 ) ) ( not ( = ?auto_413943 ?auto_413949 ) ) ( not ( = ?auto_413943 ?auto_413950 ) ) ( not ( = ?auto_413943 ?auto_413951 ) ) ( not ( = ?auto_413943 ?auto_413952 ) ) ( not ( = ?auto_413944 ?auto_413945 ) ) ( not ( = ?auto_413944 ?auto_413946 ) ) ( not ( = ?auto_413944 ?auto_413947 ) ) ( not ( = ?auto_413944 ?auto_413948 ) ) ( not ( = ?auto_413944 ?auto_413949 ) ) ( not ( = ?auto_413944 ?auto_413950 ) ) ( not ( = ?auto_413944 ?auto_413951 ) ) ( not ( = ?auto_413944 ?auto_413952 ) ) ( not ( = ?auto_413945 ?auto_413946 ) ) ( not ( = ?auto_413945 ?auto_413947 ) ) ( not ( = ?auto_413945 ?auto_413948 ) ) ( not ( = ?auto_413945 ?auto_413949 ) ) ( not ( = ?auto_413945 ?auto_413950 ) ) ( not ( = ?auto_413945 ?auto_413951 ) ) ( not ( = ?auto_413945 ?auto_413952 ) ) ( not ( = ?auto_413946 ?auto_413947 ) ) ( not ( = ?auto_413946 ?auto_413948 ) ) ( not ( = ?auto_413946 ?auto_413949 ) ) ( not ( = ?auto_413946 ?auto_413950 ) ) ( not ( = ?auto_413946 ?auto_413951 ) ) ( not ( = ?auto_413946 ?auto_413952 ) ) ( not ( = ?auto_413947 ?auto_413948 ) ) ( not ( = ?auto_413947 ?auto_413949 ) ) ( not ( = ?auto_413947 ?auto_413950 ) ) ( not ( = ?auto_413947 ?auto_413951 ) ) ( not ( = ?auto_413947 ?auto_413952 ) ) ( not ( = ?auto_413948 ?auto_413949 ) ) ( not ( = ?auto_413948 ?auto_413950 ) ) ( not ( = ?auto_413948 ?auto_413951 ) ) ( not ( = ?auto_413948 ?auto_413952 ) ) ( not ( = ?auto_413949 ?auto_413950 ) ) ( not ( = ?auto_413949 ?auto_413951 ) ) ( not ( = ?auto_413949 ?auto_413952 ) ) ( not ( = ?auto_413950 ?auto_413951 ) ) ( not ( = ?auto_413950 ?auto_413952 ) ) ( not ( = ?auto_413951 ?auto_413952 ) ) ( ON ?auto_413950 ?auto_413951 ) ( ON ?auto_413949 ?auto_413950 ) ( ON ?auto_413948 ?auto_413949 ) ( ON ?auto_413947 ?auto_413948 ) ( ON ?auto_413946 ?auto_413947 ) ( ON ?auto_413945 ?auto_413946 ) ( CLEAR ?auto_413943 ) ( ON ?auto_413944 ?auto_413945 ) ( CLEAR ?auto_413944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413943 ?auto_413944 )
      ( MAKE-9PILE ?auto_413943 ?auto_413944 ?auto_413945 ?auto_413946 ?auto_413947 ?auto_413948 ?auto_413949 ?auto_413950 ?auto_413951 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413962 - BLOCK
      ?auto_413963 - BLOCK
      ?auto_413964 - BLOCK
      ?auto_413965 - BLOCK
      ?auto_413966 - BLOCK
      ?auto_413967 - BLOCK
      ?auto_413968 - BLOCK
      ?auto_413969 - BLOCK
      ?auto_413970 - BLOCK
    )
    :vars
    (
      ?auto_413971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413970 ?auto_413971 ) ( ON-TABLE ?auto_413962 ) ( not ( = ?auto_413962 ?auto_413963 ) ) ( not ( = ?auto_413962 ?auto_413964 ) ) ( not ( = ?auto_413962 ?auto_413965 ) ) ( not ( = ?auto_413962 ?auto_413966 ) ) ( not ( = ?auto_413962 ?auto_413967 ) ) ( not ( = ?auto_413962 ?auto_413968 ) ) ( not ( = ?auto_413962 ?auto_413969 ) ) ( not ( = ?auto_413962 ?auto_413970 ) ) ( not ( = ?auto_413962 ?auto_413971 ) ) ( not ( = ?auto_413963 ?auto_413964 ) ) ( not ( = ?auto_413963 ?auto_413965 ) ) ( not ( = ?auto_413963 ?auto_413966 ) ) ( not ( = ?auto_413963 ?auto_413967 ) ) ( not ( = ?auto_413963 ?auto_413968 ) ) ( not ( = ?auto_413963 ?auto_413969 ) ) ( not ( = ?auto_413963 ?auto_413970 ) ) ( not ( = ?auto_413963 ?auto_413971 ) ) ( not ( = ?auto_413964 ?auto_413965 ) ) ( not ( = ?auto_413964 ?auto_413966 ) ) ( not ( = ?auto_413964 ?auto_413967 ) ) ( not ( = ?auto_413964 ?auto_413968 ) ) ( not ( = ?auto_413964 ?auto_413969 ) ) ( not ( = ?auto_413964 ?auto_413970 ) ) ( not ( = ?auto_413964 ?auto_413971 ) ) ( not ( = ?auto_413965 ?auto_413966 ) ) ( not ( = ?auto_413965 ?auto_413967 ) ) ( not ( = ?auto_413965 ?auto_413968 ) ) ( not ( = ?auto_413965 ?auto_413969 ) ) ( not ( = ?auto_413965 ?auto_413970 ) ) ( not ( = ?auto_413965 ?auto_413971 ) ) ( not ( = ?auto_413966 ?auto_413967 ) ) ( not ( = ?auto_413966 ?auto_413968 ) ) ( not ( = ?auto_413966 ?auto_413969 ) ) ( not ( = ?auto_413966 ?auto_413970 ) ) ( not ( = ?auto_413966 ?auto_413971 ) ) ( not ( = ?auto_413967 ?auto_413968 ) ) ( not ( = ?auto_413967 ?auto_413969 ) ) ( not ( = ?auto_413967 ?auto_413970 ) ) ( not ( = ?auto_413967 ?auto_413971 ) ) ( not ( = ?auto_413968 ?auto_413969 ) ) ( not ( = ?auto_413968 ?auto_413970 ) ) ( not ( = ?auto_413968 ?auto_413971 ) ) ( not ( = ?auto_413969 ?auto_413970 ) ) ( not ( = ?auto_413969 ?auto_413971 ) ) ( not ( = ?auto_413970 ?auto_413971 ) ) ( ON ?auto_413969 ?auto_413970 ) ( ON ?auto_413968 ?auto_413969 ) ( ON ?auto_413967 ?auto_413968 ) ( ON ?auto_413966 ?auto_413967 ) ( ON ?auto_413965 ?auto_413966 ) ( ON ?auto_413964 ?auto_413965 ) ( CLEAR ?auto_413962 ) ( ON ?auto_413963 ?auto_413964 ) ( CLEAR ?auto_413963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_413962 ?auto_413963 )
      ( MAKE-9PILE ?auto_413962 ?auto_413963 ?auto_413964 ?auto_413965 ?auto_413966 ?auto_413967 ?auto_413968 ?auto_413969 ?auto_413970 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_413981 - BLOCK
      ?auto_413982 - BLOCK
      ?auto_413983 - BLOCK
      ?auto_413984 - BLOCK
      ?auto_413985 - BLOCK
      ?auto_413986 - BLOCK
      ?auto_413987 - BLOCK
      ?auto_413988 - BLOCK
      ?auto_413989 - BLOCK
    )
    :vars
    (
      ?auto_413990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_413989 ?auto_413990 ) ( not ( = ?auto_413981 ?auto_413982 ) ) ( not ( = ?auto_413981 ?auto_413983 ) ) ( not ( = ?auto_413981 ?auto_413984 ) ) ( not ( = ?auto_413981 ?auto_413985 ) ) ( not ( = ?auto_413981 ?auto_413986 ) ) ( not ( = ?auto_413981 ?auto_413987 ) ) ( not ( = ?auto_413981 ?auto_413988 ) ) ( not ( = ?auto_413981 ?auto_413989 ) ) ( not ( = ?auto_413981 ?auto_413990 ) ) ( not ( = ?auto_413982 ?auto_413983 ) ) ( not ( = ?auto_413982 ?auto_413984 ) ) ( not ( = ?auto_413982 ?auto_413985 ) ) ( not ( = ?auto_413982 ?auto_413986 ) ) ( not ( = ?auto_413982 ?auto_413987 ) ) ( not ( = ?auto_413982 ?auto_413988 ) ) ( not ( = ?auto_413982 ?auto_413989 ) ) ( not ( = ?auto_413982 ?auto_413990 ) ) ( not ( = ?auto_413983 ?auto_413984 ) ) ( not ( = ?auto_413983 ?auto_413985 ) ) ( not ( = ?auto_413983 ?auto_413986 ) ) ( not ( = ?auto_413983 ?auto_413987 ) ) ( not ( = ?auto_413983 ?auto_413988 ) ) ( not ( = ?auto_413983 ?auto_413989 ) ) ( not ( = ?auto_413983 ?auto_413990 ) ) ( not ( = ?auto_413984 ?auto_413985 ) ) ( not ( = ?auto_413984 ?auto_413986 ) ) ( not ( = ?auto_413984 ?auto_413987 ) ) ( not ( = ?auto_413984 ?auto_413988 ) ) ( not ( = ?auto_413984 ?auto_413989 ) ) ( not ( = ?auto_413984 ?auto_413990 ) ) ( not ( = ?auto_413985 ?auto_413986 ) ) ( not ( = ?auto_413985 ?auto_413987 ) ) ( not ( = ?auto_413985 ?auto_413988 ) ) ( not ( = ?auto_413985 ?auto_413989 ) ) ( not ( = ?auto_413985 ?auto_413990 ) ) ( not ( = ?auto_413986 ?auto_413987 ) ) ( not ( = ?auto_413986 ?auto_413988 ) ) ( not ( = ?auto_413986 ?auto_413989 ) ) ( not ( = ?auto_413986 ?auto_413990 ) ) ( not ( = ?auto_413987 ?auto_413988 ) ) ( not ( = ?auto_413987 ?auto_413989 ) ) ( not ( = ?auto_413987 ?auto_413990 ) ) ( not ( = ?auto_413988 ?auto_413989 ) ) ( not ( = ?auto_413988 ?auto_413990 ) ) ( not ( = ?auto_413989 ?auto_413990 ) ) ( ON ?auto_413988 ?auto_413989 ) ( ON ?auto_413987 ?auto_413988 ) ( ON ?auto_413986 ?auto_413987 ) ( ON ?auto_413985 ?auto_413986 ) ( ON ?auto_413984 ?auto_413985 ) ( ON ?auto_413983 ?auto_413984 ) ( ON ?auto_413982 ?auto_413983 ) ( ON ?auto_413981 ?auto_413982 ) ( CLEAR ?auto_413981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_413981 )
      ( MAKE-9PILE ?auto_413981 ?auto_413982 ?auto_413983 ?auto_413984 ?auto_413985 ?auto_413986 ?auto_413987 ?auto_413988 ?auto_413989 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_414000 - BLOCK
      ?auto_414001 - BLOCK
      ?auto_414002 - BLOCK
      ?auto_414003 - BLOCK
      ?auto_414004 - BLOCK
      ?auto_414005 - BLOCK
      ?auto_414006 - BLOCK
      ?auto_414007 - BLOCK
      ?auto_414008 - BLOCK
    )
    :vars
    (
      ?auto_414009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414008 ?auto_414009 ) ( not ( = ?auto_414000 ?auto_414001 ) ) ( not ( = ?auto_414000 ?auto_414002 ) ) ( not ( = ?auto_414000 ?auto_414003 ) ) ( not ( = ?auto_414000 ?auto_414004 ) ) ( not ( = ?auto_414000 ?auto_414005 ) ) ( not ( = ?auto_414000 ?auto_414006 ) ) ( not ( = ?auto_414000 ?auto_414007 ) ) ( not ( = ?auto_414000 ?auto_414008 ) ) ( not ( = ?auto_414000 ?auto_414009 ) ) ( not ( = ?auto_414001 ?auto_414002 ) ) ( not ( = ?auto_414001 ?auto_414003 ) ) ( not ( = ?auto_414001 ?auto_414004 ) ) ( not ( = ?auto_414001 ?auto_414005 ) ) ( not ( = ?auto_414001 ?auto_414006 ) ) ( not ( = ?auto_414001 ?auto_414007 ) ) ( not ( = ?auto_414001 ?auto_414008 ) ) ( not ( = ?auto_414001 ?auto_414009 ) ) ( not ( = ?auto_414002 ?auto_414003 ) ) ( not ( = ?auto_414002 ?auto_414004 ) ) ( not ( = ?auto_414002 ?auto_414005 ) ) ( not ( = ?auto_414002 ?auto_414006 ) ) ( not ( = ?auto_414002 ?auto_414007 ) ) ( not ( = ?auto_414002 ?auto_414008 ) ) ( not ( = ?auto_414002 ?auto_414009 ) ) ( not ( = ?auto_414003 ?auto_414004 ) ) ( not ( = ?auto_414003 ?auto_414005 ) ) ( not ( = ?auto_414003 ?auto_414006 ) ) ( not ( = ?auto_414003 ?auto_414007 ) ) ( not ( = ?auto_414003 ?auto_414008 ) ) ( not ( = ?auto_414003 ?auto_414009 ) ) ( not ( = ?auto_414004 ?auto_414005 ) ) ( not ( = ?auto_414004 ?auto_414006 ) ) ( not ( = ?auto_414004 ?auto_414007 ) ) ( not ( = ?auto_414004 ?auto_414008 ) ) ( not ( = ?auto_414004 ?auto_414009 ) ) ( not ( = ?auto_414005 ?auto_414006 ) ) ( not ( = ?auto_414005 ?auto_414007 ) ) ( not ( = ?auto_414005 ?auto_414008 ) ) ( not ( = ?auto_414005 ?auto_414009 ) ) ( not ( = ?auto_414006 ?auto_414007 ) ) ( not ( = ?auto_414006 ?auto_414008 ) ) ( not ( = ?auto_414006 ?auto_414009 ) ) ( not ( = ?auto_414007 ?auto_414008 ) ) ( not ( = ?auto_414007 ?auto_414009 ) ) ( not ( = ?auto_414008 ?auto_414009 ) ) ( ON ?auto_414007 ?auto_414008 ) ( ON ?auto_414006 ?auto_414007 ) ( ON ?auto_414005 ?auto_414006 ) ( ON ?auto_414004 ?auto_414005 ) ( ON ?auto_414003 ?auto_414004 ) ( ON ?auto_414002 ?auto_414003 ) ( ON ?auto_414001 ?auto_414002 ) ( ON ?auto_414000 ?auto_414001 ) ( CLEAR ?auto_414000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_414000 )
      ( MAKE-9PILE ?auto_414000 ?auto_414001 ?auto_414002 ?auto_414003 ?auto_414004 ?auto_414005 ?auto_414006 ?auto_414007 ?auto_414008 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414020 - BLOCK
      ?auto_414021 - BLOCK
      ?auto_414022 - BLOCK
      ?auto_414023 - BLOCK
      ?auto_414024 - BLOCK
      ?auto_414025 - BLOCK
      ?auto_414026 - BLOCK
      ?auto_414027 - BLOCK
      ?auto_414028 - BLOCK
      ?auto_414029 - BLOCK
    )
    :vars
    (
      ?auto_414030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_414028 ) ( ON ?auto_414029 ?auto_414030 ) ( CLEAR ?auto_414029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_414020 ) ( ON ?auto_414021 ?auto_414020 ) ( ON ?auto_414022 ?auto_414021 ) ( ON ?auto_414023 ?auto_414022 ) ( ON ?auto_414024 ?auto_414023 ) ( ON ?auto_414025 ?auto_414024 ) ( ON ?auto_414026 ?auto_414025 ) ( ON ?auto_414027 ?auto_414026 ) ( ON ?auto_414028 ?auto_414027 ) ( not ( = ?auto_414020 ?auto_414021 ) ) ( not ( = ?auto_414020 ?auto_414022 ) ) ( not ( = ?auto_414020 ?auto_414023 ) ) ( not ( = ?auto_414020 ?auto_414024 ) ) ( not ( = ?auto_414020 ?auto_414025 ) ) ( not ( = ?auto_414020 ?auto_414026 ) ) ( not ( = ?auto_414020 ?auto_414027 ) ) ( not ( = ?auto_414020 ?auto_414028 ) ) ( not ( = ?auto_414020 ?auto_414029 ) ) ( not ( = ?auto_414020 ?auto_414030 ) ) ( not ( = ?auto_414021 ?auto_414022 ) ) ( not ( = ?auto_414021 ?auto_414023 ) ) ( not ( = ?auto_414021 ?auto_414024 ) ) ( not ( = ?auto_414021 ?auto_414025 ) ) ( not ( = ?auto_414021 ?auto_414026 ) ) ( not ( = ?auto_414021 ?auto_414027 ) ) ( not ( = ?auto_414021 ?auto_414028 ) ) ( not ( = ?auto_414021 ?auto_414029 ) ) ( not ( = ?auto_414021 ?auto_414030 ) ) ( not ( = ?auto_414022 ?auto_414023 ) ) ( not ( = ?auto_414022 ?auto_414024 ) ) ( not ( = ?auto_414022 ?auto_414025 ) ) ( not ( = ?auto_414022 ?auto_414026 ) ) ( not ( = ?auto_414022 ?auto_414027 ) ) ( not ( = ?auto_414022 ?auto_414028 ) ) ( not ( = ?auto_414022 ?auto_414029 ) ) ( not ( = ?auto_414022 ?auto_414030 ) ) ( not ( = ?auto_414023 ?auto_414024 ) ) ( not ( = ?auto_414023 ?auto_414025 ) ) ( not ( = ?auto_414023 ?auto_414026 ) ) ( not ( = ?auto_414023 ?auto_414027 ) ) ( not ( = ?auto_414023 ?auto_414028 ) ) ( not ( = ?auto_414023 ?auto_414029 ) ) ( not ( = ?auto_414023 ?auto_414030 ) ) ( not ( = ?auto_414024 ?auto_414025 ) ) ( not ( = ?auto_414024 ?auto_414026 ) ) ( not ( = ?auto_414024 ?auto_414027 ) ) ( not ( = ?auto_414024 ?auto_414028 ) ) ( not ( = ?auto_414024 ?auto_414029 ) ) ( not ( = ?auto_414024 ?auto_414030 ) ) ( not ( = ?auto_414025 ?auto_414026 ) ) ( not ( = ?auto_414025 ?auto_414027 ) ) ( not ( = ?auto_414025 ?auto_414028 ) ) ( not ( = ?auto_414025 ?auto_414029 ) ) ( not ( = ?auto_414025 ?auto_414030 ) ) ( not ( = ?auto_414026 ?auto_414027 ) ) ( not ( = ?auto_414026 ?auto_414028 ) ) ( not ( = ?auto_414026 ?auto_414029 ) ) ( not ( = ?auto_414026 ?auto_414030 ) ) ( not ( = ?auto_414027 ?auto_414028 ) ) ( not ( = ?auto_414027 ?auto_414029 ) ) ( not ( = ?auto_414027 ?auto_414030 ) ) ( not ( = ?auto_414028 ?auto_414029 ) ) ( not ( = ?auto_414028 ?auto_414030 ) ) ( not ( = ?auto_414029 ?auto_414030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_414029 ?auto_414030 )
      ( !STACK ?auto_414029 ?auto_414028 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414041 - BLOCK
      ?auto_414042 - BLOCK
      ?auto_414043 - BLOCK
      ?auto_414044 - BLOCK
      ?auto_414045 - BLOCK
      ?auto_414046 - BLOCK
      ?auto_414047 - BLOCK
      ?auto_414048 - BLOCK
      ?auto_414049 - BLOCK
      ?auto_414050 - BLOCK
    )
    :vars
    (
      ?auto_414051 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_414049 ) ( ON ?auto_414050 ?auto_414051 ) ( CLEAR ?auto_414050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_414041 ) ( ON ?auto_414042 ?auto_414041 ) ( ON ?auto_414043 ?auto_414042 ) ( ON ?auto_414044 ?auto_414043 ) ( ON ?auto_414045 ?auto_414044 ) ( ON ?auto_414046 ?auto_414045 ) ( ON ?auto_414047 ?auto_414046 ) ( ON ?auto_414048 ?auto_414047 ) ( ON ?auto_414049 ?auto_414048 ) ( not ( = ?auto_414041 ?auto_414042 ) ) ( not ( = ?auto_414041 ?auto_414043 ) ) ( not ( = ?auto_414041 ?auto_414044 ) ) ( not ( = ?auto_414041 ?auto_414045 ) ) ( not ( = ?auto_414041 ?auto_414046 ) ) ( not ( = ?auto_414041 ?auto_414047 ) ) ( not ( = ?auto_414041 ?auto_414048 ) ) ( not ( = ?auto_414041 ?auto_414049 ) ) ( not ( = ?auto_414041 ?auto_414050 ) ) ( not ( = ?auto_414041 ?auto_414051 ) ) ( not ( = ?auto_414042 ?auto_414043 ) ) ( not ( = ?auto_414042 ?auto_414044 ) ) ( not ( = ?auto_414042 ?auto_414045 ) ) ( not ( = ?auto_414042 ?auto_414046 ) ) ( not ( = ?auto_414042 ?auto_414047 ) ) ( not ( = ?auto_414042 ?auto_414048 ) ) ( not ( = ?auto_414042 ?auto_414049 ) ) ( not ( = ?auto_414042 ?auto_414050 ) ) ( not ( = ?auto_414042 ?auto_414051 ) ) ( not ( = ?auto_414043 ?auto_414044 ) ) ( not ( = ?auto_414043 ?auto_414045 ) ) ( not ( = ?auto_414043 ?auto_414046 ) ) ( not ( = ?auto_414043 ?auto_414047 ) ) ( not ( = ?auto_414043 ?auto_414048 ) ) ( not ( = ?auto_414043 ?auto_414049 ) ) ( not ( = ?auto_414043 ?auto_414050 ) ) ( not ( = ?auto_414043 ?auto_414051 ) ) ( not ( = ?auto_414044 ?auto_414045 ) ) ( not ( = ?auto_414044 ?auto_414046 ) ) ( not ( = ?auto_414044 ?auto_414047 ) ) ( not ( = ?auto_414044 ?auto_414048 ) ) ( not ( = ?auto_414044 ?auto_414049 ) ) ( not ( = ?auto_414044 ?auto_414050 ) ) ( not ( = ?auto_414044 ?auto_414051 ) ) ( not ( = ?auto_414045 ?auto_414046 ) ) ( not ( = ?auto_414045 ?auto_414047 ) ) ( not ( = ?auto_414045 ?auto_414048 ) ) ( not ( = ?auto_414045 ?auto_414049 ) ) ( not ( = ?auto_414045 ?auto_414050 ) ) ( not ( = ?auto_414045 ?auto_414051 ) ) ( not ( = ?auto_414046 ?auto_414047 ) ) ( not ( = ?auto_414046 ?auto_414048 ) ) ( not ( = ?auto_414046 ?auto_414049 ) ) ( not ( = ?auto_414046 ?auto_414050 ) ) ( not ( = ?auto_414046 ?auto_414051 ) ) ( not ( = ?auto_414047 ?auto_414048 ) ) ( not ( = ?auto_414047 ?auto_414049 ) ) ( not ( = ?auto_414047 ?auto_414050 ) ) ( not ( = ?auto_414047 ?auto_414051 ) ) ( not ( = ?auto_414048 ?auto_414049 ) ) ( not ( = ?auto_414048 ?auto_414050 ) ) ( not ( = ?auto_414048 ?auto_414051 ) ) ( not ( = ?auto_414049 ?auto_414050 ) ) ( not ( = ?auto_414049 ?auto_414051 ) ) ( not ( = ?auto_414050 ?auto_414051 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_414050 ?auto_414051 )
      ( !STACK ?auto_414050 ?auto_414049 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414062 - BLOCK
      ?auto_414063 - BLOCK
      ?auto_414064 - BLOCK
      ?auto_414065 - BLOCK
      ?auto_414066 - BLOCK
      ?auto_414067 - BLOCK
      ?auto_414068 - BLOCK
      ?auto_414069 - BLOCK
      ?auto_414070 - BLOCK
      ?auto_414071 - BLOCK
    )
    :vars
    (
      ?auto_414072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414071 ?auto_414072 ) ( ON-TABLE ?auto_414062 ) ( ON ?auto_414063 ?auto_414062 ) ( ON ?auto_414064 ?auto_414063 ) ( ON ?auto_414065 ?auto_414064 ) ( ON ?auto_414066 ?auto_414065 ) ( ON ?auto_414067 ?auto_414066 ) ( ON ?auto_414068 ?auto_414067 ) ( ON ?auto_414069 ?auto_414068 ) ( not ( = ?auto_414062 ?auto_414063 ) ) ( not ( = ?auto_414062 ?auto_414064 ) ) ( not ( = ?auto_414062 ?auto_414065 ) ) ( not ( = ?auto_414062 ?auto_414066 ) ) ( not ( = ?auto_414062 ?auto_414067 ) ) ( not ( = ?auto_414062 ?auto_414068 ) ) ( not ( = ?auto_414062 ?auto_414069 ) ) ( not ( = ?auto_414062 ?auto_414070 ) ) ( not ( = ?auto_414062 ?auto_414071 ) ) ( not ( = ?auto_414062 ?auto_414072 ) ) ( not ( = ?auto_414063 ?auto_414064 ) ) ( not ( = ?auto_414063 ?auto_414065 ) ) ( not ( = ?auto_414063 ?auto_414066 ) ) ( not ( = ?auto_414063 ?auto_414067 ) ) ( not ( = ?auto_414063 ?auto_414068 ) ) ( not ( = ?auto_414063 ?auto_414069 ) ) ( not ( = ?auto_414063 ?auto_414070 ) ) ( not ( = ?auto_414063 ?auto_414071 ) ) ( not ( = ?auto_414063 ?auto_414072 ) ) ( not ( = ?auto_414064 ?auto_414065 ) ) ( not ( = ?auto_414064 ?auto_414066 ) ) ( not ( = ?auto_414064 ?auto_414067 ) ) ( not ( = ?auto_414064 ?auto_414068 ) ) ( not ( = ?auto_414064 ?auto_414069 ) ) ( not ( = ?auto_414064 ?auto_414070 ) ) ( not ( = ?auto_414064 ?auto_414071 ) ) ( not ( = ?auto_414064 ?auto_414072 ) ) ( not ( = ?auto_414065 ?auto_414066 ) ) ( not ( = ?auto_414065 ?auto_414067 ) ) ( not ( = ?auto_414065 ?auto_414068 ) ) ( not ( = ?auto_414065 ?auto_414069 ) ) ( not ( = ?auto_414065 ?auto_414070 ) ) ( not ( = ?auto_414065 ?auto_414071 ) ) ( not ( = ?auto_414065 ?auto_414072 ) ) ( not ( = ?auto_414066 ?auto_414067 ) ) ( not ( = ?auto_414066 ?auto_414068 ) ) ( not ( = ?auto_414066 ?auto_414069 ) ) ( not ( = ?auto_414066 ?auto_414070 ) ) ( not ( = ?auto_414066 ?auto_414071 ) ) ( not ( = ?auto_414066 ?auto_414072 ) ) ( not ( = ?auto_414067 ?auto_414068 ) ) ( not ( = ?auto_414067 ?auto_414069 ) ) ( not ( = ?auto_414067 ?auto_414070 ) ) ( not ( = ?auto_414067 ?auto_414071 ) ) ( not ( = ?auto_414067 ?auto_414072 ) ) ( not ( = ?auto_414068 ?auto_414069 ) ) ( not ( = ?auto_414068 ?auto_414070 ) ) ( not ( = ?auto_414068 ?auto_414071 ) ) ( not ( = ?auto_414068 ?auto_414072 ) ) ( not ( = ?auto_414069 ?auto_414070 ) ) ( not ( = ?auto_414069 ?auto_414071 ) ) ( not ( = ?auto_414069 ?auto_414072 ) ) ( not ( = ?auto_414070 ?auto_414071 ) ) ( not ( = ?auto_414070 ?auto_414072 ) ) ( not ( = ?auto_414071 ?auto_414072 ) ) ( CLEAR ?auto_414069 ) ( ON ?auto_414070 ?auto_414071 ) ( CLEAR ?auto_414070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_414062 ?auto_414063 ?auto_414064 ?auto_414065 ?auto_414066 ?auto_414067 ?auto_414068 ?auto_414069 ?auto_414070 )
      ( MAKE-10PILE ?auto_414062 ?auto_414063 ?auto_414064 ?auto_414065 ?auto_414066 ?auto_414067 ?auto_414068 ?auto_414069 ?auto_414070 ?auto_414071 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414083 - BLOCK
      ?auto_414084 - BLOCK
      ?auto_414085 - BLOCK
      ?auto_414086 - BLOCK
      ?auto_414087 - BLOCK
      ?auto_414088 - BLOCK
      ?auto_414089 - BLOCK
      ?auto_414090 - BLOCK
      ?auto_414091 - BLOCK
      ?auto_414092 - BLOCK
    )
    :vars
    (
      ?auto_414093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414092 ?auto_414093 ) ( ON-TABLE ?auto_414083 ) ( ON ?auto_414084 ?auto_414083 ) ( ON ?auto_414085 ?auto_414084 ) ( ON ?auto_414086 ?auto_414085 ) ( ON ?auto_414087 ?auto_414086 ) ( ON ?auto_414088 ?auto_414087 ) ( ON ?auto_414089 ?auto_414088 ) ( ON ?auto_414090 ?auto_414089 ) ( not ( = ?auto_414083 ?auto_414084 ) ) ( not ( = ?auto_414083 ?auto_414085 ) ) ( not ( = ?auto_414083 ?auto_414086 ) ) ( not ( = ?auto_414083 ?auto_414087 ) ) ( not ( = ?auto_414083 ?auto_414088 ) ) ( not ( = ?auto_414083 ?auto_414089 ) ) ( not ( = ?auto_414083 ?auto_414090 ) ) ( not ( = ?auto_414083 ?auto_414091 ) ) ( not ( = ?auto_414083 ?auto_414092 ) ) ( not ( = ?auto_414083 ?auto_414093 ) ) ( not ( = ?auto_414084 ?auto_414085 ) ) ( not ( = ?auto_414084 ?auto_414086 ) ) ( not ( = ?auto_414084 ?auto_414087 ) ) ( not ( = ?auto_414084 ?auto_414088 ) ) ( not ( = ?auto_414084 ?auto_414089 ) ) ( not ( = ?auto_414084 ?auto_414090 ) ) ( not ( = ?auto_414084 ?auto_414091 ) ) ( not ( = ?auto_414084 ?auto_414092 ) ) ( not ( = ?auto_414084 ?auto_414093 ) ) ( not ( = ?auto_414085 ?auto_414086 ) ) ( not ( = ?auto_414085 ?auto_414087 ) ) ( not ( = ?auto_414085 ?auto_414088 ) ) ( not ( = ?auto_414085 ?auto_414089 ) ) ( not ( = ?auto_414085 ?auto_414090 ) ) ( not ( = ?auto_414085 ?auto_414091 ) ) ( not ( = ?auto_414085 ?auto_414092 ) ) ( not ( = ?auto_414085 ?auto_414093 ) ) ( not ( = ?auto_414086 ?auto_414087 ) ) ( not ( = ?auto_414086 ?auto_414088 ) ) ( not ( = ?auto_414086 ?auto_414089 ) ) ( not ( = ?auto_414086 ?auto_414090 ) ) ( not ( = ?auto_414086 ?auto_414091 ) ) ( not ( = ?auto_414086 ?auto_414092 ) ) ( not ( = ?auto_414086 ?auto_414093 ) ) ( not ( = ?auto_414087 ?auto_414088 ) ) ( not ( = ?auto_414087 ?auto_414089 ) ) ( not ( = ?auto_414087 ?auto_414090 ) ) ( not ( = ?auto_414087 ?auto_414091 ) ) ( not ( = ?auto_414087 ?auto_414092 ) ) ( not ( = ?auto_414087 ?auto_414093 ) ) ( not ( = ?auto_414088 ?auto_414089 ) ) ( not ( = ?auto_414088 ?auto_414090 ) ) ( not ( = ?auto_414088 ?auto_414091 ) ) ( not ( = ?auto_414088 ?auto_414092 ) ) ( not ( = ?auto_414088 ?auto_414093 ) ) ( not ( = ?auto_414089 ?auto_414090 ) ) ( not ( = ?auto_414089 ?auto_414091 ) ) ( not ( = ?auto_414089 ?auto_414092 ) ) ( not ( = ?auto_414089 ?auto_414093 ) ) ( not ( = ?auto_414090 ?auto_414091 ) ) ( not ( = ?auto_414090 ?auto_414092 ) ) ( not ( = ?auto_414090 ?auto_414093 ) ) ( not ( = ?auto_414091 ?auto_414092 ) ) ( not ( = ?auto_414091 ?auto_414093 ) ) ( not ( = ?auto_414092 ?auto_414093 ) ) ( CLEAR ?auto_414090 ) ( ON ?auto_414091 ?auto_414092 ) ( CLEAR ?auto_414091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_414083 ?auto_414084 ?auto_414085 ?auto_414086 ?auto_414087 ?auto_414088 ?auto_414089 ?auto_414090 ?auto_414091 )
      ( MAKE-10PILE ?auto_414083 ?auto_414084 ?auto_414085 ?auto_414086 ?auto_414087 ?auto_414088 ?auto_414089 ?auto_414090 ?auto_414091 ?auto_414092 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414104 - BLOCK
      ?auto_414105 - BLOCK
      ?auto_414106 - BLOCK
      ?auto_414107 - BLOCK
      ?auto_414108 - BLOCK
      ?auto_414109 - BLOCK
      ?auto_414110 - BLOCK
      ?auto_414111 - BLOCK
      ?auto_414112 - BLOCK
      ?auto_414113 - BLOCK
    )
    :vars
    (
      ?auto_414114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414113 ?auto_414114 ) ( ON-TABLE ?auto_414104 ) ( ON ?auto_414105 ?auto_414104 ) ( ON ?auto_414106 ?auto_414105 ) ( ON ?auto_414107 ?auto_414106 ) ( ON ?auto_414108 ?auto_414107 ) ( ON ?auto_414109 ?auto_414108 ) ( ON ?auto_414110 ?auto_414109 ) ( not ( = ?auto_414104 ?auto_414105 ) ) ( not ( = ?auto_414104 ?auto_414106 ) ) ( not ( = ?auto_414104 ?auto_414107 ) ) ( not ( = ?auto_414104 ?auto_414108 ) ) ( not ( = ?auto_414104 ?auto_414109 ) ) ( not ( = ?auto_414104 ?auto_414110 ) ) ( not ( = ?auto_414104 ?auto_414111 ) ) ( not ( = ?auto_414104 ?auto_414112 ) ) ( not ( = ?auto_414104 ?auto_414113 ) ) ( not ( = ?auto_414104 ?auto_414114 ) ) ( not ( = ?auto_414105 ?auto_414106 ) ) ( not ( = ?auto_414105 ?auto_414107 ) ) ( not ( = ?auto_414105 ?auto_414108 ) ) ( not ( = ?auto_414105 ?auto_414109 ) ) ( not ( = ?auto_414105 ?auto_414110 ) ) ( not ( = ?auto_414105 ?auto_414111 ) ) ( not ( = ?auto_414105 ?auto_414112 ) ) ( not ( = ?auto_414105 ?auto_414113 ) ) ( not ( = ?auto_414105 ?auto_414114 ) ) ( not ( = ?auto_414106 ?auto_414107 ) ) ( not ( = ?auto_414106 ?auto_414108 ) ) ( not ( = ?auto_414106 ?auto_414109 ) ) ( not ( = ?auto_414106 ?auto_414110 ) ) ( not ( = ?auto_414106 ?auto_414111 ) ) ( not ( = ?auto_414106 ?auto_414112 ) ) ( not ( = ?auto_414106 ?auto_414113 ) ) ( not ( = ?auto_414106 ?auto_414114 ) ) ( not ( = ?auto_414107 ?auto_414108 ) ) ( not ( = ?auto_414107 ?auto_414109 ) ) ( not ( = ?auto_414107 ?auto_414110 ) ) ( not ( = ?auto_414107 ?auto_414111 ) ) ( not ( = ?auto_414107 ?auto_414112 ) ) ( not ( = ?auto_414107 ?auto_414113 ) ) ( not ( = ?auto_414107 ?auto_414114 ) ) ( not ( = ?auto_414108 ?auto_414109 ) ) ( not ( = ?auto_414108 ?auto_414110 ) ) ( not ( = ?auto_414108 ?auto_414111 ) ) ( not ( = ?auto_414108 ?auto_414112 ) ) ( not ( = ?auto_414108 ?auto_414113 ) ) ( not ( = ?auto_414108 ?auto_414114 ) ) ( not ( = ?auto_414109 ?auto_414110 ) ) ( not ( = ?auto_414109 ?auto_414111 ) ) ( not ( = ?auto_414109 ?auto_414112 ) ) ( not ( = ?auto_414109 ?auto_414113 ) ) ( not ( = ?auto_414109 ?auto_414114 ) ) ( not ( = ?auto_414110 ?auto_414111 ) ) ( not ( = ?auto_414110 ?auto_414112 ) ) ( not ( = ?auto_414110 ?auto_414113 ) ) ( not ( = ?auto_414110 ?auto_414114 ) ) ( not ( = ?auto_414111 ?auto_414112 ) ) ( not ( = ?auto_414111 ?auto_414113 ) ) ( not ( = ?auto_414111 ?auto_414114 ) ) ( not ( = ?auto_414112 ?auto_414113 ) ) ( not ( = ?auto_414112 ?auto_414114 ) ) ( not ( = ?auto_414113 ?auto_414114 ) ) ( ON ?auto_414112 ?auto_414113 ) ( CLEAR ?auto_414110 ) ( ON ?auto_414111 ?auto_414112 ) ( CLEAR ?auto_414111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_414104 ?auto_414105 ?auto_414106 ?auto_414107 ?auto_414108 ?auto_414109 ?auto_414110 ?auto_414111 )
      ( MAKE-10PILE ?auto_414104 ?auto_414105 ?auto_414106 ?auto_414107 ?auto_414108 ?auto_414109 ?auto_414110 ?auto_414111 ?auto_414112 ?auto_414113 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414125 - BLOCK
      ?auto_414126 - BLOCK
      ?auto_414127 - BLOCK
      ?auto_414128 - BLOCK
      ?auto_414129 - BLOCK
      ?auto_414130 - BLOCK
      ?auto_414131 - BLOCK
      ?auto_414132 - BLOCK
      ?auto_414133 - BLOCK
      ?auto_414134 - BLOCK
    )
    :vars
    (
      ?auto_414135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414134 ?auto_414135 ) ( ON-TABLE ?auto_414125 ) ( ON ?auto_414126 ?auto_414125 ) ( ON ?auto_414127 ?auto_414126 ) ( ON ?auto_414128 ?auto_414127 ) ( ON ?auto_414129 ?auto_414128 ) ( ON ?auto_414130 ?auto_414129 ) ( ON ?auto_414131 ?auto_414130 ) ( not ( = ?auto_414125 ?auto_414126 ) ) ( not ( = ?auto_414125 ?auto_414127 ) ) ( not ( = ?auto_414125 ?auto_414128 ) ) ( not ( = ?auto_414125 ?auto_414129 ) ) ( not ( = ?auto_414125 ?auto_414130 ) ) ( not ( = ?auto_414125 ?auto_414131 ) ) ( not ( = ?auto_414125 ?auto_414132 ) ) ( not ( = ?auto_414125 ?auto_414133 ) ) ( not ( = ?auto_414125 ?auto_414134 ) ) ( not ( = ?auto_414125 ?auto_414135 ) ) ( not ( = ?auto_414126 ?auto_414127 ) ) ( not ( = ?auto_414126 ?auto_414128 ) ) ( not ( = ?auto_414126 ?auto_414129 ) ) ( not ( = ?auto_414126 ?auto_414130 ) ) ( not ( = ?auto_414126 ?auto_414131 ) ) ( not ( = ?auto_414126 ?auto_414132 ) ) ( not ( = ?auto_414126 ?auto_414133 ) ) ( not ( = ?auto_414126 ?auto_414134 ) ) ( not ( = ?auto_414126 ?auto_414135 ) ) ( not ( = ?auto_414127 ?auto_414128 ) ) ( not ( = ?auto_414127 ?auto_414129 ) ) ( not ( = ?auto_414127 ?auto_414130 ) ) ( not ( = ?auto_414127 ?auto_414131 ) ) ( not ( = ?auto_414127 ?auto_414132 ) ) ( not ( = ?auto_414127 ?auto_414133 ) ) ( not ( = ?auto_414127 ?auto_414134 ) ) ( not ( = ?auto_414127 ?auto_414135 ) ) ( not ( = ?auto_414128 ?auto_414129 ) ) ( not ( = ?auto_414128 ?auto_414130 ) ) ( not ( = ?auto_414128 ?auto_414131 ) ) ( not ( = ?auto_414128 ?auto_414132 ) ) ( not ( = ?auto_414128 ?auto_414133 ) ) ( not ( = ?auto_414128 ?auto_414134 ) ) ( not ( = ?auto_414128 ?auto_414135 ) ) ( not ( = ?auto_414129 ?auto_414130 ) ) ( not ( = ?auto_414129 ?auto_414131 ) ) ( not ( = ?auto_414129 ?auto_414132 ) ) ( not ( = ?auto_414129 ?auto_414133 ) ) ( not ( = ?auto_414129 ?auto_414134 ) ) ( not ( = ?auto_414129 ?auto_414135 ) ) ( not ( = ?auto_414130 ?auto_414131 ) ) ( not ( = ?auto_414130 ?auto_414132 ) ) ( not ( = ?auto_414130 ?auto_414133 ) ) ( not ( = ?auto_414130 ?auto_414134 ) ) ( not ( = ?auto_414130 ?auto_414135 ) ) ( not ( = ?auto_414131 ?auto_414132 ) ) ( not ( = ?auto_414131 ?auto_414133 ) ) ( not ( = ?auto_414131 ?auto_414134 ) ) ( not ( = ?auto_414131 ?auto_414135 ) ) ( not ( = ?auto_414132 ?auto_414133 ) ) ( not ( = ?auto_414132 ?auto_414134 ) ) ( not ( = ?auto_414132 ?auto_414135 ) ) ( not ( = ?auto_414133 ?auto_414134 ) ) ( not ( = ?auto_414133 ?auto_414135 ) ) ( not ( = ?auto_414134 ?auto_414135 ) ) ( ON ?auto_414133 ?auto_414134 ) ( CLEAR ?auto_414131 ) ( ON ?auto_414132 ?auto_414133 ) ( CLEAR ?auto_414132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_414125 ?auto_414126 ?auto_414127 ?auto_414128 ?auto_414129 ?auto_414130 ?auto_414131 ?auto_414132 )
      ( MAKE-10PILE ?auto_414125 ?auto_414126 ?auto_414127 ?auto_414128 ?auto_414129 ?auto_414130 ?auto_414131 ?auto_414132 ?auto_414133 ?auto_414134 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414146 - BLOCK
      ?auto_414147 - BLOCK
      ?auto_414148 - BLOCK
      ?auto_414149 - BLOCK
      ?auto_414150 - BLOCK
      ?auto_414151 - BLOCK
      ?auto_414152 - BLOCK
      ?auto_414153 - BLOCK
      ?auto_414154 - BLOCK
      ?auto_414155 - BLOCK
    )
    :vars
    (
      ?auto_414156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414155 ?auto_414156 ) ( ON-TABLE ?auto_414146 ) ( ON ?auto_414147 ?auto_414146 ) ( ON ?auto_414148 ?auto_414147 ) ( ON ?auto_414149 ?auto_414148 ) ( ON ?auto_414150 ?auto_414149 ) ( ON ?auto_414151 ?auto_414150 ) ( not ( = ?auto_414146 ?auto_414147 ) ) ( not ( = ?auto_414146 ?auto_414148 ) ) ( not ( = ?auto_414146 ?auto_414149 ) ) ( not ( = ?auto_414146 ?auto_414150 ) ) ( not ( = ?auto_414146 ?auto_414151 ) ) ( not ( = ?auto_414146 ?auto_414152 ) ) ( not ( = ?auto_414146 ?auto_414153 ) ) ( not ( = ?auto_414146 ?auto_414154 ) ) ( not ( = ?auto_414146 ?auto_414155 ) ) ( not ( = ?auto_414146 ?auto_414156 ) ) ( not ( = ?auto_414147 ?auto_414148 ) ) ( not ( = ?auto_414147 ?auto_414149 ) ) ( not ( = ?auto_414147 ?auto_414150 ) ) ( not ( = ?auto_414147 ?auto_414151 ) ) ( not ( = ?auto_414147 ?auto_414152 ) ) ( not ( = ?auto_414147 ?auto_414153 ) ) ( not ( = ?auto_414147 ?auto_414154 ) ) ( not ( = ?auto_414147 ?auto_414155 ) ) ( not ( = ?auto_414147 ?auto_414156 ) ) ( not ( = ?auto_414148 ?auto_414149 ) ) ( not ( = ?auto_414148 ?auto_414150 ) ) ( not ( = ?auto_414148 ?auto_414151 ) ) ( not ( = ?auto_414148 ?auto_414152 ) ) ( not ( = ?auto_414148 ?auto_414153 ) ) ( not ( = ?auto_414148 ?auto_414154 ) ) ( not ( = ?auto_414148 ?auto_414155 ) ) ( not ( = ?auto_414148 ?auto_414156 ) ) ( not ( = ?auto_414149 ?auto_414150 ) ) ( not ( = ?auto_414149 ?auto_414151 ) ) ( not ( = ?auto_414149 ?auto_414152 ) ) ( not ( = ?auto_414149 ?auto_414153 ) ) ( not ( = ?auto_414149 ?auto_414154 ) ) ( not ( = ?auto_414149 ?auto_414155 ) ) ( not ( = ?auto_414149 ?auto_414156 ) ) ( not ( = ?auto_414150 ?auto_414151 ) ) ( not ( = ?auto_414150 ?auto_414152 ) ) ( not ( = ?auto_414150 ?auto_414153 ) ) ( not ( = ?auto_414150 ?auto_414154 ) ) ( not ( = ?auto_414150 ?auto_414155 ) ) ( not ( = ?auto_414150 ?auto_414156 ) ) ( not ( = ?auto_414151 ?auto_414152 ) ) ( not ( = ?auto_414151 ?auto_414153 ) ) ( not ( = ?auto_414151 ?auto_414154 ) ) ( not ( = ?auto_414151 ?auto_414155 ) ) ( not ( = ?auto_414151 ?auto_414156 ) ) ( not ( = ?auto_414152 ?auto_414153 ) ) ( not ( = ?auto_414152 ?auto_414154 ) ) ( not ( = ?auto_414152 ?auto_414155 ) ) ( not ( = ?auto_414152 ?auto_414156 ) ) ( not ( = ?auto_414153 ?auto_414154 ) ) ( not ( = ?auto_414153 ?auto_414155 ) ) ( not ( = ?auto_414153 ?auto_414156 ) ) ( not ( = ?auto_414154 ?auto_414155 ) ) ( not ( = ?auto_414154 ?auto_414156 ) ) ( not ( = ?auto_414155 ?auto_414156 ) ) ( ON ?auto_414154 ?auto_414155 ) ( ON ?auto_414153 ?auto_414154 ) ( CLEAR ?auto_414151 ) ( ON ?auto_414152 ?auto_414153 ) ( CLEAR ?auto_414152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_414146 ?auto_414147 ?auto_414148 ?auto_414149 ?auto_414150 ?auto_414151 ?auto_414152 )
      ( MAKE-10PILE ?auto_414146 ?auto_414147 ?auto_414148 ?auto_414149 ?auto_414150 ?auto_414151 ?auto_414152 ?auto_414153 ?auto_414154 ?auto_414155 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414167 - BLOCK
      ?auto_414168 - BLOCK
      ?auto_414169 - BLOCK
      ?auto_414170 - BLOCK
      ?auto_414171 - BLOCK
      ?auto_414172 - BLOCK
      ?auto_414173 - BLOCK
      ?auto_414174 - BLOCK
      ?auto_414175 - BLOCK
      ?auto_414176 - BLOCK
    )
    :vars
    (
      ?auto_414177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414176 ?auto_414177 ) ( ON-TABLE ?auto_414167 ) ( ON ?auto_414168 ?auto_414167 ) ( ON ?auto_414169 ?auto_414168 ) ( ON ?auto_414170 ?auto_414169 ) ( ON ?auto_414171 ?auto_414170 ) ( ON ?auto_414172 ?auto_414171 ) ( not ( = ?auto_414167 ?auto_414168 ) ) ( not ( = ?auto_414167 ?auto_414169 ) ) ( not ( = ?auto_414167 ?auto_414170 ) ) ( not ( = ?auto_414167 ?auto_414171 ) ) ( not ( = ?auto_414167 ?auto_414172 ) ) ( not ( = ?auto_414167 ?auto_414173 ) ) ( not ( = ?auto_414167 ?auto_414174 ) ) ( not ( = ?auto_414167 ?auto_414175 ) ) ( not ( = ?auto_414167 ?auto_414176 ) ) ( not ( = ?auto_414167 ?auto_414177 ) ) ( not ( = ?auto_414168 ?auto_414169 ) ) ( not ( = ?auto_414168 ?auto_414170 ) ) ( not ( = ?auto_414168 ?auto_414171 ) ) ( not ( = ?auto_414168 ?auto_414172 ) ) ( not ( = ?auto_414168 ?auto_414173 ) ) ( not ( = ?auto_414168 ?auto_414174 ) ) ( not ( = ?auto_414168 ?auto_414175 ) ) ( not ( = ?auto_414168 ?auto_414176 ) ) ( not ( = ?auto_414168 ?auto_414177 ) ) ( not ( = ?auto_414169 ?auto_414170 ) ) ( not ( = ?auto_414169 ?auto_414171 ) ) ( not ( = ?auto_414169 ?auto_414172 ) ) ( not ( = ?auto_414169 ?auto_414173 ) ) ( not ( = ?auto_414169 ?auto_414174 ) ) ( not ( = ?auto_414169 ?auto_414175 ) ) ( not ( = ?auto_414169 ?auto_414176 ) ) ( not ( = ?auto_414169 ?auto_414177 ) ) ( not ( = ?auto_414170 ?auto_414171 ) ) ( not ( = ?auto_414170 ?auto_414172 ) ) ( not ( = ?auto_414170 ?auto_414173 ) ) ( not ( = ?auto_414170 ?auto_414174 ) ) ( not ( = ?auto_414170 ?auto_414175 ) ) ( not ( = ?auto_414170 ?auto_414176 ) ) ( not ( = ?auto_414170 ?auto_414177 ) ) ( not ( = ?auto_414171 ?auto_414172 ) ) ( not ( = ?auto_414171 ?auto_414173 ) ) ( not ( = ?auto_414171 ?auto_414174 ) ) ( not ( = ?auto_414171 ?auto_414175 ) ) ( not ( = ?auto_414171 ?auto_414176 ) ) ( not ( = ?auto_414171 ?auto_414177 ) ) ( not ( = ?auto_414172 ?auto_414173 ) ) ( not ( = ?auto_414172 ?auto_414174 ) ) ( not ( = ?auto_414172 ?auto_414175 ) ) ( not ( = ?auto_414172 ?auto_414176 ) ) ( not ( = ?auto_414172 ?auto_414177 ) ) ( not ( = ?auto_414173 ?auto_414174 ) ) ( not ( = ?auto_414173 ?auto_414175 ) ) ( not ( = ?auto_414173 ?auto_414176 ) ) ( not ( = ?auto_414173 ?auto_414177 ) ) ( not ( = ?auto_414174 ?auto_414175 ) ) ( not ( = ?auto_414174 ?auto_414176 ) ) ( not ( = ?auto_414174 ?auto_414177 ) ) ( not ( = ?auto_414175 ?auto_414176 ) ) ( not ( = ?auto_414175 ?auto_414177 ) ) ( not ( = ?auto_414176 ?auto_414177 ) ) ( ON ?auto_414175 ?auto_414176 ) ( ON ?auto_414174 ?auto_414175 ) ( CLEAR ?auto_414172 ) ( ON ?auto_414173 ?auto_414174 ) ( CLEAR ?auto_414173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_414167 ?auto_414168 ?auto_414169 ?auto_414170 ?auto_414171 ?auto_414172 ?auto_414173 )
      ( MAKE-10PILE ?auto_414167 ?auto_414168 ?auto_414169 ?auto_414170 ?auto_414171 ?auto_414172 ?auto_414173 ?auto_414174 ?auto_414175 ?auto_414176 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414188 - BLOCK
      ?auto_414189 - BLOCK
      ?auto_414190 - BLOCK
      ?auto_414191 - BLOCK
      ?auto_414192 - BLOCK
      ?auto_414193 - BLOCK
      ?auto_414194 - BLOCK
      ?auto_414195 - BLOCK
      ?auto_414196 - BLOCK
      ?auto_414197 - BLOCK
    )
    :vars
    (
      ?auto_414198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414197 ?auto_414198 ) ( ON-TABLE ?auto_414188 ) ( ON ?auto_414189 ?auto_414188 ) ( ON ?auto_414190 ?auto_414189 ) ( ON ?auto_414191 ?auto_414190 ) ( ON ?auto_414192 ?auto_414191 ) ( not ( = ?auto_414188 ?auto_414189 ) ) ( not ( = ?auto_414188 ?auto_414190 ) ) ( not ( = ?auto_414188 ?auto_414191 ) ) ( not ( = ?auto_414188 ?auto_414192 ) ) ( not ( = ?auto_414188 ?auto_414193 ) ) ( not ( = ?auto_414188 ?auto_414194 ) ) ( not ( = ?auto_414188 ?auto_414195 ) ) ( not ( = ?auto_414188 ?auto_414196 ) ) ( not ( = ?auto_414188 ?auto_414197 ) ) ( not ( = ?auto_414188 ?auto_414198 ) ) ( not ( = ?auto_414189 ?auto_414190 ) ) ( not ( = ?auto_414189 ?auto_414191 ) ) ( not ( = ?auto_414189 ?auto_414192 ) ) ( not ( = ?auto_414189 ?auto_414193 ) ) ( not ( = ?auto_414189 ?auto_414194 ) ) ( not ( = ?auto_414189 ?auto_414195 ) ) ( not ( = ?auto_414189 ?auto_414196 ) ) ( not ( = ?auto_414189 ?auto_414197 ) ) ( not ( = ?auto_414189 ?auto_414198 ) ) ( not ( = ?auto_414190 ?auto_414191 ) ) ( not ( = ?auto_414190 ?auto_414192 ) ) ( not ( = ?auto_414190 ?auto_414193 ) ) ( not ( = ?auto_414190 ?auto_414194 ) ) ( not ( = ?auto_414190 ?auto_414195 ) ) ( not ( = ?auto_414190 ?auto_414196 ) ) ( not ( = ?auto_414190 ?auto_414197 ) ) ( not ( = ?auto_414190 ?auto_414198 ) ) ( not ( = ?auto_414191 ?auto_414192 ) ) ( not ( = ?auto_414191 ?auto_414193 ) ) ( not ( = ?auto_414191 ?auto_414194 ) ) ( not ( = ?auto_414191 ?auto_414195 ) ) ( not ( = ?auto_414191 ?auto_414196 ) ) ( not ( = ?auto_414191 ?auto_414197 ) ) ( not ( = ?auto_414191 ?auto_414198 ) ) ( not ( = ?auto_414192 ?auto_414193 ) ) ( not ( = ?auto_414192 ?auto_414194 ) ) ( not ( = ?auto_414192 ?auto_414195 ) ) ( not ( = ?auto_414192 ?auto_414196 ) ) ( not ( = ?auto_414192 ?auto_414197 ) ) ( not ( = ?auto_414192 ?auto_414198 ) ) ( not ( = ?auto_414193 ?auto_414194 ) ) ( not ( = ?auto_414193 ?auto_414195 ) ) ( not ( = ?auto_414193 ?auto_414196 ) ) ( not ( = ?auto_414193 ?auto_414197 ) ) ( not ( = ?auto_414193 ?auto_414198 ) ) ( not ( = ?auto_414194 ?auto_414195 ) ) ( not ( = ?auto_414194 ?auto_414196 ) ) ( not ( = ?auto_414194 ?auto_414197 ) ) ( not ( = ?auto_414194 ?auto_414198 ) ) ( not ( = ?auto_414195 ?auto_414196 ) ) ( not ( = ?auto_414195 ?auto_414197 ) ) ( not ( = ?auto_414195 ?auto_414198 ) ) ( not ( = ?auto_414196 ?auto_414197 ) ) ( not ( = ?auto_414196 ?auto_414198 ) ) ( not ( = ?auto_414197 ?auto_414198 ) ) ( ON ?auto_414196 ?auto_414197 ) ( ON ?auto_414195 ?auto_414196 ) ( ON ?auto_414194 ?auto_414195 ) ( CLEAR ?auto_414192 ) ( ON ?auto_414193 ?auto_414194 ) ( CLEAR ?auto_414193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_414188 ?auto_414189 ?auto_414190 ?auto_414191 ?auto_414192 ?auto_414193 )
      ( MAKE-10PILE ?auto_414188 ?auto_414189 ?auto_414190 ?auto_414191 ?auto_414192 ?auto_414193 ?auto_414194 ?auto_414195 ?auto_414196 ?auto_414197 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414209 - BLOCK
      ?auto_414210 - BLOCK
      ?auto_414211 - BLOCK
      ?auto_414212 - BLOCK
      ?auto_414213 - BLOCK
      ?auto_414214 - BLOCK
      ?auto_414215 - BLOCK
      ?auto_414216 - BLOCK
      ?auto_414217 - BLOCK
      ?auto_414218 - BLOCK
    )
    :vars
    (
      ?auto_414219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414218 ?auto_414219 ) ( ON-TABLE ?auto_414209 ) ( ON ?auto_414210 ?auto_414209 ) ( ON ?auto_414211 ?auto_414210 ) ( ON ?auto_414212 ?auto_414211 ) ( ON ?auto_414213 ?auto_414212 ) ( not ( = ?auto_414209 ?auto_414210 ) ) ( not ( = ?auto_414209 ?auto_414211 ) ) ( not ( = ?auto_414209 ?auto_414212 ) ) ( not ( = ?auto_414209 ?auto_414213 ) ) ( not ( = ?auto_414209 ?auto_414214 ) ) ( not ( = ?auto_414209 ?auto_414215 ) ) ( not ( = ?auto_414209 ?auto_414216 ) ) ( not ( = ?auto_414209 ?auto_414217 ) ) ( not ( = ?auto_414209 ?auto_414218 ) ) ( not ( = ?auto_414209 ?auto_414219 ) ) ( not ( = ?auto_414210 ?auto_414211 ) ) ( not ( = ?auto_414210 ?auto_414212 ) ) ( not ( = ?auto_414210 ?auto_414213 ) ) ( not ( = ?auto_414210 ?auto_414214 ) ) ( not ( = ?auto_414210 ?auto_414215 ) ) ( not ( = ?auto_414210 ?auto_414216 ) ) ( not ( = ?auto_414210 ?auto_414217 ) ) ( not ( = ?auto_414210 ?auto_414218 ) ) ( not ( = ?auto_414210 ?auto_414219 ) ) ( not ( = ?auto_414211 ?auto_414212 ) ) ( not ( = ?auto_414211 ?auto_414213 ) ) ( not ( = ?auto_414211 ?auto_414214 ) ) ( not ( = ?auto_414211 ?auto_414215 ) ) ( not ( = ?auto_414211 ?auto_414216 ) ) ( not ( = ?auto_414211 ?auto_414217 ) ) ( not ( = ?auto_414211 ?auto_414218 ) ) ( not ( = ?auto_414211 ?auto_414219 ) ) ( not ( = ?auto_414212 ?auto_414213 ) ) ( not ( = ?auto_414212 ?auto_414214 ) ) ( not ( = ?auto_414212 ?auto_414215 ) ) ( not ( = ?auto_414212 ?auto_414216 ) ) ( not ( = ?auto_414212 ?auto_414217 ) ) ( not ( = ?auto_414212 ?auto_414218 ) ) ( not ( = ?auto_414212 ?auto_414219 ) ) ( not ( = ?auto_414213 ?auto_414214 ) ) ( not ( = ?auto_414213 ?auto_414215 ) ) ( not ( = ?auto_414213 ?auto_414216 ) ) ( not ( = ?auto_414213 ?auto_414217 ) ) ( not ( = ?auto_414213 ?auto_414218 ) ) ( not ( = ?auto_414213 ?auto_414219 ) ) ( not ( = ?auto_414214 ?auto_414215 ) ) ( not ( = ?auto_414214 ?auto_414216 ) ) ( not ( = ?auto_414214 ?auto_414217 ) ) ( not ( = ?auto_414214 ?auto_414218 ) ) ( not ( = ?auto_414214 ?auto_414219 ) ) ( not ( = ?auto_414215 ?auto_414216 ) ) ( not ( = ?auto_414215 ?auto_414217 ) ) ( not ( = ?auto_414215 ?auto_414218 ) ) ( not ( = ?auto_414215 ?auto_414219 ) ) ( not ( = ?auto_414216 ?auto_414217 ) ) ( not ( = ?auto_414216 ?auto_414218 ) ) ( not ( = ?auto_414216 ?auto_414219 ) ) ( not ( = ?auto_414217 ?auto_414218 ) ) ( not ( = ?auto_414217 ?auto_414219 ) ) ( not ( = ?auto_414218 ?auto_414219 ) ) ( ON ?auto_414217 ?auto_414218 ) ( ON ?auto_414216 ?auto_414217 ) ( ON ?auto_414215 ?auto_414216 ) ( CLEAR ?auto_414213 ) ( ON ?auto_414214 ?auto_414215 ) ( CLEAR ?auto_414214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_414209 ?auto_414210 ?auto_414211 ?auto_414212 ?auto_414213 ?auto_414214 )
      ( MAKE-10PILE ?auto_414209 ?auto_414210 ?auto_414211 ?auto_414212 ?auto_414213 ?auto_414214 ?auto_414215 ?auto_414216 ?auto_414217 ?auto_414218 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414230 - BLOCK
      ?auto_414231 - BLOCK
      ?auto_414232 - BLOCK
      ?auto_414233 - BLOCK
      ?auto_414234 - BLOCK
      ?auto_414235 - BLOCK
      ?auto_414236 - BLOCK
      ?auto_414237 - BLOCK
      ?auto_414238 - BLOCK
      ?auto_414239 - BLOCK
    )
    :vars
    (
      ?auto_414240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414239 ?auto_414240 ) ( ON-TABLE ?auto_414230 ) ( ON ?auto_414231 ?auto_414230 ) ( ON ?auto_414232 ?auto_414231 ) ( ON ?auto_414233 ?auto_414232 ) ( not ( = ?auto_414230 ?auto_414231 ) ) ( not ( = ?auto_414230 ?auto_414232 ) ) ( not ( = ?auto_414230 ?auto_414233 ) ) ( not ( = ?auto_414230 ?auto_414234 ) ) ( not ( = ?auto_414230 ?auto_414235 ) ) ( not ( = ?auto_414230 ?auto_414236 ) ) ( not ( = ?auto_414230 ?auto_414237 ) ) ( not ( = ?auto_414230 ?auto_414238 ) ) ( not ( = ?auto_414230 ?auto_414239 ) ) ( not ( = ?auto_414230 ?auto_414240 ) ) ( not ( = ?auto_414231 ?auto_414232 ) ) ( not ( = ?auto_414231 ?auto_414233 ) ) ( not ( = ?auto_414231 ?auto_414234 ) ) ( not ( = ?auto_414231 ?auto_414235 ) ) ( not ( = ?auto_414231 ?auto_414236 ) ) ( not ( = ?auto_414231 ?auto_414237 ) ) ( not ( = ?auto_414231 ?auto_414238 ) ) ( not ( = ?auto_414231 ?auto_414239 ) ) ( not ( = ?auto_414231 ?auto_414240 ) ) ( not ( = ?auto_414232 ?auto_414233 ) ) ( not ( = ?auto_414232 ?auto_414234 ) ) ( not ( = ?auto_414232 ?auto_414235 ) ) ( not ( = ?auto_414232 ?auto_414236 ) ) ( not ( = ?auto_414232 ?auto_414237 ) ) ( not ( = ?auto_414232 ?auto_414238 ) ) ( not ( = ?auto_414232 ?auto_414239 ) ) ( not ( = ?auto_414232 ?auto_414240 ) ) ( not ( = ?auto_414233 ?auto_414234 ) ) ( not ( = ?auto_414233 ?auto_414235 ) ) ( not ( = ?auto_414233 ?auto_414236 ) ) ( not ( = ?auto_414233 ?auto_414237 ) ) ( not ( = ?auto_414233 ?auto_414238 ) ) ( not ( = ?auto_414233 ?auto_414239 ) ) ( not ( = ?auto_414233 ?auto_414240 ) ) ( not ( = ?auto_414234 ?auto_414235 ) ) ( not ( = ?auto_414234 ?auto_414236 ) ) ( not ( = ?auto_414234 ?auto_414237 ) ) ( not ( = ?auto_414234 ?auto_414238 ) ) ( not ( = ?auto_414234 ?auto_414239 ) ) ( not ( = ?auto_414234 ?auto_414240 ) ) ( not ( = ?auto_414235 ?auto_414236 ) ) ( not ( = ?auto_414235 ?auto_414237 ) ) ( not ( = ?auto_414235 ?auto_414238 ) ) ( not ( = ?auto_414235 ?auto_414239 ) ) ( not ( = ?auto_414235 ?auto_414240 ) ) ( not ( = ?auto_414236 ?auto_414237 ) ) ( not ( = ?auto_414236 ?auto_414238 ) ) ( not ( = ?auto_414236 ?auto_414239 ) ) ( not ( = ?auto_414236 ?auto_414240 ) ) ( not ( = ?auto_414237 ?auto_414238 ) ) ( not ( = ?auto_414237 ?auto_414239 ) ) ( not ( = ?auto_414237 ?auto_414240 ) ) ( not ( = ?auto_414238 ?auto_414239 ) ) ( not ( = ?auto_414238 ?auto_414240 ) ) ( not ( = ?auto_414239 ?auto_414240 ) ) ( ON ?auto_414238 ?auto_414239 ) ( ON ?auto_414237 ?auto_414238 ) ( ON ?auto_414236 ?auto_414237 ) ( ON ?auto_414235 ?auto_414236 ) ( CLEAR ?auto_414233 ) ( ON ?auto_414234 ?auto_414235 ) ( CLEAR ?auto_414234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_414230 ?auto_414231 ?auto_414232 ?auto_414233 ?auto_414234 )
      ( MAKE-10PILE ?auto_414230 ?auto_414231 ?auto_414232 ?auto_414233 ?auto_414234 ?auto_414235 ?auto_414236 ?auto_414237 ?auto_414238 ?auto_414239 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414251 - BLOCK
      ?auto_414252 - BLOCK
      ?auto_414253 - BLOCK
      ?auto_414254 - BLOCK
      ?auto_414255 - BLOCK
      ?auto_414256 - BLOCK
      ?auto_414257 - BLOCK
      ?auto_414258 - BLOCK
      ?auto_414259 - BLOCK
      ?auto_414260 - BLOCK
    )
    :vars
    (
      ?auto_414261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414260 ?auto_414261 ) ( ON-TABLE ?auto_414251 ) ( ON ?auto_414252 ?auto_414251 ) ( ON ?auto_414253 ?auto_414252 ) ( ON ?auto_414254 ?auto_414253 ) ( not ( = ?auto_414251 ?auto_414252 ) ) ( not ( = ?auto_414251 ?auto_414253 ) ) ( not ( = ?auto_414251 ?auto_414254 ) ) ( not ( = ?auto_414251 ?auto_414255 ) ) ( not ( = ?auto_414251 ?auto_414256 ) ) ( not ( = ?auto_414251 ?auto_414257 ) ) ( not ( = ?auto_414251 ?auto_414258 ) ) ( not ( = ?auto_414251 ?auto_414259 ) ) ( not ( = ?auto_414251 ?auto_414260 ) ) ( not ( = ?auto_414251 ?auto_414261 ) ) ( not ( = ?auto_414252 ?auto_414253 ) ) ( not ( = ?auto_414252 ?auto_414254 ) ) ( not ( = ?auto_414252 ?auto_414255 ) ) ( not ( = ?auto_414252 ?auto_414256 ) ) ( not ( = ?auto_414252 ?auto_414257 ) ) ( not ( = ?auto_414252 ?auto_414258 ) ) ( not ( = ?auto_414252 ?auto_414259 ) ) ( not ( = ?auto_414252 ?auto_414260 ) ) ( not ( = ?auto_414252 ?auto_414261 ) ) ( not ( = ?auto_414253 ?auto_414254 ) ) ( not ( = ?auto_414253 ?auto_414255 ) ) ( not ( = ?auto_414253 ?auto_414256 ) ) ( not ( = ?auto_414253 ?auto_414257 ) ) ( not ( = ?auto_414253 ?auto_414258 ) ) ( not ( = ?auto_414253 ?auto_414259 ) ) ( not ( = ?auto_414253 ?auto_414260 ) ) ( not ( = ?auto_414253 ?auto_414261 ) ) ( not ( = ?auto_414254 ?auto_414255 ) ) ( not ( = ?auto_414254 ?auto_414256 ) ) ( not ( = ?auto_414254 ?auto_414257 ) ) ( not ( = ?auto_414254 ?auto_414258 ) ) ( not ( = ?auto_414254 ?auto_414259 ) ) ( not ( = ?auto_414254 ?auto_414260 ) ) ( not ( = ?auto_414254 ?auto_414261 ) ) ( not ( = ?auto_414255 ?auto_414256 ) ) ( not ( = ?auto_414255 ?auto_414257 ) ) ( not ( = ?auto_414255 ?auto_414258 ) ) ( not ( = ?auto_414255 ?auto_414259 ) ) ( not ( = ?auto_414255 ?auto_414260 ) ) ( not ( = ?auto_414255 ?auto_414261 ) ) ( not ( = ?auto_414256 ?auto_414257 ) ) ( not ( = ?auto_414256 ?auto_414258 ) ) ( not ( = ?auto_414256 ?auto_414259 ) ) ( not ( = ?auto_414256 ?auto_414260 ) ) ( not ( = ?auto_414256 ?auto_414261 ) ) ( not ( = ?auto_414257 ?auto_414258 ) ) ( not ( = ?auto_414257 ?auto_414259 ) ) ( not ( = ?auto_414257 ?auto_414260 ) ) ( not ( = ?auto_414257 ?auto_414261 ) ) ( not ( = ?auto_414258 ?auto_414259 ) ) ( not ( = ?auto_414258 ?auto_414260 ) ) ( not ( = ?auto_414258 ?auto_414261 ) ) ( not ( = ?auto_414259 ?auto_414260 ) ) ( not ( = ?auto_414259 ?auto_414261 ) ) ( not ( = ?auto_414260 ?auto_414261 ) ) ( ON ?auto_414259 ?auto_414260 ) ( ON ?auto_414258 ?auto_414259 ) ( ON ?auto_414257 ?auto_414258 ) ( ON ?auto_414256 ?auto_414257 ) ( CLEAR ?auto_414254 ) ( ON ?auto_414255 ?auto_414256 ) ( CLEAR ?auto_414255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_414251 ?auto_414252 ?auto_414253 ?auto_414254 ?auto_414255 )
      ( MAKE-10PILE ?auto_414251 ?auto_414252 ?auto_414253 ?auto_414254 ?auto_414255 ?auto_414256 ?auto_414257 ?auto_414258 ?auto_414259 ?auto_414260 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414272 - BLOCK
      ?auto_414273 - BLOCK
      ?auto_414274 - BLOCK
      ?auto_414275 - BLOCK
      ?auto_414276 - BLOCK
      ?auto_414277 - BLOCK
      ?auto_414278 - BLOCK
      ?auto_414279 - BLOCK
      ?auto_414280 - BLOCK
      ?auto_414281 - BLOCK
    )
    :vars
    (
      ?auto_414282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414281 ?auto_414282 ) ( ON-TABLE ?auto_414272 ) ( ON ?auto_414273 ?auto_414272 ) ( ON ?auto_414274 ?auto_414273 ) ( not ( = ?auto_414272 ?auto_414273 ) ) ( not ( = ?auto_414272 ?auto_414274 ) ) ( not ( = ?auto_414272 ?auto_414275 ) ) ( not ( = ?auto_414272 ?auto_414276 ) ) ( not ( = ?auto_414272 ?auto_414277 ) ) ( not ( = ?auto_414272 ?auto_414278 ) ) ( not ( = ?auto_414272 ?auto_414279 ) ) ( not ( = ?auto_414272 ?auto_414280 ) ) ( not ( = ?auto_414272 ?auto_414281 ) ) ( not ( = ?auto_414272 ?auto_414282 ) ) ( not ( = ?auto_414273 ?auto_414274 ) ) ( not ( = ?auto_414273 ?auto_414275 ) ) ( not ( = ?auto_414273 ?auto_414276 ) ) ( not ( = ?auto_414273 ?auto_414277 ) ) ( not ( = ?auto_414273 ?auto_414278 ) ) ( not ( = ?auto_414273 ?auto_414279 ) ) ( not ( = ?auto_414273 ?auto_414280 ) ) ( not ( = ?auto_414273 ?auto_414281 ) ) ( not ( = ?auto_414273 ?auto_414282 ) ) ( not ( = ?auto_414274 ?auto_414275 ) ) ( not ( = ?auto_414274 ?auto_414276 ) ) ( not ( = ?auto_414274 ?auto_414277 ) ) ( not ( = ?auto_414274 ?auto_414278 ) ) ( not ( = ?auto_414274 ?auto_414279 ) ) ( not ( = ?auto_414274 ?auto_414280 ) ) ( not ( = ?auto_414274 ?auto_414281 ) ) ( not ( = ?auto_414274 ?auto_414282 ) ) ( not ( = ?auto_414275 ?auto_414276 ) ) ( not ( = ?auto_414275 ?auto_414277 ) ) ( not ( = ?auto_414275 ?auto_414278 ) ) ( not ( = ?auto_414275 ?auto_414279 ) ) ( not ( = ?auto_414275 ?auto_414280 ) ) ( not ( = ?auto_414275 ?auto_414281 ) ) ( not ( = ?auto_414275 ?auto_414282 ) ) ( not ( = ?auto_414276 ?auto_414277 ) ) ( not ( = ?auto_414276 ?auto_414278 ) ) ( not ( = ?auto_414276 ?auto_414279 ) ) ( not ( = ?auto_414276 ?auto_414280 ) ) ( not ( = ?auto_414276 ?auto_414281 ) ) ( not ( = ?auto_414276 ?auto_414282 ) ) ( not ( = ?auto_414277 ?auto_414278 ) ) ( not ( = ?auto_414277 ?auto_414279 ) ) ( not ( = ?auto_414277 ?auto_414280 ) ) ( not ( = ?auto_414277 ?auto_414281 ) ) ( not ( = ?auto_414277 ?auto_414282 ) ) ( not ( = ?auto_414278 ?auto_414279 ) ) ( not ( = ?auto_414278 ?auto_414280 ) ) ( not ( = ?auto_414278 ?auto_414281 ) ) ( not ( = ?auto_414278 ?auto_414282 ) ) ( not ( = ?auto_414279 ?auto_414280 ) ) ( not ( = ?auto_414279 ?auto_414281 ) ) ( not ( = ?auto_414279 ?auto_414282 ) ) ( not ( = ?auto_414280 ?auto_414281 ) ) ( not ( = ?auto_414280 ?auto_414282 ) ) ( not ( = ?auto_414281 ?auto_414282 ) ) ( ON ?auto_414280 ?auto_414281 ) ( ON ?auto_414279 ?auto_414280 ) ( ON ?auto_414278 ?auto_414279 ) ( ON ?auto_414277 ?auto_414278 ) ( ON ?auto_414276 ?auto_414277 ) ( CLEAR ?auto_414274 ) ( ON ?auto_414275 ?auto_414276 ) ( CLEAR ?auto_414275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_414272 ?auto_414273 ?auto_414274 ?auto_414275 )
      ( MAKE-10PILE ?auto_414272 ?auto_414273 ?auto_414274 ?auto_414275 ?auto_414276 ?auto_414277 ?auto_414278 ?auto_414279 ?auto_414280 ?auto_414281 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414293 - BLOCK
      ?auto_414294 - BLOCK
      ?auto_414295 - BLOCK
      ?auto_414296 - BLOCK
      ?auto_414297 - BLOCK
      ?auto_414298 - BLOCK
      ?auto_414299 - BLOCK
      ?auto_414300 - BLOCK
      ?auto_414301 - BLOCK
      ?auto_414302 - BLOCK
    )
    :vars
    (
      ?auto_414303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414302 ?auto_414303 ) ( ON-TABLE ?auto_414293 ) ( ON ?auto_414294 ?auto_414293 ) ( ON ?auto_414295 ?auto_414294 ) ( not ( = ?auto_414293 ?auto_414294 ) ) ( not ( = ?auto_414293 ?auto_414295 ) ) ( not ( = ?auto_414293 ?auto_414296 ) ) ( not ( = ?auto_414293 ?auto_414297 ) ) ( not ( = ?auto_414293 ?auto_414298 ) ) ( not ( = ?auto_414293 ?auto_414299 ) ) ( not ( = ?auto_414293 ?auto_414300 ) ) ( not ( = ?auto_414293 ?auto_414301 ) ) ( not ( = ?auto_414293 ?auto_414302 ) ) ( not ( = ?auto_414293 ?auto_414303 ) ) ( not ( = ?auto_414294 ?auto_414295 ) ) ( not ( = ?auto_414294 ?auto_414296 ) ) ( not ( = ?auto_414294 ?auto_414297 ) ) ( not ( = ?auto_414294 ?auto_414298 ) ) ( not ( = ?auto_414294 ?auto_414299 ) ) ( not ( = ?auto_414294 ?auto_414300 ) ) ( not ( = ?auto_414294 ?auto_414301 ) ) ( not ( = ?auto_414294 ?auto_414302 ) ) ( not ( = ?auto_414294 ?auto_414303 ) ) ( not ( = ?auto_414295 ?auto_414296 ) ) ( not ( = ?auto_414295 ?auto_414297 ) ) ( not ( = ?auto_414295 ?auto_414298 ) ) ( not ( = ?auto_414295 ?auto_414299 ) ) ( not ( = ?auto_414295 ?auto_414300 ) ) ( not ( = ?auto_414295 ?auto_414301 ) ) ( not ( = ?auto_414295 ?auto_414302 ) ) ( not ( = ?auto_414295 ?auto_414303 ) ) ( not ( = ?auto_414296 ?auto_414297 ) ) ( not ( = ?auto_414296 ?auto_414298 ) ) ( not ( = ?auto_414296 ?auto_414299 ) ) ( not ( = ?auto_414296 ?auto_414300 ) ) ( not ( = ?auto_414296 ?auto_414301 ) ) ( not ( = ?auto_414296 ?auto_414302 ) ) ( not ( = ?auto_414296 ?auto_414303 ) ) ( not ( = ?auto_414297 ?auto_414298 ) ) ( not ( = ?auto_414297 ?auto_414299 ) ) ( not ( = ?auto_414297 ?auto_414300 ) ) ( not ( = ?auto_414297 ?auto_414301 ) ) ( not ( = ?auto_414297 ?auto_414302 ) ) ( not ( = ?auto_414297 ?auto_414303 ) ) ( not ( = ?auto_414298 ?auto_414299 ) ) ( not ( = ?auto_414298 ?auto_414300 ) ) ( not ( = ?auto_414298 ?auto_414301 ) ) ( not ( = ?auto_414298 ?auto_414302 ) ) ( not ( = ?auto_414298 ?auto_414303 ) ) ( not ( = ?auto_414299 ?auto_414300 ) ) ( not ( = ?auto_414299 ?auto_414301 ) ) ( not ( = ?auto_414299 ?auto_414302 ) ) ( not ( = ?auto_414299 ?auto_414303 ) ) ( not ( = ?auto_414300 ?auto_414301 ) ) ( not ( = ?auto_414300 ?auto_414302 ) ) ( not ( = ?auto_414300 ?auto_414303 ) ) ( not ( = ?auto_414301 ?auto_414302 ) ) ( not ( = ?auto_414301 ?auto_414303 ) ) ( not ( = ?auto_414302 ?auto_414303 ) ) ( ON ?auto_414301 ?auto_414302 ) ( ON ?auto_414300 ?auto_414301 ) ( ON ?auto_414299 ?auto_414300 ) ( ON ?auto_414298 ?auto_414299 ) ( ON ?auto_414297 ?auto_414298 ) ( CLEAR ?auto_414295 ) ( ON ?auto_414296 ?auto_414297 ) ( CLEAR ?auto_414296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_414293 ?auto_414294 ?auto_414295 ?auto_414296 )
      ( MAKE-10PILE ?auto_414293 ?auto_414294 ?auto_414295 ?auto_414296 ?auto_414297 ?auto_414298 ?auto_414299 ?auto_414300 ?auto_414301 ?auto_414302 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414314 - BLOCK
      ?auto_414315 - BLOCK
      ?auto_414316 - BLOCK
      ?auto_414317 - BLOCK
      ?auto_414318 - BLOCK
      ?auto_414319 - BLOCK
      ?auto_414320 - BLOCK
      ?auto_414321 - BLOCK
      ?auto_414322 - BLOCK
      ?auto_414323 - BLOCK
    )
    :vars
    (
      ?auto_414324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414323 ?auto_414324 ) ( ON-TABLE ?auto_414314 ) ( ON ?auto_414315 ?auto_414314 ) ( not ( = ?auto_414314 ?auto_414315 ) ) ( not ( = ?auto_414314 ?auto_414316 ) ) ( not ( = ?auto_414314 ?auto_414317 ) ) ( not ( = ?auto_414314 ?auto_414318 ) ) ( not ( = ?auto_414314 ?auto_414319 ) ) ( not ( = ?auto_414314 ?auto_414320 ) ) ( not ( = ?auto_414314 ?auto_414321 ) ) ( not ( = ?auto_414314 ?auto_414322 ) ) ( not ( = ?auto_414314 ?auto_414323 ) ) ( not ( = ?auto_414314 ?auto_414324 ) ) ( not ( = ?auto_414315 ?auto_414316 ) ) ( not ( = ?auto_414315 ?auto_414317 ) ) ( not ( = ?auto_414315 ?auto_414318 ) ) ( not ( = ?auto_414315 ?auto_414319 ) ) ( not ( = ?auto_414315 ?auto_414320 ) ) ( not ( = ?auto_414315 ?auto_414321 ) ) ( not ( = ?auto_414315 ?auto_414322 ) ) ( not ( = ?auto_414315 ?auto_414323 ) ) ( not ( = ?auto_414315 ?auto_414324 ) ) ( not ( = ?auto_414316 ?auto_414317 ) ) ( not ( = ?auto_414316 ?auto_414318 ) ) ( not ( = ?auto_414316 ?auto_414319 ) ) ( not ( = ?auto_414316 ?auto_414320 ) ) ( not ( = ?auto_414316 ?auto_414321 ) ) ( not ( = ?auto_414316 ?auto_414322 ) ) ( not ( = ?auto_414316 ?auto_414323 ) ) ( not ( = ?auto_414316 ?auto_414324 ) ) ( not ( = ?auto_414317 ?auto_414318 ) ) ( not ( = ?auto_414317 ?auto_414319 ) ) ( not ( = ?auto_414317 ?auto_414320 ) ) ( not ( = ?auto_414317 ?auto_414321 ) ) ( not ( = ?auto_414317 ?auto_414322 ) ) ( not ( = ?auto_414317 ?auto_414323 ) ) ( not ( = ?auto_414317 ?auto_414324 ) ) ( not ( = ?auto_414318 ?auto_414319 ) ) ( not ( = ?auto_414318 ?auto_414320 ) ) ( not ( = ?auto_414318 ?auto_414321 ) ) ( not ( = ?auto_414318 ?auto_414322 ) ) ( not ( = ?auto_414318 ?auto_414323 ) ) ( not ( = ?auto_414318 ?auto_414324 ) ) ( not ( = ?auto_414319 ?auto_414320 ) ) ( not ( = ?auto_414319 ?auto_414321 ) ) ( not ( = ?auto_414319 ?auto_414322 ) ) ( not ( = ?auto_414319 ?auto_414323 ) ) ( not ( = ?auto_414319 ?auto_414324 ) ) ( not ( = ?auto_414320 ?auto_414321 ) ) ( not ( = ?auto_414320 ?auto_414322 ) ) ( not ( = ?auto_414320 ?auto_414323 ) ) ( not ( = ?auto_414320 ?auto_414324 ) ) ( not ( = ?auto_414321 ?auto_414322 ) ) ( not ( = ?auto_414321 ?auto_414323 ) ) ( not ( = ?auto_414321 ?auto_414324 ) ) ( not ( = ?auto_414322 ?auto_414323 ) ) ( not ( = ?auto_414322 ?auto_414324 ) ) ( not ( = ?auto_414323 ?auto_414324 ) ) ( ON ?auto_414322 ?auto_414323 ) ( ON ?auto_414321 ?auto_414322 ) ( ON ?auto_414320 ?auto_414321 ) ( ON ?auto_414319 ?auto_414320 ) ( ON ?auto_414318 ?auto_414319 ) ( ON ?auto_414317 ?auto_414318 ) ( CLEAR ?auto_414315 ) ( ON ?auto_414316 ?auto_414317 ) ( CLEAR ?auto_414316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_414314 ?auto_414315 ?auto_414316 )
      ( MAKE-10PILE ?auto_414314 ?auto_414315 ?auto_414316 ?auto_414317 ?auto_414318 ?auto_414319 ?auto_414320 ?auto_414321 ?auto_414322 ?auto_414323 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414335 - BLOCK
      ?auto_414336 - BLOCK
      ?auto_414337 - BLOCK
      ?auto_414338 - BLOCK
      ?auto_414339 - BLOCK
      ?auto_414340 - BLOCK
      ?auto_414341 - BLOCK
      ?auto_414342 - BLOCK
      ?auto_414343 - BLOCK
      ?auto_414344 - BLOCK
    )
    :vars
    (
      ?auto_414345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414344 ?auto_414345 ) ( ON-TABLE ?auto_414335 ) ( ON ?auto_414336 ?auto_414335 ) ( not ( = ?auto_414335 ?auto_414336 ) ) ( not ( = ?auto_414335 ?auto_414337 ) ) ( not ( = ?auto_414335 ?auto_414338 ) ) ( not ( = ?auto_414335 ?auto_414339 ) ) ( not ( = ?auto_414335 ?auto_414340 ) ) ( not ( = ?auto_414335 ?auto_414341 ) ) ( not ( = ?auto_414335 ?auto_414342 ) ) ( not ( = ?auto_414335 ?auto_414343 ) ) ( not ( = ?auto_414335 ?auto_414344 ) ) ( not ( = ?auto_414335 ?auto_414345 ) ) ( not ( = ?auto_414336 ?auto_414337 ) ) ( not ( = ?auto_414336 ?auto_414338 ) ) ( not ( = ?auto_414336 ?auto_414339 ) ) ( not ( = ?auto_414336 ?auto_414340 ) ) ( not ( = ?auto_414336 ?auto_414341 ) ) ( not ( = ?auto_414336 ?auto_414342 ) ) ( not ( = ?auto_414336 ?auto_414343 ) ) ( not ( = ?auto_414336 ?auto_414344 ) ) ( not ( = ?auto_414336 ?auto_414345 ) ) ( not ( = ?auto_414337 ?auto_414338 ) ) ( not ( = ?auto_414337 ?auto_414339 ) ) ( not ( = ?auto_414337 ?auto_414340 ) ) ( not ( = ?auto_414337 ?auto_414341 ) ) ( not ( = ?auto_414337 ?auto_414342 ) ) ( not ( = ?auto_414337 ?auto_414343 ) ) ( not ( = ?auto_414337 ?auto_414344 ) ) ( not ( = ?auto_414337 ?auto_414345 ) ) ( not ( = ?auto_414338 ?auto_414339 ) ) ( not ( = ?auto_414338 ?auto_414340 ) ) ( not ( = ?auto_414338 ?auto_414341 ) ) ( not ( = ?auto_414338 ?auto_414342 ) ) ( not ( = ?auto_414338 ?auto_414343 ) ) ( not ( = ?auto_414338 ?auto_414344 ) ) ( not ( = ?auto_414338 ?auto_414345 ) ) ( not ( = ?auto_414339 ?auto_414340 ) ) ( not ( = ?auto_414339 ?auto_414341 ) ) ( not ( = ?auto_414339 ?auto_414342 ) ) ( not ( = ?auto_414339 ?auto_414343 ) ) ( not ( = ?auto_414339 ?auto_414344 ) ) ( not ( = ?auto_414339 ?auto_414345 ) ) ( not ( = ?auto_414340 ?auto_414341 ) ) ( not ( = ?auto_414340 ?auto_414342 ) ) ( not ( = ?auto_414340 ?auto_414343 ) ) ( not ( = ?auto_414340 ?auto_414344 ) ) ( not ( = ?auto_414340 ?auto_414345 ) ) ( not ( = ?auto_414341 ?auto_414342 ) ) ( not ( = ?auto_414341 ?auto_414343 ) ) ( not ( = ?auto_414341 ?auto_414344 ) ) ( not ( = ?auto_414341 ?auto_414345 ) ) ( not ( = ?auto_414342 ?auto_414343 ) ) ( not ( = ?auto_414342 ?auto_414344 ) ) ( not ( = ?auto_414342 ?auto_414345 ) ) ( not ( = ?auto_414343 ?auto_414344 ) ) ( not ( = ?auto_414343 ?auto_414345 ) ) ( not ( = ?auto_414344 ?auto_414345 ) ) ( ON ?auto_414343 ?auto_414344 ) ( ON ?auto_414342 ?auto_414343 ) ( ON ?auto_414341 ?auto_414342 ) ( ON ?auto_414340 ?auto_414341 ) ( ON ?auto_414339 ?auto_414340 ) ( ON ?auto_414338 ?auto_414339 ) ( CLEAR ?auto_414336 ) ( ON ?auto_414337 ?auto_414338 ) ( CLEAR ?auto_414337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_414335 ?auto_414336 ?auto_414337 )
      ( MAKE-10PILE ?auto_414335 ?auto_414336 ?auto_414337 ?auto_414338 ?auto_414339 ?auto_414340 ?auto_414341 ?auto_414342 ?auto_414343 ?auto_414344 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414356 - BLOCK
      ?auto_414357 - BLOCK
      ?auto_414358 - BLOCK
      ?auto_414359 - BLOCK
      ?auto_414360 - BLOCK
      ?auto_414361 - BLOCK
      ?auto_414362 - BLOCK
      ?auto_414363 - BLOCK
      ?auto_414364 - BLOCK
      ?auto_414365 - BLOCK
    )
    :vars
    (
      ?auto_414366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414365 ?auto_414366 ) ( ON-TABLE ?auto_414356 ) ( not ( = ?auto_414356 ?auto_414357 ) ) ( not ( = ?auto_414356 ?auto_414358 ) ) ( not ( = ?auto_414356 ?auto_414359 ) ) ( not ( = ?auto_414356 ?auto_414360 ) ) ( not ( = ?auto_414356 ?auto_414361 ) ) ( not ( = ?auto_414356 ?auto_414362 ) ) ( not ( = ?auto_414356 ?auto_414363 ) ) ( not ( = ?auto_414356 ?auto_414364 ) ) ( not ( = ?auto_414356 ?auto_414365 ) ) ( not ( = ?auto_414356 ?auto_414366 ) ) ( not ( = ?auto_414357 ?auto_414358 ) ) ( not ( = ?auto_414357 ?auto_414359 ) ) ( not ( = ?auto_414357 ?auto_414360 ) ) ( not ( = ?auto_414357 ?auto_414361 ) ) ( not ( = ?auto_414357 ?auto_414362 ) ) ( not ( = ?auto_414357 ?auto_414363 ) ) ( not ( = ?auto_414357 ?auto_414364 ) ) ( not ( = ?auto_414357 ?auto_414365 ) ) ( not ( = ?auto_414357 ?auto_414366 ) ) ( not ( = ?auto_414358 ?auto_414359 ) ) ( not ( = ?auto_414358 ?auto_414360 ) ) ( not ( = ?auto_414358 ?auto_414361 ) ) ( not ( = ?auto_414358 ?auto_414362 ) ) ( not ( = ?auto_414358 ?auto_414363 ) ) ( not ( = ?auto_414358 ?auto_414364 ) ) ( not ( = ?auto_414358 ?auto_414365 ) ) ( not ( = ?auto_414358 ?auto_414366 ) ) ( not ( = ?auto_414359 ?auto_414360 ) ) ( not ( = ?auto_414359 ?auto_414361 ) ) ( not ( = ?auto_414359 ?auto_414362 ) ) ( not ( = ?auto_414359 ?auto_414363 ) ) ( not ( = ?auto_414359 ?auto_414364 ) ) ( not ( = ?auto_414359 ?auto_414365 ) ) ( not ( = ?auto_414359 ?auto_414366 ) ) ( not ( = ?auto_414360 ?auto_414361 ) ) ( not ( = ?auto_414360 ?auto_414362 ) ) ( not ( = ?auto_414360 ?auto_414363 ) ) ( not ( = ?auto_414360 ?auto_414364 ) ) ( not ( = ?auto_414360 ?auto_414365 ) ) ( not ( = ?auto_414360 ?auto_414366 ) ) ( not ( = ?auto_414361 ?auto_414362 ) ) ( not ( = ?auto_414361 ?auto_414363 ) ) ( not ( = ?auto_414361 ?auto_414364 ) ) ( not ( = ?auto_414361 ?auto_414365 ) ) ( not ( = ?auto_414361 ?auto_414366 ) ) ( not ( = ?auto_414362 ?auto_414363 ) ) ( not ( = ?auto_414362 ?auto_414364 ) ) ( not ( = ?auto_414362 ?auto_414365 ) ) ( not ( = ?auto_414362 ?auto_414366 ) ) ( not ( = ?auto_414363 ?auto_414364 ) ) ( not ( = ?auto_414363 ?auto_414365 ) ) ( not ( = ?auto_414363 ?auto_414366 ) ) ( not ( = ?auto_414364 ?auto_414365 ) ) ( not ( = ?auto_414364 ?auto_414366 ) ) ( not ( = ?auto_414365 ?auto_414366 ) ) ( ON ?auto_414364 ?auto_414365 ) ( ON ?auto_414363 ?auto_414364 ) ( ON ?auto_414362 ?auto_414363 ) ( ON ?auto_414361 ?auto_414362 ) ( ON ?auto_414360 ?auto_414361 ) ( ON ?auto_414359 ?auto_414360 ) ( ON ?auto_414358 ?auto_414359 ) ( CLEAR ?auto_414356 ) ( ON ?auto_414357 ?auto_414358 ) ( CLEAR ?auto_414357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_414356 ?auto_414357 )
      ( MAKE-10PILE ?auto_414356 ?auto_414357 ?auto_414358 ?auto_414359 ?auto_414360 ?auto_414361 ?auto_414362 ?auto_414363 ?auto_414364 ?auto_414365 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414377 - BLOCK
      ?auto_414378 - BLOCK
      ?auto_414379 - BLOCK
      ?auto_414380 - BLOCK
      ?auto_414381 - BLOCK
      ?auto_414382 - BLOCK
      ?auto_414383 - BLOCK
      ?auto_414384 - BLOCK
      ?auto_414385 - BLOCK
      ?auto_414386 - BLOCK
    )
    :vars
    (
      ?auto_414387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414386 ?auto_414387 ) ( ON-TABLE ?auto_414377 ) ( not ( = ?auto_414377 ?auto_414378 ) ) ( not ( = ?auto_414377 ?auto_414379 ) ) ( not ( = ?auto_414377 ?auto_414380 ) ) ( not ( = ?auto_414377 ?auto_414381 ) ) ( not ( = ?auto_414377 ?auto_414382 ) ) ( not ( = ?auto_414377 ?auto_414383 ) ) ( not ( = ?auto_414377 ?auto_414384 ) ) ( not ( = ?auto_414377 ?auto_414385 ) ) ( not ( = ?auto_414377 ?auto_414386 ) ) ( not ( = ?auto_414377 ?auto_414387 ) ) ( not ( = ?auto_414378 ?auto_414379 ) ) ( not ( = ?auto_414378 ?auto_414380 ) ) ( not ( = ?auto_414378 ?auto_414381 ) ) ( not ( = ?auto_414378 ?auto_414382 ) ) ( not ( = ?auto_414378 ?auto_414383 ) ) ( not ( = ?auto_414378 ?auto_414384 ) ) ( not ( = ?auto_414378 ?auto_414385 ) ) ( not ( = ?auto_414378 ?auto_414386 ) ) ( not ( = ?auto_414378 ?auto_414387 ) ) ( not ( = ?auto_414379 ?auto_414380 ) ) ( not ( = ?auto_414379 ?auto_414381 ) ) ( not ( = ?auto_414379 ?auto_414382 ) ) ( not ( = ?auto_414379 ?auto_414383 ) ) ( not ( = ?auto_414379 ?auto_414384 ) ) ( not ( = ?auto_414379 ?auto_414385 ) ) ( not ( = ?auto_414379 ?auto_414386 ) ) ( not ( = ?auto_414379 ?auto_414387 ) ) ( not ( = ?auto_414380 ?auto_414381 ) ) ( not ( = ?auto_414380 ?auto_414382 ) ) ( not ( = ?auto_414380 ?auto_414383 ) ) ( not ( = ?auto_414380 ?auto_414384 ) ) ( not ( = ?auto_414380 ?auto_414385 ) ) ( not ( = ?auto_414380 ?auto_414386 ) ) ( not ( = ?auto_414380 ?auto_414387 ) ) ( not ( = ?auto_414381 ?auto_414382 ) ) ( not ( = ?auto_414381 ?auto_414383 ) ) ( not ( = ?auto_414381 ?auto_414384 ) ) ( not ( = ?auto_414381 ?auto_414385 ) ) ( not ( = ?auto_414381 ?auto_414386 ) ) ( not ( = ?auto_414381 ?auto_414387 ) ) ( not ( = ?auto_414382 ?auto_414383 ) ) ( not ( = ?auto_414382 ?auto_414384 ) ) ( not ( = ?auto_414382 ?auto_414385 ) ) ( not ( = ?auto_414382 ?auto_414386 ) ) ( not ( = ?auto_414382 ?auto_414387 ) ) ( not ( = ?auto_414383 ?auto_414384 ) ) ( not ( = ?auto_414383 ?auto_414385 ) ) ( not ( = ?auto_414383 ?auto_414386 ) ) ( not ( = ?auto_414383 ?auto_414387 ) ) ( not ( = ?auto_414384 ?auto_414385 ) ) ( not ( = ?auto_414384 ?auto_414386 ) ) ( not ( = ?auto_414384 ?auto_414387 ) ) ( not ( = ?auto_414385 ?auto_414386 ) ) ( not ( = ?auto_414385 ?auto_414387 ) ) ( not ( = ?auto_414386 ?auto_414387 ) ) ( ON ?auto_414385 ?auto_414386 ) ( ON ?auto_414384 ?auto_414385 ) ( ON ?auto_414383 ?auto_414384 ) ( ON ?auto_414382 ?auto_414383 ) ( ON ?auto_414381 ?auto_414382 ) ( ON ?auto_414380 ?auto_414381 ) ( ON ?auto_414379 ?auto_414380 ) ( CLEAR ?auto_414377 ) ( ON ?auto_414378 ?auto_414379 ) ( CLEAR ?auto_414378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_414377 ?auto_414378 )
      ( MAKE-10PILE ?auto_414377 ?auto_414378 ?auto_414379 ?auto_414380 ?auto_414381 ?auto_414382 ?auto_414383 ?auto_414384 ?auto_414385 ?auto_414386 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414398 - BLOCK
      ?auto_414399 - BLOCK
      ?auto_414400 - BLOCK
      ?auto_414401 - BLOCK
      ?auto_414402 - BLOCK
      ?auto_414403 - BLOCK
      ?auto_414404 - BLOCK
      ?auto_414405 - BLOCK
      ?auto_414406 - BLOCK
      ?auto_414407 - BLOCK
    )
    :vars
    (
      ?auto_414408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414407 ?auto_414408 ) ( not ( = ?auto_414398 ?auto_414399 ) ) ( not ( = ?auto_414398 ?auto_414400 ) ) ( not ( = ?auto_414398 ?auto_414401 ) ) ( not ( = ?auto_414398 ?auto_414402 ) ) ( not ( = ?auto_414398 ?auto_414403 ) ) ( not ( = ?auto_414398 ?auto_414404 ) ) ( not ( = ?auto_414398 ?auto_414405 ) ) ( not ( = ?auto_414398 ?auto_414406 ) ) ( not ( = ?auto_414398 ?auto_414407 ) ) ( not ( = ?auto_414398 ?auto_414408 ) ) ( not ( = ?auto_414399 ?auto_414400 ) ) ( not ( = ?auto_414399 ?auto_414401 ) ) ( not ( = ?auto_414399 ?auto_414402 ) ) ( not ( = ?auto_414399 ?auto_414403 ) ) ( not ( = ?auto_414399 ?auto_414404 ) ) ( not ( = ?auto_414399 ?auto_414405 ) ) ( not ( = ?auto_414399 ?auto_414406 ) ) ( not ( = ?auto_414399 ?auto_414407 ) ) ( not ( = ?auto_414399 ?auto_414408 ) ) ( not ( = ?auto_414400 ?auto_414401 ) ) ( not ( = ?auto_414400 ?auto_414402 ) ) ( not ( = ?auto_414400 ?auto_414403 ) ) ( not ( = ?auto_414400 ?auto_414404 ) ) ( not ( = ?auto_414400 ?auto_414405 ) ) ( not ( = ?auto_414400 ?auto_414406 ) ) ( not ( = ?auto_414400 ?auto_414407 ) ) ( not ( = ?auto_414400 ?auto_414408 ) ) ( not ( = ?auto_414401 ?auto_414402 ) ) ( not ( = ?auto_414401 ?auto_414403 ) ) ( not ( = ?auto_414401 ?auto_414404 ) ) ( not ( = ?auto_414401 ?auto_414405 ) ) ( not ( = ?auto_414401 ?auto_414406 ) ) ( not ( = ?auto_414401 ?auto_414407 ) ) ( not ( = ?auto_414401 ?auto_414408 ) ) ( not ( = ?auto_414402 ?auto_414403 ) ) ( not ( = ?auto_414402 ?auto_414404 ) ) ( not ( = ?auto_414402 ?auto_414405 ) ) ( not ( = ?auto_414402 ?auto_414406 ) ) ( not ( = ?auto_414402 ?auto_414407 ) ) ( not ( = ?auto_414402 ?auto_414408 ) ) ( not ( = ?auto_414403 ?auto_414404 ) ) ( not ( = ?auto_414403 ?auto_414405 ) ) ( not ( = ?auto_414403 ?auto_414406 ) ) ( not ( = ?auto_414403 ?auto_414407 ) ) ( not ( = ?auto_414403 ?auto_414408 ) ) ( not ( = ?auto_414404 ?auto_414405 ) ) ( not ( = ?auto_414404 ?auto_414406 ) ) ( not ( = ?auto_414404 ?auto_414407 ) ) ( not ( = ?auto_414404 ?auto_414408 ) ) ( not ( = ?auto_414405 ?auto_414406 ) ) ( not ( = ?auto_414405 ?auto_414407 ) ) ( not ( = ?auto_414405 ?auto_414408 ) ) ( not ( = ?auto_414406 ?auto_414407 ) ) ( not ( = ?auto_414406 ?auto_414408 ) ) ( not ( = ?auto_414407 ?auto_414408 ) ) ( ON ?auto_414406 ?auto_414407 ) ( ON ?auto_414405 ?auto_414406 ) ( ON ?auto_414404 ?auto_414405 ) ( ON ?auto_414403 ?auto_414404 ) ( ON ?auto_414402 ?auto_414403 ) ( ON ?auto_414401 ?auto_414402 ) ( ON ?auto_414400 ?auto_414401 ) ( ON ?auto_414399 ?auto_414400 ) ( ON ?auto_414398 ?auto_414399 ) ( CLEAR ?auto_414398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_414398 )
      ( MAKE-10PILE ?auto_414398 ?auto_414399 ?auto_414400 ?auto_414401 ?auto_414402 ?auto_414403 ?auto_414404 ?auto_414405 ?auto_414406 ?auto_414407 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_414419 - BLOCK
      ?auto_414420 - BLOCK
      ?auto_414421 - BLOCK
      ?auto_414422 - BLOCK
      ?auto_414423 - BLOCK
      ?auto_414424 - BLOCK
      ?auto_414425 - BLOCK
      ?auto_414426 - BLOCK
      ?auto_414427 - BLOCK
      ?auto_414428 - BLOCK
    )
    :vars
    (
      ?auto_414429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414428 ?auto_414429 ) ( not ( = ?auto_414419 ?auto_414420 ) ) ( not ( = ?auto_414419 ?auto_414421 ) ) ( not ( = ?auto_414419 ?auto_414422 ) ) ( not ( = ?auto_414419 ?auto_414423 ) ) ( not ( = ?auto_414419 ?auto_414424 ) ) ( not ( = ?auto_414419 ?auto_414425 ) ) ( not ( = ?auto_414419 ?auto_414426 ) ) ( not ( = ?auto_414419 ?auto_414427 ) ) ( not ( = ?auto_414419 ?auto_414428 ) ) ( not ( = ?auto_414419 ?auto_414429 ) ) ( not ( = ?auto_414420 ?auto_414421 ) ) ( not ( = ?auto_414420 ?auto_414422 ) ) ( not ( = ?auto_414420 ?auto_414423 ) ) ( not ( = ?auto_414420 ?auto_414424 ) ) ( not ( = ?auto_414420 ?auto_414425 ) ) ( not ( = ?auto_414420 ?auto_414426 ) ) ( not ( = ?auto_414420 ?auto_414427 ) ) ( not ( = ?auto_414420 ?auto_414428 ) ) ( not ( = ?auto_414420 ?auto_414429 ) ) ( not ( = ?auto_414421 ?auto_414422 ) ) ( not ( = ?auto_414421 ?auto_414423 ) ) ( not ( = ?auto_414421 ?auto_414424 ) ) ( not ( = ?auto_414421 ?auto_414425 ) ) ( not ( = ?auto_414421 ?auto_414426 ) ) ( not ( = ?auto_414421 ?auto_414427 ) ) ( not ( = ?auto_414421 ?auto_414428 ) ) ( not ( = ?auto_414421 ?auto_414429 ) ) ( not ( = ?auto_414422 ?auto_414423 ) ) ( not ( = ?auto_414422 ?auto_414424 ) ) ( not ( = ?auto_414422 ?auto_414425 ) ) ( not ( = ?auto_414422 ?auto_414426 ) ) ( not ( = ?auto_414422 ?auto_414427 ) ) ( not ( = ?auto_414422 ?auto_414428 ) ) ( not ( = ?auto_414422 ?auto_414429 ) ) ( not ( = ?auto_414423 ?auto_414424 ) ) ( not ( = ?auto_414423 ?auto_414425 ) ) ( not ( = ?auto_414423 ?auto_414426 ) ) ( not ( = ?auto_414423 ?auto_414427 ) ) ( not ( = ?auto_414423 ?auto_414428 ) ) ( not ( = ?auto_414423 ?auto_414429 ) ) ( not ( = ?auto_414424 ?auto_414425 ) ) ( not ( = ?auto_414424 ?auto_414426 ) ) ( not ( = ?auto_414424 ?auto_414427 ) ) ( not ( = ?auto_414424 ?auto_414428 ) ) ( not ( = ?auto_414424 ?auto_414429 ) ) ( not ( = ?auto_414425 ?auto_414426 ) ) ( not ( = ?auto_414425 ?auto_414427 ) ) ( not ( = ?auto_414425 ?auto_414428 ) ) ( not ( = ?auto_414425 ?auto_414429 ) ) ( not ( = ?auto_414426 ?auto_414427 ) ) ( not ( = ?auto_414426 ?auto_414428 ) ) ( not ( = ?auto_414426 ?auto_414429 ) ) ( not ( = ?auto_414427 ?auto_414428 ) ) ( not ( = ?auto_414427 ?auto_414429 ) ) ( not ( = ?auto_414428 ?auto_414429 ) ) ( ON ?auto_414427 ?auto_414428 ) ( ON ?auto_414426 ?auto_414427 ) ( ON ?auto_414425 ?auto_414426 ) ( ON ?auto_414424 ?auto_414425 ) ( ON ?auto_414423 ?auto_414424 ) ( ON ?auto_414422 ?auto_414423 ) ( ON ?auto_414421 ?auto_414422 ) ( ON ?auto_414420 ?auto_414421 ) ( ON ?auto_414419 ?auto_414420 ) ( CLEAR ?auto_414419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_414419 )
      ( MAKE-10PILE ?auto_414419 ?auto_414420 ?auto_414421 ?auto_414422 ?auto_414423 ?auto_414424 ?auto_414425 ?auto_414426 ?auto_414427 ?auto_414428 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414441 - BLOCK
      ?auto_414442 - BLOCK
      ?auto_414443 - BLOCK
      ?auto_414444 - BLOCK
      ?auto_414445 - BLOCK
      ?auto_414446 - BLOCK
      ?auto_414447 - BLOCK
      ?auto_414448 - BLOCK
      ?auto_414449 - BLOCK
      ?auto_414450 - BLOCK
      ?auto_414451 - BLOCK
    )
    :vars
    (
      ?auto_414452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_414450 ) ( ON ?auto_414451 ?auto_414452 ) ( CLEAR ?auto_414451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_414441 ) ( ON ?auto_414442 ?auto_414441 ) ( ON ?auto_414443 ?auto_414442 ) ( ON ?auto_414444 ?auto_414443 ) ( ON ?auto_414445 ?auto_414444 ) ( ON ?auto_414446 ?auto_414445 ) ( ON ?auto_414447 ?auto_414446 ) ( ON ?auto_414448 ?auto_414447 ) ( ON ?auto_414449 ?auto_414448 ) ( ON ?auto_414450 ?auto_414449 ) ( not ( = ?auto_414441 ?auto_414442 ) ) ( not ( = ?auto_414441 ?auto_414443 ) ) ( not ( = ?auto_414441 ?auto_414444 ) ) ( not ( = ?auto_414441 ?auto_414445 ) ) ( not ( = ?auto_414441 ?auto_414446 ) ) ( not ( = ?auto_414441 ?auto_414447 ) ) ( not ( = ?auto_414441 ?auto_414448 ) ) ( not ( = ?auto_414441 ?auto_414449 ) ) ( not ( = ?auto_414441 ?auto_414450 ) ) ( not ( = ?auto_414441 ?auto_414451 ) ) ( not ( = ?auto_414441 ?auto_414452 ) ) ( not ( = ?auto_414442 ?auto_414443 ) ) ( not ( = ?auto_414442 ?auto_414444 ) ) ( not ( = ?auto_414442 ?auto_414445 ) ) ( not ( = ?auto_414442 ?auto_414446 ) ) ( not ( = ?auto_414442 ?auto_414447 ) ) ( not ( = ?auto_414442 ?auto_414448 ) ) ( not ( = ?auto_414442 ?auto_414449 ) ) ( not ( = ?auto_414442 ?auto_414450 ) ) ( not ( = ?auto_414442 ?auto_414451 ) ) ( not ( = ?auto_414442 ?auto_414452 ) ) ( not ( = ?auto_414443 ?auto_414444 ) ) ( not ( = ?auto_414443 ?auto_414445 ) ) ( not ( = ?auto_414443 ?auto_414446 ) ) ( not ( = ?auto_414443 ?auto_414447 ) ) ( not ( = ?auto_414443 ?auto_414448 ) ) ( not ( = ?auto_414443 ?auto_414449 ) ) ( not ( = ?auto_414443 ?auto_414450 ) ) ( not ( = ?auto_414443 ?auto_414451 ) ) ( not ( = ?auto_414443 ?auto_414452 ) ) ( not ( = ?auto_414444 ?auto_414445 ) ) ( not ( = ?auto_414444 ?auto_414446 ) ) ( not ( = ?auto_414444 ?auto_414447 ) ) ( not ( = ?auto_414444 ?auto_414448 ) ) ( not ( = ?auto_414444 ?auto_414449 ) ) ( not ( = ?auto_414444 ?auto_414450 ) ) ( not ( = ?auto_414444 ?auto_414451 ) ) ( not ( = ?auto_414444 ?auto_414452 ) ) ( not ( = ?auto_414445 ?auto_414446 ) ) ( not ( = ?auto_414445 ?auto_414447 ) ) ( not ( = ?auto_414445 ?auto_414448 ) ) ( not ( = ?auto_414445 ?auto_414449 ) ) ( not ( = ?auto_414445 ?auto_414450 ) ) ( not ( = ?auto_414445 ?auto_414451 ) ) ( not ( = ?auto_414445 ?auto_414452 ) ) ( not ( = ?auto_414446 ?auto_414447 ) ) ( not ( = ?auto_414446 ?auto_414448 ) ) ( not ( = ?auto_414446 ?auto_414449 ) ) ( not ( = ?auto_414446 ?auto_414450 ) ) ( not ( = ?auto_414446 ?auto_414451 ) ) ( not ( = ?auto_414446 ?auto_414452 ) ) ( not ( = ?auto_414447 ?auto_414448 ) ) ( not ( = ?auto_414447 ?auto_414449 ) ) ( not ( = ?auto_414447 ?auto_414450 ) ) ( not ( = ?auto_414447 ?auto_414451 ) ) ( not ( = ?auto_414447 ?auto_414452 ) ) ( not ( = ?auto_414448 ?auto_414449 ) ) ( not ( = ?auto_414448 ?auto_414450 ) ) ( not ( = ?auto_414448 ?auto_414451 ) ) ( not ( = ?auto_414448 ?auto_414452 ) ) ( not ( = ?auto_414449 ?auto_414450 ) ) ( not ( = ?auto_414449 ?auto_414451 ) ) ( not ( = ?auto_414449 ?auto_414452 ) ) ( not ( = ?auto_414450 ?auto_414451 ) ) ( not ( = ?auto_414450 ?auto_414452 ) ) ( not ( = ?auto_414451 ?auto_414452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_414451 ?auto_414452 )
      ( !STACK ?auto_414451 ?auto_414450 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414464 - BLOCK
      ?auto_414465 - BLOCK
      ?auto_414466 - BLOCK
      ?auto_414467 - BLOCK
      ?auto_414468 - BLOCK
      ?auto_414469 - BLOCK
      ?auto_414470 - BLOCK
      ?auto_414471 - BLOCK
      ?auto_414472 - BLOCK
      ?auto_414473 - BLOCK
      ?auto_414474 - BLOCK
    )
    :vars
    (
      ?auto_414475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_414473 ) ( ON ?auto_414474 ?auto_414475 ) ( CLEAR ?auto_414474 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_414464 ) ( ON ?auto_414465 ?auto_414464 ) ( ON ?auto_414466 ?auto_414465 ) ( ON ?auto_414467 ?auto_414466 ) ( ON ?auto_414468 ?auto_414467 ) ( ON ?auto_414469 ?auto_414468 ) ( ON ?auto_414470 ?auto_414469 ) ( ON ?auto_414471 ?auto_414470 ) ( ON ?auto_414472 ?auto_414471 ) ( ON ?auto_414473 ?auto_414472 ) ( not ( = ?auto_414464 ?auto_414465 ) ) ( not ( = ?auto_414464 ?auto_414466 ) ) ( not ( = ?auto_414464 ?auto_414467 ) ) ( not ( = ?auto_414464 ?auto_414468 ) ) ( not ( = ?auto_414464 ?auto_414469 ) ) ( not ( = ?auto_414464 ?auto_414470 ) ) ( not ( = ?auto_414464 ?auto_414471 ) ) ( not ( = ?auto_414464 ?auto_414472 ) ) ( not ( = ?auto_414464 ?auto_414473 ) ) ( not ( = ?auto_414464 ?auto_414474 ) ) ( not ( = ?auto_414464 ?auto_414475 ) ) ( not ( = ?auto_414465 ?auto_414466 ) ) ( not ( = ?auto_414465 ?auto_414467 ) ) ( not ( = ?auto_414465 ?auto_414468 ) ) ( not ( = ?auto_414465 ?auto_414469 ) ) ( not ( = ?auto_414465 ?auto_414470 ) ) ( not ( = ?auto_414465 ?auto_414471 ) ) ( not ( = ?auto_414465 ?auto_414472 ) ) ( not ( = ?auto_414465 ?auto_414473 ) ) ( not ( = ?auto_414465 ?auto_414474 ) ) ( not ( = ?auto_414465 ?auto_414475 ) ) ( not ( = ?auto_414466 ?auto_414467 ) ) ( not ( = ?auto_414466 ?auto_414468 ) ) ( not ( = ?auto_414466 ?auto_414469 ) ) ( not ( = ?auto_414466 ?auto_414470 ) ) ( not ( = ?auto_414466 ?auto_414471 ) ) ( not ( = ?auto_414466 ?auto_414472 ) ) ( not ( = ?auto_414466 ?auto_414473 ) ) ( not ( = ?auto_414466 ?auto_414474 ) ) ( not ( = ?auto_414466 ?auto_414475 ) ) ( not ( = ?auto_414467 ?auto_414468 ) ) ( not ( = ?auto_414467 ?auto_414469 ) ) ( not ( = ?auto_414467 ?auto_414470 ) ) ( not ( = ?auto_414467 ?auto_414471 ) ) ( not ( = ?auto_414467 ?auto_414472 ) ) ( not ( = ?auto_414467 ?auto_414473 ) ) ( not ( = ?auto_414467 ?auto_414474 ) ) ( not ( = ?auto_414467 ?auto_414475 ) ) ( not ( = ?auto_414468 ?auto_414469 ) ) ( not ( = ?auto_414468 ?auto_414470 ) ) ( not ( = ?auto_414468 ?auto_414471 ) ) ( not ( = ?auto_414468 ?auto_414472 ) ) ( not ( = ?auto_414468 ?auto_414473 ) ) ( not ( = ?auto_414468 ?auto_414474 ) ) ( not ( = ?auto_414468 ?auto_414475 ) ) ( not ( = ?auto_414469 ?auto_414470 ) ) ( not ( = ?auto_414469 ?auto_414471 ) ) ( not ( = ?auto_414469 ?auto_414472 ) ) ( not ( = ?auto_414469 ?auto_414473 ) ) ( not ( = ?auto_414469 ?auto_414474 ) ) ( not ( = ?auto_414469 ?auto_414475 ) ) ( not ( = ?auto_414470 ?auto_414471 ) ) ( not ( = ?auto_414470 ?auto_414472 ) ) ( not ( = ?auto_414470 ?auto_414473 ) ) ( not ( = ?auto_414470 ?auto_414474 ) ) ( not ( = ?auto_414470 ?auto_414475 ) ) ( not ( = ?auto_414471 ?auto_414472 ) ) ( not ( = ?auto_414471 ?auto_414473 ) ) ( not ( = ?auto_414471 ?auto_414474 ) ) ( not ( = ?auto_414471 ?auto_414475 ) ) ( not ( = ?auto_414472 ?auto_414473 ) ) ( not ( = ?auto_414472 ?auto_414474 ) ) ( not ( = ?auto_414472 ?auto_414475 ) ) ( not ( = ?auto_414473 ?auto_414474 ) ) ( not ( = ?auto_414473 ?auto_414475 ) ) ( not ( = ?auto_414474 ?auto_414475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_414474 ?auto_414475 )
      ( !STACK ?auto_414474 ?auto_414473 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414487 - BLOCK
      ?auto_414488 - BLOCK
      ?auto_414489 - BLOCK
      ?auto_414490 - BLOCK
      ?auto_414491 - BLOCK
      ?auto_414492 - BLOCK
      ?auto_414493 - BLOCK
      ?auto_414494 - BLOCK
      ?auto_414495 - BLOCK
      ?auto_414496 - BLOCK
      ?auto_414497 - BLOCK
    )
    :vars
    (
      ?auto_414498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414497 ?auto_414498 ) ( ON-TABLE ?auto_414487 ) ( ON ?auto_414488 ?auto_414487 ) ( ON ?auto_414489 ?auto_414488 ) ( ON ?auto_414490 ?auto_414489 ) ( ON ?auto_414491 ?auto_414490 ) ( ON ?auto_414492 ?auto_414491 ) ( ON ?auto_414493 ?auto_414492 ) ( ON ?auto_414494 ?auto_414493 ) ( ON ?auto_414495 ?auto_414494 ) ( not ( = ?auto_414487 ?auto_414488 ) ) ( not ( = ?auto_414487 ?auto_414489 ) ) ( not ( = ?auto_414487 ?auto_414490 ) ) ( not ( = ?auto_414487 ?auto_414491 ) ) ( not ( = ?auto_414487 ?auto_414492 ) ) ( not ( = ?auto_414487 ?auto_414493 ) ) ( not ( = ?auto_414487 ?auto_414494 ) ) ( not ( = ?auto_414487 ?auto_414495 ) ) ( not ( = ?auto_414487 ?auto_414496 ) ) ( not ( = ?auto_414487 ?auto_414497 ) ) ( not ( = ?auto_414487 ?auto_414498 ) ) ( not ( = ?auto_414488 ?auto_414489 ) ) ( not ( = ?auto_414488 ?auto_414490 ) ) ( not ( = ?auto_414488 ?auto_414491 ) ) ( not ( = ?auto_414488 ?auto_414492 ) ) ( not ( = ?auto_414488 ?auto_414493 ) ) ( not ( = ?auto_414488 ?auto_414494 ) ) ( not ( = ?auto_414488 ?auto_414495 ) ) ( not ( = ?auto_414488 ?auto_414496 ) ) ( not ( = ?auto_414488 ?auto_414497 ) ) ( not ( = ?auto_414488 ?auto_414498 ) ) ( not ( = ?auto_414489 ?auto_414490 ) ) ( not ( = ?auto_414489 ?auto_414491 ) ) ( not ( = ?auto_414489 ?auto_414492 ) ) ( not ( = ?auto_414489 ?auto_414493 ) ) ( not ( = ?auto_414489 ?auto_414494 ) ) ( not ( = ?auto_414489 ?auto_414495 ) ) ( not ( = ?auto_414489 ?auto_414496 ) ) ( not ( = ?auto_414489 ?auto_414497 ) ) ( not ( = ?auto_414489 ?auto_414498 ) ) ( not ( = ?auto_414490 ?auto_414491 ) ) ( not ( = ?auto_414490 ?auto_414492 ) ) ( not ( = ?auto_414490 ?auto_414493 ) ) ( not ( = ?auto_414490 ?auto_414494 ) ) ( not ( = ?auto_414490 ?auto_414495 ) ) ( not ( = ?auto_414490 ?auto_414496 ) ) ( not ( = ?auto_414490 ?auto_414497 ) ) ( not ( = ?auto_414490 ?auto_414498 ) ) ( not ( = ?auto_414491 ?auto_414492 ) ) ( not ( = ?auto_414491 ?auto_414493 ) ) ( not ( = ?auto_414491 ?auto_414494 ) ) ( not ( = ?auto_414491 ?auto_414495 ) ) ( not ( = ?auto_414491 ?auto_414496 ) ) ( not ( = ?auto_414491 ?auto_414497 ) ) ( not ( = ?auto_414491 ?auto_414498 ) ) ( not ( = ?auto_414492 ?auto_414493 ) ) ( not ( = ?auto_414492 ?auto_414494 ) ) ( not ( = ?auto_414492 ?auto_414495 ) ) ( not ( = ?auto_414492 ?auto_414496 ) ) ( not ( = ?auto_414492 ?auto_414497 ) ) ( not ( = ?auto_414492 ?auto_414498 ) ) ( not ( = ?auto_414493 ?auto_414494 ) ) ( not ( = ?auto_414493 ?auto_414495 ) ) ( not ( = ?auto_414493 ?auto_414496 ) ) ( not ( = ?auto_414493 ?auto_414497 ) ) ( not ( = ?auto_414493 ?auto_414498 ) ) ( not ( = ?auto_414494 ?auto_414495 ) ) ( not ( = ?auto_414494 ?auto_414496 ) ) ( not ( = ?auto_414494 ?auto_414497 ) ) ( not ( = ?auto_414494 ?auto_414498 ) ) ( not ( = ?auto_414495 ?auto_414496 ) ) ( not ( = ?auto_414495 ?auto_414497 ) ) ( not ( = ?auto_414495 ?auto_414498 ) ) ( not ( = ?auto_414496 ?auto_414497 ) ) ( not ( = ?auto_414496 ?auto_414498 ) ) ( not ( = ?auto_414497 ?auto_414498 ) ) ( CLEAR ?auto_414495 ) ( ON ?auto_414496 ?auto_414497 ) ( CLEAR ?auto_414496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_414487 ?auto_414488 ?auto_414489 ?auto_414490 ?auto_414491 ?auto_414492 ?auto_414493 ?auto_414494 ?auto_414495 ?auto_414496 )
      ( MAKE-11PILE ?auto_414487 ?auto_414488 ?auto_414489 ?auto_414490 ?auto_414491 ?auto_414492 ?auto_414493 ?auto_414494 ?auto_414495 ?auto_414496 ?auto_414497 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414510 - BLOCK
      ?auto_414511 - BLOCK
      ?auto_414512 - BLOCK
      ?auto_414513 - BLOCK
      ?auto_414514 - BLOCK
      ?auto_414515 - BLOCK
      ?auto_414516 - BLOCK
      ?auto_414517 - BLOCK
      ?auto_414518 - BLOCK
      ?auto_414519 - BLOCK
      ?auto_414520 - BLOCK
    )
    :vars
    (
      ?auto_414521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414520 ?auto_414521 ) ( ON-TABLE ?auto_414510 ) ( ON ?auto_414511 ?auto_414510 ) ( ON ?auto_414512 ?auto_414511 ) ( ON ?auto_414513 ?auto_414512 ) ( ON ?auto_414514 ?auto_414513 ) ( ON ?auto_414515 ?auto_414514 ) ( ON ?auto_414516 ?auto_414515 ) ( ON ?auto_414517 ?auto_414516 ) ( ON ?auto_414518 ?auto_414517 ) ( not ( = ?auto_414510 ?auto_414511 ) ) ( not ( = ?auto_414510 ?auto_414512 ) ) ( not ( = ?auto_414510 ?auto_414513 ) ) ( not ( = ?auto_414510 ?auto_414514 ) ) ( not ( = ?auto_414510 ?auto_414515 ) ) ( not ( = ?auto_414510 ?auto_414516 ) ) ( not ( = ?auto_414510 ?auto_414517 ) ) ( not ( = ?auto_414510 ?auto_414518 ) ) ( not ( = ?auto_414510 ?auto_414519 ) ) ( not ( = ?auto_414510 ?auto_414520 ) ) ( not ( = ?auto_414510 ?auto_414521 ) ) ( not ( = ?auto_414511 ?auto_414512 ) ) ( not ( = ?auto_414511 ?auto_414513 ) ) ( not ( = ?auto_414511 ?auto_414514 ) ) ( not ( = ?auto_414511 ?auto_414515 ) ) ( not ( = ?auto_414511 ?auto_414516 ) ) ( not ( = ?auto_414511 ?auto_414517 ) ) ( not ( = ?auto_414511 ?auto_414518 ) ) ( not ( = ?auto_414511 ?auto_414519 ) ) ( not ( = ?auto_414511 ?auto_414520 ) ) ( not ( = ?auto_414511 ?auto_414521 ) ) ( not ( = ?auto_414512 ?auto_414513 ) ) ( not ( = ?auto_414512 ?auto_414514 ) ) ( not ( = ?auto_414512 ?auto_414515 ) ) ( not ( = ?auto_414512 ?auto_414516 ) ) ( not ( = ?auto_414512 ?auto_414517 ) ) ( not ( = ?auto_414512 ?auto_414518 ) ) ( not ( = ?auto_414512 ?auto_414519 ) ) ( not ( = ?auto_414512 ?auto_414520 ) ) ( not ( = ?auto_414512 ?auto_414521 ) ) ( not ( = ?auto_414513 ?auto_414514 ) ) ( not ( = ?auto_414513 ?auto_414515 ) ) ( not ( = ?auto_414513 ?auto_414516 ) ) ( not ( = ?auto_414513 ?auto_414517 ) ) ( not ( = ?auto_414513 ?auto_414518 ) ) ( not ( = ?auto_414513 ?auto_414519 ) ) ( not ( = ?auto_414513 ?auto_414520 ) ) ( not ( = ?auto_414513 ?auto_414521 ) ) ( not ( = ?auto_414514 ?auto_414515 ) ) ( not ( = ?auto_414514 ?auto_414516 ) ) ( not ( = ?auto_414514 ?auto_414517 ) ) ( not ( = ?auto_414514 ?auto_414518 ) ) ( not ( = ?auto_414514 ?auto_414519 ) ) ( not ( = ?auto_414514 ?auto_414520 ) ) ( not ( = ?auto_414514 ?auto_414521 ) ) ( not ( = ?auto_414515 ?auto_414516 ) ) ( not ( = ?auto_414515 ?auto_414517 ) ) ( not ( = ?auto_414515 ?auto_414518 ) ) ( not ( = ?auto_414515 ?auto_414519 ) ) ( not ( = ?auto_414515 ?auto_414520 ) ) ( not ( = ?auto_414515 ?auto_414521 ) ) ( not ( = ?auto_414516 ?auto_414517 ) ) ( not ( = ?auto_414516 ?auto_414518 ) ) ( not ( = ?auto_414516 ?auto_414519 ) ) ( not ( = ?auto_414516 ?auto_414520 ) ) ( not ( = ?auto_414516 ?auto_414521 ) ) ( not ( = ?auto_414517 ?auto_414518 ) ) ( not ( = ?auto_414517 ?auto_414519 ) ) ( not ( = ?auto_414517 ?auto_414520 ) ) ( not ( = ?auto_414517 ?auto_414521 ) ) ( not ( = ?auto_414518 ?auto_414519 ) ) ( not ( = ?auto_414518 ?auto_414520 ) ) ( not ( = ?auto_414518 ?auto_414521 ) ) ( not ( = ?auto_414519 ?auto_414520 ) ) ( not ( = ?auto_414519 ?auto_414521 ) ) ( not ( = ?auto_414520 ?auto_414521 ) ) ( CLEAR ?auto_414518 ) ( ON ?auto_414519 ?auto_414520 ) ( CLEAR ?auto_414519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_414510 ?auto_414511 ?auto_414512 ?auto_414513 ?auto_414514 ?auto_414515 ?auto_414516 ?auto_414517 ?auto_414518 ?auto_414519 )
      ( MAKE-11PILE ?auto_414510 ?auto_414511 ?auto_414512 ?auto_414513 ?auto_414514 ?auto_414515 ?auto_414516 ?auto_414517 ?auto_414518 ?auto_414519 ?auto_414520 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414533 - BLOCK
      ?auto_414534 - BLOCK
      ?auto_414535 - BLOCK
      ?auto_414536 - BLOCK
      ?auto_414537 - BLOCK
      ?auto_414538 - BLOCK
      ?auto_414539 - BLOCK
      ?auto_414540 - BLOCK
      ?auto_414541 - BLOCK
      ?auto_414542 - BLOCK
      ?auto_414543 - BLOCK
    )
    :vars
    (
      ?auto_414544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414543 ?auto_414544 ) ( ON-TABLE ?auto_414533 ) ( ON ?auto_414534 ?auto_414533 ) ( ON ?auto_414535 ?auto_414534 ) ( ON ?auto_414536 ?auto_414535 ) ( ON ?auto_414537 ?auto_414536 ) ( ON ?auto_414538 ?auto_414537 ) ( ON ?auto_414539 ?auto_414538 ) ( ON ?auto_414540 ?auto_414539 ) ( not ( = ?auto_414533 ?auto_414534 ) ) ( not ( = ?auto_414533 ?auto_414535 ) ) ( not ( = ?auto_414533 ?auto_414536 ) ) ( not ( = ?auto_414533 ?auto_414537 ) ) ( not ( = ?auto_414533 ?auto_414538 ) ) ( not ( = ?auto_414533 ?auto_414539 ) ) ( not ( = ?auto_414533 ?auto_414540 ) ) ( not ( = ?auto_414533 ?auto_414541 ) ) ( not ( = ?auto_414533 ?auto_414542 ) ) ( not ( = ?auto_414533 ?auto_414543 ) ) ( not ( = ?auto_414533 ?auto_414544 ) ) ( not ( = ?auto_414534 ?auto_414535 ) ) ( not ( = ?auto_414534 ?auto_414536 ) ) ( not ( = ?auto_414534 ?auto_414537 ) ) ( not ( = ?auto_414534 ?auto_414538 ) ) ( not ( = ?auto_414534 ?auto_414539 ) ) ( not ( = ?auto_414534 ?auto_414540 ) ) ( not ( = ?auto_414534 ?auto_414541 ) ) ( not ( = ?auto_414534 ?auto_414542 ) ) ( not ( = ?auto_414534 ?auto_414543 ) ) ( not ( = ?auto_414534 ?auto_414544 ) ) ( not ( = ?auto_414535 ?auto_414536 ) ) ( not ( = ?auto_414535 ?auto_414537 ) ) ( not ( = ?auto_414535 ?auto_414538 ) ) ( not ( = ?auto_414535 ?auto_414539 ) ) ( not ( = ?auto_414535 ?auto_414540 ) ) ( not ( = ?auto_414535 ?auto_414541 ) ) ( not ( = ?auto_414535 ?auto_414542 ) ) ( not ( = ?auto_414535 ?auto_414543 ) ) ( not ( = ?auto_414535 ?auto_414544 ) ) ( not ( = ?auto_414536 ?auto_414537 ) ) ( not ( = ?auto_414536 ?auto_414538 ) ) ( not ( = ?auto_414536 ?auto_414539 ) ) ( not ( = ?auto_414536 ?auto_414540 ) ) ( not ( = ?auto_414536 ?auto_414541 ) ) ( not ( = ?auto_414536 ?auto_414542 ) ) ( not ( = ?auto_414536 ?auto_414543 ) ) ( not ( = ?auto_414536 ?auto_414544 ) ) ( not ( = ?auto_414537 ?auto_414538 ) ) ( not ( = ?auto_414537 ?auto_414539 ) ) ( not ( = ?auto_414537 ?auto_414540 ) ) ( not ( = ?auto_414537 ?auto_414541 ) ) ( not ( = ?auto_414537 ?auto_414542 ) ) ( not ( = ?auto_414537 ?auto_414543 ) ) ( not ( = ?auto_414537 ?auto_414544 ) ) ( not ( = ?auto_414538 ?auto_414539 ) ) ( not ( = ?auto_414538 ?auto_414540 ) ) ( not ( = ?auto_414538 ?auto_414541 ) ) ( not ( = ?auto_414538 ?auto_414542 ) ) ( not ( = ?auto_414538 ?auto_414543 ) ) ( not ( = ?auto_414538 ?auto_414544 ) ) ( not ( = ?auto_414539 ?auto_414540 ) ) ( not ( = ?auto_414539 ?auto_414541 ) ) ( not ( = ?auto_414539 ?auto_414542 ) ) ( not ( = ?auto_414539 ?auto_414543 ) ) ( not ( = ?auto_414539 ?auto_414544 ) ) ( not ( = ?auto_414540 ?auto_414541 ) ) ( not ( = ?auto_414540 ?auto_414542 ) ) ( not ( = ?auto_414540 ?auto_414543 ) ) ( not ( = ?auto_414540 ?auto_414544 ) ) ( not ( = ?auto_414541 ?auto_414542 ) ) ( not ( = ?auto_414541 ?auto_414543 ) ) ( not ( = ?auto_414541 ?auto_414544 ) ) ( not ( = ?auto_414542 ?auto_414543 ) ) ( not ( = ?auto_414542 ?auto_414544 ) ) ( not ( = ?auto_414543 ?auto_414544 ) ) ( ON ?auto_414542 ?auto_414543 ) ( CLEAR ?auto_414540 ) ( ON ?auto_414541 ?auto_414542 ) ( CLEAR ?auto_414541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_414533 ?auto_414534 ?auto_414535 ?auto_414536 ?auto_414537 ?auto_414538 ?auto_414539 ?auto_414540 ?auto_414541 )
      ( MAKE-11PILE ?auto_414533 ?auto_414534 ?auto_414535 ?auto_414536 ?auto_414537 ?auto_414538 ?auto_414539 ?auto_414540 ?auto_414541 ?auto_414542 ?auto_414543 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414556 - BLOCK
      ?auto_414557 - BLOCK
      ?auto_414558 - BLOCK
      ?auto_414559 - BLOCK
      ?auto_414560 - BLOCK
      ?auto_414561 - BLOCK
      ?auto_414562 - BLOCK
      ?auto_414563 - BLOCK
      ?auto_414564 - BLOCK
      ?auto_414565 - BLOCK
      ?auto_414566 - BLOCK
    )
    :vars
    (
      ?auto_414567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414566 ?auto_414567 ) ( ON-TABLE ?auto_414556 ) ( ON ?auto_414557 ?auto_414556 ) ( ON ?auto_414558 ?auto_414557 ) ( ON ?auto_414559 ?auto_414558 ) ( ON ?auto_414560 ?auto_414559 ) ( ON ?auto_414561 ?auto_414560 ) ( ON ?auto_414562 ?auto_414561 ) ( ON ?auto_414563 ?auto_414562 ) ( not ( = ?auto_414556 ?auto_414557 ) ) ( not ( = ?auto_414556 ?auto_414558 ) ) ( not ( = ?auto_414556 ?auto_414559 ) ) ( not ( = ?auto_414556 ?auto_414560 ) ) ( not ( = ?auto_414556 ?auto_414561 ) ) ( not ( = ?auto_414556 ?auto_414562 ) ) ( not ( = ?auto_414556 ?auto_414563 ) ) ( not ( = ?auto_414556 ?auto_414564 ) ) ( not ( = ?auto_414556 ?auto_414565 ) ) ( not ( = ?auto_414556 ?auto_414566 ) ) ( not ( = ?auto_414556 ?auto_414567 ) ) ( not ( = ?auto_414557 ?auto_414558 ) ) ( not ( = ?auto_414557 ?auto_414559 ) ) ( not ( = ?auto_414557 ?auto_414560 ) ) ( not ( = ?auto_414557 ?auto_414561 ) ) ( not ( = ?auto_414557 ?auto_414562 ) ) ( not ( = ?auto_414557 ?auto_414563 ) ) ( not ( = ?auto_414557 ?auto_414564 ) ) ( not ( = ?auto_414557 ?auto_414565 ) ) ( not ( = ?auto_414557 ?auto_414566 ) ) ( not ( = ?auto_414557 ?auto_414567 ) ) ( not ( = ?auto_414558 ?auto_414559 ) ) ( not ( = ?auto_414558 ?auto_414560 ) ) ( not ( = ?auto_414558 ?auto_414561 ) ) ( not ( = ?auto_414558 ?auto_414562 ) ) ( not ( = ?auto_414558 ?auto_414563 ) ) ( not ( = ?auto_414558 ?auto_414564 ) ) ( not ( = ?auto_414558 ?auto_414565 ) ) ( not ( = ?auto_414558 ?auto_414566 ) ) ( not ( = ?auto_414558 ?auto_414567 ) ) ( not ( = ?auto_414559 ?auto_414560 ) ) ( not ( = ?auto_414559 ?auto_414561 ) ) ( not ( = ?auto_414559 ?auto_414562 ) ) ( not ( = ?auto_414559 ?auto_414563 ) ) ( not ( = ?auto_414559 ?auto_414564 ) ) ( not ( = ?auto_414559 ?auto_414565 ) ) ( not ( = ?auto_414559 ?auto_414566 ) ) ( not ( = ?auto_414559 ?auto_414567 ) ) ( not ( = ?auto_414560 ?auto_414561 ) ) ( not ( = ?auto_414560 ?auto_414562 ) ) ( not ( = ?auto_414560 ?auto_414563 ) ) ( not ( = ?auto_414560 ?auto_414564 ) ) ( not ( = ?auto_414560 ?auto_414565 ) ) ( not ( = ?auto_414560 ?auto_414566 ) ) ( not ( = ?auto_414560 ?auto_414567 ) ) ( not ( = ?auto_414561 ?auto_414562 ) ) ( not ( = ?auto_414561 ?auto_414563 ) ) ( not ( = ?auto_414561 ?auto_414564 ) ) ( not ( = ?auto_414561 ?auto_414565 ) ) ( not ( = ?auto_414561 ?auto_414566 ) ) ( not ( = ?auto_414561 ?auto_414567 ) ) ( not ( = ?auto_414562 ?auto_414563 ) ) ( not ( = ?auto_414562 ?auto_414564 ) ) ( not ( = ?auto_414562 ?auto_414565 ) ) ( not ( = ?auto_414562 ?auto_414566 ) ) ( not ( = ?auto_414562 ?auto_414567 ) ) ( not ( = ?auto_414563 ?auto_414564 ) ) ( not ( = ?auto_414563 ?auto_414565 ) ) ( not ( = ?auto_414563 ?auto_414566 ) ) ( not ( = ?auto_414563 ?auto_414567 ) ) ( not ( = ?auto_414564 ?auto_414565 ) ) ( not ( = ?auto_414564 ?auto_414566 ) ) ( not ( = ?auto_414564 ?auto_414567 ) ) ( not ( = ?auto_414565 ?auto_414566 ) ) ( not ( = ?auto_414565 ?auto_414567 ) ) ( not ( = ?auto_414566 ?auto_414567 ) ) ( ON ?auto_414565 ?auto_414566 ) ( CLEAR ?auto_414563 ) ( ON ?auto_414564 ?auto_414565 ) ( CLEAR ?auto_414564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_414556 ?auto_414557 ?auto_414558 ?auto_414559 ?auto_414560 ?auto_414561 ?auto_414562 ?auto_414563 ?auto_414564 )
      ( MAKE-11PILE ?auto_414556 ?auto_414557 ?auto_414558 ?auto_414559 ?auto_414560 ?auto_414561 ?auto_414562 ?auto_414563 ?auto_414564 ?auto_414565 ?auto_414566 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414579 - BLOCK
      ?auto_414580 - BLOCK
      ?auto_414581 - BLOCK
      ?auto_414582 - BLOCK
      ?auto_414583 - BLOCK
      ?auto_414584 - BLOCK
      ?auto_414585 - BLOCK
      ?auto_414586 - BLOCK
      ?auto_414587 - BLOCK
      ?auto_414588 - BLOCK
      ?auto_414589 - BLOCK
    )
    :vars
    (
      ?auto_414590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414589 ?auto_414590 ) ( ON-TABLE ?auto_414579 ) ( ON ?auto_414580 ?auto_414579 ) ( ON ?auto_414581 ?auto_414580 ) ( ON ?auto_414582 ?auto_414581 ) ( ON ?auto_414583 ?auto_414582 ) ( ON ?auto_414584 ?auto_414583 ) ( ON ?auto_414585 ?auto_414584 ) ( not ( = ?auto_414579 ?auto_414580 ) ) ( not ( = ?auto_414579 ?auto_414581 ) ) ( not ( = ?auto_414579 ?auto_414582 ) ) ( not ( = ?auto_414579 ?auto_414583 ) ) ( not ( = ?auto_414579 ?auto_414584 ) ) ( not ( = ?auto_414579 ?auto_414585 ) ) ( not ( = ?auto_414579 ?auto_414586 ) ) ( not ( = ?auto_414579 ?auto_414587 ) ) ( not ( = ?auto_414579 ?auto_414588 ) ) ( not ( = ?auto_414579 ?auto_414589 ) ) ( not ( = ?auto_414579 ?auto_414590 ) ) ( not ( = ?auto_414580 ?auto_414581 ) ) ( not ( = ?auto_414580 ?auto_414582 ) ) ( not ( = ?auto_414580 ?auto_414583 ) ) ( not ( = ?auto_414580 ?auto_414584 ) ) ( not ( = ?auto_414580 ?auto_414585 ) ) ( not ( = ?auto_414580 ?auto_414586 ) ) ( not ( = ?auto_414580 ?auto_414587 ) ) ( not ( = ?auto_414580 ?auto_414588 ) ) ( not ( = ?auto_414580 ?auto_414589 ) ) ( not ( = ?auto_414580 ?auto_414590 ) ) ( not ( = ?auto_414581 ?auto_414582 ) ) ( not ( = ?auto_414581 ?auto_414583 ) ) ( not ( = ?auto_414581 ?auto_414584 ) ) ( not ( = ?auto_414581 ?auto_414585 ) ) ( not ( = ?auto_414581 ?auto_414586 ) ) ( not ( = ?auto_414581 ?auto_414587 ) ) ( not ( = ?auto_414581 ?auto_414588 ) ) ( not ( = ?auto_414581 ?auto_414589 ) ) ( not ( = ?auto_414581 ?auto_414590 ) ) ( not ( = ?auto_414582 ?auto_414583 ) ) ( not ( = ?auto_414582 ?auto_414584 ) ) ( not ( = ?auto_414582 ?auto_414585 ) ) ( not ( = ?auto_414582 ?auto_414586 ) ) ( not ( = ?auto_414582 ?auto_414587 ) ) ( not ( = ?auto_414582 ?auto_414588 ) ) ( not ( = ?auto_414582 ?auto_414589 ) ) ( not ( = ?auto_414582 ?auto_414590 ) ) ( not ( = ?auto_414583 ?auto_414584 ) ) ( not ( = ?auto_414583 ?auto_414585 ) ) ( not ( = ?auto_414583 ?auto_414586 ) ) ( not ( = ?auto_414583 ?auto_414587 ) ) ( not ( = ?auto_414583 ?auto_414588 ) ) ( not ( = ?auto_414583 ?auto_414589 ) ) ( not ( = ?auto_414583 ?auto_414590 ) ) ( not ( = ?auto_414584 ?auto_414585 ) ) ( not ( = ?auto_414584 ?auto_414586 ) ) ( not ( = ?auto_414584 ?auto_414587 ) ) ( not ( = ?auto_414584 ?auto_414588 ) ) ( not ( = ?auto_414584 ?auto_414589 ) ) ( not ( = ?auto_414584 ?auto_414590 ) ) ( not ( = ?auto_414585 ?auto_414586 ) ) ( not ( = ?auto_414585 ?auto_414587 ) ) ( not ( = ?auto_414585 ?auto_414588 ) ) ( not ( = ?auto_414585 ?auto_414589 ) ) ( not ( = ?auto_414585 ?auto_414590 ) ) ( not ( = ?auto_414586 ?auto_414587 ) ) ( not ( = ?auto_414586 ?auto_414588 ) ) ( not ( = ?auto_414586 ?auto_414589 ) ) ( not ( = ?auto_414586 ?auto_414590 ) ) ( not ( = ?auto_414587 ?auto_414588 ) ) ( not ( = ?auto_414587 ?auto_414589 ) ) ( not ( = ?auto_414587 ?auto_414590 ) ) ( not ( = ?auto_414588 ?auto_414589 ) ) ( not ( = ?auto_414588 ?auto_414590 ) ) ( not ( = ?auto_414589 ?auto_414590 ) ) ( ON ?auto_414588 ?auto_414589 ) ( ON ?auto_414587 ?auto_414588 ) ( CLEAR ?auto_414585 ) ( ON ?auto_414586 ?auto_414587 ) ( CLEAR ?auto_414586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_414579 ?auto_414580 ?auto_414581 ?auto_414582 ?auto_414583 ?auto_414584 ?auto_414585 ?auto_414586 )
      ( MAKE-11PILE ?auto_414579 ?auto_414580 ?auto_414581 ?auto_414582 ?auto_414583 ?auto_414584 ?auto_414585 ?auto_414586 ?auto_414587 ?auto_414588 ?auto_414589 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414602 - BLOCK
      ?auto_414603 - BLOCK
      ?auto_414604 - BLOCK
      ?auto_414605 - BLOCK
      ?auto_414606 - BLOCK
      ?auto_414607 - BLOCK
      ?auto_414608 - BLOCK
      ?auto_414609 - BLOCK
      ?auto_414610 - BLOCK
      ?auto_414611 - BLOCK
      ?auto_414612 - BLOCK
    )
    :vars
    (
      ?auto_414613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414612 ?auto_414613 ) ( ON-TABLE ?auto_414602 ) ( ON ?auto_414603 ?auto_414602 ) ( ON ?auto_414604 ?auto_414603 ) ( ON ?auto_414605 ?auto_414604 ) ( ON ?auto_414606 ?auto_414605 ) ( ON ?auto_414607 ?auto_414606 ) ( ON ?auto_414608 ?auto_414607 ) ( not ( = ?auto_414602 ?auto_414603 ) ) ( not ( = ?auto_414602 ?auto_414604 ) ) ( not ( = ?auto_414602 ?auto_414605 ) ) ( not ( = ?auto_414602 ?auto_414606 ) ) ( not ( = ?auto_414602 ?auto_414607 ) ) ( not ( = ?auto_414602 ?auto_414608 ) ) ( not ( = ?auto_414602 ?auto_414609 ) ) ( not ( = ?auto_414602 ?auto_414610 ) ) ( not ( = ?auto_414602 ?auto_414611 ) ) ( not ( = ?auto_414602 ?auto_414612 ) ) ( not ( = ?auto_414602 ?auto_414613 ) ) ( not ( = ?auto_414603 ?auto_414604 ) ) ( not ( = ?auto_414603 ?auto_414605 ) ) ( not ( = ?auto_414603 ?auto_414606 ) ) ( not ( = ?auto_414603 ?auto_414607 ) ) ( not ( = ?auto_414603 ?auto_414608 ) ) ( not ( = ?auto_414603 ?auto_414609 ) ) ( not ( = ?auto_414603 ?auto_414610 ) ) ( not ( = ?auto_414603 ?auto_414611 ) ) ( not ( = ?auto_414603 ?auto_414612 ) ) ( not ( = ?auto_414603 ?auto_414613 ) ) ( not ( = ?auto_414604 ?auto_414605 ) ) ( not ( = ?auto_414604 ?auto_414606 ) ) ( not ( = ?auto_414604 ?auto_414607 ) ) ( not ( = ?auto_414604 ?auto_414608 ) ) ( not ( = ?auto_414604 ?auto_414609 ) ) ( not ( = ?auto_414604 ?auto_414610 ) ) ( not ( = ?auto_414604 ?auto_414611 ) ) ( not ( = ?auto_414604 ?auto_414612 ) ) ( not ( = ?auto_414604 ?auto_414613 ) ) ( not ( = ?auto_414605 ?auto_414606 ) ) ( not ( = ?auto_414605 ?auto_414607 ) ) ( not ( = ?auto_414605 ?auto_414608 ) ) ( not ( = ?auto_414605 ?auto_414609 ) ) ( not ( = ?auto_414605 ?auto_414610 ) ) ( not ( = ?auto_414605 ?auto_414611 ) ) ( not ( = ?auto_414605 ?auto_414612 ) ) ( not ( = ?auto_414605 ?auto_414613 ) ) ( not ( = ?auto_414606 ?auto_414607 ) ) ( not ( = ?auto_414606 ?auto_414608 ) ) ( not ( = ?auto_414606 ?auto_414609 ) ) ( not ( = ?auto_414606 ?auto_414610 ) ) ( not ( = ?auto_414606 ?auto_414611 ) ) ( not ( = ?auto_414606 ?auto_414612 ) ) ( not ( = ?auto_414606 ?auto_414613 ) ) ( not ( = ?auto_414607 ?auto_414608 ) ) ( not ( = ?auto_414607 ?auto_414609 ) ) ( not ( = ?auto_414607 ?auto_414610 ) ) ( not ( = ?auto_414607 ?auto_414611 ) ) ( not ( = ?auto_414607 ?auto_414612 ) ) ( not ( = ?auto_414607 ?auto_414613 ) ) ( not ( = ?auto_414608 ?auto_414609 ) ) ( not ( = ?auto_414608 ?auto_414610 ) ) ( not ( = ?auto_414608 ?auto_414611 ) ) ( not ( = ?auto_414608 ?auto_414612 ) ) ( not ( = ?auto_414608 ?auto_414613 ) ) ( not ( = ?auto_414609 ?auto_414610 ) ) ( not ( = ?auto_414609 ?auto_414611 ) ) ( not ( = ?auto_414609 ?auto_414612 ) ) ( not ( = ?auto_414609 ?auto_414613 ) ) ( not ( = ?auto_414610 ?auto_414611 ) ) ( not ( = ?auto_414610 ?auto_414612 ) ) ( not ( = ?auto_414610 ?auto_414613 ) ) ( not ( = ?auto_414611 ?auto_414612 ) ) ( not ( = ?auto_414611 ?auto_414613 ) ) ( not ( = ?auto_414612 ?auto_414613 ) ) ( ON ?auto_414611 ?auto_414612 ) ( ON ?auto_414610 ?auto_414611 ) ( CLEAR ?auto_414608 ) ( ON ?auto_414609 ?auto_414610 ) ( CLEAR ?auto_414609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_414602 ?auto_414603 ?auto_414604 ?auto_414605 ?auto_414606 ?auto_414607 ?auto_414608 ?auto_414609 )
      ( MAKE-11PILE ?auto_414602 ?auto_414603 ?auto_414604 ?auto_414605 ?auto_414606 ?auto_414607 ?auto_414608 ?auto_414609 ?auto_414610 ?auto_414611 ?auto_414612 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414625 - BLOCK
      ?auto_414626 - BLOCK
      ?auto_414627 - BLOCK
      ?auto_414628 - BLOCK
      ?auto_414629 - BLOCK
      ?auto_414630 - BLOCK
      ?auto_414631 - BLOCK
      ?auto_414632 - BLOCK
      ?auto_414633 - BLOCK
      ?auto_414634 - BLOCK
      ?auto_414635 - BLOCK
    )
    :vars
    (
      ?auto_414636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414635 ?auto_414636 ) ( ON-TABLE ?auto_414625 ) ( ON ?auto_414626 ?auto_414625 ) ( ON ?auto_414627 ?auto_414626 ) ( ON ?auto_414628 ?auto_414627 ) ( ON ?auto_414629 ?auto_414628 ) ( ON ?auto_414630 ?auto_414629 ) ( not ( = ?auto_414625 ?auto_414626 ) ) ( not ( = ?auto_414625 ?auto_414627 ) ) ( not ( = ?auto_414625 ?auto_414628 ) ) ( not ( = ?auto_414625 ?auto_414629 ) ) ( not ( = ?auto_414625 ?auto_414630 ) ) ( not ( = ?auto_414625 ?auto_414631 ) ) ( not ( = ?auto_414625 ?auto_414632 ) ) ( not ( = ?auto_414625 ?auto_414633 ) ) ( not ( = ?auto_414625 ?auto_414634 ) ) ( not ( = ?auto_414625 ?auto_414635 ) ) ( not ( = ?auto_414625 ?auto_414636 ) ) ( not ( = ?auto_414626 ?auto_414627 ) ) ( not ( = ?auto_414626 ?auto_414628 ) ) ( not ( = ?auto_414626 ?auto_414629 ) ) ( not ( = ?auto_414626 ?auto_414630 ) ) ( not ( = ?auto_414626 ?auto_414631 ) ) ( not ( = ?auto_414626 ?auto_414632 ) ) ( not ( = ?auto_414626 ?auto_414633 ) ) ( not ( = ?auto_414626 ?auto_414634 ) ) ( not ( = ?auto_414626 ?auto_414635 ) ) ( not ( = ?auto_414626 ?auto_414636 ) ) ( not ( = ?auto_414627 ?auto_414628 ) ) ( not ( = ?auto_414627 ?auto_414629 ) ) ( not ( = ?auto_414627 ?auto_414630 ) ) ( not ( = ?auto_414627 ?auto_414631 ) ) ( not ( = ?auto_414627 ?auto_414632 ) ) ( not ( = ?auto_414627 ?auto_414633 ) ) ( not ( = ?auto_414627 ?auto_414634 ) ) ( not ( = ?auto_414627 ?auto_414635 ) ) ( not ( = ?auto_414627 ?auto_414636 ) ) ( not ( = ?auto_414628 ?auto_414629 ) ) ( not ( = ?auto_414628 ?auto_414630 ) ) ( not ( = ?auto_414628 ?auto_414631 ) ) ( not ( = ?auto_414628 ?auto_414632 ) ) ( not ( = ?auto_414628 ?auto_414633 ) ) ( not ( = ?auto_414628 ?auto_414634 ) ) ( not ( = ?auto_414628 ?auto_414635 ) ) ( not ( = ?auto_414628 ?auto_414636 ) ) ( not ( = ?auto_414629 ?auto_414630 ) ) ( not ( = ?auto_414629 ?auto_414631 ) ) ( not ( = ?auto_414629 ?auto_414632 ) ) ( not ( = ?auto_414629 ?auto_414633 ) ) ( not ( = ?auto_414629 ?auto_414634 ) ) ( not ( = ?auto_414629 ?auto_414635 ) ) ( not ( = ?auto_414629 ?auto_414636 ) ) ( not ( = ?auto_414630 ?auto_414631 ) ) ( not ( = ?auto_414630 ?auto_414632 ) ) ( not ( = ?auto_414630 ?auto_414633 ) ) ( not ( = ?auto_414630 ?auto_414634 ) ) ( not ( = ?auto_414630 ?auto_414635 ) ) ( not ( = ?auto_414630 ?auto_414636 ) ) ( not ( = ?auto_414631 ?auto_414632 ) ) ( not ( = ?auto_414631 ?auto_414633 ) ) ( not ( = ?auto_414631 ?auto_414634 ) ) ( not ( = ?auto_414631 ?auto_414635 ) ) ( not ( = ?auto_414631 ?auto_414636 ) ) ( not ( = ?auto_414632 ?auto_414633 ) ) ( not ( = ?auto_414632 ?auto_414634 ) ) ( not ( = ?auto_414632 ?auto_414635 ) ) ( not ( = ?auto_414632 ?auto_414636 ) ) ( not ( = ?auto_414633 ?auto_414634 ) ) ( not ( = ?auto_414633 ?auto_414635 ) ) ( not ( = ?auto_414633 ?auto_414636 ) ) ( not ( = ?auto_414634 ?auto_414635 ) ) ( not ( = ?auto_414634 ?auto_414636 ) ) ( not ( = ?auto_414635 ?auto_414636 ) ) ( ON ?auto_414634 ?auto_414635 ) ( ON ?auto_414633 ?auto_414634 ) ( ON ?auto_414632 ?auto_414633 ) ( CLEAR ?auto_414630 ) ( ON ?auto_414631 ?auto_414632 ) ( CLEAR ?auto_414631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_414625 ?auto_414626 ?auto_414627 ?auto_414628 ?auto_414629 ?auto_414630 ?auto_414631 )
      ( MAKE-11PILE ?auto_414625 ?auto_414626 ?auto_414627 ?auto_414628 ?auto_414629 ?auto_414630 ?auto_414631 ?auto_414632 ?auto_414633 ?auto_414634 ?auto_414635 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414648 - BLOCK
      ?auto_414649 - BLOCK
      ?auto_414650 - BLOCK
      ?auto_414651 - BLOCK
      ?auto_414652 - BLOCK
      ?auto_414653 - BLOCK
      ?auto_414654 - BLOCK
      ?auto_414655 - BLOCK
      ?auto_414656 - BLOCK
      ?auto_414657 - BLOCK
      ?auto_414658 - BLOCK
    )
    :vars
    (
      ?auto_414659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414658 ?auto_414659 ) ( ON-TABLE ?auto_414648 ) ( ON ?auto_414649 ?auto_414648 ) ( ON ?auto_414650 ?auto_414649 ) ( ON ?auto_414651 ?auto_414650 ) ( ON ?auto_414652 ?auto_414651 ) ( ON ?auto_414653 ?auto_414652 ) ( not ( = ?auto_414648 ?auto_414649 ) ) ( not ( = ?auto_414648 ?auto_414650 ) ) ( not ( = ?auto_414648 ?auto_414651 ) ) ( not ( = ?auto_414648 ?auto_414652 ) ) ( not ( = ?auto_414648 ?auto_414653 ) ) ( not ( = ?auto_414648 ?auto_414654 ) ) ( not ( = ?auto_414648 ?auto_414655 ) ) ( not ( = ?auto_414648 ?auto_414656 ) ) ( not ( = ?auto_414648 ?auto_414657 ) ) ( not ( = ?auto_414648 ?auto_414658 ) ) ( not ( = ?auto_414648 ?auto_414659 ) ) ( not ( = ?auto_414649 ?auto_414650 ) ) ( not ( = ?auto_414649 ?auto_414651 ) ) ( not ( = ?auto_414649 ?auto_414652 ) ) ( not ( = ?auto_414649 ?auto_414653 ) ) ( not ( = ?auto_414649 ?auto_414654 ) ) ( not ( = ?auto_414649 ?auto_414655 ) ) ( not ( = ?auto_414649 ?auto_414656 ) ) ( not ( = ?auto_414649 ?auto_414657 ) ) ( not ( = ?auto_414649 ?auto_414658 ) ) ( not ( = ?auto_414649 ?auto_414659 ) ) ( not ( = ?auto_414650 ?auto_414651 ) ) ( not ( = ?auto_414650 ?auto_414652 ) ) ( not ( = ?auto_414650 ?auto_414653 ) ) ( not ( = ?auto_414650 ?auto_414654 ) ) ( not ( = ?auto_414650 ?auto_414655 ) ) ( not ( = ?auto_414650 ?auto_414656 ) ) ( not ( = ?auto_414650 ?auto_414657 ) ) ( not ( = ?auto_414650 ?auto_414658 ) ) ( not ( = ?auto_414650 ?auto_414659 ) ) ( not ( = ?auto_414651 ?auto_414652 ) ) ( not ( = ?auto_414651 ?auto_414653 ) ) ( not ( = ?auto_414651 ?auto_414654 ) ) ( not ( = ?auto_414651 ?auto_414655 ) ) ( not ( = ?auto_414651 ?auto_414656 ) ) ( not ( = ?auto_414651 ?auto_414657 ) ) ( not ( = ?auto_414651 ?auto_414658 ) ) ( not ( = ?auto_414651 ?auto_414659 ) ) ( not ( = ?auto_414652 ?auto_414653 ) ) ( not ( = ?auto_414652 ?auto_414654 ) ) ( not ( = ?auto_414652 ?auto_414655 ) ) ( not ( = ?auto_414652 ?auto_414656 ) ) ( not ( = ?auto_414652 ?auto_414657 ) ) ( not ( = ?auto_414652 ?auto_414658 ) ) ( not ( = ?auto_414652 ?auto_414659 ) ) ( not ( = ?auto_414653 ?auto_414654 ) ) ( not ( = ?auto_414653 ?auto_414655 ) ) ( not ( = ?auto_414653 ?auto_414656 ) ) ( not ( = ?auto_414653 ?auto_414657 ) ) ( not ( = ?auto_414653 ?auto_414658 ) ) ( not ( = ?auto_414653 ?auto_414659 ) ) ( not ( = ?auto_414654 ?auto_414655 ) ) ( not ( = ?auto_414654 ?auto_414656 ) ) ( not ( = ?auto_414654 ?auto_414657 ) ) ( not ( = ?auto_414654 ?auto_414658 ) ) ( not ( = ?auto_414654 ?auto_414659 ) ) ( not ( = ?auto_414655 ?auto_414656 ) ) ( not ( = ?auto_414655 ?auto_414657 ) ) ( not ( = ?auto_414655 ?auto_414658 ) ) ( not ( = ?auto_414655 ?auto_414659 ) ) ( not ( = ?auto_414656 ?auto_414657 ) ) ( not ( = ?auto_414656 ?auto_414658 ) ) ( not ( = ?auto_414656 ?auto_414659 ) ) ( not ( = ?auto_414657 ?auto_414658 ) ) ( not ( = ?auto_414657 ?auto_414659 ) ) ( not ( = ?auto_414658 ?auto_414659 ) ) ( ON ?auto_414657 ?auto_414658 ) ( ON ?auto_414656 ?auto_414657 ) ( ON ?auto_414655 ?auto_414656 ) ( CLEAR ?auto_414653 ) ( ON ?auto_414654 ?auto_414655 ) ( CLEAR ?auto_414654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_414648 ?auto_414649 ?auto_414650 ?auto_414651 ?auto_414652 ?auto_414653 ?auto_414654 )
      ( MAKE-11PILE ?auto_414648 ?auto_414649 ?auto_414650 ?auto_414651 ?auto_414652 ?auto_414653 ?auto_414654 ?auto_414655 ?auto_414656 ?auto_414657 ?auto_414658 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414671 - BLOCK
      ?auto_414672 - BLOCK
      ?auto_414673 - BLOCK
      ?auto_414674 - BLOCK
      ?auto_414675 - BLOCK
      ?auto_414676 - BLOCK
      ?auto_414677 - BLOCK
      ?auto_414678 - BLOCK
      ?auto_414679 - BLOCK
      ?auto_414680 - BLOCK
      ?auto_414681 - BLOCK
    )
    :vars
    (
      ?auto_414682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414681 ?auto_414682 ) ( ON-TABLE ?auto_414671 ) ( ON ?auto_414672 ?auto_414671 ) ( ON ?auto_414673 ?auto_414672 ) ( ON ?auto_414674 ?auto_414673 ) ( ON ?auto_414675 ?auto_414674 ) ( not ( = ?auto_414671 ?auto_414672 ) ) ( not ( = ?auto_414671 ?auto_414673 ) ) ( not ( = ?auto_414671 ?auto_414674 ) ) ( not ( = ?auto_414671 ?auto_414675 ) ) ( not ( = ?auto_414671 ?auto_414676 ) ) ( not ( = ?auto_414671 ?auto_414677 ) ) ( not ( = ?auto_414671 ?auto_414678 ) ) ( not ( = ?auto_414671 ?auto_414679 ) ) ( not ( = ?auto_414671 ?auto_414680 ) ) ( not ( = ?auto_414671 ?auto_414681 ) ) ( not ( = ?auto_414671 ?auto_414682 ) ) ( not ( = ?auto_414672 ?auto_414673 ) ) ( not ( = ?auto_414672 ?auto_414674 ) ) ( not ( = ?auto_414672 ?auto_414675 ) ) ( not ( = ?auto_414672 ?auto_414676 ) ) ( not ( = ?auto_414672 ?auto_414677 ) ) ( not ( = ?auto_414672 ?auto_414678 ) ) ( not ( = ?auto_414672 ?auto_414679 ) ) ( not ( = ?auto_414672 ?auto_414680 ) ) ( not ( = ?auto_414672 ?auto_414681 ) ) ( not ( = ?auto_414672 ?auto_414682 ) ) ( not ( = ?auto_414673 ?auto_414674 ) ) ( not ( = ?auto_414673 ?auto_414675 ) ) ( not ( = ?auto_414673 ?auto_414676 ) ) ( not ( = ?auto_414673 ?auto_414677 ) ) ( not ( = ?auto_414673 ?auto_414678 ) ) ( not ( = ?auto_414673 ?auto_414679 ) ) ( not ( = ?auto_414673 ?auto_414680 ) ) ( not ( = ?auto_414673 ?auto_414681 ) ) ( not ( = ?auto_414673 ?auto_414682 ) ) ( not ( = ?auto_414674 ?auto_414675 ) ) ( not ( = ?auto_414674 ?auto_414676 ) ) ( not ( = ?auto_414674 ?auto_414677 ) ) ( not ( = ?auto_414674 ?auto_414678 ) ) ( not ( = ?auto_414674 ?auto_414679 ) ) ( not ( = ?auto_414674 ?auto_414680 ) ) ( not ( = ?auto_414674 ?auto_414681 ) ) ( not ( = ?auto_414674 ?auto_414682 ) ) ( not ( = ?auto_414675 ?auto_414676 ) ) ( not ( = ?auto_414675 ?auto_414677 ) ) ( not ( = ?auto_414675 ?auto_414678 ) ) ( not ( = ?auto_414675 ?auto_414679 ) ) ( not ( = ?auto_414675 ?auto_414680 ) ) ( not ( = ?auto_414675 ?auto_414681 ) ) ( not ( = ?auto_414675 ?auto_414682 ) ) ( not ( = ?auto_414676 ?auto_414677 ) ) ( not ( = ?auto_414676 ?auto_414678 ) ) ( not ( = ?auto_414676 ?auto_414679 ) ) ( not ( = ?auto_414676 ?auto_414680 ) ) ( not ( = ?auto_414676 ?auto_414681 ) ) ( not ( = ?auto_414676 ?auto_414682 ) ) ( not ( = ?auto_414677 ?auto_414678 ) ) ( not ( = ?auto_414677 ?auto_414679 ) ) ( not ( = ?auto_414677 ?auto_414680 ) ) ( not ( = ?auto_414677 ?auto_414681 ) ) ( not ( = ?auto_414677 ?auto_414682 ) ) ( not ( = ?auto_414678 ?auto_414679 ) ) ( not ( = ?auto_414678 ?auto_414680 ) ) ( not ( = ?auto_414678 ?auto_414681 ) ) ( not ( = ?auto_414678 ?auto_414682 ) ) ( not ( = ?auto_414679 ?auto_414680 ) ) ( not ( = ?auto_414679 ?auto_414681 ) ) ( not ( = ?auto_414679 ?auto_414682 ) ) ( not ( = ?auto_414680 ?auto_414681 ) ) ( not ( = ?auto_414680 ?auto_414682 ) ) ( not ( = ?auto_414681 ?auto_414682 ) ) ( ON ?auto_414680 ?auto_414681 ) ( ON ?auto_414679 ?auto_414680 ) ( ON ?auto_414678 ?auto_414679 ) ( ON ?auto_414677 ?auto_414678 ) ( CLEAR ?auto_414675 ) ( ON ?auto_414676 ?auto_414677 ) ( CLEAR ?auto_414676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_414671 ?auto_414672 ?auto_414673 ?auto_414674 ?auto_414675 ?auto_414676 )
      ( MAKE-11PILE ?auto_414671 ?auto_414672 ?auto_414673 ?auto_414674 ?auto_414675 ?auto_414676 ?auto_414677 ?auto_414678 ?auto_414679 ?auto_414680 ?auto_414681 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414694 - BLOCK
      ?auto_414695 - BLOCK
      ?auto_414696 - BLOCK
      ?auto_414697 - BLOCK
      ?auto_414698 - BLOCK
      ?auto_414699 - BLOCK
      ?auto_414700 - BLOCK
      ?auto_414701 - BLOCK
      ?auto_414702 - BLOCK
      ?auto_414703 - BLOCK
      ?auto_414704 - BLOCK
    )
    :vars
    (
      ?auto_414705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414704 ?auto_414705 ) ( ON-TABLE ?auto_414694 ) ( ON ?auto_414695 ?auto_414694 ) ( ON ?auto_414696 ?auto_414695 ) ( ON ?auto_414697 ?auto_414696 ) ( ON ?auto_414698 ?auto_414697 ) ( not ( = ?auto_414694 ?auto_414695 ) ) ( not ( = ?auto_414694 ?auto_414696 ) ) ( not ( = ?auto_414694 ?auto_414697 ) ) ( not ( = ?auto_414694 ?auto_414698 ) ) ( not ( = ?auto_414694 ?auto_414699 ) ) ( not ( = ?auto_414694 ?auto_414700 ) ) ( not ( = ?auto_414694 ?auto_414701 ) ) ( not ( = ?auto_414694 ?auto_414702 ) ) ( not ( = ?auto_414694 ?auto_414703 ) ) ( not ( = ?auto_414694 ?auto_414704 ) ) ( not ( = ?auto_414694 ?auto_414705 ) ) ( not ( = ?auto_414695 ?auto_414696 ) ) ( not ( = ?auto_414695 ?auto_414697 ) ) ( not ( = ?auto_414695 ?auto_414698 ) ) ( not ( = ?auto_414695 ?auto_414699 ) ) ( not ( = ?auto_414695 ?auto_414700 ) ) ( not ( = ?auto_414695 ?auto_414701 ) ) ( not ( = ?auto_414695 ?auto_414702 ) ) ( not ( = ?auto_414695 ?auto_414703 ) ) ( not ( = ?auto_414695 ?auto_414704 ) ) ( not ( = ?auto_414695 ?auto_414705 ) ) ( not ( = ?auto_414696 ?auto_414697 ) ) ( not ( = ?auto_414696 ?auto_414698 ) ) ( not ( = ?auto_414696 ?auto_414699 ) ) ( not ( = ?auto_414696 ?auto_414700 ) ) ( not ( = ?auto_414696 ?auto_414701 ) ) ( not ( = ?auto_414696 ?auto_414702 ) ) ( not ( = ?auto_414696 ?auto_414703 ) ) ( not ( = ?auto_414696 ?auto_414704 ) ) ( not ( = ?auto_414696 ?auto_414705 ) ) ( not ( = ?auto_414697 ?auto_414698 ) ) ( not ( = ?auto_414697 ?auto_414699 ) ) ( not ( = ?auto_414697 ?auto_414700 ) ) ( not ( = ?auto_414697 ?auto_414701 ) ) ( not ( = ?auto_414697 ?auto_414702 ) ) ( not ( = ?auto_414697 ?auto_414703 ) ) ( not ( = ?auto_414697 ?auto_414704 ) ) ( not ( = ?auto_414697 ?auto_414705 ) ) ( not ( = ?auto_414698 ?auto_414699 ) ) ( not ( = ?auto_414698 ?auto_414700 ) ) ( not ( = ?auto_414698 ?auto_414701 ) ) ( not ( = ?auto_414698 ?auto_414702 ) ) ( not ( = ?auto_414698 ?auto_414703 ) ) ( not ( = ?auto_414698 ?auto_414704 ) ) ( not ( = ?auto_414698 ?auto_414705 ) ) ( not ( = ?auto_414699 ?auto_414700 ) ) ( not ( = ?auto_414699 ?auto_414701 ) ) ( not ( = ?auto_414699 ?auto_414702 ) ) ( not ( = ?auto_414699 ?auto_414703 ) ) ( not ( = ?auto_414699 ?auto_414704 ) ) ( not ( = ?auto_414699 ?auto_414705 ) ) ( not ( = ?auto_414700 ?auto_414701 ) ) ( not ( = ?auto_414700 ?auto_414702 ) ) ( not ( = ?auto_414700 ?auto_414703 ) ) ( not ( = ?auto_414700 ?auto_414704 ) ) ( not ( = ?auto_414700 ?auto_414705 ) ) ( not ( = ?auto_414701 ?auto_414702 ) ) ( not ( = ?auto_414701 ?auto_414703 ) ) ( not ( = ?auto_414701 ?auto_414704 ) ) ( not ( = ?auto_414701 ?auto_414705 ) ) ( not ( = ?auto_414702 ?auto_414703 ) ) ( not ( = ?auto_414702 ?auto_414704 ) ) ( not ( = ?auto_414702 ?auto_414705 ) ) ( not ( = ?auto_414703 ?auto_414704 ) ) ( not ( = ?auto_414703 ?auto_414705 ) ) ( not ( = ?auto_414704 ?auto_414705 ) ) ( ON ?auto_414703 ?auto_414704 ) ( ON ?auto_414702 ?auto_414703 ) ( ON ?auto_414701 ?auto_414702 ) ( ON ?auto_414700 ?auto_414701 ) ( CLEAR ?auto_414698 ) ( ON ?auto_414699 ?auto_414700 ) ( CLEAR ?auto_414699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_414694 ?auto_414695 ?auto_414696 ?auto_414697 ?auto_414698 ?auto_414699 )
      ( MAKE-11PILE ?auto_414694 ?auto_414695 ?auto_414696 ?auto_414697 ?auto_414698 ?auto_414699 ?auto_414700 ?auto_414701 ?auto_414702 ?auto_414703 ?auto_414704 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414717 - BLOCK
      ?auto_414718 - BLOCK
      ?auto_414719 - BLOCK
      ?auto_414720 - BLOCK
      ?auto_414721 - BLOCK
      ?auto_414722 - BLOCK
      ?auto_414723 - BLOCK
      ?auto_414724 - BLOCK
      ?auto_414725 - BLOCK
      ?auto_414726 - BLOCK
      ?auto_414727 - BLOCK
    )
    :vars
    (
      ?auto_414728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414727 ?auto_414728 ) ( ON-TABLE ?auto_414717 ) ( ON ?auto_414718 ?auto_414717 ) ( ON ?auto_414719 ?auto_414718 ) ( ON ?auto_414720 ?auto_414719 ) ( not ( = ?auto_414717 ?auto_414718 ) ) ( not ( = ?auto_414717 ?auto_414719 ) ) ( not ( = ?auto_414717 ?auto_414720 ) ) ( not ( = ?auto_414717 ?auto_414721 ) ) ( not ( = ?auto_414717 ?auto_414722 ) ) ( not ( = ?auto_414717 ?auto_414723 ) ) ( not ( = ?auto_414717 ?auto_414724 ) ) ( not ( = ?auto_414717 ?auto_414725 ) ) ( not ( = ?auto_414717 ?auto_414726 ) ) ( not ( = ?auto_414717 ?auto_414727 ) ) ( not ( = ?auto_414717 ?auto_414728 ) ) ( not ( = ?auto_414718 ?auto_414719 ) ) ( not ( = ?auto_414718 ?auto_414720 ) ) ( not ( = ?auto_414718 ?auto_414721 ) ) ( not ( = ?auto_414718 ?auto_414722 ) ) ( not ( = ?auto_414718 ?auto_414723 ) ) ( not ( = ?auto_414718 ?auto_414724 ) ) ( not ( = ?auto_414718 ?auto_414725 ) ) ( not ( = ?auto_414718 ?auto_414726 ) ) ( not ( = ?auto_414718 ?auto_414727 ) ) ( not ( = ?auto_414718 ?auto_414728 ) ) ( not ( = ?auto_414719 ?auto_414720 ) ) ( not ( = ?auto_414719 ?auto_414721 ) ) ( not ( = ?auto_414719 ?auto_414722 ) ) ( not ( = ?auto_414719 ?auto_414723 ) ) ( not ( = ?auto_414719 ?auto_414724 ) ) ( not ( = ?auto_414719 ?auto_414725 ) ) ( not ( = ?auto_414719 ?auto_414726 ) ) ( not ( = ?auto_414719 ?auto_414727 ) ) ( not ( = ?auto_414719 ?auto_414728 ) ) ( not ( = ?auto_414720 ?auto_414721 ) ) ( not ( = ?auto_414720 ?auto_414722 ) ) ( not ( = ?auto_414720 ?auto_414723 ) ) ( not ( = ?auto_414720 ?auto_414724 ) ) ( not ( = ?auto_414720 ?auto_414725 ) ) ( not ( = ?auto_414720 ?auto_414726 ) ) ( not ( = ?auto_414720 ?auto_414727 ) ) ( not ( = ?auto_414720 ?auto_414728 ) ) ( not ( = ?auto_414721 ?auto_414722 ) ) ( not ( = ?auto_414721 ?auto_414723 ) ) ( not ( = ?auto_414721 ?auto_414724 ) ) ( not ( = ?auto_414721 ?auto_414725 ) ) ( not ( = ?auto_414721 ?auto_414726 ) ) ( not ( = ?auto_414721 ?auto_414727 ) ) ( not ( = ?auto_414721 ?auto_414728 ) ) ( not ( = ?auto_414722 ?auto_414723 ) ) ( not ( = ?auto_414722 ?auto_414724 ) ) ( not ( = ?auto_414722 ?auto_414725 ) ) ( not ( = ?auto_414722 ?auto_414726 ) ) ( not ( = ?auto_414722 ?auto_414727 ) ) ( not ( = ?auto_414722 ?auto_414728 ) ) ( not ( = ?auto_414723 ?auto_414724 ) ) ( not ( = ?auto_414723 ?auto_414725 ) ) ( not ( = ?auto_414723 ?auto_414726 ) ) ( not ( = ?auto_414723 ?auto_414727 ) ) ( not ( = ?auto_414723 ?auto_414728 ) ) ( not ( = ?auto_414724 ?auto_414725 ) ) ( not ( = ?auto_414724 ?auto_414726 ) ) ( not ( = ?auto_414724 ?auto_414727 ) ) ( not ( = ?auto_414724 ?auto_414728 ) ) ( not ( = ?auto_414725 ?auto_414726 ) ) ( not ( = ?auto_414725 ?auto_414727 ) ) ( not ( = ?auto_414725 ?auto_414728 ) ) ( not ( = ?auto_414726 ?auto_414727 ) ) ( not ( = ?auto_414726 ?auto_414728 ) ) ( not ( = ?auto_414727 ?auto_414728 ) ) ( ON ?auto_414726 ?auto_414727 ) ( ON ?auto_414725 ?auto_414726 ) ( ON ?auto_414724 ?auto_414725 ) ( ON ?auto_414723 ?auto_414724 ) ( ON ?auto_414722 ?auto_414723 ) ( CLEAR ?auto_414720 ) ( ON ?auto_414721 ?auto_414722 ) ( CLEAR ?auto_414721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_414717 ?auto_414718 ?auto_414719 ?auto_414720 ?auto_414721 )
      ( MAKE-11PILE ?auto_414717 ?auto_414718 ?auto_414719 ?auto_414720 ?auto_414721 ?auto_414722 ?auto_414723 ?auto_414724 ?auto_414725 ?auto_414726 ?auto_414727 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414740 - BLOCK
      ?auto_414741 - BLOCK
      ?auto_414742 - BLOCK
      ?auto_414743 - BLOCK
      ?auto_414744 - BLOCK
      ?auto_414745 - BLOCK
      ?auto_414746 - BLOCK
      ?auto_414747 - BLOCK
      ?auto_414748 - BLOCK
      ?auto_414749 - BLOCK
      ?auto_414750 - BLOCK
    )
    :vars
    (
      ?auto_414751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414750 ?auto_414751 ) ( ON-TABLE ?auto_414740 ) ( ON ?auto_414741 ?auto_414740 ) ( ON ?auto_414742 ?auto_414741 ) ( ON ?auto_414743 ?auto_414742 ) ( not ( = ?auto_414740 ?auto_414741 ) ) ( not ( = ?auto_414740 ?auto_414742 ) ) ( not ( = ?auto_414740 ?auto_414743 ) ) ( not ( = ?auto_414740 ?auto_414744 ) ) ( not ( = ?auto_414740 ?auto_414745 ) ) ( not ( = ?auto_414740 ?auto_414746 ) ) ( not ( = ?auto_414740 ?auto_414747 ) ) ( not ( = ?auto_414740 ?auto_414748 ) ) ( not ( = ?auto_414740 ?auto_414749 ) ) ( not ( = ?auto_414740 ?auto_414750 ) ) ( not ( = ?auto_414740 ?auto_414751 ) ) ( not ( = ?auto_414741 ?auto_414742 ) ) ( not ( = ?auto_414741 ?auto_414743 ) ) ( not ( = ?auto_414741 ?auto_414744 ) ) ( not ( = ?auto_414741 ?auto_414745 ) ) ( not ( = ?auto_414741 ?auto_414746 ) ) ( not ( = ?auto_414741 ?auto_414747 ) ) ( not ( = ?auto_414741 ?auto_414748 ) ) ( not ( = ?auto_414741 ?auto_414749 ) ) ( not ( = ?auto_414741 ?auto_414750 ) ) ( not ( = ?auto_414741 ?auto_414751 ) ) ( not ( = ?auto_414742 ?auto_414743 ) ) ( not ( = ?auto_414742 ?auto_414744 ) ) ( not ( = ?auto_414742 ?auto_414745 ) ) ( not ( = ?auto_414742 ?auto_414746 ) ) ( not ( = ?auto_414742 ?auto_414747 ) ) ( not ( = ?auto_414742 ?auto_414748 ) ) ( not ( = ?auto_414742 ?auto_414749 ) ) ( not ( = ?auto_414742 ?auto_414750 ) ) ( not ( = ?auto_414742 ?auto_414751 ) ) ( not ( = ?auto_414743 ?auto_414744 ) ) ( not ( = ?auto_414743 ?auto_414745 ) ) ( not ( = ?auto_414743 ?auto_414746 ) ) ( not ( = ?auto_414743 ?auto_414747 ) ) ( not ( = ?auto_414743 ?auto_414748 ) ) ( not ( = ?auto_414743 ?auto_414749 ) ) ( not ( = ?auto_414743 ?auto_414750 ) ) ( not ( = ?auto_414743 ?auto_414751 ) ) ( not ( = ?auto_414744 ?auto_414745 ) ) ( not ( = ?auto_414744 ?auto_414746 ) ) ( not ( = ?auto_414744 ?auto_414747 ) ) ( not ( = ?auto_414744 ?auto_414748 ) ) ( not ( = ?auto_414744 ?auto_414749 ) ) ( not ( = ?auto_414744 ?auto_414750 ) ) ( not ( = ?auto_414744 ?auto_414751 ) ) ( not ( = ?auto_414745 ?auto_414746 ) ) ( not ( = ?auto_414745 ?auto_414747 ) ) ( not ( = ?auto_414745 ?auto_414748 ) ) ( not ( = ?auto_414745 ?auto_414749 ) ) ( not ( = ?auto_414745 ?auto_414750 ) ) ( not ( = ?auto_414745 ?auto_414751 ) ) ( not ( = ?auto_414746 ?auto_414747 ) ) ( not ( = ?auto_414746 ?auto_414748 ) ) ( not ( = ?auto_414746 ?auto_414749 ) ) ( not ( = ?auto_414746 ?auto_414750 ) ) ( not ( = ?auto_414746 ?auto_414751 ) ) ( not ( = ?auto_414747 ?auto_414748 ) ) ( not ( = ?auto_414747 ?auto_414749 ) ) ( not ( = ?auto_414747 ?auto_414750 ) ) ( not ( = ?auto_414747 ?auto_414751 ) ) ( not ( = ?auto_414748 ?auto_414749 ) ) ( not ( = ?auto_414748 ?auto_414750 ) ) ( not ( = ?auto_414748 ?auto_414751 ) ) ( not ( = ?auto_414749 ?auto_414750 ) ) ( not ( = ?auto_414749 ?auto_414751 ) ) ( not ( = ?auto_414750 ?auto_414751 ) ) ( ON ?auto_414749 ?auto_414750 ) ( ON ?auto_414748 ?auto_414749 ) ( ON ?auto_414747 ?auto_414748 ) ( ON ?auto_414746 ?auto_414747 ) ( ON ?auto_414745 ?auto_414746 ) ( CLEAR ?auto_414743 ) ( ON ?auto_414744 ?auto_414745 ) ( CLEAR ?auto_414744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_414740 ?auto_414741 ?auto_414742 ?auto_414743 ?auto_414744 )
      ( MAKE-11PILE ?auto_414740 ?auto_414741 ?auto_414742 ?auto_414743 ?auto_414744 ?auto_414745 ?auto_414746 ?auto_414747 ?auto_414748 ?auto_414749 ?auto_414750 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414763 - BLOCK
      ?auto_414764 - BLOCK
      ?auto_414765 - BLOCK
      ?auto_414766 - BLOCK
      ?auto_414767 - BLOCK
      ?auto_414768 - BLOCK
      ?auto_414769 - BLOCK
      ?auto_414770 - BLOCK
      ?auto_414771 - BLOCK
      ?auto_414772 - BLOCK
      ?auto_414773 - BLOCK
    )
    :vars
    (
      ?auto_414774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414773 ?auto_414774 ) ( ON-TABLE ?auto_414763 ) ( ON ?auto_414764 ?auto_414763 ) ( ON ?auto_414765 ?auto_414764 ) ( not ( = ?auto_414763 ?auto_414764 ) ) ( not ( = ?auto_414763 ?auto_414765 ) ) ( not ( = ?auto_414763 ?auto_414766 ) ) ( not ( = ?auto_414763 ?auto_414767 ) ) ( not ( = ?auto_414763 ?auto_414768 ) ) ( not ( = ?auto_414763 ?auto_414769 ) ) ( not ( = ?auto_414763 ?auto_414770 ) ) ( not ( = ?auto_414763 ?auto_414771 ) ) ( not ( = ?auto_414763 ?auto_414772 ) ) ( not ( = ?auto_414763 ?auto_414773 ) ) ( not ( = ?auto_414763 ?auto_414774 ) ) ( not ( = ?auto_414764 ?auto_414765 ) ) ( not ( = ?auto_414764 ?auto_414766 ) ) ( not ( = ?auto_414764 ?auto_414767 ) ) ( not ( = ?auto_414764 ?auto_414768 ) ) ( not ( = ?auto_414764 ?auto_414769 ) ) ( not ( = ?auto_414764 ?auto_414770 ) ) ( not ( = ?auto_414764 ?auto_414771 ) ) ( not ( = ?auto_414764 ?auto_414772 ) ) ( not ( = ?auto_414764 ?auto_414773 ) ) ( not ( = ?auto_414764 ?auto_414774 ) ) ( not ( = ?auto_414765 ?auto_414766 ) ) ( not ( = ?auto_414765 ?auto_414767 ) ) ( not ( = ?auto_414765 ?auto_414768 ) ) ( not ( = ?auto_414765 ?auto_414769 ) ) ( not ( = ?auto_414765 ?auto_414770 ) ) ( not ( = ?auto_414765 ?auto_414771 ) ) ( not ( = ?auto_414765 ?auto_414772 ) ) ( not ( = ?auto_414765 ?auto_414773 ) ) ( not ( = ?auto_414765 ?auto_414774 ) ) ( not ( = ?auto_414766 ?auto_414767 ) ) ( not ( = ?auto_414766 ?auto_414768 ) ) ( not ( = ?auto_414766 ?auto_414769 ) ) ( not ( = ?auto_414766 ?auto_414770 ) ) ( not ( = ?auto_414766 ?auto_414771 ) ) ( not ( = ?auto_414766 ?auto_414772 ) ) ( not ( = ?auto_414766 ?auto_414773 ) ) ( not ( = ?auto_414766 ?auto_414774 ) ) ( not ( = ?auto_414767 ?auto_414768 ) ) ( not ( = ?auto_414767 ?auto_414769 ) ) ( not ( = ?auto_414767 ?auto_414770 ) ) ( not ( = ?auto_414767 ?auto_414771 ) ) ( not ( = ?auto_414767 ?auto_414772 ) ) ( not ( = ?auto_414767 ?auto_414773 ) ) ( not ( = ?auto_414767 ?auto_414774 ) ) ( not ( = ?auto_414768 ?auto_414769 ) ) ( not ( = ?auto_414768 ?auto_414770 ) ) ( not ( = ?auto_414768 ?auto_414771 ) ) ( not ( = ?auto_414768 ?auto_414772 ) ) ( not ( = ?auto_414768 ?auto_414773 ) ) ( not ( = ?auto_414768 ?auto_414774 ) ) ( not ( = ?auto_414769 ?auto_414770 ) ) ( not ( = ?auto_414769 ?auto_414771 ) ) ( not ( = ?auto_414769 ?auto_414772 ) ) ( not ( = ?auto_414769 ?auto_414773 ) ) ( not ( = ?auto_414769 ?auto_414774 ) ) ( not ( = ?auto_414770 ?auto_414771 ) ) ( not ( = ?auto_414770 ?auto_414772 ) ) ( not ( = ?auto_414770 ?auto_414773 ) ) ( not ( = ?auto_414770 ?auto_414774 ) ) ( not ( = ?auto_414771 ?auto_414772 ) ) ( not ( = ?auto_414771 ?auto_414773 ) ) ( not ( = ?auto_414771 ?auto_414774 ) ) ( not ( = ?auto_414772 ?auto_414773 ) ) ( not ( = ?auto_414772 ?auto_414774 ) ) ( not ( = ?auto_414773 ?auto_414774 ) ) ( ON ?auto_414772 ?auto_414773 ) ( ON ?auto_414771 ?auto_414772 ) ( ON ?auto_414770 ?auto_414771 ) ( ON ?auto_414769 ?auto_414770 ) ( ON ?auto_414768 ?auto_414769 ) ( ON ?auto_414767 ?auto_414768 ) ( CLEAR ?auto_414765 ) ( ON ?auto_414766 ?auto_414767 ) ( CLEAR ?auto_414766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_414763 ?auto_414764 ?auto_414765 ?auto_414766 )
      ( MAKE-11PILE ?auto_414763 ?auto_414764 ?auto_414765 ?auto_414766 ?auto_414767 ?auto_414768 ?auto_414769 ?auto_414770 ?auto_414771 ?auto_414772 ?auto_414773 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414786 - BLOCK
      ?auto_414787 - BLOCK
      ?auto_414788 - BLOCK
      ?auto_414789 - BLOCK
      ?auto_414790 - BLOCK
      ?auto_414791 - BLOCK
      ?auto_414792 - BLOCK
      ?auto_414793 - BLOCK
      ?auto_414794 - BLOCK
      ?auto_414795 - BLOCK
      ?auto_414796 - BLOCK
    )
    :vars
    (
      ?auto_414797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414796 ?auto_414797 ) ( ON-TABLE ?auto_414786 ) ( ON ?auto_414787 ?auto_414786 ) ( ON ?auto_414788 ?auto_414787 ) ( not ( = ?auto_414786 ?auto_414787 ) ) ( not ( = ?auto_414786 ?auto_414788 ) ) ( not ( = ?auto_414786 ?auto_414789 ) ) ( not ( = ?auto_414786 ?auto_414790 ) ) ( not ( = ?auto_414786 ?auto_414791 ) ) ( not ( = ?auto_414786 ?auto_414792 ) ) ( not ( = ?auto_414786 ?auto_414793 ) ) ( not ( = ?auto_414786 ?auto_414794 ) ) ( not ( = ?auto_414786 ?auto_414795 ) ) ( not ( = ?auto_414786 ?auto_414796 ) ) ( not ( = ?auto_414786 ?auto_414797 ) ) ( not ( = ?auto_414787 ?auto_414788 ) ) ( not ( = ?auto_414787 ?auto_414789 ) ) ( not ( = ?auto_414787 ?auto_414790 ) ) ( not ( = ?auto_414787 ?auto_414791 ) ) ( not ( = ?auto_414787 ?auto_414792 ) ) ( not ( = ?auto_414787 ?auto_414793 ) ) ( not ( = ?auto_414787 ?auto_414794 ) ) ( not ( = ?auto_414787 ?auto_414795 ) ) ( not ( = ?auto_414787 ?auto_414796 ) ) ( not ( = ?auto_414787 ?auto_414797 ) ) ( not ( = ?auto_414788 ?auto_414789 ) ) ( not ( = ?auto_414788 ?auto_414790 ) ) ( not ( = ?auto_414788 ?auto_414791 ) ) ( not ( = ?auto_414788 ?auto_414792 ) ) ( not ( = ?auto_414788 ?auto_414793 ) ) ( not ( = ?auto_414788 ?auto_414794 ) ) ( not ( = ?auto_414788 ?auto_414795 ) ) ( not ( = ?auto_414788 ?auto_414796 ) ) ( not ( = ?auto_414788 ?auto_414797 ) ) ( not ( = ?auto_414789 ?auto_414790 ) ) ( not ( = ?auto_414789 ?auto_414791 ) ) ( not ( = ?auto_414789 ?auto_414792 ) ) ( not ( = ?auto_414789 ?auto_414793 ) ) ( not ( = ?auto_414789 ?auto_414794 ) ) ( not ( = ?auto_414789 ?auto_414795 ) ) ( not ( = ?auto_414789 ?auto_414796 ) ) ( not ( = ?auto_414789 ?auto_414797 ) ) ( not ( = ?auto_414790 ?auto_414791 ) ) ( not ( = ?auto_414790 ?auto_414792 ) ) ( not ( = ?auto_414790 ?auto_414793 ) ) ( not ( = ?auto_414790 ?auto_414794 ) ) ( not ( = ?auto_414790 ?auto_414795 ) ) ( not ( = ?auto_414790 ?auto_414796 ) ) ( not ( = ?auto_414790 ?auto_414797 ) ) ( not ( = ?auto_414791 ?auto_414792 ) ) ( not ( = ?auto_414791 ?auto_414793 ) ) ( not ( = ?auto_414791 ?auto_414794 ) ) ( not ( = ?auto_414791 ?auto_414795 ) ) ( not ( = ?auto_414791 ?auto_414796 ) ) ( not ( = ?auto_414791 ?auto_414797 ) ) ( not ( = ?auto_414792 ?auto_414793 ) ) ( not ( = ?auto_414792 ?auto_414794 ) ) ( not ( = ?auto_414792 ?auto_414795 ) ) ( not ( = ?auto_414792 ?auto_414796 ) ) ( not ( = ?auto_414792 ?auto_414797 ) ) ( not ( = ?auto_414793 ?auto_414794 ) ) ( not ( = ?auto_414793 ?auto_414795 ) ) ( not ( = ?auto_414793 ?auto_414796 ) ) ( not ( = ?auto_414793 ?auto_414797 ) ) ( not ( = ?auto_414794 ?auto_414795 ) ) ( not ( = ?auto_414794 ?auto_414796 ) ) ( not ( = ?auto_414794 ?auto_414797 ) ) ( not ( = ?auto_414795 ?auto_414796 ) ) ( not ( = ?auto_414795 ?auto_414797 ) ) ( not ( = ?auto_414796 ?auto_414797 ) ) ( ON ?auto_414795 ?auto_414796 ) ( ON ?auto_414794 ?auto_414795 ) ( ON ?auto_414793 ?auto_414794 ) ( ON ?auto_414792 ?auto_414793 ) ( ON ?auto_414791 ?auto_414792 ) ( ON ?auto_414790 ?auto_414791 ) ( CLEAR ?auto_414788 ) ( ON ?auto_414789 ?auto_414790 ) ( CLEAR ?auto_414789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_414786 ?auto_414787 ?auto_414788 ?auto_414789 )
      ( MAKE-11PILE ?auto_414786 ?auto_414787 ?auto_414788 ?auto_414789 ?auto_414790 ?auto_414791 ?auto_414792 ?auto_414793 ?auto_414794 ?auto_414795 ?auto_414796 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414809 - BLOCK
      ?auto_414810 - BLOCK
      ?auto_414811 - BLOCK
      ?auto_414812 - BLOCK
      ?auto_414813 - BLOCK
      ?auto_414814 - BLOCK
      ?auto_414815 - BLOCK
      ?auto_414816 - BLOCK
      ?auto_414817 - BLOCK
      ?auto_414818 - BLOCK
      ?auto_414819 - BLOCK
    )
    :vars
    (
      ?auto_414820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414819 ?auto_414820 ) ( ON-TABLE ?auto_414809 ) ( ON ?auto_414810 ?auto_414809 ) ( not ( = ?auto_414809 ?auto_414810 ) ) ( not ( = ?auto_414809 ?auto_414811 ) ) ( not ( = ?auto_414809 ?auto_414812 ) ) ( not ( = ?auto_414809 ?auto_414813 ) ) ( not ( = ?auto_414809 ?auto_414814 ) ) ( not ( = ?auto_414809 ?auto_414815 ) ) ( not ( = ?auto_414809 ?auto_414816 ) ) ( not ( = ?auto_414809 ?auto_414817 ) ) ( not ( = ?auto_414809 ?auto_414818 ) ) ( not ( = ?auto_414809 ?auto_414819 ) ) ( not ( = ?auto_414809 ?auto_414820 ) ) ( not ( = ?auto_414810 ?auto_414811 ) ) ( not ( = ?auto_414810 ?auto_414812 ) ) ( not ( = ?auto_414810 ?auto_414813 ) ) ( not ( = ?auto_414810 ?auto_414814 ) ) ( not ( = ?auto_414810 ?auto_414815 ) ) ( not ( = ?auto_414810 ?auto_414816 ) ) ( not ( = ?auto_414810 ?auto_414817 ) ) ( not ( = ?auto_414810 ?auto_414818 ) ) ( not ( = ?auto_414810 ?auto_414819 ) ) ( not ( = ?auto_414810 ?auto_414820 ) ) ( not ( = ?auto_414811 ?auto_414812 ) ) ( not ( = ?auto_414811 ?auto_414813 ) ) ( not ( = ?auto_414811 ?auto_414814 ) ) ( not ( = ?auto_414811 ?auto_414815 ) ) ( not ( = ?auto_414811 ?auto_414816 ) ) ( not ( = ?auto_414811 ?auto_414817 ) ) ( not ( = ?auto_414811 ?auto_414818 ) ) ( not ( = ?auto_414811 ?auto_414819 ) ) ( not ( = ?auto_414811 ?auto_414820 ) ) ( not ( = ?auto_414812 ?auto_414813 ) ) ( not ( = ?auto_414812 ?auto_414814 ) ) ( not ( = ?auto_414812 ?auto_414815 ) ) ( not ( = ?auto_414812 ?auto_414816 ) ) ( not ( = ?auto_414812 ?auto_414817 ) ) ( not ( = ?auto_414812 ?auto_414818 ) ) ( not ( = ?auto_414812 ?auto_414819 ) ) ( not ( = ?auto_414812 ?auto_414820 ) ) ( not ( = ?auto_414813 ?auto_414814 ) ) ( not ( = ?auto_414813 ?auto_414815 ) ) ( not ( = ?auto_414813 ?auto_414816 ) ) ( not ( = ?auto_414813 ?auto_414817 ) ) ( not ( = ?auto_414813 ?auto_414818 ) ) ( not ( = ?auto_414813 ?auto_414819 ) ) ( not ( = ?auto_414813 ?auto_414820 ) ) ( not ( = ?auto_414814 ?auto_414815 ) ) ( not ( = ?auto_414814 ?auto_414816 ) ) ( not ( = ?auto_414814 ?auto_414817 ) ) ( not ( = ?auto_414814 ?auto_414818 ) ) ( not ( = ?auto_414814 ?auto_414819 ) ) ( not ( = ?auto_414814 ?auto_414820 ) ) ( not ( = ?auto_414815 ?auto_414816 ) ) ( not ( = ?auto_414815 ?auto_414817 ) ) ( not ( = ?auto_414815 ?auto_414818 ) ) ( not ( = ?auto_414815 ?auto_414819 ) ) ( not ( = ?auto_414815 ?auto_414820 ) ) ( not ( = ?auto_414816 ?auto_414817 ) ) ( not ( = ?auto_414816 ?auto_414818 ) ) ( not ( = ?auto_414816 ?auto_414819 ) ) ( not ( = ?auto_414816 ?auto_414820 ) ) ( not ( = ?auto_414817 ?auto_414818 ) ) ( not ( = ?auto_414817 ?auto_414819 ) ) ( not ( = ?auto_414817 ?auto_414820 ) ) ( not ( = ?auto_414818 ?auto_414819 ) ) ( not ( = ?auto_414818 ?auto_414820 ) ) ( not ( = ?auto_414819 ?auto_414820 ) ) ( ON ?auto_414818 ?auto_414819 ) ( ON ?auto_414817 ?auto_414818 ) ( ON ?auto_414816 ?auto_414817 ) ( ON ?auto_414815 ?auto_414816 ) ( ON ?auto_414814 ?auto_414815 ) ( ON ?auto_414813 ?auto_414814 ) ( ON ?auto_414812 ?auto_414813 ) ( CLEAR ?auto_414810 ) ( ON ?auto_414811 ?auto_414812 ) ( CLEAR ?auto_414811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_414809 ?auto_414810 ?auto_414811 )
      ( MAKE-11PILE ?auto_414809 ?auto_414810 ?auto_414811 ?auto_414812 ?auto_414813 ?auto_414814 ?auto_414815 ?auto_414816 ?auto_414817 ?auto_414818 ?auto_414819 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414832 - BLOCK
      ?auto_414833 - BLOCK
      ?auto_414834 - BLOCK
      ?auto_414835 - BLOCK
      ?auto_414836 - BLOCK
      ?auto_414837 - BLOCK
      ?auto_414838 - BLOCK
      ?auto_414839 - BLOCK
      ?auto_414840 - BLOCK
      ?auto_414841 - BLOCK
      ?auto_414842 - BLOCK
    )
    :vars
    (
      ?auto_414843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414842 ?auto_414843 ) ( ON-TABLE ?auto_414832 ) ( ON ?auto_414833 ?auto_414832 ) ( not ( = ?auto_414832 ?auto_414833 ) ) ( not ( = ?auto_414832 ?auto_414834 ) ) ( not ( = ?auto_414832 ?auto_414835 ) ) ( not ( = ?auto_414832 ?auto_414836 ) ) ( not ( = ?auto_414832 ?auto_414837 ) ) ( not ( = ?auto_414832 ?auto_414838 ) ) ( not ( = ?auto_414832 ?auto_414839 ) ) ( not ( = ?auto_414832 ?auto_414840 ) ) ( not ( = ?auto_414832 ?auto_414841 ) ) ( not ( = ?auto_414832 ?auto_414842 ) ) ( not ( = ?auto_414832 ?auto_414843 ) ) ( not ( = ?auto_414833 ?auto_414834 ) ) ( not ( = ?auto_414833 ?auto_414835 ) ) ( not ( = ?auto_414833 ?auto_414836 ) ) ( not ( = ?auto_414833 ?auto_414837 ) ) ( not ( = ?auto_414833 ?auto_414838 ) ) ( not ( = ?auto_414833 ?auto_414839 ) ) ( not ( = ?auto_414833 ?auto_414840 ) ) ( not ( = ?auto_414833 ?auto_414841 ) ) ( not ( = ?auto_414833 ?auto_414842 ) ) ( not ( = ?auto_414833 ?auto_414843 ) ) ( not ( = ?auto_414834 ?auto_414835 ) ) ( not ( = ?auto_414834 ?auto_414836 ) ) ( not ( = ?auto_414834 ?auto_414837 ) ) ( not ( = ?auto_414834 ?auto_414838 ) ) ( not ( = ?auto_414834 ?auto_414839 ) ) ( not ( = ?auto_414834 ?auto_414840 ) ) ( not ( = ?auto_414834 ?auto_414841 ) ) ( not ( = ?auto_414834 ?auto_414842 ) ) ( not ( = ?auto_414834 ?auto_414843 ) ) ( not ( = ?auto_414835 ?auto_414836 ) ) ( not ( = ?auto_414835 ?auto_414837 ) ) ( not ( = ?auto_414835 ?auto_414838 ) ) ( not ( = ?auto_414835 ?auto_414839 ) ) ( not ( = ?auto_414835 ?auto_414840 ) ) ( not ( = ?auto_414835 ?auto_414841 ) ) ( not ( = ?auto_414835 ?auto_414842 ) ) ( not ( = ?auto_414835 ?auto_414843 ) ) ( not ( = ?auto_414836 ?auto_414837 ) ) ( not ( = ?auto_414836 ?auto_414838 ) ) ( not ( = ?auto_414836 ?auto_414839 ) ) ( not ( = ?auto_414836 ?auto_414840 ) ) ( not ( = ?auto_414836 ?auto_414841 ) ) ( not ( = ?auto_414836 ?auto_414842 ) ) ( not ( = ?auto_414836 ?auto_414843 ) ) ( not ( = ?auto_414837 ?auto_414838 ) ) ( not ( = ?auto_414837 ?auto_414839 ) ) ( not ( = ?auto_414837 ?auto_414840 ) ) ( not ( = ?auto_414837 ?auto_414841 ) ) ( not ( = ?auto_414837 ?auto_414842 ) ) ( not ( = ?auto_414837 ?auto_414843 ) ) ( not ( = ?auto_414838 ?auto_414839 ) ) ( not ( = ?auto_414838 ?auto_414840 ) ) ( not ( = ?auto_414838 ?auto_414841 ) ) ( not ( = ?auto_414838 ?auto_414842 ) ) ( not ( = ?auto_414838 ?auto_414843 ) ) ( not ( = ?auto_414839 ?auto_414840 ) ) ( not ( = ?auto_414839 ?auto_414841 ) ) ( not ( = ?auto_414839 ?auto_414842 ) ) ( not ( = ?auto_414839 ?auto_414843 ) ) ( not ( = ?auto_414840 ?auto_414841 ) ) ( not ( = ?auto_414840 ?auto_414842 ) ) ( not ( = ?auto_414840 ?auto_414843 ) ) ( not ( = ?auto_414841 ?auto_414842 ) ) ( not ( = ?auto_414841 ?auto_414843 ) ) ( not ( = ?auto_414842 ?auto_414843 ) ) ( ON ?auto_414841 ?auto_414842 ) ( ON ?auto_414840 ?auto_414841 ) ( ON ?auto_414839 ?auto_414840 ) ( ON ?auto_414838 ?auto_414839 ) ( ON ?auto_414837 ?auto_414838 ) ( ON ?auto_414836 ?auto_414837 ) ( ON ?auto_414835 ?auto_414836 ) ( CLEAR ?auto_414833 ) ( ON ?auto_414834 ?auto_414835 ) ( CLEAR ?auto_414834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_414832 ?auto_414833 ?auto_414834 )
      ( MAKE-11PILE ?auto_414832 ?auto_414833 ?auto_414834 ?auto_414835 ?auto_414836 ?auto_414837 ?auto_414838 ?auto_414839 ?auto_414840 ?auto_414841 ?auto_414842 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414855 - BLOCK
      ?auto_414856 - BLOCK
      ?auto_414857 - BLOCK
      ?auto_414858 - BLOCK
      ?auto_414859 - BLOCK
      ?auto_414860 - BLOCK
      ?auto_414861 - BLOCK
      ?auto_414862 - BLOCK
      ?auto_414863 - BLOCK
      ?auto_414864 - BLOCK
      ?auto_414865 - BLOCK
    )
    :vars
    (
      ?auto_414866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414865 ?auto_414866 ) ( ON-TABLE ?auto_414855 ) ( not ( = ?auto_414855 ?auto_414856 ) ) ( not ( = ?auto_414855 ?auto_414857 ) ) ( not ( = ?auto_414855 ?auto_414858 ) ) ( not ( = ?auto_414855 ?auto_414859 ) ) ( not ( = ?auto_414855 ?auto_414860 ) ) ( not ( = ?auto_414855 ?auto_414861 ) ) ( not ( = ?auto_414855 ?auto_414862 ) ) ( not ( = ?auto_414855 ?auto_414863 ) ) ( not ( = ?auto_414855 ?auto_414864 ) ) ( not ( = ?auto_414855 ?auto_414865 ) ) ( not ( = ?auto_414855 ?auto_414866 ) ) ( not ( = ?auto_414856 ?auto_414857 ) ) ( not ( = ?auto_414856 ?auto_414858 ) ) ( not ( = ?auto_414856 ?auto_414859 ) ) ( not ( = ?auto_414856 ?auto_414860 ) ) ( not ( = ?auto_414856 ?auto_414861 ) ) ( not ( = ?auto_414856 ?auto_414862 ) ) ( not ( = ?auto_414856 ?auto_414863 ) ) ( not ( = ?auto_414856 ?auto_414864 ) ) ( not ( = ?auto_414856 ?auto_414865 ) ) ( not ( = ?auto_414856 ?auto_414866 ) ) ( not ( = ?auto_414857 ?auto_414858 ) ) ( not ( = ?auto_414857 ?auto_414859 ) ) ( not ( = ?auto_414857 ?auto_414860 ) ) ( not ( = ?auto_414857 ?auto_414861 ) ) ( not ( = ?auto_414857 ?auto_414862 ) ) ( not ( = ?auto_414857 ?auto_414863 ) ) ( not ( = ?auto_414857 ?auto_414864 ) ) ( not ( = ?auto_414857 ?auto_414865 ) ) ( not ( = ?auto_414857 ?auto_414866 ) ) ( not ( = ?auto_414858 ?auto_414859 ) ) ( not ( = ?auto_414858 ?auto_414860 ) ) ( not ( = ?auto_414858 ?auto_414861 ) ) ( not ( = ?auto_414858 ?auto_414862 ) ) ( not ( = ?auto_414858 ?auto_414863 ) ) ( not ( = ?auto_414858 ?auto_414864 ) ) ( not ( = ?auto_414858 ?auto_414865 ) ) ( not ( = ?auto_414858 ?auto_414866 ) ) ( not ( = ?auto_414859 ?auto_414860 ) ) ( not ( = ?auto_414859 ?auto_414861 ) ) ( not ( = ?auto_414859 ?auto_414862 ) ) ( not ( = ?auto_414859 ?auto_414863 ) ) ( not ( = ?auto_414859 ?auto_414864 ) ) ( not ( = ?auto_414859 ?auto_414865 ) ) ( not ( = ?auto_414859 ?auto_414866 ) ) ( not ( = ?auto_414860 ?auto_414861 ) ) ( not ( = ?auto_414860 ?auto_414862 ) ) ( not ( = ?auto_414860 ?auto_414863 ) ) ( not ( = ?auto_414860 ?auto_414864 ) ) ( not ( = ?auto_414860 ?auto_414865 ) ) ( not ( = ?auto_414860 ?auto_414866 ) ) ( not ( = ?auto_414861 ?auto_414862 ) ) ( not ( = ?auto_414861 ?auto_414863 ) ) ( not ( = ?auto_414861 ?auto_414864 ) ) ( not ( = ?auto_414861 ?auto_414865 ) ) ( not ( = ?auto_414861 ?auto_414866 ) ) ( not ( = ?auto_414862 ?auto_414863 ) ) ( not ( = ?auto_414862 ?auto_414864 ) ) ( not ( = ?auto_414862 ?auto_414865 ) ) ( not ( = ?auto_414862 ?auto_414866 ) ) ( not ( = ?auto_414863 ?auto_414864 ) ) ( not ( = ?auto_414863 ?auto_414865 ) ) ( not ( = ?auto_414863 ?auto_414866 ) ) ( not ( = ?auto_414864 ?auto_414865 ) ) ( not ( = ?auto_414864 ?auto_414866 ) ) ( not ( = ?auto_414865 ?auto_414866 ) ) ( ON ?auto_414864 ?auto_414865 ) ( ON ?auto_414863 ?auto_414864 ) ( ON ?auto_414862 ?auto_414863 ) ( ON ?auto_414861 ?auto_414862 ) ( ON ?auto_414860 ?auto_414861 ) ( ON ?auto_414859 ?auto_414860 ) ( ON ?auto_414858 ?auto_414859 ) ( ON ?auto_414857 ?auto_414858 ) ( CLEAR ?auto_414855 ) ( ON ?auto_414856 ?auto_414857 ) ( CLEAR ?auto_414856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_414855 ?auto_414856 )
      ( MAKE-11PILE ?auto_414855 ?auto_414856 ?auto_414857 ?auto_414858 ?auto_414859 ?auto_414860 ?auto_414861 ?auto_414862 ?auto_414863 ?auto_414864 ?auto_414865 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414878 - BLOCK
      ?auto_414879 - BLOCK
      ?auto_414880 - BLOCK
      ?auto_414881 - BLOCK
      ?auto_414882 - BLOCK
      ?auto_414883 - BLOCK
      ?auto_414884 - BLOCK
      ?auto_414885 - BLOCK
      ?auto_414886 - BLOCK
      ?auto_414887 - BLOCK
      ?auto_414888 - BLOCK
    )
    :vars
    (
      ?auto_414889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414888 ?auto_414889 ) ( ON-TABLE ?auto_414878 ) ( not ( = ?auto_414878 ?auto_414879 ) ) ( not ( = ?auto_414878 ?auto_414880 ) ) ( not ( = ?auto_414878 ?auto_414881 ) ) ( not ( = ?auto_414878 ?auto_414882 ) ) ( not ( = ?auto_414878 ?auto_414883 ) ) ( not ( = ?auto_414878 ?auto_414884 ) ) ( not ( = ?auto_414878 ?auto_414885 ) ) ( not ( = ?auto_414878 ?auto_414886 ) ) ( not ( = ?auto_414878 ?auto_414887 ) ) ( not ( = ?auto_414878 ?auto_414888 ) ) ( not ( = ?auto_414878 ?auto_414889 ) ) ( not ( = ?auto_414879 ?auto_414880 ) ) ( not ( = ?auto_414879 ?auto_414881 ) ) ( not ( = ?auto_414879 ?auto_414882 ) ) ( not ( = ?auto_414879 ?auto_414883 ) ) ( not ( = ?auto_414879 ?auto_414884 ) ) ( not ( = ?auto_414879 ?auto_414885 ) ) ( not ( = ?auto_414879 ?auto_414886 ) ) ( not ( = ?auto_414879 ?auto_414887 ) ) ( not ( = ?auto_414879 ?auto_414888 ) ) ( not ( = ?auto_414879 ?auto_414889 ) ) ( not ( = ?auto_414880 ?auto_414881 ) ) ( not ( = ?auto_414880 ?auto_414882 ) ) ( not ( = ?auto_414880 ?auto_414883 ) ) ( not ( = ?auto_414880 ?auto_414884 ) ) ( not ( = ?auto_414880 ?auto_414885 ) ) ( not ( = ?auto_414880 ?auto_414886 ) ) ( not ( = ?auto_414880 ?auto_414887 ) ) ( not ( = ?auto_414880 ?auto_414888 ) ) ( not ( = ?auto_414880 ?auto_414889 ) ) ( not ( = ?auto_414881 ?auto_414882 ) ) ( not ( = ?auto_414881 ?auto_414883 ) ) ( not ( = ?auto_414881 ?auto_414884 ) ) ( not ( = ?auto_414881 ?auto_414885 ) ) ( not ( = ?auto_414881 ?auto_414886 ) ) ( not ( = ?auto_414881 ?auto_414887 ) ) ( not ( = ?auto_414881 ?auto_414888 ) ) ( not ( = ?auto_414881 ?auto_414889 ) ) ( not ( = ?auto_414882 ?auto_414883 ) ) ( not ( = ?auto_414882 ?auto_414884 ) ) ( not ( = ?auto_414882 ?auto_414885 ) ) ( not ( = ?auto_414882 ?auto_414886 ) ) ( not ( = ?auto_414882 ?auto_414887 ) ) ( not ( = ?auto_414882 ?auto_414888 ) ) ( not ( = ?auto_414882 ?auto_414889 ) ) ( not ( = ?auto_414883 ?auto_414884 ) ) ( not ( = ?auto_414883 ?auto_414885 ) ) ( not ( = ?auto_414883 ?auto_414886 ) ) ( not ( = ?auto_414883 ?auto_414887 ) ) ( not ( = ?auto_414883 ?auto_414888 ) ) ( not ( = ?auto_414883 ?auto_414889 ) ) ( not ( = ?auto_414884 ?auto_414885 ) ) ( not ( = ?auto_414884 ?auto_414886 ) ) ( not ( = ?auto_414884 ?auto_414887 ) ) ( not ( = ?auto_414884 ?auto_414888 ) ) ( not ( = ?auto_414884 ?auto_414889 ) ) ( not ( = ?auto_414885 ?auto_414886 ) ) ( not ( = ?auto_414885 ?auto_414887 ) ) ( not ( = ?auto_414885 ?auto_414888 ) ) ( not ( = ?auto_414885 ?auto_414889 ) ) ( not ( = ?auto_414886 ?auto_414887 ) ) ( not ( = ?auto_414886 ?auto_414888 ) ) ( not ( = ?auto_414886 ?auto_414889 ) ) ( not ( = ?auto_414887 ?auto_414888 ) ) ( not ( = ?auto_414887 ?auto_414889 ) ) ( not ( = ?auto_414888 ?auto_414889 ) ) ( ON ?auto_414887 ?auto_414888 ) ( ON ?auto_414886 ?auto_414887 ) ( ON ?auto_414885 ?auto_414886 ) ( ON ?auto_414884 ?auto_414885 ) ( ON ?auto_414883 ?auto_414884 ) ( ON ?auto_414882 ?auto_414883 ) ( ON ?auto_414881 ?auto_414882 ) ( ON ?auto_414880 ?auto_414881 ) ( CLEAR ?auto_414878 ) ( ON ?auto_414879 ?auto_414880 ) ( CLEAR ?auto_414879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_414878 ?auto_414879 )
      ( MAKE-11PILE ?auto_414878 ?auto_414879 ?auto_414880 ?auto_414881 ?auto_414882 ?auto_414883 ?auto_414884 ?auto_414885 ?auto_414886 ?auto_414887 ?auto_414888 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414901 - BLOCK
      ?auto_414902 - BLOCK
      ?auto_414903 - BLOCK
      ?auto_414904 - BLOCK
      ?auto_414905 - BLOCK
      ?auto_414906 - BLOCK
      ?auto_414907 - BLOCK
      ?auto_414908 - BLOCK
      ?auto_414909 - BLOCK
      ?auto_414910 - BLOCK
      ?auto_414911 - BLOCK
    )
    :vars
    (
      ?auto_414912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414911 ?auto_414912 ) ( not ( = ?auto_414901 ?auto_414902 ) ) ( not ( = ?auto_414901 ?auto_414903 ) ) ( not ( = ?auto_414901 ?auto_414904 ) ) ( not ( = ?auto_414901 ?auto_414905 ) ) ( not ( = ?auto_414901 ?auto_414906 ) ) ( not ( = ?auto_414901 ?auto_414907 ) ) ( not ( = ?auto_414901 ?auto_414908 ) ) ( not ( = ?auto_414901 ?auto_414909 ) ) ( not ( = ?auto_414901 ?auto_414910 ) ) ( not ( = ?auto_414901 ?auto_414911 ) ) ( not ( = ?auto_414901 ?auto_414912 ) ) ( not ( = ?auto_414902 ?auto_414903 ) ) ( not ( = ?auto_414902 ?auto_414904 ) ) ( not ( = ?auto_414902 ?auto_414905 ) ) ( not ( = ?auto_414902 ?auto_414906 ) ) ( not ( = ?auto_414902 ?auto_414907 ) ) ( not ( = ?auto_414902 ?auto_414908 ) ) ( not ( = ?auto_414902 ?auto_414909 ) ) ( not ( = ?auto_414902 ?auto_414910 ) ) ( not ( = ?auto_414902 ?auto_414911 ) ) ( not ( = ?auto_414902 ?auto_414912 ) ) ( not ( = ?auto_414903 ?auto_414904 ) ) ( not ( = ?auto_414903 ?auto_414905 ) ) ( not ( = ?auto_414903 ?auto_414906 ) ) ( not ( = ?auto_414903 ?auto_414907 ) ) ( not ( = ?auto_414903 ?auto_414908 ) ) ( not ( = ?auto_414903 ?auto_414909 ) ) ( not ( = ?auto_414903 ?auto_414910 ) ) ( not ( = ?auto_414903 ?auto_414911 ) ) ( not ( = ?auto_414903 ?auto_414912 ) ) ( not ( = ?auto_414904 ?auto_414905 ) ) ( not ( = ?auto_414904 ?auto_414906 ) ) ( not ( = ?auto_414904 ?auto_414907 ) ) ( not ( = ?auto_414904 ?auto_414908 ) ) ( not ( = ?auto_414904 ?auto_414909 ) ) ( not ( = ?auto_414904 ?auto_414910 ) ) ( not ( = ?auto_414904 ?auto_414911 ) ) ( not ( = ?auto_414904 ?auto_414912 ) ) ( not ( = ?auto_414905 ?auto_414906 ) ) ( not ( = ?auto_414905 ?auto_414907 ) ) ( not ( = ?auto_414905 ?auto_414908 ) ) ( not ( = ?auto_414905 ?auto_414909 ) ) ( not ( = ?auto_414905 ?auto_414910 ) ) ( not ( = ?auto_414905 ?auto_414911 ) ) ( not ( = ?auto_414905 ?auto_414912 ) ) ( not ( = ?auto_414906 ?auto_414907 ) ) ( not ( = ?auto_414906 ?auto_414908 ) ) ( not ( = ?auto_414906 ?auto_414909 ) ) ( not ( = ?auto_414906 ?auto_414910 ) ) ( not ( = ?auto_414906 ?auto_414911 ) ) ( not ( = ?auto_414906 ?auto_414912 ) ) ( not ( = ?auto_414907 ?auto_414908 ) ) ( not ( = ?auto_414907 ?auto_414909 ) ) ( not ( = ?auto_414907 ?auto_414910 ) ) ( not ( = ?auto_414907 ?auto_414911 ) ) ( not ( = ?auto_414907 ?auto_414912 ) ) ( not ( = ?auto_414908 ?auto_414909 ) ) ( not ( = ?auto_414908 ?auto_414910 ) ) ( not ( = ?auto_414908 ?auto_414911 ) ) ( not ( = ?auto_414908 ?auto_414912 ) ) ( not ( = ?auto_414909 ?auto_414910 ) ) ( not ( = ?auto_414909 ?auto_414911 ) ) ( not ( = ?auto_414909 ?auto_414912 ) ) ( not ( = ?auto_414910 ?auto_414911 ) ) ( not ( = ?auto_414910 ?auto_414912 ) ) ( not ( = ?auto_414911 ?auto_414912 ) ) ( ON ?auto_414910 ?auto_414911 ) ( ON ?auto_414909 ?auto_414910 ) ( ON ?auto_414908 ?auto_414909 ) ( ON ?auto_414907 ?auto_414908 ) ( ON ?auto_414906 ?auto_414907 ) ( ON ?auto_414905 ?auto_414906 ) ( ON ?auto_414904 ?auto_414905 ) ( ON ?auto_414903 ?auto_414904 ) ( ON ?auto_414902 ?auto_414903 ) ( ON ?auto_414901 ?auto_414902 ) ( CLEAR ?auto_414901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_414901 )
      ( MAKE-11PILE ?auto_414901 ?auto_414902 ?auto_414903 ?auto_414904 ?auto_414905 ?auto_414906 ?auto_414907 ?auto_414908 ?auto_414909 ?auto_414910 ?auto_414911 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_414924 - BLOCK
      ?auto_414925 - BLOCK
      ?auto_414926 - BLOCK
      ?auto_414927 - BLOCK
      ?auto_414928 - BLOCK
      ?auto_414929 - BLOCK
      ?auto_414930 - BLOCK
      ?auto_414931 - BLOCK
      ?auto_414932 - BLOCK
      ?auto_414933 - BLOCK
      ?auto_414934 - BLOCK
    )
    :vars
    (
      ?auto_414935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_414934 ?auto_414935 ) ( not ( = ?auto_414924 ?auto_414925 ) ) ( not ( = ?auto_414924 ?auto_414926 ) ) ( not ( = ?auto_414924 ?auto_414927 ) ) ( not ( = ?auto_414924 ?auto_414928 ) ) ( not ( = ?auto_414924 ?auto_414929 ) ) ( not ( = ?auto_414924 ?auto_414930 ) ) ( not ( = ?auto_414924 ?auto_414931 ) ) ( not ( = ?auto_414924 ?auto_414932 ) ) ( not ( = ?auto_414924 ?auto_414933 ) ) ( not ( = ?auto_414924 ?auto_414934 ) ) ( not ( = ?auto_414924 ?auto_414935 ) ) ( not ( = ?auto_414925 ?auto_414926 ) ) ( not ( = ?auto_414925 ?auto_414927 ) ) ( not ( = ?auto_414925 ?auto_414928 ) ) ( not ( = ?auto_414925 ?auto_414929 ) ) ( not ( = ?auto_414925 ?auto_414930 ) ) ( not ( = ?auto_414925 ?auto_414931 ) ) ( not ( = ?auto_414925 ?auto_414932 ) ) ( not ( = ?auto_414925 ?auto_414933 ) ) ( not ( = ?auto_414925 ?auto_414934 ) ) ( not ( = ?auto_414925 ?auto_414935 ) ) ( not ( = ?auto_414926 ?auto_414927 ) ) ( not ( = ?auto_414926 ?auto_414928 ) ) ( not ( = ?auto_414926 ?auto_414929 ) ) ( not ( = ?auto_414926 ?auto_414930 ) ) ( not ( = ?auto_414926 ?auto_414931 ) ) ( not ( = ?auto_414926 ?auto_414932 ) ) ( not ( = ?auto_414926 ?auto_414933 ) ) ( not ( = ?auto_414926 ?auto_414934 ) ) ( not ( = ?auto_414926 ?auto_414935 ) ) ( not ( = ?auto_414927 ?auto_414928 ) ) ( not ( = ?auto_414927 ?auto_414929 ) ) ( not ( = ?auto_414927 ?auto_414930 ) ) ( not ( = ?auto_414927 ?auto_414931 ) ) ( not ( = ?auto_414927 ?auto_414932 ) ) ( not ( = ?auto_414927 ?auto_414933 ) ) ( not ( = ?auto_414927 ?auto_414934 ) ) ( not ( = ?auto_414927 ?auto_414935 ) ) ( not ( = ?auto_414928 ?auto_414929 ) ) ( not ( = ?auto_414928 ?auto_414930 ) ) ( not ( = ?auto_414928 ?auto_414931 ) ) ( not ( = ?auto_414928 ?auto_414932 ) ) ( not ( = ?auto_414928 ?auto_414933 ) ) ( not ( = ?auto_414928 ?auto_414934 ) ) ( not ( = ?auto_414928 ?auto_414935 ) ) ( not ( = ?auto_414929 ?auto_414930 ) ) ( not ( = ?auto_414929 ?auto_414931 ) ) ( not ( = ?auto_414929 ?auto_414932 ) ) ( not ( = ?auto_414929 ?auto_414933 ) ) ( not ( = ?auto_414929 ?auto_414934 ) ) ( not ( = ?auto_414929 ?auto_414935 ) ) ( not ( = ?auto_414930 ?auto_414931 ) ) ( not ( = ?auto_414930 ?auto_414932 ) ) ( not ( = ?auto_414930 ?auto_414933 ) ) ( not ( = ?auto_414930 ?auto_414934 ) ) ( not ( = ?auto_414930 ?auto_414935 ) ) ( not ( = ?auto_414931 ?auto_414932 ) ) ( not ( = ?auto_414931 ?auto_414933 ) ) ( not ( = ?auto_414931 ?auto_414934 ) ) ( not ( = ?auto_414931 ?auto_414935 ) ) ( not ( = ?auto_414932 ?auto_414933 ) ) ( not ( = ?auto_414932 ?auto_414934 ) ) ( not ( = ?auto_414932 ?auto_414935 ) ) ( not ( = ?auto_414933 ?auto_414934 ) ) ( not ( = ?auto_414933 ?auto_414935 ) ) ( not ( = ?auto_414934 ?auto_414935 ) ) ( ON ?auto_414933 ?auto_414934 ) ( ON ?auto_414932 ?auto_414933 ) ( ON ?auto_414931 ?auto_414932 ) ( ON ?auto_414930 ?auto_414931 ) ( ON ?auto_414929 ?auto_414930 ) ( ON ?auto_414928 ?auto_414929 ) ( ON ?auto_414927 ?auto_414928 ) ( ON ?auto_414926 ?auto_414927 ) ( ON ?auto_414925 ?auto_414926 ) ( ON ?auto_414924 ?auto_414925 ) ( CLEAR ?auto_414924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_414924 )
      ( MAKE-11PILE ?auto_414924 ?auto_414925 ?auto_414926 ?auto_414927 ?auto_414928 ?auto_414929 ?auto_414930 ?auto_414931 ?auto_414932 ?auto_414933 ?auto_414934 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_414948 - BLOCK
      ?auto_414949 - BLOCK
      ?auto_414950 - BLOCK
      ?auto_414951 - BLOCK
      ?auto_414952 - BLOCK
      ?auto_414953 - BLOCK
      ?auto_414954 - BLOCK
      ?auto_414955 - BLOCK
      ?auto_414956 - BLOCK
      ?auto_414957 - BLOCK
      ?auto_414958 - BLOCK
      ?auto_414959 - BLOCK
    )
    :vars
    (
      ?auto_414960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_414958 ) ( ON ?auto_414959 ?auto_414960 ) ( CLEAR ?auto_414959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_414948 ) ( ON ?auto_414949 ?auto_414948 ) ( ON ?auto_414950 ?auto_414949 ) ( ON ?auto_414951 ?auto_414950 ) ( ON ?auto_414952 ?auto_414951 ) ( ON ?auto_414953 ?auto_414952 ) ( ON ?auto_414954 ?auto_414953 ) ( ON ?auto_414955 ?auto_414954 ) ( ON ?auto_414956 ?auto_414955 ) ( ON ?auto_414957 ?auto_414956 ) ( ON ?auto_414958 ?auto_414957 ) ( not ( = ?auto_414948 ?auto_414949 ) ) ( not ( = ?auto_414948 ?auto_414950 ) ) ( not ( = ?auto_414948 ?auto_414951 ) ) ( not ( = ?auto_414948 ?auto_414952 ) ) ( not ( = ?auto_414948 ?auto_414953 ) ) ( not ( = ?auto_414948 ?auto_414954 ) ) ( not ( = ?auto_414948 ?auto_414955 ) ) ( not ( = ?auto_414948 ?auto_414956 ) ) ( not ( = ?auto_414948 ?auto_414957 ) ) ( not ( = ?auto_414948 ?auto_414958 ) ) ( not ( = ?auto_414948 ?auto_414959 ) ) ( not ( = ?auto_414948 ?auto_414960 ) ) ( not ( = ?auto_414949 ?auto_414950 ) ) ( not ( = ?auto_414949 ?auto_414951 ) ) ( not ( = ?auto_414949 ?auto_414952 ) ) ( not ( = ?auto_414949 ?auto_414953 ) ) ( not ( = ?auto_414949 ?auto_414954 ) ) ( not ( = ?auto_414949 ?auto_414955 ) ) ( not ( = ?auto_414949 ?auto_414956 ) ) ( not ( = ?auto_414949 ?auto_414957 ) ) ( not ( = ?auto_414949 ?auto_414958 ) ) ( not ( = ?auto_414949 ?auto_414959 ) ) ( not ( = ?auto_414949 ?auto_414960 ) ) ( not ( = ?auto_414950 ?auto_414951 ) ) ( not ( = ?auto_414950 ?auto_414952 ) ) ( not ( = ?auto_414950 ?auto_414953 ) ) ( not ( = ?auto_414950 ?auto_414954 ) ) ( not ( = ?auto_414950 ?auto_414955 ) ) ( not ( = ?auto_414950 ?auto_414956 ) ) ( not ( = ?auto_414950 ?auto_414957 ) ) ( not ( = ?auto_414950 ?auto_414958 ) ) ( not ( = ?auto_414950 ?auto_414959 ) ) ( not ( = ?auto_414950 ?auto_414960 ) ) ( not ( = ?auto_414951 ?auto_414952 ) ) ( not ( = ?auto_414951 ?auto_414953 ) ) ( not ( = ?auto_414951 ?auto_414954 ) ) ( not ( = ?auto_414951 ?auto_414955 ) ) ( not ( = ?auto_414951 ?auto_414956 ) ) ( not ( = ?auto_414951 ?auto_414957 ) ) ( not ( = ?auto_414951 ?auto_414958 ) ) ( not ( = ?auto_414951 ?auto_414959 ) ) ( not ( = ?auto_414951 ?auto_414960 ) ) ( not ( = ?auto_414952 ?auto_414953 ) ) ( not ( = ?auto_414952 ?auto_414954 ) ) ( not ( = ?auto_414952 ?auto_414955 ) ) ( not ( = ?auto_414952 ?auto_414956 ) ) ( not ( = ?auto_414952 ?auto_414957 ) ) ( not ( = ?auto_414952 ?auto_414958 ) ) ( not ( = ?auto_414952 ?auto_414959 ) ) ( not ( = ?auto_414952 ?auto_414960 ) ) ( not ( = ?auto_414953 ?auto_414954 ) ) ( not ( = ?auto_414953 ?auto_414955 ) ) ( not ( = ?auto_414953 ?auto_414956 ) ) ( not ( = ?auto_414953 ?auto_414957 ) ) ( not ( = ?auto_414953 ?auto_414958 ) ) ( not ( = ?auto_414953 ?auto_414959 ) ) ( not ( = ?auto_414953 ?auto_414960 ) ) ( not ( = ?auto_414954 ?auto_414955 ) ) ( not ( = ?auto_414954 ?auto_414956 ) ) ( not ( = ?auto_414954 ?auto_414957 ) ) ( not ( = ?auto_414954 ?auto_414958 ) ) ( not ( = ?auto_414954 ?auto_414959 ) ) ( not ( = ?auto_414954 ?auto_414960 ) ) ( not ( = ?auto_414955 ?auto_414956 ) ) ( not ( = ?auto_414955 ?auto_414957 ) ) ( not ( = ?auto_414955 ?auto_414958 ) ) ( not ( = ?auto_414955 ?auto_414959 ) ) ( not ( = ?auto_414955 ?auto_414960 ) ) ( not ( = ?auto_414956 ?auto_414957 ) ) ( not ( = ?auto_414956 ?auto_414958 ) ) ( not ( = ?auto_414956 ?auto_414959 ) ) ( not ( = ?auto_414956 ?auto_414960 ) ) ( not ( = ?auto_414957 ?auto_414958 ) ) ( not ( = ?auto_414957 ?auto_414959 ) ) ( not ( = ?auto_414957 ?auto_414960 ) ) ( not ( = ?auto_414958 ?auto_414959 ) ) ( not ( = ?auto_414958 ?auto_414960 ) ) ( not ( = ?auto_414959 ?auto_414960 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_414959 ?auto_414960 )
      ( !STACK ?auto_414959 ?auto_414958 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_414973 - BLOCK
      ?auto_414974 - BLOCK
      ?auto_414975 - BLOCK
      ?auto_414976 - BLOCK
      ?auto_414977 - BLOCK
      ?auto_414978 - BLOCK
      ?auto_414979 - BLOCK
      ?auto_414980 - BLOCK
      ?auto_414981 - BLOCK
      ?auto_414982 - BLOCK
      ?auto_414983 - BLOCK
      ?auto_414984 - BLOCK
    )
    :vars
    (
      ?auto_414985 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_414983 ) ( ON ?auto_414984 ?auto_414985 ) ( CLEAR ?auto_414984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_414973 ) ( ON ?auto_414974 ?auto_414973 ) ( ON ?auto_414975 ?auto_414974 ) ( ON ?auto_414976 ?auto_414975 ) ( ON ?auto_414977 ?auto_414976 ) ( ON ?auto_414978 ?auto_414977 ) ( ON ?auto_414979 ?auto_414978 ) ( ON ?auto_414980 ?auto_414979 ) ( ON ?auto_414981 ?auto_414980 ) ( ON ?auto_414982 ?auto_414981 ) ( ON ?auto_414983 ?auto_414982 ) ( not ( = ?auto_414973 ?auto_414974 ) ) ( not ( = ?auto_414973 ?auto_414975 ) ) ( not ( = ?auto_414973 ?auto_414976 ) ) ( not ( = ?auto_414973 ?auto_414977 ) ) ( not ( = ?auto_414973 ?auto_414978 ) ) ( not ( = ?auto_414973 ?auto_414979 ) ) ( not ( = ?auto_414973 ?auto_414980 ) ) ( not ( = ?auto_414973 ?auto_414981 ) ) ( not ( = ?auto_414973 ?auto_414982 ) ) ( not ( = ?auto_414973 ?auto_414983 ) ) ( not ( = ?auto_414973 ?auto_414984 ) ) ( not ( = ?auto_414973 ?auto_414985 ) ) ( not ( = ?auto_414974 ?auto_414975 ) ) ( not ( = ?auto_414974 ?auto_414976 ) ) ( not ( = ?auto_414974 ?auto_414977 ) ) ( not ( = ?auto_414974 ?auto_414978 ) ) ( not ( = ?auto_414974 ?auto_414979 ) ) ( not ( = ?auto_414974 ?auto_414980 ) ) ( not ( = ?auto_414974 ?auto_414981 ) ) ( not ( = ?auto_414974 ?auto_414982 ) ) ( not ( = ?auto_414974 ?auto_414983 ) ) ( not ( = ?auto_414974 ?auto_414984 ) ) ( not ( = ?auto_414974 ?auto_414985 ) ) ( not ( = ?auto_414975 ?auto_414976 ) ) ( not ( = ?auto_414975 ?auto_414977 ) ) ( not ( = ?auto_414975 ?auto_414978 ) ) ( not ( = ?auto_414975 ?auto_414979 ) ) ( not ( = ?auto_414975 ?auto_414980 ) ) ( not ( = ?auto_414975 ?auto_414981 ) ) ( not ( = ?auto_414975 ?auto_414982 ) ) ( not ( = ?auto_414975 ?auto_414983 ) ) ( not ( = ?auto_414975 ?auto_414984 ) ) ( not ( = ?auto_414975 ?auto_414985 ) ) ( not ( = ?auto_414976 ?auto_414977 ) ) ( not ( = ?auto_414976 ?auto_414978 ) ) ( not ( = ?auto_414976 ?auto_414979 ) ) ( not ( = ?auto_414976 ?auto_414980 ) ) ( not ( = ?auto_414976 ?auto_414981 ) ) ( not ( = ?auto_414976 ?auto_414982 ) ) ( not ( = ?auto_414976 ?auto_414983 ) ) ( not ( = ?auto_414976 ?auto_414984 ) ) ( not ( = ?auto_414976 ?auto_414985 ) ) ( not ( = ?auto_414977 ?auto_414978 ) ) ( not ( = ?auto_414977 ?auto_414979 ) ) ( not ( = ?auto_414977 ?auto_414980 ) ) ( not ( = ?auto_414977 ?auto_414981 ) ) ( not ( = ?auto_414977 ?auto_414982 ) ) ( not ( = ?auto_414977 ?auto_414983 ) ) ( not ( = ?auto_414977 ?auto_414984 ) ) ( not ( = ?auto_414977 ?auto_414985 ) ) ( not ( = ?auto_414978 ?auto_414979 ) ) ( not ( = ?auto_414978 ?auto_414980 ) ) ( not ( = ?auto_414978 ?auto_414981 ) ) ( not ( = ?auto_414978 ?auto_414982 ) ) ( not ( = ?auto_414978 ?auto_414983 ) ) ( not ( = ?auto_414978 ?auto_414984 ) ) ( not ( = ?auto_414978 ?auto_414985 ) ) ( not ( = ?auto_414979 ?auto_414980 ) ) ( not ( = ?auto_414979 ?auto_414981 ) ) ( not ( = ?auto_414979 ?auto_414982 ) ) ( not ( = ?auto_414979 ?auto_414983 ) ) ( not ( = ?auto_414979 ?auto_414984 ) ) ( not ( = ?auto_414979 ?auto_414985 ) ) ( not ( = ?auto_414980 ?auto_414981 ) ) ( not ( = ?auto_414980 ?auto_414982 ) ) ( not ( = ?auto_414980 ?auto_414983 ) ) ( not ( = ?auto_414980 ?auto_414984 ) ) ( not ( = ?auto_414980 ?auto_414985 ) ) ( not ( = ?auto_414981 ?auto_414982 ) ) ( not ( = ?auto_414981 ?auto_414983 ) ) ( not ( = ?auto_414981 ?auto_414984 ) ) ( not ( = ?auto_414981 ?auto_414985 ) ) ( not ( = ?auto_414982 ?auto_414983 ) ) ( not ( = ?auto_414982 ?auto_414984 ) ) ( not ( = ?auto_414982 ?auto_414985 ) ) ( not ( = ?auto_414983 ?auto_414984 ) ) ( not ( = ?auto_414983 ?auto_414985 ) ) ( not ( = ?auto_414984 ?auto_414985 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_414984 ?auto_414985 )
      ( !STACK ?auto_414984 ?auto_414983 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_414998 - BLOCK
      ?auto_414999 - BLOCK
      ?auto_415000 - BLOCK
      ?auto_415001 - BLOCK
      ?auto_415002 - BLOCK
      ?auto_415003 - BLOCK
      ?auto_415004 - BLOCK
      ?auto_415005 - BLOCK
      ?auto_415006 - BLOCK
      ?auto_415007 - BLOCK
      ?auto_415008 - BLOCK
      ?auto_415009 - BLOCK
    )
    :vars
    (
      ?auto_415010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415009 ?auto_415010 ) ( ON-TABLE ?auto_414998 ) ( ON ?auto_414999 ?auto_414998 ) ( ON ?auto_415000 ?auto_414999 ) ( ON ?auto_415001 ?auto_415000 ) ( ON ?auto_415002 ?auto_415001 ) ( ON ?auto_415003 ?auto_415002 ) ( ON ?auto_415004 ?auto_415003 ) ( ON ?auto_415005 ?auto_415004 ) ( ON ?auto_415006 ?auto_415005 ) ( ON ?auto_415007 ?auto_415006 ) ( not ( = ?auto_414998 ?auto_414999 ) ) ( not ( = ?auto_414998 ?auto_415000 ) ) ( not ( = ?auto_414998 ?auto_415001 ) ) ( not ( = ?auto_414998 ?auto_415002 ) ) ( not ( = ?auto_414998 ?auto_415003 ) ) ( not ( = ?auto_414998 ?auto_415004 ) ) ( not ( = ?auto_414998 ?auto_415005 ) ) ( not ( = ?auto_414998 ?auto_415006 ) ) ( not ( = ?auto_414998 ?auto_415007 ) ) ( not ( = ?auto_414998 ?auto_415008 ) ) ( not ( = ?auto_414998 ?auto_415009 ) ) ( not ( = ?auto_414998 ?auto_415010 ) ) ( not ( = ?auto_414999 ?auto_415000 ) ) ( not ( = ?auto_414999 ?auto_415001 ) ) ( not ( = ?auto_414999 ?auto_415002 ) ) ( not ( = ?auto_414999 ?auto_415003 ) ) ( not ( = ?auto_414999 ?auto_415004 ) ) ( not ( = ?auto_414999 ?auto_415005 ) ) ( not ( = ?auto_414999 ?auto_415006 ) ) ( not ( = ?auto_414999 ?auto_415007 ) ) ( not ( = ?auto_414999 ?auto_415008 ) ) ( not ( = ?auto_414999 ?auto_415009 ) ) ( not ( = ?auto_414999 ?auto_415010 ) ) ( not ( = ?auto_415000 ?auto_415001 ) ) ( not ( = ?auto_415000 ?auto_415002 ) ) ( not ( = ?auto_415000 ?auto_415003 ) ) ( not ( = ?auto_415000 ?auto_415004 ) ) ( not ( = ?auto_415000 ?auto_415005 ) ) ( not ( = ?auto_415000 ?auto_415006 ) ) ( not ( = ?auto_415000 ?auto_415007 ) ) ( not ( = ?auto_415000 ?auto_415008 ) ) ( not ( = ?auto_415000 ?auto_415009 ) ) ( not ( = ?auto_415000 ?auto_415010 ) ) ( not ( = ?auto_415001 ?auto_415002 ) ) ( not ( = ?auto_415001 ?auto_415003 ) ) ( not ( = ?auto_415001 ?auto_415004 ) ) ( not ( = ?auto_415001 ?auto_415005 ) ) ( not ( = ?auto_415001 ?auto_415006 ) ) ( not ( = ?auto_415001 ?auto_415007 ) ) ( not ( = ?auto_415001 ?auto_415008 ) ) ( not ( = ?auto_415001 ?auto_415009 ) ) ( not ( = ?auto_415001 ?auto_415010 ) ) ( not ( = ?auto_415002 ?auto_415003 ) ) ( not ( = ?auto_415002 ?auto_415004 ) ) ( not ( = ?auto_415002 ?auto_415005 ) ) ( not ( = ?auto_415002 ?auto_415006 ) ) ( not ( = ?auto_415002 ?auto_415007 ) ) ( not ( = ?auto_415002 ?auto_415008 ) ) ( not ( = ?auto_415002 ?auto_415009 ) ) ( not ( = ?auto_415002 ?auto_415010 ) ) ( not ( = ?auto_415003 ?auto_415004 ) ) ( not ( = ?auto_415003 ?auto_415005 ) ) ( not ( = ?auto_415003 ?auto_415006 ) ) ( not ( = ?auto_415003 ?auto_415007 ) ) ( not ( = ?auto_415003 ?auto_415008 ) ) ( not ( = ?auto_415003 ?auto_415009 ) ) ( not ( = ?auto_415003 ?auto_415010 ) ) ( not ( = ?auto_415004 ?auto_415005 ) ) ( not ( = ?auto_415004 ?auto_415006 ) ) ( not ( = ?auto_415004 ?auto_415007 ) ) ( not ( = ?auto_415004 ?auto_415008 ) ) ( not ( = ?auto_415004 ?auto_415009 ) ) ( not ( = ?auto_415004 ?auto_415010 ) ) ( not ( = ?auto_415005 ?auto_415006 ) ) ( not ( = ?auto_415005 ?auto_415007 ) ) ( not ( = ?auto_415005 ?auto_415008 ) ) ( not ( = ?auto_415005 ?auto_415009 ) ) ( not ( = ?auto_415005 ?auto_415010 ) ) ( not ( = ?auto_415006 ?auto_415007 ) ) ( not ( = ?auto_415006 ?auto_415008 ) ) ( not ( = ?auto_415006 ?auto_415009 ) ) ( not ( = ?auto_415006 ?auto_415010 ) ) ( not ( = ?auto_415007 ?auto_415008 ) ) ( not ( = ?auto_415007 ?auto_415009 ) ) ( not ( = ?auto_415007 ?auto_415010 ) ) ( not ( = ?auto_415008 ?auto_415009 ) ) ( not ( = ?auto_415008 ?auto_415010 ) ) ( not ( = ?auto_415009 ?auto_415010 ) ) ( CLEAR ?auto_415007 ) ( ON ?auto_415008 ?auto_415009 ) ( CLEAR ?auto_415008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_414998 ?auto_414999 ?auto_415000 ?auto_415001 ?auto_415002 ?auto_415003 ?auto_415004 ?auto_415005 ?auto_415006 ?auto_415007 ?auto_415008 )
      ( MAKE-12PILE ?auto_414998 ?auto_414999 ?auto_415000 ?auto_415001 ?auto_415002 ?auto_415003 ?auto_415004 ?auto_415005 ?auto_415006 ?auto_415007 ?auto_415008 ?auto_415009 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415023 - BLOCK
      ?auto_415024 - BLOCK
      ?auto_415025 - BLOCK
      ?auto_415026 - BLOCK
      ?auto_415027 - BLOCK
      ?auto_415028 - BLOCK
      ?auto_415029 - BLOCK
      ?auto_415030 - BLOCK
      ?auto_415031 - BLOCK
      ?auto_415032 - BLOCK
      ?auto_415033 - BLOCK
      ?auto_415034 - BLOCK
    )
    :vars
    (
      ?auto_415035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415034 ?auto_415035 ) ( ON-TABLE ?auto_415023 ) ( ON ?auto_415024 ?auto_415023 ) ( ON ?auto_415025 ?auto_415024 ) ( ON ?auto_415026 ?auto_415025 ) ( ON ?auto_415027 ?auto_415026 ) ( ON ?auto_415028 ?auto_415027 ) ( ON ?auto_415029 ?auto_415028 ) ( ON ?auto_415030 ?auto_415029 ) ( ON ?auto_415031 ?auto_415030 ) ( ON ?auto_415032 ?auto_415031 ) ( not ( = ?auto_415023 ?auto_415024 ) ) ( not ( = ?auto_415023 ?auto_415025 ) ) ( not ( = ?auto_415023 ?auto_415026 ) ) ( not ( = ?auto_415023 ?auto_415027 ) ) ( not ( = ?auto_415023 ?auto_415028 ) ) ( not ( = ?auto_415023 ?auto_415029 ) ) ( not ( = ?auto_415023 ?auto_415030 ) ) ( not ( = ?auto_415023 ?auto_415031 ) ) ( not ( = ?auto_415023 ?auto_415032 ) ) ( not ( = ?auto_415023 ?auto_415033 ) ) ( not ( = ?auto_415023 ?auto_415034 ) ) ( not ( = ?auto_415023 ?auto_415035 ) ) ( not ( = ?auto_415024 ?auto_415025 ) ) ( not ( = ?auto_415024 ?auto_415026 ) ) ( not ( = ?auto_415024 ?auto_415027 ) ) ( not ( = ?auto_415024 ?auto_415028 ) ) ( not ( = ?auto_415024 ?auto_415029 ) ) ( not ( = ?auto_415024 ?auto_415030 ) ) ( not ( = ?auto_415024 ?auto_415031 ) ) ( not ( = ?auto_415024 ?auto_415032 ) ) ( not ( = ?auto_415024 ?auto_415033 ) ) ( not ( = ?auto_415024 ?auto_415034 ) ) ( not ( = ?auto_415024 ?auto_415035 ) ) ( not ( = ?auto_415025 ?auto_415026 ) ) ( not ( = ?auto_415025 ?auto_415027 ) ) ( not ( = ?auto_415025 ?auto_415028 ) ) ( not ( = ?auto_415025 ?auto_415029 ) ) ( not ( = ?auto_415025 ?auto_415030 ) ) ( not ( = ?auto_415025 ?auto_415031 ) ) ( not ( = ?auto_415025 ?auto_415032 ) ) ( not ( = ?auto_415025 ?auto_415033 ) ) ( not ( = ?auto_415025 ?auto_415034 ) ) ( not ( = ?auto_415025 ?auto_415035 ) ) ( not ( = ?auto_415026 ?auto_415027 ) ) ( not ( = ?auto_415026 ?auto_415028 ) ) ( not ( = ?auto_415026 ?auto_415029 ) ) ( not ( = ?auto_415026 ?auto_415030 ) ) ( not ( = ?auto_415026 ?auto_415031 ) ) ( not ( = ?auto_415026 ?auto_415032 ) ) ( not ( = ?auto_415026 ?auto_415033 ) ) ( not ( = ?auto_415026 ?auto_415034 ) ) ( not ( = ?auto_415026 ?auto_415035 ) ) ( not ( = ?auto_415027 ?auto_415028 ) ) ( not ( = ?auto_415027 ?auto_415029 ) ) ( not ( = ?auto_415027 ?auto_415030 ) ) ( not ( = ?auto_415027 ?auto_415031 ) ) ( not ( = ?auto_415027 ?auto_415032 ) ) ( not ( = ?auto_415027 ?auto_415033 ) ) ( not ( = ?auto_415027 ?auto_415034 ) ) ( not ( = ?auto_415027 ?auto_415035 ) ) ( not ( = ?auto_415028 ?auto_415029 ) ) ( not ( = ?auto_415028 ?auto_415030 ) ) ( not ( = ?auto_415028 ?auto_415031 ) ) ( not ( = ?auto_415028 ?auto_415032 ) ) ( not ( = ?auto_415028 ?auto_415033 ) ) ( not ( = ?auto_415028 ?auto_415034 ) ) ( not ( = ?auto_415028 ?auto_415035 ) ) ( not ( = ?auto_415029 ?auto_415030 ) ) ( not ( = ?auto_415029 ?auto_415031 ) ) ( not ( = ?auto_415029 ?auto_415032 ) ) ( not ( = ?auto_415029 ?auto_415033 ) ) ( not ( = ?auto_415029 ?auto_415034 ) ) ( not ( = ?auto_415029 ?auto_415035 ) ) ( not ( = ?auto_415030 ?auto_415031 ) ) ( not ( = ?auto_415030 ?auto_415032 ) ) ( not ( = ?auto_415030 ?auto_415033 ) ) ( not ( = ?auto_415030 ?auto_415034 ) ) ( not ( = ?auto_415030 ?auto_415035 ) ) ( not ( = ?auto_415031 ?auto_415032 ) ) ( not ( = ?auto_415031 ?auto_415033 ) ) ( not ( = ?auto_415031 ?auto_415034 ) ) ( not ( = ?auto_415031 ?auto_415035 ) ) ( not ( = ?auto_415032 ?auto_415033 ) ) ( not ( = ?auto_415032 ?auto_415034 ) ) ( not ( = ?auto_415032 ?auto_415035 ) ) ( not ( = ?auto_415033 ?auto_415034 ) ) ( not ( = ?auto_415033 ?auto_415035 ) ) ( not ( = ?auto_415034 ?auto_415035 ) ) ( CLEAR ?auto_415032 ) ( ON ?auto_415033 ?auto_415034 ) ( CLEAR ?auto_415033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_415023 ?auto_415024 ?auto_415025 ?auto_415026 ?auto_415027 ?auto_415028 ?auto_415029 ?auto_415030 ?auto_415031 ?auto_415032 ?auto_415033 )
      ( MAKE-12PILE ?auto_415023 ?auto_415024 ?auto_415025 ?auto_415026 ?auto_415027 ?auto_415028 ?auto_415029 ?auto_415030 ?auto_415031 ?auto_415032 ?auto_415033 ?auto_415034 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415048 - BLOCK
      ?auto_415049 - BLOCK
      ?auto_415050 - BLOCK
      ?auto_415051 - BLOCK
      ?auto_415052 - BLOCK
      ?auto_415053 - BLOCK
      ?auto_415054 - BLOCK
      ?auto_415055 - BLOCK
      ?auto_415056 - BLOCK
      ?auto_415057 - BLOCK
      ?auto_415058 - BLOCK
      ?auto_415059 - BLOCK
    )
    :vars
    (
      ?auto_415060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415059 ?auto_415060 ) ( ON-TABLE ?auto_415048 ) ( ON ?auto_415049 ?auto_415048 ) ( ON ?auto_415050 ?auto_415049 ) ( ON ?auto_415051 ?auto_415050 ) ( ON ?auto_415052 ?auto_415051 ) ( ON ?auto_415053 ?auto_415052 ) ( ON ?auto_415054 ?auto_415053 ) ( ON ?auto_415055 ?auto_415054 ) ( ON ?auto_415056 ?auto_415055 ) ( not ( = ?auto_415048 ?auto_415049 ) ) ( not ( = ?auto_415048 ?auto_415050 ) ) ( not ( = ?auto_415048 ?auto_415051 ) ) ( not ( = ?auto_415048 ?auto_415052 ) ) ( not ( = ?auto_415048 ?auto_415053 ) ) ( not ( = ?auto_415048 ?auto_415054 ) ) ( not ( = ?auto_415048 ?auto_415055 ) ) ( not ( = ?auto_415048 ?auto_415056 ) ) ( not ( = ?auto_415048 ?auto_415057 ) ) ( not ( = ?auto_415048 ?auto_415058 ) ) ( not ( = ?auto_415048 ?auto_415059 ) ) ( not ( = ?auto_415048 ?auto_415060 ) ) ( not ( = ?auto_415049 ?auto_415050 ) ) ( not ( = ?auto_415049 ?auto_415051 ) ) ( not ( = ?auto_415049 ?auto_415052 ) ) ( not ( = ?auto_415049 ?auto_415053 ) ) ( not ( = ?auto_415049 ?auto_415054 ) ) ( not ( = ?auto_415049 ?auto_415055 ) ) ( not ( = ?auto_415049 ?auto_415056 ) ) ( not ( = ?auto_415049 ?auto_415057 ) ) ( not ( = ?auto_415049 ?auto_415058 ) ) ( not ( = ?auto_415049 ?auto_415059 ) ) ( not ( = ?auto_415049 ?auto_415060 ) ) ( not ( = ?auto_415050 ?auto_415051 ) ) ( not ( = ?auto_415050 ?auto_415052 ) ) ( not ( = ?auto_415050 ?auto_415053 ) ) ( not ( = ?auto_415050 ?auto_415054 ) ) ( not ( = ?auto_415050 ?auto_415055 ) ) ( not ( = ?auto_415050 ?auto_415056 ) ) ( not ( = ?auto_415050 ?auto_415057 ) ) ( not ( = ?auto_415050 ?auto_415058 ) ) ( not ( = ?auto_415050 ?auto_415059 ) ) ( not ( = ?auto_415050 ?auto_415060 ) ) ( not ( = ?auto_415051 ?auto_415052 ) ) ( not ( = ?auto_415051 ?auto_415053 ) ) ( not ( = ?auto_415051 ?auto_415054 ) ) ( not ( = ?auto_415051 ?auto_415055 ) ) ( not ( = ?auto_415051 ?auto_415056 ) ) ( not ( = ?auto_415051 ?auto_415057 ) ) ( not ( = ?auto_415051 ?auto_415058 ) ) ( not ( = ?auto_415051 ?auto_415059 ) ) ( not ( = ?auto_415051 ?auto_415060 ) ) ( not ( = ?auto_415052 ?auto_415053 ) ) ( not ( = ?auto_415052 ?auto_415054 ) ) ( not ( = ?auto_415052 ?auto_415055 ) ) ( not ( = ?auto_415052 ?auto_415056 ) ) ( not ( = ?auto_415052 ?auto_415057 ) ) ( not ( = ?auto_415052 ?auto_415058 ) ) ( not ( = ?auto_415052 ?auto_415059 ) ) ( not ( = ?auto_415052 ?auto_415060 ) ) ( not ( = ?auto_415053 ?auto_415054 ) ) ( not ( = ?auto_415053 ?auto_415055 ) ) ( not ( = ?auto_415053 ?auto_415056 ) ) ( not ( = ?auto_415053 ?auto_415057 ) ) ( not ( = ?auto_415053 ?auto_415058 ) ) ( not ( = ?auto_415053 ?auto_415059 ) ) ( not ( = ?auto_415053 ?auto_415060 ) ) ( not ( = ?auto_415054 ?auto_415055 ) ) ( not ( = ?auto_415054 ?auto_415056 ) ) ( not ( = ?auto_415054 ?auto_415057 ) ) ( not ( = ?auto_415054 ?auto_415058 ) ) ( not ( = ?auto_415054 ?auto_415059 ) ) ( not ( = ?auto_415054 ?auto_415060 ) ) ( not ( = ?auto_415055 ?auto_415056 ) ) ( not ( = ?auto_415055 ?auto_415057 ) ) ( not ( = ?auto_415055 ?auto_415058 ) ) ( not ( = ?auto_415055 ?auto_415059 ) ) ( not ( = ?auto_415055 ?auto_415060 ) ) ( not ( = ?auto_415056 ?auto_415057 ) ) ( not ( = ?auto_415056 ?auto_415058 ) ) ( not ( = ?auto_415056 ?auto_415059 ) ) ( not ( = ?auto_415056 ?auto_415060 ) ) ( not ( = ?auto_415057 ?auto_415058 ) ) ( not ( = ?auto_415057 ?auto_415059 ) ) ( not ( = ?auto_415057 ?auto_415060 ) ) ( not ( = ?auto_415058 ?auto_415059 ) ) ( not ( = ?auto_415058 ?auto_415060 ) ) ( not ( = ?auto_415059 ?auto_415060 ) ) ( ON ?auto_415058 ?auto_415059 ) ( CLEAR ?auto_415056 ) ( ON ?auto_415057 ?auto_415058 ) ( CLEAR ?auto_415057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_415048 ?auto_415049 ?auto_415050 ?auto_415051 ?auto_415052 ?auto_415053 ?auto_415054 ?auto_415055 ?auto_415056 ?auto_415057 )
      ( MAKE-12PILE ?auto_415048 ?auto_415049 ?auto_415050 ?auto_415051 ?auto_415052 ?auto_415053 ?auto_415054 ?auto_415055 ?auto_415056 ?auto_415057 ?auto_415058 ?auto_415059 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415073 - BLOCK
      ?auto_415074 - BLOCK
      ?auto_415075 - BLOCK
      ?auto_415076 - BLOCK
      ?auto_415077 - BLOCK
      ?auto_415078 - BLOCK
      ?auto_415079 - BLOCK
      ?auto_415080 - BLOCK
      ?auto_415081 - BLOCK
      ?auto_415082 - BLOCK
      ?auto_415083 - BLOCK
      ?auto_415084 - BLOCK
    )
    :vars
    (
      ?auto_415085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415084 ?auto_415085 ) ( ON-TABLE ?auto_415073 ) ( ON ?auto_415074 ?auto_415073 ) ( ON ?auto_415075 ?auto_415074 ) ( ON ?auto_415076 ?auto_415075 ) ( ON ?auto_415077 ?auto_415076 ) ( ON ?auto_415078 ?auto_415077 ) ( ON ?auto_415079 ?auto_415078 ) ( ON ?auto_415080 ?auto_415079 ) ( ON ?auto_415081 ?auto_415080 ) ( not ( = ?auto_415073 ?auto_415074 ) ) ( not ( = ?auto_415073 ?auto_415075 ) ) ( not ( = ?auto_415073 ?auto_415076 ) ) ( not ( = ?auto_415073 ?auto_415077 ) ) ( not ( = ?auto_415073 ?auto_415078 ) ) ( not ( = ?auto_415073 ?auto_415079 ) ) ( not ( = ?auto_415073 ?auto_415080 ) ) ( not ( = ?auto_415073 ?auto_415081 ) ) ( not ( = ?auto_415073 ?auto_415082 ) ) ( not ( = ?auto_415073 ?auto_415083 ) ) ( not ( = ?auto_415073 ?auto_415084 ) ) ( not ( = ?auto_415073 ?auto_415085 ) ) ( not ( = ?auto_415074 ?auto_415075 ) ) ( not ( = ?auto_415074 ?auto_415076 ) ) ( not ( = ?auto_415074 ?auto_415077 ) ) ( not ( = ?auto_415074 ?auto_415078 ) ) ( not ( = ?auto_415074 ?auto_415079 ) ) ( not ( = ?auto_415074 ?auto_415080 ) ) ( not ( = ?auto_415074 ?auto_415081 ) ) ( not ( = ?auto_415074 ?auto_415082 ) ) ( not ( = ?auto_415074 ?auto_415083 ) ) ( not ( = ?auto_415074 ?auto_415084 ) ) ( not ( = ?auto_415074 ?auto_415085 ) ) ( not ( = ?auto_415075 ?auto_415076 ) ) ( not ( = ?auto_415075 ?auto_415077 ) ) ( not ( = ?auto_415075 ?auto_415078 ) ) ( not ( = ?auto_415075 ?auto_415079 ) ) ( not ( = ?auto_415075 ?auto_415080 ) ) ( not ( = ?auto_415075 ?auto_415081 ) ) ( not ( = ?auto_415075 ?auto_415082 ) ) ( not ( = ?auto_415075 ?auto_415083 ) ) ( not ( = ?auto_415075 ?auto_415084 ) ) ( not ( = ?auto_415075 ?auto_415085 ) ) ( not ( = ?auto_415076 ?auto_415077 ) ) ( not ( = ?auto_415076 ?auto_415078 ) ) ( not ( = ?auto_415076 ?auto_415079 ) ) ( not ( = ?auto_415076 ?auto_415080 ) ) ( not ( = ?auto_415076 ?auto_415081 ) ) ( not ( = ?auto_415076 ?auto_415082 ) ) ( not ( = ?auto_415076 ?auto_415083 ) ) ( not ( = ?auto_415076 ?auto_415084 ) ) ( not ( = ?auto_415076 ?auto_415085 ) ) ( not ( = ?auto_415077 ?auto_415078 ) ) ( not ( = ?auto_415077 ?auto_415079 ) ) ( not ( = ?auto_415077 ?auto_415080 ) ) ( not ( = ?auto_415077 ?auto_415081 ) ) ( not ( = ?auto_415077 ?auto_415082 ) ) ( not ( = ?auto_415077 ?auto_415083 ) ) ( not ( = ?auto_415077 ?auto_415084 ) ) ( not ( = ?auto_415077 ?auto_415085 ) ) ( not ( = ?auto_415078 ?auto_415079 ) ) ( not ( = ?auto_415078 ?auto_415080 ) ) ( not ( = ?auto_415078 ?auto_415081 ) ) ( not ( = ?auto_415078 ?auto_415082 ) ) ( not ( = ?auto_415078 ?auto_415083 ) ) ( not ( = ?auto_415078 ?auto_415084 ) ) ( not ( = ?auto_415078 ?auto_415085 ) ) ( not ( = ?auto_415079 ?auto_415080 ) ) ( not ( = ?auto_415079 ?auto_415081 ) ) ( not ( = ?auto_415079 ?auto_415082 ) ) ( not ( = ?auto_415079 ?auto_415083 ) ) ( not ( = ?auto_415079 ?auto_415084 ) ) ( not ( = ?auto_415079 ?auto_415085 ) ) ( not ( = ?auto_415080 ?auto_415081 ) ) ( not ( = ?auto_415080 ?auto_415082 ) ) ( not ( = ?auto_415080 ?auto_415083 ) ) ( not ( = ?auto_415080 ?auto_415084 ) ) ( not ( = ?auto_415080 ?auto_415085 ) ) ( not ( = ?auto_415081 ?auto_415082 ) ) ( not ( = ?auto_415081 ?auto_415083 ) ) ( not ( = ?auto_415081 ?auto_415084 ) ) ( not ( = ?auto_415081 ?auto_415085 ) ) ( not ( = ?auto_415082 ?auto_415083 ) ) ( not ( = ?auto_415082 ?auto_415084 ) ) ( not ( = ?auto_415082 ?auto_415085 ) ) ( not ( = ?auto_415083 ?auto_415084 ) ) ( not ( = ?auto_415083 ?auto_415085 ) ) ( not ( = ?auto_415084 ?auto_415085 ) ) ( ON ?auto_415083 ?auto_415084 ) ( CLEAR ?auto_415081 ) ( ON ?auto_415082 ?auto_415083 ) ( CLEAR ?auto_415082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_415073 ?auto_415074 ?auto_415075 ?auto_415076 ?auto_415077 ?auto_415078 ?auto_415079 ?auto_415080 ?auto_415081 ?auto_415082 )
      ( MAKE-12PILE ?auto_415073 ?auto_415074 ?auto_415075 ?auto_415076 ?auto_415077 ?auto_415078 ?auto_415079 ?auto_415080 ?auto_415081 ?auto_415082 ?auto_415083 ?auto_415084 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415098 - BLOCK
      ?auto_415099 - BLOCK
      ?auto_415100 - BLOCK
      ?auto_415101 - BLOCK
      ?auto_415102 - BLOCK
      ?auto_415103 - BLOCK
      ?auto_415104 - BLOCK
      ?auto_415105 - BLOCK
      ?auto_415106 - BLOCK
      ?auto_415107 - BLOCK
      ?auto_415108 - BLOCK
      ?auto_415109 - BLOCK
    )
    :vars
    (
      ?auto_415110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415109 ?auto_415110 ) ( ON-TABLE ?auto_415098 ) ( ON ?auto_415099 ?auto_415098 ) ( ON ?auto_415100 ?auto_415099 ) ( ON ?auto_415101 ?auto_415100 ) ( ON ?auto_415102 ?auto_415101 ) ( ON ?auto_415103 ?auto_415102 ) ( ON ?auto_415104 ?auto_415103 ) ( ON ?auto_415105 ?auto_415104 ) ( not ( = ?auto_415098 ?auto_415099 ) ) ( not ( = ?auto_415098 ?auto_415100 ) ) ( not ( = ?auto_415098 ?auto_415101 ) ) ( not ( = ?auto_415098 ?auto_415102 ) ) ( not ( = ?auto_415098 ?auto_415103 ) ) ( not ( = ?auto_415098 ?auto_415104 ) ) ( not ( = ?auto_415098 ?auto_415105 ) ) ( not ( = ?auto_415098 ?auto_415106 ) ) ( not ( = ?auto_415098 ?auto_415107 ) ) ( not ( = ?auto_415098 ?auto_415108 ) ) ( not ( = ?auto_415098 ?auto_415109 ) ) ( not ( = ?auto_415098 ?auto_415110 ) ) ( not ( = ?auto_415099 ?auto_415100 ) ) ( not ( = ?auto_415099 ?auto_415101 ) ) ( not ( = ?auto_415099 ?auto_415102 ) ) ( not ( = ?auto_415099 ?auto_415103 ) ) ( not ( = ?auto_415099 ?auto_415104 ) ) ( not ( = ?auto_415099 ?auto_415105 ) ) ( not ( = ?auto_415099 ?auto_415106 ) ) ( not ( = ?auto_415099 ?auto_415107 ) ) ( not ( = ?auto_415099 ?auto_415108 ) ) ( not ( = ?auto_415099 ?auto_415109 ) ) ( not ( = ?auto_415099 ?auto_415110 ) ) ( not ( = ?auto_415100 ?auto_415101 ) ) ( not ( = ?auto_415100 ?auto_415102 ) ) ( not ( = ?auto_415100 ?auto_415103 ) ) ( not ( = ?auto_415100 ?auto_415104 ) ) ( not ( = ?auto_415100 ?auto_415105 ) ) ( not ( = ?auto_415100 ?auto_415106 ) ) ( not ( = ?auto_415100 ?auto_415107 ) ) ( not ( = ?auto_415100 ?auto_415108 ) ) ( not ( = ?auto_415100 ?auto_415109 ) ) ( not ( = ?auto_415100 ?auto_415110 ) ) ( not ( = ?auto_415101 ?auto_415102 ) ) ( not ( = ?auto_415101 ?auto_415103 ) ) ( not ( = ?auto_415101 ?auto_415104 ) ) ( not ( = ?auto_415101 ?auto_415105 ) ) ( not ( = ?auto_415101 ?auto_415106 ) ) ( not ( = ?auto_415101 ?auto_415107 ) ) ( not ( = ?auto_415101 ?auto_415108 ) ) ( not ( = ?auto_415101 ?auto_415109 ) ) ( not ( = ?auto_415101 ?auto_415110 ) ) ( not ( = ?auto_415102 ?auto_415103 ) ) ( not ( = ?auto_415102 ?auto_415104 ) ) ( not ( = ?auto_415102 ?auto_415105 ) ) ( not ( = ?auto_415102 ?auto_415106 ) ) ( not ( = ?auto_415102 ?auto_415107 ) ) ( not ( = ?auto_415102 ?auto_415108 ) ) ( not ( = ?auto_415102 ?auto_415109 ) ) ( not ( = ?auto_415102 ?auto_415110 ) ) ( not ( = ?auto_415103 ?auto_415104 ) ) ( not ( = ?auto_415103 ?auto_415105 ) ) ( not ( = ?auto_415103 ?auto_415106 ) ) ( not ( = ?auto_415103 ?auto_415107 ) ) ( not ( = ?auto_415103 ?auto_415108 ) ) ( not ( = ?auto_415103 ?auto_415109 ) ) ( not ( = ?auto_415103 ?auto_415110 ) ) ( not ( = ?auto_415104 ?auto_415105 ) ) ( not ( = ?auto_415104 ?auto_415106 ) ) ( not ( = ?auto_415104 ?auto_415107 ) ) ( not ( = ?auto_415104 ?auto_415108 ) ) ( not ( = ?auto_415104 ?auto_415109 ) ) ( not ( = ?auto_415104 ?auto_415110 ) ) ( not ( = ?auto_415105 ?auto_415106 ) ) ( not ( = ?auto_415105 ?auto_415107 ) ) ( not ( = ?auto_415105 ?auto_415108 ) ) ( not ( = ?auto_415105 ?auto_415109 ) ) ( not ( = ?auto_415105 ?auto_415110 ) ) ( not ( = ?auto_415106 ?auto_415107 ) ) ( not ( = ?auto_415106 ?auto_415108 ) ) ( not ( = ?auto_415106 ?auto_415109 ) ) ( not ( = ?auto_415106 ?auto_415110 ) ) ( not ( = ?auto_415107 ?auto_415108 ) ) ( not ( = ?auto_415107 ?auto_415109 ) ) ( not ( = ?auto_415107 ?auto_415110 ) ) ( not ( = ?auto_415108 ?auto_415109 ) ) ( not ( = ?auto_415108 ?auto_415110 ) ) ( not ( = ?auto_415109 ?auto_415110 ) ) ( ON ?auto_415108 ?auto_415109 ) ( ON ?auto_415107 ?auto_415108 ) ( CLEAR ?auto_415105 ) ( ON ?auto_415106 ?auto_415107 ) ( CLEAR ?auto_415106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_415098 ?auto_415099 ?auto_415100 ?auto_415101 ?auto_415102 ?auto_415103 ?auto_415104 ?auto_415105 ?auto_415106 )
      ( MAKE-12PILE ?auto_415098 ?auto_415099 ?auto_415100 ?auto_415101 ?auto_415102 ?auto_415103 ?auto_415104 ?auto_415105 ?auto_415106 ?auto_415107 ?auto_415108 ?auto_415109 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415123 - BLOCK
      ?auto_415124 - BLOCK
      ?auto_415125 - BLOCK
      ?auto_415126 - BLOCK
      ?auto_415127 - BLOCK
      ?auto_415128 - BLOCK
      ?auto_415129 - BLOCK
      ?auto_415130 - BLOCK
      ?auto_415131 - BLOCK
      ?auto_415132 - BLOCK
      ?auto_415133 - BLOCK
      ?auto_415134 - BLOCK
    )
    :vars
    (
      ?auto_415135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415134 ?auto_415135 ) ( ON-TABLE ?auto_415123 ) ( ON ?auto_415124 ?auto_415123 ) ( ON ?auto_415125 ?auto_415124 ) ( ON ?auto_415126 ?auto_415125 ) ( ON ?auto_415127 ?auto_415126 ) ( ON ?auto_415128 ?auto_415127 ) ( ON ?auto_415129 ?auto_415128 ) ( ON ?auto_415130 ?auto_415129 ) ( not ( = ?auto_415123 ?auto_415124 ) ) ( not ( = ?auto_415123 ?auto_415125 ) ) ( not ( = ?auto_415123 ?auto_415126 ) ) ( not ( = ?auto_415123 ?auto_415127 ) ) ( not ( = ?auto_415123 ?auto_415128 ) ) ( not ( = ?auto_415123 ?auto_415129 ) ) ( not ( = ?auto_415123 ?auto_415130 ) ) ( not ( = ?auto_415123 ?auto_415131 ) ) ( not ( = ?auto_415123 ?auto_415132 ) ) ( not ( = ?auto_415123 ?auto_415133 ) ) ( not ( = ?auto_415123 ?auto_415134 ) ) ( not ( = ?auto_415123 ?auto_415135 ) ) ( not ( = ?auto_415124 ?auto_415125 ) ) ( not ( = ?auto_415124 ?auto_415126 ) ) ( not ( = ?auto_415124 ?auto_415127 ) ) ( not ( = ?auto_415124 ?auto_415128 ) ) ( not ( = ?auto_415124 ?auto_415129 ) ) ( not ( = ?auto_415124 ?auto_415130 ) ) ( not ( = ?auto_415124 ?auto_415131 ) ) ( not ( = ?auto_415124 ?auto_415132 ) ) ( not ( = ?auto_415124 ?auto_415133 ) ) ( not ( = ?auto_415124 ?auto_415134 ) ) ( not ( = ?auto_415124 ?auto_415135 ) ) ( not ( = ?auto_415125 ?auto_415126 ) ) ( not ( = ?auto_415125 ?auto_415127 ) ) ( not ( = ?auto_415125 ?auto_415128 ) ) ( not ( = ?auto_415125 ?auto_415129 ) ) ( not ( = ?auto_415125 ?auto_415130 ) ) ( not ( = ?auto_415125 ?auto_415131 ) ) ( not ( = ?auto_415125 ?auto_415132 ) ) ( not ( = ?auto_415125 ?auto_415133 ) ) ( not ( = ?auto_415125 ?auto_415134 ) ) ( not ( = ?auto_415125 ?auto_415135 ) ) ( not ( = ?auto_415126 ?auto_415127 ) ) ( not ( = ?auto_415126 ?auto_415128 ) ) ( not ( = ?auto_415126 ?auto_415129 ) ) ( not ( = ?auto_415126 ?auto_415130 ) ) ( not ( = ?auto_415126 ?auto_415131 ) ) ( not ( = ?auto_415126 ?auto_415132 ) ) ( not ( = ?auto_415126 ?auto_415133 ) ) ( not ( = ?auto_415126 ?auto_415134 ) ) ( not ( = ?auto_415126 ?auto_415135 ) ) ( not ( = ?auto_415127 ?auto_415128 ) ) ( not ( = ?auto_415127 ?auto_415129 ) ) ( not ( = ?auto_415127 ?auto_415130 ) ) ( not ( = ?auto_415127 ?auto_415131 ) ) ( not ( = ?auto_415127 ?auto_415132 ) ) ( not ( = ?auto_415127 ?auto_415133 ) ) ( not ( = ?auto_415127 ?auto_415134 ) ) ( not ( = ?auto_415127 ?auto_415135 ) ) ( not ( = ?auto_415128 ?auto_415129 ) ) ( not ( = ?auto_415128 ?auto_415130 ) ) ( not ( = ?auto_415128 ?auto_415131 ) ) ( not ( = ?auto_415128 ?auto_415132 ) ) ( not ( = ?auto_415128 ?auto_415133 ) ) ( not ( = ?auto_415128 ?auto_415134 ) ) ( not ( = ?auto_415128 ?auto_415135 ) ) ( not ( = ?auto_415129 ?auto_415130 ) ) ( not ( = ?auto_415129 ?auto_415131 ) ) ( not ( = ?auto_415129 ?auto_415132 ) ) ( not ( = ?auto_415129 ?auto_415133 ) ) ( not ( = ?auto_415129 ?auto_415134 ) ) ( not ( = ?auto_415129 ?auto_415135 ) ) ( not ( = ?auto_415130 ?auto_415131 ) ) ( not ( = ?auto_415130 ?auto_415132 ) ) ( not ( = ?auto_415130 ?auto_415133 ) ) ( not ( = ?auto_415130 ?auto_415134 ) ) ( not ( = ?auto_415130 ?auto_415135 ) ) ( not ( = ?auto_415131 ?auto_415132 ) ) ( not ( = ?auto_415131 ?auto_415133 ) ) ( not ( = ?auto_415131 ?auto_415134 ) ) ( not ( = ?auto_415131 ?auto_415135 ) ) ( not ( = ?auto_415132 ?auto_415133 ) ) ( not ( = ?auto_415132 ?auto_415134 ) ) ( not ( = ?auto_415132 ?auto_415135 ) ) ( not ( = ?auto_415133 ?auto_415134 ) ) ( not ( = ?auto_415133 ?auto_415135 ) ) ( not ( = ?auto_415134 ?auto_415135 ) ) ( ON ?auto_415133 ?auto_415134 ) ( ON ?auto_415132 ?auto_415133 ) ( CLEAR ?auto_415130 ) ( ON ?auto_415131 ?auto_415132 ) ( CLEAR ?auto_415131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_415123 ?auto_415124 ?auto_415125 ?auto_415126 ?auto_415127 ?auto_415128 ?auto_415129 ?auto_415130 ?auto_415131 )
      ( MAKE-12PILE ?auto_415123 ?auto_415124 ?auto_415125 ?auto_415126 ?auto_415127 ?auto_415128 ?auto_415129 ?auto_415130 ?auto_415131 ?auto_415132 ?auto_415133 ?auto_415134 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415148 - BLOCK
      ?auto_415149 - BLOCK
      ?auto_415150 - BLOCK
      ?auto_415151 - BLOCK
      ?auto_415152 - BLOCK
      ?auto_415153 - BLOCK
      ?auto_415154 - BLOCK
      ?auto_415155 - BLOCK
      ?auto_415156 - BLOCK
      ?auto_415157 - BLOCK
      ?auto_415158 - BLOCK
      ?auto_415159 - BLOCK
    )
    :vars
    (
      ?auto_415160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415159 ?auto_415160 ) ( ON-TABLE ?auto_415148 ) ( ON ?auto_415149 ?auto_415148 ) ( ON ?auto_415150 ?auto_415149 ) ( ON ?auto_415151 ?auto_415150 ) ( ON ?auto_415152 ?auto_415151 ) ( ON ?auto_415153 ?auto_415152 ) ( ON ?auto_415154 ?auto_415153 ) ( not ( = ?auto_415148 ?auto_415149 ) ) ( not ( = ?auto_415148 ?auto_415150 ) ) ( not ( = ?auto_415148 ?auto_415151 ) ) ( not ( = ?auto_415148 ?auto_415152 ) ) ( not ( = ?auto_415148 ?auto_415153 ) ) ( not ( = ?auto_415148 ?auto_415154 ) ) ( not ( = ?auto_415148 ?auto_415155 ) ) ( not ( = ?auto_415148 ?auto_415156 ) ) ( not ( = ?auto_415148 ?auto_415157 ) ) ( not ( = ?auto_415148 ?auto_415158 ) ) ( not ( = ?auto_415148 ?auto_415159 ) ) ( not ( = ?auto_415148 ?auto_415160 ) ) ( not ( = ?auto_415149 ?auto_415150 ) ) ( not ( = ?auto_415149 ?auto_415151 ) ) ( not ( = ?auto_415149 ?auto_415152 ) ) ( not ( = ?auto_415149 ?auto_415153 ) ) ( not ( = ?auto_415149 ?auto_415154 ) ) ( not ( = ?auto_415149 ?auto_415155 ) ) ( not ( = ?auto_415149 ?auto_415156 ) ) ( not ( = ?auto_415149 ?auto_415157 ) ) ( not ( = ?auto_415149 ?auto_415158 ) ) ( not ( = ?auto_415149 ?auto_415159 ) ) ( not ( = ?auto_415149 ?auto_415160 ) ) ( not ( = ?auto_415150 ?auto_415151 ) ) ( not ( = ?auto_415150 ?auto_415152 ) ) ( not ( = ?auto_415150 ?auto_415153 ) ) ( not ( = ?auto_415150 ?auto_415154 ) ) ( not ( = ?auto_415150 ?auto_415155 ) ) ( not ( = ?auto_415150 ?auto_415156 ) ) ( not ( = ?auto_415150 ?auto_415157 ) ) ( not ( = ?auto_415150 ?auto_415158 ) ) ( not ( = ?auto_415150 ?auto_415159 ) ) ( not ( = ?auto_415150 ?auto_415160 ) ) ( not ( = ?auto_415151 ?auto_415152 ) ) ( not ( = ?auto_415151 ?auto_415153 ) ) ( not ( = ?auto_415151 ?auto_415154 ) ) ( not ( = ?auto_415151 ?auto_415155 ) ) ( not ( = ?auto_415151 ?auto_415156 ) ) ( not ( = ?auto_415151 ?auto_415157 ) ) ( not ( = ?auto_415151 ?auto_415158 ) ) ( not ( = ?auto_415151 ?auto_415159 ) ) ( not ( = ?auto_415151 ?auto_415160 ) ) ( not ( = ?auto_415152 ?auto_415153 ) ) ( not ( = ?auto_415152 ?auto_415154 ) ) ( not ( = ?auto_415152 ?auto_415155 ) ) ( not ( = ?auto_415152 ?auto_415156 ) ) ( not ( = ?auto_415152 ?auto_415157 ) ) ( not ( = ?auto_415152 ?auto_415158 ) ) ( not ( = ?auto_415152 ?auto_415159 ) ) ( not ( = ?auto_415152 ?auto_415160 ) ) ( not ( = ?auto_415153 ?auto_415154 ) ) ( not ( = ?auto_415153 ?auto_415155 ) ) ( not ( = ?auto_415153 ?auto_415156 ) ) ( not ( = ?auto_415153 ?auto_415157 ) ) ( not ( = ?auto_415153 ?auto_415158 ) ) ( not ( = ?auto_415153 ?auto_415159 ) ) ( not ( = ?auto_415153 ?auto_415160 ) ) ( not ( = ?auto_415154 ?auto_415155 ) ) ( not ( = ?auto_415154 ?auto_415156 ) ) ( not ( = ?auto_415154 ?auto_415157 ) ) ( not ( = ?auto_415154 ?auto_415158 ) ) ( not ( = ?auto_415154 ?auto_415159 ) ) ( not ( = ?auto_415154 ?auto_415160 ) ) ( not ( = ?auto_415155 ?auto_415156 ) ) ( not ( = ?auto_415155 ?auto_415157 ) ) ( not ( = ?auto_415155 ?auto_415158 ) ) ( not ( = ?auto_415155 ?auto_415159 ) ) ( not ( = ?auto_415155 ?auto_415160 ) ) ( not ( = ?auto_415156 ?auto_415157 ) ) ( not ( = ?auto_415156 ?auto_415158 ) ) ( not ( = ?auto_415156 ?auto_415159 ) ) ( not ( = ?auto_415156 ?auto_415160 ) ) ( not ( = ?auto_415157 ?auto_415158 ) ) ( not ( = ?auto_415157 ?auto_415159 ) ) ( not ( = ?auto_415157 ?auto_415160 ) ) ( not ( = ?auto_415158 ?auto_415159 ) ) ( not ( = ?auto_415158 ?auto_415160 ) ) ( not ( = ?auto_415159 ?auto_415160 ) ) ( ON ?auto_415158 ?auto_415159 ) ( ON ?auto_415157 ?auto_415158 ) ( ON ?auto_415156 ?auto_415157 ) ( CLEAR ?auto_415154 ) ( ON ?auto_415155 ?auto_415156 ) ( CLEAR ?auto_415155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_415148 ?auto_415149 ?auto_415150 ?auto_415151 ?auto_415152 ?auto_415153 ?auto_415154 ?auto_415155 )
      ( MAKE-12PILE ?auto_415148 ?auto_415149 ?auto_415150 ?auto_415151 ?auto_415152 ?auto_415153 ?auto_415154 ?auto_415155 ?auto_415156 ?auto_415157 ?auto_415158 ?auto_415159 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415173 - BLOCK
      ?auto_415174 - BLOCK
      ?auto_415175 - BLOCK
      ?auto_415176 - BLOCK
      ?auto_415177 - BLOCK
      ?auto_415178 - BLOCK
      ?auto_415179 - BLOCK
      ?auto_415180 - BLOCK
      ?auto_415181 - BLOCK
      ?auto_415182 - BLOCK
      ?auto_415183 - BLOCK
      ?auto_415184 - BLOCK
    )
    :vars
    (
      ?auto_415185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415184 ?auto_415185 ) ( ON-TABLE ?auto_415173 ) ( ON ?auto_415174 ?auto_415173 ) ( ON ?auto_415175 ?auto_415174 ) ( ON ?auto_415176 ?auto_415175 ) ( ON ?auto_415177 ?auto_415176 ) ( ON ?auto_415178 ?auto_415177 ) ( ON ?auto_415179 ?auto_415178 ) ( not ( = ?auto_415173 ?auto_415174 ) ) ( not ( = ?auto_415173 ?auto_415175 ) ) ( not ( = ?auto_415173 ?auto_415176 ) ) ( not ( = ?auto_415173 ?auto_415177 ) ) ( not ( = ?auto_415173 ?auto_415178 ) ) ( not ( = ?auto_415173 ?auto_415179 ) ) ( not ( = ?auto_415173 ?auto_415180 ) ) ( not ( = ?auto_415173 ?auto_415181 ) ) ( not ( = ?auto_415173 ?auto_415182 ) ) ( not ( = ?auto_415173 ?auto_415183 ) ) ( not ( = ?auto_415173 ?auto_415184 ) ) ( not ( = ?auto_415173 ?auto_415185 ) ) ( not ( = ?auto_415174 ?auto_415175 ) ) ( not ( = ?auto_415174 ?auto_415176 ) ) ( not ( = ?auto_415174 ?auto_415177 ) ) ( not ( = ?auto_415174 ?auto_415178 ) ) ( not ( = ?auto_415174 ?auto_415179 ) ) ( not ( = ?auto_415174 ?auto_415180 ) ) ( not ( = ?auto_415174 ?auto_415181 ) ) ( not ( = ?auto_415174 ?auto_415182 ) ) ( not ( = ?auto_415174 ?auto_415183 ) ) ( not ( = ?auto_415174 ?auto_415184 ) ) ( not ( = ?auto_415174 ?auto_415185 ) ) ( not ( = ?auto_415175 ?auto_415176 ) ) ( not ( = ?auto_415175 ?auto_415177 ) ) ( not ( = ?auto_415175 ?auto_415178 ) ) ( not ( = ?auto_415175 ?auto_415179 ) ) ( not ( = ?auto_415175 ?auto_415180 ) ) ( not ( = ?auto_415175 ?auto_415181 ) ) ( not ( = ?auto_415175 ?auto_415182 ) ) ( not ( = ?auto_415175 ?auto_415183 ) ) ( not ( = ?auto_415175 ?auto_415184 ) ) ( not ( = ?auto_415175 ?auto_415185 ) ) ( not ( = ?auto_415176 ?auto_415177 ) ) ( not ( = ?auto_415176 ?auto_415178 ) ) ( not ( = ?auto_415176 ?auto_415179 ) ) ( not ( = ?auto_415176 ?auto_415180 ) ) ( not ( = ?auto_415176 ?auto_415181 ) ) ( not ( = ?auto_415176 ?auto_415182 ) ) ( not ( = ?auto_415176 ?auto_415183 ) ) ( not ( = ?auto_415176 ?auto_415184 ) ) ( not ( = ?auto_415176 ?auto_415185 ) ) ( not ( = ?auto_415177 ?auto_415178 ) ) ( not ( = ?auto_415177 ?auto_415179 ) ) ( not ( = ?auto_415177 ?auto_415180 ) ) ( not ( = ?auto_415177 ?auto_415181 ) ) ( not ( = ?auto_415177 ?auto_415182 ) ) ( not ( = ?auto_415177 ?auto_415183 ) ) ( not ( = ?auto_415177 ?auto_415184 ) ) ( not ( = ?auto_415177 ?auto_415185 ) ) ( not ( = ?auto_415178 ?auto_415179 ) ) ( not ( = ?auto_415178 ?auto_415180 ) ) ( not ( = ?auto_415178 ?auto_415181 ) ) ( not ( = ?auto_415178 ?auto_415182 ) ) ( not ( = ?auto_415178 ?auto_415183 ) ) ( not ( = ?auto_415178 ?auto_415184 ) ) ( not ( = ?auto_415178 ?auto_415185 ) ) ( not ( = ?auto_415179 ?auto_415180 ) ) ( not ( = ?auto_415179 ?auto_415181 ) ) ( not ( = ?auto_415179 ?auto_415182 ) ) ( not ( = ?auto_415179 ?auto_415183 ) ) ( not ( = ?auto_415179 ?auto_415184 ) ) ( not ( = ?auto_415179 ?auto_415185 ) ) ( not ( = ?auto_415180 ?auto_415181 ) ) ( not ( = ?auto_415180 ?auto_415182 ) ) ( not ( = ?auto_415180 ?auto_415183 ) ) ( not ( = ?auto_415180 ?auto_415184 ) ) ( not ( = ?auto_415180 ?auto_415185 ) ) ( not ( = ?auto_415181 ?auto_415182 ) ) ( not ( = ?auto_415181 ?auto_415183 ) ) ( not ( = ?auto_415181 ?auto_415184 ) ) ( not ( = ?auto_415181 ?auto_415185 ) ) ( not ( = ?auto_415182 ?auto_415183 ) ) ( not ( = ?auto_415182 ?auto_415184 ) ) ( not ( = ?auto_415182 ?auto_415185 ) ) ( not ( = ?auto_415183 ?auto_415184 ) ) ( not ( = ?auto_415183 ?auto_415185 ) ) ( not ( = ?auto_415184 ?auto_415185 ) ) ( ON ?auto_415183 ?auto_415184 ) ( ON ?auto_415182 ?auto_415183 ) ( ON ?auto_415181 ?auto_415182 ) ( CLEAR ?auto_415179 ) ( ON ?auto_415180 ?auto_415181 ) ( CLEAR ?auto_415180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_415173 ?auto_415174 ?auto_415175 ?auto_415176 ?auto_415177 ?auto_415178 ?auto_415179 ?auto_415180 )
      ( MAKE-12PILE ?auto_415173 ?auto_415174 ?auto_415175 ?auto_415176 ?auto_415177 ?auto_415178 ?auto_415179 ?auto_415180 ?auto_415181 ?auto_415182 ?auto_415183 ?auto_415184 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415198 - BLOCK
      ?auto_415199 - BLOCK
      ?auto_415200 - BLOCK
      ?auto_415201 - BLOCK
      ?auto_415202 - BLOCK
      ?auto_415203 - BLOCK
      ?auto_415204 - BLOCK
      ?auto_415205 - BLOCK
      ?auto_415206 - BLOCK
      ?auto_415207 - BLOCK
      ?auto_415208 - BLOCK
      ?auto_415209 - BLOCK
    )
    :vars
    (
      ?auto_415210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415209 ?auto_415210 ) ( ON-TABLE ?auto_415198 ) ( ON ?auto_415199 ?auto_415198 ) ( ON ?auto_415200 ?auto_415199 ) ( ON ?auto_415201 ?auto_415200 ) ( ON ?auto_415202 ?auto_415201 ) ( ON ?auto_415203 ?auto_415202 ) ( not ( = ?auto_415198 ?auto_415199 ) ) ( not ( = ?auto_415198 ?auto_415200 ) ) ( not ( = ?auto_415198 ?auto_415201 ) ) ( not ( = ?auto_415198 ?auto_415202 ) ) ( not ( = ?auto_415198 ?auto_415203 ) ) ( not ( = ?auto_415198 ?auto_415204 ) ) ( not ( = ?auto_415198 ?auto_415205 ) ) ( not ( = ?auto_415198 ?auto_415206 ) ) ( not ( = ?auto_415198 ?auto_415207 ) ) ( not ( = ?auto_415198 ?auto_415208 ) ) ( not ( = ?auto_415198 ?auto_415209 ) ) ( not ( = ?auto_415198 ?auto_415210 ) ) ( not ( = ?auto_415199 ?auto_415200 ) ) ( not ( = ?auto_415199 ?auto_415201 ) ) ( not ( = ?auto_415199 ?auto_415202 ) ) ( not ( = ?auto_415199 ?auto_415203 ) ) ( not ( = ?auto_415199 ?auto_415204 ) ) ( not ( = ?auto_415199 ?auto_415205 ) ) ( not ( = ?auto_415199 ?auto_415206 ) ) ( not ( = ?auto_415199 ?auto_415207 ) ) ( not ( = ?auto_415199 ?auto_415208 ) ) ( not ( = ?auto_415199 ?auto_415209 ) ) ( not ( = ?auto_415199 ?auto_415210 ) ) ( not ( = ?auto_415200 ?auto_415201 ) ) ( not ( = ?auto_415200 ?auto_415202 ) ) ( not ( = ?auto_415200 ?auto_415203 ) ) ( not ( = ?auto_415200 ?auto_415204 ) ) ( not ( = ?auto_415200 ?auto_415205 ) ) ( not ( = ?auto_415200 ?auto_415206 ) ) ( not ( = ?auto_415200 ?auto_415207 ) ) ( not ( = ?auto_415200 ?auto_415208 ) ) ( not ( = ?auto_415200 ?auto_415209 ) ) ( not ( = ?auto_415200 ?auto_415210 ) ) ( not ( = ?auto_415201 ?auto_415202 ) ) ( not ( = ?auto_415201 ?auto_415203 ) ) ( not ( = ?auto_415201 ?auto_415204 ) ) ( not ( = ?auto_415201 ?auto_415205 ) ) ( not ( = ?auto_415201 ?auto_415206 ) ) ( not ( = ?auto_415201 ?auto_415207 ) ) ( not ( = ?auto_415201 ?auto_415208 ) ) ( not ( = ?auto_415201 ?auto_415209 ) ) ( not ( = ?auto_415201 ?auto_415210 ) ) ( not ( = ?auto_415202 ?auto_415203 ) ) ( not ( = ?auto_415202 ?auto_415204 ) ) ( not ( = ?auto_415202 ?auto_415205 ) ) ( not ( = ?auto_415202 ?auto_415206 ) ) ( not ( = ?auto_415202 ?auto_415207 ) ) ( not ( = ?auto_415202 ?auto_415208 ) ) ( not ( = ?auto_415202 ?auto_415209 ) ) ( not ( = ?auto_415202 ?auto_415210 ) ) ( not ( = ?auto_415203 ?auto_415204 ) ) ( not ( = ?auto_415203 ?auto_415205 ) ) ( not ( = ?auto_415203 ?auto_415206 ) ) ( not ( = ?auto_415203 ?auto_415207 ) ) ( not ( = ?auto_415203 ?auto_415208 ) ) ( not ( = ?auto_415203 ?auto_415209 ) ) ( not ( = ?auto_415203 ?auto_415210 ) ) ( not ( = ?auto_415204 ?auto_415205 ) ) ( not ( = ?auto_415204 ?auto_415206 ) ) ( not ( = ?auto_415204 ?auto_415207 ) ) ( not ( = ?auto_415204 ?auto_415208 ) ) ( not ( = ?auto_415204 ?auto_415209 ) ) ( not ( = ?auto_415204 ?auto_415210 ) ) ( not ( = ?auto_415205 ?auto_415206 ) ) ( not ( = ?auto_415205 ?auto_415207 ) ) ( not ( = ?auto_415205 ?auto_415208 ) ) ( not ( = ?auto_415205 ?auto_415209 ) ) ( not ( = ?auto_415205 ?auto_415210 ) ) ( not ( = ?auto_415206 ?auto_415207 ) ) ( not ( = ?auto_415206 ?auto_415208 ) ) ( not ( = ?auto_415206 ?auto_415209 ) ) ( not ( = ?auto_415206 ?auto_415210 ) ) ( not ( = ?auto_415207 ?auto_415208 ) ) ( not ( = ?auto_415207 ?auto_415209 ) ) ( not ( = ?auto_415207 ?auto_415210 ) ) ( not ( = ?auto_415208 ?auto_415209 ) ) ( not ( = ?auto_415208 ?auto_415210 ) ) ( not ( = ?auto_415209 ?auto_415210 ) ) ( ON ?auto_415208 ?auto_415209 ) ( ON ?auto_415207 ?auto_415208 ) ( ON ?auto_415206 ?auto_415207 ) ( ON ?auto_415205 ?auto_415206 ) ( CLEAR ?auto_415203 ) ( ON ?auto_415204 ?auto_415205 ) ( CLEAR ?auto_415204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_415198 ?auto_415199 ?auto_415200 ?auto_415201 ?auto_415202 ?auto_415203 ?auto_415204 )
      ( MAKE-12PILE ?auto_415198 ?auto_415199 ?auto_415200 ?auto_415201 ?auto_415202 ?auto_415203 ?auto_415204 ?auto_415205 ?auto_415206 ?auto_415207 ?auto_415208 ?auto_415209 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415223 - BLOCK
      ?auto_415224 - BLOCK
      ?auto_415225 - BLOCK
      ?auto_415226 - BLOCK
      ?auto_415227 - BLOCK
      ?auto_415228 - BLOCK
      ?auto_415229 - BLOCK
      ?auto_415230 - BLOCK
      ?auto_415231 - BLOCK
      ?auto_415232 - BLOCK
      ?auto_415233 - BLOCK
      ?auto_415234 - BLOCK
    )
    :vars
    (
      ?auto_415235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415234 ?auto_415235 ) ( ON-TABLE ?auto_415223 ) ( ON ?auto_415224 ?auto_415223 ) ( ON ?auto_415225 ?auto_415224 ) ( ON ?auto_415226 ?auto_415225 ) ( ON ?auto_415227 ?auto_415226 ) ( ON ?auto_415228 ?auto_415227 ) ( not ( = ?auto_415223 ?auto_415224 ) ) ( not ( = ?auto_415223 ?auto_415225 ) ) ( not ( = ?auto_415223 ?auto_415226 ) ) ( not ( = ?auto_415223 ?auto_415227 ) ) ( not ( = ?auto_415223 ?auto_415228 ) ) ( not ( = ?auto_415223 ?auto_415229 ) ) ( not ( = ?auto_415223 ?auto_415230 ) ) ( not ( = ?auto_415223 ?auto_415231 ) ) ( not ( = ?auto_415223 ?auto_415232 ) ) ( not ( = ?auto_415223 ?auto_415233 ) ) ( not ( = ?auto_415223 ?auto_415234 ) ) ( not ( = ?auto_415223 ?auto_415235 ) ) ( not ( = ?auto_415224 ?auto_415225 ) ) ( not ( = ?auto_415224 ?auto_415226 ) ) ( not ( = ?auto_415224 ?auto_415227 ) ) ( not ( = ?auto_415224 ?auto_415228 ) ) ( not ( = ?auto_415224 ?auto_415229 ) ) ( not ( = ?auto_415224 ?auto_415230 ) ) ( not ( = ?auto_415224 ?auto_415231 ) ) ( not ( = ?auto_415224 ?auto_415232 ) ) ( not ( = ?auto_415224 ?auto_415233 ) ) ( not ( = ?auto_415224 ?auto_415234 ) ) ( not ( = ?auto_415224 ?auto_415235 ) ) ( not ( = ?auto_415225 ?auto_415226 ) ) ( not ( = ?auto_415225 ?auto_415227 ) ) ( not ( = ?auto_415225 ?auto_415228 ) ) ( not ( = ?auto_415225 ?auto_415229 ) ) ( not ( = ?auto_415225 ?auto_415230 ) ) ( not ( = ?auto_415225 ?auto_415231 ) ) ( not ( = ?auto_415225 ?auto_415232 ) ) ( not ( = ?auto_415225 ?auto_415233 ) ) ( not ( = ?auto_415225 ?auto_415234 ) ) ( not ( = ?auto_415225 ?auto_415235 ) ) ( not ( = ?auto_415226 ?auto_415227 ) ) ( not ( = ?auto_415226 ?auto_415228 ) ) ( not ( = ?auto_415226 ?auto_415229 ) ) ( not ( = ?auto_415226 ?auto_415230 ) ) ( not ( = ?auto_415226 ?auto_415231 ) ) ( not ( = ?auto_415226 ?auto_415232 ) ) ( not ( = ?auto_415226 ?auto_415233 ) ) ( not ( = ?auto_415226 ?auto_415234 ) ) ( not ( = ?auto_415226 ?auto_415235 ) ) ( not ( = ?auto_415227 ?auto_415228 ) ) ( not ( = ?auto_415227 ?auto_415229 ) ) ( not ( = ?auto_415227 ?auto_415230 ) ) ( not ( = ?auto_415227 ?auto_415231 ) ) ( not ( = ?auto_415227 ?auto_415232 ) ) ( not ( = ?auto_415227 ?auto_415233 ) ) ( not ( = ?auto_415227 ?auto_415234 ) ) ( not ( = ?auto_415227 ?auto_415235 ) ) ( not ( = ?auto_415228 ?auto_415229 ) ) ( not ( = ?auto_415228 ?auto_415230 ) ) ( not ( = ?auto_415228 ?auto_415231 ) ) ( not ( = ?auto_415228 ?auto_415232 ) ) ( not ( = ?auto_415228 ?auto_415233 ) ) ( not ( = ?auto_415228 ?auto_415234 ) ) ( not ( = ?auto_415228 ?auto_415235 ) ) ( not ( = ?auto_415229 ?auto_415230 ) ) ( not ( = ?auto_415229 ?auto_415231 ) ) ( not ( = ?auto_415229 ?auto_415232 ) ) ( not ( = ?auto_415229 ?auto_415233 ) ) ( not ( = ?auto_415229 ?auto_415234 ) ) ( not ( = ?auto_415229 ?auto_415235 ) ) ( not ( = ?auto_415230 ?auto_415231 ) ) ( not ( = ?auto_415230 ?auto_415232 ) ) ( not ( = ?auto_415230 ?auto_415233 ) ) ( not ( = ?auto_415230 ?auto_415234 ) ) ( not ( = ?auto_415230 ?auto_415235 ) ) ( not ( = ?auto_415231 ?auto_415232 ) ) ( not ( = ?auto_415231 ?auto_415233 ) ) ( not ( = ?auto_415231 ?auto_415234 ) ) ( not ( = ?auto_415231 ?auto_415235 ) ) ( not ( = ?auto_415232 ?auto_415233 ) ) ( not ( = ?auto_415232 ?auto_415234 ) ) ( not ( = ?auto_415232 ?auto_415235 ) ) ( not ( = ?auto_415233 ?auto_415234 ) ) ( not ( = ?auto_415233 ?auto_415235 ) ) ( not ( = ?auto_415234 ?auto_415235 ) ) ( ON ?auto_415233 ?auto_415234 ) ( ON ?auto_415232 ?auto_415233 ) ( ON ?auto_415231 ?auto_415232 ) ( ON ?auto_415230 ?auto_415231 ) ( CLEAR ?auto_415228 ) ( ON ?auto_415229 ?auto_415230 ) ( CLEAR ?auto_415229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_415223 ?auto_415224 ?auto_415225 ?auto_415226 ?auto_415227 ?auto_415228 ?auto_415229 )
      ( MAKE-12PILE ?auto_415223 ?auto_415224 ?auto_415225 ?auto_415226 ?auto_415227 ?auto_415228 ?auto_415229 ?auto_415230 ?auto_415231 ?auto_415232 ?auto_415233 ?auto_415234 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415248 - BLOCK
      ?auto_415249 - BLOCK
      ?auto_415250 - BLOCK
      ?auto_415251 - BLOCK
      ?auto_415252 - BLOCK
      ?auto_415253 - BLOCK
      ?auto_415254 - BLOCK
      ?auto_415255 - BLOCK
      ?auto_415256 - BLOCK
      ?auto_415257 - BLOCK
      ?auto_415258 - BLOCK
      ?auto_415259 - BLOCK
    )
    :vars
    (
      ?auto_415260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415259 ?auto_415260 ) ( ON-TABLE ?auto_415248 ) ( ON ?auto_415249 ?auto_415248 ) ( ON ?auto_415250 ?auto_415249 ) ( ON ?auto_415251 ?auto_415250 ) ( ON ?auto_415252 ?auto_415251 ) ( not ( = ?auto_415248 ?auto_415249 ) ) ( not ( = ?auto_415248 ?auto_415250 ) ) ( not ( = ?auto_415248 ?auto_415251 ) ) ( not ( = ?auto_415248 ?auto_415252 ) ) ( not ( = ?auto_415248 ?auto_415253 ) ) ( not ( = ?auto_415248 ?auto_415254 ) ) ( not ( = ?auto_415248 ?auto_415255 ) ) ( not ( = ?auto_415248 ?auto_415256 ) ) ( not ( = ?auto_415248 ?auto_415257 ) ) ( not ( = ?auto_415248 ?auto_415258 ) ) ( not ( = ?auto_415248 ?auto_415259 ) ) ( not ( = ?auto_415248 ?auto_415260 ) ) ( not ( = ?auto_415249 ?auto_415250 ) ) ( not ( = ?auto_415249 ?auto_415251 ) ) ( not ( = ?auto_415249 ?auto_415252 ) ) ( not ( = ?auto_415249 ?auto_415253 ) ) ( not ( = ?auto_415249 ?auto_415254 ) ) ( not ( = ?auto_415249 ?auto_415255 ) ) ( not ( = ?auto_415249 ?auto_415256 ) ) ( not ( = ?auto_415249 ?auto_415257 ) ) ( not ( = ?auto_415249 ?auto_415258 ) ) ( not ( = ?auto_415249 ?auto_415259 ) ) ( not ( = ?auto_415249 ?auto_415260 ) ) ( not ( = ?auto_415250 ?auto_415251 ) ) ( not ( = ?auto_415250 ?auto_415252 ) ) ( not ( = ?auto_415250 ?auto_415253 ) ) ( not ( = ?auto_415250 ?auto_415254 ) ) ( not ( = ?auto_415250 ?auto_415255 ) ) ( not ( = ?auto_415250 ?auto_415256 ) ) ( not ( = ?auto_415250 ?auto_415257 ) ) ( not ( = ?auto_415250 ?auto_415258 ) ) ( not ( = ?auto_415250 ?auto_415259 ) ) ( not ( = ?auto_415250 ?auto_415260 ) ) ( not ( = ?auto_415251 ?auto_415252 ) ) ( not ( = ?auto_415251 ?auto_415253 ) ) ( not ( = ?auto_415251 ?auto_415254 ) ) ( not ( = ?auto_415251 ?auto_415255 ) ) ( not ( = ?auto_415251 ?auto_415256 ) ) ( not ( = ?auto_415251 ?auto_415257 ) ) ( not ( = ?auto_415251 ?auto_415258 ) ) ( not ( = ?auto_415251 ?auto_415259 ) ) ( not ( = ?auto_415251 ?auto_415260 ) ) ( not ( = ?auto_415252 ?auto_415253 ) ) ( not ( = ?auto_415252 ?auto_415254 ) ) ( not ( = ?auto_415252 ?auto_415255 ) ) ( not ( = ?auto_415252 ?auto_415256 ) ) ( not ( = ?auto_415252 ?auto_415257 ) ) ( not ( = ?auto_415252 ?auto_415258 ) ) ( not ( = ?auto_415252 ?auto_415259 ) ) ( not ( = ?auto_415252 ?auto_415260 ) ) ( not ( = ?auto_415253 ?auto_415254 ) ) ( not ( = ?auto_415253 ?auto_415255 ) ) ( not ( = ?auto_415253 ?auto_415256 ) ) ( not ( = ?auto_415253 ?auto_415257 ) ) ( not ( = ?auto_415253 ?auto_415258 ) ) ( not ( = ?auto_415253 ?auto_415259 ) ) ( not ( = ?auto_415253 ?auto_415260 ) ) ( not ( = ?auto_415254 ?auto_415255 ) ) ( not ( = ?auto_415254 ?auto_415256 ) ) ( not ( = ?auto_415254 ?auto_415257 ) ) ( not ( = ?auto_415254 ?auto_415258 ) ) ( not ( = ?auto_415254 ?auto_415259 ) ) ( not ( = ?auto_415254 ?auto_415260 ) ) ( not ( = ?auto_415255 ?auto_415256 ) ) ( not ( = ?auto_415255 ?auto_415257 ) ) ( not ( = ?auto_415255 ?auto_415258 ) ) ( not ( = ?auto_415255 ?auto_415259 ) ) ( not ( = ?auto_415255 ?auto_415260 ) ) ( not ( = ?auto_415256 ?auto_415257 ) ) ( not ( = ?auto_415256 ?auto_415258 ) ) ( not ( = ?auto_415256 ?auto_415259 ) ) ( not ( = ?auto_415256 ?auto_415260 ) ) ( not ( = ?auto_415257 ?auto_415258 ) ) ( not ( = ?auto_415257 ?auto_415259 ) ) ( not ( = ?auto_415257 ?auto_415260 ) ) ( not ( = ?auto_415258 ?auto_415259 ) ) ( not ( = ?auto_415258 ?auto_415260 ) ) ( not ( = ?auto_415259 ?auto_415260 ) ) ( ON ?auto_415258 ?auto_415259 ) ( ON ?auto_415257 ?auto_415258 ) ( ON ?auto_415256 ?auto_415257 ) ( ON ?auto_415255 ?auto_415256 ) ( ON ?auto_415254 ?auto_415255 ) ( CLEAR ?auto_415252 ) ( ON ?auto_415253 ?auto_415254 ) ( CLEAR ?auto_415253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_415248 ?auto_415249 ?auto_415250 ?auto_415251 ?auto_415252 ?auto_415253 )
      ( MAKE-12PILE ?auto_415248 ?auto_415249 ?auto_415250 ?auto_415251 ?auto_415252 ?auto_415253 ?auto_415254 ?auto_415255 ?auto_415256 ?auto_415257 ?auto_415258 ?auto_415259 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415273 - BLOCK
      ?auto_415274 - BLOCK
      ?auto_415275 - BLOCK
      ?auto_415276 - BLOCK
      ?auto_415277 - BLOCK
      ?auto_415278 - BLOCK
      ?auto_415279 - BLOCK
      ?auto_415280 - BLOCK
      ?auto_415281 - BLOCK
      ?auto_415282 - BLOCK
      ?auto_415283 - BLOCK
      ?auto_415284 - BLOCK
    )
    :vars
    (
      ?auto_415285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415284 ?auto_415285 ) ( ON-TABLE ?auto_415273 ) ( ON ?auto_415274 ?auto_415273 ) ( ON ?auto_415275 ?auto_415274 ) ( ON ?auto_415276 ?auto_415275 ) ( ON ?auto_415277 ?auto_415276 ) ( not ( = ?auto_415273 ?auto_415274 ) ) ( not ( = ?auto_415273 ?auto_415275 ) ) ( not ( = ?auto_415273 ?auto_415276 ) ) ( not ( = ?auto_415273 ?auto_415277 ) ) ( not ( = ?auto_415273 ?auto_415278 ) ) ( not ( = ?auto_415273 ?auto_415279 ) ) ( not ( = ?auto_415273 ?auto_415280 ) ) ( not ( = ?auto_415273 ?auto_415281 ) ) ( not ( = ?auto_415273 ?auto_415282 ) ) ( not ( = ?auto_415273 ?auto_415283 ) ) ( not ( = ?auto_415273 ?auto_415284 ) ) ( not ( = ?auto_415273 ?auto_415285 ) ) ( not ( = ?auto_415274 ?auto_415275 ) ) ( not ( = ?auto_415274 ?auto_415276 ) ) ( not ( = ?auto_415274 ?auto_415277 ) ) ( not ( = ?auto_415274 ?auto_415278 ) ) ( not ( = ?auto_415274 ?auto_415279 ) ) ( not ( = ?auto_415274 ?auto_415280 ) ) ( not ( = ?auto_415274 ?auto_415281 ) ) ( not ( = ?auto_415274 ?auto_415282 ) ) ( not ( = ?auto_415274 ?auto_415283 ) ) ( not ( = ?auto_415274 ?auto_415284 ) ) ( not ( = ?auto_415274 ?auto_415285 ) ) ( not ( = ?auto_415275 ?auto_415276 ) ) ( not ( = ?auto_415275 ?auto_415277 ) ) ( not ( = ?auto_415275 ?auto_415278 ) ) ( not ( = ?auto_415275 ?auto_415279 ) ) ( not ( = ?auto_415275 ?auto_415280 ) ) ( not ( = ?auto_415275 ?auto_415281 ) ) ( not ( = ?auto_415275 ?auto_415282 ) ) ( not ( = ?auto_415275 ?auto_415283 ) ) ( not ( = ?auto_415275 ?auto_415284 ) ) ( not ( = ?auto_415275 ?auto_415285 ) ) ( not ( = ?auto_415276 ?auto_415277 ) ) ( not ( = ?auto_415276 ?auto_415278 ) ) ( not ( = ?auto_415276 ?auto_415279 ) ) ( not ( = ?auto_415276 ?auto_415280 ) ) ( not ( = ?auto_415276 ?auto_415281 ) ) ( not ( = ?auto_415276 ?auto_415282 ) ) ( not ( = ?auto_415276 ?auto_415283 ) ) ( not ( = ?auto_415276 ?auto_415284 ) ) ( not ( = ?auto_415276 ?auto_415285 ) ) ( not ( = ?auto_415277 ?auto_415278 ) ) ( not ( = ?auto_415277 ?auto_415279 ) ) ( not ( = ?auto_415277 ?auto_415280 ) ) ( not ( = ?auto_415277 ?auto_415281 ) ) ( not ( = ?auto_415277 ?auto_415282 ) ) ( not ( = ?auto_415277 ?auto_415283 ) ) ( not ( = ?auto_415277 ?auto_415284 ) ) ( not ( = ?auto_415277 ?auto_415285 ) ) ( not ( = ?auto_415278 ?auto_415279 ) ) ( not ( = ?auto_415278 ?auto_415280 ) ) ( not ( = ?auto_415278 ?auto_415281 ) ) ( not ( = ?auto_415278 ?auto_415282 ) ) ( not ( = ?auto_415278 ?auto_415283 ) ) ( not ( = ?auto_415278 ?auto_415284 ) ) ( not ( = ?auto_415278 ?auto_415285 ) ) ( not ( = ?auto_415279 ?auto_415280 ) ) ( not ( = ?auto_415279 ?auto_415281 ) ) ( not ( = ?auto_415279 ?auto_415282 ) ) ( not ( = ?auto_415279 ?auto_415283 ) ) ( not ( = ?auto_415279 ?auto_415284 ) ) ( not ( = ?auto_415279 ?auto_415285 ) ) ( not ( = ?auto_415280 ?auto_415281 ) ) ( not ( = ?auto_415280 ?auto_415282 ) ) ( not ( = ?auto_415280 ?auto_415283 ) ) ( not ( = ?auto_415280 ?auto_415284 ) ) ( not ( = ?auto_415280 ?auto_415285 ) ) ( not ( = ?auto_415281 ?auto_415282 ) ) ( not ( = ?auto_415281 ?auto_415283 ) ) ( not ( = ?auto_415281 ?auto_415284 ) ) ( not ( = ?auto_415281 ?auto_415285 ) ) ( not ( = ?auto_415282 ?auto_415283 ) ) ( not ( = ?auto_415282 ?auto_415284 ) ) ( not ( = ?auto_415282 ?auto_415285 ) ) ( not ( = ?auto_415283 ?auto_415284 ) ) ( not ( = ?auto_415283 ?auto_415285 ) ) ( not ( = ?auto_415284 ?auto_415285 ) ) ( ON ?auto_415283 ?auto_415284 ) ( ON ?auto_415282 ?auto_415283 ) ( ON ?auto_415281 ?auto_415282 ) ( ON ?auto_415280 ?auto_415281 ) ( ON ?auto_415279 ?auto_415280 ) ( CLEAR ?auto_415277 ) ( ON ?auto_415278 ?auto_415279 ) ( CLEAR ?auto_415278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_415273 ?auto_415274 ?auto_415275 ?auto_415276 ?auto_415277 ?auto_415278 )
      ( MAKE-12PILE ?auto_415273 ?auto_415274 ?auto_415275 ?auto_415276 ?auto_415277 ?auto_415278 ?auto_415279 ?auto_415280 ?auto_415281 ?auto_415282 ?auto_415283 ?auto_415284 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415298 - BLOCK
      ?auto_415299 - BLOCK
      ?auto_415300 - BLOCK
      ?auto_415301 - BLOCK
      ?auto_415302 - BLOCK
      ?auto_415303 - BLOCK
      ?auto_415304 - BLOCK
      ?auto_415305 - BLOCK
      ?auto_415306 - BLOCK
      ?auto_415307 - BLOCK
      ?auto_415308 - BLOCK
      ?auto_415309 - BLOCK
    )
    :vars
    (
      ?auto_415310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415309 ?auto_415310 ) ( ON-TABLE ?auto_415298 ) ( ON ?auto_415299 ?auto_415298 ) ( ON ?auto_415300 ?auto_415299 ) ( ON ?auto_415301 ?auto_415300 ) ( not ( = ?auto_415298 ?auto_415299 ) ) ( not ( = ?auto_415298 ?auto_415300 ) ) ( not ( = ?auto_415298 ?auto_415301 ) ) ( not ( = ?auto_415298 ?auto_415302 ) ) ( not ( = ?auto_415298 ?auto_415303 ) ) ( not ( = ?auto_415298 ?auto_415304 ) ) ( not ( = ?auto_415298 ?auto_415305 ) ) ( not ( = ?auto_415298 ?auto_415306 ) ) ( not ( = ?auto_415298 ?auto_415307 ) ) ( not ( = ?auto_415298 ?auto_415308 ) ) ( not ( = ?auto_415298 ?auto_415309 ) ) ( not ( = ?auto_415298 ?auto_415310 ) ) ( not ( = ?auto_415299 ?auto_415300 ) ) ( not ( = ?auto_415299 ?auto_415301 ) ) ( not ( = ?auto_415299 ?auto_415302 ) ) ( not ( = ?auto_415299 ?auto_415303 ) ) ( not ( = ?auto_415299 ?auto_415304 ) ) ( not ( = ?auto_415299 ?auto_415305 ) ) ( not ( = ?auto_415299 ?auto_415306 ) ) ( not ( = ?auto_415299 ?auto_415307 ) ) ( not ( = ?auto_415299 ?auto_415308 ) ) ( not ( = ?auto_415299 ?auto_415309 ) ) ( not ( = ?auto_415299 ?auto_415310 ) ) ( not ( = ?auto_415300 ?auto_415301 ) ) ( not ( = ?auto_415300 ?auto_415302 ) ) ( not ( = ?auto_415300 ?auto_415303 ) ) ( not ( = ?auto_415300 ?auto_415304 ) ) ( not ( = ?auto_415300 ?auto_415305 ) ) ( not ( = ?auto_415300 ?auto_415306 ) ) ( not ( = ?auto_415300 ?auto_415307 ) ) ( not ( = ?auto_415300 ?auto_415308 ) ) ( not ( = ?auto_415300 ?auto_415309 ) ) ( not ( = ?auto_415300 ?auto_415310 ) ) ( not ( = ?auto_415301 ?auto_415302 ) ) ( not ( = ?auto_415301 ?auto_415303 ) ) ( not ( = ?auto_415301 ?auto_415304 ) ) ( not ( = ?auto_415301 ?auto_415305 ) ) ( not ( = ?auto_415301 ?auto_415306 ) ) ( not ( = ?auto_415301 ?auto_415307 ) ) ( not ( = ?auto_415301 ?auto_415308 ) ) ( not ( = ?auto_415301 ?auto_415309 ) ) ( not ( = ?auto_415301 ?auto_415310 ) ) ( not ( = ?auto_415302 ?auto_415303 ) ) ( not ( = ?auto_415302 ?auto_415304 ) ) ( not ( = ?auto_415302 ?auto_415305 ) ) ( not ( = ?auto_415302 ?auto_415306 ) ) ( not ( = ?auto_415302 ?auto_415307 ) ) ( not ( = ?auto_415302 ?auto_415308 ) ) ( not ( = ?auto_415302 ?auto_415309 ) ) ( not ( = ?auto_415302 ?auto_415310 ) ) ( not ( = ?auto_415303 ?auto_415304 ) ) ( not ( = ?auto_415303 ?auto_415305 ) ) ( not ( = ?auto_415303 ?auto_415306 ) ) ( not ( = ?auto_415303 ?auto_415307 ) ) ( not ( = ?auto_415303 ?auto_415308 ) ) ( not ( = ?auto_415303 ?auto_415309 ) ) ( not ( = ?auto_415303 ?auto_415310 ) ) ( not ( = ?auto_415304 ?auto_415305 ) ) ( not ( = ?auto_415304 ?auto_415306 ) ) ( not ( = ?auto_415304 ?auto_415307 ) ) ( not ( = ?auto_415304 ?auto_415308 ) ) ( not ( = ?auto_415304 ?auto_415309 ) ) ( not ( = ?auto_415304 ?auto_415310 ) ) ( not ( = ?auto_415305 ?auto_415306 ) ) ( not ( = ?auto_415305 ?auto_415307 ) ) ( not ( = ?auto_415305 ?auto_415308 ) ) ( not ( = ?auto_415305 ?auto_415309 ) ) ( not ( = ?auto_415305 ?auto_415310 ) ) ( not ( = ?auto_415306 ?auto_415307 ) ) ( not ( = ?auto_415306 ?auto_415308 ) ) ( not ( = ?auto_415306 ?auto_415309 ) ) ( not ( = ?auto_415306 ?auto_415310 ) ) ( not ( = ?auto_415307 ?auto_415308 ) ) ( not ( = ?auto_415307 ?auto_415309 ) ) ( not ( = ?auto_415307 ?auto_415310 ) ) ( not ( = ?auto_415308 ?auto_415309 ) ) ( not ( = ?auto_415308 ?auto_415310 ) ) ( not ( = ?auto_415309 ?auto_415310 ) ) ( ON ?auto_415308 ?auto_415309 ) ( ON ?auto_415307 ?auto_415308 ) ( ON ?auto_415306 ?auto_415307 ) ( ON ?auto_415305 ?auto_415306 ) ( ON ?auto_415304 ?auto_415305 ) ( ON ?auto_415303 ?auto_415304 ) ( CLEAR ?auto_415301 ) ( ON ?auto_415302 ?auto_415303 ) ( CLEAR ?auto_415302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_415298 ?auto_415299 ?auto_415300 ?auto_415301 ?auto_415302 )
      ( MAKE-12PILE ?auto_415298 ?auto_415299 ?auto_415300 ?auto_415301 ?auto_415302 ?auto_415303 ?auto_415304 ?auto_415305 ?auto_415306 ?auto_415307 ?auto_415308 ?auto_415309 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415323 - BLOCK
      ?auto_415324 - BLOCK
      ?auto_415325 - BLOCK
      ?auto_415326 - BLOCK
      ?auto_415327 - BLOCK
      ?auto_415328 - BLOCK
      ?auto_415329 - BLOCK
      ?auto_415330 - BLOCK
      ?auto_415331 - BLOCK
      ?auto_415332 - BLOCK
      ?auto_415333 - BLOCK
      ?auto_415334 - BLOCK
    )
    :vars
    (
      ?auto_415335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415334 ?auto_415335 ) ( ON-TABLE ?auto_415323 ) ( ON ?auto_415324 ?auto_415323 ) ( ON ?auto_415325 ?auto_415324 ) ( ON ?auto_415326 ?auto_415325 ) ( not ( = ?auto_415323 ?auto_415324 ) ) ( not ( = ?auto_415323 ?auto_415325 ) ) ( not ( = ?auto_415323 ?auto_415326 ) ) ( not ( = ?auto_415323 ?auto_415327 ) ) ( not ( = ?auto_415323 ?auto_415328 ) ) ( not ( = ?auto_415323 ?auto_415329 ) ) ( not ( = ?auto_415323 ?auto_415330 ) ) ( not ( = ?auto_415323 ?auto_415331 ) ) ( not ( = ?auto_415323 ?auto_415332 ) ) ( not ( = ?auto_415323 ?auto_415333 ) ) ( not ( = ?auto_415323 ?auto_415334 ) ) ( not ( = ?auto_415323 ?auto_415335 ) ) ( not ( = ?auto_415324 ?auto_415325 ) ) ( not ( = ?auto_415324 ?auto_415326 ) ) ( not ( = ?auto_415324 ?auto_415327 ) ) ( not ( = ?auto_415324 ?auto_415328 ) ) ( not ( = ?auto_415324 ?auto_415329 ) ) ( not ( = ?auto_415324 ?auto_415330 ) ) ( not ( = ?auto_415324 ?auto_415331 ) ) ( not ( = ?auto_415324 ?auto_415332 ) ) ( not ( = ?auto_415324 ?auto_415333 ) ) ( not ( = ?auto_415324 ?auto_415334 ) ) ( not ( = ?auto_415324 ?auto_415335 ) ) ( not ( = ?auto_415325 ?auto_415326 ) ) ( not ( = ?auto_415325 ?auto_415327 ) ) ( not ( = ?auto_415325 ?auto_415328 ) ) ( not ( = ?auto_415325 ?auto_415329 ) ) ( not ( = ?auto_415325 ?auto_415330 ) ) ( not ( = ?auto_415325 ?auto_415331 ) ) ( not ( = ?auto_415325 ?auto_415332 ) ) ( not ( = ?auto_415325 ?auto_415333 ) ) ( not ( = ?auto_415325 ?auto_415334 ) ) ( not ( = ?auto_415325 ?auto_415335 ) ) ( not ( = ?auto_415326 ?auto_415327 ) ) ( not ( = ?auto_415326 ?auto_415328 ) ) ( not ( = ?auto_415326 ?auto_415329 ) ) ( not ( = ?auto_415326 ?auto_415330 ) ) ( not ( = ?auto_415326 ?auto_415331 ) ) ( not ( = ?auto_415326 ?auto_415332 ) ) ( not ( = ?auto_415326 ?auto_415333 ) ) ( not ( = ?auto_415326 ?auto_415334 ) ) ( not ( = ?auto_415326 ?auto_415335 ) ) ( not ( = ?auto_415327 ?auto_415328 ) ) ( not ( = ?auto_415327 ?auto_415329 ) ) ( not ( = ?auto_415327 ?auto_415330 ) ) ( not ( = ?auto_415327 ?auto_415331 ) ) ( not ( = ?auto_415327 ?auto_415332 ) ) ( not ( = ?auto_415327 ?auto_415333 ) ) ( not ( = ?auto_415327 ?auto_415334 ) ) ( not ( = ?auto_415327 ?auto_415335 ) ) ( not ( = ?auto_415328 ?auto_415329 ) ) ( not ( = ?auto_415328 ?auto_415330 ) ) ( not ( = ?auto_415328 ?auto_415331 ) ) ( not ( = ?auto_415328 ?auto_415332 ) ) ( not ( = ?auto_415328 ?auto_415333 ) ) ( not ( = ?auto_415328 ?auto_415334 ) ) ( not ( = ?auto_415328 ?auto_415335 ) ) ( not ( = ?auto_415329 ?auto_415330 ) ) ( not ( = ?auto_415329 ?auto_415331 ) ) ( not ( = ?auto_415329 ?auto_415332 ) ) ( not ( = ?auto_415329 ?auto_415333 ) ) ( not ( = ?auto_415329 ?auto_415334 ) ) ( not ( = ?auto_415329 ?auto_415335 ) ) ( not ( = ?auto_415330 ?auto_415331 ) ) ( not ( = ?auto_415330 ?auto_415332 ) ) ( not ( = ?auto_415330 ?auto_415333 ) ) ( not ( = ?auto_415330 ?auto_415334 ) ) ( not ( = ?auto_415330 ?auto_415335 ) ) ( not ( = ?auto_415331 ?auto_415332 ) ) ( not ( = ?auto_415331 ?auto_415333 ) ) ( not ( = ?auto_415331 ?auto_415334 ) ) ( not ( = ?auto_415331 ?auto_415335 ) ) ( not ( = ?auto_415332 ?auto_415333 ) ) ( not ( = ?auto_415332 ?auto_415334 ) ) ( not ( = ?auto_415332 ?auto_415335 ) ) ( not ( = ?auto_415333 ?auto_415334 ) ) ( not ( = ?auto_415333 ?auto_415335 ) ) ( not ( = ?auto_415334 ?auto_415335 ) ) ( ON ?auto_415333 ?auto_415334 ) ( ON ?auto_415332 ?auto_415333 ) ( ON ?auto_415331 ?auto_415332 ) ( ON ?auto_415330 ?auto_415331 ) ( ON ?auto_415329 ?auto_415330 ) ( ON ?auto_415328 ?auto_415329 ) ( CLEAR ?auto_415326 ) ( ON ?auto_415327 ?auto_415328 ) ( CLEAR ?auto_415327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_415323 ?auto_415324 ?auto_415325 ?auto_415326 ?auto_415327 )
      ( MAKE-12PILE ?auto_415323 ?auto_415324 ?auto_415325 ?auto_415326 ?auto_415327 ?auto_415328 ?auto_415329 ?auto_415330 ?auto_415331 ?auto_415332 ?auto_415333 ?auto_415334 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415348 - BLOCK
      ?auto_415349 - BLOCK
      ?auto_415350 - BLOCK
      ?auto_415351 - BLOCK
      ?auto_415352 - BLOCK
      ?auto_415353 - BLOCK
      ?auto_415354 - BLOCK
      ?auto_415355 - BLOCK
      ?auto_415356 - BLOCK
      ?auto_415357 - BLOCK
      ?auto_415358 - BLOCK
      ?auto_415359 - BLOCK
    )
    :vars
    (
      ?auto_415360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415359 ?auto_415360 ) ( ON-TABLE ?auto_415348 ) ( ON ?auto_415349 ?auto_415348 ) ( ON ?auto_415350 ?auto_415349 ) ( not ( = ?auto_415348 ?auto_415349 ) ) ( not ( = ?auto_415348 ?auto_415350 ) ) ( not ( = ?auto_415348 ?auto_415351 ) ) ( not ( = ?auto_415348 ?auto_415352 ) ) ( not ( = ?auto_415348 ?auto_415353 ) ) ( not ( = ?auto_415348 ?auto_415354 ) ) ( not ( = ?auto_415348 ?auto_415355 ) ) ( not ( = ?auto_415348 ?auto_415356 ) ) ( not ( = ?auto_415348 ?auto_415357 ) ) ( not ( = ?auto_415348 ?auto_415358 ) ) ( not ( = ?auto_415348 ?auto_415359 ) ) ( not ( = ?auto_415348 ?auto_415360 ) ) ( not ( = ?auto_415349 ?auto_415350 ) ) ( not ( = ?auto_415349 ?auto_415351 ) ) ( not ( = ?auto_415349 ?auto_415352 ) ) ( not ( = ?auto_415349 ?auto_415353 ) ) ( not ( = ?auto_415349 ?auto_415354 ) ) ( not ( = ?auto_415349 ?auto_415355 ) ) ( not ( = ?auto_415349 ?auto_415356 ) ) ( not ( = ?auto_415349 ?auto_415357 ) ) ( not ( = ?auto_415349 ?auto_415358 ) ) ( not ( = ?auto_415349 ?auto_415359 ) ) ( not ( = ?auto_415349 ?auto_415360 ) ) ( not ( = ?auto_415350 ?auto_415351 ) ) ( not ( = ?auto_415350 ?auto_415352 ) ) ( not ( = ?auto_415350 ?auto_415353 ) ) ( not ( = ?auto_415350 ?auto_415354 ) ) ( not ( = ?auto_415350 ?auto_415355 ) ) ( not ( = ?auto_415350 ?auto_415356 ) ) ( not ( = ?auto_415350 ?auto_415357 ) ) ( not ( = ?auto_415350 ?auto_415358 ) ) ( not ( = ?auto_415350 ?auto_415359 ) ) ( not ( = ?auto_415350 ?auto_415360 ) ) ( not ( = ?auto_415351 ?auto_415352 ) ) ( not ( = ?auto_415351 ?auto_415353 ) ) ( not ( = ?auto_415351 ?auto_415354 ) ) ( not ( = ?auto_415351 ?auto_415355 ) ) ( not ( = ?auto_415351 ?auto_415356 ) ) ( not ( = ?auto_415351 ?auto_415357 ) ) ( not ( = ?auto_415351 ?auto_415358 ) ) ( not ( = ?auto_415351 ?auto_415359 ) ) ( not ( = ?auto_415351 ?auto_415360 ) ) ( not ( = ?auto_415352 ?auto_415353 ) ) ( not ( = ?auto_415352 ?auto_415354 ) ) ( not ( = ?auto_415352 ?auto_415355 ) ) ( not ( = ?auto_415352 ?auto_415356 ) ) ( not ( = ?auto_415352 ?auto_415357 ) ) ( not ( = ?auto_415352 ?auto_415358 ) ) ( not ( = ?auto_415352 ?auto_415359 ) ) ( not ( = ?auto_415352 ?auto_415360 ) ) ( not ( = ?auto_415353 ?auto_415354 ) ) ( not ( = ?auto_415353 ?auto_415355 ) ) ( not ( = ?auto_415353 ?auto_415356 ) ) ( not ( = ?auto_415353 ?auto_415357 ) ) ( not ( = ?auto_415353 ?auto_415358 ) ) ( not ( = ?auto_415353 ?auto_415359 ) ) ( not ( = ?auto_415353 ?auto_415360 ) ) ( not ( = ?auto_415354 ?auto_415355 ) ) ( not ( = ?auto_415354 ?auto_415356 ) ) ( not ( = ?auto_415354 ?auto_415357 ) ) ( not ( = ?auto_415354 ?auto_415358 ) ) ( not ( = ?auto_415354 ?auto_415359 ) ) ( not ( = ?auto_415354 ?auto_415360 ) ) ( not ( = ?auto_415355 ?auto_415356 ) ) ( not ( = ?auto_415355 ?auto_415357 ) ) ( not ( = ?auto_415355 ?auto_415358 ) ) ( not ( = ?auto_415355 ?auto_415359 ) ) ( not ( = ?auto_415355 ?auto_415360 ) ) ( not ( = ?auto_415356 ?auto_415357 ) ) ( not ( = ?auto_415356 ?auto_415358 ) ) ( not ( = ?auto_415356 ?auto_415359 ) ) ( not ( = ?auto_415356 ?auto_415360 ) ) ( not ( = ?auto_415357 ?auto_415358 ) ) ( not ( = ?auto_415357 ?auto_415359 ) ) ( not ( = ?auto_415357 ?auto_415360 ) ) ( not ( = ?auto_415358 ?auto_415359 ) ) ( not ( = ?auto_415358 ?auto_415360 ) ) ( not ( = ?auto_415359 ?auto_415360 ) ) ( ON ?auto_415358 ?auto_415359 ) ( ON ?auto_415357 ?auto_415358 ) ( ON ?auto_415356 ?auto_415357 ) ( ON ?auto_415355 ?auto_415356 ) ( ON ?auto_415354 ?auto_415355 ) ( ON ?auto_415353 ?auto_415354 ) ( ON ?auto_415352 ?auto_415353 ) ( CLEAR ?auto_415350 ) ( ON ?auto_415351 ?auto_415352 ) ( CLEAR ?auto_415351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_415348 ?auto_415349 ?auto_415350 ?auto_415351 )
      ( MAKE-12PILE ?auto_415348 ?auto_415349 ?auto_415350 ?auto_415351 ?auto_415352 ?auto_415353 ?auto_415354 ?auto_415355 ?auto_415356 ?auto_415357 ?auto_415358 ?auto_415359 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415373 - BLOCK
      ?auto_415374 - BLOCK
      ?auto_415375 - BLOCK
      ?auto_415376 - BLOCK
      ?auto_415377 - BLOCK
      ?auto_415378 - BLOCK
      ?auto_415379 - BLOCK
      ?auto_415380 - BLOCK
      ?auto_415381 - BLOCK
      ?auto_415382 - BLOCK
      ?auto_415383 - BLOCK
      ?auto_415384 - BLOCK
    )
    :vars
    (
      ?auto_415385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415384 ?auto_415385 ) ( ON-TABLE ?auto_415373 ) ( ON ?auto_415374 ?auto_415373 ) ( ON ?auto_415375 ?auto_415374 ) ( not ( = ?auto_415373 ?auto_415374 ) ) ( not ( = ?auto_415373 ?auto_415375 ) ) ( not ( = ?auto_415373 ?auto_415376 ) ) ( not ( = ?auto_415373 ?auto_415377 ) ) ( not ( = ?auto_415373 ?auto_415378 ) ) ( not ( = ?auto_415373 ?auto_415379 ) ) ( not ( = ?auto_415373 ?auto_415380 ) ) ( not ( = ?auto_415373 ?auto_415381 ) ) ( not ( = ?auto_415373 ?auto_415382 ) ) ( not ( = ?auto_415373 ?auto_415383 ) ) ( not ( = ?auto_415373 ?auto_415384 ) ) ( not ( = ?auto_415373 ?auto_415385 ) ) ( not ( = ?auto_415374 ?auto_415375 ) ) ( not ( = ?auto_415374 ?auto_415376 ) ) ( not ( = ?auto_415374 ?auto_415377 ) ) ( not ( = ?auto_415374 ?auto_415378 ) ) ( not ( = ?auto_415374 ?auto_415379 ) ) ( not ( = ?auto_415374 ?auto_415380 ) ) ( not ( = ?auto_415374 ?auto_415381 ) ) ( not ( = ?auto_415374 ?auto_415382 ) ) ( not ( = ?auto_415374 ?auto_415383 ) ) ( not ( = ?auto_415374 ?auto_415384 ) ) ( not ( = ?auto_415374 ?auto_415385 ) ) ( not ( = ?auto_415375 ?auto_415376 ) ) ( not ( = ?auto_415375 ?auto_415377 ) ) ( not ( = ?auto_415375 ?auto_415378 ) ) ( not ( = ?auto_415375 ?auto_415379 ) ) ( not ( = ?auto_415375 ?auto_415380 ) ) ( not ( = ?auto_415375 ?auto_415381 ) ) ( not ( = ?auto_415375 ?auto_415382 ) ) ( not ( = ?auto_415375 ?auto_415383 ) ) ( not ( = ?auto_415375 ?auto_415384 ) ) ( not ( = ?auto_415375 ?auto_415385 ) ) ( not ( = ?auto_415376 ?auto_415377 ) ) ( not ( = ?auto_415376 ?auto_415378 ) ) ( not ( = ?auto_415376 ?auto_415379 ) ) ( not ( = ?auto_415376 ?auto_415380 ) ) ( not ( = ?auto_415376 ?auto_415381 ) ) ( not ( = ?auto_415376 ?auto_415382 ) ) ( not ( = ?auto_415376 ?auto_415383 ) ) ( not ( = ?auto_415376 ?auto_415384 ) ) ( not ( = ?auto_415376 ?auto_415385 ) ) ( not ( = ?auto_415377 ?auto_415378 ) ) ( not ( = ?auto_415377 ?auto_415379 ) ) ( not ( = ?auto_415377 ?auto_415380 ) ) ( not ( = ?auto_415377 ?auto_415381 ) ) ( not ( = ?auto_415377 ?auto_415382 ) ) ( not ( = ?auto_415377 ?auto_415383 ) ) ( not ( = ?auto_415377 ?auto_415384 ) ) ( not ( = ?auto_415377 ?auto_415385 ) ) ( not ( = ?auto_415378 ?auto_415379 ) ) ( not ( = ?auto_415378 ?auto_415380 ) ) ( not ( = ?auto_415378 ?auto_415381 ) ) ( not ( = ?auto_415378 ?auto_415382 ) ) ( not ( = ?auto_415378 ?auto_415383 ) ) ( not ( = ?auto_415378 ?auto_415384 ) ) ( not ( = ?auto_415378 ?auto_415385 ) ) ( not ( = ?auto_415379 ?auto_415380 ) ) ( not ( = ?auto_415379 ?auto_415381 ) ) ( not ( = ?auto_415379 ?auto_415382 ) ) ( not ( = ?auto_415379 ?auto_415383 ) ) ( not ( = ?auto_415379 ?auto_415384 ) ) ( not ( = ?auto_415379 ?auto_415385 ) ) ( not ( = ?auto_415380 ?auto_415381 ) ) ( not ( = ?auto_415380 ?auto_415382 ) ) ( not ( = ?auto_415380 ?auto_415383 ) ) ( not ( = ?auto_415380 ?auto_415384 ) ) ( not ( = ?auto_415380 ?auto_415385 ) ) ( not ( = ?auto_415381 ?auto_415382 ) ) ( not ( = ?auto_415381 ?auto_415383 ) ) ( not ( = ?auto_415381 ?auto_415384 ) ) ( not ( = ?auto_415381 ?auto_415385 ) ) ( not ( = ?auto_415382 ?auto_415383 ) ) ( not ( = ?auto_415382 ?auto_415384 ) ) ( not ( = ?auto_415382 ?auto_415385 ) ) ( not ( = ?auto_415383 ?auto_415384 ) ) ( not ( = ?auto_415383 ?auto_415385 ) ) ( not ( = ?auto_415384 ?auto_415385 ) ) ( ON ?auto_415383 ?auto_415384 ) ( ON ?auto_415382 ?auto_415383 ) ( ON ?auto_415381 ?auto_415382 ) ( ON ?auto_415380 ?auto_415381 ) ( ON ?auto_415379 ?auto_415380 ) ( ON ?auto_415378 ?auto_415379 ) ( ON ?auto_415377 ?auto_415378 ) ( CLEAR ?auto_415375 ) ( ON ?auto_415376 ?auto_415377 ) ( CLEAR ?auto_415376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_415373 ?auto_415374 ?auto_415375 ?auto_415376 )
      ( MAKE-12PILE ?auto_415373 ?auto_415374 ?auto_415375 ?auto_415376 ?auto_415377 ?auto_415378 ?auto_415379 ?auto_415380 ?auto_415381 ?auto_415382 ?auto_415383 ?auto_415384 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415398 - BLOCK
      ?auto_415399 - BLOCK
      ?auto_415400 - BLOCK
      ?auto_415401 - BLOCK
      ?auto_415402 - BLOCK
      ?auto_415403 - BLOCK
      ?auto_415404 - BLOCK
      ?auto_415405 - BLOCK
      ?auto_415406 - BLOCK
      ?auto_415407 - BLOCK
      ?auto_415408 - BLOCK
      ?auto_415409 - BLOCK
    )
    :vars
    (
      ?auto_415410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415409 ?auto_415410 ) ( ON-TABLE ?auto_415398 ) ( ON ?auto_415399 ?auto_415398 ) ( not ( = ?auto_415398 ?auto_415399 ) ) ( not ( = ?auto_415398 ?auto_415400 ) ) ( not ( = ?auto_415398 ?auto_415401 ) ) ( not ( = ?auto_415398 ?auto_415402 ) ) ( not ( = ?auto_415398 ?auto_415403 ) ) ( not ( = ?auto_415398 ?auto_415404 ) ) ( not ( = ?auto_415398 ?auto_415405 ) ) ( not ( = ?auto_415398 ?auto_415406 ) ) ( not ( = ?auto_415398 ?auto_415407 ) ) ( not ( = ?auto_415398 ?auto_415408 ) ) ( not ( = ?auto_415398 ?auto_415409 ) ) ( not ( = ?auto_415398 ?auto_415410 ) ) ( not ( = ?auto_415399 ?auto_415400 ) ) ( not ( = ?auto_415399 ?auto_415401 ) ) ( not ( = ?auto_415399 ?auto_415402 ) ) ( not ( = ?auto_415399 ?auto_415403 ) ) ( not ( = ?auto_415399 ?auto_415404 ) ) ( not ( = ?auto_415399 ?auto_415405 ) ) ( not ( = ?auto_415399 ?auto_415406 ) ) ( not ( = ?auto_415399 ?auto_415407 ) ) ( not ( = ?auto_415399 ?auto_415408 ) ) ( not ( = ?auto_415399 ?auto_415409 ) ) ( not ( = ?auto_415399 ?auto_415410 ) ) ( not ( = ?auto_415400 ?auto_415401 ) ) ( not ( = ?auto_415400 ?auto_415402 ) ) ( not ( = ?auto_415400 ?auto_415403 ) ) ( not ( = ?auto_415400 ?auto_415404 ) ) ( not ( = ?auto_415400 ?auto_415405 ) ) ( not ( = ?auto_415400 ?auto_415406 ) ) ( not ( = ?auto_415400 ?auto_415407 ) ) ( not ( = ?auto_415400 ?auto_415408 ) ) ( not ( = ?auto_415400 ?auto_415409 ) ) ( not ( = ?auto_415400 ?auto_415410 ) ) ( not ( = ?auto_415401 ?auto_415402 ) ) ( not ( = ?auto_415401 ?auto_415403 ) ) ( not ( = ?auto_415401 ?auto_415404 ) ) ( not ( = ?auto_415401 ?auto_415405 ) ) ( not ( = ?auto_415401 ?auto_415406 ) ) ( not ( = ?auto_415401 ?auto_415407 ) ) ( not ( = ?auto_415401 ?auto_415408 ) ) ( not ( = ?auto_415401 ?auto_415409 ) ) ( not ( = ?auto_415401 ?auto_415410 ) ) ( not ( = ?auto_415402 ?auto_415403 ) ) ( not ( = ?auto_415402 ?auto_415404 ) ) ( not ( = ?auto_415402 ?auto_415405 ) ) ( not ( = ?auto_415402 ?auto_415406 ) ) ( not ( = ?auto_415402 ?auto_415407 ) ) ( not ( = ?auto_415402 ?auto_415408 ) ) ( not ( = ?auto_415402 ?auto_415409 ) ) ( not ( = ?auto_415402 ?auto_415410 ) ) ( not ( = ?auto_415403 ?auto_415404 ) ) ( not ( = ?auto_415403 ?auto_415405 ) ) ( not ( = ?auto_415403 ?auto_415406 ) ) ( not ( = ?auto_415403 ?auto_415407 ) ) ( not ( = ?auto_415403 ?auto_415408 ) ) ( not ( = ?auto_415403 ?auto_415409 ) ) ( not ( = ?auto_415403 ?auto_415410 ) ) ( not ( = ?auto_415404 ?auto_415405 ) ) ( not ( = ?auto_415404 ?auto_415406 ) ) ( not ( = ?auto_415404 ?auto_415407 ) ) ( not ( = ?auto_415404 ?auto_415408 ) ) ( not ( = ?auto_415404 ?auto_415409 ) ) ( not ( = ?auto_415404 ?auto_415410 ) ) ( not ( = ?auto_415405 ?auto_415406 ) ) ( not ( = ?auto_415405 ?auto_415407 ) ) ( not ( = ?auto_415405 ?auto_415408 ) ) ( not ( = ?auto_415405 ?auto_415409 ) ) ( not ( = ?auto_415405 ?auto_415410 ) ) ( not ( = ?auto_415406 ?auto_415407 ) ) ( not ( = ?auto_415406 ?auto_415408 ) ) ( not ( = ?auto_415406 ?auto_415409 ) ) ( not ( = ?auto_415406 ?auto_415410 ) ) ( not ( = ?auto_415407 ?auto_415408 ) ) ( not ( = ?auto_415407 ?auto_415409 ) ) ( not ( = ?auto_415407 ?auto_415410 ) ) ( not ( = ?auto_415408 ?auto_415409 ) ) ( not ( = ?auto_415408 ?auto_415410 ) ) ( not ( = ?auto_415409 ?auto_415410 ) ) ( ON ?auto_415408 ?auto_415409 ) ( ON ?auto_415407 ?auto_415408 ) ( ON ?auto_415406 ?auto_415407 ) ( ON ?auto_415405 ?auto_415406 ) ( ON ?auto_415404 ?auto_415405 ) ( ON ?auto_415403 ?auto_415404 ) ( ON ?auto_415402 ?auto_415403 ) ( ON ?auto_415401 ?auto_415402 ) ( CLEAR ?auto_415399 ) ( ON ?auto_415400 ?auto_415401 ) ( CLEAR ?auto_415400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_415398 ?auto_415399 ?auto_415400 )
      ( MAKE-12PILE ?auto_415398 ?auto_415399 ?auto_415400 ?auto_415401 ?auto_415402 ?auto_415403 ?auto_415404 ?auto_415405 ?auto_415406 ?auto_415407 ?auto_415408 ?auto_415409 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415423 - BLOCK
      ?auto_415424 - BLOCK
      ?auto_415425 - BLOCK
      ?auto_415426 - BLOCK
      ?auto_415427 - BLOCK
      ?auto_415428 - BLOCK
      ?auto_415429 - BLOCK
      ?auto_415430 - BLOCK
      ?auto_415431 - BLOCK
      ?auto_415432 - BLOCK
      ?auto_415433 - BLOCK
      ?auto_415434 - BLOCK
    )
    :vars
    (
      ?auto_415435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415434 ?auto_415435 ) ( ON-TABLE ?auto_415423 ) ( ON ?auto_415424 ?auto_415423 ) ( not ( = ?auto_415423 ?auto_415424 ) ) ( not ( = ?auto_415423 ?auto_415425 ) ) ( not ( = ?auto_415423 ?auto_415426 ) ) ( not ( = ?auto_415423 ?auto_415427 ) ) ( not ( = ?auto_415423 ?auto_415428 ) ) ( not ( = ?auto_415423 ?auto_415429 ) ) ( not ( = ?auto_415423 ?auto_415430 ) ) ( not ( = ?auto_415423 ?auto_415431 ) ) ( not ( = ?auto_415423 ?auto_415432 ) ) ( not ( = ?auto_415423 ?auto_415433 ) ) ( not ( = ?auto_415423 ?auto_415434 ) ) ( not ( = ?auto_415423 ?auto_415435 ) ) ( not ( = ?auto_415424 ?auto_415425 ) ) ( not ( = ?auto_415424 ?auto_415426 ) ) ( not ( = ?auto_415424 ?auto_415427 ) ) ( not ( = ?auto_415424 ?auto_415428 ) ) ( not ( = ?auto_415424 ?auto_415429 ) ) ( not ( = ?auto_415424 ?auto_415430 ) ) ( not ( = ?auto_415424 ?auto_415431 ) ) ( not ( = ?auto_415424 ?auto_415432 ) ) ( not ( = ?auto_415424 ?auto_415433 ) ) ( not ( = ?auto_415424 ?auto_415434 ) ) ( not ( = ?auto_415424 ?auto_415435 ) ) ( not ( = ?auto_415425 ?auto_415426 ) ) ( not ( = ?auto_415425 ?auto_415427 ) ) ( not ( = ?auto_415425 ?auto_415428 ) ) ( not ( = ?auto_415425 ?auto_415429 ) ) ( not ( = ?auto_415425 ?auto_415430 ) ) ( not ( = ?auto_415425 ?auto_415431 ) ) ( not ( = ?auto_415425 ?auto_415432 ) ) ( not ( = ?auto_415425 ?auto_415433 ) ) ( not ( = ?auto_415425 ?auto_415434 ) ) ( not ( = ?auto_415425 ?auto_415435 ) ) ( not ( = ?auto_415426 ?auto_415427 ) ) ( not ( = ?auto_415426 ?auto_415428 ) ) ( not ( = ?auto_415426 ?auto_415429 ) ) ( not ( = ?auto_415426 ?auto_415430 ) ) ( not ( = ?auto_415426 ?auto_415431 ) ) ( not ( = ?auto_415426 ?auto_415432 ) ) ( not ( = ?auto_415426 ?auto_415433 ) ) ( not ( = ?auto_415426 ?auto_415434 ) ) ( not ( = ?auto_415426 ?auto_415435 ) ) ( not ( = ?auto_415427 ?auto_415428 ) ) ( not ( = ?auto_415427 ?auto_415429 ) ) ( not ( = ?auto_415427 ?auto_415430 ) ) ( not ( = ?auto_415427 ?auto_415431 ) ) ( not ( = ?auto_415427 ?auto_415432 ) ) ( not ( = ?auto_415427 ?auto_415433 ) ) ( not ( = ?auto_415427 ?auto_415434 ) ) ( not ( = ?auto_415427 ?auto_415435 ) ) ( not ( = ?auto_415428 ?auto_415429 ) ) ( not ( = ?auto_415428 ?auto_415430 ) ) ( not ( = ?auto_415428 ?auto_415431 ) ) ( not ( = ?auto_415428 ?auto_415432 ) ) ( not ( = ?auto_415428 ?auto_415433 ) ) ( not ( = ?auto_415428 ?auto_415434 ) ) ( not ( = ?auto_415428 ?auto_415435 ) ) ( not ( = ?auto_415429 ?auto_415430 ) ) ( not ( = ?auto_415429 ?auto_415431 ) ) ( not ( = ?auto_415429 ?auto_415432 ) ) ( not ( = ?auto_415429 ?auto_415433 ) ) ( not ( = ?auto_415429 ?auto_415434 ) ) ( not ( = ?auto_415429 ?auto_415435 ) ) ( not ( = ?auto_415430 ?auto_415431 ) ) ( not ( = ?auto_415430 ?auto_415432 ) ) ( not ( = ?auto_415430 ?auto_415433 ) ) ( not ( = ?auto_415430 ?auto_415434 ) ) ( not ( = ?auto_415430 ?auto_415435 ) ) ( not ( = ?auto_415431 ?auto_415432 ) ) ( not ( = ?auto_415431 ?auto_415433 ) ) ( not ( = ?auto_415431 ?auto_415434 ) ) ( not ( = ?auto_415431 ?auto_415435 ) ) ( not ( = ?auto_415432 ?auto_415433 ) ) ( not ( = ?auto_415432 ?auto_415434 ) ) ( not ( = ?auto_415432 ?auto_415435 ) ) ( not ( = ?auto_415433 ?auto_415434 ) ) ( not ( = ?auto_415433 ?auto_415435 ) ) ( not ( = ?auto_415434 ?auto_415435 ) ) ( ON ?auto_415433 ?auto_415434 ) ( ON ?auto_415432 ?auto_415433 ) ( ON ?auto_415431 ?auto_415432 ) ( ON ?auto_415430 ?auto_415431 ) ( ON ?auto_415429 ?auto_415430 ) ( ON ?auto_415428 ?auto_415429 ) ( ON ?auto_415427 ?auto_415428 ) ( ON ?auto_415426 ?auto_415427 ) ( CLEAR ?auto_415424 ) ( ON ?auto_415425 ?auto_415426 ) ( CLEAR ?auto_415425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_415423 ?auto_415424 ?auto_415425 )
      ( MAKE-12PILE ?auto_415423 ?auto_415424 ?auto_415425 ?auto_415426 ?auto_415427 ?auto_415428 ?auto_415429 ?auto_415430 ?auto_415431 ?auto_415432 ?auto_415433 ?auto_415434 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415448 - BLOCK
      ?auto_415449 - BLOCK
      ?auto_415450 - BLOCK
      ?auto_415451 - BLOCK
      ?auto_415452 - BLOCK
      ?auto_415453 - BLOCK
      ?auto_415454 - BLOCK
      ?auto_415455 - BLOCK
      ?auto_415456 - BLOCK
      ?auto_415457 - BLOCK
      ?auto_415458 - BLOCK
      ?auto_415459 - BLOCK
    )
    :vars
    (
      ?auto_415460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415459 ?auto_415460 ) ( ON-TABLE ?auto_415448 ) ( not ( = ?auto_415448 ?auto_415449 ) ) ( not ( = ?auto_415448 ?auto_415450 ) ) ( not ( = ?auto_415448 ?auto_415451 ) ) ( not ( = ?auto_415448 ?auto_415452 ) ) ( not ( = ?auto_415448 ?auto_415453 ) ) ( not ( = ?auto_415448 ?auto_415454 ) ) ( not ( = ?auto_415448 ?auto_415455 ) ) ( not ( = ?auto_415448 ?auto_415456 ) ) ( not ( = ?auto_415448 ?auto_415457 ) ) ( not ( = ?auto_415448 ?auto_415458 ) ) ( not ( = ?auto_415448 ?auto_415459 ) ) ( not ( = ?auto_415448 ?auto_415460 ) ) ( not ( = ?auto_415449 ?auto_415450 ) ) ( not ( = ?auto_415449 ?auto_415451 ) ) ( not ( = ?auto_415449 ?auto_415452 ) ) ( not ( = ?auto_415449 ?auto_415453 ) ) ( not ( = ?auto_415449 ?auto_415454 ) ) ( not ( = ?auto_415449 ?auto_415455 ) ) ( not ( = ?auto_415449 ?auto_415456 ) ) ( not ( = ?auto_415449 ?auto_415457 ) ) ( not ( = ?auto_415449 ?auto_415458 ) ) ( not ( = ?auto_415449 ?auto_415459 ) ) ( not ( = ?auto_415449 ?auto_415460 ) ) ( not ( = ?auto_415450 ?auto_415451 ) ) ( not ( = ?auto_415450 ?auto_415452 ) ) ( not ( = ?auto_415450 ?auto_415453 ) ) ( not ( = ?auto_415450 ?auto_415454 ) ) ( not ( = ?auto_415450 ?auto_415455 ) ) ( not ( = ?auto_415450 ?auto_415456 ) ) ( not ( = ?auto_415450 ?auto_415457 ) ) ( not ( = ?auto_415450 ?auto_415458 ) ) ( not ( = ?auto_415450 ?auto_415459 ) ) ( not ( = ?auto_415450 ?auto_415460 ) ) ( not ( = ?auto_415451 ?auto_415452 ) ) ( not ( = ?auto_415451 ?auto_415453 ) ) ( not ( = ?auto_415451 ?auto_415454 ) ) ( not ( = ?auto_415451 ?auto_415455 ) ) ( not ( = ?auto_415451 ?auto_415456 ) ) ( not ( = ?auto_415451 ?auto_415457 ) ) ( not ( = ?auto_415451 ?auto_415458 ) ) ( not ( = ?auto_415451 ?auto_415459 ) ) ( not ( = ?auto_415451 ?auto_415460 ) ) ( not ( = ?auto_415452 ?auto_415453 ) ) ( not ( = ?auto_415452 ?auto_415454 ) ) ( not ( = ?auto_415452 ?auto_415455 ) ) ( not ( = ?auto_415452 ?auto_415456 ) ) ( not ( = ?auto_415452 ?auto_415457 ) ) ( not ( = ?auto_415452 ?auto_415458 ) ) ( not ( = ?auto_415452 ?auto_415459 ) ) ( not ( = ?auto_415452 ?auto_415460 ) ) ( not ( = ?auto_415453 ?auto_415454 ) ) ( not ( = ?auto_415453 ?auto_415455 ) ) ( not ( = ?auto_415453 ?auto_415456 ) ) ( not ( = ?auto_415453 ?auto_415457 ) ) ( not ( = ?auto_415453 ?auto_415458 ) ) ( not ( = ?auto_415453 ?auto_415459 ) ) ( not ( = ?auto_415453 ?auto_415460 ) ) ( not ( = ?auto_415454 ?auto_415455 ) ) ( not ( = ?auto_415454 ?auto_415456 ) ) ( not ( = ?auto_415454 ?auto_415457 ) ) ( not ( = ?auto_415454 ?auto_415458 ) ) ( not ( = ?auto_415454 ?auto_415459 ) ) ( not ( = ?auto_415454 ?auto_415460 ) ) ( not ( = ?auto_415455 ?auto_415456 ) ) ( not ( = ?auto_415455 ?auto_415457 ) ) ( not ( = ?auto_415455 ?auto_415458 ) ) ( not ( = ?auto_415455 ?auto_415459 ) ) ( not ( = ?auto_415455 ?auto_415460 ) ) ( not ( = ?auto_415456 ?auto_415457 ) ) ( not ( = ?auto_415456 ?auto_415458 ) ) ( not ( = ?auto_415456 ?auto_415459 ) ) ( not ( = ?auto_415456 ?auto_415460 ) ) ( not ( = ?auto_415457 ?auto_415458 ) ) ( not ( = ?auto_415457 ?auto_415459 ) ) ( not ( = ?auto_415457 ?auto_415460 ) ) ( not ( = ?auto_415458 ?auto_415459 ) ) ( not ( = ?auto_415458 ?auto_415460 ) ) ( not ( = ?auto_415459 ?auto_415460 ) ) ( ON ?auto_415458 ?auto_415459 ) ( ON ?auto_415457 ?auto_415458 ) ( ON ?auto_415456 ?auto_415457 ) ( ON ?auto_415455 ?auto_415456 ) ( ON ?auto_415454 ?auto_415455 ) ( ON ?auto_415453 ?auto_415454 ) ( ON ?auto_415452 ?auto_415453 ) ( ON ?auto_415451 ?auto_415452 ) ( ON ?auto_415450 ?auto_415451 ) ( CLEAR ?auto_415448 ) ( ON ?auto_415449 ?auto_415450 ) ( CLEAR ?auto_415449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_415448 ?auto_415449 )
      ( MAKE-12PILE ?auto_415448 ?auto_415449 ?auto_415450 ?auto_415451 ?auto_415452 ?auto_415453 ?auto_415454 ?auto_415455 ?auto_415456 ?auto_415457 ?auto_415458 ?auto_415459 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415473 - BLOCK
      ?auto_415474 - BLOCK
      ?auto_415475 - BLOCK
      ?auto_415476 - BLOCK
      ?auto_415477 - BLOCK
      ?auto_415478 - BLOCK
      ?auto_415479 - BLOCK
      ?auto_415480 - BLOCK
      ?auto_415481 - BLOCK
      ?auto_415482 - BLOCK
      ?auto_415483 - BLOCK
      ?auto_415484 - BLOCK
    )
    :vars
    (
      ?auto_415485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415484 ?auto_415485 ) ( ON-TABLE ?auto_415473 ) ( not ( = ?auto_415473 ?auto_415474 ) ) ( not ( = ?auto_415473 ?auto_415475 ) ) ( not ( = ?auto_415473 ?auto_415476 ) ) ( not ( = ?auto_415473 ?auto_415477 ) ) ( not ( = ?auto_415473 ?auto_415478 ) ) ( not ( = ?auto_415473 ?auto_415479 ) ) ( not ( = ?auto_415473 ?auto_415480 ) ) ( not ( = ?auto_415473 ?auto_415481 ) ) ( not ( = ?auto_415473 ?auto_415482 ) ) ( not ( = ?auto_415473 ?auto_415483 ) ) ( not ( = ?auto_415473 ?auto_415484 ) ) ( not ( = ?auto_415473 ?auto_415485 ) ) ( not ( = ?auto_415474 ?auto_415475 ) ) ( not ( = ?auto_415474 ?auto_415476 ) ) ( not ( = ?auto_415474 ?auto_415477 ) ) ( not ( = ?auto_415474 ?auto_415478 ) ) ( not ( = ?auto_415474 ?auto_415479 ) ) ( not ( = ?auto_415474 ?auto_415480 ) ) ( not ( = ?auto_415474 ?auto_415481 ) ) ( not ( = ?auto_415474 ?auto_415482 ) ) ( not ( = ?auto_415474 ?auto_415483 ) ) ( not ( = ?auto_415474 ?auto_415484 ) ) ( not ( = ?auto_415474 ?auto_415485 ) ) ( not ( = ?auto_415475 ?auto_415476 ) ) ( not ( = ?auto_415475 ?auto_415477 ) ) ( not ( = ?auto_415475 ?auto_415478 ) ) ( not ( = ?auto_415475 ?auto_415479 ) ) ( not ( = ?auto_415475 ?auto_415480 ) ) ( not ( = ?auto_415475 ?auto_415481 ) ) ( not ( = ?auto_415475 ?auto_415482 ) ) ( not ( = ?auto_415475 ?auto_415483 ) ) ( not ( = ?auto_415475 ?auto_415484 ) ) ( not ( = ?auto_415475 ?auto_415485 ) ) ( not ( = ?auto_415476 ?auto_415477 ) ) ( not ( = ?auto_415476 ?auto_415478 ) ) ( not ( = ?auto_415476 ?auto_415479 ) ) ( not ( = ?auto_415476 ?auto_415480 ) ) ( not ( = ?auto_415476 ?auto_415481 ) ) ( not ( = ?auto_415476 ?auto_415482 ) ) ( not ( = ?auto_415476 ?auto_415483 ) ) ( not ( = ?auto_415476 ?auto_415484 ) ) ( not ( = ?auto_415476 ?auto_415485 ) ) ( not ( = ?auto_415477 ?auto_415478 ) ) ( not ( = ?auto_415477 ?auto_415479 ) ) ( not ( = ?auto_415477 ?auto_415480 ) ) ( not ( = ?auto_415477 ?auto_415481 ) ) ( not ( = ?auto_415477 ?auto_415482 ) ) ( not ( = ?auto_415477 ?auto_415483 ) ) ( not ( = ?auto_415477 ?auto_415484 ) ) ( not ( = ?auto_415477 ?auto_415485 ) ) ( not ( = ?auto_415478 ?auto_415479 ) ) ( not ( = ?auto_415478 ?auto_415480 ) ) ( not ( = ?auto_415478 ?auto_415481 ) ) ( not ( = ?auto_415478 ?auto_415482 ) ) ( not ( = ?auto_415478 ?auto_415483 ) ) ( not ( = ?auto_415478 ?auto_415484 ) ) ( not ( = ?auto_415478 ?auto_415485 ) ) ( not ( = ?auto_415479 ?auto_415480 ) ) ( not ( = ?auto_415479 ?auto_415481 ) ) ( not ( = ?auto_415479 ?auto_415482 ) ) ( not ( = ?auto_415479 ?auto_415483 ) ) ( not ( = ?auto_415479 ?auto_415484 ) ) ( not ( = ?auto_415479 ?auto_415485 ) ) ( not ( = ?auto_415480 ?auto_415481 ) ) ( not ( = ?auto_415480 ?auto_415482 ) ) ( not ( = ?auto_415480 ?auto_415483 ) ) ( not ( = ?auto_415480 ?auto_415484 ) ) ( not ( = ?auto_415480 ?auto_415485 ) ) ( not ( = ?auto_415481 ?auto_415482 ) ) ( not ( = ?auto_415481 ?auto_415483 ) ) ( not ( = ?auto_415481 ?auto_415484 ) ) ( not ( = ?auto_415481 ?auto_415485 ) ) ( not ( = ?auto_415482 ?auto_415483 ) ) ( not ( = ?auto_415482 ?auto_415484 ) ) ( not ( = ?auto_415482 ?auto_415485 ) ) ( not ( = ?auto_415483 ?auto_415484 ) ) ( not ( = ?auto_415483 ?auto_415485 ) ) ( not ( = ?auto_415484 ?auto_415485 ) ) ( ON ?auto_415483 ?auto_415484 ) ( ON ?auto_415482 ?auto_415483 ) ( ON ?auto_415481 ?auto_415482 ) ( ON ?auto_415480 ?auto_415481 ) ( ON ?auto_415479 ?auto_415480 ) ( ON ?auto_415478 ?auto_415479 ) ( ON ?auto_415477 ?auto_415478 ) ( ON ?auto_415476 ?auto_415477 ) ( ON ?auto_415475 ?auto_415476 ) ( CLEAR ?auto_415473 ) ( ON ?auto_415474 ?auto_415475 ) ( CLEAR ?auto_415474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_415473 ?auto_415474 )
      ( MAKE-12PILE ?auto_415473 ?auto_415474 ?auto_415475 ?auto_415476 ?auto_415477 ?auto_415478 ?auto_415479 ?auto_415480 ?auto_415481 ?auto_415482 ?auto_415483 ?auto_415484 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415498 - BLOCK
      ?auto_415499 - BLOCK
      ?auto_415500 - BLOCK
      ?auto_415501 - BLOCK
      ?auto_415502 - BLOCK
      ?auto_415503 - BLOCK
      ?auto_415504 - BLOCK
      ?auto_415505 - BLOCK
      ?auto_415506 - BLOCK
      ?auto_415507 - BLOCK
      ?auto_415508 - BLOCK
      ?auto_415509 - BLOCK
    )
    :vars
    (
      ?auto_415510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415509 ?auto_415510 ) ( not ( = ?auto_415498 ?auto_415499 ) ) ( not ( = ?auto_415498 ?auto_415500 ) ) ( not ( = ?auto_415498 ?auto_415501 ) ) ( not ( = ?auto_415498 ?auto_415502 ) ) ( not ( = ?auto_415498 ?auto_415503 ) ) ( not ( = ?auto_415498 ?auto_415504 ) ) ( not ( = ?auto_415498 ?auto_415505 ) ) ( not ( = ?auto_415498 ?auto_415506 ) ) ( not ( = ?auto_415498 ?auto_415507 ) ) ( not ( = ?auto_415498 ?auto_415508 ) ) ( not ( = ?auto_415498 ?auto_415509 ) ) ( not ( = ?auto_415498 ?auto_415510 ) ) ( not ( = ?auto_415499 ?auto_415500 ) ) ( not ( = ?auto_415499 ?auto_415501 ) ) ( not ( = ?auto_415499 ?auto_415502 ) ) ( not ( = ?auto_415499 ?auto_415503 ) ) ( not ( = ?auto_415499 ?auto_415504 ) ) ( not ( = ?auto_415499 ?auto_415505 ) ) ( not ( = ?auto_415499 ?auto_415506 ) ) ( not ( = ?auto_415499 ?auto_415507 ) ) ( not ( = ?auto_415499 ?auto_415508 ) ) ( not ( = ?auto_415499 ?auto_415509 ) ) ( not ( = ?auto_415499 ?auto_415510 ) ) ( not ( = ?auto_415500 ?auto_415501 ) ) ( not ( = ?auto_415500 ?auto_415502 ) ) ( not ( = ?auto_415500 ?auto_415503 ) ) ( not ( = ?auto_415500 ?auto_415504 ) ) ( not ( = ?auto_415500 ?auto_415505 ) ) ( not ( = ?auto_415500 ?auto_415506 ) ) ( not ( = ?auto_415500 ?auto_415507 ) ) ( not ( = ?auto_415500 ?auto_415508 ) ) ( not ( = ?auto_415500 ?auto_415509 ) ) ( not ( = ?auto_415500 ?auto_415510 ) ) ( not ( = ?auto_415501 ?auto_415502 ) ) ( not ( = ?auto_415501 ?auto_415503 ) ) ( not ( = ?auto_415501 ?auto_415504 ) ) ( not ( = ?auto_415501 ?auto_415505 ) ) ( not ( = ?auto_415501 ?auto_415506 ) ) ( not ( = ?auto_415501 ?auto_415507 ) ) ( not ( = ?auto_415501 ?auto_415508 ) ) ( not ( = ?auto_415501 ?auto_415509 ) ) ( not ( = ?auto_415501 ?auto_415510 ) ) ( not ( = ?auto_415502 ?auto_415503 ) ) ( not ( = ?auto_415502 ?auto_415504 ) ) ( not ( = ?auto_415502 ?auto_415505 ) ) ( not ( = ?auto_415502 ?auto_415506 ) ) ( not ( = ?auto_415502 ?auto_415507 ) ) ( not ( = ?auto_415502 ?auto_415508 ) ) ( not ( = ?auto_415502 ?auto_415509 ) ) ( not ( = ?auto_415502 ?auto_415510 ) ) ( not ( = ?auto_415503 ?auto_415504 ) ) ( not ( = ?auto_415503 ?auto_415505 ) ) ( not ( = ?auto_415503 ?auto_415506 ) ) ( not ( = ?auto_415503 ?auto_415507 ) ) ( not ( = ?auto_415503 ?auto_415508 ) ) ( not ( = ?auto_415503 ?auto_415509 ) ) ( not ( = ?auto_415503 ?auto_415510 ) ) ( not ( = ?auto_415504 ?auto_415505 ) ) ( not ( = ?auto_415504 ?auto_415506 ) ) ( not ( = ?auto_415504 ?auto_415507 ) ) ( not ( = ?auto_415504 ?auto_415508 ) ) ( not ( = ?auto_415504 ?auto_415509 ) ) ( not ( = ?auto_415504 ?auto_415510 ) ) ( not ( = ?auto_415505 ?auto_415506 ) ) ( not ( = ?auto_415505 ?auto_415507 ) ) ( not ( = ?auto_415505 ?auto_415508 ) ) ( not ( = ?auto_415505 ?auto_415509 ) ) ( not ( = ?auto_415505 ?auto_415510 ) ) ( not ( = ?auto_415506 ?auto_415507 ) ) ( not ( = ?auto_415506 ?auto_415508 ) ) ( not ( = ?auto_415506 ?auto_415509 ) ) ( not ( = ?auto_415506 ?auto_415510 ) ) ( not ( = ?auto_415507 ?auto_415508 ) ) ( not ( = ?auto_415507 ?auto_415509 ) ) ( not ( = ?auto_415507 ?auto_415510 ) ) ( not ( = ?auto_415508 ?auto_415509 ) ) ( not ( = ?auto_415508 ?auto_415510 ) ) ( not ( = ?auto_415509 ?auto_415510 ) ) ( ON ?auto_415508 ?auto_415509 ) ( ON ?auto_415507 ?auto_415508 ) ( ON ?auto_415506 ?auto_415507 ) ( ON ?auto_415505 ?auto_415506 ) ( ON ?auto_415504 ?auto_415505 ) ( ON ?auto_415503 ?auto_415504 ) ( ON ?auto_415502 ?auto_415503 ) ( ON ?auto_415501 ?auto_415502 ) ( ON ?auto_415500 ?auto_415501 ) ( ON ?auto_415499 ?auto_415500 ) ( ON ?auto_415498 ?auto_415499 ) ( CLEAR ?auto_415498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_415498 )
      ( MAKE-12PILE ?auto_415498 ?auto_415499 ?auto_415500 ?auto_415501 ?auto_415502 ?auto_415503 ?auto_415504 ?auto_415505 ?auto_415506 ?auto_415507 ?auto_415508 ?auto_415509 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_415523 - BLOCK
      ?auto_415524 - BLOCK
      ?auto_415525 - BLOCK
      ?auto_415526 - BLOCK
      ?auto_415527 - BLOCK
      ?auto_415528 - BLOCK
      ?auto_415529 - BLOCK
      ?auto_415530 - BLOCK
      ?auto_415531 - BLOCK
      ?auto_415532 - BLOCK
      ?auto_415533 - BLOCK
      ?auto_415534 - BLOCK
    )
    :vars
    (
      ?auto_415535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415534 ?auto_415535 ) ( not ( = ?auto_415523 ?auto_415524 ) ) ( not ( = ?auto_415523 ?auto_415525 ) ) ( not ( = ?auto_415523 ?auto_415526 ) ) ( not ( = ?auto_415523 ?auto_415527 ) ) ( not ( = ?auto_415523 ?auto_415528 ) ) ( not ( = ?auto_415523 ?auto_415529 ) ) ( not ( = ?auto_415523 ?auto_415530 ) ) ( not ( = ?auto_415523 ?auto_415531 ) ) ( not ( = ?auto_415523 ?auto_415532 ) ) ( not ( = ?auto_415523 ?auto_415533 ) ) ( not ( = ?auto_415523 ?auto_415534 ) ) ( not ( = ?auto_415523 ?auto_415535 ) ) ( not ( = ?auto_415524 ?auto_415525 ) ) ( not ( = ?auto_415524 ?auto_415526 ) ) ( not ( = ?auto_415524 ?auto_415527 ) ) ( not ( = ?auto_415524 ?auto_415528 ) ) ( not ( = ?auto_415524 ?auto_415529 ) ) ( not ( = ?auto_415524 ?auto_415530 ) ) ( not ( = ?auto_415524 ?auto_415531 ) ) ( not ( = ?auto_415524 ?auto_415532 ) ) ( not ( = ?auto_415524 ?auto_415533 ) ) ( not ( = ?auto_415524 ?auto_415534 ) ) ( not ( = ?auto_415524 ?auto_415535 ) ) ( not ( = ?auto_415525 ?auto_415526 ) ) ( not ( = ?auto_415525 ?auto_415527 ) ) ( not ( = ?auto_415525 ?auto_415528 ) ) ( not ( = ?auto_415525 ?auto_415529 ) ) ( not ( = ?auto_415525 ?auto_415530 ) ) ( not ( = ?auto_415525 ?auto_415531 ) ) ( not ( = ?auto_415525 ?auto_415532 ) ) ( not ( = ?auto_415525 ?auto_415533 ) ) ( not ( = ?auto_415525 ?auto_415534 ) ) ( not ( = ?auto_415525 ?auto_415535 ) ) ( not ( = ?auto_415526 ?auto_415527 ) ) ( not ( = ?auto_415526 ?auto_415528 ) ) ( not ( = ?auto_415526 ?auto_415529 ) ) ( not ( = ?auto_415526 ?auto_415530 ) ) ( not ( = ?auto_415526 ?auto_415531 ) ) ( not ( = ?auto_415526 ?auto_415532 ) ) ( not ( = ?auto_415526 ?auto_415533 ) ) ( not ( = ?auto_415526 ?auto_415534 ) ) ( not ( = ?auto_415526 ?auto_415535 ) ) ( not ( = ?auto_415527 ?auto_415528 ) ) ( not ( = ?auto_415527 ?auto_415529 ) ) ( not ( = ?auto_415527 ?auto_415530 ) ) ( not ( = ?auto_415527 ?auto_415531 ) ) ( not ( = ?auto_415527 ?auto_415532 ) ) ( not ( = ?auto_415527 ?auto_415533 ) ) ( not ( = ?auto_415527 ?auto_415534 ) ) ( not ( = ?auto_415527 ?auto_415535 ) ) ( not ( = ?auto_415528 ?auto_415529 ) ) ( not ( = ?auto_415528 ?auto_415530 ) ) ( not ( = ?auto_415528 ?auto_415531 ) ) ( not ( = ?auto_415528 ?auto_415532 ) ) ( not ( = ?auto_415528 ?auto_415533 ) ) ( not ( = ?auto_415528 ?auto_415534 ) ) ( not ( = ?auto_415528 ?auto_415535 ) ) ( not ( = ?auto_415529 ?auto_415530 ) ) ( not ( = ?auto_415529 ?auto_415531 ) ) ( not ( = ?auto_415529 ?auto_415532 ) ) ( not ( = ?auto_415529 ?auto_415533 ) ) ( not ( = ?auto_415529 ?auto_415534 ) ) ( not ( = ?auto_415529 ?auto_415535 ) ) ( not ( = ?auto_415530 ?auto_415531 ) ) ( not ( = ?auto_415530 ?auto_415532 ) ) ( not ( = ?auto_415530 ?auto_415533 ) ) ( not ( = ?auto_415530 ?auto_415534 ) ) ( not ( = ?auto_415530 ?auto_415535 ) ) ( not ( = ?auto_415531 ?auto_415532 ) ) ( not ( = ?auto_415531 ?auto_415533 ) ) ( not ( = ?auto_415531 ?auto_415534 ) ) ( not ( = ?auto_415531 ?auto_415535 ) ) ( not ( = ?auto_415532 ?auto_415533 ) ) ( not ( = ?auto_415532 ?auto_415534 ) ) ( not ( = ?auto_415532 ?auto_415535 ) ) ( not ( = ?auto_415533 ?auto_415534 ) ) ( not ( = ?auto_415533 ?auto_415535 ) ) ( not ( = ?auto_415534 ?auto_415535 ) ) ( ON ?auto_415533 ?auto_415534 ) ( ON ?auto_415532 ?auto_415533 ) ( ON ?auto_415531 ?auto_415532 ) ( ON ?auto_415530 ?auto_415531 ) ( ON ?auto_415529 ?auto_415530 ) ( ON ?auto_415528 ?auto_415529 ) ( ON ?auto_415527 ?auto_415528 ) ( ON ?auto_415526 ?auto_415527 ) ( ON ?auto_415525 ?auto_415526 ) ( ON ?auto_415524 ?auto_415525 ) ( ON ?auto_415523 ?auto_415524 ) ( CLEAR ?auto_415523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_415523 )
      ( MAKE-12PILE ?auto_415523 ?auto_415524 ?auto_415525 ?auto_415526 ?auto_415527 ?auto_415528 ?auto_415529 ?auto_415530 ?auto_415531 ?auto_415532 ?auto_415533 ?auto_415534 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415549 - BLOCK
      ?auto_415550 - BLOCK
      ?auto_415551 - BLOCK
      ?auto_415552 - BLOCK
      ?auto_415553 - BLOCK
      ?auto_415554 - BLOCK
      ?auto_415555 - BLOCK
      ?auto_415556 - BLOCK
      ?auto_415557 - BLOCK
      ?auto_415558 - BLOCK
      ?auto_415559 - BLOCK
      ?auto_415560 - BLOCK
      ?auto_415561 - BLOCK
    )
    :vars
    (
      ?auto_415562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_415560 ) ( ON ?auto_415561 ?auto_415562 ) ( CLEAR ?auto_415561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_415549 ) ( ON ?auto_415550 ?auto_415549 ) ( ON ?auto_415551 ?auto_415550 ) ( ON ?auto_415552 ?auto_415551 ) ( ON ?auto_415553 ?auto_415552 ) ( ON ?auto_415554 ?auto_415553 ) ( ON ?auto_415555 ?auto_415554 ) ( ON ?auto_415556 ?auto_415555 ) ( ON ?auto_415557 ?auto_415556 ) ( ON ?auto_415558 ?auto_415557 ) ( ON ?auto_415559 ?auto_415558 ) ( ON ?auto_415560 ?auto_415559 ) ( not ( = ?auto_415549 ?auto_415550 ) ) ( not ( = ?auto_415549 ?auto_415551 ) ) ( not ( = ?auto_415549 ?auto_415552 ) ) ( not ( = ?auto_415549 ?auto_415553 ) ) ( not ( = ?auto_415549 ?auto_415554 ) ) ( not ( = ?auto_415549 ?auto_415555 ) ) ( not ( = ?auto_415549 ?auto_415556 ) ) ( not ( = ?auto_415549 ?auto_415557 ) ) ( not ( = ?auto_415549 ?auto_415558 ) ) ( not ( = ?auto_415549 ?auto_415559 ) ) ( not ( = ?auto_415549 ?auto_415560 ) ) ( not ( = ?auto_415549 ?auto_415561 ) ) ( not ( = ?auto_415549 ?auto_415562 ) ) ( not ( = ?auto_415550 ?auto_415551 ) ) ( not ( = ?auto_415550 ?auto_415552 ) ) ( not ( = ?auto_415550 ?auto_415553 ) ) ( not ( = ?auto_415550 ?auto_415554 ) ) ( not ( = ?auto_415550 ?auto_415555 ) ) ( not ( = ?auto_415550 ?auto_415556 ) ) ( not ( = ?auto_415550 ?auto_415557 ) ) ( not ( = ?auto_415550 ?auto_415558 ) ) ( not ( = ?auto_415550 ?auto_415559 ) ) ( not ( = ?auto_415550 ?auto_415560 ) ) ( not ( = ?auto_415550 ?auto_415561 ) ) ( not ( = ?auto_415550 ?auto_415562 ) ) ( not ( = ?auto_415551 ?auto_415552 ) ) ( not ( = ?auto_415551 ?auto_415553 ) ) ( not ( = ?auto_415551 ?auto_415554 ) ) ( not ( = ?auto_415551 ?auto_415555 ) ) ( not ( = ?auto_415551 ?auto_415556 ) ) ( not ( = ?auto_415551 ?auto_415557 ) ) ( not ( = ?auto_415551 ?auto_415558 ) ) ( not ( = ?auto_415551 ?auto_415559 ) ) ( not ( = ?auto_415551 ?auto_415560 ) ) ( not ( = ?auto_415551 ?auto_415561 ) ) ( not ( = ?auto_415551 ?auto_415562 ) ) ( not ( = ?auto_415552 ?auto_415553 ) ) ( not ( = ?auto_415552 ?auto_415554 ) ) ( not ( = ?auto_415552 ?auto_415555 ) ) ( not ( = ?auto_415552 ?auto_415556 ) ) ( not ( = ?auto_415552 ?auto_415557 ) ) ( not ( = ?auto_415552 ?auto_415558 ) ) ( not ( = ?auto_415552 ?auto_415559 ) ) ( not ( = ?auto_415552 ?auto_415560 ) ) ( not ( = ?auto_415552 ?auto_415561 ) ) ( not ( = ?auto_415552 ?auto_415562 ) ) ( not ( = ?auto_415553 ?auto_415554 ) ) ( not ( = ?auto_415553 ?auto_415555 ) ) ( not ( = ?auto_415553 ?auto_415556 ) ) ( not ( = ?auto_415553 ?auto_415557 ) ) ( not ( = ?auto_415553 ?auto_415558 ) ) ( not ( = ?auto_415553 ?auto_415559 ) ) ( not ( = ?auto_415553 ?auto_415560 ) ) ( not ( = ?auto_415553 ?auto_415561 ) ) ( not ( = ?auto_415553 ?auto_415562 ) ) ( not ( = ?auto_415554 ?auto_415555 ) ) ( not ( = ?auto_415554 ?auto_415556 ) ) ( not ( = ?auto_415554 ?auto_415557 ) ) ( not ( = ?auto_415554 ?auto_415558 ) ) ( not ( = ?auto_415554 ?auto_415559 ) ) ( not ( = ?auto_415554 ?auto_415560 ) ) ( not ( = ?auto_415554 ?auto_415561 ) ) ( not ( = ?auto_415554 ?auto_415562 ) ) ( not ( = ?auto_415555 ?auto_415556 ) ) ( not ( = ?auto_415555 ?auto_415557 ) ) ( not ( = ?auto_415555 ?auto_415558 ) ) ( not ( = ?auto_415555 ?auto_415559 ) ) ( not ( = ?auto_415555 ?auto_415560 ) ) ( not ( = ?auto_415555 ?auto_415561 ) ) ( not ( = ?auto_415555 ?auto_415562 ) ) ( not ( = ?auto_415556 ?auto_415557 ) ) ( not ( = ?auto_415556 ?auto_415558 ) ) ( not ( = ?auto_415556 ?auto_415559 ) ) ( not ( = ?auto_415556 ?auto_415560 ) ) ( not ( = ?auto_415556 ?auto_415561 ) ) ( not ( = ?auto_415556 ?auto_415562 ) ) ( not ( = ?auto_415557 ?auto_415558 ) ) ( not ( = ?auto_415557 ?auto_415559 ) ) ( not ( = ?auto_415557 ?auto_415560 ) ) ( not ( = ?auto_415557 ?auto_415561 ) ) ( not ( = ?auto_415557 ?auto_415562 ) ) ( not ( = ?auto_415558 ?auto_415559 ) ) ( not ( = ?auto_415558 ?auto_415560 ) ) ( not ( = ?auto_415558 ?auto_415561 ) ) ( not ( = ?auto_415558 ?auto_415562 ) ) ( not ( = ?auto_415559 ?auto_415560 ) ) ( not ( = ?auto_415559 ?auto_415561 ) ) ( not ( = ?auto_415559 ?auto_415562 ) ) ( not ( = ?auto_415560 ?auto_415561 ) ) ( not ( = ?auto_415560 ?auto_415562 ) ) ( not ( = ?auto_415561 ?auto_415562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_415561 ?auto_415562 )
      ( !STACK ?auto_415561 ?auto_415560 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415576 - BLOCK
      ?auto_415577 - BLOCK
      ?auto_415578 - BLOCK
      ?auto_415579 - BLOCK
      ?auto_415580 - BLOCK
      ?auto_415581 - BLOCK
      ?auto_415582 - BLOCK
      ?auto_415583 - BLOCK
      ?auto_415584 - BLOCK
      ?auto_415585 - BLOCK
      ?auto_415586 - BLOCK
      ?auto_415587 - BLOCK
      ?auto_415588 - BLOCK
    )
    :vars
    (
      ?auto_415589 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_415587 ) ( ON ?auto_415588 ?auto_415589 ) ( CLEAR ?auto_415588 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_415576 ) ( ON ?auto_415577 ?auto_415576 ) ( ON ?auto_415578 ?auto_415577 ) ( ON ?auto_415579 ?auto_415578 ) ( ON ?auto_415580 ?auto_415579 ) ( ON ?auto_415581 ?auto_415580 ) ( ON ?auto_415582 ?auto_415581 ) ( ON ?auto_415583 ?auto_415582 ) ( ON ?auto_415584 ?auto_415583 ) ( ON ?auto_415585 ?auto_415584 ) ( ON ?auto_415586 ?auto_415585 ) ( ON ?auto_415587 ?auto_415586 ) ( not ( = ?auto_415576 ?auto_415577 ) ) ( not ( = ?auto_415576 ?auto_415578 ) ) ( not ( = ?auto_415576 ?auto_415579 ) ) ( not ( = ?auto_415576 ?auto_415580 ) ) ( not ( = ?auto_415576 ?auto_415581 ) ) ( not ( = ?auto_415576 ?auto_415582 ) ) ( not ( = ?auto_415576 ?auto_415583 ) ) ( not ( = ?auto_415576 ?auto_415584 ) ) ( not ( = ?auto_415576 ?auto_415585 ) ) ( not ( = ?auto_415576 ?auto_415586 ) ) ( not ( = ?auto_415576 ?auto_415587 ) ) ( not ( = ?auto_415576 ?auto_415588 ) ) ( not ( = ?auto_415576 ?auto_415589 ) ) ( not ( = ?auto_415577 ?auto_415578 ) ) ( not ( = ?auto_415577 ?auto_415579 ) ) ( not ( = ?auto_415577 ?auto_415580 ) ) ( not ( = ?auto_415577 ?auto_415581 ) ) ( not ( = ?auto_415577 ?auto_415582 ) ) ( not ( = ?auto_415577 ?auto_415583 ) ) ( not ( = ?auto_415577 ?auto_415584 ) ) ( not ( = ?auto_415577 ?auto_415585 ) ) ( not ( = ?auto_415577 ?auto_415586 ) ) ( not ( = ?auto_415577 ?auto_415587 ) ) ( not ( = ?auto_415577 ?auto_415588 ) ) ( not ( = ?auto_415577 ?auto_415589 ) ) ( not ( = ?auto_415578 ?auto_415579 ) ) ( not ( = ?auto_415578 ?auto_415580 ) ) ( not ( = ?auto_415578 ?auto_415581 ) ) ( not ( = ?auto_415578 ?auto_415582 ) ) ( not ( = ?auto_415578 ?auto_415583 ) ) ( not ( = ?auto_415578 ?auto_415584 ) ) ( not ( = ?auto_415578 ?auto_415585 ) ) ( not ( = ?auto_415578 ?auto_415586 ) ) ( not ( = ?auto_415578 ?auto_415587 ) ) ( not ( = ?auto_415578 ?auto_415588 ) ) ( not ( = ?auto_415578 ?auto_415589 ) ) ( not ( = ?auto_415579 ?auto_415580 ) ) ( not ( = ?auto_415579 ?auto_415581 ) ) ( not ( = ?auto_415579 ?auto_415582 ) ) ( not ( = ?auto_415579 ?auto_415583 ) ) ( not ( = ?auto_415579 ?auto_415584 ) ) ( not ( = ?auto_415579 ?auto_415585 ) ) ( not ( = ?auto_415579 ?auto_415586 ) ) ( not ( = ?auto_415579 ?auto_415587 ) ) ( not ( = ?auto_415579 ?auto_415588 ) ) ( not ( = ?auto_415579 ?auto_415589 ) ) ( not ( = ?auto_415580 ?auto_415581 ) ) ( not ( = ?auto_415580 ?auto_415582 ) ) ( not ( = ?auto_415580 ?auto_415583 ) ) ( not ( = ?auto_415580 ?auto_415584 ) ) ( not ( = ?auto_415580 ?auto_415585 ) ) ( not ( = ?auto_415580 ?auto_415586 ) ) ( not ( = ?auto_415580 ?auto_415587 ) ) ( not ( = ?auto_415580 ?auto_415588 ) ) ( not ( = ?auto_415580 ?auto_415589 ) ) ( not ( = ?auto_415581 ?auto_415582 ) ) ( not ( = ?auto_415581 ?auto_415583 ) ) ( not ( = ?auto_415581 ?auto_415584 ) ) ( not ( = ?auto_415581 ?auto_415585 ) ) ( not ( = ?auto_415581 ?auto_415586 ) ) ( not ( = ?auto_415581 ?auto_415587 ) ) ( not ( = ?auto_415581 ?auto_415588 ) ) ( not ( = ?auto_415581 ?auto_415589 ) ) ( not ( = ?auto_415582 ?auto_415583 ) ) ( not ( = ?auto_415582 ?auto_415584 ) ) ( not ( = ?auto_415582 ?auto_415585 ) ) ( not ( = ?auto_415582 ?auto_415586 ) ) ( not ( = ?auto_415582 ?auto_415587 ) ) ( not ( = ?auto_415582 ?auto_415588 ) ) ( not ( = ?auto_415582 ?auto_415589 ) ) ( not ( = ?auto_415583 ?auto_415584 ) ) ( not ( = ?auto_415583 ?auto_415585 ) ) ( not ( = ?auto_415583 ?auto_415586 ) ) ( not ( = ?auto_415583 ?auto_415587 ) ) ( not ( = ?auto_415583 ?auto_415588 ) ) ( not ( = ?auto_415583 ?auto_415589 ) ) ( not ( = ?auto_415584 ?auto_415585 ) ) ( not ( = ?auto_415584 ?auto_415586 ) ) ( not ( = ?auto_415584 ?auto_415587 ) ) ( not ( = ?auto_415584 ?auto_415588 ) ) ( not ( = ?auto_415584 ?auto_415589 ) ) ( not ( = ?auto_415585 ?auto_415586 ) ) ( not ( = ?auto_415585 ?auto_415587 ) ) ( not ( = ?auto_415585 ?auto_415588 ) ) ( not ( = ?auto_415585 ?auto_415589 ) ) ( not ( = ?auto_415586 ?auto_415587 ) ) ( not ( = ?auto_415586 ?auto_415588 ) ) ( not ( = ?auto_415586 ?auto_415589 ) ) ( not ( = ?auto_415587 ?auto_415588 ) ) ( not ( = ?auto_415587 ?auto_415589 ) ) ( not ( = ?auto_415588 ?auto_415589 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_415588 ?auto_415589 )
      ( !STACK ?auto_415588 ?auto_415587 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415603 - BLOCK
      ?auto_415604 - BLOCK
      ?auto_415605 - BLOCK
      ?auto_415606 - BLOCK
      ?auto_415607 - BLOCK
      ?auto_415608 - BLOCK
      ?auto_415609 - BLOCK
      ?auto_415610 - BLOCK
      ?auto_415611 - BLOCK
      ?auto_415612 - BLOCK
      ?auto_415613 - BLOCK
      ?auto_415614 - BLOCK
      ?auto_415615 - BLOCK
    )
    :vars
    (
      ?auto_415616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415615 ?auto_415616 ) ( ON-TABLE ?auto_415603 ) ( ON ?auto_415604 ?auto_415603 ) ( ON ?auto_415605 ?auto_415604 ) ( ON ?auto_415606 ?auto_415605 ) ( ON ?auto_415607 ?auto_415606 ) ( ON ?auto_415608 ?auto_415607 ) ( ON ?auto_415609 ?auto_415608 ) ( ON ?auto_415610 ?auto_415609 ) ( ON ?auto_415611 ?auto_415610 ) ( ON ?auto_415612 ?auto_415611 ) ( ON ?auto_415613 ?auto_415612 ) ( not ( = ?auto_415603 ?auto_415604 ) ) ( not ( = ?auto_415603 ?auto_415605 ) ) ( not ( = ?auto_415603 ?auto_415606 ) ) ( not ( = ?auto_415603 ?auto_415607 ) ) ( not ( = ?auto_415603 ?auto_415608 ) ) ( not ( = ?auto_415603 ?auto_415609 ) ) ( not ( = ?auto_415603 ?auto_415610 ) ) ( not ( = ?auto_415603 ?auto_415611 ) ) ( not ( = ?auto_415603 ?auto_415612 ) ) ( not ( = ?auto_415603 ?auto_415613 ) ) ( not ( = ?auto_415603 ?auto_415614 ) ) ( not ( = ?auto_415603 ?auto_415615 ) ) ( not ( = ?auto_415603 ?auto_415616 ) ) ( not ( = ?auto_415604 ?auto_415605 ) ) ( not ( = ?auto_415604 ?auto_415606 ) ) ( not ( = ?auto_415604 ?auto_415607 ) ) ( not ( = ?auto_415604 ?auto_415608 ) ) ( not ( = ?auto_415604 ?auto_415609 ) ) ( not ( = ?auto_415604 ?auto_415610 ) ) ( not ( = ?auto_415604 ?auto_415611 ) ) ( not ( = ?auto_415604 ?auto_415612 ) ) ( not ( = ?auto_415604 ?auto_415613 ) ) ( not ( = ?auto_415604 ?auto_415614 ) ) ( not ( = ?auto_415604 ?auto_415615 ) ) ( not ( = ?auto_415604 ?auto_415616 ) ) ( not ( = ?auto_415605 ?auto_415606 ) ) ( not ( = ?auto_415605 ?auto_415607 ) ) ( not ( = ?auto_415605 ?auto_415608 ) ) ( not ( = ?auto_415605 ?auto_415609 ) ) ( not ( = ?auto_415605 ?auto_415610 ) ) ( not ( = ?auto_415605 ?auto_415611 ) ) ( not ( = ?auto_415605 ?auto_415612 ) ) ( not ( = ?auto_415605 ?auto_415613 ) ) ( not ( = ?auto_415605 ?auto_415614 ) ) ( not ( = ?auto_415605 ?auto_415615 ) ) ( not ( = ?auto_415605 ?auto_415616 ) ) ( not ( = ?auto_415606 ?auto_415607 ) ) ( not ( = ?auto_415606 ?auto_415608 ) ) ( not ( = ?auto_415606 ?auto_415609 ) ) ( not ( = ?auto_415606 ?auto_415610 ) ) ( not ( = ?auto_415606 ?auto_415611 ) ) ( not ( = ?auto_415606 ?auto_415612 ) ) ( not ( = ?auto_415606 ?auto_415613 ) ) ( not ( = ?auto_415606 ?auto_415614 ) ) ( not ( = ?auto_415606 ?auto_415615 ) ) ( not ( = ?auto_415606 ?auto_415616 ) ) ( not ( = ?auto_415607 ?auto_415608 ) ) ( not ( = ?auto_415607 ?auto_415609 ) ) ( not ( = ?auto_415607 ?auto_415610 ) ) ( not ( = ?auto_415607 ?auto_415611 ) ) ( not ( = ?auto_415607 ?auto_415612 ) ) ( not ( = ?auto_415607 ?auto_415613 ) ) ( not ( = ?auto_415607 ?auto_415614 ) ) ( not ( = ?auto_415607 ?auto_415615 ) ) ( not ( = ?auto_415607 ?auto_415616 ) ) ( not ( = ?auto_415608 ?auto_415609 ) ) ( not ( = ?auto_415608 ?auto_415610 ) ) ( not ( = ?auto_415608 ?auto_415611 ) ) ( not ( = ?auto_415608 ?auto_415612 ) ) ( not ( = ?auto_415608 ?auto_415613 ) ) ( not ( = ?auto_415608 ?auto_415614 ) ) ( not ( = ?auto_415608 ?auto_415615 ) ) ( not ( = ?auto_415608 ?auto_415616 ) ) ( not ( = ?auto_415609 ?auto_415610 ) ) ( not ( = ?auto_415609 ?auto_415611 ) ) ( not ( = ?auto_415609 ?auto_415612 ) ) ( not ( = ?auto_415609 ?auto_415613 ) ) ( not ( = ?auto_415609 ?auto_415614 ) ) ( not ( = ?auto_415609 ?auto_415615 ) ) ( not ( = ?auto_415609 ?auto_415616 ) ) ( not ( = ?auto_415610 ?auto_415611 ) ) ( not ( = ?auto_415610 ?auto_415612 ) ) ( not ( = ?auto_415610 ?auto_415613 ) ) ( not ( = ?auto_415610 ?auto_415614 ) ) ( not ( = ?auto_415610 ?auto_415615 ) ) ( not ( = ?auto_415610 ?auto_415616 ) ) ( not ( = ?auto_415611 ?auto_415612 ) ) ( not ( = ?auto_415611 ?auto_415613 ) ) ( not ( = ?auto_415611 ?auto_415614 ) ) ( not ( = ?auto_415611 ?auto_415615 ) ) ( not ( = ?auto_415611 ?auto_415616 ) ) ( not ( = ?auto_415612 ?auto_415613 ) ) ( not ( = ?auto_415612 ?auto_415614 ) ) ( not ( = ?auto_415612 ?auto_415615 ) ) ( not ( = ?auto_415612 ?auto_415616 ) ) ( not ( = ?auto_415613 ?auto_415614 ) ) ( not ( = ?auto_415613 ?auto_415615 ) ) ( not ( = ?auto_415613 ?auto_415616 ) ) ( not ( = ?auto_415614 ?auto_415615 ) ) ( not ( = ?auto_415614 ?auto_415616 ) ) ( not ( = ?auto_415615 ?auto_415616 ) ) ( CLEAR ?auto_415613 ) ( ON ?auto_415614 ?auto_415615 ) ( CLEAR ?auto_415614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_415603 ?auto_415604 ?auto_415605 ?auto_415606 ?auto_415607 ?auto_415608 ?auto_415609 ?auto_415610 ?auto_415611 ?auto_415612 ?auto_415613 ?auto_415614 )
      ( MAKE-13PILE ?auto_415603 ?auto_415604 ?auto_415605 ?auto_415606 ?auto_415607 ?auto_415608 ?auto_415609 ?auto_415610 ?auto_415611 ?auto_415612 ?auto_415613 ?auto_415614 ?auto_415615 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415630 - BLOCK
      ?auto_415631 - BLOCK
      ?auto_415632 - BLOCK
      ?auto_415633 - BLOCK
      ?auto_415634 - BLOCK
      ?auto_415635 - BLOCK
      ?auto_415636 - BLOCK
      ?auto_415637 - BLOCK
      ?auto_415638 - BLOCK
      ?auto_415639 - BLOCK
      ?auto_415640 - BLOCK
      ?auto_415641 - BLOCK
      ?auto_415642 - BLOCK
    )
    :vars
    (
      ?auto_415643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415642 ?auto_415643 ) ( ON-TABLE ?auto_415630 ) ( ON ?auto_415631 ?auto_415630 ) ( ON ?auto_415632 ?auto_415631 ) ( ON ?auto_415633 ?auto_415632 ) ( ON ?auto_415634 ?auto_415633 ) ( ON ?auto_415635 ?auto_415634 ) ( ON ?auto_415636 ?auto_415635 ) ( ON ?auto_415637 ?auto_415636 ) ( ON ?auto_415638 ?auto_415637 ) ( ON ?auto_415639 ?auto_415638 ) ( ON ?auto_415640 ?auto_415639 ) ( not ( = ?auto_415630 ?auto_415631 ) ) ( not ( = ?auto_415630 ?auto_415632 ) ) ( not ( = ?auto_415630 ?auto_415633 ) ) ( not ( = ?auto_415630 ?auto_415634 ) ) ( not ( = ?auto_415630 ?auto_415635 ) ) ( not ( = ?auto_415630 ?auto_415636 ) ) ( not ( = ?auto_415630 ?auto_415637 ) ) ( not ( = ?auto_415630 ?auto_415638 ) ) ( not ( = ?auto_415630 ?auto_415639 ) ) ( not ( = ?auto_415630 ?auto_415640 ) ) ( not ( = ?auto_415630 ?auto_415641 ) ) ( not ( = ?auto_415630 ?auto_415642 ) ) ( not ( = ?auto_415630 ?auto_415643 ) ) ( not ( = ?auto_415631 ?auto_415632 ) ) ( not ( = ?auto_415631 ?auto_415633 ) ) ( not ( = ?auto_415631 ?auto_415634 ) ) ( not ( = ?auto_415631 ?auto_415635 ) ) ( not ( = ?auto_415631 ?auto_415636 ) ) ( not ( = ?auto_415631 ?auto_415637 ) ) ( not ( = ?auto_415631 ?auto_415638 ) ) ( not ( = ?auto_415631 ?auto_415639 ) ) ( not ( = ?auto_415631 ?auto_415640 ) ) ( not ( = ?auto_415631 ?auto_415641 ) ) ( not ( = ?auto_415631 ?auto_415642 ) ) ( not ( = ?auto_415631 ?auto_415643 ) ) ( not ( = ?auto_415632 ?auto_415633 ) ) ( not ( = ?auto_415632 ?auto_415634 ) ) ( not ( = ?auto_415632 ?auto_415635 ) ) ( not ( = ?auto_415632 ?auto_415636 ) ) ( not ( = ?auto_415632 ?auto_415637 ) ) ( not ( = ?auto_415632 ?auto_415638 ) ) ( not ( = ?auto_415632 ?auto_415639 ) ) ( not ( = ?auto_415632 ?auto_415640 ) ) ( not ( = ?auto_415632 ?auto_415641 ) ) ( not ( = ?auto_415632 ?auto_415642 ) ) ( not ( = ?auto_415632 ?auto_415643 ) ) ( not ( = ?auto_415633 ?auto_415634 ) ) ( not ( = ?auto_415633 ?auto_415635 ) ) ( not ( = ?auto_415633 ?auto_415636 ) ) ( not ( = ?auto_415633 ?auto_415637 ) ) ( not ( = ?auto_415633 ?auto_415638 ) ) ( not ( = ?auto_415633 ?auto_415639 ) ) ( not ( = ?auto_415633 ?auto_415640 ) ) ( not ( = ?auto_415633 ?auto_415641 ) ) ( not ( = ?auto_415633 ?auto_415642 ) ) ( not ( = ?auto_415633 ?auto_415643 ) ) ( not ( = ?auto_415634 ?auto_415635 ) ) ( not ( = ?auto_415634 ?auto_415636 ) ) ( not ( = ?auto_415634 ?auto_415637 ) ) ( not ( = ?auto_415634 ?auto_415638 ) ) ( not ( = ?auto_415634 ?auto_415639 ) ) ( not ( = ?auto_415634 ?auto_415640 ) ) ( not ( = ?auto_415634 ?auto_415641 ) ) ( not ( = ?auto_415634 ?auto_415642 ) ) ( not ( = ?auto_415634 ?auto_415643 ) ) ( not ( = ?auto_415635 ?auto_415636 ) ) ( not ( = ?auto_415635 ?auto_415637 ) ) ( not ( = ?auto_415635 ?auto_415638 ) ) ( not ( = ?auto_415635 ?auto_415639 ) ) ( not ( = ?auto_415635 ?auto_415640 ) ) ( not ( = ?auto_415635 ?auto_415641 ) ) ( not ( = ?auto_415635 ?auto_415642 ) ) ( not ( = ?auto_415635 ?auto_415643 ) ) ( not ( = ?auto_415636 ?auto_415637 ) ) ( not ( = ?auto_415636 ?auto_415638 ) ) ( not ( = ?auto_415636 ?auto_415639 ) ) ( not ( = ?auto_415636 ?auto_415640 ) ) ( not ( = ?auto_415636 ?auto_415641 ) ) ( not ( = ?auto_415636 ?auto_415642 ) ) ( not ( = ?auto_415636 ?auto_415643 ) ) ( not ( = ?auto_415637 ?auto_415638 ) ) ( not ( = ?auto_415637 ?auto_415639 ) ) ( not ( = ?auto_415637 ?auto_415640 ) ) ( not ( = ?auto_415637 ?auto_415641 ) ) ( not ( = ?auto_415637 ?auto_415642 ) ) ( not ( = ?auto_415637 ?auto_415643 ) ) ( not ( = ?auto_415638 ?auto_415639 ) ) ( not ( = ?auto_415638 ?auto_415640 ) ) ( not ( = ?auto_415638 ?auto_415641 ) ) ( not ( = ?auto_415638 ?auto_415642 ) ) ( not ( = ?auto_415638 ?auto_415643 ) ) ( not ( = ?auto_415639 ?auto_415640 ) ) ( not ( = ?auto_415639 ?auto_415641 ) ) ( not ( = ?auto_415639 ?auto_415642 ) ) ( not ( = ?auto_415639 ?auto_415643 ) ) ( not ( = ?auto_415640 ?auto_415641 ) ) ( not ( = ?auto_415640 ?auto_415642 ) ) ( not ( = ?auto_415640 ?auto_415643 ) ) ( not ( = ?auto_415641 ?auto_415642 ) ) ( not ( = ?auto_415641 ?auto_415643 ) ) ( not ( = ?auto_415642 ?auto_415643 ) ) ( CLEAR ?auto_415640 ) ( ON ?auto_415641 ?auto_415642 ) ( CLEAR ?auto_415641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_415630 ?auto_415631 ?auto_415632 ?auto_415633 ?auto_415634 ?auto_415635 ?auto_415636 ?auto_415637 ?auto_415638 ?auto_415639 ?auto_415640 ?auto_415641 )
      ( MAKE-13PILE ?auto_415630 ?auto_415631 ?auto_415632 ?auto_415633 ?auto_415634 ?auto_415635 ?auto_415636 ?auto_415637 ?auto_415638 ?auto_415639 ?auto_415640 ?auto_415641 ?auto_415642 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415657 - BLOCK
      ?auto_415658 - BLOCK
      ?auto_415659 - BLOCK
      ?auto_415660 - BLOCK
      ?auto_415661 - BLOCK
      ?auto_415662 - BLOCK
      ?auto_415663 - BLOCK
      ?auto_415664 - BLOCK
      ?auto_415665 - BLOCK
      ?auto_415666 - BLOCK
      ?auto_415667 - BLOCK
      ?auto_415668 - BLOCK
      ?auto_415669 - BLOCK
    )
    :vars
    (
      ?auto_415670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415669 ?auto_415670 ) ( ON-TABLE ?auto_415657 ) ( ON ?auto_415658 ?auto_415657 ) ( ON ?auto_415659 ?auto_415658 ) ( ON ?auto_415660 ?auto_415659 ) ( ON ?auto_415661 ?auto_415660 ) ( ON ?auto_415662 ?auto_415661 ) ( ON ?auto_415663 ?auto_415662 ) ( ON ?auto_415664 ?auto_415663 ) ( ON ?auto_415665 ?auto_415664 ) ( ON ?auto_415666 ?auto_415665 ) ( not ( = ?auto_415657 ?auto_415658 ) ) ( not ( = ?auto_415657 ?auto_415659 ) ) ( not ( = ?auto_415657 ?auto_415660 ) ) ( not ( = ?auto_415657 ?auto_415661 ) ) ( not ( = ?auto_415657 ?auto_415662 ) ) ( not ( = ?auto_415657 ?auto_415663 ) ) ( not ( = ?auto_415657 ?auto_415664 ) ) ( not ( = ?auto_415657 ?auto_415665 ) ) ( not ( = ?auto_415657 ?auto_415666 ) ) ( not ( = ?auto_415657 ?auto_415667 ) ) ( not ( = ?auto_415657 ?auto_415668 ) ) ( not ( = ?auto_415657 ?auto_415669 ) ) ( not ( = ?auto_415657 ?auto_415670 ) ) ( not ( = ?auto_415658 ?auto_415659 ) ) ( not ( = ?auto_415658 ?auto_415660 ) ) ( not ( = ?auto_415658 ?auto_415661 ) ) ( not ( = ?auto_415658 ?auto_415662 ) ) ( not ( = ?auto_415658 ?auto_415663 ) ) ( not ( = ?auto_415658 ?auto_415664 ) ) ( not ( = ?auto_415658 ?auto_415665 ) ) ( not ( = ?auto_415658 ?auto_415666 ) ) ( not ( = ?auto_415658 ?auto_415667 ) ) ( not ( = ?auto_415658 ?auto_415668 ) ) ( not ( = ?auto_415658 ?auto_415669 ) ) ( not ( = ?auto_415658 ?auto_415670 ) ) ( not ( = ?auto_415659 ?auto_415660 ) ) ( not ( = ?auto_415659 ?auto_415661 ) ) ( not ( = ?auto_415659 ?auto_415662 ) ) ( not ( = ?auto_415659 ?auto_415663 ) ) ( not ( = ?auto_415659 ?auto_415664 ) ) ( not ( = ?auto_415659 ?auto_415665 ) ) ( not ( = ?auto_415659 ?auto_415666 ) ) ( not ( = ?auto_415659 ?auto_415667 ) ) ( not ( = ?auto_415659 ?auto_415668 ) ) ( not ( = ?auto_415659 ?auto_415669 ) ) ( not ( = ?auto_415659 ?auto_415670 ) ) ( not ( = ?auto_415660 ?auto_415661 ) ) ( not ( = ?auto_415660 ?auto_415662 ) ) ( not ( = ?auto_415660 ?auto_415663 ) ) ( not ( = ?auto_415660 ?auto_415664 ) ) ( not ( = ?auto_415660 ?auto_415665 ) ) ( not ( = ?auto_415660 ?auto_415666 ) ) ( not ( = ?auto_415660 ?auto_415667 ) ) ( not ( = ?auto_415660 ?auto_415668 ) ) ( not ( = ?auto_415660 ?auto_415669 ) ) ( not ( = ?auto_415660 ?auto_415670 ) ) ( not ( = ?auto_415661 ?auto_415662 ) ) ( not ( = ?auto_415661 ?auto_415663 ) ) ( not ( = ?auto_415661 ?auto_415664 ) ) ( not ( = ?auto_415661 ?auto_415665 ) ) ( not ( = ?auto_415661 ?auto_415666 ) ) ( not ( = ?auto_415661 ?auto_415667 ) ) ( not ( = ?auto_415661 ?auto_415668 ) ) ( not ( = ?auto_415661 ?auto_415669 ) ) ( not ( = ?auto_415661 ?auto_415670 ) ) ( not ( = ?auto_415662 ?auto_415663 ) ) ( not ( = ?auto_415662 ?auto_415664 ) ) ( not ( = ?auto_415662 ?auto_415665 ) ) ( not ( = ?auto_415662 ?auto_415666 ) ) ( not ( = ?auto_415662 ?auto_415667 ) ) ( not ( = ?auto_415662 ?auto_415668 ) ) ( not ( = ?auto_415662 ?auto_415669 ) ) ( not ( = ?auto_415662 ?auto_415670 ) ) ( not ( = ?auto_415663 ?auto_415664 ) ) ( not ( = ?auto_415663 ?auto_415665 ) ) ( not ( = ?auto_415663 ?auto_415666 ) ) ( not ( = ?auto_415663 ?auto_415667 ) ) ( not ( = ?auto_415663 ?auto_415668 ) ) ( not ( = ?auto_415663 ?auto_415669 ) ) ( not ( = ?auto_415663 ?auto_415670 ) ) ( not ( = ?auto_415664 ?auto_415665 ) ) ( not ( = ?auto_415664 ?auto_415666 ) ) ( not ( = ?auto_415664 ?auto_415667 ) ) ( not ( = ?auto_415664 ?auto_415668 ) ) ( not ( = ?auto_415664 ?auto_415669 ) ) ( not ( = ?auto_415664 ?auto_415670 ) ) ( not ( = ?auto_415665 ?auto_415666 ) ) ( not ( = ?auto_415665 ?auto_415667 ) ) ( not ( = ?auto_415665 ?auto_415668 ) ) ( not ( = ?auto_415665 ?auto_415669 ) ) ( not ( = ?auto_415665 ?auto_415670 ) ) ( not ( = ?auto_415666 ?auto_415667 ) ) ( not ( = ?auto_415666 ?auto_415668 ) ) ( not ( = ?auto_415666 ?auto_415669 ) ) ( not ( = ?auto_415666 ?auto_415670 ) ) ( not ( = ?auto_415667 ?auto_415668 ) ) ( not ( = ?auto_415667 ?auto_415669 ) ) ( not ( = ?auto_415667 ?auto_415670 ) ) ( not ( = ?auto_415668 ?auto_415669 ) ) ( not ( = ?auto_415668 ?auto_415670 ) ) ( not ( = ?auto_415669 ?auto_415670 ) ) ( ON ?auto_415668 ?auto_415669 ) ( CLEAR ?auto_415666 ) ( ON ?auto_415667 ?auto_415668 ) ( CLEAR ?auto_415667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_415657 ?auto_415658 ?auto_415659 ?auto_415660 ?auto_415661 ?auto_415662 ?auto_415663 ?auto_415664 ?auto_415665 ?auto_415666 ?auto_415667 )
      ( MAKE-13PILE ?auto_415657 ?auto_415658 ?auto_415659 ?auto_415660 ?auto_415661 ?auto_415662 ?auto_415663 ?auto_415664 ?auto_415665 ?auto_415666 ?auto_415667 ?auto_415668 ?auto_415669 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415684 - BLOCK
      ?auto_415685 - BLOCK
      ?auto_415686 - BLOCK
      ?auto_415687 - BLOCK
      ?auto_415688 - BLOCK
      ?auto_415689 - BLOCK
      ?auto_415690 - BLOCK
      ?auto_415691 - BLOCK
      ?auto_415692 - BLOCK
      ?auto_415693 - BLOCK
      ?auto_415694 - BLOCK
      ?auto_415695 - BLOCK
      ?auto_415696 - BLOCK
    )
    :vars
    (
      ?auto_415697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415696 ?auto_415697 ) ( ON-TABLE ?auto_415684 ) ( ON ?auto_415685 ?auto_415684 ) ( ON ?auto_415686 ?auto_415685 ) ( ON ?auto_415687 ?auto_415686 ) ( ON ?auto_415688 ?auto_415687 ) ( ON ?auto_415689 ?auto_415688 ) ( ON ?auto_415690 ?auto_415689 ) ( ON ?auto_415691 ?auto_415690 ) ( ON ?auto_415692 ?auto_415691 ) ( ON ?auto_415693 ?auto_415692 ) ( not ( = ?auto_415684 ?auto_415685 ) ) ( not ( = ?auto_415684 ?auto_415686 ) ) ( not ( = ?auto_415684 ?auto_415687 ) ) ( not ( = ?auto_415684 ?auto_415688 ) ) ( not ( = ?auto_415684 ?auto_415689 ) ) ( not ( = ?auto_415684 ?auto_415690 ) ) ( not ( = ?auto_415684 ?auto_415691 ) ) ( not ( = ?auto_415684 ?auto_415692 ) ) ( not ( = ?auto_415684 ?auto_415693 ) ) ( not ( = ?auto_415684 ?auto_415694 ) ) ( not ( = ?auto_415684 ?auto_415695 ) ) ( not ( = ?auto_415684 ?auto_415696 ) ) ( not ( = ?auto_415684 ?auto_415697 ) ) ( not ( = ?auto_415685 ?auto_415686 ) ) ( not ( = ?auto_415685 ?auto_415687 ) ) ( not ( = ?auto_415685 ?auto_415688 ) ) ( not ( = ?auto_415685 ?auto_415689 ) ) ( not ( = ?auto_415685 ?auto_415690 ) ) ( not ( = ?auto_415685 ?auto_415691 ) ) ( not ( = ?auto_415685 ?auto_415692 ) ) ( not ( = ?auto_415685 ?auto_415693 ) ) ( not ( = ?auto_415685 ?auto_415694 ) ) ( not ( = ?auto_415685 ?auto_415695 ) ) ( not ( = ?auto_415685 ?auto_415696 ) ) ( not ( = ?auto_415685 ?auto_415697 ) ) ( not ( = ?auto_415686 ?auto_415687 ) ) ( not ( = ?auto_415686 ?auto_415688 ) ) ( not ( = ?auto_415686 ?auto_415689 ) ) ( not ( = ?auto_415686 ?auto_415690 ) ) ( not ( = ?auto_415686 ?auto_415691 ) ) ( not ( = ?auto_415686 ?auto_415692 ) ) ( not ( = ?auto_415686 ?auto_415693 ) ) ( not ( = ?auto_415686 ?auto_415694 ) ) ( not ( = ?auto_415686 ?auto_415695 ) ) ( not ( = ?auto_415686 ?auto_415696 ) ) ( not ( = ?auto_415686 ?auto_415697 ) ) ( not ( = ?auto_415687 ?auto_415688 ) ) ( not ( = ?auto_415687 ?auto_415689 ) ) ( not ( = ?auto_415687 ?auto_415690 ) ) ( not ( = ?auto_415687 ?auto_415691 ) ) ( not ( = ?auto_415687 ?auto_415692 ) ) ( not ( = ?auto_415687 ?auto_415693 ) ) ( not ( = ?auto_415687 ?auto_415694 ) ) ( not ( = ?auto_415687 ?auto_415695 ) ) ( not ( = ?auto_415687 ?auto_415696 ) ) ( not ( = ?auto_415687 ?auto_415697 ) ) ( not ( = ?auto_415688 ?auto_415689 ) ) ( not ( = ?auto_415688 ?auto_415690 ) ) ( not ( = ?auto_415688 ?auto_415691 ) ) ( not ( = ?auto_415688 ?auto_415692 ) ) ( not ( = ?auto_415688 ?auto_415693 ) ) ( not ( = ?auto_415688 ?auto_415694 ) ) ( not ( = ?auto_415688 ?auto_415695 ) ) ( not ( = ?auto_415688 ?auto_415696 ) ) ( not ( = ?auto_415688 ?auto_415697 ) ) ( not ( = ?auto_415689 ?auto_415690 ) ) ( not ( = ?auto_415689 ?auto_415691 ) ) ( not ( = ?auto_415689 ?auto_415692 ) ) ( not ( = ?auto_415689 ?auto_415693 ) ) ( not ( = ?auto_415689 ?auto_415694 ) ) ( not ( = ?auto_415689 ?auto_415695 ) ) ( not ( = ?auto_415689 ?auto_415696 ) ) ( not ( = ?auto_415689 ?auto_415697 ) ) ( not ( = ?auto_415690 ?auto_415691 ) ) ( not ( = ?auto_415690 ?auto_415692 ) ) ( not ( = ?auto_415690 ?auto_415693 ) ) ( not ( = ?auto_415690 ?auto_415694 ) ) ( not ( = ?auto_415690 ?auto_415695 ) ) ( not ( = ?auto_415690 ?auto_415696 ) ) ( not ( = ?auto_415690 ?auto_415697 ) ) ( not ( = ?auto_415691 ?auto_415692 ) ) ( not ( = ?auto_415691 ?auto_415693 ) ) ( not ( = ?auto_415691 ?auto_415694 ) ) ( not ( = ?auto_415691 ?auto_415695 ) ) ( not ( = ?auto_415691 ?auto_415696 ) ) ( not ( = ?auto_415691 ?auto_415697 ) ) ( not ( = ?auto_415692 ?auto_415693 ) ) ( not ( = ?auto_415692 ?auto_415694 ) ) ( not ( = ?auto_415692 ?auto_415695 ) ) ( not ( = ?auto_415692 ?auto_415696 ) ) ( not ( = ?auto_415692 ?auto_415697 ) ) ( not ( = ?auto_415693 ?auto_415694 ) ) ( not ( = ?auto_415693 ?auto_415695 ) ) ( not ( = ?auto_415693 ?auto_415696 ) ) ( not ( = ?auto_415693 ?auto_415697 ) ) ( not ( = ?auto_415694 ?auto_415695 ) ) ( not ( = ?auto_415694 ?auto_415696 ) ) ( not ( = ?auto_415694 ?auto_415697 ) ) ( not ( = ?auto_415695 ?auto_415696 ) ) ( not ( = ?auto_415695 ?auto_415697 ) ) ( not ( = ?auto_415696 ?auto_415697 ) ) ( ON ?auto_415695 ?auto_415696 ) ( CLEAR ?auto_415693 ) ( ON ?auto_415694 ?auto_415695 ) ( CLEAR ?auto_415694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_415684 ?auto_415685 ?auto_415686 ?auto_415687 ?auto_415688 ?auto_415689 ?auto_415690 ?auto_415691 ?auto_415692 ?auto_415693 ?auto_415694 )
      ( MAKE-13PILE ?auto_415684 ?auto_415685 ?auto_415686 ?auto_415687 ?auto_415688 ?auto_415689 ?auto_415690 ?auto_415691 ?auto_415692 ?auto_415693 ?auto_415694 ?auto_415695 ?auto_415696 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415711 - BLOCK
      ?auto_415712 - BLOCK
      ?auto_415713 - BLOCK
      ?auto_415714 - BLOCK
      ?auto_415715 - BLOCK
      ?auto_415716 - BLOCK
      ?auto_415717 - BLOCK
      ?auto_415718 - BLOCK
      ?auto_415719 - BLOCK
      ?auto_415720 - BLOCK
      ?auto_415721 - BLOCK
      ?auto_415722 - BLOCK
      ?auto_415723 - BLOCK
    )
    :vars
    (
      ?auto_415724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415723 ?auto_415724 ) ( ON-TABLE ?auto_415711 ) ( ON ?auto_415712 ?auto_415711 ) ( ON ?auto_415713 ?auto_415712 ) ( ON ?auto_415714 ?auto_415713 ) ( ON ?auto_415715 ?auto_415714 ) ( ON ?auto_415716 ?auto_415715 ) ( ON ?auto_415717 ?auto_415716 ) ( ON ?auto_415718 ?auto_415717 ) ( ON ?auto_415719 ?auto_415718 ) ( not ( = ?auto_415711 ?auto_415712 ) ) ( not ( = ?auto_415711 ?auto_415713 ) ) ( not ( = ?auto_415711 ?auto_415714 ) ) ( not ( = ?auto_415711 ?auto_415715 ) ) ( not ( = ?auto_415711 ?auto_415716 ) ) ( not ( = ?auto_415711 ?auto_415717 ) ) ( not ( = ?auto_415711 ?auto_415718 ) ) ( not ( = ?auto_415711 ?auto_415719 ) ) ( not ( = ?auto_415711 ?auto_415720 ) ) ( not ( = ?auto_415711 ?auto_415721 ) ) ( not ( = ?auto_415711 ?auto_415722 ) ) ( not ( = ?auto_415711 ?auto_415723 ) ) ( not ( = ?auto_415711 ?auto_415724 ) ) ( not ( = ?auto_415712 ?auto_415713 ) ) ( not ( = ?auto_415712 ?auto_415714 ) ) ( not ( = ?auto_415712 ?auto_415715 ) ) ( not ( = ?auto_415712 ?auto_415716 ) ) ( not ( = ?auto_415712 ?auto_415717 ) ) ( not ( = ?auto_415712 ?auto_415718 ) ) ( not ( = ?auto_415712 ?auto_415719 ) ) ( not ( = ?auto_415712 ?auto_415720 ) ) ( not ( = ?auto_415712 ?auto_415721 ) ) ( not ( = ?auto_415712 ?auto_415722 ) ) ( not ( = ?auto_415712 ?auto_415723 ) ) ( not ( = ?auto_415712 ?auto_415724 ) ) ( not ( = ?auto_415713 ?auto_415714 ) ) ( not ( = ?auto_415713 ?auto_415715 ) ) ( not ( = ?auto_415713 ?auto_415716 ) ) ( not ( = ?auto_415713 ?auto_415717 ) ) ( not ( = ?auto_415713 ?auto_415718 ) ) ( not ( = ?auto_415713 ?auto_415719 ) ) ( not ( = ?auto_415713 ?auto_415720 ) ) ( not ( = ?auto_415713 ?auto_415721 ) ) ( not ( = ?auto_415713 ?auto_415722 ) ) ( not ( = ?auto_415713 ?auto_415723 ) ) ( not ( = ?auto_415713 ?auto_415724 ) ) ( not ( = ?auto_415714 ?auto_415715 ) ) ( not ( = ?auto_415714 ?auto_415716 ) ) ( not ( = ?auto_415714 ?auto_415717 ) ) ( not ( = ?auto_415714 ?auto_415718 ) ) ( not ( = ?auto_415714 ?auto_415719 ) ) ( not ( = ?auto_415714 ?auto_415720 ) ) ( not ( = ?auto_415714 ?auto_415721 ) ) ( not ( = ?auto_415714 ?auto_415722 ) ) ( not ( = ?auto_415714 ?auto_415723 ) ) ( not ( = ?auto_415714 ?auto_415724 ) ) ( not ( = ?auto_415715 ?auto_415716 ) ) ( not ( = ?auto_415715 ?auto_415717 ) ) ( not ( = ?auto_415715 ?auto_415718 ) ) ( not ( = ?auto_415715 ?auto_415719 ) ) ( not ( = ?auto_415715 ?auto_415720 ) ) ( not ( = ?auto_415715 ?auto_415721 ) ) ( not ( = ?auto_415715 ?auto_415722 ) ) ( not ( = ?auto_415715 ?auto_415723 ) ) ( not ( = ?auto_415715 ?auto_415724 ) ) ( not ( = ?auto_415716 ?auto_415717 ) ) ( not ( = ?auto_415716 ?auto_415718 ) ) ( not ( = ?auto_415716 ?auto_415719 ) ) ( not ( = ?auto_415716 ?auto_415720 ) ) ( not ( = ?auto_415716 ?auto_415721 ) ) ( not ( = ?auto_415716 ?auto_415722 ) ) ( not ( = ?auto_415716 ?auto_415723 ) ) ( not ( = ?auto_415716 ?auto_415724 ) ) ( not ( = ?auto_415717 ?auto_415718 ) ) ( not ( = ?auto_415717 ?auto_415719 ) ) ( not ( = ?auto_415717 ?auto_415720 ) ) ( not ( = ?auto_415717 ?auto_415721 ) ) ( not ( = ?auto_415717 ?auto_415722 ) ) ( not ( = ?auto_415717 ?auto_415723 ) ) ( not ( = ?auto_415717 ?auto_415724 ) ) ( not ( = ?auto_415718 ?auto_415719 ) ) ( not ( = ?auto_415718 ?auto_415720 ) ) ( not ( = ?auto_415718 ?auto_415721 ) ) ( not ( = ?auto_415718 ?auto_415722 ) ) ( not ( = ?auto_415718 ?auto_415723 ) ) ( not ( = ?auto_415718 ?auto_415724 ) ) ( not ( = ?auto_415719 ?auto_415720 ) ) ( not ( = ?auto_415719 ?auto_415721 ) ) ( not ( = ?auto_415719 ?auto_415722 ) ) ( not ( = ?auto_415719 ?auto_415723 ) ) ( not ( = ?auto_415719 ?auto_415724 ) ) ( not ( = ?auto_415720 ?auto_415721 ) ) ( not ( = ?auto_415720 ?auto_415722 ) ) ( not ( = ?auto_415720 ?auto_415723 ) ) ( not ( = ?auto_415720 ?auto_415724 ) ) ( not ( = ?auto_415721 ?auto_415722 ) ) ( not ( = ?auto_415721 ?auto_415723 ) ) ( not ( = ?auto_415721 ?auto_415724 ) ) ( not ( = ?auto_415722 ?auto_415723 ) ) ( not ( = ?auto_415722 ?auto_415724 ) ) ( not ( = ?auto_415723 ?auto_415724 ) ) ( ON ?auto_415722 ?auto_415723 ) ( ON ?auto_415721 ?auto_415722 ) ( CLEAR ?auto_415719 ) ( ON ?auto_415720 ?auto_415721 ) ( CLEAR ?auto_415720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_415711 ?auto_415712 ?auto_415713 ?auto_415714 ?auto_415715 ?auto_415716 ?auto_415717 ?auto_415718 ?auto_415719 ?auto_415720 )
      ( MAKE-13PILE ?auto_415711 ?auto_415712 ?auto_415713 ?auto_415714 ?auto_415715 ?auto_415716 ?auto_415717 ?auto_415718 ?auto_415719 ?auto_415720 ?auto_415721 ?auto_415722 ?auto_415723 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415738 - BLOCK
      ?auto_415739 - BLOCK
      ?auto_415740 - BLOCK
      ?auto_415741 - BLOCK
      ?auto_415742 - BLOCK
      ?auto_415743 - BLOCK
      ?auto_415744 - BLOCK
      ?auto_415745 - BLOCK
      ?auto_415746 - BLOCK
      ?auto_415747 - BLOCK
      ?auto_415748 - BLOCK
      ?auto_415749 - BLOCK
      ?auto_415750 - BLOCK
    )
    :vars
    (
      ?auto_415751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415750 ?auto_415751 ) ( ON-TABLE ?auto_415738 ) ( ON ?auto_415739 ?auto_415738 ) ( ON ?auto_415740 ?auto_415739 ) ( ON ?auto_415741 ?auto_415740 ) ( ON ?auto_415742 ?auto_415741 ) ( ON ?auto_415743 ?auto_415742 ) ( ON ?auto_415744 ?auto_415743 ) ( ON ?auto_415745 ?auto_415744 ) ( ON ?auto_415746 ?auto_415745 ) ( not ( = ?auto_415738 ?auto_415739 ) ) ( not ( = ?auto_415738 ?auto_415740 ) ) ( not ( = ?auto_415738 ?auto_415741 ) ) ( not ( = ?auto_415738 ?auto_415742 ) ) ( not ( = ?auto_415738 ?auto_415743 ) ) ( not ( = ?auto_415738 ?auto_415744 ) ) ( not ( = ?auto_415738 ?auto_415745 ) ) ( not ( = ?auto_415738 ?auto_415746 ) ) ( not ( = ?auto_415738 ?auto_415747 ) ) ( not ( = ?auto_415738 ?auto_415748 ) ) ( not ( = ?auto_415738 ?auto_415749 ) ) ( not ( = ?auto_415738 ?auto_415750 ) ) ( not ( = ?auto_415738 ?auto_415751 ) ) ( not ( = ?auto_415739 ?auto_415740 ) ) ( not ( = ?auto_415739 ?auto_415741 ) ) ( not ( = ?auto_415739 ?auto_415742 ) ) ( not ( = ?auto_415739 ?auto_415743 ) ) ( not ( = ?auto_415739 ?auto_415744 ) ) ( not ( = ?auto_415739 ?auto_415745 ) ) ( not ( = ?auto_415739 ?auto_415746 ) ) ( not ( = ?auto_415739 ?auto_415747 ) ) ( not ( = ?auto_415739 ?auto_415748 ) ) ( not ( = ?auto_415739 ?auto_415749 ) ) ( not ( = ?auto_415739 ?auto_415750 ) ) ( not ( = ?auto_415739 ?auto_415751 ) ) ( not ( = ?auto_415740 ?auto_415741 ) ) ( not ( = ?auto_415740 ?auto_415742 ) ) ( not ( = ?auto_415740 ?auto_415743 ) ) ( not ( = ?auto_415740 ?auto_415744 ) ) ( not ( = ?auto_415740 ?auto_415745 ) ) ( not ( = ?auto_415740 ?auto_415746 ) ) ( not ( = ?auto_415740 ?auto_415747 ) ) ( not ( = ?auto_415740 ?auto_415748 ) ) ( not ( = ?auto_415740 ?auto_415749 ) ) ( not ( = ?auto_415740 ?auto_415750 ) ) ( not ( = ?auto_415740 ?auto_415751 ) ) ( not ( = ?auto_415741 ?auto_415742 ) ) ( not ( = ?auto_415741 ?auto_415743 ) ) ( not ( = ?auto_415741 ?auto_415744 ) ) ( not ( = ?auto_415741 ?auto_415745 ) ) ( not ( = ?auto_415741 ?auto_415746 ) ) ( not ( = ?auto_415741 ?auto_415747 ) ) ( not ( = ?auto_415741 ?auto_415748 ) ) ( not ( = ?auto_415741 ?auto_415749 ) ) ( not ( = ?auto_415741 ?auto_415750 ) ) ( not ( = ?auto_415741 ?auto_415751 ) ) ( not ( = ?auto_415742 ?auto_415743 ) ) ( not ( = ?auto_415742 ?auto_415744 ) ) ( not ( = ?auto_415742 ?auto_415745 ) ) ( not ( = ?auto_415742 ?auto_415746 ) ) ( not ( = ?auto_415742 ?auto_415747 ) ) ( not ( = ?auto_415742 ?auto_415748 ) ) ( not ( = ?auto_415742 ?auto_415749 ) ) ( not ( = ?auto_415742 ?auto_415750 ) ) ( not ( = ?auto_415742 ?auto_415751 ) ) ( not ( = ?auto_415743 ?auto_415744 ) ) ( not ( = ?auto_415743 ?auto_415745 ) ) ( not ( = ?auto_415743 ?auto_415746 ) ) ( not ( = ?auto_415743 ?auto_415747 ) ) ( not ( = ?auto_415743 ?auto_415748 ) ) ( not ( = ?auto_415743 ?auto_415749 ) ) ( not ( = ?auto_415743 ?auto_415750 ) ) ( not ( = ?auto_415743 ?auto_415751 ) ) ( not ( = ?auto_415744 ?auto_415745 ) ) ( not ( = ?auto_415744 ?auto_415746 ) ) ( not ( = ?auto_415744 ?auto_415747 ) ) ( not ( = ?auto_415744 ?auto_415748 ) ) ( not ( = ?auto_415744 ?auto_415749 ) ) ( not ( = ?auto_415744 ?auto_415750 ) ) ( not ( = ?auto_415744 ?auto_415751 ) ) ( not ( = ?auto_415745 ?auto_415746 ) ) ( not ( = ?auto_415745 ?auto_415747 ) ) ( not ( = ?auto_415745 ?auto_415748 ) ) ( not ( = ?auto_415745 ?auto_415749 ) ) ( not ( = ?auto_415745 ?auto_415750 ) ) ( not ( = ?auto_415745 ?auto_415751 ) ) ( not ( = ?auto_415746 ?auto_415747 ) ) ( not ( = ?auto_415746 ?auto_415748 ) ) ( not ( = ?auto_415746 ?auto_415749 ) ) ( not ( = ?auto_415746 ?auto_415750 ) ) ( not ( = ?auto_415746 ?auto_415751 ) ) ( not ( = ?auto_415747 ?auto_415748 ) ) ( not ( = ?auto_415747 ?auto_415749 ) ) ( not ( = ?auto_415747 ?auto_415750 ) ) ( not ( = ?auto_415747 ?auto_415751 ) ) ( not ( = ?auto_415748 ?auto_415749 ) ) ( not ( = ?auto_415748 ?auto_415750 ) ) ( not ( = ?auto_415748 ?auto_415751 ) ) ( not ( = ?auto_415749 ?auto_415750 ) ) ( not ( = ?auto_415749 ?auto_415751 ) ) ( not ( = ?auto_415750 ?auto_415751 ) ) ( ON ?auto_415749 ?auto_415750 ) ( ON ?auto_415748 ?auto_415749 ) ( CLEAR ?auto_415746 ) ( ON ?auto_415747 ?auto_415748 ) ( CLEAR ?auto_415747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_415738 ?auto_415739 ?auto_415740 ?auto_415741 ?auto_415742 ?auto_415743 ?auto_415744 ?auto_415745 ?auto_415746 ?auto_415747 )
      ( MAKE-13PILE ?auto_415738 ?auto_415739 ?auto_415740 ?auto_415741 ?auto_415742 ?auto_415743 ?auto_415744 ?auto_415745 ?auto_415746 ?auto_415747 ?auto_415748 ?auto_415749 ?auto_415750 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415765 - BLOCK
      ?auto_415766 - BLOCK
      ?auto_415767 - BLOCK
      ?auto_415768 - BLOCK
      ?auto_415769 - BLOCK
      ?auto_415770 - BLOCK
      ?auto_415771 - BLOCK
      ?auto_415772 - BLOCK
      ?auto_415773 - BLOCK
      ?auto_415774 - BLOCK
      ?auto_415775 - BLOCK
      ?auto_415776 - BLOCK
      ?auto_415777 - BLOCK
    )
    :vars
    (
      ?auto_415778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415777 ?auto_415778 ) ( ON-TABLE ?auto_415765 ) ( ON ?auto_415766 ?auto_415765 ) ( ON ?auto_415767 ?auto_415766 ) ( ON ?auto_415768 ?auto_415767 ) ( ON ?auto_415769 ?auto_415768 ) ( ON ?auto_415770 ?auto_415769 ) ( ON ?auto_415771 ?auto_415770 ) ( ON ?auto_415772 ?auto_415771 ) ( not ( = ?auto_415765 ?auto_415766 ) ) ( not ( = ?auto_415765 ?auto_415767 ) ) ( not ( = ?auto_415765 ?auto_415768 ) ) ( not ( = ?auto_415765 ?auto_415769 ) ) ( not ( = ?auto_415765 ?auto_415770 ) ) ( not ( = ?auto_415765 ?auto_415771 ) ) ( not ( = ?auto_415765 ?auto_415772 ) ) ( not ( = ?auto_415765 ?auto_415773 ) ) ( not ( = ?auto_415765 ?auto_415774 ) ) ( not ( = ?auto_415765 ?auto_415775 ) ) ( not ( = ?auto_415765 ?auto_415776 ) ) ( not ( = ?auto_415765 ?auto_415777 ) ) ( not ( = ?auto_415765 ?auto_415778 ) ) ( not ( = ?auto_415766 ?auto_415767 ) ) ( not ( = ?auto_415766 ?auto_415768 ) ) ( not ( = ?auto_415766 ?auto_415769 ) ) ( not ( = ?auto_415766 ?auto_415770 ) ) ( not ( = ?auto_415766 ?auto_415771 ) ) ( not ( = ?auto_415766 ?auto_415772 ) ) ( not ( = ?auto_415766 ?auto_415773 ) ) ( not ( = ?auto_415766 ?auto_415774 ) ) ( not ( = ?auto_415766 ?auto_415775 ) ) ( not ( = ?auto_415766 ?auto_415776 ) ) ( not ( = ?auto_415766 ?auto_415777 ) ) ( not ( = ?auto_415766 ?auto_415778 ) ) ( not ( = ?auto_415767 ?auto_415768 ) ) ( not ( = ?auto_415767 ?auto_415769 ) ) ( not ( = ?auto_415767 ?auto_415770 ) ) ( not ( = ?auto_415767 ?auto_415771 ) ) ( not ( = ?auto_415767 ?auto_415772 ) ) ( not ( = ?auto_415767 ?auto_415773 ) ) ( not ( = ?auto_415767 ?auto_415774 ) ) ( not ( = ?auto_415767 ?auto_415775 ) ) ( not ( = ?auto_415767 ?auto_415776 ) ) ( not ( = ?auto_415767 ?auto_415777 ) ) ( not ( = ?auto_415767 ?auto_415778 ) ) ( not ( = ?auto_415768 ?auto_415769 ) ) ( not ( = ?auto_415768 ?auto_415770 ) ) ( not ( = ?auto_415768 ?auto_415771 ) ) ( not ( = ?auto_415768 ?auto_415772 ) ) ( not ( = ?auto_415768 ?auto_415773 ) ) ( not ( = ?auto_415768 ?auto_415774 ) ) ( not ( = ?auto_415768 ?auto_415775 ) ) ( not ( = ?auto_415768 ?auto_415776 ) ) ( not ( = ?auto_415768 ?auto_415777 ) ) ( not ( = ?auto_415768 ?auto_415778 ) ) ( not ( = ?auto_415769 ?auto_415770 ) ) ( not ( = ?auto_415769 ?auto_415771 ) ) ( not ( = ?auto_415769 ?auto_415772 ) ) ( not ( = ?auto_415769 ?auto_415773 ) ) ( not ( = ?auto_415769 ?auto_415774 ) ) ( not ( = ?auto_415769 ?auto_415775 ) ) ( not ( = ?auto_415769 ?auto_415776 ) ) ( not ( = ?auto_415769 ?auto_415777 ) ) ( not ( = ?auto_415769 ?auto_415778 ) ) ( not ( = ?auto_415770 ?auto_415771 ) ) ( not ( = ?auto_415770 ?auto_415772 ) ) ( not ( = ?auto_415770 ?auto_415773 ) ) ( not ( = ?auto_415770 ?auto_415774 ) ) ( not ( = ?auto_415770 ?auto_415775 ) ) ( not ( = ?auto_415770 ?auto_415776 ) ) ( not ( = ?auto_415770 ?auto_415777 ) ) ( not ( = ?auto_415770 ?auto_415778 ) ) ( not ( = ?auto_415771 ?auto_415772 ) ) ( not ( = ?auto_415771 ?auto_415773 ) ) ( not ( = ?auto_415771 ?auto_415774 ) ) ( not ( = ?auto_415771 ?auto_415775 ) ) ( not ( = ?auto_415771 ?auto_415776 ) ) ( not ( = ?auto_415771 ?auto_415777 ) ) ( not ( = ?auto_415771 ?auto_415778 ) ) ( not ( = ?auto_415772 ?auto_415773 ) ) ( not ( = ?auto_415772 ?auto_415774 ) ) ( not ( = ?auto_415772 ?auto_415775 ) ) ( not ( = ?auto_415772 ?auto_415776 ) ) ( not ( = ?auto_415772 ?auto_415777 ) ) ( not ( = ?auto_415772 ?auto_415778 ) ) ( not ( = ?auto_415773 ?auto_415774 ) ) ( not ( = ?auto_415773 ?auto_415775 ) ) ( not ( = ?auto_415773 ?auto_415776 ) ) ( not ( = ?auto_415773 ?auto_415777 ) ) ( not ( = ?auto_415773 ?auto_415778 ) ) ( not ( = ?auto_415774 ?auto_415775 ) ) ( not ( = ?auto_415774 ?auto_415776 ) ) ( not ( = ?auto_415774 ?auto_415777 ) ) ( not ( = ?auto_415774 ?auto_415778 ) ) ( not ( = ?auto_415775 ?auto_415776 ) ) ( not ( = ?auto_415775 ?auto_415777 ) ) ( not ( = ?auto_415775 ?auto_415778 ) ) ( not ( = ?auto_415776 ?auto_415777 ) ) ( not ( = ?auto_415776 ?auto_415778 ) ) ( not ( = ?auto_415777 ?auto_415778 ) ) ( ON ?auto_415776 ?auto_415777 ) ( ON ?auto_415775 ?auto_415776 ) ( ON ?auto_415774 ?auto_415775 ) ( CLEAR ?auto_415772 ) ( ON ?auto_415773 ?auto_415774 ) ( CLEAR ?auto_415773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_415765 ?auto_415766 ?auto_415767 ?auto_415768 ?auto_415769 ?auto_415770 ?auto_415771 ?auto_415772 ?auto_415773 )
      ( MAKE-13PILE ?auto_415765 ?auto_415766 ?auto_415767 ?auto_415768 ?auto_415769 ?auto_415770 ?auto_415771 ?auto_415772 ?auto_415773 ?auto_415774 ?auto_415775 ?auto_415776 ?auto_415777 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415792 - BLOCK
      ?auto_415793 - BLOCK
      ?auto_415794 - BLOCK
      ?auto_415795 - BLOCK
      ?auto_415796 - BLOCK
      ?auto_415797 - BLOCK
      ?auto_415798 - BLOCK
      ?auto_415799 - BLOCK
      ?auto_415800 - BLOCK
      ?auto_415801 - BLOCK
      ?auto_415802 - BLOCK
      ?auto_415803 - BLOCK
      ?auto_415804 - BLOCK
    )
    :vars
    (
      ?auto_415805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415804 ?auto_415805 ) ( ON-TABLE ?auto_415792 ) ( ON ?auto_415793 ?auto_415792 ) ( ON ?auto_415794 ?auto_415793 ) ( ON ?auto_415795 ?auto_415794 ) ( ON ?auto_415796 ?auto_415795 ) ( ON ?auto_415797 ?auto_415796 ) ( ON ?auto_415798 ?auto_415797 ) ( ON ?auto_415799 ?auto_415798 ) ( not ( = ?auto_415792 ?auto_415793 ) ) ( not ( = ?auto_415792 ?auto_415794 ) ) ( not ( = ?auto_415792 ?auto_415795 ) ) ( not ( = ?auto_415792 ?auto_415796 ) ) ( not ( = ?auto_415792 ?auto_415797 ) ) ( not ( = ?auto_415792 ?auto_415798 ) ) ( not ( = ?auto_415792 ?auto_415799 ) ) ( not ( = ?auto_415792 ?auto_415800 ) ) ( not ( = ?auto_415792 ?auto_415801 ) ) ( not ( = ?auto_415792 ?auto_415802 ) ) ( not ( = ?auto_415792 ?auto_415803 ) ) ( not ( = ?auto_415792 ?auto_415804 ) ) ( not ( = ?auto_415792 ?auto_415805 ) ) ( not ( = ?auto_415793 ?auto_415794 ) ) ( not ( = ?auto_415793 ?auto_415795 ) ) ( not ( = ?auto_415793 ?auto_415796 ) ) ( not ( = ?auto_415793 ?auto_415797 ) ) ( not ( = ?auto_415793 ?auto_415798 ) ) ( not ( = ?auto_415793 ?auto_415799 ) ) ( not ( = ?auto_415793 ?auto_415800 ) ) ( not ( = ?auto_415793 ?auto_415801 ) ) ( not ( = ?auto_415793 ?auto_415802 ) ) ( not ( = ?auto_415793 ?auto_415803 ) ) ( not ( = ?auto_415793 ?auto_415804 ) ) ( not ( = ?auto_415793 ?auto_415805 ) ) ( not ( = ?auto_415794 ?auto_415795 ) ) ( not ( = ?auto_415794 ?auto_415796 ) ) ( not ( = ?auto_415794 ?auto_415797 ) ) ( not ( = ?auto_415794 ?auto_415798 ) ) ( not ( = ?auto_415794 ?auto_415799 ) ) ( not ( = ?auto_415794 ?auto_415800 ) ) ( not ( = ?auto_415794 ?auto_415801 ) ) ( not ( = ?auto_415794 ?auto_415802 ) ) ( not ( = ?auto_415794 ?auto_415803 ) ) ( not ( = ?auto_415794 ?auto_415804 ) ) ( not ( = ?auto_415794 ?auto_415805 ) ) ( not ( = ?auto_415795 ?auto_415796 ) ) ( not ( = ?auto_415795 ?auto_415797 ) ) ( not ( = ?auto_415795 ?auto_415798 ) ) ( not ( = ?auto_415795 ?auto_415799 ) ) ( not ( = ?auto_415795 ?auto_415800 ) ) ( not ( = ?auto_415795 ?auto_415801 ) ) ( not ( = ?auto_415795 ?auto_415802 ) ) ( not ( = ?auto_415795 ?auto_415803 ) ) ( not ( = ?auto_415795 ?auto_415804 ) ) ( not ( = ?auto_415795 ?auto_415805 ) ) ( not ( = ?auto_415796 ?auto_415797 ) ) ( not ( = ?auto_415796 ?auto_415798 ) ) ( not ( = ?auto_415796 ?auto_415799 ) ) ( not ( = ?auto_415796 ?auto_415800 ) ) ( not ( = ?auto_415796 ?auto_415801 ) ) ( not ( = ?auto_415796 ?auto_415802 ) ) ( not ( = ?auto_415796 ?auto_415803 ) ) ( not ( = ?auto_415796 ?auto_415804 ) ) ( not ( = ?auto_415796 ?auto_415805 ) ) ( not ( = ?auto_415797 ?auto_415798 ) ) ( not ( = ?auto_415797 ?auto_415799 ) ) ( not ( = ?auto_415797 ?auto_415800 ) ) ( not ( = ?auto_415797 ?auto_415801 ) ) ( not ( = ?auto_415797 ?auto_415802 ) ) ( not ( = ?auto_415797 ?auto_415803 ) ) ( not ( = ?auto_415797 ?auto_415804 ) ) ( not ( = ?auto_415797 ?auto_415805 ) ) ( not ( = ?auto_415798 ?auto_415799 ) ) ( not ( = ?auto_415798 ?auto_415800 ) ) ( not ( = ?auto_415798 ?auto_415801 ) ) ( not ( = ?auto_415798 ?auto_415802 ) ) ( not ( = ?auto_415798 ?auto_415803 ) ) ( not ( = ?auto_415798 ?auto_415804 ) ) ( not ( = ?auto_415798 ?auto_415805 ) ) ( not ( = ?auto_415799 ?auto_415800 ) ) ( not ( = ?auto_415799 ?auto_415801 ) ) ( not ( = ?auto_415799 ?auto_415802 ) ) ( not ( = ?auto_415799 ?auto_415803 ) ) ( not ( = ?auto_415799 ?auto_415804 ) ) ( not ( = ?auto_415799 ?auto_415805 ) ) ( not ( = ?auto_415800 ?auto_415801 ) ) ( not ( = ?auto_415800 ?auto_415802 ) ) ( not ( = ?auto_415800 ?auto_415803 ) ) ( not ( = ?auto_415800 ?auto_415804 ) ) ( not ( = ?auto_415800 ?auto_415805 ) ) ( not ( = ?auto_415801 ?auto_415802 ) ) ( not ( = ?auto_415801 ?auto_415803 ) ) ( not ( = ?auto_415801 ?auto_415804 ) ) ( not ( = ?auto_415801 ?auto_415805 ) ) ( not ( = ?auto_415802 ?auto_415803 ) ) ( not ( = ?auto_415802 ?auto_415804 ) ) ( not ( = ?auto_415802 ?auto_415805 ) ) ( not ( = ?auto_415803 ?auto_415804 ) ) ( not ( = ?auto_415803 ?auto_415805 ) ) ( not ( = ?auto_415804 ?auto_415805 ) ) ( ON ?auto_415803 ?auto_415804 ) ( ON ?auto_415802 ?auto_415803 ) ( ON ?auto_415801 ?auto_415802 ) ( CLEAR ?auto_415799 ) ( ON ?auto_415800 ?auto_415801 ) ( CLEAR ?auto_415800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_415792 ?auto_415793 ?auto_415794 ?auto_415795 ?auto_415796 ?auto_415797 ?auto_415798 ?auto_415799 ?auto_415800 )
      ( MAKE-13PILE ?auto_415792 ?auto_415793 ?auto_415794 ?auto_415795 ?auto_415796 ?auto_415797 ?auto_415798 ?auto_415799 ?auto_415800 ?auto_415801 ?auto_415802 ?auto_415803 ?auto_415804 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415819 - BLOCK
      ?auto_415820 - BLOCK
      ?auto_415821 - BLOCK
      ?auto_415822 - BLOCK
      ?auto_415823 - BLOCK
      ?auto_415824 - BLOCK
      ?auto_415825 - BLOCK
      ?auto_415826 - BLOCK
      ?auto_415827 - BLOCK
      ?auto_415828 - BLOCK
      ?auto_415829 - BLOCK
      ?auto_415830 - BLOCK
      ?auto_415831 - BLOCK
    )
    :vars
    (
      ?auto_415832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415831 ?auto_415832 ) ( ON-TABLE ?auto_415819 ) ( ON ?auto_415820 ?auto_415819 ) ( ON ?auto_415821 ?auto_415820 ) ( ON ?auto_415822 ?auto_415821 ) ( ON ?auto_415823 ?auto_415822 ) ( ON ?auto_415824 ?auto_415823 ) ( ON ?auto_415825 ?auto_415824 ) ( not ( = ?auto_415819 ?auto_415820 ) ) ( not ( = ?auto_415819 ?auto_415821 ) ) ( not ( = ?auto_415819 ?auto_415822 ) ) ( not ( = ?auto_415819 ?auto_415823 ) ) ( not ( = ?auto_415819 ?auto_415824 ) ) ( not ( = ?auto_415819 ?auto_415825 ) ) ( not ( = ?auto_415819 ?auto_415826 ) ) ( not ( = ?auto_415819 ?auto_415827 ) ) ( not ( = ?auto_415819 ?auto_415828 ) ) ( not ( = ?auto_415819 ?auto_415829 ) ) ( not ( = ?auto_415819 ?auto_415830 ) ) ( not ( = ?auto_415819 ?auto_415831 ) ) ( not ( = ?auto_415819 ?auto_415832 ) ) ( not ( = ?auto_415820 ?auto_415821 ) ) ( not ( = ?auto_415820 ?auto_415822 ) ) ( not ( = ?auto_415820 ?auto_415823 ) ) ( not ( = ?auto_415820 ?auto_415824 ) ) ( not ( = ?auto_415820 ?auto_415825 ) ) ( not ( = ?auto_415820 ?auto_415826 ) ) ( not ( = ?auto_415820 ?auto_415827 ) ) ( not ( = ?auto_415820 ?auto_415828 ) ) ( not ( = ?auto_415820 ?auto_415829 ) ) ( not ( = ?auto_415820 ?auto_415830 ) ) ( not ( = ?auto_415820 ?auto_415831 ) ) ( not ( = ?auto_415820 ?auto_415832 ) ) ( not ( = ?auto_415821 ?auto_415822 ) ) ( not ( = ?auto_415821 ?auto_415823 ) ) ( not ( = ?auto_415821 ?auto_415824 ) ) ( not ( = ?auto_415821 ?auto_415825 ) ) ( not ( = ?auto_415821 ?auto_415826 ) ) ( not ( = ?auto_415821 ?auto_415827 ) ) ( not ( = ?auto_415821 ?auto_415828 ) ) ( not ( = ?auto_415821 ?auto_415829 ) ) ( not ( = ?auto_415821 ?auto_415830 ) ) ( not ( = ?auto_415821 ?auto_415831 ) ) ( not ( = ?auto_415821 ?auto_415832 ) ) ( not ( = ?auto_415822 ?auto_415823 ) ) ( not ( = ?auto_415822 ?auto_415824 ) ) ( not ( = ?auto_415822 ?auto_415825 ) ) ( not ( = ?auto_415822 ?auto_415826 ) ) ( not ( = ?auto_415822 ?auto_415827 ) ) ( not ( = ?auto_415822 ?auto_415828 ) ) ( not ( = ?auto_415822 ?auto_415829 ) ) ( not ( = ?auto_415822 ?auto_415830 ) ) ( not ( = ?auto_415822 ?auto_415831 ) ) ( not ( = ?auto_415822 ?auto_415832 ) ) ( not ( = ?auto_415823 ?auto_415824 ) ) ( not ( = ?auto_415823 ?auto_415825 ) ) ( not ( = ?auto_415823 ?auto_415826 ) ) ( not ( = ?auto_415823 ?auto_415827 ) ) ( not ( = ?auto_415823 ?auto_415828 ) ) ( not ( = ?auto_415823 ?auto_415829 ) ) ( not ( = ?auto_415823 ?auto_415830 ) ) ( not ( = ?auto_415823 ?auto_415831 ) ) ( not ( = ?auto_415823 ?auto_415832 ) ) ( not ( = ?auto_415824 ?auto_415825 ) ) ( not ( = ?auto_415824 ?auto_415826 ) ) ( not ( = ?auto_415824 ?auto_415827 ) ) ( not ( = ?auto_415824 ?auto_415828 ) ) ( not ( = ?auto_415824 ?auto_415829 ) ) ( not ( = ?auto_415824 ?auto_415830 ) ) ( not ( = ?auto_415824 ?auto_415831 ) ) ( not ( = ?auto_415824 ?auto_415832 ) ) ( not ( = ?auto_415825 ?auto_415826 ) ) ( not ( = ?auto_415825 ?auto_415827 ) ) ( not ( = ?auto_415825 ?auto_415828 ) ) ( not ( = ?auto_415825 ?auto_415829 ) ) ( not ( = ?auto_415825 ?auto_415830 ) ) ( not ( = ?auto_415825 ?auto_415831 ) ) ( not ( = ?auto_415825 ?auto_415832 ) ) ( not ( = ?auto_415826 ?auto_415827 ) ) ( not ( = ?auto_415826 ?auto_415828 ) ) ( not ( = ?auto_415826 ?auto_415829 ) ) ( not ( = ?auto_415826 ?auto_415830 ) ) ( not ( = ?auto_415826 ?auto_415831 ) ) ( not ( = ?auto_415826 ?auto_415832 ) ) ( not ( = ?auto_415827 ?auto_415828 ) ) ( not ( = ?auto_415827 ?auto_415829 ) ) ( not ( = ?auto_415827 ?auto_415830 ) ) ( not ( = ?auto_415827 ?auto_415831 ) ) ( not ( = ?auto_415827 ?auto_415832 ) ) ( not ( = ?auto_415828 ?auto_415829 ) ) ( not ( = ?auto_415828 ?auto_415830 ) ) ( not ( = ?auto_415828 ?auto_415831 ) ) ( not ( = ?auto_415828 ?auto_415832 ) ) ( not ( = ?auto_415829 ?auto_415830 ) ) ( not ( = ?auto_415829 ?auto_415831 ) ) ( not ( = ?auto_415829 ?auto_415832 ) ) ( not ( = ?auto_415830 ?auto_415831 ) ) ( not ( = ?auto_415830 ?auto_415832 ) ) ( not ( = ?auto_415831 ?auto_415832 ) ) ( ON ?auto_415830 ?auto_415831 ) ( ON ?auto_415829 ?auto_415830 ) ( ON ?auto_415828 ?auto_415829 ) ( ON ?auto_415827 ?auto_415828 ) ( CLEAR ?auto_415825 ) ( ON ?auto_415826 ?auto_415827 ) ( CLEAR ?auto_415826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_415819 ?auto_415820 ?auto_415821 ?auto_415822 ?auto_415823 ?auto_415824 ?auto_415825 ?auto_415826 )
      ( MAKE-13PILE ?auto_415819 ?auto_415820 ?auto_415821 ?auto_415822 ?auto_415823 ?auto_415824 ?auto_415825 ?auto_415826 ?auto_415827 ?auto_415828 ?auto_415829 ?auto_415830 ?auto_415831 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415846 - BLOCK
      ?auto_415847 - BLOCK
      ?auto_415848 - BLOCK
      ?auto_415849 - BLOCK
      ?auto_415850 - BLOCK
      ?auto_415851 - BLOCK
      ?auto_415852 - BLOCK
      ?auto_415853 - BLOCK
      ?auto_415854 - BLOCK
      ?auto_415855 - BLOCK
      ?auto_415856 - BLOCK
      ?auto_415857 - BLOCK
      ?auto_415858 - BLOCK
    )
    :vars
    (
      ?auto_415859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415858 ?auto_415859 ) ( ON-TABLE ?auto_415846 ) ( ON ?auto_415847 ?auto_415846 ) ( ON ?auto_415848 ?auto_415847 ) ( ON ?auto_415849 ?auto_415848 ) ( ON ?auto_415850 ?auto_415849 ) ( ON ?auto_415851 ?auto_415850 ) ( ON ?auto_415852 ?auto_415851 ) ( not ( = ?auto_415846 ?auto_415847 ) ) ( not ( = ?auto_415846 ?auto_415848 ) ) ( not ( = ?auto_415846 ?auto_415849 ) ) ( not ( = ?auto_415846 ?auto_415850 ) ) ( not ( = ?auto_415846 ?auto_415851 ) ) ( not ( = ?auto_415846 ?auto_415852 ) ) ( not ( = ?auto_415846 ?auto_415853 ) ) ( not ( = ?auto_415846 ?auto_415854 ) ) ( not ( = ?auto_415846 ?auto_415855 ) ) ( not ( = ?auto_415846 ?auto_415856 ) ) ( not ( = ?auto_415846 ?auto_415857 ) ) ( not ( = ?auto_415846 ?auto_415858 ) ) ( not ( = ?auto_415846 ?auto_415859 ) ) ( not ( = ?auto_415847 ?auto_415848 ) ) ( not ( = ?auto_415847 ?auto_415849 ) ) ( not ( = ?auto_415847 ?auto_415850 ) ) ( not ( = ?auto_415847 ?auto_415851 ) ) ( not ( = ?auto_415847 ?auto_415852 ) ) ( not ( = ?auto_415847 ?auto_415853 ) ) ( not ( = ?auto_415847 ?auto_415854 ) ) ( not ( = ?auto_415847 ?auto_415855 ) ) ( not ( = ?auto_415847 ?auto_415856 ) ) ( not ( = ?auto_415847 ?auto_415857 ) ) ( not ( = ?auto_415847 ?auto_415858 ) ) ( not ( = ?auto_415847 ?auto_415859 ) ) ( not ( = ?auto_415848 ?auto_415849 ) ) ( not ( = ?auto_415848 ?auto_415850 ) ) ( not ( = ?auto_415848 ?auto_415851 ) ) ( not ( = ?auto_415848 ?auto_415852 ) ) ( not ( = ?auto_415848 ?auto_415853 ) ) ( not ( = ?auto_415848 ?auto_415854 ) ) ( not ( = ?auto_415848 ?auto_415855 ) ) ( not ( = ?auto_415848 ?auto_415856 ) ) ( not ( = ?auto_415848 ?auto_415857 ) ) ( not ( = ?auto_415848 ?auto_415858 ) ) ( not ( = ?auto_415848 ?auto_415859 ) ) ( not ( = ?auto_415849 ?auto_415850 ) ) ( not ( = ?auto_415849 ?auto_415851 ) ) ( not ( = ?auto_415849 ?auto_415852 ) ) ( not ( = ?auto_415849 ?auto_415853 ) ) ( not ( = ?auto_415849 ?auto_415854 ) ) ( not ( = ?auto_415849 ?auto_415855 ) ) ( not ( = ?auto_415849 ?auto_415856 ) ) ( not ( = ?auto_415849 ?auto_415857 ) ) ( not ( = ?auto_415849 ?auto_415858 ) ) ( not ( = ?auto_415849 ?auto_415859 ) ) ( not ( = ?auto_415850 ?auto_415851 ) ) ( not ( = ?auto_415850 ?auto_415852 ) ) ( not ( = ?auto_415850 ?auto_415853 ) ) ( not ( = ?auto_415850 ?auto_415854 ) ) ( not ( = ?auto_415850 ?auto_415855 ) ) ( not ( = ?auto_415850 ?auto_415856 ) ) ( not ( = ?auto_415850 ?auto_415857 ) ) ( not ( = ?auto_415850 ?auto_415858 ) ) ( not ( = ?auto_415850 ?auto_415859 ) ) ( not ( = ?auto_415851 ?auto_415852 ) ) ( not ( = ?auto_415851 ?auto_415853 ) ) ( not ( = ?auto_415851 ?auto_415854 ) ) ( not ( = ?auto_415851 ?auto_415855 ) ) ( not ( = ?auto_415851 ?auto_415856 ) ) ( not ( = ?auto_415851 ?auto_415857 ) ) ( not ( = ?auto_415851 ?auto_415858 ) ) ( not ( = ?auto_415851 ?auto_415859 ) ) ( not ( = ?auto_415852 ?auto_415853 ) ) ( not ( = ?auto_415852 ?auto_415854 ) ) ( not ( = ?auto_415852 ?auto_415855 ) ) ( not ( = ?auto_415852 ?auto_415856 ) ) ( not ( = ?auto_415852 ?auto_415857 ) ) ( not ( = ?auto_415852 ?auto_415858 ) ) ( not ( = ?auto_415852 ?auto_415859 ) ) ( not ( = ?auto_415853 ?auto_415854 ) ) ( not ( = ?auto_415853 ?auto_415855 ) ) ( not ( = ?auto_415853 ?auto_415856 ) ) ( not ( = ?auto_415853 ?auto_415857 ) ) ( not ( = ?auto_415853 ?auto_415858 ) ) ( not ( = ?auto_415853 ?auto_415859 ) ) ( not ( = ?auto_415854 ?auto_415855 ) ) ( not ( = ?auto_415854 ?auto_415856 ) ) ( not ( = ?auto_415854 ?auto_415857 ) ) ( not ( = ?auto_415854 ?auto_415858 ) ) ( not ( = ?auto_415854 ?auto_415859 ) ) ( not ( = ?auto_415855 ?auto_415856 ) ) ( not ( = ?auto_415855 ?auto_415857 ) ) ( not ( = ?auto_415855 ?auto_415858 ) ) ( not ( = ?auto_415855 ?auto_415859 ) ) ( not ( = ?auto_415856 ?auto_415857 ) ) ( not ( = ?auto_415856 ?auto_415858 ) ) ( not ( = ?auto_415856 ?auto_415859 ) ) ( not ( = ?auto_415857 ?auto_415858 ) ) ( not ( = ?auto_415857 ?auto_415859 ) ) ( not ( = ?auto_415858 ?auto_415859 ) ) ( ON ?auto_415857 ?auto_415858 ) ( ON ?auto_415856 ?auto_415857 ) ( ON ?auto_415855 ?auto_415856 ) ( ON ?auto_415854 ?auto_415855 ) ( CLEAR ?auto_415852 ) ( ON ?auto_415853 ?auto_415854 ) ( CLEAR ?auto_415853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_415846 ?auto_415847 ?auto_415848 ?auto_415849 ?auto_415850 ?auto_415851 ?auto_415852 ?auto_415853 )
      ( MAKE-13PILE ?auto_415846 ?auto_415847 ?auto_415848 ?auto_415849 ?auto_415850 ?auto_415851 ?auto_415852 ?auto_415853 ?auto_415854 ?auto_415855 ?auto_415856 ?auto_415857 ?auto_415858 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415873 - BLOCK
      ?auto_415874 - BLOCK
      ?auto_415875 - BLOCK
      ?auto_415876 - BLOCK
      ?auto_415877 - BLOCK
      ?auto_415878 - BLOCK
      ?auto_415879 - BLOCK
      ?auto_415880 - BLOCK
      ?auto_415881 - BLOCK
      ?auto_415882 - BLOCK
      ?auto_415883 - BLOCK
      ?auto_415884 - BLOCK
      ?auto_415885 - BLOCK
    )
    :vars
    (
      ?auto_415886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415885 ?auto_415886 ) ( ON-TABLE ?auto_415873 ) ( ON ?auto_415874 ?auto_415873 ) ( ON ?auto_415875 ?auto_415874 ) ( ON ?auto_415876 ?auto_415875 ) ( ON ?auto_415877 ?auto_415876 ) ( ON ?auto_415878 ?auto_415877 ) ( not ( = ?auto_415873 ?auto_415874 ) ) ( not ( = ?auto_415873 ?auto_415875 ) ) ( not ( = ?auto_415873 ?auto_415876 ) ) ( not ( = ?auto_415873 ?auto_415877 ) ) ( not ( = ?auto_415873 ?auto_415878 ) ) ( not ( = ?auto_415873 ?auto_415879 ) ) ( not ( = ?auto_415873 ?auto_415880 ) ) ( not ( = ?auto_415873 ?auto_415881 ) ) ( not ( = ?auto_415873 ?auto_415882 ) ) ( not ( = ?auto_415873 ?auto_415883 ) ) ( not ( = ?auto_415873 ?auto_415884 ) ) ( not ( = ?auto_415873 ?auto_415885 ) ) ( not ( = ?auto_415873 ?auto_415886 ) ) ( not ( = ?auto_415874 ?auto_415875 ) ) ( not ( = ?auto_415874 ?auto_415876 ) ) ( not ( = ?auto_415874 ?auto_415877 ) ) ( not ( = ?auto_415874 ?auto_415878 ) ) ( not ( = ?auto_415874 ?auto_415879 ) ) ( not ( = ?auto_415874 ?auto_415880 ) ) ( not ( = ?auto_415874 ?auto_415881 ) ) ( not ( = ?auto_415874 ?auto_415882 ) ) ( not ( = ?auto_415874 ?auto_415883 ) ) ( not ( = ?auto_415874 ?auto_415884 ) ) ( not ( = ?auto_415874 ?auto_415885 ) ) ( not ( = ?auto_415874 ?auto_415886 ) ) ( not ( = ?auto_415875 ?auto_415876 ) ) ( not ( = ?auto_415875 ?auto_415877 ) ) ( not ( = ?auto_415875 ?auto_415878 ) ) ( not ( = ?auto_415875 ?auto_415879 ) ) ( not ( = ?auto_415875 ?auto_415880 ) ) ( not ( = ?auto_415875 ?auto_415881 ) ) ( not ( = ?auto_415875 ?auto_415882 ) ) ( not ( = ?auto_415875 ?auto_415883 ) ) ( not ( = ?auto_415875 ?auto_415884 ) ) ( not ( = ?auto_415875 ?auto_415885 ) ) ( not ( = ?auto_415875 ?auto_415886 ) ) ( not ( = ?auto_415876 ?auto_415877 ) ) ( not ( = ?auto_415876 ?auto_415878 ) ) ( not ( = ?auto_415876 ?auto_415879 ) ) ( not ( = ?auto_415876 ?auto_415880 ) ) ( not ( = ?auto_415876 ?auto_415881 ) ) ( not ( = ?auto_415876 ?auto_415882 ) ) ( not ( = ?auto_415876 ?auto_415883 ) ) ( not ( = ?auto_415876 ?auto_415884 ) ) ( not ( = ?auto_415876 ?auto_415885 ) ) ( not ( = ?auto_415876 ?auto_415886 ) ) ( not ( = ?auto_415877 ?auto_415878 ) ) ( not ( = ?auto_415877 ?auto_415879 ) ) ( not ( = ?auto_415877 ?auto_415880 ) ) ( not ( = ?auto_415877 ?auto_415881 ) ) ( not ( = ?auto_415877 ?auto_415882 ) ) ( not ( = ?auto_415877 ?auto_415883 ) ) ( not ( = ?auto_415877 ?auto_415884 ) ) ( not ( = ?auto_415877 ?auto_415885 ) ) ( not ( = ?auto_415877 ?auto_415886 ) ) ( not ( = ?auto_415878 ?auto_415879 ) ) ( not ( = ?auto_415878 ?auto_415880 ) ) ( not ( = ?auto_415878 ?auto_415881 ) ) ( not ( = ?auto_415878 ?auto_415882 ) ) ( not ( = ?auto_415878 ?auto_415883 ) ) ( not ( = ?auto_415878 ?auto_415884 ) ) ( not ( = ?auto_415878 ?auto_415885 ) ) ( not ( = ?auto_415878 ?auto_415886 ) ) ( not ( = ?auto_415879 ?auto_415880 ) ) ( not ( = ?auto_415879 ?auto_415881 ) ) ( not ( = ?auto_415879 ?auto_415882 ) ) ( not ( = ?auto_415879 ?auto_415883 ) ) ( not ( = ?auto_415879 ?auto_415884 ) ) ( not ( = ?auto_415879 ?auto_415885 ) ) ( not ( = ?auto_415879 ?auto_415886 ) ) ( not ( = ?auto_415880 ?auto_415881 ) ) ( not ( = ?auto_415880 ?auto_415882 ) ) ( not ( = ?auto_415880 ?auto_415883 ) ) ( not ( = ?auto_415880 ?auto_415884 ) ) ( not ( = ?auto_415880 ?auto_415885 ) ) ( not ( = ?auto_415880 ?auto_415886 ) ) ( not ( = ?auto_415881 ?auto_415882 ) ) ( not ( = ?auto_415881 ?auto_415883 ) ) ( not ( = ?auto_415881 ?auto_415884 ) ) ( not ( = ?auto_415881 ?auto_415885 ) ) ( not ( = ?auto_415881 ?auto_415886 ) ) ( not ( = ?auto_415882 ?auto_415883 ) ) ( not ( = ?auto_415882 ?auto_415884 ) ) ( not ( = ?auto_415882 ?auto_415885 ) ) ( not ( = ?auto_415882 ?auto_415886 ) ) ( not ( = ?auto_415883 ?auto_415884 ) ) ( not ( = ?auto_415883 ?auto_415885 ) ) ( not ( = ?auto_415883 ?auto_415886 ) ) ( not ( = ?auto_415884 ?auto_415885 ) ) ( not ( = ?auto_415884 ?auto_415886 ) ) ( not ( = ?auto_415885 ?auto_415886 ) ) ( ON ?auto_415884 ?auto_415885 ) ( ON ?auto_415883 ?auto_415884 ) ( ON ?auto_415882 ?auto_415883 ) ( ON ?auto_415881 ?auto_415882 ) ( ON ?auto_415880 ?auto_415881 ) ( CLEAR ?auto_415878 ) ( ON ?auto_415879 ?auto_415880 ) ( CLEAR ?auto_415879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_415873 ?auto_415874 ?auto_415875 ?auto_415876 ?auto_415877 ?auto_415878 ?auto_415879 )
      ( MAKE-13PILE ?auto_415873 ?auto_415874 ?auto_415875 ?auto_415876 ?auto_415877 ?auto_415878 ?auto_415879 ?auto_415880 ?auto_415881 ?auto_415882 ?auto_415883 ?auto_415884 ?auto_415885 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415900 - BLOCK
      ?auto_415901 - BLOCK
      ?auto_415902 - BLOCK
      ?auto_415903 - BLOCK
      ?auto_415904 - BLOCK
      ?auto_415905 - BLOCK
      ?auto_415906 - BLOCK
      ?auto_415907 - BLOCK
      ?auto_415908 - BLOCK
      ?auto_415909 - BLOCK
      ?auto_415910 - BLOCK
      ?auto_415911 - BLOCK
      ?auto_415912 - BLOCK
    )
    :vars
    (
      ?auto_415913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415912 ?auto_415913 ) ( ON-TABLE ?auto_415900 ) ( ON ?auto_415901 ?auto_415900 ) ( ON ?auto_415902 ?auto_415901 ) ( ON ?auto_415903 ?auto_415902 ) ( ON ?auto_415904 ?auto_415903 ) ( ON ?auto_415905 ?auto_415904 ) ( not ( = ?auto_415900 ?auto_415901 ) ) ( not ( = ?auto_415900 ?auto_415902 ) ) ( not ( = ?auto_415900 ?auto_415903 ) ) ( not ( = ?auto_415900 ?auto_415904 ) ) ( not ( = ?auto_415900 ?auto_415905 ) ) ( not ( = ?auto_415900 ?auto_415906 ) ) ( not ( = ?auto_415900 ?auto_415907 ) ) ( not ( = ?auto_415900 ?auto_415908 ) ) ( not ( = ?auto_415900 ?auto_415909 ) ) ( not ( = ?auto_415900 ?auto_415910 ) ) ( not ( = ?auto_415900 ?auto_415911 ) ) ( not ( = ?auto_415900 ?auto_415912 ) ) ( not ( = ?auto_415900 ?auto_415913 ) ) ( not ( = ?auto_415901 ?auto_415902 ) ) ( not ( = ?auto_415901 ?auto_415903 ) ) ( not ( = ?auto_415901 ?auto_415904 ) ) ( not ( = ?auto_415901 ?auto_415905 ) ) ( not ( = ?auto_415901 ?auto_415906 ) ) ( not ( = ?auto_415901 ?auto_415907 ) ) ( not ( = ?auto_415901 ?auto_415908 ) ) ( not ( = ?auto_415901 ?auto_415909 ) ) ( not ( = ?auto_415901 ?auto_415910 ) ) ( not ( = ?auto_415901 ?auto_415911 ) ) ( not ( = ?auto_415901 ?auto_415912 ) ) ( not ( = ?auto_415901 ?auto_415913 ) ) ( not ( = ?auto_415902 ?auto_415903 ) ) ( not ( = ?auto_415902 ?auto_415904 ) ) ( not ( = ?auto_415902 ?auto_415905 ) ) ( not ( = ?auto_415902 ?auto_415906 ) ) ( not ( = ?auto_415902 ?auto_415907 ) ) ( not ( = ?auto_415902 ?auto_415908 ) ) ( not ( = ?auto_415902 ?auto_415909 ) ) ( not ( = ?auto_415902 ?auto_415910 ) ) ( not ( = ?auto_415902 ?auto_415911 ) ) ( not ( = ?auto_415902 ?auto_415912 ) ) ( not ( = ?auto_415902 ?auto_415913 ) ) ( not ( = ?auto_415903 ?auto_415904 ) ) ( not ( = ?auto_415903 ?auto_415905 ) ) ( not ( = ?auto_415903 ?auto_415906 ) ) ( not ( = ?auto_415903 ?auto_415907 ) ) ( not ( = ?auto_415903 ?auto_415908 ) ) ( not ( = ?auto_415903 ?auto_415909 ) ) ( not ( = ?auto_415903 ?auto_415910 ) ) ( not ( = ?auto_415903 ?auto_415911 ) ) ( not ( = ?auto_415903 ?auto_415912 ) ) ( not ( = ?auto_415903 ?auto_415913 ) ) ( not ( = ?auto_415904 ?auto_415905 ) ) ( not ( = ?auto_415904 ?auto_415906 ) ) ( not ( = ?auto_415904 ?auto_415907 ) ) ( not ( = ?auto_415904 ?auto_415908 ) ) ( not ( = ?auto_415904 ?auto_415909 ) ) ( not ( = ?auto_415904 ?auto_415910 ) ) ( not ( = ?auto_415904 ?auto_415911 ) ) ( not ( = ?auto_415904 ?auto_415912 ) ) ( not ( = ?auto_415904 ?auto_415913 ) ) ( not ( = ?auto_415905 ?auto_415906 ) ) ( not ( = ?auto_415905 ?auto_415907 ) ) ( not ( = ?auto_415905 ?auto_415908 ) ) ( not ( = ?auto_415905 ?auto_415909 ) ) ( not ( = ?auto_415905 ?auto_415910 ) ) ( not ( = ?auto_415905 ?auto_415911 ) ) ( not ( = ?auto_415905 ?auto_415912 ) ) ( not ( = ?auto_415905 ?auto_415913 ) ) ( not ( = ?auto_415906 ?auto_415907 ) ) ( not ( = ?auto_415906 ?auto_415908 ) ) ( not ( = ?auto_415906 ?auto_415909 ) ) ( not ( = ?auto_415906 ?auto_415910 ) ) ( not ( = ?auto_415906 ?auto_415911 ) ) ( not ( = ?auto_415906 ?auto_415912 ) ) ( not ( = ?auto_415906 ?auto_415913 ) ) ( not ( = ?auto_415907 ?auto_415908 ) ) ( not ( = ?auto_415907 ?auto_415909 ) ) ( not ( = ?auto_415907 ?auto_415910 ) ) ( not ( = ?auto_415907 ?auto_415911 ) ) ( not ( = ?auto_415907 ?auto_415912 ) ) ( not ( = ?auto_415907 ?auto_415913 ) ) ( not ( = ?auto_415908 ?auto_415909 ) ) ( not ( = ?auto_415908 ?auto_415910 ) ) ( not ( = ?auto_415908 ?auto_415911 ) ) ( not ( = ?auto_415908 ?auto_415912 ) ) ( not ( = ?auto_415908 ?auto_415913 ) ) ( not ( = ?auto_415909 ?auto_415910 ) ) ( not ( = ?auto_415909 ?auto_415911 ) ) ( not ( = ?auto_415909 ?auto_415912 ) ) ( not ( = ?auto_415909 ?auto_415913 ) ) ( not ( = ?auto_415910 ?auto_415911 ) ) ( not ( = ?auto_415910 ?auto_415912 ) ) ( not ( = ?auto_415910 ?auto_415913 ) ) ( not ( = ?auto_415911 ?auto_415912 ) ) ( not ( = ?auto_415911 ?auto_415913 ) ) ( not ( = ?auto_415912 ?auto_415913 ) ) ( ON ?auto_415911 ?auto_415912 ) ( ON ?auto_415910 ?auto_415911 ) ( ON ?auto_415909 ?auto_415910 ) ( ON ?auto_415908 ?auto_415909 ) ( ON ?auto_415907 ?auto_415908 ) ( CLEAR ?auto_415905 ) ( ON ?auto_415906 ?auto_415907 ) ( CLEAR ?auto_415906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_415900 ?auto_415901 ?auto_415902 ?auto_415903 ?auto_415904 ?auto_415905 ?auto_415906 )
      ( MAKE-13PILE ?auto_415900 ?auto_415901 ?auto_415902 ?auto_415903 ?auto_415904 ?auto_415905 ?auto_415906 ?auto_415907 ?auto_415908 ?auto_415909 ?auto_415910 ?auto_415911 ?auto_415912 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415927 - BLOCK
      ?auto_415928 - BLOCK
      ?auto_415929 - BLOCK
      ?auto_415930 - BLOCK
      ?auto_415931 - BLOCK
      ?auto_415932 - BLOCK
      ?auto_415933 - BLOCK
      ?auto_415934 - BLOCK
      ?auto_415935 - BLOCK
      ?auto_415936 - BLOCK
      ?auto_415937 - BLOCK
      ?auto_415938 - BLOCK
      ?auto_415939 - BLOCK
    )
    :vars
    (
      ?auto_415940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415939 ?auto_415940 ) ( ON-TABLE ?auto_415927 ) ( ON ?auto_415928 ?auto_415927 ) ( ON ?auto_415929 ?auto_415928 ) ( ON ?auto_415930 ?auto_415929 ) ( ON ?auto_415931 ?auto_415930 ) ( not ( = ?auto_415927 ?auto_415928 ) ) ( not ( = ?auto_415927 ?auto_415929 ) ) ( not ( = ?auto_415927 ?auto_415930 ) ) ( not ( = ?auto_415927 ?auto_415931 ) ) ( not ( = ?auto_415927 ?auto_415932 ) ) ( not ( = ?auto_415927 ?auto_415933 ) ) ( not ( = ?auto_415927 ?auto_415934 ) ) ( not ( = ?auto_415927 ?auto_415935 ) ) ( not ( = ?auto_415927 ?auto_415936 ) ) ( not ( = ?auto_415927 ?auto_415937 ) ) ( not ( = ?auto_415927 ?auto_415938 ) ) ( not ( = ?auto_415927 ?auto_415939 ) ) ( not ( = ?auto_415927 ?auto_415940 ) ) ( not ( = ?auto_415928 ?auto_415929 ) ) ( not ( = ?auto_415928 ?auto_415930 ) ) ( not ( = ?auto_415928 ?auto_415931 ) ) ( not ( = ?auto_415928 ?auto_415932 ) ) ( not ( = ?auto_415928 ?auto_415933 ) ) ( not ( = ?auto_415928 ?auto_415934 ) ) ( not ( = ?auto_415928 ?auto_415935 ) ) ( not ( = ?auto_415928 ?auto_415936 ) ) ( not ( = ?auto_415928 ?auto_415937 ) ) ( not ( = ?auto_415928 ?auto_415938 ) ) ( not ( = ?auto_415928 ?auto_415939 ) ) ( not ( = ?auto_415928 ?auto_415940 ) ) ( not ( = ?auto_415929 ?auto_415930 ) ) ( not ( = ?auto_415929 ?auto_415931 ) ) ( not ( = ?auto_415929 ?auto_415932 ) ) ( not ( = ?auto_415929 ?auto_415933 ) ) ( not ( = ?auto_415929 ?auto_415934 ) ) ( not ( = ?auto_415929 ?auto_415935 ) ) ( not ( = ?auto_415929 ?auto_415936 ) ) ( not ( = ?auto_415929 ?auto_415937 ) ) ( not ( = ?auto_415929 ?auto_415938 ) ) ( not ( = ?auto_415929 ?auto_415939 ) ) ( not ( = ?auto_415929 ?auto_415940 ) ) ( not ( = ?auto_415930 ?auto_415931 ) ) ( not ( = ?auto_415930 ?auto_415932 ) ) ( not ( = ?auto_415930 ?auto_415933 ) ) ( not ( = ?auto_415930 ?auto_415934 ) ) ( not ( = ?auto_415930 ?auto_415935 ) ) ( not ( = ?auto_415930 ?auto_415936 ) ) ( not ( = ?auto_415930 ?auto_415937 ) ) ( not ( = ?auto_415930 ?auto_415938 ) ) ( not ( = ?auto_415930 ?auto_415939 ) ) ( not ( = ?auto_415930 ?auto_415940 ) ) ( not ( = ?auto_415931 ?auto_415932 ) ) ( not ( = ?auto_415931 ?auto_415933 ) ) ( not ( = ?auto_415931 ?auto_415934 ) ) ( not ( = ?auto_415931 ?auto_415935 ) ) ( not ( = ?auto_415931 ?auto_415936 ) ) ( not ( = ?auto_415931 ?auto_415937 ) ) ( not ( = ?auto_415931 ?auto_415938 ) ) ( not ( = ?auto_415931 ?auto_415939 ) ) ( not ( = ?auto_415931 ?auto_415940 ) ) ( not ( = ?auto_415932 ?auto_415933 ) ) ( not ( = ?auto_415932 ?auto_415934 ) ) ( not ( = ?auto_415932 ?auto_415935 ) ) ( not ( = ?auto_415932 ?auto_415936 ) ) ( not ( = ?auto_415932 ?auto_415937 ) ) ( not ( = ?auto_415932 ?auto_415938 ) ) ( not ( = ?auto_415932 ?auto_415939 ) ) ( not ( = ?auto_415932 ?auto_415940 ) ) ( not ( = ?auto_415933 ?auto_415934 ) ) ( not ( = ?auto_415933 ?auto_415935 ) ) ( not ( = ?auto_415933 ?auto_415936 ) ) ( not ( = ?auto_415933 ?auto_415937 ) ) ( not ( = ?auto_415933 ?auto_415938 ) ) ( not ( = ?auto_415933 ?auto_415939 ) ) ( not ( = ?auto_415933 ?auto_415940 ) ) ( not ( = ?auto_415934 ?auto_415935 ) ) ( not ( = ?auto_415934 ?auto_415936 ) ) ( not ( = ?auto_415934 ?auto_415937 ) ) ( not ( = ?auto_415934 ?auto_415938 ) ) ( not ( = ?auto_415934 ?auto_415939 ) ) ( not ( = ?auto_415934 ?auto_415940 ) ) ( not ( = ?auto_415935 ?auto_415936 ) ) ( not ( = ?auto_415935 ?auto_415937 ) ) ( not ( = ?auto_415935 ?auto_415938 ) ) ( not ( = ?auto_415935 ?auto_415939 ) ) ( not ( = ?auto_415935 ?auto_415940 ) ) ( not ( = ?auto_415936 ?auto_415937 ) ) ( not ( = ?auto_415936 ?auto_415938 ) ) ( not ( = ?auto_415936 ?auto_415939 ) ) ( not ( = ?auto_415936 ?auto_415940 ) ) ( not ( = ?auto_415937 ?auto_415938 ) ) ( not ( = ?auto_415937 ?auto_415939 ) ) ( not ( = ?auto_415937 ?auto_415940 ) ) ( not ( = ?auto_415938 ?auto_415939 ) ) ( not ( = ?auto_415938 ?auto_415940 ) ) ( not ( = ?auto_415939 ?auto_415940 ) ) ( ON ?auto_415938 ?auto_415939 ) ( ON ?auto_415937 ?auto_415938 ) ( ON ?auto_415936 ?auto_415937 ) ( ON ?auto_415935 ?auto_415936 ) ( ON ?auto_415934 ?auto_415935 ) ( ON ?auto_415933 ?auto_415934 ) ( CLEAR ?auto_415931 ) ( ON ?auto_415932 ?auto_415933 ) ( CLEAR ?auto_415932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_415927 ?auto_415928 ?auto_415929 ?auto_415930 ?auto_415931 ?auto_415932 )
      ( MAKE-13PILE ?auto_415927 ?auto_415928 ?auto_415929 ?auto_415930 ?auto_415931 ?auto_415932 ?auto_415933 ?auto_415934 ?auto_415935 ?auto_415936 ?auto_415937 ?auto_415938 ?auto_415939 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415954 - BLOCK
      ?auto_415955 - BLOCK
      ?auto_415956 - BLOCK
      ?auto_415957 - BLOCK
      ?auto_415958 - BLOCK
      ?auto_415959 - BLOCK
      ?auto_415960 - BLOCK
      ?auto_415961 - BLOCK
      ?auto_415962 - BLOCK
      ?auto_415963 - BLOCK
      ?auto_415964 - BLOCK
      ?auto_415965 - BLOCK
      ?auto_415966 - BLOCK
    )
    :vars
    (
      ?auto_415967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415966 ?auto_415967 ) ( ON-TABLE ?auto_415954 ) ( ON ?auto_415955 ?auto_415954 ) ( ON ?auto_415956 ?auto_415955 ) ( ON ?auto_415957 ?auto_415956 ) ( ON ?auto_415958 ?auto_415957 ) ( not ( = ?auto_415954 ?auto_415955 ) ) ( not ( = ?auto_415954 ?auto_415956 ) ) ( not ( = ?auto_415954 ?auto_415957 ) ) ( not ( = ?auto_415954 ?auto_415958 ) ) ( not ( = ?auto_415954 ?auto_415959 ) ) ( not ( = ?auto_415954 ?auto_415960 ) ) ( not ( = ?auto_415954 ?auto_415961 ) ) ( not ( = ?auto_415954 ?auto_415962 ) ) ( not ( = ?auto_415954 ?auto_415963 ) ) ( not ( = ?auto_415954 ?auto_415964 ) ) ( not ( = ?auto_415954 ?auto_415965 ) ) ( not ( = ?auto_415954 ?auto_415966 ) ) ( not ( = ?auto_415954 ?auto_415967 ) ) ( not ( = ?auto_415955 ?auto_415956 ) ) ( not ( = ?auto_415955 ?auto_415957 ) ) ( not ( = ?auto_415955 ?auto_415958 ) ) ( not ( = ?auto_415955 ?auto_415959 ) ) ( not ( = ?auto_415955 ?auto_415960 ) ) ( not ( = ?auto_415955 ?auto_415961 ) ) ( not ( = ?auto_415955 ?auto_415962 ) ) ( not ( = ?auto_415955 ?auto_415963 ) ) ( not ( = ?auto_415955 ?auto_415964 ) ) ( not ( = ?auto_415955 ?auto_415965 ) ) ( not ( = ?auto_415955 ?auto_415966 ) ) ( not ( = ?auto_415955 ?auto_415967 ) ) ( not ( = ?auto_415956 ?auto_415957 ) ) ( not ( = ?auto_415956 ?auto_415958 ) ) ( not ( = ?auto_415956 ?auto_415959 ) ) ( not ( = ?auto_415956 ?auto_415960 ) ) ( not ( = ?auto_415956 ?auto_415961 ) ) ( not ( = ?auto_415956 ?auto_415962 ) ) ( not ( = ?auto_415956 ?auto_415963 ) ) ( not ( = ?auto_415956 ?auto_415964 ) ) ( not ( = ?auto_415956 ?auto_415965 ) ) ( not ( = ?auto_415956 ?auto_415966 ) ) ( not ( = ?auto_415956 ?auto_415967 ) ) ( not ( = ?auto_415957 ?auto_415958 ) ) ( not ( = ?auto_415957 ?auto_415959 ) ) ( not ( = ?auto_415957 ?auto_415960 ) ) ( not ( = ?auto_415957 ?auto_415961 ) ) ( not ( = ?auto_415957 ?auto_415962 ) ) ( not ( = ?auto_415957 ?auto_415963 ) ) ( not ( = ?auto_415957 ?auto_415964 ) ) ( not ( = ?auto_415957 ?auto_415965 ) ) ( not ( = ?auto_415957 ?auto_415966 ) ) ( not ( = ?auto_415957 ?auto_415967 ) ) ( not ( = ?auto_415958 ?auto_415959 ) ) ( not ( = ?auto_415958 ?auto_415960 ) ) ( not ( = ?auto_415958 ?auto_415961 ) ) ( not ( = ?auto_415958 ?auto_415962 ) ) ( not ( = ?auto_415958 ?auto_415963 ) ) ( not ( = ?auto_415958 ?auto_415964 ) ) ( not ( = ?auto_415958 ?auto_415965 ) ) ( not ( = ?auto_415958 ?auto_415966 ) ) ( not ( = ?auto_415958 ?auto_415967 ) ) ( not ( = ?auto_415959 ?auto_415960 ) ) ( not ( = ?auto_415959 ?auto_415961 ) ) ( not ( = ?auto_415959 ?auto_415962 ) ) ( not ( = ?auto_415959 ?auto_415963 ) ) ( not ( = ?auto_415959 ?auto_415964 ) ) ( not ( = ?auto_415959 ?auto_415965 ) ) ( not ( = ?auto_415959 ?auto_415966 ) ) ( not ( = ?auto_415959 ?auto_415967 ) ) ( not ( = ?auto_415960 ?auto_415961 ) ) ( not ( = ?auto_415960 ?auto_415962 ) ) ( not ( = ?auto_415960 ?auto_415963 ) ) ( not ( = ?auto_415960 ?auto_415964 ) ) ( not ( = ?auto_415960 ?auto_415965 ) ) ( not ( = ?auto_415960 ?auto_415966 ) ) ( not ( = ?auto_415960 ?auto_415967 ) ) ( not ( = ?auto_415961 ?auto_415962 ) ) ( not ( = ?auto_415961 ?auto_415963 ) ) ( not ( = ?auto_415961 ?auto_415964 ) ) ( not ( = ?auto_415961 ?auto_415965 ) ) ( not ( = ?auto_415961 ?auto_415966 ) ) ( not ( = ?auto_415961 ?auto_415967 ) ) ( not ( = ?auto_415962 ?auto_415963 ) ) ( not ( = ?auto_415962 ?auto_415964 ) ) ( not ( = ?auto_415962 ?auto_415965 ) ) ( not ( = ?auto_415962 ?auto_415966 ) ) ( not ( = ?auto_415962 ?auto_415967 ) ) ( not ( = ?auto_415963 ?auto_415964 ) ) ( not ( = ?auto_415963 ?auto_415965 ) ) ( not ( = ?auto_415963 ?auto_415966 ) ) ( not ( = ?auto_415963 ?auto_415967 ) ) ( not ( = ?auto_415964 ?auto_415965 ) ) ( not ( = ?auto_415964 ?auto_415966 ) ) ( not ( = ?auto_415964 ?auto_415967 ) ) ( not ( = ?auto_415965 ?auto_415966 ) ) ( not ( = ?auto_415965 ?auto_415967 ) ) ( not ( = ?auto_415966 ?auto_415967 ) ) ( ON ?auto_415965 ?auto_415966 ) ( ON ?auto_415964 ?auto_415965 ) ( ON ?auto_415963 ?auto_415964 ) ( ON ?auto_415962 ?auto_415963 ) ( ON ?auto_415961 ?auto_415962 ) ( ON ?auto_415960 ?auto_415961 ) ( CLEAR ?auto_415958 ) ( ON ?auto_415959 ?auto_415960 ) ( CLEAR ?auto_415959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_415954 ?auto_415955 ?auto_415956 ?auto_415957 ?auto_415958 ?auto_415959 )
      ( MAKE-13PILE ?auto_415954 ?auto_415955 ?auto_415956 ?auto_415957 ?auto_415958 ?auto_415959 ?auto_415960 ?auto_415961 ?auto_415962 ?auto_415963 ?auto_415964 ?auto_415965 ?auto_415966 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_415981 - BLOCK
      ?auto_415982 - BLOCK
      ?auto_415983 - BLOCK
      ?auto_415984 - BLOCK
      ?auto_415985 - BLOCK
      ?auto_415986 - BLOCK
      ?auto_415987 - BLOCK
      ?auto_415988 - BLOCK
      ?auto_415989 - BLOCK
      ?auto_415990 - BLOCK
      ?auto_415991 - BLOCK
      ?auto_415992 - BLOCK
      ?auto_415993 - BLOCK
    )
    :vars
    (
      ?auto_415994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_415993 ?auto_415994 ) ( ON-TABLE ?auto_415981 ) ( ON ?auto_415982 ?auto_415981 ) ( ON ?auto_415983 ?auto_415982 ) ( ON ?auto_415984 ?auto_415983 ) ( not ( = ?auto_415981 ?auto_415982 ) ) ( not ( = ?auto_415981 ?auto_415983 ) ) ( not ( = ?auto_415981 ?auto_415984 ) ) ( not ( = ?auto_415981 ?auto_415985 ) ) ( not ( = ?auto_415981 ?auto_415986 ) ) ( not ( = ?auto_415981 ?auto_415987 ) ) ( not ( = ?auto_415981 ?auto_415988 ) ) ( not ( = ?auto_415981 ?auto_415989 ) ) ( not ( = ?auto_415981 ?auto_415990 ) ) ( not ( = ?auto_415981 ?auto_415991 ) ) ( not ( = ?auto_415981 ?auto_415992 ) ) ( not ( = ?auto_415981 ?auto_415993 ) ) ( not ( = ?auto_415981 ?auto_415994 ) ) ( not ( = ?auto_415982 ?auto_415983 ) ) ( not ( = ?auto_415982 ?auto_415984 ) ) ( not ( = ?auto_415982 ?auto_415985 ) ) ( not ( = ?auto_415982 ?auto_415986 ) ) ( not ( = ?auto_415982 ?auto_415987 ) ) ( not ( = ?auto_415982 ?auto_415988 ) ) ( not ( = ?auto_415982 ?auto_415989 ) ) ( not ( = ?auto_415982 ?auto_415990 ) ) ( not ( = ?auto_415982 ?auto_415991 ) ) ( not ( = ?auto_415982 ?auto_415992 ) ) ( not ( = ?auto_415982 ?auto_415993 ) ) ( not ( = ?auto_415982 ?auto_415994 ) ) ( not ( = ?auto_415983 ?auto_415984 ) ) ( not ( = ?auto_415983 ?auto_415985 ) ) ( not ( = ?auto_415983 ?auto_415986 ) ) ( not ( = ?auto_415983 ?auto_415987 ) ) ( not ( = ?auto_415983 ?auto_415988 ) ) ( not ( = ?auto_415983 ?auto_415989 ) ) ( not ( = ?auto_415983 ?auto_415990 ) ) ( not ( = ?auto_415983 ?auto_415991 ) ) ( not ( = ?auto_415983 ?auto_415992 ) ) ( not ( = ?auto_415983 ?auto_415993 ) ) ( not ( = ?auto_415983 ?auto_415994 ) ) ( not ( = ?auto_415984 ?auto_415985 ) ) ( not ( = ?auto_415984 ?auto_415986 ) ) ( not ( = ?auto_415984 ?auto_415987 ) ) ( not ( = ?auto_415984 ?auto_415988 ) ) ( not ( = ?auto_415984 ?auto_415989 ) ) ( not ( = ?auto_415984 ?auto_415990 ) ) ( not ( = ?auto_415984 ?auto_415991 ) ) ( not ( = ?auto_415984 ?auto_415992 ) ) ( not ( = ?auto_415984 ?auto_415993 ) ) ( not ( = ?auto_415984 ?auto_415994 ) ) ( not ( = ?auto_415985 ?auto_415986 ) ) ( not ( = ?auto_415985 ?auto_415987 ) ) ( not ( = ?auto_415985 ?auto_415988 ) ) ( not ( = ?auto_415985 ?auto_415989 ) ) ( not ( = ?auto_415985 ?auto_415990 ) ) ( not ( = ?auto_415985 ?auto_415991 ) ) ( not ( = ?auto_415985 ?auto_415992 ) ) ( not ( = ?auto_415985 ?auto_415993 ) ) ( not ( = ?auto_415985 ?auto_415994 ) ) ( not ( = ?auto_415986 ?auto_415987 ) ) ( not ( = ?auto_415986 ?auto_415988 ) ) ( not ( = ?auto_415986 ?auto_415989 ) ) ( not ( = ?auto_415986 ?auto_415990 ) ) ( not ( = ?auto_415986 ?auto_415991 ) ) ( not ( = ?auto_415986 ?auto_415992 ) ) ( not ( = ?auto_415986 ?auto_415993 ) ) ( not ( = ?auto_415986 ?auto_415994 ) ) ( not ( = ?auto_415987 ?auto_415988 ) ) ( not ( = ?auto_415987 ?auto_415989 ) ) ( not ( = ?auto_415987 ?auto_415990 ) ) ( not ( = ?auto_415987 ?auto_415991 ) ) ( not ( = ?auto_415987 ?auto_415992 ) ) ( not ( = ?auto_415987 ?auto_415993 ) ) ( not ( = ?auto_415987 ?auto_415994 ) ) ( not ( = ?auto_415988 ?auto_415989 ) ) ( not ( = ?auto_415988 ?auto_415990 ) ) ( not ( = ?auto_415988 ?auto_415991 ) ) ( not ( = ?auto_415988 ?auto_415992 ) ) ( not ( = ?auto_415988 ?auto_415993 ) ) ( not ( = ?auto_415988 ?auto_415994 ) ) ( not ( = ?auto_415989 ?auto_415990 ) ) ( not ( = ?auto_415989 ?auto_415991 ) ) ( not ( = ?auto_415989 ?auto_415992 ) ) ( not ( = ?auto_415989 ?auto_415993 ) ) ( not ( = ?auto_415989 ?auto_415994 ) ) ( not ( = ?auto_415990 ?auto_415991 ) ) ( not ( = ?auto_415990 ?auto_415992 ) ) ( not ( = ?auto_415990 ?auto_415993 ) ) ( not ( = ?auto_415990 ?auto_415994 ) ) ( not ( = ?auto_415991 ?auto_415992 ) ) ( not ( = ?auto_415991 ?auto_415993 ) ) ( not ( = ?auto_415991 ?auto_415994 ) ) ( not ( = ?auto_415992 ?auto_415993 ) ) ( not ( = ?auto_415992 ?auto_415994 ) ) ( not ( = ?auto_415993 ?auto_415994 ) ) ( ON ?auto_415992 ?auto_415993 ) ( ON ?auto_415991 ?auto_415992 ) ( ON ?auto_415990 ?auto_415991 ) ( ON ?auto_415989 ?auto_415990 ) ( ON ?auto_415988 ?auto_415989 ) ( ON ?auto_415987 ?auto_415988 ) ( ON ?auto_415986 ?auto_415987 ) ( CLEAR ?auto_415984 ) ( ON ?auto_415985 ?auto_415986 ) ( CLEAR ?auto_415985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_415981 ?auto_415982 ?auto_415983 ?auto_415984 ?auto_415985 )
      ( MAKE-13PILE ?auto_415981 ?auto_415982 ?auto_415983 ?auto_415984 ?auto_415985 ?auto_415986 ?auto_415987 ?auto_415988 ?auto_415989 ?auto_415990 ?auto_415991 ?auto_415992 ?auto_415993 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416008 - BLOCK
      ?auto_416009 - BLOCK
      ?auto_416010 - BLOCK
      ?auto_416011 - BLOCK
      ?auto_416012 - BLOCK
      ?auto_416013 - BLOCK
      ?auto_416014 - BLOCK
      ?auto_416015 - BLOCK
      ?auto_416016 - BLOCK
      ?auto_416017 - BLOCK
      ?auto_416018 - BLOCK
      ?auto_416019 - BLOCK
      ?auto_416020 - BLOCK
    )
    :vars
    (
      ?auto_416021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416020 ?auto_416021 ) ( ON-TABLE ?auto_416008 ) ( ON ?auto_416009 ?auto_416008 ) ( ON ?auto_416010 ?auto_416009 ) ( ON ?auto_416011 ?auto_416010 ) ( not ( = ?auto_416008 ?auto_416009 ) ) ( not ( = ?auto_416008 ?auto_416010 ) ) ( not ( = ?auto_416008 ?auto_416011 ) ) ( not ( = ?auto_416008 ?auto_416012 ) ) ( not ( = ?auto_416008 ?auto_416013 ) ) ( not ( = ?auto_416008 ?auto_416014 ) ) ( not ( = ?auto_416008 ?auto_416015 ) ) ( not ( = ?auto_416008 ?auto_416016 ) ) ( not ( = ?auto_416008 ?auto_416017 ) ) ( not ( = ?auto_416008 ?auto_416018 ) ) ( not ( = ?auto_416008 ?auto_416019 ) ) ( not ( = ?auto_416008 ?auto_416020 ) ) ( not ( = ?auto_416008 ?auto_416021 ) ) ( not ( = ?auto_416009 ?auto_416010 ) ) ( not ( = ?auto_416009 ?auto_416011 ) ) ( not ( = ?auto_416009 ?auto_416012 ) ) ( not ( = ?auto_416009 ?auto_416013 ) ) ( not ( = ?auto_416009 ?auto_416014 ) ) ( not ( = ?auto_416009 ?auto_416015 ) ) ( not ( = ?auto_416009 ?auto_416016 ) ) ( not ( = ?auto_416009 ?auto_416017 ) ) ( not ( = ?auto_416009 ?auto_416018 ) ) ( not ( = ?auto_416009 ?auto_416019 ) ) ( not ( = ?auto_416009 ?auto_416020 ) ) ( not ( = ?auto_416009 ?auto_416021 ) ) ( not ( = ?auto_416010 ?auto_416011 ) ) ( not ( = ?auto_416010 ?auto_416012 ) ) ( not ( = ?auto_416010 ?auto_416013 ) ) ( not ( = ?auto_416010 ?auto_416014 ) ) ( not ( = ?auto_416010 ?auto_416015 ) ) ( not ( = ?auto_416010 ?auto_416016 ) ) ( not ( = ?auto_416010 ?auto_416017 ) ) ( not ( = ?auto_416010 ?auto_416018 ) ) ( not ( = ?auto_416010 ?auto_416019 ) ) ( not ( = ?auto_416010 ?auto_416020 ) ) ( not ( = ?auto_416010 ?auto_416021 ) ) ( not ( = ?auto_416011 ?auto_416012 ) ) ( not ( = ?auto_416011 ?auto_416013 ) ) ( not ( = ?auto_416011 ?auto_416014 ) ) ( not ( = ?auto_416011 ?auto_416015 ) ) ( not ( = ?auto_416011 ?auto_416016 ) ) ( not ( = ?auto_416011 ?auto_416017 ) ) ( not ( = ?auto_416011 ?auto_416018 ) ) ( not ( = ?auto_416011 ?auto_416019 ) ) ( not ( = ?auto_416011 ?auto_416020 ) ) ( not ( = ?auto_416011 ?auto_416021 ) ) ( not ( = ?auto_416012 ?auto_416013 ) ) ( not ( = ?auto_416012 ?auto_416014 ) ) ( not ( = ?auto_416012 ?auto_416015 ) ) ( not ( = ?auto_416012 ?auto_416016 ) ) ( not ( = ?auto_416012 ?auto_416017 ) ) ( not ( = ?auto_416012 ?auto_416018 ) ) ( not ( = ?auto_416012 ?auto_416019 ) ) ( not ( = ?auto_416012 ?auto_416020 ) ) ( not ( = ?auto_416012 ?auto_416021 ) ) ( not ( = ?auto_416013 ?auto_416014 ) ) ( not ( = ?auto_416013 ?auto_416015 ) ) ( not ( = ?auto_416013 ?auto_416016 ) ) ( not ( = ?auto_416013 ?auto_416017 ) ) ( not ( = ?auto_416013 ?auto_416018 ) ) ( not ( = ?auto_416013 ?auto_416019 ) ) ( not ( = ?auto_416013 ?auto_416020 ) ) ( not ( = ?auto_416013 ?auto_416021 ) ) ( not ( = ?auto_416014 ?auto_416015 ) ) ( not ( = ?auto_416014 ?auto_416016 ) ) ( not ( = ?auto_416014 ?auto_416017 ) ) ( not ( = ?auto_416014 ?auto_416018 ) ) ( not ( = ?auto_416014 ?auto_416019 ) ) ( not ( = ?auto_416014 ?auto_416020 ) ) ( not ( = ?auto_416014 ?auto_416021 ) ) ( not ( = ?auto_416015 ?auto_416016 ) ) ( not ( = ?auto_416015 ?auto_416017 ) ) ( not ( = ?auto_416015 ?auto_416018 ) ) ( not ( = ?auto_416015 ?auto_416019 ) ) ( not ( = ?auto_416015 ?auto_416020 ) ) ( not ( = ?auto_416015 ?auto_416021 ) ) ( not ( = ?auto_416016 ?auto_416017 ) ) ( not ( = ?auto_416016 ?auto_416018 ) ) ( not ( = ?auto_416016 ?auto_416019 ) ) ( not ( = ?auto_416016 ?auto_416020 ) ) ( not ( = ?auto_416016 ?auto_416021 ) ) ( not ( = ?auto_416017 ?auto_416018 ) ) ( not ( = ?auto_416017 ?auto_416019 ) ) ( not ( = ?auto_416017 ?auto_416020 ) ) ( not ( = ?auto_416017 ?auto_416021 ) ) ( not ( = ?auto_416018 ?auto_416019 ) ) ( not ( = ?auto_416018 ?auto_416020 ) ) ( not ( = ?auto_416018 ?auto_416021 ) ) ( not ( = ?auto_416019 ?auto_416020 ) ) ( not ( = ?auto_416019 ?auto_416021 ) ) ( not ( = ?auto_416020 ?auto_416021 ) ) ( ON ?auto_416019 ?auto_416020 ) ( ON ?auto_416018 ?auto_416019 ) ( ON ?auto_416017 ?auto_416018 ) ( ON ?auto_416016 ?auto_416017 ) ( ON ?auto_416015 ?auto_416016 ) ( ON ?auto_416014 ?auto_416015 ) ( ON ?auto_416013 ?auto_416014 ) ( CLEAR ?auto_416011 ) ( ON ?auto_416012 ?auto_416013 ) ( CLEAR ?auto_416012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_416008 ?auto_416009 ?auto_416010 ?auto_416011 ?auto_416012 )
      ( MAKE-13PILE ?auto_416008 ?auto_416009 ?auto_416010 ?auto_416011 ?auto_416012 ?auto_416013 ?auto_416014 ?auto_416015 ?auto_416016 ?auto_416017 ?auto_416018 ?auto_416019 ?auto_416020 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416035 - BLOCK
      ?auto_416036 - BLOCK
      ?auto_416037 - BLOCK
      ?auto_416038 - BLOCK
      ?auto_416039 - BLOCK
      ?auto_416040 - BLOCK
      ?auto_416041 - BLOCK
      ?auto_416042 - BLOCK
      ?auto_416043 - BLOCK
      ?auto_416044 - BLOCK
      ?auto_416045 - BLOCK
      ?auto_416046 - BLOCK
      ?auto_416047 - BLOCK
    )
    :vars
    (
      ?auto_416048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416047 ?auto_416048 ) ( ON-TABLE ?auto_416035 ) ( ON ?auto_416036 ?auto_416035 ) ( ON ?auto_416037 ?auto_416036 ) ( not ( = ?auto_416035 ?auto_416036 ) ) ( not ( = ?auto_416035 ?auto_416037 ) ) ( not ( = ?auto_416035 ?auto_416038 ) ) ( not ( = ?auto_416035 ?auto_416039 ) ) ( not ( = ?auto_416035 ?auto_416040 ) ) ( not ( = ?auto_416035 ?auto_416041 ) ) ( not ( = ?auto_416035 ?auto_416042 ) ) ( not ( = ?auto_416035 ?auto_416043 ) ) ( not ( = ?auto_416035 ?auto_416044 ) ) ( not ( = ?auto_416035 ?auto_416045 ) ) ( not ( = ?auto_416035 ?auto_416046 ) ) ( not ( = ?auto_416035 ?auto_416047 ) ) ( not ( = ?auto_416035 ?auto_416048 ) ) ( not ( = ?auto_416036 ?auto_416037 ) ) ( not ( = ?auto_416036 ?auto_416038 ) ) ( not ( = ?auto_416036 ?auto_416039 ) ) ( not ( = ?auto_416036 ?auto_416040 ) ) ( not ( = ?auto_416036 ?auto_416041 ) ) ( not ( = ?auto_416036 ?auto_416042 ) ) ( not ( = ?auto_416036 ?auto_416043 ) ) ( not ( = ?auto_416036 ?auto_416044 ) ) ( not ( = ?auto_416036 ?auto_416045 ) ) ( not ( = ?auto_416036 ?auto_416046 ) ) ( not ( = ?auto_416036 ?auto_416047 ) ) ( not ( = ?auto_416036 ?auto_416048 ) ) ( not ( = ?auto_416037 ?auto_416038 ) ) ( not ( = ?auto_416037 ?auto_416039 ) ) ( not ( = ?auto_416037 ?auto_416040 ) ) ( not ( = ?auto_416037 ?auto_416041 ) ) ( not ( = ?auto_416037 ?auto_416042 ) ) ( not ( = ?auto_416037 ?auto_416043 ) ) ( not ( = ?auto_416037 ?auto_416044 ) ) ( not ( = ?auto_416037 ?auto_416045 ) ) ( not ( = ?auto_416037 ?auto_416046 ) ) ( not ( = ?auto_416037 ?auto_416047 ) ) ( not ( = ?auto_416037 ?auto_416048 ) ) ( not ( = ?auto_416038 ?auto_416039 ) ) ( not ( = ?auto_416038 ?auto_416040 ) ) ( not ( = ?auto_416038 ?auto_416041 ) ) ( not ( = ?auto_416038 ?auto_416042 ) ) ( not ( = ?auto_416038 ?auto_416043 ) ) ( not ( = ?auto_416038 ?auto_416044 ) ) ( not ( = ?auto_416038 ?auto_416045 ) ) ( not ( = ?auto_416038 ?auto_416046 ) ) ( not ( = ?auto_416038 ?auto_416047 ) ) ( not ( = ?auto_416038 ?auto_416048 ) ) ( not ( = ?auto_416039 ?auto_416040 ) ) ( not ( = ?auto_416039 ?auto_416041 ) ) ( not ( = ?auto_416039 ?auto_416042 ) ) ( not ( = ?auto_416039 ?auto_416043 ) ) ( not ( = ?auto_416039 ?auto_416044 ) ) ( not ( = ?auto_416039 ?auto_416045 ) ) ( not ( = ?auto_416039 ?auto_416046 ) ) ( not ( = ?auto_416039 ?auto_416047 ) ) ( not ( = ?auto_416039 ?auto_416048 ) ) ( not ( = ?auto_416040 ?auto_416041 ) ) ( not ( = ?auto_416040 ?auto_416042 ) ) ( not ( = ?auto_416040 ?auto_416043 ) ) ( not ( = ?auto_416040 ?auto_416044 ) ) ( not ( = ?auto_416040 ?auto_416045 ) ) ( not ( = ?auto_416040 ?auto_416046 ) ) ( not ( = ?auto_416040 ?auto_416047 ) ) ( not ( = ?auto_416040 ?auto_416048 ) ) ( not ( = ?auto_416041 ?auto_416042 ) ) ( not ( = ?auto_416041 ?auto_416043 ) ) ( not ( = ?auto_416041 ?auto_416044 ) ) ( not ( = ?auto_416041 ?auto_416045 ) ) ( not ( = ?auto_416041 ?auto_416046 ) ) ( not ( = ?auto_416041 ?auto_416047 ) ) ( not ( = ?auto_416041 ?auto_416048 ) ) ( not ( = ?auto_416042 ?auto_416043 ) ) ( not ( = ?auto_416042 ?auto_416044 ) ) ( not ( = ?auto_416042 ?auto_416045 ) ) ( not ( = ?auto_416042 ?auto_416046 ) ) ( not ( = ?auto_416042 ?auto_416047 ) ) ( not ( = ?auto_416042 ?auto_416048 ) ) ( not ( = ?auto_416043 ?auto_416044 ) ) ( not ( = ?auto_416043 ?auto_416045 ) ) ( not ( = ?auto_416043 ?auto_416046 ) ) ( not ( = ?auto_416043 ?auto_416047 ) ) ( not ( = ?auto_416043 ?auto_416048 ) ) ( not ( = ?auto_416044 ?auto_416045 ) ) ( not ( = ?auto_416044 ?auto_416046 ) ) ( not ( = ?auto_416044 ?auto_416047 ) ) ( not ( = ?auto_416044 ?auto_416048 ) ) ( not ( = ?auto_416045 ?auto_416046 ) ) ( not ( = ?auto_416045 ?auto_416047 ) ) ( not ( = ?auto_416045 ?auto_416048 ) ) ( not ( = ?auto_416046 ?auto_416047 ) ) ( not ( = ?auto_416046 ?auto_416048 ) ) ( not ( = ?auto_416047 ?auto_416048 ) ) ( ON ?auto_416046 ?auto_416047 ) ( ON ?auto_416045 ?auto_416046 ) ( ON ?auto_416044 ?auto_416045 ) ( ON ?auto_416043 ?auto_416044 ) ( ON ?auto_416042 ?auto_416043 ) ( ON ?auto_416041 ?auto_416042 ) ( ON ?auto_416040 ?auto_416041 ) ( ON ?auto_416039 ?auto_416040 ) ( CLEAR ?auto_416037 ) ( ON ?auto_416038 ?auto_416039 ) ( CLEAR ?auto_416038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_416035 ?auto_416036 ?auto_416037 ?auto_416038 )
      ( MAKE-13PILE ?auto_416035 ?auto_416036 ?auto_416037 ?auto_416038 ?auto_416039 ?auto_416040 ?auto_416041 ?auto_416042 ?auto_416043 ?auto_416044 ?auto_416045 ?auto_416046 ?auto_416047 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416062 - BLOCK
      ?auto_416063 - BLOCK
      ?auto_416064 - BLOCK
      ?auto_416065 - BLOCK
      ?auto_416066 - BLOCK
      ?auto_416067 - BLOCK
      ?auto_416068 - BLOCK
      ?auto_416069 - BLOCK
      ?auto_416070 - BLOCK
      ?auto_416071 - BLOCK
      ?auto_416072 - BLOCK
      ?auto_416073 - BLOCK
      ?auto_416074 - BLOCK
    )
    :vars
    (
      ?auto_416075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416074 ?auto_416075 ) ( ON-TABLE ?auto_416062 ) ( ON ?auto_416063 ?auto_416062 ) ( ON ?auto_416064 ?auto_416063 ) ( not ( = ?auto_416062 ?auto_416063 ) ) ( not ( = ?auto_416062 ?auto_416064 ) ) ( not ( = ?auto_416062 ?auto_416065 ) ) ( not ( = ?auto_416062 ?auto_416066 ) ) ( not ( = ?auto_416062 ?auto_416067 ) ) ( not ( = ?auto_416062 ?auto_416068 ) ) ( not ( = ?auto_416062 ?auto_416069 ) ) ( not ( = ?auto_416062 ?auto_416070 ) ) ( not ( = ?auto_416062 ?auto_416071 ) ) ( not ( = ?auto_416062 ?auto_416072 ) ) ( not ( = ?auto_416062 ?auto_416073 ) ) ( not ( = ?auto_416062 ?auto_416074 ) ) ( not ( = ?auto_416062 ?auto_416075 ) ) ( not ( = ?auto_416063 ?auto_416064 ) ) ( not ( = ?auto_416063 ?auto_416065 ) ) ( not ( = ?auto_416063 ?auto_416066 ) ) ( not ( = ?auto_416063 ?auto_416067 ) ) ( not ( = ?auto_416063 ?auto_416068 ) ) ( not ( = ?auto_416063 ?auto_416069 ) ) ( not ( = ?auto_416063 ?auto_416070 ) ) ( not ( = ?auto_416063 ?auto_416071 ) ) ( not ( = ?auto_416063 ?auto_416072 ) ) ( not ( = ?auto_416063 ?auto_416073 ) ) ( not ( = ?auto_416063 ?auto_416074 ) ) ( not ( = ?auto_416063 ?auto_416075 ) ) ( not ( = ?auto_416064 ?auto_416065 ) ) ( not ( = ?auto_416064 ?auto_416066 ) ) ( not ( = ?auto_416064 ?auto_416067 ) ) ( not ( = ?auto_416064 ?auto_416068 ) ) ( not ( = ?auto_416064 ?auto_416069 ) ) ( not ( = ?auto_416064 ?auto_416070 ) ) ( not ( = ?auto_416064 ?auto_416071 ) ) ( not ( = ?auto_416064 ?auto_416072 ) ) ( not ( = ?auto_416064 ?auto_416073 ) ) ( not ( = ?auto_416064 ?auto_416074 ) ) ( not ( = ?auto_416064 ?auto_416075 ) ) ( not ( = ?auto_416065 ?auto_416066 ) ) ( not ( = ?auto_416065 ?auto_416067 ) ) ( not ( = ?auto_416065 ?auto_416068 ) ) ( not ( = ?auto_416065 ?auto_416069 ) ) ( not ( = ?auto_416065 ?auto_416070 ) ) ( not ( = ?auto_416065 ?auto_416071 ) ) ( not ( = ?auto_416065 ?auto_416072 ) ) ( not ( = ?auto_416065 ?auto_416073 ) ) ( not ( = ?auto_416065 ?auto_416074 ) ) ( not ( = ?auto_416065 ?auto_416075 ) ) ( not ( = ?auto_416066 ?auto_416067 ) ) ( not ( = ?auto_416066 ?auto_416068 ) ) ( not ( = ?auto_416066 ?auto_416069 ) ) ( not ( = ?auto_416066 ?auto_416070 ) ) ( not ( = ?auto_416066 ?auto_416071 ) ) ( not ( = ?auto_416066 ?auto_416072 ) ) ( not ( = ?auto_416066 ?auto_416073 ) ) ( not ( = ?auto_416066 ?auto_416074 ) ) ( not ( = ?auto_416066 ?auto_416075 ) ) ( not ( = ?auto_416067 ?auto_416068 ) ) ( not ( = ?auto_416067 ?auto_416069 ) ) ( not ( = ?auto_416067 ?auto_416070 ) ) ( not ( = ?auto_416067 ?auto_416071 ) ) ( not ( = ?auto_416067 ?auto_416072 ) ) ( not ( = ?auto_416067 ?auto_416073 ) ) ( not ( = ?auto_416067 ?auto_416074 ) ) ( not ( = ?auto_416067 ?auto_416075 ) ) ( not ( = ?auto_416068 ?auto_416069 ) ) ( not ( = ?auto_416068 ?auto_416070 ) ) ( not ( = ?auto_416068 ?auto_416071 ) ) ( not ( = ?auto_416068 ?auto_416072 ) ) ( not ( = ?auto_416068 ?auto_416073 ) ) ( not ( = ?auto_416068 ?auto_416074 ) ) ( not ( = ?auto_416068 ?auto_416075 ) ) ( not ( = ?auto_416069 ?auto_416070 ) ) ( not ( = ?auto_416069 ?auto_416071 ) ) ( not ( = ?auto_416069 ?auto_416072 ) ) ( not ( = ?auto_416069 ?auto_416073 ) ) ( not ( = ?auto_416069 ?auto_416074 ) ) ( not ( = ?auto_416069 ?auto_416075 ) ) ( not ( = ?auto_416070 ?auto_416071 ) ) ( not ( = ?auto_416070 ?auto_416072 ) ) ( not ( = ?auto_416070 ?auto_416073 ) ) ( not ( = ?auto_416070 ?auto_416074 ) ) ( not ( = ?auto_416070 ?auto_416075 ) ) ( not ( = ?auto_416071 ?auto_416072 ) ) ( not ( = ?auto_416071 ?auto_416073 ) ) ( not ( = ?auto_416071 ?auto_416074 ) ) ( not ( = ?auto_416071 ?auto_416075 ) ) ( not ( = ?auto_416072 ?auto_416073 ) ) ( not ( = ?auto_416072 ?auto_416074 ) ) ( not ( = ?auto_416072 ?auto_416075 ) ) ( not ( = ?auto_416073 ?auto_416074 ) ) ( not ( = ?auto_416073 ?auto_416075 ) ) ( not ( = ?auto_416074 ?auto_416075 ) ) ( ON ?auto_416073 ?auto_416074 ) ( ON ?auto_416072 ?auto_416073 ) ( ON ?auto_416071 ?auto_416072 ) ( ON ?auto_416070 ?auto_416071 ) ( ON ?auto_416069 ?auto_416070 ) ( ON ?auto_416068 ?auto_416069 ) ( ON ?auto_416067 ?auto_416068 ) ( ON ?auto_416066 ?auto_416067 ) ( CLEAR ?auto_416064 ) ( ON ?auto_416065 ?auto_416066 ) ( CLEAR ?auto_416065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_416062 ?auto_416063 ?auto_416064 ?auto_416065 )
      ( MAKE-13PILE ?auto_416062 ?auto_416063 ?auto_416064 ?auto_416065 ?auto_416066 ?auto_416067 ?auto_416068 ?auto_416069 ?auto_416070 ?auto_416071 ?auto_416072 ?auto_416073 ?auto_416074 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416089 - BLOCK
      ?auto_416090 - BLOCK
      ?auto_416091 - BLOCK
      ?auto_416092 - BLOCK
      ?auto_416093 - BLOCK
      ?auto_416094 - BLOCK
      ?auto_416095 - BLOCK
      ?auto_416096 - BLOCK
      ?auto_416097 - BLOCK
      ?auto_416098 - BLOCK
      ?auto_416099 - BLOCK
      ?auto_416100 - BLOCK
      ?auto_416101 - BLOCK
    )
    :vars
    (
      ?auto_416102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416101 ?auto_416102 ) ( ON-TABLE ?auto_416089 ) ( ON ?auto_416090 ?auto_416089 ) ( not ( = ?auto_416089 ?auto_416090 ) ) ( not ( = ?auto_416089 ?auto_416091 ) ) ( not ( = ?auto_416089 ?auto_416092 ) ) ( not ( = ?auto_416089 ?auto_416093 ) ) ( not ( = ?auto_416089 ?auto_416094 ) ) ( not ( = ?auto_416089 ?auto_416095 ) ) ( not ( = ?auto_416089 ?auto_416096 ) ) ( not ( = ?auto_416089 ?auto_416097 ) ) ( not ( = ?auto_416089 ?auto_416098 ) ) ( not ( = ?auto_416089 ?auto_416099 ) ) ( not ( = ?auto_416089 ?auto_416100 ) ) ( not ( = ?auto_416089 ?auto_416101 ) ) ( not ( = ?auto_416089 ?auto_416102 ) ) ( not ( = ?auto_416090 ?auto_416091 ) ) ( not ( = ?auto_416090 ?auto_416092 ) ) ( not ( = ?auto_416090 ?auto_416093 ) ) ( not ( = ?auto_416090 ?auto_416094 ) ) ( not ( = ?auto_416090 ?auto_416095 ) ) ( not ( = ?auto_416090 ?auto_416096 ) ) ( not ( = ?auto_416090 ?auto_416097 ) ) ( not ( = ?auto_416090 ?auto_416098 ) ) ( not ( = ?auto_416090 ?auto_416099 ) ) ( not ( = ?auto_416090 ?auto_416100 ) ) ( not ( = ?auto_416090 ?auto_416101 ) ) ( not ( = ?auto_416090 ?auto_416102 ) ) ( not ( = ?auto_416091 ?auto_416092 ) ) ( not ( = ?auto_416091 ?auto_416093 ) ) ( not ( = ?auto_416091 ?auto_416094 ) ) ( not ( = ?auto_416091 ?auto_416095 ) ) ( not ( = ?auto_416091 ?auto_416096 ) ) ( not ( = ?auto_416091 ?auto_416097 ) ) ( not ( = ?auto_416091 ?auto_416098 ) ) ( not ( = ?auto_416091 ?auto_416099 ) ) ( not ( = ?auto_416091 ?auto_416100 ) ) ( not ( = ?auto_416091 ?auto_416101 ) ) ( not ( = ?auto_416091 ?auto_416102 ) ) ( not ( = ?auto_416092 ?auto_416093 ) ) ( not ( = ?auto_416092 ?auto_416094 ) ) ( not ( = ?auto_416092 ?auto_416095 ) ) ( not ( = ?auto_416092 ?auto_416096 ) ) ( not ( = ?auto_416092 ?auto_416097 ) ) ( not ( = ?auto_416092 ?auto_416098 ) ) ( not ( = ?auto_416092 ?auto_416099 ) ) ( not ( = ?auto_416092 ?auto_416100 ) ) ( not ( = ?auto_416092 ?auto_416101 ) ) ( not ( = ?auto_416092 ?auto_416102 ) ) ( not ( = ?auto_416093 ?auto_416094 ) ) ( not ( = ?auto_416093 ?auto_416095 ) ) ( not ( = ?auto_416093 ?auto_416096 ) ) ( not ( = ?auto_416093 ?auto_416097 ) ) ( not ( = ?auto_416093 ?auto_416098 ) ) ( not ( = ?auto_416093 ?auto_416099 ) ) ( not ( = ?auto_416093 ?auto_416100 ) ) ( not ( = ?auto_416093 ?auto_416101 ) ) ( not ( = ?auto_416093 ?auto_416102 ) ) ( not ( = ?auto_416094 ?auto_416095 ) ) ( not ( = ?auto_416094 ?auto_416096 ) ) ( not ( = ?auto_416094 ?auto_416097 ) ) ( not ( = ?auto_416094 ?auto_416098 ) ) ( not ( = ?auto_416094 ?auto_416099 ) ) ( not ( = ?auto_416094 ?auto_416100 ) ) ( not ( = ?auto_416094 ?auto_416101 ) ) ( not ( = ?auto_416094 ?auto_416102 ) ) ( not ( = ?auto_416095 ?auto_416096 ) ) ( not ( = ?auto_416095 ?auto_416097 ) ) ( not ( = ?auto_416095 ?auto_416098 ) ) ( not ( = ?auto_416095 ?auto_416099 ) ) ( not ( = ?auto_416095 ?auto_416100 ) ) ( not ( = ?auto_416095 ?auto_416101 ) ) ( not ( = ?auto_416095 ?auto_416102 ) ) ( not ( = ?auto_416096 ?auto_416097 ) ) ( not ( = ?auto_416096 ?auto_416098 ) ) ( not ( = ?auto_416096 ?auto_416099 ) ) ( not ( = ?auto_416096 ?auto_416100 ) ) ( not ( = ?auto_416096 ?auto_416101 ) ) ( not ( = ?auto_416096 ?auto_416102 ) ) ( not ( = ?auto_416097 ?auto_416098 ) ) ( not ( = ?auto_416097 ?auto_416099 ) ) ( not ( = ?auto_416097 ?auto_416100 ) ) ( not ( = ?auto_416097 ?auto_416101 ) ) ( not ( = ?auto_416097 ?auto_416102 ) ) ( not ( = ?auto_416098 ?auto_416099 ) ) ( not ( = ?auto_416098 ?auto_416100 ) ) ( not ( = ?auto_416098 ?auto_416101 ) ) ( not ( = ?auto_416098 ?auto_416102 ) ) ( not ( = ?auto_416099 ?auto_416100 ) ) ( not ( = ?auto_416099 ?auto_416101 ) ) ( not ( = ?auto_416099 ?auto_416102 ) ) ( not ( = ?auto_416100 ?auto_416101 ) ) ( not ( = ?auto_416100 ?auto_416102 ) ) ( not ( = ?auto_416101 ?auto_416102 ) ) ( ON ?auto_416100 ?auto_416101 ) ( ON ?auto_416099 ?auto_416100 ) ( ON ?auto_416098 ?auto_416099 ) ( ON ?auto_416097 ?auto_416098 ) ( ON ?auto_416096 ?auto_416097 ) ( ON ?auto_416095 ?auto_416096 ) ( ON ?auto_416094 ?auto_416095 ) ( ON ?auto_416093 ?auto_416094 ) ( ON ?auto_416092 ?auto_416093 ) ( CLEAR ?auto_416090 ) ( ON ?auto_416091 ?auto_416092 ) ( CLEAR ?auto_416091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_416089 ?auto_416090 ?auto_416091 )
      ( MAKE-13PILE ?auto_416089 ?auto_416090 ?auto_416091 ?auto_416092 ?auto_416093 ?auto_416094 ?auto_416095 ?auto_416096 ?auto_416097 ?auto_416098 ?auto_416099 ?auto_416100 ?auto_416101 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416116 - BLOCK
      ?auto_416117 - BLOCK
      ?auto_416118 - BLOCK
      ?auto_416119 - BLOCK
      ?auto_416120 - BLOCK
      ?auto_416121 - BLOCK
      ?auto_416122 - BLOCK
      ?auto_416123 - BLOCK
      ?auto_416124 - BLOCK
      ?auto_416125 - BLOCK
      ?auto_416126 - BLOCK
      ?auto_416127 - BLOCK
      ?auto_416128 - BLOCK
    )
    :vars
    (
      ?auto_416129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416128 ?auto_416129 ) ( ON-TABLE ?auto_416116 ) ( ON ?auto_416117 ?auto_416116 ) ( not ( = ?auto_416116 ?auto_416117 ) ) ( not ( = ?auto_416116 ?auto_416118 ) ) ( not ( = ?auto_416116 ?auto_416119 ) ) ( not ( = ?auto_416116 ?auto_416120 ) ) ( not ( = ?auto_416116 ?auto_416121 ) ) ( not ( = ?auto_416116 ?auto_416122 ) ) ( not ( = ?auto_416116 ?auto_416123 ) ) ( not ( = ?auto_416116 ?auto_416124 ) ) ( not ( = ?auto_416116 ?auto_416125 ) ) ( not ( = ?auto_416116 ?auto_416126 ) ) ( not ( = ?auto_416116 ?auto_416127 ) ) ( not ( = ?auto_416116 ?auto_416128 ) ) ( not ( = ?auto_416116 ?auto_416129 ) ) ( not ( = ?auto_416117 ?auto_416118 ) ) ( not ( = ?auto_416117 ?auto_416119 ) ) ( not ( = ?auto_416117 ?auto_416120 ) ) ( not ( = ?auto_416117 ?auto_416121 ) ) ( not ( = ?auto_416117 ?auto_416122 ) ) ( not ( = ?auto_416117 ?auto_416123 ) ) ( not ( = ?auto_416117 ?auto_416124 ) ) ( not ( = ?auto_416117 ?auto_416125 ) ) ( not ( = ?auto_416117 ?auto_416126 ) ) ( not ( = ?auto_416117 ?auto_416127 ) ) ( not ( = ?auto_416117 ?auto_416128 ) ) ( not ( = ?auto_416117 ?auto_416129 ) ) ( not ( = ?auto_416118 ?auto_416119 ) ) ( not ( = ?auto_416118 ?auto_416120 ) ) ( not ( = ?auto_416118 ?auto_416121 ) ) ( not ( = ?auto_416118 ?auto_416122 ) ) ( not ( = ?auto_416118 ?auto_416123 ) ) ( not ( = ?auto_416118 ?auto_416124 ) ) ( not ( = ?auto_416118 ?auto_416125 ) ) ( not ( = ?auto_416118 ?auto_416126 ) ) ( not ( = ?auto_416118 ?auto_416127 ) ) ( not ( = ?auto_416118 ?auto_416128 ) ) ( not ( = ?auto_416118 ?auto_416129 ) ) ( not ( = ?auto_416119 ?auto_416120 ) ) ( not ( = ?auto_416119 ?auto_416121 ) ) ( not ( = ?auto_416119 ?auto_416122 ) ) ( not ( = ?auto_416119 ?auto_416123 ) ) ( not ( = ?auto_416119 ?auto_416124 ) ) ( not ( = ?auto_416119 ?auto_416125 ) ) ( not ( = ?auto_416119 ?auto_416126 ) ) ( not ( = ?auto_416119 ?auto_416127 ) ) ( not ( = ?auto_416119 ?auto_416128 ) ) ( not ( = ?auto_416119 ?auto_416129 ) ) ( not ( = ?auto_416120 ?auto_416121 ) ) ( not ( = ?auto_416120 ?auto_416122 ) ) ( not ( = ?auto_416120 ?auto_416123 ) ) ( not ( = ?auto_416120 ?auto_416124 ) ) ( not ( = ?auto_416120 ?auto_416125 ) ) ( not ( = ?auto_416120 ?auto_416126 ) ) ( not ( = ?auto_416120 ?auto_416127 ) ) ( not ( = ?auto_416120 ?auto_416128 ) ) ( not ( = ?auto_416120 ?auto_416129 ) ) ( not ( = ?auto_416121 ?auto_416122 ) ) ( not ( = ?auto_416121 ?auto_416123 ) ) ( not ( = ?auto_416121 ?auto_416124 ) ) ( not ( = ?auto_416121 ?auto_416125 ) ) ( not ( = ?auto_416121 ?auto_416126 ) ) ( not ( = ?auto_416121 ?auto_416127 ) ) ( not ( = ?auto_416121 ?auto_416128 ) ) ( not ( = ?auto_416121 ?auto_416129 ) ) ( not ( = ?auto_416122 ?auto_416123 ) ) ( not ( = ?auto_416122 ?auto_416124 ) ) ( not ( = ?auto_416122 ?auto_416125 ) ) ( not ( = ?auto_416122 ?auto_416126 ) ) ( not ( = ?auto_416122 ?auto_416127 ) ) ( not ( = ?auto_416122 ?auto_416128 ) ) ( not ( = ?auto_416122 ?auto_416129 ) ) ( not ( = ?auto_416123 ?auto_416124 ) ) ( not ( = ?auto_416123 ?auto_416125 ) ) ( not ( = ?auto_416123 ?auto_416126 ) ) ( not ( = ?auto_416123 ?auto_416127 ) ) ( not ( = ?auto_416123 ?auto_416128 ) ) ( not ( = ?auto_416123 ?auto_416129 ) ) ( not ( = ?auto_416124 ?auto_416125 ) ) ( not ( = ?auto_416124 ?auto_416126 ) ) ( not ( = ?auto_416124 ?auto_416127 ) ) ( not ( = ?auto_416124 ?auto_416128 ) ) ( not ( = ?auto_416124 ?auto_416129 ) ) ( not ( = ?auto_416125 ?auto_416126 ) ) ( not ( = ?auto_416125 ?auto_416127 ) ) ( not ( = ?auto_416125 ?auto_416128 ) ) ( not ( = ?auto_416125 ?auto_416129 ) ) ( not ( = ?auto_416126 ?auto_416127 ) ) ( not ( = ?auto_416126 ?auto_416128 ) ) ( not ( = ?auto_416126 ?auto_416129 ) ) ( not ( = ?auto_416127 ?auto_416128 ) ) ( not ( = ?auto_416127 ?auto_416129 ) ) ( not ( = ?auto_416128 ?auto_416129 ) ) ( ON ?auto_416127 ?auto_416128 ) ( ON ?auto_416126 ?auto_416127 ) ( ON ?auto_416125 ?auto_416126 ) ( ON ?auto_416124 ?auto_416125 ) ( ON ?auto_416123 ?auto_416124 ) ( ON ?auto_416122 ?auto_416123 ) ( ON ?auto_416121 ?auto_416122 ) ( ON ?auto_416120 ?auto_416121 ) ( ON ?auto_416119 ?auto_416120 ) ( CLEAR ?auto_416117 ) ( ON ?auto_416118 ?auto_416119 ) ( CLEAR ?auto_416118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_416116 ?auto_416117 ?auto_416118 )
      ( MAKE-13PILE ?auto_416116 ?auto_416117 ?auto_416118 ?auto_416119 ?auto_416120 ?auto_416121 ?auto_416122 ?auto_416123 ?auto_416124 ?auto_416125 ?auto_416126 ?auto_416127 ?auto_416128 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416143 - BLOCK
      ?auto_416144 - BLOCK
      ?auto_416145 - BLOCK
      ?auto_416146 - BLOCK
      ?auto_416147 - BLOCK
      ?auto_416148 - BLOCK
      ?auto_416149 - BLOCK
      ?auto_416150 - BLOCK
      ?auto_416151 - BLOCK
      ?auto_416152 - BLOCK
      ?auto_416153 - BLOCK
      ?auto_416154 - BLOCK
      ?auto_416155 - BLOCK
    )
    :vars
    (
      ?auto_416156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416155 ?auto_416156 ) ( ON-TABLE ?auto_416143 ) ( not ( = ?auto_416143 ?auto_416144 ) ) ( not ( = ?auto_416143 ?auto_416145 ) ) ( not ( = ?auto_416143 ?auto_416146 ) ) ( not ( = ?auto_416143 ?auto_416147 ) ) ( not ( = ?auto_416143 ?auto_416148 ) ) ( not ( = ?auto_416143 ?auto_416149 ) ) ( not ( = ?auto_416143 ?auto_416150 ) ) ( not ( = ?auto_416143 ?auto_416151 ) ) ( not ( = ?auto_416143 ?auto_416152 ) ) ( not ( = ?auto_416143 ?auto_416153 ) ) ( not ( = ?auto_416143 ?auto_416154 ) ) ( not ( = ?auto_416143 ?auto_416155 ) ) ( not ( = ?auto_416143 ?auto_416156 ) ) ( not ( = ?auto_416144 ?auto_416145 ) ) ( not ( = ?auto_416144 ?auto_416146 ) ) ( not ( = ?auto_416144 ?auto_416147 ) ) ( not ( = ?auto_416144 ?auto_416148 ) ) ( not ( = ?auto_416144 ?auto_416149 ) ) ( not ( = ?auto_416144 ?auto_416150 ) ) ( not ( = ?auto_416144 ?auto_416151 ) ) ( not ( = ?auto_416144 ?auto_416152 ) ) ( not ( = ?auto_416144 ?auto_416153 ) ) ( not ( = ?auto_416144 ?auto_416154 ) ) ( not ( = ?auto_416144 ?auto_416155 ) ) ( not ( = ?auto_416144 ?auto_416156 ) ) ( not ( = ?auto_416145 ?auto_416146 ) ) ( not ( = ?auto_416145 ?auto_416147 ) ) ( not ( = ?auto_416145 ?auto_416148 ) ) ( not ( = ?auto_416145 ?auto_416149 ) ) ( not ( = ?auto_416145 ?auto_416150 ) ) ( not ( = ?auto_416145 ?auto_416151 ) ) ( not ( = ?auto_416145 ?auto_416152 ) ) ( not ( = ?auto_416145 ?auto_416153 ) ) ( not ( = ?auto_416145 ?auto_416154 ) ) ( not ( = ?auto_416145 ?auto_416155 ) ) ( not ( = ?auto_416145 ?auto_416156 ) ) ( not ( = ?auto_416146 ?auto_416147 ) ) ( not ( = ?auto_416146 ?auto_416148 ) ) ( not ( = ?auto_416146 ?auto_416149 ) ) ( not ( = ?auto_416146 ?auto_416150 ) ) ( not ( = ?auto_416146 ?auto_416151 ) ) ( not ( = ?auto_416146 ?auto_416152 ) ) ( not ( = ?auto_416146 ?auto_416153 ) ) ( not ( = ?auto_416146 ?auto_416154 ) ) ( not ( = ?auto_416146 ?auto_416155 ) ) ( not ( = ?auto_416146 ?auto_416156 ) ) ( not ( = ?auto_416147 ?auto_416148 ) ) ( not ( = ?auto_416147 ?auto_416149 ) ) ( not ( = ?auto_416147 ?auto_416150 ) ) ( not ( = ?auto_416147 ?auto_416151 ) ) ( not ( = ?auto_416147 ?auto_416152 ) ) ( not ( = ?auto_416147 ?auto_416153 ) ) ( not ( = ?auto_416147 ?auto_416154 ) ) ( not ( = ?auto_416147 ?auto_416155 ) ) ( not ( = ?auto_416147 ?auto_416156 ) ) ( not ( = ?auto_416148 ?auto_416149 ) ) ( not ( = ?auto_416148 ?auto_416150 ) ) ( not ( = ?auto_416148 ?auto_416151 ) ) ( not ( = ?auto_416148 ?auto_416152 ) ) ( not ( = ?auto_416148 ?auto_416153 ) ) ( not ( = ?auto_416148 ?auto_416154 ) ) ( not ( = ?auto_416148 ?auto_416155 ) ) ( not ( = ?auto_416148 ?auto_416156 ) ) ( not ( = ?auto_416149 ?auto_416150 ) ) ( not ( = ?auto_416149 ?auto_416151 ) ) ( not ( = ?auto_416149 ?auto_416152 ) ) ( not ( = ?auto_416149 ?auto_416153 ) ) ( not ( = ?auto_416149 ?auto_416154 ) ) ( not ( = ?auto_416149 ?auto_416155 ) ) ( not ( = ?auto_416149 ?auto_416156 ) ) ( not ( = ?auto_416150 ?auto_416151 ) ) ( not ( = ?auto_416150 ?auto_416152 ) ) ( not ( = ?auto_416150 ?auto_416153 ) ) ( not ( = ?auto_416150 ?auto_416154 ) ) ( not ( = ?auto_416150 ?auto_416155 ) ) ( not ( = ?auto_416150 ?auto_416156 ) ) ( not ( = ?auto_416151 ?auto_416152 ) ) ( not ( = ?auto_416151 ?auto_416153 ) ) ( not ( = ?auto_416151 ?auto_416154 ) ) ( not ( = ?auto_416151 ?auto_416155 ) ) ( not ( = ?auto_416151 ?auto_416156 ) ) ( not ( = ?auto_416152 ?auto_416153 ) ) ( not ( = ?auto_416152 ?auto_416154 ) ) ( not ( = ?auto_416152 ?auto_416155 ) ) ( not ( = ?auto_416152 ?auto_416156 ) ) ( not ( = ?auto_416153 ?auto_416154 ) ) ( not ( = ?auto_416153 ?auto_416155 ) ) ( not ( = ?auto_416153 ?auto_416156 ) ) ( not ( = ?auto_416154 ?auto_416155 ) ) ( not ( = ?auto_416154 ?auto_416156 ) ) ( not ( = ?auto_416155 ?auto_416156 ) ) ( ON ?auto_416154 ?auto_416155 ) ( ON ?auto_416153 ?auto_416154 ) ( ON ?auto_416152 ?auto_416153 ) ( ON ?auto_416151 ?auto_416152 ) ( ON ?auto_416150 ?auto_416151 ) ( ON ?auto_416149 ?auto_416150 ) ( ON ?auto_416148 ?auto_416149 ) ( ON ?auto_416147 ?auto_416148 ) ( ON ?auto_416146 ?auto_416147 ) ( ON ?auto_416145 ?auto_416146 ) ( CLEAR ?auto_416143 ) ( ON ?auto_416144 ?auto_416145 ) ( CLEAR ?auto_416144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_416143 ?auto_416144 )
      ( MAKE-13PILE ?auto_416143 ?auto_416144 ?auto_416145 ?auto_416146 ?auto_416147 ?auto_416148 ?auto_416149 ?auto_416150 ?auto_416151 ?auto_416152 ?auto_416153 ?auto_416154 ?auto_416155 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416170 - BLOCK
      ?auto_416171 - BLOCK
      ?auto_416172 - BLOCK
      ?auto_416173 - BLOCK
      ?auto_416174 - BLOCK
      ?auto_416175 - BLOCK
      ?auto_416176 - BLOCK
      ?auto_416177 - BLOCK
      ?auto_416178 - BLOCK
      ?auto_416179 - BLOCK
      ?auto_416180 - BLOCK
      ?auto_416181 - BLOCK
      ?auto_416182 - BLOCK
    )
    :vars
    (
      ?auto_416183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416182 ?auto_416183 ) ( ON-TABLE ?auto_416170 ) ( not ( = ?auto_416170 ?auto_416171 ) ) ( not ( = ?auto_416170 ?auto_416172 ) ) ( not ( = ?auto_416170 ?auto_416173 ) ) ( not ( = ?auto_416170 ?auto_416174 ) ) ( not ( = ?auto_416170 ?auto_416175 ) ) ( not ( = ?auto_416170 ?auto_416176 ) ) ( not ( = ?auto_416170 ?auto_416177 ) ) ( not ( = ?auto_416170 ?auto_416178 ) ) ( not ( = ?auto_416170 ?auto_416179 ) ) ( not ( = ?auto_416170 ?auto_416180 ) ) ( not ( = ?auto_416170 ?auto_416181 ) ) ( not ( = ?auto_416170 ?auto_416182 ) ) ( not ( = ?auto_416170 ?auto_416183 ) ) ( not ( = ?auto_416171 ?auto_416172 ) ) ( not ( = ?auto_416171 ?auto_416173 ) ) ( not ( = ?auto_416171 ?auto_416174 ) ) ( not ( = ?auto_416171 ?auto_416175 ) ) ( not ( = ?auto_416171 ?auto_416176 ) ) ( not ( = ?auto_416171 ?auto_416177 ) ) ( not ( = ?auto_416171 ?auto_416178 ) ) ( not ( = ?auto_416171 ?auto_416179 ) ) ( not ( = ?auto_416171 ?auto_416180 ) ) ( not ( = ?auto_416171 ?auto_416181 ) ) ( not ( = ?auto_416171 ?auto_416182 ) ) ( not ( = ?auto_416171 ?auto_416183 ) ) ( not ( = ?auto_416172 ?auto_416173 ) ) ( not ( = ?auto_416172 ?auto_416174 ) ) ( not ( = ?auto_416172 ?auto_416175 ) ) ( not ( = ?auto_416172 ?auto_416176 ) ) ( not ( = ?auto_416172 ?auto_416177 ) ) ( not ( = ?auto_416172 ?auto_416178 ) ) ( not ( = ?auto_416172 ?auto_416179 ) ) ( not ( = ?auto_416172 ?auto_416180 ) ) ( not ( = ?auto_416172 ?auto_416181 ) ) ( not ( = ?auto_416172 ?auto_416182 ) ) ( not ( = ?auto_416172 ?auto_416183 ) ) ( not ( = ?auto_416173 ?auto_416174 ) ) ( not ( = ?auto_416173 ?auto_416175 ) ) ( not ( = ?auto_416173 ?auto_416176 ) ) ( not ( = ?auto_416173 ?auto_416177 ) ) ( not ( = ?auto_416173 ?auto_416178 ) ) ( not ( = ?auto_416173 ?auto_416179 ) ) ( not ( = ?auto_416173 ?auto_416180 ) ) ( not ( = ?auto_416173 ?auto_416181 ) ) ( not ( = ?auto_416173 ?auto_416182 ) ) ( not ( = ?auto_416173 ?auto_416183 ) ) ( not ( = ?auto_416174 ?auto_416175 ) ) ( not ( = ?auto_416174 ?auto_416176 ) ) ( not ( = ?auto_416174 ?auto_416177 ) ) ( not ( = ?auto_416174 ?auto_416178 ) ) ( not ( = ?auto_416174 ?auto_416179 ) ) ( not ( = ?auto_416174 ?auto_416180 ) ) ( not ( = ?auto_416174 ?auto_416181 ) ) ( not ( = ?auto_416174 ?auto_416182 ) ) ( not ( = ?auto_416174 ?auto_416183 ) ) ( not ( = ?auto_416175 ?auto_416176 ) ) ( not ( = ?auto_416175 ?auto_416177 ) ) ( not ( = ?auto_416175 ?auto_416178 ) ) ( not ( = ?auto_416175 ?auto_416179 ) ) ( not ( = ?auto_416175 ?auto_416180 ) ) ( not ( = ?auto_416175 ?auto_416181 ) ) ( not ( = ?auto_416175 ?auto_416182 ) ) ( not ( = ?auto_416175 ?auto_416183 ) ) ( not ( = ?auto_416176 ?auto_416177 ) ) ( not ( = ?auto_416176 ?auto_416178 ) ) ( not ( = ?auto_416176 ?auto_416179 ) ) ( not ( = ?auto_416176 ?auto_416180 ) ) ( not ( = ?auto_416176 ?auto_416181 ) ) ( not ( = ?auto_416176 ?auto_416182 ) ) ( not ( = ?auto_416176 ?auto_416183 ) ) ( not ( = ?auto_416177 ?auto_416178 ) ) ( not ( = ?auto_416177 ?auto_416179 ) ) ( not ( = ?auto_416177 ?auto_416180 ) ) ( not ( = ?auto_416177 ?auto_416181 ) ) ( not ( = ?auto_416177 ?auto_416182 ) ) ( not ( = ?auto_416177 ?auto_416183 ) ) ( not ( = ?auto_416178 ?auto_416179 ) ) ( not ( = ?auto_416178 ?auto_416180 ) ) ( not ( = ?auto_416178 ?auto_416181 ) ) ( not ( = ?auto_416178 ?auto_416182 ) ) ( not ( = ?auto_416178 ?auto_416183 ) ) ( not ( = ?auto_416179 ?auto_416180 ) ) ( not ( = ?auto_416179 ?auto_416181 ) ) ( not ( = ?auto_416179 ?auto_416182 ) ) ( not ( = ?auto_416179 ?auto_416183 ) ) ( not ( = ?auto_416180 ?auto_416181 ) ) ( not ( = ?auto_416180 ?auto_416182 ) ) ( not ( = ?auto_416180 ?auto_416183 ) ) ( not ( = ?auto_416181 ?auto_416182 ) ) ( not ( = ?auto_416181 ?auto_416183 ) ) ( not ( = ?auto_416182 ?auto_416183 ) ) ( ON ?auto_416181 ?auto_416182 ) ( ON ?auto_416180 ?auto_416181 ) ( ON ?auto_416179 ?auto_416180 ) ( ON ?auto_416178 ?auto_416179 ) ( ON ?auto_416177 ?auto_416178 ) ( ON ?auto_416176 ?auto_416177 ) ( ON ?auto_416175 ?auto_416176 ) ( ON ?auto_416174 ?auto_416175 ) ( ON ?auto_416173 ?auto_416174 ) ( ON ?auto_416172 ?auto_416173 ) ( CLEAR ?auto_416170 ) ( ON ?auto_416171 ?auto_416172 ) ( CLEAR ?auto_416171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_416170 ?auto_416171 )
      ( MAKE-13PILE ?auto_416170 ?auto_416171 ?auto_416172 ?auto_416173 ?auto_416174 ?auto_416175 ?auto_416176 ?auto_416177 ?auto_416178 ?auto_416179 ?auto_416180 ?auto_416181 ?auto_416182 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416197 - BLOCK
      ?auto_416198 - BLOCK
      ?auto_416199 - BLOCK
      ?auto_416200 - BLOCK
      ?auto_416201 - BLOCK
      ?auto_416202 - BLOCK
      ?auto_416203 - BLOCK
      ?auto_416204 - BLOCK
      ?auto_416205 - BLOCK
      ?auto_416206 - BLOCK
      ?auto_416207 - BLOCK
      ?auto_416208 - BLOCK
      ?auto_416209 - BLOCK
    )
    :vars
    (
      ?auto_416210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416209 ?auto_416210 ) ( not ( = ?auto_416197 ?auto_416198 ) ) ( not ( = ?auto_416197 ?auto_416199 ) ) ( not ( = ?auto_416197 ?auto_416200 ) ) ( not ( = ?auto_416197 ?auto_416201 ) ) ( not ( = ?auto_416197 ?auto_416202 ) ) ( not ( = ?auto_416197 ?auto_416203 ) ) ( not ( = ?auto_416197 ?auto_416204 ) ) ( not ( = ?auto_416197 ?auto_416205 ) ) ( not ( = ?auto_416197 ?auto_416206 ) ) ( not ( = ?auto_416197 ?auto_416207 ) ) ( not ( = ?auto_416197 ?auto_416208 ) ) ( not ( = ?auto_416197 ?auto_416209 ) ) ( not ( = ?auto_416197 ?auto_416210 ) ) ( not ( = ?auto_416198 ?auto_416199 ) ) ( not ( = ?auto_416198 ?auto_416200 ) ) ( not ( = ?auto_416198 ?auto_416201 ) ) ( not ( = ?auto_416198 ?auto_416202 ) ) ( not ( = ?auto_416198 ?auto_416203 ) ) ( not ( = ?auto_416198 ?auto_416204 ) ) ( not ( = ?auto_416198 ?auto_416205 ) ) ( not ( = ?auto_416198 ?auto_416206 ) ) ( not ( = ?auto_416198 ?auto_416207 ) ) ( not ( = ?auto_416198 ?auto_416208 ) ) ( not ( = ?auto_416198 ?auto_416209 ) ) ( not ( = ?auto_416198 ?auto_416210 ) ) ( not ( = ?auto_416199 ?auto_416200 ) ) ( not ( = ?auto_416199 ?auto_416201 ) ) ( not ( = ?auto_416199 ?auto_416202 ) ) ( not ( = ?auto_416199 ?auto_416203 ) ) ( not ( = ?auto_416199 ?auto_416204 ) ) ( not ( = ?auto_416199 ?auto_416205 ) ) ( not ( = ?auto_416199 ?auto_416206 ) ) ( not ( = ?auto_416199 ?auto_416207 ) ) ( not ( = ?auto_416199 ?auto_416208 ) ) ( not ( = ?auto_416199 ?auto_416209 ) ) ( not ( = ?auto_416199 ?auto_416210 ) ) ( not ( = ?auto_416200 ?auto_416201 ) ) ( not ( = ?auto_416200 ?auto_416202 ) ) ( not ( = ?auto_416200 ?auto_416203 ) ) ( not ( = ?auto_416200 ?auto_416204 ) ) ( not ( = ?auto_416200 ?auto_416205 ) ) ( not ( = ?auto_416200 ?auto_416206 ) ) ( not ( = ?auto_416200 ?auto_416207 ) ) ( not ( = ?auto_416200 ?auto_416208 ) ) ( not ( = ?auto_416200 ?auto_416209 ) ) ( not ( = ?auto_416200 ?auto_416210 ) ) ( not ( = ?auto_416201 ?auto_416202 ) ) ( not ( = ?auto_416201 ?auto_416203 ) ) ( not ( = ?auto_416201 ?auto_416204 ) ) ( not ( = ?auto_416201 ?auto_416205 ) ) ( not ( = ?auto_416201 ?auto_416206 ) ) ( not ( = ?auto_416201 ?auto_416207 ) ) ( not ( = ?auto_416201 ?auto_416208 ) ) ( not ( = ?auto_416201 ?auto_416209 ) ) ( not ( = ?auto_416201 ?auto_416210 ) ) ( not ( = ?auto_416202 ?auto_416203 ) ) ( not ( = ?auto_416202 ?auto_416204 ) ) ( not ( = ?auto_416202 ?auto_416205 ) ) ( not ( = ?auto_416202 ?auto_416206 ) ) ( not ( = ?auto_416202 ?auto_416207 ) ) ( not ( = ?auto_416202 ?auto_416208 ) ) ( not ( = ?auto_416202 ?auto_416209 ) ) ( not ( = ?auto_416202 ?auto_416210 ) ) ( not ( = ?auto_416203 ?auto_416204 ) ) ( not ( = ?auto_416203 ?auto_416205 ) ) ( not ( = ?auto_416203 ?auto_416206 ) ) ( not ( = ?auto_416203 ?auto_416207 ) ) ( not ( = ?auto_416203 ?auto_416208 ) ) ( not ( = ?auto_416203 ?auto_416209 ) ) ( not ( = ?auto_416203 ?auto_416210 ) ) ( not ( = ?auto_416204 ?auto_416205 ) ) ( not ( = ?auto_416204 ?auto_416206 ) ) ( not ( = ?auto_416204 ?auto_416207 ) ) ( not ( = ?auto_416204 ?auto_416208 ) ) ( not ( = ?auto_416204 ?auto_416209 ) ) ( not ( = ?auto_416204 ?auto_416210 ) ) ( not ( = ?auto_416205 ?auto_416206 ) ) ( not ( = ?auto_416205 ?auto_416207 ) ) ( not ( = ?auto_416205 ?auto_416208 ) ) ( not ( = ?auto_416205 ?auto_416209 ) ) ( not ( = ?auto_416205 ?auto_416210 ) ) ( not ( = ?auto_416206 ?auto_416207 ) ) ( not ( = ?auto_416206 ?auto_416208 ) ) ( not ( = ?auto_416206 ?auto_416209 ) ) ( not ( = ?auto_416206 ?auto_416210 ) ) ( not ( = ?auto_416207 ?auto_416208 ) ) ( not ( = ?auto_416207 ?auto_416209 ) ) ( not ( = ?auto_416207 ?auto_416210 ) ) ( not ( = ?auto_416208 ?auto_416209 ) ) ( not ( = ?auto_416208 ?auto_416210 ) ) ( not ( = ?auto_416209 ?auto_416210 ) ) ( ON ?auto_416208 ?auto_416209 ) ( ON ?auto_416207 ?auto_416208 ) ( ON ?auto_416206 ?auto_416207 ) ( ON ?auto_416205 ?auto_416206 ) ( ON ?auto_416204 ?auto_416205 ) ( ON ?auto_416203 ?auto_416204 ) ( ON ?auto_416202 ?auto_416203 ) ( ON ?auto_416201 ?auto_416202 ) ( ON ?auto_416200 ?auto_416201 ) ( ON ?auto_416199 ?auto_416200 ) ( ON ?auto_416198 ?auto_416199 ) ( ON ?auto_416197 ?auto_416198 ) ( CLEAR ?auto_416197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_416197 )
      ( MAKE-13PILE ?auto_416197 ?auto_416198 ?auto_416199 ?auto_416200 ?auto_416201 ?auto_416202 ?auto_416203 ?auto_416204 ?auto_416205 ?auto_416206 ?auto_416207 ?auto_416208 ?auto_416209 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_416224 - BLOCK
      ?auto_416225 - BLOCK
      ?auto_416226 - BLOCK
      ?auto_416227 - BLOCK
      ?auto_416228 - BLOCK
      ?auto_416229 - BLOCK
      ?auto_416230 - BLOCK
      ?auto_416231 - BLOCK
      ?auto_416232 - BLOCK
      ?auto_416233 - BLOCK
      ?auto_416234 - BLOCK
      ?auto_416235 - BLOCK
      ?auto_416236 - BLOCK
    )
    :vars
    (
      ?auto_416237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416236 ?auto_416237 ) ( not ( = ?auto_416224 ?auto_416225 ) ) ( not ( = ?auto_416224 ?auto_416226 ) ) ( not ( = ?auto_416224 ?auto_416227 ) ) ( not ( = ?auto_416224 ?auto_416228 ) ) ( not ( = ?auto_416224 ?auto_416229 ) ) ( not ( = ?auto_416224 ?auto_416230 ) ) ( not ( = ?auto_416224 ?auto_416231 ) ) ( not ( = ?auto_416224 ?auto_416232 ) ) ( not ( = ?auto_416224 ?auto_416233 ) ) ( not ( = ?auto_416224 ?auto_416234 ) ) ( not ( = ?auto_416224 ?auto_416235 ) ) ( not ( = ?auto_416224 ?auto_416236 ) ) ( not ( = ?auto_416224 ?auto_416237 ) ) ( not ( = ?auto_416225 ?auto_416226 ) ) ( not ( = ?auto_416225 ?auto_416227 ) ) ( not ( = ?auto_416225 ?auto_416228 ) ) ( not ( = ?auto_416225 ?auto_416229 ) ) ( not ( = ?auto_416225 ?auto_416230 ) ) ( not ( = ?auto_416225 ?auto_416231 ) ) ( not ( = ?auto_416225 ?auto_416232 ) ) ( not ( = ?auto_416225 ?auto_416233 ) ) ( not ( = ?auto_416225 ?auto_416234 ) ) ( not ( = ?auto_416225 ?auto_416235 ) ) ( not ( = ?auto_416225 ?auto_416236 ) ) ( not ( = ?auto_416225 ?auto_416237 ) ) ( not ( = ?auto_416226 ?auto_416227 ) ) ( not ( = ?auto_416226 ?auto_416228 ) ) ( not ( = ?auto_416226 ?auto_416229 ) ) ( not ( = ?auto_416226 ?auto_416230 ) ) ( not ( = ?auto_416226 ?auto_416231 ) ) ( not ( = ?auto_416226 ?auto_416232 ) ) ( not ( = ?auto_416226 ?auto_416233 ) ) ( not ( = ?auto_416226 ?auto_416234 ) ) ( not ( = ?auto_416226 ?auto_416235 ) ) ( not ( = ?auto_416226 ?auto_416236 ) ) ( not ( = ?auto_416226 ?auto_416237 ) ) ( not ( = ?auto_416227 ?auto_416228 ) ) ( not ( = ?auto_416227 ?auto_416229 ) ) ( not ( = ?auto_416227 ?auto_416230 ) ) ( not ( = ?auto_416227 ?auto_416231 ) ) ( not ( = ?auto_416227 ?auto_416232 ) ) ( not ( = ?auto_416227 ?auto_416233 ) ) ( not ( = ?auto_416227 ?auto_416234 ) ) ( not ( = ?auto_416227 ?auto_416235 ) ) ( not ( = ?auto_416227 ?auto_416236 ) ) ( not ( = ?auto_416227 ?auto_416237 ) ) ( not ( = ?auto_416228 ?auto_416229 ) ) ( not ( = ?auto_416228 ?auto_416230 ) ) ( not ( = ?auto_416228 ?auto_416231 ) ) ( not ( = ?auto_416228 ?auto_416232 ) ) ( not ( = ?auto_416228 ?auto_416233 ) ) ( not ( = ?auto_416228 ?auto_416234 ) ) ( not ( = ?auto_416228 ?auto_416235 ) ) ( not ( = ?auto_416228 ?auto_416236 ) ) ( not ( = ?auto_416228 ?auto_416237 ) ) ( not ( = ?auto_416229 ?auto_416230 ) ) ( not ( = ?auto_416229 ?auto_416231 ) ) ( not ( = ?auto_416229 ?auto_416232 ) ) ( not ( = ?auto_416229 ?auto_416233 ) ) ( not ( = ?auto_416229 ?auto_416234 ) ) ( not ( = ?auto_416229 ?auto_416235 ) ) ( not ( = ?auto_416229 ?auto_416236 ) ) ( not ( = ?auto_416229 ?auto_416237 ) ) ( not ( = ?auto_416230 ?auto_416231 ) ) ( not ( = ?auto_416230 ?auto_416232 ) ) ( not ( = ?auto_416230 ?auto_416233 ) ) ( not ( = ?auto_416230 ?auto_416234 ) ) ( not ( = ?auto_416230 ?auto_416235 ) ) ( not ( = ?auto_416230 ?auto_416236 ) ) ( not ( = ?auto_416230 ?auto_416237 ) ) ( not ( = ?auto_416231 ?auto_416232 ) ) ( not ( = ?auto_416231 ?auto_416233 ) ) ( not ( = ?auto_416231 ?auto_416234 ) ) ( not ( = ?auto_416231 ?auto_416235 ) ) ( not ( = ?auto_416231 ?auto_416236 ) ) ( not ( = ?auto_416231 ?auto_416237 ) ) ( not ( = ?auto_416232 ?auto_416233 ) ) ( not ( = ?auto_416232 ?auto_416234 ) ) ( not ( = ?auto_416232 ?auto_416235 ) ) ( not ( = ?auto_416232 ?auto_416236 ) ) ( not ( = ?auto_416232 ?auto_416237 ) ) ( not ( = ?auto_416233 ?auto_416234 ) ) ( not ( = ?auto_416233 ?auto_416235 ) ) ( not ( = ?auto_416233 ?auto_416236 ) ) ( not ( = ?auto_416233 ?auto_416237 ) ) ( not ( = ?auto_416234 ?auto_416235 ) ) ( not ( = ?auto_416234 ?auto_416236 ) ) ( not ( = ?auto_416234 ?auto_416237 ) ) ( not ( = ?auto_416235 ?auto_416236 ) ) ( not ( = ?auto_416235 ?auto_416237 ) ) ( not ( = ?auto_416236 ?auto_416237 ) ) ( ON ?auto_416235 ?auto_416236 ) ( ON ?auto_416234 ?auto_416235 ) ( ON ?auto_416233 ?auto_416234 ) ( ON ?auto_416232 ?auto_416233 ) ( ON ?auto_416231 ?auto_416232 ) ( ON ?auto_416230 ?auto_416231 ) ( ON ?auto_416229 ?auto_416230 ) ( ON ?auto_416228 ?auto_416229 ) ( ON ?auto_416227 ?auto_416228 ) ( ON ?auto_416226 ?auto_416227 ) ( ON ?auto_416225 ?auto_416226 ) ( ON ?auto_416224 ?auto_416225 ) ( CLEAR ?auto_416224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_416224 )
      ( MAKE-13PILE ?auto_416224 ?auto_416225 ?auto_416226 ?auto_416227 ?auto_416228 ?auto_416229 ?auto_416230 ?auto_416231 ?auto_416232 ?auto_416233 ?auto_416234 ?auto_416235 ?auto_416236 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416252 - BLOCK
      ?auto_416253 - BLOCK
      ?auto_416254 - BLOCK
      ?auto_416255 - BLOCK
      ?auto_416256 - BLOCK
      ?auto_416257 - BLOCK
      ?auto_416258 - BLOCK
      ?auto_416259 - BLOCK
      ?auto_416260 - BLOCK
      ?auto_416261 - BLOCK
      ?auto_416262 - BLOCK
      ?auto_416263 - BLOCK
      ?auto_416264 - BLOCK
      ?auto_416265 - BLOCK
    )
    :vars
    (
      ?auto_416266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_416264 ) ( ON ?auto_416265 ?auto_416266 ) ( CLEAR ?auto_416265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_416252 ) ( ON ?auto_416253 ?auto_416252 ) ( ON ?auto_416254 ?auto_416253 ) ( ON ?auto_416255 ?auto_416254 ) ( ON ?auto_416256 ?auto_416255 ) ( ON ?auto_416257 ?auto_416256 ) ( ON ?auto_416258 ?auto_416257 ) ( ON ?auto_416259 ?auto_416258 ) ( ON ?auto_416260 ?auto_416259 ) ( ON ?auto_416261 ?auto_416260 ) ( ON ?auto_416262 ?auto_416261 ) ( ON ?auto_416263 ?auto_416262 ) ( ON ?auto_416264 ?auto_416263 ) ( not ( = ?auto_416252 ?auto_416253 ) ) ( not ( = ?auto_416252 ?auto_416254 ) ) ( not ( = ?auto_416252 ?auto_416255 ) ) ( not ( = ?auto_416252 ?auto_416256 ) ) ( not ( = ?auto_416252 ?auto_416257 ) ) ( not ( = ?auto_416252 ?auto_416258 ) ) ( not ( = ?auto_416252 ?auto_416259 ) ) ( not ( = ?auto_416252 ?auto_416260 ) ) ( not ( = ?auto_416252 ?auto_416261 ) ) ( not ( = ?auto_416252 ?auto_416262 ) ) ( not ( = ?auto_416252 ?auto_416263 ) ) ( not ( = ?auto_416252 ?auto_416264 ) ) ( not ( = ?auto_416252 ?auto_416265 ) ) ( not ( = ?auto_416252 ?auto_416266 ) ) ( not ( = ?auto_416253 ?auto_416254 ) ) ( not ( = ?auto_416253 ?auto_416255 ) ) ( not ( = ?auto_416253 ?auto_416256 ) ) ( not ( = ?auto_416253 ?auto_416257 ) ) ( not ( = ?auto_416253 ?auto_416258 ) ) ( not ( = ?auto_416253 ?auto_416259 ) ) ( not ( = ?auto_416253 ?auto_416260 ) ) ( not ( = ?auto_416253 ?auto_416261 ) ) ( not ( = ?auto_416253 ?auto_416262 ) ) ( not ( = ?auto_416253 ?auto_416263 ) ) ( not ( = ?auto_416253 ?auto_416264 ) ) ( not ( = ?auto_416253 ?auto_416265 ) ) ( not ( = ?auto_416253 ?auto_416266 ) ) ( not ( = ?auto_416254 ?auto_416255 ) ) ( not ( = ?auto_416254 ?auto_416256 ) ) ( not ( = ?auto_416254 ?auto_416257 ) ) ( not ( = ?auto_416254 ?auto_416258 ) ) ( not ( = ?auto_416254 ?auto_416259 ) ) ( not ( = ?auto_416254 ?auto_416260 ) ) ( not ( = ?auto_416254 ?auto_416261 ) ) ( not ( = ?auto_416254 ?auto_416262 ) ) ( not ( = ?auto_416254 ?auto_416263 ) ) ( not ( = ?auto_416254 ?auto_416264 ) ) ( not ( = ?auto_416254 ?auto_416265 ) ) ( not ( = ?auto_416254 ?auto_416266 ) ) ( not ( = ?auto_416255 ?auto_416256 ) ) ( not ( = ?auto_416255 ?auto_416257 ) ) ( not ( = ?auto_416255 ?auto_416258 ) ) ( not ( = ?auto_416255 ?auto_416259 ) ) ( not ( = ?auto_416255 ?auto_416260 ) ) ( not ( = ?auto_416255 ?auto_416261 ) ) ( not ( = ?auto_416255 ?auto_416262 ) ) ( not ( = ?auto_416255 ?auto_416263 ) ) ( not ( = ?auto_416255 ?auto_416264 ) ) ( not ( = ?auto_416255 ?auto_416265 ) ) ( not ( = ?auto_416255 ?auto_416266 ) ) ( not ( = ?auto_416256 ?auto_416257 ) ) ( not ( = ?auto_416256 ?auto_416258 ) ) ( not ( = ?auto_416256 ?auto_416259 ) ) ( not ( = ?auto_416256 ?auto_416260 ) ) ( not ( = ?auto_416256 ?auto_416261 ) ) ( not ( = ?auto_416256 ?auto_416262 ) ) ( not ( = ?auto_416256 ?auto_416263 ) ) ( not ( = ?auto_416256 ?auto_416264 ) ) ( not ( = ?auto_416256 ?auto_416265 ) ) ( not ( = ?auto_416256 ?auto_416266 ) ) ( not ( = ?auto_416257 ?auto_416258 ) ) ( not ( = ?auto_416257 ?auto_416259 ) ) ( not ( = ?auto_416257 ?auto_416260 ) ) ( not ( = ?auto_416257 ?auto_416261 ) ) ( not ( = ?auto_416257 ?auto_416262 ) ) ( not ( = ?auto_416257 ?auto_416263 ) ) ( not ( = ?auto_416257 ?auto_416264 ) ) ( not ( = ?auto_416257 ?auto_416265 ) ) ( not ( = ?auto_416257 ?auto_416266 ) ) ( not ( = ?auto_416258 ?auto_416259 ) ) ( not ( = ?auto_416258 ?auto_416260 ) ) ( not ( = ?auto_416258 ?auto_416261 ) ) ( not ( = ?auto_416258 ?auto_416262 ) ) ( not ( = ?auto_416258 ?auto_416263 ) ) ( not ( = ?auto_416258 ?auto_416264 ) ) ( not ( = ?auto_416258 ?auto_416265 ) ) ( not ( = ?auto_416258 ?auto_416266 ) ) ( not ( = ?auto_416259 ?auto_416260 ) ) ( not ( = ?auto_416259 ?auto_416261 ) ) ( not ( = ?auto_416259 ?auto_416262 ) ) ( not ( = ?auto_416259 ?auto_416263 ) ) ( not ( = ?auto_416259 ?auto_416264 ) ) ( not ( = ?auto_416259 ?auto_416265 ) ) ( not ( = ?auto_416259 ?auto_416266 ) ) ( not ( = ?auto_416260 ?auto_416261 ) ) ( not ( = ?auto_416260 ?auto_416262 ) ) ( not ( = ?auto_416260 ?auto_416263 ) ) ( not ( = ?auto_416260 ?auto_416264 ) ) ( not ( = ?auto_416260 ?auto_416265 ) ) ( not ( = ?auto_416260 ?auto_416266 ) ) ( not ( = ?auto_416261 ?auto_416262 ) ) ( not ( = ?auto_416261 ?auto_416263 ) ) ( not ( = ?auto_416261 ?auto_416264 ) ) ( not ( = ?auto_416261 ?auto_416265 ) ) ( not ( = ?auto_416261 ?auto_416266 ) ) ( not ( = ?auto_416262 ?auto_416263 ) ) ( not ( = ?auto_416262 ?auto_416264 ) ) ( not ( = ?auto_416262 ?auto_416265 ) ) ( not ( = ?auto_416262 ?auto_416266 ) ) ( not ( = ?auto_416263 ?auto_416264 ) ) ( not ( = ?auto_416263 ?auto_416265 ) ) ( not ( = ?auto_416263 ?auto_416266 ) ) ( not ( = ?auto_416264 ?auto_416265 ) ) ( not ( = ?auto_416264 ?auto_416266 ) ) ( not ( = ?auto_416265 ?auto_416266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_416265 ?auto_416266 )
      ( !STACK ?auto_416265 ?auto_416264 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416281 - BLOCK
      ?auto_416282 - BLOCK
      ?auto_416283 - BLOCK
      ?auto_416284 - BLOCK
      ?auto_416285 - BLOCK
      ?auto_416286 - BLOCK
      ?auto_416287 - BLOCK
      ?auto_416288 - BLOCK
      ?auto_416289 - BLOCK
      ?auto_416290 - BLOCK
      ?auto_416291 - BLOCK
      ?auto_416292 - BLOCK
      ?auto_416293 - BLOCK
      ?auto_416294 - BLOCK
    )
    :vars
    (
      ?auto_416295 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_416293 ) ( ON ?auto_416294 ?auto_416295 ) ( CLEAR ?auto_416294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_416281 ) ( ON ?auto_416282 ?auto_416281 ) ( ON ?auto_416283 ?auto_416282 ) ( ON ?auto_416284 ?auto_416283 ) ( ON ?auto_416285 ?auto_416284 ) ( ON ?auto_416286 ?auto_416285 ) ( ON ?auto_416287 ?auto_416286 ) ( ON ?auto_416288 ?auto_416287 ) ( ON ?auto_416289 ?auto_416288 ) ( ON ?auto_416290 ?auto_416289 ) ( ON ?auto_416291 ?auto_416290 ) ( ON ?auto_416292 ?auto_416291 ) ( ON ?auto_416293 ?auto_416292 ) ( not ( = ?auto_416281 ?auto_416282 ) ) ( not ( = ?auto_416281 ?auto_416283 ) ) ( not ( = ?auto_416281 ?auto_416284 ) ) ( not ( = ?auto_416281 ?auto_416285 ) ) ( not ( = ?auto_416281 ?auto_416286 ) ) ( not ( = ?auto_416281 ?auto_416287 ) ) ( not ( = ?auto_416281 ?auto_416288 ) ) ( not ( = ?auto_416281 ?auto_416289 ) ) ( not ( = ?auto_416281 ?auto_416290 ) ) ( not ( = ?auto_416281 ?auto_416291 ) ) ( not ( = ?auto_416281 ?auto_416292 ) ) ( not ( = ?auto_416281 ?auto_416293 ) ) ( not ( = ?auto_416281 ?auto_416294 ) ) ( not ( = ?auto_416281 ?auto_416295 ) ) ( not ( = ?auto_416282 ?auto_416283 ) ) ( not ( = ?auto_416282 ?auto_416284 ) ) ( not ( = ?auto_416282 ?auto_416285 ) ) ( not ( = ?auto_416282 ?auto_416286 ) ) ( not ( = ?auto_416282 ?auto_416287 ) ) ( not ( = ?auto_416282 ?auto_416288 ) ) ( not ( = ?auto_416282 ?auto_416289 ) ) ( not ( = ?auto_416282 ?auto_416290 ) ) ( not ( = ?auto_416282 ?auto_416291 ) ) ( not ( = ?auto_416282 ?auto_416292 ) ) ( not ( = ?auto_416282 ?auto_416293 ) ) ( not ( = ?auto_416282 ?auto_416294 ) ) ( not ( = ?auto_416282 ?auto_416295 ) ) ( not ( = ?auto_416283 ?auto_416284 ) ) ( not ( = ?auto_416283 ?auto_416285 ) ) ( not ( = ?auto_416283 ?auto_416286 ) ) ( not ( = ?auto_416283 ?auto_416287 ) ) ( not ( = ?auto_416283 ?auto_416288 ) ) ( not ( = ?auto_416283 ?auto_416289 ) ) ( not ( = ?auto_416283 ?auto_416290 ) ) ( not ( = ?auto_416283 ?auto_416291 ) ) ( not ( = ?auto_416283 ?auto_416292 ) ) ( not ( = ?auto_416283 ?auto_416293 ) ) ( not ( = ?auto_416283 ?auto_416294 ) ) ( not ( = ?auto_416283 ?auto_416295 ) ) ( not ( = ?auto_416284 ?auto_416285 ) ) ( not ( = ?auto_416284 ?auto_416286 ) ) ( not ( = ?auto_416284 ?auto_416287 ) ) ( not ( = ?auto_416284 ?auto_416288 ) ) ( not ( = ?auto_416284 ?auto_416289 ) ) ( not ( = ?auto_416284 ?auto_416290 ) ) ( not ( = ?auto_416284 ?auto_416291 ) ) ( not ( = ?auto_416284 ?auto_416292 ) ) ( not ( = ?auto_416284 ?auto_416293 ) ) ( not ( = ?auto_416284 ?auto_416294 ) ) ( not ( = ?auto_416284 ?auto_416295 ) ) ( not ( = ?auto_416285 ?auto_416286 ) ) ( not ( = ?auto_416285 ?auto_416287 ) ) ( not ( = ?auto_416285 ?auto_416288 ) ) ( not ( = ?auto_416285 ?auto_416289 ) ) ( not ( = ?auto_416285 ?auto_416290 ) ) ( not ( = ?auto_416285 ?auto_416291 ) ) ( not ( = ?auto_416285 ?auto_416292 ) ) ( not ( = ?auto_416285 ?auto_416293 ) ) ( not ( = ?auto_416285 ?auto_416294 ) ) ( not ( = ?auto_416285 ?auto_416295 ) ) ( not ( = ?auto_416286 ?auto_416287 ) ) ( not ( = ?auto_416286 ?auto_416288 ) ) ( not ( = ?auto_416286 ?auto_416289 ) ) ( not ( = ?auto_416286 ?auto_416290 ) ) ( not ( = ?auto_416286 ?auto_416291 ) ) ( not ( = ?auto_416286 ?auto_416292 ) ) ( not ( = ?auto_416286 ?auto_416293 ) ) ( not ( = ?auto_416286 ?auto_416294 ) ) ( not ( = ?auto_416286 ?auto_416295 ) ) ( not ( = ?auto_416287 ?auto_416288 ) ) ( not ( = ?auto_416287 ?auto_416289 ) ) ( not ( = ?auto_416287 ?auto_416290 ) ) ( not ( = ?auto_416287 ?auto_416291 ) ) ( not ( = ?auto_416287 ?auto_416292 ) ) ( not ( = ?auto_416287 ?auto_416293 ) ) ( not ( = ?auto_416287 ?auto_416294 ) ) ( not ( = ?auto_416287 ?auto_416295 ) ) ( not ( = ?auto_416288 ?auto_416289 ) ) ( not ( = ?auto_416288 ?auto_416290 ) ) ( not ( = ?auto_416288 ?auto_416291 ) ) ( not ( = ?auto_416288 ?auto_416292 ) ) ( not ( = ?auto_416288 ?auto_416293 ) ) ( not ( = ?auto_416288 ?auto_416294 ) ) ( not ( = ?auto_416288 ?auto_416295 ) ) ( not ( = ?auto_416289 ?auto_416290 ) ) ( not ( = ?auto_416289 ?auto_416291 ) ) ( not ( = ?auto_416289 ?auto_416292 ) ) ( not ( = ?auto_416289 ?auto_416293 ) ) ( not ( = ?auto_416289 ?auto_416294 ) ) ( not ( = ?auto_416289 ?auto_416295 ) ) ( not ( = ?auto_416290 ?auto_416291 ) ) ( not ( = ?auto_416290 ?auto_416292 ) ) ( not ( = ?auto_416290 ?auto_416293 ) ) ( not ( = ?auto_416290 ?auto_416294 ) ) ( not ( = ?auto_416290 ?auto_416295 ) ) ( not ( = ?auto_416291 ?auto_416292 ) ) ( not ( = ?auto_416291 ?auto_416293 ) ) ( not ( = ?auto_416291 ?auto_416294 ) ) ( not ( = ?auto_416291 ?auto_416295 ) ) ( not ( = ?auto_416292 ?auto_416293 ) ) ( not ( = ?auto_416292 ?auto_416294 ) ) ( not ( = ?auto_416292 ?auto_416295 ) ) ( not ( = ?auto_416293 ?auto_416294 ) ) ( not ( = ?auto_416293 ?auto_416295 ) ) ( not ( = ?auto_416294 ?auto_416295 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_416294 ?auto_416295 )
      ( !STACK ?auto_416294 ?auto_416293 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416310 - BLOCK
      ?auto_416311 - BLOCK
      ?auto_416312 - BLOCK
      ?auto_416313 - BLOCK
      ?auto_416314 - BLOCK
      ?auto_416315 - BLOCK
      ?auto_416316 - BLOCK
      ?auto_416317 - BLOCK
      ?auto_416318 - BLOCK
      ?auto_416319 - BLOCK
      ?auto_416320 - BLOCK
      ?auto_416321 - BLOCK
      ?auto_416322 - BLOCK
      ?auto_416323 - BLOCK
    )
    :vars
    (
      ?auto_416324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416323 ?auto_416324 ) ( ON-TABLE ?auto_416310 ) ( ON ?auto_416311 ?auto_416310 ) ( ON ?auto_416312 ?auto_416311 ) ( ON ?auto_416313 ?auto_416312 ) ( ON ?auto_416314 ?auto_416313 ) ( ON ?auto_416315 ?auto_416314 ) ( ON ?auto_416316 ?auto_416315 ) ( ON ?auto_416317 ?auto_416316 ) ( ON ?auto_416318 ?auto_416317 ) ( ON ?auto_416319 ?auto_416318 ) ( ON ?auto_416320 ?auto_416319 ) ( ON ?auto_416321 ?auto_416320 ) ( not ( = ?auto_416310 ?auto_416311 ) ) ( not ( = ?auto_416310 ?auto_416312 ) ) ( not ( = ?auto_416310 ?auto_416313 ) ) ( not ( = ?auto_416310 ?auto_416314 ) ) ( not ( = ?auto_416310 ?auto_416315 ) ) ( not ( = ?auto_416310 ?auto_416316 ) ) ( not ( = ?auto_416310 ?auto_416317 ) ) ( not ( = ?auto_416310 ?auto_416318 ) ) ( not ( = ?auto_416310 ?auto_416319 ) ) ( not ( = ?auto_416310 ?auto_416320 ) ) ( not ( = ?auto_416310 ?auto_416321 ) ) ( not ( = ?auto_416310 ?auto_416322 ) ) ( not ( = ?auto_416310 ?auto_416323 ) ) ( not ( = ?auto_416310 ?auto_416324 ) ) ( not ( = ?auto_416311 ?auto_416312 ) ) ( not ( = ?auto_416311 ?auto_416313 ) ) ( not ( = ?auto_416311 ?auto_416314 ) ) ( not ( = ?auto_416311 ?auto_416315 ) ) ( not ( = ?auto_416311 ?auto_416316 ) ) ( not ( = ?auto_416311 ?auto_416317 ) ) ( not ( = ?auto_416311 ?auto_416318 ) ) ( not ( = ?auto_416311 ?auto_416319 ) ) ( not ( = ?auto_416311 ?auto_416320 ) ) ( not ( = ?auto_416311 ?auto_416321 ) ) ( not ( = ?auto_416311 ?auto_416322 ) ) ( not ( = ?auto_416311 ?auto_416323 ) ) ( not ( = ?auto_416311 ?auto_416324 ) ) ( not ( = ?auto_416312 ?auto_416313 ) ) ( not ( = ?auto_416312 ?auto_416314 ) ) ( not ( = ?auto_416312 ?auto_416315 ) ) ( not ( = ?auto_416312 ?auto_416316 ) ) ( not ( = ?auto_416312 ?auto_416317 ) ) ( not ( = ?auto_416312 ?auto_416318 ) ) ( not ( = ?auto_416312 ?auto_416319 ) ) ( not ( = ?auto_416312 ?auto_416320 ) ) ( not ( = ?auto_416312 ?auto_416321 ) ) ( not ( = ?auto_416312 ?auto_416322 ) ) ( not ( = ?auto_416312 ?auto_416323 ) ) ( not ( = ?auto_416312 ?auto_416324 ) ) ( not ( = ?auto_416313 ?auto_416314 ) ) ( not ( = ?auto_416313 ?auto_416315 ) ) ( not ( = ?auto_416313 ?auto_416316 ) ) ( not ( = ?auto_416313 ?auto_416317 ) ) ( not ( = ?auto_416313 ?auto_416318 ) ) ( not ( = ?auto_416313 ?auto_416319 ) ) ( not ( = ?auto_416313 ?auto_416320 ) ) ( not ( = ?auto_416313 ?auto_416321 ) ) ( not ( = ?auto_416313 ?auto_416322 ) ) ( not ( = ?auto_416313 ?auto_416323 ) ) ( not ( = ?auto_416313 ?auto_416324 ) ) ( not ( = ?auto_416314 ?auto_416315 ) ) ( not ( = ?auto_416314 ?auto_416316 ) ) ( not ( = ?auto_416314 ?auto_416317 ) ) ( not ( = ?auto_416314 ?auto_416318 ) ) ( not ( = ?auto_416314 ?auto_416319 ) ) ( not ( = ?auto_416314 ?auto_416320 ) ) ( not ( = ?auto_416314 ?auto_416321 ) ) ( not ( = ?auto_416314 ?auto_416322 ) ) ( not ( = ?auto_416314 ?auto_416323 ) ) ( not ( = ?auto_416314 ?auto_416324 ) ) ( not ( = ?auto_416315 ?auto_416316 ) ) ( not ( = ?auto_416315 ?auto_416317 ) ) ( not ( = ?auto_416315 ?auto_416318 ) ) ( not ( = ?auto_416315 ?auto_416319 ) ) ( not ( = ?auto_416315 ?auto_416320 ) ) ( not ( = ?auto_416315 ?auto_416321 ) ) ( not ( = ?auto_416315 ?auto_416322 ) ) ( not ( = ?auto_416315 ?auto_416323 ) ) ( not ( = ?auto_416315 ?auto_416324 ) ) ( not ( = ?auto_416316 ?auto_416317 ) ) ( not ( = ?auto_416316 ?auto_416318 ) ) ( not ( = ?auto_416316 ?auto_416319 ) ) ( not ( = ?auto_416316 ?auto_416320 ) ) ( not ( = ?auto_416316 ?auto_416321 ) ) ( not ( = ?auto_416316 ?auto_416322 ) ) ( not ( = ?auto_416316 ?auto_416323 ) ) ( not ( = ?auto_416316 ?auto_416324 ) ) ( not ( = ?auto_416317 ?auto_416318 ) ) ( not ( = ?auto_416317 ?auto_416319 ) ) ( not ( = ?auto_416317 ?auto_416320 ) ) ( not ( = ?auto_416317 ?auto_416321 ) ) ( not ( = ?auto_416317 ?auto_416322 ) ) ( not ( = ?auto_416317 ?auto_416323 ) ) ( not ( = ?auto_416317 ?auto_416324 ) ) ( not ( = ?auto_416318 ?auto_416319 ) ) ( not ( = ?auto_416318 ?auto_416320 ) ) ( not ( = ?auto_416318 ?auto_416321 ) ) ( not ( = ?auto_416318 ?auto_416322 ) ) ( not ( = ?auto_416318 ?auto_416323 ) ) ( not ( = ?auto_416318 ?auto_416324 ) ) ( not ( = ?auto_416319 ?auto_416320 ) ) ( not ( = ?auto_416319 ?auto_416321 ) ) ( not ( = ?auto_416319 ?auto_416322 ) ) ( not ( = ?auto_416319 ?auto_416323 ) ) ( not ( = ?auto_416319 ?auto_416324 ) ) ( not ( = ?auto_416320 ?auto_416321 ) ) ( not ( = ?auto_416320 ?auto_416322 ) ) ( not ( = ?auto_416320 ?auto_416323 ) ) ( not ( = ?auto_416320 ?auto_416324 ) ) ( not ( = ?auto_416321 ?auto_416322 ) ) ( not ( = ?auto_416321 ?auto_416323 ) ) ( not ( = ?auto_416321 ?auto_416324 ) ) ( not ( = ?auto_416322 ?auto_416323 ) ) ( not ( = ?auto_416322 ?auto_416324 ) ) ( not ( = ?auto_416323 ?auto_416324 ) ) ( CLEAR ?auto_416321 ) ( ON ?auto_416322 ?auto_416323 ) ( CLEAR ?auto_416322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_416310 ?auto_416311 ?auto_416312 ?auto_416313 ?auto_416314 ?auto_416315 ?auto_416316 ?auto_416317 ?auto_416318 ?auto_416319 ?auto_416320 ?auto_416321 ?auto_416322 )
      ( MAKE-14PILE ?auto_416310 ?auto_416311 ?auto_416312 ?auto_416313 ?auto_416314 ?auto_416315 ?auto_416316 ?auto_416317 ?auto_416318 ?auto_416319 ?auto_416320 ?auto_416321 ?auto_416322 ?auto_416323 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416339 - BLOCK
      ?auto_416340 - BLOCK
      ?auto_416341 - BLOCK
      ?auto_416342 - BLOCK
      ?auto_416343 - BLOCK
      ?auto_416344 - BLOCK
      ?auto_416345 - BLOCK
      ?auto_416346 - BLOCK
      ?auto_416347 - BLOCK
      ?auto_416348 - BLOCK
      ?auto_416349 - BLOCK
      ?auto_416350 - BLOCK
      ?auto_416351 - BLOCK
      ?auto_416352 - BLOCK
    )
    :vars
    (
      ?auto_416353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416352 ?auto_416353 ) ( ON-TABLE ?auto_416339 ) ( ON ?auto_416340 ?auto_416339 ) ( ON ?auto_416341 ?auto_416340 ) ( ON ?auto_416342 ?auto_416341 ) ( ON ?auto_416343 ?auto_416342 ) ( ON ?auto_416344 ?auto_416343 ) ( ON ?auto_416345 ?auto_416344 ) ( ON ?auto_416346 ?auto_416345 ) ( ON ?auto_416347 ?auto_416346 ) ( ON ?auto_416348 ?auto_416347 ) ( ON ?auto_416349 ?auto_416348 ) ( ON ?auto_416350 ?auto_416349 ) ( not ( = ?auto_416339 ?auto_416340 ) ) ( not ( = ?auto_416339 ?auto_416341 ) ) ( not ( = ?auto_416339 ?auto_416342 ) ) ( not ( = ?auto_416339 ?auto_416343 ) ) ( not ( = ?auto_416339 ?auto_416344 ) ) ( not ( = ?auto_416339 ?auto_416345 ) ) ( not ( = ?auto_416339 ?auto_416346 ) ) ( not ( = ?auto_416339 ?auto_416347 ) ) ( not ( = ?auto_416339 ?auto_416348 ) ) ( not ( = ?auto_416339 ?auto_416349 ) ) ( not ( = ?auto_416339 ?auto_416350 ) ) ( not ( = ?auto_416339 ?auto_416351 ) ) ( not ( = ?auto_416339 ?auto_416352 ) ) ( not ( = ?auto_416339 ?auto_416353 ) ) ( not ( = ?auto_416340 ?auto_416341 ) ) ( not ( = ?auto_416340 ?auto_416342 ) ) ( not ( = ?auto_416340 ?auto_416343 ) ) ( not ( = ?auto_416340 ?auto_416344 ) ) ( not ( = ?auto_416340 ?auto_416345 ) ) ( not ( = ?auto_416340 ?auto_416346 ) ) ( not ( = ?auto_416340 ?auto_416347 ) ) ( not ( = ?auto_416340 ?auto_416348 ) ) ( not ( = ?auto_416340 ?auto_416349 ) ) ( not ( = ?auto_416340 ?auto_416350 ) ) ( not ( = ?auto_416340 ?auto_416351 ) ) ( not ( = ?auto_416340 ?auto_416352 ) ) ( not ( = ?auto_416340 ?auto_416353 ) ) ( not ( = ?auto_416341 ?auto_416342 ) ) ( not ( = ?auto_416341 ?auto_416343 ) ) ( not ( = ?auto_416341 ?auto_416344 ) ) ( not ( = ?auto_416341 ?auto_416345 ) ) ( not ( = ?auto_416341 ?auto_416346 ) ) ( not ( = ?auto_416341 ?auto_416347 ) ) ( not ( = ?auto_416341 ?auto_416348 ) ) ( not ( = ?auto_416341 ?auto_416349 ) ) ( not ( = ?auto_416341 ?auto_416350 ) ) ( not ( = ?auto_416341 ?auto_416351 ) ) ( not ( = ?auto_416341 ?auto_416352 ) ) ( not ( = ?auto_416341 ?auto_416353 ) ) ( not ( = ?auto_416342 ?auto_416343 ) ) ( not ( = ?auto_416342 ?auto_416344 ) ) ( not ( = ?auto_416342 ?auto_416345 ) ) ( not ( = ?auto_416342 ?auto_416346 ) ) ( not ( = ?auto_416342 ?auto_416347 ) ) ( not ( = ?auto_416342 ?auto_416348 ) ) ( not ( = ?auto_416342 ?auto_416349 ) ) ( not ( = ?auto_416342 ?auto_416350 ) ) ( not ( = ?auto_416342 ?auto_416351 ) ) ( not ( = ?auto_416342 ?auto_416352 ) ) ( not ( = ?auto_416342 ?auto_416353 ) ) ( not ( = ?auto_416343 ?auto_416344 ) ) ( not ( = ?auto_416343 ?auto_416345 ) ) ( not ( = ?auto_416343 ?auto_416346 ) ) ( not ( = ?auto_416343 ?auto_416347 ) ) ( not ( = ?auto_416343 ?auto_416348 ) ) ( not ( = ?auto_416343 ?auto_416349 ) ) ( not ( = ?auto_416343 ?auto_416350 ) ) ( not ( = ?auto_416343 ?auto_416351 ) ) ( not ( = ?auto_416343 ?auto_416352 ) ) ( not ( = ?auto_416343 ?auto_416353 ) ) ( not ( = ?auto_416344 ?auto_416345 ) ) ( not ( = ?auto_416344 ?auto_416346 ) ) ( not ( = ?auto_416344 ?auto_416347 ) ) ( not ( = ?auto_416344 ?auto_416348 ) ) ( not ( = ?auto_416344 ?auto_416349 ) ) ( not ( = ?auto_416344 ?auto_416350 ) ) ( not ( = ?auto_416344 ?auto_416351 ) ) ( not ( = ?auto_416344 ?auto_416352 ) ) ( not ( = ?auto_416344 ?auto_416353 ) ) ( not ( = ?auto_416345 ?auto_416346 ) ) ( not ( = ?auto_416345 ?auto_416347 ) ) ( not ( = ?auto_416345 ?auto_416348 ) ) ( not ( = ?auto_416345 ?auto_416349 ) ) ( not ( = ?auto_416345 ?auto_416350 ) ) ( not ( = ?auto_416345 ?auto_416351 ) ) ( not ( = ?auto_416345 ?auto_416352 ) ) ( not ( = ?auto_416345 ?auto_416353 ) ) ( not ( = ?auto_416346 ?auto_416347 ) ) ( not ( = ?auto_416346 ?auto_416348 ) ) ( not ( = ?auto_416346 ?auto_416349 ) ) ( not ( = ?auto_416346 ?auto_416350 ) ) ( not ( = ?auto_416346 ?auto_416351 ) ) ( not ( = ?auto_416346 ?auto_416352 ) ) ( not ( = ?auto_416346 ?auto_416353 ) ) ( not ( = ?auto_416347 ?auto_416348 ) ) ( not ( = ?auto_416347 ?auto_416349 ) ) ( not ( = ?auto_416347 ?auto_416350 ) ) ( not ( = ?auto_416347 ?auto_416351 ) ) ( not ( = ?auto_416347 ?auto_416352 ) ) ( not ( = ?auto_416347 ?auto_416353 ) ) ( not ( = ?auto_416348 ?auto_416349 ) ) ( not ( = ?auto_416348 ?auto_416350 ) ) ( not ( = ?auto_416348 ?auto_416351 ) ) ( not ( = ?auto_416348 ?auto_416352 ) ) ( not ( = ?auto_416348 ?auto_416353 ) ) ( not ( = ?auto_416349 ?auto_416350 ) ) ( not ( = ?auto_416349 ?auto_416351 ) ) ( not ( = ?auto_416349 ?auto_416352 ) ) ( not ( = ?auto_416349 ?auto_416353 ) ) ( not ( = ?auto_416350 ?auto_416351 ) ) ( not ( = ?auto_416350 ?auto_416352 ) ) ( not ( = ?auto_416350 ?auto_416353 ) ) ( not ( = ?auto_416351 ?auto_416352 ) ) ( not ( = ?auto_416351 ?auto_416353 ) ) ( not ( = ?auto_416352 ?auto_416353 ) ) ( CLEAR ?auto_416350 ) ( ON ?auto_416351 ?auto_416352 ) ( CLEAR ?auto_416351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_416339 ?auto_416340 ?auto_416341 ?auto_416342 ?auto_416343 ?auto_416344 ?auto_416345 ?auto_416346 ?auto_416347 ?auto_416348 ?auto_416349 ?auto_416350 ?auto_416351 )
      ( MAKE-14PILE ?auto_416339 ?auto_416340 ?auto_416341 ?auto_416342 ?auto_416343 ?auto_416344 ?auto_416345 ?auto_416346 ?auto_416347 ?auto_416348 ?auto_416349 ?auto_416350 ?auto_416351 ?auto_416352 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416368 - BLOCK
      ?auto_416369 - BLOCK
      ?auto_416370 - BLOCK
      ?auto_416371 - BLOCK
      ?auto_416372 - BLOCK
      ?auto_416373 - BLOCK
      ?auto_416374 - BLOCK
      ?auto_416375 - BLOCK
      ?auto_416376 - BLOCK
      ?auto_416377 - BLOCK
      ?auto_416378 - BLOCK
      ?auto_416379 - BLOCK
      ?auto_416380 - BLOCK
      ?auto_416381 - BLOCK
    )
    :vars
    (
      ?auto_416382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416381 ?auto_416382 ) ( ON-TABLE ?auto_416368 ) ( ON ?auto_416369 ?auto_416368 ) ( ON ?auto_416370 ?auto_416369 ) ( ON ?auto_416371 ?auto_416370 ) ( ON ?auto_416372 ?auto_416371 ) ( ON ?auto_416373 ?auto_416372 ) ( ON ?auto_416374 ?auto_416373 ) ( ON ?auto_416375 ?auto_416374 ) ( ON ?auto_416376 ?auto_416375 ) ( ON ?auto_416377 ?auto_416376 ) ( ON ?auto_416378 ?auto_416377 ) ( not ( = ?auto_416368 ?auto_416369 ) ) ( not ( = ?auto_416368 ?auto_416370 ) ) ( not ( = ?auto_416368 ?auto_416371 ) ) ( not ( = ?auto_416368 ?auto_416372 ) ) ( not ( = ?auto_416368 ?auto_416373 ) ) ( not ( = ?auto_416368 ?auto_416374 ) ) ( not ( = ?auto_416368 ?auto_416375 ) ) ( not ( = ?auto_416368 ?auto_416376 ) ) ( not ( = ?auto_416368 ?auto_416377 ) ) ( not ( = ?auto_416368 ?auto_416378 ) ) ( not ( = ?auto_416368 ?auto_416379 ) ) ( not ( = ?auto_416368 ?auto_416380 ) ) ( not ( = ?auto_416368 ?auto_416381 ) ) ( not ( = ?auto_416368 ?auto_416382 ) ) ( not ( = ?auto_416369 ?auto_416370 ) ) ( not ( = ?auto_416369 ?auto_416371 ) ) ( not ( = ?auto_416369 ?auto_416372 ) ) ( not ( = ?auto_416369 ?auto_416373 ) ) ( not ( = ?auto_416369 ?auto_416374 ) ) ( not ( = ?auto_416369 ?auto_416375 ) ) ( not ( = ?auto_416369 ?auto_416376 ) ) ( not ( = ?auto_416369 ?auto_416377 ) ) ( not ( = ?auto_416369 ?auto_416378 ) ) ( not ( = ?auto_416369 ?auto_416379 ) ) ( not ( = ?auto_416369 ?auto_416380 ) ) ( not ( = ?auto_416369 ?auto_416381 ) ) ( not ( = ?auto_416369 ?auto_416382 ) ) ( not ( = ?auto_416370 ?auto_416371 ) ) ( not ( = ?auto_416370 ?auto_416372 ) ) ( not ( = ?auto_416370 ?auto_416373 ) ) ( not ( = ?auto_416370 ?auto_416374 ) ) ( not ( = ?auto_416370 ?auto_416375 ) ) ( not ( = ?auto_416370 ?auto_416376 ) ) ( not ( = ?auto_416370 ?auto_416377 ) ) ( not ( = ?auto_416370 ?auto_416378 ) ) ( not ( = ?auto_416370 ?auto_416379 ) ) ( not ( = ?auto_416370 ?auto_416380 ) ) ( not ( = ?auto_416370 ?auto_416381 ) ) ( not ( = ?auto_416370 ?auto_416382 ) ) ( not ( = ?auto_416371 ?auto_416372 ) ) ( not ( = ?auto_416371 ?auto_416373 ) ) ( not ( = ?auto_416371 ?auto_416374 ) ) ( not ( = ?auto_416371 ?auto_416375 ) ) ( not ( = ?auto_416371 ?auto_416376 ) ) ( not ( = ?auto_416371 ?auto_416377 ) ) ( not ( = ?auto_416371 ?auto_416378 ) ) ( not ( = ?auto_416371 ?auto_416379 ) ) ( not ( = ?auto_416371 ?auto_416380 ) ) ( not ( = ?auto_416371 ?auto_416381 ) ) ( not ( = ?auto_416371 ?auto_416382 ) ) ( not ( = ?auto_416372 ?auto_416373 ) ) ( not ( = ?auto_416372 ?auto_416374 ) ) ( not ( = ?auto_416372 ?auto_416375 ) ) ( not ( = ?auto_416372 ?auto_416376 ) ) ( not ( = ?auto_416372 ?auto_416377 ) ) ( not ( = ?auto_416372 ?auto_416378 ) ) ( not ( = ?auto_416372 ?auto_416379 ) ) ( not ( = ?auto_416372 ?auto_416380 ) ) ( not ( = ?auto_416372 ?auto_416381 ) ) ( not ( = ?auto_416372 ?auto_416382 ) ) ( not ( = ?auto_416373 ?auto_416374 ) ) ( not ( = ?auto_416373 ?auto_416375 ) ) ( not ( = ?auto_416373 ?auto_416376 ) ) ( not ( = ?auto_416373 ?auto_416377 ) ) ( not ( = ?auto_416373 ?auto_416378 ) ) ( not ( = ?auto_416373 ?auto_416379 ) ) ( not ( = ?auto_416373 ?auto_416380 ) ) ( not ( = ?auto_416373 ?auto_416381 ) ) ( not ( = ?auto_416373 ?auto_416382 ) ) ( not ( = ?auto_416374 ?auto_416375 ) ) ( not ( = ?auto_416374 ?auto_416376 ) ) ( not ( = ?auto_416374 ?auto_416377 ) ) ( not ( = ?auto_416374 ?auto_416378 ) ) ( not ( = ?auto_416374 ?auto_416379 ) ) ( not ( = ?auto_416374 ?auto_416380 ) ) ( not ( = ?auto_416374 ?auto_416381 ) ) ( not ( = ?auto_416374 ?auto_416382 ) ) ( not ( = ?auto_416375 ?auto_416376 ) ) ( not ( = ?auto_416375 ?auto_416377 ) ) ( not ( = ?auto_416375 ?auto_416378 ) ) ( not ( = ?auto_416375 ?auto_416379 ) ) ( not ( = ?auto_416375 ?auto_416380 ) ) ( not ( = ?auto_416375 ?auto_416381 ) ) ( not ( = ?auto_416375 ?auto_416382 ) ) ( not ( = ?auto_416376 ?auto_416377 ) ) ( not ( = ?auto_416376 ?auto_416378 ) ) ( not ( = ?auto_416376 ?auto_416379 ) ) ( not ( = ?auto_416376 ?auto_416380 ) ) ( not ( = ?auto_416376 ?auto_416381 ) ) ( not ( = ?auto_416376 ?auto_416382 ) ) ( not ( = ?auto_416377 ?auto_416378 ) ) ( not ( = ?auto_416377 ?auto_416379 ) ) ( not ( = ?auto_416377 ?auto_416380 ) ) ( not ( = ?auto_416377 ?auto_416381 ) ) ( not ( = ?auto_416377 ?auto_416382 ) ) ( not ( = ?auto_416378 ?auto_416379 ) ) ( not ( = ?auto_416378 ?auto_416380 ) ) ( not ( = ?auto_416378 ?auto_416381 ) ) ( not ( = ?auto_416378 ?auto_416382 ) ) ( not ( = ?auto_416379 ?auto_416380 ) ) ( not ( = ?auto_416379 ?auto_416381 ) ) ( not ( = ?auto_416379 ?auto_416382 ) ) ( not ( = ?auto_416380 ?auto_416381 ) ) ( not ( = ?auto_416380 ?auto_416382 ) ) ( not ( = ?auto_416381 ?auto_416382 ) ) ( ON ?auto_416380 ?auto_416381 ) ( CLEAR ?auto_416378 ) ( ON ?auto_416379 ?auto_416380 ) ( CLEAR ?auto_416379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_416368 ?auto_416369 ?auto_416370 ?auto_416371 ?auto_416372 ?auto_416373 ?auto_416374 ?auto_416375 ?auto_416376 ?auto_416377 ?auto_416378 ?auto_416379 )
      ( MAKE-14PILE ?auto_416368 ?auto_416369 ?auto_416370 ?auto_416371 ?auto_416372 ?auto_416373 ?auto_416374 ?auto_416375 ?auto_416376 ?auto_416377 ?auto_416378 ?auto_416379 ?auto_416380 ?auto_416381 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416397 - BLOCK
      ?auto_416398 - BLOCK
      ?auto_416399 - BLOCK
      ?auto_416400 - BLOCK
      ?auto_416401 - BLOCK
      ?auto_416402 - BLOCK
      ?auto_416403 - BLOCK
      ?auto_416404 - BLOCK
      ?auto_416405 - BLOCK
      ?auto_416406 - BLOCK
      ?auto_416407 - BLOCK
      ?auto_416408 - BLOCK
      ?auto_416409 - BLOCK
      ?auto_416410 - BLOCK
    )
    :vars
    (
      ?auto_416411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416410 ?auto_416411 ) ( ON-TABLE ?auto_416397 ) ( ON ?auto_416398 ?auto_416397 ) ( ON ?auto_416399 ?auto_416398 ) ( ON ?auto_416400 ?auto_416399 ) ( ON ?auto_416401 ?auto_416400 ) ( ON ?auto_416402 ?auto_416401 ) ( ON ?auto_416403 ?auto_416402 ) ( ON ?auto_416404 ?auto_416403 ) ( ON ?auto_416405 ?auto_416404 ) ( ON ?auto_416406 ?auto_416405 ) ( ON ?auto_416407 ?auto_416406 ) ( not ( = ?auto_416397 ?auto_416398 ) ) ( not ( = ?auto_416397 ?auto_416399 ) ) ( not ( = ?auto_416397 ?auto_416400 ) ) ( not ( = ?auto_416397 ?auto_416401 ) ) ( not ( = ?auto_416397 ?auto_416402 ) ) ( not ( = ?auto_416397 ?auto_416403 ) ) ( not ( = ?auto_416397 ?auto_416404 ) ) ( not ( = ?auto_416397 ?auto_416405 ) ) ( not ( = ?auto_416397 ?auto_416406 ) ) ( not ( = ?auto_416397 ?auto_416407 ) ) ( not ( = ?auto_416397 ?auto_416408 ) ) ( not ( = ?auto_416397 ?auto_416409 ) ) ( not ( = ?auto_416397 ?auto_416410 ) ) ( not ( = ?auto_416397 ?auto_416411 ) ) ( not ( = ?auto_416398 ?auto_416399 ) ) ( not ( = ?auto_416398 ?auto_416400 ) ) ( not ( = ?auto_416398 ?auto_416401 ) ) ( not ( = ?auto_416398 ?auto_416402 ) ) ( not ( = ?auto_416398 ?auto_416403 ) ) ( not ( = ?auto_416398 ?auto_416404 ) ) ( not ( = ?auto_416398 ?auto_416405 ) ) ( not ( = ?auto_416398 ?auto_416406 ) ) ( not ( = ?auto_416398 ?auto_416407 ) ) ( not ( = ?auto_416398 ?auto_416408 ) ) ( not ( = ?auto_416398 ?auto_416409 ) ) ( not ( = ?auto_416398 ?auto_416410 ) ) ( not ( = ?auto_416398 ?auto_416411 ) ) ( not ( = ?auto_416399 ?auto_416400 ) ) ( not ( = ?auto_416399 ?auto_416401 ) ) ( not ( = ?auto_416399 ?auto_416402 ) ) ( not ( = ?auto_416399 ?auto_416403 ) ) ( not ( = ?auto_416399 ?auto_416404 ) ) ( not ( = ?auto_416399 ?auto_416405 ) ) ( not ( = ?auto_416399 ?auto_416406 ) ) ( not ( = ?auto_416399 ?auto_416407 ) ) ( not ( = ?auto_416399 ?auto_416408 ) ) ( not ( = ?auto_416399 ?auto_416409 ) ) ( not ( = ?auto_416399 ?auto_416410 ) ) ( not ( = ?auto_416399 ?auto_416411 ) ) ( not ( = ?auto_416400 ?auto_416401 ) ) ( not ( = ?auto_416400 ?auto_416402 ) ) ( not ( = ?auto_416400 ?auto_416403 ) ) ( not ( = ?auto_416400 ?auto_416404 ) ) ( not ( = ?auto_416400 ?auto_416405 ) ) ( not ( = ?auto_416400 ?auto_416406 ) ) ( not ( = ?auto_416400 ?auto_416407 ) ) ( not ( = ?auto_416400 ?auto_416408 ) ) ( not ( = ?auto_416400 ?auto_416409 ) ) ( not ( = ?auto_416400 ?auto_416410 ) ) ( not ( = ?auto_416400 ?auto_416411 ) ) ( not ( = ?auto_416401 ?auto_416402 ) ) ( not ( = ?auto_416401 ?auto_416403 ) ) ( not ( = ?auto_416401 ?auto_416404 ) ) ( not ( = ?auto_416401 ?auto_416405 ) ) ( not ( = ?auto_416401 ?auto_416406 ) ) ( not ( = ?auto_416401 ?auto_416407 ) ) ( not ( = ?auto_416401 ?auto_416408 ) ) ( not ( = ?auto_416401 ?auto_416409 ) ) ( not ( = ?auto_416401 ?auto_416410 ) ) ( not ( = ?auto_416401 ?auto_416411 ) ) ( not ( = ?auto_416402 ?auto_416403 ) ) ( not ( = ?auto_416402 ?auto_416404 ) ) ( not ( = ?auto_416402 ?auto_416405 ) ) ( not ( = ?auto_416402 ?auto_416406 ) ) ( not ( = ?auto_416402 ?auto_416407 ) ) ( not ( = ?auto_416402 ?auto_416408 ) ) ( not ( = ?auto_416402 ?auto_416409 ) ) ( not ( = ?auto_416402 ?auto_416410 ) ) ( not ( = ?auto_416402 ?auto_416411 ) ) ( not ( = ?auto_416403 ?auto_416404 ) ) ( not ( = ?auto_416403 ?auto_416405 ) ) ( not ( = ?auto_416403 ?auto_416406 ) ) ( not ( = ?auto_416403 ?auto_416407 ) ) ( not ( = ?auto_416403 ?auto_416408 ) ) ( not ( = ?auto_416403 ?auto_416409 ) ) ( not ( = ?auto_416403 ?auto_416410 ) ) ( not ( = ?auto_416403 ?auto_416411 ) ) ( not ( = ?auto_416404 ?auto_416405 ) ) ( not ( = ?auto_416404 ?auto_416406 ) ) ( not ( = ?auto_416404 ?auto_416407 ) ) ( not ( = ?auto_416404 ?auto_416408 ) ) ( not ( = ?auto_416404 ?auto_416409 ) ) ( not ( = ?auto_416404 ?auto_416410 ) ) ( not ( = ?auto_416404 ?auto_416411 ) ) ( not ( = ?auto_416405 ?auto_416406 ) ) ( not ( = ?auto_416405 ?auto_416407 ) ) ( not ( = ?auto_416405 ?auto_416408 ) ) ( not ( = ?auto_416405 ?auto_416409 ) ) ( not ( = ?auto_416405 ?auto_416410 ) ) ( not ( = ?auto_416405 ?auto_416411 ) ) ( not ( = ?auto_416406 ?auto_416407 ) ) ( not ( = ?auto_416406 ?auto_416408 ) ) ( not ( = ?auto_416406 ?auto_416409 ) ) ( not ( = ?auto_416406 ?auto_416410 ) ) ( not ( = ?auto_416406 ?auto_416411 ) ) ( not ( = ?auto_416407 ?auto_416408 ) ) ( not ( = ?auto_416407 ?auto_416409 ) ) ( not ( = ?auto_416407 ?auto_416410 ) ) ( not ( = ?auto_416407 ?auto_416411 ) ) ( not ( = ?auto_416408 ?auto_416409 ) ) ( not ( = ?auto_416408 ?auto_416410 ) ) ( not ( = ?auto_416408 ?auto_416411 ) ) ( not ( = ?auto_416409 ?auto_416410 ) ) ( not ( = ?auto_416409 ?auto_416411 ) ) ( not ( = ?auto_416410 ?auto_416411 ) ) ( ON ?auto_416409 ?auto_416410 ) ( CLEAR ?auto_416407 ) ( ON ?auto_416408 ?auto_416409 ) ( CLEAR ?auto_416408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_416397 ?auto_416398 ?auto_416399 ?auto_416400 ?auto_416401 ?auto_416402 ?auto_416403 ?auto_416404 ?auto_416405 ?auto_416406 ?auto_416407 ?auto_416408 )
      ( MAKE-14PILE ?auto_416397 ?auto_416398 ?auto_416399 ?auto_416400 ?auto_416401 ?auto_416402 ?auto_416403 ?auto_416404 ?auto_416405 ?auto_416406 ?auto_416407 ?auto_416408 ?auto_416409 ?auto_416410 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416426 - BLOCK
      ?auto_416427 - BLOCK
      ?auto_416428 - BLOCK
      ?auto_416429 - BLOCK
      ?auto_416430 - BLOCK
      ?auto_416431 - BLOCK
      ?auto_416432 - BLOCK
      ?auto_416433 - BLOCK
      ?auto_416434 - BLOCK
      ?auto_416435 - BLOCK
      ?auto_416436 - BLOCK
      ?auto_416437 - BLOCK
      ?auto_416438 - BLOCK
      ?auto_416439 - BLOCK
    )
    :vars
    (
      ?auto_416440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416439 ?auto_416440 ) ( ON-TABLE ?auto_416426 ) ( ON ?auto_416427 ?auto_416426 ) ( ON ?auto_416428 ?auto_416427 ) ( ON ?auto_416429 ?auto_416428 ) ( ON ?auto_416430 ?auto_416429 ) ( ON ?auto_416431 ?auto_416430 ) ( ON ?auto_416432 ?auto_416431 ) ( ON ?auto_416433 ?auto_416432 ) ( ON ?auto_416434 ?auto_416433 ) ( ON ?auto_416435 ?auto_416434 ) ( not ( = ?auto_416426 ?auto_416427 ) ) ( not ( = ?auto_416426 ?auto_416428 ) ) ( not ( = ?auto_416426 ?auto_416429 ) ) ( not ( = ?auto_416426 ?auto_416430 ) ) ( not ( = ?auto_416426 ?auto_416431 ) ) ( not ( = ?auto_416426 ?auto_416432 ) ) ( not ( = ?auto_416426 ?auto_416433 ) ) ( not ( = ?auto_416426 ?auto_416434 ) ) ( not ( = ?auto_416426 ?auto_416435 ) ) ( not ( = ?auto_416426 ?auto_416436 ) ) ( not ( = ?auto_416426 ?auto_416437 ) ) ( not ( = ?auto_416426 ?auto_416438 ) ) ( not ( = ?auto_416426 ?auto_416439 ) ) ( not ( = ?auto_416426 ?auto_416440 ) ) ( not ( = ?auto_416427 ?auto_416428 ) ) ( not ( = ?auto_416427 ?auto_416429 ) ) ( not ( = ?auto_416427 ?auto_416430 ) ) ( not ( = ?auto_416427 ?auto_416431 ) ) ( not ( = ?auto_416427 ?auto_416432 ) ) ( not ( = ?auto_416427 ?auto_416433 ) ) ( not ( = ?auto_416427 ?auto_416434 ) ) ( not ( = ?auto_416427 ?auto_416435 ) ) ( not ( = ?auto_416427 ?auto_416436 ) ) ( not ( = ?auto_416427 ?auto_416437 ) ) ( not ( = ?auto_416427 ?auto_416438 ) ) ( not ( = ?auto_416427 ?auto_416439 ) ) ( not ( = ?auto_416427 ?auto_416440 ) ) ( not ( = ?auto_416428 ?auto_416429 ) ) ( not ( = ?auto_416428 ?auto_416430 ) ) ( not ( = ?auto_416428 ?auto_416431 ) ) ( not ( = ?auto_416428 ?auto_416432 ) ) ( not ( = ?auto_416428 ?auto_416433 ) ) ( not ( = ?auto_416428 ?auto_416434 ) ) ( not ( = ?auto_416428 ?auto_416435 ) ) ( not ( = ?auto_416428 ?auto_416436 ) ) ( not ( = ?auto_416428 ?auto_416437 ) ) ( not ( = ?auto_416428 ?auto_416438 ) ) ( not ( = ?auto_416428 ?auto_416439 ) ) ( not ( = ?auto_416428 ?auto_416440 ) ) ( not ( = ?auto_416429 ?auto_416430 ) ) ( not ( = ?auto_416429 ?auto_416431 ) ) ( not ( = ?auto_416429 ?auto_416432 ) ) ( not ( = ?auto_416429 ?auto_416433 ) ) ( not ( = ?auto_416429 ?auto_416434 ) ) ( not ( = ?auto_416429 ?auto_416435 ) ) ( not ( = ?auto_416429 ?auto_416436 ) ) ( not ( = ?auto_416429 ?auto_416437 ) ) ( not ( = ?auto_416429 ?auto_416438 ) ) ( not ( = ?auto_416429 ?auto_416439 ) ) ( not ( = ?auto_416429 ?auto_416440 ) ) ( not ( = ?auto_416430 ?auto_416431 ) ) ( not ( = ?auto_416430 ?auto_416432 ) ) ( not ( = ?auto_416430 ?auto_416433 ) ) ( not ( = ?auto_416430 ?auto_416434 ) ) ( not ( = ?auto_416430 ?auto_416435 ) ) ( not ( = ?auto_416430 ?auto_416436 ) ) ( not ( = ?auto_416430 ?auto_416437 ) ) ( not ( = ?auto_416430 ?auto_416438 ) ) ( not ( = ?auto_416430 ?auto_416439 ) ) ( not ( = ?auto_416430 ?auto_416440 ) ) ( not ( = ?auto_416431 ?auto_416432 ) ) ( not ( = ?auto_416431 ?auto_416433 ) ) ( not ( = ?auto_416431 ?auto_416434 ) ) ( not ( = ?auto_416431 ?auto_416435 ) ) ( not ( = ?auto_416431 ?auto_416436 ) ) ( not ( = ?auto_416431 ?auto_416437 ) ) ( not ( = ?auto_416431 ?auto_416438 ) ) ( not ( = ?auto_416431 ?auto_416439 ) ) ( not ( = ?auto_416431 ?auto_416440 ) ) ( not ( = ?auto_416432 ?auto_416433 ) ) ( not ( = ?auto_416432 ?auto_416434 ) ) ( not ( = ?auto_416432 ?auto_416435 ) ) ( not ( = ?auto_416432 ?auto_416436 ) ) ( not ( = ?auto_416432 ?auto_416437 ) ) ( not ( = ?auto_416432 ?auto_416438 ) ) ( not ( = ?auto_416432 ?auto_416439 ) ) ( not ( = ?auto_416432 ?auto_416440 ) ) ( not ( = ?auto_416433 ?auto_416434 ) ) ( not ( = ?auto_416433 ?auto_416435 ) ) ( not ( = ?auto_416433 ?auto_416436 ) ) ( not ( = ?auto_416433 ?auto_416437 ) ) ( not ( = ?auto_416433 ?auto_416438 ) ) ( not ( = ?auto_416433 ?auto_416439 ) ) ( not ( = ?auto_416433 ?auto_416440 ) ) ( not ( = ?auto_416434 ?auto_416435 ) ) ( not ( = ?auto_416434 ?auto_416436 ) ) ( not ( = ?auto_416434 ?auto_416437 ) ) ( not ( = ?auto_416434 ?auto_416438 ) ) ( not ( = ?auto_416434 ?auto_416439 ) ) ( not ( = ?auto_416434 ?auto_416440 ) ) ( not ( = ?auto_416435 ?auto_416436 ) ) ( not ( = ?auto_416435 ?auto_416437 ) ) ( not ( = ?auto_416435 ?auto_416438 ) ) ( not ( = ?auto_416435 ?auto_416439 ) ) ( not ( = ?auto_416435 ?auto_416440 ) ) ( not ( = ?auto_416436 ?auto_416437 ) ) ( not ( = ?auto_416436 ?auto_416438 ) ) ( not ( = ?auto_416436 ?auto_416439 ) ) ( not ( = ?auto_416436 ?auto_416440 ) ) ( not ( = ?auto_416437 ?auto_416438 ) ) ( not ( = ?auto_416437 ?auto_416439 ) ) ( not ( = ?auto_416437 ?auto_416440 ) ) ( not ( = ?auto_416438 ?auto_416439 ) ) ( not ( = ?auto_416438 ?auto_416440 ) ) ( not ( = ?auto_416439 ?auto_416440 ) ) ( ON ?auto_416438 ?auto_416439 ) ( ON ?auto_416437 ?auto_416438 ) ( CLEAR ?auto_416435 ) ( ON ?auto_416436 ?auto_416437 ) ( CLEAR ?auto_416436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_416426 ?auto_416427 ?auto_416428 ?auto_416429 ?auto_416430 ?auto_416431 ?auto_416432 ?auto_416433 ?auto_416434 ?auto_416435 ?auto_416436 )
      ( MAKE-14PILE ?auto_416426 ?auto_416427 ?auto_416428 ?auto_416429 ?auto_416430 ?auto_416431 ?auto_416432 ?auto_416433 ?auto_416434 ?auto_416435 ?auto_416436 ?auto_416437 ?auto_416438 ?auto_416439 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416455 - BLOCK
      ?auto_416456 - BLOCK
      ?auto_416457 - BLOCK
      ?auto_416458 - BLOCK
      ?auto_416459 - BLOCK
      ?auto_416460 - BLOCK
      ?auto_416461 - BLOCK
      ?auto_416462 - BLOCK
      ?auto_416463 - BLOCK
      ?auto_416464 - BLOCK
      ?auto_416465 - BLOCK
      ?auto_416466 - BLOCK
      ?auto_416467 - BLOCK
      ?auto_416468 - BLOCK
    )
    :vars
    (
      ?auto_416469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416468 ?auto_416469 ) ( ON-TABLE ?auto_416455 ) ( ON ?auto_416456 ?auto_416455 ) ( ON ?auto_416457 ?auto_416456 ) ( ON ?auto_416458 ?auto_416457 ) ( ON ?auto_416459 ?auto_416458 ) ( ON ?auto_416460 ?auto_416459 ) ( ON ?auto_416461 ?auto_416460 ) ( ON ?auto_416462 ?auto_416461 ) ( ON ?auto_416463 ?auto_416462 ) ( ON ?auto_416464 ?auto_416463 ) ( not ( = ?auto_416455 ?auto_416456 ) ) ( not ( = ?auto_416455 ?auto_416457 ) ) ( not ( = ?auto_416455 ?auto_416458 ) ) ( not ( = ?auto_416455 ?auto_416459 ) ) ( not ( = ?auto_416455 ?auto_416460 ) ) ( not ( = ?auto_416455 ?auto_416461 ) ) ( not ( = ?auto_416455 ?auto_416462 ) ) ( not ( = ?auto_416455 ?auto_416463 ) ) ( not ( = ?auto_416455 ?auto_416464 ) ) ( not ( = ?auto_416455 ?auto_416465 ) ) ( not ( = ?auto_416455 ?auto_416466 ) ) ( not ( = ?auto_416455 ?auto_416467 ) ) ( not ( = ?auto_416455 ?auto_416468 ) ) ( not ( = ?auto_416455 ?auto_416469 ) ) ( not ( = ?auto_416456 ?auto_416457 ) ) ( not ( = ?auto_416456 ?auto_416458 ) ) ( not ( = ?auto_416456 ?auto_416459 ) ) ( not ( = ?auto_416456 ?auto_416460 ) ) ( not ( = ?auto_416456 ?auto_416461 ) ) ( not ( = ?auto_416456 ?auto_416462 ) ) ( not ( = ?auto_416456 ?auto_416463 ) ) ( not ( = ?auto_416456 ?auto_416464 ) ) ( not ( = ?auto_416456 ?auto_416465 ) ) ( not ( = ?auto_416456 ?auto_416466 ) ) ( not ( = ?auto_416456 ?auto_416467 ) ) ( not ( = ?auto_416456 ?auto_416468 ) ) ( not ( = ?auto_416456 ?auto_416469 ) ) ( not ( = ?auto_416457 ?auto_416458 ) ) ( not ( = ?auto_416457 ?auto_416459 ) ) ( not ( = ?auto_416457 ?auto_416460 ) ) ( not ( = ?auto_416457 ?auto_416461 ) ) ( not ( = ?auto_416457 ?auto_416462 ) ) ( not ( = ?auto_416457 ?auto_416463 ) ) ( not ( = ?auto_416457 ?auto_416464 ) ) ( not ( = ?auto_416457 ?auto_416465 ) ) ( not ( = ?auto_416457 ?auto_416466 ) ) ( not ( = ?auto_416457 ?auto_416467 ) ) ( not ( = ?auto_416457 ?auto_416468 ) ) ( not ( = ?auto_416457 ?auto_416469 ) ) ( not ( = ?auto_416458 ?auto_416459 ) ) ( not ( = ?auto_416458 ?auto_416460 ) ) ( not ( = ?auto_416458 ?auto_416461 ) ) ( not ( = ?auto_416458 ?auto_416462 ) ) ( not ( = ?auto_416458 ?auto_416463 ) ) ( not ( = ?auto_416458 ?auto_416464 ) ) ( not ( = ?auto_416458 ?auto_416465 ) ) ( not ( = ?auto_416458 ?auto_416466 ) ) ( not ( = ?auto_416458 ?auto_416467 ) ) ( not ( = ?auto_416458 ?auto_416468 ) ) ( not ( = ?auto_416458 ?auto_416469 ) ) ( not ( = ?auto_416459 ?auto_416460 ) ) ( not ( = ?auto_416459 ?auto_416461 ) ) ( not ( = ?auto_416459 ?auto_416462 ) ) ( not ( = ?auto_416459 ?auto_416463 ) ) ( not ( = ?auto_416459 ?auto_416464 ) ) ( not ( = ?auto_416459 ?auto_416465 ) ) ( not ( = ?auto_416459 ?auto_416466 ) ) ( not ( = ?auto_416459 ?auto_416467 ) ) ( not ( = ?auto_416459 ?auto_416468 ) ) ( not ( = ?auto_416459 ?auto_416469 ) ) ( not ( = ?auto_416460 ?auto_416461 ) ) ( not ( = ?auto_416460 ?auto_416462 ) ) ( not ( = ?auto_416460 ?auto_416463 ) ) ( not ( = ?auto_416460 ?auto_416464 ) ) ( not ( = ?auto_416460 ?auto_416465 ) ) ( not ( = ?auto_416460 ?auto_416466 ) ) ( not ( = ?auto_416460 ?auto_416467 ) ) ( not ( = ?auto_416460 ?auto_416468 ) ) ( not ( = ?auto_416460 ?auto_416469 ) ) ( not ( = ?auto_416461 ?auto_416462 ) ) ( not ( = ?auto_416461 ?auto_416463 ) ) ( not ( = ?auto_416461 ?auto_416464 ) ) ( not ( = ?auto_416461 ?auto_416465 ) ) ( not ( = ?auto_416461 ?auto_416466 ) ) ( not ( = ?auto_416461 ?auto_416467 ) ) ( not ( = ?auto_416461 ?auto_416468 ) ) ( not ( = ?auto_416461 ?auto_416469 ) ) ( not ( = ?auto_416462 ?auto_416463 ) ) ( not ( = ?auto_416462 ?auto_416464 ) ) ( not ( = ?auto_416462 ?auto_416465 ) ) ( not ( = ?auto_416462 ?auto_416466 ) ) ( not ( = ?auto_416462 ?auto_416467 ) ) ( not ( = ?auto_416462 ?auto_416468 ) ) ( not ( = ?auto_416462 ?auto_416469 ) ) ( not ( = ?auto_416463 ?auto_416464 ) ) ( not ( = ?auto_416463 ?auto_416465 ) ) ( not ( = ?auto_416463 ?auto_416466 ) ) ( not ( = ?auto_416463 ?auto_416467 ) ) ( not ( = ?auto_416463 ?auto_416468 ) ) ( not ( = ?auto_416463 ?auto_416469 ) ) ( not ( = ?auto_416464 ?auto_416465 ) ) ( not ( = ?auto_416464 ?auto_416466 ) ) ( not ( = ?auto_416464 ?auto_416467 ) ) ( not ( = ?auto_416464 ?auto_416468 ) ) ( not ( = ?auto_416464 ?auto_416469 ) ) ( not ( = ?auto_416465 ?auto_416466 ) ) ( not ( = ?auto_416465 ?auto_416467 ) ) ( not ( = ?auto_416465 ?auto_416468 ) ) ( not ( = ?auto_416465 ?auto_416469 ) ) ( not ( = ?auto_416466 ?auto_416467 ) ) ( not ( = ?auto_416466 ?auto_416468 ) ) ( not ( = ?auto_416466 ?auto_416469 ) ) ( not ( = ?auto_416467 ?auto_416468 ) ) ( not ( = ?auto_416467 ?auto_416469 ) ) ( not ( = ?auto_416468 ?auto_416469 ) ) ( ON ?auto_416467 ?auto_416468 ) ( ON ?auto_416466 ?auto_416467 ) ( CLEAR ?auto_416464 ) ( ON ?auto_416465 ?auto_416466 ) ( CLEAR ?auto_416465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_416455 ?auto_416456 ?auto_416457 ?auto_416458 ?auto_416459 ?auto_416460 ?auto_416461 ?auto_416462 ?auto_416463 ?auto_416464 ?auto_416465 )
      ( MAKE-14PILE ?auto_416455 ?auto_416456 ?auto_416457 ?auto_416458 ?auto_416459 ?auto_416460 ?auto_416461 ?auto_416462 ?auto_416463 ?auto_416464 ?auto_416465 ?auto_416466 ?auto_416467 ?auto_416468 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416484 - BLOCK
      ?auto_416485 - BLOCK
      ?auto_416486 - BLOCK
      ?auto_416487 - BLOCK
      ?auto_416488 - BLOCK
      ?auto_416489 - BLOCK
      ?auto_416490 - BLOCK
      ?auto_416491 - BLOCK
      ?auto_416492 - BLOCK
      ?auto_416493 - BLOCK
      ?auto_416494 - BLOCK
      ?auto_416495 - BLOCK
      ?auto_416496 - BLOCK
      ?auto_416497 - BLOCK
    )
    :vars
    (
      ?auto_416498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416497 ?auto_416498 ) ( ON-TABLE ?auto_416484 ) ( ON ?auto_416485 ?auto_416484 ) ( ON ?auto_416486 ?auto_416485 ) ( ON ?auto_416487 ?auto_416486 ) ( ON ?auto_416488 ?auto_416487 ) ( ON ?auto_416489 ?auto_416488 ) ( ON ?auto_416490 ?auto_416489 ) ( ON ?auto_416491 ?auto_416490 ) ( ON ?auto_416492 ?auto_416491 ) ( not ( = ?auto_416484 ?auto_416485 ) ) ( not ( = ?auto_416484 ?auto_416486 ) ) ( not ( = ?auto_416484 ?auto_416487 ) ) ( not ( = ?auto_416484 ?auto_416488 ) ) ( not ( = ?auto_416484 ?auto_416489 ) ) ( not ( = ?auto_416484 ?auto_416490 ) ) ( not ( = ?auto_416484 ?auto_416491 ) ) ( not ( = ?auto_416484 ?auto_416492 ) ) ( not ( = ?auto_416484 ?auto_416493 ) ) ( not ( = ?auto_416484 ?auto_416494 ) ) ( not ( = ?auto_416484 ?auto_416495 ) ) ( not ( = ?auto_416484 ?auto_416496 ) ) ( not ( = ?auto_416484 ?auto_416497 ) ) ( not ( = ?auto_416484 ?auto_416498 ) ) ( not ( = ?auto_416485 ?auto_416486 ) ) ( not ( = ?auto_416485 ?auto_416487 ) ) ( not ( = ?auto_416485 ?auto_416488 ) ) ( not ( = ?auto_416485 ?auto_416489 ) ) ( not ( = ?auto_416485 ?auto_416490 ) ) ( not ( = ?auto_416485 ?auto_416491 ) ) ( not ( = ?auto_416485 ?auto_416492 ) ) ( not ( = ?auto_416485 ?auto_416493 ) ) ( not ( = ?auto_416485 ?auto_416494 ) ) ( not ( = ?auto_416485 ?auto_416495 ) ) ( not ( = ?auto_416485 ?auto_416496 ) ) ( not ( = ?auto_416485 ?auto_416497 ) ) ( not ( = ?auto_416485 ?auto_416498 ) ) ( not ( = ?auto_416486 ?auto_416487 ) ) ( not ( = ?auto_416486 ?auto_416488 ) ) ( not ( = ?auto_416486 ?auto_416489 ) ) ( not ( = ?auto_416486 ?auto_416490 ) ) ( not ( = ?auto_416486 ?auto_416491 ) ) ( not ( = ?auto_416486 ?auto_416492 ) ) ( not ( = ?auto_416486 ?auto_416493 ) ) ( not ( = ?auto_416486 ?auto_416494 ) ) ( not ( = ?auto_416486 ?auto_416495 ) ) ( not ( = ?auto_416486 ?auto_416496 ) ) ( not ( = ?auto_416486 ?auto_416497 ) ) ( not ( = ?auto_416486 ?auto_416498 ) ) ( not ( = ?auto_416487 ?auto_416488 ) ) ( not ( = ?auto_416487 ?auto_416489 ) ) ( not ( = ?auto_416487 ?auto_416490 ) ) ( not ( = ?auto_416487 ?auto_416491 ) ) ( not ( = ?auto_416487 ?auto_416492 ) ) ( not ( = ?auto_416487 ?auto_416493 ) ) ( not ( = ?auto_416487 ?auto_416494 ) ) ( not ( = ?auto_416487 ?auto_416495 ) ) ( not ( = ?auto_416487 ?auto_416496 ) ) ( not ( = ?auto_416487 ?auto_416497 ) ) ( not ( = ?auto_416487 ?auto_416498 ) ) ( not ( = ?auto_416488 ?auto_416489 ) ) ( not ( = ?auto_416488 ?auto_416490 ) ) ( not ( = ?auto_416488 ?auto_416491 ) ) ( not ( = ?auto_416488 ?auto_416492 ) ) ( not ( = ?auto_416488 ?auto_416493 ) ) ( not ( = ?auto_416488 ?auto_416494 ) ) ( not ( = ?auto_416488 ?auto_416495 ) ) ( not ( = ?auto_416488 ?auto_416496 ) ) ( not ( = ?auto_416488 ?auto_416497 ) ) ( not ( = ?auto_416488 ?auto_416498 ) ) ( not ( = ?auto_416489 ?auto_416490 ) ) ( not ( = ?auto_416489 ?auto_416491 ) ) ( not ( = ?auto_416489 ?auto_416492 ) ) ( not ( = ?auto_416489 ?auto_416493 ) ) ( not ( = ?auto_416489 ?auto_416494 ) ) ( not ( = ?auto_416489 ?auto_416495 ) ) ( not ( = ?auto_416489 ?auto_416496 ) ) ( not ( = ?auto_416489 ?auto_416497 ) ) ( not ( = ?auto_416489 ?auto_416498 ) ) ( not ( = ?auto_416490 ?auto_416491 ) ) ( not ( = ?auto_416490 ?auto_416492 ) ) ( not ( = ?auto_416490 ?auto_416493 ) ) ( not ( = ?auto_416490 ?auto_416494 ) ) ( not ( = ?auto_416490 ?auto_416495 ) ) ( not ( = ?auto_416490 ?auto_416496 ) ) ( not ( = ?auto_416490 ?auto_416497 ) ) ( not ( = ?auto_416490 ?auto_416498 ) ) ( not ( = ?auto_416491 ?auto_416492 ) ) ( not ( = ?auto_416491 ?auto_416493 ) ) ( not ( = ?auto_416491 ?auto_416494 ) ) ( not ( = ?auto_416491 ?auto_416495 ) ) ( not ( = ?auto_416491 ?auto_416496 ) ) ( not ( = ?auto_416491 ?auto_416497 ) ) ( not ( = ?auto_416491 ?auto_416498 ) ) ( not ( = ?auto_416492 ?auto_416493 ) ) ( not ( = ?auto_416492 ?auto_416494 ) ) ( not ( = ?auto_416492 ?auto_416495 ) ) ( not ( = ?auto_416492 ?auto_416496 ) ) ( not ( = ?auto_416492 ?auto_416497 ) ) ( not ( = ?auto_416492 ?auto_416498 ) ) ( not ( = ?auto_416493 ?auto_416494 ) ) ( not ( = ?auto_416493 ?auto_416495 ) ) ( not ( = ?auto_416493 ?auto_416496 ) ) ( not ( = ?auto_416493 ?auto_416497 ) ) ( not ( = ?auto_416493 ?auto_416498 ) ) ( not ( = ?auto_416494 ?auto_416495 ) ) ( not ( = ?auto_416494 ?auto_416496 ) ) ( not ( = ?auto_416494 ?auto_416497 ) ) ( not ( = ?auto_416494 ?auto_416498 ) ) ( not ( = ?auto_416495 ?auto_416496 ) ) ( not ( = ?auto_416495 ?auto_416497 ) ) ( not ( = ?auto_416495 ?auto_416498 ) ) ( not ( = ?auto_416496 ?auto_416497 ) ) ( not ( = ?auto_416496 ?auto_416498 ) ) ( not ( = ?auto_416497 ?auto_416498 ) ) ( ON ?auto_416496 ?auto_416497 ) ( ON ?auto_416495 ?auto_416496 ) ( ON ?auto_416494 ?auto_416495 ) ( CLEAR ?auto_416492 ) ( ON ?auto_416493 ?auto_416494 ) ( CLEAR ?auto_416493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_416484 ?auto_416485 ?auto_416486 ?auto_416487 ?auto_416488 ?auto_416489 ?auto_416490 ?auto_416491 ?auto_416492 ?auto_416493 )
      ( MAKE-14PILE ?auto_416484 ?auto_416485 ?auto_416486 ?auto_416487 ?auto_416488 ?auto_416489 ?auto_416490 ?auto_416491 ?auto_416492 ?auto_416493 ?auto_416494 ?auto_416495 ?auto_416496 ?auto_416497 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416513 - BLOCK
      ?auto_416514 - BLOCK
      ?auto_416515 - BLOCK
      ?auto_416516 - BLOCK
      ?auto_416517 - BLOCK
      ?auto_416518 - BLOCK
      ?auto_416519 - BLOCK
      ?auto_416520 - BLOCK
      ?auto_416521 - BLOCK
      ?auto_416522 - BLOCK
      ?auto_416523 - BLOCK
      ?auto_416524 - BLOCK
      ?auto_416525 - BLOCK
      ?auto_416526 - BLOCK
    )
    :vars
    (
      ?auto_416527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416526 ?auto_416527 ) ( ON-TABLE ?auto_416513 ) ( ON ?auto_416514 ?auto_416513 ) ( ON ?auto_416515 ?auto_416514 ) ( ON ?auto_416516 ?auto_416515 ) ( ON ?auto_416517 ?auto_416516 ) ( ON ?auto_416518 ?auto_416517 ) ( ON ?auto_416519 ?auto_416518 ) ( ON ?auto_416520 ?auto_416519 ) ( ON ?auto_416521 ?auto_416520 ) ( not ( = ?auto_416513 ?auto_416514 ) ) ( not ( = ?auto_416513 ?auto_416515 ) ) ( not ( = ?auto_416513 ?auto_416516 ) ) ( not ( = ?auto_416513 ?auto_416517 ) ) ( not ( = ?auto_416513 ?auto_416518 ) ) ( not ( = ?auto_416513 ?auto_416519 ) ) ( not ( = ?auto_416513 ?auto_416520 ) ) ( not ( = ?auto_416513 ?auto_416521 ) ) ( not ( = ?auto_416513 ?auto_416522 ) ) ( not ( = ?auto_416513 ?auto_416523 ) ) ( not ( = ?auto_416513 ?auto_416524 ) ) ( not ( = ?auto_416513 ?auto_416525 ) ) ( not ( = ?auto_416513 ?auto_416526 ) ) ( not ( = ?auto_416513 ?auto_416527 ) ) ( not ( = ?auto_416514 ?auto_416515 ) ) ( not ( = ?auto_416514 ?auto_416516 ) ) ( not ( = ?auto_416514 ?auto_416517 ) ) ( not ( = ?auto_416514 ?auto_416518 ) ) ( not ( = ?auto_416514 ?auto_416519 ) ) ( not ( = ?auto_416514 ?auto_416520 ) ) ( not ( = ?auto_416514 ?auto_416521 ) ) ( not ( = ?auto_416514 ?auto_416522 ) ) ( not ( = ?auto_416514 ?auto_416523 ) ) ( not ( = ?auto_416514 ?auto_416524 ) ) ( not ( = ?auto_416514 ?auto_416525 ) ) ( not ( = ?auto_416514 ?auto_416526 ) ) ( not ( = ?auto_416514 ?auto_416527 ) ) ( not ( = ?auto_416515 ?auto_416516 ) ) ( not ( = ?auto_416515 ?auto_416517 ) ) ( not ( = ?auto_416515 ?auto_416518 ) ) ( not ( = ?auto_416515 ?auto_416519 ) ) ( not ( = ?auto_416515 ?auto_416520 ) ) ( not ( = ?auto_416515 ?auto_416521 ) ) ( not ( = ?auto_416515 ?auto_416522 ) ) ( not ( = ?auto_416515 ?auto_416523 ) ) ( not ( = ?auto_416515 ?auto_416524 ) ) ( not ( = ?auto_416515 ?auto_416525 ) ) ( not ( = ?auto_416515 ?auto_416526 ) ) ( not ( = ?auto_416515 ?auto_416527 ) ) ( not ( = ?auto_416516 ?auto_416517 ) ) ( not ( = ?auto_416516 ?auto_416518 ) ) ( not ( = ?auto_416516 ?auto_416519 ) ) ( not ( = ?auto_416516 ?auto_416520 ) ) ( not ( = ?auto_416516 ?auto_416521 ) ) ( not ( = ?auto_416516 ?auto_416522 ) ) ( not ( = ?auto_416516 ?auto_416523 ) ) ( not ( = ?auto_416516 ?auto_416524 ) ) ( not ( = ?auto_416516 ?auto_416525 ) ) ( not ( = ?auto_416516 ?auto_416526 ) ) ( not ( = ?auto_416516 ?auto_416527 ) ) ( not ( = ?auto_416517 ?auto_416518 ) ) ( not ( = ?auto_416517 ?auto_416519 ) ) ( not ( = ?auto_416517 ?auto_416520 ) ) ( not ( = ?auto_416517 ?auto_416521 ) ) ( not ( = ?auto_416517 ?auto_416522 ) ) ( not ( = ?auto_416517 ?auto_416523 ) ) ( not ( = ?auto_416517 ?auto_416524 ) ) ( not ( = ?auto_416517 ?auto_416525 ) ) ( not ( = ?auto_416517 ?auto_416526 ) ) ( not ( = ?auto_416517 ?auto_416527 ) ) ( not ( = ?auto_416518 ?auto_416519 ) ) ( not ( = ?auto_416518 ?auto_416520 ) ) ( not ( = ?auto_416518 ?auto_416521 ) ) ( not ( = ?auto_416518 ?auto_416522 ) ) ( not ( = ?auto_416518 ?auto_416523 ) ) ( not ( = ?auto_416518 ?auto_416524 ) ) ( not ( = ?auto_416518 ?auto_416525 ) ) ( not ( = ?auto_416518 ?auto_416526 ) ) ( not ( = ?auto_416518 ?auto_416527 ) ) ( not ( = ?auto_416519 ?auto_416520 ) ) ( not ( = ?auto_416519 ?auto_416521 ) ) ( not ( = ?auto_416519 ?auto_416522 ) ) ( not ( = ?auto_416519 ?auto_416523 ) ) ( not ( = ?auto_416519 ?auto_416524 ) ) ( not ( = ?auto_416519 ?auto_416525 ) ) ( not ( = ?auto_416519 ?auto_416526 ) ) ( not ( = ?auto_416519 ?auto_416527 ) ) ( not ( = ?auto_416520 ?auto_416521 ) ) ( not ( = ?auto_416520 ?auto_416522 ) ) ( not ( = ?auto_416520 ?auto_416523 ) ) ( not ( = ?auto_416520 ?auto_416524 ) ) ( not ( = ?auto_416520 ?auto_416525 ) ) ( not ( = ?auto_416520 ?auto_416526 ) ) ( not ( = ?auto_416520 ?auto_416527 ) ) ( not ( = ?auto_416521 ?auto_416522 ) ) ( not ( = ?auto_416521 ?auto_416523 ) ) ( not ( = ?auto_416521 ?auto_416524 ) ) ( not ( = ?auto_416521 ?auto_416525 ) ) ( not ( = ?auto_416521 ?auto_416526 ) ) ( not ( = ?auto_416521 ?auto_416527 ) ) ( not ( = ?auto_416522 ?auto_416523 ) ) ( not ( = ?auto_416522 ?auto_416524 ) ) ( not ( = ?auto_416522 ?auto_416525 ) ) ( not ( = ?auto_416522 ?auto_416526 ) ) ( not ( = ?auto_416522 ?auto_416527 ) ) ( not ( = ?auto_416523 ?auto_416524 ) ) ( not ( = ?auto_416523 ?auto_416525 ) ) ( not ( = ?auto_416523 ?auto_416526 ) ) ( not ( = ?auto_416523 ?auto_416527 ) ) ( not ( = ?auto_416524 ?auto_416525 ) ) ( not ( = ?auto_416524 ?auto_416526 ) ) ( not ( = ?auto_416524 ?auto_416527 ) ) ( not ( = ?auto_416525 ?auto_416526 ) ) ( not ( = ?auto_416525 ?auto_416527 ) ) ( not ( = ?auto_416526 ?auto_416527 ) ) ( ON ?auto_416525 ?auto_416526 ) ( ON ?auto_416524 ?auto_416525 ) ( ON ?auto_416523 ?auto_416524 ) ( CLEAR ?auto_416521 ) ( ON ?auto_416522 ?auto_416523 ) ( CLEAR ?auto_416522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_416513 ?auto_416514 ?auto_416515 ?auto_416516 ?auto_416517 ?auto_416518 ?auto_416519 ?auto_416520 ?auto_416521 ?auto_416522 )
      ( MAKE-14PILE ?auto_416513 ?auto_416514 ?auto_416515 ?auto_416516 ?auto_416517 ?auto_416518 ?auto_416519 ?auto_416520 ?auto_416521 ?auto_416522 ?auto_416523 ?auto_416524 ?auto_416525 ?auto_416526 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416542 - BLOCK
      ?auto_416543 - BLOCK
      ?auto_416544 - BLOCK
      ?auto_416545 - BLOCK
      ?auto_416546 - BLOCK
      ?auto_416547 - BLOCK
      ?auto_416548 - BLOCK
      ?auto_416549 - BLOCK
      ?auto_416550 - BLOCK
      ?auto_416551 - BLOCK
      ?auto_416552 - BLOCK
      ?auto_416553 - BLOCK
      ?auto_416554 - BLOCK
      ?auto_416555 - BLOCK
    )
    :vars
    (
      ?auto_416556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416555 ?auto_416556 ) ( ON-TABLE ?auto_416542 ) ( ON ?auto_416543 ?auto_416542 ) ( ON ?auto_416544 ?auto_416543 ) ( ON ?auto_416545 ?auto_416544 ) ( ON ?auto_416546 ?auto_416545 ) ( ON ?auto_416547 ?auto_416546 ) ( ON ?auto_416548 ?auto_416547 ) ( ON ?auto_416549 ?auto_416548 ) ( not ( = ?auto_416542 ?auto_416543 ) ) ( not ( = ?auto_416542 ?auto_416544 ) ) ( not ( = ?auto_416542 ?auto_416545 ) ) ( not ( = ?auto_416542 ?auto_416546 ) ) ( not ( = ?auto_416542 ?auto_416547 ) ) ( not ( = ?auto_416542 ?auto_416548 ) ) ( not ( = ?auto_416542 ?auto_416549 ) ) ( not ( = ?auto_416542 ?auto_416550 ) ) ( not ( = ?auto_416542 ?auto_416551 ) ) ( not ( = ?auto_416542 ?auto_416552 ) ) ( not ( = ?auto_416542 ?auto_416553 ) ) ( not ( = ?auto_416542 ?auto_416554 ) ) ( not ( = ?auto_416542 ?auto_416555 ) ) ( not ( = ?auto_416542 ?auto_416556 ) ) ( not ( = ?auto_416543 ?auto_416544 ) ) ( not ( = ?auto_416543 ?auto_416545 ) ) ( not ( = ?auto_416543 ?auto_416546 ) ) ( not ( = ?auto_416543 ?auto_416547 ) ) ( not ( = ?auto_416543 ?auto_416548 ) ) ( not ( = ?auto_416543 ?auto_416549 ) ) ( not ( = ?auto_416543 ?auto_416550 ) ) ( not ( = ?auto_416543 ?auto_416551 ) ) ( not ( = ?auto_416543 ?auto_416552 ) ) ( not ( = ?auto_416543 ?auto_416553 ) ) ( not ( = ?auto_416543 ?auto_416554 ) ) ( not ( = ?auto_416543 ?auto_416555 ) ) ( not ( = ?auto_416543 ?auto_416556 ) ) ( not ( = ?auto_416544 ?auto_416545 ) ) ( not ( = ?auto_416544 ?auto_416546 ) ) ( not ( = ?auto_416544 ?auto_416547 ) ) ( not ( = ?auto_416544 ?auto_416548 ) ) ( not ( = ?auto_416544 ?auto_416549 ) ) ( not ( = ?auto_416544 ?auto_416550 ) ) ( not ( = ?auto_416544 ?auto_416551 ) ) ( not ( = ?auto_416544 ?auto_416552 ) ) ( not ( = ?auto_416544 ?auto_416553 ) ) ( not ( = ?auto_416544 ?auto_416554 ) ) ( not ( = ?auto_416544 ?auto_416555 ) ) ( not ( = ?auto_416544 ?auto_416556 ) ) ( not ( = ?auto_416545 ?auto_416546 ) ) ( not ( = ?auto_416545 ?auto_416547 ) ) ( not ( = ?auto_416545 ?auto_416548 ) ) ( not ( = ?auto_416545 ?auto_416549 ) ) ( not ( = ?auto_416545 ?auto_416550 ) ) ( not ( = ?auto_416545 ?auto_416551 ) ) ( not ( = ?auto_416545 ?auto_416552 ) ) ( not ( = ?auto_416545 ?auto_416553 ) ) ( not ( = ?auto_416545 ?auto_416554 ) ) ( not ( = ?auto_416545 ?auto_416555 ) ) ( not ( = ?auto_416545 ?auto_416556 ) ) ( not ( = ?auto_416546 ?auto_416547 ) ) ( not ( = ?auto_416546 ?auto_416548 ) ) ( not ( = ?auto_416546 ?auto_416549 ) ) ( not ( = ?auto_416546 ?auto_416550 ) ) ( not ( = ?auto_416546 ?auto_416551 ) ) ( not ( = ?auto_416546 ?auto_416552 ) ) ( not ( = ?auto_416546 ?auto_416553 ) ) ( not ( = ?auto_416546 ?auto_416554 ) ) ( not ( = ?auto_416546 ?auto_416555 ) ) ( not ( = ?auto_416546 ?auto_416556 ) ) ( not ( = ?auto_416547 ?auto_416548 ) ) ( not ( = ?auto_416547 ?auto_416549 ) ) ( not ( = ?auto_416547 ?auto_416550 ) ) ( not ( = ?auto_416547 ?auto_416551 ) ) ( not ( = ?auto_416547 ?auto_416552 ) ) ( not ( = ?auto_416547 ?auto_416553 ) ) ( not ( = ?auto_416547 ?auto_416554 ) ) ( not ( = ?auto_416547 ?auto_416555 ) ) ( not ( = ?auto_416547 ?auto_416556 ) ) ( not ( = ?auto_416548 ?auto_416549 ) ) ( not ( = ?auto_416548 ?auto_416550 ) ) ( not ( = ?auto_416548 ?auto_416551 ) ) ( not ( = ?auto_416548 ?auto_416552 ) ) ( not ( = ?auto_416548 ?auto_416553 ) ) ( not ( = ?auto_416548 ?auto_416554 ) ) ( not ( = ?auto_416548 ?auto_416555 ) ) ( not ( = ?auto_416548 ?auto_416556 ) ) ( not ( = ?auto_416549 ?auto_416550 ) ) ( not ( = ?auto_416549 ?auto_416551 ) ) ( not ( = ?auto_416549 ?auto_416552 ) ) ( not ( = ?auto_416549 ?auto_416553 ) ) ( not ( = ?auto_416549 ?auto_416554 ) ) ( not ( = ?auto_416549 ?auto_416555 ) ) ( not ( = ?auto_416549 ?auto_416556 ) ) ( not ( = ?auto_416550 ?auto_416551 ) ) ( not ( = ?auto_416550 ?auto_416552 ) ) ( not ( = ?auto_416550 ?auto_416553 ) ) ( not ( = ?auto_416550 ?auto_416554 ) ) ( not ( = ?auto_416550 ?auto_416555 ) ) ( not ( = ?auto_416550 ?auto_416556 ) ) ( not ( = ?auto_416551 ?auto_416552 ) ) ( not ( = ?auto_416551 ?auto_416553 ) ) ( not ( = ?auto_416551 ?auto_416554 ) ) ( not ( = ?auto_416551 ?auto_416555 ) ) ( not ( = ?auto_416551 ?auto_416556 ) ) ( not ( = ?auto_416552 ?auto_416553 ) ) ( not ( = ?auto_416552 ?auto_416554 ) ) ( not ( = ?auto_416552 ?auto_416555 ) ) ( not ( = ?auto_416552 ?auto_416556 ) ) ( not ( = ?auto_416553 ?auto_416554 ) ) ( not ( = ?auto_416553 ?auto_416555 ) ) ( not ( = ?auto_416553 ?auto_416556 ) ) ( not ( = ?auto_416554 ?auto_416555 ) ) ( not ( = ?auto_416554 ?auto_416556 ) ) ( not ( = ?auto_416555 ?auto_416556 ) ) ( ON ?auto_416554 ?auto_416555 ) ( ON ?auto_416553 ?auto_416554 ) ( ON ?auto_416552 ?auto_416553 ) ( ON ?auto_416551 ?auto_416552 ) ( CLEAR ?auto_416549 ) ( ON ?auto_416550 ?auto_416551 ) ( CLEAR ?auto_416550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_416542 ?auto_416543 ?auto_416544 ?auto_416545 ?auto_416546 ?auto_416547 ?auto_416548 ?auto_416549 ?auto_416550 )
      ( MAKE-14PILE ?auto_416542 ?auto_416543 ?auto_416544 ?auto_416545 ?auto_416546 ?auto_416547 ?auto_416548 ?auto_416549 ?auto_416550 ?auto_416551 ?auto_416552 ?auto_416553 ?auto_416554 ?auto_416555 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416571 - BLOCK
      ?auto_416572 - BLOCK
      ?auto_416573 - BLOCK
      ?auto_416574 - BLOCK
      ?auto_416575 - BLOCK
      ?auto_416576 - BLOCK
      ?auto_416577 - BLOCK
      ?auto_416578 - BLOCK
      ?auto_416579 - BLOCK
      ?auto_416580 - BLOCK
      ?auto_416581 - BLOCK
      ?auto_416582 - BLOCK
      ?auto_416583 - BLOCK
      ?auto_416584 - BLOCK
    )
    :vars
    (
      ?auto_416585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416584 ?auto_416585 ) ( ON-TABLE ?auto_416571 ) ( ON ?auto_416572 ?auto_416571 ) ( ON ?auto_416573 ?auto_416572 ) ( ON ?auto_416574 ?auto_416573 ) ( ON ?auto_416575 ?auto_416574 ) ( ON ?auto_416576 ?auto_416575 ) ( ON ?auto_416577 ?auto_416576 ) ( ON ?auto_416578 ?auto_416577 ) ( not ( = ?auto_416571 ?auto_416572 ) ) ( not ( = ?auto_416571 ?auto_416573 ) ) ( not ( = ?auto_416571 ?auto_416574 ) ) ( not ( = ?auto_416571 ?auto_416575 ) ) ( not ( = ?auto_416571 ?auto_416576 ) ) ( not ( = ?auto_416571 ?auto_416577 ) ) ( not ( = ?auto_416571 ?auto_416578 ) ) ( not ( = ?auto_416571 ?auto_416579 ) ) ( not ( = ?auto_416571 ?auto_416580 ) ) ( not ( = ?auto_416571 ?auto_416581 ) ) ( not ( = ?auto_416571 ?auto_416582 ) ) ( not ( = ?auto_416571 ?auto_416583 ) ) ( not ( = ?auto_416571 ?auto_416584 ) ) ( not ( = ?auto_416571 ?auto_416585 ) ) ( not ( = ?auto_416572 ?auto_416573 ) ) ( not ( = ?auto_416572 ?auto_416574 ) ) ( not ( = ?auto_416572 ?auto_416575 ) ) ( not ( = ?auto_416572 ?auto_416576 ) ) ( not ( = ?auto_416572 ?auto_416577 ) ) ( not ( = ?auto_416572 ?auto_416578 ) ) ( not ( = ?auto_416572 ?auto_416579 ) ) ( not ( = ?auto_416572 ?auto_416580 ) ) ( not ( = ?auto_416572 ?auto_416581 ) ) ( not ( = ?auto_416572 ?auto_416582 ) ) ( not ( = ?auto_416572 ?auto_416583 ) ) ( not ( = ?auto_416572 ?auto_416584 ) ) ( not ( = ?auto_416572 ?auto_416585 ) ) ( not ( = ?auto_416573 ?auto_416574 ) ) ( not ( = ?auto_416573 ?auto_416575 ) ) ( not ( = ?auto_416573 ?auto_416576 ) ) ( not ( = ?auto_416573 ?auto_416577 ) ) ( not ( = ?auto_416573 ?auto_416578 ) ) ( not ( = ?auto_416573 ?auto_416579 ) ) ( not ( = ?auto_416573 ?auto_416580 ) ) ( not ( = ?auto_416573 ?auto_416581 ) ) ( not ( = ?auto_416573 ?auto_416582 ) ) ( not ( = ?auto_416573 ?auto_416583 ) ) ( not ( = ?auto_416573 ?auto_416584 ) ) ( not ( = ?auto_416573 ?auto_416585 ) ) ( not ( = ?auto_416574 ?auto_416575 ) ) ( not ( = ?auto_416574 ?auto_416576 ) ) ( not ( = ?auto_416574 ?auto_416577 ) ) ( not ( = ?auto_416574 ?auto_416578 ) ) ( not ( = ?auto_416574 ?auto_416579 ) ) ( not ( = ?auto_416574 ?auto_416580 ) ) ( not ( = ?auto_416574 ?auto_416581 ) ) ( not ( = ?auto_416574 ?auto_416582 ) ) ( not ( = ?auto_416574 ?auto_416583 ) ) ( not ( = ?auto_416574 ?auto_416584 ) ) ( not ( = ?auto_416574 ?auto_416585 ) ) ( not ( = ?auto_416575 ?auto_416576 ) ) ( not ( = ?auto_416575 ?auto_416577 ) ) ( not ( = ?auto_416575 ?auto_416578 ) ) ( not ( = ?auto_416575 ?auto_416579 ) ) ( not ( = ?auto_416575 ?auto_416580 ) ) ( not ( = ?auto_416575 ?auto_416581 ) ) ( not ( = ?auto_416575 ?auto_416582 ) ) ( not ( = ?auto_416575 ?auto_416583 ) ) ( not ( = ?auto_416575 ?auto_416584 ) ) ( not ( = ?auto_416575 ?auto_416585 ) ) ( not ( = ?auto_416576 ?auto_416577 ) ) ( not ( = ?auto_416576 ?auto_416578 ) ) ( not ( = ?auto_416576 ?auto_416579 ) ) ( not ( = ?auto_416576 ?auto_416580 ) ) ( not ( = ?auto_416576 ?auto_416581 ) ) ( not ( = ?auto_416576 ?auto_416582 ) ) ( not ( = ?auto_416576 ?auto_416583 ) ) ( not ( = ?auto_416576 ?auto_416584 ) ) ( not ( = ?auto_416576 ?auto_416585 ) ) ( not ( = ?auto_416577 ?auto_416578 ) ) ( not ( = ?auto_416577 ?auto_416579 ) ) ( not ( = ?auto_416577 ?auto_416580 ) ) ( not ( = ?auto_416577 ?auto_416581 ) ) ( not ( = ?auto_416577 ?auto_416582 ) ) ( not ( = ?auto_416577 ?auto_416583 ) ) ( not ( = ?auto_416577 ?auto_416584 ) ) ( not ( = ?auto_416577 ?auto_416585 ) ) ( not ( = ?auto_416578 ?auto_416579 ) ) ( not ( = ?auto_416578 ?auto_416580 ) ) ( not ( = ?auto_416578 ?auto_416581 ) ) ( not ( = ?auto_416578 ?auto_416582 ) ) ( not ( = ?auto_416578 ?auto_416583 ) ) ( not ( = ?auto_416578 ?auto_416584 ) ) ( not ( = ?auto_416578 ?auto_416585 ) ) ( not ( = ?auto_416579 ?auto_416580 ) ) ( not ( = ?auto_416579 ?auto_416581 ) ) ( not ( = ?auto_416579 ?auto_416582 ) ) ( not ( = ?auto_416579 ?auto_416583 ) ) ( not ( = ?auto_416579 ?auto_416584 ) ) ( not ( = ?auto_416579 ?auto_416585 ) ) ( not ( = ?auto_416580 ?auto_416581 ) ) ( not ( = ?auto_416580 ?auto_416582 ) ) ( not ( = ?auto_416580 ?auto_416583 ) ) ( not ( = ?auto_416580 ?auto_416584 ) ) ( not ( = ?auto_416580 ?auto_416585 ) ) ( not ( = ?auto_416581 ?auto_416582 ) ) ( not ( = ?auto_416581 ?auto_416583 ) ) ( not ( = ?auto_416581 ?auto_416584 ) ) ( not ( = ?auto_416581 ?auto_416585 ) ) ( not ( = ?auto_416582 ?auto_416583 ) ) ( not ( = ?auto_416582 ?auto_416584 ) ) ( not ( = ?auto_416582 ?auto_416585 ) ) ( not ( = ?auto_416583 ?auto_416584 ) ) ( not ( = ?auto_416583 ?auto_416585 ) ) ( not ( = ?auto_416584 ?auto_416585 ) ) ( ON ?auto_416583 ?auto_416584 ) ( ON ?auto_416582 ?auto_416583 ) ( ON ?auto_416581 ?auto_416582 ) ( ON ?auto_416580 ?auto_416581 ) ( CLEAR ?auto_416578 ) ( ON ?auto_416579 ?auto_416580 ) ( CLEAR ?auto_416579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_416571 ?auto_416572 ?auto_416573 ?auto_416574 ?auto_416575 ?auto_416576 ?auto_416577 ?auto_416578 ?auto_416579 )
      ( MAKE-14PILE ?auto_416571 ?auto_416572 ?auto_416573 ?auto_416574 ?auto_416575 ?auto_416576 ?auto_416577 ?auto_416578 ?auto_416579 ?auto_416580 ?auto_416581 ?auto_416582 ?auto_416583 ?auto_416584 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416600 - BLOCK
      ?auto_416601 - BLOCK
      ?auto_416602 - BLOCK
      ?auto_416603 - BLOCK
      ?auto_416604 - BLOCK
      ?auto_416605 - BLOCK
      ?auto_416606 - BLOCK
      ?auto_416607 - BLOCK
      ?auto_416608 - BLOCK
      ?auto_416609 - BLOCK
      ?auto_416610 - BLOCK
      ?auto_416611 - BLOCK
      ?auto_416612 - BLOCK
      ?auto_416613 - BLOCK
    )
    :vars
    (
      ?auto_416614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416613 ?auto_416614 ) ( ON-TABLE ?auto_416600 ) ( ON ?auto_416601 ?auto_416600 ) ( ON ?auto_416602 ?auto_416601 ) ( ON ?auto_416603 ?auto_416602 ) ( ON ?auto_416604 ?auto_416603 ) ( ON ?auto_416605 ?auto_416604 ) ( ON ?auto_416606 ?auto_416605 ) ( not ( = ?auto_416600 ?auto_416601 ) ) ( not ( = ?auto_416600 ?auto_416602 ) ) ( not ( = ?auto_416600 ?auto_416603 ) ) ( not ( = ?auto_416600 ?auto_416604 ) ) ( not ( = ?auto_416600 ?auto_416605 ) ) ( not ( = ?auto_416600 ?auto_416606 ) ) ( not ( = ?auto_416600 ?auto_416607 ) ) ( not ( = ?auto_416600 ?auto_416608 ) ) ( not ( = ?auto_416600 ?auto_416609 ) ) ( not ( = ?auto_416600 ?auto_416610 ) ) ( not ( = ?auto_416600 ?auto_416611 ) ) ( not ( = ?auto_416600 ?auto_416612 ) ) ( not ( = ?auto_416600 ?auto_416613 ) ) ( not ( = ?auto_416600 ?auto_416614 ) ) ( not ( = ?auto_416601 ?auto_416602 ) ) ( not ( = ?auto_416601 ?auto_416603 ) ) ( not ( = ?auto_416601 ?auto_416604 ) ) ( not ( = ?auto_416601 ?auto_416605 ) ) ( not ( = ?auto_416601 ?auto_416606 ) ) ( not ( = ?auto_416601 ?auto_416607 ) ) ( not ( = ?auto_416601 ?auto_416608 ) ) ( not ( = ?auto_416601 ?auto_416609 ) ) ( not ( = ?auto_416601 ?auto_416610 ) ) ( not ( = ?auto_416601 ?auto_416611 ) ) ( not ( = ?auto_416601 ?auto_416612 ) ) ( not ( = ?auto_416601 ?auto_416613 ) ) ( not ( = ?auto_416601 ?auto_416614 ) ) ( not ( = ?auto_416602 ?auto_416603 ) ) ( not ( = ?auto_416602 ?auto_416604 ) ) ( not ( = ?auto_416602 ?auto_416605 ) ) ( not ( = ?auto_416602 ?auto_416606 ) ) ( not ( = ?auto_416602 ?auto_416607 ) ) ( not ( = ?auto_416602 ?auto_416608 ) ) ( not ( = ?auto_416602 ?auto_416609 ) ) ( not ( = ?auto_416602 ?auto_416610 ) ) ( not ( = ?auto_416602 ?auto_416611 ) ) ( not ( = ?auto_416602 ?auto_416612 ) ) ( not ( = ?auto_416602 ?auto_416613 ) ) ( not ( = ?auto_416602 ?auto_416614 ) ) ( not ( = ?auto_416603 ?auto_416604 ) ) ( not ( = ?auto_416603 ?auto_416605 ) ) ( not ( = ?auto_416603 ?auto_416606 ) ) ( not ( = ?auto_416603 ?auto_416607 ) ) ( not ( = ?auto_416603 ?auto_416608 ) ) ( not ( = ?auto_416603 ?auto_416609 ) ) ( not ( = ?auto_416603 ?auto_416610 ) ) ( not ( = ?auto_416603 ?auto_416611 ) ) ( not ( = ?auto_416603 ?auto_416612 ) ) ( not ( = ?auto_416603 ?auto_416613 ) ) ( not ( = ?auto_416603 ?auto_416614 ) ) ( not ( = ?auto_416604 ?auto_416605 ) ) ( not ( = ?auto_416604 ?auto_416606 ) ) ( not ( = ?auto_416604 ?auto_416607 ) ) ( not ( = ?auto_416604 ?auto_416608 ) ) ( not ( = ?auto_416604 ?auto_416609 ) ) ( not ( = ?auto_416604 ?auto_416610 ) ) ( not ( = ?auto_416604 ?auto_416611 ) ) ( not ( = ?auto_416604 ?auto_416612 ) ) ( not ( = ?auto_416604 ?auto_416613 ) ) ( not ( = ?auto_416604 ?auto_416614 ) ) ( not ( = ?auto_416605 ?auto_416606 ) ) ( not ( = ?auto_416605 ?auto_416607 ) ) ( not ( = ?auto_416605 ?auto_416608 ) ) ( not ( = ?auto_416605 ?auto_416609 ) ) ( not ( = ?auto_416605 ?auto_416610 ) ) ( not ( = ?auto_416605 ?auto_416611 ) ) ( not ( = ?auto_416605 ?auto_416612 ) ) ( not ( = ?auto_416605 ?auto_416613 ) ) ( not ( = ?auto_416605 ?auto_416614 ) ) ( not ( = ?auto_416606 ?auto_416607 ) ) ( not ( = ?auto_416606 ?auto_416608 ) ) ( not ( = ?auto_416606 ?auto_416609 ) ) ( not ( = ?auto_416606 ?auto_416610 ) ) ( not ( = ?auto_416606 ?auto_416611 ) ) ( not ( = ?auto_416606 ?auto_416612 ) ) ( not ( = ?auto_416606 ?auto_416613 ) ) ( not ( = ?auto_416606 ?auto_416614 ) ) ( not ( = ?auto_416607 ?auto_416608 ) ) ( not ( = ?auto_416607 ?auto_416609 ) ) ( not ( = ?auto_416607 ?auto_416610 ) ) ( not ( = ?auto_416607 ?auto_416611 ) ) ( not ( = ?auto_416607 ?auto_416612 ) ) ( not ( = ?auto_416607 ?auto_416613 ) ) ( not ( = ?auto_416607 ?auto_416614 ) ) ( not ( = ?auto_416608 ?auto_416609 ) ) ( not ( = ?auto_416608 ?auto_416610 ) ) ( not ( = ?auto_416608 ?auto_416611 ) ) ( not ( = ?auto_416608 ?auto_416612 ) ) ( not ( = ?auto_416608 ?auto_416613 ) ) ( not ( = ?auto_416608 ?auto_416614 ) ) ( not ( = ?auto_416609 ?auto_416610 ) ) ( not ( = ?auto_416609 ?auto_416611 ) ) ( not ( = ?auto_416609 ?auto_416612 ) ) ( not ( = ?auto_416609 ?auto_416613 ) ) ( not ( = ?auto_416609 ?auto_416614 ) ) ( not ( = ?auto_416610 ?auto_416611 ) ) ( not ( = ?auto_416610 ?auto_416612 ) ) ( not ( = ?auto_416610 ?auto_416613 ) ) ( not ( = ?auto_416610 ?auto_416614 ) ) ( not ( = ?auto_416611 ?auto_416612 ) ) ( not ( = ?auto_416611 ?auto_416613 ) ) ( not ( = ?auto_416611 ?auto_416614 ) ) ( not ( = ?auto_416612 ?auto_416613 ) ) ( not ( = ?auto_416612 ?auto_416614 ) ) ( not ( = ?auto_416613 ?auto_416614 ) ) ( ON ?auto_416612 ?auto_416613 ) ( ON ?auto_416611 ?auto_416612 ) ( ON ?auto_416610 ?auto_416611 ) ( ON ?auto_416609 ?auto_416610 ) ( ON ?auto_416608 ?auto_416609 ) ( CLEAR ?auto_416606 ) ( ON ?auto_416607 ?auto_416608 ) ( CLEAR ?auto_416607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_416600 ?auto_416601 ?auto_416602 ?auto_416603 ?auto_416604 ?auto_416605 ?auto_416606 ?auto_416607 )
      ( MAKE-14PILE ?auto_416600 ?auto_416601 ?auto_416602 ?auto_416603 ?auto_416604 ?auto_416605 ?auto_416606 ?auto_416607 ?auto_416608 ?auto_416609 ?auto_416610 ?auto_416611 ?auto_416612 ?auto_416613 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416629 - BLOCK
      ?auto_416630 - BLOCK
      ?auto_416631 - BLOCK
      ?auto_416632 - BLOCK
      ?auto_416633 - BLOCK
      ?auto_416634 - BLOCK
      ?auto_416635 - BLOCK
      ?auto_416636 - BLOCK
      ?auto_416637 - BLOCK
      ?auto_416638 - BLOCK
      ?auto_416639 - BLOCK
      ?auto_416640 - BLOCK
      ?auto_416641 - BLOCK
      ?auto_416642 - BLOCK
    )
    :vars
    (
      ?auto_416643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416642 ?auto_416643 ) ( ON-TABLE ?auto_416629 ) ( ON ?auto_416630 ?auto_416629 ) ( ON ?auto_416631 ?auto_416630 ) ( ON ?auto_416632 ?auto_416631 ) ( ON ?auto_416633 ?auto_416632 ) ( ON ?auto_416634 ?auto_416633 ) ( ON ?auto_416635 ?auto_416634 ) ( not ( = ?auto_416629 ?auto_416630 ) ) ( not ( = ?auto_416629 ?auto_416631 ) ) ( not ( = ?auto_416629 ?auto_416632 ) ) ( not ( = ?auto_416629 ?auto_416633 ) ) ( not ( = ?auto_416629 ?auto_416634 ) ) ( not ( = ?auto_416629 ?auto_416635 ) ) ( not ( = ?auto_416629 ?auto_416636 ) ) ( not ( = ?auto_416629 ?auto_416637 ) ) ( not ( = ?auto_416629 ?auto_416638 ) ) ( not ( = ?auto_416629 ?auto_416639 ) ) ( not ( = ?auto_416629 ?auto_416640 ) ) ( not ( = ?auto_416629 ?auto_416641 ) ) ( not ( = ?auto_416629 ?auto_416642 ) ) ( not ( = ?auto_416629 ?auto_416643 ) ) ( not ( = ?auto_416630 ?auto_416631 ) ) ( not ( = ?auto_416630 ?auto_416632 ) ) ( not ( = ?auto_416630 ?auto_416633 ) ) ( not ( = ?auto_416630 ?auto_416634 ) ) ( not ( = ?auto_416630 ?auto_416635 ) ) ( not ( = ?auto_416630 ?auto_416636 ) ) ( not ( = ?auto_416630 ?auto_416637 ) ) ( not ( = ?auto_416630 ?auto_416638 ) ) ( not ( = ?auto_416630 ?auto_416639 ) ) ( not ( = ?auto_416630 ?auto_416640 ) ) ( not ( = ?auto_416630 ?auto_416641 ) ) ( not ( = ?auto_416630 ?auto_416642 ) ) ( not ( = ?auto_416630 ?auto_416643 ) ) ( not ( = ?auto_416631 ?auto_416632 ) ) ( not ( = ?auto_416631 ?auto_416633 ) ) ( not ( = ?auto_416631 ?auto_416634 ) ) ( not ( = ?auto_416631 ?auto_416635 ) ) ( not ( = ?auto_416631 ?auto_416636 ) ) ( not ( = ?auto_416631 ?auto_416637 ) ) ( not ( = ?auto_416631 ?auto_416638 ) ) ( not ( = ?auto_416631 ?auto_416639 ) ) ( not ( = ?auto_416631 ?auto_416640 ) ) ( not ( = ?auto_416631 ?auto_416641 ) ) ( not ( = ?auto_416631 ?auto_416642 ) ) ( not ( = ?auto_416631 ?auto_416643 ) ) ( not ( = ?auto_416632 ?auto_416633 ) ) ( not ( = ?auto_416632 ?auto_416634 ) ) ( not ( = ?auto_416632 ?auto_416635 ) ) ( not ( = ?auto_416632 ?auto_416636 ) ) ( not ( = ?auto_416632 ?auto_416637 ) ) ( not ( = ?auto_416632 ?auto_416638 ) ) ( not ( = ?auto_416632 ?auto_416639 ) ) ( not ( = ?auto_416632 ?auto_416640 ) ) ( not ( = ?auto_416632 ?auto_416641 ) ) ( not ( = ?auto_416632 ?auto_416642 ) ) ( not ( = ?auto_416632 ?auto_416643 ) ) ( not ( = ?auto_416633 ?auto_416634 ) ) ( not ( = ?auto_416633 ?auto_416635 ) ) ( not ( = ?auto_416633 ?auto_416636 ) ) ( not ( = ?auto_416633 ?auto_416637 ) ) ( not ( = ?auto_416633 ?auto_416638 ) ) ( not ( = ?auto_416633 ?auto_416639 ) ) ( not ( = ?auto_416633 ?auto_416640 ) ) ( not ( = ?auto_416633 ?auto_416641 ) ) ( not ( = ?auto_416633 ?auto_416642 ) ) ( not ( = ?auto_416633 ?auto_416643 ) ) ( not ( = ?auto_416634 ?auto_416635 ) ) ( not ( = ?auto_416634 ?auto_416636 ) ) ( not ( = ?auto_416634 ?auto_416637 ) ) ( not ( = ?auto_416634 ?auto_416638 ) ) ( not ( = ?auto_416634 ?auto_416639 ) ) ( not ( = ?auto_416634 ?auto_416640 ) ) ( not ( = ?auto_416634 ?auto_416641 ) ) ( not ( = ?auto_416634 ?auto_416642 ) ) ( not ( = ?auto_416634 ?auto_416643 ) ) ( not ( = ?auto_416635 ?auto_416636 ) ) ( not ( = ?auto_416635 ?auto_416637 ) ) ( not ( = ?auto_416635 ?auto_416638 ) ) ( not ( = ?auto_416635 ?auto_416639 ) ) ( not ( = ?auto_416635 ?auto_416640 ) ) ( not ( = ?auto_416635 ?auto_416641 ) ) ( not ( = ?auto_416635 ?auto_416642 ) ) ( not ( = ?auto_416635 ?auto_416643 ) ) ( not ( = ?auto_416636 ?auto_416637 ) ) ( not ( = ?auto_416636 ?auto_416638 ) ) ( not ( = ?auto_416636 ?auto_416639 ) ) ( not ( = ?auto_416636 ?auto_416640 ) ) ( not ( = ?auto_416636 ?auto_416641 ) ) ( not ( = ?auto_416636 ?auto_416642 ) ) ( not ( = ?auto_416636 ?auto_416643 ) ) ( not ( = ?auto_416637 ?auto_416638 ) ) ( not ( = ?auto_416637 ?auto_416639 ) ) ( not ( = ?auto_416637 ?auto_416640 ) ) ( not ( = ?auto_416637 ?auto_416641 ) ) ( not ( = ?auto_416637 ?auto_416642 ) ) ( not ( = ?auto_416637 ?auto_416643 ) ) ( not ( = ?auto_416638 ?auto_416639 ) ) ( not ( = ?auto_416638 ?auto_416640 ) ) ( not ( = ?auto_416638 ?auto_416641 ) ) ( not ( = ?auto_416638 ?auto_416642 ) ) ( not ( = ?auto_416638 ?auto_416643 ) ) ( not ( = ?auto_416639 ?auto_416640 ) ) ( not ( = ?auto_416639 ?auto_416641 ) ) ( not ( = ?auto_416639 ?auto_416642 ) ) ( not ( = ?auto_416639 ?auto_416643 ) ) ( not ( = ?auto_416640 ?auto_416641 ) ) ( not ( = ?auto_416640 ?auto_416642 ) ) ( not ( = ?auto_416640 ?auto_416643 ) ) ( not ( = ?auto_416641 ?auto_416642 ) ) ( not ( = ?auto_416641 ?auto_416643 ) ) ( not ( = ?auto_416642 ?auto_416643 ) ) ( ON ?auto_416641 ?auto_416642 ) ( ON ?auto_416640 ?auto_416641 ) ( ON ?auto_416639 ?auto_416640 ) ( ON ?auto_416638 ?auto_416639 ) ( ON ?auto_416637 ?auto_416638 ) ( CLEAR ?auto_416635 ) ( ON ?auto_416636 ?auto_416637 ) ( CLEAR ?auto_416636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_416629 ?auto_416630 ?auto_416631 ?auto_416632 ?auto_416633 ?auto_416634 ?auto_416635 ?auto_416636 )
      ( MAKE-14PILE ?auto_416629 ?auto_416630 ?auto_416631 ?auto_416632 ?auto_416633 ?auto_416634 ?auto_416635 ?auto_416636 ?auto_416637 ?auto_416638 ?auto_416639 ?auto_416640 ?auto_416641 ?auto_416642 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416658 - BLOCK
      ?auto_416659 - BLOCK
      ?auto_416660 - BLOCK
      ?auto_416661 - BLOCK
      ?auto_416662 - BLOCK
      ?auto_416663 - BLOCK
      ?auto_416664 - BLOCK
      ?auto_416665 - BLOCK
      ?auto_416666 - BLOCK
      ?auto_416667 - BLOCK
      ?auto_416668 - BLOCK
      ?auto_416669 - BLOCK
      ?auto_416670 - BLOCK
      ?auto_416671 - BLOCK
    )
    :vars
    (
      ?auto_416672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416671 ?auto_416672 ) ( ON-TABLE ?auto_416658 ) ( ON ?auto_416659 ?auto_416658 ) ( ON ?auto_416660 ?auto_416659 ) ( ON ?auto_416661 ?auto_416660 ) ( ON ?auto_416662 ?auto_416661 ) ( ON ?auto_416663 ?auto_416662 ) ( not ( = ?auto_416658 ?auto_416659 ) ) ( not ( = ?auto_416658 ?auto_416660 ) ) ( not ( = ?auto_416658 ?auto_416661 ) ) ( not ( = ?auto_416658 ?auto_416662 ) ) ( not ( = ?auto_416658 ?auto_416663 ) ) ( not ( = ?auto_416658 ?auto_416664 ) ) ( not ( = ?auto_416658 ?auto_416665 ) ) ( not ( = ?auto_416658 ?auto_416666 ) ) ( not ( = ?auto_416658 ?auto_416667 ) ) ( not ( = ?auto_416658 ?auto_416668 ) ) ( not ( = ?auto_416658 ?auto_416669 ) ) ( not ( = ?auto_416658 ?auto_416670 ) ) ( not ( = ?auto_416658 ?auto_416671 ) ) ( not ( = ?auto_416658 ?auto_416672 ) ) ( not ( = ?auto_416659 ?auto_416660 ) ) ( not ( = ?auto_416659 ?auto_416661 ) ) ( not ( = ?auto_416659 ?auto_416662 ) ) ( not ( = ?auto_416659 ?auto_416663 ) ) ( not ( = ?auto_416659 ?auto_416664 ) ) ( not ( = ?auto_416659 ?auto_416665 ) ) ( not ( = ?auto_416659 ?auto_416666 ) ) ( not ( = ?auto_416659 ?auto_416667 ) ) ( not ( = ?auto_416659 ?auto_416668 ) ) ( not ( = ?auto_416659 ?auto_416669 ) ) ( not ( = ?auto_416659 ?auto_416670 ) ) ( not ( = ?auto_416659 ?auto_416671 ) ) ( not ( = ?auto_416659 ?auto_416672 ) ) ( not ( = ?auto_416660 ?auto_416661 ) ) ( not ( = ?auto_416660 ?auto_416662 ) ) ( not ( = ?auto_416660 ?auto_416663 ) ) ( not ( = ?auto_416660 ?auto_416664 ) ) ( not ( = ?auto_416660 ?auto_416665 ) ) ( not ( = ?auto_416660 ?auto_416666 ) ) ( not ( = ?auto_416660 ?auto_416667 ) ) ( not ( = ?auto_416660 ?auto_416668 ) ) ( not ( = ?auto_416660 ?auto_416669 ) ) ( not ( = ?auto_416660 ?auto_416670 ) ) ( not ( = ?auto_416660 ?auto_416671 ) ) ( not ( = ?auto_416660 ?auto_416672 ) ) ( not ( = ?auto_416661 ?auto_416662 ) ) ( not ( = ?auto_416661 ?auto_416663 ) ) ( not ( = ?auto_416661 ?auto_416664 ) ) ( not ( = ?auto_416661 ?auto_416665 ) ) ( not ( = ?auto_416661 ?auto_416666 ) ) ( not ( = ?auto_416661 ?auto_416667 ) ) ( not ( = ?auto_416661 ?auto_416668 ) ) ( not ( = ?auto_416661 ?auto_416669 ) ) ( not ( = ?auto_416661 ?auto_416670 ) ) ( not ( = ?auto_416661 ?auto_416671 ) ) ( not ( = ?auto_416661 ?auto_416672 ) ) ( not ( = ?auto_416662 ?auto_416663 ) ) ( not ( = ?auto_416662 ?auto_416664 ) ) ( not ( = ?auto_416662 ?auto_416665 ) ) ( not ( = ?auto_416662 ?auto_416666 ) ) ( not ( = ?auto_416662 ?auto_416667 ) ) ( not ( = ?auto_416662 ?auto_416668 ) ) ( not ( = ?auto_416662 ?auto_416669 ) ) ( not ( = ?auto_416662 ?auto_416670 ) ) ( not ( = ?auto_416662 ?auto_416671 ) ) ( not ( = ?auto_416662 ?auto_416672 ) ) ( not ( = ?auto_416663 ?auto_416664 ) ) ( not ( = ?auto_416663 ?auto_416665 ) ) ( not ( = ?auto_416663 ?auto_416666 ) ) ( not ( = ?auto_416663 ?auto_416667 ) ) ( not ( = ?auto_416663 ?auto_416668 ) ) ( not ( = ?auto_416663 ?auto_416669 ) ) ( not ( = ?auto_416663 ?auto_416670 ) ) ( not ( = ?auto_416663 ?auto_416671 ) ) ( not ( = ?auto_416663 ?auto_416672 ) ) ( not ( = ?auto_416664 ?auto_416665 ) ) ( not ( = ?auto_416664 ?auto_416666 ) ) ( not ( = ?auto_416664 ?auto_416667 ) ) ( not ( = ?auto_416664 ?auto_416668 ) ) ( not ( = ?auto_416664 ?auto_416669 ) ) ( not ( = ?auto_416664 ?auto_416670 ) ) ( not ( = ?auto_416664 ?auto_416671 ) ) ( not ( = ?auto_416664 ?auto_416672 ) ) ( not ( = ?auto_416665 ?auto_416666 ) ) ( not ( = ?auto_416665 ?auto_416667 ) ) ( not ( = ?auto_416665 ?auto_416668 ) ) ( not ( = ?auto_416665 ?auto_416669 ) ) ( not ( = ?auto_416665 ?auto_416670 ) ) ( not ( = ?auto_416665 ?auto_416671 ) ) ( not ( = ?auto_416665 ?auto_416672 ) ) ( not ( = ?auto_416666 ?auto_416667 ) ) ( not ( = ?auto_416666 ?auto_416668 ) ) ( not ( = ?auto_416666 ?auto_416669 ) ) ( not ( = ?auto_416666 ?auto_416670 ) ) ( not ( = ?auto_416666 ?auto_416671 ) ) ( not ( = ?auto_416666 ?auto_416672 ) ) ( not ( = ?auto_416667 ?auto_416668 ) ) ( not ( = ?auto_416667 ?auto_416669 ) ) ( not ( = ?auto_416667 ?auto_416670 ) ) ( not ( = ?auto_416667 ?auto_416671 ) ) ( not ( = ?auto_416667 ?auto_416672 ) ) ( not ( = ?auto_416668 ?auto_416669 ) ) ( not ( = ?auto_416668 ?auto_416670 ) ) ( not ( = ?auto_416668 ?auto_416671 ) ) ( not ( = ?auto_416668 ?auto_416672 ) ) ( not ( = ?auto_416669 ?auto_416670 ) ) ( not ( = ?auto_416669 ?auto_416671 ) ) ( not ( = ?auto_416669 ?auto_416672 ) ) ( not ( = ?auto_416670 ?auto_416671 ) ) ( not ( = ?auto_416670 ?auto_416672 ) ) ( not ( = ?auto_416671 ?auto_416672 ) ) ( ON ?auto_416670 ?auto_416671 ) ( ON ?auto_416669 ?auto_416670 ) ( ON ?auto_416668 ?auto_416669 ) ( ON ?auto_416667 ?auto_416668 ) ( ON ?auto_416666 ?auto_416667 ) ( ON ?auto_416665 ?auto_416666 ) ( CLEAR ?auto_416663 ) ( ON ?auto_416664 ?auto_416665 ) ( CLEAR ?auto_416664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_416658 ?auto_416659 ?auto_416660 ?auto_416661 ?auto_416662 ?auto_416663 ?auto_416664 )
      ( MAKE-14PILE ?auto_416658 ?auto_416659 ?auto_416660 ?auto_416661 ?auto_416662 ?auto_416663 ?auto_416664 ?auto_416665 ?auto_416666 ?auto_416667 ?auto_416668 ?auto_416669 ?auto_416670 ?auto_416671 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416687 - BLOCK
      ?auto_416688 - BLOCK
      ?auto_416689 - BLOCK
      ?auto_416690 - BLOCK
      ?auto_416691 - BLOCK
      ?auto_416692 - BLOCK
      ?auto_416693 - BLOCK
      ?auto_416694 - BLOCK
      ?auto_416695 - BLOCK
      ?auto_416696 - BLOCK
      ?auto_416697 - BLOCK
      ?auto_416698 - BLOCK
      ?auto_416699 - BLOCK
      ?auto_416700 - BLOCK
    )
    :vars
    (
      ?auto_416701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416700 ?auto_416701 ) ( ON-TABLE ?auto_416687 ) ( ON ?auto_416688 ?auto_416687 ) ( ON ?auto_416689 ?auto_416688 ) ( ON ?auto_416690 ?auto_416689 ) ( ON ?auto_416691 ?auto_416690 ) ( ON ?auto_416692 ?auto_416691 ) ( not ( = ?auto_416687 ?auto_416688 ) ) ( not ( = ?auto_416687 ?auto_416689 ) ) ( not ( = ?auto_416687 ?auto_416690 ) ) ( not ( = ?auto_416687 ?auto_416691 ) ) ( not ( = ?auto_416687 ?auto_416692 ) ) ( not ( = ?auto_416687 ?auto_416693 ) ) ( not ( = ?auto_416687 ?auto_416694 ) ) ( not ( = ?auto_416687 ?auto_416695 ) ) ( not ( = ?auto_416687 ?auto_416696 ) ) ( not ( = ?auto_416687 ?auto_416697 ) ) ( not ( = ?auto_416687 ?auto_416698 ) ) ( not ( = ?auto_416687 ?auto_416699 ) ) ( not ( = ?auto_416687 ?auto_416700 ) ) ( not ( = ?auto_416687 ?auto_416701 ) ) ( not ( = ?auto_416688 ?auto_416689 ) ) ( not ( = ?auto_416688 ?auto_416690 ) ) ( not ( = ?auto_416688 ?auto_416691 ) ) ( not ( = ?auto_416688 ?auto_416692 ) ) ( not ( = ?auto_416688 ?auto_416693 ) ) ( not ( = ?auto_416688 ?auto_416694 ) ) ( not ( = ?auto_416688 ?auto_416695 ) ) ( not ( = ?auto_416688 ?auto_416696 ) ) ( not ( = ?auto_416688 ?auto_416697 ) ) ( not ( = ?auto_416688 ?auto_416698 ) ) ( not ( = ?auto_416688 ?auto_416699 ) ) ( not ( = ?auto_416688 ?auto_416700 ) ) ( not ( = ?auto_416688 ?auto_416701 ) ) ( not ( = ?auto_416689 ?auto_416690 ) ) ( not ( = ?auto_416689 ?auto_416691 ) ) ( not ( = ?auto_416689 ?auto_416692 ) ) ( not ( = ?auto_416689 ?auto_416693 ) ) ( not ( = ?auto_416689 ?auto_416694 ) ) ( not ( = ?auto_416689 ?auto_416695 ) ) ( not ( = ?auto_416689 ?auto_416696 ) ) ( not ( = ?auto_416689 ?auto_416697 ) ) ( not ( = ?auto_416689 ?auto_416698 ) ) ( not ( = ?auto_416689 ?auto_416699 ) ) ( not ( = ?auto_416689 ?auto_416700 ) ) ( not ( = ?auto_416689 ?auto_416701 ) ) ( not ( = ?auto_416690 ?auto_416691 ) ) ( not ( = ?auto_416690 ?auto_416692 ) ) ( not ( = ?auto_416690 ?auto_416693 ) ) ( not ( = ?auto_416690 ?auto_416694 ) ) ( not ( = ?auto_416690 ?auto_416695 ) ) ( not ( = ?auto_416690 ?auto_416696 ) ) ( not ( = ?auto_416690 ?auto_416697 ) ) ( not ( = ?auto_416690 ?auto_416698 ) ) ( not ( = ?auto_416690 ?auto_416699 ) ) ( not ( = ?auto_416690 ?auto_416700 ) ) ( not ( = ?auto_416690 ?auto_416701 ) ) ( not ( = ?auto_416691 ?auto_416692 ) ) ( not ( = ?auto_416691 ?auto_416693 ) ) ( not ( = ?auto_416691 ?auto_416694 ) ) ( not ( = ?auto_416691 ?auto_416695 ) ) ( not ( = ?auto_416691 ?auto_416696 ) ) ( not ( = ?auto_416691 ?auto_416697 ) ) ( not ( = ?auto_416691 ?auto_416698 ) ) ( not ( = ?auto_416691 ?auto_416699 ) ) ( not ( = ?auto_416691 ?auto_416700 ) ) ( not ( = ?auto_416691 ?auto_416701 ) ) ( not ( = ?auto_416692 ?auto_416693 ) ) ( not ( = ?auto_416692 ?auto_416694 ) ) ( not ( = ?auto_416692 ?auto_416695 ) ) ( not ( = ?auto_416692 ?auto_416696 ) ) ( not ( = ?auto_416692 ?auto_416697 ) ) ( not ( = ?auto_416692 ?auto_416698 ) ) ( not ( = ?auto_416692 ?auto_416699 ) ) ( not ( = ?auto_416692 ?auto_416700 ) ) ( not ( = ?auto_416692 ?auto_416701 ) ) ( not ( = ?auto_416693 ?auto_416694 ) ) ( not ( = ?auto_416693 ?auto_416695 ) ) ( not ( = ?auto_416693 ?auto_416696 ) ) ( not ( = ?auto_416693 ?auto_416697 ) ) ( not ( = ?auto_416693 ?auto_416698 ) ) ( not ( = ?auto_416693 ?auto_416699 ) ) ( not ( = ?auto_416693 ?auto_416700 ) ) ( not ( = ?auto_416693 ?auto_416701 ) ) ( not ( = ?auto_416694 ?auto_416695 ) ) ( not ( = ?auto_416694 ?auto_416696 ) ) ( not ( = ?auto_416694 ?auto_416697 ) ) ( not ( = ?auto_416694 ?auto_416698 ) ) ( not ( = ?auto_416694 ?auto_416699 ) ) ( not ( = ?auto_416694 ?auto_416700 ) ) ( not ( = ?auto_416694 ?auto_416701 ) ) ( not ( = ?auto_416695 ?auto_416696 ) ) ( not ( = ?auto_416695 ?auto_416697 ) ) ( not ( = ?auto_416695 ?auto_416698 ) ) ( not ( = ?auto_416695 ?auto_416699 ) ) ( not ( = ?auto_416695 ?auto_416700 ) ) ( not ( = ?auto_416695 ?auto_416701 ) ) ( not ( = ?auto_416696 ?auto_416697 ) ) ( not ( = ?auto_416696 ?auto_416698 ) ) ( not ( = ?auto_416696 ?auto_416699 ) ) ( not ( = ?auto_416696 ?auto_416700 ) ) ( not ( = ?auto_416696 ?auto_416701 ) ) ( not ( = ?auto_416697 ?auto_416698 ) ) ( not ( = ?auto_416697 ?auto_416699 ) ) ( not ( = ?auto_416697 ?auto_416700 ) ) ( not ( = ?auto_416697 ?auto_416701 ) ) ( not ( = ?auto_416698 ?auto_416699 ) ) ( not ( = ?auto_416698 ?auto_416700 ) ) ( not ( = ?auto_416698 ?auto_416701 ) ) ( not ( = ?auto_416699 ?auto_416700 ) ) ( not ( = ?auto_416699 ?auto_416701 ) ) ( not ( = ?auto_416700 ?auto_416701 ) ) ( ON ?auto_416699 ?auto_416700 ) ( ON ?auto_416698 ?auto_416699 ) ( ON ?auto_416697 ?auto_416698 ) ( ON ?auto_416696 ?auto_416697 ) ( ON ?auto_416695 ?auto_416696 ) ( ON ?auto_416694 ?auto_416695 ) ( CLEAR ?auto_416692 ) ( ON ?auto_416693 ?auto_416694 ) ( CLEAR ?auto_416693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_416687 ?auto_416688 ?auto_416689 ?auto_416690 ?auto_416691 ?auto_416692 ?auto_416693 )
      ( MAKE-14PILE ?auto_416687 ?auto_416688 ?auto_416689 ?auto_416690 ?auto_416691 ?auto_416692 ?auto_416693 ?auto_416694 ?auto_416695 ?auto_416696 ?auto_416697 ?auto_416698 ?auto_416699 ?auto_416700 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416716 - BLOCK
      ?auto_416717 - BLOCK
      ?auto_416718 - BLOCK
      ?auto_416719 - BLOCK
      ?auto_416720 - BLOCK
      ?auto_416721 - BLOCK
      ?auto_416722 - BLOCK
      ?auto_416723 - BLOCK
      ?auto_416724 - BLOCK
      ?auto_416725 - BLOCK
      ?auto_416726 - BLOCK
      ?auto_416727 - BLOCK
      ?auto_416728 - BLOCK
      ?auto_416729 - BLOCK
    )
    :vars
    (
      ?auto_416730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416729 ?auto_416730 ) ( ON-TABLE ?auto_416716 ) ( ON ?auto_416717 ?auto_416716 ) ( ON ?auto_416718 ?auto_416717 ) ( ON ?auto_416719 ?auto_416718 ) ( ON ?auto_416720 ?auto_416719 ) ( not ( = ?auto_416716 ?auto_416717 ) ) ( not ( = ?auto_416716 ?auto_416718 ) ) ( not ( = ?auto_416716 ?auto_416719 ) ) ( not ( = ?auto_416716 ?auto_416720 ) ) ( not ( = ?auto_416716 ?auto_416721 ) ) ( not ( = ?auto_416716 ?auto_416722 ) ) ( not ( = ?auto_416716 ?auto_416723 ) ) ( not ( = ?auto_416716 ?auto_416724 ) ) ( not ( = ?auto_416716 ?auto_416725 ) ) ( not ( = ?auto_416716 ?auto_416726 ) ) ( not ( = ?auto_416716 ?auto_416727 ) ) ( not ( = ?auto_416716 ?auto_416728 ) ) ( not ( = ?auto_416716 ?auto_416729 ) ) ( not ( = ?auto_416716 ?auto_416730 ) ) ( not ( = ?auto_416717 ?auto_416718 ) ) ( not ( = ?auto_416717 ?auto_416719 ) ) ( not ( = ?auto_416717 ?auto_416720 ) ) ( not ( = ?auto_416717 ?auto_416721 ) ) ( not ( = ?auto_416717 ?auto_416722 ) ) ( not ( = ?auto_416717 ?auto_416723 ) ) ( not ( = ?auto_416717 ?auto_416724 ) ) ( not ( = ?auto_416717 ?auto_416725 ) ) ( not ( = ?auto_416717 ?auto_416726 ) ) ( not ( = ?auto_416717 ?auto_416727 ) ) ( not ( = ?auto_416717 ?auto_416728 ) ) ( not ( = ?auto_416717 ?auto_416729 ) ) ( not ( = ?auto_416717 ?auto_416730 ) ) ( not ( = ?auto_416718 ?auto_416719 ) ) ( not ( = ?auto_416718 ?auto_416720 ) ) ( not ( = ?auto_416718 ?auto_416721 ) ) ( not ( = ?auto_416718 ?auto_416722 ) ) ( not ( = ?auto_416718 ?auto_416723 ) ) ( not ( = ?auto_416718 ?auto_416724 ) ) ( not ( = ?auto_416718 ?auto_416725 ) ) ( not ( = ?auto_416718 ?auto_416726 ) ) ( not ( = ?auto_416718 ?auto_416727 ) ) ( not ( = ?auto_416718 ?auto_416728 ) ) ( not ( = ?auto_416718 ?auto_416729 ) ) ( not ( = ?auto_416718 ?auto_416730 ) ) ( not ( = ?auto_416719 ?auto_416720 ) ) ( not ( = ?auto_416719 ?auto_416721 ) ) ( not ( = ?auto_416719 ?auto_416722 ) ) ( not ( = ?auto_416719 ?auto_416723 ) ) ( not ( = ?auto_416719 ?auto_416724 ) ) ( not ( = ?auto_416719 ?auto_416725 ) ) ( not ( = ?auto_416719 ?auto_416726 ) ) ( not ( = ?auto_416719 ?auto_416727 ) ) ( not ( = ?auto_416719 ?auto_416728 ) ) ( not ( = ?auto_416719 ?auto_416729 ) ) ( not ( = ?auto_416719 ?auto_416730 ) ) ( not ( = ?auto_416720 ?auto_416721 ) ) ( not ( = ?auto_416720 ?auto_416722 ) ) ( not ( = ?auto_416720 ?auto_416723 ) ) ( not ( = ?auto_416720 ?auto_416724 ) ) ( not ( = ?auto_416720 ?auto_416725 ) ) ( not ( = ?auto_416720 ?auto_416726 ) ) ( not ( = ?auto_416720 ?auto_416727 ) ) ( not ( = ?auto_416720 ?auto_416728 ) ) ( not ( = ?auto_416720 ?auto_416729 ) ) ( not ( = ?auto_416720 ?auto_416730 ) ) ( not ( = ?auto_416721 ?auto_416722 ) ) ( not ( = ?auto_416721 ?auto_416723 ) ) ( not ( = ?auto_416721 ?auto_416724 ) ) ( not ( = ?auto_416721 ?auto_416725 ) ) ( not ( = ?auto_416721 ?auto_416726 ) ) ( not ( = ?auto_416721 ?auto_416727 ) ) ( not ( = ?auto_416721 ?auto_416728 ) ) ( not ( = ?auto_416721 ?auto_416729 ) ) ( not ( = ?auto_416721 ?auto_416730 ) ) ( not ( = ?auto_416722 ?auto_416723 ) ) ( not ( = ?auto_416722 ?auto_416724 ) ) ( not ( = ?auto_416722 ?auto_416725 ) ) ( not ( = ?auto_416722 ?auto_416726 ) ) ( not ( = ?auto_416722 ?auto_416727 ) ) ( not ( = ?auto_416722 ?auto_416728 ) ) ( not ( = ?auto_416722 ?auto_416729 ) ) ( not ( = ?auto_416722 ?auto_416730 ) ) ( not ( = ?auto_416723 ?auto_416724 ) ) ( not ( = ?auto_416723 ?auto_416725 ) ) ( not ( = ?auto_416723 ?auto_416726 ) ) ( not ( = ?auto_416723 ?auto_416727 ) ) ( not ( = ?auto_416723 ?auto_416728 ) ) ( not ( = ?auto_416723 ?auto_416729 ) ) ( not ( = ?auto_416723 ?auto_416730 ) ) ( not ( = ?auto_416724 ?auto_416725 ) ) ( not ( = ?auto_416724 ?auto_416726 ) ) ( not ( = ?auto_416724 ?auto_416727 ) ) ( not ( = ?auto_416724 ?auto_416728 ) ) ( not ( = ?auto_416724 ?auto_416729 ) ) ( not ( = ?auto_416724 ?auto_416730 ) ) ( not ( = ?auto_416725 ?auto_416726 ) ) ( not ( = ?auto_416725 ?auto_416727 ) ) ( not ( = ?auto_416725 ?auto_416728 ) ) ( not ( = ?auto_416725 ?auto_416729 ) ) ( not ( = ?auto_416725 ?auto_416730 ) ) ( not ( = ?auto_416726 ?auto_416727 ) ) ( not ( = ?auto_416726 ?auto_416728 ) ) ( not ( = ?auto_416726 ?auto_416729 ) ) ( not ( = ?auto_416726 ?auto_416730 ) ) ( not ( = ?auto_416727 ?auto_416728 ) ) ( not ( = ?auto_416727 ?auto_416729 ) ) ( not ( = ?auto_416727 ?auto_416730 ) ) ( not ( = ?auto_416728 ?auto_416729 ) ) ( not ( = ?auto_416728 ?auto_416730 ) ) ( not ( = ?auto_416729 ?auto_416730 ) ) ( ON ?auto_416728 ?auto_416729 ) ( ON ?auto_416727 ?auto_416728 ) ( ON ?auto_416726 ?auto_416727 ) ( ON ?auto_416725 ?auto_416726 ) ( ON ?auto_416724 ?auto_416725 ) ( ON ?auto_416723 ?auto_416724 ) ( ON ?auto_416722 ?auto_416723 ) ( CLEAR ?auto_416720 ) ( ON ?auto_416721 ?auto_416722 ) ( CLEAR ?auto_416721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_416716 ?auto_416717 ?auto_416718 ?auto_416719 ?auto_416720 ?auto_416721 )
      ( MAKE-14PILE ?auto_416716 ?auto_416717 ?auto_416718 ?auto_416719 ?auto_416720 ?auto_416721 ?auto_416722 ?auto_416723 ?auto_416724 ?auto_416725 ?auto_416726 ?auto_416727 ?auto_416728 ?auto_416729 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416745 - BLOCK
      ?auto_416746 - BLOCK
      ?auto_416747 - BLOCK
      ?auto_416748 - BLOCK
      ?auto_416749 - BLOCK
      ?auto_416750 - BLOCK
      ?auto_416751 - BLOCK
      ?auto_416752 - BLOCK
      ?auto_416753 - BLOCK
      ?auto_416754 - BLOCK
      ?auto_416755 - BLOCK
      ?auto_416756 - BLOCK
      ?auto_416757 - BLOCK
      ?auto_416758 - BLOCK
    )
    :vars
    (
      ?auto_416759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416758 ?auto_416759 ) ( ON-TABLE ?auto_416745 ) ( ON ?auto_416746 ?auto_416745 ) ( ON ?auto_416747 ?auto_416746 ) ( ON ?auto_416748 ?auto_416747 ) ( ON ?auto_416749 ?auto_416748 ) ( not ( = ?auto_416745 ?auto_416746 ) ) ( not ( = ?auto_416745 ?auto_416747 ) ) ( not ( = ?auto_416745 ?auto_416748 ) ) ( not ( = ?auto_416745 ?auto_416749 ) ) ( not ( = ?auto_416745 ?auto_416750 ) ) ( not ( = ?auto_416745 ?auto_416751 ) ) ( not ( = ?auto_416745 ?auto_416752 ) ) ( not ( = ?auto_416745 ?auto_416753 ) ) ( not ( = ?auto_416745 ?auto_416754 ) ) ( not ( = ?auto_416745 ?auto_416755 ) ) ( not ( = ?auto_416745 ?auto_416756 ) ) ( not ( = ?auto_416745 ?auto_416757 ) ) ( not ( = ?auto_416745 ?auto_416758 ) ) ( not ( = ?auto_416745 ?auto_416759 ) ) ( not ( = ?auto_416746 ?auto_416747 ) ) ( not ( = ?auto_416746 ?auto_416748 ) ) ( not ( = ?auto_416746 ?auto_416749 ) ) ( not ( = ?auto_416746 ?auto_416750 ) ) ( not ( = ?auto_416746 ?auto_416751 ) ) ( not ( = ?auto_416746 ?auto_416752 ) ) ( not ( = ?auto_416746 ?auto_416753 ) ) ( not ( = ?auto_416746 ?auto_416754 ) ) ( not ( = ?auto_416746 ?auto_416755 ) ) ( not ( = ?auto_416746 ?auto_416756 ) ) ( not ( = ?auto_416746 ?auto_416757 ) ) ( not ( = ?auto_416746 ?auto_416758 ) ) ( not ( = ?auto_416746 ?auto_416759 ) ) ( not ( = ?auto_416747 ?auto_416748 ) ) ( not ( = ?auto_416747 ?auto_416749 ) ) ( not ( = ?auto_416747 ?auto_416750 ) ) ( not ( = ?auto_416747 ?auto_416751 ) ) ( not ( = ?auto_416747 ?auto_416752 ) ) ( not ( = ?auto_416747 ?auto_416753 ) ) ( not ( = ?auto_416747 ?auto_416754 ) ) ( not ( = ?auto_416747 ?auto_416755 ) ) ( not ( = ?auto_416747 ?auto_416756 ) ) ( not ( = ?auto_416747 ?auto_416757 ) ) ( not ( = ?auto_416747 ?auto_416758 ) ) ( not ( = ?auto_416747 ?auto_416759 ) ) ( not ( = ?auto_416748 ?auto_416749 ) ) ( not ( = ?auto_416748 ?auto_416750 ) ) ( not ( = ?auto_416748 ?auto_416751 ) ) ( not ( = ?auto_416748 ?auto_416752 ) ) ( not ( = ?auto_416748 ?auto_416753 ) ) ( not ( = ?auto_416748 ?auto_416754 ) ) ( not ( = ?auto_416748 ?auto_416755 ) ) ( not ( = ?auto_416748 ?auto_416756 ) ) ( not ( = ?auto_416748 ?auto_416757 ) ) ( not ( = ?auto_416748 ?auto_416758 ) ) ( not ( = ?auto_416748 ?auto_416759 ) ) ( not ( = ?auto_416749 ?auto_416750 ) ) ( not ( = ?auto_416749 ?auto_416751 ) ) ( not ( = ?auto_416749 ?auto_416752 ) ) ( not ( = ?auto_416749 ?auto_416753 ) ) ( not ( = ?auto_416749 ?auto_416754 ) ) ( not ( = ?auto_416749 ?auto_416755 ) ) ( not ( = ?auto_416749 ?auto_416756 ) ) ( not ( = ?auto_416749 ?auto_416757 ) ) ( not ( = ?auto_416749 ?auto_416758 ) ) ( not ( = ?auto_416749 ?auto_416759 ) ) ( not ( = ?auto_416750 ?auto_416751 ) ) ( not ( = ?auto_416750 ?auto_416752 ) ) ( not ( = ?auto_416750 ?auto_416753 ) ) ( not ( = ?auto_416750 ?auto_416754 ) ) ( not ( = ?auto_416750 ?auto_416755 ) ) ( not ( = ?auto_416750 ?auto_416756 ) ) ( not ( = ?auto_416750 ?auto_416757 ) ) ( not ( = ?auto_416750 ?auto_416758 ) ) ( not ( = ?auto_416750 ?auto_416759 ) ) ( not ( = ?auto_416751 ?auto_416752 ) ) ( not ( = ?auto_416751 ?auto_416753 ) ) ( not ( = ?auto_416751 ?auto_416754 ) ) ( not ( = ?auto_416751 ?auto_416755 ) ) ( not ( = ?auto_416751 ?auto_416756 ) ) ( not ( = ?auto_416751 ?auto_416757 ) ) ( not ( = ?auto_416751 ?auto_416758 ) ) ( not ( = ?auto_416751 ?auto_416759 ) ) ( not ( = ?auto_416752 ?auto_416753 ) ) ( not ( = ?auto_416752 ?auto_416754 ) ) ( not ( = ?auto_416752 ?auto_416755 ) ) ( not ( = ?auto_416752 ?auto_416756 ) ) ( not ( = ?auto_416752 ?auto_416757 ) ) ( not ( = ?auto_416752 ?auto_416758 ) ) ( not ( = ?auto_416752 ?auto_416759 ) ) ( not ( = ?auto_416753 ?auto_416754 ) ) ( not ( = ?auto_416753 ?auto_416755 ) ) ( not ( = ?auto_416753 ?auto_416756 ) ) ( not ( = ?auto_416753 ?auto_416757 ) ) ( not ( = ?auto_416753 ?auto_416758 ) ) ( not ( = ?auto_416753 ?auto_416759 ) ) ( not ( = ?auto_416754 ?auto_416755 ) ) ( not ( = ?auto_416754 ?auto_416756 ) ) ( not ( = ?auto_416754 ?auto_416757 ) ) ( not ( = ?auto_416754 ?auto_416758 ) ) ( not ( = ?auto_416754 ?auto_416759 ) ) ( not ( = ?auto_416755 ?auto_416756 ) ) ( not ( = ?auto_416755 ?auto_416757 ) ) ( not ( = ?auto_416755 ?auto_416758 ) ) ( not ( = ?auto_416755 ?auto_416759 ) ) ( not ( = ?auto_416756 ?auto_416757 ) ) ( not ( = ?auto_416756 ?auto_416758 ) ) ( not ( = ?auto_416756 ?auto_416759 ) ) ( not ( = ?auto_416757 ?auto_416758 ) ) ( not ( = ?auto_416757 ?auto_416759 ) ) ( not ( = ?auto_416758 ?auto_416759 ) ) ( ON ?auto_416757 ?auto_416758 ) ( ON ?auto_416756 ?auto_416757 ) ( ON ?auto_416755 ?auto_416756 ) ( ON ?auto_416754 ?auto_416755 ) ( ON ?auto_416753 ?auto_416754 ) ( ON ?auto_416752 ?auto_416753 ) ( ON ?auto_416751 ?auto_416752 ) ( CLEAR ?auto_416749 ) ( ON ?auto_416750 ?auto_416751 ) ( CLEAR ?auto_416750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_416745 ?auto_416746 ?auto_416747 ?auto_416748 ?auto_416749 ?auto_416750 )
      ( MAKE-14PILE ?auto_416745 ?auto_416746 ?auto_416747 ?auto_416748 ?auto_416749 ?auto_416750 ?auto_416751 ?auto_416752 ?auto_416753 ?auto_416754 ?auto_416755 ?auto_416756 ?auto_416757 ?auto_416758 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416774 - BLOCK
      ?auto_416775 - BLOCK
      ?auto_416776 - BLOCK
      ?auto_416777 - BLOCK
      ?auto_416778 - BLOCK
      ?auto_416779 - BLOCK
      ?auto_416780 - BLOCK
      ?auto_416781 - BLOCK
      ?auto_416782 - BLOCK
      ?auto_416783 - BLOCK
      ?auto_416784 - BLOCK
      ?auto_416785 - BLOCK
      ?auto_416786 - BLOCK
      ?auto_416787 - BLOCK
    )
    :vars
    (
      ?auto_416788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416787 ?auto_416788 ) ( ON-TABLE ?auto_416774 ) ( ON ?auto_416775 ?auto_416774 ) ( ON ?auto_416776 ?auto_416775 ) ( ON ?auto_416777 ?auto_416776 ) ( not ( = ?auto_416774 ?auto_416775 ) ) ( not ( = ?auto_416774 ?auto_416776 ) ) ( not ( = ?auto_416774 ?auto_416777 ) ) ( not ( = ?auto_416774 ?auto_416778 ) ) ( not ( = ?auto_416774 ?auto_416779 ) ) ( not ( = ?auto_416774 ?auto_416780 ) ) ( not ( = ?auto_416774 ?auto_416781 ) ) ( not ( = ?auto_416774 ?auto_416782 ) ) ( not ( = ?auto_416774 ?auto_416783 ) ) ( not ( = ?auto_416774 ?auto_416784 ) ) ( not ( = ?auto_416774 ?auto_416785 ) ) ( not ( = ?auto_416774 ?auto_416786 ) ) ( not ( = ?auto_416774 ?auto_416787 ) ) ( not ( = ?auto_416774 ?auto_416788 ) ) ( not ( = ?auto_416775 ?auto_416776 ) ) ( not ( = ?auto_416775 ?auto_416777 ) ) ( not ( = ?auto_416775 ?auto_416778 ) ) ( not ( = ?auto_416775 ?auto_416779 ) ) ( not ( = ?auto_416775 ?auto_416780 ) ) ( not ( = ?auto_416775 ?auto_416781 ) ) ( not ( = ?auto_416775 ?auto_416782 ) ) ( not ( = ?auto_416775 ?auto_416783 ) ) ( not ( = ?auto_416775 ?auto_416784 ) ) ( not ( = ?auto_416775 ?auto_416785 ) ) ( not ( = ?auto_416775 ?auto_416786 ) ) ( not ( = ?auto_416775 ?auto_416787 ) ) ( not ( = ?auto_416775 ?auto_416788 ) ) ( not ( = ?auto_416776 ?auto_416777 ) ) ( not ( = ?auto_416776 ?auto_416778 ) ) ( not ( = ?auto_416776 ?auto_416779 ) ) ( not ( = ?auto_416776 ?auto_416780 ) ) ( not ( = ?auto_416776 ?auto_416781 ) ) ( not ( = ?auto_416776 ?auto_416782 ) ) ( not ( = ?auto_416776 ?auto_416783 ) ) ( not ( = ?auto_416776 ?auto_416784 ) ) ( not ( = ?auto_416776 ?auto_416785 ) ) ( not ( = ?auto_416776 ?auto_416786 ) ) ( not ( = ?auto_416776 ?auto_416787 ) ) ( not ( = ?auto_416776 ?auto_416788 ) ) ( not ( = ?auto_416777 ?auto_416778 ) ) ( not ( = ?auto_416777 ?auto_416779 ) ) ( not ( = ?auto_416777 ?auto_416780 ) ) ( not ( = ?auto_416777 ?auto_416781 ) ) ( not ( = ?auto_416777 ?auto_416782 ) ) ( not ( = ?auto_416777 ?auto_416783 ) ) ( not ( = ?auto_416777 ?auto_416784 ) ) ( not ( = ?auto_416777 ?auto_416785 ) ) ( not ( = ?auto_416777 ?auto_416786 ) ) ( not ( = ?auto_416777 ?auto_416787 ) ) ( not ( = ?auto_416777 ?auto_416788 ) ) ( not ( = ?auto_416778 ?auto_416779 ) ) ( not ( = ?auto_416778 ?auto_416780 ) ) ( not ( = ?auto_416778 ?auto_416781 ) ) ( not ( = ?auto_416778 ?auto_416782 ) ) ( not ( = ?auto_416778 ?auto_416783 ) ) ( not ( = ?auto_416778 ?auto_416784 ) ) ( not ( = ?auto_416778 ?auto_416785 ) ) ( not ( = ?auto_416778 ?auto_416786 ) ) ( not ( = ?auto_416778 ?auto_416787 ) ) ( not ( = ?auto_416778 ?auto_416788 ) ) ( not ( = ?auto_416779 ?auto_416780 ) ) ( not ( = ?auto_416779 ?auto_416781 ) ) ( not ( = ?auto_416779 ?auto_416782 ) ) ( not ( = ?auto_416779 ?auto_416783 ) ) ( not ( = ?auto_416779 ?auto_416784 ) ) ( not ( = ?auto_416779 ?auto_416785 ) ) ( not ( = ?auto_416779 ?auto_416786 ) ) ( not ( = ?auto_416779 ?auto_416787 ) ) ( not ( = ?auto_416779 ?auto_416788 ) ) ( not ( = ?auto_416780 ?auto_416781 ) ) ( not ( = ?auto_416780 ?auto_416782 ) ) ( not ( = ?auto_416780 ?auto_416783 ) ) ( not ( = ?auto_416780 ?auto_416784 ) ) ( not ( = ?auto_416780 ?auto_416785 ) ) ( not ( = ?auto_416780 ?auto_416786 ) ) ( not ( = ?auto_416780 ?auto_416787 ) ) ( not ( = ?auto_416780 ?auto_416788 ) ) ( not ( = ?auto_416781 ?auto_416782 ) ) ( not ( = ?auto_416781 ?auto_416783 ) ) ( not ( = ?auto_416781 ?auto_416784 ) ) ( not ( = ?auto_416781 ?auto_416785 ) ) ( not ( = ?auto_416781 ?auto_416786 ) ) ( not ( = ?auto_416781 ?auto_416787 ) ) ( not ( = ?auto_416781 ?auto_416788 ) ) ( not ( = ?auto_416782 ?auto_416783 ) ) ( not ( = ?auto_416782 ?auto_416784 ) ) ( not ( = ?auto_416782 ?auto_416785 ) ) ( not ( = ?auto_416782 ?auto_416786 ) ) ( not ( = ?auto_416782 ?auto_416787 ) ) ( not ( = ?auto_416782 ?auto_416788 ) ) ( not ( = ?auto_416783 ?auto_416784 ) ) ( not ( = ?auto_416783 ?auto_416785 ) ) ( not ( = ?auto_416783 ?auto_416786 ) ) ( not ( = ?auto_416783 ?auto_416787 ) ) ( not ( = ?auto_416783 ?auto_416788 ) ) ( not ( = ?auto_416784 ?auto_416785 ) ) ( not ( = ?auto_416784 ?auto_416786 ) ) ( not ( = ?auto_416784 ?auto_416787 ) ) ( not ( = ?auto_416784 ?auto_416788 ) ) ( not ( = ?auto_416785 ?auto_416786 ) ) ( not ( = ?auto_416785 ?auto_416787 ) ) ( not ( = ?auto_416785 ?auto_416788 ) ) ( not ( = ?auto_416786 ?auto_416787 ) ) ( not ( = ?auto_416786 ?auto_416788 ) ) ( not ( = ?auto_416787 ?auto_416788 ) ) ( ON ?auto_416786 ?auto_416787 ) ( ON ?auto_416785 ?auto_416786 ) ( ON ?auto_416784 ?auto_416785 ) ( ON ?auto_416783 ?auto_416784 ) ( ON ?auto_416782 ?auto_416783 ) ( ON ?auto_416781 ?auto_416782 ) ( ON ?auto_416780 ?auto_416781 ) ( ON ?auto_416779 ?auto_416780 ) ( CLEAR ?auto_416777 ) ( ON ?auto_416778 ?auto_416779 ) ( CLEAR ?auto_416778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_416774 ?auto_416775 ?auto_416776 ?auto_416777 ?auto_416778 )
      ( MAKE-14PILE ?auto_416774 ?auto_416775 ?auto_416776 ?auto_416777 ?auto_416778 ?auto_416779 ?auto_416780 ?auto_416781 ?auto_416782 ?auto_416783 ?auto_416784 ?auto_416785 ?auto_416786 ?auto_416787 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416803 - BLOCK
      ?auto_416804 - BLOCK
      ?auto_416805 - BLOCK
      ?auto_416806 - BLOCK
      ?auto_416807 - BLOCK
      ?auto_416808 - BLOCK
      ?auto_416809 - BLOCK
      ?auto_416810 - BLOCK
      ?auto_416811 - BLOCK
      ?auto_416812 - BLOCK
      ?auto_416813 - BLOCK
      ?auto_416814 - BLOCK
      ?auto_416815 - BLOCK
      ?auto_416816 - BLOCK
    )
    :vars
    (
      ?auto_416817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416816 ?auto_416817 ) ( ON-TABLE ?auto_416803 ) ( ON ?auto_416804 ?auto_416803 ) ( ON ?auto_416805 ?auto_416804 ) ( ON ?auto_416806 ?auto_416805 ) ( not ( = ?auto_416803 ?auto_416804 ) ) ( not ( = ?auto_416803 ?auto_416805 ) ) ( not ( = ?auto_416803 ?auto_416806 ) ) ( not ( = ?auto_416803 ?auto_416807 ) ) ( not ( = ?auto_416803 ?auto_416808 ) ) ( not ( = ?auto_416803 ?auto_416809 ) ) ( not ( = ?auto_416803 ?auto_416810 ) ) ( not ( = ?auto_416803 ?auto_416811 ) ) ( not ( = ?auto_416803 ?auto_416812 ) ) ( not ( = ?auto_416803 ?auto_416813 ) ) ( not ( = ?auto_416803 ?auto_416814 ) ) ( not ( = ?auto_416803 ?auto_416815 ) ) ( not ( = ?auto_416803 ?auto_416816 ) ) ( not ( = ?auto_416803 ?auto_416817 ) ) ( not ( = ?auto_416804 ?auto_416805 ) ) ( not ( = ?auto_416804 ?auto_416806 ) ) ( not ( = ?auto_416804 ?auto_416807 ) ) ( not ( = ?auto_416804 ?auto_416808 ) ) ( not ( = ?auto_416804 ?auto_416809 ) ) ( not ( = ?auto_416804 ?auto_416810 ) ) ( not ( = ?auto_416804 ?auto_416811 ) ) ( not ( = ?auto_416804 ?auto_416812 ) ) ( not ( = ?auto_416804 ?auto_416813 ) ) ( not ( = ?auto_416804 ?auto_416814 ) ) ( not ( = ?auto_416804 ?auto_416815 ) ) ( not ( = ?auto_416804 ?auto_416816 ) ) ( not ( = ?auto_416804 ?auto_416817 ) ) ( not ( = ?auto_416805 ?auto_416806 ) ) ( not ( = ?auto_416805 ?auto_416807 ) ) ( not ( = ?auto_416805 ?auto_416808 ) ) ( not ( = ?auto_416805 ?auto_416809 ) ) ( not ( = ?auto_416805 ?auto_416810 ) ) ( not ( = ?auto_416805 ?auto_416811 ) ) ( not ( = ?auto_416805 ?auto_416812 ) ) ( not ( = ?auto_416805 ?auto_416813 ) ) ( not ( = ?auto_416805 ?auto_416814 ) ) ( not ( = ?auto_416805 ?auto_416815 ) ) ( not ( = ?auto_416805 ?auto_416816 ) ) ( not ( = ?auto_416805 ?auto_416817 ) ) ( not ( = ?auto_416806 ?auto_416807 ) ) ( not ( = ?auto_416806 ?auto_416808 ) ) ( not ( = ?auto_416806 ?auto_416809 ) ) ( not ( = ?auto_416806 ?auto_416810 ) ) ( not ( = ?auto_416806 ?auto_416811 ) ) ( not ( = ?auto_416806 ?auto_416812 ) ) ( not ( = ?auto_416806 ?auto_416813 ) ) ( not ( = ?auto_416806 ?auto_416814 ) ) ( not ( = ?auto_416806 ?auto_416815 ) ) ( not ( = ?auto_416806 ?auto_416816 ) ) ( not ( = ?auto_416806 ?auto_416817 ) ) ( not ( = ?auto_416807 ?auto_416808 ) ) ( not ( = ?auto_416807 ?auto_416809 ) ) ( not ( = ?auto_416807 ?auto_416810 ) ) ( not ( = ?auto_416807 ?auto_416811 ) ) ( not ( = ?auto_416807 ?auto_416812 ) ) ( not ( = ?auto_416807 ?auto_416813 ) ) ( not ( = ?auto_416807 ?auto_416814 ) ) ( not ( = ?auto_416807 ?auto_416815 ) ) ( not ( = ?auto_416807 ?auto_416816 ) ) ( not ( = ?auto_416807 ?auto_416817 ) ) ( not ( = ?auto_416808 ?auto_416809 ) ) ( not ( = ?auto_416808 ?auto_416810 ) ) ( not ( = ?auto_416808 ?auto_416811 ) ) ( not ( = ?auto_416808 ?auto_416812 ) ) ( not ( = ?auto_416808 ?auto_416813 ) ) ( not ( = ?auto_416808 ?auto_416814 ) ) ( not ( = ?auto_416808 ?auto_416815 ) ) ( not ( = ?auto_416808 ?auto_416816 ) ) ( not ( = ?auto_416808 ?auto_416817 ) ) ( not ( = ?auto_416809 ?auto_416810 ) ) ( not ( = ?auto_416809 ?auto_416811 ) ) ( not ( = ?auto_416809 ?auto_416812 ) ) ( not ( = ?auto_416809 ?auto_416813 ) ) ( not ( = ?auto_416809 ?auto_416814 ) ) ( not ( = ?auto_416809 ?auto_416815 ) ) ( not ( = ?auto_416809 ?auto_416816 ) ) ( not ( = ?auto_416809 ?auto_416817 ) ) ( not ( = ?auto_416810 ?auto_416811 ) ) ( not ( = ?auto_416810 ?auto_416812 ) ) ( not ( = ?auto_416810 ?auto_416813 ) ) ( not ( = ?auto_416810 ?auto_416814 ) ) ( not ( = ?auto_416810 ?auto_416815 ) ) ( not ( = ?auto_416810 ?auto_416816 ) ) ( not ( = ?auto_416810 ?auto_416817 ) ) ( not ( = ?auto_416811 ?auto_416812 ) ) ( not ( = ?auto_416811 ?auto_416813 ) ) ( not ( = ?auto_416811 ?auto_416814 ) ) ( not ( = ?auto_416811 ?auto_416815 ) ) ( not ( = ?auto_416811 ?auto_416816 ) ) ( not ( = ?auto_416811 ?auto_416817 ) ) ( not ( = ?auto_416812 ?auto_416813 ) ) ( not ( = ?auto_416812 ?auto_416814 ) ) ( not ( = ?auto_416812 ?auto_416815 ) ) ( not ( = ?auto_416812 ?auto_416816 ) ) ( not ( = ?auto_416812 ?auto_416817 ) ) ( not ( = ?auto_416813 ?auto_416814 ) ) ( not ( = ?auto_416813 ?auto_416815 ) ) ( not ( = ?auto_416813 ?auto_416816 ) ) ( not ( = ?auto_416813 ?auto_416817 ) ) ( not ( = ?auto_416814 ?auto_416815 ) ) ( not ( = ?auto_416814 ?auto_416816 ) ) ( not ( = ?auto_416814 ?auto_416817 ) ) ( not ( = ?auto_416815 ?auto_416816 ) ) ( not ( = ?auto_416815 ?auto_416817 ) ) ( not ( = ?auto_416816 ?auto_416817 ) ) ( ON ?auto_416815 ?auto_416816 ) ( ON ?auto_416814 ?auto_416815 ) ( ON ?auto_416813 ?auto_416814 ) ( ON ?auto_416812 ?auto_416813 ) ( ON ?auto_416811 ?auto_416812 ) ( ON ?auto_416810 ?auto_416811 ) ( ON ?auto_416809 ?auto_416810 ) ( ON ?auto_416808 ?auto_416809 ) ( CLEAR ?auto_416806 ) ( ON ?auto_416807 ?auto_416808 ) ( CLEAR ?auto_416807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_416803 ?auto_416804 ?auto_416805 ?auto_416806 ?auto_416807 )
      ( MAKE-14PILE ?auto_416803 ?auto_416804 ?auto_416805 ?auto_416806 ?auto_416807 ?auto_416808 ?auto_416809 ?auto_416810 ?auto_416811 ?auto_416812 ?auto_416813 ?auto_416814 ?auto_416815 ?auto_416816 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416832 - BLOCK
      ?auto_416833 - BLOCK
      ?auto_416834 - BLOCK
      ?auto_416835 - BLOCK
      ?auto_416836 - BLOCK
      ?auto_416837 - BLOCK
      ?auto_416838 - BLOCK
      ?auto_416839 - BLOCK
      ?auto_416840 - BLOCK
      ?auto_416841 - BLOCK
      ?auto_416842 - BLOCK
      ?auto_416843 - BLOCK
      ?auto_416844 - BLOCK
      ?auto_416845 - BLOCK
    )
    :vars
    (
      ?auto_416846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416845 ?auto_416846 ) ( ON-TABLE ?auto_416832 ) ( ON ?auto_416833 ?auto_416832 ) ( ON ?auto_416834 ?auto_416833 ) ( not ( = ?auto_416832 ?auto_416833 ) ) ( not ( = ?auto_416832 ?auto_416834 ) ) ( not ( = ?auto_416832 ?auto_416835 ) ) ( not ( = ?auto_416832 ?auto_416836 ) ) ( not ( = ?auto_416832 ?auto_416837 ) ) ( not ( = ?auto_416832 ?auto_416838 ) ) ( not ( = ?auto_416832 ?auto_416839 ) ) ( not ( = ?auto_416832 ?auto_416840 ) ) ( not ( = ?auto_416832 ?auto_416841 ) ) ( not ( = ?auto_416832 ?auto_416842 ) ) ( not ( = ?auto_416832 ?auto_416843 ) ) ( not ( = ?auto_416832 ?auto_416844 ) ) ( not ( = ?auto_416832 ?auto_416845 ) ) ( not ( = ?auto_416832 ?auto_416846 ) ) ( not ( = ?auto_416833 ?auto_416834 ) ) ( not ( = ?auto_416833 ?auto_416835 ) ) ( not ( = ?auto_416833 ?auto_416836 ) ) ( not ( = ?auto_416833 ?auto_416837 ) ) ( not ( = ?auto_416833 ?auto_416838 ) ) ( not ( = ?auto_416833 ?auto_416839 ) ) ( not ( = ?auto_416833 ?auto_416840 ) ) ( not ( = ?auto_416833 ?auto_416841 ) ) ( not ( = ?auto_416833 ?auto_416842 ) ) ( not ( = ?auto_416833 ?auto_416843 ) ) ( not ( = ?auto_416833 ?auto_416844 ) ) ( not ( = ?auto_416833 ?auto_416845 ) ) ( not ( = ?auto_416833 ?auto_416846 ) ) ( not ( = ?auto_416834 ?auto_416835 ) ) ( not ( = ?auto_416834 ?auto_416836 ) ) ( not ( = ?auto_416834 ?auto_416837 ) ) ( not ( = ?auto_416834 ?auto_416838 ) ) ( not ( = ?auto_416834 ?auto_416839 ) ) ( not ( = ?auto_416834 ?auto_416840 ) ) ( not ( = ?auto_416834 ?auto_416841 ) ) ( not ( = ?auto_416834 ?auto_416842 ) ) ( not ( = ?auto_416834 ?auto_416843 ) ) ( not ( = ?auto_416834 ?auto_416844 ) ) ( not ( = ?auto_416834 ?auto_416845 ) ) ( not ( = ?auto_416834 ?auto_416846 ) ) ( not ( = ?auto_416835 ?auto_416836 ) ) ( not ( = ?auto_416835 ?auto_416837 ) ) ( not ( = ?auto_416835 ?auto_416838 ) ) ( not ( = ?auto_416835 ?auto_416839 ) ) ( not ( = ?auto_416835 ?auto_416840 ) ) ( not ( = ?auto_416835 ?auto_416841 ) ) ( not ( = ?auto_416835 ?auto_416842 ) ) ( not ( = ?auto_416835 ?auto_416843 ) ) ( not ( = ?auto_416835 ?auto_416844 ) ) ( not ( = ?auto_416835 ?auto_416845 ) ) ( not ( = ?auto_416835 ?auto_416846 ) ) ( not ( = ?auto_416836 ?auto_416837 ) ) ( not ( = ?auto_416836 ?auto_416838 ) ) ( not ( = ?auto_416836 ?auto_416839 ) ) ( not ( = ?auto_416836 ?auto_416840 ) ) ( not ( = ?auto_416836 ?auto_416841 ) ) ( not ( = ?auto_416836 ?auto_416842 ) ) ( not ( = ?auto_416836 ?auto_416843 ) ) ( not ( = ?auto_416836 ?auto_416844 ) ) ( not ( = ?auto_416836 ?auto_416845 ) ) ( not ( = ?auto_416836 ?auto_416846 ) ) ( not ( = ?auto_416837 ?auto_416838 ) ) ( not ( = ?auto_416837 ?auto_416839 ) ) ( not ( = ?auto_416837 ?auto_416840 ) ) ( not ( = ?auto_416837 ?auto_416841 ) ) ( not ( = ?auto_416837 ?auto_416842 ) ) ( not ( = ?auto_416837 ?auto_416843 ) ) ( not ( = ?auto_416837 ?auto_416844 ) ) ( not ( = ?auto_416837 ?auto_416845 ) ) ( not ( = ?auto_416837 ?auto_416846 ) ) ( not ( = ?auto_416838 ?auto_416839 ) ) ( not ( = ?auto_416838 ?auto_416840 ) ) ( not ( = ?auto_416838 ?auto_416841 ) ) ( not ( = ?auto_416838 ?auto_416842 ) ) ( not ( = ?auto_416838 ?auto_416843 ) ) ( not ( = ?auto_416838 ?auto_416844 ) ) ( not ( = ?auto_416838 ?auto_416845 ) ) ( not ( = ?auto_416838 ?auto_416846 ) ) ( not ( = ?auto_416839 ?auto_416840 ) ) ( not ( = ?auto_416839 ?auto_416841 ) ) ( not ( = ?auto_416839 ?auto_416842 ) ) ( not ( = ?auto_416839 ?auto_416843 ) ) ( not ( = ?auto_416839 ?auto_416844 ) ) ( not ( = ?auto_416839 ?auto_416845 ) ) ( not ( = ?auto_416839 ?auto_416846 ) ) ( not ( = ?auto_416840 ?auto_416841 ) ) ( not ( = ?auto_416840 ?auto_416842 ) ) ( not ( = ?auto_416840 ?auto_416843 ) ) ( not ( = ?auto_416840 ?auto_416844 ) ) ( not ( = ?auto_416840 ?auto_416845 ) ) ( not ( = ?auto_416840 ?auto_416846 ) ) ( not ( = ?auto_416841 ?auto_416842 ) ) ( not ( = ?auto_416841 ?auto_416843 ) ) ( not ( = ?auto_416841 ?auto_416844 ) ) ( not ( = ?auto_416841 ?auto_416845 ) ) ( not ( = ?auto_416841 ?auto_416846 ) ) ( not ( = ?auto_416842 ?auto_416843 ) ) ( not ( = ?auto_416842 ?auto_416844 ) ) ( not ( = ?auto_416842 ?auto_416845 ) ) ( not ( = ?auto_416842 ?auto_416846 ) ) ( not ( = ?auto_416843 ?auto_416844 ) ) ( not ( = ?auto_416843 ?auto_416845 ) ) ( not ( = ?auto_416843 ?auto_416846 ) ) ( not ( = ?auto_416844 ?auto_416845 ) ) ( not ( = ?auto_416844 ?auto_416846 ) ) ( not ( = ?auto_416845 ?auto_416846 ) ) ( ON ?auto_416844 ?auto_416845 ) ( ON ?auto_416843 ?auto_416844 ) ( ON ?auto_416842 ?auto_416843 ) ( ON ?auto_416841 ?auto_416842 ) ( ON ?auto_416840 ?auto_416841 ) ( ON ?auto_416839 ?auto_416840 ) ( ON ?auto_416838 ?auto_416839 ) ( ON ?auto_416837 ?auto_416838 ) ( ON ?auto_416836 ?auto_416837 ) ( CLEAR ?auto_416834 ) ( ON ?auto_416835 ?auto_416836 ) ( CLEAR ?auto_416835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_416832 ?auto_416833 ?auto_416834 ?auto_416835 )
      ( MAKE-14PILE ?auto_416832 ?auto_416833 ?auto_416834 ?auto_416835 ?auto_416836 ?auto_416837 ?auto_416838 ?auto_416839 ?auto_416840 ?auto_416841 ?auto_416842 ?auto_416843 ?auto_416844 ?auto_416845 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416861 - BLOCK
      ?auto_416862 - BLOCK
      ?auto_416863 - BLOCK
      ?auto_416864 - BLOCK
      ?auto_416865 - BLOCK
      ?auto_416866 - BLOCK
      ?auto_416867 - BLOCK
      ?auto_416868 - BLOCK
      ?auto_416869 - BLOCK
      ?auto_416870 - BLOCK
      ?auto_416871 - BLOCK
      ?auto_416872 - BLOCK
      ?auto_416873 - BLOCK
      ?auto_416874 - BLOCK
    )
    :vars
    (
      ?auto_416875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416874 ?auto_416875 ) ( ON-TABLE ?auto_416861 ) ( ON ?auto_416862 ?auto_416861 ) ( ON ?auto_416863 ?auto_416862 ) ( not ( = ?auto_416861 ?auto_416862 ) ) ( not ( = ?auto_416861 ?auto_416863 ) ) ( not ( = ?auto_416861 ?auto_416864 ) ) ( not ( = ?auto_416861 ?auto_416865 ) ) ( not ( = ?auto_416861 ?auto_416866 ) ) ( not ( = ?auto_416861 ?auto_416867 ) ) ( not ( = ?auto_416861 ?auto_416868 ) ) ( not ( = ?auto_416861 ?auto_416869 ) ) ( not ( = ?auto_416861 ?auto_416870 ) ) ( not ( = ?auto_416861 ?auto_416871 ) ) ( not ( = ?auto_416861 ?auto_416872 ) ) ( not ( = ?auto_416861 ?auto_416873 ) ) ( not ( = ?auto_416861 ?auto_416874 ) ) ( not ( = ?auto_416861 ?auto_416875 ) ) ( not ( = ?auto_416862 ?auto_416863 ) ) ( not ( = ?auto_416862 ?auto_416864 ) ) ( not ( = ?auto_416862 ?auto_416865 ) ) ( not ( = ?auto_416862 ?auto_416866 ) ) ( not ( = ?auto_416862 ?auto_416867 ) ) ( not ( = ?auto_416862 ?auto_416868 ) ) ( not ( = ?auto_416862 ?auto_416869 ) ) ( not ( = ?auto_416862 ?auto_416870 ) ) ( not ( = ?auto_416862 ?auto_416871 ) ) ( not ( = ?auto_416862 ?auto_416872 ) ) ( not ( = ?auto_416862 ?auto_416873 ) ) ( not ( = ?auto_416862 ?auto_416874 ) ) ( not ( = ?auto_416862 ?auto_416875 ) ) ( not ( = ?auto_416863 ?auto_416864 ) ) ( not ( = ?auto_416863 ?auto_416865 ) ) ( not ( = ?auto_416863 ?auto_416866 ) ) ( not ( = ?auto_416863 ?auto_416867 ) ) ( not ( = ?auto_416863 ?auto_416868 ) ) ( not ( = ?auto_416863 ?auto_416869 ) ) ( not ( = ?auto_416863 ?auto_416870 ) ) ( not ( = ?auto_416863 ?auto_416871 ) ) ( not ( = ?auto_416863 ?auto_416872 ) ) ( not ( = ?auto_416863 ?auto_416873 ) ) ( not ( = ?auto_416863 ?auto_416874 ) ) ( not ( = ?auto_416863 ?auto_416875 ) ) ( not ( = ?auto_416864 ?auto_416865 ) ) ( not ( = ?auto_416864 ?auto_416866 ) ) ( not ( = ?auto_416864 ?auto_416867 ) ) ( not ( = ?auto_416864 ?auto_416868 ) ) ( not ( = ?auto_416864 ?auto_416869 ) ) ( not ( = ?auto_416864 ?auto_416870 ) ) ( not ( = ?auto_416864 ?auto_416871 ) ) ( not ( = ?auto_416864 ?auto_416872 ) ) ( not ( = ?auto_416864 ?auto_416873 ) ) ( not ( = ?auto_416864 ?auto_416874 ) ) ( not ( = ?auto_416864 ?auto_416875 ) ) ( not ( = ?auto_416865 ?auto_416866 ) ) ( not ( = ?auto_416865 ?auto_416867 ) ) ( not ( = ?auto_416865 ?auto_416868 ) ) ( not ( = ?auto_416865 ?auto_416869 ) ) ( not ( = ?auto_416865 ?auto_416870 ) ) ( not ( = ?auto_416865 ?auto_416871 ) ) ( not ( = ?auto_416865 ?auto_416872 ) ) ( not ( = ?auto_416865 ?auto_416873 ) ) ( not ( = ?auto_416865 ?auto_416874 ) ) ( not ( = ?auto_416865 ?auto_416875 ) ) ( not ( = ?auto_416866 ?auto_416867 ) ) ( not ( = ?auto_416866 ?auto_416868 ) ) ( not ( = ?auto_416866 ?auto_416869 ) ) ( not ( = ?auto_416866 ?auto_416870 ) ) ( not ( = ?auto_416866 ?auto_416871 ) ) ( not ( = ?auto_416866 ?auto_416872 ) ) ( not ( = ?auto_416866 ?auto_416873 ) ) ( not ( = ?auto_416866 ?auto_416874 ) ) ( not ( = ?auto_416866 ?auto_416875 ) ) ( not ( = ?auto_416867 ?auto_416868 ) ) ( not ( = ?auto_416867 ?auto_416869 ) ) ( not ( = ?auto_416867 ?auto_416870 ) ) ( not ( = ?auto_416867 ?auto_416871 ) ) ( not ( = ?auto_416867 ?auto_416872 ) ) ( not ( = ?auto_416867 ?auto_416873 ) ) ( not ( = ?auto_416867 ?auto_416874 ) ) ( not ( = ?auto_416867 ?auto_416875 ) ) ( not ( = ?auto_416868 ?auto_416869 ) ) ( not ( = ?auto_416868 ?auto_416870 ) ) ( not ( = ?auto_416868 ?auto_416871 ) ) ( not ( = ?auto_416868 ?auto_416872 ) ) ( not ( = ?auto_416868 ?auto_416873 ) ) ( not ( = ?auto_416868 ?auto_416874 ) ) ( not ( = ?auto_416868 ?auto_416875 ) ) ( not ( = ?auto_416869 ?auto_416870 ) ) ( not ( = ?auto_416869 ?auto_416871 ) ) ( not ( = ?auto_416869 ?auto_416872 ) ) ( not ( = ?auto_416869 ?auto_416873 ) ) ( not ( = ?auto_416869 ?auto_416874 ) ) ( not ( = ?auto_416869 ?auto_416875 ) ) ( not ( = ?auto_416870 ?auto_416871 ) ) ( not ( = ?auto_416870 ?auto_416872 ) ) ( not ( = ?auto_416870 ?auto_416873 ) ) ( not ( = ?auto_416870 ?auto_416874 ) ) ( not ( = ?auto_416870 ?auto_416875 ) ) ( not ( = ?auto_416871 ?auto_416872 ) ) ( not ( = ?auto_416871 ?auto_416873 ) ) ( not ( = ?auto_416871 ?auto_416874 ) ) ( not ( = ?auto_416871 ?auto_416875 ) ) ( not ( = ?auto_416872 ?auto_416873 ) ) ( not ( = ?auto_416872 ?auto_416874 ) ) ( not ( = ?auto_416872 ?auto_416875 ) ) ( not ( = ?auto_416873 ?auto_416874 ) ) ( not ( = ?auto_416873 ?auto_416875 ) ) ( not ( = ?auto_416874 ?auto_416875 ) ) ( ON ?auto_416873 ?auto_416874 ) ( ON ?auto_416872 ?auto_416873 ) ( ON ?auto_416871 ?auto_416872 ) ( ON ?auto_416870 ?auto_416871 ) ( ON ?auto_416869 ?auto_416870 ) ( ON ?auto_416868 ?auto_416869 ) ( ON ?auto_416867 ?auto_416868 ) ( ON ?auto_416866 ?auto_416867 ) ( ON ?auto_416865 ?auto_416866 ) ( CLEAR ?auto_416863 ) ( ON ?auto_416864 ?auto_416865 ) ( CLEAR ?auto_416864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_416861 ?auto_416862 ?auto_416863 ?auto_416864 )
      ( MAKE-14PILE ?auto_416861 ?auto_416862 ?auto_416863 ?auto_416864 ?auto_416865 ?auto_416866 ?auto_416867 ?auto_416868 ?auto_416869 ?auto_416870 ?auto_416871 ?auto_416872 ?auto_416873 ?auto_416874 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416890 - BLOCK
      ?auto_416891 - BLOCK
      ?auto_416892 - BLOCK
      ?auto_416893 - BLOCK
      ?auto_416894 - BLOCK
      ?auto_416895 - BLOCK
      ?auto_416896 - BLOCK
      ?auto_416897 - BLOCK
      ?auto_416898 - BLOCK
      ?auto_416899 - BLOCK
      ?auto_416900 - BLOCK
      ?auto_416901 - BLOCK
      ?auto_416902 - BLOCK
      ?auto_416903 - BLOCK
    )
    :vars
    (
      ?auto_416904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416903 ?auto_416904 ) ( ON-TABLE ?auto_416890 ) ( ON ?auto_416891 ?auto_416890 ) ( not ( = ?auto_416890 ?auto_416891 ) ) ( not ( = ?auto_416890 ?auto_416892 ) ) ( not ( = ?auto_416890 ?auto_416893 ) ) ( not ( = ?auto_416890 ?auto_416894 ) ) ( not ( = ?auto_416890 ?auto_416895 ) ) ( not ( = ?auto_416890 ?auto_416896 ) ) ( not ( = ?auto_416890 ?auto_416897 ) ) ( not ( = ?auto_416890 ?auto_416898 ) ) ( not ( = ?auto_416890 ?auto_416899 ) ) ( not ( = ?auto_416890 ?auto_416900 ) ) ( not ( = ?auto_416890 ?auto_416901 ) ) ( not ( = ?auto_416890 ?auto_416902 ) ) ( not ( = ?auto_416890 ?auto_416903 ) ) ( not ( = ?auto_416890 ?auto_416904 ) ) ( not ( = ?auto_416891 ?auto_416892 ) ) ( not ( = ?auto_416891 ?auto_416893 ) ) ( not ( = ?auto_416891 ?auto_416894 ) ) ( not ( = ?auto_416891 ?auto_416895 ) ) ( not ( = ?auto_416891 ?auto_416896 ) ) ( not ( = ?auto_416891 ?auto_416897 ) ) ( not ( = ?auto_416891 ?auto_416898 ) ) ( not ( = ?auto_416891 ?auto_416899 ) ) ( not ( = ?auto_416891 ?auto_416900 ) ) ( not ( = ?auto_416891 ?auto_416901 ) ) ( not ( = ?auto_416891 ?auto_416902 ) ) ( not ( = ?auto_416891 ?auto_416903 ) ) ( not ( = ?auto_416891 ?auto_416904 ) ) ( not ( = ?auto_416892 ?auto_416893 ) ) ( not ( = ?auto_416892 ?auto_416894 ) ) ( not ( = ?auto_416892 ?auto_416895 ) ) ( not ( = ?auto_416892 ?auto_416896 ) ) ( not ( = ?auto_416892 ?auto_416897 ) ) ( not ( = ?auto_416892 ?auto_416898 ) ) ( not ( = ?auto_416892 ?auto_416899 ) ) ( not ( = ?auto_416892 ?auto_416900 ) ) ( not ( = ?auto_416892 ?auto_416901 ) ) ( not ( = ?auto_416892 ?auto_416902 ) ) ( not ( = ?auto_416892 ?auto_416903 ) ) ( not ( = ?auto_416892 ?auto_416904 ) ) ( not ( = ?auto_416893 ?auto_416894 ) ) ( not ( = ?auto_416893 ?auto_416895 ) ) ( not ( = ?auto_416893 ?auto_416896 ) ) ( not ( = ?auto_416893 ?auto_416897 ) ) ( not ( = ?auto_416893 ?auto_416898 ) ) ( not ( = ?auto_416893 ?auto_416899 ) ) ( not ( = ?auto_416893 ?auto_416900 ) ) ( not ( = ?auto_416893 ?auto_416901 ) ) ( not ( = ?auto_416893 ?auto_416902 ) ) ( not ( = ?auto_416893 ?auto_416903 ) ) ( not ( = ?auto_416893 ?auto_416904 ) ) ( not ( = ?auto_416894 ?auto_416895 ) ) ( not ( = ?auto_416894 ?auto_416896 ) ) ( not ( = ?auto_416894 ?auto_416897 ) ) ( not ( = ?auto_416894 ?auto_416898 ) ) ( not ( = ?auto_416894 ?auto_416899 ) ) ( not ( = ?auto_416894 ?auto_416900 ) ) ( not ( = ?auto_416894 ?auto_416901 ) ) ( not ( = ?auto_416894 ?auto_416902 ) ) ( not ( = ?auto_416894 ?auto_416903 ) ) ( not ( = ?auto_416894 ?auto_416904 ) ) ( not ( = ?auto_416895 ?auto_416896 ) ) ( not ( = ?auto_416895 ?auto_416897 ) ) ( not ( = ?auto_416895 ?auto_416898 ) ) ( not ( = ?auto_416895 ?auto_416899 ) ) ( not ( = ?auto_416895 ?auto_416900 ) ) ( not ( = ?auto_416895 ?auto_416901 ) ) ( not ( = ?auto_416895 ?auto_416902 ) ) ( not ( = ?auto_416895 ?auto_416903 ) ) ( not ( = ?auto_416895 ?auto_416904 ) ) ( not ( = ?auto_416896 ?auto_416897 ) ) ( not ( = ?auto_416896 ?auto_416898 ) ) ( not ( = ?auto_416896 ?auto_416899 ) ) ( not ( = ?auto_416896 ?auto_416900 ) ) ( not ( = ?auto_416896 ?auto_416901 ) ) ( not ( = ?auto_416896 ?auto_416902 ) ) ( not ( = ?auto_416896 ?auto_416903 ) ) ( not ( = ?auto_416896 ?auto_416904 ) ) ( not ( = ?auto_416897 ?auto_416898 ) ) ( not ( = ?auto_416897 ?auto_416899 ) ) ( not ( = ?auto_416897 ?auto_416900 ) ) ( not ( = ?auto_416897 ?auto_416901 ) ) ( not ( = ?auto_416897 ?auto_416902 ) ) ( not ( = ?auto_416897 ?auto_416903 ) ) ( not ( = ?auto_416897 ?auto_416904 ) ) ( not ( = ?auto_416898 ?auto_416899 ) ) ( not ( = ?auto_416898 ?auto_416900 ) ) ( not ( = ?auto_416898 ?auto_416901 ) ) ( not ( = ?auto_416898 ?auto_416902 ) ) ( not ( = ?auto_416898 ?auto_416903 ) ) ( not ( = ?auto_416898 ?auto_416904 ) ) ( not ( = ?auto_416899 ?auto_416900 ) ) ( not ( = ?auto_416899 ?auto_416901 ) ) ( not ( = ?auto_416899 ?auto_416902 ) ) ( not ( = ?auto_416899 ?auto_416903 ) ) ( not ( = ?auto_416899 ?auto_416904 ) ) ( not ( = ?auto_416900 ?auto_416901 ) ) ( not ( = ?auto_416900 ?auto_416902 ) ) ( not ( = ?auto_416900 ?auto_416903 ) ) ( not ( = ?auto_416900 ?auto_416904 ) ) ( not ( = ?auto_416901 ?auto_416902 ) ) ( not ( = ?auto_416901 ?auto_416903 ) ) ( not ( = ?auto_416901 ?auto_416904 ) ) ( not ( = ?auto_416902 ?auto_416903 ) ) ( not ( = ?auto_416902 ?auto_416904 ) ) ( not ( = ?auto_416903 ?auto_416904 ) ) ( ON ?auto_416902 ?auto_416903 ) ( ON ?auto_416901 ?auto_416902 ) ( ON ?auto_416900 ?auto_416901 ) ( ON ?auto_416899 ?auto_416900 ) ( ON ?auto_416898 ?auto_416899 ) ( ON ?auto_416897 ?auto_416898 ) ( ON ?auto_416896 ?auto_416897 ) ( ON ?auto_416895 ?auto_416896 ) ( ON ?auto_416894 ?auto_416895 ) ( ON ?auto_416893 ?auto_416894 ) ( CLEAR ?auto_416891 ) ( ON ?auto_416892 ?auto_416893 ) ( CLEAR ?auto_416892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_416890 ?auto_416891 ?auto_416892 )
      ( MAKE-14PILE ?auto_416890 ?auto_416891 ?auto_416892 ?auto_416893 ?auto_416894 ?auto_416895 ?auto_416896 ?auto_416897 ?auto_416898 ?auto_416899 ?auto_416900 ?auto_416901 ?auto_416902 ?auto_416903 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416919 - BLOCK
      ?auto_416920 - BLOCK
      ?auto_416921 - BLOCK
      ?auto_416922 - BLOCK
      ?auto_416923 - BLOCK
      ?auto_416924 - BLOCK
      ?auto_416925 - BLOCK
      ?auto_416926 - BLOCK
      ?auto_416927 - BLOCK
      ?auto_416928 - BLOCK
      ?auto_416929 - BLOCK
      ?auto_416930 - BLOCK
      ?auto_416931 - BLOCK
      ?auto_416932 - BLOCK
    )
    :vars
    (
      ?auto_416933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416932 ?auto_416933 ) ( ON-TABLE ?auto_416919 ) ( ON ?auto_416920 ?auto_416919 ) ( not ( = ?auto_416919 ?auto_416920 ) ) ( not ( = ?auto_416919 ?auto_416921 ) ) ( not ( = ?auto_416919 ?auto_416922 ) ) ( not ( = ?auto_416919 ?auto_416923 ) ) ( not ( = ?auto_416919 ?auto_416924 ) ) ( not ( = ?auto_416919 ?auto_416925 ) ) ( not ( = ?auto_416919 ?auto_416926 ) ) ( not ( = ?auto_416919 ?auto_416927 ) ) ( not ( = ?auto_416919 ?auto_416928 ) ) ( not ( = ?auto_416919 ?auto_416929 ) ) ( not ( = ?auto_416919 ?auto_416930 ) ) ( not ( = ?auto_416919 ?auto_416931 ) ) ( not ( = ?auto_416919 ?auto_416932 ) ) ( not ( = ?auto_416919 ?auto_416933 ) ) ( not ( = ?auto_416920 ?auto_416921 ) ) ( not ( = ?auto_416920 ?auto_416922 ) ) ( not ( = ?auto_416920 ?auto_416923 ) ) ( not ( = ?auto_416920 ?auto_416924 ) ) ( not ( = ?auto_416920 ?auto_416925 ) ) ( not ( = ?auto_416920 ?auto_416926 ) ) ( not ( = ?auto_416920 ?auto_416927 ) ) ( not ( = ?auto_416920 ?auto_416928 ) ) ( not ( = ?auto_416920 ?auto_416929 ) ) ( not ( = ?auto_416920 ?auto_416930 ) ) ( not ( = ?auto_416920 ?auto_416931 ) ) ( not ( = ?auto_416920 ?auto_416932 ) ) ( not ( = ?auto_416920 ?auto_416933 ) ) ( not ( = ?auto_416921 ?auto_416922 ) ) ( not ( = ?auto_416921 ?auto_416923 ) ) ( not ( = ?auto_416921 ?auto_416924 ) ) ( not ( = ?auto_416921 ?auto_416925 ) ) ( not ( = ?auto_416921 ?auto_416926 ) ) ( not ( = ?auto_416921 ?auto_416927 ) ) ( not ( = ?auto_416921 ?auto_416928 ) ) ( not ( = ?auto_416921 ?auto_416929 ) ) ( not ( = ?auto_416921 ?auto_416930 ) ) ( not ( = ?auto_416921 ?auto_416931 ) ) ( not ( = ?auto_416921 ?auto_416932 ) ) ( not ( = ?auto_416921 ?auto_416933 ) ) ( not ( = ?auto_416922 ?auto_416923 ) ) ( not ( = ?auto_416922 ?auto_416924 ) ) ( not ( = ?auto_416922 ?auto_416925 ) ) ( not ( = ?auto_416922 ?auto_416926 ) ) ( not ( = ?auto_416922 ?auto_416927 ) ) ( not ( = ?auto_416922 ?auto_416928 ) ) ( not ( = ?auto_416922 ?auto_416929 ) ) ( not ( = ?auto_416922 ?auto_416930 ) ) ( not ( = ?auto_416922 ?auto_416931 ) ) ( not ( = ?auto_416922 ?auto_416932 ) ) ( not ( = ?auto_416922 ?auto_416933 ) ) ( not ( = ?auto_416923 ?auto_416924 ) ) ( not ( = ?auto_416923 ?auto_416925 ) ) ( not ( = ?auto_416923 ?auto_416926 ) ) ( not ( = ?auto_416923 ?auto_416927 ) ) ( not ( = ?auto_416923 ?auto_416928 ) ) ( not ( = ?auto_416923 ?auto_416929 ) ) ( not ( = ?auto_416923 ?auto_416930 ) ) ( not ( = ?auto_416923 ?auto_416931 ) ) ( not ( = ?auto_416923 ?auto_416932 ) ) ( not ( = ?auto_416923 ?auto_416933 ) ) ( not ( = ?auto_416924 ?auto_416925 ) ) ( not ( = ?auto_416924 ?auto_416926 ) ) ( not ( = ?auto_416924 ?auto_416927 ) ) ( not ( = ?auto_416924 ?auto_416928 ) ) ( not ( = ?auto_416924 ?auto_416929 ) ) ( not ( = ?auto_416924 ?auto_416930 ) ) ( not ( = ?auto_416924 ?auto_416931 ) ) ( not ( = ?auto_416924 ?auto_416932 ) ) ( not ( = ?auto_416924 ?auto_416933 ) ) ( not ( = ?auto_416925 ?auto_416926 ) ) ( not ( = ?auto_416925 ?auto_416927 ) ) ( not ( = ?auto_416925 ?auto_416928 ) ) ( not ( = ?auto_416925 ?auto_416929 ) ) ( not ( = ?auto_416925 ?auto_416930 ) ) ( not ( = ?auto_416925 ?auto_416931 ) ) ( not ( = ?auto_416925 ?auto_416932 ) ) ( not ( = ?auto_416925 ?auto_416933 ) ) ( not ( = ?auto_416926 ?auto_416927 ) ) ( not ( = ?auto_416926 ?auto_416928 ) ) ( not ( = ?auto_416926 ?auto_416929 ) ) ( not ( = ?auto_416926 ?auto_416930 ) ) ( not ( = ?auto_416926 ?auto_416931 ) ) ( not ( = ?auto_416926 ?auto_416932 ) ) ( not ( = ?auto_416926 ?auto_416933 ) ) ( not ( = ?auto_416927 ?auto_416928 ) ) ( not ( = ?auto_416927 ?auto_416929 ) ) ( not ( = ?auto_416927 ?auto_416930 ) ) ( not ( = ?auto_416927 ?auto_416931 ) ) ( not ( = ?auto_416927 ?auto_416932 ) ) ( not ( = ?auto_416927 ?auto_416933 ) ) ( not ( = ?auto_416928 ?auto_416929 ) ) ( not ( = ?auto_416928 ?auto_416930 ) ) ( not ( = ?auto_416928 ?auto_416931 ) ) ( not ( = ?auto_416928 ?auto_416932 ) ) ( not ( = ?auto_416928 ?auto_416933 ) ) ( not ( = ?auto_416929 ?auto_416930 ) ) ( not ( = ?auto_416929 ?auto_416931 ) ) ( not ( = ?auto_416929 ?auto_416932 ) ) ( not ( = ?auto_416929 ?auto_416933 ) ) ( not ( = ?auto_416930 ?auto_416931 ) ) ( not ( = ?auto_416930 ?auto_416932 ) ) ( not ( = ?auto_416930 ?auto_416933 ) ) ( not ( = ?auto_416931 ?auto_416932 ) ) ( not ( = ?auto_416931 ?auto_416933 ) ) ( not ( = ?auto_416932 ?auto_416933 ) ) ( ON ?auto_416931 ?auto_416932 ) ( ON ?auto_416930 ?auto_416931 ) ( ON ?auto_416929 ?auto_416930 ) ( ON ?auto_416928 ?auto_416929 ) ( ON ?auto_416927 ?auto_416928 ) ( ON ?auto_416926 ?auto_416927 ) ( ON ?auto_416925 ?auto_416926 ) ( ON ?auto_416924 ?auto_416925 ) ( ON ?auto_416923 ?auto_416924 ) ( ON ?auto_416922 ?auto_416923 ) ( CLEAR ?auto_416920 ) ( ON ?auto_416921 ?auto_416922 ) ( CLEAR ?auto_416921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_416919 ?auto_416920 ?auto_416921 )
      ( MAKE-14PILE ?auto_416919 ?auto_416920 ?auto_416921 ?auto_416922 ?auto_416923 ?auto_416924 ?auto_416925 ?auto_416926 ?auto_416927 ?auto_416928 ?auto_416929 ?auto_416930 ?auto_416931 ?auto_416932 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416948 - BLOCK
      ?auto_416949 - BLOCK
      ?auto_416950 - BLOCK
      ?auto_416951 - BLOCK
      ?auto_416952 - BLOCK
      ?auto_416953 - BLOCK
      ?auto_416954 - BLOCK
      ?auto_416955 - BLOCK
      ?auto_416956 - BLOCK
      ?auto_416957 - BLOCK
      ?auto_416958 - BLOCK
      ?auto_416959 - BLOCK
      ?auto_416960 - BLOCK
      ?auto_416961 - BLOCK
    )
    :vars
    (
      ?auto_416962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416961 ?auto_416962 ) ( ON-TABLE ?auto_416948 ) ( not ( = ?auto_416948 ?auto_416949 ) ) ( not ( = ?auto_416948 ?auto_416950 ) ) ( not ( = ?auto_416948 ?auto_416951 ) ) ( not ( = ?auto_416948 ?auto_416952 ) ) ( not ( = ?auto_416948 ?auto_416953 ) ) ( not ( = ?auto_416948 ?auto_416954 ) ) ( not ( = ?auto_416948 ?auto_416955 ) ) ( not ( = ?auto_416948 ?auto_416956 ) ) ( not ( = ?auto_416948 ?auto_416957 ) ) ( not ( = ?auto_416948 ?auto_416958 ) ) ( not ( = ?auto_416948 ?auto_416959 ) ) ( not ( = ?auto_416948 ?auto_416960 ) ) ( not ( = ?auto_416948 ?auto_416961 ) ) ( not ( = ?auto_416948 ?auto_416962 ) ) ( not ( = ?auto_416949 ?auto_416950 ) ) ( not ( = ?auto_416949 ?auto_416951 ) ) ( not ( = ?auto_416949 ?auto_416952 ) ) ( not ( = ?auto_416949 ?auto_416953 ) ) ( not ( = ?auto_416949 ?auto_416954 ) ) ( not ( = ?auto_416949 ?auto_416955 ) ) ( not ( = ?auto_416949 ?auto_416956 ) ) ( not ( = ?auto_416949 ?auto_416957 ) ) ( not ( = ?auto_416949 ?auto_416958 ) ) ( not ( = ?auto_416949 ?auto_416959 ) ) ( not ( = ?auto_416949 ?auto_416960 ) ) ( not ( = ?auto_416949 ?auto_416961 ) ) ( not ( = ?auto_416949 ?auto_416962 ) ) ( not ( = ?auto_416950 ?auto_416951 ) ) ( not ( = ?auto_416950 ?auto_416952 ) ) ( not ( = ?auto_416950 ?auto_416953 ) ) ( not ( = ?auto_416950 ?auto_416954 ) ) ( not ( = ?auto_416950 ?auto_416955 ) ) ( not ( = ?auto_416950 ?auto_416956 ) ) ( not ( = ?auto_416950 ?auto_416957 ) ) ( not ( = ?auto_416950 ?auto_416958 ) ) ( not ( = ?auto_416950 ?auto_416959 ) ) ( not ( = ?auto_416950 ?auto_416960 ) ) ( not ( = ?auto_416950 ?auto_416961 ) ) ( not ( = ?auto_416950 ?auto_416962 ) ) ( not ( = ?auto_416951 ?auto_416952 ) ) ( not ( = ?auto_416951 ?auto_416953 ) ) ( not ( = ?auto_416951 ?auto_416954 ) ) ( not ( = ?auto_416951 ?auto_416955 ) ) ( not ( = ?auto_416951 ?auto_416956 ) ) ( not ( = ?auto_416951 ?auto_416957 ) ) ( not ( = ?auto_416951 ?auto_416958 ) ) ( not ( = ?auto_416951 ?auto_416959 ) ) ( not ( = ?auto_416951 ?auto_416960 ) ) ( not ( = ?auto_416951 ?auto_416961 ) ) ( not ( = ?auto_416951 ?auto_416962 ) ) ( not ( = ?auto_416952 ?auto_416953 ) ) ( not ( = ?auto_416952 ?auto_416954 ) ) ( not ( = ?auto_416952 ?auto_416955 ) ) ( not ( = ?auto_416952 ?auto_416956 ) ) ( not ( = ?auto_416952 ?auto_416957 ) ) ( not ( = ?auto_416952 ?auto_416958 ) ) ( not ( = ?auto_416952 ?auto_416959 ) ) ( not ( = ?auto_416952 ?auto_416960 ) ) ( not ( = ?auto_416952 ?auto_416961 ) ) ( not ( = ?auto_416952 ?auto_416962 ) ) ( not ( = ?auto_416953 ?auto_416954 ) ) ( not ( = ?auto_416953 ?auto_416955 ) ) ( not ( = ?auto_416953 ?auto_416956 ) ) ( not ( = ?auto_416953 ?auto_416957 ) ) ( not ( = ?auto_416953 ?auto_416958 ) ) ( not ( = ?auto_416953 ?auto_416959 ) ) ( not ( = ?auto_416953 ?auto_416960 ) ) ( not ( = ?auto_416953 ?auto_416961 ) ) ( not ( = ?auto_416953 ?auto_416962 ) ) ( not ( = ?auto_416954 ?auto_416955 ) ) ( not ( = ?auto_416954 ?auto_416956 ) ) ( not ( = ?auto_416954 ?auto_416957 ) ) ( not ( = ?auto_416954 ?auto_416958 ) ) ( not ( = ?auto_416954 ?auto_416959 ) ) ( not ( = ?auto_416954 ?auto_416960 ) ) ( not ( = ?auto_416954 ?auto_416961 ) ) ( not ( = ?auto_416954 ?auto_416962 ) ) ( not ( = ?auto_416955 ?auto_416956 ) ) ( not ( = ?auto_416955 ?auto_416957 ) ) ( not ( = ?auto_416955 ?auto_416958 ) ) ( not ( = ?auto_416955 ?auto_416959 ) ) ( not ( = ?auto_416955 ?auto_416960 ) ) ( not ( = ?auto_416955 ?auto_416961 ) ) ( not ( = ?auto_416955 ?auto_416962 ) ) ( not ( = ?auto_416956 ?auto_416957 ) ) ( not ( = ?auto_416956 ?auto_416958 ) ) ( not ( = ?auto_416956 ?auto_416959 ) ) ( not ( = ?auto_416956 ?auto_416960 ) ) ( not ( = ?auto_416956 ?auto_416961 ) ) ( not ( = ?auto_416956 ?auto_416962 ) ) ( not ( = ?auto_416957 ?auto_416958 ) ) ( not ( = ?auto_416957 ?auto_416959 ) ) ( not ( = ?auto_416957 ?auto_416960 ) ) ( not ( = ?auto_416957 ?auto_416961 ) ) ( not ( = ?auto_416957 ?auto_416962 ) ) ( not ( = ?auto_416958 ?auto_416959 ) ) ( not ( = ?auto_416958 ?auto_416960 ) ) ( not ( = ?auto_416958 ?auto_416961 ) ) ( not ( = ?auto_416958 ?auto_416962 ) ) ( not ( = ?auto_416959 ?auto_416960 ) ) ( not ( = ?auto_416959 ?auto_416961 ) ) ( not ( = ?auto_416959 ?auto_416962 ) ) ( not ( = ?auto_416960 ?auto_416961 ) ) ( not ( = ?auto_416960 ?auto_416962 ) ) ( not ( = ?auto_416961 ?auto_416962 ) ) ( ON ?auto_416960 ?auto_416961 ) ( ON ?auto_416959 ?auto_416960 ) ( ON ?auto_416958 ?auto_416959 ) ( ON ?auto_416957 ?auto_416958 ) ( ON ?auto_416956 ?auto_416957 ) ( ON ?auto_416955 ?auto_416956 ) ( ON ?auto_416954 ?auto_416955 ) ( ON ?auto_416953 ?auto_416954 ) ( ON ?auto_416952 ?auto_416953 ) ( ON ?auto_416951 ?auto_416952 ) ( ON ?auto_416950 ?auto_416951 ) ( CLEAR ?auto_416948 ) ( ON ?auto_416949 ?auto_416950 ) ( CLEAR ?auto_416949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_416948 ?auto_416949 )
      ( MAKE-14PILE ?auto_416948 ?auto_416949 ?auto_416950 ?auto_416951 ?auto_416952 ?auto_416953 ?auto_416954 ?auto_416955 ?auto_416956 ?auto_416957 ?auto_416958 ?auto_416959 ?auto_416960 ?auto_416961 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_416977 - BLOCK
      ?auto_416978 - BLOCK
      ?auto_416979 - BLOCK
      ?auto_416980 - BLOCK
      ?auto_416981 - BLOCK
      ?auto_416982 - BLOCK
      ?auto_416983 - BLOCK
      ?auto_416984 - BLOCK
      ?auto_416985 - BLOCK
      ?auto_416986 - BLOCK
      ?auto_416987 - BLOCK
      ?auto_416988 - BLOCK
      ?auto_416989 - BLOCK
      ?auto_416990 - BLOCK
    )
    :vars
    (
      ?auto_416991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_416990 ?auto_416991 ) ( ON-TABLE ?auto_416977 ) ( not ( = ?auto_416977 ?auto_416978 ) ) ( not ( = ?auto_416977 ?auto_416979 ) ) ( not ( = ?auto_416977 ?auto_416980 ) ) ( not ( = ?auto_416977 ?auto_416981 ) ) ( not ( = ?auto_416977 ?auto_416982 ) ) ( not ( = ?auto_416977 ?auto_416983 ) ) ( not ( = ?auto_416977 ?auto_416984 ) ) ( not ( = ?auto_416977 ?auto_416985 ) ) ( not ( = ?auto_416977 ?auto_416986 ) ) ( not ( = ?auto_416977 ?auto_416987 ) ) ( not ( = ?auto_416977 ?auto_416988 ) ) ( not ( = ?auto_416977 ?auto_416989 ) ) ( not ( = ?auto_416977 ?auto_416990 ) ) ( not ( = ?auto_416977 ?auto_416991 ) ) ( not ( = ?auto_416978 ?auto_416979 ) ) ( not ( = ?auto_416978 ?auto_416980 ) ) ( not ( = ?auto_416978 ?auto_416981 ) ) ( not ( = ?auto_416978 ?auto_416982 ) ) ( not ( = ?auto_416978 ?auto_416983 ) ) ( not ( = ?auto_416978 ?auto_416984 ) ) ( not ( = ?auto_416978 ?auto_416985 ) ) ( not ( = ?auto_416978 ?auto_416986 ) ) ( not ( = ?auto_416978 ?auto_416987 ) ) ( not ( = ?auto_416978 ?auto_416988 ) ) ( not ( = ?auto_416978 ?auto_416989 ) ) ( not ( = ?auto_416978 ?auto_416990 ) ) ( not ( = ?auto_416978 ?auto_416991 ) ) ( not ( = ?auto_416979 ?auto_416980 ) ) ( not ( = ?auto_416979 ?auto_416981 ) ) ( not ( = ?auto_416979 ?auto_416982 ) ) ( not ( = ?auto_416979 ?auto_416983 ) ) ( not ( = ?auto_416979 ?auto_416984 ) ) ( not ( = ?auto_416979 ?auto_416985 ) ) ( not ( = ?auto_416979 ?auto_416986 ) ) ( not ( = ?auto_416979 ?auto_416987 ) ) ( not ( = ?auto_416979 ?auto_416988 ) ) ( not ( = ?auto_416979 ?auto_416989 ) ) ( not ( = ?auto_416979 ?auto_416990 ) ) ( not ( = ?auto_416979 ?auto_416991 ) ) ( not ( = ?auto_416980 ?auto_416981 ) ) ( not ( = ?auto_416980 ?auto_416982 ) ) ( not ( = ?auto_416980 ?auto_416983 ) ) ( not ( = ?auto_416980 ?auto_416984 ) ) ( not ( = ?auto_416980 ?auto_416985 ) ) ( not ( = ?auto_416980 ?auto_416986 ) ) ( not ( = ?auto_416980 ?auto_416987 ) ) ( not ( = ?auto_416980 ?auto_416988 ) ) ( not ( = ?auto_416980 ?auto_416989 ) ) ( not ( = ?auto_416980 ?auto_416990 ) ) ( not ( = ?auto_416980 ?auto_416991 ) ) ( not ( = ?auto_416981 ?auto_416982 ) ) ( not ( = ?auto_416981 ?auto_416983 ) ) ( not ( = ?auto_416981 ?auto_416984 ) ) ( not ( = ?auto_416981 ?auto_416985 ) ) ( not ( = ?auto_416981 ?auto_416986 ) ) ( not ( = ?auto_416981 ?auto_416987 ) ) ( not ( = ?auto_416981 ?auto_416988 ) ) ( not ( = ?auto_416981 ?auto_416989 ) ) ( not ( = ?auto_416981 ?auto_416990 ) ) ( not ( = ?auto_416981 ?auto_416991 ) ) ( not ( = ?auto_416982 ?auto_416983 ) ) ( not ( = ?auto_416982 ?auto_416984 ) ) ( not ( = ?auto_416982 ?auto_416985 ) ) ( not ( = ?auto_416982 ?auto_416986 ) ) ( not ( = ?auto_416982 ?auto_416987 ) ) ( not ( = ?auto_416982 ?auto_416988 ) ) ( not ( = ?auto_416982 ?auto_416989 ) ) ( not ( = ?auto_416982 ?auto_416990 ) ) ( not ( = ?auto_416982 ?auto_416991 ) ) ( not ( = ?auto_416983 ?auto_416984 ) ) ( not ( = ?auto_416983 ?auto_416985 ) ) ( not ( = ?auto_416983 ?auto_416986 ) ) ( not ( = ?auto_416983 ?auto_416987 ) ) ( not ( = ?auto_416983 ?auto_416988 ) ) ( not ( = ?auto_416983 ?auto_416989 ) ) ( not ( = ?auto_416983 ?auto_416990 ) ) ( not ( = ?auto_416983 ?auto_416991 ) ) ( not ( = ?auto_416984 ?auto_416985 ) ) ( not ( = ?auto_416984 ?auto_416986 ) ) ( not ( = ?auto_416984 ?auto_416987 ) ) ( not ( = ?auto_416984 ?auto_416988 ) ) ( not ( = ?auto_416984 ?auto_416989 ) ) ( not ( = ?auto_416984 ?auto_416990 ) ) ( not ( = ?auto_416984 ?auto_416991 ) ) ( not ( = ?auto_416985 ?auto_416986 ) ) ( not ( = ?auto_416985 ?auto_416987 ) ) ( not ( = ?auto_416985 ?auto_416988 ) ) ( not ( = ?auto_416985 ?auto_416989 ) ) ( not ( = ?auto_416985 ?auto_416990 ) ) ( not ( = ?auto_416985 ?auto_416991 ) ) ( not ( = ?auto_416986 ?auto_416987 ) ) ( not ( = ?auto_416986 ?auto_416988 ) ) ( not ( = ?auto_416986 ?auto_416989 ) ) ( not ( = ?auto_416986 ?auto_416990 ) ) ( not ( = ?auto_416986 ?auto_416991 ) ) ( not ( = ?auto_416987 ?auto_416988 ) ) ( not ( = ?auto_416987 ?auto_416989 ) ) ( not ( = ?auto_416987 ?auto_416990 ) ) ( not ( = ?auto_416987 ?auto_416991 ) ) ( not ( = ?auto_416988 ?auto_416989 ) ) ( not ( = ?auto_416988 ?auto_416990 ) ) ( not ( = ?auto_416988 ?auto_416991 ) ) ( not ( = ?auto_416989 ?auto_416990 ) ) ( not ( = ?auto_416989 ?auto_416991 ) ) ( not ( = ?auto_416990 ?auto_416991 ) ) ( ON ?auto_416989 ?auto_416990 ) ( ON ?auto_416988 ?auto_416989 ) ( ON ?auto_416987 ?auto_416988 ) ( ON ?auto_416986 ?auto_416987 ) ( ON ?auto_416985 ?auto_416986 ) ( ON ?auto_416984 ?auto_416985 ) ( ON ?auto_416983 ?auto_416984 ) ( ON ?auto_416982 ?auto_416983 ) ( ON ?auto_416981 ?auto_416982 ) ( ON ?auto_416980 ?auto_416981 ) ( ON ?auto_416979 ?auto_416980 ) ( CLEAR ?auto_416977 ) ( ON ?auto_416978 ?auto_416979 ) ( CLEAR ?auto_416978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_416977 ?auto_416978 )
      ( MAKE-14PILE ?auto_416977 ?auto_416978 ?auto_416979 ?auto_416980 ?auto_416981 ?auto_416982 ?auto_416983 ?auto_416984 ?auto_416985 ?auto_416986 ?auto_416987 ?auto_416988 ?auto_416989 ?auto_416990 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_417006 - BLOCK
      ?auto_417007 - BLOCK
      ?auto_417008 - BLOCK
      ?auto_417009 - BLOCK
      ?auto_417010 - BLOCK
      ?auto_417011 - BLOCK
      ?auto_417012 - BLOCK
      ?auto_417013 - BLOCK
      ?auto_417014 - BLOCK
      ?auto_417015 - BLOCK
      ?auto_417016 - BLOCK
      ?auto_417017 - BLOCK
      ?auto_417018 - BLOCK
      ?auto_417019 - BLOCK
    )
    :vars
    (
      ?auto_417020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417019 ?auto_417020 ) ( not ( = ?auto_417006 ?auto_417007 ) ) ( not ( = ?auto_417006 ?auto_417008 ) ) ( not ( = ?auto_417006 ?auto_417009 ) ) ( not ( = ?auto_417006 ?auto_417010 ) ) ( not ( = ?auto_417006 ?auto_417011 ) ) ( not ( = ?auto_417006 ?auto_417012 ) ) ( not ( = ?auto_417006 ?auto_417013 ) ) ( not ( = ?auto_417006 ?auto_417014 ) ) ( not ( = ?auto_417006 ?auto_417015 ) ) ( not ( = ?auto_417006 ?auto_417016 ) ) ( not ( = ?auto_417006 ?auto_417017 ) ) ( not ( = ?auto_417006 ?auto_417018 ) ) ( not ( = ?auto_417006 ?auto_417019 ) ) ( not ( = ?auto_417006 ?auto_417020 ) ) ( not ( = ?auto_417007 ?auto_417008 ) ) ( not ( = ?auto_417007 ?auto_417009 ) ) ( not ( = ?auto_417007 ?auto_417010 ) ) ( not ( = ?auto_417007 ?auto_417011 ) ) ( not ( = ?auto_417007 ?auto_417012 ) ) ( not ( = ?auto_417007 ?auto_417013 ) ) ( not ( = ?auto_417007 ?auto_417014 ) ) ( not ( = ?auto_417007 ?auto_417015 ) ) ( not ( = ?auto_417007 ?auto_417016 ) ) ( not ( = ?auto_417007 ?auto_417017 ) ) ( not ( = ?auto_417007 ?auto_417018 ) ) ( not ( = ?auto_417007 ?auto_417019 ) ) ( not ( = ?auto_417007 ?auto_417020 ) ) ( not ( = ?auto_417008 ?auto_417009 ) ) ( not ( = ?auto_417008 ?auto_417010 ) ) ( not ( = ?auto_417008 ?auto_417011 ) ) ( not ( = ?auto_417008 ?auto_417012 ) ) ( not ( = ?auto_417008 ?auto_417013 ) ) ( not ( = ?auto_417008 ?auto_417014 ) ) ( not ( = ?auto_417008 ?auto_417015 ) ) ( not ( = ?auto_417008 ?auto_417016 ) ) ( not ( = ?auto_417008 ?auto_417017 ) ) ( not ( = ?auto_417008 ?auto_417018 ) ) ( not ( = ?auto_417008 ?auto_417019 ) ) ( not ( = ?auto_417008 ?auto_417020 ) ) ( not ( = ?auto_417009 ?auto_417010 ) ) ( not ( = ?auto_417009 ?auto_417011 ) ) ( not ( = ?auto_417009 ?auto_417012 ) ) ( not ( = ?auto_417009 ?auto_417013 ) ) ( not ( = ?auto_417009 ?auto_417014 ) ) ( not ( = ?auto_417009 ?auto_417015 ) ) ( not ( = ?auto_417009 ?auto_417016 ) ) ( not ( = ?auto_417009 ?auto_417017 ) ) ( not ( = ?auto_417009 ?auto_417018 ) ) ( not ( = ?auto_417009 ?auto_417019 ) ) ( not ( = ?auto_417009 ?auto_417020 ) ) ( not ( = ?auto_417010 ?auto_417011 ) ) ( not ( = ?auto_417010 ?auto_417012 ) ) ( not ( = ?auto_417010 ?auto_417013 ) ) ( not ( = ?auto_417010 ?auto_417014 ) ) ( not ( = ?auto_417010 ?auto_417015 ) ) ( not ( = ?auto_417010 ?auto_417016 ) ) ( not ( = ?auto_417010 ?auto_417017 ) ) ( not ( = ?auto_417010 ?auto_417018 ) ) ( not ( = ?auto_417010 ?auto_417019 ) ) ( not ( = ?auto_417010 ?auto_417020 ) ) ( not ( = ?auto_417011 ?auto_417012 ) ) ( not ( = ?auto_417011 ?auto_417013 ) ) ( not ( = ?auto_417011 ?auto_417014 ) ) ( not ( = ?auto_417011 ?auto_417015 ) ) ( not ( = ?auto_417011 ?auto_417016 ) ) ( not ( = ?auto_417011 ?auto_417017 ) ) ( not ( = ?auto_417011 ?auto_417018 ) ) ( not ( = ?auto_417011 ?auto_417019 ) ) ( not ( = ?auto_417011 ?auto_417020 ) ) ( not ( = ?auto_417012 ?auto_417013 ) ) ( not ( = ?auto_417012 ?auto_417014 ) ) ( not ( = ?auto_417012 ?auto_417015 ) ) ( not ( = ?auto_417012 ?auto_417016 ) ) ( not ( = ?auto_417012 ?auto_417017 ) ) ( not ( = ?auto_417012 ?auto_417018 ) ) ( not ( = ?auto_417012 ?auto_417019 ) ) ( not ( = ?auto_417012 ?auto_417020 ) ) ( not ( = ?auto_417013 ?auto_417014 ) ) ( not ( = ?auto_417013 ?auto_417015 ) ) ( not ( = ?auto_417013 ?auto_417016 ) ) ( not ( = ?auto_417013 ?auto_417017 ) ) ( not ( = ?auto_417013 ?auto_417018 ) ) ( not ( = ?auto_417013 ?auto_417019 ) ) ( not ( = ?auto_417013 ?auto_417020 ) ) ( not ( = ?auto_417014 ?auto_417015 ) ) ( not ( = ?auto_417014 ?auto_417016 ) ) ( not ( = ?auto_417014 ?auto_417017 ) ) ( not ( = ?auto_417014 ?auto_417018 ) ) ( not ( = ?auto_417014 ?auto_417019 ) ) ( not ( = ?auto_417014 ?auto_417020 ) ) ( not ( = ?auto_417015 ?auto_417016 ) ) ( not ( = ?auto_417015 ?auto_417017 ) ) ( not ( = ?auto_417015 ?auto_417018 ) ) ( not ( = ?auto_417015 ?auto_417019 ) ) ( not ( = ?auto_417015 ?auto_417020 ) ) ( not ( = ?auto_417016 ?auto_417017 ) ) ( not ( = ?auto_417016 ?auto_417018 ) ) ( not ( = ?auto_417016 ?auto_417019 ) ) ( not ( = ?auto_417016 ?auto_417020 ) ) ( not ( = ?auto_417017 ?auto_417018 ) ) ( not ( = ?auto_417017 ?auto_417019 ) ) ( not ( = ?auto_417017 ?auto_417020 ) ) ( not ( = ?auto_417018 ?auto_417019 ) ) ( not ( = ?auto_417018 ?auto_417020 ) ) ( not ( = ?auto_417019 ?auto_417020 ) ) ( ON ?auto_417018 ?auto_417019 ) ( ON ?auto_417017 ?auto_417018 ) ( ON ?auto_417016 ?auto_417017 ) ( ON ?auto_417015 ?auto_417016 ) ( ON ?auto_417014 ?auto_417015 ) ( ON ?auto_417013 ?auto_417014 ) ( ON ?auto_417012 ?auto_417013 ) ( ON ?auto_417011 ?auto_417012 ) ( ON ?auto_417010 ?auto_417011 ) ( ON ?auto_417009 ?auto_417010 ) ( ON ?auto_417008 ?auto_417009 ) ( ON ?auto_417007 ?auto_417008 ) ( ON ?auto_417006 ?auto_417007 ) ( CLEAR ?auto_417006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_417006 )
      ( MAKE-14PILE ?auto_417006 ?auto_417007 ?auto_417008 ?auto_417009 ?auto_417010 ?auto_417011 ?auto_417012 ?auto_417013 ?auto_417014 ?auto_417015 ?auto_417016 ?auto_417017 ?auto_417018 ?auto_417019 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_417035 - BLOCK
      ?auto_417036 - BLOCK
      ?auto_417037 - BLOCK
      ?auto_417038 - BLOCK
      ?auto_417039 - BLOCK
      ?auto_417040 - BLOCK
      ?auto_417041 - BLOCK
      ?auto_417042 - BLOCK
      ?auto_417043 - BLOCK
      ?auto_417044 - BLOCK
      ?auto_417045 - BLOCK
      ?auto_417046 - BLOCK
      ?auto_417047 - BLOCK
      ?auto_417048 - BLOCK
    )
    :vars
    (
      ?auto_417049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417048 ?auto_417049 ) ( not ( = ?auto_417035 ?auto_417036 ) ) ( not ( = ?auto_417035 ?auto_417037 ) ) ( not ( = ?auto_417035 ?auto_417038 ) ) ( not ( = ?auto_417035 ?auto_417039 ) ) ( not ( = ?auto_417035 ?auto_417040 ) ) ( not ( = ?auto_417035 ?auto_417041 ) ) ( not ( = ?auto_417035 ?auto_417042 ) ) ( not ( = ?auto_417035 ?auto_417043 ) ) ( not ( = ?auto_417035 ?auto_417044 ) ) ( not ( = ?auto_417035 ?auto_417045 ) ) ( not ( = ?auto_417035 ?auto_417046 ) ) ( not ( = ?auto_417035 ?auto_417047 ) ) ( not ( = ?auto_417035 ?auto_417048 ) ) ( not ( = ?auto_417035 ?auto_417049 ) ) ( not ( = ?auto_417036 ?auto_417037 ) ) ( not ( = ?auto_417036 ?auto_417038 ) ) ( not ( = ?auto_417036 ?auto_417039 ) ) ( not ( = ?auto_417036 ?auto_417040 ) ) ( not ( = ?auto_417036 ?auto_417041 ) ) ( not ( = ?auto_417036 ?auto_417042 ) ) ( not ( = ?auto_417036 ?auto_417043 ) ) ( not ( = ?auto_417036 ?auto_417044 ) ) ( not ( = ?auto_417036 ?auto_417045 ) ) ( not ( = ?auto_417036 ?auto_417046 ) ) ( not ( = ?auto_417036 ?auto_417047 ) ) ( not ( = ?auto_417036 ?auto_417048 ) ) ( not ( = ?auto_417036 ?auto_417049 ) ) ( not ( = ?auto_417037 ?auto_417038 ) ) ( not ( = ?auto_417037 ?auto_417039 ) ) ( not ( = ?auto_417037 ?auto_417040 ) ) ( not ( = ?auto_417037 ?auto_417041 ) ) ( not ( = ?auto_417037 ?auto_417042 ) ) ( not ( = ?auto_417037 ?auto_417043 ) ) ( not ( = ?auto_417037 ?auto_417044 ) ) ( not ( = ?auto_417037 ?auto_417045 ) ) ( not ( = ?auto_417037 ?auto_417046 ) ) ( not ( = ?auto_417037 ?auto_417047 ) ) ( not ( = ?auto_417037 ?auto_417048 ) ) ( not ( = ?auto_417037 ?auto_417049 ) ) ( not ( = ?auto_417038 ?auto_417039 ) ) ( not ( = ?auto_417038 ?auto_417040 ) ) ( not ( = ?auto_417038 ?auto_417041 ) ) ( not ( = ?auto_417038 ?auto_417042 ) ) ( not ( = ?auto_417038 ?auto_417043 ) ) ( not ( = ?auto_417038 ?auto_417044 ) ) ( not ( = ?auto_417038 ?auto_417045 ) ) ( not ( = ?auto_417038 ?auto_417046 ) ) ( not ( = ?auto_417038 ?auto_417047 ) ) ( not ( = ?auto_417038 ?auto_417048 ) ) ( not ( = ?auto_417038 ?auto_417049 ) ) ( not ( = ?auto_417039 ?auto_417040 ) ) ( not ( = ?auto_417039 ?auto_417041 ) ) ( not ( = ?auto_417039 ?auto_417042 ) ) ( not ( = ?auto_417039 ?auto_417043 ) ) ( not ( = ?auto_417039 ?auto_417044 ) ) ( not ( = ?auto_417039 ?auto_417045 ) ) ( not ( = ?auto_417039 ?auto_417046 ) ) ( not ( = ?auto_417039 ?auto_417047 ) ) ( not ( = ?auto_417039 ?auto_417048 ) ) ( not ( = ?auto_417039 ?auto_417049 ) ) ( not ( = ?auto_417040 ?auto_417041 ) ) ( not ( = ?auto_417040 ?auto_417042 ) ) ( not ( = ?auto_417040 ?auto_417043 ) ) ( not ( = ?auto_417040 ?auto_417044 ) ) ( not ( = ?auto_417040 ?auto_417045 ) ) ( not ( = ?auto_417040 ?auto_417046 ) ) ( not ( = ?auto_417040 ?auto_417047 ) ) ( not ( = ?auto_417040 ?auto_417048 ) ) ( not ( = ?auto_417040 ?auto_417049 ) ) ( not ( = ?auto_417041 ?auto_417042 ) ) ( not ( = ?auto_417041 ?auto_417043 ) ) ( not ( = ?auto_417041 ?auto_417044 ) ) ( not ( = ?auto_417041 ?auto_417045 ) ) ( not ( = ?auto_417041 ?auto_417046 ) ) ( not ( = ?auto_417041 ?auto_417047 ) ) ( not ( = ?auto_417041 ?auto_417048 ) ) ( not ( = ?auto_417041 ?auto_417049 ) ) ( not ( = ?auto_417042 ?auto_417043 ) ) ( not ( = ?auto_417042 ?auto_417044 ) ) ( not ( = ?auto_417042 ?auto_417045 ) ) ( not ( = ?auto_417042 ?auto_417046 ) ) ( not ( = ?auto_417042 ?auto_417047 ) ) ( not ( = ?auto_417042 ?auto_417048 ) ) ( not ( = ?auto_417042 ?auto_417049 ) ) ( not ( = ?auto_417043 ?auto_417044 ) ) ( not ( = ?auto_417043 ?auto_417045 ) ) ( not ( = ?auto_417043 ?auto_417046 ) ) ( not ( = ?auto_417043 ?auto_417047 ) ) ( not ( = ?auto_417043 ?auto_417048 ) ) ( not ( = ?auto_417043 ?auto_417049 ) ) ( not ( = ?auto_417044 ?auto_417045 ) ) ( not ( = ?auto_417044 ?auto_417046 ) ) ( not ( = ?auto_417044 ?auto_417047 ) ) ( not ( = ?auto_417044 ?auto_417048 ) ) ( not ( = ?auto_417044 ?auto_417049 ) ) ( not ( = ?auto_417045 ?auto_417046 ) ) ( not ( = ?auto_417045 ?auto_417047 ) ) ( not ( = ?auto_417045 ?auto_417048 ) ) ( not ( = ?auto_417045 ?auto_417049 ) ) ( not ( = ?auto_417046 ?auto_417047 ) ) ( not ( = ?auto_417046 ?auto_417048 ) ) ( not ( = ?auto_417046 ?auto_417049 ) ) ( not ( = ?auto_417047 ?auto_417048 ) ) ( not ( = ?auto_417047 ?auto_417049 ) ) ( not ( = ?auto_417048 ?auto_417049 ) ) ( ON ?auto_417047 ?auto_417048 ) ( ON ?auto_417046 ?auto_417047 ) ( ON ?auto_417045 ?auto_417046 ) ( ON ?auto_417044 ?auto_417045 ) ( ON ?auto_417043 ?auto_417044 ) ( ON ?auto_417042 ?auto_417043 ) ( ON ?auto_417041 ?auto_417042 ) ( ON ?auto_417040 ?auto_417041 ) ( ON ?auto_417039 ?auto_417040 ) ( ON ?auto_417038 ?auto_417039 ) ( ON ?auto_417037 ?auto_417038 ) ( ON ?auto_417036 ?auto_417037 ) ( ON ?auto_417035 ?auto_417036 ) ( CLEAR ?auto_417035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_417035 )
      ( MAKE-14PILE ?auto_417035 ?auto_417036 ?auto_417037 ?auto_417038 ?auto_417039 ?auto_417040 ?auto_417041 ?auto_417042 ?auto_417043 ?auto_417044 ?auto_417045 ?auto_417046 ?auto_417047 ?auto_417048 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417065 - BLOCK
      ?auto_417066 - BLOCK
      ?auto_417067 - BLOCK
      ?auto_417068 - BLOCK
      ?auto_417069 - BLOCK
      ?auto_417070 - BLOCK
      ?auto_417071 - BLOCK
      ?auto_417072 - BLOCK
      ?auto_417073 - BLOCK
      ?auto_417074 - BLOCK
      ?auto_417075 - BLOCK
      ?auto_417076 - BLOCK
      ?auto_417077 - BLOCK
      ?auto_417078 - BLOCK
      ?auto_417079 - BLOCK
    )
    :vars
    (
      ?auto_417080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_417078 ) ( ON ?auto_417079 ?auto_417080 ) ( CLEAR ?auto_417079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_417065 ) ( ON ?auto_417066 ?auto_417065 ) ( ON ?auto_417067 ?auto_417066 ) ( ON ?auto_417068 ?auto_417067 ) ( ON ?auto_417069 ?auto_417068 ) ( ON ?auto_417070 ?auto_417069 ) ( ON ?auto_417071 ?auto_417070 ) ( ON ?auto_417072 ?auto_417071 ) ( ON ?auto_417073 ?auto_417072 ) ( ON ?auto_417074 ?auto_417073 ) ( ON ?auto_417075 ?auto_417074 ) ( ON ?auto_417076 ?auto_417075 ) ( ON ?auto_417077 ?auto_417076 ) ( ON ?auto_417078 ?auto_417077 ) ( not ( = ?auto_417065 ?auto_417066 ) ) ( not ( = ?auto_417065 ?auto_417067 ) ) ( not ( = ?auto_417065 ?auto_417068 ) ) ( not ( = ?auto_417065 ?auto_417069 ) ) ( not ( = ?auto_417065 ?auto_417070 ) ) ( not ( = ?auto_417065 ?auto_417071 ) ) ( not ( = ?auto_417065 ?auto_417072 ) ) ( not ( = ?auto_417065 ?auto_417073 ) ) ( not ( = ?auto_417065 ?auto_417074 ) ) ( not ( = ?auto_417065 ?auto_417075 ) ) ( not ( = ?auto_417065 ?auto_417076 ) ) ( not ( = ?auto_417065 ?auto_417077 ) ) ( not ( = ?auto_417065 ?auto_417078 ) ) ( not ( = ?auto_417065 ?auto_417079 ) ) ( not ( = ?auto_417065 ?auto_417080 ) ) ( not ( = ?auto_417066 ?auto_417067 ) ) ( not ( = ?auto_417066 ?auto_417068 ) ) ( not ( = ?auto_417066 ?auto_417069 ) ) ( not ( = ?auto_417066 ?auto_417070 ) ) ( not ( = ?auto_417066 ?auto_417071 ) ) ( not ( = ?auto_417066 ?auto_417072 ) ) ( not ( = ?auto_417066 ?auto_417073 ) ) ( not ( = ?auto_417066 ?auto_417074 ) ) ( not ( = ?auto_417066 ?auto_417075 ) ) ( not ( = ?auto_417066 ?auto_417076 ) ) ( not ( = ?auto_417066 ?auto_417077 ) ) ( not ( = ?auto_417066 ?auto_417078 ) ) ( not ( = ?auto_417066 ?auto_417079 ) ) ( not ( = ?auto_417066 ?auto_417080 ) ) ( not ( = ?auto_417067 ?auto_417068 ) ) ( not ( = ?auto_417067 ?auto_417069 ) ) ( not ( = ?auto_417067 ?auto_417070 ) ) ( not ( = ?auto_417067 ?auto_417071 ) ) ( not ( = ?auto_417067 ?auto_417072 ) ) ( not ( = ?auto_417067 ?auto_417073 ) ) ( not ( = ?auto_417067 ?auto_417074 ) ) ( not ( = ?auto_417067 ?auto_417075 ) ) ( not ( = ?auto_417067 ?auto_417076 ) ) ( not ( = ?auto_417067 ?auto_417077 ) ) ( not ( = ?auto_417067 ?auto_417078 ) ) ( not ( = ?auto_417067 ?auto_417079 ) ) ( not ( = ?auto_417067 ?auto_417080 ) ) ( not ( = ?auto_417068 ?auto_417069 ) ) ( not ( = ?auto_417068 ?auto_417070 ) ) ( not ( = ?auto_417068 ?auto_417071 ) ) ( not ( = ?auto_417068 ?auto_417072 ) ) ( not ( = ?auto_417068 ?auto_417073 ) ) ( not ( = ?auto_417068 ?auto_417074 ) ) ( not ( = ?auto_417068 ?auto_417075 ) ) ( not ( = ?auto_417068 ?auto_417076 ) ) ( not ( = ?auto_417068 ?auto_417077 ) ) ( not ( = ?auto_417068 ?auto_417078 ) ) ( not ( = ?auto_417068 ?auto_417079 ) ) ( not ( = ?auto_417068 ?auto_417080 ) ) ( not ( = ?auto_417069 ?auto_417070 ) ) ( not ( = ?auto_417069 ?auto_417071 ) ) ( not ( = ?auto_417069 ?auto_417072 ) ) ( not ( = ?auto_417069 ?auto_417073 ) ) ( not ( = ?auto_417069 ?auto_417074 ) ) ( not ( = ?auto_417069 ?auto_417075 ) ) ( not ( = ?auto_417069 ?auto_417076 ) ) ( not ( = ?auto_417069 ?auto_417077 ) ) ( not ( = ?auto_417069 ?auto_417078 ) ) ( not ( = ?auto_417069 ?auto_417079 ) ) ( not ( = ?auto_417069 ?auto_417080 ) ) ( not ( = ?auto_417070 ?auto_417071 ) ) ( not ( = ?auto_417070 ?auto_417072 ) ) ( not ( = ?auto_417070 ?auto_417073 ) ) ( not ( = ?auto_417070 ?auto_417074 ) ) ( not ( = ?auto_417070 ?auto_417075 ) ) ( not ( = ?auto_417070 ?auto_417076 ) ) ( not ( = ?auto_417070 ?auto_417077 ) ) ( not ( = ?auto_417070 ?auto_417078 ) ) ( not ( = ?auto_417070 ?auto_417079 ) ) ( not ( = ?auto_417070 ?auto_417080 ) ) ( not ( = ?auto_417071 ?auto_417072 ) ) ( not ( = ?auto_417071 ?auto_417073 ) ) ( not ( = ?auto_417071 ?auto_417074 ) ) ( not ( = ?auto_417071 ?auto_417075 ) ) ( not ( = ?auto_417071 ?auto_417076 ) ) ( not ( = ?auto_417071 ?auto_417077 ) ) ( not ( = ?auto_417071 ?auto_417078 ) ) ( not ( = ?auto_417071 ?auto_417079 ) ) ( not ( = ?auto_417071 ?auto_417080 ) ) ( not ( = ?auto_417072 ?auto_417073 ) ) ( not ( = ?auto_417072 ?auto_417074 ) ) ( not ( = ?auto_417072 ?auto_417075 ) ) ( not ( = ?auto_417072 ?auto_417076 ) ) ( not ( = ?auto_417072 ?auto_417077 ) ) ( not ( = ?auto_417072 ?auto_417078 ) ) ( not ( = ?auto_417072 ?auto_417079 ) ) ( not ( = ?auto_417072 ?auto_417080 ) ) ( not ( = ?auto_417073 ?auto_417074 ) ) ( not ( = ?auto_417073 ?auto_417075 ) ) ( not ( = ?auto_417073 ?auto_417076 ) ) ( not ( = ?auto_417073 ?auto_417077 ) ) ( not ( = ?auto_417073 ?auto_417078 ) ) ( not ( = ?auto_417073 ?auto_417079 ) ) ( not ( = ?auto_417073 ?auto_417080 ) ) ( not ( = ?auto_417074 ?auto_417075 ) ) ( not ( = ?auto_417074 ?auto_417076 ) ) ( not ( = ?auto_417074 ?auto_417077 ) ) ( not ( = ?auto_417074 ?auto_417078 ) ) ( not ( = ?auto_417074 ?auto_417079 ) ) ( not ( = ?auto_417074 ?auto_417080 ) ) ( not ( = ?auto_417075 ?auto_417076 ) ) ( not ( = ?auto_417075 ?auto_417077 ) ) ( not ( = ?auto_417075 ?auto_417078 ) ) ( not ( = ?auto_417075 ?auto_417079 ) ) ( not ( = ?auto_417075 ?auto_417080 ) ) ( not ( = ?auto_417076 ?auto_417077 ) ) ( not ( = ?auto_417076 ?auto_417078 ) ) ( not ( = ?auto_417076 ?auto_417079 ) ) ( not ( = ?auto_417076 ?auto_417080 ) ) ( not ( = ?auto_417077 ?auto_417078 ) ) ( not ( = ?auto_417077 ?auto_417079 ) ) ( not ( = ?auto_417077 ?auto_417080 ) ) ( not ( = ?auto_417078 ?auto_417079 ) ) ( not ( = ?auto_417078 ?auto_417080 ) ) ( not ( = ?auto_417079 ?auto_417080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_417079 ?auto_417080 )
      ( !STACK ?auto_417079 ?auto_417078 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417096 - BLOCK
      ?auto_417097 - BLOCK
      ?auto_417098 - BLOCK
      ?auto_417099 - BLOCK
      ?auto_417100 - BLOCK
      ?auto_417101 - BLOCK
      ?auto_417102 - BLOCK
      ?auto_417103 - BLOCK
      ?auto_417104 - BLOCK
      ?auto_417105 - BLOCK
      ?auto_417106 - BLOCK
      ?auto_417107 - BLOCK
      ?auto_417108 - BLOCK
      ?auto_417109 - BLOCK
      ?auto_417110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_417109 ) ( ON-TABLE ?auto_417110 ) ( CLEAR ?auto_417110 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_417096 ) ( ON ?auto_417097 ?auto_417096 ) ( ON ?auto_417098 ?auto_417097 ) ( ON ?auto_417099 ?auto_417098 ) ( ON ?auto_417100 ?auto_417099 ) ( ON ?auto_417101 ?auto_417100 ) ( ON ?auto_417102 ?auto_417101 ) ( ON ?auto_417103 ?auto_417102 ) ( ON ?auto_417104 ?auto_417103 ) ( ON ?auto_417105 ?auto_417104 ) ( ON ?auto_417106 ?auto_417105 ) ( ON ?auto_417107 ?auto_417106 ) ( ON ?auto_417108 ?auto_417107 ) ( ON ?auto_417109 ?auto_417108 ) ( not ( = ?auto_417096 ?auto_417097 ) ) ( not ( = ?auto_417096 ?auto_417098 ) ) ( not ( = ?auto_417096 ?auto_417099 ) ) ( not ( = ?auto_417096 ?auto_417100 ) ) ( not ( = ?auto_417096 ?auto_417101 ) ) ( not ( = ?auto_417096 ?auto_417102 ) ) ( not ( = ?auto_417096 ?auto_417103 ) ) ( not ( = ?auto_417096 ?auto_417104 ) ) ( not ( = ?auto_417096 ?auto_417105 ) ) ( not ( = ?auto_417096 ?auto_417106 ) ) ( not ( = ?auto_417096 ?auto_417107 ) ) ( not ( = ?auto_417096 ?auto_417108 ) ) ( not ( = ?auto_417096 ?auto_417109 ) ) ( not ( = ?auto_417096 ?auto_417110 ) ) ( not ( = ?auto_417097 ?auto_417098 ) ) ( not ( = ?auto_417097 ?auto_417099 ) ) ( not ( = ?auto_417097 ?auto_417100 ) ) ( not ( = ?auto_417097 ?auto_417101 ) ) ( not ( = ?auto_417097 ?auto_417102 ) ) ( not ( = ?auto_417097 ?auto_417103 ) ) ( not ( = ?auto_417097 ?auto_417104 ) ) ( not ( = ?auto_417097 ?auto_417105 ) ) ( not ( = ?auto_417097 ?auto_417106 ) ) ( not ( = ?auto_417097 ?auto_417107 ) ) ( not ( = ?auto_417097 ?auto_417108 ) ) ( not ( = ?auto_417097 ?auto_417109 ) ) ( not ( = ?auto_417097 ?auto_417110 ) ) ( not ( = ?auto_417098 ?auto_417099 ) ) ( not ( = ?auto_417098 ?auto_417100 ) ) ( not ( = ?auto_417098 ?auto_417101 ) ) ( not ( = ?auto_417098 ?auto_417102 ) ) ( not ( = ?auto_417098 ?auto_417103 ) ) ( not ( = ?auto_417098 ?auto_417104 ) ) ( not ( = ?auto_417098 ?auto_417105 ) ) ( not ( = ?auto_417098 ?auto_417106 ) ) ( not ( = ?auto_417098 ?auto_417107 ) ) ( not ( = ?auto_417098 ?auto_417108 ) ) ( not ( = ?auto_417098 ?auto_417109 ) ) ( not ( = ?auto_417098 ?auto_417110 ) ) ( not ( = ?auto_417099 ?auto_417100 ) ) ( not ( = ?auto_417099 ?auto_417101 ) ) ( not ( = ?auto_417099 ?auto_417102 ) ) ( not ( = ?auto_417099 ?auto_417103 ) ) ( not ( = ?auto_417099 ?auto_417104 ) ) ( not ( = ?auto_417099 ?auto_417105 ) ) ( not ( = ?auto_417099 ?auto_417106 ) ) ( not ( = ?auto_417099 ?auto_417107 ) ) ( not ( = ?auto_417099 ?auto_417108 ) ) ( not ( = ?auto_417099 ?auto_417109 ) ) ( not ( = ?auto_417099 ?auto_417110 ) ) ( not ( = ?auto_417100 ?auto_417101 ) ) ( not ( = ?auto_417100 ?auto_417102 ) ) ( not ( = ?auto_417100 ?auto_417103 ) ) ( not ( = ?auto_417100 ?auto_417104 ) ) ( not ( = ?auto_417100 ?auto_417105 ) ) ( not ( = ?auto_417100 ?auto_417106 ) ) ( not ( = ?auto_417100 ?auto_417107 ) ) ( not ( = ?auto_417100 ?auto_417108 ) ) ( not ( = ?auto_417100 ?auto_417109 ) ) ( not ( = ?auto_417100 ?auto_417110 ) ) ( not ( = ?auto_417101 ?auto_417102 ) ) ( not ( = ?auto_417101 ?auto_417103 ) ) ( not ( = ?auto_417101 ?auto_417104 ) ) ( not ( = ?auto_417101 ?auto_417105 ) ) ( not ( = ?auto_417101 ?auto_417106 ) ) ( not ( = ?auto_417101 ?auto_417107 ) ) ( not ( = ?auto_417101 ?auto_417108 ) ) ( not ( = ?auto_417101 ?auto_417109 ) ) ( not ( = ?auto_417101 ?auto_417110 ) ) ( not ( = ?auto_417102 ?auto_417103 ) ) ( not ( = ?auto_417102 ?auto_417104 ) ) ( not ( = ?auto_417102 ?auto_417105 ) ) ( not ( = ?auto_417102 ?auto_417106 ) ) ( not ( = ?auto_417102 ?auto_417107 ) ) ( not ( = ?auto_417102 ?auto_417108 ) ) ( not ( = ?auto_417102 ?auto_417109 ) ) ( not ( = ?auto_417102 ?auto_417110 ) ) ( not ( = ?auto_417103 ?auto_417104 ) ) ( not ( = ?auto_417103 ?auto_417105 ) ) ( not ( = ?auto_417103 ?auto_417106 ) ) ( not ( = ?auto_417103 ?auto_417107 ) ) ( not ( = ?auto_417103 ?auto_417108 ) ) ( not ( = ?auto_417103 ?auto_417109 ) ) ( not ( = ?auto_417103 ?auto_417110 ) ) ( not ( = ?auto_417104 ?auto_417105 ) ) ( not ( = ?auto_417104 ?auto_417106 ) ) ( not ( = ?auto_417104 ?auto_417107 ) ) ( not ( = ?auto_417104 ?auto_417108 ) ) ( not ( = ?auto_417104 ?auto_417109 ) ) ( not ( = ?auto_417104 ?auto_417110 ) ) ( not ( = ?auto_417105 ?auto_417106 ) ) ( not ( = ?auto_417105 ?auto_417107 ) ) ( not ( = ?auto_417105 ?auto_417108 ) ) ( not ( = ?auto_417105 ?auto_417109 ) ) ( not ( = ?auto_417105 ?auto_417110 ) ) ( not ( = ?auto_417106 ?auto_417107 ) ) ( not ( = ?auto_417106 ?auto_417108 ) ) ( not ( = ?auto_417106 ?auto_417109 ) ) ( not ( = ?auto_417106 ?auto_417110 ) ) ( not ( = ?auto_417107 ?auto_417108 ) ) ( not ( = ?auto_417107 ?auto_417109 ) ) ( not ( = ?auto_417107 ?auto_417110 ) ) ( not ( = ?auto_417108 ?auto_417109 ) ) ( not ( = ?auto_417108 ?auto_417110 ) ) ( not ( = ?auto_417109 ?auto_417110 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_417110 )
      ( !STACK ?auto_417110 ?auto_417109 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417126 - BLOCK
      ?auto_417127 - BLOCK
      ?auto_417128 - BLOCK
      ?auto_417129 - BLOCK
      ?auto_417130 - BLOCK
      ?auto_417131 - BLOCK
      ?auto_417132 - BLOCK
      ?auto_417133 - BLOCK
      ?auto_417134 - BLOCK
      ?auto_417135 - BLOCK
      ?auto_417136 - BLOCK
      ?auto_417137 - BLOCK
      ?auto_417138 - BLOCK
      ?auto_417139 - BLOCK
      ?auto_417140 - BLOCK
    )
    :vars
    (
      ?auto_417141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417140 ?auto_417141 ) ( ON-TABLE ?auto_417126 ) ( ON ?auto_417127 ?auto_417126 ) ( ON ?auto_417128 ?auto_417127 ) ( ON ?auto_417129 ?auto_417128 ) ( ON ?auto_417130 ?auto_417129 ) ( ON ?auto_417131 ?auto_417130 ) ( ON ?auto_417132 ?auto_417131 ) ( ON ?auto_417133 ?auto_417132 ) ( ON ?auto_417134 ?auto_417133 ) ( ON ?auto_417135 ?auto_417134 ) ( ON ?auto_417136 ?auto_417135 ) ( ON ?auto_417137 ?auto_417136 ) ( ON ?auto_417138 ?auto_417137 ) ( not ( = ?auto_417126 ?auto_417127 ) ) ( not ( = ?auto_417126 ?auto_417128 ) ) ( not ( = ?auto_417126 ?auto_417129 ) ) ( not ( = ?auto_417126 ?auto_417130 ) ) ( not ( = ?auto_417126 ?auto_417131 ) ) ( not ( = ?auto_417126 ?auto_417132 ) ) ( not ( = ?auto_417126 ?auto_417133 ) ) ( not ( = ?auto_417126 ?auto_417134 ) ) ( not ( = ?auto_417126 ?auto_417135 ) ) ( not ( = ?auto_417126 ?auto_417136 ) ) ( not ( = ?auto_417126 ?auto_417137 ) ) ( not ( = ?auto_417126 ?auto_417138 ) ) ( not ( = ?auto_417126 ?auto_417139 ) ) ( not ( = ?auto_417126 ?auto_417140 ) ) ( not ( = ?auto_417126 ?auto_417141 ) ) ( not ( = ?auto_417127 ?auto_417128 ) ) ( not ( = ?auto_417127 ?auto_417129 ) ) ( not ( = ?auto_417127 ?auto_417130 ) ) ( not ( = ?auto_417127 ?auto_417131 ) ) ( not ( = ?auto_417127 ?auto_417132 ) ) ( not ( = ?auto_417127 ?auto_417133 ) ) ( not ( = ?auto_417127 ?auto_417134 ) ) ( not ( = ?auto_417127 ?auto_417135 ) ) ( not ( = ?auto_417127 ?auto_417136 ) ) ( not ( = ?auto_417127 ?auto_417137 ) ) ( not ( = ?auto_417127 ?auto_417138 ) ) ( not ( = ?auto_417127 ?auto_417139 ) ) ( not ( = ?auto_417127 ?auto_417140 ) ) ( not ( = ?auto_417127 ?auto_417141 ) ) ( not ( = ?auto_417128 ?auto_417129 ) ) ( not ( = ?auto_417128 ?auto_417130 ) ) ( not ( = ?auto_417128 ?auto_417131 ) ) ( not ( = ?auto_417128 ?auto_417132 ) ) ( not ( = ?auto_417128 ?auto_417133 ) ) ( not ( = ?auto_417128 ?auto_417134 ) ) ( not ( = ?auto_417128 ?auto_417135 ) ) ( not ( = ?auto_417128 ?auto_417136 ) ) ( not ( = ?auto_417128 ?auto_417137 ) ) ( not ( = ?auto_417128 ?auto_417138 ) ) ( not ( = ?auto_417128 ?auto_417139 ) ) ( not ( = ?auto_417128 ?auto_417140 ) ) ( not ( = ?auto_417128 ?auto_417141 ) ) ( not ( = ?auto_417129 ?auto_417130 ) ) ( not ( = ?auto_417129 ?auto_417131 ) ) ( not ( = ?auto_417129 ?auto_417132 ) ) ( not ( = ?auto_417129 ?auto_417133 ) ) ( not ( = ?auto_417129 ?auto_417134 ) ) ( not ( = ?auto_417129 ?auto_417135 ) ) ( not ( = ?auto_417129 ?auto_417136 ) ) ( not ( = ?auto_417129 ?auto_417137 ) ) ( not ( = ?auto_417129 ?auto_417138 ) ) ( not ( = ?auto_417129 ?auto_417139 ) ) ( not ( = ?auto_417129 ?auto_417140 ) ) ( not ( = ?auto_417129 ?auto_417141 ) ) ( not ( = ?auto_417130 ?auto_417131 ) ) ( not ( = ?auto_417130 ?auto_417132 ) ) ( not ( = ?auto_417130 ?auto_417133 ) ) ( not ( = ?auto_417130 ?auto_417134 ) ) ( not ( = ?auto_417130 ?auto_417135 ) ) ( not ( = ?auto_417130 ?auto_417136 ) ) ( not ( = ?auto_417130 ?auto_417137 ) ) ( not ( = ?auto_417130 ?auto_417138 ) ) ( not ( = ?auto_417130 ?auto_417139 ) ) ( not ( = ?auto_417130 ?auto_417140 ) ) ( not ( = ?auto_417130 ?auto_417141 ) ) ( not ( = ?auto_417131 ?auto_417132 ) ) ( not ( = ?auto_417131 ?auto_417133 ) ) ( not ( = ?auto_417131 ?auto_417134 ) ) ( not ( = ?auto_417131 ?auto_417135 ) ) ( not ( = ?auto_417131 ?auto_417136 ) ) ( not ( = ?auto_417131 ?auto_417137 ) ) ( not ( = ?auto_417131 ?auto_417138 ) ) ( not ( = ?auto_417131 ?auto_417139 ) ) ( not ( = ?auto_417131 ?auto_417140 ) ) ( not ( = ?auto_417131 ?auto_417141 ) ) ( not ( = ?auto_417132 ?auto_417133 ) ) ( not ( = ?auto_417132 ?auto_417134 ) ) ( not ( = ?auto_417132 ?auto_417135 ) ) ( not ( = ?auto_417132 ?auto_417136 ) ) ( not ( = ?auto_417132 ?auto_417137 ) ) ( not ( = ?auto_417132 ?auto_417138 ) ) ( not ( = ?auto_417132 ?auto_417139 ) ) ( not ( = ?auto_417132 ?auto_417140 ) ) ( not ( = ?auto_417132 ?auto_417141 ) ) ( not ( = ?auto_417133 ?auto_417134 ) ) ( not ( = ?auto_417133 ?auto_417135 ) ) ( not ( = ?auto_417133 ?auto_417136 ) ) ( not ( = ?auto_417133 ?auto_417137 ) ) ( not ( = ?auto_417133 ?auto_417138 ) ) ( not ( = ?auto_417133 ?auto_417139 ) ) ( not ( = ?auto_417133 ?auto_417140 ) ) ( not ( = ?auto_417133 ?auto_417141 ) ) ( not ( = ?auto_417134 ?auto_417135 ) ) ( not ( = ?auto_417134 ?auto_417136 ) ) ( not ( = ?auto_417134 ?auto_417137 ) ) ( not ( = ?auto_417134 ?auto_417138 ) ) ( not ( = ?auto_417134 ?auto_417139 ) ) ( not ( = ?auto_417134 ?auto_417140 ) ) ( not ( = ?auto_417134 ?auto_417141 ) ) ( not ( = ?auto_417135 ?auto_417136 ) ) ( not ( = ?auto_417135 ?auto_417137 ) ) ( not ( = ?auto_417135 ?auto_417138 ) ) ( not ( = ?auto_417135 ?auto_417139 ) ) ( not ( = ?auto_417135 ?auto_417140 ) ) ( not ( = ?auto_417135 ?auto_417141 ) ) ( not ( = ?auto_417136 ?auto_417137 ) ) ( not ( = ?auto_417136 ?auto_417138 ) ) ( not ( = ?auto_417136 ?auto_417139 ) ) ( not ( = ?auto_417136 ?auto_417140 ) ) ( not ( = ?auto_417136 ?auto_417141 ) ) ( not ( = ?auto_417137 ?auto_417138 ) ) ( not ( = ?auto_417137 ?auto_417139 ) ) ( not ( = ?auto_417137 ?auto_417140 ) ) ( not ( = ?auto_417137 ?auto_417141 ) ) ( not ( = ?auto_417138 ?auto_417139 ) ) ( not ( = ?auto_417138 ?auto_417140 ) ) ( not ( = ?auto_417138 ?auto_417141 ) ) ( not ( = ?auto_417139 ?auto_417140 ) ) ( not ( = ?auto_417139 ?auto_417141 ) ) ( not ( = ?auto_417140 ?auto_417141 ) ) ( CLEAR ?auto_417138 ) ( ON ?auto_417139 ?auto_417140 ) ( CLEAR ?auto_417139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_417126 ?auto_417127 ?auto_417128 ?auto_417129 ?auto_417130 ?auto_417131 ?auto_417132 ?auto_417133 ?auto_417134 ?auto_417135 ?auto_417136 ?auto_417137 ?auto_417138 ?auto_417139 )
      ( MAKE-15PILE ?auto_417126 ?auto_417127 ?auto_417128 ?auto_417129 ?auto_417130 ?auto_417131 ?auto_417132 ?auto_417133 ?auto_417134 ?auto_417135 ?auto_417136 ?auto_417137 ?auto_417138 ?auto_417139 ?auto_417140 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417157 - BLOCK
      ?auto_417158 - BLOCK
      ?auto_417159 - BLOCK
      ?auto_417160 - BLOCK
      ?auto_417161 - BLOCK
      ?auto_417162 - BLOCK
      ?auto_417163 - BLOCK
      ?auto_417164 - BLOCK
      ?auto_417165 - BLOCK
      ?auto_417166 - BLOCK
      ?auto_417167 - BLOCK
      ?auto_417168 - BLOCK
      ?auto_417169 - BLOCK
      ?auto_417170 - BLOCK
      ?auto_417171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417171 ) ( ON-TABLE ?auto_417157 ) ( ON ?auto_417158 ?auto_417157 ) ( ON ?auto_417159 ?auto_417158 ) ( ON ?auto_417160 ?auto_417159 ) ( ON ?auto_417161 ?auto_417160 ) ( ON ?auto_417162 ?auto_417161 ) ( ON ?auto_417163 ?auto_417162 ) ( ON ?auto_417164 ?auto_417163 ) ( ON ?auto_417165 ?auto_417164 ) ( ON ?auto_417166 ?auto_417165 ) ( ON ?auto_417167 ?auto_417166 ) ( ON ?auto_417168 ?auto_417167 ) ( ON ?auto_417169 ?auto_417168 ) ( not ( = ?auto_417157 ?auto_417158 ) ) ( not ( = ?auto_417157 ?auto_417159 ) ) ( not ( = ?auto_417157 ?auto_417160 ) ) ( not ( = ?auto_417157 ?auto_417161 ) ) ( not ( = ?auto_417157 ?auto_417162 ) ) ( not ( = ?auto_417157 ?auto_417163 ) ) ( not ( = ?auto_417157 ?auto_417164 ) ) ( not ( = ?auto_417157 ?auto_417165 ) ) ( not ( = ?auto_417157 ?auto_417166 ) ) ( not ( = ?auto_417157 ?auto_417167 ) ) ( not ( = ?auto_417157 ?auto_417168 ) ) ( not ( = ?auto_417157 ?auto_417169 ) ) ( not ( = ?auto_417157 ?auto_417170 ) ) ( not ( = ?auto_417157 ?auto_417171 ) ) ( not ( = ?auto_417158 ?auto_417159 ) ) ( not ( = ?auto_417158 ?auto_417160 ) ) ( not ( = ?auto_417158 ?auto_417161 ) ) ( not ( = ?auto_417158 ?auto_417162 ) ) ( not ( = ?auto_417158 ?auto_417163 ) ) ( not ( = ?auto_417158 ?auto_417164 ) ) ( not ( = ?auto_417158 ?auto_417165 ) ) ( not ( = ?auto_417158 ?auto_417166 ) ) ( not ( = ?auto_417158 ?auto_417167 ) ) ( not ( = ?auto_417158 ?auto_417168 ) ) ( not ( = ?auto_417158 ?auto_417169 ) ) ( not ( = ?auto_417158 ?auto_417170 ) ) ( not ( = ?auto_417158 ?auto_417171 ) ) ( not ( = ?auto_417159 ?auto_417160 ) ) ( not ( = ?auto_417159 ?auto_417161 ) ) ( not ( = ?auto_417159 ?auto_417162 ) ) ( not ( = ?auto_417159 ?auto_417163 ) ) ( not ( = ?auto_417159 ?auto_417164 ) ) ( not ( = ?auto_417159 ?auto_417165 ) ) ( not ( = ?auto_417159 ?auto_417166 ) ) ( not ( = ?auto_417159 ?auto_417167 ) ) ( not ( = ?auto_417159 ?auto_417168 ) ) ( not ( = ?auto_417159 ?auto_417169 ) ) ( not ( = ?auto_417159 ?auto_417170 ) ) ( not ( = ?auto_417159 ?auto_417171 ) ) ( not ( = ?auto_417160 ?auto_417161 ) ) ( not ( = ?auto_417160 ?auto_417162 ) ) ( not ( = ?auto_417160 ?auto_417163 ) ) ( not ( = ?auto_417160 ?auto_417164 ) ) ( not ( = ?auto_417160 ?auto_417165 ) ) ( not ( = ?auto_417160 ?auto_417166 ) ) ( not ( = ?auto_417160 ?auto_417167 ) ) ( not ( = ?auto_417160 ?auto_417168 ) ) ( not ( = ?auto_417160 ?auto_417169 ) ) ( not ( = ?auto_417160 ?auto_417170 ) ) ( not ( = ?auto_417160 ?auto_417171 ) ) ( not ( = ?auto_417161 ?auto_417162 ) ) ( not ( = ?auto_417161 ?auto_417163 ) ) ( not ( = ?auto_417161 ?auto_417164 ) ) ( not ( = ?auto_417161 ?auto_417165 ) ) ( not ( = ?auto_417161 ?auto_417166 ) ) ( not ( = ?auto_417161 ?auto_417167 ) ) ( not ( = ?auto_417161 ?auto_417168 ) ) ( not ( = ?auto_417161 ?auto_417169 ) ) ( not ( = ?auto_417161 ?auto_417170 ) ) ( not ( = ?auto_417161 ?auto_417171 ) ) ( not ( = ?auto_417162 ?auto_417163 ) ) ( not ( = ?auto_417162 ?auto_417164 ) ) ( not ( = ?auto_417162 ?auto_417165 ) ) ( not ( = ?auto_417162 ?auto_417166 ) ) ( not ( = ?auto_417162 ?auto_417167 ) ) ( not ( = ?auto_417162 ?auto_417168 ) ) ( not ( = ?auto_417162 ?auto_417169 ) ) ( not ( = ?auto_417162 ?auto_417170 ) ) ( not ( = ?auto_417162 ?auto_417171 ) ) ( not ( = ?auto_417163 ?auto_417164 ) ) ( not ( = ?auto_417163 ?auto_417165 ) ) ( not ( = ?auto_417163 ?auto_417166 ) ) ( not ( = ?auto_417163 ?auto_417167 ) ) ( not ( = ?auto_417163 ?auto_417168 ) ) ( not ( = ?auto_417163 ?auto_417169 ) ) ( not ( = ?auto_417163 ?auto_417170 ) ) ( not ( = ?auto_417163 ?auto_417171 ) ) ( not ( = ?auto_417164 ?auto_417165 ) ) ( not ( = ?auto_417164 ?auto_417166 ) ) ( not ( = ?auto_417164 ?auto_417167 ) ) ( not ( = ?auto_417164 ?auto_417168 ) ) ( not ( = ?auto_417164 ?auto_417169 ) ) ( not ( = ?auto_417164 ?auto_417170 ) ) ( not ( = ?auto_417164 ?auto_417171 ) ) ( not ( = ?auto_417165 ?auto_417166 ) ) ( not ( = ?auto_417165 ?auto_417167 ) ) ( not ( = ?auto_417165 ?auto_417168 ) ) ( not ( = ?auto_417165 ?auto_417169 ) ) ( not ( = ?auto_417165 ?auto_417170 ) ) ( not ( = ?auto_417165 ?auto_417171 ) ) ( not ( = ?auto_417166 ?auto_417167 ) ) ( not ( = ?auto_417166 ?auto_417168 ) ) ( not ( = ?auto_417166 ?auto_417169 ) ) ( not ( = ?auto_417166 ?auto_417170 ) ) ( not ( = ?auto_417166 ?auto_417171 ) ) ( not ( = ?auto_417167 ?auto_417168 ) ) ( not ( = ?auto_417167 ?auto_417169 ) ) ( not ( = ?auto_417167 ?auto_417170 ) ) ( not ( = ?auto_417167 ?auto_417171 ) ) ( not ( = ?auto_417168 ?auto_417169 ) ) ( not ( = ?auto_417168 ?auto_417170 ) ) ( not ( = ?auto_417168 ?auto_417171 ) ) ( not ( = ?auto_417169 ?auto_417170 ) ) ( not ( = ?auto_417169 ?auto_417171 ) ) ( not ( = ?auto_417170 ?auto_417171 ) ) ( CLEAR ?auto_417169 ) ( ON ?auto_417170 ?auto_417171 ) ( CLEAR ?auto_417170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_417157 ?auto_417158 ?auto_417159 ?auto_417160 ?auto_417161 ?auto_417162 ?auto_417163 ?auto_417164 ?auto_417165 ?auto_417166 ?auto_417167 ?auto_417168 ?auto_417169 ?auto_417170 )
      ( MAKE-15PILE ?auto_417157 ?auto_417158 ?auto_417159 ?auto_417160 ?auto_417161 ?auto_417162 ?auto_417163 ?auto_417164 ?auto_417165 ?auto_417166 ?auto_417167 ?auto_417168 ?auto_417169 ?auto_417170 ?auto_417171 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417187 - BLOCK
      ?auto_417188 - BLOCK
      ?auto_417189 - BLOCK
      ?auto_417190 - BLOCK
      ?auto_417191 - BLOCK
      ?auto_417192 - BLOCK
      ?auto_417193 - BLOCK
      ?auto_417194 - BLOCK
      ?auto_417195 - BLOCK
      ?auto_417196 - BLOCK
      ?auto_417197 - BLOCK
      ?auto_417198 - BLOCK
      ?auto_417199 - BLOCK
      ?auto_417200 - BLOCK
      ?auto_417201 - BLOCK
    )
    :vars
    (
      ?auto_417202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417201 ?auto_417202 ) ( ON-TABLE ?auto_417187 ) ( ON ?auto_417188 ?auto_417187 ) ( ON ?auto_417189 ?auto_417188 ) ( ON ?auto_417190 ?auto_417189 ) ( ON ?auto_417191 ?auto_417190 ) ( ON ?auto_417192 ?auto_417191 ) ( ON ?auto_417193 ?auto_417192 ) ( ON ?auto_417194 ?auto_417193 ) ( ON ?auto_417195 ?auto_417194 ) ( ON ?auto_417196 ?auto_417195 ) ( ON ?auto_417197 ?auto_417196 ) ( ON ?auto_417198 ?auto_417197 ) ( not ( = ?auto_417187 ?auto_417188 ) ) ( not ( = ?auto_417187 ?auto_417189 ) ) ( not ( = ?auto_417187 ?auto_417190 ) ) ( not ( = ?auto_417187 ?auto_417191 ) ) ( not ( = ?auto_417187 ?auto_417192 ) ) ( not ( = ?auto_417187 ?auto_417193 ) ) ( not ( = ?auto_417187 ?auto_417194 ) ) ( not ( = ?auto_417187 ?auto_417195 ) ) ( not ( = ?auto_417187 ?auto_417196 ) ) ( not ( = ?auto_417187 ?auto_417197 ) ) ( not ( = ?auto_417187 ?auto_417198 ) ) ( not ( = ?auto_417187 ?auto_417199 ) ) ( not ( = ?auto_417187 ?auto_417200 ) ) ( not ( = ?auto_417187 ?auto_417201 ) ) ( not ( = ?auto_417187 ?auto_417202 ) ) ( not ( = ?auto_417188 ?auto_417189 ) ) ( not ( = ?auto_417188 ?auto_417190 ) ) ( not ( = ?auto_417188 ?auto_417191 ) ) ( not ( = ?auto_417188 ?auto_417192 ) ) ( not ( = ?auto_417188 ?auto_417193 ) ) ( not ( = ?auto_417188 ?auto_417194 ) ) ( not ( = ?auto_417188 ?auto_417195 ) ) ( not ( = ?auto_417188 ?auto_417196 ) ) ( not ( = ?auto_417188 ?auto_417197 ) ) ( not ( = ?auto_417188 ?auto_417198 ) ) ( not ( = ?auto_417188 ?auto_417199 ) ) ( not ( = ?auto_417188 ?auto_417200 ) ) ( not ( = ?auto_417188 ?auto_417201 ) ) ( not ( = ?auto_417188 ?auto_417202 ) ) ( not ( = ?auto_417189 ?auto_417190 ) ) ( not ( = ?auto_417189 ?auto_417191 ) ) ( not ( = ?auto_417189 ?auto_417192 ) ) ( not ( = ?auto_417189 ?auto_417193 ) ) ( not ( = ?auto_417189 ?auto_417194 ) ) ( not ( = ?auto_417189 ?auto_417195 ) ) ( not ( = ?auto_417189 ?auto_417196 ) ) ( not ( = ?auto_417189 ?auto_417197 ) ) ( not ( = ?auto_417189 ?auto_417198 ) ) ( not ( = ?auto_417189 ?auto_417199 ) ) ( not ( = ?auto_417189 ?auto_417200 ) ) ( not ( = ?auto_417189 ?auto_417201 ) ) ( not ( = ?auto_417189 ?auto_417202 ) ) ( not ( = ?auto_417190 ?auto_417191 ) ) ( not ( = ?auto_417190 ?auto_417192 ) ) ( not ( = ?auto_417190 ?auto_417193 ) ) ( not ( = ?auto_417190 ?auto_417194 ) ) ( not ( = ?auto_417190 ?auto_417195 ) ) ( not ( = ?auto_417190 ?auto_417196 ) ) ( not ( = ?auto_417190 ?auto_417197 ) ) ( not ( = ?auto_417190 ?auto_417198 ) ) ( not ( = ?auto_417190 ?auto_417199 ) ) ( not ( = ?auto_417190 ?auto_417200 ) ) ( not ( = ?auto_417190 ?auto_417201 ) ) ( not ( = ?auto_417190 ?auto_417202 ) ) ( not ( = ?auto_417191 ?auto_417192 ) ) ( not ( = ?auto_417191 ?auto_417193 ) ) ( not ( = ?auto_417191 ?auto_417194 ) ) ( not ( = ?auto_417191 ?auto_417195 ) ) ( not ( = ?auto_417191 ?auto_417196 ) ) ( not ( = ?auto_417191 ?auto_417197 ) ) ( not ( = ?auto_417191 ?auto_417198 ) ) ( not ( = ?auto_417191 ?auto_417199 ) ) ( not ( = ?auto_417191 ?auto_417200 ) ) ( not ( = ?auto_417191 ?auto_417201 ) ) ( not ( = ?auto_417191 ?auto_417202 ) ) ( not ( = ?auto_417192 ?auto_417193 ) ) ( not ( = ?auto_417192 ?auto_417194 ) ) ( not ( = ?auto_417192 ?auto_417195 ) ) ( not ( = ?auto_417192 ?auto_417196 ) ) ( not ( = ?auto_417192 ?auto_417197 ) ) ( not ( = ?auto_417192 ?auto_417198 ) ) ( not ( = ?auto_417192 ?auto_417199 ) ) ( not ( = ?auto_417192 ?auto_417200 ) ) ( not ( = ?auto_417192 ?auto_417201 ) ) ( not ( = ?auto_417192 ?auto_417202 ) ) ( not ( = ?auto_417193 ?auto_417194 ) ) ( not ( = ?auto_417193 ?auto_417195 ) ) ( not ( = ?auto_417193 ?auto_417196 ) ) ( not ( = ?auto_417193 ?auto_417197 ) ) ( not ( = ?auto_417193 ?auto_417198 ) ) ( not ( = ?auto_417193 ?auto_417199 ) ) ( not ( = ?auto_417193 ?auto_417200 ) ) ( not ( = ?auto_417193 ?auto_417201 ) ) ( not ( = ?auto_417193 ?auto_417202 ) ) ( not ( = ?auto_417194 ?auto_417195 ) ) ( not ( = ?auto_417194 ?auto_417196 ) ) ( not ( = ?auto_417194 ?auto_417197 ) ) ( not ( = ?auto_417194 ?auto_417198 ) ) ( not ( = ?auto_417194 ?auto_417199 ) ) ( not ( = ?auto_417194 ?auto_417200 ) ) ( not ( = ?auto_417194 ?auto_417201 ) ) ( not ( = ?auto_417194 ?auto_417202 ) ) ( not ( = ?auto_417195 ?auto_417196 ) ) ( not ( = ?auto_417195 ?auto_417197 ) ) ( not ( = ?auto_417195 ?auto_417198 ) ) ( not ( = ?auto_417195 ?auto_417199 ) ) ( not ( = ?auto_417195 ?auto_417200 ) ) ( not ( = ?auto_417195 ?auto_417201 ) ) ( not ( = ?auto_417195 ?auto_417202 ) ) ( not ( = ?auto_417196 ?auto_417197 ) ) ( not ( = ?auto_417196 ?auto_417198 ) ) ( not ( = ?auto_417196 ?auto_417199 ) ) ( not ( = ?auto_417196 ?auto_417200 ) ) ( not ( = ?auto_417196 ?auto_417201 ) ) ( not ( = ?auto_417196 ?auto_417202 ) ) ( not ( = ?auto_417197 ?auto_417198 ) ) ( not ( = ?auto_417197 ?auto_417199 ) ) ( not ( = ?auto_417197 ?auto_417200 ) ) ( not ( = ?auto_417197 ?auto_417201 ) ) ( not ( = ?auto_417197 ?auto_417202 ) ) ( not ( = ?auto_417198 ?auto_417199 ) ) ( not ( = ?auto_417198 ?auto_417200 ) ) ( not ( = ?auto_417198 ?auto_417201 ) ) ( not ( = ?auto_417198 ?auto_417202 ) ) ( not ( = ?auto_417199 ?auto_417200 ) ) ( not ( = ?auto_417199 ?auto_417201 ) ) ( not ( = ?auto_417199 ?auto_417202 ) ) ( not ( = ?auto_417200 ?auto_417201 ) ) ( not ( = ?auto_417200 ?auto_417202 ) ) ( not ( = ?auto_417201 ?auto_417202 ) ) ( ON ?auto_417200 ?auto_417201 ) ( CLEAR ?auto_417198 ) ( ON ?auto_417199 ?auto_417200 ) ( CLEAR ?auto_417199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_417187 ?auto_417188 ?auto_417189 ?auto_417190 ?auto_417191 ?auto_417192 ?auto_417193 ?auto_417194 ?auto_417195 ?auto_417196 ?auto_417197 ?auto_417198 ?auto_417199 )
      ( MAKE-15PILE ?auto_417187 ?auto_417188 ?auto_417189 ?auto_417190 ?auto_417191 ?auto_417192 ?auto_417193 ?auto_417194 ?auto_417195 ?auto_417196 ?auto_417197 ?auto_417198 ?auto_417199 ?auto_417200 ?auto_417201 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417218 - BLOCK
      ?auto_417219 - BLOCK
      ?auto_417220 - BLOCK
      ?auto_417221 - BLOCK
      ?auto_417222 - BLOCK
      ?auto_417223 - BLOCK
      ?auto_417224 - BLOCK
      ?auto_417225 - BLOCK
      ?auto_417226 - BLOCK
      ?auto_417227 - BLOCK
      ?auto_417228 - BLOCK
      ?auto_417229 - BLOCK
      ?auto_417230 - BLOCK
      ?auto_417231 - BLOCK
      ?auto_417232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417232 ) ( ON-TABLE ?auto_417218 ) ( ON ?auto_417219 ?auto_417218 ) ( ON ?auto_417220 ?auto_417219 ) ( ON ?auto_417221 ?auto_417220 ) ( ON ?auto_417222 ?auto_417221 ) ( ON ?auto_417223 ?auto_417222 ) ( ON ?auto_417224 ?auto_417223 ) ( ON ?auto_417225 ?auto_417224 ) ( ON ?auto_417226 ?auto_417225 ) ( ON ?auto_417227 ?auto_417226 ) ( ON ?auto_417228 ?auto_417227 ) ( ON ?auto_417229 ?auto_417228 ) ( not ( = ?auto_417218 ?auto_417219 ) ) ( not ( = ?auto_417218 ?auto_417220 ) ) ( not ( = ?auto_417218 ?auto_417221 ) ) ( not ( = ?auto_417218 ?auto_417222 ) ) ( not ( = ?auto_417218 ?auto_417223 ) ) ( not ( = ?auto_417218 ?auto_417224 ) ) ( not ( = ?auto_417218 ?auto_417225 ) ) ( not ( = ?auto_417218 ?auto_417226 ) ) ( not ( = ?auto_417218 ?auto_417227 ) ) ( not ( = ?auto_417218 ?auto_417228 ) ) ( not ( = ?auto_417218 ?auto_417229 ) ) ( not ( = ?auto_417218 ?auto_417230 ) ) ( not ( = ?auto_417218 ?auto_417231 ) ) ( not ( = ?auto_417218 ?auto_417232 ) ) ( not ( = ?auto_417219 ?auto_417220 ) ) ( not ( = ?auto_417219 ?auto_417221 ) ) ( not ( = ?auto_417219 ?auto_417222 ) ) ( not ( = ?auto_417219 ?auto_417223 ) ) ( not ( = ?auto_417219 ?auto_417224 ) ) ( not ( = ?auto_417219 ?auto_417225 ) ) ( not ( = ?auto_417219 ?auto_417226 ) ) ( not ( = ?auto_417219 ?auto_417227 ) ) ( not ( = ?auto_417219 ?auto_417228 ) ) ( not ( = ?auto_417219 ?auto_417229 ) ) ( not ( = ?auto_417219 ?auto_417230 ) ) ( not ( = ?auto_417219 ?auto_417231 ) ) ( not ( = ?auto_417219 ?auto_417232 ) ) ( not ( = ?auto_417220 ?auto_417221 ) ) ( not ( = ?auto_417220 ?auto_417222 ) ) ( not ( = ?auto_417220 ?auto_417223 ) ) ( not ( = ?auto_417220 ?auto_417224 ) ) ( not ( = ?auto_417220 ?auto_417225 ) ) ( not ( = ?auto_417220 ?auto_417226 ) ) ( not ( = ?auto_417220 ?auto_417227 ) ) ( not ( = ?auto_417220 ?auto_417228 ) ) ( not ( = ?auto_417220 ?auto_417229 ) ) ( not ( = ?auto_417220 ?auto_417230 ) ) ( not ( = ?auto_417220 ?auto_417231 ) ) ( not ( = ?auto_417220 ?auto_417232 ) ) ( not ( = ?auto_417221 ?auto_417222 ) ) ( not ( = ?auto_417221 ?auto_417223 ) ) ( not ( = ?auto_417221 ?auto_417224 ) ) ( not ( = ?auto_417221 ?auto_417225 ) ) ( not ( = ?auto_417221 ?auto_417226 ) ) ( not ( = ?auto_417221 ?auto_417227 ) ) ( not ( = ?auto_417221 ?auto_417228 ) ) ( not ( = ?auto_417221 ?auto_417229 ) ) ( not ( = ?auto_417221 ?auto_417230 ) ) ( not ( = ?auto_417221 ?auto_417231 ) ) ( not ( = ?auto_417221 ?auto_417232 ) ) ( not ( = ?auto_417222 ?auto_417223 ) ) ( not ( = ?auto_417222 ?auto_417224 ) ) ( not ( = ?auto_417222 ?auto_417225 ) ) ( not ( = ?auto_417222 ?auto_417226 ) ) ( not ( = ?auto_417222 ?auto_417227 ) ) ( not ( = ?auto_417222 ?auto_417228 ) ) ( not ( = ?auto_417222 ?auto_417229 ) ) ( not ( = ?auto_417222 ?auto_417230 ) ) ( not ( = ?auto_417222 ?auto_417231 ) ) ( not ( = ?auto_417222 ?auto_417232 ) ) ( not ( = ?auto_417223 ?auto_417224 ) ) ( not ( = ?auto_417223 ?auto_417225 ) ) ( not ( = ?auto_417223 ?auto_417226 ) ) ( not ( = ?auto_417223 ?auto_417227 ) ) ( not ( = ?auto_417223 ?auto_417228 ) ) ( not ( = ?auto_417223 ?auto_417229 ) ) ( not ( = ?auto_417223 ?auto_417230 ) ) ( not ( = ?auto_417223 ?auto_417231 ) ) ( not ( = ?auto_417223 ?auto_417232 ) ) ( not ( = ?auto_417224 ?auto_417225 ) ) ( not ( = ?auto_417224 ?auto_417226 ) ) ( not ( = ?auto_417224 ?auto_417227 ) ) ( not ( = ?auto_417224 ?auto_417228 ) ) ( not ( = ?auto_417224 ?auto_417229 ) ) ( not ( = ?auto_417224 ?auto_417230 ) ) ( not ( = ?auto_417224 ?auto_417231 ) ) ( not ( = ?auto_417224 ?auto_417232 ) ) ( not ( = ?auto_417225 ?auto_417226 ) ) ( not ( = ?auto_417225 ?auto_417227 ) ) ( not ( = ?auto_417225 ?auto_417228 ) ) ( not ( = ?auto_417225 ?auto_417229 ) ) ( not ( = ?auto_417225 ?auto_417230 ) ) ( not ( = ?auto_417225 ?auto_417231 ) ) ( not ( = ?auto_417225 ?auto_417232 ) ) ( not ( = ?auto_417226 ?auto_417227 ) ) ( not ( = ?auto_417226 ?auto_417228 ) ) ( not ( = ?auto_417226 ?auto_417229 ) ) ( not ( = ?auto_417226 ?auto_417230 ) ) ( not ( = ?auto_417226 ?auto_417231 ) ) ( not ( = ?auto_417226 ?auto_417232 ) ) ( not ( = ?auto_417227 ?auto_417228 ) ) ( not ( = ?auto_417227 ?auto_417229 ) ) ( not ( = ?auto_417227 ?auto_417230 ) ) ( not ( = ?auto_417227 ?auto_417231 ) ) ( not ( = ?auto_417227 ?auto_417232 ) ) ( not ( = ?auto_417228 ?auto_417229 ) ) ( not ( = ?auto_417228 ?auto_417230 ) ) ( not ( = ?auto_417228 ?auto_417231 ) ) ( not ( = ?auto_417228 ?auto_417232 ) ) ( not ( = ?auto_417229 ?auto_417230 ) ) ( not ( = ?auto_417229 ?auto_417231 ) ) ( not ( = ?auto_417229 ?auto_417232 ) ) ( not ( = ?auto_417230 ?auto_417231 ) ) ( not ( = ?auto_417230 ?auto_417232 ) ) ( not ( = ?auto_417231 ?auto_417232 ) ) ( ON ?auto_417231 ?auto_417232 ) ( CLEAR ?auto_417229 ) ( ON ?auto_417230 ?auto_417231 ) ( CLEAR ?auto_417230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_417218 ?auto_417219 ?auto_417220 ?auto_417221 ?auto_417222 ?auto_417223 ?auto_417224 ?auto_417225 ?auto_417226 ?auto_417227 ?auto_417228 ?auto_417229 ?auto_417230 )
      ( MAKE-15PILE ?auto_417218 ?auto_417219 ?auto_417220 ?auto_417221 ?auto_417222 ?auto_417223 ?auto_417224 ?auto_417225 ?auto_417226 ?auto_417227 ?auto_417228 ?auto_417229 ?auto_417230 ?auto_417231 ?auto_417232 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417248 - BLOCK
      ?auto_417249 - BLOCK
      ?auto_417250 - BLOCK
      ?auto_417251 - BLOCK
      ?auto_417252 - BLOCK
      ?auto_417253 - BLOCK
      ?auto_417254 - BLOCK
      ?auto_417255 - BLOCK
      ?auto_417256 - BLOCK
      ?auto_417257 - BLOCK
      ?auto_417258 - BLOCK
      ?auto_417259 - BLOCK
      ?auto_417260 - BLOCK
      ?auto_417261 - BLOCK
      ?auto_417262 - BLOCK
    )
    :vars
    (
      ?auto_417263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417262 ?auto_417263 ) ( ON-TABLE ?auto_417248 ) ( ON ?auto_417249 ?auto_417248 ) ( ON ?auto_417250 ?auto_417249 ) ( ON ?auto_417251 ?auto_417250 ) ( ON ?auto_417252 ?auto_417251 ) ( ON ?auto_417253 ?auto_417252 ) ( ON ?auto_417254 ?auto_417253 ) ( ON ?auto_417255 ?auto_417254 ) ( ON ?auto_417256 ?auto_417255 ) ( ON ?auto_417257 ?auto_417256 ) ( ON ?auto_417258 ?auto_417257 ) ( not ( = ?auto_417248 ?auto_417249 ) ) ( not ( = ?auto_417248 ?auto_417250 ) ) ( not ( = ?auto_417248 ?auto_417251 ) ) ( not ( = ?auto_417248 ?auto_417252 ) ) ( not ( = ?auto_417248 ?auto_417253 ) ) ( not ( = ?auto_417248 ?auto_417254 ) ) ( not ( = ?auto_417248 ?auto_417255 ) ) ( not ( = ?auto_417248 ?auto_417256 ) ) ( not ( = ?auto_417248 ?auto_417257 ) ) ( not ( = ?auto_417248 ?auto_417258 ) ) ( not ( = ?auto_417248 ?auto_417259 ) ) ( not ( = ?auto_417248 ?auto_417260 ) ) ( not ( = ?auto_417248 ?auto_417261 ) ) ( not ( = ?auto_417248 ?auto_417262 ) ) ( not ( = ?auto_417248 ?auto_417263 ) ) ( not ( = ?auto_417249 ?auto_417250 ) ) ( not ( = ?auto_417249 ?auto_417251 ) ) ( not ( = ?auto_417249 ?auto_417252 ) ) ( not ( = ?auto_417249 ?auto_417253 ) ) ( not ( = ?auto_417249 ?auto_417254 ) ) ( not ( = ?auto_417249 ?auto_417255 ) ) ( not ( = ?auto_417249 ?auto_417256 ) ) ( not ( = ?auto_417249 ?auto_417257 ) ) ( not ( = ?auto_417249 ?auto_417258 ) ) ( not ( = ?auto_417249 ?auto_417259 ) ) ( not ( = ?auto_417249 ?auto_417260 ) ) ( not ( = ?auto_417249 ?auto_417261 ) ) ( not ( = ?auto_417249 ?auto_417262 ) ) ( not ( = ?auto_417249 ?auto_417263 ) ) ( not ( = ?auto_417250 ?auto_417251 ) ) ( not ( = ?auto_417250 ?auto_417252 ) ) ( not ( = ?auto_417250 ?auto_417253 ) ) ( not ( = ?auto_417250 ?auto_417254 ) ) ( not ( = ?auto_417250 ?auto_417255 ) ) ( not ( = ?auto_417250 ?auto_417256 ) ) ( not ( = ?auto_417250 ?auto_417257 ) ) ( not ( = ?auto_417250 ?auto_417258 ) ) ( not ( = ?auto_417250 ?auto_417259 ) ) ( not ( = ?auto_417250 ?auto_417260 ) ) ( not ( = ?auto_417250 ?auto_417261 ) ) ( not ( = ?auto_417250 ?auto_417262 ) ) ( not ( = ?auto_417250 ?auto_417263 ) ) ( not ( = ?auto_417251 ?auto_417252 ) ) ( not ( = ?auto_417251 ?auto_417253 ) ) ( not ( = ?auto_417251 ?auto_417254 ) ) ( not ( = ?auto_417251 ?auto_417255 ) ) ( not ( = ?auto_417251 ?auto_417256 ) ) ( not ( = ?auto_417251 ?auto_417257 ) ) ( not ( = ?auto_417251 ?auto_417258 ) ) ( not ( = ?auto_417251 ?auto_417259 ) ) ( not ( = ?auto_417251 ?auto_417260 ) ) ( not ( = ?auto_417251 ?auto_417261 ) ) ( not ( = ?auto_417251 ?auto_417262 ) ) ( not ( = ?auto_417251 ?auto_417263 ) ) ( not ( = ?auto_417252 ?auto_417253 ) ) ( not ( = ?auto_417252 ?auto_417254 ) ) ( not ( = ?auto_417252 ?auto_417255 ) ) ( not ( = ?auto_417252 ?auto_417256 ) ) ( not ( = ?auto_417252 ?auto_417257 ) ) ( not ( = ?auto_417252 ?auto_417258 ) ) ( not ( = ?auto_417252 ?auto_417259 ) ) ( not ( = ?auto_417252 ?auto_417260 ) ) ( not ( = ?auto_417252 ?auto_417261 ) ) ( not ( = ?auto_417252 ?auto_417262 ) ) ( not ( = ?auto_417252 ?auto_417263 ) ) ( not ( = ?auto_417253 ?auto_417254 ) ) ( not ( = ?auto_417253 ?auto_417255 ) ) ( not ( = ?auto_417253 ?auto_417256 ) ) ( not ( = ?auto_417253 ?auto_417257 ) ) ( not ( = ?auto_417253 ?auto_417258 ) ) ( not ( = ?auto_417253 ?auto_417259 ) ) ( not ( = ?auto_417253 ?auto_417260 ) ) ( not ( = ?auto_417253 ?auto_417261 ) ) ( not ( = ?auto_417253 ?auto_417262 ) ) ( not ( = ?auto_417253 ?auto_417263 ) ) ( not ( = ?auto_417254 ?auto_417255 ) ) ( not ( = ?auto_417254 ?auto_417256 ) ) ( not ( = ?auto_417254 ?auto_417257 ) ) ( not ( = ?auto_417254 ?auto_417258 ) ) ( not ( = ?auto_417254 ?auto_417259 ) ) ( not ( = ?auto_417254 ?auto_417260 ) ) ( not ( = ?auto_417254 ?auto_417261 ) ) ( not ( = ?auto_417254 ?auto_417262 ) ) ( not ( = ?auto_417254 ?auto_417263 ) ) ( not ( = ?auto_417255 ?auto_417256 ) ) ( not ( = ?auto_417255 ?auto_417257 ) ) ( not ( = ?auto_417255 ?auto_417258 ) ) ( not ( = ?auto_417255 ?auto_417259 ) ) ( not ( = ?auto_417255 ?auto_417260 ) ) ( not ( = ?auto_417255 ?auto_417261 ) ) ( not ( = ?auto_417255 ?auto_417262 ) ) ( not ( = ?auto_417255 ?auto_417263 ) ) ( not ( = ?auto_417256 ?auto_417257 ) ) ( not ( = ?auto_417256 ?auto_417258 ) ) ( not ( = ?auto_417256 ?auto_417259 ) ) ( not ( = ?auto_417256 ?auto_417260 ) ) ( not ( = ?auto_417256 ?auto_417261 ) ) ( not ( = ?auto_417256 ?auto_417262 ) ) ( not ( = ?auto_417256 ?auto_417263 ) ) ( not ( = ?auto_417257 ?auto_417258 ) ) ( not ( = ?auto_417257 ?auto_417259 ) ) ( not ( = ?auto_417257 ?auto_417260 ) ) ( not ( = ?auto_417257 ?auto_417261 ) ) ( not ( = ?auto_417257 ?auto_417262 ) ) ( not ( = ?auto_417257 ?auto_417263 ) ) ( not ( = ?auto_417258 ?auto_417259 ) ) ( not ( = ?auto_417258 ?auto_417260 ) ) ( not ( = ?auto_417258 ?auto_417261 ) ) ( not ( = ?auto_417258 ?auto_417262 ) ) ( not ( = ?auto_417258 ?auto_417263 ) ) ( not ( = ?auto_417259 ?auto_417260 ) ) ( not ( = ?auto_417259 ?auto_417261 ) ) ( not ( = ?auto_417259 ?auto_417262 ) ) ( not ( = ?auto_417259 ?auto_417263 ) ) ( not ( = ?auto_417260 ?auto_417261 ) ) ( not ( = ?auto_417260 ?auto_417262 ) ) ( not ( = ?auto_417260 ?auto_417263 ) ) ( not ( = ?auto_417261 ?auto_417262 ) ) ( not ( = ?auto_417261 ?auto_417263 ) ) ( not ( = ?auto_417262 ?auto_417263 ) ) ( ON ?auto_417261 ?auto_417262 ) ( ON ?auto_417260 ?auto_417261 ) ( CLEAR ?auto_417258 ) ( ON ?auto_417259 ?auto_417260 ) ( CLEAR ?auto_417259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_417248 ?auto_417249 ?auto_417250 ?auto_417251 ?auto_417252 ?auto_417253 ?auto_417254 ?auto_417255 ?auto_417256 ?auto_417257 ?auto_417258 ?auto_417259 )
      ( MAKE-15PILE ?auto_417248 ?auto_417249 ?auto_417250 ?auto_417251 ?auto_417252 ?auto_417253 ?auto_417254 ?auto_417255 ?auto_417256 ?auto_417257 ?auto_417258 ?auto_417259 ?auto_417260 ?auto_417261 ?auto_417262 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417279 - BLOCK
      ?auto_417280 - BLOCK
      ?auto_417281 - BLOCK
      ?auto_417282 - BLOCK
      ?auto_417283 - BLOCK
      ?auto_417284 - BLOCK
      ?auto_417285 - BLOCK
      ?auto_417286 - BLOCK
      ?auto_417287 - BLOCK
      ?auto_417288 - BLOCK
      ?auto_417289 - BLOCK
      ?auto_417290 - BLOCK
      ?auto_417291 - BLOCK
      ?auto_417292 - BLOCK
      ?auto_417293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417293 ) ( ON-TABLE ?auto_417279 ) ( ON ?auto_417280 ?auto_417279 ) ( ON ?auto_417281 ?auto_417280 ) ( ON ?auto_417282 ?auto_417281 ) ( ON ?auto_417283 ?auto_417282 ) ( ON ?auto_417284 ?auto_417283 ) ( ON ?auto_417285 ?auto_417284 ) ( ON ?auto_417286 ?auto_417285 ) ( ON ?auto_417287 ?auto_417286 ) ( ON ?auto_417288 ?auto_417287 ) ( ON ?auto_417289 ?auto_417288 ) ( not ( = ?auto_417279 ?auto_417280 ) ) ( not ( = ?auto_417279 ?auto_417281 ) ) ( not ( = ?auto_417279 ?auto_417282 ) ) ( not ( = ?auto_417279 ?auto_417283 ) ) ( not ( = ?auto_417279 ?auto_417284 ) ) ( not ( = ?auto_417279 ?auto_417285 ) ) ( not ( = ?auto_417279 ?auto_417286 ) ) ( not ( = ?auto_417279 ?auto_417287 ) ) ( not ( = ?auto_417279 ?auto_417288 ) ) ( not ( = ?auto_417279 ?auto_417289 ) ) ( not ( = ?auto_417279 ?auto_417290 ) ) ( not ( = ?auto_417279 ?auto_417291 ) ) ( not ( = ?auto_417279 ?auto_417292 ) ) ( not ( = ?auto_417279 ?auto_417293 ) ) ( not ( = ?auto_417280 ?auto_417281 ) ) ( not ( = ?auto_417280 ?auto_417282 ) ) ( not ( = ?auto_417280 ?auto_417283 ) ) ( not ( = ?auto_417280 ?auto_417284 ) ) ( not ( = ?auto_417280 ?auto_417285 ) ) ( not ( = ?auto_417280 ?auto_417286 ) ) ( not ( = ?auto_417280 ?auto_417287 ) ) ( not ( = ?auto_417280 ?auto_417288 ) ) ( not ( = ?auto_417280 ?auto_417289 ) ) ( not ( = ?auto_417280 ?auto_417290 ) ) ( not ( = ?auto_417280 ?auto_417291 ) ) ( not ( = ?auto_417280 ?auto_417292 ) ) ( not ( = ?auto_417280 ?auto_417293 ) ) ( not ( = ?auto_417281 ?auto_417282 ) ) ( not ( = ?auto_417281 ?auto_417283 ) ) ( not ( = ?auto_417281 ?auto_417284 ) ) ( not ( = ?auto_417281 ?auto_417285 ) ) ( not ( = ?auto_417281 ?auto_417286 ) ) ( not ( = ?auto_417281 ?auto_417287 ) ) ( not ( = ?auto_417281 ?auto_417288 ) ) ( not ( = ?auto_417281 ?auto_417289 ) ) ( not ( = ?auto_417281 ?auto_417290 ) ) ( not ( = ?auto_417281 ?auto_417291 ) ) ( not ( = ?auto_417281 ?auto_417292 ) ) ( not ( = ?auto_417281 ?auto_417293 ) ) ( not ( = ?auto_417282 ?auto_417283 ) ) ( not ( = ?auto_417282 ?auto_417284 ) ) ( not ( = ?auto_417282 ?auto_417285 ) ) ( not ( = ?auto_417282 ?auto_417286 ) ) ( not ( = ?auto_417282 ?auto_417287 ) ) ( not ( = ?auto_417282 ?auto_417288 ) ) ( not ( = ?auto_417282 ?auto_417289 ) ) ( not ( = ?auto_417282 ?auto_417290 ) ) ( not ( = ?auto_417282 ?auto_417291 ) ) ( not ( = ?auto_417282 ?auto_417292 ) ) ( not ( = ?auto_417282 ?auto_417293 ) ) ( not ( = ?auto_417283 ?auto_417284 ) ) ( not ( = ?auto_417283 ?auto_417285 ) ) ( not ( = ?auto_417283 ?auto_417286 ) ) ( not ( = ?auto_417283 ?auto_417287 ) ) ( not ( = ?auto_417283 ?auto_417288 ) ) ( not ( = ?auto_417283 ?auto_417289 ) ) ( not ( = ?auto_417283 ?auto_417290 ) ) ( not ( = ?auto_417283 ?auto_417291 ) ) ( not ( = ?auto_417283 ?auto_417292 ) ) ( not ( = ?auto_417283 ?auto_417293 ) ) ( not ( = ?auto_417284 ?auto_417285 ) ) ( not ( = ?auto_417284 ?auto_417286 ) ) ( not ( = ?auto_417284 ?auto_417287 ) ) ( not ( = ?auto_417284 ?auto_417288 ) ) ( not ( = ?auto_417284 ?auto_417289 ) ) ( not ( = ?auto_417284 ?auto_417290 ) ) ( not ( = ?auto_417284 ?auto_417291 ) ) ( not ( = ?auto_417284 ?auto_417292 ) ) ( not ( = ?auto_417284 ?auto_417293 ) ) ( not ( = ?auto_417285 ?auto_417286 ) ) ( not ( = ?auto_417285 ?auto_417287 ) ) ( not ( = ?auto_417285 ?auto_417288 ) ) ( not ( = ?auto_417285 ?auto_417289 ) ) ( not ( = ?auto_417285 ?auto_417290 ) ) ( not ( = ?auto_417285 ?auto_417291 ) ) ( not ( = ?auto_417285 ?auto_417292 ) ) ( not ( = ?auto_417285 ?auto_417293 ) ) ( not ( = ?auto_417286 ?auto_417287 ) ) ( not ( = ?auto_417286 ?auto_417288 ) ) ( not ( = ?auto_417286 ?auto_417289 ) ) ( not ( = ?auto_417286 ?auto_417290 ) ) ( not ( = ?auto_417286 ?auto_417291 ) ) ( not ( = ?auto_417286 ?auto_417292 ) ) ( not ( = ?auto_417286 ?auto_417293 ) ) ( not ( = ?auto_417287 ?auto_417288 ) ) ( not ( = ?auto_417287 ?auto_417289 ) ) ( not ( = ?auto_417287 ?auto_417290 ) ) ( not ( = ?auto_417287 ?auto_417291 ) ) ( not ( = ?auto_417287 ?auto_417292 ) ) ( not ( = ?auto_417287 ?auto_417293 ) ) ( not ( = ?auto_417288 ?auto_417289 ) ) ( not ( = ?auto_417288 ?auto_417290 ) ) ( not ( = ?auto_417288 ?auto_417291 ) ) ( not ( = ?auto_417288 ?auto_417292 ) ) ( not ( = ?auto_417288 ?auto_417293 ) ) ( not ( = ?auto_417289 ?auto_417290 ) ) ( not ( = ?auto_417289 ?auto_417291 ) ) ( not ( = ?auto_417289 ?auto_417292 ) ) ( not ( = ?auto_417289 ?auto_417293 ) ) ( not ( = ?auto_417290 ?auto_417291 ) ) ( not ( = ?auto_417290 ?auto_417292 ) ) ( not ( = ?auto_417290 ?auto_417293 ) ) ( not ( = ?auto_417291 ?auto_417292 ) ) ( not ( = ?auto_417291 ?auto_417293 ) ) ( not ( = ?auto_417292 ?auto_417293 ) ) ( ON ?auto_417292 ?auto_417293 ) ( ON ?auto_417291 ?auto_417292 ) ( CLEAR ?auto_417289 ) ( ON ?auto_417290 ?auto_417291 ) ( CLEAR ?auto_417290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_417279 ?auto_417280 ?auto_417281 ?auto_417282 ?auto_417283 ?auto_417284 ?auto_417285 ?auto_417286 ?auto_417287 ?auto_417288 ?auto_417289 ?auto_417290 )
      ( MAKE-15PILE ?auto_417279 ?auto_417280 ?auto_417281 ?auto_417282 ?auto_417283 ?auto_417284 ?auto_417285 ?auto_417286 ?auto_417287 ?auto_417288 ?auto_417289 ?auto_417290 ?auto_417291 ?auto_417292 ?auto_417293 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417309 - BLOCK
      ?auto_417310 - BLOCK
      ?auto_417311 - BLOCK
      ?auto_417312 - BLOCK
      ?auto_417313 - BLOCK
      ?auto_417314 - BLOCK
      ?auto_417315 - BLOCK
      ?auto_417316 - BLOCK
      ?auto_417317 - BLOCK
      ?auto_417318 - BLOCK
      ?auto_417319 - BLOCK
      ?auto_417320 - BLOCK
      ?auto_417321 - BLOCK
      ?auto_417322 - BLOCK
      ?auto_417323 - BLOCK
    )
    :vars
    (
      ?auto_417324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417323 ?auto_417324 ) ( ON-TABLE ?auto_417309 ) ( ON ?auto_417310 ?auto_417309 ) ( ON ?auto_417311 ?auto_417310 ) ( ON ?auto_417312 ?auto_417311 ) ( ON ?auto_417313 ?auto_417312 ) ( ON ?auto_417314 ?auto_417313 ) ( ON ?auto_417315 ?auto_417314 ) ( ON ?auto_417316 ?auto_417315 ) ( ON ?auto_417317 ?auto_417316 ) ( ON ?auto_417318 ?auto_417317 ) ( not ( = ?auto_417309 ?auto_417310 ) ) ( not ( = ?auto_417309 ?auto_417311 ) ) ( not ( = ?auto_417309 ?auto_417312 ) ) ( not ( = ?auto_417309 ?auto_417313 ) ) ( not ( = ?auto_417309 ?auto_417314 ) ) ( not ( = ?auto_417309 ?auto_417315 ) ) ( not ( = ?auto_417309 ?auto_417316 ) ) ( not ( = ?auto_417309 ?auto_417317 ) ) ( not ( = ?auto_417309 ?auto_417318 ) ) ( not ( = ?auto_417309 ?auto_417319 ) ) ( not ( = ?auto_417309 ?auto_417320 ) ) ( not ( = ?auto_417309 ?auto_417321 ) ) ( not ( = ?auto_417309 ?auto_417322 ) ) ( not ( = ?auto_417309 ?auto_417323 ) ) ( not ( = ?auto_417309 ?auto_417324 ) ) ( not ( = ?auto_417310 ?auto_417311 ) ) ( not ( = ?auto_417310 ?auto_417312 ) ) ( not ( = ?auto_417310 ?auto_417313 ) ) ( not ( = ?auto_417310 ?auto_417314 ) ) ( not ( = ?auto_417310 ?auto_417315 ) ) ( not ( = ?auto_417310 ?auto_417316 ) ) ( not ( = ?auto_417310 ?auto_417317 ) ) ( not ( = ?auto_417310 ?auto_417318 ) ) ( not ( = ?auto_417310 ?auto_417319 ) ) ( not ( = ?auto_417310 ?auto_417320 ) ) ( not ( = ?auto_417310 ?auto_417321 ) ) ( not ( = ?auto_417310 ?auto_417322 ) ) ( not ( = ?auto_417310 ?auto_417323 ) ) ( not ( = ?auto_417310 ?auto_417324 ) ) ( not ( = ?auto_417311 ?auto_417312 ) ) ( not ( = ?auto_417311 ?auto_417313 ) ) ( not ( = ?auto_417311 ?auto_417314 ) ) ( not ( = ?auto_417311 ?auto_417315 ) ) ( not ( = ?auto_417311 ?auto_417316 ) ) ( not ( = ?auto_417311 ?auto_417317 ) ) ( not ( = ?auto_417311 ?auto_417318 ) ) ( not ( = ?auto_417311 ?auto_417319 ) ) ( not ( = ?auto_417311 ?auto_417320 ) ) ( not ( = ?auto_417311 ?auto_417321 ) ) ( not ( = ?auto_417311 ?auto_417322 ) ) ( not ( = ?auto_417311 ?auto_417323 ) ) ( not ( = ?auto_417311 ?auto_417324 ) ) ( not ( = ?auto_417312 ?auto_417313 ) ) ( not ( = ?auto_417312 ?auto_417314 ) ) ( not ( = ?auto_417312 ?auto_417315 ) ) ( not ( = ?auto_417312 ?auto_417316 ) ) ( not ( = ?auto_417312 ?auto_417317 ) ) ( not ( = ?auto_417312 ?auto_417318 ) ) ( not ( = ?auto_417312 ?auto_417319 ) ) ( not ( = ?auto_417312 ?auto_417320 ) ) ( not ( = ?auto_417312 ?auto_417321 ) ) ( not ( = ?auto_417312 ?auto_417322 ) ) ( not ( = ?auto_417312 ?auto_417323 ) ) ( not ( = ?auto_417312 ?auto_417324 ) ) ( not ( = ?auto_417313 ?auto_417314 ) ) ( not ( = ?auto_417313 ?auto_417315 ) ) ( not ( = ?auto_417313 ?auto_417316 ) ) ( not ( = ?auto_417313 ?auto_417317 ) ) ( not ( = ?auto_417313 ?auto_417318 ) ) ( not ( = ?auto_417313 ?auto_417319 ) ) ( not ( = ?auto_417313 ?auto_417320 ) ) ( not ( = ?auto_417313 ?auto_417321 ) ) ( not ( = ?auto_417313 ?auto_417322 ) ) ( not ( = ?auto_417313 ?auto_417323 ) ) ( not ( = ?auto_417313 ?auto_417324 ) ) ( not ( = ?auto_417314 ?auto_417315 ) ) ( not ( = ?auto_417314 ?auto_417316 ) ) ( not ( = ?auto_417314 ?auto_417317 ) ) ( not ( = ?auto_417314 ?auto_417318 ) ) ( not ( = ?auto_417314 ?auto_417319 ) ) ( not ( = ?auto_417314 ?auto_417320 ) ) ( not ( = ?auto_417314 ?auto_417321 ) ) ( not ( = ?auto_417314 ?auto_417322 ) ) ( not ( = ?auto_417314 ?auto_417323 ) ) ( not ( = ?auto_417314 ?auto_417324 ) ) ( not ( = ?auto_417315 ?auto_417316 ) ) ( not ( = ?auto_417315 ?auto_417317 ) ) ( not ( = ?auto_417315 ?auto_417318 ) ) ( not ( = ?auto_417315 ?auto_417319 ) ) ( not ( = ?auto_417315 ?auto_417320 ) ) ( not ( = ?auto_417315 ?auto_417321 ) ) ( not ( = ?auto_417315 ?auto_417322 ) ) ( not ( = ?auto_417315 ?auto_417323 ) ) ( not ( = ?auto_417315 ?auto_417324 ) ) ( not ( = ?auto_417316 ?auto_417317 ) ) ( not ( = ?auto_417316 ?auto_417318 ) ) ( not ( = ?auto_417316 ?auto_417319 ) ) ( not ( = ?auto_417316 ?auto_417320 ) ) ( not ( = ?auto_417316 ?auto_417321 ) ) ( not ( = ?auto_417316 ?auto_417322 ) ) ( not ( = ?auto_417316 ?auto_417323 ) ) ( not ( = ?auto_417316 ?auto_417324 ) ) ( not ( = ?auto_417317 ?auto_417318 ) ) ( not ( = ?auto_417317 ?auto_417319 ) ) ( not ( = ?auto_417317 ?auto_417320 ) ) ( not ( = ?auto_417317 ?auto_417321 ) ) ( not ( = ?auto_417317 ?auto_417322 ) ) ( not ( = ?auto_417317 ?auto_417323 ) ) ( not ( = ?auto_417317 ?auto_417324 ) ) ( not ( = ?auto_417318 ?auto_417319 ) ) ( not ( = ?auto_417318 ?auto_417320 ) ) ( not ( = ?auto_417318 ?auto_417321 ) ) ( not ( = ?auto_417318 ?auto_417322 ) ) ( not ( = ?auto_417318 ?auto_417323 ) ) ( not ( = ?auto_417318 ?auto_417324 ) ) ( not ( = ?auto_417319 ?auto_417320 ) ) ( not ( = ?auto_417319 ?auto_417321 ) ) ( not ( = ?auto_417319 ?auto_417322 ) ) ( not ( = ?auto_417319 ?auto_417323 ) ) ( not ( = ?auto_417319 ?auto_417324 ) ) ( not ( = ?auto_417320 ?auto_417321 ) ) ( not ( = ?auto_417320 ?auto_417322 ) ) ( not ( = ?auto_417320 ?auto_417323 ) ) ( not ( = ?auto_417320 ?auto_417324 ) ) ( not ( = ?auto_417321 ?auto_417322 ) ) ( not ( = ?auto_417321 ?auto_417323 ) ) ( not ( = ?auto_417321 ?auto_417324 ) ) ( not ( = ?auto_417322 ?auto_417323 ) ) ( not ( = ?auto_417322 ?auto_417324 ) ) ( not ( = ?auto_417323 ?auto_417324 ) ) ( ON ?auto_417322 ?auto_417323 ) ( ON ?auto_417321 ?auto_417322 ) ( ON ?auto_417320 ?auto_417321 ) ( CLEAR ?auto_417318 ) ( ON ?auto_417319 ?auto_417320 ) ( CLEAR ?auto_417319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_417309 ?auto_417310 ?auto_417311 ?auto_417312 ?auto_417313 ?auto_417314 ?auto_417315 ?auto_417316 ?auto_417317 ?auto_417318 ?auto_417319 )
      ( MAKE-15PILE ?auto_417309 ?auto_417310 ?auto_417311 ?auto_417312 ?auto_417313 ?auto_417314 ?auto_417315 ?auto_417316 ?auto_417317 ?auto_417318 ?auto_417319 ?auto_417320 ?auto_417321 ?auto_417322 ?auto_417323 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417340 - BLOCK
      ?auto_417341 - BLOCK
      ?auto_417342 - BLOCK
      ?auto_417343 - BLOCK
      ?auto_417344 - BLOCK
      ?auto_417345 - BLOCK
      ?auto_417346 - BLOCK
      ?auto_417347 - BLOCK
      ?auto_417348 - BLOCK
      ?auto_417349 - BLOCK
      ?auto_417350 - BLOCK
      ?auto_417351 - BLOCK
      ?auto_417352 - BLOCK
      ?auto_417353 - BLOCK
      ?auto_417354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417354 ) ( ON-TABLE ?auto_417340 ) ( ON ?auto_417341 ?auto_417340 ) ( ON ?auto_417342 ?auto_417341 ) ( ON ?auto_417343 ?auto_417342 ) ( ON ?auto_417344 ?auto_417343 ) ( ON ?auto_417345 ?auto_417344 ) ( ON ?auto_417346 ?auto_417345 ) ( ON ?auto_417347 ?auto_417346 ) ( ON ?auto_417348 ?auto_417347 ) ( ON ?auto_417349 ?auto_417348 ) ( not ( = ?auto_417340 ?auto_417341 ) ) ( not ( = ?auto_417340 ?auto_417342 ) ) ( not ( = ?auto_417340 ?auto_417343 ) ) ( not ( = ?auto_417340 ?auto_417344 ) ) ( not ( = ?auto_417340 ?auto_417345 ) ) ( not ( = ?auto_417340 ?auto_417346 ) ) ( not ( = ?auto_417340 ?auto_417347 ) ) ( not ( = ?auto_417340 ?auto_417348 ) ) ( not ( = ?auto_417340 ?auto_417349 ) ) ( not ( = ?auto_417340 ?auto_417350 ) ) ( not ( = ?auto_417340 ?auto_417351 ) ) ( not ( = ?auto_417340 ?auto_417352 ) ) ( not ( = ?auto_417340 ?auto_417353 ) ) ( not ( = ?auto_417340 ?auto_417354 ) ) ( not ( = ?auto_417341 ?auto_417342 ) ) ( not ( = ?auto_417341 ?auto_417343 ) ) ( not ( = ?auto_417341 ?auto_417344 ) ) ( not ( = ?auto_417341 ?auto_417345 ) ) ( not ( = ?auto_417341 ?auto_417346 ) ) ( not ( = ?auto_417341 ?auto_417347 ) ) ( not ( = ?auto_417341 ?auto_417348 ) ) ( not ( = ?auto_417341 ?auto_417349 ) ) ( not ( = ?auto_417341 ?auto_417350 ) ) ( not ( = ?auto_417341 ?auto_417351 ) ) ( not ( = ?auto_417341 ?auto_417352 ) ) ( not ( = ?auto_417341 ?auto_417353 ) ) ( not ( = ?auto_417341 ?auto_417354 ) ) ( not ( = ?auto_417342 ?auto_417343 ) ) ( not ( = ?auto_417342 ?auto_417344 ) ) ( not ( = ?auto_417342 ?auto_417345 ) ) ( not ( = ?auto_417342 ?auto_417346 ) ) ( not ( = ?auto_417342 ?auto_417347 ) ) ( not ( = ?auto_417342 ?auto_417348 ) ) ( not ( = ?auto_417342 ?auto_417349 ) ) ( not ( = ?auto_417342 ?auto_417350 ) ) ( not ( = ?auto_417342 ?auto_417351 ) ) ( not ( = ?auto_417342 ?auto_417352 ) ) ( not ( = ?auto_417342 ?auto_417353 ) ) ( not ( = ?auto_417342 ?auto_417354 ) ) ( not ( = ?auto_417343 ?auto_417344 ) ) ( not ( = ?auto_417343 ?auto_417345 ) ) ( not ( = ?auto_417343 ?auto_417346 ) ) ( not ( = ?auto_417343 ?auto_417347 ) ) ( not ( = ?auto_417343 ?auto_417348 ) ) ( not ( = ?auto_417343 ?auto_417349 ) ) ( not ( = ?auto_417343 ?auto_417350 ) ) ( not ( = ?auto_417343 ?auto_417351 ) ) ( not ( = ?auto_417343 ?auto_417352 ) ) ( not ( = ?auto_417343 ?auto_417353 ) ) ( not ( = ?auto_417343 ?auto_417354 ) ) ( not ( = ?auto_417344 ?auto_417345 ) ) ( not ( = ?auto_417344 ?auto_417346 ) ) ( not ( = ?auto_417344 ?auto_417347 ) ) ( not ( = ?auto_417344 ?auto_417348 ) ) ( not ( = ?auto_417344 ?auto_417349 ) ) ( not ( = ?auto_417344 ?auto_417350 ) ) ( not ( = ?auto_417344 ?auto_417351 ) ) ( not ( = ?auto_417344 ?auto_417352 ) ) ( not ( = ?auto_417344 ?auto_417353 ) ) ( not ( = ?auto_417344 ?auto_417354 ) ) ( not ( = ?auto_417345 ?auto_417346 ) ) ( not ( = ?auto_417345 ?auto_417347 ) ) ( not ( = ?auto_417345 ?auto_417348 ) ) ( not ( = ?auto_417345 ?auto_417349 ) ) ( not ( = ?auto_417345 ?auto_417350 ) ) ( not ( = ?auto_417345 ?auto_417351 ) ) ( not ( = ?auto_417345 ?auto_417352 ) ) ( not ( = ?auto_417345 ?auto_417353 ) ) ( not ( = ?auto_417345 ?auto_417354 ) ) ( not ( = ?auto_417346 ?auto_417347 ) ) ( not ( = ?auto_417346 ?auto_417348 ) ) ( not ( = ?auto_417346 ?auto_417349 ) ) ( not ( = ?auto_417346 ?auto_417350 ) ) ( not ( = ?auto_417346 ?auto_417351 ) ) ( not ( = ?auto_417346 ?auto_417352 ) ) ( not ( = ?auto_417346 ?auto_417353 ) ) ( not ( = ?auto_417346 ?auto_417354 ) ) ( not ( = ?auto_417347 ?auto_417348 ) ) ( not ( = ?auto_417347 ?auto_417349 ) ) ( not ( = ?auto_417347 ?auto_417350 ) ) ( not ( = ?auto_417347 ?auto_417351 ) ) ( not ( = ?auto_417347 ?auto_417352 ) ) ( not ( = ?auto_417347 ?auto_417353 ) ) ( not ( = ?auto_417347 ?auto_417354 ) ) ( not ( = ?auto_417348 ?auto_417349 ) ) ( not ( = ?auto_417348 ?auto_417350 ) ) ( not ( = ?auto_417348 ?auto_417351 ) ) ( not ( = ?auto_417348 ?auto_417352 ) ) ( not ( = ?auto_417348 ?auto_417353 ) ) ( not ( = ?auto_417348 ?auto_417354 ) ) ( not ( = ?auto_417349 ?auto_417350 ) ) ( not ( = ?auto_417349 ?auto_417351 ) ) ( not ( = ?auto_417349 ?auto_417352 ) ) ( not ( = ?auto_417349 ?auto_417353 ) ) ( not ( = ?auto_417349 ?auto_417354 ) ) ( not ( = ?auto_417350 ?auto_417351 ) ) ( not ( = ?auto_417350 ?auto_417352 ) ) ( not ( = ?auto_417350 ?auto_417353 ) ) ( not ( = ?auto_417350 ?auto_417354 ) ) ( not ( = ?auto_417351 ?auto_417352 ) ) ( not ( = ?auto_417351 ?auto_417353 ) ) ( not ( = ?auto_417351 ?auto_417354 ) ) ( not ( = ?auto_417352 ?auto_417353 ) ) ( not ( = ?auto_417352 ?auto_417354 ) ) ( not ( = ?auto_417353 ?auto_417354 ) ) ( ON ?auto_417353 ?auto_417354 ) ( ON ?auto_417352 ?auto_417353 ) ( ON ?auto_417351 ?auto_417352 ) ( CLEAR ?auto_417349 ) ( ON ?auto_417350 ?auto_417351 ) ( CLEAR ?auto_417350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_417340 ?auto_417341 ?auto_417342 ?auto_417343 ?auto_417344 ?auto_417345 ?auto_417346 ?auto_417347 ?auto_417348 ?auto_417349 ?auto_417350 )
      ( MAKE-15PILE ?auto_417340 ?auto_417341 ?auto_417342 ?auto_417343 ?auto_417344 ?auto_417345 ?auto_417346 ?auto_417347 ?auto_417348 ?auto_417349 ?auto_417350 ?auto_417351 ?auto_417352 ?auto_417353 ?auto_417354 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417370 - BLOCK
      ?auto_417371 - BLOCK
      ?auto_417372 - BLOCK
      ?auto_417373 - BLOCK
      ?auto_417374 - BLOCK
      ?auto_417375 - BLOCK
      ?auto_417376 - BLOCK
      ?auto_417377 - BLOCK
      ?auto_417378 - BLOCK
      ?auto_417379 - BLOCK
      ?auto_417380 - BLOCK
      ?auto_417381 - BLOCK
      ?auto_417382 - BLOCK
      ?auto_417383 - BLOCK
      ?auto_417384 - BLOCK
    )
    :vars
    (
      ?auto_417385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417384 ?auto_417385 ) ( ON-TABLE ?auto_417370 ) ( ON ?auto_417371 ?auto_417370 ) ( ON ?auto_417372 ?auto_417371 ) ( ON ?auto_417373 ?auto_417372 ) ( ON ?auto_417374 ?auto_417373 ) ( ON ?auto_417375 ?auto_417374 ) ( ON ?auto_417376 ?auto_417375 ) ( ON ?auto_417377 ?auto_417376 ) ( ON ?auto_417378 ?auto_417377 ) ( not ( = ?auto_417370 ?auto_417371 ) ) ( not ( = ?auto_417370 ?auto_417372 ) ) ( not ( = ?auto_417370 ?auto_417373 ) ) ( not ( = ?auto_417370 ?auto_417374 ) ) ( not ( = ?auto_417370 ?auto_417375 ) ) ( not ( = ?auto_417370 ?auto_417376 ) ) ( not ( = ?auto_417370 ?auto_417377 ) ) ( not ( = ?auto_417370 ?auto_417378 ) ) ( not ( = ?auto_417370 ?auto_417379 ) ) ( not ( = ?auto_417370 ?auto_417380 ) ) ( not ( = ?auto_417370 ?auto_417381 ) ) ( not ( = ?auto_417370 ?auto_417382 ) ) ( not ( = ?auto_417370 ?auto_417383 ) ) ( not ( = ?auto_417370 ?auto_417384 ) ) ( not ( = ?auto_417370 ?auto_417385 ) ) ( not ( = ?auto_417371 ?auto_417372 ) ) ( not ( = ?auto_417371 ?auto_417373 ) ) ( not ( = ?auto_417371 ?auto_417374 ) ) ( not ( = ?auto_417371 ?auto_417375 ) ) ( not ( = ?auto_417371 ?auto_417376 ) ) ( not ( = ?auto_417371 ?auto_417377 ) ) ( not ( = ?auto_417371 ?auto_417378 ) ) ( not ( = ?auto_417371 ?auto_417379 ) ) ( not ( = ?auto_417371 ?auto_417380 ) ) ( not ( = ?auto_417371 ?auto_417381 ) ) ( not ( = ?auto_417371 ?auto_417382 ) ) ( not ( = ?auto_417371 ?auto_417383 ) ) ( not ( = ?auto_417371 ?auto_417384 ) ) ( not ( = ?auto_417371 ?auto_417385 ) ) ( not ( = ?auto_417372 ?auto_417373 ) ) ( not ( = ?auto_417372 ?auto_417374 ) ) ( not ( = ?auto_417372 ?auto_417375 ) ) ( not ( = ?auto_417372 ?auto_417376 ) ) ( not ( = ?auto_417372 ?auto_417377 ) ) ( not ( = ?auto_417372 ?auto_417378 ) ) ( not ( = ?auto_417372 ?auto_417379 ) ) ( not ( = ?auto_417372 ?auto_417380 ) ) ( not ( = ?auto_417372 ?auto_417381 ) ) ( not ( = ?auto_417372 ?auto_417382 ) ) ( not ( = ?auto_417372 ?auto_417383 ) ) ( not ( = ?auto_417372 ?auto_417384 ) ) ( not ( = ?auto_417372 ?auto_417385 ) ) ( not ( = ?auto_417373 ?auto_417374 ) ) ( not ( = ?auto_417373 ?auto_417375 ) ) ( not ( = ?auto_417373 ?auto_417376 ) ) ( not ( = ?auto_417373 ?auto_417377 ) ) ( not ( = ?auto_417373 ?auto_417378 ) ) ( not ( = ?auto_417373 ?auto_417379 ) ) ( not ( = ?auto_417373 ?auto_417380 ) ) ( not ( = ?auto_417373 ?auto_417381 ) ) ( not ( = ?auto_417373 ?auto_417382 ) ) ( not ( = ?auto_417373 ?auto_417383 ) ) ( not ( = ?auto_417373 ?auto_417384 ) ) ( not ( = ?auto_417373 ?auto_417385 ) ) ( not ( = ?auto_417374 ?auto_417375 ) ) ( not ( = ?auto_417374 ?auto_417376 ) ) ( not ( = ?auto_417374 ?auto_417377 ) ) ( not ( = ?auto_417374 ?auto_417378 ) ) ( not ( = ?auto_417374 ?auto_417379 ) ) ( not ( = ?auto_417374 ?auto_417380 ) ) ( not ( = ?auto_417374 ?auto_417381 ) ) ( not ( = ?auto_417374 ?auto_417382 ) ) ( not ( = ?auto_417374 ?auto_417383 ) ) ( not ( = ?auto_417374 ?auto_417384 ) ) ( not ( = ?auto_417374 ?auto_417385 ) ) ( not ( = ?auto_417375 ?auto_417376 ) ) ( not ( = ?auto_417375 ?auto_417377 ) ) ( not ( = ?auto_417375 ?auto_417378 ) ) ( not ( = ?auto_417375 ?auto_417379 ) ) ( not ( = ?auto_417375 ?auto_417380 ) ) ( not ( = ?auto_417375 ?auto_417381 ) ) ( not ( = ?auto_417375 ?auto_417382 ) ) ( not ( = ?auto_417375 ?auto_417383 ) ) ( not ( = ?auto_417375 ?auto_417384 ) ) ( not ( = ?auto_417375 ?auto_417385 ) ) ( not ( = ?auto_417376 ?auto_417377 ) ) ( not ( = ?auto_417376 ?auto_417378 ) ) ( not ( = ?auto_417376 ?auto_417379 ) ) ( not ( = ?auto_417376 ?auto_417380 ) ) ( not ( = ?auto_417376 ?auto_417381 ) ) ( not ( = ?auto_417376 ?auto_417382 ) ) ( not ( = ?auto_417376 ?auto_417383 ) ) ( not ( = ?auto_417376 ?auto_417384 ) ) ( not ( = ?auto_417376 ?auto_417385 ) ) ( not ( = ?auto_417377 ?auto_417378 ) ) ( not ( = ?auto_417377 ?auto_417379 ) ) ( not ( = ?auto_417377 ?auto_417380 ) ) ( not ( = ?auto_417377 ?auto_417381 ) ) ( not ( = ?auto_417377 ?auto_417382 ) ) ( not ( = ?auto_417377 ?auto_417383 ) ) ( not ( = ?auto_417377 ?auto_417384 ) ) ( not ( = ?auto_417377 ?auto_417385 ) ) ( not ( = ?auto_417378 ?auto_417379 ) ) ( not ( = ?auto_417378 ?auto_417380 ) ) ( not ( = ?auto_417378 ?auto_417381 ) ) ( not ( = ?auto_417378 ?auto_417382 ) ) ( not ( = ?auto_417378 ?auto_417383 ) ) ( not ( = ?auto_417378 ?auto_417384 ) ) ( not ( = ?auto_417378 ?auto_417385 ) ) ( not ( = ?auto_417379 ?auto_417380 ) ) ( not ( = ?auto_417379 ?auto_417381 ) ) ( not ( = ?auto_417379 ?auto_417382 ) ) ( not ( = ?auto_417379 ?auto_417383 ) ) ( not ( = ?auto_417379 ?auto_417384 ) ) ( not ( = ?auto_417379 ?auto_417385 ) ) ( not ( = ?auto_417380 ?auto_417381 ) ) ( not ( = ?auto_417380 ?auto_417382 ) ) ( not ( = ?auto_417380 ?auto_417383 ) ) ( not ( = ?auto_417380 ?auto_417384 ) ) ( not ( = ?auto_417380 ?auto_417385 ) ) ( not ( = ?auto_417381 ?auto_417382 ) ) ( not ( = ?auto_417381 ?auto_417383 ) ) ( not ( = ?auto_417381 ?auto_417384 ) ) ( not ( = ?auto_417381 ?auto_417385 ) ) ( not ( = ?auto_417382 ?auto_417383 ) ) ( not ( = ?auto_417382 ?auto_417384 ) ) ( not ( = ?auto_417382 ?auto_417385 ) ) ( not ( = ?auto_417383 ?auto_417384 ) ) ( not ( = ?auto_417383 ?auto_417385 ) ) ( not ( = ?auto_417384 ?auto_417385 ) ) ( ON ?auto_417383 ?auto_417384 ) ( ON ?auto_417382 ?auto_417383 ) ( ON ?auto_417381 ?auto_417382 ) ( ON ?auto_417380 ?auto_417381 ) ( CLEAR ?auto_417378 ) ( ON ?auto_417379 ?auto_417380 ) ( CLEAR ?auto_417379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_417370 ?auto_417371 ?auto_417372 ?auto_417373 ?auto_417374 ?auto_417375 ?auto_417376 ?auto_417377 ?auto_417378 ?auto_417379 )
      ( MAKE-15PILE ?auto_417370 ?auto_417371 ?auto_417372 ?auto_417373 ?auto_417374 ?auto_417375 ?auto_417376 ?auto_417377 ?auto_417378 ?auto_417379 ?auto_417380 ?auto_417381 ?auto_417382 ?auto_417383 ?auto_417384 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417401 - BLOCK
      ?auto_417402 - BLOCK
      ?auto_417403 - BLOCK
      ?auto_417404 - BLOCK
      ?auto_417405 - BLOCK
      ?auto_417406 - BLOCK
      ?auto_417407 - BLOCK
      ?auto_417408 - BLOCK
      ?auto_417409 - BLOCK
      ?auto_417410 - BLOCK
      ?auto_417411 - BLOCK
      ?auto_417412 - BLOCK
      ?auto_417413 - BLOCK
      ?auto_417414 - BLOCK
      ?auto_417415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417415 ) ( ON-TABLE ?auto_417401 ) ( ON ?auto_417402 ?auto_417401 ) ( ON ?auto_417403 ?auto_417402 ) ( ON ?auto_417404 ?auto_417403 ) ( ON ?auto_417405 ?auto_417404 ) ( ON ?auto_417406 ?auto_417405 ) ( ON ?auto_417407 ?auto_417406 ) ( ON ?auto_417408 ?auto_417407 ) ( ON ?auto_417409 ?auto_417408 ) ( not ( = ?auto_417401 ?auto_417402 ) ) ( not ( = ?auto_417401 ?auto_417403 ) ) ( not ( = ?auto_417401 ?auto_417404 ) ) ( not ( = ?auto_417401 ?auto_417405 ) ) ( not ( = ?auto_417401 ?auto_417406 ) ) ( not ( = ?auto_417401 ?auto_417407 ) ) ( not ( = ?auto_417401 ?auto_417408 ) ) ( not ( = ?auto_417401 ?auto_417409 ) ) ( not ( = ?auto_417401 ?auto_417410 ) ) ( not ( = ?auto_417401 ?auto_417411 ) ) ( not ( = ?auto_417401 ?auto_417412 ) ) ( not ( = ?auto_417401 ?auto_417413 ) ) ( not ( = ?auto_417401 ?auto_417414 ) ) ( not ( = ?auto_417401 ?auto_417415 ) ) ( not ( = ?auto_417402 ?auto_417403 ) ) ( not ( = ?auto_417402 ?auto_417404 ) ) ( not ( = ?auto_417402 ?auto_417405 ) ) ( not ( = ?auto_417402 ?auto_417406 ) ) ( not ( = ?auto_417402 ?auto_417407 ) ) ( not ( = ?auto_417402 ?auto_417408 ) ) ( not ( = ?auto_417402 ?auto_417409 ) ) ( not ( = ?auto_417402 ?auto_417410 ) ) ( not ( = ?auto_417402 ?auto_417411 ) ) ( not ( = ?auto_417402 ?auto_417412 ) ) ( not ( = ?auto_417402 ?auto_417413 ) ) ( not ( = ?auto_417402 ?auto_417414 ) ) ( not ( = ?auto_417402 ?auto_417415 ) ) ( not ( = ?auto_417403 ?auto_417404 ) ) ( not ( = ?auto_417403 ?auto_417405 ) ) ( not ( = ?auto_417403 ?auto_417406 ) ) ( not ( = ?auto_417403 ?auto_417407 ) ) ( not ( = ?auto_417403 ?auto_417408 ) ) ( not ( = ?auto_417403 ?auto_417409 ) ) ( not ( = ?auto_417403 ?auto_417410 ) ) ( not ( = ?auto_417403 ?auto_417411 ) ) ( not ( = ?auto_417403 ?auto_417412 ) ) ( not ( = ?auto_417403 ?auto_417413 ) ) ( not ( = ?auto_417403 ?auto_417414 ) ) ( not ( = ?auto_417403 ?auto_417415 ) ) ( not ( = ?auto_417404 ?auto_417405 ) ) ( not ( = ?auto_417404 ?auto_417406 ) ) ( not ( = ?auto_417404 ?auto_417407 ) ) ( not ( = ?auto_417404 ?auto_417408 ) ) ( not ( = ?auto_417404 ?auto_417409 ) ) ( not ( = ?auto_417404 ?auto_417410 ) ) ( not ( = ?auto_417404 ?auto_417411 ) ) ( not ( = ?auto_417404 ?auto_417412 ) ) ( not ( = ?auto_417404 ?auto_417413 ) ) ( not ( = ?auto_417404 ?auto_417414 ) ) ( not ( = ?auto_417404 ?auto_417415 ) ) ( not ( = ?auto_417405 ?auto_417406 ) ) ( not ( = ?auto_417405 ?auto_417407 ) ) ( not ( = ?auto_417405 ?auto_417408 ) ) ( not ( = ?auto_417405 ?auto_417409 ) ) ( not ( = ?auto_417405 ?auto_417410 ) ) ( not ( = ?auto_417405 ?auto_417411 ) ) ( not ( = ?auto_417405 ?auto_417412 ) ) ( not ( = ?auto_417405 ?auto_417413 ) ) ( not ( = ?auto_417405 ?auto_417414 ) ) ( not ( = ?auto_417405 ?auto_417415 ) ) ( not ( = ?auto_417406 ?auto_417407 ) ) ( not ( = ?auto_417406 ?auto_417408 ) ) ( not ( = ?auto_417406 ?auto_417409 ) ) ( not ( = ?auto_417406 ?auto_417410 ) ) ( not ( = ?auto_417406 ?auto_417411 ) ) ( not ( = ?auto_417406 ?auto_417412 ) ) ( not ( = ?auto_417406 ?auto_417413 ) ) ( not ( = ?auto_417406 ?auto_417414 ) ) ( not ( = ?auto_417406 ?auto_417415 ) ) ( not ( = ?auto_417407 ?auto_417408 ) ) ( not ( = ?auto_417407 ?auto_417409 ) ) ( not ( = ?auto_417407 ?auto_417410 ) ) ( not ( = ?auto_417407 ?auto_417411 ) ) ( not ( = ?auto_417407 ?auto_417412 ) ) ( not ( = ?auto_417407 ?auto_417413 ) ) ( not ( = ?auto_417407 ?auto_417414 ) ) ( not ( = ?auto_417407 ?auto_417415 ) ) ( not ( = ?auto_417408 ?auto_417409 ) ) ( not ( = ?auto_417408 ?auto_417410 ) ) ( not ( = ?auto_417408 ?auto_417411 ) ) ( not ( = ?auto_417408 ?auto_417412 ) ) ( not ( = ?auto_417408 ?auto_417413 ) ) ( not ( = ?auto_417408 ?auto_417414 ) ) ( not ( = ?auto_417408 ?auto_417415 ) ) ( not ( = ?auto_417409 ?auto_417410 ) ) ( not ( = ?auto_417409 ?auto_417411 ) ) ( not ( = ?auto_417409 ?auto_417412 ) ) ( not ( = ?auto_417409 ?auto_417413 ) ) ( not ( = ?auto_417409 ?auto_417414 ) ) ( not ( = ?auto_417409 ?auto_417415 ) ) ( not ( = ?auto_417410 ?auto_417411 ) ) ( not ( = ?auto_417410 ?auto_417412 ) ) ( not ( = ?auto_417410 ?auto_417413 ) ) ( not ( = ?auto_417410 ?auto_417414 ) ) ( not ( = ?auto_417410 ?auto_417415 ) ) ( not ( = ?auto_417411 ?auto_417412 ) ) ( not ( = ?auto_417411 ?auto_417413 ) ) ( not ( = ?auto_417411 ?auto_417414 ) ) ( not ( = ?auto_417411 ?auto_417415 ) ) ( not ( = ?auto_417412 ?auto_417413 ) ) ( not ( = ?auto_417412 ?auto_417414 ) ) ( not ( = ?auto_417412 ?auto_417415 ) ) ( not ( = ?auto_417413 ?auto_417414 ) ) ( not ( = ?auto_417413 ?auto_417415 ) ) ( not ( = ?auto_417414 ?auto_417415 ) ) ( ON ?auto_417414 ?auto_417415 ) ( ON ?auto_417413 ?auto_417414 ) ( ON ?auto_417412 ?auto_417413 ) ( ON ?auto_417411 ?auto_417412 ) ( CLEAR ?auto_417409 ) ( ON ?auto_417410 ?auto_417411 ) ( CLEAR ?auto_417410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_417401 ?auto_417402 ?auto_417403 ?auto_417404 ?auto_417405 ?auto_417406 ?auto_417407 ?auto_417408 ?auto_417409 ?auto_417410 )
      ( MAKE-15PILE ?auto_417401 ?auto_417402 ?auto_417403 ?auto_417404 ?auto_417405 ?auto_417406 ?auto_417407 ?auto_417408 ?auto_417409 ?auto_417410 ?auto_417411 ?auto_417412 ?auto_417413 ?auto_417414 ?auto_417415 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417431 - BLOCK
      ?auto_417432 - BLOCK
      ?auto_417433 - BLOCK
      ?auto_417434 - BLOCK
      ?auto_417435 - BLOCK
      ?auto_417436 - BLOCK
      ?auto_417437 - BLOCK
      ?auto_417438 - BLOCK
      ?auto_417439 - BLOCK
      ?auto_417440 - BLOCK
      ?auto_417441 - BLOCK
      ?auto_417442 - BLOCK
      ?auto_417443 - BLOCK
      ?auto_417444 - BLOCK
      ?auto_417445 - BLOCK
    )
    :vars
    (
      ?auto_417446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417445 ?auto_417446 ) ( ON-TABLE ?auto_417431 ) ( ON ?auto_417432 ?auto_417431 ) ( ON ?auto_417433 ?auto_417432 ) ( ON ?auto_417434 ?auto_417433 ) ( ON ?auto_417435 ?auto_417434 ) ( ON ?auto_417436 ?auto_417435 ) ( ON ?auto_417437 ?auto_417436 ) ( ON ?auto_417438 ?auto_417437 ) ( not ( = ?auto_417431 ?auto_417432 ) ) ( not ( = ?auto_417431 ?auto_417433 ) ) ( not ( = ?auto_417431 ?auto_417434 ) ) ( not ( = ?auto_417431 ?auto_417435 ) ) ( not ( = ?auto_417431 ?auto_417436 ) ) ( not ( = ?auto_417431 ?auto_417437 ) ) ( not ( = ?auto_417431 ?auto_417438 ) ) ( not ( = ?auto_417431 ?auto_417439 ) ) ( not ( = ?auto_417431 ?auto_417440 ) ) ( not ( = ?auto_417431 ?auto_417441 ) ) ( not ( = ?auto_417431 ?auto_417442 ) ) ( not ( = ?auto_417431 ?auto_417443 ) ) ( not ( = ?auto_417431 ?auto_417444 ) ) ( not ( = ?auto_417431 ?auto_417445 ) ) ( not ( = ?auto_417431 ?auto_417446 ) ) ( not ( = ?auto_417432 ?auto_417433 ) ) ( not ( = ?auto_417432 ?auto_417434 ) ) ( not ( = ?auto_417432 ?auto_417435 ) ) ( not ( = ?auto_417432 ?auto_417436 ) ) ( not ( = ?auto_417432 ?auto_417437 ) ) ( not ( = ?auto_417432 ?auto_417438 ) ) ( not ( = ?auto_417432 ?auto_417439 ) ) ( not ( = ?auto_417432 ?auto_417440 ) ) ( not ( = ?auto_417432 ?auto_417441 ) ) ( not ( = ?auto_417432 ?auto_417442 ) ) ( not ( = ?auto_417432 ?auto_417443 ) ) ( not ( = ?auto_417432 ?auto_417444 ) ) ( not ( = ?auto_417432 ?auto_417445 ) ) ( not ( = ?auto_417432 ?auto_417446 ) ) ( not ( = ?auto_417433 ?auto_417434 ) ) ( not ( = ?auto_417433 ?auto_417435 ) ) ( not ( = ?auto_417433 ?auto_417436 ) ) ( not ( = ?auto_417433 ?auto_417437 ) ) ( not ( = ?auto_417433 ?auto_417438 ) ) ( not ( = ?auto_417433 ?auto_417439 ) ) ( not ( = ?auto_417433 ?auto_417440 ) ) ( not ( = ?auto_417433 ?auto_417441 ) ) ( not ( = ?auto_417433 ?auto_417442 ) ) ( not ( = ?auto_417433 ?auto_417443 ) ) ( not ( = ?auto_417433 ?auto_417444 ) ) ( not ( = ?auto_417433 ?auto_417445 ) ) ( not ( = ?auto_417433 ?auto_417446 ) ) ( not ( = ?auto_417434 ?auto_417435 ) ) ( not ( = ?auto_417434 ?auto_417436 ) ) ( not ( = ?auto_417434 ?auto_417437 ) ) ( not ( = ?auto_417434 ?auto_417438 ) ) ( not ( = ?auto_417434 ?auto_417439 ) ) ( not ( = ?auto_417434 ?auto_417440 ) ) ( not ( = ?auto_417434 ?auto_417441 ) ) ( not ( = ?auto_417434 ?auto_417442 ) ) ( not ( = ?auto_417434 ?auto_417443 ) ) ( not ( = ?auto_417434 ?auto_417444 ) ) ( not ( = ?auto_417434 ?auto_417445 ) ) ( not ( = ?auto_417434 ?auto_417446 ) ) ( not ( = ?auto_417435 ?auto_417436 ) ) ( not ( = ?auto_417435 ?auto_417437 ) ) ( not ( = ?auto_417435 ?auto_417438 ) ) ( not ( = ?auto_417435 ?auto_417439 ) ) ( not ( = ?auto_417435 ?auto_417440 ) ) ( not ( = ?auto_417435 ?auto_417441 ) ) ( not ( = ?auto_417435 ?auto_417442 ) ) ( not ( = ?auto_417435 ?auto_417443 ) ) ( not ( = ?auto_417435 ?auto_417444 ) ) ( not ( = ?auto_417435 ?auto_417445 ) ) ( not ( = ?auto_417435 ?auto_417446 ) ) ( not ( = ?auto_417436 ?auto_417437 ) ) ( not ( = ?auto_417436 ?auto_417438 ) ) ( not ( = ?auto_417436 ?auto_417439 ) ) ( not ( = ?auto_417436 ?auto_417440 ) ) ( not ( = ?auto_417436 ?auto_417441 ) ) ( not ( = ?auto_417436 ?auto_417442 ) ) ( not ( = ?auto_417436 ?auto_417443 ) ) ( not ( = ?auto_417436 ?auto_417444 ) ) ( not ( = ?auto_417436 ?auto_417445 ) ) ( not ( = ?auto_417436 ?auto_417446 ) ) ( not ( = ?auto_417437 ?auto_417438 ) ) ( not ( = ?auto_417437 ?auto_417439 ) ) ( not ( = ?auto_417437 ?auto_417440 ) ) ( not ( = ?auto_417437 ?auto_417441 ) ) ( not ( = ?auto_417437 ?auto_417442 ) ) ( not ( = ?auto_417437 ?auto_417443 ) ) ( not ( = ?auto_417437 ?auto_417444 ) ) ( not ( = ?auto_417437 ?auto_417445 ) ) ( not ( = ?auto_417437 ?auto_417446 ) ) ( not ( = ?auto_417438 ?auto_417439 ) ) ( not ( = ?auto_417438 ?auto_417440 ) ) ( not ( = ?auto_417438 ?auto_417441 ) ) ( not ( = ?auto_417438 ?auto_417442 ) ) ( not ( = ?auto_417438 ?auto_417443 ) ) ( not ( = ?auto_417438 ?auto_417444 ) ) ( not ( = ?auto_417438 ?auto_417445 ) ) ( not ( = ?auto_417438 ?auto_417446 ) ) ( not ( = ?auto_417439 ?auto_417440 ) ) ( not ( = ?auto_417439 ?auto_417441 ) ) ( not ( = ?auto_417439 ?auto_417442 ) ) ( not ( = ?auto_417439 ?auto_417443 ) ) ( not ( = ?auto_417439 ?auto_417444 ) ) ( not ( = ?auto_417439 ?auto_417445 ) ) ( not ( = ?auto_417439 ?auto_417446 ) ) ( not ( = ?auto_417440 ?auto_417441 ) ) ( not ( = ?auto_417440 ?auto_417442 ) ) ( not ( = ?auto_417440 ?auto_417443 ) ) ( not ( = ?auto_417440 ?auto_417444 ) ) ( not ( = ?auto_417440 ?auto_417445 ) ) ( not ( = ?auto_417440 ?auto_417446 ) ) ( not ( = ?auto_417441 ?auto_417442 ) ) ( not ( = ?auto_417441 ?auto_417443 ) ) ( not ( = ?auto_417441 ?auto_417444 ) ) ( not ( = ?auto_417441 ?auto_417445 ) ) ( not ( = ?auto_417441 ?auto_417446 ) ) ( not ( = ?auto_417442 ?auto_417443 ) ) ( not ( = ?auto_417442 ?auto_417444 ) ) ( not ( = ?auto_417442 ?auto_417445 ) ) ( not ( = ?auto_417442 ?auto_417446 ) ) ( not ( = ?auto_417443 ?auto_417444 ) ) ( not ( = ?auto_417443 ?auto_417445 ) ) ( not ( = ?auto_417443 ?auto_417446 ) ) ( not ( = ?auto_417444 ?auto_417445 ) ) ( not ( = ?auto_417444 ?auto_417446 ) ) ( not ( = ?auto_417445 ?auto_417446 ) ) ( ON ?auto_417444 ?auto_417445 ) ( ON ?auto_417443 ?auto_417444 ) ( ON ?auto_417442 ?auto_417443 ) ( ON ?auto_417441 ?auto_417442 ) ( ON ?auto_417440 ?auto_417441 ) ( CLEAR ?auto_417438 ) ( ON ?auto_417439 ?auto_417440 ) ( CLEAR ?auto_417439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_417431 ?auto_417432 ?auto_417433 ?auto_417434 ?auto_417435 ?auto_417436 ?auto_417437 ?auto_417438 ?auto_417439 )
      ( MAKE-15PILE ?auto_417431 ?auto_417432 ?auto_417433 ?auto_417434 ?auto_417435 ?auto_417436 ?auto_417437 ?auto_417438 ?auto_417439 ?auto_417440 ?auto_417441 ?auto_417442 ?auto_417443 ?auto_417444 ?auto_417445 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417462 - BLOCK
      ?auto_417463 - BLOCK
      ?auto_417464 - BLOCK
      ?auto_417465 - BLOCK
      ?auto_417466 - BLOCK
      ?auto_417467 - BLOCK
      ?auto_417468 - BLOCK
      ?auto_417469 - BLOCK
      ?auto_417470 - BLOCK
      ?auto_417471 - BLOCK
      ?auto_417472 - BLOCK
      ?auto_417473 - BLOCK
      ?auto_417474 - BLOCK
      ?auto_417475 - BLOCK
      ?auto_417476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417476 ) ( ON-TABLE ?auto_417462 ) ( ON ?auto_417463 ?auto_417462 ) ( ON ?auto_417464 ?auto_417463 ) ( ON ?auto_417465 ?auto_417464 ) ( ON ?auto_417466 ?auto_417465 ) ( ON ?auto_417467 ?auto_417466 ) ( ON ?auto_417468 ?auto_417467 ) ( ON ?auto_417469 ?auto_417468 ) ( not ( = ?auto_417462 ?auto_417463 ) ) ( not ( = ?auto_417462 ?auto_417464 ) ) ( not ( = ?auto_417462 ?auto_417465 ) ) ( not ( = ?auto_417462 ?auto_417466 ) ) ( not ( = ?auto_417462 ?auto_417467 ) ) ( not ( = ?auto_417462 ?auto_417468 ) ) ( not ( = ?auto_417462 ?auto_417469 ) ) ( not ( = ?auto_417462 ?auto_417470 ) ) ( not ( = ?auto_417462 ?auto_417471 ) ) ( not ( = ?auto_417462 ?auto_417472 ) ) ( not ( = ?auto_417462 ?auto_417473 ) ) ( not ( = ?auto_417462 ?auto_417474 ) ) ( not ( = ?auto_417462 ?auto_417475 ) ) ( not ( = ?auto_417462 ?auto_417476 ) ) ( not ( = ?auto_417463 ?auto_417464 ) ) ( not ( = ?auto_417463 ?auto_417465 ) ) ( not ( = ?auto_417463 ?auto_417466 ) ) ( not ( = ?auto_417463 ?auto_417467 ) ) ( not ( = ?auto_417463 ?auto_417468 ) ) ( not ( = ?auto_417463 ?auto_417469 ) ) ( not ( = ?auto_417463 ?auto_417470 ) ) ( not ( = ?auto_417463 ?auto_417471 ) ) ( not ( = ?auto_417463 ?auto_417472 ) ) ( not ( = ?auto_417463 ?auto_417473 ) ) ( not ( = ?auto_417463 ?auto_417474 ) ) ( not ( = ?auto_417463 ?auto_417475 ) ) ( not ( = ?auto_417463 ?auto_417476 ) ) ( not ( = ?auto_417464 ?auto_417465 ) ) ( not ( = ?auto_417464 ?auto_417466 ) ) ( not ( = ?auto_417464 ?auto_417467 ) ) ( not ( = ?auto_417464 ?auto_417468 ) ) ( not ( = ?auto_417464 ?auto_417469 ) ) ( not ( = ?auto_417464 ?auto_417470 ) ) ( not ( = ?auto_417464 ?auto_417471 ) ) ( not ( = ?auto_417464 ?auto_417472 ) ) ( not ( = ?auto_417464 ?auto_417473 ) ) ( not ( = ?auto_417464 ?auto_417474 ) ) ( not ( = ?auto_417464 ?auto_417475 ) ) ( not ( = ?auto_417464 ?auto_417476 ) ) ( not ( = ?auto_417465 ?auto_417466 ) ) ( not ( = ?auto_417465 ?auto_417467 ) ) ( not ( = ?auto_417465 ?auto_417468 ) ) ( not ( = ?auto_417465 ?auto_417469 ) ) ( not ( = ?auto_417465 ?auto_417470 ) ) ( not ( = ?auto_417465 ?auto_417471 ) ) ( not ( = ?auto_417465 ?auto_417472 ) ) ( not ( = ?auto_417465 ?auto_417473 ) ) ( not ( = ?auto_417465 ?auto_417474 ) ) ( not ( = ?auto_417465 ?auto_417475 ) ) ( not ( = ?auto_417465 ?auto_417476 ) ) ( not ( = ?auto_417466 ?auto_417467 ) ) ( not ( = ?auto_417466 ?auto_417468 ) ) ( not ( = ?auto_417466 ?auto_417469 ) ) ( not ( = ?auto_417466 ?auto_417470 ) ) ( not ( = ?auto_417466 ?auto_417471 ) ) ( not ( = ?auto_417466 ?auto_417472 ) ) ( not ( = ?auto_417466 ?auto_417473 ) ) ( not ( = ?auto_417466 ?auto_417474 ) ) ( not ( = ?auto_417466 ?auto_417475 ) ) ( not ( = ?auto_417466 ?auto_417476 ) ) ( not ( = ?auto_417467 ?auto_417468 ) ) ( not ( = ?auto_417467 ?auto_417469 ) ) ( not ( = ?auto_417467 ?auto_417470 ) ) ( not ( = ?auto_417467 ?auto_417471 ) ) ( not ( = ?auto_417467 ?auto_417472 ) ) ( not ( = ?auto_417467 ?auto_417473 ) ) ( not ( = ?auto_417467 ?auto_417474 ) ) ( not ( = ?auto_417467 ?auto_417475 ) ) ( not ( = ?auto_417467 ?auto_417476 ) ) ( not ( = ?auto_417468 ?auto_417469 ) ) ( not ( = ?auto_417468 ?auto_417470 ) ) ( not ( = ?auto_417468 ?auto_417471 ) ) ( not ( = ?auto_417468 ?auto_417472 ) ) ( not ( = ?auto_417468 ?auto_417473 ) ) ( not ( = ?auto_417468 ?auto_417474 ) ) ( not ( = ?auto_417468 ?auto_417475 ) ) ( not ( = ?auto_417468 ?auto_417476 ) ) ( not ( = ?auto_417469 ?auto_417470 ) ) ( not ( = ?auto_417469 ?auto_417471 ) ) ( not ( = ?auto_417469 ?auto_417472 ) ) ( not ( = ?auto_417469 ?auto_417473 ) ) ( not ( = ?auto_417469 ?auto_417474 ) ) ( not ( = ?auto_417469 ?auto_417475 ) ) ( not ( = ?auto_417469 ?auto_417476 ) ) ( not ( = ?auto_417470 ?auto_417471 ) ) ( not ( = ?auto_417470 ?auto_417472 ) ) ( not ( = ?auto_417470 ?auto_417473 ) ) ( not ( = ?auto_417470 ?auto_417474 ) ) ( not ( = ?auto_417470 ?auto_417475 ) ) ( not ( = ?auto_417470 ?auto_417476 ) ) ( not ( = ?auto_417471 ?auto_417472 ) ) ( not ( = ?auto_417471 ?auto_417473 ) ) ( not ( = ?auto_417471 ?auto_417474 ) ) ( not ( = ?auto_417471 ?auto_417475 ) ) ( not ( = ?auto_417471 ?auto_417476 ) ) ( not ( = ?auto_417472 ?auto_417473 ) ) ( not ( = ?auto_417472 ?auto_417474 ) ) ( not ( = ?auto_417472 ?auto_417475 ) ) ( not ( = ?auto_417472 ?auto_417476 ) ) ( not ( = ?auto_417473 ?auto_417474 ) ) ( not ( = ?auto_417473 ?auto_417475 ) ) ( not ( = ?auto_417473 ?auto_417476 ) ) ( not ( = ?auto_417474 ?auto_417475 ) ) ( not ( = ?auto_417474 ?auto_417476 ) ) ( not ( = ?auto_417475 ?auto_417476 ) ) ( ON ?auto_417475 ?auto_417476 ) ( ON ?auto_417474 ?auto_417475 ) ( ON ?auto_417473 ?auto_417474 ) ( ON ?auto_417472 ?auto_417473 ) ( ON ?auto_417471 ?auto_417472 ) ( CLEAR ?auto_417469 ) ( ON ?auto_417470 ?auto_417471 ) ( CLEAR ?auto_417470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_417462 ?auto_417463 ?auto_417464 ?auto_417465 ?auto_417466 ?auto_417467 ?auto_417468 ?auto_417469 ?auto_417470 )
      ( MAKE-15PILE ?auto_417462 ?auto_417463 ?auto_417464 ?auto_417465 ?auto_417466 ?auto_417467 ?auto_417468 ?auto_417469 ?auto_417470 ?auto_417471 ?auto_417472 ?auto_417473 ?auto_417474 ?auto_417475 ?auto_417476 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417492 - BLOCK
      ?auto_417493 - BLOCK
      ?auto_417494 - BLOCK
      ?auto_417495 - BLOCK
      ?auto_417496 - BLOCK
      ?auto_417497 - BLOCK
      ?auto_417498 - BLOCK
      ?auto_417499 - BLOCK
      ?auto_417500 - BLOCK
      ?auto_417501 - BLOCK
      ?auto_417502 - BLOCK
      ?auto_417503 - BLOCK
      ?auto_417504 - BLOCK
      ?auto_417505 - BLOCK
      ?auto_417506 - BLOCK
    )
    :vars
    (
      ?auto_417507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417506 ?auto_417507 ) ( ON-TABLE ?auto_417492 ) ( ON ?auto_417493 ?auto_417492 ) ( ON ?auto_417494 ?auto_417493 ) ( ON ?auto_417495 ?auto_417494 ) ( ON ?auto_417496 ?auto_417495 ) ( ON ?auto_417497 ?auto_417496 ) ( ON ?auto_417498 ?auto_417497 ) ( not ( = ?auto_417492 ?auto_417493 ) ) ( not ( = ?auto_417492 ?auto_417494 ) ) ( not ( = ?auto_417492 ?auto_417495 ) ) ( not ( = ?auto_417492 ?auto_417496 ) ) ( not ( = ?auto_417492 ?auto_417497 ) ) ( not ( = ?auto_417492 ?auto_417498 ) ) ( not ( = ?auto_417492 ?auto_417499 ) ) ( not ( = ?auto_417492 ?auto_417500 ) ) ( not ( = ?auto_417492 ?auto_417501 ) ) ( not ( = ?auto_417492 ?auto_417502 ) ) ( not ( = ?auto_417492 ?auto_417503 ) ) ( not ( = ?auto_417492 ?auto_417504 ) ) ( not ( = ?auto_417492 ?auto_417505 ) ) ( not ( = ?auto_417492 ?auto_417506 ) ) ( not ( = ?auto_417492 ?auto_417507 ) ) ( not ( = ?auto_417493 ?auto_417494 ) ) ( not ( = ?auto_417493 ?auto_417495 ) ) ( not ( = ?auto_417493 ?auto_417496 ) ) ( not ( = ?auto_417493 ?auto_417497 ) ) ( not ( = ?auto_417493 ?auto_417498 ) ) ( not ( = ?auto_417493 ?auto_417499 ) ) ( not ( = ?auto_417493 ?auto_417500 ) ) ( not ( = ?auto_417493 ?auto_417501 ) ) ( not ( = ?auto_417493 ?auto_417502 ) ) ( not ( = ?auto_417493 ?auto_417503 ) ) ( not ( = ?auto_417493 ?auto_417504 ) ) ( not ( = ?auto_417493 ?auto_417505 ) ) ( not ( = ?auto_417493 ?auto_417506 ) ) ( not ( = ?auto_417493 ?auto_417507 ) ) ( not ( = ?auto_417494 ?auto_417495 ) ) ( not ( = ?auto_417494 ?auto_417496 ) ) ( not ( = ?auto_417494 ?auto_417497 ) ) ( not ( = ?auto_417494 ?auto_417498 ) ) ( not ( = ?auto_417494 ?auto_417499 ) ) ( not ( = ?auto_417494 ?auto_417500 ) ) ( not ( = ?auto_417494 ?auto_417501 ) ) ( not ( = ?auto_417494 ?auto_417502 ) ) ( not ( = ?auto_417494 ?auto_417503 ) ) ( not ( = ?auto_417494 ?auto_417504 ) ) ( not ( = ?auto_417494 ?auto_417505 ) ) ( not ( = ?auto_417494 ?auto_417506 ) ) ( not ( = ?auto_417494 ?auto_417507 ) ) ( not ( = ?auto_417495 ?auto_417496 ) ) ( not ( = ?auto_417495 ?auto_417497 ) ) ( not ( = ?auto_417495 ?auto_417498 ) ) ( not ( = ?auto_417495 ?auto_417499 ) ) ( not ( = ?auto_417495 ?auto_417500 ) ) ( not ( = ?auto_417495 ?auto_417501 ) ) ( not ( = ?auto_417495 ?auto_417502 ) ) ( not ( = ?auto_417495 ?auto_417503 ) ) ( not ( = ?auto_417495 ?auto_417504 ) ) ( not ( = ?auto_417495 ?auto_417505 ) ) ( not ( = ?auto_417495 ?auto_417506 ) ) ( not ( = ?auto_417495 ?auto_417507 ) ) ( not ( = ?auto_417496 ?auto_417497 ) ) ( not ( = ?auto_417496 ?auto_417498 ) ) ( not ( = ?auto_417496 ?auto_417499 ) ) ( not ( = ?auto_417496 ?auto_417500 ) ) ( not ( = ?auto_417496 ?auto_417501 ) ) ( not ( = ?auto_417496 ?auto_417502 ) ) ( not ( = ?auto_417496 ?auto_417503 ) ) ( not ( = ?auto_417496 ?auto_417504 ) ) ( not ( = ?auto_417496 ?auto_417505 ) ) ( not ( = ?auto_417496 ?auto_417506 ) ) ( not ( = ?auto_417496 ?auto_417507 ) ) ( not ( = ?auto_417497 ?auto_417498 ) ) ( not ( = ?auto_417497 ?auto_417499 ) ) ( not ( = ?auto_417497 ?auto_417500 ) ) ( not ( = ?auto_417497 ?auto_417501 ) ) ( not ( = ?auto_417497 ?auto_417502 ) ) ( not ( = ?auto_417497 ?auto_417503 ) ) ( not ( = ?auto_417497 ?auto_417504 ) ) ( not ( = ?auto_417497 ?auto_417505 ) ) ( not ( = ?auto_417497 ?auto_417506 ) ) ( not ( = ?auto_417497 ?auto_417507 ) ) ( not ( = ?auto_417498 ?auto_417499 ) ) ( not ( = ?auto_417498 ?auto_417500 ) ) ( not ( = ?auto_417498 ?auto_417501 ) ) ( not ( = ?auto_417498 ?auto_417502 ) ) ( not ( = ?auto_417498 ?auto_417503 ) ) ( not ( = ?auto_417498 ?auto_417504 ) ) ( not ( = ?auto_417498 ?auto_417505 ) ) ( not ( = ?auto_417498 ?auto_417506 ) ) ( not ( = ?auto_417498 ?auto_417507 ) ) ( not ( = ?auto_417499 ?auto_417500 ) ) ( not ( = ?auto_417499 ?auto_417501 ) ) ( not ( = ?auto_417499 ?auto_417502 ) ) ( not ( = ?auto_417499 ?auto_417503 ) ) ( not ( = ?auto_417499 ?auto_417504 ) ) ( not ( = ?auto_417499 ?auto_417505 ) ) ( not ( = ?auto_417499 ?auto_417506 ) ) ( not ( = ?auto_417499 ?auto_417507 ) ) ( not ( = ?auto_417500 ?auto_417501 ) ) ( not ( = ?auto_417500 ?auto_417502 ) ) ( not ( = ?auto_417500 ?auto_417503 ) ) ( not ( = ?auto_417500 ?auto_417504 ) ) ( not ( = ?auto_417500 ?auto_417505 ) ) ( not ( = ?auto_417500 ?auto_417506 ) ) ( not ( = ?auto_417500 ?auto_417507 ) ) ( not ( = ?auto_417501 ?auto_417502 ) ) ( not ( = ?auto_417501 ?auto_417503 ) ) ( not ( = ?auto_417501 ?auto_417504 ) ) ( not ( = ?auto_417501 ?auto_417505 ) ) ( not ( = ?auto_417501 ?auto_417506 ) ) ( not ( = ?auto_417501 ?auto_417507 ) ) ( not ( = ?auto_417502 ?auto_417503 ) ) ( not ( = ?auto_417502 ?auto_417504 ) ) ( not ( = ?auto_417502 ?auto_417505 ) ) ( not ( = ?auto_417502 ?auto_417506 ) ) ( not ( = ?auto_417502 ?auto_417507 ) ) ( not ( = ?auto_417503 ?auto_417504 ) ) ( not ( = ?auto_417503 ?auto_417505 ) ) ( not ( = ?auto_417503 ?auto_417506 ) ) ( not ( = ?auto_417503 ?auto_417507 ) ) ( not ( = ?auto_417504 ?auto_417505 ) ) ( not ( = ?auto_417504 ?auto_417506 ) ) ( not ( = ?auto_417504 ?auto_417507 ) ) ( not ( = ?auto_417505 ?auto_417506 ) ) ( not ( = ?auto_417505 ?auto_417507 ) ) ( not ( = ?auto_417506 ?auto_417507 ) ) ( ON ?auto_417505 ?auto_417506 ) ( ON ?auto_417504 ?auto_417505 ) ( ON ?auto_417503 ?auto_417504 ) ( ON ?auto_417502 ?auto_417503 ) ( ON ?auto_417501 ?auto_417502 ) ( ON ?auto_417500 ?auto_417501 ) ( CLEAR ?auto_417498 ) ( ON ?auto_417499 ?auto_417500 ) ( CLEAR ?auto_417499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_417492 ?auto_417493 ?auto_417494 ?auto_417495 ?auto_417496 ?auto_417497 ?auto_417498 ?auto_417499 )
      ( MAKE-15PILE ?auto_417492 ?auto_417493 ?auto_417494 ?auto_417495 ?auto_417496 ?auto_417497 ?auto_417498 ?auto_417499 ?auto_417500 ?auto_417501 ?auto_417502 ?auto_417503 ?auto_417504 ?auto_417505 ?auto_417506 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417523 - BLOCK
      ?auto_417524 - BLOCK
      ?auto_417525 - BLOCK
      ?auto_417526 - BLOCK
      ?auto_417527 - BLOCK
      ?auto_417528 - BLOCK
      ?auto_417529 - BLOCK
      ?auto_417530 - BLOCK
      ?auto_417531 - BLOCK
      ?auto_417532 - BLOCK
      ?auto_417533 - BLOCK
      ?auto_417534 - BLOCK
      ?auto_417535 - BLOCK
      ?auto_417536 - BLOCK
      ?auto_417537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417537 ) ( ON-TABLE ?auto_417523 ) ( ON ?auto_417524 ?auto_417523 ) ( ON ?auto_417525 ?auto_417524 ) ( ON ?auto_417526 ?auto_417525 ) ( ON ?auto_417527 ?auto_417526 ) ( ON ?auto_417528 ?auto_417527 ) ( ON ?auto_417529 ?auto_417528 ) ( not ( = ?auto_417523 ?auto_417524 ) ) ( not ( = ?auto_417523 ?auto_417525 ) ) ( not ( = ?auto_417523 ?auto_417526 ) ) ( not ( = ?auto_417523 ?auto_417527 ) ) ( not ( = ?auto_417523 ?auto_417528 ) ) ( not ( = ?auto_417523 ?auto_417529 ) ) ( not ( = ?auto_417523 ?auto_417530 ) ) ( not ( = ?auto_417523 ?auto_417531 ) ) ( not ( = ?auto_417523 ?auto_417532 ) ) ( not ( = ?auto_417523 ?auto_417533 ) ) ( not ( = ?auto_417523 ?auto_417534 ) ) ( not ( = ?auto_417523 ?auto_417535 ) ) ( not ( = ?auto_417523 ?auto_417536 ) ) ( not ( = ?auto_417523 ?auto_417537 ) ) ( not ( = ?auto_417524 ?auto_417525 ) ) ( not ( = ?auto_417524 ?auto_417526 ) ) ( not ( = ?auto_417524 ?auto_417527 ) ) ( not ( = ?auto_417524 ?auto_417528 ) ) ( not ( = ?auto_417524 ?auto_417529 ) ) ( not ( = ?auto_417524 ?auto_417530 ) ) ( not ( = ?auto_417524 ?auto_417531 ) ) ( not ( = ?auto_417524 ?auto_417532 ) ) ( not ( = ?auto_417524 ?auto_417533 ) ) ( not ( = ?auto_417524 ?auto_417534 ) ) ( not ( = ?auto_417524 ?auto_417535 ) ) ( not ( = ?auto_417524 ?auto_417536 ) ) ( not ( = ?auto_417524 ?auto_417537 ) ) ( not ( = ?auto_417525 ?auto_417526 ) ) ( not ( = ?auto_417525 ?auto_417527 ) ) ( not ( = ?auto_417525 ?auto_417528 ) ) ( not ( = ?auto_417525 ?auto_417529 ) ) ( not ( = ?auto_417525 ?auto_417530 ) ) ( not ( = ?auto_417525 ?auto_417531 ) ) ( not ( = ?auto_417525 ?auto_417532 ) ) ( not ( = ?auto_417525 ?auto_417533 ) ) ( not ( = ?auto_417525 ?auto_417534 ) ) ( not ( = ?auto_417525 ?auto_417535 ) ) ( not ( = ?auto_417525 ?auto_417536 ) ) ( not ( = ?auto_417525 ?auto_417537 ) ) ( not ( = ?auto_417526 ?auto_417527 ) ) ( not ( = ?auto_417526 ?auto_417528 ) ) ( not ( = ?auto_417526 ?auto_417529 ) ) ( not ( = ?auto_417526 ?auto_417530 ) ) ( not ( = ?auto_417526 ?auto_417531 ) ) ( not ( = ?auto_417526 ?auto_417532 ) ) ( not ( = ?auto_417526 ?auto_417533 ) ) ( not ( = ?auto_417526 ?auto_417534 ) ) ( not ( = ?auto_417526 ?auto_417535 ) ) ( not ( = ?auto_417526 ?auto_417536 ) ) ( not ( = ?auto_417526 ?auto_417537 ) ) ( not ( = ?auto_417527 ?auto_417528 ) ) ( not ( = ?auto_417527 ?auto_417529 ) ) ( not ( = ?auto_417527 ?auto_417530 ) ) ( not ( = ?auto_417527 ?auto_417531 ) ) ( not ( = ?auto_417527 ?auto_417532 ) ) ( not ( = ?auto_417527 ?auto_417533 ) ) ( not ( = ?auto_417527 ?auto_417534 ) ) ( not ( = ?auto_417527 ?auto_417535 ) ) ( not ( = ?auto_417527 ?auto_417536 ) ) ( not ( = ?auto_417527 ?auto_417537 ) ) ( not ( = ?auto_417528 ?auto_417529 ) ) ( not ( = ?auto_417528 ?auto_417530 ) ) ( not ( = ?auto_417528 ?auto_417531 ) ) ( not ( = ?auto_417528 ?auto_417532 ) ) ( not ( = ?auto_417528 ?auto_417533 ) ) ( not ( = ?auto_417528 ?auto_417534 ) ) ( not ( = ?auto_417528 ?auto_417535 ) ) ( not ( = ?auto_417528 ?auto_417536 ) ) ( not ( = ?auto_417528 ?auto_417537 ) ) ( not ( = ?auto_417529 ?auto_417530 ) ) ( not ( = ?auto_417529 ?auto_417531 ) ) ( not ( = ?auto_417529 ?auto_417532 ) ) ( not ( = ?auto_417529 ?auto_417533 ) ) ( not ( = ?auto_417529 ?auto_417534 ) ) ( not ( = ?auto_417529 ?auto_417535 ) ) ( not ( = ?auto_417529 ?auto_417536 ) ) ( not ( = ?auto_417529 ?auto_417537 ) ) ( not ( = ?auto_417530 ?auto_417531 ) ) ( not ( = ?auto_417530 ?auto_417532 ) ) ( not ( = ?auto_417530 ?auto_417533 ) ) ( not ( = ?auto_417530 ?auto_417534 ) ) ( not ( = ?auto_417530 ?auto_417535 ) ) ( not ( = ?auto_417530 ?auto_417536 ) ) ( not ( = ?auto_417530 ?auto_417537 ) ) ( not ( = ?auto_417531 ?auto_417532 ) ) ( not ( = ?auto_417531 ?auto_417533 ) ) ( not ( = ?auto_417531 ?auto_417534 ) ) ( not ( = ?auto_417531 ?auto_417535 ) ) ( not ( = ?auto_417531 ?auto_417536 ) ) ( not ( = ?auto_417531 ?auto_417537 ) ) ( not ( = ?auto_417532 ?auto_417533 ) ) ( not ( = ?auto_417532 ?auto_417534 ) ) ( not ( = ?auto_417532 ?auto_417535 ) ) ( not ( = ?auto_417532 ?auto_417536 ) ) ( not ( = ?auto_417532 ?auto_417537 ) ) ( not ( = ?auto_417533 ?auto_417534 ) ) ( not ( = ?auto_417533 ?auto_417535 ) ) ( not ( = ?auto_417533 ?auto_417536 ) ) ( not ( = ?auto_417533 ?auto_417537 ) ) ( not ( = ?auto_417534 ?auto_417535 ) ) ( not ( = ?auto_417534 ?auto_417536 ) ) ( not ( = ?auto_417534 ?auto_417537 ) ) ( not ( = ?auto_417535 ?auto_417536 ) ) ( not ( = ?auto_417535 ?auto_417537 ) ) ( not ( = ?auto_417536 ?auto_417537 ) ) ( ON ?auto_417536 ?auto_417537 ) ( ON ?auto_417535 ?auto_417536 ) ( ON ?auto_417534 ?auto_417535 ) ( ON ?auto_417533 ?auto_417534 ) ( ON ?auto_417532 ?auto_417533 ) ( ON ?auto_417531 ?auto_417532 ) ( CLEAR ?auto_417529 ) ( ON ?auto_417530 ?auto_417531 ) ( CLEAR ?auto_417530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_417523 ?auto_417524 ?auto_417525 ?auto_417526 ?auto_417527 ?auto_417528 ?auto_417529 ?auto_417530 )
      ( MAKE-15PILE ?auto_417523 ?auto_417524 ?auto_417525 ?auto_417526 ?auto_417527 ?auto_417528 ?auto_417529 ?auto_417530 ?auto_417531 ?auto_417532 ?auto_417533 ?auto_417534 ?auto_417535 ?auto_417536 ?auto_417537 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417553 - BLOCK
      ?auto_417554 - BLOCK
      ?auto_417555 - BLOCK
      ?auto_417556 - BLOCK
      ?auto_417557 - BLOCK
      ?auto_417558 - BLOCK
      ?auto_417559 - BLOCK
      ?auto_417560 - BLOCK
      ?auto_417561 - BLOCK
      ?auto_417562 - BLOCK
      ?auto_417563 - BLOCK
      ?auto_417564 - BLOCK
      ?auto_417565 - BLOCK
      ?auto_417566 - BLOCK
      ?auto_417567 - BLOCK
    )
    :vars
    (
      ?auto_417568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417567 ?auto_417568 ) ( ON-TABLE ?auto_417553 ) ( ON ?auto_417554 ?auto_417553 ) ( ON ?auto_417555 ?auto_417554 ) ( ON ?auto_417556 ?auto_417555 ) ( ON ?auto_417557 ?auto_417556 ) ( ON ?auto_417558 ?auto_417557 ) ( not ( = ?auto_417553 ?auto_417554 ) ) ( not ( = ?auto_417553 ?auto_417555 ) ) ( not ( = ?auto_417553 ?auto_417556 ) ) ( not ( = ?auto_417553 ?auto_417557 ) ) ( not ( = ?auto_417553 ?auto_417558 ) ) ( not ( = ?auto_417553 ?auto_417559 ) ) ( not ( = ?auto_417553 ?auto_417560 ) ) ( not ( = ?auto_417553 ?auto_417561 ) ) ( not ( = ?auto_417553 ?auto_417562 ) ) ( not ( = ?auto_417553 ?auto_417563 ) ) ( not ( = ?auto_417553 ?auto_417564 ) ) ( not ( = ?auto_417553 ?auto_417565 ) ) ( not ( = ?auto_417553 ?auto_417566 ) ) ( not ( = ?auto_417553 ?auto_417567 ) ) ( not ( = ?auto_417553 ?auto_417568 ) ) ( not ( = ?auto_417554 ?auto_417555 ) ) ( not ( = ?auto_417554 ?auto_417556 ) ) ( not ( = ?auto_417554 ?auto_417557 ) ) ( not ( = ?auto_417554 ?auto_417558 ) ) ( not ( = ?auto_417554 ?auto_417559 ) ) ( not ( = ?auto_417554 ?auto_417560 ) ) ( not ( = ?auto_417554 ?auto_417561 ) ) ( not ( = ?auto_417554 ?auto_417562 ) ) ( not ( = ?auto_417554 ?auto_417563 ) ) ( not ( = ?auto_417554 ?auto_417564 ) ) ( not ( = ?auto_417554 ?auto_417565 ) ) ( not ( = ?auto_417554 ?auto_417566 ) ) ( not ( = ?auto_417554 ?auto_417567 ) ) ( not ( = ?auto_417554 ?auto_417568 ) ) ( not ( = ?auto_417555 ?auto_417556 ) ) ( not ( = ?auto_417555 ?auto_417557 ) ) ( not ( = ?auto_417555 ?auto_417558 ) ) ( not ( = ?auto_417555 ?auto_417559 ) ) ( not ( = ?auto_417555 ?auto_417560 ) ) ( not ( = ?auto_417555 ?auto_417561 ) ) ( not ( = ?auto_417555 ?auto_417562 ) ) ( not ( = ?auto_417555 ?auto_417563 ) ) ( not ( = ?auto_417555 ?auto_417564 ) ) ( not ( = ?auto_417555 ?auto_417565 ) ) ( not ( = ?auto_417555 ?auto_417566 ) ) ( not ( = ?auto_417555 ?auto_417567 ) ) ( not ( = ?auto_417555 ?auto_417568 ) ) ( not ( = ?auto_417556 ?auto_417557 ) ) ( not ( = ?auto_417556 ?auto_417558 ) ) ( not ( = ?auto_417556 ?auto_417559 ) ) ( not ( = ?auto_417556 ?auto_417560 ) ) ( not ( = ?auto_417556 ?auto_417561 ) ) ( not ( = ?auto_417556 ?auto_417562 ) ) ( not ( = ?auto_417556 ?auto_417563 ) ) ( not ( = ?auto_417556 ?auto_417564 ) ) ( not ( = ?auto_417556 ?auto_417565 ) ) ( not ( = ?auto_417556 ?auto_417566 ) ) ( not ( = ?auto_417556 ?auto_417567 ) ) ( not ( = ?auto_417556 ?auto_417568 ) ) ( not ( = ?auto_417557 ?auto_417558 ) ) ( not ( = ?auto_417557 ?auto_417559 ) ) ( not ( = ?auto_417557 ?auto_417560 ) ) ( not ( = ?auto_417557 ?auto_417561 ) ) ( not ( = ?auto_417557 ?auto_417562 ) ) ( not ( = ?auto_417557 ?auto_417563 ) ) ( not ( = ?auto_417557 ?auto_417564 ) ) ( not ( = ?auto_417557 ?auto_417565 ) ) ( not ( = ?auto_417557 ?auto_417566 ) ) ( not ( = ?auto_417557 ?auto_417567 ) ) ( not ( = ?auto_417557 ?auto_417568 ) ) ( not ( = ?auto_417558 ?auto_417559 ) ) ( not ( = ?auto_417558 ?auto_417560 ) ) ( not ( = ?auto_417558 ?auto_417561 ) ) ( not ( = ?auto_417558 ?auto_417562 ) ) ( not ( = ?auto_417558 ?auto_417563 ) ) ( not ( = ?auto_417558 ?auto_417564 ) ) ( not ( = ?auto_417558 ?auto_417565 ) ) ( not ( = ?auto_417558 ?auto_417566 ) ) ( not ( = ?auto_417558 ?auto_417567 ) ) ( not ( = ?auto_417558 ?auto_417568 ) ) ( not ( = ?auto_417559 ?auto_417560 ) ) ( not ( = ?auto_417559 ?auto_417561 ) ) ( not ( = ?auto_417559 ?auto_417562 ) ) ( not ( = ?auto_417559 ?auto_417563 ) ) ( not ( = ?auto_417559 ?auto_417564 ) ) ( not ( = ?auto_417559 ?auto_417565 ) ) ( not ( = ?auto_417559 ?auto_417566 ) ) ( not ( = ?auto_417559 ?auto_417567 ) ) ( not ( = ?auto_417559 ?auto_417568 ) ) ( not ( = ?auto_417560 ?auto_417561 ) ) ( not ( = ?auto_417560 ?auto_417562 ) ) ( not ( = ?auto_417560 ?auto_417563 ) ) ( not ( = ?auto_417560 ?auto_417564 ) ) ( not ( = ?auto_417560 ?auto_417565 ) ) ( not ( = ?auto_417560 ?auto_417566 ) ) ( not ( = ?auto_417560 ?auto_417567 ) ) ( not ( = ?auto_417560 ?auto_417568 ) ) ( not ( = ?auto_417561 ?auto_417562 ) ) ( not ( = ?auto_417561 ?auto_417563 ) ) ( not ( = ?auto_417561 ?auto_417564 ) ) ( not ( = ?auto_417561 ?auto_417565 ) ) ( not ( = ?auto_417561 ?auto_417566 ) ) ( not ( = ?auto_417561 ?auto_417567 ) ) ( not ( = ?auto_417561 ?auto_417568 ) ) ( not ( = ?auto_417562 ?auto_417563 ) ) ( not ( = ?auto_417562 ?auto_417564 ) ) ( not ( = ?auto_417562 ?auto_417565 ) ) ( not ( = ?auto_417562 ?auto_417566 ) ) ( not ( = ?auto_417562 ?auto_417567 ) ) ( not ( = ?auto_417562 ?auto_417568 ) ) ( not ( = ?auto_417563 ?auto_417564 ) ) ( not ( = ?auto_417563 ?auto_417565 ) ) ( not ( = ?auto_417563 ?auto_417566 ) ) ( not ( = ?auto_417563 ?auto_417567 ) ) ( not ( = ?auto_417563 ?auto_417568 ) ) ( not ( = ?auto_417564 ?auto_417565 ) ) ( not ( = ?auto_417564 ?auto_417566 ) ) ( not ( = ?auto_417564 ?auto_417567 ) ) ( not ( = ?auto_417564 ?auto_417568 ) ) ( not ( = ?auto_417565 ?auto_417566 ) ) ( not ( = ?auto_417565 ?auto_417567 ) ) ( not ( = ?auto_417565 ?auto_417568 ) ) ( not ( = ?auto_417566 ?auto_417567 ) ) ( not ( = ?auto_417566 ?auto_417568 ) ) ( not ( = ?auto_417567 ?auto_417568 ) ) ( ON ?auto_417566 ?auto_417567 ) ( ON ?auto_417565 ?auto_417566 ) ( ON ?auto_417564 ?auto_417565 ) ( ON ?auto_417563 ?auto_417564 ) ( ON ?auto_417562 ?auto_417563 ) ( ON ?auto_417561 ?auto_417562 ) ( ON ?auto_417560 ?auto_417561 ) ( CLEAR ?auto_417558 ) ( ON ?auto_417559 ?auto_417560 ) ( CLEAR ?auto_417559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_417553 ?auto_417554 ?auto_417555 ?auto_417556 ?auto_417557 ?auto_417558 ?auto_417559 )
      ( MAKE-15PILE ?auto_417553 ?auto_417554 ?auto_417555 ?auto_417556 ?auto_417557 ?auto_417558 ?auto_417559 ?auto_417560 ?auto_417561 ?auto_417562 ?auto_417563 ?auto_417564 ?auto_417565 ?auto_417566 ?auto_417567 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417584 - BLOCK
      ?auto_417585 - BLOCK
      ?auto_417586 - BLOCK
      ?auto_417587 - BLOCK
      ?auto_417588 - BLOCK
      ?auto_417589 - BLOCK
      ?auto_417590 - BLOCK
      ?auto_417591 - BLOCK
      ?auto_417592 - BLOCK
      ?auto_417593 - BLOCK
      ?auto_417594 - BLOCK
      ?auto_417595 - BLOCK
      ?auto_417596 - BLOCK
      ?auto_417597 - BLOCK
      ?auto_417598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417598 ) ( ON-TABLE ?auto_417584 ) ( ON ?auto_417585 ?auto_417584 ) ( ON ?auto_417586 ?auto_417585 ) ( ON ?auto_417587 ?auto_417586 ) ( ON ?auto_417588 ?auto_417587 ) ( ON ?auto_417589 ?auto_417588 ) ( not ( = ?auto_417584 ?auto_417585 ) ) ( not ( = ?auto_417584 ?auto_417586 ) ) ( not ( = ?auto_417584 ?auto_417587 ) ) ( not ( = ?auto_417584 ?auto_417588 ) ) ( not ( = ?auto_417584 ?auto_417589 ) ) ( not ( = ?auto_417584 ?auto_417590 ) ) ( not ( = ?auto_417584 ?auto_417591 ) ) ( not ( = ?auto_417584 ?auto_417592 ) ) ( not ( = ?auto_417584 ?auto_417593 ) ) ( not ( = ?auto_417584 ?auto_417594 ) ) ( not ( = ?auto_417584 ?auto_417595 ) ) ( not ( = ?auto_417584 ?auto_417596 ) ) ( not ( = ?auto_417584 ?auto_417597 ) ) ( not ( = ?auto_417584 ?auto_417598 ) ) ( not ( = ?auto_417585 ?auto_417586 ) ) ( not ( = ?auto_417585 ?auto_417587 ) ) ( not ( = ?auto_417585 ?auto_417588 ) ) ( not ( = ?auto_417585 ?auto_417589 ) ) ( not ( = ?auto_417585 ?auto_417590 ) ) ( not ( = ?auto_417585 ?auto_417591 ) ) ( not ( = ?auto_417585 ?auto_417592 ) ) ( not ( = ?auto_417585 ?auto_417593 ) ) ( not ( = ?auto_417585 ?auto_417594 ) ) ( not ( = ?auto_417585 ?auto_417595 ) ) ( not ( = ?auto_417585 ?auto_417596 ) ) ( not ( = ?auto_417585 ?auto_417597 ) ) ( not ( = ?auto_417585 ?auto_417598 ) ) ( not ( = ?auto_417586 ?auto_417587 ) ) ( not ( = ?auto_417586 ?auto_417588 ) ) ( not ( = ?auto_417586 ?auto_417589 ) ) ( not ( = ?auto_417586 ?auto_417590 ) ) ( not ( = ?auto_417586 ?auto_417591 ) ) ( not ( = ?auto_417586 ?auto_417592 ) ) ( not ( = ?auto_417586 ?auto_417593 ) ) ( not ( = ?auto_417586 ?auto_417594 ) ) ( not ( = ?auto_417586 ?auto_417595 ) ) ( not ( = ?auto_417586 ?auto_417596 ) ) ( not ( = ?auto_417586 ?auto_417597 ) ) ( not ( = ?auto_417586 ?auto_417598 ) ) ( not ( = ?auto_417587 ?auto_417588 ) ) ( not ( = ?auto_417587 ?auto_417589 ) ) ( not ( = ?auto_417587 ?auto_417590 ) ) ( not ( = ?auto_417587 ?auto_417591 ) ) ( not ( = ?auto_417587 ?auto_417592 ) ) ( not ( = ?auto_417587 ?auto_417593 ) ) ( not ( = ?auto_417587 ?auto_417594 ) ) ( not ( = ?auto_417587 ?auto_417595 ) ) ( not ( = ?auto_417587 ?auto_417596 ) ) ( not ( = ?auto_417587 ?auto_417597 ) ) ( not ( = ?auto_417587 ?auto_417598 ) ) ( not ( = ?auto_417588 ?auto_417589 ) ) ( not ( = ?auto_417588 ?auto_417590 ) ) ( not ( = ?auto_417588 ?auto_417591 ) ) ( not ( = ?auto_417588 ?auto_417592 ) ) ( not ( = ?auto_417588 ?auto_417593 ) ) ( not ( = ?auto_417588 ?auto_417594 ) ) ( not ( = ?auto_417588 ?auto_417595 ) ) ( not ( = ?auto_417588 ?auto_417596 ) ) ( not ( = ?auto_417588 ?auto_417597 ) ) ( not ( = ?auto_417588 ?auto_417598 ) ) ( not ( = ?auto_417589 ?auto_417590 ) ) ( not ( = ?auto_417589 ?auto_417591 ) ) ( not ( = ?auto_417589 ?auto_417592 ) ) ( not ( = ?auto_417589 ?auto_417593 ) ) ( not ( = ?auto_417589 ?auto_417594 ) ) ( not ( = ?auto_417589 ?auto_417595 ) ) ( not ( = ?auto_417589 ?auto_417596 ) ) ( not ( = ?auto_417589 ?auto_417597 ) ) ( not ( = ?auto_417589 ?auto_417598 ) ) ( not ( = ?auto_417590 ?auto_417591 ) ) ( not ( = ?auto_417590 ?auto_417592 ) ) ( not ( = ?auto_417590 ?auto_417593 ) ) ( not ( = ?auto_417590 ?auto_417594 ) ) ( not ( = ?auto_417590 ?auto_417595 ) ) ( not ( = ?auto_417590 ?auto_417596 ) ) ( not ( = ?auto_417590 ?auto_417597 ) ) ( not ( = ?auto_417590 ?auto_417598 ) ) ( not ( = ?auto_417591 ?auto_417592 ) ) ( not ( = ?auto_417591 ?auto_417593 ) ) ( not ( = ?auto_417591 ?auto_417594 ) ) ( not ( = ?auto_417591 ?auto_417595 ) ) ( not ( = ?auto_417591 ?auto_417596 ) ) ( not ( = ?auto_417591 ?auto_417597 ) ) ( not ( = ?auto_417591 ?auto_417598 ) ) ( not ( = ?auto_417592 ?auto_417593 ) ) ( not ( = ?auto_417592 ?auto_417594 ) ) ( not ( = ?auto_417592 ?auto_417595 ) ) ( not ( = ?auto_417592 ?auto_417596 ) ) ( not ( = ?auto_417592 ?auto_417597 ) ) ( not ( = ?auto_417592 ?auto_417598 ) ) ( not ( = ?auto_417593 ?auto_417594 ) ) ( not ( = ?auto_417593 ?auto_417595 ) ) ( not ( = ?auto_417593 ?auto_417596 ) ) ( not ( = ?auto_417593 ?auto_417597 ) ) ( not ( = ?auto_417593 ?auto_417598 ) ) ( not ( = ?auto_417594 ?auto_417595 ) ) ( not ( = ?auto_417594 ?auto_417596 ) ) ( not ( = ?auto_417594 ?auto_417597 ) ) ( not ( = ?auto_417594 ?auto_417598 ) ) ( not ( = ?auto_417595 ?auto_417596 ) ) ( not ( = ?auto_417595 ?auto_417597 ) ) ( not ( = ?auto_417595 ?auto_417598 ) ) ( not ( = ?auto_417596 ?auto_417597 ) ) ( not ( = ?auto_417596 ?auto_417598 ) ) ( not ( = ?auto_417597 ?auto_417598 ) ) ( ON ?auto_417597 ?auto_417598 ) ( ON ?auto_417596 ?auto_417597 ) ( ON ?auto_417595 ?auto_417596 ) ( ON ?auto_417594 ?auto_417595 ) ( ON ?auto_417593 ?auto_417594 ) ( ON ?auto_417592 ?auto_417593 ) ( ON ?auto_417591 ?auto_417592 ) ( CLEAR ?auto_417589 ) ( ON ?auto_417590 ?auto_417591 ) ( CLEAR ?auto_417590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_417584 ?auto_417585 ?auto_417586 ?auto_417587 ?auto_417588 ?auto_417589 ?auto_417590 )
      ( MAKE-15PILE ?auto_417584 ?auto_417585 ?auto_417586 ?auto_417587 ?auto_417588 ?auto_417589 ?auto_417590 ?auto_417591 ?auto_417592 ?auto_417593 ?auto_417594 ?auto_417595 ?auto_417596 ?auto_417597 ?auto_417598 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417614 - BLOCK
      ?auto_417615 - BLOCK
      ?auto_417616 - BLOCK
      ?auto_417617 - BLOCK
      ?auto_417618 - BLOCK
      ?auto_417619 - BLOCK
      ?auto_417620 - BLOCK
      ?auto_417621 - BLOCK
      ?auto_417622 - BLOCK
      ?auto_417623 - BLOCK
      ?auto_417624 - BLOCK
      ?auto_417625 - BLOCK
      ?auto_417626 - BLOCK
      ?auto_417627 - BLOCK
      ?auto_417628 - BLOCK
    )
    :vars
    (
      ?auto_417629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417628 ?auto_417629 ) ( ON-TABLE ?auto_417614 ) ( ON ?auto_417615 ?auto_417614 ) ( ON ?auto_417616 ?auto_417615 ) ( ON ?auto_417617 ?auto_417616 ) ( ON ?auto_417618 ?auto_417617 ) ( not ( = ?auto_417614 ?auto_417615 ) ) ( not ( = ?auto_417614 ?auto_417616 ) ) ( not ( = ?auto_417614 ?auto_417617 ) ) ( not ( = ?auto_417614 ?auto_417618 ) ) ( not ( = ?auto_417614 ?auto_417619 ) ) ( not ( = ?auto_417614 ?auto_417620 ) ) ( not ( = ?auto_417614 ?auto_417621 ) ) ( not ( = ?auto_417614 ?auto_417622 ) ) ( not ( = ?auto_417614 ?auto_417623 ) ) ( not ( = ?auto_417614 ?auto_417624 ) ) ( not ( = ?auto_417614 ?auto_417625 ) ) ( not ( = ?auto_417614 ?auto_417626 ) ) ( not ( = ?auto_417614 ?auto_417627 ) ) ( not ( = ?auto_417614 ?auto_417628 ) ) ( not ( = ?auto_417614 ?auto_417629 ) ) ( not ( = ?auto_417615 ?auto_417616 ) ) ( not ( = ?auto_417615 ?auto_417617 ) ) ( not ( = ?auto_417615 ?auto_417618 ) ) ( not ( = ?auto_417615 ?auto_417619 ) ) ( not ( = ?auto_417615 ?auto_417620 ) ) ( not ( = ?auto_417615 ?auto_417621 ) ) ( not ( = ?auto_417615 ?auto_417622 ) ) ( not ( = ?auto_417615 ?auto_417623 ) ) ( not ( = ?auto_417615 ?auto_417624 ) ) ( not ( = ?auto_417615 ?auto_417625 ) ) ( not ( = ?auto_417615 ?auto_417626 ) ) ( not ( = ?auto_417615 ?auto_417627 ) ) ( not ( = ?auto_417615 ?auto_417628 ) ) ( not ( = ?auto_417615 ?auto_417629 ) ) ( not ( = ?auto_417616 ?auto_417617 ) ) ( not ( = ?auto_417616 ?auto_417618 ) ) ( not ( = ?auto_417616 ?auto_417619 ) ) ( not ( = ?auto_417616 ?auto_417620 ) ) ( not ( = ?auto_417616 ?auto_417621 ) ) ( not ( = ?auto_417616 ?auto_417622 ) ) ( not ( = ?auto_417616 ?auto_417623 ) ) ( not ( = ?auto_417616 ?auto_417624 ) ) ( not ( = ?auto_417616 ?auto_417625 ) ) ( not ( = ?auto_417616 ?auto_417626 ) ) ( not ( = ?auto_417616 ?auto_417627 ) ) ( not ( = ?auto_417616 ?auto_417628 ) ) ( not ( = ?auto_417616 ?auto_417629 ) ) ( not ( = ?auto_417617 ?auto_417618 ) ) ( not ( = ?auto_417617 ?auto_417619 ) ) ( not ( = ?auto_417617 ?auto_417620 ) ) ( not ( = ?auto_417617 ?auto_417621 ) ) ( not ( = ?auto_417617 ?auto_417622 ) ) ( not ( = ?auto_417617 ?auto_417623 ) ) ( not ( = ?auto_417617 ?auto_417624 ) ) ( not ( = ?auto_417617 ?auto_417625 ) ) ( not ( = ?auto_417617 ?auto_417626 ) ) ( not ( = ?auto_417617 ?auto_417627 ) ) ( not ( = ?auto_417617 ?auto_417628 ) ) ( not ( = ?auto_417617 ?auto_417629 ) ) ( not ( = ?auto_417618 ?auto_417619 ) ) ( not ( = ?auto_417618 ?auto_417620 ) ) ( not ( = ?auto_417618 ?auto_417621 ) ) ( not ( = ?auto_417618 ?auto_417622 ) ) ( not ( = ?auto_417618 ?auto_417623 ) ) ( not ( = ?auto_417618 ?auto_417624 ) ) ( not ( = ?auto_417618 ?auto_417625 ) ) ( not ( = ?auto_417618 ?auto_417626 ) ) ( not ( = ?auto_417618 ?auto_417627 ) ) ( not ( = ?auto_417618 ?auto_417628 ) ) ( not ( = ?auto_417618 ?auto_417629 ) ) ( not ( = ?auto_417619 ?auto_417620 ) ) ( not ( = ?auto_417619 ?auto_417621 ) ) ( not ( = ?auto_417619 ?auto_417622 ) ) ( not ( = ?auto_417619 ?auto_417623 ) ) ( not ( = ?auto_417619 ?auto_417624 ) ) ( not ( = ?auto_417619 ?auto_417625 ) ) ( not ( = ?auto_417619 ?auto_417626 ) ) ( not ( = ?auto_417619 ?auto_417627 ) ) ( not ( = ?auto_417619 ?auto_417628 ) ) ( not ( = ?auto_417619 ?auto_417629 ) ) ( not ( = ?auto_417620 ?auto_417621 ) ) ( not ( = ?auto_417620 ?auto_417622 ) ) ( not ( = ?auto_417620 ?auto_417623 ) ) ( not ( = ?auto_417620 ?auto_417624 ) ) ( not ( = ?auto_417620 ?auto_417625 ) ) ( not ( = ?auto_417620 ?auto_417626 ) ) ( not ( = ?auto_417620 ?auto_417627 ) ) ( not ( = ?auto_417620 ?auto_417628 ) ) ( not ( = ?auto_417620 ?auto_417629 ) ) ( not ( = ?auto_417621 ?auto_417622 ) ) ( not ( = ?auto_417621 ?auto_417623 ) ) ( not ( = ?auto_417621 ?auto_417624 ) ) ( not ( = ?auto_417621 ?auto_417625 ) ) ( not ( = ?auto_417621 ?auto_417626 ) ) ( not ( = ?auto_417621 ?auto_417627 ) ) ( not ( = ?auto_417621 ?auto_417628 ) ) ( not ( = ?auto_417621 ?auto_417629 ) ) ( not ( = ?auto_417622 ?auto_417623 ) ) ( not ( = ?auto_417622 ?auto_417624 ) ) ( not ( = ?auto_417622 ?auto_417625 ) ) ( not ( = ?auto_417622 ?auto_417626 ) ) ( not ( = ?auto_417622 ?auto_417627 ) ) ( not ( = ?auto_417622 ?auto_417628 ) ) ( not ( = ?auto_417622 ?auto_417629 ) ) ( not ( = ?auto_417623 ?auto_417624 ) ) ( not ( = ?auto_417623 ?auto_417625 ) ) ( not ( = ?auto_417623 ?auto_417626 ) ) ( not ( = ?auto_417623 ?auto_417627 ) ) ( not ( = ?auto_417623 ?auto_417628 ) ) ( not ( = ?auto_417623 ?auto_417629 ) ) ( not ( = ?auto_417624 ?auto_417625 ) ) ( not ( = ?auto_417624 ?auto_417626 ) ) ( not ( = ?auto_417624 ?auto_417627 ) ) ( not ( = ?auto_417624 ?auto_417628 ) ) ( not ( = ?auto_417624 ?auto_417629 ) ) ( not ( = ?auto_417625 ?auto_417626 ) ) ( not ( = ?auto_417625 ?auto_417627 ) ) ( not ( = ?auto_417625 ?auto_417628 ) ) ( not ( = ?auto_417625 ?auto_417629 ) ) ( not ( = ?auto_417626 ?auto_417627 ) ) ( not ( = ?auto_417626 ?auto_417628 ) ) ( not ( = ?auto_417626 ?auto_417629 ) ) ( not ( = ?auto_417627 ?auto_417628 ) ) ( not ( = ?auto_417627 ?auto_417629 ) ) ( not ( = ?auto_417628 ?auto_417629 ) ) ( ON ?auto_417627 ?auto_417628 ) ( ON ?auto_417626 ?auto_417627 ) ( ON ?auto_417625 ?auto_417626 ) ( ON ?auto_417624 ?auto_417625 ) ( ON ?auto_417623 ?auto_417624 ) ( ON ?auto_417622 ?auto_417623 ) ( ON ?auto_417621 ?auto_417622 ) ( ON ?auto_417620 ?auto_417621 ) ( CLEAR ?auto_417618 ) ( ON ?auto_417619 ?auto_417620 ) ( CLEAR ?auto_417619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_417614 ?auto_417615 ?auto_417616 ?auto_417617 ?auto_417618 ?auto_417619 )
      ( MAKE-15PILE ?auto_417614 ?auto_417615 ?auto_417616 ?auto_417617 ?auto_417618 ?auto_417619 ?auto_417620 ?auto_417621 ?auto_417622 ?auto_417623 ?auto_417624 ?auto_417625 ?auto_417626 ?auto_417627 ?auto_417628 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417645 - BLOCK
      ?auto_417646 - BLOCK
      ?auto_417647 - BLOCK
      ?auto_417648 - BLOCK
      ?auto_417649 - BLOCK
      ?auto_417650 - BLOCK
      ?auto_417651 - BLOCK
      ?auto_417652 - BLOCK
      ?auto_417653 - BLOCK
      ?auto_417654 - BLOCK
      ?auto_417655 - BLOCK
      ?auto_417656 - BLOCK
      ?auto_417657 - BLOCK
      ?auto_417658 - BLOCK
      ?auto_417659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417659 ) ( ON-TABLE ?auto_417645 ) ( ON ?auto_417646 ?auto_417645 ) ( ON ?auto_417647 ?auto_417646 ) ( ON ?auto_417648 ?auto_417647 ) ( ON ?auto_417649 ?auto_417648 ) ( not ( = ?auto_417645 ?auto_417646 ) ) ( not ( = ?auto_417645 ?auto_417647 ) ) ( not ( = ?auto_417645 ?auto_417648 ) ) ( not ( = ?auto_417645 ?auto_417649 ) ) ( not ( = ?auto_417645 ?auto_417650 ) ) ( not ( = ?auto_417645 ?auto_417651 ) ) ( not ( = ?auto_417645 ?auto_417652 ) ) ( not ( = ?auto_417645 ?auto_417653 ) ) ( not ( = ?auto_417645 ?auto_417654 ) ) ( not ( = ?auto_417645 ?auto_417655 ) ) ( not ( = ?auto_417645 ?auto_417656 ) ) ( not ( = ?auto_417645 ?auto_417657 ) ) ( not ( = ?auto_417645 ?auto_417658 ) ) ( not ( = ?auto_417645 ?auto_417659 ) ) ( not ( = ?auto_417646 ?auto_417647 ) ) ( not ( = ?auto_417646 ?auto_417648 ) ) ( not ( = ?auto_417646 ?auto_417649 ) ) ( not ( = ?auto_417646 ?auto_417650 ) ) ( not ( = ?auto_417646 ?auto_417651 ) ) ( not ( = ?auto_417646 ?auto_417652 ) ) ( not ( = ?auto_417646 ?auto_417653 ) ) ( not ( = ?auto_417646 ?auto_417654 ) ) ( not ( = ?auto_417646 ?auto_417655 ) ) ( not ( = ?auto_417646 ?auto_417656 ) ) ( not ( = ?auto_417646 ?auto_417657 ) ) ( not ( = ?auto_417646 ?auto_417658 ) ) ( not ( = ?auto_417646 ?auto_417659 ) ) ( not ( = ?auto_417647 ?auto_417648 ) ) ( not ( = ?auto_417647 ?auto_417649 ) ) ( not ( = ?auto_417647 ?auto_417650 ) ) ( not ( = ?auto_417647 ?auto_417651 ) ) ( not ( = ?auto_417647 ?auto_417652 ) ) ( not ( = ?auto_417647 ?auto_417653 ) ) ( not ( = ?auto_417647 ?auto_417654 ) ) ( not ( = ?auto_417647 ?auto_417655 ) ) ( not ( = ?auto_417647 ?auto_417656 ) ) ( not ( = ?auto_417647 ?auto_417657 ) ) ( not ( = ?auto_417647 ?auto_417658 ) ) ( not ( = ?auto_417647 ?auto_417659 ) ) ( not ( = ?auto_417648 ?auto_417649 ) ) ( not ( = ?auto_417648 ?auto_417650 ) ) ( not ( = ?auto_417648 ?auto_417651 ) ) ( not ( = ?auto_417648 ?auto_417652 ) ) ( not ( = ?auto_417648 ?auto_417653 ) ) ( not ( = ?auto_417648 ?auto_417654 ) ) ( not ( = ?auto_417648 ?auto_417655 ) ) ( not ( = ?auto_417648 ?auto_417656 ) ) ( not ( = ?auto_417648 ?auto_417657 ) ) ( not ( = ?auto_417648 ?auto_417658 ) ) ( not ( = ?auto_417648 ?auto_417659 ) ) ( not ( = ?auto_417649 ?auto_417650 ) ) ( not ( = ?auto_417649 ?auto_417651 ) ) ( not ( = ?auto_417649 ?auto_417652 ) ) ( not ( = ?auto_417649 ?auto_417653 ) ) ( not ( = ?auto_417649 ?auto_417654 ) ) ( not ( = ?auto_417649 ?auto_417655 ) ) ( not ( = ?auto_417649 ?auto_417656 ) ) ( not ( = ?auto_417649 ?auto_417657 ) ) ( not ( = ?auto_417649 ?auto_417658 ) ) ( not ( = ?auto_417649 ?auto_417659 ) ) ( not ( = ?auto_417650 ?auto_417651 ) ) ( not ( = ?auto_417650 ?auto_417652 ) ) ( not ( = ?auto_417650 ?auto_417653 ) ) ( not ( = ?auto_417650 ?auto_417654 ) ) ( not ( = ?auto_417650 ?auto_417655 ) ) ( not ( = ?auto_417650 ?auto_417656 ) ) ( not ( = ?auto_417650 ?auto_417657 ) ) ( not ( = ?auto_417650 ?auto_417658 ) ) ( not ( = ?auto_417650 ?auto_417659 ) ) ( not ( = ?auto_417651 ?auto_417652 ) ) ( not ( = ?auto_417651 ?auto_417653 ) ) ( not ( = ?auto_417651 ?auto_417654 ) ) ( not ( = ?auto_417651 ?auto_417655 ) ) ( not ( = ?auto_417651 ?auto_417656 ) ) ( not ( = ?auto_417651 ?auto_417657 ) ) ( not ( = ?auto_417651 ?auto_417658 ) ) ( not ( = ?auto_417651 ?auto_417659 ) ) ( not ( = ?auto_417652 ?auto_417653 ) ) ( not ( = ?auto_417652 ?auto_417654 ) ) ( not ( = ?auto_417652 ?auto_417655 ) ) ( not ( = ?auto_417652 ?auto_417656 ) ) ( not ( = ?auto_417652 ?auto_417657 ) ) ( not ( = ?auto_417652 ?auto_417658 ) ) ( not ( = ?auto_417652 ?auto_417659 ) ) ( not ( = ?auto_417653 ?auto_417654 ) ) ( not ( = ?auto_417653 ?auto_417655 ) ) ( not ( = ?auto_417653 ?auto_417656 ) ) ( not ( = ?auto_417653 ?auto_417657 ) ) ( not ( = ?auto_417653 ?auto_417658 ) ) ( not ( = ?auto_417653 ?auto_417659 ) ) ( not ( = ?auto_417654 ?auto_417655 ) ) ( not ( = ?auto_417654 ?auto_417656 ) ) ( not ( = ?auto_417654 ?auto_417657 ) ) ( not ( = ?auto_417654 ?auto_417658 ) ) ( not ( = ?auto_417654 ?auto_417659 ) ) ( not ( = ?auto_417655 ?auto_417656 ) ) ( not ( = ?auto_417655 ?auto_417657 ) ) ( not ( = ?auto_417655 ?auto_417658 ) ) ( not ( = ?auto_417655 ?auto_417659 ) ) ( not ( = ?auto_417656 ?auto_417657 ) ) ( not ( = ?auto_417656 ?auto_417658 ) ) ( not ( = ?auto_417656 ?auto_417659 ) ) ( not ( = ?auto_417657 ?auto_417658 ) ) ( not ( = ?auto_417657 ?auto_417659 ) ) ( not ( = ?auto_417658 ?auto_417659 ) ) ( ON ?auto_417658 ?auto_417659 ) ( ON ?auto_417657 ?auto_417658 ) ( ON ?auto_417656 ?auto_417657 ) ( ON ?auto_417655 ?auto_417656 ) ( ON ?auto_417654 ?auto_417655 ) ( ON ?auto_417653 ?auto_417654 ) ( ON ?auto_417652 ?auto_417653 ) ( ON ?auto_417651 ?auto_417652 ) ( CLEAR ?auto_417649 ) ( ON ?auto_417650 ?auto_417651 ) ( CLEAR ?auto_417650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_417645 ?auto_417646 ?auto_417647 ?auto_417648 ?auto_417649 ?auto_417650 )
      ( MAKE-15PILE ?auto_417645 ?auto_417646 ?auto_417647 ?auto_417648 ?auto_417649 ?auto_417650 ?auto_417651 ?auto_417652 ?auto_417653 ?auto_417654 ?auto_417655 ?auto_417656 ?auto_417657 ?auto_417658 ?auto_417659 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417675 - BLOCK
      ?auto_417676 - BLOCK
      ?auto_417677 - BLOCK
      ?auto_417678 - BLOCK
      ?auto_417679 - BLOCK
      ?auto_417680 - BLOCK
      ?auto_417681 - BLOCK
      ?auto_417682 - BLOCK
      ?auto_417683 - BLOCK
      ?auto_417684 - BLOCK
      ?auto_417685 - BLOCK
      ?auto_417686 - BLOCK
      ?auto_417687 - BLOCK
      ?auto_417688 - BLOCK
      ?auto_417689 - BLOCK
    )
    :vars
    (
      ?auto_417690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417689 ?auto_417690 ) ( ON-TABLE ?auto_417675 ) ( ON ?auto_417676 ?auto_417675 ) ( ON ?auto_417677 ?auto_417676 ) ( ON ?auto_417678 ?auto_417677 ) ( not ( = ?auto_417675 ?auto_417676 ) ) ( not ( = ?auto_417675 ?auto_417677 ) ) ( not ( = ?auto_417675 ?auto_417678 ) ) ( not ( = ?auto_417675 ?auto_417679 ) ) ( not ( = ?auto_417675 ?auto_417680 ) ) ( not ( = ?auto_417675 ?auto_417681 ) ) ( not ( = ?auto_417675 ?auto_417682 ) ) ( not ( = ?auto_417675 ?auto_417683 ) ) ( not ( = ?auto_417675 ?auto_417684 ) ) ( not ( = ?auto_417675 ?auto_417685 ) ) ( not ( = ?auto_417675 ?auto_417686 ) ) ( not ( = ?auto_417675 ?auto_417687 ) ) ( not ( = ?auto_417675 ?auto_417688 ) ) ( not ( = ?auto_417675 ?auto_417689 ) ) ( not ( = ?auto_417675 ?auto_417690 ) ) ( not ( = ?auto_417676 ?auto_417677 ) ) ( not ( = ?auto_417676 ?auto_417678 ) ) ( not ( = ?auto_417676 ?auto_417679 ) ) ( not ( = ?auto_417676 ?auto_417680 ) ) ( not ( = ?auto_417676 ?auto_417681 ) ) ( not ( = ?auto_417676 ?auto_417682 ) ) ( not ( = ?auto_417676 ?auto_417683 ) ) ( not ( = ?auto_417676 ?auto_417684 ) ) ( not ( = ?auto_417676 ?auto_417685 ) ) ( not ( = ?auto_417676 ?auto_417686 ) ) ( not ( = ?auto_417676 ?auto_417687 ) ) ( not ( = ?auto_417676 ?auto_417688 ) ) ( not ( = ?auto_417676 ?auto_417689 ) ) ( not ( = ?auto_417676 ?auto_417690 ) ) ( not ( = ?auto_417677 ?auto_417678 ) ) ( not ( = ?auto_417677 ?auto_417679 ) ) ( not ( = ?auto_417677 ?auto_417680 ) ) ( not ( = ?auto_417677 ?auto_417681 ) ) ( not ( = ?auto_417677 ?auto_417682 ) ) ( not ( = ?auto_417677 ?auto_417683 ) ) ( not ( = ?auto_417677 ?auto_417684 ) ) ( not ( = ?auto_417677 ?auto_417685 ) ) ( not ( = ?auto_417677 ?auto_417686 ) ) ( not ( = ?auto_417677 ?auto_417687 ) ) ( not ( = ?auto_417677 ?auto_417688 ) ) ( not ( = ?auto_417677 ?auto_417689 ) ) ( not ( = ?auto_417677 ?auto_417690 ) ) ( not ( = ?auto_417678 ?auto_417679 ) ) ( not ( = ?auto_417678 ?auto_417680 ) ) ( not ( = ?auto_417678 ?auto_417681 ) ) ( not ( = ?auto_417678 ?auto_417682 ) ) ( not ( = ?auto_417678 ?auto_417683 ) ) ( not ( = ?auto_417678 ?auto_417684 ) ) ( not ( = ?auto_417678 ?auto_417685 ) ) ( not ( = ?auto_417678 ?auto_417686 ) ) ( not ( = ?auto_417678 ?auto_417687 ) ) ( not ( = ?auto_417678 ?auto_417688 ) ) ( not ( = ?auto_417678 ?auto_417689 ) ) ( not ( = ?auto_417678 ?auto_417690 ) ) ( not ( = ?auto_417679 ?auto_417680 ) ) ( not ( = ?auto_417679 ?auto_417681 ) ) ( not ( = ?auto_417679 ?auto_417682 ) ) ( not ( = ?auto_417679 ?auto_417683 ) ) ( not ( = ?auto_417679 ?auto_417684 ) ) ( not ( = ?auto_417679 ?auto_417685 ) ) ( not ( = ?auto_417679 ?auto_417686 ) ) ( not ( = ?auto_417679 ?auto_417687 ) ) ( not ( = ?auto_417679 ?auto_417688 ) ) ( not ( = ?auto_417679 ?auto_417689 ) ) ( not ( = ?auto_417679 ?auto_417690 ) ) ( not ( = ?auto_417680 ?auto_417681 ) ) ( not ( = ?auto_417680 ?auto_417682 ) ) ( not ( = ?auto_417680 ?auto_417683 ) ) ( not ( = ?auto_417680 ?auto_417684 ) ) ( not ( = ?auto_417680 ?auto_417685 ) ) ( not ( = ?auto_417680 ?auto_417686 ) ) ( not ( = ?auto_417680 ?auto_417687 ) ) ( not ( = ?auto_417680 ?auto_417688 ) ) ( not ( = ?auto_417680 ?auto_417689 ) ) ( not ( = ?auto_417680 ?auto_417690 ) ) ( not ( = ?auto_417681 ?auto_417682 ) ) ( not ( = ?auto_417681 ?auto_417683 ) ) ( not ( = ?auto_417681 ?auto_417684 ) ) ( not ( = ?auto_417681 ?auto_417685 ) ) ( not ( = ?auto_417681 ?auto_417686 ) ) ( not ( = ?auto_417681 ?auto_417687 ) ) ( not ( = ?auto_417681 ?auto_417688 ) ) ( not ( = ?auto_417681 ?auto_417689 ) ) ( not ( = ?auto_417681 ?auto_417690 ) ) ( not ( = ?auto_417682 ?auto_417683 ) ) ( not ( = ?auto_417682 ?auto_417684 ) ) ( not ( = ?auto_417682 ?auto_417685 ) ) ( not ( = ?auto_417682 ?auto_417686 ) ) ( not ( = ?auto_417682 ?auto_417687 ) ) ( not ( = ?auto_417682 ?auto_417688 ) ) ( not ( = ?auto_417682 ?auto_417689 ) ) ( not ( = ?auto_417682 ?auto_417690 ) ) ( not ( = ?auto_417683 ?auto_417684 ) ) ( not ( = ?auto_417683 ?auto_417685 ) ) ( not ( = ?auto_417683 ?auto_417686 ) ) ( not ( = ?auto_417683 ?auto_417687 ) ) ( not ( = ?auto_417683 ?auto_417688 ) ) ( not ( = ?auto_417683 ?auto_417689 ) ) ( not ( = ?auto_417683 ?auto_417690 ) ) ( not ( = ?auto_417684 ?auto_417685 ) ) ( not ( = ?auto_417684 ?auto_417686 ) ) ( not ( = ?auto_417684 ?auto_417687 ) ) ( not ( = ?auto_417684 ?auto_417688 ) ) ( not ( = ?auto_417684 ?auto_417689 ) ) ( not ( = ?auto_417684 ?auto_417690 ) ) ( not ( = ?auto_417685 ?auto_417686 ) ) ( not ( = ?auto_417685 ?auto_417687 ) ) ( not ( = ?auto_417685 ?auto_417688 ) ) ( not ( = ?auto_417685 ?auto_417689 ) ) ( not ( = ?auto_417685 ?auto_417690 ) ) ( not ( = ?auto_417686 ?auto_417687 ) ) ( not ( = ?auto_417686 ?auto_417688 ) ) ( not ( = ?auto_417686 ?auto_417689 ) ) ( not ( = ?auto_417686 ?auto_417690 ) ) ( not ( = ?auto_417687 ?auto_417688 ) ) ( not ( = ?auto_417687 ?auto_417689 ) ) ( not ( = ?auto_417687 ?auto_417690 ) ) ( not ( = ?auto_417688 ?auto_417689 ) ) ( not ( = ?auto_417688 ?auto_417690 ) ) ( not ( = ?auto_417689 ?auto_417690 ) ) ( ON ?auto_417688 ?auto_417689 ) ( ON ?auto_417687 ?auto_417688 ) ( ON ?auto_417686 ?auto_417687 ) ( ON ?auto_417685 ?auto_417686 ) ( ON ?auto_417684 ?auto_417685 ) ( ON ?auto_417683 ?auto_417684 ) ( ON ?auto_417682 ?auto_417683 ) ( ON ?auto_417681 ?auto_417682 ) ( ON ?auto_417680 ?auto_417681 ) ( CLEAR ?auto_417678 ) ( ON ?auto_417679 ?auto_417680 ) ( CLEAR ?auto_417679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_417675 ?auto_417676 ?auto_417677 ?auto_417678 ?auto_417679 )
      ( MAKE-15PILE ?auto_417675 ?auto_417676 ?auto_417677 ?auto_417678 ?auto_417679 ?auto_417680 ?auto_417681 ?auto_417682 ?auto_417683 ?auto_417684 ?auto_417685 ?auto_417686 ?auto_417687 ?auto_417688 ?auto_417689 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417706 - BLOCK
      ?auto_417707 - BLOCK
      ?auto_417708 - BLOCK
      ?auto_417709 - BLOCK
      ?auto_417710 - BLOCK
      ?auto_417711 - BLOCK
      ?auto_417712 - BLOCK
      ?auto_417713 - BLOCK
      ?auto_417714 - BLOCK
      ?auto_417715 - BLOCK
      ?auto_417716 - BLOCK
      ?auto_417717 - BLOCK
      ?auto_417718 - BLOCK
      ?auto_417719 - BLOCK
      ?auto_417720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417720 ) ( ON-TABLE ?auto_417706 ) ( ON ?auto_417707 ?auto_417706 ) ( ON ?auto_417708 ?auto_417707 ) ( ON ?auto_417709 ?auto_417708 ) ( not ( = ?auto_417706 ?auto_417707 ) ) ( not ( = ?auto_417706 ?auto_417708 ) ) ( not ( = ?auto_417706 ?auto_417709 ) ) ( not ( = ?auto_417706 ?auto_417710 ) ) ( not ( = ?auto_417706 ?auto_417711 ) ) ( not ( = ?auto_417706 ?auto_417712 ) ) ( not ( = ?auto_417706 ?auto_417713 ) ) ( not ( = ?auto_417706 ?auto_417714 ) ) ( not ( = ?auto_417706 ?auto_417715 ) ) ( not ( = ?auto_417706 ?auto_417716 ) ) ( not ( = ?auto_417706 ?auto_417717 ) ) ( not ( = ?auto_417706 ?auto_417718 ) ) ( not ( = ?auto_417706 ?auto_417719 ) ) ( not ( = ?auto_417706 ?auto_417720 ) ) ( not ( = ?auto_417707 ?auto_417708 ) ) ( not ( = ?auto_417707 ?auto_417709 ) ) ( not ( = ?auto_417707 ?auto_417710 ) ) ( not ( = ?auto_417707 ?auto_417711 ) ) ( not ( = ?auto_417707 ?auto_417712 ) ) ( not ( = ?auto_417707 ?auto_417713 ) ) ( not ( = ?auto_417707 ?auto_417714 ) ) ( not ( = ?auto_417707 ?auto_417715 ) ) ( not ( = ?auto_417707 ?auto_417716 ) ) ( not ( = ?auto_417707 ?auto_417717 ) ) ( not ( = ?auto_417707 ?auto_417718 ) ) ( not ( = ?auto_417707 ?auto_417719 ) ) ( not ( = ?auto_417707 ?auto_417720 ) ) ( not ( = ?auto_417708 ?auto_417709 ) ) ( not ( = ?auto_417708 ?auto_417710 ) ) ( not ( = ?auto_417708 ?auto_417711 ) ) ( not ( = ?auto_417708 ?auto_417712 ) ) ( not ( = ?auto_417708 ?auto_417713 ) ) ( not ( = ?auto_417708 ?auto_417714 ) ) ( not ( = ?auto_417708 ?auto_417715 ) ) ( not ( = ?auto_417708 ?auto_417716 ) ) ( not ( = ?auto_417708 ?auto_417717 ) ) ( not ( = ?auto_417708 ?auto_417718 ) ) ( not ( = ?auto_417708 ?auto_417719 ) ) ( not ( = ?auto_417708 ?auto_417720 ) ) ( not ( = ?auto_417709 ?auto_417710 ) ) ( not ( = ?auto_417709 ?auto_417711 ) ) ( not ( = ?auto_417709 ?auto_417712 ) ) ( not ( = ?auto_417709 ?auto_417713 ) ) ( not ( = ?auto_417709 ?auto_417714 ) ) ( not ( = ?auto_417709 ?auto_417715 ) ) ( not ( = ?auto_417709 ?auto_417716 ) ) ( not ( = ?auto_417709 ?auto_417717 ) ) ( not ( = ?auto_417709 ?auto_417718 ) ) ( not ( = ?auto_417709 ?auto_417719 ) ) ( not ( = ?auto_417709 ?auto_417720 ) ) ( not ( = ?auto_417710 ?auto_417711 ) ) ( not ( = ?auto_417710 ?auto_417712 ) ) ( not ( = ?auto_417710 ?auto_417713 ) ) ( not ( = ?auto_417710 ?auto_417714 ) ) ( not ( = ?auto_417710 ?auto_417715 ) ) ( not ( = ?auto_417710 ?auto_417716 ) ) ( not ( = ?auto_417710 ?auto_417717 ) ) ( not ( = ?auto_417710 ?auto_417718 ) ) ( not ( = ?auto_417710 ?auto_417719 ) ) ( not ( = ?auto_417710 ?auto_417720 ) ) ( not ( = ?auto_417711 ?auto_417712 ) ) ( not ( = ?auto_417711 ?auto_417713 ) ) ( not ( = ?auto_417711 ?auto_417714 ) ) ( not ( = ?auto_417711 ?auto_417715 ) ) ( not ( = ?auto_417711 ?auto_417716 ) ) ( not ( = ?auto_417711 ?auto_417717 ) ) ( not ( = ?auto_417711 ?auto_417718 ) ) ( not ( = ?auto_417711 ?auto_417719 ) ) ( not ( = ?auto_417711 ?auto_417720 ) ) ( not ( = ?auto_417712 ?auto_417713 ) ) ( not ( = ?auto_417712 ?auto_417714 ) ) ( not ( = ?auto_417712 ?auto_417715 ) ) ( not ( = ?auto_417712 ?auto_417716 ) ) ( not ( = ?auto_417712 ?auto_417717 ) ) ( not ( = ?auto_417712 ?auto_417718 ) ) ( not ( = ?auto_417712 ?auto_417719 ) ) ( not ( = ?auto_417712 ?auto_417720 ) ) ( not ( = ?auto_417713 ?auto_417714 ) ) ( not ( = ?auto_417713 ?auto_417715 ) ) ( not ( = ?auto_417713 ?auto_417716 ) ) ( not ( = ?auto_417713 ?auto_417717 ) ) ( not ( = ?auto_417713 ?auto_417718 ) ) ( not ( = ?auto_417713 ?auto_417719 ) ) ( not ( = ?auto_417713 ?auto_417720 ) ) ( not ( = ?auto_417714 ?auto_417715 ) ) ( not ( = ?auto_417714 ?auto_417716 ) ) ( not ( = ?auto_417714 ?auto_417717 ) ) ( not ( = ?auto_417714 ?auto_417718 ) ) ( not ( = ?auto_417714 ?auto_417719 ) ) ( not ( = ?auto_417714 ?auto_417720 ) ) ( not ( = ?auto_417715 ?auto_417716 ) ) ( not ( = ?auto_417715 ?auto_417717 ) ) ( not ( = ?auto_417715 ?auto_417718 ) ) ( not ( = ?auto_417715 ?auto_417719 ) ) ( not ( = ?auto_417715 ?auto_417720 ) ) ( not ( = ?auto_417716 ?auto_417717 ) ) ( not ( = ?auto_417716 ?auto_417718 ) ) ( not ( = ?auto_417716 ?auto_417719 ) ) ( not ( = ?auto_417716 ?auto_417720 ) ) ( not ( = ?auto_417717 ?auto_417718 ) ) ( not ( = ?auto_417717 ?auto_417719 ) ) ( not ( = ?auto_417717 ?auto_417720 ) ) ( not ( = ?auto_417718 ?auto_417719 ) ) ( not ( = ?auto_417718 ?auto_417720 ) ) ( not ( = ?auto_417719 ?auto_417720 ) ) ( ON ?auto_417719 ?auto_417720 ) ( ON ?auto_417718 ?auto_417719 ) ( ON ?auto_417717 ?auto_417718 ) ( ON ?auto_417716 ?auto_417717 ) ( ON ?auto_417715 ?auto_417716 ) ( ON ?auto_417714 ?auto_417715 ) ( ON ?auto_417713 ?auto_417714 ) ( ON ?auto_417712 ?auto_417713 ) ( ON ?auto_417711 ?auto_417712 ) ( CLEAR ?auto_417709 ) ( ON ?auto_417710 ?auto_417711 ) ( CLEAR ?auto_417710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_417706 ?auto_417707 ?auto_417708 ?auto_417709 ?auto_417710 )
      ( MAKE-15PILE ?auto_417706 ?auto_417707 ?auto_417708 ?auto_417709 ?auto_417710 ?auto_417711 ?auto_417712 ?auto_417713 ?auto_417714 ?auto_417715 ?auto_417716 ?auto_417717 ?auto_417718 ?auto_417719 ?auto_417720 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417736 - BLOCK
      ?auto_417737 - BLOCK
      ?auto_417738 - BLOCK
      ?auto_417739 - BLOCK
      ?auto_417740 - BLOCK
      ?auto_417741 - BLOCK
      ?auto_417742 - BLOCK
      ?auto_417743 - BLOCK
      ?auto_417744 - BLOCK
      ?auto_417745 - BLOCK
      ?auto_417746 - BLOCK
      ?auto_417747 - BLOCK
      ?auto_417748 - BLOCK
      ?auto_417749 - BLOCK
      ?auto_417750 - BLOCK
    )
    :vars
    (
      ?auto_417751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417750 ?auto_417751 ) ( ON-TABLE ?auto_417736 ) ( ON ?auto_417737 ?auto_417736 ) ( ON ?auto_417738 ?auto_417737 ) ( not ( = ?auto_417736 ?auto_417737 ) ) ( not ( = ?auto_417736 ?auto_417738 ) ) ( not ( = ?auto_417736 ?auto_417739 ) ) ( not ( = ?auto_417736 ?auto_417740 ) ) ( not ( = ?auto_417736 ?auto_417741 ) ) ( not ( = ?auto_417736 ?auto_417742 ) ) ( not ( = ?auto_417736 ?auto_417743 ) ) ( not ( = ?auto_417736 ?auto_417744 ) ) ( not ( = ?auto_417736 ?auto_417745 ) ) ( not ( = ?auto_417736 ?auto_417746 ) ) ( not ( = ?auto_417736 ?auto_417747 ) ) ( not ( = ?auto_417736 ?auto_417748 ) ) ( not ( = ?auto_417736 ?auto_417749 ) ) ( not ( = ?auto_417736 ?auto_417750 ) ) ( not ( = ?auto_417736 ?auto_417751 ) ) ( not ( = ?auto_417737 ?auto_417738 ) ) ( not ( = ?auto_417737 ?auto_417739 ) ) ( not ( = ?auto_417737 ?auto_417740 ) ) ( not ( = ?auto_417737 ?auto_417741 ) ) ( not ( = ?auto_417737 ?auto_417742 ) ) ( not ( = ?auto_417737 ?auto_417743 ) ) ( not ( = ?auto_417737 ?auto_417744 ) ) ( not ( = ?auto_417737 ?auto_417745 ) ) ( not ( = ?auto_417737 ?auto_417746 ) ) ( not ( = ?auto_417737 ?auto_417747 ) ) ( not ( = ?auto_417737 ?auto_417748 ) ) ( not ( = ?auto_417737 ?auto_417749 ) ) ( not ( = ?auto_417737 ?auto_417750 ) ) ( not ( = ?auto_417737 ?auto_417751 ) ) ( not ( = ?auto_417738 ?auto_417739 ) ) ( not ( = ?auto_417738 ?auto_417740 ) ) ( not ( = ?auto_417738 ?auto_417741 ) ) ( not ( = ?auto_417738 ?auto_417742 ) ) ( not ( = ?auto_417738 ?auto_417743 ) ) ( not ( = ?auto_417738 ?auto_417744 ) ) ( not ( = ?auto_417738 ?auto_417745 ) ) ( not ( = ?auto_417738 ?auto_417746 ) ) ( not ( = ?auto_417738 ?auto_417747 ) ) ( not ( = ?auto_417738 ?auto_417748 ) ) ( not ( = ?auto_417738 ?auto_417749 ) ) ( not ( = ?auto_417738 ?auto_417750 ) ) ( not ( = ?auto_417738 ?auto_417751 ) ) ( not ( = ?auto_417739 ?auto_417740 ) ) ( not ( = ?auto_417739 ?auto_417741 ) ) ( not ( = ?auto_417739 ?auto_417742 ) ) ( not ( = ?auto_417739 ?auto_417743 ) ) ( not ( = ?auto_417739 ?auto_417744 ) ) ( not ( = ?auto_417739 ?auto_417745 ) ) ( not ( = ?auto_417739 ?auto_417746 ) ) ( not ( = ?auto_417739 ?auto_417747 ) ) ( not ( = ?auto_417739 ?auto_417748 ) ) ( not ( = ?auto_417739 ?auto_417749 ) ) ( not ( = ?auto_417739 ?auto_417750 ) ) ( not ( = ?auto_417739 ?auto_417751 ) ) ( not ( = ?auto_417740 ?auto_417741 ) ) ( not ( = ?auto_417740 ?auto_417742 ) ) ( not ( = ?auto_417740 ?auto_417743 ) ) ( not ( = ?auto_417740 ?auto_417744 ) ) ( not ( = ?auto_417740 ?auto_417745 ) ) ( not ( = ?auto_417740 ?auto_417746 ) ) ( not ( = ?auto_417740 ?auto_417747 ) ) ( not ( = ?auto_417740 ?auto_417748 ) ) ( not ( = ?auto_417740 ?auto_417749 ) ) ( not ( = ?auto_417740 ?auto_417750 ) ) ( not ( = ?auto_417740 ?auto_417751 ) ) ( not ( = ?auto_417741 ?auto_417742 ) ) ( not ( = ?auto_417741 ?auto_417743 ) ) ( not ( = ?auto_417741 ?auto_417744 ) ) ( not ( = ?auto_417741 ?auto_417745 ) ) ( not ( = ?auto_417741 ?auto_417746 ) ) ( not ( = ?auto_417741 ?auto_417747 ) ) ( not ( = ?auto_417741 ?auto_417748 ) ) ( not ( = ?auto_417741 ?auto_417749 ) ) ( not ( = ?auto_417741 ?auto_417750 ) ) ( not ( = ?auto_417741 ?auto_417751 ) ) ( not ( = ?auto_417742 ?auto_417743 ) ) ( not ( = ?auto_417742 ?auto_417744 ) ) ( not ( = ?auto_417742 ?auto_417745 ) ) ( not ( = ?auto_417742 ?auto_417746 ) ) ( not ( = ?auto_417742 ?auto_417747 ) ) ( not ( = ?auto_417742 ?auto_417748 ) ) ( not ( = ?auto_417742 ?auto_417749 ) ) ( not ( = ?auto_417742 ?auto_417750 ) ) ( not ( = ?auto_417742 ?auto_417751 ) ) ( not ( = ?auto_417743 ?auto_417744 ) ) ( not ( = ?auto_417743 ?auto_417745 ) ) ( not ( = ?auto_417743 ?auto_417746 ) ) ( not ( = ?auto_417743 ?auto_417747 ) ) ( not ( = ?auto_417743 ?auto_417748 ) ) ( not ( = ?auto_417743 ?auto_417749 ) ) ( not ( = ?auto_417743 ?auto_417750 ) ) ( not ( = ?auto_417743 ?auto_417751 ) ) ( not ( = ?auto_417744 ?auto_417745 ) ) ( not ( = ?auto_417744 ?auto_417746 ) ) ( not ( = ?auto_417744 ?auto_417747 ) ) ( not ( = ?auto_417744 ?auto_417748 ) ) ( not ( = ?auto_417744 ?auto_417749 ) ) ( not ( = ?auto_417744 ?auto_417750 ) ) ( not ( = ?auto_417744 ?auto_417751 ) ) ( not ( = ?auto_417745 ?auto_417746 ) ) ( not ( = ?auto_417745 ?auto_417747 ) ) ( not ( = ?auto_417745 ?auto_417748 ) ) ( not ( = ?auto_417745 ?auto_417749 ) ) ( not ( = ?auto_417745 ?auto_417750 ) ) ( not ( = ?auto_417745 ?auto_417751 ) ) ( not ( = ?auto_417746 ?auto_417747 ) ) ( not ( = ?auto_417746 ?auto_417748 ) ) ( not ( = ?auto_417746 ?auto_417749 ) ) ( not ( = ?auto_417746 ?auto_417750 ) ) ( not ( = ?auto_417746 ?auto_417751 ) ) ( not ( = ?auto_417747 ?auto_417748 ) ) ( not ( = ?auto_417747 ?auto_417749 ) ) ( not ( = ?auto_417747 ?auto_417750 ) ) ( not ( = ?auto_417747 ?auto_417751 ) ) ( not ( = ?auto_417748 ?auto_417749 ) ) ( not ( = ?auto_417748 ?auto_417750 ) ) ( not ( = ?auto_417748 ?auto_417751 ) ) ( not ( = ?auto_417749 ?auto_417750 ) ) ( not ( = ?auto_417749 ?auto_417751 ) ) ( not ( = ?auto_417750 ?auto_417751 ) ) ( ON ?auto_417749 ?auto_417750 ) ( ON ?auto_417748 ?auto_417749 ) ( ON ?auto_417747 ?auto_417748 ) ( ON ?auto_417746 ?auto_417747 ) ( ON ?auto_417745 ?auto_417746 ) ( ON ?auto_417744 ?auto_417745 ) ( ON ?auto_417743 ?auto_417744 ) ( ON ?auto_417742 ?auto_417743 ) ( ON ?auto_417741 ?auto_417742 ) ( ON ?auto_417740 ?auto_417741 ) ( CLEAR ?auto_417738 ) ( ON ?auto_417739 ?auto_417740 ) ( CLEAR ?auto_417739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_417736 ?auto_417737 ?auto_417738 ?auto_417739 )
      ( MAKE-15PILE ?auto_417736 ?auto_417737 ?auto_417738 ?auto_417739 ?auto_417740 ?auto_417741 ?auto_417742 ?auto_417743 ?auto_417744 ?auto_417745 ?auto_417746 ?auto_417747 ?auto_417748 ?auto_417749 ?auto_417750 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417767 - BLOCK
      ?auto_417768 - BLOCK
      ?auto_417769 - BLOCK
      ?auto_417770 - BLOCK
      ?auto_417771 - BLOCK
      ?auto_417772 - BLOCK
      ?auto_417773 - BLOCK
      ?auto_417774 - BLOCK
      ?auto_417775 - BLOCK
      ?auto_417776 - BLOCK
      ?auto_417777 - BLOCK
      ?auto_417778 - BLOCK
      ?auto_417779 - BLOCK
      ?auto_417780 - BLOCK
      ?auto_417781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417781 ) ( ON-TABLE ?auto_417767 ) ( ON ?auto_417768 ?auto_417767 ) ( ON ?auto_417769 ?auto_417768 ) ( not ( = ?auto_417767 ?auto_417768 ) ) ( not ( = ?auto_417767 ?auto_417769 ) ) ( not ( = ?auto_417767 ?auto_417770 ) ) ( not ( = ?auto_417767 ?auto_417771 ) ) ( not ( = ?auto_417767 ?auto_417772 ) ) ( not ( = ?auto_417767 ?auto_417773 ) ) ( not ( = ?auto_417767 ?auto_417774 ) ) ( not ( = ?auto_417767 ?auto_417775 ) ) ( not ( = ?auto_417767 ?auto_417776 ) ) ( not ( = ?auto_417767 ?auto_417777 ) ) ( not ( = ?auto_417767 ?auto_417778 ) ) ( not ( = ?auto_417767 ?auto_417779 ) ) ( not ( = ?auto_417767 ?auto_417780 ) ) ( not ( = ?auto_417767 ?auto_417781 ) ) ( not ( = ?auto_417768 ?auto_417769 ) ) ( not ( = ?auto_417768 ?auto_417770 ) ) ( not ( = ?auto_417768 ?auto_417771 ) ) ( not ( = ?auto_417768 ?auto_417772 ) ) ( not ( = ?auto_417768 ?auto_417773 ) ) ( not ( = ?auto_417768 ?auto_417774 ) ) ( not ( = ?auto_417768 ?auto_417775 ) ) ( not ( = ?auto_417768 ?auto_417776 ) ) ( not ( = ?auto_417768 ?auto_417777 ) ) ( not ( = ?auto_417768 ?auto_417778 ) ) ( not ( = ?auto_417768 ?auto_417779 ) ) ( not ( = ?auto_417768 ?auto_417780 ) ) ( not ( = ?auto_417768 ?auto_417781 ) ) ( not ( = ?auto_417769 ?auto_417770 ) ) ( not ( = ?auto_417769 ?auto_417771 ) ) ( not ( = ?auto_417769 ?auto_417772 ) ) ( not ( = ?auto_417769 ?auto_417773 ) ) ( not ( = ?auto_417769 ?auto_417774 ) ) ( not ( = ?auto_417769 ?auto_417775 ) ) ( not ( = ?auto_417769 ?auto_417776 ) ) ( not ( = ?auto_417769 ?auto_417777 ) ) ( not ( = ?auto_417769 ?auto_417778 ) ) ( not ( = ?auto_417769 ?auto_417779 ) ) ( not ( = ?auto_417769 ?auto_417780 ) ) ( not ( = ?auto_417769 ?auto_417781 ) ) ( not ( = ?auto_417770 ?auto_417771 ) ) ( not ( = ?auto_417770 ?auto_417772 ) ) ( not ( = ?auto_417770 ?auto_417773 ) ) ( not ( = ?auto_417770 ?auto_417774 ) ) ( not ( = ?auto_417770 ?auto_417775 ) ) ( not ( = ?auto_417770 ?auto_417776 ) ) ( not ( = ?auto_417770 ?auto_417777 ) ) ( not ( = ?auto_417770 ?auto_417778 ) ) ( not ( = ?auto_417770 ?auto_417779 ) ) ( not ( = ?auto_417770 ?auto_417780 ) ) ( not ( = ?auto_417770 ?auto_417781 ) ) ( not ( = ?auto_417771 ?auto_417772 ) ) ( not ( = ?auto_417771 ?auto_417773 ) ) ( not ( = ?auto_417771 ?auto_417774 ) ) ( not ( = ?auto_417771 ?auto_417775 ) ) ( not ( = ?auto_417771 ?auto_417776 ) ) ( not ( = ?auto_417771 ?auto_417777 ) ) ( not ( = ?auto_417771 ?auto_417778 ) ) ( not ( = ?auto_417771 ?auto_417779 ) ) ( not ( = ?auto_417771 ?auto_417780 ) ) ( not ( = ?auto_417771 ?auto_417781 ) ) ( not ( = ?auto_417772 ?auto_417773 ) ) ( not ( = ?auto_417772 ?auto_417774 ) ) ( not ( = ?auto_417772 ?auto_417775 ) ) ( not ( = ?auto_417772 ?auto_417776 ) ) ( not ( = ?auto_417772 ?auto_417777 ) ) ( not ( = ?auto_417772 ?auto_417778 ) ) ( not ( = ?auto_417772 ?auto_417779 ) ) ( not ( = ?auto_417772 ?auto_417780 ) ) ( not ( = ?auto_417772 ?auto_417781 ) ) ( not ( = ?auto_417773 ?auto_417774 ) ) ( not ( = ?auto_417773 ?auto_417775 ) ) ( not ( = ?auto_417773 ?auto_417776 ) ) ( not ( = ?auto_417773 ?auto_417777 ) ) ( not ( = ?auto_417773 ?auto_417778 ) ) ( not ( = ?auto_417773 ?auto_417779 ) ) ( not ( = ?auto_417773 ?auto_417780 ) ) ( not ( = ?auto_417773 ?auto_417781 ) ) ( not ( = ?auto_417774 ?auto_417775 ) ) ( not ( = ?auto_417774 ?auto_417776 ) ) ( not ( = ?auto_417774 ?auto_417777 ) ) ( not ( = ?auto_417774 ?auto_417778 ) ) ( not ( = ?auto_417774 ?auto_417779 ) ) ( not ( = ?auto_417774 ?auto_417780 ) ) ( not ( = ?auto_417774 ?auto_417781 ) ) ( not ( = ?auto_417775 ?auto_417776 ) ) ( not ( = ?auto_417775 ?auto_417777 ) ) ( not ( = ?auto_417775 ?auto_417778 ) ) ( not ( = ?auto_417775 ?auto_417779 ) ) ( not ( = ?auto_417775 ?auto_417780 ) ) ( not ( = ?auto_417775 ?auto_417781 ) ) ( not ( = ?auto_417776 ?auto_417777 ) ) ( not ( = ?auto_417776 ?auto_417778 ) ) ( not ( = ?auto_417776 ?auto_417779 ) ) ( not ( = ?auto_417776 ?auto_417780 ) ) ( not ( = ?auto_417776 ?auto_417781 ) ) ( not ( = ?auto_417777 ?auto_417778 ) ) ( not ( = ?auto_417777 ?auto_417779 ) ) ( not ( = ?auto_417777 ?auto_417780 ) ) ( not ( = ?auto_417777 ?auto_417781 ) ) ( not ( = ?auto_417778 ?auto_417779 ) ) ( not ( = ?auto_417778 ?auto_417780 ) ) ( not ( = ?auto_417778 ?auto_417781 ) ) ( not ( = ?auto_417779 ?auto_417780 ) ) ( not ( = ?auto_417779 ?auto_417781 ) ) ( not ( = ?auto_417780 ?auto_417781 ) ) ( ON ?auto_417780 ?auto_417781 ) ( ON ?auto_417779 ?auto_417780 ) ( ON ?auto_417778 ?auto_417779 ) ( ON ?auto_417777 ?auto_417778 ) ( ON ?auto_417776 ?auto_417777 ) ( ON ?auto_417775 ?auto_417776 ) ( ON ?auto_417774 ?auto_417775 ) ( ON ?auto_417773 ?auto_417774 ) ( ON ?auto_417772 ?auto_417773 ) ( ON ?auto_417771 ?auto_417772 ) ( CLEAR ?auto_417769 ) ( ON ?auto_417770 ?auto_417771 ) ( CLEAR ?auto_417770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_417767 ?auto_417768 ?auto_417769 ?auto_417770 )
      ( MAKE-15PILE ?auto_417767 ?auto_417768 ?auto_417769 ?auto_417770 ?auto_417771 ?auto_417772 ?auto_417773 ?auto_417774 ?auto_417775 ?auto_417776 ?auto_417777 ?auto_417778 ?auto_417779 ?auto_417780 ?auto_417781 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417797 - BLOCK
      ?auto_417798 - BLOCK
      ?auto_417799 - BLOCK
      ?auto_417800 - BLOCK
      ?auto_417801 - BLOCK
      ?auto_417802 - BLOCK
      ?auto_417803 - BLOCK
      ?auto_417804 - BLOCK
      ?auto_417805 - BLOCK
      ?auto_417806 - BLOCK
      ?auto_417807 - BLOCK
      ?auto_417808 - BLOCK
      ?auto_417809 - BLOCK
      ?auto_417810 - BLOCK
      ?auto_417811 - BLOCK
    )
    :vars
    (
      ?auto_417812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417811 ?auto_417812 ) ( ON-TABLE ?auto_417797 ) ( ON ?auto_417798 ?auto_417797 ) ( not ( = ?auto_417797 ?auto_417798 ) ) ( not ( = ?auto_417797 ?auto_417799 ) ) ( not ( = ?auto_417797 ?auto_417800 ) ) ( not ( = ?auto_417797 ?auto_417801 ) ) ( not ( = ?auto_417797 ?auto_417802 ) ) ( not ( = ?auto_417797 ?auto_417803 ) ) ( not ( = ?auto_417797 ?auto_417804 ) ) ( not ( = ?auto_417797 ?auto_417805 ) ) ( not ( = ?auto_417797 ?auto_417806 ) ) ( not ( = ?auto_417797 ?auto_417807 ) ) ( not ( = ?auto_417797 ?auto_417808 ) ) ( not ( = ?auto_417797 ?auto_417809 ) ) ( not ( = ?auto_417797 ?auto_417810 ) ) ( not ( = ?auto_417797 ?auto_417811 ) ) ( not ( = ?auto_417797 ?auto_417812 ) ) ( not ( = ?auto_417798 ?auto_417799 ) ) ( not ( = ?auto_417798 ?auto_417800 ) ) ( not ( = ?auto_417798 ?auto_417801 ) ) ( not ( = ?auto_417798 ?auto_417802 ) ) ( not ( = ?auto_417798 ?auto_417803 ) ) ( not ( = ?auto_417798 ?auto_417804 ) ) ( not ( = ?auto_417798 ?auto_417805 ) ) ( not ( = ?auto_417798 ?auto_417806 ) ) ( not ( = ?auto_417798 ?auto_417807 ) ) ( not ( = ?auto_417798 ?auto_417808 ) ) ( not ( = ?auto_417798 ?auto_417809 ) ) ( not ( = ?auto_417798 ?auto_417810 ) ) ( not ( = ?auto_417798 ?auto_417811 ) ) ( not ( = ?auto_417798 ?auto_417812 ) ) ( not ( = ?auto_417799 ?auto_417800 ) ) ( not ( = ?auto_417799 ?auto_417801 ) ) ( not ( = ?auto_417799 ?auto_417802 ) ) ( not ( = ?auto_417799 ?auto_417803 ) ) ( not ( = ?auto_417799 ?auto_417804 ) ) ( not ( = ?auto_417799 ?auto_417805 ) ) ( not ( = ?auto_417799 ?auto_417806 ) ) ( not ( = ?auto_417799 ?auto_417807 ) ) ( not ( = ?auto_417799 ?auto_417808 ) ) ( not ( = ?auto_417799 ?auto_417809 ) ) ( not ( = ?auto_417799 ?auto_417810 ) ) ( not ( = ?auto_417799 ?auto_417811 ) ) ( not ( = ?auto_417799 ?auto_417812 ) ) ( not ( = ?auto_417800 ?auto_417801 ) ) ( not ( = ?auto_417800 ?auto_417802 ) ) ( not ( = ?auto_417800 ?auto_417803 ) ) ( not ( = ?auto_417800 ?auto_417804 ) ) ( not ( = ?auto_417800 ?auto_417805 ) ) ( not ( = ?auto_417800 ?auto_417806 ) ) ( not ( = ?auto_417800 ?auto_417807 ) ) ( not ( = ?auto_417800 ?auto_417808 ) ) ( not ( = ?auto_417800 ?auto_417809 ) ) ( not ( = ?auto_417800 ?auto_417810 ) ) ( not ( = ?auto_417800 ?auto_417811 ) ) ( not ( = ?auto_417800 ?auto_417812 ) ) ( not ( = ?auto_417801 ?auto_417802 ) ) ( not ( = ?auto_417801 ?auto_417803 ) ) ( not ( = ?auto_417801 ?auto_417804 ) ) ( not ( = ?auto_417801 ?auto_417805 ) ) ( not ( = ?auto_417801 ?auto_417806 ) ) ( not ( = ?auto_417801 ?auto_417807 ) ) ( not ( = ?auto_417801 ?auto_417808 ) ) ( not ( = ?auto_417801 ?auto_417809 ) ) ( not ( = ?auto_417801 ?auto_417810 ) ) ( not ( = ?auto_417801 ?auto_417811 ) ) ( not ( = ?auto_417801 ?auto_417812 ) ) ( not ( = ?auto_417802 ?auto_417803 ) ) ( not ( = ?auto_417802 ?auto_417804 ) ) ( not ( = ?auto_417802 ?auto_417805 ) ) ( not ( = ?auto_417802 ?auto_417806 ) ) ( not ( = ?auto_417802 ?auto_417807 ) ) ( not ( = ?auto_417802 ?auto_417808 ) ) ( not ( = ?auto_417802 ?auto_417809 ) ) ( not ( = ?auto_417802 ?auto_417810 ) ) ( not ( = ?auto_417802 ?auto_417811 ) ) ( not ( = ?auto_417802 ?auto_417812 ) ) ( not ( = ?auto_417803 ?auto_417804 ) ) ( not ( = ?auto_417803 ?auto_417805 ) ) ( not ( = ?auto_417803 ?auto_417806 ) ) ( not ( = ?auto_417803 ?auto_417807 ) ) ( not ( = ?auto_417803 ?auto_417808 ) ) ( not ( = ?auto_417803 ?auto_417809 ) ) ( not ( = ?auto_417803 ?auto_417810 ) ) ( not ( = ?auto_417803 ?auto_417811 ) ) ( not ( = ?auto_417803 ?auto_417812 ) ) ( not ( = ?auto_417804 ?auto_417805 ) ) ( not ( = ?auto_417804 ?auto_417806 ) ) ( not ( = ?auto_417804 ?auto_417807 ) ) ( not ( = ?auto_417804 ?auto_417808 ) ) ( not ( = ?auto_417804 ?auto_417809 ) ) ( not ( = ?auto_417804 ?auto_417810 ) ) ( not ( = ?auto_417804 ?auto_417811 ) ) ( not ( = ?auto_417804 ?auto_417812 ) ) ( not ( = ?auto_417805 ?auto_417806 ) ) ( not ( = ?auto_417805 ?auto_417807 ) ) ( not ( = ?auto_417805 ?auto_417808 ) ) ( not ( = ?auto_417805 ?auto_417809 ) ) ( not ( = ?auto_417805 ?auto_417810 ) ) ( not ( = ?auto_417805 ?auto_417811 ) ) ( not ( = ?auto_417805 ?auto_417812 ) ) ( not ( = ?auto_417806 ?auto_417807 ) ) ( not ( = ?auto_417806 ?auto_417808 ) ) ( not ( = ?auto_417806 ?auto_417809 ) ) ( not ( = ?auto_417806 ?auto_417810 ) ) ( not ( = ?auto_417806 ?auto_417811 ) ) ( not ( = ?auto_417806 ?auto_417812 ) ) ( not ( = ?auto_417807 ?auto_417808 ) ) ( not ( = ?auto_417807 ?auto_417809 ) ) ( not ( = ?auto_417807 ?auto_417810 ) ) ( not ( = ?auto_417807 ?auto_417811 ) ) ( not ( = ?auto_417807 ?auto_417812 ) ) ( not ( = ?auto_417808 ?auto_417809 ) ) ( not ( = ?auto_417808 ?auto_417810 ) ) ( not ( = ?auto_417808 ?auto_417811 ) ) ( not ( = ?auto_417808 ?auto_417812 ) ) ( not ( = ?auto_417809 ?auto_417810 ) ) ( not ( = ?auto_417809 ?auto_417811 ) ) ( not ( = ?auto_417809 ?auto_417812 ) ) ( not ( = ?auto_417810 ?auto_417811 ) ) ( not ( = ?auto_417810 ?auto_417812 ) ) ( not ( = ?auto_417811 ?auto_417812 ) ) ( ON ?auto_417810 ?auto_417811 ) ( ON ?auto_417809 ?auto_417810 ) ( ON ?auto_417808 ?auto_417809 ) ( ON ?auto_417807 ?auto_417808 ) ( ON ?auto_417806 ?auto_417807 ) ( ON ?auto_417805 ?auto_417806 ) ( ON ?auto_417804 ?auto_417805 ) ( ON ?auto_417803 ?auto_417804 ) ( ON ?auto_417802 ?auto_417803 ) ( ON ?auto_417801 ?auto_417802 ) ( ON ?auto_417800 ?auto_417801 ) ( CLEAR ?auto_417798 ) ( ON ?auto_417799 ?auto_417800 ) ( CLEAR ?auto_417799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_417797 ?auto_417798 ?auto_417799 )
      ( MAKE-15PILE ?auto_417797 ?auto_417798 ?auto_417799 ?auto_417800 ?auto_417801 ?auto_417802 ?auto_417803 ?auto_417804 ?auto_417805 ?auto_417806 ?auto_417807 ?auto_417808 ?auto_417809 ?auto_417810 ?auto_417811 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417828 - BLOCK
      ?auto_417829 - BLOCK
      ?auto_417830 - BLOCK
      ?auto_417831 - BLOCK
      ?auto_417832 - BLOCK
      ?auto_417833 - BLOCK
      ?auto_417834 - BLOCK
      ?auto_417835 - BLOCK
      ?auto_417836 - BLOCK
      ?auto_417837 - BLOCK
      ?auto_417838 - BLOCK
      ?auto_417839 - BLOCK
      ?auto_417840 - BLOCK
      ?auto_417841 - BLOCK
      ?auto_417842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417842 ) ( ON-TABLE ?auto_417828 ) ( ON ?auto_417829 ?auto_417828 ) ( not ( = ?auto_417828 ?auto_417829 ) ) ( not ( = ?auto_417828 ?auto_417830 ) ) ( not ( = ?auto_417828 ?auto_417831 ) ) ( not ( = ?auto_417828 ?auto_417832 ) ) ( not ( = ?auto_417828 ?auto_417833 ) ) ( not ( = ?auto_417828 ?auto_417834 ) ) ( not ( = ?auto_417828 ?auto_417835 ) ) ( not ( = ?auto_417828 ?auto_417836 ) ) ( not ( = ?auto_417828 ?auto_417837 ) ) ( not ( = ?auto_417828 ?auto_417838 ) ) ( not ( = ?auto_417828 ?auto_417839 ) ) ( not ( = ?auto_417828 ?auto_417840 ) ) ( not ( = ?auto_417828 ?auto_417841 ) ) ( not ( = ?auto_417828 ?auto_417842 ) ) ( not ( = ?auto_417829 ?auto_417830 ) ) ( not ( = ?auto_417829 ?auto_417831 ) ) ( not ( = ?auto_417829 ?auto_417832 ) ) ( not ( = ?auto_417829 ?auto_417833 ) ) ( not ( = ?auto_417829 ?auto_417834 ) ) ( not ( = ?auto_417829 ?auto_417835 ) ) ( not ( = ?auto_417829 ?auto_417836 ) ) ( not ( = ?auto_417829 ?auto_417837 ) ) ( not ( = ?auto_417829 ?auto_417838 ) ) ( not ( = ?auto_417829 ?auto_417839 ) ) ( not ( = ?auto_417829 ?auto_417840 ) ) ( not ( = ?auto_417829 ?auto_417841 ) ) ( not ( = ?auto_417829 ?auto_417842 ) ) ( not ( = ?auto_417830 ?auto_417831 ) ) ( not ( = ?auto_417830 ?auto_417832 ) ) ( not ( = ?auto_417830 ?auto_417833 ) ) ( not ( = ?auto_417830 ?auto_417834 ) ) ( not ( = ?auto_417830 ?auto_417835 ) ) ( not ( = ?auto_417830 ?auto_417836 ) ) ( not ( = ?auto_417830 ?auto_417837 ) ) ( not ( = ?auto_417830 ?auto_417838 ) ) ( not ( = ?auto_417830 ?auto_417839 ) ) ( not ( = ?auto_417830 ?auto_417840 ) ) ( not ( = ?auto_417830 ?auto_417841 ) ) ( not ( = ?auto_417830 ?auto_417842 ) ) ( not ( = ?auto_417831 ?auto_417832 ) ) ( not ( = ?auto_417831 ?auto_417833 ) ) ( not ( = ?auto_417831 ?auto_417834 ) ) ( not ( = ?auto_417831 ?auto_417835 ) ) ( not ( = ?auto_417831 ?auto_417836 ) ) ( not ( = ?auto_417831 ?auto_417837 ) ) ( not ( = ?auto_417831 ?auto_417838 ) ) ( not ( = ?auto_417831 ?auto_417839 ) ) ( not ( = ?auto_417831 ?auto_417840 ) ) ( not ( = ?auto_417831 ?auto_417841 ) ) ( not ( = ?auto_417831 ?auto_417842 ) ) ( not ( = ?auto_417832 ?auto_417833 ) ) ( not ( = ?auto_417832 ?auto_417834 ) ) ( not ( = ?auto_417832 ?auto_417835 ) ) ( not ( = ?auto_417832 ?auto_417836 ) ) ( not ( = ?auto_417832 ?auto_417837 ) ) ( not ( = ?auto_417832 ?auto_417838 ) ) ( not ( = ?auto_417832 ?auto_417839 ) ) ( not ( = ?auto_417832 ?auto_417840 ) ) ( not ( = ?auto_417832 ?auto_417841 ) ) ( not ( = ?auto_417832 ?auto_417842 ) ) ( not ( = ?auto_417833 ?auto_417834 ) ) ( not ( = ?auto_417833 ?auto_417835 ) ) ( not ( = ?auto_417833 ?auto_417836 ) ) ( not ( = ?auto_417833 ?auto_417837 ) ) ( not ( = ?auto_417833 ?auto_417838 ) ) ( not ( = ?auto_417833 ?auto_417839 ) ) ( not ( = ?auto_417833 ?auto_417840 ) ) ( not ( = ?auto_417833 ?auto_417841 ) ) ( not ( = ?auto_417833 ?auto_417842 ) ) ( not ( = ?auto_417834 ?auto_417835 ) ) ( not ( = ?auto_417834 ?auto_417836 ) ) ( not ( = ?auto_417834 ?auto_417837 ) ) ( not ( = ?auto_417834 ?auto_417838 ) ) ( not ( = ?auto_417834 ?auto_417839 ) ) ( not ( = ?auto_417834 ?auto_417840 ) ) ( not ( = ?auto_417834 ?auto_417841 ) ) ( not ( = ?auto_417834 ?auto_417842 ) ) ( not ( = ?auto_417835 ?auto_417836 ) ) ( not ( = ?auto_417835 ?auto_417837 ) ) ( not ( = ?auto_417835 ?auto_417838 ) ) ( not ( = ?auto_417835 ?auto_417839 ) ) ( not ( = ?auto_417835 ?auto_417840 ) ) ( not ( = ?auto_417835 ?auto_417841 ) ) ( not ( = ?auto_417835 ?auto_417842 ) ) ( not ( = ?auto_417836 ?auto_417837 ) ) ( not ( = ?auto_417836 ?auto_417838 ) ) ( not ( = ?auto_417836 ?auto_417839 ) ) ( not ( = ?auto_417836 ?auto_417840 ) ) ( not ( = ?auto_417836 ?auto_417841 ) ) ( not ( = ?auto_417836 ?auto_417842 ) ) ( not ( = ?auto_417837 ?auto_417838 ) ) ( not ( = ?auto_417837 ?auto_417839 ) ) ( not ( = ?auto_417837 ?auto_417840 ) ) ( not ( = ?auto_417837 ?auto_417841 ) ) ( not ( = ?auto_417837 ?auto_417842 ) ) ( not ( = ?auto_417838 ?auto_417839 ) ) ( not ( = ?auto_417838 ?auto_417840 ) ) ( not ( = ?auto_417838 ?auto_417841 ) ) ( not ( = ?auto_417838 ?auto_417842 ) ) ( not ( = ?auto_417839 ?auto_417840 ) ) ( not ( = ?auto_417839 ?auto_417841 ) ) ( not ( = ?auto_417839 ?auto_417842 ) ) ( not ( = ?auto_417840 ?auto_417841 ) ) ( not ( = ?auto_417840 ?auto_417842 ) ) ( not ( = ?auto_417841 ?auto_417842 ) ) ( ON ?auto_417841 ?auto_417842 ) ( ON ?auto_417840 ?auto_417841 ) ( ON ?auto_417839 ?auto_417840 ) ( ON ?auto_417838 ?auto_417839 ) ( ON ?auto_417837 ?auto_417838 ) ( ON ?auto_417836 ?auto_417837 ) ( ON ?auto_417835 ?auto_417836 ) ( ON ?auto_417834 ?auto_417835 ) ( ON ?auto_417833 ?auto_417834 ) ( ON ?auto_417832 ?auto_417833 ) ( ON ?auto_417831 ?auto_417832 ) ( CLEAR ?auto_417829 ) ( ON ?auto_417830 ?auto_417831 ) ( CLEAR ?auto_417830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_417828 ?auto_417829 ?auto_417830 )
      ( MAKE-15PILE ?auto_417828 ?auto_417829 ?auto_417830 ?auto_417831 ?auto_417832 ?auto_417833 ?auto_417834 ?auto_417835 ?auto_417836 ?auto_417837 ?auto_417838 ?auto_417839 ?auto_417840 ?auto_417841 ?auto_417842 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417858 - BLOCK
      ?auto_417859 - BLOCK
      ?auto_417860 - BLOCK
      ?auto_417861 - BLOCK
      ?auto_417862 - BLOCK
      ?auto_417863 - BLOCK
      ?auto_417864 - BLOCK
      ?auto_417865 - BLOCK
      ?auto_417866 - BLOCK
      ?auto_417867 - BLOCK
      ?auto_417868 - BLOCK
      ?auto_417869 - BLOCK
      ?auto_417870 - BLOCK
      ?auto_417871 - BLOCK
      ?auto_417872 - BLOCK
    )
    :vars
    (
      ?auto_417873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417872 ?auto_417873 ) ( ON-TABLE ?auto_417858 ) ( not ( = ?auto_417858 ?auto_417859 ) ) ( not ( = ?auto_417858 ?auto_417860 ) ) ( not ( = ?auto_417858 ?auto_417861 ) ) ( not ( = ?auto_417858 ?auto_417862 ) ) ( not ( = ?auto_417858 ?auto_417863 ) ) ( not ( = ?auto_417858 ?auto_417864 ) ) ( not ( = ?auto_417858 ?auto_417865 ) ) ( not ( = ?auto_417858 ?auto_417866 ) ) ( not ( = ?auto_417858 ?auto_417867 ) ) ( not ( = ?auto_417858 ?auto_417868 ) ) ( not ( = ?auto_417858 ?auto_417869 ) ) ( not ( = ?auto_417858 ?auto_417870 ) ) ( not ( = ?auto_417858 ?auto_417871 ) ) ( not ( = ?auto_417858 ?auto_417872 ) ) ( not ( = ?auto_417858 ?auto_417873 ) ) ( not ( = ?auto_417859 ?auto_417860 ) ) ( not ( = ?auto_417859 ?auto_417861 ) ) ( not ( = ?auto_417859 ?auto_417862 ) ) ( not ( = ?auto_417859 ?auto_417863 ) ) ( not ( = ?auto_417859 ?auto_417864 ) ) ( not ( = ?auto_417859 ?auto_417865 ) ) ( not ( = ?auto_417859 ?auto_417866 ) ) ( not ( = ?auto_417859 ?auto_417867 ) ) ( not ( = ?auto_417859 ?auto_417868 ) ) ( not ( = ?auto_417859 ?auto_417869 ) ) ( not ( = ?auto_417859 ?auto_417870 ) ) ( not ( = ?auto_417859 ?auto_417871 ) ) ( not ( = ?auto_417859 ?auto_417872 ) ) ( not ( = ?auto_417859 ?auto_417873 ) ) ( not ( = ?auto_417860 ?auto_417861 ) ) ( not ( = ?auto_417860 ?auto_417862 ) ) ( not ( = ?auto_417860 ?auto_417863 ) ) ( not ( = ?auto_417860 ?auto_417864 ) ) ( not ( = ?auto_417860 ?auto_417865 ) ) ( not ( = ?auto_417860 ?auto_417866 ) ) ( not ( = ?auto_417860 ?auto_417867 ) ) ( not ( = ?auto_417860 ?auto_417868 ) ) ( not ( = ?auto_417860 ?auto_417869 ) ) ( not ( = ?auto_417860 ?auto_417870 ) ) ( not ( = ?auto_417860 ?auto_417871 ) ) ( not ( = ?auto_417860 ?auto_417872 ) ) ( not ( = ?auto_417860 ?auto_417873 ) ) ( not ( = ?auto_417861 ?auto_417862 ) ) ( not ( = ?auto_417861 ?auto_417863 ) ) ( not ( = ?auto_417861 ?auto_417864 ) ) ( not ( = ?auto_417861 ?auto_417865 ) ) ( not ( = ?auto_417861 ?auto_417866 ) ) ( not ( = ?auto_417861 ?auto_417867 ) ) ( not ( = ?auto_417861 ?auto_417868 ) ) ( not ( = ?auto_417861 ?auto_417869 ) ) ( not ( = ?auto_417861 ?auto_417870 ) ) ( not ( = ?auto_417861 ?auto_417871 ) ) ( not ( = ?auto_417861 ?auto_417872 ) ) ( not ( = ?auto_417861 ?auto_417873 ) ) ( not ( = ?auto_417862 ?auto_417863 ) ) ( not ( = ?auto_417862 ?auto_417864 ) ) ( not ( = ?auto_417862 ?auto_417865 ) ) ( not ( = ?auto_417862 ?auto_417866 ) ) ( not ( = ?auto_417862 ?auto_417867 ) ) ( not ( = ?auto_417862 ?auto_417868 ) ) ( not ( = ?auto_417862 ?auto_417869 ) ) ( not ( = ?auto_417862 ?auto_417870 ) ) ( not ( = ?auto_417862 ?auto_417871 ) ) ( not ( = ?auto_417862 ?auto_417872 ) ) ( not ( = ?auto_417862 ?auto_417873 ) ) ( not ( = ?auto_417863 ?auto_417864 ) ) ( not ( = ?auto_417863 ?auto_417865 ) ) ( not ( = ?auto_417863 ?auto_417866 ) ) ( not ( = ?auto_417863 ?auto_417867 ) ) ( not ( = ?auto_417863 ?auto_417868 ) ) ( not ( = ?auto_417863 ?auto_417869 ) ) ( not ( = ?auto_417863 ?auto_417870 ) ) ( not ( = ?auto_417863 ?auto_417871 ) ) ( not ( = ?auto_417863 ?auto_417872 ) ) ( not ( = ?auto_417863 ?auto_417873 ) ) ( not ( = ?auto_417864 ?auto_417865 ) ) ( not ( = ?auto_417864 ?auto_417866 ) ) ( not ( = ?auto_417864 ?auto_417867 ) ) ( not ( = ?auto_417864 ?auto_417868 ) ) ( not ( = ?auto_417864 ?auto_417869 ) ) ( not ( = ?auto_417864 ?auto_417870 ) ) ( not ( = ?auto_417864 ?auto_417871 ) ) ( not ( = ?auto_417864 ?auto_417872 ) ) ( not ( = ?auto_417864 ?auto_417873 ) ) ( not ( = ?auto_417865 ?auto_417866 ) ) ( not ( = ?auto_417865 ?auto_417867 ) ) ( not ( = ?auto_417865 ?auto_417868 ) ) ( not ( = ?auto_417865 ?auto_417869 ) ) ( not ( = ?auto_417865 ?auto_417870 ) ) ( not ( = ?auto_417865 ?auto_417871 ) ) ( not ( = ?auto_417865 ?auto_417872 ) ) ( not ( = ?auto_417865 ?auto_417873 ) ) ( not ( = ?auto_417866 ?auto_417867 ) ) ( not ( = ?auto_417866 ?auto_417868 ) ) ( not ( = ?auto_417866 ?auto_417869 ) ) ( not ( = ?auto_417866 ?auto_417870 ) ) ( not ( = ?auto_417866 ?auto_417871 ) ) ( not ( = ?auto_417866 ?auto_417872 ) ) ( not ( = ?auto_417866 ?auto_417873 ) ) ( not ( = ?auto_417867 ?auto_417868 ) ) ( not ( = ?auto_417867 ?auto_417869 ) ) ( not ( = ?auto_417867 ?auto_417870 ) ) ( not ( = ?auto_417867 ?auto_417871 ) ) ( not ( = ?auto_417867 ?auto_417872 ) ) ( not ( = ?auto_417867 ?auto_417873 ) ) ( not ( = ?auto_417868 ?auto_417869 ) ) ( not ( = ?auto_417868 ?auto_417870 ) ) ( not ( = ?auto_417868 ?auto_417871 ) ) ( not ( = ?auto_417868 ?auto_417872 ) ) ( not ( = ?auto_417868 ?auto_417873 ) ) ( not ( = ?auto_417869 ?auto_417870 ) ) ( not ( = ?auto_417869 ?auto_417871 ) ) ( not ( = ?auto_417869 ?auto_417872 ) ) ( not ( = ?auto_417869 ?auto_417873 ) ) ( not ( = ?auto_417870 ?auto_417871 ) ) ( not ( = ?auto_417870 ?auto_417872 ) ) ( not ( = ?auto_417870 ?auto_417873 ) ) ( not ( = ?auto_417871 ?auto_417872 ) ) ( not ( = ?auto_417871 ?auto_417873 ) ) ( not ( = ?auto_417872 ?auto_417873 ) ) ( ON ?auto_417871 ?auto_417872 ) ( ON ?auto_417870 ?auto_417871 ) ( ON ?auto_417869 ?auto_417870 ) ( ON ?auto_417868 ?auto_417869 ) ( ON ?auto_417867 ?auto_417868 ) ( ON ?auto_417866 ?auto_417867 ) ( ON ?auto_417865 ?auto_417866 ) ( ON ?auto_417864 ?auto_417865 ) ( ON ?auto_417863 ?auto_417864 ) ( ON ?auto_417862 ?auto_417863 ) ( ON ?auto_417861 ?auto_417862 ) ( ON ?auto_417860 ?auto_417861 ) ( CLEAR ?auto_417858 ) ( ON ?auto_417859 ?auto_417860 ) ( CLEAR ?auto_417859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_417858 ?auto_417859 )
      ( MAKE-15PILE ?auto_417858 ?auto_417859 ?auto_417860 ?auto_417861 ?auto_417862 ?auto_417863 ?auto_417864 ?auto_417865 ?auto_417866 ?auto_417867 ?auto_417868 ?auto_417869 ?auto_417870 ?auto_417871 ?auto_417872 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417889 - BLOCK
      ?auto_417890 - BLOCK
      ?auto_417891 - BLOCK
      ?auto_417892 - BLOCK
      ?auto_417893 - BLOCK
      ?auto_417894 - BLOCK
      ?auto_417895 - BLOCK
      ?auto_417896 - BLOCK
      ?auto_417897 - BLOCK
      ?auto_417898 - BLOCK
      ?auto_417899 - BLOCK
      ?auto_417900 - BLOCK
      ?auto_417901 - BLOCK
      ?auto_417902 - BLOCK
      ?auto_417903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417903 ) ( ON-TABLE ?auto_417889 ) ( not ( = ?auto_417889 ?auto_417890 ) ) ( not ( = ?auto_417889 ?auto_417891 ) ) ( not ( = ?auto_417889 ?auto_417892 ) ) ( not ( = ?auto_417889 ?auto_417893 ) ) ( not ( = ?auto_417889 ?auto_417894 ) ) ( not ( = ?auto_417889 ?auto_417895 ) ) ( not ( = ?auto_417889 ?auto_417896 ) ) ( not ( = ?auto_417889 ?auto_417897 ) ) ( not ( = ?auto_417889 ?auto_417898 ) ) ( not ( = ?auto_417889 ?auto_417899 ) ) ( not ( = ?auto_417889 ?auto_417900 ) ) ( not ( = ?auto_417889 ?auto_417901 ) ) ( not ( = ?auto_417889 ?auto_417902 ) ) ( not ( = ?auto_417889 ?auto_417903 ) ) ( not ( = ?auto_417890 ?auto_417891 ) ) ( not ( = ?auto_417890 ?auto_417892 ) ) ( not ( = ?auto_417890 ?auto_417893 ) ) ( not ( = ?auto_417890 ?auto_417894 ) ) ( not ( = ?auto_417890 ?auto_417895 ) ) ( not ( = ?auto_417890 ?auto_417896 ) ) ( not ( = ?auto_417890 ?auto_417897 ) ) ( not ( = ?auto_417890 ?auto_417898 ) ) ( not ( = ?auto_417890 ?auto_417899 ) ) ( not ( = ?auto_417890 ?auto_417900 ) ) ( not ( = ?auto_417890 ?auto_417901 ) ) ( not ( = ?auto_417890 ?auto_417902 ) ) ( not ( = ?auto_417890 ?auto_417903 ) ) ( not ( = ?auto_417891 ?auto_417892 ) ) ( not ( = ?auto_417891 ?auto_417893 ) ) ( not ( = ?auto_417891 ?auto_417894 ) ) ( not ( = ?auto_417891 ?auto_417895 ) ) ( not ( = ?auto_417891 ?auto_417896 ) ) ( not ( = ?auto_417891 ?auto_417897 ) ) ( not ( = ?auto_417891 ?auto_417898 ) ) ( not ( = ?auto_417891 ?auto_417899 ) ) ( not ( = ?auto_417891 ?auto_417900 ) ) ( not ( = ?auto_417891 ?auto_417901 ) ) ( not ( = ?auto_417891 ?auto_417902 ) ) ( not ( = ?auto_417891 ?auto_417903 ) ) ( not ( = ?auto_417892 ?auto_417893 ) ) ( not ( = ?auto_417892 ?auto_417894 ) ) ( not ( = ?auto_417892 ?auto_417895 ) ) ( not ( = ?auto_417892 ?auto_417896 ) ) ( not ( = ?auto_417892 ?auto_417897 ) ) ( not ( = ?auto_417892 ?auto_417898 ) ) ( not ( = ?auto_417892 ?auto_417899 ) ) ( not ( = ?auto_417892 ?auto_417900 ) ) ( not ( = ?auto_417892 ?auto_417901 ) ) ( not ( = ?auto_417892 ?auto_417902 ) ) ( not ( = ?auto_417892 ?auto_417903 ) ) ( not ( = ?auto_417893 ?auto_417894 ) ) ( not ( = ?auto_417893 ?auto_417895 ) ) ( not ( = ?auto_417893 ?auto_417896 ) ) ( not ( = ?auto_417893 ?auto_417897 ) ) ( not ( = ?auto_417893 ?auto_417898 ) ) ( not ( = ?auto_417893 ?auto_417899 ) ) ( not ( = ?auto_417893 ?auto_417900 ) ) ( not ( = ?auto_417893 ?auto_417901 ) ) ( not ( = ?auto_417893 ?auto_417902 ) ) ( not ( = ?auto_417893 ?auto_417903 ) ) ( not ( = ?auto_417894 ?auto_417895 ) ) ( not ( = ?auto_417894 ?auto_417896 ) ) ( not ( = ?auto_417894 ?auto_417897 ) ) ( not ( = ?auto_417894 ?auto_417898 ) ) ( not ( = ?auto_417894 ?auto_417899 ) ) ( not ( = ?auto_417894 ?auto_417900 ) ) ( not ( = ?auto_417894 ?auto_417901 ) ) ( not ( = ?auto_417894 ?auto_417902 ) ) ( not ( = ?auto_417894 ?auto_417903 ) ) ( not ( = ?auto_417895 ?auto_417896 ) ) ( not ( = ?auto_417895 ?auto_417897 ) ) ( not ( = ?auto_417895 ?auto_417898 ) ) ( not ( = ?auto_417895 ?auto_417899 ) ) ( not ( = ?auto_417895 ?auto_417900 ) ) ( not ( = ?auto_417895 ?auto_417901 ) ) ( not ( = ?auto_417895 ?auto_417902 ) ) ( not ( = ?auto_417895 ?auto_417903 ) ) ( not ( = ?auto_417896 ?auto_417897 ) ) ( not ( = ?auto_417896 ?auto_417898 ) ) ( not ( = ?auto_417896 ?auto_417899 ) ) ( not ( = ?auto_417896 ?auto_417900 ) ) ( not ( = ?auto_417896 ?auto_417901 ) ) ( not ( = ?auto_417896 ?auto_417902 ) ) ( not ( = ?auto_417896 ?auto_417903 ) ) ( not ( = ?auto_417897 ?auto_417898 ) ) ( not ( = ?auto_417897 ?auto_417899 ) ) ( not ( = ?auto_417897 ?auto_417900 ) ) ( not ( = ?auto_417897 ?auto_417901 ) ) ( not ( = ?auto_417897 ?auto_417902 ) ) ( not ( = ?auto_417897 ?auto_417903 ) ) ( not ( = ?auto_417898 ?auto_417899 ) ) ( not ( = ?auto_417898 ?auto_417900 ) ) ( not ( = ?auto_417898 ?auto_417901 ) ) ( not ( = ?auto_417898 ?auto_417902 ) ) ( not ( = ?auto_417898 ?auto_417903 ) ) ( not ( = ?auto_417899 ?auto_417900 ) ) ( not ( = ?auto_417899 ?auto_417901 ) ) ( not ( = ?auto_417899 ?auto_417902 ) ) ( not ( = ?auto_417899 ?auto_417903 ) ) ( not ( = ?auto_417900 ?auto_417901 ) ) ( not ( = ?auto_417900 ?auto_417902 ) ) ( not ( = ?auto_417900 ?auto_417903 ) ) ( not ( = ?auto_417901 ?auto_417902 ) ) ( not ( = ?auto_417901 ?auto_417903 ) ) ( not ( = ?auto_417902 ?auto_417903 ) ) ( ON ?auto_417902 ?auto_417903 ) ( ON ?auto_417901 ?auto_417902 ) ( ON ?auto_417900 ?auto_417901 ) ( ON ?auto_417899 ?auto_417900 ) ( ON ?auto_417898 ?auto_417899 ) ( ON ?auto_417897 ?auto_417898 ) ( ON ?auto_417896 ?auto_417897 ) ( ON ?auto_417895 ?auto_417896 ) ( ON ?auto_417894 ?auto_417895 ) ( ON ?auto_417893 ?auto_417894 ) ( ON ?auto_417892 ?auto_417893 ) ( ON ?auto_417891 ?auto_417892 ) ( CLEAR ?auto_417889 ) ( ON ?auto_417890 ?auto_417891 ) ( CLEAR ?auto_417890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_417889 ?auto_417890 )
      ( MAKE-15PILE ?auto_417889 ?auto_417890 ?auto_417891 ?auto_417892 ?auto_417893 ?auto_417894 ?auto_417895 ?auto_417896 ?auto_417897 ?auto_417898 ?auto_417899 ?auto_417900 ?auto_417901 ?auto_417902 ?auto_417903 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417919 - BLOCK
      ?auto_417920 - BLOCK
      ?auto_417921 - BLOCK
      ?auto_417922 - BLOCK
      ?auto_417923 - BLOCK
      ?auto_417924 - BLOCK
      ?auto_417925 - BLOCK
      ?auto_417926 - BLOCK
      ?auto_417927 - BLOCK
      ?auto_417928 - BLOCK
      ?auto_417929 - BLOCK
      ?auto_417930 - BLOCK
      ?auto_417931 - BLOCK
      ?auto_417932 - BLOCK
      ?auto_417933 - BLOCK
    )
    :vars
    (
      ?auto_417934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417933 ?auto_417934 ) ( not ( = ?auto_417919 ?auto_417920 ) ) ( not ( = ?auto_417919 ?auto_417921 ) ) ( not ( = ?auto_417919 ?auto_417922 ) ) ( not ( = ?auto_417919 ?auto_417923 ) ) ( not ( = ?auto_417919 ?auto_417924 ) ) ( not ( = ?auto_417919 ?auto_417925 ) ) ( not ( = ?auto_417919 ?auto_417926 ) ) ( not ( = ?auto_417919 ?auto_417927 ) ) ( not ( = ?auto_417919 ?auto_417928 ) ) ( not ( = ?auto_417919 ?auto_417929 ) ) ( not ( = ?auto_417919 ?auto_417930 ) ) ( not ( = ?auto_417919 ?auto_417931 ) ) ( not ( = ?auto_417919 ?auto_417932 ) ) ( not ( = ?auto_417919 ?auto_417933 ) ) ( not ( = ?auto_417919 ?auto_417934 ) ) ( not ( = ?auto_417920 ?auto_417921 ) ) ( not ( = ?auto_417920 ?auto_417922 ) ) ( not ( = ?auto_417920 ?auto_417923 ) ) ( not ( = ?auto_417920 ?auto_417924 ) ) ( not ( = ?auto_417920 ?auto_417925 ) ) ( not ( = ?auto_417920 ?auto_417926 ) ) ( not ( = ?auto_417920 ?auto_417927 ) ) ( not ( = ?auto_417920 ?auto_417928 ) ) ( not ( = ?auto_417920 ?auto_417929 ) ) ( not ( = ?auto_417920 ?auto_417930 ) ) ( not ( = ?auto_417920 ?auto_417931 ) ) ( not ( = ?auto_417920 ?auto_417932 ) ) ( not ( = ?auto_417920 ?auto_417933 ) ) ( not ( = ?auto_417920 ?auto_417934 ) ) ( not ( = ?auto_417921 ?auto_417922 ) ) ( not ( = ?auto_417921 ?auto_417923 ) ) ( not ( = ?auto_417921 ?auto_417924 ) ) ( not ( = ?auto_417921 ?auto_417925 ) ) ( not ( = ?auto_417921 ?auto_417926 ) ) ( not ( = ?auto_417921 ?auto_417927 ) ) ( not ( = ?auto_417921 ?auto_417928 ) ) ( not ( = ?auto_417921 ?auto_417929 ) ) ( not ( = ?auto_417921 ?auto_417930 ) ) ( not ( = ?auto_417921 ?auto_417931 ) ) ( not ( = ?auto_417921 ?auto_417932 ) ) ( not ( = ?auto_417921 ?auto_417933 ) ) ( not ( = ?auto_417921 ?auto_417934 ) ) ( not ( = ?auto_417922 ?auto_417923 ) ) ( not ( = ?auto_417922 ?auto_417924 ) ) ( not ( = ?auto_417922 ?auto_417925 ) ) ( not ( = ?auto_417922 ?auto_417926 ) ) ( not ( = ?auto_417922 ?auto_417927 ) ) ( not ( = ?auto_417922 ?auto_417928 ) ) ( not ( = ?auto_417922 ?auto_417929 ) ) ( not ( = ?auto_417922 ?auto_417930 ) ) ( not ( = ?auto_417922 ?auto_417931 ) ) ( not ( = ?auto_417922 ?auto_417932 ) ) ( not ( = ?auto_417922 ?auto_417933 ) ) ( not ( = ?auto_417922 ?auto_417934 ) ) ( not ( = ?auto_417923 ?auto_417924 ) ) ( not ( = ?auto_417923 ?auto_417925 ) ) ( not ( = ?auto_417923 ?auto_417926 ) ) ( not ( = ?auto_417923 ?auto_417927 ) ) ( not ( = ?auto_417923 ?auto_417928 ) ) ( not ( = ?auto_417923 ?auto_417929 ) ) ( not ( = ?auto_417923 ?auto_417930 ) ) ( not ( = ?auto_417923 ?auto_417931 ) ) ( not ( = ?auto_417923 ?auto_417932 ) ) ( not ( = ?auto_417923 ?auto_417933 ) ) ( not ( = ?auto_417923 ?auto_417934 ) ) ( not ( = ?auto_417924 ?auto_417925 ) ) ( not ( = ?auto_417924 ?auto_417926 ) ) ( not ( = ?auto_417924 ?auto_417927 ) ) ( not ( = ?auto_417924 ?auto_417928 ) ) ( not ( = ?auto_417924 ?auto_417929 ) ) ( not ( = ?auto_417924 ?auto_417930 ) ) ( not ( = ?auto_417924 ?auto_417931 ) ) ( not ( = ?auto_417924 ?auto_417932 ) ) ( not ( = ?auto_417924 ?auto_417933 ) ) ( not ( = ?auto_417924 ?auto_417934 ) ) ( not ( = ?auto_417925 ?auto_417926 ) ) ( not ( = ?auto_417925 ?auto_417927 ) ) ( not ( = ?auto_417925 ?auto_417928 ) ) ( not ( = ?auto_417925 ?auto_417929 ) ) ( not ( = ?auto_417925 ?auto_417930 ) ) ( not ( = ?auto_417925 ?auto_417931 ) ) ( not ( = ?auto_417925 ?auto_417932 ) ) ( not ( = ?auto_417925 ?auto_417933 ) ) ( not ( = ?auto_417925 ?auto_417934 ) ) ( not ( = ?auto_417926 ?auto_417927 ) ) ( not ( = ?auto_417926 ?auto_417928 ) ) ( not ( = ?auto_417926 ?auto_417929 ) ) ( not ( = ?auto_417926 ?auto_417930 ) ) ( not ( = ?auto_417926 ?auto_417931 ) ) ( not ( = ?auto_417926 ?auto_417932 ) ) ( not ( = ?auto_417926 ?auto_417933 ) ) ( not ( = ?auto_417926 ?auto_417934 ) ) ( not ( = ?auto_417927 ?auto_417928 ) ) ( not ( = ?auto_417927 ?auto_417929 ) ) ( not ( = ?auto_417927 ?auto_417930 ) ) ( not ( = ?auto_417927 ?auto_417931 ) ) ( not ( = ?auto_417927 ?auto_417932 ) ) ( not ( = ?auto_417927 ?auto_417933 ) ) ( not ( = ?auto_417927 ?auto_417934 ) ) ( not ( = ?auto_417928 ?auto_417929 ) ) ( not ( = ?auto_417928 ?auto_417930 ) ) ( not ( = ?auto_417928 ?auto_417931 ) ) ( not ( = ?auto_417928 ?auto_417932 ) ) ( not ( = ?auto_417928 ?auto_417933 ) ) ( not ( = ?auto_417928 ?auto_417934 ) ) ( not ( = ?auto_417929 ?auto_417930 ) ) ( not ( = ?auto_417929 ?auto_417931 ) ) ( not ( = ?auto_417929 ?auto_417932 ) ) ( not ( = ?auto_417929 ?auto_417933 ) ) ( not ( = ?auto_417929 ?auto_417934 ) ) ( not ( = ?auto_417930 ?auto_417931 ) ) ( not ( = ?auto_417930 ?auto_417932 ) ) ( not ( = ?auto_417930 ?auto_417933 ) ) ( not ( = ?auto_417930 ?auto_417934 ) ) ( not ( = ?auto_417931 ?auto_417932 ) ) ( not ( = ?auto_417931 ?auto_417933 ) ) ( not ( = ?auto_417931 ?auto_417934 ) ) ( not ( = ?auto_417932 ?auto_417933 ) ) ( not ( = ?auto_417932 ?auto_417934 ) ) ( not ( = ?auto_417933 ?auto_417934 ) ) ( ON ?auto_417932 ?auto_417933 ) ( ON ?auto_417931 ?auto_417932 ) ( ON ?auto_417930 ?auto_417931 ) ( ON ?auto_417929 ?auto_417930 ) ( ON ?auto_417928 ?auto_417929 ) ( ON ?auto_417927 ?auto_417928 ) ( ON ?auto_417926 ?auto_417927 ) ( ON ?auto_417925 ?auto_417926 ) ( ON ?auto_417924 ?auto_417925 ) ( ON ?auto_417923 ?auto_417924 ) ( ON ?auto_417922 ?auto_417923 ) ( ON ?auto_417921 ?auto_417922 ) ( ON ?auto_417920 ?auto_417921 ) ( ON ?auto_417919 ?auto_417920 ) ( CLEAR ?auto_417919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_417919 )
      ( MAKE-15PILE ?auto_417919 ?auto_417920 ?auto_417921 ?auto_417922 ?auto_417923 ?auto_417924 ?auto_417925 ?auto_417926 ?auto_417927 ?auto_417928 ?auto_417929 ?auto_417930 ?auto_417931 ?auto_417932 ?auto_417933 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417950 - BLOCK
      ?auto_417951 - BLOCK
      ?auto_417952 - BLOCK
      ?auto_417953 - BLOCK
      ?auto_417954 - BLOCK
      ?auto_417955 - BLOCK
      ?auto_417956 - BLOCK
      ?auto_417957 - BLOCK
      ?auto_417958 - BLOCK
      ?auto_417959 - BLOCK
      ?auto_417960 - BLOCK
      ?auto_417961 - BLOCK
      ?auto_417962 - BLOCK
      ?auto_417963 - BLOCK
      ?auto_417964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_417964 ) ( not ( = ?auto_417950 ?auto_417951 ) ) ( not ( = ?auto_417950 ?auto_417952 ) ) ( not ( = ?auto_417950 ?auto_417953 ) ) ( not ( = ?auto_417950 ?auto_417954 ) ) ( not ( = ?auto_417950 ?auto_417955 ) ) ( not ( = ?auto_417950 ?auto_417956 ) ) ( not ( = ?auto_417950 ?auto_417957 ) ) ( not ( = ?auto_417950 ?auto_417958 ) ) ( not ( = ?auto_417950 ?auto_417959 ) ) ( not ( = ?auto_417950 ?auto_417960 ) ) ( not ( = ?auto_417950 ?auto_417961 ) ) ( not ( = ?auto_417950 ?auto_417962 ) ) ( not ( = ?auto_417950 ?auto_417963 ) ) ( not ( = ?auto_417950 ?auto_417964 ) ) ( not ( = ?auto_417951 ?auto_417952 ) ) ( not ( = ?auto_417951 ?auto_417953 ) ) ( not ( = ?auto_417951 ?auto_417954 ) ) ( not ( = ?auto_417951 ?auto_417955 ) ) ( not ( = ?auto_417951 ?auto_417956 ) ) ( not ( = ?auto_417951 ?auto_417957 ) ) ( not ( = ?auto_417951 ?auto_417958 ) ) ( not ( = ?auto_417951 ?auto_417959 ) ) ( not ( = ?auto_417951 ?auto_417960 ) ) ( not ( = ?auto_417951 ?auto_417961 ) ) ( not ( = ?auto_417951 ?auto_417962 ) ) ( not ( = ?auto_417951 ?auto_417963 ) ) ( not ( = ?auto_417951 ?auto_417964 ) ) ( not ( = ?auto_417952 ?auto_417953 ) ) ( not ( = ?auto_417952 ?auto_417954 ) ) ( not ( = ?auto_417952 ?auto_417955 ) ) ( not ( = ?auto_417952 ?auto_417956 ) ) ( not ( = ?auto_417952 ?auto_417957 ) ) ( not ( = ?auto_417952 ?auto_417958 ) ) ( not ( = ?auto_417952 ?auto_417959 ) ) ( not ( = ?auto_417952 ?auto_417960 ) ) ( not ( = ?auto_417952 ?auto_417961 ) ) ( not ( = ?auto_417952 ?auto_417962 ) ) ( not ( = ?auto_417952 ?auto_417963 ) ) ( not ( = ?auto_417952 ?auto_417964 ) ) ( not ( = ?auto_417953 ?auto_417954 ) ) ( not ( = ?auto_417953 ?auto_417955 ) ) ( not ( = ?auto_417953 ?auto_417956 ) ) ( not ( = ?auto_417953 ?auto_417957 ) ) ( not ( = ?auto_417953 ?auto_417958 ) ) ( not ( = ?auto_417953 ?auto_417959 ) ) ( not ( = ?auto_417953 ?auto_417960 ) ) ( not ( = ?auto_417953 ?auto_417961 ) ) ( not ( = ?auto_417953 ?auto_417962 ) ) ( not ( = ?auto_417953 ?auto_417963 ) ) ( not ( = ?auto_417953 ?auto_417964 ) ) ( not ( = ?auto_417954 ?auto_417955 ) ) ( not ( = ?auto_417954 ?auto_417956 ) ) ( not ( = ?auto_417954 ?auto_417957 ) ) ( not ( = ?auto_417954 ?auto_417958 ) ) ( not ( = ?auto_417954 ?auto_417959 ) ) ( not ( = ?auto_417954 ?auto_417960 ) ) ( not ( = ?auto_417954 ?auto_417961 ) ) ( not ( = ?auto_417954 ?auto_417962 ) ) ( not ( = ?auto_417954 ?auto_417963 ) ) ( not ( = ?auto_417954 ?auto_417964 ) ) ( not ( = ?auto_417955 ?auto_417956 ) ) ( not ( = ?auto_417955 ?auto_417957 ) ) ( not ( = ?auto_417955 ?auto_417958 ) ) ( not ( = ?auto_417955 ?auto_417959 ) ) ( not ( = ?auto_417955 ?auto_417960 ) ) ( not ( = ?auto_417955 ?auto_417961 ) ) ( not ( = ?auto_417955 ?auto_417962 ) ) ( not ( = ?auto_417955 ?auto_417963 ) ) ( not ( = ?auto_417955 ?auto_417964 ) ) ( not ( = ?auto_417956 ?auto_417957 ) ) ( not ( = ?auto_417956 ?auto_417958 ) ) ( not ( = ?auto_417956 ?auto_417959 ) ) ( not ( = ?auto_417956 ?auto_417960 ) ) ( not ( = ?auto_417956 ?auto_417961 ) ) ( not ( = ?auto_417956 ?auto_417962 ) ) ( not ( = ?auto_417956 ?auto_417963 ) ) ( not ( = ?auto_417956 ?auto_417964 ) ) ( not ( = ?auto_417957 ?auto_417958 ) ) ( not ( = ?auto_417957 ?auto_417959 ) ) ( not ( = ?auto_417957 ?auto_417960 ) ) ( not ( = ?auto_417957 ?auto_417961 ) ) ( not ( = ?auto_417957 ?auto_417962 ) ) ( not ( = ?auto_417957 ?auto_417963 ) ) ( not ( = ?auto_417957 ?auto_417964 ) ) ( not ( = ?auto_417958 ?auto_417959 ) ) ( not ( = ?auto_417958 ?auto_417960 ) ) ( not ( = ?auto_417958 ?auto_417961 ) ) ( not ( = ?auto_417958 ?auto_417962 ) ) ( not ( = ?auto_417958 ?auto_417963 ) ) ( not ( = ?auto_417958 ?auto_417964 ) ) ( not ( = ?auto_417959 ?auto_417960 ) ) ( not ( = ?auto_417959 ?auto_417961 ) ) ( not ( = ?auto_417959 ?auto_417962 ) ) ( not ( = ?auto_417959 ?auto_417963 ) ) ( not ( = ?auto_417959 ?auto_417964 ) ) ( not ( = ?auto_417960 ?auto_417961 ) ) ( not ( = ?auto_417960 ?auto_417962 ) ) ( not ( = ?auto_417960 ?auto_417963 ) ) ( not ( = ?auto_417960 ?auto_417964 ) ) ( not ( = ?auto_417961 ?auto_417962 ) ) ( not ( = ?auto_417961 ?auto_417963 ) ) ( not ( = ?auto_417961 ?auto_417964 ) ) ( not ( = ?auto_417962 ?auto_417963 ) ) ( not ( = ?auto_417962 ?auto_417964 ) ) ( not ( = ?auto_417963 ?auto_417964 ) ) ( ON ?auto_417963 ?auto_417964 ) ( ON ?auto_417962 ?auto_417963 ) ( ON ?auto_417961 ?auto_417962 ) ( ON ?auto_417960 ?auto_417961 ) ( ON ?auto_417959 ?auto_417960 ) ( ON ?auto_417958 ?auto_417959 ) ( ON ?auto_417957 ?auto_417958 ) ( ON ?auto_417956 ?auto_417957 ) ( ON ?auto_417955 ?auto_417956 ) ( ON ?auto_417954 ?auto_417955 ) ( ON ?auto_417953 ?auto_417954 ) ( ON ?auto_417952 ?auto_417953 ) ( ON ?auto_417951 ?auto_417952 ) ( ON ?auto_417950 ?auto_417951 ) ( CLEAR ?auto_417950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_417950 )
      ( MAKE-15PILE ?auto_417950 ?auto_417951 ?auto_417952 ?auto_417953 ?auto_417954 ?auto_417955 ?auto_417956 ?auto_417957 ?auto_417958 ?auto_417959 ?auto_417960 ?auto_417961 ?auto_417962 ?auto_417963 ?auto_417964 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_417980 - BLOCK
      ?auto_417981 - BLOCK
      ?auto_417982 - BLOCK
      ?auto_417983 - BLOCK
      ?auto_417984 - BLOCK
      ?auto_417985 - BLOCK
      ?auto_417986 - BLOCK
      ?auto_417987 - BLOCK
      ?auto_417988 - BLOCK
      ?auto_417989 - BLOCK
      ?auto_417990 - BLOCK
      ?auto_417991 - BLOCK
      ?auto_417992 - BLOCK
      ?auto_417993 - BLOCK
      ?auto_417994 - BLOCK
    )
    :vars
    (
      ?auto_417995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_417980 ?auto_417981 ) ) ( not ( = ?auto_417980 ?auto_417982 ) ) ( not ( = ?auto_417980 ?auto_417983 ) ) ( not ( = ?auto_417980 ?auto_417984 ) ) ( not ( = ?auto_417980 ?auto_417985 ) ) ( not ( = ?auto_417980 ?auto_417986 ) ) ( not ( = ?auto_417980 ?auto_417987 ) ) ( not ( = ?auto_417980 ?auto_417988 ) ) ( not ( = ?auto_417980 ?auto_417989 ) ) ( not ( = ?auto_417980 ?auto_417990 ) ) ( not ( = ?auto_417980 ?auto_417991 ) ) ( not ( = ?auto_417980 ?auto_417992 ) ) ( not ( = ?auto_417980 ?auto_417993 ) ) ( not ( = ?auto_417980 ?auto_417994 ) ) ( not ( = ?auto_417981 ?auto_417982 ) ) ( not ( = ?auto_417981 ?auto_417983 ) ) ( not ( = ?auto_417981 ?auto_417984 ) ) ( not ( = ?auto_417981 ?auto_417985 ) ) ( not ( = ?auto_417981 ?auto_417986 ) ) ( not ( = ?auto_417981 ?auto_417987 ) ) ( not ( = ?auto_417981 ?auto_417988 ) ) ( not ( = ?auto_417981 ?auto_417989 ) ) ( not ( = ?auto_417981 ?auto_417990 ) ) ( not ( = ?auto_417981 ?auto_417991 ) ) ( not ( = ?auto_417981 ?auto_417992 ) ) ( not ( = ?auto_417981 ?auto_417993 ) ) ( not ( = ?auto_417981 ?auto_417994 ) ) ( not ( = ?auto_417982 ?auto_417983 ) ) ( not ( = ?auto_417982 ?auto_417984 ) ) ( not ( = ?auto_417982 ?auto_417985 ) ) ( not ( = ?auto_417982 ?auto_417986 ) ) ( not ( = ?auto_417982 ?auto_417987 ) ) ( not ( = ?auto_417982 ?auto_417988 ) ) ( not ( = ?auto_417982 ?auto_417989 ) ) ( not ( = ?auto_417982 ?auto_417990 ) ) ( not ( = ?auto_417982 ?auto_417991 ) ) ( not ( = ?auto_417982 ?auto_417992 ) ) ( not ( = ?auto_417982 ?auto_417993 ) ) ( not ( = ?auto_417982 ?auto_417994 ) ) ( not ( = ?auto_417983 ?auto_417984 ) ) ( not ( = ?auto_417983 ?auto_417985 ) ) ( not ( = ?auto_417983 ?auto_417986 ) ) ( not ( = ?auto_417983 ?auto_417987 ) ) ( not ( = ?auto_417983 ?auto_417988 ) ) ( not ( = ?auto_417983 ?auto_417989 ) ) ( not ( = ?auto_417983 ?auto_417990 ) ) ( not ( = ?auto_417983 ?auto_417991 ) ) ( not ( = ?auto_417983 ?auto_417992 ) ) ( not ( = ?auto_417983 ?auto_417993 ) ) ( not ( = ?auto_417983 ?auto_417994 ) ) ( not ( = ?auto_417984 ?auto_417985 ) ) ( not ( = ?auto_417984 ?auto_417986 ) ) ( not ( = ?auto_417984 ?auto_417987 ) ) ( not ( = ?auto_417984 ?auto_417988 ) ) ( not ( = ?auto_417984 ?auto_417989 ) ) ( not ( = ?auto_417984 ?auto_417990 ) ) ( not ( = ?auto_417984 ?auto_417991 ) ) ( not ( = ?auto_417984 ?auto_417992 ) ) ( not ( = ?auto_417984 ?auto_417993 ) ) ( not ( = ?auto_417984 ?auto_417994 ) ) ( not ( = ?auto_417985 ?auto_417986 ) ) ( not ( = ?auto_417985 ?auto_417987 ) ) ( not ( = ?auto_417985 ?auto_417988 ) ) ( not ( = ?auto_417985 ?auto_417989 ) ) ( not ( = ?auto_417985 ?auto_417990 ) ) ( not ( = ?auto_417985 ?auto_417991 ) ) ( not ( = ?auto_417985 ?auto_417992 ) ) ( not ( = ?auto_417985 ?auto_417993 ) ) ( not ( = ?auto_417985 ?auto_417994 ) ) ( not ( = ?auto_417986 ?auto_417987 ) ) ( not ( = ?auto_417986 ?auto_417988 ) ) ( not ( = ?auto_417986 ?auto_417989 ) ) ( not ( = ?auto_417986 ?auto_417990 ) ) ( not ( = ?auto_417986 ?auto_417991 ) ) ( not ( = ?auto_417986 ?auto_417992 ) ) ( not ( = ?auto_417986 ?auto_417993 ) ) ( not ( = ?auto_417986 ?auto_417994 ) ) ( not ( = ?auto_417987 ?auto_417988 ) ) ( not ( = ?auto_417987 ?auto_417989 ) ) ( not ( = ?auto_417987 ?auto_417990 ) ) ( not ( = ?auto_417987 ?auto_417991 ) ) ( not ( = ?auto_417987 ?auto_417992 ) ) ( not ( = ?auto_417987 ?auto_417993 ) ) ( not ( = ?auto_417987 ?auto_417994 ) ) ( not ( = ?auto_417988 ?auto_417989 ) ) ( not ( = ?auto_417988 ?auto_417990 ) ) ( not ( = ?auto_417988 ?auto_417991 ) ) ( not ( = ?auto_417988 ?auto_417992 ) ) ( not ( = ?auto_417988 ?auto_417993 ) ) ( not ( = ?auto_417988 ?auto_417994 ) ) ( not ( = ?auto_417989 ?auto_417990 ) ) ( not ( = ?auto_417989 ?auto_417991 ) ) ( not ( = ?auto_417989 ?auto_417992 ) ) ( not ( = ?auto_417989 ?auto_417993 ) ) ( not ( = ?auto_417989 ?auto_417994 ) ) ( not ( = ?auto_417990 ?auto_417991 ) ) ( not ( = ?auto_417990 ?auto_417992 ) ) ( not ( = ?auto_417990 ?auto_417993 ) ) ( not ( = ?auto_417990 ?auto_417994 ) ) ( not ( = ?auto_417991 ?auto_417992 ) ) ( not ( = ?auto_417991 ?auto_417993 ) ) ( not ( = ?auto_417991 ?auto_417994 ) ) ( not ( = ?auto_417992 ?auto_417993 ) ) ( not ( = ?auto_417992 ?auto_417994 ) ) ( not ( = ?auto_417993 ?auto_417994 ) ) ( ON ?auto_417980 ?auto_417995 ) ( not ( = ?auto_417994 ?auto_417995 ) ) ( not ( = ?auto_417993 ?auto_417995 ) ) ( not ( = ?auto_417992 ?auto_417995 ) ) ( not ( = ?auto_417991 ?auto_417995 ) ) ( not ( = ?auto_417990 ?auto_417995 ) ) ( not ( = ?auto_417989 ?auto_417995 ) ) ( not ( = ?auto_417988 ?auto_417995 ) ) ( not ( = ?auto_417987 ?auto_417995 ) ) ( not ( = ?auto_417986 ?auto_417995 ) ) ( not ( = ?auto_417985 ?auto_417995 ) ) ( not ( = ?auto_417984 ?auto_417995 ) ) ( not ( = ?auto_417983 ?auto_417995 ) ) ( not ( = ?auto_417982 ?auto_417995 ) ) ( not ( = ?auto_417981 ?auto_417995 ) ) ( not ( = ?auto_417980 ?auto_417995 ) ) ( ON ?auto_417981 ?auto_417980 ) ( ON ?auto_417982 ?auto_417981 ) ( ON ?auto_417983 ?auto_417982 ) ( ON ?auto_417984 ?auto_417983 ) ( ON ?auto_417985 ?auto_417984 ) ( ON ?auto_417986 ?auto_417985 ) ( ON ?auto_417987 ?auto_417986 ) ( ON ?auto_417988 ?auto_417987 ) ( ON ?auto_417989 ?auto_417988 ) ( ON ?auto_417990 ?auto_417989 ) ( ON ?auto_417991 ?auto_417990 ) ( ON ?auto_417992 ?auto_417991 ) ( ON ?auto_417993 ?auto_417992 ) ( ON ?auto_417994 ?auto_417993 ) ( CLEAR ?auto_417994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_417994 ?auto_417993 ?auto_417992 ?auto_417991 ?auto_417990 ?auto_417989 ?auto_417988 ?auto_417987 ?auto_417986 ?auto_417985 ?auto_417984 ?auto_417983 ?auto_417982 ?auto_417981 ?auto_417980 )
      ( MAKE-15PILE ?auto_417980 ?auto_417981 ?auto_417982 ?auto_417983 ?auto_417984 ?auto_417985 ?auto_417986 ?auto_417987 ?auto_417988 ?auto_417989 ?auto_417990 ?auto_417991 ?auto_417992 ?auto_417993 ?auto_417994 ) )
  )

)

