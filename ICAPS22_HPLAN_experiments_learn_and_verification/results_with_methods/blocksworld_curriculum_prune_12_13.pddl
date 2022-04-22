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
      ?auto_186098 - BLOCK
    )
    :vars
    (
      ?auto_186099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186098 ?auto_186099 ) ( CLEAR ?auto_186098 ) ( HAND-EMPTY ) ( not ( = ?auto_186098 ?auto_186099 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186098 ?auto_186099 )
      ( !PUTDOWN ?auto_186098 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186105 - BLOCK
      ?auto_186106 - BLOCK
    )
    :vars
    (
      ?auto_186107 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186105 ) ( ON ?auto_186106 ?auto_186107 ) ( CLEAR ?auto_186106 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186105 ) ( not ( = ?auto_186105 ?auto_186106 ) ) ( not ( = ?auto_186105 ?auto_186107 ) ) ( not ( = ?auto_186106 ?auto_186107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186106 ?auto_186107 )
      ( !STACK ?auto_186106 ?auto_186105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186115 - BLOCK
      ?auto_186116 - BLOCK
    )
    :vars
    (
      ?auto_186117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186116 ?auto_186117 ) ( not ( = ?auto_186115 ?auto_186116 ) ) ( not ( = ?auto_186115 ?auto_186117 ) ) ( not ( = ?auto_186116 ?auto_186117 ) ) ( ON ?auto_186115 ?auto_186116 ) ( CLEAR ?auto_186115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186115 )
      ( MAKE-2PILE ?auto_186115 ?auto_186116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186126 - BLOCK
      ?auto_186127 - BLOCK
      ?auto_186128 - BLOCK
    )
    :vars
    (
      ?auto_186129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186127 ) ( ON ?auto_186128 ?auto_186129 ) ( CLEAR ?auto_186128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186126 ) ( ON ?auto_186127 ?auto_186126 ) ( not ( = ?auto_186126 ?auto_186127 ) ) ( not ( = ?auto_186126 ?auto_186128 ) ) ( not ( = ?auto_186126 ?auto_186129 ) ) ( not ( = ?auto_186127 ?auto_186128 ) ) ( not ( = ?auto_186127 ?auto_186129 ) ) ( not ( = ?auto_186128 ?auto_186129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186128 ?auto_186129 )
      ( !STACK ?auto_186128 ?auto_186127 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186140 - BLOCK
      ?auto_186141 - BLOCK
      ?auto_186142 - BLOCK
    )
    :vars
    (
      ?auto_186143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186142 ?auto_186143 ) ( ON-TABLE ?auto_186140 ) ( not ( = ?auto_186140 ?auto_186141 ) ) ( not ( = ?auto_186140 ?auto_186142 ) ) ( not ( = ?auto_186140 ?auto_186143 ) ) ( not ( = ?auto_186141 ?auto_186142 ) ) ( not ( = ?auto_186141 ?auto_186143 ) ) ( not ( = ?auto_186142 ?auto_186143 ) ) ( CLEAR ?auto_186140 ) ( ON ?auto_186141 ?auto_186142 ) ( CLEAR ?auto_186141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186140 ?auto_186141 )
      ( MAKE-3PILE ?auto_186140 ?auto_186141 ?auto_186142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186154 - BLOCK
      ?auto_186155 - BLOCK
      ?auto_186156 - BLOCK
    )
    :vars
    (
      ?auto_186157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186156 ?auto_186157 ) ( not ( = ?auto_186154 ?auto_186155 ) ) ( not ( = ?auto_186154 ?auto_186156 ) ) ( not ( = ?auto_186154 ?auto_186157 ) ) ( not ( = ?auto_186155 ?auto_186156 ) ) ( not ( = ?auto_186155 ?auto_186157 ) ) ( not ( = ?auto_186156 ?auto_186157 ) ) ( ON ?auto_186155 ?auto_186156 ) ( ON ?auto_186154 ?auto_186155 ) ( CLEAR ?auto_186154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186154 )
      ( MAKE-3PILE ?auto_186154 ?auto_186155 ?auto_186156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186169 - BLOCK
      ?auto_186170 - BLOCK
      ?auto_186171 - BLOCK
      ?auto_186172 - BLOCK
    )
    :vars
    (
      ?auto_186173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186171 ) ( ON ?auto_186172 ?auto_186173 ) ( CLEAR ?auto_186172 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186169 ) ( ON ?auto_186170 ?auto_186169 ) ( ON ?auto_186171 ?auto_186170 ) ( not ( = ?auto_186169 ?auto_186170 ) ) ( not ( = ?auto_186169 ?auto_186171 ) ) ( not ( = ?auto_186169 ?auto_186172 ) ) ( not ( = ?auto_186169 ?auto_186173 ) ) ( not ( = ?auto_186170 ?auto_186171 ) ) ( not ( = ?auto_186170 ?auto_186172 ) ) ( not ( = ?auto_186170 ?auto_186173 ) ) ( not ( = ?auto_186171 ?auto_186172 ) ) ( not ( = ?auto_186171 ?auto_186173 ) ) ( not ( = ?auto_186172 ?auto_186173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186172 ?auto_186173 )
      ( !STACK ?auto_186172 ?auto_186171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186187 - BLOCK
      ?auto_186188 - BLOCK
      ?auto_186189 - BLOCK
      ?auto_186190 - BLOCK
    )
    :vars
    (
      ?auto_186191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186190 ?auto_186191 ) ( ON-TABLE ?auto_186187 ) ( ON ?auto_186188 ?auto_186187 ) ( not ( = ?auto_186187 ?auto_186188 ) ) ( not ( = ?auto_186187 ?auto_186189 ) ) ( not ( = ?auto_186187 ?auto_186190 ) ) ( not ( = ?auto_186187 ?auto_186191 ) ) ( not ( = ?auto_186188 ?auto_186189 ) ) ( not ( = ?auto_186188 ?auto_186190 ) ) ( not ( = ?auto_186188 ?auto_186191 ) ) ( not ( = ?auto_186189 ?auto_186190 ) ) ( not ( = ?auto_186189 ?auto_186191 ) ) ( not ( = ?auto_186190 ?auto_186191 ) ) ( CLEAR ?auto_186188 ) ( ON ?auto_186189 ?auto_186190 ) ( CLEAR ?auto_186189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186187 ?auto_186188 ?auto_186189 )
      ( MAKE-4PILE ?auto_186187 ?auto_186188 ?auto_186189 ?auto_186190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186205 - BLOCK
      ?auto_186206 - BLOCK
      ?auto_186207 - BLOCK
      ?auto_186208 - BLOCK
    )
    :vars
    (
      ?auto_186209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186208 ?auto_186209 ) ( ON-TABLE ?auto_186205 ) ( not ( = ?auto_186205 ?auto_186206 ) ) ( not ( = ?auto_186205 ?auto_186207 ) ) ( not ( = ?auto_186205 ?auto_186208 ) ) ( not ( = ?auto_186205 ?auto_186209 ) ) ( not ( = ?auto_186206 ?auto_186207 ) ) ( not ( = ?auto_186206 ?auto_186208 ) ) ( not ( = ?auto_186206 ?auto_186209 ) ) ( not ( = ?auto_186207 ?auto_186208 ) ) ( not ( = ?auto_186207 ?auto_186209 ) ) ( not ( = ?auto_186208 ?auto_186209 ) ) ( ON ?auto_186207 ?auto_186208 ) ( CLEAR ?auto_186205 ) ( ON ?auto_186206 ?auto_186207 ) ( CLEAR ?auto_186206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186205 ?auto_186206 )
      ( MAKE-4PILE ?auto_186205 ?auto_186206 ?auto_186207 ?auto_186208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186223 - BLOCK
      ?auto_186224 - BLOCK
      ?auto_186225 - BLOCK
      ?auto_186226 - BLOCK
    )
    :vars
    (
      ?auto_186227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186226 ?auto_186227 ) ( not ( = ?auto_186223 ?auto_186224 ) ) ( not ( = ?auto_186223 ?auto_186225 ) ) ( not ( = ?auto_186223 ?auto_186226 ) ) ( not ( = ?auto_186223 ?auto_186227 ) ) ( not ( = ?auto_186224 ?auto_186225 ) ) ( not ( = ?auto_186224 ?auto_186226 ) ) ( not ( = ?auto_186224 ?auto_186227 ) ) ( not ( = ?auto_186225 ?auto_186226 ) ) ( not ( = ?auto_186225 ?auto_186227 ) ) ( not ( = ?auto_186226 ?auto_186227 ) ) ( ON ?auto_186225 ?auto_186226 ) ( ON ?auto_186224 ?auto_186225 ) ( ON ?auto_186223 ?auto_186224 ) ( CLEAR ?auto_186223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186223 )
      ( MAKE-4PILE ?auto_186223 ?auto_186224 ?auto_186225 ?auto_186226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186242 - BLOCK
      ?auto_186243 - BLOCK
      ?auto_186244 - BLOCK
      ?auto_186245 - BLOCK
      ?auto_186246 - BLOCK
    )
    :vars
    (
      ?auto_186247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186245 ) ( ON ?auto_186246 ?auto_186247 ) ( CLEAR ?auto_186246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186242 ) ( ON ?auto_186243 ?auto_186242 ) ( ON ?auto_186244 ?auto_186243 ) ( ON ?auto_186245 ?auto_186244 ) ( not ( = ?auto_186242 ?auto_186243 ) ) ( not ( = ?auto_186242 ?auto_186244 ) ) ( not ( = ?auto_186242 ?auto_186245 ) ) ( not ( = ?auto_186242 ?auto_186246 ) ) ( not ( = ?auto_186242 ?auto_186247 ) ) ( not ( = ?auto_186243 ?auto_186244 ) ) ( not ( = ?auto_186243 ?auto_186245 ) ) ( not ( = ?auto_186243 ?auto_186246 ) ) ( not ( = ?auto_186243 ?auto_186247 ) ) ( not ( = ?auto_186244 ?auto_186245 ) ) ( not ( = ?auto_186244 ?auto_186246 ) ) ( not ( = ?auto_186244 ?auto_186247 ) ) ( not ( = ?auto_186245 ?auto_186246 ) ) ( not ( = ?auto_186245 ?auto_186247 ) ) ( not ( = ?auto_186246 ?auto_186247 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186246 ?auto_186247 )
      ( !STACK ?auto_186246 ?auto_186245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186264 - BLOCK
      ?auto_186265 - BLOCK
      ?auto_186266 - BLOCK
      ?auto_186267 - BLOCK
      ?auto_186268 - BLOCK
    )
    :vars
    (
      ?auto_186269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186268 ?auto_186269 ) ( ON-TABLE ?auto_186264 ) ( ON ?auto_186265 ?auto_186264 ) ( ON ?auto_186266 ?auto_186265 ) ( not ( = ?auto_186264 ?auto_186265 ) ) ( not ( = ?auto_186264 ?auto_186266 ) ) ( not ( = ?auto_186264 ?auto_186267 ) ) ( not ( = ?auto_186264 ?auto_186268 ) ) ( not ( = ?auto_186264 ?auto_186269 ) ) ( not ( = ?auto_186265 ?auto_186266 ) ) ( not ( = ?auto_186265 ?auto_186267 ) ) ( not ( = ?auto_186265 ?auto_186268 ) ) ( not ( = ?auto_186265 ?auto_186269 ) ) ( not ( = ?auto_186266 ?auto_186267 ) ) ( not ( = ?auto_186266 ?auto_186268 ) ) ( not ( = ?auto_186266 ?auto_186269 ) ) ( not ( = ?auto_186267 ?auto_186268 ) ) ( not ( = ?auto_186267 ?auto_186269 ) ) ( not ( = ?auto_186268 ?auto_186269 ) ) ( CLEAR ?auto_186266 ) ( ON ?auto_186267 ?auto_186268 ) ( CLEAR ?auto_186267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186264 ?auto_186265 ?auto_186266 ?auto_186267 )
      ( MAKE-5PILE ?auto_186264 ?auto_186265 ?auto_186266 ?auto_186267 ?auto_186268 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186286 - BLOCK
      ?auto_186287 - BLOCK
      ?auto_186288 - BLOCK
      ?auto_186289 - BLOCK
      ?auto_186290 - BLOCK
    )
    :vars
    (
      ?auto_186291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186290 ?auto_186291 ) ( ON-TABLE ?auto_186286 ) ( ON ?auto_186287 ?auto_186286 ) ( not ( = ?auto_186286 ?auto_186287 ) ) ( not ( = ?auto_186286 ?auto_186288 ) ) ( not ( = ?auto_186286 ?auto_186289 ) ) ( not ( = ?auto_186286 ?auto_186290 ) ) ( not ( = ?auto_186286 ?auto_186291 ) ) ( not ( = ?auto_186287 ?auto_186288 ) ) ( not ( = ?auto_186287 ?auto_186289 ) ) ( not ( = ?auto_186287 ?auto_186290 ) ) ( not ( = ?auto_186287 ?auto_186291 ) ) ( not ( = ?auto_186288 ?auto_186289 ) ) ( not ( = ?auto_186288 ?auto_186290 ) ) ( not ( = ?auto_186288 ?auto_186291 ) ) ( not ( = ?auto_186289 ?auto_186290 ) ) ( not ( = ?auto_186289 ?auto_186291 ) ) ( not ( = ?auto_186290 ?auto_186291 ) ) ( ON ?auto_186289 ?auto_186290 ) ( CLEAR ?auto_186287 ) ( ON ?auto_186288 ?auto_186289 ) ( CLEAR ?auto_186288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186286 ?auto_186287 ?auto_186288 )
      ( MAKE-5PILE ?auto_186286 ?auto_186287 ?auto_186288 ?auto_186289 ?auto_186290 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186308 - BLOCK
      ?auto_186309 - BLOCK
      ?auto_186310 - BLOCK
      ?auto_186311 - BLOCK
      ?auto_186312 - BLOCK
    )
    :vars
    (
      ?auto_186313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186312 ?auto_186313 ) ( ON-TABLE ?auto_186308 ) ( not ( = ?auto_186308 ?auto_186309 ) ) ( not ( = ?auto_186308 ?auto_186310 ) ) ( not ( = ?auto_186308 ?auto_186311 ) ) ( not ( = ?auto_186308 ?auto_186312 ) ) ( not ( = ?auto_186308 ?auto_186313 ) ) ( not ( = ?auto_186309 ?auto_186310 ) ) ( not ( = ?auto_186309 ?auto_186311 ) ) ( not ( = ?auto_186309 ?auto_186312 ) ) ( not ( = ?auto_186309 ?auto_186313 ) ) ( not ( = ?auto_186310 ?auto_186311 ) ) ( not ( = ?auto_186310 ?auto_186312 ) ) ( not ( = ?auto_186310 ?auto_186313 ) ) ( not ( = ?auto_186311 ?auto_186312 ) ) ( not ( = ?auto_186311 ?auto_186313 ) ) ( not ( = ?auto_186312 ?auto_186313 ) ) ( ON ?auto_186311 ?auto_186312 ) ( ON ?auto_186310 ?auto_186311 ) ( CLEAR ?auto_186308 ) ( ON ?auto_186309 ?auto_186310 ) ( CLEAR ?auto_186309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186308 ?auto_186309 )
      ( MAKE-5PILE ?auto_186308 ?auto_186309 ?auto_186310 ?auto_186311 ?auto_186312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186330 - BLOCK
      ?auto_186331 - BLOCK
      ?auto_186332 - BLOCK
      ?auto_186333 - BLOCK
      ?auto_186334 - BLOCK
    )
    :vars
    (
      ?auto_186335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186334 ?auto_186335 ) ( not ( = ?auto_186330 ?auto_186331 ) ) ( not ( = ?auto_186330 ?auto_186332 ) ) ( not ( = ?auto_186330 ?auto_186333 ) ) ( not ( = ?auto_186330 ?auto_186334 ) ) ( not ( = ?auto_186330 ?auto_186335 ) ) ( not ( = ?auto_186331 ?auto_186332 ) ) ( not ( = ?auto_186331 ?auto_186333 ) ) ( not ( = ?auto_186331 ?auto_186334 ) ) ( not ( = ?auto_186331 ?auto_186335 ) ) ( not ( = ?auto_186332 ?auto_186333 ) ) ( not ( = ?auto_186332 ?auto_186334 ) ) ( not ( = ?auto_186332 ?auto_186335 ) ) ( not ( = ?auto_186333 ?auto_186334 ) ) ( not ( = ?auto_186333 ?auto_186335 ) ) ( not ( = ?auto_186334 ?auto_186335 ) ) ( ON ?auto_186333 ?auto_186334 ) ( ON ?auto_186332 ?auto_186333 ) ( ON ?auto_186331 ?auto_186332 ) ( ON ?auto_186330 ?auto_186331 ) ( CLEAR ?auto_186330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186330 )
      ( MAKE-5PILE ?auto_186330 ?auto_186331 ?auto_186332 ?auto_186333 ?auto_186334 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186353 - BLOCK
      ?auto_186354 - BLOCK
      ?auto_186355 - BLOCK
      ?auto_186356 - BLOCK
      ?auto_186357 - BLOCK
      ?auto_186358 - BLOCK
    )
    :vars
    (
      ?auto_186359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186357 ) ( ON ?auto_186358 ?auto_186359 ) ( CLEAR ?auto_186358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186353 ) ( ON ?auto_186354 ?auto_186353 ) ( ON ?auto_186355 ?auto_186354 ) ( ON ?auto_186356 ?auto_186355 ) ( ON ?auto_186357 ?auto_186356 ) ( not ( = ?auto_186353 ?auto_186354 ) ) ( not ( = ?auto_186353 ?auto_186355 ) ) ( not ( = ?auto_186353 ?auto_186356 ) ) ( not ( = ?auto_186353 ?auto_186357 ) ) ( not ( = ?auto_186353 ?auto_186358 ) ) ( not ( = ?auto_186353 ?auto_186359 ) ) ( not ( = ?auto_186354 ?auto_186355 ) ) ( not ( = ?auto_186354 ?auto_186356 ) ) ( not ( = ?auto_186354 ?auto_186357 ) ) ( not ( = ?auto_186354 ?auto_186358 ) ) ( not ( = ?auto_186354 ?auto_186359 ) ) ( not ( = ?auto_186355 ?auto_186356 ) ) ( not ( = ?auto_186355 ?auto_186357 ) ) ( not ( = ?auto_186355 ?auto_186358 ) ) ( not ( = ?auto_186355 ?auto_186359 ) ) ( not ( = ?auto_186356 ?auto_186357 ) ) ( not ( = ?auto_186356 ?auto_186358 ) ) ( not ( = ?auto_186356 ?auto_186359 ) ) ( not ( = ?auto_186357 ?auto_186358 ) ) ( not ( = ?auto_186357 ?auto_186359 ) ) ( not ( = ?auto_186358 ?auto_186359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186358 ?auto_186359 )
      ( !STACK ?auto_186358 ?auto_186357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186379 - BLOCK
      ?auto_186380 - BLOCK
      ?auto_186381 - BLOCK
      ?auto_186382 - BLOCK
      ?auto_186383 - BLOCK
      ?auto_186384 - BLOCK
    )
    :vars
    (
      ?auto_186385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186384 ?auto_186385 ) ( ON-TABLE ?auto_186379 ) ( ON ?auto_186380 ?auto_186379 ) ( ON ?auto_186381 ?auto_186380 ) ( ON ?auto_186382 ?auto_186381 ) ( not ( = ?auto_186379 ?auto_186380 ) ) ( not ( = ?auto_186379 ?auto_186381 ) ) ( not ( = ?auto_186379 ?auto_186382 ) ) ( not ( = ?auto_186379 ?auto_186383 ) ) ( not ( = ?auto_186379 ?auto_186384 ) ) ( not ( = ?auto_186379 ?auto_186385 ) ) ( not ( = ?auto_186380 ?auto_186381 ) ) ( not ( = ?auto_186380 ?auto_186382 ) ) ( not ( = ?auto_186380 ?auto_186383 ) ) ( not ( = ?auto_186380 ?auto_186384 ) ) ( not ( = ?auto_186380 ?auto_186385 ) ) ( not ( = ?auto_186381 ?auto_186382 ) ) ( not ( = ?auto_186381 ?auto_186383 ) ) ( not ( = ?auto_186381 ?auto_186384 ) ) ( not ( = ?auto_186381 ?auto_186385 ) ) ( not ( = ?auto_186382 ?auto_186383 ) ) ( not ( = ?auto_186382 ?auto_186384 ) ) ( not ( = ?auto_186382 ?auto_186385 ) ) ( not ( = ?auto_186383 ?auto_186384 ) ) ( not ( = ?auto_186383 ?auto_186385 ) ) ( not ( = ?auto_186384 ?auto_186385 ) ) ( CLEAR ?auto_186382 ) ( ON ?auto_186383 ?auto_186384 ) ( CLEAR ?auto_186383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186379 ?auto_186380 ?auto_186381 ?auto_186382 ?auto_186383 )
      ( MAKE-6PILE ?auto_186379 ?auto_186380 ?auto_186381 ?auto_186382 ?auto_186383 ?auto_186384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186405 - BLOCK
      ?auto_186406 - BLOCK
      ?auto_186407 - BLOCK
      ?auto_186408 - BLOCK
      ?auto_186409 - BLOCK
      ?auto_186410 - BLOCK
    )
    :vars
    (
      ?auto_186411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186410 ?auto_186411 ) ( ON-TABLE ?auto_186405 ) ( ON ?auto_186406 ?auto_186405 ) ( ON ?auto_186407 ?auto_186406 ) ( not ( = ?auto_186405 ?auto_186406 ) ) ( not ( = ?auto_186405 ?auto_186407 ) ) ( not ( = ?auto_186405 ?auto_186408 ) ) ( not ( = ?auto_186405 ?auto_186409 ) ) ( not ( = ?auto_186405 ?auto_186410 ) ) ( not ( = ?auto_186405 ?auto_186411 ) ) ( not ( = ?auto_186406 ?auto_186407 ) ) ( not ( = ?auto_186406 ?auto_186408 ) ) ( not ( = ?auto_186406 ?auto_186409 ) ) ( not ( = ?auto_186406 ?auto_186410 ) ) ( not ( = ?auto_186406 ?auto_186411 ) ) ( not ( = ?auto_186407 ?auto_186408 ) ) ( not ( = ?auto_186407 ?auto_186409 ) ) ( not ( = ?auto_186407 ?auto_186410 ) ) ( not ( = ?auto_186407 ?auto_186411 ) ) ( not ( = ?auto_186408 ?auto_186409 ) ) ( not ( = ?auto_186408 ?auto_186410 ) ) ( not ( = ?auto_186408 ?auto_186411 ) ) ( not ( = ?auto_186409 ?auto_186410 ) ) ( not ( = ?auto_186409 ?auto_186411 ) ) ( not ( = ?auto_186410 ?auto_186411 ) ) ( ON ?auto_186409 ?auto_186410 ) ( CLEAR ?auto_186407 ) ( ON ?auto_186408 ?auto_186409 ) ( CLEAR ?auto_186408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186405 ?auto_186406 ?auto_186407 ?auto_186408 )
      ( MAKE-6PILE ?auto_186405 ?auto_186406 ?auto_186407 ?auto_186408 ?auto_186409 ?auto_186410 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186431 - BLOCK
      ?auto_186432 - BLOCK
      ?auto_186433 - BLOCK
      ?auto_186434 - BLOCK
      ?auto_186435 - BLOCK
      ?auto_186436 - BLOCK
    )
    :vars
    (
      ?auto_186437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186436 ?auto_186437 ) ( ON-TABLE ?auto_186431 ) ( ON ?auto_186432 ?auto_186431 ) ( not ( = ?auto_186431 ?auto_186432 ) ) ( not ( = ?auto_186431 ?auto_186433 ) ) ( not ( = ?auto_186431 ?auto_186434 ) ) ( not ( = ?auto_186431 ?auto_186435 ) ) ( not ( = ?auto_186431 ?auto_186436 ) ) ( not ( = ?auto_186431 ?auto_186437 ) ) ( not ( = ?auto_186432 ?auto_186433 ) ) ( not ( = ?auto_186432 ?auto_186434 ) ) ( not ( = ?auto_186432 ?auto_186435 ) ) ( not ( = ?auto_186432 ?auto_186436 ) ) ( not ( = ?auto_186432 ?auto_186437 ) ) ( not ( = ?auto_186433 ?auto_186434 ) ) ( not ( = ?auto_186433 ?auto_186435 ) ) ( not ( = ?auto_186433 ?auto_186436 ) ) ( not ( = ?auto_186433 ?auto_186437 ) ) ( not ( = ?auto_186434 ?auto_186435 ) ) ( not ( = ?auto_186434 ?auto_186436 ) ) ( not ( = ?auto_186434 ?auto_186437 ) ) ( not ( = ?auto_186435 ?auto_186436 ) ) ( not ( = ?auto_186435 ?auto_186437 ) ) ( not ( = ?auto_186436 ?auto_186437 ) ) ( ON ?auto_186435 ?auto_186436 ) ( ON ?auto_186434 ?auto_186435 ) ( CLEAR ?auto_186432 ) ( ON ?auto_186433 ?auto_186434 ) ( CLEAR ?auto_186433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186431 ?auto_186432 ?auto_186433 )
      ( MAKE-6PILE ?auto_186431 ?auto_186432 ?auto_186433 ?auto_186434 ?auto_186435 ?auto_186436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186457 - BLOCK
      ?auto_186458 - BLOCK
      ?auto_186459 - BLOCK
      ?auto_186460 - BLOCK
      ?auto_186461 - BLOCK
      ?auto_186462 - BLOCK
    )
    :vars
    (
      ?auto_186463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186462 ?auto_186463 ) ( ON-TABLE ?auto_186457 ) ( not ( = ?auto_186457 ?auto_186458 ) ) ( not ( = ?auto_186457 ?auto_186459 ) ) ( not ( = ?auto_186457 ?auto_186460 ) ) ( not ( = ?auto_186457 ?auto_186461 ) ) ( not ( = ?auto_186457 ?auto_186462 ) ) ( not ( = ?auto_186457 ?auto_186463 ) ) ( not ( = ?auto_186458 ?auto_186459 ) ) ( not ( = ?auto_186458 ?auto_186460 ) ) ( not ( = ?auto_186458 ?auto_186461 ) ) ( not ( = ?auto_186458 ?auto_186462 ) ) ( not ( = ?auto_186458 ?auto_186463 ) ) ( not ( = ?auto_186459 ?auto_186460 ) ) ( not ( = ?auto_186459 ?auto_186461 ) ) ( not ( = ?auto_186459 ?auto_186462 ) ) ( not ( = ?auto_186459 ?auto_186463 ) ) ( not ( = ?auto_186460 ?auto_186461 ) ) ( not ( = ?auto_186460 ?auto_186462 ) ) ( not ( = ?auto_186460 ?auto_186463 ) ) ( not ( = ?auto_186461 ?auto_186462 ) ) ( not ( = ?auto_186461 ?auto_186463 ) ) ( not ( = ?auto_186462 ?auto_186463 ) ) ( ON ?auto_186461 ?auto_186462 ) ( ON ?auto_186460 ?auto_186461 ) ( ON ?auto_186459 ?auto_186460 ) ( CLEAR ?auto_186457 ) ( ON ?auto_186458 ?auto_186459 ) ( CLEAR ?auto_186458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186457 ?auto_186458 )
      ( MAKE-6PILE ?auto_186457 ?auto_186458 ?auto_186459 ?auto_186460 ?auto_186461 ?auto_186462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186483 - BLOCK
      ?auto_186484 - BLOCK
      ?auto_186485 - BLOCK
      ?auto_186486 - BLOCK
      ?auto_186487 - BLOCK
      ?auto_186488 - BLOCK
    )
    :vars
    (
      ?auto_186489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186488 ?auto_186489 ) ( not ( = ?auto_186483 ?auto_186484 ) ) ( not ( = ?auto_186483 ?auto_186485 ) ) ( not ( = ?auto_186483 ?auto_186486 ) ) ( not ( = ?auto_186483 ?auto_186487 ) ) ( not ( = ?auto_186483 ?auto_186488 ) ) ( not ( = ?auto_186483 ?auto_186489 ) ) ( not ( = ?auto_186484 ?auto_186485 ) ) ( not ( = ?auto_186484 ?auto_186486 ) ) ( not ( = ?auto_186484 ?auto_186487 ) ) ( not ( = ?auto_186484 ?auto_186488 ) ) ( not ( = ?auto_186484 ?auto_186489 ) ) ( not ( = ?auto_186485 ?auto_186486 ) ) ( not ( = ?auto_186485 ?auto_186487 ) ) ( not ( = ?auto_186485 ?auto_186488 ) ) ( not ( = ?auto_186485 ?auto_186489 ) ) ( not ( = ?auto_186486 ?auto_186487 ) ) ( not ( = ?auto_186486 ?auto_186488 ) ) ( not ( = ?auto_186486 ?auto_186489 ) ) ( not ( = ?auto_186487 ?auto_186488 ) ) ( not ( = ?auto_186487 ?auto_186489 ) ) ( not ( = ?auto_186488 ?auto_186489 ) ) ( ON ?auto_186487 ?auto_186488 ) ( ON ?auto_186486 ?auto_186487 ) ( ON ?auto_186485 ?auto_186486 ) ( ON ?auto_186484 ?auto_186485 ) ( ON ?auto_186483 ?auto_186484 ) ( CLEAR ?auto_186483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186483 )
      ( MAKE-6PILE ?auto_186483 ?auto_186484 ?auto_186485 ?auto_186486 ?auto_186487 ?auto_186488 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186510 - BLOCK
      ?auto_186511 - BLOCK
      ?auto_186512 - BLOCK
      ?auto_186513 - BLOCK
      ?auto_186514 - BLOCK
      ?auto_186515 - BLOCK
      ?auto_186516 - BLOCK
    )
    :vars
    (
      ?auto_186517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186515 ) ( ON ?auto_186516 ?auto_186517 ) ( CLEAR ?auto_186516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186510 ) ( ON ?auto_186511 ?auto_186510 ) ( ON ?auto_186512 ?auto_186511 ) ( ON ?auto_186513 ?auto_186512 ) ( ON ?auto_186514 ?auto_186513 ) ( ON ?auto_186515 ?auto_186514 ) ( not ( = ?auto_186510 ?auto_186511 ) ) ( not ( = ?auto_186510 ?auto_186512 ) ) ( not ( = ?auto_186510 ?auto_186513 ) ) ( not ( = ?auto_186510 ?auto_186514 ) ) ( not ( = ?auto_186510 ?auto_186515 ) ) ( not ( = ?auto_186510 ?auto_186516 ) ) ( not ( = ?auto_186510 ?auto_186517 ) ) ( not ( = ?auto_186511 ?auto_186512 ) ) ( not ( = ?auto_186511 ?auto_186513 ) ) ( not ( = ?auto_186511 ?auto_186514 ) ) ( not ( = ?auto_186511 ?auto_186515 ) ) ( not ( = ?auto_186511 ?auto_186516 ) ) ( not ( = ?auto_186511 ?auto_186517 ) ) ( not ( = ?auto_186512 ?auto_186513 ) ) ( not ( = ?auto_186512 ?auto_186514 ) ) ( not ( = ?auto_186512 ?auto_186515 ) ) ( not ( = ?auto_186512 ?auto_186516 ) ) ( not ( = ?auto_186512 ?auto_186517 ) ) ( not ( = ?auto_186513 ?auto_186514 ) ) ( not ( = ?auto_186513 ?auto_186515 ) ) ( not ( = ?auto_186513 ?auto_186516 ) ) ( not ( = ?auto_186513 ?auto_186517 ) ) ( not ( = ?auto_186514 ?auto_186515 ) ) ( not ( = ?auto_186514 ?auto_186516 ) ) ( not ( = ?auto_186514 ?auto_186517 ) ) ( not ( = ?auto_186515 ?auto_186516 ) ) ( not ( = ?auto_186515 ?auto_186517 ) ) ( not ( = ?auto_186516 ?auto_186517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186516 ?auto_186517 )
      ( !STACK ?auto_186516 ?auto_186515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186540 - BLOCK
      ?auto_186541 - BLOCK
      ?auto_186542 - BLOCK
      ?auto_186543 - BLOCK
      ?auto_186544 - BLOCK
      ?auto_186545 - BLOCK
      ?auto_186546 - BLOCK
    )
    :vars
    (
      ?auto_186547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186546 ?auto_186547 ) ( ON-TABLE ?auto_186540 ) ( ON ?auto_186541 ?auto_186540 ) ( ON ?auto_186542 ?auto_186541 ) ( ON ?auto_186543 ?auto_186542 ) ( ON ?auto_186544 ?auto_186543 ) ( not ( = ?auto_186540 ?auto_186541 ) ) ( not ( = ?auto_186540 ?auto_186542 ) ) ( not ( = ?auto_186540 ?auto_186543 ) ) ( not ( = ?auto_186540 ?auto_186544 ) ) ( not ( = ?auto_186540 ?auto_186545 ) ) ( not ( = ?auto_186540 ?auto_186546 ) ) ( not ( = ?auto_186540 ?auto_186547 ) ) ( not ( = ?auto_186541 ?auto_186542 ) ) ( not ( = ?auto_186541 ?auto_186543 ) ) ( not ( = ?auto_186541 ?auto_186544 ) ) ( not ( = ?auto_186541 ?auto_186545 ) ) ( not ( = ?auto_186541 ?auto_186546 ) ) ( not ( = ?auto_186541 ?auto_186547 ) ) ( not ( = ?auto_186542 ?auto_186543 ) ) ( not ( = ?auto_186542 ?auto_186544 ) ) ( not ( = ?auto_186542 ?auto_186545 ) ) ( not ( = ?auto_186542 ?auto_186546 ) ) ( not ( = ?auto_186542 ?auto_186547 ) ) ( not ( = ?auto_186543 ?auto_186544 ) ) ( not ( = ?auto_186543 ?auto_186545 ) ) ( not ( = ?auto_186543 ?auto_186546 ) ) ( not ( = ?auto_186543 ?auto_186547 ) ) ( not ( = ?auto_186544 ?auto_186545 ) ) ( not ( = ?auto_186544 ?auto_186546 ) ) ( not ( = ?auto_186544 ?auto_186547 ) ) ( not ( = ?auto_186545 ?auto_186546 ) ) ( not ( = ?auto_186545 ?auto_186547 ) ) ( not ( = ?auto_186546 ?auto_186547 ) ) ( CLEAR ?auto_186544 ) ( ON ?auto_186545 ?auto_186546 ) ( CLEAR ?auto_186545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186540 ?auto_186541 ?auto_186542 ?auto_186543 ?auto_186544 ?auto_186545 )
      ( MAKE-7PILE ?auto_186540 ?auto_186541 ?auto_186542 ?auto_186543 ?auto_186544 ?auto_186545 ?auto_186546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186570 - BLOCK
      ?auto_186571 - BLOCK
      ?auto_186572 - BLOCK
      ?auto_186573 - BLOCK
      ?auto_186574 - BLOCK
      ?auto_186575 - BLOCK
      ?auto_186576 - BLOCK
    )
    :vars
    (
      ?auto_186577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186576 ?auto_186577 ) ( ON-TABLE ?auto_186570 ) ( ON ?auto_186571 ?auto_186570 ) ( ON ?auto_186572 ?auto_186571 ) ( ON ?auto_186573 ?auto_186572 ) ( not ( = ?auto_186570 ?auto_186571 ) ) ( not ( = ?auto_186570 ?auto_186572 ) ) ( not ( = ?auto_186570 ?auto_186573 ) ) ( not ( = ?auto_186570 ?auto_186574 ) ) ( not ( = ?auto_186570 ?auto_186575 ) ) ( not ( = ?auto_186570 ?auto_186576 ) ) ( not ( = ?auto_186570 ?auto_186577 ) ) ( not ( = ?auto_186571 ?auto_186572 ) ) ( not ( = ?auto_186571 ?auto_186573 ) ) ( not ( = ?auto_186571 ?auto_186574 ) ) ( not ( = ?auto_186571 ?auto_186575 ) ) ( not ( = ?auto_186571 ?auto_186576 ) ) ( not ( = ?auto_186571 ?auto_186577 ) ) ( not ( = ?auto_186572 ?auto_186573 ) ) ( not ( = ?auto_186572 ?auto_186574 ) ) ( not ( = ?auto_186572 ?auto_186575 ) ) ( not ( = ?auto_186572 ?auto_186576 ) ) ( not ( = ?auto_186572 ?auto_186577 ) ) ( not ( = ?auto_186573 ?auto_186574 ) ) ( not ( = ?auto_186573 ?auto_186575 ) ) ( not ( = ?auto_186573 ?auto_186576 ) ) ( not ( = ?auto_186573 ?auto_186577 ) ) ( not ( = ?auto_186574 ?auto_186575 ) ) ( not ( = ?auto_186574 ?auto_186576 ) ) ( not ( = ?auto_186574 ?auto_186577 ) ) ( not ( = ?auto_186575 ?auto_186576 ) ) ( not ( = ?auto_186575 ?auto_186577 ) ) ( not ( = ?auto_186576 ?auto_186577 ) ) ( ON ?auto_186575 ?auto_186576 ) ( CLEAR ?auto_186573 ) ( ON ?auto_186574 ?auto_186575 ) ( CLEAR ?auto_186574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186570 ?auto_186571 ?auto_186572 ?auto_186573 ?auto_186574 )
      ( MAKE-7PILE ?auto_186570 ?auto_186571 ?auto_186572 ?auto_186573 ?auto_186574 ?auto_186575 ?auto_186576 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186600 - BLOCK
      ?auto_186601 - BLOCK
      ?auto_186602 - BLOCK
      ?auto_186603 - BLOCK
      ?auto_186604 - BLOCK
      ?auto_186605 - BLOCK
      ?auto_186606 - BLOCK
    )
    :vars
    (
      ?auto_186607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186606 ?auto_186607 ) ( ON-TABLE ?auto_186600 ) ( ON ?auto_186601 ?auto_186600 ) ( ON ?auto_186602 ?auto_186601 ) ( not ( = ?auto_186600 ?auto_186601 ) ) ( not ( = ?auto_186600 ?auto_186602 ) ) ( not ( = ?auto_186600 ?auto_186603 ) ) ( not ( = ?auto_186600 ?auto_186604 ) ) ( not ( = ?auto_186600 ?auto_186605 ) ) ( not ( = ?auto_186600 ?auto_186606 ) ) ( not ( = ?auto_186600 ?auto_186607 ) ) ( not ( = ?auto_186601 ?auto_186602 ) ) ( not ( = ?auto_186601 ?auto_186603 ) ) ( not ( = ?auto_186601 ?auto_186604 ) ) ( not ( = ?auto_186601 ?auto_186605 ) ) ( not ( = ?auto_186601 ?auto_186606 ) ) ( not ( = ?auto_186601 ?auto_186607 ) ) ( not ( = ?auto_186602 ?auto_186603 ) ) ( not ( = ?auto_186602 ?auto_186604 ) ) ( not ( = ?auto_186602 ?auto_186605 ) ) ( not ( = ?auto_186602 ?auto_186606 ) ) ( not ( = ?auto_186602 ?auto_186607 ) ) ( not ( = ?auto_186603 ?auto_186604 ) ) ( not ( = ?auto_186603 ?auto_186605 ) ) ( not ( = ?auto_186603 ?auto_186606 ) ) ( not ( = ?auto_186603 ?auto_186607 ) ) ( not ( = ?auto_186604 ?auto_186605 ) ) ( not ( = ?auto_186604 ?auto_186606 ) ) ( not ( = ?auto_186604 ?auto_186607 ) ) ( not ( = ?auto_186605 ?auto_186606 ) ) ( not ( = ?auto_186605 ?auto_186607 ) ) ( not ( = ?auto_186606 ?auto_186607 ) ) ( ON ?auto_186605 ?auto_186606 ) ( ON ?auto_186604 ?auto_186605 ) ( CLEAR ?auto_186602 ) ( ON ?auto_186603 ?auto_186604 ) ( CLEAR ?auto_186603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186600 ?auto_186601 ?auto_186602 ?auto_186603 )
      ( MAKE-7PILE ?auto_186600 ?auto_186601 ?auto_186602 ?auto_186603 ?auto_186604 ?auto_186605 ?auto_186606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186630 - BLOCK
      ?auto_186631 - BLOCK
      ?auto_186632 - BLOCK
      ?auto_186633 - BLOCK
      ?auto_186634 - BLOCK
      ?auto_186635 - BLOCK
      ?auto_186636 - BLOCK
    )
    :vars
    (
      ?auto_186637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186636 ?auto_186637 ) ( ON-TABLE ?auto_186630 ) ( ON ?auto_186631 ?auto_186630 ) ( not ( = ?auto_186630 ?auto_186631 ) ) ( not ( = ?auto_186630 ?auto_186632 ) ) ( not ( = ?auto_186630 ?auto_186633 ) ) ( not ( = ?auto_186630 ?auto_186634 ) ) ( not ( = ?auto_186630 ?auto_186635 ) ) ( not ( = ?auto_186630 ?auto_186636 ) ) ( not ( = ?auto_186630 ?auto_186637 ) ) ( not ( = ?auto_186631 ?auto_186632 ) ) ( not ( = ?auto_186631 ?auto_186633 ) ) ( not ( = ?auto_186631 ?auto_186634 ) ) ( not ( = ?auto_186631 ?auto_186635 ) ) ( not ( = ?auto_186631 ?auto_186636 ) ) ( not ( = ?auto_186631 ?auto_186637 ) ) ( not ( = ?auto_186632 ?auto_186633 ) ) ( not ( = ?auto_186632 ?auto_186634 ) ) ( not ( = ?auto_186632 ?auto_186635 ) ) ( not ( = ?auto_186632 ?auto_186636 ) ) ( not ( = ?auto_186632 ?auto_186637 ) ) ( not ( = ?auto_186633 ?auto_186634 ) ) ( not ( = ?auto_186633 ?auto_186635 ) ) ( not ( = ?auto_186633 ?auto_186636 ) ) ( not ( = ?auto_186633 ?auto_186637 ) ) ( not ( = ?auto_186634 ?auto_186635 ) ) ( not ( = ?auto_186634 ?auto_186636 ) ) ( not ( = ?auto_186634 ?auto_186637 ) ) ( not ( = ?auto_186635 ?auto_186636 ) ) ( not ( = ?auto_186635 ?auto_186637 ) ) ( not ( = ?auto_186636 ?auto_186637 ) ) ( ON ?auto_186635 ?auto_186636 ) ( ON ?auto_186634 ?auto_186635 ) ( ON ?auto_186633 ?auto_186634 ) ( CLEAR ?auto_186631 ) ( ON ?auto_186632 ?auto_186633 ) ( CLEAR ?auto_186632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186630 ?auto_186631 ?auto_186632 )
      ( MAKE-7PILE ?auto_186630 ?auto_186631 ?auto_186632 ?auto_186633 ?auto_186634 ?auto_186635 ?auto_186636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186660 - BLOCK
      ?auto_186661 - BLOCK
      ?auto_186662 - BLOCK
      ?auto_186663 - BLOCK
      ?auto_186664 - BLOCK
      ?auto_186665 - BLOCK
      ?auto_186666 - BLOCK
    )
    :vars
    (
      ?auto_186667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186666 ?auto_186667 ) ( ON-TABLE ?auto_186660 ) ( not ( = ?auto_186660 ?auto_186661 ) ) ( not ( = ?auto_186660 ?auto_186662 ) ) ( not ( = ?auto_186660 ?auto_186663 ) ) ( not ( = ?auto_186660 ?auto_186664 ) ) ( not ( = ?auto_186660 ?auto_186665 ) ) ( not ( = ?auto_186660 ?auto_186666 ) ) ( not ( = ?auto_186660 ?auto_186667 ) ) ( not ( = ?auto_186661 ?auto_186662 ) ) ( not ( = ?auto_186661 ?auto_186663 ) ) ( not ( = ?auto_186661 ?auto_186664 ) ) ( not ( = ?auto_186661 ?auto_186665 ) ) ( not ( = ?auto_186661 ?auto_186666 ) ) ( not ( = ?auto_186661 ?auto_186667 ) ) ( not ( = ?auto_186662 ?auto_186663 ) ) ( not ( = ?auto_186662 ?auto_186664 ) ) ( not ( = ?auto_186662 ?auto_186665 ) ) ( not ( = ?auto_186662 ?auto_186666 ) ) ( not ( = ?auto_186662 ?auto_186667 ) ) ( not ( = ?auto_186663 ?auto_186664 ) ) ( not ( = ?auto_186663 ?auto_186665 ) ) ( not ( = ?auto_186663 ?auto_186666 ) ) ( not ( = ?auto_186663 ?auto_186667 ) ) ( not ( = ?auto_186664 ?auto_186665 ) ) ( not ( = ?auto_186664 ?auto_186666 ) ) ( not ( = ?auto_186664 ?auto_186667 ) ) ( not ( = ?auto_186665 ?auto_186666 ) ) ( not ( = ?auto_186665 ?auto_186667 ) ) ( not ( = ?auto_186666 ?auto_186667 ) ) ( ON ?auto_186665 ?auto_186666 ) ( ON ?auto_186664 ?auto_186665 ) ( ON ?auto_186663 ?auto_186664 ) ( ON ?auto_186662 ?auto_186663 ) ( CLEAR ?auto_186660 ) ( ON ?auto_186661 ?auto_186662 ) ( CLEAR ?auto_186661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186660 ?auto_186661 )
      ( MAKE-7PILE ?auto_186660 ?auto_186661 ?auto_186662 ?auto_186663 ?auto_186664 ?auto_186665 ?auto_186666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_186690 - BLOCK
      ?auto_186691 - BLOCK
      ?auto_186692 - BLOCK
      ?auto_186693 - BLOCK
      ?auto_186694 - BLOCK
      ?auto_186695 - BLOCK
      ?auto_186696 - BLOCK
    )
    :vars
    (
      ?auto_186697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186696 ?auto_186697 ) ( not ( = ?auto_186690 ?auto_186691 ) ) ( not ( = ?auto_186690 ?auto_186692 ) ) ( not ( = ?auto_186690 ?auto_186693 ) ) ( not ( = ?auto_186690 ?auto_186694 ) ) ( not ( = ?auto_186690 ?auto_186695 ) ) ( not ( = ?auto_186690 ?auto_186696 ) ) ( not ( = ?auto_186690 ?auto_186697 ) ) ( not ( = ?auto_186691 ?auto_186692 ) ) ( not ( = ?auto_186691 ?auto_186693 ) ) ( not ( = ?auto_186691 ?auto_186694 ) ) ( not ( = ?auto_186691 ?auto_186695 ) ) ( not ( = ?auto_186691 ?auto_186696 ) ) ( not ( = ?auto_186691 ?auto_186697 ) ) ( not ( = ?auto_186692 ?auto_186693 ) ) ( not ( = ?auto_186692 ?auto_186694 ) ) ( not ( = ?auto_186692 ?auto_186695 ) ) ( not ( = ?auto_186692 ?auto_186696 ) ) ( not ( = ?auto_186692 ?auto_186697 ) ) ( not ( = ?auto_186693 ?auto_186694 ) ) ( not ( = ?auto_186693 ?auto_186695 ) ) ( not ( = ?auto_186693 ?auto_186696 ) ) ( not ( = ?auto_186693 ?auto_186697 ) ) ( not ( = ?auto_186694 ?auto_186695 ) ) ( not ( = ?auto_186694 ?auto_186696 ) ) ( not ( = ?auto_186694 ?auto_186697 ) ) ( not ( = ?auto_186695 ?auto_186696 ) ) ( not ( = ?auto_186695 ?auto_186697 ) ) ( not ( = ?auto_186696 ?auto_186697 ) ) ( ON ?auto_186695 ?auto_186696 ) ( ON ?auto_186694 ?auto_186695 ) ( ON ?auto_186693 ?auto_186694 ) ( ON ?auto_186692 ?auto_186693 ) ( ON ?auto_186691 ?auto_186692 ) ( ON ?auto_186690 ?auto_186691 ) ( CLEAR ?auto_186690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186690 )
      ( MAKE-7PILE ?auto_186690 ?auto_186691 ?auto_186692 ?auto_186693 ?auto_186694 ?auto_186695 ?auto_186696 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186721 - BLOCK
      ?auto_186722 - BLOCK
      ?auto_186723 - BLOCK
      ?auto_186724 - BLOCK
      ?auto_186725 - BLOCK
      ?auto_186726 - BLOCK
      ?auto_186727 - BLOCK
      ?auto_186728 - BLOCK
    )
    :vars
    (
      ?auto_186729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186727 ) ( ON ?auto_186728 ?auto_186729 ) ( CLEAR ?auto_186728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186721 ) ( ON ?auto_186722 ?auto_186721 ) ( ON ?auto_186723 ?auto_186722 ) ( ON ?auto_186724 ?auto_186723 ) ( ON ?auto_186725 ?auto_186724 ) ( ON ?auto_186726 ?auto_186725 ) ( ON ?auto_186727 ?auto_186726 ) ( not ( = ?auto_186721 ?auto_186722 ) ) ( not ( = ?auto_186721 ?auto_186723 ) ) ( not ( = ?auto_186721 ?auto_186724 ) ) ( not ( = ?auto_186721 ?auto_186725 ) ) ( not ( = ?auto_186721 ?auto_186726 ) ) ( not ( = ?auto_186721 ?auto_186727 ) ) ( not ( = ?auto_186721 ?auto_186728 ) ) ( not ( = ?auto_186721 ?auto_186729 ) ) ( not ( = ?auto_186722 ?auto_186723 ) ) ( not ( = ?auto_186722 ?auto_186724 ) ) ( not ( = ?auto_186722 ?auto_186725 ) ) ( not ( = ?auto_186722 ?auto_186726 ) ) ( not ( = ?auto_186722 ?auto_186727 ) ) ( not ( = ?auto_186722 ?auto_186728 ) ) ( not ( = ?auto_186722 ?auto_186729 ) ) ( not ( = ?auto_186723 ?auto_186724 ) ) ( not ( = ?auto_186723 ?auto_186725 ) ) ( not ( = ?auto_186723 ?auto_186726 ) ) ( not ( = ?auto_186723 ?auto_186727 ) ) ( not ( = ?auto_186723 ?auto_186728 ) ) ( not ( = ?auto_186723 ?auto_186729 ) ) ( not ( = ?auto_186724 ?auto_186725 ) ) ( not ( = ?auto_186724 ?auto_186726 ) ) ( not ( = ?auto_186724 ?auto_186727 ) ) ( not ( = ?auto_186724 ?auto_186728 ) ) ( not ( = ?auto_186724 ?auto_186729 ) ) ( not ( = ?auto_186725 ?auto_186726 ) ) ( not ( = ?auto_186725 ?auto_186727 ) ) ( not ( = ?auto_186725 ?auto_186728 ) ) ( not ( = ?auto_186725 ?auto_186729 ) ) ( not ( = ?auto_186726 ?auto_186727 ) ) ( not ( = ?auto_186726 ?auto_186728 ) ) ( not ( = ?auto_186726 ?auto_186729 ) ) ( not ( = ?auto_186727 ?auto_186728 ) ) ( not ( = ?auto_186727 ?auto_186729 ) ) ( not ( = ?auto_186728 ?auto_186729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186728 ?auto_186729 )
      ( !STACK ?auto_186728 ?auto_186727 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186755 - BLOCK
      ?auto_186756 - BLOCK
      ?auto_186757 - BLOCK
      ?auto_186758 - BLOCK
      ?auto_186759 - BLOCK
      ?auto_186760 - BLOCK
      ?auto_186761 - BLOCK
      ?auto_186762 - BLOCK
    )
    :vars
    (
      ?auto_186763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186762 ?auto_186763 ) ( ON-TABLE ?auto_186755 ) ( ON ?auto_186756 ?auto_186755 ) ( ON ?auto_186757 ?auto_186756 ) ( ON ?auto_186758 ?auto_186757 ) ( ON ?auto_186759 ?auto_186758 ) ( ON ?auto_186760 ?auto_186759 ) ( not ( = ?auto_186755 ?auto_186756 ) ) ( not ( = ?auto_186755 ?auto_186757 ) ) ( not ( = ?auto_186755 ?auto_186758 ) ) ( not ( = ?auto_186755 ?auto_186759 ) ) ( not ( = ?auto_186755 ?auto_186760 ) ) ( not ( = ?auto_186755 ?auto_186761 ) ) ( not ( = ?auto_186755 ?auto_186762 ) ) ( not ( = ?auto_186755 ?auto_186763 ) ) ( not ( = ?auto_186756 ?auto_186757 ) ) ( not ( = ?auto_186756 ?auto_186758 ) ) ( not ( = ?auto_186756 ?auto_186759 ) ) ( not ( = ?auto_186756 ?auto_186760 ) ) ( not ( = ?auto_186756 ?auto_186761 ) ) ( not ( = ?auto_186756 ?auto_186762 ) ) ( not ( = ?auto_186756 ?auto_186763 ) ) ( not ( = ?auto_186757 ?auto_186758 ) ) ( not ( = ?auto_186757 ?auto_186759 ) ) ( not ( = ?auto_186757 ?auto_186760 ) ) ( not ( = ?auto_186757 ?auto_186761 ) ) ( not ( = ?auto_186757 ?auto_186762 ) ) ( not ( = ?auto_186757 ?auto_186763 ) ) ( not ( = ?auto_186758 ?auto_186759 ) ) ( not ( = ?auto_186758 ?auto_186760 ) ) ( not ( = ?auto_186758 ?auto_186761 ) ) ( not ( = ?auto_186758 ?auto_186762 ) ) ( not ( = ?auto_186758 ?auto_186763 ) ) ( not ( = ?auto_186759 ?auto_186760 ) ) ( not ( = ?auto_186759 ?auto_186761 ) ) ( not ( = ?auto_186759 ?auto_186762 ) ) ( not ( = ?auto_186759 ?auto_186763 ) ) ( not ( = ?auto_186760 ?auto_186761 ) ) ( not ( = ?auto_186760 ?auto_186762 ) ) ( not ( = ?auto_186760 ?auto_186763 ) ) ( not ( = ?auto_186761 ?auto_186762 ) ) ( not ( = ?auto_186761 ?auto_186763 ) ) ( not ( = ?auto_186762 ?auto_186763 ) ) ( CLEAR ?auto_186760 ) ( ON ?auto_186761 ?auto_186762 ) ( CLEAR ?auto_186761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186755 ?auto_186756 ?auto_186757 ?auto_186758 ?auto_186759 ?auto_186760 ?auto_186761 )
      ( MAKE-8PILE ?auto_186755 ?auto_186756 ?auto_186757 ?auto_186758 ?auto_186759 ?auto_186760 ?auto_186761 ?auto_186762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186789 - BLOCK
      ?auto_186790 - BLOCK
      ?auto_186791 - BLOCK
      ?auto_186792 - BLOCK
      ?auto_186793 - BLOCK
      ?auto_186794 - BLOCK
      ?auto_186795 - BLOCK
      ?auto_186796 - BLOCK
    )
    :vars
    (
      ?auto_186797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186796 ?auto_186797 ) ( ON-TABLE ?auto_186789 ) ( ON ?auto_186790 ?auto_186789 ) ( ON ?auto_186791 ?auto_186790 ) ( ON ?auto_186792 ?auto_186791 ) ( ON ?auto_186793 ?auto_186792 ) ( not ( = ?auto_186789 ?auto_186790 ) ) ( not ( = ?auto_186789 ?auto_186791 ) ) ( not ( = ?auto_186789 ?auto_186792 ) ) ( not ( = ?auto_186789 ?auto_186793 ) ) ( not ( = ?auto_186789 ?auto_186794 ) ) ( not ( = ?auto_186789 ?auto_186795 ) ) ( not ( = ?auto_186789 ?auto_186796 ) ) ( not ( = ?auto_186789 ?auto_186797 ) ) ( not ( = ?auto_186790 ?auto_186791 ) ) ( not ( = ?auto_186790 ?auto_186792 ) ) ( not ( = ?auto_186790 ?auto_186793 ) ) ( not ( = ?auto_186790 ?auto_186794 ) ) ( not ( = ?auto_186790 ?auto_186795 ) ) ( not ( = ?auto_186790 ?auto_186796 ) ) ( not ( = ?auto_186790 ?auto_186797 ) ) ( not ( = ?auto_186791 ?auto_186792 ) ) ( not ( = ?auto_186791 ?auto_186793 ) ) ( not ( = ?auto_186791 ?auto_186794 ) ) ( not ( = ?auto_186791 ?auto_186795 ) ) ( not ( = ?auto_186791 ?auto_186796 ) ) ( not ( = ?auto_186791 ?auto_186797 ) ) ( not ( = ?auto_186792 ?auto_186793 ) ) ( not ( = ?auto_186792 ?auto_186794 ) ) ( not ( = ?auto_186792 ?auto_186795 ) ) ( not ( = ?auto_186792 ?auto_186796 ) ) ( not ( = ?auto_186792 ?auto_186797 ) ) ( not ( = ?auto_186793 ?auto_186794 ) ) ( not ( = ?auto_186793 ?auto_186795 ) ) ( not ( = ?auto_186793 ?auto_186796 ) ) ( not ( = ?auto_186793 ?auto_186797 ) ) ( not ( = ?auto_186794 ?auto_186795 ) ) ( not ( = ?auto_186794 ?auto_186796 ) ) ( not ( = ?auto_186794 ?auto_186797 ) ) ( not ( = ?auto_186795 ?auto_186796 ) ) ( not ( = ?auto_186795 ?auto_186797 ) ) ( not ( = ?auto_186796 ?auto_186797 ) ) ( ON ?auto_186795 ?auto_186796 ) ( CLEAR ?auto_186793 ) ( ON ?auto_186794 ?auto_186795 ) ( CLEAR ?auto_186794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186789 ?auto_186790 ?auto_186791 ?auto_186792 ?auto_186793 ?auto_186794 )
      ( MAKE-8PILE ?auto_186789 ?auto_186790 ?auto_186791 ?auto_186792 ?auto_186793 ?auto_186794 ?auto_186795 ?auto_186796 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186823 - BLOCK
      ?auto_186824 - BLOCK
      ?auto_186825 - BLOCK
      ?auto_186826 - BLOCK
      ?auto_186827 - BLOCK
      ?auto_186828 - BLOCK
      ?auto_186829 - BLOCK
      ?auto_186830 - BLOCK
    )
    :vars
    (
      ?auto_186831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186830 ?auto_186831 ) ( ON-TABLE ?auto_186823 ) ( ON ?auto_186824 ?auto_186823 ) ( ON ?auto_186825 ?auto_186824 ) ( ON ?auto_186826 ?auto_186825 ) ( not ( = ?auto_186823 ?auto_186824 ) ) ( not ( = ?auto_186823 ?auto_186825 ) ) ( not ( = ?auto_186823 ?auto_186826 ) ) ( not ( = ?auto_186823 ?auto_186827 ) ) ( not ( = ?auto_186823 ?auto_186828 ) ) ( not ( = ?auto_186823 ?auto_186829 ) ) ( not ( = ?auto_186823 ?auto_186830 ) ) ( not ( = ?auto_186823 ?auto_186831 ) ) ( not ( = ?auto_186824 ?auto_186825 ) ) ( not ( = ?auto_186824 ?auto_186826 ) ) ( not ( = ?auto_186824 ?auto_186827 ) ) ( not ( = ?auto_186824 ?auto_186828 ) ) ( not ( = ?auto_186824 ?auto_186829 ) ) ( not ( = ?auto_186824 ?auto_186830 ) ) ( not ( = ?auto_186824 ?auto_186831 ) ) ( not ( = ?auto_186825 ?auto_186826 ) ) ( not ( = ?auto_186825 ?auto_186827 ) ) ( not ( = ?auto_186825 ?auto_186828 ) ) ( not ( = ?auto_186825 ?auto_186829 ) ) ( not ( = ?auto_186825 ?auto_186830 ) ) ( not ( = ?auto_186825 ?auto_186831 ) ) ( not ( = ?auto_186826 ?auto_186827 ) ) ( not ( = ?auto_186826 ?auto_186828 ) ) ( not ( = ?auto_186826 ?auto_186829 ) ) ( not ( = ?auto_186826 ?auto_186830 ) ) ( not ( = ?auto_186826 ?auto_186831 ) ) ( not ( = ?auto_186827 ?auto_186828 ) ) ( not ( = ?auto_186827 ?auto_186829 ) ) ( not ( = ?auto_186827 ?auto_186830 ) ) ( not ( = ?auto_186827 ?auto_186831 ) ) ( not ( = ?auto_186828 ?auto_186829 ) ) ( not ( = ?auto_186828 ?auto_186830 ) ) ( not ( = ?auto_186828 ?auto_186831 ) ) ( not ( = ?auto_186829 ?auto_186830 ) ) ( not ( = ?auto_186829 ?auto_186831 ) ) ( not ( = ?auto_186830 ?auto_186831 ) ) ( ON ?auto_186829 ?auto_186830 ) ( ON ?auto_186828 ?auto_186829 ) ( CLEAR ?auto_186826 ) ( ON ?auto_186827 ?auto_186828 ) ( CLEAR ?auto_186827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186823 ?auto_186824 ?auto_186825 ?auto_186826 ?auto_186827 )
      ( MAKE-8PILE ?auto_186823 ?auto_186824 ?auto_186825 ?auto_186826 ?auto_186827 ?auto_186828 ?auto_186829 ?auto_186830 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186857 - BLOCK
      ?auto_186858 - BLOCK
      ?auto_186859 - BLOCK
      ?auto_186860 - BLOCK
      ?auto_186861 - BLOCK
      ?auto_186862 - BLOCK
      ?auto_186863 - BLOCK
      ?auto_186864 - BLOCK
    )
    :vars
    (
      ?auto_186865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186864 ?auto_186865 ) ( ON-TABLE ?auto_186857 ) ( ON ?auto_186858 ?auto_186857 ) ( ON ?auto_186859 ?auto_186858 ) ( not ( = ?auto_186857 ?auto_186858 ) ) ( not ( = ?auto_186857 ?auto_186859 ) ) ( not ( = ?auto_186857 ?auto_186860 ) ) ( not ( = ?auto_186857 ?auto_186861 ) ) ( not ( = ?auto_186857 ?auto_186862 ) ) ( not ( = ?auto_186857 ?auto_186863 ) ) ( not ( = ?auto_186857 ?auto_186864 ) ) ( not ( = ?auto_186857 ?auto_186865 ) ) ( not ( = ?auto_186858 ?auto_186859 ) ) ( not ( = ?auto_186858 ?auto_186860 ) ) ( not ( = ?auto_186858 ?auto_186861 ) ) ( not ( = ?auto_186858 ?auto_186862 ) ) ( not ( = ?auto_186858 ?auto_186863 ) ) ( not ( = ?auto_186858 ?auto_186864 ) ) ( not ( = ?auto_186858 ?auto_186865 ) ) ( not ( = ?auto_186859 ?auto_186860 ) ) ( not ( = ?auto_186859 ?auto_186861 ) ) ( not ( = ?auto_186859 ?auto_186862 ) ) ( not ( = ?auto_186859 ?auto_186863 ) ) ( not ( = ?auto_186859 ?auto_186864 ) ) ( not ( = ?auto_186859 ?auto_186865 ) ) ( not ( = ?auto_186860 ?auto_186861 ) ) ( not ( = ?auto_186860 ?auto_186862 ) ) ( not ( = ?auto_186860 ?auto_186863 ) ) ( not ( = ?auto_186860 ?auto_186864 ) ) ( not ( = ?auto_186860 ?auto_186865 ) ) ( not ( = ?auto_186861 ?auto_186862 ) ) ( not ( = ?auto_186861 ?auto_186863 ) ) ( not ( = ?auto_186861 ?auto_186864 ) ) ( not ( = ?auto_186861 ?auto_186865 ) ) ( not ( = ?auto_186862 ?auto_186863 ) ) ( not ( = ?auto_186862 ?auto_186864 ) ) ( not ( = ?auto_186862 ?auto_186865 ) ) ( not ( = ?auto_186863 ?auto_186864 ) ) ( not ( = ?auto_186863 ?auto_186865 ) ) ( not ( = ?auto_186864 ?auto_186865 ) ) ( ON ?auto_186863 ?auto_186864 ) ( ON ?auto_186862 ?auto_186863 ) ( ON ?auto_186861 ?auto_186862 ) ( CLEAR ?auto_186859 ) ( ON ?auto_186860 ?auto_186861 ) ( CLEAR ?auto_186860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186857 ?auto_186858 ?auto_186859 ?auto_186860 )
      ( MAKE-8PILE ?auto_186857 ?auto_186858 ?auto_186859 ?auto_186860 ?auto_186861 ?auto_186862 ?auto_186863 ?auto_186864 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186891 - BLOCK
      ?auto_186892 - BLOCK
      ?auto_186893 - BLOCK
      ?auto_186894 - BLOCK
      ?auto_186895 - BLOCK
      ?auto_186896 - BLOCK
      ?auto_186897 - BLOCK
      ?auto_186898 - BLOCK
    )
    :vars
    (
      ?auto_186899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186898 ?auto_186899 ) ( ON-TABLE ?auto_186891 ) ( ON ?auto_186892 ?auto_186891 ) ( not ( = ?auto_186891 ?auto_186892 ) ) ( not ( = ?auto_186891 ?auto_186893 ) ) ( not ( = ?auto_186891 ?auto_186894 ) ) ( not ( = ?auto_186891 ?auto_186895 ) ) ( not ( = ?auto_186891 ?auto_186896 ) ) ( not ( = ?auto_186891 ?auto_186897 ) ) ( not ( = ?auto_186891 ?auto_186898 ) ) ( not ( = ?auto_186891 ?auto_186899 ) ) ( not ( = ?auto_186892 ?auto_186893 ) ) ( not ( = ?auto_186892 ?auto_186894 ) ) ( not ( = ?auto_186892 ?auto_186895 ) ) ( not ( = ?auto_186892 ?auto_186896 ) ) ( not ( = ?auto_186892 ?auto_186897 ) ) ( not ( = ?auto_186892 ?auto_186898 ) ) ( not ( = ?auto_186892 ?auto_186899 ) ) ( not ( = ?auto_186893 ?auto_186894 ) ) ( not ( = ?auto_186893 ?auto_186895 ) ) ( not ( = ?auto_186893 ?auto_186896 ) ) ( not ( = ?auto_186893 ?auto_186897 ) ) ( not ( = ?auto_186893 ?auto_186898 ) ) ( not ( = ?auto_186893 ?auto_186899 ) ) ( not ( = ?auto_186894 ?auto_186895 ) ) ( not ( = ?auto_186894 ?auto_186896 ) ) ( not ( = ?auto_186894 ?auto_186897 ) ) ( not ( = ?auto_186894 ?auto_186898 ) ) ( not ( = ?auto_186894 ?auto_186899 ) ) ( not ( = ?auto_186895 ?auto_186896 ) ) ( not ( = ?auto_186895 ?auto_186897 ) ) ( not ( = ?auto_186895 ?auto_186898 ) ) ( not ( = ?auto_186895 ?auto_186899 ) ) ( not ( = ?auto_186896 ?auto_186897 ) ) ( not ( = ?auto_186896 ?auto_186898 ) ) ( not ( = ?auto_186896 ?auto_186899 ) ) ( not ( = ?auto_186897 ?auto_186898 ) ) ( not ( = ?auto_186897 ?auto_186899 ) ) ( not ( = ?auto_186898 ?auto_186899 ) ) ( ON ?auto_186897 ?auto_186898 ) ( ON ?auto_186896 ?auto_186897 ) ( ON ?auto_186895 ?auto_186896 ) ( ON ?auto_186894 ?auto_186895 ) ( CLEAR ?auto_186892 ) ( ON ?auto_186893 ?auto_186894 ) ( CLEAR ?auto_186893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186891 ?auto_186892 ?auto_186893 )
      ( MAKE-8PILE ?auto_186891 ?auto_186892 ?auto_186893 ?auto_186894 ?auto_186895 ?auto_186896 ?auto_186897 ?auto_186898 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186925 - BLOCK
      ?auto_186926 - BLOCK
      ?auto_186927 - BLOCK
      ?auto_186928 - BLOCK
      ?auto_186929 - BLOCK
      ?auto_186930 - BLOCK
      ?auto_186931 - BLOCK
      ?auto_186932 - BLOCK
    )
    :vars
    (
      ?auto_186933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186932 ?auto_186933 ) ( ON-TABLE ?auto_186925 ) ( not ( = ?auto_186925 ?auto_186926 ) ) ( not ( = ?auto_186925 ?auto_186927 ) ) ( not ( = ?auto_186925 ?auto_186928 ) ) ( not ( = ?auto_186925 ?auto_186929 ) ) ( not ( = ?auto_186925 ?auto_186930 ) ) ( not ( = ?auto_186925 ?auto_186931 ) ) ( not ( = ?auto_186925 ?auto_186932 ) ) ( not ( = ?auto_186925 ?auto_186933 ) ) ( not ( = ?auto_186926 ?auto_186927 ) ) ( not ( = ?auto_186926 ?auto_186928 ) ) ( not ( = ?auto_186926 ?auto_186929 ) ) ( not ( = ?auto_186926 ?auto_186930 ) ) ( not ( = ?auto_186926 ?auto_186931 ) ) ( not ( = ?auto_186926 ?auto_186932 ) ) ( not ( = ?auto_186926 ?auto_186933 ) ) ( not ( = ?auto_186927 ?auto_186928 ) ) ( not ( = ?auto_186927 ?auto_186929 ) ) ( not ( = ?auto_186927 ?auto_186930 ) ) ( not ( = ?auto_186927 ?auto_186931 ) ) ( not ( = ?auto_186927 ?auto_186932 ) ) ( not ( = ?auto_186927 ?auto_186933 ) ) ( not ( = ?auto_186928 ?auto_186929 ) ) ( not ( = ?auto_186928 ?auto_186930 ) ) ( not ( = ?auto_186928 ?auto_186931 ) ) ( not ( = ?auto_186928 ?auto_186932 ) ) ( not ( = ?auto_186928 ?auto_186933 ) ) ( not ( = ?auto_186929 ?auto_186930 ) ) ( not ( = ?auto_186929 ?auto_186931 ) ) ( not ( = ?auto_186929 ?auto_186932 ) ) ( not ( = ?auto_186929 ?auto_186933 ) ) ( not ( = ?auto_186930 ?auto_186931 ) ) ( not ( = ?auto_186930 ?auto_186932 ) ) ( not ( = ?auto_186930 ?auto_186933 ) ) ( not ( = ?auto_186931 ?auto_186932 ) ) ( not ( = ?auto_186931 ?auto_186933 ) ) ( not ( = ?auto_186932 ?auto_186933 ) ) ( ON ?auto_186931 ?auto_186932 ) ( ON ?auto_186930 ?auto_186931 ) ( ON ?auto_186929 ?auto_186930 ) ( ON ?auto_186928 ?auto_186929 ) ( ON ?auto_186927 ?auto_186928 ) ( CLEAR ?auto_186925 ) ( ON ?auto_186926 ?auto_186927 ) ( CLEAR ?auto_186926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186925 ?auto_186926 )
      ( MAKE-8PILE ?auto_186925 ?auto_186926 ?auto_186927 ?auto_186928 ?auto_186929 ?auto_186930 ?auto_186931 ?auto_186932 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_186959 - BLOCK
      ?auto_186960 - BLOCK
      ?auto_186961 - BLOCK
      ?auto_186962 - BLOCK
      ?auto_186963 - BLOCK
      ?auto_186964 - BLOCK
      ?auto_186965 - BLOCK
      ?auto_186966 - BLOCK
    )
    :vars
    (
      ?auto_186967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186966 ?auto_186967 ) ( not ( = ?auto_186959 ?auto_186960 ) ) ( not ( = ?auto_186959 ?auto_186961 ) ) ( not ( = ?auto_186959 ?auto_186962 ) ) ( not ( = ?auto_186959 ?auto_186963 ) ) ( not ( = ?auto_186959 ?auto_186964 ) ) ( not ( = ?auto_186959 ?auto_186965 ) ) ( not ( = ?auto_186959 ?auto_186966 ) ) ( not ( = ?auto_186959 ?auto_186967 ) ) ( not ( = ?auto_186960 ?auto_186961 ) ) ( not ( = ?auto_186960 ?auto_186962 ) ) ( not ( = ?auto_186960 ?auto_186963 ) ) ( not ( = ?auto_186960 ?auto_186964 ) ) ( not ( = ?auto_186960 ?auto_186965 ) ) ( not ( = ?auto_186960 ?auto_186966 ) ) ( not ( = ?auto_186960 ?auto_186967 ) ) ( not ( = ?auto_186961 ?auto_186962 ) ) ( not ( = ?auto_186961 ?auto_186963 ) ) ( not ( = ?auto_186961 ?auto_186964 ) ) ( not ( = ?auto_186961 ?auto_186965 ) ) ( not ( = ?auto_186961 ?auto_186966 ) ) ( not ( = ?auto_186961 ?auto_186967 ) ) ( not ( = ?auto_186962 ?auto_186963 ) ) ( not ( = ?auto_186962 ?auto_186964 ) ) ( not ( = ?auto_186962 ?auto_186965 ) ) ( not ( = ?auto_186962 ?auto_186966 ) ) ( not ( = ?auto_186962 ?auto_186967 ) ) ( not ( = ?auto_186963 ?auto_186964 ) ) ( not ( = ?auto_186963 ?auto_186965 ) ) ( not ( = ?auto_186963 ?auto_186966 ) ) ( not ( = ?auto_186963 ?auto_186967 ) ) ( not ( = ?auto_186964 ?auto_186965 ) ) ( not ( = ?auto_186964 ?auto_186966 ) ) ( not ( = ?auto_186964 ?auto_186967 ) ) ( not ( = ?auto_186965 ?auto_186966 ) ) ( not ( = ?auto_186965 ?auto_186967 ) ) ( not ( = ?auto_186966 ?auto_186967 ) ) ( ON ?auto_186965 ?auto_186966 ) ( ON ?auto_186964 ?auto_186965 ) ( ON ?auto_186963 ?auto_186964 ) ( ON ?auto_186962 ?auto_186963 ) ( ON ?auto_186961 ?auto_186962 ) ( ON ?auto_186960 ?auto_186961 ) ( ON ?auto_186959 ?auto_186960 ) ( CLEAR ?auto_186959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186959 )
      ( MAKE-8PILE ?auto_186959 ?auto_186960 ?auto_186961 ?auto_186962 ?auto_186963 ?auto_186964 ?auto_186965 ?auto_186966 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_186994 - BLOCK
      ?auto_186995 - BLOCK
      ?auto_186996 - BLOCK
      ?auto_186997 - BLOCK
      ?auto_186998 - BLOCK
      ?auto_186999 - BLOCK
      ?auto_187000 - BLOCK
      ?auto_187001 - BLOCK
      ?auto_187002 - BLOCK
    )
    :vars
    (
      ?auto_187003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187001 ) ( ON ?auto_187002 ?auto_187003 ) ( CLEAR ?auto_187002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186994 ) ( ON ?auto_186995 ?auto_186994 ) ( ON ?auto_186996 ?auto_186995 ) ( ON ?auto_186997 ?auto_186996 ) ( ON ?auto_186998 ?auto_186997 ) ( ON ?auto_186999 ?auto_186998 ) ( ON ?auto_187000 ?auto_186999 ) ( ON ?auto_187001 ?auto_187000 ) ( not ( = ?auto_186994 ?auto_186995 ) ) ( not ( = ?auto_186994 ?auto_186996 ) ) ( not ( = ?auto_186994 ?auto_186997 ) ) ( not ( = ?auto_186994 ?auto_186998 ) ) ( not ( = ?auto_186994 ?auto_186999 ) ) ( not ( = ?auto_186994 ?auto_187000 ) ) ( not ( = ?auto_186994 ?auto_187001 ) ) ( not ( = ?auto_186994 ?auto_187002 ) ) ( not ( = ?auto_186994 ?auto_187003 ) ) ( not ( = ?auto_186995 ?auto_186996 ) ) ( not ( = ?auto_186995 ?auto_186997 ) ) ( not ( = ?auto_186995 ?auto_186998 ) ) ( not ( = ?auto_186995 ?auto_186999 ) ) ( not ( = ?auto_186995 ?auto_187000 ) ) ( not ( = ?auto_186995 ?auto_187001 ) ) ( not ( = ?auto_186995 ?auto_187002 ) ) ( not ( = ?auto_186995 ?auto_187003 ) ) ( not ( = ?auto_186996 ?auto_186997 ) ) ( not ( = ?auto_186996 ?auto_186998 ) ) ( not ( = ?auto_186996 ?auto_186999 ) ) ( not ( = ?auto_186996 ?auto_187000 ) ) ( not ( = ?auto_186996 ?auto_187001 ) ) ( not ( = ?auto_186996 ?auto_187002 ) ) ( not ( = ?auto_186996 ?auto_187003 ) ) ( not ( = ?auto_186997 ?auto_186998 ) ) ( not ( = ?auto_186997 ?auto_186999 ) ) ( not ( = ?auto_186997 ?auto_187000 ) ) ( not ( = ?auto_186997 ?auto_187001 ) ) ( not ( = ?auto_186997 ?auto_187002 ) ) ( not ( = ?auto_186997 ?auto_187003 ) ) ( not ( = ?auto_186998 ?auto_186999 ) ) ( not ( = ?auto_186998 ?auto_187000 ) ) ( not ( = ?auto_186998 ?auto_187001 ) ) ( not ( = ?auto_186998 ?auto_187002 ) ) ( not ( = ?auto_186998 ?auto_187003 ) ) ( not ( = ?auto_186999 ?auto_187000 ) ) ( not ( = ?auto_186999 ?auto_187001 ) ) ( not ( = ?auto_186999 ?auto_187002 ) ) ( not ( = ?auto_186999 ?auto_187003 ) ) ( not ( = ?auto_187000 ?auto_187001 ) ) ( not ( = ?auto_187000 ?auto_187002 ) ) ( not ( = ?auto_187000 ?auto_187003 ) ) ( not ( = ?auto_187001 ?auto_187002 ) ) ( not ( = ?auto_187001 ?auto_187003 ) ) ( not ( = ?auto_187002 ?auto_187003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187002 ?auto_187003 )
      ( !STACK ?auto_187002 ?auto_187001 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187032 - BLOCK
      ?auto_187033 - BLOCK
      ?auto_187034 - BLOCK
      ?auto_187035 - BLOCK
      ?auto_187036 - BLOCK
      ?auto_187037 - BLOCK
      ?auto_187038 - BLOCK
      ?auto_187039 - BLOCK
      ?auto_187040 - BLOCK
    )
    :vars
    (
      ?auto_187041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187040 ?auto_187041 ) ( ON-TABLE ?auto_187032 ) ( ON ?auto_187033 ?auto_187032 ) ( ON ?auto_187034 ?auto_187033 ) ( ON ?auto_187035 ?auto_187034 ) ( ON ?auto_187036 ?auto_187035 ) ( ON ?auto_187037 ?auto_187036 ) ( ON ?auto_187038 ?auto_187037 ) ( not ( = ?auto_187032 ?auto_187033 ) ) ( not ( = ?auto_187032 ?auto_187034 ) ) ( not ( = ?auto_187032 ?auto_187035 ) ) ( not ( = ?auto_187032 ?auto_187036 ) ) ( not ( = ?auto_187032 ?auto_187037 ) ) ( not ( = ?auto_187032 ?auto_187038 ) ) ( not ( = ?auto_187032 ?auto_187039 ) ) ( not ( = ?auto_187032 ?auto_187040 ) ) ( not ( = ?auto_187032 ?auto_187041 ) ) ( not ( = ?auto_187033 ?auto_187034 ) ) ( not ( = ?auto_187033 ?auto_187035 ) ) ( not ( = ?auto_187033 ?auto_187036 ) ) ( not ( = ?auto_187033 ?auto_187037 ) ) ( not ( = ?auto_187033 ?auto_187038 ) ) ( not ( = ?auto_187033 ?auto_187039 ) ) ( not ( = ?auto_187033 ?auto_187040 ) ) ( not ( = ?auto_187033 ?auto_187041 ) ) ( not ( = ?auto_187034 ?auto_187035 ) ) ( not ( = ?auto_187034 ?auto_187036 ) ) ( not ( = ?auto_187034 ?auto_187037 ) ) ( not ( = ?auto_187034 ?auto_187038 ) ) ( not ( = ?auto_187034 ?auto_187039 ) ) ( not ( = ?auto_187034 ?auto_187040 ) ) ( not ( = ?auto_187034 ?auto_187041 ) ) ( not ( = ?auto_187035 ?auto_187036 ) ) ( not ( = ?auto_187035 ?auto_187037 ) ) ( not ( = ?auto_187035 ?auto_187038 ) ) ( not ( = ?auto_187035 ?auto_187039 ) ) ( not ( = ?auto_187035 ?auto_187040 ) ) ( not ( = ?auto_187035 ?auto_187041 ) ) ( not ( = ?auto_187036 ?auto_187037 ) ) ( not ( = ?auto_187036 ?auto_187038 ) ) ( not ( = ?auto_187036 ?auto_187039 ) ) ( not ( = ?auto_187036 ?auto_187040 ) ) ( not ( = ?auto_187036 ?auto_187041 ) ) ( not ( = ?auto_187037 ?auto_187038 ) ) ( not ( = ?auto_187037 ?auto_187039 ) ) ( not ( = ?auto_187037 ?auto_187040 ) ) ( not ( = ?auto_187037 ?auto_187041 ) ) ( not ( = ?auto_187038 ?auto_187039 ) ) ( not ( = ?auto_187038 ?auto_187040 ) ) ( not ( = ?auto_187038 ?auto_187041 ) ) ( not ( = ?auto_187039 ?auto_187040 ) ) ( not ( = ?auto_187039 ?auto_187041 ) ) ( not ( = ?auto_187040 ?auto_187041 ) ) ( CLEAR ?auto_187038 ) ( ON ?auto_187039 ?auto_187040 ) ( CLEAR ?auto_187039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187032 ?auto_187033 ?auto_187034 ?auto_187035 ?auto_187036 ?auto_187037 ?auto_187038 ?auto_187039 )
      ( MAKE-9PILE ?auto_187032 ?auto_187033 ?auto_187034 ?auto_187035 ?auto_187036 ?auto_187037 ?auto_187038 ?auto_187039 ?auto_187040 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187070 - BLOCK
      ?auto_187071 - BLOCK
      ?auto_187072 - BLOCK
      ?auto_187073 - BLOCK
      ?auto_187074 - BLOCK
      ?auto_187075 - BLOCK
      ?auto_187076 - BLOCK
      ?auto_187077 - BLOCK
      ?auto_187078 - BLOCK
    )
    :vars
    (
      ?auto_187079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187078 ?auto_187079 ) ( ON-TABLE ?auto_187070 ) ( ON ?auto_187071 ?auto_187070 ) ( ON ?auto_187072 ?auto_187071 ) ( ON ?auto_187073 ?auto_187072 ) ( ON ?auto_187074 ?auto_187073 ) ( ON ?auto_187075 ?auto_187074 ) ( not ( = ?auto_187070 ?auto_187071 ) ) ( not ( = ?auto_187070 ?auto_187072 ) ) ( not ( = ?auto_187070 ?auto_187073 ) ) ( not ( = ?auto_187070 ?auto_187074 ) ) ( not ( = ?auto_187070 ?auto_187075 ) ) ( not ( = ?auto_187070 ?auto_187076 ) ) ( not ( = ?auto_187070 ?auto_187077 ) ) ( not ( = ?auto_187070 ?auto_187078 ) ) ( not ( = ?auto_187070 ?auto_187079 ) ) ( not ( = ?auto_187071 ?auto_187072 ) ) ( not ( = ?auto_187071 ?auto_187073 ) ) ( not ( = ?auto_187071 ?auto_187074 ) ) ( not ( = ?auto_187071 ?auto_187075 ) ) ( not ( = ?auto_187071 ?auto_187076 ) ) ( not ( = ?auto_187071 ?auto_187077 ) ) ( not ( = ?auto_187071 ?auto_187078 ) ) ( not ( = ?auto_187071 ?auto_187079 ) ) ( not ( = ?auto_187072 ?auto_187073 ) ) ( not ( = ?auto_187072 ?auto_187074 ) ) ( not ( = ?auto_187072 ?auto_187075 ) ) ( not ( = ?auto_187072 ?auto_187076 ) ) ( not ( = ?auto_187072 ?auto_187077 ) ) ( not ( = ?auto_187072 ?auto_187078 ) ) ( not ( = ?auto_187072 ?auto_187079 ) ) ( not ( = ?auto_187073 ?auto_187074 ) ) ( not ( = ?auto_187073 ?auto_187075 ) ) ( not ( = ?auto_187073 ?auto_187076 ) ) ( not ( = ?auto_187073 ?auto_187077 ) ) ( not ( = ?auto_187073 ?auto_187078 ) ) ( not ( = ?auto_187073 ?auto_187079 ) ) ( not ( = ?auto_187074 ?auto_187075 ) ) ( not ( = ?auto_187074 ?auto_187076 ) ) ( not ( = ?auto_187074 ?auto_187077 ) ) ( not ( = ?auto_187074 ?auto_187078 ) ) ( not ( = ?auto_187074 ?auto_187079 ) ) ( not ( = ?auto_187075 ?auto_187076 ) ) ( not ( = ?auto_187075 ?auto_187077 ) ) ( not ( = ?auto_187075 ?auto_187078 ) ) ( not ( = ?auto_187075 ?auto_187079 ) ) ( not ( = ?auto_187076 ?auto_187077 ) ) ( not ( = ?auto_187076 ?auto_187078 ) ) ( not ( = ?auto_187076 ?auto_187079 ) ) ( not ( = ?auto_187077 ?auto_187078 ) ) ( not ( = ?auto_187077 ?auto_187079 ) ) ( not ( = ?auto_187078 ?auto_187079 ) ) ( ON ?auto_187077 ?auto_187078 ) ( CLEAR ?auto_187075 ) ( ON ?auto_187076 ?auto_187077 ) ( CLEAR ?auto_187076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187070 ?auto_187071 ?auto_187072 ?auto_187073 ?auto_187074 ?auto_187075 ?auto_187076 )
      ( MAKE-9PILE ?auto_187070 ?auto_187071 ?auto_187072 ?auto_187073 ?auto_187074 ?auto_187075 ?auto_187076 ?auto_187077 ?auto_187078 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187108 - BLOCK
      ?auto_187109 - BLOCK
      ?auto_187110 - BLOCK
      ?auto_187111 - BLOCK
      ?auto_187112 - BLOCK
      ?auto_187113 - BLOCK
      ?auto_187114 - BLOCK
      ?auto_187115 - BLOCK
      ?auto_187116 - BLOCK
    )
    :vars
    (
      ?auto_187117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187116 ?auto_187117 ) ( ON-TABLE ?auto_187108 ) ( ON ?auto_187109 ?auto_187108 ) ( ON ?auto_187110 ?auto_187109 ) ( ON ?auto_187111 ?auto_187110 ) ( ON ?auto_187112 ?auto_187111 ) ( not ( = ?auto_187108 ?auto_187109 ) ) ( not ( = ?auto_187108 ?auto_187110 ) ) ( not ( = ?auto_187108 ?auto_187111 ) ) ( not ( = ?auto_187108 ?auto_187112 ) ) ( not ( = ?auto_187108 ?auto_187113 ) ) ( not ( = ?auto_187108 ?auto_187114 ) ) ( not ( = ?auto_187108 ?auto_187115 ) ) ( not ( = ?auto_187108 ?auto_187116 ) ) ( not ( = ?auto_187108 ?auto_187117 ) ) ( not ( = ?auto_187109 ?auto_187110 ) ) ( not ( = ?auto_187109 ?auto_187111 ) ) ( not ( = ?auto_187109 ?auto_187112 ) ) ( not ( = ?auto_187109 ?auto_187113 ) ) ( not ( = ?auto_187109 ?auto_187114 ) ) ( not ( = ?auto_187109 ?auto_187115 ) ) ( not ( = ?auto_187109 ?auto_187116 ) ) ( not ( = ?auto_187109 ?auto_187117 ) ) ( not ( = ?auto_187110 ?auto_187111 ) ) ( not ( = ?auto_187110 ?auto_187112 ) ) ( not ( = ?auto_187110 ?auto_187113 ) ) ( not ( = ?auto_187110 ?auto_187114 ) ) ( not ( = ?auto_187110 ?auto_187115 ) ) ( not ( = ?auto_187110 ?auto_187116 ) ) ( not ( = ?auto_187110 ?auto_187117 ) ) ( not ( = ?auto_187111 ?auto_187112 ) ) ( not ( = ?auto_187111 ?auto_187113 ) ) ( not ( = ?auto_187111 ?auto_187114 ) ) ( not ( = ?auto_187111 ?auto_187115 ) ) ( not ( = ?auto_187111 ?auto_187116 ) ) ( not ( = ?auto_187111 ?auto_187117 ) ) ( not ( = ?auto_187112 ?auto_187113 ) ) ( not ( = ?auto_187112 ?auto_187114 ) ) ( not ( = ?auto_187112 ?auto_187115 ) ) ( not ( = ?auto_187112 ?auto_187116 ) ) ( not ( = ?auto_187112 ?auto_187117 ) ) ( not ( = ?auto_187113 ?auto_187114 ) ) ( not ( = ?auto_187113 ?auto_187115 ) ) ( not ( = ?auto_187113 ?auto_187116 ) ) ( not ( = ?auto_187113 ?auto_187117 ) ) ( not ( = ?auto_187114 ?auto_187115 ) ) ( not ( = ?auto_187114 ?auto_187116 ) ) ( not ( = ?auto_187114 ?auto_187117 ) ) ( not ( = ?auto_187115 ?auto_187116 ) ) ( not ( = ?auto_187115 ?auto_187117 ) ) ( not ( = ?auto_187116 ?auto_187117 ) ) ( ON ?auto_187115 ?auto_187116 ) ( ON ?auto_187114 ?auto_187115 ) ( CLEAR ?auto_187112 ) ( ON ?auto_187113 ?auto_187114 ) ( CLEAR ?auto_187113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187108 ?auto_187109 ?auto_187110 ?auto_187111 ?auto_187112 ?auto_187113 )
      ( MAKE-9PILE ?auto_187108 ?auto_187109 ?auto_187110 ?auto_187111 ?auto_187112 ?auto_187113 ?auto_187114 ?auto_187115 ?auto_187116 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187146 - BLOCK
      ?auto_187147 - BLOCK
      ?auto_187148 - BLOCK
      ?auto_187149 - BLOCK
      ?auto_187150 - BLOCK
      ?auto_187151 - BLOCK
      ?auto_187152 - BLOCK
      ?auto_187153 - BLOCK
      ?auto_187154 - BLOCK
    )
    :vars
    (
      ?auto_187155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187154 ?auto_187155 ) ( ON-TABLE ?auto_187146 ) ( ON ?auto_187147 ?auto_187146 ) ( ON ?auto_187148 ?auto_187147 ) ( ON ?auto_187149 ?auto_187148 ) ( not ( = ?auto_187146 ?auto_187147 ) ) ( not ( = ?auto_187146 ?auto_187148 ) ) ( not ( = ?auto_187146 ?auto_187149 ) ) ( not ( = ?auto_187146 ?auto_187150 ) ) ( not ( = ?auto_187146 ?auto_187151 ) ) ( not ( = ?auto_187146 ?auto_187152 ) ) ( not ( = ?auto_187146 ?auto_187153 ) ) ( not ( = ?auto_187146 ?auto_187154 ) ) ( not ( = ?auto_187146 ?auto_187155 ) ) ( not ( = ?auto_187147 ?auto_187148 ) ) ( not ( = ?auto_187147 ?auto_187149 ) ) ( not ( = ?auto_187147 ?auto_187150 ) ) ( not ( = ?auto_187147 ?auto_187151 ) ) ( not ( = ?auto_187147 ?auto_187152 ) ) ( not ( = ?auto_187147 ?auto_187153 ) ) ( not ( = ?auto_187147 ?auto_187154 ) ) ( not ( = ?auto_187147 ?auto_187155 ) ) ( not ( = ?auto_187148 ?auto_187149 ) ) ( not ( = ?auto_187148 ?auto_187150 ) ) ( not ( = ?auto_187148 ?auto_187151 ) ) ( not ( = ?auto_187148 ?auto_187152 ) ) ( not ( = ?auto_187148 ?auto_187153 ) ) ( not ( = ?auto_187148 ?auto_187154 ) ) ( not ( = ?auto_187148 ?auto_187155 ) ) ( not ( = ?auto_187149 ?auto_187150 ) ) ( not ( = ?auto_187149 ?auto_187151 ) ) ( not ( = ?auto_187149 ?auto_187152 ) ) ( not ( = ?auto_187149 ?auto_187153 ) ) ( not ( = ?auto_187149 ?auto_187154 ) ) ( not ( = ?auto_187149 ?auto_187155 ) ) ( not ( = ?auto_187150 ?auto_187151 ) ) ( not ( = ?auto_187150 ?auto_187152 ) ) ( not ( = ?auto_187150 ?auto_187153 ) ) ( not ( = ?auto_187150 ?auto_187154 ) ) ( not ( = ?auto_187150 ?auto_187155 ) ) ( not ( = ?auto_187151 ?auto_187152 ) ) ( not ( = ?auto_187151 ?auto_187153 ) ) ( not ( = ?auto_187151 ?auto_187154 ) ) ( not ( = ?auto_187151 ?auto_187155 ) ) ( not ( = ?auto_187152 ?auto_187153 ) ) ( not ( = ?auto_187152 ?auto_187154 ) ) ( not ( = ?auto_187152 ?auto_187155 ) ) ( not ( = ?auto_187153 ?auto_187154 ) ) ( not ( = ?auto_187153 ?auto_187155 ) ) ( not ( = ?auto_187154 ?auto_187155 ) ) ( ON ?auto_187153 ?auto_187154 ) ( ON ?auto_187152 ?auto_187153 ) ( ON ?auto_187151 ?auto_187152 ) ( CLEAR ?auto_187149 ) ( ON ?auto_187150 ?auto_187151 ) ( CLEAR ?auto_187150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187146 ?auto_187147 ?auto_187148 ?auto_187149 ?auto_187150 )
      ( MAKE-9PILE ?auto_187146 ?auto_187147 ?auto_187148 ?auto_187149 ?auto_187150 ?auto_187151 ?auto_187152 ?auto_187153 ?auto_187154 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187184 - BLOCK
      ?auto_187185 - BLOCK
      ?auto_187186 - BLOCK
      ?auto_187187 - BLOCK
      ?auto_187188 - BLOCK
      ?auto_187189 - BLOCK
      ?auto_187190 - BLOCK
      ?auto_187191 - BLOCK
      ?auto_187192 - BLOCK
    )
    :vars
    (
      ?auto_187193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187192 ?auto_187193 ) ( ON-TABLE ?auto_187184 ) ( ON ?auto_187185 ?auto_187184 ) ( ON ?auto_187186 ?auto_187185 ) ( not ( = ?auto_187184 ?auto_187185 ) ) ( not ( = ?auto_187184 ?auto_187186 ) ) ( not ( = ?auto_187184 ?auto_187187 ) ) ( not ( = ?auto_187184 ?auto_187188 ) ) ( not ( = ?auto_187184 ?auto_187189 ) ) ( not ( = ?auto_187184 ?auto_187190 ) ) ( not ( = ?auto_187184 ?auto_187191 ) ) ( not ( = ?auto_187184 ?auto_187192 ) ) ( not ( = ?auto_187184 ?auto_187193 ) ) ( not ( = ?auto_187185 ?auto_187186 ) ) ( not ( = ?auto_187185 ?auto_187187 ) ) ( not ( = ?auto_187185 ?auto_187188 ) ) ( not ( = ?auto_187185 ?auto_187189 ) ) ( not ( = ?auto_187185 ?auto_187190 ) ) ( not ( = ?auto_187185 ?auto_187191 ) ) ( not ( = ?auto_187185 ?auto_187192 ) ) ( not ( = ?auto_187185 ?auto_187193 ) ) ( not ( = ?auto_187186 ?auto_187187 ) ) ( not ( = ?auto_187186 ?auto_187188 ) ) ( not ( = ?auto_187186 ?auto_187189 ) ) ( not ( = ?auto_187186 ?auto_187190 ) ) ( not ( = ?auto_187186 ?auto_187191 ) ) ( not ( = ?auto_187186 ?auto_187192 ) ) ( not ( = ?auto_187186 ?auto_187193 ) ) ( not ( = ?auto_187187 ?auto_187188 ) ) ( not ( = ?auto_187187 ?auto_187189 ) ) ( not ( = ?auto_187187 ?auto_187190 ) ) ( not ( = ?auto_187187 ?auto_187191 ) ) ( not ( = ?auto_187187 ?auto_187192 ) ) ( not ( = ?auto_187187 ?auto_187193 ) ) ( not ( = ?auto_187188 ?auto_187189 ) ) ( not ( = ?auto_187188 ?auto_187190 ) ) ( not ( = ?auto_187188 ?auto_187191 ) ) ( not ( = ?auto_187188 ?auto_187192 ) ) ( not ( = ?auto_187188 ?auto_187193 ) ) ( not ( = ?auto_187189 ?auto_187190 ) ) ( not ( = ?auto_187189 ?auto_187191 ) ) ( not ( = ?auto_187189 ?auto_187192 ) ) ( not ( = ?auto_187189 ?auto_187193 ) ) ( not ( = ?auto_187190 ?auto_187191 ) ) ( not ( = ?auto_187190 ?auto_187192 ) ) ( not ( = ?auto_187190 ?auto_187193 ) ) ( not ( = ?auto_187191 ?auto_187192 ) ) ( not ( = ?auto_187191 ?auto_187193 ) ) ( not ( = ?auto_187192 ?auto_187193 ) ) ( ON ?auto_187191 ?auto_187192 ) ( ON ?auto_187190 ?auto_187191 ) ( ON ?auto_187189 ?auto_187190 ) ( ON ?auto_187188 ?auto_187189 ) ( CLEAR ?auto_187186 ) ( ON ?auto_187187 ?auto_187188 ) ( CLEAR ?auto_187187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187184 ?auto_187185 ?auto_187186 ?auto_187187 )
      ( MAKE-9PILE ?auto_187184 ?auto_187185 ?auto_187186 ?auto_187187 ?auto_187188 ?auto_187189 ?auto_187190 ?auto_187191 ?auto_187192 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187222 - BLOCK
      ?auto_187223 - BLOCK
      ?auto_187224 - BLOCK
      ?auto_187225 - BLOCK
      ?auto_187226 - BLOCK
      ?auto_187227 - BLOCK
      ?auto_187228 - BLOCK
      ?auto_187229 - BLOCK
      ?auto_187230 - BLOCK
    )
    :vars
    (
      ?auto_187231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187230 ?auto_187231 ) ( ON-TABLE ?auto_187222 ) ( ON ?auto_187223 ?auto_187222 ) ( not ( = ?auto_187222 ?auto_187223 ) ) ( not ( = ?auto_187222 ?auto_187224 ) ) ( not ( = ?auto_187222 ?auto_187225 ) ) ( not ( = ?auto_187222 ?auto_187226 ) ) ( not ( = ?auto_187222 ?auto_187227 ) ) ( not ( = ?auto_187222 ?auto_187228 ) ) ( not ( = ?auto_187222 ?auto_187229 ) ) ( not ( = ?auto_187222 ?auto_187230 ) ) ( not ( = ?auto_187222 ?auto_187231 ) ) ( not ( = ?auto_187223 ?auto_187224 ) ) ( not ( = ?auto_187223 ?auto_187225 ) ) ( not ( = ?auto_187223 ?auto_187226 ) ) ( not ( = ?auto_187223 ?auto_187227 ) ) ( not ( = ?auto_187223 ?auto_187228 ) ) ( not ( = ?auto_187223 ?auto_187229 ) ) ( not ( = ?auto_187223 ?auto_187230 ) ) ( not ( = ?auto_187223 ?auto_187231 ) ) ( not ( = ?auto_187224 ?auto_187225 ) ) ( not ( = ?auto_187224 ?auto_187226 ) ) ( not ( = ?auto_187224 ?auto_187227 ) ) ( not ( = ?auto_187224 ?auto_187228 ) ) ( not ( = ?auto_187224 ?auto_187229 ) ) ( not ( = ?auto_187224 ?auto_187230 ) ) ( not ( = ?auto_187224 ?auto_187231 ) ) ( not ( = ?auto_187225 ?auto_187226 ) ) ( not ( = ?auto_187225 ?auto_187227 ) ) ( not ( = ?auto_187225 ?auto_187228 ) ) ( not ( = ?auto_187225 ?auto_187229 ) ) ( not ( = ?auto_187225 ?auto_187230 ) ) ( not ( = ?auto_187225 ?auto_187231 ) ) ( not ( = ?auto_187226 ?auto_187227 ) ) ( not ( = ?auto_187226 ?auto_187228 ) ) ( not ( = ?auto_187226 ?auto_187229 ) ) ( not ( = ?auto_187226 ?auto_187230 ) ) ( not ( = ?auto_187226 ?auto_187231 ) ) ( not ( = ?auto_187227 ?auto_187228 ) ) ( not ( = ?auto_187227 ?auto_187229 ) ) ( not ( = ?auto_187227 ?auto_187230 ) ) ( not ( = ?auto_187227 ?auto_187231 ) ) ( not ( = ?auto_187228 ?auto_187229 ) ) ( not ( = ?auto_187228 ?auto_187230 ) ) ( not ( = ?auto_187228 ?auto_187231 ) ) ( not ( = ?auto_187229 ?auto_187230 ) ) ( not ( = ?auto_187229 ?auto_187231 ) ) ( not ( = ?auto_187230 ?auto_187231 ) ) ( ON ?auto_187229 ?auto_187230 ) ( ON ?auto_187228 ?auto_187229 ) ( ON ?auto_187227 ?auto_187228 ) ( ON ?auto_187226 ?auto_187227 ) ( ON ?auto_187225 ?auto_187226 ) ( CLEAR ?auto_187223 ) ( ON ?auto_187224 ?auto_187225 ) ( CLEAR ?auto_187224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187222 ?auto_187223 ?auto_187224 )
      ( MAKE-9PILE ?auto_187222 ?auto_187223 ?auto_187224 ?auto_187225 ?auto_187226 ?auto_187227 ?auto_187228 ?auto_187229 ?auto_187230 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187260 - BLOCK
      ?auto_187261 - BLOCK
      ?auto_187262 - BLOCK
      ?auto_187263 - BLOCK
      ?auto_187264 - BLOCK
      ?auto_187265 - BLOCK
      ?auto_187266 - BLOCK
      ?auto_187267 - BLOCK
      ?auto_187268 - BLOCK
    )
    :vars
    (
      ?auto_187269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187268 ?auto_187269 ) ( ON-TABLE ?auto_187260 ) ( not ( = ?auto_187260 ?auto_187261 ) ) ( not ( = ?auto_187260 ?auto_187262 ) ) ( not ( = ?auto_187260 ?auto_187263 ) ) ( not ( = ?auto_187260 ?auto_187264 ) ) ( not ( = ?auto_187260 ?auto_187265 ) ) ( not ( = ?auto_187260 ?auto_187266 ) ) ( not ( = ?auto_187260 ?auto_187267 ) ) ( not ( = ?auto_187260 ?auto_187268 ) ) ( not ( = ?auto_187260 ?auto_187269 ) ) ( not ( = ?auto_187261 ?auto_187262 ) ) ( not ( = ?auto_187261 ?auto_187263 ) ) ( not ( = ?auto_187261 ?auto_187264 ) ) ( not ( = ?auto_187261 ?auto_187265 ) ) ( not ( = ?auto_187261 ?auto_187266 ) ) ( not ( = ?auto_187261 ?auto_187267 ) ) ( not ( = ?auto_187261 ?auto_187268 ) ) ( not ( = ?auto_187261 ?auto_187269 ) ) ( not ( = ?auto_187262 ?auto_187263 ) ) ( not ( = ?auto_187262 ?auto_187264 ) ) ( not ( = ?auto_187262 ?auto_187265 ) ) ( not ( = ?auto_187262 ?auto_187266 ) ) ( not ( = ?auto_187262 ?auto_187267 ) ) ( not ( = ?auto_187262 ?auto_187268 ) ) ( not ( = ?auto_187262 ?auto_187269 ) ) ( not ( = ?auto_187263 ?auto_187264 ) ) ( not ( = ?auto_187263 ?auto_187265 ) ) ( not ( = ?auto_187263 ?auto_187266 ) ) ( not ( = ?auto_187263 ?auto_187267 ) ) ( not ( = ?auto_187263 ?auto_187268 ) ) ( not ( = ?auto_187263 ?auto_187269 ) ) ( not ( = ?auto_187264 ?auto_187265 ) ) ( not ( = ?auto_187264 ?auto_187266 ) ) ( not ( = ?auto_187264 ?auto_187267 ) ) ( not ( = ?auto_187264 ?auto_187268 ) ) ( not ( = ?auto_187264 ?auto_187269 ) ) ( not ( = ?auto_187265 ?auto_187266 ) ) ( not ( = ?auto_187265 ?auto_187267 ) ) ( not ( = ?auto_187265 ?auto_187268 ) ) ( not ( = ?auto_187265 ?auto_187269 ) ) ( not ( = ?auto_187266 ?auto_187267 ) ) ( not ( = ?auto_187266 ?auto_187268 ) ) ( not ( = ?auto_187266 ?auto_187269 ) ) ( not ( = ?auto_187267 ?auto_187268 ) ) ( not ( = ?auto_187267 ?auto_187269 ) ) ( not ( = ?auto_187268 ?auto_187269 ) ) ( ON ?auto_187267 ?auto_187268 ) ( ON ?auto_187266 ?auto_187267 ) ( ON ?auto_187265 ?auto_187266 ) ( ON ?auto_187264 ?auto_187265 ) ( ON ?auto_187263 ?auto_187264 ) ( ON ?auto_187262 ?auto_187263 ) ( CLEAR ?auto_187260 ) ( ON ?auto_187261 ?auto_187262 ) ( CLEAR ?auto_187261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187260 ?auto_187261 )
      ( MAKE-9PILE ?auto_187260 ?auto_187261 ?auto_187262 ?auto_187263 ?auto_187264 ?auto_187265 ?auto_187266 ?auto_187267 ?auto_187268 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_187298 - BLOCK
      ?auto_187299 - BLOCK
      ?auto_187300 - BLOCK
      ?auto_187301 - BLOCK
      ?auto_187302 - BLOCK
      ?auto_187303 - BLOCK
      ?auto_187304 - BLOCK
      ?auto_187305 - BLOCK
      ?auto_187306 - BLOCK
    )
    :vars
    (
      ?auto_187307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187306 ?auto_187307 ) ( not ( = ?auto_187298 ?auto_187299 ) ) ( not ( = ?auto_187298 ?auto_187300 ) ) ( not ( = ?auto_187298 ?auto_187301 ) ) ( not ( = ?auto_187298 ?auto_187302 ) ) ( not ( = ?auto_187298 ?auto_187303 ) ) ( not ( = ?auto_187298 ?auto_187304 ) ) ( not ( = ?auto_187298 ?auto_187305 ) ) ( not ( = ?auto_187298 ?auto_187306 ) ) ( not ( = ?auto_187298 ?auto_187307 ) ) ( not ( = ?auto_187299 ?auto_187300 ) ) ( not ( = ?auto_187299 ?auto_187301 ) ) ( not ( = ?auto_187299 ?auto_187302 ) ) ( not ( = ?auto_187299 ?auto_187303 ) ) ( not ( = ?auto_187299 ?auto_187304 ) ) ( not ( = ?auto_187299 ?auto_187305 ) ) ( not ( = ?auto_187299 ?auto_187306 ) ) ( not ( = ?auto_187299 ?auto_187307 ) ) ( not ( = ?auto_187300 ?auto_187301 ) ) ( not ( = ?auto_187300 ?auto_187302 ) ) ( not ( = ?auto_187300 ?auto_187303 ) ) ( not ( = ?auto_187300 ?auto_187304 ) ) ( not ( = ?auto_187300 ?auto_187305 ) ) ( not ( = ?auto_187300 ?auto_187306 ) ) ( not ( = ?auto_187300 ?auto_187307 ) ) ( not ( = ?auto_187301 ?auto_187302 ) ) ( not ( = ?auto_187301 ?auto_187303 ) ) ( not ( = ?auto_187301 ?auto_187304 ) ) ( not ( = ?auto_187301 ?auto_187305 ) ) ( not ( = ?auto_187301 ?auto_187306 ) ) ( not ( = ?auto_187301 ?auto_187307 ) ) ( not ( = ?auto_187302 ?auto_187303 ) ) ( not ( = ?auto_187302 ?auto_187304 ) ) ( not ( = ?auto_187302 ?auto_187305 ) ) ( not ( = ?auto_187302 ?auto_187306 ) ) ( not ( = ?auto_187302 ?auto_187307 ) ) ( not ( = ?auto_187303 ?auto_187304 ) ) ( not ( = ?auto_187303 ?auto_187305 ) ) ( not ( = ?auto_187303 ?auto_187306 ) ) ( not ( = ?auto_187303 ?auto_187307 ) ) ( not ( = ?auto_187304 ?auto_187305 ) ) ( not ( = ?auto_187304 ?auto_187306 ) ) ( not ( = ?auto_187304 ?auto_187307 ) ) ( not ( = ?auto_187305 ?auto_187306 ) ) ( not ( = ?auto_187305 ?auto_187307 ) ) ( not ( = ?auto_187306 ?auto_187307 ) ) ( ON ?auto_187305 ?auto_187306 ) ( ON ?auto_187304 ?auto_187305 ) ( ON ?auto_187303 ?auto_187304 ) ( ON ?auto_187302 ?auto_187303 ) ( ON ?auto_187301 ?auto_187302 ) ( ON ?auto_187300 ?auto_187301 ) ( ON ?auto_187299 ?auto_187300 ) ( ON ?auto_187298 ?auto_187299 ) ( CLEAR ?auto_187298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187298 )
      ( MAKE-9PILE ?auto_187298 ?auto_187299 ?auto_187300 ?auto_187301 ?auto_187302 ?auto_187303 ?auto_187304 ?auto_187305 ?auto_187306 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187337 - BLOCK
      ?auto_187338 - BLOCK
      ?auto_187339 - BLOCK
      ?auto_187340 - BLOCK
      ?auto_187341 - BLOCK
      ?auto_187342 - BLOCK
      ?auto_187343 - BLOCK
      ?auto_187344 - BLOCK
      ?auto_187345 - BLOCK
      ?auto_187346 - BLOCK
    )
    :vars
    (
      ?auto_187347 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187345 ) ( ON ?auto_187346 ?auto_187347 ) ( CLEAR ?auto_187346 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187337 ) ( ON ?auto_187338 ?auto_187337 ) ( ON ?auto_187339 ?auto_187338 ) ( ON ?auto_187340 ?auto_187339 ) ( ON ?auto_187341 ?auto_187340 ) ( ON ?auto_187342 ?auto_187341 ) ( ON ?auto_187343 ?auto_187342 ) ( ON ?auto_187344 ?auto_187343 ) ( ON ?auto_187345 ?auto_187344 ) ( not ( = ?auto_187337 ?auto_187338 ) ) ( not ( = ?auto_187337 ?auto_187339 ) ) ( not ( = ?auto_187337 ?auto_187340 ) ) ( not ( = ?auto_187337 ?auto_187341 ) ) ( not ( = ?auto_187337 ?auto_187342 ) ) ( not ( = ?auto_187337 ?auto_187343 ) ) ( not ( = ?auto_187337 ?auto_187344 ) ) ( not ( = ?auto_187337 ?auto_187345 ) ) ( not ( = ?auto_187337 ?auto_187346 ) ) ( not ( = ?auto_187337 ?auto_187347 ) ) ( not ( = ?auto_187338 ?auto_187339 ) ) ( not ( = ?auto_187338 ?auto_187340 ) ) ( not ( = ?auto_187338 ?auto_187341 ) ) ( not ( = ?auto_187338 ?auto_187342 ) ) ( not ( = ?auto_187338 ?auto_187343 ) ) ( not ( = ?auto_187338 ?auto_187344 ) ) ( not ( = ?auto_187338 ?auto_187345 ) ) ( not ( = ?auto_187338 ?auto_187346 ) ) ( not ( = ?auto_187338 ?auto_187347 ) ) ( not ( = ?auto_187339 ?auto_187340 ) ) ( not ( = ?auto_187339 ?auto_187341 ) ) ( not ( = ?auto_187339 ?auto_187342 ) ) ( not ( = ?auto_187339 ?auto_187343 ) ) ( not ( = ?auto_187339 ?auto_187344 ) ) ( not ( = ?auto_187339 ?auto_187345 ) ) ( not ( = ?auto_187339 ?auto_187346 ) ) ( not ( = ?auto_187339 ?auto_187347 ) ) ( not ( = ?auto_187340 ?auto_187341 ) ) ( not ( = ?auto_187340 ?auto_187342 ) ) ( not ( = ?auto_187340 ?auto_187343 ) ) ( not ( = ?auto_187340 ?auto_187344 ) ) ( not ( = ?auto_187340 ?auto_187345 ) ) ( not ( = ?auto_187340 ?auto_187346 ) ) ( not ( = ?auto_187340 ?auto_187347 ) ) ( not ( = ?auto_187341 ?auto_187342 ) ) ( not ( = ?auto_187341 ?auto_187343 ) ) ( not ( = ?auto_187341 ?auto_187344 ) ) ( not ( = ?auto_187341 ?auto_187345 ) ) ( not ( = ?auto_187341 ?auto_187346 ) ) ( not ( = ?auto_187341 ?auto_187347 ) ) ( not ( = ?auto_187342 ?auto_187343 ) ) ( not ( = ?auto_187342 ?auto_187344 ) ) ( not ( = ?auto_187342 ?auto_187345 ) ) ( not ( = ?auto_187342 ?auto_187346 ) ) ( not ( = ?auto_187342 ?auto_187347 ) ) ( not ( = ?auto_187343 ?auto_187344 ) ) ( not ( = ?auto_187343 ?auto_187345 ) ) ( not ( = ?auto_187343 ?auto_187346 ) ) ( not ( = ?auto_187343 ?auto_187347 ) ) ( not ( = ?auto_187344 ?auto_187345 ) ) ( not ( = ?auto_187344 ?auto_187346 ) ) ( not ( = ?auto_187344 ?auto_187347 ) ) ( not ( = ?auto_187345 ?auto_187346 ) ) ( not ( = ?auto_187345 ?auto_187347 ) ) ( not ( = ?auto_187346 ?auto_187347 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187346 ?auto_187347 )
      ( !STACK ?auto_187346 ?auto_187345 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187379 - BLOCK
      ?auto_187380 - BLOCK
      ?auto_187381 - BLOCK
      ?auto_187382 - BLOCK
      ?auto_187383 - BLOCK
      ?auto_187384 - BLOCK
      ?auto_187385 - BLOCK
      ?auto_187386 - BLOCK
      ?auto_187387 - BLOCK
      ?auto_187388 - BLOCK
    )
    :vars
    (
      ?auto_187389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187388 ?auto_187389 ) ( ON-TABLE ?auto_187379 ) ( ON ?auto_187380 ?auto_187379 ) ( ON ?auto_187381 ?auto_187380 ) ( ON ?auto_187382 ?auto_187381 ) ( ON ?auto_187383 ?auto_187382 ) ( ON ?auto_187384 ?auto_187383 ) ( ON ?auto_187385 ?auto_187384 ) ( ON ?auto_187386 ?auto_187385 ) ( not ( = ?auto_187379 ?auto_187380 ) ) ( not ( = ?auto_187379 ?auto_187381 ) ) ( not ( = ?auto_187379 ?auto_187382 ) ) ( not ( = ?auto_187379 ?auto_187383 ) ) ( not ( = ?auto_187379 ?auto_187384 ) ) ( not ( = ?auto_187379 ?auto_187385 ) ) ( not ( = ?auto_187379 ?auto_187386 ) ) ( not ( = ?auto_187379 ?auto_187387 ) ) ( not ( = ?auto_187379 ?auto_187388 ) ) ( not ( = ?auto_187379 ?auto_187389 ) ) ( not ( = ?auto_187380 ?auto_187381 ) ) ( not ( = ?auto_187380 ?auto_187382 ) ) ( not ( = ?auto_187380 ?auto_187383 ) ) ( not ( = ?auto_187380 ?auto_187384 ) ) ( not ( = ?auto_187380 ?auto_187385 ) ) ( not ( = ?auto_187380 ?auto_187386 ) ) ( not ( = ?auto_187380 ?auto_187387 ) ) ( not ( = ?auto_187380 ?auto_187388 ) ) ( not ( = ?auto_187380 ?auto_187389 ) ) ( not ( = ?auto_187381 ?auto_187382 ) ) ( not ( = ?auto_187381 ?auto_187383 ) ) ( not ( = ?auto_187381 ?auto_187384 ) ) ( not ( = ?auto_187381 ?auto_187385 ) ) ( not ( = ?auto_187381 ?auto_187386 ) ) ( not ( = ?auto_187381 ?auto_187387 ) ) ( not ( = ?auto_187381 ?auto_187388 ) ) ( not ( = ?auto_187381 ?auto_187389 ) ) ( not ( = ?auto_187382 ?auto_187383 ) ) ( not ( = ?auto_187382 ?auto_187384 ) ) ( not ( = ?auto_187382 ?auto_187385 ) ) ( not ( = ?auto_187382 ?auto_187386 ) ) ( not ( = ?auto_187382 ?auto_187387 ) ) ( not ( = ?auto_187382 ?auto_187388 ) ) ( not ( = ?auto_187382 ?auto_187389 ) ) ( not ( = ?auto_187383 ?auto_187384 ) ) ( not ( = ?auto_187383 ?auto_187385 ) ) ( not ( = ?auto_187383 ?auto_187386 ) ) ( not ( = ?auto_187383 ?auto_187387 ) ) ( not ( = ?auto_187383 ?auto_187388 ) ) ( not ( = ?auto_187383 ?auto_187389 ) ) ( not ( = ?auto_187384 ?auto_187385 ) ) ( not ( = ?auto_187384 ?auto_187386 ) ) ( not ( = ?auto_187384 ?auto_187387 ) ) ( not ( = ?auto_187384 ?auto_187388 ) ) ( not ( = ?auto_187384 ?auto_187389 ) ) ( not ( = ?auto_187385 ?auto_187386 ) ) ( not ( = ?auto_187385 ?auto_187387 ) ) ( not ( = ?auto_187385 ?auto_187388 ) ) ( not ( = ?auto_187385 ?auto_187389 ) ) ( not ( = ?auto_187386 ?auto_187387 ) ) ( not ( = ?auto_187386 ?auto_187388 ) ) ( not ( = ?auto_187386 ?auto_187389 ) ) ( not ( = ?auto_187387 ?auto_187388 ) ) ( not ( = ?auto_187387 ?auto_187389 ) ) ( not ( = ?auto_187388 ?auto_187389 ) ) ( CLEAR ?auto_187386 ) ( ON ?auto_187387 ?auto_187388 ) ( CLEAR ?auto_187387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_187379 ?auto_187380 ?auto_187381 ?auto_187382 ?auto_187383 ?auto_187384 ?auto_187385 ?auto_187386 ?auto_187387 )
      ( MAKE-10PILE ?auto_187379 ?auto_187380 ?auto_187381 ?auto_187382 ?auto_187383 ?auto_187384 ?auto_187385 ?auto_187386 ?auto_187387 ?auto_187388 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187421 - BLOCK
      ?auto_187422 - BLOCK
      ?auto_187423 - BLOCK
      ?auto_187424 - BLOCK
      ?auto_187425 - BLOCK
      ?auto_187426 - BLOCK
      ?auto_187427 - BLOCK
      ?auto_187428 - BLOCK
      ?auto_187429 - BLOCK
      ?auto_187430 - BLOCK
    )
    :vars
    (
      ?auto_187431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187430 ?auto_187431 ) ( ON-TABLE ?auto_187421 ) ( ON ?auto_187422 ?auto_187421 ) ( ON ?auto_187423 ?auto_187422 ) ( ON ?auto_187424 ?auto_187423 ) ( ON ?auto_187425 ?auto_187424 ) ( ON ?auto_187426 ?auto_187425 ) ( ON ?auto_187427 ?auto_187426 ) ( not ( = ?auto_187421 ?auto_187422 ) ) ( not ( = ?auto_187421 ?auto_187423 ) ) ( not ( = ?auto_187421 ?auto_187424 ) ) ( not ( = ?auto_187421 ?auto_187425 ) ) ( not ( = ?auto_187421 ?auto_187426 ) ) ( not ( = ?auto_187421 ?auto_187427 ) ) ( not ( = ?auto_187421 ?auto_187428 ) ) ( not ( = ?auto_187421 ?auto_187429 ) ) ( not ( = ?auto_187421 ?auto_187430 ) ) ( not ( = ?auto_187421 ?auto_187431 ) ) ( not ( = ?auto_187422 ?auto_187423 ) ) ( not ( = ?auto_187422 ?auto_187424 ) ) ( not ( = ?auto_187422 ?auto_187425 ) ) ( not ( = ?auto_187422 ?auto_187426 ) ) ( not ( = ?auto_187422 ?auto_187427 ) ) ( not ( = ?auto_187422 ?auto_187428 ) ) ( not ( = ?auto_187422 ?auto_187429 ) ) ( not ( = ?auto_187422 ?auto_187430 ) ) ( not ( = ?auto_187422 ?auto_187431 ) ) ( not ( = ?auto_187423 ?auto_187424 ) ) ( not ( = ?auto_187423 ?auto_187425 ) ) ( not ( = ?auto_187423 ?auto_187426 ) ) ( not ( = ?auto_187423 ?auto_187427 ) ) ( not ( = ?auto_187423 ?auto_187428 ) ) ( not ( = ?auto_187423 ?auto_187429 ) ) ( not ( = ?auto_187423 ?auto_187430 ) ) ( not ( = ?auto_187423 ?auto_187431 ) ) ( not ( = ?auto_187424 ?auto_187425 ) ) ( not ( = ?auto_187424 ?auto_187426 ) ) ( not ( = ?auto_187424 ?auto_187427 ) ) ( not ( = ?auto_187424 ?auto_187428 ) ) ( not ( = ?auto_187424 ?auto_187429 ) ) ( not ( = ?auto_187424 ?auto_187430 ) ) ( not ( = ?auto_187424 ?auto_187431 ) ) ( not ( = ?auto_187425 ?auto_187426 ) ) ( not ( = ?auto_187425 ?auto_187427 ) ) ( not ( = ?auto_187425 ?auto_187428 ) ) ( not ( = ?auto_187425 ?auto_187429 ) ) ( not ( = ?auto_187425 ?auto_187430 ) ) ( not ( = ?auto_187425 ?auto_187431 ) ) ( not ( = ?auto_187426 ?auto_187427 ) ) ( not ( = ?auto_187426 ?auto_187428 ) ) ( not ( = ?auto_187426 ?auto_187429 ) ) ( not ( = ?auto_187426 ?auto_187430 ) ) ( not ( = ?auto_187426 ?auto_187431 ) ) ( not ( = ?auto_187427 ?auto_187428 ) ) ( not ( = ?auto_187427 ?auto_187429 ) ) ( not ( = ?auto_187427 ?auto_187430 ) ) ( not ( = ?auto_187427 ?auto_187431 ) ) ( not ( = ?auto_187428 ?auto_187429 ) ) ( not ( = ?auto_187428 ?auto_187430 ) ) ( not ( = ?auto_187428 ?auto_187431 ) ) ( not ( = ?auto_187429 ?auto_187430 ) ) ( not ( = ?auto_187429 ?auto_187431 ) ) ( not ( = ?auto_187430 ?auto_187431 ) ) ( ON ?auto_187429 ?auto_187430 ) ( CLEAR ?auto_187427 ) ( ON ?auto_187428 ?auto_187429 ) ( CLEAR ?auto_187428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187421 ?auto_187422 ?auto_187423 ?auto_187424 ?auto_187425 ?auto_187426 ?auto_187427 ?auto_187428 )
      ( MAKE-10PILE ?auto_187421 ?auto_187422 ?auto_187423 ?auto_187424 ?auto_187425 ?auto_187426 ?auto_187427 ?auto_187428 ?auto_187429 ?auto_187430 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187463 - BLOCK
      ?auto_187464 - BLOCK
      ?auto_187465 - BLOCK
      ?auto_187466 - BLOCK
      ?auto_187467 - BLOCK
      ?auto_187468 - BLOCK
      ?auto_187469 - BLOCK
      ?auto_187470 - BLOCK
      ?auto_187471 - BLOCK
      ?auto_187472 - BLOCK
    )
    :vars
    (
      ?auto_187473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187472 ?auto_187473 ) ( ON-TABLE ?auto_187463 ) ( ON ?auto_187464 ?auto_187463 ) ( ON ?auto_187465 ?auto_187464 ) ( ON ?auto_187466 ?auto_187465 ) ( ON ?auto_187467 ?auto_187466 ) ( ON ?auto_187468 ?auto_187467 ) ( not ( = ?auto_187463 ?auto_187464 ) ) ( not ( = ?auto_187463 ?auto_187465 ) ) ( not ( = ?auto_187463 ?auto_187466 ) ) ( not ( = ?auto_187463 ?auto_187467 ) ) ( not ( = ?auto_187463 ?auto_187468 ) ) ( not ( = ?auto_187463 ?auto_187469 ) ) ( not ( = ?auto_187463 ?auto_187470 ) ) ( not ( = ?auto_187463 ?auto_187471 ) ) ( not ( = ?auto_187463 ?auto_187472 ) ) ( not ( = ?auto_187463 ?auto_187473 ) ) ( not ( = ?auto_187464 ?auto_187465 ) ) ( not ( = ?auto_187464 ?auto_187466 ) ) ( not ( = ?auto_187464 ?auto_187467 ) ) ( not ( = ?auto_187464 ?auto_187468 ) ) ( not ( = ?auto_187464 ?auto_187469 ) ) ( not ( = ?auto_187464 ?auto_187470 ) ) ( not ( = ?auto_187464 ?auto_187471 ) ) ( not ( = ?auto_187464 ?auto_187472 ) ) ( not ( = ?auto_187464 ?auto_187473 ) ) ( not ( = ?auto_187465 ?auto_187466 ) ) ( not ( = ?auto_187465 ?auto_187467 ) ) ( not ( = ?auto_187465 ?auto_187468 ) ) ( not ( = ?auto_187465 ?auto_187469 ) ) ( not ( = ?auto_187465 ?auto_187470 ) ) ( not ( = ?auto_187465 ?auto_187471 ) ) ( not ( = ?auto_187465 ?auto_187472 ) ) ( not ( = ?auto_187465 ?auto_187473 ) ) ( not ( = ?auto_187466 ?auto_187467 ) ) ( not ( = ?auto_187466 ?auto_187468 ) ) ( not ( = ?auto_187466 ?auto_187469 ) ) ( not ( = ?auto_187466 ?auto_187470 ) ) ( not ( = ?auto_187466 ?auto_187471 ) ) ( not ( = ?auto_187466 ?auto_187472 ) ) ( not ( = ?auto_187466 ?auto_187473 ) ) ( not ( = ?auto_187467 ?auto_187468 ) ) ( not ( = ?auto_187467 ?auto_187469 ) ) ( not ( = ?auto_187467 ?auto_187470 ) ) ( not ( = ?auto_187467 ?auto_187471 ) ) ( not ( = ?auto_187467 ?auto_187472 ) ) ( not ( = ?auto_187467 ?auto_187473 ) ) ( not ( = ?auto_187468 ?auto_187469 ) ) ( not ( = ?auto_187468 ?auto_187470 ) ) ( not ( = ?auto_187468 ?auto_187471 ) ) ( not ( = ?auto_187468 ?auto_187472 ) ) ( not ( = ?auto_187468 ?auto_187473 ) ) ( not ( = ?auto_187469 ?auto_187470 ) ) ( not ( = ?auto_187469 ?auto_187471 ) ) ( not ( = ?auto_187469 ?auto_187472 ) ) ( not ( = ?auto_187469 ?auto_187473 ) ) ( not ( = ?auto_187470 ?auto_187471 ) ) ( not ( = ?auto_187470 ?auto_187472 ) ) ( not ( = ?auto_187470 ?auto_187473 ) ) ( not ( = ?auto_187471 ?auto_187472 ) ) ( not ( = ?auto_187471 ?auto_187473 ) ) ( not ( = ?auto_187472 ?auto_187473 ) ) ( ON ?auto_187471 ?auto_187472 ) ( ON ?auto_187470 ?auto_187471 ) ( CLEAR ?auto_187468 ) ( ON ?auto_187469 ?auto_187470 ) ( CLEAR ?auto_187469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187463 ?auto_187464 ?auto_187465 ?auto_187466 ?auto_187467 ?auto_187468 ?auto_187469 )
      ( MAKE-10PILE ?auto_187463 ?auto_187464 ?auto_187465 ?auto_187466 ?auto_187467 ?auto_187468 ?auto_187469 ?auto_187470 ?auto_187471 ?auto_187472 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187505 - BLOCK
      ?auto_187506 - BLOCK
      ?auto_187507 - BLOCK
      ?auto_187508 - BLOCK
      ?auto_187509 - BLOCK
      ?auto_187510 - BLOCK
      ?auto_187511 - BLOCK
      ?auto_187512 - BLOCK
      ?auto_187513 - BLOCK
      ?auto_187514 - BLOCK
    )
    :vars
    (
      ?auto_187515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187514 ?auto_187515 ) ( ON-TABLE ?auto_187505 ) ( ON ?auto_187506 ?auto_187505 ) ( ON ?auto_187507 ?auto_187506 ) ( ON ?auto_187508 ?auto_187507 ) ( ON ?auto_187509 ?auto_187508 ) ( not ( = ?auto_187505 ?auto_187506 ) ) ( not ( = ?auto_187505 ?auto_187507 ) ) ( not ( = ?auto_187505 ?auto_187508 ) ) ( not ( = ?auto_187505 ?auto_187509 ) ) ( not ( = ?auto_187505 ?auto_187510 ) ) ( not ( = ?auto_187505 ?auto_187511 ) ) ( not ( = ?auto_187505 ?auto_187512 ) ) ( not ( = ?auto_187505 ?auto_187513 ) ) ( not ( = ?auto_187505 ?auto_187514 ) ) ( not ( = ?auto_187505 ?auto_187515 ) ) ( not ( = ?auto_187506 ?auto_187507 ) ) ( not ( = ?auto_187506 ?auto_187508 ) ) ( not ( = ?auto_187506 ?auto_187509 ) ) ( not ( = ?auto_187506 ?auto_187510 ) ) ( not ( = ?auto_187506 ?auto_187511 ) ) ( not ( = ?auto_187506 ?auto_187512 ) ) ( not ( = ?auto_187506 ?auto_187513 ) ) ( not ( = ?auto_187506 ?auto_187514 ) ) ( not ( = ?auto_187506 ?auto_187515 ) ) ( not ( = ?auto_187507 ?auto_187508 ) ) ( not ( = ?auto_187507 ?auto_187509 ) ) ( not ( = ?auto_187507 ?auto_187510 ) ) ( not ( = ?auto_187507 ?auto_187511 ) ) ( not ( = ?auto_187507 ?auto_187512 ) ) ( not ( = ?auto_187507 ?auto_187513 ) ) ( not ( = ?auto_187507 ?auto_187514 ) ) ( not ( = ?auto_187507 ?auto_187515 ) ) ( not ( = ?auto_187508 ?auto_187509 ) ) ( not ( = ?auto_187508 ?auto_187510 ) ) ( not ( = ?auto_187508 ?auto_187511 ) ) ( not ( = ?auto_187508 ?auto_187512 ) ) ( not ( = ?auto_187508 ?auto_187513 ) ) ( not ( = ?auto_187508 ?auto_187514 ) ) ( not ( = ?auto_187508 ?auto_187515 ) ) ( not ( = ?auto_187509 ?auto_187510 ) ) ( not ( = ?auto_187509 ?auto_187511 ) ) ( not ( = ?auto_187509 ?auto_187512 ) ) ( not ( = ?auto_187509 ?auto_187513 ) ) ( not ( = ?auto_187509 ?auto_187514 ) ) ( not ( = ?auto_187509 ?auto_187515 ) ) ( not ( = ?auto_187510 ?auto_187511 ) ) ( not ( = ?auto_187510 ?auto_187512 ) ) ( not ( = ?auto_187510 ?auto_187513 ) ) ( not ( = ?auto_187510 ?auto_187514 ) ) ( not ( = ?auto_187510 ?auto_187515 ) ) ( not ( = ?auto_187511 ?auto_187512 ) ) ( not ( = ?auto_187511 ?auto_187513 ) ) ( not ( = ?auto_187511 ?auto_187514 ) ) ( not ( = ?auto_187511 ?auto_187515 ) ) ( not ( = ?auto_187512 ?auto_187513 ) ) ( not ( = ?auto_187512 ?auto_187514 ) ) ( not ( = ?auto_187512 ?auto_187515 ) ) ( not ( = ?auto_187513 ?auto_187514 ) ) ( not ( = ?auto_187513 ?auto_187515 ) ) ( not ( = ?auto_187514 ?auto_187515 ) ) ( ON ?auto_187513 ?auto_187514 ) ( ON ?auto_187512 ?auto_187513 ) ( ON ?auto_187511 ?auto_187512 ) ( CLEAR ?auto_187509 ) ( ON ?auto_187510 ?auto_187511 ) ( CLEAR ?auto_187510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187505 ?auto_187506 ?auto_187507 ?auto_187508 ?auto_187509 ?auto_187510 )
      ( MAKE-10PILE ?auto_187505 ?auto_187506 ?auto_187507 ?auto_187508 ?auto_187509 ?auto_187510 ?auto_187511 ?auto_187512 ?auto_187513 ?auto_187514 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187547 - BLOCK
      ?auto_187548 - BLOCK
      ?auto_187549 - BLOCK
      ?auto_187550 - BLOCK
      ?auto_187551 - BLOCK
      ?auto_187552 - BLOCK
      ?auto_187553 - BLOCK
      ?auto_187554 - BLOCK
      ?auto_187555 - BLOCK
      ?auto_187556 - BLOCK
    )
    :vars
    (
      ?auto_187557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187556 ?auto_187557 ) ( ON-TABLE ?auto_187547 ) ( ON ?auto_187548 ?auto_187547 ) ( ON ?auto_187549 ?auto_187548 ) ( ON ?auto_187550 ?auto_187549 ) ( not ( = ?auto_187547 ?auto_187548 ) ) ( not ( = ?auto_187547 ?auto_187549 ) ) ( not ( = ?auto_187547 ?auto_187550 ) ) ( not ( = ?auto_187547 ?auto_187551 ) ) ( not ( = ?auto_187547 ?auto_187552 ) ) ( not ( = ?auto_187547 ?auto_187553 ) ) ( not ( = ?auto_187547 ?auto_187554 ) ) ( not ( = ?auto_187547 ?auto_187555 ) ) ( not ( = ?auto_187547 ?auto_187556 ) ) ( not ( = ?auto_187547 ?auto_187557 ) ) ( not ( = ?auto_187548 ?auto_187549 ) ) ( not ( = ?auto_187548 ?auto_187550 ) ) ( not ( = ?auto_187548 ?auto_187551 ) ) ( not ( = ?auto_187548 ?auto_187552 ) ) ( not ( = ?auto_187548 ?auto_187553 ) ) ( not ( = ?auto_187548 ?auto_187554 ) ) ( not ( = ?auto_187548 ?auto_187555 ) ) ( not ( = ?auto_187548 ?auto_187556 ) ) ( not ( = ?auto_187548 ?auto_187557 ) ) ( not ( = ?auto_187549 ?auto_187550 ) ) ( not ( = ?auto_187549 ?auto_187551 ) ) ( not ( = ?auto_187549 ?auto_187552 ) ) ( not ( = ?auto_187549 ?auto_187553 ) ) ( not ( = ?auto_187549 ?auto_187554 ) ) ( not ( = ?auto_187549 ?auto_187555 ) ) ( not ( = ?auto_187549 ?auto_187556 ) ) ( not ( = ?auto_187549 ?auto_187557 ) ) ( not ( = ?auto_187550 ?auto_187551 ) ) ( not ( = ?auto_187550 ?auto_187552 ) ) ( not ( = ?auto_187550 ?auto_187553 ) ) ( not ( = ?auto_187550 ?auto_187554 ) ) ( not ( = ?auto_187550 ?auto_187555 ) ) ( not ( = ?auto_187550 ?auto_187556 ) ) ( not ( = ?auto_187550 ?auto_187557 ) ) ( not ( = ?auto_187551 ?auto_187552 ) ) ( not ( = ?auto_187551 ?auto_187553 ) ) ( not ( = ?auto_187551 ?auto_187554 ) ) ( not ( = ?auto_187551 ?auto_187555 ) ) ( not ( = ?auto_187551 ?auto_187556 ) ) ( not ( = ?auto_187551 ?auto_187557 ) ) ( not ( = ?auto_187552 ?auto_187553 ) ) ( not ( = ?auto_187552 ?auto_187554 ) ) ( not ( = ?auto_187552 ?auto_187555 ) ) ( not ( = ?auto_187552 ?auto_187556 ) ) ( not ( = ?auto_187552 ?auto_187557 ) ) ( not ( = ?auto_187553 ?auto_187554 ) ) ( not ( = ?auto_187553 ?auto_187555 ) ) ( not ( = ?auto_187553 ?auto_187556 ) ) ( not ( = ?auto_187553 ?auto_187557 ) ) ( not ( = ?auto_187554 ?auto_187555 ) ) ( not ( = ?auto_187554 ?auto_187556 ) ) ( not ( = ?auto_187554 ?auto_187557 ) ) ( not ( = ?auto_187555 ?auto_187556 ) ) ( not ( = ?auto_187555 ?auto_187557 ) ) ( not ( = ?auto_187556 ?auto_187557 ) ) ( ON ?auto_187555 ?auto_187556 ) ( ON ?auto_187554 ?auto_187555 ) ( ON ?auto_187553 ?auto_187554 ) ( ON ?auto_187552 ?auto_187553 ) ( CLEAR ?auto_187550 ) ( ON ?auto_187551 ?auto_187552 ) ( CLEAR ?auto_187551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187547 ?auto_187548 ?auto_187549 ?auto_187550 ?auto_187551 )
      ( MAKE-10PILE ?auto_187547 ?auto_187548 ?auto_187549 ?auto_187550 ?auto_187551 ?auto_187552 ?auto_187553 ?auto_187554 ?auto_187555 ?auto_187556 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187589 - BLOCK
      ?auto_187590 - BLOCK
      ?auto_187591 - BLOCK
      ?auto_187592 - BLOCK
      ?auto_187593 - BLOCK
      ?auto_187594 - BLOCK
      ?auto_187595 - BLOCK
      ?auto_187596 - BLOCK
      ?auto_187597 - BLOCK
      ?auto_187598 - BLOCK
    )
    :vars
    (
      ?auto_187599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187598 ?auto_187599 ) ( ON-TABLE ?auto_187589 ) ( ON ?auto_187590 ?auto_187589 ) ( ON ?auto_187591 ?auto_187590 ) ( not ( = ?auto_187589 ?auto_187590 ) ) ( not ( = ?auto_187589 ?auto_187591 ) ) ( not ( = ?auto_187589 ?auto_187592 ) ) ( not ( = ?auto_187589 ?auto_187593 ) ) ( not ( = ?auto_187589 ?auto_187594 ) ) ( not ( = ?auto_187589 ?auto_187595 ) ) ( not ( = ?auto_187589 ?auto_187596 ) ) ( not ( = ?auto_187589 ?auto_187597 ) ) ( not ( = ?auto_187589 ?auto_187598 ) ) ( not ( = ?auto_187589 ?auto_187599 ) ) ( not ( = ?auto_187590 ?auto_187591 ) ) ( not ( = ?auto_187590 ?auto_187592 ) ) ( not ( = ?auto_187590 ?auto_187593 ) ) ( not ( = ?auto_187590 ?auto_187594 ) ) ( not ( = ?auto_187590 ?auto_187595 ) ) ( not ( = ?auto_187590 ?auto_187596 ) ) ( not ( = ?auto_187590 ?auto_187597 ) ) ( not ( = ?auto_187590 ?auto_187598 ) ) ( not ( = ?auto_187590 ?auto_187599 ) ) ( not ( = ?auto_187591 ?auto_187592 ) ) ( not ( = ?auto_187591 ?auto_187593 ) ) ( not ( = ?auto_187591 ?auto_187594 ) ) ( not ( = ?auto_187591 ?auto_187595 ) ) ( not ( = ?auto_187591 ?auto_187596 ) ) ( not ( = ?auto_187591 ?auto_187597 ) ) ( not ( = ?auto_187591 ?auto_187598 ) ) ( not ( = ?auto_187591 ?auto_187599 ) ) ( not ( = ?auto_187592 ?auto_187593 ) ) ( not ( = ?auto_187592 ?auto_187594 ) ) ( not ( = ?auto_187592 ?auto_187595 ) ) ( not ( = ?auto_187592 ?auto_187596 ) ) ( not ( = ?auto_187592 ?auto_187597 ) ) ( not ( = ?auto_187592 ?auto_187598 ) ) ( not ( = ?auto_187592 ?auto_187599 ) ) ( not ( = ?auto_187593 ?auto_187594 ) ) ( not ( = ?auto_187593 ?auto_187595 ) ) ( not ( = ?auto_187593 ?auto_187596 ) ) ( not ( = ?auto_187593 ?auto_187597 ) ) ( not ( = ?auto_187593 ?auto_187598 ) ) ( not ( = ?auto_187593 ?auto_187599 ) ) ( not ( = ?auto_187594 ?auto_187595 ) ) ( not ( = ?auto_187594 ?auto_187596 ) ) ( not ( = ?auto_187594 ?auto_187597 ) ) ( not ( = ?auto_187594 ?auto_187598 ) ) ( not ( = ?auto_187594 ?auto_187599 ) ) ( not ( = ?auto_187595 ?auto_187596 ) ) ( not ( = ?auto_187595 ?auto_187597 ) ) ( not ( = ?auto_187595 ?auto_187598 ) ) ( not ( = ?auto_187595 ?auto_187599 ) ) ( not ( = ?auto_187596 ?auto_187597 ) ) ( not ( = ?auto_187596 ?auto_187598 ) ) ( not ( = ?auto_187596 ?auto_187599 ) ) ( not ( = ?auto_187597 ?auto_187598 ) ) ( not ( = ?auto_187597 ?auto_187599 ) ) ( not ( = ?auto_187598 ?auto_187599 ) ) ( ON ?auto_187597 ?auto_187598 ) ( ON ?auto_187596 ?auto_187597 ) ( ON ?auto_187595 ?auto_187596 ) ( ON ?auto_187594 ?auto_187595 ) ( ON ?auto_187593 ?auto_187594 ) ( CLEAR ?auto_187591 ) ( ON ?auto_187592 ?auto_187593 ) ( CLEAR ?auto_187592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187589 ?auto_187590 ?auto_187591 ?auto_187592 )
      ( MAKE-10PILE ?auto_187589 ?auto_187590 ?auto_187591 ?auto_187592 ?auto_187593 ?auto_187594 ?auto_187595 ?auto_187596 ?auto_187597 ?auto_187598 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187631 - BLOCK
      ?auto_187632 - BLOCK
      ?auto_187633 - BLOCK
      ?auto_187634 - BLOCK
      ?auto_187635 - BLOCK
      ?auto_187636 - BLOCK
      ?auto_187637 - BLOCK
      ?auto_187638 - BLOCK
      ?auto_187639 - BLOCK
      ?auto_187640 - BLOCK
    )
    :vars
    (
      ?auto_187641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187640 ?auto_187641 ) ( ON-TABLE ?auto_187631 ) ( ON ?auto_187632 ?auto_187631 ) ( not ( = ?auto_187631 ?auto_187632 ) ) ( not ( = ?auto_187631 ?auto_187633 ) ) ( not ( = ?auto_187631 ?auto_187634 ) ) ( not ( = ?auto_187631 ?auto_187635 ) ) ( not ( = ?auto_187631 ?auto_187636 ) ) ( not ( = ?auto_187631 ?auto_187637 ) ) ( not ( = ?auto_187631 ?auto_187638 ) ) ( not ( = ?auto_187631 ?auto_187639 ) ) ( not ( = ?auto_187631 ?auto_187640 ) ) ( not ( = ?auto_187631 ?auto_187641 ) ) ( not ( = ?auto_187632 ?auto_187633 ) ) ( not ( = ?auto_187632 ?auto_187634 ) ) ( not ( = ?auto_187632 ?auto_187635 ) ) ( not ( = ?auto_187632 ?auto_187636 ) ) ( not ( = ?auto_187632 ?auto_187637 ) ) ( not ( = ?auto_187632 ?auto_187638 ) ) ( not ( = ?auto_187632 ?auto_187639 ) ) ( not ( = ?auto_187632 ?auto_187640 ) ) ( not ( = ?auto_187632 ?auto_187641 ) ) ( not ( = ?auto_187633 ?auto_187634 ) ) ( not ( = ?auto_187633 ?auto_187635 ) ) ( not ( = ?auto_187633 ?auto_187636 ) ) ( not ( = ?auto_187633 ?auto_187637 ) ) ( not ( = ?auto_187633 ?auto_187638 ) ) ( not ( = ?auto_187633 ?auto_187639 ) ) ( not ( = ?auto_187633 ?auto_187640 ) ) ( not ( = ?auto_187633 ?auto_187641 ) ) ( not ( = ?auto_187634 ?auto_187635 ) ) ( not ( = ?auto_187634 ?auto_187636 ) ) ( not ( = ?auto_187634 ?auto_187637 ) ) ( not ( = ?auto_187634 ?auto_187638 ) ) ( not ( = ?auto_187634 ?auto_187639 ) ) ( not ( = ?auto_187634 ?auto_187640 ) ) ( not ( = ?auto_187634 ?auto_187641 ) ) ( not ( = ?auto_187635 ?auto_187636 ) ) ( not ( = ?auto_187635 ?auto_187637 ) ) ( not ( = ?auto_187635 ?auto_187638 ) ) ( not ( = ?auto_187635 ?auto_187639 ) ) ( not ( = ?auto_187635 ?auto_187640 ) ) ( not ( = ?auto_187635 ?auto_187641 ) ) ( not ( = ?auto_187636 ?auto_187637 ) ) ( not ( = ?auto_187636 ?auto_187638 ) ) ( not ( = ?auto_187636 ?auto_187639 ) ) ( not ( = ?auto_187636 ?auto_187640 ) ) ( not ( = ?auto_187636 ?auto_187641 ) ) ( not ( = ?auto_187637 ?auto_187638 ) ) ( not ( = ?auto_187637 ?auto_187639 ) ) ( not ( = ?auto_187637 ?auto_187640 ) ) ( not ( = ?auto_187637 ?auto_187641 ) ) ( not ( = ?auto_187638 ?auto_187639 ) ) ( not ( = ?auto_187638 ?auto_187640 ) ) ( not ( = ?auto_187638 ?auto_187641 ) ) ( not ( = ?auto_187639 ?auto_187640 ) ) ( not ( = ?auto_187639 ?auto_187641 ) ) ( not ( = ?auto_187640 ?auto_187641 ) ) ( ON ?auto_187639 ?auto_187640 ) ( ON ?auto_187638 ?auto_187639 ) ( ON ?auto_187637 ?auto_187638 ) ( ON ?auto_187636 ?auto_187637 ) ( ON ?auto_187635 ?auto_187636 ) ( ON ?auto_187634 ?auto_187635 ) ( CLEAR ?auto_187632 ) ( ON ?auto_187633 ?auto_187634 ) ( CLEAR ?auto_187633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187631 ?auto_187632 ?auto_187633 )
      ( MAKE-10PILE ?auto_187631 ?auto_187632 ?auto_187633 ?auto_187634 ?auto_187635 ?auto_187636 ?auto_187637 ?auto_187638 ?auto_187639 ?auto_187640 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187673 - BLOCK
      ?auto_187674 - BLOCK
      ?auto_187675 - BLOCK
      ?auto_187676 - BLOCK
      ?auto_187677 - BLOCK
      ?auto_187678 - BLOCK
      ?auto_187679 - BLOCK
      ?auto_187680 - BLOCK
      ?auto_187681 - BLOCK
      ?auto_187682 - BLOCK
    )
    :vars
    (
      ?auto_187683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187682 ?auto_187683 ) ( ON-TABLE ?auto_187673 ) ( not ( = ?auto_187673 ?auto_187674 ) ) ( not ( = ?auto_187673 ?auto_187675 ) ) ( not ( = ?auto_187673 ?auto_187676 ) ) ( not ( = ?auto_187673 ?auto_187677 ) ) ( not ( = ?auto_187673 ?auto_187678 ) ) ( not ( = ?auto_187673 ?auto_187679 ) ) ( not ( = ?auto_187673 ?auto_187680 ) ) ( not ( = ?auto_187673 ?auto_187681 ) ) ( not ( = ?auto_187673 ?auto_187682 ) ) ( not ( = ?auto_187673 ?auto_187683 ) ) ( not ( = ?auto_187674 ?auto_187675 ) ) ( not ( = ?auto_187674 ?auto_187676 ) ) ( not ( = ?auto_187674 ?auto_187677 ) ) ( not ( = ?auto_187674 ?auto_187678 ) ) ( not ( = ?auto_187674 ?auto_187679 ) ) ( not ( = ?auto_187674 ?auto_187680 ) ) ( not ( = ?auto_187674 ?auto_187681 ) ) ( not ( = ?auto_187674 ?auto_187682 ) ) ( not ( = ?auto_187674 ?auto_187683 ) ) ( not ( = ?auto_187675 ?auto_187676 ) ) ( not ( = ?auto_187675 ?auto_187677 ) ) ( not ( = ?auto_187675 ?auto_187678 ) ) ( not ( = ?auto_187675 ?auto_187679 ) ) ( not ( = ?auto_187675 ?auto_187680 ) ) ( not ( = ?auto_187675 ?auto_187681 ) ) ( not ( = ?auto_187675 ?auto_187682 ) ) ( not ( = ?auto_187675 ?auto_187683 ) ) ( not ( = ?auto_187676 ?auto_187677 ) ) ( not ( = ?auto_187676 ?auto_187678 ) ) ( not ( = ?auto_187676 ?auto_187679 ) ) ( not ( = ?auto_187676 ?auto_187680 ) ) ( not ( = ?auto_187676 ?auto_187681 ) ) ( not ( = ?auto_187676 ?auto_187682 ) ) ( not ( = ?auto_187676 ?auto_187683 ) ) ( not ( = ?auto_187677 ?auto_187678 ) ) ( not ( = ?auto_187677 ?auto_187679 ) ) ( not ( = ?auto_187677 ?auto_187680 ) ) ( not ( = ?auto_187677 ?auto_187681 ) ) ( not ( = ?auto_187677 ?auto_187682 ) ) ( not ( = ?auto_187677 ?auto_187683 ) ) ( not ( = ?auto_187678 ?auto_187679 ) ) ( not ( = ?auto_187678 ?auto_187680 ) ) ( not ( = ?auto_187678 ?auto_187681 ) ) ( not ( = ?auto_187678 ?auto_187682 ) ) ( not ( = ?auto_187678 ?auto_187683 ) ) ( not ( = ?auto_187679 ?auto_187680 ) ) ( not ( = ?auto_187679 ?auto_187681 ) ) ( not ( = ?auto_187679 ?auto_187682 ) ) ( not ( = ?auto_187679 ?auto_187683 ) ) ( not ( = ?auto_187680 ?auto_187681 ) ) ( not ( = ?auto_187680 ?auto_187682 ) ) ( not ( = ?auto_187680 ?auto_187683 ) ) ( not ( = ?auto_187681 ?auto_187682 ) ) ( not ( = ?auto_187681 ?auto_187683 ) ) ( not ( = ?auto_187682 ?auto_187683 ) ) ( ON ?auto_187681 ?auto_187682 ) ( ON ?auto_187680 ?auto_187681 ) ( ON ?auto_187679 ?auto_187680 ) ( ON ?auto_187678 ?auto_187679 ) ( ON ?auto_187677 ?auto_187678 ) ( ON ?auto_187676 ?auto_187677 ) ( ON ?auto_187675 ?auto_187676 ) ( CLEAR ?auto_187673 ) ( ON ?auto_187674 ?auto_187675 ) ( CLEAR ?auto_187674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187673 ?auto_187674 )
      ( MAKE-10PILE ?auto_187673 ?auto_187674 ?auto_187675 ?auto_187676 ?auto_187677 ?auto_187678 ?auto_187679 ?auto_187680 ?auto_187681 ?auto_187682 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_187715 - BLOCK
      ?auto_187716 - BLOCK
      ?auto_187717 - BLOCK
      ?auto_187718 - BLOCK
      ?auto_187719 - BLOCK
      ?auto_187720 - BLOCK
      ?auto_187721 - BLOCK
      ?auto_187722 - BLOCK
      ?auto_187723 - BLOCK
      ?auto_187724 - BLOCK
    )
    :vars
    (
      ?auto_187725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187724 ?auto_187725 ) ( not ( = ?auto_187715 ?auto_187716 ) ) ( not ( = ?auto_187715 ?auto_187717 ) ) ( not ( = ?auto_187715 ?auto_187718 ) ) ( not ( = ?auto_187715 ?auto_187719 ) ) ( not ( = ?auto_187715 ?auto_187720 ) ) ( not ( = ?auto_187715 ?auto_187721 ) ) ( not ( = ?auto_187715 ?auto_187722 ) ) ( not ( = ?auto_187715 ?auto_187723 ) ) ( not ( = ?auto_187715 ?auto_187724 ) ) ( not ( = ?auto_187715 ?auto_187725 ) ) ( not ( = ?auto_187716 ?auto_187717 ) ) ( not ( = ?auto_187716 ?auto_187718 ) ) ( not ( = ?auto_187716 ?auto_187719 ) ) ( not ( = ?auto_187716 ?auto_187720 ) ) ( not ( = ?auto_187716 ?auto_187721 ) ) ( not ( = ?auto_187716 ?auto_187722 ) ) ( not ( = ?auto_187716 ?auto_187723 ) ) ( not ( = ?auto_187716 ?auto_187724 ) ) ( not ( = ?auto_187716 ?auto_187725 ) ) ( not ( = ?auto_187717 ?auto_187718 ) ) ( not ( = ?auto_187717 ?auto_187719 ) ) ( not ( = ?auto_187717 ?auto_187720 ) ) ( not ( = ?auto_187717 ?auto_187721 ) ) ( not ( = ?auto_187717 ?auto_187722 ) ) ( not ( = ?auto_187717 ?auto_187723 ) ) ( not ( = ?auto_187717 ?auto_187724 ) ) ( not ( = ?auto_187717 ?auto_187725 ) ) ( not ( = ?auto_187718 ?auto_187719 ) ) ( not ( = ?auto_187718 ?auto_187720 ) ) ( not ( = ?auto_187718 ?auto_187721 ) ) ( not ( = ?auto_187718 ?auto_187722 ) ) ( not ( = ?auto_187718 ?auto_187723 ) ) ( not ( = ?auto_187718 ?auto_187724 ) ) ( not ( = ?auto_187718 ?auto_187725 ) ) ( not ( = ?auto_187719 ?auto_187720 ) ) ( not ( = ?auto_187719 ?auto_187721 ) ) ( not ( = ?auto_187719 ?auto_187722 ) ) ( not ( = ?auto_187719 ?auto_187723 ) ) ( not ( = ?auto_187719 ?auto_187724 ) ) ( not ( = ?auto_187719 ?auto_187725 ) ) ( not ( = ?auto_187720 ?auto_187721 ) ) ( not ( = ?auto_187720 ?auto_187722 ) ) ( not ( = ?auto_187720 ?auto_187723 ) ) ( not ( = ?auto_187720 ?auto_187724 ) ) ( not ( = ?auto_187720 ?auto_187725 ) ) ( not ( = ?auto_187721 ?auto_187722 ) ) ( not ( = ?auto_187721 ?auto_187723 ) ) ( not ( = ?auto_187721 ?auto_187724 ) ) ( not ( = ?auto_187721 ?auto_187725 ) ) ( not ( = ?auto_187722 ?auto_187723 ) ) ( not ( = ?auto_187722 ?auto_187724 ) ) ( not ( = ?auto_187722 ?auto_187725 ) ) ( not ( = ?auto_187723 ?auto_187724 ) ) ( not ( = ?auto_187723 ?auto_187725 ) ) ( not ( = ?auto_187724 ?auto_187725 ) ) ( ON ?auto_187723 ?auto_187724 ) ( ON ?auto_187722 ?auto_187723 ) ( ON ?auto_187721 ?auto_187722 ) ( ON ?auto_187720 ?auto_187721 ) ( ON ?auto_187719 ?auto_187720 ) ( ON ?auto_187718 ?auto_187719 ) ( ON ?auto_187717 ?auto_187718 ) ( ON ?auto_187716 ?auto_187717 ) ( ON ?auto_187715 ?auto_187716 ) ( CLEAR ?auto_187715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187715 )
      ( MAKE-10PILE ?auto_187715 ?auto_187716 ?auto_187717 ?auto_187718 ?auto_187719 ?auto_187720 ?auto_187721 ?auto_187722 ?auto_187723 ?auto_187724 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187758 - BLOCK
      ?auto_187759 - BLOCK
      ?auto_187760 - BLOCK
      ?auto_187761 - BLOCK
      ?auto_187762 - BLOCK
      ?auto_187763 - BLOCK
      ?auto_187764 - BLOCK
      ?auto_187765 - BLOCK
      ?auto_187766 - BLOCK
      ?auto_187767 - BLOCK
      ?auto_187768 - BLOCK
    )
    :vars
    (
      ?auto_187769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187767 ) ( ON ?auto_187768 ?auto_187769 ) ( CLEAR ?auto_187768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187758 ) ( ON ?auto_187759 ?auto_187758 ) ( ON ?auto_187760 ?auto_187759 ) ( ON ?auto_187761 ?auto_187760 ) ( ON ?auto_187762 ?auto_187761 ) ( ON ?auto_187763 ?auto_187762 ) ( ON ?auto_187764 ?auto_187763 ) ( ON ?auto_187765 ?auto_187764 ) ( ON ?auto_187766 ?auto_187765 ) ( ON ?auto_187767 ?auto_187766 ) ( not ( = ?auto_187758 ?auto_187759 ) ) ( not ( = ?auto_187758 ?auto_187760 ) ) ( not ( = ?auto_187758 ?auto_187761 ) ) ( not ( = ?auto_187758 ?auto_187762 ) ) ( not ( = ?auto_187758 ?auto_187763 ) ) ( not ( = ?auto_187758 ?auto_187764 ) ) ( not ( = ?auto_187758 ?auto_187765 ) ) ( not ( = ?auto_187758 ?auto_187766 ) ) ( not ( = ?auto_187758 ?auto_187767 ) ) ( not ( = ?auto_187758 ?auto_187768 ) ) ( not ( = ?auto_187758 ?auto_187769 ) ) ( not ( = ?auto_187759 ?auto_187760 ) ) ( not ( = ?auto_187759 ?auto_187761 ) ) ( not ( = ?auto_187759 ?auto_187762 ) ) ( not ( = ?auto_187759 ?auto_187763 ) ) ( not ( = ?auto_187759 ?auto_187764 ) ) ( not ( = ?auto_187759 ?auto_187765 ) ) ( not ( = ?auto_187759 ?auto_187766 ) ) ( not ( = ?auto_187759 ?auto_187767 ) ) ( not ( = ?auto_187759 ?auto_187768 ) ) ( not ( = ?auto_187759 ?auto_187769 ) ) ( not ( = ?auto_187760 ?auto_187761 ) ) ( not ( = ?auto_187760 ?auto_187762 ) ) ( not ( = ?auto_187760 ?auto_187763 ) ) ( not ( = ?auto_187760 ?auto_187764 ) ) ( not ( = ?auto_187760 ?auto_187765 ) ) ( not ( = ?auto_187760 ?auto_187766 ) ) ( not ( = ?auto_187760 ?auto_187767 ) ) ( not ( = ?auto_187760 ?auto_187768 ) ) ( not ( = ?auto_187760 ?auto_187769 ) ) ( not ( = ?auto_187761 ?auto_187762 ) ) ( not ( = ?auto_187761 ?auto_187763 ) ) ( not ( = ?auto_187761 ?auto_187764 ) ) ( not ( = ?auto_187761 ?auto_187765 ) ) ( not ( = ?auto_187761 ?auto_187766 ) ) ( not ( = ?auto_187761 ?auto_187767 ) ) ( not ( = ?auto_187761 ?auto_187768 ) ) ( not ( = ?auto_187761 ?auto_187769 ) ) ( not ( = ?auto_187762 ?auto_187763 ) ) ( not ( = ?auto_187762 ?auto_187764 ) ) ( not ( = ?auto_187762 ?auto_187765 ) ) ( not ( = ?auto_187762 ?auto_187766 ) ) ( not ( = ?auto_187762 ?auto_187767 ) ) ( not ( = ?auto_187762 ?auto_187768 ) ) ( not ( = ?auto_187762 ?auto_187769 ) ) ( not ( = ?auto_187763 ?auto_187764 ) ) ( not ( = ?auto_187763 ?auto_187765 ) ) ( not ( = ?auto_187763 ?auto_187766 ) ) ( not ( = ?auto_187763 ?auto_187767 ) ) ( not ( = ?auto_187763 ?auto_187768 ) ) ( not ( = ?auto_187763 ?auto_187769 ) ) ( not ( = ?auto_187764 ?auto_187765 ) ) ( not ( = ?auto_187764 ?auto_187766 ) ) ( not ( = ?auto_187764 ?auto_187767 ) ) ( not ( = ?auto_187764 ?auto_187768 ) ) ( not ( = ?auto_187764 ?auto_187769 ) ) ( not ( = ?auto_187765 ?auto_187766 ) ) ( not ( = ?auto_187765 ?auto_187767 ) ) ( not ( = ?auto_187765 ?auto_187768 ) ) ( not ( = ?auto_187765 ?auto_187769 ) ) ( not ( = ?auto_187766 ?auto_187767 ) ) ( not ( = ?auto_187766 ?auto_187768 ) ) ( not ( = ?auto_187766 ?auto_187769 ) ) ( not ( = ?auto_187767 ?auto_187768 ) ) ( not ( = ?auto_187767 ?auto_187769 ) ) ( not ( = ?auto_187768 ?auto_187769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187768 ?auto_187769 )
      ( !STACK ?auto_187768 ?auto_187767 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187804 - BLOCK
      ?auto_187805 - BLOCK
      ?auto_187806 - BLOCK
      ?auto_187807 - BLOCK
      ?auto_187808 - BLOCK
      ?auto_187809 - BLOCK
      ?auto_187810 - BLOCK
      ?auto_187811 - BLOCK
      ?auto_187812 - BLOCK
      ?auto_187813 - BLOCK
      ?auto_187814 - BLOCK
    )
    :vars
    (
      ?auto_187815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187814 ?auto_187815 ) ( ON-TABLE ?auto_187804 ) ( ON ?auto_187805 ?auto_187804 ) ( ON ?auto_187806 ?auto_187805 ) ( ON ?auto_187807 ?auto_187806 ) ( ON ?auto_187808 ?auto_187807 ) ( ON ?auto_187809 ?auto_187808 ) ( ON ?auto_187810 ?auto_187809 ) ( ON ?auto_187811 ?auto_187810 ) ( ON ?auto_187812 ?auto_187811 ) ( not ( = ?auto_187804 ?auto_187805 ) ) ( not ( = ?auto_187804 ?auto_187806 ) ) ( not ( = ?auto_187804 ?auto_187807 ) ) ( not ( = ?auto_187804 ?auto_187808 ) ) ( not ( = ?auto_187804 ?auto_187809 ) ) ( not ( = ?auto_187804 ?auto_187810 ) ) ( not ( = ?auto_187804 ?auto_187811 ) ) ( not ( = ?auto_187804 ?auto_187812 ) ) ( not ( = ?auto_187804 ?auto_187813 ) ) ( not ( = ?auto_187804 ?auto_187814 ) ) ( not ( = ?auto_187804 ?auto_187815 ) ) ( not ( = ?auto_187805 ?auto_187806 ) ) ( not ( = ?auto_187805 ?auto_187807 ) ) ( not ( = ?auto_187805 ?auto_187808 ) ) ( not ( = ?auto_187805 ?auto_187809 ) ) ( not ( = ?auto_187805 ?auto_187810 ) ) ( not ( = ?auto_187805 ?auto_187811 ) ) ( not ( = ?auto_187805 ?auto_187812 ) ) ( not ( = ?auto_187805 ?auto_187813 ) ) ( not ( = ?auto_187805 ?auto_187814 ) ) ( not ( = ?auto_187805 ?auto_187815 ) ) ( not ( = ?auto_187806 ?auto_187807 ) ) ( not ( = ?auto_187806 ?auto_187808 ) ) ( not ( = ?auto_187806 ?auto_187809 ) ) ( not ( = ?auto_187806 ?auto_187810 ) ) ( not ( = ?auto_187806 ?auto_187811 ) ) ( not ( = ?auto_187806 ?auto_187812 ) ) ( not ( = ?auto_187806 ?auto_187813 ) ) ( not ( = ?auto_187806 ?auto_187814 ) ) ( not ( = ?auto_187806 ?auto_187815 ) ) ( not ( = ?auto_187807 ?auto_187808 ) ) ( not ( = ?auto_187807 ?auto_187809 ) ) ( not ( = ?auto_187807 ?auto_187810 ) ) ( not ( = ?auto_187807 ?auto_187811 ) ) ( not ( = ?auto_187807 ?auto_187812 ) ) ( not ( = ?auto_187807 ?auto_187813 ) ) ( not ( = ?auto_187807 ?auto_187814 ) ) ( not ( = ?auto_187807 ?auto_187815 ) ) ( not ( = ?auto_187808 ?auto_187809 ) ) ( not ( = ?auto_187808 ?auto_187810 ) ) ( not ( = ?auto_187808 ?auto_187811 ) ) ( not ( = ?auto_187808 ?auto_187812 ) ) ( not ( = ?auto_187808 ?auto_187813 ) ) ( not ( = ?auto_187808 ?auto_187814 ) ) ( not ( = ?auto_187808 ?auto_187815 ) ) ( not ( = ?auto_187809 ?auto_187810 ) ) ( not ( = ?auto_187809 ?auto_187811 ) ) ( not ( = ?auto_187809 ?auto_187812 ) ) ( not ( = ?auto_187809 ?auto_187813 ) ) ( not ( = ?auto_187809 ?auto_187814 ) ) ( not ( = ?auto_187809 ?auto_187815 ) ) ( not ( = ?auto_187810 ?auto_187811 ) ) ( not ( = ?auto_187810 ?auto_187812 ) ) ( not ( = ?auto_187810 ?auto_187813 ) ) ( not ( = ?auto_187810 ?auto_187814 ) ) ( not ( = ?auto_187810 ?auto_187815 ) ) ( not ( = ?auto_187811 ?auto_187812 ) ) ( not ( = ?auto_187811 ?auto_187813 ) ) ( not ( = ?auto_187811 ?auto_187814 ) ) ( not ( = ?auto_187811 ?auto_187815 ) ) ( not ( = ?auto_187812 ?auto_187813 ) ) ( not ( = ?auto_187812 ?auto_187814 ) ) ( not ( = ?auto_187812 ?auto_187815 ) ) ( not ( = ?auto_187813 ?auto_187814 ) ) ( not ( = ?auto_187813 ?auto_187815 ) ) ( not ( = ?auto_187814 ?auto_187815 ) ) ( CLEAR ?auto_187812 ) ( ON ?auto_187813 ?auto_187814 ) ( CLEAR ?auto_187813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_187804 ?auto_187805 ?auto_187806 ?auto_187807 ?auto_187808 ?auto_187809 ?auto_187810 ?auto_187811 ?auto_187812 ?auto_187813 )
      ( MAKE-11PILE ?auto_187804 ?auto_187805 ?auto_187806 ?auto_187807 ?auto_187808 ?auto_187809 ?auto_187810 ?auto_187811 ?auto_187812 ?auto_187813 ?auto_187814 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187850 - BLOCK
      ?auto_187851 - BLOCK
      ?auto_187852 - BLOCK
      ?auto_187853 - BLOCK
      ?auto_187854 - BLOCK
      ?auto_187855 - BLOCK
      ?auto_187856 - BLOCK
      ?auto_187857 - BLOCK
      ?auto_187858 - BLOCK
      ?auto_187859 - BLOCK
      ?auto_187860 - BLOCK
    )
    :vars
    (
      ?auto_187861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187860 ?auto_187861 ) ( ON-TABLE ?auto_187850 ) ( ON ?auto_187851 ?auto_187850 ) ( ON ?auto_187852 ?auto_187851 ) ( ON ?auto_187853 ?auto_187852 ) ( ON ?auto_187854 ?auto_187853 ) ( ON ?auto_187855 ?auto_187854 ) ( ON ?auto_187856 ?auto_187855 ) ( ON ?auto_187857 ?auto_187856 ) ( not ( = ?auto_187850 ?auto_187851 ) ) ( not ( = ?auto_187850 ?auto_187852 ) ) ( not ( = ?auto_187850 ?auto_187853 ) ) ( not ( = ?auto_187850 ?auto_187854 ) ) ( not ( = ?auto_187850 ?auto_187855 ) ) ( not ( = ?auto_187850 ?auto_187856 ) ) ( not ( = ?auto_187850 ?auto_187857 ) ) ( not ( = ?auto_187850 ?auto_187858 ) ) ( not ( = ?auto_187850 ?auto_187859 ) ) ( not ( = ?auto_187850 ?auto_187860 ) ) ( not ( = ?auto_187850 ?auto_187861 ) ) ( not ( = ?auto_187851 ?auto_187852 ) ) ( not ( = ?auto_187851 ?auto_187853 ) ) ( not ( = ?auto_187851 ?auto_187854 ) ) ( not ( = ?auto_187851 ?auto_187855 ) ) ( not ( = ?auto_187851 ?auto_187856 ) ) ( not ( = ?auto_187851 ?auto_187857 ) ) ( not ( = ?auto_187851 ?auto_187858 ) ) ( not ( = ?auto_187851 ?auto_187859 ) ) ( not ( = ?auto_187851 ?auto_187860 ) ) ( not ( = ?auto_187851 ?auto_187861 ) ) ( not ( = ?auto_187852 ?auto_187853 ) ) ( not ( = ?auto_187852 ?auto_187854 ) ) ( not ( = ?auto_187852 ?auto_187855 ) ) ( not ( = ?auto_187852 ?auto_187856 ) ) ( not ( = ?auto_187852 ?auto_187857 ) ) ( not ( = ?auto_187852 ?auto_187858 ) ) ( not ( = ?auto_187852 ?auto_187859 ) ) ( not ( = ?auto_187852 ?auto_187860 ) ) ( not ( = ?auto_187852 ?auto_187861 ) ) ( not ( = ?auto_187853 ?auto_187854 ) ) ( not ( = ?auto_187853 ?auto_187855 ) ) ( not ( = ?auto_187853 ?auto_187856 ) ) ( not ( = ?auto_187853 ?auto_187857 ) ) ( not ( = ?auto_187853 ?auto_187858 ) ) ( not ( = ?auto_187853 ?auto_187859 ) ) ( not ( = ?auto_187853 ?auto_187860 ) ) ( not ( = ?auto_187853 ?auto_187861 ) ) ( not ( = ?auto_187854 ?auto_187855 ) ) ( not ( = ?auto_187854 ?auto_187856 ) ) ( not ( = ?auto_187854 ?auto_187857 ) ) ( not ( = ?auto_187854 ?auto_187858 ) ) ( not ( = ?auto_187854 ?auto_187859 ) ) ( not ( = ?auto_187854 ?auto_187860 ) ) ( not ( = ?auto_187854 ?auto_187861 ) ) ( not ( = ?auto_187855 ?auto_187856 ) ) ( not ( = ?auto_187855 ?auto_187857 ) ) ( not ( = ?auto_187855 ?auto_187858 ) ) ( not ( = ?auto_187855 ?auto_187859 ) ) ( not ( = ?auto_187855 ?auto_187860 ) ) ( not ( = ?auto_187855 ?auto_187861 ) ) ( not ( = ?auto_187856 ?auto_187857 ) ) ( not ( = ?auto_187856 ?auto_187858 ) ) ( not ( = ?auto_187856 ?auto_187859 ) ) ( not ( = ?auto_187856 ?auto_187860 ) ) ( not ( = ?auto_187856 ?auto_187861 ) ) ( not ( = ?auto_187857 ?auto_187858 ) ) ( not ( = ?auto_187857 ?auto_187859 ) ) ( not ( = ?auto_187857 ?auto_187860 ) ) ( not ( = ?auto_187857 ?auto_187861 ) ) ( not ( = ?auto_187858 ?auto_187859 ) ) ( not ( = ?auto_187858 ?auto_187860 ) ) ( not ( = ?auto_187858 ?auto_187861 ) ) ( not ( = ?auto_187859 ?auto_187860 ) ) ( not ( = ?auto_187859 ?auto_187861 ) ) ( not ( = ?auto_187860 ?auto_187861 ) ) ( ON ?auto_187859 ?auto_187860 ) ( CLEAR ?auto_187857 ) ( ON ?auto_187858 ?auto_187859 ) ( CLEAR ?auto_187858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_187850 ?auto_187851 ?auto_187852 ?auto_187853 ?auto_187854 ?auto_187855 ?auto_187856 ?auto_187857 ?auto_187858 )
      ( MAKE-11PILE ?auto_187850 ?auto_187851 ?auto_187852 ?auto_187853 ?auto_187854 ?auto_187855 ?auto_187856 ?auto_187857 ?auto_187858 ?auto_187859 ?auto_187860 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187896 - BLOCK
      ?auto_187897 - BLOCK
      ?auto_187898 - BLOCK
      ?auto_187899 - BLOCK
      ?auto_187900 - BLOCK
      ?auto_187901 - BLOCK
      ?auto_187902 - BLOCK
      ?auto_187903 - BLOCK
      ?auto_187904 - BLOCK
      ?auto_187905 - BLOCK
      ?auto_187906 - BLOCK
    )
    :vars
    (
      ?auto_187907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187906 ?auto_187907 ) ( ON-TABLE ?auto_187896 ) ( ON ?auto_187897 ?auto_187896 ) ( ON ?auto_187898 ?auto_187897 ) ( ON ?auto_187899 ?auto_187898 ) ( ON ?auto_187900 ?auto_187899 ) ( ON ?auto_187901 ?auto_187900 ) ( ON ?auto_187902 ?auto_187901 ) ( not ( = ?auto_187896 ?auto_187897 ) ) ( not ( = ?auto_187896 ?auto_187898 ) ) ( not ( = ?auto_187896 ?auto_187899 ) ) ( not ( = ?auto_187896 ?auto_187900 ) ) ( not ( = ?auto_187896 ?auto_187901 ) ) ( not ( = ?auto_187896 ?auto_187902 ) ) ( not ( = ?auto_187896 ?auto_187903 ) ) ( not ( = ?auto_187896 ?auto_187904 ) ) ( not ( = ?auto_187896 ?auto_187905 ) ) ( not ( = ?auto_187896 ?auto_187906 ) ) ( not ( = ?auto_187896 ?auto_187907 ) ) ( not ( = ?auto_187897 ?auto_187898 ) ) ( not ( = ?auto_187897 ?auto_187899 ) ) ( not ( = ?auto_187897 ?auto_187900 ) ) ( not ( = ?auto_187897 ?auto_187901 ) ) ( not ( = ?auto_187897 ?auto_187902 ) ) ( not ( = ?auto_187897 ?auto_187903 ) ) ( not ( = ?auto_187897 ?auto_187904 ) ) ( not ( = ?auto_187897 ?auto_187905 ) ) ( not ( = ?auto_187897 ?auto_187906 ) ) ( not ( = ?auto_187897 ?auto_187907 ) ) ( not ( = ?auto_187898 ?auto_187899 ) ) ( not ( = ?auto_187898 ?auto_187900 ) ) ( not ( = ?auto_187898 ?auto_187901 ) ) ( not ( = ?auto_187898 ?auto_187902 ) ) ( not ( = ?auto_187898 ?auto_187903 ) ) ( not ( = ?auto_187898 ?auto_187904 ) ) ( not ( = ?auto_187898 ?auto_187905 ) ) ( not ( = ?auto_187898 ?auto_187906 ) ) ( not ( = ?auto_187898 ?auto_187907 ) ) ( not ( = ?auto_187899 ?auto_187900 ) ) ( not ( = ?auto_187899 ?auto_187901 ) ) ( not ( = ?auto_187899 ?auto_187902 ) ) ( not ( = ?auto_187899 ?auto_187903 ) ) ( not ( = ?auto_187899 ?auto_187904 ) ) ( not ( = ?auto_187899 ?auto_187905 ) ) ( not ( = ?auto_187899 ?auto_187906 ) ) ( not ( = ?auto_187899 ?auto_187907 ) ) ( not ( = ?auto_187900 ?auto_187901 ) ) ( not ( = ?auto_187900 ?auto_187902 ) ) ( not ( = ?auto_187900 ?auto_187903 ) ) ( not ( = ?auto_187900 ?auto_187904 ) ) ( not ( = ?auto_187900 ?auto_187905 ) ) ( not ( = ?auto_187900 ?auto_187906 ) ) ( not ( = ?auto_187900 ?auto_187907 ) ) ( not ( = ?auto_187901 ?auto_187902 ) ) ( not ( = ?auto_187901 ?auto_187903 ) ) ( not ( = ?auto_187901 ?auto_187904 ) ) ( not ( = ?auto_187901 ?auto_187905 ) ) ( not ( = ?auto_187901 ?auto_187906 ) ) ( not ( = ?auto_187901 ?auto_187907 ) ) ( not ( = ?auto_187902 ?auto_187903 ) ) ( not ( = ?auto_187902 ?auto_187904 ) ) ( not ( = ?auto_187902 ?auto_187905 ) ) ( not ( = ?auto_187902 ?auto_187906 ) ) ( not ( = ?auto_187902 ?auto_187907 ) ) ( not ( = ?auto_187903 ?auto_187904 ) ) ( not ( = ?auto_187903 ?auto_187905 ) ) ( not ( = ?auto_187903 ?auto_187906 ) ) ( not ( = ?auto_187903 ?auto_187907 ) ) ( not ( = ?auto_187904 ?auto_187905 ) ) ( not ( = ?auto_187904 ?auto_187906 ) ) ( not ( = ?auto_187904 ?auto_187907 ) ) ( not ( = ?auto_187905 ?auto_187906 ) ) ( not ( = ?auto_187905 ?auto_187907 ) ) ( not ( = ?auto_187906 ?auto_187907 ) ) ( ON ?auto_187905 ?auto_187906 ) ( ON ?auto_187904 ?auto_187905 ) ( CLEAR ?auto_187902 ) ( ON ?auto_187903 ?auto_187904 ) ( CLEAR ?auto_187903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187896 ?auto_187897 ?auto_187898 ?auto_187899 ?auto_187900 ?auto_187901 ?auto_187902 ?auto_187903 )
      ( MAKE-11PILE ?auto_187896 ?auto_187897 ?auto_187898 ?auto_187899 ?auto_187900 ?auto_187901 ?auto_187902 ?auto_187903 ?auto_187904 ?auto_187905 ?auto_187906 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187942 - BLOCK
      ?auto_187943 - BLOCK
      ?auto_187944 - BLOCK
      ?auto_187945 - BLOCK
      ?auto_187946 - BLOCK
      ?auto_187947 - BLOCK
      ?auto_187948 - BLOCK
      ?auto_187949 - BLOCK
      ?auto_187950 - BLOCK
      ?auto_187951 - BLOCK
      ?auto_187952 - BLOCK
    )
    :vars
    (
      ?auto_187953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187952 ?auto_187953 ) ( ON-TABLE ?auto_187942 ) ( ON ?auto_187943 ?auto_187942 ) ( ON ?auto_187944 ?auto_187943 ) ( ON ?auto_187945 ?auto_187944 ) ( ON ?auto_187946 ?auto_187945 ) ( ON ?auto_187947 ?auto_187946 ) ( not ( = ?auto_187942 ?auto_187943 ) ) ( not ( = ?auto_187942 ?auto_187944 ) ) ( not ( = ?auto_187942 ?auto_187945 ) ) ( not ( = ?auto_187942 ?auto_187946 ) ) ( not ( = ?auto_187942 ?auto_187947 ) ) ( not ( = ?auto_187942 ?auto_187948 ) ) ( not ( = ?auto_187942 ?auto_187949 ) ) ( not ( = ?auto_187942 ?auto_187950 ) ) ( not ( = ?auto_187942 ?auto_187951 ) ) ( not ( = ?auto_187942 ?auto_187952 ) ) ( not ( = ?auto_187942 ?auto_187953 ) ) ( not ( = ?auto_187943 ?auto_187944 ) ) ( not ( = ?auto_187943 ?auto_187945 ) ) ( not ( = ?auto_187943 ?auto_187946 ) ) ( not ( = ?auto_187943 ?auto_187947 ) ) ( not ( = ?auto_187943 ?auto_187948 ) ) ( not ( = ?auto_187943 ?auto_187949 ) ) ( not ( = ?auto_187943 ?auto_187950 ) ) ( not ( = ?auto_187943 ?auto_187951 ) ) ( not ( = ?auto_187943 ?auto_187952 ) ) ( not ( = ?auto_187943 ?auto_187953 ) ) ( not ( = ?auto_187944 ?auto_187945 ) ) ( not ( = ?auto_187944 ?auto_187946 ) ) ( not ( = ?auto_187944 ?auto_187947 ) ) ( not ( = ?auto_187944 ?auto_187948 ) ) ( not ( = ?auto_187944 ?auto_187949 ) ) ( not ( = ?auto_187944 ?auto_187950 ) ) ( not ( = ?auto_187944 ?auto_187951 ) ) ( not ( = ?auto_187944 ?auto_187952 ) ) ( not ( = ?auto_187944 ?auto_187953 ) ) ( not ( = ?auto_187945 ?auto_187946 ) ) ( not ( = ?auto_187945 ?auto_187947 ) ) ( not ( = ?auto_187945 ?auto_187948 ) ) ( not ( = ?auto_187945 ?auto_187949 ) ) ( not ( = ?auto_187945 ?auto_187950 ) ) ( not ( = ?auto_187945 ?auto_187951 ) ) ( not ( = ?auto_187945 ?auto_187952 ) ) ( not ( = ?auto_187945 ?auto_187953 ) ) ( not ( = ?auto_187946 ?auto_187947 ) ) ( not ( = ?auto_187946 ?auto_187948 ) ) ( not ( = ?auto_187946 ?auto_187949 ) ) ( not ( = ?auto_187946 ?auto_187950 ) ) ( not ( = ?auto_187946 ?auto_187951 ) ) ( not ( = ?auto_187946 ?auto_187952 ) ) ( not ( = ?auto_187946 ?auto_187953 ) ) ( not ( = ?auto_187947 ?auto_187948 ) ) ( not ( = ?auto_187947 ?auto_187949 ) ) ( not ( = ?auto_187947 ?auto_187950 ) ) ( not ( = ?auto_187947 ?auto_187951 ) ) ( not ( = ?auto_187947 ?auto_187952 ) ) ( not ( = ?auto_187947 ?auto_187953 ) ) ( not ( = ?auto_187948 ?auto_187949 ) ) ( not ( = ?auto_187948 ?auto_187950 ) ) ( not ( = ?auto_187948 ?auto_187951 ) ) ( not ( = ?auto_187948 ?auto_187952 ) ) ( not ( = ?auto_187948 ?auto_187953 ) ) ( not ( = ?auto_187949 ?auto_187950 ) ) ( not ( = ?auto_187949 ?auto_187951 ) ) ( not ( = ?auto_187949 ?auto_187952 ) ) ( not ( = ?auto_187949 ?auto_187953 ) ) ( not ( = ?auto_187950 ?auto_187951 ) ) ( not ( = ?auto_187950 ?auto_187952 ) ) ( not ( = ?auto_187950 ?auto_187953 ) ) ( not ( = ?auto_187951 ?auto_187952 ) ) ( not ( = ?auto_187951 ?auto_187953 ) ) ( not ( = ?auto_187952 ?auto_187953 ) ) ( ON ?auto_187951 ?auto_187952 ) ( ON ?auto_187950 ?auto_187951 ) ( ON ?auto_187949 ?auto_187950 ) ( CLEAR ?auto_187947 ) ( ON ?auto_187948 ?auto_187949 ) ( CLEAR ?auto_187948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187942 ?auto_187943 ?auto_187944 ?auto_187945 ?auto_187946 ?auto_187947 ?auto_187948 )
      ( MAKE-11PILE ?auto_187942 ?auto_187943 ?auto_187944 ?auto_187945 ?auto_187946 ?auto_187947 ?auto_187948 ?auto_187949 ?auto_187950 ?auto_187951 ?auto_187952 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_187988 - BLOCK
      ?auto_187989 - BLOCK
      ?auto_187990 - BLOCK
      ?auto_187991 - BLOCK
      ?auto_187992 - BLOCK
      ?auto_187993 - BLOCK
      ?auto_187994 - BLOCK
      ?auto_187995 - BLOCK
      ?auto_187996 - BLOCK
      ?auto_187997 - BLOCK
      ?auto_187998 - BLOCK
    )
    :vars
    (
      ?auto_187999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187998 ?auto_187999 ) ( ON-TABLE ?auto_187988 ) ( ON ?auto_187989 ?auto_187988 ) ( ON ?auto_187990 ?auto_187989 ) ( ON ?auto_187991 ?auto_187990 ) ( ON ?auto_187992 ?auto_187991 ) ( not ( = ?auto_187988 ?auto_187989 ) ) ( not ( = ?auto_187988 ?auto_187990 ) ) ( not ( = ?auto_187988 ?auto_187991 ) ) ( not ( = ?auto_187988 ?auto_187992 ) ) ( not ( = ?auto_187988 ?auto_187993 ) ) ( not ( = ?auto_187988 ?auto_187994 ) ) ( not ( = ?auto_187988 ?auto_187995 ) ) ( not ( = ?auto_187988 ?auto_187996 ) ) ( not ( = ?auto_187988 ?auto_187997 ) ) ( not ( = ?auto_187988 ?auto_187998 ) ) ( not ( = ?auto_187988 ?auto_187999 ) ) ( not ( = ?auto_187989 ?auto_187990 ) ) ( not ( = ?auto_187989 ?auto_187991 ) ) ( not ( = ?auto_187989 ?auto_187992 ) ) ( not ( = ?auto_187989 ?auto_187993 ) ) ( not ( = ?auto_187989 ?auto_187994 ) ) ( not ( = ?auto_187989 ?auto_187995 ) ) ( not ( = ?auto_187989 ?auto_187996 ) ) ( not ( = ?auto_187989 ?auto_187997 ) ) ( not ( = ?auto_187989 ?auto_187998 ) ) ( not ( = ?auto_187989 ?auto_187999 ) ) ( not ( = ?auto_187990 ?auto_187991 ) ) ( not ( = ?auto_187990 ?auto_187992 ) ) ( not ( = ?auto_187990 ?auto_187993 ) ) ( not ( = ?auto_187990 ?auto_187994 ) ) ( not ( = ?auto_187990 ?auto_187995 ) ) ( not ( = ?auto_187990 ?auto_187996 ) ) ( not ( = ?auto_187990 ?auto_187997 ) ) ( not ( = ?auto_187990 ?auto_187998 ) ) ( not ( = ?auto_187990 ?auto_187999 ) ) ( not ( = ?auto_187991 ?auto_187992 ) ) ( not ( = ?auto_187991 ?auto_187993 ) ) ( not ( = ?auto_187991 ?auto_187994 ) ) ( not ( = ?auto_187991 ?auto_187995 ) ) ( not ( = ?auto_187991 ?auto_187996 ) ) ( not ( = ?auto_187991 ?auto_187997 ) ) ( not ( = ?auto_187991 ?auto_187998 ) ) ( not ( = ?auto_187991 ?auto_187999 ) ) ( not ( = ?auto_187992 ?auto_187993 ) ) ( not ( = ?auto_187992 ?auto_187994 ) ) ( not ( = ?auto_187992 ?auto_187995 ) ) ( not ( = ?auto_187992 ?auto_187996 ) ) ( not ( = ?auto_187992 ?auto_187997 ) ) ( not ( = ?auto_187992 ?auto_187998 ) ) ( not ( = ?auto_187992 ?auto_187999 ) ) ( not ( = ?auto_187993 ?auto_187994 ) ) ( not ( = ?auto_187993 ?auto_187995 ) ) ( not ( = ?auto_187993 ?auto_187996 ) ) ( not ( = ?auto_187993 ?auto_187997 ) ) ( not ( = ?auto_187993 ?auto_187998 ) ) ( not ( = ?auto_187993 ?auto_187999 ) ) ( not ( = ?auto_187994 ?auto_187995 ) ) ( not ( = ?auto_187994 ?auto_187996 ) ) ( not ( = ?auto_187994 ?auto_187997 ) ) ( not ( = ?auto_187994 ?auto_187998 ) ) ( not ( = ?auto_187994 ?auto_187999 ) ) ( not ( = ?auto_187995 ?auto_187996 ) ) ( not ( = ?auto_187995 ?auto_187997 ) ) ( not ( = ?auto_187995 ?auto_187998 ) ) ( not ( = ?auto_187995 ?auto_187999 ) ) ( not ( = ?auto_187996 ?auto_187997 ) ) ( not ( = ?auto_187996 ?auto_187998 ) ) ( not ( = ?auto_187996 ?auto_187999 ) ) ( not ( = ?auto_187997 ?auto_187998 ) ) ( not ( = ?auto_187997 ?auto_187999 ) ) ( not ( = ?auto_187998 ?auto_187999 ) ) ( ON ?auto_187997 ?auto_187998 ) ( ON ?auto_187996 ?auto_187997 ) ( ON ?auto_187995 ?auto_187996 ) ( ON ?auto_187994 ?auto_187995 ) ( CLEAR ?auto_187992 ) ( ON ?auto_187993 ?auto_187994 ) ( CLEAR ?auto_187993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187988 ?auto_187989 ?auto_187990 ?auto_187991 ?auto_187992 ?auto_187993 )
      ( MAKE-11PILE ?auto_187988 ?auto_187989 ?auto_187990 ?auto_187991 ?auto_187992 ?auto_187993 ?auto_187994 ?auto_187995 ?auto_187996 ?auto_187997 ?auto_187998 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188034 - BLOCK
      ?auto_188035 - BLOCK
      ?auto_188036 - BLOCK
      ?auto_188037 - BLOCK
      ?auto_188038 - BLOCK
      ?auto_188039 - BLOCK
      ?auto_188040 - BLOCK
      ?auto_188041 - BLOCK
      ?auto_188042 - BLOCK
      ?auto_188043 - BLOCK
      ?auto_188044 - BLOCK
    )
    :vars
    (
      ?auto_188045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188044 ?auto_188045 ) ( ON-TABLE ?auto_188034 ) ( ON ?auto_188035 ?auto_188034 ) ( ON ?auto_188036 ?auto_188035 ) ( ON ?auto_188037 ?auto_188036 ) ( not ( = ?auto_188034 ?auto_188035 ) ) ( not ( = ?auto_188034 ?auto_188036 ) ) ( not ( = ?auto_188034 ?auto_188037 ) ) ( not ( = ?auto_188034 ?auto_188038 ) ) ( not ( = ?auto_188034 ?auto_188039 ) ) ( not ( = ?auto_188034 ?auto_188040 ) ) ( not ( = ?auto_188034 ?auto_188041 ) ) ( not ( = ?auto_188034 ?auto_188042 ) ) ( not ( = ?auto_188034 ?auto_188043 ) ) ( not ( = ?auto_188034 ?auto_188044 ) ) ( not ( = ?auto_188034 ?auto_188045 ) ) ( not ( = ?auto_188035 ?auto_188036 ) ) ( not ( = ?auto_188035 ?auto_188037 ) ) ( not ( = ?auto_188035 ?auto_188038 ) ) ( not ( = ?auto_188035 ?auto_188039 ) ) ( not ( = ?auto_188035 ?auto_188040 ) ) ( not ( = ?auto_188035 ?auto_188041 ) ) ( not ( = ?auto_188035 ?auto_188042 ) ) ( not ( = ?auto_188035 ?auto_188043 ) ) ( not ( = ?auto_188035 ?auto_188044 ) ) ( not ( = ?auto_188035 ?auto_188045 ) ) ( not ( = ?auto_188036 ?auto_188037 ) ) ( not ( = ?auto_188036 ?auto_188038 ) ) ( not ( = ?auto_188036 ?auto_188039 ) ) ( not ( = ?auto_188036 ?auto_188040 ) ) ( not ( = ?auto_188036 ?auto_188041 ) ) ( not ( = ?auto_188036 ?auto_188042 ) ) ( not ( = ?auto_188036 ?auto_188043 ) ) ( not ( = ?auto_188036 ?auto_188044 ) ) ( not ( = ?auto_188036 ?auto_188045 ) ) ( not ( = ?auto_188037 ?auto_188038 ) ) ( not ( = ?auto_188037 ?auto_188039 ) ) ( not ( = ?auto_188037 ?auto_188040 ) ) ( not ( = ?auto_188037 ?auto_188041 ) ) ( not ( = ?auto_188037 ?auto_188042 ) ) ( not ( = ?auto_188037 ?auto_188043 ) ) ( not ( = ?auto_188037 ?auto_188044 ) ) ( not ( = ?auto_188037 ?auto_188045 ) ) ( not ( = ?auto_188038 ?auto_188039 ) ) ( not ( = ?auto_188038 ?auto_188040 ) ) ( not ( = ?auto_188038 ?auto_188041 ) ) ( not ( = ?auto_188038 ?auto_188042 ) ) ( not ( = ?auto_188038 ?auto_188043 ) ) ( not ( = ?auto_188038 ?auto_188044 ) ) ( not ( = ?auto_188038 ?auto_188045 ) ) ( not ( = ?auto_188039 ?auto_188040 ) ) ( not ( = ?auto_188039 ?auto_188041 ) ) ( not ( = ?auto_188039 ?auto_188042 ) ) ( not ( = ?auto_188039 ?auto_188043 ) ) ( not ( = ?auto_188039 ?auto_188044 ) ) ( not ( = ?auto_188039 ?auto_188045 ) ) ( not ( = ?auto_188040 ?auto_188041 ) ) ( not ( = ?auto_188040 ?auto_188042 ) ) ( not ( = ?auto_188040 ?auto_188043 ) ) ( not ( = ?auto_188040 ?auto_188044 ) ) ( not ( = ?auto_188040 ?auto_188045 ) ) ( not ( = ?auto_188041 ?auto_188042 ) ) ( not ( = ?auto_188041 ?auto_188043 ) ) ( not ( = ?auto_188041 ?auto_188044 ) ) ( not ( = ?auto_188041 ?auto_188045 ) ) ( not ( = ?auto_188042 ?auto_188043 ) ) ( not ( = ?auto_188042 ?auto_188044 ) ) ( not ( = ?auto_188042 ?auto_188045 ) ) ( not ( = ?auto_188043 ?auto_188044 ) ) ( not ( = ?auto_188043 ?auto_188045 ) ) ( not ( = ?auto_188044 ?auto_188045 ) ) ( ON ?auto_188043 ?auto_188044 ) ( ON ?auto_188042 ?auto_188043 ) ( ON ?auto_188041 ?auto_188042 ) ( ON ?auto_188040 ?auto_188041 ) ( ON ?auto_188039 ?auto_188040 ) ( CLEAR ?auto_188037 ) ( ON ?auto_188038 ?auto_188039 ) ( CLEAR ?auto_188038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188034 ?auto_188035 ?auto_188036 ?auto_188037 ?auto_188038 )
      ( MAKE-11PILE ?auto_188034 ?auto_188035 ?auto_188036 ?auto_188037 ?auto_188038 ?auto_188039 ?auto_188040 ?auto_188041 ?auto_188042 ?auto_188043 ?auto_188044 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188080 - BLOCK
      ?auto_188081 - BLOCK
      ?auto_188082 - BLOCK
      ?auto_188083 - BLOCK
      ?auto_188084 - BLOCK
      ?auto_188085 - BLOCK
      ?auto_188086 - BLOCK
      ?auto_188087 - BLOCK
      ?auto_188088 - BLOCK
      ?auto_188089 - BLOCK
      ?auto_188090 - BLOCK
    )
    :vars
    (
      ?auto_188091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188090 ?auto_188091 ) ( ON-TABLE ?auto_188080 ) ( ON ?auto_188081 ?auto_188080 ) ( ON ?auto_188082 ?auto_188081 ) ( not ( = ?auto_188080 ?auto_188081 ) ) ( not ( = ?auto_188080 ?auto_188082 ) ) ( not ( = ?auto_188080 ?auto_188083 ) ) ( not ( = ?auto_188080 ?auto_188084 ) ) ( not ( = ?auto_188080 ?auto_188085 ) ) ( not ( = ?auto_188080 ?auto_188086 ) ) ( not ( = ?auto_188080 ?auto_188087 ) ) ( not ( = ?auto_188080 ?auto_188088 ) ) ( not ( = ?auto_188080 ?auto_188089 ) ) ( not ( = ?auto_188080 ?auto_188090 ) ) ( not ( = ?auto_188080 ?auto_188091 ) ) ( not ( = ?auto_188081 ?auto_188082 ) ) ( not ( = ?auto_188081 ?auto_188083 ) ) ( not ( = ?auto_188081 ?auto_188084 ) ) ( not ( = ?auto_188081 ?auto_188085 ) ) ( not ( = ?auto_188081 ?auto_188086 ) ) ( not ( = ?auto_188081 ?auto_188087 ) ) ( not ( = ?auto_188081 ?auto_188088 ) ) ( not ( = ?auto_188081 ?auto_188089 ) ) ( not ( = ?auto_188081 ?auto_188090 ) ) ( not ( = ?auto_188081 ?auto_188091 ) ) ( not ( = ?auto_188082 ?auto_188083 ) ) ( not ( = ?auto_188082 ?auto_188084 ) ) ( not ( = ?auto_188082 ?auto_188085 ) ) ( not ( = ?auto_188082 ?auto_188086 ) ) ( not ( = ?auto_188082 ?auto_188087 ) ) ( not ( = ?auto_188082 ?auto_188088 ) ) ( not ( = ?auto_188082 ?auto_188089 ) ) ( not ( = ?auto_188082 ?auto_188090 ) ) ( not ( = ?auto_188082 ?auto_188091 ) ) ( not ( = ?auto_188083 ?auto_188084 ) ) ( not ( = ?auto_188083 ?auto_188085 ) ) ( not ( = ?auto_188083 ?auto_188086 ) ) ( not ( = ?auto_188083 ?auto_188087 ) ) ( not ( = ?auto_188083 ?auto_188088 ) ) ( not ( = ?auto_188083 ?auto_188089 ) ) ( not ( = ?auto_188083 ?auto_188090 ) ) ( not ( = ?auto_188083 ?auto_188091 ) ) ( not ( = ?auto_188084 ?auto_188085 ) ) ( not ( = ?auto_188084 ?auto_188086 ) ) ( not ( = ?auto_188084 ?auto_188087 ) ) ( not ( = ?auto_188084 ?auto_188088 ) ) ( not ( = ?auto_188084 ?auto_188089 ) ) ( not ( = ?auto_188084 ?auto_188090 ) ) ( not ( = ?auto_188084 ?auto_188091 ) ) ( not ( = ?auto_188085 ?auto_188086 ) ) ( not ( = ?auto_188085 ?auto_188087 ) ) ( not ( = ?auto_188085 ?auto_188088 ) ) ( not ( = ?auto_188085 ?auto_188089 ) ) ( not ( = ?auto_188085 ?auto_188090 ) ) ( not ( = ?auto_188085 ?auto_188091 ) ) ( not ( = ?auto_188086 ?auto_188087 ) ) ( not ( = ?auto_188086 ?auto_188088 ) ) ( not ( = ?auto_188086 ?auto_188089 ) ) ( not ( = ?auto_188086 ?auto_188090 ) ) ( not ( = ?auto_188086 ?auto_188091 ) ) ( not ( = ?auto_188087 ?auto_188088 ) ) ( not ( = ?auto_188087 ?auto_188089 ) ) ( not ( = ?auto_188087 ?auto_188090 ) ) ( not ( = ?auto_188087 ?auto_188091 ) ) ( not ( = ?auto_188088 ?auto_188089 ) ) ( not ( = ?auto_188088 ?auto_188090 ) ) ( not ( = ?auto_188088 ?auto_188091 ) ) ( not ( = ?auto_188089 ?auto_188090 ) ) ( not ( = ?auto_188089 ?auto_188091 ) ) ( not ( = ?auto_188090 ?auto_188091 ) ) ( ON ?auto_188089 ?auto_188090 ) ( ON ?auto_188088 ?auto_188089 ) ( ON ?auto_188087 ?auto_188088 ) ( ON ?auto_188086 ?auto_188087 ) ( ON ?auto_188085 ?auto_188086 ) ( ON ?auto_188084 ?auto_188085 ) ( CLEAR ?auto_188082 ) ( ON ?auto_188083 ?auto_188084 ) ( CLEAR ?auto_188083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188080 ?auto_188081 ?auto_188082 ?auto_188083 )
      ( MAKE-11PILE ?auto_188080 ?auto_188081 ?auto_188082 ?auto_188083 ?auto_188084 ?auto_188085 ?auto_188086 ?auto_188087 ?auto_188088 ?auto_188089 ?auto_188090 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188126 - BLOCK
      ?auto_188127 - BLOCK
      ?auto_188128 - BLOCK
      ?auto_188129 - BLOCK
      ?auto_188130 - BLOCK
      ?auto_188131 - BLOCK
      ?auto_188132 - BLOCK
      ?auto_188133 - BLOCK
      ?auto_188134 - BLOCK
      ?auto_188135 - BLOCK
      ?auto_188136 - BLOCK
    )
    :vars
    (
      ?auto_188137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188136 ?auto_188137 ) ( ON-TABLE ?auto_188126 ) ( ON ?auto_188127 ?auto_188126 ) ( not ( = ?auto_188126 ?auto_188127 ) ) ( not ( = ?auto_188126 ?auto_188128 ) ) ( not ( = ?auto_188126 ?auto_188129 ) ) ( not ( = ?auto_188126 ?auto_188130 ) ) ( not ( = ?auto_188126 ?auto_188131 ) ) ( not ( = ?auto_188126 ?auto_188132 ) ) ( not ( = ?auto_188126 ?auto_188133 ) ) ( not ( = ?auto_188126 ?auto_188134 ) ) ( not ( = ?auto_188126 ?auto_188135 ) ) ( not ( = ?auto_188126 ?auto_188136 ) ) ( not ( = ?auto_188126 ?auto_188137 ) ) ( not ( = ?auto_188127 ?auto_188128 ) ) ( not ( = ?auto_188127 ?auto_188129 ) ) ( not ( = ?auto_188127 ?auto_188130 ) ) ( not ( = ?auto_188127 ?auto_188131 ) ) ( not ( = ?auto_188127 ?auto_188132 ) ) ( not ( = ?auto_188127 ?auto_188133 ) ) ( not ( = ?auto_188127 ?auto_188134 ) ) ( not ( = ?auto_188127 ?auto_188135 ) ) ( not ( = ?auto_188127 ?auto_188136 ) ) ( not ( = ?auto_188127 ?auto_188137 ) ) ( not ( = ?auto_188128 ?auto_188129 ) ) ( not ( = ?auto_188128 ?auto_188130 ) ) ( not ( = ?auto_188128 ?auto_188131 ) ) ( not ( = ?auto_188128 ?auto_188132 ) ) ( not ( = ?auto_188128 ?auto_188133 ) ) ( not ( = ?auto_188128 ?auto_188134 ) ) ( not ( = ?auto_188128 ?auto_188135 ) ) ( not ( = ?auto_188128 ?auto_188136 ) ) ( not ( = ?auto_188128 ?auto_188137 ) ) ( not ( = ?auto_188129 ?auto_188130 ) ) ( not ( = ?auto_188129 ?auto_188131 ) ) ( not ( = ?auto_188129 ?auto_188132 ) ) ( not ( = ?auto_188129 ?auto_188133 ) ) ( not ( = ?auto_188129 ?auto_188134 ) ) ( not ( = ?auto_188129 ?auto_188135 ) ) ( not ( = ?auto_188129 ?auto_188136 ) ) ( not ( = ?auto_188129 ?auto_188137 ) ) ( not ( = ?auto_188130 ?auto_188131 ) ) ( not ( = ?auto_188130 ?auto_188132 ) ) ( not ( = ?auto_188130 ?auto_188133 ) ) ( not ( = ?auto_188130 ?auto_188134 ) ) ( not ( = ?auto_188130 ?auto_188135 ) ) ( not ( = ?auto_188130 ?auto_188136 ) ) ( not ( = ?auto_188130 ?auto_188137 ) ) ( not ( = ?auto_188131 ?auto_188132 ) ) ( not ( = ?auto_188131 ?auto_188133 ) ) ( not ( = ?auto_188131 ?auto_188134 ) ) ( not ( = ?auto_188131 ?auto_188135 ) ) ( not ( = ?auto_188131 ?auto_188136 ) ) ( not ( = ?auto_188131 ?auto_188137 ) ) ( not ( = ?auto_188132 ?auto_188133 ) ) ( not ( = ?auto_188132 ?auto_188134 ) ) ( not ( = ?auto_188132 ?auto_188135 ) ) ( not ( = ?auto_188132 ?auto_188136 ) ) ( not ( = ?auto_188132 ?auto_188137 ) ) ( not ( = ?auto_188133 ?auto_188134 ) ) ( not ( = ?auto_188133 ?auto_188135 ) ) ( not ( = ?auto_188133 ?auto_188136 ) ) ( not ( = ?auto_188133 ?auto_188137 ) ) ( not ( = ?auto_188134 ?auto_188135 ) ) ( not ( = ?auto_188134 ?auto_188136 ) ) ( not ( = ?auto_188134 ?auto_188137 ) ) ( not ( = ?auto_188135 ?auto_188136 ) ) ( not ( = ?auto_188135 ?auto_188137 ) ) ( not ( = ?auto_188136 ?auto_188137 ) ) ( ON ?auto_188135 ?auto_188136 ) ( ON ?auto_188134 ?auto_188135 ) ( ON ?auto_188133 ?auto_188134 ) ( ON ?auto_188132 ?auto_188133 ) ( ON ?auto_188131 ?auto_188132 ) ( ON ?auto_188130 ?auto_188131 ) ( ON ?auto_188129 ?auto_188130 ) ( CLEAR ?auto_188127 ) ( ON ?auto_188128 ?auto_188129 ) ( CLEAR ?auto_188128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188126 ?auto_188127 ?auto_188128 )
      ( MAKE-11PILE ?auto_188126 ?auto_188127 ?auto_188128 ?auto_188129 ?auto_188130 ?auto_188131 ?auto_188132 ?auto_188133 ?auto_188134 ?auto_188135 ?auto_188136 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188172 - BLOCK
      ?auto_188173 - BLOCK
      ?auto_188174 - BLOCK
      ?auto_188175 - BLOCK
      ?auto_188176 - BLOCK
      ?auto_188177 - BLOCK
      ?auto_188178 - BLOCK
      ?auto_188179 - BLOCK
      ?auto_188180 - BLOCK
      ?auto_188181 - BLOCK
      ?auto_188182 - BLOCK
    )
    :vars
    (
      ?auto_188183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188182 ?auto_188183 ) ( ON-TABLE ?auto_188172 ) ( not ( = ?auto_188172 ?auto_188173 ) ) ( not ( = ?auto_188172 ?auto_188174 ) ) ( not ( = ?auto_188172 ?auto_188175 ) ) ( not ( = ?auto_188172 ?auto_188176 ) ) ( not ( = ?auto_188172 ?auto_188177 ) ) ( not ( = ?auto_188172 ?auto_188178 ) ) ( not ( = ?auto_188172 ?auto_188179 ) ) ( not ( = ?auto_188172 ?auto_188180 ) ) ( not ( = ?auto_188172 ?auto_188181 ) ) ( not ( = ?auto_188172 ?auto_188182 ) ) ( not ( = ?auto_188172 ?auto_188183 ) ) ( not ( = ?auto_188173 ?auto_188174 ) ) ( not ( = ?auto_188173 ?auto_188175 ) ) ( not ( = ?auto_188173 ?auto_188176 ) ) ( not ( = ?auto_188173 ?auto_188177 ) ) ( not ( = ?auto_188173 ?auto_188178 ) ) ( not ( = ?auto_188173 ?auto_188179 ) ) ( not ( = ?auto_188173 ?auto_188180 ) ) ( not ( = ?auto_188173 ?auto_188181 ) ) ( not ( = ?auto_188173 ?auto_188182 ) ) ( not ( = ?auto_188173 ?auto_188183 ) ) ( not ( = ?auto_188174 ?auto_188175 ) ) ( not ( = ?auto_188174 ?auto_188176 ) ) ( not ( = ?auto_188174 ?auto_188177 ) ) ( not ( = ?auto_188174 ?auto_188178 ) ) ( not ( = ?auto_188174 ?auto_188179 ) ) ( not ( = ?auto_188174 ?auto_188180 ) ) ( not ( = ?auto_188174 ?auto_188181 ) ) ( not ( = ?auto_188174 ?auto_188182 ) ) ( not ( = ?auto_188174 ?auto_188183 ) ) ( not ( = ?auto_188175 ?auto_188176 ) ) ( not ( = ?auto_188175 ?auto_188177 ) ) ( not ( = ?auto_188175 ?auto_188178 ) ) ( not ( = ?auto_188175 ?auto_188179 ) ) ( not ( = ?auto_188175 ?auto_188180 ) ) ( not ( = ?auto_188175 ?auto_188181 ) ) ( not ( = ?auto_188175 ?auto_188182 ) ) ( not ( = ?auto_188175 ?auto_188183 ) ) ( not ( = ?auto_188176 ?auto_188177 ) ) ( not ( = ?auto_188176 ?auto_188178 ) ) ( not ( = ?auto_188176 ?auto_188179 ) ) ( not ( = ?auto_188176 ?auto_188180 ) ) ( not ( = ?auto_188176 ?auto_188181 ) ) ( not ( = ?auto_188176 ?auto_188182 ) ) ( not ( = ?auto_188176 ?auto_188183 ) ) ( not ( = ?auto_188177 ?auto_188178 ) ) ( not ( = ?auto_188177 ?auto_188179 ) ) ( not ( = ?auto_188177 ?auto_188180 ) ) ( not ( = ?auto_188177 ?auto_188181 ) ) ( not ( = ?auto_188177 ?auto_188182 ) ) ( not ( = ?auto_188177 ?auto_188183 ) ) ( not ( = ?auto_188178 ?auto_188179 ) ) ( not ( = ?auto_188178 ?auto_188180 ) ) ( not ( = ?auto_188178 ?auto_188181 ) ) ( not ( = ?auto_188178 ?auto_188182 ) ) ( not ( = ?auto_188178 ?auto_188183 ) ) ( not ( = ?auto_188179 ?auto_188180 ) ) ( not ( = ?auto_188179 ?auto_188181 ) ) ( not ( = ?auto_188179 ?auto_188182 ) ) ( not ( = ?auto_188179 ?auto_188183 ) ) ( not ( = ?auto_188180 ?auto_188181 ) ) ( not ( = ?auto_188180 ?auto_188182 ) ) ( not ( = ?auto_188180 ?auto_188183 ) ) ( not ( = ?auto_188181 ?auto_188182 ) ) ( not ( = ?auto_188181 ?auto_188183 ) ) ( not ( = ?auto_188182 ?auto_188183 ) ) ( ON ?auto_188181 ?auto_188182 ) ( ON ?auto_188180 ?auto_188181 ) ( ON ?auto_188179 ?auto_188180 ) ( ON ?auto_188178 ?auto_188179 ) ( ON ?auto_188177 ?auto_188178 ) ( ON ?auto_188176 ?auto_188177 ) ( ON ?auto_188175 ?auto_188176 ) ( ON ?auto_188174 ?auto_188175 ) ( CLEAR ?auto_188172 ) ( ON ?auto_188173 ?auto_188174 ) ( CLEAR ?auto_188173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188172 ?auto_188173 )
      ( MAKE-11PILE ?auto_188172 ?auto_188173 ?auto_188174 ?auto_188175 ?auto_188176 ?auto_188177 ?auto_188178 ?auto_188179 ?auto_188180 ?auto_188181 ?auto_188182 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_188218 - BLOCK
      ?auto_188219 - BLOCK
      ?auto_188220 - BLOCK
      ?auto_188221 - BLOCK
      ?auto_188222 - BLOCK
      ?auto_188223 - BLOCK
      ?auto_188224 - BLOCK
      ?auto_188225 - BLOCK
      ?auto_188226 - BLOCK
      ?auto_188227 - BLOCK
      ?auto_188228 - BLOCK
    )
    :vars
    (
      ?auto_188229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188228 ?auto_188229 ) ( not ( = ?auto_188218 ?auto_188219 ) ) ( not ( = ?auto_188218 ?auto_188220 ) ) ( not ( = ?auto_188218 ?auto_188221 ) ) ( not ( = ?auto_188218 ?auto_188222 ) ) ( not ( = ?auto_188218 ?auto_188223 ) ) ( not ( = ?auto_188218 ?auto_188224 ) ) ( not ( = ?auto_188218 ?auto_188225 ) ) ( not ( = ?auto_188218 ?auto_188226 ) ) ( not ( = ?auto_188218 ?auto_188227 ) ) ( not ( = ?auto_188218 ?auto_188228 ) ) ( not ( = ?auto_188218 ?auto_188229 ) ) ( not ( = ?auto_188219 ?auto_188220 ) ) ( not ( = ?auto_188219 ?auto_188221 ) ) ( not ( = ?auto_188219 ?auto_188222 ) ) ( not ( = ?auto_188219 ?auto_188223 ) ) ( not ( = ?auto_188219 ?auto_188224 ) ) ( not ( = ?auto_188219 ?auto_188225 ) ) ( not ( = ?auto_188219 ?auto_188226 ) ) ( not ( = ?auto_188219 ?auto_188227 ) ) ( not ( = ?auto_188219 ?auto_188228 ) ) ( not ( = ?auto_188219 ?auto_188229 ) ) ( not ( = ?auto_188220 ?auto_188221 ) ) ( not ( = ?auto_188220 ?auto_188222 ) ) ( not ( = ?auto_188220 ?auto_188223 ) ) ( not ( = ?auto_188220 ?auto_188224 ) ) ( not ( = ?auto_188220 ?auto_188225 ) ) ( not ( = ?auto_188220 ?auto_188226 ) ) ( not ( = ?auto_188220 ?auto_188227 ) ) ( not ( = ?auto_188220 ?auto_188228 ) ) ( not ( = ?auto_188220 ?auto_188229 ) ) ( not ( = ?auto_188221 ?auto_188222 ) ) ( not ( = ?auto_188221 ?auto_188223 ) ) ( not ( = ?auto_188221 ?auto_188224 ) ) ( not ( = ?auto_188221 ?auto_188225 ) ) ( not ( = ?auto_188221 ?auto_188226 ) ) ( not ( = ?auto_188221 ?auto_188227 ) ) ( not ( = ?auto_188221 ?auto_188228 ) ) ( not ( = ?auto_188221 ?auto_188229 ) ) ( not ( = ?auto_188222 ?auto_188223 ) ) ( not ( = ?auto_188222 ?auto_188224 ) ) ( not ( = ?auto_188222 ?auto_188225 ) ) ( not ( = ?auto_188222 ?auto_188226 ) ) ( not ( = ?auto_188222 ?auto_188227 ) ) ( not ( = ?auto_188222 ?auto_188228 ) ) ( not ( = ?auto_188222 ?auto_188229 ) ) ( not ( = ?auto_188223 ?auto_188224 ) ) ( not ( = ?auto_188223 ?auto_188225 ) ) ( not ( = ?auto_188223 ?auto_188226 ) ) ( not ( = ?auto_188223 ?auto_188227 ) ) ( not ( = ?auto_188223 ?auto_188228 ) ) ( not ( = ?auto_188223 ?auto_188229 ) ) ( not ( = ?auto_188224 ?auto_188225 ) ) ( not ( = ?auto_188224 ?auto_188226 ) ) ( not ( = ?auto_188224 ?auto_188227 ) ) ( not ( = ?auto_188224 ?auto_188228 ) ) ( not ( = ?auto_188224 ?auto_188229 ) ) ( not ( = ?auto_188225 ?auto_188226 ) ) ( not ( = ?auto_188225 ?auto_188227 ) ) ( not ( = ?auto_188225 ?auto_188228 ) ) ( not ( = ?auto_188225 ?auto_188229 ) ) ( not ( = ?auto_188226 ?auto_188227 ) ) ( not ( = ?auto_188226 ?auto_188228 ) ) ( not ( = ?auto_188226 ?auto_188229 ) ) ( not ( = ?auto_188227 ?auto_188228 ) ) ( not ( = ?auto_188227 ?auto_188229 ) ) ( not ( = ?auto_188228 ?auto_188229 ) ) ( ON ?auto_188227 ?auto_188228 ) ( ON ?auto_188226 ?auto_188227 ) ( ON ?auto_188225 ?auto_188226 ) ( ON ?auto_188224 ?auto_188225 ) ( ON ?auto_188223 ?auto_188224 ) ( ON ?auto_188222 ?auto_188223 ) ( ON ?auto_188221 ?auto_188222 ) ( ON ?auto_188220 ?auto_188221 ) ( ON ?auto_188219 ?auto_188220 ) ( ON ?auto_188218 ?auto_188219 ) ( CLEAR ?auto_188218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188218 )
      ( MAKE-11PILE ?auto_188218 ?auto_188219 ?auto_188220 ?auto_188221 ?auto_188222 ?auto_188223 ?auto_188224 ?auto_188225 ?auto_188226 ?auto_188227 ?auto_188228 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188265 - BLOCK
      ?auto_188266 - BLOCK
      ?auto_188267 - BLOCK
      ?auto_188268 - BLOCK
      ?auto_188269 - BLOCK
      ?auto_188270 - BLOCK
      ?auto_188271 - BLOCK
      ?auto_188272 - BLOCK
      ?auto_188273 - BLOCK
      ?auto_188274 - BLOCK
      ?auto_188275 - BLOCK
      ?auto_188276 - BLOCK
    )
    :vars
    (
      ?auto_188277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188275 ) ( ON ?auto_188276 ?auto_188277 ) ( CLEAR ?auto_188276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188265 ) ( ON ?auto_188266 ?auto_188265 ) ( ON ?auto_188267 ?auto_188266 ) ( ON ?auto_188268 ?auto_188267 ) ( ON ?auto_188269 ?auto_188268 ) ( ON ?auto_188270 ?auto_188269 ) ( ON ?auto_188271 ?auto_188270 ) ( ON ?auto_188272 ?auto_188271 ) ( ON ?auto_188273 ?auto_188272 ) ( ON ?auto_188274 ?auto_188273 ) ( ON ?auto_188275 ?auto_188274 ) ( not ( = ?auto_188265 ?auto_188266 ) ) ( not ( = ?auto_188265 ?auto_188267 ) ) ( not ( = ?auto_188265 ?auto_188268 ) ) ( not ( = ?auto_188265 ?auto_188269 ) ) ( not ( = ?auto_188265 ?auto_188270 ) ) ( not ( = ?auto_188265 ?auto_188271 ) ) ( not ( = ?auto_188265 ?auto_188272 ) ) ( not ( = ?auto_188265 ?auto_188273 ) ) ( not ( = ?auto_188265 ?auto_188274 ) ) ( not ( = ?auto_188265 ?auto_188275 ) ) ( not ( = ?auto_188265 ?auto_188276 ) ) ( not ( = ?auto_188265 ?auto_188277 ) ) ( not ( = ?auto_188266 ?auto_188267 ) ) ( not ( = ?auto_188266 ?auto_188268 ) ) ( not ( = ?auto_188266 ?auto_188269 ) ) ( not ( = ?auto_188266 ?auto_188270 ) ) ( not ( = ?auto_188266 ?auto_188271 ) ) ( not ( = ?auto_188266 ?auto_188272 ) ) ( not ( = ?auto_188266 ?auto_188273 ) ) ( not ( = ?auto_188266 ?auto_188274 ) ) ( not ( = ?auto_188266 ?auto_188275 ) ) ( not ( = ?auto_188266 ?auto_188276 ) ) ( not ( = ?auto_188266 ?auto_188277 ) ) ( not ( = ?auto_188267 ?auto_188268 ) ) ( not ( = ?auto_188267 ?auto_188269 ) ) ( not ( = ?auto_188267 ?auto_188270 ) ) ( not ( = ?auto_188267 ?auto_188271 ) ) ( not ( = ?auto_188267 ?auto_188272 ) ) ( not ( = ?auto_188267 ?auto_188273 ) ) ( not ( = ?auto_188267 ?auto_188274 ) ) ( not ( = ?auto_188267 ?auto_188275 ) ) ( not ( = ?auto_188267 ?auto_188276 ) ) ( not ( = ?auto_188267 ?auto_188277 ) ) ( not ( = ?auto_188268 ?auto_188269 ) ) ( not ( = ?auto_188268 ?auto_188270 ) ) ( not ( = ?auto_188268 ?auto_188271 ) ) ( not ( = ?auto_188268 ?auto_188272 ) ) ( not ( = ?auto_188268 ?auto_188273 ) ) ( not ( = ?auto_188268 ?auto_188274 ) ) ( not ( = ?auto_188268 ?auto_188275 ) ) ( not ( = ?auto_188268 ?auto_188276 ) ) ( not ( = ?auto_188268 ?auto_188277 ) ) ( not ( = ?auto_188269 ?auto_188270 ) ) ( not ( = ?auto_188269 ?auto_188271 ) ) ( not ( = ?auto_188269 ?auto_188272 ) ) ( not ( = ?auto_188269 ?auto_188273 ) ) ( not ( = ?auto_188269 ?auto_188274 ) ) ( not ( = ?auto_188269 ?auto_188275 ) ) ( not ( = ?auto_188269 ?auto_188276 ) ) ( not ( = ?auto_188269 ?auto_188277 ) ) ( not ( = ?auto_188270 ?auto_188271 ) ) ( not ( = ?auto_188270 ?auto_188272 ) ) ( not ( = ?auto_188270 ?auto_188273 ) ) ( not ( = ?auto_188270 ?auto_188274 ) ) ( not ( = ?auto_188270 ?auto_188275 ) ) ( not ( = ?auto_188270 ?auto_188276 ) ) ( not ( = ?auto_188270 ?auto_188277 ) ) ( not ( = ?auto_188271 ?auto_188272 ) ) ( not ( = ?auto_188271 ?auto_188273 ) ) ( not ( = ?auto_188271 ?auto_188274 ) ) ( not ( = ?auto_188271 ?auto_188275 ) ) ( not ( = ?auto_188271 ?auto_188276 ) ) ( not ( = ?auto_188271 ?auto_188277 ) ) ( not ( = ?auto_188272 ?auto_188273 ) ) ( not ( = ?auto_188272 ?auto_188274 ) ) ( not ( = ?auto_188272 ?auto_188275 ) ) ( not ( = ?auto_188272 ?auto_188276 ) ) ( not ( = ?auto_188272 ?auto_188277 ) ) ( not ( = ?auto_188273 ?auto_188274 ) ) ( not ( = ?auto_188273 ?auto_188275 ) ) ( not ( = ?auto_188273 ?auto_188276 ) ) ( not ( = ?auto_188273 ?auto_188277 ) ) ( not ( = ?auto_188274 ?auto_188275 ) ) ( not ( = ?auto_188274 ?auto_188276 ) ) ( not ( = ?auto_188274 ?auto_188277 ) ) ( not ( = ?auto_188275 ?auto_188276 ) ) ( not ( = ?auto_188275 ?auto_188277 ) ) ( not ( = ?auto_188276 ?auto_188277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188276 ?auto_188277 )
      ( !STACK ?auto_188276 ?auto_188275 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188290 - BLOCK
      ?auto_188291 - BLOCK
      ?auto_188292 - BLOCK
      ?auto_188293 - BLOCK
      ?auto_188294 - BLOCK
      ?auto_188295 - BLOCK
      ?auto_188296 - BLOCK
      ?auto_188297 - BLOCK
      ?auto_188298 - BLOCK
      ?auto_188299 - BLOCK
      ?auto_188300 - BLOCK
      ?auto_188301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188300 ) ( ON-TABLE ?auto_188301 ) ( CLEAR ?auto_188301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188290 ) ( ON ?auto_188291 ?auto_188290 ) ( ON ?auto_188292 ?auto_188291 ) ( ON ?auto_188293 ?auto_188292 ) ( ON ?auto_188294 ?auto_188293 ) ( ON ?auto_188295 ?auto_188294 ) ( ON ?auto_188296 ?auto_188295 ) ( ON ?auto_188297 ?auto_188296 ) ( ON ?auto_188298 ?auto_188297 ) ( ON ?auto_188299 ?auto_188298 ) ( ON ?auto_188300 ?auto_188299 ) ( not ( = ?auto_188290 ?auto_188291 ) ) ( not ( = ?auto_188290 ?auto_188292 ) ) ( not ( = ?auto_188290 ?auto_188293 ) ) ( not ( = ?auto_188290 ?auto_188294 ) ) ( not ( = ?auto_188290 ?auto_188295 ) ) ( not ( = ?auto_188290 ?auto_188296 ) ) ( not ( = ?auto_188290 ?auto_188297 ) ) ( not ( = ?auto_188290 ?auto_188298 ) ) ( not ( = ?auto_188290 ?auto_188299 ) ) ( not ( = ?auto_188290 ?auto_188300 ) ) ( not ( = ?auto_188290 ?auto_188301 ) ) ( not ( = ?auto_188291 ?auto_188292 ) ) ( not ( = ?auto_188291 ?auto_188293 ) ) ( not ( = ?auto_188291 ?auto_188294 ) ) ( not ( = ?auto_188291 ?auto_188295 ) ) ( not ( = ?auto_188291 ?auto_188296 ) ) ( not ( = ?auto_188291 ?auto_188297 ) ) ( not ( = ?auto_188291 ?auto_188298 ) ) ( not ( = ?auto_188291 ?auto_188299 ) ) ( not ( = ?auto_188291 ?auto_188300 ) ) ( not ( = ?auto_188291 ?auto_188301 ) ) ( not ( = ?auto_188292 ?auto_188293 ) ) ( not ( = ?auto_188292 ?auto_188294 ) ) ( not ( = ?auto_188292 ?auto_188295 ) ) ( not ( = ?auto_188292 ?auto_188296 ) ) ( not ( = ?auto_188292 ?auto_188297 ) ) ( not ( = ?auto_188292 ?auto_188298 ) ) ( not ( = ?auto_188292 ?auto_188299 ) ) ( not ( = ?auto_188292 ?auto_188300 ) ) ( not ( = ?auto_188292 ?auto_188301 ) ) ( not ( = ?auto_188293 ?auto_188294 ) ) ( not ( = ?auto_188293 ?auto_188295 ) ) ( not ( = ?auto_188293 ?auto_188296 ) ) ( not ( = ?auto_188293 ?auto_188297 ) ) ( not ( = ?auto_188293 ?auto_188298 ) ) ( not ( = ?auto_188293 ?auto_188299 ) ) ( not ( = ?auto_188293 ?auto_188300 ) ) ( not ( = ?auto_188293 ?auto_188301 ) ) ( not ( = ?auto_188294 ?auto_188295 ) ) ( not ( = ?auto_188294 ?auto_188296 ) ) ( not ( = ?auto_188294 ?auto_188297 ) ) ( not ( = ?auto_188294 ?auto_188298 ) ) ( not ( = ?auto_188294 ?auto_188299 ) ) ( not ( = ?auto_188294 ?auto_188300 ) ) ( not ( = ?auto_188294 ?auto_188301 ) ) ( not ( = ?auto_188295 ?auto_188296 ) ) ( not ( = ?auto_188295 ?auto_188297 ) ) ( not ( = ?auto_188295 ?auto_188298 ) ) ( not ( = ?auto_188295 ?auto_188299 ) ) ( not ( = ?auto_188295 ?auto_188300 ) ) ( not ( = ?auto_188295 ?auto_188301 ) ) ( not ( = ?auto_188296 ?auto_188297 ) ) ( not ( = ?auto_188296 ?auto_188298 ) ) ( not ( = ?auto_188296 ?auto_188299 ) ) ( not ( = ?auto_188296 ?auto_188300 ) ) ( not ( = ?auto_188296 ?auto_188301 ) ) ( not ( = ?auto_188297 ?auto_188298 ) ) ( not ( = ?auto_188297 ?auto_188299 ) ) ( not ( = ?auto_188297 ?auto_188300 ) ) ( not ( = ?auto_188297 ?auto_188301 ) ) ( not ( = ?auto_188298 ?auto_188299 ) ) ( not ( = ?auto_188298 ?auto_188300 ) ) ( not ( = ?auto_188298 ?auto_188301 ) ) ( not ( = ?auto_188299 ?auto_188300 ) ) ( not ( = ?auto_188299 ?auto_188301 ) ) ( not ( = ?auto_188300 ?auto_188301 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_188301 )
      ( !STACK ?auto_188301 ?auto_188300 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188314 - BLOCK
      ?auto_188315 - BLOCK
      ?auto_188316 - BLOCK
      ?auto_188317 - BLOCK
      ?auto_188318 - BLOCK
      ?auto_188319 - BLOCK
      ?auto_188320 - BLOCK
      ?auto_188321 - BLOCK
      ?auto_188322 - BLOCK
      ?auto_188323 - BLOCK
      ?auto_188324 - BLOCK
      ?auto_188325 - BLOCK
    )
    :vars
    (
      ?auto_188326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188325 ?auto_188326 ) ( ON-TABLE ?auto_188314 ) ( ON ?auto_188315 ?auto_188314 ) ( ON ?auto_188316 ?auto_188315 ) ( ON ?auto_188317 ?auto_188316 ) ( ON ?auto_188318 ?auto_188317 ) ( ON ?auto_188319 ?auto_188318 ) ( ON ?auto_188320 ?auto_188319 ) ( ON ?auto_188321 ?auto_188320 ) ( ON ?auto_188322 ?auto_188321 ) ( ON ?auto_188323 ?auto_188322 ) ( not ( = ?auto_188314 ?auto_188315 ) ) ( not ( = ?auto_188314 ?auto_188316 ) ) ( not ( = ?auto_188314 ?auto_188317 ) ) ( not ( = ?auto_188314 ?auto_188318 ) ) ( not ( = ?auto_188314 ?auto_188319 ) ) ( not ( = ?auto_188314 ?auto_188320 ) ) ( not ( = ?auto_188314 ?auto_188321 ) ) ( not ( = ?auto_188314 ?auto_188322 ) ) ( not ( = ?auto_188314 ?auto_188323 ) ) ( not ( = ?auto_188314 ?auto_188324 ) ) ( not ( = ?auto_188314 ?auto_188325 ) ) ( not ( = ?auto_188314 ?auto_188326 ) ) ( not ( = ?auto_188315 ?auto_188316 ) ) ( not ( = ?auto_188315 ?auto_188317 ) ) ( not ( = ?auto_188315 ?auto_188318 ) ) ( not ( = ?auto_188315 ?auto_188319 ) ) ( not ( = ?auto_188315 ?auto_188320 ) ) ( not ( = ?auto_188315 ?auto_188321 ) ) ( not ( = ?auto_188315 ?auto_188322 ) ) ( not ( = ?auto_188315 ?auto_188323 ) ) ( not ( = ?auto_188315 ?auto_188324 ) ) ( not ( = ?auto_188315 ?auto_188325 ) ) ( not ( = ?auto_188315 ?auto_188326 ) ) ( not ( = ?auto_188316 ?auto_188317 ) ) ( not ( = ?auto_188316 ?auto_188318 ) ) ( not ( = ?auto_188316 ?auto_188319 ) ) ( not ( = ?auto_188316 ?auto_188320 ) ) ( not ( = ?auto_188316 ?auto_188321 ) ) ( not ( = ?auto_188316 ?auto_188322 ) ) ( not ( = ?auto_188316 ?auto_188323 ) ) ( not ( = ?auto_188316 ?auto_188324 ) ) ( not ( = ?auto_188316 ?auto_188325 ) ) ( not ( = ?auto_188316 ?auto_188326 ) ) ( not ( = ?auto_188317 ?auto_188318 ) ) ( not ( = ?auto_188317 ?auto_188319 ) ) ( not ( = ?auto_188317 ?auto_188320 ) ) ( not ( = ?auto_188317 ?auto_188321 ) ) ( not ( = ?auto_188317 ?auto_188322 ) ) ( not ( = ?auto_188317 ?auto_188323 ) ) ( not ( = ?auto_188317 ?auto_188324 ) ) ( not ( = ?auto_188317 ?auto_188325 ) ) ( not ( = ?auto_188317 ?auto_188326 ) ) ( not ( = ?auto_188318 ?auto_188319 ) ) ( not ( = ?auto_188318 ?auto_188320 ) ) ( not ( = ?auto_188318 ?auto_188321 ) ) ( not ( = ?auto_188318 ?auto_188322 ) ) ( not ( = ?auto_188318 ?auto_188323 ) ) ( not ( = ?auto_188318 ?auto_188324 ) ) ( not ( = ?auto_188318 ?auto_188325 ) ) ( not ( = ?auto_188318 ?auto_188326 ) ) ( not ( = ?auto_188319 ?auto_188320 ) ) ( not ( = ?auto_188319 ?auto_188321 ) ) ( not ( = ?auto_188319 ?auto_188322 ) ) ( not ( = ?auto_188319 ?auto_188323 ) ) ( not ( = ?auto_188319 ?auto_188324 ) ) ( not ( = ?auto_188319 ?auto_188325 ) ) ( not ( = ?auto_188319 ?auto_188326 ) ) ( not ( = ?auto_188320 ?auto_188321 ) ) ( not ( = ?auto_188320 ?auto_188322 ) ) ( not ( = ?auto_188320 ?auto_188323 ) ) ( not ( = ?auto_188320 ?auto_188324 ) ) ( not ( = ?auto_188320 ?auto_188325 ) ) ( not ( = ?auto_188320 ?auto_188326 ) ) ( not ( = ?auto_188321 ?auto_188322 ) ) ( not ( = ?auto_188321 ?auto_188323 ) ) ( not ( = ?auto_188321 ?auto_188324 ) ) ( not ( = ?auto_188321 ?auto_188325 ) ) ( not ( = ?auto_188321 ?auto_188326 ) ) ( not ( = ?auto_188322 ?auto_188323 ) ) ( not ( = ?auto_188322 ?auto_188324 ) ) ( not ( = ?auto_188322 ?auto_188325 ) ) ( not ( = ?auto_188322 ?auto_188326 ) ) ( not ( = ?auto_188323 ?auto_188324 ) ) ( not ( = ?auto_188323 ?auto_188325 ) ) ( not ( = ?auto_188323 ?auto_188326 ) ) ( not ( = ?auto_188324 ?auto_188325 ) ) ( not ( = ?auto_188324 ?auto_188326 ) ) ( not ( = ?auto_188325 ?auto_188326 ) ) ( CLEAR ?auto_188323 ) ( ON ?auto_188324 ?auto_188325 ) ( CLEAR ?auto_188324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_188314 ?auto_188315 ?auto_188316 ?auto_188317 ?auto_188318 ?auto_188319 ?auto_188320 ?auto_188321 ?auto_188322 ?auto_188323 ?auto_188324 )
      ( MAKE-12PILE ?auto_188314 ?auto_188315 ?auto_188316 ?auto_188317 ?auto_188318 ?auto_188319 ?auto_188320 ?auto_188321 ?auto_188322 ?auto_188323 ?auto_188324 ?auto_188325 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188339 - BLOCK
      ?auto_188340 - BLOCK
      ?auto_188341 - BLOCK
      ?auto_188342 - BLOCK
      ?auto_188343 - BLOCK
      ?auto_188344 - BLOCK
      ?auto_188345 - BLOCK
      ?auto_188346 - BLOCK
      ?auto_188347 - BLOCK
      ?auto_188348 - BLOCK
      ?auto_188349 - BLOCK
      ?auto_188350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188350 ) ( ON-TABLE ?auto_188339 ) ( ON ?auto_188340 ?auto_188339 ) ( ON ?auto_188341 ?auto_188340 ) ( ON ?auto_188342 ?auto_188341 ) ( ON ?auto_188343 ?auto_188342 ) ( ON ?auto_188344 ?auto_188343 ) ( ON ?auto_188345 ?auto_188344 ) ( ON ?auto_188346 ?auto_188345 ) ( ON ?auto_188347 ?auto_188346 ) ( ON ?auto_188348 ?auto_188347 ) ( not ( = ?auto_188339 ?auto_188340 ) ) ( not ( = ?auto_188339 ?auto_188341 ) ) ( not ( = ?auto_188339 ?auto_188342 ) ) ( not ( = ?auto_188339 ?auto_188343 ) ) ( not ( = ?auto_188339 ?auto_188344 ) ) ( not ( = ?auto_188339 ?auto_188345 ) ) ( not ( = ?auto_188339 ?auto_188346 ) ) ( not ( = ?auto_188339 ?auto_188347 ) ) ( not ( = ?auto_188339 ?auto_188348 ) ) ( not ( = ?auto_188339 ?auto_188349 ) ) ( not ( = ?auto_188339 ?auto_188350 ) ) ( not ( = ?auto_188340 ?auto_188341 ) ) ( not ( = ?auto_188340 ?auto_188342 ) ) ( not ( = ?auto_188340 ?auto_188343 ) ) ( not ( = ?auto_188340 ?auto_188344 ) ) ( not ( = ?auto_188340 ?auto_188345 ) ) ( not ( = ?auto_188340 ?auto_188346 ) ) ( not ( = ?auto_188340 ?auto_188347 ) ) ( not ( = ?auto_188340 ?auto_188348 ) ) ( not ( = ?auto_188340 ?auto_188349 ) ) ( not ( = ?auto_188340 ?auto_188350 ) ) ( not ( = ?auto_188341 ?auto_188342 ) ) ( not ( = ?auto_188341 ?auto_188343 ) ) ( not ( = ?auto_188341 ?auto_188344 ) ) ( not ( = ?auto_188341 ?auto_188345 ) ) ( not ( = ?auto_188341 ?auto_188346 ) ) ( not ( = ?auto_188341 ?auto_188347 ) ) ( not ( = ?auto_188341 ?auto_188348 ) ) ( not ( = ?auto_188341 ?auto_188349 ) ) ( not ( = ?auto_188341 ?auto_188350 ) ) ( not ( = ?auto_188342 ?auto_188343 ) ) ( not ( = ?auto_188342 ?auto_188344 ) ) ( not ( = ?auto_188342 ?auto_188345 ) ) ( not ( = ?auto_188342 ?auto_188346 ) ) ( not ( = ?auto_188342 ?auto_188347 ) ) ( not ( = ?auto_188342 ?auto_188348 ) ) ( not ( = ?auto_188342 ?auto_188349 ) ) ( not ( = ?auto_188342 ?auto_188350 ) ) ( not ( = ?auto_188343 ?auto_188344 ) ) ( not ( = ?auto_188343 ?auto_188345 ) ) ( not ( = ?auto_188343 ?auto_188346 ) ) ( not ( = ?auto_188343 ?auto_188347 ) ) ( not ( = ?auto_188343 ?auto_188348 ) ) ( not ( = ?auto_188343 ?auto_188349 ) ) ( not ( = ?auto_188343 ?auto_188350 ) ) ( not ( = ?auto_188344 ?auto_188345 ) ) ( not ( = ?auto_188344 ?auto_188346 ) ) ( not ( = ?auto_188344 ?auto_188347 ) ) ( not ( = ?auto_188344 ?auto_188348 ) ) ( not ( = ?auto_188344 ?auto_188349 ) ) ( not ( = ?auto_188344 ?auto_188350 ) ) ( not ( = ?auto_188345 ?auto_188346 ) ) ( not ( = ?auto_188345 ?auto_188347 ) ) ( not ( = ?auto_188345 ?auto_188348 ) ) ( not ( = ?auto_188345 ?auto_188349 ) ) ( not ( = ?auto_188345 ?auto_188350 ) ) ( not ( = ?auto_188346 ?auto_188347 ) ) ( not ( = ?auto_188346 ?auto_188348 ) ) ( not ( = ?auto_188346 ?auto_188349 ) ) ( not ( = ?auto_188346 ?auto_188350 ) ) ( not ( = ?auto_188347 ?auto_188348 ) ) ( not ( = ?auto_188347 ?auto_188349 ) ) ( not ( = ?auto_188347 ?auto_188350 ) ) ( not ( = ?auto_188348 ?auto_188349 ) ) ( not ( = ?auto_188348 ?auto_188350 ) ) ( not ( = ?auto_188349 ?auto_188350 ) ) ( CLEAR ?auto_188348 ) ( ON ?auto_188349 ?auto_188350 ) ( CLEAR ?auto_188349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_188339 ?auto_188340 ?auto_188341 ?auto_188342 ?auto_188343 ?auto_188344 ?auto_188345 ?auto_188346 ?auto_188347 ?auto_188348 ?auto_188349 )
      ( MAKE-12PILE ?auto_188339 ?auto_188340 ?auto_188341 ?auto_188342 ?auto_188343 ?auto_188344 ?auto_188345 ?auto_188346 ?auto_188347 ?auto_188348 ?auto_188349 ?auto_188350 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188363 - BLOCK
      ?auto_188364 - BLOCK
      ?auto_188365 - BLOCK
      ?auto_188366 - BLOCK
      ?auto_188367 - BLOCK
      ?auto_188368 - BLOCK
      ?auto_188369 - BLOCK
      ?auto_188370 - BLOCK
      ?auto_188371 - BLOCK
      ?auto_188372 - BLOCK
      ?auto_188373 - BLOCK
      ?auto_188374 - BLOCK
    )
    :vars
    (
      ?auto_188375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188374 ?auto_188375 ) ( ON-TABLE ?auto_188363 ) ( ON ?auto_188364 ?auto_188363 ) ( ON ?auto_188365 ?auto_188364 ) ( ON ?auto_188366 ?auto_188365 ) ( ON ?auto_188367 ?auto_188366 ) ( ON ?auto_188368 ?auto_188367 ) ( ON ?auto_188369 ?auto_188368 ) ( ON ?auto_188370 ?auto_188369 ) ( ON ?auto_188371 ?auto_188370 ) ( not ( = ?auto_188363 ?auto_188364 ) ) ( not ( = ?auto_188363 ?auto_188365 ) ) ( not ( = ?auto_188363 ?auto_188366 ) ) ( not ( = ?auto_188363 ?auto_188367 ) ) ( not ( = ?auto_188363 ?auto_188368 ) ) ( not ( = ?auto_188363 ?auto_188369 ) ) ( not ( = ?auto_188363 ?auto_188370 ) ) ( not ( = ?auto_188363 ?auto_188371 ) ) ( not ( = ?auto_188363 ?auto_188372 ) ) ( not ( = ?auto_188363 ?auto_188373 ) ) ( not ( = ?auto_188363 ?auto_188374 ) ) ( not ( = ?auto_188363 ?auto_188375 ) ) ( not ( = ?auto_188364 ?auto_188365 ) ) ( not ( = ?auto_188364 ?auto_188366 ) ) ( not ( = ?auto_188364 ?auto_188367 ) ) ( not ( = ?auto_188364 ?auto_188368 ) ) ( not ( = ?auto_188364 ?auto_188369 ) ) ( not ( = ?auto_188364 ?auto_188370 ) ) ( not ( = ?auto_188364 ?auto_188371 ) ) ( not ( = ?auto_188364 ?auto_188372 ) ) ( not ( = ?auto_188364 ?auto_188373 ) ) ( not ( = ?auto_188364 ?auto_188374 ) ) ( not ( = ?auto_188364 ?auto_188375 ) ) ( not ( = ?auto_188365 ?auto_188366 ) ) ( not ( = ?auto_188365 ?auto_188367 ) ) ( not ( = ?auto_188365 ?auto_188368 ) ) ( not ( = ?auto_188365 ?auto_188369 ) ) ( not ( = ?auto_188365 ?auto_188370 ) ) ( not ( = ?auto_188365 ?auto_188371 ) ) ( not ( = ?auto_188365 ?auto_188372 ) ) ( not ( = ?auto_188365 ?auto_188373 ) ) ( not ( = ?auto_188365 ?auto_188374 ) ) ( not ( = ?auto_188365 ?auto_188375 ) ) ( not ( = ?auto_188366 ?auto_188367 ) ) ( not ( = ?auto_188366 ?auto_188368 ) ) ( not ( = ?auto_188366 ?auto_188369 ) ) ( not ( = ?auto_188366 ?auto_188370 ) ) ( not ( = ?auto_188366 ?auto_188371 ) ) ( not ( = ?auto_188366 ?auto_188372 ) ) ( not ( = ?auto_188366 ?auto_188373 ) ) ( not ( = ?auto_188366 ?auto_188374 ) ) ( not ( = ?auto_188366 ?auto_188375 ) ) ( not ( = ?auto_188367 ?auto_188368 ) ) ( not ( = ?auto_188367 ?auto_188369 ) ) ( not ( = ?auto_188367 ?auto_188370 ) ) ( not ( = ?auto_188367 ?auto_188371 ) ) ( not ( = ?auto_188367 ?auto_188372 ) ) ( not ( = ?auto_188367 ?auto_188373 ) ) ( not ( = ?auto_188367 ?auto_188374 ) ) ( not ( = ?auto_188367 ?auto_188375 ) ) ( not ( = ?auto_188368 ?auto_188369 ) ) ( not ( = ?auto_188368 ?auto_188370 ) ) ( not ( = ?auto_188368 ?auto_188371 ) ) ( not ( = ?auto_188368 ?auto_188372 ) ) ( not ( = ?auto_188368 ?auto_188373 ) ) ( not ( = ?auto_188368 ?auto_188374 ) ) ( not ( = ?auto_188368 ?auto_188375 ) ) ( not ( = ?auto_188369 ?auto_188370 ) ) ( not ( = ?auto_188369 ?auto_188371 ) ) ( not ( = ?auto_188369 ?auto_188372 ) ) ( not ( = ?auto_188369 ?auto_188373 ) ) ( not ( = ?auto_188369 ?auto_188374 ) ) ( not ( = ?auto_188369 ?auto_188375 ) ) ( not ( = ?auto_188370 ?auto_188371 ) ) ( not ( = ?auto_188370 ?auto_188372 ) ) ( not ( = ?auto_188370 ?auto_188373 ) ) ( not ( = ?auto_188370 ?auto_188374 ) ) ( not ( = ?auto_188370 ?auto_188375 ) ) ( not ( = ?auto_188371 ?auto_188372 ) ) ( not ( = ?auto_188371 ?auto_188373 ) ) ( not ( = ?auto_188371 ?auto_188374 ) ) ( not ( = ?auto_188371 ?auto_188375 ) ) ( not ( = ?auto_188372 ?auto_188373 ) ) ( not ( = ?auto_188372 ?auto_188374 ) ) ( not ( = ?auto_188372 ?auto_188375 ) ) ( not ( = ?auto_188373 ?auto_188374 ) ) ( not ( = ?auto_188373 ?auto_188375 ) ) ( not ( = ?auto_188374 ?auto_188375 ) ) ( ON ?auto_188373 ?auto_188374 ) ( CLEAR ?auto_188371 ) ( ON ?auto_188372 ?auto_188373 ) ( CLEAR ?auto_188372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_188363 ?auto_188364 ?auto_188365 ?auto_188366 ?auto_188367 ?auto_188368 ?auto_188369 ?auto_188370 ?auto_188371 ?auto_188372 )
      ( MAKE-12PILE ?auto_188363 ?auto_188364 ?auto_188365 ?auto_188366 ?auto_188367 ?auto_188368 ?auto_188369 ?auto_188370 ?auto_188371 ?auto_188372 ?auto_188373 ?auto_188374 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188388 - BLOCK
      ?auto_188389 - BLOCK
      ?auto_188390 - BLOCK
      ?auto_188391 - BLOCK
      ?auto_188392 - BLOCK
      ?auto_188393 - BLOCK
      ?auto_188394 - BLOCK
      ?auto_188395 - BLOCK
      ?auto_188396 - BLOCK
      ?auto_188397 - BLOCK
      ?auto_188398 - BLOCK
      ?auto_188399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188399 ) ( ON-TABLE ?auto_188388 ) ( ON ?auto_188389 ?auto_188388 ) ( ON ?auto_188390 ?auto_188389 ) ( ON ?auto_188391 ?auto_188390 ) ( ON ?auto_188392 ?auto_188391 ) ( ON ?auto_188393 ?auto_188392 ) ( ON ?auto_188394 ?auto_188393 ) ( ON ?auto_188395 ?auto_188394 ) ( ON ?auto_188396 ?auto_188395 ) ( not ( = ?auto_188388 ?auto_188389 ) ) ( not ( = ?auto_188388 ?auto_188390 ) ) ( not ( = ?auto_188388 ?auto_188391 ) ) ( not ( = ?auto_188388 ?auto_188392 ) ) ( not ( = ?auto_188388 ?auto_188393 ) ) ( not ( = ?auto_188388 ?auto_188394 ) ) ( not ( = ?auto_188388 ?auto_188395 ) ) ( not ( = ?auto_188388 ?auto_188396 ) ) ( not ( = ?auto_188388 ?auto_188397 ) ) ( not ( = ?auto_188388 ?auto_188398 ) ) ( not ( = ?auto_188388 ?auto_188399 ) ) ( not ( = ?auto_188389 ?auto_188390 ) ) ( not ( = ?auto_188389 ?auto_188391 ) ) ( not ( = ?auto_188389 ?auto_188392 ) ) ( not ( = ?auto_188389 ?auto_188393 ) ) ( not ( = ?auto_188389 ?auto_188394 ) ) ( not ( = ?auto_188389 ?auto_188395 ) ) ( not ( = ?auto_188389 ?auto_188396 ) ) ( not ( = ?auto_188389 ?auto_188397 ) ) ( not ( = ?auto_188389 ?auto_188398 ) ) ( not ( = ?auto_188389 ?auto_188399 ) ) ( not ( = ?auto_188390 ?auto_188391 ) ) ( not ( = ?auto_188390 ?auto_188392 ) ) ( not ( = ?auto_188390 ?auto_188393 ) ) ( not ( = ?auto_188390 ?auto_188394 ) ) ( not ( = ?auto_188390 ?auto_188395 ) ) ( not ( = ?auto_188390 ?auto_188396 ) ) ( not ( = ?auto_188390 ?auto_188397 ) ) ( not ( = ?auto_188390 ?auto_188398 ) ) ( not ( = ?auto_188390 ?auto_188399 ) ) ( not ( = ?auto_188391 ?auto_188392 ) ) ( not ( = ?auto_188391 ?auto_188393 ) ) ( not ( = ?auto_188391 ?auto_188394 ) ) ( not ( = ?auto_188391 ?auto_188395 ) ) ( not ( = ?auto_188391 ?auto_188396 ) ) ( not ( = ?auto_188391 ?auto_188397 ) ) ( not ( = ?auto_188391 ?auto_188398 ) ) ( not ( = ?auto_188391 ?auto_188399 ) ) ( not ( = ?auto_188392 ?auto_188393 ) ) ( not ( = ?auto_188392 ?auto_188394 ) ) ( not ( = ?auto_188392 ?auto_188395 ) ) ( not ( = ?auto_188392 ?auto_188396 ) ) ( not ( = ?auto_188392 ?auto_188397 ) ) ( not ( = ?auto_188392 ?auto_188398 ) ) ( not ( = ?auto_188392 ?auto_188399 ) ) ( not ( = ?auto_188393 ?auto_188394 ) ) ( not ( = ?auto_188393 ?auto_188395 ) ) ( not ( = ?auto_188393 ?auto_188396 ) ) ( not ( = ?auto_188393 ?auto_188397 ) ) ( not ( = ?auto_188393 ?auto_188398 ) ) ( not ( = ?auto_188393 ?auto_188399 ) ) ( not ( = ?auto_188394 ?auto_188395 ) ) ( not ( = ?auto_188394 ?auto_188396 ) ) ( not ( = ?auto_188394 ?auto_188397 ) ) ( not ( = ?auto_188394 ?auto_188398 ) ) ( not ( = ?auto_188394 ?auto_188399 ) ) ( not ( = ?auto_188395 ?auto_188396 ) ) ( not ( = ?auto_188395 ?auto_188397 ) ) ( not ( = ?auto_188395 ?auto_188398 ) ) ( not ( = ?auto_188395 ?auto_188399 ) ) ( not ( = ?auto_188396 ?auto_188397 ) ) ( not ( = ?auto_188396 ?auto_188398 ) ) ( not ( = ?auto_188396 ?auto_188399 ) ) ( not ( = ?auto_188397 ?auto_188398 ) ) ( not ( = ?auto_188397 ?auto_188399 ) ) ( not ( = ?auto_188398 ?auto_188399 ) ) ( ON ?auto_188398 ?auto_188399 ) ( CLEAR ?auto_188396 ) ( ON ?auto_188397 ?auto_188398 ) ( CLEAR ?auto_188397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_188388 ?auto_188389 ?auto_188390 ?auto_188391 ?auto_188392 ?auto_188393 ?auto_188394 ?auto_188395 ?auto_188396 ?auto_188397 )
      ( MAKE-12PILE ?auto_188388 ?auto_188389 ?auto_188390 ?auto_188391 ?auto_188392 ?auto_188393 ?auto_188394 ?auto_188395 ?auto_188396 ?auto_188397 ?auto_188398 ?auto_188399 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188412 - BLOCK
      ?auto_188413 - BLOCK
      ?auto_188414 - BLOCK
      ?auto_188415 - BLOCK
      ?auto_188416 - BLOCK
      ?auto_188417 - BLOCK
      ?auto_188418 - BLOCK
      ?auto_188419 - BLOCK
      ?auto_188420 - BLOCK
      ?auto_188421 - BLOCK
      ?auto_188422 - BLOCK
      ?auto_188423 - BLOCK
    )
    :vars
    (
      ?auto_188424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188423 ?auto_188424 ) ( ON-TABLE ?auto_188412 ) ( ON ?auto_188413 ?auto_188412 ) ( ON ?auto_188414 ?auto_188413 ) ( ON ?auto_188415 ?auto_188414 ) ( ON ?auto_188416 ?auto_188415 ) ( ON ?auto_188417 ?auto_188416 ) ( ON ?auto_188418 ?auto_188417 ) ( ON ?auto_188419 ?auto_188418 ) ( not ( = ?auto_188412 ?auto_188413 ) ) ( not ( = ?auto_188412 ?auto_188414 ) ) ( not ( = ?auto_188412 ?auto_188415 ) ) ( not ( = ?auto_188412 ?auto_188416 ) ) ( not ( = ?auto_188412 ?auto_188417 ) ) ( not ( = ?auto_188412 ?auto_188418 ) ) ( not ( = ?auto_188412 ?auto_188419 ) ) ( not ( = ?auto_188412 ?auto_188420 ) ) ( not ( = ?auto_188412 ?auto_188421 ) ) ( not ( = ?auto_188412 ?auto_188422 ) ) ( not ( = ?auto_188412 ?auto_188423 ) ) ( not ( = ?auto_188412 ?auto_188424 ) ) ( not ( = ?auto_188413 ?auto_188414 ) ) ( not ( = ?auto_188413 ?auto_188415 ) ) ( not ( = ?auto_188413 ?auto_188416 ) ) ( not ( = ?auto_188413 ?auto_188417 ) ) ( not ( = ?auto_188413 ?auto_188418 ) ) ( not ( = ?auto_188413 ?auto_188419 ) ) ( not ( = ?auto_188413 ?auto_188420 ) ) ( not ( = ?auto_188413 ?auto_188421 ) ) ( not ( = ?auto_188413 ?auto_188422 ) ) ( not ( = ?auto_188413 ?auto_188423 ) ) ( not ( = ?auto_188413 ?auto_188424 ) ) ( not ( = ?auto_188414 ?auto_188415 ) ) ( not ( = ?auto_188414 ?auto_188416 ) ) ( not ( = ?auto_188414 ?auto_188417 ) ) ( not ( = ?auto_188414 ?auto_188418 ) ) ( not ( = ?auto_188414 ?auto_188419 ) ) ( not ( = ?auto_188414 ?auto_188420 ) ) ( not ( = ?auto_188414 ?auto_188421 ) ) ( not ( = ?auto_188414 ?auto_188422 ) ) ( not ( = ?auto_188414 ?auto_188423 ) ) ( not ( = ?auto_188414 ?auto_188424 ) ) ( not ( = ?auto_188415 ?auto_188416 ) ) ( not ( = ?auto_188415 ?auto_188417 ) ) ( not ( = ?auto_188415 ?auto_188418 ) ) ( not ( = ?auto_188415 ?auto_188419 ) ) ( not ( = ?auto_188415 ?auto_188420 ) ) ( not ( = ?auto_188415 ?auto_188421 ) ) ( not ( = ?auto_188415 ?auto_188422 ) ) ( not ( = ?auto_188415 ?auto_188423 ) ) ( not ( = ?auto_188415 ?auto_188424 ) ) ( not ( = ?auto_188416 ?auto_188417 ) ) ( not ( = ?auto_188416 ?auto_188418 ) ) ( not ( = ?auto_188416 ?auto_188419 ) ) ( not ( = ?auto_188416 ?auto_188420 ) ) ( not ( = ?auto_188416 ?auto_188421 ) ) ( not ( = ?auto_188416 ?auto_188422 ) ) ( not ( = ?auto_188416 ?auto_188423 ) ) ( not ( = ?auto_188416 ?auto_188424 ) ) ( not ( = ?auto_188417 ?auto_188418 ) ) ( not ( = ?auto_188417 ?auto_188419 ) ) ( not ( = ?auto_188417 ?auto_188420 ) ) ( not ( = ?auto_188417 ?auto_188421 ) ) ( not ( = ?auto_188417 ?auto_188422 ) ) ( not ( = ?auto_188417 ?auto_188423 ) ) ( not ( = ?auto_188417 ?auto_188424 ) ) ( not ( = ?auto_188418 ?auto_188419 ) ) ( not ( = ?auto_188418 ?auto_188420 ) ) ( not ( = ?auto_188418 ?auto_188421 ) ) ( not ( = ?auto_188418 ?auto_188422 ) ) ( not ( = ?auto_188418 ?auto_188423 ) ) ( not ( = ?auto_188418 ?auto_188424 ) ) ( not ( = ?auto_188419 ?auto_188420 ) ) ( not ( = ?auto_188419 ?auto_188421 ) ) ( not ( = ?auto_188419 ?auto_188422 ) ) ( not ( = ?auto_188419 ?auto_188423 ) ) ( not ( = ?auto_188419 ?auto_188424 ) ) ( not ( = ?auto_188420 ?auto_188421 ) ) ( not ( = ?auto_188420 ?auto_188422 ) ) ( not ( = ?auto_188420 ?auto_188423 ) ) ( not ( = ?auto_188420 ?auto_188424 ) ) ( not ( = ?auto_188421 ?auto_188422 ) ) ( not ( = ?auto_188421 ?auto_188423 ) ) ( not ( = ?auto_188421 ?auto_188424 ) ) ( not ( = ?auto_188422 ?auto_188423 ) ) ( not ( = ?auto_188422 ?auto_188424 ) ) ( not ( = ?auto_188423 ?auto_188424 ) ) ( ON ?auto_188422 ?auto_188423 ) ( ON ?auto_188421 ?auto_188422 ) ( CLEAR ?auto_188419 ) ( ON ?auto_188420 ?auto_188421 ) ( CLEAR ?auto_188420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_188412 ?auto_188413 ?auto_188414 ?auto_188415 ?auto_188416 ?auto_188417 ?auto_188418 ?auto_188419 ?auto_188420 )
      ( MAKE-12PILE ?auto_188412 ?auto_188413 ?auto_188414 ?auto_188415 ?auto_188416 ?auto_188417 ?auto_188418 ?auto_188419 ?auto_188420 ?auto_188421 ?auto_188422 ?auto_188423 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188437 - BLOCK
      ?auto_188438 - BLOCK
      ?auto_188439 - BLOCK
      ?auto_188440 - BLOCK
      ?auto_188441 - BLOCK
      ?auto_188442 - BLOCK
      ?auto_188443 - BLOCK
      ?auto_188444 - BLOCK
      ?auto_188445 - BLOCK
      ?auto_188446 - BLOCK
      ?auto_188447 - BLOCK
      ?auto_188448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188448 ) ( ON-TABLE ?auto_188437 ) ( ON ?auto_188438 ?auto_188437 ) ( ON ?auto_188439 ?auto_188438 ) ( ON ?auto_188440 ?auto_188439 ) ( ON ?auto_188441 ?auto_188440 ) ( ON ?auto_188442 ?auto_188441 ) ( ON ?auto_188443 ?auto_188442 ) ( ON ?auto_188444 ?auto_188443 ) ( not ( = ?auto_188437 ?auto_188438 ) ) ( not ( = ?auto_188437 ?auto_188439 ) ) ( not ( = ?auto_188437 ?auto_188440 ) ) ( not ( = ?auto_188437 ?auto_188441 ) ) ( not ( = ?auto_188437 ?auto_188442 ) ) ( not ( = ?auto_188437 ?auto_188443 ) ) ( not ( = ?auto_188437 ?auto_188444 ) ) ( not ( = ?auto_188437 ?auto_188445 ) ) ( not ( = ?auto_188437 ?auto_188446 ) ) ( not ( = ?auto_188437 ?auto_188447 ) ) ( not ( = ?auto_188437 ?auto_188448 ) ) ( not ( = ?auto_188438 ?auto_188439 ) ) ( not ( = ?auto_188438 ?auto_188440 ) ) ( not ( = ?auto_188438 ?auto_188441 ) ) ( not ( = ?auto_188438 ?auto_188442 ) ) ( not ( = ?auto_188438 ?auto_188443 ) ) ( not ( = ?auto_188438 ?auto_188444 ) ) ( not ( = ?auto_188438 ?auto_188445 ) ) ( not ( = ?auto_188438 ?auto_188446 ) ) ( not ( = ?auto_188438 ?auto_188447 ) ) ( not ( = ?auto_188438 ?auto_188448 ) ) ( not ( = ?auto_188439 ?auto_188440 ) ) ( not ( = ?auto_188439 ?auto_188441 ) ) ( not ( = ?auto_188439 ?auto_188442 ) ) ( not ( = ?auto_188439 ?auto_188443 ) ) ( not ( = ?auto_188439 ?auto_188444 ) ) ( not ( = ?auto_188439 ?auto_188445 ) ) ( not ( = ?auto_188439 ?auto_188446 ) ) ( not ( = ?auto_188439 ?auto_188447 ) ) ( not ( = ?auto_188439 ?auto_188448 ) ) ( not ( = ?auto_188440 ?auto_188441 ) ) ( not ( = ?auto_188440 ?auto_188442 ) ) ( not ( = ?auto_188440 ?auto_188443 ) ) ( not ( = ?auto_188440 ?auto_188444 ) ) ( not ( = ?auto_188440 ?auto_188445 ) ) ( not ( = ?auto_188440 ?auto_188446 ) ) ( not ( = ?auto_188440 ?auto_188447 ) ) ( not ( = ?auto_188440 ?auto_188448 ) ) ( not ( = ?auto_188441 ?auto_188442 ) ) ( not ( = ?auto_188441 ?auto_188443 ) ) ( not ( = ?auto_188441 ?auto_188444 ) ) ( not ( = ?auto_188441 ?auto_188445 ) ) ( not ( = ?auto_188441 ?auto_188446 ) ) ( not ( = ?auto_188441 ?auto_188447 ) ) ( not ( = ?auto_188441 ?auto_188448 ) ) ( not ( = ?auto_188442 ?auto_188443 ) ) ( not ( = ?auto_188442 ?auto_188444 ) ) ( not ( = ?auto_188442 ?auto_188445 ) ) ( not ( = ?auto_188442 ?auto_188446 ) ) ( not ( = ?auto_188442 ?auto_188447 ) ) ( not ( = ?auto_188442 ?auto_188448 ) ) ( not ( = ?auto_188443 ?auto_188444 ) ) ( not ( = ?auto_188443 ?auto_188445 ) ) ( not ( = ?auto_188443 ?auto_188446 ) ) ( not ( = ?auto_188443 ?auto_188447 ) ) ( not ( = ?auto_188443 ?auto_188448 ) ) ( not ( = ?auto_188444 ?auto_188445 ) ) ( not ( = ?auto_188444 ?auto_188446 ) ) ( not ( = ?auto_188444 ?auto_188447 ) ) ( not ( = ?auto_188444 ?auto_188448 ) ) ( not ( = ?auto_188445 ?auto_188446 ) ) ( not ( = ?auto_188445 ?auto_188447 ) ) ( not ( = ?auto_188445 ?auto_188448 ) ) ( not ( = ?auto_188446 ?auto_188447 ) ) ( not ( = ?auto_188446 ?auto_188448 ) ) ( not ( = ?auto_188447 ?auto_188448 ) ) ( ON ?auto_188447 ?auto_188448 ) ( ON ?auto_188446 ?auto_188447 ) ( CLEAR ?auto_188444 ) ( ON ?auto_188445 ?auto_188446 ) ( CLEAR ?auto_188445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_188437 ?auto_188438 ?auto_188439 ?auto_188440 ?auto_188441 ?auto_188442 ?auto_188443 ?auto_188444 ?auto_188445 )
      ( MAKE-12PILE ?auto_188437 ?auto_188438 ?auto_188439 ?auto_188440 ?auto_188441 ?auto_188442 ?auto_188443 ?auto_188444 ?auto_188445 ?auto_188446 ?auto_188447 ?auto_188448 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188461 - BLOCK
      ?auto_188462 - BLOCK
      ?auto_188463 - BLOCK
      ?auto_188464 - BLOCK
      ?auto_188465 - BLOCK
      ?auto_188466 - BLOCK
      ?auto_188467 - BLOCK
      ?auto_188468 - BLOCK
      ?auto_188469 - BLOCK
      ?auto_188470 - BLOCK
      ?auto_188471 - BLOCK
      ?auto_188472 - BLOCK
    )
    :vars
    (
      ?auto_188473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188472 ?auto_188473 ) ( ON-TABLE ?auto_188461 ) ( ON ?auto_188462 ?auto_188461 ) ( ON ?auto_188463 ?auto_188462 ) ( ON ?auto_188464 ?auto_188463 ) ( ON ?auto_188465 ?auto_188464 ) ( ON ?auto_188466 ?auto_188465 ) ( ON ?auto_188467 ?auto_188466 ) ( not ( = ?auto_188461 ?auto_188462 ) ) ( not ( = ?auto_188461 ?auto_188463 ) ) ( not ( = ?auto_188461 ?auto_188464 ) ) ( not ( = ?auto_188461 ?auto_188465 ) ) ( not ( = ?auto_188461 ?auto_188466 ) ) ( not ( = ?auto_188461 ?auto_188467 ) ) ( not ( = ?auto_188461 ?auto_188468 ) ) ( not ( = ?auto_188461 ?auto_188469 ) ) ( not ( = ?auto_188461 ?auto_188470 ) ) ( not ( = ?auto_188461 ?auto_188471 ) ) ( not ( = ?auto_188461 ?auto_188472 ) ) ( not ( = ?auto_188461 ?auto_188473 ) ) ( not ( = ?auto_188462 ?auto_188463 ) ) ( not ( = ?auto_188462 ?auto_188464 ) ) ( not ( = ?auto_188462 ?auto_188465 ) ) ( not ( = ?auto_188462 ?auto_188466 ) ) ( not ( = ?auto_188462 ?auto_188467 ) ) ( not ( = ?auto_188462 ?auto_188468 ) ) ( not ( = ?auto_188462 ?auto_188469 ) ) ( not ( = ?auto_188462 ?auto_188470 ) ) ( not ( = ?auto_188462 ?auto_188471 ) ) ( not ( = ?auto_188462 ?auto_188472 ) ) ( not ( = ?auto_188462 ?auto_188473 ) ) ( not ( = ?auto_188463 ?auto_188464 ) ) ( not ( = ?auto_188463 ?auto_188465 ) ) ( not ( = ?auto_188463 ?auto_188466 ) ) ( not ( = ?auto_188463 ?auto_188467 ) ) ( not ( = ?auto_188463 ?auto_188468 ) ) ( not ( = ?auto_188463 ?auto_188469 ) ) ( not ( = ?auto_188463 ?auto_188470 ) ) ( not ( = ?auto_188463 ?auto_188471 ) ) ( not ( = ?auto_188463 ?auto_188472 ) ) ( not ( = ?auto_188463 ?auto_188473 ) ) ( not ( = ?auto_188464 ?auto_188465 ) ) ( not ( = ?auto_188464 ?auto_188466 ) ) ( not ( = ?auto_188464 ?auto_188467 ) ) ( not ( = ?auto_188464 ?auto_188468 ) ) ( not ( = ?auto_188464 ?auto_188469 ) ) ( not ( = ?auto_188464 ?auto_188470 ) ) ( not ( = ?auto_188464 ?auto_188471 ) ) ( not ( = ?auto_188464 ?auto_188472 ) ) ( not ( = ?auto_188464 ?auto_188473 ) ) ( not ( = ?auto_188465 ?auto_188466 ) ) ( not ( = ?auto_188465 ?auto_188467 ) ) ( not ( = ?auto_188465 ?auto_188468 ) ) ( not ( = ?auto_188465 ?auto_188469 ) ) ( not ( = ?auto_188465 ?auto_188470 ) ) ( not ( = ?auto_188465 ?auto_188471 ) ) ( not ( = ?auto_188465 ?auto_188472 ) ) ( not ( = ?auto_188465 ?auto_188473 ) ) ( not ( = ?auto_188466 ?auto_188467 ) ) ( not ( = ?auto_188466 ?auto_188468 ) ) ( not ( = ?auto_188466 ?auto_188469 ) ) ( not ( = ?auto_188466 ?auto_188470 ) ) ( not ( = ?auto_188466 ?auto_188471 ) ) ( not ( = ?auto_188466 ?auto_188472 ) ) ( not ( = ?auto_188466 ?auto_188473 ) ) ( not ( = ?auto_188467 ?auto_188468 ) ) ( not ( = ?auto_188467 ?auto_188469 ) ) ( not ( = ?auto_188467 ?auto_188470 ) ) ( not ( = ?auto_188467 ?auto_188471 ) ) ( not ( = ?auto_188467 ?auto_188472 ) ) ( not ( = ?auto_188467 ?auto_188473 ) ) ( not ( = ?auto_188468 ?auto_188469 ) ) ( not ( = ?auto_188468 ?auto_188470 ) ) ( not ( = ?auto_188468 ?auto_188471 ) ) ( not ( = ?auto_188468 ?auto_188472 ) ) ( not ( = ?auto_188468 ?auto_188473 ) ) ( not ( = ?auto_188469 ?auto_188470 ) ) ( not ( = ?auto_188469 ?auto_188471 ) ) ( not ( = ?auto_188469 ?auto_188472 ) ) ( not ( = ?auto_188469 ?auto_188473 ) ) ( not ( = ?auto_188470 ?auto_188471 ) ) ( not ( = ?auto_188470 ?auto_188472 ) ) ( not ( = ?auto_188470 ?auto_188473 ) ) ( not ( = ?auto_188471 ?auto_188472 ) ) ( not ( = ?auto_188471 ?auto_188473 ) ) ( not ( = ?auto_188472 ?auto_188473 ) ) ( ON ?auto_188471 ?auto_188472 ) ( ON ?auto_188470 ?auto_188471 ) ( ON ?auto_188469 ?auto_188470 ) ( CLEAR ?auto_188467 ) ( ON ?auto_188468 ?auto_188469 ) ( CLEAR ?auto_188468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188461 ?auto_188462 ?auto_188463 ?auto_188464 ?auto_188465 ?auto_188466 ?auto_188467 ?auto_188468 )
      ( MAKE-12PILE ?auto_188461 ?auto_188462 ?auto_188463 ?auto_188464 ?auto_188465 ?auto_188466 ?auto_188467 ?auto_188468 ?auto_188469 ?auto_188470 ?auto_188471 ?auto_188472 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188486 - BLOCK
      ?auto_188487 - BLOCK
      ?auto_188488 - BLOCK
      ?auto_188489 - BLOCK
      ?auto_188490 - BLOCK
      ?auto_188491 - BLOCK
      ?auto_188492 - BLOCK
      ?auto_188493 - BLOCK
      ?auto_188494 - BLOCK
      ?auto_188495 - BLOCK
      ?auto_188496 - BLOCK
      ?auto_188497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188497 ) ( ON-TABLE ?auto_188486 ) ( ON ?auto_188487 ?auto_188486 ) ( ON ?auto_188488 ?auto_188487 ) ( ON ?auto_188489 ?auto_188488 ) ( ON ?auto_188490 ?auto_188489 ) ( ON ?auto_188491 ?auto_188490 ) ( ON ?auto_188492 ?auto_188491 ) ( not ( = ?auto_188486 ?auto_188487 ) ) ( not ( = ?auto_188486 ?auto_188488 ) ) ( not ( = ?auto_188486 ?auto_188489 ) ) ( not ( = ?auto_188486 ?auto_188490 ) ) ( not ( = ?auto_188486 ?auto_188491 ) ) ( not ( = ?auto_188486 ?auto_188492 ) ) ( not ( = ?auto_188486 ?auto_188493 ) ) ( not ( = ?auto_188486 ?auto_188494 ) ) ( not ( = ?auto_188486 ?auto_188495 ) ) ( not ( = ?auto_188486 ?auto_188496 ) ) ( not ( = ?auto_188486 ?auto_188497 ) ) ( not ( = ?auto_188487 ?auto_188488 ) ) ( not ( = ?auto_188487 ?auto_188489 ) ) ( not ( = ?auto_188487 ?auto_188490 ) ) ( not ( = ?auto_188487 ?auto_188491 ) ) ( not ( = ?auto_188487 ?auto_188492 ) ) ( not ( = ?auto_188487 ?auto_188493 ) ) ( not ( = ?auto_188487 ?auto_188494 ) ) ( not ( = ?auto_188487 ?auto_188495 ) ) ( not ( = ?auto_188487 ?auto_188496 ) ) ( not ( = ?auto_188487 ?auto_188497 ) ) ( not ( = ?auto_188488 ?auto_188489 ) ) ( not ( = ?auto_188488 ?auto_188490 ) ) ( not ( = ?auto_188488 ?auto_188491 ) ) ( not ( = ?auto_188488 ?auto_188492 ) ) ( not ( = ?auto_188488 ?auto_188493 ) ) ( not ( = ?auto_188488 ?auto_188494 ) ) ( not ( = ?auto_188488 ?auto_188495 ) ) ( not ( = ?auto_188488 ?auto_188496 ) ) ( not ( = ?auto_188488 ?auto_188497 ) ) ( not ( = ?auto_188489 ?auto_188490 ) ) ( not ( = ?auto_188489 ?auto_188491 ) ) ( not ( = ?auto_188489 ?auto_188492 ) ) ( not ( = ?auto_188489 ?auto_188493 ) ) ( not ( = ?auto_188489 ?auto_188494 ) ) ( not ( = ?auto_188489 ?auto_188495 ) ) ( not ( = ?auto_188489 ?auto_188496 ) ) ( not ( = ?auto_188489 ?auto_188497 ) ) ( not ( = ?auto_188490 ?auto_188491 ) ) ( not ( = ?auto_188490 ?auto_188492 ) ) ( not ( = ?auto_188490 ?auto_188493 ) ) ( not ( = ?auto_188490 ?auto_188494 ) ) ( not ( = ?auto_188490 ?auto_188495 ) ) ( not ( = ?auto_188490 ?auto_188496 ) ) ( not ( = ?auto_188490 ?auto_188497 ) ) ( not ( = ?auto_188491 ?auto_188492 ) ) ( not ( = ?auto_188491 ?auto_188493 ) ) ( not ( = ?auto_188491 ?auto_188494 ) ) ( not ( = ?auto_188491 ?auto_188495 ) ) ( not ( = ?auto_188491 ?auto_188496 ) ) ( not ( = ?auto_188491 ?auto_188497 ) ) ( not ( = ?auto_188492 ?auto_188493 ) ) ( not ( = ?auto_188492 ?auto_188494 ) ) ( not ( = ?auto_188492 ?auto_188495 ) ) ( not ( = ?auto_188492 ?auto_188496 ) ) ( not ( = ?auto_188492 ?auto_188497 ) ) ( not ( = ?auto_188493 ?auto_188494 ) ) ( not ( = ?auto_188493 ?auto_188495 ) ) ( not ( = ?auto_188493 ?auto_188496 ) ) ( not ( = ?auto_188493 ?auto_188497 ) ) ( not ( = ?auto_188494 ?auto_188495 ) ) ( not ( = ?auto_188494 ?auto_188496 ) ) ( not ( = ?auto_188494 ?auto_188497 ) ) ( not ( = ?auto_188495 ?auto_188496 ) ) ( not ( = ?auto_188495 ?auto_188497 ) ) ( not ( = ?auto_188496 ?auto_188497 ) ) ( ON ?auto_188496 ?auto_188497 ) ( ON ?auto_188495 ?auto_188496 ) ( ON ?auto_188494 ?auto_188495 ) ( CLEAR ?auto_188492 ) ( ON ?auto_188493 ?auto_188494 ) ( CLEAR ?auto_188493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188486 ?auto_188487 ?auto_188488 ?auto_188489 ?auto_188490 ?auto_188491 ?auto_188492 ?auto_188493 )
      ( MAKE-12PILE ?auto_188486 ?auto_188487 ?auto_188488 ?auto_188489 ?auto_188490 ?auto_188491 ?auto_188492 ?auto_188493 ?auto_188494 ?auto_188495 ?auto_188496 ?auto_188497 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188510 - BLOCK
      ?auto_188511 - BLOCK
      ?auto_188512 - BLOCK
      ?auto_188513 - BLOCK
      ?auto_188514 - BLOCK
      ?auto_188515 - BLOCK
      ?auto_188516 - BLOCK
      ?auto_188517 - BLOCK
      ?auto_188518 - BLOCK
      ?auto_188519 - BLOCK
      ?auto_188520 - BLOCK
      ?auto_188521 - BLOCK
    )
    :vars
    (
      ?auto_188522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188521 ?auto_188522 ) ( ON-TABLE ?auto_188510 ) ( ON ?auto_188511 ?auto_188510 ) ( ON ?auto_188512 ?auto_188511 ) ( ON ?auto_188513 ?auto_188512 ) ( ON ?auto_188514 ?auto_188513 ) ( ON ?auto_188515 ?auto_188514 ) ( not ( = ?auto_188510 ?auto_188511 ) ) ( not ( = ?auto_188510 ?auto_188512 ) ) ( not ( = ?auto_188510 ?auto_188513 ) ) ( not ( = ?auto_188510 ?auto_188514 ) ) ( not ( = ?auto_188510 ?auto_188515 ) ) ( not ( = ?auto_188510 ?auto_188516 ) ) ( not ( = ?auto_188510 ?auto_188517 ) ) ( not ( = ?auto_188510 ?auto_188518 ) ) ( not ( = ?auto_188510 ?auto_188519 ) ) ( not ( = ?auto_188510 ?auto_188520 ) ) ( not ( = ?auto_188510 ?auto_188521 ) ) ( not ( = ?auto_188510 ?auto_188522 ) ) ( not ( = ?auto_188511 ?auto_188512 ) ) ( not ( = ?auto_188511 ?auto_188513 ) ) ( not ( = ?auto_188511 ?auto_188514 ) ) ( not ( = ?auto_188511 ?auto_188515 ) ) ( not ( = ?auto_188511 ?auto_188516 ) ) ( not ( = ?auto_188511 ?auto_188517 ) ) ( not ( = ?auto_188511 ?auto_188518 ) ) ( not ( = ?auto_188511 ?auto_188519 ) ) ( not ( = ?auto_188511 ?auto_188520 ) ) ( not ( = ?auto_188511 ?auto_188521 ) ) ( not ( = ?auto_188511 ?auto_188522 ) ) ( not ( = ?auto_188512 ?auto_188513 ) ) ( not ( = ?auto_188512 ?auto_188514 ) ) ( not ( = ?auto_188512 ?auto_188515 ) ) ( not ( = ?auto_188512 ?auto_188516 ) ) ( not ( = ?auto_188512 ?auto_188517 ) ) ( not ( = ?auto_188512 ?auto_188518 ) ) ( not ( = ?auto_188512 ?auto_188519 ) ) ( not ( = ?auto_188512 ?auto_188520 ) ) ( not ( = ?auto_188512 ?auto_188521 ) ) ( not ( = ?auto_188512 ?auto_188522 ) ) ( not ( = ?auto_188513 ?auto_188514 ) ) ( not ( = ?auto_188513 ?auto_188515 ) ) ( not ( = ?auto_188513 ?auto_188516 ) ) ( not ( = ?auto_188513 ?auto_188517 ) ) ( not ( = ?auto_188513 ?auto_188518 ) ) ( not ( = ?auto_188513 ?auto_188519 ) ) ( not ( = ?auto_188513 ?auto_188520 ) ) ( not ( = ?auto_188513 ?auto_188521 ) ) ( not ( = ?auto_188513 ?auto_188522 ) ) ( not ( = ?auto_188514 ?auto_188515 ) ) ( not ( = ?auto_188514 ?auto_188516 ) ) ( not ( = ?auto_188514 ?auto_188517 ) ) ( not ( = ?auto_188514 ?auto_188518 ) ) ( not ( = ?auto_188514 ?auto_188519 ) ) ( not ( = ?auto_188514 ?auto_188520 ) ) ( not ( = ?auto_188514 ?auto_188521 ) ) ( not ( = ?auto_188514 ?auto_188522 ) ) ( not ( = ?auto_188515 ?auto_188516 ) ) ( not ( = ?auto_188515 ?auto_188517 ) ) ( not ( = ?auto_188515 ?auto_188518 ) ) ( not ( = ?auto_188515 ?auto_188519 ) ) ( not ( = ?auto_188515 ?auto_188520 ) ) ( not ( = ?auto_188515 ?auto_188521 ) ) ( not ( = ?auto_188515 ?auto_188522 ) ) ( not ( = ?auto_188516 ?auto_188517 ) ) ( not ( = ?auto_188516 ?auto_188518 ) ) ( not ( = ?auto_188516 ?auto_188519 ) ) ( not ( = ?auto_188516 ?auto_188520 ) ) ( not ( = ?auto_188516 ?auto_188521 ) ) ( not ( = ?auto_188516 ?auto_188522 ) ) ( not ( = ?auto_188517 ?auto_188518 ) ) ( not ( = ?auto_188517 ?auto_188519 ) ) ( not ( = ?auto_188517 ?auto_188520 ) ) ( not ( = ?auto_188517 ?auto_188521 ) ) ( not ( = ?auto_188517 ?auto_188522 ) ) ( not ( = ?auto_188518 ?auto_188519 ) ) ( not ( = ?auto_188518 ?auto_188520 ) ) ( not ( = ?auto_188518 ?auto_188521 ) ) ( not ( = ?auto_188518 ?auto_188522 ) ) ( not ( = ?auto_188519 ?auto_188520 ) ) ( not ( = ?auto_188519 ?auto_188521 ) ) ( not ( = ?auto_188519 ?auto_188522 ) ) ( not ( = ?auto_188520 ?auto_188521 ) ) ( not ( = ?auto_188520 ?auto_188522 ) ) ( not ( = ?auto_188521 ?auto_188522 ) ) ( ON ?auto_188520 ?auto_188521 ) ( ON ?auto_188519 ?auto_188520 ) ( ON ?auto_188518 ?auto_188519 ) ( ON ?auto_188517 ?auto_188518 ) ( CLEAR ?auto_188515 ) ( ON ?auto_188516 ?auto_188517 ) ( CLEAR ?auto_188516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188510 ?auto_188511 ?auto_188512 ?auto_188513 ?auto_188514 ?auto_188515 ?auto_188516 )
      ( MAKE-12PILE ?auto_188510 ?auto_188511 ?auto_188512 ?auto_188513 ?auto_188514 ?auto_188515 ?auto_188516 ?auto_188517 ?auto_188518 ?auto_188519 ?auto_188520 ?auto_188521 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188535 - BLOCK
      ?auto_188536 - BLOCK
      ?auto_188537 - BLOCK
      ?auto_188538 - BLOCK
      ?auto_188539 - BLOCK
      ?auto_188540 - BLOCK
      ?auto_188541 - BLOCK
      ?auto_188542 - BLOCK
      ?auto_188543 - BLOCK
      ?auto_188544 - BLOCK
      ?auto_188545 - BLOCK
      ?auto_188546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188546 ) ( ON-TABLE ?auto_188535 ) ( ON ?auto_188536 ?auto_188535 ) ( ON ?auto_188537 ?auto_188536 ) ( ON ?auto_188538 ?auto_188537 ) ( ON ?auto_188539 ?auto_188538 ) ( ON ?auto_188540 ?auto_188539 ) ( not ( = ?auto_188535 ?auto_188536 ) ) ( not ( = ?auto_188535 ?auto_188537 ) ) ( not ( = ?auto_188535 ?auto_188538 ) ) ( not ( = ?auto_188535 ?auto_188539 ) ) ( not ( = ?auto_188535 ?auto_188540 ) ) ( not ( = ?auto_188535 ?auto_188541 ) ) ( not ( = ?auto_188535 ?auto_188542 ) ) ( not ( = ?auto_188535 ?auto_188543 ) ) ( not ( = ?auto_188535 ?auto_188544 ) ) ( not ( = ?auto_188535 ?auto_188545 ) ) ( not ( = ?auto_188535 ?auto_188546 ) ) ( not ( = ?auto_188536 ?auto_188537 ) ) ( not ( = ?auto_188536 ?auto_188538 ) ) ( not ( = ?auto_188536 ?auto_188539 ) ) ( not ( = ?auto_188536 ?auto_188540 ) ) ( not ( = ?auto_188536 ?auto_188541 ) ) ( not ( = ?auto_188536 ?auto_188542 ) ) ( not ( = ?auto_188536 ?auto_188543 ) ) ( not ( = ?auto_188536 ?auto_188544 ) ) ( not ( = ?auto_188536 ?auto_188545 ) ) ( not ( = ?auto_188536 ?auto_188546 ) ) ( not ( = ?auto_188537 ?auto_188538 ) ) ( not ( = ?auto_188537 ?auto_188539 ) ) ( not ( = ?auto_188537 ?auto_188540 ) ) ( not ( = ?auto_188537 ?auto_188541 ) ) ( not ( = ?auto_188537 ?auto_188542 ) ) ( not ( = ?auto_188537 ?auto_188543 ) ) ( not ( = ?auto_188537 ?auto_188544 ) ) ( not ( = ?auto_188537 ?auto_188545 ) ) ( not ( = ?auto_188537 ?auto_188546 ) ) ( not ( = ?auto_188538 ?auto_188539 ) ) ( not ( = ?auto_188538 ?auto_188540 ) ) ( not ( = ?auto_188538 ?auto_188541 ) ) ( not ( = ?auto_188538 ?auto_188542 ) ) ( not ( = ?auto_188538 ?auto_188543 ) ) ( not ( = ?auto_188538 ?auto_188544 ) ) ( not ( = ?auto_188538 ?auto_188545 ) ) ( not ( = ?auto_188538 ?auto_188546 ) ) ( not ( = ?auto_188539 ?auto_188540 ) ) ( not ( = ?auto_188539 ?auto_188541 ) ) ( not ( = ?auto_188539 ?auto_188542 ) ) ( not ( = ?auto_188539 ?auto_188543 ) ) ( not ( = ?auto_188539 ?auto_188544 ) ) ( not ( = ?auto_188539 ?auto_188545 ) ) ( not ( = ?auto_188539 ?auto_188546 ) ) ( not ( = ?auto_188540 ?auto_188541 ) ) ( not ( = ?auto_188540 ?auto_188542 ) ) ( not ( = ?auto_188540 ?auto_188543 ) ) ( not ( = ?auto_188540 ?auto_188544 ) ) ( not ( = ?auto_188540 ?auto_188545 ) ) ( not ( = ?auto_188540 ?auto_188546 ) ) ( not ( = ?auto_188541 ?auto_188542 ) ) ( not ( = ?auto_188541 ?auto_188543 ) ) ( not ( = ?auto_188541 ?auto_188544 ) ) ( not ( = ?auto_188541 ?auto_188545 ) ) ( not ( = ?auto_188541 ?auto_188546 ) ) ( not ( = ?auto_188542 ?auto_188543 ) ) ( not ( = ?auto_188542 ?auto_188544 ) ) ( not ( = ?auto_188542 ?auto_188545 ) ) ( not ( = ?auto_188542 ?auto_188546 ) ) ( not ( = ?auto_188543 ?auto_188544 ) ) ( not ( = ?auto_188543 ?auto_188545 ) ) ( not ( = ?auto_188543 ?auto_188546 ) ) ( not ( = ?auto_188544 ?auto_188545 ) ) ( not ( = ?auto_188544 ?auto_188546 ) ) ( not ( = ?auto_188545 ?auto_188546 ) ) ( ON ?auto_188545 ?auto_188546 ) ( ON ?auto_188544 ?auto_188545 ) ( ON ?auto_188543 ?auto_188544 ) ( ON ?auto_188542 ?auto_188543 ) ( CLEAR ?auto_188540 ) ( ON ?auto_188541 ?auto_188542 ) ( CLEAR ?auto_188541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188535 ?auto_188536 ?auto_188537 ?auto_188538 ?auto_188539 ?auto_188540 ?auto_188541 )
      ( MAKE-12PILE ?auto_188535 ?auto_188536 ?auto_188537 ?auto_188538 ?auto_188539 ?auto_188540 ?auto_188541 ?auto_188542 ?auto_188543 ?auto_188544 ?auto_188545 ?auto_188546 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188559 - BLOCK
      ?auto_188560 - BLOCK
      ?auto_188561 - BLOCK
      ?auto_188562 - BLOCK
      ?auto_188563 - BLOCK
      ?auto_188564 - BLOCK
      ?auto_188565 - BLOCK
      ?auto_188566 - BLOCK
      ?auto_188567 - BLOCK
      ?auto_188568 - BLOCK
      ?auto_188569 - BLOCK
      ?auto_188570 - BLOCK
    )
    :vars
    (
      ?auto_188571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188570 ?auto_188571 ) ( ON-TABLE ?auto_188559 ) ( ON ?auto_188560 ?auto_188559 ) ( ON ?auto_188561 ?auto_188560 ) ( ON ?auto_188562 ?auto_188561 ) ( ON ?auto_188563 ?auto_188562 ) ( not ( = ?auto_188559 ?auto_188560 ) ) ( not ( = ?auto_188559 ?auto_188561 ) ) ( not ( = ?auto_188559 ?auto_188562 ) ) ( not ( = ?auto_188559 ?auto_188563 ) ) ( not ( = ?auto_188559 ?auto_188564 ) ) ( not ( = ?auto_188559 ?auto_188565 ) ) ( not ( = ?auto_188559 ?auto_188566 ) ) ( not ( = ?auto_188559 ?auto_188567 ) ) ( not ( = ?auto_188559 ?auto_188568 ) ) ( not ( = ?auto_188559 ?auto_188569 ) ) ( not ( = ?auto_188559 ?auto_188570 ) ) ( not ( = ?auto_188559 ?auto_188571 ) ) ( not ( = ?auto_188560 ?auto_188561 ) ) ( not ( = ?auto_188560 ?auto_188562 ) ) ( not ( = ?auto_188560 ?auto_188563 ) ) ( not ( = ?auto_188560 ?auto_188564 ) ) ( not ( = ?auto_188560 ?auto_188565 ) ) ( not ( = ?auto_188560 ?auto_188566 ) ) ( not ( = ?auto_188560 ?auto_188567 ) ) ( not ( = ?auto_188560 ?auto_188568 ) ) ( not ( = ?auto_188560 ?auto_188569 ) ) ( not ( = ?auto_188560 ?auto_188570 ) ) ( not ( = ?auto_188560 ?auto_188571 ) ) ( not ( = ?auto_188561 ?auto_188562 ) ) ( not ( = ?auto_188561 ?auto_188563 ) ) ( not ( = ?auto_188561 ?auto_188564 ) ) ( not ( = ?auto_188561 ?auto_188565 ) ) ( not ( = ?auto_188561 ?auto_188566 ) ) ( not ( = ?auto_188561 ?auto_188567 ) ) ( not ( = ?auto_188561 ?auto_188568 ) ) ( not ( = ?auto_188561 ?auto_188569 ) ) ( not ( = ?auto_188561 ?auto_188570 ) ) ( not ( = ?auto_188561 ?auto_188571 ) ) ( not ( = ?auto_188562 ?auto_188563 ) ) ( not ( = ?auto_188562 ?auto_188564 ) ) ( not ( = ?auto_188562 ?auto_188565 ) ) ( not ( = ?auto_188562 ?auto_188566 ) ) ( not ( = ?auto_188562 ?auto_188567 ) ) ( not ( = ?auto_188562 ?auto_188568 ) ) ( not ( = ?auto_188562 ?auto_188569 ) ) ( not ( = ?auto_188562 ?auto_188570 ) ) ( not ( = ?auto_188562 ?auto_188571 ) ) ( not ( = ?auto_188563 ?auto_188564 ) ) ( not ( = ?auto_188563 ?auto_188565 ) ) ( not ( = ?auto_188563 ?auto_188566 ) ) ( not ( = ?auto_188563 ?auto_188567 ) ) ( not ( = ?auto_188563 ?auto_188568 ) ) ( not ( = ?auto_188563 ?auto_188569 ) ) ( not ( = ?auto_188563 ?auto_188570 ) ) ( not ( = ?auto_188563 ?auto_188571 ) ) ( not ( = ?auto_188564 ?auto_188565 ) ) ( not ( = ?auto_188564 ?auto_188566 ) ) ( not ( = ?auto_188564 ?auto_188567 ) ) ( not ( = ?auto_188564 ?auto_188568 ) ) ( not ( = ?auto_188564 ?auto_188569 ) ) ( not ( = ?auto_188564 ?auto_188570 ) ) ( not ( = ?auto_188564 ?auto_188571 ) ) ( not ( = ?auto_188565 ?auto_188566 ) ) ( not ( = ?auto_188565 ?auto_188567 ) ) ( not ( = ?auto_188565 ?auto_188568 ) ) ( not ( = ?auto_188565 ?auto_188569 ) ) ( not ( = ?auto_188565 ?auto_188570 ) ) ( not ( = ?auto_188565 ?auto_188571 ) ) ( not ( = ?auto_188566 ?auto_188567 ) ) ( not ( = ?auto_188566 ?auto_188568 ) ) ( not ( = ?auto_188566 ?auto_188569 ) ) ( not ( = ?auto_188566 ?auto_188570 ) ) ( not ( = ?auto_188566 ?auto_188571 ) ) ( not ( = ?auto_188567 ?auto_188568 ) ) ( not ( = ?auto_188567 ?auto_188569 ) ) ( not ( = ?auto_188567 ?auto_188570 ) ) ( not ( = ?auto_188567 ?auto_188571 ) ) ( not ( = ?auto_188568 ?auto_188569 ) ) ( not ( = ?auto_188568 ?auto_188570 ) ) ( not ( = ?auto_188568 ?auto_188571 ) ) ( not ( = ?auto_188569 ?auto_188570 ) ) ( not ( = ?auto_188569 ?auto_188571 ) ) ( not ( = ?auto_188570 ?auto_188571 ) ) ( ON ?auto_188569 ?auto_188570 ) ( ON ?auto_188568 ?auto_188569 ) ( ON ?auto_188567 ?auto_188568 ) ( ON ?auto_188566 ?auto_188567 ) ( ON ?auto_188565 ?auto_188566 ) ( CLEAR ?auto_188563 ) ( ON ?auto_188564 ?auto_188565 ) ( CLEAR ?auto_188564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188559 ?auto_188560 ?auto_188561 ?auto_188562 ?auto_188563 ?auto_188564 )
      ( MAKE-12PILE ?auto_188559 ?auto_188560 ?auto_188561 ?auto_188562 ?auto_188563 ?auto_188564 ?auto_188565 ?auto_188566 ?auto_188567 ?auto_188568 ?auto_188569 ?auto_188570 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188584 - BLOCK
      ?auto_188585 - BLOCK
      ?auto_188586 - BLOCK
      ?auto_188587 - BLOCK
      ?auto_188588 - BLOCK
      ?auto_188589 - BLOCK
      ?auto_188590 - BLOCK
      ?auto_188591 - BLOCK
      ?auto_188592 - BLOCK
      ?auto_188593 - BLOCK
      ?auto_188594 - BLOCK
      ?auto_188595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188595 ) ( ON-TABLE ?auto_188584 ) ( ON ?auto_188585 ?auto_188584 ) ( ON ?auto_188586 ?auto_188585 ) ( ON ?auto_188587 ?auto_188586 ) ( ON ?auto_188588 ?auto_188587 ) ( not ( = ?auto_188584 ?auto_188585 ) ) ( not ( = ?auto_188584 ?auto_188586 ) ) ( not ( = ?auto_188584 ?auto_188587 ) ) ( not ( = ?auto_188584 ?auto_188588 ) ) ( not ( = ?auto_188584 ?auto_188589 ) ) ( not ( = ?auto_188584 ?auto_188590 ) ) ( not ( = ?auto_188584 ?auto_188591 ) ) ( not ( = ?auto_188584 ?auto_188592 ) ) ( not ( = ?auto_188584 ?auto_188593 ) ) ( not ( = ?auto_188584 ?auto_188594 ) ) ( not ( = ?auto_188584 ?auto_188595 ) ) ( not ( = ?auto_188585 ?auto_188586 ) ) ( not ( = ?auto_188585 ?auto_188587 ) ) ( not ( = ?auto_188585 ?auto_188588 ) ) ( not ( = ?auto_188585 ?auto_188589 ) ) ( not ( = ?auto_188585 ?auto_188590 ) ) ( not ( = ?auto_188585 ?auto_188591 ) ) ( not ( = ?auto_188585 ?auto_188592 ) ) ( not ( = ?auto_188585 ?auto_188593 ) ) ( not ( = ?auto_188585 ?auto_188594 ) ) ( not ( = ?auto_188585 ?auto_188595 ) ) ( not ( = ?auto_188586 ?auto_188587 ) ) ( not ( = ?auto_188586 ?auto_188588 ) ) ( not ( = ?auto_188586 ?auto_188589 ) ) ( not ( = ?auto_188586 ?auto_188590 ) ) ( not ( = ?auto_188586 ?auto_188591 ) ) ( not ( = ?auto_188586 ?auto_188592 ) ) ( not ( = ?auto_188586 ?auto_188593 ) ) ( not ( = ?auto_188586 ?auto_188594 ) ) ( not ( = ?auto_188586 ?auto_188595 ) ) ( not ( = ?auto_188587 ?auto_188588 ) ) ( not ( = ?auto_188587 ?auto_188589 ) ) ( not ( = ?auto_188587 ?auto_188590 ) ) ( not ( = ?auto_188587 ?auto_188591 ) ) ( not ( = ?auto_188587 ?auto_188592 ) ) ( not ( = ?auto_188587 ?auto_188593 ) ) ( not ( = ?auto_188587 ?auto_188594 ) ) ( not ( = ?auto_188587 ?auto_188595 ) ) ( not ( = ?auto_188588 ?auto_188589 ) ) ( not ( = ?auto_188588 ?auto_188590 ) ) ( not ( = ?auto_188588 ?auto_188591 ) ) ( not ( = ?auto_188588 ?auto_188592 ) ) ( not ( = ?auto_188588 ?auto_188593 ) ) ( not ( = ?auto_188588 ?auto_188594 ) ) ( not ( = ?auto_188588 ?auto_188595 ) ) ( not ( = ?auto_188589 ?auto_188590 ) ) ( not ( = ?auto_188589 ?auto_188591 ) ) ( not ( = ?auto_188589 ?auto_188592 ) ) ( not ( = ?auto_188589 ?auto_188593 ) ) ( not ( = ?auto_188589 ?auto_188594 ) ) ( not ( = ?auto_188589 ?auto_188595 ) ) ( not ( = ?auto_188590 ?auto_188591 ) ) ( not ( = ?auto_188590 ?auto_188592 ) ) ( not ( = ?auto_188590 ?auto_188593 ) ) ( not ( = ?auto_188590 ?auto_188594 ) ) ( not ( = ?auto_188590 ?auto_188595 ) ) ( not ( = ?auto_188591 ?auto_188592 ) ) ( not ( = ?auto_188591 ?auto_188593 ) ) ( not ( = ?auto_188591 ?auto_188594 ) ) ( not ( = ?auto_188591 ?auto_188595 ) ) ( not ( = ?auto_188592 ?auto_188593 ) ) ( not ( = ?auto_188592 ?auto_188594 ) ) ( not ( = ?auto_188592 ?auto_188595 ) ) ( not ( = ?auto_188593 ?auto_188594 ) ) ( not ( = ?auto_188593 ?auto_188595 ) ) ( not ( = ?auto_188594 ?auto_188595 ) ) ( ON ?auto_188594 ?auto_188595 ) ( ON ?auto_188593 ?auto_188594 ) ( ON ?auto_188592 ?auto_188593 ) ( ON ?auto_188591 ?auto_188592 ) ( ON ?auto_188590 ?auto_188591 ) ( CLEAR ?auto_188588 ) ( ON ?auto_188589 ?auto_188590 ) ( CLEAR ?auto_188589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188584 ?auto_188585 ?auto_188586 ?auto_188587 ?auto_188588 ?auto_188589 )
      ( MAKE-12PILE ?auto_188584 ?auto_188585 ?auto_188586 ?auto_188587 ?auto_188588 ?auto_188589 ?auto_188590 ?auto_188591 ?auto_188592 ?auto_188593 ?auto_188594 ?auto_188595 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188608 - BLOCK
      ?auto_188609 - BLOCK
      ?auto_188610 - BLOCK
      ?auto_188611 - BLOCK
      ?auto_188612 - BLOCK
      ?auto_188613 - BLOCK
      ?auto_188614 - BLOCK
      ?auto_188615 - BLOCK
      ?auto_188616 - BLOCK
      ?auto_188617 - BLOCK
      ?auto_188618 - BLOCK
      ?auto_188619 - BLOCK
    )
    :vars
    (
      ?auto_188620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188619 ?auto_188620 ) ( ON-TABLE ?auto_188608 ) ( ON ?auto_188609 ?auto_188608 ) ( ON ?auto_188610 ?auto_188609 ) ( ON ?auto_188611 ?auto_188610 ) ( not ( = ?auto_188608 ?auto_188609 ) ) ( not ( = ?auto_188608 ?auto_188610 ) ) ( not ( = ?auto_188608 ?auto_188611 ) ) ( not ( = ?auto_188608 ?auto_188612 ) ) ( not ( = ?auto_188608 ?auto_188613 ) ) ( not ( = ?auto_188608 ?auto_188614 ) ) ( not ( = ?auto_188608 ?auto_188615 ) ) ( not ( = ?auto_188608 ?auto_188616 ) ) ( not ( = ?auto_188608 ?auto_188617 ) ) ( not ( = ?auto_188608 ?auto_188618 ) ) ( not ( = ?auto_188608 ?auto_188619 ) ) ( not ( = ?auto_188608 ?auto_188620 ) ) ( not ( = ?auto_188609 ?auto_188610 ) ) ( not ( = ?auto_188609 ?auto_188611 ) ) ( not ( = ?auto_188609 ?auto_188612 ) ) ( not ( = ?auto_188609 ?auto_188613 ) ) ( not ( = ?auto_188609 ?auto_188614 ) ) ( not ( = ?auto_188609 ?auto_188615 ) ) ( not ( = ?auto_188609 ?auto_188616 ) ) ( not ( = ?auto_188609 ?auto_188617 ) ) ( not ( = ?auto_188609 ?auto_188618 ) ) ( not ( = ?auto_188609 ?auto_188619 ) ) ( not ( = ?auto_188609 ?auto_188620 ) ) ( not ( = ?auto_188610 ?auto_188611 ) ) ( not ( = ?auto_188610 ?auto_188612 ) ) ( not ( = ?auto_188610 ?auto_188613 ) ) ( not ( = ?auto_188610 ?auto_188614 ) ) ( not ( = ?auto_188610 ?auto_188615 ) ) ( not ( = ?auto_188610 ?auto_188616 ) ) ( not ( = ?auto_188610 ?auto_188617 ) ) ( not ( = ?auto_188610 ?auto_188618 ) ) ( not ( = ?auto_188610 ?auto_188619 ) ) ( not ( = ?auto_188610 ?auto_188620 ) ) ( not ( = ?auto_188611 ?auto_188612 ) ) ( not ( = ?auto_188611 ?auto_188613 ) ) ( not ( = ?auto_188611 ?auto_188614 ) ) ( not ( = ?auto_188611 ?auto_188615 ) ) ( not ( = ?auto_188611 ?auto_188616 ) ) ( not ( = ?auto_188611 ?auto_188617 ) ) ( not ( = ?auto_188611 ?auto_188618 ) ) ( not ( = ?auto_188611 ?auto_188619 ) ) ( not ( = ?auto_188611 ?auto_188620 ) ) ( not ( = ?auto_188612 ?auto_188613 ) ) ( not ( = ?auto_188612 ?auto_188614 ) ) ( not ( = ?auto_188612 ?auto_188615 ) ) ( not ( = ?auto_188612 ?auto_188616 ) ) ( not ( = ?auto_188612 ?auto_188617 ) ) ( not ( = ?auto_188612 ?auto_188618 ) ) ( not ( = ?auto_188612 ?auto_188619 ) ) ( not ( = ?auto_188612 ?auto_188620 ) ) ( not ( = ?auto_188613 ?auto_188614 ) ) ( not ( = ?auto_188613 ?auto_188615 ) ) ( not ( = ?auto_188613 ?auto_188616 ) ) ( not ( = ?auto_188613 ?auto_188617 ) ) ( not ( = ?auto_188613 ?auto_188618 ) ) ( not ( = ?auto_188613 ?auto_188619 ) ) ( not ( = ?auto_188613 ?auto_188620 ) ) ( not ( = ?auto_188614 ?auto_188615 ) ) ( not ( = ?auto_188614 ?auto_188616 ) ) ( not ( = ?auto_188614 ?auto_188617 ) ) ( not ( = ?auto_188614 ?auto_188618 ) ) ( not ( = ?auto_188614 ?auto_188619 ) ) ( not ( = ?auto_188614 ?auto_188620 ) ) ( not ( = ?auto_188615 ?auto_188616 ) ) ( not ( = ?auto_188615 ?auto_188617 ) ) ( not ( = ?auto_188615 ?auto_188618 ) ) ( not ( = ?auto_188615 ?auto_188619 ) ) ( not ( = ?auto_188615 ?auto_188620 ) ) ( not ( = ?auto_188616 ?auto_188617 ) ) ( not ( = ?auto_188616 ?auto_188618 ) ) ( not ( = ?auto_188616 ?auto_188619 ) ) ( not ( = ?auto_188616 ?auto_188620 ) ) ( not ( = ?auto_188617 ?auto_188618 ) ) ( not ( = ?auto_188617 ?auto_188619 ) ) ( not ( = ?auto_188617 ?auto_188620 ) ) ( not ( = ?auto_188618 ?auto_188619 ) ) ( not ( = ?auto_188618 ?auto_188620 ) ) ( not ( = ?auto_188619 ?auto_188620 ) ) ( ON ?auto_188618 ?auto_188619 ) ( ON ?auto_188617 ?auto_188618 ) ( ON ?auto_188616 ?auto_188617 ) ( ON ?auto_188615 ?auto_188616 ) ( ON ?auto_188614 ?auto_188615 ) ( ON ?auto_188613 ?auto_188614 ) ( CLEAR ?auto_188611 ) ( ON ?auto_188612 ?auto_188613 ) ( CLEAR ?auto_188612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188608 ?auto_188609 ?auto_188610 ?auto_188611 ?auto_188612 )
      ( MAKE-12PILE ?auto_188608 ?auto_188609 ?auto_188610 ?auto_188611 ?auto_188612 ?auto_188613 ?auto_188614 ?auto_188615 ?auto_188616 ?auto_188617 ?auto_188618 ?auto_188619 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188633 - BLOCK
      ?auto_188634 - BLOCK
      ?auto_188635 - BLOCK
      ?auto_188636 - BLOCK
      ?auto_188637 - BLOCK
      ?auto_188638 - BLOCK
      ?auto_188639 - BLOCK
      ?auto_188640 - BLOCK
      ?auto_188641 - BLOCK
      ?auto_188642 - BLOCK
      ?auto_188643 - BLOCK
      ?auto_188644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188644 ) ( ON-TABLE ?auto_188633 ) ( ON ?auto_188634 ?auto_188633 ) ( ON ?auto_188635 ?auto_188634 ) ( ON ?auto_188636 ?auto_188635 ) ( not ( = ?auto_188633 ?auto_188634 ) ) ( not ( = ?auto_188633 ?auto_188635 ) ) ( not ( = ?auto_188633 ?auto_188636 ) ) ( not ( = ?auto_188633 ?auto_188637 ) ) ( not ( = ?auto_188633 ?auto_188638 ) ) ( not ( = ?auto_188633 ?auto_188639 ) ) ( not ( = ?auto_188633 ?auto_188640 ) ) ( not ( = ?auto_188633 ?auto_188641 ) ) ( not ( = ?auto_188633 ?auto_188642 ) ) ( not ( = ?auto_188633 ?auto_188643 ) ) ( not ( = ?auto_188633 ?auto_188644 ) ) ( not ( = ?auto_188634 ?auto_188635 ) ) ( not ( = ?auto_188634 ?auto_188636 ) ) ( not ( = ?auto_188634 ?auto_188637 ) ) ( not ( = ?auto_188634 ?auto_188638 ) ) ( not ( = ?auto_188634 ?auto_188639 ) ) ( not ( = ?auto_188634 ?auto_188640 ) ) ( not ( = ?auto_188634 ?auto_188641 ) ) ( not ( = ?auto_188634 ?auto_188642 ) ) ( not ( = ?auto_188634 ?auto_188643 ) ) ( not ( = ?auto_188634 ?auto_188644 ) ) ( not ( = ?auto_188635 ?auto_188636 ) ) ( not ( = ?auto_188635 ?auto_188637 ) ) ( not ( = ?auto_188635 ?auto_188638 ) ) ( not ( = ?auto_188635 ?auto_188639 ) ) ( not ( = ?auto_188635 ?auto_188640 ) ) ( not ( = ?auto_188635 ?auto_188641 ) ) ( not ( = ?auto_188635 ?auto_188642 ) ) ( not ( = ?auto_188635 ?auto_188643 ) ) ( not ( = ?auto_188635 ?auto_188644 ) ) ( not ( = ?auto_188636 ?auto_188637 ) ) ( not ( = ?auto_188636 ?auto_188638 ) ) ( not ( = ?auto_188636 ?auto_188639 ) ) ( not ( = ?auto_188636 ?auto_188640 ) ) ( not ( = ?auto_188636 ?auto_188641 ) ) ( not ( = ?auto_188636 ?auto_188642 ) ) ( not ( = ?auto_188636 ?auto_188643 ) ) ( not ( = ?auto_188636 ?auto_188644 ) ) ( not ( = ?auto_188637 ?auto_188638 ) ) ( not ( = ?auto_188637 ?auto_188639 ) ) ( not ( = ?auto_188637 ?auto_188640 ) ) ( not ( = ?auto_188637 ?auto_188641 ) ) ( not ( = ?auto_188637 ?auto_188642 ) ) ( not ( = ?auto_188637 ?auto_188643 ) ) ( not ( = ?auto_188637 ?auto_188644 ) ) ( not ( = ?auto_188638 ?auto_188639 ) ) ( not ( = ?auto_188638 ?auto_188640 ) ) ( not ( = ?auto_188638 ?auto_188641 ) ) ( not ( = ?auto_188638 ?auto_188642 ) ) ( not ( = ?auto_188638 ?auto_188643 ) ) ( not ( = ?auto_188638 ?auto_188644 ) ) ( not ( = ?auto_188639 ?auto_188640 ) ) ( not ( = ?auto_188639 ?auto_188641 ) ) ( not ( = ?auto_188639 ?auto_188642 ) ) ( not ( = ?auto_188639 ?auto_188643 ) ) ( not ( = ?auto_188639 ?auto_188644 ) ) ( not ( = ?auto_188640 ?auto_188641 ) ) ( not ( = ?auto_188640 ?auto_188642 ) ) ( not ( = ?auto_188640 ?auto_188643 ) ) ( not ( = ?auto_188640 ?auto_188644 ) ) ( not ( = ?auto_188641 ?auto_188642 ) ) ( not ( = ?auto_188641 ?auto_188643 ) ) ( not ( = ?auto_188641 ?auto_188644 ) ) ( not ( = ?auto_188642 ?auto_188643 ) ) ( not ( = ?auto_188642 ?auto_188644 ) ) ( not ( = ?auto_188643 ?auto_188644 ) ) ( ON ?auto_188643 ?auto_188644 ) ( ON ?auto_188642 ?auto_188643 ) ( ON ?auto_188641 ?auto_188642 ) ( ON ?auto_188640 ?auto_188641 ) ( ON ?auto_188639 ?auto_188640 ) ( ON ?auto_188638 ?auto_188639 ) ( CLEAR ?auto_188636 ) ( ON ?auto_188637 ?auto_188638 ) ( CLEAR ?auto_188637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188633 ?auto_188634 ?auto_188635 ?auto_188636 ?auto_188637 )
      ( MAKE-12PILE ?auto_188633 ?auto_188634 ?auto_188635 ?auto_188636 ?auto_188637 ?auto_188638 ?auto_188639 ?auto_188640 ?auto_188641 ?auto_188642 ?auto_188643 ?auto_188644 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188657 - BLOCK
      ?auto_188658 - BLOCK
      ?auto_188659 - BLOCK
      ?auto_188660 - BLOCK
      ?auto_188661 - BLOCK
      ?auto_188662 - BLOCK
      ?auto_188663 - BLOCK
      ?auto_188664 - BLOCK
      ?auto_188665 - BLOCK
      ?auto_188666 - BLOCK
      ?auto_188667 - BLOCK
      ?auto_188668 - BLOCK
    )
    :vars
    (
      ?auto_188669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188668 ?auto_188669 ) ( ON-TABLE ?auto_188657 ) ( ON ?auto_188658 ?auto_188657 ) ( ON ?auto_188659 ?auto_188658 ) ( not ( = ?auto_188657 ?auto_188658 ) ) ( not ( = ?auto_188657 ?auto_188659 ) ) ( not ( = ?auto_188657 ?auto_188660 ) ) ( not ( = ?auto_188657 ?auto_188661 ) ) ( not ( = ?auto_188657 ?auto_188662 ) ) ( not ( = ?auto_188657 ?auto_188663 ) ) ( not ( = ?auto_188657 ?auto_188664 ) ) ( not ( = ?auto_188657 ?auto_188665 ) ) ( not ( = ?auto_188657 ?auto_188666 ) ) ( not ( = ?auto_188657 ?auto_188667 ) ) ( not ( = ?auto_188657 ?auto_188668 ) ) ( not ( = ?auto_188657 ?auto_188669 ) ) ( not ( = ?auto_188658 ?auto_188659 ) ) ( not ( = ?auto_188658 ?auto_188660 ) ) ( not ( = ?auto_188658 ?auto_188661 ) ) ( not ( = ?auto_188658 ?auto_188662 ) ) ( not ( = ?auto_188658 ?auto_188663 ) ) ( not ( = ?auto_188658 ?auto_188664 ) ) ( not ( = ?auto_188658 ?auto_188665 ) ) ( not ( = ?auto_188658 ?auto_188666 ) ) ( not ( = ?auto_188658 ?auto_188667 ) ) ( not ( = ?auto_188658 ?auto_188668 ) ) ( not ( = ?auto_188658 ?auto_188669 ) ) ( not ( = ?auto_188659 ?auto_188660 ) ) ( not ( = ?auto_188659 ?auto_188661 ) ) ( not ( = ?auto_188659 ?auto_188662 ) ) ( not ( = ?auto_188659 ?auto_188663 ) ) ( not ( = ?auto_188659 ?auto_188664 ) ) ( not ( = ?auto_188659 ?auto_188665 ) ) ( not ( = ?auto_188659 ?auto_188666 ) ) ( not ( = ?auto_188659 ?auto_188667 ) ) ( not ( = ?auto_188659 ?auto_188668 ) ) ( not ( = ?auto_188659 ?auto_188669 ) ) ( not ( = ?auto_188660 ?auto_188661 ) ) ( not ( = ?auto_188660 ?auto_188662 ) ) ( not ( = ?auto_188660 ?auto_188663 ) ) ( not ( = ?auto_188660 ?auto_188664 ) ) ( not ( = ?auto_188660 ?auto_188665 ) ) ( not ( = ?auto_188660 ?auto_188666 ) ) ( not ( = ?auto_188660 ?auto_188667 ) ) ( not ( = ?auto_188660 ?auto_188668 ) ) ( not ( = ?auto_188660 ?auto_188669 ) ) ( not ( = ?auto_188661 ?auto_188662 ) ) ( not ( = ?auto_188661 ?auto_188663 ) ) ( not ( = ?auto_188661 ?auto_188664 ) ) ( not ( = ?auto_188661 ?auto_188665 ) ) ( not ( = ?auto_188661 ?auto_188666 ) ) ( not ( = ?auto_188661 ?auto_188667 ) ) ( not ( = ?auto_188661 ?auto_188668 ) ) ( not ( = ?auto_188661 ?auto_188669 ) ) ( not ( = ?auto_188662 ?auto_188663 ) ) ( not ( = ?auto_188662 ?auto_188664 ) ) ( not ( = ?auto_188662 ?auto_188665 ) ) ( not ( = ?auto_188662 ?auto_188666 ) ) ( not ( = ?auto_188662 ?auto_188667 ) ) ( not ( = ?auto_188662 ?auto_188668 ) ) ( not ( = ?auto_188662 ?auto_188669 ) ) ( not ( = ?auto_188663 ?auto_188664 ) ) ( not ( = ?auto_188663 ?auto_188665 ) ) ( not ( = ?auto_188663 ?auto_188666 ) ) ( not ( = ?auto_188663 ?auto_188667 ) ) ( not ( = ?auto_188663 ?auto_188668 ) ) ( not ( = ?auto_188663 ?auto_188669 ) ) ( not ( = ?auto_188664 ?auto_188665 ) ) ( not ( = ?auto_188664 ?auto_188666 ) ) ( not ( = ?auto_188664 ?auto_188667 ) ) ( not ( = ?auto_188664 ?auto_188668 ) ) ( not ( = ?auto_188664 ?auto_188669 ) ) ( not ( = ?auto_188665 ?auto_188666 ) ) ( not ( = ?auto_188665 ?auto_188667 ) ) ( not ( = ?auto_188665 ?auto_188668 ) ) ( not ( = ?auto_188665 ?auto_188669 ) ) ( not ( = ?auto_188666 ?auto_188667 ) ) ( not ( = ?auto_188666 ?auto_188668 ) ) ( not ( = ?auto_188666 ?auto_188669 ) ) ( not ( = ?auto_188667 ?auto_188668 ) ) ( not ( = ?auto_188667 ?auto_188669 ) ) ( not ( = ?auto_188668 ?auto_188669 ) ) ( ON ?auto_188667 ?auto_188668 ) ( ON ?auto_188666 ?auto_188667 ) ( ON ?auto_188665 ?auto_188666 ) ( ON ?auto_188664 ?auto_188665 ) ( ON ?auto_188663 ?auto_188664 ) ( ON ?auto_188662 ?auto_188663 ) ( ON ?auto_188661 ?auto_188662 ) ( CLEAR ?auto_188659 ) ( ON ?auto_188660 ?auto_188661 ) ( CLEAR ?auto_188660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188657 ?auto_188658 ?auto_188659 ?auto_188660 )
      ( MAKE-12PILE ?auto_188657 ?auto_188658 ?auto_188659 ?auto_188660 ?auto_188661 ?auto_188662 ?auto_188663 ?auto_188664 ?auto_188665 ?auto_188666 ?auto_188667 ?auto_188668 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188682 - BLOCK
      ?auto_188683 - BLOCK
      ?auto_188684 - BLOCK
      ?auto_188685 - BLOCK
      ?auto_188686 - BLOCK
      ?auto_188687 - BLOCK
      ?auto_188688 - BLOCK
      ?auto_188689 - BLOCK
      ?auto_188690 - BLOCK
      ?auto_188691 - BLOCK
      ?auto_188692 - BLOCK
      ?auto_188693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188693 ) ( ON-TABLE ?auto_188682 ) ( ON ?auto_188683 ?auto_188682 ) ( ON ?auto_188684 ?auto_188683 ) ( not ( = ?auto_188682 ?auto_188683 ) ) ( not ( = ?auto_188682 ?auto_188684 ) ) ( not ( = ?auto_188682 ?auto_188685 ) ) ( not ( = ?auto_188682 ?auto_188686 ) ) ( not ( = ?auto_188682 ?auto_188687 ) ) ( not ( = ?auto_188682 ?auto_188688 ) ) ( not ( = ?auto_188682 ?auto_188689 ) ) ( not ( = ?auto_188682 ?auto_188690 ) ) ( not ( = ?auto_188682 ?auto_188691 ) ) ( not ( = ?auto_188682 ?auto_188692 ) ) ( not ( = ?auto_188682 ?auto_188693 ) ) ( not ( = ?auto_188683 ?auto_188684 ) ) ( not ( = ?auto_188683 ?auto_188685 ) ) ( not ( = ?auto_188683 ?auto_188686 ) ) ( not ( = ?auto_188683 ?auto_188687 ) ) ( not ( = ?auto_188683 ?auto_188688 ) ) ( not ( = ?auto_188683 ?auto_188689 ) ) ( not ( = ?auto_188683 ?auto_188690 ) ) ( not ( = ?auto_188683 ?auto_188691 ) ) ( not ( = ?auto_188683 ?auto_188692 ) ) ( not ( = ?auto_188683 ?auto_188693 ) ) ( not ( = ?auto_188684 ?auto_188685 ) ) ( not ( = ?auto_188684 ?auto_188686 ) ) ( not ( = ?auto_188684 ?auto_188687 ) ) ( not ( = ?auto_188684 ?auto_188688 ) ) ( not ( = ?auto_188684 ?auto_188689 ) ) ( not ( = ?auto_188684 ?auto_188690 ) ) ( not ( = ?auto_188684 ?auto_188691 ) ) ( not ( = ?auto_188684 ?auto_188692 ) ) ( not ( = ?auto_188684 ?auto_188693 ) ) ( not ( = ?auto_188685 ?auto_188686 ) ) ( not ( = ?auto_188685 ?auto_188687 ) ) ( not ( = ?auto_188685 ?auto_188688 ) ) ( not ( = ?auto_188685 ?auto_188689 ) ) ( not ( = ?auto_188685 ?auto_188690 ) ) ( not ( = ?auto_188685 ?auto_188691 ) ) ( not ( = ?auto_188685 ?auto_188692 ) ) ( not ( = ?auto_188685 ?auto_188693 ) ) ( not ( = ?auto_188686 ?auto_188687 ) ) ( not ( = ?auto_188686 ?auto_188688 ) ) ( not ( = ?auto_188686 ?auto_188689 ) ) ( not ( = ?auto_188686 ?auto_188690 ) ) ( not ( = ?auto_188686 ?auto_188691 ) ) ( not ( = ?auto_188686 ?auto_188692 ) ) ( not ( = ?auto_188686 ?auto_188693 ) ) ( not ( = ?auto_188687 ?auto_188688 ) ) ( not ( = ?auto_188687 ?auto_188689 ) ) ( not ( = ?auto_188687 ?auto_188690 ) ) ( not ( = ?auto_188687 ?auto_188691 ) ) ( not ( = ?auto_188687 ?auto_188692 ) ) ( not ( = ?auto_188687 ?auto_188693 ) ) ( not ( = ?auto_188688 ?auto_188689 ) ) ( not ( = ?auto_188688 ?auto_188690 ) ) ( not ( = ?auto_188688 ?auto_188691 ) ) ( not ( = ?auto_188688 ?auto_188692 ) ) ( not ( = ?auto_188688 ?auto_188693 ) ) ( not ( = ?auto_188689 ?auto_188690 ) ) ( not ( = ?auto_188689 ?auto_188691 ) ) ( not ( = ?auto_188689 ?auto_188692 ) ) ( not ( = ?auto_188689 ?auto_188693 ) ) ( not ( = ?auto_188690 ?auto_188691 ) ) ( not ( = ?auto_188690 ?auto_188692 ) ) ( not ( = ?auto_188690 ?auto_188693 ) ) ( not ( = ?auto_188691 ?auto_188692 ) ) ( not ( = ?auto_188691 ?auto_188693 ) ) ( not ( = ?auto_188692 ?auto_188693 ) ) ( ON ?auto_188692 ?auto_188693 ) ( ON ?auto_188691 ?auto_188692 ) ( ON ?auto_188690 ?auto_188691 ) ( ON ?auto_188689 ?auto_188690 ) ( ON ?auto_188688 ?auto_188689 ) ( ON ?auto_188687 ?auto_188688 ) ( ON ?auto_188686 ?auto_188687 ) ( CLEAR ?auto_188684 ) ( ON ?auto_188685 ?auto_188686 ) ( CLEAR ?auto_188685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188682 ?auto_188683 ?auto_188684 ?auto_188685 )
      ( MAKE-12PILE ?auto_188682 ?auto_188683 ?auto_188684 ?auto_188685 ?auto_188686 ?auto_188687 ?auto_188688 ?auto_188689 ?auto_188690 ?auto_188691 ?auto_188692 ?auto_188693 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188706 - BLOCK
      ?auto_188707 - BLOCK
      ?auto_188708 - BLOCK
      ?auto_188709 - BLOCK
      ?auto_188710 - BLOCK
      ?auto_188711 - BLOCK
      ?auto_188712 - BLOCK
      ?auto_188713 - BLOCK
      ?auto_188714 - BLOCK
      ?auto_188715 - BLOCK
      ?auto_188716 - BLOCK
      ?auto_188717 - BLOCK
    )
    :vars
    (
      ?auto_188718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188717 ?auto_188718 ) ( ON-TABLE ?auto_188706 ) ( ON ?auto_188707 ?auto_188706 ) ( not ( = ?auto_188706 ?auto_188707 ) ) ( not ( = ?auto_188706 ?auto_188708 ) ) ( not ( = ?auto_188706 ?auto_188709 ) ) ( not ( = ?auto_188706 ?auto_188710 ) ) ( not ( = ?auto_188706 ?auto_188711 ) ) ( not ( = ?auto_188706 ?auto_188712 ) ) ( not ( = ?auto_188706 ?auto_188713 ) ) ( not ( = ?auto_188706 ?auto_188714 ) ) ( not ( = ?auto_188706 ?auto_188715 ) ) ( not ( = ?auto_188706 ?auto_188716 ) ) ( not ( = ?auto_188706 ?auto_188717 ) ) ( not ( = ?auto_188706 ?auto_188718 ) ) ( not ( = ?auto_188707 ?auto_188708 ) ) ( not ( = ?auto_188707 ?auto_188709 ) ) ( not ( = ?auto_188707 ?auto_188710 ) ) ( not ( = ?auto_188707 ?auto_188711 ) ) ( not ( = ?auto_188707 ?auto_188712 ) ) ( not ( = ?auto_188707 ?auto_188713 ) ) ( not ( = ?auto_188707 ?auto_188714 ) ) ( not ( = ?auto_188707 ?auto_188715 ) ) ( not ( = ?auto_188707 ?auto_188716 ) ) ( not ( = ?auto_188707 ?auto_188717 ) ) ( not ( = ?auto_188707 ?auto_188718 ) ) ( not ( = ?auto_188708 ?auto_188709 ) ) ( not ( = ?auto_188708 ?auto_188710 ) ) ( not ( = ?auto_188708 ?auto_188711 ) ) ( not ( = ?auto_188708 ?auto_188712 ) ) ( not ( = ?auto_188708 ?auto_188713 ) ) ( not ( = ?auto_188708 ?auto_188714 ) ) ( not ( = ?auto_188708 ?auto_188715 ) ) ( not ( = ?auto_188708 ?auto_188716 ) ) ( not ( = ?auto_188708 ?auto_188717 ) ) ( not ( = ?auto_188708 ?auto_188718 ) ) ( not ( = ?auto_188709 ?auto_188710 ) ) ( not ( = ?auto_188709 ?auto_188711 ) ) ( not ( = ?auto_188709 ?auto_188712 ) ) ( not ( = ?auto_188709 ?auto_188713 ) ) ( not ( = ?auto_188709 ?auto_188714 ) ) ( not ( = ?auto_188709 ?auto_188715 ) ) ( not ( = ?auto_188709 ?auto_188716 ) ) ( not ( = ?auto_188709 ?auto_188717 ) ) ( not ( = ?auto_188709 ?auto_188718 ) ) ( not ( = ?auto_188710 ?auto_188711 ) ) ( not ( = ?auto_188710 ?auto_188712 ) ) ( not ( = ?auto_188710 ?auto_188713 ) ) ( not ( = ?auto_188710 ?auto_188714 ) ) ( not ( = ?auto_188710 ?auto_188715 ) ) ( not ( = ?auto_188710 ?auto_188716 ) ) ( not ( = ?auto_188710 ?auto_188717 ) ) ( not ( = ?auto_188710 ?auto_188718 ) ) ( not ( = ?auto_188711 ?auto_188712 ) ) ( not ( = ?auto_188711 ?auto_188713 ) ) ( not ( = ?auto_188711 ?auto_188714 ) ) ( not ( = ?auto_188711 ?auto_188715 ) ) ( not ( = ?auto_188711 ?auto_188716 ) ) ( not ( = ?auto_188711 ?auto_188717 ) ) ( not ( = ?auto_188711 ?auto_188718 ) ) ( not ( = ?auto_188712 ?auto_188713 ) ) ( not ( = ?auto_188712 ?auto_188714 ) ) ( not ( = ?auto_188712 ?auto_188715 ) ) ( not ( = ?auto_188712 ?auto_188716 ) ) ( not ( = ?auto_188712 ?auto_188717 ) ) ( not ( = ?auto_188712 ?auto_188718 ) ) ( not ( = ?auto_188713 ?auto_188714 ) ) ( not ( = ?auto_188713 ?auto_188715 ) ) ( not ( = ?auto_188713 ?auto_188716 ) ) ( not ( = ?auto_188713 ?auto_188717 ) ) ( not ( = ?auto_188713 ?auto_188718 ) ) ( not ( = ?auto_188714 ?auto_188715 ) ) ( not ( = ?auto_188714 ?auto_188716 ) ) ( not ( = ?auto_188714 ?auto_188717 ) ) ( not ( = ?auto_188714 ?auto_188718 ) ) ( not ( = ?auto_188715 ?auto_188716 ) ) ( not ( = ?auto_188715 ?auto_188717 ) ) ( not ( = ?auto_188715 ?auto_188718 ) ) ( not ( = ?auto_188716 ?auto_188717 ) ) ( not ( = ?auto_188716 ?auto_188718 ) ) ( not ( = ?auto_188717 ?auto_188718 ) ) ( ON ?auto_188716 ?auto_188717 ) ( ON ?auto_188715 ?auto_188716 ) ( ON ?auto_188714 ?auto_188715 ) ( ON ?auto_188713 ?auto_188714 ) ( ON ?auto_188712 ?auto_188713 ) ( ON ?auto_188711 ?auto_188712 ) ( ON ?auto_188710 ?auto_188711 ) ( ON ?auto_188709 ?auto_188710 ) ( CLEAR ?auto_188707 ) ( ON ?auto_188708 ?auto_188709 ) ( CLEAR ?auto_188708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188706 ?auto_188707 ?auto_188708 )
      ( MAKE-12PILE ?auto_188706 ?auto_188707 ?auto_188708 ?auto_188709 ?auto_188710 ?auto_188711 ?auto_188712 ?auto_188713 ?auto_188714 ?auto_188715 ?auto_188716 ?auto_188717 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188731 - BLOCK
      ?auto_188732 - BLOCK
      ?auto_188733 - BLOCK
      ?auto_188734 - BLOCK
      ?auto_188735 - BLOCK
      ?auto_188736 - BLOCK
      ?auto_188737 - BLOCK
      ?auto_188738 - BLOCK
      ?auto_188739 - BLOCK
      ?auto_188740 - BLOCK
      ?auto_188741 - BLOCK
      ?auto_188742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188742 ) ( ON-TABLE ?auto_188731 ) ( ON ?auto_188732 ?auto_188731 ) ( not ( = ?auto_188731 ?auto_188732 ) ) ( not ( = ?auto_188731 ?auto_188733 ) ) ( not ( = ?auto_188731 ?auto_188734 ) ) ( not ( = ?auto_188731 ?auto_188735 ) ) ( not ( = ?auto_188731 ?auto_188736 ) ) ( not ( = ?auto_188731 ?auto_188737 ) ) ( not ( = ?auto_188731 ?auto_188738 ) ) ( not ( = ?auto_188731 ?auto_188739 ) ) ( not ( = ?auto_188731 ?auto_188740 ) ) ( not ( = ?auto_188731 ?auto_188741 ) ) ( not ( = ?auto_188731 ?auto_188742 ) ) ( not ( = ?auto_188732 ?auto_188733 ) ) ( not ( = ?auto_188732 ?auto_188734 ) ) ( not ( = ?auto_188732 ?auto_188735 ) ) ( not ( = ?auto_188732 ?auto_188736 ) ) ( not ( = ?auto_188732 ?auto_188737 ) ) ( not ( = ?auto_188732 ?auto_188738 ) ) ( not ( = ?auto_188732 ?auto_188739 ) ) ( not ( = ?auto_188732 ?auto_188740 ) ) ( not ( = ?auto_188732 ?auto_188741 ) ) ( not ( = ?auto_188732 ?auto_188742 ) ) ( not ( = ?auto_188733 ?auto_188734 ) ) ( not ( = ?auto_188733 ?auto_188735 ) ) ( not ( = ?auto_188733 ?auto_188736 ) ) ( not ( = ?auto_188733 ?auto_188737 ) ) ( not ( = ?auto_188733 ?auto_188738 ) ) ( not ( = ?auto_188733 ?auto_188739 ) ) ( not ( = ?auto_188733 ?auto_188740 ) ) ( not ( = ?auto_188733 ?auto_188741 ) ) ( not ( = ?auto_188733 ?auto_188742 ) ) ( not ( = ?auto_188734 ?auto_188735 ) ) ( not ( = ?auto_188734 ?auto_188736 ) ) ( not ( = ?auto_188734 ?auto_188737 ) ) ( not ( = ?auto_188734 ?auto_188738 ) ) ( not ( = ?auto_188734 ?auto_188739 ) ) ( not ( = ?auto_188734 ?auto_188740 ) ) ( not ( = ?auto_188734 ?auto_188741 ) ) ( not ( = ?auto_188734 ?auto_188742 ) ) ( not ( = ?auto_188735 ?auto_188736 ) ) ( not ( = ?auto_188735 ?auto_188737 ) ) ( not ( = ?auto_188735 ?auto_188738 ) ) ( not ( = ?auto_188735 ?auto_188739 ) ) ( not ( = ?auto_188735 ?auto_188740 ) ) ( not ( = ?auto_188735 ?auto_188741 ) ) ( not ( = ?auto_188735 ?auto_188742 ) ) ( not ( = ?auto_188736 ?auto_188737 ) ) ( not ( = ?auto_188736 ?auto_188738 ) ) ( not ( = ?auto_188736 ?auto_188739 ) ) ( not ( = ?auto_188736 ?auto_188740 ) ) ( not ( = ?auto_188736 ?auto_188741 ) ) ( not ( = ?auto_188736 ?auto_188742 ) ) ( not ( = ?auto_188737 ?auto_188738 ) ) ( not ( = ?auto_188737 ?auto_188739 ) ) ( not ( = ?auto_188737 ?auto_188740 ) ) ( not ( = ?auto_188737 ?auto_188741 ) ) ( not ( = ?auto_188737 ?auto_188742 ) ) ( not ( = ?auto_188738 ?auto_188739 ) ) ( not ( = ?auto_188738 ?auto_188740 ) ) ( not ( = ?auto_188738 ?auto_188741 ) ) ( not ( = ?auto_188738 ?auto_188742 ) ) ( not ( = ?auto_188739 ?auto_188740 ) ) ( not ( = ?auto_188739 ?auto_188741 ) ) ( not ( = ?auto_188739 ?auto_188742 ) ) ( not ( = ?auto_188740 ?auto_188741 ) ) ( not ( = ?auto_188740 ?auto_188742 ) ) ( not ( = ?auto_188741 ?auto_188742 ) ) ( ON ?auto_188741 ?auto_188742 ) ( ON ?auto_188740 ?auto_188741 ) ( ON ?auto_188739 ?auto_188740 ) ( ON ?auto_188738 ?auto_188739 ) ( ON ?auto_188737 ?auto_188738 ) ( ON ?auto_188736 ?auto_188737 ) ( ON ?auto_188735 ?auto_188736 ) ( ON ?auto_188734 ?auto_188735 ) ( CLEAR ?auto_188732 ) ( ON ?auto_188733 ?auto_188734 ) ( CLEAR ?auto_188733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188731 ?auto_188732 ?auto_188733 )
      ( MAKE-12PILE ?auto_188731 ?auto_188732 ?auto_188733 ?auto_188734 ?auto_188735 ?auto_188736 ?auto_188737 ?auto_188738 ?auto_188739 ?auto_188740 ?auto_188741 ?auto_188742 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188755 - BLOCK
      ?auto_188756 - BLOCK
      ?auto_188757 - BLOCK
      ?auto_188758 - BLOCK
      ?auto_188759 - BLOCK
      ?auto_188760 - BLOCK
      ?auto_188761 - BLOCK
      ?auto_188762 - BLOCK
      ?auto_188763 - BLOCK
      ?auto_188764 - BLOCK
      ?auto_188765 - BLOCK
      ?auto_188766 - BLOCK
    )
    :vars
    (
      ?auto_188767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188766 ?auto_188767 ) ( ON-TABLE ?auto_188755 ) ( not ( = ?auto_188755 ?auto_188756 ) ) ( not ( = ?auto_188755 ?auto_188757 ) ) ( not ( = ?auto_188755 ?auto_188758 ) ) ( not ( = ?auto_188755 ?auto_188759 ) ) ( not ( = ?auto_188755 ?auto_188760 ) ) ( not ( = ?auto_188755 ?auto_188761 ) ) ( not ( = ?auto_188755 ?auto_188762 ) ) ( not ( = ?auto_188755 ?auto_188763 ) ) ( not ( = ?auto_188755 ?auto_188764 ) ) ( not ( = ?auto_188755 ?auto_188765 ) ) ( not ( = ?auto_188755 ?auto_188766 ) ) ( not ( = ?auto_188755 ?auto_188767 ) ) ( not ( = ?auto_188756 ?auto_188757 ) ) ( not ( = ?auto_188756 ?auto_188758 ) ) ( not ( = ?auto_188756 ?auto_188759 ) ) ( not ( = ?auto_188756 ?auto_188760 ) ) ( not ( = ?auto_188756 ?auto_188761 ) ) ( not ( = ?auto_188756 ?auto_188762 ) ) ( not ( = ?auto_188756 ?auto_188763 ) ) ( not ( = ?auto_188756 ?auto_188764 ) ) ( not ( = ?auto_188756 ?auto_188765 ) ) ( not ( = ?auto_188756 ?auto_188766 ) ) ( not ( = ?auto_188756 ?auto_188767 ) ) ( not ( = ?auto_188757 ?auto_188758 ) ) ( not ( = ?auto_188757 ?auto_188759 ) ) ( not ( = ?auto_188757 ?auto_188760 ) ) ( not ( = ?auto_188757 ?auto_188761 ) ) ( not ( = ?auto_188757 ?auto_188762 ) ) ( not ( = ?auto_188757 ?auto_188763 ) ) ( not ( = ?auto_188757 ?auto_188764 ) ) ( not ( = ?auto_188757 ?auto_188765 ) ) ( not ( = ?auto_188757 ?auto_188766 ) ) ( not ( = ?auto_188757 ?auto_188767 ) ) ( not ( = ?auto_188758 ?auto_188759 ) ) ( not ( = ?auto_188758 ?auto_188760 ) ) ( not ( = ?auto_188758 ?auto_188761 ) ) ( not ( = ?auto_188758 ?auto_188762 ) ) ( not ( = ?auto_188758 ?auto_188763 ) ) ( not ( = ?auto_188758 ?auto_188764 ) ) ( not ( = ?auto_188758 ?auto_188765 ) ) ( not ( = ?auto_188758 ?auto_188766 ) ) ( not ( = ?auto_188758 ?auto_188767 ) ) ( not ( = ?auto_188759 ?auto_188760 ) ) ( not ( = ?auto_188759 ?auto_188761 ) ) ( not ( = ?auto_188759 ?auto_188762 ) ) ( not ( = ?auto_188759 ?auto_188763 ) ) ( not ( = ?auto_188759 ?auto_188764 ) ) ( not ( = ?auto_188759 ?auto_188765 ) ) ( not ( = ?auto_188759 ?auto_188766 ) ) ( not ( = ?auto_188759 ?auto_188767 ) ) ( not ( = ?auto_188760 ?auto_188761 ) ) ( not ( = ?auto_188760 ?auto_188762 ) ) ( not ( = ?auto_188760 ?auto_188763 ) ) ( not ( = ?auto_188760 ?auto_188764 ) ) ( not ( = ?auto_188760 ?auto_188765 ) ) ( not ( = ?auto_188760 ?auto_188766 ) ) ( not ( = ?auto_188760 ?auto_188767 ) ) ( not ( = ?auto_188761 ?auto_188762 ) ) ( not ( = ?auto_188761 ?auto_188763 ) ) ( not ( = ?auto_188761 ?auto_188764 ) ) ( not ( = ?auto_188761 ?auto_188765 ) ) ( not ( = ?auto_188761 ?auto_188766 ) ) ( not ( = ?auto_188761 ?auto_188767 ) ) ( not ( = ?auto_188762 ?auto_188763 ) ) ( not ( = ?auto_188762 ?auto_188764 ) ) ( not ( = ?auto_188762 ?auto_188765 ) ) ( not ( = ?auto_188762 ?auto_188766 ) ) ( not ( = ?auto_188762 ?auto_188767 ) ) ( not ( = ?auto_188763 ?auto_188764 ) ) ( not ( = ?auto_188763 ?auto_188765 ) ) ( not ( = ?auto_188763 ?auto_188766 ) ) ( not ( = ?auto_188763 ?auto_188767 ) ) ( not ( = ?auto_188764 ?auto_188765 ) ) ( not ( = ?auto_188764 ?auto_188766 ) ) ( not ( = ?auto_188764 ?auto_188767 ) ) ( not ( = ?auto_188765 ?auto_188766 ) ) ( not ( = ?auto_188765 ?auto_188767 ) ) ( not ( = ?auto_188766 ?auto_188767 ) ) ( ON ?auto_188765 ?auto_188766 ) ( ON ?auto_188764 ?auto_188765 ) ( ON ?auto_188763 ?auto_188764 ) ( ON ?auto_188762 ?auto_188763 ) ( ON ?auto_188761 ?auto_188762 ) ( ON ?auto_188760 ?auto_188761 ) ( ON ?auto_188759 ?auto_188760 ) ( ON ?auto_188758 ?auto_188759 ) ( ON ?auto_188757 ?auto_188758 ) ( CLEAR ?auto_188755 ) ( ON ?auto_188756 ?auto_188757 ) ( CLEAR ?auto_188756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188755 ?auto_188756 )
      ( MAKE-12PILE ?auto_188755 ?auto_188756 ?auto_188757 ?auto_188758 ?auto_188759 ?auto_188760 ?auto_188761 ?auto_188762 ?auto_188763 ?auto_188764 ?auto_188765 ?auto_188766 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188780 - BLOCK
      ?auto_188781 - BLOCK
      ?auto_188782 - BLOCK
      ?auto_188783 - BLOCK
      ?auto_188784 - BLOCK
      ?auto_188785 - BLOCK
      ?auto_188786 - BLOCK
      ?auto_188787 - BLOCK
      ?auto_188788 - BLOCK
      ?auto_188789 - BLOCK
      ?auto_188790 - BLOCK
      ?auto_188791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188791 ) ( ON-TABLE ?auto_188780 ) ( not ( = ?auto_188780 ?auto_188781 ) ) ( not ( = ?auto_188780 ?auto_188782 ) ) ( not ( = ?auto_188780 ?auto_188783 ) ) ( not ( = ?auto_188780 ?auto_188784 ) ) ( not ( = ?auto_188780 ?auto_188785 ) ) ( not ( = ?auto_188780 ?auto_188786 ) ) ( not ( = ?auto_188780 ?auto_188787 ) ) ( not ( = ?auto_188780 ?auto_188788 ) ) ( not ( = ?auto_188780 ?auto_188789 ) ) ( not ( = ?auto_188780 ?auto_188790 ) ) ( not ( = ?auto_188780 ?auto_188791 ) ) ( not ( = ?auto_188781 ?auto_188782 ) ) ( not ( = ?auto_188781 ?auto_188783 ) ) ( not ( = ?auto_188781 ?auto_188784 ) ) ( not ( = ?auto_188781 ?auto_188785 ) ) ( not ( = ?auto_188781 ?auto_188786 ) ) ( not ( = ?auto_188781 ?auto_188787 ) ) ( not ( = ?auto_188781 ?auto_188788 ) ) ( not ( = ?auto_188781 ?auto_188789 ) ) ( not ( = ?auto_188781 ?auto_188790 ) ) ( not ( = ?auto_188781 ?auto_188791 ) ) ( not ( = ?auto_188782 ?auto_188783 ) ) ( not ( = ?auto_188782 ?auto_188784 ) ) ( not ( = ?auto_188782 ?auto_188785 ) ) ( not ( = ?auto_188782 ?auto_188786 ) ) ( not ( = ?auto_188782 ?auto_188787 ) ) ( not ( = ?auto_188782 ?auto_188788 ) ) ( not ( = ?auto_188782 ?auto_188789 ) ) ( not ( = ?auto_188782 ?auto_188790 ) ) ( not ( = ?auto_188782 ?auto_188791 ) ) ( not ( = ?auto_188783 ?auto_188784 ) ) ( not ( = ?auto_188783 ?auto_188785 ) ) ( not ( = ?auto_188783 ?auto_188786 ) ) ( not ( = ?auto_188783 ?auto_188787 ) ) ( not ( = ?auto_188783 ?auto_188788 ) ) ( not ( = ?auto_188783 ?auto_188789 ) ) ( not ( = ?auto_188783 ?auto_188790 ) ) ( not ( = ?auto_188783 ?auto_188791 ) ) ( not ( = ?auto_188784 ?auto_188785 ) ) ( not ( = ?auto_188784 ?auto_188786 ) ) ( not ( = ?auto_188784 ?auto_188787 ) ) ( not ( = ?auto_188784 ?auto_188788 ) ) ( not ( = ?auto_188784 ?auto_188789 ) ) ( not ( = ?auto_188784 ?auto_188790 ) ) ( not ( = ?auto_188784 ?auto_188791 ) ) ( not ( = ?auto_188785 ?auto_188786 ) ) ( not ( = ?auto_188785 ?auto_188787 ) ) ( not ( = ?auto_188785 ?auto_188788 ) ) ( not ( = ?auto_188785 ?auto_188789 ) ) ( not ( = ?auto_188785 ?auto_188790 ) ) ( not ( = ?auto_188785 ?auto_188791 ) ) ( not ( = ?auto_188786 ?auto_188787 ) ) ( not ( = ?auto_188786 ?auto_188788 ) ) ( not ( = ?auto_188786 ?auto_188789 ) ) ( not ( = ?auto_188786 ?auto_188790 ) ) ( not ( = ?auto_188786 ?auto_188791 ) ) ( not ( = ?auto_188787 ?auto_188788 ) ) ( not ( = ?auto_188787 ?auto_188789 ) ) ( not ( = ?auto_188787 ?auto_188790 ) ) ( not ( = ?auto_188787 ?auto_188791 ) ) ( not ( = ?auto_188788 ?auto_188789 ) ) ( not ( = ?auto_188788 ?auto_188790 ) ) ( not ( = ?auto_188788 ?auto_188791 ) ) ( not ( = ?auto_188789 ?auto_188790 ) ) ( not ( = ?auto_188789 ?auto_188791 ) ) ( not ( = ?auto_188790 ?auto_188791 ) ) ( ON ?auto_188790 ?auto_188791 ) ( ON ?auto_188789 ?auto_188790 ) ( ON ?auto_188788 ?auto_188789 ) ( ON ?auto_188787 ?auto_188788 ) ( ON ?auto_188786 ?auto_188787 ) ( ON ?auto_188785 ?auto_188786 ) ( ON ?auto_188784 ?auto_188785 ) ( ON ?auto_188783 ?auto_188784 ) ( ON ?auto_188782 ?auto_188783 ) ( CLEAR ?auto_188780 ) ( ON ?auto_188781 ?auto_188782 ) ( CLEAR ?auto_188781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188780 ?auto_188781 )
      ( MAKE-12PILE ?auto_188780 ?auto_188781 ?auto_188782 ?auto_188783 ?auto_188784 ?auto_188785 ?auto_188786 ?auto_188787 ?auto_188788 ?auto_188789 ?auto_188790 ?auto_188791 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188804 - BLOCK
      ?auto_188805 - BLOCK
      ?auto_188806 - BLOCK
      ?auto_188807 - BLOCK
      ?auto_188808 - BLOCK
      ?auto_188809 - BLOCK
      ?auto_188810 - BLOCK
      ?auto_188811 - BLOCK
      ?auto_188812 - BLOCK
      ?auto_188813 - BLOCK
      ?auto_188814 - BLOCK
      ?auto_188815 - BLOCK
    )
    :vars
    (
      ?auto_188816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188815 ?auto_188816 ) ( not ( = ?auto_188804 ?auto_188805 ) ) ( not ( = ?auto_188804 ?auto_188806 ) ) ( not ( = ?auto_188804 ?auto_188807 ) ) ( not ( = ?auto_188804 ?auto_188808 ) ) ( not ( = ?auto_188804 ?auto_188809 ) ) ( not ( = ?auto_188804 ?auto_188810 ) ) ( not ( = ?auto_188804 ?auto_188811 ) ) ( not ( = ?auto_188804 ?auto_188812 ) ) ( not ( = ?auto_188804 ?auto_188813 ) ) ( not ( = ?auto_188804 ?auto_188814 ) ) ( not ( = ?auto_188804 ?auto_188815 ) ) ( not ( = ?auto_188804 ?auto_188816 ) ) ( not ( = ?auto_188805 ?auto_188806 ) ) ( not ( = ?auto_188805 ?auto_188807 ) ) ( not ( = ?auto_188805 ?auto_188808 ) ) ( not ( = ?auto_188805 ?auto_188809 ) ) ( not ( = ?auto_188805 ?auto_188810 ) ) ( not ( = ?auto_188805 ?auto_188811 ) ) ( not ( = ?auto_188805 ?auto_188812 ) ) ( not ( = ?auto_188805 ?auto_188813 ) ) ( not ( = ?auto_188805 ?auto_188814 ) ) ( not ( = ?auto_188805 ?auto_188815 ) ) ( not ( = ?auto_188805 ?auto_188816 ) ) ( not ( = ?auto_188806 ?auto_188807 ) ) ( not ( = ?auto_188806 ?auto_188808 ) ) ( not ( = ?auto_188806 ?auto_188809 ) ) ( not ( = ?auto_188806 ?auto_188810 ) ) ( not ( = ?auto_188806 ?auto_188811 ) ) ( not ( = ?auto_188806 ?auto_188812 ) ) ( not ( = ?auto_188806 ?auto_188813 ) ) ( not ( = ?auto_188806 ?auto_188814 ) ) ( not ( = ?auto_188806 ?auto_188815 ) ) ( not ( = ?auto_188806 ?auto_188816 ) ) ( not ( = ?auto_188807 ?auto_188808 ) ) ( not ( = ?auto_188807 ?auto_188809 ) ) ( not ( = ?auto_188807 ?auto_188810 ) ) ( not ( = ?auto_188807 ?auto_188811 ) ) ( not ( = ?auto_188807 ?auto_188812 ) ) ( not ( = ?auto_188807 ?auto_188813 ) ) ( not ( = ?auto_188807 ?auto_188814 ) ) ( not ( = ?auto_188807 ?auto_188815 ) ) ( not ( = ?auto_188807 ?auto_188816 ) ) ( not ( = ?auto_188808 ?auto_188809 ) ) ( not ( = ?auto_188808 ?auto_188810 ) ) ( not ( = ?auto_188808 ?auto_188811 ) ) ( not ( = ?auto_188808 ?auto_188812 ) ) ( not ( = ?auto_188808 ?auto_188813 ) ) ( not ( = ?auto_188808 ?auto_188814 ) ) ( not ( = ?auto_188808 ?auto_188815 ) ) ( not ( = ?auto_188808 ?auto_188816 ) ) ( not ( = ?auto_188809 ?auto_188810 ) ) ( not ( = ?auto_188809 ?auto_188811 ) ) ( not ( = ?auto_188809 ?auto_188812 ) ) ( not ( = ?auto_188809 ?auto_188813 ) ) ( not ( = ?auto_188809 ?auto_188814 ) ) ( not ( = ?auto_188809 ?auto_188815 ) ) ( not ( = ?auto_188809 ?auto_188816 ) ) ( not ( = ?auto_188810 ?auto_188811 ) ) ( not ( = ?auto_188810 ?auto_188812 ) ) ( not ( = ?auto_188810 ?auto_188813 ) ) ( not ( = ?auto_188810 ?auto_188814 ) ) ( not ( = ?auto_188810 ?auto_188815 ) ) ( not ( = ?auto_188810 ?auto_188816 ) ) ( not ( = ?auto_188811 ?auto_188812 ) ) ( not ( = ?auto_188811 ?auto_188813 ) ) ( not ( = ?auto_188811 ?auto_188814 ) ) ( not ( = ?auto_188811 ?auto_188815 ) ) ( not ( = ?auto_188811 ?auto_188816 ) ) ( not ( = ?auto_188812 ?auto_188813 ) ) ( not ( = ?auto_188812 ?auto_188814 ) ) ( not ( = ?auto_188812 ?auto_188815 ) ) ( not ( = ?auto_188812 ?auto_188816 ) ) ( not ( = ?auto_188813 ?auto_188814 ) ) ( not ( = ?auto_188813 ?auto_188815 ) ) ( not ( = ?auto_188813 ?auto_188816 ) ) ( not ( = ?auto_188814 ?auto_188815 ) ) ( not ( = ?auto_188814 ?auto_188816 ) ) ( not ( = ?auto_188815 ?auto_188816 ) ) ( ON ?auto_188814 ?auto_188815 ) ( ON ?auto_188813 ?auto_188814 ) ( ON ?auto_188812 ?auto_188813 ) ( ON ?auto_188811 ?auto_188812 ) ( ON ?auto_188810 ?auto_188811 ) ( ON ?auto_188809 ?auto_188810 ) ( ON ?auto_188808 ?auto_188809 ) ( ON ?auto_188807 ?auto_188808 ) ( ON ?auto_188806 ?auto_188807 ) ( ON ?auto_188805 ?auto_188806 ) ( ON ?auto_188804 ?auto_188805 ) ( CLEAR ?auto_188804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188804 )
      ( MAKE-12PILE ?auto_188804 ?auto_188805 ?auto_188806 ?auto_188807 ?auto_188808 ?auto_188809 ?auto_188810 ?auto_188811 ?auto_188812 ?auto_188813 ?auto_188814 ?auto_188815 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188829 - BLOCK
      ?auto_188830 - BLOCK
      ?auto_188831 - BLOCK
      ?auto_188832 - BLOCK
      ?auto_188833 - BLOCK
      ?auto_188834 - BLOCK
      ?auto_188835 - BLOCK
      ?auto_188836 - BLOCK
      ?auto_188837 - BLOCK
      ?auto_188838 - BLOCK
      ?auto_188839 - BLOCK
      ?auto_188840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188840 ) ( not ( = ?auto_188829 ?auto_188830 ) ) ( not ( = ?auto_188829 ?auto_188831 ) ) ( not ( = ?auto_188829 ?auto_188832 ) ) ( not ( = ?auto_188829 ?auto_188833 ) ) ( not ( = ?auto_188829 ?auto_188834 ) ) ( not ( = ?auto_188829 ?auto_188835 ) ) ( not ( = ?auto_188829 ?auto_188836 ) ) ( not ( = ?auto_188829 ?auto_188837 ) ) ( not ( = ?auto_188829 ?auto_188838 ) ) ( not ( = ?auto_188829 ?auto_188839 ) ) ( not ( = ?auto_188829 ?auto_188840 ) ) ( not ( = ?auto_188830 ?auto_188831 ) ) ( not ( = ?auto_188830 ?auto_188832 ) ) ( not ( = ?auto_188830 ?auto_188833 ) ) ( not ( = ?auto_188830 ?auto_188834 ) ) ( not ( = ?auto_188830 ?auto_188835 ) ) ( not ( = ?auto_188830 ?auto_188836 ) ) ( not ( = ?auto_188830 ?auto_188837 ) ) ( not ( = ?auto_188830 ?auto_188838 ) ) ( not ( = ?auto_188830 ?auto_188839 ) ) ( not ( = ?auto_188830 ?auto_188840 ) ) ( not ( = ?auto_188831 ?auto_188832 ) ) ( not ( = ?auto_188831 ?auto_188833 ) ) ( not ( = ?auto_188831 ?auto_188834 ) ) ( not ( = ?auto_188831 ?auto_188835 ) ) ( not ( = ?auto_188831 ?auto_188836 ) ) ( not ( = ?auto_188831 ?auto_188837 ) ) ( not ( = ?auto_188831 ?auto_188838 ) ) ( not ( = ?auto_188831 ?auto_188839 ) ) ( not ( = ?auto_188831 ?auto_188840 ) ) ( not ( = ?auto_188832 ?auto_188833 ) ) ( not ( = ?auto_188832 ?auto_188834 ) ) ( not ( = ?auto_188832 ?auto_188835 ) ) ( not ( = ?auto_188832 ?auto_188836 ) ) ( not ( = ?auto_188832 ?auto_188837 ) ) ( not ( = ?auto_188832 ?auto_188838 ) ) ( not ( = ?auto_188832 ?auto_188839 ) ) ( not ( = ?auto_188832 ?auto_188840 ) ) ( not ( = ?auto_188833 ?auto_188834 ) ) ( not ( = ?auto_188833 ?auto_188835 ) ) ( not ( = ?auto_188833 ?auto_188836 ) ) ( not ( = ?auto_188833 ?auto_188837 ) ) ( not ( = ?auto_188833 ?auto_188838 ) ) ( not ( = ?auto_188833 ?auto_188839 ) ) ( not ( = ?auto_188833 ?auto_188840 ) ) ( not ( = ?auto_188834 ?auto_188835 ) ) ( not ( = ?auto_188834 ?auto_188836 ) ) ( not ( = ?auto_188834 ?auto_188837 ) ) ( not ( = ?auto_188834 ?auto_188838 ) ) ( not ( = ?auto_188834 ?auto_188839 ) ) ( not ( = ?auto_188834 ?auto_188840 ) ) ( not ( = ?auto_188835 ?auto_188836 ) ) ( not ( = ?auto_188835 ?auto_188837 ) ) ( not ( = ?auto_188835 ?auto_188838 ) ) ( not ( = ?auto_188835 ?auto_188839 ) ) ( not ( = ?auto_188835 ?auto_188840 ) ) ( not ( = ?auto_188836 ?auto_188837 ) ) ( not ( = ?auto_188836 ?auto_188838 ) ) ( not ( = ?auto_188836 ?auto_188839 ) ) ( not ( = ?auto_188836 ?auto_188840 ) ) ( not ( = ?auto_188837 ?auto_188838 ) ) ( not ( = ?auto_188837 ?auto_188839 ) ) ( not ( = ?auto_188837 ?auto_188840 ) ) ( not ( = ?auto_188838 ?auto_188839 ) ) ( not ( = ?auto_188838 ?auto_188840 ) ) ( not ( = ?auto_188839 ?auto_188840 ) ) ( ON ?auto_188839 ?auto_188840 ) ( ON ?auto_188838 ?auto_188839 ) ( ON ?auto_188837 ?auto_188838 ) ( ON ?auto_188836 ?auto_188837 ) ( ON ?auto_188835 ?auto_188836 ) ( ON ?auto_188834 ?auto_188835 ) ( ON ?auto_188833 ?auto_188834 ) ( ON ?auto_188832 ?auto_188833 ) ( ON ?auto_188831 ?auto_188832 ) ( ON ?auto_188830 ?auto_188831 ) ( ON ?auto_188829 ?auto_188830 ) ( CLEAR ?auto_188829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188829 )
      ( MAKE-12PILE ?auto_188829 ?auto_188830 ?auto_188831 ?auto_188832 ?auto_188833 ?auto_188834 ?auto_188835 ?auto_188836 ?auto_188837 ?auto_188838 ?auto_188839 ?auto_188840 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_188853 - BLOCK
      ?auto_188854 - BLOCK
      ?auto_188855 - BLOCK
      ?auto_188856 - BLOCK
      ?auto_188857 - BLOCK
      ?auto_188858 - BLOCK
      ?auto_188859 - BLOCK
      ?auto_188860 - BLOCK
      ?auto_188861 - BLOCK
      ?auto_188862 - BLOCK
      ?auto_188863 - BLOCK
      ?auto_188864 - BLOCK
    )
    :vars
    (
      ?auto_188865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188853 ?auto_188854 ) ) ( not ( = ?auto_188853 ?auto_188855 ) ) ( not ( = ?auto_188853 ?auto_188856 ) ) ( not ( = ?auto_188853 ?auto_188857 ) ) ( not ( = ?auto_188853 ?auto_188858 ) ) ( not ( = ?auto_188853 ?auto_188859 ) ) ( not ( = ?auto_188853 ?auto_188860 ) ) ( not ( = ?auto_188853 ?auto_188861 ) ) ( not ( = ?auto_188853 ?auto_188862 ) ) ( not ( = ?auto_188853 ?auto_188863 ) ) ( not ( = ?auto_188853 ?auto_188864 ) ) ( not ( = ?auto_188854 ?auto_188855 ) ) ( not ( = ?auto_188854 ?auto_188856 ) ) ( not ( = ?auto_188854 ?auto_188857 ) ) ( not ( = ?auto_188854 ?auto_188858 ) ) ( not ( = ?auto_188854 ?auto_188859 ) ) ( not ( = ?auto_188854 ?auto_188860 ) ) ( not ( = ?auto_188854 ?auto_188861 ) ) ( not ( = ?auto_188854 ?auto_188862 ) ) ( not ( = ?auto_188854 ?auto_188863 ) ) ( not ( = ?auto_188854 ?auto_188864 ) ) ( not ( = ?auto_188855 ?auto_188856 ) ) ( not ( = ?auto_188855 ?auto_188857 ) ) ( not ( = ?auto_188855 ?auto_188858 ) ) ( not ( = ?auto_188855 ?auto_188859 ) ) ( not ( = ?auto_188855 ?auto_188860 ) ) ( not ( = ?auto_188855 ?auto_188861 ) ) ( not ( = ?auto_188855 ?auto_188862 ) ) ( not ( = ?auto_188855 ?auto_188863 ) ) ( not ( = ?auto_188855 ?auto_188864 ) ) ( not ( = ?auto_188856 ?auto_188857 ) ) ( not ( = ?auto_188856 ?auto_188858 ) ) ( not ( = ?auto_188856 ?auto_188859 ) ) ( not ( = ?auto_188856 ?auto_188860 ) ) ( not ( = ?auto_188856 ?auto_188861 ) ) ( not ( = ?auto_188856 ?auto_188862 ) ) ( not ( = ?auto_188856 ?auto_188863 ) ) ( not ( = ?auto_188856 ?auto_188864 ) ) ( not ( = ?auto_188857 ?auto_188858 ) ) ( not ( = ?auto_188857 ?auto_188859 ) ) ( not ( = ?auto_188857 ?auto_188860 ) ) ( not ( = ?auto_188857 ?auto_188861 ) ) ( not ( = ?auto_188857 ?auto_188862 ) ) ( not ( = ?auto_188857 ?auto_188863 ) ) ( not ( = ?auto_188857 ?auto_188864 ) ) ( not ( = ?auto_188858 ?auto_188859 ) ) ( not ( = ?auto_188858 ?auto_188860 ) ) ( not ( = ?auto_188858 ?auto_188861 ) ) ( not ( = ?auto_188858 ?auto_188862 ) ) ( not ( = ?auto_188858 ?auto_188863 ) ) ( not ( = ?auto_188858 ?auto_188864 ) ) ( not ( = ?auto_188859 ?auto_188860 ) ) ( not ( = ?auto_188859 ?auto_188861 ) ) ( not ( = ?auto_188859 ?auto_188862 ) ) ( not ( = ?auto_188859 ?auto_188863 ) ) ( not ( = ?auto_188859 ?auto_188864 ) ) ( not ( = ?auto_188860 ?auto_188861 ) ) ( not ( = ?auto_188860 ?auto_188862 ) ) ( not ( = ?auto_188860 ?auto_188863 ) ) ( not ( = ?auto_188860 ?auto_188864 ) ) ( not ( = ?auto_188861 ?auto_188862 ) ) ( not ( = ?auto_188861 ?auto_188863 ) ) ( not ( = ?auto_188861 ?auto_188864 ) ) ( not ( = ?auto_188862 ?auto_188863 ) ) ( not ( = ?auto_188862 ?auto_188864 ) ) ( not ( = ?auto_188863 ?auto_188864 ) ) ( ON ?auto_188853 ?auto_188865 ) ( not ( = ?auto_188864 ?auto_188865 ) ) ( not ( = ?auto_188863 ?auto_188865 ) ) ( not ( = ?auto_188862 ?auto_188865 ) ) ( not ( = ?auto_188861 ?auto_188865 ) ) ( not ( = ?auto_188860 ?auto_188865 ) ) ( not ( = ?auto_188859 ?auto_188865 ) ) ( not ( = ?auto_188858 ?auto_188865 ) ) ( not ( = ?auto_188857 ?auto_188865 ) ) ( not ( = ?auto_188856 ?auto_188865 ) ) ( not ( = ?auto_188855 ?auto_188865 ) ) ( not ( = ?auto_188854 ?auto_188865 ) ) ( not ( = ?auto_188853 ?auto_188865 ) ) ( ON ?auto_188854 ?auto_188853 ) ( ON ?auto_188855 ?auto_188854 ) ( ON ?auto_188856 ?auto_188855 ) ( ON ?auto_188857 ?auto_188856 ) ( ON ?auto_188858 ?auto_188857 ) ( ON ?auto_188859 ?auto_188858 ) ( ON ?auto_188860 ?auto_188859 ) ( ON ?auto_188861 ?auto_188860 ) ( ON ?auto_188862 ?auto_188861 ) ( ON ?auto_188863 ?auto_188862 ) ( ON ?auto_188864 ?auto_188863 ) ( CLEAR ?auto_188864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_188864 ?auto_188863 ?auto_188862 ?auto_188861 ?auto_188860 ?auto_188859 ?auto_188858 ?auto_188857 ?auto_188856 ?auto_188855 ?auto_188854 ?auto_188853 )
      ( MAKE-12PILE ?auto_188853 ?auto_188854 ?auto_188855 ?auto_188856 ?auto_188857 ?auto_188858 ?auto_188859 ?auto_188860 ?auto_188861 ?auto_188862 ?auto_188863 ?auto_188864 ) )
  )

)

