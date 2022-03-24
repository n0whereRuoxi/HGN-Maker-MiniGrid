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
      ?auto_22045 - BLOCK
    )
    :vars
    (
      ?auto_22046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22045 ?auto_22046 ) ( CLEAR ?auto_22045 ) ( HAND-EMPTY ) ( not ( = ?auto_22045 ?auto_22046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22045 ?auto_22046 )
      ( !PUTDOWN ?auto_22045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22052 - BLOCK
      ?auto_22053 - BLOCK
    )
    :vars
    (
      ?auto_22054 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22052 ) ( ON ?auto_22053 ?auto_22054 ) ( CLEAR ?auto_22053 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22052 ) ( not ( = ?auto_22052 ?auto_22053 ) ) ( not ( = ?auto_22052 ?auto_22054 ) ) ( not ( = ?auto_22053 ?auto_22054 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22053 ?auto_22054 )
      ( !STACK ?auto_22053 ?auto_22052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22062 - BLOCK
      ?auto_22063 - BLOCK
    )
    :vars
    (
      ?auto_22064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22063 ?auto_22064 ) ( not ( = ?auto_22062 ?auto_22063 ) ) ( not ( = ?auto_22062 ?auto_22064 ) ) ( not ( = ?auto_22063 ?auto_22064 ) ) ( ON ?auto_22062 ?auto_22063 ) ( CLEAR ?auto_22062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22062 )
      ( MAKE-2PILE ?auto_22062 ?auto_22063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22073 - BLOCK
      ?auto_22074 - BLOCK
      ?auto_22075 - BLOCK
    )
    :vars
    (
      ?auto_22076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22074 ) ( ON ?auto_22075 ?auto_22076 ) ( CLEAR ?auto_22075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22073 ) ( ON ?auto_22074 ?auto_22073 ) ( not ( = ?auto_22073 ?auto_22074 ) ) ( not ( = ?auto_22073 ?auto_22075 ) ) ( not ( = ?auto_22073 ?auto_22076 ) ) ( not ( = ?auto_22074 ?auto_22075 ) ) ( not ( = ?auto_22074 ?auto_22076 ) ) ( not ( = ?auto_22075 ?auto_22076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22075 ?auto_22076 )
      ( !STACK ?auto_22075 ?auto_22074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22087 - BLOCK
      ?auto_22088 - BLOCK
      ?auto_22089 - BLOCK
    )
    :vars
    (
      ?auto_22090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22089 ?auto_22090 ) ( ON-TABLE ?auto_22087 ) ( not ( = ?auto_22087 ?auto_22088 ) ) ( not ( = ?auto_22087 ?auto_22089 ) ) ( not ( = ?auto_22087 ?auto_22090 ) ) ( not ( = ?auto_22088 ?auto_22089 ) ) ( not ( = ?auto_22088 ?auto_22090 ) ) ( not ( = ?auto_22089 ?auto_22090 ) ) ( CLEAR ?auto_22087 ) ( ON ?auto_22088 ?auto_22089 ) ( CLEAR ?auto_22088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22087 ?auto_22088 )
      ( MAKE-3PILE ?auto_22087 ?auto_22088 ?auto_22089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_22101 - BLOCK
      ?auto_22102 - BLOCK
      ?auto_22103 - BLOCK
    )
    :vars
    (
      ?auto_22104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22103 ?auto_22104 ) ( not ( = ?auto_22101 ?auto_22102 ) ) ( not ( = ?auto_22101 ?auto_22103 ) ) ( not ( = ?auto_22101 ?auto_22104 ) ) ( not ( = ?auto_22102 ?auto_22103 ) ) ( not ( = ?auto_22102 ?auto_22104 ) ) ( not ( = ?auto_22103 ?auto_22104 ) ) ( ON ?auto_22102 ?auto_22103 ) ( ON ?auto_22101 ?auto_22102 ) ( CLEAR ?auto_22101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22101 )
      ( MAKE-3PILE ?auto_22101 ?auto_22102 ?auto_22103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22116 - BLOCK
      ?auto_22117 - BLOCK
      ?auto_22118 - BLOCK
      ?auto_22119 - BLOCK
    )
    :vars
    (
      ?auto_22120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22118 ) ( ON ?auto_22119 ?auto_22120 ) ( CLEAR ?auto_22119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22116 ) ( ON ?auto_22117 ?auto_22116 ) ( ON ?auto_22118 ?auto_22117 ) ( not ( = ?auto_22116 ?auto_22117 ) ) ( not ( = ?auto_22116 ?auto_22118 ) ) ( not ( = ?auto_22116 ?auto_22119 ) ) ( not ( = ?auto_22116 ?auto_22120 ) ) ( not ( = ?auto_22117 ?auto_22118 ) ) ( not ( = ?auto_22117 ?auto_22119 ) ) ( not ( = ?auto_22117 ?auto_22120 ) ) ( not ( = ?auto_22118 ?auto_22119 ) ) ( not ( = ?auto_22118 ?auto_22120 ) ) ( not ( = ?auto_22119 ?auto_22120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22119 ?auto_22120 )
      ( !STACK ?auto_22119 ?auto_22118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22134 - BLOCK
      ?auto_22135 - BLOCK
      ?auto_22136 - BLOCK
      ?auto_22137 - BLOCK
    )
    :vars
    (
      ?auto_22138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22137 ?auto_22138 ) ( ON-TABLE ?auto_22134 ) ( ON ?auto_22135 ?auto_22134 ) ( not ( = ?auto_22134 ?auto_22135 ) ) ( not ( = ?auto_22134 ?auto_22136 ) ) ( not ( = ?auto_22134 ?auto_22137 ) ) ( not ( = ?auto_22134 ?auto_22138 ) ) ( not ( = ?auto_22135 ?auto_22136 ) ) ( not ( = ?auto_22135 ?auto_22137 ) ) ( not ( = ?auto_22135 ?auto_22138 ) ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( not ( = ?auto_22136 ?auto_22138 ) ) ( not ( = ?auto_22137 ?auto_22138 ) ) ( CLEAR ?auto_22135 ) ( ON ?auto_22136 ?auto_22137 ) ( CLEAR ?auto_22136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22134 ?auto_22135 ?auto_22136 )
      ( MAKE-4PILE ?auto_22134 ?auto_22135 ?auto_22136 ?auto_22137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22152 - BLOCK
      ?auto_22153 - BLOCK
      ?auto_22154 - BLOCK
      ?auto_22155 - BLOCK
    )
    :vars
    (
      ?auto_22156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22155 ?auto_22156 ) ( ON-TABLE ?auto_22152 ) ( not ( = ?auto_22152 ?auto_22153 ) ) ( not ( = ?auto_22152 ?auto_22154 ) ) ( not ( = ?auto_22152 ?auto_22155 ) ) ( not ( = ?auto_22152 ?auto_22156 ) ) ( not ( = ?auto_22153 ?auto_22154 ) ) ( not ( = ?auto_22153 ?auto_22155 ) ) ( not ( = ?auto_22153 ?auto_22156 ) ) ( not ( = ?auto_22154 ?auto_22155 ) ) ( not ( = ?auto_22154 ?auto_22156 ) ) ( not ( = ?auto_22155 ?auto_22156 ) ) ( ON ?auto_22154 ?auto_22155 ) ( CLEAR ?auto_22152 ) ( ON ?auto_22153 ?auto_22154 ) ( CLEAR ?auto_22153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22152 ?auto_22153 )
      ( MAKE-4PILE ?auto_22152 ?auto_22153 ?auto_22154 ?auto_22155 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_22170 - BLOCK
      ?auto_22171 - BLOCK
      ?auto_22172 - BLOCK
      ?auto_22173 - BLOCK
    )
    :vars
    (
      ?auto_22174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22173 ?auto_22174 ) ( not ( = ?auto_22170 ?auto_22171 ) ) ( not ( = ?auto_22170 ?auto_22172 ) ) ( not ( = ?auto_22170 ?auto_22173 ) ) ( not ( = ?auto_22170 ?auto_22174 ) ) ( not ( = ?auto_22171 ?auto_22172 ) ) ( not ( = ?auto_22171 ?auto_22173 ) ) ( not ( = ?auto_22171 ?auto_22174 ) ) ( not ( = ?auto_22172 ?auto_22173 ) ) ( not ( = ?auto_22172 ?auto_22174 ) ) ( not ( = ?auto_22173 ?auto_22174 ) ) ( ON ?auto_22172 ?auto_22173 ) ( ON ?auto_22171 ?auto_22172 ) ( ON ?auto_22170 ?auto_22171 ) ( CLEAR ?auto_22170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22170 )
      ( MAKE-4PILE ?auto_22170 ?auto_22171 ?auto_22172 ?auto_22173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22189 - BLOCK
      ?auto_22190 - BLOCK
      ?auto_22191 - BLOCK
      ?auto_22192 - BLOCK
      ?auto_22193 - BLOCK
    )
    :vars
    (
      ?auto_22194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22192 ) ( ON ?auto_22193 ?auto_22194 ) ( CLEAR ?auto_22193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22189 ) ( ON ?auto_22190 ?auto_22189 ) ( ON ?auto_22191 ?auto_22190 ) ( ON ?auto_22192 ?auto_22191 ) ( not ( = ?auto_22189 ?auto_22190 ) ) ( not ( = ?auto_22189 ?auto_22191 ) ) ( not ( = ?auto_22189 ?auto_22192 ) ) ( not ( = ?auto_22189 ?auto_22193 ) ) ( not ( = ?auto_22189 ?auto_22194 ) ) ( not ( = ?auto_22190 ?auto_22191 ) ) ( not ( = ?auto_22190 ?auto_22192 ) ) ( not ( = ?auto_22190 ?auto_22193 ) ) ( not ( = ?auto_22190 ?auto_22194 ) ) ( not ( = ?auto_22191 ?auto_22192 ) ) ( not ( = ?auto_22191 ?auto_22193 ) ) ( not ( = ?auto_22191 ?auto_22194 ) ) ( not ( = ?auto_22192 ?auto_22193 ) ) ( not ( = ?auto_22192 ?auto_22194 ) ) ( not ( = ?auto_22193 ?auto_22194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22193 ?auto_22194 )
      ( !STACK ?auto_22193 ?auto_22192 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22211 - BLOCK
      ?auto_22212 - BLOCK
      ?auto_22213 - BLOCK
      ?auto_22214 - BLOCK
      ?auto_22215 - BLOCK
    )
    :vars
    (
      ?auto_22216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22215 ?auto_22216 ) ( ON-TABLE ?auto_22211 ) ( ON ?auto_22212 ?auto_22211 ) ( ON ?auto_22213 ?auto_22212 ) ( not ( = ?auto_22211 ?auto_22212 ) ) ( not ( = ?auto_22211 ?auto_22213 ) ) ( not ( = ?auto_22211 ?auto_22214 ) ) ( not ( = ?auto_22211 ?auto_22215 ) ) ( not ( = ?auto_22211 ?auto_22216 ) ) ( not ( = ?auto_22212 ?auto_22213 ) ) ( not ( = ?auto_22212 ?auto_22214 ) ) ( not ( = ?auto_22212 ?auto_22215 ) ) ( not ( = ?auto_22212 ?auto_22216 ) ) ( not ( = ?auto_22213 ?auto_22214 ) ) ( not ( = ?auto_22213 ?auto_22215 ) ) ( not ( = ?auto_22213 ?auto_22216 ) ) ( not ( = ?auto_22214 ?auto_22215 ) ) ( not ( = ?auto_22214 ?auto_22216 ) ) ( not ( = ?auto_22215 ?auto_22216 ) ) ( CLEAR ?auto_22213 ) ( ON ?auto_22214 ?auto_22215 ) ( CLEAR ?auto_22214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22211 ?auto_22212 ?auto_22213 ?auto_22214 )
      ( MAKE-5PILE ?auto_22211 ?auto_22212 ?auto_22213 ?auto_22214 ?auto_22215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22233 - BLOCK
      ?auto_22234 - BLOCK
      ?auto_22235 - BLOCK
      ?auto_22236 - BLOCK
      ?auto_22237 - BLOCK
    )
    :vars
    (
      ?auto_22238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22237 ?auto_22238 ) ( ON-TABLE ?auto_22233 ) ( ON ?auto_22234 ?auto_22233 ) ( not ( = ?auto_22233 ?auto_22234 ) ) ( not ( = ?auto_22233 ?auto_22235 ) ) ( not ( = ?auto_22233 ?auto_22236 ) ) ( not ( = ?auto_22233 ?auto_22237 ) ) ( not ( = ?auto_22233 ?auto_22238 ) ) ( not ( = ?auto_22234 ?auto_22235 ) ) ( not ( = ?auto_22234 ?auto_22236 ) ) ( not ( = ?auto_22234 ?auto_22237 ) ) ( not ( = ?auto_22234 ?auto_22238 ) ) ( not ( = ?auto_22235 ?auto_22236 ) ) ( not ( = ?auto_22235 ?auto_22237 ) ) ( not ( = ?auto_22235 ?auto_22238 ) ) ( not ( = ?auto_22236 ?auto_22237 ) ) ( not ( = ?auto_22236 ?auto_22238 ) ) ( not ( = ?auto_22237 ?auto_22238 ) ) ( ON ?auto_22236 ?auto_22237 ) ( CLEAR ?auto_22234 ) ( ON ?auto_22235 ?auto_22236 ) ( CLEAR ?auto_22235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22233 ?auto_22234 ?auto_22235 )
      ( MAKE-5PILE ?auto_22233 ?auto_22234 ?auto_22235 ?auto_22236 ?auto_22237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22255 - BLOCK
      ?auto_22256 - BLOCK
      ?auto_22257 - BLOCK
      ?auto_22258 - BLOCK
      ?auto_22259 - BLOCK
    )
    :vars
    (
      ?auto_22260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22259 ?auto_22260 ) ( ON-TABLE ?auto_22255 ) ( not ( = ?auto_22255 ?auto_22256 ) ) ( not ( = ?auto_22255 ?auto_22257 ) ) ( not ( = ?auto_22255 ?auto_22258 ) ) ( not ( = ?auto_22255 ?auto_22259 ) ) ( not ( = ?auto_22255 ?auto_22260 ) ) ( not ( = ?auto_22256 ?auto_22257 ) ) ( not ( = ?auto_22256 ?auto_22258 ) ) ( not ( = ?auto_22256 ?auto_22259 ) ) ( not ( = ?auto_22256 ?auto_22260 ) ) ( not ( = ?auto_22257 ?auto_22258 ) ) ( not ( = ?auto_22257 ?auto_22259 ) ) ( not ( = ?auto_22257 ?auto_22260 ) ) ( not ( = ?auto_22258 ?auto_22259 ) ) ( not ( = ?auto_22258 ?auto_22260 ) ) ( not ( = ?auto_22259 ?auto_22260 ) ) ( ON ?auto_22258 ?auto_22259 ) ( ON ?auto_22257 ?auto_22258 ) ( CLEAR ?auto_22255 ) ( ON ?auto_22256 ?auto_22257 ) ( CLEAR ?auto_22256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22255 ?auto_22256 )
      ( MAKE-5PILE ?auto_22255 ?auto_22256 ?auto_22257 ?auto_22258 ?auto_22259 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_22277 - BLOCK
      ?auto_22278 - BLOCK
      ?auto_22279 - BLOCK
      ?auto_22280 - BLOCK
      ?auto_22281 - BLOCK
    )
    :vars
    (
      ?auto_22282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22281 ?auto_22282 ) ( not ( = ?auto_22277 ?auto_22278 ) ) ( not ( = ?auto_22277 ?auto_22279 ) ) ( not ( = ?auto_22277 ?auto_22280 ) ) ( not ( = ?auto_22277 ?auto_22281 ) ) ( not ( = ?auto_22277 ?auto_22282 ) ) ( not ( = ?auto_22278 ?auto_22279 ) ) ( not ( = ?auto_22278 ?auto_22280 ) ) ( not ( = ?auto_22278 ?auto_22281 ) ) ( not ( = ?auto_22278 ?auto_22282 ) ) ( not ( = ?auto_22279 ?auto_22280 ) ) ( not ( = ?auto_22279 ?auto_22281 ) ) ( not ( = ?auto_22279 ?auto_22282 ) ) ( not ( = ?auto_22280 ?auto_22281 ) ) ( not ( = ?auto_22280 ?auto_22282 ) ) ( not ( = ?auto_22281 ?auto_22282 ) ) ( ON ?auto_22280 ?auto_22281 ) ( ON ?auto_22279 ?auto_22280 ) ( ON ?auto_22278 ?auto_22279 ) ( ON ?auto_22277 ?auto_22278 ) ( CLEAR ?auto_22277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22277 )
      ( MAKE-5PILE ?auto_22277 ?auto_22278 ?auto_22279 ?auto_22280 ?auto_22281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22300 - BLOCK
      ?auto_22301 - BLOCK
      ?auto_22302 - BLOCK
      ?auto_22303 - BLOCK
      ?auto_22304 - BLOCK
      ?auto_22305 - BLOCK
    )
    :vars
    (
      ?auto_22306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22304 ) ( ON ?auto_22305 ?auto_22306 ) ( CLEAR ?auto_22305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22300 ) ( ON ?auto_22301 ?auto_22300 ) ( ON ?auto_22302 ?auto_22301 ) ( ON ?auto_22303 ?auto_22302 ) ( ON ?auto_22304 ?auto_22303 ) ( not ( = ?auto_22300 ?auto_22301 ) ) ( not ( = ?auto_22300 ?auto_22302 ) ) ( not ( = ?auto_22300 ?auto_22303 ) ) ( not ( = ?auto_22300 ?auto_22304 ) ) ( not ( = ?auto_22300 ?auto_22305 ) ) ( not ( = ?auto_22300 ?auto_22306 ) ) ( not ( = ?auto_22301 ?auto_22302 ) ) ( not ( = ?auto_22301 ?auto_22303 ) ) ( not ( = ?auto_22301 ?auto_22304 ) ) ( not ( = ?auto_22301 ?auto_22305 ) ) ( not ( = ?auto_22301 ?auto_22306 ) ) ( not ( = ?auto_22302 ?auto_22303 ) ) ( not ( = ?auto_22302 ?auto_22304 ) ) ( not ( = ?auto_22302 ?auto_22305 ) ) ( not ( = ?auto_22302 ?auto_22306 ) ) ( not ( = ?auto_22303 ?auto_22304 ) ) ( not ( = ?auto_22303 ?auto_22305 ) ) ( not ( = ?auto_22303 ?auto_22306 ) ) ( not ( = ?auto_22304 ?auto_22305 ) ) ( not ( = ?auto_22304 ?auto_22306 ) ) ( not ( = ?auto_22305 ?auto_22306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22305 ?auto_22306 )
      ( !STACK ?auto_22305 ?auto_22304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22326 - BLOCK
      ?auto_22327 - BLOCK
      ?auto_22328 - BLOCK
      ?auto_22329 - BLOCK
      ?auto_22330 - BLOCK
      ?auto_22331 - BLOCK
    )
    :vars
    (
      ?auto_22332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22331 ?auto_22332 ) ( ON-TABLE ?auto_22326 ) ( ON ?auto_22327 ?auto_22326 ) ( ON ?auto_22328 ?auto_22327 ) ( ON ?auto_22329 ?auto_22328 ) ( not ( = ?auto_22326 ?auto_22327 ) ) ( not ( = ?auto_22326 ?auto_22328 ) ) ( not ( = ?auto_22326 ?auto_22329 ) ) ( not ( = ?auto_22326 ?auto_22330 ) ) ( not ( = ?auto_22326 ?auto_22331 ) ) ( not ( = ?auto_22326 ?auto_22332 ) ) ( not ( = ?auto_22327 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22329 ) ) ( not ( = ?auto_22327 ?auto_22330 ) ) ( not ( = ?auto_22327 ?auto_22331 ) ) ( not ( = ?auto_22327 ?auto_22332 ) ) ( not ( = ?auto_22328 ?auto_22329 ) ) ( not ( = ?auto_22328 ?auto_22330 ) ) ( not ( = ?auto_22328 ?auto_22331 ) ) ( not ( = ?auto_22328 ?auto_22332 ) ) ( not ( = ?auto_22329 ?auto_22330 ) ) ( not ( = ?auto_22329 ?auto_22331 ) ) ( not ( = ?auto_22329 ?auto_22332 ) ) ( not ( = ?auto_22330 ?auto_22331 ) ) ( not ( = ?auto_22330 ?auto_22332 ) ) ( not ( = ?auto_22331 ?auto_22332 ) ) ( CLEAR ?auto_22329 ) ( ON ?auto_22330 ?auto_22331 ) ( CLEAR ?auto_22330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22326 ?auto_22327 ?auto_22328 ?auto_22329 ?auto_22330 )
      ( MAKE-6PILE ?auto_22326 ?auto_22327 ?auto_22328 ?auto_22329 ?auto_22330 ?auto_22331 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22352 - BLOCK
      ?auto_22353 - BLOCK
      ?auto_22354 - BLOCK
      ?auto_22355 - BLOCK
      ?auto_22356 - BLOCK
      ?auto_22357 - BLOCK
    )
    :vars
    (
      ?auto_22358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22357 ?auto_22358 ) ( ON-TABLE ?auto_22352 ) ( ON ?auto_22353 ?auto_22352 ) ( ON ?auto_22354 ?auto_22353 ) ( not ( = ?auto_22352 ?auto_22353 ) ) ( not ( = ?auto_22352 ?auto_22354 ) ) ( not ( = ?auto_22352 ?auto_22355 ) ) ( not ( = ?auto_22352 ?auto_22356 ) ) ( not ( = ?auto_22352 ?auto_22357 ) ) ( not ( = ?auto_22352 ?auto_22358 ) ) ( not ( = ?auto_22353 ?auto_22354 ) ) ( not ( = ?auto_22353 ?auto_22355 ) ) ( not ( = ?auto_22353 ?auto_22356 ) ) ( not ( = ?auto_22353 ?auto_22357 ) ) ( not ( = ?auto_22353 ?auto_22358 ) ) ( not ( = ?auto_22354 ?auto_22355 ) ) ( not ( = ?auto_22354 ?auto_22356 ) ) ( not ( = ?auto_22354 ?auto_22357 ) ) ( not ( = ?auto_22354 ?auto_22358 ) ) ( not ( = ?auto_22355 ?auto_22356 ) ) ( not ( = ?auto_22355 ?auto_22357 ) ) ( not ( = ?auto_22355 ?auto_22358 ) ) ( not ( = ?auto_22356 ?auto_22357 ) ) ( not ( = ?auto_22356 ?auto_22358 ) ) ( not ( = ?auto_22357 ?auto_22358 ) ) ( ON ?auto_22356 ?auto_22357 ) ( CLEAR ?auto_22354 ) ( ON ?auto_22355 ?auto_22356 ) ( CLEAR ?auto_22355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22352 ?auto_22353 ?auto_22354 ?auto_22355 )
      ( MAKE-6PILE ?auto_22352 ?auto_22353 ?auto_22354 ?auto_22355 ?auto_22356 ?auto_22357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22378 - BLOCK
      ?auto_22379 - BLOCK
      ?auto_22380 - BLOCK
      ?auto_22381 - BLOCK
      ?auto_22382 - BLOCK
      ?auto_22383 - BLOCK
    )
    :vars
    (
      ?auto_22384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22383 ?auto_22384 ) ( ON-TABLE ?auto_22378 ) ( ON ?auto_22379 ?auto_22378 ) ( not ( = ?auto_22378 ?auto_22379 ) ) ( not ( = ?auto_22378 ?auto_22380 ) ) ( not ( = ?auto_22378 ?auto_22381 ) ) ( not ( = ?auto_22378 ?auto_22382 ) ) ( not ( = ?auto_22378 ?auto_22383 ) ) ( not ( = ?auto_22378 ?auto_22384 ) ) ( not ( = ?auto_22379 ?auto_22380 ) ) ( not ( = ?auto_22379 ?auto_22381 ) ) ( not ( = ?auto_22379 ?auto_22382 ) ) ( not ( = ?auto_22379 ?auto_22383 ) ) ( not ( = ?auto_22379 ?auto_22384 ) ) ( not ( = ?auto_22380 ?auto_22381 ) ) ( not ( = ?auto_22380 ?auto_22382 ) ) ( not ( = ?auto_22380 ?auto_22383 ) ) ( not ( = ?auto_22380 ?auto_22384 ) ) ( not ( = ?auto_22381 ?auto_22382 ) ) ( not ( = ?auto_22381 ?auto_22383 ) ) ( not ( = ?auto_22381 ?auto_22384 ) ) ( not ( = ?auto_22382 ?auto_22383 ) ) ( not ( = ?auto_22382 ?auto_22384 ) ) ( not ( = ?auto_22383 ?auto_22384 ) ) ( ON ?auto_22382 ?auto_22383 ) ( ON ?auto_22381 ?auto_22382 ) ( CLEAR ?auto_22379 ) ( ON ?auto_22380 ?auto_22381 ) ( CLEAR ?auto_22380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22378 ?auto_22379 ?auto_22380 )
      ( MAKE-6PILE ?auto_22378 ?auto_22379 ?auto_22380 ?auto_22381 ?auto_22382 ?auto_22383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22404 - BLOCK
      ?auto_22405 - BLOCK
      ?auto_22406 - BLOCK
      ?auto_22407 - BLOCK
      ?auto_22408 - BLOCK
      ?auto_22409 - BLOCK
    )
    :vars
    (
      ?auto_22410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22409 ?auto_22410 ) ( ON-TABLE ?auto_22404 ) ( not ( = ?auto_22404 ?auto_22405 ) ) ( not ( = ?auto_22404 ?auto_22406 ) ) ( not ( = ?auto_22404 ?auto_22407 ) ) ( not ( = ?auto_22404 ?auto_22408 ) ) ( not ( = ?auto_22404 ?auto_22409 ) ) ( not ( = ?auto_22404 ?auto_22410 ) ) ( not ( = ?auto_22405 ?auto_22406 ) ) ( not ( = ?auto_22405 ?auto_22407 ) ) ( not ( = ?auto_22405 ?auto_22408 ) ) ( not ( = ?auto_22405 ?auto_22409 ) ) ( not ( = ?auto_22405 ?auto_22410 ) ) ( not ( = ?auto_22406 ?auto_22407 ) ) ( not ( = ?auto_22406 ?auto_22408 ) ) ( not ( = ?auto_22406 ?auto_22409 ) ) ( not ( = ?auto_22406 ?auto_22410 ) ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( not ( = ?auto_22407 ?auto_22409 ) ) ( not ( = ?auto_22407 ?auto_22410 ) ) ( not ( = ?auto_22408 ?auto_22409 ) ) ( not ( = ?auto_22408 ?auto_22410 ) ) ( not ( = ?auto_22409 ?auto_22410 ) ) ( ON ?auto_22408 ?auto_22409 ) ( ON ?auto_22407 ?auto_22408 ) ( ON ?auto_22406 ?auto_22407 ) ( CLEAR ?auto_22404 ) ( ON ?auto_22405 ?auto_22406 ) ( CLEAR ?auto_22405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22404 ?auto_22405 )
      ( MAKE-6PILE ?auto_22404 ?auto_22405 ?auto_22406 ?auto_22407 ?auto_22408 ?auto_22409 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_22430 - BLOCK
      ?auto_22431 - BLOCK
      ?auto_22432 - BLOCK
      ?auto_22433 - BLOCK
      ?auto_22434 - BLOCK
      ?auto_22435 - BLOCK
    )
    :vars
    (
      ?auto_22436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22435 ?auto_22436 ) ( not ( = ?auto_22430 ?auto_22431 ) ) ( not ( = ?auto_22430 ?auto_22432 ) ) ( not ( = ?auto_22430 ?auto_22433 ) ) ( not ( = ?auto_22430 ?auto_22434 ) ) ( not ( = ?auto_22430 ?auto_22435 ) ) ( not ( = ?auto_22430 ?auto_22436 ) ) ( not ( = ?auto_22431 ?auto_22432 ) ) ( not ( = ?auto_22431 ?auto_22433 ) ) ( not ( = ?auto_22431 ?auto_22434 ) ) ( not ( = ?auto_22431 ?auto_22435 ) ) ( not ( = ?auto_22431 ?auto_22436 ) ) ( not ( = ?auto_22432 ?auto_22433 ) ) ( not ( = ?auto_22432 ?auto_22434 ) ) ( not ( = ?auto_22432 ?auto_22435 ) ) ( not ( = ?auto_22432 ?auto_22436 ) ) ( not ( = ?auto_22433 ?auto_22434 ) ) ( not ( = ?auto_22433 ?auto_22435 ) ) ( not ( = ?auto_22433 ?auto_22436 ) ) ( not ( = ?auto_22434 ?auto_22435 ) ) ( not ( = ?auto_22434 ?auto_22436 ) ) ( not ( = ?auto_22435 ?auto_22436 ) ) ( ON ?auto_22434 ?auto_22435 ) ( ON ?auto_22433 ?auto_22434 ) ( ON ?auto_22432 ?auto_22433 ) ( ON ?auto_22431 ?auto_22432 ) ( ON ?auto_22430 ?auto_22431 ) ( CLEAR ?auto_22430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22430 )
      ( MAKE-6PILE ?auto_22430 ?auto_22431 ?auto_22432 ?auto_22433 ?auto_22434 ?auto_22435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22457 - BLOCK
      ?auto_22458 - BLOCK
      ?auto_22459 - BLOCK
      ?auto_22460 - BLOCK
      ?auto_22461 - BLOCK
      ?auto_22462 - BLOCK
      ?auto_22463 - BLOCK
    )
    :vars
    (
      ?auto_22464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22462 ) ( ON ?auto_22463 ?auto_22464 ) ( CLEAR ?auto_22463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22457 ) ( ON ?auto_22458 ?auto_22457 ) ( ON ?auto_22459 ?auto_22458 ) ( ON ?auto_22460 ?auto_22459 ) ( ON ?auto_22461 ?auto_22460 ) ( ON ?auto_22462 ?auto_22461 ) ( not ( = ?auto_22457 ?auto_22458 ) ) ( not ( = ?auto_22457 ?auto_22459 ) ) ( not ( = ?auto_22457 ?auto_22460 ) ) ( not ( = ?auto_22457 ?auto_22461 ) ) ( not ( = ?auto_22457 ?auto_22462 ) ) ( not ( = ?auto_22457 ?auto_22463 ) ) ( not ( = ?auto_22457 ?auto_22464 ) ) ( not ( = ?auto_22458 ?auto_22459 ) ) ( not ( = ?auto_22458 ?auto_22460 ) ) ( not ( = ?auto_22458 ?auto_22461 ) ) ( not ( = ?auto_22458 ?auto_22462 ) ) ( not ( = ?auto_22458 ?auto_22463 ) ) ( not ( = ?auto_22458 ?auto_22464 ) ) ( not ( = ?auto_22459 ?auto_22460 ) ) ( not ( = ?auto_22459 ?auto_22461 ) ) ( not ( = ?auto_22459 ?auto_22462 ) ) ( not ( = ?auto_22459 ?auto_22463 ) ) ( not ( = ?auto_22459 ?auto_22464 ) ) ( not ( = ?auto_22460 ?auto_22461 ) ) ( not ( = ?auto_22460 ?auto_22462 ) ) ( not ( = ?auto_22460 ?auto_22463 ) ) ( not ( = ?auto_22460 ?auto_22464 ) ) ( not ( = ?auto_22461 ?auto_22462 ) ) ( not ( = ?auto_22461 ?auto_22463 ) ) ( not ( = ?auto_22461 ?auto_22464 ) ) ( not ( = ?auto_22462 ?auto_22463 ) ) ( not ( = ?auto_22462 ?auto_22464 ) ) ( not ( = ?auto_22463 ?auto_22464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_22463 ?auto_22464 )
      ( !STACK ?auto_22463 ?auto_22462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22472 - BLOCK
      ?auto_22473 - BLOCK
      ?auto_22474 - BLOCK
      ?auto_22475 - BLOCK
      ?auto_22476 - BLOCK
      ?auto_22477 - BLOCK
      ?auto_22478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22477 ) ( ON-TABLE ?auto_22478 ) ( CLEAR ?auto_22478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_22472 ) ( ON ?auto_22473 ?auto_22472 ) ( ON ?auto_22474 ?auto_22473 ) ( ON ?auto_22475 ?auto_22474 ) ( ON ?auto_22476 ?auto_22475 ) ( ON ?auto_22477 ?auto_22476 ) ( not ( = ?auto_22472 ?auto_22473 ) ) ( not ( = ?auto_22472 ?auto_22474 ) ) ( not ( = ?auto_22472 ?auto_22475 ) ) ( not ( = ?auto_22472 ?auto_22476 ) ) ( not ( = ?auto_22472 ?auto_22477 ) ) ( not ( = ?auto_22472 ?auto_22478 ) ) ( not ( = ?auto_22473 ?auto_22474 ) ) ( not ( = ?auto_22473 ?auto_22475 ) ) ( not ( = ?auto_22473 ?auto_22476 ) ) ( not ( = ?auto_22473 ?auto_22477 ) ) ( not ( = ?auto_22473 ?auto_22478 ) ) ( not ( = ?auto_22474 ?auto_22475 ) ) ( not ( = ?auto_22474 ?auto_22476 ) ) ( not ( = ?auto_22474 ?auto_22477 ) ) ( not ( = ?auto_22474 ?auto_22478 ) ) ( not ( = ?auto_22475 ?auto_22476 ) ) ( not ( = ?auto_22475 ?auto_22477 ) ) ( not ( = ?auto_22475 ?auto_22478 ) ) ( not ( = ?auto_22476 ?auto_22477 ) ) ( not ( = ?auto_22476 ?auto_22478 ) ) ( not ( = ?auto_22477 ?auto_22478 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_22478 )
      ( !STACK ?auto_22478 ?auto_22477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22486 - BLOCK
      ?auto_22487 - BLOCK
      ?auto_22488 - BLOCK
      ?auto_22489 - BLOCK
      ?auto_22490 - BLOCK
      ?auto_22491 - BLOCK
      ?auto_22492 - BLOCK
    )
    :vars
    (
      ?auto_22493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22492 ?auto_22493 ) ( ON-TABLE ?auto_22486 ) ( ON ?auto_22487 ?auto_22486 ) ( ON ?auto_22488 ?auto_22487 ) ( ON ?auto_22489 ?auto_22488 ) ( ON ?auto_22490 ?auto_22489 ) ( not ( = ?auto_22486 ?auto_22487 ) ) ( not ( = ?auto_22486 ?auto_22488 ) ) ( not ( = ?auto_22486 ?auto_22489 ) ) ( not ( = ?auto_22486 ?auto_22490 ) ) ( not ( = ?auto_22486 ?auto_22491 ) ) ( not ( = ?auto_22486 ?auto_22492 ) ) ( not ( = ?auto_22486 ?auto_22493 ) ) ( not ( = ?auto_22487 ?auto_22488 ) ) ( not ( = ?auto_22487 ?auto_22489 ) ) ( not ( = ?auto_22487 ?auto_22490 ) ) ( not ( = ?auto_22487 ?auto_22491 ) ) ( not ( = ?auto_22487 ?auto_22492 ) ) ( not ( = ?auto_22487 ?auto_22493 ) ) ( not ( = ?auto_22488 ?auto_22489 ) ) ( not ( = ?auto_22488 ?auto_22490 ) ) ( not ( = ?auto_22488 ?auto_22491 ) ) ( not ( = ?auto_22488 ?auto_22492 ) ) ( not ( = ?auto_22488 ?auto_22493 ) ) ( not ( = ?auto_22489 ?auto_22490 ) ) ( not ( = ?auto_22489 ?auto_22491 ) ) ( not ( = ?auto_22489 ?auto_22492 ) ) ( not ( = ?auto_22489 ?auto_22493 ) ) ( not ( = ?auto_22490 ?auto_22491 ) ) ( not ( = ?auto_22490 ?auto_22492 ) ) ( not ( = ?auto_22490 ?auto_22493 ) ) ( not ( = ?auto_22491 ?auto_22492 ) ) ( not ( = ?auto_22491 ?auto_22493 ) ) ( not ( = ?auto_22492 ?auto_22493 ) ) ( CLEAR ?auto_22490 ) ( ON ?auto_22491 ?auto_22492 ) ( CLEAR ?auto_22491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_22486 ?auto_22487 ?auto_22488 ?auto_22489 ?auto_22490 ?auto_22491 )
      ( MAKE-7PILE ?auto_22486 ?auto_22487 ?auto_22488 ?auto_22489 ?auto_22490 ?auto_22491 ?auto_22492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22501 - BLOCK
      ?auto_22502 - BLOCK
      ?auto_22503 - BLOCK
      ?auto_22504 - BLOCK
      ?auto_22505 - BLOCK
      ?auto_22506 - BLOCK
      ?auto_22507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22507 ) ( ON-TABLE ?auto_22501 ) ( ON ?auto_22502 ?auto_22501 ) ( ON ?auto_22503 ?auto_22502 ) ( ON ?auto_22504 ?auto_22503 ) ( ON ?auto_22505 ?auto_22504 ) ( not ( = ?auto_22501 ?auto_22502 ) ) ( not ( = ?auto_22501 ?auto_22503 ) ) ( not ( = ?auto_22501 ?auto_22504 ) ) ( not ( = ?auto_22501 ?auto_22505 ) ) ( not ( = ?auto_22501 ?auto_22506 ) ) ( not ( = ?auto_22501 ?auto_22507 ) ) ( not ( = ?auto_22502 ?auto_22503 ) ) ( not ( = ?auto_22502 ?auto_22504 ) ) ( not ( = ?auto_22502 ?auto_22505 ) ) ( not ( = ?auto_22502 ?auto_22506 ) ) ( not ( = ?auto_22502 ?auto_22507 ) ) ( not ( = ?auto_22503 ?auto_22504 ) ) ( not ( = ?auto_22503 ?auto_22505 ) ) ( not ( = ?auto_22503 ?auto_22506 ) ) ( not ( = ?auto_22503 ?auto_22507 ) ) ( not ( = ?auto_22504 ?auto_22505 ) ) ( not ( = ?auto_22504 ?auto_22506 ) ) ( not ( = ?auto_22504 ?auto_22507 ) ) ( not ( = ?auto_22505 ?auto_22506 ) ) ( not ( = ?auto_22505 ?auto_22507 ) ) ( not ( = ?auto_22506 ?auto_22507 ) ) ( CLEAR ?auto_22505 ) ( ON ?auto_22506 ?auto_22507 ) ( CLEAR ?auto_22506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_22501 ?auto_22502 ?auto_22503 ?auto_22504 ?auto_22505 ?auto_22506 )
      ( MAKE-7PILE ?auto_22501 ?auto_22502 ?auto_22503 ?auto_22504 ?auto_22505 ?auto_22506 ?auto_22507 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22515 - BLOCK
      ?auto_22516 - BLOCK
      ?auto_22517 - BLOCK
      ?auto_22518 - BLOCK
      ?auto_22519 - BLOCK
      ?auto_22520 - BLOCK
      ?auto_22521 - BLOCK
    )
    :vars
    (
      ?auto_22522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22521 ?auto_22522 ) ( ON-TABLE ?auto_22515 ) ( ON ?auto_22516 ?auto_22515 ) ( ON ?auto_22517 ?auto_22516 ) ( ON ?auto_22518 ?auto_22517 ) ( not ( = ?auto_22515 ?auto_22516 ) ) ( not ( = ?auto_22515 ?auto_22517 ) ) ( not ( = ?auto_22515 ?auto_22518 ) ) ( not ( = ?auto_22515 ?auto_22519 ) ) ( not ( = ?auto_22515 ?auto_22520 ) ) ( not ( = ?auto_22515 ?auto_22521 ) ) ( not ( = ?auto_22515 ?auto_22522 ) ) ( not ( = ?auto_22516 ?auto_22517 ) ) ( not ( = ?auto_22516 ?auto_22518 ) ) ( not ( = ?auto_22516 ?auto_22519 ) ) ( not ( = ?auto_22516 ?auto_22520 ) ) ( not ( = ?auto_22516 ?auto_22521 ) ) ( not ( = ?auto_22516 ?auto_22522 ) ) ( not ( = ?auto_22517 ?auto_22518 ) ) ( not ( = ?auto_22517 ?auto_22519 ) ) ( not ( = ?auto_22517 ?auto_22520 ) ) ( not ( = ?auto_22517 ?auto_22521 ) ) ( not ( = ?auto_22517 ?auto_22522 ) ) ( not ( = ?auto_22518 ?auto_22519 ) ) ( not ( = ?auto_22518 ?auto_22520 ) ) ( not ( = ?auto_22518 ?auto_22521 ) ) ( not ( = ?auto_22518 ?auto_22522 ) ) ( not ( = ?auto_22519 ?auto_22520 ) ) ( not ( = ?auto_22519 ?auto_22521 ) ) ( not ( = ?auto_22519 ?auto_22522 ) ) ( not ( = ?auto_22520 ?auto_22521 ) ) ( not ( = ?auto_22520 ?auto_22522 ) ) ( not ( = ?auto_22521 ?auto_22522 ) ) ( ON ?auto_22520 ?auto_22521 ) ( CLEAR ?auto_22518 ) ( ON ?auto_22519 ?auto_22520 ) ( CLEAR ?auto_22519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22515 ?auto_22516 ?auto_22517 ?auto_22518 ?auto_22519 )
      ( MAKE-7PILE ?auto_22515 ?auto_22516 ?auto_22517 ?auto_22518 ?auto_22519 ?auto_22520 ?auto_22521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22530 - BLOCK
      ?auto_22531 - BLOCK
      ?auto_22532 - BLOCK
      ?auto_22533 - BLOCK
      ?auto_22534 - BLOCK
      ?auto_22535 - BLOCK
      ?auto_22536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22536 ) ( ON-TABLE ?auto_22530 ) ( ON ?auto_22531 ?auto_22530 ) ( ON ?auto_22532 ?auto_22531 ) ( ON ?auto_22533 ?auto_22532 ) ( not ( = ?auto_22530 ?auto_22531 ) ) ( not ( = ?auto_22530 ?auto_22532 ) ) ( not ( = ?auto_22530 ?auto_22533 ) ) ( not ( = ?auto_22530 ?auto_22534 ) ) ( not ( = ?auto_22530 ?auto_22535 ) ) ( not ( = ?auto_22530 ?auto_22536 ) ) ( not ( = ?auto_22531 ?auto_22532 ) ) ( not ( = ?auto_22531 ?auto_22533 ) ) ( not ( = ?auto_22531 ?auto_22534 ) ) ( not ( = ?auto_22531 ?auto_22535 ) ) ( not ( = ?auto_22531 ?auto_22536 ) ) ( not ( = ?auto_22532 ?auto_22533 ) ) ( not ( = ?auto_22532 ?auto_22534 ) ) ( not ( = ?auto_22532 ?auto_22535 ) ) ( not ( = ?auto_22532 ?auto_22536 ) ) ( not ( = ?auto_22533 ?auto_22534 ) ) ( not ( = ?auto_22533 ?auto_22535 ) ) ( not ( = ?auto_22533 ?auto_22536 ) ) ( not ( = ?auto_22534 ?auto_22535 ) ) ( not ( = ?auto_22534 ?auto_22536 ) ) ( not ( = ?auto_22535 ?auto_22536 ) ) ( ON ?auto_22535 ?auto_22536 ) ( CLEAR ?auto_22533 ) ( ON ?auto_22534 ?auto_22535 ) ( CLEAR ?auto_22534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_22530 ?auto_22531 ?auto_22532 ?auto_22533 ?auto_22534 )
      ( MAKE-7PILE ?auto_22530 ?auto_22531 ?auto_22532 ?auto_22533 ?auto_22534 ?auto_22535 ?auto_22536 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22544 - BLOCK
      ?auto_22545 - BLOCK
      ?auto_22546 - BLOCK
      ?auto_22547 - BLOCK
      ?auto_22548 - BLOCK
      ?auto_22549 - BLOCK
      ?auto_22550 - BLOCK
    )
    :vars
    (
      ?auto_22551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22550 ?auto_22551 ) ( ON-TABLE ?auto_22544 ) ( ON ?auto_22545 ?auto_22544 ) ( ON ?auto_22546 ?auto_22545 ) ( not ( = ?auto_22544 ?auto_22545 ) ) ( not ( = ?auto_22544 ?auto_22546 ) ) ( not ( = ?auto_22544 ?auto_22547 ) ) ( not ( = ?auto_22544 ?auto_22548 ) ) ( not ( = ?auto_22544 ?auto_22549 ) ) ( not ( = ?auto_22544 ?auto_22550 ) ) ( not ( = ?auto_22544 ?auto_22551 ) ) ( not ( = ?auto_22545 ?auto_22546 ) ) ( not ( = ?auto_22545 ?auto_22547 ) ) ( not ( = ?auto_22545 ?auto_22548 ) ) ( not ( = ?auto_22545 ?auto_22549 ) ) ( not ( = ?auto_22545 ?auto_22550 ) ) ( not ( = ?auto_22545 ?auto_22551 ) ) ( not ( = ?auto_22546 ?auto_22547 ) ) ( not ( = ?auto_22546 ?auto_22548 ) ) ( not ( = ?auto_22546 ?auto_22549 ) ) ( not ( = ?auto_22546 ?auto_22550 ) ) ( not ( = ?auto_22546 ?auto_22551 ) ) ( not ( = ?auto_22547 ?auto_22548 ) ) ( not ( = ?auto_22547 ?auto_22549 ) ) ( not ( = ?auto_22547 ?auto_22550 ) ) ( not ( = ?auto_22547 ?auto_22551 ) ) ( not ( = ?auto_22548 ?auto_22549 ) ) ( not ( = ?auto_22548 ?auto_22550 ) ) ( not ( = ?auto_22548 ?auto_22551 ) ) ( not ( = ?auto_22549 ?auto_22550 ) ) ( not ( = ?auto_22549 ?auto_22551 ) ) ( not ( = ?auto_22550 ?auto_22551 ) ) ( ON ?auto_22549 ?auto_22550 ) ( ON ?auto_22548 ?auto_22549 ) ( CLEAR ?auto_22546 ) ( ON ?auto_22547 ?auto_22548 ) ( CLEAR ?auto_22547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22544 ?auto_22545 ?auto_22546 ?auto_22547 )
      ( MAKE-7PILE ?auto_22544 ?auto_22545 ?auto_22546 ?auto_22547 ?auto_22548 ?auto_22549 ?auto_22550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22559 - BLOCK
      ?auto_22560 - BLOCK
      ?auto_22561 - BLOCK
      ?auto_22562 - BLOCK
      ?auto_22563 - BLOCK
      ?auto_22564 - BLOCK
      ?auto_22565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22565 ) ( ON-TABLE ?auto_22559 ) ( ON ?auto_22560 ?auto_22559 ) ( ON ?auto_22561 ?auto_22560 ) ( not ( = ?auto_22559 ?auto_22560 ) ) ( not ( = ?auto_22559 ?auto_22561 ) ) ( not ( = ?auto_22559 ?auto_22562 ) ) ( not ( = ?auto_22559 ?auto_22563 ) ) ( not ( = ?auto_22559 ?auto_22564 ) ) ( not ( = ?auto_22559 ?auto_22565 ) ) ( not ( = ?auto_22560 ?auto_22561 ) ) ( not ( = ?auto_22560 ?auto_22562 ) ) ( not ( = ?auto_22560 ?auto_22563 ) ) ( not ( = ?auto_22560 ?auto_22564 ) ) ( not ( = ?auto_22560 ?auto_22565 ) ) ( not ( = ?auto_22561 ?auto_22562 ) ) ( not ( = ?auto_22561 ?auto_22563 ) ) ( not ( = ?auto_22561 ?auto_22564 ) ) ( not ( = ?auto_22561 ?auto_22565 ) ) ( not ( = ?auto_22562 ?auto_22563 ) ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( not ( = ?auto_22562 ?auto_22565 ) ) ( not ( = ?auto_22563 ?auto_22564 ) ) ( not ( = ?auto_22563 ?auto_22565 ) ) ( not ( = ?auto_22564 ?auto_22565 ) ) ( ON ?auto_22564 ?auto_22565 ) ( ON ?auto_22563 ?auto_22564 ) ( CLEAR ?auto_22561 ) ( ON ?auto_22562 ?auto_22563 ) ( CLEAR ?auto_22562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_22559 ?auto_22560 ?auto_22561 ?auto_22562 )
      ( MAKE-7PILE ?auto_22559 ?auto_22560 ?auto_22561 ?auto_22562 ?auto_22563 ?auto_22564 ?auto_22565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22573 - BLOCK
      ?auto_22574 - BLOCK
      ?auto_22575 - BLOCK
      ?auto_22576 - BLOCK
      ?auto_22577 - BLOCK
      ?auto_22578 - BLOCK
      ?auto_22579 - BLOCK
    )
    :vars
    (
      ?auto_22580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22579 ?auto_22580 ) ( ON-TABLE ?auto_22573 ) ( ON ?auto_22574 ?auto_22573 ) ( not ( = ?auto_22573 ?auto_22574 ) ) ( not ( = ?auto_22573 ?auto_22575 ) ) ( not ( = ?auto_22573 ?auto_22576 ) ) ( not ( = ?auto_22573 ?auto_22577 ) ) ( not ( = ?auto_22573 ?auto_22578 ) ) ( not ( = ?auto_22573 ?auto_22579 ) ) ( not ( = ?auto_22573 ?auto_22580 ) ) ( not ( = ?auto_22574 ?auto_22575 ) ) ( not ( = ?auto_22574 ?auto_22576 ) ) ( not ( = ?auto_22574 ?auto_22577 ) ) ( not ( = ?auto_22574 ?auto_22578 ) ) ( not ( = ?auto_22574 ?auto_22579 ) ) ( not ( = ?auto_22574 ?auto_22580 ) ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22575 ?auto_22577 ) ) ( not ( = ?auto_22575 ?auto_22578 ) ) ( not ( = ?auto_22575 ?auto_22579 ) ) ( not ( = ?auto_22575 ?auto_22580 ) ) ( not ( = ?auto_22576 ?auto_22577 ) ) ( not ( = ?auto_22576 ?auto_22578 ) ) ( not ( = ?auto_22576 ?auto_22579 ) ) ( not ( = ?auto_22576 ?auto_22580 ) ) ( not ( = ?auto_22577 ?auto_22578 ) ) ( not ( = ?auto_22577 ?auto_22579 ) ) ( not ( = ?auto_22577 ?auto_22580 ) ) ( not ( = ?auto_22578 ?auto_22579 ) ) ( not ( = ?auto_22578 ?auto_22580 ) ) ( not ( = ?auto_22579 ?auto_22580 ) ) ( ON ?auto_22578 ?auto_22579 ) ( ON ?auto_22577 ?auto_22578 ) ( ON ?auto_22576 ?auto_22577 ) ( CLEAR ?auto_22574 ) ( ON ?auto_22575 ?auto_22576 ) ( CLEAR ?auto_22575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22573 ?auto_22574 ?auto_22575 )
      ( MAKE-7PILE ?auto_22573 ?auto_22574 ?auto_22575 ?auto_22576 ?auto_22577 ?auto_22578 ?auto_22579 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22588 - BLOCK
      ?auto_22589 - BLOCK
      ?auto_22590 - BLOCK
      ?auto_22591 - BLOCK
      ?auto_22592 - BLOCK
      ?auto_22593 - BLOCK
      ?auto_22594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22594 ) ( ON-TABLE ?auto_22588 ) ( ON ?auto_22589 ?auto_22588 ) ( not ( = ?auto_22588 ?auto_22589 ) ) ( not ( = ?auto_22588 ?auto_22590 ) ) ( not ( = ?auto_22588 ?auto_22591 ) ) ( not ( = ?auto_22588 ?auto_22592 ) ) ( not ( = ?auto_22588 ?auto_22593 ) ) ( not ( = ?auto_22588 ?auto_22594 ) ) ( not ( = ?auto_22589 ?auto_22590 ) ) ( not ( = ?auto_22589 ?auto_22591 ) ) ( not ( = ?auto_22589 ?auto_22592 ) ) ( not ( = ?auto_22589 ?auto_22593 ) ) ( not ( = ?auto_22589 ?auto_22594 ) ) ( not ( = ?auto_22590 ?auto_22591 ) ) ( not ( = ?auto_22590 ?auto_22592 ) ) ( not ( = ?auto_22590 ?auto_22593 ) ) ( not ( = ?auto_22590 ?auto_22594 ) ) ( not ( = ?auto_22591 ?auto_22592 ) ) ( not ( = ?auto_22591 ?auto_22593 ) ) ( not ( = ?auto_22591 ?auto_22594 ) ) ( not ( = ?auto_22592 ?auto_22593 ) ) ( not ( = ?auto_22592 ?auto_22594 ) ) ( not ( = ?auto_22593 ?auto_22594 ) ) ( ON ?auto_22593 ?auto_22594 ) ( ON ?auto_22592 ?auto_22593 ) ( ON ?auto_22591 ?auto_22592 ) ( CLEAR ?auto_22589 ) ( ON ?auto_22590 ?auto_22591 ) ( CLEAR ?auto_22590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_22588 ?auto_22589 ?auto_22590 )
      ( MAKE-7PILE ?auto_22588 ?auto_22589 ?auto_22590 ?auto_22591 ?auto_22592 ?auto_22593 ?auto_22594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22602 - BLOCK
      ?auto_22603 - BLOCK
      ?auto_22604 - BLOCK
      ?auto_22605 - BLOCK
      ?auto_22606 - BLOCK
      ?auto_22607 - BLOCK
      ?auto_22608 - BLOCK
    )
    :vars
    (
      ?auto_22609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22608 ?auto_22609 ) ( ON-TABLE ?auto_22602 ) ( not ( = ?auto_22602 ?auto_22603 ) ) ( not ( = ?auto_22602 ?auto_22604 ) ) ( not ( = ?auto_22602 ?auto_22605 ) ) ( not ( = ?auto_22602 ?auto_22606 ) ) ( not ( = ?auto_22602 ?auto_22607 ) ) ( not ( = ?auto_22602 ?auto_22608 ) ) ( not ( = ?auto_22602 ?auto_22609 ) ) ( not ( = ?auto_22603 ?auto_22604 ) ) ( not ( = ?auto_22603 ?auto_22605 ) ) ( not ( = ?auto_22603 ?auto_22606 ) ) ( not ( = ?auto_22603 ?auto_22607 ) ) ( not ( = ?auto_22603 ?auto_22608 ) ) ( not ( = ?auto_22603 ?auto_22609 ) ) ( not ( = ?auto_22604 ?auto_22605 ) ) ( not ( = ?auto_22604 ?auto_22606 ) ) ( not ( = ?auto_22604 ?auto_22607 ) ) ( not ( = ?auto_22604 ?auto_22608 ) ) ( not ( = ?auto_22604 ?auto_22609 ) ) ( not ( = ?auto_22605 ?auto_22606 ) ) ( not ( = ?auto_22605 ?auto_22607 ) ) ( not ( = ?auto_22605 ?auto_22608 ) ) ( not ( = ?auto_22605 ?auto_22609 ) ) ( not ( = ?auto_22606 ?auto_22607 ) ) ( not ( = ?auto_22606 ?auto_22608 ) ) ( not ( = ?auto_22606 ?auto_22609 ) ) ( not ( = ?auto_22607 ?auto_22608 ) ) ( not ( = ?auto_22607 ?auto_22609 ) ) ( not ( = ?auto_22608 ?auto_22609 ) ) ( ON ?auto_22607 ?auto_22608 ) ( ON ?auto_22606 ?auto_22607 ) ( ON ?auto_22605 ?auto_22606 ) ( ON ?auto_22604 ?auto_22605 ) ( CLEAR ?auto_22602 ) ( ON ?auto_22603 ?auto_22604 ) ( CLEAR ?auto_22603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22602 ?auto_22603 )
      ( MAKE-7PILE ?auto_22602 ?auto_22603 ?auto_22604 ?auto_22605 ?auto_22606 ?auto_22607 ?auto_22608 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22617 - BLOCK
      ?auto_22618 - BLOCK
      ?auto_22619 - BLOCK
      ?auto_22620 - BLOCK
      ?auto_22621 - BLOCK
      ?auto_22622 - BLOCK
      ?auto_22623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22623 ) ( ON-TABLE ?auto_22617 ) ( not ( = ?auto_22617 ?auto_22618 ) ) ( not ( = ?auto_22617 ?auto_22619 ) ) ( not ( = ?auto_22617 ?auto_22620 ) ) ( not ( = ?auto_22617 ?auto_22621 ) ) ( not ( = ?auto_22617 ?auto_22622 ) ) ( not ( = ?auto_22617 ?auto_22623 ) ) ( not ( = ?auto_22618 ?auto_22619 ) ) ( not ( = ?auto_22618 ?auto_22620 ) ) ( not ( = ?auto_22618 ?auto_22621 ) ) ( not ( = ?auto_22618 ?auto_22622 ) ) ( not ( = ?auto_22618 ?auto_22623 ) ) ( not ( = ?auto_22619 ?auto_22620 ) ) ( not ( = ?auto_22619 ?auto_22621 ) ) ( not ( = ?auto_22619 ?auto_22622 ) ) ( not ( = ?auto_22619 ?auto_22623 ) ) ( not ( = ?auto_22620 ?auto_22621 ) ) ( not ( = ?auto_22620 ?auto_22622 ) ) ( not ( = ?auto_22620 ?auto_22623 ) ) ( not ( = ?auto_22621 ?auto_22622 ) ) ( not ( = ?auto_22621 ?auto_22623 ) ) ( not ( = ?auto_22622 ?auto_22623 ) ) ( ON ?auto_22622 ?auto_22623 ) ( ON ?auto_22621 ?auto_22622 ) ( ON ?auto_22620 ?auto_22621 ) ( ON ?auto_22619 ?auto_22620 ) ( CLEAR ?auto_22617 ) ( ON ?auto_22618 ?auto_22619 ) ( CLEAR ?auto_22618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_22617 ?auto_22618 )
      ( MAKE-7PILE ?auto_22617 ?auto_22618 ?auto_22619 ?auto_22620 ?auto_22621 ?auto_22622 ?auto_22623 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22631 - BLOCK
      ?auto_22632 - BLOCK
      ?auto_22633 - BLOCK
      ?auto_22634 - BLOCK
      ?auto_22635 - BLOCK
      ?auto_22636 - BLOCK
      ?auto_22637 - BLOCK
    )
    :vars
    (
      ?auto_22638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22637 ?auto_22638 ) ( not ( = ?auto_22631 ?auto_22632 ) ) ( not ( = ?auto_22631 ?auto_22633 ) ) ( not ( = ?auto_22631 ?auto_22634 ) ) ( not ( = ?auto_22631 ?auto_22635 ) ) ( not ( = ?auto_22631 ?auto_22636 ) ) ( not ( = ?auto_22631 ?auto_22637 ) ) ( not ( = ?auto_22631 ?auto_22638 ) ) ( not ( = ?auto_22632 ?auto_22633 ) ) ( not ( = ?auto_22632 ?auto_22634 ) ) ( not ( = ?auto_22632 ?auto_22635 ) ) ( not ( = ?auto_22632 ?auto_22636 ) ) ( not ( = ?auto_22632 ?auto_22637 ) ) ( not ( = ?auto_22632 ?auto_22638 ) ) ( not ( = ?auto_22633 ?auto_22634 ) ) ( not ( = ?auto_22633 ?auto_22635 ) ) ( not ( = ?auto_22633 ?auto_22636 ) ) ( not ( = ?auto_22633 ?auto_22637 ) ) ( not ( = ?auto_22633 ?auto_22638 ) ) ( not ( = ?auto_22634 ?auto_22635 ) ) ( not ( = ?auto_22634 ?auto_22636 ) ) ( not ( = ?auto_22634 ?auto_22637 ) ) ( not ( = ?auto_22634 ?auto_22638 ) ) ( not ( = ?auto_22635 ?auto_22636 ) ) ( not ( = ?auto_22635 ?auto_22637 ) ) ( not ( = ?auto_22635 ?auto_22638 ) ) ( not ( = ?auto_22636 ?auto_22637 ) ) ( not ( = ?auto_22636 ?auto_22638 ) ) ( not ( = ?auto_22637 ?auto_22638 ) ) ( ON ?auto_22636 ?auto_22637 ) ( ON ?auto_22635 ?auto_22636 ) ( ON ?auto_22634 ?auto_22635 ) ( ON ?auto_22633 ?auto_22634 ) ( ON ?auto_22632 ?auto_22633 ) ( ON ?auto_22631 ?auto_22632 ) ( CLEAR ?auto_22631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22631 )
      ( MAKE-7PILE ?auto_22631 ?auto_22632 ?auto_22633 ?auto_22634 ?auto_22635 ?auto_22636 ?auto_22637 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22646 - BLOCK
      ?auto_22647 - BLOCK
      ?auto_22648 - BLOCK
      ?auto_22649 - BLOCK
      ?auto_22650 - BLOCK
      ?auto_22651 - BLOCK
      ?auto_22652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22652 ) ( not ( = ?auto_22646 ?auto_22647 ) ) ( not ( = ?auto_22646 ?auto_22648 ) ) ( not ( = ?auto_22646 ?auto_22649 ) ) ( not ( = ?auto_22646 ?auto_22650 ) ) ( not ( = ?auto_22646 ?auto_22651 ) ) ( not ( = ?auto_22646 ?auto_22652 ) ) ( not ( = ?auto_22647 ?auto_22648 ) ) ( not ( = ?auto_22647 ?auto_22649 ) ) ( not ( = ?auto_22647 ?auto_22650 ) ) ( not ( = ?auto_22647 ?auto_22651 ) ) ( not ( = ?auto_22647 ?auto_22652 ) ) ( not ( = ?auto_22648 ?auto_22649 ) ) ( not ( = ?auto_22648 ?auto_22650 ) ) ( not ( = ?auto_22648 ?auto_22651 ) ) ( not ( = ?auto_22648 ?auto_22652 ) ) ( not ( = ?auto_22649 ?auto_22650 ) ) ( not ( = ?auto_22649 ?auto_22651 ) ) ( not ( = ?auto_22649 ?auto_22652 ) ) ( not ( = ?auto_22650 ?auto_22651 ) ) ( not ( = ?auto_22650 ?auto_22652 ) ) ( not ( = ?auto_22651 ?auto_22652 ) ) ( ON ?auto_22651 ?auto_22652 ) ( ON ?auto_22650 ?auto_22651 ) ( ON ?auto_22649 ?auto_22650 ) ( ON ?auto_22648 ?auto_22649 ) ( ON ?auto_22647 ?auto_22648 ) ( ON ?auto_22646 ?auto_22647 ) ( CLEAR ?auto_22646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22646 )
      ( MAKE-7PILE ?auto_22646 ?auto_22647 ?auto_22648 ?auto_22649 ?auto_22650 ?auto_22651 ?auto_22652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22660 - BLOCK
      ?auto_22661 - BLOCK
      ?auto_22662 - BLOCK
      ?auto_22663 - BLOCK
      ?auto_22664 - BLOCK
      ?auto_22665 - BLOCK
      ?auto_22666 - BLOCK
    )
    :vars
    (
      ?auto_22667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22660 ?auto_22661 ) ) ( not ( = ?auto_22660 ?auto_22662 ) ) ( not ( = ?auto_22660 ?auto_22663 ) ) ( not ( = ?auto_22660 ?auto_22664 ) ) ( not ( = ?auto_22660 ?auto_22665 ) ) ( not ( = ?auto_22660 ?auto_22666 ) ) ( not ( = ?auto_22661 ?auto_22662 ) ) ( not ( = ?auto_22661 ?auto_22663 ) ) ( not ( = ?auto_22661 ?auto_22664 ) ) ( not ( = ?auto_22661 ?auto_22665 ) ) ( not ( = ?auto_22661 ?auto_22666 ) ) ( not ( = ?auto_22662 ?auto_22663 ) ) ( not ( = ?auto_22662 ?auto_22664 ) ) ( not ( = ?auto_22662 ?auto_22665 ) ) ( not ( = ?auto_22662 ?auto_22666 ) ) ( not ( = ?auto_22663 ?auto_22664 ) ) ( not ( = ?auto_22663 ?auto_22665 ) ) ( not ( = ?auto_22663 ?auto_22666 ) ) ( not ( = ?auto_22664 ?auto_22665 ) ) ( not ( = ?auto_22664 ?auto_22666 ) ) ( not ( = ?auto_22665 ?auto_22666 ) ) ( ON ?auto_22660 ?auto_22667 ) ( not ( = ?auto_22666 ?auto_22667 ) ) ( not ( = ?auto_22665 ?auto_22667 ) ) ( not ( = ?auto_22664 ?auto_22667 ) ) ( not ( = ?auto_22663 ?auto_22667 ) ) ( not ( = ?auto_22662 ?auto_22667 ) ) ( not ( = ?auto_22661 ?auto_22667 ) ) ( not ( = ?auto_22660 ?auto_22667 ) ) ( ON ?auto_22661 ?auto_22660 ) ( ON ?auto_22662 ?auto_22661 ) ( ON ?auto_22663 ?auto_22662 ) ( ON ?auto_22664 ?auto_22663 ) ( ON ?auto_22665 ?auto_22664 ) ( ON ?auto_22666 ?auto_22665 ) ( CLEAR ?auto_22666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_22666 ?auto_22665 ?auto_22664 ?auto_22663 ?auto_22662 ?auto_22661 ?auto_22660 )
      ( MAKE-7PILE ?auto_22660 ?auto_22661 ?auto_22662 ?auto_22663 ?auto_22664 ?auto_22665 ?auto_22666 ) )
  )

)

