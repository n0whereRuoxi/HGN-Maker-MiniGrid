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
      ?auto_974 - BLOCK
      ?auto_975 - BLOCK
    )
    :vars
    (
      ?auto_976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_976 ?auto_975 ) ( CLEAR ?auto_976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_974 ) ( ON ?auto_975 ?auto_974 ) ( not ( = ?auto_974 ?auto_975 ) ) ( not ( = ?auto_974 ?auto_976 ) ) ( not ( = ?auto_975 ?auto_976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_976 ?auto_975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_978 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_978 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_979 - BLOCK
    )
    :vars
    (
      ?auto_980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_979 ?auto_980 ) ( CLEAR ?auto_979 ) ( HAND-EMPTY ) ( not ( = ?auto_979 ?auto_980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_979 ?auto_980 )
      ( MAKE-1PILE ?auto_979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_982 - BLOCK
    )
    :vars
    (
      ?auto_983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_983 ?auto_982 ) ( CLEAR ?auto_983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_982 ) ( not ( = ?auto_982 ?auto_983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_983 ?auto_982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_984 - BLOCK
    )
    :vars
    (
      ?auto_985 - BLOCK
      ?auto_986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_985 ?auto_984 ) ( CLEAR ?auto_985 ) ( ON-TABLE ?auto_984 ) ( not ( = ?auto_984 ?auto_985 ) ) ( HOLDING ?auto_986 ) ( not ( = ?auto_984 ?auto_986 ) ) ( not ( = ?auto_985 ?auto_986 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_986 )
      ( MAKE-1PILE ?auto_984 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_987 - BLOCK
    )
    :vars
    (
      ?auto_989 - BLOCK
      ?auto_988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_989 ?auto_987 ) ( ON-TABLE ?auto_987 ) ( not ( = ?auto_987 ?auto_989 ) ) ( not ( = ?auto_987 ?auto_988 ) ) ( not ( = ?auto_989 ?auto_988 ) ) ( ON ?auto_988 ?auto_989 ) ( CLEAR ?auto_988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_987 ?auto_989 )
      ( MAKE-1PILE ?auto_987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_992 - BLOCK
      ?auto_993 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_993 ) ( CLEAR ?auto_992 ) ( ON-TABLE ?auto_992 ) ( not ( = ?auto_992 ?auto_993 ) ) )
    :subtasks
    ( ( !STACK ?auto_993 ?auto_992 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_994 - BLOCK
      ?auto_995 - BLOCK
    )
    :vars
    (
      ?auto_996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_994 ) ( ON-TABLE ?auto_994 ) ( not ( = ?auto_994 ?auto_995 ) ) ( ON ?auto_995 ?auto_996 ) ( CLEAR ?auto_995 ) ( HAND-EMPTY ) ( not ( = ?auto_994 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_995 ?auto_996 )
      ( MAKE-2PILE ?auto_994 ?auto_995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_997 - BLOCK
      ?auto_998 - BLOCK
    )
    :vars
    (
      ?auto_999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_997 ?auto_998 ) ) ( ON ?auto_998 ?auto_999 ) ( CLEAR ?auto_998 ) ( not ( = ?auto_997 ?auto_999 ) ) ( not ( = ?auto_998 ?auto_999 ) ) ( HOLDING ?auto_997 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_997 )
      ( MAKE-2PILE ?auto_997 ?auto_998 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1000 - BLOCK
      ?auto_1001 - BLOCK
    )
    :vars
    (
      ?auto_1002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1000 ?auto_1001 ) ) ( ON ?auto_1001 ?auto_1002 ) ( not ( = ?auto_1000 ?auto_1002 ) ) ( not ( = ?auto_1001 ?auto_1002 ) ) ( ON ?auto_1000 ?auto_1001 ) ( CLEAR ?auto_1000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1002 ?auto_1001 )
      ( MAKE-2PILE ?auto_1000 ?auto_1001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1004 - BLOCK
    )
    :vars
    (
      ?auto_1005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1005 ?auto_1004 ) ( CLEAR ?auto_1005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1004 ) ( not ( = ?auto_1004 ?auto_1005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1005 ?auto_1004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1011 - BLOCK
    )
    :vars
    (
      ?auto_1012 - BLOCK
      ?auto_1013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1011 ?auto_1012 ) ) ( ON ?auto_1012 ?auto_1013 ) ( CLEAR ?auto_1012 ) ( not ( = ?auto_1011 ?auto_1013 ) ) ( not ( = ?auto_1012 ?auto_1013 ) ) ( HOLDING ?auto_1011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1011 ?auto_1012 )
      ( MAKE-1PILE ?auto_1011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1014 - BLOCK
    )
    :vars
    (
      ?auto_1016 - BLOCK
      ?auto_1015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1014 ?auto_1016 ) ) ( ON ?auto_1016 ?auto_1015 ) ( not ( = ?auto_1014 ?auto_1015 ) ) ( not ( = ?auto_1016 ?auto_1015 ) ) ( ON ?auto_1014 ?auto_1016 ) ( CLEAR ?auto_1014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1015 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1015 ?auto_1016 )
      ( MAKE-1PILE ?auto_1014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1018 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1018 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1019 - BLOCK
    )
    :vars
    (
      ?auto_1020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1019 ?auto_1020 ) ( CLEAR ?auto_1019 ) ( HAND-EMPTY ) ( not ( = ?auto_1019 ?auto_1020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1019 ?auto_1020 )
      ( MAKE-1PILE ?auto_1019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1021 - BLOCK
    )
    :vars
    (
      ?auto_1022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1021 ?auto_1022 ) ) ( HOLDING ?auto_1021 ) ( CLEAR ?auto_1022 ) ( ON-TABLE ?auto_1022 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1022 ?auto_1021 )
      ( MAKE-1PILE ?auto_1021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1023 - BLOCK
    )
    :vars
    (
      ?auto_1024 - BLOCK
      ?auto_1025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1023 ?auto_1024 ) ) ( CLEAR ?auto_1024 ) ( ON-TABLE ?auto_1024 ) ( ON ?auto_1023 ?auto_1025 ) ( CLEAR ?auto_1023 ) ( HAND-EMPTY ) ( not ( = ?auto_1023 ?auto_1025 ) ) ( not ( = ?auto_1024 ?auto_1025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1023 ?auto_1025 )
      ( MAKE-1PILE ?auto_1023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1026 - BLOCK
    )
    :vars
    (
      ?auto_1028 - BLOCK
      ?auto_1027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1026 ?auto_1028 ) ) ( ON ?auto_1026 ?auto_1027 ) ( CLEAR ?auto_1026 ) ( not ( = ?auto_1026 ?auto_1027 ) ) ( not ( = ?auto_1028 ?auto_1027 ) ) ( HOLDING ?auto_1028 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1028 )
      ( MAKE-1PILE ?auto_1026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1029 - BLOCK
    )
    :vars
    (
      ?auto_1030 - BLOCK
      ?auto_1031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1029 ?auto_1030 ) ) ( ON ?auto_1029 ?auto_1031 ) ( not ( = ?auto_1029 ?auto_1031 ) ) ( not ( = ?auto_1030 ?auto_1031 ) ) ( ON ?auto_1030 ?auto_1029 ) ( CLEAR ?auto_1030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1031 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1031 ?auto_1029 )
      ( MAKE-1PILE ?auto_1029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1034 - BLOCK
      ?auto_1035 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1035 ) ( CLEAR ?auto_1034 ) ( ON-TABLE ?auto_1034 ) ( not ( = ?auto_1034 ?auto_1035 ) ) )
    :subtasks
    ( ( !STACK ?auto_1035 ?auto_1034 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1036 - BLOCK
      ?auto_1037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1036 ) ( ON-TABLE ?auto_1036 ) ( not ( = ?auto_1036 ?auto_1037 ) ) ( ON-TABLE ?auto_1037 ) ( CLEAR ?auto_1037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1037 )
      ( MAKE-2PILE ?auto_1036 ?auto_1037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1038 - BLOCK
      ?auto_1039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1038 ?auto_1039 ) ) ( ON-TABLE ?auto_1039 ) ( CLEAR ?auto_1039 ) ( HOLDING ?auto_1038 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1038 )
      ( MAKE-2PILE ?auto_1038 ?auto_1039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1040 - BLOCK
      ?auto_1041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1040 ?auto_1041 ) ) ( ON-TABLE ?auto_1041 ) ( ON ?auto_1040 ?auto_1041 ) ( CLEAR ?auto_1040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1041 )
      ( MAKE-2PILE ?auto_1040 ?auto_1041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1042 - BLOCK
      ?auto_1043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1042 ?auto_1043 ) ) ( ON-TABLE ?auto_1043 ) ( HOLDING ?auto_1042 ) ( CLEAR ?auto_1043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1043 ?auto_1042 )
      ( MAKE-2PILE ?auto_1042 ?auto_1043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1044 - BLOCK
      ?auto_1045 - BLOCK
    )
    :vars
    (
      ?auto_1046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1044 ?auto_1045 ) ) ( ON-TABLE ?auto_1045 ) ( CLEAR ?auto_1045 ) ( ON ?auto_1044 ?auto_1046 ) ( CLEAR ?auto_1044 ) ( HAND-EMPTY ) ( not ( = ?auto_1044 ?auto_1046 ) ) ( not ( = ?auto_1045 ?auto_1046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1044 ?auto_1046 )
      ( MAKE-2PILE ?auto_1044 ?auto_1045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1047 - BLOCK
      ?auto_1048 - BLOCK
    )
    :vars
    (
      ?auto_1049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1047 ?auto_1048 ) ) ( ON ?auto_1047 ?auto_1049 ) ( CLEAR ?auto_1047 ) ( not ( = ?auto_1047 ?auto_1049 ) ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( HOLDING ?auto_1048 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1048 )
      ( MAKE-2PILE ?auto_1047 ?auto_1048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1050 - BLOCK
      ?auto_1051 - BLOCK
    )
    :vars
    (
      ?auto_1052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1050 ?auto_1051 ) ) ( ON ?auto_1050 ?auto_1052 ) ( not ( = ?auto_1050 ?auto_1052 ) ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( ON ?auto_1051 ?auto_1050 ) ( CLEAR ?auto_1051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1052 ?auto_1050 )
      ( MAKE-2PILE ?auto_1050 ?auto_1051 ) )
  )

)

