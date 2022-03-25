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
      ?auto_1038 - BLOCK
      ?auto_1039 - BLOCK
    )
    :vars
    (
      ?auto_1040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1040 ?auto_1039 ) ( CLEAR ?auto_1040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1038 ) ( ON ?auto_1039 ?auto_1038 ) ( not ( = ?auto_1038 ?auto_1039 ) ) ( not ( = ?auto_1038 ?auto_1040 ) ) ( not ( = ?auto_1039 ?auto_1040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1040 ?auto_1039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1042 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1042 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1043 - BLOCK
    )
    :vars
    (
      ?auto_1044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1043 ?auto_1044 ) ( CLEAR ?auto_1043 ) ( HAND-EMPTY ) ( not ( = ?auto_1043 ?auto_1044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1043 ?auto_1044 )
      ( MAKE-1PILE ?auto_1043 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1046 - BLOCK
    )
    :vars
    (
      ?auto_1047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1047 ?auto_1046 ) ( CLEAR ?auto_1047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1046 ) ( not ( = ?auto_1046 ?auto_1047 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1047 ?auto_1046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1048 - BLOCK
    )
    :vars
    (
      ?auto_1049 - BLOCK
      ?auto_1050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1049 ?auto_1048 ) ( CLEAR ?auto_1049 ) ( ON-TABLE ?auto_1048 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( HOLDING ?auto_1050 ) ( not ( = ?auto_1048 ?auto_1050 ) ) ( not ( = ?auto_1049 ?auto_1050 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1050 )
      ( MAKE-1PILE ?auto_1048 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1051 - BLOCK
    )
    :vars
    (
      ?auto_1052 - BLOCK
      ?auto_1053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1052 ?auto_1051 ) ( ON-TABLE ?auto_1051 ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( not ( = ?auto_1051 ?auto_1053 ) ) ( not ( = ?auto_1052 ?auto_1053 ) ) ( ON ?auto_1053 ?auto_1052 ) ( CLEAR ?auto_1053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1051 ?auto_1052 )
      ( MAKE-1PILE ?auto_1051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1056 - BLOCK
      ?auto_1057 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1057 ) ( CLEAR ?auto_1056 ) ( ON-TABLE ?auto_1056 ) ( not ( = ?auto_1056 ?auto_1057 ) ) )
    :subtasks
    ( ( !STACK ?auto_1057 ?auto_1056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1058 - BLOCK
      ?auto_1059 - BLOCK
    )
    :vars
    (
      ?auto_1060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1058 ) ( ON-TABLE ?auto_1058 ) ( not ( = ?auto_1058 ?auto_1059 ) ) ( ON ?auto_1059 ?auto_1060 ) ( CLEAR ?auto_1059 ) ( HAND-EMPTY ) ( not ( = ?auto_1058 ?auto_1060 ) ) ( not ( = ?auto_1059 ?auto_1060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1059 ?auto_1060 )
      ( MAKE-2PILE ?auto_1058 ?auto_1059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1061 - BLOCK
      ?auto_1062 - BLOCK
    )
    :vars
    (
      ?auto_1063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1061 ?auto_1062 ) ) ( ON ?auto_1062 ?auto_1063 ) ( CLEAR ?auto_1062 ) ( not ( = ?auto_1061 ?auto_1063 ) ) ( not ( = ?auto_1062 ?auto_1063 ) ) ( HOLDING ?auto_1061 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1061 )
      ( MAKE-2PILE ?auto_1061 ?auto_1062 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1064 - BLOCK
      ?auto_1065 - BLOCK
    )
    :vars
    (
      ?auto_1066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1064 ?auto_1065 ) ) ( ON ?auto_1065 ?auto_1066 ) ( not ( = ?auto_1064 ?auto_1066 ) ) ( not ( = ?auto_1065 ?auto_1066 ) ) ( ON ?auto_1064 ?auto_1065 ) ( CLEAR ?auto_1064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1066 ?auto_1065 )
      ( MAKE-2PILE ?auto_1064 ?auto_1065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1083 - BLOCK
    )
    :vars
    (
      ?auto_1084 - BLOCK
      ?auto_1085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1083 ?auto_1084 ) ( CLEAR ?auto_1083 ) ( not ( = ?auto_1083 ?auto_1084 ) ) ( HOLDING ?auto_1085 ) ( not ( = ?auto_1083 ?auto_1085 ) ) ( not ( = ?auto_1084 ?auto_1085 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1085 )
      ( MAKE-1PILE ?auto_1083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1086 - BLOCK
    )
    :vars
    (
      ?auto_1087 - BLOCK
      ?auto_1088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1086 ?auto_1087 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( not ( = ?auto_1086 ?auto_1088 ) ) ( not ( = ?auto_1087 ?auto_1088 ) ) ( ON ?auto_1088 ?auto_1086 ) ( CLEAR ?auto_1088 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1087 ?auto_1086 )
      ( MAKE-1PILE ?auto_1086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1093 - BLOCK
      ?auto_1094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1093 ) ( ON-TABLE ?auto_1093 ) ( not ( = ?auto_1093 ?auto_1094 ) ) ( ON-TABLE ?auto_1094 ) ( CLEAR ?auto_1094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1094 )
      ( MAKE-2PILE ?auto_1093 ?auto_1094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1095 - BLOCK
      ?auto_1096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1095 ?auto_1096 ) ) ( ON-TABLE ?auto_1096 ) ( CLEAR ?auto_1096 ) ( HOLDING ?auto_1095 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1095 )
      ( MAKE-2PILE ?auto_1095 ?auto_1096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1097 - BLOCK
      ?auto_1098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1097 ?auto_1098 ) ) ( ON-TABLE ?auto_1098 ) ( ON ?auto_1097 ?auto_1098 ) ( CLEAR ?auto_1097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1098 )
      ( MAKE-2PILE ?auto_1097 ?auto_1098 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1101 - BLOCK
      ?auto_1102 - BLOCK
    )
    :vars
    (
      ?auto_1103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1101 ?auto_1102 ) ) ( ON-TABLE ?auto_1102 ) ( CLEAR ?auto_1102 ) ( ON ?auto_1101 ?auto_1103 ) ( CLEAR ?auto_1101 ) ( HAND-EMPTY ) ( not ( = ?auto_1101 ?auto_1103 ) ) ( not ( = ?auto_1102 ?auto_1103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1101 ?auto_1103 )
      ( MAKE-2PILE ?auto_1101 ?auto_1102 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1104 - BLOCK
      ?auto_1105 - BLOCK
    )
    :vars
    (
      ?auto_1106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1104 ?auto_1105 ) ) ( ON ?auto_1104 ?auto_1106 ) ( CLEAR ?auto_1104 ) ( not ( = ?auto_1104 ?auto_1106 ) ) ( not ( = ?auto_1105 ?auto_1106 ) ) ( HOLDING ?auto_1105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1105 )
      ( MAKE-2PILE ?auto_1104 ?auto_1105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1107 - BLOCK
      ?auto_1108 - BLOCK
    )
    :vars
    (
      ?auto_1109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1107 ?auto_1108 ) ) ( ON ?auto_1107 ?auto_1109 ) ( not ( = ?auto_1107 ?auto_1109 ) ) ( not ( = ?auto_1108 ?auto_1109 ) ) ( ON ?auto_1108 ?auto_1107 ) ( CLEAR ?auto_1108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1109 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1109 ?auto_1107 )
      ( MAKE-2PILE ?auto_1107 ?auto_1108 ) )
  )

)

