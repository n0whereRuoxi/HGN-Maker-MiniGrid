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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_964 - BLOCK
      ?auto_965 - BLOCK
    )
    :vars
    (
      ?auto_966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_966 ?auto_965 ) ( CLEAR ?auto_966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_964 ) ( ON ?auto_965 ?auto_964 ) ( not ( = ?auto_964 ?auto_965 ) ) ( not ( = ?auto_964 ?auto_966 ) ) ( not ( = ?auto_965 ?auto_966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_966 ?auto_965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_968 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_968 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_969 - BLOCK
    )
    :vars
    (
      ?auto_970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_969 ?auto_970 ) ( CLEAR ?auto_969 ) ( HAND-EMPTY ) ( not ( = ?auto_969 ?auto_970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_969 ?auto_970 )
      ( MAKE-1PILE ?auto_969 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_972 - BLOCK
    )
    :vars
    (
      ?auto_973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_973 ?auto_972 ) ( CLEAR ?auto_973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_972 ) ( not ( = ?auto_972 ?auto_973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_973 ?auto_972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_974 - BLOCK
    )
    :vars
    (
      ?auto_975 - BLOCK
      ?auto_976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_975 ?auto_974 ) ( CLEAR ?auto_975 ) ( ON-TABLE ?auto_974 ) ( not ( = ?auto_974 ?auto_975 ) ) ( HOLDING ?auto_976 ) ( not ( = ?auto_974 ?auto_976 ) ) ( not ( = ?auto_975 ?auto_976 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_976 )
      ( MAKE-1PILE ?auto_974 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_977 - BLOCK
    )
    :vars
    (
      ?auto_979 - BLOCK
      ?auto_978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_979 ?auto_977 ) ( ON-TABLE ?auto_977 ) ( not ( = ?auto_977 ?auto_979 ) ) ( not ( = ?auto_977 ?auto_978 ) ) ( not ( = ?auto_979 ?auto_978 ) ) ( ON ?auto_978 ?auto_979 ) ( CLEAR ?auto_978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_977 ?auto_979 )
      ( MAKE-1PILE ?auto_977 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_982 - BLOCK
      ?auto_983 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_983 ) ( CLEAR ?auto_982 ) ( ON-TABLE ?auto_982 ) ( not ( = ?auto_982 ?auto_983 ) ) )
    :subtasks
    ( ( !STACK ?auto_983 ?auto_982 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_984 - BLOCK
      ?auto_985 - BLOCK
    )
    :vars
    (
      ?auto_986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_984 ) ( ON-TABLE ?auto_984 ) ( not ( = ?auto_984 ?auto_985 ) ) ( ON ?auto_985 ?auto_986 ) ( CLEAR ?auto_985 ) ( HAND-EMPTY ) ( not ( = ?auto_984 ?auto_986 ) ) ( not ( = ?auto_985 ?auto_986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_985 ?auto_986 )
      ( MAKE-2PILE ?auto_984 ?auto_985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_987 - BLOCK
      ?auto_988 - BLOCK
    )
    :vars
    (
      ?auto_989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_987 ?auto_988 ) ) ( ON ?auto_988 ?auto_989 ) ( CLEAR ?auto_988 ) ( not ( = ?auto_987 ?auto_989 ) ) ( not ( = ?auto_988 ?auto_989 ) ) ( HOLDING ?auto_987 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_987 )
      ( MAKE-2PILE ?auto_987 ?auto_988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_990 - BLOCK
      ?auto_991 - BLOCK
    )
    :vars
    (
      ?auto_992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_990 ?auto_991 ) ) ( ON ?auto_991 ?auto_992 ) ( not ( = ?auto_990 ?auto_992 ) ) ( not ( = ?auto_991 ?auto_992 ) ) ( ON ?auto_990 ?auto_991 ) ( CLEAR ?auto_990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_992 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_992 ?auto_991 )
      ( MAKE-2PILE ?auto_990 ?auto_991 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1009 - BLOCK
    )
    :vars
    (
      ?auto_1010 - BLOCK
      ?auto_1011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1009 ?auto_1010 ) ( CLEAR ?auto_1009 ) ( not ( = ?auto_1009 ?auto_1010 ) ) ( HOLDING ?auto_1011 ) ( not ( = ?auto_1009 ?auto_1011 ) ) ( not ( = ?auto_1010 ?auto_1011 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1011 )
      ( MAKE-1PILE ?auto_1009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1012 - BLOCK
    )
    :vars
    (
      ?auto_1013 - BLOCK
      ?auto_1014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1012 ?auto_1013 ) ( not ( = ?auto_1012 ?auto_1013 ) ) ( not ( = ?auto_1012 ?auto_1014 ) ) ( not ( = ?auto_1013 ?auto_1014 ) ) ( ON ?auto_1014 ?auto_1012 ) ( CLEAR ?auto_1014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1013 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1013 ?auto_1012 )
      ( MAKE-1PILE ?auto_1012 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1019 - BLOCK
      ?auto_1020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1019 ) ( ON-TABLE ?auto_1019 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( ON-TABLE ?auto_1020 ) ( CLEAR ?auto_1020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1020 )
      ( MAKE-2PILE ?auto_1019 ?auto_1020 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1021 - BLOCK
      ?auto_1022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1021 ?auto_1022 ) ) ( ON-TABLE ?auto_1022 ) ( CLEAR ?auto_1022 ) ( HOLDING ?auto_1021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1021 )
      ( MAKE-2PILE ?auto_1021 ?auto_1022 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1023 - BLOCK
      ?auto_1024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1023 ?auto_1024 ) ) ( ON-TABLE ?auto_1024 ) ( ON ?auto_1023 ?auto_1024 ) ( CLEAR ?auto_1023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1024 )
      ( MAKE-2PILE ?auto_1023 ?auto_1024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1027 - BLOCK
      ?auto_1028 - BLOCK
    )
    :vars
    (
      ?auto_1029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1027 ?auto_1028 ) ) ( ON-TABLE ?auto_1028 ) ( CLEAR ?auto_1028 ) ( ON ?auto_1027 ?auto_1029 ) ( CLEAR ?auto_1027 ) ( HAND-EMPTY ) ( not ( = ?auto_1027 ?auto_1029 ) ) ( not ( = ?auto_1028 ?auto_1029 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1027 ?auto_1029 )
      ( MAKE-2PILE ?auto_1027 ?auto_1028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1030 - BLOCK
      ?auto_1031 - BLOCK
    )
    :vars
    (
      ?auto_1032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1030 ?auto_1031 ) ) ( ON ?auto_1030 ?auto_1032 ) ( CLEAR ?auto_1030 ) ( not ( = ?auto_1030 ?auto_1032 ) ) ( not ( = ?auto_1031 ?auto_1032 ) ) ( HOLDING ?auto_1031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1031 )
      ( MAKE-2PILE ?auto_1030 ?auto_1031 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1033 - BLOCK
      ?auto_1034 - BLOCK
    )
    :vars
    (
      ?auto_1035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1033 ?auto_1034 ) ) ( ON ?auto_1033 ?auto_1035 ) ( not ( = ?auto_1033 ?auto_1035 ) ) ( not ( = ?auto_1034 ?auto_1035 ) ) ( ON ?auto_1034 ?auto_1033 ) ( CLEAR ?auto_1034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1035 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1035 ?auto_1033 )
      ( MAKE-2PILE ?auto_1033 ?auto_1034 ) )
  )

)

