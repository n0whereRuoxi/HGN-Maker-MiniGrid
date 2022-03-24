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
      ?auto_23917 - BLOCK
    )
    :vars
    (
      ?auto_23918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23917 ?auto_23918 ) ( CLEAR ?auto_23917 ) ( HAND-EMPTY ) ( not ( = ?auto_23917 ?auto_23918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23917 ?auto_23918 )
      ( !PUTDOWN ?auto_23917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23920 - BLOCK
    )
    :vars
    (
      ?auto_23921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23920 ?auto_23921 ) ( CLEAR ?auto_23920 ) ( HAND-EMPTY ) ( not ( = ?auto_23920 ?auto_23921 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23920 ?auto_23921 )
      ( !PUTDOWN ?auto_23920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23924 - BLOCK
      ?auto_23925 - BLOCK
    )
    :vars
    (
      ?auto_23926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23924 ) ( ON ?auto_23925 ?auto_23926 ) ( CLEAR ?auto_23925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23924 ) ( not ( = ?auto_23924 ?auto_23925 ) ) ( not ( = ?auto_23924 ?auto_23926 ) ) ( not ( = ?auto_23925 ?auto_23926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23925 ?auto_23926 )
      ( !STACK ?auto_23925 ?auto_23924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23929 - BLOCK
      ?auto_23930 - BLOCK
    )
    :vars
    (
      ?auto_23931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23929 ) ( ON ?auto_23930 ?auto_23931 ) ( CLEAR ?auto_23930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23929 ) ( not ( = ?auto_23929 ?auto_23930 ) ) ( not ( = ?auto_23929 ?auto_23931 ) ) ( not ( = ?auto_23930 ?auto_23931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23930 ?auto_23931 )
      ( !STACK ?auto_23930 ?auto_23929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23934 - BLOCK
      ?auto_23935 - BLOCK
    )
    :vars
    (
      ?auto_23936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23935 ?auto_23936 ) ( not ( = ?auto_23934 ?auto_23935 ) ) ( not ( = ?auto_23934 ?auto_23936 ) ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( ON ?auto_23934 ?auto_23935 ) ( CLEAR ?auto_23934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23934 )
      ( MAKE-2PILE ?auto_23934 ?auto_23935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23939 - BLOCK
      ?auto_23940 - BLOCK
    )
    :vars
    (
      ?auto_23941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23940 ?auto_23941 ) ( not ( = ?auto_23939 ?auto_23940 ) ) ( not ( = ?auto_23939 ?auto_23941 ) ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( ON ?auto_23939 ?auto_23940 ) ( CLEAR ?auto_23939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23939 )
      ( MAKE-2PILE ?auto_23939 ?auto_23940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23945 - BLOCK
      ?auto_23946 - BLOCK
      ?auto_23947 - BLOCK
    )
    :vars
    (
      ?auto_23948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23946 ) ( ON ?auto_23947 ?auto_23948 ) ( CLEAR ?auto_23947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23945 ) ( ON ?auto_23946 ?auto_23945 ) ( not ( = ?auto_23945 ?auto_23946 ) ) ( not ( = ?auto_23945 ?auto_23947 ) ) ( not ( = ?auto_23945 ?auto_23948 ) ) ( not ( = ?auto_23946 ?auto_23947 ) ) ( not ( = ?auto_23946 ?auto_23948 ) ) ( not ( = ?auto_23947 ?auto_23948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23947 ?auto_23948 )
      ( !STACK ?auto_23947 ?auto_23946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23952 - BLOCK
      ?auto_23953 - BLOCK
      ?auto_23954 - BLOCK
    )
    :vars
    (
      ?auto_23955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23953 ) ( ON ?auto_23954 ?auto_23955 ) ( CLEAR ?auto_23954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23952 ) ( ON ?auto_23953 ?auto_23952 ) ( not ( = ?auto_23952 ?auto_23953 ) ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( not ( = ?auto_23952 ?auto_23955 ) ) ( not ( = ?auto_23953 ?auto_23954 ) ) ( not ( = ?auto_23953 ?auto_23955 ) ) ( not ( = ?auto_23954 ?auto_23955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23954 ?auto_23955 )
      ( !STACK ?auto_23954 ?auto_23953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23959 - BLOCK
      ?auto_23960 - BLOCK
      ?auto_23961 - BLOCK
    )
    :vars
    (
      ?auto_23962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23961 ?auto_23962 ) ( ON-TABLE ?auto_23959 ) ( not ( = ?auto_23959 ?auto_23960 ) ) ( not ( = ?auto_23959 ?auto_23961 ) ) ( not ( = ?auto_23959 ?auto_23962 ) ) ( not ( = ?auto_23960 ?auto_23961 ) ) ( not ( = ?auto_23960 ?auto_23962 ) ) ( not ( = ?auto_23961 ?auto_23962 ) ) ( CLEAR ?auto_23959 ) ( ON ?auto_23960 ?auto_23961 ) ( CLEAR ?auto_23960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23959 ?auto_23960 )
      ( MAKE-3PILE ?auto_23959 ?auto_23960 ?auto_23961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23966 - BLOCK
      ?auto_23967 - BLOCK
      ?auto_23968 - BLOCK
    )
    :vars
    (
      ?auto_23969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23968 ?auto_23969 ) ( ON-TABLE ?auto_23966 ) ( not ( = ?auto_23966 ?auto_23967 ) ) ( not ( = ?auto_23966 ?auto_23968 ) ) ( not ( = ?auto_23966 ?auto_23969 ) ) ( not ( = ?auto_23967 ?auto_23968 ) ) ( not ( = ?auto_23967 ?auto_23969 ) ) ( not ( = ?auto_23968 ?auto_23969 ) ) ( CLEAR ?auto_23966 ) ( ON ?auto_23967 ?auto_23968 ) ( CLEAR ?auto_23967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23966 ?auto_23967 )
      ( MAKE-3PILE ?auto_23966 ?auto_23967 ?auto_23968 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23973 - BLOCK
      ?auto_23974 - BLOCK
      ?auto_23975 - BLOCK
    )
    :vars
    (
      ?auto_23976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23975 ?auto_23976 ) ( not ( = ?auto_23973 ?auto_23974 ) ) ( not ( = ?auto_23973 ?auto_23975 ) ) ( not ( = ?auto_23973 ?auto_23976 ) ) ( not ( = ?auto_23974 ?auto_23975 ) ) ( not ( = ?auto_23974 ?auto_23976 ) ) ( not ( = ?auto_23975 ?auto_23976 ) ) ( ON ?auto_23974 ?auto_23975 ) ( ON ?auto_23973 ?auto_23974 ) ( CLEAR ?auto_23973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23973 )
      ( MAKE-3PILE ?auto_23973 ?auto_23974 ?auto_23975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23980 - BLOCK
      ?auto_23981 - BLOCK
      ?auto_23982 - BLOCK
    )
    :vars
    (
      ?auto_23983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23982 ?auto_23983 ) ( not ( = ?auto_23980 ?auto_23981 ) ) ( not ( = ?auto_23980 ?auto_23982 ) ) ( not ( = ?auto_23980 ?auto_23983 ) ) ( not ( = ?auto_23981 ?auto_23982 ) ) ( not ( = ?auto_23981 ?auto_23983 ) ) ( not ( = ?auto_23982 ?auto_23983 ) ) ( ON ?auto_23981 ?auto_23982 ) ( ON ?auto_23980 ?auto_23981 ) ( CLEAR ?auto_23980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23980 )
      ( MAKE-3PILE ?auto_23980 ?auto_23981 ?auto_23982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23988 - BLOCK
      ?auto_23989 - BLOCK
      ?auto_23990 - BLOCK
      ?auto_23991 - BLOCK
    )
    :vars
    (
      ?auto_23992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23990 ) ( ON ?auto_23991 ?auto_23992 ) ( CLEAR ?auto_23991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23988 ) ( ON ?auto_23989 ?auto_23988 ) ( ON ?auto_23990 ?auto_23989 ) ( not ( = ?auto_23988 ?auto_23989 ) ) ( not ( = ?auto_23988 ?auto_23990 ) ) ( not ( = ?auto_23988 ?auto_23991 ) ) ( not ( = ?auto_23988 ?auto_23992 ) ) ( not ( = ?auto_23989 ?auto_23990 ) ) ( not ( = ?auto_23989 ?auto_23991 ) ) ( not ( = ?auto_23989 ?auto_23992 ) ) ( not ( = ?auto_23990 ?auto_23991 ) ) ( not ( = ?auto_23990 ?auto_23992 ) ) ( not ( = ?auto_23991 ?auto_23992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23991 ?auto_23992 )
      ( !STACK ?auto_23991 ?auto_23990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23997 - BLOCK
      ?auto_23998 - BLOCK
      ?auto_23999 - BLOCK
      ?auto_24000 - BLOCK
    )
    :vars
    (
      ?auto_24001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23999 ) ( ON ?auto_24000 ?auto_24001 ) ( CLEAR ?auto_24000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23997 ) ( ON ?auto_23998 ?auto_23997 ) ( ON ?auto_23999 ?auto_23998 ) ( not ( = ?auto_23997 ?auto_23998 ) ) ( not ( = ?auto_23997 ?auto_23999 ) ) ( not ( = ?auto_23997 ?auto_24000 ) ) ( not ( = ?auto_23997 ?auto_24001 ) ) ( not ( = ?auto_23998 ?auto_23999 ) ) ( not ( = ?auto_23998 ?auto_24000 ) ) ( not ( = ?auto_23998 ?auto_24001 ) ) ( not ( = ?auto_23999 ?auto_24000 ) ) ( not ( = ?auto_23999 ?auto_24001 ) ) ( not ( = ?auto_24000 ?auto_24001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24000 ?auto_24001 )
      ( !STACK ?auto_24000 ?auto_23999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24006 - BLOCK
      ?auto_24007 - BLOCK
      ?auto_24008 - BLOCK
      ?auto_24009 - BLOCK
    )
    :vars
    (
      ?auto_24010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24009 ?auto_24010 ) ( ON-TABLE ?auto_24006 ) ( ON ?auto_24007 ?auto_24006 ) ( not ( = ?auto_24006 ?auto_24007 ) ) ( not ( = ?auto_24006 ?auto_24008 ) ) ( not ( = ?auto_24006 ?auto_24009 ) ) ( not ( = ?auto_24006 ?auto_24010 ) ) ( not ( = ?auto_24007 ?auto_24008 ) ) ( not ( = ?auto_24007 ?auto_24009 ) ) ( not ( = ?auto_24007 ?auto_24010 ) ) ( not ( = ?auto_24008 ?auto_24009 ) ) ( not ( = ?auto_24008 ?auto_24010 ) ) ( not ( = ?auto_24009 ?auto_24010 ) ) ( CLEAR ?auto_24007 ) ( ON ?auto_24008 ?auto_24009 ) ( CLEAR ?auto_24008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24006 ?auto_24007 ?auto_24008 )
      ( MAKE-4PILE ?auto_24006 ?auto_24007 ?auto_24008 ?auto_24009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24015 - BLOCK
      ?auto_24016 - BLOCK
      ?auto_24017 - BLOCK
      ?auto_24018 - BLOCK
    )
    :vars
    (
      ?auto_24019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24018 ?auto_24019 ) ( ON-TABLE ?auto_24015 ) ( ON ?auto_24016 ?auto_24015 ) ( not ( = ?auto_24015 ?auto_24016 ) ) ( not ( = ?auto_24015 ?auto_24017 ) ) ( not ( = ?auto_24015 ?auto_24018 ) ) ( not ( = ?auto_24015 ?auto_24019 ) ) ( not ( = ?auto_24016 ?auto_24017 ) ) ( not ( = ?auto_24016 ?auto_24018 ) ) ( not ( = ?auto_24016 ?auto_24019 ) ) ( not ( = ?auto_24017 ?auto_24018 ) ) ( not ( = ?auto_24017 ?auto_24019 ) ) ( not ( = ?auto_24018 ?auto_24019 ) ) ( CLEAR ?auto_24016 ) ( ON ?auto_24017 ?auto_24018 ) ( CLEAR ?auto_24017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24015 ?auto_24016 ?auto_24017 )
      ( MAKE-4PILE ?auto_24015 ?auto_24016 ?auto_24017 ?auto_24018 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24024 - BLOCK
      ?auto_24025 - BLOCK
      ?auto_24026 - BLOCK
      ?auto_24027 - BLOCK
    )
    :vars
    (
      ?auto_24028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24027 ?auto_24028 ) ( ON-TABLE ?auto_24024 ) ( not ( = ?auto_24024 ?auto_24025 ) ) ( not ( = ?auto_24024 ?auto_24026 ) ) ( not ( = ?auto_24024 ?auto_24027 ) ) ( not ( = ?auto_24024 ?auto_24028 ) ) ( not ( = ?auto_24025 ?auto_24026 ) ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( not ( = ?auto_24025 ?auto_24028 ) ) ( not ( = ?auto_24026 ?auto_24027 ) ) ( not ( = ?auto_24026 ?auto_24028 ) ) ( not ( = ?auto_24027 ?auto_24028 ) ) ( ON ?auto_24026 ?auto_24027 ) ( CLEAR ?auto_24024 ) ( ON ?auto_24025 ?auto_24026 ) ( CLEAR ?auto_24025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24024 ?auto_24025 )
      ( MAKE-4PILE ?auto_24024 ?auto_24025 ?auto_24026 ?auto_24027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24033 - BLOCK
      ?auto_24034 - BLOCK
      ?auto_24035 - BLOCK
      ?auto_24036 - BLOCK
    )
    :vars
    (
      ?auto_24037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24036 ?auto_24037 ) ( ON-TABLE ?auto_24033 ) ( not ( = ?auto_24033 ?auto_24034 ) ) ( not ( = ?auto_24033 ?auto_24035 ) ) ( not ( = ?auto_24033 ?auto_24036 ) ) ( not ( = ?auto_24033 ?auto_24037 ) ) ( not ( = ?auto_24034 ?auto_24035 ) ) ( not ( = ?auto_24034 ?auto_24036 ) ) ( not ( = ?auto_24034 ?auto_24037 ) ) ( not ( = ?auto_24035 ?auto_24036 ) ) ( not ( = ?auto_24035 ?auto_24037 ) ) ( not ( = ?auto_24036 ?auto_24037 ) ) ( ON ?auto_24035 ?auto_24036 ) ( CLEAR ?auto_24033 ) ( ON ?auto_24034 ?auto_24035 ) ( CLEAR ?auto_24034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24033 ?auto_24034 )
      ( MAKE-4PILE ?auto_24033 ?auto_24034 ?auto_24035 ?auto_24036 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24042 - BLOCK
      ?auto_24043 - BLOCK
      ?auto_24044 - BLOCK
      ?auto_24045 - BLOCK
    )
    :vars
    (
      ?auto_24046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24045 ?auto_24046 ) ( not ( = ?auto_24042 ?auto_24043 ) ) ( not ( = ?auto_24042 ?auto_24044 ) ) ( not ( = ?auto_24042 ?auto_24045 ) ) ( not ( = ?auto_24042 ?auto_24046 ) ) ( not ( = ?auto_24043 ?auto_24044 ) ) ( not ( = ?auto_24043 ?auto_24045 ) ) ( not ( = ?auto_24043 ?auto_24046 ) ) ( not ( = ?auto_24044 ?auto_24045 ) ) ( not ( = ?auto_24044 ?auto_24046 ) ) ( not ( = ?auto_24045 ?auto_24046 ) ) ( ON ?auto_24044 ?auto_24045 ) ( ON ?auto_24043 ?auto_24044 ) ( ON ?auto_24042 ?auto_24043 ) ( CLEAR ?auto_24042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24042 )
      ( MAKE-4PILE ?auto_24042 ?auto_24043 ?auto_24044 ?auto_24045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24051 - BLOCK
      ?auto_24052 - BLOCK
      ?auto_24053 - BLOCK
      ?auto_24054 - BLOCK
    )
    :vars
    (
      ?auto_24055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24054 ?auto_24055 ) ( not ( = ?auto_24051 ?auto_24052 ) ) ( not ( = ?auto_24051 ?auto_24053 ) ) ( not ( = ?auto_24051 ?auto_24054 ) ) ( not ( = ?auto_24051 ?auto_24055 ) ) ( not ( = ?auto_24052 ?auto_24053 ) ) ( not ( = ?auto_24052 ?auto_24054 ) ) ( not ( = ?auto_24052 ?auto_24055 ) ) ( not ( = ?auto_24053 ?auto_24054 ) ) ( not ( = ?auto_24053 ?auto_24055 ) ) ( not ( = ?auto_24054 ?auto_24055 ) ) ( ON ?auto_24053 ?auto_24054 ) ( ON ?auto_24052 ?auto_24053 ) ( ON ?auto_24051 ?auto_24052 ) ( CLEAR ?auto_24051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24051 )
      ( MAKE-4PILE ?auto_24051 ?auto_24052 ?auto_24053 ?auto_24054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24061 - BLOCK
      ?auto_24062 - BLOCK
      ?auto_24063 - BLOCK
      ?auto_24064 - BLOCK
      ?auto_24065 - BLOCK
    )
    :vars
    (
      ?auto_24066 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24064 ) ( ON ?auto_24065 ?auto_24066 ) ( CLEAR ?auto_24065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24061 ) ( ON ?auto_24062 ?auto_24061 ) ( ON ?auto_24063 ?auto_24062 ) ( ON ?auto_24064 ?auto_24063 ) ( not ( = ?auto_24061 ?auto_24062 ) ) ( not ( = ?auto_24061 ?auto_24063 ) ) ( not ( = ?auto_24061 ?auto_24064 ) ) ( not ( = ?auto_24061 ?auto_24065 ) ) ( not ( = ?auto_24061 ?auto_24066 ) ) ( not ( = ?auto_24062 ?auto_24063 ) ) ( not ( = ?auto_24062 ?auto_24064 ) ) ( not ( = ?auto_24062 ?auto_24065 ) ) ( not ( = ?auto_24062 ?auto_24066 ) ) ( not ( = ?auto_24063 ?auto_24064 ) ) ( not ( = ?auto_24063 ?auto_24065 ) ) ( not ( = ?auto_24063 ?auto_24066 ) ) ( not ( = ?auto_24064 ?auto_24065 ) ) ( not ( = ?auto_24064 ?auto_24066 ) ) ( not ( = ?auto_24065 ?auto_24066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24065 ?auto_24066 )
      ( !STACK ?auto_24065 ?auto_24064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24072 - BLOCK
      ?auto_24073 - BLOCK
      ?auto_24074 - BLOCK
      ?auto_24075 - BLOCK
      ?auto_24076 - BLOCK
    )
    :vars
    (
      ?auto_24077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24075 ) ( ON ?auto_24076 ?auto_24077 ) ( CLEAR ?auto_24076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24072 ) ( ON ?auto_24073 ?auto_24072 ) ( ON ?auto_24074 ?auto_24073 ) ( ON ?auto_24075 ?auto_24074 ) ( not ( = ?auto_24072 ?auto_24073 ) ) ( not ( = ?auto_24072 ?auto_24074 ) ) ( not ( = ?auto_24072 ?auto_24075 ) ) ( not ( = ?auto_24072 ?auto_24076 ) ) ( not ( = ?auto_24072 ?auto_24077 ) ) ( not ( = ?auto_24073 ?auto_24074 ) ) ( not ( = ?auto_24073 ?auto_24075 ) ) ( not ( = ?auto_24073 ?auto_24076 ) ) ( not ( = ?auto_24073 ?auto_24077 ) ) ( not ( = ?auto_24074 ?auto_24075 ) ) ( not ( = ?auto_24074 ?auto_24076 ) ) ( not ( = ?auto_24074 ?auto_24077 ) ) ( not ( = ?auto_24075 ?auto_24076 ) ) ( not ( = ?auto_24075 ?auto_24077 ) ) ( not ( = ?auto_24076 ?auto_24077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24076 ?auto_24077 )
      ( !STACK ?auto_24076 ?auto_24075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24083 - BLOCK
      ?auto_24084 - BLOCK
      ?auto_24085 - BLOCK
      ?auto_24086 - BLOCK
      ?auto_24087 - BLOCK
    )
    :vars
    (
      ?auto_24088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24087 ?auto_24088 ) ( ON-TABLE ?auto_24083 ) ( ON ?auto_24084 ?auto_24083 ) ( ON ?auto_24085 ?auto_24084 ) ( not ( = ?auto_24083 ?auto_24084 ) ) ( not ( = ?auto_24083 ?auto_24085 ) ) ( not ( = ?auto_24083 ?auto_24086 ) ) ( not ( = ?auto_24083 ?auto_24087 ) ) ( not ( = ?auto_24083 ?auto_24088 ) ) ( not ( = ?auto_24084 ?auto_24085 ) ) ( not ( = ?auto_24084 ?auto_24086 ) ) ( not ( = ?auto_24084 ?auto_24087 ) ) ( not ( = ?auto_24084 ?auto_24088 ) ) ( not ( = ?auto_24085 ?auto_24086 ) ) ( not ( = ?auto_24085 ?auto_24087 ) ) ( not ( = ?auto_24085 ?auto_24088 ) ) ( not ( = ?auto_24086 ?auto_24087 ) ) ( not ( = ?auto_24086 ?auto_24088 ) ) ( not ( = ?auto_24087 ?auto_24088 ) ) ( CLEAR ?auto_24085 ) ( ON ?auto_24086 ?auto_24087 ) ( CLEAR ?auto_24086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24083 ?auto_24084 ?auto_24085 ?auto_24086 )
      ( MAKE-5PILE ?auto_24083 ?auto_24084 ?auto_24085 ?auto_24086 ?auto_24087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24094 - BLOCK
      ?auto_24095 - BLOCK
      ?auto_24096 - BLOCK
      ?auto_24097 - BLOCK
      ?auto_24098 - BLOCK
    )
    :vars
    (
      ?auto_24099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24098 ?auto_24099 ) ( ON-TABLE ?auto_24094 ) ( ON ?auto_24095 ?auto_24094 ) ( ON ?auto_24096 ?auto_24095 ) ( not ( = ?auto_24094 ?auto_24095 ) ) ( not ( = ?auto_24094 ?auto_24096 ) ) ( not ( = ?auto_24094 ?auto_24097 ) ) ( not ( = ?auto_24094 ?auto_24098 ) ) ( not ( = ?auto_24094 ?auto_24099 ) ) ( not ( = ?auto_24095 ?auto_24096 ) ) ( not ( = ?auto_24095 ?auto_24097 ) ) ( not ( = ?auto_24095 ?auto_24098 ) ) ( not ( = ?auto_24095 ?auto_24099 ) ) ( not ( = ?auto_24096 ?auto_24097 ) ) ( not ( = ?auto_24096 ?auto_24098 ) ) ( not ( = ?auto_24096 ?auto_24099 ) ) ( not ( = ?auto_24097 ?auto_24098 ) ) ( not ( = ?auto_24097 ?auto_24099 ) ) ( not ( = ?auto_24098 ?auto_24099 ) ) ( CLEAR ?auto_24096 ) ( ON ?auto_24097 ?auto_24098 ) ( CLEAR ?auto_24097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 )
      ( MAKE-5PILE ?auto_24094 ?auto_24095 ?auto_24096 ?auto_24097 ?auto_24098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24105 - BLOCK
      ?auto_24106 - BLOCK
      ?auto_24107 - BLOCK
      ?auto_24108 - BLOCK
      ?auto_24109 - BLOCK
    )
    :vars
    (
      ?auto_24110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24109 ?auto_24110 ) ( ON-TABLE ?auto_24105 ) ( ON ?auto_24106 ?auto_24105 ) ( not ( = ?auto_24105 ?auto_24106 ) ) ( not ( = ?auto_24105 ?auto_24107 ) ) ( not ( = ?auto_24105 ?auto_24108 ) ) ( not ( = ?auto_24105 ?auto_24109 ) ) ( not ( = ?auto_24105 ?auto_24110 ) ) ( not ( = ?auto_24106 ?auto_24107 ) ) ( not ( = ?auto_24106 ?auto_24108 ) ) ( not ( = ?auto_24106 ?auto_24109 ) ) ( not ( = ?auto_24106 ?auto_24110 ) ) ( not ( = ?auto_24107 ?auto_24108 ) ) ( not ( = ?auto_24107 ?auto_24109 ) ) ( not ( = ?auto_24107 ?auto_24110 ) ) ( not ( = ?auto_24108 ?auto_24109 ) ) ( not ( = ?auto_24108 ?auto_24110 ) ) ( not ( = ?auto_24109 ?auto_24110 ) ) ( ON ?auto_24108 ?auto_24109 ) ( CLEAR ?auto_24106 ) ( ON ?auto_24107 ?auto_24108 ) ( CLEAR ?auto_24107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24105 ?auto_24106 ?auto_24107 )
      ( MAKE-5PILE ?auto_24105 ?auto_24106 ?auto_24107 ?auto_24108 ?auto_24109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24116 - BLOCK
      ?auto_24117 - BLOCK
      ?auto_24118 - BLOCK
      ?auto_24119 - BLOCK
      ?auto_24120 - BLOCK
    )
    :vars
    (
      ?auto_24121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24120 ?auto_24121 ) ( ON-TABLE ?auto_24116 ) ( ON ?auto_24117 ?auto_24116 ) ( not ( = ?auto_24116 ?auto_24117 ) ) ( not ( = ?auto_24116 ?auto_24118 ) ) ( not ( = ?auto_24116 ?auto_24119 ) ) ( not ( = ?auto_24116 ?auto_24120 ) ) ( not ( = ?auto_24116 ?auto_24121 ) ) ( not ( = ?auto_24117 ?auto_24118 ) ) ( not ( = ?auto_24117 ?auto_24119 ) ) ( not ( = ?auto_24117 ?auto_24120 ) ) ( not ( = ?auto_24117 ?auto_24121 ) ) ( not ( = ?auto_24118 ?auto_24119 ) ) ( not ( = ?auto_24118 ?auto_24120 ) ) ( not ( = ?auto_24118 ?auto_24121 ) ) ( not ( = ?auto_24119 ?auto_24120 ) ) ( not ( = ?auto_24119 ?auto_24121 ) ) ( not ( = ?auto_24120 ?auto_24121 ) ) ( ON ?auto_24119 ?auto_24120 ) ( CLEAR ?auto_24117 ) ( ON ?auto_24118 ?auto_24119 ) ( CLEAR ?auto_24118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24116 ?auto_24117 ?auto_24118 )
      ( MAKE-5PILE ?auto_24116 ?auto_24117 ?auto_24118 ?auto_24119 ?auto_24120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24127 - BLOCK
      ?auto_24128 - BLOCK
      ?auto_24129 - BLOCK
      ?auto_24130 - BLOCK
      ?auto_24131 - BLOCK
    )
    :vars
    (
      ?auto_24132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24131 ?auto_24132 ) ( ON-TABLE ?auto_24127 ) ( not ( = ?auto_24127 ?auto_24128 ) ) ( not ( = ?auto_24127 ?auto_24129 ) ) ( not ( = ?auto_24127 ?auto_24130 ) ) ( not ( = ?auto_24127 ?auto_24131 ) ) ( not ( = ?auto_24127 ?auto_24132 ) ) ( not ( = ?auto_24128 ?auto_24129 ) ) ( not ( = ?auto_24128 ?auto_24130 ) ) ( not ( = ?auto_24128 ?auto_24131 ) ) ( not ( = ?auto_24128 ?auto_24132 ) ) ( not ( = ?auto_24129 ?auto_24130 ) ) ( not ( = ?auto_24129 ?auto_24131 ) ) ( not ( = ?auto_24129 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24131 ?auto_24132 ) ) ( ON ?auto_24130 ?auto_24131 ) ( ON ?auto_24129 ?auto_24130 ) ( CLEAR ?auto_24127 ) ( ON ?auto_24128 ?auto_24129 ) ( CLEAR ?auto_24128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24127 ?auto_24128 )
      ( MAKE-5PILE ?auto_24127 ?auto_24128 ?auto_24129 ?auto_24130 ?auto_24131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24138 - BLOCK
      ?auto_24139 - BLOCK
      ?auto_24140 - BLOCK
      ?auto_24141 - BLOCK
      ?auto_24142 - BLOCK
    )
    :vars
    (
      ?auto_24143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24142 ?auto_24143 ) ( ON-TABLE ?auto_24138 ) ( not ( = ?auto_24138 ?auto_24139 ) ) ( not ( = ?auto_24138 ?auto_24140 ) ) ( not ( = ?auto_24138 ?auto_24141 ) ) ( not ( = ?auto_24138 ?auto_24142 ) ) ( not ( = ?auto_24138 ?auto_24143 ) ) ( not ( = ?auto_24139 ?auto_24140 ) ) ( not ( = ?auto_24139 ?auto_24141 ) ) ( not ( = ?auto_24139 ?auto_24142 ) ) ( not ( = ?auto_24139 ?auto_24143 ) ) ( not ( = ?auto_24140 ?auto_24141 ) ) ( not ( = ?auto_24140 ?auto_24142 ) ) ( not ( = ?auto_24140 ?auto_24143 ) ) ( not ( = ?auto_24141 ?auto_24142 ) ) ( not ( = ?auto_24141 ?auto_24143 ) ) ( not ( = ?auto_24142 ?auto_24143 ) ) ( ON ?auto_24141 ?auto_24142 ) ( ON ?auto_24140 ?auto_24141 ) ( CLEAR ?auto_24138 ) ( ON ?auto_24139 ?auto_24140 ) ( CLEAR ?auto_24139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24138 ?auto_24139 )
      ( MAKE-5PILE ?auto_24138 ?auto_24139 ?auto_24140 ?auto_24141 ?auto_24142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24149 - BLOCK
      ?auto_24150 - BLOCK
      ?auto_24151 - BLOCK
      ?auto_24152 - BLOCK
      ?auto_24153 - BLOCK
    )
    :vars
    (
      ?auto_24154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24153 ?auto_24154 ) ( not ( = ?auto_24149 ?auto_24150 ) ) ( not ( = ?auto_24149 ?auto_24151 ) ) ( not ( = ?auto_24149 ?auto_24152 ) ) ( not ( = ?auto_24149 ?auto_24153 ) ) ( not ( = ?auto_24149 ?auto_24154 ) ) ( not ( = ?auto_24150 ?auto_24151 ) ) ( not ( = ?auto_24150 ?auto_24152 ) ) ( not ( = ?auto_24150 ?auto_24153 ) ) ( not ( = ?auto_24150 ?auto_24154 ) ) ( not ( = ?auto_24151 ?auto_24152 ) ) ( not ( = ?auto_24151 ?auto_24153 ) ) ( not ( = ?auto_24151 ?auto_24154 ) ) ( not ( = ?auto_24152 ?auto_24153 ) ) ( not ( = ?auto_24152 ?auto_24154 ) ) ( not ( = ?auto_24153 ?auto_24154 ) ) ( ON ?auto_24152 ?auto_24153 ) ( ON ?auto_24151 ?auto_24152 ) ( ON ?auto_24150 ?auto_24151 ) ( ON ?auto_24149 ?auto_24150 ) ( CLEAR ?auto_24149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24149 )
      ( MAKE-5PILE ?auto_24149 ?auto_24150 ?auto_24151 ?auto_24152 ?auto_24153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24160 - BLOCK
      ?auto_24161 - BLOCK
      ?auto_24162 - BLOCK
      ?auto_24163 - BLOCK
      ?auto_24164 - BLOCK
    )
    :vars
    (
      ?auto_24165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24164 ?auto_24165 ) ( not ( = ?auto_24160 ?auto_24161 ) ) ( not ( = ?auto_24160 ?auto_24162 ) ) ( not ( = ?auto_24160 ?auto_24163 ) ) ( not ( = ?auto_24160 ?auto_24164 ) ) ( not ( = ?auto_24160 ?auto_24165 ) ) ( not ( = ?auto_24161 ?auto_24162 ) ) ( not ( = ?auto_24161 ?auto_24163 ) ) ( not ( = ?auto_24161 ?auto_24164 ) ) ( not ( = ?auto_24161 ?auto_24165 ) ) ( not ( = ?auto_24162 ?auto_24163 ) ) ( not ( = ?auto_24162 ?auto_24164 ) ) ( not ( = ?auto_24162 ?auto_24165 ) ) ( not ( = ?auto_24163 ?auto_24164 ) ) ( not ( = ?auto_24163 ?auto_24165 ) ) ( not ( = ?auto_24164 ?auto_24165 ) ) ( ON ?auto_24163 ?auto_24164 ) ( ON ?auto_24162 ?auto_24163 ) ( ON ?auto_24161 ?auto_24162 ) ( ON ?auto_24160 ?auto_24161 ) ( CLEAR ?auto_24160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24160 )
      ( MAKE-5PILE ?auto_24160 ?auto_24161 ?auto_24162 ?auto_24163 ?auto_24164 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24172 - BLOCK
      ?auto_24173 - BLOCK
      ?auto_24174 - BLOCK
      ?auto_24175 - BLOCK
      ?auto_24176 - BLOCK
      ?auto_24177 - BLOCK
    )
    :vars
    (
      ?auto_24178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24176 ) ( ON ?auto_24177 ?auto_24178 ) ( CLEAR ?auto_24177 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24172 ) ( ON ?auto_24173 ?auto_24172 ) ( ON ?auto_24174 ?auto_24173 ) ( ON ?auto_24175 ?auto_24174 ) ( ON ?auto_24176 ?auto_24175 ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( not ( = ?auto_24172 ?auto_24174 ) ) ( not ( = ?auto_24172 ?auto_24175 ) ) ( not ( = ?auto_24172 ?auto_24176 ) ) ( not ( = ?auto_24172 ?auto_24177 ) ) ( not ( = ?auto_24172 ?auto_24178 ) ) ( not ( = ?auto_24173 ?auto_24174 ) ) ( not ( = ?auto_24173 ?auto_24175 ) ) ( not ( = ?auto_24173 ?auto_24176 ) ) ( not ( = ?auto_24173 ?auto_24177 ) ) ( not ( = ?auto_24173 ?auto_24178 ) ) ( not ( = ?auto_24174 ?auto_24175 ) ) ( not ( = ?auto_24174 ?auto_24176 ) ) ( not ( = ?auto_24174 ?auto_24177 ) ) ( not ( = ?auto_24174 ?auto_24178 ) ) ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24175 ?auto_24177 ) ) ( not ( = ?auto_24175 ?auto_24178 ) ) ( not ( = ?auto_24176 ?auto_24177 ) ) ( not ( = ?auto_24176 ?auto_24178 ) ) ( not ( = ?auto_24177 ?auto_24178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24177 ?auto_24178 )
      ( !STACK ?auto_24177 ?auto_24176 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24185 - BLOCK
      ?auto_24186 - BLOCK
      ?auto_24187 - BLOCK
      ?auto_24188 - BLOCK
      ?auto_24189 - BLOCK
      ?auto_24190 - BLOCK
    )
    :vars
    (
      ?auto_24191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24189 ) ( ON ?auto_24190 ?auto_24191 ) ( CLEAR ?auto_24190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24185 ) ( ON ?auto_24186 ?auto_24185 ) ( ON ?auto_24187 ?auto_24186 ) ( ON ?auto_24188 ?auto_24187 ) ( ON ?auto_24189 ?auto_24188 ) ( not ( = ?auto_24185 ?auto_24186 ) ) ( not ( = ?auto_24185 ?auto_24187 ) ) ( not ( = ?auto_24185 ?auto_24188 ) ) ( not ( = ?auto_24185 ?auto_24189 ) ) ( not ( = ?auto_24185 ?auto_24190 ) ) ( not ( = ?auto_24185 ?auto_24191 ) ) ( not ( = ?auto_24186 ?auto_24187 ) ) ( not ( = ?auto_24186 ?auto_24188 ) ) ( not ( = ?auto_24186 ?auto_24189 ) ) ( not ( = ?auto_24186 ?auto_24190 ) ) ( not ( = ?auto_24186 ?auto_24191 ) ) ( not ( = ?auto_24187 ?auto_24188 ) ) ( not ( = ?auto_24187 ?auto_24189 ) ) ( not ( = ?auto_24187 ?auto_24190 ) ) ( not ( = ?auto_24187 ?auto_24191 ) ) ( not ( = ?auto_24188 ?auto_24189 ) ) ( not ( = ?auto_24188 ?auto_24190 ) ) ( not ( = ?auto_24188 ?auto_24191 ) ) ( not ( = ?auto_24189 ?auto_24190 ) ) ( not ( = ?auto_24189 ?auto_24191 ) ) ( not ( = ?auto_24190 ?auto_24191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24190 ?auto_24191 )
      ( !STACK ?auto_24190 ?auto_24189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24198 - BLOCK
      ?auto_24199 - BLOCK
      ?auto_24200 - BLOCK
      ?auto_24201 - BLOCK
      ?auto_24202 - BLOCK
      ?auto_24203 - BLOCK
    )
    :vars
    (
      ?auto_24204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24203 ?auto_24204 ) ( ON-TABLE ?auto_24198 ) ( ON ?auto_24199 ?auto_24198 ) ( ON ?auto_24200 ?auto_24199 ) ( ON ?auto_24201 ?auto_24200 ) ( not ( = ?auto_24198 ?auto_24199 ) ) ( not ( = ?auto_24198 ?auto_24200 ) ) ( not ( = ?auto_24198 ?auto_24201 ) ) ( not ( = ?auto_24198 ?auto_24202 ) ) ( not ( = ?auto_24198 ?auto_24203 ) ) ( not ( = ?auto_24198 ?auto_24204 ) ) ( not ( = ?auto_24199 ?auto_24200 ) ) ( not ( = ?auto_24199 ?auto_24201 ) ) ( not ( = ?auto_24199 ?auto_24202 ) ) ( not ( = ?auto_24199 ?auto_24203 ) ) ( not ( = ?auto_24199 ?auto_24204 ) ) ( not ( = ?auto_24200 ?auto_24201 ) ) ( not ( = ?auto_24200 ?auto_24202 ) ) ( not ( = ?auto_24200 ?auto_24203 ) ) ( not ( = ?auto_24200 ?auto_24204 ) ) ( not ( = ?auto_24201 ?auto_24202 ) ) ( not ( = ?auto_24201 ?auto_24203 ) ) ( not ( = ?auto_24201 ?auto_24204 ) ) ( not ( = ?auto_24202 ?auto_24203 ) ) ( not ( = ?auto_24202 ?auto_24204 ) ) ( not ( = ?auto_24203 ?auto_24204 ) ) ( CLEAR ?auto_24201 ) ( ON ?auto_24202 ?auto_24203 ) ( CLEAR ?auto_24202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24198 ?auto_24199 ?auto_24200 ?auto_24201 ?auto_24202 )
      ( MAKE-6PILE ?auto_24198 ?auto_24199 ?auto_24200 ?auto_24201 ?auto_24202 ?auto_24203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24211 - BLOCK
      ?auto_24212 - BLOCK
      ?auto_24213 - BLOCK
      ?auto_24214 - BLOCK
      ?auto_24215 - BLOCK
      ?auto_24216 - BLOCK
    )
    :vars
    (
      ?auto_24217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24216 ?auto_24217 ) ( ON-TABLE ?auto_24211 ) ( ON ?auto_24212 ?auto_24211 ) ( ON ?auto_24213 ?auto_24212 ) ( ON ?auto_24214 ?auto_24213 ) ( not ( = ?auto_24211 ?auto_24212 ) ) ( not ( = ?auto_24211 ?auto_24213 ) ) ( not ( = ?auto_24211 ?auto_24214 ) ) ( not ( = ?auto_24211 ?auto_24215 ) ) ( not ( = ?auto_24211 ?auto_24216 ) ) ( not ( = ?auto_24211 ?auto_24217 ) ) ( not ( = ?auto_24212 ?auto_24213 ) ) ( not ( = ?auto_24212 ?auto_24214 ) ) ( not ( = ?auto_24212 ?auto_24215 ) ) ( not ( = ?auto_24212 ?auto_24216 ) ) ( not ( = ?auto_24212 ?auto_24217 ) ) ( not ( = ?auto_24213 ?auto_24214 ) ) ( not ( = ?auto_24213 ?auto_24215 ) ) ( not ( = ?auto_24213 ?auto_24216 ) ) ( not ( = ?auto_24213 ?auto_24217 ) ) ( not ( = ?auto_24214 ?auto_24215 ) ) ( not ( = ?auto_24214 ?auto_24216 ) ) ( not ( = ?auto_24214 ?auto_24217 ) ) ( not ( = ?auto_24215 ?auto_24216 ) ) ( not ( = ?auto_24215 ?auto_24217 ) ) ( not ( = ?auto_24216 ?auto_24217 ) ) ( CLEAR ?auto_24214 ) ( ON ?auto_24215 ?auto_24216 ) ( CLEAR ?auto_24215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24211 ?auto_24212 ?auto_24213 ?auto_24214 ?auto_24215 )
      ( MAKE-6PILE ?auto_24211 ?auto_24212 ?auto_24213 ?auto_24214 ?auto_24215 ?auto_24216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24224 - BLOCK
      ?auto_24225 - BLOCK
      ?auto_24226 - BLOCK
      ?auto_24227 - BLOCK
      ?auto_24228 - BLOCK
      ?auto_24229 - BLOCK
    )
    :vars
    (
      ?auto_24230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24229 ?auto_24230 ) ( ON-TABLE ?auto_24224 ) ( ON ?auto_24225 ?auto_24224 ) ( ON ?auto_24226 ?auto_24225 ) ( not ( = ?auto_24224 ?auto_24225 ) ) ( not ( = ?auto_24224 ?auto_24226 ) ) ( not ( = ?auto_24224 ?auto_24227 ) ) ( not ( = ?auto_24224 ?auto_24228 ) ) ( not ( = ?auto_24224 ?auto_24229 ) ) ( not ( = ?auto_24224 ?auto_24230 ) ) ( not ( = ?auto_24225 ?auto_24226 ) ) ( not ( = ?auto_24225 ?auto_24227 ) ) ( not ( = ?auto_24225 ?auto_24228 ) ) ( not ( = ?auto_24225 ?auto_24229 ) ) ( not ( = ?auto_24225 ?auto_24230 ) ) ( not ( = ?auto_24226 ?auto_24227 ) ) ( not ( = ?auto_24226 ?auto_24228 ) ) ( not ( = ?auto_24226 ?auto_24229 ) ) ( not ( = ?auto_24226 ?auto_24230 ) ) ( not ( = ?auto_24227 ?auto_24228 ) ) ( not ( = ?auto_24227 ?auto_24229 ) ) ( not ( = ?auto_24227 ?auto_24230 ) ) ( not ( = ?auto_24228 ?auto_24229 ) ) ( not ( = ?auto_24228 ?auto_24230 ) ) ( not ( = ?auto_24229 ?auto_24230 ) ) ( ON ?auto_24228 ?auto_24229 ) ( CLEAR ?auto_24226 ) ( ON ?auto_24227 ?auto_24228 ) ( CLEAR ?auto_24227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24224 ?auto_24225 ?auto_24226 ?auto_24227 )
      ( MAKE-6PILE ?auto_24224 ?auto_24225 ?auto_24226 ?auto_24227 ?auto_24228 ?auto_24229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24237 - BLOCK
      ?auto_24238 - BLOCK
      ?auto_24239 - BLOCK
      ?auto_24240 - BLOCK
      ?auto_24241 - BLOCK
      ?auto_24242 - BLOCK
    )
    :vars
    (
      ?auto_24243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24242 ?auto_24243 ) ( ON-TABLE ?auto_24237 ) ( ON ?auto_24238 ?auto_24237 ) ( ON ?auto_24239 ?auto_24238 ) ( not ( = ?auto_24237 ?auto_24238 ) ) ( not ( = ?auto_24237 ?auto_24239 ) ) ( not ( = ?auto_24237 ?auto_24240 ) ) ( not ( = ?auto_24237 ?auto_24241 ) ) ( not ( = ?auto_24237 ?auto_24242 ) ) ( not ( = ?auto_24237 ?auto_24243 ) ) ( not ( = ?auto_24238 ?auto_24239 ) ) ( not ( = ?auto_24238 ?auto_24240 ) ) ( not ( = ?auto_24238 ?auto_24241 ) ) ( not ( = ?auto_24238 ?auto_24242 ) ) ( not ( = ?auto_24238 ?auto_24243 ) ) ( not ( = ?auto_24239 ?auto_24240 ) ) ( not ( = ?auto_24239 ?auto_24241 ) ) ( not ( = ?auto_24239 ?auto_24242 ) ) ( not ( = ?auto_24239 ?auto_24243 ) ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( not ( = ?auto_24240 ?auto_24242 ) ) ( not ( = ?auto_24240 ?auto_24243 ) ) ( not ( = ?auto_24241 ?auto_24242 ) ) ( not ( = ?auto_24241 ?auto_24243 ) ) ( not ( = ?auto_24242 ?auto_24243 ) ) ( ON ?auto_24241 ?auto_24242 ) ( CLEAR ?auto_24239 ) ( ON ?auto_24240 ?auto_24241 ) ( CLEAR ?auto_24240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24237 ?auto_24238 ?auto_24239 ?auto_24240 )
      ( MAKE-6PILE ?auto_24237 ?auto_24238 ?auto_24239 ?auto_24240 ?auto_24241 ?auto_24242 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24250 - BLOCK
      ?auto_24251 - BLOCK
      ?auto_24252 - BLOCK
      ?auto_24253 - BLOCK
      ?auto_24254 - BLOCK
      ?auto_24255 - BLOCK
    )
    :vars
    (
      ?auto_24256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24255 ?auto_24256 ) ( ON-TABLE ?auto_24250 ) ( ON ?auto_24251 ?auto_24250 ) ( not ( = ?auto_24250 ?auto_24251 ) ) ( not ( = ?auto_24250 ?auto_24252 ) ) ( not ( = ?auto_24250 ?auto_24253 ) ) ( not ( = ?auto_24250 ?auto_24254 ) ) ( not ( = ?auto_24250 ?auto_24255 ) ) ( not ( = ?auto_24250 ?auto_24256 ) ) ( not ( = ?auto_24251 ?auto_24252 ) ) ( not ( = ?auto_24251 ?auto_24253 ) ) ( not ( = ?auto_24251 ?auto_24254 ) ) ( not ( = ?auto_24251 ?auto_24255 ) ) ( not ( = ?auto_24251 ?auto_24256 ) ) ( not ( = ?auto_24252 ?auto_24253 ) ) ( not ( = ?auto_24252 ?auto_24254 ) ) ( not ( = ?auto_24252 ?auto_24255 ) ) ( not ( = ?auto_24252 ?auto_24256 ) ) ( not ( = ?auto_24253 ?auto_24254 ) ) ( not ( = ?auto_24253 ?auto_24255 ) ) ( not ( = ?auto_24253 ?auto_24256 ) ) ( not ( = ?auto_24254 ?auto_24255 ) ) ( not ( = ?auto_24254 ?auto_24256 ) ) ( not ( = ?auto_24255 ?auto_24256 ) ) ( ON ?auto_24254 ?auto_24255 ) ( ON ?auto_24253 ?auto_24254 ) ( CLEAR ?auto_24251 ) ( ON ?auto_24252 ?auto_24253 ) ( CLEAR ?auto_24252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24250 ?auto_24251 ?auto_24252 )
      ( MAKE-6PILE ?auto_24250 ?auto_24251 ?auto_24252 ?auto_24253 ?auto_24254 ?auto_24255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24263 - BLOCK
      ?auto_24264 - BLOCK
      ?auto_24265 - BLOCK
      ?auto_24266 - BLOCK
      ?auto_24267 - BLOCK
      ?auto_24268 - BLOCK
    )
    :vars
    (
      ?auto_24269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24268 ?auto_24269 ) ( ON-TABLE ?auto_24263 ) ( ON ?auto_24264 ?auto_24263 ) ( not ( = ?auto_24263 ?auto_24264 ) ) ( not ( = ?auto_24263 ?auto_24265 ) ) ( not ( = ?auto_24263 ?auto_24266 ) ) ( not ( = ?auto_24263 ?auto_24267 ) ) ( not ( = ?auto_24263 ?auto_24268 ) ) ( not ( = ?auto_24263 ?auto_24269 ) ) ( not ( = ?auto_24264 ?auto_24265 ) ) ( not ( = ?auto_24264 ?auto_24266 ) ) ( not ( = ?auto_24264 ?auto_24267 ) ) ( not ( = ?auto_24264 ?auto_24268 ) ) ( not ( = ?auto_24264 ?auto_24269 ) ) ( not ( = ?auto_24265 ?auto_24266 ) ) ( not ( = ?auto_24265 ?auto_24267 ) ) ( not ( = ?auto_24265 ?auto_24268 ) ) ( not ( = ?auto_24265 ?auto_24269 ) ) ( not ( = ?auto_24266 ?auto_24267 ) ) ( not ( = ?auto_24266 ?auto_24268 ) ) ( not ( = ?auto_24266 ?auto_24269 ) ) ( not ( = ?auto_24267 ?auto_24268 ) ) ( not ( = ?auto_24267 ?auto_24269 ) ) ( not ( = ?auto_24268 ?auto_24269 ) ) ( ON ?auto_24267 ?auto_24268 ) ( ON ?auto_24266 ?auto_24267 ) ( CLEAR ?auto_24264 ) ( ON ?auto_24265 ?auto_24266 ) ( CLEAR ?auto_24265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24263 ?auto_24264 ?auto_24265 )
      ( MAKE-6PILE ?auto_24263 ?auto_24264 ?auto_24265 ?auto_24266 ?auto_24267 ?auto_24268 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24276 - BLOCK
      ?auto_24277 - BLOCK
      ?auto_24278 - BLOCK
      ?auto_24279 - BLOCK
      ?auto_24280 - BLOCK
      ?auto_24281 - BLOCK
    )
    :vars
    (
      ?auto_24282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24281 ?auto_24282 ) ( ON-TABLE ?auto_24276 ) ( not ( = ?auto_24276 ?auto_24277 ) ) ( not ( = ?auto_24276 ?auto_24278 ) ) ( not ( = ?auto_24276 ?auto_24279 ) ) ( not ( = ?auto_24276 ?auto_24280 ) ) ( not ( = ?auto_24276 ?auto_24281 ) ) ( not ( = ?auto_24276 ?auto_24282 ) ) ( not ( = ?auto_24277 ?auto_24278 ) ) ( not ( = ?auto_24277 ?auto_24279 ) ) ( not ( = ?auto_24277 ?auto_24280 ) ) ( not ( = ?auto_24277 ?auto_24281 ) ) ( not ( = ?auto_24277 ?auto_24282 ) ) ( not ( = ?auto_24278 ?auto_24279 ) ) ( not ( = ?auto_24278 ?auto_24280 ) ) ( not ( = ?auto_24278 ?auto_24281 ) ) ( not ( = ?auto_24278 ?auto_24282 ) ) ( not ( = ?auto_24279 ?auto_24280 ) ) ( not ( = ?auto_24279 ?auto_24281 ) ) ( not ( = ?auto_24279 ?auto_24282 ) ) ( not ( = ?auto_24280 ?auto_24281 ) ) ( not ( = ?auto_24280 ?auto_24282 ) ) ( not ( = ?auto_24281 ?auto_24282 ) ) ( ON ?auto_24280 ?auto_24281 ) ( ON ?auto_24279 ?auto_24280 ) ( ON ?auto_24278 ?auto_24279 ) ( CLEAR ?auto_24276 ) ( ON ?auto_24277 ?auto_24278 ) ( CLEAR ?auto_24277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24276 ?auto_24277 )
      ( MAKE-6PILE ?auto_24276 ?auto_24277 ?auto_24278 ?auto_24279 ?auto_24280 ?auto_24281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24289 - BLOCK
      ?auto_24290 - BLOCK
      ?auto_24291 - BLOCK
      ?auto_24292 - BLOCK
      ?auto_24293 - BLOCK
      ?auto_24294 - BLOCK
    )
    :vars
    (
      ?auto_24295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24294 ?auto_24295 ) ( ON-TABLE ?auto_24289 ) ( not ( = ?auto_24289 ?auto_24290 ) ) ( not ( = ?auto_24289 ?auto_24291 ) ) ( not ( = ?auto_24289 ?auto_24292 ) ) ( not ( = ?auto_24289 ?auto_24293 ) ) ( not ( = ?auto_24289 ?auto_24294 ) ) ( not ( = ?auto_24289 ?auto_24295 ) ) ( not ( = ?auto_24290 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( not ( = ?auto_24290 ?auto_24293 ) ) ( not ( = ?auto_24290 ?auto_24294 ) ) ( not ( = ?auto_24290 ?auto_24295 ) ) ( not ( = ?auto_24291 ?auto_24292 ) ) ( not ( = ?auto_24291 ?auto_24293 ) ) ( not ( = ?auto_24291 ?auto_24294 ) ) ( not ( = ?auto_24291 ?auto_24295 ) ) ( not ( = ?auto_24292 ?auto_24293 ) ) ( not ( = ?auto_24292 ?auto_24294 ) ) ( not ( = ?auto_24292 ?auto_24295 ) ) ( not ( = ?auto_24293 ?auto_24294 ) ) ( not ( = ?auto_24293 ?auto_24295 ) ) ( not ( = ?auto_24294 ?auto_24295 ) ) ( ON ?auto_24293 ?auto_24294 ) ( ON ?auto_24292 ?auto_24293 ) ( ON ?auto_24291 ?auto_24292 ) ( CLEAR ?auto_24289 ) ( ON ?auto_24290 ?auto_24291 ) ( CLEAR ?auto_24290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24289 ?auto_24290 )
      ( MAKE-6PILE ?auto_24289 ?auto_24290 ?auto_24291 ?auto_24292 ?auto_24293 ?auto_24294 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24302 - BLOCK
      ?auto_24303 - BLOCK
      ?auto_24304 - BLOCK
      ?auto_24305 - BLOCK
      ?auto_24306 - BLOCK
      ?auto_24307 - BLOCK
    )
    :vars
    (
      ?auto_24308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24307 ?auto_24308 ) ( not ( = ?auto_24302 ?auto_24303 ) ) ( not ( = ?auto_24302 ?auto_24304 ) ) ( not ( = ?auto_24302 ?auto_24305 ) ) ( not ( = ?auto_24302 ?auto_24306 ) ) ( not ( = ?auto_24302 ?auto_24307 ) ) ( not ( = ?auto_24302 ?auto_24308 ) ) ( not ( = ?auto_24303 ?auto_24304 ) ) ( not ( = ?auto_24303 ?auto_24305 ) ) ( not ( = ?auto_24303 ?auto_24306 ) ) ( not ( = ?auto_24303 ?auto_24307 ) ) ( not ( = ?auto_24303 ?auto_24308 ) ) ( not ( = ?auto_24304 ?auto_24305 ) ) ( not ( = ?auto_24304 ?auto_24306 ) ) ( not ( = ?auto_24304 ?auto_24307 ) ) ( not ( = ?auto_24304 ?auto_24308 ) ) ( not ( = ?auto_24305 ?auto_24306 ) ) ( not ( = ?auto_24305 ?auto_24307 ) ) ( not ( = ?auto_24305 ?auto_24308 ) ) ( not ( = ?auto_24306 ?auto_24307 ) ) ( not ( = ?auto_24306 ?auto_24308 ) ) ( not ( = ?auto_24307 ?auto_24308 ) ) ( ON ?auto_24306 ?auto_24307 ) ( ON ?auto_24305 ?auto_24306 ) ( ON ?auto_24304 ?auto_24305 ) ( ON ?auto_24303 ?auto_24304 ) ( ON ?auto_24302 ?auto_24303 ) ( CLEAR ?auto_24302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24302 )
      ( MAKE-6PILE ?auto_24302 ?auto_24303 ?auto_24304 ?auto_24305 ?auto_24306 ?auto_24307 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_24315 - BLOCK
      ?auto_24316 - BLOCK
      ?auto_24317 - BLOCK
      ?auto_24318 - BLOCK
      ?auto_24319 - BLOCK
      ?auto_24320 - BLOCK
    )
    :vars
    (
      ?auto_24321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24320 ?auto_24321 ) ( not ( = ?auto_24315 ?auto_24316 ) ) ( not ( = ?auto_24315 ?auto_24317 ) ) ( not ( = ?auto_24315 ?auto_24318 ) ) ( not ( = ?auto_24315 ?auto_24319 ) ) ( not ( = ?auto_24315 ?auto_24320 ) ) ( not ( = ?auto_24315 ?auto_24321 ) ) ( not ( = ?auto_24316 ?auto_24317 ) ) ( not ( = ?auto_24316 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24319 ) ) ( not ( = ?auto_24316 ?auto_24320 ) ) ( not ( = ?auto_24316 ?auto_24321 ) ) ( not ( = ?auto_24317 ?auto_24318 ) ) ( not ( = ?auto_24317 ?auto_24319 ) ) ( not ( = ?auto_24317 ?auto_24320 ) ) ( not ( = ?auto_24317 ?auto_24321 ) ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24320 ) ) ( not ( = ?auto_24318 ?auto_24321 ) ) ( not ( = ?auto_24319 ?auto_24320 ) ) ( not ( = ?auto_24319 ?auto_24321 ) ) ( not ( = ?auto_24320 ?auto_24321 ) ) ( ON ?auto_24319 ?auto_24320 ) ( ON ?auto_24318 ?auto_24319 ) ( ON ?auto_24317 ?auto_24318 ) ( ON ?auto_24316 ?auto_24317 ) ( ON ?auto_24315 ?auto_24316 ) ( CLEAR ?auto_24315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24315 )
      ( MAKE-6PILE ?auto_24315 ?auto_24316 ?auto_24317 ?auto_24318 ?auto_24319 ?auto_24320 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24329 - BLOCK
      ?auto_24330 - BLOCK
      ?auto_24331 - BLOCK
      ?auto_24332 - BLOCK
      ?auto_24333 - BLOCK
      ?auto_24334 - BLOCK
      ?auto_24335 - BLOCK
    )
    :vars
    (
      ?auto_24336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24334 ) ( ON ?auto_24335 ?auto_24336 ) ( CLEAR ?auto_24335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24329 ) ( ON ?auto_24330 ?auto_24329 ) ( ON ?auto_24331 ?auto_24330 ) ( ON ?auto_24332 ?auto_24331 ) ( ON ?auto_24333 ?auto_24332 ) ( ON ?auto_24334 ?auto_24333 ) ( not ( = ?auto_24329 ?auto_24330 ) ) ( not ( = ?auto_24329 ?auto_24331 ) ) ( not ( = ?auto_24329 ?auto_24332 ) ) ( not ( = ?auto_24329 ?auto_24333 ) ) ( not ( = ?auto_24329 ?auto_24334 ) ) ( not ( = ?auto_24329 ?auto_24335 ) ) ( not ( = ?auto_24329 ?auto_24336 ) ) ( not ( = ?auto_24330 ?auto_24331 ) ) ( not ( = ?auto_24330 ?auto_24332 ) ) ( not ( = ?auto_24330 ?auto_24333 ) ) ( not ( = ?auto_24330 ?auto_24334 ) ) ( not ( = ?auto_24330 ?auto_24335 ) ) ( not ( = ?auto_24330 ?auto_24336 ) ) ( not ( = ?auto_24331 ?auto_24332 ) ) ( not ( = ?auto_24331 ?auto_24333 ) ) ( not ( = ?auto_24331 ?auto_24334 ) ) ( not ( = ?auto_24331 ?auto_24335 ) ) ( not ( = ?auto_24331 ?auto_24336 ) ) ( not ( = ?auto_24332 ?auto_24333 ) ) ( not ( = ?auto_24332 ?auto_24334 ) ) ( not ( = ?auto_24332 ?auto_24335 ) ) ( not ( = ?auto_24332 ?auto_24336 ) ) ( not ( = ?auto_24333 ?auto_24334 ) ) ( not ( = ?auto_24333 ?auto_24335 ) ) ( not ( = ?auto_24333 ?auto_24336 ) ) ( not ( = ?auto_24334 ?auto_24335 ) ) ( not ( = ?auto_24334 ?auto_24336 ) ) ( not ( = ?auto_24335 ?auto_24336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24335 ?auto_24336 )
      ( !STACK ?auto_24335 ?auto_24334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24344 - BLOCK
      ?auto_24345 - BLOCK
      ?auto_24346 - BLOCK
      ?auto_24347 - BLOCK
      ?auto_24348 - BLOCK
      ?auto_24349 - BLOCK
      ?auto_24350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24349 ) ( ON-TABLE ?auto_24350 ) ( CLEAR ?auto_24350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24344 ) ( ON ?auto_24345 ?auto_24344 ) ( ON ?auto_24346 ?auto_24345 ) ( ON ?auto_24347 ?auto_24346 ) ( ON ?auto_24348 ?auto_24347 ) ( ON ?auto_24349 ?auto_24348 ) ( not ( = ?auto_24344 ?auto_24345 ) ) ( not ( = ?auto_24344 ?auto_24346 ) ) ( not ( = ?auto_24344 ?auto_24347 ) ) ( not ( = ?auto_24344 ?auto_24348 ) ) ( not ( = ?auto_24344 ?auto_24349 ) ) ( not ( = ?auto_24344 ?auto_24350 ) ) ( not ( = ?auto_24345 ?auto_24346 ) ) ( not ( = ?auto_24345 ?auto_24347 ) ) ( not ( = ?auto_24345 ?auto_24348 ) ) ( not ( = ?auto_24345 ?auto_24349 ) ) ( not ( = ?auto_24345 ?auto_24350 ) ) ( not ( = ?auto_24346 ?auto_24347 ) ) ( not ( = ?auto_24346 ?auto_24348 ) ) ( not ( = ?auto_24346 ?auto_24349 ) ) ( not ( = ?auto_24346 ?auto_24350 ) ) ( not ( = ?auto_24347 ?auto_24348 ) ) ( not ( = ?auto_24347 ?auto_24349 ) ) ( not ( = ?auto_24347 ?auto_24350 ) ) ( not ( = ?auto_24348 ?auto_24349 ) ) ( not ( = ?auto_24348 ?auto_24350 ) ) ( not ( = ?auto_24349 ?auto_24350 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_24350 )
      ( !STACK ?auto_24350 ?auto_24349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24358 - BLOCK
      ?auto_24359 - BLOCK
      ?auto_24360 - BLOCK
      ?auto_24361 - BLOCK
      ?auto_24362 - BLOCK
      ?auto_24363 - BLOCK
      ?auto_24364 - BLOCK
    )
    :vars
    (
      ?auto_24365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24364 ?auto_24365 ) ( ON-TABLE ?auto_24358 ) ( ON ?auto_24359 ?auto_24358 ) ( ON ?auto_24360 ?auto_24359 ) ( ON ?auto_24361 ?auto_24360 ) ( ON ?auto_24362 ?auto_24361 ) ( not ( = ?auto_24358 ?auto_24359 ) ) ( not ( = ?auto_24358 ?auto_24360 ) ) ( not ( = ?auto_24358 ?auto_24361 ) ) ( not ( = ?auto_24358 ?auto_24362 ) ) ( not ( = ?auto_24358 ?auto_24363 ) ) ( not ( = ?auto_24358 ?auto_24364 ) ) ( not ( = ?auto_24358 ?auto_24365 ) ) ( not ( = ?auto_24359 ?auto_24360 ) ) ( not ( = ?auto_24359 ?auto_24361 ) ) ( not ( = ?auto_24359 ?auto_24362 ) ) ( not ( = ?auto_24359 ?auto_24363 ) ) ( not ( = ?auto_24359 ?auto_24364 ) ) ( not ( = ?auto_24359 ?auto_24365 ) ) ( not ( = ?auto_24360 ?auto_24361 ) ) ( not ( = ?auto_24360 ?auto_24362 ) ) ( not ( = ?auto_24360 ?auto_24363 ) ) ( not ( = ?auto_24360 ?auto_24364 ) ) ( not ( = ?auto_24360 ?auto_24365 ) ) ( not ( = ?auto_24361 ?auto_24362 ) ) ( not ( = ?auto_24361 ?auto_24363 ) ) ( not ( = ?auto_24361 ?auto_24364 ) ) ( not ( = ?auto_24361 ?auto_24365 ) ) ( not ( = ?auto_24362 ?auto_24363 ) ) ( not ( = ?auto_24362 ?auto_24364 ) ) ( not ( = ?auto_24362 ?auto_24365 ) ) ( not ( = ?auto_24363 ?auto_24364 ) ) ( not ( = ?auto_24363 ?auto_24365 ) ) ( not ( = ?auto_24364 ?auto_24365 ) ) ( CLEAR ?auto_24362 ) ( ON ?auto_24363 ?auto_24364 ) ( CLEAR ?auto_24363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_24358 ?auto_24359 ?auto_24360 ?auto_24361 ?auto_24362 ?auto_24363 )
      ( MAKE-7PILE ?auto_24358 ?auto_24359 ?auto_24360 ?auto_24361 ?auto_24362 ?auto_24363 ?auto_24364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24373 - BLOCK
      ?auto_24374 - BLOCK
      ?auto_24375 - BLOCK
      ?auto_24376 - BLOCK
      ?auto_24377 - BLOCK
      ?auto_24378 - BLOCK
      ?auto_24379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24379 ) ( ON-TABLE ?auto_24373 ) ( ON ?auto_24374 ?auto_24373 ) ( ON ?auto_24375 ?auto_24374 ) ( ON ?auto_24376 ?auto_24375 ) ( ON ?auto_24377 ?auto_24376 ) ( not ( = ?auto_24373 ?auto_24374 ) ) ( not ( = ?auto_24373 ?auto_24375 ) ) ( not ( = ?auto_24373 ?auto_24376 ) ) ( not ( = ?auto_24373 ?auto_24377 ) ) ( not ( = ?auto_24373 ?auto_24378 ) ) ( not ( = ?auto_24373 ?auto_24379 ) ) ( not ( = ?auto_24374 ?auto_24375 ) ) ( not ( = ?auto_24374 ?auto_24376 ) ) ( not ( = ?auto_24374 ?auto_24377 ) ) ( not ( = ?auto_24374 ?auto_24378 ) ) ( not ( = ?auto_24374 ?auto_24379 ) ) ( not ( = ?auto_24375 ?auto_24376 ) ) ( not ( = ?auto_24375 ?auto_24377 ) ) ( not ( = ?auto_24375 ?auto_24378 ) ) ( not ( = ?auto_24375 ?auto_24379 ) ) ( not ( = ?auto_24376 ?auto_24377 ) ) ( not ( = ?auto_24376 ?auto_24378 ) ) ( not ( = ?auto_24376 ?auto_24379 ) ) ( not ( = ?auto_24377 ?auto_24378 ) ) ( not ( = ?auto_24377 ?auto_24379 ) ) ( not ( = ?auto_24378 ?auto_24379 ) ) ( CLEAR ?auto_24377 ) ( ON ?auto_24378 ?auto_24379 ) ( CLEAR ?auto_24378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_24373 ?auto_24374 ?auto_24375 ?auto_24376 ?auto_24377 ?auto_24378 )
      ( MAKE-7PILE ?auto_24373 ?auto_24374 ?auto_24375 ?auto_24376 ?auto_24377 ?auto_24378 ?auto_24379 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24387 - BLOCK
      ?auto_24388 - BLOCK
      ?auto_24389 - BLOCK
      ?auto_24390 - BLOCK
      ?auto_24391 - BLOCK
      ?auto_24392 - BLOCK
      ?auto_24393 - BLOCK
    )
    :vars
    (
      ?auto_24394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24393 ?auto_24394 ) ( ON-TABLE ?auto_24387 ) ( ON ?auto_24388 ?auto_24387 ) ( ON ?auto_24389 ?auto_24388 ) ( ON ?auto_24390 ?auto_24389 ) ( not ( = ?auto_24387 ?auto_24388 ) ) ( not ( = ?auto_24387 ?auto_24389 ) ) ( not ( = ?auto_24387 ?auto_24390 ) ) ( not ( = ?auto_24387 ?auto_24391 ) ) ( not ( = ?auto_24387 ?auto_24392 ) ) ( not ( = ?auto_24387 ?auto_24393 ) ) ( not ( = ?auto_24387 ?auto_24394 ) ) ( not ( = ?auto_24388 ?auto_24389 ) ) ( not ( = ?auto_24388 ?auto_24390 ) ) ( not ( = ?auto_24388 ?auto_24391 ) ) ( not ( = ?auto_24388 ?auto_24392 ) ) ( not ( = ?auto_24388 ?auto_24393 ) ) ( not ( = ?auto_24388 ?auto_24394 ) ) ( not ( = ?auto_24389 ?auto_24390 ) ) ( not ( = ?auto_24389 ?auto_24391 ) ) ( not ( = ?auto_24389 ?auto_24392 ) ) ( not ( = ?auto_24389 ?auto_24393 ) ) ( not ( = ?auto_24389 ?auto_24394 ) ) ( not ( = ?auto_24390 ?auto_24391 ) ) ( not ( = ?auto_24390 ?auto_24392 ) ) ( not ( = ?auto_24390 ?auto_24393 ) ) ( not ( = ?auto_24390 ?auto_24394 ) ) ( not ( = ?auto_24391 ?auto_24392 ) ) ( not ( = ?auto_24391 ?auto_24393 ) ) ( not ( = ?auto_24391 ?auto_24394 ) ) ( not ( = ?auto_24392 ?auto_24393 ) ) ( not ( = ?auto_24392 ?auto_24394 ) ) ( not ( = ?auto_24393 ?auto_24394 ) ) ( ON ?auto_24392 ?auto_24393 ) ( CLEAR ?auto_24390 ) ( ON ?auto_24391 ?auto_24392 ) ( CLEAR ?auto_24391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 )
      ( MAKE-7PILE ?auto_24387 ?auto_24388 ?auto_24389 ?auto_24390 ?auto_24391 ?auto_24392 ?auto_24393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24402 - BLOCK
      ?auto_24403 - BLOCK
      ?auto_24404 - BLOCK
      ?auto_24405 - BLOCK
      ?auto_24406 - BLOCK
      ?auto_24407 - BLOCK
      ?auto_24408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24408 ) ( ON-TABLE ?auto_24402 ) ( ON ?auto_24403 ?auto_24402 ) ( ON ?auto_24404 ?auto_24403 ) ( ON ?auto_24405 ?auto_24404 ) ( not ( = ?auto_24402 ?auto_24403 ) ) ( not ( = ?auto_24402 ?auto_24404 ) ) ( not ( = ?auto_24402 ?auto_24405 ) ) ( not ( = ?auto_24402 ?auto_24406 ) ) ( not ( = ?auto_24402 ?auto_24407 ) ) ( not ( = ?auto_24402 ?auto_24408 ) ) ( not ( = ?auto_24403 ?auto_24404 ) ) ( not ( = ?auto_24403 ?auto_24405 ) ) ( not ( = ?auto_24403 ?auto_24406 ) ) ( not ( = ?auto_24403 ?auto_24407 ) ) ( not ( = ?auto_24403 ?auto_24408 ) ) ( not ( = ?auto_24404 ?auto_24405 ) ) ( not ( = ?auto_24404 ?auto_24406 ) ) ( not ( = ?auto_24404 ?auto_24407 ) ) ( not ( = ?auto_24404 ?auto_24408 ) ) ( not ( = ?auto_24405 ?auto_24406 ) ) ( not ( = ?auto_24405 ?auto_24407 ) ) ( not ( = ?auto_24405 ?auto_24408 ) ) ( not ( = ?auto_24406 ?auto_24407 ) ) ( not ( = ?auto_24406 ?auto_24408 ) ) ( not ( = ?auto_24407 ?auto_24408 ) ) ( ON ?auto_24407 ?auto_24408 ) ( CLEAR ?auto_24405 ) ( ON ?auto_24406 ?auto_24407 ) ( CLEAR ?auto_24406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24402 ?auto_24403 ?auto_24404 ?auto_24405 ?auto_24406 )
      ( MAKE-7PILE ?auto_24402 ?auto_24403 ?auto_24404 ?auto_24405 ?auto_24406 ?auto_24407 ?auto_24408 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24416 - BLOCK
      ?auto_24417 - BLOCK
      ?auto_24418 - BLOCK
      ?auto_24419 - BLOCK
      ?auto_24420 - BLOCK
      ?auto_24421 - BLOCK
      ?auto_24422 - BLOCK
    )
    :vars
    (
      ?auto_24423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24422 ?auto_24423 ) ( ON-TABLE ?auto_24416 ) ( ON ?auto_24417 ?auto_24416 ) ( ON ?auto_24418 ?auto_24417 ) ( not ( = ?auto_24416 ?auto_24417 ) ) ( not ( = ?auto_24416 ?auto_24418 ) ) ( not ( = ?auto_24416 ?auto_24419 ) ) ( not ( = ?auto_24416 ?auto_24420 ) ) ( not ( = ?auto_24416 ?auto_24421 ) ) ( not ( = ?auto_24416 ?auto_24422 ) ) ( not ( = ?auto_24416 ?auto_24423 ) ) ( not ( = ?auto_24417 ?auto_24418 ) ) ( not ( = ?auto_24417 ?auto_24419 ) ) ( not ( = ?auto_24417 ?auto_24420 ) ) ( not ( = ?auto_24417 ?auto_24421 ) ) ( not ( = ?auto_24417 ?auto_24422 ) ) ( not ( = ?auto_24417 ?auto_24423 ) ) ( not ( = ?auto_24418 ?auto_24419 ) ) ( not ( = ?auto_24418 ?auto_24420 ) ) ( not ( = ?auto_24418 ?auto_24421 ) ) ( not ( = ?auto_24418 ?auto_24422 ) ) ( not ( = ?auto_24418 ?auto_24423 ) ) ( not ( = ?auto_24419 ?auto_24420 ) ) ( not ( = ?auto_24419 ?auto_24421 ) ) ( not ( = ?auto_24419 ?auto_24422 ) ) ( not ( = ?auto_24419 ?auto_24423 ) ) ( not ( = ?auto_24420 ?auto_24421 ) ) ( not ( = ?auto_24420 ?auto_24422 ) ) ( not ( = ?auto_24420 ?auto_24423 ) ) ( not ( = ?auto_24421 ?auto_24422 ) ) ( not ( = ?auto_24421 ?auto_24423 ) ) ( not ( = ?auto_24422 ?auto_24423 ) ) ( ON ?auto_24421 ?auto_24422 ) ( ON ?auto_24420 ?auto_24421 ) ( CLEAR ?auto_24418 ) ( ON ?auto_24419 ?auto_24420 ) ( CLEAR ?auto_24419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24416 ?auto_24417 ?auto_24418 ?auto_24419 )
      ( MAKE-7PILE ?auto_24416 ?auto_24417 ?auto_24418 ?auto_24419 ?auto_24420 ?auto_24421 ?auto_24422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24431 - BLOCK
      ?auto_24432 - BLOCK
      ?auto_24433 - BLOCK
      ?auto_24434 - BLOCK
      ?auto_24435 - BLOCK
      ?auto_24436 - BLOCK
      ?auto_24437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24437 ) ( ON-TABLE ?auto_24431 ) ( ON ?auto_24432 ?auto_24431 ) ( ON ?auto_24433 ?auto_24432 ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24434 ) ) ( not ( = ?auto_24431 ?auto_24435 ) ) ( not ( = ?auto_24431 ?auto_24436 ) ) ( not ( = ?auto_24431 ?auto_24437 ) ) ( not ( = ?auto_24432 ?auto_24433 ) ) ( not ( = ?auto_24432 ?auto_24434 ) ) ( not ( = ?auto_24432 ?auto_24435 ) ) ( not ( = ?auto_24432 ?auto_24436 ) ) ( not ( = ?auto_24432 ?auto_24437 ) ) ( not ( = ?auto_24433 ?auto_24434 ) ) ( not ( = ?auto_24433 ?auto_24435 ) ) ( not ( = ?auto_24433 ?auto_24436 ) ) ( not ( = ?auto_24433 ?auto_24437 ) ) ( not ( = ?auto_24434 ?auto_24435 ) ) ( not ( = ?auto_24434 ?auto_24436 ) ) ( not ( = ?auto_24434 ?auto_24437 ) ) ( not ( = ?auto_24435 ?auto_24436 ) ) ( not ( = ?auto_24435 ?auto_24437 ) ) ( not ( = ?auto_24436 ?auto_24437 ) ) ( ON ?auto_24436 ?auto_24437 ) ( ON ?auto_24435 ?auto_24436 ) ( CLEAR ?auto_24433 ) ( ON ?auto_24434 ?auto_24435 ) ( CLEAR ?auto_24434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24431 ?auto_24432 ?auto_24433 ?auto_24434 )
      ( MAKE-7PILE ?auto_24431 ?auto_24432 ?auto_24433 ?auto_24434 ?auto_24435 ?auto_24436 ?auto_24437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24445 - BLOCK
      ?auto_24446 - BLOCK
      ?auto_24447 - BLOCK
      ?auto_24448 - BLOCK
      ?auto_24449 - BLOCK
      ?auto_24450 - BLOCK
      ?auto_24451 - BLOCK
    )
    :vars
    (
      ?auto_24452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24451 ?auto_24452 ) ( ON-TABLE ?auto_24445 ) ( ON ?auto_24446 ?auto_24445 ) ( not ( = ?auto_24445 ?auto_24446 ) ) ( not ( = ?auto_24445 ?auto_24447 ) ) ( not ( = ?auto_24445 ?auto_24448 ) ) ( not ( = ?auto_24445 ?auto_24449 ) ) ( not ( = ?auto_24445 ?auto_24450 ) ) ( not ( = ?auto_24445 ?auto_24451 ) ) ( not ( = ?auto_24445 ?auto_24452 ) ) ( not ( = ?auto_24446 ?auto_24447 ) ) ( not ( = ?auto_24446 ?auto_24448 ) ) ( not ( = ?auto_24446 ?auto_24449 ) ) ( not ( = ?auto_24446 ?auto_24450 ) ) ( not ( = ?auto_24446 ?auto_24451 ) ) ( not ( = ?auto_24446 ?auto_24452 ) ) ( not ( = ?auto_24447 ?auto_24448 ) ) ( not ( = ?auto_24447 ?auto_24449 ) ) ( not ( = ?auto_24447 ?auto_24450 ) ) ( not ( = ?auto_24447 ?auto_24451 ) ) ( not ( = ?auto_24447 ?auto_24452 ) ) ( not ( = ?auto_24448 ?auto_24449 ) ) ( not ( = ?auto_24448 ?auto_24450 ) ) ( not ( = ?auto_24448 ?auto_24451 ) ) ( not ( = ?auto_24448 ?auto_24452 ) ) ( not ( = ?auto_24449 ?auto_24450 ) ) ( not ( = ?auto_24449 ?auto_24451 ) ) ( not ( = ?auto_24449 ?auto_24452 ) ) ( not ( = ?auto_24450 ?auto_24451 ) ) ( not ( = ?auto_24450 ?auto_24452 ) ) ( not ( = ?auto_24451 ?auto_24452 ) ) ( ON ?auto_24450 ?auto_24451 ) ( ON ?auto_24449 ?auto_24450 ) ( ON ?auto_24448 ?auto_24449 ) ( CLEAR ?auto_24446 ) ( ON ?auto_24447 ?auto_24448 ) ( CLEAR ?auto_24447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24445 ?auto_24446 ?auto_24447 )
      ( MAKE-7PILE ?auto_24445 ?auto_24446 ?auto_24447 ?auto_24448 ?auto_24449 ?auto_24450 ?auto_24451 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24460 - BLOCK
      ?auto_24461 - BLOCK
      ?auto_24462 - BLOCK
      ?auto_24463 - BLOCK
      ?auto_24464 - BLOCK
      ?auto_24465 - BLOCK
      ?auto_24466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24466 ) ( ON-TABLE ?auto_24460 ) ( ON ?auto_24461 ?auto_24460 ) ( not ( = ?auto_24460 ?auto_24461 ) ) ( not ( = ?auto_24460 ?auto_24462 ) ) ( not ( = ?auto_24460 ?auto_24463 ) ) ( not ( = ?auto_24460 ?auto_24464 ) ) ( not ( = ?auto_24460 ?auto_24465 ) ) ( not ( = ?auto_24460 ?auto_24466 ) ) ( not ( = ?auto_24461 ?auto_24462 ) ) ( not ( = ?auto_24461 ?auto_24463 ) ) ( not ( = ?auto_24461 ?auto_24464 ) ) ( not ( = ?auto_24461 ?auto_24465 ) ) ( not ( = ?auto_24461 ?auto_24466 ) ) ( not ( = ?auto_24462 ?auto_24463 ) ) ( not ( = ?auto_24462 ?auto_24464 ) ) ( not ( = ?auto_24462 ?auto_24465 ) ) ( not ( = ?auto_24462 ?auto_24466 ) ) ( not ( = ?auto_24463 ?auto_24464 ) ) ( not ( = ?auto_24463 ?auto_24465 ) ) ( not ( = ?auto_24463 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( ON ?auto_24465 ?auto_24466 ) ( ON ?auto_24464 ?auto_24465 ) ( ON ?auto_24463 ?auto_24464 ) ( CLEAR ?auto_24461 ) ( ON ?auto_24462 ?auto_24463 ) ( CLEAR ?auto_24462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24460 ?auto_24461 ?auto_24462 )
      ( MAKE-7PILE ?auto_24460 ?auto_24461 ?auto_24462 ?auto_24463 ?auto_24464 ?auto_24465 ?auto_24466 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24474 - BLOCK
      ?auto_24475 - BLOCK
      ?auto_24476 - BLOCK
      ?auto_24477 - BLOCK
      ?auto_24478 - BLOCK
      ?auto_24479 - BLOCK
      ?auto_24480 - BLOCK
    )
    :vars
    (
      ?auto_24481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24480 ?auto_24481 ) ( ON-TABLE ?auto_24474 ) ( not ( = ?auto_24474 ?auto_24475 ) ) ( not ( = ?auto_24474 ?auto_24476 ) ) ( not ( = ?auto_24474 ?auto_24477 ) ) ( not ( = ?auto_24474 ?auto_24478 ) ) ( not ( = ?auto_24474 ?auto_24479 ) ) ( not ( = ?auto_24474 ?auto_24480 ) ) ( not ( = ?auto_24474 ?auto_24481 ) ) ( not ( = ?auto_24475 ?auto_24476 ) ) ( not ( = ?auto_24475 ?auto_24477 ) ) ( not ( = ?auto_24475 ?auto_24478 ) ) ( not ( = ?auto_24475 ?auto_24479 ) ) ( not ( = ?auto_24475 ?auto_24480 ) ) ( not ( = ?auto_24475 ?auto_24481 ) ) ( not ( = ?auto_24476 ?auto_24477 ) ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24476 ?auto_24480 ) ) ( not ( = ?auto_24476 ?auto_24481 ) ) ( not ( = ?auto_24477 ?auto_24478 ) ) ( not ( = ?auto_24477 ?auto_24479 ) ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24477 ?auto_24481 ) ) ( not ( = ?auto_24478 ?auto_24479 ) ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( not ( = ?auto_24478 ?auto_24481 ) ) ( not ( = ?auto_24479 ?auto_24480 ) ) ( not ( = ?auto_24479 ?auto_24481 ) ) ( not ( = ?auto_24480 ?auto_24481 ) ) ( ON ?auto_24479 ?auto_24480 ) ( ON ?auto_24478 ?auto_24479 ) ( ON ?auto_24477 ?auto_24478 ) ( ON ?auto_24476 ?auto_24477 ) ( CLEAR ?auto_24474 ) ( ON ?auto_24475 ?auto_24476 ) ( CLEAR ?auto_24475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24474 ?auto_24475 )
      ( MAKE-7PILE ?auto_24474 ?auto_24475 ?auto_24476 ?auto_24477 ?auto_24478 ?auto_24479 ?auto_24480 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24489 - BLOCK
      ?auto_24490 - BLOCK
      ?auto_24491 - BLOCK
      ?auto_24492 - BLOCK
      ?auto_24493 - BLOCK
      ?auto_24494 - BLOCK
      ?auto_24495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24495 ) ( ON-TABLE ?auto_24489 ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( not ( = ?auto_24489 ?auto_24491 ) ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24489 ?auto_24493 ) ) ( not ( = ?auto_24489 ?auto_24494 ) ) ( not ( = ?auto_24489 ?auto_24495 ) ) ( not ( = ?auto_24490 ?auto_24491 ) ) ( not ( = ?auto_24490 ?auto_24492 ) ) ( not ( = ?auto_24490 ?auto_24493 ) ) ( not ( = ?auto_24490 ?auto_24494 ) ) ( not ( = ?auto_24490 ?auto_24495 ) ) ( not ( = ?auto_24491 ?auto_24492 ) ) ( not ( = ?auto_24491 ?auto_24493 ) ) ( not ( = ?auto_24491 ?auto_24494 ) ) ( not ( = ?auto_24491 ?auto_24495 ) ) ( not ( = ?auto_24492 ?auto_24493 ) ) ( not ( = ?auto_24492 ?auto_24494 ) ) ( not ( = ?auto_24492 ?auto_24495 ) ) ( not ( = ?auto_24493 ?auto_24494 ) ) ( not ( = ?auto_24493 ?auto_24495 ) ) ( not ( = ?auto_24494 ?auto_24495 ) ) ( ON ?auto_24494 ?auto_24495 ) ( ON ?auto_24493 ?auto_24494 ) ( ON ?auto_24492 ?auto_24493 ) ( ON ?auto_24491 ?auto_24492 ) ( CLEAR ?auto_24489 ) ( ON ?auto_24490 ?auto_24491 ) ( CLEAR ?auto_24490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24489 ?auto_24490 )
      ( MAKE-7PILE ?auto_24489 ?auto_24490 ?auto_24491 ?auto_24492 ?auto_24493 ?auto_24494 ?auto_24495 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24503 - BLOCK
      ?auto_24504 - BLOCK
      ?auto_24505 - BLOCK
      ?auto_24506 - BLOCK
      ?auto_24507 - BLOCK
      ?auto_24508 - BLOCK
      ?auto_24509 - BLOCK
    )
    :vars
    (
      ?auto_24510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24509 ?auto_24510 ) ( not ( = ?auto_24503 ?auto_24504 ) ) ( not ( = ?auto_24503 ?auto_24505 ) ) ( not ( = ?auto_24503 ?auto_24506 ) ) ( not ( = ?auto_24503 ?auto_24507 ) ) ( not ( = ?auto_24503 ?auto_24508 ) ) ( not ( = ?auto_24503 ?auto_24509 ) ) ( not ( = ?auto_24503 ?auto_24510 ) ) ( not ( = ?auto_24504 ?auto_24505 ) ) ( not ( = ?auto_24504 ?auto_24506 ) ) ( not ( = ?auto_24504 ?auto_24507 ) ) ( not ( = ?auto_24504 ?auto_24508 ) ) ( not ( = ?auto_24504 ?auto_24509 ) ) ( not ( = ?auto_24504 ?auto_24510 ) ) ( not ( = ?auto_24505 ?auto_24506 ) ) ( not ( = ?auto_24505 ?auto_24507 ) ) ( not ( = ?auto_24505 ?auto_24508 ) ) ( not ( = ?auto_24505 ?auto_24509 ) ) ( not ( = ?auto_24505 ?auto_24510 ) ) ( not ( = ?auto_24506 ?auto_24507 ) ) ( not ( = ?auto_24506 ?auto_24508 ) ) ( not ( = ?auto_24506 ?auto_24509 ) ) ( not ( = ?auto_24506 ?auto_24510 ) ) ( not ( = ?auto_24507 ?auto_24508 ) ) ( not ( = ?auto_24507 ?auto_24509 ) ) ( not ( = ?auto_24507 ?auto_24510 ) ) ( not ( = ?auto_24508 ?auto_24509 ) ) ( not ( = ?auto_24508 ?auto_24510 ) ) ( not ( = ?auto_24509 ?auto_24510 ) ) ( ON ?auto_24508 ?auto_24509 ) ( ON ?auto_24507 ?auto_24508 ) ( ON ?auto_24506 ?auto_24507 ) ( ON ?auto_24505 ?auto_24506 ) ( ON ?auto_24504 ?auto_24505 ) ( ON ?auto_24503 ?auto_24504 ) ( CLEAR ?auto_24503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24503 )
      ( MAKE-7PILE ?auto_24503 ?auto_24504 ?auto_24505 ?auto_24506 ?auto_24507 ?auto_24508 ?auto_24509 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24518 - BLOCK
      ?auto_24519 - BLOCK
      ?auto_24520 - BLOCK
      ?auto_24521 - BLOCK
      ?auto_24522 - BLOCK
      ?auto_24523 - BLOCK
      ?auto_24524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24524 ) ( not ( = ?auto_24518 ?auto_24519 ) ) ( not ( = ?auto_24518 ?auto_24520 ) ) ( not ( = ?auto_24518 ?auto_24521 ) ) ( not ( = ?auto_24518 ?auto_24522 ) ) ( not ( = ?auto_24518 ?auto_24523 ) ) ( not ( = ?auto_24518 ?auto_24524 ) ) ( not ( = ?auto_24519 ?auto_24520 ) ) ( not ( = ?auto_24519 ?auto_24521 ) ) ( not ( = ?auto_24519 ?auto_24522 ) ) ( not ( = ?auto_24519 ?auto_24523 ) ) ( not ( = ?auto_24519 ?auto_24524 ) ) ( not ( = ?auto_24520 ?auto_24521 ) ) ( not ( = ?auto_24520 ?auto_24522 ) ) ( not ( = ?auto_24520 ?auto_24523 ) ) ( not ( = ?auto_24520 ?auto_24524 ) ) ( not ( = ?auto_24521 ?auto_24522 ) ) ( not ( = ?auto_24521 ?auto_24523 ) ) ( not ( = ?auto_24521 ?auto_24524 ) ) ( not ( = ?auto_24522 ?auto_24523 ) ) ( not ( = ?auto_24522 ?auto_24524 ) ) ( not ( = ?auto_24523 ?auto_24524 ) ) ( ON ?auto_24523 ?auto_24524 ) ( ON ?auto_24522 ?auto_24523 ) ( ON ?auto_24521 ?auto_24522 ) ( ON ?auto_24520 ?auto_24521 ) ( ON ?auto_24519 ?auto_24520 ) ( ON ?auto_24518 ?auto_24519 ) ( CLEAR ?auto_24518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24518 )
      ( MAKE-7PILE ?auto_24518 ?auto_24519 ?auto_24520 ?auto_24521 ?auto_24522 ?auto_24523 ?auto_24524 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_24532 - BLOCK
      ?auto_24533 - BLOCK
      ?auto_24534 - BLOCK
      ?auto_24535 - BLOCK
      ?auto_24536 - BLOCK
      ?auto_24537 - BLOCK
      ?auto_24538 - BLOCK
    )
    :vars
    (
      ?auto_24539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24532 ?auto_24533 ) ) ( not ( = ?auto_24532 ?auto_24534 ) ) ( not ( = ?auto_24532 ?auto_24535 ) ) ( not ( = ?auto_24532 ?auto_24536 ) ) ( not ( = ?auto_24532 ?auto_24537 ) ) ( not ( = ?auto_24532 ?auto_24538 ) ) ( not ( = ?auto_24533 ?auto_24534 ) ) ( not ( = ?auto_24533 ?auto_24535 ) ) ( not ( = ?auto_24533 ?auto_24536 ) ) ( not ( = ?auto_24533 ?auto_24537 ) ) ( not ( = ?auto_24533 ?auto_24538 ) ) ( not ( = ?auto_24534 ?auto_24535 ) ) ( not ( = ?auto_24534 ?auto_24536 ) ) ( not ( = ?auto_24534 ?auto_24537 ) ) ( not ( = ?auto_24534 ?auto_24538 ) ) ( not ( = ?auto_24535 ?auto_24536 ) ) ( not ( = ?auto_24535 ?auto_24537 ) ) ( not ( = ?auto_24535 ?auto_24538 ) ) ( not ( = ?auto_24536 ?auto_24537 ) ) ( not ( = ?auto_24536 ?auto_24538 ) ) ( not ( = ?auto_24537 ?auto_24538 ) ) ( ON ?auto_24532 ?auto_24539 ) ( not ( = ?auto_24538 ?auto_24539 ) ) ( not ( = ?auto_24537 ?auto_24539 ) ) ( not ( = ?auto_24536 ?auto_24539 ) ) ( not ( = ?auto_24535 ?auto_24539 ) ) ( not ( = ?auto_24534 ?auto_24539 ) ) ( not ( = ?auto_24533 ?auto_24539 ) ) ( not ( = ?auto_24532 ?auto_24539 ) ) ( ON ?auto_24533 ?auto_24532 ) ( ON ?auto_24534 ?auto_24533 ) ( ON ?auto_24535 ?auto_24534 ) ( ON ?auto_24536 ?auto_24535 ) ( ON ?auto_24537 ?auto_24536 ) ( ON ?auto_24538 ?auto_24537 ) ( CLEAR ?auto_24538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_24538 ?auto_24537 ?auto_24536 ?auto_24535 ?auto_24534 ?auto_24533 ?auto_24532 )
      ( MAKE-7PILE ?auto_24532 ?auto_24533 ?auto_24534 ?auto_24535 ?auto_24536 ?auto_24537 ?auto_24538 ) )
  )

)

