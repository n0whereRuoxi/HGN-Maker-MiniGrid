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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35077 - BLOCK
      ?auto_35078 - BLOCK
      ?auto_35079 - BLOCK
      ?auto_35080 - BLOCK
      ?auto_35081 - BLOCK
    )
    :vars
    (
      ?auto_35082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35082 ?auto_35081 ) ( CLEAR ?auto_35082 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35077 ) ( ON ?auto_35078 ?auto_35077 ) ( ON ?auto_35079 ?auto_35078 ) ( ON ?auto_35080 ?auto_35079 ) ( ON ?auto_35081 ?auto_35080 ) ( not ( = ?auto_35077 ?auto_35078 ) ) ( not ( = ?auto_35077 ?auto_35079 ) ) ( not ( = ?auto_35077 ?auto_35080 ) ) ( not ( = ?auto_35077 ?auto_35081 ) ) ( not ( = ?auto_35077 ?auto_35082 ) ) ( not ( = ?auto_35078 ?auto_35079 ) ) ( not ( = ?auto_35078 ?auto_35080 ) ) ( not ( = ?auto_35078 ?auto_35081 ) ) ( not ( = ?auto_35078 ?auto_35082 ) ) ( not ( = ?auto_35079 ?auto_35080 ) ) ( not ( = ?auto_35079 ?auto_35081 ) ) ( not ( = ?auto_35079 ?auto_35082 ) ) ( not ( = ?auto_35080 ?auto_35081 ) ) ( not ( = ?auto_35080 ?auto_35082 ) ) ( not ( = ?auto_35081 ?auto_35082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35082 ?auto_35081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35084 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35084 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_35084 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35085 - BLOCK
    )
    :vars
    (
      ?auto_35086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35085 ?auto_35086 ) ( CLEAR ?auto_35085 ) ( HAND-EMPTY ) ( not ( = ?auto_35085 ?auto_35086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35085 ?auto_35086 )
      ( MAKE-1PILE ?auto_35085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35091 - BLOCK
      ?auto_35092 - BLOCK
      ?auto_35093 - BLOCK
      ?auto_35094 - BLOCK
    )
    :vars
    (
      ?auto_35095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35095 ?auto_35094 ) ( CLEAR ?auto_35095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35091 ) ( ON ?auto_35092 ?auto_35091 ) ( ON ?auto_35093 ?auto_35092 ) ( ON ?auto_35094 ?auto_35093 ) ( not ( = ?auto_35091 ?auto_35092 ) ) ( not ( = ?auto_35091 ?auto_35093 ) ) ( not ( = ?auto_35091 ?auto_35094 ) ) ( not ( = ?auto_35091 ?auto_35095 ) ) ( not ( = ?auto_35092 ?auto_35093 ) ) ( not ( = ?auto_35092 ?auto_35094 ) ) ( not ( = ?auto_35092 ?auto_35095 ) ) ( not ( = ?auto_35093 ?auto_35094 ) ) ( not ( = ?auto_35093 ?auto_35095 ) ) ( not ( = ?auto_35094 ?auto_35095 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35095 ?auto_35094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35096 - BLOCK
      ?auto_35097 - BLOCK
      ?auto_35098 - BLOCK
      ?auto_35099 - BLOCK
    )
    :vars
    (
      ?auto_35100 - BLOCK
      ?auto_35101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35100 ?auto_35099 ) ( CLEAR ?auto_35100 ) ( ON-TABLE ?auto_35096 ) ( ON ?auto_35097 ?auto_35096 ) ( ON ?auto_35098 ?auto_35097 ) ( ON ?auto_35099 ?auto_35098 ) ( not ( = ?auto_35096 ?auto_35097 ) ) ( not ( = ?auto_35096 ?auto_35098 ) ) ( not ( = ?auto_35096 ?auto_35099 ) ) ( not ( = ?auto_35096 ?auto_35100 ) ) ( not ( = ?auto_35097 ?auto_35098 ) ) ( not ( = ?auto_35097 ?auto_35099 ) ) ( not ( = ?auto_35097 ?auto_35100 ) ) ( not ( = ?auto_35098 ?auto_35099 ) ) ( not ( = ?auto_35098 ?auto_35100 ) ) ( not ( = ?auto_35099 ?auto_35100 ) ) ( HOLDING ?auto_35101 ) ( not ( = ?auto_35096 ?auto_35101 ) ) ( not ( = ?auto_35097 ?auto_35101 ) ) ( not ( = ?auto_35098 ?auto_35101 ) ) ( not ( = ?auto_35099 ?auto_35101 ) ) ( not ( = ?auto_35100 ?auto_35101 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_35101 )
      ( MAKE-4PILE ?auto_35096 ?auto_35097 ?auto_35098 ?auto_35099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35102 - BLOCK
      ?auto_35103 - BLOCK
      ?auto_35104 - BLOCK
      ?auto_35105 - BLOCK
    )
    :vars
    (
      ?auto_35107 - BLOCK
      ?auto_35106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35107 ?auto_35105 ) ( ON-TABLE ?auto_35102 ) ( ON ?auto_35103 ?auto_35102 ) ( ON ?auto_35104 ?auto_35103 ) ( ON ?auto_35105 ?auto_35104 ) ( not ( = ?auto_35102 ?auto_35103 ) ) ( not ( = ?auto_35102 ?auto_35104 ) ) ( not ( = ?auto_35102 ?auto_35105 ) ) ( not ( = ?auto_35102 ?auto_35107 ) ) ( not ( = ?auto_35103 ?auto_35104 ) ) ( not ( = ?auto_35103 ?auto_35105 ) ) ( not ( = ?auto_35103 ?auto_35107 ) ) ( not ( = ?auto_35104 ?auto_35105 ) ) ( not ( = ?auto_35104 ?auto_35107 ) ) ( not ( = ?auto_35105 ?auto_35107 ) ) ( not ( = ?auto_35102 ?auto_35106 ) ) ( not ( = ?auto_35103 ?auto_35106 ) ) ( not ( = ?auto_35104 ?auto_35106 ) ) ( not ( = ?auto_35105 ?auto_35106 ) ) ( not ( = ?auto_35107 ?auto_35106 ) ) ( ON ?auto_35106 ?auto_35107 ) ( CLEAR ?auto_35106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35102 ?auto_35103 ?auto_35104 ?auto_35105 ?auto_35107 )
      ( MAKE-4PILE ?auto_35102 ?auto_35103 ?auto_35104 ?auto_35105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35110 - BLOCK
      ?auto_35111 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35111 ) ( CLEAR ?auto_35110 ) ( ON-TABLE ?auto_35110 ) ( not ( = ?auto_35110 ?auto_35111 ) ) )
    :subtasks
    ( ( !STACK ?auto_35111 ?auto_35110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35112 - BLOCK
      ?auto_35113 - BLOCK
    )
    :vars
    (
      ?auto_35114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35112 ) ( ON-TABLE ?auto_35112 ) ( not ( = ?auto_35112 ?auto_35113 ) ) ( ON ?auto_35113 ?auto_35114 ) ( CLEAR ?auto_35113 ) ( HAND-EMPTY ) ( not ( = ?auto_35112 ?auto_35114 ) ) ( not ( = ?auto_35113 ?auto_35114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35113 ?auto_35114 )
      ( MAKE-2PILE ?auto_35112 ?auto_35113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35115 - BLOCK
      ?auto_35116 - BLOCK
    )
    :vars
    (
      ?auto_35117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35115 ?auto_35116 ) ) ( ON ?auto_35116 ?auto_35117 ) ( CLEAR ?auto_35116 ) ( not ( = ?auto_35115 ?auto_35117 ) ) ( not ( = ?auto_35116 ?auto_35117 ) ) ( HOLDING ?auto_35115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35115 )
      ( MAKE-2PILE ?auto_35115 ?auto_35116 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35118 - BLOCK
      ?auto_35119 - BLOCK
    )
    :vars
    (
      ?auto_35120 - BLOCK
      ?auto_35121 - BLOCK
      ?auto_35123 - BLOCK
      ?auto_35122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35118 ?auto_35119 ) ) ( ON ?auto_35119 ?auto_35120 ) ( not ( = ?auto_35118 ?auto_35120 ) ) ( not ( = ?auto_35119 ?auto_35120 ) ) ( ON ?auto_35118 ?auto_35119 ) ( CLEAR ?auto_35118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35121 ) ( ON ?auto_35123 ?auto_35121 ) ( ON ?auto_35122 ?auto_35123 ) ( ON ?auto_35120 ?auto_35122 ) ( not ( = ?auto_35121 ?auto_35123 ) ) ( not ( = ?auto_35121 ?auto_35122 ) ) ( not ( = ?auto_35121 ?auto_35120 ) ) ( not ( = ?auto_35121 ?auto_35119 ) ) ( not ( = ?auto_35121 ?auto_35118 ) ) ( not ( = ?auto_35123 ?auto_35122 ) ) ( not ( = ?auto_35123 ?auto_35120 ) ) ( not ( = ?auto_35123 ?auto_35119 ) ) ( not ( = ?auto_35123 ?auto_35118 ) ) ( not ( = ?auto_35122 ?auto_35120 ) ) ( not ( = ?auto_35122 ?auto_35119 ) ) ( not ( = ?auto_35122 ?auto_35118 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35121 ?auto_35123 ?auto_35122 ?auto_35120 ?auto_35119 )
      ( MAKE-2PILE ?auto_35118 ?auto_35119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35127 - BLOCK
      ?auto_35128 - BLOCK
      ?auto_35129 - BLOCK
    )
    :vars
    (
      ?auto_35130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35130 ?auto_35129 ) ( CLEAR ?auto_35130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35127 ) ( ON ?auto_35128 ?auto_35127 ) ( ON ?auto_35129 ?auto_35128 ) ( not ( = ?auto_35127 ?auto_35128 ) ) ( not ( = ?auto_35127 ?auto_35129 ) ) ( not ( = ?auto_35127 ?auto_35130 ) ) ( not ( = ?auto_35128 ?auto_35129 ) ) ( not ( = ?auto_35128 ?auto_35130 ) ) ( not ( = ?auto_35129 ?auto_35130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35130 ?auto_35129 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35131 - BLOCK
      ?auto_35132 - BLOCK
      ?auto_35133 - BLOCK
    )
    :vars
    (
      ?auto_35134 - BLOCK
      ?auto_35135 - BLOCK
      ?auto_35136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35134 ?auto_35133 ) ( CLEAR ?auto_35134 ) ( ON-TABLE ?auto_35131 ) ( ON ?auto_35132 ?auto_35131 ) ( ON ?auto_35133 ?auto_35132 ) ( not ( = ?auto_35131 ?auto_35132 ) ) ( not ( = ?auto_35131 ?auto_35133 ) ) ( not ( = ?auto_35131 ?auto_35134 ) ) ( not ( = ?auto_35132 ?auto_35133 ) ) ( not ( = ?auto_35132 ?auto_35134 ) ) ( not ( = ?auto_35133 ?auto_35134 ) ) ( HOLDING ?auto_35135 ) ( CLEAR ?auto_35136 ) ( not ( = ?auto_35131 ?auto_35135 ) ) ( not ( = ?auto_35131 ?auto_35136 ) ) ( not ( = ?auto_35132 ?auto_35135 ) ) ( not ( = ?auto_35132 ?auto_35136 ) ) ( not ( = ?auto_35133 ?auto_35135 ) ) ( not ( = ?auto_35133 ?auto_35136 ) ) ( not ( = ?auto_35134 ?auto_35135 ) ) ( not ( = ?auto_35134 ?auto_35136 ) ) ( not ( = ?auto_35135 ?auto_35136 ) ) )
    :subtasks
    ( ( !STACK ?auto_35135 ?auto_35136 )
      ( MAKE-3PILE ?auto_35131 ?auto_35132 ?auto_35133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35137 - BLOCK
      ?auto_35138 - BLOCK
      ?auto_35139 - BLOCK
    )
    :vars
    (
      ?auto_35141 - BLOCK
      ?auto_35140 - BLOCK
      ?auto_35142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35141 ?auto_35139 ) ( ON-TABLE ?auto_35137 ) ( ON ?auto_35138 ?auto_35137 ) ( ON ?auto_35139 ?auto_35138 ) ( not ( = ?auto_35137 ?auto_35138 ) ) ( not ( = ?auto_35137 ?auto_35139 ) ) ( not ( = ?auto_35137 ?auto_35141 ) ) ( not ( = ?auto_35138 ?auto_35139 ) ) ( not ( = ?auto_35138 ?auto_35141 ) ) ( not ( = ?auto_35139 ?auto_35141 ) ) ( CLEAR ?auto_35140 ) ( not ( = ?auto_35137 ?auto_35142 ) ) ( not ( = ?auto_35137 ?auto_35140 ) ) ( not ( = ?auto_35138 ?auto_35142 ) ) ( not ( = ?auto_35138 ?auto_35140 ) ) ( not ( = ?auto_35139 ?auto_35142 ) ) ( not ( = ?auto_35139 ?auto_35140 ) ) ( not ( = ?auto_35141 ?auto_35142 ) ) ( not ( = ?auto_35141 ?auto_35140 ) ) ( not ( = ?auto_35142 ?auto_35140 ) ) ( ON ?auto_35142 ?auto_35141 ) ( CLEAR ?auto_35142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35137 ?auto_35138 ?auto_35139 ?auto_35141 )
      ( MAKE-3PILE ?auto_35137 ?auto_35138 ?auto_35139 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35143 - BLOCK
      ?auto_35144 - BLOCK
      ?auto_35145 - BLOCK
    )
    :vars
    (
      ?auto_35148 - BLOCK
      ?auto_35147 - BLOCK
      ?auto_35146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35148 ?auto_35145 ) ( ON-TABLE ?auto_35143 ) ( ON ?auto_35144 ?auto_35143 ) ( ON ?auto_35145 ?auto_35144 ) ( not ( = ?auto_35143 ?auto_35144 ) ) ( not ( = ?auto_35143 ?auto_35145 ) ) ( not ( = ?auto_35143 ?auto_35148 ) ) ( not ( = ?auto_35144 ?auto_35145 ) ) ( not ( = ?auto_35144 ?auto_35148 ) ) ( not ( = ?auto_35145 ?auto_35148 ) ) ( not ( = ?auto_35143 ?auto_35147 ) ) ( not ( = ?auto_35143 ?auto_35146 ) ) ( not ( = ?auto_35144 ?auto_35147 ) ) ( not ( = ?auto_35144 ?auto_35146 ) ) ( not ( = ?auto_35145 ?auto_35147 ) ) ( not ( = ?auto_35145 ?auto_35146 ) ) ( not ( = ?auto_35148 ?auto_35147 ) ) ( not ( = ?auto_35148 ?auto_35146 ) ) ( not ( = ?auto_35147 ?auto_35146 ) ) ( ON ?auto_35147 ?auto_35148 ) ( CLEAR ?auto_35147 ) ( HOLDING ?auto_35146 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35146 )
      ( MAKE-3PILE ?auto_35143 ?auto_35144 ?auto_35145 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35149 - BLOCK
      ?auto_35150 - BLOCK
      ?auto_35151 - BLOCK
    )
    :vars
    (
      ?auto_35152 - BLOCK
      ?auto_35154 - BLOCK
      ?auto_35153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35152 ?auto_35151 ) ( ON-TABLE ?auto_35149 ) ( ON ?auto_35150 ?auto_35149 ) ( ON ?auto_35151 ?auto_35150 ) ( not ( = ?auto_35149 ?auto_35150 ) ) ( not ( = ?auto_35149 ?auto_35151 ) ) ( not ( = ?auto_35149 ?auto_35152 ) ) ( not ( = ?auto_35150 ?auto_35151 ) ) ( not ( = ?auto_35150 ?auto_35152 ) ) ( not ( = ?auto_35151 ?auto_35152 ) ) ( not ( = ?auto_35149 ?auto_35154 ) ) ( not ( = ?auto_35149 ?auto_35153 ) ) ( not ( = ?auto_35150 ?auto_35154 ) ) ( not ( = ?auto_35150 ?auto_35153 ) ) ( not ( = ?auto_35151 ?auto_35154 ) ) ( not ( = ?auto_35151 ?auto_35153 ) ) ( not ( = ?auto_35152 ?auto_35154 ) ) ( not ( = ?auto_35152 ?auto_35153 ) ) ( not ( = ?auto_35154 ?auto_35153 ) ) ( ON ?auto_35154 ?auto_35152 ) ( ON ?auto_35153 ?auto_35154 ) ( CLEAR ?auto_35153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35149 ?auto_35150 ?auto_35151 ?auto_35152 ?auto_35154 )
      ( MAKE-3PILE ?auto_35149 ?auto_35150 ?auto_35151 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35158 - BLOCK
      ?auto_35159 - BLOCK
      ?auto_35160 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35160 ) ( CLEAR ?auto_35159 ) ( ON-TABLE ?auto_35158 ) ( ON ?auto_35159 ?auto_35158 ) ( not ( = ?auto_35158 ?auto_35159 ) ) ( not ( = ?auto_35158 ?auto_35160 ) ) ( not ( = ?auto_35159 ?auto_35160 ) ) )
    :subtasks
    ( ( !STACK ?auto_35160 ?auto_35159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35161 - BLOCK
      ?auto_35162 - BLOCK
      ?auto_35163 - BLOCK
    )
    :vars
    (
      ?auto_35164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35162 ) ( ON-TABLE ?auto_35161 ) ( ON ?auto_35162 ?auto_35161 ) ( not ( = ?auto_35161 ?auto_35162 ) ) ( not ( = ?auto_35161 ?auto_35163 ) ) ( not ( = ?auto_35162 ?auto_35163 ) ) ( ON ?auto_35163 ?auto_35164 ) ( CLEAR ?auto_35163 ) ( HAND-EMPTY ) ( not ( = ?auto_35161 ?auto_35164 ) ) ( not ( = ?auto_35162 ?auto_35164 ) ) ( not ( = ?auto_35163 ?auto_35164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35163 ?auto_35164 )
      ( MAKE-3PILE ?auto_35161 ?auto_35162 ?auto_35163 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35165 - BLOCK
      ?auto_35166 - BLOCK
      ?auto_35167 - BLOCK
    )
    :vars
    (
      ?auto_35168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35165 ) ( not ( = ?auto_35165 ?auto_35166 ) ) ( not ( = ?auto_35165 ?auto_35167 ) ) ( not ( = ?auto_35166 ?auto_35167 ) ) ( ON ?auto_35167 ?auto_35168 ) ( CLEAR ?auto_35167 ) ( not ( = ?auto_35165 ?auto_35168 ) ) ( not ( = ?auto_35166 ?auto_35168 ) ) ( not ( = ?auto_35167 ?auto_35168 ) ) ( HOLDING ?auto_35166 ) ( CLEAR ?auto_35165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35165 ?auto_35166 )
      ( MAKE-3PILE ?auto_35165 ?auto_35166 ?auto_35167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35169 - BLOCK
      ?auto_35170 - BLOCK
      ?auto_35171 - BLOCK
    )
    :vars
    (
      ?auto_35172 - BLOCK
      ?auto_35173 - BLOCK
      ?auto_35174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35169 ) ( not ( = ?auto_35169 ?auto_35170 ) ) ( not ( = ?auto_35169 ?auto_35171 ) ) ( not ( = ?auto_35170 ?auto_35171 ) ) ( ON ?auto_35171 ?auto_35172 ) ( not ( = ?auto_35169 ?auto_35172 ) ) ( not ( = ?auto_35170 ?auto_35172 ) ) ( not ( = ?auto_35171 ?auto_35172 ) ) ( CLEAR ?auto_35169 ) ( ON ?auto_35170 ?auto_35171 ) ( CLEAR ?auto_35170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35173 ) ( ON ?auto_35174 ?auto_35173 ) ( ON ?auto_35172 ?auto_35174 ) ( not ( = ?auto_35173 ?auto_35174 ) ) ( not ( = ?auto_35173 ?auto_35172 ) ) ( not ( = ?auto_35173 ?auto_35171 ) ) ( not ( = ?auto_35173 ?auto_35170 ) ) ( not ( = ?auto_35174 ?auto_35172 ) ) ( not ( = ?auto_35174 ?auto_35171 ) ) ( not ( = ?auto_35174 ?auto_35170 ) ) ( not ( = ?auto_35169 ?auto_35173 ) ) ( not ( = ?auto_35169 ?auto_35174 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35173 ?auto_35174 ?auto_35172 ?auto_35171 )
      ( MAKE-3PILE ?auto_35169 ?auto_35170 ?auto_35171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35175 - BLOCK
      ?auto_35176 - BLOCK
      ?auto_35177 - BLOCK
    )
    :vars
    (
      ?auto_35180 - BLOCK
      ?auto_35178 - BLOCK
      ?auto_35179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35175 ?auto_35176 ) ) ( not ( = ?auto_35175 ?auto_35177 ) ) ( not ( = ?auto_35176 ?auto_35177 ) ) ( ON ?auto_35177 ?auto_35180 ) ( not ( = ?auto_35175 ?auto_35180 ) ) ( not ( = ?auto_35176 ?auto_35180 ) ) ( not ( = ?auto_35177 ?auto_35180 ) ) ( ON ?auto_35176 ?auto_35177 ) ( CLEAR ?auto_35176 ) ( ON-TABLE ?auto_35178 ) ( ON ?auto_35179 ?auto_35178 ) ( ON ?auto_35180 ?auto_35179 ) ( not ( = ?auto_35178 ?auto_35179 ) ) ( not ( = ?auto_35178 ?auto_35180 ) ) ( not ( = ?auto_35178 ?auto_35177 ) ) ( not ( = ?auto_35178 ?auto_35176 ) ) ( not ( = ?auto_35179 ?auto_35180 ) ) ( not ( = ?auto_35179 ?auto_35177 ) ) ( not ( = ?auto_35179 ?auto_35176 ) ) ( not ( = ?auto_35175 ?auto_35178 ) ) ( not ( = ?auto_35175 ?auto_35179 ) ) ( HOLDING ?auto_35175 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35175 )
      ( MAKE-3PILE ?auto_35175 ?auto_35176 ?auto_35177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35181 - BLOCK
      ?auto_35182 - BLOCK
      ?auto_35183 - BLOCK
    )
    :vars
    (
      ?auto_35185 - BLOCK
      ?auto_35186 - BLOCK
      ?auto_35184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35181 ?auto_35182 ) ) ( not ( = ?auto_35181 ?auto_35183 ) ) ( not ( = ?auto_35182 ?auto_35183 ) ) ( ON ?auto_35183 ?auto_35185 ) ( not ( = ?auto_35181 ?auto_35185 ) ) ( not ( = ?auto_35182 ?auto_35185 ) ) ( not ( = ?auto_35183 ?auto_35185 ) ) ( ON ?auto_35182 ?auto_35183 ) ( ON-TABLE ?auto_35186 ) ( ON ?auto_35184 ?auto_35186 ) ( ON ?auto_35185 ?auto_35184 ) ( not ( = ?auto_35186 ?auto_35184 ) ) ( not ( = ?auto_35186 ?auto_35185 ) ) ( not ( = ?auto_35186 ?auto_35183 ) ) ( not ( = ?auto_35186 ?auto_35182 ) ) ( not ( = ?auto_35184 ?auto_35185 ) ) ( not ( = ?auto_35184 ?auto_35183 ) ) ( not ( = ?auto_35184 ?auto_35182 ) ) ( not ( = ?auto_35181 ?auto_35186 ) ) ( not ( = ?auto_35181 ?auto_35184 ) ) ( ON ?auto_35181 ?auto_35182 ) ( CLEAR ?auto_35181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35186 ?auto_35184 ?auto_35185 ?auto_35183 ?auto_35182 )
      ( MAKE-3PILE ?auto_35181 ?auto_35182 ?auto_35183 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35189 - BLOCK
      ?auto_35190 - BLOCK
    )
    :vars
    (
      ?auto_35191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35191 ?auto_35190 ) ( CLEAR ?auto_35191 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35189 ) ( ON ?auto_35190 ?auto_35189 ) ( not ( = ?auto_35189 ?auto_35190 ) ) ( not ( = ?auto_35189 ?auto_35191 ) ) ( not ( = ?auto_35190 ?auto_35191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35191 ?auto_35190 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35192 - BLOCK
      ?auto_35193 - BLOCK
    )
    :vars
    (
      ?auto_35194 - BLOCK
      ?auto_35195 - BLOCK
      ?auto_35196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35194 ?auto_35193 ) ( CLEAR ?auto_35194 ) ( ON-TABLE ?auto_35192 ) ( ON ?auto_35193 ?auto_35192 ) ( not ( = ?auto_35192 ?auto_35193 ) ) ( not ( = ?auto_35192 ?auto_35194 ) ) ( not ( = ?auto_35193 ?auto_35194 ) ) ( HOLDING ?auto_35195 ) ( CLEAR ?auto_35196 ) ( not ( = ?auto_35192 ?auto_35195 ) ) ( not ( = ?auto_35192 ?auto_35196 ) ) ( not ( = ?auto_35193 ?auto_35195 ) ) ( not ( = ?auto_35193 ?auto_35196 ) ) ( not ( = ?auto_35194 ?auto_35195 ) ) ( not ( = ?auto_35194 ?auto_35196 ) ) ( not ( = ?auto_35195 ?auto_35196 ) ) )
    :subtasks
    ( ( !STACK ?auto_35195 ?auto_35196 )
      ( MAKE-2PILE ?auto_35192 ?auto_35193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35197 - BLOCK
      ?auto_35198 - BLOCK
    )
    :vars
    (
      ?auto_35201 - BLOCK
      ?auto_35200 - BLOCK
      ?auto_35199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35201 ?auto_35198 ) ( ON-TABLE ?auto_35197 ) ( ON ?auto_35198 ?auto_35197 ) ( not ( = ?auto_35197 ?auto_35198 ) ) ( not ( = ?auto_35197 ?auto_35201 ) ) ( not ( = ?auto_35198 ?auto_35201 ) ) ( CLEAR ?auto_35200 ) ( not ( = ?auto_35197 ?auto_35199 ) ) ( not ( = ?auto_35197 ?auto_35200 ) ) ( not ( = ?auto_35198 ?auto_35199 ) ) ( not ( = ?auto_35198 ?auto_35200 ) ) ( not ( = ?auto_35201 ?auto_35199 ) ) ( not ( = ?auto_35201 ?auto_35200 ) ) ( not ( = ?auto_35199 ?auto_35200 ) ) ( ON ?auto_35199 ?auto_35201 ) ( CLEAR ?auto_35199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35197 ?auto_35198 ?auto_35201 )
      ( MAKE-2PILE ?auto_35197 ?auto_35198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35202 - BLOCK
      ?auto_35203 - BLOCK
    )
    :vars
    (
      ?auto_35204 - BLOCK
      ?auto_35205 - BLOCK
      ?auto_35206 - BLOCK
      ?auto_35207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35204 ?auto_35203 ) ( ON-TABLE ?auto_35202 ) ( ON ?auto_35203 ?auto_35202 ) ( not ( = ?auto_35202 ?auto_35203 ) ) ( not ( = ?auto_35202 ?auto_35204 ) ) ( not ( = ?auto_35203 ?auto_35204 ) ) ( not ( = ?auto_35202 ?auto_35205 ) ) ( not ( = ?auto_35202 ?auto_35206 ) ) ( not ( = ?auto_35203 ?auto_35205 ) ) ( not ( = ?auto_35203 ?auto_35206 ) ) ( not ( = ?auto_35204 ?auto_35205 ) ) ( not ( = ?auto_35204 ?auto_35206 ) ) ( not ( = ?auto_35205 ?auto_35206 ) ) ( ON ?auto_35205 ?auto_35204 ) ( CLEAR ?auto_35205 ) ( HOLDING ?auto_35206 ) ( CLEAR ?auto_35207 ) ( ON-TABLE ?auto_35207 ) ( not ( = ?auto_35207 ?auto_35206 ) ) ( not ( = ?auto_35202 ?auto_35207 ) ) ( not ( = ?auto_35203 ?auto_35207 ) ) ( not ( = ?auto_35204 ?auto_35207 ) ) ( not ( = ?auto_35205 ?auto_35207 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35207 ?auto_35206 )
      ( MAKE-2PILE ?auto_35202 ?auto_35203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35208 - BLOCK
      ?auto_35209 - BLOCK
    )
    :vars
    (
      ?auto_35212 - BLOCK
      ?auto_35213 - BLOCK
      ?auto_35211 - BLOCK
      ?auto_35210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35212 ?auto_35209 ) ( ON-TABLE ?auto_35208 ) ( ON ?auto_35209 ?auto_35208 ) ( not ( = ?auto_35208 ?auto_35209 ) ) ( not ( = ?auto_35208 ?auto_35212 ) ) ( not ( = ?auto_35209 ?auto_35212 ) ) ( not ( = ?auto_35208 ?auto_35213 ) ) ( not ( = ?auto_35208 ?auto_35211 ) ) ( not ( = ?auto_35209 ?auto_35213 ) ) ( not ( = ?auto_35209 ?auto_35211 ) ) ( not ( = ?auto_35212 ?auto_35213 ) ) ( not ( = ?auto_35212 ?auto_35211 ) ) ( not ( = ?auto_35213 ?auto_35211 ) ) ( ON ?auto_35213 ?auto_35212 ) ( CLEAR ?auto_35210 ) ( ON-TABLE ?auto_35210 ) ( not ( = ?auto_35210 ?auto_35211 ) ) ( not ( = ?auto_35208 ?auto_35210 ) ) ( not ( = ?auto_35209 ?auto_35210 ) ) ( not ( = ?auto_35212 ?auto_35210 ) ) ( not ( = ?auto_35213 ?auto_35210 ) ) ( ON ?auto_35211 ?auto_35213 ) ( CLEAR ?auto_35211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35208 ?auto_35209 ?auto_35212 ?auto_35213 )
      ( MAKE-2PILE ?auto_35208 ?auto_35209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35214 - BLOCK
      ?auto_35215 - BLOCK
    )
    :vars
    (
      ?auto_35219 - BLOCK
      ?auto_35217 - BLOCK
      ?auto_35216 - BLOCK
      ?auto_35218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35219 ?auto_35215 ) ( ON-TABLE ?auto_35214 ) ( ON ?auto_35215 ?auto_35214 ) ( not ( = ?auto_35214 ?auto_35215 ) ) ( not ( = ?auto_35214 ?auto_35219 ) ) ( not ( = ?auto_35215 ?auto_35219 ) ) ( not ( = ?auto_35214 ?auto_35217 ) ) ( not ( = ?auto_35214 ?auto_35216 ) ) ( not ( = ?auto_35215 ?auto_35217 ) ) ( not ( = ?auto_35215 ?auto_35216 ) ) ( not ( = ?auto_35219 ?auto_35217 ) ) ( not ( = ?auto_35219 ?auto_35216 ) ) ( not ( = ?auto_35217 ?auto_35216 ) ) ( ON ?auto_35217 ?auto_35219 ) ( not ( = ?auto_35218 ?auto_35216 ) ) ( not ( = ?auto_35214 ?auto_35218 ) ) ( not ( = ?auto_35215 ?auto_35218 ) ) ( not ( = ?auto_35219 ?auto_35218 ) ) ( not ( = ?auto_35217 ?auto_35218 ) ) ( ON ?auto_35216 ?auto_35217 ) ( CLEAR ?auto_35216 ) ( HOLDING ?auto_35218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35218 )
      ( MAKE-2PILE ?auto_35214 ?auto_35215 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35220 - BLOCK
      ?auto_35221 - BLOCK
    )
    :vars
    (
      ?auto_35224 - BLOCK
      ?auto_35222 - BLOCK
      ?auto_35225 - BLOCK
      ?auto_35223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35224 ?auto_35221 ) ( ON-TABLE ?auto_35220 ) ( ON ?auto_35221 ?auto_35220 ) ( not ( = ?auto_35220 ?auto_35221 ) ) ( not ( = ?auto_35220 ?auto_35224 ) ) ( not ( = ?auto_35221 ?auto_35224 ) ) ( not ( = ?auto_35220 ?auto_35222 ) ) ( not ( = ?auto_35220 ?auto_35225 ) ) ( not ( = ?auto_35221 ?auto_35222 ) ) ( not ( = ?auto_35221 ?auto_35225 ) ) ( not ( = ?auto_35224 ?auto_35222 ) ) ( not ( = ?auto_35224 ?auto_35225 ) ) ( not ( = ?auto_35222 ?auto_35225 ) ) ( ON ?auto_35222 ?auto_35224 ) ( not ( = ?auto_35223 ?auto_35225 ) ) ( not ( = ?auto_35220 ?auto_35223 ) ) ( not ( = ?auto_35221 ?auto_35223 ) ) ( not ( = ?auto_35224 ?auto_35223 ) ) ( not ( = ?auto_35222 ?auto_35223 ) ) ( ON ?auto_35225 ?auto_35222 ) ( ON ?auto_35223 ?auto_35225 ) ( CLEAR ?auto_35223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35220 ?auto_35221 ?auto_35224 ?auto_35222 ?auto_35225 )
      ( MAKE-2PILE ?auto_35220 ?auto_35221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35230 - BLOCK
      ?auto_35231 - BLOCK
      ?auto_35232 - BLOCK
      ?auto_35233 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35233 ) ( CLEAR ?auto_35232 ) ( ON-TABLE ?auto_35230 ) ( ON ?auto_35231 ?auto_35230 ) ( ON ?auto_35232 ?auto_35231 ) ( not ( = ?auto_35230 ?auto_35231 ) ) ( not ( = ?auto_35230 ?auto_35232 ) ) ( not ( = ?auto_35230 ?auto_35233 ) ) ( not ( = ?auto_35231 ?auto_35232 ) ) ( not ( = ?auto_35231 ?auto_35233 ) ) ( not ( = ?auto_35232 ?auto_35233 ) ) )
    :subtasks
    ( ( !STACK ?auto_35233 ?auto_35232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35234 - BLOCK
      ?auto_35235 - BLOCK
      ?auto_35236 - BLOCK
      ?auto_35237 - BLOCK
    )
    :vars
    (
      ?auto_35238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35236 ) ( ON-TABLE ?auto_35234 ) ( ON ?auto_35235 ?auto_35234 ) ( ON ?auto_35236 ?auto_35235 ) ( not ( = ?auto_35234 ?auto_35235 ) ) ( not ( = ?auto_35234 ?auto_35236 ) ) ( not ( = ?auto_35234 ?auto_35237 ) ) ( not ( = ?auto_35235 ?auto_35236 ) ) ( not ( = ?auto_35235 ?auto_35237 ) ) ( not ( = ?auto_35236 ?auto_35237 ) ) ( ON ?auto_35237 ?auto_35238 ) ( CLEAR ?auto_35237 ) ( HAND-EMPTY ) ( not ( = ?auto_35234 ?auto_35238 ) ) ( not ( = ?auto_35235 ?auto_35238 ) ) ( not ( = ?auto_35236 ?auto_35238 ) ) ( not ( = ?auto_35237 ?auto_35238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35237 ?auto_35238 )
      ( MAKE-4PILE ?auto_35234 ?auto_35235 ?auto_35236 ?auto_35237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35239 - BLOCK
      ?auto_35240 - BLOCK
      ?auto_35241 - BLOCK
      ?auto_35242 - BLOCK
    )
    :vars
    (
      ?auto_35243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35239 ) ( ON ?auto_35240 ?auto_35239 ) ( not ( = ?auto_35239 ?auto_35240 ) ) ( not ( = ?auto_35239 ?auto_35241 ) ) ( not ( = ?auto_35239 ?auto_35242 ) ) ( not ( = ?auto_35240 ?auto_35241 ) ) ( not ( = ?auto_35240 ?auto_35242 ) ) ( not ( = ?auto_35241 ?auto_35242 ) ) ( ON ?auto_35242 ?auto_35243 ) ( CLEAR ?auto_35242 ) ( not ( = ?auto_35239 ?auto_35243 ) ) ( not ( = ?auto_35240 ?auto_35243 ) ) ( not ( = ?auto_35241 ?auto_35243 ) ) ( not ( = ?auto_35242 ?auto_35243 ) ) ( HOLDING ?auto_35241 ) ( CLEAR ?auto_35240 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35239 ?auto_35240 ?auto_35241 )
      ( MAKE-4PILE ?auto_35239 ?auto_35240 ?auto_35241 ?auto_35242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35244 - BLOCK
      ?auto_35245 - BLOCK
      ?auto_35246 - BLOCK
      ?auto_35247 - BLOCK
    )
    :vars
    (
      ?auto_35248 - BLOCK
      ?auto_35249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35244 ) ( ON ?auto_35245 ?auto_35244 ) ( not ( = ?auto_35244 ?auto_35245 ) ) ( not ( = ?auto_35244 ?auto_35246 ) ) ( not ( = ?auto_35244 ?auto_35247 ) ) ( not ( = ?auto_35245 ?auto_35246 ) ) ( not ( = ?auto_35245 ?auto_35247 ) ) ( not ( = ?auto_35246 ?auto_35247 ) ) ( ON ?auto_35247 ?auto_35248 ) ( not ( = ?auto_35244 ?auto_35248 ) ) ( not ( = ?auto_35245 ?auto_35248 ) ) ( not ( = ?auto_35246 ?auto_35248 ) ) ( not ( = ?auto_35247 ?auto_35248 ) ) ( CLEAR ?auto_35245 ) ( ON ?auto_35246 ?auto_35247 ) ( CLEAR ?auto_35246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35249 ) ( ON ?auto_35248 ?auto_35249 ) ( not ( = ?auto_35249 ?auto_35248 ) ) ( not ( = ?auto_35249 ?auto_35247 ) ) ( not ( = ?auto_35249 ?auto_35246 ) ) ( not ( = ?auto_35244 ?auto_35249 ) ) ( not ( = ?auto_35245 ?auto_35249 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35249 ?auto_35248 ?auto_35247 )
      ( MAKE-4PILE ?auto_35244 ?auto_35245 ?auto_35246 ?auto_35247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35250 - BLOCK
      ?auto_35251 - BLOCK
      ?auto_35252 - BLOCK
      ?auto_35253 - BLOCK
    )
    :vars
    (
      ?auto_35254 - BLOCK
      ?auto_35255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35250 ) ( not ( = ?auto_35250 ?auto_35251 ) ) ( not ( = ?auto_35250 ?auto_35252 ) ) ( not ( = ?auto_35250 ?auto_35253 ) ) ( not ( = ?auto_35251 ?auto_35252 ) ) ( not ( = ?auto_35251 ?auto_35253 ) ) ( not ( = ?auto_35252 ?auto_35253 ) ) ( ON ?auto_35253 ?auto_35254 ) ( not ( = ?auto_35250 ?auto_35254 ) ) ( not ( = ?auto_35251 ?auto_35254 ) ) ( not ( = ?auto_35252 ?auto_35254 ) ) ( not ( = ?auto_35253 ?auto_35254 ) ) ( ON ?auto_35252 ?auto_35253 ) ( CLEAR ?auto_35252 ) ( ON-TABLE ?auto_35255 ) ( ON ?auto_35254 ?auto_35255 ) ( not ( = ?auto_35255 ?auto_35254 ) ) ( not ( = ?auto_35255 ?auto_35253 ) ) ( not ( = ?auto_35255 ?auto_35252 ) ) ( not ( = ?auto_35250 ?auto_35255 ) ) ( not ( = ?auto_35251 ?auto_35255 ) ) ( HOLDING ?auto_35251 ) ( CLEAR ?auto_35250 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35250 ?auto_35251 )
      ( MAKE-4PILE ?auto_35250 ?auto_35251 ?auto_35252 ?auto_35253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35256 - BLOCK
      ?auto_35257 - BLOCK
      ?auto_35258 - BLOCK
      ?auto_35259 - BLOCK
    )
    :vars
    (
      ?auto_35260 - BLOCK
      ?auto_35261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35256 ) ( not ( = ?auto_35256 ?auto_35257 ) ) ( not ( = ?auto_35256 ?auto_35258 ) ) ( not ( = ?auto_35256 ?auto_35259 ) ) ( not ( = ?auto_35257 ?auto_35258 ) ) ( not ( = ?auto_35257 ?auto_35259 ) ) ( not ( = ?auto_35258 ?auto_35259 ) ) ( ON ?auto_35259 ?auto_35260 ) ( not ( = ?auto_35256 ?auto_35260 ) ) ( not ( = ?auto_35257 ?auto_35260 ) ) ( not ( = ?auto_35258 ?auto_35260 ) ) ( not ( = ?auto_35259 ?auto_35260 ) ) ( ON ?auto_35258 ?auto_35259 ) ( ON-TABLE ?auto_35261 ) ( ON ?auto_35260 ?auto_35261 ) ( not ( = ?auto_35261 ?auto_35260 ) ) ( not ( = ?auto_35261 ?auto_35259 ) ) ( not ( = ?auto_35261 ?auto_35258 ) ) ( not ( = ?auto_35256 ?auto_35261 ) ) ( not ( = ?auto_35257 ?auto_35261 ) ) ( CLEAR ?auto_35256 ) ( ON ?auto_35257 ?auto_35258 ) ( CLEAR ?auto_35257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35261 ?auto_35260 ?auto_35259 ?auto_35258 )
      ( MAKE-4PILE ?auto_35256 ?auto_35257 ?auto_35258 ?auto_35259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35262 - BLOCK
      ?auto_35263 - BLOCK
      ?auto_35264 - BLOCK
      ?auto_35265 - BLOCK
    )
    :vars
    (
      ?auto_35266 - BLOCK
      ?auto_35267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35262 ?auto_35263 ) ) ( not ( = ?auto_35262 ?auto_35264 ) ) ( not ( = ?auto_35262 ?auto_35265 ) ) ( not ( = ?auto_35263 ?auto_35264 ) ) ( not ( = ?auto_35263 ?auto_35265 ) ) ( not ( = ?auto_35264 ?auto_35265 ) ) ( ON ?auto_35265 ?auto_35266 ) ( not ( = ?auto_35262 ?auto_35266 ) ) ( not ( = ?auto_35263 ?auto_35266 ) ) ( not ( = ?auto_35264 ?auto_35266 ) ) ( not ( = ?auto_35265 ?auto_35266 ) ) ( ON ?auto_35264 ?auto_35265 ) ( ON-TABLE ?auto_35267 ) ( ON ?auto_35266 ?auto_35267 ) ( not ( = ?auto_35267 ?auto_35266 ) ) ( not ( = ?auto_35267 ?auto_35265 ) ) ( not ( = ?auto_35267 ?auto_35264 ) ) ( not ( = ?auto_35262 ?auto_35267 ) ) ( not ( = ?auto_35263 ?auto_35267 ) ) ( ON ?auto_35263 ?auto_35264 ) ( CLEAR ?auto_35263 ) ( HOLDING ?auto_35262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35262 )
      ( MAKE-4PILE ?auto_35262 ?auto_35263 ?auto_35264 ?auto_35265 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35268 - BLOCK
      ?auto_35269 - BLOCK
      ?auto_35270 - BLOCK
      ?auto_35271 - BLOCK
    )
    :vars
    (
      ?auto_35272 - BLOCK
      ?auto_35273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35268 ?auto_35269 ) ) ( not ( = ?auto_35268 ?auto_35270 ) ) ( not ( = ?auto_35268 ?auto_35271 ) ) ( not ( = ?auto_35269 ?auto_35270 ) ) ( not ( = ?auto_35269 ?auto_35271 ) ) ( not ( = ?auto_35270 ?auto_35271 ) ) ( ON ?auto_35271 ?auto_35272 ) ( not ( = ?auto_35268 ?auto_35272 ) ) ( not ( = ?auto_35269 ?auto_35272 ) ) ( not ( = ?auto_35270 ?auto_35272 ) ) ( not ( = ?auto_35271 ?auto_35272 ) ) ( ON ?auto_35270 ?auto_35271 ) ( ON-TABLE ?auto_35273 ) ( ON ?auto_35272 ?auto_35273 ) ( not ( = ?auto_35273 ?auto_35272 ) ) ( not ( = ?auto_35273 ?auto_35271 ) ) ( not ( = ?auto_35273 ?auto_35270 ) ) ( not ( = ?auto_35268 ?auto_35273 ) ) ( not ( = ?auto_35269 ?auto_35273 ) ) ( ON ?auto_35269 ?auto_35270 ) ( ON ?auto_35268 ?auto_35269 ) ( CLEAR ?auto_35268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35273 ?auto_35272 ?auto_35271 ?auto_35270 ?auto_35269 )
      ( MAKE-4PILE ?auto_35268 ?auto_35269 ?auto_35270 ?auto_35271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35275 - BLOCK
    )
    :vars
    (
      ?auto_35276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35276 ?auto_35275 ) ( CLEAR ?auto_35276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35275 ) ( not ( = ?auto_35275 ?auto_35276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35276 ?auto_35275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35277 - BLOCK
    )
    :vars
    (
      ?auto_35278 - BLOCK
      ?auto_35279 - BLOCK
      ?auto_35280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35278 ?auto_35277 ) ( CLEAR ?auto_35278 ) ( ON-TABLE ?auto_35277 ) ( not ( = ?auto_35277 ?auto_35278 ) ) ( HOLDING ?auto_35279 ) ( CLEAR ?auto_35280 ) ( not ( = ?auto_35277 ?auto_35279 ) ) ( not ( = ?auto_35277 ?auto_35280 ) ) ( not ( = ?auto_35278 ?auto_35279 ) ) ( not ( = ?auto_35278 ?auto_35280 ) ) ( not ( = ?auto_35279 ?auto_35280 ) ) )
    :subtasks
    ( ( !STACK ?auto_35279 ?auto_35280 )
      ( MAKE-1PILE ?auto_35277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35281 - BLOCK
    )
    :vars
    (
      ?auto_35284 - BLOCK
      ?auto_35283 - BLOCK
      ?auto_35282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35284 ?auto_35281 ) ( ON-TABLE ?auto_35281 ) ( not ( = ?auto_35281 ?auto_35284 ) ) ( CLEAR ?auto_35283 ) ( not ( = ?auto_35281 ?auto_35282 ) ) ( not ( = ?auto_35281 ?auto_35283 ) ) ( not ( = ?auto_35284 ?auto_35282 ) ) ( not ( = ?auto_35284 ?auto_35283 ) ) ( not ( = ?auto_35282 ?auto_35283 ) ) ( ON ?auto_35282 ?auto_35284 ) ( CLEAR ?auto_35282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35281 ?auto_35284 )
      ( MAKE-1PILE ?auto_35281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35285 - BLOCK
    )
    :vars
    (
      ?auto_35287 - BLOCK
      ?auto_35288 - BLOCK
      ?auto_35286 - BLOCK
      ?auto_35289 - BLOCK
      ?auto_35290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35287 ?auto_35285 ) ( ON-TABLE ?auto_35285 ) ( not ( = ?auto_35285 ?auto_35287 ) ) ( not ( = ?auto_35285 ?auto_35288 ) ) ( not ( = ?auto_35285 ?auto_35286 ) ) ( not ( = ?auto_35287 ?auto_35288 ) ) ( not ( = ?auto_35287 ?auto_35286 ) ) ( not ( = ?auto_35288 ?auto_35286 ) ) ( ON ?auto_35288 ?auto_35287 ) ( CLEAR ?auto_35288 ) ( HOLDING ?auto_35286 ) ( CLEAR ?auto_35289 ) ( ON-TABLE ?auto_35290 ) ( ON ?auto_35289 ?auto_35290 ) ( not ( = ?auto_35290 ?auto_35289 ) ) ( not ( = ?auto_35290 ?auto_35286 ) ) ( not ( = ?auto_35289 ?auto_35286 ) ) ( not ( = ?auto_35285 ?auto_35289 ) ) ( not ( = ?auto_35285 ?auto_35290 ) ) ( not ( = ?auto_35287 ?auto_35289 ) ) ( not ( = ?auto_35287 ?auto_35290 ) ) ( not ( = ?auto_35288 ?auto_35289 ) ) ( not ( = ?auto_35288 ?auto_35290 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35290 ?auto_35289 ?auto_35286 )
      ( MAKE-1PILE ?auto_35285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35291 - BLOCK
    )
    :vars
    (
      ?auto_35294 - BLOCK
      ?auto_35295 - BLOCK
      ?auto_35296 - BLOCK
      ?auto_35293 - BLOCK
      ?auto_35292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35294 ?auto_35291 ) ( ON-TABLE ?auto_35291 ) ( not ( = ?auto_35291 ?auto_35294 ) ) ( not ( = ?auto_35291 ?auto_35295 ) ) ( not ( = ?auto_35291 ?auto_35296 ) ) ( not ( = ?auto_35294 ?auto_35295 ) ) ( not ( = ?auto_35294 ?auto_35296 ) ) ( not ( = ?auto_35295 ?auto_35296 ) ) ( ON ?auto_35295 ?auto_35294 ) ( CLEAR ?auto_35293 ) ( ON-TABLE ?auto_35292 ) ( ON ?auto_35293 ?auto_35292 ) ( not ( = ?auto_35292 ?auto_35293 ) ) ( not ( = ?auto_35292 ?auto_35296 ) ) ( not ( = ?auto_35293 ?auto_35296 ) ) ( not ( = ?auto_35291 ?auto_35293 ) ) ( not ( = ?auto_35291 ?auto_35292 ) ) ( not ( = ?auto_35294 ?auto_35293 ) ) ( not ( = ?auto_35294 ?auto_35292 ) ) ( not ( = ?auto_35295 ?auto_35293 ) ) ( not ( = ?auto_35295 ?auto_35292 ) ) ( ON ?auto_35296 ?auto_35295 ) ( CLEAR ?auto_35296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35291 ?auto_35294 ?auto_35295 )
      ( MAKE-1PILE ?auto_35291 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35297 - BLOCK
    )
    :vars
    (
      ?auto_35299 - BLOCK
      ?auto_35298 - BLOCK
      ?auto_35301 - BLOCK
      ?auto_35302 - BLOCK
      ?auto_35300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35299 ?auto_35297 ) ( ON-TABLE ?auto_35297 ) ( not ( = ?auto_35297 ?auto_35299 ) ) ( not ( = ?auto_35297 ?auto_35298 ) ) ( not ( = ?auto_35297 ?auto_35301 ) ) ( not ( = ?auto_35299 ?auto_35298 ) ) ( not ( = ?auto_35299 ?auto_35301 ) ) ( not ( = ?auto_35298 ?auto_35301 ) ) ( ON ?auto_35298 ?auto_35299 ) ( ON-TABLE ?auto_35302 ) ( not ( = ?auto_35302 ?auto_35300 ) ) ( not ( = ?auto_35302 ?auto_35301 ) ) ( not ( = ?auto_35300 ?auto_35301 ) ) ( not ( = ?auto_35297 ?auto_35300 ) ) ( not ( = ?auto_35297 ?auto_35302 ) ) ( not ( = ?auto_35299 ?auto_35300 ) ) ( not ( = ?auto_35299 ?auto_35302 ) ) ( not ( = ?auto_35298 ?auto_35300 ) ) ( not ( = ?auto_35298 ?auto_35302 ) ) ( ON ?auto_35301 ?auto_35298 ) ( CLEAR ?auto_35301 ) ( HOLDING ?auto_35300 ) ( CLEAR ?auto_35302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35302 ?auto_35300 )
      ( MAKE-1PILE ?auto_35297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35303 - BLOCK
    )
    :vars
    (
      ?auto_35308 - BLOCK
      ?auto_35307 - BLOCK
      ?auto_35305 - BLOCK
      ?auto_35304 - BLOCK
      ?auto_35306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35308 ?auto_35303 ) ( ON-TABLE ?auto_35303 ) ( not ( = ?auto_35303 ?auto_35308 ) ) ( not ( = ?auto_35303 ?auto_35307 ) ) ( not ( = ?auto_35303 ?auto_35305 ) ) ( not ( = ?auto_35308 ?auto_35307 ) ) ( not ( = ?auto_35308 ?auto_35305 ) ) ( not ( = ?auto_35307 ?auto_35305 ) ) ( ON ?auto_35307 ?auto_35308 ) ( ON-TABLE ?auto_35304 ) ( not ( = ?auto_35304 ?auto_35306 ) ) ( not ( = ?auto_35304 ?auto_35305 ) ) ( not ( = ?auto_35306 ?auto_35305 ) ) ( not ( = ?auto_35303 ?auto_35306 ) ) ( not ( = ?auto_35303 ?auto_35304 ) ) ( not ( = ?auto_35308 ?auto_35306 ) ) ( not ( = ?auto_35308 ?auto_35304 ) ) ( not ( = ?auto_35307 ?auto_35306 ) ) ( not ( = ?auto_35307 ?auto_35304 ) ) ( ON ?auto_35305 ?auto_35307 ) ( CLEAR ?auto_35304 ) ( ON ?auto_35306 ?auto_35305 ) ( CLEAR ?auto_35306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35303 ?auto_35308 ?auto_35307 ?auto_35305 )
      ( MAKE-1PILE ?auto_35303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35309 - BLOCK
    )
    :vars
    (
      ?auto_35311 - BLOCK
      ?auto_35314 - BLOCK
      ?auto_35312 - BLOCK
      ?auto_35310 - BLOCK
      ?auto_35313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35311 ?auto_35309 ) ( ON-TABLE ?auto_35309 ) ( not ( = ?auto_35309 ?auto_35311 ) ) ( not ( = ?auto_35309 ?auto_35314 ) ) ( not ( = ?auto_35309 ?auto_35312 ) ) ( not ( = ?auto_35311 ?auto_35314 ) ) ( not ( = ?auto_35311 ?auto_35312 ) ) ( not ( = ?auto_35314 ?auto_35312 ) ) ( ON ?auto_35314 ?auto_35311 ) ( not ( = ?auto_35310 ?auto_35313 ) ) ( not ( = ?auto_35310 ?auto_35312 ) ) ( not ( = ?auto_35313 ?auto_35312 ) ) ( not ( = ?auto_35309 ?auto_35313 ) ) ( not ( = ?auto_35309 ?auto_35310 ) ) ( not ( = ?auto_35311 ?auto_35313 ) ) ( not ( = ?auto_35311 ?auto_35310 ) ) ( not ( = ?auto_35314 ?auto_35313 ) ) ( not ( = ?auto_35314 ?auto_35310 ) ) ( ON ?auto_35312 ?auto_35314 ) ( ON ?auto_35313 ?auto_35312 ) ( CLEAR ?auto_35313 ) ( HOLDING ?auto_35310 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35310 )
      ( MAKE-1PILE ?auto_35309 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35315 - BLOCK
    )
    :vars
    (
      ?auto_35320 - BLOCK
      ?auto_35319 - BLOCK
      ?auto_35318 - BLOCK
      ?auto_35316 - BLOCK
      ?auto_35317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35320 ?auto_35315 ) ( ON-TABLE ?auto_35315 ) ( not ( = ?auto_35315 ?auto_35320 ) ) ( not ( = ?auto_35315 ?auto_35319 ) ) ( not ( = ?auto_35315 ?auto_35318 ) ) ( not ( = ?auto_35320 ?auto_35319 ) ) ( not ( = ?auto_35320 ?auto_35318 ) ) ( not ( = ?auto_35319 ?auto_35318 ) ) ( ON ?auto_35319 ?auto_35320 ) ( not ( = ?auto_35316 ?auto_35317 ) ) ( not ( = ?auto_35316 ?auto_35318 ) ) ( not ( = ?auto_35317 ?auto_35318 ) ) ( not ( = ?auto_35315 ?auto_35317 ) ) ( not ( = ?auto_35315 ?auto_35316 ) ) ( not ( = ?auto_35320 ?auto_35317 ) ) ( not ( = ?auto_35320 ?auto_35316 ) ) ( not ( = ?auto_35319 ?auto_35317 ) ) ( not ( = ?auto_35319 ?auto_35316 ) ) ( ON ?auto_35318 ?auto_35319 ) ( ON ?auto_35317 ?auto_35318 ) ( ON ?auto_35316 ?auto_35317 ) ( CLEAR ?auto_35316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35315 ?auto_35320 ?auto_35319 ?auto_35318 ?auto_35317 )
      ( MAKE-1PILE ?auto_35315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35326 - BLOCK
      ?auto_35327 - BLOCK
      ?auto_35328 - BLOCK
      ?auto_35329 - BLOCK
      ?auto_35330 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35330 ) ( CLEAR ?auto_35329 ) ( ON-TABLE ?auto_35326 ) ( ON ?auto_35327 ?auto_35326 ) ( ON ?auto_35328 ?auto_35327 ) ( ON ?auto_35329 ?auto_35328 ) ( not ( = ?auto_35326 ?auto_35327 ) ) ( not ( = ?auto_35326 ?auto_35328 ) ) ( not ( = ?auto_35326 ?auto_35329 ) ) ( not ( = ?auto_35326 ?auto_35330 ) ) ( not ( = ?auto_35327 ?auto_35328 ) ) ( not ( = ?auto_35327 ?auto_35329 ) ) ( not ( = ?auto_35327 ?auto_35330 ) ) ( not ( = ?auto_35328 ?auto_35329 ) ) ( not ( = ?auto_35328 ?auto_35330 ) ) ( not ( = ?auto_35329 ?auto_35330 ) ) )
    :subtasks
    ( ( !STACK ?auto_35330 ?auto_35329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35331 - BLOCK
      ?auto_35332 - BLOCK
      ?auto_35333 - BLOCK
      ?auto_35334 - BLOCK
      ?auto_35335 - BLOCK
    )
    :vars
    (
      ?auto_35336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35334 ) ( ON-TABLE ?auto_35331 ) ( ON ?auto_35332 ?auto_35331 ) ( ON ?auto_35333 ?auto_35332 ) ( ON ?auto_35334 ?auto_35333 ) ( not ( = ?auto_35331 ?auto_35332 ) ) ( not ( = ?auto_35331 ?auto_35333 ) ) ( not ( = ?auto_35331 ?auto_35334 ) ) ( not ( = ?auto_35331 ?auto_35335 ) ) ( not ( = ?auto_35332 ?auto_35333 ) ) ( not ( = ?auto_35332 ?auto_35334 ) ) ( not ( = ?auto_35332 ?auto_35335 ) ) ( not ( = ?auto_35333 ?auto_35334 ) ) ( not ( = ?auto_35333 ?auto_35335 ) ) ( not ( = ?auto_35334 ?auto_35335 ) ) ( ON ?auto_35335 ?auto_35336 ) ( CLEAR ?auto_35335 ) ( HAND-EMPTY ) ( not ( = ?auto_35331 ?auto_35336 ) ) ( not ( = ?auto_35332 ?auto_35336 ) ) ( not ( = ?auto_35333 ?auto_35336 ) ) ( not ( = ?auto_35334 ?auto_35336 ) ) ( not ( = ?auto_35335 ?auto_35336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35335 ?auto_35336 )
      ( MAKE-5PILE ?auto_35331 ?auto_35332 ?auto_35333 ?auto_35334 ?auto_35335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35337 - BLOCK
      ?auto_35338 - BLOCK
      ?auto_35339 - BLOCK
      ?auto_35340 - BLOCK
      ?auto_35341 - BLOCK
    )
    :vars
    (
      ?auto_35342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35337 ) ( ON ?auto_35338 ?auto_35337 ) ( ON ?auto_35339 ?auto_35338 ) ( not ( = ?auto_35337 ?auto_35338 ) ) ( not ( = ?auto_35337 ?auto_35339 ) ) ( not ( = ?auto_35337 ?auto_35340 ) ) ( not ( = ?auto_35337 ?auto_35341 ) ) ( not ( = ?auto_35338 ?auto_35339 ) ) ( not ( = ?auto_35338 ?auto_35340 ) ) ( not ( = ?auto_35338 ?auto_35341 ) ) ( not ( = ?auto_35339 ?auto_35340 ) ) ( not ( = ?auto_35339 ?auto_35341 ) ) ( not ( = ?auto_35340 ?auto_35341 ) ) ( ON ?auto_35341 ?auto_35342 ) ( CLEAR ?auto_35341 ) ( not ( = ?auto_35337 ?auto_35342 ) ) ( not ( = ?auto_35338 ?auto_35342 ) ) ( not ( = ?auto_35339 ?auto_35342 ) ) ( not ( = ?auto_35340 ?auto_35342 ) ) ( not ( = ?auto_35341 ?auto_35342 ) ) ( HOLDING ?auto_35340 ) ( CLEAR ?auto_35339 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35337 ?auto_35338 ?auto_35339 ?auto_35340 )
      ( MAKE-5PILE ?auto_35337 ?auto_35338 ?auto_35339 ?auto_35340 ?auto_35341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35343 - BLOCK
      ?auto_35344 - BLOCK
      ?auto_35345 - BLOCK
      ?auto_35346 - BLOCK
      ?auto_35347 - BLOCK
    )
    :vars
    (
      ?auto_35348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35343 ) ( ON ?auto_35344 ?auto_35343 ) ( ON ?auto_35345 ?auto_35344 ) ( not ( = ?auto_35343 ?auto_35344 ) ) ( not ( = ?auto_35343 ?auto_35345 ) ) ( not ( = ?auto_35343 ?auto_35346 ) ) ( not ( = ?auto_35343 ?auto_35347 ) ) ( not ( = ?auto_35344 ?auto_35345 ) ) ( not ( = ?auto_35344 ?auto_35346 ) ) ( not ( = ?auto_35344 ?auto_35347 ) ) ( not ( = ?auto_35345 ?auto_35346 ) ) ( not ( = ?auto_35345 ?auto_35347 ) ) ( not ( = ?auto_35346 ?auto_35347 ) ) ( ON ?auto_35347 ?auto_35348 ) ( not ( = ?auto_35343 ?auto_35348 ) ) ( not ( = ?auto_35344 ?auto_35348 ) ) ( not ( = ?auto_35345 ?auto_35348 ) ) ( not ( = ?auto_35346 ?auto_35348 ) ) ( not ( = ?auto_35347 ?auto_35348 ) ) ( CLEAR ?auto_35345 ) ( ON ?auto_35346 ?auto_35347 ) ( CLEAR ?auto_35346 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35348 ?auto_35347 )
      ( MAKE-5PILE ?auto_35343 ?auto_35344 ?auto_35345 ?auto_35346 ?auto_35347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35349 - BLOCK
      ?auto_35350 - BLOCK
      ?auto_35351 - BLOCK
      ?auto_35352 - BLOCK
      ?auto_35353 - BLOCK
    )
    :vars
    (
      ?auto_35354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35349 ) ( ON ?auto_35350 ?auto_35349 ) ( not ( = ?auto_35349 ?auto_35350 ) ) ( not ( = ?auto_35349 ?auto_35351 ) ) ( not ( = ?auto_35349 ?auto_35352 ) ) ( not ( = ?auto_35349 ?auto_35353 ) ) ( not ( = ?auto_35350 ?auto_35351 ) ) ( not ( = ?auto_35350 ?auto_35352 ) ) ( not ( = ?auto_35350 ?auto_35353 ) ) ( not ( = ?auto_35351 ?auto_35352 ) ) ( not ( = ?auto_35351 ?auto_35353 ) ) ( not ( = ?auto_35352 ?auto_35353 ) ) ( ON ?auto_35353 ?auto_35354 ) ( not ( = ?auto_35349 ?auto_35354 ) ) ( not ( = ?auto_35350 ?auto_35354 ) ) ( not ( = ?auto_35351 ?auto_35354 ) ) ( not ( = ?auto_35352 ?auto_35354 ) ) ( not ( = ?auto_35353 ?auto_35354 ) ) ( ON ?auto_35352 ?auto_35353 ) ( CLEAR ?auto_35352 ) ( ON-TABLE ?auto_35354 ) ( HOLDING ?auto_35351 ) ( CLEAR ?auto_35350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35349 ?auto_35350 ?auto_35351 )
      ( MAKE-5PILE ?auto_35349 ?auto_35350 ?auto_35351 ?auto_35352 ?auto_35353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35355 - BLOCK
      ?auto_35356 - BLOCK
      ?auto_35357 - BLOCK
      ?auto_35358 - BLOCK
      ?auto_35359 - BLOCK
    )
    :vars
    (
      ?auto_35360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35355 ) ( ON ?auto_35356 ?auto_35355 ) ( not ( = ?auto_35355 ?auto_35356 ) ) ( not ( = ?auto_35355 ?auto_35357 ) ) ( not ( = ?auto_35355 ?auto_35358 ) ) ( not ( = ?auto_35355 ?auto_35359 ) ) ( not ( = ?auto_35356 ?auto_35357 ) ) ( not ( = ?auto_35356 ?auto_35358 ) ) ( not ( = ?auto_35356 ?auto_35359 ) ) ( not ( = ?auto_35357 ?auto_35358 ) ) ( not ( = ?auto_35357 ?auto_35359 ) ) ( not ( = ?auto_35358 ?auto_35359 ) ) ( ON ?auto_35359 ?auto_35360 ) ( not ( = ?auto_35355 ?auto_35360 ) ) ( not ( = ?auto_35356 ?auto_35360 ) ) ( not ( = ?auto_35357 ?auto_35360 ) ) ( not ( = ?auto_35358 ?auto_35360 ) ) ( not ( = ?auto_35359 ?auto_35360 ) ) ( ON ?auto_35358 ?auto_35359 ) ( ON-TABLE ?auto_35360 ) ( CLEAR ?auto_35356 ) ( ON ?auto_35357 ?auto_35358 ) ( CLEAR ?auto_35357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35360 ?auto_35359 ?auto_35358 )
      ( MAKE-5PILE ?auto_35355 ?auto_35356 ?auto_35357 ?auto_35358 ?auto_35359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35361 - BLOCK
      ?auto_35362 - BLOCK
      ?auto_35363 - BLOCK
      ?auto_35364 - BLOCK
      ?auto_35365 - BLOCK
    )
    :vars
    (
      ?auto_35366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35361 ) ( not ( = ?auto_35361 ?auto_35362 ) ) ( not ( = ?auto_35361 ?auto_35363 ) ) ( not ( = ?auto_35361 ?auto_35364 ) ) ( not ( = ?auto_35361 ?auto_35365 ) ) ( not ( = ?auto_35362 ?auto_35363 ) ) ( not ( = ?auto_35362 ?auto_35364 ) ) ( not ( = ?auto_35362 ?auto_35365 ) ) ( not ( = ?auto_35363 ?auto_35364 ) ) ( not ( = ?auto_35363 ?auto_35365 ) ) ( not ( = ?auto_35364 ?auto_35365 ) ) ( ON ?auto_35365 ?auto_35366 ) ( not ( = ?auto_35361 ?auto_35366 ) ) ( not ( = ?auto_35362 ?auto_35366 ) ) ( not ( = ?auto_35363 ?auto_35366 ) ) ( not ( = ?auto_35364 ?auto_35366 ) ) ( not ( = ?auto_35365 ?auto_35366 ) ) ( ON ?auto_35364 ?auto_35365 ) ( ON-TABLE ?auto_35366 ) ( ON ?auto_35363 ?auto_35364 ) ( CLEAR ?auto_35363 ) ( HOLDING ?auto_35362 ) ( CLEAR ?auto_35361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35361 ?auto_35362 )
      ( MAKE-5PILE ?auto_35361 ?auto_35362 ?auto_35363 ?auto_35364 ?auto_35365 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35367 - BLOCK
      ?auto_35368 - BLOCK
      ?auto_35369 - BLOCK
      ?auto_35370 - BLOCK
      ?auto_35371 - BLOCK
    )
    :vars
    (
      ?auto_35372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35367 ) ( not ( = ?auto_35367 ?auto_35368 ) ) ( not ( = ?auto_35367 ?auto_35369 ) ) ( not ( = ?auto_35367 ?auto_35370 ) ) ( not ( = ?auto_35367 ?auto_35371 ) ) ( not ( = ?auto_35368 ?auto_35369 ) ) ( not ( = ?auto_35368 ?auto_35370 ) ) ( not ( = ?auto_35368 ?auto_35371 ) ) ( not ( = ?auto_35369 ?auto_35370 ) ) ( not ( = ?auto_35369 ?auto_35371 ) ) ( not ( = ?auto_35370 ?auto_35371 ) ) ( ON ?auto_35371 ?auto_35372 ) ( not ( = ?auto_35367 ?auto_35372 ) ) ( not ( = ?auto_35368 ?auto_35372 ) ) ( not ( = ?auto_35369 ?auto_35372 ) ) ( not ( = ?auto_35370 ?auto_35372 ) ) ( not ( = ?auto_35371 ?auto_35372 ) ) ( ON ?auto_35370 ?auto_35371 ) ( ON-TABLE ?auto_35372 ) ( ON ?auto_35369 ?auto_35370 ) ( CLEAR ?auto_35367 ) ( ON ?auto_35368 ?auto_35369 ) ( CLEAR ?auto_35368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35372 ?auto_35371 ?auto_35370 ?auto_35369 )
      ( MAKE-5PILE ?auto_35367 ?auto_35368 ?auto_35369 ?auto_35370 ?auto_35371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35373 - BLOCK
      ?auto_35374 - BLOCK
      ?auto_35375 - BLOCK
      ?auto_35376 - BLOCK
      ?auto_35377 - BLOCK
    )
    :vars
    (
      ?auto_35378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35373 ?auto_35374 ) ) ( not ( = ?auto_35373 ?auto_35375 ) ) ( not ( = ?auto_35373 ?auto_35376 ) ) ( not ( = ?auto_35373 ?auto_35377 ) ) ( not ( = ?auto_35374 ?auto_35375 ) ) ( not ( = ?auto_35374 ?auto_35376 ) ) ( not ( = ?auto_35374 ?auto_35377 ) ) ( not ( = ?auto_35375 ?auto_35376 ) ) ( not ( = ?auto_35375 ?auto_35377 ) ) ( not ( = ?auto_35376 ?auto_35377 ) ) ( ON ?auto_35377 ?auto_35378 ) ( not ( = ?auto_35373 ?auto_35378 ) ) ( not ( = ?auto_35374 ?auto_35378 ) ) ( not ( = ?auto_35375 ?auto_35378 ) ) ( not ( = ?auto_35376 ?auto_35378 ) ) ( not ( = ?auto_35377 ?auto_35378 ) ) ( ON ?auto_35376 ?auto_35377 ) ( ON-TABLE ?auto_35378 ) ( ON ?auto_35375 ?auto_35376 ) ( ON ?auto_35374 ?auto_35375 ) ( CLEAR ?auto_35374 ) ( HOLDING ?auto_35373 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35373 )
      ( MAKE-5PILE ?auto_35373 ?auto_35374 ?auto_35375 ?auto_35376 ?auto_35377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35379 - BLOCK
      ?auto_35380 - BLOCK
      ?auto_35381 - BLOCK
      ?auto_35382 - BLOCK
      ?auto_35383 - BLOCK
    )
    :vars
    (
      ?auto_35384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35379 ?auto_35380 ) ) ( not ( = ?auto_35379 ?auto_35381 ) ) ( not ( = ?auto_35379 ?auto_35382 ) ) ( not ( = ?auto_35379 ?auto_35383 ) ) ( not ( = ?auto_35380 ?auto_35381 ) ) ( not ( = ?auto_35380 ?auto_35382 ) ) ( not ( = ?auto_35380 ?auto_35383 ) ) ( not ( = ?auto_35381 ?auto_35382 ) ) ( not ( = ?auto_35381 ?auto_35383 ) ) ( not ( = ?auto_35382 ?auto_35383 ) ) ( ON ?auto_35383 ?auto_35384 ) ( not ( = ?auto_35379 ?auto_35384 ) ) ( not ( = ?auto_35380 ?auto_35384 ) ) ( not ( = ?auto_35381 ?auto_35384 ) ) ( not ( = ?auto_35382 ?auto_35384 ) ) ( not ( = ?auto_35383 ?auto_35384 ) ) ( ON ?auto_35382 ?auto_35383 ) ( ON-TABLE ?auto_35384 ) ( ON ?auto_35381 ?auto_35382 ) ( ON ?auto_35380 ?auto_35381 ) ( ON ?auto_35379 ?auto_35380 ) ( CLEAR ?auto_35379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35384 ?auto_35383 ?auto_35382 ?auto_35381 ?auto_35380 )
      ( MAKE-5PILE ?auto_35379 ?auto_35380 ?auto_35381 ?auto_35382 ?auto_35383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35389 - BLOCK
      ?auto_35390 - BLOCK
      ?auto_35391 - BLOCK
      ?auto_35392 - BLOCK
    )
    :vars
    (
      ?auto_35393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35393 ?auto_35392 ) ( CLEAR ?auto_35393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35389 ) ( ON ?auto_35390 ?auto_35389 ) ( ON ?auto_35391 ?auto_35390 ) ( ON ?auto_35392 ?auto_35391 ) ( not ( = ?auto_35389 ?auto_35390 ) ) ( not ( = ?auto_35389 ?auto_35391 ) ) ( not ( = ?auto_35389 ?auto_35392 ) ) ( not ( = ?auto_35389 ?auto_35393 ) ) ( not ( = ?auto_35390 ?auto_35391 ) ) ( not ( = ?auto_35390 ?auto_35392 ) ) ( not ( = ?auto_35390 ?auto_35393 ) ) ( not ( = ?auto_35391 ?auto_35392 ) ) ( not ( = ?auto_35391 ?auto_35393 ) ) ( not ( = ?auto_35392 ?auto_35393 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35393 ?auto_35392 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35405 - BLOCK
      ?auto_35406 - BLOCK
      ?auto_35407 - BLOCK
      ?auto_35408 - BLOCK
    )
    :vars
    (
      ?auto_35409 - BLOCK
      ?auto_35410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35405 ) ( ON ?auto_35406 ?auto_35405 ) ( ON ?auto_35407 ?auto_35406 ) ( not ( = ?auto_35405 ?auto_35406 ) ) ( not ( = ?auto_35405 ?auto_35407 ) ) ( not ( = ?auto_35405 ?auto_35408 ) ) ( not ( = ?auto_35405 ?auto_35409 ) ) ( not ( = ?auto_35406 ?auto_35407 ) ) ( not ( = ?auto_35406 ?auto_35408 ) ) ( not ( = ?auto_35406 ?auto_35409 ) ) ( not ( = ?auto_35407 ?auto_35408 ) ) ( not ( = ?auto_35407 ?auto_35409 ) ) ( not ( = ?auto_35408 ?auto_35409 ) ) ( ON ?auto_35409 ?auto_35410 ) ( CLEAR ?auto_35409 ) ( not ( = ?auto_35405 ?auto_35410 ) ) ( not ( = ?auto_35406 ?auto_35410 ) ) ( not ( = ?auto_35407 ?auto_35410 ) ) ( not ( = ?auto_35408 ?auto_35410 ) ) ( not ( = ?auto_35409 ?auto_35410 ) ) ( HOLDING ?auto_35408 ) ( CLEAR ?auto_35407 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35405 ?auto_35406 ?auto_35407 ?auto_35408 ?auto_35409 )
      ( MAKE-4PILE ?auto_35405 ?auto_35406 ?auto_35407 ?auto_35408 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35411 - BLOCK
      ?auto_35412 - BLOCK
      ?auto_35413 - BLOCK
      ?auto_35414 - BLOCK
    )
    :vars
    (
      ?auto_35416 - BLOCK
      ?auto_35415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35411 ) ( ON ?auto_35412 ?auto_35411 ) ( ON ?auto_35413 ?auto_35412 ) ( not ( = ?auto_35411 ?auto_35412 ) ) ( not ( = ?auto_35411 ?auto_35413 ) ) ( not ( = ?auto_35411 ?auto_35414 ) ) ( not ( = ?auto_35411 ?auto_35416 ) ) ( not ( = ?auto_35412 ?auto_35413 ) ) ( not ( = ?auto_35412 ?auto_35414 ) ) ( not ( = ?auto_35412 ?auto_35416 ) ) ( not ( = ?auto_35413 ?auto_35414 ) ) ( not ( = ?auto_35413 ?auto_35416 ) ) ( not ( = ?auto_35414 ?auto_35416 ) ) ( ON ?auto_35416 ?auto_35415 ) ( not ( = ?auto_35411 ?auto_35415 ) ) ( not ( = ?auto_35412 ?auto_35415 ) ) ( not ( = ?auto_35413 ?auto_35415 ) ) ( not ( = ?auto_35414 ?auto_35415 ) ) ( not ( = ?auto_35416 ?auto_35415 ) ) ( CLEAR ?auto_35413 ) ( ON ?auto_35414 ?auto_35416 ) ( CLEAR ?auto_35414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35415 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35415 ?auto_35416 )
      ( MAKE-4PILE ?auto_35411 ?auto_35412 ?auto_35413 ?auto_35414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35417 - BLOCK
      ?auto_35418 - BLOCK
      ?auto_35419 - BLOCK
      ?auto_35420 - BLOCK
    )
    :vars
    (
      ?auto_35421 - BLOCK
      ?auto_35422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35417 ) ( ON ?auto_35418 ?auto_35417 ) ( not ( = ?auto_35417 ?auto_35418 ) ) ( not ( = ?auto_35417 ?auto_35419 ) ) ( not ( = ?auto_35417 ?auto_35420 ) ) ( not ( = ?auto_35417 ?auto_35421 ) ) ( not ( = ?auto_35418 ?auto_35419 ) ) ( not ( = ?auto_35418 ?auto_35420 ) ) ( not ( = ?auto_35418 ?auto_35421 ) ) ( not ( = ?auto_35419 ?auto_35420 ) ) ( not ( = ?auto_35419 ?auto_35421 ) ) ( not ( = ?auto_35420 ?auto_35421 ) ) ( ON ?auto_35421 ?auto_35422 ) ( not ( = ?auto_35417 ?auto_35422 ) ) ( not ( = ?auto_35418 ?auto_35422 ) ) ( not ( = ?auto_35419 ?auto_35422 ) ) ( not ( = ?auto_35420 ?auto_35422 ) ) ( not ( = ?auto_35421 ?auto_35422 ) ) ( ON ?auto_35420 ?auto_35421 ) ( CLEAR ?auto_35420 ) ( ON-TABLE ?auto_35422 ) ( HOLDING ?auto_35419 ) ( CLEAR ?auto_35418 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35417 ?auto_35418 ?auto_35419 )
      ( MAKE-4PILE ?auto_35417 ?auto_35418 ?auto_35419 ?auto_35420 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35423 - BLOCK
      ?auto_35424 - BLOCK
      ?auto_35425 - BLOCK
      ?auto_35426 - BLOCK
    )
    :vars
    (
      ?auto_35427 - BLOCK
      ?auto_35428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35423 ) ( ON ?auto_35424 ?auto_35423 ) ( not ( = ?auto_35423 ?auto_35424 ) ) ( not ( = ?auto_35423 ?auto_35425 ) ) ( not ( = ?auto_35423 ?auto_35426 ) ) ( not ( = ?auto_35423 ?auto_35427 ) ) ( not ( = ?auto_35424 ?auto_35425 ) ) ( not ( = ?auto_35424 ?auto_35426 ) ) ( not ( = ?auto_35424 ?auto_35427 ) ) ( not ( = ?auto_35425 ?auto_35426 ) ) ( not ( = ?auto_35425 ?auto_35427 ) ) ( not ( = ?auto_35426 ?auto_35427 ) ) ( ON ?auto_35427 ?auto_35428 ) ( not ( = ?auto_35423 ?auto_35428 ) ) ( not ( = ?auto_35424 ?auto_35428 ) ) ( not ( = ?auto_35425 ?auto_35428 ) ) ( not ( = ?auto_35426 ?auto_35428 ) ) ( not ( = ?auto_35427 ?auto_35428 ) ) ( ON ?auto_35426 ?auto_35427 ) ( ON-TABLE ?auto_35428 ) ( CLEAR ?auto_35424 ) ( ON ?auto_35425 ?auto_35426 ) ( CLEAR ?auto_35425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35428 ?auto_35427 ?auto_35426 )
      ( MAKE-4PILE ?auto_35423 ?auto_35424 ?auto_35425 ?auto_35426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35429 - BLOCK
      ?auto_35430 - BLOCK
      ?auto_35431 - BLOCK
      ?auto_35432 - BLOCK
    )
    :vars
    (
      ?auto_35433 - BLOCK
      ?auto_35434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35429 ) ( not ( = ?auto_35429 ?auto_35430 ) ) ( not ( = ?auto_35429 ?auto_35431 ) ) ( not ( = ?auto_35429 ?auto_35432 ) ) ( not ( = ?auto_35429 ?auto_35433 ) ) ( not ( = ?auto_35430 ?auto_35431 ) ) ( not ( = ?auto_35430 ?auto_35432 ) ) ( not ( = ?auto_35430 ?auto_35433 ) ) ( not ( = ?auto_35431 ?auto_35432 ) ) ( not ( = ?auto_35431 ?auto_35433 ) ) ( not ( = ?auto_35432 ?auto_35433 ) ) ( ON ?auto_35433 ?auto_35434 ) ( not ( = ?auto_35429 ?auto_35434 ) ) ( not ( = ?auto_35430 ?auto_35434 ) ) ( not ( = ?auto_35431 ?auto_35434 ) ) ( not ( = ?auto_35432 ?auto_35434 ) ) ( not ( = ?auto_35433 ?auto_35434 ) ) ( ON ?auto_35432 ?auto_35433 ) ( ON-TABLE ?auto_35434 ) ( ON ?auto_35431 ?auto_35432 ) ( CLEAR ?auto_35431 ) ( HOLDING ?auto_35430 ) ( CLEAR ?auto_35429 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35429 ?auto_35430 )
      ( MAKE-4PILE ?auto_35429 ?auto_35430 ?auto_35431 ?auto_35432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35435 - BLOCK
      ?auto_35436 - BLOCK
      ?auto_35437 - BLOCK
      ?auto_35438 - BLOCK
    )
    :vars
    (
      ?auto_35439 - BLOCK
      ?auto_35440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35435 ) ( not ( = ?auto_35435 ?auto_35436 ) ) ( not ( = ?auto_35435 ?auto_35437 ) ) ( not ( = ?auto_35435 ?auto_35438 ) ) ( not ( = ?auto_35435 ?auto_35439 ) ) ( not ( = ?auto_35436 ?auto_35437 ) ) ( not ( = ?auto_35436 ?auto_35438 ) ) ( not ( = ?auto_35436 ?auto_35439 ) ) ( not ( = ?auto_35437 ?auto_35438 ) ) ( not ( = ?auto_35437 ?auto_35439 ) ) ( not ( = ?auto_35438 ?auto_35439 ) ) ( ON ?auto_35439 ?auto_35440 ) ( not ( = ?auto_35435 ?auto_35440 ) ) ( not ( = ?auto_35436 ?auto_35440 ) ) ( not ( = ?auto_35437 ?auto_35440 ) ) ( not ( = ?auto_35438 ?auto_35440 ) ) ( not ( = ?auto_35439 ?auto_35440 ) ) ( ON ?auto_35438 ?auto_35439 ) ( ON-TABLE ?auto_35440 ) ( ON ?auto_35437 ?auto_35438 ) ( CLEAR ?auto_35435 ) ( ON ?auto_35436 ?auto_35437 ) ( CLEAR ?auto_35436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35440 ?auto_35439 ?auto_35438 ?auto_35437 )
      ( MAKE-4PILE ?auto_35435 ?auto_35436 ?auto_35437 ?auto_35438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35441 - BLOCK
      ?auto_35442 - BLOCK
      ?auto_35443 - BLOCK
      ?auto_35444 - BLOCK
    )
    :vars
    (
      ?auto_35446 - BLOCK
      ?auto_35445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35441 ?auto_35442 ) ) ( not ( = ?auto_35441 ?auto_35443 ) ) ( not ( = ?auto_35441 ?auto_35444 ) ) ( not ( = ?auto_35441 ?auto_35446 ) ) ( not ( = ?auto_35442 ?auto_35443 ) ) ( not ( = ?auto_35442 ?auto_35444 ) ) ( not ( = ?auto_35442 ?auto_35446 ) ) ( not ( = ?auto_35443 ?auto_35444 ) ) ( not ( = ?auto_35443 ?auto_35446 ) ) ( not ( = ?auto_35444 ?auto_35446 ) ) ( ON ?auto_35446 ?auto_35445 ) ( not ( = ?auto_35441 ?auto_35445 ) ) ( not ( = ?auto_35442 ?auto_35445 ) ) ( not ( = ?auto_35443 ?auto_35445 ) ) ( not ( = ?auto_35444 ?auto_35445 ) ) ( not ( = ?auto_35446 ?auto_35445 ) ) ( ON ?auto_35444 ?auto_35446 ) ( ON-TABLE ?auto_35445 ) ( ON ?auto_35443 ?auto_35444 ) ( ON ?auto_35442 ?auto_35443 ) ( CLEAR ?auto_35442 ) ( HOLDING ?auto_35441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35441 )
      ( MAKE-4PILE ?auto_35441 ?auto_35442 ?auto_35443 ?auto_35444 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35447 - BLOCK
      ?auto_35448 - BLOCK
      ?auto_35449 - BLOCK
      ?auto_35450 - BLOCK
    )
    :vars
    (
      ?auto_35452 - BLOCK
      ?auto_35451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35447 ?auto_35448 ) ) ( not ( = ?auto_35447 ?auto_35449 ) ) ( not ( = ?auto_35447 ?auto_35450 ) ) ( not ( = ?auto_35447 ?auto_35452 ) ) ( not ( = ?auto_35448 ?auto_35449 ) ) ( not ( = ?auto_35448 ?auto_35450 ) ) ( not ( = ?auto_35448 ?auto_35452 ) ) ( not ( = ?auto_35449 ?auto_35450 ) ) ( not ( = ?auto_35449 ?auto_35452 ) ) ( not ( = ?auto_35450 ?auto_35452 ) ) ( ON ?auto_35452 ?auto_35451 ) ( not ( = ?auto_35447 ?auto_35451 ) ) ( not ( = ?auto_35448 ?auto_35451 ) ) ( not ( = ?auto_35449 ?auto_35451 ) ) ( not ( = ?auto_35450 ?auto_35451 ) ) ( not ( = ?auto_35452 ?auto_35451 ) ) ( ON ?auto_35450 ?auto_35452 ) ( ON-TABLE ?auto_35451 ) ( ON ?auto_35449 ?auto_35450 ) ( ON ?auto_35448 ?auto_35449 ) ( ON ?auto_35447 ?auto_35448 ) ( CLEAR ?auto_35447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35451 ?auto_35452 ?auto_35450 ?auto_35449 ?auto_35448 )
      ( MAKE-4PILE ?auto_35447 ?auto_35448 ?auto_35449 ?auto_35450 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35454 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35454 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_35454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35455 - BLOCK
    )
    :vars
    (
      ?auto_35456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35455 ?auto_35456 ) ( CLEAR ?auto_35455 ) ( HAND-EMPTY ) ( not ( = ?auto_35455 ?auto_35456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35455 ?auto_35456 )
      ( MAKE-1PILE ?auto_35455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35457 - BLOCK
    )
    :vars
    (
      ?auto_35458 - BLOCK
      ?auto_35460 - BLOCK
      ?auto_35459 - BLOCK
      ?auto_35461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35457 ?auto_35458 ) ) ( HOLDING ?auto_35457 ) ( CLEAR ?auto_35458 ) ( ON-TABLE ?auto_35460 ) ( ON ?auto_35459 ?auto_35460 ) ( ON ?auto_35461 ?auto_35459 ) ( ON ?auto_35458 ?auto_35461 ) ( not ( = ?auto_35460 ?auto_35459 ) ) ( not ( = ?auto_35460 ?auto_35461 ) ) ( not ( = ?auto_35460 ?auto_35458 ) ) ( not ( = ?auto_35460 ?auto_35457 ) ) ( not ( = ?auto_35459 ?auto_35461 ) ) ( not ( = ?auto_35459 ?auto_35458 ) ) ( not ( = ?auto_35459 ?auto_35457 ) ) ( not ( = ?auto_35461 ?auto_35458 ) ) ( not ( = ?auto_35461 ?auto_35457 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35460 ?auto_35459 ?auto_35461 ?auto_35458 ?auto_35457 )
      ( MAKE-1PILE ?auto_35457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35462 - BLOCK
    )
    :vars
    (
      ?auto_35463 - BLOCK
      ?auto_35465 - BLOCK
      ?auto_35464 - BLOCK
      ?auto_35466 - BLOCK
      ?auto_35467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35462 ?auto_35463 ) ) ( CLEAR ?auto_35463 ) ( ON-TABLE ?auto_35465 ) ( ON ?auto_35464 ?auto_35465 ) ( ON ?auto_35466 ?auto_35464 ) ( ON ?auto_35463 ?auto_35466 ) ( not ( = ?auto_35465 ?auto_35464 ) ) ( not ( = ?auto_35465 ?auto_35466 ) ) ( not ( = ?auto_35465 ?auto_35463 ) ) ( not ( = ?auto_35465 ?auto_35462 ) ) ( not ( = ?auto_35464 ?auto_35466 ) ) ( not ( = ?auto_35464 ?auto_35463 ) ) ( not ( = ?auto_35464 ?auto_35462 ) ) ( not ( = ?auto_35466 ?auto_35463 ) ) ( not ( = ?auto_35466 ?auto_35462 ) ) ( ON ?auto_35462 ?auto_35467 ) ( CLEAR ?auto_35462 ) ( HAND-EMPTY ) ( not ( = ?auto_35462 ?auto_35467 ) ) ( not ( = ?auto_35463 ?auto_35467 ) ) ( not ( = ?auto_35465 ?auto_35467 ) ) ( not ( = ?auto_35464 ?auto_35467 ) ) ( not ( = ?auto_35466 ?auto_35467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35462 ?auto_35467 )
      ( MAKE-1PILE ?auto_35462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35468 - BLOCK
    )
    :vars
    (
      ?auto_35469 - BLOCK
      ?auto_35471 - BLOCK
      ?auto_35470 - BLOCK
      ?auto_35473 - BLOCK
      ?auto_35472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35468 ?auto_35469 ) ) ( ON-TABLE ?auto_35471 ) ( ON ?auto_35470 ?auto_35471 ) ( ON ?auto_35473 ?auto_35470 ) ( not ( = ?auto_35471 ?auto_35470 ) ) ( not ( = ?auto_35471 ?auto_35473 ) ) ( not ( = ?auto_35471 ?auto_35469 ) ) ( not ( = ?auto_35471 ?auto_35468 ) ) ( not ( = ?auto_35470 ?auto_35473 ) ) ( not ( = ?auto_35470 ?auto_35469 ) ) ( not ( = ?auto_35470 ?auto_35468 ) ) ( not ( = ?auto_35473 ?auto_35469 ) ) ( not ( = ?auto_35473 ?auto_35468 ) ) ( ON ?auto_35468 ?auto_35472 ) ( CLEAR ?auto_35468 ) ( not ( = ?auto_35468 ?auto_35472 ) ) ( not ( = ?auto_35469 ?auto_35472 ) ) ( not ( = ?auto_35471 ?auto_35472 ) ) ( not ( = ?auto_35470 ?auto_35472 ) ) ( not ( = ?auto_35473 ?auto_35472 ) ) ( HOLDING ?auto_35469 ) ( CLEAR ?auto_35473 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35471 ?auto_35470 ?auto_35473 ?auto_35469 )
      ( MAKE-1PILE ?auto_35468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35474 - BLOCK
    )
    :vars
    (
      ?auto_35476 - BLOCK
      ?auto_35475 - BLOCK
      ?auto_35478 - BLOCK
      ?auto_35479 - BLOCK
      ?auto_35477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35474 ?auto_35476 ) ) ( ON-TABLE ?auto_35475 ) ( ON ?auto_35478 ?auto_35475 ) ( ON ?auto_35479 ?auto_35478 ) ( not ( = ?auto_35475 ?auto_35478 ) ) ( not ( = ?auto_35475 ?auto_35479 ) ) ( not ( = ?auto_35475 ?auto_35476 ) ) ( not ( = ?auto_35475 ?auto_35474 ) ) ( not ( = ?auto_35478 ?auto_35479 ) ) ( not ( = ?auto_35478 ?auto_35476 ) ) ( not ( = ?auto_35478 ?auto_35474 ) ) ( not ( = ?auto_35479 ?auto_35476 ) ) ( not ( = ?auto_35479 ?auto_35474 ) ) ( ON ?auto_35474 ?auto_35477 ) ( not ( = ?auto_35474 ?auto_35477 ) ) ( not ( = ?auto_35476 ?auto_35477 ) ) ( not ( = ?auto_35475 ?auto_35477 ) ) ( not ( = ?auto_35478 ?auto_35477 ) ) ( not ( = ?auto_35479 ?auto_35477 ) ) ( CLEAR ?auto_35479 ) ( ON ?auto_35476 ?auto_35474 ) ( CLEAR ?auto_35476 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35477 ?auto_35474 )
      ( MAKE-1PILE ?auto_35474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35480 - BLOCK
    )
    :vars
    (
      ?auto_35481 - BLOCK
      ?auto_35482 - BLOCK
      ?auto_35484 - BLOCK
      ?auto_35483 - BLOCK
      ?auto_35485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35480 ?auto_35481 ) ) ( ON-TABLE ?auto_35482 ) ( ON ?auto_35484 ?auto_35482 ) ( not ( = ?auto_35482 ?auto_35484 ) ) ( not ( = ?auto_35482 ?auto_35483 ) ) ( not ( = ?auto_35482 ?auto_35481 ) ) ( not ( = ?auto_35482 ?auto_35480 ) ) ( not ( = ?auto_35484 ?auto_35483 ) ) ( not ( = ?auto_35484 ?auto_35481 ) ) ( not ( = ?auto_35484 ?auto_35480 ) ) ( not ( = ?auto_35483 ?auto_35481 ) ) ( not ( = ?auto_35483 ?auto_35480 ) ) ( ON ?auto_35480 ?auto_35485 ) ( not ( = ?auto_35480 ?auto_35485 ) ) ( not ( = ?auto_35481 ?auto_35485 ) ) ( not ( = ?auto_35482 ?auto_35485 ) ) ( not ( = ?auto_35484 ?auto_35485 ) ) ( not ( = ?auto_35483 ?auto_35485 ) ) ( ON ?auto_35481 ?auto_35480 ) ( CLEAR ?auto_35481 ) ( ON-TABLE ?auto_35485 ) ( HOLDING ?auto_35483 ) ( CLEAR ?auto_35484 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35482 ?auto_35484 ?auto_35483 )
      ( MAKE-1PILE ?auto_35480 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35486 - BLOCK
    )
    :vars
    (
      ?auto_35487 - BLOCK
      ?auto_35489 - BLOCK
      ?auto_35488 - BLOCK
      ?auto_35490 - BLOCK
      ?auto_35491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35486 ?auto_35487 ) ) ( ON-TABLE ?auto_35489 ) ( ON ?auto_35488 ?auto_35489 ) ( not ( = ?auto_35489 ?auto_35488 ) ) ( not ( = ?auto_35489 ?auto_35490 ) ) ( not ( = ?auto_35489 ?auto_35487 ) ) ( not ( = ?auto_35489 ?auto_35486 ) ) ( not ( = ?auto_35488 ?auto_35490 ) ) ( not ( = ?auto_35488 ?auto_35487 ) ) ( not ( = ?auto_35488 ?auto_35486 ) ) ( not ( = ?auto_35490 ?auto_35487 ) ) ( not ( = ?auto_35490 ?auto_35486 ) ) ( ON ?auto_35486 ?auto_35491 ) ( not ( = ?auto_35486 ?auto_35491 ) ) ( not ( = ?auto_35487 ?auto_35491 ) ) ( not ( = ?auto_35489 ?auto_35491 ) ) ( not ( = ?auto_35488 ?auto_35491 ) ) ( not ( = ?auto_35490 ?auto_35491 ) ) ( ON ?auto_35487 ?auto_35486 ) ( ON-TABLE ?auto_35491 ) ( CLEAR ?auto_35488 ) ( ON ?auto_35490 ?auto_35487 ) ( CLEAR ?auto_35490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35491 ?auto_35486 ?auto_35487 )
      ( MAKE-1PILE ?auto_35486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35492 - BLOCK
    )
    :vars
    (
      ?auto_35496 - BLOCK
      ?auto_35493 - BLOCK
      ?auto_35497 - BLOCK
      ?auto_35495 - BLOCK
      ?auto_35494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35492 ?auto_35496 ) ) ( ON-TABLE ?auto_35493 ) ( not ( = ?auto_35493 ?auto_35497 ) ) ( not ( = ?auto_35493 ?auto_35495 ) ) ( not ( = ?auto_35493 ?auto_35496 ) ) ( not ( = ?auto_35493 ?auto_35492 ) ) ( not ( = ?auto_35497 ?auto_35495 ) ) ( not ( = ?auto_35497 ?auto_35496 ) ) ( not ( = ?auto_35497 ?auto_35492 ) ) ( not ( = ?auto_35495 ?auto_35496 ) ) ( not ( = ?auto_35495 ?auto_35492 ) ) ( ON ?auto_35492 ?auto_35494 ) ( not ( = ?auto_35492 ?auto_35494 ) ) ( not ( = ?auto_35496 ?auto_35494 ) ) ( not ( = ?auto_35493 ?auto_35494 ) ) ( not ( = ?auto_35497 ?auto_35494 ) ) ( not ( = ?auto_35495 ?auto_35494 ) ) ( ON ?auto_35496 ?auto_35492 ) ( ON-TABLE ?auto_35494 ) ( ON ?auto_35495 ?auto_35496 ) ( CLEAR ?auto_35495 ) ( HOLDING ?auto_35497 ) ( CLEAR ?auto_35493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35493 ?auto_35497 )
      ( MAKE-1PILE ?auto_35492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35498 - BLOCK
    )
    :vars
    (
      ?auto_35502 - BLOCK
      ?auto_35499 - BLOCK
      ?auto_35501 - BLOCK
      ?auto_35503 - BLOCK
      ?auto_35500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35498 ?auto_35502 ) ) ( ON-TABLE ?auto_35499 ) ( not ( = ?auto_35499 ?auto_35501 ) ) ( not ( = ?auto_35499 ?auto_35503 ) ) ( not ( = ?auto_35499 ?auto_35502 ) ) ( not ( = ?auto_35499 ?auto_35498 ) ) ( not ( = ?auto_35501 ?auto_35503 ) ) ( not ( = ?auto_35501 ?auto_35502 ) ) ( not ( = ?auto_35501 ?auto_35498 ) ) ( not ( = ?auto_35503 ?auto_35502 ) ) ( not ( = ?auto_35503 ?auto_35498 ) ) ( ON ?auto_35498 ?auto_35500 ) ( not ( = ?auto_35498 ?auto_35500 ) ) ( not ( = ?auto_35502 ?auto_35500 ) ) ( not ( = ?auto_35499 ?auto_35500 ) ) ( not ( = ?auto_35501 ?auto_35500 ) ) ( not ( = ?auto_35503 ?auto_35500 ) ) ( ON ?auto_35502 ?auto_35498 ) ( ON-TABLE ?auto_35500 ) ( ON ?auto_35503 ?auto_35502 ) ( CLEAR ?auto_35499 ) ( ON ?auto_35501 ?auto_35503 ) ( CLEAR ?auto_35501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35500 ?auto_35498 ?auto_35502 ?auto_35503 )
      ( MAKE-1PILE ?auto_35498 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35504 - BLOCK
    )
    :vars
    (
      ?auto_35508 - BLOCK
      ?auto_35509 - BLOCK
      ?auto_35507 - BLOCK
      ?auto_35505 - BLOCK
      ?auto_35506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35504 ?auto_35508 ) ) ( not ( = ?auto_35509 ?auto_35507 ) ) ( not ( = ?auto_35509 ?auto_35505 ) ) ( not ( = ?auto_35509 ?auto_35508 ) ) ( not ( = ?auto_35509 ?auto_35504 ) ) ( not ( = ?auto_35507 ?auto_35505 ) ) ( not ( = ?auto_35507 ?auto_35508 ) ) ( not ( = ?auto_35507 ?auto_35504 ) ) ( not ( = ?auto_35505 ?auto_35508 ) ) ( not ( = ?auto_35505 ?auto_35504 ) ) ( ON ?auto_35504 ?auto_35506 ) ( not ( = ?auto_35504 ?auto_35506 ) ) ( not ( = ?auto_35508 ?auto_35506 ) ) ( not ( = ?auto_35509 ?auto_35506 ) ) ( not ( = ?auto_35507 ?auto_35506 ) ) ( not ( = ?auto_35505 ?auto_35506 ) ) ( ON ?auto_35508 ?auto_35504 ) ( ON-TABLE ?auto_35506 ) ( ON ?auto_35505 ?auto_35508 ) ( ON ?auto_35507 ?auto_35505 ) ( CLEAR ?auto_35507 ) ( HOLDING ?auto_35509 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35509 )
      ( MAKE-1PILE ?auto_35504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35510 - BLOCK
    )
    :vars
    (
      ?auto_35513 - BLOCK
      ?auto_35512 - BLOCK
      ?auto_35515 - BLOCK
      ?auto_35511 - BLOCK
      ?auto_35514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35510 ?auto_35513 ) ) ( not ( = ?auto_35512 ?auto_35515 ) ) ( not ( = ?auto_35512 ?auto_35511 ) ) ( not ( = ?auto_35512 ?auto_35513 ) ) ( not ( = ?auto_35512 ?auto_35510 ) ) ( not ( = ?auto_35515 ?auto_35511 ) ) ( not ( = ?auto_35515 ?auto_35513 ) ) ( not ( = ?auto_35515 ?auto_35510 ) ) ( not ( = ?auto_35511 ?auto_35513 ) ) ( not ( = ?auto_35511 ?auto_35510 ) ) ( ON ?auto_35510 ?auto_35514 ) ( not ( = ?auto_35510 ?auto_35514 ) ) ( not ( = ?auto_35513 ?auto_35514 ) ) ( not ( = ?auto_35512 ?auto_35514 ) ) ( not ( = ?auto_35515 ?auto_35514 ) ) ( not ( = ?auto_35511 ?auto_35514 ) ) ( ON ?auto_35513 ?auto_35510 ) ( ON-TABLE ?auto_35514 ) ( ON ?auto_35511 ?auto_35513 ) ( ON ?auto_35515 ?auto_35511 ) ( ON ?auto_35512 ?auto_35515 ) ( CLEAR ?auto_35512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35514 ?auto_35510 ?auto_35513 ?auto_35511 ?auto_35515 )
      ( MAKE-1PILE ?auto_35510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35519 - BLOCK
      ?auto_35520 - BLOCK
      ?auto_35521 - BLOCK
    )
    :vars
    (
      ?auto_35522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35522 ?auto_35521 ) ( CLEAR ?auto_35522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35519 ) ( ON ?auto_35520 ?auto_35519 ) ( ON ?auto_35521 ?auto_35520 ) ( not ( = ?auto_35519 ?auto_35520 ) ) ( not ( = ?auto_35519 ?auto_35521 ) ) ( not ( = ?auto_35519 ?auto_35522 ) ) ( not ( = ?auto_35520 ?auto_35521 ) ) ( not ( = ?auto_35520 ?auto_35522 ) ) ( not ( = ?auto_35521 ?auto_35522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35522 ?auto_35521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35523 - BLOCK
      ?auto_35524 - BLOCK
      ?auto_35525 - BLOCK
    )
    :vars
    (
      ?auto_35526 - BLOCK
      ?auto_35527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35526 ?auto_35525 ) ( CLEAR ?auto_35526 ) ( ON-TABLE ?auto_35523 ) ( ON ?auto_35524 ?auto_35523 ) ( ON ?auto_35525 ?auto_35524 ) ( not ( = ?auto_35523 ?auto_35524 ) ) ( not ( = ?auto_35523 ?auto_35525 ) ) ( not ( = ?auto_35523 ?auto_35526 ) ) ( not ( = ?auto_35524 ?auto_35525 ) ) ( not ( = ?auto_35524 ?auto_35526 ) ) ( not ( = ?auto_35525 ?auto_35526 ) ) ( HOLDING ?auto_35527 ) ( not ( = ?auto_35523 ?auto_35527 ) ) ( not ( = ?auto_35524 ?auto_35527 ) ) ( not ( = ?auto_35525 ?auto_35527 ) ) ( not ( = ?auto_35526 ?auto_35527 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_35527 )
      ( MAKE-3PILE ?auto_35523 ?auto_35524 ?auto_35525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35528 - BLOCK
      ?auto_35529 - BLOCK
      ?auto_35530 - BLOCK
    )
    :vars
    (
      ?auto_35532 - BLOCK
      ?auto_35531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35532 ?auto_35530 ) ( ON-TABLE ?auto_35528 ) ( ON ?auto_35529 ?auto_35528 ) ( ON ?auto_35530 ?auto_35529 ) ( not ( = ?auto_35528 ?auto_35529 ) ) ( not ( = ?auto_35528 ?auto_35530 ) ) ( not ( = ?auto_35528 ?auto_35532 ) ) ( not ( = ?auto_35529 ?auto_35530 ) ) ( not ( = ?auto_35529 ?auto_35532 ) ) ( not ( = ?auto_35530 ?auto_35532 ) ) ( not ( = ?auto_35528 ?auto_35531 ) ) ( not ( = ?auto_35529 ?auto_35531 ) ) ( not ( = ?auto_35530 ?auto_35531 ) ) ( not ( = ?auto_35532 ?auto_35531 ) ) ( ON ?auto_35531 ?auto_35532 ) ( CLEAR ?auto_35531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35528 ?auto_35529 ?auto_35530 ?auto_35532 )
      ( MAKE-3PILE ?auto_35528 ?auto_35529 ?auto_35530 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35533 - BLOCK
      ?auto_35534 - BLOCK
      ?auto_35535 - BLOCK
    )
    :vars
    (
      ?auto_35537 - BLOCK
      ?auto_35536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35537 ?auto_35535 ) ( ON-TABLE ?auto_35533 ) ( ON ?auto_35534 ?auto_35533 ) ( ON ?auto_35535 ?auto_35534 ) ( not ( = ?auto_35533 ?auto_35534 ) ) ( not ( = ?auto_35533 ?auto_35535 ) ) ( not ( = ?auto_35533 ?auto_35537 ) ) ( not ( = ?auto_35534 ?auto_35535 ) ) ( not ( = ?auto_35534 ?auto_35537 ) ) ( not ( = ?auto_35535 ?auto_35537 ) ) ( not ( = ?auto_35533 ?auto_35536 ) ) ( not ( = ?auto_35534 ?auto_35536 ) ) ( not ( = ?auto_35535 ?auto_35536 ) ) ( not ( = ?auto_35537 ?auto_35536 ) ) ( HOLDING ?auto_35536 ) ( CLEAR ?auto_35537 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35533 ?auto_35534 ?auto_35535 ?auto_35537 ?auto_35536 )
      ( MAKE-3PILE ?auto_35533 ?auto_35534 ?auto_35535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35538 - BLOCK
      ?auto_35539 - BLOCK
      ?auto_35540 - BLOCK
    )
    :vars
    (
      ?auto_35541 - BLOCK
      ?auto_35542 - BLOCK
      ?auto_35543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35541 ?auto_35540 ) ( ON-TABLE ?auto_35538 ) ( ON ?auto_35539 ?auto_35538 ) ( ON ?auto_35540 ?auto_35539 ) ( not ( = ?auto_35538 ?auto_35539 ) ) ( not ( = ?auto_35538 ?auto_35540 ) ) ( not ( = ?auto_35538 ?auto_35541 ) ) ( not ( = ?auto_35539 ?auto_35540 ) ) ( not ( = ?auto_35539 ?auto_35541 ) ) ( not ( = ?auto_35540 ?auto_35541 ) ) ( not ( = ?auto_35538 ?auto_35542 ) ) ( not ( = ?auto_35539 ?auto_35542 ) ) ( not ( = ?auto_35540 ?auto_35542 ) ) ( not ( = ?auto_35541 ?auto_35542 ) ) ( CLEAR ?auto_35541 ) ( ON ?auto_35542 ?auto_35543 ) ( CLEAR ?auto_35542 ) ( HAND-EMPTY ) ( not ( = ?auto_35538 ?auto_35543 ) ) ( not ( = ?auto_35539 ?auto_35543 ) ) ( not ( = ?auto_35540 ?auto_35543 ) ) ( not ( = ?auto_35541 ?auto_35543 ) ) ( not ( = ?auto_35542 ?auto_35543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35542 ?auto_35543 )
      ( MAKE-3PILE ?auto_35538 ?auto_35539 ?auto_35540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35556 - BLOCK
      ?auto_35557 - BLOCK
      ?auto_35558 - BLOCK
    )
    :vars
    (
      ?auto_35559 - BLOCK
      ?auto_35561 - BLOCK
      ?auto_35560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35556 ) ( ON ?auto_35557 ?auto_35556 ) ( not ( = ?auto_35556 ?auto_35557 ) ) ( not ( = ?auto_35556 ?auto_35558 ) ) ( not ( = ?auto_35556 ?auto_35559 ) ) ( not ( = ?auto_35557 ?auto_35558 ) ) ( not ( = ?auto_35557 ?auto_35559 ) ) ( not ( = ?auto_35558 ?auto_35559 ) ) ( not ( = ?auto_35556 ?auto_35561 ) ) ( not ( = ?auto_35557 ?auto_35561 ) ) ( not ( = ?auto_35558 ?auto_35561 ) ) ( not ( = ?auto_35559 ?auto_35561 ) ) ( ON ?auto_35561 ?auto_35560 ) ( not ( = ?auto_35556 ?auto_35560 ) ) ( not ( = ?auto_35557 ?auto_35560 ) ) ( not ( = ?auto_35558 ?auto_35560 ) ) ( not ( = ?auto_35559 ?auto_35560 ) ) ( not ( = ?auto_35561 ?auto_35560 ) ) ( ON ?auto_35559 ?auto_35561 ) ( CLEAR ?auto_35559 ) ( HOLDING ?auto_35558 ) ( CLEAR ?auto_35557 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35556 ?auto_35557 ?auto_35558 ?auto_35559 )
      ( MAKE-3PILE ?auto_35556 ?auto_35557 ?auto_35558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35562 - BLOCK
      ?auto_35563 - BLOCK
      ?auto_35564 - BLOCK
    )
    :vars
    (
      ?auto_35565 - BLOCK
      ?auto_35567 - BLOCK
      ?auto_35566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35562 ) ( ON ?auto_35563 ?auto_35562 ) ( not ( = ?auto_35562 ?auto_35563 ) ) ( not ( = ?auto_35562 ?auto_35564 ) ) ( not ( = ?auto_35562 ?auto_35565 ) ) ( not ( = ?auto_35563 ?auto_35564 ) ) ( not ( = ?auto_35563 ?auto_35565 ) ) ( not ( = ?auto_35564 ?auto_35565 ) ) ( not ( = ?auto_35562 ?auto_35567 ) ) ( not ( = ?auto_35563 ?auto_35567 ) ) ( not ( = ?auto_35564 ?auto_35567 ) ) ( not ( = ?auto_35565 ?auto_35567 ) ) ( ON ?auto_35567 ?auto_35566 ) ( not ( = ?auto_35562 ?auto_35566 ) ) ( not ( = ?auto_35563 ?auto_35566 ) ) ( not ( = ?auto_35564 ?auto_35566 ) ) ( not ( = ?auto_35565 ?auto_35566 ) ) ( not ( = ?auto_35567 ?auto_35566 ) ) ( ON ?auto_35565 ?auto_35567 ) ( CLEAR ?auto_35563 ) ( ON ?auto_35564 ?auto_35565 ) ( CLEAR ?auto_35564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35566 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35566 ?auto_35567 ?auto_35565 )
      ( MAKE-3PILE ?auto_35562 ?auto_35563 ?auto_35564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35568 - BLOCK
      ?auto_35569 - BLOCK
      ?auto_35570 - BLOCK
    )
    :vars
    (
      ?auto_35573 - BLOCK
      ?auto_35572 - BLOCK
      ?auto_35571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35568 ) ( not ( = ?auto_35568 ?auto_35569 ) ) ( not ( = ?auto_35568 ?auto_35570 ) ) ( not ( = ?auto_35568 ?auto_35573 ) ) ( not ( = ?auto_35569 ?auto_35570 ) ) ( not ( = ?auto_35569 ?auto_35573 ) ) ( not ( = ?auto_35570 ?auto_35573 ) ) ( not ( = ?auto_35568 ?auto_35572 ) ) ( not ( = ?auto_35569 ?auto_35572 ) ) ( not ( = ?auto_35570 ?auto_35572 ) ) ( not ( = ?auto_35573 ?auto_35572 ) ) ( ON ?auto_35572 ?auto_35571 ) ( not ( = ?auto_35568 ?auto_35571 ) ) ( not ( = ?auto_35569 ?auto_35571 ) ) ( not ( = ?auto_35570 ?auto_35571 ) ) ( not ( = ?auto_35573 ?auto_35571 ) ) ( not ( = ?auto_35572 ?auto_35571 ) ) ( ON ?auto_35573 ?auto_35572 ) ( ON ?auto_35570 ?auto_35573 ) ( CLEAR ?auto_35570 ) ( ON-TABLE ?auto_35571 ) ( HOLDING ?auto_35569 ) ( CLEAR ?auto_35568 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35568 ?auto_35569 )
      ( MAKE-3PILE ?auto_35568 ?auto_35569 ?auto_35570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35574 - BLOCK
      ?auto_35575 - BLOCK
      ?auto_35576 - BLOCK
    )
    :vars
    (
      ?auto_35579 - BLOCK
      ?auto_35577 - BLOCK
      ?auto_35578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35574 ) ( not ( = ?auto_35574 ?auto_35575 ) ) ( not ( = ?auto_35574 ?auto_35576 ) ) ( not ( = ?auto_35574 ?auto_35579 ) ) ( not ( = ?auto_35575 ?auto_35576 ) ) ( not ( = ?auto_35575 ?auto_35579 ) ) ( not ( = ?auto_35576 ?auto_35579 ) ) ( not ( = ?auto_35574 ?auto_35577 ) ) ( not ( = ?auto_35575 ?auto_35577 ) ) ( not ( = ?auto_35576 ?auto_35577 ) ) ( not ( = ?auto_35579 ?auto_35577 ) ) ( ON ?auto_35577 ?auto_35578 ) ( not ( = ?auto_35574 ?auto_35578 ) ) ( not ( = ?auto_35575 ?auto_35578 ) ) ( not ( = ?auto_35576 ?auto_35578 ) ) ( not ( = ?auto_35579 ?auto_35578 ) ) ( not ( = ?auto_35577 ?auto_35578 ) ) ( ON ?auto_35579 ?auto_35577 ) ( ON ?auto_35576 ?auto_35579 ) ( ON-TABLE ?auto_35578 ) ( CLEAR ?auto_35574 ) ( ON ?auto_35575 ?auto_35576 ) ( CLEAR ?auto_35575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35578 ?auto_35577 ?auto_35579 ?auto_35576 )
      ( MAKE-3PILE ?auto_35574 ?auto_35575 ?auto_35576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35580 - BLOCK
      ?auto_35581 - BLOCK
      ?auto_35582 - BLOCK
    )
    :vars
    (
      ?auto_35584 - BLOCK
      ?auto_35583 - BLOCK
      ?auto_35585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35580 ?auto_35581 ) ) ( not ( = ?auto_35580 ?auto_35582 ) ) ( not ( = ?auto_35580 ?auto_35584 ) ) ( not ( = ?auto_35581 ?auto_35582 ) ) ( not ( = ?auto_35581 ?auto_35584 ) ) ( not ( = ?auto_35582 ?auto_35584 ) ) ( not ( = ?auto_35580 ?auto_35583 ) ) ( not ( = ?auto_35581 ?auto_35583 ) ) ( not ( = ?auto_35582 ?auto_35583 ) ) ( not ( = ?auto_35584 ?auto_35583 ) ) ( ON ?auto_35583 ?auto_35585 ) ( not ( = ?auto_35580 ?auto_35585 ) ) ( not ( = ?auto_35581 ?auto_35585 ) ) ( not ( = ?auto_35582 ?auto_35585 ) ) ( not ( = ?auto_35584 ?auto_35585 ) ) ( not ( = ?auto_35583 ?auto_35585 ) ) ( ON ?auto_35584 ?auto_35583 ) ( ON ?auto_35582 ?auto_35584 ) ( ON-TABLE ?auto_35585 ) ( ON ?auto_35581 ?auto_35582 ) ( CLEAR ?auto_35581 ) ( HOLDING ?auto_35580 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35580 )
      ( MAKE-3PILE ?auto_35580 ?auto_35581 ?auto_35582 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35586 - BLOCK
      ?auto_35587 - BLOCK
      ?auto_35588 - BLOCK
    )
    :vars
    (
      ?auto_35589 - BLOCK
      ?auto_35590 - BLOCK
      ?auto_35591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35586 ?auto_35587 ) ) ( not ( = ?auto_35586 ?auto_35588 ) ) ( not ( = ?auto_35586 ?auto_35589 ) ) ( not ( = ?auto_35587 ?auto_35588 ) ) ( not ( = ?auto_35587 ?auto_35589 ) ) ( not ( = ?auto_35588 ?auto_35589 ) ) ( not ( = ?auto_35586 ?auto_35590 ) ) ( not ( = ?auto_35587 ?auto_35590 ) ) ( not ( = ?auto_35588 ?auto_35590 ) ) ( not ( = ?auto_35589 ?auto_35590 ) ) ( ON ?auto_35590 ?auto_35591 ) ( not ( = ?auto_35586 ?auto_35591 ) ) ( not ( = ?auto_35587 ?auto_35591 ) ) ( not ( = ?auto_35588 ?auto_35591 ) ) ( not ( = ?auto_35589 ?auto_35591 ) ) ( not ( = ?auto_35590 ?auto_35591 ) ) ( ON ?auto_35589 ?auto_35590 ) ( ON ?auto_35588 ?auto_35589 ) ( ON-TABLE ?auto_35591 ) ( ON ?auto_35587 ?auto_35588 ) ( ON ?auto_35586 ?auto_35587 ) ( CLEAR ?auto_35586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35591 ?auto_35590 ?auto_35589 ?auto_35588 ?auto_35587 )
      ( MAKE-3PILE ?auto_35586 ?auto_35587 ?auto_35588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35594 - BLOCK
      ?auto_35595 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35595 ) ( CLEAR ?auto_35594 ) ( ON-TABLE ?auto_35594 ) ( not ( = ?auto_35594 ?auto_35595 ) ) )
    :subtasks
    ( ( !STACK ?auto_35595 ?auto_35594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35596 - BLOCK
      ?auto_35597 - BLOCK
    )
    :vars
    (
      ?auto_35598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35596 ) ( ON-TABLE ?auto_35596 ) ( not ( = ?auto_35596 ?auto_35597 ) ) ( ON ?auto_35597 ?auto_35598 ) ( CLEAR ?auto_35597 ) ( HAND-EMPTY ) ( not ( = ?auto_35596 ?auto_35598 ) ) ( not ( = ?auto_35597 ?auto_35598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35597 ?auto_35598 )
      ( MAKE-2PILE ?auto_35596 ?auto_35597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35599 - BLOCK
      ?auto_35600 - BLOCK
    )
    :vars
    (
      ?auto_35601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35599 ?auto_35600 ) ) ( ON ?auto_35600 ?auto_35601 ) ( CLEAR ?auto_35600 ) ( not ( = ?auto_35599 ?auto_35601 ) ) ( not ( = ?auto_35600 ?auto_35601 ) ) ( HOLDING ?auto_35599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35599 )
      ( MAKE-2PILE ?auto_35599 ?auto_35600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35602 - BLOCK
      ?auto_35603 - BLOCK
    )
    :vars
    (
      ?auto_35604 - BLOCK
      ?auto_35606 - BLOCK
      ?auto_35605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35602 ?auto_35603 ) ) ( ON ?auto_35603 ?auto_35604 ) ( not ( = ?auto_35602 ?auto_35604 ) ) ( not ( = ?auto_35603 ?auto_35604 ) ) ( ON ?auto_35602 ?auto_35603 ) ( CLEAR ?auto_35602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35606 ) ( ON ?auto_35605 ?auto_35606 ) ( ON ?auto_35604 ?auto_35605 ) ( not ( = ?auto_35606 ?auto_35605 ) ) ( not ( = ?auto_35606 ?auto_35604 ) ) ( not ( = ?auto_35606 ?auto_35603 ) ) ( not ( = ?auto_35606 ?auto_35602 ) ) ( not ( = ?auto_35605 ?auto_35604 ) ) ( not ( = ?auto_35605 ?auto_35603 ) ) ( not ( = ?auto_35605 ?auto_35602 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35606 ?auto_35605 ?auto_35604 ?auto_35603 )
      ( MAKE-2PILE ?auto_35602 ?auto_35603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35607 - BLOCK
      ?auto_35608 - BLOCK
    )
    :vars
    (
      ?auto_35610 - BLOCK
      ?auto_35611 - BLOCK
      ?auto_35609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35607 ?auto_35608 ) ) ( ON ?auto_35608 ?auto_35610 ) ( not ( = ?auto_35607 ?auto_35610 ) ) ( not ( = ?auto_35608 ?auto_35610 ) ) ( ON-TABLE ?auto_35611 ) ( ON ?auto_35609 ?auto_35611 ) ( ON ?auto_35610 ?auto_35609 ) ( not ( = ?auto_35611 ?auto_35609 ) ) ( not ( = ?auto_35611 ?auto_35610 ) ) ( not ( = ?auto_35611 ?auto_35608 ) ) ( not ( = ?auto_35611 ?auto_35607 ) ) ( not ( = ?auto_35609 ?auto_35610 ) ) ( not ( = ?auto_35609 ?auto_35608 ) ) ( not ( = ?auto_35609 ?auto_35607 ) ) ( HOLDING ?auto_35607 ) ( CLEAR ?auto_35608 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35611 ?auto_35609 ?auto_35610 ?auto_35608 ?auto_35607 )
      ( MAKE-2PILE ?auto_35607 ?auto_35608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35612 - BLOCK
      ?auto_35613 - BLOCK
    )
    :vars
    (
      ?auto_35614 - BLOCK
      ?auto_35616 - BLOCK
      ?auto_35615 - BLOCK
      ?auto_35617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35612 ?auto_35613 ) ) ( ON ?auto_35613 ?auto_35614 ) ( not ( = ?auto_35612 ?auto_35614 ) ) ( not ( = ?auto_35613 ?auto_35614 ) ) ( ON-TABLE ?auto_35616 ) ( ON ?auto_35615 ?auto_35616 ) ( ON ?auto_35614 ?auto_35615 ) ( not ( = ?auto_35616 ?auto_35615 ) ) ( not ( = ?auto_35616 ?auto_35614 ) ) ( not ( = ?auto_35616 ?auto_35613 ) ) ( not ( = ?auto_35616 ?auto_35612 ) ) ( not ( = ?auto_35615 ?auto_35614 ) ) ( not ( = ?auto_35615 ?auto_35613 ) ) ( not ( = ?auto_35615 ?auto_35612 ) ) ( CLEAR ?auto_35613 ) ( ON ?auto_35612 ?auto_35617 ) ( CLEAR ?auto_35612 ) ( HAND-EMPTY ) ( not ( = ?auto_35612 ?auto_35617 ) ) ( not ( = ?auto_35613 ?auto_35617 ) ) ( not ( = ?auto_35614 ?auto_35617 ) ) ( not ( = ?auto_35616 ?auto_35617 ) ) ( not ( = ?auto_35615 ?auto_35617 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35612 ?auto_35617 )
      ( MAKE-2PILE ?auto_35612 ?auto_35613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35618 - BLOCK
      ?auto_35619 - BLOCK
    )
    :vars
    (
      ?auto_35620 - BLOCK
      ?auto_35621 - BLOCK
      ?auto_35623 - BLOCK
      ?auto_35622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35618 ?auto_35619 ) ) ( not ( = ?auto_35618 ?auto_35620 ) ) ( not ( = ?auto_35619 ?auto_35620 ) ) ( ON-TABLE ?auto_35621 ) ( ON ?auto_35623 ?auto_35621 ) ( ON ?auto_35620 ?auto_35623 ) ( not ( = ?auto_35621 ?auto_35623 ) ) ( not ( = ?auto_35621 ?auto_35620 ) ) ( not ( = ?auto_35621 ?auto_35619 ) ) ( not ( = ?auto_35621 ?auto_35618 ) ) ( not ( = ?auto_35623 ?auto_35620 ) ) ( not ( = ?auto_35623 ?auto_35619 ) ) ( not ( = ?auto_35623 ?auto_35618 ) ) ( ON ?auto_35618 ?auto_35622 ) ( CLEAR ?auto_35618 ) ( not ( = ?auto_35618 ?auto_35622 ) ) ( not ( = ?auto_35619 ?auto_35622 ) ) ( not ( = ?auto_35620 ?auto_35622 ) ) ( not ( = ?auto_35621 ?auto_35622 ) ) ( not ( = ?auto_35623 ?auto_35622 ) ) ( HOLDING ?auto_35619 ) ( CLEAR ?auto_35620 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35621 ?auto_35623 ?auto_35620 ?auto_35619 )
      ( MAKE-2PILE ?auto_35618 ?auto_35619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35624 - BLOCK
      ?auto_35625 - BLOCK
    )
    :vars
    (
      ?auto_35629 - BLOCK
      ?auto_35628 - BLOCK
      ?auto_35627 - BLOCK
      ?auto_35626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35624 ?auto_35625 ) ) ( not ( = ?auto_35624 ?auto_35629 ) ) ( not ( = ?auto_35625 ?auto_35629 ) ) ( ON-TABLE ?auto_35628 ) ( ON ?auto_35627 ?auto_35628 ) ( ON ?auto_35629 ?auto_35627 ) ( not ( = ?auto_35628 ?auto_35627 ) ) ( not ( = ?auto_35628 ?auto_35629 ) ) ( not ( = ?auto_35628 ?auto_35625 ) ) ( not ( = ?auto_35628 ?auto_35624 ) ) ( not ( = ?auto_35627 ?auto_35629 ) ) ( not ( = ?auto_35627 ?auto_35625 ) ) ( not ( = ?auto_35627 ?auto_35624 ) ) ( ON ?auto_35624 ?auto_35626 ) ( not ( = ?auto_35624 ?auto_35626 ) ) ( not ( = ?auto_35625 ?auto_35626 ) ) ( not ( = ?auto_35629 ?auto_35626 ) ) ( not ( = ?auto_35628 ?auto_35626 ) ) ( not ( = ?auto_35627 ?auto_35626 ) ) ( CLEAR ?auto_35629 ) ( ON ?auto_35625 ?auto_35624 ) ( CLEAR ?auto_35625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35626 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35626 ?auto_35624 )
      ( MAKE-2PILE ?auto_35624 ?auto_35625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35630 - BLOCK
      ?auto_35631 - BLOCK
    )
    :vars
    (
      ?auto_35632 - BLOCK
      ?auto_35633 - BLOCK
      ?auto_35634 - BLOCK
      ?auto_35635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35630 ?auto_35631 ) ) ( not ( = ?auto_35630 ?auto_35632 ) ) ( not ( = ?auto_35631 ?auto_35632 ) ) ( ON-TABLE ?auto_35633 ) ( ON ?auto_35634 ?auto_35633 ) ( not ( = ?auto_35633 ?auto_35634 ) ) ( not ( = ?auto_35633 ?auto_35632 ) ) ( not ( = ?auto_35633 ?auto_35631 ) ) ( not ( = ?auto_35633 ?auto_35630 ) ) ( not ( = ?auto_35634 ?auto_35632 ) ) ( not ( = ?auto_35634 ?auto_35631 ) ) ( not ( = ?auto_35634 ?auto_35630 ) ) ( ON ?auto_35630 ?auto_35635 ) ( not ( = ?auto_35630 ?auto_35635 ) ) ( not ( = ?auto_35631 ?auto_35635 ) ) ( not ( = ?auto_35632 ?auto_35635 ) ) ( not ( = ?auto_35633 ?auto_35635 ) ) ( not ( = ?auto_35634 ?auto_35635 ) ) ( ON ?auto_35631 ?auto_35630 ) ( CLEAR ?auto_35631 ) ( ON-TABLE ?auto_35635 ) ( HOLDING ?auto_35632 ) ( CLEAR ?auto_35634 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35633 ?auto_35634 ?auto_35632 )
      ( MAKE-2PILE ?auto_35630 ?auto_35631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35636 - BLOCK
      ?auto_35637 - BLOCK
    )
    :vars
    (
      ?auto_35638 - BLOCK
      ?auto_35641 - BLOCK
      ?auto_35639 - BLOCK
      ?auto_35640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35636 ?auto_35637 ) ) ( not ( = ?auto_35636 ?auto_35638 ) ) ( not ( = ?auto_35637 ?auto_35638 ) ) ( ON-TABLE ?auto_35641 ) ( ON ?auto_35639 ?auto_35641 ) ( not ( = ?auto_35641 ?auto_35639 ) ) ( not ( = ?auto_35641 ?auto_35638 ) ) ( not ( = ?auto_35641 ?auto_35637 ) ) ( not ( = ?auto_35641 ?auto_35636 ) ) ( not ( = ?auto_35639 ?auto_35638 ) ) ( not ( = ?auto_35639 ?auto_35637 ) ) ( not ( = ?auto_35639 ?auto_35636 ) ) ( ON ?auto_35636 ?auto_35640 ) ( not ( = ?auto_35636 ?auto_35640 ) ) ( not ( = ?auto_35637 ?auto_35640 ) ) ( not ( = ?auto_35638 ?auto_35640 ) ) ( not ( = ?auto_35641 ?auto_35640 ) ) ( not ( = ?auto_35639 ?auto_35640 ) ) ( ON ?auto_35637 ?auto_35636 ) ( ON-TABLE ?auto_35640 ) ( CLEAR ?auto_35639 ) ( ON ?auto_35638 ?auto_35637 ) ( CLEAR ?auto_35638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35640 ?auto_35636 ?auto_35637 )
      ( MAKE-2PILE ?auto_35636 ?auto_35637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35642 - BLOCK
      ?auto_35643 - BLOCK
    )
    :vars
    (
      ?auto_35645 - BLOCK
      ?auto_35644 - BLOCK
      ?auto_35647 - BLOCK
      ?auto_35646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35642 ?auto_35643 ) ) ( not ( = ?auto_35642 ?auto_35645 ) ) ( not ( = ?auto_35643 ?auto_35645 ) ) ( ON-TABLE ?auto_35644 ) ( not ( = ?auto_35644 ?auto_35647 ) ) ( not ( = ?auto_35644 ?auto_35645 ) ) ( not ( = ?auto_35644 ?auto_35643 ) ) ( not ( = ?auto_35644 ?auto_35642 ) ) ( not ( = ?auto_35647 ?auto_35645 ) ) ( not ( = ?auto_35647 ?auto_35643 ) ) ( not ( = ?auto_35647 ?auto_35642 ) ) ( ON ?auto_35642 ?auto_35646 ) ( not ( = ?auto_35642 ?auto_35646 ) ) ( not ( = ?auto_35643 ?auto_35646 ) ) ( not ( = ?auto_35645 ?auto_35646 ) ) ( not ( = ?auto_35644 ?auto_35646 ) ) ( not ( = ?auto_35647 ?auto_35646 ) ) ( ON ?auto_35643 ?auto_35642 ) ( ON-TABLE ?auto_35646 ) ( ON ?auto_35645 ?auto_35643 ) ( CLEAR ?auto_35645 ) ( HOLDING ?auto_35647 ) ( CLEAR ?auto_35644 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35644 ?auto_35647 )
      ( MAKE-2PILE ?auto_35642 ?auto_35643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35648 - BLOCK
      ?auto_35649 - BLOCK
    )
    :vars
    (
      ?auto_35653 - BLOCK
      ?auto_35651 - BLOCK
      ?auto_35652 - BLOCK
      ?auto_35650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35648 ?auto_35649 ) ) ( not ( = ?auto_35648 ?auto_35653 ) ) ( not ( = ?auto_35649 ?auto_35653 ) ) ( ON-TABLE ?auto_35651 ) ( not ( = ?auto_35651 ?auto_35652 ) ) ( not ( = ?auto_35651 ?auto_35653 ) ) ( not ( = ?auto_35651 ?auto_35649 ) ) ( not ( = ?auto_35651 ?auto_35648 ) ) ( not ( = ?auto_35652 ?auto_35653 ) ) ( not ( = ?auto_35652 ?auto_35649 ) ) ( not ( = ?auto_35652 ?auto_35648 ) ) ( ON ?auto_35648 ?auto_35650 ) ( not ( = ?auto_35648 ?auto_35650 ) ) ( not ( = ?auto_35649 ?auto_35650 ) ) ( not ( = ?auto_35653 ?auto_35650 ) ) ( not ( = ?auto_35651 ?auto_35650 ) ) ( not ( = ?auto_35652 ?auto_35650 ) ) ( ON ?auto_35649 ?auto_35648 ) ( ON-TABLE ?auto_35650 ) ( ON ?auto_35653 ?auto_35649 ) ( CLEAR ?auto_35651 ) ( ON ?auto_35652 ?auto_35653 ) ( CLEAR ?auto_35652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35650 ?auto_35648 ?auto_35649 ?auto_35653 )
      ( MAKE-2PILE ?auto_35648 ?auto_35649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35654 - BLOCK
      ?auto_35655 - BLOCK
    )
    :vars
    (
      ?auto_35656 - BLOCK
      ?auto_35659 - BLOCK
      ?auto_35658 - BLOCK
      ?auto_35657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35654 ?auto_35655 ) ) ( not ( = ?auto_35654 ?auto_35656 ) ) ( not ( = ?auto_35655 ?auto_35656 ) ) ( not ( = ?auto_35659 ?auto_35658 ) ) ( not ( = ?auto_35659 ?auto_35656 ) ) ( not ( = ?auto_35659 ?auto_35655 ) ) ( not ( = ?auto_35659 ?auto_35654 ) ) ( not ( = ?auto_35658 ?auto_35656 ) ) ( not ( = ?auto_35658 ?auto_35655 ) ) ( not ( = ?auto_35658 ?auto_35654 ) ) ( ON ?auto_35654 ?auto_35657 ) ( not ( = ?auto_35654 ?auto_35657 ) ) ( not ( = ?auto_35655 ?auto_35657 ) ) ( not ( = ?auto_35656 ?auto_35657 ) ) ( not ( = ?auto_35659 ?auto_35657 ) ) ( not ( = ?auto_35658 ?auto_35657 ) ) ( ON ?auto_35655 ?auto_35654 ) ( ON-TABLE ?auto_35657 ) ( ON ?auto_35656 ?auto_35655 ) ( ON ?auto_35658 ?auto_35656 ) ( CLEAR ?auto_35658 ) ( HOLDING ?auto_35659 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35659 )
      ( MAKE-2PILE ?auto_35654 ?auto_35655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35660 - BLOCK
      ?auto_35661 - BLOCK
    )
    :vars
    (
      ?auto_35665 - BLOCK
      ?auto_35664 - BLOCK
      ?auto_35662 - BLOCK
      ?auto_35663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35660 ?auto_35661 ) ) ( not ( = ?auto_35660 ?auto_35665 ) ) ( not ( = ?auto_35661 ?auto_35665 ) ) ( not ( = ?auto_35664 ?auto_35662 ) ) ( not ( = ?auto_35664 ?auto_35665 ) ) ( not ( = ?auto_35664 ?auto_35661 ) ) ( not ( = ?auto_35664 ?auto_35660 ) ) ( not ( = ?auto_35662 ?auto_35665 ) ) ( not ( = ?auto_35662 ?auto_35661 ) ) ( not ( = ?auto_35662 ?auto_35660 ) ) ( ON ?auto_35660 ?auto_35663 ) ( not ( = ?auto_35660 ?auto_35663 ) ) ( not ( = ?auto_35661 ?auto_35663 ) ) ( not ( = ?auto_35665 ?auto_35663 ) ) ( not ( = ?auto_35664 ?auto_35663 ) ) ( not ( = ?auto_35662 ?auto_35663 ) ) ( ON ?auto_35661 ?auto_35660 ) ( ON-TABLE ?auto_35663 ) ( ON ?auto_35665 ?auto_35661 ) ( ON ?auto_35662 ?auto_35665 ) ( ON ?auto_35664 ?auto_35662 ) ( CLEAR ?auto_35664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35663 ?auto_35660 ?auto_35661 ?auto_35665 ?auto_35662 )
      ( MAKE-2PILE ?auto_35660 ?auto_35661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35668 - BLOCK
      ?auto_35669 - BLOCK
    )
    :vars
    (
      ?auto_35670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35670 ?auto_35669 ) ( CLEAR ?auto_35670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35668 ) ( ON ?auto_35669 ?auto_35668 ) ( not ( = ?auto_35668 ?auto_35669 ) ) ( not ( = ?auto_35668 ?auto_35670 ) ) ( not ( = ?auto_35669 ?auto_35670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35670 ?auto_35669 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35671 - BLOCK
      ?auto_35672 - BLOCK
    )
    :vars
    (
      ?auto_35673 - BLOCK
      ?auto_35674 - BLOCK
      ?auto_35675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35673 ?auto_35672 ) ( CLEAR ?auto_35673 ) ( ON-TABLE ?auto_35671 ) ( ON ?auto_35672 ?auto_35671 ) ( not ( = ?auto_35671 ?auto_35672 ) ) ( not ( = ?auto_35671 ?auto_35673 ) ) ( not ( = ?auto_35672 ?auto_35673 ) ) ( HOLDING ?auto_35674 ) ( CLEAR ?auto_35675 ) ( not ( = ?auto_35671 ?auto_35674 ) ) ( not ( = ?auto_35671 ?auto_35675 ) ) ( not ( = ?auto_35672 ?auto_35674 ) ) ( not ( = ?auto_35672 ?auto_35675 ) ) ( not ( = ?auto_35673 ?auto_35674 ) ) ( not ( = ?auto_35673 ?auto_35675 ) ) ( not ( = ?auto_35674 ?auto_35675 ) ) )
    :subtasks
    ( ( !STACK ?auto_35674 ?auto_35675 )
      ( MAKE-2PILE ?auto_35671 ?auto_35672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35676 - BLOCK
      ?auto_35677 - BLOCK
    )
    :vars
    (
      ?auto_35678 - BLOCK
      ?auto_35679 - BLOCK
      ?auto_35680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35678 ?auto_35677 ) ( ON-TABLE ?auto_35676 ) ( ON ?auto_35677 ?auto_35676 ) ( not ( = ?auto_35676 ?auto_35677 ) ) ( not ( = ?auto_35676 ?auto_35678 ) ) ( not ( = ?auto_35677 ?auto_35678 ) ) ( CLEAR ?auto_35679 ) ( not ( = ?auto_35676 ?auto_35680 ) ) ( not ( = ?auto_35676 ?auto_35679 ) ) ( not ( = ?auto_35677 ?auto_35680 ) ) ( not ( = ?auto_35677 ?auto_35679 ) ) ( not ( = ?auto_35678 ?auto_35680 ) ) ( not ( = ?auto_35678 ?auto_35679 ) ) ( not ( = ?auto_35680 ?auto_35679 ) ) ( ON ?auto_35680 ?auto_35678 ) ( CLEAR ?auto_35680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35676 ?auto_35677 ?auto_35678 )
      ( MAKE-2PILE ?auto_35676 ?auto_35677 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35681 - BLOCK
      ?auto_35682 - BLOCK
    )
    :vars
    (
      ?auto_35684 - BLOCK
      ?auto_35685 - BLOCK
      ?auto_35683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35684 ?auto_35682 ) ( ON-TABLE ?auto_35681 ) ( ON ?auto_35682 ?auto_35681 ) ( not ( = ?auto_35681 ?auto_35682 ) ) ( not ( = ?auto_35681 ?auto_35684 ) ) ( not ( = ?auto_35682 ?auto_35684 ) ) ( not ( = ?auto_35681 ?auto_35685 ) ) ( not ( = ?auto_35681 ?auto_35683 ) ) ( not ( = ?auto_35682 ?auto_35685 ) ) ( not ( = ?auto_35682 ?auto_35683 ) ) ( not ( = ?auto_35684 ?auto_35685 ) ) ( not ( = ?auto_35684 ?auto_35683 ) ) ( not ( = ?auto_35685 ?auto_35683 ) ) ( ON ?auto_35685 ?auto_35684 ) ( CLEAR ?auto_35685 ) ( HOLDING ?auto_35683 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35683 )
      ( MAKE-2PILE ?auto_35681 ?auto_35682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35686 - BLOCK
      ?auto_35687 - BLOCK
    )
    :vars
    (
      ?auto_35689 - BLOCK
      ?auto_35690 - BLOCK
      ?auto_35688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35689 ?auto_35687 ) ( ON-TABLE ?auto_35686 ) ( ON ?auto_35687 ?auto_35686 ) ( not ( = ?auto_35686 ?auto_35687 ) ) ( not ( = ?auto_35686 ?auto_35689 ) ) ( not ( = ?auto_35687 ?auto_35689 ) ) ( not ( = ?auto_35686 ?auto_35690 ) ) ( not ( = ?auto_35686 ?auto_35688 ) ) ( not ( = ?auto_35687 ?auto_35690 ) ) ( not ( = ?auto_35687 ?auto_35688 ) ) ( not ( = ?auto_35689 ?auto_35690 ) ) ( not ( = ?auto_35689 ?auto_35688 ) ) ( not ( = ?auto_35690 ?auto_35688 ) ) ( ON ?auto_35690 ?auto_35689 ) ( ON ?auto_35688 ?auto_35690 ) ( CLEAR ?auto_35688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35686 ?auto_35687 ?auto_35689 ?auto_35690 )
      ( MAKE-2PILE ?auto_35686 ?auto_35687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35691 - BLOCK
      ?auto_35692 - BLOCK
    )
    :vars
    (
      ?auto_35693 - BLOCK
      ?auto_35694 - BLOCK
      ?auto_35695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35693 ?auto_35692 ) ( ON-TABLE ?auto_35691 ) ( ON ?auto_35692 ?auto_35691 ) ( not ( = ?auto_35691 ?auto_35692 ) ) ( not ( = ?auto_35691 ?auto_35693 ) ) ( not ( = ?auto_35692 ?auto_35693 ) ) ( not ( = ?auto_35691 ?auto_35694 ) ) ( not ( = ?auto_35691 ?auto_35695 ) ) ( not ( = ?auto_35692 ?auto_35694 ) ) ( not ( = ?auto_35692 ?auto_35695 ) ) ( not ( = ?auto_35693 ?auto_35694 ) ) ( not ( = ?auto_35693 ?auto_35695 ) ) ( not ( = ?auto_35694 ?auto_35695 ) ) ( ON ?auto_35694 ?auto_35693 ) ( HOLDING ?auto_35695 ) ( CLEAR ?auto_35694 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35691 ?auto_35692 ?auto_35693 ?auto_35694 ?auto_35695 )
      ( MAKE-2PILE ?auto_35691 ?auto_35692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35696 - BLOCK
      ?auto_35697 - BLOCK
    )
    :vars
    (
      ?auto_35699 - BLOCK
      ?auto_35698 - BLOCK
      ?auto_35700 - BLOCK
      ?auto_35701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35699 ?auto_35697 ) ( ON-TABLE ?auto_35696 ) ( ON ?auto_35697 ?auto_35696 ) ( not ( = ?auto_35696 ?auto_35697 ) ) ( not ( = ?auto_35696 ?auto_35699 ) ) ( not ( = ?auto_35697 ?auto_35699 ) ) ( not ( = ?auto_35696 ?auto_35698 ) ) ( not ( = ?auto_35696 ?auto_35700 ) ) ( not ( = ?auto_35697 ?auto_35698 ) ) ( not ( = ?auto_35697 ?auto_35700 ) ) ( not ( = ?auto_35699 ?auto_35698 ) ) ( not ( = ?auto_35699 ?auto_35700 ) ) ( not ( = ?auto_35698 ?auto_35700 ) ) ( ON ?auto_35698 ?auto_35699 ) ( CLEAR ?auto_35698 ) ( ON ?auto_35700 ?auto_35701 ) ( CLEAR ?auto_35700 ) ( HAND-EMPTY ) ( not ( = ?auto_35696 ?auto_35701 ) ) ( not ( = ?auto_35697 ?auto_35701 ) ) ( not ( = ?auto_35699 ?auto_35701 ) ) ( not ( = ?auto_35698 ?auto_35701 ) ) ( not ( = ?auto_35700 ?auto_35701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35700 ?auto_35701 )
      ( MAKE-2PILE ?auto_35696 ?auto_35697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35702 - BLOCK
      ?auto_35703 - BLOCK
    )
    :vars
    (
      ?auto_35704 - BLOCK
      ?auto_35707 - BLOCK
      ?auto_35705 - BLOCK
      ?auto_35706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35704 ?auto_35703 ) ( ON-TABLE ?auto_35702 ) ( ON ?auto_35703 ?auto_35702 ) ( not ( = ?auto_35702 ?auto_35703 ) ) ( not ( = ?auto_35702 ?auto_35704 ) ) ( not ( = ?auto_35703 ?auto_35704 ) ) ( not ( = ?auto_35702 ?auto_35707 ) ) ( not ( = ?auto_35702 ?auto_35705 ) ) ( not ( = ?auto_35703 ?auto_35707 ) ) ( not ( = ?auto_35703 ?auto_35705 ) ) ( not ( = ?auto_35704 ?auto_35707 ) ) ( not ( = ?auto_35704 ?auto_35705 ) ) ( not ( = ?auto_35707 ?auto_35705 ) ) ( ON ?auto_35705 ?auto_35706 ) ( CLEAR ?auto_35705 ) ( not ( = ?auto_35702 ?auto_35706 ) ) ( not ( = ?auto_35703 ?auto_35706 ) ) ( not ( = ?auto_35704 ?auto_35706 ) ) ( not ( = ?auto_35707 ?auto_35706 ) ) ( not ( = ?auto_35705 ?auto_35706 ) ) ( HOLDING ?auto_35707 ) ( CLEAR ?auto_35704 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35702 ?auto_35703 ?auto_35704 ?auto_35707 )
      ( MAKE-2PILE ?auto_35702 ?auto_35703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35708 - BLOCK
      ?auto_35709 - BLOCK
    )
    :vars
    (
      ?auto_35712 - BLOCK
      ?auto_35710 - BLOCK
      ?auto_35711 - BLOCK
      ?auto_35713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35712 ?auto_35709 ) ( ON-TABLE ?auto_35708 ) ( ON ?auto_35709 ?auto_35708 ) ( not ( = ?auto_35708 ?auto_35709 ) ) ( not ( = ?auto_35708 ?auto_35712 ) ) ( not ( = ?auto_35709 ?auto_35712 ) ) ( not ( = ?auto_35708 ?auto_35710 ) ) ( not ( = ?auto_35708 ?auto_35711 ) ) ( not ( = ?auto_35709 ?auto_35710 ) ) ( not ( = ?auto_35709 ?auto_35711 ) ) ( not ( = ?auto_35712 ?auto_35710 ) ) ( not ( = ?auto_35712 ?auto_35711 ) ) ( not ( = ?auto_35710 ?auto_35711 ) ) ( ON ?auto_35711 ?auto_35713 ) ( not ( = ?auto_35708 ?auto_35713 ) ) ( not ( = ?auto_35709 ?auto_35713 ) ) ( not ( = ?auto_35712 ?auto_35713 ) ) ( not ( = ?auto_35710 ?auto_35713 ) ) ( not ( = ?auto_35711 ?auto_35713 ) ) ( CLEAR ?auto_35712 ) ( ON ?auto_35710 ?auto_35711 ) ( CLEAR ?auto_35710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35713 ?auto_35711 )
      ( MAKE-2PILE ?auto_35708 ?auto_35709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35726 - BLOCK
      ?auto_35727 - BLOCK
    )
    :vars
    (
      ?auto_35729 - BLOCK
      ?auto_35730 - BLOCK
      ?auto_35731 - BLOCK
      ?auto_35728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35726 ) ( not ( = ?auto_35726 ?auto_35727 ) ) ( not ( = ?auto_35726 ?auto_35729 ) ) ( not ( = ?auto_35727 ?auto_35729 ) ) ( not ( = ?auto_35726 ?auto_35730 ) ) ( not ( = ?auto_35726 ?auto_35731 ) ) ( not ( = ?auto_35727 ?auto_35730 ) ) ( not ( = ?auto_35727 ?auto_35731 ) ) ( not ( = ?auto_35729 ?auto_35730 ) ) ( not ( = ?auto_35729 ?auto_35731 ) ) ( not ( = ?auto_35730 ?auto_35731 ) ) ( ON ?auto_35731 ?auto_35728 ) ( not ( = ?auto_35726 ?auto_35728 ) ) ( not ( = ?auto_35727 ?auto_35728 ) ) ( not ( = ?auto_35729 ?auto_35728 ) ) ( not ( = ?auto_35730 ?auto_35728 ) ) ( not ( = ?auto_35731 ?auto_35728 ) ) ( ON ?auto_35730 ?auto_35731 ) ( ON-TABLE ?auto_35728 ) ( ON ?auto_35729 ?auto_35730 ) ( CLEAR ?auto_35729 ) ( HOLDING ?auto_35727 ) ( CLEAR ?auto_35726 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35726 ?auto_35727 ?auto_35729 )
      ( MAKE-2PILE ?auto_35726 ?auto_35727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35732 - BLOCK
      ?auto_35733 - BLOCK
    )
    :vars
    (
      ?auto_35737 - BLOCK
      ?auto_35735 - BLOCK
      ?auto_35734 - BLOCK
      ?auto_35736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35732 ) ( not ( = ?auto_35732 ?auto_35733 ) ) ( not ( = ?auto_35732 ?auto_35737 ) ) ( not ( = ?auto_35733 ?auto_35737 ) ) ( not ( = ?auto_35732 ?auto_35735 ) ) ( not ( = ?auto_35732 ?auto_35734 ) ) ( not ( = ?auto_35733 ?auto_35735 ) ) ( not ( = ?auto_35733 ?auto_35734 ) ) ( not ( = ?auto_35737 ?auto_35735 ) ) ( not ( = ?auto_35737 ?auto_35734 ) ) ( not ( = ?auto_35735 ?auto_35734 ) ) ( ON ?auto_35734 ?auto_35736 ) ( not ( = ?auto_35732 ?auto_35736 ) ) ( not ( = ?auto_35733 ?auto_35736 ) ) ( not ( = ?auto_35737 ?auto_35736 ) ) ( not ( = ?auto_35735 ?auto_35736 ) ) ( not ( = ?auto_35734 ?auto_35736 ) ) ( ON ?auto_35735 ?auto_35734 ) ( ON-TABLE ?auto_35736 ) ( ON ?auto_35737 ?auto_35735 ) ( CLEAR ?auto_35732 ) ( ON ?auto_35733 ?auto_35737 ) ( CLEAR ?auto_35733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35736 ?auto_35734 ?auto_35735 ?auto_35737 )
      ( MAKE-2PILE ?auto_35732 ?auto_35733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35738 - BLOCK
      ?auto_35739 - BLOCK
    )
    :vars
    (
      ?auto_35742 - BLOCK
      ?auto_35741 - BLOCK
      ?auto_35740 - BLOCK
      ?auto_35743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35738 ?auto_35739 ) ) ( not ( = ?auto_35738 ?auto_35742 ) ) ( not ( = ?auto_35739 ?auto_35742 ) ) ( not ( = ?auto_35738 ?auto_35741 ) ) ( not ( = ?auto_35738 ?auto_35740 ) ) ( not ( = ?auto_35739 ?auto_35741 ) ) ( not ( = ?auto_35739 ?auto_35740 ) ) ( not ( = ?auto_35742 ?auto_35741 ) ) ( not ( = ?auto_35742 ?auto_35740 ) ) ( not ( = ?auto_35741 ?auto_35740 ) ) ( ON ?auto_35740 ?auto_35743 ) ( not ( = ?auto_35738 ?auto_35743 ) ) ( not ( = ?auto_35739 ?auto_35743 ) ) ( not ( = ?auto_35742 ?auto_35743 ) ) ( not ( = ?auto_35741 ?auto_35743 ) ) ( not ( = ?auto_35740 ?auto_35743 ) ) ( ON ?auto_35741 ?auto_35740 ) ( ON-TABLE ?auto_35743 ) ( ON ?auto_35742 ?auto_35741 ) ( ON ?auto_35739 ?auto_35742 ) ( CLEAR ?auto_35739 ) ( HOLDING ?auto_35738 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35738 )
      ( MAKE-2PILE ?auto_35738 ?auto_35739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_35744 - BLOCK
      ?auto_35745 - BLOCK
    )
    :vars
    (
      ?auto_35746 - BLOCK
      ?auto_35747 - BLOCK
      ?auto_35748 - BLOCK
      ?auto_35749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35744 ?auto_35745 ) ) ( not ( = ?auto_35744 ?auto_35746 ) ) ( not ( = ?auto_35745 ?auto_35746 ) ) ( not ( = ?auto_35744 ?auto_35747 ) ) ( not ( = ?auto_35744 ?auto_35748 ) ) ( not ( = ?auto_35745 ?auto_35747 ) ) ( not ( = ?auto_35745 ?auto_35748 ) ) ( not ( = ?auto_35746 ?auto_35747 ) ) ( not ( = ?auto_35746 ?auto_35748 ) ) ( not ( = ?auto_35747 ?auto_35748 ) ) ( ON ?auto_35748 ?auto_35749 ) ( not ( = ?auto_35744 ?auto_35749 ) ) ( not ( = ?auto_35745 ?auto_35749 ) ) ( not ( = ?auto_35746 ?auto_35749 ) ) ( not ( = ?auto_35747 ?auto_35749 ) ) ( not ( = ?auto_35748 ?auto_35749 ) ) ( ON ?auto_35747 ?auto_35748 ) ( ON-TABLE ?auto_35749 ) ( ON ?auto_35746 ?auto_35747 ) ( ON ?auto_35745 ?auto_35746 ) ( ON ?auto_35744 ?auto_35745 ) ( CLEAR ?auto_35744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35749 ?auto_35748 ?auto_35747 ?auto_35746 ?auto_35745 )
      ( MAKE-2PILE ?auto_35744 ?auto_35745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35753 - BLOCK
      ?auto_35754 - BLOCK
      ?auto_35755 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35755 ) ( CLEAR ?auto_35754 ) ( ON-TABLE ?auto_35753 ) ( ON ?auto_35754 ?auto_35753 ) ( not ( = ?auto_35753 ?auto_35754 ) ) ( not ( = ?auto_35753 ?auto_35755 ) ) ( not ( = ?auto_35754 ?auto_35755 ) ) )
    :subtasks
    ( ( !STACK ?auto_35755 ?auto_35754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35756 - BLOCK
      ?auto_35757 - BLOCK
      ?auto_35758 - BLOCK
    )
    :vars
    (
      ?auto_35759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35757 ) ( ON-TABLE ?auto_35756 ) ( ON ?auto_35757 ?auto_35756 ) ( not ( = ?auto_35756 ?auto_35757 ) ) ( not ( = ?auto_35756 ?auto_35758 ) ) ( not ( = ?auto_35757 ?auto_35758 ) ) ( ON ?auto_35758 ?auto_35759 ) ( CLEAR ?auto_35758 ) ( HAND-EMPTY ) ( not ( = ?auto_35756 ?auto_35759 ) ) ( not ( = ?auto_35757 ?auto_35759 ) ) ( not ( = ?auto_35758 ?auto_35759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35758 ?auto_35759 )
      ( MAKE-3PILE ?auto_35756 ?auto_35757 ?auto_35758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35760 - BLOCK
      ?auto_35761 - BLOCK
      ?auto_35762 - BLOCK
    )
    :vars
    (
      ?auto_35763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35760 ) ( not ( = ?auto_35760 ?auto_35761 ) ) ( not ( = ?auto_35760 ?auto_35762 ) ) ( not ( = ?auto_35761 ?auto_35762 ) ) ( ON ?auto_35762 ?auto_35763 ) ( CLEAR ?auto_35762 ) ( not ( = ?auto_35760 ?auto_35763 ) ) ( not ( = ?auto_35761 ?auto_35763 ) ) ( not ( = ?auto_35762 ?auto_35763 ) ) ( HOLDING ?auto_35761 ) ( CLEAR ?auto_35760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35760 ?auto_35761 )
      ( MAKE-3PILE ?auto_35760 ?auto_35761 ?auto_35762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35764 - BLOCK
      ?auto_35765 - BLOCK
      ?auto_35766 - BLOCK
    )
    :vars
    (
      ?auto_35767 - BLOCK
      ?auto_35768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35764 ) ( not ( = ?auto_35764 ?auto_35765 ) ) ( not ( = ?auto_35764 ?auto_35766 ) ) ( not ( = ?auto_35765 ?auto_35766 ) ) ( ON ?auto_35766 ?auto_35767 ) ( not ( = ?auto_35764 ?auto_35767 ) ) ( not ( = ?auto_35765 ?auto_35767 ) ) ( not ( = ?auto_35766 ?auto_35767 ) ) ( CLEAR ?auto_35764 ) ( ON ?auto_35765 ?auto_35766 ) ( CLEAR ?auto_35765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35768 ) ( ON ?auto_35767 ?auto_35768 ) ( not ( = ?auto_35768 ?auto_35767 ) ) ( not ( = ?auto_35768 ?auto_35766 ) ) ( not ( = ?auto_35768 ?auto_35765 ) ) ( not ( = ?auto_35764 ?auto_35768 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35768 ?auto_35767 ?auto_35766 )
      ( MAKE-3PILE ?auto_35764 ?auto_35765 ?auto_35766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35769 - BLOCK
      ?auto_35770 - BLOCK
      ?auto_35771 - BLOCK
    )
    :vars
    (
      ?auto_35772 - BLOCK
      ?auto_35773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35769 ?auto_35770 ) ) ( not ( = ?auto_35769 ?auto_35771 ) ) ( not ( = ?auto_35770 ?auto_35771 ) ) ( ON ?auto_35771 ?auto_35772 ) ( not ( = ?auto_35769 ?auto_35772 ) ) ( not ( = ?auto_35770 ?auto_35772 ) ) ( not ( = ?auto_35771 ?auto_35772 ) ) ( ON ?auto_35770 ?auto_35771 ) ( CLEAR ?auto_35770 ) ( ON-TABLE ?auto_35773 ) ( ON ?auto_35772 ?auto_35773 ) ( not ( = ?auto_35773 ?auto_35772 ) ) ( not ( = ?auto_35773 ?auto_35771 ) ) ( not ( = ?auto_35773 ?auto_35770 ) ) ( not ( = ?auto_35769 ?auto_35773 ) ) ( HOLDING ?auto_35769 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35769 )
      ( MAKE-3PILE ?auto_35769 ?auto_35770 ?auto_35771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35774 - BLOCK
      ?auto_35775 - BLOCK
      ?auto_35776 - BLOCK
    )
    :vars
    (
      ?auto_35777 - BLOCK
      ?auto_35778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35774 ?auto_35775 ) ) ( not ( = ?auto_35774 ?auto_35776 ) ) ( not ( = ?auto_35775 ?auto_35776 ) ) ( ON ?auto_35776 ?auto_35777 ) ( not ( = ?auto_35774 ?auto_35777 ) ) ( not ( = ?auto_35775 ?auto_35777 ) ) ( not ( = ?auto_35776 ?auto_35777 ) ) ( ON ?auto_35775 ?auto_35776 ) ( ON-TABLE ?auto_35778 ) ( ON ?auto_35777 ?auto_35778 ) ( not ( = ?auto_35778 ?auto_35777 ) ) ( not ( = ?auto_35778 ?auto_35776 ) ) ( not ( = ?auto_35778 ?auto_35775 ) ) ( not ( = ?auto_35774 ?auto_35778 ) ) ( ON ?auto_35774 ?auto_35775 ) ( CLEAR ?auto_35774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35778 ?auto_35777 ?auto_35776 ?auto_35775 )
      ( MAKE-3PILE ?auto_35774 ?auto_35775 ?auto_35776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35779 - BLOCK
      ?auto_35780 - BLOCK
      ?auto_35781 - BLOCK
    )
    :vars
    (
      ?auto_35783 - BLOCK
      ?auto_35782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35779 ?auto_35780 ) ) ( not ( = ?auto_35779 ?auto_35781 ) ) ( not ( = ?auto_35780 ?auto_35781 ) ) ( ON ?auto_35781 ?auto_35783 ) ( not ( = ?auto_35779 ?auto_35783 ) ) ( not ( = ?auto_35780 ?auto_35783 ) ) ( not ( = ?auto_35781 ?auto_35783 ) ) ( ON ?auto_35780 ?auto_35781 ) ( ON-TABLE ?auto_35782 ) ( ON ?auto_35783 ?auto_35782 ) ( not ( = ?auto_35782 ?auto_35783 ) ) ( not ( = ?auto_35782 ?auto_35781 ) ) ( not ( = ?auto_35782 ?auto_35780 ) ) ( not ( = ?auto_35779 ?auto_35782 ) ) ( HOLDING ?auto_35779 ) ( CLEAR ?auto_35780 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35782 ?auto_35783 ?auto_35781 ?auto_35780 ?auto_35779 )
      ( MAKE-3PILE ?auto_35779 ?auto_35780 ?auto_35781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35784 - BLOCK
      ?auto_35785 - BLOCK
      ?auto_35786 - BLOCK
    )
    :vars
    (
      ?auto_35788 - BLOCK
      ?auto_35787 - BLOCK
      ?auto_35789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35784 ?auto_35785 ) ) ( not ( = ?auto_35784 ?auto_35786 ) ) ( not ( = ?auto_35785 ?auto_35786 ) ) ( ON ?auto_35786 ?auto_35788 ) ( not ( = ?auto_35784 ?auto_35788 ) ) ( not ( = ?auto_35785 ?auto_35788 ) ) ( not ( = ?auto_35786 ?auto_35788 ) ) ( ON ?auto_35785 ?auto_35786 ) ( ON-TABLE ?auto_35787 ) ( ON ?auto_35788 ?auto_35787 ) ( not ( = ?auto_35787 ?auto_35788 ) ) ( not ( = ?auto_35787 ?auto_35786 ) ) ( not ( = ?auto_35787 ?auto_35785 ) ) ( not ( = ?auto_35784 ?auto_35787 ) ) ( CLEAR ?auto_35785 ) ( ON ?auto_35784 ?auto_35789 ) ( CLEAR ?auto_35784 ) ( HAND-EMPTY ) ( not ( = ?auto_35784 ?auto_35789 ) ) ( not ( = ?auto_35785 ?auto_35789 ) ) ( not ( = ?auto_35786 ?auto_35789 ) ) ( not ( = ?auto_35788 ?auto_35789 ) ) ( not ( = ?auto_35787 ?auto_35789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35784 ?auto_35789 )
      ( MAKE-3PILE ?auto_35784 ?auto_35785 ?auto_35786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35790 - BLOCK
      ?auto_35791 - BLOCK
      ?auto_35792 - BLOCK
    )
    :vars
    (
      ?auto_35794 - BLOCK
      ?auto_35793 - BLOCK
      ?auto_35795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35790 ?auto_35791 ) ) ( not ( = ?auto_35790 ?auto_35792 ) ) ( not ( = ?auto_35791 ?auto_35792 ) ) ( ON ?auto_35792 ?auto_35794 ) ( not ( = ?auto_35790 ?auto_35794 ) ) ( not ( = ?auto_35791 ?auto_35794 ) ) ( not ( = ?auto_35792 ?auto_35794 ) ) ( ON-TABLE ?auto_35793 ) ( ON ?auto_35794 ?auto_35793 ) ( not ( = ?auto_35793 ?auto_35794 ) ) ( not ( = ?auto_35793 ?auto_35792 ) ) ( not ( = ?auto_35793 ?auto_35791 ) ) ( not ( = ?auto_35790 ?auto_35793 ) ) ( ON ?auto_35790 ?auto_35795 ) ( CLEAR ?auto_35790 ) ( not ( = ?auto_35790 ?auto_35795 ) ) ( not ( = ?auto_35791 ?auto_35795 ) ) ( not ( = ?auto_35792 ?auto_35795 ) ) ( not ( = ?auto_35794 ?auto_35795 ) ) ( not ( = ?auto_35793 ?auto_35795 ) ) ( HOLDING ?auto_35791 ) ( CLEAR ?auto_35792 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35793 ?auto_35794 ?auto_35792 ?auto_35791 )
      ( MAKE-3PILE ?auto_35790 ?auto_35791 ?auto_35792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35796 - BLOCK
      ?auto_35797 - BLOCK
      ?auto_35798 - BLOCK
    )
    :vars
    (
      ?auto_35800 - BLOCK
      ?auto_35801 - BLOCK
      ?auto_35799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35796 ?auto_35797 ) ) ( not ( = ?auto_35796 ?auto_35798 ) ) ( not ( = ?auto_35797 ?auto_35798 ) ) ( ON ?auto_35798 ?auto_35800 ) ( not ( = ?auto_35796 ?auto_35800 ) ) ( not ( = ?auto_35797 ?auto_35800 ) ) ( not ( = ?auto_35798 ?auto_35800 ) ) ( ON-TABLE ?auto_35801 ) ( ON ?auto_35800 ?auto_35801 ) ( not ( = ?auto_35801 ?auto_35800 ) ) ( not ( = ?auto_35801 ?auto_35798 ) ) ( not ( = ?auto_35801 ?auto_35797 ) ) ( not ( = ?auto_35796 ?auto_35801 ) ) ( ON ?auto_35796 ?auto_35799 ) ( not ( = ?auto_35796 ?auto_35799 ) ) ( not ( = ?auto_35797 ?auto_35799 ) ) ( not ( = ?auto_35798 ?auto_35799 ) ) ( not ( = ?auto_35800 ?auto_35799 ) ) ( not ( = ?auto_35801 ?auto_35799 ) ) ( CLEAR ?auto_35798 ) ( ON ?auto_35797 ?auto_35796 ) ( CLEAR ?auto_35797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35799 ?auto_35796 )
      ( MAKE-3PILE ?auto_35796 ?auto_35797 ?auto_35798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35802 - BLOCK
      ?auto_35803 - BLOCK
      ?auto_35804 - BLOCK
    )
    :vars
    (
      ?auto_35807 - BLOCK
      ?auto_35806 - BLOCK
      ?auto_35805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35802 ?auto_35803 ) ) ( not ( = ?auto_35802 ?auto_35804 ) ) ( not ( = ?auto_35803 ?auto_35804 ) ) ( not ( = ?auto_35802 ?auto_35807 ) ) ( not ( = ?auto_35803 ?auto_35807 ) ) ( not ( = ?auto_35804 ?auto_35807 ) ) ( ON-TABLE ?auto_35806 ) ( ON ?auto_35807 ?auto_35806 ) ( not ( = ?auto_35806 ?auto_35807 ) ) ( not ( = ?auto_35806 ?auto_35804 ) ) ( not ( = ?auto_35806 ?auto_35803 ) ) ( not ( = ?auto_35802 ?auto_35806 ) ) ( ON ?auto_35802 ?auto_35805 ) ( not ( = ?auto_35802 ?auto_35805 ) ) ( not ( = ?auto_35803 ?auto_35805 ) ) ( not ( = ?auto_35804 ?auto_35805 ) ) ( not ( = ?auto_35807 ?auto_35805 ) ) ( not ( = ?auto_35806 ?auto_35805 ) ) ( ON ?auto_35803 ?auto_35802 ) ( CLEAR ?auto_35803 ) ( ON-TABLE ?auto_35805 ) ( HOLDING ?auto_35804 ) ( CLEAR ?auto_35807 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35806 ?auto_35807 ?auto_35804 )
      ( MAKE-3PILE ?auto_35802 ?auto_35803 ?auto_35804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35808 - BLOCK
      ?auto_35809 - BLOCK
      ?auto_35810 - BLOCK
    )
    :vars
    (
      ?auto_35812 - BLOCK
      ?auto_35811 - BLOCK
      ?auto_35813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35808 ?auto_35809 ) ) ( not ( = ?auto_35808 ?auto_35810 ) ) ( not ( = ?auto_35809 ?auto_35810 ) ) ( not ( = ?auto_35808 ?auto_35812 ) ) ( not ( = ?auto_35809 ?auto_35812 ) ) ( not ( = ?auto_35810 ?auto_35812 ) ) ( ON-TABLE ?auto_35811 ) ( ON ?auto_35812 ?auto_35811 ) ( not ( = ?auto_35811 ?auto_35812 ) ) ( not ( = ?auto_35811 ?auto_35810 ) ) ( not ( = ?auto_35811 ?auto_35809 ) ) ( not ( = ?auto_35808 ?auto_35811 ) ) ( ON ?auto_35808 ?auto_35813 ) ( not ( = ?auto_35808 ?auto_35813 ) ) ( not ( = ?auto_35809 ?auto_35813 ) ) ( not ( = ?auto_35810 ?auto_35813 ) ) ( not ( = ?auto_35812 ?auto_35813 ) ) ( not ( = ?auto_35811 ?auto_35813 ) ) ( ON ?auto_35809 ?auto_35808 ) ( ON-TABLE ?auto_35813 ) ( CLEAR ?auto_35812 ) ( ON ?auto_35810 ?auto_35809 ) ( CLEAR ?auto_35810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35813 ?auto_35808 ?auto_35809 )
      ( MAKE-3PILE ?auto_35808 ?auto_35809 ?auto_35810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35814 - BLOCK
      ?auto_35815 - BLOCK
      ?auto_35816 - BLOCK
    )
    :vars
    (
      ?auto_35817 - BLOCK
      ?auto_35819 - BLOCK
      ?auto_35818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35814 ?auto_35815 ) ) ( not ( = ?auto_35814 ?auto_35816 ) ) ( not ( = ?auto_35815 ?auto_35816 ) ) ( not ( = ?auto_35814 ?auto_35817 ) ) ( not ( = ?auto_35815 ?auto_35817 ) ) ( not ( = ?auto_35816 ?auto_35817 ) ) ( ON-TABLE ?auto_35819 ) ( not ( = ?auto_35819 ?auto_35817 ) ) ( not ( = ?auto_35819 ?auto_35816 ) ) ( not ( = ?auto_35819 ?auto_35815 ) ) ( not ( = ?auto_35814 ?auto_35819 ) ) ( ON ?auto_35814 ?auto_35818 ) ( not ( = ?auto_35814 ?auto_35818 ) ) ( not ( = ?auto_35815 ?auto_35818 ) ) ( not ( = ?auto_35816 ?auto_35818 ) ) ( not ( = ?auto_35817 ?auto_35818 ) ) ( not ( = ?auto_35819 ?auto_35818 ) ) ( ON ?auto_35815 ?auto_35814 ) ( ON-TABLE ?auto_35818 ) ( ON ?auto_35816 ?auto_35815 ) ( CLEAR ?auto_35816 ) ( HOLDING ?auto_35817 ) ( CLEAR ?auto_35819 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35819 ?auto_35817 )
      ( MAKE-3PILE ?auto_35814 ?auto_35815 ?auto_35816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35820 - BLOCK
      ?auto_35821 - BLOCK
      ?auto_35822 - BLOCK
    )
    :vars
    (
      ?auto_35824 - BLOCK
      ?auto_35825 - BLOCK
      ?auto_35823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35820 ?auto_35821 ) ) ( not ( = ?auto_35820 ?auto_35822 ) ) ( not ( = ?auto_35821 ?auto_35822 ) ) ( not ( = ?auto_35820 ?auto_35824 ) ) ( not ( = ?auto_35821 ?auto_35824 ) ) ( not ( = ?auto_35822 ?auto_35824 ) ) ( ON-TABLE ?auto_35825 ) ( not ( = ?auto_35825 ?auto_35824 ) ) ( not ( = ?auto_35825 ?auto_35822 ) ) ( not ( = ?auto_35825 ?auto_35821 ) ) ( not ( = ?auto_35820 ?auto_35825 ) ) ( ON ?auto_35820 ?auto_35823 ) ( not ( = ?auto_35820 ?auto_35823 ) ) ( not ( = ?auto_35821 ?auto_35823 ) ) ( not ( = ?auto_35822 ?auto_35823 ) ) ( not ( = ?auto_35824 ?auto_35823 ) ) ( not ( = ?auto_35825 ?auto_35823 ) ) ( ON ?auto_35821 ?auto_35820 ) ( ON-TABLE ?auto_35823 ) ( ON ?auto_35822 ?auto_35821 ) ( CLEAR ?auto_35825 ) ( ON ?auto_35824 ?auto_35822 ) ( CLEAR ?auto_35824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35823 ?auto_35820 ?auto_35821 ?auto_35822 )
      ( MAKE-3PILE ?auto_35820 ?auto_35821 ?auto_35822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35826 - BLOCK
      ?auto_35827 - BLOCK
      ?auto_35828 - BLOCK
    )
    :vars
    (
      ?auto_35831 - BLOCK
      ?auto_35830 - BLOCK
      ?auto_35829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35826 ?auto_35827 ) ) ( not ( = ?auto_35826 ?auto_35828 ) ) ( not ( = ?auto_35827 ?auto_35828 ) ) ( not ( = ?auto_35826 ?auto_35831 ) ) ( not ( = ?auto_35827 ?auto_35831 ) ) ( not ( = ?auto_35828 ?auto_35831 ) ) ( not ( = ?auto_35830 ?auto_35831 ) ) ( not ( = ?auto_35830 ?auto_35828 ) ) ( not ( = ?auto_35830 ?auto_35827 ) ) ( not ( = ?auto_35826 ?auto_35830 ) ) ( ON ?auto_35826 ?auto_35829 ) ( not ( = ?auto_35826 ?auto_35829 ) ) ( not ( = ?auto_35827 ?auto_35829 ) ) ( not ( = ?auto_35828 ?auto_35829 ) ) ( not ( = ?auto_35831 ?auto_35829 ) ) ( not ( = ?auto_35830 ?auto_35829 ) ) ( ON ?auto_35827 ?auto_35826 ) ( ON-TABLE ?auto_35829 ) ( ON ?auto_35828 ?auto_35827 ) ( ON ?auto_35831 ?auto_35828 ) ( CLEAR ?auto_35831 ) ( HOLDING ?auto_35830 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35830 )
      ( MAKE-3PILE ?auto_35826 ?auto_35827 ?auto_35828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_35832 - BLOCK
      ?auto_35833 - BLOCK
      ?auto_35834 - BLOCK
    )
    :vars
    (
      ?auto_35835 - BLOCK
      ?auto_35836 - BLOCK
      ?auto_35837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35832 ?auto_35833 ) ) ( not ( = ?auto_35832 ?auto_35834 ) ) ( not ( = ?auto_35833 ?auto_35834 ) ) ( not ( = ?auto_35832 ?auto_35835 ) ) ( not ( = ?auto_35833 ?auto_35835 ) ) ( not ( = ?auto_35834 ?auto_35835 ) ) ( not ( = ?auto_35836 ?auto_35835 ) ) ( not ( = ?auto_35836 ?auto_35834 ) ) ( not ( = ?auto_35836 ?auto_35833 ) ) ( not ( = ?auto_35832 ?auto_35836 ) ) ( ON ?auto_35832 ?auto_35837 ) ( not ( = ?auto_35832 ?auto_35837 ) ) ( not ( = ?auto_35833 ?auto_35837 ) ) ( not ( = ?auto_35834 ?auto_35837 ) ) ( not ( = ?auto_35835 ?auto_35837 ) ) ( not ( = ?auto_35836 ?auto_35837 ) ) ( ON ?auto_35833 ?auto_35832 ) ( ON-TABLE ?auto_35837 ) ( ON ?auto_35834 ?auto_35833 ) ( ON ?auto_35835 ?auto_35834 ) ( ON ?auto_35836 ?auto_35835 ) ( CLEAR ?auto_35836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35837 ?auto_35832 ?auto_35833 ?auto_35834 ?auto_35835 )
      ( MAKE-3PILE ?auto_35832 ?auto_35833 ?auto_35834 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35839 - BLOCK
    )
    :vars
    (
      ?auto_35840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35840 ?auto_35839 ) ( CLEAR ?auto_35840 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35839 ) ( not ( = ?auto_35839 ?auto_35840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35840 ?auto_35839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35841 - BLOCK
    )
    :vars
    (
      ?auto_35842 - BLOCK
      ?auto_35843 - BLOCK
      ?auto_35844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35842 ?auto_35841 ) ( CLEAR ?auto_35842 ) ( ON-TABLE ?auto_35841 ) ( not ( = ?auto_35841 ?auto_35842 ) ) ( HOLDING ?auto_35843 ) ( CLEAR ?auto_35844 ) ( not ( = ?auto_35841 ?auto_35843 ) ) ( not ( = ?auto_35841 ?auto_35844 ) ) ( not ( = ?auto_35842 ?auto_35843 ) ) ( not ( = ?auto_35842 ?auto_35844 ) ) ( not ( = ?auto_35843 ?auto_35844 ) ) )
    :subtasks
    ( ( !STACK ?auto_35843 ?auto_35844 )
      ( MAKE-1PILE ?auto_35841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35845 - BLOCK
    )
    :vars
    (
      ?auto_35848 - BLOCK
      ?auto_35847 - BLOCK
      ?auto_35846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35848 ?auto_35845 ) ( ON-TABLE ?auto_35845 ) ( not ( = ?auto_35845 ?auto_35848 ) ) ( CLEAR ?auto_35847 ) ( not ( = ?auto_35845 ?auto_35846 ) ) ( not ( = ?auto_35845 ?auto_35847 ) ) ( not ( = ?auto_35848 ?auto_35846 ) ) ( not ( = ?auto_35848 ?auto_35847 ) ) ( not ( = ?auto_35846 ?auto_35847 ) ) ( ON ?auto_35846 ?auto_35848 ) ( CLEAR ?auto_35846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35845 ?auto_35848 )
      ( MAKE-1PILE ?auto_35845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35849 - BLOCK
    )
    :vars
    (
      ?auto_35850 - BLOCK
      ?auto_35852 - BLOCK
      ?auto_35851 - BLOCK
      ?auto_35853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35850 ?auto_35849 ) ( ON-TABLE ?auto_35849 ) ( not ( = ?auto_35849 ?auto_35850 ) ) ( not ( = ?auto_35849 ?auto_35852 ) ) ( not ( = ?auto_35849 ?auto_35851 ) ) ( not ( = ?auto_35850 ?auto_35852 ) ) ( not ( = ?auto_35850 ?auto_35851 ) ) ( not ( = ?auto_35852 ?auto_35851 ) ) ( ON ?auto_35852 ?auto_35850 ) ( CLEAR ?auto_35852 ) ( HOLDING ?auto_35851 ) ( CLEAR ?auto_35853 ) ( ON-TABLE ?auto_35853 ) ( not ( = ?auto_35853 ?auto_35851 ) ) ( not ( = ?auto_35849 ?auto_35853 ) ) ( not ( = ?auto_35850 ?auto_35853 ) ) ( not ( = ?auto_35852 ?auto_35853 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35853 ?auto_35851 )
      ( MAKE-1PILE ?auto_35849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35854 - BLOCK
    )
    :vars
    (
      ?auto_35856 - BLOCK
      ?auto_35855 - BLOCK
      ?auto_35858 - BLOCK
      ?auto_35857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35856 ?auto_35854 ) ( ON-TABLE ?auto_35854 ) ( not ( = ?auto_35854 ?auto_35856 ) ) ( not ( = ?auto_35854 ?auto_35855 ) ) ( not ( = ?auto_35854 ?auto_35858 ) ) ( not ( = ?auto_35856 ?auto_35855 ) ) ( not ( = ?auto_35856 ?auto_35858 ) ) ( not ( = ?auto_35855 ?auto_35858 ) ) ( ON ?auto_35855 ?auto_35856 ) ( CLEAR ?auto_35857 ) ( ON-TABLE ?auto_35857 ) ( not ( = ?auto_35857 ?auto_35858 ) ) ( not ( = ?auto_35854 ?auto_35857 ) ) ( not ( = ?auto_35856 ?auto_35857 ) ) ( not ( = ?auto_35855 ?auto_35857 ) ) ( ON ?auto_35858 ?auto_35855 ) ( CLEAR ?auto_35858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35854 ?auto_35856 ?auto_35855 )
      ( MAKE-1PILE ?auto_35854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35859 - BLOCK
    )
    :vars
    (
      ?auto_35863 - BLOCK
      ?auto_35861 - BLOCK
      ?auto_35862 - BLOCK
      ?auto_35860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35863 ?auto_35859 ) ( ON-TABLE ?auto_35859 ) ( not ( = ?auto_35859 ?auto_35863 ) ) ( not ( = ?auto_35859 ?auto_35861 ) ) ( not ( = ?auto_35859 ?auto_35862 ) ) ( not ( = ?auto_35863 ?auto_35861 ) ) ( not ( = ?auto_35863 ?auto_35862 ) ) ( not ( = ?auto_35861 ?auto_35862 ) ) ( ON ?auto_35861 ?auto_35863 ) ( not ( = ?auto_35860 ?auto_35862 ) ) ( not ( = ?auto_35859 ?auto_35860 ) ) ( not ( = ?auto_35863 ?auto_35860 ) ) ( not ( = ?auto_35861 ?auto_35860 ) ) ( ON ?auto_35862 ?auto_35861 ) ( CLEAR ?auto_35862 ) ( HOLDING ?auto_35860 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35860 )
      ( MAKE-1PILE ?auto_35859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35864 - BLOCK
    )
    :vars
    (
      ?auto_35868 - BLOCK
      ?auto_35866 - BLOCK
      ?auto_35867 - BLOCK
      ?auto_35865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35868 ?auto_35864 ) ( ON-TABLE ?auto_35864 ) ( not ( = ?auto_35864 ?auto_35868 ) ) ( not ( = ?auto_35864 ?auto_35866 ) ) ( not ( = ?auto_35864 ?auto_35867 ) ) ( not ( = ?auto_35868 ?auto_35866 ) ) ( not ( = ?auto_35868 ?auto_35867 ) ) ( not ( = ?auto_35866 ?auto_35867 ) ) ( ON ?auto_35866 ?auto_35868 ) ( not ( = ?auto_35865 ?auto_35867 ) ) ( not ( = ?auto_35864 ?auto_35865 ) ) ( not ( = ?auto_35868 ?auto_35865 ) ) ( not ( = ?auto_35866 ?auto_35865 ) ) ( ON ?auto_35867 ?auto_35866 ) ( ON ?auto_35865 ?auto_35867 ) ( CLEAR ?auto_35865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35864 ?auto_35868 ?auto_35866 ?auto_35867 )
      ( MAKE-1PILE ?auto_35864 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35869 - BLOCK
    )
    :vars
    (
      ?auto_35872 - BLOCK
      ?auto_35870 - BLOCK
      ?auto_35873 - BLOCK
      ?auto_35871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35872 ?auto_35869 ) ( ON-TABLE ?auto_35869 ) ( not ( = ?auto_35869 ?auto_35872 ) ) ( not ( = ?auto_35869 ?auto_35870 ) ) ( not ( = ?auto_35869 ?auto_35873 ) ) ( not ( = ?auto_35872 ?auto_35870 ) ) ( not ( = ?auto_35872 ?auto_35873 ) ) ( not ( = ?auto_35870 ?auto_35873 ) ) ( ON ?auto_35870 ?auto_35872 ) ( not ( = ?auto_35871 ?auto_35873 ) ) ( not ( = ?auto_35869 ?auto_35871 ) ) ( not ( = ?auto_35872 ?auto_35871 ) ) ( not ( = ?auto_35870 ?auto_35871 ) ) ( ON ?auto_35873 ?auto_35870 ) ( HOLDING ?auto_35871 ) ( CLEAR ?auto_35873 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35869 ?auto_35872 ?auto_35870 ?auto_35873 ?auto_35871 )
      ( MAKE-1PILE ?auto_35869 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35874 - BLOCK
    )
    :vars
    (
      ?auto_35877 - BLOCK
      ?auto_35875 - BLOCK
      ?auto_35876 - BLOCK
      ?auto_35878 - BLOCK
      ?auto_35879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35877 ?auto_35874 ) ( ON-TABLE ?auto_35874 ) ( not ( = ?auto_35874 ?auto_35877 ) ) ( not ( = ?auto_35874 ?auto_35875 ) ) ( not ( = ?auto_35874 ?auto_35876 ) ) ( not ( = ?auto_35877 ?auto_35875 ) ) ( not ( = ?auto_35877 ?auto_35876 ) ) ( not ( = ?auto_35875 ?auto_35876 ) ) ( ON ?auto_35875 ?auto_35877 ) ( not ( = ?auto_35878 ?auto_35876 ) ) ( not ( = ?auto_35874 ?auto_35878 ) ) ( not ( = ?auto_35877 ?auto_35878 ) ) ( not ( = ?auto_35875 ?auto_35878 ) ) ( ON ?auto_35876 ?auto_35875 ) ( CLEAR ?auto_35876 ) ( ON ?auto_35878 ?auto_35879 ) ( CLEAR ?auto_35878 ) ( HAND-EMPTY ) ( not ( = ?auto_35874 ?auto_35879 ) ) ( not ( = ?auto_35877 ?auto_35879 ) ) ( not ( = ?auto_35875 ?auto_35879 ) ) ( not ( = ?auto_35876 ?auto_35879 ) ) ( not ( = ?auto_35878 ?auto_35879 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35878 ?auto_35879 )
      ( MAKE-1PILE ?auto_35874 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35880 - BLOCK
    )
    :vars
    (
      ?auto_35883 - BLOCK
      ?auto_35885 - BLOCK
      ?auto_35882 - BLOCK
      ?auto_35884 - BLOCK
      ?auto_35881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35883 ?auto_35880 ) ( ON-TABLE ?auto_35880 ) ( not ( = ?auto_35880 ?auto_35883 ) ) ( not ( = ?auto_35880 ?auto_35885 ) ) ( not ( = ?auto_35880 ?auto_35882 ) ) ( not ( = ?auto_35883 ?auto_35885 ) ) ( not ( = ?auto_35883 ?auto_35882 ) ) ( not ( = ?auto_35885 ?auto_35882 ) ) ( ON ?auto_35885 ?auto_35883 ) ( not ( = ?auto_35884 ?auto_35882 ) ) ( not ( = ?auto_35880 ?auto_35884 ) ) ( not ( = ?auto_35883 ?auto_35884 ) ) ( not ( = ?auto_35885 ?auto_35884 ) ) ( ON ?auto_35884 ?auto_35881 ) ( CLEAR ?auto_35884 ) ( not ( = ?auto_35880 ?auto_35881 ) ) ( not ( = ?auto_35883 ?auto_35881 ) ) ( not ( = ?auto_35885 ?auto_35881 ) ) ( not ( = ?auto_35882 ?auto_35881 ) ) ( not ( = ?auto_35884 ?auto_35881 ) ) ( HOLDING ?auto_35882 ) ( CLEAR ?auto_35885 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35880 ?auto_35883 ?auto_35885 ?auto_35882 )
      ( MAKE-1PILE ?auto_35880 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35886 - BLOCK
    )
    :vars
    (
      ?auto_35887 - BLOCK
      ?auto_35890 - BLOCK
      ?auto_35888 - BLOCK
      ?auto_35889 - BLOCK
      ?auto_35891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35887 ?auto_35886 ) ( ON-TABLE ?auto_35886 ) ( not ( = ?auto_35886 ?auto_35887 ) ) ( not ( = ?auto_35886 ?auto_35890 ) ) ( not ( = ?auto_35886 ?auto_35888 ) ) ( not ( = ?auto_35887 ?auto_35890 ) ) ( not ( = ?auto_35887 ?auto_35888 ) ) ( not ( = ?auto_35890 ?auto_35888 ) ) ( ON ?auto_35890 ?auto_35887 ) ( not ( = ?auto_35889 ?auto_35888 ) ) ( not ( = ?auto_35886 ?auto_35889 ) ) ( not ( = ?auto_35887 ?auto_35889 ) ) ( not ( = ?auto_35890 ?auto_35889 ) ) ( ON ?auto_35889 ?auto_35891 ) ( not ( = ?auto_35886 ?auto_35891 ) ) ( not ( = ?auto_35887 ?auto_35891 ) ) ( not ( = ?auto_35890 ?auto_35891 ) ) ( not ( = ?auto_35888 ?auto_35891 ) ) ( not ( = ?auto_35889 ?auto_35891 ) ) ( CLEAR ?auto_35890 ) ( ON ?auto_35888 ?auto_35889 ) ( CLEAR ?auto_35888 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35891 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35891 ?auto_35889 )
      ( MAKE-1PILE ?auto_35886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35892 - BLOCK
    )
    :vars
    (
      ?auto_35896 - BLOCK
      ?auto_35894 - BLOCK
      ?auto_35897 - BLOCK
      ?auto_35893 - BLOCK
      ?auto_35895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35896 ?auto_35892 ) ( ON-TABLE ?auto_35892 ) ( not ( = ?auto_35892 ?auto_35896 ) ) ( not ( = ?auto_35892 ?auto_35894 ) ) ( not ( = ?auto_35892 ?auto_35897 ) ) ( not ( = ?auto_35896 ?auto_35894 ) ) ( not ( = ?auto_35896 ?auto_35897 ) ) ( not ( = ?auto_35894 ?auto_35897 ) ) ( not ( = ?auto_35893 ?auto_35897 ) ) ( not ( = ?auto_35892 ?auto_35893 ) ) ( not ( = ?auto_35896 ?auto_35893 ) ) ( not ( = ?auto_35894 ?auto_35893 ) ) ( ON ?auto_35893 ?auto_35895 ) ( not ( = ?auto_35892 ?auto_35895 ) ) ( not ( = ?auto_35896 ?auto_35895 ) ) ( not ( = ?auto_35894 ?auto_35895 ) ) ( not ( = ?auto_35897 ?auto_35895 ) ) ( not ( = ?auto_35893 ?auto_35895 ) ) ( ON ?auto_35897 ?auto_35893 ) ( CLEAR ?auto_35897 ) ( ON-TABLE ?auto_35895 ) ( HOLDING ?auto_35894 ) ( CLEAR ?auto_35896 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35892 ?auto_35896 ?auto_35894 )
      ( MAKE-1PILE ?auto_35892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35898 - BLOCK
    )
    :vars
    (
      ?auto_35902 - BLOCK
      ?auto_35900 - BLOCK
      ?auto_35899 - BLOCK
      ?auto_35901 - BLOCK
      ?auto_35903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_35902 ?auto_35898 ) ( ON-TABLE ?auto_35898 ) ( not ( = ?auto_35898 ?auto_35902 ) ) ( not ( = ?auto_35898 ?auto_35900 ) ) ( not ( = ?auto_35898 ?auto_35899 ) ) ( not ( = ?auto_35902 ?auto_35900 ) ) ( not ( = ?auto_35902 ?auto_35899 ) ) ( not ( = ?auto_35900 ?auto_35899 ) ) ( not ( = ?auto_35901 ?auto_35899 ) ) ( not ( = ?auto_35898 ?auto_35901 ) ) ( not ( = ?auto_35902 ?auto_35901 ) ) ( not ( = ?auto_35900 ?auto_35901 ) ) ( ON ?auto_35901 ?auto_35903 ) ( not ( = ?auto_35898 ?auto_35903 ) ) ( not ( = ?auto_35902 ?auto_35903 ) ) ( not ( = ?auto_35900 ?auto_35903 ) ) ( not ( = ?auto_35899 ?auto_35903 ) ) ( not ( = ?auto_35901 ?auto_35903 ) ) ( ON ?auto_35899 ?auto_35901 ) ( ON-TABLE ?auto_35903 ) ( CLEAR ?auto_35902 ) ( ON ?auto_35900 ?auto_35899 ) ( CLEAR ?auto_35900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35903 ?auto_35901 ?auto_35899 )
      ( MAKE-1PILE ?auto_35898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35916 - BLOCK
    )
    :vars
    (
      ?auto_35918 - BLOCK
      ?auto_35920 - BLOCK
      ?auto_35917 - BLOCK
      ?auto_35919 - BLOCK
      ?auto_35921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35916 ?auto_35918 ) ) ( not ( = ?auto_35916 ?auto_35920 ) ) ( not ( = ?auto_35916 ?auto_35917 ) ) ( not ( = ?auto_35918 ?auto_35920 ) ) ( not ( = ?auto_35918 ?auto_35917 ) ) ( not ( = ?auto_35920 ?auto_35917 ) ) ( not ( = ?auto_35919 ?auto_35917 ) ) ( not ( = ?auto_35916 ?auto_35919 ) ) ( not ( = ?auto_35918 ?auto_35919 ) ) ( not ( = ?auto_35920 ?auto_35919 ) ) ( ON ?auto_35919 ?auto_35921 ) ( not ( = ?auto_35916 ?auto_35921 ) ) ( not ( = ?auto_35918 ?auto_35921 ) ) ( not ( = ?auto_35920 ?auto_35921 ) ) ( not ( = ?auto_35917 ?auto_35921 ) ) ( not ( = ?auto_35919 ?auto_35921 ) ) ( ON ?auto_35917 ?auto_35919 ) ( ON-TABLE ?auto_35921 ) ( ON ?auto_35920 ?auto_35917 ) ( ON ?auto_35918 ?auto_35920 ) ( CLEAR ?auto_35918 ) ( HOLDING ?auto_35916 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35916 ?auto_35918 )
      ( MAKE-1PILE ?auto_35916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_35922 - BLOCK
    )
    :vars
    (
      ?auto_35923 - BLOCK
      ?auto_35924 - BLOCK
      ?auto_35926 - BLOCK
      ?auto_35925 - BLOCK
      ?auto_35927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35922 ?auto_35923 ) ) ( not ( = ?auto_35922 ?auto_35924 ) ) ( not ( = ?auto_35922 ?auto_35926 ) ) ( not ( = ?auto_35923 ?auto_35924 ) ) ( not ( = ?auto_35923 ?auto_35926 ) ) ( not ( = ?auto_35924 ?auto_35926 ) ) ( not ( = ?auto_35925 ?auto_35926 ) ) ( not ( = ?auto_35922 ?auto_35925 ) ) ( not ( = ?auto_35923 ?auto_35925 ) ) ( not ( = ?auto_35924 ?auto_35925 ) ) ( ON ?auto_35925 ?auto_35927 ) ( not ( = ?auto_35922 ?auto_35927 ) ) ( not ( = ?auto_35923 ?auto_35927 ) ) ( not ( = ?auto_35924 ?auto_35927 ) ) ( not ( = ?auto_35926 ?auto_35927 ) ) ( not ( = ?auto_35925 ?auto_35927 ) ) ( ON ?auto_35926 ?auto_35925 ) ( ON-TABLE ?auto_35927 ) ( ON ?auto_35924 ?auto_35926 ) ( ON ?auto_35923 ?auto_35924 ) ( ON ?auto_35922 ?auto_35923 ) ( CLEAR ?auto_35922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35927 ?auto_35925 ?auto_35926 ?auto_35924 ?auto_35923 )
      ( MAKE-1PILE ?auto_35922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35932 - BLOCK
      ?auto_35933 - BLOCK
      ?auto_35934 - BLOCK
      ?auto_35935 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_35935 ) ( CLEAR ?auto_35934 ) ( ON-TABLE ?auto_35932 ) ( ON ?auto_35933 ?auto_35932 ) ( ON ?auto_35934 ?auto_35933 ) ( not ( = ?auto_35932 ?auto_35933 ) ) ( not ( = ?auto_35932 ?auto_35934 ) ) ( not ( = ?auto_35932 ?auto_35935 ) ) ( not ( = ?auto_35933 ?auto_35934 ) ) ( not ( = ?auto_35933 ?auto_35935 ) ) ( not ( = ?auto_35934 ?auto_35935 ) ) )
    :subtasks
    ( ( !STACK ?auto_35935 ?auto_35934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35936 - BLOCK
      ?auto_35937 - BLOCK
      ?auto_35938 - BLOCK
      ?auto_35939 - BLOCK
    )
    :vars
    (
      ?auto_35940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_35938 ) ( ON-TABLE ?auto_35936 ) ( ON ?auto_35937 ?auto_35936 ) ( ON ?auto_35938 ?auto_35937 ) ( not ( = ?auto_35936 ?auto_35937 ) ) ( not ( = ?auto_35936 ?auto_35938 ) ) ( not ( = ?auto_35936 ?auto_35939 ) ) ( not ( = ?auto_35937 ?auto_35938 ) ) ( not ( = ?auto_35937 ?auto_35939 ) ) ( not ( = ?auto_35938 ?auto_35939 ) ) ( ON ?auto_35939 ?auto_35940 ) ( CLEAR ?auto_35939 ) ( HAND-EMPTY ) ( not ( = ?auto_35936 ?auto_35940 ) ) ( not ( = ?auto_35937 ?auto_35940 ) ) ( not ( = ?auto_35938 ?auto_35940 ) ) ( not ( = ?auto_35939 ?auto_35940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35939 ?auto_35940 )
      ( MAKE-4PILE ?auto_35936 ?auto_35937 ?auto_35938 ?auto_35939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35941 - BLOCK
      ?auto_35942 - BLOCK
      ?auto_35943 - BLOCK
      ?auto_35944 - BLOCK
    )
    :vars
    (
      ?auto_35945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35941 ) ( ON ?auto_35942 ?auto_35941 ) ( not ( = ?auto_35941 ?auto_35942 ) ) ( not ( = ?auto_35941 ?auto_35943 ) ) ( not ( = ?auto_35941 ?auto_35944 ) ) ( not ( = ?auto_35942 ?auto_35943 ) ) ( not ( = ?auto_35942 ?auto_35944 ) ) ( not ( = ?auto_35943 ?auto_35944 ) ) ( ON ?auto_35944 ?auto_35945 ) ( CLEAR ?auto_35944 ) ( not ( = ?auto_35941 ?auto_35945 ) ) ( not ( = ?auto_35942 ?auto_35945 ) ) ( not ( = ?auto_35943 ?auto_35945 ) ) ( not ( = ?auto_35944 ?auto_35945 ) ) ( HOLDING ?auto_35943 ) ( CLEAR ?auto_35942 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35941 ?auto_35942 ?auto_35943 )
      ( MAKE-4PILE ?auto_35941 ?auto_35942 ?auto_35943 ?auto_35944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35946 - BLOCK
      ?auto_35947 - BLOCK
      ?auto_35948 - BLOCK
      ?auto_35949 - BLOCK
    )
    :vars
    (
      ?auto_35950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35946 ) ( ON ?auto_35947 ?auto_35946 ) ( not ( = ?auto_35946 ?auto_35947 ) ) ( not ( = ?auto_35946 ?auto_35948 ) ) ( not ( = ?auto_35946 ?auto_35949 ) ) ( not ( = ?auto_35947 ?auto_35948 ) ) ( not ( = ?auto_35947 ?auto_35949 ) ) ( not ( = ?auto_35948 ?auto_35949 ) ) ( ON ?auto_35949 ?auto_35950 ) ( not ( = ?auto_35946 ?auto_35950 ) ) ( not ( = ?auto_35947 ?auto_35950 ) ) ( not ( = ?auto_35948 ?auto_35950 ) ) ( not ( = ?auto_35949 ?auto_35950 ) ) ( CLEAR ?auto_35947 ) ( ON ?auto_35948 ?auto_35949 ) ( CLEAR ?auto_35948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35950 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35950 ?auto_35949 )
      ( MAKE-4PILE ?auto_35946 ?auto_35947 ?auto_35948 ?auto_35949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35951 - BLOCK
      ?auto_35952 - BLOCK
      ?auto_35953 - BLOCK
      ?auto_35954 - BLOCK
    )
    :vars
    (
      ?auto_35955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35951 ) ( not ( = ?auto_35951 ?auto_35952 ) ) ( not ( = ?auto_35951 ?auto_35953 ) ) ( not ( = ?auto_35951 ?auto_35954 ) ) ( not ( = ?auto_35952 ?auto_35953 ) ) ( not ( = ?auto_35952 ?auto_35954 ) ) ( not ( = ?auto_35953 ?auto_35954 ) ) ( ON ?auto_35954 ?auto_35955 ) ( not ( = ?auto_35951 ?auto_35955 ) ) ( not ( = ?auto_35952 ?auto_35955 ) ) ( not ( = ?auto_35953 ?auto_35955 ) ) ( not ( = ?auto_35954 ?auto_35955 ) ) ( ON ?auto_35953 ?auto_35954 ) ( CLEAR ?auto_35953 ) ( ON-TABLE ?auto_35955 ) ( HOLDING ?auto_35952 ) ( CLEAR ?auto_35951 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35951 ?auto_35952 )
      ( MAKE-4PILE ?auto_35951 ?auto_35952 ?auto_35953 ?auto_35954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35956 - BLOCK
      ?auto_35957 - BLOCK
      ?auto_35958 - BLOCK
      ?auto_35959 - BLOCK
    )
    :vars
    (
      ?auto_35960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_35956 ) ( not ( = ?auto_35956 ?auto_35957 ) ) ( not ( = ?auto_35956 ?auto_35958 ) ) ( not ( = ?auto_35956 ?auto_35959 ) ) ( not ( = ?auto_35957 ?auto_35958 ) ) ( not ( = ?auto_35957 ?auto_35959 ) ) ( not ( = ?auto_35958 ?auto_35959 ) ) ( ON ?auto_35959 ?auto_35960 ) ( not ( = ?auto_35956 ?auto_35960 ) ) ( not ( = ?auto_35957 ?auto_35960 ) ) ( not ( = ?auto_35958 ?auto_35960 ) ) ( not ( = ?auto_35959 ?auto_35960 ) ) ( ON ?auto_35958 ?auto_35959 ) ( ON-TABLE ?auto_35960 ) ( CLEAR ?auto_35956 ) ( ON ?auto_35957 ?auto_35958 ) ( CLEAR ?auto_35957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35960 ?auto_35959 ?auto_35958 )
      ( MAKE-4PILE ?auto_35956 ?auto_35957 ?auto_35958 ?auto_35959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35961 - BLOCK
      ?auto_35962 - BLOCK
      ?auto_35963 - BLOCK
      ?auto_35964 - BLOCK
    )
    :vars
    (
      ?auto_35965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35961 ?auto_35962 ) ) ( not ( = ?auto_35961 ?auto_35963 ) ) ( not ( = ?auto_35961 ?auto_35964 ) ) ( not ( = ?auto_35962 ?auto_35963 ) ) ( not ( = ?auto_35962 ?auto_35964 ) ) ( not ( = ?auto_35963 ?auto_35964 ) ) ( ON ?auto_35964 ?auto_35965 ) ( not ( = ?auto_35961 ?auto_35965 ) ) ( not ( = ?auto_35962 ?auto_35965 ) ) ( not ( = ?auto_35963 ?auto_35965 ) ) ( not ( = ?auto_35964 ?auto_35965 ) ) ( ON ?auto_35963 ?auto_35964 ) ( ON-TABLE ?auto_35965 ) ( ON ?auto_35962 ?auto_35963 ) ( CLEAR ?auto_35962 ) ( HOLDING ?auto_35961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35961 )
      ( MAKE-4PILE ?auto_35961 ?auto_35962 ?auto_35963 ?auto_35964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35966 - BLOCK
      ?auto_35967 - BLOCK
      ?auto_35968 - BLOCK
      ?auto_35969 - BLOCK
    )
    :vars
    (
      ?auto_35970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35966 ?auto_35967 ) ) ( not ( = ?auto_35966 ?auto_35968 ) ) ( not ( = ?auto_35966 ?auto_35969 ) ) ( not ( = ?auto_35967 ?auto_35968 ) ) ( not ( = ?auto_35967 ?auto_35969 ) ) ( not ( = ?auto_35968 ?auto_35969 ) ) ( ON ?auto_35969 ?auto_35970 ) ( not ( = ?auto_35966 ?auto_35970 ) ) ( not ( = ?auto_35967 ?auto_35970 ) ) ( not ( = ?auto_35968 ?auto_35970 ) ) ( not ( = ?auto_35969 ?auto_35970 ) ) ( ON ?auto_35968 ?auto_35969 ) ( ON-TABLE ?auto_35970 ) ( ON ?auto_35967 ?auto_35968 ) ( ON ?auto_35966 ?auto_35967 ) ( CLEAR ?auto_35966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35970 ?auto_35969 ?auto_35968 ?auto_35967 )
      ( MAKE-4PILE ?auto_35966 ?auto_35967 ?auto_35968 ?auto_35969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35971 - BLOCK
      ?auto_35972 - BLOCK
      ?auto_35973 - BLOCK
      ?auto_35974 - BLOCK
    )
    :vars
    (
      ?auto_35975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35971 ?auto_35972 ) ) ( not ( = ?auto_35971 ?auto_35973 ) ) ( not ( = ?auto_35971 ?auto_35974 ) ) ( not ( = ?auto_35972 ?auto_35973 ) ) ( not ( = ?auto_35972 ?auto_35974 ) ) ( not ( = ?auto_35973 ?auto_35974 ) ) ( ON ?auto_35974 ?auto_35975 ) ( not ( = ?auto_35971 ?auto_35975 ) ) ( not ( = ?auto_35972 ?auto_35975 ) ) ( not ( = ?auto_35973 ?auto_35975 ) ) ( not ( = ?auto_35974 ?auto_35975 ) ) ( ON ?auto_35973 ?auto_35974 ) ( ON-TABLE ?auto_35975 ) ( ON ?auto_35972 ?auto_35973 ) ( HOLDING ?auto_35971 ) ( CLEAR ?auto_35972 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35975 ?auto_35974 ?auto_35973 ?auto_35972 ?auto_35971 )
      ( MAKE-4PILE ?auto_35971 ?auto_35972 ?auto_35973 ?auto_35974 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35976 - BLOCK
      ?auto_35977 - BLOCK
      ?auto_35978 - BLOCK
      ?auto_35979 - BLOCK
    )
    :vars
    (
      ?auto_35980 - BLOCK
      ?auto_35981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35976 ?auto_35977 ) ) ( not ( = ?auto_35976 ?auto_35978 ) ) ( not ( = ?auto_35976 ?auto_35979 ) ) ( not ( = ?auto_35977 ?auto_35978 ) ) ( not ( = ?auto_35977 ?auto_35979 ) ) ( not ( = ?auto_35978 ?auto_35979 ) ) ( ON ?auto_35979 ?auto_35980 ) ( not ( = ?auto_35976 ?auto_35980 ) ) ( not ( = ?auto_35977 ?auto_35980 ) ) ( not ( = ?auto_35978 ?auto_35980 ) ) ( not ( = ?auto_35979 ?auto_35980 ) ) ( ON ?auto_35978 ?auto_35979 ) ( ON-TABLE ?auto_35980 ) ( ON ?auto_35977 ?auto_35978 ) ( CLEAR ?auto_35977 ) ( ON ?auto_35976 ?auto_35981 ) ( CLEAR ?auto_35976 ) ( HAND-EMPTY ) ( not ( = ?auto_35976 ?auto_35981 ) ) ( not ( = ?auto_35977 ?auto_35981 ) ) ( not ( = ?auto_35978 ?auto_35981 ) ) ( not ( = ?auto_35979 ?auto_35981 ) ) ( not ( = ?auto_35980 ?auto_35981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35976 ?auto_35981 )
      ( MAKE-4PILE ?auto_35976 ?auto_35977 ?auto_35978 ?auto_35979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35982 - BLOCK
      ?auto_35983 - BLOCK
      ?auto_35984 - BLOCK
      ?auto_35985 - BLOCK
    )
    :vars
    (
      ?auto_35987 - BLOCK
      ?auto_35986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35982 ?auto_35983 ) ) ( not ( = ?auto_35982 ?auto_35984 ) ) ( not ( = ?auto_35982 ?auto_35985 ) ) ( not ( = ?auto_35983 ?auto_35984 ) ) ( not ( = ?auto_35983 ?auto_35985 ) ) ( not ( = ?auto_35984 ?auto_35985 ) ) ( ON ?auto_35985 ?auto_35987 ) ( not ( = ?auto_35982 ?auto_35987 ) ) ( not ( = ?auto_35983 ?auto_35987 ) ) ( not ( = ?auto_35984 ?auto_35987 ) ) ( not ( = ?auto_35985 ?auto_35987 ) ) ( ON ?auto_35984 ?auto_35985 ) ( ON-TABLE ?auto_35987 ) ( ON ?auto_35982 ?auto_35986 ) ( CLEAR ?auto_35982 ) ( not ( = ?auto_35982 ?auto_35986 ) ) ( not ( = ?auto_35983 ?auto_35986 ) ) ( not ( = ?auto_35984 ?auto_35986 ) ) ( not ( = ?auto_35985 ?auto_35986 ) ) ( not ( = ?auto_35987 ?auto_35986 ) ) ( HOLDING ?auto_35983 ) ( CLEAR ?auto_35984 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35987 ?auto_35985 ?auto_35984 ?auto_35983 )
      ( MAKE-4PILE ?auto_35982 ?auto_35983 ?auto_35984 ?auto_35985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35988 - BLOCK
      ?auto_35989 - BLOCK
      ?auto_35990 - BLOCK
      ?auto_35991 - BLOCK
    )
    :vars
    (
      ?auto_35992 - BLOCK
      ?auto_35993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35988 ?auto_35989 ) ) ( not ( = ?auto_35988 ?auto_35990 ) ) ( not ( = ?auto_35988 ?auto_35991 ) ) ( not ( = ?auto_35989 ?auto_35990 ) ) ( not ( = ?auto_35989 ?auto_35991 ) ) ( not ( = ?auto_35990 ?auto_35991 ) ) ( ON ?auto_35991 ?auto_35992 ) ( not ( = ?auto_35988 ?auto_35992 ) ) ( not ( = ?auto_35989 ?auto_35992 ) ) ( not ( = ?auto_35990 ?auto_35992 ) ) ( not ( = ?auto_35991 ?auto_35992 ) ) ( ON ?auto_35990 ?auto_35991 ) ( ON-TABLE ?auto_35992 ) ( ON ?auto_35988 ?auto_35993 ) ( not ( = ?auto_35988 ?auto_35993 ) ) ( not ( = ?auto_35989 ?auto_35993 ) ) ( not ( = ?auto_35990 ?auto_35993 ) ) ( not ( = ?auto_35991 ?auto_35993 ) ) ( not ( = ?auto_35992 ?auto_35993 ) ) ( CLEAR ?auto_35990 ) ( ON ?auto_35989 ?auto_35988 ) ( CLEAR ?auto_35989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35993 ?auto_35988 )
      ( MAKE-4PILE ?auto_35988 ?auto_35989 ?auto_35990 ?auto_35991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_35994 - BLOCK
      ?auto_35995 - BLOCK
      ?auto_35996 - BLOCK
      ?auto_35997 - BLOCK
    )
    :vars
    (
      ?auto_35998 - BLOCK
      ?auto_35999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35994 ?auto_35995 ) ) ( not ( = ?auto_35994 ?auto_35996 ) ) ( not ( = ?auto_35994 ?auto_35997 ) ) ( not ( = ?auto_35995 ?auto_35996 ) ) ( not ( = ?auto_35995 ?auto_35997 ) ) ( not ( = ?auto_35996 ?auto_35997 ) ) ( ON ?auto_35997 ?auto_35998 ) ( not ( = ?auto_35994 ?auto_35998 ) ) ( not ( = ?auto_35995 ?auto_35998 ) ) ( not ( = ?auto_35996 ?auto_35998 ) ) ( not ( = ?auto_35997 ?auto_35998 ) ) ( ON-TABLE ?auto_35998 ) ( ON ?auto_35994 ?auto_35999 ) ( not ( = ?auto_35994 ?auto_35999 ) ) ( not ( = ?auto_35995 ?auto_35999 ) ) ( not ( = ?auto_35996 ?auto_35999 ) ) ( not ( = ?auto_35997 ?auto_35999 ) ) ( not ( = ?auto_35998 ?auto_35999 ) ) ( ON ?auto_35995 ?auto_35994 ) ( CLEAR ?auto_35995 ) ( ON-TABLE ?auto_35999 ) ( HOLDING ?auto_35996 ) ( CLEAR ?auto_35997 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35998 ?auto_35997 ?auto_35996 )
      ( MAKE-4PILE ?auto_35994 ?auto_35995 ?auto_35996 ?auto_35997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36000 - BLOCK
      ?auto_36001 - BLOCK
      ?auto_36002 - BLOCK
      ?auto_36003 - BLOCK
    )
    :vars
    (
      ?auto_36004 - BLOCK
      ?auto_36005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36000 ?auto_36001 ) ) ( not ( = ?auto_36000 ?auto_36002 ) ) ( not ( = ?auto_36000 ?auto_36003 ) ) ( not ( = ?auto_36001 ?auto_36002 ) ) ( not ( = ?auto_36001 ?auto_36003 ) ) ( not ( = ?auto_36002 ?auto_36003 ) ) ( ON ?auto_36003 ?auto_36004 ) ( not ( = ?auto_36000 ?auto_36004 ) ) ( not ( = ?auto_36001 ?auto_36004 ) ) ( not ( = ?auto_36002 ?auto_36004 ) ) ( not ( = ?auto_36003 ?auto_36004 ) ) ( ON-TABLE ?auto_36004 ) ( ON ?auto_36000 ?auto_36005 ) ( not ( = ?auto_36000 ?auto_36005 ) ) ( not ( = ?auto_36001 ?auto_36005 ) ) ( not ( = ?auto_36002 ?auto_36005 ) ) ( not ( = ?auto_36003 ?auto_36005 ) ) ( not ( = ?auto_36004 ?auto_36005 ) ) ( ON ?auto_36001 ?auto_36000 ) ( ON-TABLE ?auto_36005 ) ( CLEAR ?auto_36003 ) ( ON ?auto_36002 ?auto_36001 ) ( CLEAR ?auto_36002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36005 ?auto_36000 ?auto_36001 )
      ( MAKE-4PILE ?auto_36000 ?auto_36001 ?auto_36002 ?auto_36003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36006 - BLOCK
      ?auto_36007 - BLOCK
      ?auto_36008 - BLOCK
      ?auto_36009 - BLOCK
    )
    :vars
    (
      ?auto_36011 - BLOCK
      ?auto_36010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36006 ?auto_36007 ) ) ( not ( = ?auto_36006 ?auto_36008 ) ) ( not ( = ?auto_36006 ?auto_36009 ) ) ( not ( = ?auto_36007 ?auto_36008 ) ) ( not ( = ?auto_36007 ?auto_36009 ) ) ( not ( = ?auto_36008 ?auto_36009 ) ) ( not ( = ?auto_36006 ?auto_36011 ) ) ( not ( = ?auto_36007 ?auto_36011 ) ) ( not ( = ?auto_36008 ?auto_36011 ) ) ( not ( = ?auto_36009 ?auto_36011 ) ) ( ON-TABLE ?auto_36011 ) ( ON ?auto_36006 ?auto_36010 ) ( not ( = ?auto_36006 ?auto_36010 ) ) ( not ( = ?auto_36007 ?auto_36010 ) ) ( not ( = ?auto_36008 ?auto_36010 ) ) ( not ( = ?auto_36009 ?auto_36010 ) ) ( not ( = ?auto_36011 ?auto_36010 ) ) ( ON ?auto_36007 ?auto_36006 ) ( ON-TABLE ?auto_36010 ) ( ON ?auto_36008 ?auto_36007 ) ( CLEAR ?auto_36008 ) ( HOLDING ?auto_36009 ) ( CLEAR ?auto_36011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36011 ?auto_36009 )
      ( MAKE-4PILE ?auto_36006 ?auto_36007 ?auto_36008 ?auto_36009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36012 - BLOCK
      ?auto_36013 - BLOCK
      ?auto_36014 - BLOCK
      ?auto_36015 - BLOCK
    )
    :vars
    (
      ?auto_36017 - BLOCK
      ?auto_36016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36012 ?auto_36013 ) ) ( not ( = ?auto_36012 ?auto_36014 ) ) ( not ( = ?auto_36012 ?auto_36015 ) ) ( not ( = ?auto_36013 ?auto_36014 ) ) ( not ( = ?auto_36013 ?auto_36015 ) ) ( not ( = ?auto_36014 ?auto_36015 ) ) ( not ( = ?auto_36012 ?auto_36017 ) ) ( not ( = ?auto_36013 ?auto_36017 ) ) ( not ( = ?auto_36014 ?auto_36017 ) ) ( not ( = ?auto_36015 ?auto_36017 ) ) ( ON-TABLE ?auto_36017 ) ( ON ?auto_36012 ?auto_36016 ) ( not ( = ?auto_36012 ?auto_36016 ) ) ( not ( = ?auto_36013 ?auto_36016 ) ) ( not ( = ?auto_36014 ?auto_36016 ) ) ( not ( = ?auto_36015 ?auto_36016 ) ) ( not ( = ?auto_36017 ?auto_36016 ) ) ( ON ?auto_36013 ?auto_36012 ) ( ON-TABLE ?auto_36016 ) ( ON ?auto_36014 ?auto_36013 ) ( CLEAR ?auto_36017 ) ( ON ?auto_36015 ?auto_36014 ) ( CLEAR ?auto_36015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36016 ?auto_36012 ?auto_36013 ?auto_36014 )
      ( MAKE-4PILE ?auto_36012 ?auto_36013 ?auto_36014 ?auto_36015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36018 - BLOCK
      ?auto_36019 - BLOCK
      ?auto_36020 - BLOCK
      ?auto_36021 - BLOCK
    )
    :vars
    (
      ?auto_36023 - BLOCK
      ?auto_36022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36018 ?auto_36019 ) ) ( not ( = ?auto_36018 ?auto_36020 ) ) ( not ( = ?auto_36018 ?auto_36021 ) ) ( not ( = ?auto_36019 ?auto_36020 ) ) ( not ( = ?auto_36019 ?auto_36021 ) ) ( not ( = ?auto_36020 ?auto_36021 ) ) ( not ( = ?auto_36018 ?auto_36023 ) ) ( not ( = ?auto_36019 ?auto_36023 ) ) ( not ( = ?auto_36020 ?auto_36023 ) ) ( not ( = ?auto_36021 ?auto_36023 ) ) ( ON ?auto_36018 ?auto_36022 ) ( not ( = ?auto_36018 ?auto_36022 ) ) ( not ( = ?auto_36019 ?auto_36022 ) ) ( not ( = ?auto_36020 ?auto_36022 ) ) ( not ( = ?auto_36021 ?auto_36022 ) ) ( not ( = ?auto_36023 ?auto_36022 ) ) ( ON ?auto_36019 ?auto_36018 ) ( ON-TABLE ?auto_36022 ) ( ON ?auto_36020 ?auto_36019 ) ( ON ?auto_36021 ?auto_36020 ) ( CLEAR ?auto_36021 ) ( HOLDING ?auto_36023 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36023 )
      ( MAKE-4PILE ?auto_36018 ?auto_36019 ?auto_36020 ?auto_36021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36024 - BLOCK
      ?auto_36025 - BLOCK
      ?auto_36026 - BLOCK
      ?auto_36027 - BLOCK
    )
    :vars
    (
      ?auto_36029 - BLOCK
      ?auto_36028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36024 ?auto_36025 ) ) ( not ( = ?auto_36024 ?auto_36026 ) ) ( not ( = ?auto_36024 ?auto_36027 ) ) ( not ( = ?auto_36025 ?auto_36026 ) ) ( not ( = ?auto_36025 ?auto_36027 ) ) ( not ( = ?auto_36026 ?auto_36027 ) ) ( not ( = ?auto_36024 ?auto_36029 ) ) ( not ( = ?auto_36025 ?auto_36029 ) ) ( not ( = ?auto_36026 ?auto_36029 ) ) ( not ( = ?auto_36027 ?auto_36029 ) ) ( ON ?auto_36024 ?auto_36028 ) ( not ( = ?auto_36024 ?auto_36028 ) ) ( not ( = ?auto_36025 ?auto_36028 ) ) ( not ( = ?auto_36026 ?auto_36028 ) ) ( not ( = ?auto_36027 ?auto_36028 ) ) ( not ( = ?auto_36029 ?auto_36028 ) ) ( ON ?auto_36025 ?auto_36024 ) ( ON-TABLE ?auto_36028 ) ( ON ?auto_36026 ?auto_36025 ) ( ON ?auto_36027 ?auto_36026 ) ( ON ?auto_36029 ?auto_36027 ) ( CLEAR ?auto_36029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36028 ?auto_36024 ?auto_36025 ?auto_36026 ?auto_36027 )
      ( MAKE-4PILE ?auto_36024 ?auto_36025 ?auto_36026 ?auto_36027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36035 - BLOCK
      ?auto_36036 - BLOCK
      ?auto_36037 - BLOCK
      ?auto_36038 - BLOCK
      ?auto_36039 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36039 ) ( CLEAR ?auto_36038 ) ( ON-TABLE ?auto_36035 ) ( ON ?auto_36036 ?auto_36035 ) ( ON ?auto_36037 ?auto_36036 ) ( ON ?auto_36038 ?auto_36037 ) ( not ( = ?auto_36035 ?auto_36036 ) ) ( not ( = ?auto_36035 ?auto_36037 ) ) ( not ( = ?auto_36035 ?auto_36038 ) ) ( not ( = ?auto_36035 ?auto_36039 ) ) ( not ( = ?auto_36036 ?auto_36037 ) ) ( not ( = ?auto_36036 ?auto_36038 ) ) ( not ( = ?auto_36036 ?auto_36039 ) ) ( not ( = ?auto_36037 ?auto_36038 ) ) ( not ( = ?auto_36037 ?auto_36039 ) ) ( not ( = ?auto_36038 ?auto_36039 ) ) )
    :subtasks
    ( ( !STACK ?auto_36039 ?auto_36038 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36040 - BLOCK
      ?auto_36041 - BLOCK
      ?auto_36042 - BLOCK
      ?auto_36043 - BLOCK
      ?auto_36044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36043 ) ( ON-TABLE ?auto_36040 ) ( ON ?auto_36041 ?auto_36040 ) ( ON ?auto_36042 ?auto_36041 ) ( ON ?auto_36043 ?auto_36042 ) ( not ( = ?auto_36040 ?auto_36041 ) ) ( not ( = ?auto_36040 ?auto_36042 ) ) ( not ( = ?auto_36040 ?auto_36043 ) ) ( not ( = ?auto_36040 ?auto_36044 ) ) ( not ( = ?auto_36041 ?auto_36042 ) ) ( not ( = ?auto_36041 ?auto_36043 ) ) ( not ( = ?auto_36041 ?auto_36044 ) ) ( not ( = ?auto_36042 ?auto_36043 ) ) ( not ( = ?auto_36042 ?auto_36044 ) ) ( not ( = ?auto_36043 ?auto_36044 ) ) ( ON-TABLE ?auto_36044 ) ( CLEAR ?auto_36044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_36044 )
      ( MAKE-5PILE ?auto_36040 ?auto_36041 ?auto_36042 ?auto_36043 ?auto_36044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36045 - BLOCK
      ?auto_36046 - BLOCK
      ?auto_36047 - BLOCK
      ?auto_36048 - BLOCK
      ?auto_36049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36045 ) ( ON ?auto_36046 ?auto_36045 ) ( ON ?auto_36047 ?auto_36046 ) ( not ( = ?auto_36045 ?auto_36046 ) ) ( not ( = ?auto_36045 ?auto_36047 ) ) ( not ( = ?auto_36045 ?auto_36048 ) ) ( not ( = ?auto_36045 ?auto_36049 ) ) ( not ( = ?auto_36046 ?auto_36047 ) ) ( not ( = ?auto_36046 ?auto_36048 ) ) ( not ( = ?auto_36046 ?auto_36049 ) ) ( not ( = ?auto_36047 ?auto_36048 ) ) ( not ( = ?auto_36047 ?auto_36049 ) ) ( not ( = ?auto_36048 ?auto_36049 ) ) ( ON-TABLE ?auto_36049 ) ( CLEAR ?auto_36049 ) ( HOLDING ?auto_36048 ) ( CLEAR ?auto_36047 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36045 ?auto_36046 ?auto_36047 ?auto_36048 )
      ( MAKE-5PILE ?auto_36045 ?auto_36046 ?auto_36047 ?auto_36048 ?auto_36049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36050 - BLOCK
      ?auto_36051 - BLOCK
      ?auto_36052 - BLOCK
      ?auto_36053 - BLOCK
      ?auto_36054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36050 ) ( ON ?auto_36051 ?auto_36050 ) ( ON ?auto_36052 ?auto_36051 ) ( not ( = ?auto_36050 ?auto_36051 ) ) ( not ( = ?auto_36050 ?auto_36052 ) ) ( not ( = ?auto_36050 ?auto_36053 ) ) ( not ( = ?auto_36050 ?auto_36054 ) ) ( not ( = ?auto_36051 ?auto_36052 ) ) ( not ( = ?auto_36051 ?auto_36053 ) ) ( not ( = ?auto_36051 ?auto_36054 ) ) ( not ( = ?auto_36052 ?auto_36053 ) ) ( not ( = ?auto_36052 ?auto_36054 ) ) ( not ( = ?auto_36053 ?auto_36054 ) ) ( ON-TABLE ?auto_36054 ) ( CLEAR ?auto_36052 ) ( ON ?auto_36053 ?auto_36054 ) ( CLEAR ?auto_36053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36054 )
      ( MAKE-5PILE ?auto_36050 ?auto_36051 ?auto_36052 ?auto_36053 ?auto_36054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36055 - BLOCK
      ?auto_36056 - BLOCK
      ?auto_36057 - BLOCK
      ?auto_36058 - BLOCK
      ?auto_36059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36055 ) ( ON ?auto_36056 ?auto_36055 ) ( not ( = ?auto_36055 ?auto_36056 ) ) ( not ( = ?auto_36055 ?auto_36057 ) ) ( not ( = ?auto_36055 ?auto_36058 ) ) ( not ( = ?auto_36055 ?auto_36059 ) ) ( not ( = ?auto_36056 ?auto_36057 ) ) ( not ( = ?auto_36056 ?auto_36058 ) ) ( not ( = ?auto_36056 ?auto_36059 ) ) ( not ( = ?auto_36057 ?auto_36058 ) ) ( not ( = ?auto_36057 ?auto_36059 ) ) ( not ( = ?auto_36058 ?auto_36059 ) ) ( ON-TABLE ?auto_36059 ) ( ON ?auto_36058 ?auto_36059 ) ( CLEAR ?auto_36058 ) ( HOLDING ?auto_36057 ) ( CLEAR ?auto_36056 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36055 ?auto_36056 ?auto_36057 )
      ( MAKE-5PILE ?auto_36055 ?auto_36056 ?auto_36057 ?auto_36058 ?auto_36059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36060 - BLOCK
      ?auto_36061 - BLOCK
      ?auto_36062 - BLOCK
      ?auto_36063 - BLOCK
      ?auto_36064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36060 ) ( ON ?auto_36061 ?auto_36060 ) ( not ( = ?auto_36060 ?auto_36061 ) ) ( not ( = ?auto_36060 ?auto_36062 ) ) ( not ( = ?auto_36060 ?auto_36063 ) ) ( not ( = ?auto_36060 ?auto_36064 ) ) ( not ( = ?auto_36061 ?auto_36062 ) ) ( not ( = ?auto_36061 ?auto_36063 ) ) ( not ( = ?auto_36061 ?auto_36064 ) ) ( not ( = ?auto_36062 ?auto_36063 ) ) ( not ( = ?auto_36062 ?auto_36064 ) ) ( not ( = ?auto_36063 ?auto_36064 ) ) ( ON-TABLE ?auto_36064 ) ( ON ?auto_36063 ?auto_36064 ) ( CLEAR ?auto_36061 ) ( ON ?auto_36062 ?auto_36063 ) ( CLEAR ?auto_36062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36064 ?auto_36063 )
      ( MAKE-5PILE ?auto_36060 ?auto_36061 ?auto_36062 ?auto_36063 ?auto_36064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36065 - BLOCK
      ?auto_36066 - BLOCK
      ?auto_36067 - BLOCK
      ?auto_36068 - BLOCK
      ?auto_36069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36065 ) ( not ( = ?auto_36065 ?auto_36066 ) ) ( not ( = ?auto_36065 ?auto_36067 ) ) ( not ( = ?auto_36065 ?auto_36068 ) ) ( not ( = ?auto_36065 ?auto_36069 ) ) ( not ( = ?auto_36066 ?auto_36067 ) ) ( not ( = ?auto_36066 ?auto_36068 ) ) ( not ( = ?auto_36066 ?auto_36069 ) ) ( not ( = ?auto_36067 ?auto_36068 ) ) ( not ( = ?auto_36067 ?auto_36069 ) ) ( not ( = ?auto_36068 ?auto_36069 ) ) ( ON-TABLE ?auto_36069 ) ( ON ?auto_36068 ?auto_36069 ) ( ON ?auto_36067 ?auto_36068 ) ( CLEAR ?auto_36067 ) ( HOLDING ?auto_36066 ) ( CLEAR ?auto_36065 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36065 ?auto_36066 )
      ( MAKE-5PILE ?auto_36065 ?auto_36066 ?auto_36067 ?auto_36068 ?auto_36069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36070 - BLOCK
      ?auto_36071 - BLOCK
      ?auto_36072 - BLOCK
      ?auto_36073 - BLOCK
      ?auto_36074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36070 ) ( not ( = ?auto_36070 ?auto_36071 ) ) ( not ( = ?auto_36070 ?auto_36072 ) ) ( not ( = ?auto_36070 ?auto_36073 ) ) ( not ( = ?auto_36070 ?auto_36074 ) ) ( not ( = ?auto_36071 ?auto_36072 ) ) ( not ( = ?auto_36071 ?auto_36073 ) ) ( not ( = ?auto_36071 ?auto_36074 ) ) ( not ( = ?auto_36072 ?auto_36073 ) ) ( not ( = ?auto_36072 ?auto_36074 ) ) ( not ( = ?auto_36073 ?auto_36074 ) ) ( ON-TABLE ?auto_36074 ) ( ON ?auto_36073 ?auto_36074 ) ( ON ?auto_36072 ?auto_36073 ) ( CLEAR ?auto_36070 ) ( ON ?auto_36071 ?auto_36072 ) ( CLEAR ?auto_36071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36074 ?auto_36073 ?auto_36072 )
      ( MAKE-5PILE ?auto_36070 ?auto_36071 ?auto_36072 ?auto_36073 ?auto_36074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36075 - BLOCK
      ?auto_36076 - BLOCK
      ?auto_36077 - BLOCK
      ?auto_36078 - BLOCK
      ?auto_36079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36075 ?auto_36076 ) ) ( not ( = ?auto_36075 ?auto_36077 ) ) ( not ( = ?auto_36075 ?auto_36078 ) ) ( not ( = ?auto_36075 ?auto_36079 ) ) ( not ( = ?auto_36076 ?auto_36077 ) ) ( not ( = ?auto_36076 ?auto_36078 ) ) ( not ( = ?auto_36076 ?auto_36079 ) ) ( not ( = ?auto_36077 ?auto_36078 ) ) ( not ( = ?auto_36077 ?auto_36079 ) ) ( not ( = ?auto_36078 ?auto_36079 ) ) ( ON-TABLE ?auto_36079 ) ( ON ?auto_36078 ?auto_36079 ) ( ON ?auto_36077 ?auto_36078 ) ( ON ?auto_36076 ?auto_36077 ) ( CLEAR ?auto_36076 ) ( HOLDING ?auto_36075 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36075 )
      ( MAKE-5PILE ?auto_36075 ?auto_36076 ?auto_36077 ?auto_36078 ?auto_36079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36080 - BLOCK
      ?auto_36081 - BLOCK
      ?auto_36082 - BLOCK
      ?auto_36083 - BLOCK
      ?auto_36084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36080 ?auto_36081 ) ) ( not ( = ?auto_36080 ?auto_36082 ) ) ( not ( = ?auto_36080 ?auto_36083 ) ) ( not ( = ?auto_36080 ?auto_36084 ) ) ( not ( = ?auto_36081 ?auto_36082 ) ) ( not ( = ?auto_36081 ?auto_36083 ) ) ( not ( = ?auto_36081 ?auto_36084 ) ) ( not ( = ?auto_36082 ?auto_36083 ) ) ( not ( = ?auto_36082 ?auto_36084 ) ) ( not ( = ?auto_36083 ?auto_36084 ) ) ( ON-TABLE ?auto_36084 ) ( ON ?auto_36083 ?auto_36084 ) ( ON ?auto_36082 ?auto_36083 ) ( ON ?auto_36081 ?auto_36082 ) ( ON ?auto_36080 ?auto_36081 ) ( CLEAR ?auto_36080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36084 ?auto_36083 ?auto_36082 ?auto_36081 )
      ( MAKE-5PILE ?auto_36080 ?auto_36081 ?auto_36082 ?auto_36083 ?auto_36084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36085 - BLOCK
      ?auto_36086 - BLOCK
      ?auto_36087 - BLOCK
      ?auto_36088 - BLOCK
      ?auto_36089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36085 ?auto_36086 ) ) ( not ( = ?auto_36085 ?auto_36087 ) ) ( not ( = ?auto_36085 ?auto_36088 ) ) ( not ( = ?auto_36085 ?auto_36089 ) ) ( not ( = ?auto_36086 ?auto_36087 ) ) ( not ( = ?auto_36086 ?auto_36088 ) ) ( not ( = ?auto_36086 ?auto_36089 ) ) ( not ( = ?auto_36087 ?auto_36088 ) ) ( not ( = ?auto_36087 ?auto_36089 ) ) ( not ( = ?auto_36088 ?auto_36089 ) ) ( ON-TABLE ?auto_36089 ) ( ON ?auto_36088 ?auto_36089 ) ( ON ?auto_36087 ?auto_36088 ) ( ON ?auto_36086 ?auto_36087 ) ( HOLDING ?auto_36085 ) ( CLEAR ?auto_36086 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36089 ?auto_36088 ?auto_36087 ?auto_36086 ?auto_36085 )
      ( MAKE-5PILE ?auto_36085 ?auto_36086 ?auto_36087 ?auto_36088 ?auto_36089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36090 - BLOCK
      ?auto_36091 - BLOCK
      ?auto_36092 - BLOCK
      ?auto_36093 - BLOCK
      ?auto_36094 - BLOCK
    )
    :vars
    (
      ?auto_36095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36090 ?auto_36091 ) ) ( not ( = ?auto_36090 ?auto_36092 ) ) ( not ( = ?auto_36090 ?auto_36093 ) ) ( not ( = ?auto_36090 ?auto_36094 ) ) ( not ( = ?auto_36091 ?auto_36092 ) ) ( not ( = ?auto_36091 ?auto_36093 ) ) ( not ( = ?auto_36091 ?auto_36094 ) ) ( not ( = ?auto_36092 ?auto_36093 ) ) ( not ( = ?auto_36092 ?auto_36094 ) ) ( not ( = ?auto_36093 ?auto_36094 ) ) ( ON-TABLE ?auto_36094 ) ( ON ?auto_36093 ?auto_36094 ) ( ON ?auto_36092 ?auto_36093 ) ( ON ?auto_36091 ?auto_36092 ) ( CLEAR ?auto_36091 ) ( ON ?auto_36090 ?auto_36095 ) ( CLEAR ?auto_36090 ) ( HAND-EMPTY ) ( not ( = ?auto_36090 ?auto_36095 ) ) ( not ( = ?auto_36091 ?auto_36095 ) ) ( not ( = ?auto_36092 ?auto_36095 ) ) ( not ( = ?auto_36093 ?auto_36095 ) ) ( not ( = ?auto_36094 ?auto_36095 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36090 ?auto_36095 )
      ( MAKE-5PILE ?auto_36090 ?auto_36091 ?auto_36092 ?auto_36093 ?auto_36094 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36096 - BLOCK
      ?auto_36097 - BLOCK
      ?auto_36098 - BLOCK
      ?auto_36099 - BLOCK
      ?auto_36100 - BLOCK
    )
    :vars
    (
      ?auto_36101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36096 ?auto_36097 ) ) ( not ( = ?auto_36096 ?auto_36098 ) ) ( not ( = ?auto_36096 ?auto_36099 ) ) ( not ( = ?auto_36096 ?auto_36100 ) ) ( not ( = ?auto_36097 ?auto_36098 ) ) ( not ( = ?auto_36097 ?auto_36099 ) ) ( not ( = ?auto_36097 ?auto_36100 ) ) ( not ( = ?auto_36098 ?auto_36099 ) ) ( not ( = ?auto_36098 ?auto_36100 ) ) ( not ( = ?auto_36099 ?auto_36100 ) ) ( ON-TABLE ?auto_36100 ) ( ON ?auto_36099 ?auto_36100 ) ( ON ?auto_36098 ?auto_36099 ) ( ON ?auto_36096 ?auto_36101 ) ( CLEAR ?auto_36096 ) ( not ( = ?auto_36096 ?auto_36101 ) ) ( not ( = ?auto_36097 ?auto_36101 ) ) ( not ( = ?auto_36098 ?auto_36101 ) ) ( not ( = ?auto_36099 ?auto_36101 ) ) ( not ( = ?auto_36100 ?auto_36101 ) ) ( HOLDING ?auto_36097 ) ( CLEAR ?auto_36098 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36100 ?auto_36099 ?auto_36098 ?auto_36097 )
      ( MAKE-5PILE ?auto_36096 ?auto_36097 ?auto_36098 ?auto_36099 ?auto_36100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36102 - BLOCK
      ?auto_36103 - BLOCK
      ?auto_36104 - BLOCK
      ?auto_36105 - BLOCK
      ?auto_36106 - BLOCK
    )
    :vars
    (
      ?auto_36107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36102 ?auto_36103 ) ) ( not ( = ?auto_36102 ?auto_36104 ) ) ( not ( = ?auto_36102 ?auto_36105 ) ) ( not ( = ?auto_36102 ?auto_36106 ) ) ( not ( = ?auto_36103 ?auto_36104 ) ) ( not ( = ?auto_36103 ?auto_36105 ) ) ( not ( = ?auto_36103 ?auto_36106 ) ) ( not ( = ?auto_36104 ?auto_36105 ) ) ( not ( = ?auto_36104 ?auto_36106 ) ) ( not ( = ?auto_36105 ?auto_36106 ) ) ( ON-TABLE ?auto_36106 ) ( ON ?auto_36105 ?auto_36106 ) ( ON ?auto_36104 ?auto_36105 ) ( ON ?auto_36102 ?auto_36107 ) ( not ( = ?auto_36102 ?auto_36107 ) ) ( not ( = ?auto_36103 ?auto_36107 ) ) ( not ( = ?auto_36104 ?auto_36107 ) ) ( not ( = ?auto_36105 ?auto_36107 ) ) ( not ( = ?auto_36106 ?auto_36107 ) ) ( CLEAR ?auto_36104 ) ( ON ?auto_36103 ?auto_36102 ) ( CLEAR ?auto_36103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36107 ?auto_36102 )
      ( MAKE-5PILE ?auto_36102 ?auto_36103 ?auto_36104 ?auto_36105 ?auto_36106 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36108 - BLOCK
      ?auto_36109 - BLOCK
      ?auto_36110 - BLOCK
      ?auto_36111 - BLOCK
      ?auto_36112 - BLOCK
    )
    :vars
    (
      ?auto_36113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36108 ?auto_36109 ) ) ( not ( = ?auto_36108 ?auto_36110 ) ) ( not ( = ?auto_36108 ?auto_36111 ) ) ( not ( = ?auto_36108 ?auto_36112 ) ) ( not ( = ?auto_36109 ?auto_36110 ) ) ( not ( = ?auto_36109 ?auto_36111 ) ) ( not ( = ?auto_36109 ?auto_36112 ) ) ( not ( = ?auto_36110 ?auto_36111 ) ) ( not ( = ?auto_36110 ?auto_36112 ) ) ( not ( = ?auto_36111 ?auto_36112 ) ) ( ON-TABLE ?auto_36112 ) ( ON ?auto_36111 ?auto_36112 ) ( ON ?auto_36108 ?auto_36113 ) ( not ( = ?auto_36108 ?auto_36113 ) ) ( not ( = ?auto_36109 ?auto_36113 ) ) ( not ( = ?auto_36110 ?auto_36113 ) ) ( not ( = ?auto_36111 ?auto_36113 ) ) ( not ( = ?auto_36112 ?auto_36113 ) ) ( ON ?auto_36109 ?auto_36108 ) ( CLEAR ?auto_36109 ) ( ON-TABLE ?auto_36113 ) ( HOLDING ?auto_36110 ) ( CLEAR ?auto_36111 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36112 ?auto_36111 ?auto_36110 )
      ( MAKE-5PILE ?auto_36108 ?auto_36109 ?auto_36110 ?auto_36111 ?auto_36112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36114 - BLOCK
      ?auto_36115 - BLOCK
      ?auto_36116 - BLOCK
      ?auto_36117 - BLOCK
      ?auto_36118 - BLOCK
    )
    :vars
    (
      ?auto_36119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36114 ?auto_36115 ) ) ( not ( = ?auto_36114 ?auto_36116 ) ) ( not ( = ?auto_36114 ?auto_36117 ) ) ( not ( = ?auto_36114 ?auto_36118 ) ) ( not ( = ?auto_36115 ?auto_36116 ) ) ( not ( = ?auto_36115 ?auto_36117 ) ) ( not ( = ?auto_36115 ?auto_36118 ) ) ( not ( = ?auto_36116 ?auto_36117 ) ) ( not ( = ?auto_36116 ?auto_36118 ) ) ( not ( = ?auto_36117 ?auto_36118 ) ) ( ON-TABLE ?auto_36118 ) ( ON ?auto_36117 ?auto_36118 ) ( ON ?auto_36114 ?auto_36119 ) ( not ( = ?auto_36114 ?auto_36119 ) ) ( not ( = ?auto_36115 ?auto_36119 ) ) ( not ( = ?auto_36116 ?auto_36119 ) ) ( not ( = ?auto_36117 ?auto_36119 ) ) ( not ( = ?auto_36118 ?auto_36119 ) ) ( ON ?auto_36115 ?auto_36114 ) ( ON-TABLE ?auto_36119 ) ( CLEAR ?auto_36117 ) ( ON ?auto_36116 ?auto_36115 ) ( CLEAR ?auto_36116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36119 ?auto_36114 ?auto_36115 )
      ( MAKE-5PILE ?auto_36114 ?auto_36115 ?auto_36116 ?auto_36117 ?auto_36118 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36120 - BLOCK
      ?auto_36121 - BLOCK
      ?auto_36122 - BLOCK
      ?auto_36123 - BLOCK
      ?auto_36124 - BLOCK
    )
    :vars
    (
      ?auto_36125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36120 ?auto_36121 ) ) ( not ( = ?auto_36120 ?auto_36122 ) ) ( not ( = ?auto_36120 ?auto_36123 ) ) ( not ( = ?auto_36120 ?auto_36124 ) ) ( not ( = ?auto_36121 ?auto_36122 ) ) ( not ( = ?auto_36121 ?auto_36123 ) ) ( not ( = ?auto_36121 ?auto_36124 ) ) ( not ( = ?auto_36122 ?auto_36123 ) ) ( not ( = ?auto_36122 ?auto_36124 ) ) ( not ( = ?auto_36123 ?auto_36124 ) ) ( ON-TABLE ?auto_36124 ) ( ON ?auto_36120 ?auto_36125 ) ( not ( = ?auto_36120 ?auto_36125 ) ) ( not ( = ?auto_36121 ?auto_36125 ) ) ( not ( = ?auto_36122 ?auto_36125 ) ) ( not ( = ?auto_36123 ?auto_36125 ) ) ( not ( = ?auto_36124 ?auto_36125 ) ) ( ON ?auto_36121 ?auto_36120 ) ( ON-TABLE ?auto_36125 ) ( ON ?auto_36122 ?auto_36121 ) ( CLEAR ?auto_36122 ) ( HOLDING ?auto_36123 ) ( CLEAR ?auto_36124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36124 ?auto_36123 )
      ( MAKE-5PILE ?auto_36120 ?auto_36121 ?auto_36122 ?auto_36123 ?auto_36124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36126 - BLOCK
      ?auto_36127 - BLOCK
      ?auto_36128 - BLOCK
      ?auto_36129 - BLOCK
      ?auto_36130 - BLOCK
    )
    :vars
    (
      ?auto_36131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36126 ?auto_36127 ) ) ( not ( = ?auto_36126 ?auto_36128 ) ) ( not ( = ?auto_36126 ?auto_36129 ) ) ( not ( = ?auto_36126 ?auto_36130 ) ) ( not ( = ?auto_36127 ?auto_36128 ) ) ( not ( = ?auto_36127 ?auto_36129 ) ) ( not ( = ?auto_36127 ?auto_36130 ) ) ( not ( = ?auto_36128 ?auto_36129 ) ) ( not ( = ?auto_36128 ?auto_36130 ) ) ( not ( = ?auto_36129 ?auto_36130 ) ) ( ON-TABLE ?auto_36130 ) ( ON ?auto_36126 ?auto_36131 ) ( not ( = ?auto_36126 ?auto_36131 ) ) ( not ( = ?auto_36127 ?auto_36131 ) ) ( not ( = ?auto_36128 ?auto_36131 ) ) ( not ( = ?auto_36129 ?auto_36131 ) ) ( not ( = ?auto_36130 ?auto_36131 ) ) ( ON ?auto_36127 ?auto_36126 ) ( ON-TABLE ?auto_36131 ) ( ON ?auto_36128 ?auto_36127 ) ( CLEAR ?auto_36130 ) ( ON ?auto_36129 ?auto_36128 ) ( CLEAR ?auto_36129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36131 ?auto_36126 ?auto_36127 ?auto_36128 )
      ( MAKE-5PILE ?auto_36126 ?auto_36127 ?auto_36128 ?auto_36129 ?auto_36130 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36132 - BLOCK
      ?auto_36133 - BLOCK
      ?auto_36134 - BLOCK
      ?auto_36135 - BLOCK
      ?auto_36136 - BLOCK
    )
    :vars
    (
      ?auto_36137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36132 ?auto_36133 ) ) ( not ( = ?auto_36132 ?auto_36134 ) ) ( not ( = ?auto_36132 ?auto_36135 ) ) ( not ( = ?auto_36132 ?auto_36136 ) ) ( not ( = ?auto_36133 ?auto_36134 ) ) ( not ( = ?auto_36133 ?auto_36135 ) ) ( not ( = ?auto_36133 ?auto_36136 ) ) ( not ( = ?auto_36134 ?auto_36135 ) ) ( not ( = ?auto_36134 ?auto_36136 ) ) ( not ( = ?auto_36135 ?auto_36136 ) ) ( ON ?auto_36132 ?auto_36137 ) ( not ( = ?auto_36132 ?auto_36137 ) ) ( not ( = ?auto_36133 ?auto_36137 ) ) ( not ( = ?auto_36134 ?auto_36137 ) ) ( not ( = ?auto_36135 ?auto_36137 ) ) ( not ( = ?auto_36136 ?auto_36137 ) ) ( ON ?auto_36133 ?auto_36132 ) ( ON-TABLE ?auto_36137 ) ( ON ?auto_36134 ?auto_36133 ) ( ON ?auto_36135 ?auto_36134 ) ( CLEAR ?auto_36135 ) ( HOLDING ?auto_36136 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36136 )
      ( MAKE-5PILE ?auto_36132 ?auto_36133 ?auto_36134 ?auto_36135 ?auto_36136 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36138 - BLOCK
      ?auto_36139 - BLOCK
      ?auto_36140 - BLOCK
      ?auto_36141 - BLOCK
      ?auto_36142 - BLOCK
    )
    :vars
    (
      ?auto_36143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36138 ?auto_36139 ) ) ( not ( = ?auto_36138 ?auto_36140 ) ) ( not ( = ?auto_36138 ?auto_36141 ) ) ( not ( = ?auto_36138 ?auto_36142 ) ) ( not ( = ?auto_36139 ?auto_36140 ) ) ( not ( = ?auto_36139 ?auto_36141 ) ) ( not ( = ?auto_36139 ?auto_36142 ) ) ( not ( = ?auto_36140 ?auto_36141 ) ) ( not ( = ?auto_36140 ?auto_36142 ) ) ( not ( = ?auto_36141 ?auto_36142 ) ) ( ON ?auto_36138 ?auto_36143 ) ( not ( = ?auto_36138 ?auto_36143 ) ) ( not ( = ?auto_36139 ?auto_36143 ) ) ( not ( = ?auto_36140 ?auto_36143 ) ) ( not ( = ?auto_36141 ?auto_36143 ) ) ( not ( = ?auto_36142 ?auto_36143 ) ) ( ON ?auto_36139 ?auto_36138 ) ( ON-TABLE ?auto_36143 ) ( ON ?auto_36140 ?auto_36139 ) ( ON ?auto_36141 ?auto_36140 ) ( ON ?auto_36142 ?auto_36141 ) ( CLEAR ?auto_36142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36143 ?auto_36138 ?auto_36139 ?auto_36140 ?auto_36141 )
      ( MAKE-5PILE ?auto_36138 ?auto_36139 ?auto_36140 ?auto_36141 ?auto_36142 ) )
  )

)

