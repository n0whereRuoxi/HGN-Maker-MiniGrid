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
      ?auto_10867 - BLOCK
    )
    :vars
    (
      ?auto_10868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10867 ?auto_10868 ) ( CLEAR ?auto_10867 ) ( HAND-EMPTY ) ( not ( = ?auto_10867 ?auto_10868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10867 ?auto_10868 )
      ( !PUTDOWN ?auto_10867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10870 - BLOCK
    )
    :vars
    (
      ?auto_10871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10870 ?auto_10871 ) ( CLEAR ?auto_10870 ) ( HAND-EMPTY ) ( not ( = ?auto_10870 ?auto_10871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10870 ?auto_10871 )
      ( !PUTDOWN ?auto_10870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10874 - BLOCK
      ?auto_10875 - BLOCK
    )
    :vars
    (
      ?auto_10876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10874 ) ( ON ?auto_10875 ?auto_10876 ) ( CLEAR ?auto_10875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10874 ) ( not ( = ?auto_10874 ?auto_10875 ) ) ( not ( = ?auto_10874 ?auto_10876 ) ) ( not ( = ?auto_10875 ?auto_10876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10875 ?auto_10876 )
      ( !STACK ?auto_10875 ?auto_10874 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10879 - BLOCK
      ?auto_10880 - BLOCK
    )
    :vars
    (
      ?auto_10881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10879 ) ( ON ?auto_10880 ?auto_10881 ) ( CLEAR ?auto_10880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10879 ) ( not ( = ?auto_10879 ?auto_10880 ) ) ( not ( = ?auto_10879 ?auto_10881 ) ) ( not ( = ?auto_10880 ?auto_10881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10880 ?auto_10881 )
      ( !STACK ?auto_10880 ?auto_10879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10884 - BLOCK
      ?auto_10885 - BLOCK
    )
    :vars
    (
      ?auto_10886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10885 ?auto_10886 ) ( not ( = ?auto_10884 ?auto_10885 ) ) ( not ( = ?auto_10884 ?auto_10886 ) ) ( not ( = ?auto_10885 ?auto_10886 ) ) ( ON ?auto_10884 ?auto_10885 ) ( CLEAR ?auto_10884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10884 )
      ( MAKE-2PILE ?auto_10884 ?auto_10885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_10889 - BLOCK
      ?auto_10890 - BLOCK
    )
    :vars
    (
      ?auto_10891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10890 ?auto_10891 ) ( not ( = ?auto_10889 ?auto_10890 ) ) ( not ( = ?auto_10889 ?auto_10891 ) ) ( not ( = ?auto_10890 ?auto_10891 ) ) ( ON ?auto_10889 ?auto_10890 ) ( CLEAR ?auto_10889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10889 )
      ( MAKE-2PILE ?auto_10889 ?auto_10890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10895 - BLOCK
      ?auto_10896 - BLOCK
      ?auto_10897 - BLOCK
    )
    :vars
    (
      ?auto_10898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10896 ) ( ON ?auto_10897 ?auto_10898 ) ( CLEAR ?auto_10897 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10895 ) ( ON ?auto_10896 ?auto_10895 ) ( not ( = ?auto_10895 ?auto_10896 ) ) ( not ( = ?auto_10895 ?auto_10897 ) ) ( not ( = ?auto_10895 ?auto_10898 ) ) ( not ( = ?auto_10896 ?auto_10897 ) ) ( not ( = ?auto_10896 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10897 ?auto_10898 )
      ( !STACK ?auto_10897 ?auto_10896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10902 - BLOCK
      ?auto_10903 - BLOCK
      ?auto_10904 - BLOCK
    )
    :vars
    (
      ?auto_10905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10903 ) ( ON ?auto_10904 ?auto_10905 ) ( CLEAR ?auto_10904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10902 ) ( ON ?auto_10903 ?auto_10902 ) ( not ( = ?auto_10902 ?auto_10903 ) ) ( not ( = ?auto_10902 ?auto_10904 ) ) ( not ( = ?auto_10902 ?auto_10905 ) ) ( not ( = ?auto_10903 ?auto_10904 ) ) ( not ( = ?auto_10903 ?auto_10905 ) ) ( not ( = ?auto_10904 ?auto_10905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10904 ?auto_10905 )
      ( !STACK ?auto_10904 ?auto_10903 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10909 - BLOCK
      ?auto_10910 - BLOCK
      ?auto_10911 - BLOCK
    )
    :vars
    (
      ?auto_10912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10911 ?auto_10912 ) ( ON-TABLE ?auto_10909 ) ( not ( = ?auto_10909 ?auto_10910 ) ) ( not ( = ?auto_10909 ?auto_10911 ) ) ( not ( = ?auto_10909 ?auto_10912 ) ) ( not ( = ?auto_10910 ?auto_10911 ) ) ( not ( = ?auto_10910 ?auto_10912 ) ) ( not ( = ?auto_10911 ?auto_10912 ) ) ( CLEAR ?auto_10909 ) ( ON ?auto_10910 ?auto_10911 ) ( CLEAR ?auto_10910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10909 ?auto_10910 )
      ( MAKE-3PILE ?auto_10909 ?auto_10910 ?auto_10911 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10916 - BLOCK
      ?auto_10917 - BLOCK
      ?auto_10918 - BLOCK
    )
    :vars
    (
      ?auto_10919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10918 ?auto_10919 ) ( ON-TABLE ?auto_10916 ) ( not ( = ?auto_10916 ?auto_10917 ) ) ( not ( = ?auto_10916 ?auto_10918 ) ) ( not ( = ?auto_10916 ?auto_10919 ) ) ( not ( = ?auto_10917 ?auto_10918 ) ) ( not ( = ?auto_10917 ?auto_10919 ) ) ( not ( = ?auto_10918 ?auto_10919 ) ) ( CLEAR ?auto_10916 ) ( ON ?auto_10917 ?auto_10918 ) ( CLEAR ?auto_10917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10916 ?auto_10917 )
      ( MAKE-3PILE ?auto_10916 ?auto_10917 ?auto_10918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10923 - BLOCK
      ?auto_10924 - BLOCK
      ?auto_10925 - BLOCK
    )
    :vars
    (
      ?auto_10926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10925 ?auto_10926 ) ( not ( = ?auto_10923 ?auto_10924 ) ) ( not ( = ?auto_10923 ?auto_10925 ) ) ( not ( = ?auto_10923 ?auto_10926 ) ) ( not ( = ?auto_10924 ?auto_10925 ) ) ( not ( = ?auto_10924 ?auto_10926 ) ) ( not ( = ?auto_10925 ?auto_10926 ) ) ( ON ?auto_10924 ?auto_10925 ) ( ON ?auto_10923 ?auto_10924 ) ( CLEAR ?auto_10923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10923 )
      ( MAKE-3PILE ?auto_10923 ?auto_10924 ?auto_10925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_10930 - BLOCK
      ?auto_10931 - BLOCK
      ?auto_10932 - BLOCK
    )
    :vars
    (
      ?auto_10933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10932 ?auto_10933 ) ( not ( = ?auto_10930 ?auto_10931 ) ) ( not ( = ?auto_10930 ?auto_10932 ) ) ( not ( = ?auto_10930 ?auto_10933 ) ) ( not ( = ?auto_10931 ?auto_10932 ) ) ( not ( = ?auto_10931 ?auto_10933 ) ) ( not ( = ?auto_10932 ?auto_10933 ) ) ( ON ?auto_10931 ?auto_10932 ) ( ON ?auto_10930 ?auto_10931 ) ( CLEAR ?auto_10930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10930 )
      ( MAKE-3PILE ?auto_10930 ?auto_10931 ?auto_10932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10938 - BLOCK
      ?auto_10939 - BLOCK
      ?auto_10940 - BLOCK
      ?auto_10941 - BLOCK
    )
    :vars
    (
      ?auto_10942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10940 ) ( ON ?auto_10941 ?auto_10942 ) ( CLEAR ?auto_10941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10938 ) ( ON ?auto_10939 ?auto_10938 ) ( ON ?auto_10940 ?auto_10939 ) ( not ( = ?auto_10938 ?auto_10939 ) ) ( not ( = ?auto_10938 ?auto_10940 ) ) ( not ( = ?auto_10938 ?auto_10941 ) ) ( not ( = ?auto_10938 ?auto_10942 ) ) ( not ( = ?auto_10939 ?auto_10940 ) ) ( not ( = ?auto_10939 ?auto_10941 ) ) ( not ( = ?auto_10939 ?auto_10942 ) ) ( not ( = ?auto_10940 ?auto_10941 ) ) ( not ( = ?auto_10940 ?auto_10942 ) ) ( not ( = ?auto_10941 ?auto_10942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10941 ?auto_10942 )
      ( !STACK ?auto_10941 ?auto_10940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10947 - BLOCK
      ?auto_10948 - BLOCK
      ?auto_10949 - BLOCK
      ?auto_10950 - BLOCK
    )
    :vars
    (
      ?auto_10951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_10949 ) ( ON ?auto_10950 ?auto_10951 ) ( CLEAR ?auto_10950 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10947 ) ( ON ?auto_10948 ?auto_10947 ) ( ON ?auto_10949 ?auto_10948 ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10947 ?auto_10949 ) ) ( not ( = ?auto_10947 ?auto_10950 ) ) ( not ( = ?auto_10947 ?auto_10951 ) ) ( not ( = ?auto_10948 ?auto_10949 ) ) ( not ( = ?auto_10948 ?auto_10950 ) ) ( not ( = ?auto_10948 ?auto_10951 ) ) ( not ( = ?auto_10949 ?auto_10950 ) ) ( not ( = ?auto_10949 ?auto_10951 ) ) ( not ( = ?auto_10950 ?auto_10951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_10950 ?auto_10951 )
      ( !STACK ?auto_10950 ?auto_10949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10956 - BLOCK
      ?auto_10957 - BLOCK
      ?auto_10958 - BLOCK
      ?auto_10959 - BLOCK
    )
    :vars
    (
      ?auto_10960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10959 ?auto_10960 ) ( ON-TABLE ?auto_10956 ) ( ON ?auto_10957 ?auto_10956 ) ( not ( = ?auto_10956 ?auto_10957 ) ) ( not ( = ?auto_10956 ?auto_10958 ) ) ( not ( = ?auto_10956 ?auto_10959 ) ) ( not ( = ?auto_10956 ?auto_10960 ) ) ( not ( = ?auto_10957 ?auto_10958 ) ) ( not ( = ?auto_10957 ?auto_10959 ) ) ( not ( = ?auto_10957 ?auto_10960 ) ) ( not ( = ?auto_10958 ?auto_10959 ) ) ( not ( = ?auto_10958 ?auto_10960 ) ) ( not ( = ?auto_10959 ?auto_10960 ) ) ( CLEAR ?auto_10957 ) ( ON ?auto_10958 ?auto_10959 ) ( CLEAR ?auto_10958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10956 ?auto_10957 ?auto_10958 )
      ( MAKE-4PILE ?auto_10956 ?auto_10957 ?auto_10958 ?auto_10959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10965 - BLOCK
      ?auto_10966 - BLOCK
      ?auto_10967 - BLOCK
      ?auto_10968 - BLOCK
    )
    :vars
    (
      ?auto_10969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10968 ?auto_10969 ) ( ON-TABLE ?auto_10965 ) ( ON ?auto_10966 ?auto_10965 ) ( not ( = ?auto_10965 ?auto_10966 ) ) ( not ( = ?auto_10965 ?auto_10967 ) ) ( not ( = ?auto_10965 ?auto_10968 ) ) ( not ( = ?auto_10965 ?auto_10969 ) ) ( not ( = ?auto_10966 ?auto_10967 ) ) ( not ( = ?auto_10966 ?auto_10968 ) ) ( not ( = ?auto_10966 ?auto_10969 ) ) ( not ( = ?auto_10967 ?auto_10968 ) ) ( not ( = ?auto_10967 ?auto_10969 ) ) ( not ( = ?auto_10968 ?auto_10969 ) ) ( CLEAR ?auto_10966 ) ( ON ?auto_10967 ?auto_10968 ) ( CLEAR ?auto_10967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_10965 ?auto_10966 ?auto_10967 )
      ( MAKE-4PILE ?auto_10965 ?auto_10966 ?auto_10967 ?auto_10968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10974 - BLOCK
      ?auto_10975 - BLOCK
      ?auto_10976 - BLOCK
      ?auto_10977 - BLOCK
    )
    :vars
    (
      ?auto_10978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10977 ?auto_10978 ) ( ON-TABLE ?auto_10974 ) ( not ( = ?auto_10974 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( not ( = ?auto_10974 ?auto_10977 ) ) ( not ( = ?auto_10974 ?auto_10978 ) ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( not ( = ?auto_10975 ?auto_10977 ) ) ( not ( = ?auto_10975 ?auto_10978 ) ) ( not ( = ?auto_10976 ?auto_10977 ) ) ( not ( = ?auto_10976 ?auto_10978 ) ) ( not ( = ?auto_10977 ?auto_10978 ) ) ( ON ?auto_10976 ?auto_10977 ) ( CLEAR ?auto_10974 ) ( ON ?auto_10975 ?auto_10976 ) ( CLEAR ?auto_10975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10974 ?auto_10975 )
      ( MAKE-4PILE ?auto_10974 ?auto_10975 ?auto_10976 ?auto_10977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10983 - BLOCK
      ?auto_10984 - BLOCK
      ?auto_10985 - BLOCK
      ?auto_10986 - BLOCK
    )
    :vars
    (
      ?auto_10987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10986 ?auto_10987 ) ( ON-TABLE ?auto_10983 ) ( not ( = ?auto_10983 ?auto_10984 ) ) ( not ( = ?auto_10983 ?auto_10985 ) ) ( not ( = ?auto_10983 ?auto_10986 ) ) ( not ( = ?auto_10983 ?auto_10987 ) ) ( not ( = ?auto_10984 ?auto_10985 ) ) ( not ( = ?auto_10984 ?auto_10986 ) ) ( not ( = ?auto_10984 ?auto_10987 ) ) ( not ( = ?auto_10985 ?auto_10986 ) ) ( not ( = ?auto_10985 ?auto_10987 ) ) ( not ( = ?auto_10986 ?auto_10987 ) ) ( ON ?auto_10985 ?auto_10986 ) ( CLEAR ?auto_10983 ) ( ON ?auto_10984 ?auto_10985 ) ( CLEAR ?auto_10984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_10983 ?auto_10984 )
      ( MAKE-4PILE ?auto_10983 ?auto_10984 ?auto_10985 ?auto_10986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10992 - BLOCK
      ?auto_10993 - BLOCK
      ?auto_10994 - BLOCK
      ?auto_10995 - BLOCK
    )
    :vars
    (
      ?auto_10996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_10995 ?auto_10996 ) ( not ( = ?auto_10992 ?auto_10993 ) ) ( not ( = ?auto_10992 ?auto_10994 ) ) ( not ( = ?auto_10992 ?auto_10995 ) ) ( not ( = ?auto_10992 ?auto_10996 ) ) ( not ( = ?auto_10993 ?auto_10994 ) ) ( not ( = ?auto_10993 ?auto_10995 ) ) ( not ( = ?auto_10993 ?auto_10996 ) ) ( not ( = ?auto_10994 ?auto_10995 ) ) ( not ( = ?auto_10994 ?auto_10996 ) ) ( not ( = ?auto_10995 ?auto_10996 ) ) ( ON ?auto_10994 ?auto_10995 ) ( ON ?auto_10993 ?auto_10994 ) ( ON ?auto_10992 ?auto_10993 ) ( CLEAR ?auto_10992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10992 )
      ( MAKE-4PILE ?auto_10992 ?auto_10993 ?auto_10994 ?auto_10995 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11001 - BLOCK
      ?auto_11002 - BLOCK
      ?auto_11003 - BLOCK
      ?auto_11004 - BLOCK
    )
    :vars
    (
      ?auto_11005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11004 ?auto_11005 ) ( not ( = ?auto_11001 ?auto_11002 ) ) ( not ( = ?auto_11001 ?auto_11003 ) ) ( not ( = ?auto_11001 ?auto_11004 ) ) ( not ( = ?auto_11001 ?auto_11005 ) ) ( not ( = ?auto_11002 ?auto_11003 ) ) ( not ( = ?auto_11002 ?auto_11004 ) ) ( not ( = ?auto_11002 ?auto_11005 ) ) ( not ( = ?auto_11003 ?auto_11004 ) ) ( not ( = ?auto_11003 ?auto_11005 ) ) ( not ( = ?auto_11004 ?auto_11005 ) ) ( ON ?auto_11003 ?auto_11004 ) ( ON ?auto_11002 ?auto_11003 ) ( ON ?auto_11001 ?auto_11002 ) ( CLEAR ?auto_11001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11001 )
      ( MAKE-4PILE ?auto_11001 ?auto_11002 ?auto_11003 ?auto_11004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11011 - BLOCK
      ?auto_11012 - BLOCK
      ?auto_11013 - BLOCK
      ?auto_11014 - BLOCK
      ?auto_11015 - BLOCK
    )
    :vars
    (
      ?auto_11016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11014 ) ( ON ?auto_11015 ?auto_11016 ) ( CLEAR ?auto_11015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11011 ) ( ON ?auto_11012 ?auto_11011 ) ( ON ?auto_11013 ?auto_11012 ) ( ON ?auto_11014 ?auto_11013 ) ( not ( = ?auto_11011 ?auto_11012 ) ) ( not ( = ?auto_11011 ?auto_11013 ) ) ( not ( = ?auto_11011 ?auto_11014 ) ) ( not ( = ?auto_11011 ?auto_11015 ) ) ( not ( = ?auto_11011 ?auto_11016 ) ) ( not ( = ?auto_11012 ?auto_11013 ) ) ( not ( = ?auto_11012 ?auto_11014 ) ) ( not ( = ?auto_11012 ?auto_11015 ) ) ( not ( = ?auto_11012 ?auto_11016 ) ) ( not ( = ?auto_11013 ?auto_11014 ) ) ( not ( = ?auto_11013 ?auto_11015 ) ) ( not ( = ?auto_11013 ?auto_11016 ) ) ( not ( = ?auto_11014 ?auto_11015 ) ) ( not ( = ?auto_11014 ?auto_11016 ) ) ( not ( = ?auto_11015 ?auto_11016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11015 ?auto_11016 )
      ( !STACK ?auto_11015 ?auto_11014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11022 - BLOCK
      ?auto_11023 - BLOCK
      ?auto_11024 - BLOCK
      ?auto_11025 - BLOCK
      ?auto_11026 - BLOCK
    )
    :vars
    (
      ?auto_11027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11025 ) ( ON ?auto_11026 ?auto_11027 ) ( CLEAR ?auto_11026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11022 ) ( ON ?auto_11023 ?auto_11022 ) ( ON ?auto_11024 ?auto_11023 ) ( ON ?auto_11025 ?auto_11024 ) ( not ( = ?auto_11022 ?auto_11023 ) ) ( not ( = ?auto_11022 ?auto_11024 ) ) ( not ( = ?auto_11022 ?auto_11025 ) ) ( not ( = ?auto_11022 ?auto_11026 ) ) ( not ( = ?auto_11022 ?auto_11027 ) ) ( not ( = ?auto_11023 ?auto_11024 ) ) ( not ( = ?auto_11023 ?auto_11025 ) ) ( not ( = ?auto_11023 ?auto_11026 ) ) ( not ( = ?auto_11023 ?auto_11027 ) ) ( not ( = ?auto_11024 ?auto_11025 ) ) ( not ( = ?auto_11024 ?auto_11026 ) ) ( not ( = ?auto_11024 ?auto_11027 ) ) ( not ( = ?auto_11025 ?auto_11026 ) ) ( not ( = ?auto_11025 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11026 ?auto_11027 )
      ( !STACK ?auto_11026 ?auto_11025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11033 - BLOCK
      ?auto_11034 - BLOCK
      ?auto_11035 - BLOCK
      ?auto_11036 - BLOCK
      ?auto_11037 - BLOCK
    )
    :vars
    (
      ?auto_11038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11037 ?auto_11038 ) ( ON-TABLE ?auto_11033 ) ( ON ?auto_11034 ?auto_11033 ) ( ON ?auto_11035 ?auto_11034 ) ( not ( = ?auto_11033 ?auto_11034 ) ) ( not ( = ?auto_11033 ?auto_11035 ) ) ( not ( = ?auto_11033 ?auto_11036 ) ) ( not ( = ?auto_11033 ?auto_11037 ) ) ( not ( = ?auto_11033 ?auto_11038 ) ) ( not ( = ?auto_11034 ?auto_11035 ) ) ( not ( = ?auto_11034 ?auto_11036 ) ) ( not ( = ?auto_11034 ?auto_11037 ) ) ( not ( = ?auto_11034 ?auto_11038 ) ) ( not ( = ?auto_11035 ?auto_11036 ) ) ( not ( = ?auto_11035 ?auto_11037 ) ) ( not ( = ?auto_11035 ?auto_11038 ) ) ( not ( = ?auto_11036 ?auto_11037 ) ) ( not ( = ?auto_11036 ?auto_11038 ) ) ( not ( = ?auto_11037 ?auto_11038 ) ) ( CLEAR ?auto_11035 ) ( ON ?auto_11036 ?auto_11037 ) ( CLEAR ?auto_11036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11033 ?auto_11034 ?auto_11035 ?auto_11036 )
      ( MAKE-5PILE ?auto_11033 ?auto_11034 ?auto_11035 ?auto_11036 ?auto_11037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11044 - BLOCK
      ?auto_11045 - BLOCK
      ?auto_11046 - BLOCK
      ?auto_11047 - BLOCK
      ?auto_11048 - BLOCK
    )
    :vars
    (
      ?auto_11049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11048 ?auto_11049 ) ( ON-TABLE ?auto_11044 ) ( ON ?auto_11045 ?auto_11044 ) ( ON ?auto_11046 ?auto_11045 ) ( not ( = ?auto_11044 ?auto_11045 ) ) ( not ( = ?auto_11044 ?auto_11046 ) ) ( not ( = ?auto_11044 ?auto_11047 ) ) ( not ( = ?auto_11044 ?auto_11048 ) ) ( not ( = ?auto_11044 ?auto_11049 ) ) ( not ( = ?auto_11045 ?auto_11046 ) ) ( not ( = ?auto_11045 ?auto_11047 ) ) ( not ( = ?auto_11045 ?auto_11048 ) ) ( not ( = ?auto_11045 ?auto_11049 ) ) ( not ( = ?auto_11046 ?auto_11047 ) ) ( not ( = ?auto_11046 ?auto_11048 ) ) ( not ( = ?auto_11046 ?auto_11049 ) ) ( not ( = ?auto_11047 ?auto_11048 ) ) ( not ( = ?auto_11047 ?auto_11049 ) ) ( not ( = ?auto_11048 ?auto_11049 ) ) ( CLEAR ?auto_11046 ) ( ON ?auto_11047 ?auto_11048 ) ( CLEAR ?auto_11047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11044 ?auto_11045 ?auto_11046 ?auto_11047 )
      ( MAKE-5PILE ?auto_11044 ?auto_11045 ?auto_11046 ?auto_11047 ?auto_11048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11055 - BLOCK
      ?auto_11056 - BLOCK
      ?auto_11057 - BLOCK
      ?auto_11058 - BLOCK
      ?auto_11059 - BLOCK
    )
    :vars
    (
      ?auto_11060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11059 ?auto_11060 ) ( ON-TABLE ?auto_11055 ) ( ON ?auto_11056 ?auto_11055 ) ( not ( = ?auto_11055 ?auto_11056 ) ) ( not ( = ?auto_11055 ?auto_11057 ) ) ( not ( = ?auto_11055 ?auto_11058 ) ) ( not ( = ?auto_11055 ?auto_11059 ) ) ( not ( = ?auto_11055 ?auto_11060 ) ) ( not ( = ?auto_11056 ?auto_11057 ) ) ( not ( = ?auto_11056 ?auto_11058 ) ) ( not ( = ?auto_11056 ?auto_11059 ) ) ( not ( = ?auto_11056 ?auto_11060 ) ) ( not ( = ?auto_11057 ?auto_11058 ) ) ( not ( = ?auto_11057 ?auto_11059 ) ) ( not ( = ?auto_11057 ?auto_11060 ) ) ( not ( = ?auto_11058 ?auto_11059 ) ) ( not ( = ?auto_11058 ?auto_11060 ) ) ( not ( = ?auto_11059 ?auto_11060 ) ) ( ON ?auto_11058 ?auto_11059 ) ( CLEAR ?auto_11056 ) ( ON ?auto_11057 ?auto_11058 ) ( CLEAR ?auto_11057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11055 ?auto_11056 ?auto_11057 )
      ( MAKE-5PILE ?auto_11055 ?auto_11056 ?auto_11057 ?auto_11058 ?auto_11059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11066 - BLOCK
      ?auto_11067 - BLOCK
      ?auto_11068 - BLOCK
      ?auto_11069 - BLOCK
      ?auto_11070 - BLOCK
    )
    :vars
    (
      ?auto_11071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11070 ?auto_11071 ) ( ON-TABLE ?auto_11066 ) ( ON ?auto_11067 ?auto_11066 ) ( not ( = ?auto_11066 ?auto_11067 ) ) ( not ( = ?auto_11066 ?auto_11068 ) ) ( not ( = ?auto_11066 ?auto_11069 ) ) ( not ( = ?auto_11066 ?auto_11070 ) ) ( not ( = ?auto_11066 ?auto_11071 ) ) ( not ( = ?auto_11067 ?auto_11068 ) ) ( not ( = ?auto_11067 ?auto_11069 ) ) ( not ( = ?auto_11067 ?auto_11070 ) ) ( not ( = ?auto_11067 ?auto_11071 ) ) ( not ( = ?auto_11068 ?auto_11069 ) ) ( not ( = ?auto_11068 ?auto_11070 ) ) ( not ( = ?auto_11068 ?auto_11071 ) ) ( not ( = ?auto_11069 ?auto_11070 ) ) ( not ( = ?auto_11069 ?auto_11071 ) ) ( not ( = ?auto_11070 ?auto_11071 ) ) ( ON ?auto_11069 ?auto_11070 ) ( CLEAR ?auto_11067 ) ( ON ?auto_11068 ?auto_11069 ) ( CLEAR ?auto_11068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11066 ?auto_11067 ?auto_11068 )
      ( MAKE-5PILE ?auto_11066 ?auto_11067 ?auto_11068 ?auto_11069 ?auto_11070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11077 - BLOCK
      ?auto_11078 - BLOCK
      ?auto_11079 - BLOCK
      ?auto_11080 - BLOCK
      ?auto_11081 - BLOCK
    )
    :vars
    (
      ?auto_11082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11081 ?auto_11082 ) ( ON-TABLE ?auto_11077 ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( not ( = ?auto_11077 ?auto_11079 ) ) ( not ( = ?auto_11077 ?auto_11080 ) ) ( not ( = ?auto_11077 ?auto_11081 ) ) ( not ( = ?auto_11077 ?auto_11082 ) ) ( not ( = ?auto_11078 ?auto_11079 ) ) ( not ( = ?auto_11078 ?auto_11080 ) ) ( not ( = ?auto_11078 ?auto_11081 ) ) ( not ( = ?auto_11078 ?auto_11082 ) ) ( not ( = ?auto_11079 ?auto_11080 ) ) ( not ( = ?auto_11079 ?auto_11081 ) ) ( not ( = ?auto_11079 ?auto_11082 ) ) ( not ( = ?auto_11080 ?auto_11081 ) ) ( not ( = ?auto_11080 ?auto_11082 ) ) ( not ( = ?auto_11081 ?auto_11082 ) ) ( ON ?auto_11080 ?auto_11081 ) ( ON ?auto_11079 ?auto_11080 ) ( CLEAR ?auto_11077 ) ( ON ?auto_11078 ?auto_11079 ) ( CLEAR ?auto_11078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11077 ?auto_11078 )
      ( MAKE-5PILE ?auto_11077 ?auto_11078 ?auto_11079 ?auto_11080 ?auto_11081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11088 - BLOCK
      ?auto_11089 - BLOCK
      ?auto_11090 - BLOCK
      ?auto_11091 - BLOCK
      ?auto_11092 - BLOCK
    )
    :vars
    (
      ?auto_11093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11092 ?auto_11093 ) ( ON-TABLE ?auto_11088 ) ( not ( = ?auto_11088 ?auto_11089 ) ) ( not ( = ?auto_11088 ?auto_11090 ) ) ( not ( = ?auto_11088 ?auto_11091 ) ) ( not ( = ?auto_11088 ?auto_11092 ) ) ( not ( = ?auto_11088 ?auto_11093 ) ) ( not ( = ?auto_11089 ?auto_11090 ) ) ( not ( = ?auto_11089 ?auto_11091 ) ) ( not ( = ?auto_11089 ?auto_11092 ) ) ( not ( = ?auto_11089 ?auto_11093 ) ) ( not ( = ?auto_11090 ?auto_11091 ) ) ( not ( = ?auto_11090 ?auto_11092 ) ) ( not ( = ?auto_11090 ?auto_11093 ) ) ( not ( = ?auto_11091 ?auto_11092 ) ) ( not ( = ?auto_11091 ?auto_11093 ) ) ( not ( = ?auto_11092 ?auto_11093 ) ) ( ON ?auto_11091 ?auto_11092 ) ( ON ?auto_11090 ?auto_11091 ) ( CLEAR ?auto_11088 ) ( ON ?auto_11089 ?auto_11090 ) ( CLEAR ?auto_11089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11088 ?auto_11089 )
      ( MAKE-5PILE ?auto_11088 ?auto_11089 ?auto_11090 ?auto_11091 ?auto_11092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11099 - BLOCK
      ?auto_11100 - BLOCK
      ?auto_11101 - BLOCK
      ?auto_11102 - BLOCK
      ?auto_11103 - BLOCK
    )
    :vars
    (
      ?auto_11104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11103 ?auto_11104 ) ( not ( = ?auto_11099 ?auto_11100 ) ) ( not ( = ?auto_11099 ?auto_11101 ) ) ( not ( = ?auto_11099 ?auto_11102 ) ) ( not ( = ?auto_11099 ?auto_11103 ) ) ( not ( = ?auto_11099 ?auto_11104 ) ) ( not ( = ?auto_11100 ?auto_11101 ) ) ( not ( = ?auto_11100 ?auto_11102 ) ) ( not ( = ?auto_11100 ?auto_11103 ) ) ( not ( = ?auto_11100 ?auto_11104 ) ) ( not ( = ?auto_11101 ?auto_11102 ) ) ( not ( = ?auto_11101 ?auto_11103 ) ) ( not ( = ?auto_11101 ?auto_11104 ) ) ( not ( = ?auto_11102 ?auto_11103 ) ) ( not ( = ?auto_11102 ?auto_11104 ) ) ( not ( = ?auto_11103 ?auto_11104 ) ) ( ON ?auto_11102 ?auto_11103 ) ( ON ?auto_11101 ?auto_11102 ) ( ON ?auto_11100 ?auto_11101 ) ( ON ?auto_11099 ?auto_11100 ) ( CLEAR ?auto_11099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11099 )
      ( MAKE-5PILE ?auto_11099 ?auto_11100 ?auto_11101 ?auto_11102 ?auto_11103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11110 - BLOCK
      ?auto_11111 - BLOCK
      ?auto_11112 - BLOCK
      ?auto_11113 - BLOCK
      ?auto_11114 - BLOCK
    )
    :vars
    (
      ?auto_11115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11114 ?auto_11115 ) ( not ( = ?auto_11110 ?auto_11111 ) ) ( not ( = ?auto_11110 ?auto_11112 ) ) ( not ( = ?auto_11110 ?auto_11113 ) ) ( not ( = ?auto_11110 ?auto_11114 ) ) ( not ( = ?auto_11110 ?auto_11115 ) ) ( not ( = ?auto_11111 ?auto_11112 ) ) ( not ( = ?auto_11111 ?auto_11113 ) ) ( not ( = ?auto_11111 ?auto_11114 ) ) ( not ( = ?auto_11111 ?auto_11115 ) ) ( not ( = ?auto_11112 ?auto_11113 ) ) ( not ( = ?auto_11112 ?auto_11114 ) ) ( not ( = ?auto_11112 ?auto_11115 ) ) ( not ( = ?auto_11113 ?auto_11114 ) ) ( not ( = ?auto_11113 ?auto_11115 ) ) ( not ( = ?auto_11114 ?auto_11115 ) ) ( ON ?auto_11113 ?auto_11114 ) ( ON ?auto_11112 ?auto_11113 ) ( ON ?auto_11111 ?auto_11112 ) ( ON ?auto_11110 ?auto_11111 ) ( CLEAR ?auto_11110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11110 )
      ( MAKE-5PILE ?auto_11110 ?auto_11111 ?auto_11112 ?auto_11113 ?auto_11114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11122 - BLOCK
      ?auto_11123 - BLOCK
      ?auto_11124 - BLOCK
      ?auto_11125 - BLOCK
      ?auto_11126 - BLOCK
      ?auto_11127 - BLOCK
    )
    :vars
    (
      ?auto_11128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11126 ) ( ON ?auto_11127 ?auto_11128 ) ( CLEAR ?auto_11127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11122 ) ( ON ?auto_11123 ?auto_11122 ) ( ON ?auto_11124 ?auto_11123 ) ( ON ?auto_11125 ?auto_11124 ) ( ON ?auto_11126 ?auto_11125 ) ( not ( = ?auto_11122 ?auto_11123 ) ) ( not ( = ?auto_11122 ?auto_11124 ) ) ( not ( = ?auto_11122 ?auto_11125 ) ) ( not ( = ?auto_11122 ?auto_11126 ) ) ( not ( = ?auto_11122 ?auto_11127 ) ) ( not ( = ?auto_11122 ?auto_11128 ) ) ( not ( = ?auto_11123 ?auto_11124 ) ) ( not ( = ?auto_11123 ?auto_11125 ) ) ( not ( = ?auto_11123 ?auto_11126 ) ) ( not ( = ?auto_11123 ?auto_11127 ) ) ( not ( = ?auto_11123 ?auto_11128 ) ) ( not ( = ?auto_11124 ?auto_11125 ) ) ( not ( = ?auto_11124 ?auto_11126 ) ) ( not ( = ?auto_11124 ?auto_11127 ) ) ( not ( = ?auto_11124 ?auto_11128 ) ) ( not ( = ?auto_11125 ?auto_11126 ) ) ( not ( = ?auto_11125 ?auto_11127 ) ) ( not ( = ?auto_11125 ?auto_11128 ) ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) ( not ( = ?auto_11127 ?auto_11128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11127 ?auto_11128 )
      ( !STACK ?auto_11127 ?auto_11126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11135 - BLOCK
      ?auto_11136 - BLOCK
      ?auto_11137 - BLOCK
      ?auto_11138 - BLOCK
      ?auto_11139 - BLOCK
      ?auto_11140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11139 ) ( ON-TABLE ?auto_11140 ) ( CLEAR ?auto_11140 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11135 ) ( ON ?auto_11136 ?auto_11135 ) ( ON ?auto_11137 ?auto_11136 ) ( ON ?auto_11138 ?auto_11137 ) ( ON ?auto_11139 ?auto_11138 ) ( not ( = ?auto_11135 ?auto_11136 ) ) ( not ( = ?auto_11135 ?auto_11137 ) ) ( not ( = ?auto_11135 ?auto_11138 ) ) ( not ( = ?auto_11135 ?auto_11139 ) ) ( not ( = ?auto_11135 ?auto_11140 ) ) ( not ( = ?auto_11136 ?auto_11137 ) ) ( not ( = ?auto_11136 ?auto_11138 ) ) ( not ( = ?auto_11136 ?auto_11139 ) ) ( not ( = ?auto_11136 ?auto_11140 ) ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( not ( = ?auto_11137 ?auto_11139 ) ) ( not ( = ?auto_11137 ?auto_11140 ) ) ( not ( = ?auto_11138 ?auto_11139 ) ) ( not ( = ?auto_11138 ?auto_11140 ) ) ( not ( = ?auto_11139 ?auto_11140 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_11140 )
      ( !STACK ?auto_11140 ?auto_11139 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11147 - BLOCK
      ?auto_11148 - BLOCK
      ?auto_11149 - BLOCK
      ?auto_11150 - BLOCK
      ?auto_11151 - BLOCK
      ?auto_11152 - BLOCK
    )
    :vars
    (
      ?auto_11153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11152 ?auto_11153 ) ( ON-TABLE ?auto_11147 ) ( ON ?auto_11148 ?auto_11147 ) ( ON ?auto_11149 ?auto_11148 ) ( ON ?auto_11150 ?auto_11149 ) ( not ( = ?auto_11147 ?auto_11148 ) ) ( not ( = ?auto_11147 ?auto_11149 ) ) ( not ( = ?auto_11147 ?auto_11150 ) ) ( not ( = ?auto_11147 ?auto_11151 ) ) ( not ( = ?auto_11147 ?auto_11152 ) ) ( not ( = ?auto_11147 ?auto_11153 ) ) ( not ( = ?auto_11148 ?auto_11149 ) ) ( not ( = ?auto_11148 ?auto_11150 ) ) ( not ( = ?auto_11148 ?auto_11151 ) ) ( not ( = ?auto_11148 ?auto_11152 ) ) ( not ( = ?auto_11148 ?auto_11153 ) ) ( not ( = ?auto_11149 ?auto_11150 ) ) ( not ( = ?auto_11149 ?auto_11151 ) ) ( not ( = ?auto_11149 ?auto_11152 ) ) ( not ( = ?auto_11149 ?auto_11153 ) ) ( not ( = ?auto_11150 ?auto_11151 ) ) ( not ( = ?auto_11150 ?auto_11152 ) ) ( not ( = ?auto_11150 ?auto_11153 ) ) ( not ( = ?auto_11151 ?auto_11152 ) ) ( not ( = ?auto_11151 ?auto_11153 ) ) ( not ( = ?auto_11152 ?auto_11153 ) ) ( CLEAR ?auto_11150 ) ( ON ?auto_11151 ?auto_11152 ) ( CLEAR ?auto_11151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_11147 ?auto_11148 ?auto_11149 ?auto_11150 ?auto_11151 )
      ( MAKE-6PILE ?auto_11147 ?auto_11148 ?auto_11149 ?auto_11150 ?auto_11151 ?auto_11152 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11160 - BLOCK
      ?auto_11161 - BLOCK
      ?auto_11162 - BLOCK
      ?auto_11163 - BLOCK
      ?auto_11164 - BLOCK
      ?auto_11165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11165 ) ( ON-TABLE ?auto_11160 ) ( ON ?auto_11161 ?auto_11160 ) ( ON ?auto_11162 ?auto_11161 ) ( ON ?auto_11163 ?auto_11162 ) ( not ( = ?auto_11160 ?auto_11161 ) ) ( not ( = ?auto_11160 ?auto_11162 ) ) ( not ( = ?auto_11160 ?auto_11163 ) ) ( not ( = ?auto_11160 ?auto_11164 ) ) ( not ( = ?auto_11160 ?auto_11165 ) ) ( not ( = ?auto_11161 ?auto_11162 ) ) ( not ( = ?auto_11161 ?auto_11163 ) ) ( not ( = ?auto_11161 ?auto_11164 ) ) ( not ( = ?auto_11161 ?auto_11165 ) ) ( not ( = ?auto_11162 ?auto_11163 ) ) ( not ( = ?auto_11162 ?auto_11164 ) ) ( not ( = ?auto_11162 ?auto_11165 ) ) ( not ( = ?auto_11163 ?auto_11164 ) ) ( not ( = ?auto_11163 ?auto_11165 ) ) ( not ( = ?auto_11164 ?auto_11165 ) ) ( CLEAR ?auto_11163 ) ( ON ?auto_11164 ?auto_11165 ) ( CLEAR ?auto_11164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_11160 ?auto_11161 ?auto_11162 ?auto_11163 ?auto_11164 )
      ( MAKE-6PILE ?auto_11160 ?auto_11161 ?auto_11162 ?auto_11163 ?auto_11164 ?auto_11165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11172 - BLOCK
      ?auto_11173 - BLOCK
      ?auto_11174 - BLOCK
      ?auto_11175 - BLOCK
      ?auto_11176 - BLOCK
      ?auto_11177 - BLOCK
    )
    :vars
    (
      ?auto_11178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11177 ?auto_11178 ) ( ON-TABLE ?auto_11172 ) ( ON ?auto_11173 ?auto_11172 ) ( ON ?auto_11174 ?auto_11173 ) ( not ( = ?auto_11172 ?auto_11173 ) ) ( not ( = ?auto_11172 ?auto_11174 ) ) ( not ( = ?auto_11172 ?auto_11175 ) ) ( not ( = ?auto_11172 ?auto_11176 ) ) ( not ( = ?auto_11172 ?auto_11177 ) ) ( not ( = ?auto_11172 ?auto_11178 ) ) ( not ( = ?auto_11173 ?auto_11174 ) ) ( not ( = ?auto_11173 ?auto_11175 ) ) ( not ( = ?auto_11173 ?auto_11176 ) ) ( not ( = ?auto_11173 ?auto_11177 ) ) ( not ( = ?auto_11173 ?auto_11178 ) ) ( not ( = ?auto_11174 ?auto_11175 ) ) ( not ( = ?auto_11174 ?auto_11176 ) ) ( not ( = ?auto_11174 ?auto_11177 ) ) ( not ( = ?auto_11174 ?auto_11178 ) ) ( not ( = ?auto_11175 ?auto_11176 ) ) ( not ( = ?auto_11175 ?auto_11177 ) ) ( not ( = ?auto_11175 ?auto_11178 ) ) ( not ( = ?auto_11176 ?auto_11177 ) ) ( not ( = ?auto_11176 ?auto_11178 ) ) ( not ( = ?auto_11177 ?auto_11178 ) ) ( ON ?auto_11176 ?auto_11177 ) ( CLEAR ?auto_11174 ) ( ON ?auto_11175 ?auto_11176 ) ( CLEAR ?auto_11175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11172 ?auto_11173 ?auto_11174 ?auto_11175 )
      ( MAKE-6PILE ?auto_11172 ?auto_11173 ?auto_11174 ?auto_11175 ?auto_11176 ?auto_11177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11185 - BLOCK
      ?auto_11186 - BLOCK
      ?auto_11187 - BLOCK
      ?auto_11188 - BLOCK
      ?auto_11189 - BLOCK
      ?auto_11190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11190 ) ( ON-TABLE ?auto_11185 ) ( ON ?auto_11186 ?auto_11185 ) ( ON ?auto_11187 ?auto_11186 ) ( not ( = ?auto_11185 ?auto_11186 ) ) ( not ( = ?auto_11185 ?auto_11187 ) ) ( not ( = ?auto_11185 ?auto_11188 ) ) ( not ( = ?auto_11185 ?auto_11189 ) ) ( not ( = ?auto_11185 ?auto_11190 ) ) ( not ( = ?auto_11186 ?auto_11187 ) ) ( not ( = ?auto_11186 ?auto_11188 ) ) ( not ( = ?auto_11186 ?auto_11189 ) ) ( not ( = ?auto_11186 ?auto_11190 ) ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11189 ) ) ( not ( = ?auto_11187 ?auto_11190 ) ) ( not ( = ?auto_11188 ?auto_11189 ) ) ( not ( = ?auto_11188 ?auto_11190 ) ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( ON ?auto_11189 ?auto_11190 ) ( CLEAR ?auto_11187 ) ( ON ?auto_11188 ?auto_11189 ) ( CLEAR ?auto_11188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11185 ?auto_11186 ?auto_11187 ?auto_11188 )
      ( MAKE-6PILE ?auto_11185 ?auto_11186 ?auto_11187 ?auto_11188 ?auto_11189 ?auto_11190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11197 - BLOCK
      ?auto_11198 - BLOCK
      ?auto_11199 - BLOCK
      ?auto_11200 - BLOCK
      ?auto_11201 - BLOCK
      ?auto_11202 - BLOCK
    )
    :vars
    (
      ?auto_11203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11202 ?auto_11203 ) ( ON-TABLE ?auto_11197 ) ( ON ?auto_11198 ?auto_11197 ) ( not ( = ?auto_11197 ?auto_11198 ) ) ( not ( = ?auto_11197 ?auto_11199 ) ) ( not ( = ?auto_11197 ?auto_11200 ) ) ( not ( = ?auto_11197 ?auto_11201 ) ) ( not ( = ?auto_11197 ?auto_11202 ) ) ( not ( = ?auto_11197 ?auto_11203 ) ) ( not ( = ?auto_11198 ?auto_11199 ) ) ( not ( = ?auto_11198 ?auto_11200 ) ) ( not ( = ?auto_11198 ?auto_11201 ) ) ( not ( = ?auto_11198 ?auto_11202 ) ) ( not ( = ?auto_11198 ?auto_11203 ) ) ( not ( = ?auto_11199 ?auto_11200 ) ) ( not ( = ?auto_11199 ?auto_11201 ) ) ( not ( = ?auto_11199 ?auto_11202 ) ) ( not ( = ?auto_11199 ?auto_11203 ) ) ( not ( = ?auto_11200 ?auto_11201 ) ) ( not ( = ?auto_11200 ?auto_11202 ) ) ( not ( = ?auto_11200 ?auto_11203 ) ) ( not ( = ?auto_11201 ?auto_11202 ) ) ( not ( = ?auto_11201 ?auto_11203 ) ) ( not ( = ?auto_11202 ?auto_11203 ) ) ( ON ?auto_11201 ?auto_11202 ) ( ON ?auto_11200 ?auto_11201 ) ( CLEAR ?auto_11198 ) ( ON ?auto_11199 ?auto_11200 ) ( CLEAR ?auto_11199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11197 ?auto_11198 ?auto_11199 )
      ( MAKE-6PILE ?auto_11197 ?auto_11198 ?auto_11199 ?auto_11200 ?auto_11201 ?auto_11202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11210 - BLOCK
      ?auto_11211 - BLOCK
      ?auto_11212 - BLOCK
      ?auto_11213 - BLOCK
      ?auto_11214 - BLOCK
      ?auto_11215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11215 ) ( ON-TABLE ?auto_11210 ) ( ON ?auto_11211 ?auto_11210 ) ( not ( = ?auto_11210 ?auto_11211 ) ) ( not ( = ?auto_11210 ?auto_11212 ) ) ( not ( = ?auto_11210 ?auto_11213 ) ) ( not ( = ?auto_11210 ?auto_11214 ) ) ( not ( = ?auto_11210 ?auto_11215 ) ) ( not ( = ?auto_11211 ?auto_11212 ) ) ( not ( = ?auto_11211 ?auto_11213 ) ) ( not ( = ?auto_11211 ?auto_11214 ) ) ( not ( = ?auto_11211 ?auto_11215 ) ) ( not ( = ?auto_11212 ?auto_11213 ) ) ( not ( = ?auto_11212 ?auto_11214 ) ) ( not ( = ?auto_11212 ?auto_11215 ) ) ( not ( = ?auto_11213 ?auto_11214 ) ) ( not ( = ?auto_11213 ?auto_11215 ) ) ( not ( = ?auto_11214 ?auto_11215 ) ) ( ON ?auto_11214 ?auto_11215 ) ( ON ?auto_11213 ?auto_11214 ) ( CLEAR ?auto_11211 ) ( ON ?auto_11212 ?auto_11213 ) ( CLEAR ?auto_11212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11210 ?auto_11211 ?auto_11212 )
      ( MAKE-6PILE ?auto_11210 ?auto_11211 ?auto_11212 ?auto_11213 ?auto_11214 ?auto_11215 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11222 - BLOCK
      ?auto_11223 - BLOCK
      ?auto_11224 - BLOCK
      ?auto_11225 - BLOCK
      ?auto_11226 - BLOCK
      ?auto_11227 - BLOCK
    )
    :vars
    (
      ?auto_11228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11227 ?auto_11228 ) ( ON-TABLE ?auto_11222 ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11224 ) ) ( not ( = ?auto_11222 ?auto_11225 ) ) ( not ( = ?auto_11222 ?auto_11226 ) ) ( not ( = ?auto_11222 ?auto_11227 ) ) ( not ( = ?auto_11222 ?auto_11228 ) ) ( not ( = ?auto_11223 ?auto_11224 ) ) ( not ( = ?auto_11223 ?auto_11225 ) ) ( not ( = ?auto_11223 ?auto_11226 ) ) ( not ( = ?auto_11223 ?auto_11227 ) ) ( not ( = ?auto_11223 ?auto_11228 ) ) ( not ( = ?auto_11224 ?auto_11225 ) ) ( not ( = ?auto_11224 ?auto_11226 ) ) ( not ( = ?auto_11224 ?auto_11227 ) ) ( not ( = ?auto_11224 ?auto_11228 ) ) ( not ( = ?auto_11225 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11227 ) ) ( not ( = ?auto_11225 ?auto_11228 ) ) ( not ( = ?auto_11226 ?auto_11227 ) ) ( not ( = ?auto_11226 ?auto_11228 ) ) ( not ( = ?auto_11227 ?auto_11228 ) ) ( ON ?auto_11226 ?auto_11227 ) ( ON ?auto_11225 ?auto_11226 ) ( ON ?auto_11224 ?auto_11225 ) ( CLEAR ?auto_11222 ) ( ON ?auto_11223 ?auto_11224 ) ( CLEAR ?auto_11223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11222 ?auto_11223 )
      ( MAKE-6PILE ?auto_11222 ?auto_11223 ?auto_11224 ?auto_11225 ?auto_11226 ?auto_11227 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11235 - BLOCK
      ?auto_11236 - BLOCK
      ?auto_11237 - BLOCK
      ?auto_11238 - BLOCK
      ?auto_11239 - BLOCK
      ?auto_11240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11240 ) ( ON-TABLE ?auto_11235 ) ( not ( = ?auto_11235 ?auto_11236 ) ) ( not ( = ?auto_11235 ?auto_11237 ) ) ( not ( = ?auto_11235 ?auto_11238 ) ) ( not ( = ?auto_11235 ?auto_11239 ) ) ( not ( = ?auto_11235 ?auto_11240 ) ) ( not ( = ?auto_11236 ?auto_11237 ) ) ( not ( = ?auto_11236 ?auto_11238 ) ) ( not ( = ?auto_11236 ?auto_11239 ) ) ( not ( = ?auto_11236 ?auto_11240 ) ) ( not ( = ?auto_11237 ?auto_11238 ) ) ( not ( = ?auto_11237 ?auto_11239 ) ) ( not ( = ?auto_11237 ?auto_11240 ) ) ( not ( = ?auto_11238 ?auto_11239 ) ) ( not ( = ?auto_11238 ?auto_11240 ) ) ( not ( = ?auto_11239 ?auto_11240 ) ) ( ON ?auto_11239 ?auto_11240 ) ( ON ?auto_11238 ?auto_11239 ) ( ON ?auto_11237 ?auto_11238 ) ( CLEAR ?auto_11235 ) ( ON ?auto_11236 ?auto_11237 ) ( CLEAR ?auto_11236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11235 ?auto_11236 )
      ( MAKE-6PILE ?auto_11235 ?auto_11236 ?auto_11237 ?auto_11238 ?auto_11239 ?auto_11240 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11247 - BLOCK
      ?auto_11248 - BLOCK
      ?auto_11249 - BLOCK
      ?auto_11250 - BLOCK
      ?auto_11251 - BLOCK
      ?auto_11252 - BLOCK
    )
    :vars
    (
      ?auto_11253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11252 ?auto_11253 ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11249 ) ) ( not ( = ?auto_11247 ?auto_11250 ) ) ( not ( = ?auto_11247 ?auto_11251 ) ) ( not ( = ?auto_11247 ?auto_11252 ) ) ( not ( = ?auto_11247 ?auto_11253 ) ) ( not ( = ?auto_11248 ?auto_11249 ) ) ( not ( = ?auto_11248 ?auto_11250 ) ) ( not ( = ?auto_11248 ?auto_11251 ) ) ( not ( = ?auto_11248 ?auto_11252 ) ) ( not ( = ?auto_11248 ?auto_11253 ) ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11251 ) ) ( not ( = ?auto_11249 ?auto_11252 ) ) ( not ( = ?auto_11249 ?auto_11253 ) ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( not ( = ?auto_11250 ?auto_11252 ) ) ( not ( = ?auto_11250 ?auto_11253 ) ) ( not ( = ?auto_11251 ?auto_11252 ) ) ( not ( = ?auto_11251 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11253 ) ) ( ON ?auto_11251 ?auto_11252 ) ( ON ?auto_11250 ?auto_11251 ) ( ON ?auto_11249 ?auto_11250 ) ( ON ?auto_11248 ?auto_11249 ) ( ON ?auto_11247 ?auto_11248 ) ( CLEAR ?auto_11247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11247 )
      ( MAKE-6PILE ?auto_11247 ?auto_11248 ?auto_11249 ?auto_11250 ?auto_11251 ?auto_11252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11260 - BLOCK
      ?auto_11261 - BLOCK
      ?auto_11262 - BLOCK
      ?auto_11263 - BLOCK
      ?auto_11264 - BLOCK
      ?auto_11265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11265 ) ( not ( = ?auto_11260 ?auto_11261 ) ) ( not ( = ?auto_11260 ?auto_11262 ) ) ( not ( = ?auto_11260 ?auto_11263 ) ) ( not ( = ?auto_11260 ?auto_11264 ) ) ( not ( = ?auto_11260 ?auto_11265 ) ) ( not ( = ?auto_11261 ?auto_11262 ) ) ( not ( = ?auto_11261 ?auto_11263 ) ) ( not ( = ?auto_11261 ?auto_11264 ) ) ( not ( = ?auto_11261 ?auto_11265 ) ) ( not ( = ?auto_11262 ?auto_11263 ) ) ( not ( = ?auto_11262 ?auto_11264 ) ) ( not ( = ?auto_11262 ?auto_11265 ) ) ( not ( = ?auto_11263 ?auto_11264 ) ) ( not ( = ?auto_11263 ?auto_11265 ) ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( ON ?auto_11264 ?auto_11265 ) ( ON ?auto_11263 ?auto_11264 ) ( ON ?auto_11262 ?auto_11263 ) ( ON ?auto_11261 ?auto_11262 ) ( ON ?auto_11260 ?auto_11261 ) ( CLEAR ?auto_11260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11260 )
      ( MAKE-6PILE ?auto_11260 ?auto_11261 ?auto_11262 ?auto_11263 ?auto_11264 ?auto_11265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11272 - BLOCK
      ?auto_11273 - BLOCK
      ?auto_11274 - BLOCK
      ?auto_11275 - BLOCK
      ?auto_11276 - BLOCK
      ?auto_11277 - BLOCK
    )
    :vars
    (
      ?auto_11278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11272 ?auto_11273 ) ) ( not ( = ?auto_11272 ?auto_11274 ) ) ( not ( = ?auto_11272 ?auto_11275 ) ) ( not ( = ?auto_11272 ?auto_11276 ) ) ( not ( = ?auto_11272 ?auto_11277 ) ) ( not ( = ?auto_11273 ?auto_11274 ) ) ( not ( = ?auto_11273 ?auto_11275 ) ) ( not ( = ?auto_11273 ?auto_11276 ) ) ( not ( = ?auto_11273 ?auto_11277 ) ) ( not ( = ?auto_11274 ?auto_11275 ) ) ( not ( = ?auto_11274 ?auto_11276 ) ) ( not ( = ?auto_11274 ?auto_11277 ) ) ( not ( = ?auto_11275 ?auto_11276 ) ) ( not ( = ?auto_11275 ?auto_11277 ) ) ( not ( = ?auto_11276 ?auto_11277 ) ) ( ON ?auto_11272 ?auto_11278 ) ( not ( = ?auto_11277 ?auto_11278 ) ) ( not ( = ?auto_11276 ?auto_11278 ) ) ( not ( = ?auto_11275 ?auto_11278 ) ) ( not ( = ?auto_11274 ?auto_11278 ) ) ( not ( = ?auto_11273 ?auto_11278 ) ) ( not ( = ?auto_11272 ?auto_11278 ) ) ( ON ?auto_11273 ?auto_11272 ) ( ON ?auto_11274 ?auto_11273 ) ( ON ?auto_11275 ?auto_11274 ) ( ON ?auto_11276 ?auto_11275 ) ( ON ?auto_11277 ?auto_11276 ) ( CLEAR ?auto_11277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_11277 ?auto_11276 ?auto_11275 ?auto_11274 ?auto_11273 ?auto_11272 )
      ( MAKE-6PILE ?auto_11272 ?auto_11273 ?auto_11274 ?auto_11275 ?auto_11276 ?auto_11277 ) )
  )

)

