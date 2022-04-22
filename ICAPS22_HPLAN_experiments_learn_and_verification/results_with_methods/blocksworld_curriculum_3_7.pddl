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
      ?auto_1085 - BLOCK
    )
    :vars
    (
      ?auto_1086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1085 ?auto_1086 ) ( CLEAR ?auto_1085 ) ( HAND-EMPTY ) ( not ( = ?auto_1085 ?auto_1086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1085 ?auto_1086 )
      ( !PUTDOWN ?auto_1085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1088 - BLOCK
    )
    :vars
    (
      ?auto_1089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1088 ?auto_1089 ) ( CLEAR ?auto_1088 ) ( HAND-EMPTY ) ( not ( = ?auto_1088 ?auto_1089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1088 ?auto_1089 )
      ( !PUTDOWN ?auto_1088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1092 - BLOCK
      ?auto_1093 - BLOCK
    )
    :vars
    (
      ?auto_1094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1092 ) ( ON ?auto_1093 ?auto_1094 ) ( CLEAR ?auto_1093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1092 ) ( not ( = ?auto_1092 ?auto_1093 ) ) ( not ( = ?auto_1092 ?auto_1094 ) ) ( not ( = ?auto_1093 ?auto_1094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1093 ?auto_1094 )
      ( !STACK ?auto_1093 ?auto_1092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1097 - BLOCK
      ?auto_1098 - BLOCK
    )
    :vars
    (
      ?auto_1099 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1097 ) ( ON ?auto_1098 ?auto_1099 ) ( CLEAR ?auto_1098 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1097 ) ( not ( = ?auto_1097 ?auto_1098 ) ) ( not ( = ?auto_1097 ?auto_1099 ) ) ( not ( = ?auto_1098 ?auto_1099 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1098 ?auto_1099 )
      ( !STACK ?auto_1098 ?auto_1097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1102 - BLOCK
      ?auto_1103 - BLOCK
    )
    :vars
    (
      ?auto_1104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1103 ?auto_1104 ) ( not ( = ?auto_1102 ?auto_1103 ) ) ( not ( = ?auto_1102 ?auto_1104 ) ) ( not ( = ?auto_1103 ?auto_1104 ) ) ( ON ?auto_1102 ?auto_1103 ) ( CLEAR ?auto_1102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1102 )
      ( MAKE-2PILE ?auto_1102 ?auto_1103 ) )
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
    ( and ( ON ?auto_1108 ?auto_1109 ) ( not ( = ?auto_1107 ?auto_1108 ) ) ( not ( = ?auto_1107 ?auto_1109 ) ) ( not ( = ?auto_1108 ?auto_1109 ) ) ( ON ?auto_1107 ?auto_1108 ) ( CLEAR ?auto_1107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1107 )
      ( MAKE-2PILE ?auto_1107 ?auto_1108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1113 - BLOCK
      ?auto_1114 - BLOCK
      ?auto_1115 - BLOCK
    )
    :vars
    (
      ?auto_1116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1114 ) ( ON ?auto_1115 ?auto_1116 ) ( CLEAR ?auto_1115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1113 ) ( ON ?auto_1114 ?auto_1113 ) ( not ( = ?auto_1113 ?auto_1114 ) ) ( not ( = ?auto_1113 ?auto_1115 ) ) ( not ( = ?auto_1113 ?auto_1116 ) ) ( not ( = ?auto_1114 ?auto_1115 ) ) ( not ( = ?auto_1114 ?auto_1116 ) ) ( not ( = ?auto_1115 ?auto_1116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1115 ?auto_1116 )
      ( !STACK ?auto_1115 ?auto_1114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1120 - BLOCK
      ?auto_1121 - BLOCK
      ?auto_1122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1121 ) ( ON-TABLE ?auto_1122 ) ( CLEAR ?auto_1122 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1120 ) ( ON ?auto_1121 ?auto_1120 ) ( not ( = ?auto_1120 ?auto_1121 ) ) ( not ( = ?auto_1120 ?auto_1122 ) ) ( not ( = ?auto_1121 ?auto_1122 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1122 )
      ( !STACK ?auto_1122 ?auto_1121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1126 - BLOCK
      ?auto_1127 - BLOCK
      ?auto_1128 - BLOCK
    )
    :vars
    (
      ?auto_1129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1128 ?auto_1129 ) ( ON-TABLE ?auto_1126 ) ( not ( = ?auto_1126 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1128 ) ) ( not ( = ?auto_1126 ?auto_1129 ) ) ( not ( = ?auto_1127 ?auto_1128 ) ) ( not ( = ?auto_1127 ?auto_1129 ) ) ( not ( = ?auto_1128 ?auto_1129 ) ) ( CLEAR ?auto_1126 ) ( ON ?auto_1127 ?auto_1128 ) ( CLEAR ?auto_1127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1126 ?auto_1127 )
      ( MAKE-3PILE ?auto_1126 ?auto_1127 ?auto_1128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1133 - BLOCK
      ?auto_1134 - BLOCK
      ?auto_1135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1135 ) ( ON-TABLE ?auto_1133 ) ( not ( = ?auto_1133 ?auto_1134 ) ) ( not ( = ?auto_1133 ?auto_1135 ) ) ( not ( = ?auto_1134 ?auto_1135 ) ) ( CLEAR ?auto_1133 ) ( ON ?auto_1134 ?auto_1135 ) ( CLEAR ?auto_1134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1133 ?auto_1134 )
      ( MAKE-3PILE ?auto_1133 ?auto_1134 ?auto_1135 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1139 - BLOCK
      ?auto_1140 - BLOCK
      ?auto_1141 - BLOCK
    )
    :vars
    (
      ?auto_1142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1141 ?auto_1142 ) ( not ( = ?auto_1139 ?auto_1140 ) ) ( not ( = ?auto_1139 ?auto_1141 ) ) ( not ( = ?auto_1139 ?auto_1142 ) ) ( not ( = ?auto_1140 ?auto_1141 ) ) ( not ( = ?auto_1140 ?auto_1142 ) ) ( not ( = ?auto_1141 ?auto_1142 ) ) ( ON ?auto_1140 ?auto_1141 ) ( ON ?auto_1139 ?auto_1140 ) ( CLEAR ?auto_1139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1139 )
      ( MAKE-3PILE ?auto_1139 ?auto_1140 ?auto_1141 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1146 - BLOCK
      ?auto_1147 - BLOCK
      ?auto_1148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1148 ) ( not ( = ?auto_1146 ?auto_1147 ) ) ( not ( = ?auto_1146 ?auto_1148 ) ) ( not ( = ?auto_1147 ?auto_1148 ) ) ( ON ?auto_1147 ?auto_1148 ) ( ON ?auto_1146 ?auto_1147 ) ( CLEAR ?auto_1146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1146 )
      ( MAKE-3PILE ?auto_1146 ?auto_1147 ?auto_1148 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1152 - BLOCK
      ?auto_1153 - BLOCK
      ?auto_1154 - BLOCK
    )
    :vars
    (
      ?auto_1155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1152 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1154 ) ) ( not ( = ?auto_1153 ?auto_1154 ) ) ( ON ?auto_1152 ?auto_1155 ) ( not ( = ?auto_1154 ?auto_1155 ) ) ( not ( = ?auto_1153 ?auto_1155 ) ) ( not ( = ?auto_1152 ?auto_1155 ) ) ( ON ?auto_1153 ?auto_1152 ) ( ON ?auto_1154 ?auto_1153 ) ( CLEAR ?auto_1154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1154 ?auto_1153 ?auto_1152 )
      ( MAKE-3PILE ?auto_1152 ?auto_1153 ?auto_1154 ) )
  )

)

