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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175078 - BLOCK
      ?auto_175079 - BLOCK
      ?auto_175080 - BLOCK
      ?auto_175081 - BLOCK
      ?auto_175082 - BLOCK
      ?auto_175083 - BLOCK
      ?auto_175084 - BLOCK
      ?auto_175085 - BLOCK
    )
    :vars
    (
      ?auto_175086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175086 ?auto_175085 ) ( CLEAR ?auto_175086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175078 ) ( ON ?auto_175079 ?auto_175078 ) ( ON ?auto_175080 ?auto_175079 ) ( ON ?auto_175081 ?auto_175080 ) ( ON ?auto_175082 ?auto_175081 ) ( ON ?auto_175083 ?auto_175082 ) ( ON ?auto_175084 ?auto_175083 ) ( ON ?auto_175085 ?auto_175084 ) ( not ( = ?auto_175078 ?auto_175079 ) ) ( not ( = ?auto_175078 ?auto_175080 ) ) ( not ( = ?auto_175078 ?auto_175081 ) ) ( not ( = ?auto_175078 ?auto_175082 ) ) ( not ( = ?auto_175078 ?auto_175083 ) ) ( not ( = ?auto_175078 ?auto_175084 ) ) ( not ( = ?auto_175078 ?auto_175085 ) ) ( not ( = ?auto_175078 ?auto_175086 ) ) ( not ( = ?auto_175079 ?auto_175080 ) ) ( not ( = ?auto_175079 ?auto_175081 ) ) ( not ( = ?auto_175079 ?auto_175082 ) ) ( not ( = ?auto_175079 ?auto_175083 ) ) ( not ( = ?auto_175079 ?auto_175084 ) ) ( not ( = ?auto_175079 ?auto_175085 ) ) ( not ( = ?auto_175079 ?auto_175086 ) ) ( not ( = ?auto_175080 ?auto_175081 ) ) ( not ( = ?auto_175080 ?auto_175082 ) ) ( not ( = ?auto_175080 ?auto_175083 ) ) ( not ( = ?auto_175080 ?auto_175084 ) ) ( not ( = ?auto_175080 ?auto_175085 ) ) ( not ( = ?auto_175080 ?auto_175086 ) ) ( not ( = ?auto_175081 ?auto_175082 ) ) ( not ( = ?auto_175081 ?auto_175083 ) ) ( not ( = ?auto_175081 ?auto_175084 ) ) ( not ( = ?auto_175081 ?auto_175085 ) ) ( not ( = ?auto_175081 ?auto_175086 ) ) ( not ( = ?auto_175082 ?auto_175083 ) ) ( not ( = ?auto_175082 ?auto_175084 ) ) ( not ( = ?auto_175082 ?auto_175085 ) ) ( not ( = ?auto_175082 ?auto_175086 ) ) ( not ( = ?auto_175083 ?auto_175084 ) ) ( not ( = ?auto_175083 ?auto_175085 ) ) ( not ( = ?auto_175083 ?auto_175086 ) ) ( not ( = ?auto_175084 ?auto_175085 ) ) ( not ( = ?auto_175084 ?auto_175086 ) ) ( not ( = ?auto_175085 ?auto_175086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175086 ?auto_175085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175088 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_175088 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_175088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175089 - BLOCK
    )
    :vars
    (
      ?auto_175090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175089 ?auto_175090 ) ( CLEAR ?auto_175089 ) ( HAND-EMPTY ) ( not ( = ?auto_175089 ?auto_175090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175089 ?auto_175090 )
      ( MAKE-1PILE ?auto_175089 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175098 - BLOCK
      ?auto_175099 - BLOCK
      ?auto_175100 - BLOCK
      ?auto_175101 - BLOCK
      ?auto_175102 - BLOCK
      ?auto_175103 - BLOCK
      ?auto_175104 - BLOCK
    )
    :vars
    (
      ?auto_175105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175105 ?auto_175104 ) ( CLEAR ?auto_175105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175098 ) ( ON ?auto_175099 ?auto_175098 ) ( ON ?auto_175100 ?auto_175099 ) ( ON ?auto_175101 ?auto_175100 ) ( ON ?auto_175102 ?auto_175101 ) ( ON ?auto_175103 ?auto_175102 ) ( ON ?auto_175104 ?auto_175103 ) ( not ( = ?auto_175098 ?auto_175099 ) ) ( not ( = ?auto_175098 ?auto_175100 ) ) ( not ( = ?auto_175098 ?auto_175101 ) ) ( not ( = ?auto_175098 ?auto_175102 ) ) ( not ( = ?auto_175098 ?auto_175103 ) ) ( not ( = ?auto_175098 ?auto_175104 ) ) ( not ( = ?auto_175098 ?auto_175105 ) ) ( not ( = ?auto_175099 ?auto_175100 ) ) ( not ( = ?auto_175099 ?auto_175101 ) ) ( not ( = ?auto_175099 ?auto_175102 ) ) ( not ( = ?auto_175099 ?auto_175103 ) ) ( not ( = ?auto_175099 ?auto_175104 ) ) ( not ( = ?auto_175099 ?auto_175105 ) ) ( not ( = ?auto_175100 ?auto_175101 ) ) ( not ( = ?auto_175100 ?auto_175102 ) ) ( not ( = ?auto_175100 ?auto_175103 ) ) ( not ( = ?auto_175100 ?auto_175104 ) ) ( not ( = ?auto_175100 ?auto_175105 ) ) ( not ( = ?auto_175101 ?auto_175102 ) ) ( not ( = ?auto_175101 ?auto_175103 ) ) ( not ( = ?auto_175101 ?auto_175104 ) ) ( not ( = ?auto_175101 ?auto_175105 ) ) ( not ( = ?auto_175102 ?auto_175103 ) ) ( not ( = ?auto_175102 ?auto_175104 ) ) ( not ( = ?auto_175102 ?auto_175105 ) ) ( not ( = ?auto_175103 ?auto_175104 ) ) ( not ( = ?auto_175103 ?auto_175105 ) ) ( not ( = ?auto_175104 ?auto_175105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175105 ?auto_175104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175106 - BLOCK
      ?auto_175107 - BLOCK
      ?auto_175108 - BLOCK
      ?auto_175109 - BLOCK
      ?auto_175110 - BLOCK
      ?auto_175111 - BLOCK
      ?auto_175112 - BLOCK
    )
    :vars
    (
      ?auto_175113 - BLOCK
      ?auto_175114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175113 ?auto_175112 ) ( CLEAR ?auto_175113 ) ( ON-TABLE ?auto_175106 ) ( ON ?auto_175107 ?auto_175106 ) ( ON ?auto_175108 ?auto_175107 ) ( ON ?auto_175109 ?auto_175108 ) ( ON ?auto_175110 ?auto_175109 ) ( ON ?auto_175111 ?auto_175110 ) ( ON ?auto_175112 ?auto_175111 ) ( not ( = ?auto_175106 ?auto_175107 ) ) ( not ( = ?auto_175106 ?auto_175108 ) ) ( not ( = ?auto_175106 ?auto_175109 ) ) ( not ( = ?auto_175106 ?auto_175110 ) ) ( not ( = ?auto_175106 ?auto_175111 ) ) ( not ( = ?auto_175106 ?auto_175112 ) ) ( not ( = ?auto_175106 ?auto_175113 ) ) ( not ( = ?auto_175107 ?auto_175108 ) ) ( not ( = ?auto_175107 ?auto_175109 ) ) ( not ( = ?auto_175107 ?auto_175110 ) ) ( not ( = ?auto_175107 ?auto_175111 ) ) ( not ( = ?auto_175107 ?auto_175112 ) ) ( not ( = ?auto_175107 ?auto_175113 ) ) ( not ( = ?auto_175108 ?auto_175109 ) ) ( not ( = ?auto_175108 ?auto_175110 ) ) ( not ( = ?auto_175108 ?auto_175111 ) ) ( not ( = ?auto_175108 ?auto_175112 ) ) ( not ( = ?auto_175108 ?auto_175113 ) ) ( not ( = ?auto_175109 ?auto_175110 ) ) ( not ( = ?auto_175109 ?auto_175111 ) ) ( not ( = ?auto_175109 ?auto_175112 ) ) ( not ( = ?auto_175109 ?auto_175113 ) ) ( not ( = ?auto_175110 ?auto_175111 ) ) ( not ( = ?auto_175110 ?auto_175112 ) ) ( not ( = ?auto_175110 ?auto_175113 ) ) ( not ( = ?auto_175111 ?auto_175112 ) ) ( not ( = ?auto_175111 ?auto_175113 ) ) ( not ( = ?auto_175112 ?auto_175113 ) ) ( HOLDING ?auto_175114 ) ( not ( = ?auto_175106 ?auto_175114 ) ) ( not ( = ?auto_175107 ?auto_175114 ) ) ( not ( = ?auto_175108 ?auto_175114 ) ) ( not ( = ?auto_175109 ?auto_175114 ) ) ( not ( = ?auto_175110 ?auto_175114 ) ) ( not ( = ?auto_175111 ?auto_175114 ) ) ( not ( = ?auto_175112 ?auto_175114 ) ) ( not ( = ?auto_175113 ?auto_175114 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_175114 )
      ( MAKE-7PILE ?auto_175106 ?auto_175107 ?auto_175108 ?auto_175109 ?auto_175110 ?auto_175111 ?auto_175112 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175115 - BLOCK
      ?auto_175116 - BLOCK
      ?auto_175117 - BLOCK
      ?auto_175118 - BLOCK
      ?auto_175119 - BLOCK
      ?auto_175120 - BLOCK
      ?auto_175121 - BLOCK
    )
    :vars
    (
      ?auto_175122 - BLOCK
      ?auto_175123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175122 ?auto_175121 ) ( ON-TABLE ?auto_175115 ) ( ON ?auto_175116 ?auto_175115 ) ( ON ?auto_175117 ?auto_175116 ) ( ON ?auto_175118 ?auto_175117 ) ( ON ?auto_175119 ?auto_175118 ) ( ON ?auto_175120 ?auto_175119 ) ( ON ?auto_175121 ?auto_175120 ) ( not ( = ?auto_175115 ?auto_175116 ) ) ( not ( = ?auto_175115 ?auto_175117 ) ) ( not ( = ?auto_175115 ?auto_175118 ) ) ( not ( = ?auto_175115 ?auto_175119 ) ) ( not ( = ?auto_175115 ?auto_175120 ) ) ( not ( = ?auto_175115 ?auto_175121 ) ) ( not ( = ?auto_175115 ?auto_175122 ) ) ( not ( = ?auto_175116 ?auto_175117 ) ) ( not ( = ?auto_175116 ?auto_175118 ) ) ( not ( = ?auto_175116 ?auto_175119 ) ) ( not ( = ?auto_175116 ?auto_175120 ) ) ( not ( = ?auto_175116 ?auto_175121 ) ) ( not ( = ?auto_175116 ?auto_175122 ) ) ( not ( = ?auto_175117 ?auto_175118 ) ) ( not ( = ?auto_175117 ?auto_175119 ) ) ( not ( = ?auto_175117 ?auto_175120 ) ) ( not ( = ?auto_175117 ?auto_175121 ) ) ( not ( = ?auto_175117 ?auto_175122 ) ) ( not ( = ?auto_175118 ?auto_175119 ) ) ( not ( = ?auto_175118 ?auto_175120 ) ) ( not ( = ?auto_175118 ?auto_175121 ) ) ( not ( = ?auto_175118 ?auto_175122 ) ) ( not ( = ?auto_175119 ?auto_175120 ) ) ( not ( = ?auto_175119 ?auto_175121 ) ) ( not ( = ?auto_175119 ?auto_175122 ) ) ( not ( = ?auto_175120 ?auto_175121 ) ) ( not ( = ?auto_175120 ?auto_175122 ) ) ( not ( = ?auto_175121 ?auto_175122 ) ) ( not ( = ?auto_175115 ?auto_175123 ) ) ( not ( = ?auto_175116 ?auto_175123 ) ) ( not ( = ?auto_175117 ?auto_175123 ) ) ( not ( = ?auto_175118 ?auto_175123 ) ) ( not ( = ?auto_175119 ?auto_175123 ) ) ( not ( = ?auto_175120 ?auto_175123 ) ) ( not ( = ?auto_175121 ?auto_175123 ) ) ( not ( = ?auto_175122 ?auto_175123 ) ) ( ON ?auto_175123 ?auto_175122 ) ( CLEAR ?auto_175123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175115 ?auto_175116 ?auto_175117 ?auto_175118 ?auto_175119 ?auto_175120 ?auto_175121 ?auto_175122 )
      ( MAKE-7PILE ?auto_175115 ?auto_175116 ?auto_175117 ?auto_175118 ?auto_175119 ?auto_175120 ?auto_175121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175126 - BLOCK
      ?auto_175127 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_175127 ) ( CLEAR ?auto_175126 ) ( ON-TABLE ?auto_175126 ) ( not ( = ?auto_175126 ?auto_175127 ) ) )
    :subtasks
    ( ( !STACK ?auto_175127 ?auto_175126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175128 - BLOCK
      ?auto_175129 - BLOCK
    )
    :vars
    (
      ?auto_175130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175128 ) ( ON-TABLE ?auto_175128 ) ( not ( = ?auto_175128 ?auto_175129 ) ) ( ON ?auto_175129 ?auto_175130 ) ( CLEAR ?auto_175129 ) ( HAND-EMPTY ) ( not ( = ?auto_175128 ?auto_175130 ) ) ( not ( = ?auto_175129 ?auto_175130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175129 ?auto_175130 )
      ( MAKE-2PILE ?auto_175128 ?auto_175129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175131 - BLOCK
      ?auto_175132 - BLOCK
    )
    :vars
    (
      ?auto_175133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175131 ?auto_175132 ) ) ( ON ?auto_175132 ?auto_175133 ) ( CLEAR ?auto_175132 ) ( not ( = ?auto_175131 ?auto_175133 ) ) ( not ( = ?auto_175132 ?auto_175133 ) ) ( HOLDING ?auto_175131 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175131 )
      ( MAKE-2PILE ?auto_175131 ?auto_175132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175134 - BLOCK
      ?auto_175135 - BLOCK
    )
    :vars
    (
      ?auto_175136 - BLOCK
      ?auto_175140 - BLOCK
      ?auto_175139 - BLOCK
      ?auto_175141 - BLOCK
      ?auto_175142 - BLOCK
      ?auto_175137 - BLOCK
      ?auto_175138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175134 ?auto_175135 ) ) ( ON ?auto_175135 ?auto_175136 ) ( not ( = ?auto_175134 ?auto_175136 ) ) ( not ( = ?auto_175135 ?auto_175136 ) ) ( ON ?auto_175134 ?auto_175135 ) ( CLEAR ?auto_175134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175140 ) ( ON ?auto_175139 ?auto_175140 ) ( ON ?auto_175141 ?auto_175139 ) ( ON ?auto_175142 ?auto_175141 ) ( ON ?auto_175137 ?auto_175142 ) ( ON ?auto_175138 ?auto_175137 ) ( ON ?auto_175136 ?auto_175138 ) ( not ( = ?auto_175140 ?auto_175139 ) ) ( not ( = ?auto_175140 ?auto_175141 ) ) ( not ( = ?auto_175140 ?auto_175142 ) ) ( not ( = ?auto_175140 ?auto_175137 ) ) ( not ( = ?auto_175140 ?auto_175138 ) ) ( not ( = ?auto_175140 ?auto_175136 ) ) ( not ( = ?auto_175140 ?auto_175135 ) ) ( not ( = ?auto_175140 ?auto_175134 ) ) ( not ( = ?auto_175139 ?auto_175141 ) ) ( not ( = ?auto_175139 ?auto_175142 ) ) ( not ( = ?auto_175139 ?auto_175137 ) ) ( not ( = ?auto_175139 ?auto_175138 ) ) ( not ( = ?auto_175139 ?auto_175136 ) ) ( not ( = ?auto_175139 ?auto_175135 ) ) ( not ( = ?auto_175139 ?auto_175134 ) ) ( not ( = ?auto_175141 ?auto_175142 ) ) ( not ( = ?auto_175141 ?auto_175137 ) ) ( not ( = ?auto_175141 ?auto_175138 ) ) ( not ( = ?auto_175141 ?auto_175136 ) ) ( not ( = ?auto_175141 ?auto_175135 ) ) ( not ( = ?auto_175141 ?auto_175134 ) ) ( not ( = ?auto_175142 ?auto_175137 ) ) ( not ( = ?auto_175142 ?auto_175138 ) ) ( not ( = ?auto_175142 ?auto_175136 ) ) ( not ( = ?auto_175142 ?auto_175135 ) ) ( not ( = ?auto_175142 ?auto_175134 ) ) ( not ( = ?auto_175137 ?auto_175138 ) ) ( not ( = ?auto_175137 ?auto_175136 ) ) ( not ( = ?auto_175137 ?auto_175135 ) ) ( not ( = ?auto_175137 ?auto_175134 ) ) ( not ( = ?auto_175138 ?auto_175136 ) ) ( not ( = ?auto_175138 ?auto_175135 ) ) ( not ( = ?auto_175138 ?auto_175134 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175140 ?auto_175139 ?auto_175141 ?auto_175142 ?auto_175137 ?auto_175138 ?auto_175136 ?auto_175135 )
      ( MAKE-2PILE ?auto_175134 ?auto_175135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175149 - BLOCK
      ?auto_175150 - BLOCK
      ?auto_175151 - BLOCK
      ?auto_175152 - BLOCK
      ?auto_175153 - BLOCK
      ?auto_175154 - BLOCK
    )
    :vars
    (
      ?auto_175155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175155 ?auto_175154 ) ( CLEAR ?auto_175155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175149 ) ( ON ?auto_175150 ?auto_175149 ) ( ON ?auto_175151 ?auto_175150 ) ( ON ?auto_175152 ?auto_175151 ) ( ON ?auto_175153 ?auto_175152 ) ( ON ?auto_175154 ?auto_175153 ) ( not ( = ?auto_175149 ?auto_175150 ) ) ( not ( = ?auto_175149 ?auto_175151 ) ) ( not ( = ?auto_175149 ?auto_175152 ) ) ( not ( = ?auto_175149 ?auto_175153 ) ) ( not ( = ?auto_175149 ?auto_175154 ) ) ( not ( = ?auto_175149 ?auto_175155 ) ) ( not ( = ?auto_175150 ?auto_175151 ) ) ( not ( = ?auto_175150 ?auto_175152 ) ) ( not ( = ?auto_175150 ?auto_175153 ) ) ( not ( = ?auto_175150 ?auto_175154 ) ) ( not ( = ?auto_175150 ?auto_175155 ) ) ( not ( = ?auto_175151 ?auto_175152 ) ) ( not ( = ?auto_175151 ?auto_175153 ) ) ( not ( = ?auto_175151 ?auto_175154 ) ) ( not ( = ?auto_175151 ?auto_175155 ) ) ( not ( = ?auto_175152 ?auto_175153 ) ) ( not ( = ?auto_175152 ?auto_175154 ) ) ( not ( = ?auto_175152 ?auto_175155 ) ) ( not ( = ?auto_175153 ?auto_175154 ) ) ( not ( = ?auto_175153 ?auto_175155 ) ) ( not ( = ?auto_175154 ?auto_175155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175155 ?auto_175154 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175156 - BLOCK
      ?auto_175157 - BLOCK
      ?auto_175158 - BLOCK
      ?auto_175159 - BLOCK
      ?auto_175160 - BLOCK
      ?auto_175161 - BLOCK
    )
    :vars
    (
      ?auto_175162 - BLOCK
      ?auto_175163 - BLOCK
      ?auto_175164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175162 ?auto_175161 ) ( CLEAR ?auto_175162 ) ( ON-TABLE ?auto_175156 ) ( ON ?auto_175157 ?auto_175156 ) ( ON ?auto_175158 ?auto_175157 ) ( ON ?auto_175159 ?auto_175158 ) ( ON ?auto_175160 ?auto_175159 ) ( ON ?auto_175161 ?auto_175160 ) ( not ( = ?auto_175156 ?auto_175157 ) ) ( not ( = ?auto_175156 ?auto_175158 ) ) ( not ( = ?auto_175156 ?auto_175159 ) ) ( not ( = ?auto_175156 ?auto_175160 ) ) ( not ( = ?auto_175156 ?auto_175161 ) ) ( not ( = ?auto_175156 ?auto_175162 ) ) ( not ( = ?auto_175157 ?auto_175158 ) ) ( not ( = ?auto_175157 ?auto_175159 ) ) ( not ( = ?auto_175157 ?auto_175160 ) ) ( not ( = ?auto_175157 ?auto_175161 ) ) ( not ( = ?auto_175157 ?auto_175162 ) ) ( not ( = ?auto_175158 ?auto_175159 ) ) ( not ( = ?auto_175158 ?auto_175160 ) ) ( not ( = ?auto_175158 ?auto_175161 ) ) ( not ( = ?auto_175158 ?auto_175162 ) ) ( not ( = ?auto_175159 ?auto_175160 ) ) ( not ( = ?auto_175159 ?auto_175161 ) ) ( not ( = ?auto_175159 ?auto_175162 ) ) ( not ( = ?auto_175160 ?auto_175161 ) ) ( not ( = ?auto_175160 ?auto_175162 ) ) ( not ( = ?auto_175161 ?auto_175162 ) ) ( HOLDING ?auto_175163 ) ( CLEAR ?auto_175164 ) ( not ( = ?auto_175156 ?auto_175163 ) ) ( not ( = ?auto_175156 ?auto_175164 ) ) ( not ( = ?auto_175157 ?auto_175163 ) ) ( not ( = ?auto_175157 ?auto_175164 ) ) ( not ( = ?auto_175158 ?auto_175163 ) ) ( not ( = ?auto_175158 ?auto_175164 ) ) ( not ( = ?auto_175159 ?auto_175163 ) ) ( not ( = ?auto_175159 ?auto_175164 ) ) ( not ( = ?auto_175160 ?auto_175163 ) ) ( not ( = ?auto_175160 ?auto_175164 ) ) ( not ( = ?auto_175161 ?auto_175163 ) ) ( not ( = ?auto_175161 ?auto_175164 ) ) ( not ( = ?auto_175162 ?auto_175163 ) ) ( not ( = ?auto_175162 ?auto_175164 ) ) ( not ( = ?auto_175163 ?auto_175164 ) ) )
    :subtasks
    ( ( !STACK ?auto_175163 ?auto_175164 )
      ( MAKE-6PILE ?auto_175156 ?auto_175157 ?auto_175158 ?auto_175159 ?auto_175160 ?auto_175161 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175165 - BLOCK
      ?auto_175166 - BLOCK
      ?auto_175167 - BLOCK
      ?auto_175168 - BLOCK
      ?auto_175169 - BLOCK
      ?auto_175170 - BLOCK
    )
    :vars
    (
      ?auto_175173 - BLOCK
      ?auto_175172 - BLOCK
      ?auto_175171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175173 ?auto_175170 ) ( ON-TABLE ?auto_175165 ) ( ON ?auto_175166 ?auto_175165 ) ( ON ?auto_175167 ?auto_175166 ) ( ON ?auto_175168 ?auto_175167 ) ( ON ?auto_175169 ?auto_175168 ) ( ON ?auto_175170 ?auto_175169 ) ( not ( = ?auto_175165 ?auto_175166 ) ) ( not ( = ?auto_175165 ?auto_175167 ) ) ( not ( = ?auto_175165 ?auto_175168 ) ) ( not ( = ?auto_175165 ?auto_175169 ) ) ( not ( = ?auto_175165 ?auto_175170 ) ) ( not ( = ?auto_175165 ?auto_175173 ) ) ( not ( = ?auto_175166 ?auto_175167 ) ) ( not ( = ?auto_175166 ?auto_175168 ) ) ( not ( = ?auto_175166 ?auto_175169 ) ) ( not ( = ?auto_175166 ?auto_175170 ) ) ( not ( = ?auto_175166 ?auto_175173 ) ) ( not ( = ?auto_175167 ?auto_175168 ) ) ( not ( = ?auto_175167 ?auto_175169 ) ) ( not ( = ?auto_175167 ?auto_175170 ) ) ( not ( = ?auto_175167 ?auto_175173 ) ) ( not ( = ?auto_175168 ?auto_175169 ) ) ( not ( = ?auto_175168 ?auto_175170 ) ) ( not ( = ?auto_175168 ?auto_175173 ) ) ( not ( = ?auto_175169 ?auto_175170 ) ) ( not ( = ?auto_175169 ?auto_175173 ) ) ( not ( = ?auto_175170 ?auto_175173 ) ) ( CLEAR ?auto_175172 ) ( not ( = ?auto_175165 ?auto_175171 ) ) ( not ( = ?auto_175165 ?auto_175172 ) ) ( not ( = ?auto_175166 ?auto_175171 ) ) ( not ( = ?auto_175166 ?auto_175172 ) ) ( not ( = ?auto_175167 ?auto_175171 ) ) ( not ( = ?auto_175167 ?auto_175172 ) ) ( not ( = ?auto_175168 ?auto_175171 ) ) ( not ( = ?auto_175168 ?auto_175172 ) ) ( not ( = ?auto_175169 ?auto_175171 ) ) ( not ( = ?auto_175169 ?auto_175172 ) ) ( not ( = ?auto_175170 ?auto_175171 ) ) ( not ( = ?auto_175170 ?auto_175172 ) ) ( not ( = ?auto_175173 ?auto_175171 ) ) ( not ( = ?auto_175173 ?auto_175172 ) ) ( not ( = ?auto_175171 ?auto_175172 ) ) ( ON ?auto_175171 ?auto_175173 ) ( CLEAR ?auto_175171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175165 ?auto_175166 ?auto_175167 ?auto_175168 ?auto_175169 ?auto_175170 ?auto_175173 )
      ( MAKE-6PILE ?auto_175165 ?auto_175166 ?auto_175167 ?auto_175168 ?auto_175169 ?auto_175170 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175174 - BLOCK
      ?auto_175175 - BLOCK
      ?auto_175176 - BLOCK
      ?auto_175177 - BLOCK
      ?auto_175178 - BLOCK
      ?auto_175179 - BLOCK
    )
    :vars
    (
      ?auto_175182 - BLOCK
      ?auto_175181 - BLOCK
      ?auto_175180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175182 ?auto_175179 ) ( ON-TABLE ?auto_175174 ) ( ON ?auto_175175 ?auto_175174 ) ( ON ?auto_175176 ?auto_175175 ) ( ON ?auto_175177 ?auto_175176 ) ( ON ?auto_175178 ?auto_175177 ) ( ON ?auto_175179 ?auto_175178 ) ( not ( = ?auto_175174 ?auto_175175 ) ) ( not ( = ?auto_175174 ?auto_175176 ) ) ( not ( = ?auto_175174 ?auto_175177 ) ) ( not ( = ?auto_175174 ?auto_175178 ) ) ( not ( = ?auto_175174 ?auto_175179 ) ) ( not ( = ?auto_175174 ?auto_175182 ) ) ( not ( = ?auto_175175 ?auto_175176 ) ) ( not ( = ?auto_175175 ?auto_175177 ) ) ( not ( = ?auto_175175 ?auto_175178 ) ) ( not ( = ?auto_175175 ?auto_175179 ) ) ( not ( = ?auto_175175 ?auto_175182 ) ) ( not ( = ?auto_175176 ?auto_175177 ) ) ( not ( = ?auto_175176 ?auto_175178 ) ) ( not ( = ?auto_175176 ?auto_175179 ) ) ( not ( = ?auto_175176 ?auto_175182 ) ) ( not ( = ?auto_175177 ?auto_175178 ) ) ( not ( = ?auto_175177 ?auto_175179 ) ) ( not ( = ?auto_175177 ?auto_175182 ) ) ( not ( = ?auto_175178 ?auto_175179 ) ) ( not ( = ?auto_175178 ?auto_175182 ) ) ( not ( = ?auto_175179 ?auto_175182 ) ) ( not ( = ?auto_175174 ?auto_175181 ) ) ( not ( = ?auto_175174 ?auto_175180 ) ) ( not ( = ?auto_175175 ?auto_175181 ) ) ( not ( = ?auto_175175 ?auto_175180 ) ) ( not ( = ?auto_175176 ?auto_175181 ) ) ( not ( = ?auto_175176 ?auto_175180 ) ) ( not ( = ?auto_175177 ?auto_175181 ) ) ( not ( = ?auto_175177 ?auto_175180 ) ) ( not ( = ?auto_175178 ?auto_175181 ) ) ( not ( = ?auto_175178 ?auto_175180 ) ) ( not ( = ?auto_175179 ?auto_175181 ) ) ( not ( = ?auto_175179 ?auto_175180 ) ) ( not ( = ?auto_175182 ?auto_175181 ) ) ( not ( = ?auto_175182 ?auto_175180 ) ) ( not ( = ?auto_175181 ?auto_175180 ) ) ( ON ?auto_175181 ?auto_175182 ) ( CLEAR ?auto_175181 ) ( HOLDING ?auto_175180 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175180 )
      ( MAKE-6PILE ?auto_175174 ?auto_175175 ?auto_175176 ?auto_175177 ?auto_175178 ?auto_175179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175183 - BLOCK
      ?auto_175184 - BLOCK
      ?auto_175185 - BLOCK
      ?auto_175186 - BLOCK
      ?auto_175187 - BLOCK
      ?auto_175188 - BLOCK
    )
    :vars
    (
      ?auto_175190 - BLOCK
      ?auto_175189 - BLOCK
      ?auto_175191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175190 ?auto_175188 ) ( ON-TABLE ?auto_175183 ) ( ON ?auto_175184 ?auto_175183 ) ( ON ?auto_175185 ?auto_175184 ) ( ON ?auto_175186 ?auto_175185 ) ( ON ?auto_175187 ?auto_175186 ) ( ON ?auto_175188 ?auto_175187 ) ( not ( = ?auto_175183 ?auto_175184 ) ) ( not ( = ?auto_175183 ?auto_175185 ) ) ( not ( = ?auto_175183 ?auto_175186 ) ) ( not ( = ?auto_175183 ?auto_175187 ) ) ( not ( = ?auto_175183 ?auto_175188 ) ) ( not ( = ?auto_175183 ?auto_175190 ) ) ( not ( = ?auto_175184 ?auto_175185 ) ) ( not ( = ?auto_175184 ?auto_175186 ) ) ( not ( = ?auto_175184 ?auto_175187 ) ) ( not ( = ?auto_175184 ?auto_175188 ) ) ( not ( = ?auto_175184 ?auto_175190 ) ) ( not ( = ?auto_175185 ?auto_175186 ) ) ( not ( = ?auto_175185 ?auto_175187 ) ) ( not ( = ?auto_175185 ?auto_175188 ) ) ( not ( = ?auto_175185 ?auto_175190 ) ) ( not ( = ?auto_175186 ?auto_175187 ) ) ( not ( = ?auto_175186 ?auto_175188 ) ) ( not ( = ?auto_175186 ?auto_175190 ) ) ( not ( = ?auto_175187 ?auto_175188 ) ) ( not ( = ?auto_175187 ?auto_175190 ) ) ( not ( = ?auto_175188 ?auto_175190 ) ) ( not ( = ?auto_175183 ?auto_175189 ) ) ( not ( = ?auto_175183 ?auto_175191 ) ) ( not ( = ?auto_175184 ?auto_175189 ) ) ( not ( = ?auto_175184 ?auto_175191 ) ) ( not ( = ?auto_175185 ?auto_175189 ) ) ( not ( = ?auto_175185 ?auto_175191 ) ) ( not ( = ?auto_175186 ?auto_175189 ) ) ( not ( = ?auto_175186 ?auto_175191 ) ) ( not ( = ?auto_175187 ?auto_175189 ) ) ( not ( = ?auto_175187 ?auto_175191 ) ) ( not ( = ?auto_175188 ?auto_175189 ) ) ( not ( = ?auto_175188 ?auto_175191 ) ) ( not ( = ?auto_175190 ?auto_175189 ) ) ( not ( = ?auto_175190 ?auto_175191 ) ) ( not ( = ?auto_175189 ?auto_175191 ) ) ( ON ?auto_175189 ?auto_175190 ) ( ON ?auto_175191 ?auto_175189 ) ( CLEAR ?auto_175191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175183 ?auto_175184 ?auto_175185 ?auto_175186 ?auto_175187 ?auto_175188 ?auto_175190 ?auto_175189 )
      ( MAKE-6PILE ?auto_175183 ?auto_175184 ?auto_175185 ?auto_175186 ?auto_175187 ?auto_175188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175195 - BLOCK
      ?auto_175196 - BLOCK
      ?auto_175197 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_175197 ) ( CLEAR ?auto_175196 ) ( ON-TABLE ?auto_175195 ) ( ON ?auto_175196 ?auto_175195 ) ( not ( = ?auto_175195 ?auto_175196 ) ) ( not ( = ?auto_175195 ?auto_175197 ) ) ( not ( = ?auto_175196 ?auto_175197 ) ) )
    :subtasks
    ( ( !STACK ?auto_175197 ?auto_175196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175198 - BLOCK
      ?auto_175199 - BLOCK
      ?auto_175200 - BLOCK
    )
    :vars
    (
      ?auto_175201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175199 ) ( ON-TABLE ?auto_175198 ) ( ON ?auto_175199 ?auto_175198 ) ( not ( = ?auto_175198 ?auto_175199 ) ) ( not ( = ?auto_175198 ?auto_175200 ) ) ( not ( = ?auto_175199 ?auto_175200 ) ) ( ON ?auto_175200 ?auto_175201 ) ( CLEAR ?auto_175200 ) ( HAND-EMPTY ) ( not ( = ?auto_175198 ?auto_175201 ) ) ( not ( = ?auto_175199 ?auto_175201 ) ) ( not ( = ?auto_175200 ?auto_175201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175200 ?auto_175201 )
      ( MAKE-3PILE ?auto_175198 ?auto_175199 ?auto_175200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175202 - BLOCK
      ?auto_175203 - BLOCK
      ?auto_175204 - BLOCK
    )
    :vars
    (
      ?auto_175205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175202 ) ( not ( = ?auto_175202 ?auto_175203 ) ) ( not ( = ?auto_175202 ?auto_175204 ) ) ( not ( = ?auto_175203 ?auto_175204 ) ) ( ON ?auto_175204 ?auto_175205 ) ( CLEAR ?auto_175204 ) ( not ( = ?auto_175202 ?auto_175205 ) ) ( not ( = ?auto_175203 ?auto_175205 ) ) ( not ( = ?auto_175204 ?auto_175205 ) ) ( HOLDING ?auto_175203 ) ( CLEAR ?auto_175202 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175202 ?auto_175203 )
      ( MAKE-3PILE ?auto_175202 ?auto_175203 ?auto_175204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175206 - BLOCK
      ?auto_175207 - BLOCK
      ?auto_175208 - BLOCK
    )
    :vars
    (
      ?auto_175209 - BLOCK
      ?auto_175211 - BLOCK
      ?auto_175212 - BLOCK
      ?auto_175213 - BLOCK
      ?auto_175214 - BLOCK
      ?auto_175210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175206 ) ( not ( = ?auto_175206 ?auto_175207 ) ) ( not ( = ?auto_175206 ?auto_175208 ) ) ( not ( = ?auto_175207 ?auto_175208 ) ) ( ON ?auto_175208 ?auto_175209 ) ( not ( = ?auto_175206 ?auto_175209 ) ) ( not ( = ?auto_175207 ?auto_175209 ) ) ( not ( = ?auto_175208 ?auto_175209 ) ) ( CLEAR ?auto_175206 ) ( ON ?auto_175207 ?auto_175208 ) ( CLEAR ?auto_175207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175211 ) ( ON ?auto_175212 ?auto_175211 ) ( ON ?auto_175213 ?auto_175212 ) ( ON ?auto_175214 ?auto_175213 ) ( ON ?auto_175210 ?auto_175214 ) ( ON ?auto_175209 ?auto_175210 ) ( not ( = ?auto_175211 ?auto_175212 ) ) ( not ( = ?auto_175211 ?auto_175213 ) ) ( not ( = ?auto_175211 ?auto_175214 ) ) ( not ( = ?auto_175211 ?auto_175210 ) ) ( not ( = ?auto_175211 ?auto_175209 ) ) ( not ( = ?auto_175211 ?auto_175208 ) ) ( not ( = ?auto_175211 ?auto_175207 ) ) ( not ( = ?auto_175212 ?auto_175213 ) ) ( not ( = ?auto_175212 ?auto_175214 ) ) ( not ( = ?auto_175212 ?auto_175210 ) ) ( not ( = ?auto_175212 ?auto_175209 ) ) ( not ( = ?auto_175212 ?auto_175208 ) ) ( not ( = ?auto_175212 ?auto_175207 ) ) ( not ( = ?auto_175213 ?auto_175214 ) ) ( not ( = ?auto_175213 ?auto_175210 ) ) ( not ( = ?auto_175213 ?auto_175209 ) ) ( not ( = ?auto_175213 ?auto_175208 ) ) ( not ( = ?auto_175213 ?auto_175207 ) ) ( not ( = ?auto_175214 ?auto_175210 ) ) ( not ( = ?auto_175214 ?auto_175209 ) ) ( not ( = ?auto_175214 ?auto_175208 ) ) ( not ( = ?auto_175214 ?auto_175207 ) ) ( not ( = ?auto_175210 ?auto_175209 ) ) ( not ( = ?auto_175210 ?auto_175208 ) ) ( not ( = ?auto_175210 ?auto_175207 ) ) ( not ( = ?auto_175206 ?auto_175211 ) ) ( not ( = ?auto_175206 ?auto_175212 ) ) ( not ( = ?auto_175206 ?auto_175213 ) ) ( not ( = ?auto_175206 ?auto_175214 ) ) ( not ( = ?auto_175206 ?auto_175210 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175211 ?auto_175212 ?auto_175213 ?auto_175214 ?auto_175210 ?auto_175209 ?auto_175208 )
      ( MAKE-3PILE ?auto_175206 ?auto_175207 ?auto_175208 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175215 - BLOCK
      ?auto_175216 - BLOCK
      ?auto_175217 - BLOCK
    )
    :vars
    (
      ?auto_175223 - BLOCK
      ?auto_175218 - BLOCK
      ?auto_175220 - BLOCK
      ?auto_175219 - BLOCK
      ?auto_175221 - BLOCK
      ?auto_175222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175215 ?auto_175216 ) ) ( not ( = ?auto_175215 ?auto_175217 ) ) ( not ( = ?auto_175216 ?auto_175217 ) ) ( ON ?auto_175217 ?auto_175223 ) ( not ( = ?auto_175215 ?auto_175223 ) ) ( not ( = ?auto_175216 ?auto_175223 ) ) ( not ( = ?auto_175217 ?auto_175223 ) ) ( ON ?auto_175216 ?auto_175217 ) ( CLEAR ?auto_175216 ) ( ON-TABLE ?auto_175218 ) ( ON ?auto_175220 ?auto_175218 ) ( ON ?auto_175219 ?auto_175220 ) ( ON ?auto_175221 ?auto_175219 ) ( ON ?auto_175222 ?auto_175221 ) ( ON ?auto_175223 ?auto_175222 ) ( not ( = ?auto_175218 ?auto_175220 ) ) ( not ( = ?auto_175218 ?auto_175219 ) ) ( not ( = ?auto_175218 ?auto_175221 ) ) ( not ( = ?auto_175218 ?auto_175222 ) ) ( not ( = ?auto_175218 ?auto_175223 ) ) ( not ( = ?auto_175218 ?auto_175217 ) ) ( not ( = ?auto_175218 ?auto_175216 ) ) ( not ( = ?auto_175220 ?auto_175219 ) ) ( not ( = ?auto_175220 ?auto_175221 ) ) ( not ( = ?auto_175220 ?auto_175222 ) ) ( not ( = ?auto_175220 ?auto_175223 ) ) ( not ( = ?auto_175220 ?auto_175217 ) ) ( not ( = ?auto_175220 ?auto_175216 ) ) ( not ( = ?auto_175219 ?auto_175221 ) ) ( not ( = ?auto_175219 ?auto_175222 ) ) ( not ( = ?auto_175219 ?auto_175223 ) ) ( not ( = ?auto_175219 ?auto_175217 ) ) ( not ( = ?auto_175219 ?auto_175216 ) ) ( not ( = ?auto_175221 ?auto_175222 ) ) ( not ( = ?auto_175221 ?auto_175223 ) ) ( not ( = ?auto_175221 ?auto_175217 ) ) ( not ( = ?auto_175221 ?auto_175216 ) ) ( not ( = ?auto_175222 ?auto_175223 ) ) ( not ( = ?auto_175222 ?auto_175217 ) ) ( not ( = ?auto_175222 ?auto_175216 ) ) ( not ( = ?auto_175215 ?auto_175218 ) ) ( not ( = ?auto_175215 ?auto_175220 ) ) ( not ( = ?auto_175215 ?auto_175219 ) ) ( not ( = ?auto_175215 ?auto_175221 ) ) ( not ( = ?auto_175215 ?auto_175222 ) ) ( HOLDING ?auto_175215 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175215 )
      ( MAKE-3PILE ?auto_175215 ?auto_175216 ?auto_175217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175224 - BLOCK
      ?auto_175225 - BLOCK
      ?auto_175226 - BLOCK
    )
    :vars
    (
      ?auto_175228 - BLOCK
      ?auto_175229 - BLOCK
      ?auto_175232 - BLOCK
      ?auto_175231 - BLOCK
      ?auto_175230 - BLOCK
      ?auto_175227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175224 ?auto_175225 ) ) ( not ( = ?auto_175224 ?auto_175226 ) ) ( not ( = ?auto_175225 ?auto_175226 ) ) ( ON ?auto_175226 ?auto_175228 ) ( not ( = ?auto_175224 ?auto_175228 ) ) ( not ( = ?auto_175225 ?auto_175228 ) ) ( not ( = ?auto_175226 ?auto_175228 ) ) ( ON ?auto_175225 ?auto_175226 ) ( ON-TABLE ?auto_175229 ) ( ON ?auto_175232 ?auto_175229 ) ( ON ?auto_175231 ?auto_175232 ) ( ON ?auto_175230 ?auto_175231 ) ( ON ?auto_175227 ?auto_175230 ) ( ON ?auto_175228 ?auto_175227 ) ( not ( = ?auto_175229 ?auto_175232 ) ) ( not ( = ?auto_175229 ?auto_175231 ) ) ( not ( = ?auto_175229 ?auto_175230 ) ) ( not ( = ?auto_175229 ?auto_175227 ) ) ( not ( = ?auto_175229 ?auto_175228 ) ) ( not ( = ?auto_175229 ?auto_175226 ) ) ( not ( = ?auto_175229 ?auto_175225 ) ) ( not ( = ?auto_175232 ?auto_175231 ) ) ( not ( = ?auto_175232 ?auto_175230 ) ) ( not ( = ?auto_175232 ?auto_175227 ) ) ( not ( = ?auto_175232 ?auto_175228 ) ) ( not ( = ?auto_175232 ?auto_175226 ) ) ( not ( = ?auto_175232 ?auto_175225 ) ) ( not ( = ?auto_175231 ?auto_175230 ) ) ( not ( = ?auto_175231 ?auto_175227 ) ) ( not ( = ?auto_175231 ?auto_175228 ) ) ( not ( = ?auto_175231 ?auto_175226 ) ) ( not ( = ?auto_175231 ?auto_175225 ) ) ( not ( = ?auto_175230 ?auto_175227 ) ) ( not ( = ?auto_175230 ?auto_175228 ) ) ( not ( = ?auto_175230 ?auto_175226 ) ) ( not ( = ?auto_175230 ?auto_175225 ) ) ( not ( = ?auto_175227 ?auto_175228 ) ) ( not ( = ?auto_175227 ?auto_175226 ) ) ( not ( = ?auto_175227 ?auto_175225 ) ) ( not ( = ?auto_175224 ?auto_175229 ) ) ( not ( = ?auto_175224 ?auto_175232 ) ) ( not ( = ?auto_175224 ?auto_175231 ) ) ( not ( = ?auto_175224 ?auto_175230 ) ) ( not ( = ?auto_175224 ?auto_175227 ) ) ( ON ?auto_175224 ?auto_175225 ) ( CLEAR ?auto_175224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175229 ?auto_175232 ?auto_175231 ?auto_175230 ?auto_175227 ?auto_175228 ?auto_175226 ?auto_175225 )
      ( MAKE-3PILE ?auto_175224 ?auto_175225 ?auto_175226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175238 - BLOCK
      ?auto_175239 - BLOCK
      ?auto_175240 - BLOCK
      ?auto_175241 - BLOCK
      ?auto_175242 - BLOCK
    )
    :vars
    (
      ?auto_175243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175243 ?auto_175242 ) ( CLEAR ?auto_175243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175238 ) ( ON ?auto_175239 ?auto_175238 ) ( ON ?auto_175240 ?auto_175239 ) ( ON ?auto_175241 ?auto_175240 ) ( ON ?auto_175242 ?auto_175241 ) ( not ( = ?auto_175238 ?auto_175239 ) ) ( not ( = ?auto_175238 ?auto_175240 ) ) ( not ( = ?auto_175238 ?auto_175241 ) ) ( not ( = ?auto_175238 ?auto_175242 ) ) ( not ( = ?auto_175238 ?auto_175243 ) ) ( not ( = ?auto_175239 ?auto_175240 ) ) ( not ( = ?auto_175239 ?auto_175241 ) ) ( not ( = ?auto_175239 ?auto_175242 ) ) ( not ( = ?auto_175239 ?auto_175243 ) ) ( not ( = ?auto_175240 ?auto_175241 ) ) ( not ( = ?auto_175240 ?auto_175242 ) ) ( not ( = ?auto_175240 ?auto_175243 ) ) ( not ( = ?auto_175241 ?auto_175242 ) ) ( not ( = ?auto_175241 ?auto_175243 ) ) ( not ( = ?auto_175242 ?auto_175243 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175243 ?auto_175242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175244 - BLOCK
      ?auto_175245 - BLOCK
      ?auto_175246 - BLOCK
      ?auto_175247 - BLOCK
      ?auto_175248 - BLOCK
    )
    :vars
    (
      ?auto_175249 - BLOCK
      ?auto_175250 - BLOCK
      ?auto_175251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175249 ?auto_175248 ) ( CLEAR ?auto_175249 ) ( ON-TABLE ?auto_175244 ) ( ON ?auto_175245 ?auto_175244 ) ( ON ?auto_175246 ?auto_175245 ) ( ON ?auto_175247 ?auto_175246 ) ( ON ?auto_175248 ?auto_175247 ) ( not ( = ?auto_175244 ?auto_175245 ) ) ( not ( = ?auto_175244 ?auto_175246 ) ) ( not ( = ?auto_175244 ?auto_175247 ) ) ( not ( = ?auto_175244 ?auto_175248 ) ) ( not ( = ?auto_175244 ?auto_175249 ) ) ( not ( = ?auto_175245 ?auto_175246 ) ) ( not ( = ?auto_175245 ?auto_175247 ) ) ( not ( = ?auto_175245 ?auto_175248 ) ) ( not ( = ?auto_175245 ?auto_175249 ) ) ( not ( = ?auto_175246 ?auto_175247 ) ) ( not ( = ?auto_175246 ?auto_175248 ) ) ( not ( = ?auto_175246 ?auto_175249 ) ) ( not ( = ?auto_175247 ?auto_175248 ) ) ( not ( = ?auto_175247 ?auto_175249 ) ) ( not ( = ?auto_175248 ?auto_175249 ) ) ( HOLDING ?auto_175250 ) ( CLEAR ?auto_175251 ) ( not ( = ?auto_175244 ?auto_175250 ) ) ( not ( = ?auto_175244 ?auto_175251 ) ) ( not ( = ?auto_175245 ?auto_175250 ) ) ( not ( = ?auto_175245 ?auto_175251 ) ) ( not ( = ?auto_175246 ?auto_175250 ) ) ( not ( = ?auto_175246 ?auto_175251 ) ) ( not ( = ?auto_175247 ?auto_175250 ) ) ( not ( = ?auto_175247 ?auto_175251 ) ) ( not ( = ?auto_175248 ?auto_175250 ) ) ( not ( = ?auto_175248 ?auto_175251 ) ) ( not ( = ?auto_175249 ?auto_175250 ) ) ( not ( = ?auto_175249 ?auto_175251 ) ) ( not ( = ?auto_175250 ?auto_175251 ) ) )
    :subtasks
    ( ( !STACK ?auto_175250 ?auto_175251 )
      ( MAKE-5PILE ?auto_175244 ?auto_175245 ?auto_175246 ?auto_175247 ?auto_175248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175252 - BLOCK
      ?auto_175253 - BLOCK
      ?auto_175254 - BLOCK
      ?auto_175255 - BLOCK
      ?auto_175256 - BLOCK
    )
    :vars
    (
      ?auto_175258 - BLOCK
      ?auto_175259 - BLOCK
      ?auto_175257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175258 ?auto_175256 ) ( ON-TABLE ?auto_175252 ) ( ON ?auto_175253 ?auto_175252 ) ( ON ?auto_175254 ?auto_175253 ) ( ON ?auto_175255 ?auto_175254 ) ( ON ?auto_175256 ?auto_175255 ) ( not ( = ?auto_175252 ?auto_175253 ) ) ( not ( = ?auto_175252 ?auto_175254 ) ) ( not ( = ?auto_175252 ?auto_175255 ) ) ( not ( = ?auto_175252 ?auto_175256 ) ) ( not ( = ?auto_175252 ?auto_175258 ) ) ( not ( = ?auto_175253 ?auto_175254 ) ) ( not ( = ?auto_175253 ?auto_175255 ) ) ( not ( = ?auto_175253 ?auto_175256 ) ) ( not ( = ?auto_175253 ?auto_175258 ) ) ( not ( = ?auto_175254 ?auto_175255 ) ) ( not ( = ?auto_175254 ?auto_175256 ) ) ( not ( = ?auto_175254 ?auto_175258 ) ) ( not ( = ?auto_175255 ?auto_175256 ) ) ( not ( = ?auto_175255 ?auto_175258 ) ) ( not ( = ?auto_175256 ?auto_175258 ) ) ( CLEAR ?auto_175259 ) ( not ( = ?auto_175252 ?auto_175257 ) ) ( not ( = ?auto_175252 ?auto_175259 ) ) ( not ( = ?auto_175253 ?auto_175257 ) ) ( not ( = ?auto_175253 ?auto_175259 ) ) ( not ( = ?auto_175254 ?auto_175257 ) ) ( not ( = ?auto_175254 ?auto_175259 ) ) ( not ( = ?auto_175255 ?auto_175257 ) ) ( not ( = ?auto_175255 ?auto_175259 ) ) ( not ( = ?auto_175256 ?auto_175257 ) ) ( not ( = ?auto_175256 ?auto_175259 ) ) ( not ( = ?auto_175258 ?auto_175257 ) ) ( not ( = ?auto_175258 ?auto_175259 ) ) ( not ( = ?auto_175257 ?auto_175259 ) ) ( ON ?auto_175257 ?auto_175258 ) ( CLEAR ?auto_175257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175252 ?auto_175253 ?auto_175254 ?auto_175255 ?auto_175256 ?auto_175258 )
      ( MAKE-5PILE ?auto_175252 ?auto_175253 ?auto_175254 ?auto_175255 ?auto_175256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175260 - BLOCK
      ?auto_175261 - BLOCK
      ?auto_175262 - BLOCK
      ?auto_175263 - BLOCK
      ?auto_175264 - BLOCK
    )
    :vars
    (
      ?auto_175266 - BLOCK
      ?auto_175265 - BLOCK
      ?auto_175267 - BLOCK
      ?auto_175268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175266 ?auto_175264 ) ( ON-TABLE ?auto_175260 ) ( ON ?auto_175261 ?auto_175260 ) ( ON ?auto_175262 ?auto_175261 ) ( ON ?auto_175263 ?auto_175262 ) ( ON ?auto_175264 ?auto_175263 ) ( not ( = ?auto_175260 ?auto_175261 ) ) ( not ( = ?auto_175260 ?auto_175262 ) ) ( not ( = ?auto_175260 ?auto_175263 ) ) ( not ( = ?auto_175260 ?auto_175264 ) ) ( not ( = ?auto_175260 ?auto_175266 ) ) ( not ( = ?auto_175261 ?auto_175262 ) ) ( not ( = ?auto_175261 ?auto_175263 ) ) ( not ( = ?auto_175261 ?auto_175264 ) ) ( not ( = ?auto_175261 ?auto_175266 ) ) ( not ( = ?auto_175262 ?auto_175263 ) ) ( not ( = ?auto_175262 ?auto_175264 ) ) ( not ( = ?auto_175262 ?auto_175266 ) ) ( not ( = ?auto_175263 ?auto_175264 ) ) ( not ( = ?auto_175263 ?auto_175266 ) ) ( not ( = ?auto_175264 ?auto_175266 ) ) ( not ( = ?auto_175260 ?auto_175265 ) ) ( not ( = ?auto_175260 ?auto_175267 ) ) ( not ( = ?auto_175261 ?auto_175265 ) ) ( not ( = ?auto_175261 ?auto_175267 ) ) ( not ( = ?auto_175262 ?auto_175265 ) ) ( not ( = ?auto_175262 ?auto_175267 ) ) ( not ( = ?auto_175263 ?auto_175265 ) ) ( not ( = ?auto_175263 ?auto_175267 ) ) ( not ( = ?auto_175264 ?auto_175265 ) ) ( not ( = ?auto_175264 ?auto_175267 ) ) ( not ( = ?auto_175266 ?auto_175265 ) ) ( not ( = ?auto_175266 ?auto_175267 ) ) ( not ( = ?auto_175265 ?auto_175267 ) ) ( ON ?auto_175265 ?auto_175266 ) ( CLEAR ?auto_175265 ) ( HOLDING ?auto_175267 ) ( CLEAR ?auto_175268 ) ( ON-TABLE ?auto_175268 ) ( not ( = ?auto_175268 ?auto_175267 ) ) ( not ( = ?auto_175260 ?auto_175268 ) ) ( not ( = ?auto_175261 ?auto_175268 ) ) ( not ( = ?auto_175262 ?auto_175268 ) ) ( not ( = ?auto_175263 ?auto_175268 ) ) ( not ( = ?auto_175264 ?auto_175268 ) ) ( not ( = ?auto_175266 ?auto_175268 ) ) ( not ( = ?auto_175265 ?auto_175268 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175268 ?auto_175267 )
      ( MAKE-5PILE ?auto_175260 ?auto_175261 ?auto_175262 ?auto_175263 ?auto_175264 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175269 - BLOCK
      ?auto_175270 - BLOCK
      ?auto_175271 - BLOCK
      ?auto_175272 - BLOCK
      ?auto_175273 - BLOCK
    )
    :vars
    (
      ?auto_175274 - BLOCK
      ?auto_175275 - BLOCK
      ?auto_175276 - BLOCK
      ?auto_175277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175274 ?auto_175273 ) ( ON-TABLE ?auto_175269 ) ( ON ?auto_175270 ?auto_175269 ) ( ON ?auto_175271 ?auto_175270 ) ( ON ?auto_175272 ?auto_175271 ) ( ON ?auto_175273 ?auto_175272 ) ( not ( = ?auto_175269 ?auto_175270 ) ) ( not ( = ?auto_175269 ?auto_175271 ) ) ( not ( = ?auto_175269 ?auto_175272 ) ) ( not ( = ?auto_175269 ?auto_175273 ) ) ( not ( = ?auto_175269 ?auto_175274 ) ) ( not ( = ?auto_175270 ?auto_175271 ) ) ( not ( = ?auto_175270 ?auto_175272 ) ) ( not ( = ?auto_175270 ?auto_175273 ) ) ( not ( = ?auto_175270 ?auto_175274 ) ) ( not ( = ?auto_175271 ?auto_175272 ) ) ( not ( = ?auto_175271 ?auto_175273 ) ) ( not ( = ?auto_175271 ?auto_175274 ) ) ( not ( = ?auto_175272 ?auto_175273 ) ) ( not ( = ?auto_175272 ?auto_175274 ) ) ( not ( = ?auto_175273 ?auto_175274 ) ) ( not ( = ?auto_175269 ?auto_175275 ) ) ( not ( = ?auto_175269 ?auto_175276 ) ) ( not ( = ?auto_175270 ?auto_175275 ) ) ( not ( = ?auto_175270 ?auto_175276 ) ) ( not ( = ?auto_175271 ?auto_175275 ) ) ( not ( = ?auto_175271 ?auto_175276 ) ) ( not ( = ?auto_175272 ?auto_175275 ) ) ( not ( = ?auto_175272 ?auto_175276 ) ) ( not ( = ?auto_175273 ?auto_175275 ) ) ( not ( = ?auto_175273 ?auto_175276 ) ) ( not ( = ?auto_175274 ?auto_175275 ) ) ( not ( = ?auto_175274 ?auto_175276 ) ) ( not ( = ?auto_175275 ?auto_175276 ) ) ( ON ?auto_175275 ?auto_175274 ) ( CLEAR ?auto_175277 ) ( ON-TABLE ?auto_175277 ) ( not ( = ?auto_175277 ?auto_175276 ) ) ( not ( = ?auto_175269 ?auto_175277 ) ) ( not ( = ?auto_175270 ?auto_175277 ) ) ( not ( = ?auto_175271 ?auto_175277 ) ) ( not ( = ?auto_175272 ?auto_175277 ) ) ( not ( = ?auto_175273 ?auto_175277 ) ) ( not ( = ?auto_175274 ?auto_175277 ) ) ( not ( = ?auto_175275 ?auto_175277 ) ) ( ON ?auto_175276 ?auto_175275 ) ( CLEAR ?auto_175276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175269 ?auto_175270 ?auto_175271 ?auto_175272 ?auto_175273 ?auto_175274 ?auto_175275 )
      ( MAKE-5PILE ?auto_175269 ?auto_175270 ?auto_175271 ?auto_175272 ?auto_175273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175278 - BLOCK
      ?auto_175279 - BLOCK
      ?auto_175280 - BLOCK
      ?auto_175281 - BLOCK
      ?auto_175282 - BLOCK
    )
    :vars
    (
      ?auto_175284 - BLOCK
      ?auto_175286 - BLOCK
      ?auto_175285 - BLOCK
      ?auto_175283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175284 ?auto_175282 ) ( ON-TABLE ?auto_175278 ) ( ON ?auto_175279 ?auto_175278 ) ( ON ?auto_175280 ?auto_175279 ) ( ON ?auto_175281 ?auto_175280 ) ( ON ?auto_175282 ?auto_175281 ) ( not ( = ?auto_175278 ?auto_175279 ) ) ( not ( = ?auto_175278 ?auto_175280 ) ) ( not ( = ?auto_175278 ?auto_175281 ) ) ( not ( = ?auto_175278 ?auto_175282 ) ) ( not ( = ?auto_175278 ?auto_175284 ) ) ( not ( = ?auto_175279 ?auto_175280 ) ) ( not ( = ?auto_175279 ?auto_175281 ) ) ( not ( = ?auto_175279 ?auto_175282 ) ) ( not ( = ?auto_175279 ?auto_175284 ) ) ( not ( = ?auto_175280 ?auto_175281 ) ) ( not ( = ?auto_175280 ?auto_175282 ) ) ( not ( = ?auto_175280 ?auto_175284 ) ) ( not ( = ?auto_175281 ?auto_175282 ) ) ( not ( = ?auto_175281 ?auto_175284 ) ) ( not ( = ?auto_175282 ?auto_175284 ) ) ( not ( = ?auto_175278 ?auto_175286 ) ) ( not ( = ?auto_175278 ?auto_175285 ) ) ( not ( = ?auto_175279 ?auto_175286 ) ) ( not ( = ?auto_175279 ?auto_175285 ) ) ( not ( = ?auto_175280 ?auto_175286 ) ) ( not ( = ?auto_175280 ?auto_175285 ) ) ( not ( = ?auto_175281 ?auto_175286 ) ) ( not ( = ?auto_175281 ?auto_175285 ) ) ( not ( = ?auto_175282 ?auto_175286 ) ) ( not ( = ?auto_175282 ?auto_175285 ) ) ( not ( = ?auto_175284 ?auto_175286 ) ) ( not ( = ?auto_175284 ?auto_175285 ) ) ( not ( = ?auto_175286 ?auto_175285 ) ) ( ON ?auto_175286 ?auto_175284 ) ( not ( = ?auto_175283 ?auto_175285 ) ) ( not ( = ?auto_175278 ?auto_175283 ) ) ( not ( = ?auto_175279 ?auto_175283 ) ) ( not ( = ?auto_175280 ?auto_175283 ) ) ( not ( = ?auto_175281 ?auto_175283 ) ) ( not ( = ?auto_175282 ?auto_175283 ) ) ( not ( = ?auto_175284 ?auto_175283 ) ) ( not ( = ?auto_175286 ?auto_175283 ) ) ( ON ?auto_175285 ?auto_175286 ) ( CLEAR ?auto_175285 ) ( HOLDING ?auto_175283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175283 )
      ( MAKE-5PILE ?auto_175278 ?auto_175279 ?auto_175280 ?auto_175281 ?auto_175282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175287 - BLOCK
      ?auto_175288 - BLOCK
      ?auto_175289 - BLOCK
      ?auto_175290 - BLOCK
      ?auto_175291 - BLOCK
    )
    :vars
    (
      ?auto_175294 - BLOCK
      ?auto_175293 - BLOCK
      ?auto_175292 - BLOCK
      ?auto_175295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175294 ?auto_175291 ) ( ON-TABLE ?auto_175287 ) ( ON ?auto_175288 ?auto_175287 ) ( ON ?auto_175289 ?auto_175288 ) ( ON ?auto_175290 ?auto_175289 ) ( ON ?auto_175291 ?auto_175290 ) ( not ( = ?auto_175287 ?auto_175288 ) ) ( not ( = ?auto_175287 ?auto_175289 ) ) ( not ( = ?auto_175287 ?auto_175290 ) ) ( not ( = ?auto_175287 ?auto_175291 ) ) ( not ( = ?auto_175287 ?auto_175294 ) ) ( not ( = ?auto_175288 ?auto_175289 ) ) ( not ( = ?auto_175288 ?auto_175290 ) ) ( not ( = ?auto_175288 ?auto_175291 ) ) ( not ( = ?auto_175288 ?auto_175294 ) ) ( not ( = ?auto_175289 ?auto_175290 ) ) ( not ( = ?auto_175289 ?auto_175291 ) ) ( not ( = ?auto_175289 ?auto_175294 ) ) ( not ( = ?auto_175290 ?auto_175291 ) ) ( not ( = ?auto_175290 ?auto_175294 ) ) ( not ( = ?auto_175291 ?auto_175294 ) ) ( not ( = ?auto_175287 ?auto_175293 ) ) ( not ( = ?auto_175287 ?auto_175292 ) ) ( not ( = ?auto_175288 ?auto_175293 ) ) ( not ( = ?auto_175288 ?auto_175292 ) ) ( not ( = ?auto_175289 ?auto_175293 ) ) ( not ( = ?auto_175289 ?auto_175292 ) ) ( not ( = ?auto_175290 ?auto_175293 ) ) ( not ( = ?auto_175290 ?auto_175292 ) ) ( not ( = ?auto_175291 ?auto_175293 ) ) ( not ( = ?auto_175291 ?auto_175292 ) ) ( not ( = ?auto_175294 ?auto_175293 ) ) ( not ( = ?auto_175294 ?auto_175292 ) ) ( not ( = ?auto_175293 ?auto_175292 ) ) ( ON ?auto_175293 ?auto_175294 ) ( not ( = ?auto_175295 ?auto_175292 ) ) ( not ( = ?auto_175287 ?auto_175295 ) ) ( not ( = ?auto_175288 ?auto_175295 ) ) ( not ( = ?auto_175289 ?auto_175295 ) ) ( not ( = ?auto_175290 ?auto_175295 ) ) ( not ( = ?auto_175291 ?auto_175295 ) ) ( not ( = ?auto_175294 ?auto_175295 ) ) ( not ( = ?auto_175293 ?auto_175295 ) ) ( ON ?auto_175292 ?auto_175293 ) ( ON ?auto_175295 ?auto_175292 ) ( CLEAR ?auto_175295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175287 ?auto_175288 ?auto_175289 ?auto_175290 ?auto_175291 ?auto_175294 ?auto_175293 ?auto_175292 )
      ( MAKE-5PILE ?auto_175287 ?auto_175288 ?auto_175289 ?auto_175290 ?auto_175291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175300 - BLOCK
      ?auto_175301 - BLOCK
      ?auto_175302 - BLOCK
      ?auto_175303 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_175303 ) ( CLEAR ?auto_175302 ) ( ON-TABLE ?auto_175300 ) ( ON ?auto_175301 ?auto_175300 ) ( ON ?auto_175302 ?auto_175301 ) ( not ( = ?auto_175300 ?auto_175301 ) ) ( not ( = ?auto_175300 ?auto_175302 ) ) ( not ( = ?auto_175300 ?auto_175303 ) ) ( not ( = ?auto_175301 ?auto_175302 ) ) ( not ( = ?auto_175301 ?auto_175303 ) ) ( not ( = ?auto_175302 ?auto_175303 ) ) )
    :subtasks
    ( ( !STACK ?auto_175303 ?auto_175302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175304 - BLOCK
      ?auto_175305 - BLOCK
      ?auto_175306 - BLOCK
      ?auto_175307 - BLOCK
    )
    :vars
    (
      ?auto_175308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175306 ) ( ON-TABLE ?auto_175304 ) ( ON ?auto_175305 ?auto_175304 ) ( ON ?auto_175306 ?auto_175305 ) ( not ( = ?auto_175304 ?auto_175305 ) ) ( not ( = ?auto_175304 ?auto_175306 ) ) ( not ( = ?auto_175304 ?auto_175307 ) ) ( not ( = ?auto_175305 ?auto_175306 ) ) ( not ( = ?auto_175305 ?auto_175307 ) ) ( not ( = ?auto_175306 ?auto_175307 ) ) ( ON ?auto_175307 ?auto_175308 ) ( CLEAR ?auto_175307 ) ( HAND-EMPTY ) ( not ( = ?auto_175304 ?auto_175308 ) ) ( not ( = ?auto_175305 ?auto_175308 ) ) ( not ( = ?auto_175306 ?auto_175308 ) ) ( not ( = ?auto_175307 ?auto_175308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175307 ?auto_175308 )
      ( MAKE-4PILE ?auto_175304 ?auto_175305 ?auto_175306 ?auto_175307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175309 - BLOCK
      ?auto_175310 - BLOCK
      ?auto_175311 - BLOCK
      ?auto_175312 - BLOCK
    )
    :vars
    (
      ?auto_175313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175309 ) ( ON ?auto_175310 ?auto_175309 ) ( not ( = ?auto_175309 ?auto_175310 ) ) ( not ( = ?auto_175309 ?auto_175311 ) ) ( not ( = ?auto_175309 ?auto_175312 ) ) ( not ( = ?auto_175310 ?auto_175311 ) ) ( not ( = ?auto_175310 ?auto_175312 ) ) ( not ( = ?auto_175311 ?auto_175312 ) ) ( ON ?auto_175312 ?auto_175313 ) ( CLEAR ?auto_175312 ) ( not ( = ?auto_175309 ?auto_175313 ) ) ( not ( = ?auto_175310 ?auto_175313 ) ) ( not ( = ?auto_175311 ?auto_175313 ) ) ( not ( = ?auto_175312 ?auto_175313 ) ) ( HOLDING ?auto_175311 ) ( CLEAR ?auto_175310 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175309 ?auto_175310 ?auto_175311 )
      ( MAKE-4PILE ?auto_175309 ?auto_175310 ?auto_175311 ?auto_175312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175314 - BLOCK
      ?auto_175315 - BLOCK
      ?auto_175316 - BLOCK
      ?auto_175317 - BLOCK
    )
    :vars
    (
      ?auto_175318 - BLOCK
      ?auto_175319 - BLOCK
      ?auto_175320 - BLOCK
      ?auto_175321 - BLOCK
      ?auto_175322 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175314 ) ( ON ?auto_175315 ?auto_175314 ) ( not ( = ?auto_175314 ?auto_175315 ) ) ( not ( = ?auto_175314 ?auto_175316 ) ) ( not ( = ?auto_175314 ?auto_175317 ) ) ( not ( = ?auto_175315 ?auto_175316 ) ) ( not ( = ?auto_175315 ?auto_175317 ) ) ( not ( = ?auto_175316 ?auto_175317 ) ) ( ON ?auto_175317 ?auto_175318 ) ( not ( = ?auto_175314 ?auto_175318 ) ) ( not ( = ?auto_175315 ?auto_175318 ) ) ( not ( = ?auto_175316 ?auto_175318 ) ) ( not ( = ?auto_175317 ?auto_175318 ) ) ( CLEAR ?auto_175315 ) ( ON ?auto_175316 ?auto_175317 ) ( CLEAR ?auto_175316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175319 ) ( ON ?auto_175320 ?auto_175319 ) ( ON ?auto_175321 ?auto_175320 ) ( ON ?auto_175322 ?auto_175321 ) ( ON ?auto_175318 ?auto_175322 ) ( not ( = ?auto_175319 ?auto_175320 ) ) ( not ( = ?auto_175319 ?auto_175321 ) ) ( not ( = ?auto_175319 ?auto_175322 ) ) ( not ( = ?auto_175319 ?auto_175318 ) ) ( not ( = ?auto_175319 ?auto_175317 ) ) ( not ( = ?auto_175319 ?auto_175316 ) ) ( not ( = ?auto_175320 ?auto_175321 ) ) ( not ( = ?auto_175320 ?auto_175322 ) ) ( not ( = ?auto_175320 ?auto_175318 ) ) ( not ( = ?auto_175320 ?auto_175317 ) ) ( not ( = ?auto_175320 ?auto_175316 ) ) ( not ( = ?auto_175321 ?auto_175322 ) ) ( not ( = ?auto_175321 ?auto_175318 ) ) ( not ( = ?auto_175321 ?auto_175317 ) ) ( not ( = ?auto_175321 ?auto_175316 ) ) ( not ( = ?auto_175322 ?auto_175318 ) ) ( not ( = ?auto_175322 ?auto_175317 ) ) ( not ( = ?auto_175322 ?auto_175316 ) ) ( not ( = ?auto_175314 ?auto_175319 ) ) ( not ( = ?auto_175314 ?auto_175320 ) ) ( not ( = ?auto_175314 ?auto_175321 ) ) ( not ( = ?auto_175314 ?auto_175322 ) ) ( not ( = ?auto_175315 ?auto_175319 ) ) ( not ( = ?auto_175315 ?auto_175320 ) ) ( not ( = ?auto_175315 ?auto_175321 ) ) ( not ( = ?auto_175315 ?auto_175322 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175319 ?auto_175320 ?auto_175321 ?auto_175322 ?auto_175318 ?auto_175317 )
      ( MAKE-4PILE ?auto_175314 ?auto_175315 ?auto_175316 ?auto_175317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175323 - BLOCK
      ?auto_175324 - BLOCK
      ?auto_175325 - BLOCK
      ?auto_175326 - BLOCK
    )
    :vars
    (
      ?auto_175329 - BLOCK
      ?auto_175330 - BLOCK
      ?auto_175327 - BLOCK
      ?auto_175331 - BLOCK
      ?auto_175328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175323 ) ( not ( = ?auto_175323 ?auto_175324 ) ) ( not ( = ?auto_175323 ?auto_175325 ) ) ( not ( = ?auto_175323 ?auto_175326 ) ) ( not ( = ?auto_175324 ?auto_175325 ) ) ( not ( = ?auto_175324 ?auto_175326 ) ) ( not ( = ?auto_175325 ?auto_175326 ) ) ( ON ?auto_175326 ?auto_175329 ) ( not ( = ?auto_175323 ?auto_175329 ) ) ( not ( = ?auto_175324 ?auto_175329 ) ) ( not ( = ?auto_175325 ?auto_175329 ) ) ( not ( = ?auto_175326 ?auto_175329 ) ) ( ON ?auto_175325 ?auto_175326 ) ( CLEAR ?auto_175325 ) ( ON-TABLE ?auto_175330 ) ( ON ?auto_175327 ?auto_175330 ) ( ON ?auto_175331 ?auto_175327 ) ( ON ?auto_175328 ?auto_175331 ) ( ON ?auto_175329 ?auto_175328 ) ( not ( = ?auto_175330 ?auto_175327 ) ) ( not ( = ?auto_175330 ?auto_175331 ) ) ( not ( = ?auto_175330 ?auto_175328 ) ) ( not ( = ?auto_175330 ?auto_175329 ) ) ( not ( = ?auto_175330 ?auto_175326 ) ) ( not ( = ?auto_175330 ?auto_175325 ) ) ( not ( = ?auto_175327 ?auto_175331 ) ) ( not ( = ?auto_175327 ?auto_175328 ) ) ( not ( = ?auto_175327 ?auto_175329 ) ) ( not ( = ?auto_175327 ?auto_175326 ) ) ( not ( = ?auto_175327 ?auto_175325 ) ) ( not ( = ?auto_175331 ?auto_175328 ) ) ( not ( = ?auto_175331 ?auto_175329 ) ) ( not ( = ?auto_175331 ?auto_175326 ) ) ( not ( = ?auto_175331 ?auto_175325 ) ) ( not ( = ?auto_175328 ?auto_175329 ) ) ( not ( = ?auto_175328 ?auto_175326 ) ) ( not ( = ?auto_175328 ?auto_175325 ) ) ( not ( = ?auto_175323 ?auto_175330 ) ) ( not ( = ?auto_175323 ?auto_175327 ) ) ( not ( = ?auto_175323 ?auto_175331 ) ) ( not ( = ?auto_175323 ?auto_175328 ) ) ( not ( = ?auto_175324 ?auto_175330 ) ) ( not ( = ?auto_175324 ?auto_175327 ) ) ( not ( = ?auto_175324 ?auto_175331 ) ) ( not ( = ?auto_175324 ?auto_175328 ) ) ( HOLDING ?auto_175324 ) ( CLEAR ?auto_175323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175323 ?auto_175324 )
      ( MAKE-4PILE ?auto_175323 ?auto_175324 ?auto_175325 ?auto_175326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175332 - BLOCK
      ?auto_175333 - BLOCK
      ?auto_175334 - BLOCK
      ?auto_175335 - BLOCK
    )
    :vars
    (
      ?auto_175340 - BLOCK
      ?auto_175339 - BLOCK
      ?auto_175336 - BLOCK
      ?auto_175338 - BLOCK
      ?auto_175337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175332 ) ( not ( = ?auto_175332 ?auto_175333 ) ) ( not ( = ?auto_175332 ?auto_175334 ) ) ( not ( = ?auto_175332 ?auto_175335 ) ) ( not ( = ?auto_175333 ?auto_175334 ) ) ( not ( = ?auto_175333 ?auto_175335 ) ) ( not ( = ?auto_175334 ?auto_175335 ) ) ( ON ?auto_175335 ?auto_175340 ) ( not ( = ?auto_175332 ?auto_175340 ) ) ( not ( = ?auto_175333 ?auto_175340 ) ) ( not ( = ?auto_175334 ?auto_175340 ) ) ( not ( = ?auto_175335 ?auto_175340 ) ) ( ON ?auto_175334 ?auto_175335 ) ( ON-TABLE ?auto_175339 ) ( ON ?auto_175336 ?auto_175339 ) ( ON ?auto_175338 ?auto_175336 ) ( ON ?auto_175337 ?auto_175338 ) ( ON ?auto_175340 ?auto_175337 ) ( not ( = ?auto_175339 ?auto_175336 ) ) ( not ( = ?auto_175339 ?auto_175338 ) ) ( not ( = ?auto_175339 ?auto_175337 ) ) ( not ( = ?auto_175339 ?auto_175340 ) ) ( not ( = ?auto_175339 ?auto_175335 ) ) ( not ( = ?auto_175339 ?auto_175334 ) ) ( not ( = ?auto_175336 ?auto_175338 ) ) ( not ( = ?auto_175336 ?auto_175337 ) ) ( not ( = ?auto_175336 ?auto_175340 ) ) ( not ( = ?auto_175336 ?auto_175335 ) ) ( not ( = ?auto_175336 ?auto_175334 ) ) ( not ( = ?auto_175338 ?auto_175337 ) ) ( not ( = ?auto_175338 ?auto_175340 ) ) ( not ( = ?auto_175338 ?auto_175335 ) ) ( not ( = ?auto_175338 ?auto_175334 ) ) ( not ( = ?auto_175337 ?auto_175340 ) ) ( not ( = ?auto_175337 ?auto_175335 ) ) ( not ( = ?auto_175337 ?auto_175334 ) ) ( not ( = ?auto_175332 ?auto_175339 ) ) ( not ( = ?auto_175332 ?auto_175336 ) ) ( not ( = ?auto_175332 ?auto_175338 ) ) ( not ( = ?auto_175332 ?auto_175337 ) ) ( not ( = ?auto_175333 ?auto_175339 ) ) ( not ( = ?auto_175333 ?auto_175336 ) ) ( not ( = ?auto_175333 ?auto_175338 ) ) ( not ( = ?auto_175333 ?auto_175337 ) ) ( CLEAR ?auto_175332 ) ( ON ?auto_175333 ?auto_175334 ) ( CLEAR ?auto_175333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175339 ?auto_175336 ?auto_175338 ?auto_175337 ?auto_175340 ?auto_175335 ?auto_175334 )
      ( MAKE-4PILE ?auto_175332 ?auto_175333 ?auto_175334 ?auto_175335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175341 - BLOCK
      ?auto_175342 - BLOCK
      ?auto_175343 - BLOCK
      ?auto_175344 - BLOCK
    )
    :vars
    (
      ?auto_175346 - BLOCK
      ?auto_175348 - BLOCK
      ?auto_175347 - BLOCK
      ?auto_175345 - BLOCK
      ?auto_175349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175341 ?auto_175342 ) ) ( not ( = ?auto_175341 ?auto_175343 ) ) ( not ( = ?auto_175341 ?auto_175344 ) ) ( not ( = ?auto_175342 ?auto_175343 ) ) ( not ( = ?auto_175342 ?auto_175344 ) ) ( not ( = ?auto_175343 ?auto_175344 ) ) ( ON ?auto_175344 ?auto_175346 ) ( not ( = ?auto_175341 ?auto_175346 ) ) ( not ( = ?auto_175342 ?auto_175346 ) ) ( not ( = ?auto_175343 ?auto_175346 ) ) ( not ( = ?auto_175344 ?auto_175346 ) ) ( ON ?auto_175343 ?auto_175344 ) ( ON-TABLE ?auto_175348 ) ( ON ?auto_175347 ?auto_175348 ) ( ON ?auto_175345 ?auto_175347 ) ( ON ?auto_175349 ?auto_175345 ) ( ON ?auto_175346 ?auto_175349 ) ( not ( = ?auto_175348 ?auto_175347 ) ) ( not ( = ?auto_175348 ?auto_175345 ) ) ( not ( = ?auto_175348 ?auto_175349 ) ) ( not ( = ?auto_175348 ?auto_175346 ) ) ( not ( = ?auto_175348 ?auto_175344 ) ) ( not ( = ?auto_175348 ?auto_175343 ) ) ( not ( = ?auto_175347 ?auto_175345 ) ) ( not ( = ?auto_175347 ?auto_175349 ) ) ( not ( = ?auto_175347 ?auto_175346 ) ) ( not ( = ?auto_175347 ?auto_175344 ) ) ( not ( = ?auto_175347 ?auto_175343 ) ) ( not ( = ?auto_175345 ?auto_175349 ) ) ( not ( = ?auto_175345 ?auto_175346 ) ) ( not ( = ?auto_175345 ?auto_175344 ) ) ( not ( = ?auto_175345 ?auto_175343 ) ) ( not ( = ?auto_175349 ?auto_175346 ) ) ( not ( = ?auto_175349 ?auto_175344 ) ) ( not ( = ?auto_175349 ?auto_175343 ) ) ( not ( = ?auto_175341 ?auto_175348 ) ) ( not ( = ?auto_175341 ?auto_175347 ) ) ( not ( = ?auto_175341 ?auto_175345 ) ) ( not ( = ?auto_175341 ?auto_175349 ) ) ( not ( = ?auto_175342 ?auto_175348 ) ) ( not ( = ?auto_175342 ?auto_175347 ) ) ( not ( = ?auto_175342 ?auto_175345 ) ) ( not ( = ?auto_175342 ?auto_175349 ) ) ( ON ?auto_175342 ?auto_175343 ) ( CLEAR ?auto_175342 ) ( HOLDING ?auto_175341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175341 )
      ( MAKE-4PILE ?auto_175341 ?auto_175342 ?auto_175343 ?auto_175344 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175350 - BLOCK
      ?auto_175351 - BLOCK
      ?auto_175352 - BLOCK
      ?auto_175353 - BLOCK
    )
    :vars
    (
      ?auto_175358 - BLOCK
      ?auto_175356 - BLOCK
      ?auto_175357 - BLOCK
      ?auto_175354 - BLOCK
      ?auto_175355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175350 ?auto_175351 ) ) ( not ( = ?auto_175350 ?auto_175352 ) ) ( not ( = ?auto_175350 ?auto_175353 ) ) ( not ( = ?auto_175351 ?auto_175352 ) ) ( not ( = ?auto_175351 ?auto_175353 ) ) ( not ( = ?auto_175352 ?auto_175353 ) ) ( ON ?auto_175353 ?auto_175358 ) ( not ( = ?auto_175350 ?auto_175358 ) ) ( not ( = ?auto_175351 ?auto_175358 ) ) ( not ( = ?auto_175352 ?auto_175358 ) ) ( not ( = ?auto_175353 ?auto_175358 ) ) ( ON ?auto_175352 ?auto_175353 ) ( ON-TABLE ?auto_175356 ) ( ON ?auto_175357 ?auto_175356 ) ( ON ?auto_175354 ?auto_175357 ) ( ON ?auto_175355 ?auto_175354 ) ( ON ?auto_175358 ?auto_175355 ) ( not ( = ?auto_175356 ?auto_175357 ) ) ( not ( = ?auto_175356 ?auto_175354 ) ) ( not ( = ?auto_175356 ?auto_175355 ) ) ( not ( = ?auto_175356 ?auto_175358 ) ) ( not ( = ?auto_175356 ?auto_175353 ) ) ( not ( = ?auto_175356 ?auto_175352 ) ) ( not ( = ?auto_175357 ?auto_175354 ) ) ( not ( = ?auto_175357 ?auto_175355 ) ) ( not ( = ?auto_175357 ?auto_175358 ) ) ( not ( = ?auto_175357 ?auto_175353 ) ) ( not ( = ?auto_175357 ?auto_175352 ) ) ( not ( = ?auto_175354 ?auto_175355 ) ) ( not ( = ?auto_175354 ?auto_175358 ) ) ( not ( = ?auto_175354 ?auto_175353 ) ) ( not ( = ?auto_175354 ?auto_175352 ) ) ( not ( = ?auto_175355 ?auto_175358 ) ) ( not ( = ?auto_175355 ?auto_175353 ) ) ( not ( = ?auto_175355 ?auto_175352 ) ) ( not ( = ?auto_175350 ?auto_175356 ) ) ( not ( = ?auto_175350 ?auto_175357 ) ) ( not ( = ?auto_175350 ?auto_175354 ) ) ( not ( = ?auto_175350 ?auto_175355 ) ) ( not ( = ?auto_175351 ?auto_175356 ) ) ( not ( = ?auto_175351 ?auto_175357 ) ) ( not ( = ?auto_175351 ?auto_175354 ) ) ( not ( = ?auto_175351 ?auto_175355 ) ) ( ON ?auto_175351 ?auto_175352 ) ( ON ?auto_175350 ?auto_175351 ) ( CLEAR ?auto_175350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175356 ?auto_175357 ?auto_175354 ?auto_175355 ?auto_175358 ?auto_175353 ?auto_175352 ?auto_175351 )
      ( MAKE-4PILE ?auto_175350 ?auto_175351 ?auto_175352 ?auto_175353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175363 - BLOCK
      ?auto_175364 - BLOCK
      ?auto_175365 - BLOCK
      ?auto_175366 - BLOCK
    )
    :vars
    (
      ?auto_175367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175367 ?auto_175366 ) ( CLEAR ?auto_175367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175363 ) ( ON ?auto_175364 ?auto_175363 ) ( ON ?auto_175365 ?auto_175364 ) ( ON ?auto_175366 ?auto_175365 ) ( not ( = ?auto_175363 ?auto_175364 ) ) ( not ( = ?auto_175363 ?auto_175365 ) ) ( not ( = ?auto_175363 ?auto_175366 ) ) ( not ( = ?auto_175363 ?auto_175367 ) ) ( not ( = ?auto_175364 ?auto_175365 ) ) ( not ( = ?auto_175364 ?auto_175366 ) ) ( not ( = ?auto_175364 ?auto_175367 ) ) ( not ( = ?auto_175365 ?auto_175366 ) ) ( not ( = ?auto_175365 ?auto_175367 ) ) ( not ( = ?auto_175366 ?auto_175367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175367 ?auto_175366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175368 - BLOCK
      ?auto_175369 - BLOCK
      ?auto_175370 - BLOCK
      ?auto_175371 - BLOCK
    )
    :vars
    (
      ?auto_175372 - BLOCK
      ?auto_175373 - BLOCK
      ?auto_175374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175372 ?auto_175371 ) ( CLEAR ?auto_175372 ) ( ON-TABLE ?auto_175368 ) ( ON ?auto_175369 ?auto_175368 ) ( ON ?auto_175370 ?auto_175369 ) ( ON ?auto_175371 ?auto_175370 ) ( not ( = ?auto_175368 ?auto_175369 ) ) ( not ( = ?auto_175368 ?auto_175370 ) ) ( not ( = ?auto_175368 ?auto_175371 ) ) ( not ( = ?auto_175368 ?auto_175372 ) ) ( not ( = ?auto_175369 ?auto_175370 ) ) ( not ( = ?auto_175369 ?auto_175371 ) ) ( not ( = ?auto_175369 ?auto_175372 ) ) ( not ( = ?auto_175370 ?auto_175371 ) ) ( not ( = ?auto_175370 ?auto_175372 ) ) ( not ( = ?auto_175371 ?auto_175372 ) ) ( HOLDING ?auto_175373 ) ( CLEAR ?auto_175374 ) ( not ( = ?auto_175368 ?auto_175373 ) ) ( not ( = ?auto_175368 ?auto_175374 ) ) ( not ( = ?auto_175369 ?auto_175373 ) ) ( not ( = ?auto_175369 ?auto_175374 ) ) ( not ( = ?auto_175370 ?auto_175373 ) ) ( not ( = ?auto_175370 ?auto_175374 ) ) ( not ( = ?auto_175371 ?auto_175373 ) ) ( not ( = ?auto_175371 ?auto_175374 ) ) ( not ( = ?auto_175372 ?auto_175373 ) ) ( not ( = ?auto_175372 ?auto_175374 ) ) ( not ( = ?auto_175373 ?auto_175374 ) ) )
    :subtasks
    ( ( !STACK ?auto_175373 ?auto_175374 )
      ( MAKE-4PILE ?auto_175368 ?auto_175369 ?auto_175370 ?auto_175371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175375 - BLOCK
      ?auto_175376 - BLOCK
      ?auto_175377 - BLOCK
      ?auto_175378 - BLOCK
    )
    :vars
    (
      ?auto_175380 - BLOCK
      ?auto_175379 - BLOCK
      ?auto_175381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175380 ?auto_175378 ) ( ON-TABLE ?auto_175375 ) ( ON ?auto_175376 ?auto_175375 ) ( ON ?auto_175377 ?auto_175376 ) ( ON ?auto_175378 ?auto_175377 ) ( not ( = ?auto_175375 ?auto_175376 ) ) ( not ( = ?auto_175375 ?auto_175377 ) ) ( not ( = ?auto_175375 ?auto_175378 ) ) ( not ( = ?auto_175375 ?auto_175380 ) ) ( not ( = ?auto_175376 ?auto_175377 ) ) ( not ( = ?auto_175376 ?auto_175378 ) ) ( not ( = ?auto_175376 ?auto_175380 ) ) ( not ( = ?auto_175377 ?auto_175378 ) ) ( not ( = ?auto_175377 ?auto_175380 ) ) ( not ( = ?auto_175378 ?auto_175380 ) ) ( CLEAR ?auto_175379 ) ( not ( = ?auto_175375 ?auto_175381 ) ) ( not ( = ?auto_175375 ?auto_175379 ) ) ( not ( = ?auto_175376 ?auto_175381 ) ) ( not ( = ?auto_175376 ?auto_175379 ) ) ( not ( = ?auto_175377 ?auto_175381 ) ) ( not ( = ?auto_175377 ?auto_175379 ) ) ( not ( = ?auto_175378 ?auto_175381 ) ) ( not ( = ?auto_175378 ?auto_175379 ) ) ( not ( = ?auto_175380 ?auto_175381 ) ) ( not ( = ?auto_175380 ?auto_175379 ) ) ( not ( = ?auto_175381 ?auto_175379 ) ) ( ON ?auto_175381 ?auto_175380 ) ( CLEAR ?auto_175381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175375 ?auto_175376 ?auto_175377 ?auto_175378 ?auto_175380 )
      ( MAKE-4PILE ?auto_175375 ?auto_175376 ?auto_175377 ?auto_175378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175382 - BLOCK
      ?auto_175383 - BLOCK
      ?auto_175384 - BLOCK
      ?auto_175385 - BLOCK
    )
    :vars
    (
      ?auto_175387 - BLOCK
      ?auto_175388 - BLOCK
      ?auto_175386 - BLOCK
      ?auto_175389 - BLOCK
      ?auto_175390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175387 ?auto_175385 ) ( ON-TABLE ?auto_175382 ) ( ON ?auto_175383 ?auto_175382 ) ( ON ?auto_175384 ?auto_175383 ) ( ON ?auto_175385 ?auto_175384 ) ( not ( = ?auto_175382 ?auto_175383 ) ) ( not ( = ?auto_175382 ?auto_175384 ) ) ( not ( = ?auto_175382 ?auto_175385 ) ) ( not ( = ?auto_175382 ?auto_175387 ) ) ( not ( = ?auto_175383 ?auto_175384 ) ) ( not ( = ?auto_175383 ?auto_175385 ) ) ( not ( = ?auto_175383 ?auto_175387 ) ) ( not ( = ?auto_175384 ?auto_175385 ) ) ( not ( = ?auto_175384 ?auto_175387 ) ) ( not ( = ?auto_175385 ?auto_175387 ) ) ( not ( = ?auto_175382 ?auto_175388 ) ) ( not ( = ?auto_175382 ?auto_175386 ) ) ( not ( = ?auto_175383 ?auto_175388 ) ) ( not ( = ?auto_175383 ?auto_175386 ) ) ( not ( = ?auto_175384 ?auto_175388 ) ) ( not ( = ?auto_175384 ?auto_175386 ) ) ( not ( = ?auto_175385 ?auto_175388 ) ) ( not ( = ?auto_175385 ?auto_175386 ) ) ( not ( = ?auto_175387 ?auto_175388 ) ) ( not ( = ?auto_175387 ?auto_175386 ) ) ( not ( = ?auto_175388 ?auto_175386 ) ) ( ON ?auto_175388 ?auto_175387 ) ( CLEAR ?auto_175388 ) ( HOLDING ?auto_175386 ) ( CLEAR ?auto_175389 ) ( ON-TABLE ?auto_175390 ) ( ON ?auto_175389 ?auto_175390 ) ( not ( = ?auto_175390 ?auto_175389 ) ) ( not ( = ?auto_175390 ?auto_175386 ) ) ( not ( = ?auto_175389 ?auto_175386 ) ) ( not ( = ?auto_175382 ?auto_175389 ) ) ( not ( = ?auto_175382 ?auto_175390 ) ) ( not ( = ?auto_175383 ?auto_175389 ) ) ( not ( = ?auto_175383 ?auto_175390 ) ) ( not ( = ?auto_175384 ?auto_175389 ) ) ( not ( = ?auto_175384 ?auto_175390 ) ) ( not ( = ?auto_175385 ?auto_175389 ) ) ( not ( = ?auto_175385 ?auto_175390 ) ) ( not ( = ?auto_175387 ?auto_175389 ) ) ( not ( = ?auto_175387 ?auto_175390 ) ) ( not ( = ?auto_175388 ?auto_175389 ) ) ( not ( = ?auto_175388 ?auto_175390 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175390 ?auto_175389 ?auto_175386 )
      ( MAKE-4PILE ?auto_175382 ?auto_175383 ?auto_175384 ?auto_175385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175391 - BLOCK
      ?auto_175392 - BLOCK
      ?auto_175393 - BLOCK
      ?auto_175394 - BLOCK
    )
    :vars
    (
      ?auto_175397 - BLOCK
      ?auto_175395 - BLOCK
      ?auto_175398 - BLOCK
      ?auto_175396 - BLOCK
      ?auto_175399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175397 ?auto_175394 ) ( ON-TABLE ?auto_175391 ) ( ON ?auto_175392 ?auto_175391 ) ( ON ?auto_175393 ?auto_175392 ) ( ON ?auto_175394 ?auto_175393 ) ( not ( = ?auto_175391 ?auto_175392 ) ) ( not ( = ?auto_175391 ?auto_175393 ) ) ( not ( = ?auto_175391 ?auto_175394 ) ) ( not ( = ?auto_175391 ?auto_175397 ) ) ( not ( = ?auto_175392 ?auto_175393 ) ) ( not ( = ?auto_175392 ?auto_175394 ) ) ( not ( = ?auto_175392 ?auto_175397 ) ) ( not ( = ?auto_175393 ?auto_175394 ) ) ( not ( = ?auto_175393 ?auto_175397 ) ) ( not ( = ?auto_175394 ?auto_175397 ) ) ( not ( = ?auto_175391 ?auto_175395 ) ) ( not ( = ?auto_175391 ?auto_175398 ) ) ( not ( = ?auto_175392 ?auto_175395 ) ) ( not ( = ?auto_175392 ?auto_175398 ) ) ( not ( = ?auto_175393 ?auto_175395 ) ) ( not ( = ?auto_175393 ?auto_175398 ) ) ( not ( = ?auto_175394 ?auto_175395 ) ) ( not ( = ?auto_175394 ?auto_175398 ) ) ( not ( = ?auto_175397 ?auto_175395 ) ) ( not ( = ?auto_175397 ?auto_175398 ) ) ( not ( = ?auto_175395 ?auto_175398 ) ) ( ON ?auto_175395 ?auto_175397 ) ( CLEAR ?auto_175396 ) ( ON-TABLE ?auto_175399 ) ( ON ?auto_175396 ?auto_175399 ) ( not ( = ?auto_175399 ?auto_175396 ) ) ( not ( = ?auto_175399 ?auto_175398 ) ) ( not ( = ?auto_175396 ?auto_175398 ) ) ( not ( = ?auto_175391 ?auto_175396 ) ) ( not ( = ?auto_175391 ?auto_175399 ) ) ( not ( = ?auto_175392 ?auto_175396 ) ) ( not ( = ?auto_175392 ?auto_175399 ) ) ( not ( = ?auto_175393 ?auto_175396 ) ) ( not ( = ?auto_175393 ?auto_175399 ) ) ( not ( = ?auto_175394 ?auto_175396 ) ) ( not ( = ?auto_175394 ?auto_175399 ) ) ( not ( = ?auto_175397 ?auto_175396 ) ) ( not ( = ?auto_175397 ?auto_175399 ) ) ( not ( = ?auto_175395 ?auto_175396 ) ) ( not ( = ?auto_175395 ?auto_175399 ) ) ( ON ?auto_175398 ?auto_175395 ) ( CLEAR ?auto_175398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175391 ?auto_175392 ?auto_175393 ?auto_175394 ?auto_175397 ?auto_175395 )
      ( MAKE-4PILE ?auto_175391 ?auto_175392 ?auto_175393 ?auto_175394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175400 - BLOCK
      ?auto_175401 - BLOCK
      ?auto_175402 - BLOCK
      ?auto_175403 - BLOCK
    )
    :vars
    (
      ?auto_175405 - BLOCK
      ?auto_175406 - BLOCK
      ?auto_175404 - BLOCK
      ?auto_175407 - BLOCK
      ?auto_175408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175405 ?auto_175403 ) ( ON-TABLE ?auto_175400 ) ( ON ?auto_175401 ?auto_175400 ) ( ON ?auto_175402 ?auto_175401 ) ( ON ?auto_175403 ?auto_175402 ) ( not ( = ?auto_175400 ?auto_175401 ) ) ( not ( = ?auto_175400 ?auto_175402 ) ) ( not ( = ?auto_175400 ?auto_175403 ) ) ( not ( = ?auto_175400 ?auto_175405 ) ) ( not ( = ?auto_175401 ?auto_175402 ) ) ( not ( = ?auto_175401 ?auto_175403 ) ) ( not ( = ?auto_175401 ?auto_175405 ) ) ( not ( = ?auto_175402 ?auto_175403 ) ) ( not ( = ?auto_175402 ?auto_175405 ) ) ( not ( = ?auto_175403 ?auto_175405 ) ) ( not ( = ?auto_175400 ?auto_175406 ) ) ( not ( = ?auto_175400 ?auto_175404 ) ) ( not ( = ?auto_175401 ?auto_175406 ) ) ( not ( = ?auto_175401 ?auto_175404 ) ) ( not ( = ?auto_175402 ?auto_175406 ) ) ( not ( = ?auto_175402 ?auto_175404 ) ) ( not ( = ?auto_175403 ?auto_175406 ) ) ( not ( = ?auto_175403 ?auto_175404 ) ) ( not ( = ?auto_175405 ?auto_175406 ) ) ( not ( = ?auto_175405 ?auto_175404 ) ) ( not ( = ?auto_175406 ?auto_175404 ) ) ( ON ?auto_175406 ?auto_175405 ) ( ON-TABLE ?auto_175407 ) ( not ( = ?auto_175407 ?auto_175408 ) ) ( not ( = ?auto_175407 ?auto_175404 ) ) ( not ( = ?auto_175408 ?auto_175404 ) ) ( not ( = ?auto_175400 ?auto_175408 ) ) ( not ( = ?auto_175400 ?auto_175407 ) ) ( not ( = ?auto_175401 ?auto_175408 ) ) ( not ( = ?auto_175401 ?auto_175407 ) ) ( not ( = ?auto_175402 ?auto_175408 ) ) ( not ( = ?auto_175402 ?auto_175407 ) ) ( not ( = ?auto_175403 ?auto_175408 ) ) ( not ( = ?auto_175403 ?auto_175407 ) ) ( not ( = ?auto_175405 ?auto_175408 ) ) ( not ( = ?auto_175405 ?auto_175407 ) ) ( not ( = ?auto_175406 ?auto_175408 ) ) ( not ( = ?auto_175406 ?auto_175407 ) ) ( ON ?auto_175404 ?auto_175406 ) ( CLEAR ?auto_175404 ) ( HOLDING ?auto_175408 ) ( CLEAR ?auto_175407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175407 ?auto_175408 )
      ( MAKE-4PILE ?auto_175400 ?auto_175401 ?auto_175402 ?auto_175403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175409 - BLOCK
      ?auto_175410 - BLOCK
      ?auto_175411 - BLOCK
      ?auto_175412 - BLOCK
    )
    :vars
    (
      ?auto_175417 - BLOCK
      ?auto_175416 - BLOCK
      ?auto_175415 - BLOCK
      ?auto_175414 - BLOCK
      ?auto_175413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175417 ?auto_175412 ) ( ON-TABLE ?auto_175409 ) ( ON ?auto_175410 ?auto_175409 ) ( ON ?auto_175411 ?auto_175410 ) ( ON ?auto_175412 ?auto_175411 ) ( not ( = ?auto_175409 ?auto_175410 ) ) ( not ( = ?auto_175409 ?auto_175411 ) ) ( not ( = ?auto_175409 ?auto_175412 ) ) ( not ( = ?auto_175409 ?auto_175417 ) ) ( not ( = ?auto_175410 ?auto_175411 ) ) ( not ( = ?auto_175410 ?auto_175412 ) ) ( not ( = ?auto_175410 ?auto_175417 ) ) ( not ( = ?auto_175411 ?auto_175412 ) ) ( not ( = ?auto_175411 ?auto_175417 ) ) ( not ( = ?auto_175412 ?auto_175417 ) ) ( not ( = ?auto_175409 ?auto_175416 ) ) ( not ( = ?auto_175409 ?auto_175415 ) ) ( not ( = ?auto_175410 ?auto_175416 ) ) ( not ( = ?auto_175410 ?auto_175415 ) ) ( not ( = ?auto_175411 ?auto_175416 ) ) ( not ( = ?auto_175411 ?auto_175415 ) ) ( not ( = ?auto_175412 ?auto_175416 ) ) ( not ( = ?auto_175412 ?auto_175415 ) ) ( not ( = ?auto_175417 ?auto_175416 ) ) ( not ( = ?auto_175417 ?auto_175415 ) ) ( not ( = ?auto_175416 ?auto_175415 ) ) ( ON ?auto_175416 ?auto_175417 ) ( ON-TABLE ?auto_175414 ) ( not ( = ?auto_175414 ?auto_175413 ) ) ( not ( = ?auto_175414 ?auto_175415 ) ) ( not ( = ?auto_175413 ?auto_175415 ) ) ( not ( = ?auto_175409 ?auto_175413 ) ) ( not ( = ?auto_175409 ?auto_175414 ) ) ( not ( = ?auto_175410 ?auto_175413 ) ) ( not ( = ?auto_175410 ?auto_175414 ) ) ( not ( = ?auto_175411 ?auto_175413 ) ) ( not ( = ?auto_175411 ?auto_175414 ) ) ( not ( = ?auto_175412 ?auto_175413 ) ) ( not ( = ?auto_175412 ?auto_175414 ) ) ( not ( = ?auto_175417 ?auto_175413 ) ) ( not ( = ?auto_175417 ?auto_175414 ) ) ( not ( = ?auto_175416 ?auto_175413 ) ) ( not ( = ?auto_175416 ?auto_175414 ) ) ( ON ?auto_175415 ?auto_175416 ) ( CLEAR ?auto_175414 ) ( ON ?auto_175413 ?auto_175415 ) ( CLEAR ?auto_175413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175409 ?auto_175410 ?auto_175411 ?auto_175412 ?auto_175417 ?auto_175416 ?auto_175415 )
      ( MAKE-4PILE ?auto_175409 ?auto_175410 ?auto_175411 ?auto_175412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175418 - BLOCK
      ?auto_175419 - BLOCK
      ?auto_175420 - BLOCK
      ?auto_175421 - BLOCK
    )
    :vars
    (
      ?auto_175425 - BLOCK
      ?auto_175424 - BLOCK
      ?auto_175422 - BLOCK
      ?auto_175423 - BLOCK
      ?auto_175426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175425 ?auto_175421 ) ( ON-TABLE ?auto_175418 ) ( ON ?auto_175419 ?auto_175418 ) ( ON ?auto_175420 ?auto_175419 ) ( ON ?auto_175421 ?auto_175420 ) ( not ( = ?auto_175418 ?auto_175419 ) ) ( not ( = ?auto_175418 ?auto_175420 ) ) ( not ( = ?auto_175418 ?auto_175421 ) ) ( not ( = ?auto_175418 ?auto_175425 ) ) ( not ( = ?auto_175419 ?auto_175420 ) ) ( not ( = ?auto_175419 ?auto_175421 ) ) ( not ( = ?auto_175419 ?auto_175425 ) ) ( not ( = ?auto_175420 ?auto_175421 ) ) ( not ( = ?auto_175420 ?auto_175425 ) ) ( not ( = ?auto_175421 ?auto_175425 ) ) ( not ( = ?auto_175418 ?auto_175424 ) ) ( not ( = ?auto_175418 ?auto_175422 ) ) ( not ( = ?auto_175419 ?auto_175424 ) ) ( not ( = ?auto_175419 ?auto_175422 ) ) ( not ( = ?auto_175420 ?auto_175424 ) ) ( not ( = ?auto_175420 ?auto_175422 ) ) ( not ( = ?auto_175421 ?auto_175424 ) ) ( not ( = ?auto_175421 ?auto_175422 ) ) ( not ( = ?auto_175425 ?auto_175424 ) ) ( not ( = ?auto_175425 ?auto_175422 ) ) ( not ( = ?auto_175424 ?auto_175422 ) ) ( ON ?auto_175424 ?auto_175425 ) ( not ( = ?auto_175423 ?auto_175426 ) ) ( not ( = ?auto_175423 ?auto_175422 ) ) ( not ( = ?auto_175426 ?auto_175422 ) ) ( not ( = ?auto_175418 ?auto_175426 ) ) ( not ( = ?auto_175418 ?auto_175423 ) ) ( not ( = ?auto_175419 ?auto_175426 ) ) ( not ( = ?auto_175419 ?auto_175423 ) ) ( not ( = ?auto_175420 ?auto_175426 ) ) ( not ( = ?auto_175420 ?auto_175423 ) ) ( not ( = ?auto_175421 ?auto_175426 ) ) ( not ( = ?auto_175421 ?auto_175423 ) ) ( not ( = ?auto_175425 ?auto_175426 ) ) ( not ( = ?auto_175425 ?auto_175423 ) ) ( not ( = ?auto_175424 ?auto_175426 ) ) ( not ( = ?auto_175424 ?auto_175423 ) ) ( ON ?auto_175422 ?auto_175424 ) ( ON ?auto_175426 ?auto_175422 ) ( CLEAR ?auto_175426 ) ( HOLDING ?auto_175423 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175423 )
      ( MAKE-4PILE ?auto_175418 ?auto_175419 ?auto_175420 ?auto_175421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175427 - BLOCK
      ?auto_175428 - BLOCK
      ?auto_175429 - BLOCK
      ?auto_175430 - BLOCK
    )
    :vars
    (
      ?auto_175433 - BLOCK
      ?auto_175432 - BLOCK
      ?auto_175431 - BLOCK
      ?auto_175435 - BLOCK
      ?auto_175434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175433 ?auto_175430 ) ( ON-TABLE ?auto_175427 ) ( ON ?auto_175428 ?auto_175427 ) ( ON ?auto_175429 ?auto_175428 ) ( ON ?auto_175430 ?auto_175429 ) ( not ( = ?auto_175427 ?auto_175428 ) ) ( not ( = ?auto_175427 ?auto_175429 ) ) ( not ( = ?auto_175427 ?auto_175430 ) ) ( not ( = ?auto_175427 ?auto_175433 ) ) ( not ( = ?auto_175428 ?auto_175429 ) ) ( not ( = ?auto_175428 ?auto_175430 ) ) ( not ( = ?auto_175428 ?auto_175433 ) ) ( not ( = ?auto_175429 ?auto_175430 ) ) ( not ( = ?auto_175429 ?auto_175433 ) ) ( not ( = ?auto_175430 ?auto_175433 ) ) ( not ( = ?auto_175427 ?auto_175432 ) ) ( not ( = ?auto_175427 ?auto_175431 ) ) ( not ( = ?auto_175428 ?auto_175432 ) ) ( not ( = ?auto_175428 ?auto_175431 ) ) ( not ( = ?auto_175429 ?auto_175432 ) ) ( not ( = ?auto_175429 ?auto_175431 ) ) ( not ( = ?auto_175430 ?auto_175432 ) ) ( not ( = ?auto_175430 ?auto_175431 ) ) ( not ( = ?auto_175433 ?auto_175432 ) ) ( not ( = ?auto_175433 ?auto_175431 ) ) ( not ( = ?auto_175432 ?auto_175431 ) ) ( ON ?auto_175432 ?auto_175433 ) ( not ( = ?auto_175435 ?auto_175434 ) ) ( not ( = ?auto_175435 ?auto_175431 ) ) ( not ( = ?auto_175434 ?auto_175431 ) ) ( not ( = ?auto_175427 ?auto_175434 ) ) ( not ( = ?auto_175427 ?auto_175435 ) ) ( not ( = ?auto_175428 ?auto_175434 ) ) ( not ( = ?auto_175428 ?auto_175435 ) ) ( not ( = ?auto_175429 ?auto_175434 ) ) ( not ( = ?auto_175429 ?auto_175435 ) ) ( not ( = ?auto_175430 ?auto_175434 ) ) ( not ( = ?auto_175430 ?auto_175435 ) ) ( not ( = ?auto_175433 ?auto_175434 ) ) ( not ( = ?auto_175433 ?auto_175435 ) ) ( not ( = ?auto_175432 ?auto_175434 ) ) ( not ( = ?auto_175432 ?auto_175435 ) ) ( ON ?auto_175431 ?auto_175432 ) ( ON ?auto_175434 ?auto_175431 ) ( ON ?auto_175435 ?auto_175434 ) ( CLEAR ?auto_175435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175427 ?auto_175428 ?auto_175429 ?auto_175430 ?auto_175433 ?auto_175432 ?auto_175431 ?auto_175434 )
      ( MAKE-4PILE ?auto_175427 ?auto_175428 ?auto_175429 ?auto_175430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175441 - BLOCK
      ?auto_175442 - BLOCK
      ?auto_175443 - BLOCK
      ?auto_175444 - BLOCK
      ?auto_175445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_175445 ) ( CLEAR ?auto_175444 ) ( ON-TABLE ?auto_175441 ) ( ON ?auto_175442 ?auto_175441 ) ( ON ?auto_175443 ?auto_175442 ) ( ON ?auto_175444 ?auto_175443 ) ( not ( = ?auto_175441 ?auto_175442 ) ) ( not ( = ?auto_175441 ?auto_175443 ) ) ( not ( = ?auto_175441 ?auto_175444 ) ) ( not ( = ?auto_175441 ?auto_175445 ) ) ( not ( = ?auto_175442 ?auto_175443 ) ) ( not ( = ?auto_175442 ?auto_175444 ) ) ( not ( = ?auto_175442 ?auto_175445 ) ) ( not ( = ?auto_175443 ?auto_175444 ) ) ( not ( = ?auto_175443 ?auto_175445 ) ) ( not ( = ?auto_175444 ?auto_175445 ) ) )
    :subtasks
    ( ( !STACK ?auto_175445 ?auto_175444 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175446 - BLOCK
      ?auto_175447 - BLOCK
      ?auto_175448 - BLOCK
      ?auto_175449 - BLOCK
      ?auto_175450 - BLOCK
    )
    :vars
    (
      ?auto_175451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175449 ) ( ON-TABLE ?auto_175446 ) ( ON ?auto_175447 ?auto_175446 ) ( ON ?auto_175448 ?auto_175447 ) ( ON ?auto_175449 ?auto_175448 ) ( not ( = ?auto_175446 ?auto_175447 ) ) ( not ( = ?auto_175446 ?auto_175448 ) ) ( not ( = ?auto_175446 ?auto_175449 ) ) ( not ( = ?auto_175446 ?auto_175450 ) ) ( not ( = ?auto_175447 ?auto_175448 ) ) ( not ( = ?auto_175447 ?auto_175449 ) ) ( not ( = ?auto_175447 ?auto_175450 ) ) ( not ( = ?auto_175448 ?auto_175449 ) ) ( not ( = ?auto_175448 ?auto_175450 ) ) ( not ( = ?auto_175449 ?auto_175450 ) ) ( ON ?auto_175450 ?auto_175451 ) ( CLEAR ?auto_175450 ) ( HAND-EMPTY ) ( not ( = ?auto_175446 ?auto_175451 ) ) ( not ( = ?auto_175447 ?auto_175451 ) ) ( not ( = ?auto_175448 ?auto_175451 ) ) ( not ( = ?auto_175449 ?auto_175451 ) ) ( not ( = ?auto_175450 ?auto_175451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175450 ?auto_175451 )
      ( MAKE-5PILE ?auto_175446 ?auto_175447 ?auto_175448 ?auto_175449 ?auto_175450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175452 - BLOCK
      ?auto_175453 - BLOCK
      ?auto_175454 - BLOCK
      ?auto_175455 - BLOCK
      ?auto_175456 - BLOCK
    )
    :vars
    (
      ?auto_175457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175452 ) ( ON ?auto_175453 ?auto_175452 ) ( ON ?auto_175454 ?auto_175453 ) ( not ( = ?auto_175452 ?auto_175453 ) ) ( not ( = ?auto_175452 ?auto_175454 ) ) ( not ( = ?auto_175452 ?auto_175455 ) ) ( not ( = ?auto_175452 ?auto_175456 ) ) ( not ( = ?auto_175453 ?auto_175454 ) ) ( not ( = ?auto_175453 ?auto_175455 ) ) ( not ( = ?auto_175453 ?auto_175456 ) ) ( not ( = ?auto_175454 ?auto_175455 ) ) ( not ( = ?auto_175454 ?auto_175456 ) ) ( not ( = ?auto_175455 ?auto_175456 ) ) ( ON ?auto_175456 ?auto_175457 ) ( CLEAR ?auto_175456 ) ( not ( = ?auto_175452 ?auto_175457 ) ) ( not ( = ?auto_175453 ?auto_175457 ) ) ( not ( = ?auto_175454 ?auto_175457 ) ) ( not ( = ?auto_175455 ?auto_175457 ) ) ( not ( = ?auto_175456 ?auto_175457 ) ) ( HOLDING ?auto_175455 ) ( CLEAR ?auto_175454 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175452 ?auto_175453 ?auto_175454 ?auto_175455 )
      ( MAKE-5PILE ?auto_175452 ?auto_175453 ?auto_175454 ?auto_175455 ?auto_175456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175458 - BLOCK
      ?auto_175459 - BLOCK
      ?auto_175460 - BLOCK
      ?auto_175461 - BLOCK
      ?auto_175462 - BLOCK
    )
    :vars
    (
      ?auto_175463 - BLOCK
      ?auto_175466 - BLOCK
      ?auto_175464 - BLOCK
      ?auto_175465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175458 ) ( ON ?auto_175459 ?auto_175458 ) ( ON ?auto_175460 ?auto_175459 ) ( not ( = ?auto_175458 ?auto_175459 ) ) ( not ( = ?auto_175458 ?auto_175460 ) ) ( not ( = ?auto_175458 ?auto_175461 ) ) ( not ( = ?auto_175458 ?auto_175462 ) ) ( not ( = ?auto_175459 ?auto_175460 ) ) ( not ( = ?auto_175459 ?auto_175461 ) ) ( not ( = ?auto_175459 ?auto_175462 ) ) ( not ( = ?auto_175460 ?auto_175461 ) ) ( not ( = ?auto_175460 ?auto_175462 ) ) ( not ( = ?auto_175461 ?auto_175462 ) ) ( ON ?auto_175462 ?auto_175463 ) ( not ( = ?auto_175458 ?auto_175463 ) ) ( not ( = ?auto_175459 ?auto_175463 ) ) ( not ( = ?auto_175460 ?auto_175463 ) ) ( not ( = ?auto_175461 ?auto_175463 ) ) ( not ( = ?auto_175462 ?auto_175463 ) ) ( CLEAR ?auto_175460 ) ( ON ?auto_175461 ?auto_175462 ) ( CLEAR ?auto_175461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175466 ) ( ON ?auto_175464 ?auto_175466 ) ( ON ?auto_175465 ?auto_175464 ) ( ON ?auto_175463 ?auto_175465 ) ( not ( = ?auto_175466 ?auto_175464 ) ) ( not ( = ?auto_175466 ?auto_175465 ) ) ( not ( = ?auto_175466 ?auto_175463 ) ) ( not ( = ?auto_175466 ?auto_175462 ) ) ( not ( = ?auto_175466 ?auto_175461 ) ) ( not ( = ?auto_175464 ?auto_175465 ) ) ( not ( = ?auto_175464 ?auto_175463 ) ) ( not ( = ?auto_175464 ?auto_175462 ) ) ( not ( = ?auto_175464 ?auto_175461 ) ) ( not ( = ?auto_175465 ?auto_175463 ) ) ( not ( = ?auto_175465 ?auto_175462 ) ) ( not ( = ?auto_175465 ?auto_175461 ) ) ( not ( = ?auto_175458 ?auto_175466 ) ) ( not ( = ?auto_175458 ?auto_175464 ) ) ( not ( = ?auto_175458 ?auto_175465 ) ) ( not ( = ?auto_175459 ?auto_175466 ) ) ( not ( = ?auto_175459 ?auto_175464 ) ) ( not ( = ?auto_175459 ?auto_175465 ) ) ( not ( = ?auto_175460 ?auto_175466 ) ) ( not ( = ?auto_175460 ?auto_175464 ) ) ( not ( = ?auto_175460 ?auto_175465 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175466 ?auto_175464 ?auto_175465 ?auto_175463 ?auto_175462 )
      ( MAKE-5PILE ?auto_175458 ?auto_175459 ?auto_175460 ?auto_175461 ?auto_175462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175467 - BLOCK
      ?auto_175468 - BLOCK
      ?auto_175469 - BLOCK
      ?auto_175470 - BLOCK
      ?auto_175471 - BLOCK
    )
    :vars
    (
      ?auto_175475 - BLOCK
      ?auto_175473 - BLOCK
      ?auto_175472 - BLOCK
      ?auto_175474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175467 ) ( ON ?auto_175468 ?auto_175467 ) ( not ( = ?auto_175467 ?auto_175468 ) ) ( not ( = ?auto_175467 ?auto_175469 ) ) ( not ( = ?auto_175467 ?auto_175470 ) ) ( not ( = ?auto_175467 ?auto_175471 ) ) ( not ( = ?auto_175468 ?auto_175469 ) ) ( not ( = ?auto_175468 ?auto_175470 ) ) ( not ( = ?auto_175468 ?auto_175471 ) ) ( not ( = ?auto_175469 ?auto_175470 ) ) ( not ( = ?auto_175469 ?auto_175471 ) ) ( not ( = ?auto_175470 ?auto_175471 ) ) ( ON ?auto_175471 ?auto_175475 ) ( not ( = ?auto_175467 ?auto_175475 ) ) ( not ( = ?auto_175468 ?auto_175475 ) ) ( not ( = ?auto_175469 ?auto_175475 ) ) ( not ( = ?auto_175470 ?auto_175475 ) ) ( not ( = ?auto_175471 ?auto_175475 ) ) ( ON ?auto_175470 ?auto_175471 ) ( CLEAR ?auto_175470 ) ( ON-TABLE ?auto_175473 ) ( ON ?auto_175472 ?auto_175473 ) ( ON ?auto_175474 ?auto_175472 ) ( ON ?auto_175475 ?auto_175474 ) ( not ( = ?auto_175473 ?auto_175472 ) ) ( not ( = ?auto_175473 ?auto_175474 ) ) ( not ( = ?auto_175473 ?auto_175475 ) ) ( not ( = ?auto_175473 ?auto_175471 ) ) ( not ( = ?auto_175473 ?auto_175470 ) ) ( not ( = ?auto_175472 ?auto_175474 ) ) ( not ( = ?auto_175472 ?auto_175475 ) ) ( not ( = ?auto_175472 ?auto_175471 ) ) ( not ( = ?auto_175472 ?auto_175470 ) ) ( not ( = ?auto_175474 ?auto_175475 ) ) ( not ( = ?auto_175474 ?auto_175471 ) ) ( not ( = ?auto_175474 ?auto_175470 ) ) ( not ( = ?auto_175467 ?auto_175473 ) ) ( not ( = ?auto_175467 ?auto_175472 ) ) ( not ( = ?auto_175467 ?auto_175474 ) ) ( not ( = ?auto_175468 ?auto_175473 ) ) ( not ( = ?auto_175468 ?auto_175472 ) ) ( not ( = ?auto_175468 ?auto_175474 ) ) ( not ( = ?auto_175469 ?auto_175473 ) ) ( not ( = ?auto_175469 ?auto_175472 ) ) ( not ( = ?auto_175469 ?auto_175474 ) ) ( HOLDING ?auto_175469 ) ( CLEAR ?auto_175468 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175467 ?auto_175468 ?auto_175469 )
      ( MAKE-5PILE ?auto_175467 ?auto_175468 ?auto_175469 ?auto_175470 ?auto_175471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175476 - BLOCK
      ?auto_175477 - BLOCK
      ?auto_175478 - BLOCK
      ?auto_175479 - BLOCK
      ?auto_175480 - BLOCK
    )
    :vars
    (
      ?auto_175484 - BLOCK
      ?auto_175483 - BLOCK
      ?auto_175481 - BLOCK
      ?auto_175482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175476 ) ( ON ?auto_175477 ?auto_175476 ) ( not ( = ?auto_175476 ?auto_175477 ) ) ( not ( = ?auto_175476 ?auto_175478 ) ) ( not ( = ?auto_175476 ?auto_175479 ) ) ( not ( = ?auto_175476 ?auto_175480 ) ) ( not ( = ?auto_175477 ?auto_175478 ) ) ( not ( = ?auto_175477 ?auto_175479 ) ) ( not ( = ?auto_175477 ?auto_175480 ) ) ( not ( = ?auto_175478 ?auto_175479 ) ) ( not ( = ?auto_175478 ?auto_175480 ) ) ( not ( = ?auto_175479 ?auto_175480 ) ) ( ON ?auto_175480 ?auto_175484 ) ( not ( = ?auto_175476 ?auto_175484 ) ) ( not ( = ?auto_175477 ?auto_175484 ) ) ( not ( = ?auto_175478 ?auto_175484 ) ) ( not ( = ?auto_175479 ?auto_175484 ) ) ( not ( = ?auto_175480 ?auto_175484 ) ) ( ON ?auto_175479 ?auto_175480 ) ( ON-TABLE ?auto_175483 ) ( ON ?auto_175481 ?auto_175483 ) ( ON ?auto_175482 ?auto_175481 ) ( ON ?auto_175484 ?auto_175482 ) ( not ( = ?auto_175483 ?auto_175481 ) ) ( not ( = ?auto_175483 ?auto_175482 ) ) ( not ( = ?auto_175483 ?auto_175484 ) ) ( not ( = ?auto_175483 ?auto_175480 ) ) ( not ( = ?auto_175483 ?auto_175479 ) ) ( not ( = ?auto_175481 ?auto_175482 ) ) ( not ( = ?auto_175481 ?auto_175484 ) ) ( not ( = ?auto_175481 ?auto_175480 ) ) ( not ( = ?auto_175481 ?auto_175479 ) ) ( not ( = ?auto_175482 ?auto_175484 ) ) ( not ( = ?auto_175482 ?auto_175480 ) ) ( not ( = ?auto_175482 ?auto_175479 ) ) ( not ( = ?auto_175476 ?auto_175483 ) ) ( not ( = ?auto_175476 ?auto_175481 ) ) ( not ( = ?auto_175476 ?auto_175482 ) ) ( not ( = ?auto_175477 ?auto_175483 ) ) ( not ( = ?auto_175477 ?auto_175481 ) ) ( not ( = ?auto_175477 ?auto_175482 ) ) ( not ( = ?auto_175478 ?auto_175483 ) ) ( not ( = ?auto_175478 ?auto_175481 ) ) ( not ( = ?auto_175478 ?auto_175482 ) ) ( CLEAR ?auto_175477 ) ( ON ?auto_175478 ?auto_175479 ) ( CLEAR ?auto_175478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175483 ?auto_175481 ?auto_175482 ?auto_175484 ?auto_175480 ?auto_175479 )
      ( MAKE-5PILE ?auto_175476 ?auto_175477 ?auto_175478 ?auto_175479 ?auto_175480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175485 - BLOCK
      ?auto_175486 - BLOCK
      ?auto_175487 - BLOCK
      ?auto_175488 - BLOCK
      ?auto_175489 - BLOCK
    )
    :vars
    (
      ?auto_175493 - BLOCK
      ?auto_175490 - BLOCK
      ?auto_175492 - BLOCK
      ?auto_175491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175485 ) ( not ( = ?auto_175485 ?auto_175486 ) ) ( not ( = ?auto_175485 ?auto_175487 ) ) ( not ( = ?auto_175485 ?auto_175488 ) ) ( not ( = ?auto_175485 ?auto_175489 ) ) ( not ( = ?auto_175486 ?auto_175487 ) ) ( not ( = ?auto_175486 ?auto_175488 ) ) ( not ( = ?auto_175486 ?auto_175489 ) ) ( not ( = ?auto_175487 ?auto_175488 ) ) ( not ( = ?auto_175487 ?auto_175489 ) ) ( not ( = ?auto_175488 ?auto_175489 ) ) ( ON ?auto_175489 ?auto_175493 ) ( not ( = ?auto_175485 ?auto_175493 ) ) ( not ( = ?auto_175486 ?auto_175493 ) ) ( not ( = ?auto_175487 ?auto_175493 ) ) ( not ( = ?auto_175488 ?auto_175493 ) ) ( not ( = ?auto_175489 ?auto_175493 ) ) ( ON ?auto_175488 ?auto_175489 ) ( ON-TABLE ?auto_175490 ) ( ON ?auto_175492 ?auto_175490 ) ( ON ?auto_175491 ?auto_175492 ) ( ON ?auto_175493 ?auto_175491 ) ( not ( = ?auto_175490 ?auto_175492 ) ) ( not ( = ?auto_175490 ?auto_175491 ) ) ( not ( = ?auto_175490 ?auto_175493 ) ) ( not ( = ?auto_175490 ?auto_175489 ) ) ( not ( = ?auto_175490 ?auto_175488 ) ) ( not ( = ?auto_175492 ?auto_175491 ) ) ( not ( = ?auto_175492 ?auto_175493 ) ) ( not ( = ?auto_175492 ?auto_175489 ) ) ( not ( = ?auto_175492 ?auto_175488 ) ) ( not ( = ?auto_175491 ?auto_175493 ) ) ( not ( = ?auto_175491 ?auto_175489 ) ) ( not ( = ?auto_175491 ?auto_175488 ) ) ( not ( = ?auto_175485 ?auto_175490 ) ) ( not ( = ?auto_175485 ?auto_175492 ) ) ( not ( = ?auto_175485 ?auto_175491 ) ) ( not ( = ?auto_175486 ?auto_175490 ) ) ( not ( = ?auto_175486 ?auto_175492 ) ) ( not ( = ?auto_175486 ?auto_175491 ) ) ( not ( = ?auto_175487 ?auto_175490 ) ) ( not ( = ?auto_175487 ?auto_175492 ) ) ( not ( = ?auto_175487 ?auto_175491 ) ) ( ON ?auto_175487 ?auto_175488 ) ( CLEAR ?auto_175487 ) ( HOLDING ?auto_175486 ) ( CLEAR ?auto_175485 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175485 ?auto_175486 )
      ( MAKE-5PILE ?auto_175485 ?auto_175486 ?auto_175487 ?auto_175488 ?auto_175489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175494 - BLOCK
      ?auto_175495 - BLOCK
      ?auto_175496 - BLOCK
      ?auto_175497 - BLOCK
      ?auto_175498 - BLOCK
    )
    :vars
    (
      ?auto_175502 - BLOCK
      ?auto_175501 - BLOCK
      ?auto_175499 - BLOCK
      ?auto_175500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175494 ) ( not ( = ?auto_175494 ?auto_175495 ) ) ( not ( = ?auto_175494 ?auto_175496 ) ) ( not ( = ?auto_175494 ?auto_175497 ) ) ( not ( = ?auto_175494 ?auto_175498 ) ) ( not ( = ?auto_175495 ?auto_175496 ) ) ( not ( = ?auto_175495 ?auto_175497 ) ) ( not ( = ?auto_175495 ?auto_175498 ) ) ( not ( = ?auto_175496 ?auto_175497 ) ) ( not ( = ?auto_175496 ?auto_175498 ) ) ( not ( = ?auto_175497 ?auto_175498 ) ) ( ON ?auto_175498 ?auto_175502 ) ( not ( = ?auto_175494 ?auto_175502 ) ) ( not ( = ?auto_175495 ?auto_175502 ) ) ( not ( = ?auto_175496 ?auto_175502 ) ) ( not ( = ?auto_175497 ?auto_175502 ) ) ( not ( = ?auto_175498 ?auto_175502 ) ) ( ON ?auto_175497 ?auto_175498 ) ( ON-TABLE ?auto_175501 ) ( ON ?auto_175499 ?auto_175501 ) ( ON ?auto_175500 ?auto_175499 ) ( ON ?auto_175502 ?auto_175500 ) ( not ( = ?auto_175501 ?auto_175499 ) ) ( not ( = ?auto_175501 ?auto_175500 ) ) ( not ( = ?auto_175501 ?auto_175502 ) ) ( not ( = ?auto_175501 ?auto_175498 ) ) ( not ( = ?auto_175501 ?auto_175497 ) ) ( not ( = ?auto_175499 ?auto_175500 ) ) ( not ( = ?auto_175499 ?auto_175502 ) ) ( not ( = ?auto_175499 ?auto_175498 ) ) ( not ( = ?auto_175499 ?auto_175497 ) ) ( not ( = ?auto_175500 ?auto_175502 ) ) ( not ( = ?auto_175500 ?auto_175498 ) ) ( not ( = ?auto_175500 ?auto_175497 ) ) ( not ( = ?auto_175494 ?auto_175501 ) ) ( not ( = ?auto_175494 ?auto_175499 ) ) ( not ( = ?auto_175494 ?auto_175500 ) ) ( not ( = ?auto_175495 ?auto_175501 ) ) ( not ( = ?auto_175495 ?auto_175499 ) ) ( not ( = ?auto_175495 ?auto_175500 ) ) ( not ( = ?auto_175496 ?auto_175501 ) ) ( not ( = ?auto_175496 ?auto_175499 ) ) ( not ( = ?auto_175496 ?auto_175500 ) ) ( ON ?auto_175496 ?auto_175497 ) ( CLEAR ?auto_175494 ) ( ON ?auto_175495 ?auto_175496 ) ( CLEAR ?auto_175495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175501 ?auto_175499 ?auto_175500 ?auto_175502 ?auto_175498 ?auto_175497 ?auto_175496 )
      ( MAKE-5PILE ?auto_175494 ?auto_175495 ?auto_175496 ?auto_175497 ?auto_175498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175503 - BLOCK
      ?auto_175504 - BLOCK
      ?auto_175505 - BLOCK
      ?auto_175506 - BLOCK
      ?auto_175507 - BLOCK
    )
    :vars
    (
      ?auto_175510 - BLOCK
      ?auto_175508 - BLOCK
      ?auto_175511 - BLOCK
      ?auto_175509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175503 ?auto_175504 ) ) ( not ( = ?auto_175503 ?auto_175505 ) ) ( not ( = ?auto_175503 ?auto_175506 ) ) ( not ( = ?auto_175503 ?auto_175507 ) ) ( not ( = ?auto_175504 ?auto_175505 ) ) ( not ( = ?auto_175504 ?auto_175506 ) ) ( not ( = ?auto_175504 ?auto_175507 ) ) ( not ( = ?auto_175505 ?auto_175506 ) ) ( not ( = ?auto_175505 ?auto_175507 ) ) ( not ( = ?auto_175506 ?auto_175507 ) ) ( ON ?auto_175507 ?auto_175510 ) ( not ( = ?auto_175503 ?auto_175510 ) ) ( not ( = ?auto_175504 ?auto_175510 ) ) ( not ( = ?auto_175505 ?auto_175510 ) ) ( not ( = ?auto_175506 ?auto_175510 ) ) ( not ( = ?auto_175507 ?auto_175510 ) ) ( ON ?auto_175506 ?auto_175507 ) ( ON-TABLE ?auto_175508 ) ( ON ?auto_175511 ?auto_175508 ) ( ON ?auto_175509 ?auto_175511 ) ( ON ?auto_175510 ?auto_175509 ) ( not ( = ?auto_175508 ?auto_175511 ) ) ( not ( = ?auto_175508 ?auto_175509 ) ) ( not ( = ?auto_175508 ?auto_175510 ) ) ( not ( = ?auto_175508 ?auto_175507 ) ) ( not ( = ?auto_175508 ?auto_175506 ) ) ( not ( = ?auto_175511 ?auto_175509 ) ) ( not ( = ?auto_175511 ?auto_175510 ) ) ( not ( = ?auto_175511 ?auto_175507 ) ) ( not ( = ?auto_175511 ?auto_175506 ) ) ( not ( = ?auto_175509 ?auto_175510 ) ) ( not ( = ?auto_175509 ?auto_175507 ) ) ( not ( = ?auto_175509 ?auto_175506 ) ) ( not ( = ?auto_175503 ?auto_175508 ) ) ( not ( = ?auto_175503 ?auto_175511 ) ) ( not ( = ?auto_175503 ?auto_175509 ) ) ( not ( = ?auto_175504 ?auto_175508 ) ) ( not ( = ?auto_175504 ?auto_175511 ) ) ( not ( = ?auto_175504 ?auto_175509 ) ) ( not ( = ?auto_175505 ?auto_175508 ) ) ( not ( = ?auto_175505 ?auto_175511 ) ) ( not ( = ?auto_175505 ?auto_175509 ) ) ( ON ?auto_175505 ?auto_175506 ) ( ON ?auto_175504 ?auto_175505 ) ( CLEAR ?auto_175504 ) ( HOLDING ?auto_175503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175503 )
      ( MAKE-5PILE ?auto_175503 ?auto_175504 ?auto_175505 ?auto_175506 ?auto_175507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175512 - BLOCK
      ?auto_175513 - BLOCK
      ?auto_175514 - BLOCK
      ?auto_175515 - BLOCK
      ?auto_175516 - BLOCK
    )
    :vars
    (
      ?auto_175518 - BLOCK
      ?auto_175517 - BLOCK
      ?auto_175519 - BLOCK
      ?auto_175520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175512 ?auto_175513 ) ) ( not ( = ?auto_175512 ?auto_175514 ) ) ( not ( = ?auto_175512 ?auto_175515 ) ) ( not ( = ?auto_175512 ?auto_175516 ) ) ( not ( = ?auto_175513 ?auto_175514 ) ) ( not ( = ?auto_175513 ?auto_175515 ) ) ( not ( = ?auto_175513 ?auto_175516 ) ) ( not ( = ?auto_175514 ?auto_175515 ) ) ( not ( = ?auto_175514 ?auto_175516 ) ) ( not ( = ?auto_175515 ?auto_175516 ) ) ( ON ?auto_175516 ?auto_175518 ) ( not ( = ?auto_175512 ?auto_175518 ) ) ( not ( = ?auto_175513 ?auto_175518 ) ) ( not ( = ?auto_175514 ?auto_175518 ) ) ( not ( = ?auto_175515 ?auto_175518 ) ) ( not ( = ?auto_175516 ?auto_175518 ) ) ( ON ?auto_175515 ?auto_175516 ) ( ON-TABLE ?auto_175517 ) ( ON ?auto_175519 ?auto_175517 ) ( ON ?auto_175520 ?auto_175519 ) ( ON ?auto_175518 ?auto_175520 ) ( not ( = ?auto_175517 ?auto_175519 ) ) ( not ( = ?auto_175517 ?auto_175520 ) ) ( not ( = ?auto_175517 ?auto_175518 ) ) ( not ( = ?auto_175517 ?auto_175516 ) ) ( not ( = ?auto_175517 ?auto_175515 ) ) ( not ( = ?auto_175519 ?auto_175520 ) ) ( not ( = ?auto_175519 ?auto_175518 ) ) ( not ( = ?auto_175519 ?auto_175516 ) ) ( not ( = ?auto_175519 ?auto_175515 ) ) ( not ( = ?auto_175520 ?auto_175518 ) ) ( not ( = ?auto_175520 ?auto_175516 ) ) ( not ( = ?auto_175520 ?auto_175515 ) ) ( not ( = ?auto_175512 ?auto_175517 ) ) ( not ( = ?auto_175512 ?auto_175519 ) ) ( not ( = ?auto_175512 ?auto_175520 ) ) ( not ( = ?auto_175513 ?auto_175517 ) ) ( not ( = ?auto_175513 ?auto_175519 ) ) ( not ( = ?auto_175513 ?auto_175520 ) ) ( not ( = ?auto_175514 ?auto_175517 ) ) ( not ( = ?auto_175514 ?auto_175519 ) ) ( not ( = ?auto_175514 ?auto_175520 ) ) ( ON ?auto_175514 ?auto_175515 ) ( ON ?auto_175513 ?auto_175514 ) ( ON ?auto_175512 ?auto_175513 ) ( CLEAR ?auto_175512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175517 ?auto_175519 ?auto_175520 ?auto_175518 ?auto_175516 ?auto_175515 ?auto_175514 ?auto_175513 )
      ( MAKE-5PILE ?auto_175512 ?auto_175513 ?auto_175514 ?auto_175515 ?auto_175516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175524 - BLOCK
      ?auto_175525 - BLOCK
      ?auto_175526 - BLOCK
    )
    :vars
    (
      ?auto_175527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175527 ?auto_175526 ) ( CLEAR ?auto_175527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175524 ) ( ON ?auto_175525 ?auto_175524 ) ( ON ?auto_175526 ?auto_175525 ) ( not ( = ?auto_175524 ?auto_175525 ) ) ( not ( = ?auto_175524 ?auto_175526 ) ) ( not ( = ?auto_175524 ?auto_175527 ) ) ( not ( = ?auto_175525 ?auto_175526 ) ) ( not ( = ?auto_175525 ?auto_175527 ) ) ( not ( = ?auto_175526 ?auto_175527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175527 ?auto_175526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175528 - BLOCK
      ?auto_175529 - BLOCK
      ?auto_175530 - BLOCK
    )
    :vars
    (
      ?auto_175531 - BLOCK
      ?auto_175532 - BLOCK
      ?auto_175533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175531 ?auto_175530 ) ( CLEAR ?auto_175531 ) ( ON-TABLE ?auto_175528 ) ( ON ?auto_175529 ?auto_175528 ) ( ON ?auto_175530 ?auto_175529 ) ( not ( = ?auto_175528 ?auto_175529 ) ) ( not ( = ?auto_175528 ?auto_175530 ) ) ( not ( = ?auto_175528 ?auto_175531 ) ) ( not ( = ?auto_175529 ?auto_175530 ) ) ( not ( = ?auto_175529 ?auto_175531 ) ) ( not ( = ?auto_175530 ?auto_175531 ) ) ( HOLDING ?auto_175532 ) ( CLEAR ?auto_175533 ) ( not ( = ?auto_175528 ?auto_175532 ) ) ( not ( = ?auto_175528 ?auto_175533 ) ) ( not ( = ?auto_175529 ?auto_175532 ) ) ( not ( = ?auto_175529 ?auto_175533 ) ) ( not ( = ?auto_175530 ?auto_175532 ) ) ( not ( = ?auto_175530 ?auto_175533 ) ) ( not ( = ?auto_175531 ?auto_175532 ) ) ( not ( = ?auto_175531 ?auto_175533 ) ) ( not ( = ?auto_175532 ?auto_175533 ) ) )
    :subtasks
    ( ( !STACK ?auto_175532 ?auto_175533 )
      ( MAKE-3PILE ?auto_175528 ?auto_175529 ?auto_175530 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175534 - BLOCK
      ?auto_175535 - BLOCK
      ?auto_175536 - BLOCK
    )
    :vars
    (
      ?auto_175539 - BLOCK
      ?auto_175538 - BLOCK
      ?auto_175537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175539 ?auto_175536 ) ( ON-TABLE ?auto_175534 ) ( ON ?auto_175535 ?auto_175534 ) ( ON ?auto_175536 ?auto_175535 ) ( not ( = ?auto_175534 ?auto_175535 ) ) ( not ( = ?auto_175534 ?auto_175536 ) ) ( not ( = ?auto_175534 ?auto_175539 ) ) ( not ( = ?auto_175535 ?auto_175536 ) ) ( not ( = ?auto_175535 ?auto_175539 ) ) ( not ( = ?auto_175536 ?auto_175539 ) ) ( CLEAR ?auto_175538 ) ( not ( = ?auto_175534 ?auto_175537 ) ) ( not ( = ?auto_175534 ?auto_175538 ) ) ( not ( = ?auto_175535 ?auto_175537 ) ) ( not ( = ?auto_175535 ?auto_175538 ) ) ( not ( = ?auto_175536 ?auto_175537 ) ) ( not ( = ?auto_175536 ?auto_175538 ) ) ( not ( = ?auto_175539 ?auto_175537 ) ) ( not ( = ?auto_175539 ?auto_175538 ) ) ( not ( = ?auto_175537 ?auto_175538 ) ) ( ON ?auto_175537 ?auto_175539 ) ( CLEAR ?auto_175537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175534 ?auto_175535 ?auto_175536 ?auto_175539 )
      ( MAKE-3PILE ?auto_175534 ?auto_175535 ?auto_175536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175540 - BLOCK
      ?auto_175541 - BLOCK
      ?auto_175542 - BLOCK
    )
    :vars
    (
      ?auto_175545 - BLOCK
      ?auto_175544 - BLOCK
      ?auto_175543 - BLOCK
      ?auto_175548 - BLOCK
      ?auto_175547 - BLOCK
      ?auto_175546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175545 ?auto_175542 ) ( ON-TABLE ?auto_175540 ) ( ON ?auto_175541 ?auto_175540 ) ( ON ?auto_175542 ?auto_175541 ) ( not ( = ?auto_175540 ?auto_175541 ) ) ( not ( = ?auto_175540 ?auto_175542 ) ) ( not ( = ?auto_175540 ?auto_175545 ) ) ( not ( = ?auto_175541 ?auto_175542 ) ) ( not ( = ?auto_175541 ?auto_175545 ) ) ( not ( = ?auto_175542 ?auto_175545 ) ) ( not ( = ?auto_175540 ?auto_175544 ) ) ( not ( = ?auto_175540 ?auto_175543 ) ) ( not ( = ?auto_175541 ?auto_175544 ) ) ( not ( = ?auto_175541 ?auto_175543 ) ) ( not ( = ?auto_175542 ?auto_175544 ) ) ( not ( = ?auto_175542 ?auto_175543 ) ) ( not ( = ?auto_175545 ?auto_175544 ) ) ( not ( = ?auto_175545 ?auto_175543 ) ) ( not ( = ?auto_175544 ?auto_175543 ) ) ( ON ?auto_175544 ?auto_175545 ) ( CLEAR ?auto_175544 ) ( HOLDING ?auto_175543 ) ( CLEAR ?auto_175548 ) ( ON-TABLE ?auto_175547 ) ( ON ?auto_175546 ?auto_175547 ) ( ON ?auto_175548 ?auto_175546 ) ( not ( = ?auto_175547 ?auto_175546 ) ) ( not ( = ?auto_175547 ?auto_175548 ) ) ( not ( = ?auto_175547 ?auto_175543 ) ) ( not ( = ?auto_175546 ?auto_175548 ) ) ( not ( = ?auto_175546 ?auto_175543 ) ) ( not ( = ?auto_175548 ?auto_175543 ) ) ( not ( = ?auto_175540 ?auto_175548 ) ) ( not ( = ?auto_175540 ?auto_175547 ) ) ( not ( = ?auto_175540 ?auto_175546 ) ) ( not ( = ?auto_175541 ?auto_175548 ) ) ( not ( = ?auto_175541 ?auto_175547 ) ) ( not ( = ?auto_175541 ?auto_175546 ) ) ( not ( = ?auto_175542 ?auto_175548 ) ) ( not ( = ?auto_175542 ?auto_175547 ) ) ( not ( = ?auto_175542 ?auto_175546 ) ) ( not ( = ?auto_175545 ?auto_175548 ) ) ( not ( = ?auto_175545 ?auto_175547 ) ) ( not ( = ?auto_175545 ?auto_175546 ) ) ( not ( = ?auto_175544 ?auto_175548 ) ) ( not ( = ?auto_175544 ?auto_175547 ) ) ( not ( = ?auto_175544 ?auto_175546 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175547 ?auto_175546 ?auto_175548 ?auto_175543 )
      ( MAKE-3PILE ?auto_175540 ?auto_175541 ?auto_175542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175549 - BLOCK
      ?auto_175550 - BLOCK
      ?auto_175551 - BLOCK
    )
    :vars
    (
      ?auto_175556 - BLOCK
      ?auto_175557 - BLOCK
      ?auto_175555 - BLOCK
      ?auto_175553 - BLOCK
      ?auto_175554 - BLOCK
      ?auto_175552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175556 ?auto_175551 ) ( ON-TABLE ?auto_175549 ) ( ON ?auto_175550 ?auto_175549 ) ( ON ?auto_175551 ?auto_175550 ) ( not ( = ?auto_175549 ?auto_175550 ) ) ( not ( = ?auto_175549 ?auto_175551 ) ) ( not ( = ?auto_175549 ?auto_175556 ) ) ( not ( = ?auto_175550 ?auto_175551 ) ) ( not ( = ?auto_175550 ?auto_175556 ) ) ( not ( = ?auto_175551 ?auto_175556 ) ) ( not ( = ?auto_175549 ?auto_175557 ) ) ( not ( = ?auto_175549 ?auto_175555 ) ) ( not ( = ?auto_175550 ?auto_175557 ) ) ( not ( = ?auto_175550 ?auto_175555 ) ) ( not ( = ?auto_175551 ?auto_175557 ) ) ( not ( = ?auto_175551 ?auto_175555 ) ) ( not ( = ?auto_175556 ?auto_175557 ) ) ( not ( = ?auto_175556 ?auto_175555 ) ) ( not ( = ?auto_175557 ?auto_175555 ) ) ( ON ?auto_175557 ?auto_175556 ) ( CLEAR ?auto_175553 ) ( ON-TABLE ?auto_175554 ) ( ON ?auto_175552 ?auto_175554 ) ( ON ?auto_175553 ?auto_175552 ) ( not ( = ?auto_175554 ?auto_175552 ) ) ( not ( = ?auto_175554 ?auto_175553 ) ) ( not ( = ?auto_175554 ?auto_175555 ) ) ( not ( = ?auto_175552 ?auto_175553 ) ) ( not ( = ?auto_175552 ?auto_175555 ) ) ( not ( = ?auto_175553 ?auto_175555 ) ) ( not ( = ?auto_175549 ?auto_175553 ) ) ( not ( = ?auto_175549 ?auto_175554 ) ) ( not ( = ?auto_175549 ?auto_175552 ) ) ( not ( = ?auto_175550 ?auto_175553 ) ) ( not ( = ?auto_175550 ?auto_175554 ) ) ( not ( = ?auto_175550 ?auto_175552 ) ) ( not ( = ?auto_175551 ?auto_175553 ) ) ( not ( = ?auto_175551 ?auto_175554 ) ) ( not ( = ?auto_175551 ?auto_175552 ) ) ( not ( = ?auto_175556 ?auto_175553 ) ) ( not ( = ?auto_175556 ?auto_175554 ) ) ( not ( = ?auto_175556 ?auto_175552 ) ) ( not ( = ?auto_175557 ?auto_175553 ) ) ( not ( = ?auto_175557 ?auto_175554 ) ) ( not ( = ?auto_175557 ?auto_175552 ) ) ( ON ?auto_175555 ?auto_175557 ) ( CLEAR ?auto_175555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175549 ?auto_175550 ?auto_175551 ?auto_175556 ?auto_175557 )
      ( MAKE-3PILE ?auto_175549 ?auto_175550 ?auto_175551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175558 - BLOCK
      ?auto_175559 - BLOCK
      ?auto_175560 - BLOCK
    )
    :vars
    (
      ?auto_175562 - BLOCK
      ?auto_175565 - BLOCK
      ?auto_175564 - BLOCK
      ?auto_175561 - BLOCK
      ?auto_175566 - BLOCK
      ?auto_175563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175562 ?auto_175560 ) ( ON-TABLE ?auto_175558 ) ( ON ?auto_175559 ?auto_175558 ) ( ON ?auto_175560 ?auto_175559 ) ( not ( = ?auto_175558 ?auto_175559 ) ) ( not ( = ?auto_175558 ?auto_175560 ) ) ( not ( = ?auto_175558 ?auto_175562 ) ) ( not ( = ?auto_175559 ?auto_175560 ) ) ( not ( = ?auto_175559 ?auto_175562 ) ) ( not ( = ?auto_175560 ?auto_175562 ) ) ( not ( = ?auto_175558 ?auto_175565 ) ) ( not ( = ?auto_175558 ?auto_175564 ) ) ( not ( = ?auto_175559 ?auto_175565 ) ) ( not ( = ?auto_175559 ?auto_175564 ) ) ( not ( = ?auto_175560 ?auto_175565 ) ) ( not ( = ?auto_175560 ?auto_175564 ) ) ( not ( = ?auto_175562 ?auto_175565 ) ) ( not ( = ?auto_175562 ?auto_175564 ) ) ( not ( = ?auto_175565 ?auto_175564 ) ) ( ON ?auto_175565 ?auto_175562 ) ( ON-TABLE ?auto_175561 ) ( ON ?auto_175566 ?auto_175561 ) ( not ( = ?auto_175561 ?auto_175566 ) ) ( not ( = ?auto_175561 ?auto_175563 ) ) ( not ( = ?auto_175561 ?auto_175564 ) ) ( not ( = ?auto_175566 ?auto_175563 ) ) ( not ( = ?auto_175566 ?auto_175564 ) ) ( not ( = ?auto_175563 ?auto_175564 ) ) ( not ( = ?auto_175558 ?auto_175563 ) ) ( not ( = ?auto_175558 ?auto_175561 ) ) ( not ( = ?auto_175558 ?auto_175566 ) ) ( not ( = ?auto_175559 ?auto_175563 ) ) ( not ( = ?auto_175559 ?auto_175561 ) ) ( not ( = ?auto_175559 ?auto_175566 ) ) ( not ( = ?auto_175560 ?auto_175563 ) ) ( not ( = ?auto_175560 ?auto_175561 ) ) ( not ( = ?auto_175560 ?auto_175566 ) ) ( not ( = ?auto_175562 ?auto_175563 ) ) ( not ( = ?auto_175562 ?auto_175561 ) ) ( not ( = ?auto_175562 ?auto_175566 ) ) ( not ( = ?auto_175565 ?auto_175563 ) ) ( not ( = ?auto_175565 ?auto_175561 ) ) ( not ( = ?auto_175565 ?auto_175566 ) ) ( ON ?auto_175564 ?auto_175565 ) ( CLEAR ?auto_175564 ) ( HOLDING ?auto_175563 ) ( CLEAR ?auto_175566 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175561 ?auto_175566 ?auto_175563 )
      ( MAKE-3PILE ?auto_175558 ?auto_175559 ?auto_175560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175567 - BLOCK
      ?auto_175568 - BLOCK
      ?auto_175569 - BLOCK
    )
    :vars
    (
      ?auto_175570 - BLOCK
      ?auto_175572 - BLOCK
      ?auto_175574 - BLOCK
      ?auto_175571 - BLOCK
      ?auto_175575 - BLOCK
      ?auto_175573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175570 ?auto_175569 ) ( ON-TABLE ?auto_175567 ) ( ON ?auto_175568 ?auto_175567 ) ( ON ?auto_175569 ?auto_175568 ) ( not ( = ?auto_175567 ?auto_175568 ) ) ( not ( = ?auto_175567 ?auto_175569 ) ) ( not ( = ?auto_175567 ?auto_175570 ) ) ( not ( = ?auto_175568 ?auto_175569 ) ) ( not ( = ?auto_175568 ?auto_175570 ) ) ( not ( = ?auto_175569 ?auto_175570 ) ) ( not ( = ?auto_175567 ?auto_175572 ) ) ( not ( = ?auto_175567 ?auto_175574 ) ) ( not ( = ?auto_175568 ?auto_175572 ) ) ( not ( = ?auto_175568 ?auto_175574 ) ) ( not ( = ?auto_175569 ?auto_175572 ) ) ( not ( = ?auto_175569 ?auto_175574 ) ) ( not ( = ?auto_175570 ?auto_175572 ) ) ( not ( = ?auto_175570 ?auto_175574 ) ) ( not ( = ?auto_175572 ?auto_175574 ) ) ( ON ?auto_175572 ?auto_175570 ) ( ON-TABLE ?auto_175571 ) ( ON ?auto_175575 ?auto_175571 ) ( not ( = ?auto_175571 ?auto_175575 ) ) ( not ( = ?auto_175571 ?auto_175573 ) ) ( not ( = ?auto_175571 ?auto_175574 ) ) ( not ( = ?auto_175575 ?auto_175573 ) ) ( not ( = ?auto_175575 ?auto_175574 ) ) ( not ( = ?auto_175573 ?auto_175574 ) ) ( not ( = ?auto_175567 ?auto_175573 ) ) ( not ( = ?auto_175567 ?auto_175571 ) ) ( not ( = ?auto_175567 ?auto_175575 ) ) ( not ( = ?auto_175568 ?auto_175573 ) ) ( not ( = ?auto_175568 ?auto_175571 ) ) ( not ( = ?auto_175568 ?auto_175575 ) ) ( not ( = ?auto_175569 ?auto_175573 ) ) ( not ( = ?auto_175569 ?auto_175571 ) ) ( not ( = ?auto_175569 ?auto_175575 ) ) ( not ( = ?auto_175570 ?auto_175573 ) ) ( not ( = ?auto_175570 ?auto_175571 ) ) ( not ( = ?auto_175570 ?auto_175575 ) ) ( not ( = ?auto_175572 ?auto_175573 ) ) ( not ( = ?auto_175572 ?auto_175571 ) ) ( not ( = ?auto_175572 ?auto_175575 ) ) ( ON ?auto_175574 ?auto_175572 ) ( CLEAR ?auto_175575 ) ( ON ?auto_175573 ?auto_175574 ) ( CLEAR ?auto_175573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175567 ?auto_175568 ?auto_175569 ?auto_175570 ?auto_175572 ?auto_175574 )
      ( MAKE-3PILE ?auto_175567 ?auto_175568 ?auto_175569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175576 - BLOCK
      ?auto_175577 - BLOCK
      ?auto_175578 - BLOCK
    )
    :vars
    (
      ?auto_175582 - BLOCK
      ?auto_175583 - BLOCK
      ?auto_175584 - BLOCK
      ?auto_175581 - BLOCK
      ?auto_175580 - BLOCK
      ?auto_175579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175582 ?auto_175578 ) ( ON-TABLE ?auto_175576 ) ( ON ?auto_175577 ?auto_175576 ) ( ON ?auto_175578 ?auto_175577 ) ( not ( = ?auto_175576 ?auto_175577 ) ) ( not ( = ?auto_175576 ?auto_175578 ) ) ( not ( = ?auto_175576 ?auto_175582 ) ) ( not ( = ?auto_175577 ?auto_175578 ) ) ( not ( = ?auto_175577 ?auto_175582 ) ) ( not ( = ?auto_175578 ?auto_175582 ) ) ( not ( = ?auto_175576 ?auto_175583 ) ) ( not ( = ?auto_175576 ?auto_175584 ) ) ( not ( = ?auto_175577 ?auto_175583 ) ) ( not ( = ?auto_175577 ?auto_175584 ) ) ( not ( = ?auto_175578 ?auto_175583 ) ) ( not ( = ?auto_175578 ?auto_175584 ) ) ( not ( = ?auto_175582 ?auto_175583 ) ) ( not ( = ?auto_175582 ?auto_175584 ) ) ( not ( = ?auto_175583 ?auto_175584 ) ) ( ON ?auto_175583 ?auto_175582 ) ( ON-TABLE ?auto_175581 ) ( not ( = ?auto_175581 ?auto_175580 ) ) ( not ( = ?auto_175581 ?auto_175579 ) ) ( not ( = ?auto_175581 ?auto_175584 ) ) ( not ( = ?auto_175580 ?auto_175579 ) ) ( not ( = ?auto_175580 ?auto_175584 ) ) ( not ( = ?auto_175579 ?auto_175584 ) ) ( not ( = ?auto_175576 ?auto_175579 ) ) ( not ( = ?auto_175576 ?auto_175581 ) ) ( not ( = ?auto_175576 ?auto_175580 ) ) ( not ( = ?auto_175577 ?auto_175579 ) ) ( not ( = ?auto_175577 ?auto_175581 ) ) ( not ( = ?auto_175577 ?auto_175580 ) ) ( not ( = ?auto_175578 ?auto_175579 ) ) ( not ( = ?auto_175578 ?auto_175581 ) ) ( not ( = ?auto_175578 ?auto_175580 ) ) ( not ( = ?auto_175582 ?auto_175579 ) ) ( not ( = ?auto_175582 ?auto_175581 ) ) ( not ( = ?auto_175582 ?auto_175580 ) ) ( not ( = ?auto_175583 ?auto_175579 ) ) ( not ( = ?auto_175583 ?auto_175581 ) ) ( not ( = ?auto_175583 ?auto_175580 ) ) ( ON ?auto_175584 ?auto_175583 ) ( ON ?auto_175579 ?auto_175584 ) ( CLEAR ?auto_175579 ) ( HOLDING ?auto_175580 ) ( CLEAR ?auto_175581 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175581 ?auto_175580 )
      ( MAKE-3PILE ?auto_175576 ?auto_175577 ?auto_175578 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175585 - BLOCK
      ?auto_175586 - BLOCK
      ?auto_175587 - BLOCK
    )
    :vars
    (
      ?auto_175592 - BLOCK
      ?auto_175589 - BLOCK
      ?auto_175593 - BLOCK
      ?auto_175590 - BLOCK
      ?auto_175588 - BLOCK
      ?auto_175591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175592 ?auto_175587 ) ( ON-TABLE ?auto_175585 ) ( ON ?auto_175586 ?auto_175585 ) ( ON ?auto_175587 ?auto_175586 ) ( not ( = ?auto_175585 ?auto_175586 ) ) ( not ( = ?auto_175585 ?auto_175587 ) ) ( not ( = ?auto_175585 ?auto_175592 ) ) ( not ( = ?auto_175586 ?auto_175587 ) ) ( not ( = ?auto_175586 ?auto_175592 ) ) ( not ( = ?auto_175587 ?auto_175592 ) ) ( not ( = ?auto_175585 ?auto_175589 ) ) ( not ( = ?auto_175585 ?auto_175593 ) ) ( not ( = ?auto_175586 ?auto_175589 ) ) ( not ( = ?auto_175586 ?auto_175593 ) ) ( not ( = ?auto_175587 ?auto_175589 ) ) ( not ( = ?auto_175587 ?auto_175593 ) ) ( not ( = ?auto_175592 ?auto_175589 ) ) ( not ( = ?auto_175592 ?auto_175593 ) ) ( not ( = ?auto_175589 ?auto_175593 ) ) ( ON ?auto_175589 ?auto_175592 ) ( ON-TABLE ?auto_175590 ) ( not ( = ?auto_175590 ?auto_175588 ) ) ( not ( = ?auto_175590 ?auto_175591 ) ) ( not ( = ?auto_175590 ?auto_175593 ) ) ( not ( = ?auto_175588 ?auto_175591 ) ) ( not ( = ?auto_175588 ?auto_175593 ) ) ( not ( = ?auto_175591 ?auto_175593 ) ) ( not ( = ?auto_175585 ?auto_175591 ) ) ( not ( = ?auto_175585 ?auto_175590 ) ) ( not ( = ?auto_175585 ?auto_175588 ) ) ( not ( = ?auto_175586 ?auto_175591 ) ) ( not ( = ?auto_175586 ?auto_175590 ) ) ( not ( = ?auto_175586 ?auto_175588 ) ) ( not ( = ?auto_175587 ?auto_175591 ) ) ( not ( = ?auto_175587 ?auto_175590 ) ) ( not ( = ?auto_175587 ?auto_175588 ) ) ( not ( = ?auto_175592 ?auto_175591 ) ) ( not ( = ?auto_175592 ?auto_175590 ) ) ( not ( = ?auto_175592 ?auto_175588 ) ) ( not ( = ?auto_175589 ?auto_175591 ) ) ( not ( = ?auto_175589 ?auto_175590 ) ) ( not ( = ?auto_175589 ?auto_175588 ) ) ( ON ?auto_175593 ?auto_175589 ) ( ON ?auto_175591 ?auto_175593 ) ( CLEAR ?auto_175590 ) ( ON ?auto_175588 ?auto_175591 ) ( CLEAR ?auto_175588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175585 ?auto_175586 ?auto_175587 ?auto_175592 ?auto_175589 ?auto_175593 ?auto_175591 )
      ( MAKE-3PILE ?auto_175585 ?auto_175586 ?auto_175587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175594 - BLOCK
      ?auto_175595 - BLOCK
      ?auto_175596 - BLOCK
    )
    :vars
    (
      ?auto_175598 - BLOCK
      ?auto_175602 - BLOCK
      ?auto_175599 - BLOCK
      ?auto_175597 - BLOCK
      ?auto_175601 - BLOCK
      ?auto_175600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175598 ?auto_175596 ) ( ON-TABLE ?auto_175594 ) ( ON ?auto_175595 ?auto_175594 ) ( ON ?auto_175596 ?auto_175595 ) ( not ( = ?auto_175594 ?auto_175595 ) ) ( not ( = ?auto_175594 ?auto_175596 ) ) ( not ( = ?auto_175594 ?auto_175598 ) ) ( not ( = ?auto_175595 ?auto_175596 ) ) ( not ( = ?auto_175595 ?auto_175598 ) ) ( not ( = ?auto_175596 ?auto_175598 ) ) ( not ( = ?auto_175594 ?auto_175602 ) ) ( not ( = ?auto_175594 ?auto_175599 ) ) ( not ( = ?auto_175595 ?auto_175602 ) ) ( not ( = ?auto_175595 ?auto_175599 ) ) ( not ( = ?auto_175596 ?auto_175602 ) ) ( not ( = ?auto_175596 ?auto_175599 ) ) ( not ( = ?auto_175598 ?auto_175602 ) ) ( not ( = ?auto_175598 ?auto_175599 ) ) ( not ( = ?auto_175602 ?auto_175599 ) ) ( ON ?auto_175602 ?auto_175598 ) ( not ( = ?auto_175597 ?auto_175601 ) ) ( not ( = ?auto_175597 ?auto_175600 ) ) ( not ( = ?auto_175597 ?auto_175599 ) ) ( not ( = ?auto_175601 ?auto_175600 ) ) ( not ( = ?auto_175601 ?auto_175599 ) ) ( not ( = ?auto_175600 ?auto_175599 ) ) ( not ( = ?auto_175594 ?auto_175600 ) ) ( not ( = ?auto_175594 ?auto_175597 ) ) ( not ( = ?auto_175594 ?auto_175601 ) ) ( not ( = ?auto_175595 ?auto_175600 ) ) ( not ( = ?auto_175595 ?auto_175597 ) ) ( not ( = ?auto_175595 ?auto_175601 ) ) ( not ( = ?auto_175596 ?auto_175600 ) ) ( not ( = ?auto_175596 ?auto_175597 ) ) ( not ( = ?auto_175596 ?auto_175601 ) ) ( not ( = ?auto_175598 ?auto_175600 ) ) ( not ( = ?auto_175598 ?auto_175597 ) ) ( not ( = ?auto_175598 ?auto_175601 ) ) ( not ( = ?auto_175602 ?auto_175600 ) ) ( not ( = ?auto_175602 ?auto_175597 ) ) ( not ( = ?auto_175602 ?auto_175601 ) ) ( ON ?auto_175599 ?auto_175602 ) ( ON ?auto_175600 ?auto_175599 ) ( ON ?auto_175601 ?auto_175600 ) ( CLEAR ?auto_175601 ) ( HOLDING ?auto_175597 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175597 )
      ( MAKE-3PILE ?auto_175594 ?auto_175595 ?auto_175596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175603 - BLOCK
      ?auto_175604 - BLOCK
      ?auto_175605 - BLOCK
    )
    :vars
    (
      ?auto_175606 - BLOCK
      ?auto_175611 - BLOCK
      ?auto_175607 - BLOCK
      ?auto_175608 - BLOCK
      ?auto_175610 - BLOCK
      ?auto_175609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175606 ?auto_175605 ) ( ON-TABLE ?auto_175603 ) ( ON ?auto_175604 ?auto_175603 ) ( ON ?auto_175605 ?auto_175604 ) ( not ( = ?auto_175603 ?auto_175604 ) ) ( not ( = ?auto_175603 ?auto_175605 ) ) ( not ( = ?auto_175603 ?auto_175606 ) ) ( not ( = ?auto_175604 ?auto_175605 ) ) ( not ( = ?auto_175604 ?auto_175606 ) ) ( not ( = ?auto_175605 ?auto_175606 ) ) ( not ( = ?auto_175603 ?auto_175611 ) ) ( not ( = ?auto_175603 ?auto_175607 ) ) ( not ( = ?auto_175604 ?auto_175611 ) ) ( not ( = ?auto_175604 ?auto_175607 ) ) ( not ( = ?auto_175605 ?auto_175611 ) ) ( not ( = ?auto_175605 ?auto_175607 ) ) ( not ( = ?auto_175606 ?auto_175611 ) ) ( not ( = ?auto_175606 ?auto_175607 ) ) ( not ( = ?auto_175611 ?auto_175607 ) ) ( ON ?auto_175611 ?auto_175606 ) ( not ( = ?auto_175608 ?auto_175610 ) ) ( not ( = ?auto_175608 ?auto_175609 ) ) ( not ( = ?auto_175608 ?auto_175607 ) ) ( not ( = ?auto_175610 ?auto_175609 ) ) ( not ( = ?auto_175610 ?auto_175607 ) ) ( not ( = ?auto_175609 ?auto_175607 ) ) ( not ( = ?auto_175603 ?auto_175609 ) ) ( not ( = ?auto_175603 ?auto_175608 ) ) ( not ( = ?auto_175603 ?auto_175610 ) ) ( not ( = ?auto_175604 ?auto_175609 ) ) ( not ( = ?auto_175604 ?auto_175608 ) ) ( not ( = ?auto_175604 ?auto_175610 ) ) ( not ( = ?auto_175605 ?auto_175609 ) ) ( not ( = ?auto_175605 ?auto_175608 ) ) ( not ( = ?auto_175605 ?auto_175610 ) ) ( not ( = ?auto_175606 ?auto_175609 ) ) ( not ( = ?auto_175606 ?auto_175608 ) ) ( not ( = ?auto_175606 ?auto_175610 ) ) ( not ( = ?auto_175611 ?auto_175609 ) ) ( not ( = ?auto_175611 ?auto_175608 ) ) ( not ( = ?auto_175611 ?auto_175610 ) ) ( ON ?auto_175607 ?auto_175611 ) ( ON ?auto_175609 ?auto_175607 ) ( ON ?auto_175610 ?auto_175609 ) ( ON ?auto_175608 ?auto_175610 ) ( CLEAR ?auto_175608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175603 ?auto_175604 ?auto_175605 ?auto_175606 ?auto_175611 ?auto_175607 ?auto_175609 ?auto_175610 )
      ( MAKE-3PILE ?auto_175603 ?auto_175604 ?auto_175605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175618 - BLOCK
      ?auto_175619 - BLOCK
      ?auto_175620 - BLOCK
      ?auto_175621 - BLOCK
      ?auto_175622 - BLOCK
      ?auto_175623 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_175623 ) ( CLEAR ?auto_175622 ) ( ON-TABLE ?auto_175618 ) ( ON ?auto_175619 ?auto_175618 ) ( ON ?auto_175620 ?auto_175619 ) ( ON ?auto_175621 ?auto_175620 ) ( ON ?auto_175622 ?auto_175621 ) ( not ( = ?auto_175618 ?auto_175619 ) ) ( not ( = ?auto_175618 ?auto_175620 ) ) ( not ( = ?auto_175618 ?auto_175621 ) ) ( not ( = ?auto_175618 ?auto_175622 ) ) ( not ( = ?auto_175618 ?auto_175623 ) ) ( not ( = ?auto_175619 ?auto_175620 ) ) ( not ( = ?auto_175619 ?auto_175621 ) ) ( not ( = ?auto_175619 ?auto_175622 ) ) ( not ( = ?auto_175619 ?auto_175623 ) ) ( not ( = ?auto_175620 ?auto_175621 ) ) ( not ( = ?auto_175620 ?auto_175622 ) ) ( not ( = ?auto_175620 ?auto_175623 ) ) ( not ( = ?auto_175621 ?auto_175622 ) ) ( not ( = ?auto_175621 ?auto_175623 ) ) ( not ( = ?auto_175622 ?auto_175623 ) ) )
    :subtasks
    ( ( !STACK ?auto_175623 ?auto_175622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175624 - BLOCK
      ?auto_175625 - BLOCK
      ?auto_175626 - BLOCK
      ?auto_175627 - BLOCK
      ?auto_175628 - BLOCK
      ?auto_175629 - BLOCK
    )
    :vars
    (
      ?auto_175630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175628 ) ( ON-TABLE ?auto_175624 ) ( ON ?auto_175625 ?auto_175624 ) ( ON ?auto_175626 ?auto_175625 ) ( ON ?auto_175627 ?auto_175626 ) ( ON ?auto_175628 ?auto_175627 ) ( not ( = ?auto_175624 ?auto_175625 ) ) ( not ( = ?auto_175624 ?auto_175626 ) ) ( not ( = ?auto_175624 ?auto_175627 ) ) ( not ( = ?auto_175624 ?auto_175628 ) ) ( not ( = ?auto_175624 ?auto_175629 ) ) ( not ( = ?auto_175625 ?auto_175626 ) ) ( not ( = ?auto_175625 ?auto_175627 ) ) ( not ( = ?auto_175625 ?auto_175628 ) ) ( not ( = ?auto_175625 ?auto_175629 ) ) ( not ( = ?auto_175626 ?auto_175627 ) ) ( not ( = ?auto_175626 ?auto_175628 ) ) ( not ( = ?auto_175626 ?auto_175629 ) ) ( not ( = ?auto_175627 ?auto_175628 ) ) ( not ( = ?auto_175627 ?auto_175629 ) ) ( not ( = ?auto_175628 ?auto_175629 ) ) ( ON ?auto_175629 ?auto_175630 ) ( CLEAR ?auto_175629 ) ( HAND-EMPTY ) ( not ( = ?auto_175624 ?auto_175630 ) ) ( not ( = ?auto_175625 ?auto_175630 ) ) ( not ( = ?auto_175626 ?auto_175630 ) ) ( not ( = ?auto_175627 ?auto_175630 ) ) ( not ( = ?auto_175628 ?auto_175630 ) ) ( not ( = ?auto_175629 ?auto_175630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175629 ?auto_175630 )
      ( MAKE-6PILE ?auto_175624 ?auto_175625 ?auto_175626 ?auto_175627 ?auto_175628 ?auto_175629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175631 - BLOCK
      ?auto_175632 - BLOCK
      ?auto_175633 - BLOCK
      ?auto_175634 - BLOCK
      ?auto_175635 - BLOCK
      ?auto_175636 - BLOCK
    )
    :vars
    (
      ?auto_175637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175631 ) ( ON ?auto_175632 ?auto_175631 ) ( ON ?auto_175633 ?auto_175632 ) ( ON ?auto_175634 ?auto_175633 ) ( not ( = ?auto_175631 ?auto_175632 ) ) ( not ( = ?auto_175631 ?auto_175633 ) ) ( not ( = ?auto_175631 ?auto_175634 ) ) ( not ( = ?auto_175631 ?auto_175635 ) ) ( not ( = ?auto_175631 ?auto_175636 ) ) ( not ( = ?auto_175632 ?auto_175633 ) ) ( not ( = ?auto_175632 ?auto_175634 ) ) ( not ( = ?auto_175632 ?auto_175635 ) ) ( not ( = ?auto_175632 ?auto_175636 ) ) ( not ( = ?auto_175633 ?auto_175634 ) ) ( not ( = ?auto_175633 ?auto_175635 ) ) ( not ( = ?auto_175633 ?auto_175636 ) ) ( not ( = ?auto_175634 ?auto_175635 ) ) ( not ( = ?auto_175634 ?auto_175636 ) ) ( not ( = ?auto_175635 ?auto_175636 ) ) ( ON ?auto_175636 ?auto_175637 ) ( CLEAR ?auto_175636 ) ( not ( = ?auto_175631 ?auto_175637 ) ) ( not ( = ?auto_175632 ?auto_175637 ) ) ( not ( = ?auto_175633 ?auto_175637 ) ) ( not ( = ?auto_175634 ?auto_175637 ) ) ( not ( = ?auto_175635 ?auto_175637 ) ) ( not ( = ?auto_175636 ?auto_175637 ) ) ( HOLDING ?auto_175635 ) ( CLEAR ?auto_175634 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175631 ?auto_175632 ?auto_175633 ?auto_175634 ?auto_175635 )
      ( MAKE-6PILE ?auto_175631 ?auto_175632 ?auto_175633 ?auto_175634 ?auto_175635 ?auto_175636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175638 - BLOCK
      ?auto_175639 - BLOCK
      ?auto_175640 - BLOCK
      ?auto_175641 - BLOCK
      ?auto_175642 - BLOCK
      ?auto_175643 - BLOCK
    )
    :vars
    (
      ?auto_175644 - BLOCK
      ?auto_175646 - BLOCK
      ?auto_175645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175638 ) ( ON ?auto_175639 ?auto_175638 ) ( ON ?auto_175640 ?auto_175639 ) ( ON ?auto_175641 ?auto_175640 ) ( not ( = ?auto_175638 ?auto_175639 ) ) ( not ( = ?auto_175638 ?auto_175640 ) ) ( not ( = ?auto_175638 ?auto_175641 ) ) ( not ( = ?auto_175638 ?auto_175642 ) ) ( not ( = ?auto_175638 ?auto_175643 ) ) ( not ( = ?auto_175639 ?auto_175640 ) ) ( not ( = ?auto_175639 ?auto_175641 ) ) ( not ( = ?auto_175639 ?auto_175642 ) ) ( not ( = ?auto_175639 ?auto_175643 ) ) ( not ( = ?auto_175640 ?auto_175641 ) ) ( not ( = ?auto_175640 ?auto_175642 ) ) ( not ( = ?auto_175640 ?auto_175643 ) ) ( not ( = ?auto_175641 ?auto_175642 ) ) ( not ( = ?auto_175641 ?auto_175643 ) ) ( not ( = ?auto_175642 ?auto_175643 ) ) ( ON ?auto_175643 ?auto_175644 ) ( not ( = ?auto_175638 ?auto_175644 ) ) ( not ( = ?auto_175639 ?auto_175644 ) ) ( not ( = ?auto_175640 ?auto_175644 ) ) ( not ( = ?auto_175641 ?auto_175644 ) ) ( not ( = ?auto_175642 ?auto_175644 ) ) ( not ( = ?auto_175643 ?auto_175644 ) ) ( CLEAR ?auto_175641 ) ( ON ?auto_175642 ?auto_175643 ) ( CLEAR ?auto_175642 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175646 ) ( ON ?auto_175645 ?auto_175646 ) ( ON ?auto_175644 ?auto_175645 ) ( not ( = ?auto_175646 ?auto_175645 ) ) ( not ( = ?auto_175646 ?auto_175644 ) ) ( not ( = ?auto_175646 ?auto_175643 ) ) ( not ( = ?auto_175646 ?auto_175642 ) ) ( not ( = ?auto_175645 ?auto_175644 ) ) ( not ( = ?auto_175645 ?auto_175643 ) ) ( not ( = ?auto_175645 ?auto_175642 ) ) ( not ( = ?auto_175638 ?auto_175646 ) ) ( not ( = ?auto_175638 ?auto_175645 ) ) ( not ( = ?auto_175639 ?auto_175646 ) ) ( not ( = ?auto_175639 ?auto_175645 ) ) ( not ( = ?auto_175640 ?auto_175646 ) ) ( not ( = ?auto_175640 ?auto_175645 ) ) ( not ( = ?auto_175641 ?auto_175646 ) ) ( not ( = ?auto_175641 ?auto_175645 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175646 ?auto_175645 ?auto_175644 ?auto_175643 )
      ( MAKE-6PILE ?auto_175638 ?auto_175639 ?auto_175640 ?auto_175641 ?auto_175642 ?auto_175643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175647 - BLOCK
      ?auto_175648 - BLOCK
      ?auto_175649 - BLOCK
      ?auto_175650 - BLOCK
      ?auto_175651 - BLOCK
      ?auto_175652 - BLOCK
    )
    :vars
    (
      ?auto_175654 - BLOCK
      ?auto_175653 - BLOCK
      ?auto_175655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175647 ) ( ON ?auto_175648 ?auto_175647 ) ( ON ?auto_175649 ?auto_175648 ) ( not ( = ?auto_175647 ?auto_175648 ) ) ( not ( = ?auto_175647 ?auto_175649 ) ) ( not ( = ?auto_175647 ?auto_175650 ) ) ( not ( = ?auto_175647 ?auto_175651 ) ) ( not ( = ?auto_175647 ?auto_175652 ) ) ( not ( = ?auto_175648 ?auto_175649 ) ) ( not ( = ?auto_175648 ?auto_175650 ) ) ( not ( = ?auto_175648 ?auto_175651 ) ) ( not ( = ?auto_175648 ?auto_175652 ) ) ( not ( = ?auto_175649 ?auto_175650 ) ) ( not ( = ?auto_175649 ?auto_175651 ) ) ( not ( = ?auto_175649 ?auto_175652 ) ) ( not ( = ?auto_175650 ?auto_175651 ) ) ( not ( = ?auto_175650 ?auto_175652 ) ) ( not ( = ?auto_175651 ?auto_175652 ) ) ( ON ?auto_175652 ?auto_175654 ) ( not ( = ?auto_175647 ?auto_175654 ) ) ( not ( = ?auto_175648 ?auto_175654 ) ) ( not ( = ?auto_175649 ?auto_175654 ) ) ( not ( = ?auto_175650 ?auto_175654 ) ) ( not ( = ?auto_175651 ?auto_175654 ) ) ( not ( = ?auto_175652 ?auto_175654 ) ) ( ON ?auto_175651 ?auto_175652 ) ( CLEAR ?auto_175651 ) ( ON-TABLE ?auto_175653 ) ( ON ?auto_175655 ?auto_175653 ) ( ON ?auto_175654 ?auto_175655 ) ( not ( = ?auto_175653 ?auto_175655 ) ) ( not ( = ?auto_175653 ?auto_175654 ) ) ( not ( = ?auto_175653 ?auto_175652 ) ) ( not ( = ?auto_175653 ?auto_175651 ) ) ( not ( = ?auto_175655 ?auto_175654 ) ) ( not ( = ?auto_175655 ?auto_175652 ) ) ( not ( = ?auto_175655 ?auto_175651 ) ) ( not ( = ?auto_175647 ?auto_175653 ) ) ( not ( = ?auto_175647 ?auto_175655 ) ) ( not ( = ?auto_175648 ?auto_175653 ) ) ( not ( = ?auto_175648 ?auto_175655 ) ) ( not ( = ?auto_175649 ?auto_175653 ) ) ( not ( = ?auto_175649 ?auto_175655 ) ) ( not ( = ?auto_175650 ?auto_175653 ) ) ( not ( = ?auto_175650 ?auto_175655 ) ) ( HOLDING ?auto_175650 ) ( CLEAR ?auto_175649 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175647 ?auto_175648 ?auto_175649 ?auto_175650 )
      ( MAKE-6PILE ?auto_175647 ?auto_175648 ?auto_175649 ?auto_175650 ?auto_175651 ?auto_175652 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175656 - BLOCK
      ?auto_175657 - BLOCK
      ?auto_175658 - BLOCK
      ?auto_175659 - BLOCK
      ?auto_175660 - BLOCK
      ?auto_175661 - BLOCK
    )
    :vars
    (
      ?auto_175664 - BLOCK
      ?auto_175663 - BLOCK
      ?auto_175662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175656 ) ( ON ?auto_175657 ?auto_175656 ) ( ON ?auto_175658 ?auto_175657 ) ( not ( = ?auto_175656 ?auto_175657 ) ) ( not ( = ?auto_175656 ?auto_175658 ) ) ( not ( = ?auto_175656 ?auto_175659 ) ) ( not ( = ?auto_175656 ?auto_175660 ) ) ( not ( = ?auto_175656 ?auto_175661 ) ) ( not ( = ?auto_175657 ?auto_175658 ) ) ( not ( = ?auto_175657 ?auto_175659 ) ) ( not ( = ?auto_175657 ?auto_175660 ) ) ( not ( = ?auto_175657 ?auto_175661 ) ) ( not ( = ?auto_175658 ?auto_175659 ) ) ( not ( = ?auto_175658 ?auto_175660 ) ) ( not ( = ?auto_175658 ?auto_175661 ) ) ( not ( = ?auto_175659 ?auto_175660 ) ) ( not ( = ?auto_175659 ?auto_175661 ) ) ( not ( = ?auto_175660 ?auto_175661 ) ) ( ON ?auto_175661 ?auto_175664 ) ( not ( = ?auto_175656 ?auto_175664 ) ) ( not ( = ?auto_175657 ?auto_175664 ) ) ( not ( = ?auto_175658 ?auto_175664 ) ) ( not ( = ?auto_175659 ?auto_175664 ) ) ( not ( = ?auto_175660 ?auto_175664 ) ) ( not ( = ?auto_175661 ?auto_175664 ) ) ( ON ?auto_175660 ?auto_175661 ) ( ON-TABLE ?auto_175663 ) ( ON ?auto_175662 ?auto_175663 ) ( ON ?auto_175664 ?auto_175662 ) ( not ( = ?auto_175663 ?auto_175662 ) ) ( not ( = ?auto_175663 ?auto_175664 ) ) ( not ( = ?auto_175663 ?auto_175661 ) ) ( not ( = ?auto_175663 ?auto_175660 ) ) ( not ( = ?auto_175662 ?auto_175664 ) ) ( not ( = ?auto_175662 ?auto_175661 ) ) ( not ( = ?auto_175662 ?auto_175660 ) ) ( not ( = ?auto_175656 ?auto_175663 ) ) ( not ( = ?auto_175656 ?auto_175662 ) ) ( not ( = ?auto_175657 ?auto_175663 ) ) ( not ( = ?auto_175657 ?auto_175662 ) ) ( not ( = ?auto_175658 ?auto_175663 ) ) ( not ( = ?auto_175658 ?auto_175662 ) ) ( not ( = ?auto_175659 ?auto_175663 ) ) ( not ( = ?auto_175659 ?auto_175662 ) ) ( CLEAR ?auto_175658 ) ( ON ?auto_175659 ?auto_175660 ) ( CLEAR ?auto_175659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175663 ?auto_175662 ?auto_175664 ?auto_175661 ?auto_175660 )
      ( MAKE-6PILE ?auto_175656 ?auto_175657 ?auto_175658 ?auto_175659 ?auto_175660 ?auto_175661 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175665 - BLOCK
      ?auto_175666 - BLOCK
      ?auto_175667 - BLOCK
      ?auto_175668 - BLOCK
      ?auto_175669 - BLOCK
      ?auto_175670 - BLOCK
    )
    :vars
    (
      ?auto_175671 - BLOCK
      ?auto_175672 - BLOCK
      ?auto_175673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175665 ) ( ON ?auto_175666 ?auto_175665 ) ( not ( = ?auto_175665 ?auto_175666 ) ) ( not ( = ?auto_175665 ?auto_175667 ) ) ( not ( = ?auto_175665 ?auto_175668 ) ) ( not ( = ?auto_175665 ?auto_175669 ) ) ( not ( = ?auto_175665 ?auto_175670 ) ) ( not ( = ?auto_175666 ?auto_175667 ) ) ( not ( = ?auto_175666 ?auto_175668 ) ) ( not ( = ?auto_175666 ?auto_175669 ) ) ( not ( = ?auto_175666 ?auto_175670 ) ) ( not ( = ?auto_175667 ?auto_175668 ) ) ( not ( = ?auto_175667 ?auto_175669 ) ) ( not ( = ?auto_175667 ?auto_175670 ) ) ( not ( = ?auto_175668 ?auto_175669 ) ) ( not ( = ?auto_175668 ?auto_175670 ) ) ( not ( = ?auto_175669 ?auto_175670 ) ) ( ON ?auto_175670 ?auto_175671 ) ( not ( = ?auto_175665 ?auto_175671 ) ) ( not ( = ?auto_175666 ?auto_175671 ) ) ( not ( = ?auto_175667 ?auto_175671 ) ) ( not ( = ?auto_175668 ?auto_175671 ) ) ( not ( = ?auto_175669 ?auto_175671 ) ) ( not ( = ?auto_175670 ?auto_175671 ) ) ( ON ?auto_175669 ?auto_175670 ) ( ON-TABLE ?auto_175672 ) ( ON ?auto_175673 ?auto_175672 ) ( ON ?auto_175671 ?auto_175673 ) ( not ( = ?auto_175672 ?auto_175673 ) ) ( not ( = ?auto_175672 ?auto_175671 ) ) ( not ( = ?auto_175672 ?auto_175670 ) ) ( not ( = ?auto_175672 ?auto_175669 ) ) ( not ( = ?auto_175673 ?auto_175671 ) ) ( not ( = ?auto_175673 ?auto_175670 ) ) ( not ( = ?auto_175673 ?auto_175669 ) ) ( not ( = ?auto_175665 ?auto_175672 ) ) ( not ( = ?auto_175665 ?auto_175673 ) ) ( not ( = ?auto_175666 ?auto_175672 ) ) ( not ( = ?auto_175666 ?auto_175673 ) ) ( not ( = ?auto_175667 ?auto_175672 ) ) ( not ( = ?auto_175667 ?auto_175673 ) ) ( not ( = ?auto_175668 ?auto_175672 ) ) ( not ( = ?auto_175668 ?auto_175673 ) ) ( ON ?auto_175668 ?auto_175669 ) ( CLEAR ?auto_175668 ) ( HOLDING ?auto_175667 ) ( CLEAR ?auto_175666 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175665 ?auto_175666 ?auto_175667 )
      ( MAKE-6PILE ?auto_175665 ?auto_175666 ?auto_175667 ?auto_175668 ?auto_175669 ?auto_175670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175674 - BLOCK
      ?auto_175675 - BLOCK
      ?auto_175676 - BLOCK
      ?auto_175677 - BLOCK
      ?auto_175678 - BLOCK
      ?auto_175679 - BLOCK
    )
    :vars
    (
      ?auto_175681 - BLOCK
      ?auto_175682 - BLOCK
      ?auto_175680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175674 ) ( ON ?auto_175675 ?auto_175674 ) ( not ( = ?auto_175674 ?auto_175675 ) ) ( not ( = ?auto_175674 ?auto_175676 ) ) ( not ( = ?auto_175674 ?auto_175677 ) ) ( not ( = ?auto_175674 ?auto_175678 ) ) ( not ( = ?auto_175674 ?auto_175679 ) ) ( not ( = ?auto_175675 ?auto_175676 ) ) ( not ( = ?auto_175675 ?auto_175677 ) ) ( not ( = ?auto_175675 ?auto_175678 ) ) ( not ( = ?auto_175675 ?auto_175679 ) ) ( not ( = ?auto_175676 ?auto_175677 ) ) ( not ( = ?auto_175676 ?auto_175678 ) ) ( not ( = ?auto_175676 ?auto_175679 ) ) ( not ( = ?auto_175677 ?auto_175678 ) ) ( not ( = ?auto_175677 ?auto_175679 ) ) ( not ( = ?auto_175678 ?auto_175679 ) ) ( ON ?auto_175679 ?auto_175681 ) ( not ( = ?auto_175674 ?auto_175681 ) ) ( not ( = ?auto_175675 ?auto_175681 ) ) ( not ( = ?auto_175676 ?auto_175681 ) ) ( not ( = ?auto_175677 ?auto_175681 ) ) ( not ( = ?auto_175678 ?auto_175681 ) ) ( not ( = ?auto_175679 ?auto_175681 ) ) ( ON ?auto_175678 ?auto_175679 ) ( ON-TABLE ?auto_175682 ) ( ON ?auto_175680 ?auto_175682 ) ( ON ?auto_175681 ?auto_175680 ) ( not ( = ?auto_175682 ?auto_175680 ) ) ( not ( = ?auto_175682 ?auto_175681 ) ) ( not ( = ?auto_175682 ?auto_175679 ) ) ( not ( = ?auto_175682 ?auto_175678 ) ) ( not ( = ?auto_175680 ?auto_175681 ) ) ( not ( = ?auto_175680 ?auto_175679 ) ) ( not ( = ?auto_175680 ?auto_175678 ) ) ( not ( = ?auto_175674 ?auto_175682 ) ) ( not ( = ?auto_175674 ?auto_175680 ) ) ( not ( = ?auto_175675 ?auto_175682 ) ) ( not ( = ?auto_175675 ?auto_175680 ) ) ( not ( = ?auto_175676 ?auto_175682 ) ) ( not ( = ?auto_175676 ?auto_175680 ) ) ( not ( = ?auto_175677 ?auto_175682 ) ) ( not ( = ?auto_175677 ?auto_175680 ) ) ( ON ?auto_175677 ?auto_175678 ) ( CLEAR ?auto_175675 ) ( ON ?auto_175676 ?auto_175677 ) ( CLEAR ?auto_175676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175682 ?auto_175680 ?auto_175681 ?auto_175679 ?auto_175678 ?auto_175677 )
      ( MAKE-6PILE ?auto_175674 ?auto_175675 ?auto_175676 ?auto_175677 ?auto_175678 ?auto_175679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175683 - BLOCK
      ?auto_175684 - BLOCK
      ?auto_175685 - BLOCK
      ?auto_175686 - BLOCK
      ?auto_175687 - BLOCK
      ?auto_175688 - BLOCK
    )
    :vars
    (
      ?auto_175691 - BLOCK
      ?auto_175690 - BLOCK
      ?auto_175689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175683 ) ( not ( = ?auto_175683 ?auto_175684 ) ) ( not ( = ?auto_175683 ?auto_175685 ) ) ( not ( = ?auto_175683 ?auto_175686 ) ) ( not ( = ?auto_175683 ?auto_175687 ) ) ( not ( = ?auto_175683 ?auto_175688 ) ) ( not ( = ?auto_175684 ?auto_175685 ) ) ( not ( = ?auto_175684 ?auto_175686 ) ) ( not ( = ?auto_175684 ?auto_175687 ) ) ( not ( = ?auto_175684 ?auto_175688 ) ) ( not ( = ?auto_175685 ?auto_175686 ) ) ( not ( = ?auto_175685 ?auto_175687 ) ) ( not ( = ?auto_175685 ?auto_175688 ) ) ( not ( = ?auto_175686 ?auto_175687 ) ) ( not ( = ?auto_175686 ?auto_175688 ) ) ( not ( = ?auto_175687 ?auto_175688 ) ) ( ON ?auto_175688 ?auto_175691 ) ( not ( = ?auto_175683 ?auto_175691 ) ) ( not ( = ?auto_175684 ?auto_175691 ) ) ( not ( = ?auto_175685 ?auto_175691 ) ) ( not ( = ?auto_175686 ?auto_175691 ) ) ( not ( = ?auto_175687 ?auto_175691 ) ) ( not ( = ?auto_175688 ?auto_175691 ) ) ( ON ?auto_175687 ?auto_175688 ) ( ON-TABLE ?auto_175690 ) ( ON ?auto_175689 ?auto_175690 ) ( ON ?auto_175691 ?auto_175689 ) ( not ( = ?auto_175690 ?auto_175689 ) ) ( not ( = ?auto_175690 ?auto_175691 ) ) ( not ( = ?auto_175690 ?auto_175688 ) ) ( not ( = ?auto_175690 ?auto_175687 ) ) ( not ( = ?auto_175689 ?auto_175691 ) ) ( not ( = ?auto_175689 ?auto_175688 ) ) ( not ( = ?auto_175689 ?auto_175687 ) ) ( not ( = ?auto_175683 ?auto_175690 ) ) ( not ( = ?auto_175683 ?auto_175689 ) ) ( not ( = ?auto_175684 ?auto_175690 ) ) ( not ( = ?auto_175684 ?auto_175689 ) ) ( not ( = ?auto_175685 ?auto_175690 ) ) ( not ( = ?auto_175685 ?auto_175689 ) ) ( not ( = ?auto_175686 ?auto_175690 ) ) ( not ( = ?auto_175686 ?auto_175689 ) ) ( ON ?auto_175686 ?auto_175687 ) ( ON ?auto_175685 ?auto_175686 ) ( CLEAR ?auto_175685 ) ( HOLDING ?auto_175684 ) ( CLEAR ?auto_175683 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175683 ?auto_175684 )
      ( MAKE-6PILE ?auto_175683 ?auto_175684 ?auto_175685 ?auto_175686 ?auto_175687 ?auto_175688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175692 - BLOCK
      ?auto_175693 - BLOCK
      ?auto_175694 - BLOCK
      ?auto_175695 - BLOCK
      ?auto_175696 - BLOCK
      ?auto_175697 - BLOCK
    )
    :vars
    (
      ?auto_175699 - BLOCK
      ?auto_175698 - BLOCK
      ?auto_175700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175692 ) ( not ( = ?auto_175692 ?auto_175693 ) ) ( not ( = ?auto_175692 ?auto_175694 ) ) ( not ( = ?auto_175692 ?auto_175695 ) ) ( not ( = ?auto_175692 ?auto_175696 ) ) ( not ( = ?auto_175692 ?auto_175697 ) ) ( not ( = ?auto_175693 ?auto_175694 ) ) ( not ( = ?auto_175693 ?auto_175695 ) ) ( not ( = ?auto_175693 ?auto_175696 ) ) ( not ( = ?auto_175693 ?auto_175697 ) ) ( not ( = ?auto_175694 ?auto_175695 ) ) ( not ( = ?auto_175694 ?auto_175696 ) ) ( not ( = ?auto_175694 ?auto_175697 ) ) ( not ( = ?auto_175695 ?auto_175696 ) ) ( not ( = ?auto_175695 ?auto_175697 ) ) ( not ( = ?auto_175696 ?auto_175697 ) ) ( ON ?auto_175697 ?auto_175699 ) ( not ( = ?auto_175692 ?auto_175699 ) ) ( not ( = ?auto_175693 ?auto_175699 ) ) ( not ( = ?auto_175694 ?auto_175699 ) ) ( not ( = ?auto_175695 ?auto_175699 ) ) ( not ( = ?auto_175696 ?auto_175699 ) ) ( not ( = ?auto_175697 ?auto_175699 ) ) ( ON ?auto_175696 ?auto_175697 ) ( ON-TABLE ?auto_175698 ) ( ON ?auto_175700 ?auto_175698 ) ( ON ?auto_175699 ?auto_175700 ) ( not ( = ?auto_175698 ?auto_175700 ) ) ( not ( = ?auto_175698 ?auto_175699 ) ) ( not ( = ?auto_175698 ?auto_175697 ) ) ( not ( = ?auto_175698 ?auto_175696 ) ) ( not ( = ?auto_175700 ?auto_175699 ) ) ( not ( = ?auto_175700 ?auto_175697 ) ) ( not ( = ?auto_175700 ?auto_175696 ) ) ( not ( = ?auto_175692 ?auto_175698 ) ) ( not ( = ?auto_175692 ?auto_175700 ) ) ( not ( = ?auto_175693 ?auto_175698 ) ) ( not ( = ?auto_175693 ?auto_175700 ) ) ( not ( = ?auto_175694 ?auto_175698 ) ) ( not ( = ?auto_175694 ?auto_175700 ) ) ( not ( = ?auto_175695 ?auto_175698 ) ) ( not ( = ?auto_175695 ?auto_175700 ) ) ( ON ?auto_175695 ?auto_175696 ) ( ON ?auto_175694 ?auto_175695 ) ( CLEAR ?auto_175692 ) ( ON ?auto_175693 ?auto_175694 ) ( CLEAR ?auto_175693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175698 ?auto_175700 ?auto_175699 ?auto_175697 ?auto_175696 ?auto_175695 ?auto_175694 )
      ( MAKE-6PILE ?auto_175692 ?auto_175693 ?auto_175694 ?auto_175695 ?auto_175696 ?auto_175697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175701 - BLOCK
      ?auto_175702 - BLOCK
      ?auto_175703 - BLOCK
      ?auto_175704 - BLOCK
      ?auto_175705 - BLOCK
      ?auto_175706 - BLOCK
    )
    :vars
    (
      ?auto_175707 - BLOCK
      ?auto_175708 - BLOCK
      ?auto_175709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175701 ?auto_175702 ) ) ( not ( = ?auto_175701 ?auto_175703 ) ) ( not ( = ?auto_175701 ?auto_175704 ) ) ( not ( = ?auto_175701 ?auto_175705 ) ) ( not ( = ?auto_175701 ?auto_175706 ) ) ( not ( = ?auto_175702 ?auto_175703 ) ) ( not ( = ?auto_175702 ?auto_175704 ) ) ( not ( = ?auto_175702 ?auto_175705 ) ) ( not ( = ?auto_175702 ?auto_175706 ) ) ( not ( = ?auto_175703 ?auto_175704 ) ) ( not ( = ?auto_175703 ?auto_175705 ) ) ( not ( = ?auto_175703 ?auto_175706 ) ) ( not ( = ?auto_175704 ?auto_175705 ) ) ( not ( = ?auto_175704 ?auto_175706 ) ) ( not ( = ?auto_175705 ?auto_175706 ) ) ( ON ?auto_175706 ?auto_175707 ) ( not ( = ?auto_175701 ?auto_175707 ) ) ( not ( = ?auto_175702 ?auto_175707 ) ) ( not ( = ?auto_175703 ?auto_175707 ) ) ( not ( = ?auto_175704 ?auto_175707 ) ) ( not ( = ?auto_175705 ?auto_175707 ) ) ( not ( = ?auto_175706 ?auto_175707 ) ) ( ON ?auto_175705 ?auto_175706 ) ( ON-TABLE ?auto_175708 ) ( ON ?auto_175709 ?auto_175708 ) ( ON ?auto_175707 ?auto_175709 ) ( not ( = ?auto_175708 ?auto_175709 ) ) ( not ( = ?auto_175708 ?auto_175707 ) ) ( not ( = ?auto_175708 ?auto_175706 ) ) ( not ( = ?auto_175708 ?auto_175705 ) ) ( not ( = ?auto_175709 ?auto_175707 ) ) ( not ( = ?auto_175709 ?auto_175706 ) ) ( not ( = ?auto_175709 ?auto_175705 ) ) ( not ( = ?auto_175701 ?auto_175708 ) ) ( not ( = ?auto_175701 ?auto_175709 ) ) ( not ( = ?auto_175702 ?auto_175708 ) ) ( not ( = ?auto_175702 ?auto_175709 ) ) ( not ( = ?auto_175703 ?auto_175708 ) ) ( not ( = ?auto_175703 ?auto_175709 ) ) ( not ( = ?auto_175704 ?auto_175708 ) ) ( not ( = ?auto_175704 ?auto_175709 ) ) ( ON ?auto_175704 ?auto_175705 ) ( ON ?auto_175703 ?auto_175704 ) ( ON ?auto_175702 ?auto_175703 ) ( CLEAR ?auto_175702 ) ( HOLDING ?auto_175701 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175701 )
      ( MAKE-6PILE ?auto_175701 ?auto_175702 ?auto_175703 ?auto_175704 ?auto_175705 ?auto_175706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175710 - BLOCK
      ?auto_175711 - BLOCK
      ?auto_175712 - BLOCK
      ?auto_175713 - BLOCK
      ?auto_175714 - BLOCK
      ?auto_175715 - BLOCK
    )
    :vars
    (
      ?auto_175717 - BLOCK
      ?auto_175718 - BLOCK
      ?auto_175716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175710 ?auto_175711 ) ) ( not ( = ?auto_175710 ?auto_175712 ) ) ( not ( = ?auto_175710 ?auto_175713 ) ) ( not ( = ?auto_175710 ?auto_175714 ) ) ( not ( = ?auto_175710 ?auto_175715 ) ) ( not ( = ?auto_175711 ?auto_175712 ) ) ( not ( = ?auto_175711 ?auto_175713 ) ) ( not ( = ?auto_175711 ?auto_175714 ) ) ( not ( = ?auto_175711 ?auto_175715 ) ) ( not ( = ?auto_175712 ?auto_175713 ) ) ( not ( = ?auto_175712 ?auto_175714 ) ) ( not ( = ?auto_175712 ?auto_175715 ) ) ( not ( = ?auto_175713 ?auto_175714 ) ) ( not ( = ?auto_175713 ?auto_175715 ) ) ( not ( = ?auto_175714 ?auto_175715 ) ) ( ON ?auto_175715 ?auto_175717 ) ( not ( = ?auto_175710 ?auto_175717 ) ) ( not ( = ?auto_175711 ?auto_175717 ) ) ( not ( = ?auto_175712 ?auto_175717 ) ) ( not ( = ?auto_175713 ?auto_175717 ) ) ( not ( = ?auto_175714 ?auto_175717 ) ) ( not ( = ?auto_175715 ?auto_175717 ) ) ( ON ?auto_175714 ?auto_175715 ) ( ON-TABLE ?auto_175718 ) ( ON ?auto_175716 ?auto_175718 ) ( ON ?auto_175717 ?auto_175716 ) ( not ( = ?auto_175718 ?auto_175716 ) ) ( not ( = ?auto_175718 ?auto_175717 ) ) ( not ( = ?auto_175718 ?auto_175715 ) ) ( not ( = ?auto_175718 ?auto_175714 ) ) ( not ( = ?auto_175716 ?auto_175717 ) ) ( not ( = ?auto_175716 ?auto_175715 ) ) ( not ( = ?auto_175716 ?auto_175714 ) ) ( not ( = ?auto_175710 ?auto_175718 ) ) ( not ( = ?auto_175710 ?auto_175716 ) ) ( not ( = ?auto_175711 ?auto_175718 ) ) ( not ( = ?auto_175711 ?auto_175716 ) ) ( not ( = ?auto_175712 ?auto_175718 ) ) ( not ( = ?auto_175712 ?auto_175716 ) ) ( not ( = ?auto_175713 ?auto_175718 ) ) ( not ( = ?auto_175713 ?auto_175716 ) ) ( ON ?auto_175713 ?auto_175714 ) ( ON ?auto_175712 ?auto_175713 ) ( ON ?auto_175711 ?auto_175712 ) ( ON ?auto_175710 ?auto_175711 ) ( CLEAR ?auto_175710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175718 ?auto_175716 ?auto_175717 ?auto_175715 ?auto_175714 ?auto_175713 ?auto_175712 ?auto_175711 )
      ( MAKE-6PILE ?auto_175710 ?auto_175711 ?auto_175712 ?auto_175713 ?auto_175714 ?auto_175715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175721 - BLOCK
      ?auto_175722 - BLOCK
    )
    :vars
    (
      ?auto_175723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175723 ?auto_175722 ) ( CLEAR ?auto_175723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175721 ) ( ON ?auto_175722 ?auto_175721 ) ( not ( = ?auto_175721 ?auto_175722 ) ) ( not ( = ?auto_175721 ?auto_175723 ) ) ( not ( = ?auto_175722 ?auto_175723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175723 ?auto_175722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175724 - BLOCK
      ?auto_175725 - BLOCK
    )
    :vars
    (
      ?auto_175726 - BLOCK
      ?auto_175727 - BLOCK
      ?auto_175728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175726 ?auto_175725 ) ( CLEAR ?auto_175726 ) ( ON-TABLE ?auto_175724 ) ( ON ?auto_175725 ?auto_175724 ) ( not ( = ?auto_175724 ?auto_175725 ) ) ( not ( = ?auto_175724 ?auto_175726 ) ) ( not ( = ?auto_175725 ?auto_175726 ) ) ( HOLDING ?auto_175727 ) ( CLEAR ?auto_175728 ) ( not ( = ?auto_175724 ?auto_175727 ) ) ( not ( = ?auto_175724 ?auto_175728 ) ) ( not ( = ?auto_175725 ?auto_175727 ) ) ( not ( = ?auto_175725 ?auto_175728 ) ) ( not ( = ?auto_175726 ?auto_175727 ) ) ( not ( = ?auto_175726 ?auto_175728 ) ) ( not ( = ?auto_175727 ?auto_175728 ) ) )
    :subtasks
    ( ( !STACK ?auto_175727 ?auto_175728 )
      ( MAKE-2PILE ?auto_175724 ?auto_175725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175729 - BLOCK
      ?auto_175730 - BLOCK
    )
    :vars
    (
      ?auto_175733 - BLOCK
      ?auto_175732 - BLOCK
      ?auto_175731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175733 ?auto_175730 ) ( ON-TABLE ?auto_175729 ) ( ON ?auto_175730 ?auto_175729 ) ( not ( = ?auto_175729 ?auto_175730 ) ) ( not ( = ?auto_175729 ?auto_175733 ) ) ( not ( = ?auto_175730 ?auto_175733 ) ) ( CLEAR ?auto_175732 ) ( not ( = ?auto_175729 ?auto_175731 ) ) ( not ( = ?auto_175729 ?auto_175732 ) ) ( not ( = ?auto_175730 ?auto_175731 ) ) ( not ( = ?auto_175730 ?auto_175732 ) ) ( not ( = ?auto_175733 ?auto_175731 ) ) ( not ( = ?auto_175733 ?auto_175732 ) ) ( not ( = ?auto_175731 ?auto_175732 ) ) ( ON ?auto_175731 ?auto_175733 ) ( CLEAR ?auto_175731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175729 ?auto_175730 ?auto_175733 )
      ( MAKE-2PILE ?auto_175729 ?auto_175730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175734 - BLOCK
      ?auto_175735 - BLOCK
    )
    :vars
    (
      ?auto_175737 - BLOCK
      ?auto_175736 - BLOCK
      ?auto_175738 - BLOCK
      ?auto_175742 - BLOCK
      ?auto_175741 - BLOCK
      ?auto_175739 - BLOCK
      ?auto_175740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175737 ?auto_175735 ) ( ON-TABLE ?auto_175734 ) ( ON ?auto_175735 ?auto_175734 ) ( not ( = ?auto_175734 ?auto_175735 ) ) ( not ( = ?auto_175734 ?auto_175737 ) ) ( not ( = ?auto_175735 ?auto_175737 ) ) ( not ( = ?auto_175734 ?auto_175736 ) ) ( not ( = ?auto_175734 ?auto_175738 ) ) ( not ( = ?auto_175735 ?auto_175736 ) ) ( not ( = ?auto_175735 ?auto_175738 ) ) ( not ( = ?auto_175737 ?auto_175736 ) ) ( not ( = ?auto_175737 ?auto_175738 ) ) ( not ( = ?auto_175736 ?auto_175738 ) ) ( ON ?auto_175736 ?auto_175737 ) ( CLEAR ?auto_175736 ) ( HOLDING ?auto_175738 ) ( CLEAR ?auto_175742 ) ( ON-TABLE ?auto_175741 ) ( ON ?auto_175739 ?auto_175741 ) ( ON ?auto_175740 ?auto_175739 ) ( ON ?auto_175742 ?auto_175740 ) ( not ( = ?auto_175741 ?auto_175739 ) ) ( not ( = ?auto_175741 ?auto_175740 ) ) ( not ( = ?auto_175741 ?auto_175742 ) ) ( not ( = ?auto_175741 ?auto_175738 ) ) ( not ( = ?auto_175739 ?auto_175740 ) ) ( not ( = ?auto_175739 ?auto_175742 ) ) ( not ( = ?auto_175739 ?auto_175738 ) ) ( not ( = ?auto_175740 ?auto_175742 ) ) ( not ( = ?auto_175740 ?auto_175738 ) ) ( not ( = ?auto_175742 ?auto_175738 ) ) ( not ( = ?auto_175734 ?auto_175742 ) ) ( not ( = ?auto_175734 ?auto_175741 ) ) ( not ( = ?auto_175734 ?auto_175739 ) ) ( not ( = ?auto_175734 ?auto_175740 ) ) ( not ( = ?auto_175735 ?auto_175742 ) ) ( not ( = ?auto_175735 ?auto_175741 ) ) ( not ( = ?auto_175735 ?auto_175739 ) ) ( not ( = ?auto_175735 ?auto_175740 ) ) ( not ( = ?auto_175737 ?auto_175742 ) ) ( not ( = ?auto_175737 ?auto_175741 ) ) ( not ( = ?auto_175737 ?auto_175739 ) ) ( not ( = ?auto_175737 ?auto_175740 ) ) ( not ( = ?auto_175736 ?auto_175742 ) ) ( not ( = ?auto_175736 ?auto_175741 ) ) ( not ( = ?auto_175736 ?auto_175739 ) ) ( not ( = ?auto_175736 ?auto_175740 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175741 ?auto_175739 ?auto_175740 ?auto_175742 ?auto_175738 )
      ( MAKE-2PILE ?auto_175734 ?auto_175735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175743 - BLOCK
      ?auto_175744 - BLOCK
    )
    :vars
    (
      ?auto_175746 - BLOCK
      ?auto_175750 - BLOCK
      ?auto_175745 - BLOCK
      ?auto_175751 - BLOCK
      ?auto_175748 - BLOCK
      ?auto_175747 - BLOCK
      ?auto_175749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175746 ?auto_175744 ) ( ON-TABLE ?auto_175743 ) ( ON ?auto_175744 ?auto_175743 ) ( not ( = ?auto_175743 ?auto_175744 ) ) ( not ( = ?auto_175743 ?auto_175746 ) ) ( not ( = ?auto_175744 ?auto_175746 ) ) ( not ( = ?auto_175743 ?auto_175750 ) ) ( not ( = ?auto_175743 ?auto_175745 ) ) ( not ( = ?auto_175744 ?auto_175750 ) ) ( not ( = ?auto_175744 ?auto_175745 ) ) ( not ( = ?auto_175746 ?auto_175750 ) ) ( not ( = ?auto_175746 ?auto_175745 ) ) ( not ( = ?auto_175750 ?auto_175745 ) ) ( ON ?auto_175750 ?auto_175746 ) ( CLEAR ?auto_175751 ) ( ON-TABLE ?auto_175748 ) ( ON ?auto_175747 ?auto_175748 ) ( ON ?auto_175749 ?auto_175747 ) ( ON ?auto_175751 ?auto_175749 ) ( not ( = ?auto_175748 ?auto_175747 ) ) ( not ( = ?auto_175748 ?auto_175749 ) ) ( not ( = ?auto_175748 ?auto_175751 ) ) ( not ( = ?auto_175748 ?auto_175745 ) ) ( not ( = ?auto_175747 ?auto_175749 ) ) ( not ( = ?auto_175747 ?auto_175751 ) ) ( not ( = ?auto_175747 ?auto_175745 ) ) ( not ( = ?auto_175749 ?auto_175751 ) ) ( not ( = ?auto_175749 ?auto_175745 ) ) ( not ( = ?auto_175751 ?auto_175745 ) ) ( not ( = ?auto_175743 ?auto_175751 ) ) ( not ( = ?auto_175743 ?auto_175748 ) ) ( not ( = ?auto_175743 ?auto_175747 ) ) ( not ( = ?auto_175743 ?auto_175749 ) ) ( not ( = ?auto_175744 ?auto_175751 ) ) ( not ( = ?auto_175744 ?auto_175748 ) ) ( not ( = ?auto_175744 ?auto_175747 ) ) ( not ( = ?auto_175744 ?auto_175749 ) ) ( not ( = ?auto_175746 ?auto_175751 ) ) ( not ( = ?auto_175746 ?auto_175748 ) ) ( not ( = ?auto_175746 ?auto_175747 ) ) ( not ( = ?auto_175746 ?auto_175749 ) ) ( not ( = ?auto_175750 ?auto_175751 ) ) ( not ( = ?auto_175750 ?auto_175748 ) ) ( not ( = ?auto_175750 ?auto_175747 ) ) ( not ( = ?auto_175750 ?auto_175749 ) ) ( ON ?auto_175745 ?auto_175750 ) ( CLEAR ?auto_175745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175743 ?auto_175744 ?auto_175746 ?auto_175750 )
      ( MAKE-2PILE ?auto_175743 ?auto_175744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175752 - BLOCK
      ?auto_175753 - BLOCK
    )
    :vars
    (
      ?auto_175754 - BLOCK
      ?auto_175760 - BLOCK
      ?auto_175759 - BLOCK
      ?auto_175755 - BLOCK
      ?auto_175758 - BLOCK
      ?auto_175756 - BLOCK
      ?auto_175757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175754 ?auto_175753 ) ( ON-TABLE ?auto_175752 ) ( ON ?auto_175753 ?auto_175752 ) ( not ( = ?auto_175752 ?auto_175753 ) ) ( not ( = ?auto_175752 ?auto_175754 ) ) ( not ( = ?auto_175753 ?auto_175754 ) ) ( not ( = ?auto_175752 ?auto_175760 ) ) ( not ( = ?auto_175752 ?auto_175759 ) ) ( not ( = ?auto_175753 ?auto_175760 ) ) ( not ( = ?auto_175753 ?auto_175759 ) ) ( not ( = ?auto_175754 ?auto_175760 ) ) ( not ( = ?auto_175754 ?auto_175759 ) ) ( not ( = ?auto_175760 ?auto_175759 ) ) ( ON ?auto_175760 ?auto_175754 ) ( ON-TABLE ?auto_175755 ) ( ON ?auto_175758 ?auto_175755 ) ( ON ?auto_175756 ?auto_175758 ) ( not ( = ?auto_175755 ?auto_175758 ) ) ( not ( = ?auto_175755 ?auto_175756 ) ) ( not ( = ?auto_175755 ?auto_175757 ) ) ( not ( = ?auto_175755 ?auto_175759 ) ) ( not ( = ?auto_175758 ?auto_175756 ) ) ( not ( = ?auto_175758 ?auto_175757 ) ) ( not ( = ?auto_175758 ?auto_175759 ) ) ( not ( = ?auto_175756 ?auto_175757 ) ) ( not ( = ?auto_175756 ?auto_175759 ) ) ( not ( = ?auto_175757 ?auto_175759 ) ) ( not ( = ?auto_175752 ?auto_175757 ) ) ( not ( = ?auto_175752 ?auto_175755 ) ) ( not ( = ?auto_175752 ?auto_175758 ) ) ( not ( = ?auto_175752 ?auto_175756 ) ) ( not ( = ?auto_175753 ?auto_175757 ) ) ( not ( = ?auto_175753 ?auto_175755 ) ) ( not ( = ?auto_175753 ?auto_175758 ) ) ( not ( = ?auto_175753 ?auto_175756 ) ) ( not ( = ?auto_175754 ?auto_175757 ) ) ( not ( = ?auto_175754 ?auto_175755 ) ) ( not ( = ?auto_175754 ?auto_175758 ) ) ( not ( = ?auto_175754 ?auto_175756 ) ) ( not ( = ?auto_175760 ?auto_175757 ) ) ( not ( = ?auto_175760 ?auto_175755 ) ) ( not ( = ?auto_175760 ?auto_175758 ) ) ( not ( = ?auto_175760 ?auto_175756 ) ) ( ON ?auto_175759 ?auto_175760 ) ( CLEAR ?auto_175759 ) ( HOLDING ?auto_175757 ) ( CLEAR ?auto_175756 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175755 ?auto_175758 ?auto_175756 ?auto_175757 )
      ( MAKE-2PILE ?auto_175752 ?auto_175753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175761 - BLOCK
      ?auto_175762 - BLOCK
    )
    :vars
    (
      ?auto_175769 - BLOCK
      ?auto_175765 - BLOCK
      ?auto_175768 - BLOCK
      ?auto_175767 - BLOCK
      ?auto_175763 - BLOCK
      ?auto_175766 - BLOCK
      ?auto_175764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175769 ?auto_175762 ) ( ON-TABLE ?auto_175761 ) ( ON ?auto_175762 ?auto_175761 ) ( not ( = ?auto_175761 ?auto_175762 ) ) ( not ( = ?auto_175761 ?auto_175769 ) ) ( not ( = ?auto_175762 ?auto_175769 ) ) ( not ( = ?auto_175761 ?auto_175765 ) ) ( not ( = ?auto_175761 ?auto_175768 ) ) ( not ( = ?auto_175762 ?auto_175765 ) ) ( not ( = ?auto_175762 ?auto_175768 ) ) ( not ( = ?auto_175769 ?auto_175765 ) ) ( not ( = ?auto_175769 ?auto_175768 ) ) ( not ( = ?auto_175765 ?auto_175768 ) ) ( ON ?auto_175765 ?auto_175769 ) ( ON-TABLE ?auto_175767 ) ( ON ?auto_175763 ?auto_175767 ) ( ON ?auto_175766 ?auto_175763 ) ( not ( = ?auto_175767 ?auto_175763 ) ) ( not ( = ?auto_175767 ?auto_175766 ) ) ( not ( = ?auto_175767 ?auto_175764 ) ) ( not ( = ?auto_175767 ?auto_175768 ) ) ( not ( = ?auto_175763 ?auto_175766 ) ) ( not ( = ?auto_175763 ?auto_175764 ) ) ( not ( = ?auto_175763 ?auto_175768 ) ) ( not ( = ?auto_175766 ?auto_175764 ) ) ( not ( = ?auto_175766 ?auto_175768 ) ) ( not ( = ?auto_175764 ?auto_175768 ) ) ( not ( = ?auto_175761 ?auto_175764 ) ) ( not ( = ?auto_175761 ?auto_175767 ) ) ( not ( = ?auto_175761 ?auto_175763 ) ) ( not ( = ?auto_175761 ?auto_175766 ) ) ( not ( = ?auto_175762 ?auto_175764 ) ) ( not ( = ?auto_175762 ?auto_175767 ) ) ( not ( = ?auto_175762 ?auto_175763 ) ) ( not ( = ?auto_175762 ?auto_175766 ) ) ( not ( = ?auto_175769 ?auto_175764 ) ) ( not ( = ?auto_175769 ?auto_175767 ) ) ( not ( = ?auto_175769 ?auto_175763 ) ) ( not ( = ?auto_175769 ?auto_175766 ) ) ( not ( = ?auto_175765 ?auto_175764 ) ) ( not ( = ?auto_175765 ?auto_175767 ) ) ( not ( = ?auto_175765 ?auto_175763 ) ) ( not ( = ?auto_175765 ?auto_175766 ) ) ( ON ?auto_175768 ?auto_175765 ) ( CLEAR ?auto_175766 ) ( ON ?auto_175764 ?auto_175768 ) ( CLEAR ?auto_175764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175761 ?auto_175762 ?auto_175769 ?auto_175765 ?auto_175768 )
      ( MAKE-2PILE ?auto_175761 ?auto_175762 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175770 - BLOCK
      ?auto_175771 - BLOCK
    )
    :vars
    (
      ?auto_175777 - BLOCK
      ?auto_175774 - BLOCK
      ?auto_175778 - BLOCK
      ?auto_175772 - BLOCK
      ?auto_175776 - BLOCK
      ?auto_175775 - BLOCK
      ?auto_175773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175777 ?auto_175771 ) ( ON-TABLE ?auto_175770 ) ( ON ?auto_175771 ?auto_175770 ) ( not ( = ?auto_175770 ?auto_175771 ) ) ( not ( = ?auto_175770 ?auto_175777 ) ) ( not ( = ?auto_175771 ?auto_175777 ) ) ( not ( = ?auto_175770 ?auto_175774 ) ) ( not ( = ?auto_175770 ?auto_175778 ) ) ( not ( = ?auto_175771 ?auto_175774 ) ) ( not ( = ?auto_175771 ?auto_175778 ) ) ( not ( = ?auto_175777 ?auto_175774 ) ) ( not ( = ?auto_175777 ?auto_175778 ) ) ( not ( = ?auto_175774 ?auto_175778 ) ) ( ON ?auto_175774 ?auto_175777 ) ( ON-TABLE ?auto_175772 ) ( ON ?auto_175776 ?auto_175772 ) ( not ( = ?auto_175772 ?auto_175776 ) ) ( not ( = ?auto_175772 ?auto_175775 ) ) ( not ( = ?auto_175772 ?auto_175773 ) ) ( not ( = ?auto_175772 ?auto_175778 ) ) ( not ( = ?auto_175776 ?auto_175775 ) ) ( not ( = ?auto_175776 ?auto_175773 ) ) ( not ( = ?auto_175776 ?auto_175778 ) ) ( not ( = ?auto_175775 ?auto_175773 ) ) ( not ( = ?auto_175775 ?auto_175778 ) ) ( not ( = ?auto_175773 ?auto_175778 ) ) ( not ( = ?auto_175770 ?auto_175773 ) ) ( not ( = ?auto_175770 ?auto_175772 ) ) ( not ( = ?auto_175770 ?auto_175776 ) ) ( not ( = ?auto_175770 ?auto_175775 ) ) ( not ( = ?auto_175771 ?auto_175773 ) ) ( not ( = ?auto_175771 ?auto_175772 ) ) ( not ( = ?auto_175771 ?auto_175776 ) ) ( not ( = ?auto_175771 ?auto_175775 ) ) ( not ( = ?auto_175777 ?auto_175773 ) ) ( not ( = ?auto_175777 ?auto_175772 ) ) ( not ( = ?auto_175777 ?auto_175776 ) ) ( not ( = ?auto_175777 ?auto_175775 ) ) ( not ( = ?auto_175774 ?auto_175773 ) ) ( not ( = ?auto_175774 ?auto_175772 ) ) ( not ( = ?auto_175774 ?auto_175776 ) ) ( not ( = ?auto_175774 ?auto_175775 ) ) ( ON ?auto_175778 ?auto_175774 ) ( ON ?auto_175773 ?auto_175778 ) ( CLEAR ?auto_175773 ) ( HOLDING ?auto_175775 ) ( CLEAR ?auto_175776 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175772 ?auto_175776 ?auto_175775 )
      ( MAKE-2PILE ?auto_175770 ?auto_175771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175779 - BLOCK
      ?auto_175780 - BLOCK
    )
    :vars
    (
      ?auto_175784 - BLOCK
      ?auto_175787 - BLOCK
      ?auto_175783 - BLOCK
      ?auto_175786 - BLOCK
      ?auto_175781 - BLOCK
      ?auto_175782 - BLOCK
      ?auto_175785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175784 ?auto_175780 ) ( ON-TABLE ?auto_175779 ) ( ON ?auto_175780 ?auto_175779 ) ( not ( = ?auto_175779 ?auto_175780 ) ) ( not ( = ?auto_175779 ?auto_175784 ) ) ( not ( = ?auto_175780 ?auto_175784 ) ) ( not ( = ?auto_175779 ?auto_175787 ) ) ( not ( = ?auto_175779 ?auto_175783 ) ) ( not ( = ?auto_175780 ?auto_175787 ) ) ( not ( = ?auto_175780 ?auto_175783 ) ) ( not ( = ?auto_175784 ?auto_175787 ) ) ( not ( = ?auto_175784 ?auto_175783 ) ) ( not ( = ?auto_175787 ?auto_175783 ) ) ( ON ?auto_175787 ?auto_175784 ) ( ON-TABLE ?auto_175786 ) ( ON ?auto_175781 ?auto_175786 ) ( not ( = ?auto_175786 ?auto_175781 ) ) ( not ( = ?auto_175786 ?auto_175782 ) ) ( not ( = ?auto_175786 ?auto_175785 ) ) ( not ( = ?auto_175786 ?auto_175783 ) ) ( not ( = ?auto_175781 ?auto_175782 ) ) ( not ( = ?auto_175781 ?auto_175785 ) ) ( not ( = ?auto_175781 ?auto_175783 ) ) ( not ( = ?auto_175782 ?auto_175785 ) ) ( not ( = ?auto_175782 ?auto_175783 ) ) ( not ( = ?auto_175785 ?auto_175783 ) ) ( not ( = ?auto_175779 ?auto_175785 ) ) ( not ( = ?auto_175779 ?auto_175786 ) ) ( not ( = ?auto_175779 ?auto_175781 ) ) ( not ( = ?auto_175779 ?auto_175782 ) ) ( not ( = ?auto_175780 ?auto_175785 ) ) ( not ( = ?auto_175780 ?auto_175786 ) ) ( not ( = ?auto_175780 ?auto_175781 ) ) ( not ( = ?auto_175780 ?auto_175782 ) ) ( not ( = ?auto_175784 ?auto_175785 ) ) ( not ( = ?auto_175784 ?auto_175786 ) ) ( not ( = ?auto_175784 ?auto_175781 ) ) ( not ( = ?auto_175784 ?auto_175782 ) ) ( not ( = ?auto_175787 ?auto_175785 ) ) ( not ( = ?auto_175787 ?auto_175786 ) ) ( not ( = ?auto_175787 ?auto_175781 ) ) ( not ( = ?auto_175787 ?auto_175782 ) ) ( ON ?auto_175783 ?auto_175787 ) ( ON ?auto_175785 ?auto_175783 ) ( CLEAR ?auto_175781 ) ( ON ?auto_175782 ?auto_175785 ) ( CLEAR ?auto_175782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175779 ?auto_175780 ?auto_175784 ?auto_175787 ?auto_175783 ?auto_175785 )
      ( MAKE-2PILE ?auto_175779 ?auto_175780 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175788 - BLOCK
      ?auto_175789 - BLOCK
    )
    :vars
    (
      ?auto_175796 - BLOCK
      ?auto_175790 - BLOCK
      ?auto_175792 - BLOCK
      ?auto_175794 - BLOCK
      ?auto_175795 - BLOCK
      ?auto_175791 - BLOCK
      ?auto_175793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175796 ?auto_175789 ) ( ON-TABLE ?auto_175788 ) ( ON ?auto_175789 ?auto_175788 ) ( not ( = ?auto_175788 ?auto_175789 ) ) ( not ( = ?auto_175788 ?auto_175796 ) ) ( not ( = ?auto_175789 ?auto_175796 ) ) ( not ( = ?auto_175788 ?auto_175790 ) ) ( not ( = ?auto_175788 ?auto_175792 ) ) ( not ( = ?auto_175789 ?auto_175790 ) ) ( not ( = ?auto_175789 ?auto_175792 ) ) ( not ( = ?auto_175796 ?auto_175790 ) ) ( not ( = ?auto_175796 ?auto_175792 ) ) ( not ( = ?auto_175790 ?auto_175792 ) ) ( ON ?auto_175790 ?auto_175796 ) ( ON-TABLE ?auto_175794 ) ( not ( = ?auto_175794 ?auto_175795 ) ) ( not ( = ?auto_175794 ?auto_175791 ) ) ( not ( = ?auto_175794 ?auto_175793 ) ) ( not ( = ?auto_175794 ?auto_175792 ) ) ( not ( = ?auto_175795 ?auto_175791 ) ) ( not ( = ?auto_175795 ?auto_175793 ) ) ( not ( = ?auto_175795 ?auto_175792 ) ) ( not ( = ?auto_175791 ?auto_175793 ) ) ( not ( = ?auto_175791 ?auto_175792 ) ) ( not ( = ?auto_175793 ?auto_175792 ) ) ( not ( = ?auto_175788 ?auto_175793 ) ) ( not ( = ?auto_175788 ?auto_175794 ) ) ( not ( = ?auto_175788 ?auto_175795 ) ) ( not ( = ?auto_175788 ?auto_175791 ) ) ( not ( = ?auto_175789 ?auto_175793 ) ) ( not ( = ?auto_175789 ?auto_175794 ) ) ( not ( = ?auto_175789 ?auto_175795 ) ) ( not ( = ?auto_175789 ?auto_175791 ) ) ( not ( = ?auto_175796 ?auto_175793 ) ) ( not ( = ?auto_175796 ?auto_175794 ) ) ( not ( = ?auto_175796 ?auto_175795 ) ) ( not ( = ?auto_175796 ?auto_175791 ) ) ( not ( = ?auto_175790 ?auto_175793 ) ) ( not ( = ?auto_175790 ?auto_175794 ) ) ( not ( = ?auto_175790 ?auto_175795 ) ) ( not ( = ?auto_175790 ?auto_175791 ) ) ( ON ?auto_175792 ?auto_175790 ) ( ON ?auto_175793 ?auto_175792 ) ( ON ?auto_175791 ?auto_175793 ) ( CLEAR ?auto_175791 ) ( HOLDING ?auto_175795 ) ( CLEAR ?auto_175794 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175794 ?auto_175795 )
      ( MAKE-2PILE ?auto_175788 ?auto_175789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175797 - BLOCK
      ?auto_175798 - BLOCK
    )
    :vars
    (
      ?auto_175801 - BLOCK
      ?auto_175799 - BLOCK
      ?auto_175804 - BLOCK
      ?auto_175805 - BLOCK
      ?auto_175800 - BLOCK
      ?auto_175803 - BLOCK
      ?auto_175802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175801 ?auto_175798 ) ( ON-TABLE ?auto_175797 ) ( ON ?auto_175798 ?auto_175797 ) ( not ( = ?auto_175797 ?auto_175798 ) ) ( not ( = ?auto_175797 ?auto_175801 ) ) ( not ( = ?auto_175798 ?auto_175801 ) ) ( not ( = ?auto_175797 ?auto_175799 ) ) ( not ( = ?auto_175797 ?auto_175804 ) ) ( not ( = ?auto_175798 ?auto_175799 ) ) ( not ( = ?auto_175798 ?auto_175804 ) ) ( not ( = ?auto_175801 ?auto_175799 ) ) ( not ( = ?auto_175801 ?auto_175804 ) ) ( not ( = ?auto_175799 ?auto_175804 ) ) ( ON ?auto_175799 ?auto_175801 ) ( ON-TABLE ?auto_175805 ) ( not ( = ?auto_175805 ?auto_175800 ) ) ( not ( = ?auto_175805 ?auto_175803 ) ) ( not ( = ?auto_175805 ?auto_175802 ) ) ( not ( = ?auto_175805 ?auto_175804 ) ) ( not ( = ?auto_175800 ?auto_175803 ) ) ( not ( = ?auto_175800 ?auto_175802 ) ) ( not ( = ?auto_175800 ?auto_175804 ) ) ( not ( = ?auto_175803 ?auto_175802 ) ) ( not ( = ?auto_175803 ?auto_175804 ) ) ( not ( = ?auto_175802 ?auto_175804 ) ) ( not ( = ?auto_175797 ?auto_175802 ) ) ( not ( = ?auto_175797 ?auto_175805 ) ) ( not ( = ?auto_175797 ?auto_175800 ) ) ( not ( = ?auto_175797 ?auto_175803 ) ) ( not ( = ?auto_175798 ?auto_175802 ) ) ( not ( = ?auto_175798 ?auto_175805 ) ) ( not ( = ?auto_175798 ?auto_175800 ) ) ( not ( = ?auto_175798 ?auto_175803 ) ) ( not ( = ?auto_175801 ?auto_175802 ) ) ( not ( = ?auto_175801 ?auto_175805 ) ) ( not ( = ?auto_175801 ?auto_175800 ) ) ( not ( = ?auto_175801 ?auto_175803 ) ) ( not ( = ?auto_175799 ?auto_175802 ) ) ( not ( = ?auto_175799 ?auto_175805 ) ) ( not ( = ?auto_175799 ?auto_175800 ) ) ( not ( = ?auto_175799 ?auto_175803 ) ) ( ON ?auto_175804 ?auto_175799 ) ( ON ?auto_175802 ?auto_175804 ) ( ON ?auto_175803 ?auto_175802 ) ( CLEAR ?auto_175805 ) ( ON ?auto_175800 ?auto_175803 ) ( CLEAR ?auto_175800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175797 ?auto_175798 ?auto_175801 ?auto_175799 ?auto_175804 ?auto_175802 ?auto_175803 )
      ( MAKE-2PILE ?auto_175797 ?auto_175798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175806 - BLOCK
      ?auto_175807 - BLOCK
    )
    :vars
    (
      ?auto_175813 - BLOCK
      ?auto_175808 - BLOCK
      ?auto_175812 - BLOCK
      ?auto_175810 - BLOCK
      ?auto_175809 - BLOCK
      ?auto_175814 - BLOCK
      ?auto_175811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175813 ?auto_175807 ) ( ON-TABLE ?auto_175806 ) ( ON ?auto_175807 ?auto_175806 ) ( not ( = ?auto_175806 ?auto_175807 ) ) ( not ( = ?auto_175806 ?auto_175813 ) ) ( not ( = ?auto_175807 ?auto_175813 ) ) ( not ( = ?auto_175806 ?auto_175808 ) ) ( not ( = ?auto_175806 ?auto_175812 ) ) ( not ( = ?auto_175807 ?auto_175808 ) ) ( not ( = ?auto_175807 ?auto_175812 ) ) ( not ( = ?auto_175813 ?auto_175808 ) ) ( not ( = ?auto_175813 ?auto_175812 ) ) ( not ( = ?auto_175808 ?auto_175812 ) ) ( ON ?auto_175808 ?auto_175813 ) ( not ( = ?auto_175810 ?auto_175809 ) ) ( not ( = ?auto_175810 ?auto_175814 ) ) ( not ( = ?auto_175810 ?auto_175811 ) ) ( not ( = ?auto_175810 ?auto_175812 ) ) ( not ( = ?auto_175809 ?auto_175814 ) ) ( not ( = ?auto_175809 ?auto_175811 ) ) ( not ( = ?auto_175809 ?auto_175812 ) ) ( not ( = ?auto_175814 ?auto_175811 ) ) ( not ( = ?auto_175814 ?auto_175812 ) ) ( not ( = ?auto_175811 ?auto_175812 ) ) ( not ( = ?auto_175806 ?auto_175811 ) ) ( not ( = ?auto_175806 ?auto_175810 ) ) ( not ( = ?auto_175806 ?auto_175809 ) ) ( not ( = ?auto_175806 ?auto_175814 ) ) ( not ( = ?auto_175807 ?auto_175811 ) ) ( not ( = ?auto_175807 ?auto_175810 ) ) ( not ( = ?auto_175807 ?auto_175809 ) ) ( not ( = ?auto_175807 ?auto_175814 ) ) ( not ( = ?auto_175813 ?auto_175811 ) ) ( not ( = ?auto_175813 ?auto_175810 ) ) ( not ( = ?auto_175813 ?auto_175809 ) ) ( not ( = ?auto_175813 ?auto_175814 ) ) ( not ( = ?auto_175808 ?auto_175811 ) ) ( not ( = ?auto_175808 ?auto_175810 ) ) ( not ( = ?auto_175808 ?auto_175809 ) ) ( not ( = ?auto_175808 ?auto_175814 ) ) ( ON ?auto_175812 ?auto_175808 ) ( ON ?auto_175811 ?auto_175812 ) ( ON ?auto_175814 ?auto_175811 ) ( ON ?auto_175809 ?auto_175814 ) ( CLEAR ?auto_175809 ) ( HOLDING ?auto_175810 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175810 )
      ( MAKE-2PILE ?auto_175806 ?auto_175807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175815 - BLOCK
      ?auto_175816 - BLOCK
    )
    :vars
    (
      ?auto_175823 - BLOCK
      ?auto_175819 - BLOCK
      ?auto_175817 - BLOCK
      ?auto_175820 - BLOCK
      ?auto_175818 - BLOCK
      ?auto_175822 - BLOCK
      ?auto_175821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175823 ?auto_175816 ) ( ON-TABLE ?auto_175815 ) ( ON ?auto_175816 ?auto_175815 ) ( not ( = ?auto_175815 ?auto_175816 ) ) ( not ( = ?auto_175815 ?auto_175823 ) ) ( not ( = ?auto_175816 ?auto_175823 ) ) ( not ( = ?auto_175815 ?auto_175819 ) ) ( not ( = ?auto_175815 ?auto_175817 ) ) ( not ( = ?auto_175816 ?auto_175819 ) ) ( not ( = ?auto_175816 ?auto_175817 ) ) ( not ( = ?auto_175823 ?auto_175819 ) ) ( not ( = ?auto_175823 ?auto_175817 ) ) ( not ( = ?auto_175819 ?auto_175817 ) ) ( ON ?auto_175819 ?auto_175823 ) ( not ( = ?auto_175820 ?auto_175818 ) ) ( not ( = ?auto_175820 ?auto_175822 ) ) ( not ( = ?auto_175820 ?auto_175821 ) ) ( not ( = ?auto_175820 ?auto_175817 ) ) ( not ( = ?auto_175818 ?auto_175822 ) ) ( not ( = ?auto_175818 ?auto_175821 ) ) ( not ( = ?auto_175818 ?auto_175817 ) ) ( not ( = ?auto_175822 ?auto_175821 ) ) ( not ( = ?auto_175822 ?auto_175817 ) ) ( not ( = ?auto_175821 ?auto_175817 ) ) ( not ( = ?auto_175815 ?auto_175821 ) ) ( not ( = ?auto_175815 ?auto_175820 ) ) ( not ( = ?auto_175815 ?auto_175818 ) ) ( not ( = ?auto_175815 ?auto_175822 ) ) ( not ( = ?auto_175816 ?auto_175821 ) ) ( not ( = ?auto_175816 ?auto_175820 ) ) ( not ( = ?auto_175816 ?auto_175818 ) ) ( not ( = ?auto_175816 ?auto_175822 ) ) ( not ( = ?auto_175823 ?auto_175821 ) ) ( not ( = ?auto_175823 ?auto_175820 ) ) ( not ( = ?auto_175823 ?auto_175818 ) ) ( not ( = ?auto_175823 ?auto_175822 ) ) ( not ( = ?auto_175819 ?auto_175821 ) ) ( not ( = ?auto_175819 ?auto_175820 ) ) ( not ( = ?auto_175819 ?auto_175818 ) ) ( not ( = ?auto_175819 ?auto_175822 ) ) ( ON ?auto_175817 ?auto_175819 ) ( ON ?auto_175821 ?auto_175817 ) ( ON ?auto_175822 ?auto_175821 ) ( ON ?auto_175818 ?auto_175822 ) ( ON ?auto_175820 ?auto_175818 ) ( CLEAR ?auto_175820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175815 ?auto_175816 ?auto_175823 ?auto_175819 ?auto_175817 ?auto_175821 ?auto_175822 ?auto_175818 )
      ( MAKE-2PILE ?auto_175815 ?auto_175816 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175831 - BLOCK
      ?auto_175832 - BLOCK
      ?auto_175833 - BLOCK
      ?auto_175834 - BLOCK
      ?auto_175835 - BLOCK
      ?auto_175836 - BLOCK
      ?auto_175837 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_175837 ) ( CLEAR ?auto_175836 ) ( ON-TABLE ?auto_175831 ) ( ON ?auto_175832 ?auto_175831 ) ( ON ?auto_175833 ?auto_175832 ) ( ON ?auto_175834 ?auto_175833 ) ( ON ?auto_175835 ?auto_175834 ) ( ON ?auto_175836 ?auto_175835 ) ( not ( = ?auto_175831 ?auto_175832 ) ) ( not ( = ?auto_175831 ?auto_175833 ) ) ( not ( = ?auto_175831 ?auto_175834 ) ) ( not ( = ?auto_175831 ?auto_175835 ) ) ( not ( = ?auto_175831 ?auto_175836 ) ) ( not ( = ?auto_175831 ?auto_175837 ) ) ( not ( = ?auto_175832 ?auto_175833 ) ) ( not ( = ?auto_175832 ?auto_175834 ) ) ( not ( = ?auto_175832 ?auto_175835 ) ) ( not ( = ?auto_175832 ?auto_175836 ) ) ( not ( = ?auto_175832 ?auto_175837 ) ) ( not ( = ?auto_175833 ?auto_175834 ) ) ( not ( = ?auto_175833 ?auto_175835 ) ) ( not ( = ?auto_175833 ?auto_175836 ) ) ( not ( = ?auto_175833 ?auto_175837 ) ) ( not ( = ?auto_175834 ?auto_175835 ) ) ( not ( = ?auto_175834 ?auto_175836 ) ) ( not ( = ?auto_175834 ?auto_175837 ) ) ( not ( = ?auto_175835 ?auto_175836 ) ) ( not ( = ?auto_175835 ?auto_175837 ) ) ( not ( = ?auto_175836 ?auto_175837 ) ) )
    :subtasks
    ( ( !STACK ?auto_175837 ?auto_175836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175838 - BLOCK
      ?auto_175839 - BLOCK
      ?auto_175840 - BLOCK
      ?auto_175841 - BLOCK
      ?auto_175842 - BLOCK
      ?auto_175843 - BLOCK
      ?auto_175844 - BLOCK
    )
    :vars
    (
      ?auto_175845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175843 ) ( ON-TABLE ?auto_175838 ) ( ON ?auto_175839 ?auto_175838 ) ( ON ?auto_175840 ?auto_175839 ) ( ON ?auto_175841 ?auto_175840 ) ( ON ?auto_175842 ?auto_175841 ) ( ON ?auto_175843 ?auto_175842 ) ( not ( = ?auto_175838 ?auto_175839 ) ) ( not ( = ?auto_175838 ?auto_175840 ) ) ( not ( = ?auto_175838 ?auto_175841 ) ) ( not ( = ?auto_175838 ?auto_175842 ) ) ( not ( = ?auto_175838 ?auto_175843 ) ) ( not ( = ?auto_175838 ?auto_175844 ) ) ( not ( = ?auto_175839 ?auto_175840 ) ) ( not ( = ?auto_175839 ?auto_175841 ) ) ( not ( = ?auto_175839 ?auto_175842 ) ) ( not ( = ?auto_175839 ?auto_175843 ) ) ( not ( = ?auto_175839 ?auto_175844 ) ) ( not ( = ?auto_175840 ?auto_175841 ) ) ( not ( = ?auto_175840 ?auto_175842 ) ) ( not ( = ?auto_175840 ?auto_175843 ) ) ( not ( = ?auto_175840 ?auto_175844 ) ) ( not ( = ?auto_175841 ?auto_175842 ) ) ( not ( = ?auto_175841 ?auto_175843 ) ) ( not ( = ?auto_175841 ?auto_175844 ) ) ( not ( = ?auto_175842 ?auto_175843 ) ) ( not ( = ?auto_175842 ?auto_175844 ) ) ( not ( = ?auto_175843 ?auto_175844 ) ) ( ON ?auto_175844 ?auto_175845 ) ( CLEAR ?auto_175844 ) ( HAND-EMPTY ) ( not ( = ?auto_175838 ?auto_175845 ) ) ( not ( = ?auto_175839 ?auto_175845 ) ) ( not ( = ?auto_175840 ?auto_175845 ) ) ( not ( = ?auto_175841 ?auto_175845 ) ) ( not ( = ?auto_175842 ?auto_175845 ) ) ( not ( = ?auto_175843 ?auto_175845 ) ) ( not ( = ?auto_175844 ?auto_175845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175844 ?auto_175845 )
      ( MAKE-7PILE ?auto_175838 ?auto_175839 ?auto_175840 ?auto_175841 ?auto_175842 ?auto_175843 ?auto_175844 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175846 - BLOCK
      ?auto_175847 - BLOCK
      ?auto_175848 - BLOCK
      ?auto_175849 - BLOCK
      ?auto_175850 - BLOCK
      ?auto_175851 - BLOCK
      ?auto_175852 - BLOCK
    )
    :vars
    (
      ?auto_175853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175846 ) ( ON ?auto_175847 ?auto_175846 ) ( ON ?auto_175848 ?auto_175847 ) ( ON ?auto_175849 ?auto_175848 ) ( ON ?auto_175850 ?auto_175849 ) ( not ( = ?auto_175846 ?auto_175847 ) ) ( not ( = ?auto_175846 ?auto_175848 ) ) ( not ( = ?auto_175846 ?auto_175849 ) ) ( not ( = ?auto_175846 ?auto_175850 ) ) ( not ( = ?auto_175846 ?auto_175851 ) ) ( not ( = ?auto_175846 ?auto_175852 ) ) ( not ( = ?auto_175847 ?auto_175848 ) ) ( not ( = ?auto_175847 ?auto_175849 ) ) ( not ( = ?auto_175847 ?auto_175850 ) ) ( not ( = ?auto_175847 ?auto_175851 ) ) ( not ( = ?auto_175847 ?auto_175852 ) ) ( not ( = ?auto_175848 ?auto_175849 ) ) ( not ( = ?auto_175848 ?auto_175850 ) ) ( not ( = ?auto_175848 ?auto_175851 ) ) ( not ( = ?auto_175848 ?auto_175852 ) ) ( not ( = ?auto_175849 ?auto_175850 ) ) ( not ( = ?auto_175849 ?auto_175851 ) ) ( not ( = ?auto_175849 ?auto_175852 ) ) ( not ( = ?auto_175850 ?auto_175851 ) ) ( not ( = ?auto_175850 ?auto_175852 ) ) ( not ( = ?auto_175851 ?auto_175852 ) ) ( ON ?auto_175852 ?auto_175853 ) ( CLEAR ?auto_175852 ) ( not ( = ?auto_175846 ?auto_175853 ) ) ( not ( = ?auto_175847 ?auto_175853 ) ) ( not ( = ?auto_175848 ?auto_175853 ) ) ( not ( = ?auto_175849 ?auto_175853 ) ) ( not ( = ?auto_175850 ?auto_175853 ) ) ( not ( = ?auto_175851 ?auto_175853 ) ) ( not ( = ?auto_175852 ?auto_175853 ) ) ( HOLDING ?auto_175851 ) ( CLEAR ?auto_175850 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175846 ?auto_175847 ?auto_175848 ?auto_175849 ?auto_175850 ?auto_175851 )
      ( MAKE-7PILE ?auto_175846 ?auto_175847 ?auto_175848 ?auto_175849 ?auto_175850 ?auto_175851 ?auto_175852 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175854 - BLOCK
      ?auto_175855 - BLOCK
      ?auto_175856 - BLOCK
      ?auto_175857 - BLOCK
      ?auto_175858 - BLOCK
      ?auto_175859 - BLOCK
      ?auto_175860 - BLOCK
    )
    :vars
    (
      ?auto_175861 - BLOCK
      ?auto_175862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175854 ) ( ON ?auto_175855 ?auto_175854 ) ( ON ?auto_175856 ?auto_175855 ) ( ON ?auto_175857 ?auto_175856 ) ( ON ?auto_175858 ?auto_175857 ) ( not ( = ?auto_175854 ?auto_175855 ) ) ( not ( = ?auto_175854 ?auto_175856 ) ) ( not ( = ?auto_175854 ?auto_175857 ) ) ( not ( = ?auto_175854 ?auto_175858 ) ) ( not ( = ?auto_175854 ?auto_175859 ) ) ( not ( = ?auto_175854 ?auto_175860 ) ) ( not ( = ?auto_175855 ?auto_175856 ) ) ( not ( = ?auto_175855 ?auto_175857 ) ) ( not ( = ?auto_175855 ?auto_175858 ) ) ( not ( = ?auto_175855 ?auto_175859 ) ) ( not ( = ?auto_175855 ?auto_175860 ) ) ( not ( = ?auto_175856 ?auto_175857 ) ) ( not ( = ?auto_175856 ?auto_175858 ) ) ( not ( = ?auto_175856 ?auto_175859 ) ) ( not ( = ?auto_175856 ?auto_175860 ) ) ( not ( = ?auto_175857 ?auto_175858 ) ) ( not ( = ?auto_175857 ?auto_175859 ) ) ( not ( = ?auto_175857 ?auto_175860 ) ) ( not ( = ?auto_175858 ?auto_175859 ) ) ( not ( = ?auto_175858 ?auto_175860 ) ) ( not ( = ?auto_175859 ?auto_175860 ) ) ( ON ?auto_175860 ?auto_175861 ) ( not ( = ?auto_175854 ?auto_175861 ) ) ( not ( = ?auto_175855 ?auto_175861 ) ) ( not ( = ?auto_175856 ?auto_175861 ) ) ( not ( = ?auto_175857 ?auto_175861 ) ) ( not ( = ?auto_175858 ?auto_175861 ) ) ( not ( = ?auto_175859 ?auto_175861 ) ) ( not ( = ?auto_175860 ?auto_175861 ) ) ( CLEAR ?auto_175858 ) ( ON ?auto_175859 ?auto_175860 ) ( CLEAR ?auto_175859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175862 ) ( ON ?auto_175861 ?auto_175862 ) ( not ( = ?auto_175862 ?auto_175861 ) ) ( not ( = ?auto_175862 ?auto_175860 ) ) ( not ( = ?auto_175862 ?auto_175859 ) ) ( not ( = ?auto_175854 ?auto_175862 ) ) ( not ( = ?auto_175855 ?auto_175862 ) ) ( not ( = ?auto_175856 ?auto_175862 ) ) ( not ( = ?auto_175857 ?auto_175862 ) ) ( not ( = ?auto_175858 ?auto_175862 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175862 ?auto_175861 ?auto_175860 )
      ( MAKE-7PILE ?auto_175854 ?auto_175855 ?auto_175856 ?auto_175857 ?auto_175858 ?auto_175859 ?auto_175860 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175863 - BLOCK
      ?auto_175864 - BLOCK
      ?auto_175865 - BLOCK
      ?auto_175866 - BLOCK
      ?auto_175867 - BLOCK
      ?auto_175868 - BLOCK
      ?auto_175869 - BLOCK
    )
    :vars
    (
      ?auto_175870 - BLOCK
      ?auto_175871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175863 ) ( ON ?auto_175864 ?auto_175863 ) ( ON ?auto_175865 ?auto_175864 ) ( ON ?auto_175866 ?auto_175865 ) ( not ( = ?auto_175863 ?auto_175864 ) ) ( not ( = ?auto_175863 ?auto_175865 ) ) ( not ( = ?auto_175863 ?auto_175866 ) ) ( not ( = ?auto_175863 ?auto_175867 ) ) ( not ( = ?auto_175863 ?auto_175868 ) ) ( not ( = ?auto_175863 ?auto_175869 ) ) ( not ( = ?auto_175864 ?auto_175865 ) ) ( not ( = ?auto_175864 ?auto_175866 ) ) ( not ( = ?auto_175864 ?auto_175867 ) ) ( not ( = ?auto_175864 ?auto_175868 ) ) ( not ( = ?auto_175864 ?auto_175869 ) ) ( not ( = ?auto_175865 ?auto_175866 ) ) ( not ( = ?auto_175865 ?auto_175867 ) ) ( not ( = ?auto_175865 ?auto_175868 ) ) ( not ( = ?auto_175865 ?auto_175869 ) ) ( not ( = ?auto_175866 ?auto_175867 ) ) ( not ( = ?auto_175866 ?auto_175868 ) ) ( not ( = ?auto_175866 ?auto_175869 ) ) ( not ( = ?auto_175867 ?auto_175868 ) ) ( not ( = ?auto_175867 ?auto_175869 ) ) ( not ( = ?auto_175868 ?auto_175869 ) ) ( ON ?auto_175869 ?auto_175870 ) ( not ( = ?auto_175863 ?auto_175870 ) ) ( not ( = ?auto_175864 ?auto_175870 ) ) ( not ( = ?auto_175865 ?auto_175870 ) ) ( not ( = ?auto_175866 ?auto_175870 ) ) ( not ( = ?auto_175867 ?auto_175870 ) ) ( not ( = ?auto_175868 ?auto_175870 ) ) ( not ( = ?auto_175869 ?auto_175870 ) ) ( ON ?auto_175868 ?auto_175869 ) ( CLEAR ?auto_175868 ) ( ON-TABLE ?auto_175871 ) ( ON ?auto_175870 ?auto_175871 ) ( not ( = ?auto_175871 ?auto_175870 ) ) ( not ( = ?auto_175871 ?auto_175869 ) ) ( not ( = ?auto_175871 ?auto_175868 ) ) ( not ( = ?auto_175863 ?auto_175871 ) ) ( not ( = ?auto_175864 ?auto_175871 ) ) ( not ( = ?auto_175865 ?auto_175871 ) ) ( not ( = ?auto_175866 ?auto_175871 ) ) ( not ( = ?auto_175867 ?auto_175871 ) ) ( HOLDING ?auto_175867 ) ( CLEAR ?auto_175866 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175863 ?auto_175864 ?auto_175865 ?auto_175866 ?auto_175867 )
      ( MAKE-7PILE ?auto_175863 ?auto_175864 ?auto_175865 ?auto_175866 ?auto_175867 ?auto_175868 ?auto_175869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175872 - BLOCK
      ?auto_175873 - BLOCK
      ?auto_175874 - BLOCK
      ?auto_175875 - BLOCK
      ?auto_175876 - BLOCK
      ?auto_175877 - BLOCK
      ?auto_175878 - BLOCK
    )
    :vars
    (
      ?auto_175880 - BLOCK
      ?auto_175879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175872 ) ( ON ?auto_175873 ?auto_175872 ) ( ON ?auto_175874 ?auto_175873 ) ( ON ?auto_175875 ?auto_175874 ) ( not ( = ?auto_175872 ?auto_175873 ) ) ( not ( = ?auto_175872 ?auto_175874 ) ) ( not ( = ?auto_175872 ?auto_175875 ) ) ( not ( = ?auto_175872 ?auto_175876 ) ) ( not ( = ?auto_175872 ?auto_175877 ) ) ( not ( = ?auto_175872 ?auto_175878 ) ) ( not ( = ?auto_175873 ?auto_175874 ) ) ( not ( = ?auto_175873 ?auto_175875 ) ) ( not ( = ?auto_175873 ?auto_175876 ) ) ( not ( = ?auto_175873 ?auto_175877 ) ) ( not ( = ?auto_175873 ?auto_175878 ) ) ( not ( = ?auto_175874 ?auto_175875 ) ) ( not ( = ?auto_175874 ?auto_175876 ) ) ( not ( = ?auto_175874 ?auto_175877 ) ) ( not ( = ?auto_175874 ?auto_175878 ) ) ( not ( = ?auto_175875 ?auto_175876 ) ) ( not ( = ?auto_175875 ?auto_175877 ) ) ( not ( = ?auto_175875 ?auto_175878 ) ) ( not ( = ?auto_175876 ?auto_175877 ) ) ( not ( = ?auto_175876 ?auto_175878 ) ) ( not ( = ?auto_175877 ?auto_175878 ) ) ( ON ?auto_175878 ?auto_175880 ) ( not ( = ?auto_175872 ?auto_175880 ) ) ( not ( = ?auto_175873 ?auto_175880 ) ) ( not ( = ?auto_175874 ?auto_175880 ) ) ( not ( = ?auto_175875 ?auto_175880 ) ) ( not ( = ?auto_175876 ?auto_175880 ) ) ( not ( = ?auto_175877 ?auto_175880 ) ) ( not ( = ?auto_175878 ?auto_175880 ) ) ( ON ?auto_175877 ?auto_175878 ) ( ON-TABLE ?auto_175879 ) ( ON ?auto_175880 ?auto_175879 ) ( not ( = ?auto_175879 ?auto_175880 ) ) ( not ( = ?auto_175879 ?auto_175878 ) ) ( not ( = ?auto_175879 ?auto_175877 ) ) ( not ( = ?auto_175872 ?auto_175879 ) ) ( not ( = ?auto_175873 ?auto_175879 ) ) ( not ( = ?auto_175874 ?auto_175879 ) ) ( not ( = ?auto_175875 ?auto_175879 ) ) ( not ( = ?auto_175876 ?auto_175879 ) ) ( CLEAR ?auto_175875 ) ( ON ?auto_175876 ?auto_175877 ) ( CLEAR ?auto_175876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175879 ?auto_175880 ?auto_175878 ?auto_175877 )
      ( MAKE-7PILE ?auto_175872 ?auto_175873 ?auto_175874 ?auto_175875 ?auto_175876 ?auto_175877 ?auto_175878 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175881 - BLOCK
      ?auto_175882 - BLOCK
      ?auto_175883 - BLOCK
      ?auto_175884 - BLOCK
      ?auto_175885 - BLOCK
      ?auto_175886 - BLOCK
      ?auto_175887 - BLOCK
    )
    :vars
    (
      ?auto_175888 - BLOCK
      ?auto_175889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175881 ) ( ON ?auto_175882 ?auto_175881 ) ( ON ?auto_175883 ?auto_175882 ) ( not ( = ?auto_175881 ?auto_175882 ) ) ( not ( = ?auto_175881 ?auto_175883 ) ) ( not ( = ?auto_175881 ?auto_175884 ) ) ( not ( = ?auto_175881 ?auto_175885 ) ) ( not ( = ?auto_175881 ?auto_175886 ) ) ( not ( = ?auto_175881 ?auto_175887 ) ) ( not ( = ?auto_175882 ?auto_175883 ) ) ( not ( = ?auto_175882 ?auto_175884 ) ) ( not ( = ?auto_175882 ?auto_175885 ) ) ( not ( = ?auto_175882 ?auto_175886 ) ) ( not ( = ?auto_175882 ?auto_175887 ) ) ( not ( = ?auto_175883 ?auto_175884 ) ) ( not ( = ?auto_175883 ?auto_175885 ) ) ( not ( = ?auto_175883 ?auto_175886 ) ) ( not ( = ?auto_175883 ?auto_175887 ) ) ( not ( = ?auto_175884 ?auto_175885 ) ) ( not ( = ?auto_175884 ?auto_175886 ) ) ( not ( = ?auto_175884 ?auto_175887 ) ) ( not ( = ?auto_175885 ?auto_175886 ) ) ( not ( = ?auto_175885 ?auto_175887 ) ) ( not ( = ?auto_175886 ?auto_175887 ) ) ( ON ?auto_175887 ?auto_175888 ) ( not ( = ?auto_175881 ?auto_175888 ) ) ( not ( = ?auto_175882 ?auto_175888 ) ) ( not ( = ?auto_175883 ?auto_175888 ) ) ( not ( = ?auto_175884 ?auto_175888 ) ) ( not ( = ?auto_175885 ?auto_175888 ) ) ( not ( = ?auto_175886 ?auto_175888 ) ) ( not ( = ?auto_175887 ?auto_175888 ) ) ( ON ?auto_175886 ?auto_175887 ) ( ON-TABLE ?auto_175889 ) ( ON ?auto_175888 ?auto_175889 ) ( not ( = ?auto_175889 ?auto_175888 ) ) ( not ( = ?auto_175889 ?auto_175887 ) ) ( not ( = ?auto_175889 ?auto_175886 ) ) ( not ( = ?auto_175881 ?auto_175889 ) ) ( not ( = ?auto_175882 ?auto_175889 ) ) ( not ( = ?auto_175883 ?auto_175889 ) ) ( not ( = ?auto_175884 ?auto_175889 ) ) ( not ( = ?auto_175885 ?auto_175889 ) ) ( ON ?auto_175885 ?auto_175886 ) ( CLEAR ?auto_175885 ) ( HOLDING ?auto_175884 ) ( CLEAR ?auto_175883 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175881 ?auto_175882 ?auto_175883 ?auto_175884 )
      ( MAKE-7PILE ?auto_175881 ?auto_175882 ?auto_175883 ?auto_175884 ?auto_175885 ?auto_175886 ?auto_175887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175890 - BLOCK
      ?auto_175891 - BLOCK
      ?auto_175892 - BLOCK
      ?auto_175893 - BLOCK
      ?auto_175894 - BLOCK
      ?auto_175895 - BLOCK
      ?auto_175896 - BLOCK
    )
    :vars
    (
      ?auto_175897 - BLOCK
      ?auto_175898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175890 ) ( ON ?auto_175891 ?auto_175890 ) ( ON ?auto_175892 ?auto_175891 ) ( not ( = ?auto_175890 ?auto_175891 ) ) ( not ( = ?auto_175890 ?auto_175892 ) ) ( not ( = ?auto_175890 ?auto_175893 ) ) ( not ( = ?auto_175890 ?auto_175894 ) ) ( not ( = ?auto_175890 ?auto_175895 ) ) ( not ( = ?auto_175890 ?auto_175896 ) ) ( not ( = ?auto_175891 ?auto_175892 ) ) ( not ( = ?auto_175891 ?auto_175893 ) ) ( not ( = ?auto_175891 ?auto_175894 ) ) ( not ( = ?auto_175891 ?auto_175895 ) ) ( not ( = ?auto_175891 ?auto_175896 ) ) ( not ( = ?auto_175892 ?auto_175893 ) ) ( not ( = ?auto_175892 ?auto_175894 ) ) ( not ( = ?auto_175892 ?auto_175895 ) ) ( not ( = ?auto_175892 ?auto_175896 ) ) ( not ( = ?auto_175893 ?auto_175894 ) ) ( not ( = ?auto_175893 ?auto_175895 ) ) ( not ( = ?auto_175893 ?auto_175896 ) ) ( not ( = ?auto_175894 ?auto_175895 ) ) ( not ( = ?auto_175894 ?auto_175896 ) ) ( not ( = ?auto_175895 ?auto_175896 ) ) ( ON ?auto_175896 ?auto_175897 ) ( not ( = ?auto_175890 ?auto_175897 ) ) ( not ( = ?auto_175891 ?auto_175897 ) ) ( not ( = ?auto_175892 ?auto_175897 ) ) ( not ( = ?auto_175893 ?auto_175897 ) ) ( not ( = ?auto_175894 ?auto_175897 ) ) ( not ( = ?auto_175895 ?auto_175897 ) ) ( not ( = ?auto_175896 ?auto_175897 ) ) ( ON ?auto_175895 ?auto_175896 ) ( ON-TABLE ?auto_175898 ) ( ON ?auto_175897 ?auto_175898 ) ( not ( = ?auto_175898 ?auto_175897 ) ) ( not ( = ?auto_175898 ?auto_175896 ) ) ( not ( = ?auto_175898 ?auto_175895 ) ) ( not ( = ?auto_175890 ?auto_175898 ) ) ( not ( = ?auto_175891 ?auto_175898 ) ) ( not ( = ?auto_175892 ?auto_175898 ) ) ( not ( = ?auto_175893 ?auto_175898 ) ) ( not ( = ?auto_175894 ?auto_175898 ) ) ( ON ?auto_175894 ?auto_175895 ) ( CLEAR ?auto_175892 ) ( ON ?auto_175893 ?auto_175894 ) ( CLEAR ?auto_175893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175898 ?auto_175897 ?auto_175896 ?auto_175895 ?auto_175894 )
      ( MAKE-7PILE ?auto_175890 ?auto_175891 ?auto_175892 ?auto_175893 ?auto_175894 ?auto_175895 ?auto_175896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175899 - BLOCK
      ?auto_175900 - BLOCK
      ?auto_175901 - BLOCK
      ?auto_175902 - BLOCK
      ?auto_175903 - BLOCK
      ?auto_175904 - BLOCK
      ?auto_175905 - BLOCK
    )
    :vars
    (
      ?auto_175906 - BLOCK
      ?auto_175907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175899 ) ( ON ?auto_175900 ?auto_175899 ) ( not ( = ?auto_175899 ?auto_175900 ) ) ( not ( = ?auto_175899 ?auto_175901 ) ) ( not ( = ?auto_175899 ?auto_175902 ) ) ( not ( = ?auto_175899 ?auto_175903 ) ) ( not ( = ?auto_175899 ?auto_175904 ) ) ( not ( = ?auto_175899 ?auto_175905 ) ) ( not ( = ?auto_175900 ?auto_175901 ) ) ( not ( = ?auto_175900 ?auto_175902 ) ) ( not ( = ?auto_175900 ?auto_175903 ) ) ( not ( = ?auto_175900 ?auto_175904 ) ) ( not ( = ?auto_175900 ?auto_175905 ) ) ( not ( = ?auto_175901 ?auto_175902 ) ) ( not ( = ?auto_175901 ?auto_175903 ) ) ( not ( = ?auto_175901 ?auto_175904 ) ) ( not ( = ?auto_175901 ?auto_175905 ) ) ( not ( = ?auto_175902 ?auto_175903 ) ) ( not ( = ?auto_175902 ?auto_175904 ) ) ( not ( = ?auto_175902 ?auto_175905 ) ) ( not ( = ?auto_175903 ?auto_175904 ) ) ( not ( = ?auto_175903 ?auto_175905 ) ) ( not ( = ?auto_175904 ?auto_175905 ) ) ( ON ?auto_175905 ?auto_175906 ) ( not ( = ?auto_175899 ?auto_175906 ) ) ( not ( = ?auto_175900 ?auto_175906 ) ) ( not ( = ?auto_175901 ?auto_175906 ) ) ( not ( = ?auto_175902 ?auto_175906 ) ) ( not ( = ?auto_175903 ?auto_175906 ) ) ( not ( = ?auto_175904 ?auto_175906 ) ) ( not ( = ?auto_175905 ?auto_175906 ) ) ( ON ?auto_175904 ?auto_175905 ) ( ON-TABLE ?auto_175907 ) ( ON ?auto_175906 ?auto_175907 ) ( not ( = ?auto_175907 ?auto_175906 ) ) ( not ( = ?auto_175907 ?auto_175905 ) ) ( not ( = ?auto_175907 ?auto_175904 ) ) ( not ( = ?auto_175899 ?auto_175907 ) ) ( not ( = ?auto_175900 ?auto_175907 ) ) ( not ( = ?auto_175901 ?auto_175907 ) ) ( not ( = ?auto_175902 ?auto_175907 ) ) ( not ( = ?auto_175903 ?auto_175907 ) ) ( ON ?auto_175903 ?auto_175904 ) ( ON ?auto_175902 ?auto_175903 ) ( CLEAR ?auto_175902 ) ( HOLDING ?auto_175901 ) ( CLEAR ?auto_175900 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175899 ?auto_175900 ?auto_175901 )
      ( MAKE-7PILE ?auto_175899 ?auto_175900 ?auto_175901 ?auto_175902 ?auto_175903 ?auto_175904 ?auto_175905 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175908 - BLOCK
      ?auto_175909 - BLOCK
      ?auto_175910 - BLOCK
      ?auto_175911 - BLOCK
      ?auto_175912 - BLOCK
      ?auto_175913 - BLOCK
      ?auto_175914 - BLOCK
    )
    :vars
    (
      ?auto_175916 - BLOCK
      ?auto_175915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175908 ) ( ON ?auto_175909 ?auto_175908 ) ( not ( = ?auto_175908 ?auto_175909 ) ) ( not ( = ?auto_175908 ?auto_175910 ) ) ( not ( = ?auto_175908 ?auto_175911 ) ) ( not ( = ?auto_175908 ?auto_175912 ) ) ( not ( = ?auto_175908 ?auto_175913 ) ) ( not ( = ?auto_175908 ?auto_175914 ) ) ( not ( = ?auto_175909 ?auto_175910 ) ) ( not ( = ?auto_175909 ?auto_175911 ) ) ( not ( = ?auto_175909 ?auto_175912 ) ) ( not ( = ?auto_175909 ?auto_175913 ) ) ( not ( = ?auto_175909 ?auto_175914 ) ) ( not ( = ?auto_175910 ?auto_175911 ) ) ( not ( = ?auto_175910 ?auto_175912 ) ) ( not ( = ?auto_175910 ?auto_175913 ) ) ( not ( = ?auto_175910 ?auto_175914 ) ) ( not ( = ?auto_175911 ?auto_175912 ) ) ( not ( = ?auto_175911 ?auto_175913 ) ) ( not ( = ?auto_175911 ?auto_175914 ) ) ( not ( = ?auto_175912 ?auto_175913 ) ) ( not ( = ?auto_175912 ?auto_175914 ) ) ( not ( = ?auto_175913 ?auto_175914 ) ) ( ON ?auto_175914 ?auto_175916 ) ( not ( = ?auto_175908 ?auto_175916 ) ) ( not ( = ?auto_175909 ?auto_175916 ) ) ( not ( = ?auto_175910 ?auto_175916 ) ) ( not ( = ?auto_175911 ?auto_175916 ) ) ( not ( = ?auto_175912 ?auto_175916 ) ) ( not ( = ?auto_175913 ?auto_175916 ) ) ( not ( = ?auto_175914 ?auto_175916 ) ) ( ON ?auto_175913 ?auto_175914 ) ( ON-TABLE ?auto_175915 ) ( ON ?auto_175916 ?auto_175915 ) ( not ( = ?auto_175915 ?auto_175916 ) ) ( not ( = ?auto_175915 ?auto_175914 ) ) ( not ( = ?auto_175915 ?auto_175913 ) ) ( not ( = ?auto_175908 ?auto_175915 ) ) ( not ( = ?auto_175909 ?auto_175915 ) ) ( not ( = ?auto_175910 ?auto_175915 ) ) ( not ( = ?auto_175911 ?auto_175915 ) ) ( not ( = ?auto_175912 ?auto_175915 ) ) ( ON ?auto_175912 ?auto_175913 ) ( ON ?auto_175911 ?auto_175912 ) ( CLEAR ?auto_175909 ) ( ON ?auto_175910 ?auto_175911 ) ( CLEAR ?auto_175910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175915 ?auto_175916 ?auto_175914 ?auto_175913 ?auto_175912 ?auto_175911 )
      ( MAKE-7PILE ?auto_175908 ?auto_175909 ?auto_175910 ?auto_175911 ?auto_175912 ?auto_175913 ?auto_175914 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175917 - BLOCK
      ?auto_175918 - BLOCK
      ?auto_175919 - BLOCK
      ?auto_175920 - BLOCK
      ?auto_175921 - BLOCK
      ?auto_175922 - BLOCK
      ?auto_175923 - BLOCK
    )
    :vars
    (
      ?auto_175924 - BLOCK
      ?auto_175925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175917 ) ( not ( = ?auto_175917 ?auto_175918 ) ) ( not ( = ?auto_175917 ?auto_175919 ) ) ( not ( = ?auto_175917 ?auto_175920 ) ) ( not ( = ?auto_175917 ?auto_175921 ) ) ( not ( = ?auto_175917 ?auto_175922 ) ) ( not ( = ?auto_175917 ?auto_175923 ) ) ( not ( = ?auto_175918 ?auto_175919 ) ) ( not ( = ?auto_175918 ?auto_175920 ) ) ( not ( = ?auto_175918 ?auto_175921 ) ) ( not ( = ?auto_175918 ?auto_175922 ) ) ( not ( = ?auto_175918 ?auto_175923 ) ) ( not ( = ?auto_175919 ?auto_175920 ) ) ( not ( = ?auto_175919 ?auto_175921 ) ) ( not ( = ?auto_175919 ?auto_175922 ) ) ( not ( = ?auto_175919 ?auto_175923 ) ) ( not ( = ?auto_175920 ?auto_175921 ) ) ( not ( = ?auto_175920 ?auto_175922 ) ) ( not ( = ?auto_175920 ?auto_175923 ) ) ( not ( = ?auto_175921 ?auto_175922 ) ) ( not ( = ?auto_175921 ?auto_175923 ) ) ( not ( = ?auto_175922 ?auto_175923 ) ) ( ON ?auto_175923 ?auto_175924 ) ( not ( = ?auto_175917 ?auto_175924 ) ) ( not ( = ?auto_175918 ?auto_175924 ) ) ( not ( = ?auto_175919 ?auto_175924 ) ) ( not ( = ?auto_175920 ?auto_175924 ) ) ( not ( = ?auto_175921 ?auto_175924 ) ) ( not ( = ?auto_175922 ?auto_175924 ) ) ( not ( = ?auto_175923 ?auto_175924 ) ) ( ON ?auto_175922 ?auto_175923 ) ( ON-TABLE ?auto_175925 ) ( ON ?auto_175924 ?auto_175925 ) ( not ( = ?auto_175925 ?auto_175924 ) ) ( not ( = ?auto_175925 ?auto_175923 ) ) ( not ( = ?auto_175925 ?auto_175922 ) ) ( not ( = ?auto_175917 ?auto_175925 ) ) ( not ( = ?auto_175918 ?auto_175925 ) ) ( not ( = ?auto_175919 ?auto_175925 ) ) ( not ( = ?auto_175920 ?auto_175925 ) ) ( not ( = ?auto_175921 ?auto_175925 ) ) ( ON ?auto_175921 ?auto_175922 ) ( ON ?auto_175920 ?auto_175921 ) ( ON ?auto_175919 ?auto_175920 ) ( CLEAR ?auto_175919 ) ( HOLDING ?auto_175918 ) ( CLEAR ?auto_175917 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175917 ?auto_175918 )
      ( MAKE-7PILE ?auto_175917 ?auto_175918 ?auto_175919 ?auto_175920 ?auto_175921 ?auto_175922 ?auto_175923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175926 - BLOCK
      ?auto_175927 - BLOCK
      ?auto_175928 - BLOCK
      ?auto_175929 - BLOCK
      ?auto_175930 - BLOCK
      ?auto_175931 - BLOCK
      ?auto_175932 - BLOCK
    )
    :vars
    (
      ?auto_175933 - BLOCK
      ?auto_175934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_175926 ) ( not ( = ?auto_175926 ?auto_175927 ) ) ( not ( = ?auto_175926 ?auto_175928 ) ) ( not ( = ?auto_175926 ?auto_175929 ) ) ( not ( = ?auto_175926 ?auto_175930 ) ) ( not ( = ?auto_175926 ?auto_175931 ) ) ( not ( = ?auto_175926 ?auto_175932 ) ) ( not ( = ?auto_175927 ?auto_175928 ) ) ( not ( = ?auto_175927 ?auto_175929 ) ) ( not ( = ?auto_175927 ?auto_175930 ) ) ( not ( = ?auto_175927 ?auto_175931 ) ) ( not ( = ?auto_175927 ?auto_175932 ) ) ( not ( = ?auto_175928 ?auto_175929 ) ) ( not ( = ?auto_175928 ?auto_175930 ) ) ( not ( = ?auto_175928 ?auto_175931 ) ) ( not ( = ?auto_175928 ?auto_175932 ) ) ( not ( = ?auto_175929 ?auto_175930 ) ) ( not ( = ?auto_175929 ?auto_175931 ) ) ( not ( = ?auto_175929 ?auto_175932 ) ) ( not ( = ?auto_175930 ?auto_175931 ) ) ( not ( = ?auto_175930 ?auto_175932 ) ) ( not ( = ?auto_175931 ?auto_175932 ) ) ( ON ?auto_175932 ?auto_175933 ) ( not ( = ?auto_175926 ?auto_175933 ) ) ( not ( = ?auto_175927 ?auto_175933 ) ) ( not ( = ?auto_175928 ?auto_175933 ) ) ( not ( = ?auto_175929 ?auto_175933 ) ) ( not ( = ?auto_175930 ?auto_175933 ) ) ( not ( = ?auto_175931 ?auto_175933 ) ) ( not ( = ?auto_175932 ?auto_175933 ) ) ( ON ?auto_175931 ?auto_175932 ) ( ON-TABLE ?auto_175934 ) ( ON ?auto_175933 ?auto_175934 ) ( not ( = ?auto_175934 ?auto_175933 ) ) ( not ( = ?auto_175934 ?auto_175932 ) ) ( not ( = ?auto_175934 ?auto_175931 ) ) ( not ( = ?auto_175926 ?auto_175934 ) ) ( not ( = ?auto_175927 ?auto_175934 ) ) ( not ( = ?auto_175928 ?auto_175934 ) ) ( not ( = ?auto_175929 ?auto_175934 ) ) ( not ( = ?auto_175930 ?auto_175934 ) ) ( ON ?auto_175930 ?auto_175931 ) ( ON ?auto_175929 ?auto_175930 ) ( ON ?auto_175928 ?auto_175929 ) ( CLEAR ?auto_175926 ) ( ON ?auto_175927 ?auto_175928 ) ( CLEAR ?auto_175927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175934 ?auto_175933 ?auto_175932 ?auto_175931 ?auto_175930 ?auto_175929 ?auto_175928 )
      ( MAKE-7PILE ?auto_175926 ?auto_175927 ?auto_175928 ?auto_175929 ?auto_175930 ?auto_175931 ?auto_175932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175935 - BLOCK
      ?auto_175936 - BLOCK
      ?auto_175937 - BLOCK
      ?auto_175938 - BLOCK
      ?auto_175939 - BLOCK
      ?auto_175940 - BLOCK
      ?auto_175941 - BLOCK
    )
    :vars
    (
      ?auto_175943 - BLOCK
      ?auto_175942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175935 ?auto_175936 ) ) ( not ( = ?auto_175935 ?auto_175937 ) ) ( not ( = ?auto_175935 ?auto_175938 ) ) ( not ( = ?auto_175935 ?auto_175939 ) ) ( not ( = ?auto_175935 ?auto_175940 ) ) ( not ( = ?auto_175935 ?auto_175941 ) ) ( not ( = ?auto_175936 ?auto_175937 ) ) ( not ( = ?auto_175936 ?auto_175938 ) ) ( not ( = ?auto_175936 ?auto_175939 ) ) ( not ( = ?auto_175936 ?auto_175940 ) ) ( not ( = ?auto_175936 ?auto_175941 ) ) ( not ( = ?auto_175937 ?auto_175938 ) ) ( not ( = ?auto_175937 ?auto_175939 ) ) ( not ( = ?auto_175937 ?auto_175940 ) ) ( not ( = ?auto_175937 ?auto_175941 ) ) ( not ( = ?auto_175938 ?auto_175939 ) ) ( not ( = ?auto_175938 ?auto_175940 ) ) ( not ( = ?auto_175938 ?auto_175941 ) ) ( not ( = ?auto_175939 ?auto_175940 ) ) ( not ( = ?auto_175939 ?auto_175941 ) ) ( not ( = ?auto_175940 ?auto_175941 ) ) ( ON ?auto_175941 ?auto_175943 ) ( not ( = ?auto_175935 ?auto_175943 ) ) ( not ( = ?auto_175936 ?auto_175943 ) ) ( not ( = ?auto_175937 ?auto_175943 ) ) ( not ( = ?auto_175938 ?auto_175943 ) ) ( not ( = ?auto_175939 ?auto_175943 ) ) ( not ( = ?auto_175940 ?auto_175943 ) ) ( not ( = ?auto_175941 ?auto_175943 ) ) ( ON ?auto_175940 ?auto_175941 ) ( ON-TABLE ?auto_175942 ) ( ON ?auto_175943 ?auto_175942 ) ( not ( = ?auto_175942 ?auto_175943 ) ) ( not ( = ?auto_175942 ?auto_175941 ) ) ( not ( = ?auto_175942 ?auto_175940 ) ) ( not ( = ?auto_175935 ?auto_175942 ) ) ( not ( = ?auto_175936 ?auto_175942 ) ) ( not ( = ?auto_175937 ?auto_175942 ) ) ( not ( = ?auto_175938 ?auto_175942 ) ) ( not ( = ?auto_175939 ?auto_175942 ) ) ( ON ?auto_175939 ?auto_175940 ) ( ON ?auto_175938 ?auto_175939 ) ( ON ?auto_175937 ?auto_175938 ) ( ON ?auto_175936 ?auto_175937 ) ( CLEAR ?auto_175936 ) ( HOLDING ?auto_175935 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175935 )
      ( MAKE-7PILE ?auto_175935 ?auto_175936 ?auto_175937 ?auto_175938 ?auto_175939 ?auto_175940 ?auto_175941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175944 - BLOCK
      ?auto_175945 - BLOCK
      ?auto_175946 - BLOCK
      ?auto_175947 - BLOCK
      ?auto_175948 - BLOCK
      ?auto_175949 - BLOCK
      ?auto_175950 - BLOCK
    )
    :vars
    (
      ?auto_175951 - BLOCK
      ?auto_175952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175944 ?auto_175945 ) ) ( not ( = ?auto_175944 ?auto_175946 ) ) ( not ( = ?auto_175944 ?auto_175947 ) ) ( not ( = ?auto_175944 ?auto_175948 ) ) ( not ( = ?auto_175944 ?auto_175949 ) ) ( not ( = ?auto_175944 ?auto_175950 ) ) ( not ( = ?auto_175945 ?auto_175946 ) ) ( not ( = ?auto_175945 ?auto_175947 ) ) ( not ( = ?auto_175945 ?auto_175948 ) ) ( not ( = ?auto_175945 ?auto_175949 ) ) ( not ( = ?auto_175945 ?auto_175950 ) ) ( not ( = ?auto_175946 ?auto_175947 ) ) ( not ( = ?auto_175946 ?auto_175948 ) ) ( not ( = ?auto_175946 ?auto_175949 ) ) ( not ( = ?auto_175946 ?auto_175950 ) ) ( not ( = ?auto_175947 ?auto_175948 ) ) ( not ( = ?auto_175947 ?auto_175949 ) ) ( not ( = ?auto_175947 ?auto_175950 ) ) ( not ( = ?auto_175948 ?auto_175949 ) ) ( not ( = ?auto_175948 ?auto_175950 ) ) ( not ( = ?auto_175949 ?auto_175950 ) ) ( ON ?auto_175950 ?auto_175951 ) ( not ( = ?auto_175944 ?auto_175951 ) ) ( not ( = ?auto_175945 ?auto_175951 ) ) ( not ( = ?auto_175946 ?auto_175951 ) ) ( not ( = ?auto_175947 ?auto_175951 ) ) ( not ( = ?auto_175948 ?auto_175951 ) ) ( not ( = ?auto_175949 ?auto_175951 ) ) ( not ( = ?auto_175950 ?auto_175951 ) ) ( ON ?auto_175949 ?auto_175950 ) ( ON-TABLE ?auto_175952 ) ( ON ?auto_175951 ?auto_175952 ) ( not ( = ?auto_175952 ?auto_175951 ) ) ( not ( = ?auto_175952 ?auto_175950 ) ) ( not ( = ?auto_175952 ?auto_175949 ) ) ( not ( = ?auto_175944 ?auto_175952 ) ) ( not ( = ?auto_175945 ?auto_175952 ) ) ( not ( = ?auto_175946 ?auto_175952 ) ) ( not ( = ?auto_175947 ?auto_175952 ) ) ( not ( = ?auto_175948 ?auto_175952 ) ) ( ON ?auto_175948 ?auto_175949 ) ( ON ?auto_175947 ?auto_175948 ) ( ON ?auto_175946 ?auto_175947 ) ( ON ?auto_175945 ?auto_175946 ) ( ON ?auto_175944 ?auto_175945 ) ( CLEAR ?auto_175944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175952 ?auto_175951 ?auto_175950 ?auto_175949 ?auto_175948 ?auto_175947 ?auto_175946 ?auto_175945 )
      ( MAKE-7PILE ?auto_175944 ?auto_175945 ?auto_175946 ?auto_175947 ?auto_175948 ?auto_175949 ?auto_175950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175954 - BLOCK
    )
    :vars
    (
      ?auto_175955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175955 ?auto_175954 ) ( CLEAR ?auto_175955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175954 ) ( not ( = ?auto_175954 ?auto_175955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175955 ?auto_175954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175956 - BLOCK
    )
    :vars
    (
      ?auto_175957 - BLOCK
      ?auto_175958 - BLOCK
      ?auto_175959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175957 ?auto_175956 ) ( CLEAR ?auto_175957 ) ( ON-TABLE ?auto_175956 ) ( not ( = ?auto_175956 ?auto_175957 ) ) ( HOLDING ?auto_175958 ) ( CLEAR ?auto_175959 ) ( not ( = ?auto_175956 ?auto_175958 ) ) ( not ( = ?auto_175956 ?auto_175959 ) ) ( not ( = ?auto_175957 ?auto_175958 ) ) ( not ( = ?auto_175957 ?auto_175959 ) ) ( not ( = ?auto_175958 ?auto_175959 ) ) )
    :subtasks
    ( ( !STACK ?auto_175958 ?auto_175959 )
      ( MAKE-1PILE ?auto_175956 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175960 - BLOCK
    )
    :vars
    (
      ?auto_175961 - BLOCK
      ?auto_175962 - BLOCK
      ?auto_175963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175961 ?auto_175960 ) ( ON-TABLE ?auto_175960 ) ( not ( = ?auto_175960 ?auto_175961 ) ) ( CLEAR ?auto_175962 ) ( not ( = ?auto_175960 ?auto_175963 ) ) ( not ( = ?auto_175960 ?auto_175962 ) ) ( not ( = ?auto_175961 ?auto_175963 ) ) ( not ( = ?auto_175961 ?auto_175962 ) ) ( not ( = ?auto_175963 ?auto_175962 ) ) ( ON ?auto_175963 ?auto_175961 ) ( CLEAR ?auto_175963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175960 ?auto_175961 )
      ( MAKE-1PILE ?auto_175960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175964 - BLOCK
    )
    :vars
    (
      ?auto_175967 - BLOCK
      ?auto_175965 - BLOCK
      ?auto_175966 - BLOCK
      ?auto_175972 - BLOCK
      ?auto_175971 - BLOCK
      ?auto_175969 - BLOCK
      ?auto_175968 - BLOCK
      ?auto_175970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175967 ?auto_175964 ) ( ON-TABLE ?auto_175964 ) ( not ( = ?auto_175964 ?auto_175967 ) ) ( not ( = ?auto_175964 ?auto_175965 ) ) ( not ( = ?auto_175964 ?auto_175966 ) ) ( not ( = ?auto_175967 ?auto_175965 ) ) ( not ( = ?auto_175967 ?auto_175966 ) ) ( not ( = ?auto_175965 ?auto_175966 ) ) ( ON ?auto_175965 ?auto_175967 ) ( CLEAR ?auto_175965 ) ( HOLDING ?auto_175966 ) ( CLEAR ?auto_175972 ) ( ON-TABLE ?auto_175971 ) ( ON ?auto_175969 ?auto_175971 ) ( ON ?auto_175968 ?auto_175969 ) ( ON ?auto_175970 ?auto_175968 ) ( ON ?auto_175972 ?auto_175970 ) ( not ( = ?auto_175971 ?auto_175969 ) ) ( not ( = ?auto_175971 ?auto_175968 ) ) ( not ( = ?auto_175971 ?auto_175970 ) ) ( not ( = ?auto_175971 ?auto_175972 ) ) ( not ( = ?auto_175971 ?auto_175966 ) ) ( not ( = ?auto_175969 ?auto_175968 ) ) ( not ( = ?auto_175969 ?auto_175970 ) ) ( not ( = ?auto_175969 ?auto_175972 ) ) ( not ( = ?auto_175969 ?auto_175966 ) ) ( not ( = ?auto_175968 ?auto_175970 ) ) ( not ( = ?auto_175968 ?auto_175972 ) ) ( not ( = ?auto_175968 ?auto_175966 ) ) ( not ( = ?auto_175970 ?auto_175972 ) ) ( not ( = ?auto_175970 ?auto_175966 ) ) ( not ( = ?auto_175972 ?auto_175966 ) ) ( not ( = ?auto_175964 ?auto_175972 ) ) ( not ( = ?auto_175964 ?auto_175971 ) ) ( not ( = ?auto_175964 ?auto_175969 ) ) ( not ( = ?auto_175964 ?auto_175968 ) ) ( not ( = ?auto_175964 ?auto_175970 ) ) ( not ( = ?auto_175967 ?auto_175972 ) ) ( not ( = ?auto_175967 ?auto_175971 ) ) ( not ( = ?auto_175967 ?auto_175969 ) ) ( not ( = ?auto_175967 ?auto_175968 ) ) ( not ( = ?auto_175967 ?auto_175970 ) ) ( not ( = ?auto_175965 ?auto_175972 ) ) ( not ( = ?auto_175965 ?auto_175971 ) ) ( not ( = ?auto_175965 ?auto_175969 ) ) ( not ( = ?auto_175965 ?auto_175968 ) ) ( not ( = ?auto_175965 ?auto_175970 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175971 ?auto_175969 ?auto_175968 ?auto_175970 ?auto_175972 ?auto_175966 )
      ( MAKE-1PILE ?auto_175964 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175973 - BLOCK
    )
    :vars
    (
      ?auto_175981 - BLOCK
      ?auto_175978 - BLOCK
      ?auto_175979 - BLOCK
      ?auto_175977 - BLOCK
      ?auto_175976 - BLOCK
      ?auto_175975 - BLOCK
      ?auto_175980 - BLOCK
      ?auto_175974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175981 ?auto_175973 ) ( ON-TABLE ?auto_175973 ) ( not ( = ?auto_175973 ?auto_175981 ) ) ( not ( = ?auto_175973 ?auto_175978 ) ) ( not ( = ?auto_175973 ?auto_175979 ) ) ( not ( = ?auto_175981 ?auto_175978 ) ) ( not ( = ?auto_175981 ?auto_175979 ) ) ( not ( = ?auto_175978 ?auto_175979 ) ) ( ON ?auto_175978 ?auto_175981 ) ( CLEAR ?auto_175977 ) ( ON-TABLE ?auto_175976 ) ( ON ?auto_175975 ?auto_175976 ) ( ON ?auto_175980 ?auto_175975 ) ( ON ?auto_175974 ?auto_175980 ) ( ON ?auto_175977 ?auto_175974 ) ( not ( = ?auto_175976 ?auto_175975 ) ) ( not ( = ?auto_175976 ?auto_175980 ) ) ( not ( = ?auto_175976 ?auto_175974 ) ) ( not ( = ?auto_175976 ?auto_175977 ) ) ( not ( = ?auto_175976 ?auto_175979 ) ) ( not ( = ?auto_175975 ?auto_175980 ) ) ( not ( = ?auto_175975 ?auto_175974 ) ) ( not ( = ?auto_175975 ?auto_175977 ) ) ( not ( = ?auto_175975 ?auto_175979 ) ) ( not ( = ?auto_175980 ?auto_175974 ) ) ( not ( = ?auto_175980 ?auto_175977 ) ) ( not ( = ?auto_175980 ?auto_175979 ) ) ( not ( = ?auto_175974 ?auto_175977 ) ) ( not ( = ?auto_175974 ?auto_175979 ) ) ( not ( = ?auto_175977 ?auto_175979 ) ) ( not ( = ?auto_175973 ?auto_175977 ) ) ( not ( = ?auto_175973 ?auto_175976 ) ) ( not ( = ?auto_175973 ?auto_175975 ) ) ( not ( = ?auto_175973 ?auto_175980 ) ) ( not ( = ?auto_175973 ?auto_175974 ) ) ( not ( = ?auto_175981 ?auto_175977 ) ) ( not ( = ?auto_175981 ?auto_175976 ) ) ( not ( = ?auto_175981 ?auto_175975 ) ) ( not ( = ?auto_175981 ?auto_175980 ) ) ( not ( = ?auto_175981 ?auto_175974 ) ) ( not ( = ?auto_175978 ?auto_175977 ) ) ( not ( = ?auto_175978 ?auto_175976 ) ) ( not ( = ?auto_175978 ?auto_175975 ) ) ( not ( = ?auto_175978 ?auto_175980 ) ) ( not ( = ?auto_175978 ?auto_175974 ) ) ( ON ?auto_175979 ?auto_175978 ) ( CLEAR ?auto_175979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175973 ?auto_175981 ?auto_175978 )
      ( MAKE-1PILE ?auto_175973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175982 - BLOCK
    )
    :vars
    (
      ?auto_175990 - BLOCK
      ?auto_175984 - BLOCK
      ?auto_175986 - BLOCK
      ?auto_175985 - BLOCK
      ?auto_175983 - BLOCK
      ?auto_175989 - BLOCK
      ?auto_175988 - BLOCK
      ?auto_175987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175990 ?auto_175982 ) ( ON-TABLE ?auto_175982 ) ( not ( = ?auto_175982 ?auto_175990 ) ) ( not ( = ?auto_175982 ?auto_175984 ) ) ( not ( = ?auto_175982 ?auto_175986 ) ) ( not ( = ?auto_175990 ?auto_175984 ) ) ( not ( = ?auto_175990 ?auto_175986 ) ) ( not ( = ?auto_175984 ?auto_175986 ) ) ( ON ?auto_175984 ?auto_175990 ) ( ON-TABLE ?auto_175985 ) ( ON ?auto_175983 ?auto_175985 ) ( ON ?auto_175989 ?auto_175983 ) ( ON ?auto_175988 ?auto_175989 ) ( not ( = ?auto_175985 ?auto_175983 ) ) ( not ( = ?auto_175985 ?auto_175989 ) ) ( not ( = ?auto_175985 ?auto_175988 ) ) ( not ( = ?auto_175985 ?auto_175987 ) ) ( not ( = ?auto_175985 ?auto_175986 ) ) ( not ( = ?auto_175983 ?auto_175989 ) ) ( not ( = ?auto_175983 ?auto_175988 ) ) ( not ( = ?auto_175983 ?auto_175987 ) ) ( not ( = ?auto_175983 ?auto_175986 ) ) ( not ( = ?auto_175989 ?auto_175988 ) ) ( not ( = ?auto_175989 ?auto_175987 ) ) ( not ( = ?auto_175989 ?auto_175986 ) ) ( not ( = ?auto_175988 ?auto_175987 ) ) ( not ( = ?auto_175988 ?auto_175986 ) ) ( not ( = ?auto_175987 ?auto_175986 ) ) ( not ( = ?auto_175982 ?auto_175987 ) ) ( not ( = ?auto_175982 ?auto_175985 ) ) ( not ( = ?auto_175982 ?auto_175983 ) ) ( not ( = ?auto_175982 ?auto_175989 ) ) ( not ( = ?auto_175982 ?auto_175988 ) ) ( not ( = ?auto_175990 ?auto_175987 ) ) ( not ( = ?auto_175990 ?auto_175985 ) ) ( not ( = ?auto_175990 ?auto_175983 ) ) ( not ( = ?auto_175990 ?auto_175989 ) ) ( not ( = ?auto_175990 ?auto_175988 ) ) ( not ( = ?auto_175984 ?auto_175987 ) ) ( not ( = ?auto_175984 ?auto_175985 ) ) ( not ( = ?auto_175984 ?auto_175983 ) ) ( not ( = ?auto_175984 ?auto_175989 ) ) ( not ( = ?auto_175984 ?auto_175988 ) ) ( ON ?auto_175986 ?auto_175984 ) ( CLEAR ?auto_175986 ) ( HOLDING ?auto_175987 ) ( CLEAR ?auto_175988 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175985 ?auto_175983 ?auto_175989 ?auto_175988 ?auto_175987 )
      ( MAKE-1PILE ?auto_175982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175991 - BLOCK
    )
    :vars
    (
      ?auto_175997 - BLOCK
      ?auto_175998 - BLOCK
      ?auto_175994 - BLOCK
      ?auto_175995 - BLOCK
      ?auto_175992 - BLOCK
      ?auto_175999 - BLOCK
      ?auto_175993 - BLOCK
      ?auto_175996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175997 ?auto_175991 ) ( ON-TABLE ?auto_175991 ) ( not ( = ?auto_175991 ?auto_175997 ) ) ( not ( = ?auto_175991 ?auto_175998 ) ) ( not ( = ?auto_175991 ?auto_175994 ) ) ( not ( = ?auto_175997 ?auto_175998 ) ) ( not ( = ?auto_175997 ?auto_175994 ) ) ( not ( = ?auto_175998 ?auto_175994 ) ) ( ON ?auto_175998 ?auto_175997 ) ( ON-TABLE ?auto_175995 ) ( ON ?auto_175992 ?auto_175995 ) ( ON ?auto_175999 ?auto_175992 ) ( ON ?auto_175993 ?auto_175999 ) ( not ( = ?auto_175995 ?auto_175992 ) ) ( not ( = ?auto_175995 ?auto_175999 ) ) ( not ( = ?auto_175995 ?auto_175993 ) ) ( not ( = ?auto_175995 ?auto_175996 ) ) ( not ( = ?auto_175995 ?auto_175994 ) ) ( not ( = ?auto_175992 ?auto_175999 ) ) ( not ( = ?auto_175992 ?auto_175993 ) ) ( not ( = ?auto_175992 ?auto_175996 ) ) ( not ( = ?auto_175992 ?auto_175994 ) ) ( not ( = ?auto_175999 ?auto_175993 ) ) ( not ( = ?auto_175999 ?auto_175996 ) ) ( not ( = ?auto_175999 ?auto_175994 ) ) ( not ( = ?auto_175993 ?auto_175996 ) ) ( not ( = ?auto_175993 ?auto_175994 ) ) ( not ( = ?auto_175996 ?auto_175994 ) ) ( not ( = ?auto_175991 ?auto_175996 ) ) ( not ( = ?auto_175991 ?auto_175995 ) ) ( not ( = ?auto_175991 ?auto_175992 ) ) ( not ( = ?auto_175991 ?auto_175999 ) ) ( not ( = ?auto_175991 ?auto_175993 ) ) ( not ( = ?auto_175997 ?auto_175996 ) ) ( not ( = ?auto_175997 ?auto_175995 ) ) ( not ( = ?auto_175997 ?auto_175992 ) ) ( not ( = ?auto_175997 ?auto_175999 ) ) ( not ( = ?auto_175997 ?auto_175993 ) ) ( not ( = ?auto_175998 ?auto_175996 ) ) ( not ( = ?auto_175998 ?auto_175995 ) ) ( not ( = ?auto_175998 ?auto_175992 ) ) ( not ( = ?auto_175998 ?auto_175999 ) ) ( not ( = ?auto_175998 ?auto_175993 ) ) ( ON ?auto_175994 ?auto_175998 ) ( CLEAR ?auto_175993 ) ( ON ?auto_175996 ?auto_175994 ) ( CLEAR ?auto_175996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175991 ?auto_175997 ?auto_175998 ?auto_175994 )
      ( MAKE-1PILE ?auto_175991 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176000 - BLOCK
    )
    :vars
    (
      ?auto_176001 - BLOCK
      ?auto_176005 - BLOCK
      ?auto_176002 - BLOCK
      ?auto_176003 - BLOCK
      ?auto_176006 - BLOCK
      ?auto_176004 - BLOCK
      ?auto_176008 - BLOCK
      ?auto_176007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176001 ?auto_176000 ) ( ON-TABLE ?auto_176000 ) ( not ( = ?auto_176000 ?auto_176001 ) ) ( not ( = ?auto_176000 ?auto_176005 ) ) ( not ( = ?auto_176000 ?auto_176002 ) ) ( not ( = ?auto_176001 ?auto_176005 ) ) ( not ( = ?auto_176001 ?auto_176002 ) ) ( not ( = ?auto_176005 ?auto_176002 ) ) ( ON ?auto_176005 ?auto_176001 ) ( ON-TABLE ?auto_176003 ) ( ON ?auto_176006 ?auto_176003 ) ( ON ?auto_176004 ?auto_176006 ) ( not ( = ?auto_176003 ?auto_176006 ) ) ( not ( = ?auto_176003 ?auto_176004 ) ) ( not ( = ?auto_176003 ?auto_176008 ) ) ( not ( = ?auto_176003 ?auto_176007 ) ) ( not ( = ?auto_176003 ?auto_176002 ) ) ( not ( = ?auto_176006 ?auto_176004 ) ) ( not ( = ?auto_176006 ?auto_176008 ) ) ( not ( = ?auto_176006 ?auto_176007 ) ) ( not ( = ?auto_176006 ?auto_176002 ) ) ( not ( = ?auto_176004 ?auto_176008 ) ) ( not ( = ?auto_176004 ?auto_176007 ) ) ( not ( = ?auto_176004 ?auto_176002 ) ) ( not ( = ?auto_176008 ?auto_176007 ) ) ( not ( = ?auto_176008 ?auto_176002 ) ) ( not ( = ?auto_176007 ?auto_176002 ) ) ( not ( = ?auto_176000 ?auto_176007 ) ) ( not ( = ?auto_176000 ?auto_176003 ) ) ( not ( = ?auto_176000 ?auto_176006 ) ) ( not ( = ?auto_176000 ?auto_176004 ) ) ( not ( = ?auto_176000 ?auto_176008 ) ) ( not ( = ?auto_176001 ?auto_176007 ) ) ( not ( = ?auto_176001 ?auto_176003 ) ) ( not ( = ?auto_176001 ?auto_176006 ) ) ( not ( = ?auto_176001 ?auto_176004 ) ) ( not ( = ?auto_176001 ?auto_176008 ) ) ( not ( = ?auto_176005 ?auto_176007 ) ) ( not ( = ?auto_176005 ?auto_176003 ) ) ( not ( = ?auto_176005 ?auto_176006 ) ) ( not ( = ?auto_176005 ?auto_176004 ) ) ( not ( = ?auto_176005 ?auto_176008 ) ) ( ON ?auto_176002 ?auto_176005 ) ( ON ?auto_176007 ?auto_176002 ) ( CLEAR ?auto_176007 ) ( HOLDING ?auto_176008 ) ( CLEAR ?auto_176004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176003 ?auto_176006 ?auto_176004 ?auto_176008 )
      ( MAKE-1PILE ?auto_176000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176009 - BLOCK
    )
    :vars
    (
      ?auto_176013 - BLOCK
      ?auto_176014 - BLOCK
      ?auto_176015 - BLOCK
      ?auto_176010 - BLOCK
      ?auto_176017 - BLOCK
      ?auto_176012 - BLOCK
      ?auto_176011 - BLOCK
      ?auto_176016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176013 ?auto_176009 ) ( ON-TABLE ?auto_176009 ) ( not ( = ?auto_176009 ?auto_176013 ) ) ( not ( = ?auto_176009 ?auto_176014 ) ) ( not ( = ?auto_176009 ?auto_176015 ) ) ( not ( = ?auto_176013 ?auto_176014 ) ) ( not ( = ?auto_176013 ?auto_176015 ) ) ( not ( = ?auto_176014 ?auto_176015 ) ) ( ON ?auto_176014 ?auto_176013 ) ( ON-TABLE ?auto_176010 ) ( ON ?auto_176017 ?auto_176010 ) ( ON ?auto_176012 ?auto_176017 ) ( not ( = ?auto_176010 ?auto_176017 ) ) ( not ( = ?auto_176010 ?auto_176012 ) ) ( not ( = ?auto_176010 ?auto_176011 ) ) ( not ( = ?auto_176010 ?auto_176016 ) ) ( not ( = ?auto_176010 ?auto_176015 ) ) ( not ( = ?auto_176017 ?auto_176012 ) ) ( not ( = ?auto_176017 ?auto_176011 ) ) ( not ( = ?auto_176017 ?auto_176016 ) ) ( not ( = ?auto_176017 ?auto_176015 ) ) ( not ( = ?auto_176012 ?auto_176011 ) ) ( not ( = ?auto_176012 ?auto_176016 ) ) ( not ( = ?auto_176012 ?auto_176015 ) ) ( not ( = ?auto_176011 ?auto_176016 ) ) ( not ( = ?auto_176011 ?auto_176015 ) ) ( not ( = ?auto_176016 ?auto_176015 ) ) ( not ( = ?auto_176009 ?auto_176016 ) ) ( not ( = ?auto_176009 ?auto_176010 ) ) ( not ( = ?auto_176009 ?auto_176017 ) ) ( not ( = ?auto_176009 ?auto_176012 ) ) ( not ( = ?auto_176009 ?auto_176011 ) ) ( not ( = ?auto_176013 ?auto_176016 ) ) ( not ( = ?auto_176013 ?auto_176010 ) ) ( not ( = ?auto_176013 ?auto_176017 ) ) ( not ( = ?auto_176013 ?auto_176012 ) ) ( not ( = ?auto_176013 ?auto_176011 ) ) ( not ( = ?auto_176014 ?auto_176016 ) ) ( not ( = ?auto_176014 ?auto_176010 ) ) ( not ( = ?auto_176014 ?auto_176017 ) ) ( not ( = ?auto_176014 ?auto_176012 ) ) ( not ( = ?auto_176014 ?auto_176011 ) ) ( ON ?auto_176015 ?auto_176014 ) ( ON ?auto_176016 ?auto_176015 ) ( CLEAR ?auto_176012 ) ( ON ?auto_176011 ?auto_176016 ) ( CLEAR ?auto_176011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176009 ?auto_176013 ?auto_176014 ?auto_176015 ?auto_176016 )
      ( MAKE-1PILE ?auto_176009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176018 - BLOCK
    )
    :vars
    (
      ?auto_176022 - BLOCK
      ?auto_176020 - BLOCK
      ?auto_176021 - BLOCK
      ?auto_176023 - BLOCK
      ?auto_176025 - BLOCK
      ?auto_176019 - BLOCK
      ?auto_176024 - BLOCK
      ?auto_176026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176022 ?auto_176018 ) ( ON-TABLE ?auto_176018 ) ( not ( = ?auto_176018 ?auto_176022 ) ) ( not ( = ?auto_176018 ?auto_176020 ) ) ( not ( = ?auto_176018 ?auto_176021 ) ) ( not ( = ?auto_176022 ?auto_176020 ) ) ( not ( = ?auto_176022 ?auto_176021 ) ) ( not ( = ?auto_176020 ?auto_176021 ) ) ( ON ?auto_176020 ?auto_176022 ) ( ON-TABLE ?auto_176023 ) ( ON ?auto_176025 ?auto_176023 ) ( not ( = ?auto_176023 ?auto_176025 ) ) ( not ( = ?auto_176023 ?auto_176019 ) ) ( not ( = ?auto_176023 ?auto_176024 ) ) ( not ( = ?auto_176023 ?auto_176026 ) ) ( not ( = ?auto_176023 ?auto_176021 ) ) ( not ( = ?auto_176025 ?auto_176019 ) ) ( not ( = ?auto_176025 ?auto_176024 ) ) ( not ( = ?auto_176025 ?auto_176026 ) ) ( not ( = ?auto_176025 ?auto_176021 ) ) ( not ( = ?auto_176019 ?auto_176024 ) ) ( not ( = ?auto_176019 ?auto_176026 ) ) ( not ( = ?auto_176019 ?auto_176021 ) ) ( not ( = ?auto_176024 ?auto_176026 ) ) ( not ( = ?auto_176024 ?auto_176021 ) ) ( not ( = ?auto_176026 ?auto_176021 ) ) ( not ( = ?auto_176018 ?auto_176026 ) ) ( not ( = ?auto_176018 ?auto_176023 ) ) ( not ( = ?auto_176018 ?auto_176025 ) ) ( not ( = ?auto_176018 ?auto_176019 ) ) ( not ( = ?auto_176018 ?auto_176024 ) ) ( not ( = ?auto_176022 ?auto_176026 ) ) ( not ( = ?auto_176022 ?auto_176023 ) ) ( not ( = ?auto_176022 ?auto_176025 ) ) ( not ( = ?auto_176022 ?auto_176019 ) ) ( not ( = ?auto_176022 ?auto_176024 ) ) ( not ( = ?auto_176020 ?auto_176026 ) ) ( not ( = ?auto_176020 ?auto_176023 ) ) ( not ( = ?auto_176020 ?auto_176025 ) ) ( not ( = ?auto_176020 ?auto_176019 ) ) ( not ( = ?auto_176020 ?auto_176024 ) ) ( ON ?auto_176021 ?auto_176020 ) ( ON ?auto_176026 ?auto_176021 ) ( ON ?auto_176024 ?auto_176026 ) ( CLEAR ?auto_176024 ) ( HOLDING ?auto_176019 ) ( CLEAR ?auto_176025 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176023 ?auto_176025 ?auto_176019 )
      ( MAKE-1PILE ?auto_176018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176027 - BLOCK
    )
    :vars
    (
      ?auto_176035 - BLOCK
      ?auto_176031 - BLOCK
      ?auto_176032 - BLOCK
      ?auto_176034 - BLOCK
      ?auto_176028 - BLOCK
      ?auto_176029 - BLOCK
      ?auto_176033 - BLOCK
      ?auto_176030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176035 ?auto_176027 ) ( ON-TABLE ?auto_176027 ) ( not ( = ?auto_176027 ?auto_176035 ) ) ( not ( = ?auto_176027 ?auto_176031 ) ) ( not ( = ?auto_176027 ?auto_176032 ) ) ( not ( = ?auto_176035 ?auto_176031 ) ) ( not ( = ?auto_176035 ?auto_176032 ) ) ( not ( = ?auto_176031 ?auto_176032 ) ) ( ON ?auto_176031 ?auto_176035 ) ( ON-TABLE ?auto_176034 ) ( ON ?auto_176028 ?auto_176034 ) ( not ( = ?auto_176034 ?auto_176028 ) ) ( not ( = ?auto_176034 ?auto_176029 ) ) ( not ( = ?auto_176034 ?auto_176033 ) ) ( not ( = ?auto_176034 ?auto_176030 ) ) ( not ( = ?auto_176034 ?auto_176032 ) ) ( not ( = ?auto_176028 ?auto_176029 ) ) ( not ( = ?auto_176028 ?auto_176033 ) ) ( not ( = ?auto_176028 ?auto_176030 ) ) ( not ( = ?auto_176028 ?auto_176032 ) ) ( not ( = ?auto_176029 ?auto_176033 ) ) ( not ( = ?auto_176029 ?auto_176030 ) ) ( not ( = ?auto_176029 ?auto_176032 ) ) ( not ( = ?auto_176033 ?auto_176030 ) ) ( not ( = ?auto_176033 ?auto_176032 ) ) ( not ( = ?auto_176030 ?auto_176032 ) ) ( not ( = ?auto_176027 ?auto_176030 ) ) ( not ( = ?auto_176027 ?auto_176034 ) ) ( not ( = ?auto_176027 ?auto_176028 ) ) ( not ( = ?auto_176027 ?auto_176029 ) ) ( not ( = ?auto_176027 ?auto_176033 ) ) ( not ( = ?auto_176035 ?auto_176030 ) ) ( not ( = ?auto_176035 ?auto_176034 ) ) ( not ( = ?auto_176035 ?auto_176028 ) ) ( not ( = ?auto_176035 ?auto_176029 ) ) ( not ( = ?auto_176035 ?auto_176033 ) ) ( not ( = ?auto_176031 ?auto_176030 ) ) ( not ( = ?auto_176031 ?auto_176034 ) ) ( not ( = ?auto_176031 ?auto_176028 ) ) ( not ( = ?auto_176031 ?auto_176029 ) ) ( not ( = ?auto_176031 ?auto_176033 ) ) ( ON ?auto_176032 ?auto_176031 ) ( ON ?auto_176030 ?auto_176032 ) ( ON ?auto_176033 ?auto_176030 ) ( CLEAR ?auto_176028 ) ( ON ?auto_176029 ?auto_176033 ) ( CLEAR ?auto_176029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176027 ?auto_176035 ?auto_176031 ?auto_176032 ?auto_176030 ?auto_176033 )
      ( MAKE-1PILE ?auto_176027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176036 - BLOCK
    )
    :vars
    (
      ?auto_176040 - BLOCK
      ?auto_176044 - BLOCK
      ?auto_176037 - BLOCK
      ?auto_176042 - BLOCK
      ?auto_176039 - BLOCK
      ?auto_176043 - BLOCK
      ?auto_176041 - BLOCK
      ?auto_176038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176040 ?auto_176036 ) ( ON-TABLE ?auto_176036 ) ( not ( = ?auto_176036 ?auto_176040 ) ) ( not ( = ?auto_176036 ?auto_176044 ) ) ( not ( = ?auto_176036 ?auto_176037 ) ) ( not ( = ?auto_176040 ?auto_176044 ) ) ( not ( = ?auto_176040 ?auto_176037 ) ) ( not ( = ?auto_176044 ?auto_176037 ) ) ( ON ?auto_176044 ?auto_176040 ) ( ON-TABLE ?auto_176042 ) ( not ( = ?auto_176042 ?auto_176039 ) ) ( not ( = ?auto_176042 ?auto_176043 ) ) ( not ( = ?auto_176042 ?auto_176041 ) ) ( not ( = ?auto_176042 ?auto_176038 ) ) ( not ( = ?auto_176042 ?auto_176037 ) ) ( not ( = ?auto_176039 ?auto_176043 ) ) ( not ( = ?auto_176039 ?auto_176041 ) ) ( not ( = ?auto_176039 ?auto_176038 ) ) ( not ( = ?auto_176039 ?auto_176037 ) ) ( not ( = ?auto_176043 ?auto_176041 ) ) ( not ( = ?auto_176043 ?auto_176038 ) ) ( not ( = ?auto_176043 ?auto_176037 ) ) ( not ( = ?auto_176041 ?auto_176038 ) ) ( not ( = ?auto_176041 ?auto_176037 ) ) ( not ( = ?auto_176038 ?auto_176037 ) ) ( not ( = ?auto_176036 ?auto_176038 ) ) ( not ( = ?auto_176036 ?auto_176042 ) ) ( not ( = ?auto_176036 ?auto_176039 ) ) ( not ( = ?auto_176036 ?auto_176043 ) ) ( not ( = ?auto_176036 ?auto_176041 ) ) ( not ( = ?auto_176040 ?auto_176038 ) ) ( not ( = ?auto_176040 ?auto_176042 ) ) ( not ( = ?auto_176040 ?auto_176039 ) ) ( not ( = ?auto_176040 ?auto_176043 ) ) ( not ( = ?auto_176040 ?auto_176041 ) ) ( not ( = ?auto_176044 ?auto_176038 ) ) ( not ( = ?auto_176044 ?auto_176042 ) ) ( not ( = ?auto_176044 ?auto_176039 ) ) ( not ( = ?auto_176044 ?auto_176043 ) ) ( not ( = ?auto_176044 ?auto_176041 ) ) ( ON ?auto_176037 ?auto_176044 ) ( ON ?auto_176038 ?auto_176037 ) ( ON ?auto_176041 ?auto_176038 ) ( ON ?auto_176043 ?auto_176041 ) ( CLEAR ?auto_176043 ) ( HOLDING ?auto_176039 ) ( CLEAR ?auto_176042 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176042 ?auto_176039 )
      ( MAKE-1PILE ?auto_176036 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176045 - BLOCK
    )
    :vars
    (
      ?auto_176053 - BLOCK
      ?auto_176046 - BLOCK
      ?auto_176049 - BLOCK
      ?auto_176050 - BLOCK
      ?auto_176051 - BLOCK
      ?auto_176047 - BLOCK
      ?auto_176048 - BLOCK
      ?auto_176052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176053 ?auto_176045 ) ( ON-TABLE ?auto_176045 ) ( not ( = ?auto_176045 ?auto_176053 ) ) ( not ( = ?auto_176045 ?auto_176046 ) ) ( not ( = ?auto_176045 ?auto_176049 ) ) ( not ( = ?auto_176053 ?auto_176046 ) ) ( not ( = ?auto_176053 ?auto_176049 ) ) ( not ( = ?auto_176046 ?auto_176049 ) ) ( ON ?auto_176046 ?auto_176053 ) ( ON-TABLE ?auto_176050 ) ( not ( = ?auto_176050 ?auto_176051 ) ) ( not ( = ?auto_176050 ?auto_176047 ) ) ( not ( = ?auto_176050 ?auto_176048 ) ) ( not ( = ?auto_176050 ?auto_176052 ) ) ( not ( = ?auto_176050 ?auto_176049 ) ) ( not ( = ?auto_176051 ?auto_176047 ) ) ( not ( = ?auto_176051 ?auto_176048 ) ) ( not ( = ?auto_176051 ?auto_176052 ) ) ( not ( = ?auto_176051 ?auto_176049 ) ) ( not ( = ?auto_176047 ?auto_176048 ) ) ( not ( = ?auto_176047 ?auto_176052 ) ) ( not ( = ?auto_176047 ?auto_176049 ) ) ( not ( = ?auto_176048 ?auto_176052 ) ) ( not ( = ?auto_176048 ?auto_176049 ) ) ( not ( = ?auto_176052 ?auto_176049 ) ) ( not ( = ?auto_176045 ?auto_176052 ) ) ( not ( = ?auto_176045 ?auto_176050 ) ) ( not ( = ?auto_176045 ?auto_176051 ) ) ( not ( = ?auto_176045 ?auto_176047 ) ) ( not ( = ?auto_176045 ?auto_176048 ) ) ( not ( = ?auto_176053 ?auto_176052 ) ) ( not ( = ?auto_176053 ?auto_176050 ) ) ( not ( = ?auto_176053 ?auto_176051 ) ) ( not ( = ?auto_176053 ?auto_176047 ) ) ( not ( = ?auto_176053 ?auto_176048 ) ) ( not ( = ?auto_176046 ?auto_176052 ) ) ( not ( = ?auto_176046 ?auto_176050 ) ) ( not ( = ?auto_176046 ?auto_176051 ) ) ( not ( = ?auto_176046 ?auto_176047 ) ) ( not ( = ?auto_176046 ?auto_176048 ) ) ( ON ?auto_176049 ?auto_176046 ) ( ON ?auto_176052 ?auto_176049 ) ( ON ?auto_176048 ?auto_176052 ) ( ON ?auto_176047 ?auto_176048 ) ( CLEAR ?auto_176050 ) ( ON ?auto_176051 ?auto_176047 ) ( CLEAR ?auto_176051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176045 ?auto_176053 ?auto_176046 ?auto_176049 ?auto_176052 ?auto_176048 ?auto_176047 )
      ( MAKE-1PILE ?auto_176045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176054 - BLOCK
    )
    :vars
    (
      ?auto_176056 - BLOCK
      ?auto_176059 - BLOCK
      ?auto_176058 - BLOCK
      ?auto_176055 - BLOCK
      ?auto_176061 - BLOCK
      ?auto_176060 - BLOCK
      ?auto_176057 - BLOCK
      ?auto_176062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176056 ?auto_176054 ) ( ON-TABLE ?auto_176054 ) ( not ( = ?auto_176054 ?auto_176056 ) ) ( not ( = ?auto_176054 ?auto_176059 ) ) ( not ( = ?auto_176054 ?auto_176058 ) ) ( not ( = ?auto_176056 ?auto_176059 ) ) ( not ( = ?auto_176056 ?auto_176058 ) ) ( not ( = ?auto_176059 ?auto_176058 ) ) ( ON ?auto_176059 ?auto_176056 ) ( not ( = ?auto_176055 ?auto_176061 ) ) ( not ( = ?auto_176055 ?auto_176060 ) ) ( not ( = ?auto_176055 ?auto_176057 ) ) ( not ( = ?auto_176055 ?auto_176062 ) ) ( not ( = ?auto_176055 ?auto_176058 ) ) ( not ( = ?auto_176061 ?auto_176060 ) ) ( not ( = ?auto_176061 ?auto_176057 ) ) ( not ( = ?auto_176061 ?auto_176062 ) ) ( not ( = ?auto_176061 ?auto_176058 ) ) ( not ( = ?auto_176060 ?auto_176057 ) ) ( not ( = ?auto_176060 ?auto_176062 ) ) ( not ( = ?auto_176060 ?auto_176058 ) ) ( not ( = ?auto_176057 ?auto_176062 ) ) ( not ( = ?auto_176057 ?auto_176058 ) ) ( not ( = ?auto_176062 ?auto_176058 ) ) ( not ( = ?auto_176054 ?auto_176062 ) ) ( not ( = ?auto_176054 ?auto_176055 ) ) ( not ( = ?auto_176054 ?auto_176061 ) ) ( not ( = ?auto_176054 ?auto_176060 ) ) ( not ( = ?auto_176054 ?auto_176057 ) ) ( not ( = ?auto_176056 ?auto_176062 ) ) ( not ( = ?auto_176056 ?auto_176055 ) ) ( not ( = ?auto_176056 ?auto_176061 ) ) ( not ( = ?auto_176056 ?auto_176060 ) ) ( not ( = ?auto_176056 ?auto_176057 ) ) ( not ( = ?auto_176059 ?auto_176062 ) ) ( not ( = ?auto_176059 ?auto_176055 ) ) ( not ( = ?auto_176059 ?auto_176061 ) ) ( not ( = ?auto_176059 ?auto_176060 ) ) ( not ( = ?auto_176059 ?auto_176057 ) ) ( ON ?auto_176058 ?auto_176059 ) ( ON ?auto_176062 ?auto_176058 ) ( ON ?auto_176057 ?auto_176062 ) ( ON ?auto_176060 ?auto_176057 ) ( ON ?auto_176061 ?auto_176060 ) ( CLEAR ?auto_176061 ) ( HOLDING ?auto_176055 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176055 )
      ( MAKE-1PILE ?auto_176054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176063 - BLOCK
    )
    :vars
    (
      ?auto_176069 - BLOCK
      ?auto_176066 - BLOCK
      ?auto_176067 - BLOCK
      ?auto_176070 - BLOCK
      ?auto_176071 - BLOCK
      ?auto_176065 - BLOCK
      ?auto_176064 - BLOCK
      ?auto_176068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176069 ?auto_176063 ) ( ON-TABLE ?auto_176063 ) ( not ( = ?auto_176063 ?auto_176069 ) ) ( not ( = ?auto_176063 ?auto_176066 ) ) ( not ( = ?auto_176063 ?auto_176067 ) ) ( not ( = ?auto_176069 ?auto_176066 ) ) ( not ( = ?auto_176069 ?auto_176067 ) ) ( not ( = ?auto_176066 ?auto_176067 ) ) ( ON ?auto_176066 ?auto_176069 ) ( not ( = ?auto_176070 ?auto_176071 ) ) ( not ( = ?auto_176070 ?auto_176065 ) ) ( not ( = ?auto_176070 ?auto_176064 ) ) ( not ( = ?auto_176070 ?auto_176068 ) ) ( not ( = ?auto_176070 ?auto_176067 ) ) ( not ( = ?auto_176071 ?auto_176065 ) ) ( not ( = ?auto_176071 ?auto_176064 ) ) ( not ( = ?auto_176071 ?auto_176068 ) ) ( not ( = ?auto_176071 ?auto_176067 ) ) ( not ( = ?auto_176065 ?auto_176064 ) ) ( not ( = ?auto_176065 ?auto_176068 ) ) ( not ( = ?auto_176065 ?auto_176067 ) ) ( not ( = ?auto_176064 ?auto_176068 ) ) ( not ( = ?auto_176064 ?auto_176067 ) ) ( not ( = ?auto_176068 ?auto_176067 ) ) ( not ( = ?auto_176063 ?auto_176068 ) ) ( not ( = ?auto_176063 ?auto_176070 ) ) ( not ( = ?auto_176063 ?auto_176071 ) ) ( not ( = ?auto_176063 ?auto_176065 ) ) ( not ( = ?auto_176063 ?auto_176064 ) ) ( not ( = ?auto_176069 ?auto_176068 ) ) ( not ( = ?auto_176069 ?auto_176070 ) ) ( not ( = ?auto_176069 ?auto_176071 ) ) ( not ( = ?auto_176069 ?auto_176065 ) ) ( not ( = ?auto_176069 ?auto_176064 ) ) ( not ( = ?auto_176066 ?auto_176068 ) ) ( not ( = ?auto_176066 ?auto_176070 ) ) ( not ( = ?auto_176066 ?auto_176071 ) ) ( not ( = ?auto_176066 ?auto_176065 ) ) ( not ( = ?auto_176066 ?auto_176064 ) ) ( ON ?auto_176067 ?auto_176066 ) ( ON ?auto_176068 ?auto_176067 ) ( ON ?auto_176064 ?auto_176068 ) ( ON ?auto_176065 ?auto_176064 ) ( ON ?auto_176071 ?auto_176065 ) ( ON ?auto_176070 ?auto_176071 ) ( CLEAR ?auto_176070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176063 ?auto_176069 ?auto_176066 ?auto_176067 ?auto_176068 ?auto_176064 ?auto_176065 ?auto_176071 )
      ( MAKE-1PILE ?auto_176063 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176080 - BLOCK
      ?auto_176081 - BLOCK
      ?auto_176082 - BLOCK
      ?auto_176083 - BLOCK
      ?auto_176084 - BLOCK
      ?auto_176085 - BLOCK
      ?auto_176086 - BLOCK
      ?auto_176087 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_176087 ) ( CLEAR ?auto_176086 ) ( ON-TABLE ?auto_176080 ) ( ON ?auto_176081 ?auto_176080 ) ( ON ?auto_176082 ?auto_176081 ) ( ON ?auto_176083 ?auto_176082 ) ( ON ?auto_176084 ?auto_176083 ) ( ON ?auto_176085 ?auto_176084 ) ( ON ?auto_176086 ?auto_176085 ) ( not ( = ?auto_176080 ?auto_176081 ) ) ( not ( = ?auto_176080 ?auto_176082 ) ) ( not ( = ?auto_176080 ?auto_176083 ) ) ( not ( = ?auto_176080 ?auto_176084 ) ) ( not ( = ?auto_176080 ?auto_176085 ) ) ( not ( = ?auto_176080 ?auto_176086 ) ) ( not ( = ?auto_176080 ?auto_176087 ) ) ( not ( = ?auto_176081 ?auto_176082 ) ) ( not ( = ?auto_176081 ?auto_176083 ) ) ( not ( = ?auto_176081 ?auto_176084 ) ) ( not ( = ?auto_176081 ?auto_176085 ) ) ( not ( = ?auto_176081 ?auto_176086 ) ) ( not ( = ?auto_176081 ?auto_176087 ) ) ( not ( = ?auto_176082 ?auto_176083 ) ) ( not ( = ?auto_176082 ?auto_176084 ) ) ( not ( = ?auto_176082 ?auto_176085 ) ) ( not ( = ?auto_176082 ?auto_176086 ) ) ( not ( = ?auto_176082 ?auto_176087 ) ) ( not ( = ?auto_176083 ?auto_176084 ) ) ( not ( = ?auto_176083 ?auto_176085 ) ) ( not ( = ?auto_176083 ?auto_176086 ) ) ( not ( = ?auto_176083 ?auto_176087 ) ) ( not ( = ?auto_176084 ?auto_176085 ) ) ( not ( = ?auto_176084 ?auto_176086 ) ) ( not ( = ?auto_176084 ?auto_176087 ) ) ( not ( = ?auto_176085 ?auto_176086 ) ) ( not ( = ?auto_176085 ?auto_176087 ) ) ( not ( = ?auto_176086 ?auto_176087 ) ) )
    :subtasks
    ( ( !STACK ?auto_176087 ?auto_176086 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176088 - BLOCK
      ?auto_176089 - BLOCK
      ?auto_176090 - BLOCK
      ?auto_176091 - BLOCK
      ?auto_176092 - BLOCK
      ?auto_176093 - BLOCK
      ?auto_176094 - BLOCK
      ?auto_176095 - BLOCK
    )
    :vars
    (
      ?auto_176096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_176094 ) ( ON-TABLE ?auto_176088 ) ( ON ?auto_176089 ?auto_176088 ) ( ON ?auto_176090 ?auto_176089 ) ( ON ?auto_176091 ?auto_176090 ) ( ON ?auto_176092 ?auto_176091 ) ( ON ?auto_176093 ?auto_176092 ) ( ON ?auto_176094 ?auto_176093 ) ( not ( = ?auto_176088 ?auto_176089 ) ) ( not ( = ?auto_176088 ?auto_176090 ) ) ( not ( = ?auto_176088 ?auto_176091 ) ) ( not ( = ?auto_176088 ?auto_176092 ) ) ( not ( = ?auto_176088 ?auto_176093 ) ) ( not ( = ?auto_176088 ?auto_176094 ) ) ( not ( = ?auto_176088 ?auto_176095 ) ) ( not ( = ?auto_176089 ?auto_176090 ) ) ( not ( = ?auto_176089 ?auto_176091 ) ) ( not ( = ?auto_176089 ?auto_176092 ) ) ( not ( = ?auto_176089 ?auto_176093 ) ) ( not ( = ?auto_176089 ?auto_176094 ) ) ( not ( = ?auto_176089 ?auto_176095 ) ) ( not ( = ?auto_176090 ?auto_176091 ) ) ( not ( = ?auto_176090 ?auto_176092 ) ) ( not ( = ?auto_176090 ?auto_176093 ) ) ( not ( = ?auto_176090 ?auto_176094 ) ) ( not ( = ?auto_176090 ?auto_176095 ) ) ( not ( = ?auto_176091 ?auto_176092 ) ) ( not ( = ?auto_176091 ?auto_176093 ) ) ( not ( = ?auto_176091 ?auto_176094 ) ) ( not ( = ?auto_176091 ?auto_176095 ) ) ( not ( = ?auto_176092 ?auto_176093 ) ) ( not ( = ?auto_176092 ?auto_176094 ) ) ( not ( = ?auto_176092 ?auto_176095 ) ) ( not ( = ?auto_176093 ?auto_176094 ) ) ( not ( = ?auto_176093 ?auto_176095 ) ) ( not ( = ?auto_176094 ?auto_176095 ) ) ( ON ?auto_176095 ?auto_176096 ) ( CLEAR ?auto_176095 ) ( HAND-EMPTY ) ( not ( = ?auto_176088 ?auto_176096 ) ) ( not ( = ?auto_176089 ?auto_176096 ) ) ( not ( = ?auto_176090 ?auto_176096 ) ) ( not ( = ?auto_176091 ?auto_176096 ) ) ( not ( = ?auto_176092 ?auto_176096 ) ) ( not ( = ?auto_176093 ?auto_176096 ) ) ( not ( = ?auto_176094 ?auto_176096 ) ) ( not ( = ?auto_176095 ?auto_176096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176095 ?auto_176096 )
      ( MAKE-8PILE ?auto_176088 ?auto_176089 ?auto_176090 ?auto_176091 ?auto_176092 ?auto_176093 ?auto_176094 ?auto_176095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176097 - BLOCK
      ?auto_176098 - BLOCK
      ?auto_176099 - BLOCK
      ?auto_176100 - BLOCK
      ?auto_176101 - BLOCK
      ?auto_176102 - BLOCK
      ?auto_176103 - BLOCK
      ?auto_176104 - BLOCK
    )
    :vars
    (
      ?auto_176105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176097 ) ( ON ?auto_176098 ?auto_176097 ) ( ON ?auto_176099 ?auto_176098 ) ( ON ?auto_176100 ?auto_176099 ) ( ON ?auto_176101 ?auto_176100 ) ( ON ?auto_176102 ?auto_176101 ) ( not ( = ?auto_176097 ?auto_176098 ) ) ( not ( = ?auto_176097 ?auto_176099 ) ) ( not ( = ?auto_176097 ?auto_176100 ) ) ( not ( = ?auto_176097 ?auto_176101 ) ) ( not ( = ?auto_176097 ?auto_176102 ) ) ( not ( = ?auto_176097 ?auto_176103 ) ) ( not ( = ?auto_176097 ?auto_176104 ) ) ( not ( = ?auto_176098 ?auto_176099 ) ) ( not ( = ?auto_176098 ?auto_176100 ) ) ( not ( = ?auto_176098 ?auto_176101 ) ) ( not ( = ?auto_176098 ?auto_176102 ) ) ( not ( = ?auto_176098 ?auto_176103 ) ) ( not ( = ?auto_176098 ?auto_176104 ) ) ( not ( = ?auto_176099 ?auto_176100 ) ) ( not ( = ?auto_176099 ?auto_176101 ) ) ( not ( = ?auto_176099 ?auto_176102 ) ) ( not ( = ?auto_176099 ?auto_176103 ) ) ( not ( = ?auto_176099 ?auto_176104 ) ) ( not ( = ?auto_176100 ?auto_176101 ) ) ( not ( = ?auto_176100 ?auto_176102 ) ) ( not ( = ?auto_176100 ?auto_176103 ) ) ( not ( = ?auto_176100 ?auto_176104 ) ) ( not ( = ?auto_176101 ?auto_176102 ) ) ( not ( = ?auto_176101 ?auto_176103 ) ) ( not ( = ?auto_176101 ?auto_176104 ) ) ( not ( = ?auto_176102 ?auto_176103 ) ) ( not ( = ?auto_176102 ?auto_176104 ) ) ( not ( = ?auto_176103 ?auto_176104 ) ) ( ON ?auto_176104 ?auto_176105 ) ( CLEAR ?auto_176104 ) ( not ( = ?auto_176097 ?auto_176105 ) ) ( not ( = ?auto_176098 ?auto_176105 ) ) ( not ( = ?auto_176099 ?auto_176105 ) ) ( not ( = ?auto_176100 ?auto_176105 ) ) ( not ( = ?auto_176101 ?auto_176105 ) ) ( not ( = ?auto_176102 ?auto_176105 ) ) ( not ( = ?auto_176103 ?auto_176105 ) ) ( not ( = ?auto_176104 ?auto_176105 ) ) ( HOLDING ?auto_176103 ) ( CLEAR ?auto_176102 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176097 ?auto_176098 ?auto_176099 ?auto_176100 ?auto_176101 ?auto_176102 ?auto_176103 )
      ( MAKE-8PILE ?auto_176097 ?auto_176098 ?auto_176099 ?auto_176100 ?auto_176101 ?auto_176102 ?auto_176103 ?auto_176104 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176106 - BLOCK
      ?auto_176107 - BLOCK
      ?auto_176108 - BLOCK
      ?auto_176109 - BLOCK
      ?auto_176110 - BLOCK
      ?auto_176111 - BLOCK
      ?auto_176112 - BLOCK
      ?auto_176113 - BLOCK
    )
    :vars
    (
      ?auto_176114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176106 ) ( ON ?auto_176107 ?auto_176106 ) ( ON ?auto_176108 ?auto_176107 ) ( ON ?auto_176109 ?auto_176108 ) ( ON ?auto_176110 ?auto_176109 ) ( ON ?auto_176111 ?auto_176110 ) ( not ( = ?auto_176106 ?auto_176107 ) ) ( not ( = ?auto_176106 ?auto_176108 ) ) ( not ( = ?auto_176106 ?auto_176109 ) ) ( not ( = ?auto_176106 ?auto_176110 ) ) ( not ( = ?auto_176106 ?auto_176111 ) ) ( not ( = ?auto_176106 ?auto_176112 ) ) ( not ( = ?auto_176106 ?auto_176113 ) ) ( not ( = ?auto_176107 ?auto_176108 ) ) ( not ( = ?auto_176107 ?auto_176109 ) ) ( not ( = ?auto_176107 ?auto_176110 ) ) ( not ( = ?auto_176107 ?auto_176111 ) ) ( not ( = ?auto_176107 ?auto_176112 ) ) ( not ( = ?auto_176107 ?auto_176113 ) ) ( not ( = ?auto_176108 ?auto_176109 ) ) ( not ( = ?auto_176108 ?auto_176110 ) ) ( not ( = ?auto_176108 ?auto_176111 ) ) ( not ( = ?auto_176108 ?auto_176112 ) ) ( not ( = ?auto_176108 ?auto_176113 ) ) ( not ( = ?auto_176109 ?auto_176110 ) ) ( not ( = ?auto_176109 ?auto_176111 ) ) ( not ( = ?auto_176109 ?auto_176112 ) ) ( not ( = ?auto_176109 ?auto_176113 ) ) ( not ( = ?auto_176110 ?auto_176111 ) ) ( not ( = ?auto_176110 ?auto_176112 ) ) ( not ( = ?auto_176110 ?auto_176113 ) ) ( not ( = ?auto_176111 ?auto_176112 ) ) ( not ( = ?auto_176111 ?auto_176113 ) ) ( not ( = ?auto_176112 ?auto_176113 ) ) ( ON ?auto_176113 ?auto_176114 ) ( not ( = ?auto_176106 ?auto_176114 ) ) ( not ( = ?auto_176107 ?auto_176114 ) ) ( not ( = ?auto_176108 ?auto_176114 ) ) ( not ( = ?auto_176109 ?auto_176114 ) ) ( not ( = ?auto_176110 ?auto_176114 ) ) ( not ( = ?auto_176111 ?auto_176114 ) ) ( not ( = ?auto_176112 ?auto_176114 ) ) ( not ( = ?auto_176113 ?auto_176114 ) ) ( CLEAR ?auto_176111 ) ( ON ?auto_176112 ?auto_176113 ) ( CLEAR ?auto_176112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176114 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176114 ?auto_176113 )
      ( MAKE-8PILE ?auto_176106 ?auto_176107 ?auto_176108 ?auto_176109 ?auto_176110 ?auto_176111 ?auto_176112 ?auto_176113 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176115 - BLOCK
      ?auto_176116 - BLOCK
      ?auto_176117 - BLOCK
      ?auto_176118 - BLOCK
      ?auto_176119 - BLOCK
      ?auto_176120 - BLOCK
      ?auto_176121 - BLOCK
      ?auto_176122 - BLOCK
    )
    :vars
    (
      ?auto_176123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176115 ) ( ON ?auto_176116 ?auto_176115 ) ( ON ?auto_176117 ?auto_176116 ) ( ON ?auto_176118 ?auto_176117 ) ( ON ?auto_176119 ?auto_176118 ) ( not ( = ?auto_176115 ?auto_176116 ) ) ( not ( = ?auto_176115 ?auto_176117 ) ) ( not ( = ?auto_176115 ?auto_176118 ) ) ( not ( = ?auto_176115 ?auto_176119 ) ) ( not ( = ?auto_176115 ?auto_176120 ) ) ( not ( = ?auto_176115 ?auto_176121 ) ) ( not ( = ?auto_176115 ?auto_176122 ) ) ( not ( = ?auto_176116 ?auto_176117 ) ) ( not ( = ?auto_176116 ?auto_176118 ) ) ( not ( = ?auto_176116 ?auto_176119 ) ) ( not ( = ?auto_176116 ?auto_176120 ) ) ( not ( = ?auto_176116 ?auto_176121 ) ) ( not ( = ?auto_176116 ?auto_176122 ) ) ( not ( = ?auto_176117 ?auto_176118 ) ) ( not ( = ?auto_176117 ?auto_176119 ) ) ( not ( = ?auto_176117 ?auto_176120 ) ) ( not ( = ?auto_176117 ?auto_176121 ) ) ( not ( = ?auto_176117 ?auto_176122 ) ) ( not ( = ?auto_176118 ?auto_176119 ) ) ( not ( = ?auto_176118 ?auto_176120 ) ) ( not ( = ?auto_176118 ?auto_176121 ) ) ( not ( = ?auto_176118 ?auto_176122 ) ) ( not ( = ?auto_176119 ?auto_176120 ) ) ( not ( = ?auto_176119 ?auto_176121 ) ) ( not ( = ?auto_176119 ?auto_176122 ) ) ( not ( = ?auto_176120 ?auto_176121 ) ) ( not ( = ?auto_176120 ?auto_176122 ) ) ( not ( = ?auto_176121 ?auto_176122 ) ) ( ON ?auto_176122 ?auto_176123 ) ( not ( = ?auto_176115 ?auto_176123 ) ) ( not ( = ?auto_176116 ?auto_176123 ) ) ( not ( = ?auto_176117 ?auto_176123 ) ) ( not ( = ?auto_176118 ?auto_176123 ) ) ( not ( = ?auto_176119 ?auto_176123 ) ) ( not ( = ?auto_176120 ?auto_176123 ) ) ( not ( = ?auto_176121 ?auto_176123 ) ) ( not ( = ?auto_176122 ?auto_176123 ) ) ( ON ?auto_176121 ?auto_176122 ) ( CLEAR ?auto_176121 ) ( ON-TABLE ?auto_176123 ) ( HOLDING ?auto_176120 ) ( CLEAR ?auto_176119 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176115 ?auto_176116 ?auto_176117 ?auto_176118 ?auto_176119 ?auto_176120 )
      ( MAKE-8PILE ?auto_176115 ?auto_176116 ?auto_176117 ?auto_176118 ?auto_176119 ?auto_176120 ?auto_176121 ?auto_176122 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176124 - BLOCK
      ?auto_176125 - BLOCK
      ?auto_176126 - BLOCK
      ?auto_176127 - BLOCK
      ?auto_176128 - BLOCK
      ?auto_176129 - BLOCK
      ?auto_176130 - BLOCK
      ?auto_176131 - BLOCK
    )
    :vars
    (
      ?auto_176132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176124 ) ( ON ?auto_176125 ?auto_176124 ) ( ON ?auto_176126 ?auto_176125 ) ( ON ?auto_176127 ?auto_176126 ) ( ON ?auto_176128 ?auto_176127 ) ( not ( = ?auto_176124 ?auto_176125 ) ) ( not ( = ?auto_176124 ?auto_176126 ) ) ( not ( = ?auto_176124 ?auto_176127 ) ) ( not ( = ?auto_176124 ?auto_176128 ) ) ( not ( = ?auto_176124 ?auto_176129 ) ) ( not ( = ?auto_176124 ?auto_176130 ) ) ( not ( = ?auto_176124 ?auto_176131 ) ) ( not ( = ?auto_176125 ?auto_176126 ) ) ( not ( = ?auto_176125 ?auto_176127 ) ) ( not ( = ?auto_176125 ?auto_176128 ) ) ( not ( = ?auto_176125 ?auto_176129 ) ) ( not ( = ?auto_176125 ?auto_176130 ) ) ( not ( = ?auto_176125 ?auto_176131 ) ) ( not ( = ?auto_176126 ?auto_176127 ) ) ( not ( = ?auto_176126 ?auto_176128 ) ) ( not ( = ?auto_176126 ?auto_176129 ) ) ( not ( = ?auto_176126 ?auto_176130 ) ) ( not ( = ?auto_176126 ?auto_176131 ) ) ( not ( = ?auto_176127 ?auto_176128 ) ) ( not ( = ?auto_176127 ?auto_176129 ) ) ( not ( = ?auto_176127 ?auto_176130 ) ) ( not ( = ?auto_176127 ?auto_176131 ) ) ( not ( = ?auto_176128 ?auto_176129 ) ) ( not ( = ?auto_176128 ?auto_176130 ) ) ( not ( = ?auto_176128 ?auto_176131 ) ) ( not ( = ?auto_176129 ?auto_176130 ) ) ( not ( = ?auto_176129 ?auto_176131 ) ) ( not ( = ?auto_176130 ?auto_176131 ) ) ( ON ?auto_176131 ?auto_176132 ) ( not ( = ?auto_176124 ?auto_176132 ) ) ( not ( = ?auto_176125 ?auto_176132 ) ) ( not ( = ?auto_176126 ?auto_176132 ) ) ( not ( = ?auto_176127 ?auto_176132 ) ) ( not ( = ?auto_176128 ?auto_176132 ) ) ( not ( = ?auto_176129 ?auto_176132 ) ) ( not ( = ?auto_176130 ?auto_176132 ) ) ( not ( = ?auto_176131 ?auto_176132 ) ) ( ON ?auto_176130 ?auto_176131 ) ( ON-TABLE ?auto_176132 ) ( CLEAR ?auto_176128 ) ( ON ?auto_176129 ?auto_176130 ) ( CLEAR ?auto_176129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176132 ?auto_176131 ?auto_176130 )
      ( MAKE-8PILE ?auto_176124 ?auto_176125 ?auto_176126 ?auto_176127 ?auto_176128 ?auto_176129 ?auto_176130 ?auto_176131 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176133 - BLOCK
      ?auto_176134 - BLOCK
      ?auto_176135 - BLOCK
      ?auto_176136 - BLOCK
      ?auto_176137 - BLOCK
      ?auto_176138 - BLOCK
      ?auto_176139 - BLOCK
      ?auto_176140 - BLOCK
    )
    :vars
    (
      ?auto_176141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176133 ) ( ON ?auto_176134 ?auto_176133 ) ( ON ?auto_176135 ?auto_176134 ) ( ON ?auto_176136 ?auto_176135 ) ( not ( = ?auto_176133 ?auto_176134 ) ) ( not ( = ?auto_176133 ?auto_176135 ) ) ( not ( = ?auto_176133 ?auto_176136 ) ) ( not ( = ?auto_176133 ?auto_176137 ) ) ( not ( = ?auto_176133 ?auto_176138 ) ) ( not ( = ?auto_176133 ?auto_176139 ) ) ( not ( = ?auto_176133 ?auto_176140 ) ) ( not ( = ?auto_176134 ?auto_176135 ) ) ( not ( = ?auto_176134 ?auto_176136 ) ) ( not ( = ?auto_176134 ?auto_176137 ) ) ( not ( = ?auto_176134 ?auto_176138 ) ) ( not ( = ?auto_176134 ?auto_176139 ) ) ( not ( = ?auto_176134 ?auto_176140 ) ) ( not ( = ?auto_176135 ?auto_176136 ) ) ( not ( = ?auto_176135 ?auto_176137 ) ) ( not ( = ?auto_176135 ?auto_176138 ) ) ( not ( = ?auto_176135 ?auto_176139 ) ) ( not ( = ?auto_176135 ?auto_176140 ) ) ( not ( = ?auto_176136 ?auto_176137 ) ) ( not ( = ?auto_176136 ?auto_176138 ) ) ( not ( = ?auto_176136 ?auto_176139 ) ) ( not ( = ?auto_176136 ?auto_176140 ) ) ( not ( = ?auto_176137 ?auto_176138 ) ) ( not ( = ?auto_176137 ?auto_176139 ) ) ( not ( = ?auto_176137 ?auto_176140 ) ) ( not ( = ?auto_176138 ?auto_176139 ) ) ( not ( = ?auto_176138 ?auto_176140 ) ) ( not ( = ?auto_176139 ?auto_176140 ) ) ( ON ?auto_176140 ?auto_176141 ) ( not ( = ?auto_176133 ?auto_176141 ) ) ( not ( = ?auto_176134 ?auto_176141 ) ) ( not ( = ?auto_176135 ?auto_176141 ) ) ( not ( = ?auto_176136 ?auto_176141 ) ) ( not ( = ?auto_176137 ?auto_176141 ) ) ( not ( = ?auto_176138 ?auto_176141 ) ) ( not ( = ?auto_176139 ?auto_176141 ) ) ( not ( = ?auto_176140 ?auto_176141 ) ) ( ON ?auto_176139 ?auto_176140 ) ( ON-TABLE ?auto_176141 ) ( ON ?auto_176138 ?auto_176139 ) ( CLEAR ?auto_176138 ) ( HOLDING ?auto_176137 ) ( CLEAR ?auto_176136 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176133 ?auto_176134 ?auto_176135 ?auto_176136 ?auto_176137 )
      ( MAKE-8PILE ?auto_176133 ?auto_176134 ?auto_176135 ?auto_176136 ?auto_176137 ?auto_176138 ?auto_176139 ?auto_176140 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176142 - BLOCK
      ?auto_176143 - BLOCK
      ?auto_176144 - BLOCK
      ?auto_176145 - BLOCK
      ?auto_176146 - BLOCK
      ?auto_176147 - BLOCK
      ?auto_176148 - BLOCK
      ?auto_176149 - BLOCK
    )
    :vars
    (
      ?auto_176150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176142 ) ( ON ?auto_176143 ?auto_176142 ) ( ON ?auto_176144 ?auto_176143 ) ( ON ?auto_176145 ?auto_176144 ) ( not ( = ?auto_176142 ?auto_176143 ) ) ( not ( = ?auto_176142 ?auto_176144 ) ) ( not ( = ?auto_176142 ?auto_176145 ) ) ( not ( = ?auto_176142 ?auto_176146 ) ) ( not ( = ?auto_176142 ?auto_176147 ) ) ( not ( = ?auto_176142 ?auto_176148 ) ) ( not ( = ?auto_176142 ?auto_176149 ) ) ( not ( = ?auto_176143 ?auto_176144 ) ) ( not ( = ?auto_176143 ?auto_176145 ) ) ( not ( = ?auto_176143 ?auto_176146 ) ) ( not ( = ?auto_176143 ?auto_176147 ) ) ( not ( = ?auto_176143 ?auto_176148 ) ) ( not ( = ?auto_176143 ?auto_176149 ) ) ( not ( = ?auto_176144 ?auto_176145 ) ) ( not ( = ?auto_176144 ?auto_176146 ) ) ( not ( = ?auto_176144 ?auto_176147 ) ) ( not ( = ?auto_176144 ?auto_176148 ) ) ( not ( = ?auto_176144 ?auto_176149 ) ) ( not ( = ?auto_176145 ?auto_176146 ) ) ( not ( = ?auto_176145 ?auto_176147 ) ) ( not ( = ?auto_176145 ?auto_176148 ) ) ( not ( = ?auto_176145 ?auto_176149 ) ) ( not ( = ?auto_176146 ?auto_176147 ) ) ( not ( = ?auto_176146 ?auto_176148 ) ) ( not ( = ?auto_176146 ?auto_176149 ) ) ( not ( = ?auto_176147 ?auto_176148 ) ) ( not ( = ?auto_176147 ?auto_176149 ) ) ( not ( = ?auto_176148 ?auto_176149 ) ) ( ON ?auto_176149 ?auto_176150 ) ( not ( = ?auto_176142 ?auto_176150 ) ) ( not ( = ?auto_176143 ?auto_176150 ) ) ( not ( = ?auto_176144 ?auto_176150 ) ) ( not ( = ?auto_176145 ?auto_176150 ) ) ( not ( = ?auto_176146 ?auto_176150 ) ) ( not ( = ?auto_176147 ?auto_176150 ) ) ( not ( = ?auto_176148 ?auto_176150 ) ) ( not ( = ?auto_176149 ?auto_176150 ) ) ( ON ?auto_176148 ?auto_176149 ) ( ON-TABLE ?auto_176150 ) ( ON ?auto_176147 ?auto_176148 ) ( CLEAR ?auto_176145 ) ( ON ?auto_176146 ?auto_176147 ) ( CLEAR ?auto_176146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176150 ?auto_176149 ?auto_176148 ?auto_176147 )
      ( MAKE-8PILE ?auto_176142 ?auto_176143 ?auto_176144 ?auto_176145 ?auto_176146 ?auto_176147 ?auto_176148 ?auto_176149 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176151 - BLOCK
      ?auto_176152 - BLOCK
      ?auto_176153 - BLOCK
      ?auto_176154 - BLOCK
      ?auto_176155 - BLOCK
      ?auto_176156 - BLOCK
      ?auto_176157 - BLOCK
      ?auto_176158 - BLOCK
    )
    :vars
    (
      ?auto_176159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176151 ) ( ON ?auto_176152 ?auto_176151 ) ( ON ?auto_176153 ?auto_176152 ) ( not ( = ?auto_176151 ?auto_176152 ) ) ( not ( = ?auto_176151 ?auto_176153 ) ) ( not ( = ?auto_176151 ?auto_176154 ) ) ( not ( = ?auto_176151 ?auto_176155 ) ) ( not ( = ?auto_176151 ?auto_176156 ) ) ( not ( = ?auto_176151 ?auto_176157 ) ) ( not ( = ?auto_176151 ?auto_176158 ) ) ( not ( = ?auto_176152 ?auto_176153 ) ) ( not ( = ?auto_176152 ?auto_176154 ) ) ( not ( = ?auto_176152 ?auto_176155 ) ) ( not ( = ?auto_176152 ?auto_176156 ) ) ( not ( = ?auto_176152 ?auto_176157 ) ) ( not ( = ?auto_176152 ?auto_176158 ) ) ( not ( = ?auto_176153 ?auto_176154 ) ) ( not ( = ?auto_176153 ?auto_176155 ) ) ( not ( = ?auto_176153 ?auto_176156 ) ) ( not ( = ?auto_176153 ?auto_176157 ) ) ( not ( = ?auto_176153 ?auto_176158 ) ) ( not ( = ?auto_176154 ?auto_176155 ) ) ( not ( = ?auto_176154 ?auto_176156 ) ) ( not ( = ?auto_176154 ?auto_176157 ) ) ( not ( = ?auto_176154 ?auto_176158 ) ) ( not ( = ?auto_176155 ?auto_176156 ) ) ( not ( = ?auto_176155 ?auto_176157 ) ) ( not ( = ?auto_176155 ?auto_176158 ) ) ( not ( = ?auto_176156 ?auto_176157 ) ) ( not ( = ?auto_176156 ?auto_176158 ) ) ( not ( = ?auto_176157 ?auto_176158 ) ) ( ON ?auto_176158 ?auto_176159 ) ( not ( = ?auto_176151 ?auto_176159 ) ) ( not ( = ?auto_176152 ?auto_176159 ) ) ( not ( = ?auto_176153 ?auto_176159 ) ) ( not ( = ?auto_176154 ?auto_176159 ) ) ( not ( = ?auto_176155 ?auto_176159 ) ) ( not ( = ?auto_176156 ?auto_176159 ) ) ( not ( = ?auto_176157 ?auto_176159 ) ) ( not ( = ?auto_176158 ?auto_176159 ) ) ( ON ?auto_176157 ?auto_176158 ) ( ON-TABLE ?auto_176159 ) ( ON ?auto_176156 ?auto_176157 ) ( ON ?auto_176155 ?auto_176156 ) ( CLEAR ?auto_176155 ) ( HOLDING ?auto_176154 ) ( CLEAR ?auto_176153 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176151 ?auto_176152 ?auto_176153 ?auto_176154 )
      ( MAKE-8PILE ?auto_176151 ?auto_176152 ?auto_176153 ?auto_176154 ?auto_176155 ?auto_176156 ?auto_176157 ?auto_176158 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176160 - BLOCK
      ?auto_176161 - BLOCK
      ?auto_176162 - BLOCK
      ?auto_176163 - BLOCK
      ?auto_176164 - BLOCK
      ?auto_176165 - BLOCK
      ?auto_176166 - BLOCK
      ?auto_176167 - BLOCK
    )
    :vars
    (
      ?auto_176168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176160 ) ( ON ?auto_176161 ?auto_176160 ) ( ON ?auto_176162 ?auto_176161 ) ( not ( = ?auto_176160 ?auto_176161 ) ) ( not ( = ?auto_176160 ?auto_176162 ) ) ( not ( = ?auto_176160 ?auto_176163 ) ) ( not ( = ?auto_176160 ?auto_176164 ) ) ( not ( = ?auto_176160 ?auto_176165 ) ) ( not ( = ?auto_176160 ?auto_176166 ) ) ( not ( = ?auto_176160 ?auto_176167 ) ) ( not ( = ?auto_176161 ?auto_176162 ) ) ( not ( = ?auto_176161 ?auto_176163 ) ) ( not ( = ?auto_176161 ?auto_176164 ) ) ( not ( = ?auto_176161 ?auto_176165 ) ) ( not ( = ?auto_176161 ?auto_176166 ) ) ( not ( = ?auto_176161 ?auto_176167 ) ) ( not ( = ?auto_176162 ?auto_176163 ) ) ( not ( = ?auto_176162 ?auto_176164 ) ) ( not ( = ?auto_176162 ?auto_176165 ) ) ( not ( = ?auto_176162 ?auto_176166 ) ) ( not ( = ?auto_176162 ?auto_176167 ) ) ( not ( = ?auto_176163 ?auto_176164 ) ) ( not ( = ?auto_176163 ?auto_176165 ) ) ( not ( = ?auto_176163 ?auto_176166 ) ) ( not ( = ?auto_176163 ?auto_176167 ) ) ( not ( = ?auto_176164 ?auto_176165 ) ) ( not ( = ?auto_176164 ?auto_176166 ) ) ( not ( = ?auto_176164 ?auto_176167 ) ) ( not ( = ?auto_176165 ?auto_176166 ) ) ( not ( = ?auto_176165 ?auto_176167 ) ) ( not ( = ?auto_176166 ?auto_176167 ) ) ( ON ?auto_176167 ?auto_176168 ) ( not ( = ?auto_176160 ?auto_176168 ) ) ( not ( = ?auto_176161 ?auto_176168 ) ) ( not ( = ?auto_176162 ?auto_176168 ) ) ( not ( = ?auto_176163 ?auto_176168 ) ) ( not ( = ?auto_176164 ?auto_176168 ) ) ( not ( = ?auto_176165 ?auto_176168 ) ) ( not ( = ?auto_176166 ?auto_176168 ) ) ( not ( = ?auto_176167 ?auto_176168 ) ) ( ON ?auto_176166 ?auto_176167 ) ( ON-TABLE ?auto_176168 ) ( ON ?auto_176165 ?auto_176166 ) ( ON ?auto_176164 ?auto_176165 ) ( CLEAR ?auto_176162 ) ( ON ?auto_176163 ?auto_176164 ) ( CLEAR ?auto_176163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176168 ?auto_176167 ?auto_176166 ?auto_176165 ?auto_176164 )
      ( MAKE-8PILE ?auto_176160 ?auto_176161 ?auto_176162 ?auto_176163 ?auto_176164 ?auto_176165 ?auto_176166 ?auto_176167 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176169 - BLOCK
      ?auto_176170 - BLOCK
      ?auto_176171 - BLOCK
      ?auto_176172 - BLOCK
      ?auto_176173 - BLOCK
      ?auto_176174 - BLOCK
      ?auto_176175 - BLOCK
      ?auto_176176 - BLOCK
    )
    :vars
    (
      ?auto_176177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176169 ) ( ON ?auto_176170 ?auto_176169 ) ( not ( = ?auto_176169 ?auto_176170 ) ) ( not ( = ?auto_176169 ?auto_176171 ) ) ( not ( = ?auto_176169 ?auto_176172 ) ) ( not ( = ?auto_176169 ?auto_176173 ) ) ( not ( = ?auto_176169 ?auto_176174 ) ) ( not ( = ?auto_176169 ?auto_176175 ) ) ( not ( = ?auto_176169 ?auto_176176 ) ) ( not ( = ?auto_176170 ?auto_176171 ) ) ( not ( = ?auto_176170 ?auto_176172 ) ) ( not ( = ?auto_176170 ?auto_176173 ) ) ( not ( = ?auto_176170 ?auto_176174 ) ) ( not ( = ?auto_176170 ?auto_176175 ) ) ( not ( = ?auto_176170 ?auto_176176 ) ) ( not ( = ?auto_176171 ?auto_176172 ) ) ( not ( = ?auto_176171 ?auto_176173 ) ) ( not ( = ?auto_176171 ?auto_176174 ) ) ( not ( = ?auto_176171 ?auto_176175 ) ) ( not ( = ?auto_176171 ?auto_176176 ) ) ( not ( = ?auto_176172 ?auto_176173 ) ) ( not ( = ?auto_176172 ?auto_176174 ) ) ( not ( = ?auto_176172 ?auto_176175 ) ) ( not ( = ?auto_176172 ?auto_176176 ) ) ( not ( = ?auto_176173 ?auto_176174 ) ) ( not ( = ?auto_176173 ?auto_176175 ) ) ( not ( = ?auto_176173 ?auto_176176 ) ) ( not ( = ?auto_176174 ?auto_176175 ) ) ( not ( = ?auto_176174 ?auto_176176 ) ) ( not ( = ?auto_176175 ?auto_176176 ) ) ( ON ?auto_176176 ?auto_176177 ) ( not ( = ?auto_176169 ?auto_176177 ) ) ( not ( = ?auto_176170 ?auto_176177 ) ) ( not ( = ?auto_176171 ?auto_176177 ) ) ( not ( = ?auto_176172 ?auto_176177 ) ) ( not ( = ?auto_176173 ?auto_176177 ) ) ( not ( = ?auto_176174 ?auto_176177 ) ) ( not ( = ?auto_176175 ?auto_176177 ) ) ( not ( = ?auto_176176 ?auto_176177 ) ) ( ON ?auto_176175 ?auto_176176 ) ( ON-TABLE ?auto_176177 ) ( ON ?auto_176174 ?auto_176175 ) ( ON ?auto_176173 ?auto_176174 ) ( ON ?auto_176172 ?auto_176173 ) ( CLEAR ?auto_176172 ) ( HOLDING ?auto_176171 ) ( CLEAR ?auto_176170 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176169 ?auto_176170 ?auto_176171 )
      ( MAKE-8PILE ?auto_176169 ?auto_176170 ?auto_176171 ?auto_176172 ?auto_176173 ?auto_176174 ?auto_176175 ?auto_176176 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176178 - BLOCK
      ?auto_176179 - BLOCK
      ?auto_176180 - BLOCK
      ?auto_176181 - BLOCK
      ?auto_176182 - BLOCK
      ?auto_176183 - BLOCK
      ?auto_176184 - BLOCK
      ?auto_176185 - BLOCK
    )
    :vars
    (
      ?auto_176186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176178 ) ( ON ?auto_176179 ?auto_176178 ) ( not ( = ?auto_176178 ?auto_176179 ) ) ( not ( = ?auto_176178 ?auto_176180 ) ) ( not ( = ?auto_176178 ?auto_176181 ) ) ( not ( = ?auto_176178 ?auto_176182 ) ) ( not ( = ?auto_176178 ?auto_176183 ) ) ( not ( = ?auto_176178 ?auto_176184 ) ) ( not ( = ?auto_176178 ?auto_176185 ) ) ( not ( = ?auto_176179 ?auto_176180 ) ) ( not ( = ?auto_176179 ?auto_176181 ) ) ( not ( = ?auto_176179 ?auto_176182 ) ) ( not ( = ?auto_176179 ?auto_176183 ) ) ( not ( = ?auto_176179 ?auto_176184 ) ) ( not ( = ?auto_176179 ?auto_176185 ) ) ( not ( = ?auto_176180 ?auto_176181 ) ) ( not ( = ?auto_176180 ?auto_176182 ) ) ( not ( = ?auto_176180 ?auto_176183 ) ) ( not ( = ?auto_176180 ?auto_176184 ) ) ( not ( = ?auto_176180 ?auto_176185 ) ) ( not ( = ?auto_176181 ?auto_176182 ) ) ( not ( = ?auto_176181 ?auto_176183 ) ) ( not ( = ?auto_176181 ?auto_176184 ) ) ( not ( = ?auto_176181 ?auto_176185 ) ) ( not ( = ?auto_176182 ?auto_176183 ) ) ( not ( = ?auto_176182 ?auto_176184 ) ) ( not ( = ?auto_176182 ?auto_176185 ) ) ( not ( = ?auto_176183 ?auto_176184 ) ) ( not ( = ?auto_176183 ?auto_176185 ) ) ( not ( = ?auto_176184 ?auto_176185 ) ) ( ON ?auto_176185 ?auto_176186 ) ( not ( = ?auto_176178 ?auto_176186 ) ) ( not ( = ?auto_176179 ?auto_176186 ) ) ( not ( = ?auto_176180 ?auto_176186 ) ) ( not ( = ?auto_176181 ?auto_176186 ) ) ( not ( = ?auto_176182 ?auto_176186 ) ) ( not ( = ?auto_176183 ?auto_176186 ) ) ( not ( = ?auto_176184 ?auto_176186 ) ) ( not ( = ?auto_176185 ?auto_176186 ) ) ( ON ?auto_176184 ?auto_176185 ) ( ON-TABLE ?auto_176186 ) ( ON ?auto_176183 ?auto_176184 ) ( ON ?auto_176182 ?auto_176183 ) ( ON ?auto_176181 ?auto_176182 ) ( CLEAR ?auto_176179 ) ( ON ?auto_176180 ?auto_176181 ) ( CLEAR ?auto_176180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176186 ?auto_176185 ?auto_176184 ?auto_176183 ?auto_176182 ?auto_176181 )
      ( MAKE-8PILE ?auto_176178 ?auto_176179 ?auto_176180 ?auto_176181 ?auto_176182 ?auto_176183 ?auto_176184 ?auto_176185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176187 - BLOCK
      ?auto_176188 - BLOCK
      ?auto_176189 - BLOCK
      ?auto_176190 - BLOCK
      ?auto_176191 - BLOCK
      ?auto_176192 - BLOCK
      ?auto_176193 - BLOCK
      ?auto_176194 - BLOCK
    )
    :vars
    (
      ?auto_176195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176187 ) ( not ( = ?auto_176187 ?auto_176188 ) ) ( not ( = ?auto_176187 ?auto_176189 ) ) ( not ( = ?auto_176187 ?auto_176190 ) ) ( not ( = ?auto_176187 ?auto_176191 ) ) ( not ( = ?auto_176187 ?auto_176192 ) ) ( not ( = ?auto_176187 ?auto_176193 ) ) ( not ( = ?auto_176187 ?auto_176194 ) ) ( not ( = ?auto_176188 ?auto_176189 ) ) ( not ( = ?auto_176188 ?auto_176190 ) ) ( not ( = ?auto_176188 ?auto_176191 ) ) ( not ( = ?auto_176188 ?auto_176192 ) ) ( not ( = ?auto_176188 ?auto_176193 ) ) ( not ( = ?auto_176188 ?auto_176194 ) ) ( not ( = ?auto_176189 ?auto_176190 ) ) ( not ( = ?auto_176189 ?auto_176191 ) ) ( not ( = ?auto_176189 ?auto_176192 ) ) ( not ( = ?auto_176189 ?auto_176193 ) ) ( not ( = ?auto_176189 ?auto_176194 ) ) ( not ( = ?auto_176190 ?auto_176191 ) ) ( not ( = ?auto_176190 ?auto_176192 ) ) ( not ( = ?auto_176190 ?auto_176193 ) ) ( not ( = ?auto_176190 ?auto_176194 ) ) ( not ( = ?auto_176191 ?auto_176192 ) ) ( not ( = ?auto_176191 ?auto_176193 ) ) ( not ( = ?auto_176191 ?auto_176194 ) ) ( not ( = ?auto_176192 ?auto_176193 ) ) ( not ( = ?auto_176192 ?auto_176194 ) ) ( not ( = ?auto_176193 ?auto_176194 ) ) ( ON ?auto_176194 ?auto_176195 ) ( not ( = ?auto_176187 ?auto_176195 ) ) ( not ( = ?auto_176188 ?auto_176195 ) ) ( not ( = ?auto_176189 ?auto_176195 ) ) ( not ( = ?auto_176190 ?auto_176195 ) ) ( not ( = ?auto_176191 ?auto_176195 ) ) ( not ( = ?auto_176192 ?auto_176195 ) ) ( not ( = ?auto_176193 ?auto_176195 ) ) ( not ( = ?auto_176194 ?auto_176195 ) ) ( ON ?auto_176193 ?auto_176194 ) ( ON-TABLE ?auto_176195 ) ( ON ?auto_176192 ?auto_176193 ) ( ON ?auto_176191 ?auto_176192 ) ( ON ?auto_176190 ?auto_176191 ) ( ON ?auto_176189 ?auto_176190 ) ( CLEAR ?auto_176189 ) ( HOLDING ?auto_176188 ) ( CLEAR ?auto_176187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176187 ?auto_176188 )
      ( MAKE-8PILE ?auto_176187 ?auto_176188 ?auto_176189 ?auto_176190 ?auto_176191 ?auto_176192 ?auto_176193 ?auto_176194 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176196 - BLOCK
      ?auto_176197 - BLOCK
      ?auto_176198 - BLOCK
      ?auto_176199 - BLOCK
      ?auto_176200 - BLOCK
      ?auto_176201 - BLOCK
      ?auto_176202 - BLOCK
      ?auto_176203 - BLOCK
    )
    :vars
    (
      ?auto_176204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176196 ) ( not ( = ?auto_176196 ?auto_176197 ) ) ( not ( = ?auto_176196 ?auto_176198 ) ) ( not ( = ?auto_176196 ?auto_176199 ) ) ( not ( = ?auto_176196 ?auto_176200 ) ) ( not ( = ?auto_176196 ?auto_176201 ) ) ( not ( = ?auto_176196 ?auto_176202 ) ) ( not ( = ?auto_176196 ?auto_176203 ) ) ( not ( = ?auto_176197 ?auto_176198 ) ) ( not ( = ?auto_176197 ?auto_176199 ) ) ( not ( = ?auto_176197 ?auto_176200 ) ) ( not ( = ?auto_176197 ?auto_176201 ) ) ( not ( = ?auto_176197 ?auto_176202 ) ) ( not ( = ?auto_176197 ?auto_176203 ) ) ( not ( = ?auto_176198 ?auto_176199 ) ) ( not ( = ?auto_176198 ?auto_176200 ) ) ( not ( = ?auto_176198 ?auto_176201 ) ) ( not ( = ?auto_176198 ?auto_176202 ) ) ( not ( = ?auto_176198 ?auto_176203 ) ) ( not ( = ?auto_176199 ?auto_176200 ) ) ( not ( = ?auto_176199 ?auto_176201 ) ) ( not ( = ?auto_176199 ?auto_176202 ) ) ( not ( = ?auto_176199 ?auto_176203 ) ) ( not ( = ?auto_176200 ?auto_176201 ) ) ( not ( = ?auto_176200 ?auto_176202 ) ) ( not ( = ?auto_176200 ?auto_176203 ) ) ( not ( = ?auto_176201 ?auto_176202 ) ) ( not ( = ?auto_176201 ?auto_176203 ) ) ( not ( = ?auto_176202 ?auto_176203 ) ) ( ON ?auto_176203 ?auto_176204 ) ( not ( = ?auto_176196 ?auto_176204 ) ) ( not ( = ?auto_176197 ?auto_176204 ) ) ( not ( = ?auto_176198 ?auto_176204 ) ) ( not ( = ?auto_176199 ?auto_176204 ) ) ( not ( = ?auto_176200 ?auto_176204 ) ) ( not ( = ?auto_176201 ?auto_176204 ) ) ( not ( = ?auto_176202 ?auto_176204 ) ) ( not ( = ?auto_176203 ?auto_176204 ) ) ( ON ?auto_176202 ?auto_176203 ) ( ON-TABLE ?auto_176204 ) ( ON ?auto_176201 ?auto_176202 ) ( ON ?auto_176200 ?auto_176201 ) ( ON ?auto_176199 ?auto_176200 ) ( ON ?auto_176198 ?auto_176199 ) ( CLEAR ?auto_176196 ) ( ON ?auto_176197 ?auto_176198 ) ( CLEAR ?auto_176197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176204 ?auto_176203 ?auto_176202 ?auto_176201 ?auto_176200 ?auto_176199 ?auto_176198 )
      ( MAKE-8PILE ?auto_176196 ?auto_176197 ?auto_176198 ?auto_176199 ?auto_176200 ?auto_176201 ?auto_176202 ?auto_176203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176205 - BLOCK
      ?auto_176206 - BLOCK
      ?auto_176207 - BLOCK
      ?auto_176208 - BLOCK
      ?auto_176209 - BLOCK
      ?auto_176210 - BLOCK
      ?auto_176211 - BLOCK
      ?auto_176212 - BLOCK
    )
    :vars
    (
      ?auto_176213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176205 ?auto_176206 ) ) ( not ( = ?auto_176205 ?auto_176207 ) ) ( not ( = ?auto_176205 ?auto_176208 ) ) ( not ( = ?auto_176205 ?auto_176209 ) ) ( not ( = ?auto_176205 ?auto_176210 ) ) ( not ( = ?auto_176205 ?auto_176211 ) ) ( not ( = ?auto_176205 ?auto_176212 ) ) ( not ( = ?auto_176206 ?auto_176207 ) ) ( not ( = ?auto_176206 ?auto_176208 ) ) ( not ( = ?auto_176206 ?auto_176209 ) ) ( not ( = ?auto_176206 ?auto_176210 ) ) ( not ( = ?auto_176206 ?auto_176211 ) ) ( not ( = ?auto_176206 ?auto_176212 ) ) ( not ( = ?auto_176207 ?auto_176208 ) ) ( not ( = ?auto_176207 ?auto_176209 ) ) ( not ( = ?auto_176207 ?auto_176210 ) ) ( not ( = ?auto_176207 ?auto_176211 ) ) ( not ( = ?auto_176207 ?auto_176212 ) ) ( not ( = ?auto_176208 ?auto_176209 ) ) ( not ( = ?auto_176208 ?auto_176210 ) ) ( not ( = ?auto_176208 ?auto_176211 ) ) ( not ( = ?auto_176208 ?auto_176212 ) ) ( not ( = ?auto_176209 ?auto_176210 ) ) ( not ( = ?auto_176209 ?auto_176211 ) ) ( not ( = ?auto_176209 ?auto_176212 ) ) ( not ( = ?auto_176210 ?auto_176211 ) ) ( not ( = ?auto_176210 ?auto_176212 ) ) ( not ( = ?auto_176211 ?auto_176212 ) ) ( ON ?auto_176212 ?auto_176213 ) ( not ( = ?auto_176205 ?auto_176213 ) ) ( not ( = ?auto_176206 ?auto_176213 ) ) ( not ( = ?auto_176207 ?auto_176213 ) ) ( not ( = ?auto_176208 ?auto_176213 ) ) ( not ( = ?auto_176209 ?auto_176213 ) ) ( not ( = ?auto_176210 ?auto_176213 ) ) ( not ( = ?auto_176211 ?auto_176213 ) ) ( not ( = ?auto_176212 ?auto_176213 ) ) ( ON ?auto_176211 ?auto_176212 ) ( ON-TABLE ?auto_176213 ) ( ON ?auto_176210 ?auto_176211 ) ( ON ?auto_176209 ?auto_176210 ) ( ON ?auto_176208 ?auto_176209 ) ( ON ?auto_176207 ?auto_176208 ) ( ON ?auto_176206 ?auto_176207 ) ( CLEAR ?auto_176206 ) ( HOLDING ?auto_176205 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176205 )
      ( MAKE-8PILE ?auto_176205 ?auto_176206 ?auto_176207 ?auto_176208 ?auto_176209 ?auto_176210 ?auto_176211 ?auto_176212 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_176214 - BLOCK
      ?auto_176215 - BLOCK
      ?auto_176216 - BLOCK
      ?auto_176217 - BLOCK
      ?auto_176218 - BLOCK
      ?auto_176219 - BLOCK
      ?auto_176220 - BLOCK
      ?auto_176221 - BLOCK
    )
    :vars
    (
      ?auto_176222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176214 ?auto_176215 ) ) ( not ( = ?auto_176214 ?auto_176216 ) ) ( not ( = ?auto_176214 ?auto_176217 ) ) ( not ( = ?auto_176214 ?auto_176218 ) ) ( not ( = ?auto_176214 ?auto_176219 ) ) ( not ( = ?auto_176214 ?auto_176220 ) ) ( not ( = ?auto_176214 ?auto_176221 ) ) ( not ( = ?auto_176215 ?auto_176216 ) ) ( not ( = ?auto_176215 ?auto_176217 ) ) ( not ( = ?auto_176215 ?auto_176218 ) ) ( not ( = ?auto_176215 ?auto_176219 ) ) ( not ( = ?auto_176215 ?auto_176220 ) ) ( not ( = ?auto_176215 ?auto_176221 ) ) ( not ( = ?auto_176216 ?auto_176217 ) ) ( not ( = ?auto_176216 ?auto_176218 ) ) ( not ( = ?auto_176216 ?auto_176219 ) ) ( not ( = ?auto_176216 ?auto_176220 ) ) ( not ( = ?auto_176216 ?auto_176221 ) ) ( not ( = ?auto_176217 ?auto_176218 ) ) ( not ( = ?auto_176217 ?auto_176219 ) ) ( not ( = ?auto_176217 ?auto_176220 ) ) ( not ( = ?auto_176217 ?auto_176221 ) ) ( not ( = ?auto_176218 ?auto_176219 ) ) ( not ( = ?auto_176218 ?auto_176220 ) ) ( not ( = ?auto_176218 ?auto_176221 ) ) ( not ( = ?auto_176219 ?auto_176220 ) ) ( not ( = ?auto_176219 ?auto_176221 ) ) ( not ( = ?auto_176220 ?auto_176221 ) ) ( ON ?auto_176221 ?auto_176222 ) ( not ( = ?auto_176214 ?auto_176222 ) ) ( not ( = ?auto_176215 ?auto_176222 ) ) ( not ( = ?auto_176216 ?auto_176222 ) ) ( not ( = ?auto_176217 ?auto_176222 ) ) ( not ( = ?auto_176218 ?auto_176222 ) ) ( not ( = ?auto_176219 ?auto_176222 ) ) ( not ( = ?auto_176220 ?auto_176222 ) ) ( not ( = ?auto_176221 ?auto_176222 ) ) ( ON ?auto_176220 ?auto_176221 ) ( ON-TABLE ?auto_176222 ) ( ON ?auto_176219 ?auto_176220 ) ( ON ?auto_176218 ?auto_176219 ) ( ON ?auto_176217 ?auto_176218 ) ( ON ?auto_176216 ?auto_176217 ) ( ON ?auto_176215 ?auto_176216 ) ( ON ?auto_176214 ?auto_176215 ) ( CLEAR ?auto_176214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176222 ?auto_176221 ?auto_176220 ?auto_176219 ?auto_176218 ?auto_176217 ?auto_176216 ?auto_176215 )
      ( MAKE-8PILE ?auto_176214 ?auto_176215 ?auto_176216 ?auto_176217 ?auto_176218 ?auto_176219 ?auto_176220 ?auto_176221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176230 - BLOCK
      ?auto_176231 - BLOCK
      ?auto_176232 - BLOCK
      ?auto_176233 - BLOCK
      ?auto_176234 - BLOCK
      ?auto_176235 - BLOCK
      ?auto_176236 - BLOCK
    )
    :vars
    (
      ?auto_176237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176237 ?auto_176236 ) ( CLEAR ?auto_176237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176230 ) ( ON ?auto_176231 ?auto_176230 ) ( ON ?auto_176232 ?auto_176231 ) ( ON ?auto_176233 ?auto_176232 ) ( ON ?auto_176234 ?auto_176233 ) ( ON ?auto_176235 ?auto_176234 ) ( ON ?auto_176236 ?auto_176235 ) ( not ( = ?auto_176230 ?auto_176231 ) ) ( not ( = ?auto_176230 ?auto_176232 ) ) ( not ( = ?auto_176230 ?auto_176233 ) ) ( not ( = ?auto_176230 ?auto_176234 ) ) ( not ( = ?auto_176230 ?auto_176235 ) ) ( not ( = ?auto_176230 ?auto_176236 ) ) ( not ( = ?auto_176230 ?auto_176237 ) ) ( not ( = ?auto_176231 ?auto_176232 ) ) ( not ( = ?auto_176231 ?auto_176233 ) ) ( not ( = ?auto_176231 ?auto_176234 ) ) ( not ( = ?auto_176231 ?auto_176235 ) ) ( not ( = ?auto_176231 ?auto_176236 ) ) ( not ( = ?auto_176231 ?auto_176237 ) ) ( not ( = ?auto_176232 ?auto_176233 ) ) ( not ( = ?auto_176232 ?auto_176234 ) ) ( not ( = ?auto_176232 ?auto_176235 ) ) ( not ( = ?auto_176232 ?auto_176236 ) ) ( not ( = ?auto_176232 ?auto_176237 ) ) ( not ( = ?auto_176233 ?auto_176234 ) ) ( not ( = ?auto_176233 ?auto_176235 ) ) ( not ( = ?auto_176233 ?auto_176236 ) ) ( not ( = ?auto_176233 ?auto_176237 ) ) ( not ( = ?auto_176234 ?auto_176235 ) ) ( not ( = ?auto_176234 ?auto_176236 ) ) ( not ( = ?auto_176234 ?auto_176237 ) ) ( not ( = ?auto_176235 ?auto_176236 ) ) ( not ( = ?auto_176235 ?auto_176237 ) ) ( not ( = ?auto_176236 ?auto_176237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176237 ?auto_176236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176255 - BLOCK
      ?auto_176256 - BLOCK
      ?auto_176257 - BLOCK
      ?auto_176258 - BLOCK
      ?auto_176259 - BLOCK
      ?auto_176260 - BLOCK
      ?auto_176261 - BLOCK
    )
    :vars
    (
      ?auto_176262 - BLOCK
      ?auto_176263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176255 ) ( ON ?auto_176256 ?auto_176255 ) ( ON ?auto_176257 ?auto_176256 ) ( ON ?auto_176258 ?auto_176257 ) ( ON ?auto_176259 ?auto_176258 ) ( ON ?auto_176260 ?auto_176259 ) ( not ( = ?auto_176255 ?auto_176256 ) ) ( not ( = ?auto_176255 ?auto_176257 ) ) ( not ( = ?auto_176255 ?auto_176258 ) ) ( not ( = ?auto_176255 ?auto_176259 ) ) ( not ( = ?auto_176255 ?auto_176260 ) ) ( not ( = ?auto_176255 ?auto_176261 ) ) ( not ( = ?auto_176255 ?auto_176262 ) ) ( not ( = ?auto_176256 ?auto_176257 ) ) ( not ( = ?auto_176256 ?auto_176258 ) ) ( not ( = ?auto_176256 ?auto_176259 ) ) ( not ( = ?auto_176256 ?auto_176260 ) ) ( not ( = ?auto_176256 ?auto_176261 ) ) ( not ( = ?auto_176256 ?auto_176262 ) ) ( not ( = ?auto_176257 ?auto_176258 ) ) ( not ( = ?auto_176257 ?auto_176259 ) ) ( not ( = ?auto_176257 ?auto_176260 ) ) ( not ( = ?auto_176257 ?auto_176261 ) ) ( not ( = ?auto_176257 ?auto_176262 ) ) ( not ( = ?auto_176258 ?auto_176259 ) ) ( not ( = ?auto_176258 ?auto_176260 ) ) ( not ( = ?auto_176258 ?auto_176261 ) ) ( not ( = ?auto_176258 ?auto_176262 ) ) ( not ( = ?auto_176259 ?auto_176260 ) ) ( not ( = ?auto_176259 ?auto_176261 ) ) ( not ( = ?auto_176259 ?auto_176262 ) ) ( not ( = ?auto_176260 ?auto_176261 ) ) ( not ( = ?auto_176260 ?auto_176262 ) ) ( not ( = ?auto_176261 ?auto_176262 ) ) ( ON ?auto_176262 ?auto_176263 ) ( CLEAR ?auto_176262 ) ( not ( = ?auto_176255 ?auto_176263 ) ) ( not ( = ?auto_176256 ?auto_176263 ) ) ( not ( = ?auto_176257 ?auto_176263 ) ) ( not ( = ?auto_176258 ?auto_176263 ) ) ( not ( = ?auto_176259 ?auto_176263 ) ) ( not ( = ?auto_176260 ?auto_176263 ) ) ( not ( = ?auto_176261 ?auto_176263 ) ) ( not ( = ?auto_176262 ?auto_176263 ) ) ( HOLDING ?auto_176261 ) ( CLEAR ?auto_176260 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176255 ?auto_176256 ?auto_176257 ?auto_176258 ?auto_176259 ?auto_176260 ?auto_176261 ?auto_176262 )
      ( MAKE-7PILE ?auto_176255 ?auto_176256 ?auto_176257 ?auto_176258 ?auto_176259 ?auto_176260 ?auto_176261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176264 - BLOCK
      ?auto_176265 - BLOCK
      ?auto_176266 - BLOCK
      ?auto_176267 - BLOCK
      ?auto_176268 - BLOCK
      ?auto_176269 - BLOCK
      ?auto_176270 - BLOCK
    )
    :vars
    (
      ?auto_176271 - BLOCK
      ?auto_176272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176264 ) ( ON ?auto_176265 ?auto_176264 ) ( ON ?auto_176266 ?auto_176265 ) ( ON ?auto_176267 ?auto_176266 ) ( ON ?auto_176268 ?auto_176267 ) ( ON ?auto_176269 ?auto_176268 ) ( not ( = ?auto_176264 ?auto_176265 ) ) ( not ( = ?auto_176264 ?auto_176266 ) ) ( not ( = ?auto_176264 ?auto_176267 ) ) ( not ( = ?auto_176264 ?auto_176268 ) ) ( not ( = ?auto_176264 ?auto_176269 ) ) ( not ( = ?auto_176264 ?auto_176270 ) ) ( not ( = ?auto_176264 ?auto_176271 ) ) ( not ( = ?auto_176265 ?auto_176266 ) ) ( not ( = ?auto_176265 ?auto_176267 ) ) ( not ( = ?auto_176265 ?auto_176268 ) ) ( not ( = ?auto_176265 ?auto_176269 ) ) ( not ( = ?auto_176265 ?auto_176270 ) ) ( not ( = ?auto_176265 ?auto_176271 ) ) ( not ( = ?auto_176266 ?auto_176267 ) ) ( not ( = ?auto_176266 ?auto_176268 ) ) ( not ( = ?auto_176266 ?auto_176269 ) ) ( not ( = ?auto_176266 ?auto_176270 ) ) ( not ( = ?auto_176266 ?auto_176271 ) ) ( not ( = ?auto_176267 ?auto_176268 ) ) ( not ( = ?auto_176267 ?auto_176269 ) ) ( not ( = ?auto_176267 ?auto_176270 ) ) ( not ( = ?auto_176267 ?auto_176271 ) ) ( not ( = ?auto_176268 ?auto_176269 ) ) ( not ( = ?auto_176268 ?auto_176270 ) ) ( not ( = ?auto_176268 ?auto_176271 ) ) ( not ( = ?auto_176269 ?auto_176270 ) ) ( not ( = ?auto_176269 ?auto_176271 ) ) ( not ( = ?auto_176270 ?auto_176271 ) ) ( ON ?auto_176271 ?auto_176272 ) ( not ( = ?auto_176264 ?auto_176272 ) ) ( not ( = ?auto_176265 ?auto_176272 ) ) ( not ( = ?auto_176266 ?auto_176272 ) ) ( not ( = ?auto_176267 ?auto_176272 ) ) ( not ( = ?auto_176268 ?auto_176272 ) ) ( not ( = ?auto_176269 ?auto_176272 ) ) ( not ( = ?auto_176270 ?auto_176272 ) ) ( not ( = ?auto_176271 ?auto_176272 ) ) ( CLEAR ?auto_176269 ) ( ON ?auto_176270 ?auto_176271 ) ( CLEAR ?auto_176270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176272 ?auto_176271 )
      ( MAKE-7PILE ?auto_176264 ?auto_176265 ?auto_176266 ?auto_176267 ?auto_176268 ?auto_176269 ?auto_176270 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176273 - BLOCK
      ?auto_176274 - BLOCK
      ?auto_176275 - BLOCK
      ?auto_176276 - BLOCK
      ?auto_176277 - BLOCK
      ?auto_176278 - BLOCK
      ?auto_176279 - BLOCK
    )
    :vars
    (
      ?auto_176280 - BLOCK
      ?auto_176281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176273 ) ( ON ?auto_176274 ?auto_176273 ) ( ON ?auto_176275 ?auto_176274 ) ( ON ?auto_176276 ?auto_176275 ) ( ON ?auto_176277 ?auto_176276 ) ( not ( = ?auto_176273 ?auto_176274 ) ) ( not ( = ?auto_176273 ?auto_176275 ) ) ( not ( = ?auto_176273 ?auto_176276 ) ) ( not ( = ?auto_176273 ?auto_176277 ) ) ( not ( = ?auto_176273 ?auto_176278 ) ) ( not ( = ?auto_176273 ?auto_176279 ) ) ( not ( = ?auto_176273 ?auto_176280 ) ) ( not ( = ?auto_176274 ?auto_176275 ) ) ( not ( = ?auto_176274 ?auto_176276 ) ) ( not ( = ?auto_176274 ?auto_176277 ) ) ( not ( = ?auto_176274 ?auto_176278 ) ) ( not ( = ?auto_176274 ?auto_176279 ) ) ( not ( = ?auto_176274 ?auto_176280 ) ) ( not ( = ?auto_176275 ?auto_176276 ) ) ( not ( = ?auto_176275 ?auto_176277 ) ) ( not ( = ?auto_176275 ?auto_176278 ) ) ( not ( = ?auto_176275 ?auto_176279 ) ) ( not ( = ?auto_176275 ?auto_176280 ) ) ( not ( = ?auto_176276 ?auto_176277 ) ) ( not ( = ?auto_176276 ?auto_176278 ) ) ( not ( = ?auto_176276 ?auto_176279 ) ) ( not ( = ?auto_176276 ?auto_176280 ) ) ( not ( = ?auto_176277 ?auto_176278 ) ) ( not ( = ?auto_176277 ?auto_176279 ) ) ( not ( = ?auto_176277 ?auto_176280 ) ) ( not ( = ?auto_176278 ?auto_176279 ) ) ( not ( = ?auto_176278 ?auto_176280 ) ) ( not ( = ?auto_176279 ?auto_176280 ) ) ( ON ?auto_176280 ?auto_176281 ) ( not ( = ?auto_176273 ?auto_176281 ) ) ( not ( = ?auto_176274 ?auto_176281 ) ) ( not ( = ?auto_176275 ?auto_176281 ) ) ( not ( = ?auto_176276 ?auto_176281 ) ) ( not ( = ?auto_176277 ?auto_176281 ) ) ( not ( = ?auto_176278 ?auto_176281 ) ) ( not ( = ?auto_176279 ?auto_176281 ) ) ( not ( = ?auto_176280 ?auto_176281 ) ) ( ON ?auto_176279 ?auto_176280 ) ( CLEAR ?auto_176279 ) ( ON-TABLE ?auto_176281 ) ( HOLDING ?auto_176278 ) ( CLEAR ?auto_176277 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176273 ?auto_176274 ?auto_176275 ?auto_176276 ?auto_176277 ?auto_176278 )
      ( MAKE-7PILE ?auto_176273 ?auto_176274 ?auto_176275 ?auto_176276 ?auto_176277 ?auto_176278 ?auto_176279 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176282 - BLOCK
      ?auto_176283 - BLOCK
      ?auto_176284 - BLOCK
      ?auto_176285 - BLOCK
      ?auto_176286 - BLOCK
      ?auto_176287 - BLOCK
      ?auto_176288 - BLOCK
    )
    :vars
    (
      ?auto_176290 - BLOCK
      ?auto_176289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176282 ) ( ON ?auto_176283 ?auto_176282 ) ( ON ?auto_176284 ?auto_176283 ) ( ON ?auto_176285 ?auto_176284 ) ( ON ?auto_176286 ?auto_176285 ) ( not ( = ?auto_176282 ?auto_176283 ) ) ( not ( = ?auto_176282 ?auto_176284 ) ) ( not ( = ?auto_176282 ?auto_176285 ) ) ( not ( = ?auto_176282 ?auto_176286 ) ) ( not ( = ?auto_176282 ?auto_176287 ) ) ( not ( = ?auto_176282 ?auto_176288 ) ) ( not ( = ?auto_176282 ?auto_176290 ) ) ( not ( = ?auto_176283 ?auto_176284 ) ) ( not ( = ?auto_176283 ?auto_176285 ) ) ( not ( = ?auto_176283 ?auto_176286 ) ) ( not ( = ?auto_176283 ?auto_176287 ) ) ( not ( = ?auto_176283 ?auto_176288 ) ) ( not ( = ?auto_176283 ?auto_176290 ) ) ( not ( = ?auto_176284 ?auto_176285 ) ) ( not ( = ?auto_176284 ?auto_176286 ) ) ( not ( = ?auto_176284 ?auto_176287 ) ) ( not ( = ?auto_176284 ?auto_176288 ) ) ( not ( = ?auto_176284 ?auto_176290 ) ) ( not ( = ?auto_176285 ?auto_176286 ) ) ( not ( = ?auto_176285 ?auto_176287 ) ) ( not ( = ?auto_176285 ?auto_176288 ) ) ( not ( = ?auto_176285 ?auto_176290 ) ) ( not ( = ?auto_176286 ?auto_176287 ) ) ( not ( = ?auto_176286 ?auto_176288 ) ) ( not ( = ?auto_176286 ?auto_176290 ) ) ( not ( = ?auto_176287 ?auto_176288 ) ) ( not ( = ?auto_176287 ?auto_176290 ) ) ( not ( = ?auto_176288 ?auto_176290 ) ) ( ON ?auto_176290 ?auto_176289 ) ( not ( = ?auto_176282 ?auto_176289 ) ) ( not ( = ?auto_176283 ?auto_176289 ) ) ( not ( = ?auto_176284 ?auto_176289 ) ) ( not ( = ?auto_176285 ?auto_176289 ) ) ( not ( = ?auto_176286 ?auto_176289 ) ) ( not ( = ?auto_176287 ?auto_176289 ) ) ( not ( = ?auto_176288 ?auto_176289 ) ) ( not ( = ?auto_176290 ?auto_176289 ) ) ( ON ?auto_176288 ?auto_176290 ) ( ON-TABLE ?auto_176289 ) ( CLEAR ?auto_176286 ) ( ON ?auto_176287 ?auto_176288 ) ( CLEAR ?auto_176287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176289 ?auto_176290 ?auto_176288 )
      ( MAKE-7PILE ?auto_176282 ?auto_176283 ?auto_176284 ?auto_176285 ?auto_176286 ?auto_176287 ?auto_176288 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176291 - BLOCK
      ?auto_176292 - BLOCK
      ?auto_176293 - BLOCK
      ?auto_176294 - BLOCK
      ?auto_176295 - BLOCK
      ?auto_176296 - BLOCK
      ?auto_176297 - BLOCK
    )
    :vars
    (
      ?auto_176299 - BLOCK
      ?auto_176298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176291 ) ( ON ?auto_176292 ?auto_176291 ) ( ON ?auto_176293 ?auto_176292 ) ( ON ?auto_176294 ?auto_176293 ) ( not ( = ?auto_176291 ?auto_176292 ) ) ( not ( = ?auto_176291 ?auto_176293 ) ) ( not ( = ?auto_176291 ?auto_176294 ) ) ( not ( = ?auto_176291 ?auto_176295 ) ) ( not ( = ?auto_176291 ?auto_176296 ) ) ( not ( = ?auto_176291 ?auto_176297 ) ) ( not ( = ?auto_176291 ?auto_176299 ) ) ( not ( = ?auto_176292 ?auto_176293 ) ) ( not ( = ?auto_176292 ?auto_176294 ) ) ( not ( = ?auto_176292 ?auto_176295 ) ) ( not ( = ?auto_176292 ?auto_176296 ) ) ( not ( = ?auto_176292 ?auto_176297 ) ) ( not ( = ?auto_176292 ?auto_176299 ) ) ( not ( = ?auto_176293 ?auto_176294 ) ) ( not ( = ?auto_176293 ?auto_176295 ) ) ( not ( = ?auto_176293 ?auto_176296 ) ) ( not ( = ?auto_176293 ?auto_176297 ) ) ( not ( = ?auto_176293 ?auto_176299 ) ) ( not ( = ?auto_176294 ?auto_176295 ) ) ( not ( = ?auto_176294 ?auto_176296 ) ) ( not ( = ?auto_176294 ?auto_176297 ) ) ( not ( = ?auto_176294 ?auto_176299 ) ) ( not ( = ?auto_176295 ?auto_176296 ) ) ( not ( = ?auto_176295 ?auto_176297 ) ) ( not ( = ?auto_176295 ?auto_176299 ) ) ( not ( = ?auto_176296 ?auto_176297 ) ) ( not ( = ?auto_176296 ?auto_176299 ) ) ( not ( = ?auto_176297 ?auto_176299 ) ) ( ON ?auto_176299 ?auto_176298 ) ( not ( = ?auto_176291 ?auto_176298 ) ) ( not ( = ?auto_176292 ?auto_176298 ) ) ( not ( = ?auto_176293 ?auto_176298 ) ) ( not ( = ?auto_176294 ?auto_176298 ) ) ( not ( = ?auto_176295 ?auto_176298 ) ) ( not ( = ?auto_176296 ?auto_176298 ) ) ( not ( = ?auto_176297 ?auto_176298 ) ) ( not ( = ?auto_176299 ?auto_176298 ) ) ( ON ?auto_176297 ?auto_176299 ) ( ON-TABLE ?auto_176298 ) ( ON ?auto_176296 ?auto_176297 ) ( CLEAR ?auto_176296 ) ( HOLDING ?auto_176295 ) ( CLEAR ?auto_176294 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176291 ?auto_176292 ?auto_176293 ?auto_176294 ?auto_176295 )
      ( MAKE-7PILE ?auto_176291 ?auto_176292 ?auto_176293 ?auto_176294 ?auto_176295 ?auto_176296 ?auto_176297 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176300 - BLOCK
      ?auto_176301 - BLOCK
      ?auto_176302 - BLOCK
      ?auto_176303 - BLOCK
      ?auto_176304 - BLOCK
      ?auto_176305 - BLOCK
      ?auto_176306 - BLOCK
    )
    :vars
    (
      ?auto_176307 - BLOCK
      ?auto_176308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176300 ) ( ON ?auto_176301 ?auto_176300 ) ( ON ?auto_176302 ?auto_176301 ) ( ON ?auto_176303 ?auto_176302 ) ( not ( = ?auto_176300 ?auto_176301 ) ) ( not ( = ?auto_176300 ?auto_176302 ) ) ( not ( = ?auto_176300 ?auto_176303 ) ) ( not ( = ?auto_176300 ?auto_176304 ) ) ( not ( = ?auto_176300 ?auto_176305 ) ) ( not ( = ?auto_176300 ?auto_176306 ) ) ( not ( = ?auto_176300 ?auto_176307 ) ) ( not ( = ?auto_176301 ?auto_176302 ) ) ( not ( = ?auto_176301 ?auto_176303 ) ) ( not ( = ?auto_176301 ?auto_176304 ) ) ( not ( = ?auto_176301 ?auto_176305 ) ) ( not ( = ?auto_176301 ?auto_176306 ) ) ( not ( = ?auto_176301 ?auto_176307 ) ) ( not ( = ?auto_176302 ?auto_176303 ) ) ( not ( = ?auto_176302 ?auto_176304 ) ) ( not ( = ?auto_176302 ?auto_176305 ) ) ( not ( = ?auto_176302 ?auto_176306 ) ) ( not ( = ?auto_176302 ?auto_176307 ) ) ( not ( = ?auto_176303 ?auto_176304 ) ) ( not ( = ?auto_176303 ?auto_176305 ) ) ( not ( = ?auto_176303 ?auto_176306 ) ) ( not ( = ?auto_176303 ?auto_176307 ) ) ( not ( = ?auto_176304 ?auto_176305 ) ) ( not ( = ?auto_176304 ?auto_176306 ) ) ( not ( = ?auto_176304 ?auto_176307 ) ) ( not ( = ?auto_176305 ?auto_176306 ) ) ( not ( = ?auto_176305 ?auto_176307 ) ) ( not ( = ?auto_176306 ?auto_176307 ) ) ( ON ?auto_176307 ?auto_176308 ) ( not ( = ?auto_176300 ?auto_176308 ) ) ( not ( = ?auto_176301 ?auto_176308 ) ) ( not ( = ?auto_176302 ?auto_176308 ) ) ( not ( = ?auto_176303 ?auto_176308 ) ) ( not ( = ?auto_176304 ?auto_176308 ) ) ( not ( = ?auto_176305 ?auto_176308 ) ) ( not ( = ?auto_176306 ?auto_176308 ) ) ( not ( = ?auto_176307 ?auto_176308 ) ) ( ON ?auto_176306 ?auto_176307 ) ( ON-TABLE ?auto_176308 ) ( ON ?auto_176305 ?auto_176306 ) ( CLEAR ?auto_176303 ) ( ON ?auto_176304 ?auto_176305 ) ( CLEAR ?auto_176304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176308 ?auto_176307 ?auto_176306 ?auto_176305 )
      ( MAKE-7PILE ?auto_176300 ?auto_176301 ?auto_176302 ?auto_176303 ?auto_176304 ?auto_176305 ?auto_176306 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176309 - BLOCK
      ?auto_176310 - BLOCK
      ?auto_176311 - BLOCK
      ?auto_176312 - BLOCK
      ?auto_176313 - BLOCK
      ?auto_176314 - BLOCK
      ?auto_176315 - BLOCK
    )
    :vars
    (
      ?auto_176316 - BLOCK
      ?auto_176317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176309 ) ( ON ?auto_176310 ?auto_176309 ) ( ON ?auto_176311 ?auto_176310 ) ( not ( = ?auto_176309 ?auto_176310 ) ) ( not ( = ?auto_176309 ?auto_176311 ) ) ( not ( = ?auto_176309 ?auto_176312 ) ) ( not ( = ?auto_176309 ?auto_176313 ) ) ( not ( = ?auto_176309 ?auto_176314 ) ) ( not ( = ?auto_176309 ?auto_176315 ) ) ( not ( = ?auto_176309 ?auto_176316 ) ) ( not ( = ?auto_176310 ?auto_176311 ) ) ( not ( = ?auto_176310 ?auto_176312 ) ) ( not ( = ?auto_176310 ?auto_176313 ) ) ( not ( = ?auto_176310 ?auto_176314 ) ) ( not ( = ?auto_176310 ?auto_176315 ) ) ( not ( = ?auto_176310 ?auto_176316 ) ) ( not ( = ?auto_176311 ?auto_176312 ) ) ( not ( = ?auto_176311 ?auto_176313 ) ) ( not ( = ?auto_176311 ?auto_176314 ) ) ( not ( = ?auto_176311 ?auto_176315 ) ) ( not ( = ?auto_176311 ?auto_176316 ) ) ( not ( = ?auto_176312 ?auto_176313 ) ) ( not ( = ?auto_176312 ?auto_176314 ) ) ( not ( = ?auto_176312 ?auto_176315 ) ) ( not ( = ?auto_176312 ?auto_176316 ) ) ( not ( = ?auto_176313 ?auto_176314 ) ) ( not ( = ?auto_176313 ?auto_176315 ) ) ( not ( = ?auto_176313 ?auto_176316 ) ) ( not ( = ?auto_176314 ?auto_176315 ) ) ( not ( = ?auto_176314 ?auto_176316 ) ) ( not ( = ?auto_176315 ?auto_176316 ) ) ( ON ?auto_176316 ?auto_176317 ) ( not ( = ?auto_176309 ?auto_176317 ) ) ( not ( = ?auto_176310 ?auto_176317 ) ) ( not ( = ?auto_176311 ?auto_176317 ) ) ( not ( = ?auto_176312 ?auto_176317 ) ) ( not ( = ?auto_176313 ?auto_176317 ) ) ( not ( = ?auto_176314 ?auto_176317 ) ) ( not ( = ?auto_176315 ?auto_176317 ) ) ( not ( = ?auto_176316 ?auto_176317 ) ) ( ON ?auto_176315 ?auto_176316 ) ( ON-TABLE ?auto_176317 ) ( ON ?auto_176314 ?auto_176315 ) ( ON ?auto_176313 ?auto_176314 ) ( CLEAR ?auto_176313 ) ( HOLDING ?auto_176312 ) ( CLEAR ?auto_176311 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176309 ?auto_176310 ?auto_176311 ?auto_176312 )
      ( MAKE-7PILE ?auto_176309 ?auto_176310 ?auto_176311 ?auto_176312 ?auto_176313 ?auto_176314 ?auto_176315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176318 - BLOCK
      ?auto_176319 - BLOCK
      ?auto_176320 - BLOCK
      ?auto_176321 - BLOCK
      ?auto_176322 - BLOCK
      ?auto_176323 - BLOCK
      ?auto_176324 - BLOCK
    )
    :vars
    (
      ?auto_176325 - BLOCK
      ?auto_176326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176318 ) ( ON ?auto_176319 ?auto_176318 ) ( ON ?auto_176320 ?auto_176319 ) ( not ( = ?auto_176318 ?auto_176319 ) ) ( not ( = ?auto_176318 ?auto_176320 ) ) ( not ( = ?auto_176318 ?auto_176321 ) ) ( not ( = ?auto_176318 ?auto_176322 ) ) ( not ( = ?auto_176318 ?auto_176323 ) ) ( not ( = ?auto_176318 ?auto_176324 ) ) ( not ( = ?auto_176318 ?auto_176325 ) ) ( not ( = ?auto_176319 ?auto_176320 ) ) ( not ( = ?auto_176319 ?auto_176321 ) ) ( not ( = ?auto_176319 ?auto_176322 ) ) ( not ( = ?auto_176319 ?auto_176323 ) ) ( not ( = ?auto_176319 ?auto_176324 ) ) ( not ( = ?auto_176319 ?auto_176325 ) ) ( not ( = ?auto_176320 ?auto_176321 ) ) ( not ( = ?auto_176320 ?auto_176322 ) ) ( not ( = ?auto_176320 ?auto_176323 ) ) ( not ( = ?auto_176320 ?auto_176324 ) ) ( not ( = ?auto_176320 ?auto_176325 ) ) ( not ( = ?auto_176321 ?auto_176322 ) ) ( not ( = ?auto_176321 ?auto_176323 ) ) ( not ( = ?auto_176321 ?auto_176324 ) ) ( not ( = ?auto_176321 ?auto_176325 ) ) ( not ( = ?auto_176322 ?auto_176323 ) ) ( not ( = ?auto_176322 ?auto_176324 ) ) ( not ( = ?auto_176322 ?auto_176325 ) ) ( not ( = ?auto_176323 ?auto_176324 ) ) ( not ( = ?auto_176323 ?auto_176325 ) ) ( not ( = ?auto_176324 ?auto_176325 ) ) ( ON ?auto_176325 ?auto_176326 ) ( not ( = ?auto_176318 ?auto_176326 ) ) ( not ( = ?auto_176319 ?auto_176326 ) ) ( not ( = ?auto_176320 ?auto_176326 ) ) ( not ( = ?auto_176321 ?auto_176326 ) ) ( not ( = ?auto_176322 ?auto_176326 ) ) ( not ( = ?auto_176323 ?auto_176326 ) ) ( not ( = ?auto_176324 ?auto_176326 ) ) ( not ( = ?auto_176325 ?auto_176326 ) ) ( ON ?auto_176324 ?auto_176325 ) ( ON-TABLE ?auto_176326 ) ( ON ?auto_176323 ?auto_176324 ) ( ON ?auto_176322 ?auto_176323 ) ( CLEAR ?auto_176320 ) ( ON ?auto_176321 ?auto_176322 ) ( CLEAR ?auto_176321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176326 ?auto_176325 ?auto_176324 ?auto_176323 ?auto_176322 )
      ( MAKE-7PILE ?auto_176318 ?auto_176319 ?auto_176320 ?auto_176321 ?auto_176322 ?auto_176323 ?auto_176324 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176327 - BLOCK
      ?auto_176328 - BLOCK
      ?auto_176329 - BLOCK
      ?auto_176330 - BLOCK
      ?auto_176331 - BLOCK
      ?auto_176332 - BLOCK
      ?auto_176333 - BLOCK
    )
    :vars
    (
      ?auto_176334 - BLOCK
      ?auto_176335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176327 ) ( ON ?auto_176328 ?auto_176327 ) ( not ( = ?auto_176327 ?auto_176328 ) ) ( not ( = ?auto_176327 ?auto_176329 ) ) ( not ( = ?auto_176327 ?auto_176330 ) ) ( not ( = ?auto_176327 ?auto_176331 ) ) ( not ( = ?auto_176327 ?auto_176332 ) ) ( not ( = ?auto_176327 ?auto_176333 ) ) ( not ( = ?auto_176327 ?auto_176334 ) ) ( not ( = ?auto_176328 ?auto_176329 ) ) ( not ( = ?auto_176328 ?auto_176330 ) ) ( not ( = ?auto_176328 ?auto_176331 ) ) ( not ( = ?auto_176328 ?auto_176332 ) ) ( not ( = ?auto_176328 ?auto_176333 ) ) ( not ( = ?auto_176328 ?auto_176334 ) ) ( not ( = ?auto_176329 ?auto_176330 ) ) ( not ( = ?auto_176329 ?auto_176331 ) ) ( not ( = ?auto_176329 ?auto_176332 ) ) ( not ( = ?auto_176329 ?auto_176333 ) ) ( not ( = ?auto_176329 ?auto_176334 ) ) ( not ( = ?auto_176330 ?auto_176331 ) ) ( not ( = ?auto_176330 ?auto_176332 ) ) ( not ( = ?auto_176330 ?auto_176333 ) ) ( not ( = ?auto_176330 ?auto_176334 ) ) ( not ( = ?auto_176331 ?auto_176332 ) ) ( not ( = ?auto_176331 ?auto_176333 ) ) ( not ( = ?auto_176331 ?auto_176334 ) ) ( not ( = ?auto_176332 ?auto_176333 ) ) ( not ( = ?auto_176332 ?auto_176334 ) ) ( not ( = ?auto_176333 ?auto_176334 ) ) ( ON ?auto_176334 ?auto_176335 ) ( not ( = ?auto_176327 ?auto_176335 ) ) ( not ( = ?auto_176328 ?auto_176335 ) ) ( not ( = ?auto_176329 ?auto_176335 ) ) ( not ( = ?auto_176330 ?auto_176335 ) ) ( not ( = ?auto_176331 ?auto_176335 ) ) ( not ( = ?auto_176332 ?auto_176335 ) ) ( not ( = ?auto_176333 ?auto_176335 ) ) ( not ( = ?auto_176334 ?auto_176335 ) ) ( ON ?auto_176333 ?auto_176334 ) ( ON-TABLE ?auto_176335 ) ( ON ?auto_176332 ?auto_176333 ) ( ON ?auto_176331 ?auto_176332 ) ( ON ?auto_176330 ?auto_176331 ) ( CLEAR ?auto_176330 ) ( HOLDING ?auto_176329 ) ( CLEAR ?auto_176328 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176327 ?auto_176328 ?auto_176329 )
      ( MAKE-7PILE ?auto_176327 ?auto_176328 ?auto_176329 ?auto_176330 ?auto_176331 ?auto_176332 ?auto_176333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176336 - BLOCK
      ?auto_176337 - BLOCK
      ?auto_176338 - BLOCK
      ?auto_176339 - BLOCK
      ?auto_176340 - BLOCK
      ?auto_176341 - BLOCK
      ?auto_176342 - BLOCK
    )
    :vars
    (
      ?auto_176344 - BLOCK
      ?auto_176343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176336 ) ( ON ?auto_176337 ?auto_176336 ) ( not ( = ?auto_176336 ?auto_176337 ) ) ( not ( = ?auto_176336 ?auto_176338 ) ) ( not ( = ?auto_176336 ?auto_176339 ) ) ( not ( = ?auto_176336 ?auto_176340 ) ) ( not ( = ?auto_176336 ?auto_176341 ) ) ( not ( = ?auto_176336 ?auto_176342 ) ) ( not ( = ?auto_176336 ?auto_176344 ) ) ( not ( = ?auto_176337 ?auto_176338 ) ) ( not ( = ?auto_176337 ?auto_176339 ) ) ( not ( = ?auto_176337 ?auto_176340 ) ) ( not ( = ?auto_176337 ?auto_176341 ) ) ( not ( = ?auto_176337 ?auto_176342 ) ) ( not ( = ?auto_176337 ?auto_176344 ) ) ( not ( = ?auto_176338 ?auto_176339 ) ) ( not ( = ?auto_176338 ?auto_176340 ) ) ( not ( = ?auto_176338 ?auto_176341 ) ) ( not ( = ?auto_176338 ?auto_176342 ) ) ( not ( = ?auto_176338 ?auto_176344 ) ) ( not ( = ?auto_176339 ?auto_176340 ) ) ( not ( = ?auto_176339 ?auto_176341 ) ) ( not ( = ?auto_176339 ?auto_176342 ) ) ( not ( = ?auto_176339 ?auto_176344 ) ) ( not ( = ?auto_176340 ?auto_176341 ) ) ( not ( = ?auto_176340 ?auto_176342 ) ) ( not ( = ?auto_176340 ?auto_176344 ) ) ( not ( = ?auto_176341 ?auto_176342 ) ) ( not ( = ?auto_176341 ?auto_176344 ) ) ( not ( = ?auto_176342 ?auto_176344 ) ) ( ON ?auto_176344 ?auto_176343 ) ( not ( = ?auto_176336 ?auto_176343 ) ) ( not ( = ?auto_176337 ?auto_176343 ) ) ( not ( = ?auto_176338 ?auto_176343 ) ) ( not ( = ?auto_176339 ?auto_176343 ) ) ( not ( = ?auto_176340 ?auto_176343 ) ) ( not ( = ?auto_176341 ?auto_176343 ) ) ( not ( = ?auto_176342 ?auto_176343 ) ) ( not ( = ?auto_176344 ?auto_176343 ) ) ( ON ?auto_176342 ?auto_176344 ) ( ON-TABLE ?auto_176343 ) ( ON ?auto_176341 ?auto_176342 ) ( ON ?auto_176340 ?auto_176341 ) ( ON ?auto_176339 ?auto_176340 ) ( CLEAR ?auto_176337 ) ( ON ?auto_176338 ?auto_176339 ) ( CLEAR ?auto_176338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176343 ?auto_176344 ?auto_176342 ?auto_176341 ?auto_176340 ?auto_176339 )
      ( MAKE-7PILE ?auto_176336 ?auto_176337 ?auto_176338 ?auto_176339 ?auto_176340 ?auto_176341 ?auto_176342 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176345 - BLOCK
      ?auto_176346 - BLOCK
      ?auto_176347 - BLOCK
      ?auto_176348 - BLOCK
      ?auto_176349 - BLOCK
      ?auto_176350 - BLOCK
      ?auto_176351 - BLOCK
    )
    :vars
    (
      ?auto_176353 - BLOCK
      ?auto_176352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176345 ) ( not ( = ?auto_176345 ?auto_176346 ) ) ( not ( = ?auto_176345 ?auto_176347 ) ) ( not ( = ?auto_176345 ?auto_176348 ) ) ( not ( = ?auto_176345 ?auto_176349 ) ) ( not ( = ?auto_176345 ?auto_176350 ) ) ( not ( = ?auto_176345 ?auto_176351 ) ) ( not ( = ?auto_176345 ?auto_176353 ) ) ( not ( = ?auto_176346 ?auto_176347 ) ) ( not ( = ?auto_176346 ?auto_176348 ) ) ( not ( = ?auto_176346 ?auto_176349 ) ) ( not ( = ?auto_176346 ?auto_176350 ) ) ( not ( = ?auto_176346 ?auto_176351 ) ) ( not ( = ?auto_176346 ?auto_176353 ) ) ( not ( = ?auto_176347 ?auto_176348 ) ) ( not ( = ?auto_176347 ?auto_176349 ) ) ( not ( = ?auto_176347 ?auto_176350 ) ) ( not ( = ?auto_176347 ?auto_176351 ) ) ( not ( = ?auto_176347 ?auto_176353 ) ) ( not ( = ?auto_176348 ?auto_176349 ) ) ( not ( = ?auto_176348 ?auto_176350 ) ) ( not ( = ?auto_176348 ?auto_176351 ) ) ( not ( = ?auto_176348 ?auto_176353 ) ) ( not ( = ?auto_176349 ?auto_176350 ) ) ( not ( = ?auto_176349 ?auto_176351 ) ) ( not ( = ?auto_176349 ?auto_176353 ) ) ( not ( = ?auto_176350 ?auto_176351 ) ) ( not ( = ?auto_176350 ?auto_176353 ) ) ( not ( = ?auto_176351 ?auto_176353 ) ) ( ON ?auto_176353 ?auto_176352 ) ( not ( = ?auto_176345 ?auto_176352 ) ) ( not ( = ?auto_176346 ?auto_176352 ) ) ( not ( = ?auto_176347 ?auto_176352 ) ) ( not ( = ?auto_176348 ?auto_176352 ) ) ( not ( = ?auto_176349 ?auto_176352 ) ) ( not ( = ?auto_176350 ?auto_176352 ) ) ( not ( = ?auto_176351 ?auto_176352 ) ) ( not ( = ?auto_176353 ?auto_176352 ) ) ( ON ?auto_176351 ?auto_176353 ) ( ON-TABLE ?auto_176352 ) ( ON ?auto_176350 ?auto_176351 ) ( ON ?auto_176349 ?auto_176350 ) ( ON ?auto_176348 ?auto_176349 ) ( ON ?auto_176347 ?auto_176348 ) ( CLEAR ?auto_176347 ) ( HOLDING ?auto_176346 ) ( CLEAR ?auto_176345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176345 ?auto_176346 )
      ( MAKE-7PILE ?auto_176345 ?auto_176346 ?auto_176347 ?auto_176348 ?auto_176349 ?auto_176350 ?auto_176351 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176354 - BLOCK
      ?auto_176355 - BLOCK
      ?auto_176356 - BLOCK
      ?auto_176357 - BLOCK
      ?auto_176358 - BLOCK
      ?auto_176359 - BLOCK
      ?auto_176360 - BLOCK
    )
    :vars
    (
      ?auto_176362 - BLOCK
      ?auto_176361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176354 ) ( not ( = ?auto_176354 ?auto_176355 ) ) ( not ( = ?auto_176354 ?auto_176356 ) ) ( not ( = ?auto_176354 ?auto_176357 ) ) ( not ( = ?auto_176354 ?auto_176358 ) ) ( not ( = ?auto_176354 ?auto_176359 ) ) ( not ( = ?auto_176354 ?auto_176360 ) ) ( not ( = ?auto_176354 ?auto_176362 ) ) ( not ( = ?auto_176355 ?auto_176356 ) ) ( not ( = ?auto_176355 ?auto_176357 ) ) ( not ( = ?auto_176355 ?auto_176358 ) ) ( not ( = ?auto_176355 ?auto_176359 ) ) ( not ( = ?auto_176355 ?auto_176360 ) ) ( not ( = ?auto_176355 ?auto_176362 ) ) ( not ( = ?auto_176356 ?auto_176357 ) ) ( not ( = ?auto_176356 ?auto_176358 ) ) ( not ( = ?auto_176356 ?auto_176359 ) ) ( not ( = ?auto_176356 ?auto_176360 ) ) ( not ( = ?auto_176356 ?auto_176362 ) ) ( not ( = ?auto_176357 ?auto_176358 ) ) ( not ( = ?auto_176357 ?auto_176359 ) ) ( not ( = ?auto_176357 ?auto_176360 ) ) ( not ( = ?auto_176357 ?auto_176362 ) ) ( not ( = ?auto_176358 ?auto_176359 ) ) ( not ( = ?auto_176358 ?auto_176360 ) ) ( not ( = ?auto_176358 ?auto_176362 ) ) ( not ( = ?auto_176359 ?auto_176360 ) ) ( not ( = ?auto_176359 ?auto_176362 ) ) ( not ( = ?auto_176360 ?auto_176362 ) ) ( ON ?auto_176362 ?auto_176361 ) ( not ( = ?auto_176354 ?auto_176361 ) ) ( not ( = ?auto_176355 ?auto_176361 ) ) ( not ( = ?auto_176356 ?auto_176361 ) ) ( not ( = ?auto_176357 ?auto_176361 ) ) ( not ( = ?auto_176358 ?auto_176361 ) ) ( not ( = ?auto_176359 ?auto_176361 ) ) ( not ( = ?auto_176360 ?auto_176361 ) ) ( not ( = ?auto_176362 ?auto_176361 ) ) ( ON ?auto_176360 ?auto_176362 ) ( ON-TABLE ?auto_176361 ) ( ON ?auto_176359 ?auto_176360 ) ( ON ?auto_176358 ?auto_176359 ) ( ON ?auto_176357 ?auto_176358 ) ( ON ?auto_176356 ?auto_176357 ) ( CLEAR ?auto_176354 ) ( ON ?auto_176355 ?auto_176356 ) ( CLEAR ?auto_176355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176361 ?auto_176362 ?auto_176360 ?auto_176359 ?auto_176358 ?auto_176357 ?auto_176356 )
      ( MAKE-7PILE ?auto_176354 ?auto_176355 ?auto_176356 ?auto_176357 ?auto_176358 ?auto_176359 ?auto_176360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176363 - BLOCK
      ?auto_176364 - BLOCK
      ?auto_176365 - BLOCK
      ?auto_176366 - BLOCK
      ?auto_176367 - BLOCK
      ?auto_176368 - BLOCK
      ?auto_176369 - BLOCK
    )
    :vars
    (
      ?auto_176371 - BLOCK
      ?auto_176370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176363 ?auto_176364 ) ) ( not ( = ?auto_176363 ?auto_176365 ) ) ( not ( = ?auto_176363 ?auto_176366 ) ) ( not ( = ?auto_176363 ?auto_176367 ) ) ( not ( = ?auto_176363 ?auto_176368 ) ) ( not ( = ?auto_176363 ?auto_176369 ) ) ( not ( = ?auto_176363 ?auto_176371 ) ) ( not ( = ?auto_176364 ?auto_176365 ) ) ( not ( = ?auto_176364 ?auto_176366 ) ) ( not ( = ?auto_176364 ?auto_176367 ) ) ( not ( = ?auto_176364 ?auto_176368 ) ) ( not ( = ?auto_176364 ?auto_176369 ) ) ( not ( = ?auto_176364 ?auto_176371 ) ) ( not ( = ?auto_176365 ?auto_176366 ) ) ( not ( = ?auto_176365 ?auto_176367 ) ) ( not ( = ?auto_176365 ?auto_176368 ) ) ( not ( = ?auto_176365 ?auto_176369 ) ) ( not ( = ?auto_176365 ?auto_176371 ) ) ( not ( = ?auto_176366 ?auto_176367 ) ) ( not ( = ?auto_176366 ?auto_176368 ) ) ( not ( = ?auto_176366 ?auto_176369 ) ) ( not ( = ?auto_176366 ?auto_176371 ) ) ( not ( = ?auto_176367 ?auto_176368 ) ) ( not ( = ?auto_176367 ?auto_176369 ) ) ( not ( = ?auto_176367 ?auto_176371 ) ) ( not ( = ?auto_176368 ?auto_176369 ) ) ( not ( = ?auto_176368 ?auto_176371 ) ) ( not ( = ?auto_176369 ?auto_176371 ) ) ( ON ?auto_176371 ?auto_176370 ) ( not ( = ?auto_176363 ?auto_176370 ) ) ( not ( = ?auto_176364 ?auto_176370 ) ) ( not ( = ?auto_176365 ?auto_176370 ) ) ( not ( = ?auto_176366 ?auto_176370 ) ) ( not ( = ?auto_176367 ?auto_176370 ) ) ( not ( = ?auto_176368 ?auto_176370 ) ) ( not ( = ?auto_176369 ?auto_176370 ) ) ( not ( = ?auto_176371 ?auto_176370 ) ) ( ON ?auto_176369 ?auto_176371 ) ( ON-TABLE ?auto_176370 ) ( ON ?auto_176368 ?auto_176369 ) ( ON ?auto_176367 ?auto_176368 ) ( ON ?auto_176366 ?auto_176367 ) ( ON ?auto_176365 ?auto_176366 ) ( ON ?auto_176364 ?auto_176365 ) ( CLEAR ?auto_176364 ) ( HOLDING ?auto_176363 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176363 )
      ( MAKE-7PILE ?auto_176363 ?auto_176364 ?auto_176365 ?auto_176366 ?auto_176367 ?auto_176368 ?auto_176369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_176372 - BLOCK
      ?auto_176373 - BLOCK
      ?auto_176374 - BLOCK
      ?auto_176375 - BLOCK
      ?auto_176376 - BLOCK
      ?auto_176377 - BLOCK
      ?auto_176378 - BLOCK
    )
    :vars
    (
      ?auto_176379 - BLOCK
      ?auto_176380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176372 ?auto_176373 ) ) ( not ( = ?auto_176372 ?auto_176374 ) ) ( not ( = ?auto_176372 ?auto_176375 ) ) ( not ( = ?auto_176372 ?auto_176376 ) ) ( not ( = ?auto_176372 ?auto_176377 ) ) ( not ( = ?auto_176372 ?auto_176378 ) ) ( not ( = ?auto_176372 ?auto_176379 ) ) ( not ( = ?auto_176373 ?auto_176374 ) ) ( not ( = ?auto_176373 ?auto_176375 ) ) ( not ( = ?auto_176373 ?auto_176376 ) ) ( not ( = ?auto_176373 ?auto_176377 ) ) ( not ( = ?auto_176373 ?auto_176378 ) ) ( not ( = ?auto_176373 ?auto_176379 ) ) ( not ( = ?auto_176374 ?auto_176375 ) ) ( not ( = ?auto_176374 ?auto_176376 ) ) ( not ( = ?auto_176374 ?auto_176377 ) ) ( not ( = ?auto_176374 ?auto_176378 ) ) ( not ( = ?auto_176374 ?auto_176379 ) ) ( not ( = ?auto_176375 ?auto_176376 ) ) ( not ( = ?auto_176375 ?auto_176377 ) ) ( not ( = ?auto_176375 ?auto_176378 ) ) ( not ( = ?auto_176375 ?auto_176379 ) ) ( not ( = ?auto_176376 ?auto_176377 ) ) ( not ( = ?auto_176376 ?auto_176378 ) ) ( not ( = ?auto_176376 ?auto_176379 ) ) ( not ( = ?auto_176377 ?auto_176378 ) ) ( not ( = ?auto_176377 ?auto_176379 ) ) ( not ( = ?auto_176378 ?auto_176379 ) ) ( ON ?auto_176379 ?auto_176380 ) ( not ( = ?auto_176372 ?auto_176380 ) ) ( not ( = ?auto_176373 ?auto_176380 ) ) ( not ( = ?auto_176374 ?auto_176380 ) ) ( not ( = ?auto_176375 ?auto_176380 ) ) ( not ( = ?auto_176376 ?auto_176380 ) ) ( not ( = ?auto_176377 ?auto_176380 ) ) ( not ( = ?auto_176378 ?auto_176380 ) ) ( not ( = ?auto_176379 ?auto_176380 ) ) ( ON ?auto_176378 ?auto_176379 ) ( ON-TABLE ?auto_176380 ) ( ON ?auto_176377 ?auto_176378 ) ( ON ?auto_176376 ?auto_176377 ) ( ON ?auto_176375 ?auto_176376 ) ( ON ?auto_176374 ?auto_176375 ) ( ON ?auto_176373 ?auto_176374 ) ( ON ?auto_176372 ?auto_176373 ) ( CLEAR ?auto_176372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176380 ?auto_176379 ?auto_176378 ?auto_176377 ?auto_176376 ?auto_176375 ?auto_176374 ?auto_176373 )
      ( MAKE-7PILE ?auto_176372 ?auto_176373 ?auto_176374 ?auto_176375 ?auto_176376 ?auto_176377 ?auto_176378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176382 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_176382 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_176382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176383 - BLOCK
    )
    :vars
    (
      ?auto_176384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176383 ?auto_176384 ) ( CLEAR ?auto_176383 ) ( HAND-EMPTY ) ( not ( = ?auto_176383 ?auto_176384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176383 ?auto_176384 )
      ( MAKE-1PILE ?auto_176383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176385 - BLOCK
    )
    :vars
    (
      ?auto_176386 - BLOCK
      ?auto_176390 - BLOCK
      ?auto_176389 - BLOCK
      ?auto_176388 - BLOCK
      ?auto_176391 - BLOCK
      ?auto_176387 - BLOCK
      ?auto_176392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176385 ?auto_176386 ) ) ( HOLDING ?auto_176385 ) ( CLEAR ?auto_176386 ) ( ON-TABLE ?auto_176390 ) ( ON ?auto_176389 ?auto_176390 ) ( ON ?auto_176388 ?auto_176389 ) ( ON ?auto_176391 ?auto_176388 ) ( ON ?auto_176387 ?auto_176391 ) ( ON ?auto_176392 ?auto_176387 ) ( ON ?auto_176386 ?auto_176392 ) ( not ( = ?auto_176390 ?auto_176389 ) ) ( not ( = ?auto_176390 ?auto_176388 ) ) ( not ( = ?auto_176390 ?auto_176391 ) ) ( not ( = ?auto_176390 ?auto_176387 ) ) ( not ( = ?auto_176390 ?auto_176392 ) ) ( not ( = ?auto_176390 ?auto_176386 ) ) ( not ( = ?auto_176390 ?auto_176385 ) ) ( not ( = ?auto_176389 ?auto_176388 ) ) ( not ( = ?auto_176389 ?auto_176391 ) ) ( not ( = ?auto_176389 ?auto_176387 ) ) ( not ( = ?auto_176389 ?auto_176392 ) ) ( not ( = ?auto_176389 ?auto_176386 ) ) ( not ( = ?auto_176389 ?auto_176385 ) ) ( not ( = ?auto_176388 ?auto_176391 ) ) ( not ( = ?auto_176388 ?auto_176387 ) ) ( not ( = ?auto_176388 ?auto_176392 ) ) ( not ( = ?auto_176388 ?auto_176386 ) ) ( not ( = ?auto_176388 ?auto_176385 ) ) ( not ( = ?auto_176391 ?auto_176387 ) ) ( not ( = ?auto_176391 ?auto_176392 ) ) ( not ( = ?auto_176391 ?auto_176386 ) ) ( not ( = ?auto_176391 ?auto_176385 ) ) ( not ( = ?auto_176387 ?auto_176392 ) ) ( not ( = ?auto_176387 ?auto_176386 ) ) ( not ( = ?auto_176387 ?auto_176385 ) ) ( not ( = ?auto_176392 ?auto_176386 ) ) ( not ( = ?auto_176392 ?auto_176385 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176390 ?auto_176389 ?auto_176388 ?auto_176391 ?auto_176387 ?auto_176392 ?auto_176386 ?auto_176385 )
      ( MAKE-1PILE ?auto_176385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176393 - BLOCK
    )
    :vars
    (
      ?auto_176395 - BLOCK
      ?auto_176399 - BLOCK
      ?auto_176394 - BLOCK
      ?auto_176397 - BLOCK
      ?auto_176398 - BLOCK
      ?auto_176400 - BLOCK
      ?auto_176396 - BLOCK
      ?auto_176401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176393 ?auto_176395 ) ) ( CLEAR ?auto_176395 ) ( ON-TABLE ?auto_176399 ) ( ON ?auto_176394 ?auto_176399 ) ( ON ?auto_176397 ?auto_176394 ) ( ON ?auto_176398 ?auto_176397 ) ( ON ?auto_176400 ?auto_176398 ) ( ON ?auto_176396 ?auto_176400 ) ( ON ?auto_176395 ?auto_176396 ) ( not ( = ?auto_176399 ?auto_176394 ) ) ( not ( = ?auto_176399 ?auto_176397 ) ) ( not ( = ?auto_176399 ?auto_176398 ) ) ( not ( = ?auto_176399 ?auto_176400 ) ) ( not ( = ?auto_176399 ?auto_176396 ) ) ( not ( = ?auto_176399 ?auto_176395 ) ) ( not ( = ?auto_176399 ?auto_176393 ) ) ( not ( = ?auto_176394 ?auto_176397 ) ) ( not ( = ?auto_176394 ?auto_176398 ) ) ( not ( = ?auto_176394 ?auto_176400 ) ) ( not ( = ?auto_176394 ?auto_176396 ) ) ( not ( = ?auto_176394 ?auto_176395 ) ) ( not ( = ?auto_176394 ?auto_176393 ) ) ( not ( = ?auto_176397 ?auto_176398 ) ) ( not ( = ?auto_176397 ?auto_176400 ) ) ( not ( = ?auto_176397 ?auto_176396 ) ) ( not ( = ?auto_176397 ?auto_176395 ) ) ( not ( = ?auto_176397 ?auto_176393 ) ) ( not ( = ?auto_176398 ?auto_176400 ) ) ( not ( = ?auto_176398 ?auto_176396 ) ) ( not ( = ?auto_176398 ?auto_176395 ) ) ( not ( = ?auto_176398 ?auto_176393 ) ) ( not ( = ?auto_176400 ?auto_176396 ) ) ( not ( = ?auto_176400 ?auto_176395 ) ) ( not ( = ?auto_176400 ?auto_176393 ) ) ( not ( = ?auto_176396 ?auto_176395 ) ) ( not ( = ?auto_176396 ?auto_176393 ) ) ( ON ?auto_176393 ?auto_176401 ) ( CLEAR ?auto_176393 ) ( HAND-EMPTY ) ( not ( = ?auto_176393 ?auto_176401 ) ) ( not ( = ?auto_176395 ?auto_176401 ) ) ( not ( = ?auto_176399 ?auto_176401 ) ) ( not ( = ?auto_176394 ?auto_176401 ) ) ( not ( = ?auto_176397 ?auto_176401 ) ) ( not ( = ?auto_176398 ?auto_176401 ) ) ( not ( = ?auto_176400 ?auto_176401 ) ) ( not ( = ?auto_176396 ?auto_176401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176393 ?auto_176401 )
      ( MAKE-1PILE ?auto_176393 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176402 - BLOCK
    )
    :vars
    (
      ?auto_176404 - BLOCK
      ?auto_176406 - BLOCK
      ?auto_176405 - BLOCK
      ?auto_176403 - BLOCK
      ?auto_176409 - BLOCK
      ?auto_176407 - BLOCK
      ?auto_176408 - BLOCK
      ?auto_176410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176402 ?auto_176404 ) ) ( ON-TABLE ?auto_176406 ) ( ON ?auto_176405 ?auto_176406 ) ( ON ?auto_176403 ?auto_176405 ) ( ON ?auto_176409 ?auto_176403 ) ( ON ?auto_176407 ?auto_176409 ) ( ON ?auto_176408 ?auto_176407 ) ( not ( = ?auto_176406 ?auto_176405 ) ) ( not ( = ?auto_176406 ?auto_176403 ) ) ( not ( = ?auto_176406 ?auto_176409 ) ) ( not ( = ?auto_176406 ?auto_176407 ) ) ( not ( = ?auto_176406 ?auto_176408 ) ) ( not ( = ?auto_176406 ?auto_176404 ) ) ( not ( = ?auto_176406 ?auto_176402 ) ) ( not ( = ?auto_176405 ?auto_176403 ) ) ( not ( = ?auto_176405 ?auto_176409 ) ) ( not ( = ?auto_176405 ?auto_176407 ) ) ( not ( = ?auto_176405 ?auto_176408 ) ) ( not ( = ?auto_176405 ?auto_176404 ) ) ( not ( = ?auto_176405 ?auto_176402 ) ) ( not ( = ?auto_176403 ?auto_176409 ) ) ( not ( = ?auto_176403 ?auto_176407 ) ) ( not ( = ?auto_176403 ?auto_176408 ) ) ( not ( = ?auto_176403 ?auto_176404 ) ) ( not ( = ?auto_176403 ?auto_176402 ) ) ( not ( = ?auto_176409 ?auto_176407 ) ) ( not ( = ?auto_176409 ?auto_176408 ) ) ( not ( = ?auto_176409 ?auto_176404 ) ) ( not ( = ?auto_176409 ?auto_176402 ) ) ( not ( = ?auto_176407 ?auto_176408 ) ) ( not ( = ?auto_176407 ?auto_176404 ) ) ( not ( = ?auto_176407 ?auto_176402 ) ) ( not ( = ?auto_176408 ?auto_176404 ) ) ( not ( = ?auto_176408 ?auto_176402 ) ) ( ON ?auto_176402 ?auto_176410 ) ( CLEAR ?auto_176402 ) ( not ( = ?auto_176402 ?auto_176410 ) ) ( not ( = ?auto_176404 ?auto_176410 ) ) ( not ( = ?auto_176406 ?auto_176410 ) ) ( not ( = ?auto_176405 ?auto_176410 ) ) ( not ( = ?auto_176403 ?auto_176410 ) ) ( not ( = ?auto_176409 ?auto_176410 ) ) ( not ( = ?auto_176407 ?auto_176410 ) ) ( not ( = ?auto_176408 ?auto_176410 ) ) ( HOLDING ?auto_176404 ) ( CLEAR ?auto_176408 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176406 ?auto_176405 ?auto_176403 ?auto_176409 ?auto_176407 ?auto_176408 ?auto_176404 )
      ( MAKE-1PILE ?auto_176402 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176411 - BLOCK
    )
    :vars
    (
      ?auto_176414 - BLOCK
      ?auto_176412 - BLOCK
      ?auto_176419 - BLOCK
      ?auto_176415 - BLOCK
      ?auto_176417 - BLOCK
      ?auto_176413 - BLOCK
      ?auto_176416 - BLOCK
      ?auto_176418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176411 ?auto_176414 ) ) ( ON-TABLE ?auto_176412 ) ( ON ?auto_176419 ?auto_176412 ) ( ON ?auto_176415 ?auto_176419 ) ( ON ?auto_176417 ?auto_176415 ) ( ON ?auto_176413 ?auto_176417 ) ( ON ?auto_176416 ?auto_176413 ) ( not ( = ?auto_176412 ?auto_176419 ) ) ( not ( = ?auto_176412 ?auto_176415 ) ) ( not ( = ?auto_176412 ?auto_176417 ) ) ( not ( = ?auto_176412 ?auto_176413 ) ) ( not ( = ?auto_176412 ?auto_176416 ) ) ( not ( = ?auto_176412 ?auto_176414 ) ) ( not ( = ?auto_176412 ?auto_176411 ) ) ( not ( = ?auto_176419 ?auto_176415 ) ) ( not ( = ?auto_176419 ?auto_176417 ) ) ( not ( = ?auto_176419 ?auto_176413 ) ) ( not ( = ?auto_176419 ?auto_176416 ) ) ( not ( = ?auto_176419 ?auto_176414 ) ) ( not ( = ?auto_176419 ?auto_176411 ) ) ( not ( = ?auto_176415 ?auto_176417 ) ) ( not ( = ?auto_176415 ?auto_176413 ) ) ( not ( = ?auto_176415 ?auto_176416 ) ) ( not ( = ?auto_176415 ?auto_176414 ) ) ( not ( = ?auto_176415 ?auto_176411 ) ) ( not ( = ?auto_176417 ?auto_176413 ) ) ( not ( = ?auto_176417 ?auto_176416 ) ) ( not ( = ?auto_176417 ?auto_176414 ) ) ( not ( = ?auto_176417 ?auto_176411 ) ) ( not ( = ?auto_176413 ?auto_176416 ) ) ( not ( = ?auto_176413 ?auto_176414 ) ) ( not ( = ?auto_176413 ?auto_176411 ) ) ( not ( = ?auto_176416 ?auto_176414 ) ) ( not ( = ?auto_176416 ?auto_176411 ) ) ( ON ?auto_176411 ?auto_176418 ) ( not ( = ?auto_176411 ?auto_176418 ) ) ( not ( = ?auto_176414 ?auto_176418 ) ) ( not ( = ?auto_176412 ?auto_176418 ) ) ( not ( = ?auto_176419 ?auto_176418 ) ) ( not ( = ?auto_176415 ?auto_176418 ) ) ( not ( = ?auto_176417 ?auto_176418 ) ) ( not ( = ?auto_176413 ?auto_176418 ) ) ( not ( = ?auto_176416 ?auto_176418 ) ) ( CLEAR ?auto_176416 ) ( ON ?auto_176414 ?auto_176411 ) ( CLEAR ?auto_176414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176418 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176418 ?auto_176411 )
      ( MAKE-1PILE ?auto_176411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176420 - BLOCK
    )
    :vars
    (
      ?auto_176421 - BLOCK
      ?auto_176424 - BLOCK
      ?auto_176428 - BLOCK
      ?auto_176427 - BLOCK
      ?auto_176426 - BLOCK
      ?auto_176425 - BLOCK
      ?auto_176422 - BLOCK
      ?auto_176423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176420 ?auto_176421 ) ) ( ON-TABLE ?auto_176424 ) ( ON ?auto_176428 ?auto_176424 ) ( ON ?auto_176427 ?auto_176428 ) ( ON ?auto_176426 ?auto_176427 ) ( ON ?auto_176425 ?auto_176426 ) ( not ( = ?auto_176424 ?auto_176428 ) ) ( not ( = ?auto_176424 ?auto_176427 ) ) ( not ( = ?auto_176424 ?auto_176426 ) ) ( not ( = ?auto_176424 ?auto_176425 ) ) ( not ( = ?auto_176424 ?auto_176422 ) ) ( not ( = ?auto_176424 ?auto_176421 ) ) ( not ( = ?auto_176424 ?auto_176420 ) ) ( not ( = ?auto_176428 ?auto_176427 ) ) ( not ( = ?auto_176428 ?auto_176426 ) ) ( not ( = ?auto_176428 ?auto_176425 ) ) ( not ( = ?auto_176428 ?auto_176422 ) ) ( not ( = ?auto_176428 ?auto_176421 ) ) ( not ( = ?auto_176428 ?auto_176420 ) ) ( not ( = ?auto_176427 ?auto_176426 ) ) ( not ( = ?auto_176427 ?auto_176425 ) ) ( not ( = ?auto_176427 ?auto_176422 ) ) ( not ( = ?auto_176427 ?auto_176421 ) ) ( not ( = ?auto_176427 ?auto_176420 ) ) ( not ( = ?auto_176426 ?auto_176425 ) ) ( not ( = ?auto_176426 ?auto_176422 ) ) ( not ( = ?auto_176426 ?auto_176421 ) ) ( not ( = ?auto_176426 ?auto_176420 ) ) ( not ( = ?auto_176425 ?auto_176422 ) ) ( not ( = ?auto_176425 ?auto_176421 ) ) ( not ( = ?auto_176425 ?auto_176420 ) ) ( not ( = ?auto_176422 ?auto_176421 ) ) ( not ( = ?auto_176422 ?auto_176420 ) ) ( ON ?auto_176420 ?auto_176423 ) ( not ( = ?auto_176420 ?auto_176423 ) ) ( not ( = ?auto_176421 ?auto_176423 ) ) ( not ( = ?auto_176424 ?auto_176423 ) ) ( not ( = ?auto_176428 ?auto_176423 ) ) ( not ( = ?auto_176427 ?auto_176423 ) ) ( not ( = ?auto_176426 ?auto_176423 ) ) ( not ( = ?auto_176425 ?auto_176423 ) ) ( not ( = ?auto_176422 ?auto_176423 ) ) ( ON ?auto_176421 ?auto_176420 ) ( CLEAR ?auto_176421 ) ( ON-TABLE ?auto_176423 ) ( HOLDING ?auto_176422 ) ( CLEAR ?auto_176425 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176424 ?auto_176428 ?auto_176427 ?auto_176426 ?auto_176425 ?auto_176422 )
      ( MAKE-1PILE ?auto_176420 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176429 - BLOCK
    )
    :vars
    (
      ?auto_176430 - BLOCK
      ?auto_176432 - BLOCK
      ?auto_176433 - BLOCK
      ?auto_176434 - BLOCK
      ?auto_176435 - BLOCK
      ?auto_176436 - BLOCK
      ?auto_176431 - BLOCK
      ?auto_176437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176429 ?auto_176430 ) ) ( ON-TABLE ?auto_176432 ) ( ON ?auto_176433 ?auto_176432 ) ( ON ?auto_176434 ?auto_176433 ) ( ON ?auto_176435 ?auto_176434 ) ( ON ?auto_176436 ?auto_176435 ) ( not ( = ?auto_176432 ?auto_176433 ) ) ( not ( = ?auto_176432 ?auto_176434 ) ) ( not ( = ?auto_176432 ?auto_176435 ) ) ( not ( = ?auto_176432 ?auto_176436 ) ) ( not ( = ?auto_176432 ?auto_176431 ) ) ( not ( = ?auto_176432 ?auto_176430 ) ) ( not ( = ?auto_176432 ?auto_176429 ) ) ( not ( = ?auto_176433 ?auto_176434 ) ) ( not ( = ?auto_176433 ?auto_176435 ) ) ( not ( = ?auto_176433 ?auto_176436 ) ) ( not ( = ?auto_176433 ?auto_176431 ) ) ( not ( = ?auto_176433 ?auto_176430 ) ) ( not ( = ?auto_176433 ?auto_176429 ) ) ( not ( = ?auto_176434 ?auto_176435 ) ) ( not ( = ?auto_176434 ?auto_176436 ) ) ( not ( = ?auto_176434 ?auto_176431 ) ) ( not ( = ?auto_176434 ?auto_176430 ) ) ( not ( = ?auto_176434 ?auto_176429 ) ) ( not ( = ?auto_176435 ?auto_176436 ) ) ( not ( = ?auto_176435 ?auto_176431 ) ) ( not ( = ?auto_176435 ?auto_176430 ) ) ( not ( = ?auto_176435 ?auto_176429 ) ) ( not ( = ?auto_176436 ?auto_176431 ) ) ( not ( = ?auto_176436 ?auto_176430 ) ) ( not ( = ?auto_176436 ?auto_176429 ) ) ( not ( = ?auto_176431 ?auto_176430 ) ) ( not ( = ?auto_176431 ?auto_176429 ) ) ( ON ?auto_176429 ?auto_176437 ) ( not ( = ?auto_176429 ?auto_176437 ) ) ( not ( = ?auto_176430 ?auto_176437 ) ) ( not ( = ?auto_176432 ?auto_176437 ) ) ( not ( = ?auto_176433 ?auto_176437 ) ) ( not ( = ?auto_176434 ?auto_176437 ) ) ( not ( = ?auto_176435 ?auto_176437 ) ) ( not ( = ?auto_176436 ?auto_176437 ) ) ( not ( = ?auto_176431 ?auto_176437 ) ) ( ON ?auto_176430 ?auto_176429 ) ( ON-TABLE ?auto_176437 ) ( CLEAR ?auto_176436 ) ( ON ?auto_176431 ?auto_176430 ) ( CLEAR ?auto_176431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176437 ?auto_176429 ?auto_176430 )
      ( MAKE-1PILE ?auto_176429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176438 - BLOCK
    )
    :vars
    (
      ?auto_176441 - BLOCK
      ?auto_176442 - BLOCK
      ?auto_176444 - BLOCK
      ?auto_176439 - BLOCK
      ?auto_176443 - BLOCK
      ?auto_176446 - BLOCK
      ?auto_176440 - BLOCK
      ?auto_176445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176438 ?auto_176441 ) ) ( ON-TABLE ?auto_176442 ) ( ON ?auto_176444 ?auto_176442 ) ( ON ?auto_176439 ?auto_176444 ) ( ON ?auto_176443 ?auto_176439 ) ( not ( = ?auto_176442 ?auto_176444 ) ) ( not ( = ?auto_176442 ?auto_176439 ) ) ( not ( = ?auto_176442 ?auto_176443 ) ) ( not ( = ?auto_176442 ?auto_176446 ) ) ( not ( = ?auto_176442 ?auto_176440 ) ) ( not ( = ?auto_176442 ?auto_176441 ) ) ( not ( = ?auto_176442 ?auto_176438 ) ) ( not ( = ?auto_176444 ?auto_176439 ) ) ( not ( = ?auto_176444 ?auto_176443 ) ) ( not ( = ?auto_176444 ?auto_176446 ) ) ( not ( = ?auto_176444 ?auto_176440 ) ) ( not ( = ?auto_176444 ?auto_176441 ) ) ( not ( = ?auto_176444 ?auto_176438 ) ) ( not ( = ?auto_176439 ?auto_176443 ) ) ( not ( = ?auto_176439 ?auto_176446 ) ) ( not ( = ?auto_176439 ?auto_176440 ) ) ( not ( = ?auto_176439 ?auto_176441 ) ) ( not ( = ?auto_176439 ?auto_176438 ) ) ( not ( = ?auto_176443 ?auto_176446 ) ) ( not ( = ?auto_176443 ?auto_176440 ) ) ( not ( = ?auto_176443 ?auto_176441 ) ) ( not ( = ?auto_176443 ?auto_176438 ) ) ( not ( = ?auto_176446 ?auto_176440 ) ) ( not ( = ?auto_176446 ?auto_176441 ) ) ( not ( = ?auto_176446 ?auto_176438 ) ) ( not ( = ?auto_176440 ?auto_176441 ) ) ( not ( = ?auto_176440 ?auto_176438 ) ) ( ON ?auto_176438 ?auto_176445 ) ( not ( = ?auto_176438 ?auto_176445 ) ) ( not ( = ?auto_176441 ?auto_176445 ) ) ( not ( = ?auto_176442 ?auto_176445 ) ) ( not ( = ?auto_176444 ?auto_176445 ) ) ( not ( = ?auto_176439 ?auto_176445 ) ) ( not ( = ?auto_176443 ?auto_176445 ) ) ( not ( = ?auto_176446 ?auto_176445 ) ) ( not ( = ?auto_176440 ?auto_176445 ) ) ( ON ?auto_176441 ?auto_176438 ) ( ON-TABLE ?auto_176445 ) ( ON ?auto_176440 ?auto_176441 ) ( CLEAR ?auto_176440 ) ( HOLDING ?auto_176446 ) ( CLEAR ?auto_176443 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176442 ?auto_176444 ?auto_176439 ?auto_176443 ?auto_176446 )
      ( MAKE-1PILE ?auto_176438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176447 - BLOCK
    )
    :vars
    (
      ?auto_176455 - BLOCK
      ?auto_176453 - BLOCK
      ?auto_176448 - BLOCK
      ?auto_176450 - BLOCK
      ?auto_176449 - BLOCK
      ?auto_176452 - BLOCK
      ?auto_176451 - BLOCK
      ?auto_176454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176447 ?auto_176455 ) ) ( ON-TABLE ?auto_176453 ) ( ON ?auto_176448 ?auto_176453 ) ( ON ?auto_176450 ?auto_176448 ) ( ON ?auto_176449 ?auto_176450 ) ( not ( = ?auto_176453 ?auto_176448 ) ) ( not ( = ?auto_176453 ?auto_176450 ) ) ( not ( = ?auto_176453 ?auto_176449 ) ) ( not ( = ?auto_176453 ?auto_176452 ) ) ( not ( = ?auto_176453 ?auto_176451 ) ) ( not ( = ?auto_176453 ?auto_176455 ) ) ( not ( = ?auto_176453 ?auto_176447 ) ) ( not ( = ?auto_176448 ?auto_176450 ) ) ( not ( = ?auto_176448 ?auto_176449 ) ) ( not ( = ?auto_176448 ?auto_176452 ) ) ( not ( = ?auto_176448 ?auto_176451 ) ) ( not ( = ?auto_176448 ?auto_176455 ) ) ( not ( = ?auto_176448 ?auto_176447 ) ) ( not ( = ?auto_176450 ?auto_176449 ) ) ( not ( = ?auto_176450 ?auto_176452 ) ) ( not ( = ?auto_176450 ?auto_176451 ) ) ( not ( = ?auto_176450 ?auto_176455 ) ) ( not ( = ?auto_176450 ?auto_176447 ) ) ( not ( = ?auto_176449 ?auto_176452 ) ) ( not ( = ?auto_176449 ?auto_176451 ) ) ( not ( = ?auto_176449 ?auto_176455 ) ) ( not ( = ?auto_176449 ?auto_176447 ) ) ( not ( = ?auto_176452 ?auto_176451 ) ) ( not ( = ?auto_176452 ?auto_176455 ) ) ( not ( = ?auto_176452 ?auto_176447 ) ) ( not ( = ?auto_176451 ?auto_176455 ) ) ( not ( = ?auto_176451 ?auto_176447 ) ) ( ON ?auto_176447 ?auto_176454 ) ( not ( = ?auto_176447 ?auto_176454 ) ) ( not ( = ?auto_176455 ?auto_176454 ) ) ( not ( = ?auto_176453 ?auto_176454 ) ) ( not ( = ?auto_176448 ?auto_176454 ) ) ( not ( = ?auto_176450 ?auto_176454 ) ) ( not ( = ?auto_176449 ?auto_176454 ) ) ( not ( = ?auto_176452 ?auto_176454 ) ) ( not ( = ?auto_176451 ?auto_176454 ) ) ( ON ?auto_176455 ?auto_176447 ) ( ON-TABLE ?auto_176454 ) ( ON ?auto_176451 ?auto_176455 ) ( CLEAR ?auto_176449 ) ( ON ?auto_176452 ?auto_176451 ) ( CLEAR ?auto_176452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176454 ?auto_176447 ?auto_176455 ?auto_176451 )
      ( MAKE-1PILE ?auto_176447 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176456 - BLOCK
    )
    :vars
    (
      ?auto_176463 - BLOCK
      ?auto_176459 - BLOCK
      ?auto_176462 - BLOCK
      ?auto_176464 - BLOCK
      ?auto_176461 - BLOCK
      ?auto_176458 - BLOCK
      ?auto_176457 - BLOCK
      ?auto_176460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176456 ?auto_176463 ) ) ( ON-TABLE ?auto_176459 ) ( ON ?auto_176462 ?auto_176459 ) ( ON ?auto_176464 ?auto_176462 ) ( not ( = ?auto_176459 ?auto_176462 ) ) ( not ( = ?auto_176459 ?auto_176464 ) ) ( not ( = ?auto_176459 ?auto_176461 ) ) ( not ( = ?auto_176459 ?auto_176458 ) ) ( not ( = ?auto_176459 ?auto_176457 ) ) ( not ( = ?auto_176459 ?auto_176463 ) ) ( not ( = ?auto_176459 ?auto_176456 ) ) ( not ( = ?auto_176462 ?auto_176464 ) ) ( not ( = ?auto_176462 ?auto_176461 ) ) ( not ( = ?auto_176462 ?auto_176458 ) ) ( not ( = ?auto_176462 ?auto_176457 ) ) ( not ( = ?auto_176462 ?auto_176463 ) ) ( not ( = ?auto_176462 ?auto_176456 ) ) ( not ( = ?auto_176464 ?auto_176461 ) ) ( not ( = ?auto_176464 ?auto_176458 ) ) ( not ( = ?auto_176464 ?auto_176457 ) ) ( not ( = ?auto_176464 ?auto_176463 ) ) ( not ( = ?auto_176464 ?auto_176456 ) ) ( not ( = ?auto_176461 ?auto_176458 ) ) ( not ( = ?auto_176461 ?auto_176457 ) ) ( not ( = ?auto_176461 ?auto_176463 ) ) ( not ( = ?auto_176461 ?auto_176456 ) ) ( not ( = ?auto_176458 ?auto_176457 ) ) ( not ( = ?auto_176458 ?auto_176463 ) ) ( not ( = ?auto_176458 ?auto_176456 ) ) ( not ( = ?auto_176457 ?auto_176463 ) ) ( not ( = ?auto_176457 ?auto_176456 ) ) ( ON ?auto_176456 ?auto_176460 ) ( not ( = ?auto_176456 ?auto_176460 ) ) ( not ( = ?auto_176463 ?auto_176460 ) ) ( not ( = ?auto_176459 ?auto_176460 ) ) ( not ( = ?auto_176462 ?auto_176460 ) ) ( not ( = ?auto_176464 ?auto_176460 ) ) ( not ( = ?auto_176461 ?auto_176460 ) ) ( not ( = ?auto_176458 ?auto_176460 ) ) ( not ( = ?auto_176457 ?auto_176460 ) ) ( ON ?auto_176463 ?auto_176456 ) ( ON-TABLE ?auto_176460 ) ( ON ?auto_176457 ?auto_176463 ) ( ON ?auto_176458 ?auto_176457 ) ( CLEAR ?auto_176458 ) ( HOLDING ?auto_176461 ) ( CLEAR ?auto_176464 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176459 ?auto_176462 ?auto_176464 ?auto_176461 )
      ( MAKE-1PILE ?auto_176456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176465 - BLOCK
    )
    :vars
    (
      ?auto_176469 - BLOCK
      ?auto_176473 - BLOCK
      ?auto_176468 - BLOCK
      ?auto_176470 - BLOCK
      ?auto_176471 - BLOCK
      ?auto_176466 - BLOCK
      ?auto_176472 - BLOCK
      ?auto_176467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176465 ?auto_176469 ) ) ( ON-TABLE ?auto_176473 ) ( ON ?auto_176468 ?auto_176473 ) ( ON ?auto_176470 ?auto_176468 ) ( not ( = ?auto_176473 ?auto_176468 ) ) ( not ( = ?auto_176473 ?auto_176470 ) ) ( not ( = ?auto_176473 ?auto_176471 ) ) ( not ( = ?auto_176473 ?auto_176466 ) ) ( not ( = ?auto_176473 ?auto_176472 ) ) ( not ( = ?auto_176473 ?auto_176469 ) ) ( not ( = ?auto_176473 ?auto_176465 ) ) ( not ( = ?auto_176468 ?auto_176470 ) ) ( not ( = ?auto_176468 ?auto_176471 ) ) ( not ( = ?auto_176468 ?auto_176466 ) ) ( not ( = ?auto_176468 ?auto_176472 ) ) ( not ( = ?auto_176468 ?auto_176469 ) ) ( not ( = ?auto_176468 ?auto_176465 ) ) ( not ( = ?auto_176470 ?auto_176471 ) ) ( not ( = ?auto_176470 ?auto_176466 ) ) ( not ( = ?auto_176470 ?auto_176472 ) ) ( not ( = ?auto_176470 ?auto_176469 ) ) ( not ( = ?auto_176470 ?auto_176465 ) ) ( not ( = ?auto_176471 ?auto_176466 ) ) ( not ( = ?auto_176471 ?auto_176472 ) ) ( not ( = ?auto_176471 ?auto_176469 ) ) ( not ( = ?auto_176471 ?auto_176465 ) ) ( not ( = ?auto_176466 ?auto_176472 ) ) ( not ( = ?auto_176466 ?auto_176469 ) ) ( not ( = ?auto_176466 ?auto_176465 ) ) ( not ( = ?auto_176472 ?auto_176469 ) ) ( not ( = ?auto_176472 ?auto_176465 ) ) ( ON ?auto_176465 ?auto_176467 ) ( not ( = ?auto_176465 ?auto_176467 ) ) ( not ( = ?auto_176469 ?auto_176467 ) ) ( not ( = ?auto_176473 ?auto_176467 ) ) ( not ( = ?auto_176468 ?auto_176467 ) ) ( not ( = ?auto_176470 ?auto_176467 ) ) ( not ( = ?auto_176471 ?auto_176467 ) ) ( not ( = ?auto_176466 ?auto_176467 ) ) ( not ( = ?auto_176472 ?auto_176467 ) ) ( ON ?auto_176469 ?auto_176465 ) ( ON-TABLE ?auto_176467 ) ( ON ?auto_176472 ?auto_176469 ) ( ON ?auto_176466 ?auto_176472 ) ( CLEAR ?auto_176470 ) ( ON ?auto_176471 ?auto_176466 ) ( CLEAR ?auto_176471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176467 ?auto_176465 ?auto_176469 ?auto_176472 ?auto_176466 )
      ( MAKE-1PILE ?auto_176465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176474 - BLOCK
    )
    :vars
    (
      ?auto_176476 - BLOCK
      ?auto_176475 - BLOCK
      ?auto_176478 - BLOCK
      ?auto_176482 - BLOCK
      ?auto_176481 - BLOCK
      ?auto_176479 - BLOCK
      ?auto_176480 - BLOCK
      ?auto_176477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176474 ?auto_176476 ) ) ( ON-TABLE ?auto_176475 ) ( ON ?auto_176478 ?auto_176475 ) ( not ( = ?auto_176475 ?auto_176478 ) ) ( not ( = ?auto_176475 ?auto_176482 ) ) ( not ( = ?auto_176475 ?auto_176481 ) ) ( not ( = ?auto_176475 ?auto_176479 ) ) ( not ( = ?auto_176475 ?auto_176480 ) ) ( not ( = ?auto_176475 ?auto_176476 ) ) ( not ( = ?auto_176475 ?auto_176474 ) ) ( not ( = ?auto_176478 ?auto_176482 ) ) ( not ( = ?auto_176478 ?auto_176481 ) ) ( not ( = ?auto_176478 ?auto_176479 ) ) ( not ( = ?auto_176478 ?auto_176480 ) ) ( not ( = ?auto_176478 ?auto_176476 ) ) ( not ( = ?auto_176478 ?auto_176474 ) ) ( not ( = ?auto_176482 ?auto_176481 ) ) ( not ( = ?auto_176482 ?auto_176479 ) ) ( not ( = ?auto_176482 ?auto_176480 ) ) ( not ( = ?auto_176482 ?auto_176476 ) ) ( not ( = ?auto_176482 ?auto_176474 ) ) ( not ( = ?auto_176481 ?auto_176479 ) ) ( not ( = ?auto_176481 ?auto_176480 ) ) ( not ( = ?auto_176481 ?auto_176476 ) ) ( not ( = ?auto_176481 ?auto_176474 ) ) ( not ( = ?auto_176479 ?auto_176480 ) ) ( not ( = ?auto_176479 ?auto_176476 ) ) ( not ( = ?auto_176479 ?auto_176474 ) ) ( not ( = ?auto_176480 ?auto_176476 ) ) ( not ( = ?auto_176480 ?auto_176474 ) ) ( ON ?auto_176474 ?auto_176477 ) ( not ( = ?auto_176474 ?auto_176477 ) ) ( not ( = ?auto_176476 ?auto_176477 ) ) ( not ( = ?auto_176475 ?auto_176477 ) ) ( not ( = ?auto_176478 ?auto_176477 ) ) ( not ( = ?auto_176482 ?auto_176477 ) ) ( not ( = ?auto_176481 ?auto_176477 ) ) ( not ( = ?auto_176479 ?auto_176477 ) ) ( not ( = ?auto_176480 ?auto_176477 ) ) ( ON ?auto_176476 ?auto_176474 ) ( ON-TABLE ?auto_176477 ) ( ON ?auto_176480 ?auto_176476 ) ( ON ?auto_176479 ?auto_176480 ) ( ON ?auto_176481 ?auto_176479 ) ( CLEAR ?auto_176481 ) ( HOLDING ?auto_176482 ) ( CLEAR ?auto_176478 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176475 ?auto_176478 ?auto_176482 )
      ( MAKE-1PILE ?auto_176474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176483 - BLOCK
    )
    :vars
    (
      ?auto_176490 - BLOCK
      ?auto_176484 - BLOCK
      ?auto_176485 - BLOCK
      ?auto_176486 - BLOCK
      ?auto_176487 - BLOCK
      ?auto_176489 - BLOCK
      ?auto_176488 - BLOCK
      ?auto_176491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176483 ?auto_176490 ) ) ( ON-TABLE ?auto_176484 ) ( ON ?auto_176485 ?auto_176484 ) ( not ( = ?auto_176484 ?auto_176485 ) ) ( not ( = ?auto_176484 ?auto_176486 ) ) ( not ( = ?auto_176484 ?auto_176487 ) ) ( not ( = ?auto_176484 ?auto_176489 ) ) ( not ( = ?auto_176484 ?auto_176488 ) ) ( not ( = ?auto_176484 ?auto_176490 ) ) ( not ( = ?auto_176484 ?auto_176483 ) ) ( not ( = ?auto_176485 ?auto_176486 ) ) ( not ( = ?auto_176485 ?auto_176487 ) ) ( not ( = ?auto_176485 ?auto_176489 ) ) ( not ( = ?auto_176485 ?auto_176488 ) ) ( not ( = ?auto_176485 ?auto_176490 ) ) ( not ( = ?auto_176485 ?auto_176483 ) ) ( not ( = ?auto_176486 ?auto_176487 ) ) ( not ( = ?auto_176486 ?auto_176489 ) ) ( not ( = ?auto_176486 ?auto_176488 ) ) ( not ( = ?auto_176486 ?auto_176490 ) ) ( not ( = ?auto_176486 ?auto_176483 ) ) ( not ( = ?auto_176487 ?auto_176489 ) ) ( not ( = ?auto_176487 ?auto_176488 ) ) ( not ( = ?auto_176487 ?auto_176490 ) ) ( not ( = ?auto_176487 ?auto_176483 ) ) ( not ( = ?auto_176489 ?auto_176488 ) ) ( not ( = ?auto_176489 ?auto_176490 ) ) ( not ( = ?auto_176489 ?auto_176483 ) ) ( not ( = ?auto_176488 ?auto_176490 ) ) ( not ( = ?auto_176488 ?auto_176483 ) ) ( ON ?auto_176483 ?auto_176491 ) ( not ( = ?auto_176483 ?auto_176491 ) ) ( not ( = ?auto_176490 ?auto_176491 ) ) ( not ( = ?auto_176484 ?auto_176491 ) ) ( not ( = ?auto_176485 ?auto_176491 ) ) ( not ( = ?auto_176486 ?auto_176491 ) ) ( not ( = ?auto_176487 ?auto_176491 ) ) ( not ( = ?auto_176489 ?auto_176491 ) ) ( not ( = ?auto_176488 ?auto_176491 ) ) ( ON ?auto_176490 ?auto_176483 ) ( ON-TABLE ?auto_176491 ) ( ON ?auto_176488 ?auto_176490 ) ( ON ?auto_176489 ?auto_176488 ) ( ON ?auto_176487 ?auto_176489 ) ( CLEAR ?auto_176485 ) ( ON ?auto_176486 ?auto_176487 ) ( CLEAR ?auto_176486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176491 ?auto_176483 ?auto_176490 ?auto_176488 ?auto_176489 ?auto_176487 )
      ( MAKE-1PILE ?auto_176483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176492 - BLOCK
    )
    :vars
    (
      ?auto_176498 - BLOCK
      ?auto_176495 - BLOCK
      ?auto_176493 - BLOCK
      ?auto_176494 - BLOCK
      ?auto_176496 - BLOCK
      ?auto_176500 - BLOCK
      ?auto_176499 - BLOCK
      ?auto_176497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176492 ?auto_176498 ) ) ( ON-TABLE ?auto_176495 ) ( not ( = ?auto_176495 ?auto_176493 ) ) ( not ( = ?auto_176495 ?auto_176494 ) ) ( not ( = ?auto_176495 ?auto_176496 ) ) ( not ( = ?auto_176495 ?auto_176500 ) ) ( not ( = ?auto_176495 ?auto_176499 ) ) ( not ( = ?auto_176495 ?auto_176498 ) ) ( not ( = ?auto_176495 ?auto_176492 ) ) ( not ( = ?auto_176493 ?auto_176494 ) ) ( not ( = ?auto_176493 ?auto_176496 ) ) ( not ( = ?auto_176493 ?auto_176500 ) ) ( not ( = ?auto_176493 ?auto_176499 ) ) ( not ( = ?auto_176493 ?auto_176498 ) ) ( not ( = ?auto_176493 ?auto_176492 ) ) ( not ( = ?auto_176494 ?auto_176496 ) ) ( not ( = ?auto_176494 ?auto_176500 ) ) ( not ( = ?auto_176494 ?auto_176499 ) ) ( not ( = ?auto_176494 ?auto_176498 ) ) ( not ( = ?auto_176494 ?auto_176492 ) ) ( not ( = ?auto_176496 ?auto_176500 ) ) ( not ( = ?auto_176496 ?auto_176499 ) ) ( not ( = ?auto_176496 ?auto_176498 ) ) ( not ( = ?auto_176496 ?auto_176492 ) ) ( not ( = ?auto_176500 ?auto_176499 ) ) ( not ( = ?auto_176500 ?auto_176498 ) ) ( not ( = ?auto_176500 ?auto_176492 ) ) ( not ( = ?auto_176499 ?auto_176498 ) ) ( not ( = ?auto_176499 ?auto_176492 ) ) ( ON ?auto_176492 ?auto_176497 ) ( not ( = ?auto_176492 ?auto_176497 ) ) ( not ( = ?auto_176498 ?auto_176497 ) ) ( not ( = ?auto_176495 ?auto_176497 ) ) ( not ( = ?auto_176493 ?auto_176497 ) ) ( not ( = ?auto_176494 ?auto_176497 ) ) ( not ( = ?auto_176496 ?auto_176497 ) ) ( not ( = ?auto_176500 ?auto_176497 ) ) ( not ( = ?auto_176499 ?auto_176497 ) ) ( ON ?auto_176498 ?auto_176492 ) ( ON-TABLE ?auto_176497 ) ( ON ?auto_176499 ?auto_176498 ) ( ON ?auto_176500 ?auto_176499 ) ( ON ?auto_176496 ?auto_176500 ) ( ON ?auto_176494 ?auto_176496 ) ( CLEAR ?auto_176494 ) ( HOLDING ?auto_176493 ) ( CLEAR ?auto_176495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176495 ?auto_176493 )
      ( MAKE-1PILE ?auto_176492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176501 - BLOCK
    )
    :vars
    (
      ?auto_176509 - BLOCK
      ?auto_176503 - BLOCK
      ?auto_176504 - BLOCK
      ?auto_176507 - BLOCK
      ?auto_176508 - BLOCK
      ?auto_176505 - BLOCK
      ?auto_176502 - BLOCK
      ?auto_176506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176501 ?auto_176509 ) ) ( ON-TABLE ?auto_176503 ) ( not ( = ?auto_176503 ?auto_176504 ) ) ( not ( = ?auto_176503 ?auto_176507 ) ) ( not ( = ?auto_176503 ?auto_176508 ) ) ( not ( = ?auto_176503 ?auto_176505 ) ) ( not ( = ?auto_176503 ?auto_176502 ) ) ( not ( = ?auto_176503 ?auto_176509 ) ) ( not ( = ?auto_176503 ?auto_176501 ) ) ( not ( = ?auto_176504 ?auto_176507 ) ) ( not ( = ?auto_176504 ?auto_176508 ) ) ( not ( = ?auto_176504 ?auto_176505 ) ) ( not ( = ?auto_176504 ?auto_176502 ) ) ( not ( = ?auto_176504 ?auto_176509 ) ) ( not ( = ?auto_176504 ?auto_176501 ) ) ( not ( = ?auto_176507 ?auto_176508 ) ) ( not ( = ?auto_176507 ?auto_176505 ) ) ( not ( = ?auto_176507 ?auto_176502 ) ) ( not ( = ?auto_176507 ?auto_176509 ) ) ( not ( = ?auto_176507 ?auto_176501 ) ) ( not ( = ?auto_176508 ?auto_176505 ) ) ( not ( = ?auto_176508 ?auto_176502 ) ) ( not ( = ?auto_176508 ?auto_176509 ) ) ( not ( = ?auto_176508 ?auto_176501 ) ) ( not ( = ?auto_176505 ?auto_176502 ) ) ( not ( = ?auto_176505 ?auto_176509 ) ) ( not ( = ?auto_176505 ?auto_176501 ) ) ( not ( = ?auto_176502 ?auto_176509 ) ) ( not ( = ?auto_176502 ?auto_176501 ) ) ( ON ?auto_176501 ?auto_176506 ) ( not ( = ?auto_176501 ?auto_176506 ) ) ( not ( = ?auto_176509 ?auto_176506 ) ) ( not ( = ?auto_176503 ?auto_176506 ) ) ( not ( = ?auto_176504 ?auto_176506 ) ) ( not ( = ?auto_176507 ?auto_176506 ) ) ( not ( = ?auto_176508 ?auto_176506 ) ) ( not ( = ?auto_176505 ?auto_176506 ) ) ( not ( = ?auto_176502 ?auto_176506 ) ) ( ON ?auto_176509 ?auto_176501 ) ( ON-TABLE ?auto_176506 ) ( ON ?auto_176502 ?auto_176509 ) ( ON ?auto_176505 ?auto_176502 ) ( ON ?auto_176508 ?auto_176505 ) ( ON ?auto_176507 ?auto_176508 ) ( CLEAR ?auto_176503 ) ( ON ?auto_176504 ?auto_176507 ) ( CLEAR ?auto_176504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176506 ?auto_176501 ?auto_176509 ?auto_176502 ?auto_176505 ?auto_176508 ?auto_176507 )
      ( MAKE-1PILE ?auto_176501 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176510 - BLOCK
    )
    :vars
    (
      ?auto_176517 - BLOCK
      ?auto_176512 - BLOCK
      ?auto_176518 - BLOCK
      ?auto_176511 - BLOCK
      ?auto_176515 - BLOCK
      ?auto_176516 - BLOCK
      ?auto_176514 - BLOCK
      ?auto_176513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176510 ?auto_176517 ) ) ( not ( = ?auto_176512 ?auto_176518 ) ) ( not ( = ?auto_176512 ?auto_176511 ) ) ( not ( = ?auto_176512 ?auto_176515 ) ) ( not ( = ?auto_176512 ?auto_176516 ) ) ( not ( = ?auto_176512 ?auto_176514 ) ) ( not ( = ?auto_176512 ?auto_176517 ) ) ( not ( = ?auto_176512 ?auto_176510 ) ) ( not ( = ?auto_176518 ?auto_176511 ) ) ( not ( = ?auto_176518 ?auto_176515 ) ) ( not ( = ?auto_176518 ?auto_176516 ) ) ( not ( = ?auto_176518 ?auto_176514 ) ) ( not ( = ?auto_176518 ?auto_176517 ) ) ( not ( = ?auto_176518 ?auto_176510 ) ) ( not ( = ?auto_176511 ?auto_176515 ) ) ( not ( = ?auto_176511 ?auto_176516 ) ) ( not ( = ?auto_176511 ?auto_176514 ) ) ( not ( = ?auto_176511 ?auto_176517 ) ) ( not ( = ?auto_176511 ?auto_176510 ) ) ( not ( = ?auto_176515 ?auto_176516 ) ) ( not ( = ?auto_176515 ?auto_176514 ) ) ( not ( = ?auto_176515 ?auto_176517 ) ) ( not ( = ?auto_176515 ?auto_176510 ) ) ( not ( = ?auto_176516 ?auto_176514 ) ) ( not ( = ?auto_176516 ?auto_176517 ) ) ( not ( = ?auto_176516 ?auto_176510 ) ) ( not ( = ?auto_176514 ?auto_176517 ) ) ( not ( = ?auto_176514 ?auto_176510 ) ) ( ON ?auto_176510 ?auto_176513 ) ( not ( = ?auto_176510 ?auto_176513 ) ) ( not ( = ?auto_176517 ?auto_176513 ) ) ( not ( = ?auto_176512 ?auto_176513 ) ) ( not ( = ?auto_176518 ?auto_176513 ) ) ( not ( = ?auto_176511 ?auto_176513 ) ) ( not ( = ?auto_176515 ?auto_176513 ) ) ( not ( = ?auto_176516 ?auto_176513 ) ) ( not ( = ?auto_176514 ?auto_176513 ) ) ( ON ?auto_176517 ?auto_176510 ) ( ON-TABLE ?auto_176513 ) ( ON ?auto_176514 ?auto_176517 ) ( ON ?auto_176516 ?auto_176514 ) ( ON ?auto_176515 ?auto_176516 ) ( ON ?auto_176511 ?auto_176515 ) ( ON ?auto_176518 ?auto_176511 ) ( CLEAR ?auto_176518 ) ( HOLDING ?auto_176512 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176512 )
      ( MAKE-1PILE ?auto_176510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_176519 - BLOCK
    )
    :vars
    (
      ?auto_176520 - BLOCK
      ?auto_176522 - BLOCK
      ?auto_176527 - BLOCK
      ?auto_176526 - BLOCK
      ?auto_176521 - BLOCK
      ?auto_176523 - BLOCK
      ?auto_176524 - BLOCK
      ?auto_176525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176519 ?auto_176520 ) ) ( not ( = ?auto_176522 ?auto_176527 ) ) ( not ( = ?auto_176522 ?auto_176526 ) ) ( not ( = ?auto_176522 ?auto_176521 ) ) ( not ( = ?auto_176522 ?auto_176523 ) ) ( not ( = ?auto_176522 ?auto_176524 ) ) ( not ( = ?auto_176522 ?auto_176520 ) ) ( not ( = ?auto_176522 ?auto_176519 ) ) ( not ( = ?auto_176527 ?auto_176526 ) ) ( not ( = ?auto_176527 ?auto_176521 ) ) ( not ( = ?auto_176527 ?auto_176523 ) ) ( not ( = ?auto_176527 ?auto_176524 ) ) ( not ( = ?auto_176527 ?auto_176520 ) ) ( not ( = ?auto_176527 ?auto_176519 ) ) ( not ( = ?auto_176526 ?auto_176521 ) ) ( not ( = ?auto_176526 ?auto_176523 ) ) ( not ( = ?auto_176526 ?auto_176524 ) ) ( not ( = ?auto_176526 ?auto_176520 ) ) ( not ( = ?auto_176526 ?auto_176519 ) ) ( not ( = ?auto_176521 ?auto_176523 ) ) ( not ( = ?auto_176521 ?auto_176524 ) ) ( not ( = ?auto_176521 ?auto_176520 ) ) ( not ( = ?auto_176521 ?auto_176519 ) ) ( not ( = ?auto_176523 ?auto_176524 ) ) ( not ( = ?auto_176523 ?auto_176520 ) ) ( not ( = ?auto_176523 ?auto_176519 ) ) ( not ( = ?auto_176524 ?auto_176520 ) ) ( not ( = ?auto_176524 ?auto_176519 ) ) ( ON ?auto_176519 ?auto_176525 ) ( not ( = ?auto_176519 ?auto_176525 ) ) ( not ( = ?auto_176520 ?auto_176525 ) ) ( not ( = ?auto_176522 ?auto_176525 ) ) ( not ( = ?auto_176527 ?auto_176525 ) ) ( not ( = ?auto_176526 ?auto_176525 ) ) ( not ( = ?auto_176521 ?auto_176525 ) ) ( not ( = ?auto_176523 ?auto_176525 ) ) ( not ( = ?auto_176524 ?auto_176525 ) ) ( ON ?auto_176520 ?auto_176519 ) ( ON-TABLE ?auto_176525 ) ( ON ?auto_176524 ?auto_176520 ) ( ON ?auto_176523 ?auto_176524 ) ( ON ?auto_176521 ?auto_176523 ) ( ON ?auto_176526 ?auto_176521 ) ( ON ?auto_176527 ?auto_176526 ) ( ON ?auto_176522 ?auto_176527 ) ( CLEAR ?auto_176522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176525 ?auto_176519 ?auto_176520 ?auto_176524 ?auto_176523 ?auto_176521 ?auto_176526 ?auto_176527 )
      ( MAKE-1PILE ?auto_176519 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176534 - BLOCK
      ?auto_176535 - BLOCK
      ?auto_176536 - BLOCK
      ?auto_176537 - BLOCK
      ?auto_176538 - BLOCK
      ?auto_176539 - BLOCK
    )
    :vars
    (
      ?auto_176540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176540 ?auto_176539 ) ( CLEAR ?auto_176540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176534 ) ( ON ?auto_176535 ?auto_176534 ) ( ON ?auto_176536 ?auto_176535 ) ( ON ?auto_176537 ?auto_176536 ) ( ON ?auto_176538 ?auto_176537 ) ( ON ?auto_176539 ?auto_176538 ) ( not ( = ?auto_176534 ?auto_176535 ) ) ( not ( = ?auto_176534 ?auto_176536 ) ) ( not ( = ?auto_176534 ?auto_176537 ) ) ( not ( = ?auto_176534 ?auto_176538 ) ) ( not ( = ?auto_176534 ?auto_176539 ) ) ( not ( = ?auto_176534 ?auto_176540 ) ) ( not ( = ?auto_176535 ?auto_176536 ) ) ( not ( = ?auto_176535 ?auto_176537 ) ) ( not ( = ?auto_176535 ?auto_176538 ) ) ( not ( = ?auto_176535 ?auto_176539 ) ) ( not ( = ?auto_176535 ?auto_176540 ) ) ( not ( = ?auto_176536 ?auto_176537 ) ) ( not ( = ?auto_176536 ?auto_176538 ) ) ( not ( = ?auto_176536 ?auto_176539 ) ) ( not ( = ?auto_176536 ?auto_176540 ) ) ( not ( = ?auto_176537 ?auto_176538 ) ) ( not ( = ?auto_176537 ?auto_176539 ) ) ( not ( = ?auto_176537 ?auto_176540 ) ) ( not ( = ?auto_176538 ?auto_176539 ) ) ( not ( = ?auto_176538 ?auto_176540 ) ) ( not ( = ?auto_176539 ?auto_176540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176540 ?auto_176539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176541 - BLOCK
      ?auto_176542 - BLOCK
      ?auto_176543 - BLOCK
      ?auto_176544 - BLOCK
      ?auto_176545 - BLOCK
      ?auto_176546 - BLOCK
    )
    :vars
    (
      ?auto_176547 - BLOCK
      ?auto_176548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176547 ?auto_176546 ) ( CLEAR ?auto_176547 ) ( ON-TABLE ?auto_176541 ) ( ON ?auto_176542 ?auto_176541 ) ( ON ?auto_176543 ?auto_176542 ) ( ON ?auto_176544 ?auto_176543 ) ( ON ?auto_176545 ?auto_176544 ) ( ON ?auto_176546 ?auto_176545 ) ( not ( = ?auto_176541 ?auto_176542 ) ) ( not ( = ?auto_176541 ?auto_176543 ) ) ( not ( = ?auto_176541 ?auto_176544 ) ) ( not ( = ?auto_176541 ?auto_176545 ) ) ( not ( = ?auto_176541 ?auto_176546 ) ) ( not ( = ?auto_176541 ?auto_176547 ) ) ( not ( = ?auto_176542 ?auto_176543 ) ) ( not ( = ?auto_176542 ?auto_176544 ) ) ( not ( = ?auto_176542 ?auto_176545 ) ) ( not ( = ?auto_176542 ?auto_176546 ) ) ( not ( = ?auto_176542 ?auto_176547 ) ) ( not ( = ?auto_176543 ?auto_176544 ) ) ( not ( = ?auto_176543 ?auto_176545 ) ) ( not ( = ?auto_176543 ?auto_176546 ) ) ( not ( = ?auto_176543 ?auto_176547 ) ) ( not ( = ?auto_176544 ?auto_176545 ) ) ( not ( = ?auto_176544 ?auto_176546 ) ) ( not ( = ?auto_176544 ?auto_176547 ) ) ( not ( = ?auto_176545 ?auto_176546 ) ) ( not ( = ?auto_176545 ?auto_176547 ) ) ( not ( = ?auto_176546 ?auto_176547 ) ) ( HOLDING ?auto_176548 ) ( not ( = ?auto_176541 ?auto_176548 ) ) ( not ( = ?auto_176542 ?auto_176548 ) ) ( not ( = ?auto_176543 ?auto_176548 ) ) ( not ( = ?auto_176544 ?auto_176548 ) ) ( not ( = ?auto_176545 ?auto_176548 ) ) ( not ( = ?auto_176546 ?auto_176548 ) ) ( not ( = ?auto_176547 ?auto_176548 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_176548 )
      ( MAKE-6PILE ?auto_176541 ?auto_176542 ?auto_176543 ?auto_176544 ?auto_176545 ?auto_176546 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176549 - BLOCK
      ?auto_176550 - BLOCK
      ?auto_176551 - BLOCK
      ?auto_176552 - BLOCK
      ?auto_176553 - BLOCK
      ?auto_176554 - BLOCK
    )
    :vars
    (
      ?auto_176555 - BLOCK
      ?auto_176556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176555 ?auto_176554 ) ( ON-TABLE ?auto_176549 ) ( ON ?auto_176550 ?auto_176549 ) ( ON ?auto_176551 ?auto_176550 ) ( ON ?auto_176552 ?auto_176551 ) ( ON ?auto_176553 ?auto_176552 ) ( ON ?auto_176554 ?auto_176553 ) ( not ( = ?auto_176549 ?auto_176550 ) ) ( not ( = ?auto_176549 ?auto_176551 ) ) ( not ( = ?auto_176549 ?auto_176552 ) ) ( not ( = ?auto_176549 ?auto_176553 ) ) ( not ( = ?auto_176549 ?auto_176554 ) ) ( not ( = ?auto_176549 ?auto_176555 ) ) ( not ( = ?auto_176550 ?auto_176551 ) ) ( not ( = ?auto_176550 ?auto_176552 ) ) ( not ( = ?auto_176550 ?auto_176553 ) ) ( not ( = ?auto_176550 ?auto_176554 ) ) ( not ( = ?auto_176550 ?auto_176555 ) ) ( not ( = ?auto_176551 ?auto_176552 ) ) ( not ( = ?auto_176551 ?auto_176553 ) ) ( not ( = ?auto_176551 ?auto_176554 ) ) ( not ( = ?auto_176551 ?auto_176555 ) ) ( not ( = ?auto_176552 ?auto_176553 ) ) ( not ( = ?auto_176552 ?auto_176554 ) ) ( not ( = ?auto_176552 ?auto_176555 ) ) ( not ( = ?auto_176553 ?auto_176554 ) ) ( not ( = ?auto_176553 ?auto_176555 ) ) ( not ( = ?auto_176554 ?auto_176555 ) ) ( not ( = ?auto_176549 ?auto_176556 ) ) ( not ( = ?auto_176550 ?auto_176556 ) ) ( not ( = ?auto_176551 ?auto_176556 ) ) ( not ( = ?auto_176552 ?auto_176556 ) ) ( not ( = ?auto_176553 ?auto_176556 ) ) ( not ( = ?auto_176554 ?auto_176556 ) ) ( not ( = ?auto_176555 ?auto_176556 ) ) ( ON ?auto_176556 ?auto_176555 ) ( CLEAR ?auto_176556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176549 ?auto_176550 ?auto_176551 ?auto_176552 ?auto_176553 ?auto_176554 ?auto_176555 )
      ( MAKE-6PILE ?auto_176549 ?auto_176550 ?auto_176551 ?auto_176552 ?auto_176553 ?auto_176554 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176557 - BLOCK
      ?auto_176558 - BLOCK
      ?auto_176559 - BLOCK
      ?auto_176560 - BLOCK
      ?auto_176561 - BLOCK
      ?auto_176562 - BLOCK
    )
    :vars
    (
      ?auto_176563 - BLOCK
      ?auto_176564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176563 ?auto_176562 ) ( ON-TABLE ?auto_176557 ) ( ON ?auto_176558 ?auto_176557 ) ( ON ?auto_176559 ?auto_176558 ) ( ON ?auto_176560 ?auto_176559 ) ( ON ?auto_176561 ?auto_176560 ) ( ON ?auto_176562 ?auto_176561 ) ( not ( = ?auto_176557 ?auto_176558 ) ) ( not ( = ?auto_176557 ?auto_176559 ) ) ( not ( = ?auto_176557 ?auto_176560 ) ) ( not ( = ?auto_176557 ?auto_176561 ) ) ( not ( = ?auto_176557 ?auto_176562 ) ) ( not ( = ?auto_176557 ?auto_176563 ) ) ( not ( = ?auto_176558 ?auto_176559 ) ) ( not ( = ?auto_176558 ?auto_176560 ) ) ( not ( = ?auto_176558 ?auto_176561 ) ) ( not ( = ?auto_176558 ?auto_176562 ) ) ( not ( = ?auto_176558 ?auto_176563 ) ) ( not ( = ?auto_176559 ?auto_176560 ) ) ( not ( = ?auto_176559 ?auto_176561 ) ) ( not ( = ?auto_176559 ?auto_176562 ) ) ( not ( = ?auto_176559 ?auto_176563 ) ) ( not ( = ?auto_176560 ?auto_176561 ) ) ( not ( = ?auto_176560 ?auto_176562 ) ) ( not ( = ?auto_176560 ?auto_176563 ) ) ( not ( = ?auto_176561 ?auto_176562 ) ) ( not ( = ?auto_176561 ?auto_176563 ) ) ( not ( = ?auto_176562 ?auto_176563 ) ) ( not ( = ?auto_176557 ?auto_176564 ) ) ( not ( = ?auto_176558 ?auto_176564 ) ) ( not ( = ?auto_176559 ?auto_176564 ) ) ( not ( = ?auto_176560 ?auto_176564 ) ) ( not ( = ?auto_176561 ?auto_176564 ) ) ( not ( = ?auto_176562 ?auto_176564 ) ) ( not ( = ?auto_176563 ?auto_176564 ) ) ( HOLDING ?auto_176564 ) ( CLEAR ?auto_176563 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176557 ?auto_176558 ?auto_176559 ?auto_176560 ?auto_176561 ?auto_176562 ?auto_176563 ?auto_176564 )
      ( MAKE-6PILE ?auto_176557 ?auto_176558 ?auto_176559 ?auto_176560 ?auto_176561 ?auto_176562 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176565 - BLOCK
      ?auto_176566 - BLOCK
      ?auto_176567 - BLOCK
      ?auto_176568 - BLOCK
      ?auto_176569 - BLOCK
      ?auto_176570 - BLOCK
    )
    :vars
    (
      ?auto_176571 - BLOCK
      ?auto_176572 - BLOCK
      ?auto_176573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176571 ?auto_176570 ) ( ON-TABLE ?auto_176565 ) ( ON ?auto_176566 ?auto_176565 ) ( ON ?auto_176567 ?auto_176566 ) ( ON ?auto_176568 ?auto_176567 ) ( ON ?auto_176569 ?auto_176568 ) ( ON ?auto_176570 ?auto_176569 ) ( not ( = ?auto_176565 ?auto_176566 ) ) ( not ( = ?auto_176565 ?auto_176567 ) ) ( not ( = ?auto_176565 ?auto_176568 ) ) ( not ( = ?auto_176565 ?auto_176569 ) ) ( not ( = ?auto_176565 ?auto_176570 ) ) ( not ( = ?auto_176565 ?auto_176571 ) ) ( not ( = ?auto_176566 ?auto_176567 ) ) ( not ( = ?auto_176566 ?auto_176568 ) ) ( not ( = ?auto_176566 ?auto_176569 ) ) ( not ( = ?auto_176566 ?auto_176570 ) ) ( not ( = ?auto_176566 ?auto_176571 ) ) ( not ( = ?auto_176567 ?auto_176568 ) ) ( not ( = ?auto_176567 ?auto_176569 ) ) ( not ( = ?auto_176567 ?auto_176570 ) ) ( not ( = ?auto_176567 ?auto_176571 ) ) ( not ( = ?auto_176568 ?auto_176569 ) ) ( not ( = ?auto_176568 ?auto_176570 ) ) ( not ( = ?auto_176568 ?auto_176571 ) ) ( not ( = ?auto_176569 ?auto_176570 ) ) ( not ( = ?auto_176569 ?auto_176571 ) ) ( not ( = ?auto_176570 ?auto_176571 ) ) ( not ( = ?auto_176565 ?auto_176572 ) ) ( not ( = ?auto_176566 ?auto_176572 ) ) ( not ( = ?auto_176567 ?auto_176572 ) ) ( not ( = ?auto_176568 ?auto_176572 ) ) ( not ( = ?auto_176569 ?auto_176572 ) ) ( not ( = ?auto_176570 ?auto_176572 ) ) ( not ( = ?auto_176571 ?auto_176572 ) ) ( CLEAR ?auto_176571 ) ( ON ?auto_176572 ?auto_176573 ) ( CLEAR ?auto_176572 ) ( HAND-EMPTY ) ( not ( = ?auto_176565 ?auto_176573 ) ) ( not ( = ?auto_176566 ?auto_176573 ) ) ( not ( = ?auto_176567 ?auto_176573 ) ) ( not ( = ?auto_176568 ?auto_176573 ) ) ( not ( = ?auto_176569 ?auto_176573 ) ) ( not ( = ?auto_176570 ?auto_176573 ) ) ( not ( = ?auto_176571 ?auto_176573 ) ) ( not ( = ?auto_176572 ?auto_176573 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176572 ?auto_176573 )
      ( MAKE-6PILE ?auto_176565 ?auto_176566 ?auto_176567 ?auto_176568 ?auto_176569 ?auto_176570 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176592 - BLOCK
      ?auto_176593 - BLOCK
      ?auto_176594 - BLOCK
      ?auto_176595 - BLOCK
      ?auto_176596 - BLOCK
      ?auto_176597 - BLOCK
    )
    :vars
    (
      ?auto_176598 - BLOCK
      ?auto_176599 - BLOCK
      ?auto_176600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176592 ) ( ON ?auto_176593 ?auto_176592 ) ( ON ?auto_176594 ?auto_176593 ) ( ON ?auto_176595 ?auto_176594 ) ( ON ?auto_176596 ?auto_176595 ) ( not ( = ?auto_176592 ?auto_176593 ) ) ( not ( = ?auto_176592 ?auto_176594 ) ) ( not ( = ?auto_176592 ?auto_176595 ) ) ( not ( = ?auto_176592 ?auto_176596 ) ) ( not ( = ?auto_176592 ?auto_176597 ) ) ( not ( = ?auto_176592 ?auto_176598 ) ) ( not ( = ?auto_176593 ?auto_176594 ) ) ( not ( = ?auto_176593 ?auto_176595 ) ) ( not ( = ?auto_176593 ?auto_176596 ) ) ( not ( = ?auto_176593 ?auto_176597 ) ) ( not ( = ?auto_176593 ?auto_176598 ) ) ( not ( = ?auto_176594 ?auto_176595 ) ) ( not ( = ?auto_176594 ?auto_176596 ) ) ( not ( = ?auto_176594 ?auto_176597 ) ) ( not ( = ?auto_176594 ?auto_176598 ) ) ( not ( = ?auto_176595 ?auto_176596 ) ) ( not ( = ?auto_176595 ?auto_176597 ) ) ( not ( = ?auto_176595 ?auto_176598 ) ) ( not ( = ?auto_176596 ?auto_176597 ) ) ( not ( = ?auto_176596 ?auto_176598 ) ) ( not ( = ?auto_176597 ?auto_176598 ) ) ( not ( = ?auto_176592 ?auto_176599 ) ) ( not ( = ?auto_176593 ?auto_176599 ) ) ( not ( = ?auto_176594 ?auto_176599 ) ) ( not ( = ?auto_176595 ?auto_176599 ) ) ( not ( = ?auto_176596 ?auto_176599 ) ) ( not ( = ?auto_176597 ?auto_176599 ) ) ( not ( = ?auto_176598 ?auto_176599 ) ) ( ON ?auto_176599 ?auto_176600 ) ( not ( = ?auto_176592 ?auto_176600 ) ) ( not ( = ?auto_176593 ?auto_176600 ) ) ( not ( = ?auto_176594 ?auto_176600 ) ) ( not ( = ?auto_176595 ?auto_176600 ) ) ( not ( = ?auto_176596 ?auto_176600 ) ) ( not ( = ?auto_176597 ?auto_176600 ) ) ( not ( = ?auto_176598 ?auto_176600 ) ) ( not ( = ?auto_176599 ?auto_176600 ) ) ( ON ?auto_176598 ?auto_176599 ) ( CLEAR ?auto_176598 ) ( HOLDING ?auto_176597 ) ( CLEAR ?auto_176596 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176592 ?auto_176593 ?auto_176594 ?auto_176595 ?auto_176596 ?auto_176597 ?auto_176598 )
      ( MAKE-6PILE ?auto_176592 ?auto_176593 ?auto_176594 ?auto_176595 ?auto_176596 ?auto_176597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176601 - BLOCK
      ?auto_176602 - BLOCK
      ?auto_176603 - BLOCK
      ?auto_176604 - BLOCK
      ?auto_176605 - BLOCK
      ?auto_176606 - BLOCK
    )
    :vars
    (
      ?auto_176608 - BLOCK
      ?auto_176607 - BLOCK
      ?auto_176609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176601 ) ( ON ?auto_176602 ?auto_176601 ) ( ON ?auto_176603 ?auto_176602 ) ( ON ?auto_176604 ?auto_176603 ) ( ON ?auto_176605 ?auto_176604 ) ( not ( = ?auto_176601 ?auto_176602 ) ) ( not ( = ?auto_176601 ?auto_176603 ) ) ( not ( = ?auto_176601 ?auto_176604 ) ) ( not ( = ?auto_176601 ?auto_176605 ) ) ( not ( = ?auto_176601 ?auto_176606 ) ) ( not ( = ?auto_176601 ?auto_176608 ) ) ( not ( = ?auto_176602 ?auto_176603 ) ) ( not ( = ?auto_176602 ?auto_176604 ) ) ( not ( = ?auto_176602 ?auto_176605 ) ) ( not ( = ?auto_176602 ?auto_176606 ) ) ( not ( = ?auto_176602 ?auto_176608 ) ) ( not ( = ?auto_176603 ?auto_176604 ) ) ( not ( = ?auto_176603 ?auto_176605 ) ) ( not ( = ?auto_176603 ?auto_176606 ) ) ( not ( = ?auto_176603 ?auto_176608 ) ) ( not ( = ?auto_176604 ?auto_176605 ) ) ( not ( = ?auto_176604 ?auto_176606 ) ) ( not ( = ?auto_176604 ?auto_176608 ) ) ( not ( = ?auto_176605 ?auto_176606 ) ) ( not ( = ?auto_176605 ?auto_176608 ) ) ( not ( = ?auto_176606 ?auto_176608 ) ) ( not ( = ?auto_176601 ?auto_176607 ) ) ( not ( = ?auto_176602 ?auto_176607 ) ) ( not ( = ?auto_176603 ?auto_176607 ) ) ( not ( = ?auto_176604 ?auto_176607 ) ) ( not ( = ?auto_176605 ?auto_176607 ) ) ( not ( = ?auto_176606 ?auto_176607 ) ) ( not ( = ?auto_176608 ?auto_176607 ) ) ( ON ?auto_176607 ?auto_176609 ) ( not ( = ?auto_176601 ?auto_176609 ) ) ( not ( = ?auto_176602 ?auto_176609 ) ) ( not ( = ?auto_176603 ?auto_176609 ) ) ( not ( = ?auto_176604 ?auto_176609 ) ) ( not ( = ?auto_176605 ?auto_176609 ) ) ( not ( = ?auto_176606 ?auto_176609 ) ) ( not ( = ?auto_176608 ?auto_176609 ) ) ( not ( = ?auto_176607 ?auto_176609 ) ) ( ON ?auto_176608 ?auto_176607 ) ( CLEAR ?auto_176605 ) ( ON ?auto_176606 ?auto_176608 ) ( CLEAR ?auto_176606 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176609 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176609 ?auto_176607 ?auto_176608 )
      ( MAKE-6PILE ?auto_176601 ?auto_176602 ?auto_176603 ?auto_176604 ?auto_176605 ?auto_176606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176610 - BLOCK
      ?auto_176611 - BLOCK
      ?auto_176612 - BLOCK
      ?auto_176613 - BLOCK
      ?auto_176614 - BLOCK
      ?auto_176615 - BLOCK
    )
    :vars
    (
      ?auto_176617 - BLOCK
      ?auto_176618 - BLOCK
      ?auto_176616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176610 ) ( ON ?auto_176611 ?auto_176610 ) ( ON ?auto_176612 ?auto_176611 ) ( ON ?auto_176613 ?auto_176612 ) ( not ( = ?auto_176610 ?auto_176611 ) ) ( not ( = ?auto_176610 ?auto_176612 ) ) ( not ( = ?auto_176610 ?auto_176613 ) ) ( not ( = ?auto_176610 ?auto_176614 ) ) ( not ( = ?auto_176610 ?auto_176615 ) ) ( not ( = ?auto_176610 ?auto_176617 ) ) ( not ( = ?auto_176611 ?auto_176612 ) ) ( not ( = ?auto_176611 ?auto_176613 ) ) ( not ( = ?auto_176611 ?auto_176614 ) ) ( not ( = ?auto_176611 ?auto_176615 ) ) ( not ( = ?auto_176611 ?auto_176617 ) ) ( not ( = ?auto_176612 ?auto_176613 ) ) ( not ( = ?auto_176612 ?auto_176614 ) ) ( not ( = ?auto_176612 ?auto_176615 ) ) ( not ( = ?auto_176612 ?auto_176617 ) ) ( not ( = ?auto_176613 ?auto_176614 ) ) ( not ( = ?auto_176613 ?auto_176615 ) ) ( not ( = ?auto_176613 ?auto_176617 ) ) ( not ( = ?auto_176614 ?auto_176615 ) ) ( not ( = ?auto_176614 ?auto_176617 ) ) ( not ( = ?auto_176615 ?auto_176617 ) ) ( not ( = ?auto_176610 ?auto_176618 ) ) ( not ( = ?auto_176611 ?auto_176618 ) ) ( not ( = ?auto_176612 ?auto_176618 ) ) ( not ( = ?auto_176613 ?auto_176618 ) ) ( not ( = ?auto_176614 ?auto_176618 ) ) ( not ( = ?auto_176615 ?auto_176618 ) ) ( not ( = ?auto_176617 ?auto_176618 ) ) ( ON ?auto_176618 ?auto_176616 ) ( not ( = ?auto_176610 ?auto_176616 ) ) ( not ( = ?auto_176611 ?auto_176616 ) ) ( not ( = ?auto_176612 ?auto_176616 ) ) ( not ( = ?auto_176613 ?auto_176616 ) ) ( not ( = ?auto_176614 ?auto_176616 ) ) ( not ( = ?auto_176615 ?auto_176616 ) ) ( not ( = ?auto_176617 ?auto_176616 ) ) ( not ( = ?auto_176618 ?auto_176616 ) ) ( ON ?auto_176617 ?auto_176618 ) ( ON ?auto_176615 ?auto_176617 ) ( CLEAR ?auto_176615 ) ( ON-TABLE ?auto_176616 ) ( HOLDING ?auto_176614 ) ( CLEAR ?auto_176613 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176610 ?auto_176611 ?auto_176612 ?auto_176613 ?auto_176614 )
      ( MAKE-6PILE ?auto_176610 ?auto_176611 ?auto_176612 ?auto_176613 ?auto_176614 ?auto_176615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176619 - BLOCK
      ?auto_176620 - BLOCK
      ?auto_176621 - BLOCK
      ?auto_176622 - BLOCK
      ?auto_176623 - BLOCK
      ?auto_176624 - BLOCK
    )
    :vars
    (
      ?auto_176626 - BLOCK
      ?auto_176625 - BLOCK
      ?auto_176627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176619 ) ( ON ?auto_176620 ?auto_176619 ) ( ON ?auto_176621 ?auto_176620 ) ( ON ?auto_176622 ?auto_176621 ) ( not ( = ?auto_176619 ?auto_176620 ) ) ( not ( = ?auto_176619 ?auto_176621 ) ) ( not ( = ?auto_176619 ?auto_176622 ) ) ( not ( = ?auto_176619 ?auto_176623 ) ) ( not ( = ?auto_176619 ?auto_176624 ) ) ( not ( = ?auto_176619 ?auto_176626 ) ) ( not ( = ?auto_176620 ?auto_176621 ) ) ( not ( = ?auto_176620 ?auto_176622 ) ) ( not ( = ?auto_176620 ?auto_176623 ) ) ( not ( = ?auto_176620 ?auto_176624 ) ) ( not ( = ?auto_176620 ?auto_176626 ) ) ( not ( = ?auto_176621 ?auto_176622 ) ) ( not ( = ?auto_176621 ?auto_176623 ) ) ( not ( = ?auto_176621 ?auto_176624 ) ) ( not ( = ?auto_176621 ?auto_176626 ) ) ( not ( = ?auto_176622 ?auto_176623 ) ) ( not ( = ?auto_176622 ?auto_176624 ) ) ( not ( = ?auto_176622 ?auto_176626 ) ) ( not ( = ?auto_176623 ?auto_176624 ) ) ( not ( = ?auto_176623 ?auto_176626 ) ) ( not ( = ?auto_176624 ?auto_176626 ) ) ( not ( = ?auto_176619 ?auto_176625 ) ) ( not ( = ?auto_176620 ?auto_176625 ) ) ( not ( = ?auto_176621 ?auto_176625 ) ) ( not ( = ?auto_176622 ?auto_176625 ) ) ( not ( = ?auto_176623 ?auto_176625 ) ) ( not ( = ?auto_176624 ?auto_176625 ) ) ( not ( = ?auto_176626 ?auto_176625 ) ) ( ON ?auto_176625 ?auto_176627 ) ( not ( = ?auto_176619 ?auto_176627 ) ) ( not ( = ?auto_176620 ?auto_176627 ) ) ( not ( = ?auto_176621 ?auto_176627 ) ) ( not ( = ?auto_176622 ?auto_176627 ) ) ( not ( = ?auto_176623 ?auto_176627 ) ) ( not ( = ?auto_176624 ?auto_176627 ) ) ( not ( = ?auto_176626 ?auto_176627 ) ) ( not ( = ?auto_176625 ?auto_176627 ) ) ( ON ?auto_176626 ?auto_176625 ) ( ON ?auto_176624 ?auto_176626 ) ( ON-TABLE ?auto_176627 ) ( CLEAR ?auto_176622 ) ( ON ?auto_176623 ?auto_176624 ) ( CLEAR ?auto_176623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176627 ?auto_176625 ?auto_176626 ?auto_176624 )
      ( MAKE-6PILE ?auto_176619 ?auto_176620 ?auto_176621 ?auto_176622 ?auto_176623 ?auto_176624 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176628 - BLOCK
      ?auto_176629 - BLOCK
      ?auto_176630 - BLOCK
      ?auto_176631 - BLOCK
      ?auto_176632 - BLOCK
      ?auto_176633 - BLOCK
    )
    :vars
    (
      ?auto_176636 - BLOCK
      ?auto_176634 - BLOCK
      ?auto_176635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176628 ) ( ON ?auto_176629 ?auto_176628 ) ( ON ?auto_176630 ?auto_176629 ) ( not ( = ?auto_176628 ?auto_176629 ) ) ( not ( = ?auto_176628 ?auto_176630 ) ) ( not ( = ?auto_176628 ?auto_176631 ) ) ( not ( = ?auto_176628 ?auto_176632 ) ) ( not ( = ?auto_176628 ?auto_176633 ) ) ( not ( = ?auto_176628 ?auto_176636 ) ) ( not ( = ?auto_176629 ?auto_176630 ) ) ( not ( = ?auto_176629 ?auto_176631 ) ) ( not ( = ?auto_176629 ?auto_176632 ) ) ( not ( = ?auto_176629 ?auto_176633 ) ) ( not ( = ?auto_176629 ?auto_176636 ) ) ( not ( = ?auto_176630 ?auto_176631 ) ) ( not ( = ?auto_176630 ?auto_176632 ) ) ( not ( = ?auto_176630 ?auto_176633 ) ) ( not ( = ?auto_176630 ?auto_176636 ) ) ( not ( = ?auto_176631 ?auto_176632 ) ) ( not ( = ?auto_176631 ?auto_176633 ) ) ( not ( = ?auto_176631 ?auto_176636 ) ) ( not ( = ?auto_176632 ?auto_176633 ) ) ( not ( = ?auto_176632 ?auto_176636 ) ) ( not ( = ?auto_176633 ?auto_176636 ) ) ( not ( = ?auto_176628 ?auto_176634 ) ) ( not ( = ?auto_176629 ?auto_176634 ) ) ( not ( = ?auto_176630 ?auto_176634 ) ) ( not ( = ?auto_176631 ?auto_176634 ) ) ( not ( = ?auto_176632 ?auto_176634 ) ) ( not ( = ?auto_176633 ?auto_176634 ) ) ( not ( = ?auto_176636 ?auto_176634 ) ) ( ON ?auto_176634 ?auto_176635 ) ( not ( = ?auto_176628 ?auto_176635 ) ) ( not ( = ?auto_176629 ?auto_176635 ) ) ( not ( = ?auto_176630 ?auto_176635 ) ) ( not ( = ?auto_176631 ?auto_176635 ) ) ( not ( = ?auto_176632 ?auto_176635 ) ) ( not ( = ?auto_176633 ?auto_176635 ) ) ( not ( = ?auto_176636 ?auto_176635 ) ) ( not ( = ?auto_176634 ?auto_176635 ) ) ( ON ?auto_176636 ?auto_176634 ) ( ON ?auto_176633 ?auto_176636 ) ( ON-TABLE ?auto_176635 ) ( ON ?auto_176632 ?auto_176633 ) ( CLEAR ?auto_176632 ) ( HOLDING ?auto_176631 ) ( CLEAR ?auto_176630 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176628 ?auto_176629 ?auto_176630 ?auto_176631 )
      ( MAKE-6PILE ?auto_176628 ?auto_176629 ?auto_176630 ?auto_176631 ?auto_176632 ?auto_176633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176637 - BLOCK
      ?auto_176638 - BLOCK
      ?auto_176639 - BLOCK
      ?auto_176640 - BLOCK
      ?auto_176641 - BLOCK
      ?auto_176642 - BLOCK
    )
    :vars
    (
      ?auto_176644 - BLOCK
      ?auto_176645 - BLOCK
      ?auto_176643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176637 ) ( ON ?auto_176638 ?auto_176637 ) ( ON ?auto_176639 ?auto_176638 ) ( not ( = ?auto_176637 ?auto_176638 ) ) ( not ( = ?auto_176637 ?auto_176639 ) ) ( not ( = ?auto_176637 ?auto_176640 ) ) ( not ( = ?auto_176637 ?auto_176641 ) ) ( not ( = ?auto_176637 ?auto_176642 ) ) ( not ( = ?auto_176637 ?auto_176644 ) ) ( not ( = ?auto_176638 ?auto_176639 ) ) ( not ( = ?auto_176638 ?auto_176640 ) ) ( not ( = ?auto_176638 ?auto_176641 ) ) ( not ( = ?auto_176638 ?auto_176642 ) ) ( not ( = ?auto_176638 ?auto_176644 ) ) ( not ( = ?auto_176639 ?auto_176640 ) ) ( not ( = ?auto_176639 ?auto_176641 ) ) ( not ( = ?auto_176639 ?auto_176642 ) ) ( not ( = ?auto_176639 ?auto_176644 ) ) ( not ( = ?auto_176640 ?auto_176641 ) ) ( not ( = ?auto_176640 ?auto_176642 ) ) ( not ( = ?auto_176640 ?auto_176644 ) ) ( not ( = ?auto_176641 ?auto_176642 ) ) ( not ( = ?auto_176641 ?auto_176644 ) ) ( not ( = ?auto_176642 ?auto_176644 ) ) ( not ( = ?auto_176637 ?auto_176645 ) ) ( not ( = ?auto_176638 ?auto_176645 ) ) ( not ( = ?auto_176639 ?auto_176645 ) ) ( not ( = ?auto_176640 ?auto_176645 ) ) ( not ( = ?auto_176641 ?auto_176645 ) ) ( not ( = ?auto_176642 ?auto_176645 ) ) ( not ( = ?auto_176644 ?auto_176645 ) ) ( ON ?auto_176645 ?auto_176643 ) ( not ( = ?auto_176637 ?auto_176643 ) ) ( not ( = ?auto_176638 ?auto_176643 ) ) ( not ( = ?auto_176639 ?auto_176643 ) ) ( not ( = ?auto_176640 ?auto_176643 ) ) ( not ( = ?auto_176641 ?auto_176643 ) ) ( not ( = ?auto_176642 ?auto_176643 ) ) ( not ( = ?auto_176644 ?auto_176643 ) ) ( not ( = ?auto_176645 ?auto_176643 ) ) ( ON ?auto_176644 ?auto_176645 ) ( ON ?auto_176642 ?auto_176644 ) ( ON-TABLE ?auto_176643 ) ( ON ?auto_176641 ?auto_176642 ) ( CLEAR ?auto_176639 ) ( ON ?auto_176640 ?auto_176641 ) ( CLEAR ?auto_176640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176643 ?auto_176645 ?auto_176644 ?auto_176642 ?auto_176641 )
      ( MAKE-6PILE ?auto_176637 ?auto_176638 ?auto_176639 ?auto_176640 ?auto_176641 ?auto_176642 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176646 - BLOCK
      ?auto_176647 - BLOCK
      ?auto_176648 - BLOCK
      ?auto_176649 - BLOCK
      ?auto_176650 - BLOCK
      ?auto_176651 - BLOCK
    )
    :vars
    (
      ?auto_176654 - BLOCK
      ?auto_176653 - BLOCK
      ?auto_176652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176646 ) ( ON ?auto_176647 ?auto_176646 ) ( not ( = ?auto_176646 ?auto_176647 ) ) ( not ( = ?auto_176646 ?auto_176648 ) ) ( not ( = ?auto_176646 ?auto_176649 ) ) ( not ( = ?auto_176646 ?auto_176650 ) ) ( not ( = ?auto_176646 ?auto_176651 ) ) ( not ( = ?auto_176646 ?auto_176654 ) ) ( not ( = ?auto_176647 ?auto_176648 ) ) ( not ( = ?auto_176647 ?auto_176649 ) ) ( not ( = ?auto_176647 ?auto_176650 ) ) ( not ( = ?auto_176647 ?auto_176651 ) ) ( not ( = ?auto_176647 ?auto_176654 ) ) ( not ( = ?auto_176648 ?auto_176649 ) ) ( not ( = ?auto_176648 ?auto_176650 ) ) ( not ( = ?auto_176648 ?auto_176651 ) ) ( not ( = ?auto_176648 ?auto_176654 ) ) ( not ( = ?auto_176649 ?auto_176650 ) ) ( not ( = ?auto_176649 ?auto_176651 ) ) ( not ( = ?auto_176649 ?auto_176654 ) ) ( not ( = ?auto_176650 ?auto_176651 ) ) ( not ( = ?auto_176650 ?auto_176654 ) ) ( not ( = ?auto_176651 ?auto_176654 ) ) ( not ( = ?auto_176646 ?auto_176653 ) ) ( not ( = ?auto_176647 ?auto_176653 ) ) ( not ( = ?auto_176648 ?auto_176653 ) ) ( not ( = ?auto_176649 ?auto_176653 ) ) ( not ( = ?auto_176650 ?auto_176653 ) ) ( not ( = ?auto_176651 ?auto_176653 ) ) ( not ( = ?auto_176654 ?auto_176653 ) ) ( ON ?auto_176653 ?auto_176652 ) ( not ( = ?auto_176646 ?auto_176652 ) ) ( not ( = ?auto_176647 ?auto_176652 ) ) ( not ( = ?auto_176648 ?auto_176652 ) ) ( not ( = ?auto_176649 ?auto_176652 ) ) ( not ( = ?auto_176650 ?auto_176652 ) ) ( not ( = ?auto_176651 ?auto_176652 ) ) ( not ( = ?auto_176654 ?auto_176652 ) ) ( not ( = ?auto_176653 ?auto_176652 ) ) ( ON ?auto_176654 ?auto_176653 ) ( ON ?auto_176651 ?auto_176654 ) ( ON-TABLE ?auto_176652 ) ( ON ?auto_176650 ?auto_176651 ) ( ON ?auto_176649 ?auto_176650 ) ( CLEAR ?auto_176649 ) ( HOLDING ?auto_176648 ) ( CLEAR ?auto_176647 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176646 ?auto_176647 ?auto_176648 )
      ( MAKE-6PILE ?auto_176646 ?auto_176647 ?auto_176648 ?auto_176649 ?auto_176650 ?auto_176651 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176655 - BLOCK
      ?auto_176656 - BLOCK
      ?auto_176657 - BLOCK
      ?auto_176658 - BLOCK
      ?auto_176659 - BLOCK
      ?auto_176660 - BLOCK
    )
    :vars
    (
      ?auto_176661 - BLOCK
      ?auto_176662 - BLOCK
      ?auto_176663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176655 ) ( ON ?auto_176656 ?auto_176655 ) ( not ( = ?auto_176655 ?auto_176656 ) ) ( not ( = ?auto_176655 ?auto_176657 ) ) ( not ( = ?auto_176655 ?auto_176658 ) ) ( not ( = ?auto_176655 ?auto_176659 ) ) ( not ( = ?auto_176655 ?auto_176660 ) ) ( not ( = ?auto_176655 ?auto_176661 ) ) ( not ( = ?auto_176656 ?auto_176657 ) ) ( not ( = ?auto_176656 ?auto_176658 ) ) ( not ( = ?auto_176656 ?auto_176659 ) ) ( not ( = ?auto_176656 ?auto_176660 ) ) ( not ( = ?auto_176656 ?auto_176661 ) ) ( not ( = ?auto_176657 ?auto_176658 ) ) ( not ( = ?auto_176657 ?auto_176659 ) ) ( not ( = ?auto_176657 ?auto_176660 ) ) ( not ( = ?auto_176657 ?auto_176661 ) ) ( not ( = ?auto_176658 ?auto_176659 ) ) ( not ( = ?auto_176658 ?auto_176660 ) ) ( not ( = ?auto_176658 ?auto_176661 ) ) ( not ( = ?auto_176659 ?auto_176660 ) ) ( not ( = ?auto_176659 ?auto_176661 ) ) ( not ( = ?auto_176660 ?auto_176661 ) ) ( not ( = ?auto_176655 ?auto_176662 ) ) ( not ( = ?auto_176656 ?auto_176662 ) ) ( not ( = ?auto_176657 ?auto_176662 ) ) ( not ( = ?auto_176658 ?auto_176662 ) ) ( not ( = ?auto_176659 ?auto_176662 ) ) ( not ( = ?auto_176660 ?auto_176662 ) ) ( not ( = ?auto_176661 ?auto_176662 ) ) ( ON ?auto_176662 ?auto_176663 ) ( not ( = ?auto_176655 ?auto_176663 ) ) ( not ( = ?auto_176656 ?auto_176663 ) ) ( not ( = ?auto_176657 ?auto_176663 ) ) ( not ( = ?auto_176658 ?auto_176663 ) ) ( not ( = ?auto_176659 ?auto_176663 ) ) ( not ( = ?auto_176660 ?auto_176663 ) ) ( not ( = ?auto_176661 ?auto_176663 ) ) ( not ( = ?auto_176662 ?auto_176663 ) ) ( ON ?auto_176661 ?auto_176662 ) ( ON ?auto_176660 ?auto_176661 ) ( ON-TABLE ?auto_176663 ) ( ON ?auto_176659 ?auto_176660 ) ( ON ?auto_176658 ?auto_176659 ) ( CLEAR ?auto_176656 ) ( ON ?auto_176657 ?auto_176658 ) ( CLEAR ?auto_176657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176663 ?auto_176662 ?auto_176661 ?auto_176660 ?auto_176659 ?auto_176658 )
      ( MAKE-6PILE ?auto_176655 ?auto_176656 ?auto_176657 ?auto_176658 ?auto_176659 ?auto_176660 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176664 - BLOCK
      ?auto_176665 - BLOCK
      ?auto_176666 - BLOCK
      ?auto_176667 - BLOCK
      ?auto_176668 - BLOCK
      ?auto_176669 - BLOCK
    )
    :vars
    (
      ?auto_176671 - BLOCK
      ?auto_176670 - BLOCK
      ?auto_176672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176664 ) ( not ( = ?auto_176664 ?auto_176665 ) ) ( not ( = ?auto_176664 ?auto_176666 ) ) ( not ( = ?auto_176664 ?auto_176667 ) ) ( not ( = ?auto_176664 ?auto_176668 ) ) ( not ( = ?auto_176664 ?auto_176669 ) ) ( not ( = ?auto_176664 ?auto_176671 ) ) ( not ( = ?auto_176665 ?auto_176666 ) ) ( not ( = ?auto_176665 ?auto_176667 ) ) ( not ( = ?auto_176665 ?auto_176668 ) ) ( not ( = ?auto_176665 ?auto_176669 ) ) ( not ( = ?auto_176665 ?auto_176671 ) ) ( not ( = ?auto_176666 ?auto_176667 ) ) ( not ( = ?auto_176666 ?auto_176668 ) ) ( not ( = ?auto_176666 ?auto_176669 ) ) ( not ( = ?auto_176666 ?auto_176671 ) ) ( not ( = ?auto_176667 ?auto_176668 ) ) ( not ( = ?auto_176667 ?auto_176669 ) ) ( not ( = ?auto_176667 ?auto_176671 ) ) ( not ( = ?auto_176668 ?auto_176669 ) ) ( not ( = ?auto_176668 ?auto_176671 ) ) ( not ( = ?auto_176669 ?auto_176671 ) ) ( not ( = ?auto_176664 ?auto_176670 ) ) ( not ( = ?auto_176665 ?auto_176670 ) ) ( not ( = ?auto_176666 ?auto_176670 ) ) ( not ( = ?auto_176667 ?auto_176670 ) ) ( not ( = ?auto_176668 ?auto_176670 ) ) ( not ( = ?auto_176669 ?auto_176670 ) ) ( not ( = ?auto_176671 ?auto_176670 ) ) ( ON ?auto_176670 ?auto_176672 ) ( not ( = ?auto_176664 ?auto_176672 ) ) ( not ( = ?auto_176665 ?auto_176672 ) ) ( not ( = ?auto_176666 ?auto_176672 ) ) ( not ( = ?auto_176667 ?auto_176672 ) ) ( not ( = ?auto_176668 ?auto_176672 ) ) ( not ( = ?auto_176669 ?auto_176672 ) ) ( not ( = ?auto_176671 ?auto_176672 ) ) ( not ( = ?auto_176670 ?auto_176672 ) ) ( ON ?auto_176671 ?auto_176670 ) ( ON ?auto_176669 ?auto_176671 ) ( ON-TABLE ?auto_176672 ) ( ON ?auto_176668 ?auto_176669 ) ( ON ?auto_176667 ?auto_176668 ) ( ON ?auto_176666 ?auto_176667 ) ( CLEAR ?auto_176666 ) ( HOLDING ?auto_176665 ) ( CLEAR ?auto_176664 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176664 ?auto_176665 )
      ( MAKE-6PILE ?auto_176664 ?auto_176665 ?auto_176666 ?auto_176667 ?auto_176668 ?auto_176669 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176673 - BLOCK
      ?auto_176674 - BLOCK
      ?auto_176675 - BLOCK
      ?auto_176676 - BLOCK
      ?auto_176677 - BLOCK
      ?auto_176678 - BLOCK
    )
    :vars
    (
      ?auto_176681 - BLOCK
      ?auto_176680 - BLOCK
      ?auto_176679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176673 ) ( not ( = ?auto_176673 ?auto_176674 ) ) ( not ( = ?auto_176673 ?auto_176675 ) ) ( not ( = ?auto_176673 ?auto_176676 ) ) ( not ( = ?auto_176673 ?auto_176677 ) ) ( not ( = ?auto_176673 ?auto_176678 ) ) ( not ( = ?auto_176673 ?auto_176681 ) ) ( not ( = ?auto_176674 ?auto_176675 ) ) ( not ( = ?auto_176674 ?auto_176676 ) ) ( not ( = ?auto_176674 ?auto_176677 ) ) ( not ( = ?auto_176674 ?auto_176678 ) ) ( not ( = ?auto_176674 ?auto_176681 ) ) ( not ( = ?auto_176675 ?auto_176676 ) ) ( not ( = ?auto_176675 ?auto_176677 ) ) ( not ( = ?auto_176675 ?auto_176678 ) ) ( not ( = ?auto_176675 ?auto_176681 ) ) ( not ( = ?auto_176676 ?auto_176677 ) ) ( not ( = ?auto_176676 ?auto_176678 ) ) ( not ( = ?auto_176676 ?auto_176681 ) ) ( not ( = ?auto_176677 ?auto_176678 ) ) ( not ( = ?auto_176677 ?auto_176681 ) ) ( not ( = ?auto_176678 ?auto_176681 ) ) ( not ( = ?auto_176673 ?auto_176680 ) ) ( not ( = ?auto_176674 ?auto_176680 ) ) ( not ( = ?auto_176675 ?auto_176680 ) ) ( not ( = ?auto_176676 ?auto_176680 ) ) ( not ( = ?auto_176677 ?auto_176680 ) ) ( not ( = ?auto_176678 ?auto_176680 ) ) ( not ( = ?auto_176681 ?auto_176680 ) ) ( ON ?auto_176680 ?auto_176679 ) ( not ( = ?auto_176673 ?auto_176679 ) ) ( not ( = ?auto_176674 ?auto_176679 ) ) ( not ( = ?auto_176675 ?auto_176679 ) ) ( not ( = ?auto_176676 ?auto_176679 ) ) ( not ( = ?auto_176677 ?auto_176679 ) ) ( not ( = ?auto_176678 ?auto_176679 ) ) ( not ( = ?auto_176681 ?auto_176679 ) ) ( not ( = ?auto_176680 ?auto_176679 ) ) ( ON ?auto_176681 ?auto_176680 ) ( ON ?auto_176678 ?auto_176681 ) ( ON-TABLE ?auto_176679 ) ( ON ?auto_176677 ?auto_176678 ) ( ON ?auto_176676 ?auto_176677 ) ( ON ?auto_176675 ?auto_176676 ) ( CLEAR ?auto_176673 ) ( ON ?auto_176674 ?auto_176675 ) ( CLEAR ?auto_176674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176679 ?auto_176680 ?auto_176681 ?auto_176678 ?auto_176677 ?auto_176676 ?auto_176675 )
      ( MAKE-6PILE ?auto_176673 ?auto_176674 ?auto_176675 ?auto_176676 ?auto_176677 ?auto_176678 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176682 - BLOCK
      ?auto_176683 - BLOCK
      ?auto_176684 - BLOCK
      ?auto_176685 - BLOCK
      ?auto_176686 - BLOCK
      ?auto_176687 - BLOCK
    )
    :vars
    (
      ?auto_176689 - BLOCK
      ?auto_176690 - BLOCK
      ?auto_176688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176682 ?auto_176683 ) ) ( not ( = ?auto_176682 ?auto_176684 ) ) ( not ( = ?auto_176682 ?auto_176685 ) ) ( not ( = ?auto_176682 ?auto_176686 ) ) ( not ( = ?auto_176682 ?auto_176687 ) ) ( not ( = ?auto_176682 ?auto_176689 ) ) ( not ( = ?auto_176683 ?auto_176684 ) ) ( not ( = ?auto_176683 ?auto_176685 ) ) ( not ( = ?auto_176683 ?auto_176686 ) ) ( not ( = ?auto_176683 ?auto_176687 ) ) ( not ( = ?auto_176683 ?auto_176689 ) ) ( not ( = ?auto_176684 ?auto_176685 ) ) ( not ( = ?auto_176684 ?auto_176686 ) ) ( not ( = ?auto_176684 ?auto_176687 ) ) ( not ( = ?auto_176684 ?auto_176689 ) ) ( not ( = ?auto_176685 ?auto_176686 ) ) ( not ( = ?auto_176685 ?auto_176687 ) ) ( not ( = ?auto_176685 ?auto_176689 ) ) ( not ( = ?auto_176686 ?auto_176687 ) ) ( not ( = ?auto_176686 ?auto_176689 ) ) ( not ( = ?auto_176687 ?auto_176689 ) ) ( not ( = ?auto_176682 ?auto_176690 ) ) ( not ( = ?auto_176683 ?auto_176690 ) ) ( not ( = ?auto_176684 ?auto_176690 ) ) ( not ( = ?auto_176685 ?auto_176690 ) ) ( not ( = ?auto_176686 ?auto_176690 ) ) ( not ( = ?auto_176687 ?auto_176690 ) ) ( not ( = ?auto_176689 ?auto_176690 ) ) ( ON ?auto_176690 ?auto_176688 ) ( not ( = ?auto_176682 ?auto_176688 ) ) ( not ( = ?auto_176683 ?auto_176688 ) ) ( not ( = ?auto_176684 ?auto_176688 ) ) ( not ( = ?auto_176685 ?auto_176688 ) ) ( not ( = ?auto_176686 ?auto_176688 ) ) ( not ( = ?auto_176687 ?auto_176688 ) ) ( not ( = ?auto_176689 ?auto_176688 ) ) ( not ( = ?auto_176690 ?auto_176688 ) ) ( ON ?auto_176689 ?auto_176690 ) ( ON ?auto_176687 ?auto_176689 ) ( ON-TABLE ?auto_176688 ) ( ON ?auto_176686 ?auto_176687 ) ( ON ?auto_176685 ?auto_176686 ) ( ON ?auto_176684 ?auto_176685 ) ( ON ?auto_176683 ?auto_176684 ) ( CLEAR ?auto_176683 ) ( HOLDING ?auto_176682 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176682 )
      ( MAKE-6PILE ?auto_176682 ?auto_176683 ?auto_176684 ?auto_176685 ?auto_176686 ?auto_176687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_176691 - BLOCK
      ?auto_176692 - BLOCK
      ?auto_176693 - BLOCK
      ?auto_176694 - BLOCK
      ?auto_176695 - BLOCK
      ?auto_176696 - BLOCK
    )
    :vars
    (
      ?auto_176699 - BLOCK
      ?auto_176698 - BLOCK
      ?auto_176697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176691 ?auto_176692 ) ) ( not ( = ?auto_176691 ?auto_176693 ) ) ( not ( = ?auto_176691 ?auto_176694 ) ) ( not ( = ?auto_176691 ?auto_176695 ) ) ( not ( = ?auto_176691 ?auto_176696 ) ) ( not ( = ?auto_176691 ?auto_176699 ) ) ( not ( = ?auto_176692 ?auto_176693 ) ) ( not ( = ?auto_176692 ?auto_176694 ) ) ( not ( = ?auto_176692 ?auto_176695 ) ) ( not ( = ?auto_176692 ?auto_176696 ) ) ( not ( = ?auto_176692 ?auto_176699 ) ) ( not ( = ?auto_176693 ?auto_176694 ) ) ( not ( = ?auto_176693 ?auto_176695 ) ) ( not ( = ?auto_176693 ?auto_176696 ) ) ( not ( = ?auto_176693 ?auto_176699 ) ) ( not ( = ?auto_176694 ?auto_176695 ) ) ( not ( = ?auto_176694 ?auto_176696 ) ) ( not ( = ?auto_176694 ?auto_176699 ) ) ( not ( = ?auto_176695 ?auto_176696 ) ) ( not ( = ?auto_176695 ?auto_176699 ) ) ( not ( = ?auto_176696 ?auto_176699 ) ) ( not ( = ?auto_176691 ?auto_176698 ) ) ( not ( = ?auto_176692 ?auto_176698 ) ) ( not ( = ?auto_176693 ?auto_176698 ) ) ( not ( = ?auto_176694 ?auto_176698 ) ) ( not ( = ?auto_176695 ?auto_176698 ) ) ( not ( = ?auto_176696 ?auto_176698 ) ) ( not ( = ?auto_176699 ?auto_176698 ) ) ( ON ?auto_176698 ?auto_176697 ) ( not ( = ?auto_176691 ?auto_176697 ) ) ( not ( = ?auto_176692 ?auto_176697 ) ) ( not ( = ?auto_176693 ?auto_176697 ) ) ( not ( = ?auto_176694 ?auto_176697 ) ) ( not ( = ?auto_176695 ?auto_176697 ) ) ( not ( = ?auto_176696 ?auto_176697 ) ) ( not ( = ?auto_176699 ?auto_176697 ) ) ( not ( = ?auto_176698 ?auto_176697 ) ) ( ON ?auto_176699 ?auto_176698 ) ( ON ?auto_176696 ?auto_176699 ) ( ON-TABLE ?auto_176697 ) ( ON ?auto_176695 ?auto_176696 ) ( ON ?auto_176694 ?auto_176695 ) ( ON ?auto_176693 ?auto_176694 ) ( ON ?auto_176692 ?auto_176693 ) ( ON ?auto_176691 ?auto_176692 ) ( CLEAR ?auto_176691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176697 ?auto_176698 ?auto_176699 ?auto_176696 ?auto_176695 ?auto_176694 ?auto_176693 ?auto_176692 )
      ( MAKE-6PILE ?auto_176691 ?auto_176692 ?auto_176693 ?auto_176694 ?auto_176695 ?auto_176696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176702 - BLOCK
      ?auto_176703 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_176703 ) ( CLEAR ?auto_176702 ) ( ON-TABLE ?auto_176702 ) ( not ( = ?auto_176702 ?auto_176703 ) ) )
    :subtasks
    ( ( !STACK ?auto_176703 ?auto_176702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176704 - BLOCK
      ?auto_176705 - BLOCK
    )
    :vars
    (
      ?auto_176706 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_176704 ) ( ON-TABLE ?auto_176704 ) ( not ( = ?auto_176704 ?auto_176705 ) ) ( ON ?auto_176705 ?auto_176706 ) ( CLEAR ?auto_176705 ) ( HAND-EMPTY ) ( not ( = ?auto_176704 ?auto_176706 ) ) ( not ( = ?auto_176705 ?auto_176706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176705 ?auto_176706 )
      ( MAKE-2PILE ?auto_176704 ?auto_176705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176707 - BLOCK
      ?auto_176708 - BLOCK
    )
    :vars
    (
      ?auto_176709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176707 ?auto_176708 ) ) ( ON ?auto_176708 ?auto_176709 ) ( CLEAR ?auto_176708 ) ( not ( = ?auto_176707 ?auto_176709 ) ) ( not ( = ?auto_176708 ?auto_176709 ) ) ( HOLDING ?auto_176707 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176707 )
      ( MAKE-2PILE ?auto_176707 ?auto_176708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176710 - BLOCK
      ?auto_176711 - BLOCK
    )
    :vars
    (
      ?auto_176712 - BLOCK
      ?auto_176713 - BLOCK
      ?auto_176715 - BLOCK
      ?auto_176714 - BLOCK
      ?auto_176717 - BLOCK
      ?auto_176716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176710 ?auto_176711 ) ) ( ON ?auto_176711 ?auto_176712 ) ( not ( = ?auto_176710 ?auto_176712 ) ) ( not ( = ?auto_176711 ?auto_176712 ) ) ( ON ?auto_176710 ?auto_176711 ) ( CLEAR ?auto_176710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176713 ) ( ON ?auto_176715 ?auto_176713 ) ( ON ?auto_176714 ?auto_176715 ) ( ON ?auto_176717 ?auto_176714 ) ( ON ?auto_176716 ?auto_176717 ) ( ON ?auto_176712 ?auto_176716 ) ( not ( = ?auto_176713 ?auto_176715 ) ) ( not ( = ?auto_176713 ?auto_176714 ) ) ( not ( = ?auto_176713 ?auto_176717 ) ) ( not ( = ?auto_176713 ?auto_176716 ) ) ( not ( = ?auto_176713 ?auto_176712 ) ) ( not ( = ?auto_176713 ?auto_176711 ) ) ( not ( = ?auto_176713 ?auto_176710 ) ) ( not ( = ?auto_176715 ?auto_176714 ) ) ( not ( = ?auto_176715 ?auto_176717 ) ) ( not ( = ?auto_176715 ?auto_176716 ) ) ( not ( = ?auto_176715 ?auto_176712 ) ) ( not ( = ?auto_176715 ?auto_176711 ) ) ( not ( = ?auto_176715 ?auto_176710 ) ) ( not ( = ?auto_176714 ?auto_176717 ) ) ( not ( = ?auto_176714 ?auto_176716 ) ) ( not ( = ?auto_176714 ?auto_176712 ) ) ( not ( = ?auto_176714 ?auto_176711 ) ) ( not ( = ?auto_176714 ?auto_176710 ) ) ( not ( = ?auto_176717 ?auto_176716 ) ) ( not ( = ?auto_176717 ?auto_176712 ) ) ( not ( = ?auto_176717 ?auto_176711 ) ) ( not ( = ?auto_176717 ?auto_176710 ) ) ( not ( = ?auto_176716 ?auto_176712 ) ) ( not ( = ?auto_176716 ?auto_176711 ) ) ( not ( = ?auto_176716 ?auto_176710 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176713 ?auto_176715 ?auto_176714 ?auto_176717 ?auto_176716 ?auto_176712 ?auto_176711 )
      ( MAKE-2PILE ?auto_176710 ?auto_176711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176718 - BLOCK
      ?auto_176719 - BLOCK
    )
    :vars
    (
      ?auto_176724 - BLOCK
      ?auto_176723 - BLOCK
      ?auto_176721 - BLOCK
      ?auto_176720 - BLOCK
      ?auto_176722 - BLOCK
      ?auto_176725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176718 ?auto_176719 ) ) ( ON ?auto_176719 ?auto_176724 ) ( not ( = ?auto_176718 ?auto_176724 ) ) ( not ( = ?auto_176719 ?auto_176724 ) ) ( ON-TABLE ?auto_176723 ) ( ON ?auto_176721 ?auto_176723 ) ( ON ?auto_176720 ?auto_176721 ) ( ON ?auto_176722 ?auto_176720 ) ( ON ?auto_176725 ?auto_176722 ) ( ON ?auto_176724 ?auto_176725 ) ( not ( = ?auto_176723 ?auto_176721 ) ) ( not ( = ?auto_176723 ?auto_176720 ) ) ( not ( = ?auto_176723 ?auto_176722 ) ) ( not ( = ?auto_176723 ?auto_176725 ) ) ( not ( = ?auto_176723 ?auto_176724 ) ) ( not ( = ?auto_176723 ?auto_176719 ) ) ( not ( = ?auto_176723 ?auto_176718 ) ) ( not ( = ?auto_176721 ?auto_176720 ) ) ( not ( = ?auto_176721 ?auto_176722 ) ) ( not ( = ?auto_176721 ?auto_176725 ) ) ( not ( = ?auto_176721 ?auto_176724 ) ) ( not ( = ?auto_176721 ?auto_176719 ) ) ( not ( = ?auto_176721 ?auto_176718 ) ) ( not ( = ?auto_176720 ?auto_176722 ) ) ( not ( = ?auto_176720 ?auto_176725 ) ) ( not ( = ?auto_176720 ?auto_176724 ) ) ( not ( = ?auto_176720 ?auto_176719 ) ) ( not ( = ?auto_176720 ?auto_176718 ) ) ( not ( = ?auto_176722 ?auto_176725 ) ) ( not ( = ?auto_176722 ?auto_176724 ) ) ( not ( = ?auto_176722 ?auto_176719 ) ) ( not ( = ?auto_176722 ?auto_176718 ) ) ( not ( = ?auto_176725 ?auto_176724 ) ) ( not ( = ?auto_176725 ?auto_176719 ) ) ( not ( = ?auto_176725 ?auto_176718 ) ) ( HOLDING ?auto_176718 ) ( CLEAR ?auto_176719 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176723 ?auto_176721 ?auto_176720 ?auto_176722 ?auto_176725 ?auto_176724 ?auto_176719 ?auto_176718 )
      ( MAKE-2PILE ?auto_176718 ?auto_176719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176726 - BLOCK
      ?auto_176727 - BLOCK
    )
    :vars
    (
      ?auto_176729 - BLOCK
      ?auto_176733 - BLOCK
      ?auto_176731 - BLOCK
      ?auto_176732 - BLOCK
      ?auto_176730 - BLOCK
      ?auto_176728 - BLOCK
      ?auto_176734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176726 ?auto_176727 ) ) ( ON ?auto_176727 ?auto_176729 ) ( not ( = ?auto_176726 ?auto_176729 ) ) ( not ( = ?auto_176727 ?auto_176729 ) ) ( ON-TABLE ?auto_176733 ) ( ON ?auto_176731 ?auto_176733 ) ( ON ?auto_176732 ?auto_176731 ) ( ON ?auto_176730 ?auto_176732 ) ( ON ?auto_176728 ?auto_176730 ) ( ON ?auto_176729 ?auto_176728 ) ( not ( = ?auto_176733 ?auto_176731 ) ) ( not ( = ?auto_176733 ?auto_176732 ) ) ( not ( = ?auto_176733 ?auto_176730 ) ) ( not ( = ?auto_176733 ?auto_176728 ) ) ( not ( = ?auto_176733 ?auto_176729 ) ) ( not ( = ?auto_176733 ?auto_176727 ) ) ( not ( = ?auto_176733 ?auto_176726 ) ) ( not ( = ?auto_176731 ?auto_176732 ) ) ( not ( = ?auto_176731 ?auto_176730 ) ) ( not ( = ?auto_176731 ?auto_176728 ) ) ( not ( = ?auto_176731 ?auto_176729 ) ) ( not ( = ?auto_176731 ?auto_176727 ) ) ( not ( = ?auto_176731 ?auto_176726 ) ) ( not ( = ?auto_176732 ?auto_176730 ) ) ( not ( = ?auto_176732 ?auto_176728 ) ) ( not ( = ?auto_176732 ?auto_176729 ) ) ( not ( = ?auto_176732 ?auto_176727 ) ) ( not ( = ?auto_176732 ?auto_176726 ) ) ( not ( = ?auto_176730 ?auto_176728 ) ) ( not ( = ?auto_176730 ?auto_176729 ) ) ( not ( = ?auto_176730 ?auto_176727 ) ) ( not ( = ?auto_176730 ?auto_176726 ) ) ( not ( = ?auto_176728 ?auto_176729 ) ) ( not ( = ?auto_176728 ?auto_176727 ) ) ( not ( = ?auto_176728 ?auto_176726 ) ) ( CLEAR ?auto_176727 ) ( ON ?auto_176726 ?auto_176734 ) ( CLEAR ?auto_176726 ) ( HAND-EMPTY ) ( not ( = ?auto_176726 ?auto_176734 ) ) ( not ( = ?auto_176727 ?auto_176734 ) ) ( not ( = ?auto_176729 ?auto_176734 ) ) ( not ( = ?auto_176733 ?auto_176734 ) ) ( not ( = ?auto_176731 ?auto_176734 ) ) ( not ( = ?auto_176732 ?auto_176734 ) ) ( not ( = ?auto_176730 ?auto_176734 ) ) ( not ( = ?auto_176728 ?auto_176734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176726 ?auto_176734 )
      ( MAKE-2PILE ?auto_176726 ?auto_176727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176735 - BLOCK
      ?auto_176736 - BLOCK
    )
    :vars
    (
      ?auto_176738 - BLOCK
      ?auto_176742 - BLOCK
      ?auto_176743 - BLOCK
      ?auto_176739 - BLOCK
      ?auto_176737 - BLOCK
      ?auto_176741 - BLOCK
      ?auto_176740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176735 ?auto_176736 ) ) ( not ( = ?auto_176735 ?auto_176738 ) ) ( not ( = ?auto_176736 ?auto_176738 ) ) ( ON-TABLE ?auto_176742 ) ( ON ?auto_176743 ?auto_176742 ) ( ON ?auto_176739 ?auto_176743 ) ( ON ?auto_176737 ?auto_176739 ) ( ON ?auto_176741 ?auto_176737 ) ( ON ?auto_176738 ?auto_176741 ) ( not ( = ?auto_176742 ?auto_176743 ) ) ( not ( = ?auto_176742 ?auto_176739 ) ) ( not ( = ?auto_176742 ?auto_176737 ) ) ( not ( = ?auto_176742 ?auto_176741 ) ) ( not ( = ?auto_176742 ?auto_176738 ) ) ( not ( = ?auto_176742 ?auto_176736 ) ) ( not ( = ?auto_176742 ?auto_176735 ) ) ( not ( = ?auto_176743 ?auto_176739 ) ) ( not ( = ?auto_176743 ?auto_176737 ) ) ( not ( = ?auto_176743 ?auto_176741 ) ) ( not ( = ?auto_176743 ?auto_176738 ) ) ( not ( = ?auto_176743 ?auto_176736 ) ) ( not ( = ?auto_176743 ?auto_176735 ) ) ( not ( = ?auto_176739 ?auto_176737 ) ) ( not ( = ?auto_176739 ?auto_176741 ) ) ( not ( = ?auto_176739 ?auto_176738 ) ) ( not ( = ?auto_176739 ?auto_176736 ) ) ( not ( = ?auto_176739 ?auto_176735 ) ) ( not ( = ?auto_176737 ?auto_176741 ) ) ( not ( = ?auto_176737 ?auto_176738 ) ) ( not ( = ?auto_176737 ?auto_176736 ) ) ( not ( = ?auto_176737 ?auto_176735 ) ) ( not ( = ?auto_176741 ?auto_176738 ) ) ( not ( = ?auto_176741 ?auto_176736 ) ) ( not ( = ?auto_176741 ?auto_176735 ) ) ( ON ?auto_176735 ?auto_176740 ) ( CLEAR ?auto_176735 ) ( not ( = ?auto_176735 ?auto_176740 ) ) ( not ( = ?auto_176736 ?auto_176740 ) ) ( not ( = ?auto_176738 ?auto_176740 ) ) ( not ( = ?auto_176742 ?auto_176740 ) ) ( not ( = ?auto_176743 ?auto_176740 ) ) ( not ( = ?auto_176739 ?auto_176740 ) ) ( not ( = ?auto_176737 ?auto_176740 ) ) ( not ( = ?auto_176741 ?auto_176740 ) ) ( HOLDING ?auto_176736 ) ( CLEAR ?auto_176738 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176742 ?auto_176743 ?auto_176739 ?auto_176737 ?auto_176741 ?auto_176738 ?auto_176736 )
      ( MAKE-2PILE ?auto_176735 ?auto_176736 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176744 - BLOCK
      ?auto_176745 - BLOCK
    )
    :vars
    (
      ?auto_176746 - BLOCK
      ?auto_176751 - BLOCK
      ?auto_176747 - BLOCK
      ?auto_176752 - BLOCK
      ?auto_176750 - BLOCK
      ?auto_176749 - BLOCK
      ?auto_176748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176744 ?auto_176745 ) ) ( not ( = ?auto_176744 ?auto_176746 ) ) ( not ( = ?auto_176745 ?auto_176746 ) ) ( ON-TABLE ?auto_176751 ) ( ON ?auto_176747 ?auto_176751 ) ( ON ?auto_176752 ?auto_176747 ) ( ON ?auto_176750 ?auto_176752 ) ( ON ?auto_176749 ?auto_176750 ) ( ON ?auto_176746 ?auto_176749 ) ( not ( = ?auto_176751 ?auto_176747 ) ) ( not ( = ?auto_176751 ?auto_176752 ) ) ( not ( = ?auto_176751 ?auto_176750 ) ) ( not ( = ?auto_176751 ?auto_176749 ) ) ( not ( = ?auto_176751 ?auto_176746 ) ) ( not ( = ?auto_176751 ?auto_176745 ) ) ( not ( = ?auto_176751 ?auto_176744 ) ) ( not ( = ?auto_176747 ?auto_176752 ) ) ( not ( = ?auto_176747 ?auto_176750 ) ) ( not ( = ?auto_176747 ?auto_176749 ) ) ( not ( = ?auto_176747 ?auto_176746 ) ) ( not ( = ?auto_176747 ?auto_176745 ) ) ( not ( = ?auto_176747 ?auto_176744 ) ) ( not ( = ?auto_176752 ?auto_176750 ) ) ( not ( = ?auto_176752 ?auto_176749 ) ) ( not ( = ?auto_176752 ?auto_176746 ) ) ( not ( = ?auto_176752 ?auto_176745 ) ) ( not ( = ?auto_176752 ?auto_176744 ) ) ( not ( = ?auto_176750 ?auto_176749 ) ) ( not ( = ?auto_176750 ?auto_176746 ) ) ( not ( = ?auto_176750 ?auto_176745 ) ) ( not ( = ?auto_176750 ?auto_176744 ) ) ( not ( = ?auto_176749 ?auto_176746 ) ) ( not ( = ?auto_176749 ?auto_176745 ) ) ( not ( = ?auto_176749 ?auto_176744 ) ) ( ON ?auto_176744 ?auto_176748 ) ( not ( = ?auto_176744 ?auto_176748 ) ) ( not ( = ?auto_176745 ?auto_176748 ) ) ( not ( = ?auto_176746 ?auto_176748 ) ) ( not ( = ?auto_176751 ?auto_176748 ) ) ( not ( = ?auto_176747 ?auto_176748 ) ) ( not ( = ?auto_176752 ?auto_176748 ) ) ( not ( = ?auto_176750 ?auto_176748 ) ) ( not ( = ?auto_176749 ?auto_176748 ) ) ( CLEAR ?auto_176746 ) ( ON ?auto_176745 ?auto_176744 ) ( CLEAR ?auto_176745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176748 ?auto_176744 )
      ( MAKE-2PILE ?auto_176744 ?auto_176745 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176753 - BLOCK
      ?auto_176754 - BLOCK
    )
    :vars
    (
      ?auto_176759 - BLOCK
      ?auto_176756 - BLOCK
      ?auto_176760 - BLOCK
      ?auto_176758 - BLOCK
      ?auto_176755 - BLOCK
      ?auto_176757 - BLOCK
      ?auto_176761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176753 ?auto_176754 ) ) ( not ( = ?auto_176753 ?auto_176759 ) ) ( not ( = ?auto_176754 ?auto_176759 ) ) ( ON-TABLE ?auto_176756 ) ( ON ?auto_176760 ?auto_176756 ) ( ON ?auto_176758 ?auto_176760 ) ( ON ?auto_176755 ?auto_176758 ) ( ON ?auto_176757 ?auto_176755 ) ( not ( = ?auto_176756 ?auto_176760 ) ) ( not ( = ?auto_176756 ?auto_176758 ) ) ( not ( = ?auto_176756 ?auto_176755 ) ) ( not ( = ?auto_176756 ?auto_176757 ) ) ( not ( = ?auto_176756 ?auto_176759 ) ) ( not ( = ?auto_176756 ?auto_176754 ) ) ( not ( = ?auto_176756 ?auto_176753 ) ) ( not ( = ?auto_176760 ?auto_176758 ) ) ( not ( = ?auto_176760 ?auto_176755 ) ) ( not ( = ?auto_176760 ?auto_176757 ) ) ( not ( = ?auto_176760 ?auto_176759 ) ) ( not ( = ?auto_176760 ?auto_176754 ) ) ( not ( = ?auto_176760 ?auto_176753 ) ) ( not ( = ?auto_176758 ?auto_176755 ) ) ( not ( = ?auto_176758 ?auto_176757 ) ) ( not ( = ?auto_176758 ?auto_176759 ) ) ( not ( = ?auto_176758 ?auto_176754 ) ) ( not ( = ?auto_176758 ?auto_176753 ) ) ( not ( = ?auto_176755 ?auto_176757 ) ) ( not ( = ?auto_176755 ?auto_176759 ) ) ( not ( = ?auto_176755 ?auto_176754 ) ) ( not ( = ?auto_176755 ?auto_176753 ) ) ( not ( = ?auto_176757 ?auto_176759 ) ) ( not ( = ?auto_176757 ?auto_176754 ) ) ( not ( = ?auto_176757 ?auto_176753 ) ) ( ON ?auto_176753 ?auto_176761 ) ( not ( = ?auto_176753 ?auto_176761 ) ) ( not ( = ?auto_176754 ?auto_176761 ) ) ( not ( = ?auto_176759 ?auto_176761 ) ) ( not ( = ?auto_176756 ?auto_176761 ) ) ( not ( = ?auto_176760 ?auto_176761 ) ) ( not ( = ?auto_176758 ?auto_176761 ) ) ( not ( = ?auto_176755 ?auto_176761 ) ) ( not ( = ?auto_176757 ?auto_176761 ) ) ( ON ?auto_176754 ?auto_176753 ) ( CLEAR ?auto_176754 ) ( ON-TABLE ?auto_176761 ) ( HOLDING ?auto_176759 ) ( CLEAR ?auto_176757 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176756 ?auto_176760 ?auto_176758 ?auto_176755 ?auto_176757 ?auto_176759 )
      ( MAKE-2PILE ?auto_176753 ?auto_176754 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176762 - BLOCK
      ?auto_176763 - BLOCK
    )
    :vars
    (
      ?auto_176767 - BLOCK
      ?auto_176764 - BLOCK
      ?auto_176765 - BLOCK
      ?auto_176770 - BLOCK
      ?auto_176769 - BLOCK
      ?auto_176768 - BLOCK
      ?auto_176766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176762 ?auto_176763 ) ) ( not ( = ?auto_176762 ?auto_176767 ) ) ( not ( = ?auto_176763 ?auto_176767 ) ) ( ON-TABLE ?auto_176764 ) ( ON ?auto_176765 ?auto_176764 ) ( ON ?auto_176770 ?auto_176765 ) ( ON ?auto_176769 ?auto_176770 ) ( ON ?auto_176768 ?auto_176769 ) ( not ( = ?auto_176764 ?auto_176765 ) ) ( not ( = ?auto_176764 ?auto_176770 ) ) ( not ( = ?auto_176764 ?auto_176769 ) ) ( not ( = ?auto_176764 ?auto_176768 ) ) ( not ( = ?auto_176764 ?auto_176767 ) ) ( not ( = ?auto_176764 ?auto_176763 ) ) ( not ( = ?auto_176764 ?auto_176762 ) ) ( not ( = ?auto_176765 ?auto_176770 ) ) ( not ( = ?auto_176765 ?auto_176769 ) ) ( not ( = ?auto_176765 ?auto_176768 ) ) ( not ( = ?auto_176765 ?auto_176767 ) ) ( not ( = ?auto_176765 ?auto_176763 ) ) ( not ( = ?auto_176765 ?auto_176762 ) ) ( not ( = ?auto_176770 ?auto_176769 ) ) ( not ( = ?auto_176770 ?auto_176768 ) ) ( not ( = ?auto_176770 ?auto_176767 ) ) ( not ( = ?auto_176770 ?auto_176763 ) ) ( not ( = ?auto_176770 ?auto_176762 ) ) ( not ( = ?auto_176769 ?auto_176768 ) ) ( not ( = ?auto_176769 ?auto_176767 ) ) ( not ( = ?auto_176769 ?auto_176763 ) ) ( not ( = ?auto_176769 ?auto_176762 ) ) ( not ( = ?auto_176768 ?auto_176767 ) ) ( not ( = ?auto_176768 ?auto_176763 ) ) ( not ( = ?auto_176768 ?auto_176762 ) ) ( ON ?auto_176762 ?auto_176766 ) ( not ( = ?auto_176762 ?auto_176766 ) ) ( not ( = ?auto_176763 ?auto_176766 ) ) ( not ( = ?auto_176767 ?auto_176766 ) ) ( not ( = ?auto_176764 ?auto_176766 ) ) ( not ( = ?auto_176765 ?auto_176766 ) ) ( not ( = ?auto_176770 ?auto_176766 ) ) ( not ( = ?auto_176769 ?auto_176766 ) ) ( not ( = ?auto_176768 ?auto_176766 ) ) ( ON ?auto_176763 ?auto_176762 ) ( ON-TABLE ?auto_176766 ) ( CLEAR ?auto_176768 ) ( ON ?auto_176767 ?auto_176763 ) ( CLEAR ?auto_176767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176766 ?auto_176762 ?auto_176763 )
      ( MAKE-2PILE ?auto_176762 ?auto_176763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176771 - BLOCK
      ?auto_176772 - BLOCK
    )
    :vars
    (
      ?auto_176774 - BLOCK
      ?auto_176778 - BLOCK
      ?auto_176775 - BLOCK
      ?auto_176776 - BLOCK
      ?auto_176773 - BLOCK
      ?auto_176777 - BLOCK
      ?auto_176779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176771 ?auto_176772 ) ) ( not ( = ?auto_176771 ?auto_176774 ) ) ( not ( = ?auto_176772 ?auto_176774 ) ) ( ON-TABLE ?auto_176778 ) ( ON ?auto_176775 ?auto_176778 ) ( ON ?auto_176776 ?auto_176775 ) ( ON ?auto_176773 ?auto_176776 ) ( not ( = ?auto_176778 ?auto_176775 ) ) ( not ( = ?auto_176778 ?auto_176776 ) ) ( not ( = ?auto_176778 ?auto_176773 ) ) ( not ( = ?auto_176778 ?auto_176777 ) ) ( not ( = ?auto_176778 ?auto_176774 ) ) ( not ( = ?auto_176778 ?auto_176772 ) ) ( not ( = ?auto_176778 ?auto_176771 ) ) ( not ( = ?auto_176775 ?auto_176776 ) ) ( not ( = ?auto_176775 ?auto_176773 ) ) ( not ( = ?auto_176775 ?auto_176777 ) ) ( not ( = ?auto_176775 ?auto_176774 ) ) ( not ( = ?auto_176775 ?auto_176772 ) ) ( not ( = ?auto_176775 ?auto_176771 ) ) ( not ( = ?auto_176776 ?auto_176773 ) ) ( not ( = ?auto_176776 ?auto_176777 ) ) ( not ( = ?auto_176776 ?auto_176774 ) ) ( not ( = ?auto_176776 ?auto_176772 ) ) ( not ( = ?auto_176776 ?auto_176771 ) ) ( not ( = ?auto_176773 ?auto_176777 ) ) ( not ( = ?auto_176773 ?auto_176774 ) ) ( not ( = ?auto_176773 ?auto_176772 ) ) ( not ( = ?auto_176773 ?auto_176771 ) ) ( not ( = ?auto_176777 ?auto_176774 ) ) ( not ( = ?auto_176777 ?auto_176772 ) ) ( not ( = ?auto_176777 ?auto_176771 ) ) ( ON ?auto_176771 ?auto_176779 ) ( not ( = ?auto_176771 ?auto_176779 ) ) ( not ( = ?auto_176772 ?auto_176779 ) ) ( not ( = ?auto_176774 ?auto_176779 ) ) ( not ( = ?auto_176778 ?auto_176779 ) ) ( not ( = ?auto_176775 ?auto_176779 ) ) ( not ( = ?auto_176776 ?auto_176779 ) ) ( not ( = ?auto_176773 ?auto_176779 ) ) ( not ( = ?auto_176777 ?auto_176779 ) ) ( ON ?auto_176772 ?auto_176771 ) ( ON-TABLE ?auto_176779 ) ( ON ?auto_176774 ?auto_176772 ) ( CLEAR ?auto_176774 ) ( HOLDING ?auto_176777 ) ( CLEAR ?auto_176773 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176778 ?auto_176775 ?auto_176776 ?auto_176773 ?auto_176777 )
      ( MAKE-2PILE ?auto_176771 ?auto_176772 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176780 - BLOCK
      ?auto_176781 - BLOCK
    )
    :vars
    (
      ?auto_176783 - BLOCK
      ?auto_176786 - BLOCK
      ?auto_176784 - BLOCK
      ?auto_176787 - BLOCK
      ?auto_176788 - BLOCK
      ?auto_176785 - BLOCK
      ?auto_176782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176780 ?auto_176781 ) ) ( not ( = ?auto_176780 ?auto_176783 ) ) ( not ( = ?auto_176781 ?auto_176783 ) ) ( ON-TABLE ?auto_176786 ) ( ON ?auto_176784 ?auto_176786 ) ( ON ?auto_176787 ?auto_176784 ) ( ON ?auto_176788 ?auto_176787 ) ( not ( = ?auto_176786 ?auto_176784 ) ) ( not ( = ?auto_176786 ?auto_176787 ) ) ( not ( = ?auto_176786 ?auto_176788 ) ) ( not ( = ?auto_176786 ?auto_176785 ) ) ( not ( = ?auto_176786 ?auto_176783 ) ) ( not ( = ?auto_176786 ?auto_176781 ) ) ( not ( = ?auto_176786 ?auto_176780 ) ) ( not ( = ?auto_176784 ?auto_176787 ) ) ( not ( = ?auto_176784 ?auto_176788 ) ) ( not ( = ?auto_176784 ?auto_176785 ) ) ( not ( = ?auto_176784 ?auto_176783 ) ) ( not ( = ?auto_176784 ?auto_176781 ) ) ( not ( = ?auto_176784 ?auto_176780 ) ) ( not ( = ?auto_176787 ?auto_176788 ) ) ( not ( = ?auto_176787 ?auto_176785 ) ) ( not ( = ?auto_176787 ?auto_176783 ) ) ( not ( = ?auto_176787 ?auto_176781 ) ) ( not ( = ?auto_176787 ?auto_176780 ) ) ( not ( = ?auto_176788 ?auto_176785 ) ) ( not ( = ?auto_176788 ?auto_176783 ) ) ( not ( = ?auto_176788 ?auto_176781 ) ) ( not ( = ?auto_176788 ?auto_176780 ) ) ( not ( = ?auto_176785 ?auto_176783 ) ) ( not ( = ?auto_176785 ?auto_176781 ) ) ( not ( = ?auto_176785 ?auto_176780 ) ) ( ON ?auto_176780 ?auto_176782 ) ( not ( = ?auto_176780 ?auto_176782 ) ) ( not ( = ?auto_176781 ?auto_176782 ) ) ( not ( = ?auto_176783 ?auto_176782 ) ) ( not ( = ?auto_176786 ?auto_176782 ) ) ( not ( = ?auto_176784 ?auto_176782 ) ) ( not ( = ?auto_176787 ?auto_176782 ) ) ( not ( = ?auto_176788 ?auto_176782 ) ) ( not ( = ?auto_176785 ?auto_176782 ) ) ( ON ?auto_176781 ?auto_176780 ) ( ON-TABLE ?auto_176782 ) ( ON ?auto_176783 ?auto_176781 ) ( CLEAR ?auto_176788 ) ( ON ?auto_176785 ?auto_176783 ) ( CLEAR ?auto_176785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176782 ?auto_176780 ?auto_176781 ?auto_176783 )
      ( MAKE-2PILE ?auto_176780 ?auto_176781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176789 - BLOCK
      ?auto_176790 - BLOCK
    )
    :vars
    (
      ?auto_176792 - BLOCK
      ?auto_176793 - BLOCK
      ?auto_176791 - BLOCK
      ?auto_176795 - BLOCK
      ?auto_176796 - BLOCK
      ?auto_176794 - BLOCK
      ?auto_176797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176789 ?auto_176790 ) ) ( not ( = ?auto_176789 ?auto_176792 ) ) ( not ( = ?auto_176790 ?auto_176792 ) ) ( ON-TABLE ?auto_176793 ) ( ON ?auto_176791 ?auto_176793 ) ( ON ?auto_176795 ?auto_176791 ) ( not ( = ?auto_176793 ?auto_176791 ) ) ( not ( = ?auto_176793 ?auto_176795 ) ) ( not ( = ?auto_176793 ?auto_176796 ) ) ( not ( = ?auto_176793 ?auto_176794 ) ) ( not ( = ?auto_176793 ?auto_176792 ) ) ( not ( = ?auto_176793 ?auto_176790 ) ) ( not ( = ?auto_176793 ?auto_176789 ) ) ( not ( = ?auto_176791 ?auto_176795 ) ) ( not ( = ?auto_176791 ?auto_176796 ) ) ( not ( = ?auto_176791 ?auto_176794 ) ) ( not ( = ?auto_176791 ?auto_176792 ) ) ( not ( = ?auto_176791 ?auto_176790 ) ) ( not ( = ?auto_176791 ?auto_176789 ) ) ( not ( = ?auto_176795 ?auto_176796 ) ) ( not ( = ?auto_176795 ?auto_176794 ) ) ( not ( = ?auto_176795 ?auto_176792 ) ) ( not ( = ?auto_176795 ?auto_176790 ) ) ( not ( = ?auto_176795 ?auto_176789 ) ) ( not ( = ?auto_176796 ?auto_176794 ) ) ( not ( = ?auto_176796 ?auto_176792 ) ) ( not ( = ?auto_176796 ?auto_176790 ) ) ( not ( = ?auto_176796 ?auto_176789 ) ) ( not ( = ?auto_176794 ?auto_176792 ) ) ( not ( = ?auto_176794 ?auto_176790 ) ) ( not ( = ?auto_176794 ?auto_176789 ) ) ( ON ?auto_176789 ?auto_176797 ) ( not ( = ?auto_176789 ?auto_176797 ) ) ( not ( = ?auto_176790 ?auto_176797 ) ) ( not ( = ?auto_176792 ?auto_176797 ) ) ( not ( = ?auto_176793 ?auto_176797 ) ) ( not ( = ?auto_176791 ?auto_176797 ) ) ( not ( = ?auto_176795 ?auto_176797 ) ) ( not ( = ?auto_176796 ?auto_176797 ) ) ( not ( = ?auto_176794 ?auto_176797 ) ) ( ON ?auto_176790 ?auto_176789 ) ( ON-TABLE ?auto_176797 ) ( ON ?auto_176792 ?auto_176790 ) ( ON ?auto_176794 ?auto_176792 ) ( CLEAR ?auto_176794 ) ( HOLDING ?auto_176796 ) ( CLEAR ?auto_176795 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176793 ?auto_176791 ?auto_176795 ?auto_176796 )
      ( MAKE-2PILE ?auto_176789 ?auto_176790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176798 - BLOCK
      ?auto_176799 - BLOCK
    )
    :vars
    (
      ?auto_176804 - BLOCK
      ?auto_176801 - BLOCK
      ?auto_176800 - BLOCK
      ?auto_176803 - BLOCK
      ?auto_176806 - BLOCK
      ?auto_176805 - BLOCK
      ?auto_176802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176798 ?auto_176799 ) ) ( not ( = ?auto_176798 ?auto_176804 ) ) ( not ( = ?auto_176799 ?auto_176804 ) ) ( ON-TABLE ?auto_176801 ) ( ON ?auto_176800 ?auto_176801 ) ( ON ?auto_176803 ?auto_176800 ) ( not ( = ?auto_176801 ?auto_176800 ) ) ( not ( = ?auto_176801 ?auto_176803 ) ) ( not ( = ?auto_176801 ?auto_176806 ) ) ( not ( = ?auto_176801 ?auto_176805 ) ) ( not ( = ?auto_176801 ?auto_176804 ) ) ( not ( = ?auto_176801 ?auto_176799 ) ) ( not ( = ?auto_176801 ?auto_176798 ) ) ( not ( = ?auto_176800 ?auto_176803 ) ) ( not ( = ?auto_176800 ?auto_176806 ) ) ( not ( = ?auto_176800 ?auto_176805 ) ) ( not ( = ?auto_176800 ?auto_176804 ) ) ( not ( = ?auto_176800 ?auto_176799 ) ) ( not ( = ?auto_176800 ?auto_176798 ) ) ( not ( = ?auto_176803 ?auto_176806 ) ) ( not ( = ?auto_176803 ?auto_176805 ) ) ( not ( = ?auto_176803 ?auto_176804 ) ) ( not ( = ?auto_176803 ?auto_176799 ) ) ( not ( = ?auto_176803 ?auto_176798 ) ) ( not ( = ?auto_176806 ?auto_176805 ) ) ( not ( = ?auto_176806 ?auto_176804 ) ) ( not ( = ?auto_176806 ?auto_176799 ) ) ( not ( = ?auto_176806 ?auto_176798 ) ) ( not ( = ?auto_176805 ?auto_176804 ) ) ( not ( = ?auto_176805 ?auto_176799 ) ) ( not ( = ?auto_176805 ?auto_176798 ) ) ( ON ?auto_176798 ?auto_176802 ) ( not ( = ?auto_176798 ?auto_176802 ) ) ( not ( = ?auto_176799 ?auto_176802 ) ) ( not ( = ?auto_176804 ?auto_176802 ) ) ( not ( = ?auto_176801 ?auto_176802 ) ) ( not ( = ?auto_176800 ?auto_176802 ) ) ( not ( = ?auto_176803 ?auto_176802 ) ) ( not ( = ?auto_176806 ?auto_176802 ) ) ( not ( = ?auto_176805 ?auto_176802 ) ) ( ON ?auto_176799 ?auto_176798 ) ( ON-TABLE ?auto_176802 ) ( ON ?auto_176804 ?auto_176799 ) ( ON ?auto_176805 ?auto_176804 ) ( CLEAR ?auto_176803 ) ( ON ?auto_176806 ?auto_176805 ) ( CLEAR ?auto_176806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176802 ?auto_176798 ?auto_176799 ?auto_176804 ?auto_176805 )
      ( MAKE-2PILE ?auto_176798 ?auto_176799 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176807 - BLOCK
      ?auto_176808 - BLOCK
    )
    :vars
    (
      ?auto_176815 - BLOCK
      ?auto_176814 - BLOCK
      ?auto_176810 - BLOCK
      ?auto_176809 - BLOCK
      ?auto_176812 - BLOCK
      ?auto_176811 - BLOCK
      ?auto_176813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176807 ?auto_176808 ) ) ( not ( = ?auto_176807 ?auto_176815 ) ) ( not ( = ?auto_176808 ?auto_176815 ) ) ( ON-TABLE ?auto_176814 ) ( ON ?auto_176810 ?auto_176814 ) ( not ( = ?auto_176814 ?auto_176810 ) ) ( not ( = ?auto_176814 ?auto_176809 ) ) ( not ( = ?auto_176814 ?auto_176812 ) ) ( not ( = ?auto_176814 ?auto_176811 ) ) ( not ( = ?auto_176814 ?auto_176815 ) ) ( not ( = ?auto_176814 ?auto_176808 ) ) ( not ( = ?auto_176814 ?auto_176807 ) ) ( not ( = ?auto_176810 ?auto_176809 ) ) ( not ( = ?auto_176810 ?auto_176812 ) ) ( not ( = ?auto_176810 ?auto_176811 ) ) ( not ( = ?auto_176810 ?auto_176815 ) ) ( not ( = ?auto_176810 ?auto_176808 ) ) ( not ( = ?auto_176810 ?auto_176807 ) ) ( not ( = ?auto_176809 ?auto_176812 ) ) ( not ( = ?auto_176809 ?auto_176811 ) ) ( not ( = ?auto_176809 ?auto_176815 ) ) ( not ( = ?auto_176809 ?auto_176808 ) ) ( not ( = ?auto_176809 ?auto_176807 ) ) ( not ( = ?auto_176812 ?auto_176811 ) ) ( not ( = ?auto_176812 ?auto_176815 ) ) ( not ( = ?auto_176812 ?auto_176808 ) ) ( not ( = ?auto_176812 ?auto_176807 ) ) ( not ( = ?auto_176811 ?auto_176815 ) ) ( not ( = ?auto_176811 ?auto_176808 ) ) ( not ( = ?auto_176811 ?auto_176807 ) ) ( ON ?auto_176807 ?auto_176813 ) ( not ( = ?auto_176807 ?auto_176813 ) ) ( not ( = ?auto_176808 ?auto_176813 ) ) ( not ( = ?auto_176815 ?auto_176813 ) ) ( not ( = ?auto_176814 ?auto_176813 ) ) ( not ( = ?auto_176810 ?auto_176813 ) ) ( not ( = ?auto_176809 ?auto_176813 ) ) ( not ( = ?auto_176812 ?auto_176813 ) ) ( not ( = ?auto_176811 ?auto_176813 ) ) ( ON ?auto_176808 ?auto_176807 ) ( ON-TABLE ?auto_176813 ) ( ON ?auto_176815 ?auto_176808 ) ( ON ?auto_176811 ?auto_176815 ) ( ON ?auto_176812 ?auto_176811 ) ( CLEAR ?auto_176812 ) ( HOLDING ?auto_176809 ) ( CLEAR ?auto_176810 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176814 ?auto_176810 ?auto_176809 )
      ( MAKE-2PILE ?auto_176807 ?auto_176808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176816 - BLOCK
      ?auto_176817 - BLOCK
    )
    :vars
    (
      ?auto_176819 - BLOCK
      ?auto_176818 - BLOCK
      ?auto_176820 - BLOCK
      ?auto_176822 - BLOCK
      ?auto_176821 - BLOCK
      ?auto_176824 - BLOCK
      ?auto_176823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176816 ?auto_176817 ) ) ( not ( = ?auto_176816 ?auto_176819 ) ) ( not ( = ?auto_176817 ?auto_176819 ) ) ( ON-TABLE ?auto_176818 ) ( ON ?auto_176820 ?auto_176818 ) ( not ( = ?auto_176818 ?auto_176820 ) ) ( not ( = ?auto_176818 ?auto_176822 ) ) ( not ( = ?auto_176818 ?auto_176821 ) ) ( not ( = ?auto_176818 ?auto_176824 ) ) ( not ( = ?auto_176818 ?auto_176819 ) ) ( not ( = ?auto_176818 ?auto_176817 ) ) ( not ( = ?auto_176818 ?auto_176816 ) ) ( not ( = ?auto_176820 ?auto_176822 ) ) ( not ( = ?auto_176820 ?auto_176821 ) ) ( not ( = ?auto_176820 ?auto_176824 ) ) ( not ( = ?auto_176820 ?auto_176819 ) ) ( not ( = ?auto_176820 ?auto_176817 ) ) ( not ( = ?auto_176820 ?auto_176816 ) ) ( not ( = ?auto_176822 ?auto_176821 ) ) ( not ( = ?auto_176822 ?auto_176824 ) ) ( not ( = ?auto_176822 ?auto_176819 ) ) ( not ( = ?auto_176822 ?auto_176817 ) ) ( not ( = ?auto_176822 ?auto_176816 ) ) ( not ( = ?auto_176821 ?auto_176824 ) ) ( not ( = ?auto_176821 ?auto_176819 ) ) ( not ( = ?auto_176821 ?auto_176817 ) ) ( not ( = ?auto_176821 ?auto_176816 ) ) ( not ( = ?auto_176824 ?auto_176819 ) ) ( not ( = ?auto_176824 ?auto_176817 ) ) ( not ( = ?auto_176824 ?auto_176816 ) ) ( ON ?auto_176816 ?auto_176823 ) ( not ( = ?auto_176816 ?auto_176823 ) ) ( not ( = ?auto_176817 ?auto_176823 ) ) ( not ( = ?auto_176819 ?auto_176823 ) ) ( not ( = ?auto_176818 ?auto_176823 ) ) ( not ( = ?auto_176820 ?auto_176823 ) ) ( not ( = ?auto_176822 ?auto_176823 ) ) ( not ( = ?auto_176821 ?auto_176823 ) ) ( not ( = ?auto_176824 ?auto_176823 ) ) ( ON ?auto_176817 ?auto_176816 ) ( ON-TABLE ?auto_176823 ) ( ON ?auto_176819 ?auto_176817 ) ( ON ?auto_176824 ?auto_176819 ) ( ON ?auto_176821 ?auto_176824 ) ( CLEAR ?auto_176820 ) ( ON ?auto_176822 ?auto_176821 ) ( CLEAR ?auto_176822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176823 ?auto_176816 ?auto_176817 ?auto_176819 ?auto_176824 ?auto_176821 )
      ( MAKE-2PILE ?auto_176816 ?auto_176817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176825 - BLOCK
      ?auto_176826 - BLOCK
    )
    :vars
    (
      ?auto_176827 - BLOCK
      ?auto_176833 - BLOCK
      ?auto_176831 - BLOCK
      ?auto_176832 - BLOCK
      ?auto_176829 - BLOCK
      ?auto_176830 - BLOCK
      ?auto_176828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176825 ?auto_176826 ) ) ( not ( = ?auto_176825 ?auto_176827 ) ) ( not ( = ?auto_176826 ?auto_176827 ) ) ( ON-TABLE ?auto_176833 ) ( not ( = ?auto_176833 ?auto_176831 ) ) ( not ( = ?auto_176833 ?auto_176832 ) ) ( not ( = ?auto_176833 ?auto_176829 ) ) ( not ( = ?auto_176833 ?auto_176830 ) ) ( not ( = ?auto_176833 ?auto_176827 ) ) ( not ( = ?auto_176833 ?auto_176826 ) ) ( not ( = ?auto_176833 ?auto_176825 ) ) ( not ( = ?auto_176831 ?auto_176832 ) ) ( not ( = ?auto_176831 ?auto_176829 ) ) ( not ( = ?auto_176831 ?auto_176830 ) ) ( not ( = ?auto_176831 ?auto_176827 ) ) ( not ( = ?auto_176831 ?auto_176826 ) ) ( not ( = ?auto_176831 ?auto_176825 ) ) ( not ( = ?auto_176832 ?auto_176829 ) ) ( not ( = ?auto_176832 ?auto_176830 ) ) ( not ( = ?auto_176832 ?auto_176827 ) ) ( not ( = ?auto_176832 ?auto_176826 ) ) ( not ( = ?auto_176832 ?auto_176825 ) ) ( not ( = ?auto_176829 ?auto_176830 ) ) ( not ( = ?auto_176829 ?auto_176827 ) ) ( not ( = ?auto_176829 ?auto_176826 ) ) ( not ( = ?auto_176829 ?auto_176825 ) ) ( not ( = ?auto_176830 ?auto_176827 ) ) ( not ( = ?auto_176830 ?auto_176826 ) ) ( not ( = ?auto_176830 ?auto_176825 ) ) ( ON ?auto_176825 ?auto_176828 ) ( not ( = ?auto_176825 ?auto_176828 ) ) ( not ( = ?auto_176826 ?auto_176828 ) ) ( not ( = ?auto_176827 ?auto_176828 ) ) ( not ( = ?auto_176833 ?auto_176828 ) ) ( not ( = ?auto_176831 ?auto_176828 ) ) ( not ( = ?auto_176832 ?auto_176828 ) ) ( not ( = ?auto_176829 ?auto_176828 ) ) ( not ( = ?auto_176830 ?auto_176828 ) ) ( ON ?auto_176826 ?auto_176825 ) ( ON-TABLE ?auto_176828 ) ( ON ?auto_176827 ?auto_176826 ) ( ON ?auto_176830 ?auto_176827 ) ( ON ?auto_176829 ?auto_176830 ) ( ON ?auto_176832 ?auto_176829 ) ( CLEAR ?auto_176832 ) ( HOLDING ?auto_176831 ) ( CLEAR ?auto_176833 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176833 ?auto_176831 )
      ( MAKE-2PILE ?auto_176825 ?auto_176826 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176834 - BLOCK
      ?auto_176835 - BLOCK
    )
    :vars
    (
      ?auto_176840 - BLOCK
      ?auto_176841 - BLOCK
      ?auto_176838 - BLOCK
      ?auto_176837 - BLOCK
      ?auto_176839 - BLOCK
      ?auto_176842 - BLOCK
      ?auto_176836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176834 ?auto_176835 ) ) ( not ( = ?auto_176834 ?auto_176840 ) ) ( not ( = ?auto_176835 ?auto_176840 ) ) ( ON-TABLE ?auto_176841 ) ( not ( = ?auto_176841 ?auto_176838 ) ) ( not ( = ?auto_176841 ?auto_176837 ) ) ( not ( = ?auto_176841 ?auto_176839 ) ) ( not ( = ?auto_176841 ?auto_176842 ) ) ( not ( = ?auto_176841 ?auto_176840 ) ) ( not ( = ?auto_176841 ?auto_176835 ) ) ( not ( = ?auto_176841 ?auto_176834 ) ) ( not ( = ?auto_176838 ?auto_176837 ) ) ( not ( = ?auto_176838 ?auto_176839 ) ) ( not ( = ?auto_176838 ?auto_176842 ) ) ( not ( = ?auto_176838 ?auto_176840 ) ) ( not ( = ?auto_176838 ?auto_176835 ) ) ( not ( = ?auto_176838 ?auto_176834 ) ) ( not ( = ?auto_176837 ?auto_176839 ) ) ( not ( = ?auto_176837 ?auto_176842 ) ) ( not ( = ?auto_176837 ?auto_176840 ) ) ( not ( = ?auto_176837 ?auto_176835 ) ) ( not ( = ?auto_176837 ?auto_176834 ) ) ( not ( = ?auto_176839 ?auto_176842 ) ) ( not ( = ?auto_176839 ?auto_176840 ) ) ( not ( = ?auto_176839 ?auto_176835 ) ) ( not ( = ?auto_176839 ?auto_176834 ) ) ( not ( = ?auto_176842 ?auto_176840 ) ) ( not ( = ?auto_176842 ?auto_176835 ) ) ( not ( = ?auto_176842 ?auto_176834 ) ) ( ON ?auto_176834 ?auto_176836 ) ( not ( = ?auto_176834 ?auto_176836 ) ) ( not ( = ?auto_176835 ?auto_176836 ) ) ( not ( = ?auto_176840 ?auto_176836 ) ) ( not ( = ?auto_176841 ?auto_176836 ) ) ( not ( = ?auto_176838 ?auto_176836 ) ) ( not ( = ?auto_176837 ?auto_176836 ) ) ( not ( = ?auto_176839 ?auto_176836 ) ) ( not ( = ?auto_176842 ?auto_176836 ) ) ( ON ?auto_176835 ?auto_176834 ) ( ON-TABLE ?auto_176836 ) ( ON ?auto_176840 ?auto_176835 ) ( ON ?auto_176842 ?auto_176840 ) ( ON ?auto_176839 ?auto_176842 ) ( ON ?auto_176837 ?auto_176839 ) ( CLEAR ?auto_176841 ) ( ON ?auto_176838 ?auto_176837 ) ( CLEAR ?auto_176838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176836 ?auto_176834 ?auto_176835 ?auto_176840 ?auto_176842 ?auto_176839 ?auto_176837 )
      ( MAKE-2PILE ?auto_176834 ?auto_176835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176843 - BLOCK
      ?auto_176844 - BLOCK
    )
    :vars
    (
      ?auto_176849 - BLOCK
      ?auto_176847 - BLOCK
      ?auto_176851 - BLOCK
      ?auto_176848 - BLOCK
      ?auto_176845 - BLOCK
      ?auto_176846 - BLOCK
      ?auto_176850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176843 ?auto_176844 ) ) ( not ( = ?auto_176843 ?auto_176849 ) ) ( not ( = ?auto_176844 ?auto_176849 ) ) ( not ( = ?auto_176847 ?auto_176851 ) ) ( not ( = ?auto_176847 ?auto_176848 ) ) ( not ( = ?auto_176847 ?auto_176845 ) ) ( not ( = ?auto_176847 ?auto_176846 ) ) ( not ( = ?auto_176847 ?auto_176849 ) ) ( not ( = ?auto_176847 ?auto_176844 ) ) ( not ( = ?auto_176847 ?auto_176843 ) ) ( not ( = ?auto_176851 ?auto_176848 ) ) ( not ( = ?auto_176851 ?auto_176845 ) ) ( not ( = ?auto_176851 ?auto_176846 ) ) ( not ( = ?auto_176851 ?auto_176849 ) ) ( not ( = ?auto_176851 ?auto_176844 ) ) ( not ( = ?auto_176851 ?auto_176843 ) ) ( not ( = ?auto_176848 ?auto_176845 ) ) ( not ( = ?auto_176848 ?auto_176846 ) ) ( not ( = ?auto_176848 ?auto_176849 ) ) ( not ( = ?auto_176848 ?auto_176844 ) ) ( not ( = ?auto_176848 ?auto_176843 ) ) ( not ( = ?auto_176845 ?auto_176846 ) ) ( not ( = ?auto_176845 ?auto_176849 ) ) ( not ( = ?auto_176845 ?auto_176844 ) ) ( not ( = ?auto_176845 ?auto_176843 ) ) ( not ( = ?auto_176846 ?auto_176849 ) ) ( not ( = ?auto_176846 ?auto_176844 ) ) ( not ( = ?auto_176846 ?auto_176843 ) ) ( ON ?auto_176843 ?auto_176850 ) ( not ( = ?auto_176843 ?auto_176850 ) ) ( not ( = ?auto_176844 ?auto_176850 ) ) ( not ( = ?auto_176849 ?auto_176850 ) ) ( not ( = ?auto_176847 ?auto_176850 ) ) ( not ( = ?auto_176851 ?auto_176850 ) ) ( not ( = ?auto_176848 ?auto_176850 ) ) ( not ( = ?auto_176845 ?auto_176850 ) ) ( not ( = ?auto_176846 ?auto_176850 ) ) ( ON ?auto_176844 ?auto_176843 ) ( ON-TABLE ?auto_176850 ) ( ON ?auto_176849 ?auto_176844 ) ( ON ?auto_176846 ?auto_176849 ) ( ON ?auto_176845 ?auto_176846 ) ( ON ?auto_176848 ?auto_176845 ) ( ON ?auto_176851 ?auto_176848 ) ( CLEAR ?auto_176851 ) ( HOLDING ?auto_176847 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176847 )
      ( MAKE-2PILE ?auto_176843 ?auto_176844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_176852 - BLOCK
      ?auto_176853 - BLOCK
    )
    :vars
    (
      ?auto_176854 - BLOCK
      ?auto_176857 - BLOCK
      ?auto_176860 - BLOCK
      ?auto_176859 - BLOCK
      ?auto_176858 - BLOCK
      ?auto_176856 - BLOCK
      ?auto_176855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_176852 ?auto_176853 ) ) ( not ( = ?auto_176852 ?auto_176854 ) ) ( not ( = ?auto_176853 ?auto_176854 ) ) ( not ( = ?auto_176857 ?auto_176860 ) ) ( not ( = ?auto_176857 ?auto_176859 ) ) ( not ( = ?auto_176857 ?auto_176858 ) ) ( not ( = ?auto_176857 ?auto_176856 ) ) ( not ( = ?auto_176857 ?auto_176854 ) ) ( not ( = ?auto_176857 ?auto_176853 ) ) ( not ( = ?auto_176857 ?auto_176852 ) ) ( not ( = ?auto_176860 ?auto_176859 ) ) ( not ( = ?auto_176860 ?auto_176858 ) ) ( not ( = ?auto_176860 ?auto_176856 ) ) ( not ( = ?auto_176860 ?auto_176854 ) ) ( not ( = ?auto_176860 ?auto_176853 ) ) ( not ( = ?auto_176860 ?auto_176852 ) ) ( not ( = ?auto_176859 ?auto_176858 ) ) ( not ( = ?auto_176859 ?auto_176856 ) ) ( not ( = ?auto_176859 ?auto_176854 ) ) ( not ( = ?auto_176859 ?auto_176853 ) ) ( not ( = ?auto_176859 ?auto_176852 ) ) ( not ( = ?auto_176858 ?auto_176856 ) ) ( not ( = ?auto_176858 ?auto_176854 ) ) ( not ( = ?auto_176858 ?auto_176853 ) ) ( not ( = ?auto_176858 ?auto_176852 ) ) ( not ( = ?auto_176856 ?auto_176854 ) ) ( not ( = ?auto_176856 ?auto_176853 ) ) ( not ( = ?auto_176856 ?auto_176852 ) ) ( ON ?auto_176852 ?auto_176855 ) ( not ( = ?auto_176852 ?auto_176855 ) ) ( not ( = ?auto_176853 ?auto_176855 ) ) ( not ( = ?auto_176854 ?auto_176855 ) ) ( not ( = ?auto_176857 ?auto_176855 ) ) ( not ( = ?auto_176860 ?auto_176855 ) ) ( not ( = ?auto_176859 ?auto_176855 ) ) ( not ( = ?auto_176858 ?auto_176855 ) ) ( not ( = ?auto_176856 ?auto_176855 ) ) ( ON ?auto_176853 ?auto_176852 ) ( ON-TABLE ?auto_176855 ) ( ON ?auto_176854 ?auto_176853 ) ( ON ?auto_176856 ?auto_176854 ) ( ON ?auto_176858 ?auto_176856 ) ( ON ?auto_176859 ?auto_176858 ) ( ON ?auto_176860 ?auto_176859 ) ( ON ?auto_176857 ?auto_176860 ) ( CLEAR ?auto_176857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176855 ?auto_176852 ?auto_176853 ?auto_176854 ?auto_176856 ?auto_176858 ?auto_176859 ?auto_176860 )
      ( MAKE-2PILE ?auto_176852 ?auto_176853 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176866 - BLOCK
      ?auto_176867 - BLOCK
      ?auto_176868 - BLOCK
      ?auto_176869 - BLOCK
      ?auto_176870 - BLOCK
    )
    :vars
    (
      ?auto_176871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176871 ?auto_176870 ) ( CLEAR ?auto_176871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176866 ) ( ON ?auto_176867 ?auto_176866 ) ( ON ?auto_176868 ?auto_176867 ) ( ON ?auto_176869 ?auto_176868 ) ( ON ?auto_176870 ?auto_176869 ) ( not ( = ?auto_176866 ?auto_176867 ) ) ( not ( = ?auto_176866 ?auto_176868 ) ) ( not ( = ?auto_176866 ?auto_176869 ) ) ( not ( = ?auto_176866 ?auto_176870 ) ) ( not ( = ?auto_176866 ?auto_176871 ) ) ( not ( = ?auto_176867 ?auto_176868 ) ) ( not ( = ?auto_176867 ?auto_176869 ) ) ( not ( = ?auto_176867 ?auto_176870 ) ) ( not ( = ?auto_176867 ?auto_176871 ) ) ( not ( = ?auto_176868 ?auto_176869 ) ) ( not ( = ?auto_176868 ?auto_176870 ) ) ( not ( = ?auto_176868 ?auto_176871 ) ) ( not ( = ?auto_176869 ?auto_176870 ) ) ( not ( = ?auto_176869 ?auto_176871 ) ) ( not ( = ?auto_176870 ?auto_176871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176871 ?auto_176870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176872 - BLOCK
      ?auto_176873 - BLOCK
      ?auto_176874 - BLOCK
      ?auto_176875 - BLOCK
      ?auto_176876 - BLOCK
    )
    :vars
    (
      ?auto_176877 - BLOCK
      ?auto_176878 - BLOCK
      ?auto_176879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176877 ?auto_176876 ) ( CLEAR ?auto_176877 ) ( ON-TABLE ?auto_176872 ) ( ON ?auto_176873 ?auto_176872 ) ( ON ?auto_176874 ?auto_176873 ) ( ON ?auto_176875 ?auto_176874 ) ( ON ?auto_176876 ?auto_176875 ) ( not ( = ?auto_176872 ?auto_176873 ) ) ( not ( = ?auto_176872 ?auto_176874 ) ) ( not ( = ?auto_176872 ?auto_176875 ) ) ( not ( = ?auto_176872 ?auto_176876 ) ) ( not ( = ?auto_176872 ?auto_176877 ) ) ( not ( = ?auto_176873 ?auto_176874 ) ) ( not ( = ?auto_176873 ?auto_176875 ) ) ( not ( = ?auto_176873 ?auto_176876 ) ) ( not ( = ?auto_176873 ?auto_176877 ) ) ( not ( = ?auto_176874 ?auto_176875 ) ) ( not ( = ?auto_176874 ?auto_176876 ) ) ( not ( = ?auto_176874 ?auto_176877 ) ) ( not ( = ?auto_176875 ?auto_176876 ) ) ( not ( = ?auto_176875 ?auto_176877 ) ) ( not ( = ?auto_176876 ?auto_176877 ) ) ( HOLDING ?auto_176878 ) ( CLEAR ?auto_176879 ) ( not ( = ?auto_176872 ?auto_176878 ) ) ( not ( = ?auto_176872 ?auto_176879 ) ) ( not ( = ?auto_176873 ?auto_176878 ) ) ( not ( = ?auto_176873 ?auto_176879 ) ) ( not ( = ?auto_176874 ?auto_176878 ) ) ( not ( = ?auto_176874 ?auto_176879 ) ) ( not ( = ?auto_176875 ?auto_176878 ) ) ( not ( = ?auto_176875 ?auto_176879 ) ) ( not ( = ?auto_176876 ?auto_176878 ) ) ( not ( = ?auto_176876 ?auto_176879 ) ) ( not ( = ?auto_176877 ?auto_176878 ) ) ( not ( = ?auto_176877 ?auto_176879 ) ) ( not ( = ?auto_176878 ?auto_176879 ) ) )
    :subtasks
    ( ( !STACK ?auto_176878 ?auto_176879 )
      ( MAKE-5PILE ?auto_176872 ?auto_176873 ?auto_176874 ?auto_176875 ?auto_176876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176880 - BLOCK
      ?auto_176881 - BLOCK
      ?auto_176882 - BLOCK
      ?auto_176883 - BLOCK
      ?auto_176884 - BLOCK
    )
    :vars
    (
      ?auto_176887 - BLOCK
      ?auto_176885 - BLOCK
      ?auto_176886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176887 ?auto_176884 ) ( ON-TABLE ?auto_176880 ) ( ON ?auto_176881 ?auto_176880 ) ( ON ?auto_176882 ?auto_176881 ) ( ON ?auto_176883 ?auto_176882 ) ( ON ?auto_176884 ?auto_176883 ) ( not ( = ?auto_176880 ?auto_176881 ) ) ( not ( = ?auto_176880 ?auto_176882 ) ) ( not ( = ?auto_176880 ?auto_176883 ) ) ( not ( = ?auto_176880 ?auto_176884 ) ) ( not ( = ?auto_176880 ?auto_176887 ) ) ( not ( = ?auto_176881 ?auto_176882 ) ) ( not ( = ?auto_176881 ?auto_176883 ) ) ( not ( = ?auto_176881 ?auto_176884 ) ) ( not ( = ?auto_176881 ?auto_176887 ) ) ( not ( = ?auto_176882 ?auto_176883 ) ) ( not ( = ?auto_176882 ?auto_176884 ) ) ( not ( = ?auto_176882 ?auto_176887 ) ) ( not ( = ?auto_176883 ?auto_176884 ) ) ( not ( = ?auto_176883 ?auto_176887 ) ) ( not ( = ?auto_176884 ?auto_176887 ) ) ( CLEAR ?auto_176885 ) ( not ( = ?auto_176880 ?auto_176886 ) ) ( not ( = ?auto_176880 ?auto_176885 ) ) ( not ( = ?auto_176881 ?auto_176886 ) ) ( not ( = ?auto_176881 ?auto_176885 ) ) ( not ( = ?auto_176882 ?auto_176886 ) ) ( not ( = ?auto_176882 ?auto_176885 ) ) ( not ( = ?auto_176883 ?auto_176886 ) ) ( not ( = ?auto_176883 ?auto_176885 ) ) ( not ( = ?auto_176884 ?auto_176886 ) ) ( not ( = ?auto_176884 ?auto_176885 ) ) ( not ( = ?auto_176887 ?auto_176886 ) ) ( not ( = ?auto_176887 ?auto_176885 ) ) ( not ( = ?auto_176886 ?auto_176885 ) ) ( ON ?auto_176886 ?auto_176887 ) ( CLEAR ?auto_176886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176880 ?auto_176881 ?auto_176882 ?auto_176883 ?auto_176884 ?auto_176887 )
      ( MAKE-5PILE ?auto_176880 ?auto_176881 ?auto_176882 ?auto_176883 ?auto_176884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176888 - BLOCK
      ?auto_176889 - BLOCK
      ?auto_176890 - BLOCK
      ?auto_176891 - BLOCK
      ?auto_176892 - BLOCK
    )
    :vars
    (
      ?auto_176893 - BLOCK
      ?auto_176894 - BLOCK
      ?auto_176895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176893 ?auto_176892 ) ( ON-TABLE ?auto_176888 ) ( ON ?auto_176889 ?auto_176888 ) ( ON ?auto_176890 ?auto_176889 ) ( ON ?auto_176891 ?auto_176890 ) ( ON ?auto_176892 ?auto_176891 ) ( not ( = ?auto_176888 ?auto_176889 ) ) ( not ( = ?auto_176888 ?auto_176890 ) ) ( not ( = ?auto_176888 ?auto_176891 ) ) ( not ( = ?auto_176888 ?auto_176892 ) ) ( not ( = ?auto_176888 ?auto_176893 ) ) ( not ( = ?auto_176889 ?auto_176890 ) ) ( not ( = ?auto_176889 ?auto_176891 ) ) ( not ( = ?auto_176889 ?auto_176892 ) ) ( not ( = ?auto_176889 ?auto_176893 ) ) ( not ( = ?auto_176890 ?auto_176891 ) ) ( not ( = ?auto_176890 ?auto_176892 ) ) ( not ( = ?auto_176890 ?auto_176893 ) ) ( not ( = ?auto_176891 ?auto_176892 ) ) ( not ( = ?auto_176891 ?auto_176893 ) ) ( not ( = ?auto_176892 ?auto_176893 ) ) ( not ( = ?auto_176888 ?auto_176894 ) ) ( not ( = ?auto_176888 ?auto_176895 ) ) ( not ( = ?auto_176889 ?auto_176894 ) ) ( not ( = ?auto_176889 ?auto_176895 ) ) ( not ( = ?auto_176890 ?auto_176894 ) ) ( not ( = ?auto_176890 ?auto_176895 ) ) ( not ( = ?auto_176891 ?auto_176894 ) ) ( not ( = ?auto_176891 ?auto_176895 ) ) ( not ( = ?auto_176892 ?auto_176894 ) ) ( not ( = ?auto_176892 ?auto_176895 ) ) ( not ( = ?auto_176893 ?auto_176894 ) ) ( not ( = ?auto_176893 ?auto_176895 ) ) ( not ( = ?auto_176894 ?auto_176895 ) ) ( ON ?auto_176894 ?auto_176893 ) ( CLEAR ?auto_176894 ) ( HOLDING ?auto_176895 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176895 )
      ( MAKE-5PILE ?auto_176888 ?auto_176889 ?auto_176890 ?auto_176891 ?auto_176892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176896 - BLOCK
      ?auto_176897 - BLOCK
      ?auto_176898 - BLOCK
      ?auto_176899 - BLOCK
      ?auto_176900 - BLOCK
    )
    :vars
    (
      ?auto_176903 - BLOCK
      ?auto_176901 - BLOCK
      ?auto_176902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176903 ?auto_176900 ) ( ON-TABLE ?auto_176896 ) ( ON ?auto_176897 ?auto_176896 ) ( ON ?auto_176898 ?auto_176897 ) ( ON ?auto_176899 ?auto_176898 ) ( ON ?auto_176900 ?auto_176899 ) ( not ( = ?auto_176896 ?auto_176897 ) ) ( not ( = ?auto_176896 ?auto_176898 ) ) ( not ( = ?auto_176896 ?auto_176899 ) ) ( not ( = ?auto_176896 ?auto_176900 ) ) ( not ( = ?auto_176896 ?auto_176903 ) ) ( not ( = ?auto_176897 ?auto_176898 ) ) ( not ( = ?auto_176897 ?auto_176899 ) ) ( not ( = ?auto_176897 ?auto_176900 ) ) ( not ( = ?auto_176897 ?auto_176903 ) ) ( not ( = ?auto_176898 ?auto_176899 ) ) ( not ( = ?auto_176898 ?auto_176900 ) ) ( not ( = ?auto_176898 ?auto_176903 ) ) ( not ( = ?auto_176899 ?auto_176900 ) ) ( not ( = ?auto_176899 ?auto_176903 ) ) ( not ( = ?auto_176900 ?auto_176903 ) ) ( not ( = ?auto_176896 ?auto_176901 ) ) ( not ( = ?auto_176896 ?auto_176902 ) ) ( not ( = ?auto_176897 ?auto_176901 ) ) ( not ( = ?auto_176897 ?auto_176902 ) ) ( not ( = ?auto_176898 ?auto_176901 ) ) ( not ( = ?auto_176898 ?auto_176902 ) ) ( not ( = ?auto_176899 ?auto_176901 ) ) ( not ( = ?auto_176899 ?auto_176902 ) ) ( not ( = ?auto_176900 ?auto_176901 ) ) ( not ( = ?auto_176900 ?auto_176902 ) ) ( not ( = ?auto_176903 ?auto_176901 ) ) ( not ( = ?auto_176903 ?auto_176902 ) ) ( not ( = ?auto_176901 ?auto_176902 ) ) ( ON ?auto_176901 ?auto_176903 ) ( ON ?auto_176902 ?auto_176901 ) ( CLEAR ?auto_176902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176896 ?auto_176897 ?auto_176898 ?auto_176899 ?auto_176900 ?auto_176903 ?auto_176901 )
      ( MAKE-5PILE ?auto_176896 ?auto_176897 ?auto_176898 ?auto_176899 ?auto_176900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176904 - BLOCK
      ?auto_176905 - BLOCK
      ?auto_176906 - BLOCK
      ?auto_176907 - BLOCK
      ?auto_176908 - BLOCK
    )
    :vars
    (
      ?auto_176911 - BLOCK
      ?auto_176909 - BLOCK
      ?auto_176910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176911 ?auto_176908 ) ( ON-TABLE ?auto_176904 ) ( ON ?auto_176905 ?auto_176904 ) ( ON ?auto_176906 ?auto_176905 ) ( ON ?auto_176907 ?auto_176906 ) ( ON ?auto_176908 ?auto_176907 ) ( not ( = ?auto_176904 ?auto_176905 ) ) ( not ( = ?auto_176904 ?auto_176906 ) ) ( not ( = ?auto_176904 ?auto_176907 ) ) ( not ( = ?auto_176904 ?auto_176908 ) ) ( not ( = ?auto_176904 ?auto_176911 ) ) ( not ( = ?auto_176905 ?auto_176906 ) ) ( not ( = ?auto_176905 ?auto_176907 ) ) ( not ( = ?auto_176905 ?auto_176908 ) ) ( not ( = ?auto_176905 ?auto_176911 ) ) ( not ( = ?auto_176906 ?auto_176907 ) ) ( not ( = ?auto_176906 ?auto_176908 ) ) ( not ( = ?auto_176906 ?auto_176911 ) ) ( not ( = ?auto_176907 ?auto_176908 ) ) ( not ( = ?auto_176907 ?auto_176911 ) ) ( not ( = ?auto_176908 ?auto_176911 ) ) ( not ( = ?auto_176904 ?auto_176909 ) ) ( not ( = ?auto_176904 ?auto_176910 ) ) ( not ( = ?auto_176905 ?auto_176909 ) ) ( not ( = ?auto_176905 ?auto_176910 ) ) ( not ( = ?auto_176906 ?auto_176909 ) ) ( not ( = ?auto_176906 ?auto_176910 ) ) ( not ( = ?auto_176907 ?auto_176909 ) ) ( not ( = ?auto_176907 ?auto_176910 ) ) ( not ( = ?auto_176908 ?auto_176909 ) ) ( not ( = ?auto_176908 ?auto_176910 ) ) ( not ( = ?auto_176911 ?auto_176909 ) ) ( not ( = ?auto_176911 ?auto_176910 ) ) ( not ( = ?auto_176909 ?auto_176910 ) ) ( ON ?auto_176909 ?auto_176911 ) ( HOLDING ?auto_176910 ) ( CLEAR ?auto_176909 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176904 ?auto_176905 ?auto_176906 ?auto_176907 ?auto_176908 ?auto_176911 ?auto_176909 ?auto_176910 )
      ( MAKE-5PILE ?auto_176904 ?auto_176905 ?auto_176906 ?auto_176907 ?auto_176908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176912 - BLOCK
      ?auto_176913 - BLOCK
      ?auto_176914 - BLOCK
      ?auto_176915 - BLOCK
      ?auto_176916 - BLOCK
    )
    :vars
    (
      ?auto_176918 - BLOCK
      ?auto_176917 - BLOCK
      ?auto_176919 - BLOCK
      ?auto_176920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176918 ?auto_176916 ) ( ON-TABLE ?auto_176912 ) ( ON ?auto_176913 ?auto_176912 ) ( ON ?auto_176914 ?auto_176913 ) ( ON ?auto_176915 ?auto_176914 ) ( ON ?auto_176916 ?auto_176915 ) ( not ( = ?auto_176912 ?auto_176913 ) ) ( not ( = ?auto_176912 ?auto_176914 ) ) ( not ( = ?auto_176912 ?auto_176915 ) ) ( not ( = ?auto_176912 ?auto_176916 ) ) ( not ( = ?auto_176912 ?auto_176918 ) ) ( not ( = ?auto_176913 ?auto_176914 ) ) ( not ( = ?auto_176913 ?auto_176915 ) ) ( not ( = ?auto_176913 ?auto_176916 ) ) ( not ( = ?auto_176913 ?auto_176918 ) ) ( not ( = ?auto_176914 ?auto_176915 ) ) ( not ( = ?auto_176914 ?auto_176916 ) ) ( not ( = ?auto_176914 ?auto_176918 ) ) ( not ( = ?auto_176915 ?auto_176916 ) ) ( not ( = ?auto_176915 ?auto_176918 ) ) ( not ( = ?auto_176916 ?auto_176918 ) ) ( not ( = ?auto_176912 ?auto_176917 ) ) ( not ( = ?auto_176912 ?auto_176919 ) ) ( not ( = ?auto_176913 ?auto_176917 ) ) ( not ( = ?auto_176913 ?auto_176919 ) ) ( not ( = ?auto_176914 ?auto_176917 ) ) ( not ( = ?auto_176914 ?auto_176919 ) ) ( not ( = ?auto_176915 ?auto_176917 ) ) ( not ( = ?auto_176915 ?auto_176919 ) ) ( not ( = ?auto_176916 ?auto_176917 ) ) ( not ( = ?auto_176916 ?auto_176919 ) ) ( not ( = ?auto_176918 ?auto_176917 ) ) ( not ( = ?auto_176918 ?auto_176919 ) ) ( not ( = ?auto_176917 ?auto_176919 ) ) ( ON ?auto_176917 ?auto_176918 ) ( CLEAR ?auto_176917 ) ( ON ?auto_176919 ?auto_176920 ) ( CLEAR ?auto_176919 ) ( HAND-EMPTY ) ( not ( = ?auto_176912 ?auto_176920 ) ) ( not ( = ?auto_176913 ?auto_176920 ) ) ( not ( = ?auto_176914 ?auto_176920 ) ) ( not ( = ?auto_176915 ?auto_176920 ) ) ( not ( = ?auto_176916 ?auto_176920 ) ) ( not ( = ?auto_176918 ?auto_176920 ) ) ( not ( = ?auto_176917 ?auto_176920 ) ) ( not ( = ?auto_176919 ?auto_176920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176919 ?auto_176920 )
      ( MAKE-5PILE ?auto_176912 ?auto_176913 ?auto_176914 ?auto_176915 ?auto_176916 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176921 - BLOCK
      ?auto_176922 - BLOCK
      ?auto_176923 - BLOCK
      ?auto_176924 - BLOCK
      ?auto_176925 - BLOCK
    )
    :vars
    (
      ?auto_176927 - BLOCK
      ?auto_176929 - BLOCK
      ?auto_176926 - BLOCK
      ?auto_176928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176927 ?auto_176925 ) ( ON-TABLE ?auto_176921 ) ( ON ?auto_176922 ?auto_176921 ) ( ON ?auto_176923 ?auto_176922 ) ( ON ?auto_176924 ?auto_176923 ) ( ON ?auto_176925 ?auto_176924 ) ( not ( = ?auto_176921 ?auto_176922 ) ) ( not ( = ?auto_176921 ?auto_176923 ) ) ( not ( = ?auto_176921 ?auto_176924 ) ) ( not ( = ?auto_176921 ?auto_176925 ) ) ( not ( = ?auto_176921 ?auto_176927 ) ) ( not ( = ?auto_176922 ?auto_176923 ) ) ( not ( = ?auto_176922 ?auto_176924 ) ) ( not ( = ?auto_176922 ?auto_176925 ) ) ( not ( = ?auto_176922 ?auto_176927 ) ) ( not ( = ?auto_176923 ?auto_176924 ) ) ( not ( = ?auto_176923 ?auto_176925 ) ) ( not ( = ?auto_176923 ?auto_176927 ) ) ( not ( = ?auto_176924 ?auto_176925 ) ) ( not ( = ?auto_176924 ?auto_176927 ) ) ( not ( = ?auto_176925 ?auto_176927 ) ) ( not ( = ?auto_176921 ?auto_176929 ) ) ( not ( = ?auto_176921 ?auto_176926 ) ) ( not ( = ?auto_176922 ?auto_176929 ) ) ( not ( = ?auto_176922 ?auto_176926 ) ) ( not ( = ?auto_176923 ?auto_176929 ) ) ( not ( = ?auto_176923 ?auto_176926 ) ) ( not ( = ?auto_176924 ?auto_176929 ) ) ( not ( = ?auto_176924 ?auto_176926 ) ) ( not ( = ?auto_176925 ?auto_176929 ) ) ( not ( = ?auto_176925 ?auto_176926 ) ) ( not ( = ?auto_176927 ?auto_176929 ) ) ( not ( = ?auto_176927 ?auto_176926 ) ) ( not ( = ?auto_176929 ?auto_176926 ) ) ( ON ?auto_176926 ?auto_176928 ) ( CLEAR ?auto_176926 ) ( not ( = ?auto_176921 ?auto_176928 ) ) ( not ( = ?auto_176922 ?auto_176928 ) ) ( not ( = ?auto_176923 ?auto_176928 ) ) ( not ( = ?auto_176924 ?auto_176928 ) ) ( not ( = ?auto_176925 ?auto_176928 ) ) ( not ( = ?auto_176927 ?auto_176928 ) ) ( not ( = ?auto_176929 ?auto_176928 ) ) ( not ( = ?auto_176926 ?auto_176928 ) ) ( HOLDING ?auto_176929 ) ( CLEAR ?auto_176927 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176921 ?auto_176922 ?auto_176923 ?auto_176924 ?auto_176925 ?auto_176927 ?auto_176929 )
      ( MAKE-5PILE ?auto_176921 ?auto_176922 ?auto_176923 ?auto_176924 ?auto_176925 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176930 - BLOCK
      ?auto_176931 - BLOCK
      ?auto_176932 - BLOCK
      ?auto_176933 - BLOCK
      ?auto_176934 - BLOCK
    )
    :vars
    (
      ?auto_176936 - BLOCK
      ?auto_176935 - BLOCK
      ?auto_176937 - BLOCK
      ?auto_176938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176936 ?auto_176934 ) ( ON-TABLE ?auto_176930 ) ( ON ?auto_176931 ?auto_176930 ) ( ON ?auto_176932 ?auto_176931 ) ( ON ?auto_176933 ?auto_176932 ) ( ON ?auto_176934 ?auto_176933 ) ( not ( = ?auto_176930 ?auto_176931 ) ) ( not ( = ?auto_176930 ?auto_176932 ) ) ( not ( = ?auto_176930 ?auto_176933 ) ) ( not ( = ?auto_176930 ?auto_176934 ) ) ( not ( = ?auto_176930 ?auto_176936 ) ) ( not ( = ?auto_176931 ?auto_176932 ) ) ( not ( = ?auto_176931 ?auto_176933 ) ) ( not ( = ?auto_176931 ?auto_176934 ) ) ( not ( = ?auto_176931 ?auto_176936 ) ) ( not ( = ?auto_176932 ?auto_176933 ) ) ( not ( = ?auto_176932 ?auto_176934 ) ) ( not ( = ?auto_176932 ?auto_176936 ) ) ( not ( = ?auto_176933 ?auto_176934 ) ) ( not ( = ?auto_176933 ?auto_176936 ) ) ( not ( = ?auto_176934 ?auto_176936 ) ) ( not ( = ?auto_176930 ?auto_176935 ) ) ( not ( = ?auto_176930 ?auto_176937 ) ) ( not ( = ?auto_176931 ?auto_176935 ) ) ( not ( = ?auto_176931 ?auto_176937 ) ) ( not ( = ?auto_176932 ?auto_176935 ) ) ( not ( = ?auto_176932 ?auto_176937 ) ) ( not ( = ?auto_176933 ?auto_176935 ) ) ( not ( = ?auto_176933 ?auto_176937 ) ) ( not ( = ?auto_176934 ?auto_176935 ) ) ( not ( = ?auto_176934 ?auto_176937 ) ) ( not ( = ?auto_176936 ?auto_176935 ) ) ( not ( = ?auto_176936 ?auto_176937 ) ) ( not ( = ?auto_176935 ?auto_176937 ) ) ( ON ?auto_176937 ?auto_176938 ) ( not ( = ?auto_176930 ?auto_176938 ) ) ( not ( = ?auto_176931 ?auto_176938 ) ) ( not ( = ?auto_176932 ?auto_176938 ) ) ( not ( = ?auto_176933 ?auto_176938 ) ) ( not ( = ?auto_176934 ?auto_176938 ) ) ( not ( = ?auto_176936 ?auto_176938 ) ) ( not ( = ?auto_176935 ?auto_176938 ) ) ( not ( = ?auto_176937 ?auto_176938 ) ) ( CLEAR ?auto_176936 ) ( ON ?auto_176935 ?auto_176937 ) ( CLEAR ?auto_176935 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176938 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176938 ?auto_176937 )
      ( MAKE-5PILE ?auto_176930 ?auto_176931 ?auto_176932 ?auto_176933 ?auto_176934 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176957 - BLOCK
      ?auto_176958 - BLOCK
      ?auto_176959 - BLOCK
      ?auto_176960 - BLOCK
      ?auto_176961 - BLOCK
    )
    :vars
    (
      ?auto_176963 - BLOCK
      ?auto_176965 - BLOCK
      ?auto_176964 - BLOCK
      ?auto_176962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176957 ) ( ON ?auto_176958 ?auto_176957 ) ( ON ?auto_176959 ?auto_176958 ) ( ON ?auto_176960 ?auto_176959 ) ( not ( = ?auto_176957 ?auto_176958 ) ) ( not ( = ?auto_176957 ?auto_176959 ) ) ( not ( = ?auto_176957 ?auto_176960 ) ) ( not ( = ?auto_176957 ?auto_176961 ) ) ( not ( = ?auto_176957 ?auto_176963 ) ) ( not ( = ?auto_176958 ?auto_176959 ) ) ( not ( = ?auto_176958 ?auto_176960 ) ) ( not ( = ?auto_176958 ?auto_176961 ) ) ( not ( = ?auto_176958 ?auto_176963 ) ) ( not ( = ?auto_176959 ?auto_176960 ) ) ( not ( = ?auto_176959 ?auto_176961 ) ) ( not ( = ?auto_176959 ?auto_176963 ) ) ( not ( = ?auto_176960 ?auto_176961 ) ) ( not ( = ?auto_176960 ?auto_176963 ) ) ( not ( = ?auto_176961 ?auto_176963 ) ) ( not ( = ?auto_176957 ?auto_176965 ) ) ( not ( = ?auto_176957 ?auto_176964 ) ) ( not ( = ?auto_176958 ?auto_176965 ) ) ( not ( = ?auto_176958 ?auto_176964 ) ) ( not ( = ?auto_176959 ?auto_176965 ) ) ( not ( = ?auto_176959 ?auto_176964 ) ) ( not ( = ?auto_176960 ?auto_176965 ) ) ( not ( = ?auto_176960 ?auto_176964 ) ) ( not ( = ?auto_176961 ?auto_176965 ) ) ( not ( = ?auto_176961 ?auto_176964 ) ) ( not ( = ?auto_176963 ?auto_176965 ) ) ( not ( = ?auto_176963 ?auto_176964 ) ) ( not ( = ?auto_176965 ?auto_176964 ) ) ( ON ?auto_176964 ?auto_176962 ) ( not ( = ?auto_176957 ?auto_176962 ) ) ( not ( = ?auto_176958 ?auto_176962 ) ) ( not ( = ?auto_176959 ?auto_176962 ) ) ( not ( = ?auto_176960 ?auto_176962 ) ) ( not ( = ?auto_176961 ?auto_176962 ) ) ( not ( = ?auto_176963 ?auto_176962 ) ) ( not ( = ?auto_176965 ?auto_176962 ) ) ( not ( = ?auto_176964 ?auto_176962 ) ) ( ON ?auto_176965 ?auto_176964 ) ( ON-TABLE ?auto_176962 ) ( ON ?auto_176963 ?auto_176965 ) ( CLEAR ?auto_176963 ) ( HOLDING ?auto_176961 ) ( CLEAR ?auto_176960 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176957 ?auto_176958 ?auto_176959 ?auto_176960 ?auto_176961 ?auto_176963 )
      ( MAKE-5PILE ?auto_176957 ?auto_176958 ?auto_176959 ?auto_176960 ?auto_176961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176966 - BLOCK
      ?auto_176967 - BLOCK
      ?auto_176968 - BLOCK
      ?auto_176969 - BLOCK
      ?auto_176970 - BLOCK
    )
    :vars
    (
      ?auto_176973 - BLOCK
      ?auto_176971 - BLOCK
      ?auto_176974 - BLOCK
      ?auto_176972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176966 ) ( ON ?auto_176967 ?auto_176966 ) ( ON ?auto_176968 ?auto_176967 ) ( ON ?auto_176969 ?auto_176968 ) ( not ( = ?auto_176966 ?auto_176967 ) ) ( not ( = ?auto_176966 ?auto_176968 ) ) ( not ( = ?auto_176966 ?auto_176969 ) ) ( not ( = ?auto_176966 ?auto_176970 ) ) ( not ( = ?auto_176966 ?auto_176973 ) ) ( not ( = ?auto_176967 ?auto_176968 ) ) ( not ( = ?auto_176967 ?auto_176969 ) ) ( not ( = ?auto_176967 ?auto_176970 ) ) ( not ( = ?auto_176967 ?auto_176973 ) ) ( not ( = ?auto_176968 ?auto_176969 ) ) ( not ( = ?auto_176968 ?auto_176970 ) ) ( not ( = ?auto_176968 ?auto_176973 ) ) ( not ( = ?auto_176969 ?auto_176970 ) ) ( not ( = ?auto_176969 ?auto_176973 ) ) ( not ( = ?auto_176970 ?auto_176973 ) ) ( not ( = ?auto_176966 ?auto_176971 ) ) ( not ( = ?auto_176966 ?auto_176974 ) ) ( not ( = ?auto_176967 ?auto_176971 ) ) ( not ( = ?auto_176967 ?auto_176974 ) ) ( not ( = ?auto_176968 ?auto_176971 ) ) ( not ( = ?auto_176968 ?auto_176974 ) ) ( not ( = ?auto_176969 ?auto_176971 ) ) ( not ( = ?auto_176969 ?auto_176974 ) ) ( not ( = ?auto_176970 ?auto_176971 ) ) ( not ( = ?auto_176970 ?auto_176974 ) ) ( not ( = ?auto_176973 ?auto_176971 ) ) ( not ( = ?auto_176973 ?auto_176974 ) ) ( not ( = ?auto_176971 ?auto_176974 ) ) ( ON ?auto_176974 ?auto_176972 ) ( not ( = ?auto_176966 ?auto_176972 ) ) ( not ( = ?auto_176967 ?auto_176972 ) ) ( not ( = ?auto_176968 ?auto_176972 ) ) ( not ( = ?auto_176969 ?auto_176972 ) ) ( not ( = ?auto_176970 ?auto_176972 ) ) ( not ( = ?auto_176973 ?auto_176972 ) ) ( not ( = ?auto_176971 ?auto_176972 ) ) ( not ( = ?auto_176974 ?auto_176972 ) ) ( ON ?auto_176971 ?auto_176974 ) ( ON-TABLE ?auto_176972 ) ( ON ?auto_176973 ?auto_176971 ) ( CLEAR ?auto_176969 ) ( ON ?auto_176970 ?auto_176973 ) ( CLEAR ?auto_176970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176972 ?auto_176974 ?auto_176971 ?auto_176973 )
      ( MAKE-5PILE ?auto_176966 ?auto_176967 ?auto_176968 ?auto_176969 ?auto_176970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176975 - BLOCK
      ?auto_176976 - BLOCK
      ?auto_176977 - BLOCK
      ?auto_176978 - BLOCK
      ?auto_176979 - BLOCK
    )
    :vars
    (
      ?auto_176982 - BLOCK
      ?auto_176983 - BLOCK
      ?auto_176980 - BLOCK
      ?auto_176981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176975 ) ( ON ?auto_176976 ?auto_176975 ) ( ON ?auto_176977 ?auto_176976 ) ( not ( = ?auto_176975 ?auto_176976 ) ) ( not ( = ?auto_176975 ?auto_176977 ) ) ( not ( = ?auto_176975 ?auto_176978 ) ) ( not ( = ?auto_176975 ?auto_176979 ) ) ( not ( = ?auto_176975 ?auto_176982 ) ) ( not ( = ?auto_176976 ?auto_176977 ) ) ( not ( = ?auto_176976 ?auto_176978 ) ) ( not ( = ?auto_176976 ?auto_176979 ) ) ( not ( = ?auto_176976 ?auto_176982 ) ) ( not ( = ?auto_176977 ?auto_176978 ) ) ( not ( = ?auto_176977 ?auto_176979 ) ) ( not ( = ?auto_176977 ?auto_176982 ) ) ( not ( = ?auto_176978 ?auto_176979 ) ) ( not ( = ?auto_176978 ?auto_176982 ) ) ( not ( = ?auto_176979 ?auto_176982 ) ) ( not ( = ?auto_176975 ?auto_176983 ) ) ( not ( = ?auto_176975 ?auto_176980 ) ) ( not ( = ?auto_176976 ?auto_176983 ) ) ( not ( = ?auto_176976 ?auto_176980 ) ) ( not ( = ?auto_176977 ?auto_176983 ) ) ( not ( = ?auto_176977 ?auto_176980 ) ) ( not ( = ?auto_176978 ?auto_176983 ) ) ( not ( = ?auto_176978 ?auto_176980 ) ) ( not ( = ?auto_176979 ?auto_176983 ) ) ( not ( = ?auto_176979 ?auto_176980 ) ) ( not ( = ?auto_176982 ?auto_176983 ) ) ( not ( = ?auto_176982 ?auto_176980 ) ) ( not ( = ?auto_176983 ?auto_176980 ) ) ( ON ?auto_176980 ?auto_176981 ) ( not ( = ?auto_176975 ?auto_176981 ) ) ( not ( = ?auto_176976 ?auto_176981 ) ) ( not ( = ?auto_176977 ?auto_176981 ) ) ( not ( = ?auto_176978 ?auto_176981 ) ) ( not ( = ?auto_176979 ?auto_176981 ) ) ( not ( = ?auto_176982 ?auto_176981 ) ) ( not ( = ?auto_176983 ?auto_176981 ) ) ( not ( = ?auto_176980 ?auto_176981 ) ) ( ON ?auto_176983 ?auto_176980 ) ( ON-TABLE ?auto_176981 ) ( ON ?auto_176982 ?auto_176983 ) ( ON ?auto_176979 ?auto_176982 ) ( CLEAR ?auto_176979 ) ( HOLDING ?auto_176978 ) ( CLEAR ?auto_176977 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176975 ?auto_176976 ?auto_176977 ?auto_176978 )
      ( MAKE-5PILE ?auto_176975 ?auto_176976 ?auto_176977 ?auto_176978 ?auto_176979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176984 - BLOCK
      ?auto_176985 - BLOCK
      ?auto_176986 - BLOCK
      ?auto_176987 - BLOCK
      ?auto_176988 - BLOCK
    )
    :vars
    (
      ?auto_176991 - BLOCK
      ?auto_176992 - BLOCK
      ?auto_176989 - BLOCK
      ?auto_176990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176984 ) ( ON ?auto_176985 ?auto_176984 ) ( ON ?auto_176986 ?auto_176985 ) ( not ( = ?auto_176984 ?auto_176985 ) ) ( not ( = ?auto_176984 ?auto_176986 ) ) ( not ( = ?auto_176984 ?auto_176987 ) ) ( not ( = ?auto_176984 ?auto_176988 ) ) ( not ( = ?auto_176984 ?auto_176991 ) ) ( not ( = ?auto_176985 ?auto_176986 ) ) ( not ( = ?auto_176985 ?auto_176987 ) ) ( not ( = ?auto_176985 ?auto_176988 ) ) ( not ( = ?auto_176985 ?auto_176991 ) ) ( not ( = ?auto_176986 ?auto_176987 ) ) ( not ( = ?auto_176986 ?auto_176988 ) ) ( not ( = ?auto_176986 ?auto_176991 ) ) ( not ( = ?auto_176987 ?auto_176988 ) ) ( not ( = ?auto_176987 ?auto_176991 ) ) ( not ( = ?auto_176988 ?auto_176991 ) ) ( not ( = ?auto_176984 ?auto_176992 ) ) ( not ( = ?auto_176984 ?auto_176989 ) ) ( not ( = ?auto_176985 ?auto_176992 ) ) ( not ( = ?auto_176985 ?auto_176989 ) ) ( not ( = ?auto_176986 ?auto_176992 ) ) ( not ( = ?auto_176986 ?auto_176989 ) ) ( not ( = ?auto_176987 ?auto_176992 ) ) ( not ( = ?auto_176987 ?auto_176989 ) ) ( not ( = ?auto_176988 ?auto_176992 ) ) ( not ( = ?auto_176988 ?auto_176989 ) ) ( not ( = ?auto_176991 ?auto_176992 ) ) ( not ( = ?auto_176991 ?auto_176989 ) ) ( not ( = ?auto_176992 ?auto_176989 ) ) ( ON ?auto_176989 ?auto_176990 ) ( not ( = ?auto_176984 ?auto_176990 ) ) ( not ( = ?auto_176985 ?auto_176990 ) ) ( not ( = ?auto_176986 ?auto_176990 ) ) ( not ( = ?auto_176987 ?auto_176990 ) ) ( not ( = ?auto_176988 ?auto_176990 ) ) ( not ( = ?auto_176991 ?auto_176990 ) ) ( not ( = ?auto_176992 ?auto_176990 ) ) ( not ( = ?auto_176989 ?auto_176990 ) ) ( ON ?auto_176992 ?auto_176989 ) ( ON-TABLE ?auto_176990 ) ( ON ?auto_176991 ?auto_176992 ) ( ON ?auto_176988 ?auto_176991 ) ( CLEAR ?auto_176986 ) ( ON ?auto_176987 ?auto_176988 ) ( CLEAR ?auto_176987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176990 ?auto_176989 ?auto_176992 ?auto_176991 ?auto_176988 )
      ( MAKE-5PILE ?auto_176984 ?auto_176985 ?auto_176986 ?auto_176987 ?auto_176988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_176993 - BLOCK
      ?auto_176994 - BLOCK
      ?auto_176995 - BLOCK
      ?auto_176996 - BLOCK
      ?auto_176997 - BLOCK
    )
    :vars
    (
      ?auto_176999 - BLOCK
      ?auto_177000 - BLOCK
      ?auto_177001 - BLOCK
      ?auto_176998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_176993 ) ( ON ?auto_176994 ?auto_176993 ) ( not ( = ?auto_176993 ?auto_176994 ) ) ( not ( = ?auto_176993 ?auto_176995 ) ) ( not ( = ?auto_176993 ?auto_176996 ) ) ( not ( = ?auto_176993 ?auto_176997 ) ) ( not ( = ?auto_176993 ?auto_176999 ) ) ( not ( = ?auto_176994 ?auto_176995 ) ) ( not ( = ?auto_176994 ?auto_176996 ) ) ( not ( = ?auto_176994 ?auto_176997 ) ) ( not ( = ?auto_176994 ?auto_176999 ) ) ( not ( = ?auto_176995 ?auto_176996 ) ) ( not ( = ?auto_176995 ?auto_176997 ) ) ( not ( = ?auto_176995 ?auto_176999 ) ) ( not ( = ?auto_176996 ?auto_176997 ) ) ( not ( = ?auto_176996 ?auto_176999 ) ) ( not ( = ?auto_176997 ?auto_176999 ) ) ( not ( = ?auto_176993 ?auto_177000 ) ) ( not ( = ?auto_176993 ?auto_177001 ) ) ( not ( = ?auto_176994 ?auto_177000 ) ) ( not ( = ?auto_176994 ?auto_177001 ) ) ( not ( = ?auto_176995 ?auto_177000 ) ) ( not ( = ?auto_176995 ?auto_177001 ) ) ( not ( = ?auto_176996 ?auto_177000 ) ) ( not ( = ?auto_176996 ?auto_177001 ) ) ( not ( = ?auto_176997 ?auto_177000 ) ) ( not ( = ?auto_176997 ?auto_177001 ) ) ( not ( = ?auto_176999 ?auto_177000 ) ) ( not ( = ?auto_176999 ?auto_177001 ) ) ( not ( = ?auto_177000 ?auto_177001 ) ) ( ON ?auto_177001 ?auto_176998 ) ( not ( = ?auto_176993 ?auto_176998 ) ) ( not ( = ?auto_176994 ?auto_176998 ) ) ( not ( = ?auto_176995 ?auto_176998 ) ) ( not ( = ?auto_176996 ?auto_176998 ) ) ( not ( = ?auto_176997 ?auto_176998 ) ) ( not ( = ?auto_176999 ?auto_176998 ) ) ( not ( = ?auto_177000 ?auto_176998 ) ) ( not ( = ?auto_177001 ?auto_176998 ) ) ( ON ?auto_177000 ?auto_177001 ) ( ON-TABLE ?auto_176998 ) ( ON ?auto_176999 ?auto_177000 ) ( ON ?auto_176997 ?auto_176999 ) ( ON ?auto_176996 ?auto_176997 ) ( CLEAR ?auto_176996 ) ( HOLDING ?auto_176995 ) ( CLEAR ?auto_176994 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176993 ?auto_176994 ?auto_176995 )
      ( MAKE-5PILE ?auto_176993 ?auto_176994 ?auto_176995 ?auto_176996 ?auto_176997 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177002 - BLOCK
      ?auto_177003 - BLOCK
      ?auto_177004 - BLOCK
      ?auto_177005 - BLOCK
      ?auto_177006 - BLOCK
    )
    :vars
    (
      ?auto_177008 - BLOCK
      ?auto_177010 - BLOCK
      ?auto_177007 - BLOCK
      ?auto_177009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177002 ) ( ON ?auto_177003 ?auto_177002 ) ( not ( = ?auto_177002 ?auto_177003 ) ) ( not ( = ?auto_177002 ?auto_177004 ) ) ( not ( = ?auto_177002 ?auto_177005 ) ) ( not ( = ?auto_177002 ?auto_177006 ) ) ( not ( = ?auto_177002 ?auto_177008 ) ) ( not ( = ?auto_177003 ?auto_177004 ) ) ( not ( = ?auto_177003 ?auto_177005 ) ) ( not ( = ?auto_177003 ?auto_177006 ) ) ( not ( = ?auto_177003 ?auto_177008 ) ) ( not ( = ?auto_177004 ?auto_177005 ) ) ( not ( = ?auto_177004 ?auto_177006 ) ) ( not ( = ?auto_177004 ?auto_177008 ) ) ( not ( = ?auto_177005 ?auto_177006 ) ) ( not ( = ?auto_177005 ?auto_177008 ) ) ( not ( = ?auto_177006 ?auto_177008 ) ) ( not ( = ?auto_177002 ?auto_177010 ) ) ( not ( = ?auto_177002 ?auto_177007 ) ) ( not ( = ?auto_177003 ?auto_177010 ) ) ( not ( = ?auto_177003 ?auto_177007 ) ) ( not ( = ?auto_177004 ?auto_177010 ) ) ( not ( = ?auto_177004 ?auto_177007 ) ) ( not ( = ?auto_177005 ?auto_177010 ) ) ( not ( = ?auto_177005 ?auto_177007 ) ) ( not ( = ?auto_177006 ?auto_177010 ) ) ( not ( = ?auto_177006 ?auto_177007 ) ) ( not ( = ?auto_177008 ?auto_177010 ) ) ( not ( = ?auto_177008 ?auto_177007 ) ) ( not ( = ?auto_177010 ?auto_177007 ) ) ( ON ?auto_177007 ?auto_177009 ) ( not ( = ?auto_177002 ?auto_177009 ) ) ( not ( = ?auto_177003 ?auto_177009 ) ) ( not ( = ?auto_177004 ?auto_177009 ) ) ( not ( = ?auto_177005 ?auto_177009 ) ) ( not ( = ?auto_177006 ?auto_177009 ) ) ( not ( = ?auto_177008 ?auto_177009 ) ) ( not ( = ?auto_177010 ?auto_177009 ) ) ( not ( = ?auto_177007 ?auto_177009 ) ) ( ON ?auto_177010 ?auto_177007 ) ( ON-TABLE ?auto_177009 ) ( ON ?auto_177008 ?auto_177010 ) ( ON ?auto_177006 ?auto_177008 ) ( ON ?auto_177005 ?auto_177006 ) ( CLEAR ?auto_177003 ) ( ON ?auto_177004 ?auto_177005 ) ( CLEAR ?auto_177004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177009 ?auto_177007 ?auto_177010 ?auto_177008 ?auto_177006 ?auto_177005 )
      ( MAKE-5PILE ?auto_177002 ?auto_177003 ?auto_177004 ?auto_177005 ?auto_177006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177011 - BLOCK
      ?auto_177012 - BLOCK
      ?auto_177013 - BLOCK
      ?auto_177014 - BLOCK
      ?auto_177015 - BLOCK
    )
    :vars
    (
      ?auto_177019 - BLOCK
      ?auto_177018 - BLOCK
      ?auto_177016 - BLOCK
      ?auto_177017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177011 ) ( not ( = ?auto_177011 ?auto_177012 ) ) ( not ( = ?auto_177011 ?auto_177013 ) ) ( not ( = ?auto_177011 ?auto_177014 ) ) ( not ( = ?auto_177011 ?auto_177015 ) ) ( not ( = ?auto_177011 ?auto_177019 ) ) ( not ( = ?auto_177012 ?auto_177013 ) ) ( not ( = ?auto_177012 ?auto_177014 ) ) ( not ( = ?auto_177012 ?auto_177015 ) ) ( not ( = ?auto_177012 ?auto_177019 ) ) ( not ( = ?auto_177013 ?auto_177014 ) ) ( not ( = ?auto_177013 ?auto_177015 ) ) ( not ( = ?auto_177013 ?auto_177019 ) ) ( not ( = ?auto_177014 ?auto_177015 ) ) ( not ( = ?auto_177014 ?auto_177019 ) ) ( not ( = ?auto_177015 ?auto_177019 ) ) ( not ( = ?auto_177011 ?auto_177018 ) ) ( not ( = ?auto_177011 ?auto_177016 ) ) ( not ( = ?auto_177012 ?auto_177018 ) ) ( not ( = ?auto_177012 ?auto_177016 ) ) ( not ( = ?auto_177013 ?auto_177018 ) ) ( not ( = ?auto_177013 ?auto_177016 ) ) ( not ( = ?auto_177014 ?auto_177018 ) ) ( not ( = ?auto_177014 ?auto_177016 ) ) ( not ( = ?auto_177015 ?auto_177018 ) ) ( not ( = ?auto_177015 ?auto_177016 ) ) ( not ( = ?auto_177019 ?auto_177018 ) ) ( not ( = ?auto_177019 ?auto_177016 ) ) ( not ( = ?auto_177018 ?auto_177016 ) ) ( ON ?auto_177016 ?auto_177017 ) ( not ( = ?auto_177011 ?auto_177017 ) ) ( not ( = ?auto_177012 ?auto_177017 ) ) ( not ( = ?auto_177013 ?auto_177017 ) ) ( not ( = ?auto_177014 ?auto_177017 ) ) ( not ( = ?auto_177015 ?auto_177017 ) ) ( not ( = ?auto_177019 ?auto_177017 ) ) ( not ( = ?auto_177018 ?auto_177017 ) ) ( not ( = ?auto_177016 ?auto_177017 ) ) ( ON ?auto_177018 ?auto_177016 ) ( ON-TABLE ?auto_177017 ) ( ON ?auto_177019 ?auto_177018 ) ( ON ?auto_177015 ?auto_177019 ) ( ON ?auto_177014 ?auto_177015 ) ( ON ?auto_177013 ?auto_177014 ) ( CLEAR ?auto_177013 ) ( HOLDING ?auto_177012 ) ( CLEAR ?auto_177011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177011 ?auto_177012 )
      ( MAKE-5PILE ?auto_177011 ?auto_177012 ?auto_177013 ?auto_177014 ?auto_177015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177020 - BLOCK
      ?auto_177021 - BLOCK
      ?auto_177022 - BLOCK
      ?auto_177023 - BLOCK
      ?auto_177024 - BLOCK
    )
    :vars
    (
      ?auto_177028 - BLOCK
      ?auto_177026 - BLOCK
      ?auto_177025 - BLOCK
      ?auto_177027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177020 ) ( not ( = ?auto_177020 ?auto_177021 ) ) ( not ( = ?auto_177020 ?auto_177022 ) ) ( not ( = ?auto_177020 ?auto_177023 ) ) ( not ( = ?auto_177020 ?auto_177024 ) ) ( not ( = ?auto_177020 ?auto_177028 ) ) ( not ( = ?auto_177021 ?auto_177022 ) ) ( not ( = ?auto_177021 ?auto_177023 ) ) ( not ( = ?auto_177021 ?auto_177024 ) ) ( not ( = ?auto_177021 ?auto_177028 ) ) ( not ( = ?auto_177022 ?auto_177023 ) ) ( not ( = ?auto_177022 ?auto_177024 ) ) ( not ( = ?auto_177022 ?auto_177028 ) ) ( not ( = ?auto_177023 ?auto_177024 ) ) ( not ( = ?auto_177023 ?auto_177028 ) ) ( not ( = ?auto_177024 ?auto_177028 ) ) ( not ( = ?auto_177020 ?auto_177026 ) ) ( not ( = ?auto_177020 ?auto_177025 ) ) ( not ( = ?auto_177021 ?auto_177026 ) ) ( not ( = ?auto_177021 ?auto_177025 ) ) ( not ( = ?auto_177022 ?auto_177026 ) ) ( not ( = ?auto_177022 ?auto_177025 ) ) ( not ( = ?auto_177023 ?auto_177026 ) ) ( not ( = ?auto_177023 ?auto_177025 ) ) ( not ( = ?auto_177024 ?auto_177026 ) ) ( not ( = ?auto_177024 ?auto_177025 ) ) ( not ( = ?auto_177028 ?auto_177026 ) ) ( not ( = ?auto_177028 ?auto_177025 ) ) ( not ( = ?auto_177026 ?auto_177025 ) ) ( ON ?auto_177025 ?auto_177027 ) ( not ( = ?auto_177020 ?auto_177027 ) ) ( not ( = ?auto_177021 ?auto_177027 ) ) ( not ( = ?auto_177022 ?auto_177027 ) ) ( not ( = ?auto_177023 ?auto_177027 ) ) ( not ( = ?auto_177024 ?auto_177027 ) ) ( not ( = ?auto_177028 ?auto_177027 ) ) ( not ( = ?auto_177026 ?auto_177027 ) ) ( not ( = ?auto_177025 ?auto_177027 ) ) ( ON ?auto_177026 ?auto_177025 ) ( ON-TABLE ?auto_177027 ) ( ON ?auto_177028 ?auto_177026 ) ( ON ?auto_177024 ?auto_177028 ) ( ON ?auto_177023 ?auto_177024 ) ( ON ?auto_177022 ?auto_177023 ) ( CLEAR ?auto_177020 ) ( ON ?auto_177021 ?auto_177022 ) ( CLEAR ?auto_177021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177027 ?auto_177025 ?auto_177026 ?auto_177028 ?auto_177024 ?auto_177023 ?auto_177022 )
      ( MAKE-5PILE ?auto_177020 ?auto_177021 ?auto_177022 ?auto_177023 ?auto_177024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177029 - BLOCK
      ?auto_177030 - BLOCK
      ?auto_177031 - BLOCK
      ?auto_177032 - BLOCK
      ?auto_177033 - BLOCK
    )
    :vars
    (
      ?auto_177034 - BLOCK
      ?auto_177037 - BLOCK
      ?auto_177036 - BLOCK
      ?auto_177035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177029 ?auto_177030 ) ) ( not ( = ?auto_177029 ?auto_177031 ) ) ( not ( = ?auto_177029 ?auto_177032 ) ) ( not ( = ?auto_177029 ?auto_177033 ) ) ( not ( = ?auto_177029 ?auto_177034 ) ) ( not ( = ?auto_177030 ?auto_177031 ) ) ( not ( = ?auto_177030 ?auto_177032 ) ) ( not ( = ?auto_177030 ?auto_177033 ) ) ( not ( = ?auto_177030 ?auto_177034 ) ) ( not ( = ?auto_177031 ?auto_177032 ) ) ( not ( = ?auto_177031 ?auto_177033 ) ) ( not ( = ?auto_177031 ?auto_177034 ) ) ( not ( = ?auto_177032 ?auto_177033 ) ) ( not ( = ?auto_177032 ?auto_177034 ) ) ( not ( = ?auto_177033 ?auto_177034 ) ) ( not ( = ?auto_177029 ?auto_177037 ) ) ( not ( = ?auto_177029 ?auto_177036 ) ) ( not ( = ?auto_177030 ?auto_177037 ) ) ( not ( = ?auto_177030 ?auto_177036 ) ) ( not ( = ?auto_177031 ?auto_177037 ) ) ( not ( = ?auto_177031 ?auto_177036 ) ) ( not ( = ?auto_177032 ?auto_177037 ) ) ( not ( = ?auto_177032 ?auto_177036 ) ) ( not ( = ?auto_177033 ?auto_177037 ) ) ( not ( = ?auto_177033 ?auto_177036 ) ) ( not ( = ?auto_177034 ?auto_177037 ) ) ( not ( = ?auto_177034 ?auto_177036 ) ) ( not ( = ?auto_177037 ?auto_177036 ) ) ( ON ?auto_177036 ?auto_177035 ) ( not ( = ?auto_177029 ?auto_177035 ) ) ( not ( = ?auto_177030 ?auto_177035 ) ) ( not ( = ?auto_177031 ?auto_177035 ) ) ( not ( = ?auto_177032 ?auto_177035 ) ) ( not ( = ?auto_177033 ?auto_177035 ) ) ( not ( = ?auto_177034 ?auto_177035 ) ) ( not ( = ?auto_177037 ?auto_177035 ) ) ( not ( = ?auto_177036 ?auto_177035 ) ) ( ON ?auto_177037 ?auto_177036 ) ( ON-TABLE ?auto_177035 ) ( ON ?auto_177034 ?auto_177037 ) ( ON ?auto_177033 ?auto_177034 ) ( ON ?auto_177032 ?auto_177033 ) ( ON ?auto_177031 ?auto_177032 ) ( ON ?auto_177030 ?auto_177031 ) ( CLEAR ?auto_177030 ) ( HOLDING ?auto_177029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177029 )
      ( MAKE-5PILE ?auto_177029 ?auto_177030 ?auto_177031 ?auto_177032 ?auto_177033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177038 - BLOCK
      ?auto_177039 - BLOCK
      ?auto_177040 - BLOCK
      ?auto_177041 - BLOCK
      ?auto_177042 - BLOCK
    )
    :vars
    (
      ?auto_177043 - BLOCK
      ?auto_177044 - BLOCK
      ?auto_177046 - BLOCK
      ?auto_177045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177038 ?auto_177039 ) ) ( not ( = ?auto_177038 ?auto_177040 ) ) ( not ( = ?auto_177038 ?auto_177041 ) ) ( not ( = ?auto_177038 ?auto_177042 ) ) ( not ( = ?auto_177038 ?auto_177043 ) ) ( not ( = ?auto_177039 ?auto_177040 ) ) ( not ( = ?auto_177039 ?auto_177041 ) ) ( not ( = ?auto_177039 ?auto_177042 ) ) ( not ( = ?auto_177039 ?auto_177043 ) ) ( not ( = ?auto_177040 ?auto_177041 ) ) ( not ( = ?auto_177040 ?auto_177042 ) ) ( not ( = ?auto_177040 ?auto_177043 ) ) ( not ( = ?auto_177041 ?auto_177042 ) ) ( not ( = ?auto_177041 ?auto_177043 ) ) ( not ( = ?auto_177042 ?auto_177043 ) ) ( not ( = ?auto_177038 ?auto_177044 ) ) ( not ( = ?auto_177038 ?auto_177046 ) ) ( not ( = ?auto_177039 ?auto_177044 ) ) ( not ( = ?auto_177039 ?auto_177046 ) ) ( not ( = ?auto_177040 ?auto_177044 ) ) ( not ( = ?auto_177040 ?auto_177046 ) ) ( not ( = ?auto_177041 ?auto_177044 ) ) ( not ( = ?auto_177041 ?auto_177046 ) ) ( not ( = ?auto_177042 ?auto_177044 ) ) ( not ( = ?auto_177042 ?auto_177046 ) ) ( not ( = ?auto_177043 ?auto_177044 ) ) ( not ( = ?auto_177043 ?auto_177046 ) ) ( not ( = ?auto_177044 ?auto_177046 ) ) ( ON ?auto_177046 ?auto_177045 ) ( not ( = ?auto_177038 ?auto_177045 ) ) ( not ( = ?auto_177039 ?auto_177045 ) ) ( not ( = ?auto_177040 ?auto_177045 ) ) ( not ( = ?auto_177041 ?auto_177045 ) ) ( not ( = ?auto_177042 ?auto_177045 ) ) ( not ( = ?auto_177043 ?auto_177045 ) ) ( not ( = ?auto_177044 ?auto_177045 ) ) ( not ( = ?auto_177046 ?auto_177045 ) ) ( ON ?auto_177044 ?auto_177046 ) ( ON-TABLE ?auto_177045 ) ( ON ?auto_177043 ?auto_177044 ) ( ON ?auto_177042 ?auto_177043 ) ( ON ?auto_177041 ?auto_177042 ) ( ON ?auto_177040 ?auto_177041 ) ( ON ?auto_177039 ?auto_177040 ) ( ON ?auto_177038 ?auto_177039 ) ( CLEAR ?auto_177038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177045 ?auto_177046 ?auto_177044 ?auto_177043 ?auto_177042 ?auto_177041 ?auto_177040 ?auto_177039 )
      ( MAKE-5PILE ?auto_177038 ?auto_177039 ?auto_177040 ?auto_177041 ?auto_177042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177050 - BLOCK
      ?auto_177051 - BLOCK
      ?auto_177052 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177052 ) ( CLEAR ?auto_177051 ) ( ON-TABLE ?auto_177050 ) ( ON ?auto_177051 ?auto_177050 ) ( not ( = ?auto_177050 ?auto_177051 ) ) ( not ( = ?auto_177050 ?auto_177052 ) ) ( not ( = ?auto_177051 ?auto_177052 ) ) )
    :subtasks
    ( ( !STACK ?auto_177052 ?auto_177051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177053 - BLOCK
      ?auto_177054 - BLOCK
      ?auto_177055 - BLOCK
    )
    :vars
    (
      ?auto_177056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177054 ) ( ON-TABLE ?auto_177053 ) ( ON ?auto_177054 ?auto_177053 ) ( not ( = ?auto_177053 ?auto_177054 ) ) ( not ( = ?auto_177053 ?auto_177055 ) ) ( not ( = ?auto_177054 ?auto_177055 ) ) ( ON ?auto_177055 ?auto_177056 ) ( CLEAR ?auto_177055 ) ( HAND-EMPTY ) ( not ( = ?auto_177053 ?auto_177056 ) ) ( not ( = ?auto_177054 ?auto_177056 ) ) ( not ( = ?auto_177055 ?auto_177056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177055 ?auto_177056 )
      ( MAKE-3PILE ?auto_177053 ?auto_177054 ?auto_177055 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177057 - BLOCK
      ?auto_177058 - BLOCK
      ?auto_177059 - BLOCK
    )
    :vars
    (
      ?auto_177060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177057 ) ( not ( = ?auto_177057 ?auto_177058 ) ) ( not ( = ?auto_177057 ?auto_177059 ) ) ( not ( = ?auto_177058 ?auto_177059 ) ) ( ON ?auto_177059 ?auto_177060 ) ( CLEAR ?auto_177059 ) ( not ( = ?auto_177057 ?auto_177060 ) ) ( not ( = ?auto_177058 ?auto_177060 ) ) ( not ( = ?auto_177059 ?auto_177060 ) ) ( HOLDING ?auto_177058 ) ( CLEAR ?auto_177057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177057 ?auto_177058 )
      ( MAKE-3PILE ?auto_177057 ?auto_177058 ?auto_177059 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177061 - BLOCK
      ?auto_177062 - BLOCK
      ?auto_177063 - BLOCK
    )
    :vars
    (
      ?auto_177064 - BLOCK
      ?auto_177066 - BLOCK
      ?auto_177065 - BLOCK
      ?auto_177067 - BLOCK
      ?auto_177068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177061 ) ( not ( = ?auto_177061 ?auto_177062 ) ) ( not ( = ?auto_177061 ?auto_177063 ) ) ( not ( = ?auto_177062 ?auto_177063 ) ) ( ON ?auto_177063 ?auto_177064 ) ( not ( = ?auto_177061 ?auto_177064 ) ) ( not ( = ?auto_177062 ?auto_177064 ) ) ( not ( = ?auto_177063 ?auto_177064 ) ) ( CLEAR ?auto_177061 ) ( ON ?auto_177062 ?auto_177063 ) ( CLEAR ?auto_177062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177066 ) ( ON ?auto_177065 ?auto_177066 ) ( ON ?auto_177067 ?auto_177065 ) ( ON ?auto_177068 ?auto_177067 ) ( ON ?auto_177064 ?auto_177068 ) ( not ( = ?auto_177066 ?auto_177065 ) ) ( not ( = ?auto_177066 ?auto_177067 ) ) ( not ( = ?auto_177066 ?auto_177068 ) ) ( not ( = ?auto_177066 ?auto_177064 ) ) ( not ( = ?auto_177066 ?auto_177063 ) ) ( not ( = ?auto_177066 ?auto_177062 ) ) ( not ( = ?auto_177065 ?auto_177067 ) ) ( not ( = ?auto_177065 ?auto_177068 ) ) ( not ( = ?auto_177065 ?auto_177064 ) ) ( not ( = ?auto_177065 ?auto_177063 ) ) ( not ( = ?auto_177065 ?auto_177062 ) ) ( not ( = ?auto_177067 ?auto_177068 ) ) ( not ( = ?auto_177067 ?auto_177064 ) ) ( not ( = ?auto_177067 ?auto_177063 ) ) ( not ( = ?auto_177067 ?auto_177062 ) ) ( not ( = ?auto_177068 ?auto_177064 ) ) ( not ( = ?auto_177068 ?auto_177063 ) ) ( not ( = ?auto_177068 ?auto_177062 ) ) ( not ( = ?auto_177061 ?auto_177066 ) ) ( not ( = ?auto_177061 ?auto_177065 ) ) ( not ( = ?auto_177061 ?auto_177067 ) ) ( not ( = ?auto_177061 ?auto_177068 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177066 ?auto_177065 ?auto_177067 ?auto_177068 ?auto_177064 ?auto_177063 )
      ( MAKE-3PILE ?auto_177061 ?auto_177062 ?auto_177063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177069 - BLOCK
      ?auto_177070 - BLOCK
      ?auto_177071 - BLOCK
    )
    :vars
    (
      ?auto_177075 - BLOCK
      ?auto_177072 - BLOCK
      ?auto_177076 - BLOCK
      ?auto_177074 - BLOCK
      ?auto_177073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177069 ?auto_177070 ) ) ( not ( = ?auto_177069 ?auto_177071 ) ) ( not ( = ?auto_177070 ?auto_177071 ) ) ( ON ?auto_177071 ?auto_177075 ) ( not ( = ?auto_177069 ?auto_177075 ) ) ( not ( = ?auto_177070 ?auto_177075 ) ) ( not ( = ?auto_177071 ?auto_177075 ) ) ( ON ?auto_177070 ?auto_177071 ) ( CLEAR ?auto_177070 ) ( ON-TABLE ?auto_177072 ) ( ON ?auto_177076 ?auto_177072 ) ( ON ?auto_177074 ?auto_177076 ) ( ON ?auto_177073 ?auto_177074 ) ( ON ?auto_177075 ?auto_177073 ) ( not ( = ?auto_177072 ?auto_177076 ) ) ( not ( = ?auto_177072 ?auto_177074 ) ) ( not ( = ?auto_177072 ?auto_177073 ) ) ( not ( = ?auto_177072 ?auto_177075 ) ) ( not ( = ?auto_177072 ?auto_177071 ) ) ( not ( = ?auto_177072 ?auto_177070 ) ) ( not ( = ?auto_177076 ?auto_177074 ) ) ( not ( = ?auto_177076 ?auto_177073 ) ) ( not ( = ?auto_177076 ?auto_177075 ) ) ( not ( = ?auto_177076 ?auto_177071 ) ) ( not ( = ?auto_177076 ?auto_177070 ) ) ( not ( = ?auto_177074 ?auto_177073 ) ) ( not ( = ?auto_177074 ?auto_177075 ) ) ( not ( = ?auto_177074 ?auto_177071 ) ) ( not ( = ?auto_177074 ?auto_177070 ) ) ( not ( = ?auto_177073 ?auto_177075 ) ) ( not ( = ?auto_177073 ?auto_177071 ) ) ( not ( = ?auto_177073 ?auto_177070 ) ) ( not ( = ?auto_177069 ?auto_177072 ) ) ( not ( = ?auto_177069 ?auto_177076 ) ) ( not ( = ?auto_177069 ?auto_177074 ) ) ( not ( = ?auto_177069 ?auto_177073 ) ) ( HOLDING ?auto_177069 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177069 )
      ( MAKE-3PILE ?auto_177069 ?auto_177070 ?auto_177071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177077 - BLOCK
      ?auto_177078 - BLOCK
      ?auto_177079 - BLOCK
    )
    :vars
    (
      ?auto_177084 - BLOCK
      ?auto_177081 - BLOCK
      ?auto_177080 - BLOCK
      ?auto_177082 - BLOCK
      ?auto_177083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177077 ?auto_177078 ) ) ( not ( = ?auto_177077 ?auto_177079 ) ) ( not ( = ?auto_177078 ?auto_177079 ) ) ( ON ?auto_177079 ?auto_177084 ) ( not ( = ?auto_177077 ?auto_177084 ) ) ( not ( = ?auto_177078 ?auto_177084 ) ) ( not ( = ?auto_177079 ?auto_177084 ) ) ( ON ?auto_177078 ?auto_177079 ) ( ON-TABLE ?auto_177081 ) ( ON ?auto_177080 ?auto_177081 ) ( ON ?auto_177082 ?auto_177080 ) ( ON ?auto_177083 ?auto_177082 ) ( ON ?auto_177084 ?auto_177083 ) ( not ( = ?auto_177081 ?auto_177080 ) ) ( not ( = ?auto_177081 ?auto_177082 ) ) ( not ( = ?auto_177081 ?auto_177083 ) ) ( not ( = ?auto_177081 ?auto_177084 ) ) ( not ( = ?auto_177081 ?auto_177079 ) ) ( not ( = ?auto_177081 ?auto_177078 ) ) ( not ( = ?auto_177080 ?auto_177082 ) ) ( not ( = ?auto_177080 ?auto_177083 ) ) ( not ( = ?auto_177080 ?auto_177084 ) ) ( not ( = ?auto_177080 ?auto_177079 ) ) ( not ( = ?auto_177080 ?auto_177078 ) ) ( not ( = ?auto_177082 ?auto_177083 ) ) ( not ( = ?auto_177082 ?auto_177084 ) ) ( not ( = ?auto_177082 ?auto_177079 ) ) ( not ( = ?auto_177082 ?auto_177078 ) ) ( not ( = ?auto_177083 ?auto_177084 ) ) ( not ( = ?auto_177083 ?auto_177079 ) ) ( not ( = ?auto_177083 ?auto_177078 ) ) ( not ( = ?auto_177077 ?auto_177081 ) ) ( not ( = ?auto_177077 ?auto_177080 ) ) ( not ( = ?auto_177077 ?auto_177082 ) ) ( not ( = ?auto_177077 ?auto_177083 ) ) ( ON ?auto_177077 ?auto_177078 ) ( CLEAR ?auto_177077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177081 ?auto_177080 ?auto_177082 ?auto_177083 ?auto_177084 ?auto_177079 ?auto_177078 )
      ( MAKE-3PILE ?auto_177077 ?auto_177078 ?auto_177079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177085 - BLOCK
      ?auto_177086 - BLOCK
      ?auto_177087 - BLOCK
    )
    :vars
    (
      ?auto_177089 - BLOCK
      ?auto_177092 - BLOCK
      ?auto_177091 - BLOCK
      ?auto_177090 - BLOCK
      ?auto_177088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177085 ?auto_177086 ) ) ( not ( = ?auto_177085 ?auto_177087 ) ) ( not ( = ?auto_177086 ?auto_177087 ) ) ( ON ?auto_177087 ?auto_177089 ) ( not ( = ?auto_177085 ?auto_177089 ) ) ( not ( = ?auto_177086 ?auto_177089 ) ) ( not ( = ?auto_177087 ?auto_177089 ) ) ( ON ?auto_177086 ?auto_177087 ) ( ON-TABLE ?auto_177092 ) ( ON ?auto_177091 ?auto_177092 ) ( ON ?auto_177090 ?auto_177091 ) ( ON ?auto_177088 ?auto_177090 ) ( ON ?auto_177089 ?auto_177088 ) ( not ( = ?auto_177092 ?auto_177091 ) ) ( not ( = ?auto_177092 ?auto_177090 ) ) ( not ( = ?auto_177092 ?auto_177088 ) ) ( not ( = ?auto_177092 ?auto_177089 ) ) ( not ( = ?auto_177092 ?auto_177087 ) ) ( not ( = ?auto_177092 ?auto_177086 ) ) ( not ( = ?auto_177091 ?auto_177090 ) ) ( not ( = ?auto_177091 ?auto_177088 ) ) ( not ( = ?auto_177091 ?auto_177089 ) ) ( not ( = ?auto_177091 ?auto_177087 ) ) ( not ( = ?auto_177091 ?auto_177086 ) ) ( not ( = ?auto_177090 ?auto_177088 ) ) ( not ( = ?auto_177090 ?auto_177089 ) ) ( not ( = ?auto_177090 ?auto_177087 ) ) ( not ( = ?auto_177090 ?auto_177086 ) ) ( not ( = ?auto_177088 ?auto_177089 ) ) ( not ( = ?auto_177088 ?auto_177087 ) ) ( not ( = ?auto_177088 ?auto_177086 ) ) ( not ( = ?auto_177085 ?auto_177092 ) ) ( not ( = ?auto_177085 ?auto_177091 ) ) ( not ( = ?auto_177085 ?auto_177090 ) ) ( not ( = ?auto_177085 ?auto_177088 ) ) ( HOLDING ?auto_177085 ) ( CLEAR ?auto_177086 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177092 ?auto_177091 ?auto_177090 ?auto_177088 ?auto_177089 ?auto_177087 ?auto_177086 ?auto_177085 )
      ( MAKE-3PILE ?auto_177085 ?auto_177086 ?auto_177087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177093 - BLOCK
      ?auto_177094 - BLOCK
      ?auto_177095 - BLOCK
    )
    :vars
    (
      ?auto_177100 - BLOCK
      ?auto_177097 - BLOCK
      ?auto_177096 - BLOCK
      ?auto_177099 - BLOCK
      ?auto_177098 - BLOCK
      ?auto_177101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177093 ?auto_177094 ) ) ( not ( = ?auto_177093 ?auto_177095 ) ) ( not ( = ?auto_177094 ?auto_177095 ) ) ( ON ?auto_177095 ?auto_177100 ) ( not ( = ?auto_177093 ?auto_177100 ) ) ( not ( = ?auto_177094 ?auto_177100 ) ) ( not ( = ?auto_177095 ?auto_177100 ) ) ( ON ?auto_177094 ?auto_177095 ) ( ON-TABLE ?auto_177097 ) ( ON ?auto_177096 ?auto_177097 ) ( ON ?auto_177099 ?auto_177096 ) ( ON ?auto_177098 ?auto_177099 ) ( ON ?auto_177100 ?auto_177098 ) ( not ( = ?auto_177097 ?auto_177096 ) ) ( not ( = ?auto_177097 ?auto_177099 ) ) ( not ( = ?auto_177097 ?auto_177098 ) ) ( not ( = ?auto_177097 ?auto_177100 ) ) ( not ( = ?auto_177097 ?auto_177095 ) ) ( not ( = ?auto_177097 ?auto_177094 ) ) ( not ( = ?auto_177096 ?auto_177099 ) ) ( not ( = ?auto_177096 ?auto_177098 ) ) ( not ( = ?auto_177096 ?auto_177100 ) ) ( not ( = ?auto_177096 ?auto_177095 ) ) ( not ( = ?auto_177096 ?auto_177094 ) ) ( not ( = ?auto_177099 ?auto_177098 ) ) ( not ( = ?auto_177099 ?auto_177100 ) ) ( not ( = ?auto_177099 ?auto_177095 ) ) ( not ( = ?auto_177099 ?auto_177094 ) ) ( not ( = ?auto_177098 ?auto_177100 ) ) ( not ( = ?auto_177098 ?auto_177095 ) ) ( not ( = ?auto_177098 ?auto_177094 ) ) ( not ( = ?auto_177093 ?auto_177097 ) ) ( not ( = ?auto_177093 ?auto_177096 ) ) ( not ( = ?auto_177093 ?auto_177099 ) ) ( not ( = ?auto_177093 ?auto_177098 ) ) ( CLEAR ?auto_177094 ) ( ON ?auto_177093 ?auto_177101 ) ( CLEAR ?auto_177093 ) ( HAND-EMPTY ) ( not ( = ?auto_177093 ?auto_177101 ) ) ( not ( = ?auto_177094 ?auto_177101 ) ) ( not ( = ?auto_177095 ?auto_177101 ) ) ( not ( = ?auto_177100 ?auto_177101 ) ) ( not ( = ?auto_177097 ?auto_177101 ) ) ( not ( = ?auto_177096 ?auto_177101 ) ) ( not ( = ?auto_177099 ?auto_177101 ) ) ( not ( = ?auto_177098 ?auto_177101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177093 ?auto_177101 )
      ( MAKE-3PILE ?auto_177093 ?auto_177094 ?auto_177095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177102 - BLOCK
      ?auto_177103 - BLOCK
      ?auto_177104 - BLOCK
    )
    :vars
    (
      ?auto_177106 - BLOCK
      ?auto_177108 - BLOCK
      ?auto_177109 - BLOCK
      ?auto_177105 - BLOCK
      ?auto_177110 - BLOCK
      ?auto_177107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177102 ?auto_177103 ) ) ( not ( = ?auto_177102 ?auto_177104 ) ) ( not ( = ?auto_177103 ?auto_177104 ) ) ( ON ?auto_177104 ?auto_177106 ) ( not ( = ?auto_177102 ?auto_177106 ) ) ( not ( = ?auto_177103 ?auto_177106 ) ) ( not ( = ?auto_177104 ?auto_177106 ) ) ( ON-TABLE ?auto_177108 ) ( ON ?auto_177109 ?auto_177108 ) ( ON ?auto_177105 ?auto_177109 ) ( ON ?auto_177110 ?auto_177105 ) ( ON ?auto_177106 ?auto_177110 ) ( not ( = ?auto_177108 ?auto_177109 ) ) ( not ( = ?auto_177108 ?auto_177105 ) ) ( not ( = ?auto_177108 ?auto_177110 ) ) ( not ( = ?auto_177108 ?auto_177106 ) ) ( not ( = ?auto_177108 ?auto_177104 ) ) ( not ( = ?auto_177108 ?auto_177103 ) ) ( not ( = ?auto_177109 ?auto_177105 ) ) ( not ( = ?auto_177109 ?auto_177110 ) ) ( not ( = ?auto_177109 ?auto_177106 ) ) ( not ( = ?auto_177109 ?auto_177104 ) ) ( not ( = ?auto_177109 ?auto_177103 ) ) ( not ( = ?auto_177105 ?auto_177110 ) ) ( not ( = ?auto_177105 ?auto_177106 ) ) ( not ( = ?auto_177105 ?auto_177104 ) ) ( not ( = ?auto_177105 ?auto_177103 ) ) ( not ( = ?auto_177110 ?auto_177106 ) ) ( not ( = ?auto_177110 ?auto_177104 ) ) ( not ( = ?auto_177110 ?auto_177103 ) ) ( not ( = ?auto_177102 ?auto_177108 ) ) ( not ( = ?auto_177102 ?auto_177109 ) ) ( not ( = ?auto_177102 ?auto_177105 ) ) ( not ( = ?auto_177102 ?auto_177110 ) ) ( ON ?auto_177102 ?auto_177107 ) ( CLEAR ?auto_177102 ) ( not ( = ?auto_177102 ?auto_177107 ) ) ( not ( = ?auto_177103 ?auto_177107 ) ) ( not ( = ?auto_177104 ?auto_177107 ) ) ( not ( = ?auto_177106 ?auto_177107 ) ) ( not ( = ?auto_177108 ?auto_177107 ) ) ( not ( = ?auto_177109 ?auto_177107 ) ) ( not ( = ?auto_177105 ?auto_177107 ) ) ( not ( = ?auto_177110 ?auto_177107 ) ) ( HOLDING ?auto_177103 ) ( CLEAR ?auto_177104 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177108 ?auto_177109 ?auto_177105 ?auto_177110 ?auto_177106 ?auto_177104 ?auto_177103 )
      ( MAKE-3PILE ?auto_177102 ?auto_177103 ?auto_177104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177111 - BLOCK
      ?auto_177112 - BLOCK
      ?auto_177113 - BLOCK
    )
    :vars
    (
      ?auto_177115 - BLOCK
      ?auto_177114 - BLOCK
      ?auto_177117 - BLOCK
      ?auto_177116 - BLOCK
      ?auto_177119 - BLOCK
      ?auto_177118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177111 ?auto_177112 ) ) ( not ( = ?auto_177111 ?auto_177113 ) ) ( not ( = ?auto_177112 ?auto_177113 ) ) ( ON ?auto_177113 ?auto_177115 ) ( not ( = ?auto_177111 ?auto_177115 ) ) ( not ( = ?auto_177112 ?auto_177115 ) ) ( not ( = ?auto_177113 ?auto_177115 ) ) ( ON-TABLE ?auto_177114 ) ( ON ?auto_177117 ?auto_177114 ) ( ON ?auto_177116 ?auto_177117 ) ( ON ?auto_177119 ?auto_177116 ) ( ON ?auto_177115 ?auto_177119 ) ( not ( = ?auto_177114 ?auto_177117 ) ) ( not ( = ?auto_177114 ?auto_177116 ) ) ( not ( = ?auto_177114 ?auto_177119 ) ) ( not ( = ?auto_177114 ?auto_177115 ) ) ( not ( = ?auto_177114 ?auto_177113 ) ) ( not ( = ?auto_177114 ?auto_177112 ) ) ( not ( = ?auto_177117 ?auto_177116 ) ) ( not ( = ?auto_177117 ?auto_177119 ) ) ( not ( = ?auto_177117 ?auto_177115 ) ) ( not ( = ?auto_177117 ?auto_177113 ) ) ( not ( = ?auto_177117 ?auto_177112 ) ) ( not ( = ?auto_177116 ?auto_177119 ) ) ( not ( = ?auto_177116 ?auto_177115 ) ) ( not ( = ?auto_177116 ?auto_177113 ) ) ( not ( = ?auto_177116 ?auto_177112 ) ) ( not ( = ?auto_177119 ?auto_177115 ) ) ( not ( = ?auto_177119 ?auto_177113 ) ) ( not ( = ?auto_177119 ?auto_177112 ) ) ( not ( = ?auto_177111 ?auto_177114 ) ) ( not ( = ?auto_177111 ?auto_177117 ) ) ( not ( = ?auto_177111 ?auto_177116 ) ) ( not ( = ?auto_177111 ?auto_177119 ) ) ( ON ?auto_177111 ?auto_177118 ) ( not ( = ?auto_177111 ?auto_177118 ) ) ( not ( = ?auto_177112 ?auto_177118 ) ) ( not ( = ?auto_177113 ?auto_177118 ) ) ( not ( = ?auto_177115 ?auto_177118 ) ) ( not ( = ?auto_177114 ?auto_177118 ) ) ( not ( = ?auto_177117 ?auto_177118 ) ) ( not ( = ?auto_177116 ?auto_177118 ) ) ( not ( = ?auto_177119 ?auto_177118 ) ) ( CLEAR ?auto_177113 ) ( ON ?auto_177112 ?auto_177111 ) ( CLEAR ?auto_177112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177118 ?auto_177111 )
      ( MAKE-3PILE ?auto_177111 ?auto_177112 ?auto_177113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177120 - BLOCK
      ?auto_177121 - BLOCK
      ?auto_177122 - BLOCK
    )
    :vars
    (
      ?auto_177125 - BLOCK
      ?auto_177124 - BLOCK
      ?auto_177123 - BLOCK
      ?auto_177127 - BLOCK
      ?auto_177128 - BLOCK
      ?auto_177126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177120 ?auto_177121 ) ) ( not ( = ?auto_177120 ?auto_177122 ) ) ( not ( = ?auto_177121 ?auto_177122 ) ) ( not ( = ?auto_177120 ?auto_177125 ) ) ( not ( = ?auto_177121 ?auto_177125 ) ) ( not ( = ?auto_177122 ?auto_177125 ) ) ( ON-TABLE ?auto_177124 ) ( ON ?auto_177123 ?auto_177124 ) ( ON ?auto_177127 ?auto_177123 ) ( ON ?auto_177128 ?auto_177127 ) ( ON ?auto_177125 ?auto_177128 ) ( not ( = ?auto_177124 ?auto_177123 ) ) ( not ( = ?auto_177124 ?auto_177127 ) ) ( not ( = ?auto_177124 ?auto_177128 ) ) ( not ( = ?auto_177124 ?auto_177125 ) ) ( not ( = ?auto_177124 ?auto_177122 ) ) ( not ( = ?auto_177124 ?auto_177121 ) ) ( not ( = ?auto_177123 ?auto_177127 ) ) ( not ( = ?auto_177123 ?auto_177128 ) ) ( not ( = ?auto_177123 ?auto_177125 ) ) ( not ( = ?auto_177123 ?auto_177122 ) ) ( not ( = ?auto_177123 ?auto_177121 ) ) ( not ( = ?auto_177127 ?auto_177128 ) ) ( not ( = ?auto_177127 ?auto_177125 ) ) ( not ( = ?auto_177127 ?auto_177122 ) ) ( not ( = ?auto_177127 ?auto_177121 ) ) ( not ( = ?auto_177128 ?auto_177125 ) ) ( not ( = ?auto_177128 ?auto_177122 ) ) ( not ( = ?auto_177128 ?auto_177121 ) ) ( not ( = ?auto_177120 ?auto_177124 ) ) ( not ( = ?auto_177120 ?auto_177123 ) ) ( not ( = ?auto_177120 ?auto_177127 ) ) ( not ( = ?auto_177120 ?auto_177128 ) ) ( ON ?auto_177120 ?auto_177126 ) ( not ( = ?auto_177120 ?auto_177126 ) ) ( not ( = ?auto_177121 ?auto_177126 ) ) ( not ( = ?auto_177122 ?auto_177126 ) ) ( not ( = ?auto_177125 ?auto_177126 ) ) ( not ( = ?auto_177124 ?auto_177126 ) ) ( not ( = ?auto_177123 ?auto_177126 ) ) ( not ( = ?auto_177127 ?auto_177126 ) ) ( not ( = ?auto_177128 ?auto_177126 ) ) ( ON ?auto_177121 ?auto_177120 ) ( CLEAR ?auto_177121 ) ( ON-TABLE ?auto_177126 ) ( HOLDING ?auto_177122 ) ( CLEAR ?auto_177125 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177124 ?auto_177123 ?auto_177127 ?auto_177128 ?auto_177125 ?auto_177122 )
      ( MAKE-3PILE ?auto_177120 ?auto_177121 ?auto_177122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177129 - BLOCK
      ?auto_177130 - BLOCK
      ?auto_177131 - BLOCK
    )
    :vars
    (
      ?auto_177135 - BLOCK
      ?auto_177132 - BLOCK
      ?auto_177136 - BLOCK
      ?auto_177134 - BLOCK
      ?auto_177133 - BLOCK
      ?auto_177137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177129 ?auto_177130 ) ) ( not ( = ?auto_177129 ?auto_177131 ) ) ( not ( = ?auto_177130 ?auto_177131 ) ) ( not ( = ?auto_177129 ?auto_177135 ) ) ( not ( = ?auto_177130 ?auto_177135 ) ) ( not ( = ?auto_177131 ?auto_177135 ) ) ( ON-TABLE ?auto_177132 ) ( ON ?auto_177136 ?auto_177132 ) ( ON ?auto_177134 ?auto_177136 ) ( ON ?auto_177133 ?auto_177134 ) ( ON ?auto_177135 ?auto_177133 ) ( not ( = ?auto_177132 ?auto_177136 ) ) ( not ( = ?auto_177132 ?auto_177134 ) ) ( not ( = ?auto_177132 ?auto_177133 ) ) ( not ( = ?auto_177132 ?auto_177135 ) ) ( not ( = ?auto_177132 ?auto_177131 ) ) ( not ( = ?auto_177132 ?auto_177130 ) ) ( not ( = ?auto_177136 ?auto_177134 ) ) ( not ( = ?auto_177136 ?auto_177133 ) ) ( not ( = ?auto_177136 ?auto_177135 ) ) ( not ( = ?auto_177136 ?auto_177131 ) ) ( not ( = ?auto_177136 ?auto_177130 ) ) ( not ( = ?auto_177134 ?auto_177133 ) ) ( not ( = ?auto_177134 ?auto_177135 ) ) ( not ( = ?auto_177134 ?auto_177131 ) ) ( not ( = ?auto_177134 ?auto_177130 ) ) ( not ( = ?auto_177133 ?auto_177135 ) ) ( not ( = ?auto_177133 ?auto_177131 ) ) ( not ( = ?auto_177133 ?auto_177130 ) ) ( not ( = ?auto_177129 ?auto_177132 ) ) ( not ( = ?auto_177129 ?auto_177136 ) ) ( not ( = ?auto_177129 ?auto_177134 ) ) ( not ( = ?auto_177129 ?auto_177133 ) ) ( ON ?auto_177129 ?auto_177137 ) ( not ( = ?auto_177129 ?auto_177137 ) ) ( not ( = ?auto_177130 ?auto_177137 ) ) ( not ( = ?auto_177131 ?auto_177137 ) ) ( not ( = ?auto_177135 ?auto_177137 ) ) ( not ( = ?auto_177132 ?auto_177137 ) ) ( not ( = ?auto_177136 ?auto_177137 ) ) ( not ( = ?auto_177134 ?auto_177137 ) ) ( not ( = ?auto_177133 ?auto_177137 ) ) ( ON ?auto_177130 ?auto_177129 ) ( ON-TABLE ?auto_177137 ) ( CLEAR ?auto_177135 ) ( ON ?auto_177131 ?auto_177130 ) ( CLEAR ?auto_177131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177137 ?auto_177129 ?auto_177130 )
      ( MAKE-3PILE ?auto_177129 ?auto_177130 ?auto_177131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177138 - BLOCK
      ?auto_177139 - BLOCK
      ?auto_177140 - BLOCK
    )
    :vars
    (
      ?auto_177142 - BLOCK
      ?auto_177141 - BLOCK
      ?auto_177143 - BLOCK
      ?auto_177144 - BLOCK
      ?auto_177145 - BLOCK
      ?auto_177146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177138 ?auto_177139 ) ) ( not ( = ?auto_177138 ?auto_177140 ) ) ( not ( = ?auto_177139 ?auto_177140 ) ) ( not ( = ?auto_177138 ?auto_177142 ) ) ( not ( = ?auto_177139 ?auto_177142 ) ) ( not ( = ?auto_177140 ?auto_177142 ) ) ( ON-TABLE ?auto_177141 ) ( ON ?auto_177143 ?auto_177141 ) ( ON ?auto_177144 ?auto_177143 ) ( ON ?auto_177145 ?auto_177144 ) ( not ( = ?auto_177141 ?auto_177143 ) ) ( not ( = ?auto_177141 ?auto_177144 ) ) ( not ( = ?auto_177141 ?auto_177145 ) ) ( not ( = ?auto_177141 ?auto_177142 ) ) ( not ( = ?auto_177141 ?auto_177140 ) ) ( not ( = ?auto_177141 ?auto_177139 ) ) ( not ( = ?auto_177143 ?auto_177144 ) ) ( not ( = ?auto_177143 ?auto_177145 ) ) ( not ( = ?auto_177143 ?auto_177142 ) ) ( not ( = ?auto_177143 ?auto_177140 ) ) ( not ( = ?auto_177143 ?auto_177139 ) ) ( not ( = ?auto_177144 ?auto_177145 ) ) ( not ( = ?auto_177144 ?auto_177142 ) ) ( not ( = ?auto_177144 ?auto_177140 ) ) ( not ( = ?auto_177144 ?auto_177139 ) ) ( not ( = ?auto_177145 ?auto_177142 ) ) ( not ( = ?auto_177145 ?auto_177140 ) ) ( not ( = ?auto_177145 ?auto_177139 ) ) ( not ( = ?auto_177138 ?auto_177141 ) ) ( not ( = ?auto_177138 ?auto_177143 ) ) ( not ( = ?auto_177138 ?auto_177144 ) ) ( not ( = ?auto_177138 ?auto_177145 ) ) ( ON ?auto_177138 ?auto_177146 ) ( not ( = ?auto_177138 ?auto_177146 ) ) ( not ( = ?auto_177139 ?auto_177146 ) ) ( not ( = ?auto_177140 ?auto_177146 ) ) ( not ( = ?auto_177142 ?auto_177146 ) ) ( not ( = ?auto_177141 ?auto_177146 ) ) ( not ( = ?auto_177143 ?auto_177146 ) ) ( not ( = ?auto_177144 ?auto_177146 ) ) ( not ( = ?auto_177145 ?auto_177146 ) ) ( ON ?auto_177139 ?auto_177138 ) ( ON-TABLE ?auto_177146 ) ( ON ?auto_177140 ?auto_177139 ) ( CLEAR ?auto_177140 ) ( HOLDING ?auto_177142 ) ( CLEAR ?auto_177145 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177141 ?auto_177143 ?auto_177144 ?auto_177145 ?auto_177142 )
      ( MAKE-3PILE ?auto_177138 ?auto_177139 ?auto_177140 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177147 - BLOCK
      ?auto_177148 - BLOCK
      ?auto_177149 - BLOCK
    )
    :vars
    (
      ?auto_177150 - BLOCK
      ?auto_177154 - BLOCK
      ?auto_177152 - BLOCK
      ?auto_177155 - BLOCK
      ?auto_177151 - BLOCK
      ?auto_177153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177147 ?auto_177148 ) ) ( not ( = ?auto_177147 ?auto_177149 ) ) ( not ( = ?auto_177148 ?auto_177149 ) ) ( not ( = ?auto_177147 ?auto_177150 ) ) ( not ( = ?auto_177148 ?auto_177150 ) ) ( not ( = ?auto_177149 ?auto_177150 ) ) ( ON-TABLE ?auto_177154 ) ( ON ?auto_177152 ?auto_177154 ) ( ON ?auto_177155 ?auto_177152 ) ( ON ?auto_177151 ?auto_177155 ) ( not ( = ?auto_177154 ?auto_177152 ) ) ( not ( = ?auto_177154 ?auto_177155 ) ) ( not ( = ?auto_177154 ?auto_177151 ) ) ( not ( = ?auto_177154 ?auto_177150 ) ) ( not ( = ?auto_177154 ?auto_177149 ) ) ( not ( = ?auto_177154 ?auto_177148 ) ) ( not ( = ?auto_177152 ?auto_177155 ) ) ( not ( = ?auto_177152 ?auto_177151 ) ) ( not ( = ?auto_177152 ?auto_177150 ) ) ( not ( = ?auto_177152 ?auto_177149 ) ) ( not ( = ?auto_177152 ?auto_177148 ) ) ( not ( = ?auto_177155 ?auto_177151 ) ) ( not ( = ?auto_177155 ?auto_177150 ) ) ( not ( = ?auto_177155 ?auto_177149 ) ) ( not ( = ?auto_177155 ?auto_177148 ) ) ( not ( = ?auto_177151 ?auto_177150 ) ) ( not ( = ?auto_177151 ?auto_177149 ) ) ( not ( = ?auto_177151 ?auto_177148 ) ) ( not ( = ?auto_177147 ?auto_177154 ) ) ( not ( = ?auto_177147 ?auto_177152 ) ) ( not ( = ?auto_177147 ?auto_177155 ) ) ( not ( = ?auto_177147 ?auto_177151 ) ) ( ON ?auto_177147 ?auto_177153 ) ( not ( = ?auto_177147 ?auto_177153 ) ) ( not ( = ?auto_177148 ?auto_177153 ) ) ( not ( = ?auto_177149 ?auto_177153 ) ) ( not ( = ?auto_177150 ?auto_177153 ) ) ( not ( = ?auto_177154 ?auto_177153 ) ) ( not ( = ?auto_177152 ?auto_177153 ) ) ( not ( = ?auto_177155 ?auto_177153 ) ) ( not ( = ?auto_177151 ?auto_177153 ) ) ( ON ?auto_177148 ?auto_177147 ) ( ON-TABLE ?auto_177153 ) ( ON ?auto_177149 ?auto_177148 ) ( CLEAR ?auto_177151 ) ( ON ?auto_177150 ?auto_177149 ) ( CLEAR ?auto_177150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177153 ?auto_177147 ?auto_177148 ?auto_177149 )
      ( MAKE-3PILE ?auto_177147 ?auto_177148 ?auto_177149 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177156 - BLOCK
      ?auto_177157 - BLOCK
      ?auto_177158 - BLOCK
    )
    :vars
    (
      ?auto_177164 - BLOCK
      ?auto_177159 - BLOCK
      ?auto_177160 - BLOCK
      ?auto_177162 - BLOCK
      ?auto_177161 - BLOCK
      ?auto_177163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177156 ?auto_177157 ) ) ( not ( = ?auto_177156 ?auto_177158 ) ) ( not ( = ?auto_177157 ?auto_177158 ) ) ( not ( = ?auto_177156 ?auto_177164 ) ) ( not ( = ?auto_177157 ?auto_177164 ) ) ( not ( = ?auto_177158 ?auto_177164 ) ) ( ON-TABLE ?auto_177159 ) ( ON ?auto_177160 ?auto_177159 ) ( ON ?auto_177162 ?auto_177160 ) ( not ( = ?auto_177159 ?auto_177160 ) ) ( not ( = ?auto_177159 ?auto_177162 ) ) ( not ( = ?auto_177159 ?auto_177161 ) ) ( not ( = ?auto_177159 ?auto_177164 ) ) ( not ( = ?auto_177159 ?auto_177158 ) ) ( not ( = ?auto_177159 ?auto_177157 ) ) ( not ( = ?auto_177160 ?auto_177162 ) ) ( not ( = ?auto_177160 ?auto_177161 ) ) ( not ( = ?auto_177160 ?auto_177164 ) ) ( not ( = ?auto_177160 ?auto_177158 ) ) ( not ( = ?auto_177160 ?auto_177157 ) ) ( not ( = ?auto_177162 ?auto_177161 ) ) ( not ( = ?auto_177162 ?auto_177164 ) ) ( not ( = ?auto_177162 ?auto_177158 ) ) ( not ( = ?auto_177162 ?auto_177157 ) ) ( not ( = ?auto_177161 ?auto_177164 ) ) ( not ( = ?auto_177161 ?auto_177158 ) ) ( not ( = ?auto_177161 ?auto_177157 ) ) ( not ( = ?auto_177156 ?auto_177159 ) ) ( not ( = ?auto_177156 ?auto_177160 ) ) ( not ( = ?auto_177156 ?auto_177162 ) ) ( not ( = ?auto_177156 ?auto_177161 ) ) ( ON ?auto_177156 ?auto_177163 ) ( not ( = ?auto_177156 ?auto_177163 ) ) ( not ( = ?auto_177157 ?auto_177163 ) ) ( not ( = ?auto_177158 ?auto_177163 ) ) ( not ( = ?auto_177164 ?auto_177163 ) ) ( not ( = ?auto_177159 ?auto_177163 ) ) ( not ( = ?auto_177160 ?auto_177163 ) ) ( not ( = ?auto_177162 ?auto_177163 ) ) ( not ( = ?auto_177161 ?auto_177163 ) ) ( ON ?auto_177157 ?auto_177156 ) ( ON-TABLE ?auto_177163 ) ( ON ?auto_177158 ?auto_177157 ) ( ON ?auto_177164 ?auto_177158 ) ( CLEAR ?auto_177164 ) ( HOLDING ?auto_177161 ) ( CLEAR ?auto_177162 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177159 ?auto_177160 ?auto_177162 ?auto_177161 )
      ( MAKE-3PILE ?auto_177156 ?auto_177157 ?auto_177158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177165 - BLOCK
      ?auto_177166 - BLOCK
      ?auto_177167 - BLOCK
    )
    :vars
    (
      ?auto_177171 - BLOCK
      ?auto_177170 - BLOCK
      ?auto_177173 - BLOCK
      ?auto_177169 - BLOCK
      ?auto_177172 - BLOCK
      ?auto_177168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177165 ?auto_177166 ) ) ( not ( = ?auto_177165 ?auto_177167 ) ) ( not ( = ?auto_177166 ?auto_177167 ) ) ( not ( = ?auto_177165 ?auto_177171 ) ) ( not ( = ?auto_177166 ?auto_177171 ) ) ( not ( = ?auto_177167 ?auto_177171 ) ) ( ON-TABLE ?auto_177170 ) ( ON ?auto_177173 ?auto_177170 ) ( ON ?auto_177169 ?auto_177173 ) ( not ( = ?auto_177170 ?auto_177173 ) ) ( not ( = ?auto_177170 ?auto_177169 ) ) ( not ( = ?auto_177170 ?auto_177172 ) ) ( not ( = ?auto_177170 ?auto_177171 ) ) ( not ( = ?auto_177170 ?auto_177167 ) ) ( not ( = ?auto_177170 ?auto_177166 ) ) ( not ( = ?auto_177173 ?auto_177169 ) ) ( not ( = ?auto_177173 ?auto_177172 ) ) ( not ( = ?auto_177173 ?auto_177171 ) ) ( not ( = ?auto_177173 ?auto_177167 ) ) ( not ( = ?auto_177173 ?auto_177166 ) ) ( not ( = ?auto_177169 ?auto_177172 ) ) ( not ( = ?auto_177169 ?auto_177171 ) ) ( not ( = ?auto_177169 ?auto_177167 ) ) ( not ( = ?auto_177169 ?auto_177166 ) ) ( not ( = ?auto_177172 ?auto_177171 ) ) ( not ( = ?auto_177172 ?auto_177167 ) ) ( not ( = ?auto_177172 ?auto_177166 ) ) ( not ( = ?auto_177165 ?auto_177170 ) ) ( not ( = ?auto_177165 ?auto_177173 ) ) ( not ( = ?auto_177165 ?auto_177169 ) ) ( not ( = ?auto_177165 ?auto_177172 ) ) ( ON ?auto_177165 ?auto_177168 ) ( not ( = ?auto_177165 ?auto_177168 ) ) ( not ( = ?auto_177166 ?auto_177168 ) ) ( not ( = ?auto_177167 ?auto_177168 ) ) ( not ( = ?auto_177171 ?auto_177168 ) ) ( not ( = ?auto_177170 ?auto_177168 ) ) ( not ( = ?auto_177173 ?auto_177168 ) ) ( not ( = ?auto_177169 ?auto_177168 ) ) ( not ( = ?auto_177172 ?auto_177168 ) ) ( ON ?auto_177166 ?auto_177165 ) ( ON-TABLE ?auto_177168 ) ( ON ?auto_177167 ?auto_177166 ) ( ON ?auto_177171 ?auto_177167 ) ( CLEAR ?auto_177169 ) ( ON ?auto_177172 ?auto_177171 ) ( CLEAR ?auto_177172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177168 ?auto_177165 ?auto_177166 ?auto_177167 ?auto_177171 )
      ( MAKE-3PILE ?auto_177165 ?auto_177166 ?auto_177167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177174 - BLOCK
      ?auto_177175 - BLOCK
      ?auto_177176 - BLOCK
    )
    :vars
    (
      ?auto_177181 - BLOCK
      ?auto_177182 - BLOCK
      ?auto_177178 - BLOCK
      ?auto_177179 - BLOCK
      ?auto_177180 - BLOCK
      ?auto_177177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177174 ?auto_177175 ) ) ( not ( = ?auto_177174 ?auto_177176 ) ) ( not ( = ?auto_177175 ?auto_177176 ) ) ( not ( = ?auto_177174 ?auto_177181 ) ) ( not ( = ?auto_177175 ?auto_177181 ) ) ( not ( = ?auto_177176 ?auto_177181 ) ) ( ON-TABLE ?auto_177182 ) ( ON ?auto_177178 ?auto_177182 ) ( not ( = ?auto_177182 ?auto_177178 ) ) ( not ( = ?auto_177182 ?auto_177179 ) ) ( not ( = ?auto_177182 ?auto_177180 ) ) ( not ( = ?auto_177182 ?auto_177181 ) ) ( not ( = ?auto_177182 ?auto_177176 ) ) ( not ( = ?auto_177182 ?auto_177175 ) ) ( not ( = ?auto_177178 ?auto_177179 ) ) ( not ( = ?auto_177178 ?auto_177180 ) ) ( not ( = ?auto_177178 ?auto_177181 ) ) ( not ( = ?auto_177178 ?auto_177176 ) ) ( not ( = ?auto_177178 ?auto_177175 ) ) ( not ( = ?auto_177179 ?auto_177180 ) ) ( not ( = ?auto_177179 ?auto_177181 ) ) ( not ( = ?auto_177179 ?auto_177176 ) ) ( not ( = ?auto_177179 ?auto_177175 ) ) ( not ( = ?auto_177180 ?auto_177181 ) ) ( not ( = ?auto_177180 ?auto_177176 ) ) ( not ( = ?auto_177180 ?auto_177175 ) ) ( not ( = ?auto_177174 ?auto_177182 ) ) ( not ( = ?auto_177174 ?auto_177178 ) ) ( not ( = ?auto_177174 ?auto_177179 ) ) ( not ( = ?auto_177174 ?auto_177180 ) ) ( ON ?auto_177174 ?auto_177177 ) ( not ( = ?auto_177174 ?auto_177177 ) ) ( not ( = ?auto_177175 ?auto_177177 ) ) ( not ( = ?auto_177176 ?auto_177177 ) ) ( not ( = ?auto_177181 ?auto_177177 ) ) ( not ( = ?auto_177182 ?auto_177177 ) ) ( not ( = ?auto_177178 ?auto_177177 ) ) ( not ( = ?auto_177179 ?auto_177177 ) ) ( not ( = ?auto_177180 ?auto_177177 ) ) ( ON ?auto_177175 ?auto_177174 ) ( ON-TABLE ?auto_177177 ) ( ON ?auto_177176 ?auto_177175 ) ( ON ?auto_177181 ?auto_177176 ) ( ON ?auto_177180 ?auto_177181 ) ( CLEAR ?auto_177180 ) ( HOLDING ?auto_177179 ) ( CLEAR ?auto_177178 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177182 ?auto_177178 ?auto_177179 )
      ( MAKE-3PILE ?auto_177174 ?auto_177175 ?auto_177176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177183 - BLOCK
      ?auto_177184 - BLOCK
      ?auto_177185 - BLOCK
    )
    :vars
    (
      ?auto_177187 - BLOCK
      ?auto_177189 - BLOCK
      ?auto_177190 - BLOCK
      ?auto_177188 - BLOCK
      ?auto_177191 - BLOCK
      ?auto_177186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177183 ?auto_177184 ) ) ( not ( = ?auto_177183 ?auto_177185 ) ) ( not ( = ?auto_177184 ?auto_177185 ) ) ( not ( = ?auto_177183 ?auto_177187 ) ) ( not ( = ?auto_177184 ?auto_177187 ) ) ( not ( = ?auto_177185 ?auto_177187 ) ) ( ON-TABLE ?auto_177189 ) ( ON ?auto_177190 ?auto_177189 ) ( not ( = ?auto_177189 ?auto_177190 ) ) ( not ( = ?auto_177189 ?auto_177188 ) ) ( not ( = ?auto_177189 ?auto_177191 ) ) ( not ( = ?auto_177189 ?auto_177187 ) ) ( not ( = ?auto_177189 ?auto_177185 ) ) ( not ( = ?auto_177189 ?auto_177184 ) ) ( not ( = ?auto_177190 ?auto_177188 ) ) ( not ( = ?auto_177190 ?auto_177191 ) ) ( not ( = ?auto_177190 ?auto_177187 ) ) ( not ( = ?auto_177190 ?auto_177185 ) ) ( not ( = ?auto_177190 ?auto_177184 ) ) ( not ( = ?auto_177188 ?auto_177191 ) ) ( not ( = ?auto_177188 ?auto_177187 ) ) ( not ( = ?auto_177188 ?auto_177185 ) ) ( not ( = ?auto_177188 ?auto_177184 ) ) ( not ( = ?auto_177191 ?auto_177187 ) ) ( not ( = ?auto_177191 ?auto_177185 ) ) ( not ( = ?auto_177191 ?auto_177184 ) ) ( not ( = ?auto_177183 ?auto_177189 ) ) ( not ( = ?auto_177183 ?auto_177190 ) ) ( not ( = ?auto_177183 ?auto_177188 ) ) ( not ( = ?auto_177183 ?auto_177191 ) ) ( ON ?auto_177183 ?auto_177186 ) ( not ( = ?auto_177183 ?auto_177186 ) ) ( not ( = ?auto_177184 ?auto_177186 ) ) ( not ( = ?auto_177185 ?auto_177186 ) ) ( not ( = ?auto_177187 ?auto_177186 ) ) ( not ( = ?auto_177189 ?auto_177186 ) ) ( not ( = ?auto_177190 ?auto_177186 ) ) ( not ( = ?auto_177188 ?auto_177186 ) ) ( not ( = ?auto_177191 ?auto_177186 ) ) ( ON ?auto_177184 ?auto_177183 ) ( ON-TABLE ?auto_177186 ) ( ON ?auto_177185 ?auto_177184 ) ( ON ?auto_177187 ?auto_177185 ) ( ON ?auto_177191 ?auto_177187 ) ( CLEAR ?auto_177190 ) ( ON ?auto_177188 ?auto_177191 ) ( CLEAR ?auto_177188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177186 ?auto_177183 ?auto_177184 ?auto_177185 ?auto_177187 ?auto_177191 )
      ( MAKE-3PILE ?auto_177183 ?auto_177184 ?auto_177185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177192 - BLOCK
      ?auto_177193 - BLOCK
      ?auto_177194 - BLOCK
    )
    :vars
    (
      ?auto_177198 - BLOCK
      ?auto_177200 - BLOCK
      ?auto_177199 - BLOCK
      ?auto_177197 - BLOCK
      ?auto_177195 - BLOCK
      ?auto_177196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177192 ?auto_177193 ) ) ( not ( = ?auto_177192 ?auto_177194 ) ) ( not ( = ?auto_177193 ?auto_177194 ) ) ( not ( = ?auto_177192 ?auto_177198 ) ) ( not ( = ?auto_177193 ?auto_177198 ) ) ( not ( = ?auto_177194 ?auto_177198 ) ) ( ON-TABLE ?auto_177200 ) ( not ( = ?auto_177200 ?auto_177199 ) ) ( not ( = ?auto_177200 ?auto_177197 ) ) ( not ( = ?auto_177200 ?auto_177195 ) ) ( not ( = ?auto_177200 ?auto_177198 ) ) ( not ( = ?auto_177200 ?auto_177194 ) ) ( not ( = ?auto_177200 ?auto_177193 ) ) ( not ( = ?auto_177199 ?auto_177197 ) ) ( not ( = ?auto_177199 ?auto_177195 ) ) ( not ( = ?auto_177199 ?auto_177198 ) ) ( not ( = ?auto_177199 ?auto_177194 ) ) ( not ( = ?auto_177199 ?auto_177193 ) ) ( not ( = ?auto_177197 ?auto_177195 ) ) ( not ( = ?auto_177197 ?auto_177198 ) ) ( not ( = ?auto_177197 ?auto_177194 ) ) ( not ( = ?auto_177197 ?auto_177193 ) ) ( not ( = ?auto_177195 ?auto_177198 ) ) ( not ( = ?auto_177195 ?auto_177194 ) ) ( not ( = ?auto_177195 ?auto_177193 ) ) ( not ( = ?auto_177192 ?auto_177200 ) ) ( not ( = ?auto_177192 ?auto_177199 ) ) ( not ( = ?auto_177192 ?auto_177197 ) ) ( not ( = ?auto_177192 ?auto_177195 ) ) ( ON ?auto_177192 ?auto_177196 ) ( not ( = ?auto_177192 ?auto_177196 ) ) ( not ( = ?auto_177193 ?auto_177196 ) ) ( not ( = ?auto_177194 ?auto_177196 ) ) ( not ( = ?auto_177198 ?auto_177196 ) ) ( not ( = ?auto_177200 ?auto_177196 ) ) ( not ( = ?auto_177199 ?auto_177196 ) ) ( not ( = ?auto_177197 ?auto_177196 ) ) ( not ( = ?auto_177195 ?auto_177196 ) ) ( ON ?auto_177193 ?auto_177192 ) ( ON-TABLE ?auto_177196 ) ( ON ?auto_177194 ?auto_177193 ) ( ON ?auto_177198 ?auto_177194 ) ( ON ?auto_177195 ?auto_177198 ) ( ON ?auto_177197 ?auto_177195 ) ( CLEAR ?auto_177197 ) ( HOLDING ?auto_177199 ) ( CLEAR ?auto_177200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177200 ?auto_177199 )
      ( MAKE-3PILE ?auto_177192 ?auto_177193 ?auto_177194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177201 - BLOCK
      ?auto_177202 - BLOCK
      ?auto_177203 - BLOCK
    )
    :vars
    (
      ?auto_177209 - BLOCK
      ?auto_177208 - BLOCK
      ?auto_177207 - BLOCK
      ?auto_177206 - BLOCK
      ?auto_177204 - BLOCK
      ?auto_177205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177201 ?auto_177202 ) ) ( not ( = ?auto_177201 ?auto_177203 ) ) ( not ( = ?auto_177202 ?auto_177203 ) ) ( not ( = ?auto_177201 ?auto_177209 ) ) ( not ( = ?auto_177202 ?auto_177209 ) ) ( not ( = ?auto_177203 ?auto_177209 ) ) ( ON-TABLE ?auto_177208 ) ( not ( = ?auto_177208 ?auto_177207 ) ) ( not ( = ?auto_177208 ?auto_177206 ) ) ( not ( = ?auto_177208 ?auto_177204 ) ) ( not ( = ?auto_177208 ?auto_177209 ) ) ( not ( = ?auto_177208 ?auto_177203 ) ) ( not ( = ?auto_177208 ?auto_177202 ) ) ( not ( = ?auto_177207 ?auto_177206 ) ) ( not ( = ?auto_177207 ?auto_177204 ) ) ( not ( = ?auto_177207 ?auto_177209 ) ) ( not ( = ?auto_177207 ?auto_177203 ) ) ( not ( = ?auto_177207 ?auto_177202 ) ) ( not ( = ?auto_177206 ?auto_177204 ) ) ( not ( = ?auto_177206 ?auto_177209 ) ) ( not ( = ?auto_177206 ?auto_177203 ) ) ( not ( = ?auto_177206 ?auto_177202 ) ) ( not ( = ?auto_177204 ?auto_177209 ) ) ( not ( = ?auto_177204 ?auto_177203 ) ) ( not ( = ?auto_177204 ?auto_177202 ) ) ( not ( = ?auto_177201 ?auto_177208 ) ) ( not ( = ?auto_177201 ?auto_177207 ) ) ( not ( = ?auto_177201 ?auto_177206 ) ) ( not ( = ?auto_177201 ?auto_177204 ) ) ( ON ?auto_177201 ?auto_177205 ) ( not ( = ?auto_177201 ?auto_177205 ) ) ( not ( = ?auto_177202 ?auto_177205 ) ) ( not ( = ?auto_177203 ?auto_177205 ) ) ( not ( = ?auto_177209 ?auto_177205 ) ) ( not ( = ?auto_177208 ?auto_177205 ) ) ( not ( = ?auto_177207 ?auto_177205 ) ) ( not ( = ?auto_177206 ?auto_177205 ) ) ( not ( = ?auto_177204 ?auto_177205 ) ) ( ON ?auto_177202 ?auto_177201 ) ( ON-TABLE ?auto_177205 ) ( ON ?auto_177203 ?auto_177202 ) ( ON ?auto_177209 ?auto_177203 ) ( ON ?auto_177204 ?auto_177209 ) ( ON ?auto_177206 ?auto_177204 ) ( CLEAR ?auto_177208 ) ( ON ?auto_177207 ?auto_177206 ) ( CLEAR ?auto_177207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177205 ?auto_177201 ?auto_177202 ?auto_177203 ?auto_177209 ?auto_177204 ?auto_177206 )
      ( MAKE-3PILE ?auto_177201 ?auto_177202 ?auto_177203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177210 - BLOCK
      ?auto_177211 - BLOCK
      ?auto_177212 - BLOCK
    )
    :vars
    (
      ?auto_177214 - BLOCK
      ?auto_177218 - BLOCK
      ?auto_177213 - BLOCK
      ?auto_177217 - BLOCK
      ?auto_177216 - BLOCK
      ?auto_177215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177210 ?auto_177211 ) ) ( not ( = ?auto_177210 ?auto_177212 ) ) ( not ( = ?auto_177211 ?auto_177212 ) ) ( not ( = ?auto_177210 ?auto_177214 ) ) ( not ( = ?auto_177211 ?auto_177214 ) ) ( not ( = ?auto_177212 ?auto_177214 ) ) ( not ( = ?auto_177218 ?auto_177213 ) ) ( not ( = ?auto_177218 ?auto_177217 ) ) ( not ( = ?auto_177218 ?auto_177216 ) ) ( not ( = ?auto_177218 ?auto_177214 ) ) ( not ( = ?auto_177218 ?auto_177212 ) ) ( not ( = ?auto_177218 ?auto_177211 ) ) ( not ( = ?auto_177213 ?auto_177217 ) ) ( not ( = ?auto_177213 ?auto_177216 ) ) ( not ( = ?auto_177213 ?auto_177214 ) ) ( not ( = ?auto_177213 ?auto_177212 ) ) ( not ( = ?auto_177213 ?auto_177211 ) ) ( not ( = ?auto_177217 ?auto_177216 ) ) ( not ( = ?auto_177217 ?auto_177214 ) ) ( not ( = ?auto_177217 ?auto_177212 ) ) ( not ( = ?auto_177217 ?auto_177211 ) ) ( not ( = ?auto_177216 ?auto_177214 ) ) ( not ( = ?auto_177216 ?auto_177212 ) ) ( not ( = ?auto_177216 ?auto_177211 ) ) ( not ( = ?auto_177210 ?auto_177218 ) ) ( not ( = ?auto_177210 ?auto_177213 ) ) ( not ( = ?auto_177210 ?auto_177217 ) ) ( not ( = ?auto_177210 ?auto_177216 ) ) ( ON ?auto_177210 ?auto_177215 ) ( not ( = ?auto_177210 ?auto_177215 ) ) ( not ( = ?auto_177211 ?auto_177215 ) ) ( not ( = ?auto_177212 ?auto_177215 ) ) ( not ( = ?auto_177214 ?auto_177215 ) ) ( not ( = ?auto_177218 ?auto_177215 ) ) ( not ( = ?auto_177213 ?auto_177215 ) ) ( not ( = ?auto_177217 ?auto_177215 ) ) ( not ( = ?auto_177216 ?auto_177215 ) ) ( ON ?auto_177211 ?auto_177210 ) ( ON-TABLE ?auto_177215 ) ( ON ?auto_177212 ?auto_177211 ) ( ON ?auto_177214 ?auto_177212 ) ( ON ?auto_177216 ?auto_177214 ) ( ON ?auto_177217 ?auto_177216 ) ( ON ?auto_177213 ?auto_177217 ) ( CLEAR ?auto_177213 ) ( HOLDING ?auto_177218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177218 )
      ( MAKE-3PILE ?auto_177210 ?auto_177211 ?auto_177212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177219 - BLOCK
      ?auto_177220 - BLOCK
      ?auto_177221 - BLOCK
    )
    :vars
    (
      ?auto_177226 - BLOCK
      ?auto_177222 - BLOCK
      ?auto_177227 - BLOCK
      ?auto_177223 - BLOCK
      ?auto_177225 - BLOCK
      ?auto_177224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177219 ?auto_177220 ) ) ( not ( = ?auto_177219 ?auto_177221 ) ) ( not ( = ?auto_177220 ?auto_177221 ) ) ( not ( = ?auto_177219 ?auto_177226 ) ) ( not ( = ?auto_177220 ?auto_177226 ) ) ( not ( = ?auto_177221 ?auto_177226 ) ) ( not ( = ?auto_177222 ?auto_177227 ) ) ( not ( = ?auto_177222 ?auto_177223 ) ) ( not ( = ?auto_177222 ?auto_177225 ) ) ( not ( = ?auto_177222 ?auto_177226 ) ) ( not ( = ?auto_177222 ?auto_177221 ) ) ( not ( = ?auto_177222 ?auto_177220 ) ) ( not ( = ?auto_177227 ?auto_177223 ) ) ( not ( = ?auto_177227 ?auto_177225 ) ) ( not ( = ?auto_177227 ?auto_177226 ) ) ( not ( = ?auto_177227 ?auto_177221 ) ) ( not ( = ?auto_177227 ?auto_177220 ) ) ( not ( = ?auto_177223 ?auto_177225 ) ) ( not ( = ?auto_177223 ?auto_177226 ) ) ( not ( = ?auto_177223 ?auto_177221 ) ) ( not ( = ?auto_177223 ?auto_177220 ) ) ( not ( = ?auto_177225 ?auto_177226 ) ) ( not ( = ?auto_177225 ?auto_177221 ) ) ( not ( = ?auto_177225 ?auto_177220 ) ) ( not ( = ?auto_177219 ?auto_177222 ) ) ( not ( = ?auto_177219 ?auto_177227 ) ) ( not ( = ?auto_177219 ?auto_177223 ) ) ( not ( = ?auto_177219 ?auto_177225 ) ) ( ON ?auto_177219 ?auto_177224 ) ( not ( = ?auto_177219 ?auto_177224 ) ) ( not ( = ?auto_177220 ?auto_177224 ) ) ( not ( = ?auto_177221 ?auto_177224 ) ) ( not ( = ?auto_177226 ?auto_177224 ) ) ( not ( = ?auto_177222 ?auto_177224 ) ) ( not ( = ?auto_177227 ?auto_177224 ) ) ( not ( = ?auto_177223 ?auto_177224 ) ) ( not ( = ?auto_177225 ?auto_177224 ) ) ( ON ?auto_177220 ?auto_177219 ) ( ON-TABLE ?auto_177224 ) ( ON ?auto_177221 ?auto_177220 ) ( ON ?auto_177226 ?auto_177221 ) ( ON ?auto_177225 ?auto_177226 ) ( ON ?auto_177223 ?auto_177225 ) ( ON ?auto_177227 ?auto_177223 ) ( ON ?auto_177222 ?auto_177227 ) ( CLEAR ?auto_177222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177224 ?auto_177219 ?auto_177220 ?auto_177221 ?auto_177226 ?auto_177225 ?auto_177223 ?auto_177227 )
      ( MAKE-3PILE ?auto_177219 ?auto_177220 ?auto_177221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177232 - BLOCK
      ?auto_177233 - BLOCK
      ?auto_177234 - BLOCK
      ?auto_177235 - BLOCK
    )
    :vars
    (
      ?auto_177236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177236 ?auto_177235 ) ( CLEAR ?auto_177236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177232 ) ( ON ?auto_177233 ?auto_177232 ) ( ON ?auto_177234 ?auto_177233 ) ( ON ?auto_177235 ?auto_177234 ) ( not ( = ?auto_177232 ?auto_177233 ) ) ( not ( = ?auto_177232 ?auto_177234 ) ) ( not ( = ?auto_177232 ?auto_177235 ) ) ( not ( = ?auto_177232 ?auto_177236 ) ) ( not ( = ?auto_177233 ?auto_177234 ) ) ( not ( = ?auto_177233 ?auto_177235 ) ) ( not ( = ?auto_177233 ?auto_177236 ) ) ( not ( = ?auto_177234 ?auto_177235 ) ) ( not ( = ?auto_177234 ?auto_177236 ) ) ( not ( = ?auto_177235 ?auto_177236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177236 ?auto_177235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177237 - BLOCK
      ?auto_177238 - BLOCK
      ?auto_177239 - BLOCK
      ?auto_177240 - BLOCK
    )
    :vars
    (
      ?auto_177241 - BLOCK
      ?auto_177242 - BLOCK
      ?auto_177243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177241 ?auto_177240 ) ( CLEAR ?auto_177241 ) ( ON-TABLE ?auto_177237 ) ( ON ?auto_177238 ?auto_177237 ) ( ON ?auto_177239 ?auto_177238 ) ( ON ?auto_177240 ?auto_177239 ) ( not ( = ?auto_177237 ?auto_177238 ) ) ( not ( = ?auto_177237 ?auto_177239 ) ) ( not ( = ?auto_177237 ?auto_177240 ) ) ( not ( = ?auto_177237 ?auto_177241 ) ) ( not ( = ?auto_177238 ?auto_177239 ) ) ( not ( = ?auto_177238 ?auto_177240 ) ) ( not ( = ?auto_177238 ?auto_177241 ) ) ( not ( = ?auto_177239 ?auto_177240 ) ) ( not ( = ?auto_177239 ?auto_177241 ) ) ( not ( = ?auto_177240 ?auto_177241 ) ) ( HOLDING ?auto_177242 ) ( CLEAR ?auto_177243 ) ( not ( = ?auto_177237 ?auto_177242 ) ) ( not ( = ?auto_177237 ?auto_177243 ) ) ( not ( = ?auto_177238 ?auto_177242 ) ) ( not ( = ?auto_177238 ?auto_177243 ) ) ( not ( = ?auto_177239 ?auto_177242 ) ) ( not ( = ?auto_177239 ?auto_177243 ) ) ( not ( = ?auto_177240 ?auto_177242 ) ) ( not ( = ?auto_177240 ?auto_177243 ) ) ( not ( = ?auto_177241 ?auto_177242 ) ) ( not ( = ?auto_177241 ?auto_177243 ) ) ( not ( = ?auto_177242 ?auto_177243 ) ) )
    :subtasks
    ( ( !STACK ?auto_177242 ?auto_177243 )
      ( MAKE-4PILE ?auto_177237 ?auto_177238 ?auto_177239 ?auto_177240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177244 - BLOCK
      ?auto_177245 - BLOCK
      ?auto_177246 - BLOCK
      ?auto_177247 - BLOCK
    )
    :vars
    (
      ?auto_177250 - BLOCK
      ?auto_177248 - BLOCK
      ?auto_177249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177250 ?auto_177247 ) ( ON-TABLE ?auto_177244 ) ( ON ?auto_177245 ?auto_177244 ) ( ON ?auto_177246 ?auto_177245 ) ( ON ?auto_177247 ?auto_177246 ) ( not ( = ?auto_177244 ?auto_177245 ) ) ( not ( = ?auto_177244 ?auto_177246 ) ) ( not ( = ?auto_177244 ?auto_177247 ) ) ( not ( = ?auto_177244 ?auto_177250 ) ) ( not ( = ?auto_177245 ?auto_177246 ) ) ( not ( = ?auto_177245 ?auto_177247 ) ) ( not ( = ?auto_177245 ?auto_177250 ) ) ( not ( = ?auto_177246 ?auto_177247 ) ) ( not ( = ?auto_177246 ?auto_177250 ) ) ( not ( = ?auto_177247 ?auto_177250 ) ) ( CLEAR ?auto_177248 ) ( not ( = ?auto_177244 ?auto_177249 ) ) ( not ( = ?auto_177244 ?auto_177248 ) ) ( not ( = ?auto_177245 ?auto_177249 ) ) ( not ( = ?auto_177245 ?auto_177248 ) ) ( not ( = ?auto_177246 ?auto_177249 ) ) ( not ( = ?auto_177246 ?auto_177248 ) ) ( not ( = ?auto_177247 ?auto_177249 ) ) ( not ( = ?auto_177247 ?auto_177248 ) ) ( not ( = ?auto_177250 ?auto_177249 ) ) ( not ( = ?auto_177250 ?auto_177248 ) ) ( not ( = ?auto_177249 ?auto_177248 ) ) ( ON ?auto_177249 ?auto_177250 ) ( CLEAR ?auto_177249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177244 ?auto_177245 ?auto_177246 ?auto_177247 ?auto_177250 )
      ( MAKE-4PILE ?auto_177244 ?auto_177245 ?auto_177246 ?auto_177247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177251 - BLOCK
      ?auto_177252 - BLOCK
      ?auto_177253 - BLOCK
      ?auto_177254 - BLOCK
    )
    :vars
    (
      ?auto_177256 - BLOCK
      ?auto_177255 - BLOCK
      ?auto_177257 - BLOCK
      ?auto_177258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177256 ?auto_177254 ) ( ON-TABLE ?auto_177251 ) ( ON ?auto_177252 ?auto_177251 ) ( ON ?auto_177253 ?auto_177252 ) ( ON ?auto_177254 ?auto_177253 ) ( not ( = ?auto_177251 ?auto_177252 ) ) ( not ( = ?auto_177251 ?auto_177253 ) ) ( not ( = ?auto_177251 ?auto_177254 ) ) ( not ( = ?auto_177251 ?auto_177256 ) ) ( not ( = ?auto_177252 ?auto_177253 ) ) ( not ( = ?auto_177252 ?auto_177254 ) ) ( not ( = ?auto_177252 ?auto_177256 ) ) ( not ( = ?auto_177253 ?auto_177254 ) ) ( not ( = ?auto_177253 ?auto_177256 ) ) ( not ( = ?auto_177254 ?auto_177256 ) ) ( not ( = ?auto_177251 ?auto_177255 ) ) ( not ( = ?auto_177251 ?auto_177257 ) ) ( not ( = ?auto_177252 ?auto_177255 ) ) ( not ( = ?auto_177252 ?auto_177257 ) ) ( not ( = ?auto_177253 ?auto_177255 ) ) ( not ( = ?auto_177253 ?auto_177257 ) ) ( not ( = ?auto_177254 ?auto_177255 ) ) ( not ( = ?auto_177254 ?auto_177257 ) ) ( not ( = ?auto_177256 ?auto_177255 ) ) ( not ( = ?auto_177256 ?auto_177257 ) ) ( not ( = ?auto_177255 ?auto_177257 ) ) ( ON ?auto_177255 ?auto_177256 ) ( CLEAR ?auto_177255 ) ( HOLDING ?auto_177257 ) ( CLEAR ?auto_177258 ) ( ON-TABLE ?auto_177258 ) ( not ( = ?auto_177258 ?auto_177257 ) ) ( not ( = ?auto_177251 ?auto_177258 ) ) ( not ( = ?auto_177252 ?auto_177258 ) ) ( not ( = ?auto_177253 ?auto_177258 ) ) ( not ( = ?auto_177254 ?auto_177258 ) ) ( not ( = ?auto_177256 ?auto_177258 ) ) ( not ( = ?auto_177255 ?auto_177258 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177258 ?auto_177257 )
      ( MAKE-4PILE ?auto_177251 ?auto_177252 ?auto_177253 ?auto_177254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177259 - BLOCK
      ?auto_177260 - BLOCK
      ?auto_177261 - BLOCK
      ?auto_177262 - BLOCK
    )
    :vars
    (
      ?auto_177265 - BLOCK
      ?auto_177263 - BLOCK
      ?auto_177264 - BLOCK
      ?auto_177266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177265 ?auto_177262 ) ( ON-TABLE ?auto_177259 ) ( ON ?auto_177260 ?auto_177259 ) ( ON ?auto_177261 ?auto_177260 ) ( ON ?auto_177262 ?auto_177261 ) ( not ( = ?auto_177259 ?auto_177260 ) ) ( not ( = ?auto_177259 ?auto_177261 ) ) ( not ( = ?auto_177259 ?auto_177262 ) ) ( not ( = ?auto_177259 ?auto_177265 ) ) ( not ( = ?auto_177260 ?auto_177261 ) ) ( not ( = ?auto_177260 ?auto_177262 ) ) ( not ( = ?auto_177260 ?auto_177265 ) ) ( not ( = ?auto_177261 ?auto_177262 ) ) ( not ( = ?auto_177261 ?auto_177265 ) ) ( not ( = ?auto_177262 ?auto_177265 ) ) ( not ( = ?auto_177259 ?auto_177263 ) ) ( not ( = ?auto_177259 ?auto_177264 ) ) ( not ( = ?auto_177260 ?auto_177263 ) ) ( not ( = ?auto_177260 ?auto_177264 ) ) ( not ( = ?auto_177261 ?auto_177263 ) ) ( not ( = ?auto_177261 ?auto_177264 ) ) ( not ( = ?auto_177262 ?auto_177263 ) ) ( not ( = ?auto_177262 ?auto_177264 ) ) ( not ( = ?auto_177265 ?auto_177263 ) ) ( not ( = ?auto_177265 ?auto_177264 ) ) ( not ( = ?auto_177263 ?auto_177264 ) ) ( ON ?auto_177263 ?auto_177265 ) ( CLEAR ?auto_177266 ) ( ON-TABLE ?auto_177266 ) ( not ( = ?auto_177266 ?auto_177264 ) ) ( not ( = ?auto_177259 ?auto_177266 ) ) ( not ( = ?auto_177260 ?auto_177266 ) ) ( not ( = ?auto_177261 ?auto_177266 ) ) ( not ( = ?auto_177262 ?auto_177266 ) ) ( not ( = ?auto_177265 ?auto_177266 ) ) ( not ( = ?auto_177263 ?auto_177266 ) ) ( ON ?auto_177264 ?auto_177263 ) ( CLEAR ?auto_177264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177259 ?auto_177260 ?auto_177261 ?auto_177262 ?auto_177265 ?auto_177263 )
      ( MAKE-4PILE ?auto_177259 ?auto_177260 ?auto_177261 ?auto_177262 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177267 - BLOCK
      ?auto_177268 - BLOCK
      ?auto_177269 - BLOCK
      ?auto_177270 - BLOCK
    )
    :vars
    (
      ?auto_177272 - BLOCK
      ?auto_177271 - BLOCK
      ?auto_177273 - BLOCK
      ?auto_177274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177272 ?auto_177270 ) ( ON-TABLE ?auto_177267 ) ( ON ?auto_177268 ?auto_177267 ) ( ON ?auto_177269 ?auto_177268 ) ( ON ?auto_177270 ?auto_177269 ) ( not ( = ?auto_177267 ?auto_177268 ) ) ( not ( = ?auto_177267 ?auto_177269 ) ) ( not ( = ?auto_177267 ?auto_177270 ) ) ( not ( = ?auto_177267 ?auto_177272 ) ) ( not ( = ?auto_177268 ?auto_177269 ) ) ( not ( = ?auto_177268 ?auto_177270 ) ) ( not ( = ?auto_177268 ?auto_177272 ) ) ( not ( = ?auto_177269 ?auto_177270 ) ) ( not ( = ?auto_177269 ?auto_177272 ) ) ( not ( = ?auto_177270 ?auto_177272 ) ) ( not ( = ?auto_177267 ?auto_177271 ) ) ( not ( = ?auto_177267 ?auto_177273 ) ) ( not ( = ?auto_177268 ?auto_177271 ) ) ( not ( = ?auto_177268 ?auto_177273 ) ) ( not ( = ?auto_177269 ?auto_177271 ) ) ( not ( = ?auto_177269 ?auto_177273 ) ) ( not ( = ?auto_177270 ?auto_177271 ) ) ( not ( = ?auto_177270 ?auto_177273 ) ) ( not ( = ?auto_177272 ?auto_177271 ) ) ( not ( = ?auto_177272 ?auto_177273 ) ) ( not ( = ?auto_177271 ?auto_177273 ) ) ( ON ?auto_177271 ?auto_177272 ) ( not ( = ?auto_177274 ?auto_177273 ) ) ( not ( = ?auto_177267 ?auto_177274 ) ) ( not ( = ?auto_177268 ?auto_177274 ) ) ( not ( = ?auto_177269 ?auto_177274 ) ) ( not ( = ?auto_177270 ?auto_177274 ) ) ( not ( = ?auto_177272 ?auto_177274 ) ) ( not ( = ?auto_177271 ?auto_177274 ) ) ( ON ?auto_177273 ?auto_177271 ) ( CLEAR ?auto_177273 ) ( HOLDING ?auto_177274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177274 )
      ( MAKE-4PILE ?auto_177267 ?auto_177268 ?auto_177269 ?auto_177270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177275 - BLOCK
      ?auto_177276 - BLOCK
      ?auto_177277 - BLOCK
      ?auto_177278 - BLOCK
    )
    :vars
    (
      ?auto_177281 - BLOCK
      ?auto_177280 - BLOCK
      ?auto_177279 - BLOCK
      ?auto_177282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177281 ?auto_177278 ) ( ON-TABLE ?auto_177275 ) ( ON ?auto_177276 ?auto_177275 ) ( ON ?auto_177277 ?auto_177276 ) ( ON ?auto_177278 ?auto_177277 ) ( not ( = ?auto_177275 ?auto_177276 ) ) ( not ( = ?auto_177275 ?auto_177277 ) ) ( not ( = ?auto_177275 ?auto_177278 ) ) ( not ( = ?auto_177275 ?auto_177281 ) ) ( not ( = ?auto_177276 ?auto_177277 ) ) ( not ( = ?auto_177276 ?auto_177278 ) ) ( not ( = ?auto_177276 ?auto_177281 ) ) ( not ( = ?auto_177277 ?auto_177278 ) ) ( not ( = ?auto_177277 ?auto_177281 ) ) ( not ( = ?auto_177278 ?auto_177281 ) ) ( not ( = ?auto_177275 ?auto_177280 ) ) ( not ( = ?auto_177275 ?auto_177279 ) ) ( not ( = ?auto_177276 ?auto_177280 ) ) ( not ( = ?auto_177276 ?auto_177279 ) ) ( not ( = ?auto_177277 ?auto_177280 ) ) ( not ( = ?auto_177277 ?auto_177279 ) ) ( not ( = ?auto_177278 ?auto_177280 ) ) ( not ( = ?auto_177278 ?auto_177279 ) ) ( not ( = ?auto_177281 ?auto_177280 ) ) ( not ( = ?auto_177281 ?auto_177279 ) ) ( not ( = ?auto_177280 ?auto_177279 ) ) ( ON ?auto_177280 ?auto_177281 ) ( not ( = ?auto_177282 ?auto_177279 ) ) ( not ( = ?auto_177275 ?auto_177282 ) ) ( not ( = ?auto_177276 ?auto_177282 ) ) ( not ( = ?auto_177277 ?auto_177282 ) ) ( not ( = ?auto_177278 ?auto_177282 ) ) ( not ( = ?auto_177281 ?auto_177282 ) ) ( not ( = ?auto_177280 ?auto_177282 ) ) ( ON ?auto_177279 ?auto_177280 ) ( ON ?auto_177282 ?auto_177279 ) ( CLEAR ?auto_177282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177275 ?auto_177276 ?auto_177277 ?auto_177278 ?auto_177281 ?auto_177280 ?auto_177279 )
      ( MAKE-4PILE ?auto_177275 ?auto_177276 ?auto_177277 ?auto_177278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177283 - BLOCK
      ?auto_177284 - BLOCK
      ?auto_177285 - BLOCK
      ?auto_177286 - BLOCK
    )
    :vars
    (
      ?auto_177288 - BLOCK
      ?auto_177287 - BLOCK
      ?auto_177289 - BLOCK
      ?auto_177290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177288 ?auto_177286 ) ( ON-TABLE ?auto_177283 ) ( ON ?auto_177284 ?auto_177283 ) ( ON ?auto_177285 ?auto_177284 ) ( ON ?auto_177286 ?auto_177285 ) ( not ( = ?auto_177283 ?auto_177284 ) ) ( not ( = ?auto_177283 ?auto_177285 ) ) ( not ( = ?auto_177283 ?auto_177286 ) ) ( not ( = ?auto_177283 ?auto_177288 ) ) ( not ( = ?auto_177284 ?auto_177285 ) ) ( not ( = ?auto_177284 ?auto_177286 ) ) ( not ( = ?auto_177284 ?auto_177288 ) ) ( not ( = ?auto_177285 ?auto_177286 ) ) ( not ( = ?auto_177285 ?auto_177288 ) ) ( not ( = ?auto_177286 ?auto_177288 ) ) ( not ( = ?auto_177283 ?auto_177287 ) ) ( not ( = ?auto_177283 ?auto_177289 ) ) ( not ( = ?auto_177284 ?auto_177287 ) ) ( not ( = ?auto_177284 ?auto_177289 ) ) ( not ( = ?auto_177285 ?auto_177287 ) ) ( not ( = ?auto_177285 ?auto_177289 ) ) ( not ( = ?auto_177286 ?auto_177287 ) ) ( not ( = ?auto_177286 ?auto_177289 ) ) ( not ( = ?auto_177288 ?auto_177287 ) ) ( not ( = ?auto_177288 ?auto_177289 ) ) ( not ( = ?auto_177287 ?auto_177289 ) ) ( ON ?auto_177287 ?auto_177288 ) ( not ( = ?auto_177290 ?auto_177289 ) ) ( not ( = ?auto_177283 ?auto_177290 ) ) ( not ( = ?auto_177284 ?auto_177290 ) ) ( not ( = ?auto_177285 ?auto_177290 ) ) ( not ( = ?auto_177286 ?auto_177290 ) ) ( not ( = ?auto_177288 ?auto_177290 ) ) ( not ( = ?auto_177287 ?auto_177290 ) ) ( ON ?auto_177289 ?auto_177287 ) ( HOLDING ?auto_177290 ) ( CLEAR ?auto_177289 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177283 ?auto_177284 ?auto_177285 ?auto_177286 ?auto_177288 ?auto_177287 ?auto_177289 ?auto_177290 )
      ( MAKE-4PILE ?auto_177283 ?auto_177284 ?auto_177285 ?auto_177286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177291 - BLOCK
      ?auto_177292 - BLOCK
      ?auto_177293 - BLOCK
      ?auto_177294 - BLOCK
    )
    :vars
    (
      ?auto_177295 - BLOCK
      ?auto_177298 - BLOCK
      ?auto_177296 - BLOCK
      ?auto_177297 - BLOCK
      ?auto_177299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177295 ?auto_177294 ) ( ON-TABLE ?auto_177291 ) ( ON ?auto_177292 ?auto_177291 ) ( ON ?auto_177293 ?auto_177292 ) ( ON ?auto_177294 ?auto_177293 ) ( not ( = ?auto_177291 ?auto_177292 ) ) ( not ( = ?auto_177291 ?auto_177293 ) ) ( not ( = ?auto_177291 ?auto_177294 ) ) ( not ( = ?auto_177291 ?auto_177295 ) ) ( not ( = ?auto_177292 ?auto_177293 ) ) ( not ( = ?auto_177292 ?auto_177294 ) ) ( not ( = ?auto_177292 ?auto_177295 ) ) ( not ( = ?auto_177293 ?auto_177294 ) ) ( not ( = ?auto_177293 ?auto_177295 ) ) ( not ( = ?auto_177294 ?auto_177295 ) ) ( not ( = ?auto_177291 ?auto_177298 ) ) ( not ( = ?auto_177291 ?auto_177296 ) ) ( not ( = ?auto_177292 ?auto_177298 ) ) ( not ( = ?auto_177292 ?auto_177296 ) ) ( not ( = ?auto_177293 ?auto_177298 ) ) ( not ( = ?auto_177293 ?auto_177296 ) ) ( not ( = ?auto_177294 ?auto_177298 ) ) ( not ( = ?auto_177294 ?auto_177296 ) ) ( not ( = ?auto_177295 ?auto_177298 ) ) ( not ( = ?auto_177295 ?auto_177296 ) ) ( not ( = ?auto_177298 ?auto_177296 ) ) ( ON ?auto_177298 ?auto_177295 ) ( not ( = ?auto_177297 ?auto_177296 ) ) ( not ( = ?auto_177291 ?auto_177297 ) ) ( not ( = ?auto_177292 ?auto_177297 ) ) ( not ( = ?auto_177293 ?auto_177297 ) ) ( not ( = ?auto_177294 ?auto_177297 ) ) ( not ( = ?auto_177295 ?auto_177297 ) ) ( not ( = ?auto_177298 ?auto_177297 ) ) ( ON ?auto_177296 ?auto_177298 ) ( CLEAR ?auto_177296 ) ( ON ?auto_177297 ?auto_177299 ) ( CLEAR ?auto_177297 ) ( HAND-EMPTY ) ( not ( = ?auto_177291 ?auto_177299 ) ) ( not ( = ?auto_177292 ?auto_177299 ) ) ( not ( = ?auto_177293 ?auto_177299 ) ) ( not ( = ?auto_177294 ?auto_177299 ) ) ( not ( = ?auto_177295 ?auto_177299 ) ) ( not ( = ?auto_177298 ?auto_177299 ) ) ( not ( = ?auto_177296 ?auto_177299 ) ) ( not ( = ?auto_177297 ?auto_177299 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177297 ?auto_177299 )
      ( MAKE-4PILE ?auto_177291 ?auto_177292 ?auto_177293 ?auto_177294 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177300 - BLOCK
      ?auto_177301 - BLOCK
      ?auto_177302 - BLOCK
      ?auto_177303 - BLOCK
    )
    :vars
    (
      ?auto_177308 - BLOCK
      ?auto_177305 - BLOCK
      ?auto_177304 - BLOCK
      ?auto_177306 - BLOCK
      ?auto_177307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177308 ?auto_177303 ) ( ON-TABLE ?auto_177300 ) ( ON ?auto_177301 ?auto_177300 ) ( ON ?auto_177302 ?auto_177301 ) ( ON ?auto_177303 ?auto_177302 ) ( not ( = ?auto_177300 ?auto_177301 ) ) ( not ( = ?auto_177300 ?auto_177302 ) ) ( not ( = ?auto_177300 ?auto_177303 ) ) ( not ( = ?auto_177300 ?auto_177308 ) ) ( not ( = ?auto_177301 ?auto_177302 ) ) ( not ( = ?auto_177301 ?auto_177303 ) ) ( not ( = ?auto_177301 ?auto_177308 ) ) ( not ( = ?auto_177302 ?auto_177303 ) ) ( not ( = ?auto_177302 ?auto_177308 ) ) ( not ( = ?auto_177303 ?auto_177308 ) ) ( not ( = ?auto_177300 ?auto_177305 ) ) ( not ( = ?auto_177300 ?auto_177304 ) ) ( not ( = ?auto_177301 ?auto_177305 ) ) ( not ( = ?auto_177301 ?auto_177304 ) ) ( not ( = ?auto_177302 ?auto_177305 ) ) ( not ( = ?auto_177302 ?auto_177304 ) ) ( not ( = ?auto_177303 ?auto_177305 ) ) ( not ( = ?auto_177303 ?auto_177304 ) ) ( not ( = ?auto_177308 ?auto_177305 ) ) ( not ( = ?auto_177308 ?auto_177304 ) ) ( not ( = ?auto_177305 ?auto_177304 ) ) ( ON ?auto_177305 ?auto_177308 ) ( not ( = ?auto_177306 ?auto_177304 ) ) ( not ( = ?auto_177300 ?auto_177306 ) ) ( not ( = ?auto_177301 ?auto_177306 ) ) ( not ( = ?auto_177302 ?auto_177306 ) ) ( not ( = ?auto_177303 ?auto_177306 ) ) ( not ( = ?auto_177308 ?auto_177306 ) ) ( not ( = ?auto_177305 ?auto_177306 ) ) ( ON ?auto_177306 ?auto_177307 ) ( CLEAR ?auto_177306 ) ( not ( = ?auto_177300 ?auto_177307 ) ) ( not ( = ?auto_177301 ?auto_177307 ) ) ( not ( = ?auto_177302 ?auto_177307 ) ) ( not ( = ?auto_177303 ?auto_177307 ) ) ( not ( = ?auto_177308 ?auto_177307 ) ) ( not ( = ?auto_177305 ?auto_177307 ) ) ( not ( = ?auto_177304 ?auto_177307 ) ) ( not ( = ?auto_177306 ?auto_177307 ) ) ( HOLDING ?auto_177304 ) ( CLEAR ?auto_177305 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177300 ?auto_177301 ?auto_177302 ?auto_177303 ?auto_177308 ?auto_177305 ?auto_177304 )
      ( MAKE-4PILE ?auto_177300 ?auto_177301 ?auto_177302 ?auto_177303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177309 - BLOCK
      ?auto_177310 - BLOCK
      ?auto_177311 - BLOCK
      ?auto_177312 - BLOCK
    )
    :vars
    (
      ?auto_177314 - BLOCK
      ?auto_177313 - BLOCK
      ?auto_177317 - BLOCK
      ?auto_177315 - BLOCK
      ?auto_177316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177314 ?auto_177312 ) ( ON-TABLE ?auto_177309 ) ( ON ?auto_177310 ?auto_177309 ) ( ON ?auto_177311 ?auto_177310 ) ( ON ?auto_177312 ?auto_177311 ) ( not ( = ?auto_177309 ?auto_177310 ) ) ( not ( = ?auto_177309 ?auto_177311 ) ) ( not ( = ?auto_177309 ?auto_177312 ) ) ( not ( = ?auto_177309 ?auto_177314 ) ) ( not ( = ?auto_177310 ?auto_177311 ) ) ( not ( = ?auto_177310 ?auto_177312 ) ) ( not ( = ?auto_177310 ?auto_177314 ) ) ( not ( = ?auto_177311 ?auto_177312 ) ) ( not ( = ?auto_177311 ?auto_177314 ) ) ( not ( = ?auto_177312 ?auto_177314 ) ) ( not ( = ?auto_177309 ?auto_177313 ) ) ( not ( = ?auto_177309 ?auto_177317 ) ) ( not ( = ?auto_177310 ?auto_177313 ) ) ( not ( = ?auto_177310 ?auto_177317 ) ) ( not ( = ?auto_177311 ?auto_177313 ) ) ( not ( = ?auto_177311 ?auto_177317 ) ) ( not ( = ?auto_177312 ?auto_177313 ) ) ( not ( = ?auto_177312 ?auto_177317 ) ) ( not ( = ?auto_177314 ?auto_177313 ) ) ( not ( = ?auto_177314 ?auto_177317 ) ) ( not ( = ?auto_177313 ?auto_177317 ) ) ( ON ?auto_177313 ?auto_177314 ) ( not ( = ?auto_177315 ?auto_177317 ) ) ( not ( = ?auto_177309 ?auto_177315 ) ) ( not ( = ?auto_177310 ?auto_177315 ) ) ( not ( = ?auto_177311 ?auto_177315 ) ) ( not ( = ?auto_177312 ?auto_177315 ) ) ( not ( = ?auto_177314 ?auto_177315 ) ) ( not ( = ?auto_177313 ?auto_177315 ) ) ( ON ?auto_177315 ?auto_177316 ) ( not ( = ?auto_177309 ?auto_177316 ) ) ( not ( = ?auto_177310 ?auto_177316 ) ) ( not ( = ?auto_177311 ?auto_177316 ) ) ( not ( = ?auto_177312 ?auto_177316 ) ) ( not ( = ?auto_177314 ?auto_177316 ) ) ( not ( = ?auto_177313 ?auto_177316 ) ) ( not ( = ?auto_177317 ?auto_177316 ) ) ( not ( = ?auto_177315 ?auto_177316 ) ) ( CLEAR ?auto_177313 ) ( ON ?auto_177317 ?auto_177315 ) ( CLEAR ?auto_177317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177316 ?auto_177315 )
      ( MAKE-4PILE ?auto_177309 ?auto_177310 ?auto_177311 ?auto_177312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177318 - BLOCK
      ?auto_177319 - BLOCK
      ?auto_177320 - BLOCK
      ?auto_177321 - BLOCK
    )
    :vars
    (
      ?auto_177326 - BLOCK
      ?auto_177322 - BLOCK
      ?auto_177324 - BLOCK
      ?auto_177323 - BLOCK
      ?auto_177325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177326 ?auto_177321 ) ( ON-TABLE ?auto_177318 ) ( ON ?auto_177319 ?auto_177318 ) ( ON ?auto_177320 ?auto_177319 ) ( ON ?auto_177321 ?auto_177320 ) ( not ( = ?auto_177318 ?auto_177319 ) ) ( not ( = ?auto_177318 ?auto_177320 ) ) ( not ( = ?auto_177318 ?auto_177321 ) ) ( not ( = ?auto_177318 ?auto_177326 ) ) ( not ( = ?auto_177319 ?auto_177320 ) ) ( not ( = ?auto_177319 ?auto_177321 ) ) ( not ( = ?auto_177319 ?auto_177326 ) ) ( not ( = ?auto_177320 ?auto_177321 ) ) ( not ( = ?auto_177320 ?auto_177326 ) ) ( not ( = ?auto_177321 ?auto_177326 ) ) ( not ( = ?auto_177318 ?auto_177322 ) ) ( not ( = ?auto_177318 ?auto_177324 ) ) ( not ( = ?auto_177319 ?auto_177322 ) ) ( not ( = ?auto_177319 ?auto_177324 ) ) ( not ( = ?auto_177320 ?auto_177322 ) ) ( not ( = ?auto_177320 ?auto_177324 ) ) ( not ( = ?auto_177321 ?auto_177322 ) ) ( not ( = ?auto_177321 ?auto_177324 ) ) ( not ( = ?auto_177326 ?auto_177322 ) ) ( not ( = ?auto_177326 ?auto_177324 ) ) ( not ( = ?auto_177322 ?auto_177324 ) ) ( not ( = ?auto_177323 ?auto_177324 ) ) ( not ( = ?auto_177318 ?auto_177323 ) ) ( not ( = ?auto_177319 ?auto_177323 ) ) ( not ( = ?auto_177320 ?auto_177323 ) ) ( not ( = ?auto_177321 ?auto_177323 ) ) ( not ( = ?auto_177326 ?auto_177323 ) ) ( not ( = ?auto_177322 ?auto_177323 ) ) ( ON ?auto_177323 ?auto_177325 ) ( not ( = ?auto_177318 ?auto_177325 ) ) ( not ( = ?auto_177319 ?auto_177325 ) ) ( not ( = ?auto_177320 ?auto_177325 ) ) ( not ( = ?auto_177321 ?auto_177325 ) ) ( not ( = ?auto_177326 ?auto_177325 ) ) ( not ( = ?auto_177322 ?auto_177325 ) ) ( not ( = ?auto_177324 ?auto_177325 ) ) ( not ( = ?auto_177323 ?auto_177325 ) ) ( ON ?auto_177324 ?auto_177323 ) ( CLEAR ?auto_177324 ) ( ON-TABLE ?auto_177325 ) ( HOLDING ?auto_177322 ) ( CLEAR ?auto_177326 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177318 ?auto_177319 ?auto_177320 ?auto_177321 ?auto_177326 ?auto_177322 )
      ( MAKE-4PILE ?auto_177318 ?auto_177319 ?auto_177320 ?auto_177321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177327 - BLOCK
      ?auto_177328 - BLOCK
      ?auto_177329 - BLOCK
      ?auto_177330 - BLOCK
    )
    :vars
    (
      ?auto_177331 - BLOCK
      ?auto_177332 - BLOCK
      ?auto_177335 - BLOCK
      ?auto_177333 - BLOCK
      ?auto_177334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177331 ?auto_177330 ) ( ON-TABLE ?auto_177327 ) ( ON ?auto_177328 ?auto_177327 ) ( ON ?auto_177329 ?auto_177328 ) ( ON ?auto_177330 ?auto_177329 ) ( not ( = ?auto_177327 ?auto_177328 ) ) ( not ( = ?auto_177327 ?auto_177329 ) ) ( not ( = ?auto_177327 ?auto_177330 ) ) ( not ( = ?auto_177327 ?auto_177331 ) ) ( not ( = ?auto_177328 ?auto_177329 ) ) ( not ( = ?auto_177328 ?auto_177330 ) ) ( not ( = ?auto_177328 ?auto_177331 ) ) ( not ( = ?auto_177329 ?auto_177330 ) ) ( not ( = ?auto_177329 ?auto_177331 ) ) ( not ( = ?auto_177330 ?auto_177331 ) ) ( not ( = ?auto_177327 ?auto_177332 ) ) ( not ( = ?auto_177327 ?auto_177335 ) ) ( not ( = ?auto_177328 ?auto_177332 ) ) ( not ( = ?auto_177328 ?auto_177335 ) ) ( not ( = ?auto_177329 ?auto_177332 ) ) ( not ( = ?auto_177329 ?auto_177335 ) ) ( not ( = ?auto_177330 ?auto_177332 ) ) ( not ( = ?auto_177330 ?auto_177335 ) ) ( not ( = ?auto_177331 ?auto_177332 ) ) ( not ( = ?auto_177331 ?auto_177335 ) ) ( not ( = ?auto_177332 ?auto_177335 ) ) ( not ( = ?auto_177333 ?auto_177335 ) ) ( not ( = ?auto_177327 ?auto_177333 ) ) ( not ( = ?auto_177328 ?auto_177333 ) ) ( not ( = ?auto_177329 ?auto_177333 ) ) ( not ( = ?auto_177330 ?auto_177333 ) ) ( not ( = ?auto_177331 ?auto_177333 ) ) ( not ( = ?auto_177332 ?auto_177333 ) ) ( ON ?auto_177333 ?auto_177334 ) ( not ( = ?auto_177327 ?auto_177334 ) ) ( not ( = ?auto_177328 ?auto_177334 ) ) ( not ( = ?auto_177329 ?auto_177334 ) ) ( not ( = ?auto_177330 ?auto_177334 ) ) ( not ( = ?auto_177331 ?auto_177334 ) ) ( not ( = ?auto_177332 ?auto_177334 ) ) ( not ( = ?auto_177335 ?auto_177334 ) ) ( not ( = ?auto_177333 ?auto_177334 ) ) ( ON ?auto_177335 ?auto_177333 ) ( ON-TABLE ?auto_177334 ) ( CLEAR ?auto_177331 ) ( ON ?auto_177332 ?auto_177335 ) ( CLEAR ?auto_177332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177334 ?auto_177333 ?auto_177335 )
      ( MAKE-4PILE ?auto_177327 ?auto_177328 ?auto_177329 ?auto_177330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177354 - BLOCK
      ?auto_177355 - BLOCK
      ?auto_177356 - BLOCK
      ?auto_177357 - BLOCK
    )
    :vars
    (
      ?auto_177362 - BLOCK
      ?auto_177360 - BLOCK
      ?auto_177359 - BLOCK
      ?auto_177361 - BLOCK
      ?auto_177358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177354 ) ( ON ?auto_177355 ?auto_177354 ) ( ON ?auto_177356 ?auto_177355 ) ( not ( = ?auto_177354 ?auto_177355 ) ) ( not ( = ?auto_177354 ?auto_177356 ) ) ( not ( = ?auto_177354 ?auto_177357 ) ) ( not ( = ?auto_177354 ?auto_177362 ) ) ( not ( = ?auto_177355 ?auto_177356 ) ) ( not ( = ?auto_177355 ?auto_177357 ) ) ( not ( = ?auto_177355 ?auto_177362 ) ) ( not ( = ?auto_177356 ?auto_177357 ) ) ( not ( = ?auto_177356 ?auto_177362 ) ) ( not ( = ?auto_177357 ?auto_177362 ) ) ( not ( = ?auto_177354 ?auto_177360 ) ) ( not ( = ?auto_177354 ?auto_177359 ) ) ( not ( = ?auto_177355 ?auto_177360 ) ) ( not ( = ?auto_177355 ?auto_177359 ) ) ( not ( = ?auto_177356 ?auto_177360 ) ) ( not ( = ?auto_177356 ?auto_177359 ) ) ( not ( = ?auto_177357 ?auto_177360 ) ) ( not ( = ?auto_177357 ?auto_177359 ) ) ( not ( = ?auto_177362 ?auto_177360 ) ) ( not ( = ?auto_177362 ?auto_177359 ) ) ( not ( = ?auto_177360 ?auto_177359 ) ) ( not ( = ?auto_177361 ?auto_177359 ) ) ( not ( = ?auto_177354 ?auto_177361 ) ) ( not ( = ?auto_177355 ?auto_177361 ) ) ( not ( = ?auto_177356 ?auto_177361 ) ) ( not ( = ?auto_177357 ?auto_177361 ) ) ( not ( = ?auto_177362 ?auto_177361 ) ) ( not ( = ?auto_177360 ?auto_177361 ) ) ( ON ?auto_177361 ?auto_177358 ) ( not ( = ?auto_177354 ?auto_177358 ) ) ( not ( = ?auto_177355 ?auto_177358 ) ) ( not ( = ?auto_177356 ?auto_177358 ) ) ( not ( = ?auto_177357 ?auto_177358 ) ) ( not ( = ?auto_177362 ?auto_177358 ) ) ( not ( = ?auto_177360 ?auto_177358 ) ) ( not ( = ?auto_177359 ?auto_177358 ) ) ( not ( = ?auto_177361 ?auto_177358 ) ) ( ON ?auto_177359 ?auto_177361 ) ( ON-TABLE ?auto_177358 ) ( ON ?auto_177360 ?auto_177359 ) ( ON ?auto_177362 ?auto_177360 ) ( CLEAR ?auto_177362 ) ( HOLDING ?auto_177357 ) ( CLEAR ?auto_177356 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177354 ?auto_177355 ?auto_177356 ?auto_177357 ?auto_177362 )
      ( MAKE-4PILE ?auto_177354 ?auto_177355 ?auto_177356 ?auto_177357 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177363 - BLOCK
      ?auto_177364 - BLOCK
      ?auto_177365 - BLOCK
      ?auto_177366 - BLOCK
    )
    :vars
    (
      ?auto_177367 - BLOCK
      ?auto_177368 - BLOCK
      ?auto_177370 - BLOCK
      ?auto_177369 - BLOCK
      ?auto_177371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177363 ) ( ON ?auto_177364 ?auto_177363 ) ( ON ?auto_177365 ?auto_177364 ) ( not ( = ?auto_177363 ?auto_177364 ) ) ( not ( = ?auto_177363 ?auto_177365 ) ) ( not ( = ?auto_177363 ?auto_177366 ) ) ( not ( = ?auto_177363 ?auto_177367 ) ) ( not ( = ?auto_177364 ?auto_177365 ) ) ( not ( = ?auto_177364 ?auto_177366 ) ) ( not ( = ?auto_177364 ?auto_177367 ) ) ( not ( = ?auto_177365 ?auto_177366 ) ) ( not ( = ?auto_177365 ?auto_177367 ) ) ( not ( = ?auto_177366 ?auto_177367 ) ) ( not ( = ?auto_177363 ?auto_177368 ) ) ( not ( = ?auto_177363 ?auto_177370 ) ) ( not ( = ?auto_177364 ?auto_177368 ) ) ( not ( = ?auto_177364 ?auto_177370 ) ) ( not ( = ?auto_177365 ?auto_177368 ) ) ( not ( = ?auto_177365 ?auto_177370 ) ) ( not ( = ?auto_177366 ?auto_177368 ) ) ( not ( = ?auto_177366 ?auto_177370 ) ) ( not ( = ?auto_177367 ?auto_177368 ) ) ( not ( = ?auto_177367 ?auto_177370 ) ) ( not ( = ?auto_177368 ?auto_177370 ) ) ( not ( = ?auto_177369 ?auto_177370 ) ) ( not ( = ?auto_177363 ?auto_177369 ) ) ( not ( = ?auto_177364 ?auto_177369 ) ) ( not ( = ?auto_177365 ?auto_177369 ) ) ( not ( = ?auto_177366 ?auto_177369 ) ) ( not ( = ?auto_177367 ?auto_177369 ) ) ( not ( = ?auto_177368 ?auto_177369 ) ) ( ON ?auto_177369 ?auto_177371 ) ( not ( = ?auto_177363 ?auto_177371 ) ) ( not ( = ?auto_177364 ?auto_177371 ) ) ( not ( = ?auto_177365 ?auto_177371 ) ) ( not ( = ?auto_177366 ?auto_177371 ) ) ( not ( = ?auto_177367 ?auto_177371 ) ) ( not ( = ?auto_177368 ?auto_177371 ) ) ( not ( = ?auto_177370 ?auto_177371 ) ) ( not ( = ?auto_177369 ?auto_177371 ) ) ( ON ?auto_177370 ?auto_177369 ) ( ON-TABLE ?auto_177371 ) ( ON ?auto_177368 ?auto_177370 ) ( ON ?auto_177367 ?auto_177368 ) ( CLEAR ?auto_177365 ) ( ON ?auto_177366 ?auto_177367 ) ( CLEAR ?auto_177366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177371 ?auto_177369 ?auto_177370 ?auto_177368 ?auto_177367 )
      ( MAKE-4PILE ?auto_177363 ?auto_177364 ?auto_177365 ?auto_177366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177372 - BLOCK
      ?auto_177373 - BLOCK
      ?auto_177374 - BLOCK
      ?auto_177375 - BLOCK
    )
    :vars
    (
      ?auto_177380 - BLOCK
      ?auto_177377 - BLOCK
      ?auto_177376 - BLOCK
      ?auto_177379 - BLOCK
      ?auto_177378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177372 ) ( ON ?auto_177373 ?auto_177372 ) ( not ( = ?auto_177372 ?auto_177373 ) ) ( not ( = ?auto_177372 ?auto_177374 ) ) ( not ( = ?auto_177372 ?auto_177375 ) ) ( not ( = ?auto_177372 ?auto_177380 ) ) ( not ( = ?auto_177373 ?auto_177374 ) ) ( not ( = ?auto_177373 ?auto_177375 ) ) ( not ( = ?auto_177373 ?auto_177380 ) ) ( not ( = ?auto_177374 ?auto_177375 ) ) ( not ( = ?auto_177374 ?auto_177380 ) ) ( not ( = ?auto_177375 ?auto_177380 ) ) ( not ( = ?auto_177372 ?auto_177377 ) ) ( not ( = ?auto_177372 ?auto_177376 ) ) ( not ( = ?auto_177373 ?auto_177377 ) ) ( not ( = ?auto_177373 ?auto_177376 ) ) ( not ( = ?auto_177374 ?auto_177377 ) ) ( not ( = ?auto_177374 ?auto_177376 ) ) ( not ( = ?auto_177375 ?auto_177377 ) ) ( not ( = ?auto_177375 ?auto_177376 ) ) ( not ( = ?auto_177380 ?auto_177377 ) ) ( not ( = ?auto_177380 ?auto_177376 ) ) ( not ( = ?auto_177377 ?auto_177376 ) ) ( not ( = ?auto_177379 ?auto_177376 ) ) ( not ( = ?auto_177372 ?auto_177379 ) ) ( not ( = ?auto_177373 ?auto_177379 ) ) ( not ( = ?auto_177374 ?auto_177379 ) ) ( not ( = ?auto_177375 ?auto_177379 ) ) ( not ( = ?auto_177380 ?auto_177379 ) ) ( not ( = ?auto_177377 ?auto_177379 ) ) ( ON ?auto_177379 ?auto_177378 ) ( not ( = ?auto_177372 ?auto_177378 ) ) ( not ( = ?auto_177373 ?auto_177378 ) ) ( not ( = ?auto_177374 ?auto_177378 ) ) ( not ( = ?auto_177375 ?auto_177378 ) ) ( not ( = ?auto_177380 ?auto_177378 ) ) ( not ( = ?auto_177377 ?auto_177378 ) ) ( not ( = ?auto_177376 ?auto_177378 ) ) ( not ( = ?auto_177379 ?auto_177378 ) ) ( ON ?auto_177376 ?auto_177379 ) ( ON-TABLE ?auto_177378 ) ( ON ?auto_177377 ?auto_177376 ) ( ON ?auto_177380 ?auto_177377 ) ( ON ?auto_177375 ?auto_177380 ) ( CLEAR ?auto_177375 ) ( HOLDING ?auto_177374 ) ( CLEAR ?auto_177373 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177372 ?auto_177373 ?auto_177374 )
      ( MAKE-4PILE ?auto_177372 ?auto_177373 ?auto_177374 ?auto_177375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177381 - BLOCK
      ?auto_177382 - BLOCK
      ?auto_177383 - BLOCK
      ?auto_177384 - BLOCK
    )
    :vars
    (
      ?auto_177387 - BLOCK
      ?auto_177385 - BLOCK
      ?auto_177388 - BLOCK
      ?auto_177389 - BLOCK
      ?auto_177386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177381 ) ( ON ?auto_177382 ?auto_177381 ) ( not ( = ?auto_177381 ?auto_177382 ) ) ( not ( = ?auto_177381 ?auto_177383 ) ) ( not ( = ?auto_177381 ?auto_177384 ) ) ( not ( = ?auto_177381 ?auto_177387 ) ) ( not ( = ?auto_177382 ?auto_177383 ) ) ( not ( = ?auto_177382 ?auto_177384 ) ) ( not ( = ?auto_177382 ?auto_177387 ) ) ( not ( = ?auto_177383 ?auto_177384 ) ) ( not ( = ?auto_177383 ?auto_177387 ) ) ( not ( = ?auto_177384 ?auto_177387 ) ) ( not ( = ?auto_177381 ?auto_177385 ) ) ( not ( = ?auto_177381 ?auto_177388 ) ) ( not ( = ?auto_177382 ?auto_177385 ) ) ( not ( = ?auto_177382 ?auto_177388 ) ) ( not ( = ?auto_177383 ?auto_177385 ) ) ( not ( = ?auto_177383 ?auto_177388 ) ) ( not ( = ?auto_177384 ?auto_177385 ) ) ( not ( = ?auto_177384 ?auto_177388 ) ) ( not ( = ?auto_177387 ?auto_177385 ) ) ( not ( = ?auto_177387 ?auto_177388 ) ) ( not ( = ?auto_177385 ?auto_177388 ) ) ( not ( = ?auto_177389 ?auto_177388 ) ) ( not ( = ?auto_177381 ?auto_177389 ) ) ( not ( = ?auto_177382 ?auto_177389 ) ) ( not ( = ?auto_177383 ?auto_177389 ) ) ( not ( = ?auto_177384 ?auto_177389 ) ) ( not ( = ?auto_177387 ?auto_177389 ) ) ( not ( = ?auto_177385 ?auto_177389 ) ) ( ON ?auto_177389 ?auto_177386 ) ( not ( = ?auto_177381 ?auto_177386 ) ) ( not ( = ?auto_177382 ?auto_177386 ) ) ( not ( = ?auto_177383 ?auto_177386 ) ) ( not ( = ?auto_177384 ?auto_177386 ) ) ( not ( = ?auto_177387 ?auto_177386 ) ) ( not ( = ?auto_177385 ?auto_177386 ) ) ( not ( = ?auto_177388 ?auto_177386 ) ) ( not ( = ?auto_177389 ?auto_177386 ) ) ( ON ?auto_177388 ?auto_177389 ) ( ON-TABLE ?auto_177386 ) ( ON ?auto_177385 ?auto_177388 ) ( ON ?auto_177387 ?auto_177385 ) ( ON ?auto_177384 ?auto_177387 ) ( CLEAR ?auto_177382 ) ( ON ?auto_177383 ?auto_177384 ) ( CLEAR ?auto_177383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177386 ?auto_177389 ?auto_177388 ?auto_177385 ?auto_177387 ?auto_177384 )
      ( MAKE-4PILE ?auto_177381 ?auto_177382 ?auto_177383 ?auto_177384 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177390 - BLOCK
      ?auto_177391 - BLOCK
      ?auto_177392 - BLOCK
      ?auto_177393 - BLOCK
    )
    :vars
    (
      ?auto_177395 - BLOCK
      ?auto_177396 - BLOCK
      ?auto_177398 - BLOCK
      ?auto_177397 - BLOCK
      ?auto_177394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177390 ) ( not ( = ?auto_177390 ?auto_177391 ) ) ( not ( = ?auto_177390 ?auto_177392 ) ) ( not ( = ?auto_177390 ?auto_177393 ) ) ( not ( = ?auto_177390 ?auto_177395 ) ) ( not ( = ?auto_177391 ?auto_177392 ) ) ( not ( = ?auto_177391 ?auto_177393 ) ) ( not ( = ?auto_177391 ?auto_177395 ) ) ( not ( = ?auto_177392 ?auto_177393 ) ) ( not ( = ?auto_177392 ?auto_177395 ) ) ( not ( = ?auto_177393 ?auto_177395 ) ) ( not ( = ?auto_177390 ?auto_177396 ) ) ( not ( = ?auto_177390 ?auto_177398 ) ) ( not ( = ?auto_177391 ?auto_177396 ) ) ( not ( = ?auto_177391 ?auto_177398 ) ) ( not ( = ?auto_177392 ?auto_177396 ) ) ( not ( = ?auto_177392 ?auto_177398 ) ) ( not ( = ?auto_177393 ?auto_177396 ) ) ( not ( = ?auto_177393 ?auto_177398 ) ) ( not ( = ?auto_177395 ?auto_177396 ) ) ( not ( = ?auto_177395 ?auto_177398 ) ) ( not ( = ?auto_177396 ?auto_177398 ) ) ( not ( = ?auto_177397 ?auto_177398 ) ) ( not ( = ?auto_177390 ?auto_177397 ) ) ( not ( = ?auto_177391 ?auto_177397 ) ) ( not ( = ?auto_177392 ?auto_177397 ) ) ( not ( = ?auto_177393 ?auto_177397 ) ) ( not ( = ?auto_177395 ?auto_177397 ) ) ( not ( = ?auto_177396 ?auto_177397 ) ) ( ON ?auto_177397 ?auto_177394 ) ( not ( = ?auto_177390 ?auto_177394 ) ) ( not ( = ?auto_177391 ?auto_177394 ) ) ( not ( = ?auto_177392 ?auto_177394 ) ) ( not ( = ?auto_177393 ?auto_177394 ) ) ( not ( = ?auto_177395 ?auto_177394 ) ) ( not ( = ?auto_177396 ?auto_177394 ) ) ( not ( = ?auto_177398 ?auto_177394 ) ) ( not ( = ?auto_177397 ?auto_177394 ) ) ( ON ?auto_177398 ?auto_177397 ) ( ON-TABLE ?auto_177394 ) ( ON ?auto_177396 ?auto_177398 ) ( ON ?auto_177395 ?auto_177396 ) ( ON ?auto_177393 ?auto_177395 ) ( ON ?auto_177392 ?auto_177393 ) ( CLEAR ?auto_177392 ) ( HOLDING ?auto_177391 ) ( CLEAR ?auto_177390 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177390 ?auto_177391 )
      ( MAKE-4PILE ?auto_177390 ?auto_177391 ?auto_177392 ?auto_177393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177399 - BLOCK
      ?auto_177400 - BLOCK
      ?auto_177401 - BLOCK
      ?auto_177402 - BLOCK
    )
    :vars
    (
      ?auto_177403 - BLOCK
      ?auto_177405 - BLOCK
      ?auto_177406 - BLOCK
      ?auto_177407 - BLOCK
      ?auto_177404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177399 ) ( not ( = ?auto_177399 ?auto_177400 ) ) ( not ( = ?auto_177399 ?auto_177401 ) ) ( not ( = ?auto_177399 ?auto_177402 ) ) ( not ( = ?auto_177399 ?auto_177403 ) ) ( not ( = ?auto_177400 ?auto_177401 ) ) ( not ( = ?auto_177400 ?auto_177402 ) ) ( not ( = ?auto_177400 ?auto_177403 ) ) ( not ( = ?auto_177401 ?auto_177402 ) ) ( not ( = ?auto_177401 ?auto_177403 ) ) ( not ( = ?auto_177402 ?auto_177403 ) ) ( not ( = ?auto_177399 ?auto_177405 ) ) ( not ( = ?auto_177399 ?auto_177406 ) ) ( not ( = ?auto_177400 ?auto_177405 ) ) ( not ( = ?auto_177400 ?auto_177406 ) ) ( not ( = ?auto_177401 ?auto_177405 ) ) ( not ( = ?auto_177401 ?auto_177406 ) ) ( not ( = ?auto_177402 ?auto_177405 ) ) ( not ( = ?auto_177402 ?auto_177406 ) ) ( not ( = ?auto_177403 ?auto_177405 ) ) ( not ( = ?auto_177403 ?auto_177406 ) ) ( not ( = ?auto_177405 ?auto_177406 ) ) ( not ( = ?auto_177407 ?auto_177406 ) ) ( not ( = ?auto_177399 ?auto_177407 ) ) ( not ( = ?auto_177400 ?auto_177407 ) ) ( not ( = ?auto_177401 ?auto_177407 ) ) ( not ( = ?auto_177402 ?auto_177407 ) ) ( not ( = ?auto_177403 ?auto_177407 ) ) ( not ( = ?auto_177405 ?auto_177407 ) ) ( ON ?auto_177407 ?auto_177404 ) ( not ( = ?auto_177399 ?auto_177404 ) ) ( not ( = ?auto_177400 ?auto_177404 ) ) ( not ( = ?auto_177401 ?auto_177404 ) ) ( not ( = ?auto_177402 ?auto_177404 ) ) ( not ( = ?auto_177403 ?auto_177404 ) ) ( not ( = ?auto_177405 ?auto_177404 ) ) ( not ( = ?auto_177406 ?auto_177404 ) ) ( not ( = ?auto_177407 ?auto_177404 ) ) ( ON ?auto_177406 ?auto_177407 ) ( ON-TABLE ?auto_177404 ) ( ON ?auto_177405 ?auto_177406 ) ( ON ?auto_177403 ?auto_177405 ) ( ON ?auto_177402 ?auto_177403 ) ( ON ?auto_177401 ?auto_177402 ) ( CLEAR ?auto_177399 ) ( ON ?auto_177400 ?auto_177401 ) ( CLEAR ?auto_177400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177404 ?auto_177407 ?auto_177406 ?auto_177405 ?auto_177403 ?auto_177402 ?auto_177401 )
      ( MAKE-4PILE ?auto_177399 ?auto_177400 ?auto_177401 ?auto_177402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177408 - BLOCK
      ?auto_177409 - BLOCK
      ?auto_177410 - BLOCK
      ?auto_177411 - BLOCK
    )
    :vars
    (
      ?auto_177416 - BLOCK
      ?auto_177415 - BLOCK
      ?auto_177414 - BLOCK
      ?auto_177412 - BLOCK
      ?auto_177413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177408 ?auto_177409 ) ) ( not ( = ?auto_177408 ?auto_177410 ) ) ( not ( = ?auto_177408 ?auto_177411 ) ) ( not ( = ?auto_177408 ?auto_177416 ) ) ( not ( = ?auto_177409 ?auto_177410 ) ) ( not ( = ?auto_177409 ?auto_177411 ) ) ( not ( = ?auto_177409 ?auto_177416 ) ) ( not ( = ?auto_177410 ?auto_177411 ) ) ( not ( = ?auto_177410 ?auto_177416 ) ) ( not ( = ?auto_177411 ?auto_177416 ) ) ( not ( = ?auto_177408 ?auto_177415 ) ) ( not ( = ?auto_177408 ?auto_177414 ) ) ( not ( = ?auto_177409 ?auto_177415 ) ) ( not ( = ?auto_177409 ?auto_177414 ) ) ( not ( = ?auto_177410 ?auto_177415 ) ) ( not ( = ?auto_177410 ?auto_177414 ) ) ( not ( = ?auto_177411 ?auto_177415 ) ) ( not ( = ?auto_177411 ?auto_177414 ) ) ( not ( = ?auto_177416 ?auto_177415 ) ) ( not ( = ?auto_177416 ?auto_177414 ) ) ( not ( = ?auto_177415 ?auto_177414 ) ) ( not ( = ?auto_177412 ?auto_177414 ) ) ( not ( = ?auto_177408 ?auto_177412 ) ) ( not ( = ?auto_177409 ?auto_177412 ) ) ( not ( = ?auto_177410 ?auto_177412 ) ) ( not ( = ?auto_177411 ?auto_177412 ) ) ( not ( = ?auto_177416 ?auto_177412 ) ) ( not ( = ?auto_177415 ?auto_177412 ) ) ( ON ?auto_177412 ?auto_177413 ) ( not ( = ?auto_177408 ?auto_177413 ) ) ( not ( = ?auto_177409 ?auto_177413 ) ) ( not ( = ?auto_177410 ?auto_177413 ) ) ( not ( = ?auto_177411 ?auto_177413 ) ) ( not ( = ?auto_177416 ?auto_177413 ) ) ( not ( = ?auto_177415 ?auto_177413 ) ) ( not ( = ?auto_177414 ?auto_177413 ) ) ( not ( = ?auto_177412 ?auto_177413 ) ) ( ON ?auto_177414 ?auto_177412 ) ( ON-TABLE ?auto_177413 ) ( ON ?auto_177415 ?auto_177414 ) ( ON ?auto_177416 ?auto_177415 ) ( ON ?auto_177411 ?auto_177416 ) ( ON ?auto_177410 ?auto_177411 ) ( ON ?auto_177409 ?auto_177410 ) ( CLEAR ?auto_177409 ) ( HOLDING ?auto_177408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177408 )
      ( MAKE-4PILE ?auto_177408 ?auto_177409 ?auto_177410 ?auto_177411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177417 - BLOCK
      ?auto_177418 - BLOCK
      ?auto_177419 - BLOCK
      ?auto_177420 - BLOCK
    )
    :vars
    (
      ?auto_177421 - BLOCK
      ?auto_177424 - BLOCK
      ?auto_177422 - BLOCK
      ?auto_177425 - BLOCK
      ?auto_177423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177417 ?auto_177418 ) ) ( not ( = ?auto_177417 ?auto_177419 ) ) ( not ( = ?auto_177417 ?auto_177420 ) ) ( not ( = ?auto_177417 ?auto_177421 ) ) ( not ( = ?auto_177418 ?auto_177419 ) ) ( not ( = ?auto_177418 ?auto_177420 ) ) ( not ( = ?auto_177418 ?auto_177421 ) ) ( not ( = ?auto_177419 ?auto_177420 ) ) ( not ( = ?auto_177419 ?auto_177421 ) ) ( not ( = ?auto_177420 ?auto_177421 ) ) ( not ( = ?auto_177417 ?auto_177424 ) ) ( not ( = ?auto_177417 ?auto_177422 ) ) ( not ( = ?auto_177418 ?auto_177424 ) ) ( not ( = ?auto_177418 ?auto_177422 ) ) ( not ( = ?auto_177419 ?auto_177424 ) ) ( not ( = ?auto_177419 ?auto_177422 ) ) ( not ( = ?auto_177420 ?auto_177424 ) ) ( not ( = ?auto_177420 ?auto_177422 ) ) ( not ( = ?auto_177421 ?auto_177424 ) ) ( not ( = ?auto_177421 ?auto_177422 ) ) ( not ( = ?auto_177424 ?auto_177422 ) ) ( not ( = ?auto_177425 ?auto_177422 ) ) ( not ( = ?auto_177417 ?auto_177425 ) ) ( not ( = ?auto_177418 ?auto_177425 ) ) ( not ( = ?auto_177419 ?auto_177425 ) ) ( not ( = ?auto_177420 ?auto_177425 ) ) ( not ( = ?auto_177421 ?auto_177425 ) ) ( not ( = ?auto_177424 ?auto_177425 ) ) ( ON ?auto_177425 ?auto_177423 ) ( not ( = ?auto_177417 ?auto_177423 ) ) ( not ( = ?auto_177418 ?auto_177423 ) ) ( not ( = ?auto_177419 ?auto_177423 ) ) ( not ( = ?auto_177420 ?auto_177423 ) ) ( not ( = ?auto_177421 ?auto_177423 ) ) ( not ( = ?auto_177424 ?auto_177423 ) ) ( not ( = ?auto_177422 ?auto_177423 ) ) ( not ( = ?auto_177425 ?auto_177423 ) ) ( ON ?auto_177422 ?auto_177425 ) ( ON-TABLE ?auto_177423 ) ( ON ?auto_177424 ?auto_177422 ) ( ON ?auto_177421 ?auto_177424 ) ( ON ?auto_177420 ?auto_177421 ) ( ON ?auto_177419 ?auto_177420 ) ( ON ?auto_177418 ?auto_177419 ) ( ON ?auto_177417 ?auto_177418 ) ( CLEAR ?auto_177417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177423 ?auto_177425 ?auto_177422 ?auto_177424 ?auto_177421 ?auto_177420 ?auto_177419 ?auto_177418 )
      ( MAKE-4PILE ?auto_177417 ?auto_177418 ?auto_177419 ?auto_177420 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177430 - BLOCK
      ?auto_177431 - BLOCK
      ?auto_177432 - BLOCK
      ?auto_177433 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177433 ) ( CLEAR ?auto_177432 ) ( ON-TABLE ?auto_177430 ) ( ON ?auto_177431 ?auto_177430 ) ( ON ?auto_177432 ?auto_177431 ) ( not ( = ?auto_177430 ?auto_177431 ) ) ( not ( = ?auto_177430 ?auto_177432 ) ) ( not ( = ?auto_177430 ?auto_177433 ) ) ( not ( = ?auto_177431 ?auto_177432 ) ) ( not ( = ?auto_177431 ?auto_177433 ) ) ( not ( = ?auto_177432 ?auto_177433 ) ) )
    :subtasks
    ( ( !STACK ?auto_177433 ?auto_177432 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177434 - BLOCK
      ?auto_177435 - BLOCK
      ?auto_177436 - BLOCK
      ?auto_177437 - BLOCK
    )
    :vars
    (
      ?auto_177438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177436 ) ( ON-TABLE ?auto_177434 ) ( ON ?auto_177435 ?auto_177434 ) ( ON ?auto_177436 ?auto_177435 ) ( not ( = ?auto_177434 ?auto_177435 ) ) ( not ( = ?auto_177434 ?auto_177436 ) ) ( not ( = ?auto_177434 ?auto_177437 ) ) ( not ( = ?auto_177435 ?auto_177436 ) ) ( not ( = ?auto_177435 ?auto_177437 ) ) ( not ( = ?auto_177436 ?auto_177437 ) ) ( ON ?auto_177437 ?auto_177438 ) ( CLEAR ?auto_177437 ) ( HAND-EMPTY ) ( not ( = ?auto_177434 ?auto_177438 ) ) ( not ( = ?auto_177435 ?auto_177438 ) ) ( not ( = ?auto_177436 ?auto_177438 ) ) ( not ( = ?auto_177437 ?auto_177438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177437 ?auto_177438 )
      ( MAKE-4PILE ?auto_177434 ?auto_177435 ?auto_177436 ?auto_177437 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177439 - BLOCK
      ?auto_177440 - BLOCK
      ?auto_177441 - BLOCK
      ?auto_177442 - BLOCK
    )
    :vars
    (
      ?auto_177443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177439 ) ( ON ?auto_177440 ?auto_177439 ) ( not ( = ?auto_177439 ?auto_177440 ) ) ( not ( = ?auto_177439 ?auto_177441 ) ) ( not ( = ?auto_177439 ?auto_177442 ) ) ( not ( = ?auto_177440 ?auto_177441 ) ) ( not ( = ?auto_177440 ?auto_177442 ) ) ( not ( = ?auto_177441 ?auto_177442 ) ) ( ON ?auto_177442 ?auto_177443 ) ( CLEAR ?auto_177442 ) ( not ( = ?auto_177439 ?auto_177443 ) ) ( not ( = ?auto_177440 ?auto_177443 ) ) ( not ( = ?auto_177441 ?auto_177443 ) ) ( not ( = ?auto_177442 ?auto_177443 ) ) ( HOLDING ?auto_177441 ) ( CLEAR ?auto_177440 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177439 ?auto_177440 ?auto_177441 )
      ( MAKE-4PILE ?auto_177439 ?auto_177440 ?auto_177441 ?auto_177442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177444 - BLOCK
      ?auto_177445 - BLOCK
      ?auto_177446 - BLOCK
      ?auto_177447 - BLOCK
    )
    :vars
    (
      ?auto_177448 - BLOCK
      ?auto_177450 - BLOCK
      ?auto_177449 - BLOCK
      ?auto_177451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177444 ) ( ON ?auto_177445 ?auto_177444 ) ( not ( = ?auto_177444 ?auto_177445 ) ) ( not ( = ?auto_177444 ?auto_177446 ) ) ( not ( = ?auto_177444 ?auto_177447 ) ) ( not ( = ?auto_177445 ?auto_177446 ) ) ( not ( = ?auto_177445 ?auto_177447 ) ) ( not ( = ?auto_177446 ?auto_177447 ) ) ( ON ?auto_177447 ?auto_177448 ) ( not ( = ?auto_177444 ?auto_177448 ) ) ( not ( = ?auto_177445 ?auto_177448 ) ) ( not ( = ?auto_177446 ?auto_177448 ) ) ( not ( = ?auto_177447 ?auto_177448 ) ) ( CLEAR ?auto_177445 ) ( ON ?auto_177446 ?auto_177447 ) ( CLEAR ?auto_177446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177450 ) ( ON ?auto_177449 ?auto_177450 ) ( ON ?auto_177451 ?auto_177449 ) ( ON ?auto_177448 ?auto_177451 ) ( not ( = ?auto_177450 ?auto_177449 ) ) ( not ( = ?auto_177450 ?auto_177451 ) ) ( not ( = ?auto_177450 ?auto_177448 ) ) ( not ( = ?auto_177450 ?auto_177447 ) ) ( not ( = ?auto_177450 ?auto_177446 ) ) ( not ( = ?auto_177449 ?auto_177451 ) ) ( not ( = ?auto_177449 ?auto_177448 ) ) ( not ( = ?auto_177449 ?auto_177447 ) ) ( not ( = ?auto_177449 ?auto_177446 ) ) ( not ( = ?auto_177451 ?auto_177448 ) ) ( not ( = ?auto_177451 ?auto_177447 ) ) ( not ( = ?auto_177451 ?auto_177446 ) ) ( not ( = ?auto_177444 ?auto_177450 ) ) ( not ( = ?auto_177444 ?auto_177449 ) ) ( not ( = ?auto_177444 ?auto_177451 ) ) ( not ( = ?auto_177445 ?auto_177450 ) ) ( not ( = ?auto_177445 ?auto_177449 ) ) ( not ( = ?auto_177445 ?auto_177451 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177450 ?auto_177449 ?auto_177451 ?auto_177448 ?auto_177447 )
      ( MAKE-4PILE ?auto_177444 ?auto_177445 ?auto_177446 ?auto_177447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177452 - BLOCK
      ?auto_177453 - BLOCK
      ?auto_177454 - BLOCK
      ?auto_177455 - BLOCK
    )
    :vars
    (
      ?auto_177459 - BLOCK
      ?auto_177457 - BLOCK
      ?auto_177456 - BLOCK
      ?auto_177458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177452 ) ( not ( = ?auto_177452 ?auto_177453 ) ) ( not ( = ?auto_177452 ?auto_177454 ) ) ( not ( = ?auto_177452 ?auto_177455 ) ) ( not ( = ?auto_177453 ?auto_177454 ) ) ( not ( = ?auto_177453 ?auto_177455 ) ) ( not ( = ?auto_177454 ?auto_177455 ) ) ( ON ?auto_177455 ?auto_177459 ) ( not ( = ?auto_177452 ?auto_177459 ) ) ( not ( = ?auto_177453 ?auto_177459 ) ) ( not ( = ?auto_177454 ?auto_177459 ) ) ( not ( = ?auto_177455 ?auto_177459 ) ) ( ON ?auto_177454 ?auto_177455 ) ( CLEAR ?auto_177454 ) ( ON-TABLE ?auto_177457 ) ( ON ?auto_177456 ?auto_177457 ) ( ON ?auto_177458 ?auto_177456 ) ( ON ?auto_177459 ?auto_177458 ) ( not ( = ?auto_177457 ?auto_177456 ) ) ( not ( = ?auto_177457 ?auto_177458 ) ) ( not ( = ?auto_177457 ?auto_177459 ) ) ( not ( = ?auto_177457 ?auto_177455 ) ) ( not ( = ?auto_177457 ?auto_177454 ) ) ( not ( = ?auto_177456 ?auto_177458 ) ) ( not ( = ?auto_177456 ?auto_177459 ) ) ( not ( = ?auto_177456 ?auto_177455 ) ) ( not ( = ?auto_177456 ?auto_177454 ) ) ( not ( = ?auto_177458 ?auto_177459 ) ) ( not ( = ?auto_177458 ?auto_177455 ) ) ( not ( = ?auto_177458 ?auto_177454 ) ) ( not ( = ?auto_177452 ?auto_177457 ) ) ( not ( = ?auto_177452 ?auto_177456 ) ) ( not ( = ?auto_177452 ?auto_177458 ) ) ( not ( = ?auto_177453 ?auto_177457 ) ) ( not ( = ?auto_177453 ?auto_177456 ) ) ( not ( = ?auto_177453 ?auto_177458 ) ) ( HOLDING ?auto_177453 ) ( CLEAR ?auto_177452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177452 ?auto_177453 )
      ( MAKE-4PILE ?auto_177452 ?auto_177453 ?auto_177454 ?auto_177455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177460 - BLOCK
      ?auto_177461 - BLOCK
      ?auto_177462 - BLOCK
      ?auto_177463 - BLOCK
    )
    :vars
    (
      ?auto_177464 - BLOCK
      ?auto_177467 - BLOCK
      ?auto_177466 - BLOCK
      ?auto_177465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177460 ) ( not ( = ?auto_177460 ?auto_177461 ) ) ( not ( = ?auto_177460 ?auto_177462 ) ) ( not ( = ?auto_177460 ?auto_177463 ) ) ( not ( = ?auto_177461 ?auto_177462 ) ) ( not ( = ?auto_177461 ?auto_177463 ) ) ( not ( = ?auto_177462 ?auto_177463 ) ) ( ON ?auto_177463 ?auto_177464 ) ( not ( = ?auto_177460 ?auto_177464 ) ) ( not ( = ?auto_177461 ?auto_177464 ) ) ( not ( = ?auto_177462 ?auto_177464 ) ) ( not ( = ?auto_177463 ?auto_177464 ) ) ( ON ?auto_177462 ?auto_177463 ) ( ON-TABLE ?auto_177467 ) ( ON ?auto_177466 ?auto_177467 ) ( ON ?auto_177465 ?auto_177466 ) ( ON ?auto_177464 ?auto_177465 ) ( not ( = ?auto_177467 ?auto_177466 ) ) ( not ( = ?auto_177467 ?auto_177465 ) ) ( not ( = ?auto_177467 ?auto_177464 ) ) ( not ( = ?auto_177467 ?auto_177463 ) ) ( not ( = ?auto_177467 ?auto_177462 ) ) ( not ( = ?auto_177466 ?auto_177465 ) ) ( not ( = ?auto_177466 ?auto_177464 ) ) ( not ( = ?auto_177466 ?auto_177463 ) ) ( not ( = ?auto_177466 ?auto_177462 ) ) ( not ( = ?auto_177465 ?auto_177464 ) ) ( not ( = ?auto_177465 ?auto_177463 ) ) ( not ( = ?auto_177465 ?auto_177462 ) ) ( not ( = ?auto_177460 ?auto_177467 ) ) ( not ( = ?auto_177460 ?auto_177466 ) ) ( not ( = ?auto_177460 ?auto_177465 ) ) ( not ( = ?auto_177461 ?auto_177467 ) ) ( not ( = ?auto_177461 ?auto_177466 ) ) ( not ( = ?auto_177461 ?auto_177465 ) ) ( CLEAR ?auto_177460 ) ( ON ?auto_177461 ?auto_177462 ) ( CLEAR ?auto_177461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177467 ?auto_177466 ?auto_177465 ?auto_177464 ?auto_177463 ?auto_177462 )
      ( MAKE-4PILE ?auto_177460 ?auto_177461 ?auto_177462 ?auto_177463 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177468 - BLOCK
      ?auto_177469 - BLOCK
      ?auto_177470 - BLOCK
      ?auto_177471 - BLOCK
    )
    :vars
    (
      ?auto_177472 - BLOCK
      ?auto_177473 - BLOCK
      ?auto_177474 - BLOCK
      ?auto_177475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177468 ?auto_177469 ) ) ( not ( = ?auto_177468 ?auto_177470 ) ) ( not ( = ?auto_177468 ?auto_177471 ) ) ( not ( = ?auto_177469 ?auto_177470 ) ) ( not ( = ?auto_177469 ?auto_177471 ) ) ( not ( = ?auto_177470 ?auto_177471 ) ) ( ON ?auto_177471 ?auto_177472 ) ( not ( = ?auto_177468 ?auto_177472 ) ) ( not ( = ?auto_177469 ?auto_177472 ) ) ( not ( = ?auto_177470 ?auto_177472 ) ) ( not ( = ?auto_177471 ?auto_177472 ) ) ( ON ?auto_177470 ?auto_177471 ) ( ON-TABLE ?auto_177473 ) ( ON ?auto_177474 ?auto_177473 ) ( ON ?auto_177475 ?auto_177474 ) ( ON ?auto_177472 ?auto_177475 ) ( not ( = ?auto_177473 ?auto_177474 ) ) ( not ( = ?auto_177473 ?auto_177475 ) ) ( not ( = ?auto_177473 ?auto_177472 ) ) ( not ( = ?auto_177473 ?auto_177471 ) ) ( not ( = ?auto_177473 ?auto_177470 ) ) ( not ( = ?auto_177474 ?auto_177475 ) ) ( not ( = ?auto_177474 ?auto_177472 ) ) ( not ( = ?auto_177474 ?auto_177471 ) ) ( not ( = ?auto_177474 ?auto_177470 ) ) ( not ( = ?auto_177475 ?auto_177472 ) ) ( not ( = ?auto_177475 ?auto_177471 ) ) ( not ( = ?auto_177475 ?auto_177470 ) ) ( not ( = ?auto_177468 ?auto_177473 ) ) ( not ( = ?auto_177468 ?auto_177474 ) ) ( not ( = ?auto_177468 ?auto_177475 ) ) ( not ( = ?auto_177469 ?auto_177473 ) ) ( not ( = ?auto_177469 ?auto_177474 ) ) ( not ( = ?auto_177469 ?auto_177475 ) ) ( ON ?auto_177469 ?auto_177470 ) ( CLEAR ?auto_177469 ) ( HOLDING ?auto_177468 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177468 )
      ( MAKE-4PILE ?auto_177468 ?auto_177469 ?auto_177470 ?auto_177471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177476 - BLOCK
      ?auto_177477 - BLOCK
      ?auto_177478 - BLOCK
      ?auto_177479 - BLOCK
    )
    :vars
    (
      ?auto_177480 - BLOCK
      ?auto_177483 - BLOCK
      ?auto_177482 - BLOCK
      ?auto_177481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177476 ?auto_177477 ) ) ( not ( = ?auto_177476 ?auto_177478 ) ) ( not ( = ?auto_177476 ?auto_177479 ) ) ( not ( = ?auto_177477 ?auto_177478 ) ) ( not ( = ?auto_177477 ?auto_177479 ) ) ( not ( = ?auto_177478 ?auto_177479 ) ) ( ON ?auto_177479 ?auto_177480 ) ( not ( = ?auto_177476 ?auto_177480 ) ) ( not ( = ?auto_177477 ?auto_177480 ) ) ( not ( = ?auto_177478 ?auto_177480 ) ) ( not ( = ?auto_177479 ?auto_177480 ) ) ( ON ?auto_177478 ?auto_177479 ) ( ON-TABLE ?auto_177483 ) ( ON ?auto_177482 ?auto_177483 ) ( ON ?auto_177481 ?auto_177482 ) ( ON ?auto_177480 ?auto_177481 ) ( not ( = ?auto_177483 ?auto_177482 ) ) ( not ( = ?auto_177483 ?auto_177481 ) ) ( not ( = ?auto_177483 ?auto_177480 ) ) ( not ( = ?auto_177483 ?auto_177479 ) ) ( not ( = ?auto_177483 ?auto_177478 ) ) ( not ( = ?auto_177482 ?auto_177481 ) ) ( not ( = ?auto_177482 ?auto_177480 ) ) ( not ( = ?auto_177482 ?auto_177479 ) ) ( not ( = ?auto_177482 ?auto_177478 ) ) ( not ( = ?auto_177481 ?auto_177480 ) ) ( not ( = ?auto_177481 ?auto_177479 ) ) ( not ( = ?auto_177481 ?auto_177478 ) ) ( not ( = ?auto_177476 ?auto_177483 ) ) ( not ( = ?auto_177476 ?auto_177482 ) ) ( not ( = ?auto_177476 ?auto_177481 ) ) ( not ( = ?auto_177477 ?auto_177483 ) ) ( not ( = ?auto_177477 ?auto_177482 ) ) ( not ( = ?auto_177477 ?auto_177481 ) ) ( ON ?auto_177477 ?auto_177478 ) ( ON ?auto_177476 ?auto_177477 ) ( CLEAR ?auto_177476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177483 ?auto_177482 ?auto_177481 ?auto_177480 ?auto_177479 ?auto_177478 ?auto_177477 )
      ( MAKE-4PILE ?auto_177476 ?auto_177477 ?auto_177478 ?auto_177479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177484 - BLOCK
      ?auto_177485 - BLOCK
      ?auto_177486 - BLOCK
      ?auto_177487 - BLOCK
    )
    :vars
    (
      ?auto_177488 - BLOCK
      ?auto_177489 - BLOCK
      ?auto_177491 - BLOCK
      ?auto_177490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177484 ?auto_177485 ) ) ( not ( = ?auto_177484 ?auto_177486 ) ) ( not ( = ?auto_177484 ?auto_177487 ) ) ( not ( = ?auto_177485 ?auto_177486 ) ) ( not ( = ?auto_177485 ?auto_177487 ) ) ( not ( = ?auto_177486 ?auto_177487 ) ) ( ON ?auto_177487 ?auto_177488 ) ( not ( = ?auto_177484 ?auto_177488 ) ) ( not ( = ?auto_177485 ?auto_177488 ) ) ( not ( = ?auto_177486 ?auto_177488 ) ) ( not ( = ?auto_177487 ?auto_177488 ) ) ( ON ?auto_177486 ?auto_177487 ) ( ON-TABLE ?auto_177489 ) ( ON ?auto_177491 ?auto_177489 ) ( ON ?auto_177490 ?auto_177491 ) ( ON ?auto_177488 ?auto_177490 ) ( not ( = ?auto_177489 ?auto_177491 ) ) ( not ( = ?auto_177489 ?auto_177490 ) ) ( not ( = ?auto_177489 ?auto_177488 ) ) ( not ( = ?auto_177489 ?auto_177487 ) ) ( not ( = ?auto_177489 ?auto_177486 ) ) ( not ( = ?auto_177491 ?auto_177490 ) ) ( not ( = ?auto_177491 ?auto_177488 ) ) ( not ( = ?auto_177491 ?auto_177487 ) ) ( not ( = ?auto_177491 ?auto_177486 ) ) ( not ( = ?auto_177490 ?auto_177488 ) ) ( not ( = ?auto_177490 ?auto_177487 ) ) ( not ( = ?auto_177490 ?auto_177486 ) ) ( not ( = ?auto_177484 ?auto_177489 ) ) ( not ( = ?auto_177484 ?auto_177491 ) ) ( not ( = ?auto_177484 ?auto_177490 ) ) ( not ( = ?auto_177485 ?auto_177489 ) ) ( not ( = ?auto_177485 ?auto_177491 ) ) ( not ( = ?auto_177485 ?auto_177490 ) ) ( ON ?auto_177485 ?auto_177486 ) ( HOLDING ?auto_177484 ) ( CLEAR ?auto_177485 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177489 ?auto_177491 ?auto_177490 ?auto_177488 ?auto_177487 ?auto_177486 ?auto_177485 ?auto_177484 )
      ( MAKE-4PILE ?auto_177484 ?auto_177485 ?auto_177486 ?auto_177487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177492 - BLOCK
      ?auto_177493 - BLOCK
      ?auto_177494 - BLOCK
      ?auto_177495 - BLOCK
    )
    :vars
    (
      ?auto_177496 - BLOCK
      ?auto_177498 - BLOCK
      ?auto_177499 - BLOCK
      ?auto_177497 - BLOCK
      ?auto_177500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177492 ?auto_177493 ) ) ( not ( = ?auto_177492 ?auto_177494 ) ) ( not ( = ?auto_177492 ?auto_177495 ) ) ( not ( = ?auto_177493 ?auto_177494 ) ) ( not ( = ?auto_177493 ?auto_177495 ) ) ( not ( = ?auto_177494 ?auto_177495 ) ) ( ON ?auto_177495 ?auto_177496 ) ( not ( = ?auto_177492 ?auto_177496 ) ) ( not ( = ?auto_177493 ?auto_177496 ) ) ( not ( = ?auto_177494 ?auto_177496 ) ) ( not ( = ?auto_177495 ?auto_177496 ) ) ( ON ?auto_177494 ?auto_177495 ) ( ON-TABLE ?auto_177498 ) ( ON ?auto_177499 ?auto_177498 ) ( ON ?auto_177497 ?auto_177499 ) ( ON ?auto_177496 ?auto_177497 ) ( not ( = ?auto_177498 ?auto_177499 ) ) ( not ( = ?auto_177498 ?auto_177497 ) ) ( not ( = ?auto_177498 ?auto_177496 ) ) ( not ( = ?auto_177498 ?auto_177495 ) ) ( not ( = ?auto_177498 ?auto_177494 ) ) ( not ( = ?auto_177499 ?auto_177497 ) ) ( not ( = ?auto_177499 ?auto_177496 ) ) ( not ( = ?auto_177499 ?auto_177495 ) ) ( not ( = ?auto_177499 ?auto_177494 ) ) ( not ( = ?auto_177497 ?auto_177496 ) ) ( not ( = ?auto_177497 ?auto_177495 ) ) ( not ( = ?auto_177497 ?auto_177494 ) ) ( not ( = ?auto_177492 ?auto_177498 ) ) ( not ( = ?auto_177492 ?auto_177499 ) ) ( not ( = ?auto_177492 ?auto_177497 ) ) ( not ( = ?auto_177493 ?auto_177498 ) ) ( not ( = ?auto_177493 ?auto_177499 ) ) ( not ( = ?auto_177493 ?auto_177497 ) ) ( ON ?auto_177493 ?auto_177494 ) ( CLEAR ?auto_177493 ) ( ON ?auto_177492 ?auto_177500 ) ( CLEAR ?auto_177492 ) ( HAND-EMPTY ) ( not ( = ?auto_177492 ?auto_177500 ) ) ( not ( = ?auto_177493 ?auto_177500 ) ) ( not ( = ?auto_177494 ?auto_177500 ) ) ( not ( = ?auto_177495 ?auto_177500 ) ) ( not ( = ?auto_177496 ?auto_177500 ) ) ( not ( = ?auto_177498 ?auto_177500 ) ) ( not ( = ?auto_177499 ?auto_177500 ) ) ( not ( = ?auto_177497 ?auto_177500 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177492 ?auto_177500 )
      ( MAKE-4PILE ?auto_177492 ?auto_177493 ?auto_177494 ?auto_177495 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177501 - BLOCK
      ?auto_177502 - BLOCK
      ?auto_177503 - BLOCK
      ?auto_177504 - BLOCK
    )
    :vars
    (
      ?auto_177509 - BLOCK
      ?auto_177507 - BLOCK
      ?auto_177508 - BLOCK
      ?auto_177506 - BLOCK
      ?auto_177505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177501 ?auto_177502 ) ) ( not ( = ?auto_177501 ?auto_177503 ) ) ( not ( = ?auto_177501 ?auto_177504 ) ) ( not ( = ?auto_177502 ?auto_177503 ) ) ( not ( = ?auto_177502 ?auto_177504 ) ) ( not ( = ?auto_177503 ?auto_177504 ) ) ( ON ?auto_177504 ?auto_177509 ) ( not ( = ?auto_177501 ?auto_177509 ) ) ( not ( = ?auto_177502 ?auto_177509 ) ) ( not ( = ?auto_177503 ?auto_177509 ) ) ( not ( = ?auto_177504 ?auto_177509 ) ) ( ON ?auto_177503 ?auto_177504 ) ( ON-TABLE ?auto_177507 ) ( ON ?auto_177508 ?auto_177507 ) ( ON ?auto_177506 ?auto_177508 ) ( ON ?auto_177509 ?auto_177506 ) ( not ( = ?auto_177507 ?auto_177508 ) ) ( not ( = ?auto_177507 ?auto_177506 ) ) ( not ( = ?auto_177507 ?auto_177509 ) ) ( not ( = ?auto_177507 ?auto_177504 ) ) ( not ( = ?auto_177507 ?auto_177503 ) ) ( not ( = ?auto_177508 ?auto_177506 ) ) ( not ( = ?auto_177508 ?auto_177509 ) ) ( not ( = ?auto_177508 ?auto_177504 ) ) ( not ( = ?auto_177508 ?auto_177503 ) ) ( not ( = ?auto_177506 ?auto_177509 ) ) ( not ( = ?auto_177506 ?auto_177504 ) ) ( not ( = ?auto_177506 ?auto_177503 ) ) ( not ( = ?auto_177501 ?auto_177507 ) ) ( not ( = ?auto_177501 ?auto_177508 ) ) ( not ( = ?auto_177501 ?auto_177506 ) ) ( not ( = ?auto_177502 ?auto_177507 ) ) ( not ( = ?auto_177502 ?auto_177508 ) ) ( not ( = ?auto_177502 ?auto_177506 ) ) ( ON ?auto_177501 ?auto_177505 ) ( CLEAR ?auto_177501 ) ( not ( = ?auto_177501 ?auto_177505 ) ) ( not ( = ?auto_177502 ?auto_177505 ) ) ( not ( = ?auto_177503 ?auto_177505 ) ) ( not ( = ?auto_177504 ?auto_177505 ) ) ( not ( = ?auto_177509 ?auto_177505 ) ) ( not ( = ?auto_177507 ?auto_177505 ) ) ( not ( = ?auto_177508 ?auto_177505 ) ) ( not ( = ?auto_177506 ?auto_177505 ) ) ( HOLDING ?auto_177502 ) ( CLEAR ?auto_177503 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177507 ?auto_177508 ?auto_177506 ?auto_177509 ?auto_177504 ?auto_177503 ?auto_177502 )
      ( MAKE-4PILE ?auto_177501 ?auto_177502 ?auto_177503 ?auto_177504 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177510 - BLOCK
      ?auto_177511 - BLOCK
      ?auto_177512 - BLOCK
      ?auto_177513 - BLOCK
    )
    :vars
    (
      ?auto_177517 - BLOCK
      ?auto_177515 - BLOCK
      ?auto_177518 - BLOCK
      ?auto_177514 - BLOCK
      ?auto_177516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177510 ?auto_177511 ) ) ( not ( = ?auto_177510 ?auto_177512 ) ) ( not ( = ?auto_177510 ?auto_177513 ) ) ( not ( = ?auto_177511 ?auto_177512 ) ) ( not ( = ?auto_177511 ?auto_177513 ) ) ( not ( = ?auto_177512 ?auto_177513 ) ) ( ON ?auto_177513 ?auto_177517 ) ( not ( = ?auto_177510 ?auto_177517 ) ) ( not ( = ?auto_177511 ?auto_177517 ) ) ( not ( = ?auto_177512 ?auto_177517 ) ) ( not ( = ?auto_177513 ?auto_177517 ) ) ( ON ?auto_177512 ?auto_177513 ) ( ON-TABLE ?auto_177515 ) ( ON ?auto_177518 ?auto_177515 ) ( ON ?auto_177514 ?auto_177518 ) ( ON ?auto_177517 ?auto_177514 ) ( not ( = ?auto_177515 ?auto_177518 ) ) ( not ( = ?auto_177515 ?auto_177514 ) ) ( not ( = ?auto_177515 ?auto_177517 ) ) ( not ( = ?auto_177515 ?auto_177513 ) ) ( not ( = ?auto_177515 ?auto_177512 ) ) ( not ( = ?auto_177518 ?auto_177514 ) ) ( not ( = ?auto_177518 ?auto_177517 ) ) ( not ( = ?auto_177518 ?auto_177513 ) ) ( not ( = ?auto_177518 ?auto_177512 ) ) ( not ( = ?auto_177514 ?auto_177517 ) ) ( not ( = ?auto_177514 ?auto_177513 ) ) ( not ( = ?auto_177514 ?auto_177512 ) ) ( not ( = ?auto_177510 ?auto_177515 ) ) ( not ( = ?auto_177510 ?auto_177518 ) ) ( not ( = ?auto_177510 ?auto_177514 ) ) ( not ( = ?auto_177511 ?auto_177515 ) ) ( not ( = ?auto_177511 ?auto_177518 ) ) ( not ( = ?auto_177511 ?auto_177514 ) ) ( ON ?auto_177510 ?auto_177516 ) ( not ( = ?auto_177510 ?auto_177516 ) ) ( not ( = ?auto_177511 ?auto_177516 ) ) ( not ( = ?auto_177512 ?auto_177516 ) ) ( not ( = ?auto_177513 ?auto_177516 ) ) ( not ( = ?auto_177517 ?auto_177516 ) ) ( not ( = ?auto_177515 ?auto_177516 ) ) ( not ( = ?auto_177518 ?auto_177516 ) ) ( not ( = ?auto_177514 ?auto_177516 ) ) ( CLEAR ?auto_177512 ) ( ON ?auto_177511 ?auto_177510 ) ( CLEAR ?auto_177511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177516 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177516 ?auto_177510 )
      ( MAKE-4PILE ?auto_177510 ?auto_177511 ?auto_177512 ?auto_177513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177519 - BLOCK
      ?auto_177520 - BLOCK
      ?auto_177521 - BLOCK
      ?auto_177522 - BLOCK
    )
    :vars
    (
      ?auto_177526 - BLOCK
      ?auto_177525 - BLOCK
      ?auto_177524 - BLOCK
      ?auto_177527 - BLOCK
      ?auto_177523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177519 ?auto_177520 ) ) ( not ( = ?auto_177519 ?auto_177521 ) ) ( not ( = ?auto_177519 ?auto_177522 ) ) ( not ( = ?auto_177520 ?auto_177521 ) ) ( not ( = ?auto_177520 ?auto_177522 ) ) ( not ( = ?auto_177521 ?auto_177522 ) ) ( ON ?auto_177522 ?auto_177526 ) ( not ( = ?auto_177519 ?auto_177526 ) ) ( not ( = ?auto_177520 ?auto_177526 ) ) ( not ( = ?auto_177521 ?auto_177526 ) ) ( not ( = ?auto_177522 ?auto_177526 ) ) ( ON-TABLE ?auto_177525 ) ( ON ?auto_177524 ?auto_177525 ) ( ON ?auto_177527 ?auto_177524 ) ( ON ?auto_177526 ?auto_177527 ) ( not ( = ?auto_177525 ?auto_177524 ) ) ( not ( = ?auto_177525 ?auto_177527 ) ) ( not ( = ?auto_177525 ?auto_177526 ) ) ( not ( = ?auto_177525 ?auto_177522 ) ) ( not ( = ?auto_177525 ?auto_177521 ) ) ( not ( = ?auto_177524 ?auto_177527 ) ) ( not ( = ?auto_177524 ?auto_177526 ) ) ( not ( = ?auto_177524 ?auto_177522 ) ) ( not ( = ?auto_177524 ?auto_177521 ) ) ( not ( = ?auto_177527 ?auto_177526 ) ) ( not ( = ?auto_177527 ?auto_177522 ) ) ( not ( = ?auto_177527 ?auto_177521 ) ) ( not ( = ?auto_177519 ?auto_177525 ) ) ( not ( = ?auto_177519 ?auto_177524 ) ) ( not ( = ?auto_177519 ?auto_177527 ) ) ( not ( = ?auto_177520 ?auto_177525 ) ) ( not ( = ?auto_177520 ?auto_177524 ) ) ( not ( = ?auto_177520 ?auto_177527 ) ) ( ON ?auto_177519 ?auto_177523 ) ( not ( = ?auto_177519 ?auto_177523 ) ) ( not ( = ?auto_177520 ?auto_177523 ) ) ( not ( = ?auto_177521 ?auto_177523 ) ) ( not ( = ?auto_177522 ?auto_177523 ) ) ( not ( = ?auto_177526 ?auto_177523 ) ) ( not ( = ?auto_177525 ?auto_177523 ) ) ( not ( = ?auto_177524 ?auto_177523 ) ) ( not ( = ?auto_177527 ?auto_177523 ) ) ( ON ?auto_177520 ?auto_177519 ) ( CLEAR ?auto_177520 ) ( ON-TABLE ?auto_177523 ) ( HOLDING ?auto_177521 ) ( CLEAR ?auto_177522 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177525 ?auto_177524 ?auto_177527 ?auto_177526 ?auto_177522 ?auto_177521 )
      ( MAKE-4PILE ?auto_177519 ?auto_177520 ?auto_177521 ?auto_177522 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177528 - BLOCK
      ?auto_177529 - BLOCK
      ?auto_177530 - BLOCK
      ?auto_177531 - BLOCK
    )
    :vars
    (
      ?auto_177534 - BLOCK
      ?auto_177533 - BLOCK
      ?auto_177532 - BLOCK
      ?auto_177535 - BLOCK
      ?auto_177536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177528 ?auto_177529 ) ) ( not ( = ?auto_177528 ?auto_177530 ) ) ( not ( = ?auto_177528 ?auto_177531 ) ) ( not ( = ?auto_177529 ?auto_177530 ) ) ( not ( = ?auto_177529 ?auto_177531 ) ) ( not ( = ?auto_177530 ?auto_177531 ) ) ( ON ?auto_177531 ?auto_177534 ) ( not ( = ?auto_177528 ?auto_177534 ) ) ( not ( = ?auto_177529 ?auto_177534 ) ) ( not ( = ?auto_177530 ?auto_177534 ) ) ( not ( = ?auto_177531 ?auto_177534 ) ) ( ON-TABLE ?auto_177533 ) ( ON ?auto_177532 ?auto_177533 ) ( ON ?auto_177535 ?auto_177532 ) ( ON ?auto_177534 ?auto_177535 ) ( not ( = ?auto_177533 ?auto_177532 ) ) ( not ( = ?auto_177533 ?auto_177535 ) ) ( not ( = ?auto_177533 ?auto_177534 ) ) ( not ( = ?auto_177533 ?auto_177531 ) ) ( not ( = ?auto_177533 ?auto_177530 ) ) ( not ( = ?auto_177532 ?auto_177535 ) ) ( not ( = ?auto_177532 ?auto_177534 ) ) ( not ( = ?auto_177532 ?auto_177531 ) ) ( not ( = ?auto_177532 ?auto_177530 ) ) ( not ( = ?auto_177535 ?auto_177534 ) ) ( not ( = ?auto_177535 ?auto_177531 ) ) ( not ( = ?auto_177535 ?auto_177530 ) ) ( not ( = ?auto_177528 ?auto_177533 ) ) ( not ( = ?auto_177528 ?auto_177532 ) ) ( not ( = ?auto_177528 ?auto_177535 ) ) ( not ( = ?auto_177529 ?auto_177533 ) ) ( not ( = ?auto_177529 ?auto_177532 ) ) ( not ( = ?auto_177529 ?auto_177535 ) ) ( ON ?auto_177528 ?auto_177536 ) ( not ( = ?auto_177528 ?auto_177536 ) ) ( not ( = ?auto_177529 ?auto_177536 ) ) ( not ( = ?auto_177530 ?auto_177536 ) ) ( not ( = ?auto_177531 ?auto_177536 ) ) ( not ( = ?auto_177534 ?auto_177536 ) ) ( not ( = ?auto_177533 ?auto_177536 ) ) ( not ( = ?auto_177532 ?auto_177536 ) ) ( not ( = ?auto_177535 ?auto_177536 ) ) ( ON ?auto_177529 ?auto_177528 ) ( ON-TABLE ?auto_177536 ) ( CLEAR ?auto_177531 ) ( ON ?auto_177530 ?auto_177529 ) ( CLEAR ?auto_177530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177536 ?auto_177528 ?auto_177529 )
      ( MAKE-4PILE ?auto_177528 ?auto_177529 ?auto_177530 ?auto_177531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177537 - BLOCK
      ?auto_177538 - BLOCK
      ?auto_177539 - BLOCK
      ?auto_177540 - BLOCK
    )
    :vars
    (
      ?auto_177542 - BLOCK
      ?auto_177544 - BLOCK
      ?auto_177543 - BLOCK
      ?auto_177541 - BLOCK
      ?auto_177545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177537 ?auto_177538 ) ) ( not ( = ?auto_177537 ?auto_177539 ) ) ( not ( = ?auto_177537 ?auto_177540 ) ) ( not ( = ?auto_177538 ?auto_177539 ) ) ( not ( = ?auto_177538 ?auto_177540 ) ) ( not ( = ?auto_177539 ?auto_177540 ) ) ( not ( = ?auto_177537 ?auto_177542 ) ) ( not ( = ?auto_177538 ?auto_177542 ) ) ( not ( = ?auto_177539 ?auto_177542 ) ) ( not ( = ?auto_177540 ?auto_177542 ) ) ( ON-TABLE ?auto_177544 ) ( ON ?auto_177543 ?auto_177544 ) ( ON ?auto_177541 ?auto_177543 ) ( ON ?auto_177542 ?auto_177541 ) ( not ( = ?auto_177544 ?auto_177543 ) ) ( not ( = ?auto_177544 ?auto_177541 ) ) ( not ( = ?auto_177544 ?auto_177542 ) ) ( not ( = ?auto_177544 ?auto_177540 ) ) ( not ( = ?auto_177544 ?auto_177539 ) ) ( not ( = ?auto_177543 ?auto_177541 ) ) ( not ( = ?auto_177543 ?auto_177542 ) ) ( not ( = ?auto_177543 ?auto_177540 ) ) ( not ( = ?auto_177543 ?auto_177539 ) ) ( not ( = ?auto_177541 ?auto_177542 ) ) ( not ( = ?auto_177541 ?auto_177540 ) ) ( not ( = ?auto_177541 ?auto_177539 ) ) ( not ( = ?auto_177537 ?auto_177544 ) ) ( not ( = ?auto_177537 ?auto_177543 ) ) ( not ( = ?auto_177537 ?auto_177541 ) ) ( not ( = ?auto_177538 ?auto_177544 ) ) ( not ( = ?auto_177538 ?auto_177543 ) ) ( not ( = ?auto_177538 ?auto_177541 ) ) ( ON ?auto_177537 ?auto_177545 ) ( not ( = ?auto_177537 ?auto_177545 ) ) ( not ( = ?auto_177538 ?auto_177545 ) ) ( not ( = ?auto_177539 ?auto_177545 ) ) ( not ( = ?auto_177540 ?auto_177545 ) ) ( not ( = ?auto_177542 ?auto_177545 ) ) ( not ( = ?auto_177544 ?auto_177545 ) ) ( not ( = ?auto_177543 ?auto_177545 ) ) ( not ( = ?auto_177541 ?auto_177545 ) ) ( ON ?auto_177538 ?auto_177537 ) ( ON-TABLE ?auto_177545 ) ( ON ?auto_177539 ?auto_177538 ) ( CLEAR ?auto_177539 ) ( HOLDING ?auto_177540 ) ( CLEAR ?auto_177542 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177544 ?auto_177543 ?auto_177541 ?auto_177542 ?auto_177540 )
      ( MAKE-4PILE ?auto_177537 ?auto_177538 ?auto_177539 ?auto_177540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177546 - BLOCK
      ?auto_177547 - BLOCK
      ?auto_177548 - BLOCK
      ?auto_177549 - BLOCK
    )
    :vars
    (
      ?auto_177550 - BLOCK
      ?auto_177553 - BLOCK
      ?auto_177551 - BLOCK
      ?auto_177552 - BLOCK
      ?auto_177554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177546 ?auto_177547 ) ) ( not ( = ?auto_177546 ?auto_177548 ) ) ( not ( = ?auto_177546 ?auto_177549 ) ) ( not ( = ?auto_177547 ?auto_177548 ) ) ( not ( = ?auto_177547 ?auto_177549 ) ) ( not ( = ?auto_177548 ?auto_177549 ) ) ( not ( = ?auto_177546 ?auto_177550 ) ) ( not ( = ?auto_177547 ?auto_177550 ) ) ( not ( = ?auto_177548 ?auto_177550 ) ) ( not ( = ?auto_177549 ?auto_177550 ) ) ( ON-TABLE ?auto_177553 ) ( ON ?auto_177551 ?auto_177553 ) ( ON ?auto_177552 ?auto_177551 ) ( ON ?auto_177550 ?auto_177552 ) ( not ( = ?auto_177553 ?auto_177551 ) ) ( not ( = ?auto_177553 ?auto_177552 ) ) ( not ( = ?auto_177553 ?auto_177550 ) ) ( not ( = ?auto_177553 ?auto_177549 ) ) ( not ( = ?auto_177553 ?auto_177548 ) ) ( not ( = ?auto_177551 ?auto_177552 ) ) ( not ( = ?auto_177551 ?auto_177550 ) ) ( not ( = ?auto_177551 ?auto_177549 ) ) ( not ( = ?auto_177551 ?auto_177548 ) ) ( not ( = ?auto_177552 ?auto_177550 ) ) ( not ( = ?auto_177552 ?auto_177549 ) ) ( not ( = ?auto_177552 ?auto_177548 ) ) ( not ( = ?auto_177546 ?auto_177553 ) ) ( not ( = ?auto_177546 ?auto_177551 ) ) ( not ( = ?auto_177546 ?auto_177552 ) ) ( not ( = ?auto_177547 ?auto_177553 ) ) ( not ( = ?auto_177547 ?auto_177551 ) ) ( not ( = ?auto_177547 ?auto_177552 ) ) ( ON ?auto_177546 ?auto_177554 ) ( not ( = ?auto_177546 ?auto_177554 ) ) ( not ( = ?auto_177547 ?auto_177554 ) ) ( not ( = ?auto_177548 ?auto_177554 ) ) ( not ( = ?auto_177549 ?auto_177554 ) ) ( not ( = ?auto_177550 ?auto_177554 ) ) ( not ( = ?auto_177553 ?auto_177554 ) ) ( not ( = ?auto_177551 ?auto_177554 ) ) ( not ( = ?auto_177552 ?auto_177554 ) ) ( ON ?auto_177547 ?auto_177546 ) ( ON-TABLE ?auto_177554 ) ( ON ?auto_177548 ?auto_177547 ) ( CLEAR ?auto_177550 ) ( ON ?auto_177549 ?auto_177548 ) ( CLEAR ?auto_177549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177554 ?auto_177546 ?auto_177547 ?auto_177548 )
      ( MAKE-4PILE ?auto_177546 ?auto_177547 ?auto_177548 ?auto_177549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177555 - BLOCK
      ?auto_177556 - BLOCK
      ?auto_177557 - BLOCK
      ?auto_177558 - BLOCK
    )
    :vars
    (
      ?auto_177560 - BLOCK
      ?auto_177562 - BLOCK
      ?auto_177561 - BLOCK
      ?auto_177563 - BLOCK
      ?auto_177559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177555 ?auto_177556 ) ) ( not ( = ?auto_177555 ?auto_177557 ) ) ( not ( = ?auto_177555 ?auto_177558 ) ) ( not ( = ?auto_177556 ?auto_177557 ) ) ( not ( = ?auto_177556 ?auto_177558 ) ) ( not ( = ?auto_177557 ?auto_177558 ) ) ( not ( = ?auto_177555 ?auto_177560 ) ) ( not ( = ?auto_177556 ?auto_177560 ) ) ( not ( = ?auto_177557 ?auto_177560 ) ) ( not ( = ?auto_177558 ?auto_177560 ) ) ( ON-TABLE ?auto_177562 ) ( ON ?auto_177561 ?auto_177562 ) ( ON ?auto_177563 ?auto_177561 ) ( not ( = ?auto_177562 ?auto_177561 ) ) ( not ( = ?auto_177562 ?auto_177563 ) ) ( not ( = ?auto_177562 ?auto_177560 ) ) ( not ( = ?auto_177562 ?auto_177558 ) ) ( not ( = ?auto_177562 ?auto_177557 ) ) ( not ( = ?auto_177561 ?auto_177563 ) ) ( not ( = ?auto_177561 ?auto_177560 ) ) ( not ( = ?auto_177561 ?auto_177558 ) ) ( not ( = ?auto_177561 ?auto_177557 ) ) ( not ( = ?auto_177563 ?auto_177560 ) ) ( not ( = ?auto_177563 ?auto_177558 ) ) ( not ( = ?auto_177563 ?auto_177557 ) ) ( not ( = ?auto_177555 ?auto_177562 ) ) ( not ( = ?auto_177555 ?auto_177561 ) ) ( not ( = ?auto_177555 ?auto_177563 ) ) ( not ( = ?auto_177556 ?auto_177562 ) ) ( not ( = ?auto_177556 ?auto_177561 ) ) ( not ( = ?auto_177556 ?auto_177563 ) ) ( ON ?auto_177555 ?auto_177559 ) ( not ( = ?auto_177555 ?auto_177559 ) ) ( not ( = ?auto_177556 ?auto_177559 ) ) ( not ( = ?auto_177557 ?auto_177559 ) ) ( not ( = ?auto_177558 ?auto_177559 ) ) ( not ( = ?auto_177560 ?auto_177559 ) ) ( not ( = ?auto_177562 ?auto_177559 ) ) ( not ( = ?auto_177561 ?auto_177559 ) ) ( not ( = ?auto_177563 ?auto_177559 ) ) ( ON ?auto_177556 ?auto_177555 ) ( ON-TABLE ?auto_177559 ) ( ON ?auto_177557 ?auto_177556 ) ( ON ?auto_177558 ?auto_177557 ) ( CLEAR ?auto_177558 ) ( HOLDING ?auto_177560 ) ( CLEAR ?auto_177563 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177562 ?auto_177561 ?auto_177563 ?auto_177560 )
      ( MAKE-4PILE ?auto_177555 ?auto_177556 ?auto_177557 ?auto_177558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177564 - BLOCK
      ?auto_177565 - BLOCK
      ?auto_177566 - BLOCK
      ?auto_177567 - BLOCK
    )
    :vars
    (
      ?auto_177572 - BLOCK
      ?auto_177570 - BLOCK
      ?auto_177571 - BLOCK
      ?auto_177569 - BLOCK
      ?auto_177568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177564 ?auto_177565 ) ) ( not ( = ?auto_177564 ?auto_177566 ) ) ( not ( = ?auto_177564 ?auto_177567 ) ) ( not ( = ?auto_177565 ?auto_177566 ) ) ( not ( = ?auto_177565 ?auto_177567 ) ) ( not ( = ?auto_177566 ?auto_177567 ) ) ( not ( = ?auto_177564 ?auto_177572 ) ) ( not ( = ?auto_177565 ?auto_177572 ) ) ( not ( = ?auto_177566 ?auto_177572 ) ) ( not ( = ?auto_177567 ?auto_177572 ) ) ( ON-TABLE ?auto_177570 ) ( ON ?auto_177571 ?auto_177570 ) ( ON ?auto_177569 ?auto_177571 ) ( not ( = ?auto_177570 ?auto_177571 ) ) ( not ( = ?auto_177570 ?auto_177569 ) ) ( not ( = ?auto_177570 ?auto_177572 ) ) ( not ( = ?auto_177570 ?auto_177567 ) ) ( not ( = ?auto_177570 ?auto_177566 ) ) ( not ( = ?auto_177571 ?auto_177569 ) ) ( not ( = ?auto_177571 ?auto_177572 ) ) ( not ( = ?auto_177571 ?auto_177567 ) ) ( not ( = ?auto_177571 ?auto_177566 ) ) ( not ( = ?auto_177569 ?auto_177572 ) ) ( not ( = ?auto_177569 ?auto_177567 ) ) ( not ( = ?auto_177569 ?auto_177566 ) ) ( not ( = ?auto_177564 ?auto_177570 ) ) ( not ( = ?auto_177564 ?auto_177571 ) ) ( not ( = ?auto_177564 ?auto_177569 ) ) ( not ( = ?auto_177565 ?auto_177570 ) ) ( not ( = ?auto_177565 ?auto_177571 ) ) ( not ( = ?auto_177565 ?auto_177569 ) ) ( ON ?auto_177564 ?auto_177568 ) ( not ( = ?auto_177564 ?auto_177568 ) ) ( not ( = ?auto_177565 ?auto_177568 ) ) ( not ( = ?auto_177566 ?auto_177568 ) ) ( not ( = ?auto_177567 ?auto_177568 ) ) ( not ( = ?auto_177572 ?auto_177568 ) ) ( not ( = ?auto_177570 ?auto_177568 ) ) ( not ( = ?auto_177571 ?auto_177568 ) ) ( not ( = ?auto_177569 ?auto_177568 ) ) ( ON ?auto_177565 ?auto_177564 ) ( ON-TABLE ?auto_177568 ) ( ON ?auto_177566 ?auto_177565 ) ( ON ?auto_177567 ?auto_177566 ) ( CLEAR ?auto_177569 ) ( ON ?auto_177572 ?auto_177567 ) ( CLEAR ?auto_177572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177568 ?auto_177564 ?auto_177565 ?auto_177566 ?auto_177567 )
      ( MAKE-4PILE ?auto_177564 ?auto_177565 ?auto_177566 ?auto_177567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177573 - BLOCK
      ?auto_177574 - BLOCK
      ?auto_177575 - BLOCK
      ?auto_177576 - BLOCK
    )
    :vars
    (
      ?auto_177578 - BLOCK
      ?auto_177580 - BLOCK
      ?auto_177579 - BLOCK
      ?auto_177581 - BLOCK
      ?auto_177577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177573 ?auto_177574 ) ) ( not ( = ?auto_177573 ?auto_177575 ) ) ( not ( = ?auto_177573 ?auto_177576 ) ) ( not ( = ?auto_177574 ?auto_177575 ) ) ( not ( = ?auto_177574 ?auto_177576 ) ) ( not ( = ?auto_177575 ?auto_177576 ) ) ( not ( = ?auto_177573 ?auto_177578 ) ) ( not ( = ?auto_177574 ?auto_177578 ) ) ( not ( = ?auto_177575 ?auto_177578 ) ) ( not ( = ?auto_177576 ?auto_177578 ) ) ( ON-TABLE ?auto_177580 ) ( ON ?auto_177579 ?auto_177580 ) ( not ( = ?auto_177580 ?auto_177579 ) ) ( not ( = ?auto_177580 ?auto_177581 ) ) ( not ( = ?auto_177580 ?auto_177578 ) ) ( not ( = ?auto_177580 ?auto_177576 ) ) ( not ( = ?auto_177580 ?auto_177575 ) ) ( not ( = ?auto_177579 ?auto_177581 ) ) ( not ( = ?auto_177579 ?auto_177578 ) ) ( not ( = ?auto_177579 ?auto_177576 ) ) ( not ( = ?auto_177579 ?auto_177575 ) ) ( not ( = ?auto_177581 ?auto_177578 ) ) ( not ( = ?auto_177581 ?auto_177576 ) ) ( not ( = ?auto_177581 ?auto_177575 ) ) ( not ( = ?auto_177573 ?auto_177580 ) ) ( not ( = ?auto_177573 ?auto_177579 ) ) ( not ( = ?auto_177573 ?auto_177581 ) ) ( not ( = ?auto_177574 ?auto_177580 ) ) ( not ( = ?auto_177574 ?auto_177579 ) ) ( not ( = ?auto_177574 ?auto_177581 ) ) ( ON ?auto_177573 ?auto_177577 ) ( not ( = ?auto_177573 ?auto_177577 ) ) ( not ( = ?auto_177574 ?auto_177577 ) ) ( not ( = ?auto_177575 ?auto_177577 ) ) ( not ( = ?auto_177576 ?auto_177577 ) ) ( not ( = ?auto_177578 ?auto_177577 ) ) ( not ( = ?auto_177580 ?auto_177577 ) ) ( not ( = ?auto_177579 ?auto_177577 ) ) ( not ( = ?auto_177581 ?auto_177577 ) ) ( ON ?auto_177574 ?auto_177573 ) ( ON-TABLE ?auto_177577 ) ( ON ?auto_177575 ?auto_177574 ) ( ON ?auto_177576 ?auto_177575 ) ( ON ?auto_177578 ?auto_177576 ) ( CLEAR ?auto_177578 ) ( HOLDING ?auto_177581 ) ( CLEAR ?auto_177579 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177580 ?auto_177579 ?auto_177581 )
      ( MAKE-4PILE ?auto_177573 ?auto_177574 ?auto_177575 ?auto_177576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177582 - BLOCK
      ?auto_177583 - BLOCK
      ?auto_177584 - BLOCK
      ?auto_177585 - BLOCK
    )
    :vars
    (
      ?auto_177586 - BLOCK
      ?auto_177589 - BLOCK
      ?auto_177587 - BLOCK
      ?auto_177588 - BLOCK
      ?auto_177590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177582 ?auto_177583 ) ) ( not ( = ?auto_177582 ?auto_177584 ) ) ( not ( = ?auto_177582 ?auto_177585 ) ) ( not ( = ?auto_177583 ?auto_177584 ) ) ( not ( = ?auto_177583 ?auto_177585 ) ) ( not ( = ?auto_177584 ?auto_177585 ) ) ( not ( = ?auto_177582 ?auto_177586 ) ) ( not ( = ?auto_177583 ?auto_177586 ) ) ( not ( = ?auto_177584 ?auto_177586 ) ) ( not ( = ?auto_177585 ?auto_177586 ) ) ( ON-TABLE ?auto_177589 ) ( ON ?auto_177587 ?auto_177589 ) ( not ( = ?auto_177589 ?auto_177587 ) ) ( not ( = ?auto_177589 ?auto_177588 ) ) ( not ( = ?auto_177589 ?auto_177586 ) ) ( not ( = ?auto_177589 ?auto_177585 ) ) ( not ( = ?auto_177589 ?auto_177584 ) ) ( not ( = ?auto_177587 ?auto_177588 ) ) ( not ( = ?auto_177587 ?auto_177586 ) ) ( not ( = ?auto_177587 ?auto_177585 ) ) ( not ( = ?auto_177587 ?auto_177584 ) ) ( not ( = ?auto_177588 ?auto_177586 ) ) ( not ( = ?auto_177588 ?auto_177585 ) ) ( not ( = ?auto_177588 ?auto_177584 ) ) ( not ( = ?auto_177582 ?auto_177589 ) ) ( not ( = ?auto_177582 ?auto_177587 ) ) ( not ( = ?auto_177582 ?auto_177588 ) ) ( not ( = ?auto_177583 ?auto_177589 ) ) ( not ( = ?auto_177583 ?auto_177587 ) ) ( not ( = ?auto_177583 ?auto_177588 ) ) ( ON ?auto_177582 ?auto_177590 ) ( not ( = ?auto_177582 ?auto_177590 ) ) ( not ( = ?auto_177583 ?auto_177590 ) ) ( not ( = ?auto_177584 ?auto_177590 ) ) ( not ( = ?auto_177585 ?auto_177590 ) ) ( not ( = ?auto_177586 ?auto_177590 ) ) ( not ( = ?auto_177589 ?auto_177590 ) ) ( not ( = ?auto_177587 ?auto_177590 ) ) ( not ( = ?auto_177588 ?auto_177590 ) ) ( ON ?auto_177583 ?auto_177582 ) ( ON-TABLE ?auto_177590 ) ( ON ?auto_177584 ?auto_177583 ) ( ON ?auto_177585 ?auto_177584 ) ( ON ?auto_177586 ?auto_177585 ) ( CLEAR ?auto_177587 ) ( ON ?auto_177588 ?auto_177586 ) ( CLEAR ?auto_177588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177590 ?auto_177582 ?auto_177583 ?auto_177584 ?auto_177585 ?auto_177586 )
      ( MAKE-4PILE ?auto_177582 ?auto_177583 ?auto_177584 ?auto_177585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177591 - BLOCK
      ?auto_177592 - BLOCK
      ?auto_177593 - BLOCK
      ?auto_177594 - BLOCK
    )
    :vars
    (
      ?auto_177596 - BLOCK
      ?auto_177598 - BLOCK
      ?auto_177599 - BLOCK
      ?auto_177597 - BLOCK
      ?auto_177595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177591 ?auto_177592 ) ) ( not ( = ?auto_177591 ?auto_177593 ) ) ( not ( = ?auto_177591 ?auto_177594 ) ) ( not ( = ?auto_177592 ?auto_177593 ) ) ( not ( = ?auto_177592 ?auto_177594 ) ) ( not ( = ?auto_177593 ?auto_177594 ) ) ( not ( = ?auto_177591 ?auto_177596 ) ) ( not ( = ?auto_177592 ?auto_177596 ) ) ( not ( = ?auto_177593 ?auto_177596 ) ) ( not ( = ?auto_177594 ?auto_177596 ) ) ( ON-TABLE ?auto_177598 ) ( not ( = ?auto_177598 ?auto_177599 ) ) ( not ( = ?auto_177598 ?auto_177597 ) ) ( not ( = ?auto_177598 ?auto_177596 ) ) ( not ( = ?auto_177598 ?auto_177594 ) ) ( not ( = ?auto_177598 ?auto_177593 ) ) ( not ( = ?auto_177599 ?auto_177597 ) ) ( not ( = ?auto_177599 ?auto_177596 ) ) ( not ( = ?auto_177599 ?auto_177594 ) ) ( not ( = ?auto_177599 ?auto_177593 ) ) ( not ( = ?auto_177597 ?auto_177596 ) ) ( not ( = ?auto_177597 ?auto_177594 ) ) ( not ( = ?auto_177597 ?auto_177593 ) ) ( not ( = ?auto_177591 ?auto_177598 ) ) ( not ( = ?auto_177591 ?auto_177599 ) ) ( not ( = ?auto_177591 ?auto_177597 ) ) ( not ( = ?auto_177592 ?auto_177598 ) ) ( not ( = ?auto_177592 ?auto_177599 ) ) ( not ( = ?auto_177592 ?auto_177597 ) ) ( ON ?auto_177591 ?auto_177595 ) ( not ( = ?auto_177591 ?auto_177595 ) ) ( not ( = ?auto_177592 ?auto_177595 ) ) ( not ( = ?auto_177593 ?auto_177595 ) ) ( not ( = ?auto_177594 ?auto_177595 ) ) ( not ( = ?auto_177596 ?auto_177595 ) ) ( not ( = ?auto_177598 ?auto_177595 ) ) ( not ( = ?auto_177599 ?auto_177595 ) ) ( not ( = ?auto_177597 ?auto_177595 ) ) ( ON ?auto_177592 ?auto_177591 ) ( ON-TABLE ?auto_177595 ) ( ON ?auto_177593 ?auto_177592 ) ( ON ?auto_177594 ?auto_177593 ) ( ON ?auto_177596 ?auto_177594 ) ( ON ?auto_177597 ?auto_177596 ) ( CLEAR ?auto_177597 ) ( HOLDING ?auto_177599 ) ( CLEAR ?auto_177598 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177598 ?auto_177599 )
      ( MAKE-4PILE ?auto_177591 ?auto_177592 ?auto_177593 ?auto_177594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177600 - BLOCK
      ?auto_177601 - BLOCK
      ?auto_177602 - BLOCK
      ?auto_177603 - BLOCK
    )
    :vars
    (
      ?auto_177605 - BLOCK
      ?auto_177607 - BLOCK
      ?auto_177606 - BLOCK
      ?auto_177608 - BLOCK
      ?auto_177604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177600 ?auto_177601 ) ) ( not ( = ?auto_177600 ?auto_177602 ) ) ( not ( = ?auto_177600 ?auto_177603 ) ) ( not ( = ?auto_177601 ?auto_177602 ) ) ( not ( = ?auto_177601 ?auto_177603 ) ) ( not ( = ?auto_177602 ?auto_177603 ) ) ( not ( = ?auto_177600 ?auto_177605 ) ) ( not ( = ?auto_177601 ?auto_177605 ) ) ( not ( = ?auto_177602 ?auto_177605 ) ) ( not ( = ?auto_177603 ?auto_177605 ) ) ( ON-TABLE ?auto_177607 ) ( not ( = ?auto_177607 ?auto_177606 ) ) ( not ( = ?auto_177607 ?auto_177608 ) ) ( not ( = ?auto_177607 ?auto_177605 ) ) ( not ( = ?auto_177607 ?auto_177603 ) ) ( not ( = ?auto_177607 ?auto_177602 ) ) ( not ( = ?auto_177606 ?auto_177608 ) ) ( not ( = ?auto_177606 ?auto_177605 ) ) ( not ( = ?auto_177606 ?auto_177603 ) ) ( not ( = ?auto_177606 ?auto_177602 ) ) ( not ( = ?auto_177608 ?auto_177605 ) ) ( not ( = ?auto_177608 ?auto_177603 ) ) ( not ( = ?auto_177608 ?auto_177602 ) ) ( not ( = ?auto_177600 ?auto_177607 ) ) ( not ( = ?auto_177600 ?auto_177606 ) ) ( not ( = ?auto_177600 ?auto_177608 ) ) ( not ( = ?auto_177601 ?auto_177607 ) ) ( not ( = ?auto_177601 ?auto_177606 ) ) ( not ( = ?auto_177601 ?auto_177608 ) ) ( ON ?auto_177600 ?auto_177604 ) ( not ( = ?auto_177600 ?auto_177604 ) ) ( not ( = ?auto_177601 ?auto_177604 ) ) ( not ( = ?auto_177602 ?auto_177604 ) ) ( not ( = ?auto_177603 ?auto_177604 ) ) ( not ( = ?auto_177605 ?auto_177604 ) ) ( not ( = ?auto_177607 ?auto_177604 ) ) ( not ( = ?auto_177606 ?auto_177604 ) ) ( not ( = ?auto_177608 ?auto_177604 ) ) ( ON ?auto_177601 ?auto_177600 ) ( ON-TABLE ?auto_177604 ) ( ON ?auto_177602 ?auto_177601 ) ( ON ?auto_177603 ?auto_177602 ) ( ON ?auto_177605 ?auto_177603 ) ( ON ?auto_177608 ?auto_177605 ) ( CLEAR ?auto_177607 ) ( ON ?auto_177606 ?auto_177608 ) ( CLEAR ?auto_177606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177604 ?auto_177600 ?auto_177601 ?auto_177602 ?auto_177603 ?auto_177605 ?auto_177608 )
      ( MAKE-4PILE ?auto_177600 ?auto_177601 ?auto_177602 ?auto_177603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177609 - BLOCK
      ?auto_177610 - BLOCK
      ?auto_177611 - BLOCK
      ?auto_177612 - BLOCK
    )
    :vars
    (
      ?auto_177616 - BLOCK
      ?auto_177613 - BLOCK
      ?auto_177615 - BLOCK
      ?auto_177614 - BLOCK
      ?auto_177617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177609 ?auto_177610 ) ) ( not ( = ?auto_177609 ?auto_177611 ) ) ( not ( = ?auto_177609 ?auto_177612 ) ) ( not ( = ?auto_177610 ?auto_177611 ) ) ( not ( = ?auto_177610 ?auto_177612 ) ) ( not ( = ?auto_177611 ?auto_177612 ) ) ( not ( = ?auto_177609 ?auto_177616 ) ) ( not ( = ?auto_177610 ?auto_177616 ) ) ( not ( = ?auto_177611 ?auto_177616 ) ) ( not ( = ?auto_177612 ?auto_177616 ) ) ( not ( = ?auto_177613 ?auto_177615 ) ) ( not ( = ?auto_177613 ?auto_177614 ) ) ( not ( = ?auto_177613 ?auto_177616 ) ) ( not ( = ?auto_177613 ?auto_177612 ) ) ( not ( = ?auto_177613 ?auto_177611 ) ) ( not ( = ?auto_177615 ?auto_177614 ) ) ( not ( = ?auto_177615 ?auto_177616 ) ) ( not ( = ?auto_177615 ?auto_177612 ) ) ( not ( = ?auto_177615 ?auto_177611 ) ) ( not ( = ?auto_177614 ?auto_177616 ) ) ( not ( = ?auto_177614 ?auto_177612 ) ) ( not ( = ?auto_177614 ?auto_177611 ) ) ( not ( = ?auto_177609 ?auto_177613 ) ) ( not ( = ?auto_177609 ?auto_177615 ) ) ( not ( = ?auto_177609 ?auto_177614 ) ) ( not ( = ?auto_177610 ?auto_177613 ) ) ( not ( = ?auto_177610 ?auto_177615 ) ) ( not ( = ?auto_177610 ?auto_177614 ) ) ( ON ?auto_177609 ?auto_177617 ) ( not ( = ?auto_177609 ?auto_177617 ) ) ( not ( = ?auto_177610 ?auto_177617 ) ) ( not ( = ?auto_177611 ?auto_177617 ) ) ( not ( = ?auto_177612 ?auto_177617 ) ) ( not ( = ?auto_177616 ?auto_177617 ) ) ( not ( = ?auto_177613 ?auto_177617 ) ) ( not ( = ?auto_177615 ?auto_177617 ) ) ( not ( = ?auto_177614 ?auto_177617 ) ) ( ON ?auto_177610 ?auto_177609 ) ( ON-TABLE ?auto_177617 ) ( ON ?auto_177611 ?auto_177610 ) ( ON ?auto_177612 ?auto_177611 ) ( ON ?auto_177616 ?auto_177612 ) ( ON ?auto_177614 ?auto_177616 ) ( ON ?auto_177615 ?auto_177614 ) ( CLEAR ?auto_177615 ) ( HOLDING ?auto_177613 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177613 )
      ( MAKE-4PILE ?auto_177609 ?auto_177610 ?auto_177611 ?auto_177612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_177618 - BLOCK
      ?auto_177619 - BLOCK
      ?auto_177620 - BLOCK
      ?auto_177621 - BLOCK
    )
    :vars
    (
      ?auto_177622 - BLOCK
      ?auto_177626 - BLOCK
      ?auto_177625 - BLOCK
      ?auto_177624 - BLOCK
      ?auto_177623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177618 ?auto_177619 ) ) ( not ( = ?auto_177618 ?auto_177620 ) ) ( not ( = ?auto_177618 ?auto_177621 ) ) ( not ( = ?auto_177619 ?auto_177620 ) ) ( not ( = ?auto_177619 ?auto_177621 ) ) ( not ( = ?auto_177620 ?auto_177621 ) ) ( not ( = ?auto_177618 ?auto_177622 ) ) ( not ( = ?auto_177619 ?auto_177622 ) ) ( not ( = ?auto_177620 ?auto_177622 ) ) ( not ( = ?auto_177621 ?auto_177622 ) ) ( not ( = ?auto_177626 ?auto_177625 ) ) ( not ( = ?auto_177626 ?auto_177624 ) ) ( not ( = ?auto_177626 ?auto_177622 ) ) ( not ( = ?auto_177626 ?auto_177621 ) ) ( not ( = ?auto_177626 ?auto_177620 ) ) ( not ( = ?auto_177625 ?auto_177624 ) ) ( not ( = ?auto_177625 ?auto_177622 ) ) ( not ( = ?auto_177625 ?auto_177621 ) ) ( not ( = ?auto_177625 ?auto_177620 ) ) ( not ( = ?auto_177624 ?auto_177622 ) ) ( not ( = ?auto_177624 ?auto_177621 ) ) ( not ( = ?auto_177624 ?auto_177620 ) ) ( not ( = ?auto_177618 ?auto_177626 ) ) ( not ( = ?auto_177618 ?auto_177625 ) ) ( not ( = ?auto_177618 ?auto_177624 ) ) ( not ( = ?auto_177619 ?auto_177626 ) ) ( not ( = ?auto_177619 ?auto_177625 ) ) ( not ( = ?auto_177619 ?auto_177624 ) ) ( ON ?auto_177618 ?auto_177623 ) ( not ( = ?auto_177618 ?auto_177623 ) ) ( not ( = ?auto_177619 ?auto_177623 ) ) ( not ( = ?auto_177620 ?auto_177623 ) ) ( not ( = ?auto_177621 ?auto_177623 ) ) ( not ( = ?auto_177622 ?auto_177623 ) ) ( not ( = ?auto_177626 ?auto_177623 ) ) ( not ( = ?auto_177625 ?auto_177623 ) ) ( not ( = ?auto_177624 ?auto_177623 ) ) ( ON ?auto_177619 ?auto_177618 ) ( ON-TABLE ?auto_177623 ) ( ON ?auto_177620 ?auto_177619 ) ( ON ?auto_177621 ?auto_177620 ) ( ON ?auto_177622 ?auto_177621 ) ( ON ?auto_177624 ?auto_177622 ) ( ON ?auto_177625 ?auto_177624 ) ( ON ?auto_177626 ?auto_177625 ) ( CLEAR ?auto_177626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177623 ?auto_177618 ?auto_177619 ?auto_177620 ?auto_177621 ?auto_177622 ?auto_177624 ?auto_177625 )
      ( MAKE-4PILE ?auto_177618 ?auto_177619 ?auto_177620 ?auto_177621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177630 - BLOCK
      ?auto_177631 - BLOCK
      ?auto_177632 - BLOCK
    )
    :vars
    (
      ?auto_177633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177633 ?auto_177632 ) ( CLEAR ?auto_177633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177630 ) ( ON ?auto_177631 ?auto_177630 ) ( ON ?auto_177632 ?auto_177631 ) ( not ( = ?auto_177630 ?auto_177631 ) ) ( not ( = ?auto_177630 ?auto_177632 ) ) ( not ( = ?auto_177630 ?auto_177633 ) ) ( not ( = ?auto_177631 ?auto_177632 ) ) ( not ( = ?auto_177631 ?auto_177633 ) ) ( not ( = ?auto_177632 ?auto_177633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177633 ?auto_177632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177634 - BLOCK
      ?auto_177635 - BLOCK
      ?auto_177636 - BLOCK
    )
    :vars
    (
      ?auto_177637 - BLOCK
      ?auto_177638 - BLOCK
      ?auto_177639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177637 ?auto_177636 ) ( CLEAR ?auto_177637 ) ( ON-TABLE ?auto_177634 ) ( ON ?auto_177635 ?auto_177634 ) ( ON ?auto_177636 ?auto_177635 ) ( not ( = ?auto_177634 ?auto_177635 ) ) ( not ( = ?auto_177634 ?auto_177636 ) ) ( not ( = ?auto_177634 ?auto_177637 ) ) ( not ( = ?auto_177635 ?auto_177636 ) ) ( not ( = ?auto_177635 ?auto_177637 ) ) ( not ( = ?auto_177636 ?auto_177637 ) ) ( HOLDING ?auto_177638 ) ( CLEAR ?auto_177639 ) ( not ( = ?auto_177634 ?auto_177638 ) ) ( not ( = ?auto_177634 ?auto_177639 ) ) ( not ( = ?auto_177635 ?auto_177638 ) ) ( not ( = ?auto_177635 ?auto_177639 ) ) ( not ( = ?auto_177636 ?auto_177638 ) ) ( not ( = ?auto_177636 ?auto_177639 ) ) ( not ( = ?auto_177637 ?auto_177638 ) ) ( not ( = ?auto_177637 ?auto_177639 ) ) ( not ( = ?auto_177638 ?auto_177639 ) ) )
    :subtasks
    ( ( !STACK ?auto_177638 ?auto_177639 )
      ( MAKE-3PILE ?auto_177634 ?auto_177635 ?auto_177636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177640 - BLOCK
      ?auto_177641 - BLOCK
      ?auto_177642 - BLOCK
    )
    :vars
    (
      ?auto_177643 - BLOCK
      ?auto_177645 - BLOCK
      ?auto_177644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177643 ?auto_177642 ) ( ON-TABLE ?auto_177640 ) ( ON ?auto_177641 ?auto_177640 ) ( ON ?auto_177642 ?auto_177641 ) ( not ( = ?auto_177640 ?auto_177641 ) ) ( not ( = ?auto_177640 ?auto_177642 ) ) ( not ( = ?auto_177640 ?auto_177643 ) ) ( not ( = ?auto_177641 ?auto_177642 ) ) ( not ( = ?auto_177641 ?auto_177643 ) ) ( not ( = ?auto_177642 ?auto_177643 ) ) ( CLEAR ?auto_177645 ) ( not ( = ?auto_177640 ?auto_177644 ) ) ( not ( = ?auto_177640 ?auto_177645 ) ) ( not ( = ?auto_177641 ?auto_177644 ) ) ( not ( = ?auto_177641 ?auto_177645 ) ) ( not ( = ?auto_177642 ?auto_177644 ) ) ( not ( = ?auto_177642 ?auto_177645 ) ) ( not ( = ?auto_177643 ?auto_177644 ) ) ( not ( = ?auto_177643 ?auto_177645 ) ) ( not ( = ?auto_177644 ?auto_177645 ) ) ( ON ?auto_177644 ?auto_177643 ) ( CLEAR ?auto_177644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177640 ?auto_177641 ?auto_177642 ?auto_177643 )
      ( MAKE-3PILE ?auto_177640 ?auto_177641 ?auto_177642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177646 - BLOCK
      ?auto_177647 - BLOCK
      ?auto_177648 - BLOCK
    )
    :vars
    (
      ?auto_177650 - BLOCK
      ?auto_177649 - BLOCK
      ?auto_177651 - BLOCK
      ?auto_177652 - BLOCK
      ?auto_177653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177650 ?auto_177648 ) ( ON-TABLE ?auto_177646 ) ( ON ?auto_177647 ?auto_177646 ) ( ON ?auto_177648 ?auto_177647 ) ( not ( = ?auto_177646 ?auto_177647 ) ) ( not ( = ?auto_177646 ?auto_177648 ) ) ( not ( = ?auto_177646 ?auto_177650 ) ) ( not ( = ?auto_177647 ?auto_177648 ) ) ( not ( = ?auto_177647 ?auto_177650 ) ) ( not ( = ?auto_177648 ?auto_177650 ) ) ( not ( = ?auto_177646 ?auto_177649 ) ) ( not ( = ?auto_177646 ?auto_177651 ) ) ( not ( = ?auto_177647 ?auto_177649 ) ) ( not ( = ?auto_177647 ?auto_177651 ) ) ( not ( = ?auto_177648 ?auto_177649 ) ) ( not ( = ?auto_177648 ?auto_177651 ) ) ( not ( = ?auto_177650 ?auto_177649 ) ) ( not ( = ?auto_177650 ?auto_177651 ) ) ( not ( = ?auto_177649 ?auto_177651 ) ) ( ON ?auto_177649 ?auto_177650 ) ( CLEAR ?auto_177649 ) ( HOLDING ?auto_177651 ) ( CLEAR ?auto_177652 ) ( ON-TABLE ?auto_177653 ) ( ON ?auto_177652 ?auto_177653 ) ( not ( = ?auto_177653 ?auto_177652 ) ) ( not ( = ?auto_177653 ?auto_177651 ) ) ( not ( = ?auto_177652 ?auto_177651 ) ) ( not ( = ?auto_177646 ?auto_177652 ) ) ( not ( = ?auto_177646 ?auto_177653 ) ) ( not ( = ?auto_177647 ?auto_177652 ) ) ( not ( = ?auto_177647 ?auto_177653 ) ) ( not ( = ?auto_177648 ?auto_177652 ) ) ( not ( = ?auto_177648 ?auto_177653 ) ) ( not ( = ?auto_177650 ?auto_177652 ) ) ( not ( = ?auto_177650 ?auto_177653 ) ) ( not ( = ?auto_177649 ?auto_177652 ) ) ( not ( = ?auto_177649 ?auto_177653 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177653 ?auto_177652 ?auto_177651 )
      ( MAKE-3PILE ?auto_177646 ?auto_177647 ?auto_177648 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177654 - BLOCK
      ?auto_177655 - BLOCK
      ?auto_177656 - BLOCK
    )
    :vars
    (
      ?auto_177661 - BLOCK
      ?auto_177659 - BLOCK
      ?auto_177660 - BLOCK
      ?auto_177657 - BLOCK
      ?auto_177658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177661 ?auto_177656 ) ( ON-TABLE ?auto_177654 ) ( ON ?auto_177655 ?auto_177654 ) ( ON ?auto_177656 ?auto_177655 ) ( not ( = ?auto_177654 ?auto_177655 ) ) ( not ( = ?auto_177654 ?auto_177656 ) ) ( not ( = ?auto_177654 ?auto_177661 ) ) ( not ( = ?auto_177655 ?auto_177656 ) ) ( not ( = ?auto_177655 ?auto_177661 ) ) ( not ( = ?auto_177656 ?auto_177661 ) ) ( not ( = ?auto_177654 ?auto_177659 ) ) ( not ( = ?auto_177654 ?auto_177660 ) ) ( not ( = ?auto_177655 ?auto_177659 ) ) ( not ( = ?auto_177655 ?auto_177660 ) ) ( not ( = ?auto_177656 ?auto_177659 ) ) ( not ( = ?auto_177656 ?auto_177660 ) ) ( not ( = ?auto_177661 ?auto_177659 ) ) ( not ( = ?auto_177661 ?auto_177660 ) ) ( not ( = ?auto_177659 ?auto_177660 ) ) ( ON ?auto_177659 ?auto_177661 ) ( CLEAR ?auto_177657 ) ( ON-TABLE ?auto_177658 ) ( ON ?auto_177657 ?auto_177658 ) ( not ( = ?auto_177658 ?auto_177657 ) ) ( not ( = ?auto_177658 ?auto_177660 ) ) ( not ( = ?auto_177657 ?auto_177660 ) ) ( not ( = ?auto_177654 ?auto_177657 ) ) ( not ( = ?auto_177654 ?auto_177658 ) ) ( not ( = ?auto_177655 ?auto_177657 ) ) ( not ( = ?auto_177655 ?auto_177658 ) ) ( not ( = ?auto_177656 ?auto_177657 ) ) ( not ( = ?auto_177656 ?auto_177658 ) ) ( not ( = ?auto_177661 ?auto_177657 ) ) ( not ( = ?auto_177661 ?auto_177658 ) ) ( not ( = ?auto_177659 ?auto_177657 ) ) ( not ( = ?auto_177659 ?auto_177658 ) ) ( ON ?auto_177660 ?auto_177659 ) ( CLEAR ?auto_177660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177654 ?auto_177655 ?auto_177656 ?auto_177661 ?auto_177659 )
      ( MAKE-3PILE ?auto_177654 ?auto_177655 ?auto_177656 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177662 - BLOCK
      ?auto_177663 - BLOCK
      ?auto_177664 - BLOCK
    )
    :vars
    (
      ?auto_177668 - BLOCK
      ?auto_177665 - BLOCK
      ?auto_177669 - BLOCK
      ?auto_177666 - BLOCK
      ?auto_177667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177668 ?auto_177664 ) ( ON-TABLE ?auto_177662 ) ( ON ?auto_177663 ?auto_177662 ) ( ON ?auto_177664 ?auto_177663 ) ( not ( = ?auto_177662 ?auto_177663 ) ) ( not ( = ?auto_177662 ?auto_177664 ) ) ( not ( = ?auto_177662 ?auto_177668 ) ) ( not ( = ?auto_177663 ?auto_177664 ) ) ( not ( = ?auto_177663 ?auto_177668 ) ) ( not ( = ?auto_177664 ?auto_177668 ) ) ( not ( = ?auto_177662 ?auto_177665 ) ) ( not ( = ?auto_177662 ?auto_177669 ) ) ( not ( = ?auto_177663 ?auto_177665 ) ) ( not ( = ?auto_177663 ?auto_177669 ) ) ( not ( = ?auto_177664 ?auto_177665 ) ) ( not ( = ?auto_177664 ?auto_177669 ) ) ( not ( = ?auto_177668 ?auto_177665 ) ) ( not ( = ?auto_177668 ?auto_177669 ) ) ( not ( = ?auto_177665 ?auto_177669 ) ) ( ON ?auto_177665 ?auto_177668 ) ( ON-TABLE ?auto_177666 ) ( not ( = ?auto_177666 ?auto_177667 ) ) ( not ( = ?auto_177666 ?auto_177669 ) ) ( not ( = ?auto_177667 ?auto_177669 ) ) ( not ( = ?auto_177662 ?auto_177667 ) ) ( not ( = ?auto_177662 ?auto_177666 ) ) ( not ( = ?auto_177663 ?auto_177667 ) ) ( not ( = ?auto_177663 ?auto_177666 ) ) ( not ( = ?auto_177664 ?auto_177667 ) ) ( not ( = ?auto_177664 ?auto_177666 ) ) ( not ( = ?auto_177668 ?auto_177667 ) ) ( not ( = ?auto_177668 ?auto_177666 ) ) ( not ( = ?auto_177665 ?auto_177667 ) ) ( not ( = ?auto_177665 ?auto_177666 ) ) ( ON ?auto_177669 ?auto_177665 ) ( CLEAR ?auto_177669 ) ( HOLDING ?auto_177667 ) ( CLEAR ?auto_177666 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177666 ?auto_177667 )
      ( MAKE-3PILE ?auto_177662 ?auto_177663 ?auto_177664 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177670 - BLOCK
      ?auto_177671 - BLOCK
      ?auto_177672 - BLOCK
    )
    :vars
    (
      ?auto_177674 - BLOCK
      ?auto_177676 - BLOCK
      ?auto_177675 - BLOCK
      ?auto_177677 - BLOCK
      ?auto_177673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177674 ?auto_177672 ) ( ON-TABLE ?auto_177670 ) ( ON ?auto_177671 ?auto_177670 ) ( ON ?auto_177672 ?auto_177671 ) ( not ( = ?auto_177670 ?auto_177671 ) ) ( not ( = ?auto_177670 ?auto_177672 ) ) ( not ( = ?auto_177670 ?auto_177674 ) ) ( not ( = ?auto_177671 ?auto_177672 ) ) ( not ( = ?auto_177671 ?auto_177674 ) ) ( not ( = ?auto_177672 ?auto_177674 ) ) ( not ( = ?auto_177670 ?auto_177676 ) ) ( not ( = ?auto_177670 ?auto_177675 ) ) ( not ( = ?auto_177671 ?auto_177676 ) ) ( not ( = ?auto_177671 ?auto_177675 ) ) ( not ( = ?auto_177672 ?auto_177676 ) ) ( not ( = ?auto_177672 ?auto_177675 ) ) ( not ( = ?auto_177674 ?auto_177676 ) ) ( not ( = ?auto_177674 ?auto_177675 ) ) ( not ( = ?auto_177676 ?auto_177675 ) ) ( ON ?auto_177676 ?auto_177674 ) ( ON-TABLE ?auto_177677 ) ( not ( = ?auto_177677 ?auto_177673 ) ) ( not ( = ?auto_177677 ?auto_177675 ) ) ( not ( = ?auto_177673 ?auto_177675 ) ) ( not ( = ?auto_177670 ?auto_177673 ) ) ( not ( = ?auto_177670 ?auto_177677 ) ) ( not ( = ?auto_177671 ?auto_177673 ) ) ( not ( = ?auto_177671 ?auto_177677 ) ) ( not ( = ?auto_177672 ?auto_177673 ) ) ( not ( = ?auto_177672 ?auto_177677 ) ) ( not ( = ?auto_177674 ?auto_177673 ) ) ( not ( = ?auto_177674 ?auto_177677 ) ) ( not ( = ?auto_177676 ?auto_177673 ) ) ( not ( = ?auto_177676 ?auto_177677 ) ) ( ON ?auto_177675 ?auto_177676 ) ( CLEAR ?auto_177677 ) ( ON ?auto_177673 ?auto_177675 ) ( CLEAR ?auto_177673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177670 ?auto_177671 ?auto_177672 ?auto_177674 ?auto_177676 ?auto_177675 )
      ( MAKE-3PILE ?auto_177670 ?auto_177671 ?auto_177672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177678 - BLOCK
      ?auto_177679 - BLOCK
      ?auto_177680 - BLOCK
    )
    :vars
    (
      ?auto_177681 - BLOCK
      ?auto_177682 - BLOCK
      ?auto_177683 - BLOCK
      ?auto_177685 - BLOCK
      ?auto_177684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177681 ?auto_177680 ) ( ON-TABLE ?auto_177678 ) ( ON ?auto_177679 ?auto_177678 ) ( ON ?auto_177680 ?auto_177679 ) ( not ( = ?auto_177678 ?auto_177679 ) ) ( not ( = ?auto_177678 ?auto_177680 ) ) ( not ( = ?auto_177678 ?auto_177681 ) ) ( not ( = ?auto_177679 ?auto_177680 ) ) ( not ( = ?auto_177679 ?auto_177681 ) ) ( not ( = ?auto_177680 ?auto_177681 ) ) ( not ( = ?auto_177678 ?auto_177682 ) ) ( not ( = ?auto_177678 ?auto_177683 ) ) ( not ( = ?auto_177679 ?auto_177682 ) ) ( not ( = ?auto_177679 ?auto_177683 ) ) ( not ( = ?auto_177680 ?auto_177682 ) ) ( not ( = ?auto_177680 ?auto_177683 ) ) ( not ( = ?auto_177681 ?auto_177682 ) ) ( not ( = ?auto_177681 ?auto_177683 ) ) ( not ( = ?auto_177682 ?auto_177683 ) ) ( ON ?auto_177682 ?auto_177681 ) ( not ( = ?auto_177685 ?auto_177684 ) ) ( not ( = ?auto_177685 ?auto_177683 ) ) ( not ( = ?auto_177684 ?auto_177683 ) ) ( not ( = ?auto_177678 ?auto_177684 ) ) ( not ( = ?auto_177678 ?auto_177685 ) ) ( not ( = ?auto_177679 ?auto_177684 ) ) ( not ( = ?auto_177679 ?auto_177685 ) ) ( not ( = ?auto_177680 ?auto_177684 ) ) ( not ( = ?auto_177680 ?auto_177685 ) ) ( not ( = ?auto_177681 ?auto_177684 ) ) ( not ( = ?auto_177681 ?auto_177685 ) ) ( not ( = ?auto_177682 ?auto_177684 ) ) ( not ( = ?auto_177682 ?auto_177685 ) ) ( ON ?auto_177683 ?auto_177682 ) ( ON ?auto_177684 ?auto_177683 ) ( CLEAR ?auto_177684 ) ( HOLDING ?auto_177685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177685 )
      ( MAKE-3PILE ?auto_177678 ?auto_177679 ?auto_177680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177686 - BLOCK
      ?auto_177687 - BLOCK
      ?auto_177688 - BLOCK
    )
    :vars
    (
      ?auto_177690 - BLOCK
      ?auto_177692 - BLOCK
      ?auto_177691 - BLOCK
      ?auto_177689 - BLOCK
      ?auto_177693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177690 ?auto_177688 ) ( ON-TABLE ?auto_177686 ) ( ON ?auto_177687 ?auto_177686 ) ( ON ?auto_177688 ?auto_177687 ) ( not ( = ?auto_177686 ?auto_177687 ) ) ( not ( = ?auto_177686 ?auto_177688 ) ) ( not ( = ?auto_177686 ?auto_177690 ) ) ( not ( = ?auto_177687 ?auto_177688 ) ) ( not ( = ?auto_177687 ?auto_177690 ) ) ( not ( = ?auto_177688 ?auto_177690 ) ) ( not ( = ?auto_177686 ?auto_177692 ) ) ( not ( = ?auto_177686 ?auto_177691 ) ) ( not ( = ?auto_177687 ?auto_177692 ) ) ( not ( = ?auto_177687 ?auto_177691 ) ) ( not ( = ?auto_177688 ?auto_177692 ) ) ( not ( = ?auto_177688 ?auto_177691 ) ) ( not ( = ?auto_177690 ?auto_177692 ) ) ( not ( = ?auto_177690 ?auto_177691 ) ) ( not ( = ?auto_177692 ?auto_177691 ) ) ( ON ?auto_177692 ?auto_177690 ) ( not ( = ?auto_177689 ?auto_177693 ) ) ( not ( = ?auto_177689 ?auto_177691 ) ) ( not ( = ?auto_177693 ?auto_177691 ) ) ( not ( = ?auto_177686 ?auto_177693 ) ) ( not ( = ?auto_177686 ?auto_177689 ) ) ( not ( = ?auto_177687 ?auto_177693 ) ) ( not ( = ?auto_177687 ?auto_177689 ) ) ( not ( = ?auto_177688 ?auto_177693 ) ) ( not ( = ?auto_177688 ?auto_177689 ) ) ( not ( = ?auto_177690 ?auto_177693 ) ) ( not ( = ?auto_177690 ?auto_177689 ) ) ( not ( = ?auto_177692 ?auto_177693 ) ) ( not ( = ?auto_177692 ?auto_177689 ) ) ( ON ?auto_177691 ?auto_177692 ) ( ON ?auto_177693 ?auto_177691 ) ( ON ?auto_177689 ?auto_177693 ) ( CLEAR ?auto_177689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177686 ?auto_177687 ?auto_177688 ?auto_177690 ?auto_177692 ?auto_177691 ?auto_177693 )
      ( MAKE-3PILE ?auto_177686 ?auto_177687 ?auto_177688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177694 - BLOCK
      ?auto_177695 - BLOCK
      ?auto_177696 - BLOCK
    )
    :vars
    (
      ?auto_177701 - BLOCK
      ?auto_177697 - BLOCK
      ?auto_177699 - BLOCK
      ?auto_177698 - BLOCK
      ?auto_177700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177701 ?auto_177696 ) ( ON-TABLE ?auto_177694 ) ( ON ?auto_177695 ?auto_177694 ) ( ON ?auto_177696 ?auto_177695 ) ( not ( = ?auto_177694 ?auto_177695 ) ) ( not ( = ?auto_177694 ?auto_177696 ) ) ( not ( = ?auto_177694 ?auto_177701 ) ) ( not ( = ?auto_177695 ?auto_177696 ) ) ( not ( = ?auto_177695 ?auto_177701 ) ) ( not ( = ?auto_177696 ?auto_177701 ) ) ( not ( = ?auto_177694 ?auto_177697 ) ) ( not ( = ?auto_177694 ?auto_177699 ) ) ( not ( = ?auto_177695 ?auto_177697 ) ) ( not ( = ?auto_177695 ?auto_177699 ) ) ( not ( = ?auto_177696 ?auto_177697 ) ) ( not ( = ?auto_177696 ?auto_177699 ) ) ( not ( = ?auto_177701 ?auto_177697 ) ) ( not ( = ?auto_177701 ?auto_177699 ) ) ( not ( = ?auto_177697 ?auto_177699 ) ) ( ON ?auto_177697 ?auto_177701 ) ( not ( = ?auto_177698 ?auto_177700 ) ) ( not ( = ?auto_177698 ?auto_177699 ) ) ( not ( = ?auto_177700 ?auto_177699 ) ) ( not ( = ?auto_177694 ?auto_177700 ) ) ( not ( = ?auto_177694 ?auto_177698 ) ) ( not ( = ?auto_177695 ?auto_177700 ) ) ( not ( = ?auto_177695 ?auto_177698 ) ) ( not ( = ?auto_177696 ?auto_177700 ) ) ( not ( = ?auto_177696 ?auto_177698 ) ) ( not ( = ?auto_177701 ?auto_177700 ) ) ( not ( = ?auto_177701 ?auto_177698 ) ) ( not ( = ?auto_177697 ?auto_177700 ) ) ( not ( = ?auto_177697 ?auto_177698 ) ) ( ON ?auto_177699 ?auto_177697 ) ( ON ?auto_177700 ?auto_177699 ) ( HOLDING ?auto_177698 ) ( CLEAR ?auto_177700 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177694 ?auto_177695 ?auto_177696 ?auto_177701 ?auto_177697 ?auto_177699 ?auto_177700 ?auto_177698 )
      ( MAKE-3PILE ?auto_177694 ?auto_177695 ?auto_177696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177702 - BLOCK
      ?auto_177703 - BLOCK
      ?auto_177704 - BLOCK
    )
    :vars
    (
      ?auto_177706 - BLOCK
      ?auto_177705 - BLOCK
      ?auto_177709 - BLOCK
      ?auto_177707 - BLOCK
      ?auto_177708 - BLOCK
      ?auto_177710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177706 ?auto_177704 ) ( ON-TABLE ?auto_177702 ) ( ON ?auto_177703 ?auto_177702 ) ( ON ?auto_177704 ?auto_177703 ) ( not ( = ?auto_177702 ?auto_177703 ) ) ( not ( = ?auto_177702 ?auto_177704 ) ) ( not ( = ?auto_177702 ?auto_177706 ) ) ( not ( = ?auto_177703 ?auto_177704 ) ) ( not ( = ?auto_177703 ?auto_177706 ) ) ( not ( = ?auto_177704 ?auto_177706 ) ) ( not ( = ?auto_177702 ?auto_177705 ) ) ( not ( = ?auto_177702 ?auto_177709 ) ) ( not ( = ?auto_177703 ?auto_177705 ) ) ( not ( = ?auto_177703 ?auto_177709 ) ) ( not ( = ?auto_177704 ?auto_177705 ) ) ( not ( = ?auto_177704 ?auto_177709 ) ) ( not ( = ?auto_177706 ?auto_177705 ) ) ( not ( = ?auto_177706 ?auto_177709 ) ) ( not ( = ?auto_177705 ?auto_177709 ) ) ( ON ?auto_177705 ?auto_177706 ) ( not ( = ?auto_177707 ?auto_177708 ) ) ( not ( = ?auto_177707 ?auto_177709 ) ) ( not ( = ?auto_177708 ?auto_177709 ) ) ( not ( = ?auto_177702 ?auto_177708 ) ) ( not ( = ?auto_177702 ?auto_177707 ) ) ( not ( = ?auto_177703 ?auto_177708 ) ) ( not ( = ?auto_177703 ?auto_177707 ) ) ( not ( = ?auto_177704 ?auto_177708 ) ) ( not ( = ?auto_177704 ?auto_177707 ) ) ( not ( = ?auto_177706 ?auto_177708 ) ) ( not ( = ?auto_177706 ?auto_177707 ) ) ( not ( = ?auto_177705 ?auto_177708 ) ) ( not ( = ?auto_177705 ?auto_177707 ) ) ( ON ?auto_177709 ?auto_177705 ) ( ON ?auto_177708 ?auto_177709 ) ( CLEAR ?auto_177708 ) ( ON ?auto_177707 ?auto_177710 ) ( CLEAR ?auto_177707 ) ( HAND-EMPTY ) ( not ( = ?auto_177702 ?auto_177710 ) ) ( not ( = ?auto_177703 ?auto_177710 ) ) ( not ( = ?auto_177704 ?auto_177710 ) ) ( not ( = ?auto_177706 ?auto_177710 ) ) ( not ( = ?auto_177705 ?auto_177710 ) ) ( not ( = ?auto_177709 ?auto_177710 ) ) ( not ( = ?auto_177707 ?auto_177710 ) ) ( not ( = ?auto_177708 ?auto_177710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177707 ?auto_177710 )
      ( MAKE-3PILE ?auto_177702 ?auto_177703 ?auto_177704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177711 - BLOCK
      ?auto_177712 - BLOCK
      ?auto_177713 - BLOCK
    )
    :vars
    (
      ?auto_177715 - BLOCK
      ?auto_177718 - BLOCK
      ?auto_177714 - BLOCK
      ?auto_177716 - BLOCK
      ?auto_177719 - BLOCK
      ?auto_177717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177715 ?auto_177713 ) ( ON-TABLE ?auto_177711 ) ( ON ?auto_177712 ?auto_177711 ) ( ON ?auto_177713 ?auto_177712 ) ( not ( = ?auto_177711 ?auto_177712 ) ) ( not ( = ?auto_177711 ?auto_177713 ) ) ( not ( = ?auto_177711 ?auto_177715 ) ) ( not ( = ?auto_177712 ?auto_177713 ) ) ( not ( = ?auto_177712 ?auto_177715 ) ) ( not ( = ?auto_177713 ?auto_177715 ) ) ( not ( = ?auto_177711 ?auto_177718 ) ) ( not ( = ?auto_177711 ?auto_177714 ) ) ( not ( = ?auto_177712 ?auto_177718 ) ) ( not ( = ?auto_177712 ?auto_177714 ) ) ( not ( = ?auto_177713 ?auto_177718 ) ) ( not ( = ?auto_177713 ?auto_177714 ) ) ( not ( = ?auto_177715 ?auto_177718 ) ) ( not ( = ?auto_177715 ?auto_177714 ) ) ( not ( = ?auto_177718 ?auto_177714 ) ) ( ON ?auto_177718 ?auto_177715 ) ( not ( = ?auto_177716 ?auto_177719 ) ) ( not ( = ?auto_177716 ?auto_177714 ) ) ( not ( = ?auto_177719 ?auto_177714 ) ) ( not ( = ?auto_177711 ?auto_177719 ) ) ( not ( = ?auto_177711 ?auto_177716 ) ) ( not ( = ?auto_177712 ?auto_177719 ) ) ( not ( = ?auto_177712 ?auto_177716 ) ) ( not ( = ?auto_177713 ?auto_177719 ) ) ( not ( = ?auto_177713 ?auto_177716 ) ) ( not ( = ?auto_177715 ?auto_177719 ) ) ( not ( = ?auto_177715 ?auto_177716 ) ) ( not ( = ?auto_177718 ?auto_177719 ) ) ( not ( = ?auto_177718 ?auto_177716 ) ) ( ON ?auto_177714 ?auto_177718 ) ( ON ?auto_177716 ?auto_177717 ) ( CLEAR ?auto_177716 ) ( not ( = ?auto_177711 ?auto_177717 ) ) ( not ( = ?auto_177712 ?auto_177717 ) ) ( not ( = ?auto_177713 ?auto_177717 ) ) ( not ( = ?auto_177715 ?auto_177717 ) ) ( not ( = ?auto_177718 ?auto_177717 ) ) ( not ( = ?auto_177714 ?auto_177717 ) ) ( not ( = ?auto_177716 ?auto_177717 ) ) ( not ( = ?auto_177719 ?auto_177717 ) ) ( HOLDING ?auto_177719 ) ( CLEAR ?auto_177714 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177711 ?auto_177712 ?auto_177713 ?auto_177715 ?auto_177718 ?auto_177714 ?auto_177719 )
      ( MAKE-3PILE ?auto_177711 ?auto_177712 ?auto_177713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177720 - BLOCK
      ?auto_177721 - BLOCK
      ?auto_177722 - BLOCK
    )
    :vars
    (
      ?auto_177728 - BLOCK
      ?auto_177724 - BLOCK
      ?auto_177726 - BLOCK
      ?auto_177727 - BLOCK
      ?auto_177723 - BLOCK
      ?auto_177725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177728 ?auto_177722 ) ( ON-TABLE ?auto_177720 ) ( ON ?auto_177721 ?auto_177720 ) ( ON ?auto_177722 ?auto_177721 ) ( not ( = ?auto_177720 ?auto_177721 ) ) ( not ( = ?auto_177720 ?auto_177722 ) ) ( not ( = ?auto_177720 ?auto_177728 ) ) ( not ( = ?auto_177721 ?auto_177722 ) ) ( not ( = ?auto_177721 ?auto_177728 ) ) ( not ( = ?auto_177722 ?auto_177728 ) ) ( not ( = ?auto_177720 ?auto_177724 ) ) ( not ( = ?auto_177720 ?auto_177726 ) ) ( not ( = ?auto_177721 ?auto_177724 ) ) ( not ( = ?auto_177721 ?auto_177726 ) ) ( not ( = ?auto_177722 ?auto_177724 ) ) ( not ( = ?auto_177722 ?auto_177726 ) ) ( not ( = ?auto_177728 ?auto_177724 ) ) ( not ( = ?auto_177728 ?auto_177726 ) ) ( not ( = ?auto_177724 ?auto_177726 ) ) ( ON ?auto_177724 ?auto_177728 ) ( not ( = ?auto_177727 ?auto_177723 ) ) ( not ( = ?auto_177727 ?auto_177726 ) ) ( not ( = ?auto_177723 ?auto_177726 ) ) ( not ( = ?auto_177720 ?auto_177723 ) ) ( not ( = ?auto_177720 ?auto_177727 ) ) ( not ( = ?auto_177721 ?auto_177723 ) ) ( not ( = ?auto_177721 ?auto_177727 ) ) ( not ( = ?auto_177722 ?auto_177723 ) ) ( not ( = ?auto_177722 ?auto_177727 ) ) ( not ( = ?auto_177728 ?auto_177723 ) ) ( not ( = ?auto_177728 ?auto_177727 ) ) ( not ( = ?auto_177724 ?auto_177723 ) ) ( not ( = ?auto_177724 ?auto_177727 ) ) ( ON ?auto_177726 ?auto_177724 ) ( ON ?auto_177727 ?auto_177725 ) ( not ( = ?auto_177720 ?auto_177725 ) ) ( not ( = ?auto_177721 ?auto_177725 ) ) ( not ( = ?auto_177722 ?auto_177725 ) ) ( not ( = ?auto_177728 ?auto_177725 ) ) ( not ( = ?auto_177724 ?auto_177725 ) ) ( not ( = ?auto_177726 ?auto_177725 ) ) ( not ( = ?auto_177727 ?auto_177725 ) ) ( not ( = ?auto_177723 ?auto_177725 ) ) ( CLEAR ?auto_177726 ) ( ON ?auto_177723 ?auto_177727 ) ( CLEAR ?auto_177723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177725 ?auto_177727 )
      ( MAKE-3PILE ?auto_177720 ?auto_177721 ?auto_177722 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177729 - BLOCK
      ?auto_177730 - BLOCK
      ?auto_177731 - BLOCK
    )
    :vars
    (
      ?auto_177734 - BLOCK
      ?auto_177737 - BLOCK
      ?auto_177735 - BLOCK
      ?auto_177733 - BLOCK
      ?auto_177736 - BLOCK
      ?auto_177732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177734 ?auto_177731 ) ( ON-TABLE ?auto_177729 ) ( ON ?auto_177730 ?auto_177729 ) ( ON ?auto_177731 ?auto_177730 ) ( not ( = ?auto_177729 ?auto_177730 ) ) ( not ( = ?auto_177729 ?auto_177731 ) ) ( not ( = ?auto_177729 ?auto_177734 ) ) ( not ( = ?auto_177730 ?auto_177731 ) ) ( not ( = ?auto_177730 ?auto_177734 ) ) ( not ( = ?auto_177731 ?auto_177734 ) ) ( not ( = ?auto_177729 ?auto_177737 ) ) ( not ( = ?auto_177729 ?auto_177735 ) ) ( not ( = ?auto_177730 ?auto_177737 ) ) ( not ( = ?auto_177730 ?auto_177735 ) ) ( not ( = ?auto_177731 ?auto_177737 ) ) ( not ( = ?auto_177731 ?auto_177735 ) ) ( not ( = ?auto_177734 ?auto_177737 ) ) ( not ( = ?auto_177734 ?auto_177735 ) ) ( not ( = ?auto_177737 ?auto_177735 ) ) ( ON ?auto_177737 ?auto_177734 ) ( not ( = ?auto_177733 ?auto_177736 ) ) ( not ( = ?auto_177733 ?auto_177735 ) ) ( not ( = ?auto_177736 ?auto_177735 ) ) ( not ( = ?auto_177729 ?auto_177736 ) ) ( not ( = ?auto_177729 ?auto_177733 ) ) ( not ( = ?auto_177730 ?auto_177736 ) ) ( not ( = ?auto_177730 ?auto_177733 ) ) ( not ( = ?auto_177731 ?auto_177736 ) ) ( not ( = ?auto_177731 ?auto_177733 ) ) ( not ( = ?auto_177734 ?auto_177736 ) ) ( not ( = ?auto_177734 ?auto_177733 ) ) ( not ( = ?auto_177737 ?auto_177736 ) ) ( not ( = ?auto_177737 ?auto_177733 ) ) ( ON ?auto_177733 ?auto_177732 ) ( not ( = ?auto_177729 ?auto_177732 ) ) ( not ( = ?auto_177730 ?auto_177732 ) ) ( not ( = ?auto_177731 ?auto_177732 ) ) ( not ( = ?auto_177734 ?auto_177732 ) ) ( not ( = ?auto_177737 ?auto_177732 ) ) ( not ( = ?auto_177735 ?auto_177732 ) ) ( not ( = ?auto_177733 ?auto_177732 ) ) ( not ( = ?auto_177736 ?auto_177732 ) ) ( ON ?auto_177736 ?auto_177733 ) ( CLEAR ?auto_177736 ) ( ON-TABLE ?auto_177732 ) ( HOLDING ?auto_177735 ) ( CLEAR ?auto_177737 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177729 ?auto_177730 ?auto_177731 ?auto_177734 ?auto_177737 ?auto_177735 )
      ( MAKE-3PILE ?auto_177729 ?auto_177730 ?auto_177731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177738 - BLOCK
      ?auto_177739 - BLOCK
      ?auto_177740 - BLOCK
    )
    :vars
    (
      ?auto_177741 - BLOCK
      ?auto_177743 - BLOCK
      ?auto_177745 - BLOCK
      ?auto_177742 - BLOCK
      ?auto_177744 - BLOCK
      ?auto_177746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177741 ?auto_177740 ) ( ON-TABLE ?auto_177738 ) ( ON ?auto_177739 ?auto_177738 ) ( ON ?auto_177740 ?auto_177739 ) ( not ( = ?auto_177738 ?auto_177739 ) ) ( not ( = ?auto_177738 ?auto_177740 ) ) ( not ( = ?auto_177738 ?auto_177741 ) ) ( not ( = ?auto_177739 ?auto_177740 ) ) ( not ( = ?auto_177739 ?auto_177741 ) ) ( not ( = ?auto_177740 ?auto_177741 ) ) ( not ( = ?auto_177738 ?auto_177743 ) ) ( not ( = ?auto_177738 ?auto_177745 ) ) ( not ( = ?auto_177739 ?auto_177743 ) ) ( not ( = ?auto_177739 ?auto_177745 ) ) ( not ( = ?auto_177740 ?auto_177743 ) ) ( not ( = ?auto_177740 ?auto_177745 ) ) ( not ( = ?auto_177741 ?auto_177743 ) ) ( not ( = ?auto_177741 ?auto_177745 ) ) ( not ( = ?auto_177743 ?auto_177745 ) ) ( ON ?auto_177743 ?auto_177741 ) ( not ( = ?auto_177742 ?auto_177744 ) ) ( not ( = ?auto_177742 ?auto_177745 ) ) ( not ( = ?auto_177744 ?auto_177745 ) ) ( not ( = ?auto_177738 ?auto_177744 ) ) ( not ( = ?auto_177738 ?auto_177742 ) ) ( not ( = ?auto_177739 ?auto_177744 ) ) ( not ( = ?auto_177739 ?auto_177742 ) ) ( not ( = ?auto_177740 ?auto_177744 ) ) ( not ( = ?auto_177740 ?auto_177742 ) ) ( not ( = ?auto_177741 ?auto_177744 ) ) ( not ( = ?auto_177741 ?auto_177742 ) ) ( not ( = ?auto_177743 ?auto_177744 ) ) ( not ( = ?auto_177743 ?auto_177742 ) ) ( ON ?auto_177742 ?auto_177746 ) ( not ( = ?auto_177738 ?auto_177746 ) ) ( not ( = ?auto_177739 ?auto_177746 ) ) ( not ( = ?auto_177740 ?auto_177746 ) ) ( not ( = ?auto_177741 ?auto_177746 ) ) ( not ( = ?auto_177743 ?auto_177746 ) ) ( not ( = ?auto_177745 ?auto_177746 ) ) ( not ( = ?auto_177742 ?auto_177746 ) ) ( not ( = ?auto_177744 ?auto_177746 ) ) ( ON ?auto_177744 ?auto_177742 ) ( ON-TABLE ?auto_177746 ) ( CLEAR ?auto_177743 ) ( ON ?auto_177745 ?auto_177744 ) ( CLEAR ?auto_177745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177746 ?auto_177742 ?auto_177744 )
      ( MAKE-3PILE ?auto_177738 ?auto_177739 ?auto_177740 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177747 - BLOCK
      ?auto_177748 - BLOCK
      ?auto_177749 - BLOCK
    )
    :vars
    (
      ?auto_177754 - BLOCK
      ?auto_177750 - BLOCK
      ?auto_177752 - BLOCK
      ?auto_177751 - BLOCK
      ?auto_177755 - BLOCK
      ?auto_177753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177754 ?auto_177749 ) ( ON-TABLE ?auto_177747 ) ( ON ?auto_177748 ?auto_177747 ) ( ON ?auto_177749 ?auto_177748 ) ( not ( = ?auto_177747 ?auto_177748 ) ) ( not ( = ?auto_177747 ?auto_177749 ) ) ( not ( = ?auto_177747 ?auto_177754 ) ) ( not ( = ?auto_177748 ?auto_177749 ) ) ( not ( = ?auto_177748 ?auto_177754 ) ) ( not ( = ?auto_177749 ?auto_177754 ) ) ( not ( = ?auto_177747 ?auto_177750 ) ) ( not ( = ?auto_177747 ?auto_177752 ) ) ( not ( = ?auto_177748 ?auto_177750 ) ) ( not ( = ?auto_177748 ?auto_177752 ) ) ( not ( = ?auto_177749 ?auto_177750 ) ) ( not ( = ?auto_177749 ?auto_177752 ) ) ( not ( = ?auto_177754 ?auto_177750 ) ) ( not ( = ?auto_177754 ?auto_177752 ) ) ( not ( = ?auto_177750 ?auto_177752 ) ) ( not ( = ?auto_177751 ?auto_177755 ) ) ( not ( = ?auto_177751 ?auto_177752 ) ) ( not ( = ?auto_177755 ?auto_177752 ) ) ( not ( = ?auto_177747 ?auto_177755 ) ) ( not ( = ?auto_177747 ?auto_177751 ) ) ( not ( = ?auto_177748 ?auto_177755 ) ) ( not ( = ?auto_177748 ?auto_177751 ) ) ( not ( = ?auto_177749 ?auto_177755 ) ) ( not ( = ?auto_177749 ?auto_177751 ) ) ( not ( = ?auto_177754 ?auto_177755 ) ) ( not ( = ?auto_177754 ?auto_177751 ) ) ( not ( = ?auto_177750 ?auto_177755 ) ) ( not ( = ?auto_177750 ?auto_177751 ) ) ( ON ?auto_177751 ?auto_177753 ) ( not ( = ?auto_177747 ?auto_177753 ) ) ( not ( = ?auto_177748 ?auto_177753 ) ) ( not ( = ?auto_177749 ?auto_177753 ) ) ( not ( = ?auto_177754 ?auto_177753 ) ) ( not ( = ?auto_177750 ?auto_177753 ) ) ( not ( = ?auto_177752 ?auto_177753 ) ) ( not ( = ?auto_177751 ?auto_177753 ) ) ( not ( = ?auto_177755 ?auto_177753 ) ) ( ON ?auto_177755 ?auto_177751 ) ( ON-TABLE ?auto_177753 ) ( ON ?auto_177752 ?auto_177755 ) ( CLEAR ?auto_177752 ) ( HOLDING ?auto_177750 ) ( CLEAR ?auto_177754 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177747 ?auto_177748 ?auto_177749 ?auto_177754 ?auto_177750 )
      ( MAKE-3PILE ?auto_177747 ?auto_177748 ?auto_177749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177756 - BLOCK
      ?auto_177757 - BLOCK
      ?auto_177758 - BLOCK
    )
    :vars
    (
      ?auto_177763 - BLOCK
      ?auto_177762 - BLOCK
      ?auto_177760 - BLOCK
      ?auto_177761 - BLOCK
      ?auto_177759 - BLOCK
      ?auto_177764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177763 ?auto_177758 ) ( ON-TABLE ?auto_177756 ) ( ON ?auto_177757 ?auto_177756 ) ( ON ?auto_177758 ?auto_177757 ) ( not ( = ?auto_177756 ?auto_177757 ) ) ( not ( = ?auto_177756 ?auto_177758 ) ) ( not ( = ?auto_177756 ?auto_177763 ) ) ( not ( = ?auto_177757 ?auto_177758 ) ) ( not ( = ?auto_177757 ?auto_177763 ) ) ( not ( = ?auto_177758 ?auto_177763 ) ) ( not ( = ?auto_177756 ?auto_177762 ) ) ( not ( = ?auto_177756 ?auto_177760 ) ) ( not ( = ?auto_177757 ?auto_177762 ) ) ( not ( = ?auto_177757 ?auto_177760 ) ) ( not ( = ?auto_177758 ?auto_177762 ) ) ( not ( = ?auto_177758 ?auto_177760 ) ) ( not ( = ?auto_177763 ?auto_177762 ) ) ( not ( = ?auto_177763 ?auto_177760 ) ) ( not ( = ?auto_177762 ?auto_177760 ) ) ( not ( = ?auto_177761 ?auto_177759 ) ) ( not ( = ?auto_177761 ?auto_177760 ) ) ( not ( = ?auto_177759 ?auto_177760 ) ) ( not ( = ?auto_177756 ?auto_177759 ) ) ( not ( = ?auto_177756 ?auto_177761 ) ) ( not ( = ?auto_177757 ?auto_177759 ) ) ( not ( = ?auto_177757 ?auto_177761 ) ) ( not ( = ?auto_177758 ?auto_177759 ) ) ( not ( = ?auto_177758 ?auto_177761 ) ) ( not ( = ?auto_177763 ?auto_177759 ) ) ( not ( = ?auto_177763 ?auto_177761 ) ) ( not ( = ?auto_177762 ?auto_177759 ) ) ( not ( = ?auto_177762 ?auto_177761 ) ) ( ON ?auto_177761 ?auto_177764 ) ( not ( = ?auto_177756 ?auto_177764 ) ) ( not ( = ?auto_177757 ?auto_177764 ) ) ( not ( = ?auto_177758 ?auto_177764 ) ) ( not ( = ?auto_177763 ?auto_177764 ) ) ( not ( = ?auto_177762 ?auto_177764 ) ) ( not ( = ?auto_177760 ?auto_177764 ) ) ( not ( = ?auto_177761 ?auto_177764 ) ) ( not ( = ?auto_177759 ?auto_177764 ) ) ( ON ?auto_177759 ?auto_177761 ) ( ON-TABLE ?auto_177764 ) ( ON ?auto_177760 ?auto_177759 ) ( CLEAR ?auto_177763 ) ( ON ?auto_177762 ?auto_177760 ) ( CLEAR ?auto_177762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177764 ?auto_177761 ?auto_177759 ?auto_177760 )
      ( MAKE-3PILE ?auto_177756 ?auto_177757 ?auto_177758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177783 - BLOCK
      ?auto_177784 - BLOCK
      ?auto_177785 - BLOCK
    )
    :vars
    (
      ?auto_177790 - BLOCK
      ?auto_177788 - BLOCK
      ?auto_177787 - BLOCK
      ?auto_177791 - BLOCK
      ?auto_177789 - BLOCK
      ?auto_177786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177783 ) ( ON ?auto_177784 ?auto_177783 ) ( not ( = ?auto_177783 ?auto_177784 ) ) ( not ( = ?auto_177783 ?auto_177785 ) ) ( not ( = ?auto_177783 ?auto_177790 ) ) ( not ( = ?auto_177784 ?auto_177785 ) ) ( not ( = ?auto_177784 ?auto_177790 ) ) ( not ( = ?auto_177785 ?auto_177790 ) ) ( not ( = ?auto_177783 ?auto_177788 ) ) ( not ( = ?auto_177783 ?auto_177787 ) ) ( not ( = ?auto_177784 ?auto_177788 ) ) ( not ( = ?auto_177784 ?auto_177787 ) ) ( not ( = ?auto_177785 ?auto_177788 ) ) ( not ( = ?auto_177785 ?auto_177787 ) ) ( not ( = ?auto_177790 ?auto_177788 ) ) ( not ( = ?auto_177790 ?auto_177787 ) ) ( not ( = ?auto_177788 ?auto_177787 ) ) ( not ( = ?auto_177791 ?auto_177789 ) ) ( not ( = ?auto_177791 ?auto_177787 ) ) ( not ( = ?auto_177789 ?auto_177787 ) ) ( not ( = ?auto_177783 ?auto_177789 ) ) ( not ( = ?auto_177783 ?auto_177791 ) ) ( not ( = ?auto_177784 ?auto_177789 ) ) ( not ( = ?auto_177784 ?auto_177791 ) ) ( not ( = ?auto_177785 ?auto_177789 ) ) ( not ( = ?auto_177785 ?auto_177791 ) ) ( not ( = ?auto_177790 ?auto_177789 ) ) ( not ( = ?auto_177790 ?auto_177791 ) ) ( not ( = ?auto_177788 ?auto_177789 ) ) ( not ( = ?auto_177788 ?auto_177791 ) ) ( ON ?auto_177791 ?auto_177786 ) ( not ( = ?auto_177783 ?auto_177786 ) ) ( not ( = ?auto_177784 ?auto_177786 ) ) ( not ( = ?auto_177785 ?auto_177786 ) ) ( not ( = ?auto_177790 ?auto_177786 ) ) ( not ( = ?auto_177788 ?auto_177786 ) ) ( not ( = ?auto_177787 ?auto_177786 ) ) ( not ( = ?auto_177791 ?auto_177786 ) ) ( not ( = ?auto_177789 ?auto_177786 ) ) ( ON ?auto_177789 ?auto_177791 ) ( ON-TABLE ?auto_177786 ) ( ON ?auto_177787 ?auto_177789 ) ( ON ?auto_177788 ?auto_177787 ) ( ON ?auto_177790 ?auto_177788 ) ( CLEAR ?auto_177790 ) ( HOLDING ?auto_177785 ) ( CLEAR ?auto_177784 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177783 ?auto_177784 ?auto_177785 ?auto_177790 )
      ( MAKE-3PILE ?auto_177783 ?auto_177784 ?auto_177785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177792 - BLOCK
      ?auto_177793 - BLOCK
      ?auto_177794 - BLOCK
    )
    :vars
    (
      ?auto_177798 - BLOCK
      ?auto_177796 - BLOCK
      ?auto_177797 - BLOCK
      ?auto_177795 - BLOCK
      ?auto_177800 - BLOCK
      ?auto_177799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177792 ) ( ON ?auto_177793 ?auto_177792 ) ( not ( = ?auto_177792 ?auto_177793 ) ) ( not ( = ?auto_177792 ?auto_177794 ) ) ( not ( = ?auto_177792 ?auto_177798 ) ) ( not ( = ?auto_177793 ?auto_177794 ) ) ( not ( = ?auto_177793 ?auto_177798 ) ) ( not ( = ?auto_177794 ?auto_177798 ) ) ( not ( = ?auto_177792 ?auto_177796 ) ) ( not ( = ?auto_177792 ?auto_177797 ) ) ( not ( = ?auto_177793 ?auto_177796 ) ) ( not ( = ?auto_177793 ?auto_177797 ) ) ( not ( = ?auto_177794 ?auto_177796 ) ) ( not ( = ?auto_177794 ?auto_177797 ) ) ( not ( = ?auto_177798 ?auto_177796 ) ) ( not ( = ?auto_177798 ?auto_177797 ) ) ( not ( = ?auto_177796 ?auto_177797 ) ) ( not ( = ?auto_177795 ?auto_177800 ) ) ( not ( = ?auto_177795 ?auto_177797 ) ) ( not ( = ?auto_177800 ?auto_177797 ) ) ( not ( = ?auto_177792 ?auto_177800 ) ) ( not ( = ?auto_177792 ?auto_177795 ) ) ( not ( = ?auto_177793 ?auto_177800 ) ) ( not ( = ?auto_177793 ?auto_177795 ) ) ( not ( = ?auto_177794 ?auto_177800 ) ) ( not ( = ?auto_177794 ?auto_177795 ) ) ( not ( = ?auto_177798 ?auto_177800 ) ) ( not ( = ?auto_177798 ?auto_177795 ) ) ( not ( = ?auto_177796 ?auto_177800 ) ) ( not ( = ?auto_177796 ?auto_177795 ) ) ( ON ?auto_177795 ?auto_177799 ) ( not ( = ?auto_177792 ?auto_177799 ) ) ( not ( = ?auto_177793 ?auto_177799 ) ) ( not ( = ?auto_177794 ?auto_177799 ) ) ( not ( = ?auto_177798 ?auto_177799 ) ) ( not ( = ?auto_177796 ?auto_177799 ) ) ( not ( = ?auto_177797 ?auto_177799 ) ) ( not ( = ?auto_177795 ?auto_177799 ) ) ( not ( = ?auto_177800 ?auto_177799 ) ) ( ON ?auto_177800 ?auto_177795 ) ( ON-TABLE ?auto_177799 ) ( ON ?auto_177797 ?auto_177800 ) ( ON ?auto_177796 ?auto_177797 ) ( ON ?auto_177798 ?auto_177796 ) ( CLEAR ?auto_177793 ) ( ON ?auto_177794 ?auto_177798 ) ( CLEAR ?auto_177794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177799 ?auto_177795 ?auto_177800 ?auto_177797 ?auto_177796 ?auto_177798 )
      ( MAKE-3PILE ?auto_177792 ?auto_177793 ?auto_177794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177801 - BLOCK
      ?auto_177802 - BLOCK
      ?auto_177803 - BLOCK
    )
    :vars
    (
      ?auto_177804 - BLOCK
      ?auto_177809 - BLOCK
      ?auto_177805 - BLOCK
      ?auto_177807 - BLOCK
      ?auto_177808 - BLOCK
      ?auto_177806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177801 ) ( not ( = ?auto_177801 ?auto_177802 ) ) ( not ( = ?auto_177801 ?auto_177803 ) ) ( not ( = ?auto_177801 ?auto_177804 ) ) ( not ( = ?auto_177802 ?auto_177803 ) ) ( not ( = ?auto_177802 ?auto_177804 ) ) ( not ( = ?auto_177803 ?auto_177804 ) ) ( not ( = ?auto_177801 ?auto_177809 ) ) ( not ( = ?auto_177801 ?auto_177805 ) ) ( not ( = ?auto_177802 ?auto_177809 ) ) ( not ( = ?auto_177802 ?auto_177805 ) ) ( not ( = ?auto_177803 ?auto_177809 ) ) ( not ( = ?auto_177803 ?auto_177805 ) ) ( not ( = ?auto_177804 ?auto_177809 ) ) ( not ( = ?auto_177804 ?auto_177805 ) ) ( not ( = ?auto_177809 ?auto_177805 ) ) ( not ( = ?auto_177807 ?auto_177808 ) ) ( not ( = ?auto_177807 ?auto_177805 ) ) ( not ( = ?auto_177808 ?auto_177805 ) ) ( not ( = ?auto_177801 ?auto_177808 ) ) ( not ( = ?auto_177801 ?auto_177807 ) ) ( not ( = ?auto_177802 ?auto_177808 ) ) ( not ( = ?auto_177802 ?auto_177807 ) ) ( not ( = ?auto_177803 ?auto_177808 ) ) ( not ( = ?auto_177803 ?auto_177807 ) ) ( not ( = ?auto_177804 ?auto_177808 ) ) ( not ( = ?auto_177804 ?auto_177807 ) ) ( not ( = ?auto_177809 ?auto_177808 ) ) ( not ( = ?auto_177809 ?auto_177807 ) ) ( ON ?auto_177807 ?auto_177806 ) ( not ( = ?auto_177801 ?auto_177806 ) ) ( not ( = ?auto_177802 ?auto_177806 ) ) ( not ( = ?auto_177803 ?auto_177806 ) ) ( not ( = ?auto_177804 ?auto_177806 ) ) ( not ( = ?auto_177809 ?auto_177806 ) ) ( not ( = ?auto_177805 ?auto_177806 ) ) ( not ( = ?auto_177807 ?auto_177806 ) ) ( not ( = ?auto_177808 ?auto_177806 ) ) ( ON ?auto_177808 ?auto_177807 ) ( ON-TABLE ?auto_177806 ) ( ON ?auto_177805 ?auto_177808 ) ( ON ?auto_177809 ?auto_177805 ) ( ON ?auto_177804 ?auto_177809 ) ( ON ?auto_177803 ?auto_177804 ) ( CLEAR ?auto_177803 ) ( HOLDING ?auto_177802 ) ( CLEAR ?auto_177801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177801 ?auto_177802 )
      ( MAKE-3PILE ?auto_177801 ?auto_177802 ?auto_177803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177810 - BLOCK
      ?auto_177811 - BLOCK
      ?auto_177812 - BLOCK
    )
    :vars
    (
      ?auto_177813 - BLOCK
      ?auto_177818 - BLOCK
      ?auto_177814 - BLOCK
      ?auto_177815 - BLOCK
      ?auto_177817 - BLOCK
      ?auto_177816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177810 ) ( not ( = ?auto_177810 ?auto_177811 ) ) ( not ( = ?auto_177810 ?auto_177812 ) ) ( not ( = ?auto_177810 ?auto_177813 ) ) ( not ( = ?auto_177811 ?auto_177812 ) ) ( not ( = ?auto_177811 ?auto_177813 ) ) ( not ( = ?auto_177812 ?auto_177813 ) ) ( not ( = ?auto_177810 ?auto_177818 ) ) ( not ( = ?auto_177810 ?auto_177814 ) ) ( not ( = ?auto_177811 ?auto_177818 ) ) ( not ( = ?auto_177811 ?auto_177814 ) ) ( not ( = ?auto_177812 ?auto_177818 ) ) ( not ( = ?auto_177812 ?auto_177814 ) ) ( not ( = ?auto_177813 ?auto_177818 ) ) ( not ( = ?auto_177813 ?auto_177814 ) ) ( not ( = ?auto_177818 ?auto_177814 ) ) ( not ( = ?auto_177815 ?auto_177817 ) ) ( not ( = ?auto_177815 ?auto_177814 ) ) ( not ( = ?auto_177817 ?auto_177814 ) ) ( not ( = ?auto_177810 ?auto_177817 ) ) ( not ( = ?auto_177810 ?auto_177815 ) ) ( not ( = ?auto_177811 ?auto_177817 ) ) ( not ( = ?auto_177811 ?auto_177815 ) ) ( not ( = ?auto_177812 ?auto_177817 ) ) ( not ( = ?auto_177812 ?auto_177815 ) ) ( not ( = ?auto_177813 ?auto_177817 ) ) ( not ( = ?auto_177813 ?auto_177815 ) ) ( not ( = ?auto_177818 ?auto_177817 ) ) ( not ( = ?auto_177818 ?auto_177815 ) ) ( ON ?auto_177815 ?auto_177816 ) ( not ( = ?auto_177810 ?auto_177816 ) ) ( not ( = ?auto_177811 ?auto_177816 ) ) ( not ( = ?auto_177812 ?auto_177816 ) ) ( not ( = ?auto_177813 ?auto_177816 ) ) ( not ( = ?auto_177818 ?auto_177816 ) ) ( not ( = ?auto_177814 ?auto_177816 ) ) ( not ( = ?auto_177815 ?auto_177816 ) ) ( not ( = ?auto_177817 ?auto_177816 ) ) ( ON ?auto_177817 ?auto_177815 ) ( ON-TABLE ?auto_177816 ) ( ON ?auto_177814 ?auto_177817 ) ( ON ?auto_177818 ?auto_177814 ) ( ON ?auto_177813 ?auto_177818 ) ( ON ?auto_177812 ?auto_177813 ) ( CLEAR ?auto_177810 ) ( ON ?auto_177811 ?auto_177812 ) ( CLEAR ?auto_177811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177816 ?auto_177815 ?auto_177817 ?auto_177814 ?auto_177818 ?auto_177813 ?auto_177812 )
      ( MAKE-3PILE ?auto_177810 ?auto_177811 ?auto_177812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177819 - BLOCK
      ?auto_177820 - BLOCK
      ?auto_177821 - BLOCK
    )
    :vars
    (
      ?auto_177826 - BLOCK
      ?auto_177822 - BLOCK
      ?auto_177827 - BLOCK
      ?auto_177825 - BLOCK
      ?auto_177824 - BLOCK
      ?auto_177823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177819 ?auto_177820 ) ) ( not ( = ?auto_177819 ?auto_177821 ) ) ( not ( = ?auto_177819 ?auto_177826 ) ) ( not ( = ?auto_177820 ?auto_177821 ) ) ( not ( = ?auto_177820 ?auto_177826 ) ) ( not ( = ?auto_177821 ?auto_177826 ) ) ( not ( = ?auto_177819 ?auto_177822 ) ) ( not ( = ?auto_177819 ?auto_177827 ) ) ( not ( = ?auto_177820 ?auto_177822 ) ) ( not ( = ?auto_177820 ?auto_177827 ) ) ( not ( = ?auto_177821 ?auto_177822 ) ) ( not ( = ?auto_177821 ?auto_177827 ) ) ( not ( = ?auto_177826 ?auto_177822 ) ) ( not ( = ?auto_177826 ?auto_177827 ) ) ( not ( = ?auto_177822 ?auto_177827 ) ) ( not ( = ?auto_177825 ?auto_177824 ) ) ( not ( = ?auto_177825 ?auto_177827 ) ) ( not ( = ?auto_177824 ?auto_177827 ) ) ( not ( = ?auto_177819 ?auto_177824 ) ) ( not ( = ?auto_177819 ?auto_177825 ) ) ( not ( = ?auto_177820 ?auto_177824 ) ) ( not ( = ?auto_177820 ?auto_177825 ) ) ( not ( = ?auto_177821 ?auto_177824 ) ) ( not ( = ?auto_177821 ?auto_177825 ) ) ( not ( = ?auto_177826 ?auto_177824 ) ) ( not ( = ?auto_177826 ?auto_177825 ) ) ( not ( = ?auto_177822 ?auto_177824 ) ) ( not ( = ?auto_177822 ?auto_177825 ) ) ( ON ?auto_177825 ?auto_177823 ) ( not ( = ?auto_177819 ?auto_177823 ) ) ( not ( = ?auto_177820 ?auto_177823 ) ) ( not ( = ?auto_177821 ?auto_177823 ) ) ( not ( = ?auto_177826 ?auto_177823 ) ) ( not ( = ?auto_177822 ?auto_177823 ) ) ( not ( = ?auto_177827 ?auto_177823 ) ) ( not ( = ?auto_177825 ?auto_177823 ) ) ( not ( = ?auto_177824 ?auto_177823 ) ) ( ON ?auto_177824 ?auto_177825 ) ( ON-TABLE ?auto_177823 ) ( ON ?auto_177827 ?auto_177824 ) ( ON ?auto_177822 ?auto_177827 ) ( ON ?auto_177826 ?auto_177822 ) ( ON ?auto_177821 ?auto_177826 ) ( ON ?auto_177820 ?auto_177821 ) ( CLEAR ?auto_177820 ) ( HOLDING ?auto_177819 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177819 )
      ( MAKE-3PILE ?auto_177819 ?auto_177820 ?auto_177821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_177828 - BLOCK
      ?auto_177829 - BLOCK
      ?auto_177830 - BLOCK
    )
    :vars
    (
      ?auto_177832 - BLOCK
      ?auto_177831 - BLOCK
      ?auto_177835 - BLOCK
      ?auto_177834 - BLOCK
      ?auto_177833 - BLOCK
      ?auto_177836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177828 ?auto_177829 ) ) ( not ( = ?auto_177828 ?auto_177830 ) ) ( not ( = ?auto_177828 ?auto_177832 ) ) ( not ( = ?auto_177829 ?auto_177830 ) ) ( not ( = ?auto_177829 ?auto_177832 ) ) ( not ( = ?auto_177830 ?auto_177832 ) ) ( not ( = ?auto_177828 ?auto_177831 ) ) ( not ( = ?auto_177828 ?auto_177835 ) ) ( not ( = ?auto_177829 ?auto_177831 ) ) ( not ( = ?auto_177829 ?auto_177835 ) ) ( not ( = ?auto_177830 ?auto_177831 ) ) ( not ( = ?auto_177830 ?auto_177835 ) ) ( not ( = ?auto_177832 ?auto_177831 ) ) ( not ( = ?auto_177832 ?auto_177835 ) ) ( not ( = ?auto_177831 ?auto_177835 ) ) ( not ( = ?auto_177834 ?auto_177833 ) ) ( not ( = ?auto_177834 ?auto_177835 ) ) ( not ( = ?auto_177833 ?auto_177835 ) ) ( not ( = ?auto_177828 ?auto_177833 ) ) ( not ( = ?auto_177828 ?auto_177834 ) ) ( not ( = ?auto_177829 ?auto_177833 ) ) ( not ( = ?auto_177829 ?auto_177834 ) ) ( not ( = ?auto_177830 ?auto_177833 ) ) ( not ( = ?auto_177830 ?auto_177834 ) ) ( not ( = ?auto_177832 ?auto_177833 ) ) ( not ( = ?auto_177832 ?auto_177834 ) ) ( not ( = ?auto_177831 ?auto_177833 ) ) ( not ( = ?auto_177831 ?auto_177834 ) ) ( ON ?auto_177834 ?auto_177836 ) ( not ( = ?auto_177828 ?auto_177836 ) ) ( not ( = ?auto_177829 ?auto_177836 ) ) ( not ( = ?auto_177830 ?auto_177836 ) ) ( not ( = ?auto_177832 ?auto_177836 ) ) ( not ( = ?auto_177831 ?auto_177836 ) ) ( not ( = ?auto_177835 ?auto_177836 ) ) ( not ( = ?auto_177834 ?auto_177836 ) ) ( not ( = ?auto_177833 ?auto_177836 ) ) ( ON ?auto_177833 ?auto_177834 ) ( ON-TABLE ?auto_177836 ) ( ON ?auto_177835 ?auto_177833 ) ( ON ?auto_177831 ?auto_177835 ) ( ON ?auto_177832 ?auto_177831 ) ( ON ?auto_177830 ?auto_177832 ) ( ON ?auto_177829 ?auto_177830 ) ( ON ?auto_177828 ?auto_177829 ) ( CLEAR ?auto_177828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177836 ?auto_177834 ?auto_177833 ?auto_177835 ?auto_177831 ?auto_177832 ?auto_177830 ?auto_177829 )
      ( MAKE-3PILE ?auto_177828 ?auto_177829 ?auto_177830 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177842 - BLOCK
      ?auto_177843 - BLOCK
      ?auto_177844 - BLOCK
      ?auto_177845 - BLOCK
      ?auto_177846 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_177846 ) ( CLEAR ?auto_177845 ) ( ON-TABLE ?auto_177842 ) ( ON ?auto_177843 ?auto_177842 ) ( ON ?auto_177844 ?auto_177843 ) ( ON ?auto_177845 ?auto_177844 ) ( not ( = ?auto_177842 ?auto_177843 ) ) ( not ( = ?auto_177842 ?auto_177844 ) ) ( not ( = ?auto_177842 ?auto_177845 ) ) ( not ( = ?auto_177842 ?auto_177846 ) ) ( not ( = ?auto_177843 ?auto_177844 ) ) ( not ( = ?auto_177843 ?auto_177845 ) ) ( not ( = ?auto_177843 ?auto_177846 ) ) ( not ( = ?auto_177844 ?auto_177845 ) ) ( not ( = ?auto_177844 ?auto_177846 ) ) ( not ( = ?auto_177845 ?auto_177846 ) ) )
    :subtasks
    ( ( !STACK ?auto_177846 ?auto_177845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177847 - BLOCK
      ?auto_177848 - BLOCK
      ?auto_177849 - BLOCK
      ?auto_177850 - BLOCK
      ?auto_177851 - BLOCK
    )
    :vars
    (
      ?auto_177852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177850 ) ( ON-TABLE ?auto_177847 ) ( ON ?auto_177848 ?auto_177847 ) ( ON ?auto_177849 ?auto_177848 ) ( ON ?auto_177850 ?auto_177849 ) ( not ( = ?auto_177847 ?auto_177848 ) ) ( not ( = ?auto_177847 ?auto_177849 ) ) ( not ( = ?auto_177847 ?auto_177850 ) ) ( not ( = ?auto_177847 ?auto_177851 ) ) ( not ( = ?auto_177848 ?auto_177849 ) ) ( not ( = ?auto_177848 ?auto_177850 ) ) ( not ( = ?auto_177848 ?auto_177851 ) ) ( not ( = ?auto_177849 ?auto_177850 ) ) ( not ( = ?auto_177849 ?auto_177851 ) ) ( not ( = ?auto_177850 ?auto_177851 ) ) ( ON ?auto_177851 ?auto_177852 ) ( CLEAR ?auto_177851 ) ( HAND-EMPTY ) ( not ( = ?auto_177847 ?auto_177852 ) ) ( not ( = ?auto_177848 ?auto_177852 ) ) ( not ( = ?auto_177849 ?auto_177852 ) ) ( not ( = ?auto_177850 ?auto_177852 ) ) ( not ( = ?auto_177851 ?auto_177852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177851 ?auto_177852 )
      ( MAKE-5PILE ?auto_177847 ?auto_177848 ?auto_177849 ?auto_177850 ?auto_177851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177853 - BLOCK
      ?auto_177854 - BLOCK
      ?auto_177855 - BLOCK
      ?auto_177856 - BLOCK
      ?auto_177857 - BLOCK
    )
    :vars
    (
      ?auto_177858 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177853 ) ( ON ?auto_177854 ?auto_177853 ) ( ON ?auto_177855 ?auto_177854 ) ( not ( = ?auto_177853 ?auto_177854 ) ) ( not ( = ?auto_177853 ?auto_177855 ) ) ( not ( = ?auto_177853 ?auto_177856 ) ) ( not ( = ?auto_177853 ?auto_177857 ) ) ( not ( = ?auto_177854 ?auto_177855 ) ) ( not ( = ?auto_177854 ?auto_177856 ) ) ( not ( = ?auto_177854 ?auto_177857 ) ) ( not ( = ?auto_177855 ?auto_177856 ) ) ( not ( = ?auto_177855 ?auto_177857 ) ) ( not ( = ?auto_177856 ?auto_177857 ) ) ( ON ?auto_177857 ?auto_177858 ) ( CLEAR ?auto_177857 ) ( not ( = ?auto_177853 ?auto_177858 ) ) ( not ( = ?auto_177854 ?auto_177858 ) ) ( not ( = ?auto_177855 ?auto_177858 ) ) ( not ( = ?auto_177856 ?auto_177858 ) ) ( not ( = ?auto_177857 ?auto_177858 ) ) ( HOLDING ?auto_177856 ) ( CLEAR ?auto_177855 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177853 ?auto_177854 ?auto_177855 ?auto_177856 )
      ( MAKE-5PILE ?auto_177853 ?auto_177854 ?auto_177855 ?auto_177856 ?auto_177857 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177859 - BLOCK
      ?auto_177860 - BLOCK
      ?auto_177861 - BLOCK
      ?auto_177862 - BLOCK
      ?auto_177863 - BLOCK
    )
    :vars
    (
      ?auto_177864 - BLOCK
      ?auto_177866 - BLOCK
      ?auto_177865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177859 ) ( ON ?auto_177860 ?auto_177859 ) ( ON ?auto_177861 ?auto_177860 ) ( not ( = ?auto_177859 ?auto_177860 ) ) ( not ( = ?auto_177859 ?auto_177861 ) ) ( not ( = ?auto_177859 ?auto_177862 ) ) ( not ( = ?auto_177859 ?auto_177863 ) ) ( not ( = ?auto_177860 ?auto_177861 ) ) ( not ( = ?auto_177860 ?auto_177862 ) ) ( not ( = ?auto_177860 ?auto_177863 ) ) ( not ( = ?auto_177861 ?auto_177862 ) ) ( not ( = ?auto_177861 ?auto_177863 ) ) ( not ( = ?auto_177862 ?auto_177863 ) ) ( ON ?auto_177863 ?auto_177864 ) ( not ( = ?auto_177859 ?auto_177864 ) ) ( not ( = ?auto_177860 ?auto_177864 ) ) ( not ( = ?auto_177861 ?auto_177864 ) ) ( not ( = ?auto_177862 ?auto_177864 ) ) ( not ( = ?auto_177863 ?auto_177864 ) ) ( CLEAR ?auto_177861 ) ( ON ?auto_177862 ?auto_177863 ) ( CLEAR ?auto_177862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177866 ) ( ON ?auto_177865 ?auto_177866 ) ( ON ?auto_177864 ?auto_177865 ) ( not ( = ?auto_177866 ?auto_177865 ) ) ( not ( = ?auto_177866 ?auto_177864 ) ) ( not ( = ?auto_177866 ?auto_177863 ) ) ( not ( = ?auto_177866 ?auto_177862 ) ) ( not ( = ?auto_177865 ?auto_177864 ) ) ( not ( = ?auto_177865 ?auto_177863 ) ) ( not ( = ?auto_177865 ?auto_177862 ) ) ( not ( = ?auto_177859 ?auto_177866 ) ) ( not ( = ?auto_177859 ?auto_177865 ) ) ( not ( = ?auto_177860 ?auto_177866 ) ) ( not ( = ?auto_177860 ?auto_177865 ) ) ( not ( = ?auto_177861 ?auto_177866 ) ) ( not ( = ?auto_177861 ?auto_177865 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177866 ?auto_177865 ?auto_177864 ?auto_177863 )
      ( MAKE-5PILE ?auto_177859 ?auto_177860 ?auto_177861 ?auto_177862 ?auto_177863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177867 - BLOCK
      ?auto_177868 - BLOCK
      ?auto_177869 - BLOCK
      ?auto_177870 - BLOCK
      ?auto_177871 - BLOCK
    )
    :vars
    (
      ?auto_177873 - BLOCK
      ?auto_177872 - BLOCK
      ?auto_177874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177867 ) ( ON ?auto_177868 ?auto_177867 ) ( not ( = ?auto_177867 ?auto_177868 ) ) ( not ( = ?auto_177867 ?auto_177869 ) ) ( not ( = ?auto_177867 ?auto_177870 ) ) ( not ( = ?auto_177867 ?auto_177871 ) ) ( not ( = ?auto_177868 ?auto_177869 ) ) ( not ( = ?auto_177868 ?auto_177870 ) ) ( not ( = ?auto_177868 ?auto_177871 ) ) ( not ( = ?auto_177869 ?auto_177870 ) ) ( not ( = ?auto_177869 ?auto_177871 ) ) ( not ( = ?auto_177870 ?auto_177871 ) ) ( ON ?auto_177871 ?auto_177873 ) ( not ( = ?auto_177867 ?auto_177873 ) ) ( not ( = ?auto_177868 ?auto_177873 ) ) ( not ( = ?auto_177869 ?auto_177873 ) ) ( not ( = ?auto_177870 ?auto_177873 ) ) ( not ( = ?auto_177871 ?auto_177873 ) ) ( ON ?auto_177870 ?auto_177871 ) ( CLEAR ?auto_177870 ) ( ON-TABLE ?auto_177872 ) ( ON ?auto_177874 ?auto_177872 ) ( ON ?auto_177873 ?auto_177874 ) ( not ( = ?auto_177872 ?auto_177874 ) ) ( not ( = ?auto_177872 ?auto_177873 ) ) ( not ( = ?auto_177872 ?auto_177871 ) ) ( not ( = ?auto_177872 ?auto_177870 ) ) ( not ( = ?auto_177874 ?auto_177873 ) ) ( not ( = ?auto_177874 ?auto_177871 ) ) ( not ( = ?auto_177874 ?auto_177870 ) ) ( not ( = ?auto_177867 ?auto_177872 ) ) ( not ( = ?auto_177867 ?auto_177874 ) ) ( not ( = ?auto_177868 ?auto_177872 ) ) ( not ( = ?auto_177868 ?auto_177874 ) ) ( not ( = ?auto_177869 ?auto_177872 ) ) ( not ( = ?auto_177869 ?auto_177874 ) ) ( HOLDING ?auto_177869 ) ( CLEAR ?auto_177868 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177867 ?auto_177868 ?auto_177869 )
      ( MAKE-5PILE ?auto_177867 ?auto_177868 ?auto_177869 ?auto_177870 ?auto_177871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177875 - BLOCK
      ?auto_177876 - BLOCK
      ?auto_177877 - BLOCK
      ?auto_177878 - BLOCK
      ?auto_177879 - BLOCK
    )
    :vars
    (
      ?auto_177881 - BLOCK
      ?auto_177882 - BLOCK
      ?auto_177880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177875 ) ( ON ?auto_177876 ?auto_177875 ) ( not ( = ?auto_177875 ?auto_177876 ) ) ( not ( = ?auto_177875 ?auto_177877 ) ) ( not ( = ?auto_177875 ?auto_177878 ) ) ( not ( = ?auto_177875 ?auto_177879 ) ) ( not ( = ?auto_177876 ?auto_177877 ) ) ( not ( = ?auto_177876 ?auto_177878 ) ) ( not ( = ?auto_177876 ?auto_177879 ) ) ( not ( = ?auto_177877 ?auto_177878 ) ) ( not ( = ?auto_177877 ?auto_177879 ) ) ( not ( = ?auto_177878 ?auto_177879 ) ) ( ON ?auto_177879 ?auto_177881 ) ( not ( = ?auto_177875 ?auto_177881 ) ) ( not ( = ?auto_177876 ?auto_177881 ) ) ( not ( = ?auto_177877 ?auto_177881 ) ) ( not ( = ?auto_177878 ?auto_177881 ) ) ( not ( = ?auto_177879 ?auto_177881 ) ) ( ON ?auto_177878 ?auto_177879 ) ( ON-TABLE ?auto_177882 ) ( ON ?auto_177880 ?auto_177882 ) ( ON ?auto_177881 ?auto_177880 ) ( not ( = ?auto_177882 ?auto_177880 ) ) ( not ( = ?auto_177882 ?auto_177881 ) ) ( not ( = ?auto_177882 ?auto_177879 ) ) ( not ( = ?auto_177882 ?auto_177878 ) ) ( not ( = ?auto_177880 ?auto_177881 ) ) ( not ( = ?auto_177880 ?auto_177879 ) ) ( not ( = ?auto_177880 ?auto_177878 ) ) ( not ( = ?auto_177875 ?auto_177882 ) ) ( not ( = ?auto_177875 ?auto_177880 ) ) ( not ( = ?auto_177876 ?auto_177882 ) ) ( not ( = ?auto_177876 ?auto_177880 ) ) ( not ( = ?auto_177877 ?auto_177882 ) ) ( not ( = ?auto_177877 ?auto_177880 ) ) ( CLEAR ?auto_177876 ) ( ON ?auto_177877 ?auto_177878 ) ( CLEAR ?auto_177877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177882 ?auto_177880 ?auto_177881 ?auto_177879 ?auto_177878 )
      ( MAKE-5PILE ?auto_177875 ?auto_177876 ?auto_177877 ?auto_177878 ?auto_177879 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177883 - BLOCK
      ?auto_177884 - BLOCK
      ?auto_177885 - BLOCK
      ?auto_177886 - BLOCK
      ?auto_177887 - BLOCK
    )
    :vars
    (
      ?auto_177889 - BLOCK
      ?auto_177890 - BLOCK
      ?auto_177888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177883 ) ( not ( = ?auto_177883 ?auto_177884 ) ) ( not ( = ?auto_177883 ?auto_177885 ) ) ( not ( = ?auto_177883 ?auto_177886 ) ) ( not ( = ?auto_177883 ?auto_177887 ) ) ( not ( = ?auto_177884 ?auto_177885 ) ) ( not ( = ?auto_177884 ?auto_177886 ) ) ( not ( = ?auto_177884 ?auto_177887 ) ) ( not ( = ?auto_177885 ?auto_177886 ) ) ( not ( = ?auto_177885 ?auto_177887 ) ) ( not ( = ?auto_177886 ?auto_177887 ) ) ( ON ?auto_177887 ?auto_177889 ) ( not ( = ?auto_177883 ?auto_177889 ) ) ( not ( = ?auto_177884 ?auto_177889 ) ) ( not ( = ?auto_177885 ?auto_177889 ) ) ( not ( = ?auto_177886 ?auto_177889 ) ) ( not ( = ?auto_177887 ?auto_177889 ) ) ( ON ?auto_177886 ?auto_177887 ) ( ON-TABLE ?auto_177890 ) ( ON ?auto_177888 ?auto_177890 ) ( ON ?auto_177889 ?auto_177888 ) ( not ( = ?auto_177890 ?auto_177888 ) ) ( not ( = ?auto_177890 ?auto_177889 ) ) ( not ( = ?auto_177890 ?auto_177887 ) ) ( not ( = ?auto_177890 ?auto_177886 ) ) ( not ( = ?auto_177888 ?auto_177889 ) ) ( not ( = ?auto_177888 ?auto_177887 ) ) ( not ( = ?auto_177888 ?auto_177886 ) ) ( not ( = ?auto_177883 ?auto_177890 ) ) ( not ( = ?auto_177883 ?auto_177888 ) ) ( not ( = ?auto_177884 ?auto_177890 ) ) ( not ( = ?auto_177884 ?auto_177888 ) ) ( not ( = ?auto_177885 ?auto_177890 ) ) ( not ( = ?auto_177885 ?auto_177888 ) ) ( ON ?auto_177885 ?auto_177886 ) ( CLEAR ?auto_177885 ) ( HOLDING ?auto_177884 ) ( CLEAR ?auto_177883 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177883 ?auto_177884 )
      ( MAKE-5PILE ?auto_177883 ?auto_177884 ?auto_177885 ?auto_177886 ?auto_177887 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177891 - BLOCK
      ?auto_177892 - BLOCK
      ?auto_177893 - BLOCK
      ?auto_177894 - BLOCK
      ?auto_177895 - BLOCK
    )
    :vars
    (
      ?auto_177896 - BLOCK
      ?auto_177897 - BLOCK
      ?auto_177898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177891 ) ( not ( = ?auto_177891 ?auto_177892 ) ) ( not ( = ?auto_177891 ?auto_177893 ) ) ( not ( = ?auto_177891 ?auto_177894 ) ) ( not ( = ?auto_177891 ?auto_177895 ) ) ( not ( = ?auto_177892 ?auto_177893 ) ) ( not ( = ?auto_177892 ?auto_177894 ) ) ( not ( = ?auto_177892 ?auto_177895 ) ) ( not ( = ?auto_177893 ?auto_177894 ) ) ( not ( = ?auto_177893 ?auto_177895 ) ) ( not ( = ?auto_177894 ?auto_177895 ) ) ( ON ?auto_177895 ?auto_177896 ) ( not ( = ?auto_177891 ?auto_177896 ) ) ( not ( = ?auto_177892 ?auto_177896 ) ) ( not ( = ?auto_177893 ?auto_177896 ) ) ( not ( = ?auto_177894 ?auto_177896 ) ) ( not ( = ?auto_177895 ?auto_177896 ) ) ( ON ?auto_177894 ?auto_177895 ) ( ON-TABLE ?auto_177897 ) ( ON ?auto_177898 ?auto_177897 ) ( ON ?auto_177896 ?auto_177898 ) ( not ( = ?auto_177897 ?auto_177898 ) ) ( not ( = ?auto_177897 ?auto_177896 ) ) ( not ( = ?auto_177897 ?auto_177895 ) ) ( not ( = ?auto_177897 ?auto_177894 ) ) ( not ( = ?auto_177898 ?auto_177896 ) ) ( not ( = ?auto_177898 ?auto_177895 ) ) ( not ( = ?auto_177898 ?auto_177894 ) ) ( not ( = ?auto_177891 ?auto_177897 ) ) ( not ( = ?auto_177891 ?auto_177898 ) ) ( not ( = ?auto_177892 ?auto_177897 ) ) ( not ( = ?auto_177892 ?auto_177898 ) ) ( not ( = ?auto_177893 ?auto_177897 ) ) ( not ( = ?auto_177893 ?auto_177898 ) ) ( ON ?auto_177893 ?auto_177894 ) ( CLEAR ?auto_177891 ) ( ON ?auto_177892 ?auto_177893 ) ( CLEAR ?auto_177892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177897 ?auto_177898 ?auto_177896 ?auto_177895 ?auto_177894 ?auto_177893 )
      ( MAKE-5PILE ?auto_177891 ?auto_177892 ?auto_177893 ?auto_177894 ?auto_177895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177899 - BLOCK
      ?auto_177900 - BLOCK
      ?auto_177901 - BLOCK
      ?auto_177902 - BLOCK
      ?auto_177903 - BLOCK
    )
    :vars
    (
      ?auto_177905 - BLOCK
      ?auto_177904 - BLOCK
      ?auto_177906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177899 ?auto_177900 ) ) ( not ( = ?auto_177899 ?auto_177901 ) ) ( not ( = ?auto_177899 ?auto_177902 ) ) ( not ( = ?auto_177899 ?auto_177903 ) ) ( not ( = ?auto_177900 ?auto_177901 ) ) ( not ( = ?auto_177900 ?auto_177902 ) ) ( not ( = ?auto_177900 ?auto_177903 ) ) ( not ( = ?auto_177901 ?auto_177902 ) ) ( not ( = ?auto_177901 ?auto_177903 ) ) ( not ( = ?auto_177902 ?auto_177903 ) ) ( ON ?auto_177903 ?auto_177905 ) ( not ( = ?auto_177899 ?auto_177905 ) ) ( not ( = ?auto_177900 ?auto_177905 ) ) ( not ( = ?auto_177901 ?auto_177905 ) ) ( not ( = ?auto_177902 ?auto_177905 ) ) ( not ( = ?auto_177903 ?auto_177905 ) ) ( ON ?auto_177902 ?auto_177903 ) ( ON-TABLE ?auto_177904 ) ( ON ?auto_177906 ?auto_177904 ) ( ON ?auto_177905 ?auto_177906 ) ( not ( = ?auto_177904 ?auto_177906 ) ) ( not ( = ?auto_177904 ?auto_177905 ) ) ( not ( = ?auto_177904 ?auto_177903 ) ) ( not ( = ?auto_177904 ?auto_177902 ) ) ( not ( = ?auto_177906 ?auto_177905 ) ) ( not ( = ?auto_177906 ?auto_177903 ) ) ( not ( = ?auto_177906 ?auto_177902 ) ) ( not ( = ?auto_177899 ?auto_177904 ) ) ( not ( = ?auto_177899 ?auto_177906 ) ) ( not ( = ?auto_177900 ?auto_177904 ) ) ( not ( = ?auto_177900 ?auto_177906 ) ) ( not ( = ?auto_177901 ?auto_177904 ) ) ( not ( = ?auto_177901 ?auto_177906 ) ) ( ON ?auto_177901 ?auto_177902 ) ( ON ?auto_177900 ?auto_177901 ) ( CLEAR ?auto_177900 ) ( HOLDING ?auto_177899 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177899 )
      ( MAKE-5PILE ?auto_177899 ?auto_177900 ?auto_177901 ?auto_177902 ?auto_177903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177907 - BLOCK
      ?auto_177908 - BLOCK
      ?auto_177909 - BLOCK
      ?auto_177910 - BLOCK
      ?auto_177911 - BLOCK
    )
    :vars
    (
      ?auto_177914 - BLOCK
      ?auto_177912 - BLOCK
      ?auto_177913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177907 ?auto_177908 ) ) ( not ( = ?auto_177907 ?auto_177909 ) ) ( not ( = ?auto_177907 ?auto_177910 ) ) ( not ( = ?auto_177907 ?auto_177911 ) ) ( not ( = ?auto_177908 ?auto_177909 ) ) ( not ( = ?auto_177908 ?auto_177910 ) ) ( not ( = ?auto_177908 ?auto_177911 ) ) ( not ( = ?auto_177909 ?auto_177910 ) ) ( not ( = ?auto_177909 ?auto_177911 ) ) ( not ( = ?auto_177910 ?auto_177911 ) ) ( ON ?auto_177911 ?auto_177914 ) ( not ( = ?auto_177907 ?auto_177914 ) ) ( not ( = ?auto_177908 ?auto_177914 ) ) ( not ( = ?auto_177909 ?auto_177914 ) ) ( not ( = ?auto_177910 ?auto_177914 ) ) ( not ( = ?auto_177911 ?auto_177914 ) ) ( ON ?auto_177910 ?auto_177911 ) ( ON-TABLE ?auto_177912 ) ( ON ?auto_177913 ?auto_177912 ) ( ON ?auto_177914 ?auto_177913 ) ( not ( = ?auto_177912 ?auto_177913 ) ) ( not ( = ?auto_177912 ?auto_177914 ) ) ( not ( = ?auto_177912 ?auto_177911 ) ) ( not ( = ?auto_177912 ?auto_177910 ) ) ( not ( = ?auto_177913 ?auto_177914 ) ) ( not ( = ?auto_177913 ?auto_177911 ) ) ( not ( = ?auto_177913 ?auto_177910 ) ) ( not ( = ?auto_177907 ?auto_177912 ) ) ( not ( = ?auto_177907 ?auto_177913 ) ) ( not ( = ?auto_177908 ?auto_177912 ) ) ( not ( = ?auto_177908 ?auto_177913 ) ) ( not ( = ?auto_177909 ?auto_177912 ) ) ( not ( = ?auto_177909 ?auto_177913 ) ) ( ON ?auto_177909 ?auto_177910 ) ( ON ?auto_177908 ?auto_177909 ) ( ON ?auto_177907 ?auto_177908 ) ( CLEAR ?auto_177907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177912 ?auto_177913 ?auto_177914 ?auto_177911 ?auto_177910 ?auto_177909 ?auto_177908 )
      ( MAKE-5PILE ?auto_177907 ?auto_177908 ?auto_177909 ?auto_177910 ?auto_177911 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177915 - BLOCK
      ?auto_177916 - BLOCK
      ?auto_177917 - BLOCK
      ?auto_177918 - BLOCK
      ?auto_177919 - BLOCK
    )
    :vars
    (
      ?auto_177920 - BLOCK
      ?auto_177922 - BLOCK
      ?auto_177921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177915 ?auto_177916 ) ) ( not ( = ?auto_177915 ?auto_177917 ) ) ( not ( = ?auto_177915 ?auto_177918 ) ) ( not ( = ?auto_177915 ?auto_177919 ) ) ( not ( = ?auto_177916 ?auto_177917 ) ) ( not ( = ?auto_177916 ?auto_177918 ) ) ( not ( = ?auto_177916 ?auto_177919 ) ) ( not ( = ?auto_177917 ?auto_177918 ) ) ( not ( = ?auto_177917 ?auto_177919 ) ) ( not ( = ?auto_177918 ?auto_177919 ) ) ( ON ?auto_177919 ?auto_177920 ) ( not ( = ?auto_177915 ?auto_177920 ) ) ( not ( = ?auto_177916 ?auto_177920 ) ) ( not ( = ?auto_177917 ?auto_177920 ) ) ( not ( = ?auto_177918 ?auto_177920 ) ) ( not ( = ?auto_177919 ?auto_177920 ) ) ( ON ?auto_177918 ?auto_177919 ) ( ON-TABLE ?auto_177922 ) ( ON ?auto_177921 ?auto_177922 ) ( ON ?auto_177920 ?auto_177921 ) ( not ( = ?auto_177922 ?auto_177921 ) ) ( not ( = ?auto_177922 ?auto_177920 ) ) ( not ( = ?auto_177922 ?auto_177919 ) ) ( not ( = ?auto_177922 ?auto_177918 ) ) ( not ( = ?auto_177921 ?auto_177920 ) ) ( not ( = ?auto_177921 ?auto_177919 ) ) ( not ( = ?auto_177921 ?auto_177918 ) ) ( not ( = ?auto_177915 ?auto_177922 ) ) ( not ( = ?auto_177915 ?auto_177921 ) ) ( not ( = ?auto_177916 ?auto_177922 ) ) ( not ( = ?auto_177916 ?auto_177921 ) ) ( not ( = ?auto_177917 ?auto_177922 ) ) ( not ( = ?auto_177917 ?auto_177921 ) ) ( ON ?auto_177917 ?auto_177918 ) ( ON ?auto_177916 ?auto_177917 ) ( HOLDING ?auto_177915 ) ( CLEAR ?auto_177916 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177922 ?auto_177921 ?auto_177920 ?auto_177919 ?auto_177918 ?auto_177917 ?auto_177916 ?auto_177915 )
      ( MAKE-5PILE ?auto_177915 ?auto_177916 ?auto_177917 ?auto_177918 ?auto_177919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177923 - BLOCK
      ?auto_177924 - BLOCK
      ?auto_177925 - BLOCK
      ?auto_177926 - BLOCK
      ?auto_177927 - BLOCK
    )
    :vars
    (
      ?auto_177928 - BLOCK
      ?auto_177929 - BLOCK
      ?auto_177930 - BLOCK
      ?auto_177931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177923 ?auto_177924 ) ) ( not ( = ?auto_177923 ?auto_177925 ) ) ( not ( = ?auto_177923 ?auto_177926 ) ) ( not ( = ?auto_177923 ?auto_177927 ) ) ( not ( = ?auto_177924 ?auto_177925 ) ) ( not ( = ?auto_177924 ?auto_177926 ) ) ( not ( = ?auto_177924 ?auto_177927 ) ) ( not ( = ?auto_177925 ?auto_177926 ) ) ( not ( = ?auto_177925 ?auto_177927 ) ) ( not ( = ?auto_177926 ?auto_177927 ) ) ( ON ?auto_177927 ?auto_177928 ) ( not ( = ?auto_177923 ?auto_177928 ) ) ( not ( = ?auto_177924 ?auto_177928 ) ) ( not ( = ?auto_177925 ?auto_177928 ) ) ( not ( = ?auto_177926 ?auto_177928 ) ) ( not ( = ?auto_177927 ?auto_177928 ) ) ( ON ?auto_177926 ?auto_177927 ) ( ON-TABLE ?auto_177929 ) ( ON ?auto_177930 ?auto_177929 ) ( ON ?auto_177928 ?auto_177930 ) ( not ( = ?auto_177929 ?auto_177930 ) ) ( not ( = ?auto_177929 ?auto_177928 ) ) ( not ( = ?auto_177929 ?auto_177927 ) ) ( not ( = ?auto_177929 ?auto_177926 ) ) ( not ( = ?auto_177930 ?auto_177928 ) ) ( not ( = ?auto_177930 ?auto_177927 ) ) ( not ( = ?auto_177930 ?auto_177926 ) ) ( not ( = ?auto_177923 ?auto_177929 ) ) ( not ( = ?auto_177923 ?auto_177930 ) ) ( not ( = ?auto_177924 ?auto_177929 ) ) ( not ( = ?auto_177924 ?auto_177930 ) ) ( not ( = ?auto_177925 ?auto_177929 ) ) ( not ( = ?auto_177925 ?auto_177930 ) ) ( ON ?auto_177925 ?auto_177926 ) ( ON ?auto_177924 ?auto_177925 ) ( CLEAR ?auto_177924 ) ( ON ?auto_177923 ?auto_177931 ) ( CLEAR ?auto_177923 ) ( HAND-EMPTY ) ( not ( = ?auto_177923 ?auto_177931 ) ) ( not ( = ?auto_177924 ?auto_177931 ) ) ( not ( = ?auto_177925 ?auto_177931 ) ) ( not ( = ?auto_177926 ?auto_177931 ) ) ( not ( = ?auto_177927 ?auto_177931 ) ) ( not ( = ?auto_177928 ?auto_177931 ) ) ( not ( = ?auto_177929 ?auto_177931 ) ) ( not ( = ?auto_177930 ?auto_177931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177923 ?auto_177931 )
      ( MAKE-5PILE ?auto_177923 ?auto_177924 ?auto_177925 ?auto_177926 ?auto_177927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177932 - BLOCK
      ?auto_177933 - BLOCK
      ?auto_177934 - BLOCK
      ?auto_177935 - BLOCK
      ?auto_177936 - BLOCK
    )
    :vars
    (
      ?auto_177939 - BLOCK
      ?auto_177940 - BLOCK
      ?auto_177938 - BLOCK
      ?auto_177937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177932 ?auto_177933 ) ) ( not ( = ?auto_177932 ?auto_177934 ) ) ( not ( = ?auto_177932 ?auto_177935 ) ) ( not ( = ?auto_177932 ?auto_177936 ) ) ( not ( = ?auto_177933 ?auto_177934 ) ) ( not ( = ?auto_177933 ?auto_177935 ) ) ( not ( = ?auto_177933 ?auto_177936 ) ) ( not ( = ?auto_177934 ?auto_177935 ) ) ( not ( = ?auto_177934 ?auto_177936 ) ) ( not ( = ?auto_177935 ?auto_177936 ) ) ( ON ?auto_177936 ?auto_177939 ) ( not ( = ?auto_177932 ?auto_177939 ) ) ( not ( = ?auto_177933 ?auto_177939 ) ) ( not ( = ?auto_177934 ?auto_177939 ) ) ( not ( = ?auto_177935 ?auto_177939 ) ) ( not ( = ?auto_177936 ?auto_177939 ) ) ( ON ?auto_177935 ?auto_177936 ) ( ON-TABLE ?auto_177940 ) ( ON ?auto_177938 ?auto_177940 ) ( ON ?auto_177939 ?auto_177938 ) ( not ( = ?auto_177940 ?auto_177938 ) ) ( not ( = ?auto_177940 ?auto_177939 ) ) ( not ( = ?auto_177940 ?auto_177936 ) ) ( not ( = ?auto_177940 ?auto_177935 ) ) ( not ( = ?auto_177938 ?auto_177939 ) ) ( not ( = ?auto_177938 ?auto_177936 ) ) ( not ( = ?auto_177938 ?auto_177935 ) ) ( not ( = ?auto_177932 ?auto_177940 ) ) ( not ( = ?auto_177932 ?auto_177938 ) ) ( not ( = ?auto_177933 ?auto_177940 ) ) ( not ( = ?auto_177933 ?auto_177938 ) ) ( not ( = ?auto_177934 ?auto_177940 ) ) ( not ( = ?auto_177934 ?auto_177938 ) ) ( ON ?auto_177934 ?auto_177935 ) ( ON ?auto_177932 ?auto_177937 ) ( CLEAR ?auto_177932 ) ( not ( = ?auto_177932 ?auto_177937 ) ) ( not ( = ?auto_177933 ?auto_177937 ) ) ( not ( = ?auto_177934 ?auto_177937 ) ) ( not ( = ?auto_177935 ?auto_177937 ) ) ( not ( = ?auto_177936 ?auto_177937 ) ) ( not ( = ?auto_177939 ?auto_177937 ) ) ( not ( = ?auto_177940 ?auto_177937 ) ) ( not ( = ?auto_177938 ?auto_177937 ) ) ( HOLDING ?auto_177933 ) ( CLEAR ?auto_177934 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177940 ?auto_177938 ?auto_177939 ?auto_177936 ?auto_177935 ?auto_177934 ?auto_177933 )
      ( MAKE-5PILE ?auto_177932 ?auto_177933 ?auto_177934 ?auto_177935 ?auto_177936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177941 - BLOCK
      ?auto_177942 - BLOCK
      ?auto_177943 - BLOCK
      ?auto_177944 - BLOCK
      ?auto_177945 - BLOCK
    )
    :vars
    (
      ?auto_177946 - BLOCK
      ?auto_177947 - BLOCK
      ?auto_177948 - BLOCK
      ?auto_177949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177941 ?auto_177942 ) ) ( not ( = ?auto_177941 ?auto_177943 ) ) ( not ( = ?auto_177941 ?auto_177944 ) ) ( not ( = ?auto_177941 ?auto_177945 ) ) ( not ( = ?auto_177942 ?auto_177943 ) ) ( not ( = ?auto_177942 ?auto_177944 ) ) ( not ( = ?auto_177942 ?auto_177945 ) ) ( not ( = ?auto_177943 ?auto_177944 ) ) ( not ( = ?auto_177943 ?auto_177945 ) ) ( not ( = ?auto_177944 ?auto_177945 ) ) ( ON ?auto_177945 ?auto_177946 ) ( not ( = ?auto_177941 ?auto_177946 ) ) ( not ( = ?auto_177942 ?auto_177946 ) ) ( not ( = ?auto_177943 ?auto_177946 ) ) ( not ( = ?auto_177944 ?auto_177946 ) ) ( not ( = ?auto_177945 ?auto_177946 ) ) ( ON ?auto_177944 ?auto_177945 ) ( ON-TABLE ?auto_177947 ) ( ON ?auto_177948 ?auto_177947 ) ( ON ?auto_177946 ?auto_177948 ) ( not ( = ?auto_177947 ?auto_177948 ) ) ( not ( = ?auto_177947 ?auto_177946 ) ) ( not ( = ?auto_177947 ?auto_177945 ) ) ( not ( = ?auto_177947 ?auto_177944 ) ) ( not ( = ?auto_177948 ?auto_177946 ) ) ( not ( = ?auto_177948 ?auto_177945 ) ) ( not ( = ?auto_177948 ?auto_177944 ) ) ( not ( = ?auto_177941 ?auto_177947 ) ) ( not ( = ?auto_177941 ?auto_177948 ) ) ( not ( = ?auto_177942 ?auto_177947 ) ) ( not ( = ?auto_177942 ?auto_177948 ) ) ( not ( = ?auto_177943 ?auto_177947 ) ) ( not ( = ?auto_177943 ?auto_177948 ) ) ( ON ?auto_177943 ?auto_177944 ) ( ON ?auto_177941 ?auto_177949 ) ( not ( = ?auto_177941 ?auto_177949 ) ) ( not ( = ?auto_177942 ?auto_177949 ) ) ( not ( = ?auto_177943 ?auto_177949 ) ) ( not ( = ?auto_177944 ?auto_177949 ) ) ( not ( = ?auto_177945 ?auto_177949 ) ) ( not ( = ?auto_177946 ?auto_177949 ) ) ( not ( = ?auto_177947 ?auto_177949 ) ) ( not ( = ?auto_177948 ?auto_177949 ) ) ( CLEAR ?auto_177943 ) ( ON ?auto_177942 ?auto_177941 ) ( CLEAR ?auto_177942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177949 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177949 ?auto_177941 )
      ( MAKE-5PILE ?auto_177941 ?auto_177942 ?auto_177943 ?auto_177944 ?auto_177945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177950 - BLOCK
      ?auto_177951 - BLOCK
      ?auto_177952 - BLOCK
      ?auto_177953 - BLOCK
      ?auto_177954 - BLOCK
    )
    :vars
    (
      ?auto_177958 - BLOCK
      ?auto_177957 - BLOCK
      ?auto_177955 - BLOCK
      ?auto_177956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177950 ?auto_177951 ) ) ( not ( = ?auto_177950 ?auto_177952 ) ) ( not ( = ?auto_177950 ?auto_177953 ) ) ( not ( = ?auto_177950 ?auto_177954 ) ) ( not ( = ?auto_177951 ?auto_177952 ) ) ( not ( = ?auto_177951 ?auto_177953 ) ) ( not ( = ?auto_177951 ?auto_177954 ) ) ( not ( = ?auto_177952 ?auto_177953 ) ) ( not ( = ?auto_177952 ?auto_177954 ) ) ( not ( = ?auto_177953 ?auto_177954 ) ) ( ON ?auto_177954 ?auto_177958 ) ( not ( = ?auto_177950 ?auto_177958 ) ) ( not ( = ?auto_177951 ?auto_177958 ) ) ( not ( = ?auto_177952 ?auto_177958 ) ) ( not ( = ?auto_177953 ?auto_177958 ) ) ( not ( = ?auto_177954 ?auto_177958 ) ) ( ON ?auto_177953 ?auto_177954 ) ( ON-TABLE ?auto_177957 ) ( ON ?auto_177955 ?auto_177957 ) ( ON ?auto_177958 ?auto_177955 ) ( not ( = ?auto_177957 ?auto_177955 ) ) ( not ( = ?auto_177957 ?auto_177958 ) ) ( not ( = ?auto_177957 ?auto_177954 ) ) ( not ( = ?auto_177957 ?auto_177953 ) ) ( not ( = ?auto_177955 ?auto_177958 ) ) ( not ( = ?auto_177955 ?auto_177954 ) ) ( not ( = ?auto_177955 ?auto_177953 ) ) ( not ( = ?auto_177950 ?auto_177957 ) ) ( not ( = ?auto_177950 ?auto_177955 ) ) ( not ( = ?auto_177951 ?auto_177957 ) ) ( not ( = ?auto_177951 ?auto_177955 ) ) ( not ( = ?auto_177952 ?auto_177957 ) ) ( not ( = ?auto_177952 ?auto_177955 ) ) ( ON ?auto_177950 ?auto_177956 ) ( not ( = ?auto_177950 ?auto_177956 ) ) ( not ( = ?auto_177951 ?auto_177956 ) ) ( not ( = ?auto_177952 ?auto_177956 ) ) ( not ( = ?auto_177953 ?auto_177956 ) ) ( not ( = ?auto_177954 ?auto_177956 ) ) ( not ( = ?auto_177958 ?auto_177956 ) ) ( not ( = ?auto_177957 ?auto_177956 ) ) ( not ( = ?auto_177955 ?auto_177956 ) ) ( ON ?auto_177951 ?auto_177950 ) ( CLEAR ?auto_177951 ) ( ON-TABLE ?auto_177956 ) ( HOLDING ?auto_177952 ) ( CLEAR ?auto_177953 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177957 ?auto_177955 ?auto_177958 ?auto_177954 ?auto_177953 ?auto_177952 )
      ( MAKE-5PILE ?auto_177950 ?auto_177951 ?auto_177952 ?auto_177953 ?auto_177954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177959 - BLOCK
      ?auto_177960 - BLOCK
      ?auto_177961 - BLOCK
      ?auto_177962 - BLOCK
      ?auto_177963 - BLOCK
    )
    :vars
    (
      ?auto_177964 - BLOCK
      ?auto_177966 - BLOCK
      ?auto_177965 - BLOCK
      ?auto_177967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177959 ?auto_177960 ) ) ( not ( = ?auto_177959 ?auto_177961 ) ) ( not ( = ?auto_177959 ?auto_177962 ) ) ( not ( = ?auto_177959 ?auto_177963 ) ) ( not ( = ?auto_177960 ?auto_177961 ) ) ( not ( = ?auto_177960 ?auto_177962 ) ) ( not ( = ?auto_177960 ?auto_177963 ) ) ( not ( = ?auto_177961 ?auto_177962 ) ) ( not ( = ?auto_177961 ?auto_177963 ) ) ( not ( = ?auto_177962 ?auto_177963 ) ) ( ON ?auto_177963 ?auto_177964 ) ( not ( = ?auto_177959 ?auto_177964 ) ) ( not ( = ?auto_177960 ?auto_177964 ) ) ( not ( = ?auto_177961 ?auto_177964 ) ) ( not ( = ?auto_177962 ?auto_177964 ) ) ( not ( = ?auto_177963 ?auto_177964 ) ) ( ON ?auto_177962 ?auto_177963 ) ( ON-TABLE ?auto_177966 ) ( ON ?auto_177965 ?auto_177966 ) ( ON ?auto_177964 ?auto_177965 ) ( not ( = ?auto_177966 ?auto_177965 ) ) ( not ( = ?auto_177966 ?auto_177964 ) ) ( not ( = ?auto_177966 ?auto_177963 ) ) ( not ( = ?auto_177966 ?auto_177962 ) ) ( not ( = ?auto_177965 ?auto_177964 ) ) ( not ( = ?auto_177965 ?auto_177963 ) ) ( not ( = ?auto_177965 ?auto_177962 ) ) ( not ( = ?auto_177959 ?auto_177966 ) ) ( not ( = ?auto_177959 ?auto_177965 ) ) ( not ( = ?auto_177960 ?auto_177966 ) ) ( not ( = ?auto_177960 ?auto_177965 ) ) ( not ( = ?auto_177961 ?auto_177966 ) ) ( not ( = ?auto_177961 ?auto_177965 ) ) ( ON ?auto_177959 ?auto_177967 ) ( not ( = ?auto_177959 ?auto_177967 ) ) ( not ( = ?auto_177960 ?auto_177967 ) ) ( not ( = ?auto_177961 ?auto_177967 ) ) ( not ( = ?auto_177962 ?auto_177967 ) ) ( not ( = ?auto_177963 ?auto_177967 ) ) ( not ( = ?auto_177964 ?auto_177967 ) ) ( not ( = ?auto_177966 ?auto_177967 ) ) ( not ( = ?auto_177965 ?auto_177967 ) ) ( ON ?auto_177960 ?auto_177959 ) ( ON-TABLE ?auto_177967 ) ( CLEAR ?auto_177962 ) ( ON ?auto_177961 ?auto_177960 ) ( CLEAR ?auto_177961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177967 ?auto_177959 ?auto_177960 )
      ( MAKE-5PILE ?auto_177959 ?auto_177960 ?auto_177961 ?auto_177962 ?auto_177963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177968 - BLOCK
      ?auto_177969 - BLOCK
      ?auto_177970 - BLOCK
      ?auto_177971 - BLOCK
      ?auto_177972 - BLOCK
    )
    :vars
    (
      ?auto_177975 - BLOCK
      ?auto_177974 - BLOCK
      ?auto_177976 - BLOCK
      ?auto_177973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177968 ?auto_177969 ) ) ( not ( = ?auto_177968 ?auto_177970 ) ) ( not ( = ?auto_177968 ?auto_177971 ) ) ( not ( = ?auto_177968 ?auto_177972 ) ) ( not ( = ?auto_177969 ?auto_177970 ) ) ( not ( = ?auto_177969 ?auto_177971 ) ) ( not ( = ?auto_177969 ?auto_177972 ) ) ( not ( = ?auto_177970 ?auto_177971 ) ) ( not ( = ?auto_177970 ?auto_177972 ) ) ( not ( = ?auto_177971 ?auto_177972 ) ) ( ON ?auto_177972 ?auto_177975 ) ( not ( = ?auto_177968 ?auto_177975 ) ) ( not ( = ?auto_177969 ?auto_177975 ) ) ( not ( = ?auto_177970 ?auto_177975 ) ) ( not ( = ?auto_177971 ?auto_177975 ) ) ( not ( = ?auto_177972 ?auto_177975 ) ) ( ON-TABLE ?auto_177974 ) ( ON ?auto_177976 ?auto_177974 ) ( ON ?auto_177975 ?auto_177976 ) ( not ( = ?auto_177974 ?auto_177976 ) ) ( not ( = ?auto_177974 ?auto_177975 ) ) ( not ( = ?auto_177974 ?auto_177972 ) ) ( not ( = ?auto_177974 ?auto_177971 ) ) ( not ( = ?auto_177976 ?auto_177975 ) ) ( not ( = ?auto_177976 ?auto_177972 ) ) ( not ( = ?auto_177976 ?auto_177971 ) ) ( not ( = ?auto_177968 ?auto_177974 ) ) ( not ( = ?auto_177968 ?auto_177976 ) ) ( not ( = ?auto_177969 ?auto_177974 ) ) ( not ( = ?auto_177969 ?auto_177976 ) ) ( not ( = ?auto_177970 ?auto_177974 ) ) ( not ( = ?auto_177970 ?auto_177976 ) ) ( ON ?auto_177968 ?auto_177973 ) ( not ( = ?auto_177968 ?auto_177973 ) ) ( not ( = ?auto_177969 ?auto_177973 ) ) ( not ( = ?auto_177970 ?auto_177973 ) ) ( not ( = ?auto_177971 ?auto_177973 ) ) ( not ( = ?auto_177972 ?auto_177973 ) ) ( not ( = ?auto_177975 ?auto_177973 ) ) ( not ( = ?auto_177974 ?auto_177973 ) ) ( not ( = ?auto_177976 ?auto_177973 ) ) ( ON ?auto_177969 ?auto_177968 ) ( ON-TABLE ?auto_177973 ) ( ON ?auto_177970 ?auto_177969 ) ( CLEAR ?auto_177970 ) ( HOLDING ?auto_177971 ) ( CLEAR ?auto_177972 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177974 ?auto_177976 ?auto_177975 ?auto_177972 ?auto_177971 )
      ( MAKE-5PILE ?auto_177968 ?auto_177969 ?auto_177970 ?auto_177971 ?auto_177972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177977 - BLOCK
      ?auto_177978 - BLOCK
      ?auto_177979 - BLOCK
      ?auto_177980 - BLOCK
      ?auto_177981 - BLOCK
    )
    :vars
    (
      ?auto_177985 - BLOCK
      ?auto_177983 - BLOCK
      ?auto_177984 - BLOCK
      ?auto_177982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177977 ?auto_177978 ) ) ( not ( = ?auto_177977 ?auto_177979 ) ) ( not ( = ?auto_177977 ?auto_177980 ) ) ( not ( = ?auto_177977 ?auto_177981 ) ) ( not ( = ?auto_177978 ?auto_177979 ) ) ( not ( = ?auto_177978 ?auto_177980 ) ) ( not ( = ?auto_177978 ?auto_177981 ) ) ( not ( = ?auto_177979 ?auto_177980 ) ) ( not ( = ?auto_177979 ?auto_177981 ) ) ( not ( = ?auto_177980 ?auto_177981 ) ) ( ON ?auto_177981 ?auto_177985 ) ( not ( = ?auto_177977 ?auto_177985 ) ) ( not ( = ?auto_177978 ?auto_177985 ) ) ( not ( = ?auto_177979 ?auto_177985 ) ) ( not ( = ?auto_177980 ?auto_177985 ) ) ( not ( = ?auto_177981 ?auto_177985 ) ) ( ON-TABLE ?auto_177983 ) ( ON ?auto_177984 ?auto_177983 ) ( ON ?auto_177985 ?auto_177984 ) ( not ( = ?auto_177983 ?auto_177984 ) ) ( not ( = ?auto_177983 ?auto_177985 ) ) ( not ( = ?auto_177983 ?auto_177981 ) ) ( not ( = ?auto_177983 ?auto_177980 ) ) ( not ( = ?auto_177984 ?auto_177985 ) ) ( not ( = ?auto_177984 ?auto_177981 ) ) ( not ( = ?auto_177984 ?auto_177980 ) ) ( not ( = ?auto_177977 ?auto_177983 ) ) ( not ( = ?auto_177977 ?auto_177984 ) ) ( not ( = ?auto_177978 ?auto_177983 ) ) ( not ( = ?auto_177978 ?auto_177984 ) ) ( not ( = ?auto_177979 ?auto_177983 ) ) ( not ( = ?auto_177979 ?auto_177984 ) ) ( ON ?auto_177977 ?auto_177982 ) ( not ( = ?auto_177977 ?auto_177982 ) ) ( not ( = ?auto_177978 ?auto_177982 ) ) ( not ( = ?auto_177979 ?auto_177982 ) ) ( not ( = ?auto_177980 ?auto_177982 ) ) ( not ( = ?auto_177981 ?auto_177982 ) ) ( not ( = ?auto_177985 ?auto_177982 ) ) ( not ( = ?auto_177983 ?auto_177982 ) ) ( not ( = ?auto_177984 ?auto_177982 ) ) ( ON ?auto_177978 ?auto_177977 ) ( ON-TABLE ?auto_177982 ) ( ON ?auto_177979 ?auto_177978 ) ( CLEAR ?auto_177981 ) ( ON ?auto_177980 ?auto_177979 ) ( CLEAR ?auto_177980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177982 ?auto_177977 ?auto_177978 ?auto_177979 )
      ( MAKE-5PILE ?auto_177977 ?auto_177978 ?auto_177979 ?auto_177980 ?auto_177981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177986 - BLOCK
      ?auto_177987 - BLOCK
      ?auto_177988 - BLOCK
      ?auto_177989 - BLOCK
      ?auto_177990 - BLOCK
    )
    :vars
    (
      ?auto_177993 - BLOCK
      ?auto_177994 - BLOCK
      ?auto_177992 - BLOCK
      ?auto_177991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177986 ?auto_177987 ) ) ( not ( = ?auto_177986 ?auto_177988 ) ) ( not ( = ?auto_177986 ?auto_177989 ) ) ( not ( = ?auto_177986 ?auto_177990 ) ) ( not ( = ?auto_177987 ?auto_177988 ) ) ( not ( = ?auto_177987 ?auto_177989 ) ) ( not ( = ?auto_177987 ?auto_177990 ) ) ( not ( = ?auto_177988 ?auto_177989 ) ) ( not ( = ?auto_177988 ?auto_177990 ) ) ( not ( = ?auto_177989 ?auto_177990 ) ) ( not ( = ?auto_177986 ?auto_177993 ) ) ( not ( = ?auto_177987 ?auto_177993 ) ) ( not ( = ?auto_177988 ?auto_177993 ) ) ( not ( = ?auto_177989 ?auto_177993 ) ) ( not ( = ?auto_177990 ?auto_177993 ) ) ( ON-TABLE ?auto_177994 ) ( ON ?auto_177992 ?auto_177994 ) ( ON ?auto_177993 ?auto_177992 ) ( not ( = ?auto_177994 ?auto_177992 ) ) ( not ( = ?auto_177994 ?auto_177993 ) ) ( not ( = ?auto_177994 ?auto_177990 ) ) ( not ( = ?auto_177994 ?auto_177989 ) ) ( not ( = ?auto_177992 ?auto_177993 ) ) ( not ( = ?auto_177992 ?auto_177990 ) ) ( not ( = ?auto_177992 ?auto_177989 ) ) ( not ( = ?auto_177986 ?auto_177994 ) ) ( not ( = ?auto_177986 ?auto_177992 ) ) ( not ( = ?auto_177987 ?auto_177994 ) ) ( not ( = ?auto_177987 ?auto_177992 ) ) ( not ( = ?auto_177988 ?auto_177994 ) ) ( not ( = ?auto_177988 ?auto_177992 ) ) ( ON ?auto_177986 ?auto_177991 ) ( not ( = ?auto_177986 ?auto_177991 ) ) ( not ( = ?auto_177987 ?auto_177991 ) ) ( not ( = ?auto_177988 ?auto_177991 ) ) ( not ( = ?auto_177989 ?auto_177991 ) ) ( not ( = ?auto_177990 ?auto_177991 ) ) ( not ( = ?auto_177993 ?auto_177991 ) ) ( not ( = ?auto_177994 ?auto_177991 ) ) ( not ( = ?auto_177992 ?auto_177991 ) ) ( ON ?auto_177987 ?auto_177986 ) ( ON-TABLE ?auto_177991 ) ( ON ?auto_177988 ?auto_177987 ) ( ON ?auto_177989 ?auto_177988 ) ( CLEAR ?auto_177989 ) ( HOLDING ?auto_177990 ) ( CLEAR ?auto_177993 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177994 ?auto_177992 ?auto_177993 ?auto_177990 )
      ( MAKE-5PILE ?auto_177986 ?auto_177987 ?auto_177988 ?auto_177989 ?auto_177990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_177995 - BLOCK
      ?auto_177996 - BLOCK
      ?auto_177997 - BLOCK
      ?auto_177998 - BLOCK
      ?auto_177999 - BLOCK
    )
    :vars
    (
      ?auto_178003 - BLOCK
      ?auto_178002 - BLOCK
      ?auto_178000 - BLOCK
      ?auto_178001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177995 ?auto_177996 ) ) ( not ( = ?auto_177995 ?auto_177997 ) ) ( not ( = ?auto_177995 ?auto_177998 ) ) ( not ( = ?auto_177995 ?auto_177999 ) ) ( not ( = ?auto_177996 ?auto_177997 ) ) ( not ( = ?auto_177996 ?auto_177998 ) ) ( not ( = ?auto_177996 ?auto_177999 ) ) ( not ( = ?auto_177997 ?auto_177998 ) ) ( not ( = ?auto_177997 ?auto_177999 ) ) ( not ( = ?auto_177998 ?auto_177999 ) ) ( not ( = ?auto_177995 ?auto_178003 ) ) ( not ( = ?auto_177996 ?auto_178003 ) ) ( not ( = ?auto_177997 ?auto_178003 ) ) ( not ( = ?auto_177998 ?auto_178003 ) ) ( not ( = ?auto_177999 ?auto_178003 ) ) ( ON-TABLE ?auto_178002 ) ( ON ?auto_178000 ?auto_178002 ) ( ON ?auto_178003 ?auto_178000 ) ( not ( = ?auto_178002 ?auto_178000 ) ) ( not ( = ?auto_178002 ?auto_178003 ) ) ( not ( = ?auto_178002 ?auto_177999 ) ) ( not ( = ?auto_178002 ?auto_177998 ) ) ( not ( = ?auto_178000 ?auto_178003 ) ) ( not ( = ?auto_178000 ?auto_177999 ) ) ( not ( = ?auto_178000 ?auto_177998 ) ) ( not ( = ?auto_177995 ?auto_178002 ) ) ( not ( = ?auto_177995 ?auto_178000 ) ) ( not ( = ?auto_177996 ?auto_178002 ) ) ( not ( = ?auto_177996 ?auto_178000 ) ) ( not ( = ?auto_177997 ?auto_178002 ) ) ( not ( = ?auto_177997 ?auto_178000 ) ) ( ON ?auto_177995 ?auto_178001 ) ( not ( = ?auto_177995 ?auto_178001 ) ) ( not ( = ?auto_177996 ?auto_178001 ) ) ( not ( = ?auto_177997 ?auto_178001 ) ) ( not ( = ?auto_177998 ?auto_178001 ) ) ( not ( = ?auto_177999 ?auto_178001 ) ) ( not ( = ?auto_178003 ?auto_178001 ) ) ( not ( = ?auto_178002 ?auto_178001 ) ) ( not ( = ?auto_178000 ?auto_178001 ) ) ( ON ?auto_177996 ?auto_177995 ) ( ON-TABLE ?auto_178001 ) ( ON ?auto_177997 ?auto_177996 ) ( ON ?auto_177998 ?auto_177997 ) ( CLEAR ?auto_178003 ) ( ON ?auto_177999 ?auto_177998 ) ( CLEAR ?auto_177999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178001 ?auto_177995 ?auto_177996 ?auto_177997 ?auto_177998 )
      ( MAKE-5PILE ?auto_177995 ?auto_177996 ?auto_177997 ?auto_177998 ?auto_177999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178004 - BLOCK
      ?auto_178005 - BLOCK
      ?auto_178006 - BLOCK
      ?auto_178007 - BLOCK
      ?auto_178008 - BLOCK
    )
    :vars
    (
      ?auto_178009 - BLOCK
      ?auto_178011 - BLOCK
      ?auto_178010 - BLOCK
      ?auto_178012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178004 ?auto_178005 ) ) ( not ( = ?auto_178004 ?auto_178006 ) ) ( not ( = ?auto_178004 ?auto_178007 ) ) ( not ( = ?auto_178004 ?auto_178008 ) ) ( not ( = ?auto_178005 ?auto_178006 ) ) ( not ( = ?auto_178005 ?auto_178007 ) ) ( not ( = ?auto_178005 ?auto_178008 ) ) ( not ( = ?auto_178006 ?auto_178007 ) ) ( not ( = ?auto_178006 ?auto_178008 ) ) ( not ( = ?auto_178007 ?auto_178008 ) ) ( not ( = ?auto_178004 ?auto_178009 ) ) ( not ( = ?auto_178005 ?auto_178009 ) ) ( not ( = ?auto_178006 ?auto_178009 ) ) ( not ( = ?auto_178007 ?auto_178009 ) ) ( not ( = ?auto_178008 ?auto_178009 ) ) ( ON-TABLE ?auto_178011 ) ( ON ?auto_178010 ?auto_178011 ) ( not ( = ?auto_178011 ?auto_178010 ) ) ( not ( = ?auto_178011 ?auto_178009 ) ) ( not ( = ?auto_178011 ?auto_178008 ) ) ( not ( = ?auto_178011 ?auto_178007 ) ) ( not ( = ?auto_178010 ?auto_178009 ) ) ( not ( = ?auto_178010 ?auto_178008 ) ) ( not ( = ?auto_178010 ?auto_178007 ) ) ( not ( = ?auto_178004 ?auto_178011 ) ) ( not ( = ?auto_178004 ?auto_178010 ) ) ( not ( = ?auto_178005 ?auto_178011 ) ) ( not ( = ?auto_178005 ?auto_178010 ) ) ( not ( = ?auto_178006 ?auto_178011 ) ) ( not ( = ?auto_178006 ?auto_178010 ) ) ( ON ?auto_178004 ?auto_178012 ) ( not ( = ?auto_178004 ?auto_178012 ) ) ( not ( = ?auto_178005 ?auto_178012 ) ) ( not ( = ?auto_178006 ?auto_178012 ) ) ( not ( = ?auto_178007 ?auto_178012 ) ) ( not ( = ?auto_178008 ?auto_178012 ) ) ( not ( = ?auto_178009 ?auto_178012 ) ) ( not ( = ?auto_178011 ?auto_178012 ) ) ( not ( = ?auto_178010 ?auto_178012 ) ) ( ON ?auto_178005 ?auto_178004 ) ( ON-TABLE ?auto_178012 ) ( ON ?auto_178006 ?auto_178005 ) ( ON ?auto_178007 ?auto_178006 ) ( ON ?auto_178008 ?auto_178007 ) ( CLEAR ?auto_178008 ) ( HOLDING ?auto_178009 ) ( CLEAR ?auto_178010 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178011 ?auto_178010 ?auto_178009 )
      ( MAKE-5PILE ?auto_178004 ?auto_178005 ?auto_178006 ?auto_178007 ?auto_178008 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178013 - BLOCK
      ?auto_178014 - BLOCK
      ?auto_178015 - BLOCK
      ?auto_178016 - BLOCK
      ?auto_178017 - BLOCK
    )
    :vars
    (
      ?auto_178021 - BLOCK
      ?auto_178018 - BLOCK
      ?auto_178020 - BLOCK
      ?auto_178019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178013 ?auto_178014 ) ) ( not ( = ?auto_178013 ?auto_178015 ) ) ( not ( = ?auto_178013 ?auto_178016 ) ) ( not ( = ?auto_178013 ?auto_178017 ) ) ( not ( = ?auto_178014 ?auto_178015 ) ) ( not ( = ?auto_178014 ?auto_178016 ) ) ( not ( = ?auto_178014 ?auto_178017 ) ) ( not ( = ?auto_178015 ?auto_178016 ) ) ( not ( = ?auto_178015 ?auto_178017 ) ) ( not ( = ?auto_178016 ?auto_178017 ) ) ( not ( = ?auto_178013 ?auto_178021 ) ) ( not ( = ?auto_178014 ?auto_178021 ) ) ( not ( = ?auto_178015 ?auto_178021 ) ) ( not ( = ?auto_178016 ?auto_178021 ) ) ( not ( = ?auto_178017 ?auto_178021 ) ) ( ON-TABLE ?auto_178018 ) ( ON ?auto_178020 ?auto_178018 ) ( not ( = ?auto_178018 ?auto_178020 ) ) ( not ( = ?auto_178018 ?auto_178021 ) ) ( not ( = ?auto_178018 ?auto_178017 ) ) ( not ( = ?auto_178018 ?auto_178016 ) ) ( not ( = ?auto_178020 ?auto_178021 ) ) ( not ( = ?auto_178020 ?auto_178017 ) ) ( not ( = ?auto_178020 ?auto_178016 ) ) ( not ( = ?auto_178013 ?auto_178018 ) ) ( not ( = ?auto_178013 ?auto_178020 ) ) ( not ( = ?auto_178014 ?auto_178018 ) ) ( not ( = ?auto_178014 ?auto_178020 ) ) ( not ( = ?auto_178015 ?auto_178018 ) ) ( not ( = ?auto_178015 ?auto_178020 ) ) ( ON ?auto_178013 ?auto_178019 ) ( not ( = ?auto_178013 ?auto_178019 ) ) ( not ( = ?auto_178014 ?auto_178019 ) ) ( not ( = ?auto_178015 ?auto_178019 ) ) ( not ( = ?auto_178016 ?auto_178019 ) ) ( not ( = ?auto_178017 ?auto_178019 ) ) ( not ( = ?auto_178021 ?auto_178019 ) ) ( not ( = ?auto_178018 ?auto_178019 ) ) ( not ( = ?auto_178020 ?auto_178019 ) ) ( ON ?auto_178014 ?auto_178013 ) ( ON-TABLE ?auto_178019 ) ( ON ?auto_178015 ?auto_178014 ) ( ON ?auto_178016 ?auto_178015 ) ( ON ?auto_178017 ?auto_178016 ) ( CLEAR ?auto_178020 ) ( ON ?auto_178021 ?auto_178017 ) ( CLEAR ?auto_178021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178019 ?auto_178013 ?auto_178014 ?auto_178015 ?auto_178016 ?auto_178017 )
      ( MAKE-5PILE ?auto_178013 ?auto_178014 ?auto_178015 ?auto_178016 ?auto_178017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178022 - BLOCK
      ?auto_178023 - BLOCK
      ?auto_178024 - BLOCK
      ?auto_178025 - BLOCK
      ?auto_178026 - BLOCK
    )
    :vars
    (
      ?auto_178028 - BLOCK
      ?auto_178030 - BLOCK
      ?auto_178029 - BLOCK
      ?auto_178027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178022 ?auto_178023 ) ) ( not ( = ?auto_178022 ?auto_178024 ) ) ( not ( = ?auto_178022 ?auto_178025 ) ) ( not ( = ?auto_178022 ?auto_178026 ) ) ( not ( = ?auto_178023 ?auto_178024 ) ) ( not ( = ?auto_178023 ?auto_178025 ) ) ( not ( = ?auto_178023 ?auto_178026 ) ) ( not ( = ?auto_178024 ?auto_178025 ) ) ( not ( = ?auto_178024 ?auto_178026 ) ) ( not ( = ?auto_178025 ?auto_178026 ) ) ( not ( = ?auto_178022 ?auto_178028 ) ) ( not ( = ?auto_178023 ?auto_178028 ) ) ( not ( = ?auto_178024 ?auto_178028 ) ) ( not ( = ?auto_178025 ?auto_178028 ) ) ( not ( = ?auto_178026 ?auto_178028 ) ) ( ON-TABLE ?auto_178030 ) ( not ( = ?auto_178030 ?auto_178029 ) ) ( not ( = ?auto_178030 ?auto_178028 ) ) ( not ( = ?auto_178030 ?auto_178026 ) ) ( not ( = ?auto_178030 ?auto_178025 ) ) ( not ( = ?auto_178029 ?auto_178028 ) ) ( not ( = ?auto_178029 ?auto_178026 ) ) ( not ( = ?auto_178029 ?auto_178025 ) ) ( not ( = ?auto_178022 ?auto_178030 ) ) ( not ( = ?auto_178022 ?auto_178029 ) ) ( not ( = ?auto_178023 ?auto_178030 ) ) ( not ( = ?auto_178023 ?auto_178029 ) ) ( not ( = ?auto_178024 ?auto_178030 ) ) ( not ( = ?auto_178024 ?auto_178029 ) ) ( ON ?auto_178022 ?auto_178027 ) ( not ( = ?auto_178022 ?auto_178027 ) ) ( not ( = ?auto_178023 ?auto_178027 ) ) ( not ( = ?auto_178024 ?auto_178027 ) ) ( not ( = ?auto_178025 ?auto_178027 ) ) ( not ( = ?auto_178026 ?auto_178027 ) ) ( not ( = ?auto_178028 ?auto_178027 ) ) ( not ( = ?auto_178030 ?auto_178027 ) ) ( not ( = ?auto_178029 ?auto_178027 ) ) ( ON ?auto_178023 ?auto_178022 ) ( ON-TABLE ?auto_178027 ) ( ON ?auto_178024 ?auto_178023 ) ( ON ?auto_178025 ?auto_178024 ) ( ON ?auto_178026 ?auto_178025 ) ( ON ?auto_178028 ?auto_178026 ) ( CLEAR ?auto_178028 ) ( HOLDING ?auto_178029 ) ( CLEAR ?auto_178030 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178030 ?auto_178029 )
      ( MAKE-5PILE ?auto_178022 ?auto_178023 ?auto_178024 ?auto_178025 ?auto_178026 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178031 - BLOCK
      ?auto_178032 - BLOCK
      ?auto_178033 - BLOCK
      ?auto_178034 - BLOCK
      ?auto_178035 - BLOCK
    )
    :vars
    (
      ?auto_178038 - BLOCK
      ?auto_178036 - BLOCK
      ?auto_178039 - BLOCK
      ?auto_178037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178031 ?auto_178032 ) ) ( not ( = ?auto_178031 ?auto_178033 ) ) ( not ( = ?auto_178031 ?auto_178034 ) ) ( not ( = ?auto_178031 ?auto_178035 ) ) ( not ( = ?auto_178032 ?auto_178033 ) ) ( not ( = ?auto_178032 ?auto_178034 ) ) ( not ( = ?auto_178032 ?auto_178035 ) ) ( not ( = ?auto_178033 ?auto_178034 ) ) ( not ( = ?auto_178033 ?auto_178035 ) ) ( not ( = ?auto_178034 ?auto_178035 ) ) ( not ( = ?auto_178031 ?auto_178038 ) ) ( not ( = ?auto_178032 ?auto_178038 ) ) ( not ( = ?auto_178033 ?auto_178038 ) ) ( not ( = ?auto_178034 ?auto_178038 ) ) ( not ( = ?auto_178035 ?auto_178038 ) ) ( ON-TABLE ?auto_178036 ) ( not ( = ?auto_178036 ?auto_178039 ) ) ( not ( = ?auto_178036 ?auto_178038 ) ) ( not ( = ?auto_178036 ?auto_178035 ) ) ( not ( = ?auto_178036 ?auto_178034 ) ) ( not ( = ?auto_178039 ?auto_178038 ) ) ( not ( = ?auto_178039 ?auto_178035 ) ) ( not ( = ?auto_178039 ?auto_178034 ) ) ( not ( = ?auto_178031 ?auto_178036 ) ) ( not ( = ?auto_178031 ?auto_178039 ) ) ( not ( = ?auto_178032 ?auto_178036 ) ) ( not ( = ?auto_178032 ?auto_178039 ) ) ( not ( = ?auto_178033 ?auto_178036 ) ) ( not ( = ?auto_178033 ?auto_178039 ) ) ( ON ?auto_178031 ?auto_178037 ) ( not ( = ?auto_178031 ?auto_178037 ) ) ( not ( = ?auto_178032 ?auto_178037 ) ) ( not ( = ?auto_178033 ?auto_178037 ) ) ( not ( = ?auto_178034 ?auto_178037 ) ) ( not ( = ?auto_178035 ?auto_178037 ) ) ( not ( = ?auto_178038 ?auto_178037 ) ) ( not ( = ?auto_178036 ?auto_178037 ) ) ( not ( = ?auto_178039 ?auto_178037 ) ) ( ON ?auto_178032 ?auto_178031 ) ( ON-TABLE ?auto_178037 ) ( ON ?auto_178033 ?auto_178032 ) ( ON ?auto_178034 ?auto_178033 ) ( ON ?auto_178035 ?auto_178034 ) ( ON ?auto_178038 ?auto_178035 ) ( CLEAR ?auto_178036 ) ( ON ?auto_178039 ?auto_178038 ) ( CLEAR ?auto_178039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178037 ?auto_178031 ?auto_178032 ?auto_178033 ?auto_178034 ?auto_178035 ?auto_178038 )
      ( MAKE-5PILE ?auto_178031 ?auto_178032 ?auto_178033 ?auto_178034 ?auto_178035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178040 - BLOCK
      ?auto_178041 - BLOCK
      ?auto_178042 - BLOCK
      ?auto_178043 - BLOCK
      ?auto_178044 - BLOCK
    )
    :vars
    (
      ?auto_178047 - BLOCK
      ?auto_178048 - BLOCK
      ?auto_178046 - BLOCK
      ?auto_178045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178040 ?auto_178041 ) ) ( not ( = ?auto_178040 ?auto_178042 ) ) ( not ( = ?auto_178040 ?auto_178043 ) ) ( not ( = ?auto_178040 ?auto_178044 ) ) ( not ( = ?auto_178041 ?auto_178042 ) ) ( not ( = ?auto_178041 ?auto_178043 ) ) ( not ( = ?auto_178041 ?auto_178044 ) ) ( not ( = ?auto_178042 ?auto_178043 ) ) ( not ( = ?auto_178042 ?auto_178044 ) ) ( not ( = ?auto_178043 ?auto_178044 ) ) ( not ( = ?auto_178040 ?auto_178047 ) ) ( not ( = ?auto_178041 ?auto_178047 ) ) ( not ( = ?auto_178042 ?auto_178047 ) ) ( not ( = ?auto_178043 ?auto_178047 ) ) ( not ( = ?auto_178044 ?auto_178047 ) ) ( not ( = ?auto_178048 ?auto_178046 ) ) ( not ( = ?auto_178048 ?auto_178047 ) ) ( not ( = ?auto_178048 ?auto_178044 ) ) ( not ( = ?auto_178048 ?auto_178043 ) ) ( not ( = ?auto_178046 ?auto_178047 ) ) ( not ( = ?auto_178046 ?auto_178044 ) ) ( not ( = ?auto_178046 ?auto_178043 ) ) ( not ( = ?auto_178040 ?auto_178048 ) ) ( not ( = ?auto_178040 ?auto_178046 ) ) ( not ( = ?auto_178041 ?auto_178048 ) ) ( not ( = ?auto_178041 ?auto_178046 ) ) ( not ( = ?auto_178042 ?auto_178048 ) ) ( not ( = ?auto_178042 ?auto_178046 ) ) ( ON ?auto_178040 ?auto_178045 ) ( not ( = ?auto_178040 ?auto_178045 ) ) ( not ( = ?auto_178041 ?auto_178045 ) ) ( not ( = ?auto_178042 ?auto_178045 ) ) ( not ( = ?auto_178043 ?auto_178045 ) ) ( not ( = ?auto_178044 ?auto_178045 ) ) ( not ( = ?auto_178047 ?auto_178045 ) ) ( not ( = ?auto_178048 ?auto_178045 ) ) ( not ( = ?auto_178046 ?auto_178045 ) ) ( ON ?auto_178041 ?auto_178040 ) ( ON-TABLE ?auto_178045 ) ( ON ?auto_178042 ?auto_178041 ) ( ON ?auto_178043 ?auto_178042 ) ( ON ?auto_178044 ?auto_178043 ) ( ON ?auto_178047 ?auto_178044 ) ( ON ?auto_178046 ?auto_178047 ) ( CLEAR ?auto_178046 ) ( HOLDING ?auto_178048 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178048 )
      ( MAKE-5PILE ?auto_178040 ?auto_178041 ?auto_178042 ?auto_178043 ?auto_178044 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_178049 - BLOCK
      ?auto_178050 - BLOCK
      ?auto_178051 - BLOCK
      ?auto_178052 - BLOCK
      ?auto_178053 - BLOCK
    )
    :vars
    (
      ?auto_178055 - BLOCK
      ?auto_178054 - BLOCK
      ?auto_178057 - BLOCK
      ?auto_178056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178049 ?auto_178050 ) ) ( not ( = ?auto_178049 ?auto_178051 ) ) ( not ( = ?auto_178049 ?auto_178052 ) ) ( not ( = ?auto_178049 ?auto_178053 ) ) ( not ( = ?auto_178050 ?auto_178051 ) ) ( not ( = ?auto_178050 ?auto_178052 ) ) ( not ( = ?auto_178050 ?auto_178053 ) ) ( not ( = ?auto_178051 ?auto_178052 ) ) ( not ( = ?auto_178051 ?auto_178053 ) ) ( not ( = ?auto_178052 ?auto_178053 ) ) ( not ( = ?auto_178049 ?auto_178055 ) ) ( not ( = ?auto_178050 ?auto_178055 ) ) ( not ( = ?auto_178051 ?auto_178055 ) ) ( not ( = ?auto_178052 ?auto_178055 ) ) ( not ( = ?auto_178053 ?auto_178055 ) ) ( not ( = ?auto_178054 ?auto_178057 ) ) ( not ( = ?auto_178054 ?auto_178055 ) ) ( not ( = ?auto_178054 ?auto_178053 ) ) ( not ( = ?auto_178054 ?auto_178052 ) ) ( not ( = ?auto_178057 ?auto_178055 ) ) ( not ( = ?auto_178057 ?auto_178053 ) ) ( not ( = ?auto_178057 ?auto_178052 ) ) ( not ( = ?auto_178049 ?auto_178054 ) ) ( not ( = ?auto_178049 ?auto_178057 ) ) ( not ( = ?auto_178050 ?auto_178054 ) ) ( not ( = ?auto_178050 ?auto_178057 ) ) ( not ( = ?auto_178051 ?auto_178054 ) ) ( not ( = ?auto_178051 ?auto_178057 ) ) ( ON ?auto_178049 ?auto_178056 ) ( not ( = ?auto_178049 ?auto_178056 ) ) ( not ( = ?auto_178050 ?auto_178056 ) ) ( not ( = ?auto_178051 ?auto_178056 ) ) ( not ( = ?auto_178052 ?auto_178056 ) ) ( not ( = ?auto_178053 ?auto_178056 ) ) ( not ( = ?auto_178055 ?auto_178056 ) ) ( not ( = ?auto_178054 ?auto_178056 ) ) ( not ( = ?auto_178057 ?auto_178056 ) ) ( ON ?auto_178050 ?auto_178049 ) ( ON-TABLE ?auto_178056 ) ( ON ?auto_178051 ?auto_178050 ) ( ON ?auto_178052 ?auto_178051 ) ( ON ?auto_178053 ?auto_178052 ) ( ON ?auto_178055 ?auto_178053 ) ( ON ?auto_178057 ?auto_178055 ) ( ON ?auto_178054 ?auto_178057 ) ( CLEAR ?auto_178054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178056 ?auto_178049 ?auto_178050 ?auto_178051 ?auto_178052 ?auto_178053 ?auto_178055 ?auto_178057 )
      ( MAKE-5PILE ?auto_178049 ?auto_178050 ?auto_178051 ?auto_178052 ?auto_178053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178060 - BLOCK
      ?auto_178061 - BLOCK
    )
    :vars
    (
      ?auto_178062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178062 ?auto_178061 ) ( CLEAR ?auto_178062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178060 ) ( ON ?auto_178061 ?auto_178060 ) ( not ( = ?auto_178060 ?auto_178061 ) ) ( not ( = ?auto_178060 ?auto_178062 ) ) ( not ( = ?auto_178061 ?auto_178062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178062 ?auto_178061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178063 - BLOCK
      ?auto_178064 - BLOCK
    )
    :vars
    (
      ?auto_178065 - BLOCK
      ?auto_178066 - BLOCK
      ?auto_178067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178065 ?auto_178064 ) ( CLEAR ?auto_178065 ) ( ON-TABLE ?auto_178063 ) ( ON ?auto_178064 ?auto_178063 ) ( not ( = ?auto_178063 ?auto_178064 ) ) ( not ( = ?auto_178063 ?auto_178065 ) ) ( not ( = ?auto_178064 ?auto_178065 ) ) ( HOLDING ?auto_178066 ) ( CLEAR ?auto_178067 ) ( not ( = ?auto_178063 ?auto_178066 ) ) ( not ( = ?auto_178063 ?auto_178067 ) ) ( not ( = ?auto_178064 ?auto_178066 ) ) ( not ( = ?auto_178064 ?auto_178067 ) ) ( not ( = ?auto_178065 ?auto_178066 ) ) ( not ( = ?auto_178065 ?auto_178067 ) ) ( not ( = ?auto_178066 ?auto_178067 ) ) )
    :subtasks
    ( ( !STACK ?auto_178066 ?auto_178067 )
      ( MAKE-2PILE ?auto_178063 ?auto_178064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178068 - BLOCK
      ?auto_178069 - BLOCK
    )
    :vars
    (
      ?auto_178071 - BLOCK
      ?auto_178072 - BLOCK
      ?auto_178070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178071 ?auto_178069 ) ( ON-TABLE ?auto_178068 ) ( ON ?auto_178069 ?auto_178068 ) ( not ( = ?auto_178068 ?auto_178069 ) ) ( not ( = ?auto_178068 ?auto_178071 ) ) ( not ( = ?auto_178069 ?auto_178071 ) ) ( CLEAR ?auto_178072 ) ( not ( = ?auto_178068 ?auto_178070 ) ) ( not ( = ?auto_178068 ?auto_178072 ) ) ( not ( = ?auto_178069 ?auto_178070 ) ) ( not ( = ?auto_178069 ?auto_178072 ) ) ( not ( = ?auto_178071 ?auto_178070 ) ) ( not ( = ?auto_178071 ?auto_178072 ) ) ( not ( = ?auto_178070 ?auto_178072 ) ) ( ON ?auto_178070 ?auto_178071 ) ( CLEAR ?auto_178070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178068 ?auto_178069 ?auto_178071 )
      ( MAKE-2PILE ?auto_178068 ?auto_178069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178073 - BLOCK
      ?auto_178074 - BLOCK
    )
    :vars
    (
      ?auto_178075 - BLOCK
      ?auto_178077 - BLOCK
      ?auto_178076 - BLOCK
      ?auto_178080 - BLOCK
      ?auto_178078 - BLOCK
      ?auto_178079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178075 ?auto_178074 ) ( ON-TABLE ?auto_178073 ) ( ON ?auto_178074 ?auto_178073 ) ( not ( = ?auto_178073 ?auto_178074 ) ) ( not ( = ?auto_178073 ?auto_178075 ) ) ( not ( = ?auto_178074 ?auto_178075 ) ) ( not ( = ?auto_178073 ?auto_178077 ) ) ( not ( = ?auto_178073 ?auto_178076 ) ) ( not ( = ?auto_178074 ?auto_178077 ) ) ( not ( = ?auto_178074 ?auto_178076 ) ) ( not ( = ?auto_178075 ?auto_178077 ) ) ( not ( = ?auto_178075 ?auto_178076 ) ) ( not ( = ?auto_178077 ?auto_178076 ) ) ( ON ?auto_178077 ?auto_178075 ) ( CLEAR ?auto_178077 ) ( HOLDING ?auto_178076 ) ( CLEAR ?auto_178080 ) ( ON-TABLE ?auto_178078 ) ( ON ?auto_178079 ?auto_178078 ) ( ON ?auto_178080 ?auto_178079 ) ( not ( = ?auto_178078 ?auto_178079 ) ) ( not ( = ?auto_178078 ?auto_178080 ) ) ( not ( = ?auto_178078 ?auto_178076 ) ) ( not ( = ?auto_178079 ?auto_178080 ) ) ( not ( = ?auto_178079 ?auto_178076 ) ) ( not ( = ?auto_178080 ?auto_178076 ) ) ( not ( = ?auto_178073 ?auto_178080 ) ) ( not ( = ?auto_178073 ?auto_178078 ) ) ( not ( = ?auto_178073 ?auto_178079 ) ) ( not ( = ?auto_178074 ?auto_178080 ) ) ( not ( = ?auto_178074 ?auto_178078 ) ) ( not ( = ?auto_178074 ?auto_178079 ) ) ( not ( = ?auto_178075 ?auto_178080 ) ) ( not ( = ?auto_178075 ?auto_178078 ) ) ( not ( = ?auto_178075 ?auto_178079 ) ) ( not ( = ?auto_178077 ?auto_178080 ) ) ( not ( = ?auto_178077 ?auto_178078 ) ) ( not ( = ?auto_178077 ?auto_178079 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178078 ?auto_178079 ?auto_178080 ?auto_178076 )
      ( MAKE-2PILE ?auto_178073 ?auto_178074 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178081 - BLOCK
      ?auto_178082 - BLOCK
    )
    :vars
    (
      ?auto_178087 - BLOCK
      ?auto_178086 - BLOCK
      ?auto_178088 - BLOCK
      ?auto_178085 - BLOCK
      ?auto_178083 - BLOCK
      ?auto_178084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178087 ?auto_178082 ) ( ON-TABLE ?auto_178081 ) ( ON ?auto_178082 ?auto_178081 ) ( not ( = ?auto_178081 ?auto_178082 ) ) ( not ( = ?auto_178081 ?auto_178087 ) ) ( not ( = ?auto_178082 ?auto_178087 ) ) ( not ( = ?auto_178081 ?auto_178086 ) ) ( not ( = ?auto_178081 ?auto_178088 ) ) ( not ( = ?auto_178082 ?auto_178086 ) ) ( not ( = ?auto_178082 ?auto_178088 ) ) ( not ( = ?auto_178087 ?auto_178086 ) ) ( not ( = ?auto_178087 ?auto_178088 ) ) ( not ( = ?auto_178086 ?auto_178088 ) ) ( ON ?auto_178086 ?auto_178087 ) ( CLEAR ?auto_178085 ) ( ON-TABLE ?auto_178083 ) ( ON ?auto_178084 ?auto_178083 ) ( ON ?auto_178085 ?auto_178084 ) ( not ( = ?auto_178083 ?auto_178084 ) ) ( not ( = ?auto_178083 ?auto_178085 ) ) ( not ( = ?auto_178083 ?auto_178088 ) ) ( not ( = ?auto_178084 ?auto_178085 ) ) ( not ( = ?auto_178084 ?auto_178088 ) ) ( not ( = ?auto_178085 ?auto_178088 ) ) ( not ( = ?auto_178081 ?auto_178085 ) ) ( not ( = ?auto_178081 ?auto_178083 ) ) ( not ( = ?auto_178081 ?auto_178084 ) ) ( not ( = ?auto_178082 ?auto_178085 ) ) ( not ( = ?auto_178082 ?auto_178083 ) ) ( not ( = ?auto_178082 ?auto_178084 ) ) ( not ( = ?auto_178087 ?auto_178085 ) ) ( not ( = ?auto_178087 ?auto_178083 ) ) ( not ( = ?auto_178087 ?auto_178084 ) ) ( not ( = ?auto_178086 ?auto_178085 ) ) ( not ( = ?auto_178086 ?auto_178083 ) ) ( not ( = ?auto_178086 ?auto_178084 ) ) ( ON ?auto_178088 ?auto_178086 ) ( CLEAR ?auto_178088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178081 ?auto_178082 ?auto_178087 ?auto_178086 )
      ( MAKE-2PILE ?auto_178081 ?auto_178082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178089 - BLOCK
      ?auto_178090 - BLOCK
    )
    :vars
    (
      ?auto_178091 - BLOCK
      ?auto_178096 - BLOCK
      ?auto_178094 - BLOCK
      ?auto_178093 - BLOCK
      ?auto_178092 - BLOCK
      ?auto_178095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178091 ?auto_178090 ) ( ON-TABLE ?auto_178089 ) ( ON ?auto_178090 ?auto_178089 ) ( not ( = ?auto_178089 ?auto_178090 ) ) ( not ( = ?auto_178089 ?auto_178091 ) ) ( not ( = ?auto_178090 ?auto_178091 ) ) ( not ( = ?auto_178089 ?auto_178096 ) ) ( not ( = ?auto_178089 ?auto_178094 ) ) ( not ( = ?auto_178090 ?auto_178096 ) ) ( not ( = ?auto_178090 ?auto_178094 ) ) ( not ( = ?auto_178091 ?auto_178096 ) ) ( not ( = ?auto_178091 ?auto_178094 ) ) ( not ( = ?auto_178096 ?auto_178094 ) ) ( ON ?auto_178096 ?auto_178091 ) ( ON-TABLE ?auto_178093 ) ( ON ?auto_178092 ?auto_178093 ) ( not ( = ?auto_178093 ?auto_178092 ) ) ( not ( = ?auto_178093 ?auto_178095 ) ) ( not ( = ?auto_178093 ?auto_178094 ) ) ( not ( = ?auto_178092 ?auto_178095 ) ) ( not ( = ?auto_178092 ?auto_178094 ) ) ( not ( = ?auto_178095 ?auto_178094 ) ) ( not ( = ?auto_178089 ?auto_178095 ) ) ( not ( = ?auto_178089 ?auto_178093 ) ) ( not ( = ?auto_178089 ?auto_178092 ) ) ( not ( = ?auto_178090 ?auto_178095 ) ) ( not ( = ?auto_178090 ?auto_178093 ) ) ( not ( = ?auto_178090 ?auto_178092 ) ) ( not ( = ?auto_178091 ?auto_178095 ) ) ( not ( = ?auto_178091 ?auto_178093 ) ) ( not ( = ?auto_178091 ?auto_178092 ) ) ( not ( = ?auto_178096 ?auto_178095 ) ) ( not ( = ?auto_178096 ?auto_178093 ) ) ( not ( = ?auto_178096 ?auto_178092 ) ) ( ON ?auto_178094 ?auto_178096 ) ( CLEAR ?auto_178094 ) ( HOLDING ?auto_178095 ) ( CLEAR ?auto_178092 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178093 ?auto_178092 ?auto_178095 )
      ( MAKE-2PILE ?auto_178089 ?auto_178090 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178097 - BLOCK
      ?auto_178098 - BLOCK
    )
    :vars
    (
      ?auto_178100 - BLOCK
      ?auto_178104 - BLOCK
      ?auto_178101 - BLOCK
      ?auto_178099 - BLOCK
      ?auto_178102 - BLOCK
      ?auto_178103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178100 ?auto_178098 ) ( ON-TABLE ?auto_178097 ) ( ON ?auto_178098 ?auto_178097 ) ( not ( = ?auto_178097 ?auto_178098 ) ) ( not ( = ?auto_178097 ?auto_178100 ) ) ( not ( = ?auto_178098 ?auto_178100 ) ) ( not ( = ?auto_178097 ?auto_178104 ) ) ( not ( = ?auto_178097 ?auto_178101 ) ) ( not ( = ?auto_178098 ?auto_178104 ) ) ( not ( = ?auto_178098 ?auto_178101 ) ) ( not ( = ?auto_178100 ?auto_178104 ) ) ( not ( = ?auto_178100 ?auto_178101 ) ) ( not ( = ?auto_178104 ?auto_178101 ) ) ( ON ?auto_178104 ?auto_178100 ) ( ON-TABLE ?auto_178099 ) ( ON ?auto_178102 ?auto_178099 ) ( not ( = ?auto_178099 ?auto_178102 ) ) ( not ( = ?auto_178099 ?auto_178103 ) ) ( not ( = ?auto_178099 ?auto_178101 ) ) ( not ( = ?auto_178102 ?auto_178103 ) ) ( not ( = ?auto_178102 ?auto_178101 ) ) ( not ( = ?auto_178103 ?auto_178101 ) ) ( not ( = ?auto_178097 ?auto_178103 ) ) ( not ( = ?auto_178097 ?auto_178099 ) ) ( not ( = ?auto_178097 ?auto_178102 ) ) ( not ( = ?auto_178098 ?auto_178103 ) ) ( not ( = ?auto_178098 ?auto_178099 ) ) ( not ( = ?auto_178098 ?auto_178102 ) ) ( not ( = ?auto_178100 ?auto_178103 ) ) ( not ( = ?auto_178100 ?auto_178099 ) ) ( not ( = ?auto_178100 ?auto_178102 ) ) ( not ( = ?auto_178104 ?auto_178103 ) ) ( not ( = ?auto_178104 ?auto_178099 ) ) ( not ( = ?auto_178104 ?auto_178102 ) ) ( ON ?auto_178101 ?auto_178104 ) ( CLEAR ?auto_178102 ) ( ON ?auto_178103 ?auto_178101 ) ( CLEAR ?auto_178103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178097 ?auto_178098 ?auto_178100 ?auto_178104 ?auto_178101 )
      ( MAKE-2PILE ?auto_178097 ?auto_178098 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178105 - BLOCK
      ?auto_178106 - BLOCK
    )
    :vars
    (
      ?auto_178107 - BLOCK
      ?auto_178110 - BLOCK
      ?auto_178109 - BLOCK
      ?auto_178111 - BLOCK
      ?auto_178112 - BLOCK
      ?auto_178108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178107 ?auto_178106 ) ( ON-TABLE ?auto_178105 ) ( ON ?auto_178106 ?auto_178105 ) ( not ( = ?auto_178105 ?auto_178106 ) ) ( not ( = ?auto_178105 ?auto_178107 ) ) ( not ( = ?auto_178106 ?auto_178107 ) ) ( not ( = ?auto_178105 ?auto_178110 ) ) ( not ( = ?auto_178105 ?auto_178109 ) ) ( not ( = ?auto_178106 ?auto_178110 ) ) ( not ( = ?auto_178106 ?auto_178109 ) ) ( not ( = ?auto_178107 ?auto_178110 ) ) ( not ( = ?auto_178107 ?auto_178109 ) ) ( not ( = ?auto_178110 ?auto_178109 ) ) ( ON ?auto_178110 ?auto_178107 ) ( ON-TABLE ?auto_178111 ) ( not ( = ?auto_178111 ?auto_178112 ) ) ( not ( = ?auto_178111 ?auto_178108 ) ) ( not ( = ?auto_178111 ?auto_178109 ) ) ( not ( = ?auto_178112 ?auto_178108 ) ) ( not ( = ?auto_178112 ?auto_178109 ) ) ( not ( = ?auto_178108 ?auto_178109 ) ) ( not ( = ?auto_178105 ?auto_178108 ) ) ( not ( = ?auto_178105 ?auto_178111 ) ) ( not ( = ?auto_178105 ?auto_178112 ) ) ( not ( = ?auto_178106 ?auto_178108 ) ) ( not ( = ?auto_178106 ?auto_178111 ) ) ( not ( = ?auto_178106 ?auto_178112 ) ) ( not ( = ?auto_178107 ?auto_178108 ) ) ( not ( = ?auto_178107 ?auto_178111 ) ) ( not ( = ?auto_178107 ?auto_178112 ) ) ( not ( = ?auto_178110 ?auto_178108 ) ) ( not ( = ?auto_178110 ?auto_178111 ) ) ( not ( = ?auto_178110 ?auto_178112 ) ) ( ON ?auto_178109 ?auto_178110 ) ( ON ?auto_178108 ?auto_178109 ) ( CLEAR ?auto_178108 ) ( HOLDING ?auto_178112 ) ( CLEAR ?auto_178111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178111 ?auto_178112 )
      ( MAKE-2PILE ?auto_178105 ?auto_178106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178113 - BLOCK
      ?auto_178114 - BLOCK
    )
    :vars
    (
      ?auto_178118 - BLOCK
      ?auto_178117 - BLOCK
      ?auto_178115 - BLOCK
      ?auto_178116 - BLOCK
      ?auto_178119 - BLOCK
      ?auto_178120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178118 ?auto_178114 ) ( ON-TABLE ?auto_178113 ) ( ON ?auto_178114 ?auto_178113 ) ( not ( = ?auto_178113 ?auto_178114 ) ) ( not ( = ?auto_178113 ?auto_178118 ) ) ( not ( = ?auto_178114 ?auto_178118 ) ) ( not ( = ?auto_178113 ?auto_178117 ) ) ( not ( = ?auto_178113 ?auto_178115 ) ) ( not ( = ?auto_178114 ?auto_178117 ) ) ( not ( = ?auto_178114 ?auto_178115 ) ) ( not ( = ?auto_178118 ?auto_178117 ) ) ( not ( = ?auto_178118 ?auto_178115 ) ) ( not ( = ?auto_178117 ?auto_178115 ) ) ( ON ?auto_178117 ?auto_178118 ) ( ON-TABLE ?auto_178116 ) ( not ( = ?auto_178116 ?auto_178119 ) ) ( not ( = ?auto_178116 ?auto_178120 ) ) ( not ( = ?auto_178116 ?auto_178115 ) ) ( not ( = ?auto_178119 ?auto_178120 ) ) ( not ( = ?auto_178119 ?auto_178115 ) ) ( not ( = ?auto_178120 ?auto_178115 ) ) ( not ( = ?auto_178113 ?auto_178120 ) ) ( not ( = ?auto_178113 ?auto_178116 ) ) ( not ( = ?auto_178113 ?auto_178119 ) ) ( not ( = ?auto_178114 ?auto_178120 ) ) ( not ( = ?auto_178114 ?auto_178116 ) ) ( not ( = ?auto_178114 ?auto_178119 ) ) ( not ( = ?auto_178118 ?auto_178120 ) ) ( not ( = ?auto_178118 ?auto_178116 ) ) ( not ( = ?auto_178118 ?auto_178119 ) ) ( not ( = ?auto_178117 ?auto_178120 ) ) ( not ( = ?auto_178117 ?auto_178116 ) ) ( not ( = ?auto_178117 ?auto_178119 ) ) ( ON ?auto_178115 ?auto_178117 ) ( ON ?auto_178120 ?auto_178115 ) ( CLEAR ?auto_178116 ) ( ON ?auto_178119 ?auto_178120 ) ( CLEAR ?auto_178119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178113 ?auto_178114 ?auto_178118 ?auto_178117 ?auto_178115 ?auto_178120 )
      ( MAKE-2PILE ?auto_178113 ?auto_178114 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178121 - BLOCK
      ?auto_178122 - BLOCK
    )
    :vars
    (
      ?auto_178127 - BLOCK
      ?auto_178124 - BLOCK
      ?auto_178126 - BLOCK
      ?auto_178128 - BLOCK
      ?auto_178125 - BLOCK
      ?auto_178123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178127 ?auto_178122 ) ( ON-TABLE ?auto_178121 ) ( ON ?auto_178122 ?auto_178121 ) ( not ( = ?auto_178121 ?auto_178122 ) ) ( not ( = ?auto_178121 ?auto_178127 ) ) ( not ( = ?auto_178122 ?auto_178127 ) ) ( not ( = ?auto_178121 ?auto_178124 ) ) ( not ( = ?auto_178121 ?auto_178126 ) ) ( not ( = ?auto_178122 ?auto_178124 ) ) ( not ( = ?auto_178122 ?auto_178126 ) ) ( not ( = ?auto_178127 ?auto_178124 ) ) ( not ( = ?auto_178127 ?auto_178126 ) ) ( not ( = ?auto_178124 ?auto_178126 ) ) ( ON ?auto_178124 ?auto_178127 ) ( not ( = ?auto_178128 ?auto_178125 ) ) ( not ( = ?auto_178128 ?auto_178123 ) ) ( not ( = ?auto_178128 ?auto_178126 ) ) ( not ( = ?auto_178125 ?auto_178123 ) ) ( not ( = ?auto_178125 ?auto_178126 ) ) ( not ( = ?auto_178123 ?auto_178126 ) ) ( not ( = ?auto_178121 ?auto_178123 ) ) ( not ( = ?auto_178121 ?auto_178128 ) ) ( not ( = ?auto_178121 ?auto_178125 ) ) ( not ( = ?auto_178122 ?auto_178123 ) ) ( not ( = ?auto_178122 ?auto_178128 ) ) ( not ( = ?auto_178122 ?auto_178125 ) ) ( not ( = ?auto_178127 ?auto_178123 ) ) ( not ( = ?auto_178127 ?auto_178128 ) ) ( not ( = ?auto_178127 ?auto_178125 ) ) ( not ( = ?auto_178124 ?auto_178123 ) ) ( not ( = ?auto_178124 ?auto_178128 ) ) ( not ( = ?auto_178124 ?auto_178125 ) ) ( ON ?auto_178126 ?auto_178124 ) ( ON ?auto_178123 ?auto_178126 ) ( ON ?auto_178125 ?auto_178123 ) ( CLEAR ?auto_178125 ) ( HOLDING ?auto_178128 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178128 )
      ( MAKE-2PILE ?auto_178121 ?auto_178122 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178129 - BLOCK
      ?auto_178130 - BLOCK
    )
    :vars
    (
      ?auto_178131 - BLOCK
      ?auto_178133 - BLOCK
      ?auto_178134 - BLOCK
      ?auto_178136 - BLOCK
      ?auto_178132 - BLOCK
      ?auto_178135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178131 ?auto_178130 ) ( ON-TABLE ?auto_178129 ) ( ON ?auto_178130 ?auto_178129 ) ( not ( = ?auto_178129 ?auto_178130 ) ) ( not ( = ?auto_178129 ?auto_178131 ) ) ( not ( = ?auto_178130 ?auto_178131 ) ) ( not ( = ?auto_178129 ?auto_178133 ) ) ( not ( = ?auto_178129 ?auto_178134 ) ) ( not ( = ?auto_178130 ?auto_178133 ) ) ( not ( = ?auto_178130 ?auto_178134 ) ) ( not ( = ?auto_178131 ?auto_178133 ) ) ( not ( = ?auto_178131 ?auto_178134 ) ) ( not ( = ?auto_178133 ?auto_178134 ) ) ( ON ?auto_178133 ?auto_178131 ) ( not ( = ?auto_178136 ?auto_178132 ) ) ( not ( = ?auto_178136 ?auto_178135 ) ) ( not ( = ?auto_178136 ?auto_178134 ) ) ( not ( = ?auto_178132 ?auto_178135 ) ) ( not ( = ?auto_178132 ?auto_178134 ) ) ( not ( = ?auto_178135 ?auto_178134 ) ) ( not ( = ?auto_178129 ?auto_178135 ) ) ( not ( = ?auto_178129 ?auto_178136 ) ) ( not ( = ?auto_178129 ?auto_178132 ) ) ( not ( = ?auto_178130 ?auto_178135 ) ) ( not ( = ?auto_178130 ?auto_178136 ) ) ( not ( = ?auto_178130 ?auto_178132 ) ) ( not ( = ?auto_178131 ?auto_178135 ) ) ( not ( = ?auto_178131 ?auto_178136 ) ) ( not ( = ?auto_178131 ?auto_178132 ) ) ( not ( = ?auto_178133 ?auto_178135 ) ) ( not ( = ?auto_178133 ?auto_178136 ) ) ( not ( = ?auto_178133 ?auto_178132 ) ) ( ON ?auto_178134 ?auto_178133 ) ( ON ?auto_178135 ?auto_178134 ) ( ON ?auto_178132 ?auto_178135 ) ( ON ?auto_178136 ?auto_178132 ) ( CLEAR ?auto_178136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178129 ?auto_178130 ?auto_178131 ?auto_178133 ?auto_178134 ?auto_178135 ?auto_178132 )
      ( MAKE-2PILE ?auto_178129 ?auto_178130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178137 - BLOCK
      ?auto_178138 - BLOCK
    )
    :vars
    (
      ?auto_178142 - BLOCK
      ?auto_178140 - BLOCK
      ?auto_178143 - BLOCK
      ?auto_178144 - BLOCK
      ?auto_178139 - BLOCK
      ?auto_178141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178142 ?auto_178138 ) ( ON-TABLE ?auto_178137 ) ( ON ?auto_178138 ?auto_178137 ) ( not ( = ?auto_178137 ?auto_178138 ) ) ( not ( = ?auto_178137 ?auto_178142 ) ) ( not ( = ?auto_178138 ?auto_178142 ) ) ( not ( = ?auto_178137 ?auto_178140 ) ) ( not ( = ?auto_178137 ?auto_178143 ) ) ( not ( = ?auto_178138 ?auto_178140 ) ) ( not ( = ?auto_178138 ?auto_178143 ) ) ( not ( = ?auto_178142 ?auto_178140 ) ) ( not ( = ?auto_178142 ?auto_178143 ) ) ( not ( = ?auto_178140 ?auto_178143 ) ) ( ON ?auto_178140 ?auto_178142 ) ( not ( = ?auto_178144 ?auto_178139 ) ) ( not ( = ?auto_178144 ?auto_178141 ) ) ( not ( = ?auto_178144 ?auto_178143 ) ) ( not ( = ?auto_178139 ?auto_178141 ) ) ( not ( = ?auto_178139 ?auto_178143 ) ) ( not ( = ?auto_178141 ?auto_178143 ) ) ( not ( = ?auto_178137 ?auto_178141 ) ) ( not ( = ?auto_178137 ?auto_178144 ) ) ( not ( = ?auto_178137 ?auto_178139 ) ) ( not ( = ?auto_178138 ?auto_178141 ) ) ( not ( = ?auto_178138 ?auto_178144 ) ) ( not ( = ?auto_178138 ?auto_178139 ) ) ( not ( = ?auto_178142 ?auto_178141 ) ) ( not ( = ?auto_178142 ?auto_178144 ) ) ( not ( = ?auto_178142 ?auto_178139 ) ) ( not ( = ?auto_178140 ?auto_178141 ) ) ( not ( = ?auto_178140 ?auto_178144 ) ) ( not ( = ?auto_178140 ?auto_178139 ) ) ( ON ?auto_178143 ?auto_178140 ) ( ON ?auto_178141 ?auto_178143 ) ( ON ?auto_178139 ?auto_178141 ) ( HOLDING ?auto_178144 ) ( CLEAR ?auto_178139 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178137 ?auto_178138 ?auto_178142 ?auto_178140 ?auto_178143 ?auto_178141 ?auto_178139 ?auto_178144 )
      ( MAKE-2PILE ?auto_178137 ?auto_178138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178145 - BLOCK
      ?auto_178146 - BLOCK
    )
    :vars
    (
      ?auto_178149 - BLOCK
      ?auto_178147 - BLOCK
      ?auto_178148 - BLOCK
      ?auto_178151 - BLOCK
      ?auto_178150 - BLOCK
      ?auto_178152 - BLOCK
      ?auto_178153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178149 ?auto_178146 ) ( ON-TABLE ?auto_178145 ) ( ON ?auto_178146 ?auto_178145 ) ( not ( = ?auto_178145 ?auto_178146 ) ) ( not ( = ?auto_178145 ?auto_178149 ) ) ( not ( = ?auto_178146 ?auto_178149 ) ) ( not ( = ?auto_178145 ?auto_178147 ) ) ( not ( = ?auto_178145 ?auto_178148 ) ) ( not ( = ?auto_178146 ?auto_178147 ) ) ( not ( = ?auto_178146 ?auto_178148 ) ) ( not ( = ?auto_178149 ?auto_178147 ) ) ( not ( = ?auto_178149 ?auto_178148 ) ) ( not ( = ?auto_178147 ?auto_178148 ) ) ( ON ?auto_178147 ?auto_178149 ) ( not ( = ?auto_178151 ?auto_178150 ) ) ( not ( = ?auto_178151 ?auto_178152 ) ) ( not ( = ?auto_178151 ?auto_178148 ) ) ( not ( = ?auto_178150 ?auto_178152 ) ) ( not ( = ?auto_178150 ?auto_178148 ) ) ( not ( = ?auto_178152 ?auto_178148 ) ) ( not ( = ?auto_178145 ?auto_178152 ) ) ( not ( = ?auto_178145 ?auto_178151 ) ) ( not ( = ?auto_178145 ?auto_178150 ) ) ( not ( = ?auto_178146 ?auto_178152 ) ) ( not ( = ?auto_178146 ?auto_178151 ) ) ( not ( = ?auto_178146 ?auto_178150 ) ) ( not ( = ?auto_178149 ?auto_178152 ) ) ( not ( = ?auto_178149 ?auto_178151 ) ) ( not ( = ?auto_178149 ?auto_178150 ) ) ( not ( = ?auto_178147 ?auto_178152 ) ) ( not ( = ?auto_178147 ?auto_178151 ) ) ( not ( = ?auto_178147 ?auto_178150 ) ) ( ON ?auto_178148 ?auto_178147 ) ( ON ?auto_178152 ?auto_178148 ) ( ON ?auto_178150 ?auto_178152 ) ( CLEAR ?auto_178150 ) ( ON ?auto_178151 ?auto_178153 ) ( CLEAR ?auto_178151 ) ( HAND-EMPTY ) ( not ( = ?auto_178145 ?auto_178153 ) ) ( not ( = ?auto_178146 ?auto_178153 ) ) ( not ( = ?auto_178149 ?auto_178153 ) ) ( not ( = ?auto_178147 ?auto_178153 ) ) ( not ( = ?auto_178148 ?auto_178153 ) ) ( not ( = ?auto_178151 ?auto_178153 ) ) ( not ( = ?auto_178150 ?auto_178153 ) ) ( not ( = ?auto_178152 ?auto_178153 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178151 ?auto_178153 )
      ( MAKE-2PILE ?auto_178145 ?auto_178146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178154 - BLOCK
      ?auto_178155 - BLOCK
    )
    :vars
    (
      ?auto_178160 - BLOCK
      ?auto_178156 - BLOCK
      ?auto_178159 - BLOCK
      ?auto_178158 - BLOCK
      ?auto_178157 - BLOCK
      ?auto_178161 - BLOCK
      ?auto_178162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178160 ?auto_178155 ) ( ON-TABLE ?auto_178154 ) ( ON ?auto_178155 ?auto_178154 ) ( not ( = ?auto_178154 ?auto_178155 ) ) ( not ( = ?auto_178154 ?auto_178160 ) ) ( not ( = ?auto_178155 ?auto_178160 ) ) ( not ( = ?auto_178154 ?auto_178156 ) ) ( not ( = ?auto_178154 ?auto_178159 ) ) ( not ( = ?auto_178155 ?auto_178156 ) ) ( not ( = ?auto_178155 ?auto_178159 ) ) ( not ( = ?auto_178160 ?auto_178156 ) ) ( not ( = ?auto_178160 ?auto_178159 ) ) ( not ( = ?auto_178156 ?auto_178159 ) ) ( ON ?auto_178156 ?auto_178160 ) ( not ( = ?auto_178158 ?auto_178157 ) ) ( not ( = ?auto_178158 ?auto_178161 ) ) ( not ( = ?auto_178158 ?auto_178159 ) ) ( not ( = ?auto_178157 ?auto_178161 ) ) ( not ( = ?auto_178157 ?auto_178159 ) ) ( not ( = ?auto_178161 ?auto_178159 ) ) ( not ( = ?auto_178154 ?auto_178161 ) ) ( not ( = ?auto_178154 ?auto_178158 ) ) ( not ( = ?auto_178154 ?auto_178157 ) ) ( not ( = ?auto_178155 ?auto_178161 ) ) ( not ( = ?auto_178155 ?auto_178158 ) ) ( not ( = ?auto_178155 ?auto_178157 ) ) ( not ( = ?auto_178160 ?auto_178161 ) ) ( not ( = ?auto_178160 ?auto_178158 ) ) ( not ( = ?auto_178160 ?auto_178157 ) ) ( not ( = ?auto_178156 ?auto_178161 ) ) ( not ( = ?auto_178156 ?auto_178158 ) ) ( not ( = ?auto_178156 ?auto_178157 ) ) ( ON ?auto_178159 ?auto_178156 ) ( ON ?auto_178161 ?auto_178159 ) ( ON ?auto_178158 ?auto_178162 ) ( CLEAR ?auto_178158 ) ( not ( = ?auto_178154 ?auto_178162 ) ) ( not ( = ?auto_178155 ?auto_178162 ) ) ( not ( = ?auto_178160 ?auto_178162 ) ) ( not ( = ?auto_178156 ?auto_178162 ) ) ( not ( = ?auto_178159 ?auto_178162 ) ) ( not ( = ?auto_178158 ?auto_178162 ) ) ( not ( = ?auto_178157 ?auto_178162 ) ) ( not ( = ?auto_178161 ?auto_178162 ) ) ( HOLDING ?auto_178157 ) ( CLEAR ?auto_178161 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178154 ?auto_178155 ?auto_178160 ?auto_178156 ?auto_178159 ?auto_178161 ?auto_178157 )
      ( MAKE-2PILE ?auto_178154 ?auto_178155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178163 - BLOCK
      ?auto_178164 - BLOCK
    )
    :vars
    (
      ?auto_178165 - BLOCK
      ?auto_178169 - BLOCK
      ?auto_178168 - BLOCK
      ?auto_178171 - BLOCK
      ?auto_178170 - BLOCK
      ?auto_178167 - BLOCK
      ?auto_178166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178165 ?auto_178164 ) ( ON-TABLE ?auto_178163 ) ( ON ?auto_178164 ?auto_178163 ) ( not ( = ?auto_178163 ?auto_178164 ) ) ( not ( = ?auto_178163 ?auto_178165 ) ) ( not ( = ?auto_178164 ?auto_178165 ) ) ( not ( = ?auto_178163 ?auto_178169 ) ) ( not ( = ?auto_178163 ?auto_178168 ) ) ( not ( = ?auto_178164 ?auto_178169 ) ) ( not ( = ?auto_178164 ?auto_178168 ) ) ( not ( = ?auto_178165 ?auto_178169 ) ) ( not ( = ?auto_178165 ?auto_178168 ) ) ( not ( = ?auto_178169 ?auto_178168 ) ) ( ON ?auto_178169 ?auto_178165 ) ( not ( = ?auto_178171 ?auto_178170 ) ) ( not ( = ?auto_178171 ?auto_178167 ) ) ( not ( = ?auto_178171 ?auto_178168 ) ) ( not ( = ?auto_178170 ?auto_178167 ) ) ( not ( = ?auto_178170 ?auto_178168 ) ) ( not ( = ?auto_178167 ?auto_178168 ) ) ( not ( = ?auto_178163 ?auto_178167 ) ) ( not ( = ?auto_178163 ?auto_178171 ) ) ( not ( = ?auto_178163 ?auto_178170 ) ) ( not ( = ?auto_178164 ?auto_178167 ) ) ( not ( = ?auto_178164 ?auto_178171 ) ) ( not ( = ?auto_178164 ?auto_178170 ) ) ( not ( = ?auto_178165 ?auto_178167 ) ) ( not ( = ?auto_178165 ?auto_178171 ) ) ( not ( = ?auto_178165 ?auto_178170 ) ) ( not ( = ?auto_178169 ?auto_178167 ) ) ( not ( = ?auto_178169 ?auto_178171 ) ) ( not ( = ?auto_178169 ?auto_178170 ) ) ( ON ?auto_178168 ?auto_178169 ) ( ON ?auto_178167 ?auto_178168 ) ( ON ?auto_178171 ?auto_178166 ) ( not ( = ?auto_178163 ?auto_178166 ) ) ( not ( = ?auto_178164 ?auto_178166 ) ) ( not ( = ?auto_178165 ?auto_178166 ) ) ( not ( = ?auto_178169 ?auto_178166 ) ) ( not ( = ?auto_178168 ?auto_178166 ) ) ( not ( = ?auto_178171 ?auto_178166 ) ) ( not ( = ?auto_178170 ?auto_178166 ) ) ( not ( = ?auto_178167 ?auto_178166 ) ) ( CLEAR ?auto_178167 ) ( ON ?auto_178170 ?auto_178171 ) ( CLEAR ?auto_178170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178166 ?auto_178171 )
      ( MAKE-2PILE ?auto_178163 ?auto_178164 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178172 - BLOCK
      ?auto_178173 - BLOCK
    )
    :vars
    (
      ?auto_178175 - BLOCK
      ?auto_178178 - BLOCK
      ?auto_178177 - BLOCK
      ?auto_178176 - BLOCK
      ?auto_178180 - BLOCK
      ?auto_178179 - BLOCK
      ?auto_178174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178175 ?auto_178173 ) ( ON-TABLE ?auto_178172 ) ( ON ?auto_178173 ?auto_178172 ) ( not ( = ?auto_178172 ?auto_178173 ) ) ( not ( = ?auto_178172 ?auto_178175 ) ) ( not ( = ?auto_178173 ?auto_178175 ) ) ( not ( = ?auto_178172 ?auto_178178 ) ) ( not ( = ?auto_178172 ?auto_178177 ) ) ( not ( = ?auto_178173 ?auto_178178 ) ) ( not ( = ?auto_178173 ?auto_178177 ) ) ( not ( = ?auto_178175 ?auto_178178 ) ) ( not ( = ?auto_178175 ?auto_178177 ) ) ( not ( = ?auto_178178 ?auto_178177 ) ) ( ON ?auto_178178 ?auto_178175 ) ( not ( = ?auto_178176 ?auto_178180 ) ) ( not ( = ?auto_178176 ?auto_178179 ) ) ( not ( = ?auto_178176 ?auto_178177 ) ) ( not ( = ?auto_178180 ?auto_178179 ) ) ( not ( = ?auto_178180 ?auto_178177 ) ) ( not ( = ?auto_178179 ?auto_178177 ) ) ( not ( = ?auto_178172 ?auto_178179 ) ) ( not ( = ?auto_178172 ?auto_178176 ) ) ( not ( = ?auto_178172 ?auto_178180 ) ) ( not ( = ?auto_178173 ?auto_178179 ) ) ( not ( = ?auto_178173 ?auto_178176 ) ) ( not ( = ?auto_178173 ?auto_178180 ) ) ( not ( = ?auto_178175 ?auto_178179 ) ) ( not ( = ?auto_178175 ?auto_178176 ) ) ( not ( = ?auto_178175 ?auto_178180 ) ) ( not ( = ?auto_178178 ?auto_178179 ) ) ( not ( = ?auto_178178 ?auto_178176 ) ) ( not ( = ?auto_178178 ?auto_178180 ) ) ( ON ?auto_178177 ?auto_178178 ) ( ON ?auto_178176 ?auto_178174 ) ( not ( = ?auto_178172 ?auto_178174 ) ) ( not ( = ?auto_178173 ?auto_178174 ) ) ( not ( = ?auto_178175 ?auto_178174 ) ) ( not ( = ?auto_178178 ?auto_178174 ) ) ( not ( = ?auto_178177 ?auto_178174 ) ) ( not ( = ?auto_178176 ?auto_178174 ) ) ( not ( = ?auto_178180 ?auto_178174 ) ) ( not ( = ?auto_178179 ?auto_178174 ) ) ( ON ?auto_178180 ?auto_178176 ) ( CLEAR ?auto_178180 ) ( ON-TABLE ?auto_178174 ) ( HOLDING ?auto_178179 ) ( CLEAR ?auto_178177 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178172 ?auto_178173 ?auto_178175 ?auto_178178 ?auto_178177 ?auto_178179 )
      ( MAKE-2PILE ?auto_178172 ?auto_178173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178181 - BLOCK
      ?auto_178182 - BLOCK
    )
    :vars
    (
      ?auto_178187 - BLOCK
      ?auto_178183 - BLOCK
      ?auto_178186 - BLOCK
      ?auto_178188 - BLOCK
      ?auto_178184 - BLOCK
      ?auto_178189 - BLOCK
      ?auto_178185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178187 ?auto_178182 ) ( ON-TABLE ?auto_178181 ) ( ON ?auto_178182 ?auto_178181 ) ( not ( = ?auto_178181 ?auto_178182 ) ) ( not ( = ?auto_178181 ?auto_178187 ) ) ( not ( = ?auto_178182 ?auto_178187 ) ) ( not ( = ?auto_178181 ?auto_178183 ) ) ( not ( = ?auto_178181 ?auto_178186 ) ) ( not ( = ?auto_178182 ?auto_178183 ) ) ( not ( = ?auto_178182 ?auto_178186 ) ) ( not ( = ?auto_178187 ?auto_178183 ) ) ( not ( = ?auto_178187 ?auto_178186 ) ) ( not ( = ?auto_178183 ?auto_178186 ) ) ( ON ?auto_178183 ?auto_178187 ) ( not ( = ?auto_178188 ?auto_178184 ) ) ( not ( = ?auto_178188 ?auto_178189 ) ) ( not ( = ?auto_178188 ?auto_178186 ) ) ( not ( = ?auto_178184 ?auto_178189 ) ) ( not ( = ?auto_178184 ?auto_178186 ) ) ( not ( = ?auto_178189 ?auto_178186 ) ) ( not ( = ?auto_178181 ?auto_178189 ) ) ( not ( = ?auto_178181 ?auto_178188 ) ) ( not ( = ?auto_178181 ?auto_178184 ) ) ( not ( = ?auto_178182 ?auto_178189 ) ) ( not ( = ?auto_178182 ?auto_178188 ) ) ( not ( = ?auto_178182 ?auto_178184 ) ) ( not ( = ?auto_178187 ?auto_178189 ) ) ( not ( = ?auto_178187 ?auto_178188 ) ) ( not ( = ?auto_178187 ?auto_178184 ) ) ( not ( = ?auto_178183 ?auto_178189 ) ) ( not ( = ?auto_178183 ?auto_178188 ) ) ( not ( = ?auto_178183 ?auto_178184 ) ) ( ON ?auto_178186 ?auto_178183 ) ( ON ?auto_178188 ?auto_178185 ) ( not ( = ?auto_178181 ?auto_178185 ) ) ( not ( = ?auto_178182 ?auto_178185 ) ) ( not ( = ?auto_178187 ?auto_178185 ) ) ( not ( = ?auto_178183 ?auto_178185 ) ) ( not ( = ?auto_178186 ?auto_178185 ) ) ( not ( = ?auto_178188 ?auto_178185 ) ) ( not ( = ?auto_178184 ?auto_178185 ) ) ( not ( = ?auto_178189 ?auto_178185 ) ) ( ON ?auto_178184 ?auto_178188 ) ( ON-TABLE ?auto_178185 ) ( CLEAR ?auto_178186 ) ( ON ?auto_178189 ?auto_178184 ) ( CLEAR ?auto_178189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178185 ?auto_178188 ?auto_178184 )
      ( MAKE-2PILE ?auto_178181 ?auto_178182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178190 - BLOCK
      ?auto_178191 - BLOCK
    )
    :vars
    (
      ?auto_178196 - BLOCK
      ?auto_178198 - BLOCK
      ?auto_178195 - BLOCK
      ?auto_178193 - BLOCK
      ?auto_178192 - BLOCK
      ?auto_178194 - BLOCK
      ?auto_178197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178196 ?auto_178191 ) ( ON-TABLE ?auto_178190 ) ( ON ?auto_178191 ?auto_178190 ) ( not ( = ?auto_178190 ?auto_178191 ) ) ( not ( = ?auto_178190 ?auto_178196 ) ) ( not ( = ?auto_178191 ?auto_178196 ) ) ( not ( = ?auto_178190 ?auto_178198 ) ) ( not ( = ?auto_178190 ?auto_178195 ) ) ( not ( = ?auto_178191 ?auto_178198 ) ) ( not ( = ?auto_178191 ?auto_178195 ) ) ( not ( = ?auto_178196 ?auto_178198 ) ) ( not ( = ?auto_178196 ?auto_178195 ) ) ( not ( = ?auto_178198 ?auto_178195 ) ) ( ON ?auto_178198 ?auto_178196 ) ( not ( = ?auto_178193 ?auto_178192 ) ) ( not ( = ?auto_178193 ?auto_178194 ) ) ( not ( = ?auto_178193 ?auto_178195 ) ) ( not ( = ?auto_178192 ?auto_178194 ) ) ( not ( = ?auto_178192 ?auto_178195 ) ) ( not ( = ?auto_178194 ?auto_178195 ) ) ( not ( = ?auto_178190 ?auto_178194 ) ) ( not ( = ?auto_178190 ?auto_178193 ) ) ( not ( = ?auto_178190 ?auto_178192 ) ) ( not ( = ?auto_178191 ?auto_178194 ) ) ( not ( = ?auto_178191 ?auto_178193 ) ) ( not ( = ?auto_178191 ?auto_178192 ) ) ( not ( = ?auto_178196 ?auto_178194 ) ) ( not ( = ?auto_178196 ?auto_178193 ) ) ( not ( = ?auto_178196 ?auto_178192 ) ) ( not ( = ?auto_178198 ?auto_178194 ) ) ( not ( = ?auto_178198 ?auto_178193 ) ) ( not ( = ?auto_178198 ?auto_178192 ) ) ( ON ?auto_178193 ?auto_178197 ) ( not ( = ?auto_178190 ?auto_178197 ) ) ( not ( = ?auto_178191 ?auto_178197 ) ) ( not ( = ?auto_178196 ?auto_178197 ) ) ( not ( = ?auto_178198 ?auto_178197 ) ) ( not ( = ?auto_178195 ?auto_178197 ) ) ( not ( = ?auto_178193 ?auto_178197 ) ) ( not ( = ?auto_178192 ?auto_178197 ) ) ( not ( = ?auto_178194 ?auto_178197 ) ) ( ON ?auto_178192 ?auto_178193 ) ( ON-TABLE ?auto_178197 ) ( ON ?auto_178194 ?auto_178192 ) ( CLEAR ?auto_178194 ) ( HOLDING ?auto_178195 ) ( CLEAR ?auto_178198 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178190 ?auto_178191 ?auto_178196 ?auto_178198 ?auto_178195 )
      ( MAKE-2PILE ?auto_178190 ?auto_178191 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178199 - BLOCK
      ?auto_178200 - BLOCK
    )
    :vars
    (
      ?auto_178206 - BLOCK
      ?auto_178205 - BLOCK
      ?auto_178201 - BLOCK
      ?auto_178207 - BLOCK
      ?auto_178204 - BLOCK
      ?auto_178203 - BLOCK
      ?auto_178202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178206 ?auto_178200 ) ( ON-TABLE ?auto_178199 ) ( ON ?auto_178200 ?auto_178199 ) ( not ( = ?auto_178199 ?auto_178200 ) ) ( not ( = ?auto_178199 ?auto_178206 ) ) ( not ( = ?auto_178200 ?auto_178206 ) ) ( not ( = ?auto_178199 ?auto_178205 ) ) ( not ( = ?auto_178199 ?auto_178201 ) ) ( not ( = ?auto_178200 ?auto_178205 ) ) ( not ( = ?auto_178200 ?auto_178201 ) ) ( not ( = ?auto_178206 ?auto_178205 ) ) ( not ( = ?auto_178206 ?auto_178201 ) ) ( not ( = ?auto_178205 ?auto_178201 ) ) ( ON ?auto_178205 ?auto_178206 ) ( not ( = ?auto_178207 ?auto_178204 ) ) ( not ( = ?auto_178207 ?auto_178203 ) ) ( not ( = ?auto_178207 ?auto_178201 ) ) ( not ( = ?auto_178204 ?auto_178203 ) ) ( not ( = ?auto_178204 ?auto_178201 ) ) ( not ( = ?auto_178203 ?auto_178201 ) ) ( not ( = ?auto_178199 ?auto_178203 ) ) ( not ( = ?auto_178199 ?auto_178207 ) ) ( not ( = ?auto_178199 ?auto_178204 ) ) ( not ( = ?auto_178200 ?auto_178203 ) ) ( not ( = ?auto_178200 ?auto_178207 ) ) ( not ( = ?auto_178200 ?auto_178204 ) ) ( not ( = ?auto_178206 ?auto_178203 ) ) ( not ( = ?auto_178206 ?auto_178207 ) ) ( not ( = ?auto_178206 ?auto_178204 ) ) ( not ( = ?auto_178205 ?auto_178203 ) ) ( not ( = ?auto_178205 ?auto_178207 ) ) ( not ( = ?auto_178205 ?auto_178204 ) ) ( ON ?auto_178207 ?auto_178202 ) ( not ( = ?auto_178199 ?auto_178202 ) ) ( not ( = ?auto_178200 ?auto_178202 ) ) ( not ( = ?auto_178206 ?auto_178202 ) ) ( not ( = ?auto_178205 ?auto_178202 ) ) ( not ( = ?auto_178201 ?auto_178202 ) ) ( not ( = ?auto_178207 ?auto_178202 ) ) ( not ( = ?auto_178204 ?auto_178202 ) ) ( not ( = ?auto_178203 ?auto_178202 ) ) ( ON ?auto_178204 ?auto_178207 ) ( ON-TABLE ?auto_178202 ) ( ON ?auto_178203 ?auto_178204 ) ( CLEAR ?auto_178205 ) ( ON ?auto_178201 ?auto_178203 ) ( CLEAR ?auto_178201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178202 ?auto_178207 ?auto_178204 ?auto_178203 )
      ( MAKE-2PILE ?auto_178199 ?auto_178200 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178208 - BLOCK
      ?auto_178209 - BLOCK
    )
    :vars
    (
      ?auto_178211 - BLOCK
      ?auto_178210 - BLOCK
      ?auto_178212 - BLOCK
      ?auto_178214 - BLOCK
      ?auto_178213 - BLOCK
      ?auto_178215 - BLOCK
      ?auto_178216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178211 ?auto_178209 ) ( ON-TABLE ?auto_178208 ) ( ON ?auto_178209 ?auto_178208 ) ( not ( = ?auto_178208 ?auto_178209 ) ) ( not ( = ?auto_178208 ?auto_178211 ) ) ( not ( = ?auto_178209 ?auto_178211 ) ) ( not ( = ?auto_178208 ?auto_178210 ) ) ( not ( = ?auto_178208 ?auto_178212 ) ) ( not ( = ?auto_178209 ?auto_178210 ) ) ( not ( = ?auto_178209 ?auto_178212 ) ) ( not ( = ?auto_178211 ?auto_178210 ) ) ( not ( = ?auto_178211 ?auto_178212 ) ) ( not ( = ?auto_178210 ?auto_178212 ) ) ( not ( = ?auto_178214 ?auto_178213 ) ) ( not ( = ?auto_178214 ?auto_178215 ) ) ( not ( = ?auto_178214 ?auto_178212 ) ) ( not ( = ?auto_178213 ?auto_178215 ) ) ( not ( = ?auto_178213 ?auto_178212 ) ) ( not ( = ?auto_178215 ?auto_178212 ) ) ( not ( = ?auto_178208 ?auto_178215 ) ) ( not ( = ?auto_178208 ?auto_178214 ) ) ( not ( = ?auto_178208 ?auto_178213 ) ) ( not ( = ?auto_178209 ?auto_178215 ) ) ( not ( = ?auto_178209 ?auto_178214 ) ) ( not ( = ?auto_178209 ?auto_178213 ) ) ( not ( = ?auto_178211 ?auto_178215 ) ) ( not ( = ?auto_178211 ?auto_178214 ) ) ( not ( = ?auto_178211 ?auto_178213 ) ) ( not ( = ?auto_178210 ?auto_178215 ) ) ( not ( = ?auto_178210 ?auto_178214 ) ) ( not ( = ?auto_178210 ?auto_178213 ) ) ( ON ?auto_178214 ?auto_178216 ) ( not ( = ?auto_178208 ?auto_178216 ) ) ( not ( = ?auto_178209 ?auto_178216 ) ) ( not ( = ?auto_178211 ?auto_178216 ) ) ( not ( = ?auto_178210 ?auto_178216 ) ) ( not ( = ?auto_178212 ?auto_178216 ) ) ( not ( = ?auto_178214 ?auto_178216 ) ) ( not ( = ?auto_178213 ?auto_178216 ) ) ( not ( = ?auto_178215 ?auto_178216 ) ) ( ON ?auto_178213 ?auto_178214 ) ( ON-TABLE ?auto_178216 ) ( ON ?auto_178215 ?auto_178213 ) ( ON ?auto_178212 ?auto_178215 ) ( CLEAR ?auto_178212 ) ( HOLDING ?auto_178210 ) ( CLEAR ?auto_178211 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178208 ?auto_178209 ?auto_178211 ?auto_178210 )
      ( MAKE-2PILE ?auto_178208 ?auto_178209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178217 - BLOCK
      ?auto_178218 - BLOCK
    )
    :vars
    (
      ?auto_178220 - BLOCK
      ?auto_178222 - BLOCK
      ?auto_178219 - BLOCK
      ?auto_178225 - BLOCK
      ?auto_178223 - BLOCK
      ?auto_178224 - BLOCK
      ?auto_178221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178220 ?auto_178218 ) ( ON-TABLE ?auto_178217 ) ( ON ?auto_178218 ?auto_178217 ) ( not ( = ?auto_178217 ?auto_178218 ) ) ( not ( = ?auto_178217 ?auto_178220 ) ) ( not ( = ?auto_178218 ?auto_178220 ) ) ( not ( = ?auto_178217 ?auto_178222 ) ) ( not ( = ?auto_178217 ?auto_178219 ) ) ( not ( = ?auto_178218 ?auto_178222 ) ) ( not ( = ?auto_178218 ?auto_178219 ) ) ( not ( = ?auto_178220 ?auto_178222 ) ) ( not ( = ?auto_178220 ?auto_178219 ) ) ( not ( = ?auto_178222 ?auto_178219 ) ) ( not ( = ?auto_178225 ?auto_178223 ) ) ( not ( = ?auto_178225 ?auto_178224 ) ) ( not ( = ?auto_178225 ?auto_178219 ) ) ( not ( = ?auto_178223 ?auto_178224 ) ) ( not ( = ?auto_178223 ?auto_178219 ) ) ( not ( = ?auto_178224 ?auto_178219 ) ) ( not ( = ?auto_178217 ?auto_178224 ) ) ( not ( = ?auto_178217 ?auto_178225 ) ) ( not ( = ?auto_178217 ?auto_178223 ) ) ( not ( = ?auto_178218 ?auto_178224 ) ) ( not ( = ?auto_178218 ?auto_178225 ) ) ( not ( = ?auto_178218 ?auto_178223 ) ) ( not ( = ?auto_178220 ?auto_178224 ) ) ( not ( = ?auto_178220 ?auto_178225 ) ) ( not ( = ?auto_178220 ?auto_178223 ) ) ( not ( = ?auto_178222 ?auto_178224 ) ) ( not ( = ?auto_178222 ?auto_178225 ) ) ( not ( = ?auto_178222 ?auto_178223 ) ) ( ON ?auto_178225 ?auto_178221 ) ( not ( = ?auto_178217 ?auto_178221 ) ) ( not ( = ?auto_178218 ?auto_178221 ) ) ( not ( = ?auto_178220 ?auto_178221 ) ) ( not ( = ?auto_178222 ?auto_178221 ) ) ( not ( = ?auto_178219 ?auto_178221 ) ) ( not ( = ?auto_178225 ?auto_178221 ) ) ( not ( = ?auto_178223 ?auto_178221 ) ) ( not ( = ?auto_178224 ?auto_178221 ) ) ( ON ?auto_178223 ?auto_178225 ) ( ON-TABLE ?auto_178221 ) ( ON ?auto_178224 ?auto_178223 ) ( ON ?auto_178219 ?auto_178224 ) ( CLEAR ?auto_178220 ) ( ON ?auto_178222 ?auto_178219 ) ( CLEAR ?auto_178222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178221 ?auto_178225 ?auto_178223 ?auto_178224 ?auto_178219 )
      ( MAKE-2PILE ?auto_178217 ?auto_178218 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178244 - BLOCK
      ?auto_178245 - BLOCK
    )
    :vars
    (
      ?auto_178250 - BLOCK
      ?auto_178246 - BLOCK
      ?auto_178248 - BLOCK
      ?auto_178247 - BLOCK
      ?auto_178251 - BLOCK
      ?auto_178249 - BLOCK
      ?auto_178252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178244 ) ( not ( = ?auto_178244 ?auto_178245 ) ) ( not ( = ?auto_178244 ?auto_178250 ) ) ( not ( = ?auto_178245 ?auto_178250 ) ) ( not ( = ?auto_178244 ?auto_178246 ) ) ( not ( = ?auto_178244 ?auto_178248 ) ) ( not ( = ?auto_178245 ?auto_178246 ) ) ( not ( = ?auto_178245 ?auto_178248 ) ) ( not ( = ?auto_178250 ?auto_178246 ) ) ( not ( = ?auto_178250 ?auto_178248 ) ) ( not ( = ?auto_178246 ?auto_178248 ) ) ( not ( = ?auto_178247 ?auto_178251 ) ) ( not ( = ?auto_178247 ?auto_178249 ) ) ( not ( = ?auto_178247 ?auto_178248 ) ) ( not ( = ?auto_178251 ?auto_178249 ) ) ( not ( = ?auto_178251 ?auto_178248 ) ) ( not ( = ?auto_178249 ?auto_178248 ) ) ( not ( = ?auto_178244 ?auto_178249 ) ) ( not ( = ?auto_178244 ?auto_178247 ) ) ( not ( = ?auto_178244 ?auto_178251 ) ) ( not ( = ?auto_178245 ?auto_178249 ) ) ( not ( = ?auto_178245 ?auto_178247 ) ) ( not ( = ?auto_178245 ?auto_178251 ) ) ( not ( = ?auto_178250 ?auto_178249 ) ) ( not ( = ?auto_178250 ?auto_178247 ) ) ( not ( = ?auto_178250 ?auto_178251 ) ) ( not ( = ?auto_178246 ?auto_178249 ) ) ( not ( = ?auto_178246 ?auto_178247 ) ) ( not ( = ?auto_178246 ?auto_178251 ) ) ( ON ?auto_178247 ?auto_178252 ) ( not ( = ?auto_178244 ?auto_178252 ) ) ( not ( = ?auto_178245 ?auto_178252 ) ) ( not ( = ?auto_178250 ?auto_178252 ) ) ( not ( = ?auto_178246 ?auto_178252 ) ) ( not ( = ?auto_178248 ?auto_178252 ) ) ( not ( = ?auto_178247 ?auto_178252 ) ) ( not ( = ?auto_178251 ?auto_178252 ) ) ( not ( = ?auto_178249 ?auto_178252 ) ) ( ON ?auto_178251 ?auto_178247 ) ( ON-TABLE ?auto_178252 ) ( ON ?auto_178249 ?auto_178251 ) ( ON ?auto_178248 ?auto_178249 ) ( ON ?auto_178246 ?auto_178248 ) ( ON ?auto_178250 ?auto_178246 ) ( CLEAR ?auto_178250 ) ( HOLDING ?auto_178245 ) ( CLEAR ?auto_178244 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178244 ?auto_178245 ?auto_178250 )
      ( MAKE-2PILE ?auto_178244 ?auto_178245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178253 - BLOCK
      ?auto_178254 - BLOCK
    )
    :vars
    (
      ?auto_178261 - BLOCK
      ?auto_178258 - BLOCK
      ?auto_178257 - BLOCK
      ?auto_178260 - BLOCK
      ?auto_178255 - BLOCK
      ?auto_178259 - BLOCK
      ?auto_178256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178253 ) ( not ( = ?auto_178253 ?auto_178254 ) ) ( not ( = ?auto_178253 ?auto_178261 ) ) ( not ( = ?auto_178254 ?auto_178261 ) ) ( not ( = ?auto_178253 ?auto_178258 ) ) ( not ( = ?auto_178253 ?auto_178257 ) ) ( not ( = ?auto_178254 ?auto_178258 ) ) ( not ( = ?auto_178254 ?auto_178257 ) ) ( not ( = ?auto_178261 ?auto_178258 ) ) ( not ( = ?auto_178261 ?auto_178257 ) ) ( not ( = ?auto_178258 ?auto_178257 ) ) ( not ( = ?auto_178260 ?auto_178255 ) ) ( not ( = ?auto_178260 ?auto_178259 ) ) ( not ( = ?auto_178260 ?auto_178257 ) ) ( not ( = ?auto_178255 ?auto_178259 ) ) ( not ( = ?auto_178255 ?auto_178257 ) ) ( not ( = ?auto_178259 ?auto_178257 ) ) ( not ( = ?auto_178253 ?auto_178259 ) ) ( not ( = ?auto_178253 ?auto_178260 ) ) ( not ( = ?auto_178253 ?auto_178255 ) ) ( not ( = ?auto_178254 ?auto_178259 ) ) ( not ( = ?auto_178254 ?auto_178260 ) ) ( not ( = ?auto_178254 ?auto_178255 ) ) ( not ( = ?auto_178261 ?auto_178259 ) ) ( not ( = ?auto_178261 ?auto_178260 ) ) ( not ( = ?auto_178261 ?auto_178255 ) ) ( not ( = ?auto_178258 ?auto_178259 ) ) ( not ( = ?auto_178258 ?auto_178260 ) ) ( not ( = ?auto_178258 ?auto_178255 ) ) ( ON ?auto_178260 ?auto_178256 ) ( not ( = ?auto_178253 ?auto_178256 ) ) ( not ( = ?auto_178254 ?auto_178256 ) ) ( not ( = ?auto_178261 ?auto_178256 ) ) ( not ( = ?auto_178258 ?auto_178256 ) ) ( not ( = ?auto_178257 ?auto_178256 ) ) ( not ( = ?auto_178260 ?auto_178256 ) ) ( not ( = ?auto_178255 ?auto_178256 ) ) ( not ( = ?auto_178259 ?auto_178256 ) ) ( ON ?auto_178255 ?auto_178260 ) ( ON-TABLE ?auto_178256 ) ( ON ?auto_178259 ?auto_178255 ) ( ON ?auto_178257 ?auto_178259 ) ( ON ?auto_178258 ?auto_178257 ) ( ON ?auto_178261 ?auto_178258 ) ( CLEAR ?auto_178253 ) ( ON ?auto_178254 ?auto_178261 ) ( CLEAR ?auto_178254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178256 ?auto_178260 ?auto_178255 ?auto_178259 ?auto_178257 ?auto_178258 ?auto_178261 )
      ( MAKE-2PILE ?auto_178253 ?auto_178254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178262 - BLOCK
      ?auto_178263 - BLOCK
    )
    :vars
    (
      ?auto_178269 - BLOCK
      ?auto_178264 - BLOCK
      ?auto_178270 - BLOCK
      ?auto_178266 - BLOCK
      ?auto_178268 - BLOCK
      ?auto_178267 - BLOCK
      ?auto_178265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178262 ?auto_178263 ) ) ( not ( = ?auto_178262 ?auto_178269 ) ) ( not ( = ?auto_178263 ?auto_178269 ) ) ( not ( = ?auto_178262 ?auto_178264 ) ) ( not ( = ?auto_178262 ?auto_178270 ) ) ( not ( = ?auto_178263 ?auto_178264 ) ) ( not ( = ?auto_178263 ?auto_178270 ) ) ( not ( = ?auto_178269 ?auto_178264 ) ) ( not ( = ?auto_178269 ?auto_178270 ) ) ( not ( = ?auto_178264 ?auto_178270 ) ) ( not ( = ?auto_178266 ?auto_178268 ) ) ( not ( = ?auto_178266 ?auto_178267 ) ) ( not ( = ?auto_178266 ?auto_178270 ) ) ( not ( = ?auto_178268 ?auto_178267 ) ) ( not ( = ?auto_178268 ?auto_178270 ) ) ( not ( = ?auto_178267 ?auto_178270 ) ) ( not ( = ?auto_178262 ?auto_178267 ) ) ( not ( = ?auto_178262 ?auto_178266 ) ) ( not ( = ?auto_178262 ?auto_178268 ) ) ( not ( = ?auto_178263 ?auto_178267 ) ) ( not ( = ?auto_178263 ?auto_178266 ) ) ( not ( = ?auto_178263 ?auto_178268 ) ) ( not ( = ?auto_178269 ?auto_178267 ) ) ( not ( = ?auto_178269 ?auto_178266 ) ) ( not ( = ?auto_178269 ?auto_178268 ) ) ( not ( = ?auto_178264 ?auto_178267 ) ) ( not ( = ?auto_178264 ?auto_178266 ) ) ( not ( = ?auto_178264 ?auto_178268 ) ) ( ON ?auto_178266 ?auto_178265 ) ( not ( = ?auto_178262 ?auto_178265 ) ) ( not ( = ?auto_178263 ?auto_178265 ) ) ( not ( = ?auto_178269 ?auto_178265 ) ) ( not ( = ?auto_178264 ?auto_178265 ) ) ( not ( = ?auto_178270 ?auto_178265 ) ) ( not ( = ?auto_178266 ?auto_178265 ) ) ( not ( = ?auto_178268 ?auto_178265 ) ) ( not ( = ?auto_178267 ?auto_178265 ) ) ( ON ?auto_178268 ?auto_178266 ) ( ON-TABLE ?auto_178265 ) ( ON ?auto_178267 ?auto_178268 ) ( ON ?auto_178270 ?auto_178267 ) ( ON ?auto_178264 ?auto_178270 ) ( ON ?auto_178269 ?auto_178264 ) ( ON ?auto_178263 ?auto_178269 ) ( CLEAR ?auto_178263 ) ( HOLDING ?auto_178262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178262 )
      ( MAKE-2PILE ?auto_178262 ?auto_178263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_178271 - BLOCK
      ?auto_178272 - BLOCK
    )
    :vars
    (
      ?auto_178273 - BLOCK
      ?auto_178275 - BLOCK
      ?auto_178276 - BLOCK
      ?auto_178277 - BLOCK
      ?auto_178278 - BLOCK
      ?auto_178274 - BLOCK
      ?auto_178279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178271 ?auto_178272 ) ) ( not ( = ?auto_178271 ?auto_178273 ) ) ( not ( = ?auto_178272 ?auto_178273 ) ) ( not ( = ?auto_178271 ?auto_178275 ) ) ( not ( = ?auto_178271 ?auto_178276 ) ) ( not ( = ?auto_178272 ?auto_178275 ) ) ( not ( = ?auto_178272 ?auto_178276 ) ) ( not ( = ?auto_178273 ?auto_178275 ) ) ( not ( = ?auto_178273 ?auto_178276 ) ) ( not ( = ?auto_178275 ?auto_178276 ) ) ( not ( = ?auto_178277 ?auto_178278 ) ) ( not ( = ?auto_178277 ?auto_178274 ) ) ( not ( = ?auto_178277 ?auto_178276 ) ) ( not ( = ?auto_178278 ?auto_178274 ) ) ( not ( = ?auto_178278 ?auto_178276 ) ) ( not ( = ?auto_178274 ?auto_178276 ) ) ( not ( = ?auto_178271 ?auto_178274 ) ) ( not ( = ?auto_178271 ?auto_178277 ) ) ( not ( = ?auto_178271 ?auto_178278 ) ) ( not ( = ?auto_178272 ?auto_178274 ) ) ( not ( = ?auto_178272 ?auto_178277 ) ) ( not ( = ?auto_178272 ?auto_178278 ) ) ( not ( = ?auto_178273 ?auto_178274 ) ) ( not ( = ?auto_178273 ?auto_178277 ) ) ( not ( = ?auto_178273 ?auto_178278 ) ) ( not ( = ?auto_178275 ?auto_178274 ) ) ( not ( = ?auto_178275 ?auto_178277 ) ) ( not ( = ?auto_178275 ?auto_178278 ) ) ( ON ?auto_178277 ?auto_178279 ) ( not ( = ?auto_178271 ?auto_178279 ) ) ( not ( = ?auto_178272 ?auto_178279 ) ) ( not ( = ?auto_178273 ?auto_178279 ) ) ( not ( = ?auto_178275 ?auto_178279 ) ) ( not ( = ?auto_178276 ?auto_178279 ) ) ( not ( = ?auto_178277 ?auto_178279 ) ) ( not ( = ?auto_178278 ?auto_178279 ) ) ( not ( = ?auto_178274 ?auto_178279 ) ) ( ON ?auto_178278 ?auto_178277 ) ( ON-TABLE ?auto_178279 ) ( ON ?auto_178274 ?auto_178278 ) ( ON ?auto_178276 ?auto_178274 ) ( ON ?auto_178275 ?auto_178276 ) ( ON ?auto_178273 ?auto_178275 ) ( ON ?auto_178272 ?auto_178273 ) ( ON ?auto_178271 ?auto_178272 ) ( CLEAR ?auto_178271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178279 ?auto_178277 ?auto_178278 ?auto_178274 ?auto_178276 ?auto_178275 ?auto_178273 ?auto_178272 )
      ( MAKE-2PILE ?auto_178271 ?auto_178272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178286 - BLOCK
      ?auto_178287 - BLOCK
      ?auto_178288 - BLOCK
      ?auto_178289 - BLOCK
      ?auto_178290 - BLOCK
      ?auto_178291 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_178291 ) ( CLEAR ?auto_178290 ) ( ON-TABLE ?auto_178286 ) ( ON ?auto_178287 ?auto_178286 ) ( ON ?auto_178288 ?auto_178287 ) ( ON ?auto_178289 ?auto_178288 ) ( ON ?auto_178290 ?auto_178289 ) ( not ( = ?auto_178286 ?auto_178287 ) ) ( not ( = ?auto_178286 ?auto_178288 ) ) ( not ( = ?auto_178286 ?auto_178289 ) ) ( not ( = ?auto_178286 ?auto_178290 ) ) ( not ( = ?auto_178286 ?auto_178291 ) ) ( not ( = ?auto_178287 ?auto_178288 ) ) ( not ( = ?auto_178287 ?auto_178289 ) ) ( not ( = ?auto_178287 ?auto_178290 ) ) ( not ( = ?auto_178287 ?auto_178291 ) ) ( not ( = ?auto_178288 ?auto_178289 ) ) ( not ( = ?auto_178288 ?auto_178290 ) ) ( not ( = ?auto_178288 ?auto_178291 ) ) ( not ( = ?auto_178289 ?auto_178290 ) ) ( not ( = ?auto_178289 ?auto_178291 ) ) ( not ( = ?auto_178290 ?auto_178291 ) ) )
    :subtasks
    ( ( !STACK ?auto_178291 ?auto_178290 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178292 - BLOCK
      ?auto_178293 - BLOCK
      ?auto_178294 - BLOCK
      ?auto_178295 - BLOCK
      ?auto_178296 - BLOCK
      ?auto_178297 - BLOCK
    )
    :vars
    (
      ?auto_178298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_178296 ) ( ON-TABLE ?auto_178292 ) ( ON ?auto_178293 ?auto_178292 ) ( ON ?auto_178294 ?auto_178293 ) ( ON ?auto_178295 ?auto_178294 ) ( ON ?auto_178296 ?auto_178295 ) ( not ( = ?auto_178292 ?auto_178293 ) ) ( not ( = ?auto_178292 ?auto_178294 ) ) ( not ( = ?auto_178292 ?auto_178295 ) ) ( not ( = ?auto_178292 ?auto_178296 ) ) ( not ( = ?auto_178292 ?auto_178297 ) ) ( not ( = ?auto_178293 ?auto_178294 ) ) ( not ( = ?auto_178293 ?auto_178295 ) ) ( not ( = ?auto_178293 ?auto_178296 ) ) ( not ( = ?auto_178293 ?auto_178297 ) ) ( not ( = ?auto_178294 ?auto_178295 ) ) ( not ( = ?auto_178294 ?auto_178296 ) ) ( not ( = ?auto_178294 ?auto_178297 ) ) ( not ( = ?auto_178295 ?auto_178296 ) ) ( not ( = ?auto_178295 ?auto_178297 ) ) ( not ( = ?auto_178296 ?auto_178297 ) ) ( ON ?auto_178297 ?auto_178298 ) ( CLEAR ?auto_178297 ) ( HAND-EMPTY ) ( not ( = ?auto_178292 ?auto_178298 ) ) ( not ( = ?auto_178293 ?auto_178298 ) ) ( not ( = ?auto_178294 ?auto_178298 ) ) ( not ( = ?auto_178295 ?auto_178298 ) ) ( not ( = ?auto_178296 ?auto_178298 ) ) ( not ( = ?auto_178297 ?auto_178298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178297 ?auto_178298 )
      ( MAKE-6PILE ?auto_178292 ?auto_178293 ?auto_178294 ?auto_178295 ?auto_178296 ?auto_178297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178299 - BLOCK
      ?auto_178300 - BLOCK
      ?auto_178301 - BLOCK
      ?auto_178302 - BLOCK
      ?auto_178303 - BLOCK
      ?auto_178304 - BLOCK
    )
    :vars
    (
      ?auto_178305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178299 ) ( ON ?auto_178300 ?auto_178299 ) ( ON ?auto_178301 ?auto_178300 ) ( ON ?auto_178302 ?auto_178301 ) ( not ( = ?auto_178299 ?auto_178300 ) ) ( not ( = ?auto_178299 ?auto_178301 ) ) ( not ( = ?auto_178299 ?auto_178302 ) ) ( not ( = ?auto_178299 ?auto_178303 ) ) ( not ( = ?auto_178299 ?auto_178304 ) ) ( not ( = ?auto_178300 ?auto_178301 ) ) ( not ( = ?auto_178300 ?auto_178302 ) ) ( not ( = ?auto_178300 ?auto_178303 ) ) ( not ( = ?auto_178300 ?auto_178304 ) ) ( not ( = ?auto_178301 ?auto_178302 ) ) ( not ( = ?auto_178301 ?auto_178303 ) ) ( not ( = ?auto_178301 ?auto_178304 ) ) ( not ( = ?auto_178302 ?auto_178303 ) ) ( not ( = ?auto_178302 ?auto_178304 ) ) ( not ( = ?auto_178303 ?auto_178304 ) ) ( ON ?auto_178304 ?auto_178305 ) ( CLEAR ?auto_178304 ) ( not ( = ?auto_178299 ?auto_178305 ) ) ( not ( = ?auto_178300 ?auto_178305 ) ) ( not ( = ?auto_178301 ?auto_178305 ) ) ( not ( = ?auto_178302 ?auto_178305 ) ) ( not ( = ?auto_178303 ?auto_178305 ) ) ( not ( = ?auto_178304 ?auto_178305 ) ) ( HOLDING ?auto_178303 ) ( CLEAR ?auto_178302 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178299 ?auto_178300 ?auto_178301 ?auto_178302 ?auto_178303 )
      ( MAKE-6PILE ?auto_178299 ?auto_178300 ?auto_178301 ?auto_178302 ?auto_178303 ?auto_178304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178306 - BLOCK
      ?auto_178307 - BLOCK
      ?auto_178308 - BLOCK
      ?auto_178309 - BLOCK
      ?auto_178310 - BLOCK
      ?auto_178311 - BLOCK
    )
    :vars
    (
      ?auto_178312 - BLOCK
      ?auto_178313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178306 ) ( ON ?auto_178307 ?auto_178306 ) ( ON ?auto_178308 ?auto_178307 ) ( ON ?auto_178309 ?auto_178308 ) ( not ( = ?auto_178306 ?auto_178307 ) ) ( not ( = ?auto_178306 ?auto_178308 ) ) ( not ( = ?auto_178306 ?auto_178309 ) ) ( not ( = ?auto_178306 ?auto_178310 ) ) ( not ( = ?auto_178306 ?auto_178311 ) ) ( not ( = ?auto_178307 ?auto_178308 ) ) ( not ( = ?auto_178307 ?auto_178309 ) ) ( not ( = ?auto_178307 ?auto_178310 ) ) ( not ( = ?auto_178307 ?auto_178311 ) ) ( not ( = ?auto_178308 ?auto_178309 ) ) ( not ( = ?auto_178308 ?auto_178310 ) ) ( not ( = ?auto_178308 ?auto_178311 ) ) ( not ( = ?auto_178309 ?auto_178310 ) ) ( not ( = ?auto_178309 ?auto_178311 ) ) ( not ( = ?auto_178310 ?auto_178311 ) ) ( ON ?auto_178311 ?auto_178312 ) ( not ( = ?auto_178306 ?auto_178312 ) ) ( not ( = ?auto_178307 ?auto_178312 ) ) ( not ( = ?auto_178308 ?auto_178312 ) ) ( not ( = ?auto_178309 ?auto_178312 ) ) ( not ( = ?auto_178310 ?auto_178312 ) ) ( not ( = ?auto_178311 ?auto_178312 ) ) ( CLEAR ?auto_178309 ) ( ON ?auto_178310 ?auto_178311 ) ( CLEAR ?auto_178310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178313 ) ( ON ?auto_178312 ?auto_178313 ) ( not ( = ?auto_178313 ?auto_178312 ) ) ( not ( = ?auto_178313 ?auto_178311 ) ) ( not ( = ?auto_178313 ?auto_178310 ) ) ( not ( = ?auto_178306 ?auto_178313 ) ) ( not ( = ?auto_178307 ?auto_178313 ) ) ( not ( = ?auto_178308 ?auto_178313 ) ) ( not ( = ?auto_178309 ?auto_178313 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178313 ?auto_178312 ?auto_178311 )
      ( MAKE-6PILE ?auto_178306 ?auto_178307 ?auto_178308 ?auto_178309 ?auto_178310 ?auto_178311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178314 - BLOCK
      ?auto_178315 - BLOCK
      ?auto_178316 - BLOCK
      ?auto_178317 - BLOCK
      ?auto_178318 - BLOCK
      ?auto_178319 - BLOCK
    )
    :vars
    (
      ?auto_178321 - BLOCK
      ?auto_178320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178314 ) ( ON ?auto_178315 ?auto_178314 ) ( ON ?auto_178316 ?auto_178315 ) ( not ( = ?auto_178314 ?auto_178315 ) ) ( not ( = ?auto_178314 ?auto_178316 ) ) ( not ( = ?auto_178314 ?auto_178317 ) ) ( not ( = ?auto_178314 ?auto_178318 ) ) ( not ( = ?auto_178314 ?auto_178319 ) ) ( not ( = ?auto_178315 ?auto_178316 ) ) ( not ( = ?auto_178315 ?auto_178317 ) ) ( not ( = ?auto_178315 ?auto_178318 ) ) ( not ( = ?auto_178315 ?auto_178319 ) ) ( not ( = ?auto_178316 ?auto_178317 ) ) ( not ( = ?auto_178316 ?auto_178318 ) ) ( not ( = ?auto_178316 ?auto_178319 ) ) ( not ( = ?auto_178317 ?auto_178318 ) ) ( not ( = ?auto_178317 ?auto_178319 ) ) ( not ( = ?auto_178318 ?auto_178319 ) ) ( ON ?auto_178319 ?auto_178321 ) ( not ( = ?auto_178314 ?auto_178321 ) ) ( not ( = ?auto_178315 ?auto_178321 ) ) ( not ( = ?auto_178316 ?auto_178321 ) ) ( not ( = ?auto_178317 ?auto_178321 ) ) ( not ( = ?auto_178318 ?auto_178321 ) ) ( not ( = ?auto_178319 ?auto_178321 ) ) ( ON ?auto_178318 ?auto_178319 ) ( CLEAR ?auto_178318 ) ( ON-TABLE ?auto_178320 ) ( ON ?auto_178321 ?auto_178320 ) ( not ( = ?auto_178320 ?auto_178321 ) ) ( not ( = ?auto_178320 ?auto_178319 ) ) ( not ( = ?auto_178320 ?auto_178318 ) ) ( not ( = ?auto_178314 ?auto_178320 ) ) ( not ( = ?auto_178315 ?auto_178320 ) ) ( not ( = ?auto_178316 ?auto_178320 ) ) ( not ( = ?auto_178317 ?auto_178320 ) ) ( HOLDING ?auto_178317 ) ( CLEAR ?auto_178316 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178314 ?auto_178315 ?auto_178316 ?auto_178317 )
      ( MAKE-6PILE ?auto_178314 ?auto_178315 ?auto_178316 ?auto_178317 ?auto_178318 ?auto_178319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178322 - BLOCK
      ?auto_178323 - BLOCK
      ?auto_178324 - BLOCK
      ?auto_178325 - BLOCK
      ?auto_178326 - BLOCK
      ?auto_178327 - BLOCK
    )
    :vars
    (
      ?auto_178329 - BLOCK
      ?auto_178328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178322 ) ( ON ?auto_178323 ?auto_178322 ) ( ON ?auto_178324 ?auto_178323 ) ( not ( = ?auto_178322 ?auto_178323 ) ) ( not ( = ?auto_178322 ?auto_178324 ) ) ( not ( = ?auto_178322 ?auto_178325 ) ) ( not ( = ?auto_178322 ?auto_178326 ) ) ( not ( = ?auto_178322 ?auto_178327 ) ) ( not ( = ?auto_178323 ?auto_178324 ) ) ( not ( = ?auto_178323 ?auto_178325 ) ) ( not ( = ?auto_178323 ?auto_178326 ) ) ( not ( = ?auto_178323 ?auto_178327 ) ) ( not ( = ?auto_178324 ?auto_178325 ) ) ( not ( = ?auto_178324 ?auto_178326 ) ) ( not ( = ?auto_178324 ?auto_178327 ) ) ( not ( = ?auto_178325 ?auto_178326 ) ) ( not ( = ?auto_178325 ?auto_178327 ) ) ( not ( = ?auto_178326 ?auto_178327 ) ) ( ON ?auto_178327 ?auto_178329 ) ( not ( = ?auto_178322 ?auto_178329 ) ) ( not ( = ?auto_178323 ?auto_178329 ) ) ( not ( = ?auto_178324 ?auto_178329 ) ) ( not ( = ?auto_178325 ?auto_178329 ) ) ( not ( = ?auto_178326 ?auto_178329 ) ) ( not ( = ?auto_178327 ?auto_178329 ) ) ( ON ?auto_178326 ?auto_178327 ) ( ON-TABLE ?auto_178328 ) ( ON ?auto_178329 ?auto_178328 ) ( not ( = ?auto_178328 ?auto_178329 ) ) ( not ( = ?auto_178328 ?auto_178327 ) ) ( not ( = ?auto_178328 ?auto_178326 ) ) ( not ( = ?auto_178322 ?auto_178328 ) ) ( not ( = ?auto_178323 ?auto_178328 ) ) ( not ( = ?auto_178324 ?auto_178328 ) ) ( not ( = ?auto_178325 ?auto_178328 ) ) ( CLEAR ?auto_178324 ) ( ON ?auto_178325 ?auto_178326 ) ( CLEAR ?auto_178325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178328 ?auto_178329 ?auto_178327 ?auto_178326 )
      ( MAKE-6PILE ?auto_178322 ?auto_178323 ?auto_178324 ?auto_178325 ?auto_178326 ?auto_178327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178330 - BLOCK
      ?auto_178331 - BLOCK
      ?auto_178332 - BLOCK
      ?auto_178333 - BLOCK
      ?auto_178334 - BLOCK
      ?auto_178335 - BLOCK
    )
    :vars
    (
      ?auto_178336 - BLOCK
      ?auto_178337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178330 ) ( ON ?auto_178331 ?auto_178330 ) ( not ( = ?auto_178330 ?auto_178331 ) ) ( not ( = ?auto_178330 ?auto_178332 ) ) ( not ( = ?auto_178330 ?auto_178333 ) ) ( not ( = ?auto_178330 ?auto_178334 ) ) ( not ( = ?auto_178330 ?auto_178335 ) ) ( not ( = ?auto_178331 ?auto_178332 ) ) ( not ( = ?auto_178331 ?auto_178333 ) ) ( not ( = ?auto_178331 ?auto_178334 ) ) ( not ( = ?auto_178331 ?auto_178335 ) ) ( not ( = ?auto_178332 ?auto_178333 ) ) ( not ( = ?auto_178332 ?auto_178334 ) ) ( not ( = ?auto_178332 ?auto_178335 ) ) ( not ( = ?auto_178333 ?auto_178334 ) ) ( not ( = ?auto_178333 ?auto_178335 ) ) ( not ( = ?auto_178334 ?auto_178335 ) ) ( ON ?auto_178335 ?auto_178336 ) ( not ( = ?auto_178330 ?auto_178336 ) ) ( not ( = ?auto_178331 ?auto_178336 ) ) ( not ( = ?auto_178332 ?auto_178336 ) ) ( not ( = ?auto_178333 ?auto_178336 ) ) ( not ( = ?auto_178334 ?auto_178336 ) ) ( not ( = ?auto_178335 ?auto_178336 ) ) ( ON ?auto_178334 ?auto_178335 ) ( ON-TABLE ?auto_178337 ) ( ON ?auto_178336 ?auto_178337 ) ( not ( = ?auto_178337 ?auto_178336 ) ) ( not ( = ?auto_178337 ?auto_178335 ) ) ( not ( = ?auto_178337 ?auto_178334 ) ) ( not ( = ?auto_178330 ?auto_178337 ) ) ( not ( = ?auto_178331 ?auto_178337 ) ) ( not ( = ?auto_178332 ?auto_178337 ) ) ( not ( = ?auto_178333 ?auto_178337 ) ) ( ON ?auto_178333 ?auto_178334 ) ( CLEAR ?auto_178333 ) ( HOLDING ?auto_178332 ) ( CLEAR ?auto_178331 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178330 ?auto_178331 ?auto_178332 )
      ( MAKE-6PILE ?auto_178330 ?auto_178331 ?auto_178332 ?auto_178333 ?auto_178334 ?auto_178335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178338 - BLOCK
      ?auto_178339 - BLOCK
      ?auto_178340 - BLOCK
      ?auto_178341 - BLOCK
      ?auto_178342 - BLOCK
      ?auto_178343 - BLOCK
    )
    :vars
    (
      ?auto_178345 - BLOCK
      ?auto_178344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178338 ) ( ON ?auto_178339 ?auto_178338 ) ( not ( = ?auto_178338 ?auto_178339 ) ) ( not ( = ?auto_178338 ?auto_178340 ) ) ( not ( = ?auto_178338 ?auto_178341 ) ) ( not ( = ?auto_178338 ?auto_178342 ) ) ( not ( = ?auto_178338 ?auto_178343 ) ) ( not ( = ?auto_178339 ?auto_178340 ) ) ( not ( = ?auto_178339 ?auto_178341 ) ) ( not ( = ?auto_178339 ?auto_178342 ) ) ( not ( = ?auto_178339 ?auto_178343 ) ) ( not ( = ?auto_178340 ?auto_178341 ) ) ( not ( = ?auto_178340 ?auto_178342 ) ) ( not ( = ?auto_178340 ?auto_178343 ) ) ( not ( = ?auto_178341 ?auto_178342 ) ) ( not ( = ?auto_178341 ?auto_178343 ) ) ( not ( = ?auto_178342 ?auto_178343 ) ) ( ON ?auto_178343 ?auto_178345 ) ( not ( = ?auto_178338 ?auto_178345 ) ) ( not ( = ?auto_178339 ?auto_178345 ) ) ( not ( = ?auto_178340 ?auto_178345 ) ) ( not ( = ?auto_178341 ?auto_178345 ) ) ( not ( = ?auto_178342 ?auto_178345 ) ) ( not ( = ?auto_178343 ?auto_178345 ) ) ( ON ?auto_178342 ?auto_178343 ) ( ON-TABLE ?auto_178344 ) ( ON ?auto_178345 ?auto_178344 ) ( not ( = ?auto_178344 ?auto_178345 ) ) ( not ( = ?auto_178344 ?auto_178343 ) ) ( not ( = ?auto_178344 ?auto_178342 ) ) ( not ( = ?auto_178338 ?auto_178344 ) ) ( not ( = ?auto_178339 ?auto_178344 ) ) ( not ( = ?auto_178340 ?auto_178344 ) ) ( not ( = ?auto_178341 ?auto_178344 ) ) ( ON ?auto_178341 ?auto_178342 ) ( CLEAR ?auto_178339 ) ( ON ?auto_178340 ?auto_178341 ) ( CLEAR ?auto_178340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178344 ?auto_178345 ?auto_178343 ?auto_178342 ?auto_178341 )
      ( MAKE-6PILE ?auto_178338 ?auto_178339 ?auto_178340 ?auto_178341 ?auto_178342 ?auto_178343 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178346 - BLOCK
      ?auto_178347 - BLOCK
      ?auto_178348 - BLOCK
      ?auto_178349 - BLOCK
      ?auto_178350 - BLOCK
      ?auto_178351 - BLOCK
    )
    :vars
    (
      ?auto_178353 - BLOCK
      ?auto_178352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178346 ) ( not ( = ?auto_178346 ?auto_178347 ) ) ( not ( = ?auto_178346 ?auto_178348 ) ) ( not ( = ?auto_178346 ?auto_178349 ) ) ( not ( = ?auto_178346 ?auto_178350 ) ) ( not ( = ?auto_178346 ?auto_178351 ) ) ( not ( = ?auto_178347 ?auto_178348 ) ) ( not ( = ?auto_178347 ?auto_178349 ) ) ( not ( = ?auto_178347 ?auto_178350 ) ) ( not ( = ?auto_178347 ?auto_178351 ) ) ( not ( = ?auto_178348 ?auto_178349 ) ) ( not ( = ?auto_178348 ?auto_178350 ) ) ( not ( = ?auto_178348 ?auto_178351 ) ) ( not ( = ?auto_178349 ?auto_178350 ) ) ( not ( = ?auto_178349 ?auto_178351 ) ) ( not ( = ?auto_178350 ?auto_178351 ) ) ( ON ?auto_178351 ?auto_178353 ) ( not ( = ?auto_178346 ?auto_178353 ) ) ( not ( = ?auto_178347 ?auto_178353 ) ) ( not ( = ?auto_178348 ?auto_178353 ) ) ( not ( = ?auto_178349 ?auto_178353 ) ) ( not ( = ?auto_178350 ?auto_178353 ) ) ( not ( = ?auto_178351 ?auto_178353 ) ) ( ON ?auto_178350 ?auto_178351 ) ( ON-TABLE ?auto_178352 ) ( ON ?auto_178353 ?auto_178352 ) ( not ( = ?auto_178352 ?auto_178353 ) ) ( not ( = ?auto_178352 ?auto_178351 ) ) ( not ( = ?auto_178352 ?auto_178350 ) ) ( not ( = ?auto_178346 ?auto_178352 ) ) ( not ( = ?auto_178347 ?auto_178352 ) ) ( not ( = ?auto_178348 ?auto_178352 ) ) ( not ( = ?auto_178349 ?auto_178352 ) ) ( ON ?auto_178349 ?auto_178350 ) ( ON ?auto_178348 ?auto_178349 ) ( CLEAR ?auto_178348 ) ( HOLDING ?auto_178347 ) ( CLEAR ?auto_178346 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178346 ?auto_178347 )
      ( MAKE-6PILE ?auto_178346 ?auto_178347 ?auto_178348 ?auto_178349 ?auto_178350 ?auto_178351 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178354 - BLOCK
      ?auto_178355 - BLOCK
      ?auto_178356 - BLOCK
      ?auto_178357 - BLOCK
      ?auto_178358 - BLOCK
      ?auto_178359 - BLOCK
    )
    :vars
    (
      ?auto_178360 - BLOCK
      ?auto_178361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178354 ) ( not ( = ?auto_178354 ?auto_178355 ) ) ( not ( = ?auto_178354 ?auto_178356 ) ) ( not ( = ?auto_178354 ?auto_178357 ) ) ( not ( = ?auto_178354 ?auto_178358 ) ) ( not ( = ?auto_178354 ?auto_178359 ) ) ( not ( = ?auto_178355 ?auto_178356 ) ) ( not ( = ?auto_178355 ?auto_178357 ) ) ( not ( = ?auto_178355 ?auto_178358 ) ) ( not ( = ?auto_178355 ?auto_178359 ) ) ( not ( = ?auto_178356 ?auto_178357 ) ) ( not ( = ?auto_178356 ?auto_178358 ) ) ( not ( = ?auto_178356 ?auto_178359 ) ) ( not ( = ?auto_178357 ?auto_178358 ) ) ( not ( = ?auto_178357 ?auto_178359 ) ) ( not ( = ?auto_178358 ?auto_178359 ) ) ( ON ?auto_178359 ?auto_178360 ) ( not ( = ?auto_178354 ?auto_178360 ) ) ( not ( = ?auto_178355 ?auto_178360 ) ) ( not ( = ?auto_178356 ?auto_178360 ) ) ( not ( = ?auto_178357 ?auto_178360 ) ) ( not ( = ?auto_178358 ?auto_178360 ) ) ( not ( = ?auto_178359 ?auto_178360 ) ) ( ON ?auto_178358 ?auto_178359 ) ( ON-TABLE ?auto_178361 ) ( ON ?auto_178360 ?auto_178361 ) ( not ( = ?auto_178361 ?auto_178360 ) ) ( not ( = ?auto_178361 ?auto_178359 ) ) ( not ( = ?auto_178361 ?auto_178358 ) ) ( not ( = ?auto_178354 ?auto_178361 ) ) ( not ( = ?auto_178355 ?auto_178361 ) ) ( not ( = ?auto_178356 ?auto_178361 ) ) ( not ( = ?auto_178357 ?auto_178361 ) ) ( ON ?auto_178357 ?auto_178358 ) ( ON ?auto_178356 ?auto_178357 ) ( CLEAR ?auto_178354 ) ( ON ?auto_178355 ?auto_178356 ) ( CLEAR ?auto_178355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178361 ?auto_178360 ?auto_178359 ?auto_178358 ?auto_178357 ?auto_178356 )
      ( MAKE-6PILE ?auto_178354 ?auto_178355 ?auto_178356 ?auto_178357 ?auto_178358 ?auto_178359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178362 - BLOCK
      ?auto_178363 - BLOCK
      ?auto_178364 - BLOCK
      ?auto_178365 - BLOCK
      ?auto_178366 - BLOCK
      ?auto_178367 - BLOCK
    )
    :vars
    (
      ?auto_178368 - BLOCK
      ?auto_178369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178362 ?auto_178363 ) ) ( not ( = ?auto_178362 ?auto_178364 ) ) ( not ( = ?auto_178362 ?auto_178365 ) ) ( not ( = ?auto_178362 ?auto_178366 ) ) ( not ( = ?auto_178362 ?auto_178367 ) ) ( not ( = ?auto_178363 ?auto_178364 ) ) ( not ( = ?auto_178363 ?auto_178365 ) ) ( not ( = ?auto_178363 ?auto_178366 ) ) ( not ( = ?auto_178363 ?auto_178367 ) ) ( not ( = ?auto_178364 ?auto_178365 ) ) ( not ( = ?auto_178364 ?auto_178366 ) ) ( not ( = ?auto_178364 ?auto_178367 ) ) ( not ( = ?auto_178365 ?auto_178366 ) ) ( not ( = ?auto_178365 ?auto_178367 ) ) ( not ( = ?auto_178366 ?auto_178367 ) ) ( ON ?auto_178367 ?auto_178368 ) ( not ( = ?auto_178362 ?auto_178368 ) ) ( not ( = ?auto_178363 ?auto_178368 ) ) ( not ( = ?auto_178364 ?auto_178368 ) ) ( not ( = ?auto_178365 ?auto_178368 ) ) ( not ( = ?auto_178366 ?auto_178368 ) ) ( not ( = ?auto_178367 ?auto_178368 ) ) ( ON ?auto_178366 ?auto_178367 ) ( ON-TABLE ?auto_178369 ) ( ON ?auto_178368 ?auto_178369 ) ( not ( = ?auto_178369 ?auto_178368 ) ) ( not ( = ?auto_178369 ?auto_178367 ) ) ( not ( = ?auto_178369 ?auto_178366 ) ) ( not ( = ?auto_178362 ?auto_178369 ) ) ( not ( = ?auto_178363 ?auto_178369 ) ) ( not ( = ?auto_178364 ?auto_178369 ) ) ( not ( = ?auto_178365 ?auto_178369 ) ) ( ON ?auto_178365 ?auto_178366 ) ( ON ?auto_178364 ?auto_178365 ) ( ON ?auto_178363 ?auto_178364 ) ( CLEAR ?auto_178363 ) ( HOLDING ?auto_178362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178362 )
      ( MAKE-6PILE ?auto_178362 ?auto_178363 ?auto_178364 ?auto_178365 ?auto_178366 ?auto_178367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178370 - BLOCK
      ?auto_178371 - BLOCK
      ?auto_178372 - BLOCK
      ?auto_178373 - BLOCK
      ?auto_178374 - BLOCK
      ?auto_178375 - BLOCK
    )
    :vars
    (
      ?auto_178376 - BLOCK
      ?auto_178377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178370 ?auto_178371 ) ) ( not ( = ?auto_178370 ?auto_178372 ) ) ( not ( = ?auto_178370 ?auto_178373 ) ) ( not ( = ?auto_178370 ?auto_178374 ) ) ( not ( = ?auto_178370 ?auto_178375 ) ) ( not ( = ?auto_178371 ?auto_178372 ) ) ( not ( = ?auto_178371 ?auto_178373 ) ) ( not ( = ?auto_178371 ?auto_178374 ) ) ( not ( = ?auto_178371 ?auto_178375 ) ) ( not ( = ?auto_178372 ?auto_178373 ) ) ( not ( = ?auto_178372 ?auto_178374 ) ) ( not ( = ?auto_178372 ?auto_178375 ) ) ( not ( = ?auto_178373 ?auto_178374 ) ) ( not ( = ?auto_178373 ?auto_178375 ) ) ( not ( = ?auto_178374 ?auto_178375 ) ) ( ON ?auto_178375 ?auto_178376 ) ( not ( = ?auto_178370 ?auto_178376 ) ) ( not ( = ?auto_178371 ?auto_178376 ) ) ( not ( = ?auto_178372 ?auto_178376 ) ) ( not ( = ?auto_178373 ?auto_178376 ) ) ( not ( = ?auto_178374 ?auto_178376 ) ) ( not ( = ?auto_178375 ?auto_178376 ) ) ( ON ?auto_178374 ?auto_178375 ) ( ON-TABLE ?auto_178377 ) ( ON ?auto_178376 ?auto_178377 ) ( not ( = ?auto_178377 ?auto_178376 ) ) ( not ( = ?auto_178377 ?auto_178375 ) ) ( not ( = ?auto_178377 ?auto_178374 ) ) ( not ( = ?auto_178370 ?auto_178377 ) ) ( not ( = ?auto_178371 ?auto_178377 ) ) ( not ( = ?auto_178372 ?auto_178377 ) ) ( not ( = ?auto_178373 ?auto_178377 ) ) ( ON ?auto_178373 ?auto_178374 ) ( ON ?auto_178372 ?auto_178373 ) ( ON ?auto_178371 ?auto_178372 ) ( ON ?auto_178370 ?auto_178371 ) ( CLEAR ?auto_178370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178377 ?auto_178376 ?auto_178375 ?auto_178374 ?auto_178373 ?auto_178372 ?auto_178371 )
      ( MAKE-6PILE ?auto_178370 ?auto_178371 ?auto_178372 ?auto_178373 ?auto_178374 ?auto_178375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178378 - BLOCK
      ?auto_178379 - BLOCK
      ?auto_178380 - BLOCK
      ?auto_178381 - BLOCK
      ?auto_178382 - BLOCK
      ?auto_178383 - BLOCK
    )
    :vars
    (
      ?auto_178384 - BLOCK
      ?auto_178385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178378 ?auto_178379 ) ) ( not ( = ?auto_178378 ?auto_178380 ) ) ( not ( = ?auto_178378 ?auto_178381 ) ) ( not ( = ?auto_178378 ?auto_178382 ) ) ( not ( = ?auto_178378 ?auto_178383 ) ) ( not ( = ?auto_178379 ?auto_178380 ) ) ( not ( = ?auto_178379 ?auto_178381 ) ) ( not ( = ?auto_178379 ?auto_178382 ) ) ( not ( = ?auto_178379 ?auto_178383 ) ) ( not ( = ?auto_178380 ?auto_178381 ) ) ( not ( = ?auto_178380 ?auto_178382 ) ) ( not ( = ?auto_178380 ?auto_178383 ) ) ( not ( = ?auto_178381 ?auto_178382 ) ) ( not ( = ?auto_178381 ?auto_178383 ) ) ( not ( = ?auto_178382 ?auto_178383 ) ) ( ON ?auto_178383 ?auto_178384 ) ( not ( = ?auto_178378 ?auto_178384 ) ) ( not ( = ?auto_178379 ?auto_178384 ) ) ( not ( = ?auto_178380 ?auto_178384 ) ) ( not ( = ?auto_178381 ?auto_178384 ) ) ( not ( = ?auto_178382 ?auto_178384 ) ) ( not ( = ?auto_178383 ?auto_178384 ) ) ( ON ?auto_178382 ?auto_178383 ) ( ON-TABLE ?auto_178385 ) ( ON ?auto_178384 ?auto_178385 ) ( not ( = ?auto_178385 ?auto_178384 ) ) ( not ( = ?auto_178385 ?auto_178383 ) ) ( not ( = ?auto_178385 ?auto_178382 ) ) ( not ( = ?auto_178378 ?auto_178385 ) ) ( not ( = ?auto_178379 ?auto_178385 ) ) ( not ( = ?auto_178380 ?auto_178385 ) ) ( not ( = ?auto_178381 ?auto_178385 ) ) ( ON ?auto_178381 ?auto_178382 ) ( ON ?auto_178380 ?auto_178381 ) ( ON ?auto_178379 ?auto_178380 ) ( HOLDING ?auto_178378 ) ( CLEAR ?auto_178379 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178385 ?auto_178384 ?auto_178383 ?auto_178382 ?auto_178381 ?auto_178380 ?auto_178379 ?auto_178378 )
      ( MAKE-6PILE ?auto_178378 ?auto_178379 ?auto_178380 ?auto_178381 ?auto_178382 ?auto_178383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178386 - BLOCK
      ?auto_178387 - BLOCK
      ?auto_178388 - BLOCK
      ?auto_178389 - BLOCK
      ?auto_178390 - BLOCK
      ?auto_178391 - BLOCK
    )
    :vars
    (
      ?auto_178393 - BLOCK
      ?auto_178392 - BLOCK
      ?auto_178394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178386 ?auto_178387 ) ) ( not ( = ?auto_178386 ?auto_178388 ) ) ( not ( = ?auto_178386 ?auto_178389 ) ) ( not ( = ?auto_178386 ?auto_178390 ) ) ( not ( = ?auto_178386 ?auto_178391 ) ) ( not ( = ?auto_178387 ?auto_178388 ) ) ( not ( = ?auto_178387 ?auto_178389 ) ) ( not ( = ?auto_178387 ?auto_178390 ) ) ( not ( = ?auto_178387 ?auto_178391 ) ) ( not ( = ?auto_178388 ?auto_178389 ) ) ( not ( = ?auto_178388 ?auto_178390 ) ) ( not ( = ?auto_178388 ?auto_178391 ) ) ( not ( = ?auto_178389 ?auto_178390 ) ) ( not ( = ?auto_178389 ?auto_178391 ) ) ( not ( = ?auto_178390 ?auto_178391 ) ) ( ON ?auto_178391 ?auto_178393 ) ( not ( = ?auto_178386 ?auto_178393 ) ) ( not ( = ?auto_178387 ?auto_178393 ) ) ( not ( = ?auto_178388 ?auto_178393 ) ) ( not ( = ?auto_178389 ?auto_178393 ) ) ( not ( = ?auto_178390 ?auto_178393 ) ) ( not ( = ?auto_178391 ?auto_178393 ) ) ( ON ?auto_178390 ?auto_178391 ) ( ON-TABLE ?auto_178392 ) ( ON ?auto_178393 ?auto_178392 ) ( not ( = ?auto_178392 ?auto_178393 ) ) ( not ( = ?auto_178392 ?auto_178391 ) ) ( not ( = ?auto_178392 ?auto_178390 ) ) ( not ( = ?auto_178386 ?auto_178392 ) ) ( not ( = ?auto_178387 ?auto_178392 ) ) ( not ( = ?auto_178388 ?auto_178392 ) ) ( not ( = ?auto_178389 ?auto_178392 ) ) ( ON ?auto_178389 ?auto_178390 ) ( ON ?auto_178388 ?auto_178389 ) ( ON ?auto_178387 ?auto_178388 ) ( CLEAR ?auto_178387 ) ( ON ?auto_178386 ?auto_178394 ) ( CLEAR ?auto_178386 ) ( HAND-EMPTY ) ( not ( = ?auto_178386 ?auto_178394 ) ) ( not ( = ?auto_178387 ?auto_178394 ) ) ( not ( = ?auto_178388 ?auto_178394 ) ) ( not ( = ?auto_178389 ?auto_178394 ) ) ( not ( = ?auto_178390 ?auto_178394 ) ) ( not ( = ?auto_178391 ?auto_178394 ) ) ( not ( = ?auto_178393 ?auto_178394 ) ) ( not ( = ?auto_178392 ?auto_178394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178386 ?auto_178394 )
      ( MAKE-6PILE ?auto_178386 ?auto_178387 ?auto_178388 ?auto_178389 ?auto_178390 ?auto_178391 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178395 - BLOCK
      ?auto_178396 - BLOCK
      ?auto_178397 - BLOCK
      ?auto_178398 - BLOCK
      ?auto_178399 - BLOCK
      ?auto_178400 - BLOCK
    )
    :vars
    (
      ?auto_178403 - BLOCK
      ?auto_178402 - BLOCK
      ?auto_178401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178395 ?auto_178396 ) ) ( not ( = ?auto_178395 ?auto_178397 ) ) ( not ( = ?auto_178395 ?auto_178398 ) ) ( not ( = ?auto_178395 ?auto_178399 ) ) ( not ( = ?auto_178395 ?auto_178400 ) ) ( not ( = ?auto_178396 ?auto_178397 ) ) ( not ( = ?auto_178396 ?auto_178398 ) ) ( not ( = ?auto_178396 ?auto_178399 ) ) ( not ( = ?auto_178396 ?auto_178400 ) ) ( not ( = ?auto_178397 ?auto_178398 ) ) ( not ( = ?auto_178397 ?auto_178399 ) ) ( not ( = ?auto_178397 ?auto_178400 ) ) ( not ( = ?auto_178398 ?auto_178399 ) ) ( not ( = ?auto_178398 ?auto_178400 ) ) ( not ( = ?auto_178399 ?auto_178400 ) ) ( ON ?auto_178400 ?auto_178403 ) ( not ( = ?auto_178395 ?auto_178403 ) ) ( not ( = ?auto_178396 ?auto_178403 ) ) ( not ( = ?auto_178397 ?auto_178403 ) ) ( not ( = ?auto_178398 ?auto_178403 ) ) ( not ( = ?auto_178399 ?auto_178403 ) ) ( not ( = ?auto_178400 ?auto_178403 ) ) ( ON ?auto_178399 ?auto_178400 ) ( ON-TABLE ?auto_178402 ) ( ON ?auto_178403 ?auto_178402 ) ( not ( = ?auto_178402 ?auto_178403 ) ) ( not ( = ?auto_178402 ?auto_178400 ) ) ( not ( = ?auto_178402 ?auto_178399 ) ) ( not ( = ?auto_178395 ?auto_178402 ) ) ( not ( = ?auto_178396 ?auto_178402 ) ) ( not ( = ?auto_178397 ?auto_178402 ) ) ( not ( = ?auto_178398 ?auto_178402 ) ) ( ON ?auto_178398 ?auto_178399 ) ( ON ?auto_178397 ?auto_178398 ) ( ON ?auto_178395 ?auto_178401 ) ( CLEAR ?auto_178395 ) ( not ( = ?auto_178395 ?auto_178401 ) ) ( not ( = ?auto_178396 ?auto_178401 ) ) ( not ( = ?auto_178397 ?auto_178401 ) ) ( not ( = ?auto_178398 ?auto_178401 ) ) ( not ( = ?auto_178399 ?auto_178401 ) ) ( not ( = ?auto_178400 ?auto_178401 ) ) ( not ( = ?auto_178403 ?auto_178401 ) ) ( not ( = ?auto_178402 ?auto_178401 ) ) ( HOLDING ?auto_178396 ) ( CLEAR ?auto_178397 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178402 ?auto_178403 ?auto_178400 ?auto_178399 ?auto_178398 ?auto_178397 ?auto_178396 )
      ( MAKE-6PILE ?auto_178395 ?auto_178396 ?auto_178397 ?auto_178398 ?auto_178399 ?auto_178400 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178404 - BLOCK
      ?auto_178405 - BLOCK
      ?auto_178406 - BLOCK
      ?auto_178407 - BLOCK
      ?auto_178408 - BLOCK
      ?auto_178409 - BLOCK
    )
    :vars
    (
      ?auto_178412 - BLOCK
      ?auto_178410 - BLOCK
      ?auto_178411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178404 ?auto_178405 ) ) ( not ( = ?auto_178404 ?auto_178406 ) ) ( not ( = ?auto_178404 ?auto_178407 ) ) ( not ( = ?auto_178404 ?auto_178408 ) ) ( not ( = ?auto_178404 ?auto_178409 ) ) ( not ( = ?auto_178405 ?auto_178406 ) ) ( not ( = ?auto_178405 ?auto_178407 ) ) ( not ( = ?auto_178405 ?auto_178408 ) ) ( not ( = ?auto_178405 ?auto_178409 ) ) ( not ( = ?auto_178406 ?auto_178407 ) ) ( not ( = ?auto_178406 ?auto_178408 ) ) ( not ( = ?auto_178406 ?auto_178409 ) ) ( not ( = ?auto_178407 ?auto_178408 ) ) ( not ( = ?auto_178407 ?auto_178409 ) ) ( not ( = ?auto_178408 ?auto_178409 ) ) ( ON ?auto_178409 ?auto_178412 ) ( not ( = ?auto_178404 ?auto_178412 ) ) ( not ( = ?auto_178405 ?auto_178412 ) ) ( not ( = ?auto_178406 ?auto_178412 ) ) ( not ( = ?auto_178407 ?auto_178412 ) ) ( not ( = ?auto_178408 ?auto_178412 ) ) ( not ( = ?auto_178409 ?auto_178412 ) ) ( ON ?auto_178408 ?auto_178409 ) ( ON-TABLE ?auto_178410 ) ( ON ?auto_178412 ?auto_178410 ) ( not ( = ?auto_178410 ?auto_178412 ) ) ( not ( = ?auto_178410 ?auto_178409 ) ) ( not ( = ?auto_178410 ?auto_178408 ) ) ( not ( = ?auto_178404 ?auto_178410 ) ) ( not ( = ?auto_178405 ?auto_178410 ) ) ( not ( = ?auto_178406 ?auto_178410 ) ) ( not ( = ?auto_178407 ?auto_178410 ) ) ( ON ?auto_178407 ?auto_178408 ) ( ON ?auto_178406 ?auto_178407 ) ( ON ?auto_178404 ?auto_178411 ) ( not ( = ?auto_178404 ?auto_178411 ) ) ( not ( = ?auto_178405 ?auto_178411 ) ) ( not ( = ?auto_178406 ?auto_178411 ) ) ( not ( = ?auto_178407 ?auto_178411 ) ) ( not ( = ?auto_178408 ?auto_178411 ) ) ( not ( = ?auto_178409 ?auto_178411 ) ) ( not ( = ?auto_178412 ?auto_178411 ) ) ( not ( = ?auto_178410 ?auto_178411 ) ) ( CLEAR ?auto_178406 ) ( ON ?auto_178405 ?auto_178404 ) ( CLEAR ?auto_178405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178411 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178411 ?auto_178404 )
      ( MAKE-6PILE ?auto_178404 ?auto_178405 ?auto_178406 ?auto_178407 ?auto_178408 ?auto_178409 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178413 - BLOCK
      ?auto_178414 - BLOCK
      ?auto_178415 - BLOCK
      ?auto_178416 - BLOCK
      ?auto_178417 - BLOCK
      ?auto_178418 - BLOCK
    )
    :vars
    (
      ?auto_178420 - BLOCK
      ?auto_178421 - BLOCK
      ?auto_178419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178413 ?auto_178414 ) ) ( not ( = ?auto_178413 ?auto_178415 ) ) ( not ( = ?auto_178413 ?auto_178416 ) ) ( not ( = ?auto_178413 ?auto_178417 ) ) ( not ( = ?auto_178413 ?auto_178418 ) ) ( not ( = ?auto_178414 ?auto_178415 ) ) ( not ( = ?auto_178414 ?auto_178416 ) ) ( not ( = ?auto_178414 ?auto_178417 ) ) ( not ( = ?auto_178414 ?auto_178418 ) ) ( not ( = ?auto_178415 ?auto_178416 ) ) ( not ( = ?auto_178415 ?auto_178417 ) ) ( not ( = ?auto_178415 ?auto_178418 ) ) ( not ( = ?auto_178416 ?auto_178417 ) ) ( not ( = ?auto_178416 ?auto_178418 ) ) ( not ( = ?auto_178417 ?auto_178418 ) ) ( ON ?auto_178418 ?auto_178420 ) ( not ( = ?auto_178413 ?auto_178420 ) ) ( not ( = ?auto_178414 ?auto_178420 ) ) ( not ( = ?auto_178415 ?auto_178420 ) ) ( not ( = ?auto_178416 ?auto_178420 ) ) ( not ( = ?auto_178417 ?auto_178420 ) ) ( not ( = ?auto_178418 ?auto_178420 ) ) ( ON ?auto_178417 ?auto_178418 ) ( ON-TABLE ?auto_178421 ) ( ON ?auto_178420 ?auto_178421 ) ( not ( = ?auto_178421 ?auto_178420 ) ) ( not ( = ?auto_178421 ?auto_178418 ) ) ( not ( = ?auto_178421 ?auto_178417 ) ) ( not ( = ?auto_178413 ?auto_178421 ) ) ( not ( = ?auto_178414 ?auto_178421 ) ) ( not ( = ?auto_178415 ?auto_178421 ) ) ( not ( = ?auto_178416 ?auto_178421 ) ) ( ON ?auto_178416 ?auto_178417 ) ( ON ?auto_178413 ?auto_178419 ) ( not ( = ?auto_178413 ?auto_178419 ) ) ( not ( = ?auto_178414 ?auto_178419 ) ) ( not ( = ?auto_178415 ?auto_178419 ) ) ( not ( = ?auto_178416 ?auto_178419 ) ) ( not ( = ?auto_178417 ?auto_178419 ) ) ( not ( = ?auto_178418 ?auto_178419 ) ) ( not ( = ?auto_178420 ?auto_178419 ) ) ( not ( = ?auto_178421 ?auto_178419 ) ) ( ON ?auto_178414 ?auto_178413 ) ( CLEAR ?auto_178414 ) ( ON-TABLE ?auto_178419 ) ( HOLDING ?auto_178415 ) ( CLEAR ?auto_178416 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178421 ?auto_178420 ?auto_178418 ?auto_178417 ?auto_178416 ?auto_178415 )
      ( MAKE-6PILE ?auto_178413 ?auto_178414 ?auto_178415 ?auto_178416 ?auto_178417 ?auto_178418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178422 - BLOCK
      ?auto_178423 - BLOCK
      ?auto_178424 - BLOCK
      ?auto_178425 - BLOCK
      ?auto_178426 - BLOCK
      ?auto_178427 - BLOCK
    )
    :vars
    (
      ?auto_178429 - BLOCK
      ?auto_178428 - BLOCK
      ?auto_178430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178422 ?auto_178423 ) ) ( not ( = ?auto_178422 ?auto_178424 ) ) ( not ( = ?auto_178422 ?auto_178425 ) ) ( not ( = ?auto_178422 ?auto_178426 ) ) ( not ( = ?auto_178422 ?auto_178427 ) ) ( not ( = ?auto_178423 ?auto_178424 ) ) ( not ( = ?auto_178423 ?auto_178425 ) ) ( not ( = ?auto_178423 ?auto_178426 ) ) ( not ( = ?auto_178423 ?auto_178427 ) ) ( not ( = ?auto_178424 ?auto_178425 ) ) ( not ( = ?auto_178424 ?auto_178426 ) ) ( not ( = ?auto_178424 ?auto_178427 ) ) ( not ( = ?auto_178425 ?auto_178426 ) ) ( not ( = ?auto_178425 ?auto_178427 ) ) ( not ( = ?auto_178426 ?auto_178427 ) ) ( ON ?auto_178427 ?auto_178429 ) ( not ( = ?auto_178422 ?auto_178429 ) ) ( not ( = ?auto_178423 ?auto_178429 ) ) ( not ( = ?auto_178424 ?auto_178429 ) ) ( not ( = ?auto_178425 ?auto_178429 ) ) ( not ( = ?auto_178426 ?auto_178429 ) ) ( not ( = ?auto_178427 ?auto_178429 ) ) ( ON ?auto_178426 ?auto_178427 ) ( ON-TABLE ?auto_178428 ) ( ON ?auto_178429 ?auto_178428 ) ( not ( = ?auto_178428 ?auto_178429 ) ) ( not ( = ?auto_178428 ?auto_178427 ) ) ( not ( = ?auto_178428 ?auto_178426 ) ) ( not ( = ?auto_178422 ?auto_178428 ) ) ( not ( = ?auto_178423 ?auto_178428 ) ) ( not ( = ?auto_178424 ?auto_178428 ) ) ( not ( = ?auto_178425 ?auto_178428 ) ) ( ON ?auto_178425 ?auto_178426 ) ( ON ?auto_178422 ?auto_178430 ) ( not ( = ?auto_178422 ?auto_178430 ) ) ( not ( = ?auto_178423 ?auto_178430 ) ) ( not ( = ?auto_178424 ?auto_178430 ) ) ( not ( = ?auto_178425 ?auto_178430 ) ) ( not ( = ?auto_178426 ?auto_178430 ) ) ( not ( = ?auto_178427 ?auto_178430 ) ) ( not ( = ?auto_178429 ?auto_178430 ) ) ( not ( = ?auto_178428 ?auto_178430 ) ) ( ON ?auto_178423 ?auto_178422 ) ( ON-TABLE ?auto_178430 ) ( CLEAR ?auto_178425 ) ( ON ?auto_178424 ?auto_178423 ) ( CLEAR ?auto_178424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178430 ?auto_178422 ?auto_178423 )
      ( MAKE-6PILE ?auto_178422 ?auto_178423 ?auto_178424 ?auto_178425 ?auto_178426 ?auto_178427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178431 - BLOCK
      ?auto_178432 - BLOCK
      ?auto_178433 - BLOCK
      ?auto_178434 - BLOCK
      ?auto_178435 - BLOCK
      ?auto_178436 - BLOCK
    )
    :vars
    (
      ?auto_178437 - BLOCK
      ?auto_178439 - BLOCK
      ?auto_178438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178431 ?auto_178432 ) ) ( not ( = ?auto_178431 ?auto_178433 ) ) ( not ( = ?auto_178431 ?auto_178434 ) ) ( not ( = ?auto_178431 ?auto_178435 ) ) ( not ( = ?auto_178431 ?auto_178436 ) ) ( not ( = ?auto_178432 ?auto_178433 ) ) ( not ( = ?auto_178432 ?auto_178434 ) ) ( not ( = ?auto_178432 ?auto_178435 ) ) ( not ( = ?auto_178432 ?auto_178436 ) ) ( not ( = ?auto_178433 ?auto_178434 ) ) ( not ( = ?auto_178433 ?auto_178435 ) ) ( not ( = ?auto_178433 ?auto_178436 ) ) ( not ( = ?auto_178434 ?auto_178435 ) ) ( not ( = ?auto_178434 ?auto_178436 ) ) ( not ( = ?auto_178435 ?auto_178436 ) ) ( ON ?auto_178436 ?auto_178437 ) ( not ( = ?auto_178431 ?auto_178437 ) ) ( not ( = ?auto_178432 ?auto_178437 ) ) ( not ( = ?auto_178433 ?auto_178437 ) ) ( not ( = ?auto_178434 ?auto_178437 ) ) ( not ( = ?auto_178435 ?auto_178437 ) ) ( not ( = ?auto_178436 ?auto_178437 ) ) ( ON ?auto_178435 ?auto_178436 ) ( ON-TABLE ?auto_178439 ) ( ON ?auto_178437 ?auto_178439 ) ( not ( = ?auto_178439 ?auto_178437 ) ) ( not ( = ?auto_178439 ?auto_178436 ) ) ( not ( = ?auto_178439 ?auto_178435 ) ) ( not ( = ?auto_178431 ?auto_178439 ) ) ( not ( = ?auto_178432 ?auto_178439 ) ) ( not ( = ?auto_178433 ?auto_178439 ) ) ( not ( = ?auto_178434 ?auto_178439 ) ) ( ON ?auto_178431 ?auto_178438 ) ( not ( = ?auto_178431 ?auto_178438 ) ) ( not ( = ?auto_178432 ?auto_178438 ) ) ( not ( = ?auto_178433 ?auto_178438 ) ) ( not ( = ?auto_178434 ?auto_178438 ) ) ( not ( = ?auto_178435 ?auto_178438 ) ) ( not ( = ?auto_178436 ?auto_178438 ) ) ( not ( = ?auto_178437 ?auto_178438 ) ) ( not ( = ?auto_178439 ?auto_178438 ) ) ( ON ?auto_178432 ?auto_178431 ) ( ON-TABLE ?auto_178438 ) ( ON ?auto_178433 ?auto_178432 ) ( CLEAR ?auto_178433 ) ( HOLDING ?auto_178434 ) ( CLEAR ?auto_178435 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178439 ?auto_178437 ?auto_178436 ?auto_178435 ?auto_178434 )
      ( MAKE-6PILE ?auto_178431 ?auto_178432 ?auto_178433 ?auto_178434 ?auto_178435 ?auto_178436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178440 - BLOCK
      ?auto_178441 - BLOCK
      ?auto_178442 - BLOCK
      ?auto_178443 - BLOCK
      ?auto_178444 - BLOCK
      ?auto_178445 - BLOCK
    )
    :vars
    (
      ?auto_178446 - BLOCK
      ?auto_178448 - BLOCK
      ?auto_178447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178440 ?auto_178441 ) ) ( not ( = ?auto_178440 ?auto_178442 ) ) ( not ( = ?auto_178440 ?auto_178443 ) ) ( not ( = ?auto_178440 ?auto_178444 ) ) ( not ( = ?auto_178440 ?auto_178445 ) ) ( not ( = ?auto_178441 ?auto_178442 ) ) ( not ( = ?auto_178441 ?auto_178443 ) ) ( not ( = ?auto_178441 ?auto_178444 ) ) ( not ( = ?auto_178441 ?auto_178445 ) ) ( not ( = ?auto_178442 ?auto_178443 ) ) ( not ( = ?auto_178442 ?auto_178444 ) ) ( not ( = ?auto_178442 ?auto_178445 ) ) ( not ( = ?auto_178443 ?auto_178444 ) ) ( not ( = ?auto_178443 ?auto_178445 ) ) ( not ( = ?auto_178444 ?auto_178445 ) ) ( ON ?auto_178445 ?auto_178446 ) ( not ( = ?auto_178440 ?auto_178446 ) ) ( not ( = ?auto_178441 ?auto_178446 ) ) ( not ( = ?auto_178442 ?auto_178446 ) ) ( not ( = ?auto_178443 ?auto_178446 ) ) ( not ( = ?auto_178444 ?auto_178446 ) ) ( not ( = ?auto_178445 ?auto_178446 ) ) ( ON ?auto_178444 ?auto_178445 ) ( ON-TABLE ?auto_178448 ) ( ON ?auto_178446 ?auto_178448 ) ( not ( = ?auto_178448 ?auto_178446 ) ) ( not ( = ?auto_178448 ?auto_178445 ) ) ( not ( = ?auto_178448 ?auto_178444 ) ) ( not ( = ?auto_178440 ?auto_178448 ) ) ( not ( = ?auto_178441 ?auto_178448 ) ) ( not ( = ?auto_178442 ?auto_178448 ) ) ( not ( = ?auto_178443 ?auto_178448 ) ) ( ON ?auto_178440 ?auto_178447 ) ( not ( = ?auto_178440 ?auto_178447 ) ) ( not ( = ?auto_178441 ?auto_178447 ) ) ( not ( = ?auto_178442 ?auto_178447 ) ) ( not ( = ?auto_178443 ?auto_178447 ) ) ( not ( = ?auto_178444 ?auto_178447 ) ) ( not ( = ?auto_178445 ?auto_178447 ) ) ( not ( = ?auto_178446 ?auto_178447 ) ) ( not ( = ?auto_178448 ?auto_178447 ) ) ( ON ?auto_178441 ?auto_178440 ) ( ON-TABLE ?auto_178447 ) ( ON ?auto_178442 ?auto_178441 ) ( CLEAR ?auto_178444 ) ( ON ?auto_178443 ?auto_178442 ) ( CLEAR ?auto_178443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178447 ?auto_178440 ?auto_178441 ?auto_178442 )
      ( MAKE-6PILE ?auto_178440 ?auto_178441 ?auto_178442 ?auto_178443 ?auto_178444 ?auto_178445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178449 - BLOCK
      ?auto_178450 - BLOCK
      ?auto_178451 - BLOCK
      ?auto_178452 - BLOCK
      ?auto_178453 - BLOCK
      ?auto_178454 - BLOCK
    )
    :vars
    (
      ?auto_178457 - BLOCK
      ?auto_178456 - BLOCK
      ?auto_178455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178449 ?auto_178450 ) ) ( not ( = ?auto_178449 ?auto_178451 ) ) ( not ( = ?auto_178449 ?auto_178452 ) ) ( not ( = ?auto_178449 ?auto_178453 ) ) ( not ( = ?auto_178449 ?auto_178454 ) ) ( not ( = ?auto_178450 ?auto_178451 ) ) ( not ( = ?auto_178450 ?auto_178452 ) ) ( not ( = ?auto_178450 ?auto_178453 ) ) ( not ( = ?auto_178450 ?auto_178454 ) ) ( not ( = ?auto_178451 ?auto_178452 ) ) ( not ( = ?auto_178451 ?auto_178453 ) ) ( not ( = ?auto_178451 ?auto_178454 ) ) ( not ( = ?auto_178452 ?auto_178453 ) ) ( not ( = ?auto_178452 ?auto_178454 ) ) ( not ( = ?auto_178453 ?auto_178454 ) ) ( ON ?auto_178454 ?auto_178457 ) ( not ( = ?auto_178449 ?auto_178457 ) ) ( not ( = ?auto_178450 ?auto_178457 ) ) ( not ( = ?auto_178451 ?auto_178457 ) ) ( not ( = ?auto_178452 ?auto_178457 ) ) ( not ( = ?auto_178453 ?auto_178457 ) ) ( not ( = ?auto_178454 ?auto_178457 ) ) ( ON-TABLE ?auto_178456 ) ( ON ?auto_178457 ?auto_178456 ) ( not ( = ?auto_178456 ?auto_178457 ) ) ( not ( = ?auto_178456 ?auto_178454 ) ) ( not ( = ?auto_178456 ?auto_178453 ) ) ( not ( = ?auto_178449 ?auto_178456 ) ) ( not ( = ?auto_178450 ?auto_178456 ) ) ( not ( = ?auto_178451 ?auto_178456 ) ) ( not ( = ?auto_178452 ?auto_178456 ) ) ( ON ?auto_178449 ?auto_178455 ) ( not ( = ?auto_178449 ?auto_178455 ) ) ( not ( = ?auto_178450 ?auto_178455 ) ) ( not ( = ?auto_178451 ?auto_178455 ) ) ( not ( = ?auto_178452 ?auto_178455 ) ) ( not ( = ?auto_178453 ?auto_178455 ) ) ( not ( = ?auto_178454 ?auto_178455 ) ) ( not ( = ?auto_178457 ?auto_178455 ) ) ( not ( = ?auto_178456 ?auto_178455 ) ) ( ON ?auto_178450 ?auto_178449 ) ( ON-TABLE ?auto_178455 ) ( ON ?auto_178451 ?auto_178450 ) ( ON ?auto_178452 ?auto_178451 ) ( CLEAR ?auto_178452 ) ( HOLDING ?auto_178453 ) ( CLEAR ?auto_178454 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178456 ?auto_178457 ?auto_178454 ?auto_178453 )
      ( MAKE-6PILE ?auto_178449 ?auto_178450 ?auto_178451 ?auto_178452 ?auto_178453 ?auto_178454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178458 - BLOCK
      ?auto_178459 - BLOCK
      ?auto_178460 - BLOCK
      ?auto_178461 - BLOCK
      ?auto_178462 - BLOCK
      ?auto_178463 - BLOCK
    )
    :vars
    (
      ?auto_178465 - BLOCK
      ?auto_178464 - BLOCK
      ?auto_178466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178458 ?auto_178459 ) ) ( not ( = ?auto_178458 ?auto_178460 ) ) ( not ( = ?auto_178458 ?auto_178461 ) ) ( not ( = ?auto_178458 ?auto_178462 ) ) ( not ( = ?auto_178458 ?auto_178463 ) ) ( not ( = ?auto_178459 ?auto_178460 ) ) ( not ( = ?auto_178459 ?auto_178461 ) ) ( not ( = ?auto_178459 ?auto_178462 ) ) ( not ( = ?auto_178459 ?auto_178463 ) ) ( not ( = ?auto_178460 ?auto_178461 ) ) ( not ( = ?auto_178460 ?auto_178462 ) ) ( not ( = ?auto_178460 ?auto_178463 ) ) ( not ( = ?auto_178461 ?auto_178462 ) ) ( not ( = ?auto_178461 ?auto_178463 ) ) ( not ( = ?auto_178462 ?auto_178463 ) ) ( ON ?auto_178463 ?auto_178465 ) ( not ( = ?auto_178458 ?auto_178465 ) ) ( not ( = ?auto_178459 ?auto_178465 ) ) ( not ( = ?auto_178460 ?auto_178465 ) ) ( not ( = ?auto_178461 ?auto_178465 ) ) ( not ( = ?auto_178462 ?auto_178465 ) ) ( not ( = ?auto_178463 ?auto_178465 ) ) ( ON-TABLE ?auto_178464 ) ( ON ?auto_178465 ?auto_178464 ) ( not ( = ?auto_178464 ?auto_178465 ) ) ( not ( = ?auto_178464 ?auto_178463 ) ) ( not ( = ?auto_178464 ?auto_178462 ) ) ( not ( = ?auto_178458 ?auto_178464 ) ) ( not ( = ?auto_178459 ?auto_178464 ) ) ( not ( = ?auto_178460 ?auto_178464 ) ) ( not ( = ?auto_178461 ?auto_178464 ) ) ( ON ?auto_178458 ?auto_178466 ) ( not ( = ?auto_178458 ?auto_178466 ) ) ( not ( = ?auto_178459 ?auto_178466 ) ) ( not ( = ?auto_178460 ?auto_178466 ) ) ( not ( = ?auto_178461 ?auto_178466 ) ) ( not ( = ?auto_178462 ?auto_178466 ) ) ( not ( = ?auto_178463 ?auto_178466 ) ) ( not ( = ?auto_178465 ?auto_178466 ) ) ( not ( = ?auto_178464 ?auto_178466 ) ) ( ON ?auto_178459 ?auto_178458 ) ( ON-TABLE ?auto_178466 ) ( ON ?auto_178460 ?auto_178459 ) ( ON ?auto_178461 ?auto_178460 ) ( CLEAR ?auto_178463 ) ( ON ?auto_178462 ?auto_178461 ) ( CLEAR ?auto_178462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178466 ?auto_178458 ?auto_178459 ?auto_178460 ?auto_178461 )
      ( MAKE-6PILE ?auto_178458 ?auto_178459 ?auto_178460 ?auto_178461 ?auto_178462 ?auto_178463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178467 - BLOCK
      ?auto_178468 - BLOCK
      ?auto_178469 - BLOCK
      ?auto_178470 - BLOCK
      ?auto_178471 - BLOCK
      ?auto_178472 - BLOCK
    )
    :vars
    (
      ?auto_178475 - BLOCK
      ?auto_178473 - BLOCK
      ?auto_178474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178467 ?auto_178468 ) ) ( not ( = ?auto_178467 ?auto_178469 ) ) ( not ( = ?auto_178467 ?auto_178470 ) ) ( not ( = ?auto_178467 ?auto_178471 ) ) ( not ( = ?auto_178467 ?auto_178472 ) ) ( not ( = ?auto_178468 ?auto_178469 ) ) ( not ( = ?auto_178468 ?auto_178470 ) ) ( not ( = ?auto_178468 ?auto_178471 ) ) ( not ( = ?auto_178468 ?auto_178472 ) ) ( not ( = ?auto_178469 ?auto_178470 ) ) ( not ( = ?auto_178469 ?auto_178471 ) ) ( not ( = ?auto_178469 ?auto_178472 ) ) ( not ( = ?auto_178470 ?auto_178471 ) ) ( not ( = ?auto_178470 ?auto_178472 ) ) ( not ( = ?auto_178471 ?auto_178472 ) ) ( not ( = ?auto_178467 ?auto_178475 ) ) ( not ( = ?auto_178468 ?auto_178475 ) ) ( not ( = ?auto_178469 ?auto_178475 ) ) ( not ( = ?auto_178470 ?auto_178475 ) ) ( not ( = ?auto_178471 ?auto_178475 ) ) ( not ( = ?auto_178472 ?auto_178475 ) ) ( ON-TABLE ?auto_178473 ) ( ON ?auto_178475 ?auto_178473 ) ( not ( = ?auto_178473 ?auto_178475 ) ) ( not ( = ?auto_178473 ?auto_178472 ) ) ( not ( = ?auto_178473 ?auto_178471 ) ) ( not ( = ?auto_178467 ?auto_178473 ) ) ( not ( = ?auto_178468 ?auto_178473 ) ) ( not ( = ?auto_178469 ?auto_178473 ) ) ( not ( = ?auto_178470 ?auto_178473 ) ) ( ON ?auto_178467 ?auto_178474 ) ( not ( = ?auto_178467 ?auto_178474 ) ) ( not ( = ?auto_178468 ?auto_178474 ) ) ( not ( = ?auto_178469 ?auto_178474 ) ) ( not ( = ?auto_178470 ?auto_178474 ) ) ( not ( = ?auto_178471 ?auto_178474 ) ) ( not ( = ?auto_178472 ?auto_178474 ) ) ( not ( = ?auto_178475 ?auto_178474 ) ) ( not ( = ?auto_178473 ?auto_178474 ) ) ( ON ?auto_178468 ?auto_178467 ) ( ON-TABLE ?auto_178474 ) ( ON ?auto_178469 ?auto_178468 ) ( ON ?auto_178470 ?auto_178469 ) ( ON ?auto_178471 ?auto_178470 ) ( CLEAR ?auto_178471 ) ( HOLDING ?auto_178472 ) ( CLEAR ?auto_178475 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178473 ?auto_178475 ?auto_178472 )
      ( MAKE-6PILE ?auto_178467 ?auto_178468 ?auto_178469 ?auto_178470 ?auto_178471 ?auto_178472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178476 - BLOCK
      ?auto_178477 - BLOCK
      ?auto_178478 - BLOCK
      ?auto_178479 - BLOCK
      ?auto_178480 - BLOCK
      ?auto_178481 - BLOCK
    )
    :vars
    (
      ?auto_178483 - BLOCK
      ?auto_178484 - BLOCK
      ?auto_178482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178476 ?auto_178477 ) ) ( not ( = ?auto_178476 ?auto_178478 ) ) ( not ( = ?auto_178476 ?auto_178479 ) ) ( not ( = ?auto_178476 ?auto_178480 ) ) ( not ( = ?auto_178476 ?auto_178481 ) ) ( not ( = ?auto_178477 ?auto_178478 ) ) ( not ( = ?auto_178477 ?auto_178479 ) ) ( not ( = ?auto_178477 ?auto_178480 ) ) ( not ( = ?auto_178477 ?auto_178481 ) ) ( not ( = ?auto_178478 ?auto_178479 ) ) ( not ( = ?auto_178478 ?auto_178480 ) ) ( not ( = ?auto_178478 ?auto_178481 ) ) ( not ( = ?auto_178479 ?auto_178480 ) ) ( not ( = ?auto_178479 ?auto_178481 ) ) ( not ( = ?auto_178480 ?auto_178481 ) ) ( not ( = ?auto_178476 ?auto_178483 ) ) ( not ( = ?auto_178477 ?auto_178483 ) ) ( not ( = ?auto_178478 ?auto_178483 ) ) ( not ( = ?auto_178479 ?auto_178483 ) ) ( not ( = ?auto_178480 ?auto_178483 ) ) ( not ( = ?auto_178481 ?auto_178483 ) ) ( ON-TABLE ?auto_178484 ) ( ON ?auto_178483 ?auto_178484 ) ( not ( = ?auto_178484 ?auto_178483 ) ) ( not ( = ?auto_178484 ?auto_178481 ) ) ( not ( = ?auto_178484 ?auto_178480 ) ) ( not ( = ?auto_178476 ?auto_178484 ) ) ( not ( = ?auto_178477 ?auto_178484 ) ) ( not ( = ?auto_178478 ?auto_178484 ) ) ( not ( = ?auto_178479 ?auto_178484 ) ) ( ON ?auto_178476 ?auto_178482 ) ( not ( = ?auto_178476 ?auto_178482 ) ) ( not ( = ?auto_178477 ?auto_178482 ) ) ( not ( = ?auto_178478 ?auto_178482 ) ) ( not ( = ?auto_178479 ?auto_178482 ) ) ( not ( = ?auto_178480 ?auto_178482 ) ) ( not ( = ?auto_178481 ?auto_178482 ) ) ( not ( = ?auto_178483 ?auto_178482 ) ) ( not ( = ?auto_178484 ?auto_178482 ) ) ( ON ?auto_178477 ?auto_178476 ) ( ON-TABLE ?auto_178482 ) ( ON ?auto_178478 ?auto_178477 ) ( ON ?auto_178479 ?auto_178478 ) ( ON ?auto_178480 ?auto_178479 ) ( CLEAR ?auto_178483 ) ( ON ?auto_178481 ?auto_178480 ) ( CLEAR ?auto_178481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178482 ?auto_178476 ?auto_178477 ?auto_178478 ?auto_178479 ?auto_178480 )
      ( MAKE-6PILE ?auto_178476 ?auto_178477 ?auto_178478 ?auto_178479 ?auto_178480 ?auto_178481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178485 - BLOCK
      ?auto_178486 - BLOCK
      ?auto_178487 - BLOCK
      ?auto_178488 - BLOCK
      ?auto_178489 - BLOCK
      ?auto_178490 - BLOCK
    )
    :vars
    (
      ?auto_178493 - BLOCK
      ?auto_178492 - BLOCK
      ?auto_178491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178485 ?auto_178486 ) ) ( not ( = ?auto_178485 ?auto_178487 ) ) ( not ( = ?auto_178485 ?auto_178488 ) ) ( not ( = ?auto_178485 ?auto_178489 ) ) ( not ( = ?auto_178485 ?auto_178490 ) ) ( not ( = ?auto_178486 ?auto_178487 ) ) ( not ( = ?auto_178486 ?auto_178488 ) ) ( not ( = ?auto_178486 ?auto_178489 ) ) ( not ( = ?auto_178486 ?auto_178490 ) ) ( not ( = ?auto_178487 ?auto_178488 ) ) ( not ( = ?auto_178487 ?auto_178489 ) ) ( not ( = ?auto_178487 ?auto_178490 ) ) ( not ( = ?auto_178488 ?auto_178489 ) ) ( not ( = ?auto_178488 ?auto_178490 ) ) ( not ( = ?auto_178489 ?auto_178490 ) ) ( not ( = ?auto_178485 ?auto_178493 ) ) ( not ( = ?auto_178486 ?auto_178493 ) ) ( not ( = ?auto_178487 ?auto_178493 ) ) ( not ( = ?auto_178488 ?auto_178493 ) ) ( not ( = ?auto_178489 ?auto_178493 ) ) ( not ( = ?auto_178490 ?auto_178493 ) ) ( ON-TABLE ?auto_178492 ) ( not ( = ?auto_178492 ?auto_178493 ) ) ( not ( = ?auto_178492 ?auto_178490 ) ) ( not ( = ?auto_178492 ?auto_178489 ) ) ( not ( = ?auto_178485 ?auto_178492 ) ) ( not ( = ?auto_178486 ?auto_178492 ) ) ( not ( = ?auto_178487 ?auto_178492 ) ) ( not ( = ?auto_178488 ?auto_178492 ) ) ( ON ?auto_178485 ?auto_178491 ) ( not ( = ?auto_178485 ?auto_178491 ) ) ( not ( = ?auto_178486 ?auto_178491 ) ) ( not ( = ?auto_178487 ?auto_178491 ) ) ( not ( = ?auto_178488 ?auto_178491 ) ) ( not ( = ?auto_178489 ?auto_178491 ) ) ( not ( = ?auto_178490 ?auto_178491 ) ) ( not ( = ?auto_178493 ?auto_178491 ) ) ( not ( = ?auto_178492 ?auto_178491 ) ) ( ON ?auto_178486 ?auto_178485 ) ( ON-TABLE ?auto_178491 ) ( ON ?auto_178487 ?auto_178486 ) ( ON ?auto_178488 ?auto_178487 ) ( ON ?auto_178489 ?auto_178488 ) ( ON ?auto_178490 ?auto_178489 ) ( CLEAR ?auto_178490 ) ( HOLDING ?auto_178493 ) ( CLEAR ?auto_178492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178492 ?auto_178493 )
      ( MAKE-6PILE ?auto_178485 ?auto_178486 ?auto_178487 ?auto_178488 ?auto_178489 ?auto_178490 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178494 - BLOCK
      ?auto_178495 - BLOCK
      ?auto_178496 - BLOCK
      ?auto_178497 - BLOCK
      ?auto_178498 - BLOCK
      ?auto_178499 - BLOCK
    )
    :vars
    (
      ?auto_178501 - BLOCK
      ?auto_178502 - BLOCK
      ?auto_178500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178494 ?auto_178495 ) ) ( not ( = ?auto_178494 ?auto_178496 ) ) ( not ( = ?auto_178494 ?auto_178497 ) ) ( not ( = ?auto_178494 ?auto_178498 ) ) ( not ( = ?auto_178494 ?auto_178499 ) ) ( not ( = ?auto_178495 ?auto_178496 ) ) ( not ( = ?auto_178495 ?auto_178497 ) ) ( not ( = ?auto_178495 ?auto_178498 ) ) ( not ( = ?auto_178495 ?auto_178499 ) ) ( not ( = ?auto_178496 ?auto_178497 ) ) ( not ( = ?auto_178496 ?auto_178498 ) ) ( not ( = ?auto_178496 ?auto_178499 ) ) ( not ( = ?auto_178497 ?auto_178498 ) ) ( not ( = ?auto_178497 ?auto_178499 ) ) ( not ( = ?auto_178498 ?auto_178499 ) ) ( not ( = ?auto_178494 ?auto_178501 ) ) ( not ( = ?auto_178495 ?auto_178501 ) ) ( not ( = ?auto_178496 ?auto_178501 ) ) ( not ( = ?auto_178497 ?auto_178501 ) ) ( not ( = ?auto_178498 ?auto_178501 ) ) ( not ( = ?auto_178499 ?auto_178501 ) ) ( ON-TABLE ?auto_178502 ) ( not ( = ?auto_178502 ?auto_178501 ) ) ( not ( = ?auto_178502 ?auto_178499 ) ) ( not ( = ?auto_178502 ?auto_178498 ) ) ( not ( = ?auto_178494 ?auto_178502 ) ) ( not ( = ?auto_178495 ?auto_178502 ) ) ( not ( = ?auto_178496 ?auto_178502 ) ) ( not ( = ?auto_178497 ?auto_178502 ) ) ( ON ?auto_178494 ?auto_178500 ) ( not ( = ?auto_178494 ?auto_178500 ) ) ( not ( = ?auto_178495 ?auto_178500 ) ) ( not ( = ?auto_178496 ?auto_178500 ) ) ( not ( = ?auto_178497 ?auto_178500 ) ) ( not ( = ?auto_178498 ?auto_178500 ) ) ( not ( = ?auto_178499 ?auto_178500 ) ) ( not ( = ?auto_178501 ?auto_178500 ) ) ( not ( = ?auto_178502 ?auto_178500 ) ) ( ON ?auto_178495 ?auto_178494 ) ( ON-TABLE ?auto_178500 ) ( ON ?auto_178496 ?auto_178495 ) ( ON ?auto_178497 ?auto_178496 ) ( ON ?auto_178498 ?auto_178497 ) ( ON ?auto_178499 ?auto_178498 ) ( CLEAR ?auto_178502 ) ( ON ?auto_178501 ?auto_178499 ) ( CLEAR ?auto_178501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178500 ?auto_178494 ?auto_178495 ?auto_178496 ?auto_178497 ?auto_178498 ?auto_178499 )
      ( MAKE-6PILE ?auto_178494 ?auto_178495 ?auto_178496 ?auto_178497 ?auto_178498 ?auto_178499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178503 - BLOCK
      ?auto_178504 - BLOCK
      ?auto_178505 - BLOCK
      ?auto_178506 - BLOCK
      ?auto_178507 - BLOCK
      ?auto_178508 - BLOCK
    )
    :vars
    (
      ?auto_178510 - BLOCK
      ?auto_178511 - BLOCK
      ?auto_178509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178503 ?auto_178504 ) ) ( not ( = ?auto_178503 ?auto_178505 ) ) ( not ( = ?auto_178503 ?auto_178506 ) ) ( not ( = ?auto_178503 ?auto_178507 ) ) ( not ( = ?auto_178503 ?auto_178508 ) ) ( not ( = ?auto_178504 ?auto_178505 ) ) ( not ( = ?auto_178504 ?auto_178506 ) ) ( not ( = ?auto_178504 ?auto_178507 ) ) ( not ( = ?auto_178504 ?auto_178508 ) ) ( not ( = ?auto_178505 ?auto_178506 ) ) ( not ( = ?auto_178505 ?auto_178507 ) ) ( not ( = ?auto_178505 ?auto_178508 ) ) ( not ( = ?auto_178506 ?auto_178507 ) ) ( not ( = ?auto_178506 ?auto_178508 ) ) ( not ( = ?auto_178507 ?auto_178508 ) ) ( not ( = ?auto_178503 ?auto_178510 ) ) ( not ( = ?auto_178504 ?auto_178510 ) ) ( not ( = ?auto_178505 ?auto_178510 ) ) ( not ( = ?auto_178506 ?auto_178510 ) ) ( not ( = ?auto_178507 ?auto_178510 ) ) ( not ( = ?auto_178508 ?auto_178510 ) ) ( not ( = ?auto_178511 ?auto_178510 ) ) ( not ( = ?auto_178511 ?auto_178508 ) ) ( not ( = ?auto_178511 ?auto_178507 ) ) ( not ( = ?auto_178503 ?auto_178511 ) ) ( not ( = ?auto_178504 ?auto_178511 ) ) ( not ( = ?auto_178505 ?auto_178511 ) ) ( not ( = ?auto_178506 ?auto_178511 ) ) ( ON ?auto_178503 ?auto_178509 ) ( not ( = ?auto_178503 ?auto_178509 ) ) ( not ( = ?auto_178504 ?auto_178509 ) ) ( not ( = ?auto_178505 ?auto_178509 ) ) ( not ( = ?auto_178506 ?auto_178509 ) ) ( not ( = ?auto_178507 ?auto_178509 ) ) ( not ( = ?auto_178508 ?auto_178509 ) ) ( not ( = ?auto_178510 ?auto_178509 ) ) ( not ( = ?auto_178511 ?auto_178509 ) ) ( ON ?auto_178504 ?auto_178503 ) ( ON-TABLE ?auto_178509 ) ( ON ?auto_178505 ?auto_178504 ) ( ON ?auto_178506 ?auto_178505 ) ( ON ?auto_178507 ?auto_178506 ) ( ON ?auto_178508 ?auto_178507 ) ( ON ?auto_178510 ?auto_178508 ) ( CLEAR ?auto_178510 ) ( HOLDING ?auto_178511 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178511 )
      ( MAKE-6PILE ?auto_178503 ?auto_178504 ?auto_178505 ?auto_178506 ?auto_178507 ?auto_178508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_178512 - BLOCK
      ?auto_178513 - BLOCK
      ?auto_178514 - BLOCK
      ?auto_178515 - BLOCK
      ?auto_178516 - BLOCK
      ?auto_178517 - BLOCK
    )
    :vars
    (
      ?auto_178518 - BLOCK
      ?auto_178519 - BLOCK
      ?auto_178520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178512 ?auto_178513 ) ) ( not ( = ?auto_178512 ?auto_178514 ) ) ( not ( = ?auto_178512 ?auto_178515 ) ) ( not ( = ?auto_178512 ?auto_178516 ) ) ( not ( = ?auto_178512 ?auto_178517 ) ) ( not ( = ?auto_178513 ?auto_178514 ) ) ( not ( = ?auto_178513 ?auto_178515 ) ) ( not ( = ?auto_178513 ?auto_178516 ) ) ( not ( = ?auto_178513 ?auto_178517 ) ) ( not ( = ?auto_178514 ?auto_178515 ) ) ( not ( = ?auto_178514 ?auto_178516 ) ) ( not ( = ?auto_178514 ?auto_178517 ) ) ( not ( = ?auto_178515 ?auto_178516 ) ) ( not ( = ?auto_178515 ?auto_178517 ) ) ( not ( = ?auto_178516 ?auto_178517 ) ) ( not ( = ?auto_178512 ?auto_178518 ) ) ( not ( = ?auto_178513 ?auto_178518 ) ) ( not ( = ?auto_178514 ?auto_178518 ) ) ( not ( = ?auto_178515 ?auto_178518 ) ) ( not ( = ?auto_178516 ?auto_178518 ) ) ( not ( = ?auto_178517 ?auto_178518 ) ) ( not ( = ?auto_178519 ?auto_178518 ) ) ( not ( = ?auto_178519 ?auto_178517 ) ) ( not ( = ?auto_178519 ?auto_178516 ) ) ( not ( = ?auto_178512 ?auto_178519 ) ) ( not ( = ?auto_178513 ?auto_178519 ) ) ( not ( = ?auto_178514 ?auto_178519 ) ) ( not ( = ?auto_178515 ?auto_178519 ) ) ( ON ?auto_178512 ?auto_178520 ) ( not ( = ?auto_178512 ?auto_178520 ) ) ( not ( = ?auto_178513 ?auto_178520 ) ) ( not ( = ?auto_178514 ?auto_178520 ) ) ( not ( = ?auto_178515 ?auto_178520 ) ) ( not ( = ?auto_178516 ?auto_178520 ) ) ( not ( = ?auto_178517 ?auto_178520 ) ) ( not ( = ?auto_178518 ?auto_178520 ) ) ( not ( = ?auto_178519 ?auto_178520 ) ) ( ON ?auto_178513 ?auto_178512 ) ( ON-TABLE ?auto_178520 ) ( ON ?auto_178514 ?auto_178513 ) ( ON ?auto_178515 ?auto_178514 ) ( ON ?auto_178516 ?auto_178515 ) ( ON ?auto_178517 ?auto_178516 ) ( ON ?auto_178518 ?auto_178517 ) ( ON ?auto_178519 ?auto_178518 ) ( CLEAR ?auto_178519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178520 ?auto_178512 ?auto_178513 ?auto_178514 ?auto_178515 ?auto_178516 ?auto_178517 ?auto_178518 )
      ( MAKE-6PILE ?auto_178512 ?auto_178513 ?auto_178514 ?auto_178515 ?auto_178516 ?auto_178517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178522 - BLOCK
    )
    :vars
    (
      ?auto_178523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178523 ?auto_178522 ) ( CLEAR ?auto_178523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178522 ) ( not ( = ?auto_178522 ?auto_178523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178523 ?auto_178522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178524 - BLOCK
    )
    :vars
    (
      ?auto_178525 - BLOCK
      ?auto_178526 - BLOCK
      ?auto_178527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178525 ?auto_178524 ) ( CLEAR ?auto_178525 ) ( ON-TABLE ?auto_178524 ) ( not ( = ?auto_178524 ?auto_178525 ) ) ( HOLDING ?auto_178526 ) ( CLEAR ?auto_178527 ) ( not ( = ?auto_178524 ?auto_178526 ) ) ( not ( = ?auto_178524 ?auto_178527 ) ) ( not ( = ?auto_178525 ?auto_178526 ) ) ( not ( = ?auto_178525 ?auto_178527 ) ) ( not ( = ?auto_178526 ?auto_178527 ) ) )
    :subtasks
    ( ( !STACK ?auto_178526 ?auto_178527 )
      ( MAKE-1PILE ?auto_178524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178528 - BLOCK
    )
    :vars
    (
      ?auto_178531 - BLOCK
      ?auto_178529 - BLOCK
      ?auto_178530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178531 ?auto_178528 ) ( ON-TABLE ?auto_178528 ) ( not ( = ?auto_178528 ?auto_178531 ) ) ( CLEAR ?auto_178529 ) ( not ( = ?auto_178528 ?auto_178530 ) ) ( not ( = ?auto_178528 ?auto_178529 ) ) ( not ( = ?auto_178531 ?auto_178530 ) ) ( not ( = ?auto_178531 ?auto_178529 ) ) ( not ( = ?auto_178530 ?auto_178529 ) ) ( ON ?auto_178530 ?auto_178531 ) ( CLEAR ?auto_178530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178528 ?auto_178531 )
      ( MAKE-1PILE ?auto_178528 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178532 - BLOCK
    )
    :vars
    (
      ?auto_178533 - BLOCK
      ?auto_178534 - BLOCK
      ?auto_178535 - BLOCK
      ?auto_178536 - BLOCK
      ?auto_178538 - BLOCK
      ?auto_178537 - BLOCK
      ?auto_178539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178533 ?auto_178532 ) ( ON-TABLE ?auto_178532 ) ( not ( = ?auto_178532 ?auto_178533 ) ) ( not ( = ?auto_178532 ?auto_178534 ) ) ( not ( = ?auto_178532 ?auto_178535 ) ) ( not ( = ?auto_178533 ?auto_178534 ) ) ( not ( = ?auto_178533 ?auto_178535 ) ) ( not ( = ?auto_178534 ?auto_178535 ) ) ( ON ?auto_178534 ?auto_178533 ) ( CLEAR ?auto_178534 ) ( HOLDING ?auto_178535 ) ( CLEAR ?auto_178536 ) ( ON-TABLE ?auto_178538 ) ( ON ?auto_178537 ?auto_178538 ) ( ON ?auto_178539 ?auto_178537 ) ( ON ?auto_178536 ?auto_178539 ) ( not ( = ?auto_178538 ?auto_178537 ) ) ( not ( = ?auto_178538 ?auto_178539 ) ) ( not ( = ?auto_178538 ?auto_178536 ) ) ( not ( = ?auto_178538 ?auto_178535 ) ) ( not ( = ?auto_178537 ?auto_178539 ) ) ( not ( = ?auto_178537 ?auto_178536 ) ) ( not ( = ?auto_178537 ?auto_178535 ) ) ( not ( = ?auto_178539 ?auto_178536 ) ) ( not ( = ?auto_178539 ?auto_178535 ) ) ( not ( = ?auto_178536 ?auto_178535 ) ) ( not ( = ?auto_178532 ?auto_178536 ) ) ( not ( = ?auto_178532 ?auto_178538 ) ) ( not ( = ?auto_178532 ?auto_178537 ) ) ( not ( = ?auto_178532 ?auto_178539 ) ) ( not ( = ?auto_178533 ?auto_178536 ) ) ( not ( = ?auto_178533 ?auto_178538 ) ) ( not ( = ?auto_178533 ?auto_178537 ) ) ( not ( = ?auto_178533 ?auto_178539 ) ) ( not ( = ?auto_178534 ?auto_178536 ) ) ( not ( = ?auto_178534 ?auto_178538 ) ) ( not ( = ?auto_178534 ?auto_178537 ) ) ( not ( = ?auto_178534 ?auto_178539 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178538 ?auto_178537 ?auto_178539 ?auto_178536 ?auto_178535 )
      ( MAKE-1PILE ?auto_178532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178540 - BLOCK
    )
    :vars
    (
      ?auto_178544 - BLOCK
      ?auto_178546 - BLOCK
      ?auto_178545 - BLOCK
      ?auto_178547 - BLOCK
      ?auto_178543 - BLOCK
      ?auto_178542 - BLOCK
      ?auto_178541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178544 ?auto_178540 ) ( ON-TABLE ?auto_178540 ) ( not ( = ?auto_178540 ?auto_178544 ) ) ( not ( = ?auto_178540 ?auto_178546 ) ) ( not ( = ?auto_178540 ?auto_178545 ) ) ( not ( = ?auto_178544 ?auto_178546 ) ) ( not ( = ?auto_178544 ?auto_178545 ) ) ( not ( = ?auto_178546 ?auto_178545 ) ) ( ON ?auto_178546 ?auto_178544 ) ( CLEAR ?auto_178547 ) ( ON-TABLE ?auto_178543 ) ( ON ?auto_178542 ?auto_178543 ) ( ON ?auto_178541 ?auto_178542 ) ( ON ?auto_178547 ?auto_178541 ) ( not ( = ?auto_178543 ?auto_178542 ) ) ( not ( = ?auto_178543 ?auto_178541 ) ) ( not ( = ?auto_178543 ?auto_178547 ) ) ( not ( = ?auto_178543 ?auto_178545 ) ) ( not ( = ?auto_178542 ?auto_178541 ) ) ( not ( = ?auto_178542 ?auto_178547 ) ) ( not ( = ?auto_178542 ?auto_178545 ) ) ( not ( = ?auto_178541 ?auto_178547 ) ) ( not ( = ?auto_178541 ?auto_178545 ) ) ( not ( = ?auto_178547 ?auto_178545 ) ) ( not ( = ?auto_178540 ?auto_178547 ) ) ( not ( = ?auto_178540 ?auto_178543 ) ) ( not ( = ?auto_178540 ?auto_178542 ) ) ( not ( = ?auto_178540 ?auto_178541 ) ) ( not ( = ?auto_178544 ?auto_178547 ) ) ( not ( = ?auto_178544 ?auto_178543 ) ) ( not ( = ?auto_178544 ?auto_178542 ) ) ( not ( = ?auto_178544 ?auto_178541 ) ) ( not ( = ?auto_178546 ?auto_178547 ) ) ( not ( = ?auto_178546 ?auto_178543 ) ) ( not ( = ?auto_178546 ?auto_178542 ) ) ( not ( = ?auto_178546 ?auto_178541 ) ) ( ON ?auto_178545 ?auto_178546 ) ( CLEAR ?auto_178545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178540 ?auto_178544 ?auto_178546 )
      ( MAKE-1PILE ?auto_178540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178548 - BLOCK
    )
    :vars
    (
      ?auto_178555 - BLOCK
      ?auto_178551 - BLOCK
      ?auto_178554 - BLOCK
      ?auto_178549 - BLOCK
      ?auto_178550 - BLOCK
      ?auto_178553 - BLOCK
      ?auto_178552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178555 ?auto_178548 ) ( ON-TABLE ?auto_178548 ) ( not ( = ?auto_178548 ?auto_178555 ) ) ( not ( = ?auto_178548 ?auto_178551 ) ) ( not ( = ?auto_178548 ?auto_178554 ) ) ( not ( = ?auto_178555 ?auto_178551 ) ) ( not ( = ?auto_178555 ?auto_178554 ) ) ( not ( = ?auto_178551 ?auto_178554 ) ) ( ON ?auto_178551 ?auto_178555 ) ( ON-TABLE ?auto_178549 ) ( ON ?auto_178550 ?auto_178549 ) ( ON ?auto_178553 ?auto_178550 ) ( not ( = ?auto_178549 ?auto_178550 ) ) ( not ( = ?auto_178549 ?auto_178553 ) ) ( not ( = ?auto_178549 ?auto_178552 ) ) ( not ( = ?auto_178549 ?auto_178554 ) ) ( not ( = ?auto_178550 ?auto_178553 ) ) ( not ( = ?auto_178550 ?auto_178552 ) ) ( not ( = ?auto_178550 ?auto_178554 ) ) ( not ( = ?auto_178553 ?auto_178552 ) ) ( not ( = ?auto_178553 ?auto_178554 ) ) ( not ( = ?auto_178552 ?auto_178554 ) ) ( not ( = ?auto_178548 ?auto_178552 ) ) ( not ( = ?auto_178548 ?auto_178549 ) ) ( not ( = ?auto_178548 ?auto_178550 ) ) ( not ( = ?auto_178548 ?auto_178553 ) ) ( not ( = ?auto_178555 ?auto_178552 ) ) ( not ( = ?auto_178555 ?auto_178549 ) ) ( not ( = ?auto_178555 ?auto_178550 ) ) ( not ( = ?auto_178555 ?auto_178553 ) ) ( not ( = ?auto_178551 ?auto_178552 ) ) ( not ( = ?auto_178551 ?auto_178549 ) ) ( not ( = ?auto_178551 ?auto_178550 ) ) ( not ( = ?auto_178551 ?auto_178553 ) ) ( ON ?auto_178554 ?auto_178551 ) ( CLEAR ?auto_178554 ) ( HOLDING ?auto_178552 ) ( CLEAR ?auto_178553 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178549 ?auto_178550 ?auto_178553 ?auto_178552 )
      ( MAKE-1PILE ?auto_178548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178556 - BLOCK
    )
    :vars
    (
      ?auto_178559 - BLOCK
      ?auto_178557 - BLOCK
      ?auto_178560 - BLOCK
      ?auto_178562 - BLOCK
      ?auto_178563 - BLOCK
      ?auto_178558 - BLOCK
      ?auto_178561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178559 ?auto_178556 ) ( ON-TABLE ?auto_178556 ) ( not ( = ?auto_178556 ?auto_178559 ) ) ( not ( = ?auto_178556 ?auto_178557 ) ) ( not ( = ?auto_178556 ?auto_178560 ) ) ( not ( = ?auto_178559 ?auto_178557 ) ) ( not ( = ?auto_178559 ?auto_178560 ) ) ( not ( = ?auto_178557 ?auto_178560 ) ) ( ON ?auto_178557 ?auto_178559 ) ( ON-TABLE ?auto_178562 ) ( ON ?auto_178563 ?auto_178562 ) ( ON ?auto_178558 ?auto_178563 ) ( not ( = ?auto_178562 ?auto_178563 ) ) ( not ( = ?auto_178562 ?auto_178558 ) ) ( not ( = ?auto_178562 ?auto_178561 ) ) ( not ( = ?auto_178562 ?auto_178560 ) ) ( not ( = ?auto_178563 ?auto_178558 ) ) ( not ( = ?auto_178563 ?auto_178561 ) ) ( not ( = ?auto_178563 ?auto_178560 ) ) ( not ( = ?auto_178558 ?auto_178561 ) ) ( not ( = ?auto_178558 ?auto_178560 ) ) ( not ( = ?auto_178561 ?auto_178560 ) ) ( not ( = ?auto_178556 ?auto_178561 ) ) ( not ( = ?auto_178556 ?auto_178562 ) ) ( not ( = ?auto_178556 ?auto_178563 ) ) ( not ( = ?auto_178556 ?auto_178558 ) ) ( not ( = ?auto_178559 ?auto_178561 ) ) ( not ( = ?auto_178559 ?auto_178562 ) ) ( not ( = ?auto_178559 ?auto_178563 ) ) ( not ( = ?auto_178559 ?auto_178558 ) ) ( not ( = ?auto_178557 ?auto_178561 ) ) ( not ( = ?auto_178557 ?auto_178562 ) ) ( not ( = ?auto_178557 ?auto_178563 ) ) ( not ( = ?auto_178557 ?auto_178558 ) ) ( ON ?auto_178560 ?auto_178557 ) ( CLEAR ?auto_178558 ) ( ON ?auto_178561 ?auto_178560 ) ( CLEAR ?auto_178561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178556 ?auto_178559 ?auto_178557 ?auto_178560 )
      ( MAKE-1PILE ?auto_178556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178564 - BLOCK
    )
    :vars
    (
      ?auto_178571 - BLOCK
      ?auto_178569 - BLOCK
      ?auto_178570 - BLOCK
      ?auto_178566 - BLOCK
      ?auto_178567 - BLOCK
      ?auto_178568 - BLOCK
      ?auto_178565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178571 ?auto_178564 ) ( ON-TABLE ?auto_178564 ) ( not ( = ?auto_178564 ?auto_178571 ) ) ( not ( = ?auto_178564 ?auto_178569 ) ) ( not ( = ?auto_178564 ?auto_178570 ) ) ( not ( = ?auto_178571 ?auto_178569 ) ) ( not ( = ?auto_178571 ?auto_178570 ) ) ( not ( = ?auto_178569 ?auto_178570 ) ) ( ON ?auto_178569 ?auto_178571 ) ( ON-TABLE ?auto_178566 ) ( ON ?auto_178567 ?auto_178566 ) ( not ( = ?auto_178566 ?auto_178567 ) ) ( not ( = ?auto_178566 ?auto_178568 ) ) ( not ( = ?auto_178566 ?auto_178565 ) ) ( not ( = ?auto_178566 ?auto_178570 ) ) ( not ( = ?auto_178567 ?auto_178568 ) ) ( not ( = ?auto_178567 ?auto_178565 ) ) ( not ( = ?auto_178567 ?auto_178570 ) ) ( not ( = ?auto_178568 ?auto_178565 ) ) ( not ( = ?auto_178568 ?auto_178570 ) ) ( not ( = ?auto_178565 ?auto_178570 ) ) ( not ( = ?auto_178564 ?auto_178565 ) ) ( not ( = ?auto_178564 ?auto_178566 ) ) ( not ( = ?auto_178564 ?auto_178567 ) ) ( not ( = ?auto_178564 ?auto_178568 ) ) ( not ( = ?auto_178571 ?auto_178565 ) ) ( not ( = ?auto_178571 ?auto_178566 ) ) ( not ( = ?auto_178571 ?auto_178567 ) ) ( not ( = ?auto_178571 ?auto_178568 ) ) ( not ( = ?auto_178569 ?auto_178565 ) ) ( not ( = ?auto_178569 ?auto_178566 ) ) ( not ( = ?auto_178569 ?auto_178567 ) ) ( not ( = ?auto_178569 ?auto_178568 ) ) ( ON ?auto_178570 ?auto_178569 ) ( ON ?auto_178565 ?auto_178570 ) ( CLEAR ?auto_178565 ) ( HOLDING ?auto_178568 ) ( CLEAR ?auto_178567 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178566 ?auto_178567 ?auto_178568 )
      ( MAKE-1PILE ?auto_178564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178572 - BLOCK
    )
    :vars
    (
      ?auto_178575 - BLOCK
      ?auto_178579 - BLOCK
      ?auto_178573 - BLOCK
      ?auto_178576 - BLOCK
      ?auto_178577 - BLOCK
      ?auto_178574 - BLOCK
      ?auto_178578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178575 ?auto_178572 ) ( ON-TABLE ?auto_178572 ) ( not ( = ?auto_178572 ?auto_178575 ) ) ( not ( = ?auto_178572 ?auto_178579 ) ) ( not ( = ?auto_178572 ?auto_178573 ) ) ( not ( = ?auto_178575 ?auto_178579 ) ) ( not ( = ?auto_178575 ?auto_178573 ) ) ( not ( = ?auto_178579 ?auto_178573 ) ) ( ON ?auto_178579 ?auto_178575 ) ( ON-TABLE ?auto_178576 ) ( ON ?auto_178577 ?auto_178576 ) ( not ( = ?auto_178576 ?auto_178577 ) ) ( not ( = ?auto_178576 ?auto_178574 ) ) ( not ( = ?auto_178576 ?auto_178578 ) ) ( not ( = ?auto_178576 ?auto_178573 ) ) ( not ( = ?auto_178577 ?auto_178574 ) ) ( not ( = ?auto_178577 ?auto_178578 ) ) ( not ( = ?auto_178577 ?auto_178573 ) ) ( not ( = ?auto_178574 ?auto_178578 ) ) ( not ( = ?auto_178574 ?auto_178573 ) ) ( not ( = ?auto_178578 ?auto_178573 ) ) ( not ( = ?auto_178572 ?auto_178578 ) ) ( not ( = ?auto_178572 ?auto_178576 ) ) ( not ( = ?auto_178572 ?auto_178577 ) ) ( not ( = ?auto_178572 ?auto_178574 ) ) ( not ( = ?auto_178575 ?auto_178578 ) ) ( not ( = ?auto_178575 ?auto_178576 ) ) ( not ( = ?auto_178575 ?auto_178577 ) ) ( not ( = ?auto_178575 ?auto_178574 ) ) ( not ( = ?auto_178579 ?auto_178578 ) ) ( not ( = ?auto_178579 ?auto_178576 ) ) ( not ( = ?auto_178579 ?auto_178577 ) ) ( not ( = ?auto_178579 ?auto_178574 ) ) ( ON ?auto_178573 ?auto_178579 ) ( ON ?auto_178578 ?auto_178573 ) ( CLEAR ?auto_178577 ) ( ON ?auto_178574 ?auto_178578 ) ( CLEAR ?auto_178574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178572 ?auto_178575 ?auto_178579 ?auto_178573 ?auto_178578 )
      ( MAKE-1PILE ?auto_178572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178580 - BLOCK
    )
    :vars
    (
      ?auto_178581 - BLOCK
      ?auto_178582 - BLOCK
      ?auto_178584 - BLOCK
      ?auto_178587 - BLOCK
      ?auto_178583 - BLOCK
      ?auto_178585 - BLOCK
      ?auto_178586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178581 ?auto_178580 ) ( ON-TABLE ?auto_178580 ) ( not ( = ?auto_178580 ?auto_178581 ) ) ( not ( = ?auto_178580 ?auto_178582 ) ) ( not ( = ?auto_178580 ?auto_178584 ) ) ( not ( = ?auto_178581 ?auto_178582 ) ) ( not ( = ?auto_178581 ?auto_178584 ) ) ( not ( = ?auto_178582 ?auto_178584 ) ) ( ON ?auto_178582 ?auto_178581 ) ( ON-TABLE ?auto_178587 ) ( not ( = ?auto_178587 ?auto_178583 ) ) ( not ( = ?auto_178587 ?auto_178585 ) ) ( not ( = ?auto_178587 ?auto_178586 ) ) ( not ( = ?auto_178587 ?auto_178584 ) ) ( not ( = ?auto_178583 ?auto_178585 ) ) ( not ( = ?auto_178583 ?auto_178586 ) ) ( not ( = ?auto_178583 ?auto_178584 ) ) ( not ( = ?auto_178585 ?auto_178586 ) ) ( not ( = ?auto_178585 ?auto_178584 ) ) ( not ( = ?auto_178586 ?auto_178584 ) ) ( not ( = ?auto_178580 ?auto_178586 ) ) ( not ( = ?auto_178580 ?auto_178587 ) ) ( not ( = ?auto_178580 ?auto_178583 ) ) ( not ( = ?auto_178580 ?auto_178585 ) ) ( not ( = ?auto_178581 ?auto_178586 ) ) ( not ( = ?auto_178581 ?auto_178587 ) ) ( not ( = ?auto_178581 ?auto_178583 ) ) ( not ( = ?auto_178581 ?auto_178585 ) ) ( not ( = ?auto_178582 ?auto_178586 ) ) ( not ( = ?auto_178582 ?auto_178587 ) ) ( not ( = ?auto_178582 ?auto_178583 ) ) ( not ( = ?auto_178582 ?auto_178585 ) ) ( ON ?auto_178584 ?auto_178582 ) ( ON ?auto_178586 ?auto_178584 ) ( ON ?auto_178585 ?auto_178586 ) ( CLEAR ?auto_178585 ) ( HOLDING ?auto_178583 ) ( CLEAR ?auto_178587 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178587 ?auto_178583 )
      ( MAKE-1PILE ?auto_178580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178588 - BLOCK
    )
    :vars
    (
      ?auto_178590 - BLOCK
      ?auto_178591 - BLOCK
      ?auto_178595 - BLOCK
      ?auto_178592 - BLOCK
      ?auto_178594 - BLOCK
      ?auto_178593 - BLOCK
      ?auto_178589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178590 ?auto_178588 ) ( ON-TABLE ?auto_178588 ) ( not ( = ?auto_178588 ?auto_178590 ) ) ( not ( = ?auto_178588 ?auto_178591 ) ) ( not ( = ?auto_178588 ?auto_178595 ) ) ( not ( = ?auto_178590 ?auto_178591 ) ) ( not ( = ?auto_178590 ?auto_178595 ) ) ( not ( = ?auto_178591 ?auto_178595 ) ) ( ON ?auto_178591 ?auto_178590 ) ( ON-TABLE ?auto_178592 ) ( not ( = ?auto_178592 ?auto_178594 ) ) ( not ( = ?auto_178592 ?auto_178593 ) ) ( not ( = ?auto_178592 ?auto_178589 ) ) ( not ( = ?auto_178592 ?auto_178595 ) ) ( not ( = ?auto_178594 ?auto_178593 ) ) ( not ( = ?auto_178594 ?auto_178589 ) ) ( not ( = ?auto_178594 ?auto_178595 ) ) ( not ( = ?auto_178593 ?auto_178589 ) ) ( not ( = ?auto_178593 ?auto_178595 ) ) ( not ( = ?auto_178589 ?auto_178595 ) ) ( not ( = ?auto_178588 ?auto_178589 ) ) ( not ( = ?auto_178588 ?auto_178592 ) ) ( not ( = ?auto_178588 ?auto_178594 ) ) ( not ( = ?auto_178588 ?auto_178593 ) ) ( not ( = ?auto_178590 ?auto_178589 ) ) ( not ( = ?auto_178590 ?auto_178592 ) ) ( not ( = ?auto_178590 ?auto_178594 ) ) ( not ( = ?auto_178590 ?auto_178593 ) ) ( not ( = ?auto_178591 ?auto_178589 ) ) ( not ( = ?auto_178591 ?auto_178592 ) ) ( not ( = ?auto_178591 ?auto_178594 ) ) ( not ( = ?auto_178591 ?auto_178593 ) ) ( ON ?auto_178595 ?auto_178591 ) ( ON ?auto_178589 ?auto_178595 ) ( ON ?auto_178593 ?auto_178589 ) ( CLEAR ?auto_178592 ) ( ON ?auto_178594 ?auto_178593 ) ( CLEAR ?auto_178594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178588 ?auto_178590 ?auto_178591 ?auto_178595 ?auto_178589 ?auto_178593 )
      ( MAKE-1PILE ?auto_178588 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178596 - BLOCK
    )
    :vars
    (
      ?auto_178603 - BLOCK
      ?auto_178600 - BLOCK
      ?auto_178602 - BLOCK
      ?auto_178599 - BLOCK
      ?auto_178598 - BLOCK
      ?auto_178597 - BLOCK
      ?auto_178601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178603 ?auto_178596 ) ( ON-TABLE ?auto_178596 ) ( not ( = ?auto_178596 ?auto_178603 ) ) ( not ( = ?auto_178596 ?auto_178600 ) ) ( not ( = ?auto_178596 ?auto_178602 ) ) ( not ( = ?auto_178603 ?auto_178600 ) ) ( not ( = ?auto_178603 ?auto_178602 ) ) ( not ( = ?auto_178600 ?auto_178602 ) ) ( ON ?auto_178600 ?auto_178603 ) ( not ( = ?auto_178599 ?auto_178598 ) ) ( not ( = ?auto_178599 ?auto_178597 ) ) ( not ( = ?auto_178599 ?auto_178601 ) ) ( not ( = ?auto_178599 ?auto_178602 ) ) ( not ( = ?auto_178598 ?auto_178597 ) ) ( not ( = ?auto_178598 ?auto_178601 ) ) ( not ( = ?auto_178598 ?auto_178602 ) ) ( not ( = ?auto_178597 ?auto_178601 ) ) ( not ( = ?auto_178597 ?auto_178602 ) ) ( not ( = ?auto_178601 ?auto_178602 ) ) ( not ( = ?auto_178596 ?auto_178601 ) ) ( not ( = ?auto_178596 ?auto_178599 ) ) ( not ( = ?auto_178596 ?auto_178598 ) ) ( not ( = ?auto_178596 ?auto_178597 ) ) ( not ( = ?auto_178603 ?auto_178601 ) ) ( not ( = ?auto_178603 ?auto_178599 ) ) ( not ( = ?auto_178603 ?auto_178598 ) ) ( not ( = ?auto_178603 ?auto_178597 ) ) ( not ( = ?auto_178600 ?auto_178601 ) ) ( not ( = ?auto_178600 ?auto_178599 ) ) ( not ( = ?auto_178600 ?auto_178598 ) ) ( not ( = ?auto_178600 ?auto_178597 ) ) ( ON ?auto_178602 ?auto_178600 ) ( ON ?auto_178601 ?auto_178602 ) ( ON ?auto_178597 ?auto_178601 ) ( ON ?auto_178598 ?auto_178597 ) ( CLEAR ?auto_178598 ) ( HOLDING ?auto_178599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178599 )
      ( MAKE-1PILE ?auto_178596 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178604 - BLOCK
    )
    :vars
    (
      ?auto_178607 - BLOCK
      ?auto_178605 - BLOCK
      ?auto_178609 - BLOCK
      ?auto_178606 - BLOCK
      ?auto_178608 - BLOCK
      ?auto_178610 - BLOCK
      ?auto_178611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178607 ?auto_178604 ) ( ON-TABLE ?auto_178604 ) ( not ( = ?auto_178604 ?auto_178607 ) ) ( not ( = ?auto_178604 ?auto_178605 ) ) ( not ( = ?auto_178604 ?auto_178609 ) ) ( not ( = ?auto_178607 ?auto_178605 ) ) ( not ( = ?auto_178607 ?auto_178609 ) ) ( not ( = ?auto_178605 ?auto_178609 ) ) ( ON ?auto_178605 ?auto_178607 ) ( not ( = ?auto_178606 ?auto_178608 ) ) ( not ( = ?auto_178606 ?auto_178610 ) ) ( not ( = ?auto_178606 ?auto_178611 ) ) ( not ( = ?auto_178606 ?auto_178609 ) ) ( not ( = ?auto_178608 ?auto_178610 ) ) ( not ( = ?auto_178608 ?auto_178611 ) ) ( not ( = ?auto_178608 ?auto_178609 ) ) ( not ( = ?auto_178610 ?auto_178611 ) ) ( not ( = ?auto_178610 ?auto_178609 ) ) ( not ( = ?auto_178611 ?auto_178609 ) ) ( not ( = ?auto_178604 ?auto_178611 ) ) ( not ( = ?auto_178604 ?auto_178606 ) ) ( not ( = ?auto_178604 ?auto_178608 ) ) ( not ( = ?auto_178604 ?auto_178610 ) ) ( not ( = ?auto_178607 ?auto_178611 ) ) ( not ( = ?auto_178607 ?auto_178606 ) ) ( not ( = ?auto_178607 ?auto_178608 ) ) ( not ( = ?auto_178607 ?auto_178610 ) ) ( not ( = ?auto_178605 ?auto_178611 ) ) ( not ( = ?auto_178605 ?auto_178606 ) ) ( not ( = ?auto_178605 ?auto_178608 ) ) ( not ( = ?auto_178605 ?auto_178610 ) ) ( ON ?auto_178609 ?auto_178605 ) ( ON ?auto_178611 ?auto_178609 ) ( ON ?auto_178610 ?auto_178611 ) ( ON ?auto_178608 ?auto_178610 ) ( ON ?auto_178606 ?auto_178608 ) ( CLEAR ?auto_178606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178604 ?auto_178607 ?auto_178605 ?auto_178609 ?auto_178611 ?auto_178610 ?auto_178608 )
      ( MAKE-1PILE ?auto_178604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178612 - BLOCK
    )
    :vars
    (
      ?auto_178617 - BLOCK
      ?auto_178614 - BLOCK
      ?auto_178618 - BLOCK
      ?auto_178613 - BLOCK
      ?auto_178619 - BLOCK
      ?auto_178615 - BLOCK
      ?auto_178616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178617 ?auto_178612 ) ( ON-TABLE ?auto_178612 ) ( not ( = ?auto_178612 ?auto_178617 ) ) ( not ( = ?auto_178612 ?auto_178614 ) ) ( not ( = ?auto_178612 ?auto_178618 ) ) ( not ( = ?auto_178617 ?auto_178614 ) ) ( not ( = ?auto_178617 ?auto_178618 ) ) ( not ( = ?auto_178614 ?auto_178618 ) ) ( ON ?auto_178614 ?auto_178617 ) ( not ( = ?auto_178613 ?auto_178619 ) ) ( not ( = ?auto_178613 ?auto_178615 ) ) ( not ( = ?auto_178613 ?auto_178616 ) ) ( not ( = ?auto_178613 ?auto_178618 ) ) ( not ( = ?auto_178619 ?auto_178615 ) ) ( not ( = ?auto_178619 ?auto_178616 ) ) ( not ( = ?auto_178619 ?auto_178618 ) ) ( not ( = ?auto_178615 ?auto_178616 ) ) ( not ( = ?auto_178615 ?auto_178618 ) ) ( not ( = ?auto_178616 ?auto_178618 ) ) ( not ( = ?auto_178612 ?auto_178616 ) ) ( not ( = ?auto_178612 ?auto_178613 ) ) ( not ( = ?auto_178612 ?auto_178619 ) ) ( not ( = ?auto_178612 ?auto_178615 ) ) ( not ( = ?auto_178617 ?auto_178616 ) ) ( not ( = ?auto_178617 ?auto_178613 ) ) ( not ( = ?auto_178617 ?auto_178619 ) ) ( not ( = ?auto_178617 ?auto_178615 ) ) ( not ( = ?auto_178614 ?auto_178616 ) ) ( not ( = ?auto_178614 ?auto_178613 ) ) ( not ( = ?auto_178614 ?auto_178619 ) ) ( not ( = ?auto_178614 ?auto_178615 ) ) ( ON ?auto_178618 ?auto_178614 ) ( ON ?auto_178616 ?auto_178618 ) ( ON ?auto_178615 ?auto_178616 ) ( ON ?auto_178619 ?auto_178615 ) ( HOLDING ?auto_178613 ) ( CLEAR ?auto_178619 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178612 ?auto_178617 ?auto_178614 ?auto_178618 ?auto_178616 ?auto_178615 ?auto_178619 ?auto_178613 )
      ( MAKE-1PILE ?auto_178612 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178620 - BLOCK
    )
    :vars
    (
      ?auto_178621 - BLOCK
      ?auto_178623 - BLOCK
      ?auto_178622 - BLOCK
      ?auto_178625 - BLOCK
      ?auto_178627 - BLOCK
      ?auto_178624 - BLOCK
      ?auto_178626 - BLOCK
      ?auto_178628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178621 ?auto_178620 ) ( ON-TABLE ?auto_178620 ) ( not ( = ?auto_178620 ?auto_178621 ) ) ( not ( = ?auto_178620 ?auto_178623 ) ) ( not ( = ?auto_178620 ?auto_178622 ) ) ( not ( = ?auto_178621 ?auto_178623 ) ) ( not ( = ?auto_178621 ?auto_178622 ) ) ( not ( = ?auto_178623 ?auto_178622 ) ) ( ON ?auto_178623 ?auto_178621 ) ( not ( = ?auto_178625 ?auto_178627 ) ) ( not ( = ?auto_178625 ?auto_178624 ) ) ( not ( = ?auto_178625 ?auto_178626 ) ) ( not ( = ?auto_178625 ?auto_178622 ) ) ( not ( = ?auto_178627 ?auto_178624 ) ) ( not ( = ?auto_178627 ?auto_178626 ) ) ( not ( = ?auto_178627 ?auto_178622 ) ) ( not ( = ?auto_178624 ?auto_178626 ) ) ( not ( = ?auto_178624 ?auto_178622 ) ) ( not ( = ?auto_178626 ?auto_178622 ) ) ( not ( = ?auto_178620 ?auto_178626 ) ) ( not ( = ?auto_178620 ?auto_178625 ) ) ( not ( = ?auto_178620 ?auto_178627 ) ) ( not ( = ?auto_178620 ?auto_178624 ) ) ( not ( = ?auto_178621 ?auto_178626 ) ) ( not ( = ?auto_178621 ?auto_178625 ) ) ( not ( = ?auto_178621 ?auto_178627 ) ) ( not ( = ?auto_178621 ?auto_178624 ) ) ( not ( = ?auto_178623 ?auto_178626 ) ) ( not ( = ?auto_178623 ?auto_178625 ) ) ( not ( = ?auto_178623 ?auto_178627 ) ) ( not ( = ?auto_178623 ?auto_178624 ) ) ( ON ?auto_178622 ?auto_178623 ) ( ON ?auto_178626 ?auto_178622 ) ( ON ?auto_178624 ?auto_178626 ) ( ON ?auto_178627 ?auto_178624 ) ( CLEAR ?auto_178627 ) ( ON ?auto_178625 ?auto_178628 ) ( CLEAR ?auto_178625 ) ( HAND-EMPTY ) ( not ( = ?auto_178620 ?auto_178628 ) ) ( not ( = ?auto_178621 ?auto_178628 ) ) ( not ( = ?auto_178623 ?auto_178628 ) ) ( not ( = ?auto_178622 ?auto_178628 ) ) ( not ( = ?auto_178625 ?auto_178628 ) ) ( not ( = ?auto_178627 ?auto_178628 ) ) ( not ( = ?auto_178624 ?auto_178628 ) ) ( not ( = ?auto_178626 ?auto_178628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178625 ?auto_178628 )
      ( MAKE-1PILE ?auto_178620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178629 - BLOCK
    )
    :vars
    (
      ?auto_178637 - BLOCK
      ?auto_178635 - BLOCK
      ?auto_178636 - BLOCK
      ?auto_178632 - BLOCK
      ?auto_178631 - BLOCK
      ?auto_178634 - BLOCK
      ?auto_178633 - BLOCK
      ?auto_178630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178637 ?auto_178629 ) ( ON-TABLE ?auto_178629 ) ( not ( = ?auto_178629 ?auto_178637 ) ) ( not ( = ?auto_178629 ?auto_178635 ) ) ( not ( = ?auto_178629 ?auto_178636 ) ) ( not ( = ?auto_178637 ?auto_178635 ) ) ( not ( = ?auto_178637 ?auto_178636 ) ) ( not ( = ?auto_178635 ?auto_178636 ) ) ( ON ?auto_178635 ?auto_178637 ) ( not ( = ?auto_178632 ?auto_178631 ) ) ( not ( = ?auto_178632 ?auto_178634 ) ) ( not ( = ?auto_178632 ?auto_178633 ) ) ( not ( = ?auto_178632 ?auto_178636 ) ) ( not ( = ?auto_178631 ?auto_178634 ) ) ( not ( = ?auto_178631 ?auto_178633 ) ) ( not ( = ?auto_178631 ?auto_178636 ) ) ( not ( = ?auto_178634 ?auto_178633 ) ) ( not ( = ?auto_178634 ?auto_178636 ) ) ( not ( = ?auto_178633 ?auto_178636 ) ) ( not ( = ?auto_178629 ?auto_178633 ) ) ( not ( = ?auto_178629 ?auto_178632 ) ) ( not ( = ?auto_178629 ?auto_178631 ) ) ( not ( = ?auto_178629 ?auto_178634 ) ) ( not ( = ?auto_178637 ?auto_178633 ) ) ( not ( = ?auto_178637 ?auto_178632 ) ) ( not ( = ?auto_178637 ?auto_178631 ) ) ( not ( = ?auto_178637 ?auto_178634 ) ) ( not ( = ?auto_178635 ?auto_178633 ) ) ( not ( = ?auto_178635 ?auto_178632 ) ) ( not ( = ?auto_178635 ?auto_178631 ) ) ( not ( = ?auto_178635 ?auto_178634 ) ) ( ON ?auto_178636 ?auto_178635 ) ( ON ?auto_178633 ?auto_178636 ) ( ON ?auto_178634 ?auto_178633 ) ( ON ?auto_178632 ?auto_178630 ) ( CLEAR ?auto_178632 ) ( not ( = ?auto_178629 ?auto_178630 ) ) ( not ( = ?auto_178637 ?auto_178630 ) ) ( not ( = ?auto_178635 ?auto_178630 ) ) ( not ( = ?auto_178636 ?auto_178630 ) ) ( not ( = ?auto_178632 ?auto_178630 ) ) ( not ( = ?auto_178631 ?auto_178630 ) ) ( not ( = ?auto_178634 ?auto_178630 ) ) ( not ( = ?auto_178633 ?auto_178630 ) ) ( HOLDING ?auto_178631 ) ( CLEAR ?auto_178634 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178629 ?auto_178637 ?auto_178635 ?auto_178636 ?auto_178633 ?auto_178634 ?auto_178631 )
      ( MAKE-1PILE ?auto_178629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178638 - BLOCK
    )
    :vars
    (
      ?auto_178640 - BLOCK
      ?auto_178639 - BLOCK
      ?auto_178642 - BLOCK
      ?auto_178643 - BLOCK
      ?auto_178644 - BLOCK
      ?auto_178646 - BLOCK
      ?auto_178645 - BLOCK
      ?auto_178641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178640 ?auto_178638 ) ( ON-TABLE ?auto_178638 ) ( not ( = ?auto_178638 ?auto_178640 ) ) ( not ( = ?auto_178638 ?auto_178639 ) ) ( not ( = ?auto_178638 ?auto_178642 ) ) ( not ( = ?auto_178640 ?auto_178639 ) ) ( not ( = ?auto_178640 ?auto_178642 ) ) ( not ( = ?auto_178639 ?auto_178642 ) ) ( ON ?auto_178639 ?auto_178640 ) ( not ( = ?auto_178643 ?auto_178644 ) ) ( not ( = ?auto_178643 ?auto_178646 ) ) ( not ( = ?auto_178643 ?auto_178645 ) ) ( not ( = ?auto_178643 ?auto_178642 ) ) ( not ( = ?auto_178644 ?auto_178646 ) ) ( not ( = ?auto_178644 ?auto_178645 ) ) ( not ( = ?auto_178644 ?auto_178642 ) ) ( not ( = ?auto_178646 ?auto_178645 ) ) ( not ( = ?auto_178646 ?auto_178642 ) ) ( not ( = ?auto_178645 ?auto_178642 ) ) ( not ( = ?auto_178638 ?auto_178645 ) ) ( not ( = ?auto_178638 ?auto_178643 ) ) ( not ( = ?auto_178638 ?auto_178644 ) ) ( not ( = ?auto_178638 ?auto_178646 ) ) ( not ( = ?auto_178640 ?auto_178645 ) ) ( not ( = ?auto_178640 ?auto_178643 ) ) ( not ( = ?auto_178640 ?auto_178644 ) ) ( not ( = ?auto_178640 ?auto_178646 ) ) ( not ( = ?auto_178639 ?auto_178645 ) ) ( not ( = ?auto_178639 ?auto_178643 ) ) ( not ( = ?auto_178639 ?auto_178644 ) ) ( not ( = ?auto_178639 ?auto_178646 ) ) ( ON ?auto_178642 ?auto_178639 ) ( ON ?auto_178645 ?auto_178642 ) ( ON ?auto_178646 ?auto_178645 ) ( ON ?auto_178643 ?auto_178641 ) ( not ( = ?auto_178638 ?auto_178641 ) ) ( not ( = ?auto_178640 ?auto_178641 ) ) ( not ( = ?auto_178639 ?auto_178641 ) ) ( not ( = ?auto_178642 ?auto_178641 ) ) ( not ( = ?auto_178643 ?auto_178641 ) ) ( not ( = ?auto_178644 ?auto_178641 ) ) ( not ( = ?auto_178646 ?auto_178641 ) ) ( not ( = ?auto_178645 ?auto_178641 ) ) ( CLEAR ?auto_178646 ) ( ON ?auto_178644 ?auto_178643 ) ( CLEAR ?auto_178644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178641 ?auto_178643 )
      ( MAKE-1PILE ?auto_178638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178647 - BLOCK
    )
    :vars
    (
      ?auto_178651 - BLOCK
      ?auto_178652 - BLOCK
      ?auto_178650 - BLOCK
      ?auto_178653 - BLOCK
      ?auto_178649 - BLOCK
      ?auto_178654 - BLOCK
      ?auto_178648 - BLOCK
      ?auto_178655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178651 ?auto_178647 ) ( ON-TABLE ?auto_178647 ) ( not ( = ?auto_178647 ?auto_178651 ) ) ( not ( = ?auto_178647 ?auto_178652 ) ) ( not ( = ?auto_178647 ?auto_178650 ) ) ( not ( = ?auto_178651 ?auto_178652 ) ) ( not ( = ?auto_178651 ?auto_178650 ) ) ( not ( = ?auto_178652 ?auto_178650 ) ) ( ON ?auto_178652 ?auto_178651 ) ( not ( = ?auto_178653 ?auto_178649 ) ) ( not ( = ?auto_178653 ?auto_178654 ) ) ( not ( = ?auto_178653 ?auto_178648 ) ) ( not ( = ?auto_178653 ?auto_178650 ) ) ( not ( = ?auto_178649 ?auto_178654 ) ) ( not ( = ?auto_178649 ?auto_178648 ) ) ( not ( = ?auto_178649 ?auto_178650 ) ) ( not ( = ?auto_178654 ?auto_178648 ) ) ( not ( = ?auto_178654 ?auto_178650 ) ) ( not ( = ?auto_178648 ?auto_178650 ) ) ( not ( = ?auto_178647 ?auto_178648 ) ) ( not ( = ?auto_178647 ?auto_178653 ) ) ( not ( = ?auto_178647 ?auto_178649 ) ) ( not ( = ?auto_178647 ?auto_178654 ) ) ( not ( = ?auto_178651 ?auto_178648 ) ) ( not ( = ?auto_178651 ?auto_178653 ) ) ( not ( = ?auto_178651 ?auto_178649 ) ) ( not ( = ?auto_178651 ?auto_178654 ) ) ( not ( = ?auto_178652 ?auto_178648 ) ) ( not ( = ?auto_178652 ?auto_178653 ) ) ( not ( = ?auto_178652 ?auto_178649 ) ) ( not ( = ?auto_178652 ?auto_178654 ) ) ( ON ?auto_178650 ?auto_178652 ) ( ON ?auto_178648 ?auto_178650 ) ( ON ?auto_178653 ?auto_178655 ) ( not ( = ?auto_178647 ?auto_178655 ) ) ( not ( = ?auto_178651 ?auto_178655 ) ) ( not ( = ?auto_178652 ?auto_178655 ) ) ( not ( = ?auto_178650 ?auto_178655 ) ) ( not ( = ?auto_178653 ?auto_178655 ) ) ( not ( = ?auto_178649 ?auto_178655 ) ) ( not ( = ?auto_178654 ?auto_178655 ) ) ( not ( = ?auto_178648 ?auto_178655 ) ) ( ON ?auto_178649 ?auto_178653 ) ( CLEAR ?auto_178649 ) ( ON-TABLE ?auto_178655 ) ( HOLDING ?auto_178654 ) ( CLEAR ?auto_178648 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178647 ?auto_178651 ?auto_178652 ?auto_178650 ?auto_178648 ?auto_178654 )
      ( MAKE-1PILE ?auto_178647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178656 - BLOCK
    )
    :vars
    (
      ?auto_178661 - BLOCK
      ?auto_178664 - BLOCK
      ?auto_178659 - BLOCK
      ?auto_178657 - BLOCK
      ?auto_178658 - BLOCK
      ?auto_178663 - BLOCK
      ?auto_178662 - BLOCK
      ?auto_178660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178661 ?auto_178656 ) ( ON-TABLE ?auto_178656 ) ( not ( = ?auto_178656 ?auto_178661 ) ) ( not ( = ?auto_178656 ?auto_178664 ) ) ( not ( = ?auto_178656 ?auto_178659 ) ) ( not ( = ?auto_178661 ?auto_178664 ) ) ( not ( = ?auto_178661 ?auto_178659 ) ) ( not ( = ?auto_178664 ?auto_178659 ) ) ( ON ?auto_178664 ?auto_178661 ) ( not ( = ?auto_178657 ?auto_178658 ) ) ( not ( = ?auto_178657 ?auto_178663 ) ) ( not ( = ?auto_178657 ?auto_178662 ) ) ( not ( = ?auto_178657 ?auto_178659 ) ) ( not ( = ?auto_178658 ?auto_178663 ) ) ( not ( = ?auto_178658 ?auto_178662 ) ) ( not ( = ?auto_178658 ?auto_178659 ) ) ( not ( = ?auto_178663 ?auto_178662 ) ) ( not ( = ?auto_178663 ?auto_178659 ) ) ( not ( = ?auto_178662 ?auto_178659 ) ) ( not ( = ?auto_178656 ?auto_178662 ) ) ( not ( = ?auto_178656 ?auto_178657 ) ) ( not ( = ?auto_178656 ?auto_178658 ) ) ( not ( = ?auto_178656 ?auto_178663 ) ) ( not ( = ?auto_178661 ?auto_178662 ) ) ( not ( = ?auto_178661 ?auto_178657 ) ) ( not ( = ?auto_178661 ?auto_178658 ) ) ( not ( = ?auto_178661 ?auto_178663 ) ) ( not ( = ?auto_178664 ?auto_178662 ) ) ( not ( = ?auto_178664 ?auto_178657 ) ) ( not ( = ?auto_178664 ?auto_178658 ) ) ( not ( = ?auto_178664 ?auto_178663 ) ) ( ON ?auto_178659 ?auto_178664 ) ( ON ?auto_178662 ?auto_178659 ) ( ON ?auto_178657 ?auto_178660 ) ( not ( = ?auto_178656 ?auto_178660 ) ) ( not ( = ?auto_178661 ?auto_178660 ) ) ( not ( = ?auto_178664 ?auto_178660 ) ) ( not ( = ?auto_178659 ?auto_178660 ) ) ( not ( = ?auto_178657 ?auto_178660 ) ) ( not ( = ?auto_178658 ?auto_178660 ) ) ( not ( = ?auto_178663 ?auto_178660 ) ) ( not ( = ?auto_178662 ?auto_178660 ) ) ( ON ?auto_178658 ?auto_178657 ) ( ON-TABLE ?auto_178660 ) ( CLEAR ?auto_178662 ) ( ON ?auto_178663 ?auto_178658 ) ( CLEAR ?auto_178663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178660 ?auto_178657 ?auto_178658 )
      ( MAKE-1PILE ?auto_178656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178665 - BLOCK
    )
    :vars
    (
      ?auto_178671 - BLOCK
      ?auto_178666 - BLOCK
      ?auto_178667 - BLOCK
      ?auto_178669 - BLOCK
      ?auto_178673 - BLOCK
      ?auto_178670 - BLOCK
      ?auto_178668 - BLOCK
      ?auto_178672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178671 ?auto_178665 ) ( ON-TABLE ?auto_178665 ) ( not ( = ?auto_178665 ?auto_178671 ) ) ( not ( = ?auto_178665 ?auto_178666 ) ) ( not ( = ?auto_178665 ?auto_178667 ) ) ( not ( = ?auto_178671 ?auto_178666 ) ) ( not ( = ?auto_178671 ?auto_178667 ) ) ( not ( = ?auto_178666 ?auto_178667 ) ) ( ON ?auto_178666 ?auto_178671 ) ( not ( = ?auto_178669 ?auto_178673 ) ) ( not ( = ?auto_178669 ?auto_178670 ) ) ( not ( = ?auto_178669 ?auto_178668 ) ) ( not ( = ?auto_178669 ?auto_178667 ) ) ( not ( = ?auto_178673 ?auto_178670 ) ) ( not ( = ?auto_178673 ?auto_178668 ) ) ( not ( = ?auto_178673 ?auto_178667 ) ) ( not ( = ?auto_178670 ?auto_178668 ) ) ( not ( = ?auto_178670 ?auto_178667 ) ) ( not ( = ?auto_178668 ?auto_178667 ) ) ( not ( = ?auto_178665 ?auto_178668 ) ) ( not ( = ?auto_178665 ?auto_178669 ) ) ( not ( = ?auto_178665 ?auto_178673 ) ) ( not ( = ?auto_178665 ?auto_178670 ) ) ( not ( = ?auto_178671 ?auto_178668 ) ) ( not ( = ?auto_178671 ?auto_178669 ) ) ( not ( = ?auto_178671 ?auto_178673 ) ) ( not ( = ?auto_178671 ?auto_178670 ) ) ( not ( = ?auto_178666 ?auto_178668 ) ) ( not ( = ?auto_178666 ?auto_178669 ) ) ( not ( = ?auto_178666 ?auto_178673 ) ) ( not ( = ?auto_178666 ?auto_178670 ) ) ( ON ?auto_178667 ?auto_178666 ) ( ON ?auto_178669 ?auto_178672 ) ( not ( = ?auto_178665 ?auto_178672 ) ) ( not ( = ?auto_178671 ?auto_178672 ) ) ( not ( = ?auto_178666 ?auto_178672 ) ) ( not ( = ?auto_178667 ?auto_178672 ) ) ( not ( = ?auto_178669 ?auto_178672 ) ) ( not ( = ?auto_178673 ?auto_178672 ) ) ( not ( = ?auto_178670 ?auto_178672 ) ) ( not ( = ?auto_178668 ?auto_178672 ) ) ( ON ?auto_178673 ?auto_178669 ) ( ON-TABLE ?auto_178672 ) ( ON ?auto_178670 ?auto_178673 ) ( CLEAR ?auto_178670 ) ( HOLDING ?auto_178668 ) ( CLEAR ?auto_178667 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178665 ?auto_178671 ?auto_178666 ?auto_178667 ?auto_178668 )
      ( MAKE-1PILE ?auto_178665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178674 - BLOCK
    )
    :vars
    (
      ?auto_178677 - BLOCK
      ?auto_178682 - BLOCK
      ?auto_178678 - BLOCK
      ?auto_178675 - BLOCK
      ?auto_178681 - BLOCK
      ?auto_178676 - BLOCK
      ?auto_178680 - BLOCK
      ?auto_178679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178677 ?auto_178674 ) ( ON-TABLE ?auto_178674 ) ( not ( = ?auto_178674 ?auto_178677 ) ) ( not ( = ?auto_178674 ?auto_178682 ) ) ( not ( = ?auto_178674 ?auto_178678 ) ) ( not ( = ?auto_178677 ?auto_178682 ) ) ( not ( = ?auto_178677 ?auto_178678 ) ) ( not ( = ?auto_178682 ?auto_178678 ) ) ( ON ?auto_178682 ?auto_178677 ) ( not ( = ?auto_178675 ?auto_178681 ) ) ( not ( = ?auto_178675 ?auto_178676 ) ) ( not ( = ?auto_178675 ?auto_178680 ) ) ( not ( = ?auto_178675 ?auto_178678 ) ) ( not ( = ?auto_178681 ?auto_178676 ) ) ( not ( = ?auto_178681 ?auto_178680 ) ) ( not ( = ?auto_178681 ?auto_178678 ) ) ( not ( = ?auto_178676 ?auto_178680 ) ) ( not ( = ?auto_178676 ?auto_178678 ) ) ( not ( = ?auto_178680 ?auto_178678 ) ) ( not ( = ?auto_178674 ?auto_178680 ) ) ( not ( = ?auto_178674 ?auto_178675 ) ) ( not ( = ?auto_178674 ?auto_178681 ) ) ( not ( = ?auto_178674 ?auto_178676 ) ) ( not ( = ?auto_178677 ?auto_178680 ) ) ( not ( = ?auto_178677 ?auto_178675 ) ) ( not ( = ?auto_178677 ?auto_178681 ) ) ( not ( = ?auto_178677 ?auto_178676 ) ) ( not ( = ?auto_178682 ?auto_178680 ) ) ( not ( = ?auto_178682 ?auto_178675 ) ) ( not ( = ?auto_178682 ?auto_178681 ) ) ( not ( = ?auto_178682 ?auto_178676 ) ) ( ON ?auto_178678 ?auto_178682 ) ( ON ?auto_178675 ?auto_178679 ) ( not ( = ?auto_178674 ?auto_178679 ) ) ( not ( = ?auto_178677 ?auto_178679 ) ) ( not ( = ?auto_178682 ?auto_178679 ) ) ( not ( = ?auto_178678 ?auto_178679 ) ) ( not ( = ?auto_178675 ?auto_178679 ) ) ( not ( = ?auto_178681 ?auto_178679 ) ) ( not ( = ?auto_178676 ?auto_178679 ) ) ( not ( = ?auto_178680 ?auto_178679 ) ) ( ON ?auto_178681 ?auto_178675 ) ( ON-TABLE ?auto_178679 ) ( ON ?auto_178676 ?auto_178681 ) ( CLEAR ?auto_178678 ) ( ON ?auto_178680 ?auto_178676 ) ( CLEAR ?auto_178680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178679 ?auto_178675 ?auto_178681 ?auto_178676 )
      ( MAKE-1PILE ?auto_178674 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178683 - BLOCK
    )
    :vars
    (
      ?auto_178684 - BLOCK
      ?auto_178687 - BLOCK
      ?auto_178689 - BLOCK
      ?auto_178690 - BLOCK
      ?auto_178688 - BLOCK
      ?auto_178686 - BLOCK
      ?auto_178685 - BLOCK
      ?auto_178691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178684 ?auto_178683 ) ( ON-TABLE ?auto_178683 ) ( not ( = ?auto_178683 ?auto_178684 ) ) ( not ( = ?auto_178683 ?auto_178687 ) ) ( not ( = ?auto_178683 ?auto_178689 ) ) ( not ( = ?auto_178684 ?auto_178687 ) ) ( not ( = ?auto_178684 ?auto_178689 ) ) ( not ( = ?auto_178687 ?auto_178689 ) ) ( ON ?auto_178687 ?auto_178684 ) ( not ( = ?auto_178690 ?auto_178688 ) ) ( not ( = ?auto_178690 ?auto_178686 ) ) ( not ( = ?auto_178690 ?auto_178685 ) ) ( not ( = ?auto_178690 ?auto_178689 ) ) ( not ( = ?auto_178688 ?auto_178686 ) ) ( not ( = ?auto_178688 ?auto_178685 ) ) ( not ( = ?auto_178688 ?auto_178689 ) ) ( not ( = ?auto_178686 ?auto_178685 ) ) ( not ( = ?auto_178686 ?auto_178689 ) ) ( not ( = ?auto_178685 ?auto_178689 ) ) ( not ( = ?auto_178683 ?auto_178685 ) ) ( not ( = ?auto_178683 ?auto_178690 ) ) ( not ( = ?auto_178683 ?auto_178688 ) ) ( not ( = ?auto_178683 ?auto_178686 ) ) ( not ( = ?auto_178684 ?auto_178685 ) ) ( not ( = ?auto_178684 ?auto_178690 ) ) ( not ( = ?auto_178684 ?auto_178688 ) ) ( not ( = ?auto_178684 ?auto_178686 ) ) ( not ( = ?auto_178687 ?auto_178685 ) ) ( not ( = ?auto_178687 ?auto_178690 ) ) ( not ( = ?auto_178687 ?auto_178688 ) ) ( not ( = ?auto_178687 ?auto_178686 ) ) ( ON ?auto_178690 ?auto_178691 ) ( not ( = ?auto_178683 ?auto_178691 ) ) ( not ( = ?auto_178684 ?auto_178691 ) ) ( not ( = ?auto_178687 ?auto_178691 ) ) ( not ( = ?auto_178689 ?auto_178691 ) ) ( not ( = ?auto_178690 ?auto_178691 ) ) ( not ( = ?auto_178688 ?auto_178691 ) ) ( not ( = ?auto_178686 ?auto_178691 ) ) ( not ( = ?auto_178685 ?auto_178691 ) ) ( ON ?auto_178688 ?auto_178690 ) ( ON-TABLE ?auto_178691 ) ( ON ?auto_178686 ?auto_178688 ) ( ON ?auto_178685 ?auto_178686 ) ( CLEAR ?auto_178685 ) ( HOLDING ?auto_178689 ) ( CLEAR ?auto_178687 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178683 ?auto_178684 ?auto_178687 ?auto_178689 )
      ( MAKE-1PILE ?auto_178683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178692 - BLOCK
    )
    :vars
    (
      ?auto_178697 - BLOCK
      ?auto_178694 - BLOCK
      ?auto_178696 - BLOCK
      ?auto_178698 - BLOCK
      ?auto_178699 - BLOCK
      ?auto_178695 - BLOCK
      ?auto_178693 - BLOCK
      ?auto_178700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178697 ?auto_178692 ) ( ON-TABLE ?auto_178692 ) ( not ( = ?auto_178692 ?auto_178697 ) ) ( not ( = ?auto_178692 ?auto_178694 ) ) ( not ( = ?auto_178692 ?auto_178696 ) ) ( not ( = ?auto_178697 ?auto_178694 ) ) ( not ( = ?auto_178697 ?auto_178696 ) ) ( not ( = ?auto_178694 ?auto_178696 ) ) ( ON ?auto_178694 ?auto_178697 ) ( not ( = ?auto_178698 ?auto_178699 ) ) ( not ( = ?auto_178698 ?auto_178695 ) ) ( not ( = ?auto_178698 ?auto_178693 ) ) ( not ( = ?auto_178698 ?auto_178696 ) ) ( not ( = ?auto_178699 ?auto_178695 ) ) ( not ( = ?auto_178699 ?auto_178693 ) ) ( not ( = ?auto_178699 ?auto_178696 ) ) ( not ( = ?auto_178695 ?auto_178693 ) ) ( not ( = ?auto_178695 ?auto_178696 ) ) ( not ( = ?auto_178693 ?auto_178696 ) ) ( not ( = ?auto_178692 ?auto_178693 ) ) ( not ( = ?auto_178692 ?auto_178698 ) ) ( not ( = ?auto_178692 ?auto_178699 ) ) ( not ( = ?auto_178692 ?auto_178695 ) ) ( not ( = ?auto_178697 ?auto_178693 ) ) ( not ( = ?auto_178697 ?auto_178698 ) ) ( not ( = ?auto_178697 ?auto_178699 ) ) ( not ( = ?auto_178697 ?auto_178695 ) ) ( not ( = ?auto_178694 ?auto_178693 ) ) ( not ( = ?auto_178694 ?auto_178698 ) ) ( not ( = ?auto_178694 ?auto_178699 ) ) ( not ( = ?auto_178694 ?auto_178695 ) ) ( ON ?auto_178698 ?auto_178700 ) ( not ( = ?auto_178692 ?auto_178700 ) ) ( not ( = ?auto_178697 ?auto_178700 ) ) ( not ( = ?auto_178694 ?auto_178700 ) ) ( not ( = ?auto_178696 ?auto_178700 ) ) ( not ( = ?auto_178698 ?auto_178700 ) ) ( not ( = ?auto_178699 ?auto_178700 ) ) ( not ( = ?auto_178695 ?auto_178700 ) ) ( not ( = ?auto_178693 ?auto_178700 ) ) ( ON ?auto_178699 ?auto_178698 ) ( ON-TABLE ?auto_178700 ) ( ON ?auto_178695 ?auto_178699 ) ( ON ?auto_178693 ?auto_178695 ) ( CLEAR ?auto_178694 ) ( ON ?auto_178696 ?auto_178693 ) ( CLEAR ?auto_178696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178700 ?auto_178698 ?auto_178699 ?auto_178695 ?auto_178693 )
      ( MAKE-1PILE ?auto_178692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178701 - BLOCK
    )
    :vars
    (
      ?auto_178704 - BLOCK
      ?auto_178706 - BLOCK
      ?auto_178703 - BLOCK
      ?auto_178705 - BLOCK
      ?auto_178702 - BLOCK
      ?auto_178708 - BLOCK
      ?auto_178709 - BLOCK
      ?auto_178707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178704 ?auto_178701 ) ( ON-TABLE ?auto_178701 ) ( not ( = ?auto_178701 ?auto_178704 ) ) ( not ( = ?auto_178701 ?auto_178706 ) ) ( not ( = ?auto_178701 ?auto_178703 ) ) ( not ( = ?auto_178704 ?auto_178706 ) ) ( not ( = ?auto_178704 ?auto_178703 ) ) ( not ( = ?auto_178706 ?auto_178703 ) ) ( not ( = ?auto_178705 ?auto_178702 ) ) ( not ( = ?auto_178705 ?auto_178708 ) ) ( not ( = ?auto_178705 ?auto_178709 ) ) ( not ( = ?auto_178705 ?auto_178703 ) ) ( not ( = ?auto_178702 ?auto_178708 ) ) ( not ( = ?auto_178702 ?auto_178709 ) ) ( not ( = ?auto_178702 ?auto_178703 ) ) ( not ( = ?auto_178708 ?auto_178709 ) ) ( not ( = ?auto_178708 ?auto_178703 ) ) ( not ( = ?auto_178709 ?auto_178703 ) ) ( not ( = ?auto_178701 ?auto_178709 ) ) ( not ( = ?auto_178701 ?auto_178705 ) ) ( not ( = ?auto_178701 ?auto_178702 ) ) ( not ( = ?auto_178701 ?auto_178708 ) ) ( not ( = ?auto_178704 ?auto_178709 ) ) ( not ( = ?auto_178704 ?auto_178705 ) ) ( not ( = ?auto_178704 ?auto_178702 ) ) ( not ( = ?auto_178704 ?auto_178708 ) ) ( not ( = ?auto_178706 ?auto_178709 ) ) ( not ( = ?auto_178706 ?auto_178705 ) ) ( not ( = ?auto_178706 ?auto_178702 ) ) ( not ( = ?auto_178706 ?auto_178708 ) ) ( ON ?auto_178705 ?auto_178707 ) ( not ( = ?auto_178701 ?auto_178707 ) ) ( not ( = ?auto_178704 ?auto_178707 ) ) ( not ( = ?auto_178706 ?auto_178707 ) ) ( not ( = ?auto_178703 ?auto_178707 ) ) ( not ( = ?auto_178705 ?auto_178707 ) ) ( not ( = ?auto_178702 ?auto_178707 ) ) ( not ( = ?auto_178708 ?auto_178707 ) ) ( not ( = ?auto_178709 ?auto_178707 ) ) ( ON ?auto_178702 ?auto_178705 ) ( ON-TABLE ?auto_178707 ) ( ON ?auto_178708 ?auto_178702 ) ( ON ?auto_178709 ?auto_178708 ) ( ON ?auto_178703 ?auto_178709 ) ( CLEAR ?auto_178703 ) ( HOLDING ?auto_178706 ) ( CLEAR ?auto_178704 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178701 ?auto_178704 ?auto_178706 )
      ( MAKE-1PILE ?auto_178701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178710 - BLOCK
    )
    :vars
    (
      ?auto_178717 - BLOCK
      ?auto_178716 - BLOCK
      ?auto_178718 - BLOCK
      ?auto_178713 - BLOCK
      ?auto_178715 - BLOCK
      ?auto_178711 - BLOCK
      ?auto_178712 - BLOCK
      ?auto_178714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_178717 ?auto_178710 ) ( ON-TABLE ?auto_178710 ) ( not ( = ?auto_178710 ?auto_178717 ) ) ( not ( = ?auto_178710 ?auto_178716 ) ) ( not ( = ?auto_178710 ?auto_178718 ) ) ( not ( = ?auto_178717 ?auto_178716 ) ) ( not ( = ?auto_178717 ?auto_178718 ) ) ( not ( = ?auto_178716 ?auto_178718 ) ) ( not ( = ?auto_178713 ?auto_178715 ) ) ( not ( = ?auto_178713 ?auto_178711 ) ) ( not ( = ?auto_178713 ?auto_178712 ) ) ( not ( = ?auto_178713 ?auto_178718 ) ) ( not ( = ?auto_178715 ?auto_178711 ) ) ( not ( = ?auto_178715 ?auto_178712 ) ) ( not ( = ?auto_178715 ?auto_178718 ) ) ( not ( = ?auto_178711 ?auto_178712 ) ) ( not ( = ?auto_178711 ?auto_178718 ) ) ( not ( = ?auto_178712 ?auto_178718 ) ) ( not ( = ?auto_178710 ?auto_178712 ) ) ( not ( = ?auto_178710 ?auto_178713 ) ) ( not ( = ?auto_178710 ?auto_178715 ) ) ( not ( = ?auto_178710 ?auto_178711 ) ) ( not ( = ?auto_178717 ?auto_178712 ) ) ( not ( = ?auto_178717 ?auto_178713 ) ) ( not ( = ?auto_178717 ?auto_178715 ) ) ( not ( = ?auto_178717 ?auto_178711 ) ) ( not ( = ?auto_178716 ?auto_178712 ) ) ( not ( = ?auto_178716 ?auto_178713 ) ) ( not ( = ?auto_178716 ?auto_178715 ) ) ( not ( = ?auto_178716 ?auto_178711 ) ) ( ON ?auto_178713 ?auto_178714 ) ( not ( = ?auto_178710 ?auto_178714 ) ) ( not ( = ?auto_178717 ?auto_178714 ) ) ( not ( = ?auto_178716 ?auto_178714 ) ) ( not ( = ?auto_178718 ?auto_178714 ) ) ( not ( = ?auto_178713 ?auto_178714 ) ) ( not ( = ?auto_178715 ?auto_178714 ) ) ( not ( = ?auto_178711 ?auto_178714 ) ) ( not ( = ?auto_178712 ?auto_178714 ) ) ( ON ?auto_178715 ?auto_178713 ) ( ON-TABLE ?auto_178714 ) ( ON ?auto_178711 ?auto_178715 ) ( ON ?auto_178712 ?auto_178711 ) ( ON ?auto_178718 ?auto_178712 ) ( CLEAR ?auto_178717 ) ( ON ?auto_178716 ?auto_178718 ) ( CLEAR ?auto_178716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178714 ?auto_178713 ?auto_178715 ?auto_178711 ?auto_178712 ?auto_178718 )
      ( MAKE-1PILE ?auto_178710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178737 - BLOCK
    )
    :vars
    (
      ?auto_178740 - BLOCK
      ?auto_178738 - BLOCK
      ?auto_178742 - BLOCK
      ?auto_178741 - BLOCK
      ?auto_178745 - BLOCK
      ?auto_178743 - BLOCK
      ?auto_178744 - BLOCK
      ?auto_178739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178737 ?auto_178740 ) ) ( not ( = ?auto_178737 ?auto_178738 ) ) ( not ( = ?auto_178737 ?auto_178742 ) ) ( not ( = ?auto_178740 ?auto_178738 ) ) ( not ( = ?auto_178740 ?auto_178742 ) ) ( not ( = ?auto_178738 ?auto_178742 ) ) ( not ( = ?auto_178741 ?auto_178745 ) ) ( not ( = ?auto_178741 ?auto_178743 ) ) ( not ( = ?auto_178741 ?auto_178744 ) ) ( not ( = ?auto_178741 ?auto_178742 ) ) ( not ( = ?auto_178745 ?auto_178743 ) ) ( not ( = ?auto_178745 ?auto_178744 ) ) ( not ( = ?auto_178745 ?auto_178742 ) ) ( not ( = ?auto_178743 ?auto_178744 ) ) ( not ( = ?auto_178743 ?auto_178742 ) ) ( not ( = ?auto_178744 ?auto_178742 ) ) ( not ( = ?auto_178737 ?auto_178744 ) ) ( not ( = ?auto_178737 ?auto_178741 ) ) ( not ( = ?auto_178737 ?auto_178745 ) ) ( not ( = ?auto_178737 ?auto_178743 ) ) ( not ( = ?auto_178740 ?auto_178744 ) ) ( not ( = ?auto_178740 ?auto_178741 ) ) ( not ( = ?auto_178740 ?auto_178745 ) ) ( not ( = ?auto_178740 ?auto_178743 ) ) ( not ( = ?auto_178738 ?auto_178744 ) ) ( not ( = ?auto_178738 ?auto_178741 ) ) ( not ( = ?auto_178738 ?auto_178745 ) ) ( not ( = ?auto_178738 ?auto_178743 ) ) ( ON ?auto_178741 ?auto_178739 ) ( not ( = ?auto_178737 ?auto_178739 ) ) ( not ( = ?auto_178740 ?auto_178739 ) ) ( not ( = ?auto_178738 ?auto_178739 ) ) ( not ( = ?auto_178742 ?auto_178739 ) ) ( not ( = ?auto_178741 ?auto_178739 ) ) ( not ( = ?auto_178745 ?auto_178739 ) ) ( not ( = ?auto_178743 ?auto_178739 ) ) ( not ( = ?auto_178744 ?auto_178739 ) ) ( ON ?auto_178745 ?auto_178741 ) ( ON-TABLE ?auto_178739 ) ( ON ?auto_178743 ?auto_178745 ) ( ON ?auto_178744 ?auto_178743 ) ( ON ?auto_178742 ?auto_178744 ) ( ON ?auto_178738 ?auto_178742 ) ( ON ?auto_178740 ?auto_178738 ) ( CLEAR ?auto_178740 ) ( HOLDING ?auto_178737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178737 ?auto_178740 )
      ( MAKE-1PILE ?auto_178737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_178746 - BLOCK
    )
    :vars
    (
      ?auto_178754 - BLOCK
      ?auto_178750 - BLOCK
      ?auto_178752 - BLOCK
      ?auto_178751 - BLOCK
      ?auto_178748 - BLOCK
      ?auto_178749 - BLOCK
      ?auto_178747 - BLOCK
      ?auto_178753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178746 ?auto_178754 ) ) ( not ( = ?auto_178746 ?auto_178750 ) ) ( not ( = ?auto_178746 ?auto_178752 ) ) ( not ( = ?auto_178754 ?auto_178750 ) ) ( not ( = ?auto_178754 ?auto_178752 ) ) ( not ( = ?auto_178750 ?auto_178752 ) ) ( not ( = ?auto_178751 ?auto_178748 ) ) ( not ( = ?auto_178751 ?auto_178749 ) ) ( not ( = ?auto_178751 ?auto_178747 ) ) ( not ( = ?auto_178751 ?auto_178752 ) ) ( not ( = ?auto_178748 ?auto_178749 ) ) ( not ( = ?auto_178748 ?auto_178747 ) ) ( not ( = ?auto_178748 ?auto_178752 ) ) ( not ( = ?auto_178749 ?auto_178747 ) ) ( not ( = ?auto_178749 ?auto_178752 ) ) ( not ( = ?auto_178747 ?auto_178752 ) ) ( not ( = ?auto_178746 ?auto_178747 ) ) ( not ( = ?auto_178746 ?auto_178751 ) ) ( not ( = ?auto_178746 ?auto_178748 ) ) ( not ( = ?auto_178746 ?auto_178749 ) ) ( not ( = ?auto_178754 ?auto_178747 ) ) ( not ( = ?auto_178754 ?auto_178751 ) ) ( not ( = ?auto_178754 ?auto_178748 ) ) ( not ( = ?auto_178754 ?auto_178749 ) ) ( not ( = ?auto_178750 ?auto_178747 ) ) ( not ( = ?auto_178750 ?auto_178751 ) ) ( not ( = ?auto_178750 ?auto_178748 ) ) ( not ( = ?auto_178750 ?auto_178749 ) ) ( ON ?auto_178751 ?auto_178753 ) ( not ( = ?auto_178746 ?auto_178753 ) ) ( not ( = ?auto_178754 ?auto_178753 ) ) ( not ( = ?auto_178750 ?auto_178753 ) ) ( not ( = ?auto_178752 ?auto_178753 ) ) ( not ( = ?auto_178751 ?auto_178753 ) ) ( not ( = ?auto_178748 ?auto_178753 ) ) ( not ( = ?auto_178749 ?auto_178753 ) ) ( not ( = ?auto_178747 ?auto_178753 ) ) ( ON ?auto_178748 ?auto_178751 ) ( ON-TABLE ?auto_178753 ) ( ON ?auto_178749 ?auto_178748 ) ( ON ?auto_178747 ?auto_178749 ) ( ON ?auto_178752 ?auto_178747 ) ( ON ?auto_178750 ?auto_178752 ) ( ON ?auto_178754 ?auto_178750 ) ( ON ?auto_178746 ?auto_178754 ) ( CLEAR ?auto_178746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178753 ?auto_178751 ?auto_178748 ?auto_178749 ?auto_178747 ?auto_178752 ?auto_178750 ?auto_178754 )
      ( MAKE-1PILE ?auto_178746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178762 - BLOCK
      ?auto_178763 - BLOCK
      ?auto_178764 - BLOCK
      ?auto_178765 - BLOCK
      ?auto_178766 - BLOCK
      ?auto_178767 - BLOCK
      ?auto_178768 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_178768 ) ( CLEAR ?auto_178767 ) ( ON-TABLE ?auto_178762 ) ( ON ?auto_178763 ?auto_178762 ) ( ON ?auto_178764 ?auto_178763 ) ( ON ?auto_178765 ?auto_178764 ) ( ON ?auto_178766 ?auto_178765 ) ( ON ?auto_178767 ?auto_178766 ) ( not ( = ?auto_178762 ?auto_178763 ) ) ( not ( = ?auto_178762 ?auto_178764 ) ) ( not ( = ?auto_178762 ?auto_178765 ) ) ( not ( = ?auto_178762 ?auto_178766 ) ) ( not ( = ?auto_178762 ?auto_178767 ) ) ( not ( = ?auto_178762 ?auto_178768 ) ) ( not ( = ?auto_178763 ?auto_178764 ) ) ( not ( = ?auto_178763 ?auto_178765 ) ) ( not ( = ?auto_178763 ?auto_178766 ) ) ( not ( = ?auto_178763 ?auto_178767 ) ) ( not ( = ?auto_178763 ?auto_178768 ) ) ( not ( = ?auto_178764 ?auto_178765 ) ) ( not ( = ?auto_178764 ?auto_178766 ) ) ( not ( = ?auto_178764 ?auto_178767 ) ) ( not ( = ?auto_178764 ?auto_178768 ) ) ( not ( = ?auto_178765 ?auto_178766 ) ) ( not ( = ?auto_178765 ?auto_178767 ) ) ( not ( = ?auto_178765 ?auto_178768 ) ) ( not ( = ?auto_178766 ?auto_178767 ) ) ( not ( = ?auto_178766 ?auto_178768 ) ) ( not ( = ?auto_178767 ?auto_178768 ) ) )
    :subtasks
    ( ( !STACK ?auto_178768 ?auto_178767 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178769 - BLOCK
      ?auto_178770 - BLOCK
      ?auto_178771 - BLOCK
      ?auto_178772 - BLOCK
      ?auto_178773 - BLOCK
      ?auto_178774 - BLOCK
      ?auto_178775 - BLOCK
    )
    :vars
    (
      ?auto_178776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_178774 ) ( ON-TABLE ?auto_178769 ) ( ON ?auto_178770 ?auto_178769 ) ( ON ?auto_178771 ?auto_178770 ) ( ON ?auto_178772 ?auto_178771 ) ( ON ?auto_178773 ?auto_178772 ) ( ON ?auto_178774 ?auto_178773 ) ( not ( = ?auto_178769 ?auto_178770 ) ) ( not ( = ?auto_178769 ?auto_178771 ) ) ( not ( = ?auto_178769 ?auto_178772 ) ) ( not ( = ?auto_178769 ?auto_178773 ) ) ( not ( = ?auto_178769 ?auto_178774 ) ) ( not ( = ?auto_178769 ?auto_178775 ) ) ( not ( = ?auto_178770 ?auto_178771 ) ) ( not ( = ?auto_178770 ?auto_178772 ) ) ( not ( = ?auto_178770 ?auto_178773 ) ) ( not ( = ?auto_178770 ?auto_178774 ) ) ( not ( = ?auto_178770 ?auto_178775 ) ) ( not ( = ?auto_178771 ?auto_178772 ) ) ( not ( = ?auto_178771 ?auto_178773 ) ) ( not ( = ?auto_178771 ?auto_178774 ) ) ( not ( = ?auto_178771 ?auto_178775 ) ) ( not ( = ?auto_178772 ?auto_178773 ) ) ( not ( = ?auto_178772 ?auto_178774 ) ) ( not ( = ?auto_178772 ?auto_178775 ) ) ( not ( = ?auto_178773 ?auto_178774 ) ) ( not ( = ?auto_178773 ?auto_178775 ) ) ( not ( = ?auto_178774 ?auto_178775 ) ) ( ON ?auto_178775 ?auto_178776 ) ( CLEAR ?auto_178775 ) ( HAND-EMPTY ) ( not ( = ?auto_178769 ?auto_178776 ) ) ( not ( = ?auto_178770 ?auto_178776 ) ) ( not ( = ?auto_178771 ?auto_178776 ) ) ( not ( = ?auto_178772 ?auto_178776 ) ) ( not ( = ?auto_178773 ?auto_178776 ) ) ( not ( = ?auto_178774 ?auto_178776 ) ) ( not ( = ?auto_178775 ?auto_178776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178775 ?auto_178776 )
      ( MAKE-7PILE ?auto_178769 ?auto_178770 ?auto_178771 ?auto_178772 ?auto_178773 ?auto_178774 ?auto_178775 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178777 - BLOCK
      ?auto_178778 - BLOCK
      ?auto_178779 - BLOCK
      ?auto_178780 - BLOCK
      ?auto_178781 - BLOCK
      ?auto_178782 - BLOCK
      ?auto_178783 - BLOCK
    )
    :vars
    (
      ?auto_178784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178777 ) ( ON ?auto_178778 ?auto_178777 ) ( ON ?auto_178779 ?auto_178778 ) ( ON ?auto_178780 ?auto_178779 ) ( ON ?auto_178781 ?auto_178780 ) ( not ( = ?auto_178777 ?auto_178778 ) ) ( not ( = ?auto_178777 ?auto_178779 ) ) ( not ( = ?auto_178777 ?auto_178780 ) ) ( not ( = ?auto_178777 ?auto_178781 ) ) ( not ( = ?auto_178777 ?auto_178782 ) ) ( not ( = ?auto_178777 ?auto_178783 ) ) ( not ( = ?auto_178778 ?auto_178779 ) ) ( not ( = ?auto_178778 ?auto_178780 ) ) ( not ( = ?auto_178778 ?auto_178781 ) ) ( not ( = ?auto_178778 ?auto_178782 ) ) ( not ( = ?auto_178778 ?auto_178783 ) ) ( not ( = ?auto_178779 ?auto_178780 ) ) ( not ( = ?auto_178779 ?auto_178781 ) ) ( not ( = ?auto_178779 ?auto_178782 ) ) ( not ( = ?auto_178779 ?auto_178783 ) ) ( not ( = ?auto_178780 ?auto_178781 ) ) ( not ( = ?auto_178780 ?auto_178782 ) ) ( not ( = ?auto_178780 ?auto_178783 ) ) ( not ( = ?auto_178781 ?auto_178782 ) ) ( not ( = ?auto_178781 ?auto_178783 ) ) ( not ( = ?auto_178782 ?auto_178783 ) ) ( ON ?auto_178783 ?auto_178784 ) ( CLEAR ?auto_178783 ) ( not ( = ?auto_178777 ?auto_178784 ) ) ( not ( = ?auto_178778 ?auto_178784 ) ) ( not ( = ?auto_178779 ?auto_178784 ) ) ( not ( = ?auto_178780 ?auto_178784 ) ) ( not ( = ?auto_178781 ?auto_178784 ) ) ( not ( = ?auto_178782 ?auto_178784 ) ) ( not ( = ?auto_178783 ?auto_178784 ) ) ( HOLDING ?auto_178782 ) ( CLEAR ?auto_178781 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178777 ?auto_178778 ?auto_178779 ?auto_178780 ?auto_178781 ?auto_178782 )
      ( MAKE-7PILE ?auto_178777 ?auto_178778 ?auto_178779 ?auto_178780 ?auto_178781 ?auto_178782 ?auto_178783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178785 - BLOCK
      ?auto_178786 - BLOCK
      ?auto_178787 - BLOCK
      ?auto_178788 - BLOCK
      ?auto_178789 - BLOCK
      ?auto_178790 - BLOCK
      ?auto_178791 - BLOCK
    )
    :vars
    (
      ?auto_178792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178785 ) ( ON ?auto_178786 ?auto_178785 ) ( ON ?auto_178787 ?auto_178786 ) ( ON ?auto_178788 ?auto_178787 ) ( ON ?auto_178789 ?auto_178788 ) ( not ( = ?auto_178785 ?auto_178786 ) ) ( not ( = ?auto_178785 ?auto_178787 ) ) ( not ( = ?auto_178785 ?auto_178788 ) ) ( not ( = ?auto_178785 ?auto_178789 ) ) ( not ( = ?auto_178785 ?auto_178790 ) ) ( not ( = ?auto_178785 ?auto_178791 ) ) ( not ( = ?auto_178786 ?auto_178787 ) ) ( not ( = ?auto_178786 ?auto_178788 ) ) ( not ( = ?auto_178786 ?auto_178789 ) ) ( not ( = ?auto_178786 ?auto_178790 ) ) ( not ( = ?auto_178786 ?auto_178791 ) ) ( not ( = ?auto_178787 ?auto_178788 ) ) ( not ( = ?auto_178787 ?auto_178789 ) ) ( not ( = ?auto_178787 ?auto_178790 ) ) ( not ( = ?auto_178787 ?auto_178791 ) ) ( not ( = ?auto_178788 ?auto_178789 ) ) ( not ( = ?auto_178788 ?auto_178790 ) ) ( not ( = ?auto_178788 ?auto_178791 ) ) ( not ( = ?auto_178789 ?auto_178790 ) ) ( not ( = ?auto_178789 ?auto_178791 ) ) ( not ( = ?auto_178790 ?auto_178791 ) ) ( ON ?auto_178791 ?auto_178792 ) ( not ( = ?auto_178785 ?auto_178792 ) ) ( not ( = ?auto_178786 ?auto_178792 ) ) ( not ( = ?auto_178787 ?auto_178792 ) ) ( not ( = ?auto_178788 ?auto_178792 ) ) ( not ( = ?auto_178789 ?auto_178792 ) ) ( not ( = ?auto_178790 ?auto_178792 ) ) ( not ( = ?auto_178791 ?auto_178792 ) ) ( CLEAR ?auto_178789 ) ( ON ?auto_178790 ?auto_178791 ) ( CLEAR ?auto_178790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178792 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178792 ?auto_178791 )
      ( MAKE-7PILE ?auto_178785 ?auto_178786 ?auto_178787 ?auto_178788 ?auto_178789 ?auto_178790 ?auto_178791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178793 - BLOCK
      ?auto_178794 - BLOCK
      ?auto_178795 - BLOCK
      ?auto_178796 - BLOCK
      ?auto_178797 - BLOCK
      ?auto_178798 - BLOCK
      ?auto_178799 - BLOCK
    )
    :vars
    (
      ?auto_178800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178793 ) ( ON ?auto_178794 ?auto_178793 ) ( ON ?auto_178795 ?auto_178794 ) ( ON ?auto_178796 ?auto_178795 ) ( not ( = ?auto_178793 ?auto_178794 ) ) ( not ( = ?auto_178793 ?auto_178795 ) ) ( not ( = ?auto_178793 ?auto_178796 ) ) ( not ( = ?auto_178793 ?auto_178797 ) ) ( not ( = ?auto_178793 ?auto_178798 ) ) ( not ( = ?auto_178793 ?auto_178799 ) ) ( not ( = ?auto_178794 ?auto_178795 ) ) ( not ( = ?auto_178794 ?auto_178796 ) ) ( not ( = ?auto_178794 ?auto_178797 ) ) ( not ( = ?auto_178794 ?auto_178798 ) ) ( not ( = ?auto_178794 ?auto_178799 ) ) ( not ( = ?auto_178795 ?auto_178796 ) ) ( not ( = ?auto_178795 ?auto_178797 ) ) ( not ( = ?auto_178795 ?auto_178798 ) ) ( not ( = ?auto_178795 ?auto_178799 ) ) ( not ( = ?auto_178796 ?auto_178797 ) ) ( not ( = ?auto_178796 ?auto_178798 ) ) ( not ( = ?auto_178796 ?auto_178799 ) ) ( not ( = ?auto_178797 ?auto_178798 ) ) ( not ( = ?auto_178797 ?auto_178799 ) ) ( not ( = ?auto_178798 ?auto_178799 ) ) ( ON ?auto_178799 ?auto_178800 ) ( not ( = ?auto_178793 ?auto_178800 ) ) ( not ( = ?auto_178794 ?auto_178800 ) ) ( not ( = ?auto_178795 ?auto_178800 ) ) ( not ( = ?auto_178796 ?auto_178800 ) ) ( not ( = ?auto_178797 ?auto_178800 ) ) ( not ( = ?auto_178798 ?auto_178800 ) ) ( not ( = ?auto_178799 ?auto_178800 ) ) ( ON ?auto_178798 ?auto_178799 ) ( CLEAR ?auto_178798 ) ( ON-TABLE ?auto_178800 ) ( HOLDING ?auto_178797 ) ( CLEAR ?auto_178796 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178793 ?auto_178794 ?auto_178795 ?auto_178796 ?auto_178797 )
      ( MAKE-7PILE ?auto_178793 ?auto_178794 ?auto_178795 ?auto_178796 ?auto_178797 ?auto_178798 ?auto_178799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178801 - BLOCK
      ?auto_178802 - BLOCK
      ?auto_178803 - BLOCK
      ?auto_178804 - BLOCK
      ?auto_178805 - BLOCK
      ?auto_178806 - BLOCK
      ?auto_178807 - BLOCK
    )
    :vars
    (
      ?auto_178808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178801 ) ( ON ?auto_178802 ?auto_178801 ) ( ON ?auto_178803 ?auto_178802 ) ( ON ?auto_178804 ?auto_178803 ) ( not ( = ?auto_178801 ?auto_178802 ) ) ( not ( = ?auto_178801 ?auto_178803 ) ) ( not ( = ?auto_178801 ?auto_178804 ) ) ( not ( = ?auto_178801 ?auto_178805 ) ) ( not ( = ?auto_178801 ?auto_178806 ) ) ( not ( = ?auto_178801 ?auto_178807 ) ) ( not ( = ?auto_178802 ?auto_178803 ) ) ( not ( = ?auto_178802 ?auto_178804 ) ) ( not ( = ?auto_178802 ?auto_178805 ) ) ( not ( = ?auto_178802 ?auto_178806 ) ) ( not ( = ?auto_178802 ?auto_178807 ) ) ( not ( = ?auto_178803 ?auto_178804 ) ) ( not ( = ?auto_178803 ?auto_178805 ) ) ( not ( = ?auto_178803 ?auto_178806 ) ) ( not ( = ?auto_178803 ?auto_178807 ) ) ( not ( = ?auto_178804 ?auto_178805 ) ) ( not ( = ?auto_178804 ?auto_178806 ) ) ( not ( = ?auto_178804 ?auto_178807 ) ) ( not ( = ?auto_178805 ?auto_178806 ) ) ( not ( = ?auto_178805 ?auto_178807 ) ) ( not ( = ?auto_178806 ?auto_178807 ) ) ( ON ?auto_178807 ?auto_178808 ) ( not ( = ?auto_178801 ?auto_178808 ) ) ( not ( = ?auto_178802 ?auto_178808 ) ) ( not ( = ?auto_178803 ?auto_178808 ) ) ( not ( = ?auto_178804 ?auto_178808 ) ) ( not ( = ?auto_178805 ?auto_178808 ) ) ( not ( = ?auto_178806 ?auto_178808 ) ) ( not ( = ?auto_178807 ?auto_178808 ) ) ( ON ?auto_178806 ?auto_178807 ) ( ON-TABLE ?auto_178808 ) ( CLEAR ?auto_178804 ) ( ON ?auto_178805 ?auto_178806 ) ( CLEAR ?auto_178805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178808 ?auto_178807 ?auto_178806 )
      ( MAKE-7PILE ?auto_178801 ?auto_178802 ?auto_178803 ?auto_178804 ?auto_178805 ?auto_178806 ?auto_178807 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178809 - BLOCK
      ?auto_178810 - BLOCK
      ?auto_178811 - BLOCK
      ?auto_178812 - BLOCK
      ?auto_178813 - BLOCK
      ?auto_178814 - BLOCK
      ?auto_178815 - BLOCK
    )
    :vars
    (
      ?auto_178816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178809 ) ( ON ?auto_178810 ?auto_178809 ) ( ON ?auto_178811 ?auto_178810 ) ( not ( = ?auto_178809 ?auto_178810 ) ) ( not ( = ?auto_178809 ?auto_178811 ) ) ( not ( = ?auto_178809 ?auto_178812 ) ) ( not ( = ?auto_178809 ?auto_178813 ) ) ( not ( = ?auto_178809 ?auto_178814 ) ) ( not ( = ?auto_178809 ?auto_178815 ) ) ( not ( = ?auto_178810 ?auto_178811 ) ) ( not ( = ?auto_178810 ?auto_178812 ) ) ( not ( = ?auto_178810 ?auto_178813 ) ) ( not ( = ?auto_178810 ?auto_178814 ) ) ( not ( = ?auto_178810 ?auto_178815 ) ) ( not ( = ?auto_178811 ?auto_178812 ) ) ( not ( = ?auto_178811 ?auto_178813 ) ) ( not ( = ?auto_178811 ?auto_178814 ) ) ( not ( = ?auto_178811 ?auto_178815 ) ) ( not ( = ?auto_178812 ?auto_178813 ) ) ( not ( = ?auto_178812 ?auto_178814 ) ) ( not ( = ?auto_178812 ?auto_178815 ) ) ( not ( = ?auto_178813 ?auto_178814 ) ) ( not ( = ?auto_178813 ?auto_178815 ) ) ( not ( = ?auto_178814 ?auto_178815 ) ) ( ON ?auto_178815 ?auto_178816 ) ( not ( = ?auto_178809 ?auto_178816 ) ) ( not ( = ?auto_178810 ?auto_178816 ) ) ( not ( = ?auto_178811 ?auto_178816 ) ) ( not ( = ?auto_178812 ?auto_178816 ) ) ( not ( = ?auto_178813 ?auto_178816 ) ) ( not ( = ?auto_178814 ?auto_178816 ) ) ( not ( = ?auto_178815 ?auto_178816 ) ) ( ON ?auto_178814 ?auto_178815 ) ( ON-TABLE ?auto_178816 ) ( ON ?auto_178813 ?auto_178814 ) ( CLEAR ?auto_178813 ) ( HOLDING ?auto_178812 ) ( CLEAR ?auto_178811 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178809 ?auto_178810 ?auto_178811 ?auto_178812 )
      ( MAKE-7PILE ?auto_178809 ?auto_178810 ?auto_178811 ?auto_178812 ?auto_178813 ?auto_178814 ?auto_178815 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178817 - BLOCK
      ?auto_178818 - BLOCK
      ?auto_178819 - BLOCK
      ?auto_178820 - BLOCK
      ?auto_178821 - BLOCK
      ?auto_178822 - BLOCK
      ?auto_178823 - BLOCK
    )
    :vars
    (
      ?auto_178824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178817 ) ( ON ?auto_178818 ?auto_178817 ) ( ON ?auto_178819 ?auto_178818 ) ( not ( = ?auto_178817 ?auto_178818 ) ) ( not ( = ?auto_178817 ?auto_178819 ) ) ( not ( = ?auto_178817 ?auto_178820 ) ) ( not ( = ?auto_178817 ?auto_178821 ) ) ( not ( = ?auto_178817 ?auto_178822 ) ) ( not ( = ?auto_178817 ?auto_178823 ) ) ( not ( = ?auto_178818 ?auto_178819 ) ) ( not ( = ?auto_178818 ?auto_178820 ) ) ( not ( = ?auto_178818 ?auto_178821 ) ) ( not ( = ?auto_178818 ?auto_178822 ) ) ( not ( = ?auto_178818 ?auto_178823 ) ) ( not ( = ?auto_178819 ?auto_178820 ) ) ( not ( = ?auto_178819 ?auto_178821 ) ) ( not ( = ?auto_178819 ?auto_178822 ) ) ( not ( = ?auto_178819 ?auto_178823 ) ) ( not ( = ?auto_178820 ?auto_178821 ) ) ( not ( = ?auto_178820 ?auto_178822 ) ) ( not ( = ?auto_178820 ?auto_178823 ) ) ( not ( = ?auto_178821 ?auto_178822 ) ) ( not ( = ?auto_178821 ?auto_178823 ) ) ( not ( = ?auto_178822 ?auto_178823 ) ) ( ON ?auto_178823 ?auto_178824 ) ( not ( = ?auto_178817 ?auto_178824 ) ) ( not ( = ?auto_178818 ?auto_178824 ) ) ( not ( = ?auto_178819 ?auto_178824 ) ) ( not ( = ?auto_178820 ?auto_178824 ) ) ( not ( = ?auto_178821 ?auto_178824 ) ) ( not ( = ?auto_178822 ?auto_178824 ) ) ( not ( = ?auto_178823 ?auto_178824 ) ) ( ON ?auto_178822 ?auto_178823 ) ( ON-TABLE ?auto_178824 ) ( ON ?auto_178821 ?auto_178822 ) ( CLEAR ?auto_178819 ) ( ON ?auto_178820 ?auto_178821 ) ( CLEAR ?auto_178820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178824 ?auto_178823 ?auto_178822 ?auto_178821 )
      ( MAKE-7PILE ?auto_178817 ?auto_178818 ?auto_178819 ?auto_178820 ?auto_178821 ?auto_178822 ?auto_178823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178825 - BLOCK
      ?auto_178826 - BLOCK
      ?auto_178827 - BLOCK
      ?auto_178828 - BLOCK
      ?auto_178829 - BLOCK
      ?auto_178830 - BLOCK
      ?auto_178831 - BLOCK
    )
    :vars
    (
      ?auto_178832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178825 ) ( ON ?auto_178826 ?auto_178825 ) ( not ( = ?auto_178825 ?auto_178826 ) ) ( not ( = ?auto_178825 ?auto_178827 ) ) ( not ( = ?auto_178825 ?auto_178828 ) ) ( not ( = ?auto_178825 ?auto_178829 ) ) ( not ( = ?auto_178825 ?auto_178830 ) ) ( not ( = ?auto_178825 ?auto_178831 ) ) ( not ( = ?auto_178826 ?auto_178827 ) ) ( not ( = ?auto_178826 ?auto_178828 ) ) ( not ( = ?auto_178826 ?auto_178829 ) ) ( not ( = ?auto_178826 ?auto_178830 ) ) ( not ( = ?auto_178826 ?auto_178831 ) ) ( not ( = ?auto_178827 ?auto_178828 ) ) ( not ( = ?auto_178827 ?auto_178829 ) ) ( not ( = ?auto_178827 ?auto_178830 ) ) ( not ( = ?auto_178827 ?auto_178831 ) ) ( not ( = ?auto_178828 ?auto_178829 ) ) ( not ( = ?auto_178828 ?auto_178830 ) ) ( not ( = ?auto_178828 ?auto_178831 ) ) ( not ( = ?auto_178829 ?auto_178830 ) ) ( not ( = ?auto_178829 ?auto_178831 ) ) ( not ( = ?auto_178830 ?auto_178831 ) ) ( ON ?auto_178831 ?auto_178832 ) ( not ( = ?auto_178825 ?auto_178832 ) ) ( not ( = ?auto_178826 ?auto_178832 ) ) ( not ( = ?auto_178827 ?auto_178832 ) ) ( not ( = ?auto_178828 ?auto_178832 ) ) ( not ( = ?auto_178829 ?auto_178832 ) ) ( not ( = ?auto_178830 ?auto_178832 ) ) ( not ( = ?auto_178831 ?auto_178832 ) ) ( ON ?auto_178830 ?auto_178831 ) ( ON-TABLE ?auto_178832 ) ( ON ?auto_178829 ?auto_178830 ) ( ON ?auto_178828 ?auto_178829 ) ( CLEAR ?auto_178828 ) ( HOLDING ?auto_178827 ) ( CLEAR ?auto_178826 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178825 ?auto_178826 ?auto_178827 )
      ( MAKE-7PILE ?auto_178825 ?auto_178826 ?auto_178827 ?auto_178828 ?auto_178829 ?auto_178830 ?auto_178831 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178833 - BLOCK
      ?auto_178834 - BLOCK
      ?auto_178835 - BLOCK
      ?auto_178836 - BLOCK
      ?auto_178837 - BLOCK
      ?auto_178838 - BLOCK
      ?auto_178839 - BLOCK
    )
    :vars
    (
      ?auto_178840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178833 ) ( ON ?auto_178834 ?auto_178833 ) ( not ( = ?auto_178833 ?auto_178834 ) ) ( not ( = ?auto_178833 ?auto_178835 ) ) ( not ( = ?auto_178833 ?auto_178836 ) ) ( not ( = ?auto_178833 ?auto_178837 ) ) ( not ( = ?auto_178833 ?auto_178838 ) ) ( not ( = ?auto_178833 ?auto_178839 ) ) ( not ( = ?auto_178834 ?auto_178835 ) ) ( not ( = ?auto_178834 ?auto_178836 ) ) ( not ( = ?auto_178834 ?auto_178837 ) ) ( not ( = ?auto_178834 ?auto_178838 ) ) ( not ( = ?auto_178834 ?auto_178839 ) ) ( not ( = ?auto_178835 ?auto_178836 ) ) ( not ( = ?auto_178835 ?auto_178837 ) ) ( not ( = ?auto_178835 ?auto_178838 ) ) ( not ( = ?auto_178835 ?auto_178839 ) ) ( not ( = ?auto_178836 ?auto_178837 ) ) ( not ( = ?auto_178836 ?auto_178838 ) ) ( not ( = ?auto_178836 ?auto_178839 ) ) ( not ( = ?auto_178837 ?auto_178838 ) ) ( not ( = ?auto_178837 ?auto_178839 ) ) ( not ( = ?auto_178838 ?auto_178839 ) ) ( ON ?auto_178839 ?auto_178840 ) ( not ( = ?auto_178833 ?auto_178840 ) ) ( not ( = ?auto_178834 ?auto_178840 ) ) ( not ( = ?auto_178835 ?auto_178840 ) ) ( not ( = ?auto_178836 ?auto_178840 ) ) ( not ( = ?auto_178837 ?auto_178840 ) ) ( not ( = ?auto_178838 ?auto_178840 ) ) ( not ( = ?auto_178839 ?auto_178840 ) ) ( ON ?auto_178838 ?auto_178839 ) ( ON-TABLE ?auto_178840 ) ( ON ?auto_178837 ?auto_178838 ) ( ON ?auto_178836 ?auto_178837 ) ( CLEAR ?auto_178834 ) ( ON ?auto_178835 ?auto_178836 ) ( CLEAR ?auto_178835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178840 ?auto_178839 ?auto_178838 ?auto_178837 ?auto_178836 )
      ( MAKE-7PILE ?auto_178833 ?auto_178834 ?auto_178835 ?auto_178836 ?auto_178837 ?auto_178838 ?auto_178839 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178841 - BLOCK
      ?auto_178842 - BLOCK
      ?auto_178843 - BLOCK
      ?auto_178844 - BLOCK
      ?auto_178845 - BLOCK
      ?auto_178846 - BLOCK
      ?auto_178847 - BLOCK
    )
    :vars
    (
      ?auto_178848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178841 ) ( not ( = ?auto_178841 ?auto_178842 ) ) ( not ( = ?auto_178841 ?auto_178843 ) ) ( not ( = ?auto_178841 ?auto_178844 ) ) ( not ( = ?auto_178841 ?auto_178845 ) ) ( not ( = ?auto_178841 ?auto_178846 ) ) ( not ( = ?auto_178841 ?auto_178847 ) ) ( not ( = ?auto_178842 ?auto_178843 ) ) ( not ( = ?auto_178842 ?auto_178844 ) ) ( not ( = ?auto_178842 ?auto_178845 ) ) ( not ( = ?auto_178842 ?auto_178846 ) ) ( not ( = ?auto_178842 ?auto_178847 ) ) ( not ( = ?auto_178843 ?auto_178844 ) ) ( not ( = ?auto_178843 ?auto_178845 ) ) ( not ( = ?auto_178843 ?auto_178846 ) ) ( not ( = ?auto_178843 ?auto_178847 ) ) ( not ( = ?auto_178844 ?auto_178845 ) ) ( not ( = ?auto_178844 ?auto_178846 ) ) ( not ( = ?auto_178844 ?auto_178847 ) ) ( not ( = ?auto_178845 ?auto_178846 ) ) ( not ( = ?auto_178845 ?auto_178847 ) ) ( not ( = ?auto_178846 ?auto_178847 ) ) ( ON ?auto_178847 ?auto_178848 ) ( not ( = ?auto_178841 ?auto_178848 ) ) ( not ( = ?auto_178842 ?auto_178848 ) ) ( not ( = ?auto_178843 ?auto_178848 ) ) ( not ( = ?auto_178844 ?auto_178848 ) ) ( not ( = ?auto_178845 ?auto_178848 ) ) ( not ( = ?auto_178846 ?auto_178848 ) ) ( not ( = ?auto_178847 ?auto_178848 ) ) ( ON ?auto_178846 ?auto_178847 ) ( ON-TABLE ?auto_178848 ) ( ON ?auto_178845 ?auto_178846 ) ( ON ?auto_178844 ?auto_178845 ) ( ON ?auto_178843 ?auto_178844 ) ( CLEAR ?auto_178843 ) ( HOLDING ?auto_178842 ) ( CLEAR ?auto_178841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178841 ?auto_178842 )
      ( MAKE-7PILE ?auto_178841 ?auto_178842 ?auto_178843 ?auto_178844 ?auto_178845 ?auto_178846 ?auto_178847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178849 - BLOCK
      ?auto_178850 - BLOCK
      ?auto_178851 - BLOCK
      ?auto_178852 - BLOCK
      ?auto_178853 - BLOCK
      ?auto_178854 - BLOCK
      ?auto_178855 - BLOCK
    )
    :vars
    (
      ?auto_178856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_178849 ) ( not ( = ?auto_178849 ?auto_178850 ) ) ( not ( = ?auto_178849 ?auto_178851 ) ) ( not ( = ?auto_178849 ?auto_178852 ) ) ( not ( = ?auto_178849 ?auto_178853 ) ) ( not ( = ?auto_178849 ?auto_178854 ) ) ( not ( = ?auto_178849 ?auto_178855 ) ) ( not ( = ?auto_178850 ?auto_178851 ) ) ( not ( = ?auto_178850 ?auto_178852 ) ) ( not ( = ?auto_178850 ?auto_178853 ) ) ( not ( = ?auto_178850 ?auto_178854 ) ) ( not ( = ?auto_178850 ?auto_178855 ) ) ( not ( = ?auto_178851 ?auto_178852 ) ) ( not ( = ?auto_178851 ?auto_178853 ) ) ( not ( = ?auto_178851 ?auto_178854 ) ) ( not ( = ?auto_178851 ?auto_178855 ) ) ( not ( = ?auto_178852 ?auto_178853 ) ) ( not ( = ?auto_178852 ?auto_178854 ) ) ( not ( = ?auto_178852 ?auto_178855 ) ) ( not ( = ?auto_178853 ?auto_178854 ) ) ( not ( = ?auto_178853 ?auto_178855 ) ) ( not ( = ?auto_178854 ?auto_178855 ) ) ( ON ?auto_178855 ?auto_178856 ) ( not ( = ?auto_178849 ?auto_178856 ) ) ( not ( = ?auto_178850 ?auto_178856 ) ) ( not ( = ?auto_178851 ?auto_178856 ) ) ( not ( = ?auto_178852 ?auto_178856 ) ) ( not ( = ?auto_178853 ?auto_178856 ) ) ( not ( = ?auto_178854 ?auto_178856 ) ) ( not ( = ?auto_178855 ?auto_178856 ) ) ( ON ?auto_178854 ?auto_178855 ) ( ON-TABLE ?auto_178856 ) ( ON ?auto_178853 ?auto_178854 ) ( ON ?auto_178852 ?auto_178853 ) ( ON ?auto_178851 ?auto_178852 ) ( CLEAR ?auto_178849 ) ( ON ?auto_178850 ?auto_178851 ) ( CLEAR ?auto_178850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178856 ?auto_178855 ?auto_178854 ?auto_178853 ?auto_178852 ?auto_178851 )
      ( MAKE-7PILE ?auto_178849 ?auto_178850 ?auto_178851 ?auto_178852 ?auto_178853 ?auto_178854 ?auto_178855 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178857 - BLOCK
      ?auto_178858 - BLOCK
      ?auto_178859 - BLOCK
      ?auto_178860 - BLOCK
      ?auto_178861 - BLOCK
      ?auto_178862 - BLOCK
      ?auto_178863 - BLOCK
    )
    :vars
    (
      ?auto_178864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178857 ?auto_178858 ) ) ( not ( = ?auto_178857 ?auto_178859 ) ) ( not ( = ?auto_178857 ?auto_178860 ) ) ( not ( = ?auto_178857 ?auto_178861 ) ) ( not ( = ?auto_178857 ?auto_178862 ) ) ( not ( = ?auto_178857 ?auto_178863 ) ) ( not ( = ?auto_178858 ?auto_178859 ) ) ( not ( = ?auto_178858 ?auto_178860 ) ) ( not ( = ?auto_178858 ?auto_178861 ) ) ( not ( = ?auto_178858 ?auto_178862 ) ) ( not ( = ?auto_178858 ?auto_178863 ) ) ( not ( = ?auto_178859 ?auto_178860 ) ) ( not ( = ?auto_178859 ?auto_178861 ) ) ( not ( = ?auto_178859 ?auto_178862 ) ) ( not ( = ?auto_178859 ?auto_178863 ) ) ( not ( = ?auto_178860 ?auto_178861 ) ) ( not ( = ?auto_178860 ?auto_178862 ) ) ( not ( = ?auto_178860 ?auto_178863 ) ) ( not ( = ?auto_178861 ?auto_178862 ) ) ( not ( = ?auto_178861 ?auto_178863 ) ) ( not ( = ?auto_178862 ?auto_178863 ) ) ( ON ?auto_178863 ?auto_178864 ) ( not ( = ?auto_178857 ?auto_178864 ) ) ( not ( = ?auto_178858 ?auto_178864 ) ) ( not ( = ?auto_178859 ?auto_178864 ) ) ( not ( = ?auto_178860 ?auto_178864 ) ) ( not ( = ?auto_178861 ?auto_178864 ) ) ( not ( = ?auto_178862 ?auto_178864 ) ) ( not ( = ?auto_178863 ?auto_178864 ) ) ( ON ?auto_178862 ?auto_178863 ) ( ON-TABLE ?auto_178864 ) ( ON ?auto_178861 ?auto_178862 ) ( ON ?auto_178860 ?auto_178861 ) ( ON ?auto_178859 ?auto_178860 ) ( ON ?auto_178858 ?auto_178859 ) ( CLEAR ?auto_178858 ) ( HOLDING ?auto_178857 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_178857 )
      ( MAKE-7PILE ?auto_178857 ?auto_178858 ?auto_178859 ?auto_178860 ?auto_178861 ?auto_178862 ?auto_178863 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178865 - BLOCK
      ?auto_178866 - BLOCK
      ?auto_178867 - BLOCK
      ?auto_178868 - BLOCK
      ?auto_178869 - BLOCK
      ?auto_178870 - BLOCK
      ?auto_178871 - BLOCK
    )
    :vars
    (
      ?auto_178872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178865 ?auto_178866 ) ) ( not ( = ?auto_178865 ?auto_178867 ) ) ( not ( = ?auto_178865 ?auto_178868 ) ) ( not ( = ?auto_178865 ?auto_178869 ) ) ( not ( = ?auto_178865 ?auto_178870 ) ) ( not ( = ?auto_178865 ?auto_178871 ) ) ( not ( = ?auto_178866 ?auto_178867 ) ) ( not ( = ?auto_178866 ?auto_178868 ) ) ( not ( = ?auto_178866 ?auto_178869 ) ) ( not ( = ?auto_178866 ?auto_178870 ) ) ( not ( = ?auto_178866 ?auto_178871 ) ) ( not ( = ?auto_178867 ?auto_178868 ) ) ( not ( = ?auto_178867 ?auto_178869 ) ) ( not ( = ?auto_178867 ?auto_178870 ) ) ( not ( = ?auto_178867 ?auto_178871 ) ) ( not ( = ?auto_178868 ?auto_178869 ) ) ( not ( = ?auto_178868 ?auto_178870 ) ) ( not ( = ?auto_178868 ?auto_178871 ) ) ( not ( = ?auto_178869 ?auto_178870 ) ) ( not ( = ?auto_178869 ?auto_178871 ) ) ( not ( = ?auto_178870 ?auto_178871 ) ) ( ON ?auto_178871 ?auto_178872 ) ( not ( = ?auto_178865 ?auto_178872 ) ) ( not ( = ?auto_178866 ?auto_178872 ) ) ( not ( = ?auto_178867 ?auto_178872 ) ) ( not ( = ?auto_178868 ?auto_178872 ) ) ( not ( = ?auto_178869 ?auto_178872 ) ) ( not ( = ?auto_178870 ?auto_178872 ) ) ( not ( = ?auto_178871 ?auto_178872 ) ) ( ON ?auto_178870 ?auto_178871 ) ( ON-TABLE ?auto_178872 ) ( ON ?auto_178869 ?auto_178870 ) ( ON ?auto_178868 ?auto_178869 ) ( ON ?auto_178867 ?auto_178868 ) ( ON ?auto_178866 ?auto_178867 ) ( ON ?auto_178865 ?auto_178866 ) ( CLEAR ?auto_178865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178872 ?auto_178871 ?auto_178870 ?auto_178869 ?auto_178868 ?auto_178867 ?auto_178866 )
      ( MAKE-7PILE ?auto_178865 ?auto_178866 ?auto_178867 ?auto_178868 ?auto_178869 ?auto_178870 ?auto_178871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178873 - BLOCK
      ?auto_178874 - BLOCK
      ?auto_178875 - BLOCK
      ?auto_178876 - BLOCK
      ?auto_178877 - BLOCK
      ?auto_178878 - BLOCK
      ?auto_178879 - BLOCK
    )
    :vars
    (
      ?auto_178880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178873 ?auto_178874 ) ) ( not ( = ?auto_178873 ?auto_178875 ) ) ( not ( = ?auto_178873 ?auto_178876 ) ) ( not ( = ?auto_178873 ?auto_178877 ) ) ( not ( = ?auto_178873 ?auto_178878 ) ) ( not ( = ?auto_178873 ?auto_178879 ) ) ( not ( = ?auto_178874 ?auto_178875 ) ) ( not ( = ?auto_178874 ?auto_178876 ) ) ( not ( = ?auto_178874 ?auto_178877 ) ) ( not ( = ?auto_178874 ?auto_178878 ) ) ( not ( = ?auto_178874 ?auto_178879 ) ) ( not ( = ?auto_178875 ?auto_178876 ) ) ( not ( = ?auto_178875 ?auto_178877 ) ) ( not ( = ?auto_178875 ?auto_178878 ) ) ( not ( = ?auto_178875 ?auto_178879 ) ) ( not ( = ?auto_178876 ?auto_178877 ) ) ( not ( = ?auto_178876 ?auto_178878 ) ) ( not ( = ?auto_178876 ?auto_178879 ) ) ( not ( = ?auto_178877 ?auto_178878 ) ) ( not ( = ?auto_178877 ?auto_178879 ) ) ( not ( = ?auto_178878 ?auto_178879 ) ) ( ON ?auto_178879 ?auto_178880 ) ( not ( = ?auto_178873 ?auto_178880 ) ) ( not ( = ?auto_178874 ?auto_178880 ) ) ( not ( = ?auto_178875 ?auto_178880 ) ) ( not ( = ?auto_178876 ?auto_178880 ) ) ( not ( = ?auto_178877 ?auto_178880 ) ) ( not ( = ?auto_178878 ?auto_178880 ) ) ( not ( = ?auto_178879 ?auto_178880 ) ) ( ON ?auto_178878 ?auto_178879 ) ( ON-TABLE ?auto_178880 ) ( ON ?auto_178877 ?auto_178878 ) ( ON ?auto_178876 ?auto_178877 ) ( ON ?auto_178875 ?auto_178876 ) ( ON ?auto_178874 ?auto_178875 ) ( HOLDING ?auto_178873 ) ( CLEAR ?auto_178874 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_178880 ?auto_178879 ?auto_178878 ?auto_178877 ?auto_178876 ?auto_178875 ?auto_178874 ?auto_178873 )
      ( MAKE-7PILE ?auto_178873 ?auto_178874 ?auto_178875 ?auto_178876 ?auto_178877 ?auto_178878 ?auto_178879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178881 - BLOCK
      ?auto_178882 - BLOCK
      ?auto_178883 - BLOCK
      ?auto_178884 - BLOCK
      ?auto_178885 - BLOCK
      ?auto_178886 - BLOCK
      ?auto_178887 - BLOCK
    )
    :vars
    (
      ?auto_178888 - BLOCK
      ?auto_178889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178881 ?auto_178882 ) ) ( not ( = ?auto_178881 ?auto_178883 ) ) ( not ( = ?auto_178881 ?auto_178884 ) ) ( not ( = ?auto_178881 ?auto_178885 ) ) ( not ( = ?auto_178881 ?auto_178886 ) ) ( not ( = ?auto_178881 ?auto_178887 ) ) ( not ( = ?auto_178882 ?auto_178883 ) ) ( not ( = ?auto_178882 ?auto_178884 ) ) ( not ( = ?auto_178882 ?auto_178885 ) ) ( not ( = ?auto_178882 ?auto_178886 ) ) ( not ( = ?auto_178882 ?auto_178887 ) ) ( not ( = ?auto_178883 ?auto_178884 ) ) ( not ( = ?auto_178883 ?auto_178885 ) ) ( not ( = ?auto_178883 ?auto_178886 ) ) ( not ( = ?auto_178883 ?auto_178887 ) ) ( not ( = ?auto_178884 ?auto_178885 ) ) ( not ( = ?auto_178884 ?auto_178886 ) ) ( not ( = ?auto_178884 ?auto_178887 ) ) ( not ( = ?auto_178885 ?auto_178886 ) ) ( not ( = ?auto_178885 ?auto_178887 ) ) ( not ( = ?auto_178886 ?auto_178887 ) ) ( ON ?auto_178887 ?auto_178888 ) ( not ( = ?auto_178881 ?auto_178888 ) ) ( not ( = ?auto_178882 ?auto_178888 ) ) ( not ( = ?auto_178883 ?auto_178888 ) ) ( not ( = ?auto_178884 ?auto_178888 ) ) ( not ( = ?auto_178885 ?auto_178888 ) ) ( not ( = ?auto_178886 ?auto_178888 ) ) ( not ( = ?auto_178887 ?auto_178888 ) ) ( ON ?auto_178886 ?auto_178887 ) ( ON-TABLE ?auto_178888 ) ( ON ?auto_178885 ?auto_178886 ) ( ON ?auto_178884 ?auto_178885 ) ( ON ?auto_178883 ?auto_178884 ) ( ON ?auto_178882 ?auto_178883 ) ( CLEAR ?auto_178882 ) ( ON ?auto_178881 ?auto_178889 ) ( CLEAR ?auto_178881 ) ( HAND-EMPTY ) ( not ( = ?auto_178881 ?auto_178889 ) ) ( not ( = ?auto_178882 ?auto_178889 ) ) ( not ( = ?auto_178883 ?auto_178889 ) ) ( not ( = ?auto_178884 ?auto_178889 ) ) ( not ( = ?auto_178885 ?auto_178889 ) ) ( not ( = ?auto_178886 ?auto_178889 ) ) ( not ( = ?auto_178887 ?auto_178889 ) ) ( not ( = ?auto_178888 ?auto_178889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_178881 ?auto_178889 )
      ( MAKE-7PILE ?auto_178881 ?auto_178882 ?auto_178883 ?auto_178884 ?auto_178885 ?auto_178886 ?auto_178887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178890 - BLOCK
      ?auto_178891 - BLOCK
      ?auto_178892 - BLOCK
      ?auto_178893 - BLOCK
      ?auto_178894 - BLOCK
      ?auto_178895 - BLOCK
      ?auto_178896 - BLOCK
    )
    :vars
    (
      ?auto_178898 - BLOCK
      ?auto_178897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178890 ?auto_178891 ) ) ( not ( = ?auto_178890 ?auto_178892 ) ) ( not ( = ?auto_178890 ?auto_178893 ) ) ( not ( = ?auto_178890 ?auto_178894 ) ) ( not ( = ?auto_178890 ?auto_178895 ) ) ( not ( = ?auto_178890 ?auto_178896 ) ) ( not ( = ?auto_178891 ?auto_178892 ) ) ( not ( = ?auto_178891 ?auto_178893 ) ) ( not ( = ?auto_178891 ?auto_178894 ) ) ( not ( = ?auto_178891 ?auto_178895 ) ) ( not ( = ?auto_178891 ?auto_178896 ) ) ( not ( = ?auto_178892 ?auto_178893 ) ) ( not ( = ?auto_178892 ?auto_178894 ) ) ( not ( = ?auto_178892 ?auto_178895 ) ) ( not ( = ?auto_178892 ?auto_178896 ) ) ( not ( = ?auto_178893 ?auto_178894 ) ) ( not ( = ?auto_178893 ?auto_178895 ) ) ( not ( = ?auto_178893 ?auto_178896 ) ) ( not ( = ?auto_178894 ?auto_178895 ) ) ( not ( = ?auto_178894 ?auto_178896 ) ) ( not ( = ?auto_178895 ?auto_178896 ) ) ( ON ?auto_178896 ?auto_178898 ) ( not ( = ?auto_178890 ?auto_178898 ) ) ( not ( = ?auto_178891 ?auto_178898 ) ) ( not ( = ?auto_178892 ?auto_178898 ) ) ( not ( = ?auto_178893 ?auto_178898 ) ) ( not ( = ?auto_178894 ?auto_178898 ) ) ( not ( = ?auto_178895 ?auto_178898 ) ) ( not ( = ?auto_178896 ?auto_178898 ) ) ( ON ?auto_178895 ?auto_178896 ) ( ON-TABLE ?auto_178898 ) ( ON ?auto_178894 ?auto_178895 ) ( ON ?auto_178893 ?auto_178894 ) ( ON ?auto_178892 ?auto_178893 ) ( ON ?auto_178890 ?auto_178897 ) ( CLEAR ?auto_178890 ) ( not ( = ?auto_178890 ?auto_178897 ) ) ( not ( = ?auto_178891 ?auto_178897 ) ) ( not ( = ?auto_178892 ?auto_178897 ) ) ( not ( = ?auto_178893 ?auto_178897 ) ) ( not ( = ?auto_178894 ?auto_178897 ) ) ( not ( = ?auto_178895 ?auto_178897 ) ) ( not ( = ?auto_178896 ?auto_178897 ) ) ( not ( = ?auto_178898 ?auto_178897 ) ) ( HOLDING ?auto_178891 ) ( CLEAR ?auto_178892 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178898 ?auto_178896 ?auto_178895 ?auto_178894 ?auto_178893 ?auto_178892 ?auto_178891 )
      ( MAKE-7PILE ?auto_178890 ?auto_178891 ?auto_178892 ?auto_178893 ?auto_178894 ?auto_178895 ?auto_178896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178899 - BLOCK
      ?auto_178900 - BLOCK
      ?auto_178901 - BLOCK
      ?auto_178902 - BLOCK
      ?auto_178903 - BLOCK
      ?auto_178904 - BLOCK
      ?auto_178905 - BLOCK
    )
    :vars
    (
      ?auto_178906 - BLOCK
      ?auto_178907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178899 ?auto_178900 ) ) ( not ( = ?auto_178899 ?auto_178901 ) ) ( not ( = ?auto_178899 ?auto_178902 ) ) ( not ( = ?auto_178899 ?auto_178903 ) ) ( not ( = ?auto_178899 ?auto_178904 ) ) ( not ( = ?auto_178899 ?auto_178905 ) ) ( not ( = ?auto_178900 ?auto_178901 ) ) ( not ( = ?auto_178900 ?auto_178902 ) ) ( not ( = ?auto_178900 ?auto_178903 ) ) ( not ( = ?auto_178900 ?auto_178904 ) ) ( not ( = ?auto_178900 ?auto_178905 ) ) ( not ( = ?auto_178901 ?auto_178902 ) ) ( not ( = ?auto_178901 ?auto_178903 ) ) ( not ( = ?auto_178901 ?auto_178904 ) ) ( not ( = ?auto_178901 ?auto_178905 ) ) ( not ( = ?auto_178902 ?auto_178903 ) ) ( not ( = ?auto_178902 ?auto_178904 ) ) ( not ( = ?auto_178902 ?auto_178905 ) ) ( not ( = ?auto_178903 ?auto_178904 ) ) ( not ( = ?auto_178903 ?auto_178905 ) ) ( not ( = ?auto_178904 ?auto_178905 ) ) ( ON ?auto_178905 ?auto_178906 ) ( not ( = ?auto_178899 ?auto_178906 ) ) ( not ( = ?auto_178900 ?auto_178906 ) ) ( not ( = ?auto_178901 ?auto_178906 ) ) ( not ( = ?auto_178902 ?auto_178906 ) ) ( not ( = ?auto_178903 ?auto_178906 ) ) ( not ( = ?auto_178904 ?auto_178906 ) ) ( not ( = ?auto_178905 ?auto_178906 ) ) ( ON ?auto_178904 ?auto_178905 ) ( ON-TABLE ?auto_178906 ) ( ON ?auto_178903 ?auto_178904 ) ( ON ?auto_178902 ?auto_178903 ) ( ON ?auto_178901 ?auto_178902 ) ( ON ?auto_178899 ?auto_178907 ) ( not ( = ?auto_178899 ?auto_178907 ) ) ( not ( = ?auto_178900 ?auto_178907 ) ) ( not ( = ?auto_178901 ?auto_178907 ) ) ( not ( = ?auto_178902 ?auto_178907 ) ) ( not ( = ?auto_178903 ?auto_178907 ) ) ( not ( = ?auto_178904 ?auto_178907 ) ) ( not ( = ?auto_178905 ?auto_178907 ) ) ( not ( = ?auto_178906 ?auto_178907 ) ) ( CLEAR ?auto_178901 ) ( ON ?auto_178900 ?auto_178899 ) ( CLEAR ?auto_178900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_178907 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178907 ?auto_178899 )
      ( MAKE-7PILE ?auto_178899 ?auto_178900 ?auto_178901 ?auto_178902 ?auto_178903 ?auto_178904 ?auto_178905 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178908 - BLOCK
      ?auto_178909 - BLOCK
      ?auto_178910 - BLOCK
      ?auto_178911 - BLOCK
      ?auto_178912 - BLOCK
      ?auto_178913 - BLOCK
      ?auto_178914 - BLOCK
    )
    :vars
    (
      ?auto_178916 - BLOCK
      ?auto_178915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178908 ?auto_178909 ) ) ( not ( = ?auto_178908 ?auto_178910 ) ) ( not ( = ?auto_178908 ?auto_178911 ) ) ( not ( = ?auto_178908 ?auto_178912 ) ) ( not ( = ?auto_178908 ?auto_178913 ) ) ( not ( = ?auto_178908 ?auto_178914 ) ) ( not ( = ?auto_178909 ?auto_178910 ) ) ( not ( = ?auto_178909 ?auto_178911 ) ) ( not ( = ?auto_178909 ?auto_178912 ) ) ( not ( = ?auto_178909 ?auto_178913 ) ) ( not ( = ?auto_178909 ?auto_178914 ) ) ( not ( = ?auto_178910 ?auto_178911 ) ) ( not ( = ?auto_178910 ?auto_178912 ) ) ( not ( = ?auto_178910 ?auto_178913 ) ) ( not ( = ?auto_178910 ?auto_178914 ) ) ( not ( = ?auto_178911 ?auto_178912 ) ) ( not ( = ?auto_178911 ?auto_178913 ) ) ( not ( = ?auto_178911 ?auto_178914 ) ) ( not ( = ?auto_178912 ?auto_178913 ) ) ( not ( = ?auto_178912 ?auto_178914 ) ) ( not ( = ?auto_178913 ?auto_178914 ) ) ( ON ?auto_178914 ?auto_178916 ) ( not ( = ?auto_178908 ?auto_178916 ) ) ( not ( = ?auto_178909 ?auto_178916 ) ) ( not ( = ?auto_178910 ?auto_178916 ) ) ( not ( = ?auto_178911 ?auto_178916 ) ) ( not ( = ?auto_178912 ?auto_178916 ) ) ( not ( = ?auto_178913 ?auto_178916 ) ) ( not ( = ?auto_178914 ?auto_178916 ) ) ( ON ?auto_178913 ?auto_178914 ) ( ON-TABLE ?auto_178916 ) ( ON ?auto_178912 ?auto_178913 ) ( ON ?auto_178911 ?auto_178912 ) ( ON ?auto_178908 ?auto_178915 ) ( not ( = ?auto_178908 ?auto_178915 ) ) ( not ( = ?auto_178909 ?auto_178915 ) ) ( not ( = ?auto_178910 ?auto_178915 ) ) ( not ( = ?auto_178911 ?auto_178915 ) ) ( not ( = ?auto_178912 ?auto_178915 ) ) ( not ( = ?auto_178913 ?auto_178915 ) ) ( not ( = ?auto_178914 ?auto_178915 ) ) ( not ( = ?auto_178916 ?auto_178915 ) ) ( ON ?auto_178909 ?auto_178908 ) ( CLEAR ?auto_178909 ) ( ON-TABLE ?auto_178915 ) ( HOLDING ?auto_178910 ) ( CLEAR ?auto_178911 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178916 ?auto_178914 ?auto_178913 ?auto_178912 ?auto_178911 ?auto_178910 )
      ( MAKE-7PILE ?auto_178908 ?auto_178909 ?auto_178910 ?auto_178911 ?auto_178912 ?auto_178913 ?auto_178914 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178917 - BLOCK
      ?auto_178918 - BLOCK
      ?auto_178919 - BLOCK
      ?auto_178920 - BLOCK
      ?auto_178921 - BLOCK
      ?auto_178922 - BLOCK
      ?auto_178923 - BLOCK
    )
    :vars
    (
      ?auto_178924 - BLOCK
      ?auto_178925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178917 ?auto_178918 ) ) ( not ( = ?auto_178917 ?auto_178919 ) ) ( not ( = ?auto_178917 ?auto_178920 ) ) ( not ( = ?auto_178917 ?auto_178921 ) ) ( not ( = ?auto_178917 ?auto_178922 ) ) ( not ( = ?auto_178917 ?auto_178923 ) ) ( not ( = ?auto_178918 ?auto_178919 ) ) ( not ( = ?auto_178918 ?auto_178920 ) ) ( not ( = ?auto_178918 ?auto_178921 ) ) ( not ( = ?auto_178918 ?auto_178922 ) ) ( not ( = ?auto_178918 ?auto_178923 ) ) ( not ( = ?auto_178919 ?auto_178920 ) ) ( not ( = ?auto_178919 ?auto_178921 ) ) ( not ( = ?auto_178919 ?auto_178922 ) ) ( not ( = ?auto_178919 ?auto_178923 ) ) ( not ( = ?auto_178920 ?auto_178921 ) ) ( not ( = ?auto_178920 ?auto_178922 ) ) ( not ( = ?auto_178920 ?auto_178923 ) ) ( not ( = ?auto_178921 ?auto_178922 ) ) ( not ( = ?auto_178921 ?auto_178923 ) ) ( not ( = ?auto_178922 ?auto_178923 ) ) ( ON ?auto_178923 ?auto_178924 ) ( not ( = ?auto_178917 ?auto_178924 ) ) ( not ( = ?auto_178918 ?auto_178924 ) ) ( not ( = ?auto_178919 ?auto_178924 ) ) ( not ( = ?auto_178920 ?auto_178924 ) ) ( not ( = ?auto_178921 ?auto_178924 ) ) ( not ( = ?auto_178922 ?auto_178924 ) ) ( not ( = ?auto_178923 ?auto_178924 ) ) ( ON ?auto_178922 ?auto_178923 ) ( ON-TABLE ?auto_178924 ) ( ON ?auto_178921 ?auto_178922 ) ( ON ?auto_178920 ?auto_178921 ) ( ON ?auto_178917 ?auto_178925 ) ( not ( = ?auto_178917 ?auto_178925 ) ) ( not ( = ?auto_178918 ?auto_178925 ) ) ( not ( = ?auto_178919 ?auto_178925 ) ) ( not ( = ?auto_178920 ?auto_178925 ) ) ( not ( = ?auto_178921 ?auto_178925 ) ) ( not ( = ?auto_178922 ?auto_178925 ) ) ( not ( = ?auto_178923 ?auto_178925 ) ) ( not ( = ?auto_178924 ?auto_178925 ) ) ( ON ?auto_178918 ?auto_178917 ) ( ON-TABLE ?auto_178925 ) ( CLEAR ?auto_178920 ) ( ON ?auto_178919 ?auto_178918 ) ( CLEAR ?auto_178919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178925 ?auto_178917 ?auto_178918 )
      ( MAKE-7PILE ?auto_178917 ?auto_178918 ?auto_178919 ?auto_178920 ?auto_178921 ?auto_178922 ?auto_178923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178926 - BLOCK
      ?auto_178927 - BLOCK
      ?auto_178928 - BLOCK
      ?auto_178929 - BLOCK
      ?auto_178930 - BLOCK
      ?auto_178931 - BLOCK
      ?auto_178932 - BLOCK
    )
    :vars
    (
      ?auto_178934 - BLOCK
      ?auto_178933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178926 ?auto_178927 ) ) ( not ( = ?auto_178926 ?auto_178928 ) ) ( not ( = ?auto_178926 ?auto_178929 ) ) ( not ( = ?auto_178926 ?auto_178930 ) ) ( not ( = ?auto_178926 ?auto_178931 ) ) ( not ( = ?auto_178926 ?auto_178932 ) ) ( not ( = ?auto_178927 ?auto_178928 ) ) ( not ( = ?auto_178927 ?auto_178929 ) ) ( not ( = ?auto_178927 ?auto_178930 ) ) ( not ( = ?auto_178927 ?auto_178931 ) ) ( not ( = ?auto_178927 ?auto_178932 ) ) ( not ( = ?auto_178928 ?auto_178929 ) ) ( not ( = ?auto_178928 ?auto_178930 ) ) ( not ( = ?auto_178928 ?auto_178931 ) ) ( not ( = ?auto_178928 ?auto_178932 ) ) ( not ( = ?auto_178929 ?auto_178930 ) ) ( not ( = ?auto_178929 ?auto_178931 ) ) ( not ( = ?auto_178929 ?auto_178932 ) ) ( not ( = ?auto_178930 ?auto_178931 ) ) ( not ( = ?auto_178930 ?auto_178932 ) ) ( not ( = ?auto_178931 ?auto_178932 ) ) ( ON ?auto_178932 ?auto_178934 ) ( not ( = ?auto_178926 ?auto_178934 ) ) ( not ( = ?auto_178927 ?auto_178934 ) ) ( not ( = ?auto_178928 ?auto_178934 ) ) ( not ( = ?auto_178929 ?auto_178934 ) ) ( not ( = ?auto_178930 ?auto_178934 ) ) ( not ( = ?auto_178931 ?auto_178934 ) ) ( not ( = ?auto_178932 ?auto_178934 ) ) ( ON ?auto_178931 ?auto_178932 ) ( ON-TABLE ?auto_178934 ) ( ON ?auto_178930 ?auto_178931 ) ( ON ?auto_178926 ?auto_178933 ) ( not ( = ?auto_178926 ?auto_178933 ) ) ( not ( = ?auto_178927 ?auto_178933 ) ) ( not ( = ?auto_178928 ?auto_178933 ) ) ( not ( = ?auto_178929 ?auto_178933 ) ) ( not ( = ?auto_178930 ?auto_178933 ) ) ( not ( = ?auto_178931 ?auto_178933 ) ) ( not ( = ?auto_178932 ?auto_178933 ) ) ( not ( = ?auto_178934 ?auto_178933 ) ) ( ON ?auto_178927 ?auto_178926 ) ( ON-TABLE ?auto_178933 ) ( ON ?auto_178928 ?auto_178927 ) ( CLEAR ?auto_178928 ) ( HOLDING ?auto_178929 ) ( CLEAR ?auto_178930 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178934 ?auto_178932 ?auto_178931 ?auto_178930 ?auto_178929 )
      ( MAKE-7PILE ?auto_178926 ?auto_178927 ?auto_178928 ?auto_178929 ?auto_178930 ?auto_178931 ?auto_178932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178935 - BLOCK
      ?auto_178936 - BLOCK
      ?auto_178937 - BLOCK
      ?auto_178938 - BLOCK
      ?auto_178939 - BLOCK
      ?auto_178940 - BLOCK
      ?auto_178941 - BLOCK
    )
    :vars
    (
      ?auto_178942 - BLOCK
      ?auto_178943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178935 ?auto_178936 ) ) ( not ( = ?auto_178935 ?auto_178937 ) ) ( not ( = ?auto_178935 ?auto_178938 ) ) ( not ( = ?auto_178935 ?auto_178939 ) ) ( not ( = ?auto_178935 ?auto_178940 ) ) ( not ( = ?auto_178935 ?auto_178941 ) ) ( not ( = ?auto_178936 ?auto_178937 ) ) ( not ( = ?auto_178936 ?auto_178938 ) ) ( not ( = ?auto_178936 ?auto_178939 ) ) ( not ( = ?auto_178936 ?auto_178940 ) ) ( not ( = ?auto_178936 ?auto_178941 ) ) ( not ( = ?auto_178937 ?auto_178938 ) ) ( not ( = ?auto_178937 ?auto_178939 ) ) ( not ( = ?auto_178937 ?auto_178940 ) ) ( not ( = ?auto_178937 ?auto_178941 ) ) ( not ( = ?auto_178938 ?auto_178939 ) ) ( not ( = ?auto_178938 ?auto_178940 ) ) ( not ( = ?auto_178938 ?auto_178941 ) ) ( not ( = ?auto_178939 ?auto_178940 ) ) ( not ( = ?auto_178939 ?auto_178941 ) ) ( not ( = ?auto_178940 ?auto_178941 ) ) ( ON ?auto_178941 ?auto_178942 ) ( not ( = ?auto_178935 ?auto_178942 ) ) ( not ( = ?auto_178936 ?auto_178942 ) ) ( not ( = ?auto_178937 ?auto_178942 ) ) ( not ( = ?auto_178938 ?auto_178942 ) ) ( not ( = ?auto_178939 ?auto_178942 ) ) ( not ( = ?auto_178940 ?auto_178942 ) ) ( not ( = ?auto_178941 ?auto_178942 ) ) ( ON ?auto_178940 ?auto_178941 ) ( ON-TABLE ?auto_178942 ) ( ON ?auto_178939 ?auto_178940 ) ( ON ?auto_178935 ?auto_178943 ) ( not ( = ?auto_178935 ?auto_178943 ) ) ( not ( = ?auto_178936 ?auto_178943 ) ) ( not ( = ?auto_178937 ?auto_178943 ) ) ( not ( = ?auto_178938 ?auto_178943 ) ) ( not ( = ?auto_178939 ?auto_178943 ) ) ( not ( = ?auto_178940 ?auto_178943 ) ) ( not ( = ?auto_178941 ?auto_178943 ) ) ( not ( = ?auto_178942 ?auto_178943 ) ) ( ON ?auto_178936 ?auto_178935 ) ( ON-TABLE ?auto_178943 ) ( ON ?auto_178937 ?auto_178936 ) ( CLEAR ?auto_178939 ) ( ON ?auto_178938 ?auto_178937 ) ( CLEAR ?auto_178938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178943 ?auto_178935 ?auto_178936 ?auto_178937 )
      ( MAKE-7PILE ?auto_178935 ?auto_178936 ?auto_178937 ?auto_178938 ?auto_178939 ?auto_178940 ?auto_178941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178944 - BLOCK
      ?auto_178945 - BLOCK
      ?auto_178946 - BLOCK
      ?auto_178947 - BLOCK
      ?auto_178948 - BLOCK
      ?auto_178949 - BLOCK
      ?auto_178950 - BLOCK
    )
    :vars
    (
      ?auto_178952 - BLOCK
      ?auto_178951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178944 ?auto_178945 ) ) ( not ( = ?auto_178944 ?auto_178946 ) ) ( not ( = ?auto_178944 ?auto_178947 ) ) ( not ( = ?auto_178944 ?auto_178948 ) ) ( not ( = ?auto_178944 ?auto_178949 ) ) ( not ( = ?auto_178944 ?auto_178950 ) ) ( not ( = ?auto_178945 ?auto_178946 ) ) ( not ( = ?auto_178945 ?auto_178947 ) ) ( not ( = ?auto_178945 ?auto_178948 ) ) ( not ( = ?auto_178945 ?auto_178949 ) ) ( not ( = ?auto_178945 ?auto_178950 ) ) ( not ( = ?auto_178946 ?auto_178947 ) ) ( not ( = ?auto_178946 ?auto_178948 ) ) ( not ( = ?auto_178946 ?auto_178949 ) ) ( not ( = ?auto_178946 ?auto_178950 ) ) ( not ( = ?auto_178947 ?auto_178948 ) ) ( not ( = ?auto_178947 ?auto_178949 ) ) ( not ( = ?auto_178947 ?auto_178950 ) ) ( not ( = ?auto_178948 ?auto_178949 ) ) ( not ( = ?auto_178948 ?auto_178950 ) ) ( not ( = ?auto_178949 ?auto_178950 ) ) ( ON ?auto_178950 ?auto_178952 ) ( not ( = ?auto_178944 ?auto_178952 ) ) ( not ( = ?auto_178945 ?auto_178952 ) ) ( not ( = ?auto_178946 ?auto_178952 ) ) ( not ( = ?auto_178947 ?auto_178952 ) ) ( not ( = ?auto_178948 ?auto_178952 ) ) ( not ( = ?auto_178949 ?auto_178952 ) ) ( not ( = ?auto_178950 ?auto_178952 ) ) ( ON ?auto_178949 ?auto_178950 ) ( ON-TABLE ?auto_178952 ) ( ON ?auto_178944 ?auto_178951 ) ( not ( = ?auto_178944 ?auto_178951 ) ) ( not ( = ?auto_178945 ?auto_178951 ) ) ( not ( = ?auto_178946 ?auto_178951 ) ) ( not ( = ?auto_178947 ?auto_178951 ) ) ( not ( = ?auto_178948 ?auto_178951 ) ) ( not ( = ?auto_178949 ?auto_178951 ) ) ( not ( = ?auto_178950 ?auto_178951 ) ) ( not ( = ?auto_178952 ?auto_178951 ) ) ( ON ?auto_178945 ?auto_178944 ) ( ON-TABLE ?auto_178951 ) ( ON ?auto_178946 ?auto_178945 ) ( ON ?auto_178947 ?auto_178946 ) ( CLEAR ?auto_178947 ) ( HOLDING ?auto_178948 ) ( CLEAR ?auto_178949 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_178952 ?auto_178950 ?auto_178949 ?auto_178948 )
      ( MAKE-7PILE ?auto_178944 ?auto_178945 ?auto_178946 ?auto_178947 ?auto_178948 ?auto_178949 ?auto_178950 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178953 - BLOCK
      ?auto_178954 - BLOCK
      ?auto_178955 - BLOCK
      ?auto_178956 - BLOCK
      ?auto_178957 - BLOCK
      ?auto_178958 - BLOCK
      ?auto_178959 - BLOCK
    )
    :vars
    (
      ?auto_178960 - BLOCK
      ?auto_178961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178953 ?auto_178954 ) ) ( not ( = ?auto_178953 ?auto_178955 ) ) ( not ( = ?auto_178953 ?auto_178956 ) ) ( not ( = ?auto_178953 ?auto_178957 ) ) ( not ( = ?auto_178953 ?auto_178958 ) ) ( not ( = ?auto_178953 ?auto_178959 ) ) ( not ( = ?auto_178954 ?auto_178955 ) ) ( not ( = ?auto_178954 ?auto_178956 ) ) ( not ( = ?auto_178954 ?auto_178957 ) ) ( not ( = ?auto_178954 ?auto_178958 ) ) ( not ( = ?auto_178954 ?auto_178959 ) ) ( not ( = ?auto_178955 ?auto_178956 ) ) ( not ( = ?auto_178955 ?auto_178957 ) ) ( not ( = ?auto_178955 ?auto_178958 ) ) ( not ( = ?auto_178955 ?auto_178959 ) ) ( not ( = ?auto_178956 ?auto_178957 ) ) ( not ( = ?auto_178956 ?auto_178958 ) ) ( not ( = ?auto_178956 ?auto_178959 ) ) ( not ( = ?auto_178957 ?auto_178958 ) ) ( not ( = ?auto_178957 ?auto_178959 ) ) ( not ( = ?auto_178958 ?auto_178959 ) ) ( ON ?auto_178959 ?auto_178960 ) ( not ( = ?auto_178953 ?auto_178960 ) ) ( not ( = ?auto_178954 ?auto_178960 ) ) ( not ( = ?auto_178955 ?auto_178960 ) ) ( not ( = ?auto_178956 ?auto_178960 ) ) ( not ( = ?auto_178957 ?auto_178960 ) ) ( not ( = ?auto_178958 ?auto_178960 ) ) ( not ( = ?auto_178959 ?auto_178960 ) ) ( ON ?auto_178958 ?auto_178959 ) ( ON-TABLE ?auto_178960 ) ( ON ?auto_178953 ?auto_178961 ) ( not ( = ?auto_178953 ?auto_178961 ) ) ( not ( = ?auto_178954 ?auto_178961 ) ) ( not ( = ?auto_178955 ?auto_178961 ) ) ( not ( = ?auto_178956 ?auto_178961 ) ) ( not ( = ?auto_178957 ?auto_178961 ) ) ( not ( = ?auto_178958 ?auto_178961 ) ) ( not ( = ?auto_178959 ?auto_178961 ) ) ( not ( = ?auto_178960 ?auto_178961 ) ) ( ON ?auto_178954 ?auto_178953 ) ( ON-TABLE ?auto_178961 ) ( ON ?auto_178955 ?auto_178954 ) ( ON ?auto_178956 ?auto_178955 ) ( CLEAR ?auto_178958 ) ( ON ?auto_178957 ?auto_178956 ) ( CLEAR ?auto_178957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_178961 ?auto_178953 ?auto_178954 ?auto_178955 ?auto_178956 )
      ( MAKE-7PILE ?auto_178953 ?auto_178954 ?auto_178955 ?auto_178956 ?auto_178957 ?auto_178958 ?auto_178959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178962 - BLOCK
      ?auto_178963 - BLOCK
      ?auto_178964 - BLOCK
      ?auto_178965 - BLOCK
      ?auto_178966 - BLOCK
      ?auto_178967 - BLOCK
      ?auto_178968 - BLOCK
    )
    :vars
    (
      ?auto_178969 - BLOCK
      ?auto_178970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178962 ?auto_178963 ) ) ( not ( = ?auto_178962 ?auto_178964 ) ) ( not ( = ?auto_178962 ?auto_178965 ) ) ( not ( = ?auto_178962 ?auto_178966 ) ) ( not ( = ?auto_178962 ?auto_178967 ) ) ( not ( = ?auto_178962 ?auto_178968 ) ) ( not ( = ?auto_178963 ?auto_178964 ) ) ( not ( = ?auto_178963 ?auto_178965 ) ) ( not ( = ?auto_178963 ?auto_178966 ) ) ( not ( = ?auto_178963 ?auto_178967 ) ) ( not ( = ?auto_178963 ?auto_178968 ) ) ( not ( = ?auto_178964 ?auto_178965 ) ) ( not ( = ?auto_178964 ?auto_178966 ) ) ( not ( = ?auto_178964 ?auto_178967 ) ) ( not ( = ?auto_178964 ?auto_178968 ) ) ( not ( = ?auto_178965 ?auto_178966 ) ) ( not ( = ?auto_178965 ?auto_178967 ) ) ( not ( = ?auto_178965 ?auto_178968 ) ) ( not ( = ?auto_178966 ?auto_178967 ) ) ( not ( = ?auto_178966 ?auto_178968 ) ) ( not ( = ?auto_178967 ?auto_178968 ) ) ( ON ?auto_178968 ?auto_178969 ) ( not ( = ?auto_178962 ?auto_178969 ) ) ( not ( = ?auto_178963 ?auto_178969 ) ) ( not ( = ?auto_178964 ?auto_178969 ) ) ( not ( = ?auto_178965 ?auto_178969 ) ) ( not ( = ?auto_178966 ?auto_178969 ) ) ( not ( = ?auto_178967 ?auto_178969 ) ) ( not ( = ?auto_178968 ?auto_178969 ) ) ( ON-TABLE ?auto_178969 ) ( ON ?auto_178962 ?auto_178970 ) ( not ( = ?auto_178962 ?auto_178970 ) ) ( not ( = ?auto_178963 ?auto_178970 ) ) ( not ( = ?auto_178964 ?auto_178970 ) ) ( not ( = ?auto_178965 ?auto_178970 ) ) ( not ( = ?auto_178966 ?auto_178970 ) ) ( not ( = ?auto_178967 ?auto_178970 ) ) ( not ( = ?auto_178968 ?auto_178970 ) ) ( not ( = ?auto_178969 ?auto_178970 ) ) ( ON ?auto_178963 ?auto_178962 ) ( ON-TABLE ?auto_178970 ) ( ON ?auto_178964 ?auto_178963 ) ( ON ?auto_178965 ?auto_178964 ) ( ON ?auto_178966 ?auto_178965 ) ( CLEAR ?auto_178966 ) ( HOLDING ?auto_178967 ) ( CLEAR ?auto_178968 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_178969 ?auto_178968 ?auto_178967 )
      ( MAKE-7PILE ?auto_178962 ?auto_178963 ?auto_178964 ?auto_178965 ?auto_178966 ?auto_178967 ?auto_178968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178971 - BLOCK
      ?auto_178972 - BLOCK
      ?auto_178973 - BLOCK
      ?auto_178974 - BLOCK
      ?auto_178975 - BLOCK
      ?auto_178976 - BLOCK
      ?auto_178977 - BLOCK
    )
    :vars
    (
      ?auto_178978 - BLOCK
      ?auto_178979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178971 ?auto_178972 ) ) ( not ( = ?auto_178971 ?auto_178973 ) ) ( not ( = ?auto_178971 ?auto_178974 ) ) ( not ( = ?auto_178971 ?auto_178975 ) ) ( not ( = ?auto_178971 ?auto_178976 ) ) ( not ( = ?auto_178971 ?auto_178977 ) ) ( not ( = ?auto_178972 ?auto_178973 ) ) ( not ( = ?auto_178972 ?auto_178974 ) ) ( not ( = ?auto_178972 ?auto_178975 ) ) ( not ( = ?auto_178972 ?auto_178976 ) ) ( not ( = ?auto_178972 ?auto_178977 ) ) ( not ( = ?auto_178973 ?auto_178974 ) ) ( not ( = ?auto_178973 ?auto_178975 ) ) ( not ( = ?auto_178973 ?auto_178976 ) ) ( not ( = ?auto_178973 ?auto_178977 ) ) ( not ( = ?auto_178974 ?auto_178975 ) ) ( not ( = ?auto_178974 ?auto_178976 ) ) ( not ( = ?auto_178974 ?auto_178977 ) ) ( not ( = ?auto_178975 ?auto_178976 ) ) ( not ( = ?auto_178975 ?auto_178977 ) ) ( not ( = ?auto_178976 ?auto_178977 ) ) ( ON ?auto_178977 ?auto_178978 ) ( not ( = ?auto_178971 ?auto_178978 ) ) ( not ( = ?auto_178972 ?auto_178978 ) ) ( not ( = ?auto_178973 ?auto_178978 ) ) ( not ( = ?auto_178974 ?auto_178978 ) ) ( not ( = ?auto_178975 ?auto_178978 ) ) ( not ( = ?auto_178976 ?auto_178978 ) ) ( not ( = ?auto_178977 ?auto_178978 ) ) ( ON-TABLE ?auto_178978 ) ( ON ?auto_178971 ?auto_178979 ) ( not ( = ?auto_178971 ?auto_178979 ) ) ( not ( = ?auto_178972 ?auto_178979 ) ) ( not ( = ?auto_178973 ?auto_178979 ) ) ( not ( = ?auto_178974 ?auto_178979 ) ) ( not ( = ?auto_178975 ?auto_178979 ) ) ( not ( = ?auto_178976 ?auto_178979 ) ) ( not ( = ?auto_178977 ?auto_178979 ) ) ( not ( = ?auto_178978 ?auto_178979 ) ) ( ON ?auto_178972 ?auto_178971 ) ( ON-TABLE ?auto_178979 ) ( ON ?auto_178973 ?auto_178972 ) ( ON ?auto_178974 ?auto_178973 ) ( ON ?auto_178975 ?auto_178974 ) ( CLEAR ?auto_178977 ) ( ON ?auto_178976 ?auto_178975 ) ( CLEAR ?auto_178976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_178979 ?auto_178971 ?auto_178972 ?auto_178973 ?auto_178974 ?auto_178975 )
      ( MAKE-7PILE ?auto_178971 ?auto_178972 ?auto_178973 ?auto_178974 ?auto_178975 ?auto_178976 ?auto_178977 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178980 - BLOCK
      ?auto_178981 - BLOCK
      ?auto_178982 - BLOCK
      ?auto_178983 - BLOCK
      ?auto_178984 - BLOCK
      ?auto_178985 - BLOCK
      ?auto_178986 - BLOCK
    )
    :vars
    (
      ?auto_178988 - BLOCK
      ?auto_178987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178980 ?auto_178981 ) ) ( not ( = ?auto_178980 ?auto_178982 ) ) ( not ( = ?auto_178980 ?auto_178983 ) ) ( not ( = ?auto_178980 ?auto_178984 ) ) ( not ( = ?auto_178980 ?auto_178985 ) ) ( not ( = ?auto_178980 ?auto_178986 ) ) ( not ( = ?auto_178981 ?auto_178982 ) ) ( not ( = ?auto_178981 ?auto_178983 ) ) ( not ( = ?auto_178981 ?auto_178984 ) ) ( not ( = ?auto_178981 ?auto_178985 ) ) ( not ( = ?auto_178981 ?auto_178986 ) ) ( not ( = ?auto_178982 ?auto_178983 ) ) ( not ( = ?auto_178982 ?auto_178984 ) ) ( not ( = ?auto_178982 ?auto_178985 ) ) ( not ( = ?auto_178982 ?auto_178986 ) ) ( not ( = ?auto_178983 ?auto_178984 ) ) ( not ( = ?auto_178983 ?auto_178985 ) ) ( not ( = ?auto_178983 ?auto_178986 ) ) ( not ( = ?auto_178984 ?auto_178985 ) ) ( not ( = ?auto_178984 ?auto_178986 ) ) ( not ( = ?auto_178985 ?auto_178986 ) ) ( not ( = ?auto_178980 ?auto_178988 ) ) ( not ( = ?auto_178981 ?auto_178988 ) ) ( not ( = ?auto_178982 ?auto_178988 ) ) ( not ( = ?auto_178983 ?auto_178988 ) ) ( not ( = ?auto_178984 ?auto_178988 ) ) ( not ( = ?auto_178985 ?auto_178988 ) ) ( not ( = ?auto_178986 ?auto_178988 ) ) ( ON-TABLE ?auto_178988 ) ( ON ?auto_178980 ?auto_178987 ) ( not ( = ?auto_178980 ?auto_178987 ) ) ( not ( = ?auto_178981 ?auto_178987 ) ) ( not ( = ?auto_178982 ?auto_178987 ) ) ( not ( = ?auto_178983 ?auto_178987 ) ) ( not ( = ?auto_178984 ?auto_178987 ) ) ( not ( = ?auto_178985 ?auto_178987 ) ) ( not ( = ?auto_178986 ?auto_178987 ) ) ( not ( = ?auto_178988 ?auto_178987 ) ) ( ON ?auto_178981 ?auto_178980 ) ( ON-TABLE ?auto_178987 ) ( ON ?auto_178982 ?auto_178981 ) ( ON ?auto_178983 ?auto_178982 ) ( ON ?auto_178984 ?auto_178983 ) ( ON ?auto_178985 ?auto_178984 ) ( CLEAR ?auto_178985 ) ( HOLDING ?auto_178986 ) ( CLEAR ?auto_178988 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_178988 ?auto_178986 )
      ( MAKE-7PILE ?auto_178980 ?auto_178981 ?auto_178982 ?auto_178983 ?auto_178984 ?auto_178985 ?auto_178986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178989 - BLOCK
      ?auto_178990 - BLOCK
      ?auto_178991 - BLOCK
      ?auto_178992 - BLOCK
      ?auto_178993 - BLOCK
      ?auto_178994 - BLOCK
      ?auto_178995 - BLOCK
    )
    :vars
    (
      ?auto_178997 - BLOCK
      ?auto_178996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178989 ?auto_178990 ) ) ( not ( = ?auto_178989 ?auto_178991 ) ) ( not ( = ?auto_178989 ?auto_178992 ) ) ( not ( = ?auto_178989 ?auto_178993 ) ) ( not ( = ?auto_178989 ?auto_178994 ) ) ( not ( = ?auto_178989 ?auto_178995 ) ) ( not ( = ?auto_178990 ?auto_178991 ) ) ( not ( = ?auto_178990 ?auto_178992 ) ) ( not ( = ?auto_178990 ?auto_178993 ) ) ( not ( = ?auto_178990 ?auto_178994 ) ) ( not ( = ?auto_178990 ?auto_178995 ) ) ( not ( = ?auto_178991 ?auto_178992 ) ) ( not ( = ?auto_178991 ?auto_178993 ) ) ( not ( = ?auto_178991 ?auto_178994 ) ) ( not ( = ?auto_178991 ?auto_178995 ) ) ( not ( = ?auto_178992 ?auto_178993 ) ) ( not ( = ?auto_178992 ?auto_178994 ) ) ( not ( = ?auto_178992 ?auto_178995 ) ) ( not ( = ?auto_178993 ?auto_178994 ) ) ( not ( = ?auto_178993 ?auto_178995 ) ) ( not ( = ?auto_178994 ?auto_178995 ) ) ( not ( = ?auto_178989 ?auto_178997 ) ) ( not ( = ?auto_178990 ?auto_178997 ) ) ( not ( = ?auto_178991 ?auto_178997 ) ) ( not ( = ?auto_178992 ?auto_178997 ) ) ( not ( = ?auto_178993 ?auto_178997 ) ) ( not ( = ?auto_178994 ?auto_178997 ) ) ( not ( = ?auto_178995 ?auto_178997 ) ) ( ON-TABLE ?auto_178997 ) ( ON ?auto_178989 ?auto_178996 ) ( not ( = ?auto_178989 ?auto_178996 ) ) ( not ( = ?auto_178990 ?auto_178996 ) ) ( not ( = ?auto_178991 ?auto_178996 ) ) ( not ( = ?auto_178992 ?auto_178996 ) ) ( not ( = ?auto_178993 ?auto_178996 ) ) ( not ( = ?auto_178994 ?auto_178996 ) ) ( not ( = ?auto_178995 ?auto_178996 ) ) ( not ( = ?auto_178997 ?auto_178996 ) ) ( ON ?auto_178990 ?auto_178989 ) ( ON-TABLE ?auto_178996 ) ( ON ?auto_178991 ?auto_178990 ) ( ON ?auto_178992 ?auto_178991 ) ( ON ?auto_178993 ?auto_178992 ) ( ON ?auto_178994 ?auto_178993 ) ( CLEAR ?auto_178997 ) ( ON ?auto_178995 ?auto_178994 ) ( CLEAR ?auto_178995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_178996 ?auto_178989 ?auto_178990 ?auto_178991 ?auto_178992 ?auto_178993 ?auto_178994 )
      ( MAKE-7PILE ?auto_178989 ?auto_178990 ?auto_178991 ?auto_178992 ?auto_178993 ?auto_178994 ?auto_178995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_178998 - BLOCK
      ?auto_178999 - BLOCK
      ?auto_179000 - BLOCK
      ?auto_179001 - BLOCK
      ?auto_179002 - BLOCK
      ?auto_179003 - BLOCK
      ?auto_179004 - BLOCK
    )
    :vars
    (
      ?auto_179006 - BLOCK
      ?auto_179005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_178998 ?auto_178999 ) ) ( not ( = ?auto_178998 ?auto_179000 ) ) ( not ( = ?auto_178998 ?auto_179001 ) ) ( not ( = ?auto_178998 ?auto_179002 ) ) ( not ( = ?auto_178998 ?auto_179003 ) ) ( not ( = ?auto_178998 ?auto_179004 ) ) ( not ( = ?auto_178999 ?auto_179000 ) ) ( not ( = ?auto_178999 ?auto_179001 ) ) ( not ( = ?auto_178999 ?auto_179002 ) ) ( not ( = ?auto_178999 ?auto_179003 ) ) ( not ( = ?auto_178999 ?auto_179004 ) ) ( not ( = ?auto_179000 ?auto_179001 ) ) ( not ( = ?auto_179000 ?auto_179002 ) ) ( not ( = ?auto_179000 ?auto_179003 ) ) ( not ( = ?auto_179000 ?auto_179004 ) ) ( not ( = ?auto_179001 ?auto_179002 ) ) ( not ( = ?auto_179001 ?auto_179003 ) ) ( not ( = ?auto_179001 ?auto_179004 ) ) ( not ( = ?auto_179002 ?auto_179003 ) ) ( not ( = ?auto_179002 ?auto_179004 ) ) ( not ( = ?auto_179003 ?auto_179004 ) ) ( not ( = ?auto_178998 ?auto_179006 ) ) ( not ( = ?auto_178999 ?auto_179006 ) ) ( not ( = ?auto_179000 ?auto_179006 ) ) ( not ( = ?auto_179001 ?auto_179006 ) ) ( not ( = ?auto_179002 ?auto_179006 ) ) ( not ( = ?auto_179003 ?auto_179006 ) ) ( not ( = ?auto_179004 ?auto_179006 ) ) ( ON ?auto_178998 ?auto_179005 ) ( not ( = ?auto_178998 ?auto_179005 ) ) ( not ( = ?auto_178999 ?auto_179005 ) ) ( not ( = ?auto_179000 ?auto_179005 ) ) ( not ( = ?auto_179001 ?auto_179005 ) ) ( not ( = ?auto_179002 ?auto_179005 ) ) ( not ( = ?auto_179003 ?auto_179005 ) ) ( not ( = ?auto_179004 ?auto_179005 ) ) ( not ( = ?auto_179006 ?auto_179005 ) ) ( ON ?auto_178999 ?auto_178998 ) ( ON-TABLE ?auto_179005 ) ( ON ?auto_179000 ?auto_178999 ) ( ON ?auto_179001 ?auto_179000 ) ( ON ?auto_179002 ?auto_179001 ) ( ON ?auto_179003 ?auto_179002 ) ( ON ?auto_179004 ?auto_179003 ) ( CLEAR ?auto_179004 ) ( HOLDING ?auto_179006 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179006 )
      ( MAKE-7PILE ?auto_178998 ?auto_178999 ?auto_179000 ?auto_179001 ?auto_179002 ?auto_179003 ?auto_179004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_179007 - BLOCK
      ?auto_179008 - BLOCK
      ?auto_179009 - BLOCK
      ?auto_179010 - BLOCK
      ?auto_179011 - BLOCK
      ?auto_179012 - BLOCK
      ?auto_179013 - BLOCK
    )
    :vars
    (
      ?auto_179015 - BLOCK
      ?auto_179014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179007 ?auto_179008 ) ) ( not ( = ?auto_179007 ?auto_179009 ) ) ( not ( = ?auto_179007 ?auto_179010 ) ) ( not ( = ?auto_179007 ?auto_179011 ) ) ( not ( = ?auto_179007 ?auto_179012 ) ) ( not ( = ?auto_179007 ?auto_179013 ) ) ( not ( = ?auto_179008 ?auto_179009 ) ) ( not ( = ?auto_179008 ?auto_179010 ) ) ( not ( = ?auto_179008 ?auto_179011 ) ) ( not ( = ?auto_179008 ?auto_179012 ) ) ( not ( = ?auto_179008 ?auto_179013 ) ) ( not ( = ?auto_179009 ?auto_179010 ) ) ( not ( = ?auto_179009 ?auto_179011 ) ) ( not ( = ?auto_179009 ?auto_179012 ) ) ( not ( = ?auto_179009 ?auto_179013 ) ) ( not ( = ?auto_179010 ?auto_179011 ) ) ( not ( = ?auto_179010 ?auto_179012 ) ) ( not ( = ?auto_179010 ?auto_179013 ) ) ( not ( = ?auto_179011 ?auto_179012 ) ) ( not ( = ?auto_179011 ?auto_179013 ) ) ( not ( = ?auto_179012 ?auto_179013 ) ) ( not ( = ?auto_179007 ?auto_179015 ) ) ( not ( = ?auto_179008 ?auto_179015 ) ) ( not ( = ?auto_179009 ?auto_179015 ) ) ( not ( = ?auto_179010 ?auto_179015 ) ) ( not ( = ?auto_179011 ?auto_179015 ) ) ( not ( = ?auto_179012 ?auto_179015 ) ) ( not ( = ?auto_179013 ?auto_179015 ) ) ( ON ?auto_179007 ?auto_179014 ) ( not ( = ?auto_179007 ?auto_179014 ) ) ( not ( = ?auto_179008 ?auto_179014 ) ) ( not ( = ?auto_179009 ?auto_179014 ) ) ( not ( = ?auto_179010 ?auto_179014 ) ) ( not ( = ?auto_179011 ?auto_179014 ) ) ( not ( = ?auto_179012 ?auto_179014 ) ) ( not ( = ?auto_179013 ?auto_179014 ) ) ( not ( = ?auto_179015 ?auto_179014 ) ) ( ON ?auto_179008 ?auto_179007 ) ( ON-TABLE ?auto_179014 ) ( ON ?auto_179009 ?auto_179008 ) ( ON ?auto_179010 ?auto_179009 ) ( ON ?auto_179011 ?auto_179010 ) ( ON ?auto_179012 ?auto_179011 ) ( ON ?auto_179013 ?auto_179012 ) ( ON ?auto_179015 ?auto_179013 ) ( CLEAR ?auto_179015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179014 ?auto_179007 ?auto_179008 ?auto_179009 ?auto_179010 ?auto_179011 ?auto_179012 ?auto_179013 )
      ( MAKE-7PILE ?auto_179007 ?auto_179008 ?auto_179009 ?auto_179010 ?auto_179011 ?auto_179012 ?auto_179013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179024 - BLOCK
      ?auto_179025 - BLOCK
      ?auto_179026 - BLOCK
      ?auto_179027 - BLOCK
      ?auto_179028 - BLOCK
      ?auto_179029 - BLOCK
      ?auto_179030 - BLOCK
      ?auto_179031 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_179031 ) ( CLEAR ?auto_179030 ) ( ON-TABLE ?auto_179024 ) ( ON ?auto_179025 ?auto_179024 ) ( ON ?auto_179026 ?auto_179025 ) ( ON ?auto_179027 ?auto_179026 ) ( ON ?auto_179028 ?auto_179027 ) ( ON ?auto_179029 ?auto_179028 ) ( ON ?auto_179030 ?auto_179029 ) ( not ( = ?auto_179024 ?auto_179025 ) ) ( not ( = ?auto_179024 ?auto_179026 ) ) ( not ( = ?auto_179024 ?auto_179027 ) ) ( not ( = ?auto_179024 ?auto_179028 ) ) ( not ( = ?auto_179024 ?auto_179029 ) ) ( not ( = ?auto_179024 ?auto_179030 ) ) ( not ( = ?auto_179024 ?auto_179031 ) ) ( not ( = ?auto_179025 ?auto_179026 ) ) ( not ( = ?auto_179025 ?auto_179027 ) ) ( not ( = ?auto_179025 ?auto_179028 ) ) ( not ( = ?auto_179025 ?auto_179029 ) ) ( not ( = ?auto_179025 ?auto_179030 ) ) ( not ( = ?auto_179025 ?auto_179031 ) ) ( not ( = ?auto_179026 ?auto_179027 ) ) ( not ( = ?auto_179026 ?auto_179028 ) ) ( not ( = ?auto_179026 ?auto_179029 ) ) ( not ( = ?auto_179026 ?auto_179030 ) ) ( not ( = ?auto_179026 ?auto_179031 ) ) ( not ( = ?auto_179027 ?auto_179028 ) ) ( not ( = ?auto_179027 ?auto_179029 ) ) ( not ( = ?auto_179027 ?auto_179030 ) ) ( not ( = ?auto_179027 ?auto_179031 ) ) ( not ( = ?auto_179028 ?auto_179029 ) ) ( not ( = ?auto_179028 ?auto_179030 ) ) ( not ( = ?auto_179028 ?auto_179031 ) ) ( not ( = ?auto_179029 ?auto_179030 ) ) ( not ( = ?auto_179029 ?auto_179031 ) ) ( not ( = ?auto_179030 ?auto_179031 ) ) )
    :subtasks
    ( ( !STACK ?auto_179031 ?auto_179030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179032 - BLOCK
      ?auto_179033 - BLOCK
      ?auto_179034 - BLOCK
      ?auto_179035 - BLOCK
      ?auto_179036 - BLOCK
      ?auto_179037 - BLOCK
      ?auto_179038 - BLOCK
      ?auto_179039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_179038 ) ( ON-TABLE ?auto_179032 ) ( ON ?auto_179033 ?auto_179032 ) ( ON ?auto_179034 ?auto_179033 ) ( ON ?auto_179035 ?auto_179034 ) ( ON ?auto_179036 ?auto_179035 ) ( ON ?auto_179037 ?auto_179036 ) ( ON ?auto_179038 ?auto_179037 ) ( not ( = ?auto_179032 ?auto_179033 ) ) ( not ( = ?auto_179032 ?auto_179034 ) ) ( not ( = ?auto_179032 ?auto_179035 ) ) ( not ( = ?auto_179032 ?auto_179036 ) ) ( not ( = ?auto_179032 ?auto_179037 ) ) ( not ( = ?auto_179032 ?auto_179038 ) ) ( not ( = ?auto_179032 ?auto_179039 ) ) ( not ( = ?auto_179033 ?auto_179034 ) ) ( not ( = ?auto_179033 ?auto_179035 ) ) ( not ( = ?auto_179033 ?auto_179036 ) ) ( not ( = ?auto_179033 ?auto_179037 ) ) ( not ( = ?auto_179033 ?auto_179038 ) ) ( not ( = ?auto_179033 ?auto_179039 ) ) ( not ( = ?auto_179034 ?auto_179035 ) ) ( not ( = ?auto_179034 ?auto_179036 ) ) ( not ( = ?auto_179034 ?auto_179037 ) ) ( not ( = ?auto_179034 ?auto_179038 ) ) ( not ( = ?auto_179034 ?auto_179039 ) ) ( not ( = ?auto_179035 ?auto_179036 ) ) ( not ( = ?auto_179035 ?auto_179037 ) ) ( not ( = ?auto_179035 ?auto_179038 ) ) ( not ( = ?auto_179035 ?auto_179039 ) ) ( not ( = ?auto_179036 ?auto_179037 ) ) ( not ( = ?auto_179036 ?auto_179038 ) ) ( not ( = ?auto_179036 ?auto_179039 ) ) ( not ( = ?auto_179037 ?auto_179038 ) ) ( not ( = ?auto_179037 ?auto_179039 ) ) ( not ( = ?auto_179038 ?auto_179039 ) ) ( ON-TABLE ?auto_179039 ) ( CLEAR ?auto_179039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_179039 )
      ( MAKE-8PILE ?auto_179032 ?auto_179033 ?auto_179034 ?auto_179035 ?auto_179036 ?auto_179037 ?auto_179038 ?auto_179039 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179040 - BLOCK
      ?auto_179041 - BLOCK
      ?auto_179042 - BLOCK
      ?auto_179043 - BLOCK
      ?auto_179044 - BLOCK
      ?auto_179045 - BLOCK
      ?auto_179046 - BLOCK
      ?auto_179047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179040 ) ( ON ?auto_179041 ?auto_179040 ) ( ON ?auto_179042 ?auto_179041 ) ( ON ?auto_179043 ?auto_179042 ) ( ON ?auto_179044 ?auto_179043 ) ( ON ?auto_179045 ?auto_179044 ) ( not ( = ?auto_179040 ?auto_179041 ) ) ( not ( = ?auto_179040 ?auto_179042 ) ) ( not ( = ?auto_179040 ?auto_179043 ) ) ( not ( = ?auto_179040 ?auto_179044 ) ) ( not ( = ?auto_179040 ?auto_179045 ) ) ( not ( = ?auto_179040 ?auto_179046 ) ) ( not ( = ?auto_179040 ?auto_179047 ) ) ( not ( = ?auto_179041 ?auto_179042 ) ) ( not ( = ?auto_179041 ?auto_179043 ) ) ( not ( = ?auto_179041 ?auto_179044 ) ) ( not ( = ?auto_179041 ?auto_179045 ) ) ( not ( = ?auto_179041 ?auto_179046 ) ) ( not ( = ?auto_179041 ?auto_179047 ) ) ( not ( = ?auto_179042 ?auto_179043 ) ) ( not ( = ?auto_179042 ?auto_179044 ) ) ( not ( = ?auto_179042 ?auto_179045 ) ) ( not ( = ?auto_179042 ?auto_179046 ) ) ( not ( = ?auto_179042 ?auto_179047 ) ) ( not ( = ?auto_179043 ?auto_179044 ) ) ( not ( = ?auto_179043 ?auto_179045 ) ) ( not ( = ?auto_179043 ?auto_179046 ) ) ( not ( = ?auto_179043 ?auto_179047 ) ) ( not ( = ?auto_179044 ?auto_179045 ) ) ( not ( = ?auto_179044 ?auto_179046 ) ) ( not ( = ?auto_179044 ?auto_179047 ) ) ( not ( = ?auto_179045 ?auto_179046 ) ) ( not ( = ?auto_179045 ?auto_179047 ) ) ( not ( = ?auto_179046 ?auto_179047 ) ) ( ON-TABLE ?auto_179047 ) ( CLEAR ?auto_179047 ) ( HOLDING ?auto_179046 ) ( CLEAR ?auto_179045 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179040 ?auto_179041 ?auto_179042 ?auto_179043 ?auto_179044 ?auto_179045 ?auto_179046 )
      ( MAKE-8PILE ?auto_179040 ?auto_179041 ?auto_179042 ?auto_179043 ?auto_179044 ?auto_179045 ?auto_179046 ?auto_179047 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179048 - BLOCK
      ?auto_179049 - BLOCK
      ?auto_179050 - BLOCK
      ?auto_179051 - BLOCK
      ?auto_179052 - BLOCK
      ?auto_179053 - BLOCK
      ?auto_179054 - BLOCK
      ?auto_179055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179048 ) ( ON ?auto_179049 ?auto_179048 ) ( ON ?auto_179050 ?auto_179049 ) ( ON ?auto_179051 ?auto_179050 ) ( ON ?auto_179052 ?auto_179051 ) ( ON ?auto_179053 ?auto_179052 ) ( not ( = ?auto_179048 ?auto_179049 ) ) ( not ( = ?auto_179048 ?auto_179050 ) ) ( not ( = ?auto_179048 ?auto_179051 ) ) ( not ( = ?auto_179048 ?auto_179052 ) ) ( not ( = ?auto_179048 ?auto_179053 ) ) ( not ( = ?auto_179048 ?auto_179054 ) ) ( not ( = ?auto_179048 ?auto_179055 ) ) ( not ( = ?auto_179049 ?auto_179050 ) ) ( not ( = ?auto_179049 ?auto_179051 ) ) ( not ( = ?auto_179049 ?auto_179052 ) ) ( not ( = ?auto_179049 ?auto_179053 ) ) ( not ( = ?auto_179049 ?auto_179054 ) ) ( not ( = ?auto_179049 ?auto_179055 ) ) ( not ( = ?auto_179050 ?auto_179051 ) ) ( not ( = ?auto_179050 ?auto_179052 ) ) ( not ( = ?auto_179050 ?auto_179053 ) ) ( not ( = ?auto_179050 ?auto_179054 ) ) ( not ( = ?auto_179050 ?auto_179055 ) ) ( not ( = ?auto_179051 ?auto_179052 ) ) ( not ( = ?auto_179051 ?auto_179053 ) ) ( not ( = ?auto_179051 ?auto_179054 ) ) ( not ( = ?auto_179051 ?auto_179055 ) ) ( not ( = ?auto_179052 ?auto_179053 ) ) ( not ( = ?auto_179052 ?auto_179054 ) ) ( not ( = ?auto_179052 ?auto_179055 ) ) ( not ( = ?auto_179053 ?auto_179054 ) ) ( not ( = ?auto_179053 ?auto_179055 ) ) ( not ( = ?auto_179054 ?auto_179055 ) ) ( ON-TABLE ?auto_179055 ) ( CLEAR ?auto_179053 ) ( ON ?auto_179054 ?auto_179055 ) ( CLEAR ?auto_179054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179055 )
      ( MAKE-8PILE ?auto_179048 ?auto_179049 ?auto_179050 ?auto_179051 ?auto_179052 ?auto_179053 ?auto_179054 ?auto_179055 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179056 - BLOCK
      ?auto_179057 - BLOCK
      ?auto_179058 - BLOCK
      ?auto_179059 - BLOCK
      ?auto_179060 - BLOCK
      ?auto_179061 - BLOCK
      ?auto_179062 - BLOCK
      ?auto_179063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179056 ) ( ON ?auto_179057 ?auto_179056 ) ( ON ?auto_179058 ?auto_179057 ) ( ON ?auto_179059 ?auto_179058 ) ( ON ?auto_179060 ?auto_179059 ) ( not ( = ?auto_179056 ?auto_179057 ) ) ( not ( = ?auto_179056 ?auto_179058 ) ) ( not ( = ?auto_179056 ?auto_179059 ) ) ( not ( = ?auto_179056 ?auto_179060 ) ) ( not ( = ?auto_179056 ?auto_179061 ) ) ( not ( = ?auto_179056 ?auto_179062 ) ) ( not ( = ?auto_179056 ?auto_179063 ) ) ( not ( = ?auto_179057 ?auto_179058 ) ) ( not ( = ?auto_179057 ?auto_179059 ) ) ( not ( = ?auto_179057 ?auto_179060 ) ) ( not ( = ?auto_179057 ?auto_179061 ) ) ( not ( = ?auto_179057 ?auto_179062 ) ) ( not ( = ?auto_179057 ?auto_179063 ) ) ( not ( = ?auto_179058 ?auto_179059 ) ) ( not ( = ?auto_179058 ?auto_179060 ) ) ( not ( = ?auto_179058 ?auto_179061 ) ) ( not ( = ?auto_179058 ?auto_179062 ) ) ( not ( = ?auto_179058 ?auto_179063 ) ) ( not ( = ?auto_179059 ?auto_179060 ) ) ( not ( = ?auto_179059 ?auto_179061 ) ) ( not ( = ?auto_179059 ?auto_179062 ) ) ( not ( = ?auto_179059 ?auto_179063 ) ) ( not ( = ?auto_179060 ?auto_179061 ) ) ( not ( = ?auto_179060 ?auto_179062 ) ) ( not ( = ?auto_179060 ?auto_179063 ) ) ( not ( = ?auto_179061 ?auto_179062 ) ) ( not ( = ?auto_179061 ?auto_179063 ) ) ( not ( = ?auto_179062 ?auto_179063 ) ) ( ON-TABLE ?auto_179063 ) ( ON ?auto_179062 ?auto_179063 ) ( CLEAR ?auto_179062 ) ( HOLDING ?auto_179061 ) ( CLEAR ?auto_179060 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179056 ?auto_179057 ?auto_179058 ?auto_179059 ?auto_179060 ?auto_179061 )
      ( MAKE-8PILE ?auto_179056 ?auto_179057 ?auto_179058 ?auto_179059 ?auto_179060 ?auto_179061 ?auto_179062 ?auto_179063 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179064 - BLOCK
      ?auto_179065 - BLOCK
      ?auto_179066 - BLOCK
      ?auto_179067 - BLOCK
      ?auto_179068 - BLOCK
      ?auto_179069 - BLOCK
      ?auto_179070 - BLOCK
      ?auto_179071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179064 ) ( ON ?auto_179065 ?auto_179064 ) ( ON ?auto_179066 ?auto_179065 ) ( ON ?auto_179067 ?auto_179066 ) ( ON ?auto_179068 ?auto_179067 ) ( not ( = ?auto_179064 ?auto_179065 ) ) ( not ( = ?auto_179064 ?auto_179066 ) ) ( not ( = ?auto_179064 ?auto_179067 ) ) ( not ( = ?auto_179064 ?auto_179068 ) ) ( not ( = ?auto_179064 ?auto_179069 ) ) ( not ( = ?auto_179064 ?auto_179070 ) ) ( not ( = ?auto_179064 ?auto_179071 ) ) ( not ( = ?auto_179065 ?auto_179066 ) ) ( not ( = ?auto_179065 ?auto_179067 ) ) ( not ( = ?auto_179065 ?auto_179068 ) ) ( not ( = ?auto_179065 ?auto_179069 ) ) ( not ( = ?auto_179065 ?auto_179070 ) ) ( not ( = ?auto_179065 ?auto_179071 ) ) ( not ( = ?auto_179066 ?auto_179067 ) ) ( not ( = ?auto_179066 ?auto_179068 ) ) ( not ( = ?auto_179066 ?auto_179069 ) ) ( not ( = ?auto_179066 ?auto_179070 ) ) ( not ( = ?auto_179066 ?auto_179071 ) ) ( not ( = ?auto_179067 ?auto_179068 ) ) ( not ( = ?auto_179067 ?auto_179069 ) ) ( not ( = ?auto_179067 ?auto_179070 ) ) ( not ( = ?auto_179067 ?auto_179071 ) ) ( not ( = ?auto_179068 ?auto_179069 ) ) ( not ( = ?auto_179068 ?auto_179070 ) ) ( not ( = ?auto_179068 ?auto_179071 ) ) ( not ( = ?auto_179069 ?auto_179070 ) ) ( not ( = ?auto_179069 ?auto_179071 ) ) ( not ( = ?auto_179070 ?auto_179071 ) ) ( ON-TABLE ?auto_179071 ) ( ON ?auto_179070 ?auto_179071 ) ( CLEAR ?auto_179068 ) ( ON ?auto_179069 ?auto_179070 ) ( CLEAR ?auto_179069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179071 ?auto_179070 )
      ( MAKE-8PILE ?auto_179064 ?auto_179065 ?auto_179066 ?auto_179067 ?auto_179068 ?auto_179069 ?auto_179070 ?auto_179071 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179072 - BLOCK
      ?auto_179073 - BLOCK
      ?auto_179074 - BLOCK
      ?auto_179075 - BLOCK
      ?auto_179076 - BLOCK
      ?auto_179077 - BLOCK
      ?auto_179078 - BLOCK
      ?auto_179079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179072 ) ( ON ?auto_179073 ?auto_179072 ) ( ON ?auto_179074 ?auto_179073 ) ( ON ?auto_179075 ?auto_179074 ) ( not ( = ?auto_179072 ?auto_179073 ) ) ( not ( = ?auto_179072 ?auto_179074 ) ) ( not ( = ?auto_179072 ?auto_179075 ) ) ( not ( = ?auto_179072 ?auto_179076 ) ) ( not ( = ?auto_179072 ?auto_179077 ) ) ( not ( = ?auto_179072 ?auto_179078 ) ) ( not ( = ?auto_179072 ?auto_179079 ) ) ( not ( = ?auto_179073 ?auto_179074 ) ) ( not ( = ?auto_179073 ?auto_179075 ) ) ( not ( = ?auto_179073 ?auto_179076 ) ) ( not ( = ?auto_179073 ?auto_179077 ) ) ( not ( = ?auto_179073 ?auto_179078 ) ) ( not ( = ?auto_179073 ?auto_179079 ) ) ( not ( = ?auto_179074 ?auto_179075 ) ) ( not ( = ?auto_179074 ?auto_179076 ) ) ( not ( = ?auto_179074 ?auto_179077 ) ) ( not ( = ?auto_179074 ?auto_179078 ) ) ( not ( = ?auto_179074 ?auto_179079 ) ) ( not ( = ?auto_179075 ?auto_179076 ) ) ( not ( = ?auto_179075 ?auto_179077 ) ) ( not ( = ?auto_179075 ?auto_179078 ) ) ( not ( = ?auto_179075 ?auto_179079 ) ) ( not ( = ?auto_179076 ?auto_179077 ) ) ( not ( = ?auto_179076 ?auto_179078 ) ) ( not ( = ?auto_179076 ?auto_179079 ) ) ( not ( = ?auto_179077 ?auto_179078 ) ) ( not ( = ?auto_179077 ?auto_179079 ) ) ( not ( = ?auto_179078 ?auto_179079 ) ) ( ON-TABLE ?auto_179079 ) ( ON ?auto_179078 ?auto_179079 ) ( ON ?auto_179077 ?auto_179078 ) ( CLEAR ?auto_179077 ) ( HOLDING ?auto_179076 ) ( CLEAR ?auto_179075 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179072 ?auto_179073 ?auto_179074 ?auto_179075 ?auto_179076 )
      ( MAKE-8PILE ?auto_179072 ?auto_179073 ?auto_179074 ?auto_179075 ?auto_179076 ?auto_179077 ?auto_179078 ?auto_179079 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179080 - BLOCK
      ?auto_179081 - BLOCK
      ?auto_179082 - BLOCK
      ?auto_179083 - BLOCK
      ?auto_179084 - BLOCK
      ?auto_179085 - BLOCK
      ?auto_179086 - BLOCK
      ?auto_179087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179080 ) ( ON ?auto_179081 ?auto_179080 ) ( ON ?auto_179082 ?auto_179081 ) ( ON ?auto_179083 ?auto_179082 ) ( not ( = ?auto_179080 ?auto_179081 ) ) ( not ( = ?auto_179080 ?auto_179082 ) ) ( not ( = ?auto_179080 ?auto_179083 ) ) ( not ( = ?auto_179080 ?auto_179084 ) ) ( not ( = ?auto_179080 ?auto_179085 ) ) ( not ( = ?auto_179080 ?auto_179086 ) ) ( not ( = ?auto_179080 ?auto_179087 ) ) ( not ( = ?auto_179081 ?auto_179082 ) ) ( not ( = ?auto_179081 ?auto_179083 ) ) ( not ( = ?auto_179081 ?auto_179084 ) ) ( not ( = ?auto_179081 ?auto_179085 ) ) ( not ( = ?auto_179081 ?auto_179086 ) ) ( not ( = ?auto_179081 ?auto_179087 ) ) ( not ( = ?auto_179082 ?auto_179083 ) ) ( not ( = ?auto_179082 ?auto_179084 ) ) ( not ( = ?auto_179082 ?auto_179085 ) ) ( not ( = ?auto_179082 ?auto_179086 ) ) ( not ( = ?auto_179082 ?auto_179087 ) ) ( not ( = ?auto_179083 ?auto_179084 ) ) ( not ( = ?auto_179083 ?auto_179085 ) ) ( not ( = ?auto_179083 ?auto_179086 ) ) ( not ( = ?auto_179083 ?auto_179087 ) ) ( not ( = ?auto_179084 ?auto_179085 ) ) ( not ( = ?auto_179084 ?auto_179086 ) ) ( not ( = ?auto_179084 ?auto_179087 ) ) ( not ( = ?auto_179085 ?auto_179086 ) ) ( not ( = ?auto_179085 ?auto_179087 ) ) ( not ( = ?auto_179086 ?auto_179087 ) ) ( ON-TABLE ?auto_179087 ) ( ON ?auto_179086 ?auto_179087 ) ( ON ?auto_179085 ?auto_179086 ) ( CLEAR ?auto_179083 ) ( ON ?auto_179084 ?auto_179085 ) ( CLEAR ?auto_179084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179087 ?auto_179086 ?auto_179085 )
      ( MAKE-8PILE ?auto_179080 ?auto_179081 ?auto_179082 ?auto_179083 ?auto_179084 ?auto_179085 ?auto_179086 ?auto_179087 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179088 - BLOCK
      ?auto_179089 - BLOCK
      ?auto_179090 - BLOCK
      ?auto_179091 - BLOCK
      ?auto_179092 - BLOCK
      ?auto_179093 - BLOCK
      ?auto_179094 - BLOCK
      ?auto_179095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179088 ) ( ON ?auto_179089 ?auto_179088 ) ( ON ?auto_179090 ?auto_179089 ) ( not ( = ?auto_179088 ?auto_179089 ) ) ( not ( = ?auto_179088 ?auto_179090 ) ) ( not ( = ?auto_179088 ?auto_179091 ) ) ( not ( = ?auto_179088 ?auto_179092 ) ) ( not ( = ?auto_179088 ?auto_179093 ) ) ( not ( = ?auto_179088 ?auto_179094 ) ) ( not ( = ?auto_179088 ?auto_179095 ) ) ( not ( = ?auto_179089 ?auto_179090 ) ) ( not ( = ?auto_179089 ?auto_179091 ) ) ( not ( = ?auto_179089 ?auto_179092 ) ) ( not ( = ?auto_179089 ?auto_179093 ) ) ( not ( = ?auto_179089 ?auto_179094 ) ) ( not ( = ?auto_179089 ?auto_179095 ) ) ( not ( = ?auto_179090 ?auto_179091 ) ) ( not ( = ?auto_179090 ?auto_179092 ) ) ( not ( = ?auto_179090 ?auto_179093 ) ) ( not ( = ?auto_179090 ?auto_179094 ) ) ( not ( = ?auto_179090 ?auto_179095 ) ) ( not ( = ?auto_179091 ?auto_179092 ) ) ( not ( = ?auto_179091 ?auto_179093 ) ) ( not ( = ?auto_179091 ?auto_179094 ) ) ( not ( = ?auto_179091 ?auto_179095 ) ) ( not ( = ?auto_179092 ?auto_179093 ) ) ( not ( = ?auto_179092 ?auto_179094 ) ) ( not ( = ?auto_179092 ?auto_179095 ) ) ( not ( = ?auto_179093 ?auto_179094 ) ) ( not ( = ?auto_179093 ?auto_179095 ) ) ( not ( = ?auto_179094 ?auto_179095 ) ) ( ON-TABLE ?auto_179095 ) ( ON ?auto_179094 ?auto_179095 ) ( ON ?auto_179093 ?auto_179094 ) ( ON ?auto_179092 ?auto_179093 ) ( CLEAR ?auto_179092 ) ( HOLDING ?auto_179091 ) ( CLEAR ?auto_179090 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179088 ?auto_179089 ?auto_179090 ?auto_179091 )
      ( MAKE-8PILE ?auto_179088 ?auto_179089 ?auto_179090 ?auto_179091 ?auto_179092 ?auto_179093 ?auto_179094 ?auto_179095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179096 - BLOCK
      ?auto_179097 - BLOCK
      ?auto_179098 - BLOCK
      ?auto_179099 - BLOCK
      ?auto_179100 - BLOCK
      ?auto_179101 - BLOCK
      ?auto_179102 - BLOCK
      ?auto_179103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179096 ) ( ON ?auto_179097 ?auto_179096 ) ( ON ?auto_179098 ?auto_179097 ) ( not ( = ?auto_179096 ?auto_179097 ) ) ( not ( = ?auto_179096 ?auto_179098 ) ) ( not ( = ?auto_179096 ?auto_179099 ) ) ( not ( = ?auto_179096 ?auto_179100 ) ) ( not ( = ?auto_179096 ?auto_179101 ) ) ( not ( = ?auto_179096 ?auto_179102 ) ) ( not ( = ?auto_179096 ?auto_179103 ) ) ( not ( = ?auto_179097 ?auto_179098 ) ) ( not ( = ?auto_179097 ?auto_179099 ) ) ( not ( = ?auto_179097 ?auto_179100 ) ) ( not ( = ?auto_179097 ?auto_179101 ) ) ( not ( = ?auto_179097 ?auto_179102 ) ) ( not ( = ?auto_179097 ?auto_179103 ) ) ( not ( = ?auto_179098 ?auto_179099 ) ) ( not ( = ?auto_179098 ?auto_179100 ) ) ( not ( = ?auto_179098 ?auto_179101 ) ) ( not ( = ?auto_179098 ?auto_179102 ) ) ( not ( = ?auto_179098 ?auto_179103 ) ) ( not ( = ?auto_179099 ?auto_179100 ) ) ( not ( = ?auto_179099 ?auto_179101 ) ) ( not ( = ?auto_179099 ?auto_179102 ) ) ( not ( = ?auto_179099 ?auto_179103 ) ) ( not ( = ?auto_179100 ?auto_179101 ) ) ( not ( = ?auto_179100 ?auto_179102 ) ) ( not ( = ?auto_179100 ?auto_179103 ) ) ( not ( = ?auto_179101 ?auto_179102 ) ) ( not ( = ?auto_179101 ?auto_179103 ) ) ( not ( = ?auto_179102 ?auto_179103 ) ) ( ON-TABLE ?auto_179103 ) ( ON ?auto_179102 ?auto_179103 ) ( ON ?auto_179101 ?auto_179102 ) ( ON ?auto_179100 ?auto_179101 ) ( CLEAR ?auto_179098 ) ( ON ?auto_179099 ?auto_179100 ) ( CLEAR ?auto_179099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179103 ?auto_179102 ?auto_179101 ?auto_179100 )
      ( MAKE-8PILE ?auto_179096 ?auto_179097 ?auto_179098 ?auto_179099 ?auto_179100 ?auto_179101 ?auto_179102 ?auto_179103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179104 - BLOCK
      ?auto_179105 - BLOCK
      ?auto_179106 - BLOCK
      ?auto_179107 - BLOCK
      ?auto_179108 - BLOCK
      ?auto_179109 - BLOCK
      ?auto_179110 - BLOCK
      ?auto_179111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179104 ) ( ON ?auto_179105 ?auto_179104 ) ( not ( = ?auto_179104 ?auto_179105 ) ) ( not ( = ?auto_179104 ?auto_179106 ) ) ( not ( = ?auto_179104 ?auto_179107 ) ) ( not ( = ?auto_179104 ?auto_179108 ) ) ( not ( = ?auto_179104 ?auto_179109 ) ) ( not ( = ?auto_179104 ?auto_179110 ) ) ( not ( = ?auto_179104 ?auto_179111 ) ) ( not ( = ?auto_179105 ?auto_179106 ) ) ( not ( = ?auto_179105 ?auto_179107 ) ) ( not ( = ?auto_179105 ?auto_179108 ) ) ( not ( = ?auto_179105 ?auto_179109 ) ) ( not ( = ?auto_179105 ?auto_179110 ) ) ( not ( = ?auto_179105 ?auto_179111 ) ) ( not ( = ?auto_179106 ?auto_179107 ) ) ( not ( = ?auto_179106 ?auto_179108 ) ) ( not ( = ?auto_179106 ?auto_179109 ) ) ( not ( = ?auto_179106 ?auto_179110 ) ) ( not ( = ?auto_179106 ?auto_179111 ) ) ( not ( = ?auto_179107 ?auto_179108 ) ) ( not ( = ?auto_179107 ?auto_179109 ) ) ( not ( = ?auto_179107 ?auto_179110 ) ) ( not ( = ?auto_179107 ?auto_179111 ) ) ( not ( = ?auto_179108 ?auto_179109 ) ) ( not ( = ?auto_179108 ?auto_179110 ) ) ( not ( = ?auto_179108 ?auto_179111 ) ) ( not ( = ?auto_179109 ?auto_179110 ) ) ( not ( = ?auto_179109 ?auto_179111 ) ) ( not ( = ?auto_179110 ?auto_179111 ) ) ( ON-TABLE ?auto_179111 ) ( ON ?auto_179110 ?auto_179111 ) ( ON ?auto_179109 ?auto_179110 ) ( ON ?auto_179108 ?auto_179109 ) ( ON ?auto_179107 ?auto_179108 ) ( CLEAR ?auto_179107 ) ( HOLDING ?auto_179106 ) ( CLEAR ?auto_179105 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179104 ?auto_179105 ?auto_179106 )
      ( MAKE-8PILE ?auto_179104 ?auto_179105 ?auto_179106 ?auto_179107 ?auto_179108 ?auto_179109 ?auto_179110 ?auto_179111 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179112 - BLOCK
      ?auto_179113 - BLOCK
      ?auto_179114 - BLOCK
      ?auto_179115 - BLOCK
      ?auto_179116 - BLOCK
      ?auto_179117 - BLOCK
      ?auto_179118 - BLOCK
      ?auto_179119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179112 ) ( ON ?auto_179113 ?auto_179112 ) ( not ( = ?auto_179112 ?auto_179113 ) ) ( not ( = ?auto_179112 ?auto_179114 ) ) ( not ( = ?auto_179112 ?auto_179115 ) ) ( not ( = ?auto_179112 ?auto_179116 ) ) ( not ( = ?auto_179112 ?auto_179117 ) ) ( not ( = ?auto_179112 ?auto_179118 ) ) ( not ( = ?auto_179112 ?auto_179119 ) ) ( not ( = ?auto_179113 ?auto_179114 ) ) ( not ( = ?auto_179113 ?auto_179115 ) ) ( not ( = ?auto_179113 ?auto_179116 ) ) ( not ( = ?auto_179113 ?auto_179117 ) ) ( not ( = ?auto_179113 ?auto_179118 ) ) ( not ( = ?auto_179113 ?auto_179119 ) ) ( not ( = ?auto_179114 ?auto_179115 ) ) ( not ( = ?auto_179114 ?auto_179116 ) ) ( not ( = ?auto_179114 ?auto_179117 ) ) ( not ( = ?auto_179114 ?auto_179118 ) ) ( not ( = ?auto_179114 ?auto_179119 ) ) ( not ( = ?auto_179115 ?auto_179116 ) ) ( not ( = ?auto_179115 ?auto_179117 ) ) ( not ( = ?auto_179115 ?auto_179118 ) ) ( not ( = ?auto_179115 ?auto_179119 ) ) ( not ( = ?auto_179116 ?auto_179117 ) ) ( not ( = ?auto_179116 ?auto_179118 ) ) ( not ( = ?auto_179116 ?auto_179119 ) ) ( not ( = ?auto_179117 ?auto_179118 ) ) ( not ( = ?auto_179117 ?auto_179119 ) ) ( not ( = ?auto_179118 ?auto_179119 ) ) ( ON-TABLE ?auto_179119 ) ( ON ?auto_179118 ?auto_179119 ) ( ON ?auto_179117 ?auto_179118 ) ( ON ?auto_179116 ?auto_179117 ) ( ON ?auto_179115 ?auto_179116 ) ( CLEAR ?auto_179113 ) ( ON ?auto_179114 ?auto_179115 ) ( CLEAR ?auto_179114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179119 ?auto_179118 ?auto_179117 ?auto_179116 ?auto_179115 )
      ( MAKE-8PILE ?auto_179112 ?auto_179113 ?auto_179114 ?auto_179115 ?auto_179116 ?auto_179117 ?auto_179118 ?auto_179119 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179120 - BLOCK
      ?auto_179121 - BLOCK
      ?auto_179122 - BLOCK
      ?auto_179123 - BLOCK
      ?auto_179124 - BLOCK
      ?auto_179125 - BLOCK
      ?auto_179126 - BLOCK
      ?auto_179127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179120 ) ( not ( = ?auto_179120 ?auto_179121 ) ) ( not ( = ?auto_179120 ?auto_179122 ) ) ( not ( = ?auto_179120 ?auto_179123 ) ) ( not ( = ?auto_179120 ?auto_179124 ) ) ( not ( = ?auto_179120 ?auto_179125 ) ) ( not ( = ?auto_179120 ?auto_179126 ) ) ( not ( = ?auto_179120 ?auto_179127 ) ) ( not ( = ?auto_179121 ?auto_179122 ) ) ( not ( = ?auto_179121 ?auto_179123 ) ) ( not ( = ?auto_179121 ?auto_179124 ) ) ( not ( = ?auto_179121 ?auto_179125 ) ) ( not ( = ?auto_179121 ?auto_179126 ) ) ( not ( = ?auto_179121 ?auto_179127 ) ) ( not ( = ?auto_179122 ?auto_179123 ) ) ( not ( = ?auto_179122 ?auto_179124 ) ) ( not ( = ?auto_179122 ?auto_179125 ) ) ( not ( = ?auto_179122 ?auto_179126 ) ) ( not ( = ?auto_179122 ?auto_179127 ) ) ( not ( = ?auto_179123 ?auto_179124 ) ) ( not ( = ?auto_179123 ?auto_179125 ) ) ( not ( = ?auto_179123 ?auto_179126 ) ) ( not ( = ?auto_179123 ?auto_179127 ) ) ( not ( = ?auto_179124 ?auto_179125 ) ) ( not ( = ?auto_179124 ?auto_179126 ) ) ( not ( = ?auto_179124 ?auto_179127 ) ) ( not ( = ?auto_179125 ?auto_179126 ) ) ( not ( = ?auto_179125 ?auto_179127 ) ) ( not ( = ?auto_179126 ?auto_179127 ) ) ( ON-TABLE ?auto_179127 ) ( ON ?auto_179126 ?auto_179127 ) ( ON ?auto_179125 ?auto_179126 ) ( ON ?auto_179124 ?auto_179125 ) ( ON ?auto_179123 ?auto_179124 ) ( ON ?auto_179122 ?auto_179123 ) ( CLEAR ?auto_179122 ) ( HOLDING ?auto_179121 ) ( CLEAR ?auto_179120 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179120 ?auto_179121 )
      ( MAKE-8PILE ?auto_179120 ?auto_179121 ?auto_179122 ?auto_179123 ?auto_179124 ?auto_179125 ?auto_179126 ?auto_179127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179128 - BLOCK
      ?auto_179129 - BLOCK
      ?auto_179130 - BLOCK
      ?auto_179131 - BLOCK
      ?auto_179132 - BLOCK
      ?auto_179133 - BLOCK
      ?auto_179134 - BLOCK
      ?auto_179135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_179128 ) ( not ( = ?auto_179128 ?auto_179129 ) ) ( not ( = ?auto_179128 ?auto_179130 ) ) ( not ( = ?auto_179128 ?auto_179131 ) ) ( not ( = ?auto_179128 ?auto_179132 ) ) ( not ( = ?auto_179128 ?auto_179133 ) ) ( not ( = ?auto_179128 ?auto_179134 ) ) ( not ( = ?auto_179128 ?auto_179135 ) ) ( not ( = ?auto_179129 ?auto_179130 ) ) ( not ( = ?auto_179129 ?auto_179131 ) ) ( not ( = ?auto_179129 ?auto_179132 ) ) ( not ( = ?auto_179129 ?auto_179133 ) ) ( not ( = ?auto_179129 ?auto_179134 ) ) ( not ( = ?auto_179129 ?auto_179135 ) ) ( not ( = ?auto_179130 ?auto_179131 ) ) ( not ( = ?auto_179130 ?auto_179132 ) ) ( not ( = ?auto_179130 ?auto_179133 ) ) ( not ( = ?auto_179130 ?auto_179134 ) ) ( not ( = ?auto_179130 ?auto_179135 ) ) ( not ( = ?auto_179131 ?auto_179132 ) ) ( not ( = ?auto_179131 ?auto_179133 ) ) ( not ( = ?auto_179131 ?auto_179134 ) ) ( not ( = ?auto_179131 ?auto_179135 ) ) ( not ( = ?auto_179132 ?auto_179133 ) ) ( not ( = ?auto_179132 ?auto_179134 ) ) ( not ( = ?auto_179132 ?auto_179135 ) ) ( not ( = ?auto_179133 ?auto_179134 ) ) ( not ( = ?auto_179133 ?auto_179135 ) ) ( not ( = ?auto_179134 ?auto_179135 ) ) ( ON-TABLE ?auto_179135 ) ( ON ?auto_179134 ?auto_179135 ) ( ON ?auto_179133 ?auto_179134 ) ( ON ?auto_179132 ?auto_179133 ) ( ON ?auto_179131 ?auto_179132 ) ( ON ?auto_179130 ?auto_179131 ) ( CLEAR ?auto_179128 ) ( ON ?auto_179129 ?auto_179130 ) ( CLEAR ?auto_179129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179135 ?auto_179134 ?auto_179133 ?auto_179132 ?auto_179131 ?auto_179130 )
      ( MAKE-8PILE ?auto_179128 ?auto_179129 ?auto_179130 ?auto_179131 ?auto_179132 ?auto_179133 ?auto_179134 ?auto_179135 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179136 - BLOCK
      ?auto_179137 - BLOCK
      ?auto_179138 - BLOCK
      ?auto_179139 - BLOCK
      ?auto_179140 - BLOCK
      ?auto_179141 - BLOCK
      ?auto_179142 - BLOCK
      ?auto_179143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179136 ?auto_179137 ) ) ( not ( = ?auto_179136 ?auto_179138 ) ) ( not ( = ?auto_179136 ?auto_179139 ) ) ( not ( = ?auto_179136 ?auto_179140 ) ) ( not ( = ?auto_179136 ?auto_179141 ) ) ( not ( = ?auto_179136 ?auto_179142 ) ) ( not ( = ?auto_179136 ?auto_179143 ) ) ( not ( = ?auto_179137 ?auto_179138 ) ) ( not ( = ?auto_179137 ?auto_179139 ) ) ( not ( = ?auto_179137 ?auto_179140 ) ) ( not ( = ?auto_179137 ?auto_179141 ) ) ( not ( = ?auto_179137 ?auto_179142 ) ) ( not ( = ?auto_179137 ?auto_179143 ) ) ( not ( = ?auto_179138 ?auto_179139 ) ) ( not ( = ?auto_179138 ?auto_179140 ) ) ( not ( = ?auto_179138 ?auto_179141 ) ) ( not ( = ?auto_179138 ?auto_179142 ) ) ( not ( = ?auto_179138 ?auto_179143 ) ) ( not ( = ?auto_179139 ?auto_179140 ) ) ( not ( = ?auto_179139 ?auto_179141 ) ) ( not ( = ?auto_179139 ?auto_179142 ) ) ( not ( = ?auto_179139 ?auto_179143 ) ) ( not ( = ?auto_179140 ?auto_179141 ) ) ( not ( = ?auto_179140 ?auto_179142 ) ) ( not ( = ?auto_179140 ?auto_179143 ) ) ( not ( = ?auto_179141 ?auto_179142 ) ) ( not ( = ?auto_179141 ?auto_179143 ) ) ( not ( = ?auto_179142 ?auto_179143 ) ) ( ON-TABLE ?auto_179143 ) ( ON ?auto_179142 ?auto_179143 ) ( ON ?auto_179141 ?auto_179142 ) ( ON ?auto_179140 ?auto_179141 ) ( ON ?auto_179139 ?auto_179140 ) ( ON ?auto_179138 ?auto_179139 ) ( ON ?auto_179137 ?auto_179138 ) ( CLEAR ?auto_179137 ) ( HOLDING ?auto_179136 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179136 )
      ( MAKE-8PILE ?auto_179136 ?auto_179137 ?auto_179138 ?auto_179139 ?auto_179140 ?auto_179141 ?auto_179142 ?auto_179143 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179144 - BLOCK
      ?auto_179145 - BLOCK
      ?auto_179146 - BLOCK
      ?auto_179147 - BLOCK
      ?auto_179148 - BLOCK
      ?auto_179149 - BLOCK
      ?auto_179150 - BLOCK
      ?auto_179151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179144 ?auto_179145 ) ) ( not ( = ?auto_179144 ?auto_179146 ) ) ( not ( = ?auto_179144 ?auto_179147 ) ) ( not ( = ?auto_179144 ?auto_179148 ) ) ( not ( = ?auto_179144 ?auto_179149 ) ) ( not ( = ?auto_179144 ?auto_179150 ) ) ( not ( = ?auto_179144 ?auto_179151 ) ) ( not ( = ?auto_179145 ?auto_179146 ) ) ( not ( = ?auto_179145 ?auto_179147 ) ) ( not ( = ?auto_179145 ?auto_179148 ) ) ( not ( = ?auto_179145 ?auto_179149 ) ) ( not ( = ?auto_179145 ?auto_179150 ) ) ( not ( = ?auto_179145 ?auto_179151 ) ) ( not ( = ?auto_179146 ?auto_179147 ) ) ( not ( = ?auto_179146 ?auto_179148 ) ) ( not ( = ?auto_179146 ?auto_179149 ) ) ( not ( = ?auto_179146 ?auto_179150 ) ) ( not ( = ?auto_179146 ?auto_179151 ) ) ( not ( = ?auto_179147 ?auto_179148 ) ) ( not ( = ?auto_179147 ?auto_179149 ) ) ( not ( = ?auto_179147 ?auto_179150 ) ) ( not ( = ?auto_179147 ?auto_179151 ) ) ( not ( = ?auto_179148 ?auto_179149 ) ) ( not ( = ?auto_179148 ?auto_179150 ) ) ( not ( = ?auto_179148 ?auto_179151 ) ) ( not ( = ?auto_179149 ?auto_179150 ) ) ( not ( = ?auto_179149 ?auto_179151 ) ) ( not ( = ?auto_179150 ?auto_179151 ) ) ( ON-TABLE ?auto_179151 ) ( ON ?auto_179150 ?auto_179151 ) ( ON ?auto_179149 ?auto_179150 ) ( ON ?auto_179148 ?auto_179149 ) ( ON ?auto_179147 ?auto_179148 ) ( ON ?auto_179146 ?auto_179147 ) ( ON ?auto_179145 ?auto_179146 ) ( ON ?auto_179144 ?auto_179145 ) ( CLEAR ?auto_179144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179151 ?auto_179150 ?auto_179149 ?auto_179148 ?auto_179147 ?auto_179146 ?auto_179145 )
      ( MAKE-8PILE ?auto_179144 ?auto_179145 ?auto_179146 ?auto_179147 ?auto_179148 ?auto_179149 ?auto_179150 ?auto_179151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179152 - BLOCK
      ?auto_179153 - BLOCK
      ?auto_179154 - BLOCK
      ?auto_179155 - BLOCK
      ?auto_179156 - BLOCK
      ?auto_179157 - BLOCK
      ?auto_179158 - BLOCK
      ?auto_179159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179152 ?auto_179153 ) ) ( not ( = ?auto_179152 ?auto_179154 ) ) ( not ( = ?auto_179152 ?auto_179155 ) ) ( not ( = ?auto_179152 ?auto_179156 ) ) ( not ( = ?auto_179152 ?auto_179157 ) ) ( not ( = ?auto_179152 ?auto_179158 ) ) ( not ( = ?auto_179152 ?auto_179159 ) ) ( not ( = ?auto_179153 ?auto_179154 ) ) ( not ( = ?auto_179153 ?auto_179155 ) ) ( not ( = ?auto_179153 ?auto_179156 ) ) ( not ( = ?auto_179153 ?auto_179157 ) ) ( not ( = ?auto_179153 ?auto_179158 ) ) ( not ( = ?auto_179153 ?auto_179159 ) ) ( not ( = ?auto_179154 ?auto_179155 ) ) ( not ( = ?auto_179154 ?auto_179156 ) ) ( not ( = ?auto_179154 ?auto_179157 ) ) ( not ( = ?auto_179154 ?auto_179158 ) ) ( not ( = ?auto_179154 ?auto_179159 ) ) ( not ( = ?auto_179155 ?auto_179156 ) ) ( not ( = ?auto_179155 ?auto_179157 ) ) ( not ( = ?auto_179155 ?auto_179158 ) ) ( not ( = ?auto_179155 ?auto_179159 ) ) ( not ( = ?auto_179156 ?auto_179157 ) ) ( not ( = ?auto_179156 ?auto_179158 ) ) ( not ( = ?auto_179156 ?auto_179159 ) ) ( not ( = ?auto_179157 ?auto_179158 ) ) ( not ( = ?auto_179157 ?auto_179159 ) ) ( not ( = ?auto_179158 ?auto_179159 ) ) ( ON-TABLE ?auto_179159 ) ( ON ?auto_179158 ?auto_179159 ) ( ON ?auto_179157 ?auto_179158 ) ( ON ?auto_179156 ?auto_179157 ) ( ON ?auto_179155 ?auto_179156 ) ( ON ?auto_179154 ?auto_179155 ) ( ON ?auto_179153 ?auto_179154 ) ( HOLDING ?auto_179152 ) ( CLEAR ?auto_179153 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179159 ?auto_179158 ?auto_179157 ?auto_179156 ?auto_179155 ?auto_179154 ?auto_179153 ?auto_179152 )
      ( MAKE-8PILE ?auto_179152 ?auto_179153 ?auto_179154 ?auto_179155 ?auto_179156 ?auto_179157 ?auto_179158 ?auto_179159 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179160 - BLOCK
      ?auto_179161 - BLOCK
      ?auto_179162 - BLOCK
      ?auto_179163 - BLOCK
      ?auto_179164 - BLOCK
      ?auto_179165 - BLOCK
      ?auto_179166 - BLOCK
      ?auto_179167 - BLOCK
    )
    :vars
    (
      ?auto_179168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179160 ?auto_179161 ) ) ( not ( = ?auto_179160 ?auto_179162 ) ) ( not ( = ?auto_179160 ?auto_179163 ) ) ( not ( = ?auto_179160 ?auto_179164 ) ) ( not ( = ?auto_179160 ?auto_179165 ) ) ( not ( = ?auto_179160 ?auto_179166 ) ) ( not ( = ?auto_179160 ?auto_179167 ) ) ( not ( = ?auto_179161 ?auto_179162 ) ) ( not ( = ?auto_179161 ?auto_179163 ) ) ( not ( = ?auto_179161 ?auto_179164 ) ) ( not ( = ?auto_179161 ?auto_179165 ) ) ( not ( = ?auto_179161 ?auto_179166 ) ) ( not ( = ?auto_179161 ?auto_179167 ) ) ( not ( = ?auto_179162 ?auto_179163 ) ) ( not ( = ?auto_179162 ?auto_179164 ) ) ( not ( = ?auto_179162 ?auto_179165 ) ) ( not ( = ?auto_179162 ?auto_179166 ) ) ( not ( = ?auto_179162 ?auto_179167 ) ) ( not ( = ?auto_179163 ?auto_179164 ) ) ( not ( = ?auto_179163 ?auto_179165 ) ) ( not ( = ?auto_179163 ?auto_179166 ) ) ( not ( = ?auto_179163 ?auto_179167 ) ) ( not ( = ?auto_179164 ?auto_179165 ) ) ( not ( = ?auto_179164 ?auto_179166 ) ) ( not ( = ?auto_179164 ?auto_179167 ) ) ( not ( = ?auto_179165 ?auto_179166 ) ) ( not ( = ?auto_179165 ?auto_179167 ) ) ( not ( = ?auto_179166 ?auto_179167 ) ) ( ON-TABLE ?auto_179167 ) ( ON ?auto_179166 ?auto_179167 ) ( ON ?auto_179165 ?auto_179166 ) ( ON ?auto_179164 ?auto_179165 ) ( ON ?auto_179163 ?auto_179164 ) ( ON ?auto_179162 ?auto_179163 ) ( ON ?auto_179161 ?auto_179162 ) ( CLEAR ?auto_179161 ) ( ON ?auto_179160 ?auto_179168 ) ( CLEAR ?auto_179160 ) ( HAND-EMPTY ) ( not ( = ?auto_179160 ?auto_179168 ) ) ( not ( = ?auto_179161 ?auto_179168 ) ) ( not ( = ?auto_179162 ?auto_179168 ) ) ( not ( = ?auto_179163 ?auto_179168 ) ) ( not ( = ?auto_179164 ?auto_179168 ) ) ( not ( = ?auto_179165 ?auto_179168 ) ) ( not ( = ?auto_179166 ?auto_179168 ) ) ( not ( = ?auto_179167 ?auto_179168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_179160 ?auto_179168 )
      ( MAKE-8PILE ?auto_179160 ?auto_179161 ?auto_179162 ?auto_179163 ?auto_179164 ?auto_179165 ?auto_179166 ?auto_179167 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179169 - BLOCK
      ?auto_179170 - BLOCK
      ?auto_179171 - BLOCK
      ?auto_179172 - BLOCK
      ?auto_179173 - BLOCK
      ?auto_179174 - BLOCK
      ?auto_179175 - BLOCK
      ?auto_179176 - BLOCK
    )
    :vars
    (
      ?auto_179177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179169 ?auto_179170 ) ) ( not ( = ?auto_179169 ?auto_179171 ) ) ( not ( = ?auto_179169 ?auto_179172 ) ) ( not ( = ?auto_179169 ?auto_179173 ) ) ( not ( = ?auto_179169 ?auto_179174 ) ) ( not ( = ?auto_179169 ?auto_179175 ) ) ( not ( = ?auto_179169 ?auto_179176 ) ) ( not ( = ?auto_179170 ?auto_179171 ) ) ( not ( = ?auto_179170 ?auto_179172 ) ) ( not ( = ?auto_179170 ?auto_179173 ) ) ( not ( = ?auto_179170 ?auto_179174 ) ) ( not ( = ?auto_179170 ?auto_179175 ) ) ( not ( = ?auto_179170 ?auto_179176 ) ) ( not ( = ?auto_179171 ?auto_179172 ) ) ( not ( = ?auto_179171 ?auto_179173 ) ) ( not ( = ?auto_179171 ?auto_179174 ) ) ( not ( = ?auto_179171 ?auto_179175 ) ) ( not ( = ?auto_179171 ?auto_179176 ) ) ( not ( = ?auto_179172 ?auto_179173 ) ) ( not ( = ?auto_179172 ?auto_179174 ) ) ( not ( = ?auto_179172 ?auto_179175 ) ) ( not ( = ?auto_179172 ?auto_179176 ) ) ( not ( = ?auto_179173 ?auto_179174 ) ) ( not ( = ?auto_179173 ?auto_179175 ) ) ( not ( = ?auto_179173 ?auto_179176 ) ) ( not ( = ?auto_179174 ?auto_179175 ) ) ( not ( = ?auto_179174 ?auto_179176 ) ) ( not ( = ?auto_179175 ?auto_179176 ) ) ( ON-TABLE ?auto_179176 ) ( ON ?auto_179175 ?auto_179176 ) ( ON ?auto_179174 ?auto_179175 ) ( ON ?auto_179173 ?auto_179174 ) ( ON ?auto_179172 ?auto_179173 ) ( ON ?auto_179171 ?auto_179172 ) ( ON ?auto_179169 ?auto_179177 ) ( CLEAR ?auto_179169 ) ( not ( = ?auto_179169 ?auto_179177 ) ) ( not ( = ?auto_179170 ?auto_179177 ) ) ( not ( = ?auto_179171 ?auto_179177 ) ) ( not ( = ?auto_179172 ?auto_179177 ) ) ( not ( = ?auto_179173 ?auto_179177 ) ) ( not ( = ?auto_179174 ?auto_179177 ) ) ( not ( = ?auto_179175 ?auto_179177 ) ) ( not ( = ?auto_179176 ?auto_179177 ) ) ( HOLDING ?auto_179170 ) ( CLEAR ?auto_179171 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179176 ?auto_179175 ?auto_179174 ?auto_179173 ?auto_179172 ?auto_179171 ?auto_179170 )
      ( MAKE-8PILE ?auto_179169 ?auto_179170 ?auto_179171 ?auto_179172 ?auto_179173 ?auto_179174 ?auto_179175 ?auto_179176 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179178 - BLOCK
      ?auto_179179 - BLOCK
      ?auto_179180 - BLOCK
      ?auto_179181 - BLOCK
      ?auto_179182 - BLOCK
      ?auto_179183 - BLOCK
      ?auto_179184 - BLOCK
      ?auto_179185 - BLOCK
    )
    :vars
    (
      ?auto_179186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179178 ?auto_179179 ) ) ( not ( = ?auto_179178 ?auto_179180 ) ) ( not ( = ?auto_179178 ?auto_179181 ) ) ( not ( = ?auto_179178 ?auto_179182 ) ) ( not ( = ?auto_179178 ?auto_179183 ) ) ( not ( = ?auto_179178 ?auto_179184 ) ) ( not ( = ?auto_179178 ?auto_179185 ) ) ( not ( = ?auto_179179 ?auto_179180 ) ) ( not ( = ?auto_179179 ?auto_179181 ) ) ( not ( = ?auto_179179 ?auto_179182 ) ) ( not ( = ?auto_179179 ?auto_179183 ) ) ( not ( = ?auto_179179 ?auto_179184 ) ) ( not ( = ?auto_179179 ?auto_179185 ) ) ( not ( = ?auto_179180 ?auto_179181 ) ) ( not ( = ?auto_179180 ?auto_179182 ) ) ( not ( = ?auto_179180 ?auto_179183 ) ) ( not ( = ?auto_179180 ?auto_179184 ) ) ( not ( = ?auto_179180 ?auto_179185 ) ) ( not ( = ?auto_179181 ?auto_179182 ) ) ( not ( = ?auto_179181 ?auto_179183 ) ) ( not ( = ?auto_179181 ?auto_179184 ) ) ( not ( = ?auto_179181 ?auto_179185 ) ) ( not ( = ?auto_179182 ?auto_179183 ) ) ( not ( = ?auto_179182 ?auto_179184 ) ) ( not ( = ?auto_179182 ?auto_179185 ) ) ( not ( = ?auto_179183 ?auto_179184 ) ) ( not ( = ?auto_179183 ?auto_179185 ) ) ( not ( = ?auto_179184 ?auto_179185 ) ) ( ON-TABLE ?auto_179185 ) ( ON ?auto_179184 ?auto_179185 ) ( ON ?auto_179183 ?auto_179184 ) ( ON ?auto_179182 ?auto_179183 ) ( ON ?auto_179181 ?auto_179182 ) ( ON ?auto_179180 ?auto_179181 ) ( ON ?auto_179178 ?auto_179186 ) ( not ( = ?auto_179178 ?auto_179186 ) ) ( not ( = ?auto_179179 ?auto_179186 ) ) ( not ( = ?auto_179180 ?auto_179186 ) ) ( not ( = ?auto_179181 ?auto_179186 ) ) ( not ( = ?auto_179182 ?auto_179186 ) ) ( not ( = ?auto_179183 ?auto_179186 ) ) ( not ( = ?auto_179184 ?auto_179186 ) ) ( not ( = ?auto_179185 ?auto_179186 ) ) ( CLEAR ?auto_179180 ) ( ON ?auto_179179 ?auto_179178 ) ( CLEAR ?auto_179179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_179186 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179186 ?auto_179178 )
      ( MAKE-8PILE ?auto_179178 ?auto_179179 ?auto_179180 ?auto_179181 ?auto_179182 ?auto_179183 ?auto_179184 ?auto_179185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179187 - BLOCK
      ?auto_179188 - BLOCK
      ?auto_179189 - BLOCK
      ?auto_179190 - BLOCK
      ?auto_179191 - BLOCK
      ?auto_179192 - BLOCK
      ?auto_179193 - BLOCK
      ?auto_179194 - BLOCK
    )
    :vars
    (
      ?auto_179195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179187 ?auto_179188 ) ) ( not ( = ?auto_179187 ?auto_179189 ) ) ( not ( = ?auto_179187 ?auto_179190 ) ) ( not ( = ?auto_179187 ?auto_179191 ) ) ( not ( = ?auto_179187 ?auto_179192 ) ) ( not ( = ?auto_179187 ?auto_179193 ) ) ( not ( = ?auto_179187 ?auto_179194 ) ) ( not ( = ?auto_179188 ?auto_179189 ) ) ( not ( = ?auto_179188 ?auto_179190 ) ) ( not ( = ?auto_179188 ?auto_179191 ) ) ( not ( = ?auto_179188 ?auto_179192 ) ) ( not ( = ?auto_179188 ?auto_179193 ) ) ( not ( = ?auto_179188 ?auto_179194 ) ) ( not ( = ?auto_179189 ?auto_179190 ) ) ( not ( = ?auto_179189 ?auto_179191 ) ) ( not ( = ?auto_179189 ?auto_179192 ) ) ( not ( = ?auto_179189 ?auto_179193 ) ) ( not ( = ?auto_179189 ?auto_179194 ) ) ( not ( = ?auto_179190 ?auto_179191 ) ) ( not ( = ?auto_179190 ?auto_179192 ) ) ( not ( = ?auto_179190 ?auto_179193 ) ) ( not ( = ?auto_179190 ?auto_179194 ) ) ( not ( = ?auto_179191 ?auto_179192 ) ) ( not ( = ?auto_179191 ?auto_179193 ) ) ( not ( = ?auto_179191 ?auto_179194 ) ) ( not ( = ?auto_179192 ?auto_179193 ) ) ( not ( = ?auto_179192 ?auto_179194 ) ) ( not ( = ?auto_179193 ?auto_179194 ) ) ( ON-TABLE ?auto_179194 ) ( ON ?auto_179193 ?auto_179194 ) ( ON ?auto_179192 ?auto_179193 ) ( ON ?auto_179191 ?auto_179192 ) ( ON ?auto_179190 ?auto_179191 ) ( ON ?auto_179187 ?auto_179195 ) ( not ( = ?auto_179187 ?auto_179195 ) ) ( not ( = ?auto_179188 ?auto_179195 ) ) ( not ( = ?auto_179189 ?auto_179195 ) ) ( not ( = ?auto_179190 ?auto_179195 ) ) ( not ( = ?auto_179191 ?auto_179195 ) ) ( not ( = ?auto_179192 ?auto_179195 ) ) ( not ( = ?auto_179193 ?auto_179195 ) ) ( not ( = ?auto_179194 ?auto_179195 ) ) ( ON ?auto_179188 ?auto_179187 ) ( CLEAR ?auto_179188 ) ( ON-TABLE ?auto_179195 ) ( HOLDING ?auto_179189 ) ( CLEAR ?auto_179190 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179194 ?auto_179193 ?auto_179192 ?auto_179191 ?auto_179190 ?auto_179189 )
      ( MAKE-8PILE ?auto_179187 ?auto_179188 ?auto_179189 ?auto_179190 ?auto_179191 ?auto_179192 ?auto_179193 ?auto_179194 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179196 - BLOCK
      ?auto_179197 - BLOCK
      ?auto_179198 - BLOCK
      ?auto_179199 - BLOCK
      ?auto_179200 - BLOCK
      ?auto_179201 - BLOCK
      ?auto_179202 - BLOCK
      ?auto_179203 - BLOCK
    )
    :vars
    (
      ?auto_179204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179196 ?auto_179197 ) ) ( not ( = ?auto_179196 ?auto_179198 ) ) ( not ( = ?auto_179196 ?auto_179199 ) ) ( not ( = ?auto_179196 ?auto_179200 ) ) ( not ( = ?auto_179196 ?auto_179201 ) ) ( not ( = ?auto_179196 ?auto_179202 ) ) ( not ( = ?auto_179196 ?auto_179203 ) ) ( not ( = ?auto_179197 ?auto_179198 ) ) ( not ( = ?auto_179197 ?auto_179199 ) ) ( not ( = ?auto_179197 ?auto_179200 ) ) ( not ( = ?auto_179197 ?auto_179201 ) ) ( not ( = ?auto_179197 ?auto_179202 ) ) ( not ( = ?auto_179197 ?auto_179203 ) ) ( not ( = ?auto_179198 ?auto_179199 ) ) ( not ( = ?auto_179198 ?auto_179200 ) ) ( not ( = ?auto_179198 ?auto_179201 ) ) ( not ( = ?auto_179198 ?auto_179202 ) ) ( not ( = ?auto_179198 ?auto_179203 ) ) ( not ( = ?auto_179199 ?auto_179200 ) ) ( not ( = ?auto_179199 ?auto_179201 ) ) ( not ( = ?auto_179199 ?auto_179202 ) ) ( not ( = ?auto_179199 ?auto_179203 ) ) ( not ( = ?auto_179200 ?auto_179201 ) ) ( not ( = ?auto_179200 ?auto_179202 ) ) ( not ( = ?auto_179200 ?auto_179203 ) ) ( not ( = ?auto_179201 ?auto_179202 ) ) ( not ( = ?auto_179201 ?auto_179203 ) ) ( not ( = ?auto_179202 ?auto_179203 ) ) ( ON-TABLE ?auto_179203 ) ( ON ?auto_179202 ?auto_179203 ) ( ON ?auto_179201 ?auto_179202 ) ( ON ?auto_179200 ?auto_179201 ) ( ON ?auto_179199 ?auto_179200 ) ( ON ?auto_179196 ?auto_179204 ) ( not ( = ?auto_179196 ?auto_179204 ) ) ( not ( = ?auto_179197 ?auto_179204 ) ) ( not ( = ?auto_179198 ?auto_179204 ) ) ( not ( = ?auto_179199 ?auto_179204 ) ) ( not ( = ?auto_179200 ?auto_179204 ) ) ( not ( = ?auto_179201 ?auto_179204 ) ) ( not ( = ?auto_179202 ?auto_179204 ) ) ( not ( = ?auto_179203 ?auto_179204 ) ) ( ON ?auto_179197 ?auto_179196 ) ( ON-TABLE ?auto_179204 ) ( CLEAR ?auto_179199 ) ( ON ?auto_179198 ?auto_179197 ) ( CLEAR ?auto_179198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179204 ?auto_179196 ?auto_179197 )
      ( MAKE-8PILE ?auto_179196 ?auto_179197 ?auto_179198 ?auto_179199 ?auto_179200 ?auto_179201 ?auto_179202 ?auto_179203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179205 - BLOCK
      ?auto_179206 - BLOCK
      ?auto_179207 - BLOCK
      ?auto_179208 - BLOCK
      ?auto_179209 - BLOCK
      ?auto_179210 - BLOCK
      ?auto_179211 - BLOCK
      ?auto_179212 - BLOCK
    )
    :vars
    (
      ?auto_179213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179205 ?auto_179206 ) ) ( not ( = ?auto_179205 ?auto_179207 ) ) ( not ( = ?auto_179205 ?auto_179208 ) ) ( not ( = ?auto_179205 ?auto_179209 ) ) ( not ( = ?auto_179205 ?auto_179210 ) ) ( not ( = ?auto_179205 ?auto_179211 ) ) ( not ( = ?auto_179205 ?auto_179212 ) ) ( not ( = ?auto_179206 ?auto_179207 ) ) ( not ( = ?auto_179206 ?auto_179208 ) ) ( not ( = ?auto_179206 ?auto_179209 ) ) ( not ( = ?auto_179206 ?auto_179210 ) ) ( not ( = ?auto_179206 ?auto_179211 ) ) ( not ( = ?auto_179206 ?auto_179212 ) ) ( not ( = ?auto_179207 ?auto_179208 ) ) ( not ( = ?auto_179207 ?auto_179209 ) ) ( not ( = ?auto_179207 ?auto_179210 ) ) ( not ( = ?auto_179207 ?auto_179211 ) ) ( not ( = ?auto_179207 ?auto_179212 ) ) ( not ( = ?auto_179208 ?auto_179209 ) ) ( not ( = ?auto_179208 ?auto_179210 ) ) ( not ( = ?auto_179208 ?auto_179211 ) ) ( not ( = ?auto_179208 ?auto_179212 ) ) ( not ( = ?auto_179209 ?auto_179210 ) ) ( not ( = ?auto_179209 ?auto_179211 ) ) ( not ( = ?auto_179209 ?auto_179212 ) ) ( not ( = ?auto_179210 ?auto_179211 ) ) ( not ( = ?auto_179210 ?auto_179212 ) ) ( not ( = ?auto_179211 ?auto_179212 ) ) ( ON-TABLE ?auto_179212 ) ( ON ?auto_179211 ?auto_179212 ) ( ON ?auto_179210 ?auto_179211 ) ( ON ?auto_179209 ?auto_179210 ) ( ON ?auto_179205 ?auto_179213 ) ( not ( = ?auto_179205 ?auto_179213 ) ) ( not ( = ?auto_179206 ?auto_179213 ) ) ( not ( = ?auto_179207 ?auto_179213 ) ) ( not ( = ?auto_179208 ?auto_179213 ) ) ( not ( = ?auto_179209 ?auto_179213 ) ) ( not ( = ?auto_179210 ?auto_179213 ) ) ( not ( = ?auto_179211 ?auto_179213 ) ) ( not ( = ?auto_179212 ?auto_179213 ) ) ( ON ?auto_179206 ?auto_179205 ) ( ON-TABLE ?auto_179213 ) ( ON ?auto_179207 ?auto_179206 ) ( CLEAR ?auto_179207 ) ( HOLDING ?auto_179208 ) ( CLEAR ?auto_179209 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179212 ?auto_179211 ?auto_179210 ?auto_179209 ?auto_179208 )
      ( MAKE-8PILE ?auto_179205 ?auto_179206 ?auto_179207 ?auto_179208 ?auto_179209 ?auto_179210 ?auto_179211 ?auto_179212 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179214 - BLOCK
      ?auto_179215 - BLOCK
      ?auto_179216 - BLOCK
      ?auto_179217 - BLOCK
      ?auto_179218 - BLOCK
      ?auto_179219 - BLOCK
      ?auto_179220 - BLOCK
      ?auto_179221 - BLOCK
    )
    :vars
    (
      ?auto_179222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179214 ?auto_179215 ) ) ( not ( = ?auto_179214 ?auto_179216 ) ) ( not ( = ?auto_179214 ?auto_179217 ) ) ( not ( = ?auto_179214 ?auto_179218 ) ) ( not ( = ?auto_179214 ?auto_179219 ) ) ( not ( = ?auto_179214 ?auto_179220 ) ) ( not ( = ?auto_179214 ?auto_179221 ) ) ( not ( = ?auto_179215 ?auto_179216 ) ) ( not ( = ?auto_179215 ?auto_179217 ) ) ( not ( = ?auto_179215 ?auto_179218 ) ) ( not ( = ?auto_179215 ?auto_179219 ) ) ( not ( = ?auto_179215 ?auto_179220 ) ) ( not ( = ?auto_179215 ?auto_179221 ) ) ( not ( = ?auto_179216 ?auto_179217 ) ) ( not ( = ?auto_179216 ?auto_179218 ) ) ( not ( = ?auto_179216 ?auto_179219 ) ) ( not ( = ?auto_179216 ?auto_179220 ) ) ( not ( = ?auto_179216 ?auto_179221 ) ) ( not ( = ?auto_179217 ?auto_179218 ) ) ( not ( = ?auto_179217 ?auto_179219 ) ) ( not ( = ?auto_179217 ?auto_179220 ) ) ( not ( = ?auto_179217 ?auto_179221 ) ) ( not ( = ?auto_179218 ?auto_179219 ) ) ( not ( = ?auto_179218 ?auto_179220 ) ) ( not ( = ?auto_179218 ?auto_179221 ) ) ( not ( = ?auto_179219 ?auto_179220 ) ) ( not ( = ?auto_179219 ?auto_179221 ) ) ( not ( = ?auto_179220 ?auto_179221 ) ) ( ON-TABLE ?auto_179221 ) ( ON ?auto_179220 ?auto_179221 ) ( ON ?auto_179219 ?auto_179220 ) ( ON ?auto_179218 ?auto_179219 ) ( ON ?auto_179214 ?auto_179222 ) ( not ( = ?auto_179214 ?auto_179222 ) ) ( not ( = ?auto_179215 ?auto_179222 ) ) ( not ( = ?auto_179216 ?auto_179222 ) ) ( not ( = ?auto_179217 ?auto_179222 ) ) ( not ( = ?auto_179218 ?auto_179222 ) ) ( not ( = ?auto_179219 ?auto_179222 ) ) ( not ( = ?auto_179220 ?auto_179222 ) ) ( not ( = ?auto_179221 ?auto_179222 ) ) ( ON ?auto_179215 ?auto_179214 ) ( ON-TABLE ?auto_179222 ) ( ON ?auto_179216 ?auto_179215 ) ( CLEAR ?auto_179218 ) ( ON ?auto_179217 ?auto_179216 ) ( CLEAR ?auto_179217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179222 ?auto_179214 ?auto_179215 ?auto_179216 )
      ( MAKE-8PILE ?auto_179214 ?auto_179215 ?auto_179216 ?auto_179217 ?auto_179218 ?auto_179219 ?auto_179220 ?auto_179221 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179223 - BLOCK
      ?auto_179224 - BLOCK
      ?auto_179225 - BLOCK
      ?auto_179226 - BLOCK
      ?auto_179227 - BLOCK
      ?auto_179228 - BLOCK
      ?auto_179229 - BLOCK
      ?auto_179230 - BLOCK
    )
    :vars
    (
      ?auto_179231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179223 ?auto_179224 ) ) ( not ( = ?auto_179223 ?auto_179225 ) ) ( not ( = ?auto_179223 ?auto_179226 ) ) ( not ( = ?auto_179223 ?auto_179227 ) ) ( not ( = ?auto_179223 ?auto_179228 ) ) ( not ( = ?auto_179223 ?auto_179229 ) ) ( not ( = ?auto_179223 ?auto_179230 ) ) ( not ( = ?auto_179224 ?auto_179225 ) ) ( not ( = ?auto_179224 ?auto_179226 ) ) ( not ( = ?auto_179224 ?auto_179227 ) ) ( not ( = ?auto_179224 ?auto_179228 ) ) ( not ( = ?auto_179224 ?auto_179229 ) ) ( not ( = ?auto_179224 ?auto_179230 ) ) ( not ( = ?auto_179225 ?auto_179226 ) ) ( not ( = ?auto_179225 ?auto_179227 ) ) ( not ( = ?auto_179225 ?auto_179228 ) ) ( not ( = ?auto_179225 ?auto_179229 ) ) ( not ( = ?auto_179225 ?auto_179230 ) ) ( not ( = ?auto_179226 ?auto_179227 ) ) ( not ( = ?auto_179226 ?auto_179228 ) ) ( not ( = ?auto_179226 ?auto_179229 ) ) ( not ( = ?auto_179226 ?auto_179230 ) ) ( not ( = ?auto_179227 ?auto_179228 ) ) ( not ( = ?auto_179227 ?auto_179229 ) ) ( not ( = ?auto_179227 ?auto_179230 ) ) ( not ( = ?auto_179228 ?auto_179229 ) ) ( not ( = ?auto_179228 ?auto_179230 ) ) ( not ( = ?auto_179229 ?auto_179230 ) ) ( ON-TABLE ?auto_179230 ) ( ON ?auto_179229 ?auto_179230 ) ( ON ?auto_179228 ?auto_179229 ) ( ON ?auto_179223 ?auto_179231 ) ( not ( = ?auto_179223 ?auto_179231 ) ) ( not ( = ?auto_179224 ?auto_179231 ) ) ( not ( = ?auto_179225 ?auto_179231 ) ) ( not ( = ?auto_179226 ?auto_179231 ) ) ( not ( = ?auto_179227 ?auto_179231 ) ) ( not ( = ?auto_179228 ?auto_179231 ) ) ( not ( = ?auto_179229 ?auto_179231 ) ) ( not ( = ?auto_179230 ?auto_179231 ) ) ( ON ?auto_179224 ?auto_179223 ) ( ON-TABLE ?auto_179231 ) ( ON ?auto_179225 ?auto_179224 ) ( ON ?auto_179226 ?auto_179225 ) ( CLEAR ?auto_179226 ) ( HOLDING ?auto_179227 ) ( CLEAR ?auto_179228 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_179230 ?auto_179229 ?auto_179228 ?auto_179227 )
      ( MAKE-8PILE ?auto_179223 ?auto_179224 ?auto_179225 ?auto_179226 ?auto_179227 ?auto_179228 ?auto_179229 ?auto_179230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179232 - BLOCK
      ?auto_179233 - BLOCK
      ?auto_179234 - BLOCK
      ?auto_179235 - BLOCK
      ?auto_179236 - BLOCK
      ?auto_179237 - BLOCK
      ?auto_179238 - BLOCK
      ?auto_179239 - BLOCK
    )
    :vars
    (
      ?auto_179240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179232 ?auto_179233 ) ) ( not ( = ?auto_179232 ?auto_179234 ) ) ( not ( = ?auto_179232 ?auto_179235 ) ) ( not ( = ?auto_179232 ?auto_179236 ) ) ( not ( = ?auto_179232 ?auto_179237 ) ) ( not ( = ?auto_179232 ?auto_179238 ) ) ( not ( = ?auto_179232 ?auto_179239 ) ) ( not ( = ?auto_179233 ?auto_179234 ) ) ( not ( = ?auto_179233 ?auto_179235 ) ) ( not ( = ?auto_179233 ?auto_179236 ) ) ( not ( = ?auto_179233 ?auto_179237 ) ) ( not ( = ?auto_179233 ?auto_179238 ) ) ( not ( = ?auto_179233 ?auto_179239 ) ) ( not ( = ?auto_179234 ?auto_179235 ) ) ( not ( = ?auto_179234 ?auto_179236 ) ) ( not ( = ?auto_179234 ?auto_179237 ) ) ( not ( = ?auto_179234 ?auto_179238 ) ) ( not ( = ?auto_179234 ?auto_179239 ) ) ( not ( = ?auto_179235 ?auto_179236 ) ) ( not ( = ?auto_179235 ?auto_179237 ) ) ( not ( = ?auto_179235 ?auto_179238 ) ) ( not ( = ?auto_179235 ?auto_179239 ) ) ( not ( = ?auto_179236 ?auto_179237 ) ) ( not ( = ?auto_179236 ?auto_179238 ) ) ( not ( = ?auto_179236 ?auto_179239 ) ) ( not ( = ?auto_179237 ?auto_179238 ) ) ( not ( = ?auto_179237 ?auto_179239 ) ) ( not ( = ?auto_179238 ?auto_179239 ) ) ( ON-TABLE ?auto_179239 ) ( ON ?auto_179238 ?auto_179239 ) ( ON ?auto_179237 ?auto_179238 ) ( ON ?auto_179232 ?auto_179240 ) ( not ( = ?auto_179232 ?auto_179240 ) ) ( not ( = ?auto_179233 ?auto_179240 ) ) ( not ( = ?auto_179234 ?auto_179240 ) ) ( not ( = ?auto_179235 ?auto_179240 ) ) ( not ( = ?auto_179236 ?auto_179240 ) ) ( not ( = ?auto_179237 ?auto_179240 ) ) ( not ( = ?auto_179238 ?auto_179240 ) ) ( not ( = ?auto_179239 ?auto_179240 ) ) ( ON ?auto_179233 ?auto_179232 ) ( ON-TABLE ?auto_179240 ) ( ON ?auto_179234 ?auto_179233 ) ( ON ?auto_179235 ?auto_179234 ) ( CLEAR ?auto_179237 ) ( ON ?auto_179236 ?auto_179235 ) ( CLEAR ?auto_179236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_179240 ?auto_179232 ?auto_179233 ?auto_179234 ?auto_179235 )
      ( MAKE-8PILE ?auto_179232 ?auto_179233 ?auto_179234 ?auto_179235 ?auto_179236 ?auto_179237 ?auto_179238 ?auto_179239 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179241 - BLOCK
      ?auto_179242 - BLOCK
      ?auto_179243 - BLOCK
      ?auto_179244 - BLOCK
      ?auto_179245 - BLOCK
      ?auto_179246 - BLOCK
      ?auto_179247 - BLOCK
      ?auto_179248 - BLOCK
    )
    :vars
    (
      ?auto_179249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179241 ?auto_179242 ) ) ( not ( = ?auto_179241 ?auto_179243 ) ) ( not ( = ?auto_179241 ?auto_179244 ) ) ( not ( = ?auto_179241 ?auto_179245 ) ) ( not ( = ?auto_179241 ?auto_179246 ) ) ( not ( = ?auto_179241 ?auto_179247 ) ) ( not ( = ?auto_179241 ?auto_179248 ) ) ( not ( = ?auto_179242 ?auto_179243 ) ) ( not ( = ?auto_179242 ?auto_179244 ) ) ( not ( = ?auto_179242 ?auto_179245 ) ) ( not ( = ?auto_179242 ?auto_179246 ) ) ( not ( = ?auto_179242 ?auto_179247 ) ) ( not ( = ?auto_179242 ?auto_179248 ) ) ( not ( = ?auto_179243 ?auto_179244 ) ) ( not ( = ?auto_179243 ?auto_179245 ) ) ( not ( = ?auto_179243 ?auto_179246 ) ) ( not ( = ?auto_179243 ?auto_179247 ) ) ( not ( = ?auto_179243 ?auto_179248 ) ) ( not ( = ?auto_179244 ?auto_179245 ) ) ( not ( = ?auto_179244 ?auto_179246 ) ) ( not ( = ?auto_179244 ?auto_179247 ) ) ( not ( = ?auto_179244 ?auto_179248 ) ) ( not ( = ?auto_179245 ?auto_179246 ) ) ( not ( = ?auto_179245 ?auto_179247 ) ) ( not ( = ?auto_179245 ?auto_179248 ) ) ( not ( = ?auto_179246 ?auto_179247 ) ) ( not ( = ?auto_179246 ?auto_179248 ) ) ( not ( = ?auto_179247 ?auto_179248 ) ) ( ON-TABLE ?auto_179248 ) ( ON ?auto_179247 ?auto_179248 ) ( ON ?auto_179241 ?auto_179249 ) ( not ( = ?auto_179241 ?auto_179249 ) ) ( not ( = ?auto_179242 ?auto_179249 ) ) ( not ( = ?auto_179243 ?auto_179249 ) ) ( not ( = ?auto_179244 ?auto_179249 ) ) ( not ( = ?auto_179245 ?auto_179249 ) ) ( not ( = ?auto_179246 ?auto_179249 ) ) ( not ( = ?auto_179247 ?auto_179249 ) ) ( not ( = ?auto_179248 ?auto_179249 ) ) ( ON ?auto_179242 ?auto_179241 ) ( ON-TABLE ?auto_179249 ) ( ON ?auto_179243 ?auto_179242 ) ( ON ?auto_179244 ?auto_179243 ) ( ON ?auto_179245 ?auto_179244 ) ( CLEAR ?auto_179245 ) ( HOLDING ?auto_179246 ) ( CLEAR ?auto_179247 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_179248 ?auto_179247 ?auto_179246 )
      ( MAKE-8PILE ?auto_179241 ?auto_179242 ?auto_179243 ?auto_179244 ?auto_179245 ?auto_179246 ?auto_179247 ?auto_179248 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179250 - BLOCK
      ?auto_179251 - BLOCK
      ?auto_179252 - BLOCK
      ?auto_179253 - BLOCK
      ?auto_179254 - BLOCK
      ?auto_179255 - BLOCK
      ?auto_179256 - BLOCK
      ?auto_179257 - BLOCK
    )
    :vars
    (
      ?auto_179258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179250 ?auto_179251 ) ) ( not ( = ?auto_179250 ?auto_179252 ) ) ( not ( = ?auto_179250 ?auto_179253 ) ) ( not ( = ?auto_179250 ?auto_179254 ) ) ( not ( = ?auto_179250 ?auto_179255 ) ) ( not ( = ?auto_179250 ?auto_179256 ) ) ( not ( = ?auto_179250 ?auto_179257 ) ) ( not ( = ?auto_179251 ?auto_179252 ) ) ( not ( = ?auto_179251 ?auto_179253 ) ) ( not ( = ?auto_179251 ?auto_179254 ) ) ( not ( = ?auto_179251 ?auto_179255 ) ) ( not ( = ?auto_179251 ?auto_179256 ) ) ( not ( = ?auto_179251 ?auto_179257 ) ) ( not ( = ?auto_179252 ?auto_179253 ) ) ( not ( = ?auto_179252 ?auto_179254 ) ) ( not ( = ?auto_179252 ?auto_179255 ) ) ( not ( = ?auto_179252 ?auto_179256 ) ) ( not ( = ?auto_179252 ?auto_179257 ) ) ( not ( = ?auto_179253 ?auto_179254 ) ) ( not ( = ?auto_179253 ?auto_179255 ) ) ( not ( = ?auto_179253 ?auto_179256 ) ) ( not ( = ?auto_179253 ?auto_179257 ) ) ( not ( = ?auto_179254 ?auto_179255 ) ) ( not ( = ?auto_179254 ?auto_179256 ) ) ( not ( = ?auto_179254 ?auto_179257 ) ) ( not ( = ?auto_179255 ?auto_179256 ) ) ( not ( = ?auto_179255 ?auto_179257 ) ) ( not ( = ?auto_179256 ?auto_179257 ) ) ( ON-TABLE ?auto_179257 ) ( ON ?auto_179256 ?auto_179257 ) ( ON ?auto_179250 ?auto_179258 ) ( not ( = ?auto_179250 ?auto_179258 ) ) ( not ( = ?auto_179251 ?auto_179258 ) ) ( not ( = ?auto_179252 ?auto_179258 ) ) ( not ( = ?auto_179253 ?auto_179258 ) ) ( not ( = ?auto_179254 ?auto_179258 ) ) ( not ( = ?auto_179255 ?auto_179258 ) ) ( not ( = ?auto_179256 ?auto_179258 ) ) ( not ( = ?auto_179257 ?auto_179258 ) ) ( ON ?auto_179251 ?auto_179250 ) ( ON-TABLE ?auto_179258 ) ( ON ?auto_179252 ?auto_179251 ) ( ON ?auto_179253 ?auto_179252 ) ( ON ?auto_179254 ?auto_179253 ) ( CLEAR ?auto_179256 ) ( ON ?auto_179255 ?auto_179254 ) ( CLEAR ?auto_179255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_179258 ?auto_179250 ?auto_179251 ?auto_179252 ?auto_179253 ?auto_179254 )
      ( MAKE-8PILE ?auto_179250 ?auto_179251 ?auto_179252 ?auto_179253 ?auto_179254 ?auto_179255 ?auto_179256 ?auto_179257 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179259 - BLOCK
      ?auto_179260 - BLOCK
      ?auto_179261 - BLOCK
      ?auto_179262 - BLOCK
      ?auto_179263 - BLOCK
      ?auto_179264 - BLOCK
      ?auto_179265 - BLOCK
      ?auto_179266 - BLOCK
    )
    :vars
    (
      ?auto_179267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179259 ?auto_179260 ) ) ( not ( = ?auto_179259 ?auto_179261 ) ) ( not ( = ?auto_179259 ?auto_179262 ) ) ( not ( = ?auto_179259 ?auto_179263 ) ) ( not ( = ?auto_179259 ?auto_179264 ) ) ( not ( = ?auto_179259 ?auto_179265 ) ) ( not ( = ?auto_179259 ?auto_179266 ) ) ( not ( = ?auto_179260 ?auto_179261 ) ) ( not ( = ?auto_179260 ?auto_179262 ) ) ( not ( = ?auto_179260 ?auto_179263 ) ) ( not ( = ?auto_179260 ?auto_179264 ) ) ( not ( = ?auto_179260 ?auto_179265 ) ) ( not ( = ?auto_179260 ?auto_179266 ) ) ( not ( = ?auto_179261 ?auto_179262 ) ) ( not ( = ?auto_179261 ?auto_179263 ) ) ( not ( = ?auto_179261 ?auto_179264 ) ) ( not ( = ?auto_179261 ?auto_179265 ) ) ( not ( = ?auto_179261 ?auto_179266 ) ) ( not ( = ?auto_179262 ?auto_179263 ) ) ( not ( = ?auto_179262 ?auto_179264 ) ) ( not ( = ?auto_179262 ?auto_179265 ) ) ( not ( = ?auto_179262 ?auto_179266 ) ) ( not ( = ?auto_179263 ?auto_179264 ) ) ( not ( = ?auto_179263 ?auto_179265 ) ) ( not ( = ?auto_179263 ?auto_179266 ) ) ( not ( = ?auto_179264 ?auto_179265 ) ) ( not ( = ?auto_179264 ?auto_179266 ) ) ( not ( = ?auto_179265 ?auto_179266 ) ) ( ON-TABLE ?auto_179266 ) ( ON ?auto_179259 ?auto_179267 ) ( not ( = ?auto_179259 ?auto_179267 ) ) ( not ( = ?auto_179260 ?auto_179267 ) ) ( not ( = ?auto_179261 ?auto_179267 ) ) ( not ( = ?auto_179262 ?auto_179267 ) ) ( not ( = ?auto_179263 ?auto_179267 ) ) ( not ( = ?auto_179264 ?auto_179267 ) ) ( not ( = ?auto_179265 ?auto_179267 ) ) ( not ( = ?auto_179266 ?auto_179267 ) ) ( ON ?auto_179260 ?auto_179259 ) ( ON-TABLE ?auto_179267 ) ( ON ?auto_179261 ?auto_179260 ) ( ON ?auto_179262 ?auto_179261 ) ( ON ?auto_179263 ?auto_179262 ) ( ON ?auto_179264 ?auto_179263 ) ( CLEAR ?auto_179264 ) ( HOLDING ?auto_179265 ) ( CLEAR ?auto_179266 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_179266 ?auto_179265 )
      ( MAKE-8PILE ?auto_179259 ?auto_179260 ?auto_179261 ?auto_179262 ?auto_179263 ?auto_179264 ?auto_179265 ?auto_179266 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179268 - BLOCK
      ?auto_179269 - BLOCK
      ?auto_179270 - BLOCK
      ?auto_179271 - BLOCK
      ?auto_179272 - BLOCK
      ?auto_179273 - BLOCK
      ?auto_179274 - BLOCK
      ?auto_179275 - BLOCK
    )
    :vars
    (
      ?auto_179276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179268 ?auto_179269 ) ) ( not ( = ?auto_179268 ?auto_179270 ) ) ( not ( = ?auto_179268 ?auto_179271 ) ) ( not ( = ?auto_179268 ?auto_179272 ) ) ( not ( = ?auto_179268 ?auto_179273 ) ) ( not ( = ?auto_179268 ?auto_179274 ) ) ( not ( = ?auto_179268 ?auto_179275 ) ) ( not ( = ?auto_179269 ?auto_179270 ) ) ( not ( = ?auto_179269 ?auto_179271 ) ) ( not ( = ?auto_179269 ?auto_179272 ) ) ( not ( = ?auto_179269 ?auto_179273 ) ) ( not ( = ?auto_179269 ?auto_179274 ) ) ( not ( = ?auto_179269 ?auto_179275 ) ) ( not ( = ?auto_179270 ?auto_179271 ) ) ( not ( = ?auto_179270 ?auto_179272 ) ) ( not ( = ?auto_179270 ?auto_179273 ) ) ( not ( = ?auto_179270 ?auto_179274 ) ) ( not ( = ?auto_179270 ?auto_179275 ) ) ( not ( = ?auto_179271 ?auto_179272 ) ) ( not ( = ?auto_179271 ?auto_179273 ) ) ( not ( = ?auto_179271 ?auto_179274 ) ) ( not ( = ?auto_179271 ?auto_179275 ) ) ( not ( = ?auto_179272 ?auto_179273 ) ) ( not ( = ?auto_179272 ?auto_179274 ) ) ( not ( = ?auto_179272 ?auto_179275 ) ) ( not ( = ?auto_179273 ?auto_179274 ) ) ( not ( = ?auto_179273 ?auto_179275 ) ) ( not ( = ?auto_179274 ?auto_179275 ) ) ( ON-TABLE ?auto_179275 ) ( ON ?auto_179268 ?auto_179276 ) ( not ( = ?auto_179268 ?auto_179276 ) ) ( not ( = ?auto_179269 ?auto_179276 ) ) ( not ( = ?auto_179270 ?auto_179276 ) ) ( not ( = ?auto_179271 ?auto_179276 ) ) ( not ( = ?auto_179272 ?auto_179276 ) ) ( not ( = ?auto_179273 ?auto_179276 ) ) ( not ( = ?auto_179274 ?auto_179276 ) ) ( not ( = ?auto_179275 ?auto_179276 ) ) ( ON ?auto_179269 ?auto_179268 ) ( ON-TABLE ?auto_179276 ) ( ON ?auto_179270 ?auto_179269 ) ( ON ?auto_179271 ?auto_179270 ) ( ON ?auto_179272 ?auto_179271 ) ( ON ?auto_179273 ?auto_179272 ) ( CLEAR ?auto_179275 ) ( ON ?auto_179274 ?auto_179273 ) ( CLEAR ?auto_179274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_179276 ?auto_179268 ?auto_179269 ?auto_179270 ?auto_179271 ?auto_179272 ?auto_179273 )
      ( MAKE-8PILE ?auto_179268 ?auto_179269 ?auto_179270 ?auto_179271 ?auto_179272 ?auto_179273 ?auto_179274 ?auto_179275 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179277 - BLOCK
      ?auto_179278 - BLOCK
      ?auto_179279 - BLOCK
      ?auto_179280 - BLOCK
      ?auto_179281 - BLOCK
      ?auto_179282 - BLOCK
      ?auto_179283 - BLOCK
      ?auto_179284 - BLOCK
    )
    :vars
    (
      ?auto_179285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179277 ?auto_179278 ) ) ( not ( = ?auto_179277 ?auto_179279 ) ) ( not ( = ?auto_179277 ?auto_179280 ) ) ( not ( = ?auto_179277 ?auto_179281 ) ) ( not ( = ?auto_179277 ?auto_179282 ) ) ( not ( = ?auto_179277 ?auto_179283 ) ) ( not ( = ?auto_179277 ?auto_179284 ) ) ( not ( = ?auto_179278 ?auto_179279 ) ) ( not ( = ?auto_179278 ?auto_179280 ) ) ( not ( = ?auto_179278 ?auto_179281 ) ) ( not ( = ?auto_179278 ?auto_179282 ) ) ( not ( = ?auto_179278 ?auto_179283 ) ) ( not ( = ?auto_179278 ?auto_179284 ) ) ( not ( = ?auto_179279 ?auto_179280 ) ) ( not ( = ?auto_179279 ?auto_179281 ) ) ( not ( = ?auto_179279 ?auto_179282 ) ) ( not ( = ?auto_179279 ?auto_179283 ) ) ( not ( = ?auto_179279 ?auto_179284 ) ) ( not ( = ?auto_179280 ?auto_179281 ) ) ( not ( = ?auto_179280 ?auto_179282 ) ) ( not ( = ?auto_179280 ?auto_179283 ) ) ( not ( = ?auto_179280 ?auto_179284 ) ) ( not ( = ?auto_179281 ?auto_179282 ) ) ( not ( = ?auto_179281 ?auto_179283 ) ) ( not ( = ?auto_179281 ?auto_179284 ) ) ( not ( = ?auto_179282 ?auto_179283 ) ) ( not ( = ?auto_179282 ?auto_179284 ) ) ( not ( = ?auto_179283 ?auto_179284 ) ) ( ON ?auto_179277 ?auto_179285 ) ( not ( = ?auto_179277 ?auto_179285 ) ) ( not ( = ?auto_179278 ?auto_179285 ) ) ( not ( = ?auto_179279 ?auto_179285 ) ) ( not ( = ?auto_179280 ?auto_179285 ) ) ( not ( = ?auto_179281 ?auto_179285 ) ) ( not ( = ?auto_179282 ?auto_179285 ) ) ( not ( = ?auto_179283 ?auto_179285 ) ) ( not ( = ?auto_179284 ?auto_179285 ) ) ( ON ?auto_179278 ?auto_179277 ) ( ON-TABLE ?auto_179285 ) ( ON ?auto_179279 ?auto_179278 ) ( ON ?auto_179280 ?auto_179279 ) ( ON ?auto_179281 ?auto_179280 ) ( ON ?auto_179282 ?auto_179281 ) ( ON ?auto_179283 ?auto_179282 ) ( CLEAR ?auto_179283 ) ( HOLDING ?auto_179284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_179284 )
      ( MAKE-8PILE ?auto_179277 ?auto_179278 ?auto_179279 ?auto_179280 ?auto_179281 ?auto_179282 ?auto_179283 ?auto_179284 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_179286 - BLOCK
      ?auto_179287 - BLOCK
      ?auto_179288 - BLOCK
      ?auto_179289 - BLOCK
      ?auto_179290 - BLOCK
      ?auto_179291 - BLOCK
      ?auto_179292 - BLOCK
      ?auto_179293 - BLOCK
    )
    :vars
    (
      ?auto_179294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_179286 ?auto_179287 ) ) ( not ( = ?auto_179286 ?auto_179288 ) ) ( not ( = ?auto_179286 ?auto_179289 ) ) ( not ( = ?auto_179286 ?auto_179290 ) ) ( not ( = ?auto_179286 ?auto_179291 ) ) ( not ( = ?auto_179286 ?auto_179292 ) ) ( not ( = ?auto_179286 ?auto_179293 ) ) ( not ( = ?auto_179287 ?auto_179288 ) ) ( not ( = ?auto_179287 ?auto_179289 ) ) ( not ( = ?auto_179287 ?auto_179290 ) ) ( not ( = ?auto_179287 ?auto_179291 ) ) ( not ( = ?auto_179287 ?auto_179292 ) ) ( not ( = ?auto_179287 ?auto_179293 ) ) ( not ( = ?auto_179288 ?auto_179289 ) ) ( not ( = ?auto_179288 ?auto_179290 ) ) ( not ( = ?auto_179288 ?auto_179291 ) ) ( not ( = ?auto_179288 ?auto_179292 ) ) ( not ( = ?auto_179288 ?auto_179293 ) ) ( not ( = ?auto_179289 ?auto_179290 ) ) ( not ( = ?auto_179289 ?auto_179291 ) ) ( not ( = ?auto_179289 ?auto_179292 ) ) ( not ( = ?auto_179289 ?auto_179293 ) ) ( not ( = ?auto_179290 ?auto_179291 ) ) ( not ( = ?auto_179290 ?auto_179292 ) ) ( not ( = ?auto_179290 ?auto_179293 ) ) ( not ( = ?auto_179291 ?auto_179292 ) ) ( not ( = ?auto_179291 ?auto_179293 ) ) ( not ( = ?auto_179292 ?auto_179293 ) ) ( ON ?auto_179286 ?auto_179294 ) ( not ( = ?auto_179286 ?auto_179294 ) ) ( not ( = ?auto_179287 ?auto_179294 ) ) ( not ( = ?auto_179288 ?auto_179294 ) ) ( not ( = ?auto_179289 ?auto_179294 ) ) ( not ( = ?auto_179290 ?auto_179294 ) ) ( not ( = ?auto_179291 ?auto_179294 ) ) ( not ( = ?auto_179292 ?auto_179294 ) ) ( not ( = ?auto_179293 ?auto_179294 ) ) ( ON ?auto_179287 ?auto_179286 ) ( ON-TABLE ?auto_179294 ) ( ON ?auto_179288 ?auto_179287 ) ( ON ?auto_179289 ?auto_179288 ) ( ON ?auto_179290 ?auto_179289 ) ( ON ?auto_179291 ?auto_179290 ) ( ON ?auto_179292 ?auto_179291 ) ( ON ?auto_179293 ?auto_179292 ) ( CLEAR ?auto_179293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_179294 ?auto_179286 ?auto_179287 ?auto_179288 ?auto_179289 ?auto_179290 ?auto_179291 ?auto_179292 )
      ( MAKE-8PILE ?auto_179286 ?auto_179287 ?auto_179288 ?auto_179289 ?auto_179290 ?auto_179291 ?auto_179292 ?auto_179293 ) )
  )

)

