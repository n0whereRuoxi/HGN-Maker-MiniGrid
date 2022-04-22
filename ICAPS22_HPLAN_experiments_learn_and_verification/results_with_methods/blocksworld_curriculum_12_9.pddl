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
      ?auto_175022 - BLOCK
    )
    :vars
    (
      ?auto_175023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175022 ?auto_175023 ) ( CLEAR ?auto_175022 ) ( HAND-EMPTY ) ( not ( = ?auto_175022 ?auto_175023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175022 ?auto_175023 )
      ( !PUTDOWN ?auto_175022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_175025 - BLOCK
    )
    :vars
    (
      ?auto_175026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175025 ?auto_175026 ) ( CLEAR ?auto_175025 ) ( HAND-EMPTY ) ( not ( = ?auto_175025 ?auto_175026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175025 ?auto_175026 )
      ( !PUTDOWN ?auto_175025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175029 - BLOCK
      ?auto_175030 - BLOCK
    )
    :vars
    (
      ?auto_175031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175029 ) ( ON ?auto_175030 ?auto_175031 ) ( CLEAR ?auto_175030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175029 ) ( not ( = ?auto_175029 ?auto_175030 ) ) ( not ( = ?auto_175029 ?auto_175031 ) ) ( not ( = ?auto_175030 ?auto_175031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175030 ?auto_175031 )
      ( !STACK ?auto_175030 ?auto_175029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175034 - BLOCK
      ?auto_175035 - BLOCK
    )
    :vars
    (
      ?auto_175036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175034 ) ( ON ?auto_175035 ?auto_175036 ) ( CLEAR ?auto_175035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175034 ) ( not ( = ?auto_175034 ?auto_175035 ) ) ( not ( = ?auto_175034 ?auto_175036 ) ) ( not ( = ?auto_175035 ?auto_175036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175035 ?auto_175036 )
      ( !STACK ?auto_175035 ?auto_175034 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175039 - BLOCK
      ?auto_175040 - BLOCK
    )
    :vars
    (
      ?auto_175041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175040 ?auto_175041 ) ( not ( = ?auto_175039 ?auto_175040 ) ) ( not ( = ?auto_175039 ?auto_175041 ) ) ( not ( = ?auto_175040 ?auto_175041 ) ) ( ON ?auto_175039 ?auto_175040 ) ( CLEAR ?auto_175039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175039 )
      ( MAKE-2PILE ?auto_175039 ?auto_175040 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_175044 - BLOCK
      ?auto_175045 - BLOCK
    )
    :vars
    (
      ?auto_175046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175045 ?auto_175046 ) ( not ( = ?auto_175044 ?auto_175045 ) ) ( not ( = ?auto_175044 ?auto_175046 ) ) ( not ( = ?auto_175045 ?auto_175046 ) ) ( ON ?auto_175044 ?auto_175045 ) ( CLEAR ?auto_175044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175044 )
      ( MAKE-2PILE ?auto_175044 ?auto_175045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175050 - BLOCK
      ?auto_175051 - BLOCK
      ?auto_175052 - BLOCK
    )
    :vars
    (
      ?auto_175053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175051 ) ( ON ?auto_175052 ?auto_175053 ) ( CLEAR ?auto_175052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175050 ) ( ON ?auto_175051 ?auto_175050 ) ( not ( = ?auto_175050 ?auto_175051 ) ) ( not ( = ?auto_175050 ?auto_175052 ) ) ( not ( = ?auto_175050 ?auto_175053 ) ) ( not ( = ?auto_175051 ?auto_175052 ) ) ( not ( = ?auto_175051 ?auto_175053 ) ) ( not ( = ?auto_175052 ?auto_175053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175052 ?auto_175053 )
      ( !STACK ?auto_175052 ?auto_175051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175057 - BLOCK
      ?auto_175058 - BLOCK
      ?auto_175059 - BLOCK
    )
    :vars
    (
      ?auto_175060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175058 ) ( ON ?auto_175059 ?auto_175060 ) ( CLEAR ?auto_175059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175057 ) ( ON ?auto_175058 ?auto_175057 ) ( not ( = ?auto_175057 ?auto_175058 ) ) ( not ( = ?auto_175057 ?auto_175059 ) ) ( not ( = ?auto_175057 ?auto_175060 ) ) ( not ( = ?auto_175058 ?auto_175059 ) ) ( not ( = ?auto_175058 ?auto_175060 ) ) ( not ( = ?auto_175059 ?auto_175060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175059 ?auto_175060 )
      ( !STACK ?auto_175059 ?auto_175058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175064 - BLOCK
      ?auto_175065 - BLOCK
      ?auto_175066 - BLOCK
    )
    :vars
    (
      ?auto_175067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175066 ?auto_175067 ) ( ON-TABLE ?auto_175064 ) ( not ( = ?auto_175064 ?auto_175065 ) ) ( not ( = ?auto_175064 ?auto_175066 ) ) ( not ( = ?auto_175064 ?auto_175067 ) ) ( not ( = ?auto_175065 ?auto_175066 ) ) ( not ( = ?auto_175065 ?auto_175067 ) ) ( not ( = ?auto_175066 ?auto_175067 ) ) ( CLEAR ?auto_175064 ) ( ON ?auto_175065 ?auto_175066 ) ( CLEAR ?auto_175065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175064 ?auto_175065 )
      ( MAKE-3PILE ?auto_175064 ?auto_175065 ?auto_175066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175071 - BLOCK
      ?auto_175072 - BLOCK
      ?auto_175073 - BLOCK
    )
    :vars
    (
      ?auto_175074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175073 ?auto_175074 ) ( ON-TABLE ?auto_175071 ) ( not ( = ?auto_175071 ?auto_175072 ) ) ( not ( = ?auto_175071 ?auto_175073 ) ) ( not ( = ?auto_175071 ?auto_175074 ) ) ( not ( = ?auto_175072 ?auto_175073 ) ) ( not ( = ?auto_175072 ?auto_175074 ) ) ( not ( = ?auto_175073 ?auto_175074 ) ) ( CLEAR ?auto_175071 ) ( ON ?auto_175072 ?auto_175073 ) ( CLEAR ?auto_175072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175071 ?auto_175072 )
      ( MAKE-3PILE ?auto_175071 ?auto_175072 ?auto_175073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175078 - BLOCK
      ?auto_175079 - BLOCK
      ?auto_175080 - BLOCK
    )
    :vars
    (
      ?auto_175081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175080 ?auto_175081 ) ( not ( = ?auto_175078 ?auto_175079 ) ) ( not ( = ?auto_175078 ?auto_175080 ) ) ( not ( = ?auto_175078 ?auto_175081 ) ) ( not ( = ?auto_175079 ?auto_175080 ) ) ( not ( = ?auto_175079 ?auto_175081 ) ) ( not ( = ?auto_175080 ?auto_175081 ) ) ( ON ?auto_175079 ?auto_175080 ) ( ON ?auto_175078 ?auto_175079 ) ( CLEAR ?auto_175078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175078 )
      ( MAKE-3PILE ?auto_175078 ?auto_175079 ?auto_175080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_175085 - BLOCK
      ?auto_175086 - BLOCK
      ?auto_175087 - BLOCK
    )
    :vars
    (
      ?auto_175088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175087 ?auto_175088 ) ( not ( = ?auto_175085 ?auto_175086 ) ) ( not ( = ?auto_175085 ?auto_175087 ) ) ( not ( = ?auto_175085 ?auto_175088 ) ) ( not ( = ?auto_175086 ?auto_175087 ) ) ( not ( = ?auto_175086 ?auto_175088 ) ) ( not ( = ?auto_175087 ?auto_175088 ) ) ( ON ?auto_175086 ?auto_175087 ) ( ON ?auto_175085 ?auto_175086 ) ( CLEAR ?auto_175085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175085 )
      ( MAKE-3PILE ?auto_175085 ?auto_175086 ?auto_175087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175093 - BLOCK
      ?auto_175094 - BLOCK
      ?auto_175095 - BLOCK
      ?auto_175096 - BLOCK
    )
    :vars
    (
      ?auto_175097 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175095 ) ( ON ?auto_175096 ?auto_175097 ) ( CLEAR ?auto_175096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175093 ) ( ON ?auto_175094 ?auto_175093 ) ( ON ?auto_175095 ?auto_175094 ) ( not ( = ?auto_175093 ?auto_175094 ) ) ( not ( = ?auto_175093 ?auto_175095 ) ) ( not ( = ?auto_175093 ?auto_175096 ) ) ( not ( = ?auto_175093 ?auto_175097 ) ) ( not ( = ?auto_175094 ?auto_175095 ) ) ( not ( = ?auto_175094 ?auto_175096 ) ) ( not ( = ?auto_175094 ?auto_175097 ) ) ( not ( = ?auto_175095 ?auto_175096 ) ) ( not ( = ?auto_175095 ?auto_175097 ) ) ( not ( = ?auto_175096 ?auto_175097 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175096 ?auto_175097 )
      ( !STACK ?auto_175096 ?auto_175095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175102 - BLOCK
      ?auto_175103 - BLOCK
      ?auto_175104 - BLOCK
      ?auto_175105 - BLOCK
    )
    :vars
    (
      ?auto_175106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175104 ) ( ON ?auto_175105 ?auto_175106 ) ( CLEAR ?auto_175105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175102 ) ( ON ?auto_175103 ?auto_175102 ) ( ON ?auto_175104 ?auto_175103 ) ( not ( = ?auto_175102 ?auto_175103 ) ) ( not ( = ?auto_175102 ?auto_175104 ) ) ( not ( = ?auto_175102 ?auto_175105 ) ) ( not ( = ?auto_175102 ?auto_175106 ) ) ( not ( = ?auto_175103 ?auto_175104 ) ) ( not ( = ?auto_175103 ?auto_175105 ) ) ( not ( = ?auto_175103 ?auto_175106 ) ) ( not ( = ?auto_175104 ?auto_175105 ) ) ( not ( = ?auto_175104 ?auto_175106 ) ) ( not ( = ?auto_175105 ?auto_175106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175105 ?auto_175106 )
      ( !STACK ?auto_175105 ?auto_175104 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175111 - BLOCK
      ?auto_175112 - BLOCK
      ?auto_175113 - BLOCK
      ?auto_175114 - BLOCK
    )
    :vars
    (
      ?auto_175115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175114 ?auto_175115 ) ( ON-TABLE ?auto_175111 ) ( ON ?auto_175112 ?auto_175111 ) ( not ( = ?auto_175111 ?auto_175112 ) ) ( not ( = ?auto_175111 ?auto_175113 ) ) ( not ( = ?auto_175111 ?auto_175114 ) ) ( not ( = ?auto_175111 ?auto_175115 ) ) ( not ( = ?auto_175112 ?auto_175113 ) ) ( not ( = ?auto_175112 ?auto_175114 ) ) ( not ( = ?auto_175112 ?auto_175115 ) ) ( not ( = ?auto_175113 ?auto_175114 ) ) ( not ( = ?auto_175113 ?auto_175115 ) ) ( not ( = ?auto_175114 ?auto_175115 ) ) ( CLEAR ?auto_175112 ) ( ON ?auto_175113 ?auto_175114 ) ( CLEAR ?auto_175113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175111 ?auto_175112 ?auto_175113 )
      ( MAKE-4PILE ?auto_175111 ?auto_175112 ?auto_175113 ?auto_175114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175120 - BLOCK
      ?auto_175121 - BLOCK
      ?auto_175122 - BLOCK
      ?auto_175123 - BLOCK
    )
    :vars
    (
      ?auto_175124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175123 ?auto_175124 ) ( ON-TABLE ?auto_175120 ) ( ON ?auto_175121 ?auto_175120 ) ( not ( = ?auto_175120 ?auto_175121 ) ) ( not ( = ?auto_175120 ?auto_175122 ) ) ( not ( = ?auto_175120 ?auto_175123 ) ) ( not ( = ?auto_175120 ?auto_175124 ) ) ( not ( = ?auto_175121 ?auto_175122 ) ) ( not ( = ?auto_175121 ?auto_175123 ) ) ( not ( = ?auto_175121 ?auto_175124 ) ) ( not ( = ?auto_175122 ?auto_175123 ) ) ( not ( = ?auto_175122 ?auto_175124 ) ) ( not ( = ?auto_175123 ?auto_175124 ) ) ( CLEAR ?auto_175121 ) ( ON ?auto_175122 ?auto_175123 ) ( CLEAR ?auto_175122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175120 ?auto_175121 ?auto_175122 )
      ( MAKE-4PILE ?auto_175120 ?auto_175121 ?auto_175122 ?auto_175123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175129 - BLOCK
      ?auto_175130 - BLOCK
      ?auto_175131 - BLOCK
      ?auto_175132 - BLOCK
    )
    :vars
    (
      ?auto_175133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175132 ?auto_175133 ) ( ON-TABLE ?auto_175129 ) ( not ( = ?auto_175129 ?auto_175130 ) ) ( not ( = ?auto_175129 ?auto_175131 ) ) ( not ( = ?auto_175129 ?auto_175132 ) ) ( not ( = ?auto_175129 ?auto_175133 ) ) ( not ( = ?auto_175130 ?auto_175131 ) ) ( not ( = ?auto_175130 ?auto_175132 ) ) ( not ( = ?auto_175130 ?auto_175133 ) ) ( not ( = ?auto_175131 ?auto_175132 ) ) ( not ( = ?auto_175131 ?auto_175133 ) ) ( not ( = ?auto_175132 ?auto_175133 ) ) ( ON ?auto_175131 ?auto_175132 ) ( CLEAR ?auto_175129 ) ( ON ?auto_175130 ?auto_175131 ) ( CLEAR ?auto_175130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175129 ?auto_175130 )
      ( MAKE-4PILE ?auto_175129 ?auto_175130 ?auto_175131 ?auto_175132 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175138 - BLOCK
      ?auto_175139 - BLOCK
      ?auto_175140 - BLOCK
      ?auto_175141 - BLOCK
    )
    :vars
    (
      ?auto_175142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175141 ?auto_175142 ) ( ON-TABLE ?auto_175138 ) ( not ( = ?auto_175138 ?auto_175139 ) ) ( not ( = ?auto_175138 ?auto_175140 ) ) ( not ( = ?auto_175138 ?auto_175141 ) ) ( not ( = ?auto_175138 ?auto_175142 ) ) ( not ( = ?auto_175139 ?auto_175140 ) ) ( not ( = ?auto_175139 ?auto_175141 ) ) ( not ( = ?auto_175139 ?auto_175142 ) ) ( not ( = ?auto_175140 ?auto_175141 ) ) ( not ( = ?auto_175140 ?auto_175142 ) ) ( not ( = ?auto_175141 ?auto_175142 ) ) ( ON ?auto_175140 ?auto_175141 ) ( CLEAR ?auto_175138 ) ( ON ?auto_175139 ?auto_175140 ) ( CLEAR ?auto_175139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175138 ?auto_175139 )
      ( MAKE-4PILE ?auto_175138 ?auto_175139 ?auto_175140 ?auto_175141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175147 - BLOCK
      ?auto_175148 - BLOCK
      ?auto_175149 - BLOCK
      ?auto_175150 - BLOCK
    )
    :vars
    (
      ?auto_175151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175150 ?auto_175151 ) ( not ( = ?auto_175147 ?auto_175148 ) ) ( not ( = ?auto_175147 ?auto_175149 ) ) ( not ( = ?auto_175147 ?auto_175150 ) ) ( not ( = ?auto_175147 ?auto_175151 ) ) ( not ( = ?auto_175148 ?auto_175149 ) ) ( not ( = ?auto_175148 ?auto_175150 ) ) ( not ( = ?auto_175148 ?auto_175151 ) ) ( not ( = ?auto_175149 ?auto_175150 ) ) ( not ( = ?auto_175149 ?auto_175151 ) ) ( not ( = ?auto_175150 ?auto_175151 ) ) ( ON ?auto_175149 ?auto_175150 ) ( ON ?auto_175148 ?auto_175149 ) ( ON ?auto_175147 ?auto_175148 ) ( CLEAR ?auto_175147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175147 )
      ( MAKE-4PILE ?auto_175147 ?auto_175148 ?auto_175149 ?auto_175150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_175156 - BLOCK
      ?auto_175157 - BLOCK
      ?auto_175158 - BLOCK
      ?auto_175159 - BLOCK
    )
    :vars
    (
      ?auto_175160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175159 ?auto_175160 ) ( not ( = ?auto_175156 ?auto_175157 ) ) ( not ( = ?auto_175156 ?auto_175158 ) ) ( not ( = ?auto_175156 ?auto_175159 ) ) ( not ( = ?auto_175156 ?auto_175160 ) ) ( not ( = ?auto_175157 ?auto_175158 ) ) ( not ( = ?auto_175157 ?auto_175159 ) ) ( not ( = ?auto_175157 ?auto_175160 ) ) ( not ( = ?auto_175158 ?auto_175159 ) ) ( not ( = ?auto_175158 ?auto_175160 ) ) ( not ( = ?auto_175159 ?auto_175160 ) ) ( ON ?auto_175158 ?auto_175159 ) ( ON ?auto_175157 ?auto_175158 ) ( ON ?auto_175156 ?auto_175157 ) ( CLEAR ?auto_175156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175156 )
      ( MAKE-4PILE ?auto_175156 ?auto_175157 ?auto_175158 ?auto_175159 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175166 - BLOCK
      ?auto_175167 - BLOCK
      ?auto_175168 - BLOCK
      ?auto_175169 - BLOCK
      ?auto_175170 - BLOCK
    )
    :vars
    (
      ?auto_175171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175169 ) ( ON ?auto_175170 ?auto_175171 ) ( CLEAR ?auto_175170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175166 ) ( ON ?auto_175167 ?auto_175166 ) ( ON ?auto_175168 ?auto_175167 ) ( ON ?auto_175169 ?auto_175168 ) ( not ( = ?auto_175166 ?auto_175167 ) ) ( not ( = ?auto_175166 ?auto_175168 ) ) ( not ( = ?auto_175166 ?auto_175169 ) ) ( not ( = ?auto_175166 ?auto_175170 ) ) ( not ( = ?auto_175166 ?auto_175171 ) ) ( not ( = ?auto_175167 ?auto_175168 ) ) ( not ( = ?auto_175167 ?auto_175169 ) ) ( not ( = ?auto_175167 ?auto_175170 ) ) ( not ( = ?auto_175167 ?auto_175171 ) ) ( not ( = ?auto_175168 ?auto_175169 ) ) ( not ( = ?auto_175168 ?auto_175170 ) ) ( not ( = ?auto_175168 ?auto_175171 ) ) ( not ( = ?auto_175169 ?auto_175170 ) ) ( not ( = ?auto_175169 ?auto_175171 ) ) ( not ( = ?auto_175170 ?auto_175171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175170 ?auto_175171 )
      ( !STACK ?auto_175170 ?auto_175169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175177 - BLOCK
      ?auto_175178 - BLOCK
      ?auto_175179 - BLOCK
      ?auto_175180 - BLOCK
      ?auto_175181 - BLOCK
    )
    :vars
    (
      ?auto_175182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175180 ) ( ON ?auto_175181 ?auto_175182 ) ( CLEAR ?auto_175181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175177 ) ( ON ?auto_175178 ?auto_175177 ) ( ON ?auto_175179 ?auto_175178 ) ( ON ?auto_175180 ?auto_175179 ) ( not ( = ?auto_175177 ?auto_175178 ) ) ( not ( = ?auto_175177 ?auto_175179 ) ) ( not ( = ?auto_175177 ?auto_175180 ) ) ( not ( = ?auto_175177 ?auto_175181 ) ) ( not ( = ?auto_175177 ?auto_175182 ) ) ( not ( = ?auto_175178 ?auto_175179 ) ) ( not ( = ?auto_175178 ?auto_175180 ) ) ( not ( = ?auto_175178 ?auto_175181 ) ) ( not ( = ?auto_175178 ?auto_175182 ) ) ( not ( = ?auto_175179 ?auto_175180 ) ) ( not ( = ?auto_175179 ?auto_175181 ) ) ( not ( = ?auto_175179 ?auto_175182 ) ) ( not ( = ?auto_175180 ?auto_175181 ) ) ( not ( = ?auto_175180 ?auto_175182 ) ) ( not ( = ?auto_175181 ?auto_175182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175181 ?auto_175182 )
      ( !STACK ?auto_175181 ?auto_175180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175188 - BLOCK
      ?auto_175189 - BLOCK
      ?auto_175190 - BLOCK
      ?auto_175191 - BLOCK
      ?auto_175192 - BLOCK
    )
    :vars
    (
      ?auto_175193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175192 ?auto_175193 ) ( ON-TABLE ?auto_175188 ) ( ON ?auto_175189 ?auto_175188 ) ( ON ?auto_175190 ?auto_175189 ) ( not ( = ?auto_175188 ?auto_175189 ) ) ( not ( = ?auto_175188 ?auto_175190 ) ) ( not ( = ?auto_175188 ?auto_175191 ) ) ( not ( = ?auto_175188 ?auto_175192 ) ) ( not ( = ?auto_175188 ?auto_175193 ) ) ( not ( = ?auto_175189 ?auto_175190 ) ) ( not ( = ?auto_175189 ?auto_175191 ) ) ( not ( = ?auto_175189 ?auto_175192 ) ) ( not ( = ?auto_175189 ?auto_175193 ) ) ( not ( = ?auto_175190 ?auto_175191 ) ) ( not ( = ?auto_175190 ?auto_175192 ) ) ( not ( = ?auto_175190 ?auto_175193 ) ) ( not ( = ?auto_175191 ?auto_175192 ) ) ( not ( = ?auto_175191 ?auto_175193 ) ) ( not ( = ?auto_175192 ?auto_175193 ) ) ( CLEAR ?auto_175190 ) ( ON ?auto_175191 ?auto_175192 ) ( CLEAR ?auto_175191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175188 ?auto_175189 ?auto_175190 ?auto_175191 )
      ( MAKE-5PILE ?auto_175188 ?auto_175189 ?auto_175190 ?auto_175191 ?auto_175192 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175199 - BLOCK
      ?auto_175200 - BLOCK
      ?auto_175201 - BLOCK
      ?auto_175202 - BLOCK
      ?auto_175203 - BLOCK
    )
    :vars
    (
      ?auto_175204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175203 ?auto_175204 ) ( ON-TABLE ?auto_175199 ) ( ON ?auto_175200 ?auto_175199 ) ( ON ?auto_175201 ?auto_175200 ) ( not ( = ?auto_175199 ?auto_175200 ) ) ( not ( = ?auto_175199 ?auto_175201 ) ) ( not ( = ?auto_175199 ?auto_175202 ) ) ( not ( = ?auto_175199 ?auto_175203 ) ) ( not ( = ?auto_175199 ?auto_175204 ) ) ( not ( = ?auto_175200 ?auto_175201 ) ) ( not ( = ?auto_175200 ?auto_175202 ) ) ( not ( = ?auto_175200 ?auto_175203 ) ) ( not ( = ?auto_175200 ?auto_175204 ) ) ( not ( = ?auto_175201 ?auto_175202 ) ) ( not ( = ?auto_175201 ?auto_175203 ) ) ( not ( = ?auto_175201 ?auto_175204 ) ) ( not ( = ?auto_175202 ?auto_175203 ) ) ( not ( = ?auto_175202 ?auto_175204 ) ) ( not ( = ?auto_175203 ?auto_175204 ) ) ( CLEAR ?auto_175201 ) ( ON ?auto_175202 ?auto_175203 ) ( CLEAR ?auto_175202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175199 ?auto_175200 ?auto_175201 ?auto_175202 )
      ( MAKE-5PILE ?auto_175199 ?auto_175200 ?auto_175201 ?auto_175202 ?auto_175203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175210 - BLOCK
      ?auto_175211 - BLOCK
      ?auto_175212 - BLOCK
      ?auto_175213 - BLOCK
      ?auto_175214 - BLOCK
    )
    :vars
    (
      ?auto_175215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175214 ?auto_175215 ) ( ON-TABLE ?auto_175210 ) ( ON ?auto_175211 ?auto_175210 ) ( not ( = ?auto_175210 ?auto_175211 ) ) ( not ( = ?auto_175210 ?auto_175212 ) ) ( not ( = ?auto_175210 ?auto_175213 ) ) ( not ( = ?auto_175210 ?auto_175214 ) ) ( not ( = ?auto_175210 ?auto_175215 ) ) ( not ( = ?auto_175211 ?auto_175212 ) ) ( not ( = ?auto_175211 ?auto_175213 ) ) ( not ( = ?auto_175211 ?auto_175214 ) ) ( not ( = ?auto_175211 ?auto_175215 ) ) ( not ( = ?auto_175212 ?auto_175213 ) ) ( not ( = ?auto_175212 ?auto_175214 ) ) ( not ( = ?auto_175212 ?auto_175215 ) ) ( not ( = ?auto_175213 ?auto_175214 ) ) ( not ( = ?auto_175213 ?auto_175215 ) ) ( not ( = ?auto_175214 ?auto_175215 ) ) ( ON ?auto_175213 ?auto_175214 ) ( CLEAR ?auto_175211 ) ( ON ?auto_175212 ?auto_175213 ) ( CLEAR ?auto_175212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175210 ?auto_175211 ?auto_175212 )
      ( MAKE-5PILE ?auto_175210 ?auto_175211 ?auto_175212 ?auto_175213 ?auto_175214 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175221 - BLOCK
      ?auto_175222 - BLOCK
      ?auto_175223 - BLOCK
      ?auto_175224 - BLOCK
      ?auto_175225 - BLOCK
    )
    :vars
    (
      ?auto_175226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175225 ?auto_175226 ) ( ON-TABLE ?auto_175221 ) ( ON ?auto_175222 ?auto_175221 ) ( not ( = ?auto_175221 ?auto_175222 ) ) ( not ( = ?auto_175221 ?auto_175223 ) ) ( not ( = ?auto_175221 ?auto_175224 ) ) ( not ( = ?auto_175221 ?auto_175225 ) ) ( not ( = ?auto_175221 ?auto_175226 ) ) ( not ( = ?auto_175222 ?auto_175223 ) ) ( not ( = ?auto_175222 ?auto_175224 ) ) ( not ( = ?auto_175222 ?auto_175225 ) ) ( not ( = ?auto_175222 ?auto_175226 ) ) ( not ( = ?auto_175223 ?auto_175224 ) ) ( not ( = ?auto_175223 ?auto_175225 ) ) ( not ( = ?auto_175223 ?auto_175226 ) ) ( not ( = ?auto_175224 ?auto_175225 ) ) ( not ( = ?auto_175224 ?auto_175226 ) ) ( not ( = ?auto_175225 ?auto_175226 ) ) ( ON ?auto_175224 ?auto_175225 ) ( CLEAR ?auto_175222 ) ( ON ?auto_175223 ?auto_175224 ) ( CLEAR ?auto_175223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175221 ?auto_175222 ?auto_175223 )
      ( MAKE-5PILE ?auto_175221 ?auto_175222 ?auto_175223 ?auto_175224 ?auto_175225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175232 - BLOCK
      ?auto_175233 - BLOCK
      ?auto_175234 - BLOCK
      ?auto_175235 - BLOCK
      ?auto_175236 - BLOCK
    )
    :vars
    (
      ?auto_175237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175236 ?auto_175237 ) ( ON-TABLE ?auto_175232 ) ( not ( = ?auto_175232 ?auto_175233 ) ) ( not ( = ?auto_175232 ?auto_175234 ) ) ( not ( = ?auto_175232 ?auto_175235 ) ) ( not ( = ?auto_175232 ?auto_175236 ) ) ( not ( = ?auto_175232 ?auto_175237 ) ) ( not ( = ?auto_175233 ?auto_175234 ) ) ( not ( = ?auto_175233 ?auto_175235 ) ) ( not ( = ?auto_175233 ?auto_175236 ) ) ( not ( = ?auto_175233 ?auto_175237 ) ) ( not ( = ?auto_175234 ?auto_175235 ) ) ( not ( = ?auto_175234 ?auto_175236 ) ) ( not ( = ?auto_175234 ?auto_175237 ) ) ( not ( = ?auto_175235 ?auto_175236 ) ) ( not ( = ?auto_175235 ?auto_175237 ) ) ( not ( = ?auto_175236 ?auto_175237 ) ) ( ON ?auto_175235 ?auto_175236 ) ( ON ?auto_175234 ?auto_175235 ) ( CLEAR ?auto_175232 ) ( ON ?auto_175233 ?auto_175234 ) ( CLEAR ?auto_175233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175232 ?auto_175233 )
      ( MAKE-5PILE ?auto_175232 ?auto_175233 ?auto_175234 ?auto_175235 ?auto_175236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175243 - BLOCK
      ?auto_175244 - BLOCK
      ?auto_175245 - BLOCK
      ?auto_175246 - BLOCK
      ?auto_175247 - BLOCK
    )
    :vars
    (
      ?auto_175248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175247 ?auto_175248 ) ( ON-TABLE ?auto_175243 ) ( not ( = ?auto_175243 ?auto_175244 ) ) ( not ( = ?auto_175243 ?auto_175245 ) ) ( not ( = ?auto_175243 ?auto_175246 ) ) ( not ( = ?auto_175243 ?auto_175247 ) ) ( not ( = ?auto_175243 ?auto_175248 ) ) ( not ( = ?auto_175244 ?auto_175245 ) ) ( not ( = ?auto_175244 ?auto_175246 ) ) ( not ( = ?auto_175244 ?auto_175247 ) ) ( not ( = ?auto_175244 ?auto_175248 ) ) ( not ( = ?auto_175245 ?auto_175246 ) ) ( not ( = ?auto_175245 ?auto_175247 ) ) ( not ( = ?auto_175245 ?auto_175248 ) ) ( not ( = ?auto_175246 ?auto_175247 ) ) ( not ( = ?auto_175246 ?auto_175248 ) ) ( not ( = ?auto_175247 ?auto_175248 ) ) ( ON ?auto_175246 ?auto_175247 ) ( ON ?auto_175245 ?auto_175246 ) ( CLEAR ?auto_175243 ) ( ON ?auto_175244 ?auto_175245 ) ( CLEAR ?auto_175244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175243 ?auto_175244 )
      ( MAKE-5PILE ?auto_175243 ?auto_175244 ?auto_175245 ?auto_175246 ?auto_175247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175254 - BLOCK
      ?auto_175255 - BLOCK
      ?auto_175256 - BLOCK
      ?auto_175257 - BLOCK
      ?auto_175258 - BLOCK
    )
    :vars
    (
      ?auto_175259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175258 ?auto_175259 ) ( not ( = ?auto_175254 ?auto_175255 ) ) ( not ( = ?auto_175254 ?auto_175256 ) ) ( not ( = ?auto_175254 ?auto_175257 ) ) ( not ( = ?auto_175254 ?auto_175258 ) ) ( not ( = ?auto_175254 ?auto_175259 ) ) ( not ( = ?auto_175255 ?auto_175256 ) ) ( not ( = ?auto_175255 ?auto_175257 ) ) ( not ( = ?auto_175255 ?auto_175258 ) ) ( not ( = ?auto_175255 ?auto_175259 ) ) ( not ( = ?auto_175256 ?auto_175257 ) ) ( not ( = ?auto_175256 ?auto_175258 ) ) ( not ( = ?auto_175256 ?auto_175259 ) ) ( not ( = ?auto_175257 ?auto_175258 ) ) ( not ( = ?auto_175257 ?auto_175259 ) ) ( not ( = ?auto_175258 ?auto_175259 ) ) ( ON ?auto_175257 ?auto_175258 ) ( ON ?auto_175256 ?auto_175257 ) ( ON ?auto_175255 ?auto_175256 ) ( ON ?auto_175254 ?auto_175255 ) ( CLEAR ?auto_175254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175254 )
      ( MAKE-5PILE ?auto_175254 ?auto_175255 ?auto_175256 ?auto_175257 ?auto_175258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_175265 - BLOCK
      ?auto_175266 - BLOCK
      ?auto_175267 - BLOCK
      ?auto_175268 - BLOCK
      ?auto_175269 - BLOCK
    )
    :vars
    (
      ?auto_175270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175269 ?auto_175270 ) ( not ( = ?auto_175265 ?auto_175266 ) ) ( not ( = ?auto_175265 ?auto_175267 ) ) ( not ( = ?auto_175265 ?auto_175268 ) ) ( not ( = ?auto_175265 ?auto_175269 ) ) ( not ( = ?auto_175265 ?auto_175270 ) ) ( not ( = ?auto_175266 ?auto_175267 ) ) ( not ( = ?auto_175266 ?auto_175268 ) ) ( not ( = ?auto_175266 ?auto_175269 ) ) ( not ( = ?auto_175266 ?auto_175270 ) ) ( not ( = ?auto_175267 ?auto_175268 ) ) ( not ( = ?auto_175267 ?auto_175269 ) ) ( not ( = ?auto_175267 ?auto_175270 ) ) ( not ( = ?auto_175268 ?auto_175269 ) ) ( not ( = ?auto_175268 ?auto_175270 ) ) ( not ( = ?auto_175269 ?auto_175270 ) ) ( ON ?auto_175268 ?auto_175269 ) ( ON ?auto_175267 ?auto_175268 ) ( ON ?auto_175266 ?auto_175267 ) ( ON ?auto_175265 ?auto_175266 ) ( CLEAR ?auto_175265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175265 )
      ( MAKE-5PILE ?auto_175265 ?auto_175266 ?auto_175267 ?auto_175268 ?auto_175269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175277 - BLOCK
      ?auto_175278 - BLOCK
      ?auto_175279 - BLOCK
      ?auto_175280 - BLOCK
      ?auto_175281 - BLOCK
      ?auto_175282 - BLOCK
    )
    :vars
    (
      ?auto_175283 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175281 ) ( ON ?auto_175282 ?auto_175283 ) ( CLEAR ?auto_175282 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175277 ) ( ON ?auto_175278 ?auto_175277 ) ( ON ?auto_175279 ?auto_175278 ) ( ON ?auto_175280 ?auto_175279 ) ( ON ?auto_175281 ?auto_175280 ) ( not ( = ?auto_175277 ?auto_175278 ) ) ( not ( = ?auto_175277 ?auto_175279 ) ) ( not ( = ?auto_175277 ?auto_175280 ) ) ( not ( = ?auto_175277 ?auto_175281 ) ) ( not ( = ?auto_175277 ?auto_175282 ) ) ( not ( = ?auto_175277 ?auto_175283 ) ) ( not ( = ?auto_175278 ?auto_175279 ) ) ( not ( = ?auto_175278 ?auto_175280 ) ) ( not ( = ?auto_175278 ?auto_175281 ) ) ( not ( = ?auto_175278 ?auto_175282 ) ) ( not ( = ?auto_175278 ?auto_175283 ) ) ( not ( = ?auto_175279 ?auto_175280 ) ) ( not ( = ?auto_175279 ?auto_175281 ) ) ( not ( = ?auto_175279 ?auto_175282 ) ) ( not ( = ?auto_175279 ?auto_175283 ) ) ( not ( = ?auto_175280 ?auto_175281 ) ) ( not ( = ?auto_175280 ?auto_175282 ) ) ( not ( = ?auto_175280 ?auto_175283 ) ) ( not ( = ?auto_175281 ?auto_175282 ) ) ( not ( = ?auto_175281 ?auto_175283 ) ) ( not ( = ?auto_175282 ?auto_175283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175282 ?auto_175283 )
      ( !STACK ?auto_175282 ?auto_175281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175290 - BLOCK
      ?auto_175291 - BLOCK
      ?auto_175292 - BLOCK
      ?auto_175293 - BLOCK
      ?auto_175294 - BLOCK
      ?auto_175295 - BLOCK
    )
    :vars
    (
      ?auto_175296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175294 ) ( ON ?auto_175295 ?auto_175296 ) ( CLEAR ?auto_175295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175290 ) ( ON ?auto_175291 ?auto_175290 ) ( ON ?auto_175292 ?auto_175291 ) ( ON ?auto_175293 ?auto_175292 ) ( ON ?auto_175294 ?auto_175293 ) ( not ( = ?auto_175290 ?auto_175291 ) ) ( not ( = ?auto_175290 ?auto_175292 ) ) ( not ( = ?auto_175290 ?auto_175293 ) ) ( not ( = ?auto_175290 ?auto_175294 ) ) ( not ( = ?auto_175290 ?auto_175295 ) ) ( not ( = ?auto_175290 ?auto_175296 ) ) ( not ( = ?auto_175291 ?auto_175292 ) ) ( not ( = ?auto_175291 ?auto_175293 ) ) ( not ( = ?auto_175291 ?auto_175294 ) ) ( not ( = ?auto_175291 ?auto_175295 ) ) ( not ( = ?auto_175291 ?auto_175296 ) ) ( not ( = ?auto_175292 ?auto_175293 ) ) ( not ( = ?auto_175292 ?auto_175294 ) ) ( not ( = ?auto_175292 ?auto_175295 ) ) ( not ( = ?auto_175292 ?auto_175296 ) ) ( not ( = ?auto_175293 ?auto_175294 ) ) ( not ( = ?auto_175293 ?auto_175295 ) ) ( not ( = ?auto_175293 ?auto_175296 ) ) ( not ( = ?auto_175294 ?auto_175295 ) ) ( not ( = ?auto_175294 ?auto_175296 ) ) ( not ( = ?auto_175295 ?auto_175296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175295 ?auto_175296 )
      ( !STACK ?auto_175295 ?auto_175294 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175303 - BLOCK
      ?auto_175304 - BLOCK
      ?auto_175305 - BLOCK
      ?auto_175306 - BLOCK
      ?auto_175307 - BLOCK
      ?auto_175308 - BLOCK
    )
    :vars
    (
      ?auto_175309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175308 ?auto_175309 ) ( ON-TABLE ?auto_175303 ) ( ON ?auto_175304 ?auto_175303 ) ( ON ?auto_175305 ?auto_175304 ) ( ON ?auto_175306 ?auto_175305 ) ( not ( = ?auto_175303 ?auto_175304 ) ) ( not ( = ?auto_175303 ?auto_175305 ) ) ( not ( = ?auto_175303 ?auto_175306 ) ) ( not ( = ?auto_175303 ?auto_175307 ) ) ( not ( = ?auto_175303 ?auto_175308 ) ) ( not ( = ?auto_175303 ?auto_175309 ) ) ( not ( = ?auto_175304 ?auto_175305 ) ) ( not ( = ?auto_175304 ?auto_175306 ) ) ( not ( = ?auto_175304 ?auto_175307 ) ) ( not ( = ?auto_175304 ?auto_175308 ) ) ( not ( = ?auto_175304 ?auto_175309 ) ) ( not ( = ?auto_175305 ?auto_175306 ) ) ( not ( = ?auto_175305 ?auto_175307 ) ) ( not ( = ?auto_175305 ?auto_175308 ) ) ( not ( = ?auto_175305 ?auto_175309 ) ) ( not ( = ?auto_175306 ?auto_175307 ) ) ( not ( = ?auto_175306 ?auto_175308 ) ) ( not ( = ?auto_175306 ?auto_175309 ) ) ( not ( = ?auto_175307 ?auto_175308 ) ) ( not ( = ?auto_175307 ?auto_175309 ) ) ( not ( = ?auto_175308 ?auto_175309 ) ) ( CLEAR ?auto_175306 ) ( ON ?auto_175307 ?auto_175308 ) ( CLEAR ?auto_175307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175303 ?auto_175304 ?auto_175305 ?auto_175306 ?auto_175307 )
      ( MAKE-6PILE ?auto_175303 ?auto_175304 ?auto_175305 ?auto_175306 ?auto_175307 ?auto_175308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175316 - BLOCK
      ?auto_175317 - BLOCK
      ?auto_175318 - BLOCK
      ?auto_175319 - BLOCK
      ?auto_175320 - BLOCK
      ?auto_175321 - BLOCK
    )
    :vars
    (
      ?auto_175322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175321 ?auto_175322 ) ( ON-TABLE ?auto_175316 ) ( ON ?auto_175317 ?auto_175316 ) ( ON ?auto_175318 ?auto_175317 ) ( ON ?auto_175319 ?auto_175318 ) ( not ( = ?auto_175316 ?auto_175317 ) ) ( not ( = ?auto_175316 ?auto_175318 ) ) ( not ( = ?auto_175316 ?auto_175319 ) ) ( not ( = ?auto_175316 ?auto_175320 ) ) ( not ( = ?auto_175316 ?auto_175321 ) ) ( not ( = ?auto_175316 ?auto_175322 ) ) ( not ( = ?auto_175317 ?auto_175318 ) ) ( not ( = ?auto_175317 ?auto_175319 ) ) ( not ( = ?auto_175317 ?auto_175320 ) ) ( not ( = ?auto_175317 ?auto_175321 ) ) ( not ( = ?auto_175317 ?auto_175322 ) ) ( not ( = ?auto_175318 ?auto_175319 ) ) ( not ( = ?auto_175318 ?auto_175320 ) ) ( not ( = ?auto_175318 ?auto_175321 ) ) ( not ( = ?auto_175318 ?auto_175322 ) ) ( not ( = ?auto_175319 ?auto_175320 ) ) ( not ( = ?auto_175319 ?auto_175321 ) ) ( not ( = ?auto_175319 ?auto_175322 ) ) ( not ( = ?auto_175320 ?auto_175321 ) ) ( not ( = ?auto_175320 ?auto_175322 ) ) ( not ( = ?auto_175321 ?auto_175322 ) ) ( CLEAR ?auto_175319 ) ( ON ?auto_175320 ?auto_175321 ) ( CLEAR ?auto_175320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175316 ?auto_175317 ?auto_175318 ?auto_175319 ?auto_175320 )
      ( MAKE-6PILE ?auto_175316 ?auto_175317 ?auto_175318 ?auto_175319 ?auto_175320 ?auto_175321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175329 - BLOCK
      ?auto_175330 - BLOCK
      ?auto_175331 - BLOCK
      ?auto_175332 - BLOCK
      ?auto_175333 - BLOCK
      ?auto_175334 - BLOCK
    )
    :vars
    (
      ?auto_175335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175334 ?auto_175335 ) ( ON-TABLE ?auto_175329 ) ( ON ?auto_175330 ?auto_175329 ) ( ON ?auto_175331 ?auto_175330 ) ( not ( = ?auto_175329 ?auto_175330 ) ) ( not ( = ?auto_175329 ?auto_175331 ) ) ( not ( = ?auto_175329 ?auto_175332 ) ) ( not ( = ?auto_175329 ?auto_175333 ) ) ( not ( = ?auto_175329 ?auto_175334 ) ) ( not ( = ?auto_175329 ?auto_175335 ) ) ( not ( = ?auto_175330 ?auto_175331 ) ) ( not ( = ?auto_175330 ?auto_175332 ) ) ( not ( = ?auto_175330 ?auto_175333 ) ) ( not ( = ?auto_175330 ?auto_175334 ) ) ( not ( = ?auto_175330 ?auto_175335 ) ) ( not ( = ?auto_175331 ?auto_175332 ) ) ( not ( = ?auto_175331 ?auto_175333 ) ) ( not ( = ?auto_175331 ?auto_175334 ) ) ( not ( = ?auto_175331 ?auto_175335 ) ) ( not ( = ?auto_175332 ?auto_175333 ) ) ( not ( = ?auto_175332 ?auto_175334 ) ) ( not ( = ?auto_175332 ?auto_175335 ) ) ( not ( = ?auto_175333 ?auto_175334 ) ) ( not ( = ?auto_175333 ?auto_175335 ) ) ( not ( = ?auto_175334 ?auto_175335 ) ) ( ON ?auto_175333 ?auto_175334 ) ( CLEAR ?auto_175331 ) ( ON ?auto_175332 ?auto_175333 ) ( CLEAR ?auto_175332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175329 ?auto_175330 ?auto_175331 ?auto_175332 )
      ( MAKE-6PILE ?auto_175329 ?auto_175330 ?auto_175331 ?auto_175332 ?auto_175333 ?auto_175334 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175342 - BLOCK
      ?auto_175343 - BLOCK
      ?auto_175344 - BLOCK
      ?auto_175345 - BLOCK
      ?auto_175346 - BLOCK
      ?auto_175347 - BLOCK
    )
    :vars
    (
      ?auto_175348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175347 ?auto_175348 ) ( ON-TABLE ?auto_175342 ) ( ON ?auto_175343 ?auto_175342 ) ( ON ?auto_175344 ?auto_175343 ) ( not ( = ?auto_175342 ?auto_175343 ) ) ( not ( = ?auto_175342 ?auto_175344 ) ) ( not ( = ?auto_175342 ?auto_175345 ) ) ( not ( = ?auto_175342 ?auto_175346 ) ) ( not ( = ?auto_175342 ?auto_175347 ) ) ( not ( = ?auto_175342 ?auto_175348 ) ) ( not ( = ?auto_175343 ?auto_175344 ) ) ( not ( = ?auto_175343 ?auto_175345 ) ) ( not ( = ?auto_175343 ?auto_175346 ) ) ( not ( = ?auto_175343 ?auto_175347 ) ) ( not ( = ?auto_175343 ?auto_175348 ) ) ( not ( = ?auto_175344 ?auto_175345 ) ) ( not ( = ?auto_175344 ?auto_175346 ) ) ( not ( = ?auto_175344 ?auto_175347 ) ) ( not ( = ?auto_175344 ?auto_175348 ) ) ( not ( = ?auto_175345 ?auto_175346 ) ) ( not ( = ?auto_175345 ?auto_175347 ) ) ( not ( = ?auto_175345 ?auto_175348 ) ) ( not ( = ?auto_175346 ?auto_175347 ) ) ( not ( = ?auto_175346 ?auto_175348 ) ) ( not ( = ?auto_175347 ?auto_175348 ) ) ( ON ?auto_175346 ?auto_175347 ) ( CLEAR ?auto_175344 ) ( ON ?auto_175345 ?auto_175346 ) ( CLEAR ?auto_175345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175342 ?auto_175343 ?auto_175344 ?auto_175345 )
      ( MAKE-6PILE ?auto_175342 ?auto_175343 ?auto_175344 ?auto_175345 ?auto_175346 ?auto_175347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175355 - BLOCK
      ?auto_175356 - BLOCK
      ?auto_175357 - BLOCK
      ?auto_175358 - BLOCK
      ?auto_175359 - BLOCK
      ?auto_175360 - BLOCK
    )
    :vars
    (
      ?auto_175361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175360 ?auto_175361 ) ( ON-TABLE ?auto_175355 ) ( ON ?auto_175356 ?auto_175355 ) ( not ( = ?auto_175355 ?auto_175356 ) ) ( not ( = ?auto_175355 ?auto_175357 ) ) ( not ( = ?auto_175355 ?auto_175358 ) ) ( not ( = ?auto_175355 ?auto_175359 ) ) ( not ( = ?auto_175355 ?auto_175360 ) ) ( not ( = ?auto_175355 ?auto_175361 ) ) ( not ( = ?auto_175356 ?auto_175357 ) ) ( not ( = ?auto_175356 ?auto_175358 ) ) ( not ( = ?auto_175356 ?auto_175359 ) ) ( not ( = ?auto_175356 ?auto_175360 ) ) ( not ( = ?auto_175356 ?auto_175361 ) ) ( not ( = ?auto_175357 ?auto_175358 ) ) ( not ( = ?auto_175357 ?auto_175359 ) ) ( not ( = ?auto_175357 ?auto_175360 ) ) ( not ( = ?auto_175357 ?auto_175361 ) ) ( not ( = ?auto_175358 ?auto_175359 ) ) ( not ( = ?auto_175358 ?auto_175360 ) ) ( not ( = ?auto_175358 ?auto_175361 ) ) ( not ( = ?auto_175359 ?auto_175360 ) ) ( not ( = ?auto_175359 ?auto_175361 ) ) ( not ( = ?auto_175360 ?auto_175361 ) ) ( ON ?auto_175359 ?auto_175360 ) ( ON ?auto_175358 ?auto_175359 ) ( CLEAR ?auto_175356 ) ( ON ?auto_175357 ?auto_175358 ) ( CLEAR ?auto_175357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175355 ?auto_175356 ?auto_175357 )
      ( MAKE-6PILE ?auto_175355 ?auto_175356 ?auto_175357 ?auto_175358 ?auto_175359 ?auto_175360 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175368 - BLOCK
      ?auto_175369 - BLOCK
      ?auto_175370 - BLOCK
      ?auto_175371 - BLOCK
      ?auto_175372 - BLOCK
      ?auto_175373 - BLOCK
    )
    :vars
    (
      ?auto_175374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175373 ?auto_175374 ) ( ON-TABLE ?auto_175368 ) ( ON ?auto_175369 ?auto_175368 ) ( not ( = ?auto_175368 ?auto_175369 ) ) ( not ( = ?auto_175368 ?auto_175370 ) ) ( not ( = ?auto_175368 ?auto_175371 ) ) ( not ( = ?auto_175368 ?auto_175372 ) ) ( not ( = ?auto_175368 ?auto_175373 ) ) ( not ( = ?auto_175368 ?auto_175374 ) ) ( not ( = ?auto_175369 ?auto_175370 ) ) ( not ( = ?auto_175369 ?auto_175371 ) ) ( not ( = ?auto_175369 ?auto_175372 ) ) ( not ( = ?auto_175369 ?auto_175373 ) ) ( not ( = ?auto_175369 ?auto_175374 ) ) ( not ( = ?auto_175370 ?auto_175371 ) ) ( not ( = ?auto_175370 ?auto_175372 ) ) ( not ( = ?auto_175370 ?auto_175373 ) ) ( not ( = ?auto_175370 ?auto_175374 ) ) ( not ( = ?auto_175371 ?auto_175372 ) ) ( not ( = ?auto_175371 ?auto_175373 ) ) ( not ( = ?auto_175371 ?auto_175374 ) ) ( not ( = ?auto_175372 ?auto_175373 ) ) ( not ( = ?auto_175372 ?auto_175374 ) ) ( not ( = ?auto_175373 ?auto_175374 ) ) ( ON ?auto_175372 ?auto_175373 ) ( ON ?auto_175371 ?auto_175372 ) ( CLEAR ?auto_175369 ) ( ON ?auto_175370 ?auto_175371 ) ( CLEAR ?auto_175370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175368 ?auto_175369 ?auto_175370 )
      ( MAKE-6PILE ?auto_175368 ?auto_175369 ?auto_175370 ?auto_175371 ?auto_175372 ?auto_175373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175381 - BLOCK
      ?auto_175382 - BLOCK
      ?auto_175383 - BLOCK
      ?auto_175384 - BLOCK
      ?auto_175385 - BLOCK
      ?auto_175386 - BLOCK
    )
    :vars
    (
      ?auto_175387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175386 ?auto_175387 ) ( ON-TABLE ?auto_175381 ) ( not ( = ?auto_175381 ?auto_175382 ) ) ( not ( = ?auto_175381 ?auto_175383 ) ) ( not ( = ?auto_175381 ?auto_175384 ) ) ( not ( = ?auto_175381 ?auto_175385 ) ) ( not ( = ?auto_175381 ?auto_175386 ) ) ( not ( = ?auto_175381 ?auto_175387 ) ) ( not ( = ?auto_175382 ?auto_175383 ) ) ( not ( = ?auto_175382 ?auto_175384 ) ) ( not ( = ?auto_175382 ?auto_175385 ) ) ( not ( = ?auto_175382 ?auto_175386 ) ) ( not ( = ?auto_175382 ?auto_175387 ) ) ( not ( = ?auto_175383 ?auto_175384 ) ) ( not ( = ?auto_175383 ?auto_175385 ) ) ( not ( = ?auto_175383 ?auto_175386 ) ) ( not ( = ?auto_175383 ?auto_175387 ) ) ( not ( = ?auto_175384 ?auto_175385 ) ) ( not ( = ?auto_175384 ?auto_175386 ) ) ( not ( = ?auto_175384 ?auto_175387 ) ) ( not ( = ?auto_175385 ?auto_175386 ) ) ( not ( = ?auto_175385 ?auto_175387 ) ) ( not ( = ?auto_175386 ?auto_175387 ) ) ( ON ?auto_175385 ?auto_175386 ) ( ON ?auto_175384 ?auto_175385 ) ( ON ?auto_175383 ?auto_175384 ) ( CLEAR ?auto_175381 ) ( ON ?auto_175382 ?auto_175383 ) ( CLEAR ?auto_175382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175381 ?auto_175382 )
      ( MAKE-6PILE ?auto_175381 ?auto_175382 ?auto_175383 ?auto_175384 ?auto_175385 ?auto_175386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175394 - BLOCK
      ?auto_175395 - BLOCK
      ?auto_175396 - BLOCK
      ?auto_175397 - BLOCK
      ?auto_175398 - BLOCK
      ?auto_175399 - BLOCK
    )
    :vars
    (
      ?auto_175400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175399 ?auto_175400 ) ( ON-TABLE ?auto_175394 ) ( not ( = ?auto_175394 ?auto_175395 ) ) ( not ( = ?auto_175394 ?auto_175396 ) ) ( not ( = ?auto_175394 ?auto_175397 ) ) ( not ( = ?auto_175394 ?auto_175398 ) ) ( not ( = ?auto_175394 ?auto_175399 ) ) ( not ( = ?auto_175394 ?auto_175400 ) ) ( not ( = ?auto_175395 ?auto_175396 ) ) ( not ( = ?auto_175395 ?auto_175397 ) ) ( not ( = ?auto_175395 ?auto_175398 ) ) ( not ( = ?auto_175395 ?auto_175399 ) ) ( not ( = ?auto_175395 ?auto_175400 ) ) ( not ( = ?auto_175396 ?auto_175397 ) ) ( not ( = ?auto_175396 ?auto_175398 ) ) ( not ( = ?auto_175396 ?auto_175399 ) ) ( not ( = ?auto_175396 ?auto_175400 ) ) ( not ( = ?auto_175397 ?auto_175398 ) ) ( not ( = ?auto_175397 ?auto_175399 ) ) ( not ( = ?auto_175397 ?auto_175400 ) ) ( not ( = ?auto_175398 ?auto_175399 ) ) ( not ( = ?auto_175398 ?auto_175400 ) ) ( not ( = ?auto_175399 ?auto_175400 ) ) ( ON ?auto_175398 ?auto_175399 ) ( ON ?auto_175397 ?auto_175398 ) ( ON ?auto_175396 ?auto_175397 ) ( CLEAR ?auto_175394 ) ( ON ?auto_175395 ?auto_175396 ) ( CLEAR ?auto_175395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175394 ?auto_175395 )
      ( MAKE-6PILE ?auto_175394 ?auto_175395 ?auto_175396 ?auto_175397 ?auto_175398 ?auto_175399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175407 - BLOCK
      ?auto_175408 - BLOCK
      ?auto_175409 - BLOCK
      ?auto_175410 - BLOCK
      ?auto_175411 - BLOCK
      ?auto_175412 - BLOCK
    )
    :vars
    (
      ?auto_175413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175412 ?auto_175413 ) ( not ( = ?auto_175407 ?auto_175408 ) ) ( not ( = ?auto_175407 ?auto_175409 ) ) ( not ( = ?auto_175407 ?auto_175410 ) ) ( not ( = ?auto_175407 ?auto_175411 ) ) ( not ( = ?auto_175407 ?auto_175412 ) ) ( not ( = ?auto_175407 ?auto_175413 ) ) ( not ( = ?auto_175408 ?auto_175409 ) ) ( not ( = ?auto_175408 ?auto_175410 ) ) ( not ( = ?auto_175408 ?auto_175411 ) ) ( not ( = ?auto_175408 ?auto_175412 ) ) ( not ( = ?auto_175408 ?auto_175413 ) ) ( not ( = ?auto_175409 ?auto_175410 ) ) ( not ( = ?auto_175409 ?auto_175411 ) ) ( not ( = ?auto_175409 ?auto_175412 ) ) ( not ( = ?auto_175409 ?auto_175413 ) ) ( not ( = ?auto_175410 ?auto_175411 ) ) ( not ( = ?auto_175410 ?auto_175412 ) ) ( not ( = ?auto_175410 ?auto_175413 ) ) ( not ( = ?auto_175411 ?auto_175412 ) ) ( not ( = ?auto_175411 ?auto_175413 ) ) ( not ( = ?auto_175412 ?auto_175413 ) ) ( ON ?auto_175411 ?auto_175412 ) ( ON ?auto_175410 ?auto_175411 ) ( ON ?auto_175409 ?auto_175410 ) ( ON ?auto_175408 ?auto_175409 ) ( ON ?auto_175407 ?auto_175408 ) ( CLEAR ?auto_175407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175407 )
      ( MAKE-6PILE ?auto_175407 ?auto_175408 ?auto_175409 ?auto_175410 ?auto_175411 ?auto_175412 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_175420 - BLOCK
      ?auto_175421 - BLOCK
      ?auto_175422 - BLOCK
      ?auto_175423 - BLOCK
      ?auto_175424 - BLOCK
      ?auto_175425 - BLOCK
    )
    :vars
    (
      ?auto_175426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175425 ?auto_175426 ) ( not ( = ?auto_175420 ?auto_175421 ) ) ( not ( = ?auto_175420 ?auto_175422 ) ) ( not ( = ?auto_175420 ?auto_175423 ) ) ( not ( = ?auto_175420 ?auto_175424 ) ) ( not ( = ?auto_175420 ?auto_175425 ) ) ( not ( = ?auto_175420 ?auto_175426 ) ) ( not ( = ?auto_175421 ?auto_175422 ) ) ( not ( = ?auto_175421 ?auto_175423 ) ) ( not ( = ?auto_175421 ?auto_175424 ) ) ( not ( = ?auto_175421 ?auto_175425 ) ) ( not ( = ?auto_175421 ?auto_175426 ) ) ( not ( = ?auto_175422 ?auto_175423 ) ) ( not ( = ?auto_175422 ?auto_175424 ) ) ( not ( = ?auto_175422 ?auto_175425 ) ) ( not ( = ?auto_175422 ?auto_175426 ) ) ( not ( = ?auto_175423 ?auto_175424 ) ) ( not ( = ?auto_175423 ?auto_175425 ) ) ( not ( = ?auto_175423 ?auto_175426 ) ) ( not ( = ?auto_175424 ?auto_175425 ) ) ( not ( = ?auto_175424 ?auto_175426 ) ) ( not ( = ?auto_175425 ?auto_175426 ) ) ( ON ?auto_175424 ?auto_175425 ) ( ON ?auto_175423 ?auto_175424 ) ( ON ?auto_175422 ?auto_175423 ) ( ON ?auto_175421 ?auto_175422 ) ( ON ?auto_175420 ?auto_175421 ) ( CLEAR ?auto_175420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175420 )
      ( MAKE-6PILE ?auto_175420 ?auto_175421 ?auto_175422 ?auto_175423 ?auto_175424 ?auto_175425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175434 - BLOCK
      ?auto_175435 - BLOCK
      ?auto_175436 - BLOCK
      ?auto_175437 - BLOCK
      ?auto_175438 - BLOCK
      ?auto_175439 - BLOCK
      ?auto_175440 - BLOCK
    )
    :vars
    (
      ?auto_175441 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175439 ) ( ON ?auto_175440 ?auto_175441 ) ( CLEAR ?auto_175440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175434 ) ( ON ?auto_175435 ?auto_175434 ) ( ON ?auto_175436 ?auto_175435 ) ( ON ?auto_175437 ?auto_175436 ) ( ON ?auto_175438 ?auto_175437 ) ( ON ?auto_175439 ?auto_175438 ) ( not ( = ?auto_175434 ?auto_175435 ) ) ( not ( = ?auto_175434 ?auto_175436 ) ) ( not ( = ?auto_175434 ?auto_175437 ) ) ( not ( = ?auto_175434 ?auto_175438 ) ) ( not ( = ?auto_175434 ?auto_175439 ) ) ( not ( = ?auto_175434 ?auto_175440 ) ) ( not ( = ?auto_175434 ?auto_175441 ) ) ( not ( = ?auto_175435 ?auto_175436 ) ) ( not ( = ?auto_175435 ?auto_175437 ) ) ( not ( = ?auto_175435 ?auto_175438 ) ) ( not ( = ?auto_175435 ?auto_175439 ) ) ( not ( = ?auto_175435 ?auto_175440 ) ) ( not ( = ?auto_175435 ?auto_175441 ) ) ( not ( = ?auto_175436 ?auto_175437 ) ) ( not ( = ?auto_175436 ?auto_175438 ) ) ( not ( = ?auto_175436 ?auto_175439 ) ) ( not ( = ?auto_175436 ?auto_175440 ) ) ( not ( = ?auto_175436 ?auto_175441 ) ) ( not ( = ?auto_175437 ?auto_175438 ) ) ( not ( = ?auto_175437 ?auto_175439 ) ) ( not ( = ?auto_175437 ?auto_175440 ) ) ( not ( = ?auto_175437 ?auto_175441 ) ) ( not ( = ?auto_175438 ?auto_175439 ) ) ( not ( = ?auto_175438 ?auto_175440 ) ) ( not ( = ?auto_175438 ?auto_175441 ) ) ( not ( = ?auto_175439 ?auto_175440 ) ) ( not ( = ?auto_175439 ?auto_175441 ) ) ( not ( = ?auto_175440 ?auto_175441 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175440 ?auto_175441 )
      ( !STACK ?auto_175440 ?auto_175439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175449 - BLOCK
      ?auto_175450 - BLOCK
      ?auto_175451 - BLOCK
      ?auto_175452 - BLOCK
      ?auto_175453 - BLOCK
      ?auto_175454 - BLOCK
      ?auto_175455 - BLOCK
    )
    :vars
    (
      ?auto_175456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175454 ) ( ON ?auto_175455 ?auto_175456 ) ( CLEAR ?auto_175455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175449 ) ( ON ?auto_175450 ?auto_175449 ) ( ON ?auto_175451 ?auto_175450 ) ( ON ?auto_175452 ?auto_175451 ) ( ON ?auto_175453 ?auto_175452 ) ( ON ?auto_175454 ?auto_175453 ) ( not ( = ?auto_175449 ?auto_175450 ) ) ( not ( = ?auto_175449 ?auto_175451 ) ) ( not ( = ?auto_175449 ?auto_175452 ) ) ( not ( = ?auto_175449 ?auto_175453 ) ) ( not ( = ?auto_175449 ?auto_175454 ) ) ( not ( = ?auto_175449 ?auto_175455 ) ) ( not ( = ?auto_175449 ?auto_175456 ) ) ( not ( = ?auto_175450 ?auto_175451 ) ) ( not ( = ?auto_175450 ?auto_175452 ) ) ( not ( = ?auto_175450 ?auto_175453 ) ) ( not ( = ?auto_175450 ?auto_175454 ) ) ( not ( = ?auto_175450 ?auto_175455 ) ) ( not ( = ?auto_175450 ?auto_175456 ) ) ( not ( = ?auto_175451 ?auto_175452 ) ) ( not ( = ?auto_175451 ?auto_175453 ) ) ( not ( = ?auto_175451 ?auto_175454 ) ) ( not ( = ?auto_175451 ?auto_175455 ) ) ( not ( = ?auto_175451 ?auto_175456 ) ) ( not ( = ?auto_175452 ?auto_175453 ) ) ( not ( = ?auto_175452 ?auto_175454 ) ) ( not ( = ?auto_175452 ?auto_175455 ) ) ( not ( = ?auto_175452 ?auto_175456 ) ) ( not ( = ?auto_175453 ?auto_175454 ) ) ( not ( = ?auto_175453 ?auto_175455 ) ) ( not ( = ?auto_175453 ?auto_175456 ) ) ( not ( = ?auto_175454 ?auto_175455 ) ) ( not ( = ?auto_175454 ?auto_175456 ) ) ( not ( = ?auto_175455 ?auto_175456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175455 ?auto_175456 )
      ( !STACK ?auto_175455 ?auto_175454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175464 - BLOCK
      ?auto_175465 - BLOCK
      ?auto_175466 - BLOCK
      ?auto_175467 - BLOCK
      ?auto_175468 - BLOCK
      ?auto_175469 - BLOCK
      ?auto_175470 - BLOCK
    )
    :vars
    (
      ?auto_175471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175470 ?auto_175471 ) ( ON-TABLE ?auto_175464 ) ( ON ?auto_175465 ?auto_175464 ) ( ON ?auto_175466 ?auto_175465 ) ( ON ?auto_175467 ?auto_175466 ) ( ON ?auto_175468 ?auto_175467 ) ( not ( = ?auto_175464 ?auto_175465 ) ) ( not ( = ?auto_175464 ?auto_175466 ) ) ( not ( = ?auto_175464 ?auto_175467 ) ) ( not ( = ?auto_175464 ?auto_175468 ) ) ( not ( = ?auto_175464 ?auto_175469 ) ) ( not ( = ?auto_175464 ?auto_175470 ) ) ( not ( = ?auto_175464 ?auto_175471 ) ) ( not ( = ?auto_175465 ?auto_175466 ) ) ( not ( = ?auto_175465 ?auto_175467 ) ) ( not ( = ?auto_175465 ?auto_175468 ) ) ( not ( = ?auto_175465 ?auto_175469 ) ) ( not ( = ?auto_175465 ?auto_175470 ) ) ( not ( = ?auto_175465 ?auto_175471 ) ) ( not ( = ?auto_175466 ?auto_175467 ) ) ( not ( = ?auto_175466 ?auto_175468 ) ) ( not ( = ?auto_175466 ?auto_175469 ) ) ( not ( = ?auto_175466 ?auto_175470 ) ) ( not ( = ?auto_175466 ?auto_175471 ) ) ( not ( = ?auto_175467 ?auto_175468 ) ) ( not ( = ?auto_175467 ?auto_175469 ) ) ( not ( = ?auto_175467 ?auto_175470 ) ) ( not ( = ?auto_175467 ?auto_175471 ) ) ( not ( = ?auto_175468 ?auto_175469 ) ) ( not ( = ?auto_175468 ?auto_175470 ) ) ( not ( = ?auto_175468 ?auto_175471 ) ) ( not ( = ?auto_175469 ?auto_175470 ) ) ( not ( = ?auto_175469 ?auto_175471 ) ) ( not ( = ?auto_175470 ?auto_175471 ) ) ( CLEAR ?auto_175468 ) ( ON ?auto_175469 ?auto_175470 ) ( CLEAR ?auto_175469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175464 ?auto_175465 ?auto_175466 ?auto_175467 ?auto_175468 ?auto_175469 )
      ( MAKE-7PILE ?auto_175464 ?auto_175465 ?auto_175466 ?auto_175467 ?auto_175468 ?auto_175469 ?auto_175470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175479 - BLOCK
      ?auto_175480 - BLOCK
      ?auto_175481 - BLOCK
      ?auto_175482 - BLOCK
      ?auto_175483 - BLOCK
      ?auto_175484 - BLOCK
      ?auto_175485 - BLOCK
    )
    :vars
    (
      ?auto_175486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175485 ?auto_175486 ) ( ON-TABLE ?auto_175479 ) ( ON ?auto_175480 ?auto_175479 ) ( ON ?auto_175481 ?auto_175480 ) ( ON ?auto_175482 ?auto_175481 ) ( ON ?auto_175483 ?auto_175482 ) ( not ( = ?auto_175479 ?auto_175480 ) ) ( not ( = ?auto_175479 ?auto_175481 ) ) ( not ( = ?auto_175479 ?auto_175482 ) ) ( not ( = ?auto_175479 ?auto_175483 ) ) ( not ( = ?auto_175479 ?auto_175484 ) ) ( not ( = ?auto_175479 ?auto_175485 ) ) ( not ( = ?auto_175479 ?auto_175486 ) ) ( not ( = ?auto_175480 ?auto_175481 ) ) ( not ( = ?auto_175480 ?auto_175482 ) ) ( not ( = ?auto_175480 ?auto_175483 ) ) ( not ( = ?auto_175480 ?auto_175484 ) ) ( not ( = ?auto_175480 ?auto_175485 ) ) ( not ( = ?auto_175480 ?auto_175486 ) ) ( not ( = ?auto_175481 ?auto_175482 ) ) ( not ( = ?auto_175481 ?auto_175483 ) ) ( not ( = ?auto_175481 ?auto_175484 ) ) ( not ( = ?auto_175481 ?auto_175485 ) ) ( not ( = ?auto_175481 ?auto_175486 ) ) ( not ( = ?auto_175482 ?auto_175483 ) ) ( not ( = ?auto_175482 ?auto_175484 ) ) ( not ( = ?auto_175482 ?auto_175485 ) ) ( not ( = ?auto_175482 ?auto_175486 ) ) ( not ( = ?auto_175483 ?auto_175484 ) ) ( not ( = ?auto_175483 ?auto_175485 ) ) ( not ( = ?auto_175483 ?auto_175486 ) ) ( not ( = ?auto_175484 ?auto_175485 ) ) ( not ( = ?auto_175484 ?auto_175486 ) ) ( not ( = ?auto_175485 ?auto_175486 ) ) ( CLEAR ?auto_175483 ) ( ON ?auto_175484 ?auto_175485 ) ( CLEAR ?auto_175484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175479 ?auto_175480 ?auto_175481 ?auto_175482 ?auto_175483 ?auto_175484 )
      ( MAKE-7PILE ?auto_175479 ?auto_175480 ?auto_175481 ?auto_175482 ?auto_175483 ?auto_175484 ?auto_175485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175494 - BLOCK
      ?auto_175495 - BLOCK
      ?auto_175496 - BLOCK
      ?auto_175497 - BLOCK
      ?auto_175498 - BLOCK
      ?auto_175499 - BLOCK
      ?auto_175500 - BLOCK
    )
    :vars
    (
      ?auto_175501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175500 ?auto_175501 ) ( ON-TABLE ?auto_175494 ) ( ON ?auto_175495 ?auto_175494 ) ( ON ?auto_175496 ?auto_175495 ) ( ON ?auto_175497 ?auto_175496 ) ( not ( = ?auto_175494 ?auto_175495 ) ) ( not ( = ?auto_175494 ?auto_175496 ) ) ( not ( = ?auto_175494 ?auto_175497 ) ) ( not ( = ?auto_175494 ?auto_175498 ) ) ( not ( = ?auto_175494 ?auto_175499 ) ) ( not ( = ?auto_175494 ?auto_175500 ) ) ( not ( = ?auto_175494 ?auto_175501 ) ) ( not ( = ?auto_175495 ?auto_175496 ) ) ( not ( = ?auto_175495 ?auto_175497 ) ) ( not ( = ?auto_175495 ?auto_175498 ) ) ( not ( = ?auto_175495 ?auto_175499 ) ) ( not ( = ?auto_175495 ?auto_175500 ) ) ( not ( = ?auto_175495 ?auto_175501 ) ) ( not ( = ?auto_175496 ?auto_175497 ) ) ( not ( = ?auto_175496 ?auto_175498 ) ) ( not ( = ?auto_175496 ?auto_175499 ) ) ( not ( = ?auto_175496 ?auto_175500 ) ) ( not ( = ?auto_175496 ?auto_175501 ) ) ( not ( = ?auto_175497 ?auto_175498 ) ) ( not ( = ?auto_175497 ?auto_175499 ) ) ( not ( = ?auto_175497 ?auto_175500 ) ) ( not ( = ?auto_175497 ?auto_175501 ) ) ( not ( = ?auto_175498 ?auto_175499 ) ) ( not ( = ?auto_175498 ?auto_175500 ) ) ( not ( = ?auto_175498 ?auto_175501 ) ) ( not ( = ?auto_175499 ?auto_175500 ) ) ( not ( = ?auto_175499 ?auto_175501 ) ) ( not ( = ?auto_175500 ?auto_175501 ) ) ( ON ?auto_175499 ?auto_175500 ) ( CLEAR ?auto_175497 ) ( ON ?auto_175498 ?auto_175499 ) ( CLEAR ?auto_175498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175494 ?auto_175495 ?auto_175496 ?auto_175497 ?auto_175498 )
      ( MAKE-7PILE ?auto_175494 ?auto_175495 ?auto_175496 ?auto_175497 ?auto_175498 ?auto_175499 ?auto_175500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175509 - BLOCK
      ?auto_175510 - BLOCK
      ?auto_175511 - BLOCK
      ?auto_175512 - BLOCK
      ?auto_175513 - BLOCK
      ?auto_175514 - BLOCK
      ?auto_175515 - BLOCK
    )
    :vars
    (
      ?auto_175516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175515 ?auto_175516 ) ( ON-TABLE ?auto_175509 ) ( ON ?auto_175510 ?auto_175509 ) ( ON ?auto_175511 ?auto_175510 ) ( ON ?auto_175512 ?auto_175511 ) ( not ( = ?auto_175509 ?auto_175510 ) ) ( not ( = ?auto_175509 ?auto_175511 ) ) ( not ( = ?auto_175509 ?auto_175512 ) ) ( not ( = ?auto_175509 ?auto_175513 ) ) ( not ( = ?auto_175509 ?auto_175514 ) ) ( not ( = ?auto_175509 ?auto_175515 ) ) ( not ( = ?auto_175509 ?auto_175516 ) ) ( not ( = ?auto_175510 ?auto_175511 ) ) ( not ( = ?auto_175510 ?auto_175512 ) ) ( not ( = ?auto_175510 ?auto_175513 ) ) ( not ( = ?auto_175510 ?auto_175514 ) ) ( not ( = ?auto_175510 ?auto_175515 ) ) ( not ( = ?auto_175510 ?auto_175516 ) ) ( not ( = ?auto_175511 ?auto_175512 ) ) ( not ( = ?auto_175511 ?auto_175513 ) ) ( not ( = ?auto_175511 ?auto_175514 ) ) ( not ( = ?auto_175511 ?auto_175515 ) ) ( not ( = ?auto_175511 ?auto_175516 ) ) ( not ( = ?auto_175512 ?auto_175513 ) ) ( not ( = ?auto_175512 ?auto_175514 ) ) ( not ( = ?auto_175512 ?auto_175515 ) ) ( not ( = ?auto_175512 ?auto_175516 ) ) ( not ( = ?auto_175513 ?auto_175514 ) ) ( not ( = ?auto_175513 ?auto_175515 ) ) ( not ( = ?auto_175513 ?auto_175516 ) ) ( not ( = ?auto_175514 ?auto_175515 ) ) ( not ( = ?auto_175514 ?auto_175516 ) ) ( not ( = ?auto_175515 ?auto_175516 ) ) ( ON ?auto_175514 ?auto_175515 ) ( CLEAR ?auto_175512 ) ( ON ?auto_175513 ?auto_175514 ) ( CLEAR ?auto_175513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175509 ?auto_175510 ?auto_175511 ?auto_175512 ?auto_175513 )
      ( MAKE-7PILE ?auto_175509 ?auto_175510 ?auto_175511 ?auto_175512 ?auto_175513 ?auto_175514 ?auto_175515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175524 - BLOCK
      ?auto_175525 - BLOCK
      ?auto_175526 - BLOCK
      ?auto_175527 - BLOCK
      ?auto_175528 - BLOCK
      ?auto_175529 - BLOCK
      ?auto_175530 - BLOCK
    )
    :vars
    (
      ?auto_175531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175530 ?auto_175531 ) ( ON-TABLE ?auto_175524 ) ( ON ?auto_175525 ?auto_175524 ) ( ON ?auto_175526 ?auto_175525 ) ( not ( = ?auto_175524 ?auto_175525 ) ) ( not ( = ?auto_175524 ?auto_175526 ) ) ( not ( = ?auto_175524 ?auto_175527 ) ) ( not ( = ?auto_175524 ?auto_175528 ) ) ( not ( = ?auto_175524 ?auto_175529 ) ) ( not ( = ?auto_175524 ?auto_175530 ) ) ( not ( = ?auto_175524 ?auto_175531 ) ) ( not ( = ?auto_175525 ?auto_175526 ) ) ( not ( = ?auto_175525 ?auto_175527 ) ) ( not ( = ?auto_175525 ?auto_175528 ) ) ( not ( = ?auto_175525 ?auto_175529 ) ) ( not ( = ?auto_175525 ?auto_175530 ) ) ( not ( = ?auto_175525 ?auto_175531 ) ) ( not ( = ?auto_175526 ?auto_175527 ) ) ( not ( = ?auto_175526 ?auto_175528 ) ) ( not ( = ?auto_175526 ?auto_175529 ) ) ( not ( = ?auto_175526 ?auto_175530 ) ) ( not ( = ?auto_175526 ?auto_175531 ) ) ( not ( = ?auto_175527 ?auto_175528 ) ) ( not ( = ?auto_175527 ?auto_175529 ) ) ( not ( = ?auto_175527 ?auto_175530 ) ) ( not ( = ?auto_175527 ?auto_175531 ) ) ( not ( = ?auto_175528 ?auto_175529 ) ) ( not ( = ?auto_175528 ?auto_175530 ) ) ( not ( = ?auto_175528 ?auto_175531 ) ) ( not ( = ?auto_175529 ?auto_175530 ) ) ( not ( = ?auto_175529 ?auto_175531 ) ) ( not ( = ?auto_175530 ?auto_175531 ) ) ( ON ?auto_175529 ?auto_175530 ) ( ON ?auto_175528 ?auto_175529 ) ( CLEAR ?auto_175526 ) ( ON ?auto_175527 ?auto_175528 ) ( CLEAR ?auto_175527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175524 ?auto_175525 ?auto_175526 ?auto_175527 )
      ( MAKE-7PILE ?auto_175524 ?auto_175525 ?auto_175526 ?auto_175527 ?auto_175528 ?auto_175529 ?auto_175530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175539 - BLOCK
      ?auto_175540 - BLOCK
      ?auto_175541 - BLOCK
      ?auto_175542 - BLOCK
      ?auto_175543 - BLOCK
      ?auto_175544 - BLOCK
      ?auto_175545 - BLOCK
    )
    :vars
    (
      ?auto_175546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175545 ?auto_175546 ) ( ON-TABLE ?auto_175539 ) ( ON ?auto_175540 ?auto_175539 ) ( ON ?auto_175541 ?auto_175540 ) ( not ( = ?auto_175539 ?auto_175540 ) ) ( not ( = ?auto_175539 ?auto_175541 ) ) ( not ( = ?auto_175539 ?auto_175542 ) ) ( not ( = ?auto_175539 ?auto_175543 ) ) ( not ( = ?auto_175539 ?auto_175544 ) ) ( not ( = ?auto_175539 ?auto_175545 ) ) ( not ( = ?auto_175539 ?auto_175546 ) ) ( not ( = ?auto_175540 ?auto_175541 ) ) ( not ( = ?auto_175540 ?auto_175542 ) ) ( not ( = ?auto_175540 ?auto_175543 ) ) ( not ( = ?auto_175540 ?auto_175544 ) ) ( not ( = ?auto_175540 ?auto_175545 ) ) ( not ( = ?auto_175540 ?auto_175546 ) ) ( not ( = ?auto_175541 ?auto_175542 ) ) ( not ( = ?auto_175541 ?auto_175543 ) ) ( not ( = ?auto_175541 ?auto_175544 ) ) ( not ( = ?auto_175541 ?auto_175545 ) ) ( not ( = ?auto_175541 ?auto_175546 ) ) ( not ( = ?auto_175542 ?auto_175543 ) ) ( not ( = ?auto_175542 ?auto_175544 ) ) ( not ( = ?auto_175542 ?auto_175545 ) ) ( not ( = ?auto_175542 ?auto_175546 ) ) ( not ( = ?auto_175543 ?auto_175544 ) ) ( not ( = ?auto_175543 ?auto_175545 ) ) ( not ( = ?auto_175543 ?auto_175546 ) ) ( not ( = ?auto_175544 ?auto_175545 ) ) ( not ( = ?auto_175544 ?auto_175546 ) ) ( not ( = ?auto_175545 ?auto_175546 ) ) ( ON ?auto_175544 ?auto_175545 ) ( ON ?auto_175543 ?auto_175544 ) ( CLEAR ?auto_175541 ) ( ON ?auto_175542 ?auto_175543 ) ( CLEAR ?auto_175542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175539 ?auto_175540 ?auto_175541 ?auto_175542 )
      ( MAKE-7PILE ?auto_175539 ?auto_175540 ?auto_175541 ?auto_175542 ?auto_175543 ?auto_175544 ?auto_175545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175554 - BLOCK
      ?auto_175555 - BLOCK
      ?auto_175556 - BLOCK
      ?auto_175557 - BLOCK
      ?auto_175558 - BLOCK
      ?auto_175559 - BLOCK
      ?auto_175560 - BLOCK
    )
    :vars
    (
      ?auto_175561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175560 ?auto_175561 ) ( ON-TABLE ?auto_175554 ) ( ON ?auto_175555 ?auto_175554 ) ( not ( = ?auto_175554 ?auto_175555 ) ) ( not ( = ?auto_175554 ?auto_175556 ) ) ( not ( = ?auto_175554 ?auto_175557 ) ) ( not ( = ?auto_175554 ?auto_175558 ) ) ( not ( = ?auto_175554 ?auto_175559 ) ) ( not ( = ?auto_175554 ?auto_175560 ) ) ( not ( = ?auto_175554 ?auto_175561 ) ) ( not ( = ?auto_175555 ?auto_175556 ) ) ( not ( = ?auto_175555 ?auto_175557 ) ) ( not ( = ?auto_175555 ?auto_175558 ) ) ( not ( = ?auto_175555 ?auto_175559 ) ) ( not ( = ?auto_175555 ?auto_175560 ) ) ( not ( = ?auto_175555 ?auto_175561 ) ) ( not ( = ?auto_175556 ?auto_175557 ) ) ( not ( = ?auto_175556 ?auto_175558 ) ) ( not ( = ?auto_175556 ?auto_175559 ) ) ( not ( = ?auto_175556 ?auto_175560 ) ) ( not ( = ?auto_175556 ?auto_175561 ) ) ( not ( = ?auto_175557 ?auto_175558 ) ) ( not ( = ?auto_175557 ?auto_175559 ) ) ( not ( = ?auto_175557 ?auto_175560 ) ) ( not ( = ?auto_175557 ?auto_175561 ) ) ( not ( = ?auto_175558 ?auto_175559 ) ) ( not ( = ?auto_175558 ?auto_175560 ) ) ( not ( = ?auto_175558 ?auto_175561 ) ) ( not ( = ?auto_175559 ?auto_175560 ) ) ( not ( = ?auto_175559 ?auto_175561 ) ) ( not ( = ?auto_175560 ?auto_175561 ) ) ( ON ?auto_175559 ?auto_175560 ) ( ON ?auto_175558 ?auto_175559 ) ( ON ?auto_175557 ?auto_175558 ) ( CLEAR ?auto_175555 ) ( ON ?auto_175556 ?auto_175557 ) ( CLEAR ?auto_175556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175554 ?auto_175555 ?auto_175556 )
      ( MAKE-7PILE ?auto_175554 ?auto_175555 ?auto_175556 ?auto_175557 ?auto_175558 ?auto_175559 ?auto_175560 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175569 - BLOCK
      ?auto_175570 - BLOCK
      ?auto_175571 - BLOCK
      ?auto_175572 - BLOCK
      ?auto_175573 - BLOCK
      ?auto_175574 - BLOCK
      ?auto_175575 - BLOCK
    )
    :vars
    (
      ?auto_175576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175575 ?auto_175576 ) ( ON-TABLE ?auto_175569 ) ( ON ?auto_175570 ?auto_175569 ) ( not ( = ?auto_175569 ?auto_175570 ) ) ( not ( = ?auto_175569 ?auto_175571 ) ) ( not ( = ?auto_175569 ?auto_175572 ) ) ( not ( = ?auto_175569 ?auto_175573 ) ) ( not ( = ?auto_175569 ?auto_175574 ) ) ( not ( = ?auto_175569 ?auto_175575 ) ) ( not ( = ?auto_175569 ?auto_175576 ) ) ( not ( = ?auto_175570 ?auto_175571 ) ) ( not ( = ?auto_175570 ?auto_175572 ) ) ( not ( = ?auto_175570 ?auto_175573 ) ) ( not ( = ?auto_175570 ?auto_175574 ) ) ( not ( = ?auto_175570 ?auto_175575 ) ) ( not ( = ?auto_175570 ?auto_175576 ) ) ( not ( = ?auto_175571 ?auto_175572 ) ) ( not ( = ?auto_175571 ?auto_175573 ) ) ( not ( = ?auto_175571 ?auto_175574 ) ) ( not ( = ?auto_175571 ?auto_175575 ) ) ( not ( = ?auto_175571 ?auto_175576 ) ) ( not ( = ?auto_175572 ?auto_175573 ) ) ( not ( = ?auto_175572 ?auto_175574 ) ) ( not ( = ?auto_175572 ?auto_175575 ) ) ( not ( = ?auto_175572 ?auto_175576 ) ) ( not ( = ?auto_175573 ?auto_175574 ) ) ( not ( = ?auto_175573 ?auto_175575 ) ) ( not ( = ?auto_175573 ?auto_175576 ) ) ( not ( = ?auto_175574 ?auto_175575 ) ) ( not ( = ?auto_175574 ?auto_175576 ) ) ( not ( = ?auto_175575 ?auto_175576 ) ) ( ON ?auto_175574 ?auto_175575 ) ( ON ?auto_175573 ?auto_175574 ) ( ON ?auto_175572 ?auto_175573 ) ( CLEAR ?auto_175570 ) ( ON ?auto_175571 ?auto_175572 ) ( CLEAR ?auto_175571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175569 ?auto_175570 ?auto_175571 )
      ( MAKE-7PILE ?auto_175569 ?auto_175570 ?auto_175571 ?auto_175572 ?auto_175573 ?auto_175574 ?auto_175575 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175584 - BLOCK
      ?auto_175585 - BLOCK
      ?auto_175586 - BLOCK
      ?auto_175587 - BLOCK
      ?auto_175588 - BLOCK
      ?auto_175589 - BLOCK
      ?auto_175590 - BLOCK
    )
    :vars
    (
      ?auto_175591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175590 ?auto_175591 ) ( ON-TABLE ?auto_175584 ) ( not ( = ?auto_175584 ?auto_175585 ) ) ( not ( = ?auto_175584 ?auto_175586 ) ) ( not ( = ?auto_175584 ?auto_175587 ) ) ( not ( = ?auto_175584 ?auto_175588 ) ) ( not ( = ?auto_175584 ?auto_175589 ) ) ( not ( = ?auto_175584 ?auto_175590 ) ) ( not ( = ?auto_175584 ?auto_175591 ) ) ( not ( = ?auto_175585 ?auto_175586 ) ) ( not ( = ?auto_175585 ?auto_175587 ) ) ( not ( = ?auto_175585 ?auto_175588 ) ) ( not ( = ?auto_175585 ?auto_175589 ) ) ( not ( = ?auto_175585 ?auto_175590 ) ) ( not ( = ?auto_175585 ?auto_175591 ) ) ( not ( = ?auto_175586 ?auto_175587 ) ) ( not ( = ?auto_175586 ?auto_175588 ) ) ( not ( = ?auto_175586 ?auto_175589 ) ) ( not ( = ?auto_175586 ?auto_175590 ) ) ( not ( = ?auto_175586 ?auto_175591 ) ) ( not ( = ?auto_175587 ?auto_175588 ) ) ( not ( = ?auto_175587 ?auto_175589 ) ) ( not ( = ?auto_175587 ?auto_175590 ) ) ( not ( = ?auto_175587 ?auto_175591 ) ) ( not ( = ?auto_175588 ?auto_175589 ) ) ( not ( = ?auto_175588 ?auto_175590 ) ) ( not ( = ?auto_175588 ?auto_175591 ) ) ( not ( = ?auto_175589 ?auto_175590 ) ) ( not ( = ?auto_175589 ?auto_175591 ) ) ( not ( = ?auto_175590 ?auto_175591 ) ) ( ON ?auto_175589 ?auto_175590 ) ( ON ?auto_175588 ?auto_175589 ) ( ON ?auto_175587 ?auto_175588 ) ( ON ?auto_175586 ?auto_175587 ) ( CLEAR ?auto_175584 ) ( ON ?auto_175585 ?auto_175586 ) ( CLEAR ?auto_175585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175584 ?auto_175585 )
      ( MAKE-7PILE ?auto_175584 ?auto_175585 ?auto_175586 ?auto_175587 ?auto_175588 ?auto_175589 ?auto_175590 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175599 - BLOCK
      ?auto_175600 - BLOCK
      ?auto_175601 - BLOCK
      ?auto_175602 - BLOCK
      ?auto_175603 - BLOCK
      ?auto_175604 - BLOCK
      ?auto_175605 - BLOCK
    )
    :vars
    (
      ?auto_175606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175605 ?auto_175606 ) ( ON-TABLE ?auto_175599 ) ( not ( = ?auto_175599 ?auto_175600 ) ) ( not ( = ?auto_175599 ?auto_175601 ) ) ( not ( = ?auto_175599 ?auto_175602 ) ) ( not ( = ?auto_175599 ?auto_175603 ) ) ( not ( = ?auto_175599 ?auto_175604 ) ) ( not ( = ?auto_175599 ?auto_175605 ) ) ( not ( = ?auto_175599 ?auto_175606 ) ) ( not ( = ?auto_175600 ?auto_175601 ) ) ( not ( = ?auto_175600 ?auto_175602 ) ) ( not ( = ?auto_175600 ?auto_175603 ) ) ( not ( = ?auto_175600 ?auto_175604 ) ) ( not ( = ?auto_175600 ?auto_175605 ) ) ( not ( = ?auto_175600 ?auto_175606 ) ) ( not ( = ?auto_175601 ?auto_175602 ) ) ( not ( = ?auto_175601 ?auto_175603 ) ) ( not ( = ?auto_175601 ?auto_175604 ) ) ( not ( = ?auto_175601 ?auto_175605 ) ) ( not ( = ?auto_175601 ?auto_175606 ) ) ( not ( = ?auto_175602 ?auto_175603 ) ) ( not ( = ?auto_175602 ?auto_175604 ) ) ( not ( = ?auto_175602 ?auto_175605 ) ) ( not ( = ?auto_175602 ?auto_175606 ) ) ( not ( = ?auto_175603 ?auto_175604 ) ) ( not ( = ?auto_175603 ?auto_175605 ) ) ( not ( = ?auto_175603 ?auto_175606 ) ) ( not ( = ?auto_175604 ?auto_175605 ) ) ( not ( = ?auto_175604 ?auto_175606 ) ) ( not ( = ?auto_175605 ?auto_175606 ) ) ( ON ?auto_175604 ?auto_175605 ) ( ON ?auto_175603 ?auto_175604 ) ( ON ?auto_175602 ?auto_175603 ) ( ON ?auto_175601 ?auto_175602 ) ( CLEAR ?auto_175599 ) ( ON ?auto_175600 ?auto_175601 ) ( CLEAR ?auto_175600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175599 ?auto_175600 )
      ( MAKE-7PILE ?auto_175599 ?auto_175600 ?auto_175601 ?auto_175602 ?auto_175603 ?auto_175604 ?auto_175605 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175614 - BLOCK
      ?auto_175615 - BLOCK
      ?auto_175616 - BLOCK
      ?auto_175617 - BLOCK
      ?auto_175618 - BLOCK
      ?auto_175619 - BLOCK
      ?auto_175620 - BLOCK
    )
    :vars
    (
      ?auto_175621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175620 ?auto_175621 ) ( not ( = ?auto_175614 ?auto_175615 ) ) ( not ( = ?auto_175614 ?auto_175616 ) ) ( not ( = ?auto_175614 ?auto_175617 ) ) ( not ( = ?auto_175614 ?auto_175618 ) ) ( not ( = ?auto_175614 ?auto_175619 ) ) ( not ( = ?auto_175614 ?auto_175620 ) ) ( not ( = ?auto_175614 ?auto_175621 ) ) ( not ( = ?auto_175615 ?auto_175616 ) ) ( not ( = ?auto_175615 ?auto_175617 ) ) ( not ( = ?auto_175615 ?auto_175618 ) ) ( not ( = ?auto_175615 ?auto_175619 ) ) ( not ( = ?auto_175615 ?auto_175620 ) ) ( not ( = ?auto_175615 ?auto_175621 ) ) ( not ( = ?auto_175616 ?auto_175617 ) ) ( not ( = ?auto_175616 ?auto_175618 ) ) ( not ( = ?auto_175616 ?auto_175619 ) ) ( not ( = ?auto_175616 ?auto_175620 ) ) ( not ( = ?auto_175616 ?auto_175621 ) ) ( not ( = ?auto_175617 ?auto_175618 ) ) ( not ( = ?auto_175617 ?auto_175619 ) ) ( not ( = ?auto_175617 ?auto_175620 ) ) ( not ( = ?auto_175617 ?auto_175621 ) ) ( not ( = ?auto_175618 ?auto_175619 ) ) ( not ( = ?auto_175618 ?auto_175620 ) ) ( not ( = ?auto_175618 ?auto_175621 ) ) ( not ( = ?auto_175619 ?auto_175620 ) ) ( not ( = ?auto_175619 ?auto_175621 ) ) ( not ( = ?auto_175620 ?auto_175621 ) ) ( ON ?auto_175619 ?auto_175620 ) ( ON ?auto_175618 ?auto_175619 ) ( ON ?auto_175617 ?auto_175618 ) ( ON ?auto_175616 ?auto_175617 ) ( ON ?auto_175615 ?auto_175616 ) ( ON ?auto_175614 ?auto_175615 ) ( CLEAR ?auto_175614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175614 )
      ( MAKE-7PILE ?auto_175614 ?auto_175615 ?auto_175616 ?auto_175617 ?auto_175618 ?auto_175619 ?auto_175620 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_175629 - BLOCK
      ?auto_175630 - BLOCK
      ?auto_175631 - BLOCK
      ?auto_175632 - BLOCK
      ?auto_175633 - BLOCK
      ?auto_175634 - BLOCK
      ?auto_175635 - BLOCK
    )
    :vars
    (
      ?auto_175636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175635 ?auto_175636 ) ( not ( = ?auto_175629 ?auto_175630 ) ) ( not ( = ?auto_175629 ?auto_175631 ) ) ( not ( = ?auto_175629 ?auto_175632 ) ) ( not ( = ?auto_175629 ?auto_175633 ) ) ( not ( = ?auto_175629 ?auto_175634 ) ) ( not ( = ?auto_175629 ?auto_175635 ) ) ( not ( = ?auto_175629 ?auto_175636 ) ) ( not ( = ?auto_175630 ?auto_175631 ) ) ( not ( = ?auto_175630 ?auto_175632 ) ) ( not ( = ?auto_175630 ?auto_175633 ) ) ( not ( = ?auto_175630 ?auto_175634 ) ) ( not ( = ?auto_175630 ?auto_175635 ) ) ( not ( = ?auto_175630 ?auto_175636 ) ) ( not ( = ?auto_175631 ?auto_175632 ) ) ( not ( = ?auto_175631 ?auto_175633 ) ) ( not ( = ?auto_175631 ?auto_175634 ) ) ( not ( = ?auto_175631 ?auto_175635 ) ) ( not ( = ?auto_175631 ?auto_175636 ) ) ( not ( = ?auto_175632 ?auto_175633 ) ) ( not ( = ?auto_175632 ?auto_175634 ) ) ( not ( = ?auto_175632 ?auto_175635 ) ) ( not ( = ?auto_175632 ?auto_175636 ) ) ( not ( = ?auto_175633 ?auto_175634 ) ) ( not ( = ?auto_175633 ?auto_175635 ) ) ( not ( = ?auto_175633 ?auto_175636 ) ) ( not ( = ?auto_175634 ?auto_175635 ) ) ( not ( = ?auto_175634 ?auto_175636 ) ) ( not ( = ?auto_175635 ?auto_175636 ) ) ( ON ?auto_175634 ?auto_175635 ) ( ON ?auto_175633 ?auto_175634 ) ( ON ?auto_175632 ?auto_175633 ) ( ON ?auto_175631 ?auto_175632 ) ( ON ?auto_175630 ?auto_175631 ) ( ON ?auto_175629 ?auto_175630 ) ( CLEAR ?auto_175629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175629 )
      ( MAKE-7PILE ?auto_175629 ?auto_175630 ?auto_175631 ?auto_175632 ?auto_175633 ?auto_175634 ?auto_175635 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175645 - BLOCK
      ?auto_175646 - BLOCK
      ?auto_175647 - BLOCK
      ?auto_175648 - BLOCK
      ?auto_175649 - BLOCK
      ?auto_175650 - BLOCK
      ?auto_175651 - BLOCK
      ?auto_175652 - BLOCK
    )
    :vars
    (
      ?auto_175653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175651 ) ( ON ?auto_175652 ?auto_175653 ) ( CLEAR ?auto_175652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175645 ) ( ON ?auto_175646 ?auto_175645 ) ( ON ?auto_175647 ?auto_175646 ) ( ON ?auto_175648 ?auto_175647 ) ( ON ?auto_175649 ?auto_175648 ) ( ON ?auto_175650 ?auto_175649 ) ( ON ?auto_175651 ?auto_175650 ) ( not ( = ?auto_175645 ?auto_175646 ) ) ( not ( = ?auto_175645 ?auto_175647 ) ) ( not ( = ?auto_175645 ?auto_175648 ) ) ( not ( = ?auto_175645 ?auto_175649 ) ) ( not ( = ?auto_175645 ?auto_175650 ) ) ( not ( = ?auto_175645 ?auto_175651 ) ) ( not ( = ?auto_175645 ?auto_175652 ) ) ( not ( = ?auto_175645 ?auto_175653 ) ) ( not ( = ?auto_175646 ?auto_175647 ) ) ( not ( = ?auto_175646 ?auto_175648 ) ) ( not ( = ?auto_175646 ?auto_175649 ) ) ( not ( = ?auto_175646 ?auto_175650 ) ) ( not ( = ?auto_175646 ?auto_175651 ) ) ( not ( = ?auto_175646 ?auto_175652 ) ) ( not ( = ?auto_175646 ?auto_175653 ) ) ( not ( = ?auto_175647 ?auto_175648 ) ) ( not ( = ?auto_175647 ?auto_175649 ) ) ( not ( = ?auto_175647 ?auto_175650 ) ) ( not ( = ?auto_175647 ?auto_175651 ) ) ( not ( = ?auto_175647 ?auto_175652 ) ) ( not ( = ?auto_175647 ?auto_175653 ) ) ( not ( = ?auto_175648 ?auto_175649 ) ) ( not ( = ?auto_175648 ?auto_175650 ) ) ( not ( = ?auto_175648 ?auto_175651 ) ) ( not ( = ?auto_175648 ?auto_175652 ) ) ( not ( = ?auto_175648 ?auto_175653 ) ) ( not ( = ?auto_175649 ?auto_175650 ) ) ( not ( = ?auto_175649 ?auto_175651 ) ) ( not ( = ?auto_175649 ?auto_175652 ) ) ( not ( = ?auto_175649 ?auto_175653 ) ) ( not ( = ?auto_175650 ?auto_175651 ) ) ( not ( = ?auto_175650 ?auto_175652 ) ) ( not ( = ?auto_175650 ?auto_175653 ) ) ( not ( = ?auto_175651 ?auto_175652 ) ) ( not ( = ?auto_175651 ?auto_175653 ) ) ( not ( = ?auto_175652 ?auto_175653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175652 ?auto_175653 )
      ( !STACK ?auto_175652 ?auto_175651 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175662 - BLOCK
      ?auto_175663 - BLOCK
      ?auto_175664 - BLOCK
      ?auto_175665 - BLOCK
      ?auto_175666 - BLOCK
      ?auto_175667 - BLOCK
      ?auto_175668 - BLOCK
      ?auto_175669 - BLOCK
    )
    :vars
    (
      ?auto_175670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175668 ) ( ON ?auto_175669 ?auto_175670 ) ( CLEAR ?auto_175669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175662 ) ( ON ?auto_175663 ?auto_175662 ) ( ON ?auto_175664 ?auto_175663 ) ( ON ?auto_175665 ?auto_175664 ) ( ON ?auto_175666 ?auto_175665 ) ( ON ?auto_175667 ?auto_175666 ) ( ON ?auto_175668 ?auto_175667 ) ( not ( = ?auto_175662 ?auto_175663 ) ) ( not ( = ?auto_175662 ?auto_175664 ) ) ( not ( = ?auto_175662 ?auto_175665 ) ) ( not ( = ?auto_175662 ?auto_175666 ) ) ( not ( = ?auto_175662 ?auto_175667 ) ) ( not ( = ?auto_175662 ?auto_175668 ) ) ( not ( = ?auto_175662 ?auto_175669 ) ) ( not ( = ?auto_175662 ?auto_175670 ) ) ( not ( = ?auto_175663 ?auto_175664 ) ) ( not ( = ?auto_175663 ?auto_175665 ) ) ( not ( = ?auto_175663 ?auto_175666 ) ) ( not ( = ?auto_175663 ?auto_175667 ) ) ( not ( = ?auto_175663 ?auto_175668 ) ) ( not ( = ?auto_175663 ?auto_175669 ) ) ( not ( = ?auto_175663 ?auto_175670 ) ) ( not ( = ?auto_175664 ?auto_175665 ) ) ( not ( = ?auto_175664 ?auto_175666 ) ) ( not ( = ?auto_175664 ?auto_175667 ) ) ( not ( = ?auto_175664 ?auto_175668 ) ) ( not ( = ?auto_175664 ?auto_175669 ) ) ( not ( = ?auto_175664 ?auto_175670 ) ) ( not ( = ?auto_175665 ?auto_175666 ) ) ( not ( = ?auto_175665 ?auto_175667 ) ) ( not ( = ?auto_175665 ?auto_175668 ) ) ( not ( = ?auto_175665 ?auto_175669 ) ) ( not ( = ?auto_175665 ?auto_175670 ) ) ( not ( = ?auto_175666 ?auto_175667 ) ) ( not ( = ?auto_175666 ?auto_175668 ) ) ( not ( = ?auto_175666 ?auto_175669 ) ) ( not ( = ?auto_175666 ?auto_175670 ) ) ( not ( = ?auto_175667 ?auto_175668 ) ) ( not ( = ?auto_175667 ?auto_175669 ) ) ( not ( = ?auto_175667 ?auto_175670 ) ) ( not ( = ?auto_175668 ?auto_175669 ) ) ( not ( = ?auto_175668 ?auto_175670 ) ) ( not ( = ?auto_175669 ?auto_175670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175669 ?auto_175670 )
      ( !STACK ?auto_175669 ?auto_175668 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175679 - BLOCK
      ?auto_175680 - BLOCK
      ?auto_175681 - BLOCK
      ?auto_175682 - BLOCK
      ?auto_175683 - BLOCK
      ?auto_175684 - BLOCK
      ?auto_175685 - BLOCK
      ?auto_175686 - BLOCK
    )
    :vars
    (
      ?auto_175687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175686 ?auto_175687 ) ( ON-TABLE ?auto_175679 ) ( ON ?auto_175680 ?auto_175679 ) ( ON ?auto_175681 ?auto_175680 ) ( ON ?auto_175682 ?auto_175681 ) ( ON ?auto_175683 ?auto_175682 ) ( ON ?auto_175684 ?auto_175683 ) ( not ( = ?auto_175679 ?auto_175680 ) ) ( not ( = ?auto_175679 ?auto_175681 ) ) ( not ( = ?auto_175679 ?auto_175682 ) ) ( not ( = ?auto_175679 ?auto_175683 ) ) ( not ( = ?auto_175679 ?auto_175684 ) ) ( not ( = ?auto_175679 ?auto_175685 ) ) ( not ( = ?auto_175679 ?auto_175686 ) ) ( not ( = ?auto_175679 ?auto_175687 ) ) ( not ( = ?auto_175680 ?auto_175681 ) ) ( not ( = ?auto_175680 ?auto_175682 ) ) ( not ( = ?auto_175680 ?auto_175683 ) ) ( not ( = ?auto_175680 ?auto_175684 ) ) ( not ( = ?auto_175680 ?auto_175685 ) ) ( not ( = ?auto_175680 ?auto_175686 ) ) ( not ( = ?auto_175680 ?auto_175687 ) ) ( not ( = ?auto_175681 ?auto_175682 ) ) ( not ( = ?auto_175681 ?auto_175683 ) ) ( not ( = ?auto_175681 ?auto_175684 ) ) ( not ( = ?auto_175681 ?auto_175685 ) ) ( not ( = ?auto_175681 ?auto_175686 ) ) ( not ( = ?auto_175681 ?auto_175687 ) ) ( not ( = ?auto_175682 ?auto_175683 ) ) ( not ( = ?auto_175682 ?auto_175684 ) ) ( not ( = ?auto_175682 ?auto_175685 ) ) ( not ( = ?auto_175682 ?auto_175686 ) ) ( not ( = ?auto_175682 ?auto_175687 ) ) ( not ( = ?auto_175683 ?auto_175684 ) ) ( not ( = ?auto_175683 ?auto_175685 ) ) ( not ( = ?auto_175683 ?auto_175686 ) ) ( not ( = ?auto_175683 ?auto_175687 ) ) ( not ( = ?auto_175684 ?auto_175685 ) ) ( not ( = ?auto_175684 ?auto_175686 ) ) ( not ( = ?auto_175684 ?auto_175687 ) ) ( not ( = ?auto_175685 ?auto_175686 ) ) ( not ( = ?auto_175685 ?auto_175687 ) ) ( not ( = ?auto_175686 ?auto_175687 ) ) ( CLEAR ?auto_175684 ) ( ON ?auto_175685 ?auto_175686 ) ( CLEAR ?auto_175685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175679 ?auto_175680 ?auto_175681 ?auto_175682 ?auto_175683 ?auto_175684 ?auto_175685 )
      ( MAKE-8PILE ?auto_175679 ?auto_175680 ?auto_175681 ?auto_175682 ?auto_175683 ?auto_175684 ?auto_175685 ?auto_175686 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175696 - BLOCK
      ?auto_175697 - BLOCK
      ?auto_175698 - BLOCK
      ?auto_175699 - BLOCK
      ?auto_175700 - BLOCK
      ?auto_175701 - BLOCK
      ?auto_175702 - BLOCK
      ?auto_175703 - BLOCK
    )
    :vars
    (
      ?auto_175704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175703 ?auto_175704 ) ( ON-TABLE ?auto_175696 ) ( ON ?auto_175697 ?auto_175696 ) ( ON ?auto_175698 ?auto_175697 ) ( ON ?auto_175699 ?auto_175698 ) ( ON ?auto_175700 ?auto_175699 ) ( ON ?auto_175701 ?auto_175700 ) ( not ( = ?auto_175696 ?auto_175697 ) ) ( not ( = ?auto_175696 ?auto_175698 ) ) ( not ( = ?auto_175696 ?auto_175699 ) ) ( not ( = ?auto_175696 ?auto_175700 ) ) ( not ( = ?auto_175696 ?auto_175701 ) ) ( not ( = ?auto_175696 ?auto_175702 ) ) ( not ( = ?auto_175696 ?auto_175703 ) ) ( not ( = ?auto_175696 ?auto_175704 ) ) ( not ( = ?auto_175697 ?auto_175698 ) ) ( not ( = ?auto_175697 ?auto_175699 ) ) ( not ( = ?auto_175697 ?auto_175700 ) ) ( not ( = ?auto_175697 ?auto_175701 ) ) ( not ( = ?auto_175697 ?auto_175702 ) ) ( not ( = ?auto_175697 ?auto_175703 ) ) ( not ( = ?auto_175697 ?auto_175704 ) ) ( not ( = ?auto_175698 ?auto_175699 ) ) ( not ( = ?auto_175698 ?auto_175700 ) ) ( not ( = ?auto_175698 ?auto_175701 ) ) ( not ( = ?auto_175698 ?auto_175702 ) ) ( not ( = ?auto_175698 ?auto_175703 ) ) ( not ( = ?auto_175698 ?auto_175704 ) ) ( not ( = ?auto_175699 ?auto_175700 ) ) ( not ( = ?auto_175699 ?auto_175701 ) ) ( not ( = ?auto_175699 ?auto_175702 ) ) ( not ( = ?auto_175699 ?auto_175703 ) ) ( not ( = ?auto_175699 ?auto_175704 ) ) ( not ( = ?auto_175700 ?auto_175701 ) ) ( not ( = ?auto_175700 ?auto_175702 ) ) ( not ( = ?auto_175700 ?auto_175703 ) ) ( not ( = ?auto_175700 ?auto_175704 ) ) ( not ( = ?auto_175701 ?auto_175702 ) ) ( not ( = ?auto_175701 ?auto_175703 ) ) ( not ( = ?auto_175701 ?auto_175704 ) ) ( not ( = ?auto_175702 ?auto_175703 ) ) ( not ( = ?auto_175702 ?auto_175704 ) ) ( not ( = ?auto_175703 ?auto_175704 ) ) ( CLEAR ?auto_175701 ) ( ON ?auto_175702 ?auto_175703 ) ( CLEAR ?auto_175702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175696 ?auto_175697 ?auto_175698 ?auto_175699 ?auto_175700 ?auto_175701 ?auto_175702 )
      ( MAKE-8PILE ?auto_175696 ?auto_175697 ?auto_175698 ?auto_175699 ?auto_175700 ?auto_175701 ?auto_175702 ?auto_175703 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175713 - BLOCK
      ?auto_175714 - BLOCK
      ?auto_175715 - BLOCK
      ?auto_175716 - BLOCK
      ?auto_175717 - BLOCK
      ?auto_175718 - BLOCK
      ?auto_175719 - BLOCK
      ?auto_175720 - BLOCK
    )
    :vars
    (
      ?auto_175721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175720 ?auto_175721 ) ( ON-TABLE ?auto_175713 ) ( ON ?auto_175714 ?auto_175713 ) ( ON ?auto_175715 ?auto_175714 ) ( ON ?auto_175716 ?auto_175715 ) ( ON ?auto_175717 ?auto_175716 ) ( not ( = ?auto_175713 ?auto_175714 ) ) ( not ( = ?auto_175713 ?auto_175715 ) ) ( not ( = ?auto_175713 ?auto_175716 ) ) ( not ( = ?auto_175713 ?auto_175717 ) ) ( not ( = ?auto_175713 ?auto_175718 ) ) ( not ( = ?auto_175713 ?auto_175719 ) ) ( not ( = ?auto_175713 ?auto_175720 ) ) ( not ( = ?auto_175713 ?auto_175721 ) ) ( not ( = ?auto_175714 ?auto_175715 ) ) ( not ( = ?auto_175714 ?auto_175716 ) ) ( not ( = ?auto_175714 ?auto_175717 ) ) ( not ( = ?auto_175714 ?auto_175718 ) ) ( not ( = ?auto_175714 ?auto_175719 ) ) ( not ( = ?auto_175714 ?auto_175720 ) ) ( not ( = ?auto_175714 ?auto_175721 ) ) ( not ( = ?auto_175715 ?auto_175716 ) ) ( not ( = ?auto_175715 ?auto_175717 ) ) ( not ( = ?auto_175715 ?auto_175718 ) ) ( not ( = ?auto_175715 ?auto_175719 ) ) ( not ( = ?auto_175715 ?auto_175720 ) ) ( not ( = ?auto_175715 ?auto_175721 ) ) ( not ( = ?auto_175716 ?auto_175717 ) ) ( not ( = ?auto_175716 ?auto_175718 ) ) ( not ( = ?auto_175716 ?auto_175719 ) ) ( not ( = ?auto_175716 ?auto_175720 ) ) ( not ( = ?auto_175716 ?auto_175721 ) ) ( not ( = ?auto_175717 ?auto_175718 ) ) ( not ( = ?auto_175717 ?auto_175719 ) ) ( not ( = ?auto_175717 ?auto_175720 ) ) ( not ( = ?auto_175717 ?auto_175721 ) ) ( not ( = ?auto_175718 ?auto_175719 ) ) ( not ( = ?auto_175718 ?auto_175720 ) ) ( not ( = ?auto_175718 ?auto_175721 ) ) ( not ( = ?auto_175719 ?auto_175720 ) ) ( not ( = ?auto_175719 ?auto_175721 ) ) ( not ( = ?auto_175720 ?auto_175721 ) ) ( ON ?auto_175719 ?auto_175720 ) ( CLEAR ?auto_175717 ) ( ON ?auto_175718 ?auto_175719 ) ( CLEAR ?auto_175718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175713 ?auto_175714 ?auto_175715 ?auto_175716 ?auto_175717 ?auto_175718 )
      ( MAKE-8PILE ?auto_175713 ?auto_175714 ?auto_175715 ?auto_175716 ?auto_175717 ?auto_175718 ?auto_175719 ?auto_175720 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175730 - BLOCK
      ?auto_175731 - BLOCK
      ?auto_175732 - BLOCK
      ?auto_175733 - BLOCK
      ?auto_175734 - BLOCK
      ?auto_175735 - BLOCK
      ?auto_175736 - BLOCK
      ?auto_175737 - BLOCK
    )
    :vars
    (
      ?auto_175738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175737 ?auto_175738 ) ( ON-TABLE ?auto_175730 ) ( ON ?auto_175731 ?auto_175730 ) ( ON ?auto_175732 ?auto_175731 ) ( ON ?auto_175733 ?auto_175732 ) ( ON ?auto_175734 ?auto_175733 ) ( not ( = ?auto_175730 ?auto_175731 ) ) ( not ( = ?auto_175730 ?auto_175732 ) ) ( not ( = ?auto_175730 ?auto_175733 ) ) ( not ( = ?auto_175730 ?auto_175734 ) ) ( not ( = ?auto_175730 ?auto_175735 ) ) ( not ( = ?auto_175730 ?auto_175736 ) ) ( not ( = ?auto_175730 ?auto_175737 ) ) ( not ( = ?auto_175730 ?auto_175738 ) ) ( not ( = ?auto_175731 ?auto_175732 ) ) ( not ( = ?auto_175731 ?auto_175733 ) ) ( not ( = ?auto_175731 ?auto_175734 ) ) ( not ( = ?auto_175731 ?auto_175735 ) ) ( not ( = ?auto_175731 ?auto_175736 ) ) ( not ( = ?auto_175731 ?auto_175737 ) ) ( not ( = ?auto_175731 ?auto_175738 ) ) ( not ( = ?auto_175732 ?auto_175733 ) ) ( not ( = ?auto_175732 ?auto_175734 ) ) ( not ( = ?auto_175732 ?auto_175735 ) ) ( not ( = ?auto_175732 ?auto_175736 ) ) ( not ( = ?auto_175732 ?auto_175737 ) ) ( not ( = ?auto_175732 ?auto_175738 ) ) ( not ( = ?auto_175733 ?auto_175734 ) ) ( not ( = ?auto_175733 ?auto_175735 ) ) ( not ( = ?auto_175733 ?auto_175736 ) ) ( not ( = ?auto_175733 ?auto_175737 ) ) ( not ( = ?auto_175733 ?auto_175738 ) ) ( not ( = ?auto_175734 ?auto_175735 ) ) ( not ( = ?auto_175734 ?auto_175736 ) ) ( not ( = ?auto_175734 ?auto_175737 ) ) ( not ( = ?auto_175734 ?auto_175738 ) ) ( not ( = ?auto_175735 ?auto_175736 ) ) ( not ( = ?auto_175735 ?auto_175737 ) ) ( not ( = ?auto_175735 ?auto_175738 ) ) ( not ( = ?auto_175736 ?auto_175737 ) ) ( not ( = ?auto_175736 ?auto_175738 ) ) ( not ( = ?auto_175737 ?auto_175738 ) ) ( ON ?auto_175736 ?auto_175737 ) ( CLEAR ?auto_175734 ) ( ON ?auto_175735 ?auto_175736 ) ( CLEAR ?auto_175735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175730 ?auto_175731 ?auto_175732 ?auto_175733 ?auto_175734 ?auto_175735 )
      ( MAKE-8PILE ?auto_175730 ?auto_175731 ?auto_175732 ?auto_175733 ?auto_175734 ?auto_175735 ?auto_175736 ?auto_175737 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175747 - BLOCK
      ?auto_175748 - BLOCK
      ?auto_175749 - BLOCK
      ?auto_175750 - BLOCK
      ?auto_175751 - BLOCK
      ?auto_175752 - BLOCK
      ?auto_175753 - BLOCK
      ?auto_175754 - BLOCK
    )
    :vars
    (
      ?auto_175755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175754 ?auto_175755 ) ( ON-TABLE ?auto_175747 ) ( ON ?auto_175748 ?auto_175747 ) ( ON ?auto_175749 ?auto_175748 ) ( ON ?auto_175750 ?auto_175749 ) ( not ( = ?auto_175747 ?auto_175748 ) ) ( not ( = ?auto_175747 ?auto_175749 ) ) ( not ( = ?auto_175747 ?auto_175750 ) ) ( not ( = ?auto_175747 ?auto_175751 ) ) ( not ( = ?auto_175747 ?auto_175752 ) ) ( not ( = ?auto_175747 ?auto_175753 ) ) ( not ( = ?auto_175747 ?auto_175754 ) ) ( not ( = ?auto_175747 ?auto_175755 ) ) ( not ( = ?auto_175748 ?auto_175749 ) ) ( not ( = ?auto_175748 ?auto_175750 ) ) ( not ( = ?auto_175748 ?auto_175751 ) ) ( not ( = ?auto_175748 ?auto_175752 ) ) ( not ( = ?auto_175748 ?auto_175753 ) ) ( not ( = ?auto_175748 ?auto_175754 ) ) ( not ( = ?auto_175748 ?auto_175755 ) ) ( not ( = ?auto_175749 ?auto_175750 ) ) ( not ( = ?auto_175749 ?auto_175751 ) ) ( not ( = ?auto_175749 ?auto_175752 ) ) ( not ( = ?auto_175749 ?auto_175753 ) ) ( not ( = ?auto_175749 ?auto_175754 ) ) ( not ( = ?auto_175749 ?auto_175755 ) ) ( not ( = ?auto_175750 ?auto_175751 ) ) ( not ( = ?auto_175750 ?auto_175752 ) ) ( not ( = ?auto_175750 ?auto_175753 ) ) ( not ( = ?auto_175750 ?auto_175754 ) ) ( not ( = ?auto_175750 ?auto_175755 ) ) ( not ( = ?auto_175751 ?auto_175752 ) ) ( not ( = ?auto_175751 ?auto_175753 ) ) ( not ( = ?auto_175751 ?auto_175754 ) ) ( not ( = ?auto_175751 ?auto_175755 ) ) ( not ( = ?auto_175752 ?auto_175753 ) ) ( not ( = ?auto_175752 ?auto_175754 ) ) ( not ( = ?auto_175752 ?auto_175755 ) ) ( not ( = ?auto_175753 ?auto_175754 ) ) ( not ( = ?auto_175753 ?auto_175755 ) ) ( not ( = ?auto_175754 ?auto_175755 ) ) ( ON ?auto_175753 ?auto_175754 ) ( ON ?auto_175752 ?auto_175753 ) ( CLEAR ?auto_175750 ) ( ON ?auto_175751 ?auto_175752 ) ( CLEAR ?auto_175751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175747 ?auto_175748 ?auto_175749 ?auto_175750 ?auto_175751 )
      ( MAKE-8PILE ?auto_175747 ?auto_175748 ?auto_175749 ?auto_175750 ?auto_175751 ?auto_175752 ?auto_175753 ?auto_175754 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175764 - BLOCK
      ?auto_175765 - BLOCK
      ?auto_175766 - BLOCK
      ?auto_175767 - BLOCK
      ?auto_175768 - BLOCK
      ?auto_175769 - BLOCK
      ?auto_175770 - BLOCK
      ?auto_175771 - BLOCK
    )
    :vars
    (
      ?auto_175772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175771 ?auto_175772 ) ( ON-TABLE ?auto_175764 ) ( ON ?auto_175765 ?auto_175764 ) ( ON ?auto_175766 ?auto_175765 ) ( ON ?auto_175767 ?auto_175766 ) ( not ( = ?auto_175764 ?auto_175765 ) ) ( not ( = ?auto_175764 ?auto_175766 ) ) ( not ( = ?auto_175764 ?auto_175767 ) ) ( not ( = ?auto_175764 ?auto_175768 ) ) ( not ( = ?auto_175764 ?auto_175769 ) ) ( not ( = ?auto_175764 ?auto_175770 ) ) ( not ( = ?auto_175764 ?auto_175771 ) ) ( not ( = ?auto_175764 ?auto_175772 ) ) ( not ( = ?auto_175765 ?auto_175766 ) ) ( not ( = ?auto_175765 ?auto_175767 ) ) ( not ( = ?auto_175765 ?auto_175768 ) ) ( not ( = ?auto_175765 ?auto_175769 ) ) ( not ( = ?auto_175765 ?auto_175770 ) ) ( not ( = ?auto_175765 ?auto_175771 ) ) ( not ( = ?auto_175765 ?auto_175772 ) ) ( not ( = ?auto_175766 ?auto_175767 ) ) ( not ( = ?auto_175766 ?auto_175768 ) ) ( not ( = ?auto_175766 ?auto_175769 ) ) ( not ( = ?auto_175766 ?auto_175770 ) ) ( not ( = ?auto_175766 ?auto_175771 ) ) ( not ( = ?auto_175766 ?auto_175772 ) ) ( not ( = ?auto_175767 ?auto_175768 ) ) ( not ( = ?auto_175767 ?auto_175769 ) ) ( not ( = ?auto_175767 ?auto_175770 ) ) ( not ( = ?auto_175767 ?auto_175771 ) ) ( not ( = ?auto_175767 ?auto_175772 ) ) ( not ( = ?auto_175768 ?auto_175769 ) ) ( not ( = ?auto_175768 ?auto_175770 ) ) ( not ( = ?auto_175768 ?auto_175771 ) ) ( not ( = ?auto_175768 ?auto_175772 ) ) ( not ( = ?auto_175769 ?auto_175770 ) ) ( not ( = ?auto_175769 ?auto_175771 ) ) ( not ( = ?auto_175769 ?auto_175772 ) ) ( not ( = ?auto_175770 ?auto_175771 ) ) ( not ( = ?auto_175770 ?auto_175772 ) ) ( not ( = ?auto_175771 ?auto_175772 ) ) ( ON ?auto_175770 ?auto_175771 ) ( ON ?auto_175769 ?auto_175770 ) ( CLEAR ?auto_175767 ) ( ON ?auto_175768 ?auto_175769 ) ( CLEAR ?auto_175768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175764 ?auto_175765 ?auto_175766 ?auto_175767 ?auto_175768 )
      ( MAKE-8PILE ?auto_175764 ?auto_175765 ?auto_175766 ?auto_175767 ?auto_175768 ?auto_175769 ?auto_175770 ?auto_175771 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175781 - BLOCK
      ?auto_175782 - BLOCK
      ?auto_175783 - BLOCK
      ?auto_175784 - BLOCK
      ?auto_175785 - BLOCK
      ?auto_175786 - BLOCK
      ?auto_175787 - BLOCK
      ?auto_175788 - BLOCK
    )
    :vars
    (
      ?auto_175789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175788 ?auto_175789 ) ( ON-TABLE ?auto_175781 ) ( ON ?auto_175782 ?auto_175781 ) ( ON ?auto_175783 ?auto_175782 ) ( not ( = ?auto_175781 ?auto_175782 ) ) ( not ( = ?auto_175781 ?auto_175783 ) ) ( not ( = ?auto_175781 ?auto_175784 ) ) ( not ( = ?auto_175781 ?auto_175785 ) ) ( not ( = ?auto_175781 ?auto_175786 ) ) ( not ( = ?auto_175781 ?auto_175787 ) ) ( not ( = ?auto_175781 ?auto_175788 ) ) ( not ( = ?auto_175781 ?auto_175789 ) ) ( not ( = ?auto_175782 ?auto_175783 ) ) ( not ( = ?auto_175782 ?auto_175784 ) ) ( not ( = ?auto_175782 ?auto_175785 ) ) ( not ( = ?auto_175782 ?auto_175786 ) ) ( not ( = ?auto_175782 ?auto_175787 ) ) ( not ( = ?auto_175782 ?auto_175788 ) ) ( not ( = ?auto_175782 ?auto_175789 ) ) ( not ( = ?auto_175783 ?auto_175784 ) ) ( not ( = ?auto_175783 ?auto_175785 ) ) ( not ( = ?auto_175783 ?auto_175786 ) ) ( not ( = ?auto_175783 ?auto_175787 ) ) ( not ( = ?auto_175783 ?auto_175788 ) ) ( not ( = ?auto_175783 ?auto_175789 ) ) ( not ( = ?auto_175784 ?auto_175785 ) ) ( not ( = ?auto_175784 ?auto_175786 ) ) ( not ( = ?auto_175784 ?auto_175787 ) ) ( not ( = ?auto_175784 ?auto_175788 ) ) ( not ( = ?auto_175784 ?auto_175789 ) ) ( not ( = ?auto_175785 ?auto_175786 ) ) ( not ( = ?auto_175785 ?auto_175787 ) ) ( not ( = ?auto_175785 ?auto_175788 ) ) ( not ( = ?auto_175785 ?auto_175789 ) ) ( not ( = ?auto_175786 ?auto_175787 ) ) ( not ( = ?auto_175786 ?auto_175788 ) ) ( not ( = ?auto_175786 ?auto_175789 ) ) ( not ( = ?auto_175787 ?auto_175788 ) ) ( not ( = ?auto_175787 ?auto_175789 ) ) ( not ( = ?auto_175788 ?auto_175789 ) ) ( ON ?auto_175787 ?auto_175788 ) ( ON ?auto_175786 ?auto_175787 ) ( ON ?auto_175785 ?auto_175786 ) ( CLEAR ?auto_175783 ) ( ON ?auto_175784 ?auto_175785 ) ( CLEAR ?auto_175784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175781 ?auto_175782 ?auto_175783 ?auto_175784 )
      ( MAKE-8PILE ?auto_175781 ?auto_175782 ?auto_175783 ?auto_175784 ?auto_175785 ?auto_175786 ?auto_175787 ?auto_175788 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175798 - BLOCK
      ?auto_175799 - BLOCK
      ?auto_175800 - BLOCK
      ?auto_175801 - BLOCK
      ?auto_175802 - BLOCK
      ?auto_175803 - BLOCK
      ?auto_175804 - BLOCK
      ?auto_175805 - BLOCK
    )
    :vars
    (
      ?auto_175806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175805 ?auto_175806 ) ( ON-TABLE ?auto_175798 ) ( ON ?auto_175799 ?auto_175798 ) ( ON ?auto_175800 ?auto_175799 ) ( not ( = ?auto_175798 ?auto_175799 ) ) ( not ( = ?auto_175798 ?auto_175800 ) ) ( not ( = ?auto_175798 ?auto_175801 ) ) ( not ( = ?auto_175798 ?auto_175802 ) ) ( not ( = ?auto_175798 ?auto_175803 ) ) ( not ( = ?auto_175798 ?auto_175804 ) ) ( not ( = ?auto_175798 ?auto_175805 ) ) ( not ( = ?auto_175798 ?auto_175806 ) ) ( not ( = ?auto_175799 ?auto_175800 ) ) ( not ( = ?auto_175799 ?auto_175801 ) ) ( not ( = ?auto_175799 ?auto_175802 ) ) ( not ( = ?auto_175799 ?auto_175803 ) ) ( not ( = ?auto_175799 ?auto_175804 ) ) ( not ( = ?auto_175799 ?auto_175805 ) ) ( not ( = ?auto_175799 ?auto_175806 ) ) ( not ( = ?auto_175800 ?auto_175801 ) ) ( not ( = ?auto_175800 ?auto_175802 ) ) ( not ( = ?auto_175800 ?auto_175803 ) ) ( not ( = ?auto_175800 ?auto_175804 ) ) ( not ( = ?auto_175800 ?auto_175805 ) ) ( not ( = ?auto_175800 ?auto_175806 ) ) ( not ( = ?auto_175801 ?auto_175802 ) ) ( not ( = ?auto_175801 ?auto_175803 ) ) ( not ( = ?auto_175801 ?auto_175804 ) ) ( not ( = ?auto_175801 ?auto_175805 ) ) ( not ( = ?auto_175801 ?auto_175806 ) ) ( not ( = ?auto_175802 ?auto_175803 ) ) ( not ( = ?auto_175802 ?auto_175804 ) ) ( not ( = ?auto_175802 ?auto_175805 ) ) ( not ( = ?auto_175802 ?auto_175806 ) ) ( not ( = ?auto_175803 ?auto_175804 ) ) ( not ( = ?auto_175803 ?auto_175805 ) ) ( not ( = ?auto_175803 ?auto_175806 ) ) ( not ( = ?auto_175804 ?auto_175805 ) ) ( not ( = ?auto_175804 ?auto_175806 ) ) ( not ( = ?auto_175805 ?auto_175806 ) ) ( ON ?auto_175804 ?auto_175805 ) ( ON ?auto_175803 ?auto_175804 ) ( ON ?auto_175802 ?auto_175803 ) ( CLEAR ?auto_175800 ) ( ON ?auto_175801 ?auto_175802 ) ( CLEAR ?auto_175801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175798 ?auto_175799 ?auto_175800 ?auto_175801 )
      ( MAKE-8PILE ?auto_175798 ?auto_175799 ?auto_175800 ?auto_175801 ?auto_175802 ?auto_175803 ?auto_175804 ?auto_175805 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175815 - BLOCK
      ?auto_175816 - BLOCK
      ?auto_175817 - BLOCK
      ?auto_175818 - BLOCK
      ?auto_175819 - BLOCK
      ?auto_175820 - BLOCK
      ?auto_175821 - BLOCK
      ?auto_175822 - BLOCK
    )
    :vars
    (
      ?auto_175823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175822 ?auto_175823 ) ( ON-TABLE ?auto_175815 ) ( ON ?auto_175816 ?auto_175815 ) ( not ( = ?auto_175815 ?auto_175816 ) ) ( not ( = ?auto_175815 ?auto_175817 ) ) ( not ( = ?auto_175815 ?auto_175818 ) ) ( not ( = ?auto_175815 ?auto_175819 ) ) ( not ( = ?auto_175815 ?auto_175820 ) ) ( not ( = ?auto_175815 ?auto_175821 ) ) ( not ( = ?auto_175815 ?auto_175822 ) ) ( not ( = ?auto_175815 ?auto_175823 ) ) ( not ( = ?auto_175816 ?auto_175817 ) ) ( not ( = ?auto_175816 ?auto_175818 ) ) ( not ( = ?auto_175816 ?auto_175819 ) ) ( not ( = ?auto_175816 ?auto_175820 ) ) ( not ( = ?auto_175816 ?auto_175821 ) ) ( not ( = ?auto_175816 ?auto_175822 ) ) ( not ( = ?auto_175816 ?auto_175823 ) ) ( not ( = ?auto_175817 ?auto_175818 ) ) ( not ( = ?auto_175817 ?auto_175819 ) ) ( not ( = ?auto_175817 ?auto_175820 ) ) ( not ( = ?auto_175817 ?auto_175821 ) ) ( not ( = ?auto_175817 ?auto_175822 ) ) ( not ( = ?auto_175817 ?auto_175823 ) ) ( not ( = ?auto_175818 ?auto_175819 ) ) ( not ( = ?auto_175818 ?auto_175820 ) ) ( not ( = ?auto_175818 ?auto_175821 ) ) ( not ( = ?auto_175818 ?auto_175822 ) ) ( not ( = ?auto_175818 ?auto_175823 ) ) ( not ( = ?auto_175819 ?auto_175820 ) ) ( not ( = ?auto_175819 ?auto_175821 ) ) ( not ( = ?auto_175819 ?auto_175822 ) ) ( not ( = ?auto_175819 ?auto_175823 ) ) ( not ( = ?auto_175820 ?auto_175821 ) ) ( not ( = ?auto_175820 ?auto_175822 ) ) ( not ( = ?auto_175820 ?auto_175823 ) ) ( not ( = ?auto_175821 ?auto_175822 ) ) ( not ( = ?auto_175821 ?auto_175823 ) ) ( not ( = ?auto_175822 ?auto_175823 ) ) ( ON ?auto_175821 ?auto_175822 ) ( ON ?auto_175820 ?auto_175821 ) ( ON ?auto_175819 ?auto_175820 ) ( ON ?auto_175818 ?auto_175819 ) ( CLEAR ?auto_175816 ) ( ON ?auto_175817 ?auto_175818 ) ( CLEAR ?auto_175817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175815 ?auto_175816 ?auto_175817 )
      ( MAKE-8PILE ?auto_175815 ?auto_175816 ?auto_175817 ?auto_175818 ?auto_175819 ?auto_175820 ?auto_175821 ?auto_175822 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175832 - BLOCK
      ?auto_175833 - BLOCK
      ?auto_175834 - BLOCK
      ?auto_175835 - BLOCK
      ?auto_175836 - BLOCK
      ?auto_175837 - BLOCK
      ?auto_175838 - BLOCK
      ?auto_175839 - BLOCK
    )
    :vars
    (
      ?auto_175840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175839 ?auto_175840 ) ( ON-TABLE ?auto_175832 ) ( ON ?auto_175833 ?auto_175832 ) ( not ( = ?auto_175832 ?auto_175833 ) ) ( not ( = ?auto_175832 ?auto_175834 ) ) ( not ( = ?auto_175832 ?auto_175835 ) ) ( not ( = ?auto_175832 ?auto_175836 ) ) ( not ( = ?auto_175832 ?auto_175837 ) ) ( not ( = ?auto_175832 ?auto_175838 ) ) ( not ( = ?auto_175832 ?auto_175839 ) ) ( not ( = ?auto_175832 ?auto_175840 ) ) ( not ( = ?auto_175833 ?auto_175834 ) ) ( not ( = ?auto_175833 ?auto_175835 ) ) ( not ( = ?auto_175833 ?auto_175836 ) ) ( not ( = ?auto_175833 ?auto_175837 ) ) ( not ( = ?auto_175833 ?auto_175838 ) ) ( not ( = ?auto_175833 ?auto_175839 ) ) ( not ( = ?auto_175833 ?auto_175840 ) ) ( not ( = ?auto_175834 ?auto_175835 ) ) ( not ( = ?auto_175834 ?auto_175836 ) ) ( not ( = ?auto_175834 ?auto_175837 ) ) ( not ( = ?auto_175834 ?auto_175838 ) ) ( not ( = ?auto_175834 ?auto_175839 ) ) ( not ( = ?auto_175834 ?auto_175840 ) ) ( not ( = ?auto_175835 ?auto_175836 ) ) ( not ( = ?auto_175835 ?auto_175837 ) ) ( not ( = ?auto_175835 ?auto_175838 ) ) ( not ( = ?auto_175835 ?auto_175839 ) ) ( not ( = ?auto_175835 ?auto_175840 ) ) ( not ( = ?auto_175836 ?auto_175837 ) ) ( not ( = ?auto_175836 ?auto_175838 ) ) ( not ( = ?auto_175836 ?auto_175839 ) ) ( not ( = ?auto_175836 ?auto_175840 ) ) ( not ( = ?auto_175837 ?auto_175838 ) ) ( not ( = ?auto_175837 ?auto_175839 ) ) ( not ( = ?auto_175837 ?auto_175840 ) ) ( not ( = ?auto_175838 ?auto_175839 ) ) ( not ( = ?auto_175838 ?auto_175840 ) ) ( not ( = ?auto_175839 ?auto_175840 ) ) ( ON ?auto_175838 ?auto_175839 ) ( ON ?auto_175837 ?auto_175838 ) ( ON ?auto_175836 ?auto_175837 ) ( ON ?auto_175835 ?auto_175836 ) ( CLEAR ?auto_175833 ) ( ON ?auto_175834 ?auto_175835 ) ( CLEAR ?auto_175834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175832 ?auto_175833 ?auto_175834 )
      ( MAKE-8PILE ?auto_175832 ?auto_175833 ?auto_175834 ?auto_175835 ?auto_175836 ?auto_175837 ?auto_175838 ?auto_175839 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175849 - BLOCK
      ?auto_175850 - BLOCK
      ?auto_175851 - BLOCK
      ?auto_175852 - BLOCK
      ?auto_175853 - BLOCK
      ?auto_175854 - BLOCK
      ?auto_175855 - BLOCK
      ?auto_175856 - BLOCK
    )
    :vars
    (
      ?auto_175857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175856 ?auto_175857 ) ( ON-TABLE ?auto_175849 ) ( not ( = ?auto_175849 ?auto_175850 ) ) ( not ( = ?auto_175849 ?auto_175851 ) ) ( not ( = ?auto_175849 ?auto_175852 ) ) ( not ( = ?auto_175849 ?auto_175853 ) ) ( not ( = ?auto_175849 ?auto_175854 ) ) ( not ( = ?auto_175849 ?auto_175855 ) ) ( not ( = ?auto_175849 ?auto_175856 ) ) ( not ( = ?auto_175849 ?auto_175857 ) ) ( not ( = ?auto_175850 ?auto_175851 ) ) ( not ( = ?auto_175850 ?auto_175852 ) ) ( not ( = ?auto_175850 ?auto_175853 ) ) ( not ( = ?auto_175850 ?auto_175854 ) ) ( not ( = ?auto_175850 ?auto_175855 ) ) ( not ( = ?auto_175850 ?auto_175856 ) ) ( not ( = ?auto_175850 ?auto_175857 ) ) ( not ( = ?auto_175851 ?auto_175852 ) ) ( not ( = ?auto_175851 ?auto_175853 ) ) ( not ( = ?auto_175851 ?auto_175854 ) ) ( not ( = ?auto_175851 ?auto_175855 ) ) ( not ( = ?auto_175851 ?auto_175856 ) ) ( not ( = ?auto_175851 ?auto_175857 ) ) ( not ( = ?auto_175852 ?auto_175853 ) ) ( not ( = ?auto_175852 ?auto_175854 ) ) ( not ( = ?auto_175852 ?auto_175855 ) ) ( not ( = ?auto_175852 ?auto_175856 ) ) ( not ( = ?auto_175852 ?auto_175857 ) ) ( not ( = ?auto_175853 ?auto_175854 ) ) ( not ( = ?auto_175853 ?auto_175855 ) ) ( not ( = ?auto_175853 ?auto_175856 ) ) ( not ( = ?auto_175853 ?auto_175857 ) ) ( not ( = ?auto_175854 ?auto_175855 ) ) ( not ( = ?auto_175854 ?auto_175856 ) ) ( not ( = ?auto_175854 ?auto_175857 ) ) ( not ( = ?auto_175855 ?auto_175856 ) ) ( not ( = ?auto_175855 ?auto_175857 ) ) ( not ( = ?auto_175856 ?auto_175857 ) ) ( ON ?auto_175855 ?auto_175856 ) ( ON ?auto_175854 ?auto_175855 ) ( ON ?auto_175853 ?auto_175854 ) ( ON ?auto_175852 ?auto_175853 ) ( ON ?auto_175851 ?auto_175852 ) ( CLEAR ?auto_175849 ) ( ON ?auto_175850 ?auto_175851 ) ( CLEAR ?auto_175850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175849 ?auto_175850 )
      ( MAKE-8PILE ?auto_175849 ?auto_175850 ?auto_175851 ?auto_175852 ?auto_175853 ?auto_175854 ?auto_175855 ?auto_175856 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175866 - BLOCK
      ?auto_175867 - BLOCK
      ?auto_175868 - BLOCK
      ?auto_175869 - BLOCK
      ?auto_175870 - BLOCK
      ?auto_175871 - BLOCK
      ?auto_175872 - BLOCK
      ?auto_175873 - BLOCK
    )
    :vars
    (
      ?auto_175874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175873 ?auto_175874 ) ( ON-TABLE ?auto_175866 ) ( not ( = ?auto_175866 ?auto_175867 ) ) ( not ( = ?auto_175866 ?auto_175868 ) ) ( not ( = ?auto_175866 ?auto_175869 ) ) ( not ( = ?auto_175866 ?auto_175870 ) ) ( not ( = ?auto_175866 ?auto_175871 ) ) ( not ( = ?auto_175866 ?auto_175872 ) ) ( not ( = ?auto_175866 ?auto_175873 ) ) ( not ( = ?auto_175866 ?auto_175874 ) ) ( not ( = ?auto_175867 ?auto_175868 ) ) ( not ( = ?auto_175867 ?auto_175869 ) ) ( not ( = ?auto_175867 ?auto_175870 ) ) ( not ( = ?auto_175867 ?auto_175871 ) ) ( not ( = ?auto_175867 ?auto_175872 ) ) ( not ( = ?auto_175867 ?auto_175873 ) ) ( not ( = ?auto_175867 ?auto_175874 ) ) ( not ( = ?auto_175868 ?auto_175869 ) ) ( not ( = ?auto_175868 ?auto_175870 ) ) ( not ( = ?auto_175868 ?auto_175871 ) ) ( not ( = ?auto_175868 ?auto_175872 ) ) ( not ( = ?auto_175868 ?auto_175873 ) ) ( not ( = ?auto_175868 ?auto_175874 ) ) ( not ( = ?auto_175869 ?auto_175870 ) ) ( not ( = ?auto_175869 ?auto_175871 ) ) ( not ( = ?auto_175869 ?auto_175872 ) ) ( not ( = ?auto_175869 ?auto_175873 ) ) ( not ( = ?auto_175869 ?auto_175874 ) ) ( not ( = ?auto_175870 ?auto_175871 ) ) ( not ( = ?auto_175870 ?auto_175872 ) ) ( not ( = ?auto_175870 ?auto_175873 ) ) ( not ( = ?auto_175870 ?auto_175874 ) ) ( not ( = ?auto_175871 ?auto_175872 ) ) ( not ( = ?auto_175871 ?auto_175873 ) ) ( not ( = ?auto_175871 ?auto_175874 ) ) ( not ( = ?auto_175872 ?auto_175873 ) ) ( not ( = ?auto_175872 ?auto_175874 ) ) ( not ( = ?auto_175873 ?auto_175874 ) ) ( ON ?auto_175872 ?auto_175873 ) ( ON ?auto_175871 ?auto_175872 ) ( ON ?auto_175870 ?auto_175871 ) ( ON ?auto_175869 ?auto_175870 ) ( ON ?auto_175868 ?auto_175869 ) ( CLEAR ?auto_175866 ) ( ON ?auto_175867 ?auto_175868 ) ( CLEAR ?auto_175867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175866 ?auto_175867 )
      ( MAKE-8PILE ?auto_175866 ?auto_175867 ?auto_175868 ?auto_175869 ?auto_175870 ?auto_175871 ?auto_175872 ?auto_175873 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175883 - BLOCK
      ?auto_175884 - BLOCK
      ?auto_175885 - BLOCK
      ?auto_175886 - BLOCK
      ?auto_175887 - BLOCK
      ?auto_175888 - BLOCK
      ?auto_175889 - BLOCK
      ?auto_175890 - BLOCK
    )
    :vars
    (
      ?auto_175891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175890 ?auto_175891 ) ( not ( = ?auto_175883 ?auto_175884 ) ) ( not ( = ?auto_175883 ?auto_175885 ) ) ( not ( = ?auto_175883 ?auto_175886 ) ) ( not ( = ?auto_175883 ?auto_175887 ) ) ( not ( = ?auto_175883 ?auto_175888 ) ) ( not ( = ?auto_175883 ?auto_175889 ) ) ( not ( = ?auto_175883 ?auto_175890 ) ) ( not ( = ?auto_175883 ?auto_175891 ) ) ( not ( = ?auto_175884 ?auto_175885 ) ) ( not ( = ?auto_175884 ?auto_175886 ) ) ( not ( = ?auto_175884 ?auto_175887 ) ) ( not ( = ?auto_175884 ?auto_175888 ) ) ( not ( = ?auto_175884 ?auto_175889 ) ) ( not ( = ?auto_175884 ?auto_175890 ) ) ( not ( = ?auto_175884 ?auto_175891 ) ) ( not ( = ?auto_175885 ?auto_175886 ) ) ( not ( = ?auto_175885 ?auto_175887 ) ) ( not ( = ?auto_175885 ?auto_175888 ) ) ( not ( = ?auto_175885 ?auto_175889 ) ) ( not ( = ?auto_175885 ?auto_175890 ) ) ( not ( = ?auto_175885 ?auto_175891 ) ) ( not ( = ?auto_175886 ?auto_175887 ) ) ( not ( = ?auto_175886 ?auto_175888 ) ) ( not ( = ?auto_175886 ?auto_175889 ) ) ( not ( = ?auto_175886 ?auto_175890 ) ) ( not ( = ?auto_175886 ?auto_175891 ) ) ( not ( = ?auto_175887 ?auto_175888 ) ) ( not ( = ?auto_175887 ?auto_175889 ) ) ( not ( = ?auto_175887 ?auto_175890 ) ) ( not ( = ?auto_175887 ?auto_175891 ) ) ( not ( = ?auto_175888 ?auto_175889 ) ) ( not ( = ?auto_175888 ?auto_175890 ) ) ( not ( = ?auto_175888 ?auto_175891 ) ) ( not ( = ?auto_175889 ?auto_175890 ) ) ( not ( = ?auto_175889 ?auto_175891 ) ) ( not ( = ?auto_175890 ?auto_175891 ) ) ( ON ?auto_175889 ?auto_175890 ) ( ON ?auto_175888 ?auto_175889 ) ( ON ?auto_175887 ?auto_175888 ) ( ON ?auto_175886 ?auto_175887 ) ( ON ?auto_175885 ?auto_175886 ) ( ON ?auto_175884 ?auto_175885 ) ( ON ?auto_175883 ?auto_175884 ) ( CLEAR ?auto_175883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175883 )
      ( MAKE-8PILE ?auto_175883 ?auto_175884 ?auto_175885 ?auto_175886 ?auto_175887 ?auto_175888 ?auto_175889 ?auto_175890 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175900 - BLOCK
      ?auto_175901 - BLOCK
      ?auto_175902 - BLOCK
      ?auto_175903 - BLOCK
      ?auto_175904 - BLOCK
      ?auto_175905 - BLOCK
      ?auto_175906 - BLOCK
      ?auto_175907 - BLOCK
    )
    :vars
    (
      ?auto_175908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175907 ?auto_175908 ) ( not ( = ?auto_175900 ?auto_175901 ) ) ( not ( = ?auto_175900 ?auto_175902 ) ) ( not ( = ?auto_175900 ?auto_175903 ) ) ( not ( = ?auto_175900 ?auto_175904 ) ) ( not ( = ?auto_175900 ?auto_175905 ) ) ( not ( = ?auto_175900 ?auto_175906 ) ) ( not ( = ?auto_175900 ?auto_175907 ) ) ( not ( = ?auto_175900 ?auto_175908 ) ) ( not ( = ?auto_175901 ?auto_175902 ) ) ( not ( = ?auto_175901 ?auto_175903 ) ) ( not ( = ?auto_175901 ?auto_175904 ) ) ( not ( = ?auto_175901 ?auto_175905 ) ) ( not ( = ?auto_175901 ?auto_175906 ) ) ( not ( = ?auto_175901 ?auto_175907 ) ) ( not ( = ?auto_175901 ?auto_175908 ) ) ( not ( = ?auto_175902 ?auto_175903 ) ) ( not ( = ?auto_175902 ?auto_175904 ) ) ( not ( = ?auto_175902 ?auto_175905 ) ) ( not ( = ?auto_175902 ?auto_175906 ) ) ( not ( = ?auto_175902 ?auto_175907 ) ) ( not ( = ?auto_175902 ?auto_175908 ) ) ( not ( = ?auto_175903 ?auto_175904 ) ) ( not ( = ?auto_175903 ?auto_175905 ) ) ( not ( = ?auto_175903 ?auto_175906 ) ) ( not ( = ?auto_175903 ?auto_175907 ) ) ( not ( = ?auto_175903 ?auto_175908 ) ) ( not ( = ?auto_175904 ?auto_175905 ) ) ( not ( = ?auto_175904 ?auto_175906 ) ) ( not ( = ?auto_175904 ?auto_175907 ) ) ( not ( = ?auto_175904 ?auto_175908 ) ) ( not ( = ?auto_175905 ?auto_175906 ) ) ( not ( = ?auto_175905 ?auto_175907 ) ) ( not ( = ?auto_175905 ?auto_175908 ) ) ( not ( = ?auto_175906 ?auto_175907 ) ) ( not ( = ?auto_175906 ?auto_175908 ) ) ( not ( = ?auto_175907 ?auto_175908 ) ) ( ON ?auto_175906 ?auto_175907 ) ( ON ?auto_175905 ?auto_175906 ) ( ON ?auto_175904 ?auto_175905 ) ( ON ?auto_175903 ?auto_175904 ) ( ON ?auto_175902 ?auto_175903 ) ( ON ?auto_175901 ?auto_175902 ) ( ON ?auto_175900 ?auto_175901 ) ( CLEAR ?auto_175900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175900 )
      ( MAKE-8PILE ?auto_175900 ?auto_175901 ?auto_175902 ?auto_175903 ?auto_175904 ?auto_175905 ?auto_175906 ?auto_175907 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_175918 - BLOCK
      ?auto_175919 - BLOCK
      ?auto_175920 - BLOCK
      ?auto_175921 - BLOCK
      ?auto_175922 - BLOCK
      ?auto_175923 - BLOCK
      ?auto_175924 - BLOCK
      ?auto_175925 - BLOCK
      ?auto_175926 - BLOCK
    )
    :vars
    (
      ?auto_175927 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175925 ) ( ON ?auto_175926 ?auto_175927 ) ( CLEAR ?auto_175926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175918 ) ( ON ?auto_175919 ?auto_175918 ) ( ON ?auto_175920 ?auto_175919 ) ( ON ?auto_175921 ?auto_175920 ) ( ON ?auto_175922 ?auto_175921 ) ( ON ?auto_175923 ?auto_175922 ) ( ON ?auto_175924 ?auto_175923 ) ( ON ?auto_175925 ?auto_175924 ) ( not ( = ?auto_175918 ?auto_175919 ) ) ( not ( = ?auto_175918 ?auto_175920 ) ) ( not ( = ?auto_175918 ?auto_175921 ) ) ( not ( = ?auto_175918 ?auto_175922 ) ) ( not ( = ?auto_175918 ?auto_175923 ) ) ( not ( = ?auto_175918 ?auto_175924 ) ) ( not ( = ?auto_175918 ?auto_175925 ) ) ( not ( = ?auto_175918 ?auto_175926 ) ) ( not ( = ?auto_175918 ?auto_175927 ) ) ( not ( = ?auto_175919 ?auto_175920 ) ) ( not ( = ?auto_175919 ?auto_175921 ) ) ( not ( = ?auto_175919 ?auto_175922 ) ) ( not ( = ?auto_175919 ?auto_175923 ) ) ( not ( = ?auto_175919 ?auto_175924 ) ) ( not ( = ?auto_175919 ?auto_175925 ) ) ( not ( = ?auto_175919 ?auto_175926 ) ) ( not ( = ?auto_175919 ?auto_175927 ) ) ( not ( = ?auto_175920 ?auto_175921 ) ) ( not ( = ?auto_175920 ?auto_175922 ) ) ( not ( = ?auto_175920 ?auto_175923 ) ) ( not ( = ?auto_175920 ?auto_175924 ) ) ( not ( = ?auto_175920 ?auto_175925 ) ) ( not ( = ?auto_175920 ?auto_175926 ) ) ( not ( = ?auto_175920 ?auto_175927 ) ) ( not ( = ?auto_175921 ?auto_175922 ) ) ( not ( = ?auto_175921 ?auto_175923 ) ) ( not ( = ?auto_175921 ?auto_175924 ) ) ( not ( = ?auto_175921 ?auto_175925 ) ) ( not ( = ?auto_175921 ?auto_175926 ) ) ( not ( = ?auto_175921 ?auto_175927 ) ) ( not ( = ?auto_175922 ?auto_175923 ) ) ( not ( = ?auto_175922 ?auto_175924 ) ) ( not ( = ?auto_175922 ?auto_175925 ) ) ( not ( = ?auto_175922 ?auto_175926 ) ) ( not ( = ?auto_175922 ?auto_175927 ) ) ( not ( = ?auto_175923 ?auto_175924 ) ) ( not ( = ?auto_175923 ?auto_175925 ) ) ( not ( = ?auto_175923 ?auto_175926 ) ) ( not ( = ?auto_175923 ?auto_175927 ) ) ( not ( = ?auto_175924 ?auto_175925 ) ) ( not ( = ?auto_175924 ?auto_175926 ) ) ( not ( = ?auto_175924 ?auto_175927 ) ) ( not ( = ?auto_175925 ?auto_175926 ) ) ( not ( = ?auto_175925 ?auto_175927 ) ) ( not ( = ?auto_175926 ?auto_175927 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175926 ?auto_175927 )
      ( !STACK ?auto_175926 ?auto_175925 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_175937 - BLOCK
      ?auto_175938 - BLOCK
      ?auto_175939 - BLOCK
      ?auto_175940 - BLOCK
      ?auto_175941 - BLOCK
      ?auto_175942 - BLOCK
      ?auto_175943 - BLOCK
      ?auto_175944 - BLOCK
      ?auto_175945 - BLOCK
    )
    :vars
    (
      ?auto_175946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_175944 ) ( ON ?auto_175945 ?auto_175946 ) ( CLEAR ?auto_175945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_175937 ) ( ON ?auto_175938 ?auto_175937 ) ( ON ?auto_175939 ?auto_175938 ) ( ON ?auto_175940 ?auto_175939 ) ( ON ?auto_175941 ?auto_175940 ) ( ON ?auto_175942 ?auto_175941 ) ( ON ?auto_175943 ?auto_175942 ) ( ON ?auto_175944 ?auto_175943 ) ( not ( = ?auto_175937 ?auto_175938 ) ) ( not ( = ?auto_175937 ?auto_175939 ) ) ( not ( = ?auto_175937 ?auto_175940 ) ) ( not ( = ?auto_175937 ?auto_175941 ) ) ( not ( = ?auto_175937 ?auto_175942 ) ) ( not ( = ?auto_175937 ?auto_175943 ) ) ( not ( = ?auto_175937 ?auto_175944 ) ) ( not ( = ?auto_175937 ?auto_175945 ) ) ( not ( = ?auto_175937 ?auto_175946 ) ) ( not ( = ?auto_175938 ?auto_175939 ) ) ( not ( = ?auto_175938 ?auto_175940 ) ) ( not ( = ?auto_175938 ?auto_175941 ) ) ( not ( = ?auto_175938 ?auto_175942 ) ) ( not ( = ?auto_175938 ?auto_175943 ) ) ( not ( = ?auto_175938 ?auto_175944 ) ) ( not ( = ?auto_175938 ?auto_175945 ) ) ( not ( = ?auto_175938 ?auto_175946 ) ) ( not ( = ?auto_175939 ?auto_175940 ) ) ( not ( = ?auto_175939 ?auto_175941 ) ) ( not ( = ?auto_175939 ?auto_175942 ) ) ( not ( = ?auto_175939 ?auto_175943 ) ) ( not ( = ?auto_175939 ?auto_175944 ) ) ( not ( = ?auto_175939 ?auto_175945 ) ) ( not ( = ?auto_175939 ?auto_175946 ) ) ( not ( = ?auto_175940 ?auto_175941 ) ) ( not ( = ?auto_175940 ?auto_175942 ) ) ( not ( = ?auto_175940 ?auto_175943 ) ) ( not ( = ?auto_175940 ?auto_175944 ) ) ( not ( = ?auto_175940 ?auto_175945 ) ) ( not ( = ?auto_175940 ?auto_175946 ) ) ( not ( = ?auto_175941 ?auto_175942 ) ) ( not ( = ?auto_175941 ?auto_175943 ) ) ( not ( = ?auto_175941 ?auto_175944 ) ) ( not ( = ?auto_175941 ?auto_175945 ) ) ( not ( = ?auto_175941 ?auto_175946 ) ) ( not ( = ?auto_175942 ?auto_175943 ) ) ( not ( = ?auto_175942 ?auto_175944 ) ) ( not ( = ?auto_175942 ?auto_175945 ) ) ( not ( = ?auto_175942 ?auto_175946 ) ) ( not ( = ?auto_175943 ?auto_175944 ) ) ( not ( = ?auto_175943 ?auto_175945 ) ) ( not ( = ?auto_175943 ?auto_175946 ) ) ( not ( = ?auto_175944 ?auto_175945 ) ) ( not ( = ?auto_175944 ?auto_175946 ) ) ( not ( = ?auto_175945 ?auto_175946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_175945 ?auto_175946 )
      ( !STACK ?auto_175945 ?auto_175944 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_175956 - BLOCK
      ?auto_175957 - BLOCK
      ?auto_175958 - BLOCK
      ?auto_175959 - BLOCK
      ?auto_175960 - BLOCK
      ?auto_175961 - BLOCK
      ?auto_175962 - BLOCK
      ?auto_175963 - BLOCK
      ?auto_175964 - BLOCK
    )
    :vars
    (
      ?auto_175965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175964 ?auto_175965 ) ( ON-TABLE ?auto_175956 ) ( ON ?auto_175957 ?auto_175956 ) ( ON ?auto_175958 ?auto_175957 ) ( ON ?auto_175959 ?auto_175958 ) ( ON ?auto_175960 ?auto_175959 ) ( ON ?auto_175961 ?auto_175960 ) ( ON ?auto_175962 ?auto_175961 ) ( not ( = ?auto_175956 ?auto_175957 ) ) ( not ( = ?auto_175956 ?auto_175958 ) ) ( not ( = ?auto_175956 ?auto_175959 ) ) ( not ( = ?auto_175956 ?auto_175960 ) ) ( not ( = ?auto_175956 ?auto_175961 ) ) ( not ( = ?auto_175956 ?auto_175962 ) ) ( not ( = ?auto_175956 ?auto_175963 ) ) ( not ( = ?auto_175956 ?auto_175964 ) ) ( not ( = ?auto_175956 ?auto_175965 ) ) ( not ( = ?auto_175957 ?auto_175958 ) ) ( not ( = ?auto_175957 ?auto_175959 ) ) ( not ( = ?auto_175957 ?auto_175960 ) ) ( not ( = ?auto_175957 ?auto_175961 ) ) ( not ( = ?auto_175957 ?auto_175962 ) ) ( not ( = ?auto_175957 ?auto_175963 ) ) ( not ( = ?auto_175957 ?auto_175964 ) ) ( not ( = ?auto_175957 ?auto_175965 ) ) ( not ( = ?auto_175958 ?auto_175959 ) ) ( not ( = ?auto_175958 ?auto_175960 ) ) ( not ( = ?auto_175958 ?auto_175961 ) ) ( not ( = ?auto_175958 ?auto_175962 ) ) ( not ( = ?auto_175958 ?auto_175963 ) ) ( not ( = ?auto_175958 ?auto_175964 ) ) ( not ( = ?auto_175958 ?auto_175965 ) ) ( not ( = ?auto_175959 ?auto_175960 ) ) ( not ( = ?auto_175959 ?auto_175961 ) ) ( not ( = ?auto_175959 ?auto_175962 ) ) ( not ( = ?auto_175959 ?auto_175963 ) ) ( not ( = ?auto_175959 ?auto_175964 ) ) ( not ( = ?auto_175959 ?auto_175965 ) ) ( not ( = ?auto_175960 ?auto_175961 ) ) ( not ( = ?auto_175960 ?auto_175962 ) ) ( not ( = ?auto_175960 ?auto_175963 ) ) ( not ( = ?auto_175960 ?auto_175964 ) ) ( not ( = ?auto_175960 ?auto_175965 ) ) ( not ( = ?auto_175961 ?auto_175962 ) ) ( not ( = ?auto_175961 ?auto_175963 ) ) ( not ( = ?auto_175961 ?auto_175964 ) ) ( not ( = ?auto_175961 ?auto_175965 ) ) ( not ( = ?auto_175962 ?auto_175963 ) ) ( not ( = ?auto_175962 ?auto_175964 ) ) ( not ( = ?auto_175962 ?auto_175965 ) ) ( not ( = ?auto_175963 ?auto_175964 ) ) ( not ( = ?auto_175963 ?auto_175965 ) ) ( not ( = ?auto_175964 ?auto_175965 ) ) ( CLEAR ?auto_175962 ) ( ON ?auto_175963 ?auto_175964 ) ( CLEAR ?auto_175963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175956 ?auto_175957 ?auto_175958 ?auto_175959 ?auto_175960 ?auto_175961 ?auto_175962 ?auto_175963 )
      ( MAKE-9PILE ?auto_175956 ?auto_175957 ?auto_175958 ?auto_175959 ?auto_175960 ?auto_175961 ?auto_175962 ?auto_175963 ?auto_175964 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_175975 - BLOCK
      ?auto_175976 - BLOCK
      ?auto_175977 - BLOCK
      ?auto_175978 - BLOCK
      ?auto_175979 - BLOCK
      ?auto_175980 - BLOCK
      ?auto_175981 - BLOCK
      ?auto_175982 - BLOCK
      ?auto_175983 - BLOCK
    )
    :vars
    (
      ?auto_175984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175983 ?auto_175984 ) ( ON-TABLE ?auto_175975 ) ( ON ?auto_175976 ?auto_175975 ) ( ON ?auto_175977 ?auto_175976 ) ( ON ?auto_175978 ?auto_175977 ) ( ON ?auto_175979 ?auto_175978 ) ( ON ?auto_175980 ?auto_175979 ) ( ON ?auto_175981 ?auto_175980 ) ( not ( = ?auto_175975 ?auto_175976 ) ) ( not ( = ?auto_175975 ?auto_175977 ) ) ( not ( = ?auto_175975 ?auto_175978 ) ) ( not ( = ?auto_175975 ?auto_175979 ) ) ( not ( = ?auto_175975 ?auto_175980 ) ) ( not ( = ?auto_175975 ?auto_175981 ) ) ( not ( = ?auto_175975 ?auto_175982 ) ) ( not ( = ?auto_175975 ?auto_175983 ) ) ( not ( = ?auto_175975 ?auto_175984 ) ) ( not ( = ?auto_175976 ?auto_175977 ) ) ( not ( = ?auto_175976 ?auto_175978 ) ) ( not ( = ?auto_175976 ?auto_175979 ) ) ( not ( = ?auto_175976 ?auto_175980 ) ) ( not ( = ?auto_175976 ?auto_175981 ) ) ( not ( = ?auto_175976 ?auto_175982 ) ) ( not ( = ?auto_175976 ?auto_175983 ) ) ( not ( = ?auto_175976 ?auto_175984 ) ) ( not ( = ?auto_175977 ?auto_175978 ) ) ( not ( = ?auto_175977 ?auto_175979 ) ) ( not ( = ?auto_175977 ?auto_175980 ) ) ( not ( = ?auto_175977 ?auto_175981 ) ) ( not ( = ?auto_175977 ?auto_175982 ) ) ( not ( = ?auto_175977 ?auto_175983 ) ) ( not ( = ?auto_175977 ?auto_175984 ) ) ( not ( = ?auto_175978 ?auto_175979 ) ) ( not ( = ?auto_175978 ?auto_175980 ) ) ( not ( = ?auto_175978 ?auto_175981 ) ) ( not ( = ?auto_175978 ?auto_175982 ) ) ( not ( = ?auto_175978 ?auto_175983 ) ) ( not ( = ?auto_175978 ?auto_175984 ) ) ( not ( = ?auto_175979 ?auto_175980 ) ) ( not ( = ?auto_175979 ?auto_175981 ) ) ( not ( = ?auto_175979 ?auto_175982 ) ) ( not ( = ?auto_175979 ?auto_175983 ) ) ( not ( = ?auto_175979 ?auto_175984 ) ) ( not ( = ?auto_175980 ?auto_175981 ) ) ( not ( = ?auto_175980 ?auto_175982 ) ) ( not ( = ?auto_175980 ?auto_175983 ) ) ( not ( = ?auto_175980 ?auto_175984 ) ) ( not ( = ?auto_175981 ?auto_175982 ) ) ( not ( = ?auto_175981 ?auto_175983 ) ) ( not ( = ?auto_175981 ?auto_175984 ) ) ( not ( = ?auto_175982 ?auto_175983 ) ) ( not ( = ?auto_175982 ?auto_175984 ) ) ( not ( = ?auto_175983 ?auto_175984 ) ) ( CLEAR ?auto_175981 ) ( ON ?auto_175982 ?auto_175983 ) ( CLEAR ?auto_175982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175975 ?auto_175976 ?auto_175977 ?auto_175978 ?auto_175979 ?auto_175980 ?auto_175981 ?auto_175982 )
      ( MAKE-9PILE ?auto_175975 ?auto_175976 ?auto_175977 ?auto_175978 ?auto_175979 ?auto_175980 ?auto_175981 ?auto_175982 ?auto_175983 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_175994 - BLOCK
      ?auto_175995 - BLOCK
      ?auto_175996 - BLOCK
      ?auto_175997 - BLOCK
      ?auto_175998 - BLOCK
      ?auto_175999 - BLOCK
      ?auto_176000 - BLOCK
      ?auto_176001 - BLOCK
      ?auto_176002 - BLOCK
    )
    :vars
    (
      ?auto_176003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176002 ?auto_176003 ) ( ON-TABLE ?auto_175994 ) ( ON ?auto_175995 ?auto_175994 ) ( ON ?auto_175996 ?auto_175995 ) ( ON ?auto_175997 ?auto_175996 ) ( ON ?auto_175998 ?auto_175997 ) ( ON ?auto_175999 ?auto_175998 ) ( not ( = ?auto_175994 ?auto_175995 ) ) ( not ( = ?auto_175994 ?auto_175996 ) ) ( not ( = ?auto_175994 ?auto_175997 ) ) ( not ( = ?auto_175994 ?auto_175998 ) ) ( not ( = ?auto_175994 ?auto_175999 ) ) ( not ( = ?auto_175994 ?auto_176000 ) ) ( not ( = ?auto_175994 ?auto_176001 ) ) ( not ( = ?auto_175994 ?auto_176002 ) ) ( not ( = ?auto_175994 ?auto_176003 ) ) ( not ( = ?auto_175995 ?auto_175996 ) ) ( not ( = ?auto_175995 ?auto_175997 ) ) ( not ( = ?auto_175995 ?auto_175998 ) ) ( not ( = ?auto_175995 ?auto_175999 ) ) ( not ( = ?auto_175995 ?auto_176000 ) ) ( not ( = ?auto_175995 ?auto_176001 ) ) ( not ( = ?auto_175995 ?auto_176002 ) ) ( not ( = ?auto_175995 ?auto_176003 ) ) ( not ( = ?auto_175996 ?auto_175997 ) ) ( not ( = ?auto_175996 ?auto_175998 ) ) ( not ( = ?auto_175996 ?auto_175999 ) ) ( not ( = ?auto_175996 ?auto_176000 ) ) ( not ( = ?auto_175996 ?auto_176001 ) ) ( not ( = ?auto_175996 ?auto_176002 ) ) ( not ( = ?auto_175996 ?auto_176003 ) ) ( not ( = ?auto_175997 ?auto_175998 ) ) ( not ( = ?auto_175997 ?auto_175999 ) ) ( not ( = ?auto_175997 ?auto_176000 ) ) ( not ( = ?auto_175997 ?auto_176001 ) ) ( not ( = ?auto_175997 ?auto_176002 ) ) ( not ( = ?auto_175997 ?auto_176003 ) ) ( not ( = ?auto_175998 ?auto_175999 ) ) ( not ( = ?auto_175998 ?auto_176000 ) ) ( not ( = ?auto_175998 ?auto_176001 ) ) ( not ( = ?auto_175998 ?auto_176002 ) ) ( not ( = ?auto_175998 ?auto_176003 ) ) ( not ( = ?auto_175999 ?auto_176000 ) ) ( not ( = ?auto_175999 ?auto_176001 ) ) ( not ( = ?auto_175999 ?auto_176002 ) ) ( not ( = ?auto_175999 ?auto_176003 ) ) ( not ( = ?auto_176000 ?auto_176001 ) ) ( not ( = ?auto_176000 ?auto_176002 ) ) ( not ( = ?auto_176000 ?auto_176003 ) ) ( not ( = ?auto_176001 ?auto_176002 ) ) ( not ( = ?auto_176001 ?auto_176003 ) ) ( not ( = ?auto_176002 ?auto_176003 ) ) ( ON ?auto_176001 ?auto_176002 ) ( CLEAR ?auto_175999 ) ( ON ?auto_176000 ?auto_176001 ) ( CLEAR ?auto_176000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175994 ?auto_175995 ?auto_175996 ?auto_175997 ?auto_175998 ?auto_175999 ?auto_176000 )
      ( MAKE-9PILE ?auto_175994 ?auto_175995 ?auto_175996 ?auto_175997 ?auto_175998 ?auto_175999 ?auto_176000 ?auto_176001 ?auto_176002 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176013 - BLOCK
      ?auto_176014 - BLOCK
      ?auto_176015 - BLOCK
      ?auto_176016 - BLOCK
      ?auto_176017 - BLOCK
      ?auto_176018 - BLOCK
      ?auto_176019 - BLOCK
      ?auto_176020 - BLOCK
      ?auto_176021 - BLOCK
    )
    :vars
    (
      ?auto_176022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176021 ?auto_176022 ) ( ON-TABLE ?auto_176013 ) ( ON ?auto_176014 ?auto_176013 ) ( ON ?auto_176015 ?auto_176014 ) ( ON ?auto_176016 ?auto_176015 ) ( ON ?auto_176017 ?auto_176016 ) ( ON ?auto_176018 ?auto_176017 ) ( not ( = ?auto_176013 ?auto_176014 ) ) ( not ( = ?auto_176013 ?auto_176015 ) ) ( not ( = ?auto_176013 ?auto_176016 ) ) ( not ( = ?auto_176013 ?auto_176017 ) ) ( not ( = ?auto_176013 ?auto_176018 ) ) ( not ( = ?auto_176013 ?auto_176019 ) ) ( not ( = ?auto_176013 ?auto_176020 ) ) ( not ( = ?auto_176013 ?auto_176021 ) ) ( not ( = ?auto_176013 ?auto_176022 ) ) ( not ( = ?auto_176014 ?auto_176015 ) ) ( not ( = ?auto_176014 ?auto_176016 ) ) ( not ( = ?auto_176014 ?auto_176017 ) ) ( not ( = ?auto_176014 ?auto_176018 ) ) ( not ( = ?auto_176014 ?auto_176019 ) ) ( not ( = ?auto_176014 ?auto_176020 ) ) ( not ( = ?auto_176014 ?auto_176021 ) ) ( not ( = ?auto_176014 ?auto_176022 ) ) ( not ( = ?auto_176015 ?auto_176016 ) ) ( not ( = ?auto_176015 ?auto_176017 ) ) ( not ( = ?auto_176015 ?auto_176018 ) ) ( not ( = ?auto_176015 ?auto_176019 ) ) ( not ( = ?auto_176015 ?auto_176020 ) ) ( not ( = ?auto_176015 ?auto_176021 ) ) ( not ( = ?auto_176015 ?auto_176022 ) ) ( not ( = ?auto_176016 ?auto_176017 ) ) ( not ( = ?auto_176016 ?auto_176018 ) ) ( not ( = ?auto_176016 ?auto_176019 ) ) ( not ( = ?auto_176016 ?auto_176020 ) ) ( not ( = ?auto_176016 ?auto_176021 ) ) ( not ( = ?auto_176016 ?auto_176022 ) ) ( not ( = ?auto_176017 ?auto_176018 ) ) ( not ( = ?auto_176017 ?auto_176019 ) ) ( not ( = ?auto_176017 ?auto_176020 ) ) ( not ( = ?auto_176017 ?auto_176021 ) ) ( not ( = ?auto_176017 ?auto_176022 ) ) ( not ( = ?auto_176018 ?auto_176019 ) ) ( not ( = ?auto_176018 ?auto_176020 ) ) ( not ( = ?auto_176018 ?auto_176021 ) ) ( not ( = ?auto_176018 ?auto_176022 ) ) ( not ( = ?auto_176019 ?auto_176020 ) ) ( not ( = ?auto_176019 ?auto_176021 ) ) ( not ( = ?auto_176019 ?auto_176022 ) ) ( not ( = ?auto_176020 ?auto_176021 ) ) ( not ( = ?auto_176020 ?auto_176022 ) ) ( not ( = ?auto_176021 ?auto_176022 ) ) ( ON ?auto_176020 ?auto_176021 ) ( CLEAR ?auto_176018 ) ( ON ?auto_176019 ?auto_176020 ) ( CLEAR ?auto_176019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176013 ?auto_176014 ?auto_176015 ?auto_176016 ?auto_176017 ?auto_176018 ?auto_176019 )
      ( MAKE-9PILE ?auto_176013 ?auto_176014 ?auto_176015 ?auto_176016 ?auto_176017 ?auto_176018 ?auto_176019 ?auto_176020 ?auto_176021 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176032 - BLOCK
      ?auto_176033 - BLOCK
      ?auto_176034 - BLOCK
      ?auto_176035 - BLOCK
      ?auto_176036 - BLOCK
      ?auto_176037 - BLOCK
      ?auto_176038 - BLOCK
      ?auto_176039 - BLOCK
      ?auto_176040 - BLOCK
    )
    :vars
    (
      ?auto_176041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176040 ?auto_176041 ) ( ON-TABLE ?auto_176032 ) ( ON ?auto_176033 ?auto_176032 ) ( ON ?auto_176034 ?auto_176033 ) ( ON ?auto_176035 ?auto_176034 ) ( ON ?auto_176036 ?auto_176035 ) ( not ( = ?auto_176032 ?auto_176033 ) ) ( not ( = ?auto_176032 ?auto_176034 ) ) ( not ( = ?auto_176032 ?auto_176035 ) ) ( not ( = ?auto_176032 ?auto_176036 ) ) ( not ( = ?auto_176032 ?auto_176037 ) ) ( not ( = ?auto_176032 ?auto_176038 ) ) ( not ( = ?auto_176032 ?auto_176039 ) ) ( not ( = ?auto_176032 ?auto_176040 ) ) ( not ( = ?auto_176032 ?auto_176041 ) ) ( not ( = ?auto_176033 ?auto_176034 ) ) ( not ( = ?auto_176033 ?auto_176035 ) ) ( not ( = ?auto_176033 ?auto_176036 ) ) ( not ( = ?auto_176033 ?auto_176037 ) ) ( not ( = ?auto_176033 ?auto_176038 ) ) ( not ( = ?auto_176033 ?auto_176039 ) ) ( not ( = ?auto_176033 ?auto_176040 ) ) ( not ( = ?auto_176033 ?auto_176041 ) ) ( not ( = ?auto_176034 ?auto_176035 ) ) ( not ( = ?auto_176034 ?auto_176036 ) ) ( not ( = ?auto_176034 ?auto_176037 ) ) ( not ( = ?auto_176034 ?auto_176038 ) ) ( not ( = ?auto_176034 ?auto_176039 ) ) ( not ( = ?auto_176034 ?auto_176040 ) ) ( not ( = ?auto_176034 ?auto_176041 ) ) ( not ( = ?auto_176035 ?auto_176036 ) ) ( not ( = ?auto_176035 ?auto_176037 ) ) ( not ( = ?auto_176035 ?auto_176038 ) ) ( not ( = ?auto_176035 ?auto_176039 ) ) ( not ( = ?auto_176035 ?auto_176040 ) ) ( not ( = ?auto_176035 ?auto_176041 ) ) ( not ( = ?auto_176036 ?auto_176037 ) ) ( not ( = ?auto_176036 ?auto_176038 ) ) ( not ( = ?auto_176036 ?auto_176039 ) ) ( not ( = ?auto_176036 ?auto_176040 ) ) ( not ( = ?auto_176036 ?auto_176041 ) ) ( not ( = ?auto_176037 ?auto_176038 ) ) ( not ( = ?auto_176037 ?auto_176039 ) ) ( not ( = ?auto_176037 ?auto_176040 ) ) ( not ( = ?auto_176037 ?auto_176041 ) ) ( not ( = ?auto_176038 ?auto_176039 ) ) ( not ( = ?auto_176038 ?auto_176040 ) ) ( not ( = ?auto_176038 ?auto_176041 ) ) ( not ( = ?auto_176039 ?auto_176040 ) ) ( not ( = ?auto_176039 ?auto_176041 ) ) ( not ( = ?auto_176040 ?auto_176041 ) ) ( ON ?auto_176039 ?auto_176040 ) ( ON ?auto_176038 ?auto_176039 ) ( CLEAR ?auto_176036 ) ( ON ?auto_176037 ?auto_176038 ) ( CLEAR ?auto_176037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176032 ?auto_176033 ?auto_176034 ?auto_176035 ?auto_176036 ?auto_176037 )
      ( MAKE-9PILE ?auto_176032 ?auto_176033 ?auto_176034 ?auto_176035 ?auto_176036 ?auto_176037 ?auto_176038 ?auto_176039 ?auto_176040 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176051 - BLOCK
      ?auto_176052 - BLOCK
      ?auto_176053 - BLOCK
      ?auto_176054 - BLOCK
      ?auto_176055 - BLOCK
      ?auto_176056 - BLOCK
      ?auto_176057 - BLOCK
      ?auto_176058 - BLOCK
      ?auto_176059 - BLOCK
    )
    :vars
    (
      ?auto_176060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176059 ?auto_176060 ) ( ON-TABLE ?auto_176051 ) ( ON ?auto_176052 ?auto_176051 ) ( ON ?auto_176053 ?auto_176052 ) ( ON ?auto_176054 ?auto_176053 ) ( ON ?auto_176055 ?auto_176054 ) ( not ( = ?auto_176051 ?auto_176052 ) ) ( not ( = ?auto_176051 ?auto_176053 ) ) ( not ( = ?auto_176051 ?auto_176054 ) ) ( not ( = ?auto_176051 ?auto_176055 ) ) ( not ( = ?auto_176051 ?auto_176056 ) ) ( not ( = ?auto_176051 ?auto_176057 ) ) ( not ( = ?auto_176051 ?auto_176058 ) ) ( not ( = ?auto_176051 ?auto_176059 ) ) ( not ( = ?auto_176051 ?auto_176060 ) ) ( not ( = ?auto_176052 ?auto_176053 ) ) ( not ( = ?auto_176052 ?auto_176054 ) ) ( not ( = ?auto_176052 ?auto_176055 ) ) ( not ( = ?auto_176052 ?auto_176056 ) ) ( not ( = ?auto_176052 ?auto_176057 ) ) ( not ( = ?auto_176052 ?auto_176058 ) ) ( not ( = ?auto_176052 ?auto_176059 ) ) ( not ( = ?auto_176052 ?auto_176060 ) ) ( not ( = ?auto_176053 ?auto_176054 ) ) ( not ( = ?auto_176053 ?auto_176055 ) ) ( not ( = ?auto_176053 ?auto_176056 ) ) ( not ( = ?auto_176053 ?auto_176057 ) ) ( not ( = ?auto_176053 ?auto_176058 ) ) ( not ( = ?auto_176053 ?auto_176059 ) ) ( not ( = ?auto_176053 ?auto_176060 ) ) ( not ( = ?auto_176054 ?auto_176055 ) ) ( not ( = ?auto_176054 ?auto_176056 ) ) ( not ( = ?auto_176054 ?auto_176057 ) ) ( not ( = ?auto_176054 ?auto_176058 ) ) ( not ( = ?auto_176054 ?auto_176059 ) ) ( not ( = ?auto_176054 ?auto_176060 ) ) ( not ( = ?auto_176055 ?auto_176056 ) ) ( not ( = ?auto_176055 ?auto_176057 ) ) ( not ( = ?auto_176055 ?auto_176058 ) ) ( not ( = ?auto_176055 ?auto_176059 ) ) ( not ( = ?auto_176055 ?auto_176060 ) ) ( not ( = ?auto_176056 ?auto_176057 ) ) ( not ( = ?auto_176056 ?auto_176058 ) ) ( not ( = ?auto_176056 ?auto_176059 ) ) ( not ( = ?auto_176056 ?auto_176060 ) ) ( not ( = ?auto_176057 ?auto_176058 ) ) ( not ( = ?auto_176057 ?auto_176059 ) ) ( not ( = ?auto_176057 ?auto_176060 ) ) ( not ( = ?auto_176058 ?auto_176059 ) ) ( not ( = ?auto_176058 ?auto_176060 ) ) ( not ( = ?auto_176059 ?auto_176060 ) ) ( ON ?auto_176058 ?auto_176059 ) ( ON ?auto_176057 ?auto_176058 ) ( CLEAR ?auto_176055 ) ( ON ?auto_176056 ?auto_176057 ) ( CLEAR ?auto_176056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176051 ?auto_176052 ?auto_176053 ?auto_176054 ?auto_176055 ?auto_176056 )
      ( MAKE-9PILE ?auto_176051 ?auto_176052 ?auto_176053 ?auto_176054 ?auto_176055 ?auto_176056 ?auto_176057 ?auto_176058 ?auto_176059 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176070 - BLOCK
      ?auto_176071 - BLOCK
      ?auto_176072 - BLOCK
      ?auto_176073 - BLOCK
      ?auto_176074 - BLOCK
      ?auto_176075 - BLOCK
      ?auto_176076 - BLOCK
      ?auto_176077 - BLOCK
      ?auto_176078 - BLOCK
    )
    :vars
    (
      ?auto_176079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176078 ?auto_176079 ) ( ON-TABLE ?auto_176070 ) ( ON ?auto_176071 ?auto_176070 ) ( ON ?auto_176072 ?auto_176071 ) ( ON ?auto_176073 ?auto_176072 ) ( not ( = ?auto_176070 ?auto_176071 ) ) ( not ( = ?auto_176070 ?auto_176072 ) ) ( not ( = ?auto_176070 ?auto_176073 ) ) ( not ( = ?auto_176070 ?auto_176074 ) ) ( not ( = ?auto_176070 ?auto_176075 ) ) ( not ( = ?auto_176070 ?auto_176076 ) ) ( not ( = ?auto_176070 ?auto_176077 ) ) ( not ( = ?auto_176070 ?auto_176078 ) ) ( not ( = ?auto_176070 ?auto_176079 ) ) ( not ( = ?auto_176071 ?auto_176072 ) ) ( not ( = ?auto_176071 ?auto_176073 ) ) ( not ( = ?auto_176071 ?auto_176074 ) ) ( not ( = ?auto_176071 ?auto_176075 ) ) ( not ( = ?auto_176071 ?auto_176076 ) ) ( not ( = ?auto_176071 ?auto_176077 ) ) ( not ( = ?auto_176071 ?auto_176078 ) ) ( not ( = ?auto_176071 ?auto_176079 ) ) ( not ( = ?auto_176072 ?auto_176073 ) ) ( not ( = ?auto_176072 ?auto_176074 ) ) ( not ( = ?auto_176072 ?auto_176075 ) ) ( not ( = ?auto_176072 ?auto_176076 ) ) ( not ( = ?auto_176072 ?auto_176077 ) ) ( not ( = ?auto_176072 ?auto_176078 ) ) ( not ( = ?auto_176072 ?auto_176079 ) ) ( not ( = ?auto_176073 ?auto_176074 ) ) ( not ( = ?auto_176073 ?auto_176075 ) ) ( not ( = ?auto_176073 ?auto_176076 ) ) ( not ( = ?auto_176073 ?auto_176077 ) ) ( not ( = ?auto_176073 ?auto_176078 ) ) ( not ( = ?auto_176073 ?auto_176079 ) ) ( not ( = ?auto_176074 ?auto_176075 ) ) ( not ( = ?auto_176074 ?auto_176076 ) ) ( not ( = ?auto_176074 ?auto_176077 ) ) ( not ( = ?auto_176074 ?auto_176078 ) ) ( not ( = ?auto_176074 ?auto_176079 ) ) ( not ( = ?auto_176075 ?auto_176076 ) ) ( not ( = ?auto_176075 ?auto_176077 ) ) ( not ( = ?auto_176075 ?auto_176078 ) ) ( not ( = ?auto_176075 ?auto_176079 ) ) ( not ( = ?auto_176076 ?auto_176077 ) ) ( not ( = ?auto_176076 ?auto_176078 ) ) ( not ( = ?auto_176076 ?auto_176079 ) ) ( not ( = ?auto_176077 ?auto_176078 ) ) ( not ( = ?auto_176077 ?auto_176079 ) ) ( not ( = ?auto_176078 ?auto_176079 ) ) ( ON ?auto_176077 ?auto_176078 ) ( ON ?auto_176076 ?auto_176077 ) ( ON ?auto_176075 ?auto_176076 ) ( CLEAR ?auto_176073 ) ( ON ?auto_176074 ?auto_176075 ) ( CLEAR ?auto_176074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176070 ?auto_176071 ?auto_176072 ?auto_176073 ?auto_176074 )
      ( MAKE-9PILE ?auto_176070 ?auto_176071 ?auto_176072 ?auto_176073 ?auto_176074 ?auto_176075 ?auto_176076 ?auto_176077 ?auto_176078 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176089 - BLOCK
      ?auto_176090 - BLOCK
      ?auto_176091 - BLOCK
      ?auto_176092 - BLOCK
      ?auto_176093 - BLOCK
      ?auto_176094 - BLOCK
      ?auto_176095 - BLOCK
      ?auto_176096 - BLOCK
      ?auto_176097 - BLOCK
    )
    :vars
    (
      ?auto_176098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176097 ?auto_176098 ) ( ON-TABLE ?auto_176089 ) ( ON ?auto_176090 ?auto_176089 ) ( ON ?auto_176091 ?auto_176090 ) ( ON ?auto_176092 ?auto_176091 ) ( not ( = ?auto_176089 ?auto_176090 ) ) ( not ( = ?auto_176089 ?auto_176091 ) ) ( not ( = ?auto_176089 ?auto_176092 ) ) ( not ( = ?auto_176089 ?auto_176093 ) ) ( not ( = ?auto_176089 ?auto_176094 ) ) ( not ( = ?auto_176089 ?auto_176095 ) ) ( not ( = ?auto_176089 ?auto_176096 ) ) ( not ( = ?auto_176089 ?auto_176097 ) ) ( not ( = ?auto_176089 ?auto_176098 ) ) ( not ( = ?auto_176090 ?auto_176091 ) ) ( not ( = ?auto_176090 ?auto_176092 ) ) ( not ( = ?auto_176090 ?auto_176093 ) ) ( not ( = ?auto_176090 ?auto_176094 ) ) ( not ( = ?auto_176090 ?auto_176095 ) ) ( not ( = ?auto_176090 ?auto_176096 ) ) ( not ( = ?auto_176090 ?auto_176097 ) ) ( not ( = ?auto_176090 ?auto_176098 ) ) ( not ( = ?auto_176091 ?auto_176092 ) ) ( not ( = ?auto_176091 ?auto_176093 ) ) ( not ( = ?auto_176091 ?auto_176094 ) ) ( not ( = ?auto_176091 ?auto_176095 ) ) ( not ( = ?auto_176091 ?auto_176096 ) ) ( not ( = ?auto_176091 ?auto_176097 ) ) ( not ( = ?auto_176091 ?auto_176098 ) ) ( not ( = ?auto_176092 ?auto_176093 ) ) ( not ( = ?auto_176092 ?auto_176094 ) ) ( not ( = ?auto_176092 ?auto_176095 ) ) ( not ( = ?auto_176092 ?auto_176096 ) ) ( not ( = ?auto_176092 ?auto_176097 ) ) ( not ( = ?auto_176092 ?auto_176098 ) ) ( not ( = ?auto_176093 ?auto_176094 ) ) ( not ( = ?auto_176093 ?auto_176095 ) ) ( not ( = ?auto_176093 ?auto_176096 ) ) ( not ( = ?auto_176093 ?auto_176097 ) ) ( not ( = ?auto_176093 ?auto_176098 ) ) ( not ( = ?auto_176094 ?auto_176095 ) ) ( not ( = ?auto_176094 ?auto_176096 ) ) ( not ( = ?auto_176094 ?auto_176097 ) ) ( not ( = ?auto_176094 ?auto_176098 ) ) ( not ( = ?auto_176095 ?auto_176096 ) ) ( not ( = ?auto_176095 ?auto_176097 ) ) ( not ( = ?auto_176095 ?auto_176098 ) ) ( not ( = ?auto_176096 ?auto_176097 ) ) ( not ( = ?auto_176096 ?auto_176098 ) ) ( not ( = ?auto_176097 ?auto_176098 ) ) ( ON ?auto_176096 ?auto_176097 ) ( ON ?auto_176095 ?auto_176096 ) ( ON ?auto_176094 ?auto_176095 ) ( CLEAR ?auto_176092 ) ( ON ?auto_176093 ?auto_176094 ) ( CLEAR ?auto_176093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176089 ?auto_176090 ?auto_176091 ?auto_176092 ?auto_176093 )
      ( MAKE-9PILE ?auto_176089 ?auto_176090 ?auto_176091 ?auto_176092 ?auto_176093 ?auto_176094 ?auto_176095 ?auto_176096 ?auto_176097 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176108 - BLOCK
      ?auto_176109 - BLOCK
      ?auto_176110 - BLOCK
      ?auto_176111 - BLOCK
      ?auto_176112 - BLOCK
      ?auto_176113 - BLOCK
      ?auto_176114 - BLOCK
      ?auto_176115 - BLOCK
      ?auto_176116 - BLOCK
    )
    :vars
    (
      ?auto_176117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176116 ?auto_176117 ) ( ON-TABLE ?auto_176108 ) ( ON ?auto_176109 ?auto_176108 ) ( ON ?auto_176110 ?auto_176109 ) ( not ( = ?auto_176108 ?auto_176109 ) ) ( not ( = ?auto_176108 ?auto_176110 ) ) ( not ( = ?auto_176108 ?auto_176111 ) ) ( not ( = ?auto_176108 ?auto_176112 ) ) ( not ( = ?auto_176108 ?auto_176113 ) ) ( not ( = ?auto_176108 ?auto_176114 ) ) ( not ( = ?auto_176108 ?auto_176115 ) ) ( not ( = ?auto_176108 ?auto_176116 ) ) ( not ( = ?auto_176108 ?auto_176117 ) ) ( not ( = ?auto_176109 ?auto_176110 ) ) ( not ( = ?auto_176109 ?auto_176111 ) ) ( not ( = ?auto_176109 ?auto_176112 ) ) ( not ( = ?auto_176109 ?auto_176113 ) ) ( not ( = ?auto_176109 ?auto_176114 ) ) ( not ( = ?auto_176109 ?auto_176115 ) ) ( not ( = ?auto_176109 ?auto_176116 ) ) ( not ( = ?auto_176109 ?auto_176117 ) ) ( not ( = ?auto_176110 ?auto_176111 ) ) ( not ( = ?auto_176110 ?auto_176112 ) ) ( not ( = ?auto_176110 ?auto_176113 ) ) ( not ( = ?auto_176110 ?auto_176114 ) ) ( not ( = ?auto_176110 ?auto_176115 ) ) ( not ( = ?auto_176110 ?auto_176116 ) ) ( not ( = ?auto_176110 ?auto_176117 ) ) ( not ( = ?auto_176111 ?auto_176112 ) ) ( not ( = ?auto_176111 ?auto_176113 ) ) ( not ( = ?auto_176111 ?auto_176114 ) ) ( not ( = ?auto_176111 ?auto_176115 ) ) ( not ( = ?auto_176111 ?auto_176116 ) ) ( not ( = ?auto_176111 ?auto_176117 ) ) ( not ( = ?auto_176112 ?auto_176113 ) ) ( not ( = ?auto_176112 ?auto_176114 ) ) ( not ( = ?auto_176112 ?auto_176115 ) ) ( not ( = ?auto_176112 ?auto_176116 ) ) ( not ( = ?auto_176112 ?auto_176117 ) ) ( not ( = ?auto_176113 ?auto_176114 ) ) ( not ( = ?auto_176113 ?auto_176115 ) ) ( not ( = ?auto_176113 ?auto_176116 ) ) ( not ( = ?auto_176113 ?auto_176117 ) ) ( not ( = ?auto_176114 ?auto_176115 ) ) ( not ( = ?auto_176114 ?auto_176116 ) ) ( not ( = ?auto_176114 ?auto_176117 ) ) ( not ( = ?auto_176115 ?auto_176116 ) ) ( not ( = ?auto_176115 ?auto_176117 ) ) ( not ( = ?auto_176116 ?auto_176117 ) ) ( ON ?auto_176115 ?auto_176116 ) ( ON ?auto_176114 ?auto_176115 ) ( ON ?auto_176113 ?auto_176114 ) ( ON ?auto_176112 ?auto_176113 ) ( CLEAR ?auto_176110 ) ( ON ?auto_176111 ?auto_176112 ) ( CLEAR ?auto_176111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176108 ?auto_176109 ?auto_176110 ?auto_176111 )
      ( MAKE-9PILE ?auto_176108 ?auto_176109 ?auto_176110 ?auto_176111 ?auto_176112 ?auto_176113 ?auto_176114 ?auto_176115 ?auto_176116 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176127 - BLOCK
      ?auto_176128 - BLOCK
      ?auto_176129 - BLOCK
      ?auto_176130 - BLOCK
      ?auto_176131 - BLOCK
      ?auto_176132 - BLOCK
      ?auto_176133 - BLOCK
      ?auto_176134 - BLOCK
      ?auto_176135 - BLOCK
    )
    :vars
    (
      ?auto_176136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176135 ?auto_176136 ) ( ON-TABLE ?auto_176127 ) ( ON ?auto_176128 ?auto_176127 ) ( ON ?auto_176129 ?auto_176128 ) ( not ( = ?auto_176127 ?auto_176128 ) ) ( not ( = ?auto_176127 ?auto_176129 ) ) ( not ( = ?auto_176127 ?auto_176130 ) ) ( not ( = ?auto_176127 ?auto_176131 ) ) ( not ( = ?auto_176127 ?auto_176132 ) ) ( not ( = ?auto_176127 ?auto_176133 ) ) ( not ( = ?auto_176127 ?auto_176134 ) ) ( not ( = ?auto_176127 ?auto_176135 ) ) ( not ( = ?auto_176127 ?auto_176136 ) ) ( not ( = ?auto_176128 ?auto_176129 ) ) ( not ( = ?auto_176128 ?auto_176130 ) ) ( not ( = ?auto_176128 ?auto_176131 ) ) ( not ( = ?auto_176128 ?auto_176132 ) ) ( not ( = ?auto_176128 ?auto_176133 ) ) ( not ( = ?auto_176128 ?auto_176134 ) ) ( not ( = ?auto_176128 ?auto_176135 ) ) ( not ( = ?auto_176128 ?auto_176136 ) ) ( not ( = ?auto_176129 ?auto_176130 ) ) ( not ( = ?auto_176129 ?auto_176131 ) ) ( not ( = ?auto_176129 ?auto_176132 ) ) ( not ( = ?auto_176129 ?auto_176133 ) ) ( not ( = ?auto_176129 ?auto_176134 ) ) ( not ( = ?auto_176129 ?auto_176135 ) ) ( not ( = ?auto_176129 ?auto_176136 ) ) ( not ( = ?auto_176130 ?auto_176131 ) ) ( not ( = ?auto_176130 ?auto_176132 ) ) ( not ( = ?auto_176130 ?auto_176133 ) ) ( not ( = ?auto_176130 ?auto_176134 ) ) ( not ( = ?auto_176130 ?auto_176135 ) ) ( not ( = ?auto_176130 ?auto_176136 ) ) ( not ( = ?auto_176131 ?auto_176132 ) ) ( not ( = ?auto_176131 ?auto_176133 ) ) ( not ( = ?auto_176131 ?auto_176134 ) ) ( not ( = ?auto_176131 ?auto_176135 ) ) ( not ( = ?auto_176131 ?auto_176136 ) ) ( not ( = ?auto_176132 ?auto_176133 ) ) ( not ( = ?auto_176132 ?auto_176134 ) ) ( not ( = ?auto_176132 ?auto_176135 ) ) ( not ( = ?auto_176132 ?auto_176136 ) ) ( not ( = ?auto_176133 ?auto_176134 ) ) ( not ( = ?auto_176133 ?auto_176135 ) ) ( not ( = ?auto_176133 ?auto_176136 ) ) ( not ( = ?auto_176134 ?auto_176135 ) ) ( not ( = ?auto_176134 ?auto_176136 ) ) ( not ( = ?auto_176135 ?auto_176136 ) ) ( ON ?auto_176134 ?auto_176135 ) ( ON ?auto_176133 ?auto_176134 ) ( ON ?auto_176132 ?auto_176133 ) ( ON ?auto_176131 ?auto_176132 ) ( CLEAR ?auto_176129 ) ( ON ?auto_176130 ?auto_176131 ) ( CLEAR ?auto_176130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176127 ?auto_176128 ?auto_176129 ?auto_176130 )
      ( MAKE-9PILE ?auto_176127 ?auto_176128 ?auto_176129 ?auto_176130 ?auto_176131 ?auto_176132 ?auto_176133 ?auto_176134 ?auto_176135 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176146 - BLOCK
      ?auto_176147 - BLOCK
      ?auto_176148 - BLOCK
      ?auto_176149 - BLOCK
      ?auto_176150 - BLOCK
      ?auto_176151 - BLOCK
      ?auto_176152 - BLOCK
      ?auto_176153 - BLOCK
      ?auto_176154 - BLOCK
    )
    :vars
    (
      ?auto_176155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176154 ?auto_176155 ) ( ON-TABLE ?auto_176146 ) ( ON ?auto_176147 ?auto_176146 ) ( not ( = ?auto_176146 ?auto_176147 ) ) ( not ( = ?auto_176146 ?auto_176148 ) ) ( not ( = ?auto_176146 ?auto_176149 ) ) ( not ( = ?auto_176146 ?auto_176150 ) ) ( not ( = ?auto_176146 ?auto_176151 ) ) ( not ( = ?auto_176146 ?auto_176152 ) ) ( not ( = ?auto_176146 ?auto_176153 ) ) ( not ( = ?auto_176146 ?auto_176154 ) ) ( not ( = ?auto_176146 ?auto_176155 ) ) ( not ( = ?auto_176147 ?auto_176148 ) ) ( not ( = ?auto_176147 ?auto_176149 ) ) ( not ( = ?auto_176147 ?auto_176150 ) ) ( not ( = ?auto_176147 ?auto_176151 ) ) ( not ( = ?auto_176147 ?auto_176152 ) ) ( not ( = ?auto_176147 ?auto_176153 ) ) ( not ( = ?auto_176147 ?auto_176154 ) ) ( not ( = ?auto_176147 ?auto_176155 ) ) ( not ( = ?auto_176148 ?auto_176149 ) ) ( not ( = ?auto_176148 ?auto_176150 ) ) ( not ( = ?auto_176148 ?auto_176151 ) ) ( not ( = ?auto_176148 ?auto_176152 ) ) ( not ( = ?auto_176148 ?auto_176153 ) ) ( not ( = ?auto_176148 ?auto_176154 ) ) ( not ( = ?auto_176148 ?auto_176155 ) ) ( not ( = ?auto_176149 ?auto_176150 ) ) ( not ( = ?auto_176149 ?auto_176151 ) ) ( not ( = ?auto_176149 ?auto_176152 ) ) ( not ( = ?auto_176149 ?auto_176153 ) ) ( not ( = ?auto_176149 ?auto_176154 ) ) ( not ( = ?auto_176149 ?auto_176155 ) ) ( not ( = ?auto_176150 ?auto_176151 ) ) ( not ( = ?auto_176150 ?auto_176152 ) ) ( not ( = ?auto_176150 ?auto_176153 ) ) ( not ( = ?auto_176150 ?auto_176154 ) ) ( not ( = ?auto_176150 ?auto_176155 ) ) ( not ( = ?auto_176151 ?auto_176152 ) ) ( not ( = ?auto_176151 ?auto_176153 ) ) ( not ( = ?auto_176151 ?auto_176154 ) ) ( not ( = ?auto_176151 ?auto_176155 ) ) ( not ( = ?auto_176152 ?auto_176153 ) ) ( not ( = ?auto_176152 ?auto_176154 ) ) ( not ( = ?auto_176152 ?auto_176155 ) ) ( not ( = ?auto_176153 ?auto_176154 ) ) ( not ( = ?auto_176153 ?auto_176155 ) ) ( not ( = ?auto_176154 ?auto_176155 ) ) ( ON ?auto_176153 ?auto_176154 ) ( ON ?auto_176152 ?auto_176153 ) ( ON ?auto_176151 ?auto_176152 ) ( ON ?auto_176150 ?auto_176151 ) ( ON ?auto_176149 ?auto_176150 ) ( CLEAR ?auto_176147 ) ( ON ?auto_176148 ?auto_176149 ) ( CLEAR ?auto_176148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176146 ?auto_176147 ?auto_176148 )
      ( MAKE-9PILE ?auto_176146 ?auto_176147 ?auto_176148 ?auto_176149 ?auto_176150 ?auto_176151 ?auto_176152 ?auto_176153 ?auto_176154 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176165 - BLOCK
      ?auto_176166 - BLOCK
      ?auto_176167 - BLOCK
      ?auto_176168 - BLOCK
      ?auto_176169 - BLOCK
      ?auto_176170 - BLOCK
      ?auto_176171 - BLOCK
      ?auto_176172 - BLOCK
      ?auto_176173 - BLOCK
    )
    :vars
    (
      ?auto_176174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176173 ?auto_176174 ) ( ON-TABLE ?auto_176165 ) ( ON ?auto_176166 ?auto_176165 ) ( not ( = ?auto_176165 ?auto_176166 ) ) ( not ( = ?auto_176165 ?auto_176167 ) ) ( not ( = ?auto_176165 ?auto_176168 ) ) ( not ( = ?auto_176165 ?auto_176169 ) ) ( not ( = ?auto_176165 ?auto_176170 ) ) ( not ( = ?auto_176165 ?auto_176171 ) ) ( not ( = ?auto_176165 ?auto_176172 ) ) ( not ( = ?auto_176165 ?auto_176173 ) ) ( not ( = ?auto_176165 ?auto_176174 ) ) ( not ( = ?auto_176166 ?auto_176167 ) ) ( not ( = ?auto_176166 ?auto_176168 ) ) ( not ( = ?auto_176166 ?auto_176169 ) ) ( not ( = ?auto_176166 ?auto_176170 ) ) ( not ( = ?auto_176166 ?auto_176171 ) ) ( not ( = ?auto_176166 ?auto_176172 ) ) ( not ( = ?auto_176166 ?auto_176173 ) ) ( not ( = ?auto_176166 ?auto_176174 ) ) ( not ( = ?auto_176167 ?auto_176168 ) ) ( not ( = ?auto_176167 ?auto_176169 ) ) ( not ( = ?auto_176167 ?auto_176170 ) ) ( not ( = ?auto_176167 ?auto_176171 ) ) ( not ( = ?auto_176167 ?auto_176172 ) ) ( not ( = ?auto_176167 ?auto_176173 ) ) ( not ( = ?auto_176167 ?auto_176174 ) ) ( not ( = ?auto_176168 ?auto_176169 ) ) ( not ( = ?auto_176168 ?auto_176170 ) ) ( not ( = ?auto_176168 ?auto_176171 ) ) ( not ( = ?auto_176168 ?auto_176172 ) ) ( not ( = ?auto_176168 ?auto_176173 ) ) ( not ( = ?auto_176168 ?auto_176174 ) ) ( not ( = ?auto_176169 ?auto_176170 ) ) ( not ( = ?auto_176169 ?auto_176171 ) ) ( not ( = ?auto_176169 ?auto_176172 ) ) ( not ( = ?auto_176169 ?auto_176173 ) ) ( not ( = ?auto_176169 ?auto_176174 ) ) ( not ( = ?auto_176170 ?auto_176171 ) ) ( not ( = ?auto_176170 ?auto_176172 ) ) ( not ( = ?auto_176170 ?auto_176173 ) ) ( not ( = ?auto_176170 ?auto_176174 ) ) ( not ( = ?auto_176171 ?auto_176172 ) ) ( not ( = ?auto_176171 ?auto_176173 ) ) ( not ( = ?auto_176171 ?auto_176174 ) ) ( not ( = ?auto_176172 ?auto_176173 ) ) ( not ( = ?auto_176172 ?auto_176174 ) ) ( not ( = ?auto_176173 ?auto_176174 ) ) ( ON ?auto_176172 ?auto_176173 ) ( ON ?auto_176171 ?auto_176172 ) ( ON ?auto_176170 ?auto_176171 ) ( ON ?auto_176169 ?auto_176170 ) ( ON ?auto_176168 ?auto_176169 ) ( CLEAR ?auto_176166 ) ( ON ?auto_176167 ?auto_176168 ) ( CLEAR ?auto_176167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176165 ?auto_176166 ?auto_176167 )
      ( MAKE-9PILE ?auto_176165 ?auto_176166 ?auto_176167 ?auto_176168 ?auto_176169 ?auto_176170 ?auto_176171 ?auto_176172 ?auto_176173 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176184 - BLOCK
      ?auto_176185 - BLOCK
      ?auto_176186 - BLOCK
      ?auto_176187 - BLOCK
      ?auto_176188 - BLOCK
      ?auto_176189 - BLOCK
      ?auto_176190 - BLOCK
      ?auto_176191 - BLOCK
      ?auto_176192 - BLOCK
    )
    :vars
    (
      ?auto_176193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176192 ?auto_176193 ) ( ON-TABLE ?auto_176184 ) ( not ( = ?auto_176184 ?auto_176185 ) ) ( not ( = ?auto_176184 ?auto_176186 ) ) ( not ( = ?auto_176184 ?auto_176187 ) ) ( not ( = ?auto_176184 ?auto_176188 ) ) ( not ( = ?auto_176184 ?auto_176189 ) ) ( not ( = ?auto_176184 ?auto_176190 ) ) ( not ( = ?auto_176184 ?auto_176191 ) ) ( not ( = ?auto_176184 ?auto_176192 ) ) ( not ( = ?auto_176184 ?auto_176193 ) ) ( not ( = ?auto_176185 ?auto_176186 ) ) ( not ( = ?auto_176185 ?auto_176187 ) ) ( not ( = ?auto_176185 ?auto_176188 ) ) ( not ( = ?auto_176185 ?auto_176189 ) ) ( not ( = ?auto_176185 ?auto_176190 ) ) ( not ( = ?auto_176185 ?auto_176191 ) ) ( not ( = ?auto_176185 ?auto_176192 ) ) ( not ( = ?auto_176185 ?auto_176193 ) ) ( not ( = ?auto_176186 ?auto_176187 ) ) ( not ( = ?auto_176186 ?auto_176188 ) ) ( not ( = ?auto_176186 ?auto_176189 ) ) ( not ( = ?auto_176186 ?auto_176190 ) ) ( not ( = ?auto_176186 ?auto_176191 ) ) ( not ( = ?auto_176186 ?auto_176192 ) ) ( not ( = ?auto_176186 ?auto_176193 ) ) ( not ( = ?auto_176187 ?auto_176188 ) ) ( not ( = ?auto_176187 ?auto_176189 ) ) ( not ( = ?auto_176187 ?auto_176190 ) ) ( not ( = ?auto_176187 ?auto_176191 ) ) ( not ( = ?auto_176187 ?auto_176192 ) ) ( not ( = ?auto_176187 ?auto_176193 ) ) ( not ( = ?auto_176188 ?auto_176189 ) ) ( not ( = ?auto_176188 ?auto_176190 ) ) ( not ( = ?auto_176188 ?auto_176191 ) ) ( not ( = ?auto_176188 ?auto_176192 ) ) ( not ( = ?auto_176188 ?auto_176193 ) ) ( not ( = ?auto_176189 ?auto_176190 ) ) ( not ( = ?auto_176189 ?auto_176191 ) ) ( not ( = ?auto_176189 ?auto_176192 ) ) ( not ( = ?auto_176189 ?auto_176193 ) ) ( not ( = ?auto_176190 ?auto_176191 ) ) ( not ( = ?auto_176190 ?auto_176192 ) ) ( not ( = ?auto_176190 ?auto_176193 ) ) ( not ( = ?auto_176191 ?auto_176192 ) ) ( not ( = ?auto_176191 ?auto_176193 ) ) ( not ( = ?auto_176192 ?auto_176193 ) ) ( ON ?auto_176191 ?auto_176192 ) ( ON ?auto_176190 ?auto_176191 ) ( ON ?auto_176189 ?auto_176190 ) ( ON ?auto_176188 ?auto_176189 ) ( ON ?auto_176187 ?auto_176188 ) ( ON ?auto_176186 ?auto_176187 ) ( CLEAR ?auto_176184 ) ( ON ?auto_176185 ?auto_176186 ) ( CLEAR ?auto_176185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176184 ?auto_176185 )
      ( MAKE-9PILE ?auto_176184 ?auto_176185 ?auto_176186 ?auto_176187 ?auto_176188 ?auto_176189 ?auto_176190 ?auto_176191 ?auto_176192 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176203 - BLOCK
      ?auto_176204 - BLOCK
      ?auto_176205 - BLOCK
      ?auto_176206 - BLOCK
      ?auto_176207 - BLOCK
      ?auto_176208 - BLOCK
      ?auto_176209 - BLOCK
      ?auto_176210 - BLOCK
      ?auto_176211 - BLOCK
    )
    :vars
    (
      ?auto_176212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176211 ?auto_176212 ) ( ON-TABLE ?auto_176203 ) ( not ( = ?auto_176203 ?auto_176204 ) ) ( not ( = ?auto_176203 ?auto_176205 ) ) ( not ( = ?auto_176203 ?auto_176206 ) ) ( not ( = ?auto_176203 ?auto_176207 ) ) ( not ( = ?auto_176203 ?auto_176208 ) ) ( not ( = ?auto_176203 ?auto_176209 ) ) ( not ( = ?auto_176203 ?auto_176210 ) ) ( not ( = ?auto_176203 ?auto_176211 ) ) ( not ( = ?auto_176203 ?auto_176212 ) ) ( not ( = ?auto_176204 ?auto_176205 ) ) ( not ( = ?auto_176204 ?auto_176206 ) ) ( not ( = ?auto_176204 ?auto_176207 ) ) ( not ( = ?auto_176204 ?auto_176208 ) ) ( not ( = ?auto_176204 ?auto_176209 ) ) ( not ( = ?auto_176204 ?auto_176210 ) ) ( not ( = ?auto_176204 ?auto_176211 ) ) ( not ( = ?auto_176204 ?auto_176212 ) ) ( not ( = ?auto_176205 ?auto_176206 ) ) ( not ( = ?auto_176205 ?auto_176207 ) ) ( not ( = ?auto_176205 ?auto_176208 ) ) ( not ( = ?auto_176205 ?auto_176209 ) ) ( not ( = ?auto_176205 ?auto_176210 ) ) ( not ( = ?auto_176205 ?auto_176211 ) ) ( not ( = ?auto_176205 ?auto_176212 ) ) ( not ( = ?auto_176206 ?auto_176207 ) ) ( not ( = ?auto_176206 ?auto_176208 ) ) ( not ( = ?auto_176206 ?auto_176209 ) ) ( not ( = ?auto_176206 ?auto_176210 ) ) ( not ( = ?auto_176206 ?auto_176211 ) ) ( not ( = ?auto_176206 ?auto_176212 ) ) ( not ( = ?auto_176207 ?auto_176208 ) ) ( not ( = ?auto_176207 ?auto_176209 ) ) ( not ( = ?auto_176207 ?auto_176210 ) ) ( not ( = ?auto_176207 ?auto_176211 ) ) ( not ( = ?auto_176207 ?auto_176212 ) ) ( not ( = ?auto_176208 ?auto_176209 ) ) ( not ( = ?auto_176208 ?auto_176210 ) ) ( not ( = ?auto_176208 ?auto_176211 ) ) ( not ( = ?auto_176208 ?auto_176212 ) ) ( not ( = ?auto_176209 ?auto_176210 ) ) ( not ( = ?auto_176209 ?auto_176211 ) ) ( not ( = ?auto_176209 ?auto_176212 ) ) ( not ( = ?auto_176210 ?auto_176211 ) ) ( not ( = ?auto_176210 ?auto_176212 ) ) ( not ( = ?auto_176211 ?auto_176212 ) ) ( ON ?auto_176210 ?auto_176211 ) ( ON ?auto_176209 ?auto_176210 ) ( ON ?auto_176208 ?auto_176209 ) ( ON ?auto_176207 ?auto_176208 ) ( ON ?auto_176206 ?auto_176207 ) ( ON ?auto_176205 ?auto_176206 ) ( CLEAR ?auto_176203 ) ( ON ?auto_176204 ?auto_176205 ) ( CLEAR ?auto_176204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176203 ?auto_176204 )
      ( MAKE-9PILE ?auto_176203 ?auto_176204 ?auto_176205 ?auto_176206 ?auto_176207 ?auto_176208 ?auto_176209 ?auto_176210 ?auto_176211 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176222 - BLOCK
      ?auto_176223 - BLOCK
      ?auto_176224 - BLOCK
      ?auto_176225 - BLOCK
      ?auto_176226 - BLOCK
      ?auto_176227 - BLOCK
      ?auto_176228 - BLOCK
      ?auto_176229 - BLOCK
      ?auto_176230 - BLOCK
    )
    :vars
    (
      ?auto_176231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176230 ?auto_176231 ) ( not ( = ?auto_176222 ?auto_176223 ) ) ( not ( = ?auto_176222 ?auto_176224 ) ) ( not ( = ?auto_176222 ?auto_176225 ) ) ( not ( = ?auto_176222 ?auto_176226 ) ) ( not ( = ?auto_176222 ?auto_176227 ) ) ( not ( = ?auto_176222 ?auto_176228 ) ) ( not ( = ?auto_176222 ?auto_176229 ) ) ( not ( = ?auto_176222 ?auto_176230 ) ) ( not ( = ?auto_176222 ?auto_176231 ) ) ( not ( = ?auto_176223 ?auto_176224 ) ) ( not ( = ?auto_176223 ?auto_176225 ) ) ( not ( = ?auto_176223 ?auto_176226 ) ) ( not ( = ?auto_176223 ?auto_176227 ) ) ( not ( = ?auto_176223 ?auto_176228 ) ) ( not ( = ?auto_176223 ?auto_176229 ) ) ( not ( = ?auto_176223 ?auto_176230 ) ) ( not ( = ?auto_176223 ?auto_176231 ) ) ( not ( = ?auto_176224 ?auto_176225 ) ) ( not ( = ?auto_176224 ?auto_176226 ) ) ( not ( = ?auto_176224 ?auto_176227 ) ) ( not ( = ?auto_176224 ?auto_176228 ) ) ( not ( = ?auto_176224 ?auto_176229 ) ) ( not ( = ?auto_176224 ?auto_176230 ) ) ( not ( = ?auto_176224 ?auto_176231 ) ) ( not ( = ?auto_176225 ?auto_176226 ) ) ( not ( = ?auto_176225 ?auto_176227 ) ) ( not ( = ?auto_176225 ?auto_176228 ) ) ( not ( = ?auto_176225 ?auto_176229 ) ) ( not ( = ?auto_176225 ?auto_176230 ) ) ( not ( = ?auto_176225 ?auto_176231 ) ) ( not ( = ?auto_176226 ?auto_176227 ) ) ( not ( = ?auto_176226 ?auto_176228 ) ) ( not ( = ?auto_176226 ?auto_176229 ) ) ( not ( = ?auto_176226 ?auto_176230 ) ) ( not ( = ?auto_176226 ?auto_176231 ) ) ( not ( = ?auto_176227 ?auto_176228 ) ) ( not ( = ?auto_176227 ?auto_176229 ) ) ( not ( = ?auto_176227 ?auto_176230 ) ) ( not ( = ?auto_176227 ?auto_176231 ) ) ( not ( = ?auto_176228 ?auto_176229 ) ) ( not ( = ?auto_176228 ?auto_176230 ) ) ( not ( = ?auto_176228 ?auto_176231 ) ) ( not ( = ?auto_176229 ?auto_176230 ) ) ( not ( = ?auto_176229 ?auto_176231 ) ) ( not ( = ?auto_176230 ?auto_176231 ) ) ( ON ?auto_176229 ?auto_176230 ) ( ON ?auto_176228 ?auto_176229 ) ( ON ?auto_176227 ?auto_176228 ) ( ON ?auto_176226 ?auto_176227 ) ( ON ?auto_176225 ?auto_176226 ) ( ON ?auto_176224 ?auto_176225 ) ( ON ?auto_176223 ?auto_176224 ) ( ON ?auto_176222 ?auto_176223 ) ( CLEAR ?auto_176222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176222 )
      ( MAKE-9PILE ?auto_176222 ?auto_176223 ?auto_176224 ?auto_176225 ?auto_176226 ?auto_176227 ?auto_176228 ?auto_176229 ?auto_176230 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_176241 - BLOCK
      ?auto_176242 - BLOCK
      ?auto_176243 - BLOCK
      ?auto_176244 - BLOCK
      ?auto_176245 - BLOCK
      ?auto_176246 - BLOCK
      ?auto_176247 - BLOCK
      ?auto_176248 - BLOCK
      ?auto_176249 - BLOCK
    )
    :vars
    (
      ?auto_176250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176249 ?auto_176250 ) ( not ( = ?auto_176241 ?auto_176242 ) ) ( not ( = ?auto_176241 ?auto_176243 ) ) ( not ( = ?auto_176241 ?auto_176244 ) ) ( not ( = ?auto_176241 ?auto_176245 ) ) ( not ( = ?auto_176241 ?auto_176246 ) ) ( not ( = ?auto_176241 ?auto_176247 ) ) ( not ( = ?auto_176241 ?auto_176248 ) ) ( not ( = ?auto_176241 ?auto_176249 ) ) ( not ( = ?auto_176241 ?auto_176250 ) ) ( not ( = ?auto_176242 ?auto_176243 ) ) ( not ( = ?auto_176242 ?auto_176244 ) ) ( not ( = ?auto_176242 ?auto_176245 ) ) ( not ( = ?auto_176242 ?auto_176246 ) ) ( not ( = ?auto_176242 ?auto_176247 ) ) ( not ( = ?auto_176242 ?auto_176248 ) ) ( not ( = ?auto_176242 ?auto_176249 ) ) ( not ( = ?auto_176242 ?auto_176250 ) ) ( not ( = ?auto_176243 ?auto_176244 ) ) ( not ( = ?auto_176243 ?auto_176245 ) ) ( not ( = ?auto_176243 ?auto_176246 ) ) ( not ( = ?auto_176243 ?auto_176247 ) ) ( not ( = ?auto_176243 ?auto_176248 ) ) ( not ( = ?auto_176243 ?auto_176249 ) ) ( not ( = ?auto_176243 ?auto_176250 ) ) ( not ( = ?auto_176244 ?auto_176245 ) ) ( not ( = ?auto_176244 ?auto_176246 ) ) ( not ( = ?auto_176244 ?auto_176247 ) ) ( not ( = ?auto_176244 ?auto_176248 ) ) ( not ( = ?auto_176244 ?auto_176249 ) ) ( not ( = ?auto_176244 ?auto_176250 ) ) ( not ( = ?auto_176245 ?auto_176246 ) ) ( not ( = ?auto_176245 ?auto_176247 ) ) ( not ( = ?auto_176245 ?auto_176248 ) ) ( not ( = ?auto_176245 ?auto_176249 ) ) ( not ( = ?auto_176245 ?auto_176250 ) ) ( not ( = ?auto_176246 ?auto_176247 ) ) ( not ( = ?auto_176246 ?auto_176248 ) ) ( not ( = ?auto_176246 ?auto_176249 ) ) ( not ( = ?auto_176246 ?auto_176250 ) ) ( not ( = ?auto_176247 ?auto_176248 ) ) ( not ( = ?auto_176247 ?auto_176249 ) ) ( not ( = ?auto_176247 ?auto_176250 ) ) ( not ( = ?auto_176248 ?auto_176249 ) ) ( not ( = ?auto_176248 ?auto_176250 ) ) ( not ( = ?auto_176249 ?auto_176250 ) ) ( ON ?auto_176248 ?auto_176249 ) ( ON ?auto_176247 ?auto_176248 ) ( ON ?auto_176246 ?auto_176247 ) ( ON ?auto_176245 ?auto_176246 ) ( ON ?auto_176244 ?auto_176245 ) ( ON ?auto_176243 ?auto_176244 ) ( ON ?auto_176242 ?auto_176243 ) ( ON ?auto_176241 ?auto_176242 ) ( CLEAR ?auto_176241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176241 )
      ( MAKE-9PILE ?auto_176241 ?auto_176242 ?auto_176243 ?auto_176244 ?auto_176245 ?auto_176246 ?auto_176247 ?auto_176248 ?auto_176249 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176261 - BLOCK
      ?auto_176262 - BLOCK
      ?auto_176263 - BLOCK
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
    )
    :precondition
    ( and ( CLEAR ?auto_176269 ) ( ON ?auto_176270 ?auto_176271 ) ( CLEAR ?auto_176270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176261 ) ( ON ?auto_176262 ?auto_176261 ) ( ON ?auto_176263 ?auto_176262 ) ( ON ?auto_176264 ?auto_176263 ) ( ON ?auto_176265 ?auto_176264 ) ( ON ?auto_176266 ?auto_176265 ) ( ON ?auto_176267 ?auto_176266 ) ( ON ?auto_176268 ?auto_176267 ) ( ON ?auto_176269 ?auto_176268 ) ( not ( = ?auto_176261 ?auto_176262 ) ) ( not ( = ?auto_176261 ?auto_176263 ) ) ( not ( = ?auto_176261 ?auto_176264 ) ) ( not ( = ?auto_176261 ?auto_176265 ) ) ( not ( = ?auto_176261 ?auto_176266 ) ) ( not ( = ?auto_176261 ?auto_176267 ) ) ( not ( = ?auto_176261 ?auto_176268 ) ) ( not ( = ?auto_176261 ?auto_176269 ) ) ( not ( = ?auto_176261 ?auto_176270 ) ) ( not ( = ?auto_176261 ?auto_176271 ) ) ( not ( = ?auto_176262 ?auto_176263 ) ) ( not ( = ?auto_176262 ?auto_176264 ) ) ( not ( = ?auto_176262 ?auto_176265 ) ) ( not ( = ?auto_176262 ?auto_176266 ) ) ( not ( = ?auto_176262 ?auto_176267 ) ) ( not ( = ?auto_176262 ?auto_176268 ) ) ( not ( = ?auto_176262 ?auto_176269 ) ) ( not ( = ?auto_176262 ?auto_176270 ) ) ( not ( = ?auto_176262 ?auto_176271 ) ) ( not ( = ?auto_176263 ?auto_176264 ) ) ( not ( = ?auto_176263 ?auto_176265 ) ) ( not ( = ?auto_176263 ?auto_176266 ) ) ( not ( = ?auto_176263 ?auto_176267 ) ) ( not ( = ?auto_176263 ?auto_176268 ) ) ( not ( = ?auto_176263 ?auto_176269 ) ) ( not ( = ?auto_176263 ?auto_176270 ) ) ( not ( = ?auto_176263 ?auto_176271 ) ) ( not ( = ?auto_176264 ?auto_176265 ) ) ( not ( = ?auto_176264 ?auto_176266 ) ) ( not ( = ?auto_176264 ?auto_176267 ) ) ( not ( = ?auto_176264 ?auto_176268 ) ) ( not ( = ?auto_176264 ?auto_176269 ) ) ( not ( = ?auto_176264 ?auto_176270 ) ) ( not ( = ?auto_176264 ?auto_176271 ) ) ( not ( = ?auto_176265 ?auto_176266 ) ) ( not ( = ?auto_176265 ?auto_176267 ) ) ( not ( = ?auto_176265 ?auto_176268 ) ) ( not ( = ?auto_176265 ?auto_176269 ) ) ( not ( = ?auto_176265 ?auto_176270 ) ) ( not ( = ?auto_176265 ?auto_176271 ) ) ( not ( = ?auto_176266 ?auto_176267 ) ) ( not ( = ?auto_176266 ?auto_176268 ) ) ( not ( = ?auto_176266 ?auto_176269 ) ) ( not ( = ?auto_176266 ?auto_176270 ) ) ( not ( = ?auto_176266 ?auto_176271 ) ) ( not ( = ?auto_176267 ?auto_176268 ) ) ( not ( = ?auto_176267 ?auto_176269 ) ) ( not ( = ?auto_176267 ?auto_176270 ) ) ( not ( = ?auto_176267 ?auto_176271 ) ) ( not ( = ?auto_176268 ?auto_176269 ) ) ( not ( = ?auto_176268 ?auto_176270 ) ) ( not ( = ?auto_176268 ?auto_176271 ) ) ( not ( = ?auto_176269 ?auto_176270 ) ) ( not ( = ?auto_176269 ?auto_176271 ) ) ( not ( = ?auto_176270 ?auto_176271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176270 ?auto_176271 )
      ( !STACK ?auto_176270 ?auto_176269 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176282 - BLOCK
      ?auto_176283 - BLOCK
      ?auto_176284 - BLOCK
      ?auto_176285 - BLOCK
      ?auto_176286 - BLOCK
      ?auto_176287 - BLOCK
      ?auto_176288 - BLOCK
      ?auto_176289 - BLOCK
      ?auto_176290 - BLOCK
      ?auto_176291 - BLOCK
    )
    :vars
    (
      ?auto_176292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_176290 ) ( ON ?auto_176291 ?auto_176292 ) ( CLEAR ?auto_176291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176282 ) ( ON ?auto_176283 ?auto_176282 ) ( ON ?auto_176284 ?auto_176283 ) ( ON ?auto_176285 ?auto_176284 ) ( ON ?auto_176286 ?auto_176285 ) ( ON ?auto_176287 ?auto_176286 ) ( ON ?auto_176288 ?auto_176287 ) ( ON ?auto_176289 ?auto_176288 ) ( ON ?auto_176290 ?auto_176289 ) ( not ( = ?auto_176282 ?auto_176283 ) ) ( not ( = ?auto_176282 ?auto_176284 ) ) ( not ( = ?auto_176282 ?auto_176285 ) ) ( not ( = ?auto_176282 ?auto_176286 ) ) ( not ( = ?auto_176282 ?auto_176287 ) ) ( not ( = ?auto_176282 ?auto_176288 ) ) ( not ( = ?auto_176282 ?auto_176289 ) ) ( not ( = ?auto_176282 ?auto_176290 ) ) ( not ( = ?auto_176282 ?auto_176291 ) ) ( not ( = ?auto_176282 ?auto_176292 ) ) ( not ( = ?auto_176283 ?auto_176284 ) ) ( not ( = ?auto_176283 ?auto_176285 ) ) ( not ( = ?auto_176283 ?auto_176286 ) ) ( not ( = ?auto_176283 ?auto_176287 ) ) ( not ( = ?auto_176283 ?auto_176288 ) ) ( not ( = ?auto_176283 ?auto_176289 ) ) ( not ( = ?auto_176283 ?auto_176290 ) ) ( not ( = ?auto_176283 ?auto_176291 ) ) ( not ( = ?auto_176283 ?auto_176292 ) ) ( not ( = ?auto_176284 ?auto_176285 ) ) ( not ( = ?auto_176284 ?auto_176286 ) ) ( not ( = ?auto_176284 ?auto_176287 ) ) ( not ( = ?auto_176284 ?auto_176288 ) ) ( not ( = ?auto_176284 ?auto_176289 ) ) ( not ( = ?auto_176284 ?auto_176290 ) ) ( not ( = ?auto_176284 ?auto_176291 ) ) ( not ( = ?auto_176284 ?auto_176292 ) ) ( not ( = ?auto_176285 ?auto_176286 ) ) ( not ( = ?auto_176285 ?auto_176287 ) ) ( not ( = ?auto_176285 ?auto_176288 ) ) ( not ( = ?auto_176285 ?auto_176289 ) ) ( not ( = ?auto_176285 ?auto_176290 ) ) ( not ( = ?auto_176285 ?auto_176291 ) ) ( not ( = ?auto_176285 ?auto_176292 ) ) ( not ( = ?auto_176286 ?auto_176287 ) ) ( not ( = ?auto_176286 ?auto_176288 ) ) ( not ( = ?auto_176286 ?auto_176289 ) ) ( not ( = ?auto_176286 ?auto_176290 ) ) ( not ( = ?auto_176286 ?auto_176291 ) ) ( not ( = ?auto_176286 ?auto_176292 ) ) ( not ( = ?auto_176287 ?auto_176288 ) ) ( not ( = ?auto_176287 ?auto_176289 ) ) ( not ( = ?auto_176287 ?auto_176290 ) ) ( not ( = ?auto_176287 ?auto_176291 ) ) ( not ( = ?auto_176287 ?auto_176292 ) ) ( not ( = ?auto_176288 ?auto_176289 ) ) ( not ( = ?auto_176288 ?auto_176290 ) ) ( not ( = ?auto_176288 ?auto_176291 ) ) ( not ( = ?auto_176288 ?auto_176292 ) ) ( not ( = ?auto_176289 ?auto_176290 ) ) ( not ( = ?auto_176289 ?auto_176291 ) ) ( not ( = ?auto_176289 ?auto_176292 ) ) ( not ( = ?auto_176290 ?auto_176291 ) ) ( not ( = ?auto_176290 ?auto_176292 ) ) ( not ( = ?auto_176291 ?auto_176292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176291 ?auto_176292 )
      ( !STACK ?auto_176291 ?auto_176290 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176303 - BLOCK
      ?auto_176304 - BLOCK
      ?auto_176305 - BLOCK
      ?auto_176306 - BLOCK
      ?auto_176307 - BLOCK
      ?auto_176308 - BLOCK
      ?auto_176309 - BLOCK
      ?auto_176310 - BLOCK
      ?auto_176311 - BLOCK
      ?auto_176312 - BLOCK
    )
    :vars
    (
      ?auto_176313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176312 ?auto_176313 ) ( ON-TABLE ?auto_176303 ) ( ON ?auto_176304 ?auto_176303 ) ( ON ?auto_176305 ?auto_176304 ) ( ON ?auto_176306 ?auto_176305 ) ( ON ?auto_176307 ?auto_176306 ) ( ON ?auto_176308 ?auto_176307 ) ( ON ?auto_176309 ?auto_176308 ) ( ON ?auto_176310 ?auto_176309 ) ( not ( = ?auto_176303 ?auto_176304 ) ) ( not ( = ?auto_176303 ?auto_176305 ) ) ( not ( = ?auto_176303 ?auto_176306 ) ) ( not ( = ?auto_176303 ?auto_176307 ) ) ( not ( = ?auto_176303 ?auto_176308 ) ) ( not ( = ?auto_176303 ?auto_176309 ) ) ( not ( = ?auto_176303 ?auto_176310 ) ) ( not ( = ?auto_176303 ?auto_176311 ) ) ( not ( = ?auto_176303 ?auto_176312 ) ) ( not ( = ?auto_176303 ?auto_176313 ) ) ( not ( = ?auto_176304 ?auto_176305 ) ) ( not ( = ?auto_176304 ?auto_176306 ) ) ( not ( = ?auto_176304 ?auto_176307 ) ) ( not ( = ?auto_176304 ?auto_176308 ) ) ( not ( = ?auto_176304 ?auto_176309 ) ) ( not ( = ?auto_176304 ?auto_176310 ) ) ( not ( = ?auto_176304 ?auto_176311 ) ) ( not ( = ?auto_176304 ?auto_176312 ) ) ( not ( = ?auto_176304 ?auto_176313 ) ) ( not ( = ?auto_176305 ?auto_176306 ) ) ( not ( = ?auto_176305 ?auto_176307 ) ) ( not ( = ?auto_176305 ?auto_176308 ) ) ( not ( = ?auto_176305 ?auto_176309 ) ) ( not ( = ?auto_176305 ?auto_176310 ) ) ( not ( = ?auto_176305 ?auto_176311 ) ) ( not ( = ?auto_176305 ?auto_176312 ) ) ( not ( = ?auto_176305 ?auto_176313 ) ) ( not ( = ?auto_176306 ?auto_176307 ) ) ( not ( = ?auto_176306 ?auto_176308 ) ) ( not ( = ?auto_176306 ?auto_176309 ) ) ( not ( = ?auto_176306 ?auto_176310 ) ) ( not ( = ?auto_176306 ?auto_176311 ) ) ( not ( = ?auto_176306 ?auto_176312 ) ) ( not ( = ?auto_176306 ?auto_176313 ) ) ( not ( = ?auto_176307 ?auto_176308 ) ) ( not ( = ?auto_176307 ?auto_176309 ) ) ( not ( = ?auto_176307 ?auto_176310 ) ) ( not ( = ?auto_176307 ?auto_176311 ) ) ( not ( = ?auto_176307 ?auto_176312 ) ) ( not ( = ?auto_176307 ?auto_176313 ) ) ( not ( = ?auto_176308 ?auto_176309 ) ) ( not ( = ?auto_176308 ?auto_176310 ) ) ( not ( = ?auto_176308 ?auto_176311 ) ) ( not ( = ?auto_176308 ?auto_176312 ) ) ( not ( = ?auto_176308 ?auto_176313 ) ) ( not ( = ?auto_176309 ?auto_176310 ) ) ( not ( = ?auto_176309 ?auto_176311 ) ) ( not ( = ?auto_176309 ?auto_176312 ) ) ( not ( = ?auto_176309 ?auto_176313 ) ) ( not ( = ?auto_176310 ?auto_176311 ) ) ( not ( = ?auto_176310 ?auto_176312 ) ) ( not ( = ?auto_176310 ?auto_176313 ) ) ( not ( = ?auto_176311 ?auto_176312 ) ) ( not ( = ?auto_176311 ?auto_176313 ) ) ( not ( = ?auto_176312 ?auto_176313 ) ) ( CLEAR ?auto_176310 ) ( ON ?auto_176311 ?auto_176312 ) ( CLEAR ?auto_176311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_176303 ?auto_176304 ?auto_176305 ?auto_176306 ?auto_176307 ?auto_176308 ?auto_176309 ?auto_176310 ?auto_176311 )
      ( MAKE-10PILE ?auto_176303 ?auto_176304 ?auto_176305 ?auto_176306 ?auto_176307 ?auto_176308 ?auto_176309 ?auto_176310 ?auto_176311 ?auto_176312 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176324 - BLOCK
      ?auto_176325 - BLOCK
      ?auto_176326 - BLOCK
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
    )
    :precondition
    ( and ( ON ?auto_176333 ?auto_176334 ) ( ON-TABLE ?auto_176324 ) ( ON ?auto_176325 ?auto_176324 ) ( ON ?auto_176326 ?auto_176325 ) ( ON ?auto_176327 ?auto_176326 ) ( ON ?auto_176328 ?auto_176327 ) ( ON ?auto_176329 ?auto_176328 ) ( ON ?auto_176330 ?auto_176329 ) ( ON ?auto_176331 ?auto_176330 ) ( not ( = ?auto_176324 ?auto_176325 ) ) ( not ( = ?auto_176324 ?auto_176326 ) ) ( not ( = ?auto_176324 ?auto_176327 ) ) ( not ( = ?auto_176324 ?auto_176328 ) ) ( not ( = ?auto_176324 ?auto_176329 ) ) ( not ( = ?auto_176324 ?auto_176330 ) ) ( not ( = ?auto_176324 ?auto_176331 ) ) ( not ( = ?auto_176324 ?auto_176332 ) ) ( not ( = ?auto_176324 ?auto_176333 ) ) ( not ( = ?auto_176324 ?auto_176334 ) ) ( not ( = ?auto_176325 ?auto_176326 ) ) ( not ( = ?auto_176325 ?auto_176327 ) ) ( not ( = ?auto_176325 ?auto_176328 ) ) ( not ( = ?auto_176325 ?auto_176329 ) ) ( not ( = ?auto_176325 ?auto_176330 ) ) ( not ( = ?auto_176325 ?auto_176331 ) ) ( not ( = ?auto_176325 ?auto_176332 ) ) ( not ( = ?auto_176325 ?auto_176333 ) ) ( not ( = ?auto_176325 ?auto_176334 ) ) ( not ( = ?auto_176326 ?auto_176327 ) ) ( not ( = ?auto_176326 ?auto_176328 ) ) ( not ( = ?auto_176326 ?auto_176329 ) ) ( not ( = ?auto_176326 ?auto_176330 ) ) ( not ( = ?auto_176326 ?auto_176331 ) ) ( not ( = ?auto_176326 ?auto_176332 ) ) ( not ( = ?auto_176326 ?auto_176333 ) ) ( not ( = ?auto_176326 ?auto_176334 ) ) ( not ( = ?auto_176327 ?auto_176328 ) ) ( not ( = ?auto_176327 ?auto_176329 ) ) ( not ( = ?auto_176327 ?auto_176330 ) ) ( not ( = ?auto_176327 ?auto_176331 ) ) ( not ( = ?auto_176327 ?auto_176332 ) ) ( not ( = ?auto_176327 ?auto_176333 ) ) ( not ( = ?auto_176327 ?auto_176334 ) ) ( not ( = ?auto_176328 ?auto_176329 ) ) ( not ( = ?auto_176328 ?auto_176330 ) ) ( not ( = ?auto_176328 ?auto_176331 ) ) ( not ( = ?auto_176328 ?auto_176332 ) ) ( not ( = ?auto_176328 ?auto_176333 ) ) ( not ( = ?auto_176328 ?auto_176334 ) ) ( not ( = ?auto_176329 ?auto_176330 ) ) ( not ( = ?auto_176329 ?auto_176331 ) ) ( not ( = ?auto_176329 ?auto_176332 ) ) ( not ( = ?auto_176329 ?auto_176333 ) ) ( not ( = ?auto_176329 ?auto_176334 ) ) ( not ( = ?auto_176330 ?auto_176331 ) ) ( not ( = ?auto_176330 ?auto_176332 ) ) ( not ( = ?auto_176330 ?auto_176333 ) ) ( not ( = ?auto_176330 ?auto_176334 ) ) ( not ( = ?auto_176331 ?auto_176332 ) ) ( not ( = ?auto_176331 ?auto_176333 ) ) ( not ( = ?auto_176331 ?auto_176334 ) ) ( not ( = ?auto_176332 ?auto_176333 ) ) ( not ( = ?auto_176332 ?auto_176334 ) ) ( not ( = ?auto_176333 ?auto_176334 ) ) ( CLEAR ?auto_176331 ) ( ON ?auto_176332 ?auto_176333 ) ( CLEAR ?auto_176332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_176324 ?auto_176325 ?auto_176326 ?auto_176327 ?auto_176328 ?auto_176329 ?auto_176330 ?auto_176331 ?auto_176332 )
      ( MAKE-10PILE ?auto_176324 ?auto_176325 ?auto_176326 ?auto_176327 ?auto_176328 ?auto_176329 ?auto_176330 ?auto_176331 ?auto_176332 ?auto_176333 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176345 - BLOCK
      ?auto_176346 - BLOCK
      ?auto_176347 - BLOCK
      ?auto_176348 - BLOCK
      ?auto_176349 - BLOCK
      ?auto_176350 - BLOCK
      ?auto_176351 - BLOCK
      ?auto_176352 - BLOCK
      ?auto_176353 - BLOCK
      ?auto_176354 - BLOCK
    )
    :vars
    (
      ?auto_176355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176354 ?auto_176355 ) ( ON-TABLE ?auto_176345 ) ( ON ?auto_176346 ?auto_176345 ) ( ON ?auto_176347 ?auto_176346 ) ( ON ?auto_176348 ?auto_176347 ) ( ON ?auto_176349 ?auto_176348 ) ( ON ?auto_176350 ?auto_176349 ) ( ON ?auto_176351 ?auto_176350 ) ( not ( = ?auto_176345 ?auto_176346 ) ) ( not ( = ?auto_176345 ?auto_176347 ) ) ( not ( = ?auto_176345 ?auto_176348 ) ) ( not ( = ?auto_176345 ?auto_176349 ) ) ( not ( = ?auto_176345 ?auto_176350 ) ) ( not ( = ?auto_176345 ?auto_176351 ) ) ( not ( = ?auto_176345 ?auto_176352 ) ) ( not ( = ?auto_176345 ?auto_176353 ) ) ( not ( = ?auto_176345 ?auto_176354 ) ) ( not ( = ?auto_176345 ?auto_176355 ) ) ( not ( = ?auto_176346 ?auto_176347 ) ) ( not ( = ?auto_176346 ?auto_176348 ) ) ( not ( = ?auto_176346 ?auto_176349 ) ) ( not ( = ?auto_176346 ?auto_176350 ) ) ( not ( = ?auto_176346 ?auto_176351 ) ) ( not ( = ?auto_176346 ?auto_176352 ) ) ( not ( = ?auto_176346 ?auto_176353 ) ) ( not ( = ?auto_176346 ?auto_176354 ) ) ( not ( = ?auto_176346 ?auto_176355 ) ) ( not ( = ?auto_176347 ?auto_176348 ) ) ( not ( = ?auto_176347 ?auto_176349 ) ) ( not ( = ?auto_176347 ?auto_176350 ) ) ( not ( = ?auto_176347 ?auto_176351 ) ) ( not ( = ?auto_176347 ?auto_176352 ) ) ( not ( = ?auto_176347 ?auto_176353 ) ) ( not ( = ?auto_176347 ?auto_176354 ) ) ( not ( = ?auto_176347 ?auto_176355 ) ) ( not ( = ?auto_176348 ?auto_176349 ) ) ( not ( = ?auto_176348 ?auto_176350 ) ) ( not ( = ?auto_176348 ?auto_176351 ) ) ( not ( = ?auto_176348 ?auto_176352 ) ) ( not ( = ?auto_176348 ?auto_176353 ) ) ( not ( = ?auto_176348 ?auto_176354 ) ) ( not ( = ?auto_176348 ?auto_176355 ) ) ( not ( = ?auto_176349 ?auto_176350 ) ) ( not ( = ?auto_176349 ?auto_176351 ) ) ( not ( = ?auto_176349 ?auto_176352 ) ) ( not ( = ?auto_176349 ?auto_176353 ) ) ( not ( = ?auto_176349 ?auto_176354 ) ) ( not ( = ?auto_176349 ?auto_176355 ) ) ( not ( = ?auto_176350 ?auto_176351 ) ) ( not ( = ?auto_176350 ?auto_176352 ) ) ( not ( = ?auto_176350 ?auto_176353 ) ) ( not ( = ?auto_176350 ?auto_176354 ) ) ( not ( = ?auto_176350 ?auto_176355 ) ) ( not ( = ?auto_176351 ?auto_176352 ) ) ( not ( = ?auto_176351 ?auto_176353 ) ) ( not ( = ?auto_176351 ?auto_176354 ) ) ( not ( = ?auto_176351 ?auto_176355 ) ) ( not ( = ?auto_176352 ?auto_176353 ) ) ( not ( = ?auto_176352 ?auto_176354 ) ) ( not ( = ?auto_176352 ?auto_176355 ) ) ( not ( = ?auto_176353 ?auto_176354 ) ) ( not ( = ?auto_176353 ?auto_176355 ) ) ( not ( = ?auto_176354 ?auto_176355 ) ) ( ON ?auto_176353 ?auto_176354 ) ( CLEAR ?auto_176351 ) ( ON ?auto_176352 ?auto_176353 ) ( CLEAR ?auto_176352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176345 ?auto_176346 ?auto_176347 ?auto_176348 ?auto_176349 ?auto_176350 ?auto_176351 ?auto_176352 )
      ( MAKE-10PILE ?auto_176345 ?auto_176346 ?auto_176347 ?auto_176348 ?auto_176349 ?auto_176350 ?auto_176351 ?auto_176352 ?auto_176353 ?auto_176354 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176366 - BLOCK
      ?auto_176367 - BLOCK
      ?auto_176368 - BLOCK
      ?auto_176369 - BLOCK
      ?auto_176370 - BLOCK
      ?auto_176371 - BLOCK
      ?auto_176372 - BLOCK
      ?auto_176373 - BLOCK
      ?auto_176374 - BLOCK
      ?auto_176375 - BLOCK
    )
    :vars
    (
      ?auto_176376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176375 ?auto_176376 ) ( ON-TABLE ?auto_176366 ) ( ON ?auto_176367 ?auto_176366 ) ( ON ?auto_176368 ?auto_176367 ) ( ON ?auto_176369 ?auto_176368 ) ( ON ?auto_176370 ?auto_176369 ) ( ON ?auto_176371 ?auto_176370 ) ( ON ?auto_176372 ?auto_176371 ) ( not ( = ?auto_176366 ?auto_176367 ) ) ( not ( = ?auto_176366 ?auto_176368 ) ) ( not ( = ?auto_176366 ?auto_176369 ) ) ( not ( = ?auto_176366 ?auto_176370 ) ) ( not ( = ?auto_176366 ?auto_176371 ) ) ( not ( = ?auto_176366 ?auto_176372 ) ) ( not ( = ?auto_176366 ?auto_176373 ) ) ( not ( = ?auto_176366 ?auto_176374 ) ) ( not ( = ?auto_176366 ?auto_176375 ) ) ( not ( = ?auto_176366 ?auto_176376 ) ) ( not ( = ?auto_176367 ?auto_176368 ) ) ( not ( = ?auto_176367 ?auto_176369 ) ) ( not ( = ?auto_176367 ?auto_176370 ) ) ( not ( = ?auto_176367 ?auto_176371 ) ) ( not ( = ?auto_176367 ?auto_176372 ) ) ( not ( = ?auto_176367 ?auto_176373 ) ) ( not ( = ?auto_176367 ?auto_176374 ) ) ( not ( = ?auto_176367 ?auto_176375 ) ) ( not ( = ?auto_176367 ?auto_176376 ) ) ( not ( = ?auto_176368 ?auto_176369 ) ) ( not ( = ?auto_176368 ?auto_176370 ) ) ( not ( = ?auto_176368 ?auto_176371 ) ) ( not ( = ?auto_176368 ?auto_176372 ) ) ( not ( = ?auto_176368 ?auto_176373 ) ) ( not ( = ?auto_176368 ?auto_176374 ) ) ( not ( = ?auto_176368 ?auto_176375 ) ) ( not ( = ?auto_176368 ?auto_176376 ) ) ( not ( = ?auto_176369 ?auto_176370 ) ) ( not ( = ?auto_176369 ?auto_176371 ) ) ( not ( = ?auto_176369 ?auto_176372 ) ) ( not ( = ?auto_176369 ?auto_176373 ) ) ( not ( = ?auto_176369 ?auto_176374 ) ) ( not ( = ?auto_176369 ?auto_176375 ) ) ( not ( = ?auto_176369 ?auto_176376 ) ) ( not ( = ?auto_176370 ?auto_176371 ) ) ( not ( = ?auto_176370 ?auto_176372 ) ) ( not ( = ?auto_176370 ?auto_176373 ) ) ( not ( = ?auto_176370 ?auto_176374 ) ) ( not ( = ?auto_176370 ?auto_176375 ) ) ( not ( = ?auto_176370 ?auto_176376 ) ) ( not ( = ?auto_176371 ?auto_176372 ) ) ( not ( = ?auto_176371 ?auto_176373 ) ) ( not ( = ?auto_176371 ?auto_176374 ) ) ( not ( = ?auto_176371 ?auto_176375 ) ) ( not ( = ?auto_176371 ?auto_176376 ) ) ( not ( = ?auto_176372 ?auto_176373 ) ) ( not ( = ?auto_176372 ?auto_176374 ) ) ( not ( = ?auto_176372 ?auto_176375 ) ) ( not ( = ?auto_176372 ?auto_176376 ) ) ( not ( = ?auto_176373 ?auto_176374 ) ) ( not ( = ?auto_176373 ?auto_176375 ) ) ( not ( = ?auto_176373 ?auto_176376 ) ) ( not ( = ?auto_176374 ?auto_176375 ) ) ( not ( = ?auto_176374 ?auto_176376 ) ) ( not ( = ?auto_176375 ?auto_176376 ) ) ( ON ?auto_176374 ?auto_176375 ) ( CLEAR ?auto_176372 ) ( ON ?auto_176373 ?auto_176374 ) ( CLEAR ?auto_176373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176366 ?auto_176367 ?auto_176368 ?auto_176369 ?auto_176370 ?auto_176371 ?auto_176372 ?auto_176373 )
      ( MAKE-10PILE ?auto_176366 ?auto_176367 ?auto_176368 ?auto_176369 ?auto_176370 ?auto_176371 ?auto_176372 ?auto_176373 ?auto_176374 ?auto_176375 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176387 - BLOCK
      ?auto_176388 - BLOCK
      ?auto_176389 - BLOCK
      ?auto_176390 - BLOCK
      ?auto_176391 - BLOCK
      ?auto_176392 - BLOCK
      ?auto_176393 - BLOCK
      ?auto_176394 - BLOCK
      ?auto_176395 - BLOCK
      ?auto_176396 - BLOCK
    )
    :vars
    (
      ?auto_176397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176396 ?auto_176397 ) ( ON-TABLE ?auto_176387 ) ( ON ?auto_176388 ?auto_176387 ) ( ON ?auto_176389 ?auto_176388 ) ( ON ?auto_176390 ?auto_176389 ) ( ON ?auto_176391 ?auto_176390 ) ( ON ?auto_176392 ?auto_176391 ) ( not ( = ?auto_176387 ?auto_176388 ) ) ( not ( = ?auto_176387 ?auto_176389 ) ) ( not ( = ?auto_176387 ?auto_176390 ) ) ( not ( = ?auto_176387 ?auto_176391 ) ) ( not ( = ?auto_176387 ?auto_176392 ) ) ( not ( = ?auto_176387 ?auto_176393 ) ) ( not ( = ?auto_176387 ?auto_176394 ) ) ( not ( = ?auto_176387 ?auto_176395 ) ) ( not ( = ?auto_176387 ?auto_176396 ) ) ( not ( = ?auto_176387 ?auto_176397 ) ) ( not ( = ?auto_176388 ?auto_176389 ) ) ( not ( = ?auto_176388 ?auto_176390 ) ) ( not ( = ?auto_176388 ?auto_176391 ) ) ( not ( = ?auto_176388 ?auto_176392 ) ) ( not ( = ?auto_176388 ?auto_176393 ) ) ( not ( = ?auto_176388 ?auto_176394 ) ) ( not ( = ?auto_176388 ?auto_176395 ) ) ( not ( = ?auto_176388 ?auto_176396 ) ) ( not ( = ?auto_176388 ?auto_176397 ) ) ( not ( = ?auto_176389 ?auto_176390 ) ) ( not ( = ?auto_176389 ?auto_176391 ) ) ( not ( = ?auto_176389 ?auto_176392 ) ) ( not ( = ?auto_176389 ?auto_176393 ) ) ( not ( = ?auto_176389 ?auto_176394 ) ) ( not ( = ?auto_176389 ?auto_176395 ) ) ( not ( = ?auto_176389 ?auto_176396 ) ) ( not ( = ?auto_176389 ?auto_176397 ) ) ( not ( = ?auto_176390 ?auto_176391 ) ) ( not ( = ?auto_176390 ?auto_176392 ) ) ( not ( = ?auto_176390 ?auto_176393 ) ) ( not ( = ?auto_176390 ?auto_176394 ) ) ( not ( = ?auto_176390 ?auto_176395 ) ) ( not ( = ?auto_176390 ?auto_176396 ) ) ( not ( = ?auto_176390 ?auto_176397 ) ) ( not ( = ?auto_176391 ?auto_176392 ) ) ( not ( = ?auto_176391 ?auto_176393 ) ) ( not ( = ?auto_176391 ?auto_176394 ) ) ( not ( = ?auto_176391 ?auto_176395 ) ) ( not ( = ?auto_176391 ?auto_176396 ) ) ( not ( = ?auto_176391 ?auto_176397 ) ) ( not ( = ?auto_176392 ?auto_176393 ) ) ( not ( = ?auto_176392 ?auto_176394 ) ) ( not ( = ?auto_176392 ?auto_176395 ) ) ( not ( = ?auto_176392 ?auto_176396 ) ) ( not ( = ?auto_176392 ?auto_176397 ) ) ( not ( = ?auto_176393 ?auto_176394 ) ) ( not ( = ?auto_176393 ?auto_176395 ) ) ( not ( = ?auto_176393 ?auto_176396 ) ) ( not ( = ?auto_176393 ?auto_176397 ) ) ( not ( = ?auto_176394 ?auto_176395 ) ) ( not ( = ?auto_176394 ?auto_176396 ) ) ( not ( = ?auto_176394 ?auto_176397 ) ) ( not ( = ?auto_176395 ?auto_176396 ) ) ( not ( = ?auto_176395 ?auto_176397 ) ) ( not ( = ?auto_176396 ?auto_176397 ) ) ( ON ?auto_176395 ?auto_176396 ) ( ON ?auto_176394 ?auto_176395 ) ( CLEAR ?auto_176392 ) ( ON ?auto_176393 ?auto_176394 ) ( CLEAR ?auto_176393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176387 ?auto_176388 ?auto_176389 ?auto_176390 ?auto_176391 ?auto_176392 ?auto_176393 )
      ( MAKE-10PILE ?auto_176387 ?auto_176388 ?auto_176389 ?auto_176390 ?auto_176391 ?auto_176392 ?auto_176393 ?auto_176394 ?auto_176395 ?auto_176396 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176408 - BLOCK
      ?auto_176409 - BLOCK
      ?auto_176410 - BLOCK
      ?auto_176411 - BLOCK
      ?auto_176412 - BLOCK
      ?auto_176413 - BLOCK
      ?auto_176414 - BLOCK
      ?auto_176415 - BLOCK
      ?auto_176416 - BLOCK
      ?auto_176417 - BLOCK
    )
    :vars
    (
      ?auto_176418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176417 ?auto_176418 ) ( ON-TABLE ?auto_176408 ) ( ON ?auto_176409 ?auto_176408 ) ( ON ?auto_176410 ?auto_176409 ) ( ON ?auto_176411 ?auto_176410 ) ( ON ?auto_176412 ?auto_176411 ) ( ON ?auto_176413 ?auto_176412 ) ( not ( = ?auto_176408 ?auto_176409 ) ) ( not ( = ?auto_176408 ?auto_176410 ) ) ( not ( = ?auto_176408 ?auto_176411 ) ) ( not ( = ?auto_176408 ?auto_176412 ) ) ( not ( = ?auto_176408 ?auto_176413 ) ) ( not ( = ?auto_176408 ?auto_176414 ) ) ( not ( = ?auto_176408 ?auto_176415 ) ) ( not ( = ?auto_176408 ?auto_176416 ) ) ( not ( = ?auto_176408 ?auto_176417 ) ) ( not ( = ?auto_176408 ?auto_176418 ) ) ( not ( = ?auto_176409 ?auto_176410 ) ) ( not ( = ?auto_176409 ?auto_176411 ) ) ( not ( = ?auto_176409 ?auto_176412 ) ) ( not ( = ?auto_176409 ?auto_176413 ) ) ( not ( = ?auto_176409 ?auto_176414 ) ) ( not ( = ?auto_176409 ?auto_176415 ) ) ( not ( = ?auto_176409 ?auto_176416 ) ) ( not ( = ?auto_176409 ?auto_176417 ) ) ( not ( = ?auto_176409 ?auto_176418 ) ) ( not ( = ?auto_176410 ?auto_176411 ) ) ( not ( = ?auto_176410 ?auto_176412 ) ) ( not ( = ?auto_176410 ?auto_176413 ) ) ( not ( = ?auto_176410 ?auto_176414 ) ) ( not ( = ?auto_176410 ?auto_176415 ) ) ( not ( = ?auto_176410 ?auto_176416 ) ) ( not ( = ?auto_176410 ?auto_176417 ) ) ( not ( = ?auto_176410 ?auto_176418 ) ) ( not ( = ?auto_176411 ?auto_176412 ) ) ( not ( = ?auto_176411 ?auto_176413 ) ) ( not ( = ?auto_176411 ?auto_176414 ) ) ( not ( = ?auto_176411 ?auto_176415 ) ) ( not ( = ?auto_176411 ?auto_176416 ) ) ( not ( = ?auto_176411 ?auto_176417 ) ) ( not ( = ?auto_176411 ?auto_176418 ) ) ( not ( = ?auto_176412 ?auto_176413 ) ) ( not ( = ?auto_176412 ?auto_176414 ) ) ( not ( = ?auto_176412 ?auto_176415 ) ) ( not ( = ?auto_176412 ?auto_176416 ) ) ( not ( = ?auto_176412 ?auto_176417 ) ) ( not ( = ?auto_176412 ?auto_176418 ) ) ( not ( = ?auto_176413 ?auto_176414 ) ) ( not ( = ?auto_176413 ?auto_176415 ) ) ( not ( = ?auto_176413 ?auto_176416 ) ) ( not ( = ?auto_176413 ?auto_176417 ) ) ( not ( = ?auto_176413 ?auto_176418 ) ) ( not ( = ?auto_176414 ?auto_176415 ) ) ( not ( = ?auto_176414 ?auto_176416 ) ) ( not ( = ?auto_176414 ?auto_176417 ) ) ( not ( = ?auto_176414 ?auto_176418 ) ) ( not ( = ?auto_176415 ?auto_176416 ) ) ( not ( = ?auto_176415 ?auto_176417 ) ) ( not ( = ?auto_176415 ?auto_176418 ) ) ( not ( = ?auto_176416 ?auto_176417 ) ) ( not ( = ?auto_176416 ?auto_176418 ) ) ( not ( = ?auto_176417 ?auto_176418 ) ) ( ON ?auto_176416 ?auto_176417 ) ( ON ?auto_176415 ?auto_176416 ) ( CLEAR ?auto_176413 ) ( ON ?auto_176414 ?auto_176415 ) ( CLEAR ?auto_176414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176408 ?auto_176409 ?auto_176410 ?auto_176411 ?auto_176412 ?auto_176413 ?auto_176414 )
      ( MAKE-10PILE ?auto_176408 ?auto_176409 ?auto_176410 ?auto_176411 ?auto_176412 ?auto_176413 ?auto_176414 ?auto_176415 ?auto_176416 ?auto_176417 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176429 - BLOCK
      ?auto_176430 - BLOCK
      ?auto_176431 - BLOCK
      ?auto_176432 - BLOCK
      ?auto_176433 - BLOCK
      ?auto_176434 - BLOCK
      ?auto_176435 - BLOCK
      ?auto_176436 - BLOCK
      ?auto_176437 - BLOCK
      ?auto_176438 - BLOCK
    )
    :vars
    (
      ?auto_176439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176438 ?auto_176439 ) ( ON-TABLE ?auto_176429 ) ( ON ?auto_176430 ?auto_176429 ) ( ON ?auto_176431 ?auto_176430 ) ( ON ?auto_176432 ?auto_176431 ) ( ON ?auto_176433 ?auto_176432 ) ( not ( = ?auto_176429 ?auto_176430 ) ) ( not ( = ?auto_176429 ?auto_176431 ) ) ( not ( = ?auto_176429 ?auto_176432 ) ) ( not ( = ?auto_176429 ?auto_176433 ) ) ( not ( = ?auto_176429 ?auto_176434 ) ) ( not ( = ?auto_176429 ?auto_176435 ) ) ( not ( = ?auto_176429 ?auto_176436 ) ) ( not ( = ?auto_176429 ?auto_176437 ) ) ( not ( = ?auto_176429 ?auto_176438 ) ) ( not ( = ?auto_176429 ?auto_176439 ) ) ( not ( = ?auto_176430 ?auto_176431 ) ) ( not ( = ?auto_176430 ?auto_176432 ) ) ( not ( = ?auto_176430 ?auto_176433 ) ) ( not ( = ?auto_176430 ?auto_176434 ) ) ( not ( = ?auto_176430 ?auto_176435 ) ) ( not ( = ?auto_176430 ?auto_176436 ) ) ( not ( = ?auto_176430 ?auto_176437 ) ) ( not ( = ?auto_176430 ?auto_176438 ) ) ( not ( = ?auto_176430 ?auto_176439 ) ) ( not ( = ?auto_176431 ?auto_176432 ) ) ( not ( = ?auto_176431 ?auto_176433 ) ) ( not ( = ?auto_176431 ?auto_176434 ) ) ( not ( = ?auto_176431 ?auto_176435 ) ) ( not ( = ?auto_176431 ?auto_176436 ) ) ( not ( = ?auto_176431 ?auto_176437 ) ) ( not ( = ?auto_176431 ?auto_176438 ) ) ( not ( = ?auto_176431 ?auto_176439 ) ) ( not ( = ?auto_176432 ?auto_176433 ) ) ( not ( = ?auto_176432 ?auto_176434 ) ) ( not ( = ?auto_176432 ?auto_176435 ) ) ( not ( = ?auto_176432 ?auto_176436 ) ) ( not ( = ?auto_176432 ?auto_176437 ) ) ( not ( = ?auto_176432 ?auto_176438 ) ) ( not ( = ?auto_176432 ?auto_176439 ) ) ( not ( = ?auto_176433 ?auto_176434 ) ) ( not ( = ?auto_176433 ?auto_176435 ) ) ( not ( = ?auto_176433 ?auto_176436 ) ) ( not ( = ?auto_176433 ?auto_176437 ) ) ( not ( = ?auto_176433 ?auto_176438 ) ) ( not ( = ?auto_176433 ?auto_176439 ) ) ( not ( = ?auto_176434 ?auto_176435 ) ) ( not ( = ?auto_176434 ?auto_176436 ) ) ( not ( = ?auto_176434 ?auto_176437 ) ) ( not ( = ?auto_176434 ?auto_176438 ) ) ( not ( = ?auto_176434 ?auto_176439 ) ) ( not ( = ?auto_176435 ?auto_176436 ) ) ( not ( = ?auto_176435 ?auto_176437 ) ) ( not ( = ?auto_176435 ?auto_176438 ) ) ( not ( = ?auto_176435 ?auto_176439 ) ) ( not ( = ?auto_176436 ?auto_176437 ) ) ( not ( = ?auto_176436 ?auto_176438 ) ) ( not ( = ?auto_176436 ?auto_176439 ) ) ( not ( = ?auto_176437 ?auto_176438 ) ) ( not ( = ?auto_176437 ?auto_176439 ) ) ( not ( = ?auto_176438 ?auto_176439 ) ) ( ON ?auto_176437 ?auto_176438 ) ( ON ?auto_176436 ?auto_176437 ) ( ON ?auto_176435 ?auto_176436 ) ( CLEAR ?auto_176433 ) ( ON ?auto_176434 ?auto_176435 ) ( CLEAR ?auto_176434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176429 ?auto_176430 ?auto_176431 ?auto_176432 ?auto_176433 ?auto_176434 )
      ( MAKE-10PILE ?auto_176429 ?auto_176430 ?auto_176431 ?auto_176432 ?auto_176433 ?auto_176434 ?auto_176435 ?auto_176436 ?auto_176437 ?auto_176438 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176450 - BLOCK
      ?auto_176451 - BLOCK
      ?auto_176452 - BLOCK
      ?auto_176453 - BLOCK
      ?auto_176454 - BLOCK
      ?auto_176455 - BLOCK
      ?auto_176456 - BLOCK
      ?auto_176457 - BLOCK
      ?auto_176458 - BLOCK
      ?auto_176459 - BLOCK
    )
    :vars
    (
      ?auto_176460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176459 ?auto_176460 ) ( ON-TABLE ?auto_176450 ) ( ON ?auto_176451 ?auto_176450 ) ( ON ?auto_176452 ?auto_176451 ) ( ON ?auto_176453 ?auto_176452 ) ( ON ?auto_176454 ?auto_176453 ) ( not ( = ?auto_176450 ?auto_176451 ) ) ( not ( = ?auto_176450 ?auto_176452 ) ) ( not ( = ?auto_176450 ?auto_176453 ) ) ( not ( = ?auto_176450 ?auto_176454 ) ) ( not ( = ?auto_176450 ?auto_176455 ) ) ( not ( = ?auto_176450 ?auto_176456 ) ) ( not ( = ?auto_176450 ?auto_176457 ) ) ( not ( = ?auto_176450 ?auto_176458 ) ) ( not ( = ?auto_176450 ?auto_176459 ) ) ( not ( = ?auto_176450 ?auto_176460 ) ) ( not ( = ?auto_176451 ?auto_176452 ) ) ( not ( = ?auto_176451 ?auto_176453 ) ) ( not ( = ?auto_176451 ?auto_176454 ) ) ( not ( = ?auto_176451 ?auto_176455 ) ) ( not ( = ?auto_176451 ?auto_176456 ) ) ( not ( = ?auto_176451 ?auto_176457 ) ) ( not ( = ?auto_176451 ?auto_176458 ) ) ( not ( = ?auto_176451 ?auto_176459 ) ) ( not ( = ?auto_176451 ?auto_176460 ) ) ( not ( = ?auto_176452 ?auto_176453 ) ) ( not ( = ?auto_176452 ?auto_176454 ) ) ( not ( = ?auto_176452 ?auto_176455 ) ) ( not ( = ?auto_176452 ?auto_176456 ) ) ( not ( = ?auto_176452 ?auto_176457 ) ) ( not ( = ?auto_176452 ?auto_176458 ) ) ( not ( = ?auto_176452 ?auto_176459 ) ) ( not ( = ?auto_176452 ?auto_176460 ) ) ( not ( = ?auto_176453 ?auto_176454 ) ) ( not ( = ?auto_176453 ?auto_176455 ) ) ( not ( = ?auto_176453 ?auto_176456 ) ) ( not ( = ?auto_176453 ?auto_176457 ) ) ( not ( = ?auto_176453 ?auto_176458 ) ) ( not ( = ?auto_176453 ?auto_176459 ) ) ( not ( = ?auto_176453 ?auto_176460 ) ) ( not ( = ?auto_176454 ?auto_176455 ) ) ( not ( = ?auto_176454 ?auto_176456 ) ) ( not ( = ?auto_176454 ?auto_176457 ) ) ( not ( = ?auto_176454 ?auto_176458 ) ) ( not ( = ?auto_176454 ?auto_176459 ) ) ( not ( = ?auto_176454 ?auto_176460 ) ) ( not ( = ?auto_176455 ?auto_176456 ) ) ( not ( = ?auto_176455 ?auto_176457 ) ) ( not ( = ?auto_176455 ?auto_176458 ) ) ( not ( = ?auto_176455 ?auto_176459 ) ) ( not ( = ?auto_176455 ?auto_176460 ) ) ( not ( = ?auto_176456 ?auto_176457 ) ) ( not ( = ?auto_176456 ?auto_176458 ) ) ( not ( = ?auto_176456 ?auto_176459 ) ) ( not ( = ?auto_176456 ?auto_176460 ) ) ( not ( = ?auto_176457 ?auto_176458 ) ) ( not ( = ?auto_176457 ?auto_176459 ) ) ( not ( = ?auto_176457 ?auto_176460 ) ) ( not ( = ?auto_176458 ?auto_176459 ) ) ( not ( = ?auto_176458 ?auto_176460 ) ) ( not ( = ?auto_176459 ?auto_176460 ) ) ( ON ?auto_176458 ?auto_176459 ) ( ON ?auto_176457 ?auto_176458 ) ( ON ?auto_176456 ?auto_176457 ) ( CLEAR ?auto_176454 ) ( ON ?auto_176455 ?auto_176456 ) ( CLEAR ?auto_176455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176450 ?auto_176451 ?auto_176452 ?auto_176453 ?auto_176454 ?auto_176455 )
      ( MAKE-10PILE ?auto_176450 ?auto_176451 ?auto_176452 ?auto_176453 ?auto_176454 ?auto_176455 ?auto_176456 ?auto_176457 ?auto_176458 ?auto_176459 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176471 - BLOCK
      ?auto_176472 - BLOCK
      ?auto_176473 - BLOCK
      ?auto_176474 - BLOCK
      ?auto_176475 - BLOCK
      ?auto_176476 - BLOCK
      ?auto_176477 - BLOCK
      ?auto_176478 - BLOCK
      ?auto_176479 - BLOCK
      ?auto_176480 - BLOCK
    )
    :vars
    (
      ?auto_176481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176480 ?auto_176481 ) ( ON-TABLE ?auto_176471 ) ( ON ?auto_176472 ?auto_176471 ) ( ON ?auto_176473 ?auto_176472 ) ( ON ?auto_176474 ?auto_176473 ) ( not ( = ?auto_176471 ?auto_176472 ) ) ( not ( = ?auto_176471 ?auto_176473 ) ) ( not ( = ?auto_176471 ?auto_176474 ) ) ( not ( = ?auto_176471 ?auto_176475 ) ) ( not ( = ?auto_176471 ?auto_176476 ) ) ( not ( = ?auto_176471 ?auto_176477 ) ) ( not ( = ?auto_176471 ?auto_176478 ) ) ( not ( = ?auto_176471 ?auto_176479 ) ) ( not ( = ?auto_176471 ?auto_176480 ) ) ( not ( = ?auto_176471 ?auto_176481 ) ) ( not ( = ?auto_176472 ?auto_176473 ) ) ( not ( = ?auto_176472 ?auto_176474 ) ) ( not ( = ?auto_176472 ?auto_176475 ) ) ( not ( = ?auto_176472 ?auto_176476 ) ) ( not ( = ?auto_176472 ?auto_176477 ) ) ( not ( = ?auto_176472 ?auto_176478 ) ) ( not ( = ?auto_176472 ?auto_176479 ) ) ( not ( = ?auto_176472 ?auto_176480 ) ) ( not ( = ?auto_176472 ?auto_176481 ) ) ( not ( = ?auto_176473 ?auto_176474 ) ) ( not ( = ?auto_176473 ?auto_176475 ) ) ( not ( = ?auto_176473 ?auto_176476 ) ) ( not ( = ?auto_176473 ?auto_176477 ) ) ( not ( = ?auto_176473 ?auto_176478 ) ) ( not ( = ?auto_176473 ?auto_176479 ) ) ( not ( = ?auto_176473 ?auto_176480 ) ) ( not ( = ?auto_176473 ?auto_176481 ) ) ( not ( = ?auto_176474 ?auto_176475 ) ) ( not ( = ?auto_176474 ?auto_176476 ) ) ( not ( = ?auto_176474 ?auto_176477 ) ) ( not ( = ?auto_176474 ?auto_176478 ) ) ( not ( = ?auto_176474 ?auto_176479 ) ) ( not ( = ?auto_176474 ?auto_176480 ) ) ( not ( = ?auto_176474 ?auto_176481 ) ) ( not ( = ?auto_176475 ?auto_176476 ) ) ( not ( = ?auto_176475 ?auto_176477 ) ) ( not ( = ?auto_176475 ?auto_176478 ) ) ( not ( = ?auto_176475 ?auto_176479 ) ) ( not ( = ?auto_176475 ?auto_176480 ) ) ( not ( = ?auto_176475 ?auto_176481 ) ) ( not ( = ?auto_176476 ?auto_176477 ) ) ( not ( = ?auto_176476 ?auto_176478 ) ) ( not ( = ?auto_176476 ?auto_176479 ) ) ( not ( = ?auto_176476 ?auto_176480 ) ) ( not ( = ?auto_176476 ?auto_176481 ) ) ( not ( = ?auto_176477 ?auto_176478 ) ) ( not ( = ?auto_176477 ?auto_176479 ) ) ( not ( = ?auto_176477 ?auto_176480 ) ) ( not ( = ?auto_176477 ?auto_176481 ) ) ( not ( = ?auto_176478 ?auto_176479 ) ) ( not ( = ?auto_176478 ?auto_176480 ) ) ( not ( = ?auto_176478 ?auto_176481 ) ) ( not ( = ?auto_176479 ?auto_176480 ) ) ( not ( = ?auto_176479 ?auto_176481 ) ) ( not ( = ?auto_176480 ?auto_176481 ) ) ( ON ?auto_176479 ?auto_176480 ) ( ON ?auto_176478 ?auto_176479 ) ( ON ?auto_176477 ?auto_176478 ) ( ON ?auto_176476 ?auto_176477 ) ( CLEAR ?auto_176474 ) ( ON ?auto_176475 ?auto_176476 ) ( CLEAR ?auto_176475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176471 ?auto_176472 ?auto_176473 ?auto_176474 ?auto_176475 )
      ( MAKE-10PILE ?auto_176471 ?auto_176472 ?auto_176473 ?auto_176474 ?auto_176475 ?auto_176476 ?auto_176477 ?auto_176478 ?auto_176479 ?auto_176480 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176492 - BLOCK
      ?auto_176493 - BLOCK
      ?auto_176494 - BLOCK
      ?auto_176495 - BLOCK
      ?auto_176496 - BLOCK
      ?auto_176497 - BLOCK
      ?auto_176498 - BLOCK
      ?auto_176499 - BLOCK
      ?auto_176500 - BLOCK
      ?auto_176501 - BLOCK
    )
    :vars
    (
      ?auto_176502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176501 ?auto_176502 ) ( ON-TABLE ?auto_176492 ) ( ON ?auto_176493 ?auto_176492 ) ( ON ?auto_176494 ?auto_176493 ) ( ON ?auto_176495 ?auto_176494 ) ( not ( = ?auto_176492 ?auto_176493 ) ) ( not ( = ?auto_176492 ?auto_176494 ) ) ( not ( = ?auto_176492 ?auto_176495 ) ) ( not ( = ?auto_176492 ?auto_176496 ) ) ( not ( = ?auto_176492 ?auto_176497 ) ) ( not ( = ?auto_176492 ?auto_176498 ) ) ( not ( = ?auto_176492 ?auto_176499 ) ) ( not ( = ?auto_176492 ?auto_176500 ) ) ( not ( = ?auto_176492 ?auto_176501 ) ) ( not ( = ?auto_176492 ?auto_176502 ) ) ( not ( = ?auto_176493 ?auto_176494 ) ) ( not ( = ?auto_176493 ?auto_176495 ) ) ( not ( = ?auto_176493 ?auto_176496 ) ) ( not ( = ?auto_176493 ?auto_176497 ) ) ( not ( = ?auto_176493 ?auto_176498 ) ) ( not ( = ?auto_176493 ?auto_176499 ) ) ( not ( = ?auto_176493 ?auto_176500 ) ) ( not ( = ?auto_176493 ?auto_176501 ) ) ( not ( = ?auto_176493 ?auto_176502 ) ) ( not ( = ?auto_176494 ?auto_176495 ) ) ( not ( = ?auto_176494 ?auto_176496 ) ) ( not ( = ?auto_176494 ?auto_176497 ) ) ( not ( = ?auto_176494 ?auto_176498 ) ) ( not ( = ?auto_176494 ?auto_176499 ) ) ( not ( = ?auto_176494 ?auto_176500 ) ) ( not ( = ?auto_176494 ?auto_176501 ) ) ( not ( = ?auto_176494 ?auto_176502 ) ) ( not ( = ?auto_176495 ?auto_176496 ) ) ( not ( = ?auto_176495 ?auto_176497 ) ) ( not ( = ?auto_176495 ?auto_176498 ) ) ( not ( = ?auto_176495 ?auto_176499 ) ) ( not ( = ?auto_176495 ?auto_176500 ) ) ( not ( = ?auto_176495 ?auto_176501 ) ) ( not ( = ?auto_176495 ?auto_176502 ) ) ( not ( = ?auto_176496 ?auto_176497 ) ) ( not ( = ?auto_176496 ?auto_176498 ) ) ( not ( = ?auto_176496 ?auto_176499 ) ) ( not ( = ?auto_176496 ?auto_176500 ) ) ( not ( = ?auto_176496 ?auto_176501 ) ) ( not ( = ?auto_176496 ?auto_176502 ) ) ( not ( = ?auto_176497 ?auto_176498 ) ) ( not ( = ?auto_176497 ?auto_176499 ) ) ( not ( = ?auto_176497 ?auto_176500 ) ) ( not ( = ?auto_176497 ?auto_176501 ) ) ( not ( = ?auto_176497 ?auto_176502 ) ) ( not ( = ?auto_176498 ?auto_176499 ) ) ( not ( = ?auto_176498 ?auto_176500 ) ) ( not ( = ?auto_176498 ?auto_176501 ) ) ( not ( = ?auto_176498 ?auto_176502 ) ) ( not ( = ?auto_176499 ?auto_176500 ) ) ( not ( = ?auto_176499 ?auto_176501 ) ) ( not ( = ?auto_176499 ?auto_176502 ) ) ( not ( = ?auto_176500 ?auto_176501 ) ) ( not ( = ?auto_176500 ?auto_176502 ) ) ( not ( = ?auto_176501 ?auto_176502 ) ) ( ON ?auto_176500 ?auto_176501 ) ( ON ?auto_176499 ?auto_176500 ) ( ON ?auto_176498 ?auto_176499 ) ( ON ?auto_176497 ?auto_176498 ) ( CLEAR ?auto_176495 ) ( ON ?auto_176496 ?auto_176497 ) ( CLEAR ?auto_176496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176492 ?auto_176493 ?auto_176494 ?auto_176495 ?auto_176496 )
      ( MAKE-10PILE ?auto_176492 ?auto_176493 ?auto_176494 ?auto_176495 ?auto_176496 ?auto_176497 ?auto_176498 ?auto_176499 ?auto_176500 ?auto_176501 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176513 - BLOCK
      ?auto_176514 - BLOCK
      ?auto_176515 - BLOCK
      ?auto_176516 - BLOCK
      ?auto_176517 - BLOCK
      ?auto_176518 - BLOCK
      ?auto_176519 - BLOCK
      ?auto_176520 - BLOCK
      ?auto_176521 - BLOCK
      ?auto_176522 - BLOCK
    )
    :vars
    (
      ?auto_176523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176522 ?auto_176523 ) ( ON-TABLE ?auto_176513 ) ( ON ?auto_176514 ?auto_176513 ) ( ON ?auto_176515 ?auto_176514 ) ( not ( = ?auto_176513 ?auto_176514 ) ) ( not ( = ?auto_176513 ?auto_176515 ) ) ( not ( = ?auto_176513 ?auto_176516 ) ) ( not ( = ?auto_176513 ?auto_176517 ) ) ( not ( = ?auto_176513 ?auto_176518 ) ) ( not ( = ?auto_176513 ?auto_176519 ) ) ( not ( = ?auto_176513 ?auto_176520 ) ) ( not ( = ?auto_176513 ?auto_176521 ) ) ( not ( = ?auto_176513 ?auto_176522 ) ) ( not ( = ?auto_176513 ?auto_176523 ) ) ( not ( = ?auto_176514 ?auto_176515 ) ) ( not ( = ?auto_176514 ?auto_176516 ) ) ( not ( = ?auto_176514 ?auto_176517 ) ) ( not ( = ?auto_176514 ?auto_176518 ) ) ( not ( = ?auto_176514 ?auto_176519 ) ) ( not ( = ?auto_176514 ?auto_176520 ) ) ( not ( = ?auto_176514 ?auto_176521 ) ) ( not ( = ?auto_176514 ?auto_176522 ) ) ( not ( = ?auto_176514 ?auto_176523 ) ) ( not ( = ?auto_176515 ?auto_176516 ) ) ( not ( = ?auto_176515 ?auto_176517 ) ) ( not ( = ?auto_176515 ?auto_176518 ) ) ( not ( = ?auto_176515 ?auto_176519 ) ) ( not ( = ?auto_176515 ?auto_176520 ) ) ( not ( = ?auto_176515 ?auto_176521 ) ) ( not ( = ?auto_176515 ?auto_176522 ) ) ( not ( = ?auto_176515 ?auto_176523 ) ) ( not ( = ?auto_176516 ?auto_176517 ) ) ( not ( = ?auto_176516 ?auto_176518 ) ) ( not ( = ?auto_176516 ?auto_176519 ) ) ( not ( = ?auto_176516 ?auto_176520 ) ) ( not ( = ?auto_176516 ?auto_176521 ) ) ( not ( = ?auto_176516 ?auto_176522 ) ) ( not ( = ?auto_176516 ?auto_176523 ) ) ( not ( = ?auto_176517 ?auto_176518 ) ) ( not ( = ?auto_176517 ?auto_176519 ) ) ( not ( = ?auto_176517 ?auto_176520 ) ) ( not ( = ?auto_176517 ?auto_176521 ) ) ( not ( = ?auto_176517 ?auto_176522 ) ) ( not ( = ?auto_176517 ?auto_176523 ) ) ( not ( = ?auto_176518 ?auto_176519 ) ) ( not ( = ?auto_176518 ?auto_176520 ) ) ( not ( = ?auto_176518 ?auto_176521 ) ) ( not ( = ?auto_176518 ?auto_176522 ) ) ( not ( = ?auto_176518 ?auto_176523 ) ) ( not ( = ?auto_176519 ?auto_176520 ) ) ( not ( = ?auto_176519 ?auto_176521 ) ) ( not ( = ?auto_176519 ?auto_176522 ) ) ( not ( = ?auto_176519 ?auto_176523 ) ) ( not ( = ?auto_176520 ?auto_176521 ) ) ( not ( = ?auto_176520 ?auto_176522 ) ) ( not ( = ?auto_176520 ?auto_176523 ) ) ( not ( = ?auto_176521 ?auto_176522 ) ) ( not ( = ?auto_176521 ?auto_176523 ) ) ( not ( = ?auto_176522 ?auto_176523 ) ) ( ON ?auto_176521 ?auto_176522 ) ( ON ?auto_176520 ?auto_176521 ) ( ON ?auto_176519 ?auto_176520 ) ( ON ?auto_176518 ?auto_176519 ) ( ON ?auto_176517 ?auto_176518 ) ( CLEAR ?auto_176515 ) ( ON ?auto_176516 ?auto_176517 ) ( CLEAR ?auto_176516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176513 ?auto_176514 ?auto_176515 ?auto_176516 )
      ( MAKE-10PILE ?auto_176513 ?auto_176514 ?auto_176515 ?auto_176516 ?auto_176517 ?auto_176518 ?auto_176519 ?auto_176520 ?auto_176521 ?auto_176522 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176534 - BLOCK
      ?auto_176535 - BLOCK
      ?auto_176536 - BLOCK
      ?auto_176537 - BLOCK
      ?auto_176538 - BLOCK
      ?auto_176539 - BLOCK
      ?auto_176540 - BLOCK
      ?auto_176541 - BLOCK
      ?auto_176542 - BLOCK
      ?auto_176543 - BLOCK
    )
    :vars
    (
      ?auto_176544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176543 ?auto_176544 ) ( ON-TABLE ?auto_176534 ) ( ON ?auto_176535 ?auto_176534 ) ( ON ?auto_176536 ?auto_176535 ) ( not ( = ?auto_176534 ?auto_176535 ) ) ( not ( = ?auto_176534 ?auto_176536 ) ) ( not ( = ?auto_176534 ?auto_176537 ) ) ( not ( = ?auto_176534 ?auto_176538 ) ) ( not ( = ?auto_176534 ?auto_176539 ) ) ( not ( = ?auto_176534 ?auto_176540 ) ) ( not ( = ?auto_176534 ?auto_176541 ) ) ( not ( = ?auto_176534 ?auto_176542 ) ) ( not ( = ?auto_176534 ?auto_176543 ) ) ( not ( = ?auto_176534 ?auto_176544 ) ) ( not ( = ?auto_176535 ?auto_176536 ) ) ( not ( = ?auto_176535 ?auto_176537 ) ) ( not ( = ?auto_176535 ?auto_176538 ) ) ( not ( = ?auto_176535 ?auto_176539 ) ) ( not ( = ?auto_176535 ?auto_176540 ) ) ( not ( = ?auto_176535 ?auto_176541 ) ) ( not ( = ?auto_176535 ?auto_176542 ) ) ( not ( = ?auto_176535 ?auto_176543 ) ) ( not ( = ?auto_176535 ?auto_176544 ) ) ( not ( = ?auto_176536 ?auto_176537 ) ) ( not ( = ?auto_176536 ?auto_176538 ) ) ( not ( = ?auto_176536 ?auto_176539 ) ) ( not ( = ?auto_176536 ?auto_176540 ) ) ( not ( = ?auto_176536 ?auto_176541 ) ) ( not ( = ?auto_176536 ?auto_176542 ) ) ( not ( = ?auto_176536 ?auto_176543 ) ) ( not ( = ?auto_176536 ?auto_176544 ) ) ( not ( = ?auto_176537 ?auto_176538 ) ) ( not ( = ?auto_176537 ?auto_176539 ) ) ( not ( = ?auto_176537 ?auto_176540 ) ) ( not ( = ?auto_176537 ?auto_176541 ) ) ( not ( = ?auto_176537 ?auto_176542 ) ) ( not ( = ?auto_176537 ?auto_176543 ) ) ( not ( = ?auto_176537 ?auto_176544 ) ) ( not ( = ?auto_176538 ?auto_176539 ) ) ( not ( = ?auto_176538 ?auto_176540 ) ) ( not ( = ?auto_176538 ?auto_176541 ) ) ( not ( = ?auto_176538 ?auto_176542 ) ) ( not ( = ?auto_176538 ?auto_176543 ) ) ( not ( = ?auto_176538 ?auto_176544 ) ) ( not ( = ?auto_176539 ?auto_176540 ) ) ( not ( = ?auto_176539 ?auto_176541 ) ) ( not ( = ?auto_176539 ?auto_176542 ) ) ( not ( = ?auto_176539 ?auto_176543 ) ) ( not ( = ?auto_176539 ?auto_176544 ) ) ( not ( = ?auto_176540 ?auto_176541 ) ) ( not ( = ?auto_176540 ?auto_176542 ) ) ( not ( = ?auto_176540 ?auto_176543 ) ) ( not ( = ?auto_176540 ?auto_176544 ) ) ( not ( = ?auto_176541 ?auto_176542 ) ) ( not ( = ?auto_176541 ?auto_176543 ) ) ( not ( = ?auto_176541 ?auto_176544 ) ) ( not ( = ?auto_176542 ?auto_176543 ) ) ( not ( = ?auto_176542 ?auto_176544 ) ) ( not ( = ?auto_176543 ?auto_176544 ) ) ( ON ?auto_176542 ?auto_176543 ) ( ON ?auto_176541 ?auto_176542 ) ( ON ?auto_176540 ?auto_176541 ) ( ON ?auto_176539 ?auto_176540 ) ( ON ?auto_176538 ?auto_176539 ) ( CLEAR ?auto_176536 ) ( ON ?auto_176537 ?auto_176538 ) ( CLEAR ?auto_176537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_176534 ?auto_176535 ?auto_176536 ?auto_176537 )
      ( MAKE-10PILE ?auto_176534 ?auto_176535 ?auto_176536 ?auto_176537 ?auto_176538 ?auto_176539 ?auto_176540 ?auto_176541 ?auto_176542 ?auto_176543 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176555 - BLOCK
      ?auto_176556 - BLOCK
      ?auto_176557 - BLOCK
      ?auto_176558 - BLOCK
      ?auto_176559 - BLOCK
      ?auto_176560 - BLOCK
      ?auto_176561 - BLOCK
      ?auto_176562 - BLOCK
      ?auto_176563 - BLOCK
      ?auto_176564 - BLOCK
    )
    :vars
    (
      ?auto_176565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176564 ?auto_176565 ) ( ON-TABLE ?auto_176555 ) ( ON ?auto_176556 ?auto_176555 ) ( not ( = ?auto_176555 ?auto_176556 ) ) ( not ( = ?auto_176555 ?auto_176557 ) ) ( not ( = ?auto_176555 ?auto_176558 ) ) ( not ( = ?auto_176555 ?auto_176559 ) ) ( not ( = ?auto_176555 ?auto_176560 ) ) ( not ( = ?auto_176555 ?auto_176561 ) ) ( not ( = ?auto_176555 ?auto_176562 ) ) ( not ( = ?auto_176555 ?auto_176563 ) ) ( not ( = ?auto_176555 ?auto_176564 ) ) ( not ( = ?auto_176555 ?auto_176565 ) ) ( not ( = ?auto_176556 ?auto_176557 ) ) ( not ( = ?auto_176556 ?auto_176558 ) ) ( not ( = ?auto_176556 ?auto_176559 ) ) ( not ( = ?auto_176556 ?auto_176560 ) ) ( not ( = ?auto_176556 ?auto_176561 ) ) ( not ( = ?auto_176556 ?auto_176562 ) ) ( not ( = ?auto_176556 ?auto_176563 ) ) ( not ( = ?auto_176556 ?auto_176564 ) ) ( not ( = ?auto_176556 ?auto_176565 ) ) ( not ( = ?auto_176557 ?auto_176558 ) ) ( not ( = ?auto_176557 ?auto_176559 ) ) ( not ( = ?auto_176557 ?auto_176560 ) ) ( not ( = ?auto_176557 ?auto_176561 ) ) ( not ( = ?auto_176557 ?auto_176562 ) ) ( not ( = ?auto_176557 ?auto_176563 ) ) ( not ( = ?auto_176557 ?auto_176564 ) ) ( not ( = ?auto_176557 ?auto_176565 ) ) ( not ( = ?auto_176558 ?auto_176559 ) ) ( not ( = ?auto_176558 ?auto_176560 ) ) ( not ( = ?auto_176558 ?auto_176561 ) ) ( not ( = ?auto_176558 ?auto_176562 ) ) ( not ( = ?auto_176558 ?auto_176563 ) ) ( not ( = ?auto_176558 ?auto_176564 ) ) ( not ( = ?auto_176558 ?auto_176565 ) ) ( not ( = ?auto_176559 ?auto_176560 ) ) ( not ( = ?auto_176559 ?auto_176561 ) ) ( not ( = ?auto_176559 ?auto_176562 ) ) ( not ( = ?auto_176559 ?auto_176563 ) ) ( not ( = ?auto_176559 ?auto_176564 ) ) ( not ( = ?auto_176559 ?auto_176565 ) ) ( not ( = ?auto_176560 ?auto_176561 ) ) ( not ( = ?auto_176560 ?auto_176562 ) ) ( not ( = ?auto_176560 ?auto_176563 ) ) ( not ( = ?auto_176560 ?auto_176564 ) ) ( not ( = ?auto_176560 ?auto_176565 ) ) ( not ( = ?auto_176561 ?auto_176562 ) ) ( not ( = ?auto_176561 ?auto_176563 ) ) ( not ( = ?auto_176561 ?auto_176564 ) ) ( not ( = ?auto_176561 ?auto_176565 ) ) ( not ( = ?auto_176562 ?auto_176563 ) ) ( not ( = ?auto_176562 ?auto_176564 ) ) ( not ( = ?auto_176562 ?auto_176565 ) ) ( not ( = ?auto_176563 ?auto_176564 ) ) ( not ( = ?auto_176563 ?auto_176565 ) ) ( not ( = ?auto_176564 ?auto_176565 ) ) ( ON ?auto_176563 ?auto_176564 ) ( ON ?auto_176562 ?auto_176563 ) ( ON ?auto_176561 ?auto_176562 ) ( ON ?auto_176560 ?auto_176561 ) ( ON ?auto_176559 ?auto_176560 ) ( ON ?auto_176558 ?auto_176559 ) ( CLEAR ?auto_176556 ) ( ON ?auto_176557 ?auto_176558 ) ( CLEAR ?auto_176557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176555 ?auto_176556 ?auto_176557 )
      ( MAKE-10PILE ?auto_176555 ?auto_176556 ?auto_176557 ?auto_176558 ?auto_176559 ?auto_176560 ?auto_176561 ?auto_176562 ?auto_176563 ?auto_176564 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176576 - BLOCK
      ?auto_176577 - BLOCK
      ?auto_176578 - BLOCK
      ?auto_176579 - BLOCK
      ?auto_176580 - BLOCK
      ?auto_176581 - BLOCK
      ?auto_176582 - BLOCK
      ?auto_176583 - BLOCK
      ?auto_176584 - BLOCK
      ?auto_176585 - BLOCK
    )
    :vars
    (
      ?auto_176586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176585 ?auto_176586 ) ( ON-TABLE ?auto_176576 ) ( ON ?auto_176577 ?auto_176576 ) ( not ( = ?auto_176576 ?auto_176577 ) ) ( not ( = ?auto_176576 ?auto_176578 ) ) ( not ( = ?auto_176576 ?auto_176579 ) ) ( not ( = ?auto_176576 ?auto_176580 ) ) ( not ( = ?auto_176576 ?auto_176581 ) ) ( not ( = ?auto_176576 ?auto_176582 ) ) ( not ( = ?auto_176576 ?auto_176583 ) ) ( not ( = ?auto_176576 ?auto_176584 ) ) ( not ( = ?auto_176576 ?auto_176585 ) ) ( not ( = ?auto_176576 ?auto_176586 ) ) ( not ( = ?auto_176577 ?auto_176578 ) ) ( not ( = ?auto_176577 ?auto_176579 ) ) ( not ( = ?auto_176577 ?auto_176580 ) ) ( not ( = ?auto_176577 ?auto_176581 ) ) ( not ( = ?auto_176577 ?auto_176582 ) ) ( not ( = ?auto_176577 ?auto_176583 ) ) ( not ( = ?auto_176577 ?auto_176584 ) ) ( not ( = ?auto_176577 ?auto_176585 ) ) ( not ( = ?auto_176577 ?auto_176586 ) ) ( not ( = ?auto_176578 ?auto_176579 ) ) ( not ( = ?auto_176578 ?auto_176580 ) ) ( not ( = ?auto_176578 ?auto_176581 ) ) ( not ( = ?auto_176578 ?auto_176582 ) ) ( not ( = ?auto_176578 ?auto_176583 ) ) ( not ( = ?auto_176578 ?auto_176584 ) ) ( not ( = ?auto_176578 ?auto_176585 ) ) ( not ( = ?auto_176578 ?auto_176586 ) ) ( not ( = ?auto_176579 ?auto_176580 ) ) ( not ( = ?auto_176579 ?auto_176581 ) ) ( not ( = ?auto_176579 ?auto_176582 ) ) ( not ( = ?auto_176579 ?auto_176583 ) ) ( not ( = ?auto_176579 ?auto_176584 ) ) ( not ( = ?auto_176579 ?auto_176585 ) ) ( not ( = ?auto_176579 ?auto_176586 ) ) ( not ( = ?auto_176580 ?auto_176581 ) ) ( not ( = ?auto_176580 ?auto_176582 ) ) ( not ( = ?auto_176580 ?auto_176583 ) ) ( not ( = ?auto_176580 ?auto_176584 ) ) ( not ( = ?auto_176580 ?auto_176585 ) ) ( not ( = ?auto_176580 ?auto_176586 ) ) ( not ( = ?auto_176581 ?auto_176582 ) ) ( not ( = ?auto_176581 ?auto_176583 ) ) ( not ( = ?auto_176581 ?auto_176584 ) ) ( not ( = ?auto_176581 ?auto_176585 ) ) ( not ( = ?auto_176581 ?auto_176586 ) ) ( not ( = ?auto_176582 ?auto_176583 ) ) ( not ( = ?auto_176582 ?auto_176584 ) ) ( not ( = ?auto_176582 ?auto_176585 ) ) ( not ( = ?auto_176582 ?auto_176586 ) ) ( not ( = ?auto_176583 ?auto_176584 ) ) ( not ( = ?auto_176583 ?auto_176585 ) ) ( not ( = ?auto_176583 ?auto_176586 ) ) ( not ( = ?auto_176584 ?auto_176585 ) ) ( not ( = ?auto_176584 ?auto_176586 ) ) ( not ( = ?auto_176585 ?auto_176586 ) ) ( ON ?auto_176584 ?auto_176585 ) ( ON ?auto_176583 ?auto_176584 ) ( ON ?auto_176582 ?auto_176583 ) ( ON ?auto_176581 ?auto_176582 ) ( ON ?auto_176580 ?auto_176581 ) ( ON ?auto_176579 ?auto_176580 ) ( CLEAR ?auto_176577 ) ( ON ?auto_176578 ?auto_176579 ) ( CLEAR ?auto_176578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_176576 ?auto_176577 ?auto_176578 )
      ( MAKE-10PILE ?auto_176576 ?auto_176577 ?auto_176578 ?auto_176579 ?auto_176580 ?auto_176581 ?auto_176582 ?auto_176583 ?auto_176584 ?auto_176585 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176597 - BLOCK
      ?auto_176598 - BLOCK
      ?auto_176599 - BLOCK
      ?auto_176600 - BLOCK
      ?auto_176601 - BLOCK
      ?auto_176602 - BLOCK
      ?auto_176603 - BLOCK
      ?auto_176604 - BLOCK
      ?auto_176605 - BLOCK
      ?auto_176606 - BLOCK
    )
    :vars
    (
      ?auto_176607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176606 ?auto_176607 ) ( ON-TABLE ?auto_176597 ) ( not ( = ?auto_176597 ?auto_176598 ) ) ( not ( = ?auto_176597 ?auto_176599 ) ) ( not ( = ?auto_176597 ?auto_176600 ) ) ( not ( = ?auto_176597 ?auto_176601 ) ) ( not ( = ?auto_176597 ?auto_176602 ) ) ( not ( = ?auto_176597 ?auto_176603 ) ) ( not ( = ?auto_176597 ?auto_176604 ) ) ( not ( = ?auto_176597 ?auto_176605 ) ) ( not ( = ?auto_176597 ?auto_176606 ) ) ( not ( = ?auto_176597 ?auto_176607 ) ) ( not ( = ?auto_176598 ?auto_176599 ) ) ( not ( = ?auto_176598 ?auto_176600 ) ) ( not ( = ?auto_176598 ?auto_176601 ) ) ( not ( = ?auto_176598 ?auto_176602 ) ) ( not ( = ?auto_176598 ?auto_176603 ) ) ( not ( = ?auto_176598 ?auto_176604 ) ) ( not ( = ?auto_176598 ?auto_176605 ) ) ( not ( = ?auto_176598 ?auto_176606 ) ) ( not ( = ?auto_176598 ?auto_176607 ) ) ( not ( = ?auto_176599 ?auto_176600 ) ) ( not ( = ?auto_176599 ?auto_176601 ) ) ( not ( = ?auto_176599 ?auto_176602 ) ) ( not ( = ?auto_176599 ?auto_176603 ) ) ( not ( = ?auto_176599 ?auto_176604 ) ) ( not ( = ?auto_176599 ?auto_176605 ) ) ( not ( = ?auto_176599 ?auto_176606 ) ) ( not ( = ?auto_176599 ?auto_176607 ) ) ( not ( = ?auto_176600 ?auto_176601 ) ) ( not ( = ?auto_176600 ?auto_176602 ) ) ( not ( = ?auto_176600 ?auto_176603 ) ) ( not ( = ?auto_176600 ?auto_176604 ) ) ( not ( = ?auto_176600 ?auto_176605 ) ) ( not ( = ?auto_176600 ?auto_176606 ) ) ( not ( = ?auto_176600 ?auto_176607 ) ) ( not ( = ?auto_176601 ?auto_176602 ) ) ( not ( = ?auto_176601 ?auto_176603 ) ) ( not ( = ?auto_176601 ?auto_176604 ) ) ( not ( = ?auto_176601 ?auto_176605 ) ) ( not ( = ?auto_176601 ?auto_176606 ) ) ( not ( = ?auto_176601 ?auto_176607 ) ) ( not ( = ?auto_176602 ?auto_176603 ) ) ( not ( = ?auto_176602 ?auto_176604 ) ) ( not ( = ?auto_176602 ?auto_176605 ) ) ( not ( = ?auto_176602 ?auto_176606 ) ) ( not ( = ?auto_176602 ?auto_176607 ) ) ( not ( = ?auto_176603 ?auto_176604 ) ) ( not ( = ?auto_176603 ?auto_176605 ) ) ( not ( = ?auto_176603 ?auto_176606 ) ) ( not ( = ?auto_176603 ?auto_176607 ) ) ( not ( = ?auto_176604 ?auto_176605 ) ) ( not ( = ?auto_176604 ?auto_176606 ) ) ( not ( = ?auto_176604 ?auto_176607 ) ) ( not ( = ?auto_176605 ?auto_176606 ) ) ( not ( = ?auto_176605 ?auto_176607 ) ) ( not ( = ?auto_176606 ?auto_176607 ) ) ( ON ?auto_176605 ?auto_176606 ) ( ON ?auto_176604 ?auto_176605 ) ( ON ?auto_176603 ?auto_176604 ) ( ON ?auto_176602 ?auto_176603 ) ( ON ?auto_176601 ?auto_176602 ) ( ON ?auto_176600 ?auto_176601 ) ( ON ?auto_176599 ?auto_176600 ) ( CLEAR ?auto_176597 ) ( ON ?auto_176598 ?auto_176599 ) ( CLEAR ?auto_176598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176597 ?auto_176598 )
      ( MAKE-10PILE ?auto_176597 ?auto_176598 ?auto_176599 ?auto_176600 ?auto_176601 ?auto_176602 ?auto_176603 ?auto_176604 ?auto_176605 ?auto_176606 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176618 - BLOCK
      ?auto_176619 - BLOCK
      ?auto_176620 - BLOCK
      ?auto_176621 - BLOCK
      ?auto_176622 - BLOCK
      ?auto_176623 - BLOCK
      ?auto_176624 - BLOCK
      ?auto_176625 - BLOCK
      ?auto_176626 - BLOCK
      ?auto_176627 - BLOCK
    )
    :vars
    (
      ?auto_176628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176627 ?auto_176628 ) ( ON-TABLE ?auto_176618 ) ( not ( = ?auto_176618 ?auto_176619 ) ) ( not ( = ?auto_176618 ?auto_176620 ) ) ( not ( = ?auto_176618 ?auto_176621 ) ) ( not ( = ?auto_176618 ?auto_176622 ) ) ( not ( = ?auto_176618 ?auto_176623 ) ) ( not ( = ?auto_176618 ?auto_176624 ) ) ( not ( = ?auto_176618 ?auto_176625 ) ) ( not ( = ?auto_176618 ?auto_176626 ) ) ( not ( = ?auto_176618 ?auto_176627 ) ) ( not ( = ?auto_176618 ?auto_176628 ) ) ( not ( = ?auto_176619 ?auto_176620 ) ) ( not ( = ?auto_176619 ?auto_176621 ) ) ( not ( = ?auto_176619 ?auto_176622 ) ) ( not ( = ?auto_176619 ?auto_176623 ) ) ( not ( = ?auto_176619 ?auto_176624 ) ) ( not ( = ?auto_176619 ?auto_176625 ) ) ( not ( = ?auto_176619 ?auto_176626 ) ) ( not ( = ?auto_176619 ?auto_176627 ) ) ( not ( = ?auto_176619 ?auto_176628 ) ) ( not ( = ?auto_176620 ?auto_176621 ) ) ( not ( = ?auto_176620 ?auto_176622 ) ) ( not ( = ?auto_176620 ?auto_176623 ) ) ( not ( = ?auto_176620 ?auto_176624 ) ) ( not ( = ?auto_176620 ?auto_176625 ) ) ( not ( = ?auto_176620 ?auto_176626 ) ) ( not ( = ?auto_176620 ?auto_176627 ) ) ( not ( = ?auto_176620 ?auto_176628 ) ) ( not ( = ?auto_176621 ?auto_176622 ) ) ( not ( = ?auto_176621 ?auto_176623 ) ) ( not ( = ?auto_176621 ?auto_176624 ) ) ( not ( = ?auto_176621 ?auto_176625 ) ) ( not ( = ?auto_176621 ?auto_176626 ) ) ( not ( = ?auto_176621 ?auto_176627 ) ) ( not ( = ?auto_176621 ?auto_176628 ) ) ( not ( = ?auto_176622 ?auto_176623 ) ) ( not ( = ?auto_176622 ?auto_176624 ) ) ( not ( = ?auto_176622 ?auto_176625 ) ) ( not ( = ?auto_176622 ?auto_176626 ) ) ( not ( = ?auto_176622 ?auto_176627 ) ) ( not ( = ?auto_176622 ?auto_176628 ) ) ( not ( = ?auto_176623 ?auto_176624 ) ) ( not ( = ?auto_176623 ?auto_176625 ) ) ( not ( = ?auto_176623 ?auto_176626 ) ) ( not ( = ?auto_176623 ?auto_176627 ) ) ( not ( = ?auto_176623 ?auto_176628 ) ) ( not ( = ?auto_176624 ?auto_176625 ) ) ( not ( = ?auto_176624 ?auto_176626 ) ) ( not ( = ?auto_176624 ?auto_176627 ) ) ( not ( = ?auto_176624 ?auto_176628 ) ) ( not ( = ?auto_176625 ?auto_176626 ) ) ( not ( = ?auto_176625 ?auto_176627 ) ) ( not ( = ?auto_176625 ?auto_176628 ) ) ( not ( = ?auto_176626 ?auto_176627 ) ) ( not ( = ?auto_176626 ?auto_176628 ) ) ( not ( = ?auto_176627 ?auto_176628 ) ) ( ON ?auto_176626 ?auto_176627 ) ( ON ?auto_176625 ?auto_176626 ) ( ON ?auto_176624 ?auto_176625 ) ( ON ?auto_176623 ?auto_176624 ) ( ON ?auto_176622 ?auto_176623 ) ( ON ?auto_176621 ?auto_176622 ) ( ON ?auto_176620 ?auto_176621 ) ( CLEAR ?auto_176618 ) ( ON ?auto_176619 ?auto_176620 ) ( CLEAR ?auto_176619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_176618 ?auto_176619 )
      ( MAKE-10PILE ?auto_176618 ?auto_176619 ?auto_176620 ?auto_176621 ?auto_176622 ?auto_176623 ?auto_176624 ?auto_176625 ?auto_176626 ?auto_176627 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176639 - BLOCK
      ?auto_176640 - BLOCK
      ?auto_176641 - BLOCK
      ?auto_176642 - BLOCK
      ?auto_176643 - BLOCK
      ?auto_176644 - BLOCK
      ?auto_176645 - BLOCK
      ?auto_176646 - BLOCK
      ?auto_176647 - BLOCK
      ?auto_176648 - BLOCK
    )
    :vars
    (
      ?auto_176649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176648 ?auto_176649 ) ( not ( = ?auto_176639 ?auto_176640 ) ) ( not ( = ?auto_176639 ?auto_176641 ) ) ( not ( = ?auto_176639 ?auto_176642 ) ) ( not ( = ?auto_176639 ?auto_176643 ) ) ( not ( = ?auto_176639 ?auto_176644 ) ) ( not ( = ?auto_176639 ?auto_176645 ) ) ( not ( = ?auto_176639 ?auto_176646 ) ) ( not ( = ?auto_176639 ?auto_176647 ) ) ( not ( = ?auto_176639 ?auto_176648 ) ) ( not ( = ?auto_176639 ?auto_176649 ) ) ( not ( = ?auto_176640 ?auto_176641 ) ) ( not ( = ?auto_176640 ?auto_176642 ) ) ( not ( = ?auto_176640 ?auto_176643 ) ) ( not ( = ?auto_176640 ?auto_176644 ) ) ( not ( = ?auto_176640 ?auto_176645 ) ) ( not ( = ?auto_176640 ?auto_176646 ) ) ( not ( = ?auto_176640 ?auto_176647 ) ) ( not ( = ?auto_176640 ?auto_176648 ) ) ( not ( = ?auto_176640 ?auto_176649 ) ) ( not ( = ?auto_176641 ?auto_176642 ) ) ( not ( = ?auto_176641 ?auto_176643 ) ) ( not ( = ?auto_176641 ?auto_176644 ) ) ( not ( = ?auto_176641 ?auto_176645 ) ) ( not ( = ?auto_176641 ?auto_176646 ) ) ( not ( = ?auto_176641 ?auto_176647 ) ) ( not ( = ?auto_176641 ?auto_176648 ) ) ( not ( = ?auto_176641 ?auto_176649 ) ) ( not ( = ?auto_176642 ?auto_176643 ) ) ( not ( = ?auto_176642 ?auto_176644 ) ) ( not ( = ?auto_176642 ?auto_176645 ) ) ( not ( = ?auto_176642 ?auto_176646 ) ) ( not ( = ?auto_176642 ?auto_176647 ) ) ( not ( = ?auto_176642 ?auto_176648 ) ) ( not ( = ?auto_176642 ?auto_176649 ) ) ( not ( = ?auto_176643 ?auto_176644 ) ) ( not ( = ?auto_176643 ?auto_176645 ) ) ( not ( = ?auto_176643 ?auto_176646 ) ) ( not ( = ?auto_176643 ?auto_176647 ) ) ( not ( = ?auto_176643 ?auto_176648 ) ) ( not ( = ?auto_176643 ?auto_176649 ) ) ( not ( = ?auto_176644 ?auto_176645 ) ) ( not ( = ?auto_176644 ?auto_176646 ) ) ( not ( = ?auto_176644 ?auto_176647 ) ) ( not ( = ?auto_176644 ?auto_176648 ) ) ( not ( = ?auto_176644 ?auto_176649 ) ) ( not ( = ?auto_176645 ?auto_176646 ) ) ( not ( = ?auto_176645 ?auto_176647 ) ) ( not ( = ?auto_176645 ?auto_176648 ) ) ( not ( = ?auto_176645 ?auto_176649 ) ) ( not ( = ?auto_176646 ?auto_176647 ) ) ( not ( = ?auto_176646 ?auto_176648 ) ) ( not ( = ?auto_176646 ?auto_176649 ) ) ( not ( = ?auto_176647 ?auto_176648 ) ) ( not ( = ?auto_176647 ?auto_176649 ) ) ( not ( = ?auto_176648 ?auto_176649 ) ) ( ON ?auto_176647 ?auto_176648 ) ( ON ?auto_176646 ?auto_176647 ) ( ON ?auto_176645 ?auto_176646 ) ( ON ?auto_176644 ?auto_176645 ) ( ON ?auto_176643 ?auto_176644 ) ( ON ?auto_176642 ?auto_176643 ) ( ON ?auto_176641 ?auto_176642 ) ( ON ?auto_176640 ?auto_176641 ) ( ON ?auto_176639 ?auto_176640 ) ( CLEAR ?auto_176639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176639 )
      ( MAKE-10PILE ?auto_176639 ?auto_176640 ?auto_176641 ?auto_176642 ?auto_176643 ?auto_176644 ?auto_176645 ?auto_176646 ?auto_176647 ?auto_176648 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_176660 - BLOCK
      ?auto_176661 - BLOCK
      ?auto_176662 - BLOCK
      ?auto_176663 - BLOCK
      ?auto_176664 - BLOCK
      ?auto_176665 - BLOCK
      ?auto_176666 - BLOCK
      ?auto_176667 - BLOCK
      ?auto_176668 - BLOCK
      ?auto_176669 - BLOCK
    )
    :vars
    (
      ?auto_176670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176669 ?auto_176670 ) ( not ( = ?auto_176660 ?auto_176661 ) ) ( not ( = ?auto_176660 ?auto_176662 ) ) ( not ( = ?auto_176660 ?auto_176663 ) ) ( not ( = ?auto_176660 ?auto_176664 ) ) ( not ( = ?auto_176660 ?auto_176665 ) ) ( not ( = ?auto_176660 ?auto_176666 ) ) ( not ( = ?auto_176660 ?auto_176667 ) ) ( not ( = ?auto_176660 ?auto_176668 ) ) ( not ( = ?auto_176660 ?auto_176669 ) ) ( not ( = ?auto_176660 ?auto_176670 ) ) ( not ( = ?auto_176661 ?auto_176662 ) ) ( not ( = ?auto_176661 ?auto_176663 ) ) ( not ( = ?auto_176661 ?auto_176664 ) ) ( not ( = ?auto_176661 ?auto_176665 ) ) ( not ( = ?auto_176661 ?auto_176666 ) ) ( not ( = ?auto_176661 ?auto_176667 ) ) ( not ( = ?auto_176661 ?auto_176668 ) ) ( not ( = ?auto_176661 ?auto_176669 ) ) ( not ( = ?auto_176661 ?auto_176670 ) ) ( not ( = ?auto_176662 ?auto_176663 ) ) ( not ( = ?auto_176662 ?auto_176664 ) ) ( not ( = ?auto_176662 ?auto_176665 ) ) ( not ( = ?auto_176662 ?auto_176666 ) ) ( not ( = ?auto_176662 ?auto_176667 ) ) ( not ( = ?auto_176662 ?auto_176668 ) ) ( not ( = ?auto_176662 ?auto_176669 ) ) ( not ( = ?auto_176662 ?auto_176670 ) ) ( not ( = ?auto_176663 ?auto_176664 ) ) ( not ( = ?auto_176663 ?auto_176665 ) ) ( not ( = ?auto_176663 ?auto_176666 ) ) ( not ( = ?auto_176663 ?auto_176667 ) ) ( not ( = ?auto_176663 ?auto_176668 ) ) ( not ( = ?auto_176663 ?auto_176669 ) ) ( not ( = ?auto_176663 ?auto_176670 ) ) ( not ( = ?auto_176664 ?auto_176665 ) ) ( not ( = ?auto_176664 ?auto_176666 ) ) ( not ( = ?auto_176664 ?auto_176667 ) ) ( not ( = ?auto_176664 ?auto_176668 ) ) ( not ( = ?auto_176664 ?auto_176669 ) ) ( not ( = ?auto_176664 ?auto_176670 ) ) ( not ( = ?auto_176665 ?auto_176666 ) ) ( not ( = ?auto_176665 ?auto_176667 ) ) ( not ( = ?auto_176665 ?auto_176668 ) ) ( not ( = ?auto_176665 ?auto_176669 ) ) ( not ( = ?auto_176665 ?auto_176670 ) ) ( not ( = ?auto_176666 ?auto_176667 ) ) ( not ( = ?auto_176666 ?auto_176668 ) ) ( not ( = ?auto_176666 ?auto_176669 ) ) ( not ( = ?auto_176666 ?auto_176670 ) ) ( not ( = ?auto_176667 ?auto_176668 ) ) ( not ( = ?auto_176667 ?auto_176669 ) ) ( not ( = ?auto_176667 ?auto_176670 ) ) ( not ( = ?auto_176668 ?auto_176669 ) ) ( not ( = ?auto_176668 ?auto_176670 ) ) ( not ( = ?auto_176669 ?auto_176670 ) ) ( ON ?auto_176668 ?auto_176669 ) ( ON ?auto_176667 ?auto_176668 ) ( ON ?auto_176666 ?auto_176667 ) ( ON ?auto_176665 ?auto_176666 ) ( ON ?auto_176664 ?auto_176665 ) ( ON ?auto_176663 ?auto_176664 ) ( ON ?auto_176662 ?auto_176663 ) ( ON ?auto_176661 ?auto_176662 ) ( ON ?auto_176660 ?auto_176661 ) ( CLEAR ?auto_176660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_176660 )
      ( MAKE-10PILE ?auto_176660 ?auto_176661 ?auto_176662 ?auto_176663 ?auto_176664 ?auto_176665 ?auto_176666 ?auto_176667 ?auto_176668 ?auto_176669 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176682 - BLOCK
      ?auto_176683 - BLOCK
      ?auto_176684 - BLOCK
      ?auto_176685 - BLOCK
      ?auto_176686 - BLOCK
      ?auto_176687 - BLOCK
      ?auto_176688 - BLOCK
      ?auto_176689 - BLOCK
      ?auto_176690 - BLOCK
      ?auto_176691 - BLOCK
      ?auto_176692 - BLOCK
    )
    :vars
    (
      ?auto_176693 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_176691 ) ( ON ?auto_176692 ?auto_176693 ) ( CLEAR ?auto_176692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176682 ) ( ON ?auto_176683 ?auto_176682 ) ( ON ?auto_176684 ?auto_176683 ) ( ON ?auto_176685 ?auto_176684 ) ( ON ?auto_176686 ?auto_176685 ) ( ON ?auto_176687 ?auto_176686 ) ( ON ?auto_176688 ?auto_176687 ) ( ON ?auto_176689 ?auto_176688 ) ( ON ?auto_176690 ?auto_176689 ) ( ON ?auto_176691 ?auto_176690 ) ( not ( = ?auto_176682 ?auto_176683 ) ) ( not ( = ?auto_176682 ?auto_176684 ) ) ( not ( = ?auto_176682 ?auto_176685 ) ) ( not ( = ?auto_176682 ?auto_176686 ) ) ( not ( = ?auto_176682 ?auto_176687 ) ) ( not ( = ?auto_176682 ?auto_176688 ) ) ( not ( = ?auto_176682 ?auto_176689 ) ) ( not ( = ?auto_176682 ?auto_176690 ) ) ( not ( = ?auto_176682 ?auto_176691 ) ) ( not ( = ?auto_176682 ?auto_176692 ) ) ( not ( = ?auto_176682 ?auto_176693 ) ) ( not ( = ?auto_176683 ?auto_176684 ) ) ( not ( = ?auto_176683 ?auto_176685 ) ) ( not ( = ?auto_176683 ?auto_176686 ) ) ( not ( = ?auto_176683 ?auto_176687 ) ) ( not ( = ?auto_176683 ?auto_176688 ) ) ( not ( = ?auto_176683 ?auto_176689 ) ) ( not ( = ?auto_176683 ?auto_176690 ) ) ( not ( = ?auto_176683 ?auto_176691 ) ) ( not ( = ?auto_176683 ?auto_176692 ) ) ( not ( = ?auto_176683 ?auto_176693 ) ) ( not ( = ?auto_176684 ?auto_176685 ) ) ( not ( = ?auto_176684 ?auto_176686 ) ) ( not ( = ?auto_176684 ?auto_176687 ) ) ( not ( = ?auto_176684 ?auto_176688 ) ) ( not ( = ?auto_176684 ?auto_176689 ) ) ( not ( = ?auto_176684 ?auto_176690 ) ) ( not ( = ?auto_176684 ?auto_176691 ) ) ( not ( = ?auto_176684 ?auto_176692 ) ) ( not ( = ?auto_176684 ?auto_176693 ) ) ( not ( = ?auto_176685 ?auto_176686 ) ) ( not ( = ?auto_176685 ?auto_176687 ) ) ( not ( = ?auto_176685 ?auto_176688 ) ) ( not ( = ?auto_176685 ?auto_176689 ) ) ( not ( = ?auto_176685 ?auto_176690 ) ) ( not ( = ?auto_176685 ?auto_176691 ) ) ( not ( = ?auto_176685 ?auto_176692 ) ) ( not ( = ?auto_176685 ?auto_176693 ) ) ( not ( = ?auto_176686 ?auto_176687 ) ) ( not ( = ?auto_176686 ?auto_176688 ) ) ( not ( = ?auto_176686 ?auto_176689 ) ) ( not ( = ?auto_176686 ?auto_176690 ) ) ( not ( = ?auto_176686 ?auto_176691 ) ) ( not ( = ?auto_176686 ?auto_176692 ) ) ( not ( = ?auto_176686 ?auto_176693 ) ) ( not ( = ?auto_176687 ?auto_176688 ) ) ( not ( = ?auto_176687 ?auto_176689 ) ) ( not ( = ?auto_176687 ?auto_176690 ) ) ( not ( = ?auto_176687 ?auto_176691 ) ) ( not ( = ?auto_176687 ?auto_176692 ) ) ( not ( = ?auto_176687 ?auto_176693 ) ) ( not ( = ?auto_176688 ?auto_176689 ) ) ( not ( = ?auto_176688 ?auto_176690 ) ) ( not ( = ?auto_176688 ?auto_176691 ) ) ( not ( = ?auto_176688 ?auto_176692 ) ) ( not ( = ?auto_176688 ?auto_176693 ) ) ( not ( = ?auto_176689 ?auto_176690 ) ) ( not ( = ?auto_176689 ?auto_176691 ) ) ( not ( = ?auto_176689 ?auto_176692 ) ) ( not ( = ?auto_176689 ?auto_176693 ) ) ( not ( = ?auto_176690 ?auto_176691 ) ) ( not ( = ?auto_176690 ?auto_176692 ) ) ( not ( = ?auto_176690 ?auto_176693 ) ) ( not ( = ?auto_176691 ?auto_176692 ) ) ( not ( = ?auto_176691 ?auto_176693 ) ) ( not ( = ?auto_176692 ?auto_176693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176692 ?auto_176693 )
      ( !STACK ?auto_176692 ?auto_176691 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176705 - BLOCK
      ?auto_176706 - BLOCK
      ?auto_176707 - BLOCK
      ?auto_176708 - BLOCK
      ?auto_176709 - BLOCK
      ?auto_176710 - BLOCK
      ?auto_176711 - BLOCK
      ?auto_176712 - BLOCK
      ?auto_176713 - BLOCK
      ?auto_176714 - BLOCK
      ?auto_176715 - BLOCK
    )
    :vars
    (
      ?auto_176716 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_176714 ) ( ON ?auto_176715 ?auto_176716 ) ( CLEAR ?auto_176715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_176705 ) ( ON ?auto_176706 ?auto_176705 ) ( ON ?auto_176707 ?auto_176706 ) ( ON ?auto_176708 ?auto_176707 ) ( ON ?auto_176709 ?auto_176708 ) ( ON ?auto_176710 ?auto_176709 ) ( ON ?auto_176711 ?auto_176710 ) ( ON ?auto_176712 ?auto_176711 ) ( ON ?auto_176713 ?auto_176712 ) ( ON ?auto_176714 ?auto_176713 ) ( not ( = ?auto_176705 ?auto_176706 ) ) ( not ( = ?auto_176705 ?auto_176707 ) ) ( not ( = ?auto_176705 ?auto_176708 ) ) ( not ( = ?auto_176705 ?auto_176709 ) ) ( not ( = ?auto_176705 ?auto_176710 ) ) ( not ( = ?auto_176705 ?auto_176711 ) ) ( not ( = ?auto_176705 ?auto_176712 ) ) ( not ( = ?auto_176705 ?auto_176713 ) ) ( not ( = ?auto_176705 ?auto_176714 ) ) ( not ( = ?auto_176705 ?auto_176715 ) ) ( not ( = ?auto_176705 ?auto_176716 ) ) ( not ( = ?auto_176706 ?auto_176707 ) ) ( not ( = ?auto_176706 ?auto_176708 ) ) ( not ( = ?auto_176706 ?auto_176709 ) ) ( not ( = ?auto_176706 ?auto_176710 ) ) ( not ( = ?auto_176706 ?auto_176711 ) ) ( not ( = ?auto_176706 ?auto_176712 ) ) ( not ( = ?auto_176706 ?auto_176713 ) ) ( not ( = ?auto_176706 ?auto_176714 ) ) ( not ( = ?auto_176706 ?auto_176715 ) ) ( not ( = ?auto_176706 ?auto_176716 ) ) ( not ( = ?auto_176707 ?auto_176708 ) ) ( not ( = ?auto_176707 ?auto_176709 ) ) ( not ( = ?auto_176707 ?auto_176710 ) ) ( not ( = ?auto_176707 ?auto_176711 ) ) ( not ( = ?auto_176707 ?auto_176712 ) ) ( not ( = ?auto_176707 ?auto_176713 ) ) ( not ( = ?auto_176707 ?auto_176714 ) ) ( not ( = ?auto_176707 ?auto_176715 ) ) ( not ( = ?auto_176707 ?auto_176716 ) ) ( not ( = ?auto_176708 ?auto_176709 ) ) ( not ( = ?auto_176708 ?auto_176710 ) ) ( not ( = ?auto_176708 ?auto_176711 ) ) ( not ( = ?auto_176708 ?auto_176712 ) ) ( not ( = ?auto_176708 ?auto_176713 ) ) ( not ( = ?auto_176708 ?auto_176714 ) ) ( not ( = ?auto_176708 ?auto_176715 ) ) ( not ( = ?auto_176708 ?auto_176716 ) ) ( not ( = ?auto_176709 ?auto_176710 ) ) ( not ( = ?auto_176709 ?auto_176711 ) ) ( not ( = ?auto_176709 ?auto_176712 ) ) ( not ( = ?auto_176709 ?auto_176713 ) ) ( not ( = ?auto_176709 ?auto_176714 ) ) ( not ( = ?auto_176709 ?auto_176715 ) ) ( not ( = ?auto_176709 ?auto_176716 ) ) ( not ( = ?auto_176710 ?auto_176711 ) ) ( not ( = ?auto_176710 ?auto_176712 ) ) ( not ( = ?auto_176710 ?auto_176713 ) ) ( not ( = ?auto_176710 ?auto_176714 ) ) ( not ( = ?auto_176710 ?auto_176715 ) ) ( not ( = ?auto_176710 ?auto_176716 ) ) ( not ( = ?auto_176711 ?auto_176712 ) ) ( not ( = ?auto_176711 ?auto_176713 ) ) ( not ( = ?auto_176711 ?auto_176714 ) ) ( not ( = ?auto_176711 ?auto_176715 ) ) ( not ( = ?auto_176711 ?auto_176716 ) ) ( not ( = ?auto_176712 ?auto_176713 ) ) ( not ( = ?auto_176712 ?auto_176714 ) ) ( not ( = ?auto_176712 ?auto_176715 ) ) ( not ( = ?auto_176712 ?auto_176716 ) ) ( not ( = ?auto_176713 ?auto_176714 ) ) ( not ( = ?auto_176713 ?auto_176715 ) ) ( not ( = ?auto_176713 ?auto_176716 ) ) ( not ( = ?auto_176714 ?auto_176715 ) ) ( not ( = ?auto_176714 ?auto_176716 ) ) ( not ( = ?auto_176715 ?auto_176716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_176715 ?auto_176716 )
      ( !STACK ?auto_176715 ?auto_176714 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176728 - BLOCK
      ?auto_176729 - BLOCK
      ?auto_176730 - BLOCK
      ?auto_176731 - BLOCK
      ?auto_176732 - BLOCK
      ?auto_176733 - BLOCK
      ?auto_176734 - BLOCK
      ?auto_176735 - BLOCK
      ?auto_176736 - BLOCK
      ?auto_176737 - BLOCK
      ?auto_176738 - BLOCK
    )
    :vars
    (
      ?auto_176739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176738 ?auto_176739 ) ( ON-TABLE ?auto_176728 ) ( ON ?auto_176729 ?auto_176728 ) ( ON ?auto_176730 ?auto_176729 ) ( ON ?auto_176731 ?auto_176730 ) ( ON ?auto_176732 ?auto_176731 ) ( ON ?auto_176733 ?auto_176732 ) ( ON ?auto_176734 ?auto_176733 ) ( ON ?auto_176735 ?auto_176734 ) ( ON ?auto_176736 ?auto_176735 ) ( not ( = ?auto_176728 ?auto_176729 ) ) ( not ( = ?auto_176728 ?auto_176730 ) ) ( not ( = ?auto_176728 ?auto_176731 ) ) ( not ( = ?auto_176728 ?auto_176732 ) ) ( not ( = ?auto_176728 ?auto_176733 ) ) ( not ( = ?auto_176728 ?auto_176734 ) ) ( not ( = ?auto_176728 ?auto_176735 ) ) ( not ( = ?auto_176728 ?auto_176736 ) ) ( not ( = ?auto_176728 ?auto_176737 ) ) ( not ( = ?auto_176728 ?auto_176738 ) ) ( not ( = ?auto_176728 ?auto_176739 ) ) ( not ( = ?auto_176729 ?auto_176730 ) ) ( not ( = ?auto_176729 ?auto_176731 ) ) ( not ( = ?auto_176729 ?auto_176732 ) ) ( not ( = ?auto_176729 ?auto_176733 ) ) ( not ( = ?auto_176729 ?auto_176734 ) ) ( not ( = ?auto_176729 ?auto_176735 ) ) ( not ( = ?auto_176729 ?auto_176736 ) ) ( not ( = ?auto_176729 ?auto_176737 ) ) ( not ( = ?auto_176729 ?auto_176738 ) ) ( not ( = ?auto_176729 ?auto_176739 ) ) ( not ( = ?auto_176730 ?auto_176731 ) ) ( not ( = ?auto_176730 ?auto_176732 ) ) ( not ( = ?auto_176730 ?auto_176733 ) ) ( not ( = ?auto_176730 ?auto_176734 ) ) ( not ( = ?auto_176730 ?auto_176735 ) ) ( not ( = ?auto_176730 ?auto_176736 ) ) ( not ( = ?auto_176730 ?auto_176737 ) ) ( not ( = ?auto_176730 ?auto_176738 ) ) ( not ( = ?auto_176730 ?auto_176739 ) ) ( not ( = ?auto_176731 ?auto_176732 ) ) ( not ( = ?auto_176731 ?auto_176733 ) ) ( not ( = ?auto_176731 ?auto_176734 ) ) ( not ( = ?auto_176731 ?auto_176735 ) ) ( not ( = ?auto_176731 ?auto_176736 ) ) ( not ( = ?auto_176731 ?auto_176737 ) ) ( not ( = ?auto_176731 ?auto_176738 ) ) ( not ( = ?auto_176731 ?auto_176739 ) ) ( not ( = ?auto_176732 ?auto_176733 ) ) ( not ( = ?auto_176732 ?auto_176734 ) ) ( not ( = ?auto_176732 ?auto_176735 ) ) ( not ( = ?auto_176732 ?auto_176736 ) ) ( not ( = ?auto_176732 ?auto_176737 ) ) ( not ( = ?auto_176732 ?auto_176738 ) ) ( not ( = ?auto_176732 ?auto_176739 ) ) ( not ( = ?auto_176733 ?auto_176734 ) ) ( not ( = ?auto_176733 ?auto_176735 ) ) ( not ( = ?auto_176733 ?auto_176736 ) ) ( not ( = ?auto_176733 ?auto_176737 ) ) ( not ( = ?auto_176733 ?auto_176738 ) ) ( not ( = ?auto_176733 ?auto_176739 ) ) ( not ( = ?auto_176734 ?auto_176735 ) ) ( not ( = ?auto_176734 ?auto_176736 ) ) ( not ( = ?auto_176734 ?auto_176737 ) ) ( not ( = ?auto_176734 ?auto_176738 ) ) ( not ( = ?auto_176734 ?auto_176739 ) ) ( not ( = ?auto_176735 ?auto_176736 ) ) ( not ( = ?auto_176735 ?auto_176737 ) ) ( not ( = ?auto_176735 ?auto_176738 ) ) ( not ( = ?auto_176735 ?auto_176739 ) ) ( not ( = ?auto_176736 ?auto_176737 ) ) ( not ( = ?auto_176736 ?auto_176738 ) ) ( not ( = ?auto_176736 ?auto_176739 ) ) ( not ( = ?auto_176737 ?auto_176738 ) ) ( not ( = ?auto_176737 ?auto_176739 ) ) ( not ( = ?auto_176738 ?auto_176739 ) ) ( CLEAR ?auto_176736 ) ( ON ?auto_176737 ?auto_176738 ) ( CLEAR ?auto_176737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_176728 ?auto_176729 ?auto_176730 ?auto_176731 ?auto_176732 ?auto_176733 ?auto_176734 ?auto_176735 ?auto_176736 ?auto_176737 )
      ( MAKE-11PILE ?auto_176728 ?auto_176729 ?auto_176730 ?auto_176731 ?auto_176732 ?auto_176733 ?auto_176734 ?auto_176735 ?auto_176736 ?auto_176737 ?auto_176738 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176751 - BLOCK
      ?auto_176752 - BLOCK
      ?auto_176753 - BLOCK
      ?auto_176754 - BLOCK
      ?auto_176755 - BLOCK
      ?auto_176756 - BLOCK
      ?auto_176757 - BLOCK
      ?auto_176758 - BLOCK
      ?auto_176759 - BLOCK
      ?auto_176760 - BLOCK
      ?auto_176761 - BLOCK
    )
    :vars
    (
      ?auto_176762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176761 ?auto_176762 ) ( ON-TABLE ?auto_176751 ) ( ON ?auto_176752 ?auto_176751 ) ( ON ?auto_176753 ?auto_176752 ) ( ON ?auto_176754 ?auto_176753 ) ( ON ?auto_176755 ?auto_176754 ) ( ON ?auto_176756 ?auto_176755 ) ( ON ?auto_176757 ?auto_176756 ) ( ON ?auto_176758 ?auto_176757 ) ( ON ?auto_176759 ?auto_176758 ) ( not ( = ?auto_176751 ?auto_176752 ) ) ( not ( = ?auto_176751 ?auto_176753 ) ) ( not ( = ?auto_176751 ?auto_176754 ) ) ( not ( = ?auto_176751 ?auto_176755 ) ) ( not ( = ?auto_176751 ?auto_176756 ) ) ( not ( = ?auto_176751 ?auto_176757 ) ) ( not ( = ?auto_176751 ?auto_176758 ) ) ( not ( = ?auto_176751 ?auto_176759 ) ) ( not ( = ?auto_176751 ?auto_176760 ) ) ( not ( = ?auto_176751 ?auto_176761 ) ) ( not ( = ?auto_176751 ?auto_176762 ) ) ( not ( = ?auto_176752 ?auto_176753 ) ) ( not ( = ?auto_176752 ?auto_176754 ) ) ( not ( = ?auto_176752 ?auto_176755 ) ) ( not ( = ?auto_176752 ?auto_176756 ) ) ( not ( = ?auto_176752 ?auto_176757 ) ) ( not ( = ?auto_176752 ?auto_176758 ) ) ( not ( = ?auto_176752 ?auto_176759 ) ) ( not ( = ?auto_176752 ?auto_176760 ) ) ( not ( = ?auto_176752 ?auto_176761 ) ) ( not ( = ?auto_176752 ?auto_176762 ) ) ( not ( = ?auto_176753 ?auto_176754 ) ) ( not ( = ?auto_176753 ?auto_176755 ) ) ( not ( = ?auto_176753 ?auto_176756 ) ) ( not ( = ?auto_176753 ?auto_176757 ) ) ( not ( = ?auto_176753 ?auto_176758 ) ) ( not ( = ?auto_176753 ?auto_176759 ) ) ( not ( = ?auto_176753 ?auto_176760 ) ) ( not ( = ?auto_176753 ?auto_176761 ) ) ( not ( = ?auto_176753 ?auto_176762 ) ) ( not ( = ?auto_176754 ?auto_176755 ) ) ( not ( = ?auto_176754 ?auto_176756 ) ) ( not ( = ?auto_176754 ?auto_176757 ) ) ( not ( = ?auto_176754 ?auto_176758 ) ) ( not ( = ?auto_176754 ?auto_176759 ) ) ( not ( = ?auto_176754 ?auto_176760 ) ) ( not ( = ?auto_176754 ?auto_176761 ) ) ( not ( = ?auto_176754 ?auto_176762 ) ) ( not ( = ?auto_176755 ?auto_176756 ) ) ( not ( = ?auto_176755 ?auto_176757 ) ) ( not ( = ?auto_176755 ?auto_176758 ) ) ( not ( = ?auto_176755 ?auto_176759 ) ) ( not ( = ?auto_176755 ?auto_176760 ) ) ( not ( = ?auto_176755 ?auto_176761 ) ) ( not ( = ?auto_176755 ?auto_176762 ) ) ( not ( = ?auto_176756 ?auto_176757 ) ) ( not ( = ?auto_176756 ?auto_176758 ) ) ( not ( = ?auto_176756 ?auto_176759 ) ) ( not ( = ?auto_176756 ?auto_176760 ) ) ( not ( = ?auto_176756 ?auto_176761 ) ) ( not ( = ?auto_176756 ?auto_176762 ) ) ( not ( = ?auto_176757 ?auto_176758 ) ) ( not ( = ?auto_176757 ?auto_176759 ) ) ( not ( = ?auto_176757 ?auto_176760 ) ) ( not ( = ?auto_176757 ?auto_176761 ) ) ( not ( = ?auto_176757 ?auto_176762 ) ) ( not ( = ?auto_176758 ?auto_176759 ) ) ( not ( = ?auto_176758 ?auto_176760 ) ) ( not ( = ?auto_176758 ?auto_176761 ) ) ( not ( = ?auto_176758 ?auto_176762 ) ) ( not ( = ?auto_176759 ?auto_176760 ) ) ( not ( = ?auto_176759 ?auto_176761 ) ) ( not ( = ?auto_176759 ?auto_176762 ) ) ( not ( = ?auto_176760 ?auto_176761 ) ) ( not ( = ?auto_176760 ?auto_176762 ) ) ( not ( = ?auto_176761 ?auto_176762 ) ) ( CLEAR ?auto_176759 ) ( ON ?auto_176760 ?auto_176761 ) ( CLEAR ?auto_176760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_176751 ?auto_176752 ?auto_176753 ?auto_176754 ?auto_176755 ?auto_176756 ?auto_176757 ?auto_176758 ?auto_176759 ?auto_176760 )
      ( MAKE-11PILE ?auto_176751 ?auto_176752 ?auto_176753 ?auto_176754 ?auto_176755 ?auto_176756 ?auto_176757 ?auto_176758 ?auto_176759 ?auto_176760 ?auto_176761 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176774 - BLOCK
      ?auto_176775 - BLOCK
      ?auto_176776 - BLOCK
      ?auto_176777 - BLOCK
      ?auto_176778 - BLOCK
      ?auto_176779 - BLOCK
      ?auto_176780 - BLOCK
      ?auto_176781 - BLOCK
      ?auto_176782 - BLOCK
      ?auto_176783 - BLOCK
      ?auto_176784 - BLOCK
    )
    :vars
    (
      ?auto_176785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176784 ?auto_176785 ) ( ON-TABLE ?auto_176774 ) ( ON ?auto_176775 ?auto_176774 ) ( ON ?auto_176776 ?auto_176775 ) ( ON ?auto_176777 ?auto_176776 ) ( ON ?auto_176778 ?auto_176777 ) ( ON ?auto_176779 ?auto_176778 ) ( ON ?auto_176780 ?auto_176779 ) ( ON ?auto_176781 ?auto_176780 ) ( not ( = ?auto_176774 ?auto_176775 ) ) ( not ( = ?auto_176774 ?auto_176776 ) ) ( not ( = ?auto_176774 ?auto_176777 ) ) ( not ( = ?auto_176774 ?auto_176778 ) ) ( not ( = ?auto_176774 ?auto_176779 ) ) ( not ( = ?auto_176774 ?auto_176780 ) ) ( not ( = ?auto_176774 ?auto_176781 ) ) ( not ( = ?auto_176774 ?auto_176782 ) ) ( not ( = ?auto_176774 ?auto_176783 ) ) ( not ( = ?auto_176774 ?auto_176784 ) ) ( not ( = ?auto_176774 ?auto_176785 ) ) ( not ( = ?auto_176775 ?auto_176776 ) ) ( not ( = ?auto_176775 ?auto_176777 ) ) ( not ( = ?auto_176775 ?auto_176778 ) ) ( not ( = ?auto_176775 ?auto_176779 ) ) ( not ( = ?auto_176775 ?auto_176780 ) ) ( not ( = ?auto_176775 ?auto_176781 ) ) ( not ( = ?auto_176775 ?auto_176782 ) ) ( not ( = ?auto_176775 ?auto_176783 ) ) ( not ( = ?auto_176775 ?auto_176784 ) ) ( not ( = ?auto_176775 ?auto_176785 ) ) ( not ( = ?auto_176776 ?auto_176777 ) ) ( not ( = ?auto_176776 ?auto_176778 ) ) ( not ( = ?auto_176776 ?auto_176779 ) ) ( not ( = ?auto_176776 ?auto_176780 ) ) ( not ( = ?auto_176776 ?auto_176781 ) ) ( not ( = ?auto_176776 ?auto_176782 ) ) ( not ( = ?auto_176776 ?auto_176783 ) ) ( not ( = ?auto_176776 ?auto_176784 ) ) ( not ( = ?auto_176776 ?auto_176785 ) ) ( not ( = ?auto_176777 ?auto_176778 ) ) ( not ( = ?auto_176777 ?auto_176779 ) ) ( not ( = ?auto_176777 ?auto_176780 ) ) ( not ( = ?auto_176777 ?auto_176781 ) ) ( not ( = ?auto_176777 ?auto_176782 ) ) ( not ( = ?auto_176777 ?auto_176783 ) ) ( not ( = ?auto_176777 ?auto_176784 ) ) ( not ( = ?auto_176777 ?auto_176785 ) ) ( not ( = ?auto_176778 ?auto_176779 ) ) ( not ( = ?auto_176778 ?auto_176780 ) ) ( not ( = ?auto_176778 ?auto_176781 ) ) ( not ( = ?auto_176778 ?auto_176782 ) ) ( not ( = ?auto_176778 ?auto_176783 ) ) ( not ( = ?auto_176778 ?auto_176784 ) ) ( not ( = ?auto_176778 ?auto_176785 ) ) ( not ( = ?auto_176779 ?auto_176780 ) ) ( not ( = ?auto_176779 ?auto_176781 ) ) ( not ( = ?auto_176779 ?auto_176782 ) ) ( not ( = ?auto_176779 ?auto_176783 ) ) ( not ( = ?auto_176779 ?auto_176784 ) ) ( not ( = ?auto_176779 ?auto_176785 ) ) ( not ( = ?auto_176780 ?auto_176781 ) ) ( not ( = ?auto_176780 ?auto_176782 ) ) ( not ( = ?auto_176780 ?auto_176783 ) ) ( not ( = ?auto_176780 ?auto_176784 ) ) ( not ( = ?auto_176780 ?auto_176785 ) ) ( not ( = ?auto_176781 ?auto_176782 ) ) ( not ( = ?auto_176781 ?auto_176783 ) ) ( not ( = ?auto_176781 ?auto_176784 ) ) ( not ( = ?auto_176781 ?auto_176785 ) ) ( not ( = ?auto_176782 ?auto_176783 ) ) ( not ( = ?auto_176782 ?auto_176784 ) ) ( not ( = ?auto_176782 ?auto_176785 ) ) ( not ( = ?auto_176783 ?auto_176784 ) ) ( not ( = ?auto_176783 ?auto_176785 ) ) ( not ( = ?auto_176784 ?auto_176785 ) ) ( ON ?auto_176783 ?auto_176784 ) ( CLEAR ?auto_176781 ) ( ON ?auto_176782 ?auto_176783 ) ( CLEAR ?auto_176782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_176774 ?auto_176775 ?auto_176776 ?auto_176777 ?auto_176778 ?auto_176779 ?auto_176780 ?auto_176781 ?auto_176782 )
      ( MAKE-11PILE ?auto_176774 ?auto_176775 ?auto_176776 ?auto_176777 ?auto_176778 ?auto_176779 ?auto_176780 ?auto_176781 ?auto_176782 ?auto_176783 ?auto_176784 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176797 - BLOCK
      ?auto_176798 - BLOCK
      ?auto_176799 - BLOCK
      ?auto_176800 - BLOCK
      ?auto_176801 - BLOCK
      ?auto_176802 - BLOCK
      ?auto_176803 - BLOCK
      ?auto_176804 - BLOCK
      ?auto_176805 - BLOCK
      ?auto_176806 - BLOCK
      ?auto_176807 - BLOCK
    )
    :vars
    (
      ?auto_176808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176807 ?auto_176808 ) ( ON-TABLE ?auto_176797 ) ( ON ?auto_176798 ?auto_176797 ) ( ON ?auto_176799 ?auto_176798 ) ( ON ?auto_176800 ?auto_176799 ) ( ON ?auto_176801 ?auto_176800 ) ( ON ?auto_176802 ?auto_176801 ) ( ON ?auto_176803 ?auto_176802 ) ( ON ?auto_176804 ?auto_176803 ) ( not ( = ?auto_176797 ?auto_176798 ) ) ( not ( = ?auto_176797 ?auto_176799 ) ) ( not ( = ?auto_176797 ?auto_176800 ) ) ( not ( = ?auto_176797 ?auto_176801 ) ) ( not ( = ?auto_176797 ?auto_176802 ) ) ( not ( = ?auto_176797 ?auto_176803 ) ) ( not ( = ?auto_176797 ?auto_176804 ) ) ( not ( = ?auto_176797 ?auto_176805 ) ) ( not ( = ?auto_176797 ?auto_176806 ) ) ( not ( = ?auto_176797 ?auto_176807 ) ) ( not ( = ?auto_176797 ?auto_176808 ) ) ( not ( = ?auto_176798 ?auto_176799 ) ) ( not ( = ?auto_176798 ?auto_176800 ) ) ( not ( = ?auto_176798 ?auto_176801 ) ) ( not ( = ?auto_176798 ?auto_176802 ) ) ( not ( = ?auto_176798 ?auto_176803 ) ) ( not ( = ?auto_176798 ?auto_176804 ) ) ( not ( = ?auto_176798 ?auto_176805 ) ) ( not ( = ?auto_176798 ?auto_176806 ) ) ( not ( = ?auto_176798 ?auto_176807 ) ) ( not ( = ?auto_176798 ?auto_176808 ) ) ( not ( = ?auto_176799 ?auto_176800 ) ) ( not ( = ?auto_176799 ?auto_176801 ) ) ( not ( = ?auto_176799 ?auto_176802 ) ) ( not ( = ?auto_176799 ?auto_176803 ) ) ( not ( = ?auto_176799 ?auto_176804 ) ) ( not ( = ?auto_176799 ?auto_176805 ) ) ( not ( = ?auto_176799 ?auto_176806 ) ) ( not ( = ?auto_176799 ?auto_176807 ) ) ( not ( = ?auto_176799 ?auto_176808 ) ) ( not ( = ?auto_176800 ?auto_176801 ) ) ( not ( = ?auto_176800 ?auto_176802 ) ) ( not ( = ?auto_176800 ?auto_176803 ) ) ( not ( = ?auto_176800 ?auto_176804 ) ) ( not ( = ?auto_176800 ?auto_176805 ) ) ( not ( = ?auto_176800 ?auto_176806 ) ) ( not ( = ?auto_176800 ?auto_176807 ) ) ( not ( = ?auto_176800 ?auto_176808 ) ) ( not ( = ?auto_176801 ?auto_176802 ) ) ( not ( = ?auto_176801 ?auto_176803 ) ) ( not ( = ?auto_176801 ?auto_176804 ) ) ( not ( = ?auto_176801 ?auto_176805 ) ) ( not ( = ?auto_176801 ?auto_176806 ) ) ( not ( = ?auto_176801 ?auto_176807 ) ) ( not ( = ?auto_176801 ?auto_176808 ) ) ( not ( = ?auto_176802 ?auto_176803 ) ) ( not ( = ?auto_176802 ?auto_176804 ) ) ( not ( = ?auto_176802 ?auto_176805 ) ) ( not ( = ?auto_176802 ?auto_176806 ) ) ( not ( = ?auto_176802 ?auto_176807 ) ) ( not ( = ?auto_176802 ?auto_176808 ) ) ( not ( = ?auto_176803 ?auto_176804 ) ) ( not ( = ?auto_176803 ?auto_176805 ) ) ( not ( = ?auto_176803 ?auto_176806 ) ) ( not ( = ?auto_176803 ?auto_176807 ) ) ( not ( = ?auto_176803 ?auto_176808 ) ) ( not ( = ?auto_176804 ?auto_176805 ) ) ( not ( = ?auto_176804 ?auto_176806 ) ) ( not ( = ?auto_176804 ?auto_176807 ) ) ( not ( = ?auto_176804 ?auto_176808 ) ) ( not ( = ?auto_176805 ?auto_176806 ) ) ( not ( = ?auto_176805 ?auto_176807 ) ) ( not ( = ?auto_176805 ?auto_176808 ) ) ( not ( = ?auto_176806 ?auto_176807 ) ) ( not ( = ?auto_176806 ?auto_176808 ) ) ( not ( = ?auto_176807 ?auto_176808 ) ) ( ON ?auto_176806 ?auto_176807 ) ( CLEAR ?auto_176804 ) ( ON ?auto_176805 ?auto_176806 ) ( CLEAR ?auto_176805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_176797 ?auto_176798 ?auto_176799 ?auto_176800 ?auto_176801 ?auto_176802 ?auto_176803 ?auto_176804 ?auto_176805 )
      ( MAKE-11PILE ?auto_176797 ?auto_176798 ?auto_176799 ?auto_176800 ?auto_176801 ?auto_176802 ?auto_176803 ?auto_176804 ?auto_176805 ?auto_176806 ?auto_176807 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176820 - BLOCK
      ?auto_176821 - BLOCK
      ?auto_176822 - BLOCK
      ?auto_176823 - BLOCK
      ?auto_176824 - BLOCK
      ?auto_176825 - BLOCK
      ?auto_176826 - BLOCK
      ?auto_176827 - BLOCK
      ?auto_176828 - BLOCK
      ?auto_176829 - BLOCK
      ?auto_176830 - BLOCK
    )
    :vars
    (
      ?auto_176831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176830 ?auto_176831 ) ( ON-TABLE ?auto_176820 ) ( ON ?auto_176821 ?auto_176820 ) ( ON ?auto_176822 ?auto_176821 ) ( ON ?auto_176823 ?auto_176822 ) ( ON ?auto_176824 ?auto_176823 ) ( ON ?auto_176825 ?auto_176824 ) ( ON ?auto_176826 ?auto_176825 ) ( not ( = ?auto_176820 ?auto_176821 ) ) ( not ( = ?auto_176820 ?auto_176822 ) ) ( not ( = ?auto_176820 ?auto_176823 ) ) ( not ( = ?auto_176820 ?auto_176824 ) ) ( not ( = ?auto_176820 ?auto_176825 ) ) ( not ( = ?auto_176820 ?auto_176826 ) ) ( not ( = ?auto_176820 ?auto_176827 ) ) ( not ( = ?auto_176820 ?auto_176828 ) ) ( not ( = ?auto_176820 ?auto_176829 ) ) ( not ( = ?auto_176820 ?auto_176830 ) ) ( not ( = ?auto_176820 ?auto_176831 ) ) ( not ( = ?auto_176821 ?auto_176822 ) ) ( not ( = ?auto_176821 ?auto_176823 ) ) ( not ( = ?auto_176821 ?auto_176824 ) ) ( not ( = ?auto_176821 ?auto_176825 ) ) ( not ( = ?auto_176821 ?auto_176826 ) ) ( not ( = ?auto_176821 ?auto_176827 ) ) ( not ( = ?auto_176821 ?auto_176828 ) ) ( not ( = ?auto_176821 ?auto_176829 ) ) ( not ( = ?auto_176821 ?auto_176830 ) ) ( not ( = ?auto_176821 ?auto_176831 ) ) ( not ( = ?auto_176822 ?auto_176823 ) ) ( not ( = ?auto_176822 ?auto_176824 ) ) ( not ( = ?auto_176822 ?auto_176825 ) ) ( not ( = ?auto_176822 ?auto_176826 ) ) ( not ( = ?auto_176822 ?auto_176827 ) ) ( not ( = ?auto_176822 ?auto_176828 ) ) ( not ( = ?auto_176822 ?auto_176829 ) ) ( not ( = ?auto_176822 ?auto_176830 ) ) ( not ( = ?auto_176822 ?auto_176831 ) ) ( not ( = ?auto_176823 ?auto_176824 ) ) ( not ( = ?auto_176823 ?auto_176825 ) ) ( not ( = ?auto_176823 ?auto_176826 ) ) ( not ( = ?auto_176823 ?auto_176827 ) ) ( not ( = ?auto_176823 ?auto_176828 ) ) ( not ( = ?auto_176823 ?auto_176829 ) ) ( not ( = ?auto_176823 ?auto_176830 ) ) ( not ( = ?auto_176823 ?auto_176831 ) ) ( not ( = ?auto_176824 ?auto_176825 ) ) ( not ( = ?auto_176824 ?auto_176826 ) ) ( not ( = ?auto_176824 ?auto_176827 ) ) ( not ( = ?auto_176824 ?auto_176828 ) ) ( not ( = ?auto_176824 ?auto_176829 ) ) ( not ( = ?auto_176824 ?auto_176830 ) ) ( not ( = ?auto_176824 ?auto_176831 ) ) ( not ( = ?auto_176825 ?auto_176826 ) ) ( not ( = ?auto_176825 ?auto_176827 ) ) ( not ( = ?auto_176825 ?auto_176828 ) ) ( not ( = ?auto_176825 ?auto_176829 ) ) ( not ( = ?auto_176825 ?auto_176830 ) ) ( not ( = ?auto_176825 ?auto_176831 ) ) ( not ( = ?auto_176826 ?auto_176827 ) ) ( not ( = ?auto_176826 ?auto_176828 ) ) ( not ( = ?auto_176826 ?auto_176829 ) ) ( not ( = ?auto_176826 ?auto_176830 ) ) ( not ( = ?auto_176826 ?auto_176831 ) ) ( not ( = ?auto_176827 ?auto_176828 ) ) ( not ( = ?auto_176827 ?auto_176829 ) ) ( not ( = ?auto_176827 ?auto_176830 ) ) ( not ( = ?auto_176827 ?auto_176831 ) ) ( not ( = ?auto_176828 ?auto_176829 ) ) ( not ( = ?auto_176828 ?auto_176830 ) ) ( not ( = ?auto_176828 ?auto_176831 ) ) ( not ( = ?auto_176829 ?auto_176830 ) ) ( not ( = ?auto_176829 ?auto_176831 ) ) ( not ( = ?auto_176830 ?auto_176831 ) ) ( ON ?auto_176829 ?auto_176830 ) ( ON ?auto_176828 ?auto_176829 ) ( CLEAR ?auto_176826 ) ( ON ?auto_176827 ?auto_176828 ) ( CLEAR ?auto_176827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176820 ?auto_176821 ?auto_176822 ?auto_176823 ?auto_176824 ?auto_176825 ?auto_176826 ?auto_176827 )
      ( MAKE-11PILE ?auto_176820 ?auto_176821 ?auto_176822 ?auto_176823 ?auto_176824 ?auto_176825 ?auto_176826 ?auto_176827 ?auto_176828 ?auto_176829 ?auto_176830 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176843 - BLOCK
      ?auto_176844 - BLOCK
      ?auto_176845 - BLOCK
      ?auto_176846 - BLOCK
      ?auto_176847 - BLOCK
      ?auto_176848 - BLOCK
      ?auto_176849 - BLOCK
      ?auto_176850 - BLOCK
      ?auto_176851 - BLOCK
      ?auto_176852 - BLOCK
      ?auto_176853 - BLOCK
    )
    :vars
    (
      ?auto_176854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176853 ?auto_176854 ) ( ON-TABLE ?auto_176843 ) ( ON ?auto_176844 ?auto_176843 ) ( ON ?auto_176845 ?auto_176844 ) ( ON ?auto_176846 ?auto_176845 ) ( ON ?auto_176847 ?auto_176846 ) ( ON ?auto_176848 ?auto_176847 ) ( ON ?auto_176849 ?auto_176848 ) ( not ( = ?auto_176843 ?auto_176844 ) ) ( not ( = ?auto_176843 ?auto_176845 ) ) ( not ( = ?auto_176843 ?auto_176846 ) ) ( not ( = ?auto_176843 ?auto_176847 ) ) ( not ( = ?auto_176843 ?auto_176848 ) ) ( not ( = ?auto_176843 ?auto_176849 ) ) ( not ( = ?auto_176843 ?auto_176850 ) ) ( not ( = ?auto_176843 ?auto_176851 ) ) ( not ( = ?auto_176843 ?auto_176852 ) ) ( not ( = ?auto_176843 ?auto_176853 ) ) ( not ( = ?auto_176843 ?auto_176854 ) ) ( not ( = ?auto_176844 ?auto_176845 ) ) ( not ( = ?auto_176844 ?auto_176846 ) ) ( not ( = ?auto_176844 ?auto_176847 ) ) ( not ( = ?auto_176844 ?auto_176848 ) ) ( not ( = ?auto_176844 ?auto_176849 ) ) ( not ( = ?auto_176844 ?auto_176850 ) ) ( not ( = ?auto_176844 ?auto_176851 ) ) ( not ( = ?auto_176844 ?auto_176852 ) ) ( not ( = ?auto_176844 ?auto_176853 ) ) ( not ( = ?auto_176844 ?auto_176854 ) ) ( not ( = ?auto_176845 ?auto_176846 ) ) ( not ( = ?auto_176845 ?auto_176847 ) ) ( not ( = ?auto_176845 ?auto_176848 ) ) ( not ( = ?auto_176845 ?auto_176849 ) ) ( not ( = ?auto_176845 ?auto_176850 ) ) ( not ( = ?auto_176845 ?auto_176851 ) ) ( not ( = ?auto_176845 ?auto_176852 ) ) ( not ( = ?auto_176845 ?auto_176853 ) ) ( not ( = ?auto_176845 ?auto_176854 ) ) ( not ( = ?auto_176846 ?auto_176847 ) ) ( not ( = ?auto_176846 ?auto_176848 ) ) ( not ( = ?auto_176846 ?auto_176849 ) ) ( not ( = ?auto_176846 ?auto_176850 ) ) ( not ( = ?auto_176846 ?auto_176851 ) ) ( not ( = ?auto_176846 ?auto_176852 ) ) ( not ( = ?auto_176846 ?auto_176853 ) ) ( not ( = ?auto_176846 ?auto_176854 ) ) ( not ( = ?auto_176847 ?auto_176848 ) ) ( not ( = ?auto_176847 ?auto_176849 ) ) ( not ( = ?auto_176847 ?auto_176850 ) ) ( not ( = ?auto_176847 ?auto_176851 ) ) ( not ( = ?auto_176847 ?auto_176852 ) ) ( not ( = ?auto_176847 ?auto_176853 ) ) ( not ( = ?auto_176847 ?auto_176854 ) ) ( not ( = ?auto_176848 ?auto_176849 ) ) ( not ( = ?auto_176848 ?auto_176850 ) ) ( not ( = ?auto_176848 ?auto_176851 ) ) ( not ( = ?auto_176848 ?auto_176852 ) ) ( not ( = ?auto_176848 ?auto_176853 ) ) ( not ( = ?auto_176848 ?auto_176854 ) ) ( not ( = ?auto_176849 ?auto_176850 ) ) ( not ( = ?auto_176849 ?auto_176851 ) ) ( not ( = ?auto_176849 ?auto_176852 ) ) ( not ( = ?auto_176849 ?auto_176853 ) ) ( not ( = ?auto_176849 ?auto_176854 ) ) ( not ( = ?auto_176850 ?auto_176851 ) ) ( not ( = ?auto_176850 ?auto_176852 ) ) ( not ( = ?auto_176850 ?auto_176853 ) ) ( not ( = ?auto_176850 ?auto_176854 ) ) ( not ( = ?auto_176851 ?auto_176852 ) ) ( not ( = ?auto_176851 ?auto_176853 ) ) ( not ( = ?auto_176851 ?auto_176854 ) ) ( not ( = ?auto_176852 ?auto_176853 ) ) ( not ( = ?auto_176852 ?auto_176854 ) ) ( not ( = ?auto_176853 ?auto_176854 ) ) ( ON ?auto_176852 ?auto_176853 ) ( ON ?auto_176851 ?auto_176852 ) ( CLEAR ?auto_176849 ) ( ON ?auto_176850 ?auto_176851 ) ( CLEAR ?auto_176850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_176843 ?auto_176844 ?auto_176845 ?auto_176846 ?auto_176847 ?auto_176848 ?auto_176849 ?auto_176850 )
      ( MAKE-11PILE ?auto_176843 ?auto_176844 ?auto_176845 ?auto_176846 ?auto_176847 ?auto_176848 ?auto_176849 ?auto_176850 ?auto_176851 ?auto_176852 ?auto_176853 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176866 - BLOCK
      ?auto_176867 - BLOCK
      ?auto_176868 - BLOCK
      ?auto_176869 - BLOCK
      ?auto_176870 - BLOCK
      ?auto_176871 - BLOCK
      ?auto_176872 - BLOCK
      ?auto_176873 - BLOCK
      ?auto_176874 - BLOCK
      ?auto_176875 - BLOCK
      ?auto_176876 - BLOCK
    )
    :vars
    (
      ?auto_176877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176876 ?auto_176877 ) ( ON-TABLE ?auto_176866 ) ( ON ?auto_176867 ?auto_176866 ) ( ON ?auto_176868 ?auto_176867 ) ( ON ?auto_176869 ?auto_176868 ) ( ON ?auto_176870 ?auto_176869 ) ( ON ?auto_176871 ?auto_176870 ) ( not ( = ?auto_176866 ?auto_176867 ) ) ( not ( = ?auto_176866 ?auto_176868 ) ) ( not ( = ?auto_176866 ?auto_176869 ) ) ( not ( = ?auto_176866 ?auto_176870 ) ) ( not ( = ?auto_176866 ?auto_176871 ) ) ( not ( = ?auto_176866 ?auto_176872 ) ) ( not ( = ?auto_176866 ?auto_176873 ) ) ( not ( = ?auto_176866 ?auto_176874 ) ) ( not ( = ?auto_176866 ?auto_176875 ) ) ( not ( = ?auto_176866 ?auto_176876 ) ) ( not ( = ?auto_176866 ?auto_176877 ) ) ( not ( = ?auto_176867 ?auto_176868 ) ) ( not ( = ?auto_176867 ?auto_176869 ) ) ( not ( = ?auto_176867 ?auto_176870 ) ) ( not ( = ?auto_176867 ?auto_176871 ) ) ( not ( = ?auto_176867 ?auto_176872 ) ) ( not ( = ?auto_176867 ?auto_176873 ) ) ( not ( = ?auto_176867 ?auto_176874 ) ) ( not ( = ?auto_176867 ?auto_176875 ) ) ( not ( = ?auto_176867 ?auto_176876 ) ) ( not ( = ?auto_176867 ?auto_176877 ) ) ( not ( = ?auto_176868 ?auto_176869 ) ) ( not ( = ?auto_176868 ?auto_176870 ) ) ( not ( = ?auto_176868 ?auto_176871 ) ) ( not ( = ?auto_176868 ?auto_176872 ) ) ( not ( = ?auto_176868 ?auto_176873 ) ) ( not ( = ?auto_176868 ?auto_176874 ) ) ( not ( = ?auto_176868 ?auto_176875 ) ) ( not ( = ?auto_176868 ?auto_176876 ) ) ( not ( = ?auto_176868 ?auto_176877 ) ) ( not ( = ?auto_176869 ?auto_176870 ) ) ( not ( = ?auto_176869 ?auto_176871 ) ) ( not ( = ?auto_176869 ?auto_176872 ) ) ( not ( = ?auto_176869 ?auto_176873 ) ) ( not ( = ?auto_176869 ?auto_176874 ) ) ( not ( = ?auto_176869 ?auto_176875 ) ) ( not ( = ?auto_176869 ?auto_176876 ) ) ( not ( = ?auto_176869 ?auto_176877 ) ) ( not ( = ?auto_176870 ?auto_176871 ) ) ( not ( = ?auto_176870 ?auto_176872 ) ) ( not ( = ?auto_176870 ?auto_176873 ) ) ( not ( = ?auto_176870 ?auto_176874 ) ) ( not ( = ?auto_176870 ?auto_176875 ) ) ( not ( = ?auto_176870 ?auto_176876 ) ) ( not ( = ?auto_176870 ?auto_176877 ) ) ( not ( = ?auto_176871 ?auto_176872 ) ) ( not ( = ?auto_176871 ?auto_176873 ) ) ( not ( = ?auto_176871 ?auto_176874 ) ) ( not ( = ?auto_176871 ?auto_176875 ) ) ( not ( = ?auto_176871 ?auto_176876 ) ) ( not ( = ?auto_176871 ?auto_176877 ) ) ( not ( = ?auto_176872 ?auto_176873 ) ) ( not ( = ?auto_176872 ?auto_176874 ) ) ( not ( = ?auto_176872 ?auto_176875 ) ) ( not ( = ?auto_176872 ?auto_176876 ) ) ( not ( = ?auto_176872 ?auto_176877 ) ) ( not ( = ?auto_176873 ?auto_176874 ) ) ( not ( = ?auto_176873 ?auto_176875 ) ) ( not ( = ?auto_176873 ?auto_176876 ) ) ( not ( = ?auto_176873 ?auto_176877 ) ) ( not ( = ?auto_176874 ?auto_176875 ) ) ( not ( = ?auto_176874 ?auto_176876 ) ) ( not ( = ?auto_176874 ?auto_176877 ) ) ( not ( = ?auto_176875 ?auto_176876 ) ) ( not ( = ?auto_176875 ?auto_176877 ) ) ( not ( = ?auto_176876 ?auto_176877 ) ) ( ON ?auto_176875 ?auto_176876 ) ( ON ?auto_176874 ?auto_176875 ) ( ON ?auto_176873 ?auto_176874 ) ( CLEAR ?auto_176871 ) ( ON ?auto_176872 ?auto_176873 ) ( CLEAR ?auto_176872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176866 ?auto_176867 ?auto_176868 ?auto_176869 ?auto_176870 ?auto_176871 ?auto_176872 )
      ( MAKE-11PILE ?auto_176866 ?auto_176867 ?auto_176868 ?auto_176869 ?auto_176870 ?auto_176871 ?auto_176872 ?auto_176873 ?auto_176874 ?auto_176875 ?auto_176876 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176889 - BLOCK
      ?auto_176890 - BLOCK
      ?auto_176891 - BLOCK
      ?auto_176892 - BLOCK
      ?auto_176893 - BLOCK
      ?auto_176894 - BLOCK
      ?auto_176895 - BLOCK
      ?auto_176896 - BLOCK
      ?auto_176897 - BLOCK
      ?auto_176898 - BLOCK
      ?auto_176899 - BLOCK
    )
    :vars
    (
      ?auto_176900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176899 ?auto_176900 ) ( ON-TABLE ?auto_176889 ) ( ON ?auto_176890 ?auto_176889 ) ( ON ?auto_176891 ?auto_176890 ) ( ON ?auto_176892 ?auto_176891 ) ( ON ?auto_176893 ?auto_176892 ) ( ON ?auto_176894 ?auto_176893 ) ( not ( = ?auto_176889 ?auto_176890 ) ) ( not ( = ?auto_176889 ?auto_176891 ) ) ( not ( = ?auto_176889 ?auto_176892 ) ) ( not ( = ?auto_176889 ?auto_176893 ) ) ( not ( = ?auto_176889 ?auto_176894 ) ) ( not ( = ?auto_176889 ?auto_176895 ) ) ( not ( = ?auto_176889 ?auto_176896 ) ) ( not ( = ?auto_176889 ?auto_176897 ) ) ( not ( = ?auto_176889 ?auto_176898 ) ) ( not ( = ?auto_176889 ?auto_176899 ) ) ( not ( = ?auto_176889 ?auto_176900 ) ) ( not ( = ?auto_176890 ?auto_176891 ) ) ( not ( = ?auto_176890 ?auto_176892 ) ) ( not ( = ?auto_176890 ?auto_176893 ) ) ( not ( = ?auto_176890 ?auto_176894 ) ) ( not ( = ?auto_176890 ?auto_176895 ) ) ( not ( = ?auto_176890 ?auto_176896 ) ) ( not ( = ?auto_176890 ?auto_176897 ) ) ( not ( = ?auto_176890 ?auto_176898 ) ) ( not ( = ?auto_176890 ?auto_176899 ) ) ( not ( = ?auto_176890 ?auto_176900 ) ) ( not ( = ?auto_176891 ?auto_176892 ) ) ( not ( = ?auto_176891 ?auto_176893 ) ) ( not ( = ?auto_176891 ?auto_176894 ) ) ( not ( = ?auto_176891 ?auto_176895 ) ) ( not ( = ?auto_176891 ?auto_176896 ) ) ( not ( = ?auto_176891 ?auto_176897 ) ) ( not ( = ?auto_176891 ?auto_176898 ) ) ( not ( = ?auto_176891 ?auto_176899 ) ) ( not ( = ?auto_176891 ?auto_176900 ) ) ( not ( = ?auto_176892 ?auto_176893 ) ) ( not ( = ?auto_176892 ?auto_176894 ) ) ( not ( = ?auto_176892 ?auto_176895 ) ) ( not ( = ?auto_176892 ?auto_176896 ) ) ( not ( = ?auto_176892 ?auto_176897 ) ) ( not ( = ?auto_176892 ?auto_176898 ) ) ( not ( = ?auto_176892 ?auto_176899 ) ) ( not ( = ?auto_176892 ?auto_176900 ) ) ( not ( = ?auto_176893 ?auto_176894 ) ) ( not ( = ?auto_176893 ?auto_176895 ) ) ( not ( = ?auto_176893 ?auto_176896 ) ) ( not ( = ?auto_176893 ?auto_176897 ) ) ( not ( = ?auto_176893 ?auto_176898 ) ) ( not ( = ?auto_176893 ?auto_176899 ) ) ( not ( = ?auto_176893 ?auto_176900 ) ) ( not ( = ?auto_176894 ?auto_176895 ) ) ( not ( = ?auto_176894 ?auto_176896 ) ) ( not ( = ?auto_176894 ?auto_176897 ) ) ( not ( = ?auto_176894 ?auto_176898 ) ) ( not ( = ?auto_176894 ?auto_176899 ) ) ( not ( = ?auto_176894 ?auto_176900 ) ) ( not ( = ?auto_176895 ?auto_176896 ) ) ( not ( = ?auto_176895 ?auto_176897 ) ) ( not ( = ?auto_176895 ?auto_176898 ) ) ( not ( = ?auto_176895 ?auto_176899 ) ) ( not ( = ?auto_176895 ?auto_176900 ) ) ( not ( = ?auto_176896 ?auto_176897 ) ) ( not ( = ?auto_176896 ?auto_176898 ) ) ( not ( = ?auto_176896 ?auto_176899 ) ) ( not ( = ?auto_176896 ?auto_176900 ) ) ( not ( = ?auto_176897 ?auto_176898 ) ) ( not ( = ?auto_176897 ?auto_176899 ) ) ( not ( = ?auto_176897 ?auto_176900 ) ) ( not ( = ?auto_176898 ?auto_176899 ) ) ( not ( = ?auto_176898 ?auto_176900 ) ) ( not ( = ?auto_176899 ?auto_176900 ) ) ( ON ?auto_176898 ?auto_176899 ) ( ON ?auto_176897 ?auto_176898 ) ( ON ?auto_176896 ?auto_176897 ) ( CLEAR ?auto_176894 ) ( ON ?auto_176895 ?auto_176896 ) ( CLEAR ?auto_176895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_176889 ?auto_176890 ?auto_176891 ?auto_176892 ?auto_176893 ?auto_176894 ?auto_176895 )
      ( MAKE-11PILE ?auto_176889 ?auto_176890 ?auto_176891 ?auto_176892 ?auto_176893 ?auto_176894 ?auto_176895 ?auto_176896 ?auto_176897 ?auto_176898 ?auto_176899 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176912 - BLOCK
      ?auto_176913 - BLOCK
      ?auto_176914 - BLOCK
      ?auto_176915 - BLOCK
      ?auto_176916 - BLOCK
      ?auto_176917 - BLOCK
      ?auto_176918 - BLOCK
      ?auto_176919 - BLOCK
      ?auto_176920 - BLOCK
      ?auto_176921 - BLOCK
      ?auto_176922 - BLOCK
    )
    :vars
    (
      ?auto_176923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176922 ?auto_176923 ) ( ON-TABLE ?auto_176912 ) ( ON ?auto_176913 ?auto_176912 ) ( ON ?auto_176914 ?auto_176913 ) ( ON ?auto_176915 ?auto_176914 ) ( ON ?auto_176916 ?auto_176915 ) ( not ( = ?auto_176912 ?auto_176913 ) ) ( not ( = ?auto_176912 ?auto_176914 ) ) ( not ( = ?auto_176912 ?auto_176915 ) ) ( not ( = ?auto_176912 ?auto_176916 ) ) ( not ( = ?auto_176912 ?auto_176917 ) ) ( not ( = ?auto_176912 ?auto_176918 ) ) ( not ( = ?auto_176912 ?auto_176919 ) ) ( not ( = ?auto_176912 ?auto_176920 ) ) ( not ( = ?auto_176912 ?auto_176921 ) ) ( not ( = ?auto_176912 ?auto_176922 ) ) ( not ( = ?auto_176912 ?auto_176923 ) ) ( not ( = ?auto_176913 ?auto_176914 ) ) ( not ( = ?auto_176913 ?auto_176915 ) ) ( not ( = ?auto_176913 ?auto_176916 ) ) ( not ( = ?auto_176913 ?auto_176917 ) ) ( not ( = ?auto_176913 ?auto_176918 ) ) ( not ( = ?auto_176913 ?auto_176919 ) ) ( not ( = ?auto_176913 ?auto_176920 ) ) ( not ( = ?auto_176913 ?auto_176921 ) ) ( not ( = ?auto_176913 ?auto_176922 ) ) ( not ( = ?auto_176913 ?auto_176923 ) ) ( not ( = ?auto_176914 ?auto_176915 ) ) ( not ( = ?auto_176914 ?auto_176916 ) ) ( not ( = ?auto_176914 ?auto_176917 ) ) ( not ( = ?auto_176914 ?auto_176918 ) ) ( not ( = ?auto_176914 ?auto_176919 ) ) ( not ( = ?auto_176914 ?auto_176920 ) ) ( not ( = ?auto_176914 ?auto_176921 ) ) ( not ( = ?auto_176914 ?auto_176922 ) ) ( not ( = ?auto_176914 ?auto_176923 ) ) ( not ( = ?auto_176915 ?auto_176916 ) ) ( not ( = ?auto_176915 ?auto_176917 ) ) ( not ( = ?auto_176915 ?auto_176918 ) ) ( not ( = ?auto_176915 ?auto_176919 ) ) ( not ( = ?auto_176915 ?auto_176920 ) ) ( not ( = ?auto_176915 ?auto_176921 ) ) ( not ( = ?auto_176915 ?auto_176922 ) ) ( not ( = ?auto_176915 ?auto_176923 ) ) ( not ( = ?auto_176916 ?auto_176917 ) ) ( not ( = ?auto_176916 ?auto_176918 ) ) ( not ( = ?auto_176916 ?auto_176919 ) ) ( not ( = ?auto_176916 ?auto_176920 ) ) ( not ( = ?auto_176916 ?auto_176921 ) ) ( not ( = ?auto_176916 ?auto_176922 ) ) ( not ( = ?auto_176916 ?auto_176923 ) ) ( not ( = ?auto_176917 ?auto_176918 ) ) ( not ( = ?auto_176917 ?auto_176919 ) ) ( not ( = ?auto_176917 ?auto_176920 ) ) ( not ( = ?auto_176917 ?auto_176921 ) ) ( not ( = ?auto_176917 ?auto_176922 ) ) ( not ( = ?auto_176917 ?auto_176923 ) ) ( not ( = ?auto_176918 ?auto_176919 ) ) ( not ( = ?auto_176918 ?auto_176920 ) ) ( not ( = ?auto_176918 ?auto_176921 ) ) ( not ( = ?auto_176918 ?auto_176922 ) ) ( not ( = ?auto_176918 ?auto_176923 ) ) ( not ( = ?auto_176919 ?auto_176920 ) ) ( not ( = ?auto_176919 ?auto_176921 ) ) ( not ( = ?auto_176919 ?auto_176922 ) ) ( not ( = ?auto_176919 ?auto_176923 ) ) ( not ( = ?auto_176920 ?auto_176921 ) ) ( not ( = ?auto_176920 ?auto_176922 ) ) ( not ( = ?auto_176920 ?auto_176923 ) ) ( not ( = ?auto_176921 ?auto_176922 ) ) ( not ( = ?auto_176921 ?auto_176923 ) ) ( not ( = ?auto_176922 ?auto_176923 ) ) ( ON ?auto_176921 ?auto_176922 ) ( ON ?auto_176920 ?auto_176921 ) ( ON ?auto_176919 ?auto_176920 ) ( ON ?auto_176918 ?auto_176919 ) ( CLEAR ?auto_176916 ) ( ON ?auto_176917 ?auto_176918 ) ( CLEAR ?auto_176917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176912 ?auto_176913 ?auto_176914 ?auto_176915 ?auto_176916 ?auto_176917 )
      ( MAKE-11PILE ?auto_176912 ?auto_176913 ?auto_176914 ?auto_176915 ?auto_176916 ?auto_176917 ?auto_176918 ?auto_176919 ?auto_176920 ?auto_176921 ?auto_176922 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176935 - BLOCK
      ?auto_176936 - BLOCK
      ?auto_176937 - BLOCK
      ?auto_176938 - BLOCK
      ?auto_176939 - BLOCK
      ?auto_176940 - BLOCK
      ?auto_176941 - BLOCK
      ?auto_176942 - BLOCK
      ?auto_176943 - BLOCK
      ?auto_176944 - BLOCK
      ?auto_176945 - BLOCK
    )
    :vars
    (
      ?auto_176946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176945 ?auto_176946 ) ( ON-TABLE ?auto_176935 ) ( ON ?auto_176936 ?auto_176935 ) ( ON ?auto_176937 ?auto_176936 ) ( ON ?auto_176938 ?auto_176937 ) ( ON ?auto_176939 ?auto_176938 ) ( not ( = ?auto_176935 ?auto_176936 ) ) ( not ( = ?auto_176935 ?auto_176937 ) ) ( not ( = ?auto_176935 ?auto_176938 ) ) ( not ( = ?auto_176935 ?auto_176939 ) ) ( not ( = ?auto_176935 ?auto_176940 ) ) ( not ( = ?auto_176935 ?auto_176941 ) ) ( not ( = ?auto_176935 ?auto_176942 ) ) ( not ( = ?auto_176935 ?auto_176943 ) ) ( not ( = ?auto_176935 ?auto_176944 ) ) ( not ( = ?auto_176935 ?auto_176945 ) ) ( not ( = ?auto_176935 ?auto_176946 ) ) ( not ( = ?auto_176936 ?auto_176937 ) ) ( not ( = ?auto_176936 ?auto_176938 ) ) ( not ( = ?auto_176936 ?auto_176939 ) ) ( not ( = ?auto_176936 ?auto_176940 ) ) ( not ( = ?auto_176936 ?auto_176941 ) ) ( not ( = ?auto_176936 ?auto_176942 ) ) ( not ( = ?auto_176936 ?auto_176943 ) ) ( not ( = ?auto_176936 ?auto_176944 ) ) ( not ( = ?auto_176936 ?auto_176945 ) ) ( not ( = ?auto_176936 ?auto_176946 ) ) ( not ( = ?auto_176937 ?auto_176938 ) ) ( not ( = ?auto_176937 ?auto_176939 ) ) ( not ( = ?auto_176937 ?auto_176940 ) ) ( not ( = ?auto_176937 ?auto_176941 ) ) ( not ( = ?auto_176937 ?auto_176942 ) ) ( not ( = ?auto_176937 ?auto_176943 ) ) ( not ( = ?auto_176937 ?auto_176944 ) ) ( not ( = ?auto_176937 ?auto_176945 ) ) ( not ( = ?auto_176937 ?auto_176946 ) ) ( not ( = ?auto_176938 ?auto_176939 ) ) ( not ( = ?auto_176938 ?auto_176940 ) ) ( not ( = ?auto_176938 ?auto_176941 ) ) ( not ( = ?auto_176938 ?auto_176942 ) ) ( not ( = ?auto_176938 ?auto_176943 ) ) ( not ( = ?auto_176938 ?auto_176944 ) ) ( not ( = ?auto_176938 ?auto_176945 ) ) ( not ( = ?auto_176938 ?auto_176946 ) ) ( not ( = ?auto_176939 ?auto_176940 ) ) ( not ( = ?auto_176939 ?auto_176941 ) ) ( not ( = ?auto_176939 ?auto_176942 ) ) ( not ( = ?auto_176939 ?auto_176943 ) ) ( not ( = ?auto_176939 ?auto_176944 ) ) ( not ( = ?auto_176939 ?auto_176945 ) ) ( not ( = ?auto_176939 ?auto_176946 ) ) ( not ( = ?auto_176940 ?auto_176941 ) ) ( not ( = ?auto_176940 ?auto_176942 ) ) ( not ( = ?auto_176940 ?auto_176943 ) ) ( not ( = ?auto_176940 ?auto_176944 ) ) ( not ( = ?auto_176940 ?auto_176945 ) ) ( not ( = ?auto_176940 ?auto_176946 ) ) ( not ( = ?auto_176941 ?auto_176942 ) ) ( not ( = ?auto_176941 ?auto_176943 ) ) ( not ( = ?auto_176941 ?auto_176944 ) ) ( not ( = ?auto_176941 ?auto_176945 ) ) ( not ( = ?auto_176941 ?auto_176946 ) ) ( not ( = ?auto_176942 ?auto_176943 ) ) ( not ( = ?auto_176942 ?auto_176944 ) ) ( not ( = ?auto_176942 ?auto_176945 ) ) ( not ( = ?auto_176942 ?auto_176946 ) ) ( not ( = ?auto_176943 ?auto_176944 ) ) ( not ( = ?auto_176943 ?auto_176945 ) ) ( not ( = ?auto_176943 ?auto_176946 ) ) ( not ( = ?auto_176944 ?auto_176945 ) ) ( not ( = ?auto_176944 ?auto_176946 ) ) ( not ( = ?auto_176945 ?auto_176946 ) ) ( ON ?auto_176944 ?auto_176945 ) ( ON ?auto_176943 ?auto_176944 ) ( ON ?auto_176942 ?auto_176943 ) ( ON ?auto_176941 ?auto_176942 ) ( CLEAR ?auto_176939 ) ( ON ?auto_176940 ?auto_176941 ) ( CLEAR ?auto_176940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_176935 ?auto_176936 ?auto_176937 ?auto_176938 ?auto_176939 ?auto_176940 )
      ( MAKE-11PILE ?auto_176935 ?auto_176936 ?auto_176937 ?auto_176938 ?auto_176939 ?auto_176940 ?auto_176941 ?auto_176942 ?auto_176943 ?auto_176944 ?auto_176945 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176958 - BLOCK
      ?auto_176959 - BLOCK
      ?auto_176960 - BLOCK
      ?auto_176961 - BLOCK
      ?auto_176962 - BLOCK
      ?auto_176963 - BLOCK
      ?auto_176964 - BLOCK
      ?auto_176965 - BLOCK
      ?auto_176966 - BLOCK
      ?auto_176967 - BLOCK
      ?auto_176968 - BLOCK
    )
    :vars
    (
      ?auto_176969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176968 ?auto_176969 ) ( ON-TABLE ?auto_176958 ) ( ON ?auto_176959 ?auto_176958 ) ( ON ?auto_176960 ?auto_176959 ) ( ON ?auto_176961 ?auto_176960 ) ( not ( = ?auto_176958 ?auto_176959 ) ) ( not ( = ?auto_176958 ?auto_176960 ) ) ( not ( = ?auto_176958 ?auto_176961 ) ) ( not ( = ?auto_176958 ?auto_176962 ) ) ( not ( = ?auto_176958 ?auto_176963 ) ) ( not ( = ?auto_176958 ?auto_176964 ) ) ( not ( = ?auto_176958 ?auto_176965 ) ) ( not ( = ?auto_176958 ?auto_176966 ) ) ( not ( = ?auto_176958 ?auto_176967 ) ) ( not ( = ?auto_176958 ?auto_176968 ) ) ( not ( = ?auto_176958 ?auto_176969 ) ) ( not ( = ?auto_176959 ?auto_176960 ) ) ( not ( = ?auto_176959 ?auto_176961 ) ) ( not ( = ?auto_176959 ?auto_176962 ) ) ( not ( = ?auto_176959 ?auto_176963 ) ) ( not ( = ?auto_176959 ?auto_176964 ) ) ( not ( = ?auto_176959 ?auto_176965 ) ) ( not ( = ?auto_176959 ?auto_176966 ) ) ( not ( = ?auto_176959 ?auto_176967 ) ) ( not ( = ?auto_176959 ?auto_176968 ) ) ( not ( = ?auto_176959 ?auto_176969 ) ) ( not ( = ?auto_176960 ?auto_176961 ) ) ( not ( = ?auto_176960 ?auto_176962 ) ) ( not ( = ?auto_176960 ?auto_176963 ) ) ( not ( = ?auto_176960 ?auto_176964 ) ) ( not ( = ?auto_176960 ?auto_176965 ) ) ( not ( = ?auto_176960 ?auto_176966 ) ) ( not ( = ?auto_176960 ?auto_176967 ) ) ( not ( = ?auto_176960 ?auto_176968 ) ) ( not ( = ?auto_176960 ?auto_176969 ) ) ( not ( = ?auto_176961 ?auto_176962 ) ) ( not ( = ?auto_176961 ?auto_176963 ) ) ( not ( = ?auto_176961 ?auto_176964 ) ) ( not ( = ?auto_176961 ?auto_176965 ) ) ( not ( = ?auto_176961 ?auto_176966 ) ) ( not ( = ?auto_176961 ?auto_176967 ) ) ( not ( = ?auto_176961 ?auto_176968 ) ) ( not ( = ?auto_176961 ?auto_176969 ) ) ( not ( = ?auto_176962 ?auto_176963 ) ) ( not ( = ?auto_176962 ?auto_176964 ) ) ( not ( = ?auto_176962 ?auto_176965 ) ) ( not ( = ?auto_176962 ?auto_176966 ) ) ( not ( = ?auto_176962 ?auto_176967 ) ) ( not ( = ?auto_176962 ?auto_176968 ) ) ( not ( = ?auto_176962 ?auto_176969 ) ) ( not ( = ?auto_176963 ?auto_176964 ) ) ( not ( = ?auto_176963 ?auto_176965 ) ) ( not ( = ?auto_176963 ?auto_176966 ) ) ( not ( = ?auto_176963 ?auto_176967 ) ) ( not ( = ?auto_176963 ?auto_176968 ) ) ( not ( = ?auto_176963 ?auto_176969 ) ) ( not ( = ?auto_176964 ?auto_176965 ) ) ( not ( = ?auto_176964 ?auto_176966 ) ) ( not ( = ?auto_176964 ?auto_176967 ) ) ( not ( = ?auto_176964 ?auto_176968 ) ) ( not ( = ?auto_176964 ?auto_176969 ) ) ( not ( = ?auto_176965 ?auto_176966 ) ) ( not ( = ?auto_176965 ?auto_176967 ) ) ( not ( = ?auto_176965 ?auto_176968 ) ) ( not ( = ?auto_176965 ?auto_176969 ) ) ( not ( = ?auto_176966 ?auto_176967 ) ) ( not ( = ?auto_176966 ?auto_176968 ) ) ( not ( = ?auto_176966 ?auto_176969 ) ) ( not ( = ?auto_176967 ?auto_176968 ) ) ( not ( = ?auto_176967 ?auto_176969 ) ) ( not ( = ?auto_176968 ?auto_176969 ) ) ( ON ?auto_176967 ?auto_176968 ) ( ON ?auto_176966 ?auto_176967 ) ( ON ?auto_176965 ?auto_176966 ) ( ON ?auto_176964 ?auto_176965 ) ( ON ?auto_176963 ?auto_176964 ) ( CLEAR ?auto_176961 ) ( ON ?auto_176962 ?auto_176963 ) ( CLEAR ?auto_176962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176958 ?auto_176959 ?auto_176960 ?auto_176961 ?auto_176962 )
      ( MAKE-11PILE ?auto_176958 ?auto_176959 ?auto_176960 ?auto_176961 ?auto_176962 ?auto_176963 ?auto_176964 ?auto_176965 ?auto_176966 ?auto_176967 ?auto_176968 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_176981 - BLOCK
      ?auto_176982 - BLOCK
      ?auto_176983 - BLOCK
      ?auto_176984 - BLOCK
      ?auto_176985 - BLOCK
      ?auto_176986 - BLOCK
      ?auto_176987 - BLOCK
      ?auto_176988 - BLOCK
      ?auto_176989 - BLOCK
      ?auto_176990 - BLOCK
      ?auto_176991 - BLOCK
    )
    :vars
    (
      ?auto_176992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_176991 ?auto_176992 ) ( ON-TABLE ?auto_176981 ) ( ON ?auto_176982 ?auto_176981 ) ( ON ?auto_176983 ?auto_176982 ) ( ON ?auto_176984 ?auto_176983 ) ( not ( = ?auto_176981 ?auto_176982 ) ) ( not ( = ?auto_176981 ?auto_176983 ) ) ( not ( = ?auto_176981 ?auto_176984 ) ) ( not ( = ?auto_176981 ?auto_176985 ) ) ( not ( = ?auto_176981 ?auto_176986 ) ) ( not ( = ?auto_176981 ?auto_176987 ) ) ( not ( = ?auto_176981 ?auto_176988 ) ) ( not ( = ?auto_176981 ?auto_176989 ) ) ( not ( = ?auto_176981 ?auto_176990 ) ) ( not ( = ?auto_176981 ?auto_176991 ) ) ( not ( = ?auto_176981 ?auto_176992 ) ) ( not ( = ?auto_176982 ?auto_176983 ) ) ( not ( = ?auto_176982 ?auto_176984 ) ) ( not ( = ?auto_176982 ?auto_176985 ) ) ( not ( = ?auto_176982 ?auto_176986 ) ) ( not ( = ?auto_176982 ?auto_176987 ) ) ( not ( = ?auto_176982 ?auto_176988 ) ) ( not ( = ?auto_176982 ?auto_176989 ) ) ( not ( = ?auto_176982 ?auto_176990 ) ) ( not ( = ?auto_176982 ?auto_176991 ) ) ( not ( = ?auto_176982 ?auto_176992 ) ) ( not ( = ?auto_176983 ?auto_176984 ) ) ( not ( = ?auto_176983 ?auto_176985 ) ) ( not ( = ?auto_176983 ?auto_176986 ) ) ( not ( = ?auto_176983 ?auto_176987 ) ) ( not ( = ?auto_176983 ?auto_176988 ) ) ( not ( = ?auto_176983 ?auto_176989 ) ) ( not ( = ?auto_176983 ?auto_176990 ) ) ( not ( = ?auto_176983 ?auto_176991 ) ) ( not ( = ?auto_176983 ?auto_176992 ) ) ( not ( = ?auto_176984 ?auto_176985 ) ) ( not ( = ?auto_176984 ?auto_176986 ) ) ( not ( = ?auto_176984 ?auto_176987 ) ) ( not ( = ?auto_176984 ?auto_176988 ) ) ( not ( = ?auto_176984 ?auto_176989 ) ) ( not ( = ?auto_176984 ?auto_176990 ) ) ( not ( = ?auto_176984 ?auto_176991 ) ) ( not ( = ?auto_176984 ?auto_176992 ) ) ( not ( = ?auto_176985 ?auto_176986 ) ) ( not ( = ?auto_176985 ?auto_176987 ) ) ( not ( = ?auto_176985 ?auto_176988 ) ) ( not ( = ?auto_176985 ?auto_176989 ) ) ( not ( = ?auto_176985 ?auto_176990 ) ) ( not ( = ?auto_176985 ?auto_176991 ) ) ( not ( = ?auto_176985 ?auto_176992 ) ) ( not ( = ?auto_176986 ?auto_176987 ) ) ( not ( = ?auto_176986 ?auto_176988 ) ) ( not ( = ?auto_176986 ?auto_176989 ) ) ( not ( = ?auto_176986 ?auto_176990 ) ) ( not ( = ?auto_176986 ?auto_176991 ) ) ( not ( = ?auto_176986 ?auto_176992 ) ) ( not ( = ?auto_176987 ?auto_176988 ) ) ( not ( = ?auto_176987 ?auto_176989 ) ) ( not ( = ?auto_176987 ?auto_176990 ) ) ( not ( = ?auto_176987 ?auto_176991 ) ) ( not ( = ?auto_176987 ?auto_176992 ) ) ( not ( = ?auto_176988 ?auto_176989 ) ) ( not ( = ?auto_176988 ?auto_176990 ) ) ( not ( = ?auto_176988 ?auto_176991 ) ) ( not ( = ?auto_176988 ?auto_176992 ) ) ( not ( = ?auto_176989 ?auto_176990 ) ) ( not ( = ?auto_176989 ?auto_176991 ) ) ( not ( = ?auto_176989 ?auto_176992 ) ) ( not ( = ?auto_176990 ?auto_176991 ) ) ( not ( = ?auto_176990 ?auto_176992 ) ) ( not ( = ?auto_176991 ?auto_176992 ) ) ( ON ?auto_176990 ?auto_176991 ) ( ON ?auto_176989 ?auto_176990 ) ( ON ?auto_176988 ?auto_176989 ) ( ON ?auto_176987 ?auto_176988 ) ( ON ?auto_176986 ?auto_176987 ) ( CLEAR ?auto_176984 ) ( ON ?auto_176985 ?auto_176986 ) ( CLEAR ?auto_176985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_176981 ?auto_176982 ?auto_176983 ?auto_176984 ?auto_176985 )
      ( MAKE-11PILE ?auto_176981 ?auto_176982 ?auto_176983 ?auto_176984 ?auto_176985 ?auto_176986 ?auto_176987 ?auto_176988 ?auto_176989 ?auto_176990 ?auto_176991 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177004 - BLOCK
      ?auto_177005 - BLOCK
      ?auto_177006 - BLOCK
      ?auto_177007 - BLOCK
      ?auto_177008 - BLOCK
      ?auto_177009 - BLOCK
      ?auto_177010 - BLOCK
      ?auto_177011 - BLOCK
      ?auto_177012 - BLOCK
      ?auto_177013 - BLOCK
      ?auto_177014 - BLOCK
    )
    :vars
    (
      ?auto_177015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177014 ?auto_177015 ) ( ON-TABLE ?auto_177004 ) ( ON ?auto_177005 ?auto_177004 ) ( ON ?auto_177006 ?auto_177005 ) ( not ( = ?auto_177004 ?auto_177005 ) ) ( not ( = ?auto_177004 ?auto_177006 ) ) ( not ( = ?auto_177004 ?auto_177007 ) ) ( not ( = ?auto_177004 ?auto_177008 ) ) ( not ( = ?auto_177004 ?auto_177009 ) ) ( not ( = ?auto_177004 ?auto_177010 ) ) ( not ( = ?auto_177004 ?auto_177011 ) ) ( not ( = ?auto_177004 ?auto_177012 ) ) ( not ( = ?auto_177004 ?auto_177013 ) ) ( not ( = ?auto_177004 ?auto_177014 ) ) ( not ( = ?auto_177004 ?auto_177015 ) ) ( not ( = ?auto_177005 ?auto_177006 ) ) ( not ( = ?auto_177005 ?auto_177007 ) ) ( not ( = ?auto_177005 ?auto_177008 ) ) ( not ( = ?auto_177005 ?auto_177009 ) ) ( not ( = ?auto_177005 ?auto_177010 ) ) ( not ( = ?auto_177005 ?auto_177011 ) ) ( not ( = ?auto_177005 ?auto_177012 ) ) ( not ( = ?auto_177005 ?auto_177013 ) ) ( not ( = ?auto_177005 ?auto_177014 ) ) ( not ( = ?auto_177005 ?auto_177015 ) ) ( not ( = ?auto_177006 ?auto_177007 ) ) ( not ( = ?auto_177006 ?auto_177008 ) ) ( not ( = ?auto_177006 ?auto_177009 ) ) ( not ( = ?auto_177006 ?auto_177010 ) ) ( not ( = ?auto_177006 ?auto_177011 ) ) ( not ( = ?auto_177006 ?auto_177012 ) ) ( not ( = ?auto_177006 ?auto_177013 ) ) ( not ( = ?auto_177006 ?auto_177014 ) ) ( not ( = ?auto_177006 ?auto_177015 ) ) ( not ( = ?auto_177007 ?auto_177008 ) ) ( not ( = ?auto_177007 ?auto_177009 ) ) ( not ( = ?auto_177007 ?auto_177010 ) ) ( not ( = ?auto_177007 ?auto_177011 ) ) ( not ( = ?auto_177007 ?auto_177012 ) ) ( not ( = ?auto_177007 ?auto_177013 ) ) ( not ( = ?auto_177007 ?auto_177014 ) ) ( not ( = ?auto_177007 ?auto_177015 ) ) ( not ( = ?auto_177008 ?auto_177009 ) ) ( not ( = ?auto_177008 ?auto_177010 ) ) ( not ( = ?auto_177008 ?auto_177011 ) ) ( not ( = ?auto_177008 ?auto_177012 ) ) ( not ( = ?auto_177008 ?auto_177013 ) ) ( not ( = ?auto_177008 ?auto_177014 ) ) ( not ( = ?auto_177008 ?auto_177015 ) ) ( not ( = ?auto_177009 ?auto_177010 ) ) ( not ( = ?auto_177009 ?auto_177011 ) ) ( not ( = ?auto_177009 ?auto_177012 ) ) ( not ( = ?auto_177009 ?auto_177013 ) ) ( not ( = ?auto_177009 ?auto_177014 ) ) ( not ( = ?auto_177009 ?auto_177015 ) ) ( not ( = ?auto_177010 ?auto_177011 ) ) ( not ( = ?auto_177010 ?auto_177012 ) ) ( not ( = ?auto_177010 ?auto_177013 ) ) ( not ( = ?auto_177010 ?auto_177014 ) ) ( not ( = ?auto_177010 ?auto_177015 ) ) ( not ( = ?auto_177011 ?auto_177012 ) ) ( not ( = ?auto_177011 ?auto_177013 ) ) ( not ( = ?auto_177011 ?auto_177014 ) ) ( not ( = ?auto_177011 ?auto_177015 ) ) ( not ( = ?auto_177012 ?auto_177013 ) ) ( not ( = ?auto_177012 ?auto_177014 ) ) ( not ( = ?auto_177012 ?auto_177015 ) ) ( not ( = ?auto_177013 ?auto_177014 ) ) ( not ( = ?auto_177013 ?auto_177015 ) ) ( not ( = ?auto_177014 ?auto_177015 ) ) ( ON ?auto_177013 ?auto_177014 ) ( ON ?auto_177012 ?auto_177013 ) ( ON ?auto_177011 ?auto_177012 ) ( ON ?auto_177010 ?auto_177011 ) ( ON ?auto_177009 ?auto_177010 ) ( ON ?auto_177008 ?auto_177009 ) ( CLEAR ?auto_177006 ) ( ON ?auto_177007 ?auto_177008 ) ( CLEAR ?auto_177007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177004 ?auto_177005 ?auto_177006 ?auto_177007 )
      ( MAKE-11PILE ?auto_177004 ?auto_177005 ?auto_177006 ?auto_177007 ?auto_177008 ?auto_177009 ?auto_177010 ?auto_177011 ?auto_177012 ?auto_177013 ?auto_177014 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177027 - BLOCK
      ?auto_177028 - BLOCK
      ?auto_177029 - BLOCK
      ?auto_177030 - BLOCK
      ?auto_177031 - BLOCK
      ?auto_177032 - BLOCK
      ?auto_177033 - BLOCK
      ?auto_177034 - BLOCK
      ?auto_177035 - BLOCK
      ?auto_177036 - BLOCK
      ?auto_177037 - BLOCK
    )
    :vars
    (
      ?auto_177038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177037 ?auto_177038 ) ( ON-TABLE ?auto_177027 ) ( ON ?auto_177028 ?auto_177027 ) ( ON ?auto_177029 ?auto_177028 ) ( not ( = ?auto_177027 ?auto_177028 ) ) ( not ( = ?auto_177027 ?auto_177029 ) ) ( not ( = ?auto_177027 ?auto_177030 ) ) ( not ( = ?auto_177027 ?auto_177031 ) ) ( not ( = ?auto_177027 ?auto_177032 ) ) ( not ( = ?auto_177027 ?auto_177033 ) ) ( not ( = ?auto_177027 ?auto_177034 ) ) ( not ( = ?auto_177027 ?auto_177035 ) ) ( not ( = ?auto_177027 ?auto_177036 ) ) ( not ( = ?auto_177027 ?auto_177037 ) ) ( not ( = ?auto_177027 ?auto_177038 ) ) ( not ( = ?auto_177028 ?auto_177029 ) ) ( not ( = ?auto_177028 ?auto_177030 ) ) ( not ( = ?auto_177028 ?auto_177031 ) ) ( not ( = ?auto_177028 ?auto_177032 ) ) ( not ( = ?auto_177028 ?auto_177033 ) ) ( not ( = ?auto_177028 ?auto_177034 ) ) ( not ( = ?auto_177028 ?auto_177035 ) ) ( not ( = ?auto_177028 ?auto_177036 ) ) ( not ( = ?auto_177028 ?auto_177037 ) ) ( not ( = ?auto_177028 ?auto_177038 ) ) ( not ( = ?auto_177029 ?auto_177030 ) ) ( not ( = ?auto_177029 ?auto_177031 ) ) ( not ( = ?auto_177029 ?auto_177032 ) ) ( not ( = ?auto_177029 ?auto_177033 ) ) ( not ( = ?auto_177029 ?auto_177034 ) ) ( not ( = ?auto_177029 ?auto_177035 ) ) ( not ( = ?auto_177029 ?auto_177036 ) ) ( not ( = ?auto_177029 ?auto_177037 ) ) ( not ( = ?auto_177029 ?auto_177038 ) ) ( not ( = ?auto_177030 ?auto_177031 ) ) ( not ( = ?auto_177030 ?auto_177032 ) ) ( not ( = ?auto_177030 ?auto_177033 ) ) ( not ( = ?auto_177030 ?auto_177034 ) ) ( not ( = ?auto_177030 ?auto_177035 ) ) ( not ( = ?auto_177030 ?auto_177036 ) ) ( not ( = ?auto_177030 ?auto_177037 ) ) ( not ( = ?auto_177030 ?auto_177038 ) ) ( not ( = ?auto_177031 ?auto_177032 ) ) ( not ( = ?auto_177031 ?auto_177033 ) ) ( not ( = ?auto_177031 ?auto_177034 ) ) ( not ( = ?auto_177031 ?auto_177035 ) ) ( not ( = ?auto_177031 ?auto_177036 ) ) ( not ( = ?auto_177031 ?auto_177037 ) ) ( not ( = ?auto_177031 ?auto_177038 ) ) ( not ( = ?auto_177032 ?auto_177033 ) ) ( not ( = ?auto_177032 ?auto_177034 ) ) ( not ( = ?auto_177032 ?auto_177035 ) ) ( not ( = ?auto_177032 ?auto_177036 ) ) ( not ( = ?auto_177032 ?auto_177037 ) ) ( not ( = ?auto_177032 ?auto_177038 ) ) ( not ( = ?auto_177033 ?auto_177034 ) ) ( not ( = ?auto_177033 ?auto_177035 ) ) ( not ( = ?auto_177033 ?auto_177036 ) ) ( not ( = ?auto_177033 ?auto_177037 ) ) ( not ( = ?auto_177033 ?auto_177038 ) ) ( not ( = ?auto_177034 ?auto_177035 ) ) ( not ( = ?auto_177034 ?auto_177036 ) ) ( not ( = ?auto_177034 ?auto_177037 ) ) ( not ( = ?auto_177034 ?auto_177038 ) ) ( not ( = ?auto_177035 ?auto_177036 ) ) ( not ( = ?auto_177035 ?auto_177037 ) ) ( not ( = ?auto_177035 ?auto_177038 ) ) ( not ( = ?auto_177036 ?auto_177037 ) ) ( not ( = ?auto_177036 ?auto_177038 ) ) ( not ( = ?auto_177037 ?auto_177038 ) ) ( ON ?auto_177036 ?auto_177037 ) ( ON ?auto_177035 ?auto_177036 ) ( ON ?auto_177034 ?auto_177035 ) ( ON ?auto_177033 ?auto_177034 ) ( ON ?auto_177032 ?auto_177033 ) ( ON ?auto_177031 ?auto_177032 ) ( CLEAR ?auto_177029 ) ( ON ?auto_177030 ?auto_177031 ) ( CLEAR ?auto_177030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177027 ?auto_177028 ?auto_177029 ?auto_177030 )
      ( MAKE-11PILE ?auto_177027 ?auto_177028 ?auto_177029 ?auto_177030 ?auto_177031 ?auto_177032 ?auto_177033 ?auto_177034 ?auto_177035 ?auto_177036 ?auto_177037 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177050 - BLOCK
      ?auto_177051 - BLOCK
      ?auto_177052 - BLOCK
      ?auto_177053 - BLOCK
      ?auto_177054 - BLOCK
      ?auto_177055 - BLOCK
      ?auto_177056 - BLOCK
      ?auto_177057 - BLOCK
      ?auto_177058 - BLOCK
      ?auto_177059 - BLOCK
      ?auto_177060 - BLOCK
    )
    :vars
    (
      ?auto_177061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177060 ?auto_177061 ) ( ON-TABLE ?auto_177050 ) ( ON ?auto_177051 ?auto_177050 ) ( not ( = ?auto_177050 ?auto_177051 ) ) ( not ( = ?auto_177050 ?auto_177052 ) ) ( not ( = ?auto_177050 ?auto_177053 ) ) ( not ( = ?auto_177050 ?auto_177054 ) ) ( not ( = ?auto_177050 ?auto_177055 ) ) ( not ( = ?auto_177050 ?auto_177056 ) ) ( not ( = ?auto_177050 ?auto_177057 ) ) ( not ( = ?auto_177050 ?auto_177058 ) ) ( not ( = ?auto_177050 ?auto_177059 ) ) ( not ( = ?auto_177050 ?auto_177060 ) ) ( not ( = ?auto_177050 ?auto_177061 ) ) ( not ( = ?auto_177051 ?auto_177052 ) ) ( not ( = ?auto_177051 ?auto_177053 ) ) ( not ( = ?auto_177051 ?auto_177054 ) ) ( not ( = ?auto_177051 ?auto_177055 ) ) ( not ( = ?auto_177051 ?auto_177056 ) ) ( not ( = ?auto_177051 ?auto_177057 ) ) ( not ( = ?auto_177051 ?auto_177058 ) ) ( not ( = ?auto_177051 ?auto_177059 ) ) ( not ( = ?auto_177051 ?auto_177060 ) ) ( not ( = ?auto_177051 ?auto_177061 ) ) ( not ( = ?auto_177052 ?auto_177053 ) ) ( not ( = ?auto_177052 ?auto_177054 ) ) ( not ( = ?auto_177052 ?auto_177055 ) ) ( not ( = ?auto_177052 ?auto_177056 ) ) ( not ( = ?auto_177052 ?auto_177057 ) ) ( not ( = ?auto_177052 ?auto_177058 ) ) ( not ( = ?auto_177052 ?auto_177059 ) ) ( not ( = ?auto_177052 ?auto_177060 ) ) ( not ( = ?auto_177052 ?auto_177061 ) ) ( not ( = ?auto_177053 ?auto_177054 ) ) ( not ( = ?auto_177053 ?auto_177055 ) ) ( not ( = ?auto_177053 ?auto_177056 ) ) ( not ( = ?auto_177053 ?auto_177057 ) ) ( not ( = ?auto_177053 ?auto_177058 ) ) ( not ( = ?auto_177053 ?auto_177059 ) ) ( not ( = ?auto_177053 ?auto_177060 ) ) ( not ( = ?auto_177053 ?auto_177061 ) ) ( not ( = ?auto_177054 ?auto_177055 ) ) ( not ( = ?auto_177054 ?auto_177056 ) ) ( not ( = ?auto_177054 ?auto_177057 ) ) ( not ( = ?auto_177054 ?auto_177058 ) ) ( not ( = ?auto_177054 ?auto_177059 ) ) ( not ( = ?auto_177054 ?auto_177060 ) ) ( not ( = ?auto_177054 ?auto_177061 ) ) ( not ( = ?auto_177055 ?auto_177056 ) ) ( not ( = ?auto_177055 ?auto_177057 ) ) ( not ( = ?auto_177055 ?auto_177058 ) ) ( not ( = ?auto_177055 ?auto_177059 ) ) ( not ( = ?auto_177055 ?auto_177060 ) ) ( not ( = ?auto_177055 ?auto_177061 ) ) ( not ( = ?auto_177056 ?auto_177057 ) ) ( not ( = ?auto_177056 ?auto_177058 ) ) ( not ( = ?auto_177056 ?auto_177059 ) ) ( not ( = ?auto_177056 ?auto_177060 ) ) ( not ( = ?auto_177056 ?auto_177061 ) ) ( not ( = ?auto_177057 ?auto_177058 ) ) ( not ( = ?auto_177057 ?auto_177059 ) ) ( not ( = ?auto_177057 ?auto_177060 ) ) ( not ( = ?auto_177057 ?auto_177061 ) ) ( not ( = ?auto_177058 ?auto_177059 ) ) ( not ( = ?auto_177058 ?auto_177060 ) ) ( not ( = ?auto_177058 ?auto_177061 ) ) ( not ( = ?auto_177059 ?auto_177060 ) ) ( not ( = ?auto_177059 ?auto_177061 ) ) ( not ( = ?auto_177060 ?auto_177061 ) ) ( ON ?auto_177059 ?auto_177060 ) ( ON ?auto_177058 ?auto_177059 ) ( ON ?auto_177057 ?auto_177058 ) ( ON ?auto_177056 ?auto_177057 ) ( ON ?auto_177055 ?auto_177056 ) ( ON ?auto_177054 ?auto_177055 ) ( ON ?auto_177053 ?auto_177054 ) ( CLEAR ?auto_177051 ) ( ON ?auto_177052 ?auto_177053 ) ( CLEAR ?auto_177052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177050 ?auto_177051 ?auto_177052 )
      ( MAKE-11PILE ?auto_177050 ?auto_177051 ?auto_177052 ?auto_177053 ?auto_177054 ?auto_177055 ?auto_177056 ?auto_177057 ?auto_177058 ?auto_177059 ?auto_177060 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177073 - BLOCK
      ?auto_177074 - BLOCK
      ?auto_177075 - BLOCK
      ?auto_177076 - BLOCK
      ?auto_177077 - BLOCK
      ?auto_177078 - BLOCK
      ?auto_177079 - BLOCK
      ?auto_177080 - BLOCK
      ?auto_177081 - BLOCK
      ?auto_177082 - BLOCK
      ?auto_177083 - BLOCK
    )
    :vars
    (
      ?auto_177084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177083 ?auto_177084 ) ( ON-TABLE ?auto_177073 ) ( ON ?auto_177074 ?auto_177073 ) ( not ( = ?auto_177073 ?auto_177074 ) ) ( not ( = ?auto_177073 ?auto_177075 ) ) ( not ( = ?auto_177073 ?auto_177076 ) ) ( not ( = ?auto_177073 ?auto_177077 ) ) ( not ( = ?auto_177073 ?auto_177078 ) ) ( not ( = ?auto_177073 ?auto_177079 ) ) ( not ( = ?auto_177073 ?auto_177080 ) ) ( not ( = ?auto_177073 ?auto_177081 ) ) ( not ( = ?auto_177073 ?auto_177082 ) ) ( not ( = ?auto_177073 ?auto_177083 ) ) ( not ( = ?auto_177073 ?auto_177084 ) ) ( not ( = ?auto_177074 ?auto_177075 ) ) ( not ( = ?auto_177074 ?auto_177076 ) ) ( not ( = ?auto_177074 ?auto_177077 ) ) ( not ( = ?auto_177074 ?auto_177078 ) ) ( not ( = ?auto_177074 ?auto_177079 ) ) ( not ( = ?auto_177074 ?auto_177080 ) ) ( not ( = ?auto_177074 ?auto_177081 ) ) ( not ( = ?auto_177074 ?auto_177082 ) ) ( not ( = ?auto_177074 ?auto_177083 ) ) ( not ( = ?auto_177074 ?auto_177084 ) ) ( not ( = ?auto_177075 ?auto_177076 ) ) ( not ( = ?auto_177075 ?auto_177077 ) ) ( not ( = ?auto_177075 ?auto_177078 ) ) ( not ( = ?auto_177075 ?auto_177079 ) ) ( not ( = ?auto_177075 ?auto_177080 ) ) ( not ( = ?auto_177075 ?auto_177081 ) ) ( not ( = ?auto_177075 ?auto_177082 ) ) ( not ( = ?auto_177075 ?auto_177083 ) ) ( not ( = ?auto_177075 ?auto_177084 ) ) ( not ( = ?auto_177076 ?auto_177077 ) ) ( not ( = ?auto_177076 ?auto_177078 ) ) ( not ( = ?auto_177076 ?auto_177079 ) ) ( not ( = ?auto_177076 ?auto_177080 ) ) ( not ( = ?auto_177076 ?auto_177081 ) ) ( not ( = ?auto_177076 ?auto_177082 ) ) ( not ( = ?auto_177076 ?auto_177083 ) ) ( not ( = ?auto_177076 ?auto_177084 ) ) ( not ( = ?auto_177077 ?auto_177078 ) ) ( not ( = ?auto_177077 ?auto_177079 ) ) ( not ( = ?auto_177077 ?auto_177080 ) ) ( not ( = ?auto_177077 ?auto_177081 ) ) ( not ( = ?auto_177077 ?auto_177082 ) ) ( not ( = ?auto_177077 ?auto_177083 ) ) ( not ( = ?auto_177077 ?auto_177084 ) ) ( not ( = ?auto_177078 ?auto_177079 ) ) ( not ( = ?auto_177078 ?auto_177080 ) ) ( not ( = ?auto_177078 ?auto_177081 ) ) ( not ( = ?auto_177078 ?auto_177082 ) ) ( not ( = ?auto_177078 ?auto_177083 ) ) ( not ( = ?auto_177078 ?auto_177084 ) ) ( not ( = ?auto_177079 ?auto_177080 ) ) ( not ( = ?auto_177079 ?auto_177081 ) ) ( not ( = ?auto_177079 ?auto_177082 ) ) ( not ( = ?auto_177079 ?auto_177083 ) ) ( not ( = ?auto_177079 ?auto_177084 ) ) ( not ( = ?auto_177080 ?auto_177081 ) ) ( not ( = ?auto_177080 ?auto_177082 ) ) ( not ( = ?auto_177080 ?auto_177083 ) ) ( not ( = ?auto_177080 ?auto_177084 ) ) ( not ( = ?auto_177081 ?auto_177082 ) ) ( not ( = ?auto_177081 ?auto_177083 ) ) ( not ( = ?auto_177081 ?auto_177084 ) ) ( not ( = ?auto_177082 ?auto_177083 ) ) ( not ( = ?auto_177082 ?auto_177084 ) ) ( not ( = ?auto_177083 ?auto_177084 ) ) ( ON ?auto_177082 ?auto_177083 ) ( ON ?auto_177081 ?auto_177082 ) ( ON ?auto_177080 ?auto_177081 ) ( ON ?auto_177079 ?auto_177080 ) ( ON ?auto_177078 ?auto_177079 ) ( ON ?auto_177077 ?auto_177078 ) ( ON ?auto_177076 ?auto_177077 ) ( CLEAR ?auto_177074 ) ( ON ?auto_177075 ?auto_177076 ) ( CLEAR ?auto_177075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177073 ?auto_177074 ?auto_177075 )
      ( MAKE-11PILE ?auto_177073 ?auto_177074 ?auto_177075 ?auto_177076 ?auto_177077 ?auto_177078 ?auto_177079 ?auto_177080 ?auto_177081 ?auto_177082 ?auto_177083 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177096 - BLOCK
      ?auto_177097 - BLOCK
      ?auto_177098 - BLOCK
      ?auto_177099 - BLOCK
      ?auto_177100 - BLOCK
      ?auto_177101 - BLOCK
      ?auto_177102 - BLOCK
      ?auto_177103 - BLOCK
      ?auto_177104 - BLOCK
      ?auto_177105 - BLOCK
      ?auto_177106 - BLOCK
    )
    :vars
    (
      ?auto_177107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177106 ?auto_177107 ) ( ON-TABLE ?auto_177096 ) ( not ( = ?auto_177096 ?auto_177097 ) ) ( not ( = ?auto_177096 ?auto_177098 ) ) ( not ( = ?auto_177096 ?auto_177099 ) ) ( not ( = ?auto_177096 ?auto_177100 ) ) ( not ( = ?auto_177096 ?auto_177101 ) ) ( not ( = ?auto_177096 ?auto_177102 ) ) ( not ( = ?auto_177096 ?auto_177103 ) ) ( not ( = ?auto_177096 ?auto_177104 ) ) ( not ( = ?auto_177096 ?auto_177105 ) ) ( not ( = ?auto_177096 ?auto_177106 ) ) ( not ( = ?auto_177096 ?auto_177107 ) ) ( not ( = ?auto_177097 ?auto_177098 ) ) ( not ( = ?auto_177097 ?auto_177099 ) ) ( not ( = ?auto_177097 ?auto_177100 ) ) ( not ( = ?auto_177097 ?auto_177101 ) ) ( not ( = ?auto_177097 ?auto_177102 ) ) ( not ( = ?auto_177097 ?auto_177103 ) ) ( not ( = ?auto_177097 ?auto_177104 ) ) ( not ( = ?auto_177097 ?auto_177105 ) ) ( not ( = ?auto_177097 ?auto_177106 ) ) ( not ( = ?auto_177097 ?auto_177107 ) ) ( not ( = ?auto_177098 ?auto_177099 ) ) ( not ( = ?auto_177098 ?auto_177100 ) ) ( not ( = ?auto_177098 ?auto_177101 ) ) ( not ( = ?auto_177098 ?auto_177102 ) ) ( not ( = ?auto_177098 ?auto_177103 ) ) ( not ( = ?auto_177098 ?auto_177104 ) ) ( not ( = ?auto_177098 ?auto_177105 ) ) ( not ( = ?auto_177098 ?auto_177106 ) ) ( not ( = ?auto_177098 ?auto_177107 ) ) ( not ( = ?auto_177099 ?auto_177100 ) ) ( not ( = ?auto_177099 ?auto_177101 ) ) ( not ( = ?auto_177099 ?auto_177102 ) ) ( not ( = ?auto_177099 ?auto_177103 ) ) ( not ( = ?auto_177099 ?auto_177104 ) ) ( not ( = ?auto_177099 ?auto_177105 ) ) ( not ( = ?auto_177099 ?auto_177106 ) ) ( not ( = ?auto_177099 ?auto_177107 ) ) ( not ( = ?auto_177100 ?auto_177101 ) ) ( not ( = ?auto_177100 ?auto_177102 ) ) ( not ( = ?auto_177100 ?auto_177103 ) ) ( not ( = ?auto_177100 ?auto_177104 ) ) ( not ( = ?auto_177100 ?auto_177105 ) ) ( not ( = ?auto_177100 ?auto_177106 ) ) ( not ( = ?auto_177100 ?auto_177107 ) ) ( not ( = ?auto_177101 ?auto_177102 ) ) ( not ( = ?auto_177101 ?auto_177103 ) ) ( not ( = ?auto_177101 ?auto_177104 ) ) ( not ( = ?auto_177101 ?auto_177105 ) ) ( not ( = ?auto_177101 ?auto_177106 ) ) ( not ( = ?auto_177101 ?auto_177107 ) ) ( not ( = ?auto_177102 ?auto_177103 ) ) ( not ( = ?auto_177102 ?auto_177104 ) ) ( not ( = ?auto_177102 ?auto_177105 ) ) ( not ( = ?auto_177102 ?auto_177106 ) ) ( not ( = ?auto_177102 ?auto_177107 ) ) ( not ( = ?auto_177103 ?auto_177104 ) ) ( not ( = ?auto_177103 ?auto_177105 ) ) ( not ( = ?auto_177103 ?auto_177106 ) ) ( not ( = ?auto_177103 ?auto_177107 ) ) ( not ( = ?auto_177104 ?auto_177105 ) ) ( not ( = ?auto_177104 ?auto_177106 ) ) ( not ( = ?auto_177104 ?auto_177107 ) ) ( not ( = ?auto_177105 ?auto_177106 ) ) ( not ( = ?auto_177105 ?auto_177107 ) ) ( not ( = ?auto_177106 ?auto_177107 ) ) ( ON ?auto_177105 ?auto_177106 ) ( ON ?auto_177104 ?auto_177105 ) ( ON ?auto_177103 ?auto_177104 ) ( ON ?auto_177102 ?auto_177103 ) ( ON ?auto_177101 ?auto_177102 ) ( ON ?auto_177100 ?auto_177101 ) ( ON ?auto_177099 ?auto_177100 ) ( ON ?auto_177098 ?auto_177099 ) ( CLEAR ?auto_177096 ) ( ON ?auto_177097 ?auto_177098 ) ( CLEAR ?auto_177097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177096 ?auto_177097 )
      ( MAKE-11PILE ?auto_177096 ?auto_177097 ?auto_177098 ?auto_177099 ?auto_177100 ?auto_177101 ?auto_177102 ?auto_177103 ?auto_177104 ?auto_177105 ?auto_177106 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177119 - BLOCK
      ?auto_177120 - BLOCK
      ?auto_177121 - BLOCK
      ?auto_177122 - BLOCK
      ?auto_177123 - BLOCK
      ?auto_177124 - BLOCK
      ?auto_177125 - BLOCK
      ?auto_177126 - BLOCK
      ?auto_177127 - BLOCK
      ?auto_177128 - BLOCK
      ?auto_177129 - BLOCK
    )
    :vars
    (
      ?auto_177130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177129 ?auto_177130 ) ( ON-TABLE ?auto_177119 ) ( not ( = ?auto_177119 ?auto_177120 ) ) ( not ( = ?auto_177119 ?auto_177121 ) ) ( not ( = ?auto_177119 ?auto_177122 ) ) ( not ( = ?auto_177119 ?auto_177123 ) ) ( not ( = ?auto_177119 ?auto_177124 ) ) ( not ( = ?auto_177119 ?auto_177125 ) ) ( not ( = ?auto_177119 ?auto_177126 ) ) ( not ( = ?auto_177119 ?auto_177127 ) ) ( not ( = ?auto_177119 ?auto_177128 ) ) ( not ( = ?auto_177119 ?auto_177129 ) ) ( not ( = ?auto_177119 ?auto_177130 ) ) ( not ( = ?auto_177120 ?auto_177121 ) ) ( not ( = ?auto_177120 ?auto_177122 ) ) ( not ( = ?auto_177120 ?auto_177123 ) ) ( not ( = ?auto_177120 ?auto_177124 ) ) ( not ( = ?auto_177120 ?auto_177125 ) ) ( not ( = ?auto_177120 ?auto_177126 ) ) ( not ( = ?auto_177120 ?auto_177127 ) ) ( not ( = ?auto_177120 ?auto_177128 ) ) ( not ( = ?auto_177120 ?auto_177129 ) ) ( not ( = ?auto_177120 ?auto_177130 ) ) ( not ( = ?auto_177121 ?auto_177122 ) ) ( not ( = ?auto_177121 ?auto_177123 ) ) ( not ( = ?auto_177121 ?auto_177124 ) ) ( not ( = ?auto_177121 ?auto_177125 ) ) ( not ( = ?auto_177121 ?auto_177126 ) ) ( not ( = ?auto_177121 ?auto_177127 ) ) ( not ( = ?auto_177121 ?auto_177128 ) ) ( not ( = ?auto_177121 ?auto_177129 ) ) ( not ( = ?auto_177121 ?auto_177130 ) ) ( not ( = ?auto_177122 ?auto_177123 ) ) ( not ( = ?auto_177122 ?auto_177124 ) ) ( not ( = ?auto_177122 ?auto_177125 ) ) ( not ( = ?auto_177122 ?auto_177126 ) ) ( not ( = ?auto_177122 ?auto_177127 ) ) ( not ( = ?auto_177122 ?auto_177128 ) ) ( not ( = ?auto_177122 ?auto_177129 ) ) ( not ( = ?auto_177122 ?auto_177130 ) ) ( not ( = ?auto_177123 ?auto_177124 ) ) ( not ( = ?auto_177123 ?auto_177125 ) ) ( not ( = ?auto_177123 ?auto_177126 ) ) ( not ( = ?auto_177123 ?auto_177127 ) ) ( not ( = ?auto_177123 ?auto_177128 ) ) ( not ( = ?auto_177123 ?auto_177129 ) ) ( not ( = ?auto_177123 ?auto_177130 ) ) ( not ( = ?auto_177124 ?auto_177125 ) ) ( not ( = ?auto_177124 ?auto_177126 ) ) ( not ( = ?auto_177124 ?auto_177127 ) ) ( not ( = ?auto_177124 ?auto_177128 ) ) ( not ( = ?auto_177124 ?auto_177129 ) ) ( not ( = ?auto_177124 ?auto_177130 ) ) ( not ( = ?auto_177125 ?auto_177126 ) ) ( not ( = ?auto_177125 ?auto_177127 ) ) ( not ( = ?auto_177125 ?auto_177128 ) ) ( not ( = ?auto_177125 ?auto_177129 ) ) ( not ( = ?auto_177125 ?auto_177130 ) ) ( not ( = ?auto_177126 ?auto_177127 ) ) ( not ( = ?auto_177126 ?auto_177128 ) ) ( not ( = ?auto_177126 ?auto_177129 ) ) ( not ( = ?auto_177126 ?auto_177130 ) ) ( not ( = ?auto_177127 ?auto_177128 ) ) ( not ( = ?auto_177127 ?auto_177129 ) ) ( not ( = ?auto_177127 ?auto_177130 ) ) ( not ( = ?auto_177128 ?auto_177129 ) ) ( not ( = ?auto_177128 ?auto_177130 ) ) ( not ( = ?auto_177129 ?auto_177130 ) ) ( ON ?auto_177128 ?auto_177129 ) ( ON ?auto_177127 ?auto_177128 ) ( ON ?auto_177126 ?auto_177127 ) ( ON ?auto_177125 ?auto_177126 ) ( ON ?auto_177124 ?auto_177125 ) ( ON ?auto_177123 ?auto_177124 ) ( ON ?auto_177122 ?auto_177123 ) ( ON ?auto_177121 ?auto_177122 ) ( CLEAR ?auto_177119 ) ( ON ?auto_177120 ?auto_177121 ) ( CLEAR ?auto_177120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177119 ?auto_177120 )
      ( MAKE-11PILE ?auto_177119 ?auto_177120 ?auto_177121 ?auto_177122 ?auto_177123 ?auto_177124 ?auto_177125 ?auto_177126 ?auto_177127 ?auto_177128 ?auto_177129 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177142 - BLOCK
      ?auto_177143 - BLOCK
      ?auto_177144 - BLOCK
      ?auto_177145 - BLOCK
      ?auto_177146 - BLOCK
      ?auto_177147 - BLOCK
      ?auto_177148 - BLOCK
      ?auto_177149 - BLOCK
      ?auto_177150 - BLOCK
      ?auto_177151 - BLOCK
      ?auto_177152 - BLOCK
    )
    :vars
    (
      ?auto_177153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177152 ?auto_177153 ) ( not ( = ?auto_177142 ?auto_177143 ) ) ( not ( = ?auto_177142 ?auto_177144 ) ) ( not ( = ?auto_177142 ?auto_177145 ) ) ( not ( = ?auto_177142 ?auto_177146 ) ) ( not ( = ?auto_177142 ?auto_177147 ) ) ( not ( = ?auto_177142 ?auto_177148 ) ) ( not ( = ?auto_177142 ?auto_177149 ) ) ( not ( = ?auto_177142 ?auto_177150 ) ) ( not ( = ?auto_177142 ?auto_177151 ) ) ( not ( = ?auto_177142 ?auto_177152 ) ) ( not ( = ?auto_177142 ?auto_177153 ) ) ( not ( = ?auto_177143 ?auto_177144 ) ) ( not ( = ?auto_177143 ?auto_177145 ) ) ( not ( = ?auto_177143 ?auto_177146 ) ) ( not ( = ?auto_177143 ?auto_177147 ) ) ( not ( = ?auto_177143 ?auto_177148 ) ) ( not ( = ?auto_177143 ?auto_177149 ) ) ( not ( = ?auto_177143 ?auto_177150 ) ) ( not ( = ?auto_177143 ?auto_177151 ) ) ( not ( = ?auto_177143 ?auto_177152 ) ) ( not ( = ?auto_177143 ?auto_177153 ) ) ( not ( = ?auto_177144 ?auto_177145 ) ) ( not ( = ?auto_177144 ?auto_177146 ) ) ( not ( = ?auto_177144 ?auto_177147 ) ) ( not ( = ?auto_177144 ?auto_177148 ) ) ( not ( = ?auto_177144 ?auto_177149 ) ) ( not ( = ?auto_177144 ?auto_177150 ) ) ( not ( = ?auto_177144 ?auto_177151 ) ) ( not ( = ?auto_177144 ?auto_177152 ) ) ( not ( = ?auto_177144 ?auto_177153 ) ) ( not ( = ?auto_177145 ?auto_177146 ) ) ( not ( = ?auto_177145 ?auto_177147 ) ) ( not ( = ?auto_177145 ?auto_177148 ) ) ( not ( = ?auto_177145 ?auto_177149 ) ) ( not ( = ?auto_177145 ?auto_177150 ) ) ( not ( = ?auto_177145 ?auto_177151 ) ) ( not ( = ?auto_177145 ?auto_177152 ) ) ( not ( = ?auto_177145 ?auto_177153 ) ) ( not ( = ?auto_177146 ?auto_177147 ) ) ( not ( = ?auto_177146 ?auto_177148 ) ) ( not ( = ?auto_177146 ?auto_177149 ) ) ( not ( = ?auto_177146 ?auto_177150 ) ) ( not ( = ?auto_177146 ?auto_177151 ) ) ( not ( = ?auto_177146 ?auto_177152 ) ) ( not ( = ?auto_177146 ?auto_177153 ) ) ( not ( = ?auto_177147 ?auto_177148 ) ) ( not ( = ?auto_177147 ?auto_177149 ) ) ( not ( = ?auto_177147 ?auto_177150 ) ) ( not ( = ?auto_177147 ?auto_177151 ) ) ( not ( = ?auto_177147 ?auto_177152 ) ) ( not ( = ?auto_177147 ?auto_177153 ) ) ( not ( = ?auto_177148 ?auto_177149 ) ) ( not ( = ?auto_177148 ?auto_177150 ) ) ( not ( = ?auto_177148 ?auto_177151 ) ) ( not ( = ?auto_177148 ?auto_177152 ) ) ( not ( = ?auto_177148 ?auto_177153 ) ) ( not ( = ?auto_177149 ?auto_177150 ) ) ( not ( = ?auto_177149 ?auto_177151 ) ) ( not ( = ?auto_177149 ?auto_177152 ) ) ( not ( = ?auto_177149 ?auto_177153 ) ) ( not ( = ?auto_177150 ?auto_177151 ) ) ( not ( = ?auto_177150 ?auto_177152 ) ) ( not ( = ?auto_177150 ?auto_177153 ) ) ( not ( = ?auto_177151 ?auto_177152 ) ) ( not ( = ?auto_177151 ?auto_177153 ) ) ( not ( = ?auto_177152 ?auto_177153 ) ) ( ON ?auto_177151 ?auto_177152 ) ( ON ?auto_177150 ?auto_177151 ) ( ON ?auto_177149 ?auto_177150 ) ( ON ?auto_177148 ?auto_177149 ) ( ON ?auto_177147 ?auto_177148 ) ( ON ?auto_177146 ?auto_177147 ) ( ON ?auto_177145 ?auto_177146 ) ( ON ?auto_177144 ?auto_177145 ) ( ON ?auto_177143 ?auto_177144 ) ( ON ?auto_177142 ?auto_177143 ) ( CLEAR ?auto_177142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177142 )
      ( MAKE-11PILE ?auto_177142 ?auto_177143 ?auto_177144 ?auto_177145 ?auto_177146 ?auto_177147 ?auto_177148 ?auto_177149 ?auto_177150 ?auto_177151 ?auto_177152 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_177165 - BLOCK
      ?auto_177166 - BLOCK
      ?auto_177167 - BLOCK
      ?auto_177168 - BLOCK
      ?auto_177169 - BLOCK
      ?auto_177170 - BLOCK
      ?auto_177171 - BLOCK
      ?auto_177172 - BLOCK
      ?auto_177173 - BLOCK
      ?auto_177174 - BLOCK
      ?auto_177175 - BLOCK
    )
    :vars
    (
      ?auto_177176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177175 ?auto_177176 ) ( not ( = ?auto_177165 ?auto_177166 ) ) ( not ( = ?auto_177165 ?auto_177167 ) ) ( not ( = ?auto_177165 ?auto_177168 ) ) ( not ( = ?auto_177165 ?auto_177169 ) ) ( not ( = ?auto_177165 ?auto_177170 ) ) ( not ( = ?auto_177165 ?auto_177171 ) ) ( not ( = ?auto_177165 ?auto_177172 ) ) ( not ( = ?auto_177165 ?auto_177173 ) ) ( not ( = ?auto_177165 ?auto_177174 ) ) ( not ( = ?auto_177165 ?auto_177175 ) ) ( not ( = ?auto_177165 ?auto_177176 ) ) ( not ( = ?auto_177166 ?auto_177167 ) ) ( not ( = ?auto_177166 ?auto_177168 ) ) ( not ( = ?auto_177166 ?auto_177169 ) ) ( not ( = ?auto_177166 ?auto_177170 ) ) ( not ( = ?auto_177166 ?auto_177171 ) ) ( not ( = ?auto_177166 ?auto_177172 ) ) ( not ( = ?auto_177166 ?auto_177173 ) ) ( not ( = ?auto_177166 ?auto_177174 ) ) ( not ( = ?auto_177166 ?auto_177175 ) ) ( not ( = ?auto_177166 ?auto_177176 ) ) ( not ( = ?auto_177167 ?auto_177168 ) ) ( not ( = ?auto_177167 ?auto_177169 ) ) ( not ( = ?auto_177167 ?auto_177170 ) ) ( not ( = ?auto_177167 ?auto_177171 ) ) ( not ( = ?auto_177167 ?auto_177172 ) ) ( not ( = ?auto_177167 ?auto_177173 ) ) ( not ( = ?auto_177167 ?auto_177174 ) ) ( not ( = ?auto_177167 ?auto_177175 ) ) ( not ( = ?auto_177167 ?auto_177176 ) ) ( not ( = ?auto_177168 ?auto_177169 ) ) ( not ( = ?auto_177168 ?auto_177170 ) ) ( not ( = ?auto_177168 ?auto_177171 ) ) ( not ( = ?auto_177168 ?auto_177172 ) ) ( not ( = ?auto_177168 ?auto_177173 ) ) ( not ( = ?auto_177168 ?auto_177174 ) ) ( not ( = ?auto_177168 ?auto_177175 ) ) ( not ( = ?auto_177168 ?auto_177176 ) ) ( not ( = ?auto_177169 ?auto_177170 ) ) ( not ( = ?auto_177169 ?auto_177171 ) ) ( not ( = ?auto_177169 ?auto_177172 ) ) ( not ( = ?auto_177169 ?auto_177173 ) ) ( not ( = ?auto_177169 ?auto_177174 ) ) ( not ( = ?auto_177169 ?auto_177175 ) ) ( not ( = ?auto_177169 ?auto_177176 ) ) ( not ( = ?auto_177170 ?auto_177171 ) ) ( not ( = ?auto_177170 ?auto_177172 ) ) ( not ( = ?auto_177170 ?auto_177173 ) ) ( not ( = ?auto_177170 ?auto_177174 ) ) ( not ( = ?auto_177170 ?auto_177175 ) ) ( not ( = ?auto_177170 ?auto_177176 ) ) ( not ( = ?auto_177171 ?auto_177172 ) ) ( not ( = ?auto_177171 ?auto_177173 ) ) ( not ( = ?auto_177171 ?auto_177174 ) ) ( not ( = ?auto_177171 ?auto_177175 ) ) ( not ( = ?auto_177171 ?auto_177176 ) ) ( not ( = ?auto_177172 ?auto_177173 ) ) ( not ( = ?auto_177172 ?auto_177174 ) ) ( not ( = ?auto_177172 ?auto_177175 ) ) ( not ( = ?auto_177172 ?auto_177176 ) ) ( not ( = ?auto_177173 ?auto_177174 ) ) ( not ( = ?auto_177173 ?auto_177175 ) ) ( not ( = ?auto_177173 ?auto_177176 ) ) ( not ( = ?auto_177174 ?auto_177175 ) ) ( not ( = ?auto_177174 ?auto_177176 ) ) ( not ( = ?auto_177175 ?auto_177176 ) ) ( ON ?auto_177174 ?auto_177175 ) ( ON ?auto_177173 ?auto_177174 ) ( ON ?auto_177172 ?auto_177173 ) ( ON ?auto_177171 ?auto_177172 ) ( ON ?auto_177170 ?auto_177171 ) ( ON ?auto_177169 ?auto_177170 ) ( ON ?auto_177168 ?auto_177169 ) ( ON ?auto_177167 ?auto_177168 ) ( ON ?auto_177166 ?auto_177167 ) ( ON ?auto_177165 ?auto_177166 ) ( CLEAR ?auto_177165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177165 )
      ( MAKE-11PILE ?auto_177165 ?auto_177166 ?auto_177167 ?auto_177168 ?auto_177169 ?auto_177170 ?auto_177171 ?auto_177172 ?auto_177173 ?auto_177174 ?auto_177175 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177189 - BLOCK
      ?auto_177190 - BLOCK
      ?auto_177191 - BLOCK
      ?auto_177192 - BLOCK
      ?auto_177193 - BLOCK
      ?auto_177194 - BLOCK
      ?auto_177195 - BLOCK
      ?auto_177196 - BLOCK
      ?auto_177197 - BLOCK
      ?auto_177198 - BLOCK
      ?auto_177199 - BLOCK
      ?auto_177200 - BLOCK
    )
    :vars
    (
      ?auto_177201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177199 ) ( ON ?auto_177200 ?auto_177201 ) ( CLEAR ?auto_177200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177189 ) ( ON ?auto_177190 ?auto_177189 ) ( ON ?auto_177191 ?auto_177190 ) ( ON ?auto_177192 ?auto_177191 ) ( ON ?auto_177193 ?auto_177192 ) ( ON ?auto_177194 ?auto_177193 ) ( ON ?auto_177195 ?auto_177194 ) ( ON ?auto_177196 ?auto_177195 ) ( ON ?auto_177197 ?auto_177196 ) ( ON ?auto_177198 ?auto_177197 ) ( ON ?auto_177199 ?auto_177198 ) ( not ( = ?auto_177189 ?auto_177190 ) ) ( not ( = ?auto_177189 ?auto_177191 ) ) ( not ( = ?auto_177189 ?auto_177192 ) ) ( not ( = ?auto_177189 ?auto_177193 ) ) ( not ( = ?auto_177189 ?auto_177194 ) ) ( not ( = ?auto_177189 ?auto_177195 ) ) ( not ( = ?auto_177189 ?auto_177196 ) ) ( not ( = ?auto_177189 ?auto_177197 ) ) ( not ( = ?auto_177189 ?auto_177198 ) ) ( not ( = ?auto_177189 ?auto_177199 ) ) ( not ( = ?auto_177189 ?auto_177200 ) ) ( not ( = ?auto_177189 ?auto_177201 ) ) ( not ( = ?auto_177190 ?auto_177191 ) ) ( not ( = ?auto_177190 ?auto_177192 ) ) ( not ( = ?auto_177190 ?auto_177193 ) ) ( not ( = ?auto_177190 ?auto_177194 ) ) ( not ( = ?auto_177190 ?auto_177195 ) ) ( not ( = ?auto_177190 ?auto_177196 ) ) ( not ( = ?auto_177190 ?auto_177197 ) ) ( not ( = ?auto_177190 ?auto_177198 ) ) ( not ( = ?auto_177190 ?auto_177199 ) ) ( not ( = ?auto_177190 ?auto_177200 ) ) ( not ( = ?auto_177190 ?auto_177201 ) ) ( not ( = ?auto_177191 ?auto_177192 ) ) ( not ( = ?auto_177191 ?auto_177193 ) ) ( not ( = ?auto_177191 ?auto_177194 ) ) ( not ( = ?auto_177191 ?auto_177195 ) ) ( not ( = ?auto_177191 ?auto_177196 ) ) ( not ( = ?auto_177191 ?auto_177197 ) ) ( not ( = ?auto_177191 ?auto_177198 ) ) ( not ( = ?auto_177191 ?auto_177199 ) ) ( not ( = ?auto_177191 ?auto_177200 ) ) ( not ( = ?auto_177191 ?auto_177201 ) ) ( not ( = ?auto_177192 ?auto_177193 ) ) ( not ( = ?auto_177192 ?auto_177194 ) ) ( not ( = ?auto_177192 ?auto_177195 ) ) ( not ( = ?auto_177192 ?auto_177196 ) ) ( not ( = ?auto_177192 ?auto_177197 ) ) ( not ( = ?auto_177192 ?auto_177198 ) ) ( not ( = ?auto_177192 ?auto_177199 ) ) ( not ( = ?auto_177192 ?auto_177200 ) ) ( not ( = ?auto_177192 ?auto_177201 ) ) ( not ( = ?auto_177193 ?auto_177194 ) ) ( not ( = ?auto_177193 ?auto_177195 ) ) ( not ( = ?auto_177193 ?auto_177196 ) ) ( not ( = ?auto_177193 ?auto_177197 ) ) ( not ( = ?auto_177193 ?auto_177198 ) ) ( not ( = ?auto_177193 ?auto_177199 ) ) ( not ( = ?auto_177193 ?auto_177200 ) ) ( not ( = ?auto_177193 ?auto_177201 ) ) ( not ( = ?auto_177194 ?auto_177195 ) ) ( not ( = ?auto_177194 ?auto_177196 ) ) ( not ( = ?auto_177194 ?auto_177197 ) ) ( not ( = ?auto_177194 ?auto_177198 ) ) ( not ( = ?auto_177194 ?auto_177199 ) ) ( not ( = ?auto_177194 ?auto_177200 ) ) ( not ( = ?auto_177194 ?auto_177201 ) ) ( not ( = ?auto_177195 ?auto_177196 ) ) ( not ( = ?auto_177195 ?auto_177197 ) ) ( not ( = ?auto_177195 ?auto_177198 ) ) ( not ( = ?auto_177195 ?auto_177199 ) ) ( not ( = ?auto_177195 ?auto_177200 ) ) ( not ( = ?auto_177195 ?auto_177201 ) ) ( not ( = ?auto_177196 ?auto_177197 ) ) ( not ( = ?auto_177196 ?auto_177198 ) ) ( not ( = ?auto_177196 ?auto_177199 ) ) ( not ( = ?auto_177196 ?auto_177200 ) ) ( not ( = ?auto_177196 ?auto_177201 ) ) ( not ( = ?auto_177197 ?auto_177198 ) ) ( not ( = ?auto_177197 ?auto_177199 ) ) ( not ( = ?auto_177197 ?auto_177200 ) ) ( not ( = ?auto_177197 ?auto_177201 ) ) ( not ( = ?auto_177198 ?auto_177199 ) ) ( not ( = ?auto_177198 ?auto_177200 ) ) ( not ( = ?auto_177198 ?auto_177201 ) ) ( not ( = ?auto_177199 ?auto_177200 ) ) ( not ( = ?auto_177199 ?auto_177201 ) ) ( not ( = ?auto_177200 ?auto_177201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_177200 ?auto_177201 )
      ( !STACK ?auto_177200 ?auto_177199 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177214 - BLOCK
      ?auto_177215 - BLOCK
      ?auto_177216 - BLOCK
      ?auto_177217 - BLOCK
      ?auto_177218 - BLOCK
      ?auto_177219 - BLOCK
      ?auto_177220 - BLOCK
      ?auto_177221 - BLOCK
      ?auto_177222 - BLOCK
      ?auto_177223 - BLOCK
      ?auto_177224 - BLOCK
      ?auto_177225 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_177224 ) ( ON-TABLE ?auto_177225 ) ( CLEAR ?auto_177225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_177214 ) ( ON ?auto_177215 ?auto_177214 ) ( ON ?auto_177216 ?auto_177215 ) ( ON ?auto_177217 ?auto_177216 ) ( ON ?auto_177218 ?auto_177217 ) ( ON ?auto_177219 ?auto_177218 ) ( ON ?auto_177220 ?auto_177219 ) ( ON ?auto_177221 ?auto_177220 ) ( ON ?auto_177222 ?auto_177221 ) ( ON ?auto_177223 ?auto_177222 ) ( ON ?auto_177224 ?auto_177223 ) ( not ( = ?auto_177214 ?auto_177215 ) ) ( not ( = ?auto_177214 ?auto_177216 ) ) ( not ( = ?auto_177214 ?auto_177217 ) ) ( not ( = ?auto_177214 ?auto_177218 ) ) ( not ( = ?auto_177214 ?auto_177219 ) ) ( not ( = ?auto_177214 ?auto_177220 ) ) ( not ( = ?auto_177214 ?auto_177221 ) ) ( not ( = ?auto_177214 ?auto_177222 ) ) ( not ( = ?auto_177214 ?auto_177223 ) ) ( not ( = ?auto_177214 ?auto_177224 ) ) ( not ( = ?auto_177214 ?auto_177225 ) ) ( not ( = ?auto_177215 ?auto_177216 ) ) ( not ( = ?auto_177215 ?auto_177217 ) ) ( not ( = ?auto_177215 ?auto_177218 ) ) ( not ( = ?auto_177215 ?auto_177219 ) ) ( not ( = ?auto_177215 ?auto_177220 ) ) ( not ( = ?auto_177215 ?auto_177221 ) ) ( not ( = ?auto_177215 ?auto_177222 ) ) ( not ( = ?auto_177215 ?auto_177223 ) ) ( not ( = ?auto_177215 ?auto_177224 ) ) ( not ( = ?auto_177215 ?auto_177225 ) ) ( not ( = ?auto_177216 ?auto_177217 ) ) ( not ( = ?auto_177216 ?auto_177218 ) ) ( not ( = ?auto_177216 ?auto_177219 ) ) ( not ( = ?auto_177216 ?auto_177220 ) ) ( not ( = ?auto_177216 ?auto_177221 ) ) ( not ( = ?auto_177216 ?auto_177222 ) ) ( not ( = ?auto_177216 ?auto_177223 ) ) ( not ( = ?auto_177216 ?auto_177224 ) ) ( not ( = ?auto_177216 ?auto_177225 ) ) ( not ( = ?auto_177217 ?auto_177218 ) ) ( not ( = ?auto_177217 ?auto_177219 ) ) ( not ( = ?auto_177217 ?auto_177220 ) ) ( not ( = ?auto_177217 ?auto_177221 ) ) ( not ( = ?auto_177217 ?auto_177222 ) ) ( not ( = ?auto_177217 ?auto_177223 ) ) ( not ( = ?auto_177217 ?auto_177224 ) ) ( not ( = ?auto_177217 ?auto_177225 ) ) ( not ( = ?auto_177218 ?auto_177219 ) ) ( not ( = ?auto_177218 ?auto_177220 ) ) ( not ( = ?auto_177218 ?auto_177221 ) ) ( not ( = ?auto_177218 ?auto_177222 ) ) ( not ( = ?auto_177218 ?auto_177223 ) ) ( not ( = ?auto_177218 ?auto_177224 ) ) ( not ( = ?auto_177218 ?auto_177225 ) ) ( not ( = ?auto_177219 ?auto_177220 ) ) ( not ( = ?auto_177219 ?auto_177221 ) ) ( not ( = ?auto_177219 ?auto_177222 ) ) ( not ( = ?auto_177219 ?auto_177223 ) ) ( not ( = ?auto_177219 ?auto_177224 ) ) ( not ( = ?auto_177219 ?auto_177225 ) ) ( not ( = ?auto_177220 ?auto_177221 ) ) ( not ( = ?auto_177220 ?auto_177222 ) ) ( not ( = ?auto_177220 ?auto_177223 ) ) ( not ( = ?auto_177220 ?auto_177224 ) ) ( not ( = ?auto_177220 ?auto_177225 ) ) ( not ( = ?auto_177221 ?auto_177222 ) ) ( not ( = ?auto_177221 ?auto_177223 ) ) ( not ( = ?auto_177221 ?auto_177224 ) ) ( not ( = ?auto_177221 ?auto_177225 ) ) ( not ( = ?auto_177222 ?auto_177223 ) ) ( not ( = ?auto_177222 ?auto_177224 ) ) ( not ( = ?auto_177222 ?auto_177225 ) ) ( not ( = ?auto_177223 ?auto_177224 ) ) ( not ( = ?auto_177223 ?auto_177225 ) ) ( not ( = ?auto_177224 ?auto_177225 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_177225 )
      ( !STACK ?auto_177225 ?auto_177224 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177238 - BLOCK
      ?auto_177239 - BLOCK
      ?auto_177240 - BLOCK
      ?auto_177241 - BLOCK
      ?auto_177242 - BLOCK
      ?auto_177243 - BLOCK
      ?auto_177244 - BLOCK
      ?auto_177245 - BLOCK
      ?auto_177246 - BLOCK
      ?auto_177247 - BLOCK
      ?auto_177248 - BLOCK
      ?auto_177249 - BLOCK
    )
    :vars
    (
      ?auto_177250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177249 ?auto_177250 ) ( ON-TABLE ?auto_177238 ) ( ON ?auto_177239 ?auto_177238 ) ( ON ?auto_177240 ?auto_177239 ) ( ON ?auto_177241 ?auto_177240 ) ( ON ?auto_177242 ?auto_177241 ) ( ON ?auto_177243 ?auto_177242 ) ( ON ?auto_177244 ?auto_177243 ) ( ON ?auto_177245 ?auto_177244 ) ( ON ?auto_177246 ?auto_177245 ) ( ON ?auto_177247 ?auto_177246 ) ( not ( = ?auto_177238 ?auto_177239 ) ) ( not ( = ?auto_177238 ?auto_177240 ) ) ( not ( = ?auto_177238 ?auto_177241 ) ) ( not ( = ?auto_177238 ?auto_177242 ) ) ( not ( = ?auto_177238 ?auto_177243 ) ) ( not ( = ?auto_177238 ?auto_177244 ) ) ( not ( = ?auto_177238 ?auto_177245 ) ) ( not ( = ?auto_177238 ?auto_177246 ) ) ( not ( = ?auto_177238 ?auto_177247 ) ) ( not ( = ?auto_177238 ?auto_177248 ) ) ( not ( = ?auto_177238 ?auto_177249 ) ) ( not ( = ?auto_177238 ?auto_177250 ) ) ( not ( = ?auto_177239 ?auto_177240 ) ) ( not ( = ?auto_177239 ?auto_177241 ) ) ( not ( = ?auto_177239 ?auto_177242 ) ) ( not ( = ?auto_177239 ?auto_177243 ) ) ( not ( = ?auto_177239 ?auto_177244 ) ) ( not ( = ?auto_177239 ?auto_177245 ) ) ( not ( = ?auto_177239 ?auto_177246 ) ) ( not ( = ?auto_177239 ?auto_177247 ) ) ( not ( = ?auto_177239 ?auto_177248 ) ) ( not ( = ?auto_177239 ?auto_177249 ) ) ( not ( = ?auto_177239 ?auto_177250 ) ) ( not ( = ?auto_177240 ?auto_177241 ) ) ( not ( = ?auto_177240 ?auto_177242 ) ) ( not ( = ?auto_177240 ?auto_177243 ) ) ( not ( = ?auto_177240 ?auto_177244 ) ) ( not ( = ?auto_177240 ?auto_177245 ) ) ( not ( = ?auto_177240 ?auto_177246 ) ) ( not ( = ?auto_177240 ?auto_177247 ) ) ( not ( = ?auto_177240 ?auto_177248 ) ) ( not ( = ?auto_177240 ?auto_177249 ) ) ( not ( = ?auto_177240 ?auto_177250 ) ) ( not ( = ?auto_177241 ?auto_177242 ) ) ( not ( = ?auto_177241 ?auto_177243 ) ) ( not ( = ?auto_177241 ?auto_177244 ) ) ( not ( = ?auto_177241 ?auto_177245 ) ) ( not ( = ?auto_177241 ?auto_177246 ) ) ( not ( = ?auto_177241 ?auto_177247 ) ) ( not ( = ?auto_177241 ?auto_177248 ) ) ( not ( = ?auto_177241 ?auto_177249 ) ) ( not ( = ?auto_177241 ?auto_177250 ) ) ( not ( = ?auto_177242 ?auto_177243 ) ) ( not ( = ?auto_177242 ?auto_177244 ) ) ( not ( = ?auto_177242 ?auto_177245 ) ) ( not ( = ?auto_177242 ?auto_177246 ) ) ( not ( = ?auto_177242 ?auto_177247 ) ) ( not ( = ?auto_177242 ?auto_177248 ) ) ( not ( = ?auto_177242 ?auto_177249 ) ) ( not ( = ?auto_177242 ?auto_177250 ) ) ( not ( = ?auto_177243 ?auto_177244 ) ) ( not ( = ?auto_177243 ?auto_177245 ) ) ( not ( = ?auto_177243 ?auto_177246 ) ) ( not ( = ?auto_177243 ?auto_177247 ) ) ( not ( = ?auto_177243 ?auto_177248 ) ) ( not ( = ?auto_177243 ?auto_177249 ) ) ( not ( = ?auto_177243 ?auto_177250 ) ) ( not ( = ?auto_177244 ?auto_177245 ) ) ( not ( = ?auto_177244 ?auto_177246 ) ) ( not ( = ?auto_177244 ?auto_177247 ) ) ( not ( = ?auto_177244 ?auto_177248 ) ) ( not ( = ?auto_177244 ?auto_177249 ) ) ( not ( = ?auto_177244 ?auto_177250 ) ) ( not ( = ?auto_177245 ?auto_177246 ) ) ( not ( = ?auto_177245 ?auto_177247 ) ) ( not ( = ?auto_177245 ?auto_177248 ) ) ( not ( = ?auto_177245 ?auto_177249 ) ) ( not ( = ?auto_177245 ?auto_177250 ) ) ( not ( = ?auto_177246 ?auto_177247 ) ) ( not ( = ?auto_177246 ?auto_177248 ) ) ( not ( = ?auto_177246 ?auto_177249 ) ) ( not ( = ?auto_177246 ?auto_177250 ) ) ( not ( = ?auto_177247 ?auto_177248 ) ) ( not ( = ?auto_177247 ?auto_177249 ) ) ( not ( = ?auto_177247 ?auto_177250 ) ) ( not ( = ?auto_177248 ?auto_177249 ) ) ( not ( = ?auto_177248 ?auto_177250 ) ) ( not ( = ?auto_177249 ?auto_177250 ) ) ( CLEAR ?auto_177247 ) ( ON ?auto_177248 ?auto_177249 ) ( CLEAR ?auto_177248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_177238 ?auto_177239 ?auto_177240 ?auto_177241 ?auto_177242 ?auto_177243 ?auto_177244 ?auto_177245 ?auto_177246 ?auto_177247 ?auto_177248 )
      ( MAKE-12PILE ?auto_177238 ?auto_177239 ?auto_177240 ?auto_177241 ?auto_177242 ?auto_177243 ?auto_177244 ?auto_177245 ?auto_177246 ?auto_177247 ?auto_177248 ?auto_177249 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177263 - BLOCK
      ?auto_177264 - BLOCK
      ?auto_177265 - BLOCK
      ?auto_177266 - BLOCK
      ?auto_177267 - BLOCK
      ?auto_177268 - BLOCK
      ?auto_177269 - BLOCK
      ?auto_177270 - BLOCK
      ?auto_177271 - BLOCK
      ?auto_177272 - BLOCK
      ?auto_177273 - BLOCK
      ?auto_177274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177274 ) ( ON-TABLE ?auto_177263 ) ( ON ?auto_177264 ?auto_177263 ) ( ON ?auto_177265 ?auto_177264 ) ( ON ?auto_177266 ?auto_177265 ) ( ON ?auto_177267 ?auto_177266 ) ( ON ?auto_177268 ?auto_177267 ) ( ON ?auto_177269 ?auto_177268 ) ( ON ?auto_177270 ?auto_177269 ) ( ON ?auto_177271 ?auto_177270 ) ( ON ?auto_177272 ?auto_177271 ) ( not ( = ?auto_177263 ?auto_177264 ) ) ( not ( = ?auto_177263 ?auto_177265 ) ) ( not ( = ?auto_177263 ?auto_177266 ) ) ( not ( = ?auto_177263 ?auto_177267 ) ) ( not ( = ?auto_177263 ?auto_177268 ) ) ( not ( = ?auto_177263 ?auto_177269 ) ) ( not ( = ?auto_177263 ?auto_177270 ) ) ( not ( = ?auto_177263 ?auto_177271 ) ) ( not ( = ?auto_177263 ?auto_177272 ) ) ( not ( = ?auto_177263 ?auto_177273 ) ) ( not ( = ?auto_177263 ?auto_177274 ) ) ( not ( = ?auto_177264 ?auto_177265 ) ) ( not ( = ?auto_177264 ?auto_177266 ) ) ( not ( = ?auto_177264 ?auto_177267 ) ) ( not ( = ?auto_177264 ?auto_177268 ) ) ( not ( = ?auto_177264 ?auto_177269 ) ) ( not ( = ?auto_177264 ?auto_177270 ) ) ( not ( = ?auto_177264 ?auto_177271 ) ) ( not ( = ?auto_177264 ?auto_177272 ) ) ( not ( = ?auto_177264 ?auto_177273 ) ) ( not ( = ?auto_177264 ?auto_177274 ) ) ( not ( = ?auto_177265 ?auto_177266 ) ) ( not ( = ?auto_177265 ?auto_177267 ) ) ( not ( = ?auto_177265 ?auto_177268 ) ) ( not ( = ?auto_177265 ?auto_177269 ) ) ( not ( = ?auto_177265 ?auto_177270 ) ) ( not ( = ?auto_177265 ?auto_177271 ) ) ( not ( = ?auto_177265 ?auto_177272 ) ) ( not ( = ?auto_177265 ?auto_177273 ) ) ( not ( = ?auto_177265 ?auto_177274 ) ) ( not ( = ?auto_177266 ?auto_177267 ) ) ( not ( = ?auto_177266 ?auto_177268 ) ) ( not ( = ?auto_177266 ?auto_177269 ) ) ( not ( = ?auto_177266 ?auto_177270 ) ) ( not ( = ?auto_177266 ?auto_177271 ) ) ( not ( = ?auto_177266 ?auto_177272 ) ) ( not ( = ?auto_177266 ?auto_177273 ) ) ( not ( = ?auto_177266 ?auto_177274 ) ) ( not ( = ?auto_177267 ?auto_177268 ) ) ( not ( = ?auto_177267 ?auto_177269 ) ) ( not ( = ?auto_177267 ?auto_177270 ) ) ( not ( = ?auto_177267 ?auto_177271 ) ) ( not ( = ?auto_177267 ?auto_177272 ) ) ( not ( = ?auto_177267 ?auto_177273 ) ) ( not ( = ?auto_177267 ?auto_177274 ) ) ( not ( = ?auto_177268 ?auto_177269 ) ) ( not ( = ?auto_177268 ?auto_177270 ) ) ( not ( = ?auto_177268 ?auto_177271 ) ) ( not ( = ?auto_177268 ?auto_177272 ) ) ( not ( = ?auto_177268 ?auto_177273 ) ) ( not ( = ?auto_177268 ?auto_177274 ) ) ( not ( = ?auto_177269 ?auto_177270 ) ) ( not ( = ?auto_177269 ?auto_177271 ) ) ( not ( = ?auto_177269 ?auto_177272 ) ) ( not ( = ?auto_177269 ?auto_177273 ) ) ( not ( = ?auto_177269 ?auto_177274 ) ) ( not ( = ?auto_177270 ?auto_177271 ) ) ( not ( = ?auto_177270 ?auto_177272 ) ) ( not ( = ?auto_177270 ?auto_177273 ) ) ( not ( = ?auto_177270 ?auto_177274 ) ) ( not ( = ?auto_177271 ?auto_177272 ) ) ( not ( = ?auto_177271 ?auto_177273 ) ) ( not ( = ?auto_177271 ?auto_177274 ) ) ( not ( = ?auto_177272 ?auto_177273 ) ) ( not ( = ?auto_177272 ?auto_177274 ) ) ( not ( = ?auto_177273 ?auto_177274 ) ) ( CLEAR ?auto_177272 ) ( ON ?auto_177273 ?auto_177274 ) ( CLEAR ?auto_177273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_177263 ?auto_177264 ?auto_177265 ?auto_177266 ?auto_177267 ?auto_177268 ?auto_177269 ?auto_177270 ?auto_177271 ?auto_177272 ?auto_177273 )
      ( MAKE-12PILE ?auto_177263 ?auto_177264 ?auto_177265 ?auto_177266 ?auto_177267 ?auto_177268 ?auto_177269 ?auto_177270 ?auto_177271 ?auto_177272 ?auto_177273 ?auto_177274 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177287 - BLOCK
      ?auto_177288 - BLOCK
      ?auto_177289 - BLOCK
      ?auto_177290 - BLOCK
      ?auto_177291 - BLOCK
      ?auto_177292 - BLOCK
      ?auto_177293 - BLOCK
      ?auto_177294 - BLOCK
      ?auto_177295 - BLOCK
      ?auto_177296 - BLOCK
      ?auto_177297 - BLOCK
      ?auto_177298 - BLOCK
    )
    :vars
    (
      ?auto_177299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177298 ?auto_177299 ) ( ON-TABLE ?auto_177287 ) ( ON ?auto_177288 ?auto_177287 ) ( ON ?auto_177289 ?auto_177288 ) ( ON ?auto_177290 ?auto_177289 ) ( ON ?auto_177291 ?auto_177290 ) ( ON ?auto_177292 ?auto_177291 ) ( ON ?auto_177293 ?auto_177292 ) ( ON ?auto_177294 ?auto_177293 ) ( ON ?auto_177295 ?auto_177294 ) ( not ( = ?auto_177287 ?auto_177288 ) ) ( not ( = ?auto_177287 ?auto_177289 ) ) ( not ( = ?auto_177287 ?auto_177290 ) ) ( not ( = ?auto_177287 ?auto_177291 ) ) ( not ( = ?auto_177287 ?auto_177292 ) ) ( not ( = ?auto_177287 ?auto_177293 ) ) ( not ( = ?auto_177287 ?auto_177294 ) ) ( not ( = ?auto_177287 ?auto_177295 ) ) ( not ( = ?auto_177287 ?auto_177296 ) ) ( not ( = ?auto_177287 ?auto_177297 ) ) ( not ( = ?auto_177287 ?auto_177298 ) ) ( not ( = ?auto_177287 ?auto_177299 ) ) ( not ( = ?auto_177288 ?auto_177289 ) ) ( not ( = ?auto_177288 ?auto_177290 ) ) ( not ( = ?auto_177288 ?auto_177291 ) ) ( not ( = ?auto_177288 ?auto_177292 ) ) ( not ( = ?auto_177288 ?auto_177293 ) ) ( not ( = ?auto_177288 ?auto_177294 ) ) ( not ( = ?auto_177288 ?auto_177295 ) ) ( not ( = ?auto_177288 ?auto_177296 ) ) ( not ( = ?auto_177288 ?auto_177297 ) ) ( not ( = ?auto_177288 ?auto_177298 ) ) ( not ( = ?auto_177288 ?auto_177299 ) ) ( not ( = ?auto_177289 ?auto_177290 ) ) ( not ( = ?auto_177289 ?auto_177291 ) ) ( not ( = ?auto_177289 ?auto_177292 ) ) ( not ( = ?auto_177289 ?auto_177293 ) ) ( not ( = ?auto_177289 ?auto_177294 ) ) ( not ( = ?auto_177289 ?auto_177295 ) ) ( not ( = ?auto_177289 ?auto_177296 ) ) ( not ( = ?auto_177289 ?auto_177297 ) ) ( not ( = ?auto_177289 ?auto_177298 ) ) ( not ( = ?auto_177289 ?auto_177299 ) ) ( not ( = ?auto_177290 ?auto_177291 ) ) ( not ( = ?auto_177290 ?auto_177292 ) ) ( not ( = ?auto_177290 ?auto_177293 ) ) ( not ( = ?auto_177290 ?auto_177294 ) ) ( not ( = ?auto_177290 ?auto_177295 ) ) ( not ( = ?auto_177290 ?auto_177296 ) ) ( not ( = ?auto_177290 ?auto_177297 ) ) ( not ( = ?auto_177290 ?auto_177298 ) ) ( not ( = ?auto_177290 ?auto_177299 ) ) ( not ( = ?auto_177291 ?auto_177292 ) ) ( not ( = ?auto_177291 ?auto_177293 ) ) ( not ( = ?auto_177291 ?auto_177294 ) ) ( not ( = ?auto_177291 ?auto_177295 ) ) ( not ( = ?auto_177291 ?auto_177296 ) ) ( not ( = ?auto_177291 ?auto_177297 ) ) ( not ( = ?auto_177291 ?auto_177298 ) ) ( not ( = ?auto_177291 ?auto_177299 ) ) ( not ( = ?auto_177292 ?auto_177293 ) ) ( not ( = ?auto_177292 ?auto_177294 ) ) ( not ( = ?auto_177292 ?auto_177295 ) ) ( not ( = ?auto_177292 ?auto_177296 ) ) ( not ( = ?auto_177292 ?auto_177297 ) ) ( not ( = ?auto_177292 ?auto_177298 ) ) ( not ( = ?auto_177292 ?auto_177299 ) ) ( not ( = ?auto_177293 ?auto_177294 ) ) ( not ( = ?auto_177293 ?auto_177295 ) ) ( not ( = ?auto_177293 ?auto_177296 ) ) ( not ( = ?auto_177293 ?auto_177297 ) ) ( not ( = ?auto_177293 ?auto_177298 ) ) ( not ( = ?auto_177293 ?auto_177299 ) ) ( not ( = ?auto_177294 ?auto_177295 ) ) ( not ( = ?auto_177294 ?auto_177296 ) ) ( not ( = ?auto_177294 ?auto_177297 ) ) ( not ( = ?auto_177294 ?auto_177298 ) ) ( not ( = ?auto_177294 ?auto_177299 ) ) ( not ( = ?auto_177295 ?auto_177296 ) ) ( not ( = ?auto_177295 ?auto_177297 ) ) ( not ( = ?auto_177295 ?auto_177298 ) ) ( not ( = ?auto_177295 ?auto_177299 ) ) ( not ( = ?auto_177296 ?auto_177297 ) ) ( not ( = ?auto_177296 ?auto_177298 ) ) ( not ( = ?auto_177296 ?auto_177299 ) ) ( not ( = ?auto_177297 ?auto_177298 ) ) ( not ( = ?auto_177297 ?auto_177299 ) ) ( not ( = ?auto_177298 ?auto_177299 ) ) ( ON ?auto_177297 ?auto_177298 ) ( CLEAR ?auto_177295 ) ( ON ?auto_177296 ?auto_177297 ) ( CLEAR ?auto_177296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_177287 ?auto_177288 ?auto_177289 ?auto_177290 ?auto_177291 ?auto_177292 ?auto_177293 ?auto_177294 ?auto_177295 ?auto_177296 )
      ( MAKE-12PILE ?auto_177287 ?auto_177288 ?auto_177289 ?auto_177290 ?auto_177291 ?auto_177292 ?auto_177293 ?auto_177294 ?auto_177295 ?auto_177296 ?auto_177297 ?auto_177298 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177312 - BLOCK
      ?auto_177313 - BLOCK
      ?auto_177314 - BLOCK
      ?auto_177315 - BLOCK
      ?auto_177316 - BLOCK
      ?auto_177317 - BLOCK
      ?auto_177318 - BLOCK
      ?auto_177319 - BLOCK
      ?auto_177320 - BLOCK
      ?auto_177321 - BLOCK
      ?auto_177322 - BLOCK
      ?auto_177323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177323 ) ( ON-TABLE ?auto_177312 ) ( ON ?auto_177313 ?auto_177312 ) ( ON ?auto_177314 ?auto_177313 ) ( ON ?auto_177315 ?auto_177314 ) ( ON ?auto_177316 ?auto_177315 ) ( ON ?auto_177317 ?auto_177316 ) ( ON ?auto_177318 ?auto_177317 ) ( ON ?auto_177319 ?auto_177318 ) ( ON ?auto_177320 ?auto_177319 ) ( not ( = ?auto_177312 ?auto_177313 ) ) ( not ( = ?auto_177312 ?auto_177314 ) ) ( not ( = ?auto_177312 ?auto_177315 ) ) ( not ( = ?auto_177312 ?auto_177316 ) ) ( not ( = ?auto_177312 ?auto_177317 ) ) ( not ( = ?auto_177312 ?auto_177318 ) ) ( not ( = ?auto_177312 ?auto_177319 ) ) ( not ( = ?auto_177312 ?auto_177320 ) ) ( not ( = ?auto_177312 ?auto_177321 ) ) ( not ( = ?auto_177312 ?auto_177322 ) ) ( not ( = ?auto_177312 ?auto_177323 ) ) ( not ( = ?auto_177313 ?auto_177314 ) ) ( not ( = ?auto_177313 ?auto_177315 ) ) ( not ( = ?auto_177313 ?auto_177316 ) ) ( not ( = ?auto_177313 ?auto_177317 ) ) ( not ( = ?auto_177313 ?auto_177318 ) ) ( not ( = ?auto_177313 ?auto_177319 ) ) ( not ( = ?auto_177313 ?auto_177320 ) ) ( not ( = ?auto_177313 ?auto_177321 ) ) ( not ( = ?auto_177313 ?auto_177322 ) ) ( not ( = ?auto_177313 ?auto_177323 ) ) ( not ( = ?auto_177314 ?auto_177315 ) ) ( not ( = ?auto_177314 ?auto_177316 ) ) ( not ( = ?auto_177314 ?auto_177317 ) ) ( not ( = ?auto_177314 ?auto_177318 ) ) ( not ( = ?auto_177314 ?auto_177319 ) ) ( not ( = ?auto_177314 ?auto_177320 ) ) ( not ( = ?auto_177314 ?auto_177321 ) ) ( not ( = ?auto_177314 ?auto_177322 ) ) ( not ( = ?auto_177314 ?auto_177323 ) ) ( not ( = ?auto_177315 ?auto_177316 ) ) ( not ( = ?auto_177315 ?auto_177317 ) ) ( not ( = ?auto_177315 ?auto_177318 ) ) ( not ( = ?auto_177315 ?auto_177319 ) ) ( not ( = ?auto_177315 ?auto_177320 ) ) ( not ( = ?auto_177315 ?auto_177321 ) ) ( not ( = ?auto_177315 ?auto_177322 ) ) ( not ( = ?auto_177315 ?auto_177323 ) ) ( not ( = ?auto_177316 ?auto_177317 ) ) ( not ( = ?auto_177316 ?auto_177318 ) ) ( not ( = ?auto_177316 ?auto_177319 ) ) ( not ( = ?auto_177316 ?auto_177320 ) ) ( not ( = ?auto_177316 ?auto_177321 ) ) ( not ( = ?auto_177316 ?auto_177322 ) ) ( not ( = ?auto_177316 ?auto_177323 ) ) ( not ( = ?auto_177317 ?auto_177318 ) ) ( not ( = ?auto_177317 ?auto_177319 ) ) ( not ( = ?auto_177317 ?auto_177320 ) ) ( not ( = ?auto_177317 ?auto_177321 ) ) ( not ( = ?auto_177317 ?auto_177322 ) ) ( not ( = ?auto_177317 ?auto_177323 ) ) ( not ( = ?auto_177318 ?auto_177319 ) ) ( not ( = ?auto_177318 ?auto_177320 ) ) ( not ( = ?auto_177318 ?auto_177321 ) ) ( not ( = ?auto_177318 ?auto_177322 ) ) ( not ( = ?auto_177318 ?auto_177323 ) ) ( not ( = ?auto_177319 ?auto_177320 ) ) ( not ( = ?auto_177319 ?auto_177321 ) ) ( not ( = ?auto_177319 ?auto_177322 ) ) ( not ( = ?auto_177319 ?auto_177323 ) ) ( not ( = ?auto_177320 ?auto_177321 ) ) ( not ( = ?auto_177320 ?auto_177322 ) ) ( not ( = ?auto_177320 ?auto_177323 ) ) ( not ( = ?auto_177321 ?auto_177322 ) ) ( not ( = ?auto_177321 ?auto_177323 ) ) ( not ( = ?auto_177322 ?auto_177323 ) ) ( ON ?auto_177322 ?auto_177323 ) ( CLEAR ?auto_177320 ) ( ON ?auto_177321 ?auto_177322 ) ( CLEAR ?auto_177321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_177312 ?auto_177313 ?auto_177314 ?auto_177315 ?auto_177316 ?auto_177317 ?auto_177318 ?auto_177319 ?auto_177320 ?auto_177321 )
      ( MAKE-12PILE ?auto_177312 ?auto_177313 ?auto_177314 ?auto_177315 ?auto_177316 ?auto_177317 ?auto_177318 ?auto_177319 ?auto_177320 ?auto_177321 ?auto_177322 ?auto_177323 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177336 - BLOCK
      ?auto_177337 - BLOCK
      ?auto_177338 - BLOCK
      ?auto_177339 - BLOCK
      ?auto_177340 - BLOCK
      ?auto_177341 - BLOCK
      ?auto_177342 - BLOCK
      ?auto_177343 - BLOCK
      ?auto_177344 - BLOCK
      ?auto_177345 - BLOCK
      ?auto_177346 - BLOCK
      ?auto_177347 - BLOCK
    )
    :vars
    (
      ?auto_177348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177347 ?auto_177348 ) ( ON-TABLE ?auto_177336 ) ( ON ?auto_177337 ?auto_177336 ) ( ON ?auto_177338 ?auto_177337 ) ( ON ?auto_177339 ?auto_177338 ) ( ON ?auto_177340 ?auto_177339 ) ( ON ?auto_177341 ?auto_177340 ) ( ON ?auto_177342 ?auto_177341 ) ( ON ?auto_177343 ?auto_177342 ) ( not ( = ?auto_177336 ?auto_177337 ) ) ( not ( = ?auto_177336 ?auto_177338 ) ) ( not ( = ?auto_177336 ?auto_177339 ) ) ( not ( = ?auto_177336 ?auto_177340 ) ) ( not ( = ?auto_177336 ?auto_177341 ) ) ( not ( = ?auto_177336 ?auto_177342 ) ) ( not ( = ?auto_177336 ?auto_177343 ) ) ( not ( = ?auto_177336 ?auto_177344 ) ) ( not ( = ?auto_177336 ?auto_177345 ) ) ( not ( = ?auto_177336 ?auto_177346 ) ) ( not ( = ?auto_177336 ?auto_177347 ) ) ( not ( = ?auto_177336 ?auto_177348 ) ) ( not ( = ?auto_177337 ?auto_177338 ) ) ( not ( = ?auto_177337 ?auto_177339 ) ) ( not ( = ?auto_177337 ?auto_177340 ) ) ( not ( = ?auto_177337 ?auto_177341 ) ) ( not ( = ?auto_177337 ?auto_177342 ) ) ( not ( = ?auto_177337 ?auto_177343 ) ) ( not ( = ?auto_177337 ?auto_177344 ) ) ( not ( = ?auto_177337 ?auto_177345 ) ) ( not ( = ?auto_177337 ?auto_177346 ) ) ( not ( = ?auto_177337 ?auto_177347 ) ) ( not ( = ?auto_177337 ?auto_177348 ) ) ( not ( = ?auto_177338 ?auto_177339 ) ) ( not ( = ?auto_177338 ?auto_177340 ) ) ( not ( = ?auto_177338 ?auto_177341 ) ) ( not ( = ?auto_177338 ?auto_177342 ) ) ( not ( = ?auto_177338 ?auto_177343 ) ) ( not ( = ?auto_177338 ?auto_177344 ) ) ( not ( = ?auto_177338 ?auto_177345 ) ) ( not ( = ?auto_177338 ?auto_177346 ) ) ( not ( = ?auto_177338 ?auto_177347 ) ) ( not ( = ?auto_177338 ?auto_177348 ) ) ( not ( = ?auto_177339 ?auto_177340 ) ) ( not ( = ?auto_177339 ?auto_177341 ) ) ( not ( = ?auto_177339 ?auto_177342 ) ) ( not ( = ?auto_177339 ?auto_177343 ) ) ( not ( = ?auto_177339 ?auto_177344 ) ) ( not ( = ?auto_177339 ?auto_177345 ) ) ( not ( = ?auto_177339 ?auto_177346 ) ) ( not ( = ?auto_177339 ?auto_177347 ) ) ( not ( = ?auto_177339 ?auto_177348 ) ) ( not ( = ?auto_177340 ?auto_177341 ) ) ( not ( = ?auto_177340 ?auto_177342 ) ) ( not ( = ?auto_177340 ?auto_177343 ) ) ( not ( = ?auto_177340 ?auto_177344 ) ) ( not ( = ?auto_177340 ?auto_177345 ) ) ( not ( = ?auto_177340 ?auto_177346 ) ) ( not ( = ?auto_177340 ?auto_177347 ) ) ( not ( = ?auto_177340 ?auto_177348 ) ) ( not ( = ?auto_177341 ?auto_177342 ) ) ( not ( = ?auto_177341 ?auto_177343 ) ) ( not ( = ?auto_177341 ?auto_177344 ) ) ( not ( = ?auto_177341 ?auto_177345 ) ) ( not ( = ?auto_177341 ?auto_177346 ) ) ( not ( = ?auto_177341 ?auto_177347 ) ) ( not ( = ?auto_177341 ?auto_177348 ) ) ( not ( = ?auto_177342 ?auto_177343 ) ) ( not ( = ?auto_177342 ?auto_177344 ) ) ( not ( = ?auto_177342 ?auto_177345 ) ) ( not ( = ?auto_177342 ?auto_177346 ) ) ( not ( = ?auto_177342 ?auto_177347 ) ) ( not ( = ?auto_177342 ?auto_177348 ) ) ( not ( = ?auto_177343 ?auto_177344 ) ) ( not ( = ?auto_177343 ?auto_177345 ) ) ( not ( = ?auto_177343 ?auto_177346 ) ) ( not ( = ?auto_177343 ?auto_177347 ) ) ( not ( = ?auto_177343 ?auto_177348 ) ) ( not ( = ?auto_177344 ?auto_177345 ) ) ( not ( = ?auto_177344 ?auto_177346 ) ) ( not ( = ?auto_177344 ?auto_177347 ) ) ( not ( = ?auto_177344 ?auto_177348 ) ) ( not ( = ?auto_177345 ?auto_177346 ) ) ( not ( = ?auto_177345 ?auto_177347 ) ) ( not ( = ?auto_177345 ?auto_177348 ) ) ( not ( = ?auto_177346 ?auto_177347 ) ) ( not ( = ?auto_177346 ?auto_177348 ) ) ( not ( = ?auto_177347 ?auto_177348 ) ) ( ON ?auto_177346 ?auto_177347 ) ( ON ?auto_177345 ?auto_177346 ) ( CLEAR ?auto_177343 ) ( ON ?auto_177344 ?auto_177345 ) ( CLEAR ?auto_177344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_177336 ?auto_177337 ?auto_177338 ?auto_177339 ?auto_177340 ?auto_177341 ?auto_177342 ?auto_177343 ?auto_177344 )
      ( MAKE-12PILE ?auto_177336 ?auto_177337 ?auto_177338 ?auto_177339 ?auto_177340 ?auto_177341 ?auto_177342 ?auto_177343 ?auto_177344 ?auto_177345 ?auto_177346 ?auto_177347 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177361 - BLOCK
      ?auto_177362 - BLOCK
      ?auto_177363 - BLOCK
      ?auto_177364 - BLOCK
      ?auto_177365 - BLOCK
      ?auto_177366 - BLOCK
      ?auto_177367 - BLOCK
      ?auto_177368 - BLOCK
      ?auto_177369 - BLOCK
      ?auto_177370 - BLOCK
      ?auto_177371 - BLOCK
      ?auto_177372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177372 ) ( ON-TABLE ?auto_177361 ) ( ON ?auto_177362 ?auto_177361 ) ( ON ?auto_177363 ?auto_177362 ) ( ON ?auto_177364 ?auto_177363 ) ( ON ?auto_177365 ?auto_177364 ) ( ON ?auto_177366 ?auto_177365 ) ( ON ?auto_177367 ?auto_177366 ) ( ON ?auto_177368 ?auto_177367 ) ( not ( = ?auto_177361 ?auto_177362 ) ) ( not ( = ?auto_177361 ?auto_177363 ) ) ( not ( = ?auto_177361 ?auto_177364 ) ) ( not ( = ?auto_177361 ?auto_177365 ) ) ( not ( = ?auto_177361 ?auto_177366 ) ) ( not ( = ?auto_177361 ?auto_177367 ) ) ( not ( = ?auto_177361 ?auto_177368 ) ) ( not ( = ?auto_177361 ?auto_177369 ) ) ( not ( = ?auto_177361 ?auto_177370 ) ) ( not ( = ?auto_177361 ?auto_177371 ) ) ( not ( = ?auto_177361 ?auto_177372 ) ) ( not ( = ?auto_177362 ?auto_177363 ) ) ( not ( = ?auto_177362 ?auto_177364 ) ) ( not ( = ?auto_177362 ?auto_177365 ) ) ( not ( = ?auto_177362 ?auto_177366 ) ) ( not ( = ?auto_177362 ?auto_177367 ) ) ( not ( = ?auto_177362 ?auto_177368 ) ) ( not ( = ?auto_177362 ?auto_177369 ) ) ( not ( = ?auto_177362 ?auto_177370 ) ) ( not ( = ?auto_177362 ?auto_177371 ) ) ( not ( = ?auto_177362 ?auto_177372 ) ) ( not ( = ?auto_177363 ?auto_177364 ) ) ( not ( = ?auto_177363 ?auto_177365 ) ) ( not ( = ?auto_177363 ?auto_177366 ) ) ( not ( = ?auto_177363 ?auto_177367 ) ) ( not ( = ?auto_177363 ?auto_177368 ) ) ( not ( = ?auto_177363 ?auto_177369 ) ) ( not ( = ?auto_177363 ?auto_177370 ) ) ( not ( = ?auto_177363 ?auto_177371 ) ) ( not ( = ?auto_177363 ?auto_177372 ) ) ( not ( = ?auto_177364 ?auto_177365 ) ) ( not ( = ?auto_177364 ?auto_177366 ) ) ( not ( = ?auto_177364 ?auto_177367 ) ) ( not ( = ?auto_177364 ?auto_177368 ) ) ( not ( = ?auto_177364 ?auto_177369 ) ) ( not ( = ?auto_177364 ?auto_177370 ) ) ( not ( = ?auto_177364 ?auto_177371 ) ) ( not ( = ?auto_177364 ?auto_177372 ) ) ( not ( = ?auto_177365 ?auto_177366 ) ) ( not ( = ?auto_177365 ?auto_177367 ) ) ( not ( = ?auto_177365 ?auto_177368 ) ) ( not ( = ?auto_177365 ?auto_177369 ) ) ( not ( = ?auto_177365 ?auto_177370 ) ) ( not ( = ?auto_177365 ?auto_177371 ) ) ( not ( = ?auto_177365 ?auto_177372 ) ) ( not ( = ?auto_177366 ?auto_177367 ) ) ( not ( = ?auto_177366 ?auto_177368 ) ) ( not ( = ?auto_177366 ?auto_177369 ) ) ( not ( = ?auto_177366 ?auto_177370 ) ) ( not ( = ?auto_177366 ?auto_177371 ) ) ( not ( = ?auto_177366 ?auto_177372 ) ) ( not ( = ?auto_177367 ?auto_177368 ) ) ( not ( = ?auto_177367 ?auto_177369 ) ) ( not ( = ?auto_177367 ?auto_177370 ) ) ( not ( = ?auto_177367 ?auto_177371 ) ) ( not ( = ?auto_177367 ?auto_177372 ) ) ( not ( = ?auto_177368 ?auto_177369 ) ) ( not ( = ?auto_177368 ?auto_177370 ) ) ( not ( = ?auto_177368 ?auto_177371 ) ) ( not ( = ?auto_177368 ?auto_177372 ) ) ( not ( = ?auto_177369 ?auto_177370 ) ) ( not ( = ?auto_177369 ?auto_177371 ) ) ( not ( = ?auto_177369 ?auto_177372 ) ) ( not ( = ?auto_177370 ?auto_177371 ) ) ( not ( = ?auto_177370 ?auto_177372 ) ) ( not ( = ?auto_177371 ?auto_177372 ) ) ( ON ?auto_177371 ?auto_177372 ) ( ON ?auto_177370 ?auto_177371 ) ( CLEAR ?auto_177368 ) ( ON ?auto_177369 ?auto_177370 ) ( CLEAR ?auto_177369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_177361 ?auto_177362 ?auto_177363 ?auto_177364 ?auto_177365 ?auto_177366 ?auto_177367 ?auto_177368 ?auto_177369 )
      ( MAKE-12PILE ?auto_177361 ?auto_177362 ?auto_177363 ?auto_177364 ?auto_177365 ?auto_177366 ?auto_177367 ?auto_177368 ?auto_177369 ?auto_177370 ?auto_177371 ?auto_177372 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177385 - BLOCK
      ?auto_177386 - BLOCK
      ?auto_177387 - BLOCK
      ?auto_177388 - BLOCK
      ?auto_177389 - BLOCK
      ?auto_177390 - BLOCK
      ?auto_177391 - BLOCK
      ?auto_177392 - BLOCK
      ?auto_177393 - BLOCK
      ?auto_177394 - BLOCK
      ?auto_177395 - BLOCK
      ?auto_177396 - BLOCK
    )
    :vars
    (
      ?auto_177397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177396 ?auto_177397 ) ( ON-TABLE ?auto_177385 ) ( ON ?auto_177386 ?auto_177385 ) ( ON ?auto_177387 ?auto_177386 ) ( ON ?auto_177388 ?auto_177387 ) ( ON ?auto_177389 ?auto_177388 ) ( ON ?auto_177390 ?auto_177389 ) ( ON ?auto_177391 ?auto_177390 ) ( not ( = ?auto_177385 ?auto_177386 ) ) ( not ( = ?auto_177385 ?auto_177387 ) ) ( not ( = ?auto_177385 ?auto_177388 ) ) ( not ( = ?auto_177385 ?auto_177389 ) ) ( not ( = ?auto_177385 ?auto_177390 ) ) ( not ( = ?auto_177385 ?auto_177391 ) ) ( not ( = ?auto_177385 ?auto_177392 ) ) ( not ( = ?auto_177385 ?auto_177393 ) ) ( not ( = ?auto_177385 ?auto_177394 ) ) ( not ( = ?auto_177385 ?auto_177395 ) ) ( not ( = ?auto_177385 ?auto_177396 ) ) ( not ( = ?auto_177385 ?auto_177397 ) ) ( not ( = ?auto_177386 ?auto_177387 ) ) ( not ( = ?auto_177386 ?auto_177388 ) ) ( not ( = ?auto_177386 ?auto_177389 ) ) ( not ( = ?auto_177386 ?auto_177390 ) ) ( not ( = ?auto_177386 ?auto_177391 ) ) ( not ( = ?auto_177386 ?auto_177392 ) ) ( not ( = ?auto_177386 ?auto_177393 ) ) ( not ( = ?auto_177386 ?auto_177394 ) ) ( not ( = ?auto_177386 ?auto_177395 ) ) ( not ( = ?auto_177386 ?auto_177396 ) ) ( not ( = ?auto_177386 ?auto_177397 ) ) ( not ( = ?auto_177387 ?auto_177388 ) ) ( not ( = ?auto_177387 ?auto_177389 ) ) ( not ( = ?auto_177387 ?auto_177390 ) ) ( not ( = ?auto_177387 ?auto_177391 ) ) ( not ( = ?auto_177387 ?auto_177392 ) ) ( not ( = ?auto_177387 ?auto_177393 ) ) ( not ( = ?auto_177387 ?auto_177394 ) ) ( not ( = ?auto_177387 ?auto_177395 ) ) ( not ( = ?auto_177387 ?auto_177396 ) ) ( not ( = ?auto_177387 ?auto_177397 ) ) ( not ( = ?auto_177388 ?auto_177389 ) ) ( not ( = ?auto_177388 ?auto_177390 ) ) ( not ( = ?auto_177388 ?auto_177391 ) ) ( not ( = ?auto_177388 ?auto_177392 ) ) ( not ( = ?auto_177388 ?auto_177393 ) ) ( not ( = ?auto_177388 ?auto_177394 ) ) ( not ( = ?auto_177388 ?auto_177395 ) ) ( not ( = ?auto_177388 ?auto_177396 ) ) ( not ( = ?auto_177388 ?auto_177397 ) ) ( not ( = ?auto_177389 ?auto_177390 ) ) ( not ( = ?auto_177389 ?auto_177391 ) ) ( not ( = ?auto_177389 ?auto_177392 ) ) ( not ( = ?auto_177389 ?auto_177393 ) ) ( not ( = ?auto_177389 ?auto_177394 ) ) ( not ( = ?auto_177389 ?auto_177395 ) ) ( not ( = ?auto_177389 ?auto_177396 ) ) ( not ( = ?auto_177389 ?auto_177397 ) ) ( not ( = ?auto_177390 ?auto_177391 ) ) ( not ( = ?auto_177390 ?auto_177392 ) ) ( not ( = ?auto_177390 ?auto_177393 ) ) ( not ( = ?auto_177390 ?auto_177394 ) ) ( not ( = ?auto_177390 ?auto_177395 ) ) ( not ( = ?auto_177390 ?auto_177396 ) ) ( not ( = ?auto_177390 ?auto_177397 ) ) ( not ( = ?auto_177391 ?auto_177392 ) ) ( not ( = ?auto_177391 ?auto_177393 ) ) ( not ( = ?auto_177391 ?auto_177394 ) ) ( not ( = ?auto_177391 ?auto_177395 ) ) ( not ( = ?auto_177391 ?auto_177396 ) ) ( not ( = ?auto_177391 ?auto_177397 ) ) ( not ( = ?auto_177392 ?auto_177393 ) ) ( not ( = ?auto_177392 ?auto_177394 ) ) ( not ( = ?auto_177392 ?auto_177395 ) ) ( not ( = ?auto_177392 ?auto_177396 ) ) ( not ( = ?auto_177392 ?auto_177397 ) ) ( not ( = ?auto_177393 ?auto_177394 ) ) ( not ( = ?auto_177393 ?auto_177395 ) ) ( not ( = ?auto_177393 ?auto_177396 ) ) ( not ( = ?auto_177393 ?auto_177397 ) ) ( not ( = ?auto_177394 ?auto_177395 ) ) ( not ( = ?auto_177394 ?auto_177396 ) ) ( not ( = ?auto_177394 ?auto_177397 ) ) ( not ( = ?auto_177395 ?auto_177396 ) ) ( not ( = ?auto_177395 ?auto_177397 ) ) ( not ( = ?auto_177396 ?auto_177397 ) ) ( ON ?auto_177395 ?auto_177396 ) ( ON ?auto_177394 ?auto_177395 ) ( ON ?auto_177393 ?auto_177394 ) ( CLEAR ?auto_177391 ) ( ON ?auto_177392 ?auto_177393 ) ( CLEAR ?auto_177392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177385 ?auto_177386 ?auto_177387 ?auto_177388 ?auto_177389 ?auto_177390 ?auto_177391 ?auto_177392 )
      ( MAKE-12PILE ?auto_177385 ?auto_177386 ?auto_177387 ?auto_177388 ?auto_177389 ?auto_177390 ?auto_177391 ?auto_177392 ?auto_177393 ?auto_177394 ?auto_177395 ?auto_177396 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177410 - BLOCK
      ?auto_177411 - BLOCK
      ?auto_177412 - BLOCK
      ?auto_177413 - BLOCK
      ?auto_177414 - BLOCK
      ?auto_177415 - BLOCK
      ?auto_177416 - BLOCK
      ?auto_177417 - BLOCK
      ?auto_177418 - BLOCK
      ?auto_177419 - BLOCK
      ?auto_177420 - BLOCK
      ?auto_177421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177421 ) ( ON-TABLE ?auto_177410 ) ( ON ?auto_177411 ?auto_177410 ) ( ON ?auto_177412 ?auto_177411 ) ( ON ?auto_177413 ?auto_177412 ) ( ON ?auto_177414 ?auto_177413 ) ( ON ?auto_177415 ?auto_177414 ) ( ON ?auto_177416 ?auto_177415 ) ( not ( = ?auto_177410 ?auto_177411 ) ) ( not ( = ?auto_177410 ?auto_177412 ) ) ( not ( = ?auto_177410 ?auto_177413 ) ) ( not ( = ?auto_177410 ?auto_177414 ) ) ( not ( = ?auto_177410 ?auto_177415 ) ) ( not ( = ?auto_177410 ?auto_177416 ) ) ( not ( = ?auto_177410 ?auto_177417 ) ) ( not ( = ?auto_177410 ?auto_177418 ) ) ( not ( = ?auto_177410 ?auto_177419 ) ) ( not ( = ?auto_177410 ?auto_177420 ) ) ( not ( = ?auto_177410 ?auto_177421 ) ) ( not ( = ?auto_177411 ?auto_177412 ) ) ( not ( = ?auto_177411 ?auto_177413 ) ) ( not ( = ?auto_177411 ?auto_177414 ) ) ( not ( = ?auto_177411 ?auto_177415 ) ) ( not ( = ?auto_177411 ?auto_177416 ) ) ( not ( = ?auto_177411 ?auto_177417 ) ) ( not ( = ?auto_177411 ?auto_177418 ) ) ( not ( = ?auto_177411 ?auto_177419 ) ) ( not ( = ?auto_177411 ?auto_177420 ) ) ( not ( = ?auto_177411 ?auto_177421 ) ) ( not ( = ?auto_177412 ?auto_177413 ) ) ( not ( = ?auto_177412 ?auto_177414 ) ) ( not ( = ?auto_177412 ?auto_177415 ) ) ( not ( = ?auto_177412 ?auto_177416 ) ) ( not ( = ?auto_177412 ?auto_177417 ) ) ( not ( = ?auto_177412 ?auto_177418 ) ) ( not ( = ?auto_177412 ?auto_177419 ) ) ( not ( = ?auto_177412 ?auto_177420 ) ) ( not ( = ?auto_177412 ?auto_177421 ) ) ( not ( = ?auto_177413 ?auto_177414 ) ) ( not ( = ?auto_177413 ?auto_177415 ) ) ( not ( = ?auto_177413 ?auto_177416 ) ) ( not ( = ?auto_177413 ?auto_177417 ) ) ( not ( = ?auto_177413 ?auto_177418 ) ) ( not ( = ?auto_177413 ?auto_177419 ) ) ( not ( = ?auto_177413 ?auto_177420 ) ) ( not ( = ?auto_177413 ?auto_177421 ) ) ( not ( = ?auto_177414 ?auto_177415 ) ) ( not ( = ?auto_177414 ?auto_177416 ) ) ( not ( = ?auto_177414 ?auto_177417 ) ) ( not ( = ?auto_177414 ?auto_177418 ) ) ( not ( = ?auto_177414 ?auto_177419 ) ) ( not ( = ?auto_177414 ?auto_177420 ) ) ( not ( = ?auto_177414 ?auto_177421 ) ) ( not ( = ?auto_177415 ?auto_177416 ) ) ( not ( = ?auto_177415 ?auto_177417 ) ) ( not ( = ?auto_177415 ?auto_177418 ) ) ( not ( = ?auto_177415 ?auto_177419 ) ) ( not ( = ?auto_177415 ?auto_177420 ) ) ( not ( = ?auto_177415 ?auto_177421 ) ) ( not ( = ?auto_177416 ?auto_177417 ) ) ( not ( = ?auto_177416 ?auto_177418 ) ) ( not ( = ?auto_177416 ?auto_177419 ) ) ( not ( = ?auto_177416 ?auto_177420 ) ) ( not ( = ?auto_177416 ?auto_177421 ) ) ( not ( = ?auto_177417 ?auto_177418 ) ) ( not ( = ?auto_177417 ?auto_177419 ) ) ( not ( = ?auto_177417 ?auto_177420 ) ) ( not ( = ?auto_177417 ?auto_177421 ) ) ( not ( = ?auto_177418 ?auto_177419 ) ) ( not ( = ?auto_177418 ?auto_177420 ) ) ( not ( = ?auto_177418 ?auto_177421 ) ) ( not ( = ?auto_177419 ?auto_177420 ) ) ( not ( = ?auto_177419 ?auto_177421 ) ) ( not ( = ?auto_177420 ?auto_177421 ) ) ( ON ?auto_177420 ?auto_177421 ) ( ON ?auto_177419 ?auto_177420 ) ( ON ?auto_177418 ?auto_177419 ) ( CLEAR ?auto_177416 ) ( ON ?auto_177417 ?auto_177418 ) ( CLEAR ?auto_177417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_177410 ?auto_177411 ?auto_177412 ?auto_177413 ?auto_177414 ?auto_177415 ?auto_177416 ?auto_177417 )
      ( MAKE-12PILE ?auto_177410 ?auto_177411 ?auto_177412 ?auto_177413 ?auto_177414 ?auto_177415 ?auto_177416 ?auto_177417 ?auto_177418 ?auto_177419 ?auto_177420 ?auto_177421 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177434 - BLOCK
      ?auto_177435 - BLOCK
      ?auto_177436 - BLOCK
      ?auto_177437 - BLOCK
      ?auto_177438 - BLOCK
      ?auto_177439 - BLOCK
      ?auto_177440 - BLOCK
      ?auto_177441 - BLOCK
      ?auto_177442 - BLOCK
      ?auto_177443 - BLOCK
      ?auto_177444 - BLOCK
      ?auto_177445 - BLOCK
    )
    :vars
    (
      ?auto_177446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177445 ?auto_177446 ) ( ON-TABLE ?auto_177434 ) ( ON ?auto_177435 ?auto_177434 ) ( ON ?auto_177436 ?auto_177435 ) ( ON ?auto_177437 ?auto_177436 ) ( ON ?auto_177438 ?auto_177437 ) ( ON ?auto_177439 ?auto_177438 ) ( not ( = ?auto_177434 ?auto_177435 ) ) ( not ( = ?auto_177434 ?auto_177436 ) ) ( not ( = ?auto_177434 ?auto_177437 ) ) ( not ( = ?auto_177434 ?auto_177438 ) ) ( not ( = ?auto_177434 ?auto_177439 ) ) ( not ( = ?auto_177434 ?auto_177440 ) ) ( not ( = ?auto_177434 ?auto_177441 ) ) ( not ( = ?auto_177434 ?auto_177442 ) ) ( not ( = ?auto_177434 ?auto_177443 ) ) ( not ( = ?auto_177434 ?auto_177444 ) ) ( not ( = ?auto_177434 ?auto_177445 ) ) ( not ( = ?auto_177434 ?auto_177446 ) ) ( not ( = ?auto_177435 ?auto_177436 ) ) ( not ( = ?auto_177435 ?auto_177437 ) ) ( not ( = ?auto_177435 ?auto_177438 ) ) ( not ( = ?auto_177435 ?auto_177439 ) ) ( not ( = ?auto_177435 ?auto_177440 ) ) ( not ( = ?auto_177435 ?auto_177441 ) ) ( not ( = ?auto_177435 ?auto_177442 ) ) ( not ( = ?auto_177435 ?auto_177443 ) ) ( not ( = ?auto_177435 ?auto_177444 ) ) ( not ( = ?auto_177435 ?auto_177445 ) ) ( not ( = ?auto_177435 ?auto_177446 ) ) ( not ( = ?auto_177436 ?auto_177437 ) ) ( not ( = ?auto_177436 ?auto_177438 ) ) ( not ( = ?auto_177436 ?auto_177439 ) ) ( not ( = ?auto_177436 ?auto_177440 ) ) ( not ( = ?auto_177436 ?auto_177441 ) ) ( not ( = ?auto_177436 ?auto_177442 ) ) ( not ( = ?auto_177436 ?auto_177443 ) ) ( not ( = ?auto_177436 ?auto_177444 ) ) ( not ( = ?auto_177436 ?auto_177445 ) ) ( not ( = ?auto_177436 ?auto_177446 ) ) ( not ( = ?auto_177437 ?auto_177438 ) ) ( not ( = ?auto_177437 ?auto_177439 ) ) ( not ( = ?auto_177437 ?auto_177440 ) ) ( not ( = ?auto_177437 ?auto_177441 ) ) ( not ( = ?auto_177437 ?auto_177442 ) ) ( not ( = ?auto_177437 ?auto_177443 ) ) ( not ( = ?auto_177437 ?auto_177444 ) ) ( not ( = ?auto_177437 ?auto_177445 ) ) ( not ( = ?auto_177437 ?auto_177446 ) ) ( not ( = ?auto_177438 ?auto_177439 ) ) ( not ( = ?auto_177438 ?auto_177440 ) ) ( not ( = ?auto_177438 ?auto_177441 ) ) ( not ( = ?auto_177438 ?auto_177442 ) ) ( not ( = ?auto_177438 ?auto_177443 ) ) ( not ( = ?auto_177438 ?auto_177444 ) ) ( not ( = ?auto_177438 ?auto_177445 ) ) ( not ( = ?auto_177438 ?auto_177446 ) ) ( not ( = ?auto_177439 ?auto_177440 ) ) ( not ( = ?auto_177439 ?auto_177441 ) ) ( not ( = ?auto_177439 ?auto_177442 ) ) ( not ( = ?auto_177439 ?auto_177443 ) ) ( not ( = ?auto_177439 ?auto_177444 ) ) ( not ( = ?auto_177439 ?auto_177445 ) ) ( not ( = ?auto_177439 ?auto_177446 ) ) ( not ( = ?auto_177440 ?auto_177441 ) ) ( not ( = ?auto_177440 ?auto_177442 ) ) ( not ( = ?auto_177440 ?auto_177443 ) ) ( not ( = ?auto_177440 ?auto_177444 ) ) ( not ( = ?auto_177440 ?auto_177445 ) ) ( not ( = ?auto_177440 ?auto_177446 ) ) ( not ( = ?auto_177441 ?auto_177442 ) ) ( not ( = ?auto_177441 ?auto_177443 ) ) ( not ( = ?auto_177441 ?auto_177444 ) ) ( not ( = ?auto_177441 ?auto_177445 ) ) ( not ( = ?auto_177441 ?auto_177446 ) ) ( not ( = ?auto_177442 ?auto_177443 ) ) ( not ( = ?auto_177442 ?auto_177444 ) ) ( not ( = ?auto_177442 ?auto_177445 ) ) ( not ( = ?auto_177442 ?auto_177446 ) ) ( not ( = ?auto_177443 ?auto_177444 ) ) ( not ( = ?auto_177443 ?auto_177445 ) ) ( not ( = ?auto_177443 ?auto_177446 ) ) ( not ( = ?auto_177444 ?auto_177445 ) ) ( not ( = ?auto_177444 ?auto_177446 ) ) ( not ( = ?auto_177445 ?auto_177446 ) ) ( ON ?auto_177444 ?auto_177445 ) ( ON ?auto_177443 ?auto_177444 ) ( ON ?auto_177442 ?auto_177443 ) ( ON ?auto_177441 ?auto_177442 ) ( CLEAR ?auto_177439 ) ( ON ?auto_177440 ?auto_177441 ) ( CLEAR ?auto_177440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177434 ?auto_177435 ?auto_177436 ?auto_177437 ?auto_177438 ?auto_177439 ?auto_177440 )
      ( MAKE-12PILE ?auto_177434 ?auto_177435 ?auto_177436 ?auto_177437 ?auto_177438 ?auto_177439 ?auto_177440 ?auto_177441 ?auto_177442 ?auto_177443 ?auto_177444 ?auto_177445 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177459 - BLOCK
      ?auto_177460 - BLOCK
      ?auto_177461 - BLOCK
      ?auto_177462 - BLOCK
      ?auto_177463 - BLOCK
      ?auto_177464 - BLOCK
      ?auto_177465 - BLOCK
      ?auto_177466 - BLOCK
      ?auto_177467 - BLOCK
      ?auto_177468 - BLOCK
      ?auto_177469 - BLOCK
      ?auto_177470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177470 ) ( ON-TABLE ?auto_177459 ) ( ON ?auto_177460 ?auto_177459 ) ( ON ?auto_177461 ?auto_177460 ) ( ON ?auto_177462 ?auto_177461 ) ( ON ?auto_177463 ?auto_177462 ) ( ON ?auto_177464 ?auto_177463 ) ( not ( = ?auto_177459 ?auto_177460 ) ) ( not ( = ?auto_177459 ?auto_177461 ) ) ( not ( = ?auto_177459 ?auto_177462 ) ) ( not ( = ?auto_177459 ?auto_177463 ) ) ( not ( = ?auto_177459 ?auto_177464 ) ) ( not ( = ?auto_177459 ?auto_177465 ) ) ( not ( = ?auto_177459 ?auto_177466 ) ) ( not ( = ?auto_177459 ?auto_177467 ) ) ( not ( = ?auto_177459 ?auto_177468 ) ) ( not ( = ?auto_177459 ?auto_177469 ) ) ( not ( = ?auto_177459 ?auto_177470 ) ) ( not ( = ?auto_177460 ?auto_177461 ) ) ( not ( = ?auto_177460 ?auto_177462 ) ) ( not ( = ?auto_177460 ?auto_177463 ) ) ( not ( = ?auto_177460 ?auto_177464 ) ) ( not ( = ?auto_177460 ?auto_177465 ) ) ( not ( = ?auto_177460 ?auto_177466 ) ) ( not ( = ?auto_177460 ?auto_177467 ) ) ( not ( = ?auto_177460 ?auto_177468 ) ) ( not ( = ?auto_177460 ?auto_177469 ) ) ( not ( = ?auto_177460 ?auto_177470 ) ) ( not ( = ?auto_177461 ?auto_177462 ) ) ( not ( = ?auto_177461 ?auto_177463 ) ) ( not ( = ?auto_177461 ?auto_177464 ) ) ( not ( = ?auto_177461 ?auto_177465 ) ) ( not ( = ?auto_177461 ?auto_177466 ) ) ( not ( = ?auto_177461 ?auto_177467 ) ) ( not ( = ?auto_177461 ?auto_177468 ) ) ( not ( = ?auto_177461 ?auto_177469 ) ) ( not ( = ?auto_177461 ?auto_177470 ) ) ( not ( = ?auto_177462 ?auto_177463 ) ) ( not ( = ?auto_177462 ?auto_177464 ) ) ( not ( = ?auto_177462 ?auto_177465 ) ) ( not ( = ?auto_177462 ?auto_177466 ) ) ( not ( = ?auto_177462 ?auto_177467 ) ) ( not ( = ?auto_177462 ?auto_177468 ) ) ( not ( = ?auto_177462 ?auto_177469 ) ) ( not ( = ?auto_177462 ?auto_177470 ) ) ( not ( = ?auto_177463 ?auto_177464 ) ) ( not ( = ?auto_177463 ?auto_177465 ) ) ( not ( = ?auto_177463 ?auto_177466 ) ) ( not ( = ?auto_177463 ?auto_177467 ) ) ( not ( = ?auto_177463 ?auto_177468 ) ) ( not ( = ?auto_177463 ?auto_177469 ) ) ( not ( = ?auto_177463 ?auto_177470 ) ) ( not ( = ?auto_177464 ?auto_177465 ) ) ( not ( = ?auto_177464 ?auto_177466 ) ) ( not ( = ?auto_177464 ?auto_177467 ) ) ( not ( = ?auto_177464 ?auto_177468 ) ) ( not ( = ?auto_177464 ?auto_177469 ) ) ( not ( = ?auto_177464 ?auto_177470 ) ) ( not ( = ?auto_177465 ?auto_177466 ) ) ( not ( = ?auto_177465 ?auto_177467 ) ) ( not ( = ?auto_177465 ?auto_177468 ) ) ( not ( = ?auto_177465 ?auto_177469 ) ) ( not ( = ?auto_177465 ?auto_177470 ) ) ( not ( = ?auto_177466 ?auto_177467 ) ) ( not ( = ?auto_177466 ?auto_177468 ) ) ( not ( = ?auto_177466 ?auto_177469 ) ) ( not ( = ?auto_177466 ?auto_177470 ) ) ( not ( = ?auto_177467 ?auto_177468 ) ) ( not ( = ?auto_177467 ?auto_177469 ) ) ( not ( = ?auto_177467 ?auto_177470 ) ) ( not ( = ?auto_177468 ?auto_177469 ) ) ( not ( = ?auto_177468 ?auto_177470 ) ) ( not ( = ?auto_177469 ?auto_177470 ) ) ( ON ?auto_177469 ?auto_177470 ) ( ON ?auto_177468 ?auto_177469 ) ( ON ?auto_177467 ?auto_177468 ) ( ON ?auto_177466 ?auto_177467 ) ( CLEAR ?auto_177464 ) ( ON ?auto_177465 ?auto_177466 ) ( CLEAR ?auto_177465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_177459 ?auto_177460 ?auto_177461 ?auto_177462 ?auto_177463 ?auto_177464 ?auto_177465 )
      ( MAKE-12PILE ?auto_177459 ?auto_177460 ?auto_177461 ?auto_177462 ?auto_177463 ?auto_177464 ?auto_177465 ?auto_177466 ?auto_177467 ?auto_177468 ?auto_177469 ?auto_177470 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177483 - BLOCK
      ?auto_177484 - BLOCK
      ?auto_177485 - BLOCK
      ?auto_177486 - BLOCK
      ?auto_177487 - BLOCK
      ?auto_177488 - BLOCK
      ?auto_177489 - BLOCK
      ?auto_177490 - BLOCK
      ?auto_177491 - BLOCK
      ?auto_177492 - BLOCK
      ?auto_177493 - BLOCK
      ?auto_177494 - BLOCK
    )
    :vars
    (
      ?auto_177495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177494 ?auto_177495 ) ( ON-TABLE ?auto_177483 ) ( ON ?auto_177484 ?auto_177483 ) ( ON ?auto_177485 ?auto_177484 ) ( ON ?auto_177486 ?auto_177485 ) ( ON ?auto_177487 ?auto_177486 ) ( not ( = ?auto_177483 ?auto_177484 ) ) ( not ( = ?auto_177483 ?auto_177485 ) ) ( not ( = ?auto_177483 ?auto_177486 ) ) ( not ( = ?auto_177483 ?auto_177487 ) ) ( not ( = ?auto_177483 ?auto_177488 ) ) ( not ( = ?auto_177483 ?auto_177489 ) ) ( not ( = ?auto_177483 ?auto_177490 ) ) ( not ( = ?auto_177483 ?auto_177491 ) ) ( not ( = ?auto_177483 ?auto_177492 ) ) ( not ( = ?auto_177483 ?auto_177493 ) ) ( not ( = ?auto_177483 ?auto_177494 ) ) ( not ( = ?auto_177483 ?auto_177495 ) ) ( not ( = ?auto_177484 ?auto_177485 ) ) ( not ( = ?auto_177484 ?auto_177486 ) ) ( not ( = ?auto_177484 ?auto_177487 ) ) ( not ( = ?auto_177484 ?auto_177488 ) ) ( not ( = ?auto_177484 ?auto_177489 ) ) ( not ( = ?auto_177484 ?auto_177490 ) ) ( not ( = ?auto_177484 ?auto_177491 ) ) ( not ( = ?auto_177484 ?auto_177492 ) ) ( not ( = ?auto_177484 ?auto_177493 ) ) ( not ( = ?auto_177484 ?auto_177494 ) ) ( not ( = ?auto_177484 ?auto_177495 ) ) ( not ( = ?auto_177485 ?auto_177486 ) ) ( not ( = ?auto_177485 ?auto_177487 ) ) ( not ( = ?auto_177485 ?auto_177488 ) ) ( not ( = ?auto_177485 ?auto_177489 ) ) ( not ( = ?auto_177485 ?auto_177490 ) ) ( not ( = ?auto_177485 ?auto_177491 ) ) ( not ( = ?auto_177485 ?auto_177492 ) ) ( not ( = ?auto_177485 ?auto_177493 ) ) ( not ( = ?auto_177485 ?auto_177494 ) ) ( not ( = ?auto_177485 ?auto_177495 ) ) ( not ( = ?auto_177486 ?auto_177487 ) ) ( not ( = ?auto_177486 ?auto_177488 ) ) ( not ( = ?auto_177486 ?auto_177489 ) ) ( not ( = ?auto_177486 ?auto_177490 ) ) ( not ( = ?auto_177486 ?auto_177491 ) ) ( not ( = ?auto_177486 ?auto_177492 ) ) ( not ( = ?auto_177486 ?auto_177493 ) ) ( not ( = ?auto_177486 ?auto_177494 ) ) ( not ( = ?auto_177486 ?auto_177495 ) ) ( not ( = ?auto_177487 ?auto_177488 ) ) ( not ( = ?auto_177487 ?auto_177489 ) ) ( not ( = ?auto_177487 ?auto_177490 ) ) ( not ( = ?auto_177487 ?auto_177491 ) ) ( not ( = ?auto_177487 ?auto_177492 ) ) ( not ( = ?auto_177487 ?auto_177493 ) ) ( not ( = ?auto_177487 ?auto_177494 ) ) ( not ( = ?auto_177487 ?auto_177495 ) ) ( not ( = ?auto_177488 ?auto_177489 ) ) ( not ( = ?auto_177488 ?auto_177490 ) ) ( not ( = ?auto_177488 ?auto_177491 ) ) ( not ( = ?auto_177488 ?auto_177492 ) ) ( not ( = ?auto_177488 ?auto_177493 ) ) ( not ( = ?auto_177488 ?auto_177494 ) ) ( not ( = ?auto_177488 ?auto_177495 ) ) ( not ( = ?auto_177489 ?auto_177490 ) ) ( not ( = ?auto_177489 ?auto_177491 ) ) ( not ( = ?auto_177489 ?auto_177492 ) ) ( not ( = ?auto_177489 ?auto_177493 ) ) ( not ( = ?auto_177489 ?auto_177494 ) ) ( not ( = ?auto_177489 ?auto_177495 ) ) ( not ( = ?auto_177490 ?auto_177491 ) ) ( not ( = ?auto_177490 ?auto_177492 ) ) ( not ( = ?auto_177490 ?auto_177493 ) ) ( not ( = ?auto_177490 ?auto_177494 ) ) ( not ( = ?auto_177490 ?auto_177495 ) ) ( not ( = ?auto_177491 ?auto_177492 ) ) ( not ( = ?auto_177491 ?auto_177493 ) ) ( not ( = ?auto_177491 ?auto_177494 ) ) ( not ( = ?auto_177491 ?auto_177495 ) ) ( not ( = ?auto_177492 ?auto_177493 ) ) ( not ( = ?auto_177492 ?auto_177494 ) ) ( not ( = ?auto_177492 ?auto_177495 ) ) ( not ( = ?auto_177493 ?auto_177494 ) ) ( not ( = ?auto_177493 ?auto_177495 ) ) ( not ( = ?auto_177494 ?auto_177495 ) ) ( ON ?auto_177493 ?auto_177494 ) ( ON ?auto_177492 ?auto_177493 ) ( ON ?auto_177491 ?auto_177492 ) ( ON ?auto_177490 ?auto_177491 ) ( ON ?auto_177489 ?auto_177490 ) ( CLEAR ?auto_177487 ) ( ON ?auto_177488 ?auto_177489 ) ( CLEAR ?auto_177488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177483 ?auto_177484 ?auto_177485 ?auto_177486 ?auto_177487 ?auto_177488 )
      ( MAKE-12PILE ?auto_177483 ?auto_177484 ?auto_177485 ?auto_177486 ?auto_177487 ?auto_177488 ?auto_177489 ?auto_177490 ?auto_177491 ?auto_177492 ?auto_177493 ?auto_177494 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177508 - BLOCK
      ?auto_177509 - BLOCK
      ?auto_177510 - BLOCK
      ?auto_177511 - BLOCK
      ?auto_177512 - BLOCK
      ?auto_177513 - BLOCK
      ?auto_177514 - BLOCK
      ?auto_177515 - BLOCK
      ?auto_177516 - BLOCK
      ?auto_177517 - BLOCK
      ?auto_177518 - BLOCK
      ?auto_177519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177519 ) ( ON-TABLE ?auto_177508 ) ( ON ?auto_177509 ?auto_177508 ) ( ON ?auto_177510 ?auto_177509 ) ( ON ?auto_177511 ?auto_177510 ) ( ON ?auto_177512 ?auto_177511 ) ( not ( = ?auto_177508 ?auto_177509 ) ) ( not ( = ?auto_177508 ?auto_177510 ) ) ( not ( = ?auto_177508 ?auto_177511 ) ) ( not ( = ?auto_177508 ?auto_177512 ) ) ( not ( = ?auto_177508 ?auto_177513 ) ) ( not ( = ?auto_177508 ?auto_177514 ) ) ( not ( = ?auto_177508 ?auto_177515 ) ) ( not ( = ?auto_177508 ?auto_177516 ) ) ( not ( = ?auto_177508 ?auto_177517 ) ) ( not ( = ?auto_177508 ?auto_177518 ) ) ( not ( = ?auto_177508 ?auto_177519 ) ) ( not ( = ?auto_177509 ?auto_177510 ) ) ( not ( = ?auto_177509 ?auto_177511 ) ) ( not ( = ?auto_177509 ?auto_177512 ) ) ( not ( = ?auto_177509 ?auto_177513 ) ) ( not ( = ?auto_177509 ?auto_177514 ) ) ( not ( = ?auto_177509 ?auto_177515 ) ) ( not ( = ?auto_177509 ?auto_177516 ) ) ( not ( = ?auto_177509 ?auto_177517 ) ) ( not ( = ?auto_177509 ?auto_177518 ) ) ( not ( = ?auto_177509 ?auto_177519 ) ) ( not ( = ?auto_177510 ?auto_177511 ) ) ( not ( = ?auto_177510 ?auto_177512 ) ) ( not ( = ?auto_177510 ?auto_177513 ) ) ( not ( = ?auto_177510 ?auto_177514 ) ) ( not ( = ?auto_177510 ?auto_177515 ) ) ( not ( = ?auto_177510 ?auto_177516 ) ) ( not ( = ?auto_177510 ?auto_177517 ) ) ( not ( = ?auto_177510 ?auto_177518 ) ) ( not ( = ?auto_177510 ?auto_177519 ) ) ( not ( = ?auto_177511 ?auto_177512 ) ) ( not ( = ?auto_177511 ?auto_177513 ) ) ( not ( = ?auto_177511 ?auto_177514 ) ) ( not ( = ?auto_177511 ?auto_177515 ) ) ( not ( = ?auto_177511 ?auto_177516 ) ) ( not ( = ?auto_177511 ?auto_177517 ) ) ( not ( = ?auto_177511 ?auto_177518 ) ) ( not ( = ?auto_177511 ?auto_177519 ) ) ( not ( = ?auto_177512 ?auto_177513 ) ) ( not ( = ?auto_177512 ?auto_177514 ) ) ( not ( = ?auto_177512 ?auto_177515 ) ) ( not ( = ?auto_177512 ?auto_177516 ) ) ( not ( = ?auto_177512 ?auto_177517 ) ) ( not ( = ?auto_177512 ?auto_177518 ) ) ( not ( = ?auto_177512 ?auto_177519 ) ) ( not ( = ?auto_177513 ?auto_177514 ) ) ( not ( = ?auto_177513 ?auto_177515 ) ) ( not ( = ?auto_177513 ?auto_177516 ) ) ( not ( = ?auto_177513 ?auto_177517 ) ) ( not ( = ?auto_177513 ?auto_177518 ) ) ( not ( = ?auto_177513 ?auto_177519 ) ) ( not ( = ?auto_177514 ?auto_177515 ) ) ( not ( = ?auto_177514 ?auto_177516 ) ) ( not ( = ?auto_177514 ?auto_177517 ) ) ( not ( = ?auto_177514 ?auto_177518 ) ) ( not ( = ?auto_177514 ?auto_177519 ) ) ( not ( = ?auto_177515 ?auto_177516 ) ) ( not ( = ?auto_177515 ?auto_177517 ) ) ( not ( = ?auto_177515 ?auto_177518 ) ) ( not ( = ?auto_177515 ?auto_177519 ) ) ( not ( = ?auto_177516 ?auto_177517 ) ) ( not ( = ?auto_177516 ?auto_177518 ) ) ( not ( = ?auto_177516 ?auto_177519 ) ) ( not ( = ?auto_177517 ?auto_177518 ) ) ( not ( = ?auto_177517 ?auto_177519 ) ) ( not ( = ?auto_177518 ?auto_177519 ) ) ( ON ?auto_177518 ?auto_177519 ) ( ON ?auto_177517 ?auto_177518 ) ( ON ?auto_177516 ?auto_177517 ) ( ON ?auto_177515 ?auto_177516 ) ( ON ?auto_177514 ?auto_177515 ) ( CLEAR ?auto_177512 ) ( ON ?auto_177513 ?auto_177514 ) ( CLEAR ?auto_177513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_177508 ?auto_177509 ?auto_177510 ?auto_177511 ?auto_177512 ?auto_177513 )
      ( MAKE-12PILE ?auto_177508 ?auto_177509 ?auto_177510 ?auto_177511 ?auto_177512 ?auto_177513 ?auto_177514 ?auto_177515 ?auto_177516 ?auto_177517 ?auto_177518 ?auto_177519 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177532 - BLOCK
      ?auto_177533 - BLOCK
      ?auto_177534 - BLOCK
      ?auto_177535 - BLOCK
      ?auto_177536 - BLOCK
      ?auto_177537 - BLOCK
      ?auto_177538 - BLOCK
      ?auto_177539 - BLOCK
      ?auto_177540 - BLOCK
      ?auto_177541 - BLOCK
      ?auto_177542 - BLOCK
      ?auto_177543 - BLOCK
    )
    :vars
    (
      ?auto_177544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177543 ?auto_177544 ) ( ON-TABLE ?auto_177532 ) ( ON ?auto_177533 ?auto_177532 ) ( ON ?auto_177534 ?auto_177533 ) ( ON ?auto_177535 ?auto_177534 ) ( not ( = ?auto_177532 ?auto_177533 ) ) ( not ( = ?auto_177532 ?auto_177534 ) ) ( not ( = ?auto_177532 ?auto_177535 ) ) ( not ( = ?auto_177532 ?auto_177536 ) ) ( not ( = ?auto_177532 ?auto_177537 ) ) ( not ( = ?auto_177532 ?auto_177538 ) ) ( not ( = ?auto_177532 ?auto_177539 ) ) ( not ( = ?auto_177532 ?auto_177540 ) ) ( not ( = ?auto_177532 ?auto_177541 ) ) ( not ( = ?auto_177532 ?auto_177542 ) ) ( not ( = ?auto_177532 ?auto_177543 ) ) ( not ( = ?auto_177532 ?auto_177544 ) ) ( not ( = ?auto_177533 ?auto_177534 ) ) ( not ( = ?auto_177533 ?auto_177535 ) ) ( not ( = ?auto_177533 ?auto_177536 ) ) ( not ( = ?auto_177533 ?auto_177537 ) ) ( not ( = ?auto_177533 ?auto_177538 ) ) ( not ( = ?auto_177533 ?auto_177539 ) ) ( not ( = ?auto_177533 ?auto_177540 ) ) ( not ( = ?auto_177533 ?auto_177541 ) ) ( not ( = ?auto_177533 ?auto_177542 ) ) ( not ( = ?auto_177533 ?auto_177543 ) ) ( not ( = ?auto_177533 ?auto_177544 ) ) ( not ( = ?auto_177534 ?auto_177535 ) ) ( not ( = ?auto_177534 ?auto_177536 ) ) ( not ( = ?auto_177534 ?auto_177537 ) ) ( not ( = ?auto_177534 ?auto_177538 ) ) ( not ( = ?auto_177534 ?auto_177539 ) ) ( not ( = ?auto_177534 ?auto_177540 ) ) ( not ( = ?auto_177534 ?auto_177541 ) ) ( not ( = ?auto_177534 ?auto_177542 ) ) ( not ( = ?auto_177534 ?auto_177543 ) ) ( not ( = ?auto_177534 ?auto_177544 ) ) ( not ( = ?auto_177535 ?auto_177536 ) ) ( not ( = ?auto_177535 ?auto_177537 ) ) ( not ( = ?auto_177535 ?auto_177538 ) ) ( not ( = ?auto_177535 ?auto_177539 ) ) ( not ( = ?auto_177535 ?auto_177540 ) ) ( not ( = ?auto_177535 ?auto_177541 ) ) ( not ( = ?auto_177535 ?auto_177542 ) ) ( not ( = ?auto_177535 ?auto_177543 ) ) ( not ( = ?auto_177535 ?auto_177544 ) ) ( not ( = ?auto_177536 ?auto_177537 ) ) ( not ( = ?auto_177536 ?auto_177538 ) ) ( not ( = ?auto_177536 ?auto_177539 ) ) ( not ( = ?auto_177536 ?auto_177540 ) ) ( not ( = ?auto_177536 ?auto_177541 ) ) ( not ( = ?auto_177536 ?auto_177542 ) ) ( not ( = ?auto_177536 ?auto_177543 ) ) ( not ( = ?auto_177536 ?auto_177544 ) ) ( not ( = ?auto_177537 ?auto_177538 ) ) ( not ( = ?auto_177537 ?auto_177539 ) ) ( not ( = ?auto_177537 ?auto_177540 ) ) ( not ( = ?auto_177537 ?auto_177541 ) ) ( not ( = ?auto_177537 ?auto_177542 ) ) ( not ( = ?auto_177537 ?auto_177543 ) ) ( not ( = ?auto_177537 ?auto_177544 ) ) ( not ( = ?auto_177538 ?auto_177539 ) ) ( not ( = ?auto_177538 ?auto_177540 ) ) ( not ( = ?auto_177538 ?auto_177541 ) ) ( not ( = ?auto_177538 ?auto_177542 ) ) ( not ( = ?auto_177538 ?auto_177543 ) ) ( not ( = ?auto_177538 ?auto_177544 ) ) ( not ( = ?auto_177539 ?auto_177540 ) ) ( not ( = ?auto_177539 ?auto_177541 ) ) ( not ( = ?auto_177539 ?auto_177542 ) ) ( not ( = ?auto_177539 ?auto_177543 ) ) ( not ( = ?auto_177539 ?auto_177544 ) ) ( not ( = ?auto_177540 ?auto_177541 ) ) ( not ( = ?auto_177540 ?auto_177542 ) ) ( not ( = ?auto_177540 ?auto_177543 ) ) ( not ( = ?auto_177540 ?auto_177544 ) ) ( not ( = ?auto_177541 ?auto_177542 ) ) ( not ( = ?auto_177541 ?auto_177543 ) ) ( not ( = ?auto_177541 ?auto_177544 ) ) ( not ( = ?auto_177542 ?auto_177543 ) ) ( not ( = ?auto_177542 ?auto_177544 ) ) ( not ( = ?auto_177543 ?auto_177544 ) ) ( ON ?auto_177542 ?auto_177543 ) ( ON ?auto_177541 ?auto_177542 ) ( ON ?auto_177540 ?auto_177541 ) ( ON ?auto_177539 ?auto_177540 ) ( ON ?auto_177538 ?auto_177539 ) ( ON ?auto_177537 ?auto_177538 ) ( CLEAR ?auto_177535 ) ( ON ?auto_177536 ?auto_177537 ) ( CLEAR ?auto_177536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177532 ?auto_177533 ?auto_177534 ?auto_177535 ?auto_177536 )
      ( MAKE-12PILE ?auto_177532 ?auto_177533 ?auto_177534 ?auto_177535 ?auto_177536 ?auto_177537 ?auto_177538 ?auto_177539 ?auto_177540 ?auto_177541 ?auto_177542 ?auto_177543 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177557 - BLOCK
      ?auto_177558 - BLOCK
      ?auto_177559 - BLOCK
      ?auto_177560 - BLOCK
      ?auto_177561 - BLOCK
      ?auto_177562 - BLOCK
      ?auto_177563 - BLOCK
      ?auto_177564 - BLOCK
      ?auto_177565 - BLOCK
      ?auto_177566 - BLOCK
      ?auto_177567 - BLOCK
      ?auto_177568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177568 ) ( ON-TABLE ?auto_177557 ) ( ON ?auto_177558 ?auto_177557 ) ( ON ?auto_177559 ?auto_177558 ) ( ON ?auto_177560 ?auto_177559 ) ( not ( = ?auto_177557 ?auto_177558 ) ) ( not ( = ?auto_177557 ?auto_177559 ) ) ( not ( = ?auto_177557 ?auto_177560 ) ) ( not ( = ?auto_177557 ?auto_177561 ) ) ( not ( = ?auto_177557 ?auto_177562 ) ) ( not ( = ?auto_177557 ?auto_177563 ) ) ( not ( = ?auto_177557 ?auto_177564 ) ) ( not ( = ?auto_177557 ?auto_177565 ) ) ( not ( = ?auto_177557 ?auto_177566 ) ) ( not ( = ?auto_177557 ?auto_177567 ) ) ( not ( = ?auto_177557 ?auto_177568 ) ) ( not ( = ?auto_177558 ?auto_177559 ) ) ( not ( = ?auto_177558 ?auto_177560 ) ) ( not ( = ?auto_177558 ?auto_177561 ) ) ( not ( = ?auto_177558 ?auto_177562 ) ) ( not ( = ?auto_177558 ?auto_177563 ) ) ( not ( = ?auto_177558 ?auto_177564 ) ) ( not ( = ?auto_177558 ?auto_177565 ) ) ( not ( = ?auto_177558 ?auto_177566 ) ) ( not ( = ?auto_177558 ?auto_177567 ) ) ( not ( = ?auto_177558 ?auto_177568 ) ) ( not ( = ?auto_177559 ?auto_177560 ) ) ( not ( = ?auto_177559 ?auto_177561 ) ) ( not ( = ?auto_177559 ?auto_177562 ) ) ( not ( = ?auto_177559 ?auto_177563 ) ) ( not ( = ?auto_177559 ?auto_177564 ) ) ( not ( = ?auto_177559 ?auto_177565 ) ) ( not ( = ?auto_177559 ?auto_177566 ) ) ( not ( = ?auto_177559 ?auto_177567 ) ) ( not ( = ?auto_177559 ?auto_177568 ) ) ( not ( = ?auto_177560 ?auto_177561 ) ) ( not ( = ?auto_177560 ?auto_177562 ) ) ( not ( = ?auto_177560 ?auto_177563 ) ) ( not ( = ?auto_177560 ?auto_177564 ) ) ( not ( = ?auto_177560 ?auto_177565 ) ) ( not ( = ?auto_177560 ?auto_177566 ) ) ( not ( = ?auto_177560 ?auto_177567 ) ) ( not ( = ?auto_177560 ?auto_177568 ) ) ( not ( = ?auto_177561 ?auto_177562 ) ) ( not ( = ?auto_177561 ?auto_177563 ) ) ( not ( = ?auto_177561 ?auto_177564 ) ) ( not ( = ?auto_177561 ?auto_177565 ) ) ( not ( = ?auto_177561 ?auto_177566 ) ) ( not ( = ?auto_177561 ?auto_177567 ) ) ( not ( = ?auto_177561 ?auto_177568 ) ) ( not ( = ?auto_177562 ?auto_177563 ) ) ( not ( = ?auto_177562 ?auto_177564 ) ) ( not ( = ?auto_177562 ?auto_177565 ) ) ( not ( = ?auto_177562 ?auto_177566 ) ) ( not ( = ?auto_177562 ?auto_177567 ) ) ( not ( = ?auto_177562 ?auto_177568 ) ) ( not ( = ?auto_177563 ?auto_177564 ) ) ( not ( = ?auto_177563 ?auto_177565 ) ) ( not ( = ?auto_177563 ?auto_177566 ) ) ( not ( = ?auto_177563 ?auto_177567 ) ) ( not ( = ?auto_177563 ?auto_177568 ) ) ( not ( = ?auto_177564 ?auto_177565 ) ) ( not ( = ?auto_177564 ?auto_177566 ) ) ( not ( = ?auto_177564 ?auto_177567 ) ) ( not ( = ?auto_177564 ?auto_177568 ) ) ( not ( = ?auto_177565 ?auto_177566 ) ) ( not ( = ?auto_177565 ?auto_177567 ) ) ( not ( = ?auto_177565 ?auto_177568 ) ) ( not ( = ?auto_177566 ?auto_177567 ) ) ( not ( = ?auto_177566 ?auto_177568 ) ) ( not ( = ?auto_177567 ?auto_177568 ) ) ( ON ?auto_177567 ?auto_177568 ) ( ON ?auto_177566 ?auto_177567 ) ( ON ?auto_177565 ?auto_177566 ) ( ON ?auto_177564 ?auto_177565 ) ( ON ?auto_177563 ?auto_177564 ) ( ON ?auto_177562 ?auto_177563 ) ( CLEAR ?auto_177560 ) ( ON ?auto_177561 ?auto_177562 ) ( CLEAR ?auto_177561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_177557 ?auto_177558 ?auto_177559 ?auto_177560 ?auto_177561 )
      ( MAKE-12PILE ?auto_177557 ?auto_177558 ?auto_177559 ?auto_177560 ?auto_177561 ?auto_177562 ?auto_177563 ?auto_177564 ?auto_177565 ?auto_177566 ?auto_177567 ?auto_177568 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177581 - BLOCK
      ?auto_177582 - BLOCK
      ?auto_177583 - BLOCK
      ?auto_177584 - BLOCK
      ?auto_177585 - BLOCK
      ?auto_177586 - BLOCK
      ?auto_177587 - BLOCK
      ?auto_177588 - BLOCK
      ?auto_177589 - BLOCK
      ?auto_177590 - BLOCK
      ?auto_177591 - BLOCK
      ?auto_177592 - BLOCK
    )
    :vars
    (
      ?auto_177593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177592 ?auto_177593 ) ( ON-TABLE ?auto_177581 ) ( ON ?auto_177582 ?auto_177581 ) ( ON ?auto_177583 ?auto_177582 ) ( not ( = ?auto_177581 ?auto_177582 ) ) ( not ( = ?auto_177581 ?auto_177583 ) ) ( not ( = ?auto_177581 ?auto_177584 ) ) ( not ( = ?auto_177581 ?auto_177585 ) ) ( not ( = ?auto_177581 ?auto_177586 ) ) ( not ( = ?auto_177581 ?auto_177587 ) ) ( not ( = ?auto_177581 ?auto_177588 ) ) ( not ( = ?auto_177581 ?auto_177589 ) ) ( not ( = ?auto_177581 ?auto_177590 ) ) ( not ( = ?auto_177581 ?auto_177591 ) ) ( not ( = ?auto_177581 ?auto_177592 ) ) ( not ( = ?auto_177581 ?auto_177593 ) ) ( not ( = ?auto_177582 ?auto_177583 ) ) ( not ( = ?auto_177582 ?auto_177584 ) ) ( not ( = ?auto_177582 ?auto_177585 ) ) ( not ( = ?auto_177582 ?auto_177586 ) ) ( not ( = ?auto_177582 ?auto_177587 ) ) ( not ( = ?auto_177582 ?auto_177588 ) ) ( not ( = ?auto_177582 ?auto_177589 ) ) ( not ( = ?auto_177582 ?auto_177590 ) ) ( not ( = ?auto_177582 ?auto_177591 ) ) ( not ( = ?auto_177582 ?auto_177592 ) ) ( not ( = ?auto_177582 ?auto_177593 ) ) ( not ( = ?auto_177583 ?auto_177584 ) ) ( not ( = ?auto_177583 ?auto_177585 ) ) ( not ( = ?auto_177583 ?auto_177586 ) ) ( not ( = ?auto_177583 ?auto_177587 ) ) ( not ( = ?auto_177583 ?auto_177588 ) ) ( not ( = ?auto_177583 ?auto_177589 ) ) ( not ( = ?auto_177583 ?auto_177590 ) ) ( not ( = ?auto_177583 ?auto_177591 ) ) ( not ( = ?auto_177583 ?auto_177592 ) ) ( not ( = ?auto_177583 ?auto_177593 ) ) ( not ( = ?auto_177584 ?auto_177585 ) ) ( not ( = ?auto_177584 ?auto_177586 ) ) ( not ( = ?auto_177584 ?auto_177587 ) ) ( not ( = ?auto_177584 ?auto_177588 ) ) ( not ( = ?auto_177584 ?auto_177589 ) ) ( not ( = ?auto_177584 ?auto_177590 ) ) ( not ( = ?auto_177584 ?auto_177591 ) ) ( not ( = ?auto_177584 ?auto_177592 ) ) ( not ( = ?auto_177584 ?auto_177593 ) ) ( not ( = ?auto_177585 ?auto_177586 ) ) ( not ( = ?auto_177585 ?auto_177587 ) ) ( not ( = ?auto_177585 ?auto_177588 ) ) ( not ( = ?auto_177585 ?auto_177589 ) ) ( not ( = ?auto_177585 ?auto_177590 ) ) ( not ( = ?auto_177585 ?auto_177591 ) ) ( not ( = ?auto_177585 ?auto_177592 ) ) ( not ( = ?auto_177585 ?auto_177593 ) ) ( not ( = ?auto_177586 ?auto_177587 ) ) ( not ( = ?auto_177586 ?auto_177588 ) ) ( not ( = ?auto_177586 ?auto_177589 ) ) ( not ( = ?auto_177586 ?auto_177590 ) ) ( not ( = ?auto_177586 ?auto_177591 ) ) ( not ( = ?auto_177586 ?auto_177592 ) ) ( not ( = ?auto_177586 ?auto_177593 ) ) ( not ( = ?auto_177587 ?auto_177588 ) ) ( not ( = ?auto_177587 ?auto_177589 ) ) ( not ( = ?auto_177587 ?auto_177590 ) ) ( not ( = ?auto_177587 ?auto_177591 ) ) ( not ( = ?auto_177587 ?auto_177592 ) ) ( not ( = ?auto_177587 ?auto_177593 ) ) ( not ( = ?auto_177588 ?auto_177589 ) ) ( not ( = ?auto_177588 ?auto_177590 ) ) ( not ( = ?auto_177588 ?auto_177591 ) ) ( not ( = ?auto_177588 ?auto_177592 ) ) ( not ( = ?auto_177588 ?auto_177593 ) ) ( not ( = ?auto_177589 ?auto_177590 ) ) ( not ( = ?auto_177589 ?auto_177591 ) ) ( not ( = ?auto_177589 ?auto_177592 ) ) ( not ( = ?auto_177589 ?auto_177593 ) ) ( not ( = ?auto_177590 ?auto_177591 ) ) ( not ( = ?auto_177590 ?auto_177592 ) ) ( not ( = ?auto_177590 ?auto_177593 ) ) ( not ( = ?auto_177591 ?auto_177592 ) ) ( not ( = ?auto_177591 ?auto_177593 ) ) ( not ( = ?auto_177592 ?auto_177593 ) ) ( ON ?auto_177591 ?auto_177592 ) ( ON ?auto_177590 ?auto_177591 ) ( ON ?auto_177589 ?auto_177590 ) ( ON ?auto_177588 ?auto_177589 ) ( ON ?auto_177587 ?auto_177588 ) ( ON ?auto_177586 ?auto_177587 ) ( ON ?auto_177585 ?auto_177586 ) ( CLEAR ?auto_177583 ) ( ON ?auto_177584 ?auto_177585 ) ( CLEAR ?auto_177584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177581 ?auto_177582 ?auto_177583 ?auto_177584 )
      ( MAKE-12PILE ?auto_177581 ?auto_177582 ?auto_177583 ?auto_177584 ?auto_177585 ?auto_177586 ?auto_177587 ?auto_177588 ?auto_177589 ?auto_177590 ?auto_177591 ?auto_177592 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177606 - BLOCK
      ?auto_177607 - BLOCK
      ?auto_177608 - BLOCK
      ?auto_177609 - BLOCK
      ?auto_177610 - BLOCK
      ?auto_177611 - BLOCK
      ?auto_177612 - BLOCK
      ?auto_177613 - BLOCK
      ?auto_177614 - BLOCK
      ?auto_177615 - BLOCK
      ?auto_177616 - BLOCK
      ?auto_177617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177617 ) ( ON-TABLE ?auto_177606 ) ( ON ?auto_177607 ?auto_177606 ) ( ON ?auto_177608 ?auto_177607 ) ( not ( = ?auto_177606 ?auto_177607 ) ) ( not ( = ?auto_177606 ?auto_177608 ) ) ( not ( = ?auto_177606 ?auto_177609 ) ) ( not ( = ?auto_177606 ?auto_177610 ) ) ( not ( = ?auto_177606 ?auto_177611 ) ) ( not ( = ?auto_177606 ?auto_177612 ) ) ( not ( = ?auto_177606 ?auto_177613 ) ) ( not ( = ?auto_177606 ?auto_177614 ) ) ( not ( = ?auto_177606 ?auto_177615 ) ) ( not ( = ?auto_177606 ?auto_177616 ) ) ( not ( = ?auto_177606 ?auto_177617 ) ) ( not ( = ?auto_177607 ?auto_177608 ) ) ( not ( = ?auto_177607 ?auto_177609 ) ) ( not ( = ?auto_177607 ?auto_177610 ) ) ( not ( = ?auto_177607 ?auto_177611 ) ) ( not ( = ?auto_177607 ?auto_177612 ) ) ( not ( = ?auto_177607 ?auto_177613 ) ) ( not ( = ?auto_177607 ?auto_177614 ) ) ( not ( = ?auto_177607 ?auto_177615 ) ) ( not ( = ?auto_177607 ?auto_177616 ) ) ( not ( = ?auto_177607 ?auto_177617 ) ) ( not ( = ?auto_177608 ?auto_177609 ) ) ( not ( = ?auto_177608 ?auto_177610 ) ) ( not ( = ?auto_177608 ?auto_177611 ) ) ( not ( = ?auto_177608 ?auto_177612 ) ) ( not ( = ?auto_177608 ?auto_177613 ) ) ( not ( = ?auto_177608 ?auto_177614 ) ) ( not ( = ?auto_177608 ?auto_177615 ) ) ( not ( = ?auto_177608 ?auto_177616 ) ) ( not ( = ?auto_177608 ?auto_177617 ) ) ( not ( = ?auto_177609 ?auto_177610 ) ) ( not ( = ?auto_177609 ?auto_177611 ) ) ( not ( = ?auto_177609 ?auto_177612 ) ) ( not ( = ?auto_177609 ?auto_177613 ) ) ( not ( = ?auto_177609 ?auto_177614 ) ) ( not ( = ?auto_177609 ?auto_177615 ) ) ( not ( = ?auto_177609 ?auto_177616 ) ) ( not ( = ?auto_177609 ?auto_177617 ) ) ( not ( = ?auto_177610 ?auto_177611 ) ) ( not ( = ?auto_177610 ?auto_177612 ) ) ( not ( = ?auto_177610 ?auto_177613 ) ) ( not ( = ?auto_177610 ?auto_177614 ) ) ( not ( = ?auto_177610 ?auto_177615 ) ) ( not ( = ?auto_177610 ?auto_177616 ) ) ( not ( = ?auto_177610 ?auto_177617 ) ) ( not ( = ?auto_177611 ?auto_177612 ) ) ( not ( = ?auto_177611 ?auto_177613 ) ) ( not ( = ?auto_177611 ?auto_177614 ) ) ( not ( = ?auto_177611 ?auto_177615 ) ) ( not ( = ?auto_177611 ?auto_177616 ) ) ( not ( = ?auto_177611 ?auto_177617 ) ) ( not ( = ?auto_177612 ?auto_177613 ) ) ( not ( = ?auto_177612 ?auto_177614 ) ) ( not ( = ?auto_177612 ?auto_177615 ) ) ( not ( = ?auto_177612 ?auto_177616 ) ) ( not ( = ?auto_177612 ?auto_177617 ) ) ( not ( = ?auto_177613 ?auto_177614 ) ) ( not ( = ?auto_177613 ?auto_177615 ) ) ( not ( = ?auto_177613 ?auto_177616 ) ) ( not ( = ?auto_177613 ?auto_177617 ) ) ( not ( = ?auto_177614 ?auto_177615 ) ) ( not ( = ?auto_177614 ?auto_177616 ) ) ( not ( = ?auto_177614 ?auto_177617 ) ) ( not ( = ?auto_177615 ?auto_177616 ) ) ( not ( = ?auto_177615 ?auto_177617 ) ) ( not ( = ?auto_177616 ?auto_177617 ) ) ( ON ?auto_177616 ?auto_177617 ) ( ON ?auto_177615 ?auto_177616 ) ( ON ?auto_177614 ?auto_177615 ) ( ON ?auto_177613 ?auto_177614 ) ( ON ?auto_177612 ?auto_177613 ) ( ON ?auto_177611 ?auto_177612 ) ( ON ?auto_177610 ?auto_177611 ) ( CLEAR ?auto_177608 ) ( ON ?auto_177609 ?auto_177610 ) ( CLEAR ?auto_177609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_177606 ?auto_177607 ?auto_177608 ?auto_177609 )
      ( MAKE-12PILE ?auto_177606 ?auto_177607 ?auto_177608 ?auto_177609 ?auto_177610 ?auto_177611 ?auto_177612 ?auto_177613 ?auto_177614 ?auto_177615 ?auto_177616 ?auto_177617 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177630 - BLOCK
      ?auto_177631 - BLOCK
      ?auto_177632 - BLOCK
      ?auto_177633 - BLOCK
      ?auto_177634 - BLOCK
      ?auto_177635 - BLOCK
      ?auto_177636 - BLOCK
      ?auto_177637 - BLOCK
      ?auto_177638 - BLOCK
      ?auto_177639 - BLOCK
      ?auto_177640 - BLOCK
      ?auto_177641 - BLOCK
    )
    :vars
    (
      ?auto_177642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177641 ?auto_177642 ) ( ON-TABLE ?auto_177630 ) ( ON ?auto_177631 ?auto_177630 ) ( not ( = ?auto_177630 ?auto_177631 ) ) ( not ( = ?auto_177630 ?auto_177632 ) ) ( not ( = ?auto_177630 ?auto_177633 ) ) ( not ( = ?auto_177630 ?auto_177634 ) ) ( not ( = ?auto_177630 ?auto_177635 ) ) ( not ( = ?auto_177630 ?auto_177636 ) ) ( not ( = ?auto_177630 ?auto_177637 ) ) ( not ( = ?auto_177630 ?auto_177638 ) ) ( not ( = ?auto_177630 ?auto_177639 ) ) ( not ( = ?auto_177630 ?auto_177640 ) ) ( not ( = ?auto_177630 ?auto_177641 ) ) ( not ( = ?auto_177630 ?auto_177642 ) ) ( not ( = ?auto_177631 ?auto_177632 ) ) ( not ( = ?auto_177631 ?auto_177633 ) ) ( not ( = ?auto_177631 ?auto_177634 ) ) ( not ( = ?auto_177631 ?auto_177635 ) ) ( not ( = ?auto_177631 ?auto_177636 ) ) ( not ( = ?auto_177631 ?auto_177637 ) ) ( not ( = ?auto_177631 ?auto_177638 ) ) ( not ( = ?auto_177631 ?auto_177639 ) ) ( not ( = ?auto_177631 ?auto_177640 ) ) ( not ( = ?auto_177631 ?auto_177641 ) ) ( not ( = ?auto_177631 ?auto_177642 ) ) ( not ( = ?auto_177632 ?auto_177633 ) ) ( not ( = ?auto_177632 ?auto_177634 ) ) ( not ( = ?auto_177632 ?auto_177635 ) ) ( not ( = ?auto_177632 ?auto_177636 ) ) ( not ( = ?auto_177632 ?auto_177637 ) ) ( not ( = ?auto_177632 ?auto_177638 ) ) ( not ( = ?auto_177632 ?auto_177639 ) ) ( not ( = ?auto_177632 ?auto_177640 ) ) ( not ( = ?auto_177632 ?auto_177641 ) ) ( not ( = ?auto_177632 ?auto_177642 ) ) ( not ( = ?auto_177633 ?auto_177634 ) ) ( not ( = ?auto_177633 ?auto_177635 ) ) ( not ( = ?auto_177633 ?auto_177636 ) ) ( not ( = ?auto_177633 ?auto_177637 ) ) ( not ( = ?auto_177633 ?auto_177638 ) ) ( not ( = ?auto_177633 ?auto_177639 ) ) ( not ( = ?auto_177633 ?auto_177640 ) ) ( not ( = ?auto_177633 ?auto_177641 ) ) ( not ( = ?auto_177633 ?auto_177642 ) ) ( not ( = ?auto_177634 ?auto_177635 ) ) ( not ( = ?auto_177634 ?auto_177636 ) ) ( not ( = ?auto_177634 ?auto_177637 ) ) ( not ( = ?auto_177634 ?auto_177638 ) ) ( not ( = ?auto_177634 ?auto_177639 ) ) ( not ( = ?auto_177634 ?auto_177640 ) ) ( not ( = ?auto_177634 ?auto_177641 ) ) ( not ( = ?auto_177634 ?auto_177642 ) ) ( not ( = ?auto_177635 ?auto_177636 ) ) ( not ( = ?auto_177635 ?auto_177637 ) ) ( not ( = ?auto_177635 ?auto_177638 ) ) ( not ( = ?auto_177635 ?auto_177639 ) ) ( not ( = ?auto_177635 ?auto_177640 ) ) ( not ( = ?auto_177635 ?auto_177641 ) ) ( not ( = ?auto_177635 ?auto_177642 ) ) ( not ( = ?auto_177636 ?auto_177637 ) ) ( not ( = ?auto_177636 ?auto_177638 ) ) ( not ( = ?auto_177636 ?auto_177639 ) ) ( not ( = ?auto_177636 ?auto_177640 ) ) ( not ( = ?auto_177636 ?auto_177641 ) ) ( not ( = ?auto_177636 ?auto_177642 ) ) ( not ( = ?auto_177637 ?auto_177638 ) ) ( not ( = ?auto_177637 ?auto_177639 ) ) ( not ( = ?auto_177637 ?auto_177640 ) ) ( not ( = ?auto_177637 ?auto_177641 ) ) ( not ( = ?auto_177637 ?auto_177642 ) ) ( not ( = ?auto_177638 ?auto_177639 ) ) ( not ( = ?auto_177638 ?auto_177640 ) ) ( not ( = ?auto_177638 ?auto_177641 ) ) ( not ( = ?auto_177638 ?auto_177642 ) ) ( not ( = ?auto_177639 ?auto_177640 ) ) ( not ( = ?auto_177639 ?auto_177641 ) ) ( not ( = ?auto_177639 ?auto_177642 ) ) ( not ( = ?auto_177640 ?auto_177641 ) ) ( not ( = ?auto_177640 ?auto_177642 ) ) ( not ( = ?auto_177641 ?auto_177642 ) ) ( ON ?auto_177640 ?auto_177641 ) ( ON ?auto_177639 ?auto_177640 ) ( ON ?auto_177638 ?auto_177639 ) ( ON ?auto_177637 ?auto_177638 ) ( ON ?auto_177636 ?auto_177637 ) ( ON ?auto_177635 ?auto_177636 ) ( ON ?auto_177634 ?auto_177635 ) ( ON ?auto_177633 ?auto_177634 ) ( CLEAR ?auto_177631 ) ( ON ?auto_177632 ?auto_177633 ) ( CLEAR ?auto_177632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177630 ?auto_177631 ?auto_177632 )
      ( MAKE-12PILE ?auto_177630 ?auto_177631 ?auto_177632 ?auto_177633 ?auto_177634 ?auto_177635 ?auto_177636 ?auto_177637 ?auto_177638 ?auto_177639 ?auto_177640 ?auto_177641 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177655 - BLOCK
      ?auto_177656 - BLOCK
      ?auto_177657 - BLOCK
      ?auto_177658 - BLOCK
      ?auto_177659 - BLOCK
      ?auto_177660 - BLOCK
      ?auto_177661 - BLOCK
      ?auto_177662 - BLOCK
      ?auto_177663 - BLOCK
      ?auto_177664 - BLOCK
      ?auto_177665 - BLOCK
      ?auto_177666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177666 ) ( ON-TABLE ?auto_177655 ) ( ON ?auto_177656 ?auto_177655 ) ( not ( = ?auto_177655 ?auto_177656 ) ) ( not ( = ?auto_177655 ?auto_177657 ) ) ( not ( = ?auto_177655 ?auto_177658 ) ) ( not ( = ?auto_177655 ?auto_177659 ) ) ( not ( = ?auto_177655 ?auto_177660 ) ) ( not ( = ?auto_177655 ?auto_177661 ) ) ( not ( = ?auto_177655 ?auto_177662 ) ) ( not ( = ?auto_177655 ?auto_177663 ) ) ( not ( = ?auto_177655 ?auto_177664 ) ) ( not ( = ?auto_177655 ?auto_177665 ) ) ( not ( = ?auto_177655 ?auto_177666 ) ) ( not ( = ?auto_177656 ?auto_177657 ) ) ( not ( = ?auto_177656 ?auto_177658 ) ) ( not ( = ?auto_177656 ?auto_177659 ) ) ( not ( = ?auto_177656 ?auto_177660 ) ) ( not ( = ?auto_177656 ?auto_177661 ) ) ( not ( = ?auto_177656 ?auto_177662 ) ) ( not ( = ?auto_177656 ?auto_177663 ) ) ( not ( = ?auto_177656 ?auto_177664 ) ) ( not ( = ?auto_177656 ?auto_177665 ) ) ( not ( = ?auto_177656 ?auto_177666 ) ) ( not ( = ?auto_177657 ?auto_177658 ) ) ( not ( = ?auto_177657 ?auto_177659 ) ) ( not ( = ?auto_177657 ?auto_177660 ) ) ( not ( = ?auto_177657 ?auto_177661 ) ) ( not ( = ?auto_177657 ?auto_177662 ) ) ( not ( = ?auto_177657 ?auto_177663 ) ) ( not ( = ?auto_177657 ?auto_177664 ) ) ( not ( = ?auto_177657 ?auto_177665 ) ) ( not ( = ?auto_177657 ?auto_177666 ) ) ( not ( = ?auto_177658 ?auto_177659 ) ) ( not ( = ?auto_177658 ?auto_177660 ) ) ( not ( = ?auto_177658 ?auto_177661 ) ) ( not ( = ?auto_177658 ?auto_177662 ) ) ( not ( = ?auto_177658 ?auto_177663 ) ) ( not ( = ?auto_177658 ?auto_177664 ) ) ( not ( = ?auto_177658 ?auto_177665 ) ) ( not ( = ?auto_177658 ?auto_177666 ) ) ( not ( = ?auto_177659 ?auto_177660 ) ) ( not ( = ?auto_177659 ?auto_177661 ) ) ( not ( = ?auto_177659 ?auto_177662 ) ) ( not ( = ?auto_177659 ?auto_177663 ) ) ( not ( = ?auto_177659 ?auto_177664 ) ) ( not ( = ?auto_177659 ?auto_177665 ) ) ( not ( = ?auto_177659 ?auto_177666 ) ) ( not ( = ?auto_177660 ?auto_177661 ) ) ( not ( = ?auto_177660 ?auto_177662 ) ) ( not ( = ?auto_177660 ?auto_177663 ) ) ( not ( = ?auto_177660 ?auto_177664 ) ) ( not ( = ?auto_177660 ?auto_177665 ) ) ( not ( = ?auto_177660 ?auto_177666 ) ) ( not ( = ?auto_177661 ?auto_177662 ) ) ( not ( = ?auto_177661 ?auto_177663 ) ) ( not ( = ?auto_177661 ?auto_177664 ) ) ( not ( = ?auto_177661 ?auto_177665 ) ) ( not ( = ?auto_177661 ?auto_177666 ) ) ( not ( = ?auto_177662 ?auto_177663 ) ) ( not ( = ?auto_177662 ?auto_177664 ) ) ( not ( = ?auto_177662 ?auto_177665 ) ) ( not ( = ?auto_177662 ?auto_177666 ) ) ( not ( = ?auto_177663 ?auto_177664 ) ) ( not ( = ?auto_177663 ?auto_177665 ) ) ( not ( = ?auto_177663 ?auto_177666 ) ) ( not ( = ?auto_177664 ?auto_177665 ) ) ( not ( = ?auto_177664 ?auto_177666 ) ) ( not ( = ?auto_177665 ?auto_177666 ) ) ( ON ?auto_177665 ?auto_177666 ) ( ON ?auto_177664 ?auto_177665 ) ( ON ?auto_177663 ?auto_177664 ) ( ON ?auto_177662 ?auto_177663 ) ( ON ?auto_177661 ?auto_177662 ) ( ON ?auto_177660 ?auto_177661 ) ( ON ?auto_177659 ?auto_177660 ) ( ON ?auto_177658 ?auto_177659 ) ( CLEAR ?auto_177656 ) ( ON ?auto_177657 ?auto_177658 ) ( CLEAR ?auto_177657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_177655 ?auto_177656 ?auto_177657 )
      ( MAKE-12PILE ?auto_177655 ?auto_177656 ?auto_177657 ?auto_177658 ?auto_177659 ?auto_177660 ?auto_177661 ?auto_177662 ?auto_177663 ?auto_177664 ?auto_177665 ?auto_177666 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177679 - BLOCK
      ?auto_177680 - BLOCK
      ?auto_177681 - BLOCK
      ?auto_177682 - BLOCK
      ?auto_177683 - BLOCK
      ?auto_177684 - BLOCK
      ?auto_177685 - BLOCK
      ?auto_177686 - BLOCK
      ?auto_177687 - BLOCK
      ?auto_177688 - BLOCK
      ?auto_177689 - BLOCK
      ?auto_177690 - BLOCK
    )
    :vars
    (
      ?auto_177691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177690 ?auto_177691 ) ( ON-TABLE ?auto_177679 ) ( not ( = ?auto_177679 ?auto_177680 ) ) ( not ( = ?auto_177679 ?auto_177681 ) ) ( not ( = ?auto_177679 ?auto_177682 ) ) ( not ( = ?auto_177679 ?auto_177683 ) ) ( not ( = ?auto_177679 ?auto_177684 ) ) ( not ( = ?auto_177679 ?auto_177685 ) ) ( not ( = ?auto_177679 ?auto_177686 ) ) ( not ( = ?auto_177679 ?auto_177687 ) ) ( not ( = ?auto_177679 ?auto_177688 ) ) ( not ( = ?auto_177679 ?auto_177689 ) ) ( not ( = ?auto_177679 ?auto_177690 ) ) ( not ( = ?auto_177679 ?auto_177691 ) ) ( not ( = ?auto_177680 ?auto_177681 ) ) ( not ( = ?auto_177680 ?auto_177682 ) ) ( not ( = ?auto_177680 ?auto_177683 ) ) ( not ( = ?auto_177680 ?auto_177684 ) ) ( not ( = ?auto_177680 ?auto_177685 ) ) ( not ( = ?auto_177680 ?auto_177686 ) ) ( not ( = ?auto_177680 ?auto_177687 ) ) ( not ( = ?auto_177680 ?auto_177688 ) ) ( not ( = ?auto_177680 ?auto_177689 ) ) ( not ( = ?auto_177680 ?auto_177690 ) ) ( not ( = ?auto_177680 ?auto_177691 ) ) ( not ( = ?auto_177681 ?auto_177682 ) ) ( not ( = ?auto_177681 ?auto_177683 ) ) ( not ( = ?auto_177681 ?auto_177684 ) ) ( not ( = ?auto_177681 ?auto_177685 ) ) ( not ( = ?auto_177681 ?auto_177686 ) ) ( not ( = ?auto_177681 ?auto_177687 ) ) ( not ( = ?auto_177681 ?auto_177688 ) ) ( not ( = ?auto_177681 ?auto_177689 ) ) ( not ( = ?auto_177681 ?auto_177690 ) ) ( not ( = ?auto_177681 ?auto_177691 ) ) ( not ( = ?auto_177682 ?auto_177683 ) ) ( not ( = ?auto_177682 ?auto_177684 ) ) ( not ( = ?auto_177682 ?auto_177685 ) ) ( not ( = ?auto_177682 ?auto_177686 ) ) ( not ( = ?auto_177682 ?auto_177687 ) ) ( not ( = ?auto_177682 ?auto_177688 ) ) ( not ( = ?auto_177682 ?auto_177689 ) ) ( not ( = ?auto_177682 ?auto_177690 ) ) ( not ( = ?auto_177682 ?auto_177691 ) ) ( not ( = ?auto_177683 ?auto_177684 ) ) ( not ( = ?auto_177683 ?auto_177685 ) ) ( not ( = ?auto_177683 ?auto_177686 ) ) ( not ( = ?auto_177683 ?auto_177687 ) ) ( not ( = ?auto_177683 ?auto_177688 ) ) ( not ( = ?auto_177683 ?auto_177689 ) ) ( not ( = ?auto_177683 ?auto_177690 ) ) ( not ( = ?auto_177683 ?auto_177691 ) ) ( not ( = ?auto_177684 ?auto_177685 ) ) ( not ( = ?auto_177684 ?auto_177686 ) ) ( not ( = ?auto_177684 ?auto_177687 ) ) ( not ( = ?auto_177684 ?auto_177688 ) ) ( not ( = ?auto_177684 ?auto_177689 ) ) ( not ( = ?auto_177684 ?auto_177690 ) ) ( not ( = ?auto_177684 ?auto_177691 ) ) ( not ( = ?auto_177685 ?auto_177686 ) ) ( not ( = ?auto_177685 ?auto_177687 ) ) ( not ( = ?auto_177685 ?auto_177688 ) ) ( not ( = ?auto_177685 ?auto_177689 ) ) ( not ( = ?auto_177685 ?auto_177690 ) ) ( not ( = ?auto_177685 ?auto_177691 ) ) ( not ( = ?auto_177686 ?auto_177687 ) ) ( not ( = ?auto_177686 ?auto_177688 ) ) ( not ( = ?auto_177686 ?auto_177689 ) ) ( not ( = ?auto_177686 ?auto_177690 ) ) ( not ( = ?auto_177686 ?auto_177691 ) ) ( not ( = ?auto_177687 ?auto_177688 ) ) ( not ( = ?auto_177687 ?auto_177689 ) ) ( not ( = ?auto_177687 ?auto_177690 ) ) ( not ( = ?auto_177687 ?auto_177691 ) ) ( not ( = ?auto_177688 ?auto_177689 ) ) ( not ( = ?auto_177688 ?auto_177690 ) ) ( not ( = ?auto_177688 ?auto_177691 ) ) ( not ( = ?auto_177689 ?auto_177690 ) ) ( not ( = ?auto_177689 ?auto_177691 ) ) ( not ( = ?auto_177690 ?auto_177691 ) ) ( ON ?auto_177689 ?auto_177690 ) ( ON ?auto_177688 ?auto_177689 ) ( ON ?auto_177687 ?auto_177688 ) ( ON ?auto_177686 ?auto_177687 ) ( ON ?auto_177685 ?auto_177686 ) ( ON ?auto_177684 ?auto_177685 ) ( ON ?auto_177683 ?auto_177684 ) ( ON ?auto_177682 ?auto_177683 ) ( ON ?auto_177681 ?auto_177682 ) ( CLEAR ?auto_177679 ) ( ON ?auto_177680 ?auto_177681 ) ( CLEAR ?auto_177680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177679 ?auto_177680 )
      ( MAKE-12PILE ?auto_177679 ?auto_177680 ?auto_177681 ?auto_177682 ?auto_177683 ?auto_177684 ?auto_177685 ?auto_177686 ?auto_177687 ?auto_177688 ?auto_177689 ?auto_177690 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177704 - BLOCK
      ?auto_177705 - BLOCK
      ?auto_177706 - BLOCK
      ?auto_177707 - BLOCK
      ?auto_177708 - BLOCK
      ?auto_177709 - BLOCK
      ?auto_177710 - BLOCK
      ?auto_177711 - BLOCK
      ?auto_177712 - BLOCK
      ?auto_177713 - BLOCK
      ?auto_177714 - BLOCK
      ?auto_177715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177715 ) ( ON-TABLE ?auto_177704 ) ( not ( = ?auto_177704 ?auto_177705 ) ) ( not ( = ?auto_177704 ?auto_177706 ) ) ( not ( = ?auto_177704 ?auto_177707 ) ) ( not ( = ?auto_177704 ?auto_177708 ) ) ( not ( = ?auto_177704 ?auto_177709 ) ) ( not ( = ?auto_177704 ?auto_177710 ) ) ( not ( = ?auto_177704 ?auto_177711 ) ) ( not ( = ?auto_177704 ?auto_177712 ) ) ( not ( = ?auto_177704 ?auto_177713 ) ) ( not ( = ?auto_177704 ?auto_177714 ) ) ( not ( = ?auto_177704 ?auto_177715 ) ) ( not ( = ?auto_177705 ?auto_177706 ) ) ( not ( = ?auto_177705 ?auto_177707 ) ) ( not ( = ?auto_177705 ?auto_177708 ) ) ( not ( = ?auto_177705 ?auto_177709 ) ) ( not ( = ?auto_177705 ?auto_177710 ) ) ( not ( = ?auto_177705 ?auto_177711 ) ) ( not ( = ?auto_177705 ?auto_177712 ) ) ( not ( = ?auto_177705 ?auto_177713 ) ) ( not ( = ?auto_177705 ?auto_177714 ) ) ( not ( = ?auto_177705 ?auto_177715 ) ) ( not ( = ?auto_177706 ?auto_177707 ) ) ( not ( = ?auto_177706 ?auto_177708 ) ) ( not ( = ?auto_177706 ?auto_177709 ) ) ( not ( = ?auto_177706 ?auto_177710 ) ) ( not ( = ?auto_177706 ?auto_177711 ) ) ( not ( = ?auto_177706 ?auto_177712 ) ) ( not ( = ?auto_177706 ?auto_177713 ) ) ( not ( = ?auto_177706 ?auto_177714 ) ) ( not ( = ?auto_177706 ?auto_177715 ) ) ( not ( = ?auto_177707 ?auto_177708 ) ) ( not ( = ?auto_177707 ?auto_177709 ) ) ( not ( = ?auto_177707 ?auto_177710 ) ) ( not ( = ?auto_177707 ?auto_177711 ) ) ( not ( = ?auto_177707 ?auto_177712 ) ) ( not ( = ?auto_177707 ?auto_177713 ) ) ( not ( = ?auto_177707 ?auto_177714 ) ) ( not ( = ?auto_177707 ?auto_177715 ) ) ( not ( = ?auto_177708 ?auto_177709 ) ) ( not ( = ?auto_177708 ?auto_177710 ) ) ( not ( = ?auto_177708 ?auto_177711 ) ) ( not ( = ?auto_177708 ?auto_177712 ) ) ( not ( = ?auto_177708 ?auto_177713 ) ) ( not ( = ?auto_177708 ?auto_177714 ) ) ( not ( = ?auto_177708 ?auto_177715 ) ) ( not ( = ?auto_177709 ?auto_177710 ) ) ( not ( = ?auto_177709 ?auto_177711 ) ) ( not ( = ?auto_177709 ?auto_177712 ) ) ( not ( = ?auto_177709 ?auto_177713 ) ) ( not ( = ?auto_177709 ?auto_177714 ) ) ( not ( = ?auto_177709 ?auto_177715 ) ) ( not ( = ?auto_177710 ?auto_177711 ) ) ( not ( = ?auto_177710 ?auto_177712 ) ) ( not ( = ?auto_177710 ?auto_177713 ) ) ( not ( = ?auto_177710 ?auto_177714 ) ) ( not ( = ?auto_177710 ?auto_177715 ) ) ( not ( = ?auto_177711 ?auto_177712 ) ) ( not ( = ?auto_177711 ?auto_177713 ) ) ( not ( = ?auto_177711 ?auto_177714 ) ) ( not ( = ?auto_177711 ?auto_177715 ) ) ( not ( = ?auto_177712 ?auto_177713 ) ) ( not ( = ?auto_177712 ?auto_177714 ) ) ( not ( = ?auto_177712 ?auto_177715 ) ) ( not ( = ?auto_177713 ?auto_177714 ) ) ( not ( = ?auto_177713 ?auto_177715 ) ) ( not ( = ?auto_177714 ?auto_177715 ) ) ( ON ?auto_177714 ?auto_177715 ) ( ON ?auto_177713 ?auto_177714 ) ( ON ?auto_177712 ?auto_177713 ) ( ON ?auto_177711 ?auto_177712 ) ( ON ?auto_177710 ?auto_177711 ) ( ON ?auto_177709 ?auto_177710 ) ( ON ?auto_177708 ?auto_177709 ) ( ON ?auto_177707 ?auto_177708 ) ( ON ?auto_177706 ?auto_177707 ) ( CLEAR ?auto_177704 ) ( ON ?auto_177705 ?auto_177706 ) ( CLEAR ?auto_177705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177704 ?auto_177705 )
      ( MAKE-12PILE ?auto_177704 ?auto_177705 ?auto_177706 ?auto_177707 ?auto_177708 ?auto_177709 ?auto_177710 ?auto_177711 ?auto_177712 ?auto_177713 ?auto_177714 ?auto_177715 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177728 - BLOCK
      ?auto_177729 - BLOCK
      ?auto_177730 - BLOCK
      ?auto_177731 - BLOCK
      ?auto_177732 - BLOCK
      ?auto_177733 - BLOCK
      ?auto_177734 - BLOCK
      ?auto_177735 - BLOCK
      ?auto_177736 - BLOCK
      ?auto_177737 - BLOCK
      ?auto_177738 - BLOCK
      ?auto_177739 - BLOCK
    )
    :vars
    (
      ?auto_177740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_177739 ?auto_177740 ) ( not ( = ?auto_177728 ?auto_177729 ) ) ( not ( = ?auto_177728 ?auto_177730 ) ) ( not ( = ?auto_177728 ?auto_177731 ) ) ( not ( = ?auto_177728 ?auto_177732 ) ) ( not ( = ?auto_177728 ?auto_177733 ) ) ( not ( = ?auto_177728 ?auto_177734 ) ) ( not ( = ?auto_177728 ?auto_177735 ) ) ( not ( = ?auto_177728 ?auto_177736 ) ) ( not ( = ?auto_177728 ?auto_177737 ) ) ( not ( = ?auto_177728 ?auto_177738 ) ) ( not ( = ?auto_177728 ?auto_177739 ) ) ( not ( = ?auto_177728 ?auto_177740 ) ) ( not ( = ?auto_177729 ?auto_177730 ) ) ( not ( = ?auto_177729 ?auto_177731 ) ) ( not ( = ?auto_177729 ?auto_177732 ) ) ( not ( = ?auto_177729 ?auto_177733 ) ) ( not ( = ?auto_177729 ?auto_177734 ) ) ( not ( = ?auto_177729 ?auto_177735 ) ) ( not ( = ?auto_177729 ?auto_177736 ) ) ( not ( = ?auto_177729 ?auto_177737 ) ) ( not ( = ?auto_177729 ?auto_177738 ) ) ( not ( = ?auto_177729 ?auto_177739 ) ) ( not ( = ?auto_177729 ?auto_177740 ) ) ( not ( = ?auto_177730 ?auto_177731 ) ) ( not ( = ?auto_177730 ?auto_177732 ) ) ( not ( = ?auto_177730 ?auto_177733 ) ) ( not ( = ?auto_177730 ?auto_177734 ) ) ( not ( = ?auto_177730 ?auto_177735 ) ) ( not ( = ?auto_177730 ?auto_177736 ) ) ( not ( = ?auto_177730 ?auto_177737 ) ) ( not ( = ?auto_177730 ?auto_177738 ) ) ( not ( = ?auto_177730 ?auto_177739 ) ) ( not ( = ?auto_177730 ?auto_177740 ) ) ( not ( = ?auto_177731 ?auto_177732 ) ) ( not ( = ?auto_177731 ?auto_177733 ) ) ( not ( = ?auto_177731 ?auto_177734 ) ) ( not ( = ?auto_177731 ?auto_177735 ) ) ( not ( = ?auto_177731 ?auto_177736 ) ) ( not ( = ?auto_177731 ?auto_177737 ) ) ( not ( = ?auto_177731 ?auto_177738 ) ) ( not ( = ?auto_177731 ?auto_177739 ) ) ( not ( = ?auto_177731 ?auto_177740 ) ) ( not ( = ?auto_177732 ?auto_177733 ) ) ( not ( = ?auto_177732 ?auto_177734 ) ) ( not ( = ?auto_177732 ?auto_177735 ) ) ( not ( = ?auto_177732 ?auto_177736 ) ) ( not ( = ?auto_177732 ?auto_177737 ) ) ( not ( = ?auto_177732 ?auto_177738 ) ) ( not ( = ?auto_177732 ?auto_177739 ) ) ( not ( = ?auto_177732 ?auto_177740 ) ) ( not ( = ?auto_177733 ?auto_177734 ) ) ( not ( = ?auto_177733 ?auto_177735 ) ) ( not ( = ?auto_177733 ?auto_177736 ) ) ( not ( = ?auto_177733 ?auto_177737 ) ) ( not ( = ?auto_177733 ?auto_177738 ) ) ( not ( = ?auto_177733 ?auto_177739 ) ) ( not ( = ?auto_177733 ?auto_177740 ) ) ( not ( = ?auto_177734 ?auto_177735 ) ) ( not ( = ?auto_177734 ?auto_177736 ) ) ( not ( = ?auto_177734 ?auto_177737 ) ) ( not ( = ?auto_177734 ?auto_177738 ) ) ( not ( = ?auto_177734 ?auto_177739 ) ) ( not ( = ?auto_177734 ?auto_177740 ) ) ( not ( = ?auto_177735 ?auto_177736 ) ) ( not ( = ?auto_177735 ?auto_177737 ) ) ( not ( = ?auto_177735 ?auto_177738 ) ) ( not ( = ?auto_177735 ?auto_177739 ) ) ( not ( = ?auto_177735 ?auto_177740 ) ) ( not ( = ?auto_177736 ?auto_177737 ) ) ( not ( = ?auto_177736 ?auto_177738 ) ) ( not ( = ?auto_177736 ?auto_177739 ) ) ( not ( = ?auto_177736 ?auto_177740 ) ) ( not ( = ?auto_177737 ?auto_177738 ) ) ( not ( = ?auto_177737 ?auto_177739 ) ) ( not ( = ?auto_177737 ?auto_177740 ) ) ( not ( = ?auto_177738 ?auto_177739 ) ) ( not ( = ?auto_177738 ?auto_177740 ) ) ( not ( = ?auto_177739 ?auto_177740 ) ) ( ON ?auto_177738 ?auto_177739 ) ( ON ?auto_177737 ?auto_177738 ) ( ON ?auto_177736 ?auto_177737 ) ( ON ?auto_177735 ?auto_177736 ) ( ON ?auto_177734 ?auto_177735 ) ( ON ?auto_177733 ?auto_177734 ) ( ON ?auto_177732 ?auto_177733 ) ( ON ?auto_177731 ?auto_177732 ) ( ON ?auto_177730 ?auto_177731 ) ( ON ?auto_177729 ?auto_177730 ) ( ON ?auto_177728 ?auto_177729 ) ( CLEAR ?auto_177728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177728 )
      ( MAKE-12PILE ?auto_177728 ?auto_177729 ?auto_177730 ?auto_177731 ?auto_177732 ?auto_177733 ?auto_177734 ?auto_177735 ?auto_177736 ?auto_177737 ?auto_177738 ?auto_177739 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177753 - BLOCK
      ?auto_177754 - BLOCK
      ?auto_177755 - BLOCK
      ?auto_177756 - BLOCK
      ?auto_177757 - BLOCK
      ?auto_177758 - BLOCK
      ?auto_177759 - BLOCK
      ?auto_177760 - BLOCK
      ?auto_177761 - BLOCK
      ?auto_177762 - BLOCK
      ?auto_177763 - BLOCK
      ?auto_177764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_177764 ) ( not ( = ?auto_177753 ?auto_177754 ) ) ( not ( = ?auto_177753 ?auto_177755 ) ) ( not ( = ?auto_177753 ?auto_177756 ) ) ( not ( = ?auto_177753 ?auto_177757 ) ) ( not ( = ?auto_177753 ?auto_177758 ) ) ( not ( = ?auto_177753 ?auto_177759 ) ) ( not ( = ?auto_177753 ?auto_177760 ) ) ( not ( = ?auto_177753 ?auto_177761 ) ) ( not ( = ?auto_177753 ?auto_177762 ) ) ( not ( = ?auto_177753 ?auto_177763 ) ) ( not ( = ?auto_177753 ?auto_177764 ) ) ( not ( = ?auto_177754 ?auto_177755 ) ) ( not ( = ?auto_177754 ?auto_177756 ) ) ( not ( = ?auto_177754 ?auto_177757 ) ) ( not ( = ?auto_177754 ?auto_177758 ) ) ( not ( = ?auto_177754 ?auto_177759 ) ) ( not ( = ?auto_177754 ?auto_177760 ) ) ( not ( = ?auto_177754 ?auto_177761 ) ) ( not ( = ?auto_177754 ?auto_177762 ) ) ( not ( = ?auto_177754 ?auto_177763 ) ) ( not ( = ?auto_177754 ?auto_177764 ) ) ( not ( = ?auto_177755 ?auto_177756 ) ) ( not ( = ?auto_177755 ?auto_177757 ) ) ( not ( = ?auto_177755 ?auto_177758 ) ) ( not ( = ?auto_177755 ?auto_177759 ) ) ( not ( = ?auto_177755 ?auto_177760 ) ) ( not ( = ?auto_177755 ?auto_177761 ) ) ( not ( = ?auto_177755 ?auto_177762 ) ) ( not ( = ?auto_177755 ?auto_177763 ) ) ( not ( = ?auto_177755 ?auto_177764 ) ) ( not ( = ?auto_177756 ?auto_177757 ) ) ( not ( = ?auto_177756 ?auto_177758 ) ) ( not ( = ?auto_177756 ?auto_177759 ) ) ( not ( = ?auto_177756 ?auto_177760 ) ) ( not ( = ?auto_177756 ?auto_177761 ) ) ( not ( = ?auto_177756 ?auto_177762 ) ) ( not ( = ?auto_177756 ?auto_177763 ) ) ( not ( = ?auto_177756 ?auto_177764 ) ) ( not ( = ?auto_177757 ?auto_177758 ) ) ( not ( = ?auto_177757 ?auto_177759 ) ) ( not ( = ?auto_177757 ?auto_177760 ) ) ( not ( = ?auto_177757 ?auto_177761 ) ) ( not ( = ?auto_177757 ?auto_177762 ) ) ( not ( = ?auto_177757 ?auto_177763 ) ) ( not ( = ?auto_177757 ?auto_177764 ) ) ( not ( = ?auto_177758 ?auto_177759 ) ) ( not ( = ?auto_177758 ?auto_177760 ) ) ( not ( = ?auto_177758 ?auto_177761 ) ) ( not ( = ?auto_177758 ?auto_177762 ) ) ( not ( = ?auto_177758 ?auto_177763 ) ) ( not ( = ?auto_177758 ?auto_177764 ) ) ( not ( = ?auto_177759 ?auto_177760 ) ) ( not ( = ?auto_177759 ?auto_177761 ) ) ( not ( = ?auto_177759 ?auto_177762 ) ) ( not ( = ?auto_177759 ?auto_177763 ) ) ( not ( = ?auto_177759 ?auto_177764 ) ) ( not ( = ?auto_177760 ?auto_177761 ) ) ( not ( = ?auto_177760 ?auto_177762 ) ) ( not ( = ?auto_177760 ?auto_177763 ) ) ( not ( = ?auto_177760 ?auto_177764 ) ) ( not ( = ?auto_177761 ?auto_177762 ) ) ( not ( = ?auto_177761 ?auto_177763 ) ) ( not ( = ?auto_177761 ?auto_177764 ) ) ( not ( = ?auto_177762 ?auto_177763 ) ) ( not ( = ?auto_177762 ?auto_177764 ) ) ( not ( = ?auto_177763 ?auto_177764 ) ) ( ON ?auto_177763 ?auto_177764 ) ( ON ?auto_177762 ?auto_177763 ) ( ON ?auto_177761 ?auto_177762 ) ( ON ?auto_177760 ?auto_177761 ) ( ON ?auto_177759 ?auto_177760 ) ( ON ?auto_177758 ?auto_177759 ) ( ON ?auto_177757 ?auto_177758 ) ( ON ?auto_177756 ?auto_177757 ) ( ON ?auto_177755 ?auto_177756 ) ( ON ?auto_177754 ?auto_177755 ) ( ON ?auto_177753 ?auto_177754 ) ( CLEAR ?auto_177753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_177753 )
      ( MAKE-12PILE ?auto_177753 ?auto_177754 ?auto_177755 ?auto_177756 ?auto_177757 ?auto_177758 ?auto_177759 ?auto_177760 ?auto_177761 ?auto_177762 ?auto_177763 ?auto_177764 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_177777 - BLOCK
      ?auto_177778 - BLOCK
      ?auto_177779 - BLOCK
      ?auto_177780 - BLOCK
      ?auto_177781 - BLOCK
      ?auto_177782 - BLOCK
      ?auto_177783 - BLOCK
      ?auto_177784 - BLOCK
      ?auto_177785 - BLOCK
      ?auto_177786 - BLOCK
      ?auto_177787 - BLOCK
      ?auto_177788 - BLOCK
    )
    :vars
    (
      ?auto_177789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_177777 ?auto_177778 ) ) ( not ( = ?auto_177777 ?auto_177779 ) ) ( not ( = ?auto_177777 ?auto_177780 ) ) ( not ( = ?auto_177777 ?auto_177781 ) ) ( not ( = ?auto_177777 ?auto_177782 ) ) ( not ( = ?auto_177777 ?auto_177783 ) ) ( not ( = ?auto_177777 ?auto_177784 ) ) ( not ( = ?auto_177777 ?auto_177785 ) ) ( not ( = ?auto_177777 ?auto_177786 ) ) ( not ( = ?auto_177777 ?auto_177787 ) ) ( not ( = ?auto_177777 ?auto_177788 ) ) ( not ( = ?auto_177778 ?auto_177779 ) ) ( not ( = ?auto_177778 ?auto_177780 ) ) ( not ( = ?auto_177778 ?auto_177781 ) ) ( not ( = ?auto_177778 ?auto_177782 ) ) ( not ( = ?auto_177778 ?auto_177783 ) ) ( not ( = ?auto_177778 ?auto_177784 ) ) ( not ( = ?auto_177778 ?auto_177785 ) ) ( not ( = ?auto_177778 ?auto_177786 ) ) ( not ( = ?auto_177778 ?auto_177787 ) ) ( not ( = ?auto_177778 ?auto_177788 ) ) ( not ( = ?auto_177779 ?auto_177780 ) ) ( not ( = ?auto_177779 ?auto_177781 ) ) ( not ( = ?auto_177779 ?auto_177782 ) ) ( not ( = ?auto_177779 ?auto_177783 ) ) ( not ( = ?auto_177779 ?auto_177784 ) ) ( not ( = ?auto_177779 ?auto_177785 ) ) ( not ( = ?auto_177779 ?auto_177786 ) ) ( not ( = ?auto_177779 ?auto_177787 ) ) ( not ( = ?auto_177779 ?auto_177788 ) ) ( not ( = ?auto_177780 ?auto_177781 ) ) ( not ( = ?auto_177780 ?auto_177782 ) ) ( not ( = ?auto_177780 ?auto_177783 ) ) ( not ( = ?auto_177780 ?auto_177784 ) ) ( not ( = ?auto_177780 ?auto_177785 ) ) ( not ( = ?auto_177780 ?auto_177786 ) ) ( not ( = ?auto_177780 ?auto_177787 ) ) ( not ( = ?auto_177780 ?auto_177788 ) ) ( not ( = ?auto_177781 ?auto_177782 ) ) ( not ( = ?auto_177781 ?auto_177783 ) ) ( not ( = ?auto_177781 ?auto_177784 ) ) ( not ( = ?auto_177781 ?auto_177785 ) ) ( not ( = ?auto_177781 ?auto_177786 ) ) ( not ( = ?auto_177781 ?auto_177787 ) ) ( not ( = ?auto_177781 ?auto_177788 ) ) ( not ( = ?auto_177782 ?auto_177783 ) ) ( not ( = ?auto_177782 ?auto_177784 ) ) ( not ( = ?auto_177782 ?auto_177785 ) ) ( not ( = ?auto_177782 ?auto_177786 ) ) ( not ( = ?auto_177782 ?auto_177787 ) ) ( not ( = ?auto_177782 ?auto_177788 ) ) ( not ( = ?auto_177783 ?auto_177784 ) ) ( not ( = ?auto_177783 ?auto_177785 ) ) ( not ( = ?auto_177783 ?auto_177786 ) ) ( not ( = ?auto_177783 ?auto_177787 ) ) ( not ( = ?auto_177783 ?auto_177788 ) ) ( not ( = ?auto_177784 ?auto_177785 ) ) ( not ( = ?auto_177784 ?auto_177786 ) ) ( not ( = ?auto_177784 ?auto_177787 ) ) ( not ( = ?auto_177784 ?auto_177788 ) ) ( not ( = ?auto_177785 ?auto_177786 ) ) ( not ( = ?auto_177785 ?auto_177787 ) ) ( not ( = ?auto_177785 ?auto_177788 ) ) ( not ( = ?auto_177786 ?auto_177787 ) ) ( not ( = ?auto_177786 ?auto_177788 ) ) ( not ( = ?auto_177787 ?auto_177788 ) ) ( ON ?auto_177777 ?auto_177789 ) ( not ( = ?auto_177788 ?auto_177789 ) ) ( not ( = ?auto_177787 ?auto_177789 ) ) ( not ( = ?auto_177786 ?auto_177789 ) ) ( not ( = ?auto_177785 ?auto_177789 ) ) ( not ( = ?auto_177784 ?auto_177789 ) ) ( not ( = ?auto_177783 ?auto_177789 ) ) ( not ( = ?auto_177782 ?auto_177789 ) ) ( not ( = ?auto_177781 ?auto_177789 ) ) ( not ( = ?auto_177780 ?auto_177789 ) ) ( not ( = ?auto_177779 ?auto_177789 ) ) ( not ( = ?auto_177778 ?auto_177789 ) ) ( not ( = ?auto_177777 ?auto_177789 ) ) ( ON ?auto_177778 ?auto_177777 ) ( ON ?auto_177779 ?auto_177778 ) ( ON ?auto_177780 ?auto_177779 ) ( ON ?auto_177781 ?auto_177780 ) ( ON ?auto_177782 ?auto_177781 ) ( ON ?auto_177783 ?auto_177782 ) ( ON ?auto_177784 ?auto_177783 ) ( ON ?auto_177785 ?auto_177784 ) ( ON ?auto_177786 ?auto_177785 ) ( ON ?auto_177787 ?auto_177786 ) ( ON ?auto_177788 ?auto_177787 ) ( CLEAR ?auto_177788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_177788 ?auto_177787 ?auto_177786 ?auto_177785 ?auto_177784 ?auto_177783 ?auto_177782 ?auto_177781 ?auto_177780 ?auto_177779 ?auto_177778 ?auto_177777 )
      ( MAKE-12PILE ?auto_177777 ?auto_177778 ?auto_177779 ?auto_177780 ?auto_177781 ?auto_177782 ?auto_177783 ?auto_177784 ?auto_177785 ?auto_177786 ?auto_177787 ?auto_177788 ) )
  )

)

