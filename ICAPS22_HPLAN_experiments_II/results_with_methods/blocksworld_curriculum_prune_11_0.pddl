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
      ?auto_106741 - BLOCK
    )
    :vars
    (
      ?auto_106742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106741 ?auto_106742 ) ( CLEAR ?auto_106741 ) ( HAND-EMPTY ) ( not ( = ?auto_106741 ?auto_106742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106741 ?auto_106742 )
      ( !PUTDOWN ?auto_106741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106748 - BLOCK
      ?auto_106749 - BLOCK
    )
    :vars
    (
      ?auto_106750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106748 ) ( ON ?auto_106749 ?auto_106750 ) ( CLEAR ?auto_106749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106748 ) ( not ( = ?auto_106748 ?auto_106749 ) ) ( not ( = ?auto_106748 ?auto_106750 ) ) ( not ( = ?auto_106749 ?auto_106750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106749 ?auto_106750 )
      ( !STACK ?auto_106749 ?auto_106748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_106758 - BLOCK
      ?auto_106759 - BLOCK
    )
    :vars
    (
      ?auto_106760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106759 ?auto_106760 ) ( not ( = ?auto_106758 ?auto_106759 ) ) ( not ( = ?auto_106758 ?auto_106760 ) ) ( not ( = ?auto_106759 ?auto_106760 ) ) ( ON ?auto_106758 ?auto_106759 ) ( CLEAR ?auto_106758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106758 )
      ( MAKE-2PILE ?auto_106758 ?auto_106759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106769 - BLOCK
      ?auto_106770 - BLOCK
      ?auto_106771 - BLOCK
    )
    :vars
    (
      ?auto_106772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106770 ) ( ON ?auto_106771 ?auto_106772 ) ( CLEAR ?auto_106771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106769 ) ( ON ?auto_106770 ?auto_106769 ) ( not ( = ?auto_106769 ?auto_106770 ) ) ( not ( = ?auto_106769 ?auto_106771 ) ) ( not ( = ?auto_106769 ?auto_106772 ) ) ( not ( = ?auto_106770 ?auto_106771 ) ) ( not ( = ?auto_106770 ?auto_106772 ) ) ( not ( = ?auto_106771 ?auto_106772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106771 ?auto_106772 )
      ( !STACK ?auto_106771 ?auto_106770 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106783 - BLOCK
      ?auto_106784 - BLOCK
      ?auto_106785 - BLOCK
    )
    :vars
    (
      ?auto_106786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106785 ?auto_106786 ) ( ON-TABLE ?auto_106783 ) ( not ( = ?auto_106783 ?auto_106784 ) ) ( not ( = ?auto_106783 ?auto_106785 ) ) ( not ( = ?auto_106783 ?auto_106786 ) ) ( not ( = ?auto_106784 ?auto_106785 ) ) ( not ( = ?auto_106784 ?auto_106786 ) ) ( not ( = ?auto_106785 ?auto_106786 ) ) ( CLEAR ?auto_106783 ) ( ON ?auto_106784 ?auto_106785 ) ( CLEAR ?auto_106784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106783 ?auto_106784 )
      ( MAKE-3PILE ?auto_106783 ?auto_106784 ?auto_106785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_106797 - BLOCK
      ?auto_106798 - BLOCK
      ?auto_106799 - BLOCK
    )
    :vars
    (
      ?auto_106800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106799 ?auto_106800 ) ( not ( = ?auto_106797 ?auto_106798 ) ) ( not ( = ?auto_106797 ?auto_106799 ) ) ( not ( = ?auto_106797 ?auto_106800 ) ) ( not ( = ?auto_106798 ?auto_106799 ) ) ( not ( = ?auto_106798 ?auto_106800 ) ) ( not ( = ?auto_106799 ?auto_106800 ) ) ( ON ?auto_106798 ?auto_106799 ) ( ON ?auto_106797 ?auto_106798 ) ( CLEAR ?auto_106797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106797 )
      ( MAKE-3PILE ?auto_106797 ?auto_106798 ?auto_106799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106812 - BLOCK
      ?auto_106813 - BLOCK
      ?auto_106814 - BLOCK
      ?auto_106815 - BLOCK
    )
    :vars
    (
      ?auto_106816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106814 ) ( ON ?auto_106815 ?auto_106816 ) ( CLEAR ?auto_106815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106812 ) ( ON ?auto_106813 ?auto_106812 ) ( ON ?auto_106814 ?auto_106813 ) ( not ( = ?auto_106812 ?auto_106813 ) ) ( not ( = ?auto_106812 ?auto_106814 ) ) ( not ( = ?auto_106812 ?auto_106815 ) ) ( not ( = ?auto_106812 ?auto_106816 ) ) ( not ( = ?auto_106813 ?auto_106814 ) ) ( not ( = ?auto_106813 ?auto_106815 ) ) ( not ( = ?auto_106813 ?auto_106816 ) ) ( not ( = ?auto_106814 ?auto_106815 ) ) ( not ( = ?auto_106814 ?auto_106816 ) ) ( not ( = ?auto_106815 ?auto_106816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106815 ?auto_106816 )
      ( !STACK ?auto_106815 ?auto_106814 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106830 - BLOCK
      ?auto_106831 - BLOCK
      ?auto_106832 - BLOCK
      ?auto_106833 - BLOCK
    )
    :vars
    (
      ?auto_106834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106833 ?auto_106834 ) ( ON-TABLE ?auto_106830 ) ( ON ?auto_106831 ?auto_106830 ) ( not ( = ?auto_106830 ?auto_106831 ) ) ( not ( = ?auto_106830 ?auto_106832 ) ) ( not ( = ?auto_106830 ?auto_106833 ) ) ( not ( = ?auto_106830 ?auto_106834 ) ) ( not ( = ?auto_106831 ?auto_106832 ) ) ( not ( = ?auto_106831 ?auto_106833 ) ) ( not ( = ?auto_106831 ?auto_106834 ) ) ( not ( = ?auto_106832 ?auto_106833 ) ) ( not ( = ?auto_106832 ?auto_106834 ) ) ( not ( = ?auto_106833 ?auto_106834 ) ) ( CLEAR ?auto_106831 ) ( ON ?auto_106832 ?auto_106833 ) ( CLEAR ?auto_106832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106830 ?auto_106831 ?auto_106832 )
      ( MAKE-4PILE ?auto_106830 ?auto_106831 ?auto_106832 ?auto_106833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106848 - BLOCK
      ?auto_106849 - BLOCK
      ?auto_106850 - BLOCK
      ?auto_106851 - BLOCK
    )
    :vars
    (
      ?auto_106852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106851 ?auto_106852 ) ( ON-TABLE ?auto_106848 ) ( not ( = ?auto_106848 ?auto_106849 ) ) ( not ( = ?auto_106848 ?auto_106850 ) ) ( not ( = ?auto_106848 ?auto_106851 ) ) ( not ( = ?auto_106848 ?auto_106852 ) ) ( not ( = ?auto_106849 ?auto_106850 ) ) ( not ( = ?auto_106849 ?auto_106851 ) ) ( not ( = ?auto_106849 ?auto_106852 ) ) ( not ( = ?auto_106850 ?auto_106851 ) ) ( not ( = ?auto_106850 ?auto_106852 ) ) ( not ( = ?auto_106851 ?auto_106852 ) ) ( ON ?auto_106850 ?auto_106851 ) ( CLEAR ?auto_106848 ) ( ON ?auto_106849 ?auto_106850 ) ( CLEAR ?auto_106849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106848 ?auto_106849 )
      ( MAKE-4PILE ?auto_106848 ?auto_106849 ?auto_106850 ?auto_106851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_106866 - BLOCK
      ?auto_106867 - BLOCK
      ?auto_106868 - BLOCK
      ?auto_106869 - BLOCK
    )
    :vars
    (
      ?auto_106870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106869 ?auto_106870 ) ( not ( = ?auto_106866 ?auto_106867 ) ) ( not ( = ?auto_106866 ?auto_106868 ) ) ( not ( = ?auto_106866 ?auto_106869 ) ) ( not ( = ?auto_106866 ?auto_106870 ) ) ( not ( = ?auto_106867 ?auto_106868 ) ) ( not ( = ?auto_106867 ?auto_106869 ) ) ( not ( = ?auto_106867 ?auto_106870 ) ) ( not ( = ?auto_106868 ?auto_106869 ) ) ( not ( = ?auto_106868 ?auto_106870 ) ) ( not ( = ?auto_106869 ?auto_106870 ) ) ( ON ?auto_106868 ?auto_106869 ) ( ON ?auto_106867 ?auto_106868 ) ( ON ?auto_106866 ?auto_106867 ) ( CLEAR ?auto_106866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106866 )
      ( MAKE-4PILE ?auto_106866 ?auto_106867 ?auto_106868 ?auto_106869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106885 - BLOCK
      ?auto_106886 - BLOCK
      ?auto_106887 - BLOCK
      ?auto_106888 - BLOCK
      ?auto_106889 - BLOCK
    )
    :vars
    (
      ?auto_106890 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_106888 ) ( ON ?auto_106889 ?auto_106890 ) ( CLEAR ?auto_106889 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106885 ) ( ON ?auto_106886 ?auto_106885 ) ( ON ?auto_106887 ?auto_106886 ) ( ON ?auto_106888 ?auto_106887 ) ( not ( = ?auto_106885 ?auto_106886 ) ) ( not ( = ?auto_106885 ?auto_106887 ) ) ( not ( = ?auto_106885 ?auto_106888 ) ) ( not ( = ?auto_106885 ?auto_106889 ) ) ( not ( = ?auto_106885 ?auto_106890 ) ) ( not ( = ?auto_106886 ?auto_106887 ) ) ( not ( = ?auto_106886 ?auto_106888 ) ) ( not ( = ?auto_106886 ?auto_106889 ) ) ( not ( = ?auto_106886 ?auto_106890 ) ) ( not ( = ?auto_106887 ?auto_106888 ) ) ( not ( = ?auto_106887 ?auto_106889 ) ) ( not ( = ?auto_106887 ?auto_106890 ) ) ( not ( = ?auto_106888 ?auto_106889 ) ) ( not ( = ?auto_106888 ?auto_106890 ) ) ( not ( = ?auto_106889 ?auto_106890 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_106889 ?auto_106890 )
      ( !STACK ?auto_106889 ?auto_106888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106907 - BLOCK
      ?auto_106908 - BLOCK
      ?auto_106909 - BLOCK
      ?auto_106910 - BLOCK
      ?auto_106911 - BLOCK
    )
    :vars
    (
      ?auto_106912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106911 ?auto_106912 ) ( ON-TABLE ?auto_106907 ) ( ON ?auto_106908 ?auto_106907 ) ( ON ?auto_106909 ?auto_106908 ) ( not ( = ?auto_106907 ?auto_106908 ) ) ( not ( = ?auto_106907 ?auto_106909 ) ) ( not ( = ?auto_106907 ?auto_106910 ) ) ( not ( = ?auto_106907 ?auto_106911 ) ) ( not ( = ?auto_106907 ?auto_106912 ) ) ( not ( = ?auto_106908 ?auto_106909 ) ) ( not ( = ?auto_106908 ?auto_106910 ) ) ( not ( = ?auto_106908 ?auto_106911 ) ) ( not ( = ?auto_106908 ?auto_106912 ) ) ( not ( = ?auto_106909 ?auto_106910 ) ) ( not ( = ?auto_106909 ?auto_106911 ) ) ( not ( = ?auto_106909 ?auto_106912 ) ) ( not ( = ?auto_106910 ?auto_106911 ) ) ( not ( = ?auto_106910 ?auto_106912 ) ) ( not ( = ?auto_106911 ?auto_106912 ) ) ( CLEAR ?auto_106909 ) ( ON ?auto_106910 ?auto_106911 ) ( CLEAR ?auto_106910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_106907 ?auto_106908 ?auto_106909 ?auto_106910 )
      ( MAKE-5PILE ?auto_106907 ?auto_106908 ?auto_106909 ?auto_106910 ?auto_106911 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106929 - BLOCK
      ?auto_106930 - BLOCK
      ?auto_106931 - BLOCK
      ?auto_106932 - BLOCK
      ?auto_106933 - BLOCK
    )
    :vars
    (
      ?auto_106934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106933 ?auto_106934 ) ( ON-TABLE ?auto_106929 ) ( ON ?auto_106930 ?auto_106929 ) ( not ( = ?auto_106929 ?auto_106930 ) ) ( not ( = ?auto_106929 ?auto_106931 ) ) ( not ( = ?auto_106929 ?auto_106932 ) ) ( not ( = ?auto_106929 ?auto_106933 ) ) ( not ( = ?auto_106929 ?auto_106934 ) ) ( not ( = ?auto_106930 ?auto_106931 ) ) ( not ( = ?auto_106930 ?auto_106932 ) ) ( not ( = ?auto_106930 ?auto_106933 ) ) ( not ( = ?auto_106930 ?auto_106934 ) ) ( not ( = ?auto_106931 ?auto_106932 ) ) ( not ( = ?auto_106931 ?auto_106933 ) ) ( not ( = ?auto_106931 ?auto_106934 ) ) ( not ( = ?auto_106932 ?auto_106933 ) ) ( not ( = ?auto_106932 ?auto_106934 ) ) ( not ( = ?auto_106933 ?auto_106934 ) ) ( ON ?auto_106932 ?auto_106933 ) ( CLEAR ?auto_106930 ) ( ON ?auto_106931 ?auto_106932 ) ( CLEAR ?auto_106931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_106929 ?auto_106930 ?auto_106931 )
      ( MAKE-5PILE ?auto_106929 ?auto_106930 ?auto_106931 ?auto_106932 ?auto_106933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106951 - BLOCK
      ?auto_106952 - BLOCK
      ?auto_106953 - BLOCK
      ?auto_106954 - BLOCK
      ?auto_106955 - BLOCK
    )
    :vars
    (
      ?auto_106956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106955 ?auto_106956 ) ( ON-TABLE ?auto_106951 ) ( not ( = ?auto_106951 ?auto_106952 ) ) ( not ( = ?auto_106951 ?auto_106953 ) ) ( not ( = ?auto_106951 ?auto_106954 ) ) ( not ( = ?auto_106951 ?auto_106955 ) ) ( not ( = ?auto_106951 ?auto_106956 ) ) ( not ( = ?auto_106952 ?auto_106953 ) ) ( not ( = ?auto_106952 ?auto_106954 ) ) ( not ( = ?auto_106952 ?auto_106955 ) ) ( not ( = ?auto_106952 ?auto_106956 ) ) ( not ( = ?auto_106953 ?auto_106954 ) ) ( not ( = ?auto_106953 ?auto_106955 ) ) ( not ( = ?auto_106953 ?auto_106956 ) ) ( not ( = ?auto_106954 ?auto_106955 ) ) ( not ( = ?auto_106954 ?auto_106956 ) ) ( not ( = ?auto_106955 ?auto_106956 ) ) ( ON ?auto_106954 ?auto_106955 ) ( ON ?auto_106953 ?auto_106954 ) ( CLEAR ?auto_106951 ) ( ON ?auto_106952 ?auto_106953 ) ( CLEAR ?auto_106952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_106951 ?auto_106952 )
      ( MAKE-5PILE ?auto_106951 ?auto_106952 ?auto_106953 ?auto_106954 ?auto_106955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_106973 - BLOCK
      ?auto_106974 - BLOCK
      ?auto_106975 - BLOCK
      ?auto_106976 - BLOCK
      ?auto_106977 - BLOCK
    )
    :vars
    (
      ?auto_106978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_106977 ?auto_106978 ) ( not ( = ?auto_106973 ?auto_106974 ) ) ( not ( = ?auto_106973 ?auto_106975 ) ) ( not ( = ?auto_106973 ?auto_106976 ) ) ( not ( = ?auto_106973 ?auto_106977 ) ) ( not ( = ?auto_106973 ?auto_106978 ) ) ( not ( = ?auto_106974 ?auto_106975 ) ) ( not ( = ?auto_106974 ?auto_106976 ) ) ( not ( = ?auto_106974 ?auto_106977 ) ) ( not ( = ?auto_106974 ?auto_106978 ) ) ( not ( = ?auto_106975 ?auto_106976 ) ) ( not ( = ?auto_106975 ?auto_106977 ) ) ( not ( = ?auto_106975 ?auto_106978 ) ) ( not ( = ?auto_106976 ?auto_106977 ) ) ( not ( = ?auto_106976 ?auto_106978 ) ) ( not ( = ?auto_106977 ?auto_106978 ) ) ( ON ?auto_106976 ?auto_106977 ) ( ON ?auto_106975 ?auto_106976 ) ( ON ?auto_106974 ?auto_106975 ) ( ON ?auto_106973 ?auto_106974 ) ( CLEAR ?auto_106973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_106973 )
      ( MAKE-5PILE ?auto_106973 ?auto_106974 ?auto_106975 ?auto_106976 ?auto_106977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_106996 - BLOCK
      ?auto_106997 - BLOCK
      ?auto_106998 - BLOCK
      ?auto_106999 - BLOCK
      ?auto_107000 - BLOCK
      ?auto_107001 - BLOCK
    )
    :vars
    (
      ?auto_107002 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107000 ) ( ON ?auto_107001 ?auto_107002 ) ( CLEAR ?auto_107001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_106996 ) ( ON ?auto_106997 ?auto_106996 ) ( ON ?auto_106998 ?auto_106997 ) ( ON ?auto_106999 ?auto_106998 ) ( ON ?auto_107000 ?auto_106999 ) ( not ( = ?auto_106996 ?auto_106997 ) ) ( not ( = ?auto_106996 ?auto_106998 ) ) ( not ( = ?auto_106996 ?auto_106999 ) ) ( not ( = ?auto_106996 ?auto_107000 ) ) ( not ( = ?auto_106996 ?auto_107001 ) ) ( not ( = ?auto_106996 ?auto_107002 ) ) ( not ( = ?auto_106997 ?auto_106998 ) ) ( not ( = ?auto_106997 ?auto_106999 ) ) ( not ( = ?auto_106997 ?auto_107000 ) ) ( not ( = ?auto_106997 ?auto_107001 ) ) ( not ( = ?auto_106997 ?auto_107002 ) ) ( not ( = ?auto_106998 ?auto_106999 ) ) ( not ( = ?auto_106998 ?auto_107000 ) ) ( not ( = ?auto_106998 ?auto_107001 ) ) ( not ( = ?auto_106998 ?auto_107002 ) ) ( not ( = ?auto_106999 ?auto_107000 ) ) ( not ( = ?auto_106999 ?auto_107001 ) ) ( not ( = ?auto_106999 ?auto_107002 ) ) ( not ( = ?auto_107000 ?auto_107001 ) ) ( not ( = ?auto_107000 ?auto_107002 ) ) ( not ( = ?auto_107001 ?auto_107002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107001 ?auto_107002 )
      ( !STACK ?auto_107001 ?auto_107000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107022 - BLOCK
      ?auto_107023 - BLOCK
      ?auto_107024 - BLOCK
      ?auto_107025 - BLOCK
      ?auto_107026 - BLOCK
      ?auto_107027 - BLOCK
    )
    :vars
    (
      ?auto_107028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107027 ?auto_107028 ) ( ON-TABLE ?auto_107022 ) ( ON ?auto_107023 ?auto_107022 ) ( ON ?auto_107024 ?auto_107023 ) ( ON ?auto_107025 ?auto_107024 ) ( not ( = ?auto_107022 ?auto_107023 ) ) ( not ( = ?auto_107022 ?auto_107024 ) ) ( not ( = ?auto_107022 ?auto_107025 ) ) ( not ( = ?auto_107022 ?auto_107026 ) ) ( not ( = ?auto_107022 ?auto_107027 ) ) ( not ( = ?auto_107022 ?auto_107028 ) ) ( not ( = ?auto_107023 ?auto_107024 ) ) ( not ( = ?auto_107023 ?auto_107025 ) ) ( not ( = ?auto_107023 ?auto_107026 ) ) ( not ( = ?auto_107023 ?auto_107027 ) ) ( not ( = ?auto_107023 ?auto_107028 ) ) ( not ( = ?auto_107024 ?auto_107025 ) ) ( not ( = ?auto_107024 ?auto_107026 ) ) ( not ( = ?auto_107024 ?auto_107027 ) ) ( not ( = ?auto_107024 ?auto_107028 ) ) ( not ( = ?auto_107025 ?auto_107026 ) ) ( not ( = ?auto_107025 ?auto_107027 ) ) ( not ( = ?auto_107025 ?auto_107028 ) ) ( not ( = ?auto_107026 ?auto_107027 ) ) ( not ( = ?auto_107026 ?auto_107028 ) ) ( not ( = ?auto_107027 ?auto_107028 ) ) ( CLEAR ?auto_107025 ) ( ON ?auto_107026 ?auto_107027 ) ( CLEAR ?auto_107026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107022 ?auto_107023 ?auto_107024 ?auto_107025 ?auto_107026 )
      ( MAKE-6PILE ?auto_107022 ?auto_107023 ?auto_107024 ?auto_107025 ?auto_107026 ?auto_107027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107048 - BLOCK
      ?auto_107049 - BLOCK
      ?auto_107050 - BLOCK
      ?auto_107051 - BLOCK
      ?auto_107052 - BLOCK
      ?auto_107053 - BLOCK
    )
    :vars
    (
      ?auto_107054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107053 ?auto_107054 ) ( ON-TABLE ?auto_107048 ) ( ON ?auto_107049 ?auto_107048 ) ( ON ?auto_107050 ?auto_107049 ) ( not ( = ?auto_107048 ?auto_107049 ) ) ( not ( = ?auto_107048 ?auto_107050 ) ) ( not ( = ?auto_107048 ?auto_107051 ) ) ( not ( = ?auto_107048 ?auto_107052 ) ) ( not ( = ?auto_107048 ?auto_107053 ) ) ( not ( = ?auto_107048 ?auto_107054 ) ) ( not ( = ?auto_107049 ?auto_107050 ) ) ( not ( = ?auto_107049 ?auto_107051 ) ) ( not ( = ?auto_107049 ?auto_107052 ) ) ( not ( = ?auto_107049 ?auto_107053 ) ) ( not ( = ?auto_107049 ?auto_107054 ) ) ( not ( = ?auto_107050 ?auto_107051 ) ) ( not ( = ?auto_107050 ?auto_107052 ) ) ( not ( = ?auto_107050 ?auto_107053 ) ) ( not ( = ?auto_107050 ?auto_107054 ) ) ( not ( = ?auto_107051 ?auto_107052 ) ) ( not ( = ?auto_107051 ?auto_107053 ) ) ( not ( = ?auto_107051 ?auto_107054 ) ) ( not ( = ?auto_107052 ?auto_107053 ) ) ( not ( = ?auto_107052 ?auto_107054 ) ) ( not ( = ?auto_107053 ?auto_107054 ) ) ( ON ?auto_107052 ?auto_107053 ) ( CLEAR ?auto_107050 ) ( ON ?auto_107051 ?auto_107052 ) ( CLEAR ?auto_107051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107048 ?auto_107049 ?auto_107050 ?auto_107051 )
      ( MAKE-6PILE ?auto_107048 ?auto_107049 ?auto_107050 ?auto_107051 ?auto_107052 ?auto_107053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107074 - BLOCK
      ?auto_107075 - BLOCK
      ?auto_107076 - BLOCK
      ?auto_107077 - BLOCK
      ?auto_107078 - BLOCK
      ?auto_107079 - BLOCK
    )
    :vars
    (
      ?auto_107080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107079 ?auto_107080 ) ( ON-TABLE ?auto_107074 ) ( ON ?auto_107075 ?auto_107074 ) ( not ( = ?auto_107074 ?auto_107075 ) ) ( not ( = ?auto_107074 ?auto_107076 ) ) ( not ( = ?auto_107074 ?auto_107077 ) ) ( not ( = ?auto_107074 ?auto_107078 ) ) ( not ( = ?auto_107074 ?auto_107079 ) ) ( not ( = ?auto_107074 ?auto_107080 ) ) ( not ( = ?auto_107075 ?auto_107076 ) ) ( not ( = ?auto_107075 ?auto_107077 ) ) ( not ( = ?auto_107075 ?auto_107078 ) ) ( not ( = ?auto_107075 ?auto_107079 ) ) ( not ( = ?auto_107075 ?auto_107080 ) ) ( not ( = ?auto_107076 ?auto_107077 ) ) ( not ( = ?auto_107076 ?auto_107078 ) ) ( not ( = ?auto_107076 ?auto_107079 ) ) ( not ( = ?auto_107076 ?auto_107080 ) ) ( not ( = ?auto_107077 ?auto_107078 ) ) ( not ( = ?auto_107077 ?auto_107079 ) ) ( not ( = ?auto_107077 ?auto_107080 ) ) ( not ( = ?auto_107078 ?auto_107079 ) ) ( not ( = ?auto_107078 ?auto_107080 ) ) ( not ( = ?auto_107079 ?auto_107080 ) ) ( ON ?auto_107078 ?auto_107079 ) ( ON ?auto_107077 ?auto_107078 ) ( CLEAR ?auto_107075 ) ( ON ?auto_107076 ?auto_107077 ) ( CLEAR ?auto_107076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107074 ?auto_107075 ?auto_107076 )
      ( MAKE-6PILE ?auto_107074 ?auto_107075 ?auto_107076 ?auto_107077 ?auto_107078 ?auto_107079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107100 - BLOCK
      ?auto_107101 - BLOCK
      ?auto_107102 - BLOCK
      ?auto_107103 - BLOCK
      ?auto_107104 - BLOCK
      ?auto_107105 - BLOCK
    )
    :vars
    (
      ?auto_107106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107105 ?auto_107106 ) ( ON-TABLE ?auto_107100 ) ( not ( = ?auto_107100 ?auto_107101 ) ) ( not ( = ?auto_107100 ?auto_107102 ) ) ( not ( = ?auto_107100 ?auto_107103 ) ) ( not ( = ?auto_107100 ?auto_107104 ) ) ( not ( = ?auto_107100 ?auto_107105 ) ) ( not ( = ?auto_107100 ?auto_107106 ) ) ( not ( = ?auto_107101 ?auto_107102 ) ) ( not ( = ?auto_107101 ?auto_107103 ) ) ( not ( = ?auto_107101 ?auto_107104 ) ) ( not ( = ?auto_107101 ?auto_107105 ) ) ( not ( = ?auto_107101 ?auto_107106 ) ) ( not ( = ?auto_107102 ?auto_107103 ) ) ( not ( = ?auto_107102 ?auto_107104 ) ) ( not ( = ?auto_107102 ?auto_107105 ) ) ( not ( = ?auto_107102 ?auto_107106 ) ) ( not ( = ?auto_107103 ?auto_107104 ) ) ( not ( = ?auto_107103 ?auto_107105 ) ) ( not ( = ?auto_107103 ?auto_107106 ) ) ( not ( = ?auto_107104 ?auto_107105 ) ) ( not ( = ?auto_107104 ?auto_107106 ) ) ( not ( = ?auto_107105 ?auto_107106 ) ) ( ON ?auto_107104 ?auto_107105 ) ( ON ?auto_107103 ?auto_107104 ) ( ON ?auto_107102 ?auto_107103 ) ( CLEAR ?auto_107100 ) ( ON ?auto_107101 ?auto_107102 ) ( CLEAR ?auto_107101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107100 ?auto_107101 )
      ( MAKE-6PILE ?auto_107100 ?auto_107101 ?auto_107102 ?auto_107103 ?auto_107104 ?auto_107105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_107126 - BLOCK
      ?auto_107127 - BLOCK
      ?auto_107128 - BLOCK
      ?auto_107129 - BLOCK
      ?auto_107130 - BLOCK
      ?auto_107131 - BLOCK
    )
    :vars
    (
      ?auto_107132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107131 ?auto_107132 ) ( not ( = ?auto_107126 ?auto_107127 ) ) ( not ( = ?auto_107126 ?auto_107128 ) ) ( not ( = ?auto_107126 ?auto_107129 ) ) ( not ( = ?auto_107126 ?auto_107130 ) ) ( not ( = ?auto_107126 ?auto_107131 ) ) ( not ( = ?auto_107126 ?auto_107132 ) ) ( not ( = ?auto_107127 ?auto_107128 ) ) ( not ( = ?auto_107127 ?auto_107129 ) ) ( not ( = ?auto_107127 ?auto_107130 ) ) ( not ( = ?auto_107127 ?auto_107131 ) ) ( not ( = ?auto_107127 ?auto_107132 ) ) ( not ( = ?auto_107128 ?auto_107129 ) ) ( not ( = ?auto_107128 ?auto_107130 ) ) ( not ( = ?auto_107128 ?auto_107131 ) ) ( not ( = ?auto_107128 ?auto_107132 ) ) ( not ( = ?auto_107129 ?auto_107130 ) ) ( not ( = ?auto_107129 ?auto_107131 ) ) ( not ( = ?auto_107129 ?auto_107132 ) ) ( not ( = ?auto_107130 ?auto_107131 ) ) ( not ( = ?auto_107130 ?auto_107132 ) ) ( not ( = ?auto_107131 ?auto_107132 ) ) ( ON ?auto_107130 ?auto_107131 ) ( ON ?auto_107129 ?auto_107130 ) ( ON ?auto_107128 ?auto_107129 ) ( ON ?auto_107127 ?auto_107128 ) ( ON ?auto_107126 ?auto_107127 ) ( CLEAR ?auto_107126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107126 )
      ( MAKE-6PILE ?auto_107126 ?auto_107127 ?auto_107128 ?auto_107129 ?auto_107130 ?auto_107131 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107153 - BLOCK
      ?auto_107154 - BLOCK
      ?auto_107155 - BLOCK
      ?auto_107156 - BLOCK
      ?auto_107157 - BLOCK
      ?auto_107158 - BLOCK
      ?auto_107159 - BLOCK
    )
    :vars
    (
      ?auto_107160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107158 ) ( ON ?auto_107159 ?auto_107160 ) ( CLEAR ?auto_107159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107153 ) ( ON ?auto_107154 ?auto_107153 ) ( ON ?auto_107155 ?auto_107154 ) ( ON ?auto_107156 ?auto_107155 ) ( ON ?auto_107157 ?auto_107156 ) ( ON ?auto_107158 ?auto_107157 ) ( not ( = ?auto_107153 ?auto_107154 ) ) ( not ( = ?auto_107153 ?auto_107155 ) ) ( not ( = ?auto_107153 ?auto_107156 ) ) ( not ( = ?auto_107153 ?auto_107157 ) ) ( not ( = ?auto_107153 ?auto_107158 ) ) ( not ( = ?auto_107153 ?auto_107159 ) ) ( not ( = ?auto_107153 ?auto_107160 ) ) ( not ( = ?auto_107154 ?auto_107155 ) ) ( not ( = ?auto_107154 ?auto_107156 ) ) ( not ( = ?auto_107154 ?auto_107157 ) ) ( not ( = ?auto_107154 ?auto_107158 ) ) ( not ( = ?auto_107154 ?auto_107159 ) ) ( not ( = ?auto_107154 ?auto_107160 ) ) ( not ( = ?auto_107155 ?auto_107156 ) ) ( not ( = ?auto_107155 ?auto_107157 ) ) ( not ( = ?auto_107155 ?auto_107158 ) ) ( not ( = ?auto_107155 ?auto_107159 ) ) ( not ( = ?auto_107155 ?auto_107160 ) ) ( not ( = ?auto_107156 ?auto_107157 ) ) ( not ( = ?auto_107156 ?auto_107158 ) ) ( not ( = ?auto_107156 ?auto_107159 ) ) ( not ( = ?auto_107156 ?auto_107160 ) ) ( not ( = ?auto_107157 ?auto_107158 ) ) ( not ( = ?auto_107157 ?auto_107159 ) ) ( not ( = ?auto_107157 ?auto_107160 ) ) ( not ( = ?auto_107158 ?auto_107159 ) ) ( not ( = ?auto_107158 ?auto_107160 ) ) ( not ( = ?auto_107159 ?auto_107160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107159 ?auto_107160 )
      ( !STACK ?auto_107159 ?auto_107158 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107183 - BLOCK
      ?auto_107184 - BLOCK
      ?auto_107185 - BLOCK
      ?auto_107186 - BLOCK
      ?auto_107187 - BLOCK
      ?auto_107188 - BLOCK
      ?auto_107189 - BLOCK
    )
    :vars
    (
      ?auto_107190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107189 ?auto_107190 ) ( ON-TABLE ?auto_107183 ) ( ON ?auto_107184 ?auto_107183 ) ( ON ?auto_107185 ?auto_107184 ) ( ON ?auto_107186 ?auto_107185 ) ( ON ?auto_107187 ?auto_107186 ) ( not ( = ?auto_107183 ?auto_107184 ) ) ( not ( = ?auto_107183 ?auto_107185 ) ) ( not ( = ?auto_107183 ?auto_107186 ) ) ( not ( = ?auto_107183 ?auto_107187 ) ) ( not ( = ?auto_107183 ?auto_107188 ) ) ( not ( = ?auto_107183 ?auto_107189 ) ) ( not ( = ?auto_107183 ?auto_107190 ) ) ( not ( = ?auto_107184 ?auto_107185 ) ) ( not ( = ?auto_107184 ?auto_107186 ) ) ( not ( = ?auto_107184 ?auto_107187 ) ) ( not ( = ?auto_107184 ?auto_107188 ) ) ( not ( = ?auto_107184 ?auto_107189 ) ) ( not ( = ?auto_107184 ?auto_107190 ) ) ( not ( = ?auto_107185 ?auto_107186 ) ) ( not ( = ?auto_107185 ?auto_107187 ) ) ( not ( = ?auto_107185 ?auto_107188 ) ) ( not ( = ?auto_107185 ?auto_107189 ) ) ( not ( = ?auto_107185 ?auto_107190 ) ) ( not ( = ?auto_107186 ?auto_107187 ) ) ( not ( = ?auto_107186 ?auto_107188 ) ) ( not ( = ?auto_107186 ?auto_107189 ) ) ( not ( = ?auto_107186 ?auto_107190 ) ) ( not ( = ?auto_107187 ?auto_107188 ) ) ( not ( = ?auto_107187 ?auto_107189 ) ) ( not ( = ?auto_107187 ?auto_107190 ) ) ( not ( = ?auto_107188 ?auto_107189 ) ) ( not ( = ?auto_107188 ?auto_107190 ) ) ( not ( = ?auto_107189 ?auto_107190 ) ) ( CLEAR ?auto_107187 ) ( ON ?auto_107188 ?auto_107189 ) ( CLEAR ?auto_107188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107183 ?auto_107184 ?auto_107185 ?auto_107186 ?auto_107187 ?auto_107188 )
      ( MAKE-7PILE ?auto_107183 ?auto_107184 ?auto_107185 ?auto_107186 ?auto_107187 ?auto_107188 ?auto_107189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107213 - BLOCK
      ?auto_107214 - BLOCK
      ?auto_107215 - BLOCK
      ?auto_107216 - BLOCK
      ?auto_107217 - BLOCK
      ?auto_107218 - BLOCK
      ?auto_107219 - BLOCK
    )
    :vars
    (
      ?auto_107220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107219 ?auto_107220 ) ( ON-TABLE ?auto_107213 ) ( ON ?auto_107214 ?auto_107213 ) ( ON ?auto_107215 ?auto_107214 ) ( ON ?auto_107216 ?auto_107215 ) ( not ( = ?auto_107213 ?auto_107214 ) ) ( not ( = ?auto_107213 ?auto_107215 ) ) ( not ( = ?auto_107213 ?auto_107216 ) ) ( not ( = ?auto_107213 ?auto_107217 ) ) ( not ( = ?auto_107213 ?auto_107218 ) ) ( not ( = ?auto_107213 ?auto_107219 ) ) ( not ( = ?auto_107213 ?auto_107220 ) ) ( not ( = ?auto_107214 ?auto_107215 ) ) ( not ( = ?auto_107214 ?auto_107216 ) ) ( not ( = ?auto_107214 ?auto_107217 ) ) ( not ( = ?auto_107214 ?auto_107218 ) ) ( not ( = ?auto_107214 ?auto_107219 ) ) ( not ( = ?auto_107214 ?auto_107220 ) ) ( not ( = ?auto_107215 ?auto_107216 ) ) ( not ( = ?auto_107215 ?auto_107217 ) ) ( not ( = ?auto_107215 ?auto_107218 ) ) ( not ( = ?auto_107215 ?auto_107219 ) ) ( not ( = ?auto_107215 ?auto_107220 ) ) ( not ( = ?auto_107216 ?auto_107217 ) ) ( not ( = ?auto_107216 ?auto_107218 ) ) ( not ( = ?auto_107216 ?auto_107219 ) ) ( not ( = ?auto_107216 ?auto_107220 ) ) ( not ( = ?auto_107217 ?auto_107218 ) ) ( not ( = ?auto_107217 ?auto_107219 ) ) ( not ( = ?auto_107217 ?auto_107220 ) ) ( not ( = ?auto_107218 ?auto_107219 ) ) ( not ( = ?auto_107218 ?auto_107220 ) ) ( not ( = ?auto_107219 ?auto_107220 ) ) ( ON ?auto_107218 ?auto_107219 ) ( CLEAR ?auto_107216 ) ( ON ?auto_107217 ?auto_107218 ) ( CLEAR ?auto_107217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107213 ?auto_107214 ?auto_107215 ?auto_107216 ?auto_107217 )
      ( MAKE-7PILE ?auto_107213 ?auto_107214 ?auto_107215 ?auto_107216 ?auto_107217 ?auto_107218 ?auto_107219 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107243 - BLOCK
      ?auto_107244 - BLOCK
      ?auto_107245 - BLOCK
      ?auto_107246 - BLOCK
      ?auto_107247 - BLOCK
      ?auto_107248 - BLOCK
      ?auto_107249 - BLOCK
    )
    :vars
    (
      ?auto_107250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107249 ?auto_107250 ) ( ON-TABLE ?auto_107243 ) ( ON ?auto_107244 ?auto_107243 ) ( ON ?auto_107245 ?auto_107244 ) ( not ( = ?auto_107243 ?auto_107244 ) ) ( not ( = ?auto_107243 ?auto_107245 ) ) ( not ( = ?auto_107243 ?auto_107246 ) ) ( not ( = ?auto_107243 ?auto_107247 ) ) ( not ( = ?auto_107243 ?auto_107248 ) ) ( not ( = ?auto_107243 ?auto_107249 ) ) ( not ( = ?auto_107243 ?auto_107250 ) ) ( not ( = ?auto_107244 ?auto_107245 ) ) ( not ( = ?auto_107244 ?auto_107246 ) ) ( not ( = ?auto_107244 ?auto_107247 ) ) ( not ( = ?auto_107244 ?auto_107248 ) ) ( not ( = ?auto_107244 ?auto_107249 ) ) ( not ( = ?auto_107244 ?auto_107250 ) ) ( not ( = ?auto_107245 ?auto_107246 ) ) ( not ( = ?auto_107245 ?auto_107247 ) ) ( not ( = ?auto_107245 ?auto_107248 ) ) ( not ( = ?auto_107245 ?auto_107249 ) ) ( not ( = ?auto_107245 ?auto_107250 ) ) ( not ( = ?auto_107246 ?auto_107247 ) ) ( not ( = ?auto_107246 ?auto_107248 ) ) ( not ( = ?auto_107246 ?auto_107249 ) ) ( not ( = ?auto_107246 ?auto_107250 ) ) ( not ( = ?auto_107247 ?auto_107248 ) ) ( not ( = ?auto_107247 ?auto_107249 ) ) ( not ( = ?auto_107247 ?auto_107250 ) ) ( not ( = ?auto_107248 ?auto_107249 ) ) ( not ( = ?auto_107248 ?auto_107250 ) ) ( not ( = ?auto_107249 ?auto_107250 ) ) ( ON ?auto_107248 ?auto_107249 ) ( ON ?auto_107247 ?auto_107248 ) ( CLEAR ?auto_107245 ) ( ON ?auto_107246 ?auto_107247 ) ( CLEAR ?auto_107246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107243 ?auto_107244 ?auto_107245 ?auto_107246 )
      ( MAKE-7PILE ?auto_107243 ?auto_107244 ?auto_107245 ?auto_107246 ?auto_107247 ?auto_107248 ?auto_107249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107273 - BLOCK
      ?auto_107274 - BLOCK
      ?auto_107275 - BLOCK
      ?auto_107276 - BLOCK
      ?auto_107277 - BLOCK
      ?auto_107278 - BLOCK
      ?auto_107279 - BLOCK
    )
    :vars
    (
      ?auto_107280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107279 ?auto_107280 ) ( ON-TABLE ?auto_107273 ) ( ON ?auto_107274 ?auto_107273 ) ( not ( = ?auto_107273 ?auto_107274 ) ) ( not ( = ?auto_107273 ?auto_107275 ) ) ( not ( = ?auto_107273 ?auto_107276 ) ) ( not ( = ?auto_107273 ?auto_107277 ) ) ( not ( = ?auto_107273 ?auto_107278 ) ) ( not ( = ?auto_107273 ?auto_107279 ) ) ( not ( = ?auto_107273 ?auto_107280 ) ) ( not ( = ?auto_107274 ?auto_107275 ) ) ( not ( = ?auto_107274 ?auto_107276 ) ) ( not ( = ?auto_107274 ?auto_107277 ) ) ( not ( = ?auto_107274 ?auto_107278 ) ) ( not ( = ?auto_107274 ?auto_107279 ) ) ( not ( = ?auto_107274 ?auto_107280 ) ) ( not ( = ?auto_107275 ?auto_107276 ) ) ( not ( = ?auto_107275 ?auto_107277 ) ) ( not ( = ?auto_107275 ?auto_107278 ) ) ( not ( = ?auto_107275 ?auto_107279 ) ) ( not ( = ?auto_107275 ?auto_107280 ) ) ( not ( = ?auto_107276 ?auto_107277 ) ) ( not ( = ?auto_107276 ?auto_107278 ) ) ( not ( = ?auto_107276 ?auto_107279 ) ) ( not ( = ?auto_107276 ?auto_107280 ) ) ( not ( = ?auto_107277 ?auto_107278 ) ) ( not ( = ?auto_107277 ?auto_107279 ) ) ( not ( = ?auto_107277 ?auto_107280 ) ) ( not ( = ?auto_107278 ?auto_107279 ) ) ( not ( = ?auto_107278 ?auto_107280 ) ) ( not ( = ?auto_107279 ?auto_107280 ) ) ( ON ?auto_107278 ?auto_107279 ) ( ON ?auto_107277 ?auto_107278 ) ( ON ?auto_107276 ?auto_107277 ) ( CLEAR ?auto_107274 ) ( ON ?auto_107275 ?auto_107276 ) ( CLEAR ?auto_107275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107273 ?auto_107274 ?auto_107275 )
      ( MAKE-7PILE ?auto_107273 ?auto_107274 ?auto_107275 ?auto_107276 ?auto_107277 ?auto_107278 ?auto_107279 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107303 - BLOCK
      ?auto_107304 - BLOCK
      ?auto_107305 - BLOCK
      ?auto_107306 - BLOCK
      ?auto_107307 - BLOCK
      ?auto_107308 - BLOCK
      ?auto_107309 - BLOCK
    )
    :vars
    (
      ?auto_107310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107309 ?auto_107310 ) ( ON-TABLE ?auto_107303 ) ( not ( = ?auto_107303 ?auto_107304 ) ) ( not ( = ?auto_107303 ?auto_107305 ) ) ( not ( = ?auto_107303 ?auto_107306 ) ) ( not ( = ?auto_107303 ?auto_107307 ) ) ( not ( = ?auto_107303 ?auto_107308 ) ) ( not ( = ?auto_107303 ?auto_107309 ) ) ( not ( = ?auto_107303 ?auto_107310 ) ) ( not ( = ?auto_107304 ?auto_107305 ) ) ( not ( = ?auto_107304 ?auto_107306 ) ) ( not ( = ?auto_107304 ?auto_107307 ) ) ( not ( = ?auto_107304 ?auto_107308 ) ) ( not ( = ?auto_107304 ?auto_107309 ) ) ( not ( = ?auto_107304 ?auto_107310 ) ) ( not ( = ?auto_107305 ?auto_107306 ) ) ( not ( = ?auto_107305 ?auto_107307 ) ) ( not ( = ?auto_107305 ?auto_107308 ) ) ( not ( = ?auto_107305 ?auto_107309 ) ) ( not ( = ?auto_107305 ?auto_107310 ) ) ( not ( = ?auto_107306 ?auto_107307 ) ) ( not ( = ?auto_107306 ?auto_107308 ) ) ( not ( = ?auto_107306 ?auto_107309 ) ) ( not ( = ?auto_107306 ?auto_107310 ) ) ( not ( = ?auto_107307 ?auto_107308 ) ) ( not ( = ?auto_107307 ?auto_107309 ) ) ( not ( = ?auto_107307 ?auto_107310 ) ) ( not ( = ?auto_107308 ?auto_107309 ) ) ( not ( = ?auto_107308 ?auto_107310 ) ) ( not ( = ?auto_107309 ?auto_107310 ) ) ( ON ?auto_107308 ?auto_107309 ) ( ON ?auto_107307 ?auto_107308 ) ( ON ?auto_107306 ?auto_107307 ) ( ON ?auto_107305 ?auto_107306 ) ( CLEAR ?auto_107303 ) ( ON ?auto_107304 ?auto_107305 ) ( CLEAR ?auto_107304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107303 ?auto_107304 )
      ( MAKE-7PILE ?auto_107303 ?auto_107304 ?auto_107305 ?auto_107306 ?auto_107307 ?auto_107308 ?auto_107309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_107333 - BLOCK
      ?auto_107334 - BLOCK
      ?auto_107335 - BLOCK
      ?auto_107336 - BLOCK
      ?auto_107337 - BLOCK
      ?auto_107338 - BLOCK
      ?auto_107339 - BLOCK
    )
    :vars
    (
      ?auto_107340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107339 ?auto_107340 ) ( not ( = ?auto_107333 ?auto_107334 ) ) ( not ( = ?auto_107333 ?auto_107335 ) ) ( not ( = ?auto_107333 ?auto_107336 ) ) ( not ( = ?auto_107333 ?auto_107337 ) ) ( not ( = ?auto_107333 ?auto_107338 ) ) ( not ( = ?auto_107333 ?auto_107339 ) ) ( not ( = ?auto_107333 ?auto_107340 ) ) ( not ( = ?auto_107334 ?auto_107335 ) ) ( not ( = ?auto_107334 ?auto_107336 ) ) ( not ( = ?auto_107334 ?auto_107337 ) ) ( not ( = ?auto_107334 ?auto_107338 ) ) ( not ( = ?auto_107334 ?auto_107339 ) ) ( not ( = ?auto_107334 ?auto_107340 ) ) ( not ( = ?auto_107335 ?auto_107336 ) ) ( not ( = ?auto_107335 ?auto_107337 ) ) ( not ( = ?auto_107335 ?auto_107338 ) ) ( not ( = ?auto_107335 ?auto_107339 ) ) ( not ( = ?auto_107335 ?auto_107340 ) ) ( not ( = ?auto_107336 ?auto_107337 ) ) ( not ( = ?auto_107336 ?auto_107338 ) ) ( not ( = ?auto_107336 ?auto_107339 ) ) ( not ( = ?auto_107336 ?auto_107340 ) ) ( not ( = ?auto_107337 ?auto_107338 ) ) ( not ( = ?auto_107337 ?auto_107339 ) ) ( not ( = ?auto_107337 ?auto_107340 ) ) ( not ( = ?auto_107338 ?auto_107339 ) ) ( not ( = ?auto_107338 ?auto_107340 ) ) ( not ( = ?auto_107339 ?auto_107340 ) ) ( ON ?auto_107338 ?auto_107339 ) ( ON ?auto_107337 ?auto_107338 ) ( ON ?auto_107336 ?auto_107337 ) ( ON ?auto_107335 ?auto_107336 ) ( ON ?auto_107334 ?auto_107335 ) ( ON ?auto_107333 ?auto_107334 ) ( CLEAR ?auto_107333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107333 )
      ( MAKE-7PILE ?auto_107333 ?auto_107334 ?auto_107335 ?auto_107336 ?auto_107337 ?auto_107338 ?auto_107339 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107364 - BLOCK
      ?auto_107365 - BLOCK
      ?auto_107366 - BLOCK
      ?auto_107367 - BLOCK
      ?auto_107368 - BLOCK
      ?auto_107369 - BLOCK
      ?auto_107370 - BLOCK
      ?auto_107371 - BLOCK
    )
    :vars
    (
      ?auto_107372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107370 ) ( ON ?auto_107371 ?auto_107372 ) ( CLEAR ?auto_107371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107364 ) ( ON ?auto_107365 ?auto_107364 ) ( ON ?auto_107366 ?auto_107365 ) ( ON ?auto_107367 ?auto_107366 ) ( ON ?auto_107368 ?auto_107367 ) ( ON ?auto_107369 ?auto_107368 ) ( ON ?auto_107370 ?auto_107369 ) ( not ( = ?auto_107364 ?auto_107365 ) ) ( not ( = ?auto_107364 ?auto_107366 ) ) ( not ( = ?auto_107364 ?auto_107367 ) ) ( not ( = ?auto_107364 ?auto_107368 ) ) ( not ( = ?auto_107364 ?auto_107369 ) ) ( not ( = ?auto_107364 ?auto_107370 ) ) ( not ( = ?auto_107364 ?auto_107371 ) ) ( not ( = ?auto_107364 ?auto_107372 ) ) ( not ( = ?auto_107365 ?auto_107366 ) ) ( not ( = ?auto_107365 ?auto_107367 ) ) ( not ( = ?auto_107365 ?auto_107368 ) ) ( not ( = ?auto_107365 ?auto_107369 ) ) ( not ( = ?auto_107365 ?auto_107370 ) ) ( not ( = ?auto_107365 ?auto_107371 ) ) ( not ( = ?auto_107365 ?auto_107372 ) ) ( not ( = ?auto_107366 ?auto_107367 ) ) ( not ( = ?auto_107366 ?auto_107368 ) ) ( not ( = ?auto_107366 ?auto_107369 ) ) ( not ( = ?auto_107366 ?auto_107370 ) ) ( not ( = ?auto_107366 ?auto_107371 ) ) ( not ( = ?auto_107366 ?auto_107372 ) ) ( not ( = ?auto_107367 ?auto_107368 ) ) ( not ( = ?auto_107367 ?auto_107369 ) ) ( not ( = ?auto_107367 ?auto_107370 ) ) ( not ( = ?auto_107367 ?auto_107371 ) ) ( not ( = ?auto_107367 ?auto_107372 ) ) ( not ( = ?auto_107368 ?auto_107369 ) ) ( not ( = ?auto_107368 ?auto_107370 ) ) ( not ( = ?auto_107368 ?auto_107371 ) ) ( not ( = ?auto_107368 ?auto_107372 ) ) ( not ( = ?auto_107369 ?auto_107370 ) ) ( not ( = ?auto_107369 ?auto_107371 ) ) ( not ( = ?auto_107369 ?auto_107372 ) ) ( not ( = ?auto_107370 ?auto_107371 ) ) ( not ( = ?auto_107370 ?auto_107372 ) ) ( not ( = ?auto_107371 ?auto_107372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107371 ?auto_107372 )
      ( !STACK ?auto_107371 ?auto_107370 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107398 - BLOCK
      ?auto_107399 - BLOCK
      ?auto_107400 - BLOCK
      ?auto_107401 - BLOCK
      ?auto_107402 - BLOCK
      ?auto_107403 - BLOCK
      ?auto_107404 - BLOCK
      ?auto_107405 - BLOCK
    )
    :vars
    (
      ?auto_107406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107405 ?auto_107406 ) ( ON-TABLE ?auto_107398 ) ( ON ?auto_107399 ?auto_107398 ) ( ON ?auto_107400 ?auto_107399 ) ( ON ?auto_107401 ?auto_107400 ) ( ON ?auto_107402 ?auto_107401 ) ( ON ?auto_107403 ?auto_107402 ) ( not ( = ?auto_107398 ?auto_107399 ) ) ( not ( = ?auto_107398 ?auto_107400 ) ) ( not ( = ?auto_107398 ?auto_107401 ) ) ( not ( = ?auto_107398 ?auto_107402 ) ) ( not ( = ?auto_107398 ?auto_107403 ) ) ( not ( = ?auto_107398 ?auto_107404 ) ) ( not ( = ?auto_107398 ?auto_107405 ) ) ( not ( = ?auto_107398 ?auto_107406 ) ) ( not ( = ?auto_107399 ?auto_107400 ) ) ( not ( = ?auto_107399 ?auto_107401 ) ) ( not ( = ?auto_107399 ?auto_107402 ) ) ( not ( = ?auto_107399 ?auto_107403 ) ) ( not ( = ?auto_107399 ?auto_107404 ) ) ( not ( = ?auto_107399 ?auto_107405 ) ) ( not ( = ?auto_107399 ?auto_107406 ) ) ( not ( = ?auto_107400 ?auto_107401 ) ) ( not ( = ?auto_107400 ?auto_107402 ) ) ( not ( = ?auto_107400 ?auto_107403 ) ) ( not ( = ?auto_107400 ?auto_107404 ) ) ( not ( = ?auto_107400 ?auto_107405 ) ) ( not ( = ?auto_107400 ?auto_107406 ) ) ( not ( = ?auto_107401 ?auto_107402 ) ) ( not ( = ?auto_107401 ?auto_107403 ) ) ( not ( = ?auto_107401 ?auto_107404 ) ) ( not ( = ?auto_107401 ?auto_107405 ) ) ( not ( = ?auto_107401 ?auto_107406 ) ) ( not ( = ?auto_107402 ?auto_107403 ) ) ( not ( = ?auto_107402 ?auto_107404 ) ) ( not ( = ?auto_107402 ?auto_107405 ) ) ( not ( = ?auto_107402 ?auto_107406 ) ) ( not ( = ?auto_107403 ?auto_107404 ) ) ( not ( = ?auto_107403 ?auto_107405 ) ) ( not ( = ?auto_107403 ?auto_107406 ) ) ( not ( = ?auto_107404 ?auto_107405 ) ) ( not ( = ?auto_107404 ?auto_107406 ) ) ( not ( = ?auto_107405 ?auto_107406 ) ) ( CLEAR ?auto_107403 ) ( ON ?auto_107404 ?auto_107405 ) ( CLEAR ?auto_107404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107398 ?auto_107399 ?auto_107400 ?auto_107401 ?auto_107402 ?auto_107403 ?auto_107404 )
      ( MAKE-8PILE ?auto_107398 ?auto_107399 ?auto_107400 ?auto_107401 ?auto_107402 ?auto_107403 ?auto_107404 ?auto_107405 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107432 - BLOCK
      ?auto_107433 - BLOCK
      ?auto_107434 - BLOCK
      ?auto_107435 - BLOCK
      ?auto_107436 - BLOCK
      ?auto_107437 - BLOCK
      ?auto_107438 - BLOCK
      ?auto_107439 - BLOCK
    )
    :vars
    (
      ?auto_107440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107439 ?auto_107440 ) ( ON-TABLE ?auto_107432 ) ( ON ?auto_107433 ?auto_107432 ) ( ON ?auto_107434 ?auto_107433 ) ( ON ?auto_107435 ?auto_107434 ) ( ON ?auto_107436 ?auto_107435 ) ( not ( = ?auto_107432 ?auto_107433 ) ) ( not ( = ?auto_107432 ?auto_107434 ) ) ( not ( = ?auto_107432 ?auto_107435 ) ) ( not ( = ?auto_107432 ?auto_107436 ) ) ( not ( = ?auto_107432 ?auto_107437 ) ) ( not ( = ?auto_107432 ?auto_107438 ) ) ( not ( = ?auto_107432 ?auto_107439 ) ) ( not ( = ?auto_107432 ?auto_107440 ) ) ( not ( = ?auto_107433 ?auto_107434 ) ) ( not ( = ?auto_107433 ?auto_107435 ) ) ( not ( = ?auto_107433 ?auto_107436 ) ) ( not ( = ?auto_107433 ?auto_107437 ) ) ( not ( = ?auto_107433 ?auto_107438 ) ) ( not ( = ?auto_107433 ?auto_107439 ) ) ( not ( = ?auto_107433 ?auto_107440 ) ) ( not ( = ?auto_107434 ?auto_107435 ) ) ( not ( = ?auto_107434 ?auto_107436 ) ) ( not ( = ?auto_107434 ?auto_107437 ) ) ( not ( = ?auto_107434 ?auto_107438 ) ) ( not ( = ?auto_107434 ?auto_107439 ) ) ( not ( = ?auto_107434 ?auto_107440 ) ) ( not ( = ?auto_107435 ?auto_107436 ) ) ( not ( = ?auto_107435 ?auto_107437 ) ) ( not ( = ?auto_107435 ?auto_107438 ) ) ( not ( = ?auto_107435 ?auto_107439 ) ) ( not ( = ?auto_107435 ?auto_107440 ) ) ( not ( = ?auto_107436 ?auto_107437 ) ) ( not ( = ?auto_107436 ?auto_107438 ) ) ( not ( = ?auto_107436 ?auto_107439 ) ) ( not ( = ?auto_107436 ?auto_107440 ) ) ( not ( = ?auto_107437 ?auto_107438 ) ) ( not ( = ?auto_107437 ?auto_107439 ) ) ( not ( = ?auto_107437 ?auto_107440 ) ) ( not ( = ?auto_107438 ?auto_107439 ) ) ( not ( = ?auto_107438 ?auto_107440 ) ) ( not ( = ?auto_107439 ?auto_107440 ) ) ( ON ?auto_107438 ?auto_107439 ) ( CLEAR ?auto_107436 ) ( ON ?auto_107437 ?auto_107438 ) ( CLEAR ?auto_107437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107432 ?auto_107433 ?auto_107434 ?auto_107435 ?auto_107436 ?auto_107437 )
      ( MAKE-8PILE ?auto_107432 ?auto_107433 ?auto_107434 ?auto_107435 ?auto_107436 ?auto_107437 ?auto_107438 ?auto_107439 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107466 - BLOCK
      ?auto_107467 - BLOCK
      ?auto_107468 - BLOCK
      ?auto_107469 - BLOCK
      ?auto_107470 - BLOCK
      ?auto_107471 - BLOCK
      ?auto_107472 - BLOCK
      ?auto_107473 - BLOCK
    )
    :vars
    (
      ?auto_107474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107473 ?auto_107474 ) ( ON-TABLE ?auto_107466 ) ( ON ?auto_107467 ?auto_107466 ) ( ON ?auto_107468 ?auto_107467 ) ( ON ?auto_107469 ?auto_107468 ) ( not ( = ?auto_107466 ?auto_107467 ) ) ( not ( = ?auto_107466 ?auto_107468 ) ) ( not ( = ?auto_107466 ?auto_107469 ) ) ( not ( = ?auto_107466 ?auto_107470 ) ) ( not ( = ?auto_107466 ?auto_107471 ) ) ( not ( = ?auto_107466 ?auto_107472 ) ) ( not ( = ?auto_107466 ?auto_107473 ) ) ( not ( = ?auto_107466 ?auto_107474 ) ) ( not ( = ?auto_107467 ?auto_107468 ) ) ( not ( = ?auto_107467 ?auto_107469 ) ) ( not ( = ?auto_107467 ?auto_107470 ) ) ( not ( = ?auto_107467 ?auto_107471 ) ) ( not ( = ?auto_107467 ?auto_107472 ) ) ( not ( = ?auto_107467 ?auto_107473 ) ) ( not ( = ?auto_107467 ?auto_107474 ) ) ( not ( = ?auto_107468 ?auto_107469 ) ) ( not ( = ?auto_107468 ?auto_107470 ) ) ( not ( = ?auto_107468 ?auto_107471 ) ) ( not ( = ?auto_107468 ?auto_107472 ) ) ( not ( = ?auto_107468 ?auto_107473 ) ) ( not ( = ?auto_107468 ?auto_107474 ) ) ( not ( = ?auto_107469 ?auto_107470 ) ) ( not ( = ?auto_107469 ?auto_107471 ) ) ( not ( = ?auto_107469 ?auto_107472 ) ) ( not ( = ?auto_107469 ?auto_107473 ) ) ( not ( = ?auto_107469 ?auto_107474 ) ) ( not ( = ?auto_107470 ?auto_107471 ) ) ( not ( = ?auto_107470 ?auto_107472 ) ) ( not ( = ?auto_107470 ?auto_107473 ) ) ( not ( = ?auto_107470 ?auto_107474 ) ) ( not ( = ?auto_107471 ?auto_107472 ) ) ( not ( = ?auto_107471 ?auto_107473 ) ) ( not ( = ?auto_107471 ?auto_107474 ) ) ( not ( = ?auto_107472 ?auto_107473 ) ) ( not ( = ?auto_107472 ?auto_107474 ) ) ( not ( = ?auto_107473 ?auto_107474 ) ) ( ON ?auto_107472 ?auto_107473 ) ( ON ?auto_107471 ?auto_107472 ) ( CLEAR ?auto_107469 ) ( ON ?auto_107470 ?auto_107471 ) ( CLEAR ?auto_107470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107466 ?auto_107467 ?auto_107468 ?auto_107469 ?auto_107470 )
      ( MAKE-8PILE ?auto_107466 ?auto_107467 ?auto_107468 ?auto_107469 ?auto_107470 ?auto_107471 ?auto_107472 ?auto_107473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107500 - BLOCK
      ?auto_107501 - BLOCK
      ?auto_107502 - BLOCK
      ?auto_107503 - BLOCK
      ?auto_107504 - BLOCK
      ?auto_107505 - BLOCK
      ?auto_107506 - BLOCK
      ?auto_107507 - BLOCK
    )
    :vars
    (
      ?auto_107508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107507 ?auto_107508 ) ( ON-TABLE ?auto_107500 ) ( ON ?auto_107501 ?auto_107500 ) ( ON ?auto_107502 ?auto_107501 ) ( not ( = ?auto_107500 ?auto_107501 ) ) ( not ( = ?auto_107500 ?auto_107502 ) ) ( not ( = ?auto_107500 ?auto_107503 ) ) ( not ( = ?auto_107500 ?auto_107504 ) ) ( not ( = ?auto_107500 ?auto_107505 ) ) ( not ( = ?auto_107500 ?auto_107506 ) ) ( not ( = ?auto_107500 ?auto_107507 ) ) ( not ( = ?auto_107500 ?auto_107508 ) ) ( not ( = ?auto_107501 ?auto_107502 ) ) ( not ( = ?auto_107501 ?auto_107503 ) ) ( not ( = ?auto_107501 ?auto_107504 ) ) ( not ( = ?auto_107501 ?auto_107505 ) ) ( not ( = ?auto_107501 ?auto_107506 ) ) ( not ( = ?auto_107501 ?auto_107507 ) ) ( not ( = ?auto_107501 ?auto_107508 ) ) ( not ( = ?auto_107502 ?auto_107503 ) ) ( not ( = ?auto_107502 ?auto_107504 ) ) ( not ( = ?auto_107502 ?auto_107505 ) ) ( not ( = ?auto_107502 ?auto_107506 ) ) ( not ( = ?auto_107502 ?auto_107507 ) ) ( not ( = ?auto_107502 ?auto_107508 ) ) ( not ( = ?auto_107503 ?auto_107504 ) ) ( not ( = ?auto_107503 ?auto_107505 ) ) ( not ( = ?auto_107503 ?auto_107506 ) ) ( not ( = ?auto_107503 ?auto_107507 ) ) ( not ( = ?auto_107503 ?auto_107508 ) ) ( not ( = ?auto_107504 ?auto_107505 ) ) ( not ( = ?auto_107504 ?auto_107506 ) ) ( not ( = ?auto_107504 ?auto_107507 ) ) ( not ( = ?auto_107504 ?auto_107508 ) ) ( not ( = ?auto_107505 ?auto_107506 ) ) ( not ( = ?auto_107505 ?auto_107507 ) ) ( not ( = ?auto_107505 ?auto_107508 ) ) ( not ( = ?auto_107506 ?auto_107507 ) ) ( not ( = ?auto_107506 ?auto_107508 ) ) ( not ( = ?auto_107507 ?auto_107508 ) ) ( ON ?auto_107506 ?auto_107507 ) ( ON ?auto_107505 ?auto_107506 ) ( ON ?auto_107504 ?auto_107505 ) ( CLEAR ?auto_107502 ) ( ON ?auto_107503 ?auto_107504 ) ( CLEAR ?auto_107503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107500 ?auto_107501 ?auto_107502 ?auto_107503 )
      ( MAKE-8PILE ?auto_107500 ?auto_107501 ?auto_107502 ?auto_107503 ?auto_107504 ?auto_107505 ?auto_107506 ?auto_107507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107534 - BLOCK
      ?auto_107535 - BLOCK
      ?auto_107536 - BLOCK
      ?auto_107537 - BLOCK
      ?auto_107538 - BLOCK
      ?auto_107539 - BLOCK
      ?auto_107540 - BLOCK
      ?auto_107541 - BLOCK
    )
    :vars
    (
      ?auto_107542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107541 ?auto_107542 ) ( ON-TABLE ?auto_107534 ) ( ON ?auto_107535 ?auto_107534 ) ( not ( = ?auto_107534 ?auto_107535 ) ) ( not ( = ?auto_107534 ?auto_107536 ) ) ( not ( = ?auto_107534 ?auto_107537 ) ) ( not ( = ?auto_107534 ?auto_107538 ) ) ( not ( = ?auto_107534 ?auto_107539 ) ) ( not ( = ?auto_107534 ?auto_107540 ) ) ( not ( = ?auto_107534 ?auto_107541 ) ) ( not ( = ?auto_107534 ?auto_107542 ) ) ( not ( = ?auto_107535 ?auto_107536 ) ) ( not ( = ?auto_107535 ?auto_107537 ) ) ( not ( = ?auto_107535 ?auto_107538 ) ) ( not ( = ?auto_107535 ?auto_107539 ) ) ( not ( = ?auto_107535 ?auto_107540 ) ) ( not ( = ?auto_107535 ?auto_107541 ) ) ( not ( = ?auto_107535 ?auto_107542 ) ) ( not ( = ?auto_107536 ?auto_107537 ) ) ( not ( = ?auto_107536 ?auto_107538 ) ) ( not ( = ?auto_107536 ?auto_107539 ) ) ( not ( = ?auto_107536 ?auto_107540 ) ) ( not ( = ?auto_107536 ?auto_107541 ) ) ( not ( = ?auto_107536 ?auto_107542 ) ) ( not ( = ?auto_107537 ?auto_107538 ) ) ( not ( = ?auto_107537 ?auto_107539 ) ) ( not ( = ?auto_107537 ?auto_107540 ) ) ( not ( = ?auto_107537 ?auto_107541 ) ) ( not ( = ?auto_107537 ?auto_107542 ) ) ( not ( = ?auto_107538 ?auto_107539 ) ) ( not ( = ?auto_107538 ?auto_107540 ) ) ( not ( = ?auto_107538 ?auto_107541 ) ) ( not ( = ?auto_107538 ?auto_107542 ) ) ( not ( = ?auto_107539 ?auto_107540 ) ) ( not ( = ?auto_107539 ?auto_107541 ) ) ( not ( = ?auto_107539 ?auto_107542 ) ) ( not ( = ?auto_107540 ?auto_107541 ) ) ( not ( = ?auto_107540 ?auto_107542 ) ) ( not ( = ?auto_107541 ?auto_107542 ) ) ( ON ?auto_107540 ?auto_107541 ) ( ON ?auto_107539 ?auto_107540 ) ( ON ?auto_107538 ?auto_107539 ) ( ON ?auto_107537 ?auto_107538 ) ( CLEAR ?auto_107535 ) ( ON ?auto_107536 ?auto_107537 ) ( CLEAR ?auto_107536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107534 ?auto_107535 ?auto_107536 )
      ( MAKE-8PILE ?auto_107534 ?auto_107535 ?auto_107536 ?auto_107537 ?auto_107538 ?auto_107539 ?auto_107540 ?auto_107541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107568 - BLOCK
      ?auto_107569 - BLOCK
      ?auto_107570 - BLOCK
      ?auto_107571 - BLOCK
      ?auto_107572 - BLOCK
      ?auto_107573 - BLOCK
      ?auto_107574 - BLOCK
      ?auto_107575 - BLOCK
    )
    :vars
    (
      ?auto_107576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107575 ?auto_107576 ) ( ON-TABLE ?auto_107568 ) ( not ( = ?auto_107568 ?auto_107569 ) ) ( not ( = ?auto_107568 ?auto_107570 ) ) ( not ( = ?auto_107568 ?auto_107571 ) ) ( not ( = ?auto_107568 ?auto_107572 ) ) ( not ( = ?auto_107568 ?auto_107573 ) ) ( not ( = ?auto_107568 ?auto_107574 ) ) ( not ( = ?auto_107568 ?auto_107575 ) ) ( not ( = ?auto_107568 ?auto_107576 ) ) ( not ( = ?auto_107569 ?auto_107570 ) ) ( not ( = ?auto_107569 ?auto_107571 ) ) ( not ( = ?auto_107569 ?auto_107572 ) ) ( not ( = ?auto_107569 ?auto_107573 ) ) ( not ( = ?auto_107569 ?auto_107574 ) ) ( not ( = ?auto_107569 ?auto_107575 ) ) ( not ( = ?auto_107569 ?auto_107576 ) ) ( not ( = ?auto_107570 ?auto_107571 ) ) ( not ( = ?auto_107570 ?auto_107572 ) ) ( not ( = ?auto_107570 ?auto_107573 ) ) ( not ( = ?auto_107570 ?auto_107574 ) ) ( not ( = ?auto_107570 ?auto_107575 ) ) ( not ( = ?auto_107570 ?auto_107576 ) ) ( not ( = ?auto_107571 ?auto_107572 ) ) ( not ( = ?auto_107571 ?auto_107573 ) ) ( not ( = ?auto_107571 ?auto_107574 ) ) ( not ( = ?auto_107571 ?auto_107575 ) ) ( not ( = ?auto_107571 ?auto_107576 ) ) ( not ( = ?auto_107572 ?auto_107573 ) ) ( not ( = ?auto_107572 ?auto_107574 ) ) ( not ( = ?auto_107572 ?auto_107575 ) ) ( not ( = ?auto_107572 ?auto_107576 ) ) ( not ( = ?auto_107573 ?auto_107574 ) ) ( not ( = ?auto_107573 ?auto_107575 ) ) ( not ( = ?auto_107573 ?auto_107576 ) ) ( not ( = ?auto_107574 ?auto_107575 ) ) ( not ( = ?auto_107574 ?auto_107576 ) ) ( not ( = ?auto_107575 ?auto_107576 ) ) ( ON ?auto_107574 ?auto_107575 ) ( ON ?auto_107573 ?auto_107574 ) ( ON ?auto_107572 ?auto_107573 ) ( ON ?auto_107571 ?auto_107572 ) ( ON ?auto_107570 ?auto_107571 ) ( CLEAR ?auto_107568 ) ( ON ?auto_107569 ?auto_107570 ) ( CLEAR ?auto_107569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107568 ?auto_107569 )
      ( MAKE-8PILE ?auto_107568 ?auto_107569 ?auto_107570 ?auto_107571 ?auto_107572 ?auto_107573 ?auto_107574 ?auto_107575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_107602 - BLOCK
      ?auto_107603 - BLOCK
      ?auto_107604 - BLOCK
      ?auto_107605 - BLOCK
      ?auto_107606 - BLOCK
      ?auto_107607 - BLOCK
      ?auto_107608 - BLOCK
      ?auto_107609 - BLOCK
    )
    :vars
    (
      ?auto_107610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107609 ?auto_107610 ) ( not ( = ?auto_107602 ?auto_107603 ) ) ( not ( = ?auto_107602 ?auto_107604 ) ) ( not ( = ?auto_107602 ?auto_107605 ) ) ( not ( = ?auto_107602 ?auto_107606 ) ) ( not ( = ?auto_107602 ?auto_107607 ) ) ( not ( = ?auto_107602 ?auto_107608 ) ) ( not ( = ?auto_107602 ?auto_107609 ) ) ( not ( = ?auto_107602 ?auto_107610 ) ) ( not ( = ?auto_107603 ?auto_107604 ) ) ( not ( = ?auto_107603 ?auto_107605 ) ) ( not ( = ?auto_107603 ?auto_107606 ) ) ( not ( = ?auto_107603 ?auto_107607 ) ) ( not ( = ?auto_107603 ?auto_107608 ) ) ( not ( = ?auto_107603 ?auto_107609 ) ) ( not ( = ?auto_107603 ?auto_107610 ) ) ( not ( = ?auto_107604 ?auto_107605 ) ) ( not ( = ?auto_107604 ?auto_107606 ) ) ( not ( = ?auto_107604 ?auto_107607 ) ) ( not ( = ?auto_107604 ?auto_107608 ) ) ( not ( = ?auto_107604 ?auto_107609 ) ) ( not ( = ?auto_107604 ?auto_107610 ) ) ( not ( = ?auto_107605 ?auto_107606 ) ) ( not ( = ?auto_107605 ?auto_107607 ) ) ( not ( = ?auto_107605 ?auto_107608 ) ) ( not ( = ?auto_107605 ?auto_107609 ) ) ( not ( = ?auto_107605 ?auto_107610 ) ) ( not ( = ?auto_107606 ?auto_107607 ) ) ( not ( = ?auto_107606 ?auto_107608 ) ) ( not ( = ?auto_107606 ?auto_107609 ) ) ( not ( = ?auto_107606 ?auto_107610 ) ) ( not ( = ?auto_107607 ?auto_107608 ) ) ( not ( = ?auto_107607 ?auto_107609 ) ) ( not ( = ?auto_107607 ?auto_107610 ) ) ( not ( = ?auto_107608 ?auto_107609 ) ) ( not ( = ?auto_107608 ?auto_107610 ) ) ( not ( = ?auto_107609 ?auto_107610 ) ) ( ON ?auto_107608 ?auto_107609 ) ( ON ?auto_107607 ?auto_107608 ) ( ON ?auto_107606 ?auto_107607 ) ( ON ?auto_107605 ?auto_107606 ) ( ON ?auto_107604 ?auto_107605 ) ( ON ?auto_107603 ?auto_107604 ) ( ON ?auto_107602 ?auto_107603 ) ( CLEAR ?auto_107602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107602 )
      ( MAKE-8PILE ?auto_107602 ?auto_107603 ?auto_107604 ?auto_107605 ?auto_107606 ?auto_107607 ?auto_107608 ?auto_107609 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107637 - BLOCK
      ?auto_107638 - BLOCK
      ?auto_107639 - BLOCK
      ?auto_107640 - BLOCK
      ?auto_107641 - BLOCK
      ?auto_107642 - BLOCK
      ?auto_107643 - BLOCK
      ?auto_107644 - BLOCK
      ?auto_107645 - BLOCK
    )
    :vars
    (
      ?auto_107646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107644 ) ( ON ?auto_107645 ?auto_107646 ) ( CLEAR ?auto_107645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107637 ) ( ON ?auto_107638 ?auto_107637 ) ( ON ?auto_107639 ?auto_107638 ) ( ON ?auto_107640 ?auto_107639 ) ( ON ?auto_107641 ?auto_107640 ) ( ON ?auto_107642 ?auto_107641 ) ( ON ?auto_107643 ?auto_107642 ) ( ON ?auto_107644 ?auto_107643 ) ( not ( = ?auto_107637 ?auto_107638 ) ) ( not ( = ?auto_107637 ?auto_107639 ) ) ( not ( = ?auto_107637 ?auto_107640 ) ) ( not ( = ?auto_107637 ?auto_107641 ) ) ( not ( = ?auto_107637 ?auto_107642 ) ) ( not ( = ?auto_107637 ?auto_107643 ) ) ( not ( = ?auto_107637 ?auto_107644 ) ) ( not ( = ?auto_107637 ?auto_107645 ) ) ( not ( = ?auto_107637 ?auto_107646 ) ) ( not ( = ?auto_107638 ?auto_107639 ) ) ( not ( = ?auto_107638 ?auto_107640 ) ) ( not ( = ?auto_107638 ?auto_107641 ) ) ( not ( = ?auto_107638 ?auto_107642 ) ) ( not ( = ?auto_107638 ?auto_107643 ) ) ( not ( = ?auto_107638 ?auto_107644 ) ) ( not ( = ?auto_107638 ?auto_107645 ) ) ( not ( = ?auto_107638 ?auto_107646 ) ) ( not ( = ?auto_107639 ?auto_107640 ) ) ( not ( = ?auto_107639 ?auto_107641 ) ) ( not ( = ?auto_107639 ?auto_107642 ) ) ( not ( = ?auto_107639 ?auto_107643 ) ) ( not ( = ?auto_107639 ?auto_107644 ) ) ( not ( = ?auto_107639 ?auto_107645 ) ) ( not ( = ?auto_107639 ?auto_107646 ) ) ( not ( = ?auto_107640 ?auto_107641 ) ) ( not ( = ?auto_107640 ?auto_107642 ) ) ( not ( = ?auto_107640 ?auto_107643 ) ) ( not ( = ?auto_107640 ?auto_107644 ) ) ( not ( = ?auto_107640 ?auto_107645 ) ) ( not ( = ?auto_107640 ?auto_107646 ) ) ( not ( = ?auto_107641 ?auto_107642 ) ) ( not ( = ?auto_107641 ?auto_107643 ) ) ( not ( = ?auto_107641 ?auto_107644 ) ) ( not ( = ?auto_107641 ?auto_107645 ) ) ( not ( = ?auto_107641 ?auto_107646 ) ) ( not ( = ?auto_107642 ?auto_107643 ) ) ( not ( = ?auto_107642 ?auto_107644 ) ) ( not ( = ?auto_107642 ?auto_107645 ) ) ( not ( = ?auto_107642 ?auto_107646 ) ) ( not ( = ?auto_107643 ?auto_107644 ) ) ( not ( = ?auto_107643 ?auto_107645 ) ) ( not ( = ?auto_107643 ?auto_107646 ) ) ( not ( = ?auto_107644 ?auto_107645 ) ) ( not ( = ?auto_107644 ?auto_107646 ) ) ( not ( = ?auto_107645 ?auto_107646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107645 ?auto_107646 )
      ( !STACK ?auto_107645 ?auto_107644 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107675 - BLOCK
      ?auto_107676 - BLOCK
      ?auto_107677 - BLOCK
      ?auto_107678 - BLOCK
      ?auto_107679 - BLOCK
      ?auto_107680 - BLOCK
      ?auto_107681 - BLOCK
      ?auto_107682 - BLOCK
      ?auto_107683 - BLOCK
    )
    :vars
    (
      ?auto_107684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107683 ?auto_107684 ) ( ON-TABLE ?auto_107675 ) ( ON ?auto_107676 ?auto_107675 ) ( ON ?auto_107677 ?auto_107676 ) ( ON ?auto_107678 ?auto_107677 ) ( ON ?auto_107679 ?auto_107678 ) ( ON ?auto_107680 ?auto_107679 ) ( ON ?auto_107681 ?auto_107680 ) ( not ( = ?auto_107675 ?auto_107676 ) ) ( not ( = ?auto_107675 ?auto_107677 ) ) ( not ( = ?auto_107675 ?auto_107678 ) ) ( not ( = ?auto_107675 ?auto_107679 ) ) ( not ( = ?auto_107675 ?auto_107680 ) ) ( not ( = ?auto_107675 ?auto_107681 ) ) ( not ( = ?auto_107675 ?auto_107682 ) ) ( not ( = ?auto_107675 ?auto_107683 ) ) ( not ( = ?auto_107675 ?auto_107684 ) ) ( not ( = ?auto_107676 ?auto_107677 ) ) ( not ( = ?auto_107676 ?auto_107678 ) ) ( not ( = ?auto_107676 ?auto_107679 ) ) ( not ( = ?auto_107676 ?auto_107680 ) ) ( not ( = ?auto_107676 ?auto_107681 ) ) ( not ( = ?auto_107676 ?auto_107682 ) ) ( not ( = ?auto_107676 ?auto_107683 ) ) ( not ( = ?auto_107676 ?auto_107684 ) ) ( not ( = ?auto_107677 ?auto_107678 ) ) ( not ( = ?auto_107677 ?auto_107679 ) ) ( not ( = ?auto_107677 ?auto_107680 ) ) ( not ( = ?auto_107677 ?auto_107681 ) ) ( not ( = ?auto_107677 ?auto_107682 ) ) ( not ( = ?auto_107677 ?auto_107683 ) ) ( not ( = ?auto_107677 ?auto_107684 ) ) ( not ( = ?auto_107678 ?auto_107679 ) ) ( not ( = ?auto_107678 ?auto_107680 ) ) ( not ( = ?auto_107678 ?auto_107681 ) ) ( not ( = ?auto_107678 ?auto_107682 ) ) ( not ( = ?auto_107678 ?auto_107683 ) ) ( not ( = ?auto_107678 ?auto_107684 ) ) ( not ( = ?auto_107679 ?auto_107680 ) ) ( not ( = ?auto_107679 ?auto_107681 ) ) ( not ( = ?auto_107679 ?auto_107682 ) ) ( not ( = ?auto_107679 ?auto_107683 ) ) ( not ( = ?auto_107679 ?auto_107684 ) ) ( not ( = ?auto_107680 ?auto_107681 ) ) ( not ( = ?auto_107680 ?auto_107682 ) ) ( not ( = ?auto_107680 ?auto_107683 ) ) ( not ( = ?auto_107680 ?auto_107684 ) ) ( not ( = ?auto_107681 ?auto_107682 ) ) ( not ( = ?auto_107681 ?auto_107683 ) ) ( not ( = ?auto_107681 ?auto_107684 ) ) ( not ( = ?auto_107682 ?auto_107683 ) ) ( not ( = ?auto_107682 ?auto_107684 ) ) ( not ( = ?auto_107683 ?auto_107684 ) ) ( CLEAR ?auto_107681 ) ( ON ?auto_107682 ?auto_107683 ) ( CLEAR ?auto_107682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_107675 ?auto_107676 ?auto_107677 ?auto_107678 ?auto_107679 ?auto_107680 ?auto_107681 ?auto_107682 )
      ( MAKE-9PILE ?auto_107675 ?auto_107676 ?auto_107677 ?auto_107678 ?auto_107679 ?auto_107680 ?auto_107681 ?auto_107682 ?auto_107683 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107713 - BLOCK
      ?auto_107714 - BLOCK
      ?auto_107715 - BLOCK
      ?auto_107716 - BLOCK
      ?auto_107717 - BLOCK
      ?auto_107718 - BLOCK
      ?auto_107719 - BLOCK
      ?auto_107720 - BLOCK
      ?auto_107721 - BLOCK
    )
    :vars
    (
      ?auto_107722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107721 ?auto_107722 ) ( ON-TABLE ?auto_107713 ) ( ON ?auto_107714 ?auto_107713 ) ( ON ?auto_107715 ?auto_107714 ) ( ON ?auto_107716 ?auto_107715 ) ( ON ?auto_107717 ?auto_107716 ) ( ON ?auto_107718 ?auto_107717 ) ( not ( = ?auto_107713 ?auto_107714 ) ) ( not ( = ?auto_107713 ?auto_107715 ) ) ( not ( = ?auto_107713 ?auto_107716 ) ) ( not ( = ?auto_107713 ?auto_107717 ) ) ( not ( = ?auto_107713 ?auto_107718 ) ) ( not ( = ?auto_107713 ?auto_107719 ) ) ( not ( = ?auto_107713 ?auto_107720 ) ) ( not ( = ?auto_107713 ?auto_107721 ) ) ( not ( = ?auto_107713 ?auto_107722 ) ) ( not ( = ?auto_107714 ?auto_107715 ) ) ( not ( = ?auto_107714 ?auto_107716 ) ) ( not ( = ?auto_107714 ?auto_107717 ) ) ( not ( = ?auto_107714 ?auto_107718 ) ) ( not ( = ?auto_107714 ?auto_107719 ) ) ( not ( = ?auto_107714 ?auto_107720 ) ) ( not ( = ?auto_107714 ?auto_107721 ) ) ( not ( = ?auto_107714 ?auto_107722 ) ) ( not ( = ?auto_107715 ?auto_107716 ) ) ( not ( = ?auto_107715 ?auto_107717 ) ) ( not ( = ?auto_107715 ?auto_107718 ) ) ( not ( = ?auto_107715 ?auto_107719 ) ) ( not ( = ?auto_107715 ?auto_107720 ) ) ( not ( = ?auto_107715 ?auto_107721 ) ) ( not ( = ?auto_107715 ?auto_107722 ) ) ( not ( = ?auto_107716 ?auto_107717 ) ) ( not ( = ?auto_107716 ?auto_107718 ) ) ( not ( = ?auto_107716 ?auto_107719 ) ) ( not ( = ?auto_107716 ?auto_107720 ) ) ( not ( = ?auto_107716 ?auto_107721 ) ) ( not ( = ?auto_107716 ?auto_107722 ) ) ( not ( = ?auto_107717 ?auto_107718 ) ) ( not ( = ?auto_107717 ?auto_107719 ) ) ( not ( = ?auto_107717 ?auto_107720 ) ) ( not ( = ?auto_107717 ?auto_107721 ) ) ( not ( = ?auto_107717 ?auto_107722 ) ) ( not ( = ?auto_107718 ?auto_107719 ) ) ( not ( = ?auto_107718 ?auto_107720 ) ) ( not ( = ?auto_107718 ?auto_107721 ) ) ( not ( = ?auto_107718 ?auto_107722 ) ) ( not ( = ?auto_107719 ?auto_107720 ) ) ( not ( = ?auto_107719 ?auto_107721 ) ) ( not ( = ?auto_107719 ?auto_107722 ) ) ( not ( = ?auto_107720 ?auto_107721 ) ) ( not ( = ?auto_107720 ?auto_107722 ) ) ( not ( = ?auto_107721 ?auto_107722 ) ) ( ON ?auto_107720 ?auto_107721 ) ( CLEAR ?auto_107718 ) ( ON ?auto_107719 ?auto_107720 ) ( CLEAR ?auto_107719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_107713 ?auto_107714 ?auto_107715 ?auto_107716 ?auto_107717 ?auto_107718 ?auto_107719 )
      ( MAKE-9PILE ?auto_107713 ?auto_107714 ?auto_107715 ?auto_107716 ?auto_107717 ?auto_107718 ?auto_107719 ?auto_107720 ?auto_107721 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107751 - BLOCK
      ?auto_107752 - BLOCK
      ?auto_107753 - BLOCK
      ?auto_107754 - BLOCK
      ?auto_107755 - BLOCK
      ?auto_107756 - BLOCK
      ?auto_107757 - BLOCK
      ?auto_107758 - BLOCK
      ?auto_107759 - BLOCK
    )
    :vars
    (
      ?auto_107760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107759 ?auto_107760 ) ( ON-TABLE ?auto_107751 ) ( ON ?auto_107752 ?auto_107751 ) ( ON ?auto_107753 ?auto_107752 ) ( ON ?auto_107754 ?auto_107753 ) ( ON ?auto_107755 ?auto_107754 ) ( not ( = ?auto_107751 ?auto_107752 ) ) ( not ( = ?auto_107751 ?auto_107753 ) ) ( not ( = ?auto_107751 ?auto_107754 ) ) ( not ( = ?auto_107751 ?auto_107755 ) ) ( not ( = ?auto_107751 ?auto_107756 ) ) ( not ( = ?auto_107751 ?auto_107757 ) ) ( not ( = ?auto_107751 ?auto_107758 ) ) ( not ( = ?auto_107751 ?auto_107759 ) ) ( not ( = ?auto_107751 ?auto_107760 ) ) ( not ( = ?auto_107752 ?auto_107753 ) ) ( not ( = ?auto_107752 ?auto_107754 ) ) ( not ( = ?auto_107752 ?auto_107755 ) ) ( not ( = ?auto_107752 ?auto_107756 ) ) ( not ( = ?auto_107752 ?auto_107757 ) ) ( not ( = ?auto_107752 ?auto_107758 ) ) ( not ( = ?auto_107752 ?auto_107759 ) ) ( not ( = ?auto_107752 ?auto_107760 ) ) ( not ( = ?auto_107753 ?auto_107754 ) ) ( not ( = ?auto_107753 ?auto_107755 ) ) ( not ( = ?auto_107753 ?auto_107756 ) ) ( not ( = ?auto_107753 ?auto_107757 ) ) ( not ( = ?auto_107753 ?auto_107758 ) ) ( not ( = ?auto_107753 ?auto_107759 ) ) ( not ( = ?auto_107753 ?auto_107760 ) ) ( not ( = ?auto_107754 ?auto_107755 ) ) ( not ( = ?auto_107754 ?auto_107756 ) ) ( not ( = ?auto_107754 ?auto_107757 ) ) ( not ( = ?auto_107754 ?auto_107758 ) ) ( not ( = ?auto_107754 ?auto_107759 ) ) ( not ( = ?auto_107754 ?auto_107760 ) ) ( not ( = ?auto_107755 ?auto_107756 ) ) ( not ( = ?auto_107755 ?auto_107757 ) ) ( not ( = ?auto_107755 ?auto_107758 ) ) ( not ( = ?auto_107755 ?auto_107759 ) ) ( not ( = ?auto_107755 ?auto_107760 ) ) ( not ( = ?auto_107756 ?auto_107757 ) ) ( not ( = ?auto_107756 ?auto_107758 ) ) ( not ( = ?auto_107756 ?auto_107759 ) ) ( not ( = ?auto_107756 ?auto_107760 ) ) ( not ( = ?auto_107757 ?auto_107758 ) ) ( not ( = ?auto_107757 ?auto_107759 ) ) ( not ( = ?auto_107757 ?auto_107760 ) ) ( not ( = ?auto_107758 ?auto_107759 ) ) ( not ( = ?auto_107758 ?auto_107760 ) ) ( not ( = ?auto_107759 ?auto_107760 ) ) ( ON ?auto_107758 ?auto_107759 ) ( ON ?auto_107757 ?auto_107758 ) ( CLEAR ?auto_107755 ) ( ON ?auto_107756 ?auto_107757 ) ( CLEAR ?auto_107756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_107751 ?auto_107752 ?auto_107753 ?auto_107754 ?auto_107755 ?auto_107756 )
      ( MAKE-9PILE ?auto_107751 ?auto_107752 ?auto_107753 ?auto_107754 ?auto_107755 ?auto_107756 ?auto_107757 ?auto_107758 ?auto_107759 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107789 - BLOCK
      ?auto_107790 - BLOCK
      ?auto_107791 - BLOCK
      ?auto_107792 - BLOCK
      ?auto_107793 - BLOCK
      ?auto_107794 - BLOCK
      ?auto_107795 - BLOCK
      ?auto_107796 - BLOCK
      ?auto_107797 - BLOCK
    )
    :vars
    (
      ?auto_107798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107797 ?auto_107798 ) ( ON-TABLE ?auto_107789 ) ( ON ?auto_107790 ?auto_107789 ) ( ON ?auto_107791 ?auto_107790 ) ( ON ?auto_107792 ?auto_107791 ) ( not ( = ?auto_107789 ?auto_107790 ) ) ( not ( = ?auto_107789 ?auto_107791 ) ) ( not ( = ?auto_107789 ?auto_107792 ) ) ( not ( = ?auto_107789 ?auto_107793 ) ) ( not ( = ?auto_107789 ?auto_107794 ) ) ( not ( = ?auto_107789 ?auto_107795 ) ) ( not ( = ?auto_107789 ?auto_107796 ) ) ( not ( = ?auto_107789 ?auto_107797 ) ) ( not ( = ?auto_107789 ?auto_107798 ) ) ( not ( = ?auto_107790 ?auto_107791 ) ) ( not ( = ?auto_107790 ?auto_107792 ) ) ( not ( = ?auto_107790 ?auto_107793 ) ) ( not ( = ?auto_107790 ?auto_107794 ) ) ( not ( = ?auto_107790 ?auto_107795 ) ) ( not ( = ?auto_107790 ?auto_107796 ) ) ( not ( = ?auto_107790 ?auto_107797 ) ) ( not ( = ?auto_107790 ?auto_107798 ) ) ( not ( = ?auto_107791 ?auto_107792 ) ) ( not ( = ?auto_107791 ?auto_107793 ) ) ( not ( = ?auto_107791 ?auto_107794 ) ) ( not ( = ?auto_107791 ?auto_107795 ) ) ( not ( = ?auto_107791 ?auto_107796 ) ) ( not ( = ?auto_107791 ?auto_107797 ) ) ( not ( = ?auto_107791 ?auto_107798 ) ) ( not ( = ?auto_107792 ?auto_107793 ) ) ( not ( = ?auto_107792 ?auto_107794 ) ) ( not ( = ?auto_107792 ?auto_107795 ) ) ( not ( = ?auto_107792 ?auto_107796 ) ) ( not ( = ?auto_107792 ?auto_107797 ) ) ( not ( = ?auto_107792 ?auto_107798 ) ) ( not ( = ?auto_107793 ?auto_107794 ) ) ( not ( = ?auto_107793 ?auto_107795 ) ) ( not ( = ?auto_107793 ?auto_107796 ) ) ( not ( = ?auto_107793 ?auto_107797 ) ) ( not ( = ?auto_107793 ?auto_107798 ) ) ( not ( = ?auto_107794 ?auto_107795 ) ) ( not ( = ?auto_107794 ?auto_107796 ) ) ( not ( = ?auto_107794 ?auto_107797 ) ) ( not ( = ?auto_107794 ?auto_107798 ) ) ( not ( = ?auto_107795 ?auto_107796 ) ) ( not ( = ?auto_107795 ?auto_107797 ) ) ( not ( = ?auto_107795 ?auto_107798 ) ) ( not ( = ?auto_107796 ?auto_107797 ) ) ( not ( = ?auto_107796 ?auto_107798 ) ) ( not ( = ?auto_107797 ?auto_107798 ) ) ( ON ?auto_107796 ?auto_107797 ) ( ON ?auto_107795 ?auto_107796 ) ( ON ?auto_107794 ?auto_107795 ) ( CLEAR ?auto_107792 ) ( ON ?auto_107793 ?auto_107794 ) ( CLEAR ?auto_107793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_107789 ?auto_107790 ?auto_107791 ?auto_107792 ?auto_107793 )
      ( MAKE-9PILE ?auto_107789 ?auto_107790 ?auto_107791 ?auto_107792 ?auto_107793 ?auto_107794 ?auto_107795 ?auto_107796 ?auto_107797 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107827 - BLOCK
      ?auto_107828 - BLOCK
      ?auto_107829 - BLOCK
      ?auto_107830 - BLOCK
      ?auto_107831 - BLOCK
      ?auto_107832 - BLOCK
      ?auto_107833 - BLOCK
      ?auto_107834 - BLOCK
      ?auto_107835 - BLOCK
    )
    :vars
    (
      ?auto_107836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107835 ?auto_107836 ) ( ON-TABLE ?auto_107827 ) ( ON ?auto_107828 ?auto_107827 ) ( ON ?auto_107829 ?auto_107828 ) ( not ( = ?auto_107827 ?auto_107828 ) ) ( not ( = ?auto_107827 ?auto_107829 ) ) ( not ( = ?auto_107827 ?auto_107830 ) ) ( not ( = ?auto_107827 ?auto_107831 ) ) ( not ( = ?auto_107827 ?auto_107832 ) ) ( not ( = ?auto_107827 ?auto_107833 ) ) ( not ( = ?auto_107827 ?auto_107834 ) ) ( not ( = ?auto_107827 ?auto_107835 ) ) ( not ( = ?auto_107827 ?auto_107836 ) ) ( not ( = ?auto_107828 ?auto_107829 ) ) ( not ( = ?auto_107828 ?auto_107830 ) ) ( not ( = ?auto_107828 ?auto_107831 ) ) ( not ( = ?auto_107828 ?auto_107832 ) ) ( not ( = ?auto_107828 ?auto_107833 ) ) ( not ( = ?auto_107828 ?auto_107834 ) ) ( not ( = ?auto_107828 ?auto_107835 ) ) ( not ( = ?auto_107828 ?auto_107836 ) ) ( not ( = ?auto_107829 ?auto_107830 ) ) ( not ( = ?auto_107829 ?auto_107831 ) ) ( not ( = ?auto_107829 ?auto_107832 ) ) ( not ( = ?auto_107829 ?auto_107833 ) ) ( not ( = ?auto_107829 ?auto_107834 ) ) ( not ( = ?auto_107829 ?auto_107835 ) ) ( not ( = ?auto_107829 ?auto_107836 ) ) ( not ( = ?auto_107830 ?auto_107831 ) ) ( not ( = ?auto_107830 ?auto_107832 ) ) ( not ( = ?auto_107830 ?auto_107833 ) ) ( not ( = ?auto_107830 ?auto_107834 ) ) ( not ( = ?auto_107830 ?auto_107835 ) ) ( not ( = ?auto_107830 ?auto_107836 ) ) ( not ( = ?auto_107831 ?auto_107832 ) ) ( not ( = ?auto_107831 ?auto_107833 ) ) ( not ( = ?auto_107831 ?auto_107834 ) ) ( not ( = ?auto_107831 ?auto_107835 ) ) ( not ( = ?auto_107831 ?auto_107836 ) ) ( not ( = ?auto_107832 ?auto_107833 ) ) ( not ( = ?auto_107832 ?auto_107834 ) ) ( not ( = ?auto_107832 ?auto_107835 ) ) ( not ( = ?auto_107832 ?auto_107836 ) ) ( not ( = ?auto_107833 ?auto_107834 ) ) ( not ( = ?auto_107833 ?auto_107835 ) ) ( not ( = ?auto_107833 ?auto_107836 ) ) ( not ( = ?auto_107834 ?auto_107835 ) ) ( not ( = ?auto_107834 ?auto_107836 ) ) ( not ( = ?auto_107835 ?auto_107836 ) ) ( ON ?auto_107834 ?auto_107835 ) ( ON ?auto_107833 ?auto_107834 ) ( ON ?auto_107832 ?auto_107833 ) ( ON ?auto_107831 ?auto_107832 ) ( CLEAR ?auto_107829 ) ( ON ?auto_107830 ?auto_107831 ) ( CLEAR ?auto_107830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_107827 ?auto_107828 ?auto_107829 ?auto_107830 )
      ( MAKE-9PILE ?auto_107827 ?auto_107828 ?auto_107829 ?auto_107830 ?auto_107831 ?auto_107832 ?auto_107833 ?auto_107834 ?auto_107835 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107865 - BLOCK
      ?auto_107866 - BLOCK
      ?auto_107867 - BLOCK
      ?auto_107868 - BLOCK
      ?auto_107869 - BLOCK
      ?auto_107870 - BLOCK
      ?auto_107871 - BLOCK
      ?auto_107872 - BLOCK
      ?auto_107873 - BLOCK
    )
    :vars
    (
      ?auto_107874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107873 ?auto_107874 ) ( ON-TABLE ?auto_107865 ) ( ON ?auto_107866 ?auto_107865 ) ( not ( = ?auto_107865 ?auto_107866 ) ) ( not ( = ?auto_107865 ?auto_107867 ) ) ( not ( = ?auto_107865 ?auto_107868 ) ) ( not ( = ?auto_107865 ?auto_107869 ) ) ( not ( = ?auto_107865 ?auto_107870 ) ) ( not ( = ?auto_107865 ?auto_107871 ) ) ( not ( = ?auto_107865 ?auto_107872 ) ) ( not ( = ?auto_107865 ?auto_107873 ) ) ( not ( = ?auto_107865 ?auto_107874 ) ) ( not ( = ?auto_107866 ?auto_107867 ) ) ( not ( = ?auto_107866 ?auto_107868 ) ) ( not ( = ?auto_107866 ?auto_107869 ) ) ( not ( = ?auto_107866 ?auto_107870 ) ) ( not ( = ?auto_107866 ?auto_107871 ) ) ( not ( = ?auto_107866 ?auto_107872 ) ) ( not ( = ?auto_107866 ?auto_107873 ) ) ( not ( = ?auto_107866 ?auto_107874 ) ) ( not ( = ?auto_107867 ?auto_107868 ) ) ( not ( = ?auto_107867 ?auto_107869 ) ) ( not ( = ?auto_107867 ?auto_107870 ) ) ( not ( = ?auto_107867 ?auto_107871 ) ) ( not ( = ?auto_107867 ?auto_107872 ) ) ( not ( = ?auto_107867 ?auto_107873 ) ) ( not ( = ?auto_107867 ?auto_107874 ) ) ( not ( = ?auto_107868 ?auto_107869 ) ) ( not ( = ?auto_107868 ?auto_107870 ) ) ( not ( = ?auto_107868 ?auto_107871 ) ) ( not ( = ?auto_107868 ?auto_107872 ) ) ( not ( = ?auto_107868 ?auto_107873 ) ) ( not ( = ?auto_107868 ?auto_107874 ) ) ( not ( = ?auto_107869 ?auto_107870 ) ) ( not ( = ?auto_107869 ?auto_107871 ) ) ( not ( = ?auto_107869 ?auto_107872 ) ) ( not ( = ?auto_107869 ?auto_107873 ) ) ( not ( = ?auto_107869 ?auto_107874 ) ) ( not ( = ?auto_107870 ?auto_107871 ) ) ( not ( = ?auto_107870 ?auto_107872 ) ) ( not ( = ?auto_107870 ?auto_107873 ) ) ( not ( = ?auto_107870 ?auto_107874 ) ) ( not ( = ?auto_107871 ?auto_107872 ) ) ( not ( = ?auto_107871 ?auto_107873 ) ) ( not ( = ?auto_107871 ?auto_107874 ) ) ( not ( = ?auto_107872 ?auto_107873 ) ) ( not ( = ?auto_107872 ?auto_107874 ) ) ( not ( = ?auto_107873 ?auto_107874 ) ) ( ON ?auto_107872 ?auto_107873 ) ( ON ?auto_107871 ?auto_107872 ) ( ON ?auto_107870 ?auto_107871 ) ( ON ?auto_107869 ?auto_107870 ) ( ON ?auto_107868 ?auto_107869 ) ( CLEAR ?auto_107866 ) ( ON ?auto_107867 ?auto_107868 ) ( CLEAR ?auto_107867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_107865 ?auto_107866 ?auto_107867 )
      ( MAKE-9PILE ?auto_107865 ?auto_107866 ?auto_107867 ?auto_107868 ?auto_107869 ?auto_107870 ?auto_107871 ?auto_107872 ?auto_107873 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107903 - BLOCK
      ?auto_107904 - BLOCK
      ?auto_107905 - BLOCK
      ?auto_107906 - BLOCK
      ?auto_107907 - BLOCK
      ?auto_107908 - BLOCK
      ?auto_107909 - BLOCK
      ?auto_107910 - BLOCK
      ?auto_107911 - BLOCK
    )
    :vars
    (
      ?auto_107912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107911 ?auto_107912 ) ( ON-TABLE ?auto_107903 ) ( not ( = ?auto_107903 ?auto_107904 ) ) ( not ( = ?auto_107903 ?auto_107905 ) ) ( not ( = ?auto_107903 ?auto_107906 ) ) ( not ( = ?auto_107903 ?auto_107907 ) ) ( not ( = ?auto_107903 ?auto_107908 ) ) ( not ( = ?auto_107903 ?auto_107909 ) ) ( not ( = ?auto_107903 ?auto_107910 ) ) ( not ( = ?auto_107903 ?auto_107911 ) ) ( not ( = ?auto_107903 ?auto_107912 ) ) ( not ( = ?auto_107904 ?auto_107905 ) ) ( not ( = ?auto_107904 ?auto_107906 ) ) ( not ( = ?auto_107904 ?auto_107907 ) ) ( not ( = ?auto_107904 ?auto_107908 ) ) ( not ( = ?auto_107904 ?auto_107909 ) ) ( not ( = ?auto_107904 ?auto_107910 ) ) ( not ( = ?auto_107904 ?auto_107911 ) ) ( not ( = ?auto_107904 ?auto_107912 ) ) ( not ( = ?auto_107905 ?auto_107906 ) ) ( not ( = ?auto_107905 ?auto_107907 ) ) ( not ( = ?auto_107905 ?auto_107908 ) ) ( not ( = ?auto_107905 ?auto_107909 ) ) ( not ( = ?auto_107905 ?auto_107910 ) ) ( not ( = ?auto_107905 ?auto_107911 ) ) ( not ( = ?auto_107905 ?auto_107912 ) ) ( not ( = ?auto_107906 ?auto_107907 ) ) ( not ( = ?auto_107906 ?auto_107908 ) ) ( not ( = ?auto_107906 ?auto_107909 ) ) ( not ( = ?auto_107906 ?auto_107910 ) ) ( not ( = ?auto_107906 ?auto_107911 ) ) ( not ( = ?auto_107906 ?auto_107912 ) ) ( not ( = ?auto_107907 ?auto_107908 ) ) ( not ( = ?auto_107907 ?auto_107909 ) ) ( not ( = ?auto_107907 ?auto_107910 ) ) ( not ( = ?auto_107907 ?auto_107911 ) ) ( not ( = ?auto_107907 ?auto_107912 ) ) ( not ( = ?auto_107908 ?auto_107909 ) ) ( not ( = ?auto_107908 ?auto_107910 ) ) ( not ( = ?auto_107908 ?auto_107911 ) ) ( not ( = ?auto_107908 ?auto_107912 ) ) ( not ( = ?auto_107909 ?auto_107910 ) ) ( not ( = ?auto_107909 ?auto_107911 ) ) ( not ( = ?auto_107909 ?auto_107912 ) ) ( not ( = ?auto_107910 ?auto_107911 ) ) ( not ( = ?auto_107910 ?auto_107912 ) ) ( not ( = ?auto_107911 ?auto_107912 ) ) ( ON ?auto_107910 ?auto_107911 ) ( ON ?auto_107909 ?auto_107910 ) ( ON ?auto_107908 ?auto_107909 ) ( ON ?auto_107907 ?auto_107908 ) ( ON ?auto_107906 ?auto_107907 ) ( ON ?auto_107905 ?auto_107906 ) ( CLEAR ?auto_107903 ) ( ON ?auto_107904 ?auto_107905 ) ( CLEAR ?auto_107904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_107903 ?auto_107904 )
      ( MAKE-9PILE ?auto_107903 ?auto_107904 ?auto_107905 ?auto_107906 ?auto_107907 ?auto_107908 ?auto_107909 ?auto_107910 ?auto_107911 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_107941 - BLOCK
      ?auto_107942 - BLOCK
      ?auto_107943 - BLOCK
      ?auto_107944 - BLOCK
      ?auto_107945 - BLOCK
      ?auto_107946 - BLOCK
      ?auto_107947 - BLOCK
      ?auto_107948 - BLOCK
      ?auto_107949 - BLOCK
    )
    :vars
    (
      ?auto_107950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_107949 ?auto_107950 ) ( not ( = ?auto_107941 ?auto_107942 ) ) ( not ( = ?auto_107941 ?auto_107943 ) ) ( not ( = ?auto_107941 ?auto_107944 ) ) ( not ( = ?auto_107941 ?auto_107945 ) ) ( not ( = ?auto_107941 ?auto_107946 ) ) ( not ( = ?auto_107941 ?auto_107947 ) ) ( not ( = ?auto_107941 ?auto_107948 ) ) ( not ( = ?auto_107941 ?auto_107949 ) ) ( not ( = ?auto_107941 ?auto_107950 ) ) ( not ( = ?auto_107942 ?auto_107943 ) ) ( not ( = ?auto_107942 ?auto_107944 ) ) ( not ( = ?auto_107942 ?auto_107945 ) ) ( not ( = ?auto_107942 ?auto_107946 ) ) ( not ( = ?auto_107942 ?auto_107947 ) ) ( not ( = ?auto_107942 ?auto_107948 ) ) ( not ( = ?auto_107942 ?auto_107949 ) ) ( not ( = ?auto_107942 ?auto_107950 ) ) ( not ( = ?auto_107943 ?auto_107944 ) ) ( not ( = ?auto_107943 ?auto_107945 ) ) ( not ( = ?auto_107943 ?auto_107946 ) ) ( not ( = ?auto_107943 ?auto_107947 ) ) ( not ( = ?auto_107943 ?auto_107948 ) ) ( not ( = ?auto_107943 ?auto_107949 ) ) ( not ( = ?auto_107943 ?auto_107950 ) ) ( not ( = ?auto_107944 ?auto_107945 ) ) ( not ( = ?auto_107944 ?auto_107946 ) ) ( not ( = ?auto_107944 ?auto_107947 ) ) ( not ( = ?auto_107944 ?auto_107948 ) ) ( not ( = ?auto_107944 ?auto_107949 ) ) ( not ( = ?auto_107944 ?auto_107950 ) ) ( not ( = ?auto_107945 ?auto_107946 ) ) ( not ( = ?auto_107945 ?auto_107947 ) ) ( not ( = ?auto_107945 ?auto_107948 ) ) ( not ( = ?auto_107945 ?auto_107949 ) ) ( not ( = ?auto_107945 ?auto_107950 ) ) ( not ( = ?auto_107946 ?auto_107947 ) ) ( not ( = ?auto_107946 ?auto_107948 ) ) ( not ( = ?auto_107946 ?auto_107949 ) ) ( not ( = ?auto_107946 ?auto_107950 ) ) ( not ( = ?auto_107947 ?auto_107948 ) ) ( not ( = ?auto_107947 ?auto_107949 ) ) ( not ( = ?auto_107947 ?auto_107950 ) ) ( not ( = ?auto_107948 ?auto_107949 ) ) ( not ( = ?auto_107948 ?auto_107950 ) ) ( not ( = ?auto_107949 ?auto_107950 ) ) ( ON ?auto_107948 ?auto_107949 ) ( ON ?auto_107947 ?auto_107948 ) ( ON ?auto_107946 ?auto_107947 ) ( ON ?auto_107945 ?auto_107946 ) ( ON ?auto_107944 ?auto_107945 ) ( ON ?auto_107943 ?auto_107944 ) ( ON ?auto_107942 ?auto_107943 ) ( ON ?auto_107941 ?auto_107942 ) ( CLEAR ?auto_107941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_107941 )
      ( MAKE-9PILE ?auto_107941 ?auto_107942 ?auto_107943 ?auto_107944 ?auto_107945 ?auto_107946 ?auto_107947 ?auto_107948 ?auto_107949 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_107980 - BLOCK
      ?auto_107981 - BLOCK
      ?auto_107982 - BLOCK
      ?auto_107983 - BLOCK
      ?auto_107984 - BLOCK
      ?auto_107985 - BLOCK
      ?auto_107986 - BLOCK
      ?auto_107987 - BLOCK
      ?auto_107988 - BLOCK
      ?auto_107989 - BLOCK
    )
    :vars
    (
      ?auto_107990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_107988 ) ( ON ?auto_107989 ?auto_107990 ) ( CLEAR ?auto_107989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_107980 ) ( ON ?auto_107981 ?auto_107980 ) ( ON ?auto_107982 ?auto_107981 ) ( ON ?auto_107983 ?auto_107982 ) ( ON ?auto_107984 ?auto_107983 ) ( ON ?auto_107985 ?auto_107984 ) ( ON ?auto_107986 ?auto_107985 ) ( ON ?auto_107987 ?auto_107986 ) ( ON ?auto_107988 ?auto_107987 ) ( not ( = ?auto_107980 ?auto_107981 ) ) ( not ( = ?auto_107980 ?auto_107982 ) ) ( not ( = ?auto_107980 ?auto_107983 ) ) ( not ( = ?auto_107980 ?auto_107984 ) ) ( not ( = ?auto_107980 ?auto_107985 ) ) ( not ( = ?auto_107980 ?auto_107986 ) ) ( not ( = ?auto_107980 ?auto_107987 ) ) ( not ( = ?auto_107980 ?auto_107988 ) ) ( not ( = ?auto_107980 ?auto_107989 ) ) ( not ( = ?auto_107980 ?auto_107990 ) ) ( not ( = ?auto_107981 ?auto_107982 ) ) ( not ( = ?auto_107981 ?auto_107983 ) ) ( not ( = ?auto_107981 ?auto_107984 ) ) ( not ( = ?auto_107981 ?auto_107985 ) ) ( not ( = ?auto_107981 ?auto_107986 ) ) ( not ( = ?auto_107981 ?auto_107987 ) ) ( not ( = ?auto_107981 ?auto_107988 ) ) ( not ( = ?auto_107981 ?auto_107989 ) ) ( not ( = ?auto_107981 ?auto_107990 ) ) ( not ( = ?auto_107982 ?auto_107983 ) ) ( not ( = ?auto_107982 ?auto_107984 ) ) ( not ( = ?auto_107982 ?auto_107985 ) ) ( not ( = ?auto_107982 ?auto_107986 ) ) ( not ( = ?auto_107982 ?auto_107987 ) ) ( not ( = ?auto_107982 ?auto_107988 ) ) ( not ( = ?auto_107982 ?auto_107989 ) ) ( not ( = ?auto_107982 ?auto_107990 ) ) ( not ( = ?auto_107983 ?auto_107984 ) ) ( not ( = ?auto_107983 ?auto_107985 ) ) ( not ( = ?auto_107983 ?auto_107986 ) ) ( not ( = ?auto_107983 ?auto_107987 ) ) ( not ( = ?auto_107983 ?auto_107988 ) ) ( not ( = ?auto_107983 ?auto_107989 ) ) ( not ( = ?auto_107983 ?auto_107990 ) ) ( not ( = ?auto_107984 ?auto_107985 ) ) ( not ( = ?auto_107984 ?auto_107986 ) ) ( not ( = ?auto_107984 ?auto_107987 ) ) ( not ( = ?auto_107984 ?auto_107988 ) ) ( not ( = ?auto_107984 ?auto_107989 ) ) ( not ( = ?auto_107984 ?auto_107990 ) ) ( not ( = ?auto_107985 ?auto_107986 ) ) ( not ( = ?auto_107985 ?auto_107987 ) ) ( not ( = ?auto_107985 ?auto_107988 ) ) ( not ( = ?auto_107985 ?auto_107989 ) ) ( not ( = ?auto_107985 ?auto_107990 ) ) ( not ( = ?auto_107986 ?auto_107987 ) ) ( not ( = ?auto_107986 ?auto_107988 ) ) ( not ( = ?auto_107986 ?auto_107989 ) ) ( not ( = ?auto_107986 ?auto_107990 ) ) ( not ( = ?auto_107987 ?auto_107988 ) ) ( not ( = ?auto_107987 ?auto_107989 ) ) ( not ( = ?auto_107987 ?auto_107990 ) ) ( not ( = ?auto_107988 ?auto_107989 ) ) ( not ( = ?auto_107988 ?auto_107990 ) ) ( not ( = ?auto_107989 ?auto_107990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_107989 ?auto_107990 )
      ( !STACK ?auto_107989 ?auto_107988 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108022 - BLOCK
      ?auto_108023 - BLOCK
      ?auto_108024 - BLOCK
      ?auto_108025 - BLOCK
      ?auto_108026 - BLOCK
      ?auto_108027 - BLOCK
      ?auto_108028 - BLOCK
      ?auto_108029 - BLOCK
      ?auto_108030 - BLOCK
      ?auto_108031 - BLOCK
    )
    :vars
    (
      ?auto_108032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108031 ?auto_108032 ) ( ON-TABLE ?auto_108022 ) ( ON ?auto_108023 ?auto_108022 ) ( ON ?auto_108024 ?auto_108023 ) ( ON ?auto_108025 ?auto_108024 ) ( ON ?auto_108026 ?auto_108025 ) ( ON ?auto_108027 ?auto_108026 ) ( ON ?auto_108028 ?auto_108027 ) ( ON ?auto_108029 ?auto_108028 ) ( not ( = ?auto_108022 ?auto_108023 ) ) ( not ( = ?auto_108022 ?auto_108024 ) ) ( not ( = ?auto_108022 ?auto_108025 ) ) ( not ( = ?auto_108022 ?auto_108026 ) ) ( not ( = ?auto_108022 ?auto_108027 ) ) ( not ( = ?auto_108022 ?auto_108028 ) ) ( not ( = ?auto_108022 ?auto_108029 ) ) ( not ( = ?auto_108022 ?auto_108030 ) ) ( not ( = ?auto_108022 ?auto_108031 ) ) ( not ( = ?auto_108022 ?auto_108032 ) ) ( not ( = ?auto_108023 ?auto_108024 ) ) ( not ( = ?auto_108023 ?auto_108025 ) ) ( not ( = ?auto_108023 ?auto_108026 ) ) ( not ( = ?auto_108023 ?auto_108027 ) ) ( not ( = ?auto_108023 ?auto_108028 ) ) ( not ( = ?auto_108023 ?auto_108029 ) ) ( not ( = ?auto_108023 ?auto_108030 ) ) ( not ( = ?auto_108023 ?auto_108031 ) ) ( not ( = ?auto_108023 ?auto_108032 ) ) ( not ( = ?auto_108024 ?auto_108025 ) ) ( not ( = ?auto_108024 ?auto_108026 ) ) ( not ( = ?auto_108024 ?auto_108027 ) ) ( not ( = ?auto_108024 ?auto_108028 ) ) ( not ( = ?auto_108024 ?auto_108029 ) ) ( not ( = ?auto_108024 ?auto_108030 ) ) ( not ( = ?auto_108024 ?auto_108031 ) ) ( not ( = ?auto_108024 ?auto_108032 ) ) ( not ( = ?auto_108025 ?auto_108026 ) ) ( not ( = ?auto_108025 ?auto_108027 ) ) ( not ( = ?auto_108025 ?auto_108028 ) ) ( not ( = ?auto_108025 ?auto_108029 ) ) ( not ( = ?auto_108025 ?auto_108030 ) ) ( not ( = ?auto_108025 ?auto_108031 ) ) ( not ( = ?auto_108025 ?auto_108032 ) ) ( not ( = ?auto_108026 ?auto_108027 ) ) ( not ( = ?auto_108026 ?auto_108028 ) ) ( not ( = ?auto_108026 ?auto_108029 ) ) ( not ( = ?auto_108026 ?auto_108030 ) ) ( not ( = ?auto_108026 ?auto_108031 ) ) ( not ( = ?auto_108026 ?auto_108032 ) ) ( not ( = ?auto_108027 ?auto_108028 ) ) ( not ( = ?auto_108027 ?auto_108029 ) ) ( not ( = ?auto_108027 ?auto_108030 ) ) ( not ( = ?auto_108027 ?auto_108031 ) ) ( not ( = ?auto_108027 ?auto_108032 ) ) ( not ( = ?auto_108028 ?auto_108029 ) ) ( not ( = ?auto_108028 ?auto_108030 ) ) ( not ( = ?auto_108028 ?auto_108031 ) ) ( not ( = ?auto_108028 ?auto_108032 ) ) ( not ( = ?auto_108029 ?auto_108030 ) ) ( not ( = ?auto_108029 ?auto_108031 ) ) ( not ( = ?auto_108029 ?auto_108032 ) ) ( not ( = ?auto_108030 ?auto_108031 ) ) ( not ( = ?auto_108030 ?auto_108032 ) ) ( not ( = ?auto_108031 ?auto_108032 ) ) ( CLEAR ?auto_108029 ) ( ON ?auto_108030 ?auto_108031 ) ( CLEAR ?auto_108030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_108022 ?auto_108023 ?auto_108024 ?auto_108025 ?auto_108026 ?auto_108027 ?auto_108028 ?auto_108029 ?auto_108030 )
      ( MAKE-10PILE ?auto_108022 ?auto_108023 ?auto_108024 ?auto_108025 ?auto_108026 ?auto_108027 ?auto_108028 ?auto_108029 ?auto_108030 ?auto_108031 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108064 - BLOCK
      ?auto_108065 - BLOCK
      ?auto_108066 - BLOCK
      ?auto_108067 - BLOCK
      ?auto_108068 - BLOCK
      ?auto_108069 - BLOCK
      ?auto_108070 - BLOCK
      ?auto_108071 - BLOCK
      ?auto_108072 - BLOCK
      ?auto_108073 - BLOCK
    )
    :vars
    (
      ?auto_108074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108073 ?auto_108074 ) ( ON-TABLE ?auto_108064 ) ( ON ?auto_108065 ?auto_108064 ) ( ON ?auto_108066 ?auto_108065 ) ( ON ?auto_108067 ?auto_108066 ) ( ON ?auto_108068 ?auto_108067 ) ( ON ?auto_108069 ?auto_108068 ) ( ON ?auto_108070 ?auto_108069 ) ( not ( = ?auto_108064 ?auto_108065 ) ) ( not ( = ?auto_108064 ?auto_108066 ) ) ( not ( = ?auto_108064 ?auto_108067 ) ) ( not ( = ?auto_108064 ?auto_108068 ) ) ( not ( = ?auto_108064 ?auto_108069 ) ) ( not ( = ?auto_108064 ?auto_108070 ) ) ( not ( = ?auto_108064 ?auto_108071 ) ) ( not ( = ?auto_108064 ?auto_108072 ) ) ( not ( = ?auto_108064 ?auto_108073 ) ) ( not ( = ?auto_108064 ?auto_108074 ) ) ( not ( = ?auto_108065 ?auto_108066 ) ) ( not ( = ?auto_108065 ?auto_108067 ) ) ( not ( = ?auto_108065 ?auto_108068 ) ) ( not ( = ?auto_108065 ?auto_108069 ) ) ( not ( = ?auto_108065 ?auto_108070 ) ) ( not ( = ?auto_108065 ?auto_108071 ) ) ( not ( = ?auto_108065 ?auto_108072 ) ) ( not ( = ?auto_108065 ?auto_108073 ) ) ( not ( = ?auto_108065 ?auto_108074 ) ) ( not ( = ?auto_108066 ?auto_108067 ) ) ( not ( = ?auto_108066 ?auto_108068 ) ) ( not ( = ?auto_108066 ?auto_108069 ) ) ( not ( = ?auto_108066 ?auto_108070 ) ) ( not ( = ?auto_108066 ?auto_108071 ) ) ( not ( = ?auto_108066 ?auto_108072 ) ) ( not ( = ?auto_108066 ?auto_108073 ) ) ( not ( = ?auto_108066 ?auto_108074 ) ) ( not ( = ?auto_108067 ?auto_108068 ) ) ( not ( = ?auto_108067 ?auto_108069 ) ) ( not ( = ?auto_108067 ?auto_108070 ) ) ( not ( = ?auto_108067 ?auto_108071 ) ) ( not ( = ?auto_108067 ?auto_108072 ) ) ( not ( = ?auto_108067 ?auto_108073 ) ) ( not ( = ?auto_108067 ?auto_108074 ) ) ( not ( = ?auto_108068 ?auto_108069 ) ) ( not ( = ?auto_108068 ?auto_108070 ) ) ( not ( = ?auto_108068 ?auto_108071 ) ) ( not ( = ?auto_108068 ?auto_108072 ) ) ( not ( = ?auto_108068 ?auto_108073 ) ) ( not ( = ?auto_108068 ?auto_108074 ) ) ( not ( = ?auto_108069 ?auto_108070 ) ) ( not ( = ?auto_108069 ?auto_108071 ) ) ( not ( = ?auto_108069 ?auto_108072 ) ) ( not ( = ?auto_108069 ?auto_108073 ) ) ( not ( = ?auto_108069 ?auto_108074 ) ) ( not ( = ?auto_108070 ?auto_108071 ) ) ( not ( = ?auto_108070 ?auto_108072 ) ) ( not ( = ?auto_108070 ?auto_108073 ) ) ( not ( = ?auto_108070 ?auto_108074 ) ) ( not ( = ?auto_108071 ?auto_108072 ) ) ( not ( = ?auto_108071 ?auto_108073 ) ) ( not ( = ?auto_108071 ?auto_108074 ) ) ( not ( = ?auto_108072 ?auto_108073 ) ) ( not ( = ?auto_108072 ?auto_108074 ) ) ( not ( = ?auto_108073 ?auto_108074 ) ) ( ON ?auto_108072 ?auto_108073 ) ( CLEAR ?auto_108070 ) ( ON ?auto_108071 ?auto_108072 ) ( CLEAR ?auto_108071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_108064 ?auto_108065 ?auto_108066 ?auto_108067 ?auto_108068 ?auto_108069 ?auto_108070 ?auto_108071 )
      ( MAKE-10PILE ?auto_108064 ?auto_108065 ?auto_108066 ?auto_108067 ?auto_108068 ?auto_108069 ?auto_108070 ?auto_108071 ?auto_108072 ?auto_108073 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108106 - BLOCK
      ?auto_108107 - BLOCK
      ?auto_108108 - BLOCK
      ?auto_108109 - BLOCK
      ?auto_108110 - BLOCK
      ?auto_108111 - BLOCK
      ?auto_108112 - BLOCK
      ?auto_108113 - BLOCK
      ?auto_108114 - BLOCK
      ?auto_108115 - BLOCK
    )
    :vars
    (
      ?auto_108116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108115 ?auto_108116 ) ( ON-TABLE ?auto_108106 ) ( ON ?auto_108107 ?auto_108106 ) ( ON ?auto_108108 ?auto_108107 ) ( ON ?auto_108109 ?auto_108108 ) ( ON ?auto_108110 ?auto_108109 ) ( ON ?auto_108111 ?auto_108110 ) ( not ( = ?auto_108106 ?auto_108107 ) ) ( not ( = ?auto_108106 ?auto_108108 ) ) ( not ( = ?auto_108106 ?auto_108109 ) ) ( not ( = ?auto_108106 ?auto_108110 ) ) ( not ( = ?auto_108106 ?auto_108111 ) ) ( not ( = ?auto_108106 ?auto_108112 ) ) ( not ( = ?auto_108106 ?auto_108113 ) ) ( not ( = ?auto_108106 ?auto_108114 ) ) ( not ( = ?auto_108106 ?auto_108115 ) ) ( not ( = ?auto_108106 ?auto_108116 ) ) ( not ( = ?auto_108107 ?auto_108108 ) ) ( not ( = ?auto_108107 ?auto_108109 ) ) ( not ( = ?auto_108107 ?auto_108110 ) ) ( not ( = ?auto_108107 ?auto_108111 ) ) ( not ( = ?auto_108107 ?auto_108112 ) ) ( not ( = ?auto_108107 ?auto_108113 ) ) ( not ( = ?auto_108107 ?auto_108114 ) ) ( not ( = ?auto_108107 ?auto_108115 ) ) ( not ( = ?auto_108107 ?auto_108116 ) ) ( not ( = ?auto_108108 ?auto_108109 ) ) ( not ( = ?auto_108108 ?auto_108110 ) ) ( not ( = ?auto_108108 ?auto_108111 ) ) ( not ( = ?auto_108108 ?auto_108112 ) ) ( not ( = ?auto_108108 ?auto_108113 ) ) ( not ( = ?auto_108108 ?auto_108114 ) ) ( not ( = ?auto_108108 ?auto_108115 ) ) ( not ( = ?auto_108108 ?auto_108116 ) ) ( not ( = ?auto_108109 ?auto_108110 ) ) ( not ( = ?auto_108109 ?auto_108111 ) ) ( not ( = ?auto_108109 ?auto_108112 ) ) ( not ( = ?auto_108109 ?auto_108113 ) ) ( not ( = ?auto_108109 ?auto_108114 ) ) ( not ( = ?auto_108109 ?auto_108115 ) ) ( not ( = ?auto_108109 ?auto_108116 ) ) ( not ( = ?auto_108110 ?auto_108111 ) ) ( not ( = ?auto_108110 ?auto_108112 ) ) ( not ( = ?auto_108110 ?auto_108113 ) ) ( not ( = ?auto_108110 ?auto_108114 ) ) ( not ( = ?auto_108110 ?auto_108115 ) ) ( not ( = ?auto_108110 ?auto_108116 ) ) ( not ( = ?auto_108111 ?auto_108112 ) ) ( not ( = ?auto_108111 ?auto_108113 ) ) ( not ( = ?auto_108111 ?auto_108114 ) ) ( not ( = ?auto_108111 ?auto_108115 ) ) ( not ( = ?auto_108111 ?auto_108116 ) ) ( not ( = ?auto_108112 ?auto_108113 ) ) ( not ( = ?auto_108112 ?auto_108114 ) ) ( not ( = ?auto_108112 ?auto_108115 ) ) ( not ( = ?auto_108112 ?auto_108116 ) ) ( not ( = ?auto_108113 ?auto_108114 ) ) ( not ( = ?auto_108113 ?auto_108115 ) ) ( not ( = ?auto_108113 ?auto_108116 ) ) ( not ( = ?auto_108114 ?auto_108115 ) ) ( not ( = ?auto_108114 ?auto_108116 ) ) ( not ( = ?auto_108115 ?auto_108116 ) ) ( ON ?auto_108114 ?auto_108115 ) ( ON ?auto_108113 ?auto_108114 ) ( CLEAR ?auto_108111 ) ( ON ?auto_108112 ?auto_108113 ) ( CLEAR ?auto_108112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108106 ?auto_108107 ?auto_108108 ?auto_108109 ?auto_108110 ?auto_108111 ?auto_108112 )
      ( MAKE-10PILE ?auto_108106 ?auto_108107 ?auto_108108 ?auto_108109 ?auto_108110 ?auto_108111 ?auto_108112 ?auto_108113 ?auto_108114 ?auto_108115 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108148 - BLOCK
      ?auto_108149 - BLOCK
      ?auto_108150 - BLOCK
      ?auto_108151 - BLOCK
      ?auto_108152 - BLOCK
      ?auto_108153 - BLOCK
      ?auto_108154 - BLOCK
      ?auto_108155 - BLOCK
      ?auto_108156 - BLOCK
      ?auto_108157 - BLOCK
    )
    :vars
    (
      ?auto_108158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108157 ?auto_108158 ) ( ON-TABLE ?auto_108148 ) ( ON ?auto_108149 ?auto_108148 ) ( ON ?auto_108150 ?auto_108149 ) ( ON ?auto_108151 ?auto_108150 ) ( ON ?auto_108152 ?auto_108151 ) ( not ( = ?auto_108148 ?auto_108149 ) ) ( not ( = ?auto_108148 ?auto_108150 ) ) ( not ( = ?auto_108148 ?auto_108151 ) ) ( not ( = ?auto_108148 ?auto_108152 ) ) ( not ( = ?auto_108148 ?auto_108153 ) ) ( not ( = ?auto_108148 ?auto_108154 ) ) ( not ( = ?auto_108148 ?auto_108155 ) ) ( not ( = ?auto_108148 ?auto_108156 ) ) ( not ( = ?auto_108148 ?auto_108157 ) ) ( not ( = ?auto_108148 ?auto_108158 ) ) ( not ( = ?auto_108149 ?auto_108150 ) ) ( not ( = ?auto_108149 ?auto_108151 ) ) ( not ( = ?auto_108149 ?auto_108152 ) ) ( not ( = ?auto_108149 ?auto_108153 ) ) ( not ( = ?auto_108149 ?auto_108154 ) ) ( not ( = ?auto_108149 ?auto_108155 ) ) ( not ( = ?auto_108149 ?auto_108156 ) ) ( not ( = ?auto_108149 ?auto_108157 ) ) ( not ( = ?auto_108149 ?auto_108158 ) ) ( not ( = ?auto_108150 ?auto_108151 ) ) ( not ( = ?auto_108150 ?auto_108152 ) ) ( not ( = ?auto_108150 ?auto_108153 ) ) ( not ( = ?auto_108150 ?auto_108154 ) ) ( not ( = ?auto_108150 ?auto_108155 ) ) ( not ( = ?auto_108150 ?auto_108156 ) ) ( not ( = ?auto_108150 ?auto_108157 ) ) ( not ( = ?auto_108150 ?auto_108158 ) ) ( not ( = ?auto_108151 ?auto_108152 ) ) ( not ( = ?auto_108151 ?auto_108153 ) ) ( not ( = ?auto_108151 ?auto_108154 ) ) ( not ( = ?auto_108151 ?auto_108155 ) ) ( not ( = ?auto_108151 ?auto_108156 ) ) ( not ( = ?auto_108151 ?auto_108157 ) ) ( not ( = ?auto_108151 ?auto_108158 ) ) ( not ( = ?auto_108152 ?auto_108153 ) ) ( not ( = ?auto_108152 ?auto_108154 ) ) ( not ( = ?auto_108152 ?auto_108155 ) ) ( not ( = ?auto_108152 ?auto_108156 ) ) ( not ( = ?auto_108152 ?auto_108157 ) ) ( not ( = ?auto_108152 ?auto_108158 ) ) ( not ( = ?auto_108153 ?auto_108154 ) ) ( not ( = ?auto_108153 ?auto_108155 ) ) ( not ( = ?auto_108153 ?auto_108156 ) ) ( not ( = ?auto_108153 ?auto_108157 ) ) ( not ( = ?auto_108153 ?auto_108158 ) ) ( not ( = ?auto_108154 ?auto_108155 ) ) ( not ( = ?auto_108154 ?auto_108156 ) ) ( not ( = ?auto_108154 ?auto_108157 ) ) ( not ( = ?auto_108154 ?auto_108158 ) ) ( not ( = ?auto_108155 ?auto_108156 ) ) ( not ( = ?auto_108155 ?auto_108157 ) ) ( not ( = ?auto_108155 ?auto_108158 ) ) ( not ( = ?auto_108156 ?auto_108157 ) ) ( not ( = ?auto_108156 ?auto_108158 ) ) ( not ( = ?auto_108157 ?auto_108158 ) ) ( ON ?auto_108156 ?auto_108157 ) ( ON ?auto_108155 ?auto_108156 ) ( ON ?auto_108154 ?auto_108155 ) ( CLEAR ?auto_108152 ) ( ON ?auto_108153 ?auto_108154 ) ( CLEAR ?auto_108153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108148 ?auto_108149 ?auto_108150 ?auto_108151 ?auto_108152 ?auto_108153 )
      ( MAKE-10PILE ?auto_108148 ?auto_108149 ?auto_108150 ?auto_108151 ?auto_108152 ?auto_108153 ?auto_108154 ?auto_108155 ?auto_108156 ?auto_108157 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108190 - BLOCK
      ?auto_108191 - BLOCK
      ?auto_108192 - BLOCK
      ?auto_108193 - BLOCK
      ?auto_108194 - BLOCK
      ?auto_108195 - BLOCK
      ?auto_108196 - BLOCK
      ?auto_108197 - BLOCK
      ?auto_108198 - BLOCK
      ?auto_108199 - BLOCK
    )
    :vars
    (
      ?auto_108200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108199 ?auto_108200 ) ( ON-TABLE ?auto_108190 ) ( ON ?auto_108191 ?auto_108190 ) ( ON ?auto_108192 ?auto_108191 ) ( ON ?auto_108193 ?auto_108192 ) ( not ( = ?auto_108190 ?auto_108191 ) ) ( not ( = ?auto_108190 ?auto_108192 ) ) ( not ( = ?auto_108190 ?auto_108193 ) ) ( not ( = ?auto_108190 ?auto_108194 ) ) ( not ( = ?auto_108190 ?auto_108195 ) ) ( not ( = ?auto_108190 ?auto_108196 ) ) ( not ( = ?auto_108190 ?auto_108197 ) ) ( not ( = ?auto_108190 ?auto_108198 ) ) ( not ( = ?auto_108190 ?auto_108199 ) ) ( not ( = ?auto_108190 ?auto_108200 ) ) ( not ( = ?auto_108191 ?auto_108192 ) ) ( not ( = ?auto_108191 ?auto_108193 ) ) ( not ( = ?auto_108191 ?auto_108194 ) ) ( not ( = ?auto_108191 ?auto_108195 ) ) ( not ( = ?auto_108191 ?auto_108196 ) ) ( not ( = ?auto_108191 ?auto_108197 ) ) ( not ( = ?auto_108191 ?auto_108198 ) ) ( not ( = ?auto_108191 ?auto_108199 ) ) ( not ( = ?auto_108191 ?auto_108200 ) ) ( not ( = ?auto_108192 ?auto_108193 ) ) ( not ( = ?auto_108192 ?auto_108194 ) ) ( not ( = ?auto_108192 ?auto_108195 ) ) ( not ( = ?auto_108192 ?auto_108196 ) ) ( not ( = ?auto_108192 ?auto_108197 ) ) ( not ( = ?auto_108192 ?auto_108198 ) ) ( not ( = ?auto_108192 ?auto_108199 ) ) ( not ( = ?auto_108192 ?auto_108200 ) ) ( not ( = ?auto_108193 ?auto_108194 ) ) ( not ( = ?auto_108193 ?auto_108195 ) ) ( not ( = ?auto_108193 ?auto_108196 ) ) ( not ( = ?auto_108193 ?auto_108197 ) ) ( not ( = ?auto_108193 ?auto_108198 ) ) ( not ( = ?auto_108193 ?auto_108199 ) ) ( not ( = ?auto_108193 ?auto_108200 ) ) ( not ( = ?auto_108194 ?auto_108195 ) ) ( not ( = ?auto_108194 ?auto_108196 ) ) ( not ( = ?auto_108194 ?auto_108197 ) ) ( not ( = ?auto_108194 ?auto_108198 ) ) ( not ( = ?auto_108194 ?auto_108199 ) ) ( not ( = ?auto_108194 ?auto_108200 ) ) ( not ( = ?auto_108195 ?auto_108196 ) ) ( not ( = ?auto_108195 ?auto_108197 ) ) ( not ( = ?auto_108195 ?auto_108198 ) ) ( not ( = ?auto_108195 ?auto_108199 ) ) ( not ( = ?auto_108195 ?auto_108200 ) ) ( not ( = ?auto_108196 ?auto_108197 ) ) ( not ( = ?auto_108196 ?auto_108198 ) ) ( not ( = ?auto_108196 ?auto_108199 ) ) ( not ( = ?auto_108196 ?auto_108200 ) ) ( not ( = ?auto_108197 ?auto_108198 ) ) ( not ( = ?auto_108197 ?auto_108199 ) ) ( not ( = ?auto_108197 ?auto_108200 ) ) ( not ( = ?auto_108198 ?auto_108199 ) ) ( not ( = ?auto_108198 ?auto_108200 ) ) ( not ( = ?auto_108199 ?auto_108200 ) ) ( ON ?auto_108198 ?auto_108199 ) ( ON ?auto_108197 ?auto_108198 ) ( ON ?auto_108196 ?auto_108197 ) ( ON ?auto_108195 ?auto_108196 ) ( CLEAR ?auto_108193 ) ( ON ?auto_108194 ?auto_108195 ) ( CLEAR ?auto_108194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108190 ?auto_108191 ?auto_108192 ?auto_108193 ?auto_108194 )
      ( MAKE-10PILE ?auto_108190 ?auto_108191 ?auto_108192 ?auto_108193 ?auto_108194 ?auto_108195 ?auto_108196 ?auto_108197 ?auto_108198 ?auto_108199 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108232 - BLOCK
      ?auto_108233 - BLOCK
      ?auto_108234 - BLOCK
      ?auto_108235 - BLOCK
      ?auto_108236 - BLOCK
      ?auto_108237 - BLOCK
      ?auto_108238 - BLOCK
      ?auto_108239 - BLOCK
      ?auto_108240 - BLOCK
      ?auto_108241 - BLOCK
    )
    :vars
    (
      ?auto_108242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108241 ?auto_108242 ) ( ON-TABLE ?auto_108232 ) ( ON ?auto_108233 ?auto_108232 ) ( ON ?auto_108234 ?auto_108233 ) ( not ( = ?auto_108232 ?auto_108233 ) ) ( not ( = ?auto_108232 ?auto_108234 ) ) ( not ( = ?auto_108232 ?auto_108235 ) ) ( not ( = ?auto_108232 ?auto_108236 ) ) ( not ( = ?auto_108232 ?auto_108237 ) ) ( not ( = ?auto_108232 ?auto_108238 ) ) ( not ( = ?auto_108232 ?auto_108239 ) ) ( not ( = ?auto_108232 ?auto_108240 ) ) ( not ( = ?auto_108232 ?auto_108241 ) ) ( not ( = ?auto_108232 ?auto_108242 ) ) ( not ( = ?auto_108233 ?auto_108234 ) ) ( not ( = ?auto_108233 ?auto_108235 ) ) ( not ( = ?auto_108233 ?auto_108236 ) ) ( not ( = ?auto_108233 ?auto_108237 ) ) ( not ( = ?auto_108233 ?auto_108238 ) ) ( not ( = ?auto_108233 ?auto_108239 ) ) ( not ( = ?auto_108233 ?auto_108240 ) ) ( not ( = ?auto_108233 ?auto_108241 ) ) ( not ( = ?auto_108233 ?auto_108242 ) ) ( not ( = ?auto_108234 ?auto_108235 ) ) ( not ( = ?auto_108234 ?auto_108236 ) ) ( not ( = ?auto_108234 ?auto_108237 ) ) ( not ( = ?auto_108234 ?auto_108238 ) ) ( not ( = ?auto_108234 ?auto_108239 ) ) ( not ( = ?auto_108234 ?auto_108240 ) ) ( not ( = ?auto_108234 ?auto_108241 ) ) ( not ( = ?auto_108234 ?auto_108242 ) ) ( not ( = ?auto_108235 ?auto_108236 ) ) ( not ( = ?auto_108235 ?auto_108237 ) ) ( not ( = ?auto_108235 ?auto_108238 ) ) ( not ( = ?auto_108235 ?auto_108239 ) ) ( not ( = ?auto_108235 ?auto_108240 ) ) ( not ( = ?auto_108235 ?auto_108241 ) ) ( not ( = ?auto_108235 ?auto_108242 ) ) ( not ( = ?auto_108236 ?auto_108237 ) ) ( not ( = ?auto_108236 ?auto_108238 ) ) ( not ( = ?auto_108236 ?auto_108239 ) ) ( not ( = ?auto_108236 ?auto_108240 ) ) ( not ( = ?auto_108236 ?auto_108241 ) ) ( not ( = ?auto_108236 ?auto_108242 ) ) ( not ( = ?auto_108237 ?auto_108238 ) ) ( not ( = ?auto_108237 ?auto_108239 ) ) ( not ( = ?auto_108237 ?auto_108240 ) ) ( not ( = ?auto_108237 ?auto_108241 ) ) ( not ( = ?auto_108237 ?auto_108242 ) ) ( not ( = ?auto_108238 ?auto_108239 ) ) ( not ( = ?auto_108238 ?auto_108240 ) ) ( not ( = ?auto_108238 ?auto_108241 ) ) ( not ( = ?auto_108238 ?auto_108242 ) ) ( not ( = ?auto_108239 ?auto_108240 ) ) ( not ( = ?auto_108239 ?auto_108241 ) ) ( not ( = ?auto_108239 ?auto_108242 ) ) ( not ( = ?auto_108240 ?auto_108241 ) ) ( not ( = ?auto_108240 ?auto_108242 ) ) ( not ( = ?auto_108241 ?auto_108242 ) ) ( ON ?auto_108240 ?auto_108241 ) ( ON ?auto_108239 ?auto_108240 ) ( ON ?auto_108238 ?auto_108239 ) ( ON ?auto_108237 ?auto_108238 ) ( ON ?auto_108236 ?auto_108237 ) ( CLEAR ?auto_108234 ) ( ON ?auto_108235 ?auto_108236 ) ( CLEAR ?auto_108235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108232 ?auto_108233 ?auto_108234 ?auto_108235 )
      ( MAKE-10PILE ?auto_108232 ?auto_108233 ?auto_108234 ?auto_108235 ?auto_108236 ?auto_108237 ?auto_108238 ?auto_108239 ?auto_108240 ?auto_108241 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108274 - BLOCK
      ?auto_108275 - BLOCK
      ?auto_108276 - BLOCK
      ?auto_108277 - BLOCK
      ?auto_108278 - BLOCK
      ?auto_108279 - BLOCK
      ?auto_108280 - BLOCK
      ?auto_108281 - BLOCK
      ?auto_108282 - BLOCK
      ?auto_108283 - BLOCK
    )
    :vars
    (
      ?auto_108284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108283 ?auto_108284 ) ( ON-TABLE ?auto_108274 ) ( ON ?auto_108275 ?auto_108274 ) ( not ( = ?auto_108274 ?auto_108275 ) ) ( not ( = ?auto_108274 ?auto_108276 ) ) ( not ( = ?auto_108274 ?auto_108277 ) ) ( not ( = ?auto_108274 ?auto_108278 ) ) ( not ( = ?auto_108274 ?auto_108279 ) ) ( not ( = ?auto_108274 ?auto_108280 ) ) ( not ( = ?auto_108274 ?auto_108281 ) ) ( not ( = ?auto_108274 ?auto_108282 ) ) ( not ( = ?auto_108274 ?auto_108283 ) ) ( not ( = ?auto_108274 ?auto_108284 ) ) ( not ( = ?auto_108275 ?auto_108276 ) ) ( not ( = ?auto_108275 ?auto_108277 ) ) ( not ( = ?auto_108275 ?auto_108278 ) ) ( not ( = ?auto_108275 ?auto_108279 ) ) ( not ( = ?auto_108275 ?auto_108280 ) ) ( not ( = ?auto_108275 ?auto_108281 ) ) ( not ( = ?auto_108275 ?auto_108282 ) ) ( not ( = ?auto_108275 ?auto_108283 ) ) ( not ( = ?auto_108275 ?auto_108284 ) ) ( not ( = ?auto_108276 ?auto_108277 ) ) ( not ( = ?auto_108276 ?auto_108278 ) ) ( not ( = ?auto_108276 ?auto_108279 ) ) ( not ( = ?auto_108276 ?auto_108280 ) ) ( not ( = ?auto_108276 ?auto_108281 ) ) ( not ( = ?auto_108276 ?auto_108282 ) ) ( not ( = ?auto_108276 ?auto_108283 ) ) ( not ( = ?auto_108276 ?auto_108284 ) ) ( not ( = ?auto_108277 ?auto_108278 ) ) ( not ( = ?auto_108277 ?auto_108279 ) ) ( not ( = ?auto_108277 ?auto_108280 ) ) ( not ( = ?auto_108277 ?auto_108281 ) ) ( not ( = ?auto_108277 ?auto_108282 ) ) ( not ( = ?auto_108277 ?auto_108283 ) ) ( not ( = ?auto_108277 ?auto_108284 ) ) ( not ( = ?auto_108278 ?auto_108279 ) ) ( not ( = ?auto_108278 ?auto_108280 ) ) ( not ( = ?auto_108278 ?auto_108281 ) ) ( not ( = ?auto_108278 ?auto_108282 ) ) ( not ( = ?auto_108278 ?auto_108283 ) ) ( not ( = ?auto_108278 ?auto_108284 ) ) ( not ( = ?auto_108279 ?auto_108280 ) ) ( not ( = ?auto_108279 ?auto_108281 ) ) ( not ( = ?auto_108279 ?auto_108282 ) ) ( not ( = ?auto_108279 ?auto_108283 ) ) ( not ( = ?auto_108279 ?auto_108284 ) ) ( not ( = ?auto_108280 ?auto_108281 ) ) ( not ( = ?auto_108280 ?auto_108282 ) ) ( not ( = ?auto_108280 ?auto_108283 ) ) ( not ( = ?auto_108280 ?auto_108284 ) ) ( not ( = ?auto_108281 ?auto_108282 ) ) ( not ( = ?auto_108281 ?auto_108283 ) ) ( not ( = ?auto_108281 ?auto_108284 ) ) ( not ( = ?auto_108282 ?auto_108283 ) ) ( not ( = ?auto_108282 ?auto_108284 ) ) ( not ( = ?auto_108283 ?auto_108284 ) ) ( ON ?auto_108282 ?auto_108283 ) ( ON ?auto_108281 ?auto_108282 ) ( ON ?auto_108280 ?auto_108281 ) ( ON ?auto_108279 ?auto_108280 ) ( ON ?auto_108278 ?auto_108279 ) ( ON ?auto_108277 ?auto_108278 ) ( CLEAR ?auto_108275 ) ( ON ?auto_108276 ?auto_108277 ) ( CLEAR ?auto_108276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108274 ?auto_108275 ?auto_108276 )
      ( MAKE-10PILE ?auto_108274 ?auto_108275 ?auto_108276 ?auto_108277 ?auto_108278 ?auto_108279 ?auto_108280 ?auto_108281 ?auto_108282 ?auto_108283 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108316 - BLOCK
      ?auto_108317 - BLOCK
      ?auto_108318 - BLOCK
      ?auto_108319 - BLOCK
      ?auto_108320 - BLOCK
      ?auto_108321 - BLOCK
      ?auto_108322 - BLOCK
      ?auto_108323 - BLOCK
      ?auto_108324 - BLOCK
      ?auto_108325 - BLOCK
    )
    :vars
    (
      ?auto_108326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108325 ?auto_108326 ) ( ON-TABLE ?auto_108316 ) ( not ( = ?auto_108316 ?auto_108317 ) ) ( not ( = ?auto_108316 ?auto_108318 ) ) ( not ( = ?auto_108316 ?auto_108319 ) ) ( not ( = ?auto_108316 ?auto_108320 ) ) ( not ( = ?auto_108316 ?auto_108321 ) ) ( not ( = ?auto_108316 ?auto_108322 ) ) ( not ( = ?auto_108316 ?auto_108323 ) ) ( not ( = ?auto_108316 ?auto_108324 ) ) ( not ( = ?auto_108316 ?auto_108325 ) ) ( not ( = ?auto_108316 ?auto_108326 ) ) ( not ( = ?auto_108317 ?auto_108318 ) ) ( not ( = ?auto_108317 ?auto_108319 ) ) ( not ( = ?auto_108317 ?auto_108320 ) ) ( not ( = ?auto_108317 ?auto_108321 ) ) ( not ( = ?auto_108317 ?auto_108322 ) ) ( not ( = ?auto_108317 ?auto_108323 ) ) ( not ( = ?auto_108317 ?auto_108324 ) ) ( not ( = ?auto_108317 ?auto_108325 ) ) ( not ( = ?auto_108317 ?auto_108326 ) ) ( not ( = ?auto_108318 ?auto_108319 ) ) ( not ( = ?auto_108318 ?auto_108320 ) ) ( not ( = ?auto_108318 ?auto_108321 ) ) ( not ( = ?auto_108318 ?auto_108322 ) ) ( not ( = ?auto_108318 ?auto_108323 ) ) ( not ( = ?auto_108318 ?auto_108324 ) ) ( not ( = ?auto_108318 ?auto_108325 ) ) ( not ( = ?auto_108318 ?auto_108326 ) ) ( not ( = ?auto_108319 ?auto_108320 ) ) ( not ( = ?auto_108319 ?auto_108321 ) ) ( not ( = ?auto_108319 ?auto_108322 ) ) ( not ( = ?auto_108319 ?auto_108323 ) ) ( not ( = ?auto_108319 ?auto_108324 ) ) ( not ( = ?auto_108319 ?auto_108325 ) ) ( not ( = ?auto_108319 ?auto_108326 ) ) ( not ( = ?auto_108320 ?auto_108321 ) ) ( not ( = ?auto_108320 ?auto_108322 ) ) ( not ( = ?auto_108320 ?auto_108323 ) ) ( not ( = ?auto_108320 ?auto_108324 ) ) ( not ( = ?auto_108320 ?auto_108325 ) ) ( not ( = ?auto_108320 ?auto_108326 ) ) ( not ( = ?auto_108321 ?auto_108322 ) ) ( not ( = ?auto_108321 ?auto_108323 ) ) ( not ( = ?auto_108321 ?auto_108324 ) ) ( not ( = ?auto_108321 ?auto_108325 ) ) ( not ( = ?auto_108321 ?auto_108326 ) ) ( not ( = ?auto_108322 ?auto_108323 ) ) ( not ( = ?auto_108322 ?auto_108324 ) ) ( not ( = ?auto_108322 ?auto_108325 ) ) ( not ( = ?auto_108322 ?auto_108326 ) ) ( not ( = ?auto_108323 ?auto_108324 ) ) ( not ( = ?auto_108323 ?auto_108325 ) ) ( not ( = ?auto_108323 ?auto_108326 ) ) ( not ( = ?auto_108324 ?auto_108325 ) ) ( not ( = ?auto_108324 ?auto_108326 ) ) ( not ( = ?auto_108325 ?auto_108326 ) ) ( ON ?auto_108324 ?auto_108325 ) ( ON ?auto_108323 ?auto_108324 ) ( ON ?auto_108322 ?auto_108323 ) ( ON ?auto_108321 ?auto_108322 ) ( ON ?auto_108320 ?auto_108321 ) ( ON ?auto_108319 ?auto_108320 ) ( ON ?auto_108318 ?auto_108319 ) ( CLEAR ?auto_108316 ) ( ON ?auto_108317 ?auto_108318 ) ( CLEAR ?auto_108317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108316 ?auto_108317 )
      ( MAKE-10PILE ?auto_108316 ?auto_108317 ?auto_108318 ?auto_108319 ?auto_108320 ?auto_108321 ?auto_108322 ?auto_108323 ?auto_108324 ?auto_108325 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_108358 - BLOCK
      ?auto_108359 - BLOCK
      ?auto_108360 - BLOCK
      ?auto_108361 - BLOCK
      ?auto_108362 - BLOCK
      ?auto_108363 - BLOCK
      ?auto_108364 - BLOCK
      ?auto_108365 - BLOCK
      ?auto_108366 - BLOCK
      ?auto_108367 - BLOCK
    )
    :vars
    (
      ?auto_108368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108367 ?auto_108368 ) ( not ( = ?auto_108358 ?auto_108359 ) ) ( not ( = ?auto_108358 ?auto_108360 ) ) ( not ( = ?auto_108358 ?auto_108361 ) ) ( not ( = ?auto_108358 ?auto_108362 ) ) ( not ( = ?auto_108358 ?auto_108363 ) ) ( not ( = ?auto_108358 ?auto_108364 ) ) ( not ( = ?auto_108358 ?auto_108365 ) ) ( not ( = ?auto_108358 ?auto_108366 ) ) ( not ( = ?auto_108358 ?auto_108367 ) ) ( not ( = ?auto_108358 ?auto_108368 ) ) ( not ( = ?auto_108359 ?auto_108360 ) ) ( not ( = ?auto_108359 ?auto_108361 ) ) ( not ( = ?auto_108359 ?auto_108362 ) ) ( not ( = ?auto_108359 ?auto_108363 ) ) ( not ( = ?auto_108359 ?auto_108364 ) ) ( not ( = ?auto_108359 ?auto_108365 ) ) ( not ( = ?auto_108359 ?auto_108366 ) ) ( not ( = ?auto_108359 ?auto_108367 ) ) ( not ( = ?auto_108359 ?auto_108368 ) ) ( not ( = ?auto_108360 ?auto_108361 ) ) ( not ( = ?auto_108360 ?auto_108362 ) ) ( not ( = ?auto_108360 ?auto_108363 ) ) ( not ( = ?auto_108360 ?auto_108364 ) ) ( not ( = ?auto_108360 ?auto_108365 ) ) ( not ( = ?auto_108360 ?auto_108366 ) ) ( not ( = ?auto_108360 ?auto_108367 ) ) ( not ( = ?auto_108360 ?auto_108368 ) ) ( not ( = ?auto_108361 ?auto_108362 ) ) ( not ( = ?auto_108361 ?auto_108363 ) ) ( not ( = ?auto_108361 ?auto_108364 ) ) ( not ( = ?auto_108361 ?auto_108365 ) ) ( not ( = ?auto_108361 ?auto_108366 ) ) ( not ( = ?auto_108361 ?auto_108367 ) ) ( not ( = ?auto_108361 ?auto_108368 ) ) ( not ( = ?auto_108362 ?auto_108363 ) ) ( not ( = ?auto_108362 ?auto_108364 ) ) ( not ( = ?auto_108362 ?auto_108365 ) ) ( not ( = ?auto_108362 ?auto_108366 ) ) ( not ( = ?auto_108362 ?auto_108367 ) ) ( not ( = ?auto_108362 ?auto_108368 ) ) ( not ( = ?auto_108363 ?auto_108364 ) ) ( not ( = ?auto_108363 ?auto_108365 ) ) ( not ( = ?auto_108363 ?auto_108366 ) ) ( not ( = ?auto_108363 ?auto_108367 ) ) ( not ( = ?auto_108363 ?auto_108368 ) ) ( not ( = ?auto_108364 ?auto_108365 ) ) ( not ( = ?auto_108364 ?auto_108366 ) ) ( not ( = ?auto_108364 ?auto_108367 ) ) ( not ( = ?auto_108364 ?auto_108368 ) ) ( not ( = ?auto_108365 ?auto_108366 ) ) ( not ( = ?auto_108365 ?auto_108367 ) ) ( not ( = ?auto_108365 ?auto_108368 ) ) ( not ( = ?auto_108366 ?auto_108367 ) ) ( not ( = ?auto_108366 ?auto_108368 ) ) ( not ( = ?auto_108367 ?auto_108368 ) ) ( ON ?auto_108366 ?auto_108367 ) ( ON ?auto_108365 ?auto_108366 ) ( ON ?auto_108364 ?auto_108365 ) ( ON ?auto_108363 ?auto_108364 ) ( ON ?auto_108362 ?auto_108363 ) ( ON ?auto_108361 ?auto_108362 ) ( ON ?auto_108360 ?auto_108361 ) ( ON ?auto_108359 ?auto_108360 ) ( ON ?auto_108358 ?auto_108359 ) ( CLEAR ?auto_108358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108358 )
      ( MAKE-10PILE ?auto_108358 ?auto_108359 ?auto_108360 ?auto_108361 ?auto_108362 ?auto_108363 ?auto_108364 ?auto_108365 ?auto_108366 ?auto_108367 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108401 - BLOCK
      ?auto_108402 - BLOCK
      ?auto_108403 - BLOCK
      ?auto_108404 - BLOCK
      ?auto_108405 - BLOCK
      ?auto_108406 - BLOCK
      ?auto_108407 - BLOCK
      ?auto_108408 - BLOCK
      ?auto_108409 - BLOCK
      ?auto_108410 - BLOCK
      ?auto_108411 - BLOCK
    )
    :vars
    (
      ?auto_108412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108410 ) ( ON ?auto_108411 ?auto_108412 ) ( CLEAR ?auto_108411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108401 ) ( ON ?auto_108402 ?auto_108401 ) ( ON ?auto_108403 ?auto_108402 ) ( ON ?auto_108404 ?auto_108403 ) ( ON ?auto_108405 ?auto_108404 ) ( ON ?auto_108406 ?auto_108405 ) ( ON ?auto_108407 ?auto_108406 ) ( ON ?auto_108408 ?auto_108407 ) ( ON ?auto_108409 ?auto_108408 ) ( ON ?auto_108410 ?auto_108409 ) ( not ( = ?auto_108401 ?auto_108402 ) ) ( not ( = ?auto_108401 ?auto_108403 ) ) ( not ( = ?auto_108401 ?auto_108404 ) ) ( not ( = ?auto_108401 ?auto_108405 ) ) ( not ( = ?auto_108401 ?auto_108406 ) ) ( not ( = ?auto_108401 ?auto_108407 ) ) ( not ( = ?auto_108401 ?auto_108408 ) ) ( not ( = ?auto_108401 ?auto_108409 ) ) ( not ( = ?auto_108401 ?auto_108410 ) ) ( not ( = ?auto_108401 ?auto_108411 ) ) ( not ( = ?auto_108401 ?auto_108412 ) ) ( not ( = ?auto_108402 ?auto_108403 ) ) ( not ( = ?auto_108402 ?auto_108404 ) ) ( not ( = ?auto_108402 ?auto_108405 ) ) ( not ( = ?auto_108402 ?auto_108406 ) ) ( not ( = ?auto_108402 ?auto_108407 ) ) ( not ( = ?auto_108402 ?auto_108408 ) ) ( not ( = ?auto_108402 ?auto_108409 ) ) ( not ( = ?auto_108402 ?auto_108410 ) ) ( not ( = ?auto_108402 ?auto_108411 ) ) ( not ( = ?auto_108402 ?auto_108412 ) ) ( not ( = ?auto_108403 ?auto_108404 ) ) ( not ( = ?auto_108403 ?auto_108405 ) ) ( not ( = ?auto_108403 ?auto_108406 ) ) ( not ( = ?auto_108403 ?auto_108407 ) ) ( not ( = ?auto_108403 ?auto_108408 ) ) ( not ( = ?auto_108403 ?auto_108409 ) ) ( not ( = ?auto_108403 ?auto_108410 ) ) ( not ( = ?auto_108403 ?auto_108411 ) ) ( not ( = ?auto_108403 ?auto_108412 ) ) ( not ( = ?auto_108404 ?auto_108405 ) ) ( not ( = ?auto_108404 ?auto_108406 ) ) ( not ( = ?auto_108404 ?auto_108407 ) ) ( not ( = ?auto_108404 ?auto_108408 ) ) ( not ( = ?auto_108404 ?auto_108409 ) ) ( not ( = ?auto_108404 ?auto_108410 ) ) ( not ( = ?auto_108404 ?auto_108411 ) ) ( not ( = ?auto_108404 ?auto_108412 ) ) ( not ( = ?auto_108405 ?auto_108406 ) ) ( not ( = ?auto_108405 ?auto_108407 ) ) ( not ( = ?auto_108405 ?auto_108408 ) ) ( not ( = ?auto_108405 ?auto_108409 ) ) ( not ( = ?auto_108405 ?auto_108410 ) ) ( not ( = ?auto_108405 ?auto_108411 ) ) ( not ( = ?auto_108405 ?auto_108412 ) ) ( not ( = ?auto_108406 ?auto_108407 ) ) ( not ( = ?auto_108406 ?auto_108408 ) ) ( not ( = ?auto_108406 ?auto_108409 ) ) ( not ( = ?auto_108406 ?auto_108410 ) ) ( not ( = ?auto_108406 ?auto_108411 ) ) ( not ( = ?auto_108406 ?auto_108412 ) ) ( not ( = ?auto_108407 ?auto_108408 ) ) ( not ( = ?auto_108407 ?auto_108409 ) ) ( not ( = ?auto_108407 ?auto_108410 ) ) ( not ( = ?auto_108407 ?auto_108411 ) ) ( not ( = ?auto_108407 ?auto_108412 ) ) ( not ( = ?auto_108408 ?auto_108409 ) ) ( not ( = ?auto_108408 ?auto_108410 ) ) ( not ( = ?auto_108408 ?auto_108411 ) ) ( not ( = ?auto_108408 ?auto_108412 ) ) ( not ( = ?auto_108409 ?auto_108410 ) ) ( not ( = ?auto_108409 ?auto_108411 ) ) ( not ( = ?auto_108409 ?auto_108412 ) ) ( not ( = ?auto_108410 ?auto_108411 ) ) ( not ( = ?auto_108410 ?auto_108412 ) ) ( not ( = ?auto_108411 ?auto_108412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_108411 ?auto_108412 )
      ( !STACK ?auto_108411 ?auto_108410 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108424 - BLOCK
      ?auto_108425 - BLOCK
      ?auto_108426 - BLOCK
      ?auto_108427 - BLOCK
      ?auto_108428 - BLOCK
      ?auto_108429 - BLOCK
      ?auto_108430 - BLOCK
      ?auto_108431 - BLOCK
      ?auto_108432 - BLOCK
      ?auto_108433 - BLOCK
      ?auto_108434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_108433 ) ( ON-TABLE ?auto_108434 ) ( CLEAR ?auto_108434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_108424 ) ( ON ?auto_108425 ?auto_108424 ) ( ON ?auto_108426 ?auto_108425 ) ( ON ?auto_108427 ?auto_108426 ) ( ON ?auto_108428 ?auto_108427 ) ( ON ?auto_108429 ?auto_108428 ) ( ON ?auto_108430 ?auto_108429 ) ( ON ?auto_108431 ?auto_108430 ) ( ON ?auto_108432 ?auto_108431 ) ( ON ?auto_108433 ?auto_108432 ) ( not ( = ?auto_108424 ?auto_108425 ) ) ( not ( = ?auto_108424 ?auto_108426 ) ) ( not ( = ?auto_108424 ?auto_108427 ) ) ( not ( = ?auto_108424 ?auto_108428 ) ) ( not ( = ?auto_108424 ?auto_108429 ) ) ( not ( = ?auto_108424 ?auto_108430 ) ) ( not ( = ?auto_108424 ?auto_108431 ) ) ( not ( = ?auto_108424 ?auto_108432 ) ) ( not ( = ?auto_108424 ?auto_108433 ) ) ( not ( = ?auto_108424 ?auto_108434 ) ) ( not ( = ?auto_108425 ?auto_108426 ) ) ( not ( = ?auto_108425 ?auto_108427 ) ) ( not ( = ?auto_108425 ?auto_108428 ) ) ( not ( = ?auto_108425 ?auto_108429 ) ) ( not ( = ?auto_108425 ?auto_108430 ) ) ( not ( = ?auto_108425 ?auto_108431 ) ) ( not ( = ?auto_108425 ?auto_108432 ) ) ( not ( = ?auto_108425 ?auto_108433 ) ) ( not ( = ?auto_108425 ?auto_108434 ) ) ( not ( = ?auto_108426 ?auto_108427 ) ) ( not ( = ?auto_108426 ?auto_108428 ) ) ( not ( = ?auto_108426 ?auto_108429 ) ) ( not ( = ?auto_108426 ?auto_108430 ) ) ( not ( = ?auto_108426 ?auto_108431 ) ) ( not ( = ?auto_108426 ?auto_108432 ) ) ( not ( = ?auto_108426 ?auto_108433 ) ) ( not ( = ?auto_108426 ?auto_108434 ) ) ( not ( = ?auto_108427 ?auto_108428 ) ) ( not ( = ?auto_108427 ?auto_108429 ) ) ( not ( = ?auto_108427 ?auto_108430 ) ) ( not ( = ?auto_108427 ?auto_108431 ) ) ( not ( = ?auto_108427 ?auto_108432 ) ) ( not ( = ?auto_108427 ?auto_108433 ) ) ( not ( = ?auto_108427 ?auto_108434 ) ) ( not ( = ?auto_108428 ?auto_108429 ) ) ( not ( = ?auto_108428 ?auto_108430 ) ) ( not ( = ?auto_108428 ?auto_108431 ) ) ( not ( = ?auto_108428 ?auto_108432 ) ) ( not ( = ?auto_108428 ?auto_108433 ) ) ( not ( = ?auto_108428 ?auto_108434 ) ) ( not ( = ?auto_108429 ?auto_108430 ) ) ( not ( = ?auto_108429 ?auto_108431 ) ) ( not ( = ?auto_108429 ?auto_108432 ) ) ( not ( = ?auto_108429 ?auto_108433 ) ) ( not ( = ?auto_108429 ?auto_108434 ) ) ( not ( = ?auto_108430 ?auto_108431 ) ) ( not ( = ?auto_108430 ?auto_108432 ) ) ( not ( = ?auto_108430 ?auto_108433 ) ) ( not ( = ?auto_108430 ?auto_108434 ) ) ( not ( = ?auto_108431 ?auto_108432 ) ) ( not ( = ?auto_108431 ?auto_108433 ) ) ( not ( = ?auto_108431 ?auto_108434 ) ) ( not ( = ?auto_108432 ?auto_108433 ) ) ( not ( = ?auto_108432 ?auto_108434 ) ) ( not ( = ?auto_108433 ?auto_108434 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_108434 )
      ( !STACK ?auto_108434 ?auto_108433 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108446 - BLOCK
      ?auto_108447 - BLOCK
      ?auto_108448 - BLOCK
      ?auto_108449 - BLOCK
      ?auto_108450 - BLOCK
      ?auto_108451 - BLOCK
      ?auto_108452 - BLOCK
      ?auto_108453 - BLOCK
      ?auto_108454 - BLOCK
      ?auto_108455 - BLOCK
      ?auto_108456 - BLOCK
    )
    :vars
    (
      ?auto_108457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108456 ?auto_108457 ) ( ON-TABLE ?auto_108446 ) ( ON ?auto_108447 ?auto_108446 ) ( ON ?auto_108448 ?auto_108447 ) ( ON ?auto_108449 ?auto_108448 ) ( ON ?auto_108450 ?auto_108449 ) ( ON ?auto_108451 ?auto_108450 ) ( ON ?auto_108452 ?auto_108451 ) ( ON ?auto_108453 ?auto_108452 ) ( ON ?auto_108454 ?auto_108453 ) ( not ( = ?auto_108446 ?auto_108447 ) ) ( not ( = ?auto_108446 ?auto_108448 ) ) ( not ( = ?auto_108446 ?auto_108449 ) ) ( not ( = ?auto_108446 ?auto_108450 ) ) ( not ( = ?auto_108446 ?auto_108451 ) ) ( not ( = ?auto_108446 ?auto_108452 ) ) ( not ( = ?auto_108446 ?auto_108453 ) ) ( not ( = ?auto_108446 ?auto_108454 ) ) ( not ( = ?auto_108446 ?auto_108455 ) ) ( not ( = ?auto_108446 ?auto_108456 ) ) ( not ( = ?auto_108446 ?auto_108457 ) ) ( not ( = ?auto_108447 ?auto_108448 ) ) ( not ( = ?auto_108447 ?auto_108449 ) ) ( not ( = ?auto_108447 ?auto_108450 ) ) ( not ( = ?auto_108447 ?auto_108451 ) ) ( not ( = ?auto_108447 ?auto_108452 ) ) ( not ( = ?auto_108447 ?auto_108453 ) ) ( not ( = ?auto_108447 ?auto_108454 ) ) ( not ( = ?auto_108447 ?auto_108455 ) ) ( not ( = ?auto_108447 ?auto_108456 ) ) ( not ( = ?auto_108447 ?auto_108457 ) ) ( not ( = ?auto_108448 ?auto_108449 ) ) ( not ( = ?auto_108448 ?auto_108450 ) ) ( not ( = ?auto_108448 ?auto_108451 ) ) ( not ( = ?auto_108448 ?auto_108452 ) ) ( not ( = ?auto_108448 ?auto_108453 ) ) ( not ( = ?auto_108448 ?auto_108454 ) ) ( not ( = ?auto_108448 ?auto_108455 ) ) ( not ( = ?auto_108448 ?auto_108456 ) ) ( not ( = ?auto_108448 ?auto_108457 ) ) ( not ( = ?auto_108449 ?auto_108450 ) ) ( not ( = ?auto_108449 ?auto_108451 ) ) ( not ( = ?auto_108449 ?auto_108452 ) ) ( not ( = ?auto_108449 ?auto_108453 ) ) ( not ( = ?auto_108449 ?auto_108454 ) ) ( not ( = ?auto_108449 ?auto_108455 ) ) ( not ( = ?auto_108449 ?auto_108456 ) ) ( not ( = ?auto_108449 ?auto_108457 ) ) ( not ( = ?auto_108450 ?auto_108451 ) ) ( not ( = ?auto_108450 ?auto_108452 ) ) ( not ( = ?auto_108450 ?auto_108453 ) ) ( not ( = ?auto_108450 ?auto_108454 ) ) ( not ( = ?auto_108450 ?auto_108455 ) ) ( not ( = ?auto_108450 ?auto_108456 ) ) ( not ( = ?auto_108450 ?auto_108457 ) ) ( not ( = ?auto_108451 ?auto_108452 ) ) ( not ( = ?auto_108451 ?auto_108453 ) ) ( not ( = ?auto_108451 ?auto_108454 ) ) ( not ( = ?auto_108451 ?auto_108455 ) ) ( not ( = ?auto_108451 ?auto_108456 ) ) ( not ( = ?auto_108451 ?auto_108457 ) ) ( not ( = ?auto_108452 ?auto_108453 ) ) ( not ( = ?auto_108452 ?auto_108454 ) ) ( not ( = ?auto_108452 ?auto_108455 ) ) ( not ( = ?auto_108452 ?auto_108456 ) ) ( not ( = ?auto_108452 ?auto_108457 ) ) ( not ( = ?auto_108453 ?auto_108454 ) ) ( not ( = ?auto_108453 ?auto_108455 ) ) ( not ( = ?auto_108453 ?auto_108456 ) ) ( not ( = ?auto_108453 ?auto_108457 ) ) ( not ( = ?auto_108454 ?auto_108455 ) ) ( not ( = ?auto_108454 ?auto_108456 ) ) ( not ( = ?auto_108454 ?auto_108457 ) ) ( not ( = ?auto_108455 ?auto_108456 ) ) ( not ( = ?auto_108455 ?auto_108457 ) ) ( not ( = ?auto_108456 ?auto_108457 ) ) ( CLEAR ?auto_108454 ) ( ON ?auto_108455 ?auto_108456 ) ( CLEAR ?auto_108455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_108446 ?auto_108447 ?auto_108448 ?auto_108449 ?auto_108450 ?auto_108451 ?auto_108452 ?auto_108453 ?auto_108454 ?auto_108455 )
      ( MAKE-11PILE ?auto_108446 ?auto_108447 ?auto_108448 ?auto_108449 ?auto_108450 ?auto_108451 ?auto_108452 ?auto_108453 ?auto_108454 ?auto_108455 ?auto_108456 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108469 - BLOCK
      ?auto_108470 - BLOCK
      ?auto_108471 - BLOCK
      ?auto_108472 - BLOCK
      ?auto_108473 - BLOCK
      ?auto_108474 - BLOCK
      ?auto_108475 - BLOCK
      ?auto_108476 - BLOCK
      ?auto_108477 - BLOCK
      ?auto_108478 - BLOCK
      ?auto_108479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108479 ) ( ON-TABLE ?auto_108469 ) ( ON ?auto_108470 ?auto_108469 ) ( ON ?auto_108471 ?auto_108470 ) ( ON ?auto_108472 ?auto_108471 ) ( ON ?auto_108473 ?auto_108472 ) ( ON ?auto_108474 ?auto_108473 ) ( ON ?auto_108475 ?auto_108474 ) ( ON ?auto_108476 ?auto_108475 ) ( ON ?auto_108477 ?auto_108476 ) ( not ( = ?auto_108469 ?auto_108470 ) ) ( not ( = ?auto_108469 ?auto_108471 ) ) ( not ( = ?auto_108469 ?auto_108472 ) ) ( not ( = ?auto_108469 ?auto_108473 ) ) ( not ( = ?auto_108469 ?auto_108474 ) ) ( not ( = ?auto_108469 ?auto_108475 ) ) ( not ( = ?auto_108469 ?auto_108476 ) ) ( not ( = ?auto_108469 ?auto_108477 ) ) ( not ( = ?auto_108469 ?auto_108478 ) ) ( not ( = ?auto_108469 ?auto_108479 ) ) ( not ( = ?auto_108470 ?auto_108471 ) ) ( not ( = ?auto_108470 ?auto_108472 ) ) ( not ( = ?auto_108470 ?auto_108473 ) ) ( not ( = ?auto_108470 ?auto_108474 ) ) ( not ( = ?auto_108470 ?auto_108475 ) ) ( not ( = ?auto_108470 ?auto_108476 ) ) ( not ( = ?auto_108470 ?auto_108477 ) ) ( not ( = ?auto_108470 ?auto_108478 ) ) ( not ( = ?auto_108470 ?auto_108479 ) ) ( not ( = ?auto_108471 ?auto_108472 ) ) ( not ( = ?auto_108471 ?auto_108473 ) ) ( not ( = ?auto_108471 ?auto_108474 ) ) ( not ( = ?auto_108471 ?auto_108475 ) ) ( not ( = ?auto_108471 ?auto_108476 ) ) ( not ( = ?auto_108471 ?auto_108477 ) ) ( not ( = ?auto_108471 ?auto_108478 ) ) ( not ( = ?auto_108471 ?auto_108479 ) ) ( not ( = ?auto_108472 ?auto_108473 ) ) ( not ( = ?auto_108472 ?auto_108474 ) ) ( not ( = ?auto_108472 ?auto_108475 ) ) ( not ( = ?auto_108472 ?auto_108476 ) ) ( not ( = ?auto_108472 ?auto_108477 ) ) ( not ( = ?auto_108472 ?auto_108478 ) ) ( not ( = ?auto_108472 ?auto_108479 ) ) ( not ( = ?auto_108473 ?auto_108474 ) ) ( not ( = ?auto_108473 ?auto_108475 ) ) ( not ( = ?auto_108473 ?auto_108476 ) ) ( not ( = ?auto_108473 ?auto_108477 ) ) ( not ( = ?auto_108473 ?auto_108478 ) ) ( not ( = ?auto_108473 ?auto_108479 ) ) ( not ( = ?auto_108474 ?auto_108475 ) ) ( not ( = ?auto_108474 ?auto_108476 ) ) ( not ( = ?auto_108474 ?auto_108477 ) ) ( not ( = ?auto_108474 ?auto_108478 ) ) ( not ( = ?auto_108474 ?auto_108479 ) ) ( not ( = ?auto_108475 ?auto_108476 ) ) ( not ( = ?auto_108475 ?auto_108477 ) ) ( not ( = ?auto_108475 ?auto_108478 ) ) ( not ( = ?auto_108475 ?auto_108479 ) ) ( not ( = ?auto_108476 ?auto_108477 ) ) ( not ( = ?auto_108476 ?auto_108478 ) ) ( not ( = ?auto_108476 ?auto_108479 ) ) ( not ( = ?auto_108477 ?auto_108478 ) ) ( not ( = ?auto_108477 ?auto_108479 ) ) ( not ( = ?auto_108478 ?auto_108479 ) ) ( CLEAR ?auto_108477 ) ( ON ?auto_108478 ?auto_108479 ) ( CLEAR ?auto_108478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_108469 ?auto_108470 ?auto_108471 ?auto_108472 ?auto_108473 ?auto_108474 ?auto_108475 ?auto_108476 ?auto_108477 ?auto_108478 )
      ( MAKE-11PILE ?auto_108469 ?auto_108470 ?auto_108471 ?auto_108472 ?auto_108473 ?auto_108474 ?auto_108475 ?auto_108476 ?auto_108477 ?auto_108478 ?auto_108479 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108491 - BLOCK
      ?auto_108492 - BLOCK
      ?auto_108493 - BLOCK
      ?auto_108494 - BLOCK
      ?auto_108495 - BLOCK
      ?auto_108496 - BLOCK
      ?auto_108497 - BLOCK
      ?auto_108498 - BLOCK
      ?auto_108499 - BLOCK
      ?auto_108500 - BLOCK
      ?auto_108501 - BLOCK
    )
    :vars
    (
      ?auto_108502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108501 ?auto_108502 ) ( ON-TABLE ?auto_108491 ) ( ON ?auto_108492 ?auto_108491 ) ( ON ?auto_108493 ?auto_108492 ) ( ON ?auto_108494 ?auto_108493 ) ( ON ?auto_108495 ?auto_108494 ) ( ON ?auto_108496 ?auto_108495 ) ( ON ?auto_108497 ?auto_108496 ) ( ON ?auto_108498 ?auto_108497 ) ( not ( = ?auto_108491 ?auto_108492 ) ) ( not ( = ?auto_108491 ?auto_108493 ) ) ( not ( = ?auto_108491 ?auto_108494 ) ) ( not ( = ?auto_108491 ?auto_108495 ) ) ( not ( = ?auto_108491 ?auto_108496 ) ) ( not ( = ?auto_108491 ?auto_108497 ) ) ( not ( = ?auto_108491 ?auto_108498 ) ) ( not ( = ?auto_108491 ?auto_108499 ) ) ( not ( = ?auto_108491 ?auto_108500 ) ) ( not ( = ?auto_108491 ?auto_108501 ) ) ( not ( = ?auto_108491 ?auto_108502 ) ) ( not ( = ?auto_108492 ?auto_108493 ) ) ( not ( = ?auto_108492 ?auto_108494 ) ) ( not ( = ?auto_108492 ?auto_108495 ) ) ( not ( = ?auto_108492 ?auto_108496 ) ) ( not ( = ?auto_108492 ?auto_108497 ) ) ( not ( = ?auto_108492 ?auto_108498 ) ) ( not ( = ?auto_108492 ?auto_108499 ) ) ( not ( = ?auto_108492 ?auto_108500 ) ) ( not ( = ?auto_108492 ?auto_108501 ) ) ( not ( = ?auto_108492 ?auto_108502 ) ) ( not ( = ?auto_108493 ?auto_108494 ) ) ( not ( = ?auto_108493 ?auto_108495 ) ) ( not ( = ?auto_108493 ?auto_108496 ) ) ( not ( = ?auto_108493 ?auto_108497 ) ) ( not ( = ?auto_108493 ?auto_108498 ) ) ( not ( = ?auto_108493 ?auto_108499 ) ) ( not ( = ?auto_108493 ?auto_108500 ) ) ( not ( = ?auto_108493 ?auto_108501 ) ) ( not ( = ?auto_108493 ?auto_108502 ) ) ( not ( = ?auto_108494 ?auto_108495 ) ) ( not ( = ?auto_108494 ?auto_108496 ) ) ( not ( = ?auto_108494 ?auto_108497 ) ) ( not ( = ?auto_108494 ?auto_108498 ) ) ( not ( = ?auto_108494 ?auto_108499 ) ) ( not ( = ?auto_108494 ?auto_108500 ) ) ( not ( = ?auto_108494 ?auto_108501 ) ) ( not ( = ?auto_108494 ?auto_108502 ) ) ( not ( = ?auto_108495 ?auto_108496 ) ) ( not ( = ?auto_108495 ?auto_108497 ) ) ( not ( = ?auto_108495 ?auto_108498 ) ) ( not ( = ?auto_108495 ?auto_108499 ) ) ( not ( = ?auto_108495 ?auto_108500 ) ) ( not ( = ?auto_108495 ?auto_108501 ) ) ( not ( = ?auto_108495 ?auto_108502 ) ) ( not ( = ?auto_108496 ?auto_108497 ) ) ( not ( = ?auto_108496 ?auto_108498 ) ) ( not ( = ?auto_108496 ?auto_108499 ) ) ( not ( = ?auto_108496 ?auto_108500 ) ) ( not ( = ?auto_108496 ?auto_108501 ) ) ( not ( = ?auto_108496 ?auto_108502 ) ) ( not ( = ?auto_108497 ?auto_108498 ) ) ( not ( = ?auto_108497 ?auto_108499 ) ) ( not ( = ?auto_108497 ?auto_108500 ) ) ( not ( = ?auto_108497 ?auto_108501 ) ) ( not ( = ?auto_108497 ?auto_108502 ) ) ( not ( = ?auto_108498 ?auto_108499 ) ) ( not ( = ?auto_108498 ?auto_108500 ) ) ( not ( = ?auto_108498 ?auto_108501 ) ) ( not ( = ?auto_108498 ?auto_108502 ) ) ( not ( = ?auto_108499 ?auto_108500 ) ) ( not ( = ?auto_108499 ?auto_108501 ) ) ( not ( = ?auto_108499 ?auto_108502 ) ) ( not ( = ?auto_108500 ?auto_108501 ) ) ( not ( = ?auto_108500 ?auto_108502 ) ) ( not ( = ?auto_108501 ?auto_108502 ) ) ( ON ?auto_108500 ?auto_108501 ) ( CLEAR ?auto_108498 ) ( ON ?auto_108499 ?auto_108500 ) ( CLEAR ?auto_108499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_108491 ?auto_108492 ?auto_108493 ?auto_108494 ?auto_108495 ?auto_108496 ?auto_108497 ?auto_108498 ?auto_108499 )
      ( MAKE-11PILE ?auto_108491 ?auto_108492 ?auto_108493 ?auto_108494 ?auto_108495 ?auto_108496 ?auto_108497 ?auto_108498 ?auto_108499 ?auto_108500 ?auto_108501 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108514 - BLOCK
      ?auto_108515 - BLOCK
      ?auto_108516 - BLOCK
      ?auto_108517 - BLOCK
      ?auto_108518 - BLOCK
      ?auto_108519 - BLOCK
      ?auto_108520 - BLOCK
      ?auto_108521 - BLOCK
      ?auto_108522 - BLOCK
      ?auto_108523 - BLOCK
      ?auto_108524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108524 ) ( ON-TABLE ?auto_108514 ) ( ON ?auto_108515 ?auto_108514 ) ( ON ?auto_108516 ?auto_108515 ) ( ON ?auto_108517 ?auto_108516 ) ( ON ?auto_108518 ?auto_108517 ) ( ON ?auto_108519 ?auto_108518 ) ( ON ?auto_108520 ?auto_108519 ) ( ON ?auto_108521 ?auto_108520 ) ( not ( = ?auto_108514 ?auto_108515 ) ) ( not ( = ?auto_108514 ?auto_108516 ) ) ( not ( = ?auto_108514 ?auto_108517 ) ) ( not ( = ?auto_108514 ?auto_108518 ) ) ( not ( = ?auto_108514 ?auto_108519 ) ) ( not ( = ?auto_108514 ?auto_108520 ) ) ( not ( = ?auto_108514 ?auto_108521 ) ) ( not ( = ?auto_108514 ?auto_108522 ) ) ( not ( = ?auto_108514 ?auto_108523 ) ) ( not ( = ?auto_108514 ?auto_108524 ) ) ( not ( = ?auto_108515 ?auto_108516 ) ) ( not ( = ?auto_108515 ?auto_108517 ) ) ( not ( = ?auto_108515 ?auto_108518 ) ) ( not ( = ?auto_108515 ?auto_108519 ) ) ( not ( = ?auto_108515 ?auto_108520 ) ) ( not ( = ?auto_108515 ?auto_108521 ) ) ( not ( = ?auto_108515 ?auto_108522 ) ) ( not ( = ?auto_108515 ?auto_108523 ) ) ( not ( = ?auto_108515 ?auto_108524 ) ) ( not ( = ?auto_108516 ?auto_108517 ) ) ( not ( = ?auto_108516 ?auto_108518 ) ) ( not ( = ?auto_108516 ?auto_108519 ) ) ( not ( = ?auto_108516 ?auto_108520 ) ) ( not ( = ?auto_108516 ?auto_108521 ) ) ( not ( = ?auto_108516 ?auto_108522 ) ) ( not ( = ?auto_108516 ?auto_108523 ) ) ( not ( = ?auto_108516 ?auto_108524 ) ) ( not ( = ?auto_108517 ?auto_108518 ) ) ( not ( = ?auto_108517 ?auto_108519 ) ) ( not ( = ?auto_108517 ?auto_108520 ) ) ( not ( = ?auto_108517 ?auto_108521 ) ) ( not ( = ?auto_108517 ?auto_108522 ) ) ( not ( = ?auto_108517 ?auto_108523 ) ) ( not ( = ?auto_108517 ?auto_108524 ) ) ( not ( = ?auto_108518 ?auto_108519 ) ) ( not ( = ?auto_108518 ?auto_108520 ) ) ( not ( = ?auto_108518 ?auto_108521 ) ) ( not ( = ?auto_108518 ?auto_108522 ) ) ( not ( = ?auto_108518 ?auto_108523 ) ) ( not ( = ?auto_108518 ?auto_108524 ) ) ( not ( = ?auto_108519 ?auto_108520 ) ) ( not ( = ?auto_108519 ?auto_108521 ) ) ( not ( = ?auto_108519 ?auto_108522 ) ) ( not ( = ?auto_108519 ?auto_108523 ) ) ( not ( = ?auto_108519 ?auto_108524 ) ) ( not ( = ?auto_108520 ?auto_108521 ) ) ( not ( = ?auto_108520 ?auto_108522 ) ) ( not ( = ?auto_108520 ?auto_108523 ) ) ( not ( = ?auto_108520 ?auto_108524 ) ) ( not ( = ?auto_108521 ?auto_108522 ) ) ( not ( = ?auto_108521 ?auto_108523 ) ) ( not ( = ?auto_108521 ?auto_108524 ) ) ( not ( = ?auto_108522 ?auto_108523 ) ) ( not ( = ?auto_108522 ?auto_108524 ) ) ( not ( = ?auto_108523 ?auto_108524 ) ) ( ON ?auto_108523 ?auto_108524 ) ( CLEAR ?auto_108521 ) ( ON ?auto_108522 ?auto_108523 ) ( CLEAR ?auto_108522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_108514 ?auto_108515 ?auto_108516 ?auto_108517 ?auto_108518 ?auto_108519 ?auto_108520 ?auto_108521 ?auto_108522 )
      ( MAKE-11PILE ?auto_108514 ?auto_108515 ?auto_108516 ?auto_108517 ?auto_108518 ?auto_108519 ?auto_108520 ?auto_108521 ?auto_108522 ?auto_108523 ?auto_108524 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108536 - BLOCK
      ?auto_108537 - BLOCK
      ?auto_108538 - BLOCK
      ?auto_108539 - BLOCK
      ?auto_108540 - BLOCK
      ?auto_108541 - BLOCK
      ?auto_108542 - BLOCK
      ?auto_108543 - BLOCK
      ?auto_108544 - BLOCK
      ?auto_108545 - BLOCK
      ?auto_108546 - BLOCK
    )
    :vars
    (
      ?auto_108547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108546 ?auto_108547 ) ( ON-TABLE ?auto_108536 ) ( ON ?auto_108537 ?auto_108536 ) ( ON ?auto_108538 ?auto_108537 ) ( ON ?auto_108539 ?auto_108538 ) ( ON ?auto_108540 ?auto_108539 ) ( ON ?auto_108541 ?auto_108540 ) ( ON ?auto_108542 ?auto_108541 ) ( not ( = ?auto_108536 ?auto_108537 ) ) ( not ( = ?auto_108536 ?auto_108538 ) ) ( not ( = ?auto_108536 ?auto_108539 ) ) ( not ( = ?auto_108536 ?auto_108540 ) ) ( not ( = ?auto_108536 ?auto_108541 ) ) ( not ( = ?auto_108536 ?auto_108542 ) ) ( not ( = ?auto_108536 ?auto_108543 ) ) ( not ( = ?auto_108536 ?auto_108544 ) ) ( not ( = ?auto_108536 ?auto_108545 ) ) ( not ( = ?auto_108536 ?auto_108546 ) ) ( not ( = ?auto_108536 ?auto_108547 ) ) ( not ( = ?auto_108537 ?auto_108538 ) ) ( not ( = ?auto_108537 ?auto_108539 ) ) ( not ( = ?auto_108537 ?auto_108540 ) ) ( not ( = ?auto_108537 ?auto_108541 ) ) ( not ( = ?auto_108537 ?auto_108542 ) ) ( not ( = ?auto_108537 ?auto_108543 ) ) ( not ( = ?auto_108537 ?auto_108544 ) ) ( not ( = ?auto_108537 ?auto_108545 ) ) ( not ( = ?auto_108537 ?auto_108546 ) ) ( not ( = ?auto_108537 ?auto_108547 ) ) ( not ( = ?auto_108538 ?auto_108539 ) ) ( not ( = ?auto_108538 ?auto_108540 ) ) ( not ( = ?auto_108538 ?auto_108541 ) ) ( not ( = ?auto_108538 ?auto_108542 ) ) ( not ( = ?auto_108538 ?auto_108543 ) ) ( not ( = ?auto_108538 ?auto_108544 ) ) ( not ( = ?auto_108538 ?auto_108545 ) ) ( not ( = ?auto_108538 ?auto_108546 ) ) ( not ( = ?auto_108538 ?auto_108547 ) ) ( not ( = ?auto_108539 ?auto_108540 ) ) ( not ( = ?auto_108539 ?auto_108541 ) ) ( not ( = ?auto_108539 ?auto_108542 ) ) ( not ( = ?auto_108539 ?auto_108543 ) ) ( not ( = ?auto_108539 ?auto_108544 ) ) ( not ( = ?auto_108539 ?auto_108545 ) ) ( not ( = ?auto_108539 ?auto_108546 ) ) ( not ( = ?auto_108539 ?auto_108547 ) ) ( not ( = ?auto_108540 ?auto_108541 ) ) ( not ( = ?auto_108540 ?auto_108542 ) ) ( not ( = ?auto_108540 ?auto_108543 ) ) ( not ( = ?auto_108540 ?auto_108544 ) ) ( not ( = ?auto_108540 ?auto_108545 ) ) ( not ( = ?auto_108540 ?auto_108546 ) ) ( not ( = ?auto_108540 ?auto_108547 ) ) ( not ( = ?auto_108541 ?auto_108542 ) ) ( not ( = ?auto_108541 ?auto_108543 ) ) ( not ( = ?auto_108541 ?auto_108544 ) ) ( not ( = ?auto_108541 ?auto_108545 ) ) ( not ( = ?auto_108541 ?auto_108546 ) ) ( not ( = ?auto_108541 ?auto_108547 ) ) ( not ( = ?auto_108542 ?auto_108543 ) ) ( not ( = ?auto_108542 ?auto_108544 ) ) ( not ( = ?auto_108542 ?auto_108545 ) ) ( not ( = ?auto_108542 ?auto_108546 ) ) ( not ( = ?auto_108542 ?auto_108547 ) ) ( not ( = ?auto_108543 ?auto_108544 ) ) ( not ( = ?auto_108543 ?auto_108545 ) ) ( not ( = ?auto_108543 ?auto_108546 ) ) ( not ( = ?auto_108543 ?auto_108547 ) ) ( not ( = ?auto_108544 ?auto_108545 ) ) ( not ( = ?auto_108544 ?auto_108546 ) ) ( not ( = ?auto_108544 ?auto_108547 ) ) ( not ( = ?auto_108545 ?auto_108546 ) ) ( not ( = ?auto_108545 ?auto_108547 ) ) ( not ( = ?auto_108546 ?auto_108547 ) ) ( ON ?auto_108545 ?auto_108546 ) ( ON ?auto_108544 ?auto_108545 ) ( CLEAR ?auto_108542 ) ( ON ?auto_108543 ?auto_108544 ) ( CLEAR ?auto_108543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_108536 ?auto_108537 ?auto_108538 ?auto_108539 ?auto_108540 ?auto_108541 ?auto_108542 ?auto_108543 )
      ( MAKE-11PILE ?auto_108536 ?auto_108537 ?auto_108538 ?auto_108539 ?auto_108540 ?auto_108541 ?auto_108542 ?auto_108543 ?auto_108544 ?auto_108545 ?auto_108546 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108559 - BLOCK
      ?auto_108560 - BLOCK
      ?auto_108561 - BLOCK
      ?auto_108562 - BLOCK
      ?auto_108563 - BLOCK
      ?auto_108564 - BLOCK
      ?auto_108565 - BLOCK
      ?auto_108566 - BLOCK
      ?auto_108567 - BLOCK
      ?auto_108568 - BLOCK
      ?auto_108569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108569 ) ( ON-TABLE ?auto_108559 ) ( ON ?auto_108560 ?auto_108559 ) ( ON ?auto_108561 ?auto_108560 ) ( ON ?auto_108562 ?auto_108561 ) ( ON ?auto_108563 ?auto_108562 ) ( ON ?auto_108564 ?auto_108563 ) ( ON ?auto_108565 ?auto_108564 ) ( not ( = ?auto_108559 ?auto_108560 ) ) ( not ( = ?auto_108559 ?auto_108561 ) ) ( not ( = ?auto_108559 ?auto_108562 ) ) ( not ( = ?auto_108559 ?auto_108563 ) ) ( not ( = ?auto_108559 ?auto_108564 ) ) ( not ( = ?auto_108559 ?auto_108565 ) ) ( not ( = ?auto_108559 ?auto_108566 ) ) ( not ( = ?auto_108559 ?auto_108567 ) ) ( not ( = ?auto_108559 ?auto_108568 ) ) ( not ( = ?auto_108559 ?auto_108569 ) ) ( not ( = ?auto_108560 ?auto_108561 ) ) ( not ( = ?auto_108560 ?auto_108562 ) ) ( not ( = ?auto_108560 ?auto_108563 ) ) ( not ( = ?auto_108560 ?auto_108564 ) ) ( not ( = ?auto_108560 ?auto_108565 ) ) ( not ( = ?auto_108560 ?auto_108566 ) ) ( not ( = ?auto_108560 ?auto_108567 ) ) ( not ( = ?auto_108560 ?auto_108568 ) ) ( not ( = ?auto_108560 ?auto_108569 ) ) ( not ( = ?auto_108561 ?auto_108562 ) ) ( not ( = ?auto_108561 ?auto_108563 ) ) ( not ( = ?auto_108561 ?auto_108564 ) ) ( not ( = ?auto_108561 ?auto_108565 ) ) ( not ( = ?auto_108561 ?auto_108566 ) ) ( not ( = ?auto_108561 ?auto_108567 ) ) ( not ( = ?auto_108561 ?auto_108568 ) ) ( not ( = ?auto_108561 ?auto_108569 ) ) ( not ( = ?auto_108562 ?auto_108563 ) ) ( not ( = ?auto_108562 ?auto_108564 ) ) ( not ( = ?auto_108562 ?auto_108565 ) ) ( not ( = ?auto_108562 ?auto_108566 ) ) ( not ( = ?auto_108562 ?auto_108567 ) ) ( not ( = ?auto_108562 ?auto_108568 ) ) ( not ( = ?auto_108562 ?auto_108569 ) ) ( not ( = ?auto_108563 ?auto_108564 ) ) ( not ( = ?auto_108563 ?auto_108565 ) ) ( not ( = ?auto_108563 ?auto_108566 ) ) ( not ( = ?auto_108563 ?auto_108567 ) ) ( not ( = ?auto_108563 ?auto_108568 ) ) ( not ( = ?auto_108563 ?auto_108569 ) ) ( not ( = ?auto_108564 ?auto_108565 ) ) ( not ( = ?auto_108564 ?auto_108566 ) ) ( not ( = ?auto_108564 ?auto_108567 ) ) ( not ( = ?auto_108564 ?auto_108568 ) ) ( not ( = ?auto_108564 ?auto_108569 ) ) ( not ( = ?auto_108565 ?auto_108566 ) ) ( not ( = ?auto_108565 ?auto_108567 ) ) ( not ( = ?auto_108565 ?auto_108568 ) ) ( not ( = ?auto_108565 ?auto_108569 ) ) ( not ( = ?auto_108566 ?auto_108567 ) ) ( not ( = ?auto_108566 ?auto_108568 ) ) ( not ( = ?auto_108566 ?auto_108569 ) ) ( not ( = ?auto_108567 ?auto_108568 ) ) ( not ( = ?auto_108567 ?auto_108569 ) ) ( not ( = ?auto_108568 ?auto_108569 ) ) ( ON ?auto_108568 ?auto_108569 ) ( ON ?auto_108567 ?auto_108568 ) ( CLEAR ?auto_108565 ) ( ON ?auto_108566 ?auto_108567 ) ( CLEAR ?auto_108566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_108559 ?auto_108560 ?auto_108561 ?auto_108562 ?auto_108563 ?auto_108564 ?auto_108565 ?auto_108566 )
      ( MAKE-11PILE ?auto_108559 ?auto_108560 ?auto_108561 ?auto_108562 ?auto_108563 ?auto_108564 ?auto_108565 ?auto_108566 ?auto_108567 ?auto_108568 ?auto_108569 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108581 - BLOCK
      ?auto_108582 - BLOCK
      ?auto_108583 - BLOCK
      ?auto_108584 - BLOCK
      ?auto_108585 - BLOCK
      ?auto_108586 - BLOCK
      ?auto_108587 - BLOCK
      ?auto_108588 - BLOCK
      ?auto_108589 - BLOCK
      ?auto_108590 - BLOCK
      ?auto_108591 - BLOCK
    )
    :vars
    (
      ?auto_108592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108591 ?auto_108592 ) ( ON-TABLE ?auto_108581 ) ( ON ?auto_108582 ?auto_108581 ) ( ON ?auto_108583 ?auto_108582 ) ( ON ?auto_108584 ?auto_108583 ) ( ON ?auto_108585 ?auto_108584 ) ( ON ?auto_108586 ?auto_108585 ) ( not ( = ?auto_108581 ?auto_108582 ) ) ( not ( = ?auto_108581 ?auto_108583 ) ) ( not ( = ?auto_108581 ?auto_108584 ) ) ( not ( = ?auto_108581 ?auto_108585 ) ) ( not ( = ?auto_108581 ?auto_108586 ) ) ( not ( = ?auto_108581 ?auto_108587 ) ) ( not ( = ?auto_108581 ?auto_108588 ) ) ( not ( = ?auto_108581 ?auto_108589 ) ) ( not ( = ?auto_108581 ?auto_108590 ) ) ( not ( = ?auto_108581 ?auto_108591 ) ) ( not ( = ?auto_108581 ?auto_108592 ) ) ( not ( = ?auto_108582 ?auto_108583 ) ) ( not ( = ?auto_108582 ?auto_108584 ) ) ( not ( = ?auto_108582 ?auto_108585 ) ) ( not ( = ?auto_108582 ?auto_108586 ) ) ( not ( = ?auto_108582 ?auto_108587 ) ) ( not ( = ?auto_108582 ?auto_108588 ) ) ( not ( = ?auto_108582 ?auto_108589 ) ) ( not ( = ?auto_108582 ?auto_108590 ) ) ( not ( = ?auto_108582 ?auto_108591 ) ) ( not ( = ?auto_108582 ?auto_108592 ) ) ( not ( = ?auto_108583 ?auto_108584 ) ) ( not ( = ?auto_108583 ?auto_108585 ) ) ( not ( = ?auto_108583 ?auto_108586 ) ) ( not ( = ?auto_108583 ?auto_108587 ) ) ( not ( = ?auto_108583 ?auto_108588 ) ) ( not ( = ?auto_108583 ?auto_108589 ) ) ( not ( = ?auto_108583 ?auto_108590 ) ) ( not ( = ?auto_108583 ?auto_108591 ) ) ( not ( = ?auto_108583 ?auto_108592 ) ) ( not ( = ?auto_108584 ?auto_108585 ) ) ( not ( = ?auto_108584 ?auto_108586 ) ) ( not ( = ?auto_108584 ?auto_108587 ) ) ( not ( = ?auto_108584 ?auto_108588 ) ) ( not ( = ?auto_108584 ?auto_108589 ) ) ( not ( = ?auto_108584 ?auto_108590 ) ) ( not ( = ?auto_108584 ?auto_108591 ) ) ( not ( = ?auto_108584 ?auto_108592 ) ) ( not ( = ?auto_108585 ?auto_108586 ) ) ( not ( = ?auto_108585 ?auto_108587 ) ) ( not ( = ?auto_108585 ?auto_108588 ) ) ( not ( = ?auto_108585 ?auto_108589 ) ) ( not ( = ?auto_108585 ?auto_108590 ) ) ( not ( = ?auto_108585 ?auto_108591 ) ) ( not ( = ?auto_108585 ?auto_108592 ) ) ( not ( = ?auto_108586 ?auto_108587 ) ) ( not ( = ?auto_108586 ?auto_108588 ) ) ( not ( = ?auto_108586 ?auto_108589 ) ) ( not ( = ?auto_108586 ?auto_108590 ) ) ( not ( = ?auto_108586 ?auto_108591 ) ) ( not ( = ?auto_108586 ?auto_108592 ) ) ( not ( = ?auto_108587 ?auto_108588 ) ) ( not ( = ?auto_108587 ?auto_108589 ) ) ( not ( = ?auto_108587 ?auto_108590 ) ) ( not ( = ?auto_108587 ?auto_108591 ) ) ( not ( = ?auto_108587 ?auto_108592 ) ) ( not ( = ?auto_108588 ?auto_108589 ) ) ( not ( = ?auto_108588 ?auto_108590 ) ) ( not ( = ?auto_108588 ?auto_108591 ) ) ( not ( = ?auto_108588 ?auto_108592 ) ) ( not ( = ?auto_108589 ?auto_108590 ) ) ( not ( = ?auto_108589 ?auto_108591 ) ) ( not ( = ?auto_108589 ?auto_108592 ) ) ( not ( = ?auto_108590 ?auto_108591 ) ) ( not ( = ?auto_108590 ?auto_108592 ) ) ( not ( = ?auto_108591 ?auto_108592 ) ) ( ON ?auto_108590 ?auto_108591 ) ( ON ?auto_108589 ?auto_108590 ) ( ON ?auto_108588 ?auto_108589 ) ( CLEAR ?auto_108586 ) ( ON ?auto_108587 ?auto_108588 ) ( CLEAR ?auto_108587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108581 ?auto_108582 ?auto_108583 ?auto_108584 ?auto_108585 ?auto_108586 ?auto_108587 )
      ( MAKE-11PILE ?auto_108581 ?auto_108582 ?auto_108583 ?auto_108584 ?auto_108585 ?auto_108586 ?auto_108587 ?auto_108588 ?auto_108589 ?auto_108590 ?auto_108591 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108604 - BLOCK
      ?auto_108605 - BLOCK
      ?auto_108606 - BLOCK
      ?auto_108607 - BLOCK
      ?auto_108608 - BLOCK
      ?auto_108609 - BLOCK
      ?auto_108610 - BLOCK
      ?auto_108611 - BLOCK
      ?auto_108612 - BLOCK
      ?auto_108613 - BLOCK
      ?auto_108614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108614 ) ( ON-TABLE ?auto_108604 ) ( ON ?auto_108605 ?auto_108604 ) ( ON ?auto_108606 ?auto_108605 ) ( ON ?auto_108607 ?auto_108606 ) ( ON ?auto_108608 ?auto_108607 ) ( ON ?auto_108609 ?auto_108608 ) ( not ( = ?auto_108604 ?auto_108605 ) ) ( not ( = ?auto_108604 ?auto_108606 ) ) ( not ( = ?auto_108604 ?auto_108607 ) ) ( not ( = ?auto_108604 ?auto_108608 ) ) ( not ( = ?auto_108604 ?auto_108609 ) ) ( not ( = ?auto_108604 ?auto_108610 ) ) ( not ( = ?auto_108604 ?auto_108611 ) ) ( not ( = ?auto_108604 ?auto_108612 ) ) ( not ( = ?auto_108604 ?auto_108613 ) ) ( not ( = ?auto_108604 ?auto_108614 ) ) ( not ( = ?auto_108605 ?auto_108606 ) ) ( not ( = ?auto_108605 ?auto_108607 ) ) ( not ( = ?auto_108605 ?auto_108608 ) ) ( not ( = ?auto_108605 ?auto_108609 ) ) ( not ( = ?auto_108605 ?auto_108610 ) ) ( not ( = ?auto_108605 ?auto_108611 ) ) ( not ( = ?auto_108605 ?auto_108612 ) ) ( not ( = ?auto_108605 ?auto_108613 ) ) ( not ( = ?auto_108605 ?auto_108614 ) ) ( not ( = ?auto_108606 ?auto_108607 ) ) ( not ( = ?auto_108606 ?auto_108608 ) ) ( not ( = ?auto_108606 ?auto_108609 ) ) ( not ( = ?auto_108606 ?auto_108610 ) ) ( not ( = ?auto_108606 ?auto_108611 ) ) ( not ( = ?auto_108606 ?auto_108612 ) ) ( not ( = ?auto_108606 ?auto_108613 ) ) ( not ( = ?auto_108606 ?auto_108614 ) ) ( not ( = ?auto_108607 ?auto_108608 ) ) ( not ( = ?auto_108607 ?auto_108609 ) ) ( not ( = ?auto_108607 ?auto_108610 ) ) ( not ( = ?auto_108607 ?auto_108611 ) ) ( not ( = ?auto_108607 ?auto_108612 ) ) ( not ( = ?auto_108607 ?auto_108613 ) ) ( not ( = ?auto_108607 ?auto_108614 ) ) ( not ( = ?auto_108608 ?auto_108609 ) ) ( not ( = ?auto_108608 ?auto_108610 ) ) ( not ( = ?auto_108608 ?auto_108611 ) ) ( not ( = ?auto_108608 ?auto_108612 ) ) ( not ( = ?auto_108608 ?auto_108613 ) ) ( not ( = ?auto_108608 ?auto_108614 ) ) ( not ( = ?auto_108609 ?auto_108610 ) ) ( not ( = ?auto_108609 ?auto_108611 ) ) ( not ( = ?auto_108609 ?auto_108612 ) ) ( not ( = ?auto_108609 ?auto_108613 ) ) ( not ( = ?auto_108609 ?auto_108614 ) ) ( not ( = ?auto_108610 ?auto_108611 ) ) ( not ( = ?auto_108610 ?auto_108612 ) ) ( not ( = ?auto_108610 ?auto_108613 ) ) ( not ( = ?auto_108610 ?auto_108614 ) ) ( not ( = ?auto_108611 ?auto_108612 ) ) ( not ( = ?auto_108611 ?auto_108613 ) ) ( not ( = ?auto_108611 ?auto_108614 ) ) ( not ( = ?auto_108612 ?auto_108613 ) ) ( not ( = ?auto_108612 ?auto_108614 ) ) ( not ( = ?auto_108613 ?auto_108614 ) ) ( ON ?auto_108613 ?auto_108614 ) ( ON ?auto_108612 ?auto_108613 ) ( ON ?auto_108611 ?auto_108612 ) ( CLEAR ?auto_108609 ) ( ON ?auto_108610 ?auto_108611 ) ( CLEAR ?auto_108610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_108604 ?auto_108605 ?auto_108606 ?auto_108607 ?auto_108608 ?auto_108609 ?auto_108610 )
      ( MAKE-11PILE ?auto_108604 ?auto_108605 ?auto_108606 ?auto_108607 ?auto_108608 ?auto_108609 ?auto_108610 ?auto_108611 ?auto_108612 ?auto_108613 ?auto_108614 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108626 - BLOCK
      ?auto_108627 - BLOCK
      ?auto_108628 - BLOCK
      ?auto_108629 - BLOCK
      ?auto_108630 - BLOCK
      ?auto_108631 - BLOCK
      ?auto_108632 - BLOCK
      ?auto_108633 - BLOCK
      ?auto_108634 - BLOCK
      ?auto_108635 - BLOCK
      ?auto_108636 - BLOCK
    )
    :vars
    (
      ?auto_108637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108636 ?auto_108637 ) ( ON-TABLE ?auto_108626 ) ( ON ?auto_108627 ?auto_108626 ) ( ON ?auto_108628 ?auto_108627 ) ( ON ?auto_108629 ?auto_108628 ) ( ON ?auto_108630 ?auto_108629 ) ( not ( = ?auto_108626 ?auto_108627 ) ) ( not ( = ?auto_108626 ?auto_108628 ) ) ( not ( = ?auto_108626 ?auto_108629 ) ) ( not ( = ?auto_108626 ?auto_108630 ) ) ( not ( = ?auto_108626 ?auto_108631 ) ) ( not ( = ?auto_108626 ?auto_108632 ) ) ( not ( = ?auto_108626 ?auto_108633 ) ) ( not ( = ?auto_108626 ?auto_108634 ) ) ( not ( = ?auto_108626 ?auto_108635 ) ) ( not ( = ?auto_108626 ?auto_108636 ) ) ( not ( = ?auto_108626 ?auto_108637 ) ) ( not ( = ?auto_108627 ?auto_108628 ) ) ( not ( = ?auto_108627 ?auto_108629 ) ) ( not ( = ?auto_108627 ?auto_108630 ) ) ( not ( = ?auto_108627 ?auto_108631 ) ) ( not ( = ?auto_108627 ?auto_108632 ) ) ( not ( = ?auto_108627 ?auto_108633 ) ) ( not ( = ?auto_108627 ?auto_108634 ) ) ( not ( = ?auto_108627 ?auto_108635 ) ) ( not ( = ?auto_108627 ?auto_108636 ) ) ( not ( = ?auto_108627 ?auto_108637 ) ) ( not ( = ?auto_108628 ?auto_108629 ) ) ( not ( = ?auto_108628 ?auto_108630 ) ) ( not ( = ?auto_108628 ?auto_108631 ) ) ( not ( = ?auto_108628 ?auto_108632 ) ) ( not ( = ?auto_108628 ?auto_108633 ) ) ( not ( = ?auto_108628 ?auto_108634 ) ) ( not ( = ?auto_108628 ?auto_108635 ) ) ( not ( = ?auto_108628 ?auto_108636 ) ) ( not ( = ?auto_108628 ?auto_108637 ) ) ( not ( = ?auto_108629 ?auto_108630 ) ) ( not ( = ?auto_108629 ?auto_108631 ) ) ( not ( = ?auto_108629 ?auto_108632 ) ) ( not ( = ?auto_108629 ?auto_108633 ) ) ( not ( = ?auto_108629 ?auto_108634 ) ) ( not ( = ?auto_108629 ?auto_108635 ) ) ( not ( = ?auto_108629 ?auto_108636 ) ) ( not ( = ?auto_108629 ?auto_108637 ) ) ( not ( = ?auto_108630 ?auto_108631 ) ) ( not ( = ?auto_108630 ?auto_108632 ) ) ( not ( = ?auto_108630 ?auto_108633 ) ) ( not ( = ?auto_108630 ?auto_108634 ) ) ( not ( = ?auto_108630 ?auto_108635 ) ) ( not ( = ?auto_108630 ?auto_108636 ) ) ( not ( = ?auto_108630 ?auto_108637 ) ) ( not ( = ?auto_108631 ?auto_108632 ) ) ( not ( = ?auto_108631 ?auto_108633 ) ) ( not ( = ?auto_108631 ?auto_108634 ) ) ( not ( = ?auto_108631 ?auto_108635 ) ) ( not ( = ?auto_108631 ?auto_108636 ) ) ( not ( = ?auto_108631 ?auto_108637 ) ) ( not ( = ?auto_108632 ?auto_108633 ) ) ( not ( = ?auto_108632 ?auto_108634 ) ) ( not ( = ?auto_108632 ?auto_108635 ) ) ( not ( = ?auto_108632 ?auto_108636 ) ) ( not ( = ?auto_108632 ?auto_108637 ) ) ( not ( = ?auto_108633 ?auto_108634 ) ) ( not ( = ?auto_108633 ?auto_108635 ) ) ( not ( = ?auto_108633 ?auto_108636 ) ) ( not ( = ?auto_108633 ?auto_108637 ) ) ( not ( = ?auto_108634 ?auto_108635 ) ) ( not ( = ?auto_108634 ?auto_108636 ) ) ( not ( = ?auto_108634 ?auto_108637 ) ) ( not ( = ?auto_108635 ?auto_108636 ) ) ( not ( = ?auto_108635 ?auto_108637 ) ) ( not ( = ?auto_108636 ?auto_108637 ) ) ( ON ?auto_108635 ?auto_108636 ) ( ON ?auto_108634 ?auto_108635 ) ( ON ?auto_108633 ?auto_108634 ) ( ON ?auto_108632 ?auto_108633 ) ( CLEAR ?auto_108630 ) ( ON ?auto_108631 ?auto_108632 ) ( CLEAR ?auto_108631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108626 ?auto_108627 ?auto_108628 ?auto_108629 ?auto_108630 ?auto_108631 )
      ( MAKE-11PILE ?auto_108626 ?auto_108627 ?auto_108628 ?auto_108629 ?auto_108630 ?auto_108631 ?auto_108632 ?auto_108633 ?auto_108634 ?auto_108635 ?auto_108636 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108649 - BLOCK
      ?auto_108650 - BLOCK
      ?auto_108651 - BLOCK
      ?auto_108652 - BLOCK
      ?auto_108653 - BLOCK
      ?auto_108654 - BLOCK
      ?auto_108655 - BLOCK
      ?auto_108656 - BLOCK
      ?auto_108657 - BLOCK
      ?auto_108658 - BLOCK
      ?auto_108659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108659 ) ( ON-TABLE ?auto_108649 ) ( ON ?auto_108650 ?auto_108649 ) ( ON ?auto_108651 ?auto_108650 ) ( ON ?auto_108652 ?auto_108651 ) ( ON ?auto_108653 ?auto_108652 ) ( not ( = ?auto_108649 ?auto_108650 ) ) ( not ( = ?auto_108649 ?auto_108651 ) ) ( not ( = ?auto_108649 ?auto_108652 ) ) ( not ( = ?auto_108649 ?auto_108653 ) ) ( not ( = ?auto_108649 ?auto_108654 ) ) ( not ( = ?auto_108649 ?auto_108655 ) ) ( not ( = ?auto_108649 ?auto_108656 ) ) ( not ( = ?auto_108649 ?auto_108657 ) ) ( not ( = ?auto_108649 ?auto_108658 ) ) ( not ( = ?auto_108649 ?auto_108659 ) ) ( not ( = ?auto_108650 ?auto_108651 ) ) ( not ( = ?auto_108650 ?auto_108652 ) ) ( not ( = ?auto_108650 ?auto_108653 ) ) ( not ( = ?auto_108650 ?auto_108654 ) ) ( not ( = ?auto_108650 ?auto_108655 ) ) ( not ( = ?auto_108650 ?auto_108656 ) ) ( not ( = ?auto_108650 ?auto_108657 ) ) ( not ( = ?auto_108650 ?auto_108658 ) ) ( not ( = ?auto_108650 ?auto_108659 ) ) ( not ( = ?auto_108651 ?auto_108652 ) ) ( not ( = ?auto_108651 ?auto_108653 ) ) ( not ( = ?auto_108651 ?auto_108654 ) ) ( not ( = ?auto_108651 ?auto_108655 ) ) ( not ( = ?auto_108651 ?auto_108656 ) ) ( not ( = ?auto_108651 ?auto_108657 ) ) ( not ( = ?auto_108651 ?auto_108658 ) ) ( not ( = ?auto_108651 ?auto_108659 ) ) ( not ( = ?auto_108652 ?auto_108653 ) ) ( not ( = ?auto_108652 ?auto_108654 ) ) ( not ( = ?auto_108652 ?auto_108655 ) ) ( not ( = ?auto_108652 ?auto_108656 ) ) ( not ( = ?auto_108652 ?auto_108657 ) ) ( not ( = ?auto_108652 ?auto_108658 ) ) ( not ( = ?auto_108652 ?auto_108659 ) ) ( not ( = ?auto_108653 ?auto_108654 ) ) ( not ( = ?auto_108653 ?auto_108655 ) ) ( not ( = ?auto_108653 ?auto_108656 ) ) ( not ( = ?auto_108653 ?auto_108657 ) ) ( not ( = ?auto_108653 ?auto_108658 ) ) ( not ( = ?auto_108653 ?auto_108659 ) ) ( not ( = ?auto_108654 ?auto_108655 ) ) ( not ( = ?auto_108654 ?auto_108656 ) ) ( not ( = ?auto_108654 ?auto_108657 ) ) ( not ( = ?auto_108654 ?auto_108658 ) ) ( not ( = ?auto_108654 ?auto_108659 ) ) ( not ( = ?auto_108655 ?auto_108656 ) ) ( not ( = ?auto_108655 ?auto_108657 ) ) ( not ( = ?auto_108655 ?auto_108658 ) ) ( not ( = ?auto_108655 ?auto_108659 ) ) ( not ( = ?auto_108656 ?auto_108657 ) ) ( not ( = ?auto_108656 ?auto_108658 ) ) ( not ( = ?auto_108656 ?auto_108659 ) ) ( not ( = ?auto_108657 ?auto_108658 ) ) ( not ( = ?auto_108657 ?auto_108659 ) ) ( not ( = ?auto_108658 ?auto_108659 ) ) ( ON ?auto_108658 ?auto_108659 ) ( ON ?auto_108657 ?auto_108658 ) ( ON ?auto_108656 ?auto_108657 ) ( ON ?auto_108655 ?auto_108656 ) ( CLEAR ?auto_108653 ) ( ON ?auto_108654 ?auto_108655 ) ( CLEAR ?auto_108654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_108649 ?auto_108650 ?auto_108651 ?auto_108652 ?auto_108653 ?auto_108654 )
      ( MAKE-11PILE ?auto_108649 ?auto_108650 ?auto_108651 ?auto_108652 ?auto_108653 ?auto_108654 ?auto_108655 ?auto_108656 ?auto_108657 ?auto_108658 ?auto_108659 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108671 - BLOCK
      ?auto_108672 - BLOCK
      ?auto_108673 - BLOCK
      ?auto_108674 - BLOCK
      ?auto_108675 - BLOCK
      ?auto_108676 - BLOCK
      ?auto_108677 - BLOCK
      ?auto_108678 - BLOCK
      ?auto_108679 - BLOCK
      ?auto_108680 - BLOCK
      ?auto_108681 - BLOCK
    )
    :vars
    (
      ?auto_108682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108681 ?auto_108682 ) ( ON-TABLE ?auto_108671 ) ( ON ?auto_108672 ?auto_108671 ) ( ON ?auto_108673 ?auto_108672 ) ( ON ?auto_108674 ?auto_108673 ) ( not ( = ?auto_108671 ?auto_108672 ) ) ( not ( = ?auto_108671 ?auto_108673 ) ) ( not ( = ?auto_108671 ?auto_108674 ) ) ( not ( = ?auto_108671 ?auto_108675 ) ) ( not ( = ?auto_108671 ?auto_108676 ) ) ( not ( = ?auto_108671 ?auto_108677 ) ) ( not ( = ?auto_108671 ?auto_108678 ) ) ( not ( = ?auto_108671 ?auto_108679 ) ) ( not ( = ?auto_108671 ?auto_108680 ) ) ( not ( = ?auto_108671 ?auto_108681 ) ) ( not ( = ?auto_108671 ?auto_108682 ) ) ( not ( = ?auto_108672 ?auto_108673 ) ) ( not ( = ?auto_108672 ?auto_108674 ) ) ( not ( = ?auto_108672 ?auto_108675 ) ) ( not ( = ?auto_108672 ?auto_108676 ) ) ( not ( = ?auto_108672 ?auto_108677 ) ) ( not ( = ?auto_108672 ?auto_108678 ) ) ( not ( = ?auto_108672 ?auto_108679 ) ) ( not ( = ?auto_108672 ?auto_108680 ) ) ( not ( = ?auto_108672 ?auto_108681 ) ) ( not ( = ?auto_108672 ?auto_108682 ) ) ( not ( = ?auto_108673 ?auto_108674 ) ) ( not ( = ?auto_108673 ?auto_108675 ) ) ( not ( = ?auto_108673 ?auto_108676 ) ) ( not ( = ?auto_108673 ?auto_108677 ) ) ( not ( = ?auto_108673 ?auto_108678 ) ) ( not ( = ?auto_108673 ?auto_108679 ) ) ( not ( = ?auto_108673 ?auto_108680 ) ) ( not ( = ?auto_108673 ?auto_108681 ) ) ( not ( = ?auto_108673 ?auto_108682 ) ) ( not ( = ?auto_108674 ?auto_108675 ) ) ( not ( = ?auto_108674 ?auto_108676 ) ) ( not ( = ?auto_108674 ?auto_108677 ) ) ( not ( = ?auto_108674 ?auto_108678 ) ) ( not ( = ?auto_108674 ?auto_108679 ) ) ( not ( = ?auto_108674 ?auto_108680 ) ) ( not ( = ?auto_108674 ?auto_108681 ) ) ( not ( = ?auto_108674 ?auto_108682 ) ) ( not ( = ?auto_108675 ?auto_108676 ) ) ( not ( = ?auto_108675 ?auto_108677 ) ) ( not ( = ?auto_108675 ?auto_108678 ) ) ( not ( = ?auto_108675 ?auto_108679 ) ) ( not ( = ?auto_108675 ?auto_108680 ) ) ( not ( = ?auto_108675 ?auto_108681 ) ) ( not ( = ?auto_108675 ?auto_108682 ) ) ( not ( = ?auto_108676 ?auto_108677 ) ) ( not ( = ?auto_108676 ?auto_108678 ) ) ( not ( = ?auto_108676 ?auto_108679 ) ) ( not ( = ?auto_108676 ?auto_108680 ) ) ( not ( = ?auto_108676 ?auto_108681 ) ) ( not ( = ?auto_108676 ?auto_108682 ) ) ( not ( = ?auto_108677 ?auto_108678 ) ) ( not ( = ?auto_108677 ?auto_108679 ) ) ( not ( = ?auto_108677 ?auto_108680 ) ) ( not ( = ?auto_108677 ?auto_108681 ) ) ( not ( = ?auto_108677 ?auto_108682 ) ) ( not ( = ?auto_108678 ?auto_108679 ) ) ( not ( = ?auto_108678 ?auto_108680 ) ) ( not ( = ?auto_108678 ?auto_108681 ) ) ( not ( = ?auto_108678 ?auto_108682 ) ) ( not ( = ?auto_108679 ?auto_108680 ) ) ( not ( = ?auto_108679 ?auto_108681 ) ) ( not ( = ?auto_108679 ?auto_108682 ) ) ( not ( = ?auto_108680 ?auto_108681 ) ) ( not ( = ?auto_108680 ?auto_108682 ) ) ( not ( = ?auto_108681 ?auto_108682 ) ) ( ON ?auto_108680 ?auto_108681 ) ( ON ?auto_108679 ?auto_108680 ) ( ON ?auto_108678 ?auto_108679 ) ( ON ?auto_108677 ?auto_108678 ) ( ON ?auto_108676 ?auto_108677 ) ( CLEAR ?auto_108674 ) ( ON ?auto_108675 ?auto_108676 ) ( CLEAR ?auto_108675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108671 ?auto_108672 ?auto_108673 ?auto_108674 ?auto_108675 )
      ( MAKE-11PILE ?auto_108671 ?auto_108672 ?auto_108673 ?auto_108674 ?auto_108675 ?auto_108676 ?auto_108677 ?auto_108678 ?auto_108679 ?auto_108680 ?auto_108681 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108694 - BLOCK
      ?auto_108695 - BLOCK
      ?auto_108696 - BLOCK
      ?auto_108697 - BLOCK
      ?auto_108698 - BLOCK
      ?auto_108699 - BLOCK
      ?auto_108700 - BLOCK
      ?auto_108701 - BLOCK
      ?auto_108702 - BLOCK
      ?auto_108703 - BLOCK
      ?auto_108704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108704 ) ( ON-TABLE ?auto_108694 ) ( ON ?auto_108695 ?auto_108694 ) ( ON ?auto_108696 ?auto_108695 ) ( ON ?auto_108697 ?auto_108696 ) ( not ( = ?auto_108694 ?auto_108695 ) ) ( not ( = ?auto_108694 ?auto_108696 ) ) ( not ( = ?auto_108694 ?auto_108697 ) ) ( not ( = ?auto_108694 ?auto_108698 ) ) ( not ( = ?auto_108694 ?auto_108699 ) ) ( not ( = ?auto_108694 ?auto_108700 ) ) ( not ( = ?auto_108694 ?auto_108701 ) ) ( not ( = ?auto_108694 ?auto_108702 ) ) ( not ( = ?auto_108694 ?auto_108703 ) ) ( not ( = ?auto_108694 ?auto_108704 ) ) ( not ( = ?auto_108695 ?auto_108696 ) ) ( not ( = ?auto_108695 ?auto_108697 ) ) ( not ( = ?auto_108695 ?auto_108698 ) ) ( not ( = ?auto_108695 ?auto_108699 ) ) ( not ( = ?auto_108695 ?auto_108700 ) ) ( not ( = ?auto_108695 ?auto_108701 ) ) ( not ( = ?auto_108695 ?auto_108702 ) ) ( not ( = ?auto_108695 ?auto_108703 ) ) ( not ( = ?auto_108695 ?auto_108704 ) ) ( not ( = ?auto_108696 ?auto_108697 ) ) ( not ( = ?auto_108696 ?auto_108698 ) ) ( not ( = ?auto_108696 ?auto_108699 ) ) ( not ( = ?auto_108696 ?auto_108700 ) ) ( not ( = ?auto_108696 ?auto_108701 ) ) ( not ( = ?auto_108696 ?auto_108702 ) ) ( not ( = ?auto_108696 ?auto_108703 ) ) ( not ( = ?auto_108696 ?auto_108704 ) ) ( not ( = ?auto_108697 ?auto_108698 ) ) ( not ( = ?auto_108697 ?auto_108699 ) ) ( not ( = ?auto_108697 ?auto_108700 ) ) ( not ( = ?auto_108697 ?auto_108701 ) ) ( not ( = ?auto_108697 ?auto_108702 ) ) ( not ( = ?auto_108697 ?auto_108703 ) ) ( not ( = ?auto_108697 ?auto_108704 ) ) ( not ( = ?auto_108698 ?auto_108699 ) ) ( not ( = ?auto_108698 ?auto_108700 ) ) ( not ( = ?auto_108698 ?auto_108701 ) ) ( not ( = ?auto_108698 ?auto_108702 ) ) ( not ( = ?auto_108698 ?auto_108703 ) ) ( not ( = ?auto_108698 ?auto_108704 ) ) ( not ( = ?auto_108699 ?auto_108700 ) ) ( not ( = ?auto_108699 ?auto_108701 ) ) ( not ( = ?auto_108699 ?auto_108702 ) ) ( not ( = ?auto_108699 ?auto_108703 ) ) ( not ( = ?auto_108699 ?auto_108704 ) ) ( not ( = ?auto_108700 ?auto_108701 ) ) ( not ( = ?auto_108700 ?auto_108702 ) ) ( not ( = ?auto_108700 ?auto_108703 ) ) ( not ( = ?auto_108700 ?auto_108704 ) ) ( not ( = ?auto_108701 ?auto_108702 ) ) ( not ( = ?auto_108701 ?auto_108703 ) ) ( not ( = ?auto_108701 ?auto_108704 ) ) ( not ( = ?auto_108702 ?auto_108703 ) ) ( not ( = ?auto_108702 ?auto_108704 ) ) ( not ( = ?auto_108703 ?auto_108704 ) ) ( ON ?auto_108703 ?auto_108704 ) ( ON ?auto_108702 ?auto_108703 ) ( ON ?auto_108701 ?auto_108702 ) ( ON ?auto_108700 ?auto_108701 ) ( ON ?auto_108699 ?auto_108700 ) ( CLEAR ?auto_108697 ) ( ON ?auto_108698 ?auto_108699 ) ( CLEAR ?auto_108698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_108694 ?auto_108695 ?auto_108696 ?auto_108697 ?auto_108698 )
      ( MAKE-11PILE ?auto_108694 ?auto_108695 ?auto_108696 ?auto_108697 ?auto_108698 ?auto_108699 ?auto_108700 ?auto_108701 ?auto_108702 ?auto_108703 ?auto_108704 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108716 - BLOCK
      ?auto_108717 - BLOCK
      ?auto_108718 - BLOCK
      ?auto_108719 - BLOCK
      ?auto_108720 - BLOCK
      ?auto_108721 - BLOCK
      ?auto_108722 - BLOCK
      ?auto_108723 - BLOCK
      ?auto_108724 - BLOCK
      ?auto_108725 - BLOCK
      ?auto_108726 - BLOCK
    )
    :vars
    (
      ?auto_108727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108726 ?auto_108727 ) ( ON-TABLE ?auto_108716 ) ( ON ?auto_108717 ?auto_108716 ) ( ON ?auto_108718 ?auto_108717 ) ( not ( = ?auto_108716 ?auto_108717 ) ) ( not ( = ?auto_108716 ?auto_108718 ) ) ( not ( = ?auto_108716 ?auto_108719 ) ) ( not ( = ?auto_108716 ?auto_108720 ) ) ( not ( = ?auto_108716 ?auto_108721 ) ) ( not ( = ?auto_108716 ?auto_108722 ) ) ( not ( = ?auto_108716 ?auto_108723 ) ) ( not ( = ?auto_108716 ?auto_108724 ) ) ( not ( = ?auto_108716 ?auto_108725 ) ) ( not ( = ?auto_108716 ?auto_108726 ) ) ( not ( = ?auto_108716 ?auto_108727 ) ) ( not ( = ?auto_108717 ?auto_108718 ) ) ( not ( = ?auto_108717 ?auto_108719 ) ) ( not ( = ?auto_108717 ?auto_108720 ) ) ( not ( = ?auto_108717 ?auto_108721 ) ) ( not ( = ?auto_108717 ?auto_108722 ) ) ( not ( = ?auto_108717 ?auto_108723 ) ) ( not ( = ?auto_108717 ?auto_108724 ) ) ( not ( = ?auto_108717 ?auto_108725 ) ) ( not ( = ?auto_108717 ?auto_108726 ) ) ( not ( = ?auto_108717 ?auto_108727 ) ) ( not ( = ?auto_108718 ?auto_108719 ) ) ( not ( = ?auto_108718 ?auto_108720 ) ) ( not ( = ?auto_108718 ?auto_108721 ) ) ( not ( = ?auto_108718 ?auto_108722 ) ) ( not ( = ?auto_108718 ?auto_108723 ) ) ( not ( = ?auto_108718 ?auto_108724 ) ) ( not ( = ?auto_108718 ?auto_108725 ) ) ( not ( = ?auto_108718 ?auto_108726 ) ) ( not ( = ?auto_108718 ?auto_108727 ) ) ( not ( = ?auto_108719 ?auto_108720 ) ) ( not ( = ?auto_108719 ?auto_108721 ) ) ( not ( = ?auto_108719 ?auto_108722 ) ) ( not ( = ?auto_108719 ?auto_108723 ) ) ( not ( = ?auto_108719 ?auto_108724 ) ) ( not ( = ?auto_108719 ?auto_108725 ) ) ( not ( = ?auto_108719 ?auto_108726 ) ) ( not ( = ?auto_108719 ?auto_108727 ) ) ( not ( = ?auto_108720 ?auto_108721 ) ) ( not ( = ?auto_108720 ?auto_108722 ) ) ( not ( = ?auto_108720 ?auto_108723 ) ) ( not ( = ?auto_108720 ?auto_108724 ) ) ( not ( = ?auto_108720 ?auto_108725 ) ) ( not ( = ?auto_108720 ?auto_108726 ) ) ( not ( = ?auto_108720 ?auto_108727 ) ) ( not ( = ?auto_108721 ?auto_108722 ) ) ( not ( = ?auto_108721 ?auto_108723 ) ) ( not ( = ?auto_108721 ?auto_108724 ) ) ( not ( = ?auto_108721 ?auto_108725 ) ) ( not ( = ?auto_108721 ?auto_108726 ) ) ( not ( = ?auto_108721 ?auto_108727 ) ) ( not ( = ?auto_108722 ?auto_108723 ) ) ( not ( = ?auto_108722 ?auto_108724 ) ) ( not ( = ?auto_108722 ?auto_108725 ) ) ( not ( = ?auto_108722 ?auto_108726 ) ) ( not ( = ?auto_108722 ?auto_108727 ) ) ( not ( = ?auto_108723 ?auto_108724 ) ) ( not ( = ?auto_108723 ?auto_108725 ) ) ( not ( = ?auto_108723 ?auto_108726 ) ) ( not ( = ?auto_108723 ?auto_108727 ) ) ( not ( = ?auto_108724 ?auto_108725 ) ) ( not ( = ?auto_108724 ?auto_108726 ) ) ( not ( = ?auto_108724 ?auto_108727 ) ) ( not ( = ?auto_108725 ?auto_108726 ) ) ( not ( = ?auto_108725 ?auto_108727 ) ) ( not ( = ?auto_108726 ?auto_108727 ) ) ( ON ?auto_108725 ?auto_108726 ) ( ON ?auto_108724 ?auto_108725 ) ( ON ?auto_108723 ?auto_108724 ) ( ON ?auto_108722 ?auto_108723 ) ( ON ?auto_108721 ?auto_108722 ) ( ON ?auto_108720 ?auto_108721 ) ( CLEAR ?auto_108718 ) ( ON ?auto_108719 ?auto_108720 ) ( CLEAR ?auto_108719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108716 ?auto_108717 ?auto_108718 ?auto_108719 )
      ( MAKE-11PILE ?auto_108716 ?auto_108717 ?auto_108718 ?auto_108719 ?auto_108720 ?auto_108721 ?auto_108722 ?auto_108723 ?auto_108724 ?auto_108725 ?auto_108726 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108739 - BLOCK
      ?auto_108740 - BLOCK
      ?auto_108741 - BLOCK
      ?auto_108742 - BLOCK
      ?auto_108743 - BLOCK
      ?auto_108744 - BLOCK
      ?auto_108745 - BLOCK
      ?auto_108746 - BLOCK
      ?auto_108747 - BLOCK
      ?auto_108748 - BLOCK
      ?auto_108749 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108749 ) ( ON-TABLE ?auto_108739 ) ( ON ?auto_108740 ?auto_108739 ) ( ON ?auto_108741 ?auto_108740 ) ( not ( = ?auto_108739 ?auto_108740 ) ) ( not ( = ?auto_108739 ?auto_108741 ) ) ( not ( = ?auto_108739 ?auto_108742 ) ) ( not ( = ?auto_108739 ?auto_108743 ) ) ( not ( = ?auto_108739 ?auto_108744 ) ) ( not ( = ?auto_108739 ?auto_108745 ) ) ( not ( = ?auto_108739 ?auto_108746 ) ) ( not ( = ?auto_108739 ?auto_108747 ) ) ( not ( = ?auto_108739 ?auto_108748 ) ) ( not ( = ?auto_108739 ?auto_108749 ) ) ( not ( = ?auto_108740 ?auto_108741 ) ) ( not ( = ?auto_108740 ?auto_108742 ) ) ( not ( = ?auto_108740 ?auto_108743 ) ) ( not ( = ?auto_108740 ?auto_108744 ) ) ( not ( = ?auto_108740 ?auto_108745 ) ) ( not ( = ?auto_108740 ?auto_108746 ) ) ( not ( = ?auto_108740 ?auto_108747 ) ) ( not ( = ?auto_108740 ?auto_108748 ) ) ( not ( = ?auto_108740 ?auto_108749 ) ) ( not ( = ?auto_108741 ?auto_108742 ) ) ( not ( = ?auto_108741 ?auto_108743 ) ) ( not ( = ?auto_108741 ?auto_108744 ) ) ( not ( = ?auto_108741 ?auto_108745 ) ) ( not ( = ?auto_108741 ?auto_108746 ) ) ( not ( = ?auto_108741 ?auto_108747 ) ) ( not ( = ?auto_108741 ?auto_108748 ) ) ( not ( = ?auto_108741 ?auto_108749 ) ) ( not ( = ?auto_108742 ?auto_108743 ) ) ( not ( = ?auto_108742 ?auto_108744 ) ) ( not ( = ?auto_108742 ?auto_108745 ) ) ( not ( = ?auto_108742 ?auto_108746 ) ) ( not ( = ?auto_108742 ?auto_108747 ) ) ( not ( = ?auto_108742 ?auto_108748 ) ) ( not ( = ?auto_108742 ?auto_108749 ) ) ( not ( = ?auto_108743 ?auto_108744 ) ) ( not ( = ?auto_108743 ?auto_108745 ) ) ( not ( = ?auto_108743 ?auto_108746 ) ) ( not ( = ?auto_108743 ?auto_108747 ) ) ( not ( = ?auto_108743 ?auto_108748 ) ) ( not ( = ?auto_108743 ?auto_108749 ) ) ( not ( = ?auto_108744 ?auto_108745 ) ) ( not ( = ?auto_108744 ?auto_108746 ) ) ( not ( = ?auto_108744 ?auto_108747 ) ) ( not ( = ?auto_108744 ?auto_108748 ) ) ( not ( = ?auto_108744 ?auto_108749 ) ) ( not ( = ?auto_108745 ?auto_108746 ) ) ( not ( = ?auto_108745 ?auto_108747 ) ) ( not ( = ?auto_108745 ?auto_108748 ) ) ( not ( = ?auto_108745 ?auto_108749 ) ) ( not ( = ?auto_108746 ?auto_108747 ) ) ( not ( = ?auto_108746 ?auto_108748 ) ) ( not ( = ?auto_108746 ?auto_108749 ) ) ( not ( = ?auto_108747 ?auto_108748 ) ) ( not ( = ?auto_108747 ?auto_108749 ) ) ( not ( = ?auto_108748 ?auto_108749 ) ) ( ON ?auto_108748 ?auto_108749 ) ( ON ?auto_108747 ?auto_108748 ) ( ON ?auto_108746 ?auto_108747 ) ( ON ?auto_108745 ?auto_108746 ) ( ON ?auto_108744 ?auto_108745 ) ( ON ?auto_108743 ?auto_108744 ) ( CLEAR ?auto_108741 ) ( ON ?auto_108742 ?auto_108743 ) ( CLEAR ?auto_108742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_108739 ?auto_108740 ?auto_108741 ?auto_108742 )
      ( MAKE-11PILE ?auto_108739 ?auto_108740 ?auto_108741 ?auto_108742 ?auto_108743 ?auto_108744 ?auto_108745 ?auto_108746 ?auto_108747 ?auto_108748 ?auto_108749 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108761 - BLOCK
      ?auto_108762 - BLOCK
      ?auto_108763 - BLOCK
      ?auto_108764 - BLOCK
      ?auto_108765 - BLOCK
      ?auto_108766 - BLOCK
      ?auto_108767 - BLOCK
      ?auto_108768 - BLOCK
      ?auto_108769 - BLOCK
      ?auto_108770 - BLOCK
      ?auto_108771 - BLOCK
    )
    :vars
    (
      ?auto_108772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108771 ?auto_108772 ) ( ON-TABLE ?auto_108761 ) ( ON ?auto_108762 ?auto_108761 ) ( not ( = ?auto_108761 ?auto_108762 ) ) ( not ( = ?auto_108761 ?auto_108763 ) ) ( not ( = ?auto_108761 ?auto_108764 ) ) ( not ( = ?auto_108761 ?auto_108765 ) ) ( not ( = ?auto_108761 ?auto_108766 ) ) ( not ( = ?auto_108761 ?auto_108767 ) ) ( not ( = ?auto_108761 ?auto_108768 ) ) ( not ( = ?auto_108761 ?auto_108769 ) ) ( not ( = ?auto_108761 ?auto_108770 ) ) ( not ( = ?auto_108761 ?auto_108771 ) ) ( not ( = ?auto_108761 ?auto_108772 ) ) ( not ( = ?auto_108762 ?auto_108763 ) ) ( not ( = ?auto_108762 ?auto_108764 ) ) ( not ( = ?auto_108762 ?auto_108765 ) ) ( not ( = ?auto_108762 ?auto_108766 ) ) ( not ( = ?auto_108762 ?auto_108767 ) ) ( not ( = ?auto_108762 ?auto_108768 ) ) ( not ( = ?auto_108762 ?auto_108769 ) ) ( not ( = ?auto_108762 ?auto_108770 ) ) ( not ( = ?auto_108762 ?auto_108771 ) ) ( not ( = ?auto_108762 ?auto_108772 ) ) ( not ( = ?auto_108763 ?auto_108764 ) ) ( not ( = ?auto_108763 ?auto_108765 ) ) ( not ( = ?auto_108763 ?auto_108766 ) ) ( not ( = ?auto_108763 ?auto_108767 ) ) ( not ( = ?auto_108763 ?auto_108768 ) ) ( not ( = ?auto_108763 ?auto_108769 ) ) ( not ( = ?auto_108763 ?auto_108770 ) ) ( not ( = ?auto_108763 ?auto_108771 ) ) ( not ( = ?auto_108763 ?auto_108772 ) ) ( not ( = ?auto_108764 ?auto_108765 ) ) ( not ( = ?auto_108764 ?auto_108766 ) ) ( not ( = ?auto_108764 ?auto_108767 ) ) ( not ( = ?auto_108764 ?auto_108768 ) ) ( not ( = ?auto_108764 ?auto_108769 ) ) ( not ( = ?auto_108764 ?auto_108770 ) ) ( not ( = ?auto_108764 ?auto_108771 ) ) ( not ( = ?auto_108764 ?auto_108772 ) ) ( not ( = ?auto_108765 ?auto_108766 ) ) ( not ( = ?auto_108765 ?auto_108767 ) ) ( not ( = ?auto_108765 ?auto_108768 ) ) ( not ( = ?auto_108765 ?auto_108769 ) ) ( not ( = ?auto_108765 ?auto_108770 ) ) ( not ( = ?auto_108765 ?auto_108771 ) ) ( not ( = ?auto_108765 ?auto_108772 ) ) ( not ( = ?auto_108766 ?auto_108767 ) ) ( not ( = ?auto_108766 ?auto_108768 ) ) ( not ( = ?auto_108766 ?auto_108769 ) ) ( not ( = ?auto_108766 ?auto_108770 ) ) ( not ( = ?auto_108766 ?auto_108771 ) ) ( not ( = ?auto_108766 ?auto_108772 ) ) ( not ( = ?auto_108767 ?auto_108768 ) ) ( not ( = ?auto_108767 ?auto_108769 ) ) ( not ( = ?auto_108767 ?auto_108770 ) ) ( not ( = ?auto_108767 ?auto_108771 ) ) ( not ( = ?auto_108767 ?auto_108772 ) ) ( not ( = ?auto_108768 ?auto_108769 ) ) ( not ( = ?auto_108768 ?auto_108770 ) ) ( not ( = ?auto_108768 ?auto_108771 ) ) ( not ( = ?auto_108768 ?auto_108772 ) ) ( not ( = ?auto_108769 ?auto_108770 ) ) ( not ( = ?auto_108769 ?auto_108771 ) ) ( not ( = ?auto_108769 ?auto_108772 ) ) ( not ( = ?auto_108770 ?auto_108771 ) ) ( not ( = ?auto_108770 ?auto_108772 ) ) ( not ( = ?auto_108771 ?auto_108772 ) ) ( ON ?auto_108770 ?auto_108771 ) ( ON ?auto_108769 ?auto_108770 ) ( ON ?auto_108768 ?auto_108769 ) ( ON ?auto_108767 ?auto_108768 ) ( ON ?auto_108766 ?auto_108767 ) ( ON ?auto_108765 ?auto_108766 ) ( ON ?auto_108764 ?auto_108765 ) ( CLEAR ?auto_108762 ) ( ON ?auto_108763 ?auto_108764 ) ( CLEAR ?auto_108763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108761 ?auto_108762 ?auto_108763 )
      ( MAKE-11PILE ?auto_108761 ?auto_108762 ?auto_108763 ?auto_108764 ?auto_108765 ?auto_108766 ?auto_108767 ?auto_108768 ?auto_108769 ?auto_108770 ?auto_108771 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108784 - BLOCK
      ?auto_108785 - BLOCK
      ?auto_108786 - BLOCK
      ?auto_108787 - BLOCK
      ?auto_108788 - BLOCK
      ?auto_108789 - BLOCK
      ?auto_108790 - BLOCK
      ?auto_108791 - BLOCK
      ?auto_108792 - BLOCK
      ?auto_108793 - BLOCK
      ?auto_108794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108794 ) ( ON-TABLE ?auto_108784 ) ( ON ?auto_108785 ?auto_108784 ) ( not ( = ?auto_108784 ?auto_108785 ) ) ( not ( = ?auto_108784 ?auto_108786 ) ) ( not ( = ?auto_108784 ?auto_108787 ) ) ( not ( = ?auto_108784 ?auto_108788 ) ) ( not ( = ?auto_108784 ?auto_108789 ) ) ( not ( = ?auto_108784 ?auto_108790 ) ) ( not ( = ?auto_108784 ?auto_108791 ) ) ( not ( = ?auto_108784 ?auto_108792 ) ) ( not ( = ?auto_108784 ?auto_108793 ) ) ( not ( = ?auto_108784 ?auto_108794 ) ) ( not ( = ?auto_108785 ?auto_108786 ) ) ( not ( = ?auto_108785 ?auto_108787 ) ) ( not ( = ?auto_108785 ?auto_108788 ) ) ( not ( = ?auto_108785 ?auto_108789 ) ) ( not ( = ?auto_108785 ?auto_108790 ) ) ( not ( = ?auto_108785 ?auto_108791 ) ) ( not ( = ?auto_108785 ?auto_108792 ) ) ( not ( = ?auto_108785 ?auto_108793 ) ) ( not ( = ?auto_108785 ?auto_108794 ) ) ( not ( = ?auto_108786 ?auto_108787 ) ) ( not ( = ?auto_108786 ?auto_108788 ) ) ( not ( = ?auto_108786 ?auto_108789 ) ) ( not ( = ?auto_108786 ?auto_108790 ) ) ( not ( = ?auto_108786 ?auto_108791 ) ) ( not ( = ?auto_108786 ?auto_108792 ) ) ( not ( = ?auto_108786 ?auto_108793 ) ) ( not ( = ?auto_108786 ?auto_108794 ) ) ( not ( = ?auto_108787 ?auto_108788 ) ) ( not ( = ?auto_108787 ?auto_108789 ) ) ( not ( = ?auto_108787 ?auto_108790 ) ) ( not ( = ?auto_108787 ?auto_108791 ) ) ( not ( = ?auto_108787 ?auto_108792 ) ) ( not ( = ?auto_108787 ?auto_108793 ) ) ( not ( = ?auto_108787 ?auto_108794 ) ) ( not ( = ?auto_108788 ?auto_108789 ) ) ( not ( = ?auto_108788 ?auto_108790 ) ) ( not ( = ?auto_108788 ?auto_108791 ) ) ( not ( = ?auto_108788 ?auto_108792 ) ) ( not ( = ?auto_108788 ?auto_108793 ) ) ( not ( = ?auto_108788 ?auto_108794 ) ) ( not ( = ?auto_108789 ?auto_108790 ) ) ( not ( = ?auto_108789 ?auto_108791 ) ) ( not ( = ?auto_108789 ?auto_108792 ) ) ( not ( = ?auto_108789 ?auto_108793 ) ) ( not ( = ?auto_108789 ?auto_108794 ) ) ( not ( = ?auto_108790 ?auto_108791 ) ) ( not ( = ?auto_108790 ?auto_108792 ) ) ( not ( = ?auto_108790 ?auto_108793 ) ) ( not ( = ?auto_108790 ?auto_108794 ) ) ( not ( = ?auto_108791 ?auto_108792 ) ) ( not ( = ?auto_108791 ?auto_108793 ) ) ( not ( = ?auto_108791 ?auto_108794 ) ) ( not ( = ?auto_108792 ?auto_108793 ) ) ( not ( = ?auto_108792 ?auto_108794 ) ) ( not ( = ?auto_108793 ?auto_108794 ) ) ( ON ?auto_108793 ?auto_108794 ) ( ON ?auto_108792 ?auto_108793 ) ( ON ?auto_108791 ?auto_108792 ) ( ON ?auto_108790 ?auto_108791 ) ( ON ?auto_108789 ?auto_108790 ) ( ON ?auto_108788 ?auto_108789 ) ( ON ?auto_108787 ?auto_108788 ) ( CLEAR ?auto_108785 ) ( ON ?auto_108786 ?auto_108787 ) ( CLEAR ?auto_108786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_108784 ?auto_108785 ?auto_108786 )
      ( MAKE-11PILE ?auto_108784 ?auto_108785 ?auto_108786 ?auto_108787 ?auto_108788 ?auto_108789 ?auto_108790 ?auto_108791 ?auto_108792 ?auto_108793 ?auto_108794 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108806 - BLOCK
      ?auto_108807 - BLOCK
      ?auto_108808 - BLOCK
      ?auto_108809 - BLOCK
      ?auto_108810 - BLOCK
      ?auto_108811 - BLOCK
      ?auto_108812 - BLOCK
      ?auto_108813 - BLOCK
      ?auto_108814 - BLOCK
      ?auto_108815 - BLOCK
      ?auto_108816 - BLOCK
    )
    :vars
    (
      ?auto_108817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108816 ?auto_108817 ) ( ON-TABLE ?auto_108806 ) ( not ( = ?auto_108806 ?auto_108807 ) ) ( not ( = ?auto_108806 ?auto_108808 ) ) ( not ( = ?auto_108806 ?auto_108809 ) ) ( not ( = ?auto_108806 ?auto_108810 ) ) ( not ( = ?auto_108806 ?auto_108811 ) ) ( not ( = ?auto_108806 ?auto_108812 ) ) ( not ( = ?auto_108806 ?auto_108813 ) ) ( not ( = ?auto_108806 ?auto_108814 ) ) ( not ( = ?auto_108806 ?auto_108815 ) ) ( not ( = ?auto_108806 ?auto_108816 ) ) ( not ( = ?auto_108806 ?auto_108817 ) ) ( not ( = ?auto_108807 ?auto_108808 ) ) ( not ( = ?auto_108807 ?auto_108809 ) ) ( not ( = ?auto_108807 ?auto_108810 ) ) ( not ( = ?auto_108807 ?auto_108811 ) ) ( not ( = ?auto_108807 ?auto_108812 ) ) ( not ( = ?auto_108807 ?auto_108813 ) ) ( not ( = ?auto_108807 ?auto_108814 ) ) ( not ( = ?auto_108807 ?auto_108815 ) ) ( not ( = ?auto_108807 ?auto_108816 ) ) ( not ( = ?auto_108807 ?auto_108817 ) ) ( not ( = ?auto_108808 ?auto_108809 ) ) ( not ( = ?auto_108808 ?auto_108810 ) ) ( not ( = ?auto_108808 ?auto_108811 ) ) ( not ( = ?auto_108808 ?auto_108812 ) ) ( not ( = ?auto_108808 ?auto_108813 ) ) ( not ( = ?auto_108808 ?auto_108814 ) ) ( not ( = ?auto_108808 ?auto_108815 ) ) ( not ( = ?auto_108808 ?auto_108816 ) ) ( not ( = ?auto_108808 ?auto_108817 ) ) ( not ( = ?auto_108809 ?auto_108810 ) ) ( not ( = ?auto_108809 ?auto_108811 ) ) ( not ( = ?auto_108809 ?auto_108812 ) ) ( not ( = ?auto_108809 ?auto_108813 ) ) ( not ( = ?auto_108809 ?auto_108814 ) ) ( not ( = ?auto_108809 ?auto_108815 ) ) ( not ( = ?auto_108809 ?auto_108816 ) ) ( not ( = ?auto_108809 ?auto_108817 ) ) ( not ( = ?auto_108810 ?auto_108811 ) ) ( not ( = ?auto_108810 ?auto_108812 ) ) ( not ( = ?auto_108810 ?auto_108813 ) ) ( not ( = ?auto_108810 ?auto_108814 ) ) ( not ( = ?auto_108810 ?auto_108815 ) ) ( not ( = ?auto_108810 ?auto_108816 ) ) ( not ( = ?auto_108810 ?auto_108817 ) ) ( not ( = ?auto_108811 ?auto_108812 ) ) ( not ( = ?auto_108811 ?auto_108813 ) ) ( not ( = ?auto_108811 ?auto_108814 ) ) ( not ( = ?auto_108811 ?auto_108815 ) ) ( not ( = ?auto_108811 ?auto_108816 ) ) ( not ( = ?auto_108811 ?auto_108817 ) ) ( not ( = ?auto_108812 ?auto_108813 ) ) ( not ( = ?auto_108812 ?auto_108814 ) ) ( not ( = ?auto_108812 ?auto_108815 ) ) ( not ( = ?auto_108812 ?auto_108816 ) ) ( not ( = ?auto_108812 ?auto_108817 ) ) ( not ( = ?auto_108813 ?auto_108814 ) ) ( not ( = ?auto_108813 ?auto_108815 ) ) ( not ( = ?auto_108813 ?auto_108816 ) ) ( not ( = ?auto_108813 ?auto_108817 ) ) ( not ( = ?auto_108814 ?auto_108815 ) ) ( not ( = ?auto_108814 ?auto_108816 ) ) ( not ( = ?auto_108814 ?auto_108817 ) ) ( not ( = ?auto_108815 ?auto_108816 ) ) ( not ( = ?auto_108815 ?auto_108817 ) ) ( not ( = ?auto_108816 ?auto_108817 ) ) ( ON ?auto_108815 ?auto_108816 ) ( ON ?auto_108814 ?auto_108815 ) ( ON ?auto_108813 ?auto_108814 ) ( ON ?auto_108812 ?auto_108813 ) ( ON ?auto_108811 ?auto_108812 ) ( ON ?auto_108810 ?auto_108811 ) ( ON ?auto_108809 ?auto_108810 ) ( ON ?auto_108808 ?auto_108809 ) ( CLEAR ?auto_108806 ) ( ON ?auto_108807 ?auto_108808 ) ( CLEAR ?auto_108807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108806 ?auto_108807 )
      ( MAKE-11PILE ?auto_108806 ?auto_108807 ?auto_108808 ?auto_108809 ?auto_108810 ?auto_108811 ?auto_108812 ?auto_108813 ?auto_108814 ?auto_108815 ?auto_108816 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108829 - BLOCK
      ?auto_108830 - BLOCK
      ?auto_108831 - BLOCK
      ?auto_108832 - BLOCK
      ?auto_108833 - BLOCK
      ?auto_108834 - BLOCK
      ?auto_108835 - BLOCK
      ?auto_108836 - BLOCK
      ?auto_108837 - BLOCK
      ?auto_108838 - BLOCK
      ?auto_108839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108839 ) ( ON-TABLE ?auto_108829 ) ( not ( = ?auto_108829 ?auto_108830 ) ) ( not ( = ?auto_108829 ?auto_108831 ) ) ( not ( = ?auto_108829 ?auto_108832 ) ) ( not ( = ?auto_108829 ?auto_108833 ) ) ( not ( = ?auto_108829 ?auto_108834 ) ) ( not ( = ?auto_108829 ?auto_108835 ) ) ( not ( = ?auto_108829 ?auto_108836 ) ) ( not ( = ?auto_108829 ?auto_108837 ) ) ( not ( = ?auto_108829 ?auto_108838 ) ) ( not ( = ?auto_108829 ?auto_108839 ) ) ( not ( = ?auto_108830 ?auto_108831 ) ) ( not ( = ?auto_108830 ?auto_108832 ) ) ( not ( = ?auto_108830 ?auto_108833 ) ) ( not ( = ?auto_108830 ?auto_108834 ) ) ( not ( = ?auto_108830 ?auto_108835 ) ) ( not ( = ?auto_108830 ?auto_108836 ) ) ( not ( = ?auto_108830 ?auto_108837 ) ) ( not ( = ?auto_108830 ?auto_108838 ) ) ( not ( = ?auto_108830 ?auto_108839 ) ) ( not ( = ?auto_108831 ?auto_108832 ) ) ( not ( = ?auto_108831 ?auto_108833 ) ) ( not ( = ?auto_108831 ?auto_108834 ) ) ( not ( = ?auto_108831 ?auto_108835 ) ) ( not ( = ?auto_108831 ?auto_108836 ) ) ( not ( = ?auto_108831 ?auto_108837 ) ) ( not ( = ?auto_108831 ?auto_108838 ) ) ( not ( = ?auto_108831 ?auto_108839 ) ) ( not ( = ?auto_108832 ?auto_108833 ) ) ( not ( = ?auto_108832 ?auto_108834 ) ) ( not ( = ?auto_108832 ?auto_108835 ) ) ( not ( = ?auto_108832 ?auto_108836 ) ) ( not ( = ?auto_108832 ?auto_108837 ) ) ( not ( = ?auto_108832 ?auto_108838 ) ) ( not ( = ?auto_108832 ?auto_108839 ) ) ( not ( = ?auto_108833 ?auto_108834 ) ) ( not ( = ?auto_108833 ?auto_108835 ) ) ( not ( = ?auto_108833 ?auto_108836 ) ) ( not ( = ?auto_108833 ?auto_108837 ) ) ( not ( = ?auto_108833 ?auto_108838 ) ) ( not ( = ?auto_108833 ?auto_108839 ) ) ( not ( = ?auto_108834 ?auto_108835 ) ) ( not ( = ?auto_108834 ?auto_108836 ) ) ( not ( = ?auto_108834 ?auto_108837 ) ) ( not ( = ?auto_108834 ?auto_108838 ) ) ( not ( = ?auto_108834 ?auto_108839 ) ) ( not ( = ?auto_108835 ?auto_108836 ) ) ( not ( = ?auto_108835 ?auto_108837 ) ) ( not ( = ?auto_108835 ?auto_108838 ) ) ( not ( = ?auto_108835 ?auto_108839 ) ) ( not ( = ?auto_108836 ?auto_108837 ) ) ( not ( = ?auto_108836 ?auto_108838 ) ) ( not ( = ?auto_108836 ?auto_108839 ) ) ( not ( = ?auto_108837 ?auto_108838 ) ) ( not ( = ?auto_108837 ?auto_108839 ) ) ( not ( = ?auto_108838 ?auto_108839 ) ) ( ON ?auto_108838 ?auto_108839 ) ( ON ?auto_108837 ?auto_108838 ) ( ON ?auto_108836 ?auto_108837 ) ( ON ?auto_108835 ?auto_108836 ) ( ON ?auto_108834 ?auto_108835 ) ( ON ?auto_108833 ?auto_108834 ) ( ON ?auto_108832 ?auto_108833 ) ( ON ?auto_108831 ?auto_108832 ) ( CLEAR ?auto_108829 ) ( ON ?auto_108830 ?auto_108831 ) ( CLEAR ?auto_108830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_108829 ?auto_108830 )
      ( MAKE-11PILE ?auto_108829 ?auto_108830 ?auto_108831 ?auto_108832 ?auto_108833 ?auto_108834 ?auto_108835 ?auto_108836 ?auto_108837 ?auto_108838 ?auto_108839 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108851 - BLOCK
      ?auto_108852 - BLOCK
      ?auto_108853 - BLOCK
      ?auto_108854 - BLOCK
      ?auto_108855 - BLOCK
      ?auto_108856 - BLOCK
      ?auto_108857 - BLOCK
      ?auto_108858 - BLOCK
      ?auto_108859 - BLOCK
      ?auto_108860 - BLOCK
      ?auto_108861 - BLOCK
    )
    :vars
    (
      ?auto_108862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_108861 ?auto_108862 ) ( not ( = ?auto_108851 ?auto_108852 ) ) ( not ( = ?auto_108851 ?auto_108853 ) ) ( not ( = ?auto_108851 ?auto_108854 ) ) ( not ( = ?auto_108851 ?auto_108855 ) ) ( not ( = ?auto_108851 ?auto_108856 ) ) ( not ( = ?auto_108851 ?auto_108857 ) ) ( not ( = ?auto_108851 ?auto_108858 ) ) ( not ( = ?auto_108851 ?auto_108859 ) ) ( not ( = ?auto_108851 ?auto_108860 ) ) ( not ( = ?auto_108851 ?auto_108861 ) ) ( not ( = ?auto_108851 ?auto_108862 ) ) ( not ( = ?auto_108852 ?auto_108853 ) ) ( not ( = ?auto_108852 ?auto_108854 ) ) ( not ( = ?auto_108852 ?auto_108855 ) ) ( not ( = ?auto_108852 ?auto_108856 ) ) ( not ( = ?auto_108852 ?auto_108857 ) ) ( not ( = ?auto_108852 ?auto_108858 ) ) ( not ( = ?auto_108852 ?auto_108859 ) ) ( not ( = ?auto_108852 ?auto_108860 ) ) ( not ( = ?auto_108852 ?auto_108861 ) ) ( not ( = ?auto_108852 ?auto_108862 ) ) ( not ( = ?auto_108853 ?auto_108854 ) ) ( not ( = ?auto_108853 ?auto_108855 ) ) ( not ( = ?auto_108853 ?auto_108856 ) ) ( not ( = ?auto_108853 ?auto_108857 ) ) ( not ( = ?auto_108853 ?auto_108858 ) ) ( not ( = ?auto_108853 ?auto_108859 ) ) ( not ( = ?auto_108853 ?auto_108860 ) ) ( not ( = ?auto_108853 ?auto_108861 ) ) ( not ( = ?auto_108853 ?auto_108862 ) ) ( not ( = ?auto_108854 ?auto_108855 ) ) ( not ( = ?auto_108854 ?auto_108856 ) ) ( not ( = ?auto_108854 ?auto_108857 ) ) ( not ( = ?auto_108854 ?auto_108858 ) ) ( not ( = ?auto_108854 ?auto_108859 ) ) ( not ( = ?auto_108854 ?auto_108860 ) ) ( not ( = ?auto_108854 ?auto_108861 ) ) ( not ( = ?auto_108854 ?auto_108862 ) ) ( not ( = ?auto_108855 ?auto_108856 ) ) ( not ( = ?auto_108855 ?auto_108857 ) ) ( not ( = ?auto_108855 ?auto_108858 ) ) ( not ( = ?auto_108855 ?auto_108859 ) ) ( not ( = ?auto_108855 ?auto_108860 ) ) ( not ( = ?auto_108855 ?auto_108861 ) ) ( not ( = ?auto_108855 ?auto_108862 ) ) ( not ( = ?auto_108856 ?auto_108857 ) ) ( not ( = ?auto_108856 ?auto_108858 ) ) ( not ( = ?auto_108856 ?auto_108859 ) ) ( not ( = ?auto_108856 ?auto_108860 ) ) ( not ( = ?auto_108856 ?auto_108861 ) ) ( not ( = ?auto_108856 ?auto_108862 ) ) ( not ( = ?auto_108857 ?auto_108858 ) ) ( not ( = ?auto_108857 ?auto_108859 ) ) ( not ( = ?auto_108857 ?auto_108860 ) ) ( not ( = ?auto_108857 ?auto_108861 ) ) ( not ( = ?auto_108857 ?auto_108862 ) ) ( not ( = ?auto_108858 ?auto_108859 ) ) ( not ( = ?auto_108858 ?auto_108860 ) ) ( not ( = ?auto_108858 ?auto_108861 ) ) ( not ( = ?auto_108858 ?auto_108862 ) ) ( not ( = ?auto_108859 ?auto_108860 ) ) ( not ( = ?auto_108859 ?auto_108861 ) ) ( not ( = ?auto_108859 ?auto_108862 ) ) ( not ( = ?auto_108860 ?auto_108861 ) ) ( not ( = ?auto_108860 ?auto_108862 ) ) ( not ( = ?auto_108861 ?auto_108862 ) ) ( ON ?auto_108860 ?auto_108861 ) ( ON ?auto_108859 ?auto_108860 ) ( ON ?auto_108858 ?auto_108859 ) ( ON ?auto_108857 ?auto_108858 ) ( ON ?auto_108856 ?auto_108857 ) ( ON ?auto_108855 ?auto_108856 ) ( ON ?auto_108854 ?auto_108855 ) ( ON ?auto_108853 ?auto_108854 ) ( ON ?auto_108852 ?auto_108853 ) ( ON ?auto_108851 ?auto_108852 ) ( CLEAR ?auto_108851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108851 )
      ( MAKE-11PILE ?auto_108851 ?auto_108852 ?auto_108853 ?auto_108854 ?auto_108855 ?auto_108856 ?auto_108857 ?auto_108858 ?auto_108859 ?auto_108860 ?auto_108861 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108874 - BLOCK
      ?auto_108875 - BLOCK
      ?auto_108876 - BLOCK
      ?auto_108877 - BLOCK
      ?auto_108878 - BLOCK
      ?auto_108879 - BLOCK
      ?auto_108880 - BLOCK
      ?auto_108881 - BLOCK
      ?auto_108882 - BLOCK
      ?auto_108883 - BLOCK
      ?auto_108884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_108884 ) ( not ( = ?auto_108874 ?auto_108875 ) ) ( not ( = ?auto_108874 ?auto_108876 ) ) ( not ( = ?auto_108874 ?auto_108877 ) ) ( not ( = ?auto_108874 ?auto_108878 ) ) ( not ( = ?auto_108874 ?auto_108879 ) ) ( not ( = ?auto_108874 ?auto_108880 ) ) ( not ( = ?auto_108874 ?auto_108881 ) ) ( not ( = ?auto_108874 ?auto_108882 ) ) ( not ( = ?auto_108874 ?auto_108883 ) ) ( not ( = ?auto_108874 ?auto_108884 ) ) ( not ( = ?auto_108875 ?auto_108876 ) ) ( not ( = ?auto_108875 ?auto_108877 ) ) ( not ( = ?auto_108875 ?auto_108878 ) ) ( not ( = ?auto_108875 ?auto_108879 ) ) ( not ( = ?auto_108875 ?auto_108880 ) ) ( not ( = ?auto_108875 ?auto_108881 ) ) ( not ( = ?auto_108875 ?auto_108882 ) ) ( not ( = ?auto_108875 ?auto_108883 ) ) ( not ( = ?auto_108875 ?auto_108884 ) ) ( not ( = ?auto_108876 ?auto_108877 ) ) ( not ( = ?auto_108876 ?auto_108878 ) ) ( not ( = ?auto_108876 ?auto_108879 ) ) ( not ( = ?auto_108876 ?auto_108880 ) ) ( not ( = ?auto_108876 ?auto_108881 ) ) ( not ( = ?auto_108876 ?auto_108882 ) ) ( not ( = ?auto_108876 ?auto_108883 ) ) ( not ( = ?auto_108876 ?auto_108884 ) ) ( not ( = ?auto_108877 ?auto_108878 ) ) ( not ( = ?auto_108877 ?auto_108879 ) ) ( not ( = ?auto_108877 ?auto_108880 ) ) ( not ( = ?auto_108877 ?auto_108881 ) ) ( not ( = ?auto_108877 ?auto_108882 ) ) ( not ( = ?auto_108877 ?auto_108883 ) ) ( not ( = ?auto_108877 ?auto_108884 ) ) ( not ( = ?auto_108878 ?auto_108879 ) ) ( not ( = ?auto_108878 ?auto_108880 ) ) ( not ( = ?auto_108878 ?auto_108881 ) ) ( not ( = ?auto_108878 ?auto_108882 ) ) ( not ( = ?auto_108878 ?auto_108883 ) ) ( not ( = ?auto_108878 ?auto_108884 ) ) ( not ( = ?auto_108879 ?auto_108880 ) ) ( not ( = ?auto_108879 ?auto_108881 ) ) ( not ( = ?auto_108879 ?auto_108882 ) ) ( not ( = ?auto_108879 ?auto_108883 ) ) ( not ( = ?auto_108879 ?auto_108884 ) ) ( not ( = ?auto_108880 ?auto_108881 ) ) ( not ( = ?auto_108880 ?auto_108882 ) ) ( not ( = ?auto_108880 ?auto_108883 ) ) ( not ( = ?auto_108880 ?auto_108884 ) ) ( not ( = ?auto_108881 ?auto_108882 ) ) ( not ( = ?auto_108881 ?auto_108883 ) ) ( not ( = ?auto_108881 ?auto_108884 ) ) ( not ( = ?auto_108882 ?auto_108883 ) ) ( not ( = ?auto_108882 ?auto_108884 ) ) ( not ( = ?auto_108883 ?auto_108884 ) ) ( ON ?auto_108883 ?auto_108884 ) ( ON ?auto_108882 ?auto_108883 ) ( ON ?auto_108881 ?auto_108882 ) ( ON ?auto_108880 ?auto_108881 ) ( ON ?auto_108879 ?auto_108880 ) ( ON ?auto_108878 ?auto_108879 ) ( ON ?auto_108877 ?auto_108878 ) ( ON ?auto_108876 ?auto_108877 ) ( ON ?auto_108875 ?auto_108876 ) ( ON ?auto_108874 ?auto_108875 ) ( CLEAR ?auto_108874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_108874 )
      ( MAKE-11PILE ?auto_108874 ?auto_108875 ?auto_108876 ?auto_108877 ?auto_108878 ?auto_108879 ?auto_108880 ?auto_108881 ?auto_108882 ?auto_108883 ?auto_108884 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_108896 - BLOCK
      ?auto_108897 - BLOCK
      ?auto_108898 - BLOCK
      ?auto_108899 - BLOCK
      ?auto_108900 - BLOCK
      ?auto_108901 - BLOCK
      ?auto_108902 - BLOCK
      ?auto_108903 - BLOCK
      ?auto_108904 - BLOCK
      ?auto_108905 - BLOCK
      ?auto_108906 - BLOCK
    )
    :vars
    (
      ?auto_108907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_108896 ?auto_108897 ) ) ( not ( = ?auto_108896 ?auto_108898 ) ) ( not ( = ?auto_108896 ?auto_108899 ) ) ( not ( = ?auto_108896 ?auto_108900 ) ) ( not ( = ?auto_108896 ?auto_108901 ) ) ( not ( = ?auto_108896 ?auto_108902 ) ) ( not ( = ?auto_108896 ?auto_108903 ) ) ( not ( = ?auto_108896 ?auto_108904 ) ) ( not ( = ?auto_108896 ?auto_108905 ) ) ( not ( = ?auto_108896 ?auto_108906 ) ) ( not ( = ?auto_108897 ?auto_108898 ) ) ( not ( = ?auto_108897 ?auto_108899 ) ) ( not ( = ?auto_108897 ?auto_108900 ) ) ( not ( = ?auto_108897 ?auto_108901 ) ) ( not ( = ?auto_108897 ?auto_108902 ) ) ( not ( = ?auto_108897 ?auto_108903 ) ) ( not ( = ?auto_108897 ?auto_108904 ) ) ( not ( = ?auto_108897 ?auto_108905 ) ) ( not ( = ?auto_108897 ?auto_108906 ) ) ( not ( = ?auto_108898 ?auto_108899 ) ) ( not ( = ?auto_108898 ?auto_108900 ) ) ( not ( = ?auto_108898 ?auto_108901 ) ) ( not ( = ?auto_108898 ?auto_108902 ) ) ( not ( = ?auto_108898 ?auto_108903 ) ) ( not ( = ?auto_108898 ?auto_108904 ) ) ( not ( = ?auto_108898 ?auto_108905 ) ) ( not ( = ?auto_108898 ?auto_108906 ) ) ( not ( = ?auto_108899 ?auto_108900 ) ) ( not ( = ?auto_108899 ?auto_108901 ) ) ( not ( = ?auto_108899 ?auto_108902 ) ) ( not ( = ?auto_108899 ?auto_108903 ) ) ( not ( = ?auto_108899 ?auto_108904 ) ) ( not ( = ?auto_108899 ?auto_108905 ) ) ( not ( = ?auto_108899 ?auto_108906 ) ) ( not ( = ?auto_108900 ?auto_108901 ) ) ( not ( = ?auto_108900 ?auto_108902 ) ) ( not ( = ?auto_108900 ?auto_108903 ) ) ( not ( = ?auto_108900 ?auto_108904 ) ) ( not ( = ?auto_108900 ?auto_108905 ) ) ( not ( = ?auto_108900 ?auto_108906 ) ) ( not ( = ?auto_108901 ?auto_108902 ) ) ( not ( = ?auto_108901 ?auto_108903 ) ) ( not ( = ?auto_108901 ?auto_108904 ) ) ( not ( = ?auto_108901 ?auto_108905 ) ) ( not ( = ?auto_108901 ?auto_108906 ) ) ( not ( = ?auto_108902 ?auto_108903 ) ) ( not ( = ?auto_108902 ?auto_108904 ) ) ( not ( = ?auto_108902 ?auto_108905 ) ) ( not ( = ?auto_108902 ?auto_108906 ) ) ( not ( = ?auto_108903 ?auto_108904 ) ) ( not ( = ?auto_108903 ?auto_108905 ) ) ( not ( = ?auto_108903 ?auto_108906 ) ) ( not ( = ?auto_108904 ?auto_108905 ) ) ( not ( = ?auto_108904 ?auto_108906 ) ) ( not ( = ?auto_108905 ?auto_108906 ) ) ( ON ?auto_108896 ?auto_108907 ) ( not ( = ?auto_108906 ?auto_108907 ) ) ( not ( = ?auto_108905 ?auto_108907 ) ) ( not ( = ?auto_108904 ?auto_108907 ) ) ( not ( = ?auto_108903 ?auto_108907 ) ) ( not ( = ?auto_108902 ?auto_108907 ) ) ( not ( = ?auto_108901 ?auto_108907 ) ) ( not ( = ?auto_108900 ?auto_108907 ) ) ( not ( = ?auto_108899 ?auto_108907 ) ) ( not ( = ?auto_108898 ?auto_108907 ) ) ( not ( = ?auto_108897 ?auto_108907 ) ) ( not ( = ?auto_108896 ?auto_108907 ) ) ( ON ?auto_108897 ?auto_108896 ) ( ON ?auto_108898 ?auto_108897 ) ( ON ?auto_108899 ?auto_108898 ) ( ON ?auto_108900 ?auto_108899 ) ( ON ?auto_108901 ?auto_108900 ) ( ON ?auto_108902 ?auto_108901 ) ( ON ?auto_108903 ?auto_108902 ) ( ON ?auto_108904 ?auto_108903 ) ( ON ?auto_108905 ?auto_108904 ) ( ON ?auto_108906 ?auto_108905 ) ( CLEAR ?auto_108906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_108906 ?auto_108905 ?auto_108904 ?auto_108903 ?auto_108902 ?auto_108901 ?auto_108900 ?auto_108899 ?auto_108898 ?auto_108897 ?auto_108896 )
      ( MAKE-11PILE ?auto_108896 ?auto_108897 ?auto_108898 ?auto_108899 ?auto_108900 ?auto_108901 ?auto_108902 ?auto_108903 ?auto_108904 ?auto_108905 ?auto_108906 ) )
  )

)

