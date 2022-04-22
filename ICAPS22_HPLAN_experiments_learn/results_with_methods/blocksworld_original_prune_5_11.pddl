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
      ?auto_26072 - BLOCK
      ?auto_26073 - BLOCK
      ?auto_26074 - BLOCK
      ?auto_26075 - BLOCK
      ?auto_26076 - BLOCK
    )
    :vars
    (
      ?auto_26077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26077 ?auto_26076 ) ( CLEAR ?auto_26077 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26072 ) ( ON ?auto_26073 ?auto_26072 ) ( ON ?auto_26074 ?auto_26073 ) ( ON ?auto_26075 ?auto_26074 ) ( ON ?auto_26076 ?auto_26075 ) ( not ( = ?auto_26072 ?auto_26073 ) ) ( not ( = ?auto_26072 ?auto_26074 ) ) ( not ( = ?auto_26072 ?auto_26075 ) ) ( not ( = ?auto_26072 ?auto_26076 ) ) ( not ( = ?auto_26072 ?auto_26077 ) ) ( not ( = ?auto_26073 ?auto_26074 ) ) ( not ( = ?auto_26073 ?auto_26075 ) ) ( not ( = ?auto_26073 ?auto_26076 ) ) ( not ( = ?auto_26073 ?auto_26077 ) ) ( not ( = ?auto_26074 ?auto_26075 ) ) ( not ( = ?auto_26074 ?auto_26076 ) ) ( not ( = ?auto_26074 ?auto_26077 ) ) ( not ( = ?auto_26075 ?auto_26076 ) ) ( not ( = ?auto_26075 ?auto_26077 ) ) ( not ( = ?auto_26076 ?auto_26077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26077 ?auto_26076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26079 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26079 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_26079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26080 - BLOCK
    )
    :vars
    (
      ?auto_26081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26080 ?auto_26081 ) ( CLEAR ?auto_26080 ) ( HAND-EMPTY ) ( not ( = ?auto_26080 ?auto_26081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26080 ?auto_26081 )
      ( MAKE-1PILE ?auto_26080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26086 - BLOCK
      ?auto_26087 - BLOCK
      ?auto_26088 - BLOCK
      ?auto_26089 - BLOCK
    )
    :vars
    (
      ?auto_26090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26090 ?auto_26089 ) ( CLEAR ?auto_26090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26086 ) ( ON ?auto_26087 ?auto_26086 ) ( ON ?auto_26088 ?auto_26087 ) ( ON ?auto_26089 ?auto_26088 ) ( not ( = ?auto_26086 ?auto_26087 ) ) ( not ( = ?auto_26086 ?auto_26088 ) ) ( not ( = ?auto_26086 ?auto_26089 ) ) ( not ( = ?auto_26086 ?auto_26090 ) ) ( not ( = ?auto_26087 ?auto_26088 ) ) ( not ( = ?auto_26087 ?auto_26089 ) ) ( not ( = ?auto_26087 ?auto_26090 ) ) ( not ( = ?auto_26088 ?auto_26089 ) ) ( not ( = ?auto_26088 ?auto_26090 ) ) ( not ( = ?auto_26089 ?auto_26090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26090 ?auto_26089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26091 - BLOCK
      ?auto_26092 - BLOCK
      ?auto_26093 - BLOCK
      ?auto_26094 - BLOCK
    )
    :vars
    (
      ?auto_26095 - BLOCK
      ?auto_26096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26095 ?auto_26094 ) ( CLEAR ?auto_26095 ) ( ON-TABLE ?auto_26091 ) ( ON ?auto_26092 ?auto_26091 ) ( ON ?auto_26093 ?auto_26092 ) ( ON ?auto_26094 ?auto_26093 ) ( not ( = ?auto_26091 ?auto_26092 ) ) ( not ( = ?auto_26091 ?auto_26093 ) ) ( not ( = ?auto_26091 ?auto_26094 ) ) ( not ( = ?auto_26091 ?auto_26095 ) ) ( not ( = ?auto_26092 ?auto_26093 ) ) ( not ( = ?auto_26092 ?auto_26094 ) ) ( not ( = ?auto_26092 ?auto_26095 ) ) ( not ( = ?auto_26093 ?auto_26094 ) ) ( not ( = ?auto_26093 ?auto_26095 ) ) ( not ( = ?auto_26094 ?auto_26095 ) ) ( HOLDING ?auto_26096 ) ( not ( = ?auto_26091 ?auto_26096 ) ) ( not ( = ?auto_26092 ?auto_26096 ) ) ( not ( = ?auto_26093 ?auto_26096 ) ) ( not ( = ?auto_26094 ?auto_26096 ) ) ( not ( = ?auto_26095 ?auto_26096 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_26096 )
      ( MAKE-4PILE ?auto_26091 ?auto_26092 ?auto_26093 ?auto_26094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26097 - BLOCK
      ?auto_26098 - BLOCK
      ?auto_26099 - BLOCK
      ?auto_26100 - BLOCK
    )
    :vars
    (
      ?auto_26101 - BLOCK
      ?auto_26102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26101 ?auto_26100 ) ( ON-TABLE ?auto_26097 ) ( ON ?auto_26098 ?auto_26097 ) ( ON ?auto_26099 ?auto_26098 ) ( ON ?auto_26100 ?auto_26099 ) ( not ( = ?auto_26097 ?auto_26098 ) ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26097 ?auto_26100 ) ) ( not ( = ?auto_26097 ?auto_26101 ) ) ( not ( = ?auto_26098 ?auto_26099 ) ) ( not ( = ?auto_26098 ?auto_26100 ) ) ( not ( = ?auto_26098 ?auto_26101 ) ) ( not ( = ?auto_26099 ?auto_26100 ) ) ( not ( = ?auto_26099 ?auto_26101 ) ) ( not ( = ?auto_26100 ?auto_26101 ) ) ( not ( = ?auto_26097 ?auto_26102 ) ) ( not ( = ?auto_26098 ?auto_26102 ) ) ( not ( = ?auto_26099 ?auto_26102 ) ) ( not ( = ?auto_26100 ?auto_26102 ) ) ( not ( = ?auto_26101 ?auto_26102 ) ) ( ON ?auto_26102 ?auto_26101 ) ( CLEAR ?auto_26102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26097 ?auto_26098 ?auto_26099 ?auto_26100 ?auto_26101 )
      ( MAKE-4PILE ?auto_26097 ?auto_26098 ?auto_26099 ?auto_26100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26105 - BLOCK
      ?auto_26106 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26106 ) ( CLEAR ?auto_26105 ) ( ON-TABLE ?auto_26105 ) ( not ( = ?auto_26105 ?auto_26106 ) ) )
    :subtasks
    ( ( !STACK ?auto_26106 ?auto_26105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26107 - BLOCK
      ?auto_26108 - BLOCK
    )
    :vars
    (
      ?auto_26109 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26107 ) ( ON-TABLE ?auto_26107 ) ( not ( = ?auto_26107 ?auto_26108 ) ) ( ON ?auto_26108 ?auto_26109 ) ( CLEAR ?auto_26108 ) ( HAND-EMPTY ) ( not ( = ?auto_26107 ?auto_26109 ) ) ( not ( = ?auto_26108 ?auto_26109 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26108 ?auto_26109 )
      ( MAKE-2PILE ?auto_26107 ?auto_26108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26110 - BLOCK
      ?auto_26111 - BLOCK
    )
    :vars
    (
      ?auto_26112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26110 ?auto_26111 ) ) ( ON ?auto_26111 ?auto_26112 ) ( CLEAR ?auto_26111 ) ( not ( = ?auto_26110 ?auto_26112 ) ) ( not ( = ?auto_26111 ?auto_26112 ) ) ( HOLDING ?auto_26110 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26110 )
      ( MAKE-2PILE ?auto_26110 ?auto_26111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26113 - BLOCK
      ?auto_26114 - BLOCK
    )
    :vars
    (
      ?auto_26115 - BLOCK
      ?auto_26118 - BLOCK
      ?auto_26116 - BLOCK
      ?auto_26117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26113 ?auto_26114 ) ) ( ON ?auto_26114 ?auto_26115 ) ( not ( = ?auto_26113 ?auto_26115 ) ) ( not ( = ?auto_26114 ?auto_26115 ) ) ( ON ?auto_26113 ?auto_26114 ) ( CLEAR ?auto_26113 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26118 ) ( ON ?auto_26116 ?auto_26118 ) ( ON ?auto_26117 ?auto_26116 ) ( ON ?auto_26115 ?auto_26117 ) ( not ( = ?auto_26118 ?auto_26116 ) ) ( not ( = ?auto_26118 ?auto_26117 ) ) ( not ( = ?auto_26118 ?auto_26115 ) ) ( not ( = ?auto_26118 ?auto_26114 ) ) ( not ( = ?auto_26118 ?auto_26113 ) ) ( not ( = ?auto_26116 ?auto_26117 ) ) ( not ( = ?auto_26116 ?auto_26115 ) ) ( not ( = ?auto_26116 ?auto_26114 ) ) ( not ( = ?auto_26116 ?auto_26113 ) ) ( not ( = ?auto_26117 ?auto_26115 ) ) ( not ( = ?auto_26117 ?auto_26114 ) ) ( not ( = ?auto_26117 ?auto_26113 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26118 ?auto_26116 ?auto_26117 ?auto_26115 ?auto_26114 )
      ( MAKE-2PILE ?auto_26113 ?auto_26114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26122 - BLOCK
      ?auto_26123 - BLOCK
      ?auto_26124 - BLOCK
    )
    :vars
    (
      ?auto_26125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26125 ?auto_26124 ) ( CLEAR ?auto_26125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26122 ) ( ON ?auto_26123 ?auto_26122 ) ( ON ?auto_26124 ?auto_26123 ) ( not ( = ?auto_26122 ?auto_26123 ) ) ( not ( = ?auto_26122 ?auto_26124 ) ) ( not ( = ?auto_26122 ?auto_26125 ) ) ( not ( = ?auto_26123 ?auto_26124 ) ) ( not ( = ?auto_26123 ?auto_26125 ) ) ( not ( = ?auto_26124 ?auto_26125 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26125 ?auto_26124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26126 - BLOCK
      ?auto_26127 - BLOCK
      ?auto_26128 - BLOCK
    )
    :vars
    (
      ?auto_26129 - BLOCK
      ?auto_26130 - BLOCK
      ?auto_26131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26129 ?auto_26128 ) ( CLEAR ?auto_26129 ) ( ON-TABLE ?auto_26126 ) ( ON ?auto_26127 ?auto_26126 ) ( ON ?auto_26128 ?auto_26127 ) ( not ( = ?auto_26126 ?auto_26127 ) ) ( not ( = ?auto_26126 ?auto_26128 ) ) ( not ( = ?auto_26126 ?auto_26129 ) ) ( not ( = ?auto_26127 ?auto_26128 ) ) ( not ( = ?auto_26127 ?auto_26129 ) ) ( not ( = ?auto_26128 ?auto_26129 ) ) ( HOLDING ?auto_26130 ) ( CLEAR ?auto_26131 ) ( not ( = ?auto_26126 ?auto_26130 ) ) ( not ( = ?auto_26126 ?auto_26131 ) ) ( not ( = ?auto_26127 ?auto_26130 ) ) ( not ( = ?auto_26127 ?auto_26131 ) ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26131 ) ) ( not ( = ?auto_26129 ?auto_26130 ) ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( not ( = ?auto_26130 ?auto_26131 ) ) )
    :subtasks
    ( ( !STACK ?auto_26130 ?auto_26131 )
      ( MAKE-3PILE ?auto_26126 ?auto_26127 ?auto_26128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26494 - BLOCK
      ?auto_26495 - BLOCK
      ?auto_26496 - BLOCK
    )
    :vars
    (
      ?auto_26498 - BLOCK
      ?auto_26497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26498 ?auto_26496 ) ( ON-TABLE ?auto_26494 ) ( ON ?auto_26495 ?auto_26494 ) ( ON ?auto_26496 ?auto_26495 ) ( not ( = ?auto_26494 ?auto_26495 ) ) ( not ( = ?auto_26494 ?auto_26496 ) ) ( not ( = ?auto_26494 ?auto_26498 ) ) ( not ( = ?auto_26495 ?auto_26496 ) ) ( not ( = ?auto_26495 ?auto_26498 ) ) ( not ( = ?auto_26496 ?auto_26498 ) ) ( not ( = ?auto_26494 ?auto_26497 ) ) ( not ( = ?auto_26495 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26498 ?auto_26497 ) ) ( ON ?auto_26497 ?auto_26498 ) ( CLEAR ?auto_26497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26494 ?auto_26495 ?auto_26496 ?auto_26498 )
      ( MAKE-3PILE ?auto_26494 ?auto_26495 ?auto_26496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26138 - BLOCK
      ?auto_26139 - BLOCK
      ?auto_26140 - BLOCK
    )
    :vars
    (
      ?auto_26141 - BLOCK
      ?auto_26143 - BLOCK
      ?auto_26142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26141 ?auto_26140 ) ( ON-TABLE ?auto_26138 ) ( ON ?auto_26139 ?auto_26138 ) ( ON ?auto_26140 ?auto_26139 ) ( not ( = ?auto_26138 ?auto_26139 ) ) ( not ( = ?auto_26138 ?auto_26140 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26139 ?auto_26141 ) ) ( not ( = ?auto_26140 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26143 ) ) ( not ( = ?auto_26138 ?auto_26142 ) ) ( not ( = ?auto_26139 ?auto_26143 ) ) ( not ( = ?auto_26139 ?auto_26142 ) ) ( not ( = ?auto_26140 ?auto_26143 ) ) ( not ( = ?auto_26140 ?auto_26142 ) ) ( not ( = ?auto_26141 ?auto_26143 ) ) ( not ( = ?auto_26141 ?auto_26142 ) ) ( not ( = ?auto_26143 ?auto_26142 ) ) ( ON ?auto_26143 ?auto_26141 ) ( CLEAR ?auto_26143 ) ( HOLDING ?auto_26142 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26142 )
      ( MAKE-3PILE ?auto_26138 ?auto_26139 ?auto_26140 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26144 - BLOCK
      ?auto_26145 - BLOCK
      ?auto_26146 - BLOCK
    )
    :vars
    (
      ?auto_26149 - BLOCK
      ?auto_26147 - BLOCK
      ?auto_26148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26149 ?auto_26146 ) ( ON-TABLE ?auto_26144 ) ( ON ?auto_26145 ?auto_26144 ) ( ON ?auto_26146 ?auto_26145 ) ( not ( = ?auto_26144 ?auto_26145 ) ) ( not ( = ?auto_26144 ?auto_26146 ) ) ( not ( = ?auto_26144 ?auto_26149 ) ) ( not ( = ?auto_26145 ?auto_26146 ) ) ( not ( = ?auto_26145 ?auto_26149 ) ) ( not ( = ?auto_26146 ?auto_26149 ) ) ( not ( = ?auto_26144 ?auto_26147 ) ) ( not ( = ?auto_26144 ?auto_26148 ) ) ( not ( = ?auto_26145 ?auto_26147 ) ) ( not ( = ?auto_26145 ?auto_26148 ) ) ( not ( = ?auto_26146 ?auto_26147 ) ) ( not ( = ?auto_26146 ?auto_26148 ) ) ( not ( = ?auto_26149 ?auto_26147 ) ) ( not ( = ?auto_26149 ?auto_26148 ) ) ( not ( = ?auto_26147 ?auto_26148 ) ) ( ON ?auto_26147 ?auto_26149 ) ( ON ?auto_26148 ?auto_26147 ) ( CLEAR ?auto_26148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26144 ?auto_26145 ?auto_26146 ?auto_26149 ?auto_26147 )
      ( MAKE-3PILE ?auto_26144 ?auto_26145 ?auto_26146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26153 - BLOCK
      ?auto_26154 - BLOCK
      ?auto_26155 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26155 ) ( CLEAR ?auto_26154 ) ( ON-TABLE ?auto_26153 ) ( ON ?auto_26154 ?auto_26153 ) ( not ( = ?auto_26153 ?auto_26154 ) ) ( not ( = ?auto_26153 ?auto_26155 ) ) ( not ( = ?auto_26154 ?auto_26155 ) ) )
    :subtasks
    ( ( !STACK ?auto_26155 ?auto_26154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26156 - BLOCK
      ?auto_26157 - BLOCK
      ?auto_26158 - BLOCK
    )
    :vars
    (
      ?auto_26159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26157 ) ( ON-TABLE ?auto_26156 ) ( ON ?auto_26157 ?auto_26156 ) ( not ( = ?auto_26156 ?auto_26157 ) ) ( not ( = ?auto_26156 ?auto_26158 ) ) ( not ( = ?auto_26157 ?auto_26158 ) ) ( ON ?auto_26158 ?auto_26159 ) ( CLEAR ?auto_26158 ) ( HAND-EMPTY ) ( not ( = ?auto_26156 ?auto_26159 ) ) ( not ( = ?auto_26157 ?auto_26159 ) ) ( not ( = ?auto_26158 ?auto_26159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26158 ?auto_26159 )
      ( MAKE-3PILE ?auto_26156 ?auto_26157 ?auto_26158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26160 - BLOCK
      ?auto_26161 - BLOCK
      ?auto_26162 - BLOCK
    )
    :vars
    (
      ?auto_26163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26160 ) ( not ( = ?auto_26160 ?auto_26161 ) ) ( not ( = ?auto_26160 ?auto_26162 ) ) ( not ( = ?auto_26161 ?auto_26162 ) ) ( ON ?auto_26162 ?auto_26163 ) ( CLEAR ?auto_26162 ) ( not ( = ?auto_26160 ?auto_26163 ) ) ( not ( = ?auto_26161 ?auto_26163 ) ) ( not ( = ?auto_26162 ?auto_26163 ) ) ( HOLDING ?auto_26161 ) ( CLEAR ?auto_26160 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26160 ?auto_26161 )
      ( MAKE-3PILE ?auto_26160 ?auto_26161 ?auto_26162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26164 - BLOCK
      ?auto_26165 - BLOCK
      ?auto_26166 - BLOCK
    )
    :vars
    (
      ?auto_26167 - BLOCK
      ?auto_26169 - BLOCK
      ?auto_26168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26164 ) ( not ( = ?auto_26164 ?auto_26165 ) ) ( not ( = ?auto_26164 ?auto_26166 ) ) ( not ( = ?auto_26165 ?auto_26166 ) ) ( ON ?auto_26166 ?auto_26167 ) ( not ( = ?auto_26164 ?auto_26167 ) ) ( not ( = ?auto_26165 ?auto_26167 ) ) ( not ( = ?auto_26166 ?auto_26167 ) ) ( CLEAR ?auto_26164 ) ( ON ?auto_26165 ?auto_26166 ) ( CLEAR ?auto_26165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26169 ) ( ON ?auto_26168 ?auto_26169 ) ( ON ?auto_26167 ?auto_26168 ) ( not ( = ?auto_26169 ?auto_26168 ) ) ( not ( = ?auto_26169 ?auto_26167 ) ) ( not ( = ?auto_26169 ?auto_26166 ) ) ( not ( = ?auto_26169 ?auto_26165 ) ) ( not ( = ?auto_26168 ?auto_26167 ) ) ( not ( = ?auto_26168 ?auto_26166 ) ) ( not ( = ?auto_26168 ?auto_26165 ) ) ( not ( = ?auto_26164 ?auto_26169 ) ) ( not ( = ?auto_26164 ?auto_26168 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26169 ?auto_26168 ?auto_26167 ?auto_26166 )
      ( MAKE-3PILE ?auto_26164 ?auto_26165 ?auto_26166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26170 - BLOCK
      ?auto_26171 - BLOCK
      ?auto_26172 - BLOCK
    )
    :vars
    (
      ?auto_26175 - BLOCK
      ?auto_26174 - BLOCK
      ?auto_26173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26170 ?auto_26171 ) ) ( not ( = ?auto_26170 ?auto_26172 ) ) ( not ( = ?auto_26171 ?auto_26172 ) ) ( ON ?auto_26172 ?auto_26175 ) ( not ( = ?auto_26170 ?auto_26175 ) ) ( not ( = ?auto_26171 ?auto_26175 ) ) ( not ( = ?auto_26172 ?auto_26175 ) ) ( ON ?auto_26171 ?auto_26172 ) ( CLEAR ?auto_26171 ) ( ON-TABLE ?auto_26174 ) ( ON ?auto_26173 ?auto_26174 ) ( ON ?auto_26175 ?auto_26173 ) ( not ( = ?auto_26174 ?auto_26173 ) ) ( not ( = ?auto_26174 ?auto_26175 ) ) ( not ( = ?auto_26174 ?auto_26172 ) ) ( not ( = ?auto_26174 ?auto_26171 ) ) ( not ( = ?auto_26173 ?auto_26175 ) ) ( not ( = ?auto_26173 ?auto_26172 ) ) ( not ( = ?auto_26173 ?auto_26171 ) ) ( not ( = ?auto_26170 ?auto_26174 ) ) ( not ( = ?auto_26170 ?auto_26173 ) ) ( HOLDING ?auto_26170 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26170 )
      ( MAKE-3PILE ?auto_26170 ?auto_26171 ?auto_26172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26176 - BLOCK
      ?auto_26177 - BLOCK
      ?auto_26178 - BLOCK
    )
    :vars
    (
      ?auto_26180 - BLOCK
      ?auto_26181 - BLOCK
      ?auto_26179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26176 ?auto_26177 ) ) ( not ( = ?auto_26176 ?auto_26178 ) ) ( not ( = ?auto_26177 ?auto_26178 ) ) ( ON ?auto_26178 ?auto_26180 ) ( not ( = ?auto_26176 ?auto_26180 ) ) ( not ( = ?auto_26177 ?auto_26180 ) ) ( not ( = ?auto_26178 ?auto_26180 ) ) ( ON ?auto_26177 ?auto_26178 ) ( ON-TABLE ?auto_26181 ) ( ON ?auto_26179 ?auto_26181 ) ( ON ?auto_26180 ?auto_26179 ) ( not ( = ?auto_26181 ?auto_26179 ) ) ( not ( = ?auto_26181 ?auto_26180 ) ) ( not ( = ?auto_26181 ?auto_26178 ) ) ( not ( = ?auto_26181 ?auto_26177 ) ) ( not ( = ?auto_26179 ?auto_26180 ) ) ( not ( = ?auto_26179 ?auto_26178 ) ) ( not ( = ?auto_26179 ?auto_26177 ) ) ( not ( = ?auto_26176 ?auto_26181 ) ) ( not ( = ?auto_26176 ?auto_26179 ) ) ( ON ?auto_26176 ?auto_26177 ) ( CLEAR ?auto_26176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26181 ?auto_26179 ?auto_26180 ?auto_26178 ?auto_26177 )
      ( MAKE-3PILE ?auto_26176 ?auto_26177 ?auto_26178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26184 - BLOCK
      ?auto_26185 - BLOCK
    )
    :vars
    (
      ?auto_26186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26186 ?auto_26185 ) ( CLEAR ?auto_26186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26184 ) ( ON ?auto_26185 ?auto_26184 ) ( not ( = ?auto_26184 ?auto_26185 ) ) ( not ( = ?auto_26184 ?auto_26186 ) ) ( not ( = ?auto_26185 ?auto_26186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26186 ?auto_26185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26187 - BLOCK
      ?auto_26188 - BLOCK
    )
    :vars
    (
      ?auto_26189 - BLOCK
      ?auto_26190 - BLOCK
      ?auto_26191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26189 ?auto_26188 ) ( CLEAR ?auto_26189 ) ( ON-TABLE ?auto_26187 ) ( ON ?auto_26188 ?auto_26187 ) ( not ( = ?auto_26187 ?auto_26188 ) ) ( not ( = ?auto_26187 ?auto_26189 ) ) ( not ( = ?auto_26188 ?auto_26189 ) ) ( HOLDING ?auto_26190 ) ( CLEAR ?auto_26191 ) ( not ( = ?auto_26187 ?auto_26190 ) ) ( not ( = ?auto_26187 ?auto_26191 ) ) ( not ( = ?auto_26188 ?auto_26190 ) ) ( not ( = ?auto_26188 ?auto_26191 ) ) ( not ( = ?auto_26189 ?auto_26190 ) ) ( not ( = ?auto_26189 ?auto_26191 ) ) ( not ( = ?auto_26190 ?auto_26191 ) ) )
    :subtasks
    ( ( !STACK ?auto_26190 ?auto_26191 )
      ( MAKE-2PILE ?auto_26187 ?auto_26188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26192 - BLOCK
      ?auto_26193 - BLOCK
    )
    :vars
    (
      ?auto_26194 - BLOCK
      ?auto_26195 - BLOCK
      ?auto_26196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26194 ?auto_26193 ) ( ON-TABLE ?auto_26192 ) ( ON ?auto_26193 ?auto_26192 ) ( not ( = ?auto_26192 ?auto_26193 ) ) ( not ( = ?auto_26192 ?auto_26194 ) ) ( not ( = ?auto_26193 ?auto_26194 ) ) ( CLEAR ?auto_26195 ) ( not ( = ?auto_26192 ?auto_26196 ) ) ( not ( = ?auto_26192 ?auto_26195 ) ) ( not ( = ?auto_26193 ?auto_26196 ) ) ( not ( = ?auto_26193 ?auto_26195 ) ) ( not ( = ?auto_26194 ?auto_26196 ) ) ( not ( = ?auto_26194 ?auto_26195 ) ) ( not ( = ?auto_26196 ?auto_26195 ) ) ( ON ?auto_26196 ?auto_26194 ) ( CLEAR ?auto_26196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26192 ?auto_26193 ?auto_26194 )
      ( MAKE-2PILE ?auto_26192 ?auto_26193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26197 - BLOCK
      ?auto_26198 - BLOCK
    )
    :vars
    (
      ?auto_26199 - BLOCK
      ?auto_26201 - BLOCK
      ?auto_26200 - BLOCK
      ?auto_26202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26199 ?auto_26198 ) ( ON-TABLE ?auto_26197 ) ( ON ?auto_26198 ?auto_26197 ) ( not ( = ?auto_26197 ?auto_26198 ) ) ( not ( = ?auto_26197 ?auto_26199 ) ) ( not ( = ?auto_26198 ?auto_26199 ) ) ( not ( = ?auto_26197 ?auto_26201 ) ) ( not ( = ?auto_26197 ?auto_26200 ) ) ( not ( = ?auto_26198 ?auto_26201 ) ) ( not ( = ?auto_26198 ?auto_26200 ) ) ( not ( = ?auto_26199 ?auto_26201 ) ) ( not ( = ?auto_26199 ?auto_26200 ) ) ( not ( = ?auto_26201 ?auto_26200 ) ) ( ON ?auto_26201 ?auto_26199 ) ( CLEAR ?auto_26201 ) ( HOLDING ?auto_26200 ) ( CLEAR ?auto_26202 ) ( ON-TABLE ?auto_26202 ) ( not ( = ?auto_26202 ?auto_26200 ) ) ( not ( = ?auto_26197 ?auto_26202 ) ) ( not ( = ?auto_26198 ?auto_26202 ) ) ( not ( = ?auto_26199 ?auto_26202 ) ) ( not ( = ?auto_26201 ?auto_26202 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26202 ?auto_26200 )
      ( MAKE-2PILE ?auto_26197 ?auto_26198 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26621 - BLOCK
      ?auto_26622 - BLOCK
    )
    :vars
    (
      ?auto_26624 - BLOCK
      ?auto_26625 - BLOCK
      ?auto_26623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26624 ?auto_26622 ) ( ON-TABLE ?auto_26621 ) ( ON ?auto_26622 ?auto_26621 ) ( not ( = ?auto_26621 ?auto_26622 ) ) ( not ( = ?auto_26621 ?auto_26624 ) ) ( not ( = ?auto_26622 ?auto_26624 ) ) ( not ( = ?auto_26621 ?auto_26625 ) ) ( not ( = ?auto_26621 ?auto_26623 ) ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( not ( = ?auto_26622 ?auto_26623 ) ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26623 ) ) ( not ( = ?auto_26625 ?auto_26623 ) ) ( ON ?auto_26625 ?auto_26624 ) ( ON ?auto_26623 ?auto_26625 ) ( CLEAR ?auto_26623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26621 ?auto_26622 ?auto_26624 ?auto_26625 )
      ( MAKE-2PILE ?auto_26621 ?auto_26622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26209 - BLOCK
      ?auto_26210 - BLOCK
    )
    :vars
    (
      ?auto_26214 - BLOCK
      ?auto_26211 - BLOCK
      ?auto_26212 - BLOCK
      ?auto_26213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26214 ?auto_26210 ) ( ON-TABLE ?auto_26209 ) ( ON ?auto_26210 ?auto_26209 ) ( not ( = ?auto_26209 ?auto_26210 ) ) ( not ( = ?auto_26209 ?auto_26214 ) ) ( not ( = ?auto_26210 ?auto_26214 ) ) ( not ( = ?auto_26209 ?auto_26211 ) ) ( not ( = ?auto_26209 ?auto_26212 ) ) ( not ( = ?auto_26210 ?auto_26211 ) ) ( not ( = ?auto_26210 ?auto_26212 ) ) ( not ( = ?auto_26214 ?auto_26211 ) ) ( not ( = ?auto_26214 ?auto_26212 ) ) ( not ( = ?auto_26211 ?auto_26212 ) ) ( ON ?auto_26211 ?auto_26214 ) ( not ( = ?auto_26213 ?auto_26212 ) ) ( not ( = ?auto_26209 ?auto_26213 ) ) ( not ( = ?auto_26210 ?auto_26213 ) ) ( not ( = ?auto_26214 ?auto_26213 ) ) ( not ( = ?auto_26211 ?auto_26213 ) ) ( ON ?auto_26212 ?auto_26211 ) ( CLEAR ?auto_26212 ) ( HOLDING ?auto_26213 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26213 )
      ( MAKE-2PILE ?auto_26209 ?auto_26210 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26215 - BLOCK
      ?auto_26216 - BLOCK
    )
    :vars
    (
      ?auto_26217 - BLOCK
      ?auto_26218 - BLOCK
      ?auto_26220 - BLOCK
      ?auto_26219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26217 ?auto_26216 ) ( ON-TABLE ?auto_26215 ) ( ON ?auto_26216 ?auto_26215 ) ( not ( = ?auto_26215 ?auto_26216 ) ) ( not ( = ?auto_26215 ?auto_26217 ) ) ( not ( = ?auto_26216 ?auto_26217 ) ) ( not ( = ?auto_26215 ?auto_26218 ) ) ( not ( = ?auto_26215 ?auto_26220 ) ) ( not ( = ?auto_26216 ?auto_26218 ) ) ( not ( = ?auto_26216 ?auto_26220 ) ) ( not ( = ?auto_26217 ?auto_26218 ) ) ( not ( = ?auto_26217 ?auto_26220 ) ) ( not ( = ?auto_26218 ?auto_26220 ) ) ( ON ?auto_26218 ?auto_26217 ) ( not ( = ?auto_26219 ?auto_26220 ) ) ( not ( = ?auto_26215 ?auto_26219 ) ) ( not ( = ?auto_26216 ?auto_26219 ) ) ( not ( = ?auto_26217 ?auto_26219 ) ) ( not ( = ?auto_26218 ?auto_26219 ) ) ( ON ?auto_26220 ?auto_26218 ) ( ON ?auto_26219 ?auto_26220 ) ( CLEAR ?auto_26219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26215 ?auto_26216 ?auto_26217 ?auto_26218 ?auto_26220 )
      ( MAKE-2PILE ?auto_26215 ?auto_26216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26225 - BLOCK
      ?auto_26226 - BLOCK
      ?auto_26227 - BLOCK
      ?auto_26228 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26228 ) ( CLEAR ?auto_26227 ) ( ON-TABLE ?auto_26225 ) ( ON ?auto_26226 ?auto_26225 ) ( ON ?auto_26227 ?auto_26226 ) ( not ( = ?auto_26225 ?auto_26226 ) ) ( not ( = ?auto_26225 ?auto_26227 ) ) ( not ( = ?auto_26225 ?auto_26228 ) ) ( not ( = ?auto_26226 ?auto_26227 ) ) ( not ( = ?auto_26226 ?auto_26228 ) ) ( not ( = ?auto_26227 ?auto_26228 ) ) )
    :subtasks
    ( ( !STACK ?auto_26228 ?auto_26227 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26229 - BLOCK
      ?auto_26230 - BLOCK
      ?auto_26231 - BLOCK
      ?auto_26232 - BLOCK
    )
    :vars
    (
      ?auto_26233 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26231 ) ( ON-TABLE ?auto_26229 ) ( ON ?auto_26230 ?auto_26229 ) ( ON ?auto_26231 ?auto_26230 ) ( not ( = ?auto_26229 ?auto_26230 ) ) ( not ( = ?auto_26229 ?auto_26231 ) ) ( not ( = ?auto_26229 ?auto_26232 ) ) ( not ( = ?auto_26230 ?auto_26231 ) ) ( not ( = ?auto_26230 ?auto_26232 ) ) ( not ( = ?auto_26231 ?auto_26232 ) ) ( ON ?auto_26232 ?auto_26233 ) ( CLEAR ?auto_26232 ) ( HAND-EMPTY ) ( not ( = ?auto_26229 ?auto_26233 ) ) ( not ( = ?auto_26230 ?auto_26233 ) ) ( not ( = ?auto_26231 ?auto_26233 ) ) ( not ( = ?auto_26232 ?auto_26233 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26232 ?auto_26233 )
      ( MAKE-4PILE ?auto_26229 ?auto_26230 ?auto_26231 ?auto_26232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26234 - BLOCK
      ?auto_26235 - BLOCK
      ?auto_26236 - BLOCK
      ?auto_26237 - BLOCK
    )
    :vars
    (
      ?auto_26238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26234 ) ( ON ?auto_26235 ?auto_26234 ) ( not ( = ?auto_26234 ?auto_26235 ) ) ( not ( = ?auto_26234 ?auto_26236 ) ) ( not ( = ?auto_26234 ?auto_26237 ) ) ( not ( = ?auto_26235 ?auto_26236 ) ) ( not ( = ?auto_26235 ?auto_26237 ) ) ( not ( = ?auto_26236 ?auto_26237 ) ) ( ON ?auto_26237 ?auto_26238 ) ( CLEAR ?auto_26237 ) ( not ( = ?auto_26234 ?auto_26238 ) ) ( not ( = ?auto_26235 ?auto_26238 ) ) ( not ( = ?auto_26236 ?auto_26238 ) ) ( not ( = ?auto_26237 ?auto_26238 ) ) ( HOLDING ?auto_26236 ) ( CLEAR ?auto_26235 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26234 ?auto_26235 ?auto_26236 )
      ( MAKE-4PILE ?auto_26234 ?auto_26235 ?auto_26236 ?auto_26237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26239 - BLOCK
      ?auto_26240 - BLOCK
      ?auto_26241 - BLOCK
      ?auto_26242 - BLOCK
    )
    :vars
    (
      ?auto_26243 - BLOCK
      ?auto_26244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26239 ) ( ON ?auto_26240 ?auto_26239 ) ( not ( = ?auto_26239 ?auto_26240 ) ) ( not ( = ?auto_26239 ?auto_26241 ) ) ( not ( = ?auto_26239 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26241 ) ) ( not ( = ?auto_26240 ?auto_26242 ) ) ( not ( = ?auto_26241 ?auto_26242 ) ) ( ON ?auto_26242 ?auto_26243 ) ( not ( = ?auto_26239 ?auto_26243 ) ) ( not ( = ?auto_26240 ?auto_26243 ) ) ( not ( = ?auto_26241 ?auto_26243 ) ) ( not ( = ?auto_26242 ?auto_26243 ) ) ( CLEAR ?auto_26240 ) ( ON ?auto_26241 ?auto_26242 ) ( CLEAR ?auto_26241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26244 ) ( ON ?auto_26243 ?auto_26244 ) ( not ( = ?auto_26244 ?auto_26243 ) ) ( not ( = ?auto_26244 ?auto_26242 ) ) ( not ( = ?auto_26244 ?auto_26241 ) ) ( not ( = ?auto_26239 ?auto_26244 ) ) ( not ( = ?auto_26240 ?auto_26244 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26244 ?auto_26243 ?auto_26242 )
      ( MAKE-4PILE ?auto_26239 ?auto_26240 ?auto_26241 ?auto_26242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26245 - BLOCK
      ?auto_26246 - BLOCK
      ?auto_26247 - BLOCK
      ?auto_26248 - BLOCK
    )
    :vars
    (
      ?auto_26250 - BLOCK
      ?auto_26249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26245 ) ( not ( = ?auto_26245 ?auto_26246 ) ) ( not ( = ?auto_26245 ?auto_26247 ) ) ( not ( = ?auto_26245 ?auto_26248 ) ) ( not ( = ?auto_26246 ?auto_26247 ) ) ( not ( = ?auto_26246 ?auto_26248 ) ) ( not ( = ?auto_26247 ?auto_26248 ) ) ( ON ?auto_26248 ?auto_26250 ) ( not ( = ?auto_26245 ?auto_26250 ) ) ( not ( = ?auto_26246 ?auto_26250 ) ) ( not ( = ?auto_26247 ?auto_26250 ) ) ( not ( = ?auto_26248 ?auto_26250 ) ) ( ON ?auto_26247 ?auto_26248 ) ( CLEAR ?auto_26247 ) ( ON-TABLE ?auto_26249 ) ( ON ?auto_26250 ?auto_26249 ) ( not ( = ?auto_26249 ?auto_26250 ) ) ( not ( = ?auto_26249 ?auto_26248 ) ) ( not ( = ?auto_26249 ?auto_26247 ) ) ( not ( = ?auto_26245 ?auto_26249 ) ) ( not ( = ?auto_26246 ?auto_26249 ) ) ( HOLDING ?auto_26246 ) ( CLEAR ?auto_26245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26245 ?auto_26246 )
      ( MAKE-4PILE ?auto_26245 ?auto_26246 ?auto_26247 ?auto_26248 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26251 - BLOCK
      ?auto_26252 - BLOCK
      ?auto_26253 - BLOCK
      ?auto_26254 - BLOCK
    )
    :vars
    (
      ?auto_26256 - BLOCK
      ?auto_26255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26251 ) ( not ( = ?auto_26251 ?auto_26252 ) ) ( not ( = ?auto_26251 ?auto_26253 ) ) ( not ( = ?auto_26251 ?auto_26254 ) ) ( not ( = ?auto_26252 ?auto_26253 ) ) ( not ( = ?auto_26252 ?auto_26254 ) ) ( not ( = ?auto_26253 ?auto_26254 ) ) ( ON ?auto_26254 ?auto_26256 ) ( not ( = ?auto_26251 ?auto_26256 ) ) ( not ( = ?auto_26252 ?auto_26256 ) ) ( not ( = ?auto_26253 ?auto_26256 ) ) ( not ( = ?auto_26254 ?auto_26256 ) ) ( ON ?auto_26253 ?auto_26254 ) ( ON-TABLE ?auto_26255 ) ( ON ?auto_26256 ?auto_26255 ) ( not ( = ?auto_26255 ?auto_26256 ) ) ( not ( = ?auto_26255 ?auto_26254 ) ) ( not ( = ?auto_26255 ?auto_26253 ) ) ( not ( = ?auto_26251 ?auto_26255 ) ) ( not ( = ?auto_26252 ?auto_26255 ) ) ( CLEAR ?auto_26251 ) ( ON ?auto_26252 ?auto_26253 ) ( CLEAR ?auto_26252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26255 ?auto_26256 ?auto_26254 ?auto_26253 )
      ( MAKE-4PILE ?auto_26251 ?auto_26252 ?auto_26253 ?auto_26254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26257 - BLOCK
      ?auto_26258 - BLOCK
      ?auto_26259 - BLOCK
      ?auto_26260 - BLOCK
    )
    :vars
    (
      ?auto_26262 - BLOCK
      ?auto_26261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26257 ?auto_26258 ) ) ( not ( = ?auto_26257 ?auto_26259 ) ) ( not ( = ?auto_26257 ?auto_26260 ) ) ( not ( = ?auto_26258 ?auto_26259 ) ) ( not ( = ?auto_26258 ?auto_26260 ) ) ( not ( = ?auto_26259 ?auto_26260 ) ) ( ON ?auto_26260 ?auto_26262 ) ( not ( = ?auto_26257 ?auto_26262 ) ) ( not ( = ?auto_26258 ?auto_26262 ) ) ( not ( = ?auto_26259 ?auto_26262 ) ) ( not ( = ?auto_26260 ?auto_26262 ) ) ( ON ?auto_26259 ?auto_26260 ) ( ON-TABLE ?auto_26261 ) ( ON ?auto_26262 ?auto_26261 ) ( not ( = ?auto_26261 ?auto_26262 ) ) ( not ( = ?auto_26261 ?auto_26260 ) ) ( not ( = ?auto_26261 ?auto_26259 ) ) ( not ( = ?auto_26257 ?auto_26261 ) ) ( not ( = ?auto_26258 ?auto_26261 ) ) ( ON ?auto_26258 ?auto_26259 ) ( CLEAR ?auto_26258 ) ( HOLDING ?auto_26257 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26257 )
      ( MAKE-4PILE ?auto_26257 ?auto_26258 ?auto_26259 ?auto_26260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26263 - BLOCK
      ?auto_26264 - BLOCK
      ?auto_26265 - BLOCK
      ?auto_26266 - BLOCK
    )
    :vars
    (
      ?auto_26267 - BLOCK
      ?auto_26268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26263 ?auto_26264 ) ) ( not ( = ?auto_26263 ?auto_26265 ) ) ( not ( = ?auto_26263 ?auto_26266 ) ) ( not ( = ?auto_26264 ?auto_26265 ) ) ( not ( = ?auto_26264 ?auto_26266 ) ) ( not ( = ?auto_26265 ?auto_26266 ) ) ( ON ?auto_26266 ?auto_26267 ) ( not ( = ?auto_26263 ?auto_26267 ) ) ( not ( = ?auto_26264 ?auto_26267 ) ) ( not ( = ?auto_26265 ?auto_26267 ) ) ( not ( = ?auto_26266 ?auto_26267 ) ) ( ON ?auto_26265 ?auto_26266 ) ( ON-TABLE ?auto_26268 ) ( ON ?auto_26267 ?auto_26268 ) ( not ( = ?auto_26268 ?auto_26267 ) ) ( not ( = ?auto_26268 ?auto_26266 ) ) ( not ( = ?auto_26268 ?auto_26265 ) ) ( not ( = ?auto_26263 ?auto_26268 ) ) ( not ( = ?auto_26264 ?auto_26268 ) ) ( ON ?auto_26264 ?auto_26265 ) ( ON ?auto_26263 ?auto_26264 ) ( CLEAR ?auto_26263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26268 ?auto_26267 ?auto_26266 ?auto_26265 ?auto_26264 )
      ( MAKE-4PILE ?auto_26263 ?auto_26264 ?auto_26265 ?auto_26266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26270 - BLOCK
    )
    :vars
    (
      ?auto_26271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26271 ?auto_26270 ) ( CLEAR ?auto_26271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26270 ) ( not ( = ?auto_26270 ?auto_26271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26271 ?auto_26270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26272 - BLOCK
    )
    :vars
    (
      ?auto_26273 - BLOCK
      ?auto_26274 - BLOCK
      ?auto_26275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26273 ?auto_26272 ) ( CLEAR ?auto_26273 ) ( ON-TABLE ?auto_26272 ) ( not ( = ?auto_26272 ?auto_26273 ) ) ( HOLDING ?auto_26274 ) ( CLEAR ?auto_26275 ) ( not ( = ?auto_26272 ?auto_26274 ) ) ( not ( = ?auto_26272 ?auto_26275 ) ) ( not ( = ?auto_26273 ?auto_26274 ) ) ( not ( = ?auto_26273 ?auto_26275 ) ) ( not ( = ?auto_26274 ?auto_26275 ) ) )
    :subtasks
    ( ( !STACK ?auto_26274 ?auto_26275 )
      ( MAKE-1PILE ?auto_26272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26276 - BLOCK
    )
    :vars
    (
      ?auto_26278 - BLOCK
      ?auto_26277 - BLOCK
      ?auto_26279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26278 ?auto_26276 ) ( ON-TABLE ?auto_26276 ) ( not ( = ?auto_26276 ?auto_26278 ) ) ( CLEAR ?auto_26277 ) ( not ( = ?auto_26276 ?auto_26279 ) ) ( not ( = ?auto_26276 ?auto_26277 ) ) ( not ( = ?auto_26278 ?auto_26279 ) ) ( not ( = ?auto_26278 ?auto_26277 ) ) ( not ( = ?auto_26279 ?auto_26277 ) ) ( ON ?auto_26279 ?auto_26278 ) ( CLEAR ?auto_26279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26276 ?auto_26278 )
      ( MAKE-1PILE ?auto_26276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26280 - BLOCK
    )
    :vars
    (
      ?auto_26283 - BLOCK
      ?auto_26282 - BLOCK
      ?auto_26281 - BLOCK
      ?auto_26284 - BLOCK
      ?auto_26285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26283 ?auto_26280 ) ( ON-TABLE ?auto_26280 ) ( not ( = ?auto_26280 ?auto_26283 ) ) ( not ( = ?auto_26280 ?auto_26282 ) ) ( not ( = ?auto_26280 ?auto_26281 ) ) ( not ( = ?auto_26283 ?auto_26282 ) ) ( not ( = ?auto_26283 ?auto_26281 ) ) ( not ( = ?auto_26282 ?auto_26281 ) ) ( ON ?auto_26282 ?auto_26283 ) ( CLEAR ?auto_26282 ) ( HOLDING ?auto_26281 ) ( CLEAR ?auto_26284 ) ( ON-TABLE ?auto_26285 ) ( ON ?auto_26284 ?auto_26285 ) ( not ( = ?auto_26285 ?auto_26284 ) ) ( not ( = ?auto_26285 ?auto_26281 ) ) ( not ( = ?auto_26284 ?auto_26281 ) ) ( not ( = ?auto_26280 ?auto_26284 ) ) ( not ( = ?auto_26280 ?auto_26285 ) ) ( not ( = ?auto_26283 ?auto_26284 ) ) ( not ( = ?auto_26283 ?auto_26285 ) ) ( not ( = ?auto_26282 ?auto_26284 ) ) ( not ( = ?auto_26282 ?auto_26285 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26285 ?auto_26284 ?auto_26281 )
      ( MAKE-1PILE ?auto_26280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26286 - BLOCK
    )
    :vars
    (
      ?auto_26288 - BLOCK
      ?auto_26291 - BLOCK
      ?auto_26289 - BLOCK
      ?auto_26290 - BLOCK
      ?auto_26287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26288 ?auto_26286 ) ( ON-TABLE ?auto_26286 ) ( not ( = ?auto_26286 ?auto_26288 ) ) ( not ( = ?auto_26286 ?auto_26291 ) ) ( not ( = ?auto_26286 ?auto_26289 ) ) ( not ( = ?auto_26288 ?auto_26291 ) ) ( not ( = ?auto_26288 ?auto_26289 ) ) ( not ( = ?auto_26291 ?auto_26289 ) ) ( ON ?auto_26291 ?auto_26288 ) ( CLEAR ?auto_26290 ) ( ON-TABLE ?auto_26287 ) ( ON ?auto_26290 ?auto_26287 ) ( not ( = ?auto_26287 ?auto_26290 ) ) ( not ( = ?auto_26287 ?auto_26289 ) ) ( not ( = ?auto_26290 ?auto_26289 ) ) ( not ( = ?auto_26286 ?auto_26290 ) ) ( not ( = ?auto_26286 ?auto_26287 ) ) ( not ( = ?auto_26288 ?auto_26290 ) ) ( not ( = ?auto_26288 ?auto_26287 ) ) ( not ( = ?auto_26291 ?auto_26290 ) ) ( not ( = ?auto_26291 ?auto_26287 ) ) ( ON ?auto_26289 ?auto_26291 ) ( CLEAR ?auto_26289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26286 ?auto_26288 ?auto_26291 )
      ( MAKE-1PILE ?auto_26286 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26292 - BLOCK
    )
    :vars
    (
      ?auto_26294 - BLOCK
      ?auto_26296 - BLOCK
      ?auto_26295 - BLOCK
      ?auto_26297 - BLOCK
      ?auto_26293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26294 ?auto_26292 ) ( ON-TABLE ?auto_26292 ) ( not ( = ?auto_26292 ?auto_26294 ) ) ( not ( = ?auto_26292 ?auto_26296 ) ) ( not ( = ?auto_26292 ?auto_26295 ) ) ( not ( = ?auto_26294 ?auto_26296 ) ) ( not ( = ?auto_26294 ?auto_26295 ) ) ( not ( = ?auto_26296 ?auto_26295 ) ) ( ON ?auto_26296 ?auto_26294 ) ( ON-TABLE ?auto_26297 ) ( not ( = ?auto_26297 ?auto_26293 ) ) ( not ( = ?auto_26297 ?auto_26295 ) ) ( not ( = ?auto_26293 ?auto_26295 ) ) ( not ( = ?auto_26292 ?auto_26293 ) ) ( not ( = ?auto_26292 ?auto_26297 ) ) ( not ( = ?auto_26294 ?auto_26293 ) ) ( not ( = ?auto_26294 ?auto_26297 ) ) ( not ( = ?auto_26296 ?auto_26293 ) ) ( not ( = ?auto_26296 ?auto_26297 ) ) ( ON ?auto_26295 ?auto_26296 ) ( CLEAR ?auto_26295 ) ( HOLDING ?auto_26293 ) ( CLEAR ?auto_26297 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26297 ?auto_26293 )
      ( MAKE-1PILE ?auto_26292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26761 - BLOCK
    )
    :vars
    (
      ?auto_26763 - BLOCK
      ?auto_26765 - BLOCK
      ?auto_26764 - BLOCK
      ?auto_26762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26763 ?auto_26761 ) ( ON-TABLE ?auto_26761 ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( not ( = ?auto_26761 ?auto_26765 ) ) ( not ( = ?auto_26761 ?auto_26764 ) ) ( not ( = ?auto_26763 ?auto_26765 ) ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( not ( = ?auto_26765 ?auto_26764 ) ) ( ON ?auto_26765 ?auto_26763 ) ( not ( = ?auto_26762 ?auto_26764 ) ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26763 ?auto_26762 ) ) ( not ( = ?auto_26765 ?auto_26762 ) ) ( ON ?auto_26764 ?auto_26765 ) ( ON ?auto_26762 ?auto_26764 ) ( CLEAR ?auto_26762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26761 ?auto_26763 ?auto_26765 ?auto_26764 )
      ( MAKE-1PILE ?auto_26761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26304 - BLOCK
    )
    :vars
    (
      ?auto_26309 - BLOCK
      ?auto_26305 - BLOCK
      ?auto_26307 - BLOCK
      ?auto_26306 - BLOCK
      ?auto_26308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26309 ?auto_26304 ) ( ON-TABLE ?auto_26304 ) ( not ( = ?auto_26304 ?auto_26309 ) ) ( not ( = ?auto_26304 ?auto_26305 ) ) ( not ( = ?auto_26304 ?auto_26307 ) ) ( not ( = ?auto_26309 ?auto_26305 ) ) ( not ( = ?auto_26309 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( ON ?auto_26305 ?auto_26309 ) ( not ( = ?auto_26306 ?auto_26308 ) ) ( not ( = ?auto_26306 ?auto_26307 ) ) ( not ( = ?auto_26308 ?auto_26307 ) ) ( not ( = ?auto_26304 ?auto_26308 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26309 ?auto_26308 ) ) ( not ( = ?auto_26309 ?auto_26306 ) ) ( not ( = ?auto_26305 ?auto_26308 ) ) ( not ( = ?auto_26305 ?auto_26306 ) ) ( ON ?auto_26307 ?auto_26305 ) ( ON ?auto_26308 ?auto_26307 ) ( CLEAR ?auto_26308 ) ( HOLDING ?auto_26306 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26306 )
      ( MAKE-1PILE ?auto_26304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26310 - BLOCK
    )
    :vars
    (
      ?auto_26312 - BLOCK
      ?auto_26311 - BLOCK
      ?auto_26315 - BLOCK
      ?auto_26314 - BLOCK
      ?auto_26313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26312 ?auto_26310 ) ( ON-TABLE ?auto_26310 ) ( not ( = ?auto_26310 ?auto_26312 ) ) ( not ( = ?auto_26310 ?auto_26311 ) ) ( not ( = ?auto_26310 ?auto_26315 ) ) ( not ( = ?auto_26312 ?auto_26311 ) ) ( not ( = ?auto_26312 ?auto_26315 ) ) ( not ( = ?auto_26311 ?auto_26315 ) ) ( ON ?auto_26311 ?auto_26312 ) ( not ( = ?auto_26314 ?auto_26313 ) ) ( not ( = ?auto_26314 ?auto_26315 ) ) ( not ( = ?auto_26313 ?auto_26315 ) ) ( not ( = ?auto_26310 ?auto_26313 ) ) ( not ( = ?auto_26310 ?auto_26314 ) ) ( not ( = ?auto_26312 ?auto_26313 ) ) ( not ( = ?auto_26312 ?auto_26314 ) ) ( not ( = ?auto_26311 ?auto_26313 ) ) ( not ( = ?auto_26311 ?auto_26314 ) ) ( ON ?auto_26315 ?auto_26311 ) ( ON ?auto_26313 ?auto_26315 ) ( ON ?auto_26314 ?auto_26313 ) ( CLEAR ?auto_26314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26310 ?auto_26312 ?auto_26311 ?auto_26315 ?auto_26313 )
      ( MAKE-1PILE ?auto_26310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26321 - BLOCK
      ?auto_26322 - BLOCK
      ?auto_26323 - BLOCK
      ?auto_26324 - BLOCK
      ?auto_26325 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26325 ) ( CLEAR ?auto_26324 ) ( ON-TABLE ?auto_26321 ) ( ON ?auto_26322 ?auto_26321 ) ( ON ?auto_26323 ?auto_26322 ) ( ON ?auto_26324 ?auto_26323 ) ( not ( = ?auto_26321 ?auto_26322 ) ) ( not ( = ?auto_26321 ?auto_26323 ) ) ( not ( = ?auto_26321 ?auto_26324 ) ) ( not ( = ?auto_26321 ?auto_26325 ) ) ( not ( = ?auto_26322 ?auto_26323 ) ) ( not ( = ?auto_26322 ?auto_26324 ) ) ( not ( = ?auto_26322 ?auto_26325 ) ) ( not ( = ?auto_26323 ?auto_26324 ) ) ( not ( = ?auto_26323 ?auto_26325 ) ) ( not ( = ?auto_26324 ?auto_26325 ) ) )
    :subtasks
    ( ( !STACK ?auto_26325 ?auto_26324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26326 - BLOCK
      ?auto_26327 - BLOCK
      ?auto_26328 - BLOCK
      ?auto_26329 - BLOCK
      ?auto_26330 - BLOCK
    )
    :vars
    (
      ?auto_26331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26329 ) ( ON-TABLE ?auto_26326 ) ( ON ?auto_26327 ?auto_26326 ) ( ON ?auto_26328 ?auto_26327 ) ( ON ?auto_26329 ?auto_26328 ) ( not ( = ?auto_26326 ?auto_26327 ) ) ( not ( = ?auto_26326 ?auto_26328 ) ) ( not ( = ?auto_26326 ?auto_26329 ) ) ( not ( = ?auto_26326 ?auto_26330 ) ) ( not ( = ?auto_26327 ?auto_26328 ) ) ( not ( = ?auto_26327 ?auto_26329 ) ) ( not ( = ?auto_26327 ?auto_26330 ) ) ( not ( = ?auto_26328 ?auto_26329 ) ) ( not ( = ?auto_26328 ?auto_26330 ) ) ( not ( = ?auto_26329 ?auto_26330 ) ) ( ON ?auto_26330 ?auto_26331 ) ( CLEAR ?auto_26330 ) ( HAND-EMPTY ) ( not ( = ?auto_26326 ?auto_26331 ) ) ( not ( = ?auto_26327 ?auto_26331 ) ) ( not ( = ?auto_26328 ?auto_26331 ) ) ( not ( = ?auto_26329 ?auto_26331 ) ) ( not ( = ?auto_26330 ?auto_26331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26330 ?auto_26331 )
      ( MAKE-5PILE ?auto_26326 ?auto_26327 ?auto_26328 ?auto_26329 ?auto_26330 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26332 - BLOCK
      ?auto_26333 - BLOCK
      ?auto_26334 - BLOCK
      ?auto_26335 - BLOCK
      ?auto_26336 - BLOCK
    )
    :vars
    (
      ?auto_26337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26332 ) ( ON ?auto_26333 ?auto_26332 ) ( ON ?auto_26334 ?auto_26333 ) ( not ( = ?auto_26332 ?auto_26333 ) ) ( not ( = ?auto_26332 ?auto_26334 ) ) ( not ( = ?auto_26332 ?auto_26335 ) ) ( not ( = ?auto_26332 ?auto_26336 ) ) ( not ( = ?auto_26333 ?auto_26334 ) ) ( not ( = ?auto_26333 ?auto_26335 ) ) ( not ( = ?auto_26333 ?auto_26336 ) ) ( not ( = ?auto_26334 ?auto_26335 ) ) ( not ( = ?auto_26334 ?auto_26336 ) ) ( not ( = ?auto_26335 ?auto_26336 ) ) ( ON ?auto_26336 ?auto_26337 ) ( CLEAR ?auto_26336 ) ( not ( = ?auto_26332 ?auto_26337 ) ) ( not ( = ?auto_26333 ?auto_26337 ) ) ( not ( = ?auto_26334 ?auto_26337 ) ) ( not ( = ?auto_26335 ?auto_26337 ) ) ( not ( = ?auto_26336 ?auto_26337 ) ) ( HOLDING ?auto_26335 ) ( CLEAR ?auto_26334 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26332 ?auto_26333 ?auto_26334 ?auto_26335 )
      ( MAKE-5PILE ?auto_26332 ?auto_26333 ?auto_26334 ?auto_26335 ?auto_26336 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26338 - BLOCK
      ?auto_26339 - BLOCK
      ?auto_26340 - BLOCK
      ?auto_26341 - BLOCK
      ?auto_26342 - BLOCK
    )
    :vars
    (
      ?auto_26343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26338 ) ( ON ?auto_26339 ?auto_26338 ) ( ON ?auto_26340 ?auto_26339 ) ( not ( = ?auto_26338 ?auto_26339 ) ) ( not ( = ?auto_26338 ?auto_26340 ) ) ( not ( = ?auto_26338 ?auto_26341 ) ) ( not ( = ?auto_26338 ?auto_26342 ) ) ( not ( = ?auto_26339 ?auto_26340 ) ) ( not ( = ?auto_26339 ?auto_26341 ) ) ( not ( = ?auto_26339 ?auto_26342 ) ) ( not ( = ?auto_26340 ?auto_26341 ) ) ( not ( = ?auto_26340 ?auto_26342 ) ) ( not ( = ?auto_26341 ?auto_26342 ) ) ( ON ?auto_26342 ?auto_26343 ) ( not ( = ?auto_26338 ?auto_26343 ) ) ( not ( = ?auto_26339 ?auto_26343 ) ) ( not ( = ?auto_26340 ?auto_26343 ) ) ( not ( = ?auto_26341 ?auto_26343 ) ) ( not ( = ?auto_26342 ?auto_26343 ) ) ( CLEAR ?auto_26340 ) ( ON ?auto_26341 ?auto_26342 ) ( CLEAR ?auto_26341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26343 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26343 ?auto_26342 )
      ( MAKE-5PILE ?auto_26338 ?auto_26339 ?auto_26340 ?auto_26341 ?auto_26342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26344 - BLOCK
      ?auto_26345 - BLOCK
      ?auto_26346 - BLOCK
      ?auto_26347 - BLOCK
      ?auto_26348 - BLOCK
    )
    :vars
    (
      ?auto_26349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26344 ) ( ON ?auto_26345 ?auto_26344 ) ( not ( = ?auto_26344 ?auto_26345 ) ) ( not ( = ?auto_26344 ?auto_26346 ) ) ( not ( = ?auto_26344 ?auto_26347 ) ) ( not ( = ?auto_26344 ?auto_26348 ) ) ( not ( = ?auto_26345 ?auto_26346 ) ) ( not ( = ?auto_26345 ?auto_26347 ) ) ( not ( = ?auto_26345 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26347 ) ) ( not ( = ?auto_26346 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( ON ?auto_26348 ?auto_26349 ) ( not ( = ?auto_26344 ?auto_26349 ) ) ( not ( = ?auto_26345 ?auto_26349 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( ON ?auto_26347 ?auto_26348 ) ( CLEAR ?auto_26347 ) ( ON-TABLE ?auto_26349 ) ( HOLDING ?auto_26346 ) ( CLEAR ?auto_26345 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26344 ?auto_26345 ?auto_26346 )
      ( MAKE-5PILE ?auto_26344 ?auto_26345 ?auto_26346 ?auto_26347 ?auto_26348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26350 - BLOCK
      ?auto_26351 - BLOCK
      ?auto_26352 - BLOCK
      ?auto_26353 - BLOCK
      ?auto_26354 - BLOCK
    )
    :vars
    (
      ?auto_26355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26350 ) ( ON ?auto_26351 ?auto_26350 ) ( not ( = ?auto_26350 ?auto_26351 ) ) ( not ( = ?auto_26350 ?auto_26352 ) ) ( not ( = ?auto_26350 ?auto_26353 ) ) ( not ( = ?auto_26350 ?auto_26354 ) ) ( not ( = ?auto_26351 ?auto_26352 ) ) ( not ( = ?auto_26351 ?auto_26353 ) ) ( not ( = ?auto_26351 ?auto_26354 ) ) ( not ( = ?auto_26352 ?auto_26353 ) ) ( not ( = ?auto_26352 ?auto_26354 ) ) ( not ( = ?auto_26353 ?auto_26354 ) ) ( ON ?auto_26354 ?auto_26355 ) ( not ( = ?auto_26350 ?auto_26355 ) ) ( not ( = ?auto_26351 ?auto_26355 ) ) ( not ( = ?auto_26352 ?auto_26355 ) ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( not ( = ?auto_26354 ?auto_26355 ) ) ( ON ?auto_26353 ?auto_26354 ) ( ON-TABLE ?auto_26355 ) ( CLEAR ?auto_26351 ) ( ON ?auto_26352 ?auto_26353 ) ( CLEAR ?auto_26352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26355 ?auto_26354 ?auto_26353 )
      ( MAKE-5PILE ?auto_26350 ?auto_26351 ?auto_26352 ?auto_26353 ?auto_26354 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26356 - BLOCK
      ?auto_26357 - BLOCK
      ?auto_26358 - BLOCK
      ?auto_26359 - BLOCK
      ?auto_26360 - BLOCK
    )
    :vars
    (
      ?auto_26361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26356 ) ( not ( = ?auto_26356 ?auto_26357 ) ) ( not ( = ?auto_26356 ?auto_26358 ) ) ( not ( = ?auto_26356 ?auto_26359 ) ) ( not ( = ?auto_26356 ?auto_26360 ) ) ( not ( = ?auto_26357 ?auto_26358 ) ) ( not ( = ?auto_26357 ?auto_26359 ) ) ( not ( = ?auto_26357 ?auto_26360 ) ) ( not ( = ?auto_26358 ?auto_26359 ) ) ( not ( = ?auto_26358 ?auto_26360 ) ) ( not ( = ?auto_26359 ?auto_26360 ) ) ( ON ?auto_26360 ?auto_26361 ) ( not ( = ?auto_26356 ?auto_26361 ) ) ( not ( = ?auto_26357 ?auto_26361 ) ) ( not ( = ?auto_26358 ?auto_26361 ) ) ( not ( = ?auto_26359 ?auto_26361 ) ) ( not ( = ?auto_26360 ?auto_26361 ) ) ( ON ?auto_26359 ?auto_26360 ) ( ON-TABLE ?auto_26361 ) ( ON ?auto_26358 ?auto_26359 ) ( CLEAR ?auto_26358 ) ( HOLDING ?auto_26357 ) ( CLEAR ?auto_26356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26356 ?auto_26357 )
      ( MAKE-5PILE ?auto_26356 ?auto_26357 ?auto_26358 ?auto_26359 ?auto_26360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26362 - BLOCK
      ?auto_26363 - BLOCK
      ?auto_26364 - BLOCK
      ?auto_26365 - BLOCK
      ?auto_26366 - BLOCK
    )
    :vars
    (
      ?auto_26367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26362 ) ( not ( = ?auto_26362 ?auto_26363 ) ) ( not ( = ?auto_26362 ?auto_26364 ) ) ( not ( = ?auto_26362 ?auto_26365 ) ) ( not ( = ?auto_26362 ?auto_26366 ) ) ( not ( = ?auto_26363 ?auto_26364 ) ) ( not ( = ?auto_26363 ?auto_26365 ) ) ( not ( = ?auto_26363 ?auto_26366 ) ) ( not ( = ?auto_26364 ?auto_26365 ) ) ( not ( = ?auto_26364 ?auto_26366 ) ) ( not ( = ?auto_26365 ?auto_26366 ) ) ( ON ?auto_26366 ?auto_26367 ) ( not ( = ?auto_26362 ?auto_26367 ) ) ( not ( = ?auto_26363 ?auto_26367 ) ) ( not ( = ?auto_26364 ?auto_26367 ) ) ( not ( = ?auto_26365 ?auto_26367 ) ) ( not ( = ?auto_26366 ?auto_26367 ) ) ( ON ?auto_26365 ?auto_26366 ) ( ON-TABLE ?auto_26367 ) ( ON ?auto_26364 ?auto_26365 ) ( CLEAR ?auto_26362 ) ( ON ?auto_26363 ?auto_26364 ) ( CLEAR ?auto_26363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26367 ?auto_26366 ?auto_26365 ?auto_26364 )
      ( MAKE-5PILE ?auto_26362 ?auto_26363 ?auto_26364 ?auto_26365 ?auto_26366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26368 - BLOCK
      ?auto_26369 - BLOCK
      ?auto_26370 - BLOCK
      ?auto_26371 - BLOCK
      ?auto_26372 - BLOCK
    )
    :vars
    (
      ?auto_26373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26368 ?auto_26369 ) ) ( not ( = ?auto_26368 ?auto_26370 ) ) ( not ( = ?auto_26368 ?auto_26371 ) ) ( not ( = ?auto_26368 ?auto_26372 ) ) ( not ( = ?auto_26369 ?auto_26370 ) ) ( not ( = ?auto_26369 ?auto_26371 ) ) ( not ( = ?auto_26369 ?auto_26372 ) ) ( not ( = ?auto_26370 ?auto_26371 ) ) ( not ( = ?auto_26370 ?auto_26372 ) ) ( not ( = ?auto_26371 ?auto_26372 ) ) ( ON ?auto_26372 ?auto_26373 ) ( not ( = ?auto_26368 ?auto_26373 ) ) ( not ( = ?auto_26369 ?auto_26373 ) ) ( not ( = ?auto_26370 ?auto_26373 ) ) ( not ( = ?auto_26371 ?auto_26373 ) ) ( not ( = ?auto_26372 ?auto_26373 ) ) ( ON ?auto_26371 ?auto_26372 ) ( ON-TABLE ?auto_26373 ) ( ON ?auto_26370 ?auto_26371 ) ( ON ?auto_26369 ?auto_26370 ) ( CLEAR ?auto_26369 ) ( HOLDING ?auto_26368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26368 )
      ( MAKE-5PILE ?auto_26368 ?auto_26369 ?auto_26370 ?auto_26371 ?auto_26372 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26374 - BLOCK
      ?auto_26375 - BLOCK
      ?auto_26376 - BLOCK
      ?auto_26377 - BLOCK
      ?auto_26378 - BLOCK
    )
    :vars
    (
      ?auto_26379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26374 ?auto_26375 ) ) ( not ( = ?auto_26374 ?auto_26376 ) ) ( not ( = ?auto_26374 ?auto_26377 ) ) ( not ( = ?auto_26374 ?auto_26378 ) ) ( not ( = ?auto_26375 ?auto_26376 ) ) ( not ( = ?auto_26375 ?auto_26377 ) ) ( not ( = ?auto_26375 ?auto_26378 ) ) ( not ( = ?auto_26376 ?auto_26377 ) ) ( not ( = ?auto_26376 ?auto_26378 ) ) ( not ( = ?auto_26377 ?auto_26378 ) ) ( ON ?auto_26378 ?auto_26379 ) ( not ( = ?auto_26374 ?auto_26379 ) ) ( not ( = ?auto_26375 ?auto_26379 ) ) ( not ( = ?auto_26376 ?auto_26379 ) ) ( not ( = ?auto_26377 ?auto_26379 ) ) ( not ( = ?auto_26378 ?auto_26379 ) ) ( ON ?auto_26377 ?auto_26378 ) ( ON-TABLE ?auto_26379 ) ( ON ?auto_26376 ?auto_26377 ) ( ON ?auto_26375 ?auto_26376 ) ( ON ?auto_26374 ?auto_26375 ) ( CLEAR ?auto_26374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26379 ?auto_26378 ?auto_26377 ?auto_26376 ?auto_26375 )
      ( MAKE-5PILE ?auto_26374 ?auto_26375 ?auto_26376 ?auto_26377 ?auto_26378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26438 - BLOCK
    )
    :vars
    (
      ?auto_26439 - BLOCK
      ?auto_26440 - BLOCK
      ?auto_26441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26438 ?auto_26439 ) ( CLEAR ?auto_26438 ) ( not ( = ?auto_26438 ?auto_26439 ) ) ( HOLDING ?auto_26440 ) ( CLEAR ?auto_26441 ) ( not ( = ?auto_26438 ?auto_26440 ) ) ( not ( = ?auto_26438 ?auto_26441 ) ) ( not ( = ?auto_26439 ?auto_26440 ) ) ( not ( = ?auto_26439 ?auto_26441 ) ) ( not ( = ?auto_26440 ?auto_26441 ) ) )
    :subtasks
    ( ( !STACK ?auto_26440 ?auto_26441 )
      ( MAKE-1PILE ?auto_26438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26442 - BLOCK
    )
    :vars
    (
      ?auto_26444 - BLOCK
      ?auto_26443 - BLOCK
      ?auto_26445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26442 ?auto_26444 ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( CLEAR ?auto_26443 ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26443 ) ) ( not ( = ?auto_26445 ?auto_26443 ) ) ( ON ?auto_26445 ?auto_26442 ) ( CLEAR ?auto_26445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26444 ?auto_26442 )
      ( MAKE-1PILE ?auto_26442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26446 - BLOCK
    )
    :vars
    (
      ?auto_26448 - BLOCK
      ?auto_26447 - BLOCK
      ?auto_26449 - BLOCK
      ?auto_26450 - BLOCK
      ?auto_26451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26446 ?auto_26448 ) ( not ( = ?auto_26446 ?auto_26448 ) ) ( not ( = ?auto_26446 ?auto_26447 ) ) ( not ( = ?auto_26446 ?auto_26449 ) ) ( not ( = ?auto_26448 ?auto_26447 ) ) ( not ( = ?auto_26448 ?auto_26449 ) ) ( not ( = ?auto_26447 ?auto_26449 ) ) ( ON ?auto_26447 ?auto_26446 ) ( CLEAR ?auto_26447 ) ( ON-TABLE ?auto_26448 ) ( HOLDING ?auto_26449 ) ( CLEAR ?auto_26450 ) ( ON-TABLE ?auto_26451 ) ( ON ?auto_26450 ?auto_26451 ) ( not ( = ?auto_26451 ?auto_26450 ) ) ( not ( = ?auto_26451 ?auto_26449 ) ) ( not ( = ?auto_26450 ?auto_26449 ) ) ( not ( = ?auto_26446 ?auto_26450 ) ) ( not ( = ?auto_26446 ?auto_26451 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26451 ) ) ( not ( = ?auto_26447 ?auto_26450 ) ) ( not ( = ?auto_26447 ?auto_26451 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26451 ?auto_26450 ?auto_26449 )
      ( MAKE-1PILE ?auto_26446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26452 - BLOCK
    )
    :vars
    (
      ?auto_26455 - BLOCK
      ?auto_26454 - BLOCK
      ?auto_26453 - BLOCK
      ?auto_26456 - BLOCK
      ?auto_26457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26452 ?auto_26455 ) ( not ( = ?auto_26452 ?auto_26455 ) ) ( not ( = ?auto_26452 ?auto_26454 ) ) ( not ( = ?auto_26452 ?auto_26453 ) ) ( not ( = ?auto_26455 ?auto_26454 ) ) ( not ( = ?auto_26455 ?auto_26453 ) ) ( not ( = ?auto_26454 ?auto_26453 ) ) ( ON ?auto_26454 ?auto_26452 ) ( ON-TABLE ?auto_26455 ) ( CLEAR ?auto_26456 ) ( ON-TABLE ?auto_26457 ) ( ON ?auto_26456 ?auto_26457 ) ( not ( = ?auto_26457 ?auto_26456 ) ) ( not ( = ?auto_26457 ?auto_26453 ) ) ( not ( = ?auto_26456 ?auto_26453 ) ) ( not ( = ?auto_26452 ?auto_26456 ) ) ( not ( = ?auto_26452 ?auto_26457 ) ) ( not ( = ?auto_26455 ?auto_26456 ) ) ( not ( = ?auto_26455 ?auto_26457 ) ) ( not ( = ?auto_26454 ?auto_26456 ) ) ( not ( = ?auto_26454 ?auto_26457 ) ) ( ON ?auto_26453 ?auto_26454 ) ( CLEAR ?auto_26453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26455 ?auto_26452 ?auto_26454 )
      ( MAKE-1PILE ?auto_26452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26458 - BLOCK
    )
    :vars
    (
      ?auto_26461 - BLOCK
      ?auto_26462 - BLOCK
      ?auto_26463 - BLOCK
      ?auto_26459 - BLOCK
      ?auto_26460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26458 ?auto_26461 ) ( not ( = ?auto_26458 ?auto_26461 ) ) ( not ( = ?auto_26458 ?auto_26462 ) ) ( not ( = ?auto_26458 ?auto_26463 ) ) ( not ( = ?auto_26461 ?auto_26462 ) ) ( not ( = ?auto_26461 ?auto_26463 ) ) ( not ( = ?auto_26462 ?auto_26463 ) ) ( ON ?auto_26462 ?auto_26458 ) ( ON-TABLE ?auto_26461 ) ( ON-TABLE ?auto_26459 ) ( not ( = ?auto_26459 ?auto_26460 ) ) ( not ( = ?auto_26459 ?auto_26463 ) ) ( not ( = ?auto_26460 ?auto_26463 ) ) ( not ( = ?auto_26458 ?auto_26460 ) ) ( not ( = ?auto_26458 ?auto_26459 ) ) ( not ( = ?auto_26461 ?auto_26460 ) ) ( not ( = ?auto_26461 ?auto_26459 ) ) ( not ( = ?auto_26462 ?auto_26460 ) ) ( not ( = ?auto_26462 ?auto_26459 ) ) ( ON ?auto_26463 ?auto_26462 ) ( CLEAR ?auto_26463 ) ( HOLDING ?auto_26460 ) ( CLEAR ?auto_26459 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26459 ?auto_26460 )
      ( MAKE-1PILE ?auto_26458 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26464 - BLOCK
    )
    :vars
    (
      ?auto_26469 - BLOCK
      ?auto_26465 - BLOCK
      ?auto_26466 - BLOCK
      ?auto_26468 - BLOCK
      ?auto_26467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26464 ?auto_26469 ) ( not ( = ?auto_26464 ?auto_26469 ) ) ( not ( = ?auto_26464 ?auto_26465 ) ) ( not ( = ?auto_26464 ?auto_26466 ) ) ( not ( = ?auto_26469 ?auto_26465 ) ) ( not ( = ?auto_26469 ?auto_26466 ) ) ( not ( = ?auto_26465 ?auto_26466 ) ) ( ON ?auto_26465 ?auto_26464 ) ( ON-TABLE ?auto_26469 ) ( ON-TABLE ?auto_26468 ) ( not ( = ?auto_26468 ?auto_26467 ) ) ( not ( = ?auto_26468 ?auto_26466 ) ) ( not ( = ?auto_26467 ?auto_26466 ) ) ( not ( = ?auto_26464 ?auto_26467 ) ) ( not ( = ?auto_26464 ?auto_26468 ) ) ( not ( = ?auto_26469 ?auto_26467 ) ) ( not ( = ?auto_26469 ?auto_26468 ) ) ( not ( = ?auto_26465 ?auto_26467 ) ) ( not ( = ?auto_26465 ?auto_26468 ) ) ( ON ?auto_26466 ?auto_26465 ) ( CLEAR ?auto_26468 ) ( ON ?auto_26467 ?auto_26466 ) ( CLEAR ?auto_26467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26469 ?auto_26464 ?auto_26465 ?auto_26466 )
      ( MAKE-1PILE ?auto_26464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26470 - BLOCK
    )
    :vars
    (
      ?auto_26473 - BLOCK
      ?auto_26474 - BLOCK
      ?auto_26472 - BLOCK
      ?auto_26475 - BLOCK
      ?auto_26471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26470 ?auto_26473 ) ( not ( = ?auto_26470 ?auto_26473 ) ) ( not ( = ?auto_26470 ?auto_26474 ) ) ( not ( = ?auto_26470 ?auto_26472 ) ) ( not ( = ?auto_26473 ?auto_26474 ) ) ( not ( = ?auto_26473 ?auto_26472 ) ) ( not ( = ?auto_26474 ?auto_26472 ) ) ( ON ?auto_26474 ?auto_26470 ) ( ON-TABLE ?auto_26473 ) ( not ( = ?auto_26475 ?auto_26471 ) ) ( not ( = ?auto_26475 ?auto_26472 ) ) ( not ( = ?auto_26471 ?auto_26472 ) ) ( not ( = ?auto_26470 ?auto_26471 ) ) ( not ( = ?auto_26470 ?auto_26475 ) ) ( not ( = ?auto_26473 ?auto_26471 ) ) ( not ( = ?auto_26473 ?auto_26475 ) ) ( not ( = ?auto_26474 ?auto_26471 ) ) ( not ( = ?auto_26474 ?auto_26475 ) ) ( ON ?auto_26472 ?auto_26474 ) ( ON ?auto_26471 ?auto_26472 ) ( CLEAR ?auto_26471 ) ( HOLDING ?auto_26475 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26475 )
      ( MAKE-1PILE ?auto_26470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26476 - BLOCK
    )
    :vars
    (
      ?auto_26479 - BLOCK
      ?auto_26481 - BLOCK
      ?auto_26478 - BLOCK
      ?auto_26477 - BLOCK
      ?auto_26480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26476 ?auto_26479 ) ( not ( = ?auto_26476 ?auto_26479 ) ) ( not ( = ?auto_26476 ?auto_26481 ) ) ( not ( = ?auto_26476 ?auto_26478 ) ) ( not ( = ?auto_26479 ?auto_26481 ) ) ( not ( = ?auto_26479 ?auto_26478 ) ) ( not ( = ?auto_26481 ?auto_26478 ) ) ( ON ?auto_26481 ?auto_26476 ) ( ON-TABLE ?auto_26479 ) ( not ( = ?auto_26477 ?auto_26480 ) ) ( not ( = ?auto_26477 ?auto_26478 ) ) ( not ( = ?auto_26480 ?auto_26478 ) ) ( not ( = ?auto_26476 ?auto_26480 ) ) ( not ( = ?auto_26476 ?auto_26477 ) ) ( not ( = ?auto_26479 ?auto_26480 ) ) ( not ( = ?auto_26479 ?auto_26477 ) ) ( not ( = ?auto_26481 ?auto_26480 ) ) ( not ( = ?auto_26481 ?auto_26477 ) ) ( ON ?auto_26478 ?auto_26481 ) ( ON ?auto_26480 ?auto_26478 ) ( ON ?auto_26477 ?auto_26480 ) ( CLEAR ?auto_26477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26479 ?auto_26476 ?auto_26481 ?auto_26478 ?auto_26480 )
      ( MAKE-1PILE ?auto_26476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26489 - BLOCK
      ?auto_26490 - BLOCK
      ?auto_26491 - BLOCK
    )
    :vars
    (
      ?auto_26492 - BLOCK
      ?auto_26493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26492 ?auto_26491 ) ( CLEAR ?auto_26492 ) ( ON-TABLE ?auto_26489 ) ( ON ?auto_26490 ?auto_26489 ) ( ON ?auto_26491 ?auto_26490 ) ( not ( = ?auto_26489 ?auto_26490 ) ) ( not ( = ?auto_26489 ?auto_26491 ) ) ( not ( = ?auto_26489 ?auto_26492 ) ) ( not ( = ?auto_26490 ?auto_26491 ) ) ( not ( = ?auto_26490 ?auto_26492 ) ) ( not ( = ?auto_26491 ?auto_26492 ) ) ( HOLDING ?auto_26493 ) ( not ( = ?auto_26489 ?auto_26493 ) ) ( not ( = ?auto_26490 ?auto_26493 ) ) ( not ( = ?auto_26491 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26493 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_26493 )
      ( MAKE-3PILE ?auto_26489 ?auto_26490 ?auto_26491 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26542 - BLOCK
      ?auto_26543 - BLOCK
    )
    :vars
    (
      ?auto_26544 - BLOCK
      ?auto_26546 - BLOCK
      ?auto_26545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26542 ?auto_26543 ) ) ( ON ?auto_26543 ?auto_26544 ) ( not ( = ?auto_26542 ?auto_26544 ) ) ( not ( = ?auto_26543 ?auto_26544 ) ) ( ON ?auto_26542 ?auto_26543 ) ( CLEAR ?auto_26542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26546 ) ( ON ?auto_26545 ?auto_26546 ) ( ON ?auto_26544 ?auto_26545 ) ( not ( = ?auto_26546 ?auto_26545 ) ) ( not ( = ?auto_26546 ?auto_26544 ) ) ( not ( = ?auto_26546 ?auto_26543 ) ) ( not ( = ?auto_26546 ?auto_26542 ) ) ( not ( = ?auto_26545 ?auto_26544 ) ) ( not ( = ?auto_26545 ?auto_26543 ) ) ( not ( = ?auto_26545 ?auto_26542 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26546 ?auto_26545 ?auto_26544 ?auto_26543 )
      ( MAKE-2PILE ?auto_26542 ?auto_26543 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26549 - BLOCK
      ?auto_26550 - BLOCK
    )
    :vars
    (
      ?auto_26551 - BLOCK
      ?auto_26552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26549 ?auto_26550 ) ) ( ON ?auto_26550 ?auto_26551 ) ( CLEAR ?auto_26550 ) ( not ( = ?auto_26549 ?auto_26551 ) ) ( not ( = ?auto_26550 ?auto_26551 ) ) ( ON ?auto_26549 ?auto_26552 ) ( CLEAR ?auto_26549 ) ( HAND-EMPTY ) ( not ( = ?auto_26549 ?auto_26552 ) ) ( not ( = ?auto_26550 ?auto_26552 ) ) ( not ( = ?auto_26551 ?auto_26552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26549 ?auto_26552 )
      ( MAKE-2PILE ?auto_26549 ?auto_26550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26553 - BLOCK
      ?auto_26554 - BLOCK
    )
    :vars
    (
      ?auto_26556 - BLOCK
      ?auto_26555 - BLOCK
      ?auto_26558 - BLOCK
      ?auto_26557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26553 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26556 ) ) ( not ( = ?auto_26554 ?auto_26556 ) ) ( ON ?auto_26553 ?auto_26555 ) ( CLEAR ?auto_26553 ) ( not ( = ?auto_26553 ?auto_26555 ) ) ( not ( = ?auto_26554 ?auto_26555 ) ) ( not ( = ?auto_26556 ?auto_26555 ) ) ( HOLDING ?auto_26554 ) ( CLEAR ?auto_26556 ) ( ON-TABLE ?auto_26558 ) ( ON ?auto_26557 ?auto_26558 ) ( ON ?auto_26556 ?auto_26557 ) ( not ( = ?auto_26558 ?auto_26557 ) ) ( not ( = ?auto_26558 ?auto_26556 ) ) ( not ( = ?auto_26558 ?auto_26554 ) ) ( not ( = ?auto_26557 ?auto_26556 ) ) ( not ( = ?auto_26557 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26558 ) ) ( not ( = ?auto_26553 ?auto_26557 ) ) ( not ( = ?auto_26555 ?auto_26558 ) ) ( not ( = ?auto_26555 ?auto_26557 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26558 ?auto_26557 ?auto_26556 ?auto_26554 )
      ( MAKE-2PILE ?auto_26553 ?auto_26554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26559 - BLOCK
      ?auto_26560 - BLOCK
    )
    :vars
    (
      ?auto_26562 - BLOCK
      ?auto_26561 - BLOCK
      ?auto_26563 - BLOCK
      ?auto_26564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26559 ?auto_26560 ) ) ( not ( = ?auto_26559 ?auto_26562 ) ) ( not ( = ?auto_26560 ?auto_26562 ) ) ( ON ?auto_26559 ?auto_26561 ) ( not ( = ?auto_26559 ?auto_26561 ) ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( not ( = ?auto_26562 ?auto_26561 ) ) ( CLEAR ?auto_26562 ) ( ON-TABLE ?auto_26563 ) ( ON ?auto_26564 ?auto_26563 ) ( ON ?auto_26562 ?auto_26564 ) ( not ( = ?auto_26563 ?auto_26564 ) ) ( not ( = ?auto_26563 ?auto_26562 ) ) ( not ( = ?auto_26563 ?auto_26560 ) ) ( not ( = ?auto_26564 ?auto_26562 ) ) ( not ( = ?auto_26564 ?auto_26560 ) ) ( not ( = ?auto_26559 ?auto_26563 ) ) ( not ( = ?auto_26559 ?auto_26564 ) ) ( not ( = ?auto_26561 ?auto_26563 ) ) ( not ( = ?auto_26561 ?auto_26564 ) ) ( ON ?auto_26560 ?auto_26559 ) ( CLEAR ?auto_26560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26561 ?auto_26559 )
      ( MAKE-2PILE ?auto_26559 ?auto_26560 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26565 - BLOCK
      ?auto_26566 - BLOCK
    )
    :vars
    (
      ?auto_26567 - BLOCK
      ?auto_26569 - BLOCK
      ?auto_26570 - BLOCK
      ?auto_26568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26565 ?auto_26566 ) ) ( not ( = ?auto_26565 ?auto_26567 ) ) ( not ( = ?auto_26566 ?auto_26567 ) ) ( ON ?auto_26565 ?auto_26569 ) ( not ( = ?auto_26565 ?auto_26569 ) ) ( not ( = ?auto_26566 ?auto_26569 ) ) ( not ( = ?auto_26567 ?auto_26569 ) ) ( ON-TABLE ?auto_26570 ) ( ON ?auto_26568 ?auto_26570 ) ( not ( = ?auto_26570 ?auto_26568 ) ) ( not ( = ?auto_26570 ?auto_26567 ) ) ( not ( = ?auto_26570 ?auto_26566 ) ) ( not ( = ?auto_26568 ?auto_26567 ) ) ( not ( = ?auto_26568 ?auto_26566 ) ) ( not ( = ?auto_26565 ?auto_26570 ) ) ( not ( = ?auto_26565 ?auto_26568 ) ) ( not ( = ?auto_26569 ?auto_26570 ) ) ( not ( = ?auto_26569 ?auto_26568 ) ) ( ON ?auto_26566 ?auto_26565 ) ( CLEAR ?auto_26566 ) ( ON-TABLE ?auto_26569 ) ( HOLDING ?auto_26567 ) ( CLEAR ?auto_26568 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26570 ?auto_26568 ?auto_26567 )
      ( MAKE-2PILE ?auto_26565 ?auto_26566 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26571 - BLOCK
      ?auto_26572 - BLOCK
    )
    :vars
    (
      ?auto_26574 - BLOCK
      ?auto_26576 - BLOCK
      ?auto_26573 - BLOCK
      ?auto_26575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26571 ?auto_26572 ) ) ( not ( = ?auto_26571 ?auto_26574 ) ) ( not ( = ?auto_26572 ?auto_26574 ) ) ( ON ?auto_26571 ?auto_26576 ) ( not ( = ?auto_26571 ?auto_26576 ) ) ( not ( = ?auto_26572 ?auto_26576 ) ) ( not ( = ?auto_26574 ?auto_26576 ) ) ( ON-TABLE ?auto_26573 ) ( ON ?auto_26575 ?auto_26573 ) ( not ( = ?auto_26573 ?auto_26575 ) ) ( not ( = ?auto_26573 ?auto_26574 ) ) ( not ( = ?auto_26573 ?auto_26572 ) ) ( not ( = ?auto_26575 ?auto_26574 ) ) ( not ( = ?auto_26575 ?auto_26572 ) ) ( not ( = ?auto_26571 ?auto_26573 ) ) ( not ( = ?auto_26571 ?auto_26575 ) ) ( not ( = ?auto_26576 ?auto_26573 ) ) ( not ( = ?auto_26576 ?auto_26575 ) ) ( ON ?auto_26572 ?auto_26571 ) ( ON-TABLE ?auto_26576 ) ( CLEAR ?auto_26575 ) ( ON ?auto_26574 ?auto_26572 ) ( CLEAR ?auto_26574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26576 ?auto_26571 ?auto_26572 )
      ( MAKE-2PILE ?auto_26571 ?auto_26572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26577 - BLOCK
      ?auto_26578 - BLOCK
    )
    :vars
    (
      ?auto_26582 - BLOCK
      ?auto_26580 - BLOCK
      ?auto_26579 - BLOCK
      ?auto_26581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26577 ?auto_26578 ) ) ( not ( = ?auto_26577 ?auto_26582 ) ) ( not ( = ?auto_26578 ?auto_26582 ) ) ( ON ?auto_26577 ?auto_26580 ) ( not ( = ?auto_26577 ?auto_26580 ) ) ( not ( = ?auto_26578 ?auto_26580 ) ) ( not ( = ?auto_26582 ?auto_26580 ) ) ( ON-TABLE ?auto_26579 ) ( not ( = ?auto_26579 ?auto_26581 ) ) ( not ( = ?auto_26579 ?auto_26582 ) ) ( not ( = ?auto_26579 ?auto_26578 ) ) ( not ( = ?auto_26581 ?auto_26582 ) ) ( not ( = ?auto_26581 ?auto_26578 ) ) ( not ( = ?auto_26577 ?auto_26579 ) ) ( not ( = ?auto_26577 ?auto_26581 ) ) ( not ( = ?auto_26580 ?auto_26579 ) ) ( not ( = ?auto_26580 ?auto_26581 ) ) ( ON ?auto_26578 ?auto_26577 ) ( ON-TABLE ?auto_26580 ) ( ON ?auto_26582 ?auto_26578 ) ( CLEAR ?auto_26582 ) ( HOLDING ?auto_26581 ) ( CLEAR ?auto_26579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26579 ?auto_26581 )
      ( MAKE-2PILE ?auto_26577 ?auto_26578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26583 - BLOCK
      ?auto_26584 - BLOCK
    )
    :vars
    (
      ?auto_26586 - BLOCK
      ?auto_26587 - BLOCK
      ?auto_26588 - BLOCK
      ?auto_26585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26583 ?auto_26584 ) ) ( not ( = ?auto_26583 ?auto_26586 ) ) ( not ( = ?auto_26584 ?auto_26586 ) ) ( ON ?auto_26583 ?auto_26587 ) ( not ( = ?auto_26583 ?auto_26587 ) ) ( not ( = ?auto_26584 ?auto_26587 ) ) ( not ( = ?auto_26586 ?auto_26587 ) ) ( ON-TABLE ?auto_26588 ) ( not ( = ?auto_26588 ?auto_26585 ) ) ( not ( = ?auto_26588 ?auto_26586 ) ) ( not ( = ?auto_26588 ?auto_26584 ) ) ( not ( = ?auto_26585 ?auto_26586 ) ) ( not ( = ?auto_26585 ?auto_26584 ) ) ( not ( = ?auto_26583 ?auto_26588 ) ) ( not ( = ?auto_26583 ?auto_26585 ) ) ( not ( = ?auto_26587 ?auto_26588 ) ) ( not ( = ?auto_26587 ?auto_26585 ) ) ( ON ?auto_26584 ?auto_26583 ) ( ON-TABLE ?auto_26587 ) ( ON ?auto_26586 ?auto_26584 ) ( CLEAR ?auto_26588 ) ( ON ?auto_26585 ?auto_26586 ) ( CLEAR ?auto_26585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26587 ?auto_26583 ?auto_26584 ?auto_26586 )
      ( MAKE-2PILE ?auto_26583 ?auto_26584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26589 - BLOCK
      ?auto_26590 - BLOCK
    )
    :vars
    (
      ?auto_26592 - BLOCK
      ?auto_26594 - BLOCK
      ?auto_26593 - BLOCK
      ?auto_26591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26589 ?auto_26590 ) ) ( not ( = ?auto_26589 ?auto_26592 ) ) ( not ( = ?auto_26590 ?auto_26592 ) ) ( ON ?auto_26589 ?auto_26594 ) ( not ( = ?auto_26589 ?auto_26594 ) ) ( not ( = ?auto_26590 ?auto_26594 ) ) ( not ( = ?auto_26592 ?auto_26594 ) ) ( not ( = ?auto_26593 ?auto_26591 ) ) ( not ( = ?auto_26593 ?auto_26592 ) ) ( not ( = ?auto_26593 ?auto_26590 ) ) ( not ( = ?auto_26591 ?auto_26592 ) ) ( not ( = ?auto_26591 ?auto_26590 ) ) ( not ( = ?auto_26589 ?auto_26593 ) ) ( not ( = ?auto_26589 ?auto_26591 ) ) ( not ( = ?auto_26594 ?auto_26593 ) ) ( not ( = ?auto_26594 ?auto_26591 ) ) ( ON ?auto_26590 ?auto_26589 ) ( ON-TABLE ?auto_26594 ) ( ON ?auto_26592 ?auto_26590 ) ( ON ?auto_26591 ?auto_26592 ) ( CLEAR ?auto_26591 ) ( HOLDING ?auto_26593 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26593 )
      ( MAKE-2PILE ?auto_26589 ?auto_26590 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26595 - BLOCK
      ?auto_26596 - BLOCK
    )
    :vars
    (
      ?auto_26600 - BLOCK
      ?auto_26599 - BLOCK
      ?auto_26598 - BLOCK
      ?auto_26597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26595 ?auto_26596 ) ) ( not ( = ?auto_26595 ?auto_26600 ) ) ( not ( = ?auto_26596 ?auto_26600 ) ) ( ON ?auto_26595 ?auto_26599 ) ( not ( = ?auto_26595 ?auto_26599 ) ) ( not ( = ?auto_26596 ?auto_26599 ) ) ( not ( = ?auto_26600 ?auto_26599 ) ) ( not ( = ?auto_26598 ?auto_26597 ) ) ( not ( = ?auto_26598 ?auto_26600 ) ) ( not ( = ?auto_26598 ?auto_26596 ) ) ( not ( = ?auto_26597 ?auto_26600 ) ) ( not ( = ?auto_26597 ?auto_26596 ) ) ( not ( = ?auto_26595 ?auto_26598 ) ) ( not ( = ?auto_26595 ?auto_26597 ) ) ( not ( = ?auto_26599 ?auto_26598 ) ) ( not ( = ?auto_26599 ?auto_26597 ) ) ( ON ?auto_26596 ?auto_26595 ) ( ON-TABLE ?auto_26599 ) ( ON ?auto_26600 ?auto_26596 ) ( ON ?auto_26597 ?auto_26600 ) ( ON ?auto_26598 ?auto_26597 ) ( CLEAR ?auto_26598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26599 ?auto_26595 ?auto_26596 ?auto_26600 ?auto_26597 )
      ( MAKE-2PILE ?auto_26595 ?auto_26596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26616 - BLOCK
      ?auto_26617 - BLOCK
    )
    :vars
    (
      ?auto_26619 - BLOCK
      ?auto_26618 - BLOCK
      ?auto_26620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26619 ?auto_26617 ) ( ON-TABLE ?auto_26616 ) ( ON ?auto_26617 ?auto_26616 ) ( not ( = ?auto_26616 ?auto_26617 ) ) ( not ( = ?auto_26616 ?auto_26619 ) ) ( not ( = ?auto_26617 ?auto_26619 ) ) ( not ( = ?auto_26616 ?auto_26618 ) ) ( not ( = ?auto_26616 ?auto_26620 ) ) ( not ( = ?auto_26617 ?auto_26618 ) ) ( not ( = ?auto_26617 ?auto_26620 ) ) ( not ( = ?auto_26619 ?auto_26618 ) ) ( not ( = ?auto_26619 ?auto_26620 ) ) ( not ( = ?auto_26618 ?auto_26620 ) ) ( ON ?auto_26618 ?auto_26619 ) ( CLEAR ?auto_26618 ) ( HOLDING ?auto_26620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26620 )
      ( MAKE-2PILE ?auto_26616 ?auto_26617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26663 - BLOCK
      ?auto_26664 - BLOCK
      ?auto_26665 - BLOCK
    )
    :vars
    (
      ?auto_26666 - BLOCK
      ?auto_26667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26663 ) ( not ( = ?auto_26663 ?auto_26664 ) ) ( not ( = ?auto_26663 ?auto_26665 ) ) ( not ( = ?auto_26664 ?auto_26665 ) ) ( ON ?auto_26665 ?auto_26666 ) ( not ( = ?auto_26663 ?auto_26666 ) ) ( not ( = ?auto_26664 ?auto_26666 ) ) ( not ( = ?auto_26665 ?auto_26666 ) ) ( CLEAR ?auto_26663 ) ( ON ?auto_26664 ?auto_26665 ) ( CLEAR ?auto_26664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26667 ) ( ON ?auto_26666 ?auto_26667 ) ( not ( = ?auto_26667 ?auto_26666 ) ) ( not ( = ?auto_26667 ?auto_26665 ) ) ( not ( = ?auto_26667 ?auto_26664 ) ) ( not ( = ?auto_26663 ?auto_26667 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26667 ?auto_26666 ?auto_26665 )
      ( MAKE-3PILE ?auto_26663 ?auto_26664 ?auto_26665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26668 - BLOCK
      ?auto_26669 - BLOCK
      ?auto_26670 - BLOCK
    )
    :vars
    (
      ?auto_26672 - BLOCK
      ?auto_26671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26668 ?auto_26669 ) ) ( not ( = ?auto_26668 ?auto_26670 ) ) ( not ( = ?auto_26669 ?auto_26670 ) ) ( ON ?auto_26670 ?auto_26672 ) ( not ( = ?auto_26668 ?auto_26672 ) ) ( not ( = ?auto_26669 ?auto_26672 ) ) ( not ( = ?auto_26670 ?auto_26672 ) ) ( ON ?auto_26669 ?auto_26670 ) ( CLEAR ?auto_26669 ) ( ON-TABLE ?auto_26671 ) ( ON ?auto_26672 ?auto_26671 ) ( not ( = ?auto_26671 ?auto_26672 ) ) ( not ( = ?auto_26671 ?auto_26670 ) ) ( not ( = ?auto_26671 ?auto_26669 ) ) ( not ( = ?auto_26668 ?auto_26671 ) ) ( HOLDING ?auto_26668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26668 )
      ( MAKE-3PILE ?auto_26668 ?auto_26669 ?auto_26670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26673 - BLOCK
      ?auto_26674 - BLOCK
      ?auto_26675 - BLOCK
    )
    :vars
    (
      ?auto_26677 - BLOCK
      ?auto_26676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26673 ?auto_26674 ) ) ( not ( = ?auto_26673 ?auto_26675 ) ) ( not ( = ?auto_26674 ?auto_26675 ) ) ( ON ?auto_26675 ?auto_26677 ) ( not ( = ?auto_26673 ?auto_26677 ) ) ( not ( = ?auto_26674 ?auto_26677 ) ) ( not ( = ?auto_26675 ?auto_26677 ) ) ( ON ?auto_26674 ?auto_26675 ) ( ON-TABLE ?auto_26676 ) ( ON ?auto_26677 ?auto_26676 ) ( not ( = ?auto_26676 ?auto_26677 ) ) ( not ( = ?auto_26676 ?auto_26675 ) ) ( not ( = ?auto_26676 ?auto_26674 ) ) ( not ( = ?auto_26673 ?auto_26676 ) ) ( ON ?auto_26673 ?auto_26674 ) ( CLEAR ?auto_26673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26676 ?auto_26677 ?auto_26675 ?auto_26674 )
      ( MAKE-3PILE ?auto_26673 ?auto_26674 ?auto_26675 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26681 - BLOCK
      ?auto_26682 - BLOCK
      ?auto_26683 - BLOCK
    )
    :vars
    (
      ?auto_26684 - BLOCK
      ?auto_26685 - BLOCK
      ?auto_26686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26681 ?auto_26682 ) ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( ON ?auto_26683 ?auto_26684 ) ( not ( = ?auto_26681 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26683 ?auto_26684 ) ) ( ON ?auto_26682 ?auto_26683 ) ( CLEAR ?auto_26682 ) ( ON-TABLE ?auto_26685 ) ( ON ?auto_26684 ?auto_26685 ) ( not ( = ?auto_26685 ?auto_26684 ) ) ( not ( = ?auto_26685 ?auto_26683 ) ) ( not ( = ?auto_26685 ?auto_26682 ) ) ( not ( = ?auto_26681 ?auto_26685 ) ) ( ON ?auto_26681 ?auto_26686 ) ( CLEAR ?auto_26681 ) ( HAND-EMPTY ) ( not ( = ?auto_26681 ?auto_26686 ) ) ( not ( = ?auto_26682 ?auto_26686 ) ) ( not ( = ?auto_26683 ?auto_26686 ) ) ( not ( = ?auto_26684 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26681 ?auto_26686 )
      ( MAKE-3PILE ?auto_26681 ?auto_26682 ?auto_26683 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26687 - BLOCK
      ?auto_26688 - BLOCK
      ?auto_26689 - BLOCK
    )
    :vars
    (
      ?auto_26691 - BLOCK
      ?auto_26690 - BLOCK
      ?auto_26692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26687 ?auto_26688 ) ) ( not ( = ?auto_26687 ?auto_26689 ) ) ( not ( = ?auto_26688 ?auto_26689 ) ) ( ON ?auto_26689 ?auto_26691 ) ( not ( = ?auto_26687 ?auto_26691 ) ) ( not ( = ?auto_26688 ?auto_26691 ) ) ( not ( = ?auto_26689 ?auto_26691 ) ) ( ON-TABLE ?auto_26690 ) ( ON ?auto_26691 ?auto_26690 ) ( not ( = ?auto_26690 ?auto_26691 ) ) ( not ( = ?auto_26690 ?auto_26689 ) ) ( not ( = ?auto_26690 ?auto_26688 ) ) ( not ( = ?auto_26687 ?auto_26690 ) ) ( ON ?auto_26687 ?auto_26692 ) ( CLEAR ?auto_26687 ) ( not ( = ?auto_26687 ?auto_26692 ) ) ( not ( = ?auto_26688 ?auto_26692 ) ) ( not ( = ?auto_26689 ?auto_26692 ) ) ( not ( = ?auto_26691 ?auto_26692 ) ) ( not ( = ?auto_26690 ?auto_26692 ) ) ( HOLDING ?auto_26688 ) ( CLEAR ?auto_26689 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26690 ?auto_26691 ?auto_26689 ?auto_26688 )
      ( MAKE-3PILE ?auto_26687 ?auto_26688 ?auto_26689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26693 - BLOCK
      ?auto_26694 - BLOCK
      ?auto_26695 - BLOCK
    )
    :vars
    (
      ?auto_26697 - BLOCK
      ?auto_26696 - BLOCK
      ?auto_26698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26693 ?auto_26694 ) ) ( not ( = ?auto_26693 ?auto_26695 ) ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( ON ?auto_26695 ?auto_26697 ) ( not ( = ?auto_26693 ?auto_26697 ) ) ( not ( = ?auto_26694 ?auto_26697 ) ) ( not ( = ?auto_26695 ?auto_26697 ) ) ( ON-TABLE ?auto_26696 ) ( ON ?auto_26697 ?auto_26696 ) ( not ( = ?auto_26696 ?auto_26697 ) ) ( not ( = ?auto_26696 ?auto_26695 ) ) ( not ( = ?auto_26696 ?auto_26694 ) ) ( not ( = ?auto_26693 ?auto_26696 ) ) ( ON ?auto_26693 ?auto_26698 ) ( not ( = ?auto_26693 ?auto_26698 ) ) ( not ( = ?auto_26694 ?auto_26698 ) ) ( not ( = ?auto_26695 ?auto_26698 ) ) ( not ( = ?auto_26697 ?auto_26698 ) ) ( not ( = ?auto_26696 ?auto_26698 ) ) ( CLEAR ?auto_26695 ) ( ON ?auto_26694 ?auto_26693 ) ( CLEAR ?auto_26694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26698 ?auto_26693 )
      ( MAKE-3PILE ?auto_26693 ?auto_26694 ?auto_26695 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26699 - BLOCK
      ?auto_26700 - BLOCK
      ?auto_26701 - BLOCK
    )
    :vars
    (
      ?auto_26704 - BLOCK
      ?auto_26702 - BLOCK
      ?auto_26703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26699 ?auto_26700 ) ) ( not ( = ?auto_26699 ?auto_26701 ) ) ( not ( = ?auto_26700 ?auto_26701 ) ) ( not ( = ?auto_26699 ?auto_26704 ) ) ( not ( = ?auto_26700 ?auto_26704 ) ) ( not ( = ?auto_26701 ?auto_26704 ) ) ( ON-TABLE ?auto_26702 ) ( ON ?auto_26704 ?auto_26702 ) ( not ( = ?auto_26702 ?auto_26704 ) ) ( not ( = ?auto_26702 ?auto_26701 ) ) ( not ( = ?auto_26702 ?auto_26700 ) ) ( not ( = ?auto_26699 ?auto_26702 ) ) ( ON ?auto_26699 ?auto_26703 ) ( not ( = ?auto_26699 ?auto_26703 ) ) ( not ( = ?auto_26700 ?auto_26703 ) ) ( not ( = ?auto_26701 ?auto_26703 ) ) ( not ( = ?auto_26704 ?auto_26703 ) ) ( not ( = ?auto_26702 ?auto_26703 ) ) ( ON ?auto_26700 ?auto_26699 ) ( CLEAR ?auto_26700 ) ( ON-TABLE ?auto_26703 ) ( HOLDING ?auto_26701 ) ( CLEAR ?auto_26704 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26702 ?auto_26704 ?auto_26701 )
      ( MAKE-3PILE ?auto_26699 ?auto_26700 ?auto_26701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26705 - BLOCK
      ?auto_26706 - BLOCK
      ?auto_26707 - BLOCK
    )
    :vars
    (
      ?auto_26708 - BLOCK
      ?auto_26710 - BLOCK
      ?auto_26709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26705 ?auto_26706 ) ) ( not ( = ?auto_26705 ?auto_26707 ) ) ( not ( = ?auto_26706 ?auto_26707 ) ) ( not ( = ?auto_26705 ?auto_26708 ) ) ( not ( = ?auto_26706 ?auto_26708 ) ) ( not ( = ?auto_26707 ?auto_26708 ) ) ( ON-TABLE ?auto_26710 ) ( ON ?auto_26708 ?auto_26710 ) ( not ( = ?auto_26710 ?auto_26708 ) ) ( not ( = ?auto_26710 ?auto_26707 ) ) ( not ( = ?auto_26710 ?auto_26706 ) ) ( not ( = ?auto_26705 ?auto_26710 ) ) ( ON ?auto_26705 ?auto_26709 ) ( not ( = ?auto_26705 ?auto_26709 ) ) ( not ( = ?auto_26706 ?auto_26709 ) ) ( not ( = ?auto_26707 ?auto_26709 ) ) ( not ( = ?auto_26708 ?auto_26709 ) ) ( not ( = ?auto_26710 ?auto_26709 ) ) ( ON ?auto_26706 ?auto_26705 ) ( ON-TABLE ?auto_26709 ) ( CLEAR ?auto_26708 ) ( ON ?auto_26707 ?auto_26706 ) ( CLEAR ?auto_26707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26709 ?auto_26705 ?auto_26706 )
      ( MAKE-3PILE ?auto_26705 ?auto_26706 ?auto_26707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26711 - BLOCK
      ?auto_26712 - BLOCK
      ?auto_26713 - BLOCK
    )
    :vars
    (
      ?auto_26715 - BLOCK
      ?auto_26716 - BLOCK
      ?auto_26714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26711 ?auto_26712 ) ) ( not ( = ?auto_26711 ?auto_26713 ) ) ( not ( = ?auto_26712 ?auto_26713 ) ) ( not ( = ?auto_26711 ?auto_26715 ) ) ( not ( = ?auto_26712 ?auto_26715 ) ) ( not ( = ?auto_26713 ?auto_26715 ) ) ( ON-TABLE ?auto_26716 ) ( not ( = ?auto_26716 ?auto_26715 ) ) ( not ( = ?auto_26716 ?auto_26713 ) ) ( not ( = ?auto_26716 ?auto_26712 ) ) ( not ( = ?auto_26711 ?auto_26716 ) ) ( ON ?auto_26711 ?auto_26714 ) ( not ( = ?auto_26711 ?auto_26714 ) ) ( not ( = ?auto_26712 ?auto_26714 ) ) ( not ( = ?auto_26713 ?auto_26714 ) ) ( not ( = ?auto_26715 ?auto_26714 ) ) ( not ( = ?auto_26716 ?auto_26714 ) ) ( ON ?auto_26712 ?auto_26711 ) ( ON-TABLE ?auto_26714 ) ( ON ?auto_26713 ?auto_26712 ) ( CLEAR ?auto_26713 ) ( HOLDING ?auto_26715 ) ( CLEAR ?auto_26716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26716 ?auto_26715 )
      ( MAKE-3PILE ?auto_26711 ?auto_26712 ?auto_26713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26717 - BLOCK
      ?auto_26718 - BLOCK
      ?auto_26719 - BLOCK
    )
    :vars
    (
      ?auto_26721 - BLOCK
      ?auto_26722 - BLOCK
      ?auto_26720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26717 ?auto_26718 ) ) ( not ( = ?auto_26717 ?auto_26719 ) ) ( not ( = ?auto_26718 ?auto_26719 ) ) ( not ( = ?auto_26717 ?auto_26721 ) ) ( not ( = ?auto_26718 ?auto_26721 ) ) ( not ( = ?auto_26719 ?auto_26721 ) ) ( ON-TABLE ?auto_26722 ) ( not ( = ?auto_26722 ?auto_26721 ) ) ( not ( = ?auto_26722 ?auto_26719 ) ) ( not ( = ?auto_26722 ?auto_26718 ) ) ( not ( = ?auto_26717 ?auto_26722 ) ) ( ON ?auto_26717 ?auto_26720 ) ( not ( = ?auto_26717 ?auto_26720 ) ) ( not ( = ?auto_26718 ?auto_26720 ) ) ( not ( = ?auto_26719 ?auto_26720 ) ) ( not ( = ?auto_26721 ?auto_26720 ) ) ( not ( = ?auto_26722 ?auto_26720 ) ) ( ON ?auto_26718 ?auto_26717 ) ( ON-TABLE ?auto_26720 ) ( ON ?auto_26719 ?auto_26718 ) ( CLEAR ?auto_26722 ) ( ON ?auto_26721 ?auto_26719 ) ( CLEAR ?auto_26721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26720 ?auto_26717 ?auto_26718 ?auto_26719 )
      ( MAKE-3PILE ?auto_26717 ?auto_26718 ?auto_26719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26723 - BLOCK
      ?auto_26724 - BLOCK
      ?auto_26725 - BLOCK
    )
    :vars
    (
      ?auto_26726 - BLOCK
      ?auto_26728 - BLOCK
      ?auto_26727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26723 ?auto_26724 ) ) ( not ( = ?auto_26723 ?auto_26725 ) ) ( not ( = ?auto_26724 ?auto_26725 ) ) ( not ( = ?auto_26723 ?auto_26726 ) ) ( not ( = ?auto_26724 ?auto_26726 ) ) ( not ( = ?auto_26725 ?auto_26726 ) ) ( not ( = ?auto_26728 ?auto_26726 ) ) ( not ( = ?auto_26728 ?auto_26725 ) ) ( not ( = ?auto_26728 ?auto_26724 ) ) ( not ( = ?auto_26723 ?auto_26728 ) ) ( ON ?auto_26723 ?auto_26727 ) ( not ( = ?auto_26723 ?auto_26727 ) ) ( not ( = ?auto_26724 ?auto_26727 ) ) ( not ( = ?auto_26725 ?auto_26727 ) ) ( not ( = ?auto_26726 ?auto_26727 ) ) ( not ( = ?auto_26728 ?auto_26727 ) ) ( ON ?auto_26724 ?auto_26723 ) ( ON-TABLE ?auto_26727 ) ( ON ?auto_26725 ?auto_26724 ) ( ON ?auto_26726 ?auto_26725 ) ( CLEAR ?auto_26726 ) ( HOLDING ?auto_26728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26728 )
      ( MAKE-3PILE ?auto_26723 ?auto_26724 ?auto_26725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26729 - BLOCK
      ?auto_26730 - BLOCK
      ?auto_26731 - BLOCK
    )
    :vars
    (
      ?auto_26734 - BLOCK
      ?auto_26732 - BLOCK
      ?auto_26733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26729 ?auto_26730 ) ) ( not ( = ?auto_26729 ?auto_26731 ) ) ( not ( = ?auto_26730 ?auto_26731 ) ) ( not ( = ?auto_26729 ?auto_26734 ) ) ( not ( = ?auto_26730 ?auto_26734 ) ) ( not ( = ?auto_26731 ?auto_26734 ) ) ( not ( = ?auto_26732 ?auto_26734 ) ) ( not ( = ?auto_26732 ?auto_26731 ) ) ( not ( = ?auto_26732 ?auto_26730 ) ) ( not ( = ?auto_26729 ?auto_26732 ) ) ( ON ?auto_26729 ?auto_26733 ) ( not ( = ?auto_26729 ?auto_26733 ) ) ( not ( = ?auto_26730 ?auto_26733 ) ) ( not ( = ?auto_26731 ?auto_26733 ) ) ( not ( = ?auto_26734 ?auto_26733 ) ) ( not ( = ?auto_26732 ?auto_26733 ) ) ( ON ?auto_26730 ?auto_26729 ) ( ON-TABLE ?auto_26733 ) ( ON ?auto_26731 ?auto_26730 ) ( ON ?auto_26734 ?auto_26731 ) ( ON ?auto_26732 ?auto_26734 ) ( CLEAR ?auto_26732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26733 ?auto_26729 ?auto_26730 ?auto_26731 ?auto_26734 )
      ( MAKE-3PILE ?auto_26729 ?auto_26730 ?auto_26731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26746 - BLOCK
    )
    :vars
    (
      ?auto_26749 - BLOCK
      ?auto_26747 - BLOCK
      ?auto_26748 - BLOCK
      ?auto_26750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26749 ?auto_26746 ) ( ON-TABLE ?auto_26746 ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26747 ) ) ( not ( = ?auto_26746 ?auto_26748 ) ) ( not ( = ?auto_26749 ?auto_26747 ) ) ( not ( = ?auto_26749 ?auto_26748 ) ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( ON ?auto_26747 ?auto_26749 ) ( CLEAR ?auto_26747 ) ( HOLDING ?auto_26748 ) ( CLEAR ?auto_26750 ) ( ON-TABLE ?auto_26750 ) ( not ( = ?auto_26750 ?auto_26748 ) ) ( not ( = ?auto_26746 ?auto_26750 ) ) ( not ( = ?auto_26749 ?auto_26750 ) ) ( not ( = ?auto_26747 ?auto_26750 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26750 ?auto_26748 )
      ( MAKE-1PILE ?auto_26746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26751 - BLOCK
    )
    :vars
    (
      ?auto_26754 - BLOCK
      ?auto_26755 - BLOCK
      ?auto_26753 - BLOCK
      ?auto_26752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26754 ?auto_26751 ) ( ON-TABLE ?auto_26751 ) ( not ( = ?auto_26751 ?auto_26754 ) ) ( not ( = ?auto_26751 ?auto_26755 ) ) ( not ( = ?auto_26751 ?auto_26753 ) ) ( not ( = ?auto_26754 ?auto_26755 ) ) ( not ( = ?auto_26754 ?auto_26753 ) ) ( not ( = ?auto_26755 ?auto_26753 ) ) ( ON ?auto_26755 ?auto_26754 ) ( CLEAR ?auto_26752 ) ( ON-TABLE ?auto_26752 ) ( not ( = ?auto_26752 ?auto_26753 ) ) ( not ( = ?auto_26751 ?auto_26752 ) ) ( not ( = ?auto_26754 ?auto_26752 ) ) ( not ( = ?auto_26755 ?auto_26752 ) ) ( ON ?auto_26753 ?auto_26755 ) ( CLEAR ?auto_26753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26751 ?auto_26754 ?auto_26755 )
      ( MAKE-1PILE ?auto_26751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26756 - BLOCK
    )
    :vars
    (
      ?auto_26757 - BLOCK
      ?auto_26760 - BLOCK
      ?auto_26759 - BLOCK
      ?auto_26758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26757 ?auto_26756 ) ( ON-TABLE ?auto_26756 ) ( not ( = ?auto_26756 ?auto_26757 ) ) ( not ( = ?auto_26756 ?auto_26760 ) ) ( not ( = ?auto_26756 ?auto_26759 ) ) ( not ( = ?auto_26757 ?auto_26760 ) ) ( not ( = ?auto_26757 ?auto_26759 ) ) ( not ( = ?auto_26760 ?auto_26759 ) ) ( ON ?auto_26760 ?auto_26757 ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( not ( = ?auto_26756 ?auto_26758 ) ) ( not ( = ?auto_26757 ?auto_26758 ) ) ( not ( = ?auto_26760 ?auto_26758 ) ) ( ON ?auto_26759 ?auto_26760 ) ( CLEAR ?auto_26759 ) ( HOLDING ?auto_26758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26758 )
      ( MAKE-1PILE ?auto_26756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26767 - BLOCK
    )
    :vars
    (
      ?auto_26768 - BLOCK
      ?auto_26771 - BLOCK
      ?auto_26770 - BLOCK
      ?auto_26769 - BLOCK
      ?auto_26772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26768 ?auto_26767 ) ( ON-TABLE ?auto_26767 ) ( not ( = ?auto_26767 ?auto_26768 ) ) ( not ( = ?auto_26767 ?auto_26771 ) ) ( not ( = ?auto_26767 ?auto_26770 ) ) ( not ( = ?auto_26768 ?auto_26771 ) ) ( not ( = ?auto_26768 ?auto_26770 ) ) ( not ( = ?auto_26771 ?auto_26770 ) ) ( ON ?auto_26771 ?auto_26768 ) ( not ( = ?auto_26769 ?auto_26770 ) ) ( not ( = ?auto_26767 ?auto_26769 ) ) ( not ( = ?auto_26768 ?auto_26769 ) ) ( not ( = ?auto_26771 ?auto_26769 ) ) ( ON ?auto_26770 ?auto_26771 ) ( CLEAR ?auto_26770 ) ( ON ?auto_26769 ?auto_26772 ) ( CLEAR ?auto_26769 ) ( HAND-EMPTY ) ( not ( = ?auto_26767 ?auto_26772 ) ) ( not ( = ?auto_26768 ?auto_26772 ) ) ( not ( = ?auto_26771 ?auto_26772 ) ) ( not ( = ?auto_26770 ?auto_26772 ) ) ( not ( = ?auto_26769 ?auto_26772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26769 ?auto_26772 )
      ( MAKE-1PILE ?auto_26767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26773 - BLOCK
    )
    :vars
    (
      ?auto_26774 - BLOCK
      ?auto_26775 - BLOCK
      ?auto_26777 - BLOCK
      ?auto_26776 - BLOCK
      ?auto_26778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26774 ?auto_26773 ) ( ON-TABLE ?auto_26773 ) ( not ( = ?auto_26773 ?auto_26774 ) ) ( not ( = ?auto_26773 ?auto_26775 ) ) ( not ( = ?auto_26773 ?auto_26777 ) ) ( not ( = ?auto_26774 ?auto_26775 ) ) ( not ( = ?auto_26774 ?auto_26777 ) ) ( not ( = ?auto_26775 ?auto_26777 ) ) ( ON ?auto_26775 ?auto_26774 ) ( not ( = ?auto_26776 ?auto_26777 ) ) ( not ( = ?auto_26773 ?auto_26776 ) ) ( not ( = ?auto_26774 ?auto_26776 ) ) ( not ( = ?auto_26775 ?auto_26776 ) ) ( ON ?auto_26776 ?auto_26778 ) ( CLEAR ?auto_26776 ) ( not ( = ?auto_26773 ?auto_26778 ) ) ( not ( = ?auto_26774 ?auto_26778 ) ) ( not ( = ?auto_26775 ?auto_26778 ) ) ( not ( = ?auto_26777 ?auto_26778 ) ) ( not ( = ?auto_26776 ?auto_26778 ) ) ( HOLDING ?auto_26777 ) ( CLEAR ?auto_26775 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26773 ?auto_26774 ?auto_26775 ?auto_26777 )
      ( MAKE-1PILE ?auto_26773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26807 - BLOCK
      ?auto_26808 - BLOCK
      ?auto_26809 - BLOCK
      ?auto_26810 - BLOCK
    )
    :vars
    (
      ?auto_26811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26807 ) ( ON ?auto_26808 ?auto_26807 ) ( not ( = ?auto_26807 ?auto_26808 ) ) ( not ( = ?auto_26807 ?auto_26809 ) ) ( not ( = ?auto_26807 ?auto_26810 ) ) ( not ( = ?auto_26808 ?auto_26809 ) ) ( not ( = ?auto_26808 ?auto_26810 ) ) ( not ( = ?auto_26809 ?auto_26810 ) ) ( ON ?auto_26810 ?auto_26811 ) ( not ( = ?auto_26807 ?auto_26811 ) ) ( not ( = ?auto_26808 ?auto_26811 ) ) ( not ( = ?auto_26809 ?auto_26811 ) ) ( not ( = ?auto_26810 ?auto_26811 ) ) ( CLEAR ?auto_26808 ) ( ON ?auto_26809 ?auto_26810 ) ( CLEAR ?auto_26809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26811 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26811 ?auto_26810 )
      ( MAKE-4PILE ?auto_26807 ?auto_26808 ?auto_26809 ?auto_26810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26812 - BLOCK
      ?auto_26813 - BLOCK
      ?auto_26814 - BLOCK
      ?auto_26815 - BLOCK
    )
    :vars
    (
      ?auto_26816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26812 ) ( not ( = ?auto_26812 ?auto_26813 ) ) ( not ( = ?auto_26812 ?auto_26814 ) ) ( not ( = ?auto_26812 ?auto_26815 ) ) ( not ( = ?auto_26813 ?auto_26814 ) ) ( not ( = ?auto_26813 ?auto_26815 ) ) ( not ( = ?auto_26814 ?auto_26815 ) ) ( ON ?auto_26815 ?auto_26816 ) ( not ( = ?auto_26812 ?auto_26816 ) ) ( not ( = ?auto_26813 ?auto_26816 ) ) ( not ( = ?auto_26814 ?auto_26816 ) ) ( not ( = ?auto_26815 ?auto_26816 ) ) ( ON ?auto_26814 ?auto_26815 ) ( CLEAR ?auto_26814 ) ( ON-TABLE ?auto_26816 ) ( HOLDING ?auto_26813 ) ( CLEAR ?auto_26812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26812 ?auto_26813 )
      ( MAKE-4PILE ?auto_26812 ?auto_26813 ?auto_26814 ?auto_26815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26817 - BLOCK
      ?auto_26818 - BLOCK
      ?auto_26819 - BLOCK
      ?auto_26820 - BLOCK
    )
    :vars
    (
      ?auto_26821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26817 ) ( not ( = ?auto_26817 ?auto_26818 ) ) ( not ( = ?auto_26817 ?auto_26819 ) ) ( not ( = ?auto_26817 ?auto_26820 ) ) ( not ( = ?auto_26818 ?auto_26819 ) ) ( not ( = ?auto_26818 ?auto_26820 ) ) ( not ( = ?auto_26819 ?auto_26820 ) ) ( ON ?auto_26820 ?auto_26821 ) ( not ( = ?auto_26817 ?auto_26821 ) ) ( not ( = ?auto_26818 ?auto_26821 ) ) ( not ( = ?auto_26819 ?auto_26821 ) ) ( not ( = ?auto_26820 ?auto_26821 ) ) ( ON ?auto_26819 ?auto_26820 ) ( ON-TABLE ?auto_26821 ) ( CLEAR ?auto_26817 ) ( ON ?auto_26818 ?auto_26819 ) ( CLEAR ?auto_26818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26821 ?auto_26820 ?auto_26819 )
      ( MAKE-4PILE ?auto_26817 ?auto_26818 ?auto_26819 ?auto_26820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26822 - BLOCK
      ?auto_26823 - BLOCK
      ?auto_26824 - BLOCK
      ?auto_26825 - BLOCK
    )
    :vars
    (
      ?auto_26826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26822 ?auto_26823 ) ) ( not ( = ?auto_26822 ?auto_26824 ) ) ( not ( = ?auto_26822 ?auto_26825 ) ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( not ( = ?auto_26823 ?auto_26825 ) ) ( not ( = ?auto_26824 ?auto_26825 ) ) ( ON ?auto_26825 ?auto_26826 ) ( not ( = ?auto_26822 ?auto_26826 ) ) ( not ( = ?auto_26823 ?auto_26826 ) ) ( not ( = ?auto_26824 ?auto_26826 ) ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( ON ?auto_26824 ?auto_26825 ) ( ON-TABLE ?auto_26826 ) ( ON ?auto_26823 ?auto_26824 ) ( CLEAR ?auto_26823 ) ( HOLDING ?auto_26822 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26822 )
      ( MAKE-4PILE ?auto_26822 ?auto_26823 ?auto_26824 ?auto_26825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26827 - BLOCK
      ?auto_26828 - BLOCK
      ?auto_26829 - BLOCK
      ?auto_26830 - BLOCK
    )
    :vars
    (
      ?auto_26831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26827 ?auto_26828 ) ) ( not ( = ?auto_26827 ?auto_26829 ) ) ( not ( = ?auto_26827 ?auto_26830 ) ) ( not ( = ?auto_26828 ?auto_26829 ) ) ( not ( = ?auto_26828 ?auto_26830 ) ) ( not ( = ?auto_26829 ?auto_26830 ) ) ( ON ?auto_26830 ?auto_26831 ) ( not ( = ?auto_26827 ?auto_26831 ) ) ( not ( = ?auto_26828 ?auto_26831 ) ) ( not ( = ?auto_26829 ?auto_26831 ) ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( ON ?auto_26829 ?auto_26830 ) ( ON-TABLE ?auto_26831 ) ( ON ?auto_26828 ?auto_26829 ) ( ON ?auto_26827 ?auto_26828 ) ( CLEAR ?auto_26827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26831 ?auto_26830 ?auto_26829 ?auto_26828 )
      ( MAKE-4PILE ?auto_26827 ?auto_26828 ?auto_26829 ?auto_26830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26836 - BLOCK
      ?auto_26837 - BLOCK
      ?auto_26838 - BLOCK
      ?auto_26839 - BLOCK
    )
    :vars
    (
      ?auto_26840 - BLOCK
      ?auto_26841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26836 ?auto_26837 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26839 ) ) ( not ( = ?auto_26837 ?auto_26838 ) ) ( not ( = ?auto_26837 ?auto_26839 ) ) ( not ( = ?auto_26838 ?auto_26839 ) ) ( ON ?auto_26839 ?auto_26840 ) ( not ( = ?auto_26836 ?auto_26840 ) ) ( not ( = ?auto_26837 ?auto_26840 ) ) ( not ( = ?auto_26838 ?auto_26840 ) ) ( not ( = ?auto_26839 ?auto_26840 ) ) ( ON ?auto_26838 ?auto_26839 ) ( ON-TABLE ?auto_26840 ) ( ON ?auto_26837 ?auto_26838 ) ( CLEAR ?auto_26837 ) ( ON ?auto_26836 ?auto_26841 ) ( CLEAR ?auto_26836 ) ( HAND-EMPTY ) ( not ( = ?auto_26836 ?auto_26841 ) ) ( not ( = ?auto_26837 ?auto_26841 ) ) ( not ( = ?auto_26838 ?auto_26841 ) ) ( not ( = ?auto_26839 ?auto_26841 ) ) ( not ( = ?auto_26840 ?auto_26841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26836 ?auto_26841 )
      ( MAKE-4PILE ?auto_26836 ?auto_26837 ?auto_26838 ?auto_26839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26842 - BLOCK
      ?auto_26843 - BLOCK
      ?auto_26844 - BLOCK
      ?auto_26845 - BLOCK
    )
    :vars
    (
      ?auto_26846 - BLOCK
      ?auto_26847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26842 ?auto_26843 ) ) ( not ( = ?auto_26842 ?auto_26844 ) ) ( not ( = ?auto_26842 ?auto_26845 ) ) ( not ( = ?auto_26843 ?auto_26844 ) ) ( not ( = ?auto_26843 ?auto_26845 ) ) ( not ( = ?auto_26844 ?auto_26845 ) ) ( ON ?auto_26845 ?auto_26846 ) ( not ( = ?auto_26842 ?auto_26846 ) ) ( not ( = ?auto_26843 ?auto_26846 ) ) ( not ( = ?auto_26844 ?auto_26846 ) ) ( not ( = ?auto_26845 ?auto_26846 ) ) ( ON ?auto_26844 ?auto_26845 ) ( ON-TABLE ?auto_26846 ) ( ON ?auto_26842 ?auto_26847 ) ( CLEAR ?auto_26842 ) ( not ( = ?auto_26842 ?auto_26847 ) ) ( not ( = ?auto_26843 ?auto_26847 ) ) ( not ( = ?auto_26844 ?auto_26847 ) ) ( not ( = ?auto_26845 ?auto_26847 ) ) ( not ( = ?auto_26846 ?auto_26847 ) ) ( HOLDING ?auto_26843 ) ( CLEAR ?auto_26844 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26846 ?auto_26845 ?auto_26844 ?auto_26843 )
      ( MAKE-4PILE ?auto_26842 ?auto_26843 ?auto_26844 ?auto_26845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26848 - BLOCK
      ?auto_26849 - BLOCK
      ?auto_26850 - BLOCK
      ?auto_26851 - BLOCK
    )
    :vars
    (
      ?auto_26853 - BLOCK
      ?auto_26852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26848 ?auto_26849 ) ) ( not ( = ?auto_26848 ?auto_26850 ) ) ( not ( = ?auto_26848 ?auto_26851 ) ) ( not ( = ?auto_26849 ?auto_26850 ) ) ( not ( = ?auto_26849 ?auto_26851 ) ) ( not ( = ?auto_26850 ?auto_26851 ) ) ( ON ?auto_26851 ?auto_26853 ) ( not ( = ?auto_26848 ?auto_26853 ) ) ( not ( = ?auto_26849 ?auto_26853 ) ) ( not ( = ?auto_26850 ?auto_26853 ) ) ( not ( = ?auto_26851 ?auto_26853 ) ) ( ON ?auto_26850 ?auto_26851 ) ( ON-TABLE ?auto_26853 ) ( ON ?auto_26848 ?auto_26852 ) ( not ( = ?auto_26848 ?auto_26852 ) ) ( not ( = ?auto_26849 ?auto_26852 ) ) ( not ( = ?auto_26850 ?auto_26852 ) ) ( not ( = ?auto_26851 ?auto_26852 ) ) ( not ( = ?auto_26853 ?auto_26852 ) ) ( CLEAR ?auto_26850 ) ( ON ?auto_26849 ?auto_26848 ) ( CLEAR ?auto_26849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26852 ?auto_26848 )
      ( MAKE-4PILE ?auto_26848 ?auto_26849 ?auto_26850 ?auto_26851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26854 - BLOCK
      ?auto_26855 - BLOCK
      ?auto_26856 - BLOCK
      ?auto_26857 - BLOCK
    )
    :vars
    (
      ?auto_26859 - BLOCK
      ?auto_26858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26854 ?auto_26855 ) ) ( not ( = ?auto_26854 ?auto_26856 ) ) ( not ( = ?auto_26854 ?auto_26857 ) ) ( not ( = ?auto_26855 ?auto_26856 ) ) ( not ( = ?auto_26855 ?auto_26857 ) ) ( not ( = ?auto_26856 ?auto_26857 ) ) ( ON ?auto_26857 ?auto_26859 ) ( not ( = ?auto_26854 ?auto_26859 ) ) ( not ( = ?auto_26855 ?auto_26859 ) ) ( not ( = ?auto_26856 ?auto_26859 ) ) ( not ( = ?auto_26857 ?auto_26859 ) ) ( ON-TABLE ?auto_26859 ) ( ON ?auto_26854 ?auto_26858 ) ( not ( = ?auto_26854 ?auto_26858 ) ) ( not ( = ?auto_26855 ?auto_26858 ) ) ( not ( = ?auto_26856 ?auto_26858 ) ) ( not ( = ?auto_26857 ?auto_26858 ) ) ( not ( = ?auto_26859 ?auto_26858 ) ) ( ON ?auto_26855 ?auto_26854 ) ( CLEAR ?auto_26855 ) ( ON-TABLE ?auto_26858 ) ( HOLDING ?auto_26856 ) ( CLEAR ?auto_26857 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26859 ?auto_26857 ?auto_26856 )
      ( MAKE-4PILE ?auto_26854 ?auto_26855 ?auto_26856 ?auto_26857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26860 - BLOCK
      ?auto_26861 - BLOCK
      ?auto_26862 - BLOCK
      ?auto_26863 - BLOCK
    )
    :vars
    (
      ?auto_26864 - BLOCK
      ?auto_26865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26860 ?auto_26861 ) ) ( not ( = ?auto_26860 ?auto_26862 ) ) ( not ( = ?auto_26860 ?auto_26863 ) ) ( not ( = ?auto_26861 ?auto_26862 ) ) ( not ( = ?auto_26861 ?auto_26863 ) ) ( not ( = ?auto_26862 ?auto_26863 ) ) ( ON ?auto_26863 ?auto_26864 ) ( not ( = ?auto_26860 ?auto_26864 ) ) ( not ( = ?auto_26861 ?auto_26864 ) ) ( not ( = ?auto_26862 ?auto_26864 ) ) ( not ( = ?auto_26863 ?auto_26864 ) ) ( ON-TABLE ?auto_26864 ) ( ON ?auto_26860 ?auto_26865 ) ( not ( = ?auto_26860 ?auto_26865 ) ) ( not ( = ?auto_26861 ?auto_26865 ) ) ( not ( = ?auto_26862 ?auto_26865 ) ) ( not ( = ?auto_26863 ?auto_26865 ) ) ( not ( = ?auto_26864 ?auto_26865 ) ) ( ON ?auto_26861 ?auto_26860 ) ( ON-TABLE ?auto_26865 ) ( CLEAR ?auto_26863 ) ( ON ?auto_26862 ?auto_26861 ) ( CLEAR ?auto_26862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26865 ?auto_26860 ?auto_26861 )
      ( MAKE-4PILE ?auto_26860 ?auto_26861 ?auto_26862 ?auto_26863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26866 - BLOCK
      ?auto_26867 - BLOCK
      ?auto_26868 - BLOCK
      ?auto_26869 - BLOCK
    )
    :vars
    (
      ?auto_26870 - BLOCK
      ?auto_26871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26866 ?auto_26867 ) ) ( not ( = ?auto_26866 ?auto_26868 ) ) ( not ( = ?auto_26866 ?auto_26869 ) ) ( not ( = ?auto_26867 ?auto_26868 ) ) ( not ( = ?auto_26867 ?auto_26869 ) ) ( not ( = ?auto_26868 ?auto_26869 ) ) ( not ( = ?auto_26866 ?auto_26870 ) ) ( not ( = ?auto_26867 ?auto_26870 ) ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26869 ?auto_26870 ) ) ( ON-TABLE ?auto_26870 ) ( ON ?auto_26866 ?auto_26871 ) ( not ( = ?auto_26866 ?auto_26871 ) ) ( not ( = ?auto_26867 ?auto_26871 ) ) ( not ( = ?auto_26868 ?auto_26871 ) ) ( not ( = ?auto_26869 ?auto_26871 ) ) ( not ( = ?auto_26870 ?auto_26871 ) ) ( ON ?auto_26867 ?auto_26866 ) ( ON-TABLE ?auto_26871 ) ( ON ?auto_26868 ?auto_26867 ) ( CLEAR ?auto_26868 ) ( HOLDING ?auto_26869 ) ( CLEAR ?auto_26870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26870 ?auto_26869 )
      ( MAKE-4PILE ?auto_26866 ?auto_26867 ?auto_26868 ?auto_26869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26872 - BLOCK
      ?auto_26873 - BLOCK
      ?auto_26874 - BLOCK
      ?auto_26875 - BLOCK
    )
    :vars
    (
      ?auto_26876 - BLOCK
      ?auto_26877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26872 ?auto_26873 ) ) ( not ( = ?auto_26872 ?auto_26874 ) ) ( not ( = ?auto_26872 ?auto_26875 ) ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26873 ?auto_26875 ) ) ( not ( = ?auto_26874 ?auto_26875 ) ) ( not ( = ?auto_26872 ?auto_26876 ) ) ( not ( = ?auto_26873 ?auto_26876 ) ) ( not ( = ?auto_26874 ?auto_26876 ) ) ( not ( = ?auto_26875 ?auto_26876 ) ) ( ON-TABLE ?auto_26876 ) ( ON ?auto_26872 ?auto_26877 ) ( not ( = ?auto_26872 ?auto_26877 ) ) ( not ( = ?auto_26873 ?auto_26877 ) ) ( not ( = ?auto_26874 ?auto_26877 ) ) ( not ( = ?auto_26875 ?auto_26877 ) ) ( not ( = ?auto_26876 ?auto_26877 ) ) ( ON ?auto_26873 ?auto_26872 ) ( ON-TABLE ?auto_26877 ) ( ON ?auto_26874 ?auto_26873 ) ( CLEAR ?auto_26876 ) ( ON ?auto_26875 ?auto_26874 ) ( CLEAR ?auto_26875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26877 ?auto_26872 ?auto_26873 ?auto_26874 )
      ( MAKE-4PILE ?auto_26872 ?auto_26873 ?auto_26874 ?auto_26875 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26878 - BLOCK
      ?auto_26879 - BLOCK
      ?auto_26880 - BLOCK
      ?auto_26881 - BLOCK
    )
    :vars
    (
      ?auto_26882 - BLOCK
      ?auto_26883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26878 ?auto_26879 ) ) ( not ( = ?auto_26878 ?auto_26880 ) ) ( not ( = ?auto_26878 ?auto_26881 ) ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( not ( = ?auto_26879 ?auto_26881 ) ) ( not ( = ?auto_26880 ?auto_26881 ) ) ( not ( = ?auto_26878 ?auto_26882 ) ) ( not ( = ?auto_26879 ?auto_26882 ) ) ( not ( = ?auto_26880 ?auto_26882 ) ) ( not ( = ?auto_26881 ?auto_26882 ) ) ( ON ?auto_26878 ?auto_26883 ) ( not ( = ?auto_26878 ?auto_26883 ) ) ( not ( = ?auto_26879 ?auto_26883 ) ) ( not ( = ?auto_26880 ?auto_26883 ) ) ( not ( = ?auto_26881 ?auto_26883 ) ) ( not ( = ?auto_26882 ?auto_26883 ) ) ( ON ?auto_26879 ?auto_26878 ) ( ON-TABLE ?auto_26883 ) ( ON ?auto_26880 ?auto_26879 ) ( ON ?auto_26881 ?auto_26880 ) ( CLEAR ?auto_26881 ) ( HOLDING ?auto_26882 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26882 )
      ( MAKE-4PILE ?auto_26878 ?auto_26879 ?auto_26880 ?auto_26881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26884 - BLOCK
      ?auto_26885 - BLOCK
      ?auto_26886 - BLOCK
      ?auto_26887 - BLOCK
    )
    :vars
    (
      ?auto_26888 - BLOCK
      ?auto_26889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26884 ?auto_26885 ) ) ( not ( = ?auto_26884 ?auto_26886 ) ) ( not ( = ?auto_26884 ?auto_26887 ) ) ( not ( = ?auto_26885 ?auto_26886 ) ) ( not ( = ?auto_26885 ?auto_26887 ) ) ( not ( = ?auto_26886 ?auto_26887 ) ) ( not ( = ?auto_26884 ?auto_26888 ) ) ( not ( = ?auto_26885 ?auto_26888 ) ) ( not ( = ?auto_26886 ?auto_26888 ) ) ( not ( = ?auto_26887 ?auto_26888 ) ) ( ON ?auto_26884 ?auto_26889 ) ( not ( = ?auto_26884 ?auto_26889 ) ) ( not ( = ?auto_26885 ?auto_26889 ) ) ( not ( = ?auto_26886 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26889 ) ) ( not ( = ?auto_26888 ?auto_26889 ) ) ( ON ?auto_26885 ?auto_26884 ) ( ON-TABLE ?auto_26889 ) ( ON ?auto_26886 ?auto_26885 ) ( ON ?auto_26887 ?auto_26886 ) ( ON ?auto_26888 ?auto_26887 ) ( CLEAR ?auto_26888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26889 ?auto_26884 ?auto_26885 ?auto_26886 ?auto_26887 )
      ( MAKE-4PILE ?auto_26884 ?auto_26885 ?auto_26886 ?auto_26887 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26900 - BLOCK
      ?auto_26901 - BLOCK
      ?auto_26902 - BLOCK
      ?auto_26903 - BLOCK
      ?auto_26904 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26903 ) ( ON-TABLE ?auto_26900 ) ( ON ?auto_26901 ?auto_26900 ) ( ON ?auto_26902 ?auto_26901 ) ( ON ?auto_26903 ?auto_26902 ) ( not ( = ?auto_26900 ?auto_26901 ) ) ( not ( = ?auto_26900 ?auto_26902 ) ) ( not ( = ?auto_26900 ?auto_26903 ) ) ( not ( = ?auto_26900 ?auto_26904 ) ) ( not ( = ?auto_26901 ?auto_26902 ) ) ( not ( = ?auto_26901 ?auto_26903 ) ) ( not ( = ?auto_26901 ?auto_26904 ) ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26902 ?auto_26904 ) ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( ON-TABLE ?auto_26904 ) ( CLEAR ?auto_26904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_26904 )
      ( MAKE-5PILE ?auto_26900 ?auto_26901 ?auto_26902 ?auto_26903 ?auto_26904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26905 - BLOCK
      ?auto_26906 - BLOCK
      ?auto_26907 - BLOCK
      ?auto_26908 - BLOCK
      ?auto_26909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26905 ) ( ON ?auto_26906 ?auto_26905 ) ( ON ?auto_26907 ?auto_26906 ) ( not ( = ?auto_26905 ?auto_26906 ) ) ( not ( = ?auto_26905 ?auto_26907 ) ) ( not ( = ?auto_26905 ?auto_26908 ) ) ( not ( = ?auto_26905 ?auto_26909 ) ) ( not ( = ?auto_26906 ?auto_26907 ) ) ( not ( = ?auto_26906 ?auto_26908 ) ) ( not ( = ?auto_26906 ?auto_26909 ) ) ( not ( = ?auto_26907 ?auto_26908 ) ) ( not ( = ?auto_26907 ?auto_26909 ) ) ( not ( = ?auto_26908 ?auto_26909 ) ) ( ON-TABLE ?auto_26909 ) ( CLEAR ?auto_26909 ) ( HOLDING ?auto_26908 ) ( CLEAR ?auto_26907 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26905 ?auto_26906 ?auto_26907 ?auto_26908 )
      ( MAKE-5PILE ?auto_26905 ?auto_26906 ?auto_26907 ?auto_26908 ?auto_26909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26910 - BLOCK
      ?auto_26911 - BLOCK
      ?auto_26912 - BLOCK
      ?auto_26913 - BLOCK
      ?auto_26914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26910 ) ( ON ?auto_26911 ?auto_26910 ) ( ON ?auto_26912 ?auto_26911 ) ( not ( = ?auto_26910 ?auto_26911 ) ) ( not ( = ?auto_26910 ?auto_26912 ) ) ( not ( = ?auto_26910 ?auto_26913 ) ) ( not ( = ?auto_26910 ?auto_26914 ) ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26913 ) ) ( not ( = ?auto_26911 ?auto_26914 ) ) ( not ( = ?auto_26912 ?auto_26913 ) ) ( not ( = ?auto_26912 ?auto_26914 ) ) ( not ( = ?auto_26913 ?auto_26914 ) ) ( ON-TABLE ?auto_26914 ) ( CLEAR ?auto_26912 ) ( ON ?auto_26913 ?auto_26914 ) ( CLEAR ?auto_26913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26914 )
      ( MAKE-5PILE ?auto_26910 ?auto_26911 ?auto_26912 ?auto_26913 ?auto_26914 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26915 - BLOCK
      ?auto_26916 - BLOCK
      ?auto_26917 - BLOCK
      ?auto_26918 - BLOCK
      ?auto_26919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26915 ) ( ON ?auto_26916 ?auto_26915 ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26919 ) ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26918 ) ) ( not ( = ?auto_26916 ?auto_26919 ) ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26917 ?auto_26919 ) ) ( not ( = ?auto_26918 ?auto_26919 ) ) ( ON-TABLE ?auto_26919 ) ( ON ?auto_26918 ?auto_26919 ) ( CLEAR ?auto_26918 ) ( HOLDING ?auto_26917 ) ( CLEAR ?auto_26916 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26915 ?auto_26916 ?auto_26917 )
      ( MAKE-5PILE ?auto_26915 ?auto_26916 ?auto_26917 ?auto_26918 ?auto_26919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26920 - BLOCK
      ?auto_26921 - BLOCK
      ?auto_26922 - BLOCK
      ?auto_26923 - BLOCK
      ?auto_26924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26920 ) ( ON ?auto_26921 ?auto_26920 ) ( not ( = ?auto_26920 ?auto_26921 ) ) ( not ( = ?auto_26920 ?auto_26922 ) ) ( not ( = ?auto_26920 ?auto_26923 ) ) ( not ( = ?auto_26920 ?auto_26924 ) ) ( not ( = ?auto_26921 ?auto_26922 ) ) ( not ( = ?auto_26921 ?auto_26923 ) ) ( not ( = ?auto_26921 ?auto_26924 ) ) ( not ( = ?auto_26922 ?auto_26923 ) ) ( not ( = ?auto_26922 ?auto_26924 ) ) ( not ( = ?auto_26923 ?auto_26924 ) ) ( ON-TABLE ?auto_26924 ) ( ON ?auto_26923 ?auto_26924 ) ( CLEAR ?auto_26921 ) ( ON ?auto_26922 ?auto_26923 ) ( CLEAR ?auto_26922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26924 ?auto_26923 )
      ( MAKE-5PILE ?auto_26920 ?auto_26921 ?auto_26922 ?auto_26923 ?auto_26924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26925 - BLOCK
      ?auto_26926 - BLOCK
      ?auto_26927 - BLOCK
      ?auto_26928 - BLOCK
      ?auto_26929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26925 ) ( not ( = ?auto_26925 ?auto_26926 ) ) ( not ( = ?auto_26925 ?auto_26927 ) ) ( not ( = ?auto_26925 ?auto_26928 ) ) ( not ( = ?auto_26925 ?auto_26929 ) ) ( not ( = ?auto_26926 ?auto_26927 ) ) ( not ( = ?auto_26926 ?auto_26928 ) ) ( not ( = ?auto_26926 ?auto_26929 ) ) ( not ( = ?auto_26927 ?auto_26928 ) ) ( not ( = ?auto_26927 ?auto_26929 ) ) ( not ( = ?auto_26928 ?auto_26929 ) ) ( ON-TABLE ?auto_26929 ) ( ON ?auto_26928 ?auto_26929 ) ( ON ?auto_26927 ?auto_26928 ) ( CLEAR ?auto_26927 ) ( HOLDING ?auto_26926 ) ( CLEAR ?auto_26925 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26925 ?auto_26926 )
      ( MAKE-5PILE ?auto_26925 ?auto_26926 ?auto_26927 ?auto_26928 ?auto_26929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26930 - BLOCK
      ?auto_26931 - BLOCK
      ?auto_26932 - BLOCK
      ?auto_26933 - BLOCK
      ?auto_26934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26930 ) ( not ( = ?auto_26930 ?auto_26931 ) ) ( not ( = ?auto_26930 ?auto_26932 ) ) ( not ( = ?auto_26930 ?auto_26933 ) ) ( not ( = ?auto_26930 ?auto_26934 ) ) ( not ( = ?auto_26931 ?auto_26932 ) ) ( not ( = ?auto_26931 ?auto_26933 ) ) ( not ( = ?auto_26931 ?auto_26934 ) ) ( not ( = ?auto_26932 ?auto_26933 ) ) ( not ( = ?auto_26932 ?auto_26934 ) ) ( not ( = ?auto_26933 ?auto_26934 ) ) ( ON-TABLE ?auto_26934 ) ( ON ?auto_26933 ?auto_26934 ) ( ON ?auto_26932 ?auto_26933 ) ( CLEAR ?auto_26930 ) ( ON ?auto_26931 ?auto_26932 ) ( CLEAR ?auto_26931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26934 ?auto_26933 ?auto_26932 )
      ( MAKE-5PILE ?auto_26930 ?auto_26931 ?auto_26932 ?auto_26933 ?auto_26934 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26935 - BLOCK
      ?auto_26936 - BLOCK
      ?auto_26937 - BLOCK
      ?auto_26938 - BLOCK
      ?auto_26939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26935 ?auto_26936 ) ) ( not ( = ?auto_26935 ?auto_26937 ) ) ( not ( = ?auto_26935 ?auto_26938 ) ) ( not ( = ?auto_26935 ?auto_26939 ) ) ( not ( = ?auto_26936 ?auto_26937 ) ) ( not ( = ?auto_26936 ?auto_26938 ) ) ( not ( = ?auto_26936 ?auto_26939 ) ) ( not ( = ?auto_26937 ?auto_26938 ) ) ( not ( = ?auto_26937 ?auto_26939 ) ) ( not ( = ?auto_26938 ?auto_26939 ) ) ( ON-TABLE ?auto_26939 ) ( ON ?auto_26938 ?auto_26939 ) ( ON ?auto_26937 ?auto_26938 ) ( ON ?auto_26936 ?auto_26937 ) ( CLEAR ?auto_26936 ) ( HOLDING ?auto_26935 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26935 )
      ( MAKE-5PILE ?auto_26935 ?auto_26936 ?auto_26937 ?auto_26938 ?auto_26939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26940 - BLOCK
      ?auto_26941 - BLOCK
      ?auto_26942 - BLOCK
      ?auto_26943 - BLOCK
      ?auto_26944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26940 ?auto_26941 ) ) ( not ( = ?auto_26940 ?auto_26942 ) ) ( not ( = ?auto_26940 ?auto_26943 ) ) ( not ( = ?auto_26940 ?auto_26944 ) ) ( not ( = ?auto_26941 ?auto_26942 ) ) ( not ( = ?auto_26941 ?auto_26943 ) ) ( not ( = ?auto_26941 ?auto_26944 ) ) ( not ( = ?auto_26942 ?auto_26943 ) ) ( not ( = ?auto_26942 ?auto_26944 ) ) ( not ( = ?auto_26943 ?auto_26944 ) ) ( ON-TABLE ?auto_26944 ) ( ON ?auto_26943 ?auto_26944 ) ( ON ?auto_26942 ?auto_26943 ) ( ON ?auto_26941 ?auto_26942 ) ( ON ?auto_26940 ?auto_26941 ) ( CLEAR ?auto_26940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26944 ?auto_26943 ?auto_26942 ?auto_26941 )
      ( MAKE-5PILE ?auto_26940 ?auto_26941 ?auto_26942 ?auto_26943 ?auto_26944 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26950 - BLOCK
      ?auto_26951 - BLOCK
      ?auto_26952 - BLOCK
      ?auto_26953 - BLOCK
      ?auto_26954 - BLOCK
    )
    :vars
    (
      ?auto_26955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26950 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26952 ) ) ( not ( = ?auto_26950 ?auto_26953 ) ) ( not ( = ?auto_26950 ?auto_26954 ) ) ( not ( = ?auto_26951 ?auto_26952 ) ) ( not ( = ?auto_26951 ?auto_26953 ) ) ( not ( = ?auto_26951 ?auto_26954 ) ) ( not ( = ?auto_26952 ?auto_26953 ) ) ( not ( = ?auto_26952 ?auto_26954 ) ) ( not ( = ?auto_26953 ?auto_26954 ) ) ( ON-TABLE ?auto_26954 ) ( ON ?auto_26953 ?auto_26954 ) ( ON ?auto_26952 ?auto_26953 ) ( ON ?auto_26951 ?auto_26952 ) ( CLEAR ?auto_26951 ) ( ON ?auto_26950 ?auto_26955 ) ( CLEAR ?auto_26950 ) ( HAND-EMPTY ) ( not ( = ?auto_26950 ?auto_26955 ) ) ( not ( = ?auto_26951 ?auto_26955 ) ) ( not ( = ?auto_26952 ?auto_26955 ) ) ( not ( = ?auto_26953 ?auto_26955 ) ) ( not ( = ?auto_26954 ?auto_26955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26950 ?auto_26955 )
      ( MAKE-5PILE ?auto_26950 ?auto_26951 ?auto_26952 ?auto_26953 ?auto_26954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26956 - BLOCK
      ?auto_26957 - BLOCK
      ?auto_26958 - BLOCK
      ?auto_26959 - BLOCK
      ?auto_26960 - BLOCK
    )
    :vars
    (
      ?auto_26961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26956 ?auto_26957 ) ) ( not ( = ?auto_26956 ?auto_26958 ) ) ( not ( = ?auto_26956 ?auto_26959 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26957 ?auto_26959 ) ) ( not ( = ?auto_26957 ?auto_26960 ) ) ( not ( = ?auto_26958 ?auto_26959 ) ) ( not ( = ?auto_26958 ?auto_26960 ) ) ( not ( = ?auto_26959 ?auto_26960 ) ) ( ON-TABLE ?auto_26960 ) ( ON ?auto_26959 ?auto_26960 ) ( ON ?auto_26958 ?auto_26959 ) ( ON ?auto_26956 ?auto_26961 ) ( CLEAR ?auto_26956 ) ( not ( = ?auto_26956 ?auto_26961 ) ) ( not ( = ?auto_26957 ?auto_26961 ) ) ( not ( = ?auto_26958 ?auto_26961 ) ) ( not ( = ?auto_26959 ?auto_26961 ) ) ( not ( = ?auto_26960 ?auto_26961 ) ) ( HOLDING ?auto_26957 ) ( CLEAR ?auto_26958 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26960 ?auto_26959 ?auto_26958 ?auto_26957 )
      ( MAKE-5PILE ?auto_26956 ?auto_26957 ?auto_26958 ?auto_26959 ?auto_26960 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26962 - BLOCK
      ?auto_26963 - BLOCK
      ?auto_26964 - BLOCK
      ?auto_26965 - BLOCK
      ?auto_26966 - BLOCK
    )
    :vars
    (
      ?auto_26967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26962 ?auto_26963 ) ) ( not ( = ?auto_26962 ?auto_26964 ) ) ( not ( = ?auto_26962 ?auto_26965 ) ) ( not ( = ?auto_26962 ?auto_26966 ) ) ( not ( = ?auto_26963 ?auto_26964 ) ) ( not ( = ?auto_26963 ?auto_26965 ) ) ( not ( = ?auto_26963 ?auto_26966 ) ) ( not ( = ?auto_26964 ?auto_26965 ) ) ( not ( = ?auto_26964 ?auto_26966 ) ) ( not ( = ?auto_26965 ?auto_26966 ) ) ( ON-TABLE ?auto_26966 ) ( ON ?auto_26965 ?auto_26966 ) ( ON ?auto_26964 ?auto_26965 ) ( ON ?auto_26962 ?auto_26967 ) ( not ( = ?auto_26962 ?auto_26967 ) ) ( not ( = ?auto_26963 ?auto_26967 ) ) ( not ( = ?auto_26964 ?auto_26967 ) ) ( not ( = ?auto_26965 ?auto_26967 ) ) ( not ( = ?auto_26966 ?auto_26967 ) ) ( CLEAR ?auto_26964 ) ( ON ?auto_26963 ?auto_26962 ) ( CLEAR ?auto_26963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26967 ?auto_26962 )
      ( MAKE-5PILE ?auto_26962 ?auto_26963 ?auto_26964 ?auto_26965 ?auto_26966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26968 - BLOCK
      ?auto_26969 - BLOCK
      ?auto_26970 - BLOCK
      ?auto_26971 - BLOCK
      ?auto_26972 - BLOCK
    )
    :vars
    (
      ?auto_26973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26968 ?auto_26969 ) ) ( not ( = ?auto_26968 ?auto_26970 ) ) ( not ( = ?auto_26968 ?auto_26971 ) ) ( not ( = ?auto_26968 ?auto_26972 ) ) ( not ( = ?auto_26969 ?auto_26970 ) ) ( not ( = ?auto_26969 ?auto_26971 ) ) ( not ( = ?auto_26969 ?auto_26972 ) ) ( not ( = ?auto_26970 ?auto_26971 ) ) ( not ( = ?auto_26970 ?auto_26972 ) ) ( not ( = ?auto_26971 ?auto_26972 ) ) ( ON-TABLE ?auto_26972 ) ( ON ?auto_26971 ?auto_26972 ) ( ON ?auto_26968 ?auto_26973 ) ( not ( = ?auto_26968 ?auto_26973 ) ) ( not ( = ?auto_26969 ?auto_26973 ) ) ( not ( = ?auto_26970 ?auto_26973 ) ) ( not ( = ?auto_26971 ?auto_26973 ) ) ( not ( = ?auto_26972 ?auto_26973 ) ) ( ON ?auto_26969 ?auto_26968 ) ( CLEAR ?auto_26969 ) ( ON-TABLE ?auto_26973 ) ( HOLDING ?auto_26970 ) ( CLEAR ?auto_26971 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26972 ?auto_26971 ?auto_26970 )
      ( MAKE-5PILE ?auto_26968 ?auto_26969 ?auto_26970 ?auto_26971 ?auto_26972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26974 - BLOCK
      ?auto_26975 - BLOCK
      ?auto_26976 - BLOCK
      ?auto_26977 - BLOCK
      ?auto_26978 - BLOCK
    )
    :vars
    (
      ?auto_26979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26974 ?auto_26975 ) ) ( not ( = ?auto_26974 ?auto_26976 ) ) ( not ( = ?auto_26974 ?auto_26977 ) ) ( not ( = ?auto_26974 ?auto_26978 ) ) ( not ( = ?auto_26975 ?auto_26976 ) ) ( not ( = ?auto_26975 ?auto_26977 ) ) ( not ( = ?auto_26975 ?auto_26978 ) ) ( not ( = ?auto_26976 ?auto_26977 ) ) ( not ( = ?auto_26976 ?auto_26978 ) ) ( not ( = ?auto_26977 ?auto_26978 ) ) ( ON-TABLE ?auto_26978 ) ( ON ?auto_26977 ?auto_26978 ) ( ON ?auto_26974 ?auto_26979 ) ( not ( = ?auto_26974 ?auto_26979 ) ) ( not ( = ?auto_26975 ?auto_26979 ) ) ( not ( = ?auto_26976 ?auto_26979 ) ) ( not ( = ?auto_26977 ?auto_26979 ) ) ( not ( = ?auto_26978 ?auto_26979 ) ) ( ON ?auto_26975 ?auto_26974 ) ( ON-TABLE ?auto_26979 ) ( CLEAR ?auto_26977 ) ( ON ?auto_26976 ?auto_26975 ) ( CLEAR ?auto_26976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26979 ?auto_26974 ?auto_26975 )
      ( MAKE-5PILE ?auto_26974 ?auto_26975 ?auto_26976 ?auto_26977 ?auto_26978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26980 - BLOCK
      ?auto_26981 - BLOCK
      ?auto_26982 - BLOCK
      ?auto_26983 - BLOCK
      ?auto_26984 - BLOCK
    )
    :vars
    (
      ?auto_26985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26980 ?auto_26981 ) ) ( not ( = ?auto_26980 ?auto_26982 ) ) ( not ( = ?auto_26980 ?auto_26983 ) ) ( not ( = ?auto_26980 ?auto_26984 ) ) ( not ( = ?auto_26981 ?auto_26982 ) ) ( not ( = ?auto_26981 ?auto_26983 ) ) ( not ( = ?auto_26981 ?auto_26984 ) ) ( not ( = ?auto_26982 ?auto_26983 ) ) ( not ( = ?auto_26982 ?auto_26984 ) ) ( not ( = ?auto_26983 ?auto_26984 ) ) ( ON-TABLE ?auto_26984 ) ( ON ?auto_26980 ?auto_26985 ) ( not ( = ?auto_26980 ?auto_26985 ) ) ( not ( = ?auto_26981 ?auto_26985 ) ) ( not ( = ?auto_26982 ?auto_26985 ) ) ( not ( = ?auto_26983 ?auto_26985 ) ) ( not ( = ?auto_26984 ?auto_26985 ) ) ( ON ?auto_26981 ?auto_26980 ) ( ON-TABLE ?auto_26985 ) ( ON ?auto_26982 ?auto_26981 ) ( CLEAR ?auto_26982 ) ( HOLDING ?auto_26983 ) ( CLEAR ?auto_26984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26984 ?auto_26983 )
      ( MAKE-5PILE ?auto_26980 ?auto_26981 ?auto_26982 ?auto_26983 ?auto_26984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26986 - BLOCK
      ?auto_26987 - BLOCK
      ?auto_26988 - BLOCK
      ?auto_26989 - BLOCK
      ?auto_26990 - BLOCK
    )
    :vars
    (
      ?auto_26991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26986 ?auto_26987 ) ) ( not ( = ?auto_26986 ?auto_26988 ) ) ( not ( = ?auto_26986 ?auto_26989 ) ) ( not ( = ?auto_26986 ?auto_26990 ) ) ( not ( = ?auto_26987 ?auto_26988 ) ) ( not ( = ?auto_26987 ?auto_26989 ) ) ( not ( = ?auto_26987 ?auto_26990 ) ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( ON-TABLE ?auto_26990 ) ( ON ?auto_26986 ?auto_26991 ) ( not ( = ?auto_26986 ?auto_26991 ) ) ( not ( = ?auto_26987 ?auto_26991 ) ) ( not ( = ?auto_26988 ?auto_26991 ) ) ( not ( = ?auto_26989 ?auto_26991 ) ) ( not ( = ?auto_26990 ?auto_26991 ) ) ( ON ?auto_26987 ?auto_26986 ) ( ON-TABLE ?auto_26991 ) ( ON ?auto_26988 ?auto_26987 ) ( CLEAR ?auto_26990 ) ( ON ?auto_26989 ?auto_26988 ) ( CLEAR ?auto_26989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26991 ?auto_26986 ?auto_26987 ?auto_26988 )
      ( MAKE-5PILE ?auto_26986 ?auto_26987 ?auto_26988 ?auto_26989 ?auto_26990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26992 - BLOCK
      ?auto_26993 - BLOCK
      ?auto_26994 - BLOCK
      ?auto_26995 - BLOCK
      ?auto_26996 - BLOCK
    )
    :vars
    (
      ?auto_26997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26992 ?auto_26993 ) ) ( not ( = ?auto_26992 ?auto_26994 ) ) ( not ( = ?auto_26992 ?auto_26995 ) ) ( not ( = ?auto_26992 ?auto_26996 ) ) ( not ( = ?auto_26993 ?auto_26994 ) ) ( not ( = ?auto_26993 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_26996 ) ) ( not ( = ?auto_26994 ?auto_26995 ) ) ( not ( = ?auto_26994 ?auto_26996 ) ) ( not ( = ?auto_26995 ?auto_26996 ) ) ( ON ?auto_26992 ?auto_26997 ) ( not ( = ?auto_26992 ?auto_26997 ) ) ( not ( = ?auto_26993 ?auto_26997 ) ) ( not ( = ?auto_26994 ?auto_26997 ) ) ( not ( = ?auto_26995 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( ON ?auto_26993 ?auto_26992 ) ( ON-TABLE ?auto_26997 ) ( ON ?auto_26994 ?auto_26993 ) ( ON ?auto_26995 ?auto_26994 ) ( CLEAR ?auto_26995 ) ( HOLDING ?auto_26996 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26996 )
      ( MAKE-5PILE ?auto_26992 ?auto_26993 ?auto_26994 ?auto_26995 ?auto_26996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26998 - BLOCK
      ?auto_26999 - BLOCK
      ?auto_27000 - BLOCK
      ?auto_27001 - BLOCK
      ?auto_27002 - BLOCK
    )
    :vars
    (
      ?auto_27003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26998 ?auto_26999 ) ) ( not ( = ?auto_26998 ?auto_27000 ) ) ( not ( = ?auto_26998 ?auto_27001 ) ) ( not ( = ?auto_26998 ?auto_27002 ) ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_27000 ?auto_27001 ) ) ( not ( = ?auto_27000 ?auto_27002 ) ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( ON ?auto_26998 ?auto_27003 ) ( not ( = ?auto_26998 ?auto_27003 ) ) ( not ( = ?auto_26999 ?auto_27003 ) ) ( not ( = ?auto_27000 ?auto_27003 ) ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( not ( = ?auto_27002 ?auto_27003 ) ) ( ON ?auto_26999 ?auto_26998 ) ( ON-TABLE ?auto_27003 ) ( ON ?auto_27000 ?auto_26999 ) ( ON ?auto_27001 ?auto_27000 ) ( ON ?auto_27002 ?auto_27001 ) ( CLEAR ?auto_27002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27003 ?auto_26998 ?auto_26999 ?auto_27000 ?auto_27001 )
      ( MAKE-5PILE ?auto_26998 ?auto_26999 ?auto_27000 ?auto_27001 ?auto_27002 ) )
  )

)

