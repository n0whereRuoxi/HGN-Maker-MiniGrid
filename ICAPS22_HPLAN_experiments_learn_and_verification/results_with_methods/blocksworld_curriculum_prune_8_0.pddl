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
      ?auto_30781 - BLOCK
    )
    :vars
    (
      ?auto_30782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30781 ?auto_30782 ) ( CLEAR ?auto_30781 ) ( HAND-EMPTY ) ( not ( = ?auto_30781 ?auto_30782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30781 ?auto_30782 )
      ( !PUTDOWN ?auto_30781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30788 - BLOCK
      ?auto_30789 - BLOCK
    )
    :vars
    (
      ?auto_30790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30788 ) ( ON ?auto_30789 ?auto_30790 ) ( CLEAR ?auto_30789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30788 ) ( not ( = ?auto_30788 ?auto_30789 ) ) ( not ( = ?auto_30788 ?auto_30790 ) ) ( not ( = ?auto_30789 ?auto_30790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30789 ?auto_30790 )
      ( !STACK ?auto_30789 ?auto_30788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30798 - BLOCK
      ?auto_30799 - BLOCK
    )
    :vars
    (
      ?auto_30800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30799 ?auto_30800 ) ( not ( = ?auto_30798 ?auto_30799 ) ) ( not ( = ?auto_30798 ?auto_30800 ) ) ( not ( = ?auto_30799 ?auto_30800 ) ) ( ON ?auto_30798 ?auto_30799 ) ( CLEAR ?auto_30798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30798 )
      ( MAKE-2PILE ?auto_30798 ?auto_30799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30809 - BLOCK
      ?auto_30810 - BLOCK
      ?auto_30811 - BLOCK
    )
    :vars
    (
      ?auto_30812 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30810 ) ( ON ?auto_30811 ?auto_30812 ) ( CLEAR ?auto_30811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30809 ) ( ON ?auto_30810 ?auto_30809 ) ( not ( = ?auto_30809 ?auto_30810 ) ) ( not ( = ?auto_30809 ?auto_30811 ) ) ( not ( = ?auto_30809 ?auto_30812 ) ) ( not ( = ?auto_30810 ?auto_30811 ) ) ( not ( = ?auto_30810 ?auto_30812 ) ) ( not ( = ?auto_30811 ?auto_30812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30811 ?auto_30812 )
      ( !STACK ?auto_30811 ?auto_30810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30823 - BLOCK
      ?auto_30824 - BLOCK
      ?auto_30825 - BLOCK
    )
    :vars
    (
      ?auto_30826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30825 ?auto_30826 ) ( ON-TABLE ?auto_30823 ) ( not ( = ?auto_30823 ?auto_30824 ) ) ( not ( = ?auto_30823 ?auto_30825 ) ) ( not ( = ?auto_30823 ?auto_30826 ) ) ( not ( = ?auto_30824 ?auto_30825 ) ) ( not ( = ?auto_30824 ?auto_30826 ) ) ( not ( = ?auto_30825 ?auto_30826 ) ) ( CLEAR ?auto_30823 ) ( ON ?auto_30824 ?auto_30825 ) ( CLEAR ?auto_30824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30823 ?auto_30824 )
      ( MAKE-3PILE ?auto_30823 ?auto_30824 ?auto_30825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30837 - BLOCK
      ?auto_30838 - BLOCK
      ?auto_30839 - BLOCK
    )
    :vars
    (
      ?auto_30840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30839 ?auto_30840 ) ( not ( = ?auto_30837 ?auto_30838 ) ) ( not ( = ?auto_30837 ?auto_30839 ) ) ( not ( = ?auto_30837 ?auto_30840 ) ) ( not ( = ?auto_30838 ?auto_30839 ) ) ( not ( = ?auto_30838 ?auto_30840 ) ) ( not ( = ?auto_30839 ?auto_30840 ) ) ( ON ?auto_30838 ?auto_30839 ) ( ON ?auto_30837 ?auto_30838 ) ( CLEAR ?auto_30837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30837 )
      ( MAKE-3PILE ?auto_30837 ?auto_30838 ?auto_30839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30852 - BLOCK
      ?auto_30853 - BLOCK
      ?auto_30854 - BLOCK
      ?auto_30855 - BLOCK
    )
    :vars
    (
      ?auto_30856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30854 ) ( ON ?auto_30855 ?auto_30856 ) ( CLEAR ?auto_30855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30852 ) ( ON ?auto_30853 ?auto_30852 ) ( ON ?auto_30854 ?auto_30853 ) ( not ( = ?auto_30852 ?auto_30853 ) ) ( not ( = ?auto_30852 ?auto_30854 ) ) ( not ( = ?auto_30852 ?auto_30855 ) ) ( not ( = ?auto_30852 ?auto_30856 ) ) ( not ( = ?auto_30853 ?auto_30854 ) ) ( not ( = ?auto_30853 ?auto_30855 ) ) ( not ( = ?auto_30853 ?auto_30856 ) ) ( not ( = ?auto_30854 ?auto_30855 ) ) ( not ( = ?auto_30854 ?auto_30856 ) ) ( not ( = ?auto_30855 ?auto_30856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30855 ?auto_30856 )
      ( !STACK ?auto_30855 ?auto_30854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30870 - BLOCK
      ?auto_30871 - BLOCK
      ?auto_30872 - BLOCK
      ?auto_30873 - BLOCK
    )
    :vars
    (
      ?auto_30874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30873 ?auto_30874 ) ( ON-TABLE ?auto_30870 ) ( ON ?auto_30871 ?auto_30870 ) ( not ( = ?auto_30870 ?auto_30871 ) ) ( not ( = ?auto_30870 ?auto_30872 ) ) ( not ( = ?auto_30870 ?auto_30873 ) ) ( not ( = ?auto_30870 ?auto_30874 ) ) ( not ( = ?auto_30871 ?auto_30872 ) ) ( not ( = ?auto_30871 ?auto_30873 ) ) ( not ( = ?auto_30871 ?auto_30874 ) ) ( not ( = ?auto_30872 ?auto_30873 ) ) ( not ( = ?auto_30872 ?auto_30874 ) ) ( not ( = ?auto_30873 ?auto_30874 ) ) ( CLEAR ?auto_30871 ) ( ON ?auto_30872 ?auto_30873 ) ( CLEAR ?auto_30872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30870 ?auto_30871 ?auto_30872 )
      ( MAKE-4PILE ?auto_30870 ?auto_30871 ?auto_30872 ?auto_30873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30888 - BLOCK
      ?auto_30889 - BLOCK
      ?auto_30890 - BLOCK
      ?auto_30891 - BLOCK
    )
    :vars
    (
      ?auto_30892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30891 ?auto_30892 ) ( ON-TABLE ?auto_30888 ) ( not ( = ?auto_30888 ?auto_30889 ) ) ( not ( = ?auto_30888 ?auto_30890 ) ) ( not ( = ?auto_30888 ?auto_30891 ) ) ( not ( = ?auto_30888 ?auto_30892 ) ) ( not ( = ?auto_30889 ?auto_30890 ) ) ( not ( = ?auto_30889 ?auto_30891 ) ) ( not ( = ?auto_30889 ?auto_30892 ) ) ( not ( = ?auto_30890 ?auto_30891 ) ) ( not ( = ?auto_30890 ?auto_30892 ) ) ( not ( = ?auto_30891 ?auto_30892 ) ) ( ON ?auto_30890 ?auto_30891 ) ( CLEAR ?auto_30888 ) ( ON ?auto_30889 ?auto_30890 ) ( CLEAR ?auto_30889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30888 ?auto_30889 )
      ( MAKE-4PILE ?auto_30888 ?auto_30889 ?auto_30890 ?auto_30891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30906 - BLOCK
      ?auto_30907 - BLOCK
      ?auto_30908 - BLOCK
      ?auto_30909 - BLOCK
    )
    :vars
    (
      ?auto_30910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30909 ?auto_30910 ) ( not ( = ?auto_30906 ?auto_30907 ) ) ( not ( = ?auto_30906 ?auto_30908 ) ) ( not ( = ?auto_30906 ?auto_30909 ) ) ( not ( = ?auto_30906 ?auto_30910 ) ) ( not ( = ?auto_30907 ?auto_30908 ) ) ( not ( = ?auto_30907 ?auto_30909 ) ) ( not ( = ?auto_30907 ?auto_30910 ) ) ( not ( = ?auto_30908 ?auto_30909 ) ) ( not ( = ?auto_30908 ?auto_30910 ) ) ( not ( = ?auto_30909 ?auto_30910 ) ) ( ON ?auto_30908 ?auto_30909 ) ( ON ?auto_30907 ?auto_30908 ) ( ON ?auto_30906 ?auto_30907 ) ( CLEAR ?auto_30906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30906 )
      ( MAKE-4PILE ?auto_30906 ?auto_30907 ?auto_30908 ?auto_30909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30925 - BLOCK
      ?auto_30926 - BLOCK
      ?auto_30927 - BLOCK
      ?auto_30928 - BLOCK
      ?auto_30929 - BLOCK
    )
    :vars
    (
      ?auto_30930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30928 ) ( ON ?auto_30929 ?auto_30930 ) ( CLEAR ?auto_30929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30925 ) ( ON ?auto_30926 ?auto_30925 ) ( ON ?auto_30927 ?auto_30926 ) ( ON ?auto_30928 ?auto_30927 ) ( not ( = ?auto_30925 ?auto_30926 ) ) ( not ( = ?auto_30925 ?auto_30927 ) ) ( not ( = ?auto_30925 ?auto_30928 ) ) ( not ( = ?auto_30925 ?auto_30929 ) ) ( not ( = ?auto_30925 ?auto_30930 ) ) ( not ( = ?auto_30926 ?auto_30927 ) ) ( not ( = ?auto_30926 ?auto_30928 ) ) ( not ( = ?auto_30926 ?auto_30929 ) ) ( not ( = ?auto_30926 ?auto_30930 ) ) ( not ( = ?auto_30927 ?auto_30928 ) ) ( not ( = ?auto_30927 ?auto_30929 ) ) ( not ( = ?auto_30927 ?auto_30930 ) ) ( not ( = ?auto_30928 ?auto_30929 ) ) ( not ( = ?auto_30928 ?auto_30930 ) ) ( not ( = ?auto_30929 ?auto_30930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30929 ?auto_30930 )
      ( !STACK ?auto_30929 ?auto_30928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30947 - BLOCK
      ?auto_30948 - BLOCK
      ?auto_30949 - BLOCK
      ?auto_30950 - BLOCK
      ?auto_30951 - BLOCK
    )
    :vars
    (
      ?auto_30952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30951 ?auto_30952 ) ( ON-TABLE ?auto_30947 ) ( ON ?auto_30948 ?auto_30947 ) ( ON ?auto_30949 ?auto_30948 ) ( not ( = ?auto_30947 ?auto_30948 ) ) ( not ( = ?auto_30947 ?auto_30949 ) ) ( not ( = ?auto_30947 ?auto_30950 ) ) ( not ( = ?auto_30947 ?auto_30951 ) ) ( not ( = ?auto_30947 ?auto_30952 ) ) ( not ( = ?auto_30948 ?auto_30949 ) ) ( not ( = ?auto_30948 ?auto_30950 ) ) ( not ( = ?auto_30948 ?auto_30951 ) ) ( not ( = ?auto_30948 ?auto_30952 ) ) ( not ( = ?auto_30949 ?auto_30950 ) ) ( not ( = ?auto_30949 ?auto_30951 ) ) ( not ( = ?auto_30949 ?auto_30952 ) ) ( not ( = ?auto_30950 ?auto_30951 ) ) ( not ( = ?auto_30950 ?auto_30952 ) ) ( not ( = ?auto_30951 ?auto_30952 ) ) ( CLEAR ?auto_30949 ) ( ON ?auto_30950 ?auto_30951 ) ( CLEAR ?auto_30950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30947 ?auto_30948 ?auto_30949 ?auto_30950 )
      ( MAKE-5PILE ?auto_30947 ?auto_30948 ?auto_30949 ?auto_30950 ?auto_30951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30969 - BLOCK
      ?auto_30970 - BLOCK
      ?auto_30971 - BLOCK
      ?auto_30972 - BLOCK
      ?auto_30973 - BLOCK
    )
    :vars
    (
      ?auto_30974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30973 ?auto_30974 ) ( ON-TABLE ?auto_30969 ) ( ON ?auto_30970 ?auto_30969 ) ( not ( = ?auto_30969 ?auto_30970 ) ) ( not ( = ?auto_30969 ?auto_30971 ) ) ( not ( = ?auto_30969 ?auto_30972 ) ) ( not ( = ?auto_30969 ?auto_30973 ) ) ( not ( = ?auto_30969 ?auto_30974 ) ) ( not ( = ?auto_30970 ?auto_30971 ) ) ( not ( = ?auto_30970 ?auto_30972 ) ) ( not ( = ?auto_30970 ?auto_30973 ) ) ( not ( = ?auto_30970 ?auto_30974 ) ) ( not ( = ?auto_30971 ?auto_30972 ) ) ( not ( = ?auto_30971 ?auto_30973 ) ) ( not ( = ?auto_30971 ?auto_30974 ) ) ( not ( = ?auto_30972 ?auto_30973 ) ) ( not ( = ?auto_30972 ?auto_30974 ) ) ( not ( = ?auto_30973 ?auto_30974 ) ) ( ON ?auto_30972 ?auto_30973 ) ( CLEAR ?auto_30970 ) ( ON ?auto_30971 ?auto_30972 ) ( CLEAR ?auto_30971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30969 ?auto_30970 ?auto_30971 )
      ( MAKE-5PILE ?auto_30969 ?auto_30970 ?auto_30971 ?auto_30972 ?auto_30973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30991 - BLOCK
      ?auto_30992 - BLOCK
      ?auto_30993 - BLOCK
      ?auto_30994 - BLOCK
      ?auto_30995 - BLOCK
    )
    :vars
    (
      ?auto_30996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30995 ?auto_30996 ) ( ON-TABLE ?auto_30991 ) ( not ( = ?auto_30991 ?auto_30992 ) ) ( not ( = ?auto_30991 ?auto_30993 ) ) ( not ( = ?auto_30991 ?auto_30994 ) ) ( not ( = ?auto_30991 ?auto_30995 ) ) ( not ( = ?auto_30991 ?auto_30996 ) ) ( not ( = ?auto_30992 ?auto_30993 ) ) ( not ( = ?auto_30992 ?auto_30994 ) ) ( not ( = ?auto_30992 ?auto_30995 ) ) ( not ( = ?auto_30992 ?auto_30996 ) ) ( not ( = ?auto_30993 ?auto_30994 ) ) ( not ( = ?auto_30993 ?auto_30995 ) ) ( not ( = ?auto_30993 ?auto_30996 ) ) ( not ( = ?auto_30994 ?auto_30995 ) ) ( not ( = ?auto_30994 ?auto_30996 ) ) ( not ( = ?auto_30995 ?auto_30996 ) ) ( ON ?auto_30994 ?auto_30995 ) ( ON ?auto_30993 ?auto_30994 ) ( CLEAR ?auto_30991 ) ( ON ?auto_30992 ?auto_30993 ) ( CLEAR ?auto_30992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30991 ?auto_30992 )
      ( MAKE-5PILE ?auto_30991 ?auto_30992 ?auto_30993 ?auto_30994 ?auto_30995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31013 - BLOCK
      ?auto_31014 - BLOCK
      ?auto_31015 - BLOCK
      ?auto_31016 - BLOCK
      ?auto_31017 - BLOCK
    )
    :vars
    (
      ?auto_31018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31017 ?auto_31018 ) ( not ( = ?auto_31013 ?auto_31014 ) ) ( not ( = ?auto_31013 ?auto_31015 ) ) ( not ( = ?auto_31013 ?auto_31016 ) ) ( not ( = ?auto_31013 ?auto_31017 ) ) ( not ( = ?auto_31013 ?auto_31018 ) ) ( not ( = ?auto_31014 ?auto_31015 ) ) ( not ( = ?auto_31014 ?auto_31016 ) ) ( not ( = ?auto_31014 ?auto_31017 ) ) ( not ( = ?auto_31014 ?auto_31018 ) ) ( not ( = ?auto_31015 ?auto_31016 ) ) ( not ( = ?auto_31015 ?auto_31017 ) ) ( not ( = ?auto_31015 ?auto_31018 ) ) ( not ( = ?auto_31016 ?auto_31017 ) ) ( not ( = ?auto_31016 ?auto_31018 ) ) ( not ( = ?auto_31017 ?auto_31018 ) ) ( ON ?auto_31016 ?auto_31017 ) ( ON ?auto_31015 ?auto_31016 ) ( ON ?auto_31014 ?auto_31015 ) ( ON ?auto_31013 ?auto_31014 ) ( CLEAR ?auto_31013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31013 )
      ( MAKE-5PILE ?auto_31013 ?auto_31014 ?auto_31015 ?auto_31016 ?auto_31017 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31036 - BLOCK
      ?auto_31037 - BLOCK
      ?auto_31038 - BLOCK
      ?auto_31039 - BLOCK
      ?auto_31040 - BLOCK
      ?auto_31041 - BLOCK
    )
    :vars
    (
      ?auto_31042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31040 ) ( ON ?auto_31041 ?auto_31042 ) ( CLEAR ?auto_31041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31036 ) ( ON ?auto_31037 ?auto_31036 ) ( ON ?auto_31038 ?auto_31037 ) ( ON ?auto_31039 ?auto_31038 ) ( ON ?auto_31040 ?auto_31039 ) ( not ( = ?auto_31036 ?auto_31037 ) ) ( not ( = ?auto_31036 ?auto_31038 ) ) ( not ( = ?auto_31036 ?auto_31039 ) ) ( not ( = ?auto_31036 ?auto_31040 ) ) ( not ( = ?auto_31036 ?auto_31041 ) ) ( not ( = ?auto_31036 ?auto_31042 ) ) ( not ( = ?auto_31037 ?auto_31038 ) ) ( not ( = ?auto_31037 ?auto_31039 ) ) ( not ( = ?auto_31037 ?auto_31040 ) ) ( not ( = ?auto_31037 ?auto_31041 ) ) ( not ( = ?auto_31037 ?auto_31042 ) ) ( not ( = ?auto_31038 ?auto_31039 ) ) ( not ( = ?auto_31038 ?auto_31040 ) ) ( not ( = ?auto_31038 ?auto_31041 ) ) ( not ( = ?auto_31038 ?auto_31042 ) ) ( not ( = ?auto_31039 ?auto_31040 ) ) ( not ( = ?auto_31039 ?auto_31041 ) ) ( not ( = ?auto_31039 ?auto_31042 ) ) ( not ( = ?auto_31040 ?auto_31041 ) ) ( not ( = ?auto_31040 ?auto_31042 ) ) ( not ( = ?auto_31041 ?auto_31042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31041 ?auto_31042 )
      ( !STACK ?auto_31041 ?auto_31040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31062 - BLOCK
      ?auto_31063 - BLOCK
      ?auto_31064 - BLOCK
      ?auto_31065 - BLOCK
      ?auto_31066 - BLOCK
      ?auto_31067 - BLOCK
    )
    :vars
    (
      ?auto_31068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31067 ?auto_31068 ) ( ON-TABLE ?auto_31062 ) ( ON ?auto_31063 ?auto_31062 ) ( ON ?auto_31064 ?auto_31063 ) ( ON ?auto_31065 ?auto_31064 ) ( not ( = ?auto_31062 ?auto_31063 ) ) ( not ( = ?auto_31062 ?auto_31064 ) ) ( not ( = ?auto_31062 ?auto_31065 ) ) ( not ( = ?auto_31062 ?auto_31066 ) ) ( not ( = ?auto_31062 ?auto_31067 ) ) ( not ( = ?auto_31062 ?auto_31068 ) ) ( not ( = ?auto_31063 ?auto_31064 ) ) ( not ( = ?auto_31063 ?auto_31065 ) ) ( not ( = ?auto_31063 ?auto_31066 ) ) ( not ( = ?auto_31063 ?auto_31067 ) ) ( not ( = ?auto_31063 ?auto_31068 ) ) ( not ( = ?auto_31064 ?auto_31065 ) ) ( not ( = ?auto_31064 ?auto_31066 ) ) ( not ( = ?auto_31064 ?auto_31067 ) ) ( not ( = ?auto_31064 ?auto_31068 ) ) ( not ( = ?auto_31065 ?auto_31066 ) ) ( not ( = ?auto_31065 ?auto_31067 ) ) ( not ( = ?auto_31065 ?auto_31068 ) ) ( not ( = ?auto_31066 ?auto_31067 ) ) ( not ( = ?auto_31066 ?auto_31068 ) ) ( not ( = ?auto_31067 ?auto_31068 ) ) ( CLEAR ?auto_31065 ) ( ON ?auto_31066 ?auto_31067 ) ( CLEAR ?auto_31066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31062 ?auto_31063 ?auto_31064 ?auto_31065 ?auto_31066 )
      ( MAKE-6PILE ?auto_31062 ?auto_31063 ?auto_31064 ?auto_31065 ?auto_31066 ?auto_31067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31088 - BLOCK
      ?auto_31089 - BLOCK
      ?auto_31090 - BLOCK
      ?auto_31091 - BLOCK
      ?auto_31092 - BLOCK
      ?auto_31093 - BLOCK
    )
    :vars
    (
      ?auto_31094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31093 ?auto_31094 ) ( ON-TABLE ?auto_31088 ) ( ON ?auto_31089 ?auto_31088 ) ( ON ?auto_31090 ?auto_31089 ) ( not ( = ?auto_31088 ?auto_31089 ) ) ( not ( = ?auto_31088 ?auto_31090 ) ) ( not ( = ?auto_31088 ?auto_31091 ) ) ( not ( = ?auto_31088 ?auto_31092 ) ) ( not ( = ?auto_31088 ?auto_31093 ) ) ( not ( = ?auto_31088 ?auto_31094 ) ) ( not ( = ?auto_31089 ?auto_31090 ) ) ( not ( = ?auto_31089 ?auto_31091 ) ) ( not ( = ?auto_31089 ?auto_31092 ) ) ( not ( = ?auto_31089 ?auto_31093 ) ) ( not ( = ?auto_31089 ?auto_31094 ) ) ( not ( = ?auto_31090 ?auto_31091 ) ) ( not ( = ?auto_31090 ?auto_31092 ) ) ( not ( = ?auto_31090 ?auto_31093 ) ) ( not ( = ?auto_31090 ?auto_31094 ) ) ( not ( = ?auto_31091 ?auto_31092 ) ) ( not ( = ?auto_31091 ?auto_31093 ) ) ( not ( = ?auto_31091 ?auto_31094 ) ) ( not ( = ?auto_31092 ?auto_31093 ) ) ( not ( = ?auto_31092 ?auto_31094 ) ) ( not ( = ?auto_31093 ?auto_31094 ) ) ( ON ?auto_31092 ?auto_31093 ) ( CLEAR ?auto_31090 ) ( ON ?auto_31091 ?auto_31092 ) ( CLEAR ?auto_31091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31088 ?auto_31089 ?auto_31090 ?auto_31091 )
      ( MAKE-6PILE ?auto_31088 ?auto_31089 ?auto_31090 ?auto_31091 ?auto_31092 ?auto_31093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31114 - BLOCK
      ?auto_31115 - BLOCK
      ?auto_31116 - BLOCK
      ?auto_31117 - BLOCK
      ?auto_31118 - BLOCK
      ?auto_31119 - BLOCK
    )
    :vars
    (
      ?auto_31120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31119 ?auto_31120 ) ( ON-TABLE ?auto_31114 ) ( ON ?auto_31115 ?auto_31114 ) ( not ( = ?auto_31114 ?auto_31115 ) ) ( not ( = ?auto_31114 ?auto_31116 ) ) ( not ( = ?auto_31114 ?auto_31117 ) ) ( not ( = ?auto_31114 ?auto_31118 ) ) ( not ( = ?auto_31114 ?auto_31119 ) ) ( not ( = ?auto_31114 ?auto_31120 ) ) ( not ( = ?auto_31115 ?auto_31116 ) ) ( not ( = ?auto_31115 ?auto_31117 ) ) ( not ( = ?auto_31115 ?auto_31118 ) ) ( not ( = ?auto_31115 ?auto_31119 ) ) ( not ( = ?auto_31115 ?auto_31120 ) ) ( not ( = ?auto_31116 ?auto_31117 ) ) ( not ( = ?auto_31116 ?auto_31118 ) ) ( not ( = ?auto_31116 ?auto_31119 ) ) ( not ( = ?auto_31116 ?auto_31120 ) ) ( not ( = ?auto_31117 ?auto_31118 ) ) ( not ( = ?auto_31117 ?auto_31119 ) ) ( not ( = ?auto_31117 ?auto_31120 ) ) ( not ( = ?auto_31118 ?auto_31119 ) ) ( not ( = ?auto_31118 ?auto_31120 ) ) ( not ( = ?auto_31119 ?auto_31120 ) ) ( ON ?auto_31118 ?auto_31119 ) ( ON ?auto_31117 ?auto_31118 ) ( CLEAR ?auto_31115 ) ( ON ?auto_31116 ?auto_31117 ) ( CLEAR ?auto_31116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31114 ?auto_31115 ?auto_31116 )
      ( MAKE-6PILE ?auto_31114 ?auto_31115 ?auto_31116 ?auto_31117 ?auto_31118 ?auto_31119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31140 - BLOCK
      ?auto_31141 - BLOCK
      ?auto_31142 - BLOCK
      ?auto_31143 - BLOCK
      ?auto_31144 - BLOCK
      ?auto_31145 - BLOCK
    )
    :vars
    (
      ?auto_31146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31145 ?auto_31146 ) ( ON-TABLE ?auto_31140 ) ( not ( = ?auto_31140 ?auto_31141 ) ) ( not ( = ?auto_31140 ?auto_31142 ) ) ( not ( = ?auto_31140 ?auto_31143 ) ) ( not ( = ?auto_31140 ?auto_31144 ) ) ( not ( = ?auto_31140 ?auto_31145 ) ) ( not ( = ?auto_31140 ?auto_31146 ) ) ( not ( = ?auto_31141 ?auto_31142 ) ) ( not ( = ?auto_31141 ?auto_31143 ) ) ( not ( = ?auto_31141 ?auto_31144 ) ) ( not ( = ?auto_31141 ?auto_31145 ) ) ( not ( = ?auto_31141 ?auto_31146 ) ) ( not ( = ?auto_31142 ?auto_31143 ) ) ( not ( = ?auto_31142 ?auto_31144 ) ) ( not ( = ?auto_31142 ?auto_31145 ) ) ( not ( = ?auto_31142 ?auto_31146 ) ) ( not ( = ?auto_31143 ?auto_31144 ) ) ( not ( = ?auto_31143 ?auto_31145 ) ) ( not ( = ?auto_31143 ?auto_31146 ) ) ( not ( = ?auto_31144 ?auto_31145 ) ) ( not ( = ?auto_31144 ?auto_31146 ) ) ( not ( = ?auto_31145 ?auto_31146 ) ) ( ON ?auto_31144 ?auto_31145 ) ( ON ?auto_31143 ?auto_31144 ) ( ON ?auto_31142 ?auto_31143 ) ( CLEAR ?auto_31140 ) ( ON ?auto_31141 ?auto_31142 ) ( CLEAR ?auto_31141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31140 ?auto_31141 )
      ( MAKE-6PILE ?auto_31140 ?auto_31141 ?auto_31142 ?auto_31143 ?auto_31144 ?auto_31145 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_31166 - BLOCK
      ?auto_31167 - BLOCK
      ?auto_31168 - BLOCK
      ?auto_31169 - BLOCK
      ?auto_31170 - BLOCK
      ?auto_31171 - BLOCK
    )
    :vars
    (
      ?auto_31172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31171 ?auto_31172 ) ( not ( = ?auto_31166 ?auto_31167 ) ) ( not ( = ?auto_31166 ?auto_31168 ) ) ( not ( = ?auto_31166 ?auto_31169 ) ) ( not ( = ?auto_31166 ?auto_31170 ) ) ( not ( = ?auto_31166 ?auto_31171 ) ) ( not ( = ?auto_31166 ?auto_31172 ) ) ( not ( = ?auto_31167 ?auto_31168 ) ) ( not ( = ?auto_31167 ?auto_31169 ) ) ( not ( = ?auto_31167 ?auto_31170 ) ) ( not ( = ?auto_31167 ?auto_31171 ) ) ( not ( = ?auto_31167 ?auto_31172 ) ) ( not ( = ?auto_31168 ?auto_31169 ) ) ( not ( = ?auto_31168 ?auto_31170 ) ) ( not ( = ?auto_31168 ?auto_31171 ) ) ( not ( = ?auto_31168 ?auto_31172 ) ) ( not ( = ?auto_31169 ?auto_31170 ) ) ( not ( = ?auto_31169 ?auto_31171 ) ) ( not ( = ?auto_31169 ?auto_31172 ) ) ( not ( = ?auto_31170 ?auto_31171 ) ) ( not ( = ?auto_31170 ?auto_31172 ) ) ( not ( = ?auto_31171 ?auto_31172 ) ) ( ON ?auto_31170 ?auto_31171 ) ( ON ?auto_31169 ?auto_31170 ) ( ON ?auto_31168 ?auto_31169 ) ( ON ?auto_31167 ?auto_31168 ) ( ON ?auto_31166 ?auto_31167 ) ( CLEAR ?auto_31166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31166 )
      ( MAKE-6PILE ?auto_31166 ?auto_31167 ?auto_31168 ?auto_31169 ?auto_31170 ?auto_31171 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_31193 - BLOCK
      ?auto_31194 - BLOCK
      ?auto_31195 - BLOCK
      ?auto_31196 - BLOCK
      ?auto_31197 - BLOCK
      ?auto_31198 - BLOCK
      ?auto_31199 - BLOCK
    )
    :vars
    (
      ?auto_31200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31198 ) ( ON ?auto_31199 ?auto_31200 ) ( CLEAR ?auto_31199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31193 ) ( ON ?auto_31194 ?auto_31193 ) ( ON ?auto_31195 ?auto_31194 ) ( ON ?auto_31196 ?auto_31195 ) ( ON ?auto_31197 ?auto_31196 ) ( ON ?auto_31198 ?auto_31197 ) ( not ( = ?auto_31193 ?auto_31194 ) ) ( not ( = ?auto_31193 ?auto_31195 ) ) ( not ( = ?auto_31193 ?auto_31196 ) ) ( not ( = ?auto_31193 ?auto_31197 ) ) ( not ( = ?auto_31193 ?auto_31198 ) ) ( not ( = ?auto_31193 ?auto_31199 ) ) ( not ( = ?auto_31193 ?auto_31200 ) ) ( not ( = ?auto_31194 ?auto_31195 ) ) ( not ( = ?auto_31194 ?auto_31196 ) ) ( not ( = ?auto_31194 ?auto_31197 ) ) ( not ( = ?auto_31194 ?auto_31198 ) ) ( not ( = ?auto_31194 ?auto_31199 ) ) ( not ( = ?auto_31194 ?auto_31200 ) ) ( not ( = ?auto_31195 ?auto_31196 ) ) ( not ( = ?auto_31195 ?auto_31197 ) ) ( not ( = ?auto_31195 ?auto_31198 ) ) ( not ( = ?auto_31195 ?auto_31199 ) ) ( not ( = ?auto_31195 ?auto_31200 ) ) ( not ( = ?auto_31196 ?auto_31197 ) ) ( not ( = ?auto_31196 ?auto_31198 ) ) ( not ( = ?auto_31196 ?auto_31199 ) ) ( not ( = ?auto_31196 ?auto_31200 ) ) ( not ( = ?auto_31197 ?auto_31198 ) ) ( not ( = ?auto_31197 ?auto_31199 ) ) ( not ( = ?auto_31197 ?auto_31200 ) ) ( not ( = ?auto_31198 ?auto_31199 ) ) ( not ( = ?auto_31198 ?auto_31200 ) ) ( not ( = ?auto_31199 ?auto_31200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31199 ?auto_31200 )
      ( !STACK ?auto_31199 ?auto_31198 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_31223 - BLOCK
      ?auto_31224 - BLOCK
      ?auto_31225 - BLOCK
      ?auto_31226 - BLOCK
      ?auto_31227 - BLOCK
      ?auto_31228 - BLOCK
      ?auto_31229 - BLOCK
    )
    :vars
    (
      ?auto_31230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31229 ?auto_31230 ) ( ON-TABLE ?auto_31223 ) ( ON ?auto_31224 ?auto_31223 ) ( ON ?auto_31225 ?auto_31224 ) ( ON ?auto_31226 ?auto_31225 ) ( ON ?auto_31227 ?auto_31226 ) ( not ( = ?auto_31223 ?auto_31224 ) ) ( not ( = ?auto_31223 ?auto_31225 ) ) ( not ( = ?auto_31223 ?auto_31226 ) ) ( not ( = ?auto_31223 ?auto_31227 ) ) ( not ( = ?auto_31223 ?auto_31228 ) ) ( not ( = ?auto_31223 ?auto_31229 ) ) ( not ( = ?auto_31223 ?auto_31230 ) ) ( not ( = ?auto_31224 ?auto_31225 ) ) ( not ( = ?auto_31224 ?auto_31226 ) ) ( not ( = ?auto_31224 ?auto_31227 ) ) ( not ( = ?auto_31224 ?auto_31228 ) ) ( not ( = ?auto_31224 ?auto_31229 ) ) ( not ( = ?auto_31224 ?auto_31230 ) ) ( not ( = ?auto_31225 ?auto_31226 ) ) ( not ( = ?auto_31225 ?auto_31227 ) ) ( not ( = ?auto_31225 ?auto_31228 ) ) ( not ( = ?auto_31225 ?auto_31229 ) ) ( not ( = ?auto_31225 ?auto_31230 ) ) ( not ( = ?auto_31226 ?auto_31227 ) ) ( not ( = ?auto_31226 ?auto_31228 ) ) ( not ( = ?auto_31226 ?auto_31229 ) ) ( not ( = ?auto_31226 ?auto_31230 ) ) ( not ( = ?auto_31227 ?auto_31228 ) ) ( not ( = ?auto_31227 ?auto_31229 ) ) ( not ( = ?auto_31227 ?auto_31230 ) ) ( not ( = ?auto_31228 ?auto_31229 ) ) ( not ( = ?auto_31228 ?auto_31230 ) ) ( not ( = ?auto_31229 ?auto_31230 ) ) ( CLEAR ?auto_31227 ) ( ON ?auto_31228 ?auto_31229 ) ( CLEAR ?auto_31228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_31223 ?auto_31224 ?auto_31225 ?auto_31226 ?auto_31227 ?auto_31228 )
      ( MAKE-7PILE ?auto_31223 ?auto_31224 ?auto_31225 ?auto_31226 ?auto_31227 ?auto_31228 ?auto_31229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_31253 - BLOCK
      ?auto_31254 - BLOCK
      ?auto_31255 - BLOCK
      ?auto_31256 - BLOCK
      ?auto_31257 - BLOCK
      ?auto_31258 - BLOCK
      ?auto_31259 - BLOCK
    )
    :vars
    (
      ?auto_31260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31259 ?auto_31260 ) ( ON-TABLE ?auto_31253 ) ( ON ?auto_31254 ?auto_31253 ) ( ON ?auto_31255 ?auto_31254 ) ( ON ?auto_31256 ?auto_31255 ) ( not ( = ?auto_31253 ?auto_31254 ) ) ( not ( = ?auto_31253 ?auto_31255 ) ) ( not ( = ?auto_31253 ?auto_31256 ) ) ( not ( = ?auto_31253 ?auto_31257 ) ) ( not ( = ?auto_31253 ?auto_31258 ) ) ( not ( = ?auto_31253 ?auto_31259 ) ) ( not ( = ?auto_31253 ?auto_31260 ) ) ( not ( = ?auto_31254 ?auto_31255 ) ) ( not ( = ?auto_31254 ?auto_31256 ) ) ( not ( = ?auto_31254 ?auto_31257 ) ) ( not ( = ?auto_31254 ?auto_31258 ) ) ( not ( = ?auto_31254 ?auto_31259 ) ) ( not ( = ?auto_31254 ?auto_31260 ) ) ( not ( = ?auto_31255 ?auto_31256 ) ) ( not ( = ?auto_31255 ?auto_31257 ) ) ( not ( = ?auto_31255 ?auto_31258 ) ) ( not ( = ?auto_31255 ?auto_31259 ) ) ( not ( = ?auto_31255 ?auto_31260 ) ) ( not ( = ?auto_31256 ?auto_31257 ) ) ( not ( = ?auto_31256 ?auto_31258 ) ) ( not ( = ?auto_31256 ?auto_31259 ) ) ( not ( = ?auto_31256 ?auto_31260 ) ) ( not ( = ?auto_31257 ?auto_31258 ) ) ( not ( = ?auto_31257 ?auto_31259 ) ) ( not ( = ?auto_31257 ?auto_31260 ) ) ( not ( = ?auto_31258 ?auto_31259 ) ) ( not ( = ?auto_31258 ?auto_31260 ) ) ( not ( = ?auto_31259 ?auto_31260 ) ) ( ON ?auto_31258 ?auto_31259 ) ( CLEAR ?auto_31256 ) ( ON ?auto_31257 ?auto_31258 ) ( CLEAR ?auto_31257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31253 ?auto_31254 ?auto_31255 ?auto_31256 ?auto_31257 )
      ( MAKE-7PILE ?auto_31253 ?auto_31254 ?auto_31255 ?auto_31256 ?auto_31257 ?auto_31258 ?auto_31259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_31283 - BLOCK
      ?auto_31284 - BLOCK
      ?auto_31285 - BLOCK
      ?auto_31286 - BLOCK
      ?auto_31287 - BLOCK
      ?auto_31288 - BLOCK
      ?auto_31289 - BLOCK
    )
    :vars
    (
      ?auto_31290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31289 ?auto_31290 ) ( ON-TABLE ?auto_31283 ) ( ON ?auto_31284 ?auto_31283 ) ( ON ?auto_31285 ?auto_31284 ) ( not ( = ?auto_31283 ?auto_31284 ) ) ( not ( = ?auto_31283 ?auto_31285 ) ) ( not ( = ?auto_31283 ?auto_31286 ) ) ( not ( = ?auto_31283 ?auto_31287 ) ) ( not ( = ?auto_31283 ?auto_31288 ) ) ( not ( = ?auto_31283 ?auto_31289 ) ) ( not ( = ?auto_31283 ?auto_31290 ) ) ( not ( = ?auto_31284 ?auto_31285 ) ) ( not ( = ?auto_31284 ?auto_31286 ) ) ( not ( = ?auto_31284 ?auto_31287 ) ) ( not ( = ?auto_31284 ?auto_31288 ) ) ( not ( = ?auto_31284 ?auto_31289 ) ) ( not ( = ?auto_31284 ?auto_31290 ) ) ( not ( = ?auto_31285 ?auto_31286 ) ) ( not ( = ?auto_31285 ?auto_31287 ) ) ( not ( = ?auto_31285 ?auto_31288 ) ) ( not ( = ?auto_31285 ?auto_31289 ) ) ( not ( = ?auto_31285 ?auto_31290 ) ) ( not ( = ?auto_31286 ?auto_31287 ) ) ( not ( = ?auto_31286 ?auto_31288 ) ) ( not ( = ?auto_31286 ?auto_31289 ) ) ( not ( = ?auto_31286 ?auto_31290 ) ) ( not ( = ?auto_31287 ?auto_31288 ) ) ( not ( = ?auto_31287 ?auto_31289 ) ) ( not ( = ?auto_31287 ?auto_31290 ) ) ( not ( = ?auto_31288 ?auto_31289 ) ) ( not ( = ?auto_31288 ?auto_31290 ) ) ( not ( = ?auto_31289 ?auto_31290 ) ) ( ON ?auto_31288 ?auto_31289 ) ( ON ?auto_31287 ?auto_31288 ) ( CLEAR ?auto_31285 ) ( ON ?auto_31286 ?auto_31287 ) ( CLEAR ?auto_31286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31283 ?auto_31284 ?auto_31285 ?auto_31286 )
      ( MAKE-7PILE ?auto_31283 ?auto_31284 ?auto_31285 ?auto_31286 ?auto_31287 ?auto_31288 ?auto_31289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_31313 - BLOCK
      ?auto_31314 - BLOCK
      ?auto_31315 - BLOCK
      ?auto_31316 - BLOCK
      ?auto_31317 - BLOCK
      ?auto_31318 - BLOCK
      ?auto_31319 - BLOCK
    )
    :vars
    (
      ?auto_31320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31319 ?auto_31320 ) ( ON-TABLE ?auto_31313 ) ( ON ?auto_31314 ?auto_31313 ) ( not ( = ?auto_31313 ?auto_31314 ) ) ( not ( = ?auto_31313 ?auto_31315 ) ) ( not ( = ?auto_31313 ?auto_31316 ) ) ( not ( = ?auto_31313 ?auto_31317 ) ) ( not ( = ?auto_31313 ?auto_31318 ) ) ( not ( = ?auto_31313 ?auto_31319 ) ) ( not ( = ?auto_31313 ?auto_31320 ) ) ( not ( = ?auto_31314 ?auto_31315 ) ) ( not ( = ?auto_31314 ?auto_31316 ) ) ( not ( = ?auto_31314 ?auto_31317 ) ) ( not ( = ?auto_31314 ?auto_31318 ) ) ( not ( = ?auto_31314 ?auto_31319 ) ) ( not ( = ?auto_31314 ?auto_31320 ) ) ( not ( = ?auto_31315 ?auto_31316 ) ) ( not ( = ?auto_31315 ?auto_31317 ) ) ( not ( = ?auto_31315 ?auto_31318 ) ) ( not ( = ?auto_31315 ?auto_31319 ) ) ( not ( = ?auto_31315 ?auto_31320 ) ) ( not ( = ?auto_31316 ?auto_31317 ) ) ( not ( = ?auto_31316 ?auto_31318 ) ) ( not ( = ?auto_31316 ?auto_31319 ) ) ( not ( = ?auto_31316 ?auto_31320 ) ) ( not ( = ?auto_31317 ?auto_31318 ) ) ( not ( = ?auto_31317 ?auto_31319 ) ) ( not ( = ?auto_31317 ?auto_31320 ) ) ( not ( = ?auto_31318 ?auto_31319 ) ) ( not ( = ?auto_31318 ?auto_31320 ) ) ( not ( = ?auto_31319 ?auto_31320 ) ) ( ON ?auto_31318 ?auto_31319 ) ( ON ?auto_31317 ?auto_31318 ) ( ON ?auto_31316 ?auto_31317 ) ( CLEAR ?auto_31314 ) ( ON ?auto_31315 ?auto_31316 ) ( CLEAR ?auto_31315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31313 ?auto_31314 ?auto_31315 )
      ( MAKE-7PILE ?auto_31313 ?auto_31314 ?auto_31315 ?auto_31316 ?auto_31317 ?auto_31318 ?auto_31319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_31343 - BLOCK
      ?auto_31344 - BLOCK
      ?auto_31345 - BLOCK
      ?auto_31346 - BLOCK
      ?auto_31347 - BLOCK
      ?auto_31348 - BLOCK
      ?auto_31349 - BLOCK
    )
    :vars
    (
      ?auto_31350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31349 ?auto_31350 ) ( ON-TABLE ?auto_31343 ) ( not ( = ?auto_31343 ?auto_31344 ) ) ( not ( = ?auto_31343 ?auto_31345 ) ) ( not ( = ?auto_31343 ?auto_31346 ) ) ( not ( = ?auto_31343 ?auto_31347 ) ) ( not ( = ?auto_31343 ?auto_31348 ) ) ( not ( = ?auto_31343 ?auto_31349 ) ) ( not ( = ?auto_31343 ?auto_31350 ) ) ( not ( = ?auto_31344 ?auto_31345 ) ) ( not ( = ?auto_31344 ?auto_31346 ) ) ( not ( = ?auto_31344 ?auto_31347 ) ) ( not ( = ?auto_31344 ?auto_31348 ) ) ( not ( = ?auto_31344 ?auto_31349 ) ) ( not ( = ?auto_31344 ?auto_31350 ) ) ( not ( = ?auto_31345 ?auto_31346 ) ) ( not ( = ?auto_31345 ?auto_31347 ) ) ( not ( = ?auto_31345 ?auto_31348 ) ) ( not ( = ?auto_31345 ?auto_31349 ) ) ( not ( = ?auto_31345 ?auto_31350 ) ) ( not ( = ?auto_31346 ?auto_31347 ) ) ( not ( = ?auto_31346 ?auto_31348 ) ) ( not ( = ?auto_31346 ?auto_31349 ) ) ( not ( = ?auto_31346 ?auto_31350 ) ) ( not ( = ?auto_31347 ?auto_31348 ) ) ( not ( = ?auto_31347 ?auto_31349 ) ) ( not ( = ?auto_31347 ?auto_31350 ) ) ( not ( = ?auto_31348 ?auto_31349 ) ) ( not ( = ?auto_31348 ?auto_31350 ) ) ( not ( = ?auto_31349 ?auto_31350 ) ) ( ON ?auto_31348 ?auto_31349 ) ( ON ?auto_31347 ?auto_31348 ) ( ON ?auto_31346 ?auto_31347 ) ( ON ?auto_31345 ?auto_31346 ) ( CLEAR ?auto_31343 ) ( ON ?auto_31344 ?auto_31345 ) ( CLEAR ?auto_31344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31343 ?auto_31344 )
      ( MAKE-7PILE ?auto_31343 ?auto_31344 ?auto_31345 ?auto_31346 ?auto_31347 ?auto_31348 ?auto_31349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_31373 - BLOCK
      ?auto_31374 - BLOCK
      ?auto_31375 - BLOCK
      ?auto_31376 - BLOCK
      ?auto_31377 - BLOCK
      ?auto_31378 - BLOCK
      ?auto_31379 - BLOCK
    )
    :vars
    (
      ?auto_31380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31379 ?auto_31380 ) ( not ( = ?auto_31373 ?auto_31374 ) ) ( not ( = ?auto_31373 ?auto_31375 ) ) ( not ( = ?auto_31373 ?auto_31376 ) ) ( not ( = ?auto_31373 ?auto_31377 ) ) ( not ( = ?auto_31373 ?auto_31378 ) ) ( not ( = ?auto_31373 ?auto_31379 ) ) ( not ( = ?auto_31373 ?auto_31380 ) ) ( not ( = ?auto_31374 ?auto_31375 ) ) ( not ( = ?auto_31374 ?auto_31376 ) ) ( not ( = ?auto_31374 ?auto_31377 ) ) ( not ( = ?auto_31374 ?auto_31378 ) ) ( not ( = ?auto_31374 ?auto_31379 ) ) ( not ( = ?auto_31374 ?auto_31380 ) ) ( not ( = ?auto_31375 ?auto_31376 ) ) ( not ( = ?auto_31375 ?auto_31377 ) ) ( not ( = ?auto_31375 ?auto_31378 ) ) ( not ( = ?auto_31375 ?auto_31379 ) ) ( not ( = ?auto_31375 ?auto_31380 ) ) ( not ( = ?auto_31376 ?auto_31377 ) ) ( not ( = ?auto_31376 ?auto_31378 ) ) ( not ( = ?auto_31376 ?auto_31379 ) ) ( not ( = ?auto_31376 ?auto_31380 ) ) ( not ( = ?auto_31377 ?auto_31378 ) ) ( not ( = ?auto_31377 ?auto_31379 ) ) ( not ( = ?auto_31377 ?auto_31380 ) ) ( not ( = ?auto_31378 ?auto_31379 ) ) ( not ( = ?auto_31378 ?auto_31380 ) ) ( not ( = ?auto_31379 ?auto_31380 ) ) ( ON ?auto_31378 ?auto_31379 ) ( ON ?auto_31377 ?auto_31378 ) ( ON ?auto_31376 ?auto_31377 ) ( ON ?auto_31375 ?auto_31376 ) ( ON ?auto_31374 ?auto_31375 ) ( ON ?auto_31373 ?auto_31374 ) ( CLEAR ?auto_31373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31373 )
      ( MAKE-7PILE ?auto_31373 ?auto_31374 ?auto_31375 ?auto_31376 ?auto_31377 ?auto_31378 ?auto_31379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31404 - BLOCK
      ?auto_31405 - BLOCK
      ?auto_31406 - BLOCK
      ?auto_31407 - BLOCK
      ?auto_31408 - BLOCK
      ?auto_31409 - BLOCK
      ?auto_31410 - BLOCK
      ?auto_31411 - BLOCK
    )
    :vars
    (
      ?auto_31412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31410 ) ( ON ?auto_31411 ?auto_31412 ) ( CLEAR ?auto_31411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31404 ) ( ON ?auto_31405 ?auto_31404 ) ( ON ?auto_31406 ?auto_31405 ) ( ON ?auto_31407 ?auto_31406 ) ( ON ?auto_31408 ?auto_31407 ) ( ON ?auto_31409 ?auto_31408 ) ( ON ?auto_31410 ?auto_31409 ) ( not ( = ?auto_31404 ?auto_31405 ) ) ( not ( = ?auto_31404 ?auto_31406 ) ) ( not ( = ?auto_31404 ?auto_31407 ) ) ( not ( = ?auto_31404 ?auto_31408 ) ) ( not ( = ?auto_31404 ?auto_31409 ) ) ( not ( = ?auto_31404 ?auto_31410 ) ) ( not ( = ?auto_31404 ?auto_31411 ) ) ( not ( = ?auto_31404 ?auto_31412 ) ) ( not ( = ?auto_31405 ?auto_31406 ) ) ( not ( = ?auto_31405 ?auto_31407 ) ) ( not ( = ?auto_31405 ?auto_31408 ) ) ( not ( = ?auto_31405 ?auto_31409 ) ) ( not ( = ?auto_31405 ?auto_31410 ) ) ( not ( = ?auto_31405 ?auto_31411 ) ) ( not ( = ?auto_31405 ?auto_31412 ) ) ( not ( = ?auto_31406 ?auto_31407 ) ) ( not ( = ?auto_31406 ?auto_31408 ) ) ( not ( = ?auto_31406 ?auto_31409 ) ) ( not ( = ?auto_31406 ?auto_31410 ) ) ( not ( = ?auto_31406 ?auto_31411 ) ) ( not ( = ?auto_31406 ?auto_31412 ) ) ( not ( = ?auto_31407 ?auto_31408 ) ) ( not ( = ?auto_31407 ?auto_31409 ) ) ( not ( = ?auto_31407 ?auto_31410 ) ) ( not ( = ?auto_31407 ?auto_31411 ) ) ( not ( = ?auto_31407 ?auto_31412 ) ) ( not ( = ?auto_31408 ?auto_31409 ) ) ( not ( = ?auto_31408 ?auto_31410 ) ) ( not ( = ?auto_31408 ?auto_31411 ) ) ( not ( = ?auto_31408 ?auto_31412 ) ) ( not ( = ?auto_31409 ?auto_31410 ) ) ( not ( = ?auto_31409 ?auto_31411 ) ) ( not ( = ?auto_31409 ?auto_31412 ) ) ( not ( = ?auto_31410 ?auto_31411 ) ) ( not ( = ?auto_31410 ?auto_31412 ) ) ( not ( = ?auto_31411 ?auto_31412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31411 ?auto_31412 )
      ( !STACK ?auto_31411 ?auto_31410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31421 - BLOCK
      ?auto_31422 - BLOCK
      ?auto_31423 - BLOCK
      ?auto_31424 - BLOCK
      ?auto_31425 - BLOCK
      ?auto_31426 - BLOCK
      ?auto_31427 - BLOCK
      ?auto_31428 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31427 ) ( ON-TABLE ?auto_31428 ) ( CLEAR ?auto_31428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31421 ) ( ON ?auto_31422 ?auto_31421 ) ( ON ?auto_31423 ?auto_31422 ) ( ON ?auto_31424 ?auto_31423 ) ( ON ?auto_31425 ?auto_31424 ) ( ON ?auto_31426 ?auto_31425 ) ( ON ?auto_31427 ?auto_31426 ) ( not ( = ?auto_31421 ?auto_31422 ) ) ( not ( = ?auto_31421 ?auto_31423 ) ) ( not ( = ?auto_31421 ?auto_31424 ) ) ( not ( = ?auto_31421 ?auto_31425 ) ) ( not ( = ?auto_31421 ?auto_31426 ) ) ( not ( = ?auto_31421 ?auto_31427 ) ) ( not ( = ?auto_31421 ?auto_31428 ) ) ( not ( = ?auto_31422 ?auto_31423 ) ) ( not ( = ?auto_31422 ?auto_31424 ) ) ( not ( = ?auto_31422 ?auto_31425 ) ) ( not ( = ?auto_31422 ?auto_31426 ) ) ( not ( = ?auto_31422 ?auto_31427 ) ) ( not ( = ?auto_31422 ?auto_31428 ) ) ( not ( = ?auto_31423 ?auto_31424 ) ) ( not ( = ?auto_31423 ?auto_31425 ) ) ( not ( = ?auto_31423 ?auto_31426 ) ) ( not ( = ?auto_31423 ?auto_31427 ) ) ( not ( = ?auto_31423 ?auto_31428 ) ) ( not ( = ?auto_31424 ?auto_31425 ) ) ( not ( = ?auto_31424 ?auto_31426 ) ) ( not ( = ?auto_31424 ?auto_31427 ) ) ( not ( = ?auto_31424 ?auto_31428 ) ) ( not ( = ?auto_31425 ?auto_31426 ) ) ( not ( = ?auto_31425 ?auto_31427 ) ) ( not ( = ?auto_31425 ?auto_31428 ) ) ( not ( = ?auto_31426 ?auto_31427 ) ) ( not ( = ?auto_31426 ?auto_31428 ) ) ( not ( = ?auto_31427 ?auto_31428 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_31428 )
      ( !STACK ?auto_31428 ?auto_31427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31437 - BLOCK
      ?auto_31438 - BLOCK
      ?auto_31439 - BLOCK
      ?auto_31440 - BLOCK
      ?auto_31441 - BLOCK
      ?auto_31442 - BLOCK
      ?auto_31443 - BLOCK
      ?auto_31444 - BLOCK
    )
    :vars
    (
      ?auto_31445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31444 ?auto_31445 ) ( ON-TABLE ?auto_31437 ) ( ON ?auto_31438 ?auto_31437 ) ( ON ?auto_31439 ?auto_31438 ) ( ON ?auto_31440 ?auto_31439 ) ( ON ?auto_31441 ?auto_31440 ) ( ON ?auto_31442 ?auto_31441 ) ( not ( = ?auto_31437 ?auto_31438 ) ) ( not ( = ?auto_31437 ?auto_31439 ) ) ( not ( = ?auto_31437 ?auto_31440 ) ) ( not ( = ?auto_31437 ?auto_31441 ) ) ( not ( = ?auto_31437 ?auto_31442 ) ) ( not ( = ?auto_31437 ?auto_31443 ) ) ( not ( = ?auto_31437 ?auto_31444 ) ) ( not ( = ?auto_31437 ?auto_31445 ) ) ( not ( = ?auto_31438 ?auto_31439 ) ) ( not ( = ?auto_31438 ?auto_31440 ) ) ( not ( = ?auto_31438 ?auto_31441 ) ) ( not ( = ?auto_31438 ?auto_31442 ) ) ( not ( = ?auto_31438 ?auto_31443 ) ) ( not ( = ?auto_31438 ?auto_31444 ) ) ( not ( = ?auto_31438 ?auto_31445 ) ) ( not ( = ?auto_31439 ?auto_31440 ) ) ( not ( = ?auto_31439 ?auto_31441 ) ) ( not ( = ?auto_31439 ?auto_31442 ) ) ( not ( = ?auto_31439 ?auto_31443 ) ) ( not ( = ?auto_31439 ?auto_31444 ) ) ( not ( = ?auto_31439 ?auto_31445 ) ) ( not ( = ?auto_31440 ?auto_31441 ) ) ( not ( = ?auto_31440 ?auto_31442 ) ) ( not ( = ?auto_31440 ?auto_31443 ) ) ( not ( = ?auto_31440 ?auto_31444 ) ) ( not ( = ?auto_31440 ?auto_31445 ) ) ( not ( = ?auto_31441 ?auto_31442 ) ) ( not ( = ?auto_31441 ?auto_31443 ) ) ( not ( = ?auto_31441 ?auto_31444 ) ) ( not ( = ?auto_31441 ?auto_31445 ) ) ( not ( = ?auto_31442 ?auto_31443 ) ) ( not ( = ?auto_31442 ?auto_31444 ) ) ( not ( = ?auto_31442 ?auto_31445 ) ) ( not ( = ?auto_31443 ?auto_31444 ) ) ( not ( = ?auto_31443 ?auto_31445 ) ) ( not ( = ?auto_31444 ?auto_31445 ) ) ( CLEAR ?auto_31442 ) ( ON ?auto_31443 ?auto_31444 ) ( CLEAR ?auto_31443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_31437 ?auto_31438 ?auto_31439 ?auto_31440 ?auto_31441 ?auto_31442 ?auto_31443 )
      ( MAKE-8PILE ?auto_31437 ?auto_31438 ?auto_31439 ?auto_31440 ?auto_31441 ?auto_31442 ?auto_31443 ?auto_31444 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31454 - BLOCK
      ?auto_31455 - BLOCK
      ?auto_31456 - BLOCK
      ?auto_31457 - BLOCK
      ?auto_31458 - BLOCK
      ?auto_31459 - BLOCK
      ?auto_31460 - BLOCK
      ?auto_31461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31461 ) ( ON-TABLE ?auto_31454 ) ( ON ?auto_31455 ?auto_31454 ) ( ON ?auto_31456 ?auto_31455 ) ( ON ?auto_31457 ?auto_31456 ) ( ON ?auto_31458 ?auto_31457 ) ( ON ?auto_31459 ?auto_31458 ) ( not ( = ?auto_31454 ?auto_31455 ) ) ( not ( = ?auto_31454 ?auto_31456 ) ) ( not ( = ?auto_31454 ?auto_31457 ) ) ( not ( = ?auto_31454 ?auto_31458 ) ) ( not ( = ?auto_31454 ?auto_31459 ) ) ( not ( = ?auto_31454 ?auto_31460 ) ) ( not ( = ?auto_31454 ?auto_31461 ) ) ( not ( = ?auto_31455 ?auto_31456 ) ) ( not ( = ?auto_31455 ?auto_31457 ) ) ( not ( = ?auto_31455 ?auto_31458 ) ) ( not ( = ?auto_31455 ?auto_31459 ) ) ( not ( = ?auto_31455 ?auto_31460 ) ) ( not ( = ?auto_31455 ?auto_31461 ) ) ( not ( = ?auto_31456 ?auto_31457 ) ) ( not ( = ?auto_31456 ?auto_31458 ) ) ( not ( = ?auto_31456 ?auto_31459 ) ) ( not ( = ?auto_31456 ?auto_31460 ) ) ( not ( = ?auto_31456 ?auto_31461 ) ) ( not ( = ?auto_31457 ?auto_31458 ) ) ( not ( = ?auto_31457 ?auto_31459 ) ) ( not ( = ?auto_31457 ?auto_31460 ) ) ( not ( = ?auto_31457 ?auto_31461 ) ) ( not ( = ?auto_31458 ?auto_31459 ) ) ( not ( = ?auto_31458 ?auto_31460 ) ) ( not ( = ?auto_31458 ?auto_31461 ) ) ( not ( = ?auto_31459 ?auto_31460 ) ) ( not ( = ?auto_31459 ?auto_31461 ) ) ( not ( = ?auto_31460 ?auto_31461 ) ) ( CLEAR ?auto_31459 ) ( ON ?auto_31460 ?auto_31461 ) ( CLEAR ?auto_31460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_31454 ?auto_31455 ?auto_31456 ?auto_31457 ?auto_31458 ?auto_31459 ?auto_31460 )
      ( MAKE-8PILE ?auto_31454 ?auto_31455 ?auto_31456 ?auto_31457 ?auto_31458 ?auto_31459 ?auto_31460 ?auto_31461 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31470 - BLOCK
      ?auto_31471 - BLOCK
      ?auto_31472 - BLOCK
      ?auto_31473 - BLOCK
      ?auto_31474 - BLOCK
      ?auto_31475 - BLOCK
      ?auto_31476 - BLOCK
      ?auto_31477 - BLOCK
    )
    :vars
    (
      ?auto_31478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31477 ?auto_31478 ) ( ON-TABLE ?auto_31470 ) ( ON ?auto_31471 ?auto_31470 ) ( ON ?auto_31472 ?auto_31471 ) ( ON ?auto_31473 ?auto_31472 ) ( ON ?auto_31474 ?auto_31473 ) ( not ( = ?auto_31470 ?auto_31471 ) ) ( not ( = ?auto_31470 ?auto_31472 ) ) ( not ( = ?auto_31470 ?auto_31473 ) ) ( not ( = ?auto_31470 ?auto_31474 ) ) ( not ( = ?auto_31470 ?auto_31475 ) ) ( not ( = ?auto_31470 ?auto_31476 ) ) ( not ( = ?auto_31470 ?auto_31477 ) ) ( not ( = ?auto_31470 ?auto_31478 ) ) ( not ( = ?auto_31471 ?auto_31472 ) ) ( not ( = ?auto_31471 ?auto_31473 ) ) ( not ( = ?auto_31471 ?auto_31474 ) ) ( not ( = ?auto_31471 ?auto_31475 ) ) ( not ( = ?auto_31471 ?auto_31476 ) ) ( not ( = ?auto_31471 ?auto_31477 ) ) ( not ( = ?auto_31471 ?auto_31478 ) ) ( not ( = ?auto_31472 ?auto_31473 ) ) ( not ( = ?auto_31472 ?auto_31474 ) ) ( not ( = ?auto_31472 ?auto_31475 ) ) ( not ( = ?auto_31472 ?auto_31476 ) ) ( not ( = ?auto_31472 ?auto_31477 ) ) ( not ( = ?auto_31472 ?auto_31478 ) ) ( not ( = ?auto_31473 ?auto_31474 ) ) ( not ( = ?auto_31473 ?auto_31475 ) ) ( not ( = ?auto_31473 ?auto_31476 ) ) ( not ( = ?auto_31473 ?auto_31477 ) ) ( not ( = ?auto_31473 ?auto_31478 ) ) ( not ( = ?auto_31474 ?auto_31475 ) ) ( not ( = ?auto_31474 ?auto_31476 ) ) ( not ( = ?auto_31474 ?auto_31477 ) ) ( not ( = ?auto_31474 ?auto_31478 ) ) ( not ( = ?auto_31475 ?auto_31476 ) ) ( not ( = ?auto_31475 ?auto_31477 ) ) ( not ( = ?auto_31475 ?auto_31478 ) ) ( not ( = ?auto_31476 ?auto_31477 ) ) ( not ( = ?auto_31476 ?auto_31478 ) ) ( not ( = ?auto_31477 ?auto_31478 ) ) ( ON ?auto_31476 ?auto_31477 ) ( CLEAR ?auto_31474 ) ( ON ?auto_31475 ?auto_31476 ) ( CLEAR ?auto_31475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_31470 ?auto_31471 ?auto_31472 ?auto_31473 ?auto_31474 ?auto_31475 )
      ( MAKE-8PILE ?auto_31470 ?auto_31471 ?auto_31472 ?auto_31473 ?auto_31474 ?auto_31475 ?auto_31476 ?auto_31477 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31487 - BLOCK
      ?auto_31488 - BLOCK
      ?auto_31489 - BLOCK
      ?auto_31490 - BLOCK
      ?auto_31491 - BLOCK
      ?auto_31492 - BLOCK
      ?auto_31493 - BLOCK
      ?auto_31494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31494 ) ( ON-TABLE ?auto_31487 ) ( ON ?auto_31488 ?auto_31487 ) ( ON ?auto_31489 ?auto_31488 ) ( ON ?auto_31490 ?auto_31489 ) ( ON ?auto_31491 ?auto_31490 ) ( not ( = ?auto_31487 ?auto_31488 ) ) ( not ( = ?auto_31487 ?auto_31489 ) ) ( not ( = ?auto_31487 ?auto_31490 ) ) ( not ( = ?auto_31487 ?auto_31491 ) ) ( not ( = ?auto_31487 ?auto_31492 ) ) ( not ( = ?auto_31487 ?auto_31493 ) ) ( not ( = ?auto_31487 ?auto_31494 ) ) ( not ( = ?auto_31488 ?auto_31489 ) ) ( not ( = ?auto_31488 ?auto_31490 ) ) ( not ( = ?auto_31488 ?auto_31491 ) ) ( not ( = ?auto_31488 ?auto_31492 ) ) ( not ( = ?auto_31488 ?auto_31493 ) ) ( not ( = ?auto_31488 ?auto_31494 ) ) ( not ( = ?auto_31489 ?auto_31490 ) ) ( not ( = ?auto_31489 ?auto_31491 ) ) ( not ( = ?auto_31489 ?auto_31492 ) ) ( not ( = ?auto_31489 ?auto_31493 ) ) ( not ( = ?auto_31489 ?auto_31494 ) ) ( not ( = ?auto_31490 ?auto_31491 ) ) ( not ( = ?auto_31490 ?auto_31492 ) ) ( not ( = ?auto_31490 ?auto_31493 ) ) ( not ( = ?auto_31490 ?auto_31494 ) ) ( not ( = ?auto_31491 ?auto_31492 ) ) ( not ( = ?auto_31491 ?auto_31493 ) ) ( not ( = ?auto_31491 ?auto_31494 ) ) ( not ( = ?auto_31492 ?auto_31493 ) ) ( not ( = ?auto_31492 ?auto_31494 ) ) ( not ( = ?auto_31493 ?auto_31494 ) ) ( ON ?auto_31493 ?auto_31494 ) ( CLEAR ?auto_31491 ) ( ON ?auto_31492 ?auto_31493 ) ( CLEAR ?auto_31492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_31487 ?auto_31488 ?auto_31489 ?auto_31490 ?auto_31491 ?auto_31492 )
      ( MAKE-8PILE ?auto_31487 ?auto_31488 ?auto_31489 ?auto_31490 ?auto_31491 ?auto_31492 ?auto_31493 ?auto_31494 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31503 - BLOCK
      ?auto_31504 - BLOCK
      ?auto_31505 - BLOCK
      ?auto_31506 - BLOCK
      ?auto_31507 - BLOCK
      ?auto_31508 - BLOCK
      ?auto_31509 - BLOCK
      ?auto_31510 - BLOCK
    )
    :vars
    (
      ?auto_31511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31510 ?auto_31511 ) ( ON-TABLE ?auto_31503 ) ( ON ?auto_31504 ?auto_31503 ) ( ON ?auto_31505 ?auto_31504 ) ( ON ?auto_31506 ?auto_31505 ) ( not ( = ?auto_31503 ?auto_31504 ) ) ( not ( = ?auto_31503 ?auto_31505 ) ) ( not ( = ?auto_31503 ?auto_31506 ) ) ( not ( = ?auto_31503 ?auto_31507 ) ) ( not ( = ?auto_31503 ?auto_31508 ) ) ( not ( = ?auto_31503 ?auto_31509 ) ) ( not ( = ?auto_31503 ?auto_31510 ) ) ( not ( = ?auto_31503 ?auto_31511 ) ) ( not ( = ?auto_31504 ?auto_31505 ) ) ( not ( = ?auto_31504 ?auto_31506 ) ) ( not ( = ?auto_31504 ?auto_31507 ) ) ( not ( = ?auto_31504 ?auto_31508 ) ) ( not ( = ?auto_31504 ?auto_31509 ) ) ( not ( = ?auto_31504 ?auto_31510 ) ) ( not ( = ?auto_31504 ?auto_31511 ) ) ( not ( = ?auto_31505 ?auto_31506 ) ) ( not ( = ?auto_31505 ?auto_31507 ) ) ( not ( = ?auto_31505 ?auto_31508 ) ) ( not ( = ?auto_31505 ?auto_31509 ) ) ( not ( = ?auto_31505 ?auto_31510 ) ) ( not ( = ?auto_31505 ?auto_31511 ) ) ( not ( = ?auto_31506 ?auto_31507 ) ) ( not ( = ?auto_31506 ?auto_31508 ) ) ( not ( = ?auto_31506 ?auto_31509 ) ) ( not ( = ?auto_31506 ?auto_31510 ) ) ( not ( = ?auto_31506 ?auto_31511 ) ) ( not ( = ?auto_31507 ?auto_31508 ) ) ( not ( = ?auto_31507 ?auto_31509 ) ) ( not ( = ?auto_31507 ?auto_31510 ) ) ( not ( = ?auto_31507 ?auto_31511 ) ) ( not ( = ?auto_31508 ?auto_31509 ) ) ( not ( = ?auto_31508 ?auto_31510 ) ) ( not ( = ?auto_31508 ?auto_31511 ) ) ( not ( = ?auto_31509 ?auto_31510 ) ) ( not ( = ?auto_31509 ?auto_31511 ) ) ( not ( = ?auto_31510 ?auto_31511 ) ) ( ON ?auto_31509 ?auto_31510 ) ( ON ?auto_31508 ?auto_31509 ) ( CLEAR ?auto_31506 ) ( ON ?auto_31507 ?auto_31508 ) ( CLEAR ?auto_31507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31503 ?auto_31504 ?auto_31505 ?auto_31506 ?auto_31507 )
      ( MAKE-8PILE ?auto_31503 ?auto_31504 ?auto_31505 ?auto_31506 ?auto_31507 ?auto_31508 ?auto_31509 ?auto_31510 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31520 - BLOCK
      ?auto_31521 - BLOCK
      ?auto_31522 - BLOCK
      ?auto_31523 - BLOCK
      ?auto_31524 - BLOCK
      ?auto_31525 - BLOCK
      ?auto_31526 - BLOCK
      ?auto_31527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31527 ) ( ON-TABLE ?auto_31520 ) ( ON ?auto_31521 ?auto_31520 ) ( ON ?auto_31522 ?auto_31521 ) ( ON ?auto_31523 ?auto_31522 ) ( not ( = ?auto_31520 ?auto_31521 ) ) ( not ( = ?auto_31520 ?auto_31522 ) ) ( not ( = ?auto_31520 ?auto_31523 ) ) ( not ( = ?auto_31520 ?auto_31524 ) ) ( not ( = ?auto_31520 ?auto_31525 ) ) ( not ( = ?auto_31520 ?auto_31526 ) ) ( not ( = ?auto_31520 ?auto_31527 ) ) ( not ( = ?auto_31521 ?auto_31522 ) ) ( not ( = ?auto_31521 ?auto_31523 ) ) ( not ( = ?auto_31521 ?auto_31524 ) ) ( not ( = ?auto_31521 ?auto_31525 ) ) ( not ( = ?auto_31521 ?auto_31526 ) ) ( not ( = ?auto_31521 ?auto_31527 ) ) ( not ( = ?auto_31522 ?auto_31523 ) ) ( not ( = ?auto_31522 ?auto_31524 ) ) ( not ( = ?auto_31522 ?auto_31525 ) ) ( not ( = ?auto_31522 ?auto_31526 ) ) ( not ( = ?auto_31522 ?auto_31527 ) ) ( not ( = ?auto_31523 ?auto_31524 ) ) ( not ( = ?auto_31523 ?auto_31525 ) ) ( not ( = ?auto_31523 ?auto_31526 ) ) ( not ( = ?auto_31523 ?auto_31527 ) ) ( not ( = ?auto_31524 ?auto_31525 ) ) ( not ( = ?auto_31524 ?auto_31526 ) ) ( not ( = ?auto_31524 ?auto_31527 ) ) ( not ( = ?auto_31525 ?auto_31526 ) ) ( not ( = ?auto_31525 ?auto_31527 ) ) ( not ( = ?auto_31526 ?auto_31527 ) ) ( ON ?auto_31526 ?auto_31527 ) ( ON ?auto_31525 ?auto_31526 ) ( CLEAR ?auto_31523 ) ( ON ?auto_31524 ?auto_31525 ) ( CLEAR ?auto_31524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31520 ?auto_31521 ?auto_31522 ?auto_31523 ?auto_31524 )
      ( MAKE-8PILE ?auto_31520 ?auto_31521 ?auto_31522 ?auto_31523 ?auto_31524 ?auto_31525 ?auto_31526 ?auto_31527 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31536 - BLOCK
      ?auto_31537 - BLOCK
      ?auto_31538 - BLOCK
      ?auto_31539 - BLOCK
      ?auto_31540 - BLOCK
      ?auto_31541 - BLOCK
      ?auto_31542 - BLOCK
      ?auto_31543 - BLOCK
    )
    :vars
    (
      ?auto_31544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31543 ?auto_31544 ) ( ON-TABLE ?auto_31536 ) ( ON ?auto_31537 ?auto_31536 ) ( ON ?auto_31538 ?auto_31537 ) ( not ( = ?auto_31536 ?auto_31537 ) ) ( not ( = ?auto_31536 ?auto_31538 ) ) ( not ( = ?auto_31536 ?auto_31539 ) ) ( not ( = ?auto_31536 ?auto_31540 ) ) ( not ( = ?auto_31536 ?auto_31541 ) ) ( not ( = ?auto_31536 ?auto_31542 ) ) ( not ( = ?auto_31536 ?auto_31543 ) ) ( not ( = ?auto_31536 ?auto_31544 ) ) ( not ( = ?auto_31537 ?auto_31538 ) ) ( not ( = ?auto_31537 ?auto_31539 ) ) ( not ( = ?auto_31537 ?auto_31540 ) ) ( not ( = ?auto_31537 ?auto_31541 ) ) ( not ( = ?auto_31537 ?auto_31542 ) ) ( not ( = ?auto_31537 ?auto_31543 ) ) ( not ( = ?auto_31537 ?auto_31544 ) ) ( not ( = ?auto_31538 ?auto_31539 ) ) ( not ( = ?auto_31538 ?auto_31540 ) ) ( not ( = ?auto_31538 ?auto_31541 ) ) ( not ( = ?auto_31538 ?auto_31542 ) ) ( not ( = ?auto_31538 ?auto_31543 ) ) ( not ( = ?auto_31538 ?auto_31544 ) ) ( not ( = ?auto_31539 ?auto_31540 ) ) ( not ( = ?auto_31539 ?auto_31541 ) ) ( not ( = ?auto_31539 ?auto_31542 ) ) ( not ( = ?auto_31539 ?auto_31543 ) ) ( not ( = ?auto_31539 ?auto_31544 ) ) ( not ( = ?auto_31540 ?auto_31541 ) ) ( not ( = ?auto_31540 ?auto_31542 ) ) ( not ( = ?auto_31540 ?auto_31543 ) ) ( not ( = ?auto_31540 ?auto_31544 ) ) ( not ( = ?auto_31541 ?auto_31542 ) ) ( not ( = ?auto_31541 ?auto_31543 ) ) ( not ( = ?auto_31541 ?auto_31544 ) ) ( not ( = ?auto_31542 ?auto_31543 ) ) ( not ( = ?auto_31542 ?auto_31544 ) ) ( not ( = ?auto_31543 ?auto_31544 ) ) ( ON ?auto_31542 ?auto_31543 ) ( ON ?auto_31541 ?auto_31542 ) ( ON ?auto_31540 ?auto_31541 ) ( CLEAR ?auto_31538 ) ( ON ?auto_31539 ?auto_31540 ) ( CLEAR ?auto_31539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31536 ?auto_31537 ?auto_31538 ?auto_31539 )
      ( MAKE-8PILE ?auto_31536 ?auto_31537 ?auto_31538 ?auto_31539 ?auto_31540 ?auto_31541 ?auto_31542 ?auto_31543 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31553 - BLOCK
      ?auto_31554 - BLOCK
      ?auto_31555 - BLOCK
      ?auto_31556 - BLOCK
      ?auto_31557 - BLOCK
      ?auto_31558 - BLOCK
      ?auto_31559 - BLOCK
      ?auto_31560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31560 ) ( ON-TABLE ?auto_31553 ) ( ON ?auto_31554 ?auto_31553 ) ( ON ?auto_31555 ?auto_31554 ) ( not ( = ?auto_31553 ?auto_31554 ) ) ( not ( = ?auto_31553 ?auto_31555 ) ) ( not ( = ?auto_31553 ?auto_31556 ) ) ( not ( = ?auto_31553 ?auto_31557 ) ) ( not ( = ?auto_31553 ?auto_31558 ) ) ( not ( = ?auto_31553 ?auto_31559 ) ) ( not ( = ?auto_31553 ?auto_31560 ) ) ( not ( = ?auto_31554 ?auto_31555 ) ) ( not ( = ?auto_31554 ?auto_31556 ) ) ( not ( = ?auto_31554 ?auto_31557 ) ) ( not ( = ?auto_31554 ?auto_31558 ) ) ( not ( = ?auto_31554 ?auto_31559 ) ) ( not ( = ?auto_31554 ?auto_31560 ) ) ( not ( = ?auto_31555 ?auto_31556 ) ) ( not ( = ?auto_31555 ?auto_31557 ) ) ( not ( = ?auto_31555 ?auto_31558 ) ) ( not ( = ?auto_31555 ?auto_31559 ) ) ( not ( = ?auto_31555 ?auto_31560 ) ) ( not ( = ?auto_31556 ?auto_31557 ) ) ( not ( = ?auto_31556 ?auto_31558 ) ) ( not ( = ?auto_31556 ?auto_31559 ) ) ( not ( = ?auto_31556 ?auto_31560 ) ) ( not ( = ?auto_31557 ?auto_31558 ) ) ( not ( = ?auto_31557 ?auto_31559 ) ) ( not ( = ?auto_31557 ?auto_31560 ) ) ( not ( = ?auto_31558 ?auto_31559 ) ) ( not ( = ?auto_31558 ?auto_31560 ) ) ( not ( = ?auto_31559 ?auto_31560 ) ) ( ON ?auto_31559 ?auto_31560 ) ( ON ?auto_31558 ?auto_31559 ) ( ON ?auto_31557 ?auto_31558 ) ( CLEAR ?auto_31555 ) ( ON ?auto_31556 ?auto_31557 ) ( CLEAR ?auto_31556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31553 ?auto_31554 ?auto_31555 ?auto_31556 )
      ( MAKE-8PILE ?auto_31553 ?auto_31554 ?auto_31555 ?auto_31556 ?auto_31557 ?auto_31558 ?auto_31559 ?auto_31560 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31569 - BLOCK
      ?auto_31570 - BLOCK
      ?auto_31571 - BLOCK
      ?auto_31572 - BLOCK
      ?auto_31573 - BLOCK
      ?auto_31574 - BLOCK
      ?auto_31575 - BLOCK
      ?auto_31576 - BLOCK
    )
    :vars
    (
      ?auto_31577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31576 ?auto_31577 ) ( ON-TABLE ?auto_31569 ) ( ON ?auto_31570 ?auto_31569 ) ( not ( = ?auto_31569 ?auto_31570 ) ) ( not ( = ?auto_31569 ?auto_31571 ) ) ( not ( = ?auto_31569 ?auto_31572 ) ) ( not ( = ?auto_31569 ?auto_31573 ) ) ( not ( = ?auto_31569 ?auto_31574 ) ) ( not ( = ?auto_31569 ?auto_31575 ) ) ( not ( = ?auto_31569 ?auto_31576 ) ) ( not ( = ?auto_31569 ?auto_31577 ) ) ( not ( = ?auto_31570 ?auto_31571 ) ) ( not ( = ?auto_31570 ?auto_31572 ) ) ( not ( = ?auto_31570 ?auto_31573 ) ) ( not ( = ?auto_31570 ?auto_31574 ) ) ( not ( = ?auto_31570 ?auto_31575 ) ) ( not ( = ?auto_31570 ?auto_31576 ) ) ( not ( = ?auto_31570 ?auto_31577 ) ) ( not ( = ?auto_31571 ?auto_31572 ) ) ( not ( = ?auto_31571 ?auto_31573 ) ) ( not ( = ?auto_31571 ?auto_31574 ) ) ( not ( = ?auto_31571 ?auto_31575 ) ) ( not ( = ?auto_31571 ?auto_31576 ) ) ( not ( = ?auto_31571 ?auto_31577 ) ) ( not ( = ?auto_31572 ?auto_31573 ) ) ( not ( = ?auto_31572 ?auto_31574 ) ) ( not ( = ?auto_31572 ?auto_31575 ) ) ( not ( = ?auto_31572 ?auto_31576 ) ) ( not ( = ?auto_31572 ?auto_31577 ) ) ( not ( = ?auto_31573 ?auto_31574 ) ) ( not ( = ?auto_31573 ?auto_31575 ) ) ( not ( = ?auto_31573 ?auto_31576 ) ) ( not ( = ?auto_31573 ?auto_31577 ) ) ( not ( = ?auto_31574 ?auto_31575 ) ) ( not ( = ?auto_31574 ?auto_31576 ) ) ( not ( = ?auto_31574 ?auto_31577 ) ) ( not ( = ?auto_31575 ?auto_31576 ) ) ( not ( = ?auto_31575 ?auto_31577 ) ) ( not ( = ?auto_31576 ?auto_31577 ) ) ( ON ?auto_31575 ?auto_31576 ) ( ON ?auto_31574 ?auto_31575 ) ( ON ?auto_31573 ?auto_31574 ) ( ON ?auto_31572 ?auto_31573 ) ( CLEAR ?auto_31570 ) ( ON ?auto_31571 ?auto_31572 ) ( CLEAR ?auto_31571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31569 ?auto_31570 ?auto_31571 )
      ( MAKE-8PILE ?auto_31569 ?auto_31570 ?auto_31571 ?auto_31572 ?auto_31573 ?auto_31574 ?auto_31575 ?auto_31576 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31586 - BLOCK
      ?auto_31587 - BLOCK
      ?auto_31588 - BLOCK
      ?auto_31589 - BLOCK
      ?auto_31590 - BLOCK
      ?auto_31591 - BLOCK
      ?auto_31592 - BLOCK
      ?auto_31593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31593 ) ( ON-TABLE ?auto_31586 ) ( ON ?auto_31587 ?auto_31586 ) ( not ( = ?auto_31586 ?auto_31587 ) ) ( not ( = ?auto_31586 ?auto_31588 ) ) ( not ( = ?auto_31586 ?auto_31589 ) ) ( not ( = ?auto_31586 ?auto_31590 ) ) ( not ( = ?auto_31586 ?auto_31591 ) ) ( not ( = ?auto_31586 ?auto_31592 ) ) ( not ( = ?auto_31586 ?auto_31593 ) ) ( not ( = ?auto_31587 ?auto_31588 ) ) ( not ( = ?auto_31587 ?auto_31589 ) ) ( not ( = ?auto_31587 ?auto_31590 ) ) ( not ( = ?auto_31587 ?auto_31591 ) ) ( not ( = ?auto_31587 ?auto_31592 ) ) ( not ( = ?auto_31587 ?auto_31593 ) ) ( not ( = ?auto_31588 ?auto_31589 ) ) ( not ( = ?auto_31588 ?auto_31590 ) ) ( not ( = ?auto_31588 ?auto_31591 ) ) ( not ( = ?auto_31588 ?auto_31592 ) ) ( not ( = ?auto_31588 ?auto_31593 ) ) ( not ( = ?auto_31589 ?auto_31590 ) ) ( not ( = ?auto_31589 ?auto_31591 ) ) ( not ( = ?auto_31589 ?auto_31592 ) ) ( not ( = ?auto_31589 ?auto_31593 ) ) ( not ( = ?auto_31590 ?auto_31591 ) ) ( not ( = ?auto_31590 ?auto_31592 ) ) ( not ( = ?auto_31590 ?auto_31593 ) ) ( not ( = ?auto_31591 ?auto_31592 ) ) ( not ( = ?auto_31591 ?auto_31593 ) ) ( not ( = ?auto_31592 ?auto_31593 ) ) ( ON ?auto_31592 ?auto_31593 ) ( ON ?auto_31591 ?auto_31592 ) ( ON ?auto_31590 ?auto_31591 ) ( ON ?auto_31589 ?auto_31590 ) ( CLEAR ?auto_31587 ) ( ON ?auto_31588 ?auto_31589 ) ( CLEAR ?auto_31588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31586 ?auto_31587 ?auto_31588 )
      ( MAKE-8PILE ?auto_31586 ?auto_31587 ?auto_31588 ?auto_31589 ?auto_31590 ?auto_31591 ?auto_31592 ?auto_31593 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31602 - BLOCK
      ?auto_31603 - BLOCK
      ?auto_31604 - BLOCK
      ?auto_31605 - BLOCK
      ?auto_31606 - BLOCK
      ?auto_31607 - BLOCK
      ?auto_31608 - BLOCK
      ?auto_31609 - BLOCK
    )
    :vars
    (
      ?auto_31610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31609 ?auto_31610 ) ( ON-TABLE ?auto_31602 ) ( not ( = ?auto_31602 ?auto_31603 ) ) ( not ( = ?auto_31602 ?auto_31604 ) ) ( not ( = ?auto_31602 ?auto_31605 ) ) ( not ( = ?auto_31602 ?auto_31606 ) ) ( not ( = ?auto_31602 ?auto_31607 ) ) ( not ( = ?auto_31602 ?auto_31608 ) ) ( not ( = ?auto_31602 ?auto_31609 ) ) ( not ( = ?auto_31602 ?auto_31610 ) ) ( not ( = ?auto_31603 ?auto_31604 ) ) ( not ( = ?auto_31603 ?auto_31605 ) ) ( not ( = ?auto_31603 ?auto_31606 ) ) ( not ( = ?auto_31603 ?auto_31607 ) ) ( not ( = ?auto_31603 ?auto_31608 ) ) ( not ( = ?auto_31603 ?auto_31609 ) ) ( not ( = ?auto_31603 ?auto_31610 ) ) ( not ( = ?auto_31604 ?auto_31605 ) ) ( not ( = ?auto_31604 ?auto_31606 ) ) ( not ( = ?auto_31604 ?auto_31607 ) ) ( not ( = ?auto_31604 ?auto_31608 ) ) ( not ( = ?auto_31604 ?auto_31609 ) ) ( not ( = ?auto_31604 ?auto_31610 ) ) ( not ( = ?auto_31605 ?auto_31606 ) ) ( not ( = ?auto_31605 ?auto_31607 ) ) ( not ( = ?auto_31605 ?auto_31608 ) ) ( not ( = ?auto_31605 ?auto_31609 ) ) ( not ( = ?auto_31605 ?auto_31610 ) ) ( not ( = ?auto_31606 ?auto_31607 ) ) ( not ( = ?auto_31606 ?auto_31608 ) ) ( not ( = ?auto_31606 ?auto_31609 ) ) ( not ( = ?auto_31606 ?auto_31610 ) ) ( not ( = ?auto_31607 ?auto_31608 ) ) ( not ( = ?auto_31607 ?auto_31609 ) ) ( not ( = ?auto_31607 ?auto_31610 ) ) ( not ( = ?auto_31608 ?auto_31609 ) ) ( not ( = ?auto_31608 ?auto_31610 ) ) ( not ( = ?auto_31609 ?auto_31610 ) ) ( ON ?auto_31608 ?auto_31609 ) ( ON ?auto_31607 ?auto_31608 ) ( ON ?auto_31606 ?auto_31607 ) ( ON ?auto_31605 ?auto_31606 ) ( ON ?auto_31604 ?auto_31605 ) ( CLEAR ?auto_31602 ) ( ON ?auto_31603 ?auto_31604 ) ( CLEAR ?auto_31603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31602 ?auto_31603 )
      ( MAKE-8PILE ?auto_31602 ?auto_31603 ?auto_31604 ?auto_31605 ?auto_31606 ?auto_31607 ?auto_31608 ?auto_31609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31619 - BLOCK
      ?auto_31620 - BLOCK
      ?auto_31621 - BLOCK
      ?auto_31622 - BLOCK
      ?auto_31623 - BLOCK
      ?auto_31624 - BLOCK
      ?auto_31625 - BLOCK
      ?auto_31626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31626 ) ( ON-TABLE ?auto_31619 ) ( not ( = ?auto_31619 ?auto_31620 ) ) ( not ( = ?auto_31619 ?auto_31621 ) ) ( not ( = ?auto_31619 ?auto_31622 ) ) ( not ( = ?auto_31619 ?auto_31623 ) ) ( not ( = ?auto_31619 ?auto_31624 ) ) ( not ( = ?auto_31619 ?auto_31625 ) ) ( not ( = ?auto_31619 ?auto_31626 ) ) ( not ( = ?auto_31620 ?auto_31621 ) ) ( not ( = ?auto_31620 ?auto_31622 ) ) ( not ( = ?auto_31620 ?auto_31623 ) ) ( not ( = ?auto_31620 ?auto_31624 ) ) ( not ( = ?auto_31620 ?auto_31625 ) ) ( not ( = ?auto_31620 ?auto_31626 ) ) ( not ( = ?auto_31621 ?auto_31622 ) ) ( not ( = ?auto_31621 ?auto_31623 ) ) ( not ( = ?auto_31621 ?auto_31624 ) ) ( not ( = ?auto_31621 ?auto_31625 ) ) ( not ( = ?auto_31621 ?auto_31626 ) ) ( not ( = ?auto_31622 ?auto_31623 ) ) ( not ( = ?auto_31622 ?auto_31624 ) ) ( not ( = ?auto_31622 ?auto_31625 ) ) ( not ( = ?auto_31622 ?auto_31626 ) ) ( not ( = ?auto_31623 ?auto_31624 ) ) ( not ( = ?auto_31623 ?auto_31625 ) ) ( not ( = ?auto_31623 ?auto_31626 ) ) ( not ( = ?auto_31624 ?auto_31625 ) ) ( not ( = ?auto_31624 ?auto_31626 ) ) ( not ( = ?auto_31625 ?auto_31626 ) ) ( ON ?auto_31625 ?auto_31626 ) ( ON ?auto_31624 ?auto_31625 ) ( ON ?auto_31623 ?auto_31624 ) ( ON ?auto_31622 ?auto_31623 ) ( ON ?auto_31621 ?auto_31622 ) ( CLEAR ?auto_31619 ) ( ON ?auto_31620 ?auto_31621 ) ( CLEAR ?auto_31620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31619 ?auto_31620 )
      ( MAKE-8PILE ?auto_31619 ?auto_31620 ?auto_31621 ?auto_31622 ?auto_31623 ?auto_31624 ?auto_31625 ?auto_31626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31635 - BLOCK
      ?auto_31636 - BLOCK
      ?auto_31637 - BLOCK
      ?auto_31638 - BLOCK
      ?auto_31639 - BLOCK
      ?auto_31640 - BLOCK
      ?auto_31641 - BLOCK
      ?auto_31642 - BLOCK
    )
    :vars
    (
      ?auto_31643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31642 ?auto_31643 ) ( not ( = ?auto_31635 ?auto_31636 ) ) ( not ( = ?auto_31635 ?auto_31637 ) ) ( not ( = ?auto_31635 ?auto_31638 ) ) ( not ( = ?auto_31635 ?auto_31639 ) ) ( not ( = ?auto_31635 ?auto_31640 ) ) ( not ( = ?auto_31635 ?auto_31641 ) ) ( not ( = ?auto_31635 ?auto_31642 ) ) ( not ( = ?auto_31635 ?auto_31643 ) ) ( not ( = ?auto_31636 ?auto_31637 ) ) ( not ( = ?auto_31636 ?auto_31638 ) ) ( not ( = ?auto_31636 ?auto_31639 ) ) ( not ( = ?auto_31636 ?auto_31640 ) ) ( not ( = ?auto_31636 ?auto_31641 ) ) ( not ( = ?auto_31636 ?auto_31642 ) ) ( not ( = ?auto_31636 ?auto_31643 ) ) ( not ( = ?auto_31637 ?auto_31638 ) ) ( not ( = ?auto_31637 ?auto_31639 ) ) ( not ( = ?auto_31637 ?auto_31640 ) ) ( not ( = ?auto_31637 ?auto_31641 ) ) ( not ( = ?auto_31637 ?auto_31642 ) ) ( not ( = ?auto_31637 ?auto_31643 ) ) ( not ( = ?auto_31638 ?auto_31639 ) ) ( not ( = ?auto_31638 ?auto_31640 ) ) ( not ( = ?auto_31638 ?auto_31641 ) ) ( not ( = ?auto_31638 ?auto_31642 ) ) ( not ( = ?auto_31638 ?auto_31643 ) ) ( not ( = ?auto_31639 ?auto_31640 ) ) ( not ( = ?auto_31639 ?auto_31641 ) ) ( not ( = ?auto_31639 ?auto_31642 ) ) ( not ( = ?auto_31639 ?auto_31643 ) ) ( not ( = ?auto_31640 ?auto_31641 ) ) ( not ( = ?auto_31640 ?auto_31642 ) ) ( not ( = ?auto_31640 ?auto_31643 ) ) ( not ( = ?auto_31641 ?auto_31642 ) ) ( not ( = ?auto_31641 ?auto_31643 ) ) ( not ( = ?auto_31642 ?auto_31643 ) ) ( ON ?auto_31641 ?auto_31642 ) ( ON ?auto_31640 ?auto_31641 ) ( ON ?auto_31639 ?auto_31640 ) ( ON ?auto_31638 ?auto_31639 ) ( ON ?auto_31637 ?auto_31638 ) ( ON ?auto_31636 ?auto_31637 ) ( ON ?auto_31635 ?auto_31636 ) ( CLEAR ?auto_31635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31635 )
      ( MAKE-8PILE ?auto_31635 ?auto_31636 ?auto_31637 ?auto_31638 ?auto_31639 ?auto_31640 ?auto_31641 ?auto_31642 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31652 - BLOCK
      ?auto_31653 - BLOCK
      ?auto_31654 - BLOCK
      ?auto_31655 - BLOCK
      ?auto_31656 - BLOCK
      ?auto_31657 - BLOCK
      ?auto_31658 - BLOCK
      ?auto_31659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31659 ) ( not ( = ?auto_31652 ?auto_31653 ) ) ( not ( = ?auto_31652 ?auto_31654 ) ) ( not ( = ?auto_31652 ?auto_31655 ) ) ( not ( = ?auto_31652 ?auto_31656 ) ) ( not ( = ?auto_31652 ?auto_31657 ) ) ( not ( = ?auto_31652 ?auto_31658 ) ) ( not ( = ?auto_31652 ?auto_31659 ) ) ( not ( = ?auto_31653 ?auto_31654 ) ) ( not ( = ?auto_31653 ?auto_31655 ) ) ( not ( = ?auto_31653 ?auto_31656 ) ) ( not ( = ?auto_31653 ?auto_31657 ) ) ( not ( = ?auto_31653 ?auto_31658 ) ) ( not ( = ?auto_31653 ?auto_31659 ) ) ( not ( = ?auto_31654 ?auto_31655 ) ) ( not ( = ?auto_31654 ?auto_31656 ) ) ( not ( = ?auto_31654 ?auto_31657 ) ) ( not ( = ?auto_31654 ?auto_31658 ) ) ( not ( = ?auto_31654 ?auto_31659 ) ) ( not ( = ?auto_31655 ?auto_31656 ) ) ( not ( = ?auto_31655 ?auto_31657 ) ) ( not ( = ?auto_31655 ?auto_31658 ) ) ( not ( = ?auto_31655 ?auto_31659 ) ) ( not ( = ?auto_31656 ?auto_31657 ) ) ( not ( = ?auto_31656 ?auto_31658 ) ) ( not ( = ?auto_31656 ?auto_31659 ) ) ( not ( = ?auto_31657 ?auto_31658 ) ) ( not ( = ?auto_31657 ?auto_31659 ) ) ( not ( = ?auto_31658 ?auto_31659 ) ) ( ON ?auto_31658 ?auto_31659 ) ( ON ?auto_31657 ?auto_31658 ) ( ON ?auto_31656 ?auto_31657 ) ( ON ?auto_31655 ?auto_31656 ) ( ON ?auto_31654 ?auto_31655 ) ( ON ?auto_31653 ?auto_31654 ) ( ON ?auto_31652 ?auto_31653 ) ( CLEAR ?auto_31652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31652 )
      ( MAKE-8PILE ?auto_31652 ?auto_31653 ?auto_31654 ?auto_31655 ?auto_31656 ?auto_31657 ?auto_31658 ?auto_31659 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_31668 - BLOCK
      ?auto_31669 - BLOCK
      ?auto_31670 - BLOCK
      ?auto_31671 - BLOCK
      ?auto_31672 - BLOCK
      ?auto_31673 - BLOCK
      ?auto_31674 - BLOCK
      ?auto_31675 - BLOCK
    )
    :vars
    (
      ?auto_31676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31668 ?auto_31669 ) ) ( not ( = ?auto_31668 ?auto_31670 ) ) ( not ( = ?auto_31668 ?auto_31671 ) ) ( not ( = ?auto_31668 ?auto_31672 ) ) ( not ( = ?auto_31668 ?auto_31673 ) ) ( not ( = ?auto_31668 ?auto_31674 ) ) ( not ( = ?auto_31668 ?auto_31675 ) ) ( not ( = ?auto_31669 ?auto_31670 ) ) ( not ( = ?auto_31669 ?auto_31671 ) ) ( not ( = ?auto_31669 ?auto_31672 ) ) ( not ( = ?auto_31669 ?auto_31673 ) ) ( not ( = ?auto_31669 ?auto_31674 ) ) ( not ( = ?auto_31669 ?auto_31675 ) ) ( not ( = ?auto_31670 ?auto_31671 ) ) ( not ( = ?auto_31670 ?auto_31672 ) ) ( not ( = ?auto_31670 ?auto_31673 ) ) ( not ( = ?auto_31670 ?auto_31674 ) ) ( not ( = ?auto_31670 ?auto_31675 ) ) ( not ( = ?auto_31671 ?auto_31672 ) ) ( not ( = ?auto_31671 ?auto_31673 ) ) ( not ( = ?auto_31671 ?auto_31674 ) ) ( not ( = ?auto_31671 ?auto_31675 ) ) ( not ( = ?auto_31672 ?auto_31673 ) ) ( not ( = ?auto_31672 ?auto_31674 ) ) ( not ( = ?auto_31672 ?auto_31675 ) ) ( not ( = ?auto_31673 ?auto_31674 ) ) ( not ( = ?auto_31673 ?auto_31675 ) ) ( not ( = ?auto_31674 ?auto_31675 ) ) ( ON ?auto_31668 ?auto_31676 ) ( not ( = ?auto_31675 ?auto_31676 ) ) ( not ( = ?auto_31674 ?auto_31676 ) ) ( not ( = ?auto_31673 ?auto_31676 ) ) ( not ( = ?auto_31672 ?auto_31676 ) ) ( not ( = ?auto_31671 ?auto_31676 ) ) ( not ( = ?auto_31670 ?auto_31676 ) ) ( not ( = ?auto_31669 ?auto_31676 ) ) ( not ( = ?auto_31668 ?auto_31676 ) ) ( ON ?auto_31669 ?auto_31668 ) ( ON ?auto_31670 ?auto_31669 ) ( ON ?auto_31671 ?auto_31670 ) ( ON ?auto_31672 ?auto_31671 ) ( ON ?auto_31673 ?auto_31672 ) ( ON ?auto_31674 ?auto_31673 ) ( ON ?auto_31675 ?auto_31674 ) ( CLEAR ?auto_31675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_31675 ?auto_31674 ?auto_31673 ?auto_31672 ?auto_31671 ?auto_31670 ?auto_31669 ?auto_31668 )
      ( MAKE-8PILE ?auto_31668 ?auto_31669 ?auto_31670 ?auto_31671 ?auto_31672 ?auto_31673 ?auto_31674 ?auto_31675 ) )
  )

)

