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
      ?auto_85148 - BLOCK
    )
    :vars
    (
      ?auto_85149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85148 ?auto_85149 ) ( CLEAR ?auto_85148 ) ( HAND-EMPTY ) ( not ( = ?auto_85148 ?auto_85149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85148 ?auto_85149 )
      ( !PUTDOWN ?auto_85148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85155 - BLOCK
      ?auto_85156 - BLOCK
    )
    :vars
    (
      ?auto_85157 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85155 ) ( ON ?auto_85156 ?auto_85157 ) ( CLEAR ?auto_85156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85155 ) ( not ( = ?auto_85155 ?auto_85156 ) ) ( not ( = ?auto_85155 ?auto_85157 ) ) ( not ( = ?auto_85156 ?auto_85157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85156 ?auto_85157 )
      ( !STACK ?auto_85156 ?auto_85155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85165 - BLOCK
      ?auto_85166 - BLOCK
    )
    :vars
    (
      ?auto_85167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85166 ?auto_85167 ) ( not ( = ?auto_85165 ?auto_85166 ) ) ( not ( = ?auto_85165 ?auto_85167 ) ) ( not ( = ?auto_85166 ?auto_85167 ) ) ( ON ?auto_85165 ?auto_85166 ) ( CLEAR ?auto_85165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85165 )
      ( MAKE-2PILE ?auto_85165 ?auto_85166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85176 - BLOCK
      ?auto_85177 - BLOCK
      ?auto_85178 - BLOCK
    )
    :vars
    (
      ?auto_85179 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85177 ) ( ON ?auto_85178 ?auto_85179 ) ( CLEAR ?auto_85178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85176 ) ( ON ?auto_85177 ?auto_85176 ) ( not ( = ?auto_85176 ?auto_85177 ) ) ( not ( = ?auto_85176 ?auto_85178 ) ) ( not ( = ?auto_85176 ?auto_85179 ) ) ( not ( = ?auto_85177 ?auto_85178 ) ) ( not ( = ?auto_85177 ?auto_85179 ) ) ( not ( = ?auto_85178 ?auto_85179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85178 ?auto_85179 )
      ( !STACK ?auto_85178 ?auto_85177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85190 - BLOCK
      ?auto_85191 - BLOCK
      ?auto_85192 - BLOCK
    )
    :vars
    (
      ?auto_85193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85192 ?auto_85193 ) ( ON-TABLE ?auto_85190 ) ( not ( = ?auto_85190 ?auto_85191 ) ) ( not ( = ?auto_85190 ?auto_85192 ) ) ( not ( = ?auto_85190 ?auto_85193 ) ) ( not ( = ?auto_85191 ?auto_85192 ) ) ( not ( = ?auto_85191 ?auto_85193 ) ) ( not ( = ?auto_85192 ?auto_85193 ) ) ( CLEAR ?auto_85190 ) ( ON ?auto_85191 ?auto_85192 ) ( CLEAR ?auto_85191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85190 ?auto_85191 )
      ( MAKE-3PILE ?auto_85190 ?auto_85191 ?auto_85192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85204 - BLOCK
      ?auto_85205 - BLOCK
      ?auto_85206 - BLOCK
    )
    :vars
    (
      ?auto_85207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85206 ?auto_85207 ) ( not ( = ?auto_85204 ?auto_85205 ) ) ( not ( = ?auto_85204 ?auto_85206 ) ) ( not ( = ?auto_85204 ?auto_85207 ) ) ( not ( = ?auto_85205 ?auto_85206 ) ) ( not ( = ?auto_85205 ?auto_85207 ) ) ( not ( = ?auto_85206 ?auto_85207 ) ) ( ON ?auto_85205 ?auto_85206 ) ( ON ?auto_85204 ?auto_85205 ) ( CLEAR ?auto_85204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85204 )
      ( MAKE-3PILE ?auto_85204 ?auto_85205 ?auto_85206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85219 - BLOCK
      ?auto_85220 - BLOCK
      ?auto_85221 - BLOCK
      ?auto_85222 - BLOCK
    )
    :vars
    (
      ?auto_85223 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85221 ) ( ON ?auto_85222 ?auto_85223 ) ( CLEAR ?auto_85222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85219 ) ( ON ?auto_85220 ?auto_85219 ) ( ON ?auto_85221 ?auto_85220 ) ( not ( = ?auto_85219 ?auto_85220 ) ) ( not ( = ?auto_85219 ?auto_85221 ) ) ( not ( = ?auto_85219 ?auto_85222 ) ) ( not ( = ?auto_85219 ?auto_85223 ) ) ( not ( = ?auto_85220 ?auto_85221 ) ) ( not ( = ?auto_85220 ?auto_85222 ) ) ( not ( = ?auto_85220 ?auto_85223 ) ) ( not ( = ?auto_85221 ?auto_85222 ) ) ( not ( = ?auto_85221 ?auto_85223 ) ) ( not ( = ?auto_85222 ?auto_85223 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85222 ?auto_85223 )
      ( !STACK ?auto_85222 ?auto_85221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85237 - BLOCK
      ?auto_85238 - BLOCK
      ?auto_85239 - BLOCK
      ?auto_85240 - BLOCK
    )
    :vars
    (
      ?auto_85241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85240 ?auto_85241 ) ( ON-TABLE ?auto_85237 ) ( ON ?auto_85238 ?auto_85237 ) ( not ( = ?auto_85237 ?auto_85238 ) ) ( not ( = ?auto_85237 ?auto_85239 ) ) ( not ( = ?auto_85237 ?auto_85240 ) ) ( not ( = ?auto_85237 ?auto_85241 ) ) ( not ( = ?auto_85238 ?auto_85239 ) ) ( not ( = ?auto_85238 ?auto_85240 ) ) ( not ( = ?auto_85238 ?auto_85241 ) ) ( not ( = ?auto_85239 ?auto_85240 ) ) ( not ( = ?auto_85239 ?auto_85241 ) ) ( not ( = ?auto_85240 ?auto_85241 ) ) ( CLEAR ?auto_85238 ) ( ON ?auto_85239 ?auto_85240 ) ( CLEAR ?auto_85239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85237 ?auto_85238 ?auto_85239 )
      ( MAKE-4PILE ?auto_85237 ?auto_85238 ?auto_85239 ?auto_85240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85255 - BLOCK
      ?auto_85256 - BLOCK
      ?auto_85257 - BLOCK
      ?auto_85258 - BLOCK
    )
    :vars
    (
      ?auto_85259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85258 ?auto_85259 ) ( ON-TABLE ?auto_85255 ) ( not ( = ?auto_85255 ?auto_85256 ) ) ( not ( = ?auto_85255 ?auto_85257 ) ) ( not ( = ?auto_85255 ?auto_85258 ) ) ( not ( = ?auto_85255 ?auto_85259 ) ) ( not ( = ?auto_85256 ?auto_85257 ) ) ( not ( = ?auto_85256 ?auto_85258 ) ) ( not ( = ?auto_85256 ?auto_85259 ) ) ( not ( = ?auto_85257 ?auto_85258 ) ) ( not ( = ?auto_85257 ?auto_85259 ) ) ( not ( = ?auto_85258 ?auto_85259 ) ) ( ON ?auto_85257 ?auto_85258 ) ( CLEAR ?auto_85255 ) ( ON ?auto_85256 ?auto_85257 ) ( CLEAR ?auto_85256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85255 ?auto_85256 )
      ( MAKE-4PILE ?auto_85255 ?auto_85256 ?auto_85257 ?auto_85258 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85273 - BLOCK
      ?auto_85274 - BLOCK
      ?auto_85275 - BLOCK
      ?auto_85276 - BLOCK
    )
    :vars
    (
      ?auto_85277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85276 ?auto_85277 ) ( not ( = ?auto_85273 ?auto_85274 ) ) ( not ( = ?auto_85273 ?auto_85275 ) ) ( not ( = ?auto_85273 ?auto_85276 ) ) ( not ( = ?auto_85273 ?auto_85277 ) ) ( not ( = ?auto_85274 ?auto_85275 ) ) ( not ( = ?auto_85274 ?auto_85276 ) ) ( not ( = ?auto_85274 ?auto_85277 ) ) ( not ( = ?auto_85275 ?auto_85276 ) ) ( not ( = ?auto_85275 ?auto_85277 ) ) ( not ( = ?auto_85276 ?auto_85277 ) ) ( ON ?auto_85275 ?auto_85276 ) ( ON ?auto_85274 ?auto_85275 ) ( ON ?auto_85273 ?auto_85274 ) ( CLEAR ?auto_85273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85273 )
      ( MAKE-4PILE ?auto_85273 ?auto_85274 ?auto_85275 ?auto_85276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85292 - BLOCK
      ?auto_85293 - BLOCK
      ?auto_85294 - BLOCK
      ?auto_85295 - BLOCK
      ?auto_85296 - BLOCK
    )
    :vars
    (
      ?auto_85297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85295 ) ( ON ?auto_85296 ?auto_85297 ) ( CLEAR ?auto_85296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85292 ) ( ON ?auto_85293 ?auto_85292 ) ( ON ?auto_85294 ?auto_85293 ) ( ON ?auto_85295 ?auto_85294 ) ( not ( = ?auto_85292 ?auto_85293 ) ) ( not ( = ?auto_85292 ?auto_85294 ) ) ( not ( = ?auto_85292 ?auto_85295 ) ) ( not ( = ?auto_85292 ?auto_85296 ) ) ( not ( = ?auto_85292 ?auto_85297 ) ) ( not ( = ?auto_85293 ?auto_85294 ) ) ( not ( = ?auto_85293 ?auto_85295 ) ) ( not ( = ?auto_85293 ?auto_85296 ) ) ( not ( = ?auto_85293 ?auto_85297 ) ) ( not ( = ?auto_85294 ?auto_85295 ) ) ( not ( = ?auto_85294 ?auto_85296 ) ) ( not ( = ?auto_85294 ?auto_85297 ) ) ( not ( = ?auto_85295 ?auto_85296 ) ) ( not ( = ?auto_85295 ?auto_85297 ) ) ( not ( = ?auto_85296 ?auto_85297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85296 ?auto_85297 )
      ( !STACK ?auto_85296 ?auto_85295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85314 - BLOCK
      ?auto_85315 - BLOCK
      ?auto_85316 - BLOCK
      ?auto_85317 - BLOCK
      ?auto_85318 - BLOCK
    )
    :vars
    (
      ?auto_85319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85318 ?auto_85319 ) ( ON-TABLE ?auto_85314 ) ( ON ?auto_85315 ?auto_85314 ) ( ON ?auto_85316 ?auto_85315 ) ( not ( = ?auto_85314 ?auto_85315 ) ) ( not ( = ?auto_85314 ?auto_85316 ) ) ( not ( = ?auto_85314 ?auto_85317 ) ) ( not ( = ?auto_85314 ?auto_85318 ) ) ( not ( = ?auto_85314 ?auto_85319 ) ) ( not ( = ?auto_85315 ?auto_85316 ) ) ( not ( = ?auto_85315 ?auto_85317 ) ) ( not ( = ?auto_85315 ?auto_85318 ) ) ( not ( = ?auto_85315 ?auto_85319 ) ) ( not ( = ?auto_85316 ?auto_85317 ) ) ( not ( = ?auto_85316 ?auto_85318 ) ) ( not ( = ?auto_85316 ?auto_85319 ) ) ( not ( = ?auto_85317 ?auto_85318 ) ) ( not ( = ?auto_85317 ?auto_85319 ) ) ( not ( = ?auto_85318 ?auto_85319 ) ) ( CLEAR ?auto_85316 ) ( ON ?auto_85317 ?auto_85318 ) ( CLEAR ?auto_85317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85314 ?auto_85315 ?auto_85316 ?auto_85317 )
      ( MAKE-5PILE ?auto_85314 ?auto_85315 ?auto_85316 ?auto_85317 ?auto_85318 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85336 - BLOCK
      ?auto_85337 - BLOCK
      ?auto_85338 - BLOCK
      ?auto_85339 - BLOCK
      ?auto_85340 - BLOCK
    )
    :vars
    (
      ?auto_85341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85340 ?auto_85341 ) ( ON-TABLE ?auto_85336 ) ( ON ?auto_85337 ?auto_85336 ) ( not ( = ?auto_85336 ?auto_85337 ) ) ( not ( = ?auto_85336 ?auto_85338 ) ) ( not ( = ?auto_85336 ?auto_85339 ) ) ( not ( = ?auto_85336 ?auto_85340 ) ) ( not ( = ?auto_85336 ?auto_85341 ) ) ( not ( = ?auto_85337 ?auto_85338 ) ) ( not ( = ?auto_85337 ?auto_85339 ) ) ( not ( = ?auto_85337 ?auto_85340 ) ) ( not ( = ?auto_85337 ?auto_85341 ) ) ( not ( = ?auto_85338 ?auto_85339 ) ) ( not ( = ?auto_85338 ?auto_85340 ) ) ( not ( = ?auto_85338 ?auto_85341 ) ) ( not ( = ?auto_85339 ?auto_85340 ) ) ( not ( = ?auto_85339 ?auto_85341 ) ) ( not ( = ?auto_85340 ?auto_85341 ) ) ( ON ?auto_85339 ?auto_85340 ) ( CLEAR ?auto_85337 ) ( ON ?auto_85338 ?auto_85339 ) ( CLEAR ?auto_85338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85336 ?auto_85337 ?auto_85338 )
      ( MAKE-5PILE ?auto_85336 ?auto_85337 ?auto_85338 ?auto_85339 ?auto_85340 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85358 - BLOCK
      ?auto_85359 - BLOCK
      ?auto_85360 - BLOCK
      ?auto_85361 - BLOCK
      ?auto_85362 - BLOCK
    )
    :vars
    (
      ?auto_85363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85362 ?auto_85363 ) ( ON-TABLE ?auto_85358 ) ( not ( = ?auto_85358 ?auto_85359 ) ) ( not ( = ?auto_85358 ?auto_85360 ) ) ( not ( = ?auto_85358 ?auto_85361 ) ) ( not ( = ?auto_85358 ?auto_85362 ) ) ( not ( = ?auto_85358 ?auto_85363 ) ) ( not ( = ?auto_85359 ?auto_85360 ) ) ( not ( = ?auto_85359 ?auto_85361 ) ) ( not ( = ?auto_85359 ?auto_85362 ) ) ( not ( = ?auto_85359 ?auto_85363 ) ) ( not ( = ?auto_85360 ?auto_85361 ) ) ( not ( = ?auto_85360 ?auto_85362 ) ) ( not ( = ?auto_85360 ?auto_85363 ) ) ( not ( = ?auto_85361 ?auto_85362 ) ) ( not ( = ?auto_85361 ?auto_85363 ) ) ( not ( = ?auto_85362 ?auto_85363 ) ) ( ON ?auto_85361 ?auto_85362 ) ( ON ?auto_85360 ?auto_85361 ) ( CLEAR ?auto_85358 ) ( ON ?auto_85359 ?auto_85360 ) ( CLEAR ?auto_85359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85358 ?auto_85359 )
      ( MAKE-5PILE ?auto_85358 ?auto_85359 ?auto_85360 ?auto_85361 ?auto_85362 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85380 - BLOCK
      ?auto_85381 - BLOCK
      ?auto_85382 - BLOCK
      ?auto_85383 - BLOCK
      ?auto_85384 - BLOCK
    )
    :vars
    (
      ?auto_85385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85384 ?auto_85385 ) ( not ( = ?auto_85380 ?auto_85381 ) ) ( not ( = ?auto_85380 ?auto_85382 ) ) ( not ( = ?auto_85380 ?auto_85383 ) ) ( not ( = ?auto_85380 ?auto_85384 ) ) ( not ( = ?auto_85380 ?auto_85385 ) ) ( not ( = ?auto_85381 ?auto_85382 ) ) ( not ( = ?auto_85381 ?auto_85383 ) ) ( not ( = ?auto_85381 ?auto_85384 ) ) ( not ( = ?auto_85381 ?auto_85385 ) ) ( not ( = ?auto_85382 ?auto_85383 ) ) ( not ( = ?auto_85382 ?auto_85384 ) ) ( not ( = ?auto_85382 ?auto_85385 ) ) ( not ( = ?auto_85383 ?auto_85384 ) ) ( not ( = ?auto_85383 ?auto_85385 ) ) ( not ( = ?auto_85384 ?auto_85385 ) ) ( ON ?auto_85383 ?auto_85384 ) ( ON ?auto_85382 ?auto_85383 ) ( ON ?auto_85381 ?auto_85382 ) ( ON ?auto_85380 ?auto_85381 ) ( CLEAR ?auto_85380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85380 )
      ( MAKE-5PILE ?auto_85380 ?auto_85381 ?auto_85382 ?auto_85383 ?auto_85384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85403 - BLOCK
      ?auto_85404 - BLOCK
      ?auto_85405 - BLOCK
      ?auto_85406 - BLOCK
      ?auto_85407 - BLOCK
      ?auto_85408 - BLOCK
    )
    :vars
    (
      ?auto_85409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85407 ) ( ON ?auto_85408 ?auto_85409 ) ( CLEAR ?auto_85408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85403 ) ( ON ?auto_85404 ?auto_85403 ) ( ON ?auto_85405 ?auto_85404 ) ( ON ?auto_85406 ?auto_85405 ) ( ON ?auto_85407 ?auto_85406 ) ( not ( = ?auto_85403 ?auto_85404 ) ) ( not ( = ?auto_85403 ?auto_85405 ) ) ( not ( = ?auto_85403 ?auto_85406 ) ) ( not ( = ?auto_85403 ?auto_85407 ) ) ( not ( = ?auto_85403 ?auto_85408 ) ) ( not ( = ?auto_85403 ?auto_85409 ) ) ( not ( = ?auto_85404 ?auto_85405 ) ) ( not ( = ?auto_85404 ?auto_85406 ) ) ( not ( = ?auto_85404 ?auto_85407 ) ) ( not ( = ?auto_85404 ?auto_85408 ) ) ( not ( = ?auto_85404 ?auto_85409 ) ) ( not ( = ?auto_85405 ?auto_85406 ) ) ( not ( = ?auto_85405 ?auto_85407 ) ) ( not ( = ?auto_85405 ?auto_85408 ) ) ( not ( = ?auto_85405 ?auto_85409 ) ) ( not ( = ?auto_85406 ?auto_85407 ) ) ( not ( = ?auto_85406 ?auto_85408 ) ) ( not ( = ?auto_85406 ?auto_85409 ) ) ( not ( = ?auto_85407 ?auto_85408 ) ) ( not ( = ?auto_85407 ?auto_85409 ) ) ( not ( = ?auto_85408 ?auto_85409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85408 ?auto_85409 )
      ( !STACK ?auto_85408 ?auto_85407 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85429 - BLOCK
      ?auto_85430 - BLOCK
      ?auto_85431 - BLOCK
      ?auto_85432 - BLOCK
      ?auto_85433 - BLOCK
      ?auto_85434 - BLOCK
    )
    :vars
    (
      ?auto_85435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85434 ?auto_85435 ) ( ON-TABLE ?auto_85429 ) ( ON ?auto_85430 ?auto_85429 ) ( ON ?auto_85431 ?auto_85430 ) ( ON ?auto_85432 ?auto_85431 ) ( not ( = ?auto_85429 ?auto_85430 ) ) ( not ( = ?auto_85429 ?auto_85431 ) ) ( not ( = ?auto_85429 ?auto_85432 ) ) ( not ( = ?auto_85429 ?auto_85433 ) ) ( not ( = ?auto_85429 ?auto_85434 ) ) ( not ( = ?auto_85429 ?auto_85435 ) ) ( not ( = ?auto_85430 ?auto_85431 ) ) ( not ( = ?auto_85430 ?auto_85432 ) ) ( not ( = ?auto_85430 ?auto_85433 ) ) ( not ( = ?auto_85430 ?auto_85434 ) ) ( not ( = ?auto_85430 ?auto_85435 ) ) ( not ( = ?auto_85431 ?auto_85432 ) ) ( not ( = ?auto_85431 ?auto_85433 ) ) ( not ( = ?auto_85431 ?auto_85434 ) ) ( not ( = ?auto_85431 ?auto_85435 ) ) ( not ( = ?auto_85432 ?auto_85433 ) ) ( not ( = ?auto_85432 ?auto_85434 ) ) ( not ( = ?auto_85432 ?auto_85435 ) ) ( not ( = ?auto_85433 ?auto_85434 ) ) ( not ( = ?auto_85433 ?auto_85435 ) ) ( not ( = ?auto_85434 ?auto_85435 ) ) ( CLEAR ?auto_85432 ) ( ON ?auto_85433 ?auto_85434 ) ( CLEAR ?auto_85433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85429 ?auto_85430 ?auto_85431 ?auto_85432 ?auto_85433 )
      ( MAKE-6PILE ?auto_85429 ?auto_85430 ?auto_85431 ?auto_85432 ?auto_85433 ?auto_85434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85455 - BLOCK
      ?auto_85456 - BLOCK
      ?auto_85457 - BLOCK
      ?auto_85458 - BLOCK
      ?auto_85459 - BLOCK
      ?auto_85460 - BLOCK
    )
    :vars
    (
      ?auto_85461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85460 ?auto_85461 ) ( ON-TABLE ?auto_85455 ) ( ON ?auto_85456 ?auto_85455 ) ( ON ?auto_85457 ?auto_85456 ) ( not ( = ?auto_85455 ?auto_85456 ) ) ( not ( = ?auto_85455 ?auto_85457 ) ) ( not ( = ?auto_85455 ?auto_85458 ) ) ( not ( = ?auto_85455 ?auto_85459 ) ) ( not ( = ?auto_85455 ?auto_85460 ) ) ( not ( = ?auto_85455 ?auto_85461 ) ) ( not ( = ?auto_85456 ?auto_85457 ) ) ( not ( = ?auto_85456 ?auto_85458 ) ) ( not ( = ?auto_85456 ?auto_85459 ) ) ( not ( = ?auto_85456 ?auto_85460 ) ) ( not ( = ?auto_85456 ?auto_85461 ) ) ( not ( = ?auto_85457 ?auto_85458 ) ) ( not ( = ?auto_85457 ?auto_85459 ) ) ( not ( = ?auto_85457 ?auto_85460 ) ) ( not ( = ?auto_85457 ?auto_85461 ) ) ( not ( = ?auto_85458 ?auto_85459 ) ) ( not ( = ?auto_85458 ?auto_85460 ) ) ( not ( = ?auto_85458 ?auto_85461 ) ) ( not ( = ?auto_85459 ?auto_85460 ) ) ( not ( = ?auto_85459 ?auto_85461 ) ) ( not ( = ?auto_85460 ?auto_85461 ) ) ( ON ?auto_85459 ?auto_85460 ) ( CLEAR ?auto_85457 ) ( ON ?auto_85458 ?auto_85459 ) ( CLEAR ?auto_85458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85455 ?auto_85456 ?auto_85457 ?auto_85458 )
      ( MAKE-6PILE ?auto_85455 ?auto_85456 ?auto_85457 ?auto_85458 ?auto_85459 ?auto_85460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85481 - BLOCK
      ?auto_85482 - BLOCK
      ?auto_85483 - BLOCK
      ?auto_85484 - BLOCK
      ?auto_85485 - BLOCK
      ?auto_85486 - BLOCK
    )
    :vars
    (
      ?auto_85487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85486 ?auto_85487 ) ( ON-TABLE ?auto_85481 ) ( ON ?auto_85482 ?auto_85481 ) ( not ( = ?auto_85481 ?auto_85482 ) ) ( not ( = ?auto_85481 ?auto_85483 ) ) ( not ( = ?auto_85481 ?auto_85484 ) ) ( not ( = ?auto_85481 ?auto_85485 ) ) ( not ( = ?auto_85481 ?auto_85486 ) ) ( not ( = ?auto_85481 ?auto_85487 ) ) ( not ( = ?auto_85482 ?auto_85483 ) ) ( not ( = ?auto_85482 ?auto_85484 ) ) ( not ( = ?auto_85482 ?auto_85485 ) ) ( not ( = ?auto_85482 ?auto_85486 ) ) ( not ( = ?auto_85482 ?auto_85487 ) ) ( not ( = ?auto_85483 ?auto_85484 ) ) ( not ( = ?auto_85483 ?auto_85485 ) ) ( not ( = ?auto_85483 ?auto_85486 ) ) ( not ( = ?auto_85483 ?auto_85487 ) ) ( not ( = ?auto_85484 ?auto_85485 ) ) ( not ( = ?auto_85484 ?auto_85486 ) ) ( not ( = ?auto_85484 ?auto_85487 ) ) ( not ( = ?auto_85485 ?auto_85486 ) ) ( not ( = ?auto_85485 ?auto_85487 ) ) ( not ( = ?auto_85486 ?auto_85487 ) ) ( ON ?auto_85485 ?auto_85486 ) ( ON ?auto_85484 ?auto_85485 ) ( CLEAR ?auto_85482 ) ( ON ?auto_85483 ?auto_85484 ) ( CLEAR ?auto_85483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85481 ?auto_85482 ?auto_85483 )
      ( MAKE-6PILE ?auto_85481 ?auto_85482 ?auto_85483 ?auto_85484 ?auto_85485 ?auto_85486 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85507 - BLOCK
      ?auto_85508 - BLOCK
      ?auto_85509 - BLOCK
      ?auto_85510 - BLOCK
      ?auto_85511 - BLOCK
      ?auto_85512 - BLOCK
    )
    :vars
    (
      ?auto_85513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85512 ?auto_85513 ) ( ON-TABLE ?auto_85507 ) ( not ( = ?auto_85507 ?auto_85508 ) ) ( not ( = ?auto_85507 ?auto_85509 ) ) ( not ( = ?auto_85507 ?auto_85510 ) ) ( not ( = ?auto_85507 ?auto_85511 ) ) ( not ( = ?auto_85507 ?auto_85512 ) ) ( not ( = ?auto_85507 ?auto_85513 ) ) ( not ( = ?auto_85508 ?auto_85509 ) ) ( not ( = ?auto_85508 ?auto_85510 ) ) ( not ( = ?auto_85508 ?auto_85511 ) ) ( not ( = ?auto_85508 ?auto_85512 ) ) ( not ( = ?auto_85508 ?auto_85513 ) ) ( not ( = ?auto_85509 ?auto_85510 ) ) ( not ( = ?auto_85509 ?auto_85511 ) ) ( not ( = ?auto_85509 ?auto_85512 ) ) ( not ( = ?auto_85509 ?auto_85513 ) ) ( not ( = ?auto_85510 ?auto_85511 ) ) ( not ( = ?auto_85510 ?auto_85512 ) ) ( not ( = ?auto_85510 ?auto_85513 ) ) ( not ( = ?auto_85511 ?auto_85512 ) ) ( not ( = ?auto_85511 ?auto_85513 ) ) ( not ( = ?auto_85512 ?auto_85513 ) ) ( ON ?auto_85511 ?auto_85512 ) ( ON ?auto_85510 ?auto_85511 ) ( ON ?auto_85509 ?auto_85510 ) ( CLEAR ?auto_85507 ) ( ON ?auto_85508 ?auto_85509 ) ( CLEAR ?auto_85508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85507 ?auto_85508 )
      ( MAKE-6PILE ?auto_85507 ?auto_85508 ?auto_85509 ?auto_85510 ?auto_85511 ?auto_85512 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_85533 - BLOCK
      ?auto_85534 - BLOCK
      ?auto_85535 - BLOCK
      ?auto_85536 - BLOCK
      ?auto_85537 - BLOCK
      ?auto_85538 - BLOCK
    )
    :vars
    (
      ?auto_85539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85538 ?auto_85539 ) ( not ( = ?auto_85533 ?auto_85534 ) ) ( not ( = ?auto_85533 ?auto_85535 ) ) ( not ( = ?auto_85533 ?auto_85536 ) ) ( not ( = ?auto_85533 ?auto_85537 ) ) ( not ( = ?auto_85533 ?auto_85538 ) ) ( not ( = ?auto_85533 ?auto_85539 ) ) ( not ( = ?auto_85534 ?auto_85535 ) ) ( not ( = ?auto_85534 ?auto_85536 ) ) ( not ( = ?auto_85534 ?auto_85537 ) ) ( not ( = ?auto_85534 ?auto_85538 ) ) ( not ( = ?auto_85534 ?auto_85539 ) ) ( not ( = ?auto_85535 ?auto_85536 ) ) ( not ( = ?auto_85535 ?auto_85537 ) ) ( not ( = ?auto_85535 ?auto_85538 ) ) ( not ( = ?auto_85535 ?auto_85539 ) ) ( not ( = ?auto_85536 ?auto_85537 ) ) ( not ( = ?auto_85536 ?auto_85538 ) ) ( not ( = ?auto_85536 ?auto_85539 ) ) ( not ( = ?auto_85537 ?auto_85538 ) ) ( not ( = ?auto_85537 ?auto_85539 ) ) ( not ( = ?auto_85538 ?auto_85539 ) ) ( ON ?auto_85537 ?auto_85538 ) ( ON ?auto_85536 ?auto_85537 ) ( ON ?auto_85535 ?auto_85536 ) ( ON ?auto_85534 ?auto_85535 ) ( ON ?auto_85533 ?auto_85534 ) ( CLEAR ?auto_85533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85533 )
      ( MAKE-6PILE ?auto_85533 ?auto_85534 ?auto_85535 ?auto_85536 ?auto_85537 ?auto_85538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85560 - BLOCK
      ?auto_85561 - BLOCK
      ?auto_85562 - BLOCK
      ?auto_85563 - BLOCK
      ?auto_85564 - BLOCK
      ?auto_85565 - BLOCK
      ?auto_85566 - BLOCK
    )
    :vars
    (
      ?auto_85567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85565 ) ( ON ?auto_85566 ?auto_85567 ) ( CLEAR ?auto_85566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85560 ) ( ON ?auto_85561 ?auto_85560 ) ( ON ?auto_85562 ?auto_85561 ) ( ON ?auto_85563 ?auto_85562 ) ( ON ?auto_85564 ?auto_85563 ) ( ON ?auto_85565 ?auto_85564 ) ( not ( = ?auto_85560 ?auto_85561 ) ) ( not ( = ?auto_85560 ?auto_85562 ) ) ( not ( = ?auto_85560 ?auto_85563 ) ) ( not ( = ?auto_85560 ?auto_85564 ) ) ( not ( = ?auto_85560 ?auto_85565 ) ) ( not ( = ?auto_85560 ?auto_85566 ) ) ( not ( = ?auto_85560 ?auto_85567 ) ) ( not ( = ?auto_85561 ?auto_85562 ) ) ( not ( = ?auto_85561 ?auto_85563 ) ) ( not ( = ?auto_85561 ?auto_85564 ) ) ( not ( = ?auto_85561 ?auto_85565 ) ) ( not ( = ?auto_85561 ?auto_85566 ) ) ( not ( = ?auto_85561 ?auto_85567 ) ) ( not ( = ?auto_85562 ?auto_85563 ) ) ( not ( = ?auto_85562 ?auto_85564 ) ) ( not ( = ?auto_85562 ?auto_85565 ) ) ( not ( = ?auto_85562 ?auto_85566 ) ) ( not ( = ?auto_85562 ?auto_85567 ) ) ( not ( = ?auto_85563 ?auto_85564 ) ) ( not ( = ?auto_85563 ?auto_85565 ) ) ( not ( = ?auto_85563 ?auto_85566 ) ) ( not ( = ?auto_85563 ?auto_85567 ) ) ( not ( = ?auto_85564 ?auto_85565 ) ) ( not ( = ?auto_85564 ?auto_85566 ) ) ( not ( = ?auto_85564 ?auto_85567 ) ) ( not ( = ?auto_85565 ?auto_85566 ) ) ( not ( = ?auto_85565 ?auto_85567 ) ) ( not ( = ?auto_85566 ?auto_85567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85566 ?auto_85567 )
      ( !STACK ?auto_85566 ?auto_85565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85590 - BLOCK
      ?auto_85591 - BLOCK
      ?auto_85592 - BLOCK
      ?auto_85593 - BLOCK
      ?auto_85594 - BLOCK
      ?auto_85595 - BLOCK
      ?auto_85596 - BLOCK
    )
    :vars
    (
      ?auto_85597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85596 ?auto_85597 ) ( ON-TABLE ?auto_85590 ) ( ON ?auto_85591 ?auto_85590 ) ( ON ?auto_85592 ?auto_85591 ) ( ON ?auto_85593 ?auto_85592 ) ( ON ?auto_85594 ?auto_85593 ) ( not ( = ?auto_85590 ?auto_85591 ) ) ( not ( = ?auto_85590 ?auto_85592 ) ) ( not ( = ?auto_85590 ?auto_85593 ) ) ( not ( = ?auto_85590 ?auto_85594 ) ) ( not ( = ?auto_85590 ?auto_85595 ) ) ( not ( = ?auto_85590 ?auto_85596 ) ) ( not ( = ?auto_85590 ?auto_85597 ) ) ( not ( = ?auto_85591 ?auto_85592 ) ) ( not ( = ?auto_85591 ?auto_85593 ) ) ( not ( = ?auto_85591 ?auto_85594 ) ) ( not ( = ?auto_85591 ?auto_85595 ) ) ( not ( = ?auto_85591 ?auto_85596 ) ) ( not ( = ?auto_85591 ?auto_85597 ) ) ( not ( = ?auto_85592 ?auto_85593 ) ) ( not ( = ?auto_85592 ?auto_85594 ) ) ( not ( = ?auto_85592 ?auto_85595 ) ) ( not ( = ?auto_85592 ?auto_85596 ) ) ( not ( = ?auto_85592 ?auto_85597 ) ) ( not ( = ?auto_85593 ?auto_85594 ) ) ( not ( = ?auto_85593 ?auto_85595 ) ) ( not ( = ?auto_85593 ?auto_85596 ) ) ( not ( = ?auto_85593 ?auto_85597 ) ) ( not ( = ?auto_85594 ?auto_85595 ) ) ( not ( = ?auto_85594 ?auto_85596 ) ) ( not ( = ?auto_85594 ?auto_85597 ) ) ( not ( = ?auto_85595 ?auto_85596 ) ) ( not ( = ?auto_85595 ?auto_85597 ) ) ( not ( = ?auto_85596 ?auto_85597 ) ) ( CLEAR ?auto_85594 ) ( ON ?auto_85595 ?auto_85596 ) ( CLEAR ?auto_85595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85590 ?auto_85591 ?auto_85592 ?auto_85593 ?auto_85594 ?auto_85595 )
      ( MAKE-7PILE ?auto_85590 ?auto_85591 ?auto_85592 ?auto_85593 ?auto_85594 ?auto_85595 ?auto_85596 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85620 - BLOCK
      ?auto_85621 - BLOCK
      ?auto_85622 - BLOCK
      ?auto_85623 - BLOCK
      ?auto_85624 - BLOCK
      ?auto_85625 - BLOCK
      ?auto_85626 - BLOCK
    )
    :vars
    (
      ?auto_85627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85626 ?auto_85627 ) ( ON-TABLE ?auto_85620 ) ( ON ?auto_85621 ?auto_85620 ) ( ON ?auto_85622 ?auto_85621 ) ( ON ?auto_85623 ?auto_85622 ) ( not ( = ?auto_85620 ?auto_85621 ) ) ( not ( = ?auto_85620 ?auto_85622 ) ) ( not ( = ?auto_85620 ?auto_85623 ) ) ( not ( = ?auto_85620 ?auto_85624 ) ) ( not ( = ?auto_85620 ?auto_85625 ) ) ( not ( = ?auto_85620 ?auto_85626 ) ) ( not ( = ?auto_85620 ?auto_85627 ) ) ( not ( = ?auto_85621 ?auto_85622 ) ) ( not ( = ?auto_85621 ?auto_85623 ) ) ( not ( = ?auto_85621 ?auto_85624 ) ) ( not ( = ?auto_85621 ?auto_85625 ) ) ( not ( = ?auto_85621 ?auto_85626 ) ) ( not ( = ?auto_85621 ?auto_85627 ) ) ( not ( = ?auto_85622 ?auto_85623 ) ) ( not ( = ?auto_85622 ?auto_85624 ) ) ( not ( = ?auto_85622 ?auto_85625 ) ) ( not ( = ?auto_85622 ?auto_85626 ) ) ( not ( = ?auto_85622 ?auto_85627 ) ) ( not ( = ?auto_85623 ?auto_85624 ) ) ( not ( = ?auto_85623 ?auto_85625 ) ) ( not ( = ?auto_85623 ?auto_85626 ) ) ( not ( = ?auto_85623 ?auto_85627 ) ) ( not ( = ?auto_85624 ?auto_85625 ) ) ( not ( = ?auto_85624 ?auto_85626 ) ) ( not ( = ?auto_85624 ?auto_85627 ) ) ( not ( = ?auto_85625 ?auto_85626 ) ) ( not ( = ?auto_85625 ?auto_85627 ) ) ( not ( = ?auto_85626 ?auto_85627 ) ) ( ON ?auto_85625 ?auto_85626 ) ( CLEAR ?auto_85623 ) ( ON ?auto_85624 ?auto_85625 ) ( CLEAR ?auto_85624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85620 ?auto_85621 ?auto_85622 ?auto_85623 ?auto_85624 )
      ( MAKE-7PILE ?auto_85620 ?auto_85621 ?auto_85622 ?auto_85623 ?auto_85624 ?auto_85625 ?auto_85626 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85650 - BLOCK
      ?auto_85651 - BLOCK
      ?auto_85652 - BLOCK
      ?auto_85653 - BLOCK
      ?auto_85654 - BLOCK
      ?auto_85655 - BLOCK
      ?auto_85656 - BLOCK
    )
    :vars
    (
      ?auto_85657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85656 ?auto_85657 ) ( ON-TABLE ?auto_85650 ) ( ON ?auto_85651 ?auto_85650 ) ( ON ?auto_85652 ?auto_85651 ) ( not ( = ?auto_85650 ?auto_85651 ) ) ( not ( = ?auto_85650 ?auto_85652 ) ) ( not ( = ?auto_85650 ?auto_85653 ) ) ( not ( = ?auto_85650 ?auto_85654 ) ) ( not ( = ?auto_85650 ?auto_85655 ) ) ( not ( = ?auto_85650 ?auto_85656 ) ) ( not ( = ?auto_85650 ?auto_85657 ) ) ( not ( = ?auto_85651 ?auto_85652 ) ) ( not ( = ?auto_85651 ?auto_85653 ) ) ( not ( = ?auto_85651 ?auto_85654 ) ) ( not ( = ?auto_85651 ?auto_85655 ) ) ( not ( = ?auto_85651 ?auto_85656 ) ) ( not ( = ?auto_85651 ?auto_85657 ) ) ( not ( = ?auto_85652 ?auto_85653 ) ) ( not ( = ?auto_85652 ?auto_85654 ) ) ( not ( = ?auto_85652 ?auto_85655 ) ) ( not ( = ?auto_85652 ?auto_85656 ) ) ( not ( = ?auto_85652 ?auto_85657 ) ) ( not ( = ?auto_85653 ?auto_85654 ) ) ( not ( = ?auto_85653 ?auto_85655 ) ) ( not ( = ?auto_85653 ?auto_85656 ) ) ( not ( = ?auto_85653 ?auto_85657 ) ) ( not ( = ?auto_85654 ?auto_85655 ) ) ( not ( = ?auto_85654 ?auto_85656 ) ) ( not ( = ?auto_85654 ?auto_85657 ) ) ( not ( = ?auto_85655 ?auto_85656 ) ) ( not ( = ?auto_85655 ?auto_85657 ) ) ( not ( = ?auto_85656 ?auto_85657 ) ) ( ON ?auto_85655 ?auto_85656 ) ( ON ?auto_85654 ?auto_85655 ) ( CLEAR ?auto_85652 ) ( ON ?auto_85653 ?auto_85654 ) ( CLEAR ?auto_85653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85650 ?auto_85651 ?auto_85652 ?auto_85653 )
      ( MAKE-7PILE ?auto_85650 ?auto_85651 ?auto_85652 ?auto_85653 ?auto_85654 ?auto_85655 ?auto_85656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85680 - BLOCK
      ?auto_85681 - BLOCK
      ?auto_85682 - BLOCK
      ?auto_85683 - BLOCK
      ?auto_85684 - BLOCK
      ?auto_85685 - BLOCK
      ?auto_85686 - BLOCK
    )
    :vars
    (
      ?auto_85687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85686 ?auto_85687 ) ( ON-TABLE ?auto_85680 ) ( ON ?auto_85681 ?auto_85680 ) ( not ( = ?auto_85680 ?auto_85681 ) ) ( not ( = ?auto_85680 ?auto_85682 ) ) ( not ( = ?auto_85680 ?auto_85683 ) ) ( not ( = ?auto_85680 ?auto_85684 ) ) ( not ( = ?auto_85680 ?auto_85685 ) ) ( not ( = ?auto_85680 ?auto_85686 ) ) ( not ( = ?auto_85680 ?auto_85687 ) ) ( not ( = ?auto_85681 ?auto_85682 ) ) ( not ( = ?auto_85681 ?auto_85683 ) ) ( not ( = ?auto_85681 ?auto_85684 ) ) ( not ( = ?auto_85681 ?auto_85685 ) ) ( not ( = ?auto_85681 ?auto_85686 ) ) ( not ( = ?auto_85681 ?auto_85687 ) ) ( not ( = ?auto_85682 ?auto_85683 ) ) ( not ( = ?auto_85682 ?auto_85684 ) ) ( not ( = ?auto_85682 ?auto_85685 ) ) ( not ( = ?auto_85682 ?auto_85686 ) ) ( not ( = ?auto_85682 ?auto_85687 ) ) ( not ( = ?auto_85683 ?auto_85684 ) ) ( not ( = ?auto_85683 ?auto_85685 ) ) ( not ( = ?auto_85683 ?auto_85686 ) ) ( not ( = ?auto_85683 ?auto_85687 ) ) ( not ( = ?auto_85684 ?auto_85685 ) ) ( not ( = ?auto_85684 ?auto_85686 ) ) ( not ( = ?auto_85684 ?auto_85687 ) ) ( not ( = ?auto_85685 ?auto_85686 ) ) ( not ( = ?auto_85685 ?auto_85687 ) ) ( not ( = ?auto_85686 ?auto_85687 ) ) ( ON ?auto_85685 ?auto_85686 ) ( ON ?auto_85684 ?auto_85685 ) ( ON ?auto_85683 ?auto_85684 ) ( CLEAR ?auto_85681 ) ( ON ?auto_85682 ?auto_85683 ) ( CLEAR ?auto_85682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85680 ?auto_85681 ?auto_85682 )
      ( MAKE-7PILE ?auto_85680 ?auto_85681 ?auto_85682 ?auto_85683 ?auto_85684 ?auto_85685 ?auto_85686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85710 - BLOCK
      ?auto_85711 - BLOCK
      ?auto_85712 - BLOCK
      ?auto_85713 - BLOCK
      ?auto_85714 - BLOCK
      ?auto_85715 - BLOCK
      ?auto_85716 - BLOCK
    )
    :vars
    (
      ?auto_85717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85716 ?auto_85717 ) ( ON-TABLE ?auto_85710 ) ( not ( = ?auto_85710 ?auto_85711 ) ) ( not ( = ?auto_85710 ?auto_85712 ) ) ( not ( = ?auto_85710 ?auto_85713 ) ) ( not ( = ?auto_85710 ?auto_85714 ) ) ( not ( = ?auto_85710 ?auto_85715 ) ) ( not ( = ?auto_85710 ?auto_85716 ) ) ( not ( = ?auto_85710 ?auto_85717 ) ) ( not ( = ?auto_85711 ?auto_85712 ) ) ( not ( = ?auto_85711 ?auto_85713 ) ) ( not ( = ?auto_85711 ?auto_85714 ) ) ( not ( = ?auto_85711 ?auto_85715 ) ) ( not ( = ?auto_85711 ?auto_85716 ) ) ( not ( = ?auto_85711 ?auto_85717 ) ) ( not ( = ?auto_85712 ?auto_85713 ) ) ( not ( = ?auto_85712 ?auto_85714 ) ) ( not ( = ?auto_85712 ?auto_85715 ) ) ( not ( = ?auto_85712 ?auto_85716 ) ) ( not ( = ?auto_85712 ?auto_85717 ) ) ( not ( = ?auto_85713 ?auto_85714 ) ) ( not ( = ?auto_85713 ?auto_85715 ) ) ( not ( = ?auto_85713 ?auto_85716 ) ) ( not ( = ?auto_85713 ?auto_85717 ) ) ( not ( = ?auto_85714 ?auto_85715 ) ) ( not ( = ?auto_85714 ?auto_85716 ) ) ( not ( = ?auto_85714 ?auto_85717 ) ) ( not ( = ?auto_85715 ?auto_85716 ) ) ( not ( = ?auto_85715 ?auto_85717 ) ) ( not ( = ?auto_85716 ?auto_85717 ) ) ( ON ?auto_85715 ?auto_85716 ) ( ON ?auto_85714 ?auto_85715 ) ( ON ?auto_85713 ?auto_85714 ) ( ON ?auto_85712 ?auto_85713 ) ( CLEAR ?auto_85710 ) ( ON ?auto_85711 ?auto_85712 ) ( CLEAR ?auto_85711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85710 ?auto_85711 )
      ( MAKE-7PILE ?auto_85710 ?auto_85711 ?auto_85712 ?auto_85713 ?auto_85714 ?auto_85715 ?auto_85716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_85740 - BLOCK
      ?auto_85741 - BLOCK
      ?auto_85742 - BLOCK
      ?auto_85743 - BLOCK
      ?auto_85744 - BLOCK
      ?auto_85745 - BLOCK
      ?auto_85746 - BLOCK
    )
    :vars
    (
      ?auto_85747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85746 ?auto_85747 ) ( not ( = ?auto_85740 ?auto_85741 ) ) ( not ( = ?auto_85740 ?auto_85742 ) ) ( not ( = ?auto_85740 ?auto_85743 ) ) ( not ( = ?auto_85740 ?auto_85744 ) ) ( not ( = ?auto_85740 ?auto_85745 ) ) ( not ( = ?auto_85740 ?auto_85746 ) ) ( not ( = ?auto_85740 ?auto_85747 ) ) ( not ( = ?auto_85741 ?auto_85742 ) ) ( not ( = ?auto_85741 ?auto_85743 ) ) ( not ( = ?auto_85741 ?auto_85744 ) ) ( not ( = ?auto_85741 ?auto_85745 ) ) ( not ( = ?auto_85741 ?auto_85746 ) ) ( not ( = ?auto_85741 ?auto_85747 ) ) ( not ( = ?auto_85742 ?auto_85743 ) ) ( not ( = ?auto_85742 ?auto_85744 ) ) ( not ( = ?auto_85742 ?auto_85745 ) ) ( not ( = ?auto_85742 ?auto_85746 ) ) ( not ( = ?auto_85742 ?auto_85747 ) ) ( not ( = ?auto_85743 ?auto_85744 ) ) ( not ( = ?auto_85743 ?auto_85745 ) ) ( not ( = ?auto_85743 ?auto_85746 ) ) ( not ( = ?auto_85743 ?auto_85747 ) ) ( not ( = ?auto_85744 ?auto_85745 ) ) ( not ( = ?auto_85744 ?auto_85746 ) ) ( not ( = ?auto_85744 ?auto_85747 ) ) ( not ( = ?auto_85745 ?auto_85746 ) ) ( not ( = ?auto_85745 ?auto_85747 ) ) ( not ( = ?auto_85746 ?auto_85747 ) ) ( ON ?auto_85745 ?auto_85746 ) ( ON ?auto_85744 ?auto_85745 ) ( ON ?auto_85743 ?auto_85744 ) ( ON ?auto_85742 ?auto_85743 ) ( ON ?auto_85741 ?auto_85742 ) ( ON ?auto_85740 ?auto_85741 ) ( CLEAR ?auto_85740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85740 )
      ( MAKE-7PILE ?auto_85740 ?auto_85741 ?auto_85742 ?auto_85743 ?auto_85744 ?auto_85745 ?auto_85746 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_85771 - BLOCK
      ?auto_85772 - BLOCK
      ?auto_85773 - BLOCK
      ?auto_85774 - BLOCK
      ?auto_85775 - BLOCK
      ?auto_85776 - BLOCK
      ?auto_85777 - BLOCK
      ?auto_85778 - BLOCK
    )
    :vars
    (
      ?auto_85779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_85777 ) ( ON ?auto_85778 ?auto_85779 ) ( CLEAR ?auto_85778 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85771 ) ( ON ?auto_85772 ?auto_85771 ) ( ON ?auto_85773 ?auto_85772 ) ( ON ?auto_85774 ?auto_85773 ) ( ON ?auto_85775 ?auto_85774 ) ( ON ?auto_85776 ?auto_85775 ) ( ON ?auto_85777 ?auto_85776 ) ( not ( = ?auto_85771 ?auto_85772 ) ) ( not ( = ?auto_85771 ?auto_85773 ) ) ( not ( = ?auto_85771 ?auto_85774 ) ) ( not ( = ?auto_85771 ?auto_85775 ) ) ( not ( = ?auto_85771 ?auto_85776 ) ) ( not ( = ?auto_85771 ?auto_85777 ) ) ( not ( = ?auto_85771 ?auto_85778 ) ) ( not ( = ?auto_85771 ?auto_85779 ) ) ( not ( = ?auto_85772 ?auto_85773 ) ) ( not ( = ?auto_85772 ?auto_85774 ) ) ( not ( = ?auto_85772 ?auto_85775 ) ) ( not ( = ?auto_85772 ?auto_85776 ) ) ( not ( = ?auto_85772 ?auto_85777 ) ) ( not ( = ?auto_85772 ?auto_85778 ) ) ( not ( = ?auto_85772 ?auto_85779 ) ) ( not ( = ?auto_85773 ?auto_85774 ) ) ( not ( = ?auto_85773 ?auto_85775 ) ) ( not ( = ?auto_85773 ?auto_85776 ) ) ( not ( = ?auto_85773 ?auto_85777 ) ) ( not ( = ?auto_85773 ?auto_85778 ) ) ( not ( = ?auto_85773 ?auto_85779 ) ) ( not ( = ?auto_85774 ?auto_85775 ) ) ( not ( = ?auto_85774 ?auto_85776 ) ) ( not ( = ?auto_85774 ?auto_85777 ) ) ( not ( = ?auto_85774 ?auto_85778 ) ) ( not ( = ?auto_85774 ?auto_85779 ) ) ( not ( = ?auto_85775 ?auto_85776 ) ) ( not ( = ?auto_85775 ?auto_85777 ) ) ( not ( = ?auto_85775 ?auto_85778 ) ) ( not ( = ?auto_85775 ?auto_85779 ) ) ( not ( = ?auto_85776 ?auto_85777 ) ) ( not ( = ?auto_85776 ?auto_85778 ) ) ( not ( = ?auto_85776 ?auto_85779 ) ) ( not ( = ?auto_85777 ?auto_85778 ) ) ( not ( = ?auto_85777 ?auto_85779 ) ) ( not ( = ?auto_85778 ?auto_85779 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85778 ?auto_85779 )
      ( !STACK ?auto_85778 ?auto_85777 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_85805 - BLOCK
      ?auto_85806 - BLOCK
      ?auto_85807 - BLOCK
      ?auto_85808 - BLOCK
      ?auto_85809 - BLOCK
      ?auto_85810 - BLOCK
      ?auto_85811 - BLOCK
      ?auto_85812 - BLOCK
    )
    :vars
    (
      ?auto_85813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85812 ?auto_85813 ) ( ON-TABLE ?auto_85805 ) ( ON ?auto_85806 ?auto_85805 ) ( ON ?auto_85807 ?auto_85806 ) ( ON ?auto_85808 ?auto_85807 ) ( ON ?auto_85809 ?auto_85808 ) ( ON ?auto_85810 ?auto_85809 ) ( not ( = ?auto_85805 ?auto_85806 ) ) ( not ( = ?auto_85805 ?auto_85807 ) ) ( not ( = ?auto_85805 ?auto_85808 ) ) ( not ( = ?auto_85805 ?auto_85809 ) ) ( not ( = ?auto_85805 ?auto_85810 ) ) ( not ( = ?auto_85805 ?auto_85811 ) ) ( not ( = ?auto_85805 ?auto_85812 ) ) ( not ( = ?auto_85805 ?auto_85813 ) ) ( not ( = ?auto_85806 ?auto_85807 ) ) ( not ( = ?auto_85806 ?auto_85808 ) ) ( not ( = ?auto_85806 ?auto_85809 ) ) ( not ( = ?auto_85806 ?auto_85810 ) ) ( not ( = ?auto_85806 ?auto_85811 ) ) ( not ( = ?auto_85806 ?auto_85812 ) ) ( not ( = ?auto_85806 ?auto_85813 ) ) ( not ( = ?auto_85807 ?auto_85808 ) ) ( not ( = ?auto_85807 ?auto_85809 ) ) ( not ( = ?auto_85807 ?auto_85810 ) ) ( not ( = ?auto_85807 ?auto_85811 ) ) ( not ( = ?auto_85807 ?auto_85812 ) ) ( not ( = ?auto_85807 ?auto_85813 ) ) ( not ( = ?auto_85808 ?auto_85809 ) ) ( not ( = ?auto_85808 ?auto_85810 ) ) ( not ( = ?auto_85808 ?auto_85811 ) ) ( not ( = ?auto_85808 ?auto_85812 ) ) ( not ( = ?auto_85808 ?auto_85813 ) ) ( not ( = ?auto_85809 ?auto_85810 ) ) ( not ( = ?auto_85809 ?auto_85811 ) ) ( not ( = ?auto_85809 ?auto_85812 ) ) ( not ( = ?auto_85809 ?auto_85813 ) ) ( not ( = ?auto_85810 ?auto_85811 ) ) ( not ( = ?auto_85810 ?auto_85812 ) ) ( not ( = ?auto_85810 ?auto_85813 ) ) ( not ( = ?auto_85811 ?auto_85812 ) ) ( not ( = ?auto_85811 ?auto_85813 ) ) ( not ( = ?auto_85812 ?auto_85813 ) ) ( CLEAR ?auto_85810 ) ( ON ?auto_85811 ?auto_85812 ) ( CLEAR ?auto_85811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85805 ?auto_85806 ?auto_85807 ?auto_85808 ?auto_85809 ?auto_85810 ?auto_85811 )
      ( MAKE-8PILE ?auto_85805 ?auto_85806 ?auto_85807 ?auto_85808 ?auto_85809 ?auto_85810 ?auto_85811 ?auto_85812 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_85839 - BLOCK
      ?auto_85840 - BLOCK
      ?auto_85841 - BLOCK
      ?auto_85842 - BLOCK
      ?auto_85843 - BLOCK
      ?auto_85844 - BLOCK
      ?auto_85845 - BLOCK
      ?auto_85846 - BLOCK
    )
    :vars
    (
      ?auto_85847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85846 ?auto_85847 ) ( ON-TABLE ?auto_85839 ) ( ON ?auto_85840 ?auto_85839 ) ( ON ?auto_85841 ?auto_85840 ) ( ON ?auto_85842 ?auto_85841 ) ( ON ?auto_85843 ?auto_85842 ) ( not ( = ?auto_85839 ?auto_85840 ) ) ( not ( = ?auto_85839 ?auto_85841 ) ) ( not ( = ?auto_85839 ?auto_85842 ) ) ( not ( = ?auto_85839 ?auto_85843 ) ) ( not ( = ?auto_85839 ?auto_85844 ) ) ( not ( = ?auto_85839 ?auto_85845 ) ) ( not ( = ?auto_85839 ?auto_85846 ) ) ( not ( = ?auto_85839 ?auto_85847 ) ) ( not ( = ?auto_85840 ?auto_85841 ) ) ( not ( = ?auto_85840 ?auto_85842 ) ) ( not ( = ?auto_85840 ?auto_85843 ) ) ( not ( = ?auto_85840 ?auto_85844 ) ) ( not ( = ?auto_85840 ?auto_85845 ) ) ( not ( = ?auto_85840 ?auto_85846 ) ) ( not ( = ?auto_85840 ?auto_85847 ) ) ( not ( = ?auto_85841 ?auto_85842 ) ) ( not ( = ?auto_85841 ?auto_85843 ) ) ( not ( = ?auto_85841 ?auto_85844 ) ) ( not ( = ?auto_85841 ?auto_85845 ) ) ( not ( = ?auto_85841 ?auto_85846 ) ) ( not ( = ?auto_85841 ?auto_85847 ) ) ( not ( = ?auto_85842 ?auto_85843 ) ) ( not ( = ?auto_85842 ?auto_85844 ) ) ( not ( = ?auto_85842 ?auto_85845 ) ) ( not ( = ?auto_85842 ?auto_85846 ) ) ( not ( = ?auto_85842 ?auto_85847 ) ) ( not ( = ?auto_85843 ?auto_85844 ) ) ( not ( = ?auto_85843 ?auto_85845 ) ) ( not ( = ?auto_85843 ?auto_85846 ) ) ( not ( = ?auto_85843 ?auto_85847 ) ) ( not ( = ?auto_85844 ?auto_85845 ) ) ( not ( = ?auto_85844 ?auto_85846 ) ) ( not ( = ?auto_85844 ?auto_85847 ) ) ( not ( = ?auto_85845 ?auto_85846 ) ) ( not ( = ?auto_85845 ?auto_85847 ) ) ( not ( = ?auto_85846 ?auto_85847 ) ) ( ON ?auto_85845 ?auto_85846 ) ( CLEAR ?auto_85843 ) ( ON ?auto_85844 ?auto_85845 ) ( CLEAR ?auto_85844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85839 ?auto_85840 ?auto_85841 ?auto_85842 ?auto_85843 ?auto_85844 )
      ( MAKE-8PILE ?auto_85839 ?auto_85840 ?auto_85841 ?auto_85842 ?auto_85843 ?auto_85844 ?auto_85845 ?auto_85846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_85873 - BLOCK
      ?auto_85874 - BLOCK
      ?auto_85875 - BLOCK
      ?auto_85876 - BLOCK
      ?auto_85877 - BLOCK
      ?auto_85878 - BLOCK
      ?auto_85879 - BLOCK
      ?auto_85880 - BLOCK
    )
    :vars
    (
      ?auto_85881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85880 ?auto_85881 ) ( ON-TABLE ?auto_85873 ) ( ON ?auto_85874 ?auto_85873 ) ( ON ?auto_85875 ?auto_85874 ) ( ON ?auto_85876 ?auto_85875 ) ( not ( = ?auto_85873 ?auto_85874 ) ) ( not ( = ?auto_85873 ?auto_85875 ) ) ( not ( = ?auto_85873 ?auto_85876 ) ) ( not ( = ?auto_85873 ?auto_85877 ) ) ( not ( = ?auto_85873 ?auto_85878 ) ) ( not ( = ?auto_85873 ?auto_85879 ) ) ( not ( = ?auto_85873 ?auto_85880 ) ) ( not ( = ?auto_85873 ?auto_85881 ) ) ( not ( = ?auto_85874 ?auto_85875 ) ) ( not ( = ?auto_85874 ?auto_85876 ) ) ( not ( = ?auto_85874 ?auto_85877 ) ) ( not ( = ?auto_85874 ?auto_85878 ) ) ( not ( = ?auto_85874 ?auto_85879 ) ) ( not ( = ?auto_85874 ?auto_85880 ) ) ( not ( = ?auto_85874 ?auto_85881 ) ) ( not ( = ?auto_85875 ?auto_85876 ) ) ( not ( = ?auto_85875 ?auto_85877 ) ) ( not ( = ?auto_85875 ?auto_85878 ) ) ( not ( = ?auto_85875 ?auto_85879 ) ) ( not ( = ?auto_85875 ?auto_85880 ) ) ( not ( = ?auto_85875 ?auto_85881 ) ) ( not ( = ?auto_85876 ?auto_85877 ) ) ( not ( = ?auto_85876 ?auto_85878 ) ) ( not ( = ?auto_85876 ?auto_85879 ) ) ( not ( = ?auto_85876 ?auto_85880 ) ) ( not ( = ?auto_85876 ?auto_85881 ) ) ( not ( = ?auto_85877 ?auto_85878 ) ) ( not ( = ?auto_85877 ?auto_85879 ) ) ( not ( = ?auto_85877 ?auto_85880 ) ) ( not ( = ?auto_85877 ?auto_85881 ) ) ( not ( = ?auto_85878 ?auto_85879 ) ) ( not ( = ?auto_85878 ?auto_85880 ) ) ( not ( = ?auto_85878 ?auto_85881 ) ) ( not ( = ?auto_85879 ?auto_85880 ) ) ( not ( = ?auto_85879 ?auto_85881 ) ) ( not ( = ?auto_85880 ?auto_85881 ) ) ( ON ?auto_85879 ?auto_85880 ) ( ON ?auto_85878 ?auto_85879 ) ( CLEAR ?auto_85876 ) ( ON ?auto_85877 ?auto_85878 ) ( CLEAR ?auto_85877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85873 ?auto_85874 ?auto_85875 ?auto_85876 ?auto_85877 )
      ( MAKE-8PILE ?auto_85873 ?auto_85874 ?auto_85875 ?auto_85876 ?auto_85877 ?auto_85878 ?auto_85879 ?auto_85880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_85907 - BLOCK
      ?auto_85908 - BLOCK
      ?auto_85909 - BLOCK
      ?auto_85910 - BLOCK
      ?auto_85911 - BLOCK
      ?auto_85912 - BLOCK
      ?auto_85913 - BLOCK
      ?auto_85914 - BLOCK
    )
    :vars
    (
      ?auto_85915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85914 ?auto_85915 ) ( ON-TABLE ?auto_85907 ) ( ON ?auto_85908 ?auto_85907 ) ( ON ?auto_85909 ?auto_85908 ) ( not ( = ?auto_85907 ?auto_85908 ) ) ( not ( = ?auto_85907 ?auto_85909 ) ) ( not ( = ?auto_85907 ?auto_85910 ) ) ( not ( = ?auto_85907 ?auto_85911 ) ) ( not ( = ?auto_85907 ?auto_85912 ) ) ( not ( = ?auto_85907 ?auto_85913 ) ) ( not ( = ?auto_85907 ?auto_85914 ) ) ( not ( = ?auto_85907 ?auto_85915 ) ) ( not ( = ?auto_85908 ?auto_85909 ) ) ( not ( = ?auto_85908 ?auto_85910 ) ) ( not ( = ?auto_85908 ?auto_85911 ) ) ( not ( = ?auto_85908 ?auto_85912 ) ) ( not ( = ?auto_85908 ?auto_85913 ) ) ( not ( = ?auto_85908 ?auto_85914 ) ) ( not ( = ?auto_85908 ?auto_85915 ) ) ( not ( = ?auto_85909 ?auto_85910 ) ) ( not ( = ?auto_85909 ?auto_85911 ) ) ( not ( = ?auto_85909 ?auto_85912 ) ) ( not ( = ?auto_85909 ?auto_85913 ) ) ( not ( = ?auto_85909 ?auto_85914 ) ) ( not ( = ?auto_85909 ?auto_85915 ) ) ( not ( = ?auto_85910 ?auto_85911 ) ) ( not ( = ?auto_85910 ?auto_85912 ) ) ( not ( = ?auto_85910 ?auto_85913 ) ) ( not ( = ?auto_85910 ?auto_85914 ) ) ( not ( = ?auto_85910 ?auto_85915 ) ) ( not ( = ?auto_85911 ?auto_85912 ) ) ( not ( = ?auto_85911 ?auto_85913 ) ) ( not ( = ?auto_85911 ?auto_85914 ) ) ( not ( = ?auto_85911 ?auto_85915 ) ) ( not ( = ?auto_85912 ?auto_85913 ) ) ( not ( = ?auto_85912 ?auto_85914 ) ) ( not ( = ?auto_85912 ?auto_85915 ) ) ( not ( = ?auto_85913 ?auto_85914 ) ) ( not ( = ?auto_85913 ?auto_85915 ) ) ( not ( = ?auto_85914 ?auto_85915 ) ) ( ON ?auto_85913 ?auto_85914 ) ( ON ?auto_85912 ?auto_85913 ) ( ON ?auto_85911 ?auto_85912 ) ( CLEAR ?auto_85909 ) ( ON ?auto_85910 ?auto_85911 ) ( CLEAR ?auto_85910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85907 ?auto_85908 ?auto_85909 ?auto_85910 )
      ( MAKE-8PILE ?auto_85907 ?auto_85908 ?auto_85909 ?auto_85910 ?auto_85911 ?auto_85912 ?auto_85913 ?auto_85914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_85941 - BLOCK
      ?auto_85942 - BLOCK
      ?auto_85943 - BLOCK
      ?auto_85944 - BLOCK
      ?auto_85945 - BLOCK
      ?auto_85946 - BLOCK
      ?auto_85947 - BLOCK
      ?auto_85948 - BLOCK
    )
    :vars
    (
      ?auto_85949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85948 ?auto_85949 ) ( ON-TABLE ?auto_85941 ) ( ON ?auto_85942 ?auto_85941 ) ( not ( = ?auto_85941 ?auto_85942 ) ) ( not ( = ?auto_85941 ?auto_85943 ) ) ( not ( = ?auto_85941 ?auto_85944 ) ) ( not ( = ?auto_85941 ?auto_85945 ) ) ( not ( = ?auto_85941 ?auto_85946 ) ) ( not ( = ?auto_85941 ?auto_85947 ) ) ( not ( = ?auto_85941 ?auto_85948 ) ) ( not ( = ?auto_85941 ?auto_85949 ) ) ( not ( = ?auto_85942 ?auto_85943 ) ) ( not ( = ?auto_85942 ?auto_85944 ) ) ( not ( = ?auto_85942 ?auto_85945 ) ) ( not ( = ?auto_85942 ?auto_85946 ) ) ( not ( = ?auto_85942 ?auto_85947 ) ) ( not ( = ?auto_85942 ?auto_85948 ) ) ( not ( = ?auto_85942 ?auto_85949 ) ) ( not ( = ?auto_85943 ?auto_85944 ) ) ( not ( = ?auto_85943 ?auto_85945 ) ) ( not ( = ?auto_85943 ?auto_85946 ) ) ( not ( = ?auto_85943 ?auto_85947 ) ) ( not ( = ?auto_85943 ?auto_85948 ) ) ( not ( = ?auto_85943 ?auto_85949 ) ) ( not ( = ?auto_85944 ?auto_85945 ) ) ( not ( = ?auto_85944 ?auto_85946 ) ) ( not ( = ?auto_85944 ?auto_85947 ) ) ( not ( = ?auto_85944 ?auto_85948 ) ) ( not ( = ?auto_85944 ?auto_85949 ) ) ( not ( = ?auto_85945 ?auto_85946 ) ) ( not ( = ?auto_85945 ?auto_85947 ) ) ( not ( = ?auto_85945 ?auto_85948 ) ) ( not ( = ?auto_85945 ?auto_85949 ) ) ( not ( = ?auto_85946 ?auto_85947 ) ) ( not ( = ?auto_85946 ?auto_85948 ) ) ( not ( = ?auto_85946 ?auto_85949 ) ) ( not ( = ?auto_85947 ?auto_85948 ) ) ( not ( = ?auto_85947 ?auto_85949 ) ) ( not ( = ?auto_85948 ?auto_85949 ) ) ( ON ?auto_85947 ?auto_85948 ) ( ON ?auto_85946 ?auto_85947 ) ( ON ?auto_85945 ?auto_85946 ) ( ON ?auto_85944 ?auto_85945 ) ( CLEAR ?auto_85942 ) ( ON ?auto_85943 ?auto_85944 ) ( CLEAR ?auto_85943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85941 ?auto_85942 ?auto_85943 )
      ( MAKE-8PILE ?auto_85941 ?auto_85942 ?auto_85943 ?auto_85944 ?auto_85945 ?auto_85946 ?auto_85947 ?auto_85948 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_85975 - BLOCK
      ?auto_85976 - BLOCK
      ?auto_85977 - BLOCK
      ?auto_85978 - BLOCK
      ?auto_85979 - BLOCK
      ?auto_85980 - BLOCK
      ?auto_85981 - BLOCK
      ?auto_85982 - BLOCK
    )
    :vars
    (
      ?auto_85983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85982 ?auto_85983 ) ( ON-TABLE ?auto_85975 ) ( not ( = ?auto_85975 ?auto_85976 ) ) ( not ( = ?auto_85975 ?auto_85977 ) ) ( not ( = ?auto_85975 ?auto_85978 ) ) ( not ( = ?auto_85975 ?auto_85979 ) ) ( not ( = ?auto_85975 ?auto_85980 ) ) ( not ( = ?auto_85975 ?auto_85981 ) ) ( not ( = ?auto_85975 ?auto_85982 ) ) ( not ( = ?auto_85975 ?auto_85983 ) ) ( not ( = ?auto_85976 ?auto_85977 ) ) ( not ( = ?auto_85976 ?auto_85978 ) ) ( not ( = ?auto_85976 ?auto_85979 ) ) ( not ( = ?auto_85976 ?auto_85980 ) ) ( not ( = ?auto_85976 ?auto_85981 ) ) ( not ( = ?auto_85976 ?auto_85982 ) ) ( not ( = ?auto_85976 ?auto_85983 ) ) ( not ( = ?auto_85977 ?auto_85978 ) ) ( not ( = ?auto_85977 ?auto_85979 ) ) ( not ( = ?auto_85977 ?auto_85980 ) ) ( not ( = ?auto_85977 ?auto_85981 ) ) ( not ( = ?auto_85977 ?auto_85982 ) ) ( not ( = ?auto_85977 ?auto_85983 ) ) ( not ( = ?auto_85978 ?auto_85979 ) ) ( not ( = ?auto_85978 ?auto_85980 ) ) ( not ( = ?auto_85978 ?auto_85981 ) ) ( not ( = ?auto_85978 ?auto_85982 ) ) ( not ( = ?auto_85978 ?auto_85983 ) ) ( not ( = ?auto_85979 ?auto_85980 ) ) ( not ( = ?auto_85979 ?auto_85981 ) ) ( not ( = ?auto_85979 ?auto_85982 ) ) ( not ( = ?auto_85979 ?auto_85983 ) ) ( not ( = ?auto_85980 ?auto_85981 ) ) ( not ( = ?auto_85980 ?auto_85982 ) ) ( not ( = ?auto_85980 ?auto_85983 ) ) ( not ( = ?auto_85981 ?auto_85982 ) ) ( not ( = ?auto_85981 ?auto_85983 ) ) ( not ( = ?auto_85982 ?auto_85983 ) ) ( ON ?auto_85981 ?auto_85982 ) ( ON ?auto_85980 ?auto_85981 ) ( ON ?auto_85979 ?auto_85980 ) ( ON ?auto_85978 ?auto_85979 ) ( ON ?auto_85977 ?auto_85978 ) ( CLEAR ?auto_85975 ) ( ON ?auto_85976 ?auto_85977 ) ( CLEAR ?auto_85976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85975 ?auto_85976 )
      ( MAKE-8PILE ?auto_85975 ?auto_85976 ?auto_85977 ?auto_85978 ?auto_85979 ?auto_85980 ?auto_85981 ?auto_85982 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_86009 - BLOCK
      ?auto_86010 - BLOCK
      ?auto_86011 - BLOCK
      ?auto_86012 - BLOCK
      ?auto_86013 - BLOCK
      ?auto_86014 - BLOCK
      ?auto_86015 - BLOCK
      ?auto_86016 - BLOCK
    )
    :vars
    (
      ?auto_86017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86016 ?auto_86017 ) ( not ( = ?auto_86009 ?auto_86010 ) ) ( not ( = ?auto_86009 ?auto_86011 ) ) ( not ( = ?auto_86009 ?auto_86012 ) ) ( not ( = ?auto_86009 ?auto_86013 ) ) ( not ( = ?auto_86009 ?auto_86014 ) ) ( not ( = ?auto_86009 ?auto_86015 ) ) ( not ( = ?auto_86009 ?auto_86016 ) ) ( not ( = ?auto_86009 ?auto_86017 ) ) ( not ( = ?auto_86010 ?auto_86011 ) ) ( not ( = ?auto_86010 ?auto_86012 ) ) ( not ( = ?auto_86010 ?auto_86013 ) ) ( not ( = ?auto_86010 ?auto_86014 ) ) ( not ( = ?auto_86010 ?auto_86015 ) ) ( not ( = ?auto_86010 ?auto_86016 ) ) ( not ( = ?auto_86010 ?auto_86017 ) ) ( not ( = ?auto_86011 ?auto_86012 ) ) ( not ( = ?auto_86011 ?auto_86013 ) ) ( not ( = ?auto_86011 ?auto_86014 ) ) ( not ( = ?auto_86011 ?auto_86015 ) ) ( not ( = ?auto_86011 ?auto_86016 ) ) ( not ( = ?auto_86011 ?auto_86017 ) ) ( not ( = ?auto_86012 ?auto_86013 ) ) ( not ( = ?auto_86012 ?auto_86014 ) ) ( not ( = ?auto_86012 ?auto_86015 ) ) ( not ( = ?auto_86012 ?auto_86016 ) ) ( not ( = ?auto_86012 ?auto_86017 ) ) ( not ( = ?auto_86013 ?auto_86014 ) ) ( not ( = ?auto_86013 ?auto_86015 ) ) ( not ( = ?auto_86013 ?auto_86016 ) ) ( not ( = ?auto_86013 ?auto_86017 ) ) ( not ( = ?auto_86014 ?auto_86015 ) ) ( not ( = ?auto_86014 ?auto_86016 ) ) ( not ( = ?auto_86014 ?auto_86017 ) ) ( not ( = ?auto_86015 ?auto_86016 ) ) ( not ( = ?auto_86015 ?auto_86017 ) ) ( not ( = ?auto_86016 ?auto_86017 ) ) ( ON ?auto_86015 ?auto_86016 ) ( ON ?auto_86014 ?auto_86015 ) ( ON ?auto_86013 ?auto_86014 ) ( ON ?auto_86012 ?auto_86013 ) ( ON ?auto_86011 ?auto_86012 ) ( ON ?auto_86010 ?auto_86011 ) ( ON ?auto_86009 ?auto_86010 ) ( CLEAR ?auto_86009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86009 )
      ( MAKE-8PILE ?auto_86009 ?auto_86010 ?auto_86011 ?auto_86012 ?auto_86013 ?auto_86014 ?auto_86015 ?auto_86016 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86044 - BLOCK
      ?auto_86045 - BLOCK
      ?auto_86046 - BLOCK
      ?auto_86047 - BLOCK
      ?auto_86048 - BLOCK
      ?auto_86049 - BLOCK
      ?auto_86050 - BLOCK
      ?auto_86051 - BLOCK
      ?auto_86052 - BLOCK
    )
    :vars
    (
      ?auto_86053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86051 ) ( ON ?auto_86052 ?auto_86053 ) ( CLEAR ?auto_86052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86044 ) ( ON ?auto_86045 ?auto_86044 ) ( ON ?auto_86046 ?auto_86045 ) ( ON ?auto_86047 ?auto_86046 ) ( ON ?auto_86048 ?auto_86047 ) ( ON ?auto_86049 ?auto_86048 ) ( ON ?auto_86050 ?auto_86049 ) ( ON ?auto_86051 ?auto_86050 ) ( not ( = ?auto_86044 ?auto_86045 ) ) ( not ( = ?auto_86044 ?auto_86046 ) ) ( not ( = ?auto_86044 ?auto_86047 ) ) ( not ( = ?auto_86044 ?auto_86048 ) ) ( not ( = ?auto_86044 ?auto_86049 ) ) ( not ( = ?auto_86044 ?auto_86050 ) ) ( not ( = ?auto_86044 ?auto_86051 ) ) ( not ( = ?auto_86044 ?auto_86052 ) ) ( not ( = ?auto_86044 ?auto_86053 ) ) ( not ( = ?auto_86045 ?auto_86046 ) ) ( not ( = ?auto_86045 ?auto_86047 ) ) ( not ( = ?auto_86045 ?auto_86048 ) ) ( not ( = ?auto_86045 ?auto_86049 ) ) ( not ( = ?auto_86045 ?auto_86050 ) ) ( not ( = ?auto_86045 ?auto_86051 ) ) ( not ( = ?auto_86045 ?auto_86052 ) ) ( not ( = ?auto_86045 ?auto_86053 ) ) ( not ( = ?auto_86046 ?auto_86047 ) ) ( not ( = ?auto_86046 ?auto_86048 ) ) ( not ( = ?auto_86046 ?auto_86049 ) ) ( not ( = ?auto_86046 ?auto_86050 ) ) ( not ( = ?auto_86046 ?auto_86051 ) ) ( not ( = ?auto_86046 ?auto_86052 ) ) ( not ( = ?auto_86046 ?auto_86053 ) ) ( not ( = ?auto_86047 ?auto_86048 ) ) ( not ( = ?auto_86047 ?auto_86049 ) ) ( not ( = ?auto_86047 ?auto_86050 ) ) ( not ( = ?auto_86047 ?auto_86051 ) ) ( not ( = ?auto_86047 ?auto_86052 ) ) ( not ( = ?auto_86047 ?auto_86053 ) ) ( not ( = ?auto_86048 ?auto_86049 ) ) ( not ( = ?auto_86048 ?auto_86050 ) ) ( not ( = ?auto_86048 ?auto_86051 ) ) ( not ( = ?auto_86048 ?auto_86052 ) ) ( not ( = ?auto_86048 ?auto_86053 ) ) ( not ( = ?auto_86049 ?auto_86050 ) ) ( not ( = ?auto_86049 ?auto_86051 ) ) ( not ( = ?auto_86049 ?auto_86052 ) ) ( not ( = ?auto_86049 ?auto_86053 ) ) ( not ( = ?auto_86050 ?auto_86051 ) ) ( not ( = ?auto_86050 ?auto_86052 ) ) ( not ( = ?auto_86050 ?auto_86053 ) ) ( not ( = ?auto_86051 ?auto_86052 ) ) ( not ( = ?auto_86051 ?auto_86053 ) ) ( not ( = ?auto_86052 ?auto_86053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86052 ?auto_86053 )
      ( !STACK ?auto_86052 ?auto_86051 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86082 - BLOCK
      ?auto_86083 - BLOCK
      ?auto_86084 - BLOCK
      ?auto_86085 - BLOCK
      ?auto_86086 - BLOCK
      ?auto_86087 - BLOCK
      ?auto_86088 - BLOCK
      ?auto_86089 - BLOCK
      ?auto_86090 - BLOCK
    )
    :vars
    (
      ?auto_86091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86090 ?auto_86091 ) ( ON-TABLE ?auto_86082 ) ( ON ?auto_86083 ?auto_86082 ) ( ON ?auto_86084 ?auto_86083 ) ( ON ?auto_86085 ?auto_86084 ) ( ON ?auto_86086 ?auto_86085 ) ( ON ?auto_86087 ?auto_86086 ) ( ON ?auto_86088 ?auto_86087 ) ( not ( = ?auto_86082 ?auto_86083 ) ) ( not ( = ?auto_86082 ?auto_86084 ) ) ( not ( = ?auto_86082 ?auto_86085 ) ) ( not ( = ?auto_86082 ?auto_86086 ) ) ( not ( = ?auto_86082 ?auto_86087 ) ) ( not ( = ?auto_86082 ?auto_86088 ) ) ( not ( = ?auto_86082 ?auto_86089 ) ) ( not ( = ?auto_86082 ?auto_86090 ) ) ( not ( = ?auto_86082 ?auto_86091 ) ) ( not ( = ?auto_86083 ?auto_86084 ) ) ( not ( = ?auto_86083 ?auto_86085 ) ) ( not ( = ?auto_86083 ?auto_86086 ) ) ( not ( = ?auto_86083 ?auto_86087 ) ) ( not ( = ?auto_86083 ?auto_86088 ) ) ( not ( = ?auto_86083 ?auto_86089 ) ) ( not ( = ?auto_86083 ?auto_86090 ) ) ( not ( = ?auto_86083 ?auto_86091 ) ) ( not ( = ?auto_86084 ?auto_86085 ) ) ( not ( = ?auto_86084 ?auto_86086 ) ) ( not ( = ?auto_86084 ?auto_86087 ) ) ( not ( = ?auto_86084 ?auto_86088 ) ) ( not ( = ?auto_86084 ?auto_86089 ) ) ( not ( = ?auto_86084 ?auto_86090 ) ) ( not ( = ?auto_86084 ?auto_86091 ) ) ( not ( = ?auto_86085 ?auto_86086 ) ) ( not ( = ?auto_86085 ?auto_86087 ) ) ( not ( = ?auto_86085 ?auto_86088 ) ) ( not ( = ?auto_86085 ?auto_86089 ) ) ( not ( = ?auto_86085 ?auto_86090 ) ) ( not ( = ?auto_86085 ?auto_86091 ) ) ( not ( = ?auto_86086 ?auto_86087 ) ) ( not ( = ?auto_86086 ?auto_86088 ) ) ( not ( = ?auto_86086 ?auto_86089 ) ) ( not ( = ?auto_86086 ?auto_86090 ) ) ( not ( = ?auto_86086 ?auto_86091 ) ) ( not ( = ?auto_86087 ?auto_86088 ) ) ( not ( = ?auto_86087 ?auto_86089 ) ) ( not ( = ?auto_86087 ?auto_86090 ) ) ( not ( = ?auto_86087 ?auto_86091 ) ) ( not ( = ?auto_86088 ?auto_86089 ) ) ( not ( = ?auto_86088 ?auto_86090 ) ) ( not ( = ?auto_86088 ?auto_86091 ) ) ( not ( = ?auto_86089 ?auto_86090 ) ) ( not ( = ?auto_86089 ?auto_86091 ) ) ( not ( = ?auto_86090 ?auto_86091 ) ) ( CLEAR ?auto_86088 ) ( ON ?auto_86089 ?auto_86090 ) ( CLEAR ?auto_86089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_86082 ?auto_86083 ?auto_86084 ?auto_86085 ?auto_86086 ?auto_86087 ?auto_86088 ?auto_86089 )
      ( MAKE-9PILE ?auto_86082 ?auto_86083 ?auto_86084 ?auto_86085 ?auto_86086 ?auto_86087 ?auto_86088 ?auto_86089 ?auto_86090 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86120 - BLOCK
      ?auto_86121 - BLOCK
      ?auto_86122 - BLOCK
      ?auto_86123 - BLOCK
      ?auto_86124 - BLOCK
      ?auto_86125 - BLOCK
      ?auto_86126 - BLOCK
      ?auto_86127 - BLOCK
      ?auto_86128 - BLOCK
    )
    :vars
    (
      ?auto_86129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86128 ?auto_86129 ) ( ON-TABLE ?auto_86120 ) ( ON ?auto_86121 ?auto_86120 ) ( ON ?auto_86122 ?auto_86121 ) ( ON ?auto_86123 ?auto_86122 ) ( ON ?auto_86124 ?auto_86123 ) ( ON ?auto_86125 ?auto_86124 ) ( not ( = ?auto_86120 ?auto_86121 ) ) ( not ( = ?auto_86120 ?auto_86122 ) ) ( not ( = ?auto_86120 ?auto_86123 ) ) ( not ( = ?auto_86120 ?auto_86124 ) ) ( not ( = ?auto_86120 ?auto_86125 ) ) ( not ( = ?auto_86120 ?auto_86126 ) ) ( not ( = ?auto_86120 ?auto_86127 ) ) ( not ( = ?auto_86120 ?auto_86128 ) ) ( not ( = ?auto_86120 ?auto_86129 ) ) ( not ( = ?auto_86121 ?auto_86122 ) ) ( not ( = ?auto_86121 ?auto_86123 ) ) ( not ( = ?auto_86121 ?auto_86124 ) ) ( not ( = ?auto_86121 ?auto_86125 ) ) ( not ( = ?auto_86121 ?auto_86126 ) ) ( not ( = ?auto_86121 ?auto_86127 ) ) ( not ( = ?auto_86121 ?auto_86128 ) ) ( not ( = ?auto_86121 ?auto_86129 ) ) ( not ( = ?auto_86122 ?auto_86123 ) ) ( not ( = ?auto_86122 ?auto_86124 ) ) ( not ( = ?auto_86122 ?auto_86125 ) ) ( not ( = ?auto_86122 ?auto_86126 ) ) ( not ( = ?auto_86122 ?auto_86127 ) ) ( not ( = ?auto_86122 ?auto_86128 ) ) ( not ( = ?auto_86122 ?auto_86129 ) ) ( not ( = ?auto_86123 ?auto_86124 ) ) ( not ( = ?auto_86123 ?auto_86125 ) ) ( not ( = ?auto_86123 ?auto_86126 ) ) ( not ( = ?auto_86123 ?auto_86127 ) ) ( not ( = ?auto_86123 ?auto_86128 ) ) ( not ( = ?auto_86123 ?auto_86129 ) ) ( not ( = ?auto_86124 ?auto_86125 ) ) ( not ( = ?auto_86124 ?auto_86126 ) ) ( not ( = ?auto_86124 ?auto_86127 ) ) ( not ( = ?auto_86124 ?auto_86128 ) ) ( not ( = ?auto_86124 ?auto_86129 ) ) ( not ( = ?auto_86125 ?auto_86126 ) ) ( not ( = ?auto_86125 ?auto_86127 ) ) ( not ( = ?auto_86125 ?auto_86128 ) ) ( not ( = ?auto_86125 ?auto_86129 ) ) ( not ( = ?auto_86126 ?auto_86127 ) ) ( not ( = ?auto_86126 ?auto_86128 ) ) ( not ( = ?auto_86126 ?auto_86129 ) ) ( not ( = ?auto_86127 ?auto_86128 ) ) ( not ( = ?auto_86127 ?auto_86129 ) ) ( not ( = ?auto_86128 ?auto_86129 ) ) ( ON ?auto_86127 ?auto_86128 ) ( CLEAR ?auto_86125 ) ( ON ?auto_86126 ?auto_86127 ) ( CLEAR ?auto_86126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86120 ?auto_86121 ?auto_86122 ?auto_86123 ?auto_86124 ?auto_86125 ?auto_86126 )
      ( MAKE-9PILE ?auto_86120 ?auto_86121 ?auto_86122 ?auto_86123 ?auto_86124 ?auto_86125 ?auto_86126 ?auto_86127 ?auto_86128 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86158 - BLOCK
      ?auto_86159 - BLOCK
      ?auto_86160 - BLOCK
      ?auto_86161 - BLOCK
      ?auto_86162 - BLOCK
      ?auto_86163 - BLOCK
      ?auto_86164 - BLOCK
      ?auto_86165 - BLOCK
      ?auto_86166 - BLOCK
    )
    :vars
    (
      ?auto_86167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86166 ?auto_86167 ) ( ON-TABLE ?auto_86158 ) ( ON ?auto_86159 ?auto_86158 ) ( ON ?auto_86160 ?auto_86159 ) ( ON ?auto_86161 ?auto_86160 ) ( ON ?auto_86162 ?auto_86161 ) ( not ( = ?auto_86158 ?auto_86159 ) ) ( not ( = ?auto_86158 ?auto_86160 ) ) ( not ( = ?auto_86158 ?auto_86161 ) ) ( not ( = ?auto_86158 ?auto_86162 ) ) ( not ( = ?auto_86158 ?auto_86163 ) ) ( not ( = ?auto_86158 ?auto_86164 ) ) ( not ( = ?auto_86158 ?auto_86165 ) ) ( not ( = ?auto_86158 ?auto_86166 ) ) ( not ( = ?auto_86158 ?auto_86167 ) ) ( not ( = ?auto_86159 ?auto_86160 ) ) ( not ( = ?auto_86159 ?auto_86161 ) ) ( not ( = ?auto_86159 ?auto_86162 ) ) ( not ( = ?auto_86159 ?auto_86163 ) ) ( not ( = ?auto_86159 ?auto_86164 ) ) ( not ( = ?auto_86159 ?auto_86165 ) ) ( not ( = ?auto_86159 ?auto_86166 ) ) ( not ( = ?auto_86159 ?auto_86167 ) ) ( not ( = ?auto_86160 ?auto_86161 ) ) ( not ( = ?auto_86160 ?auto_86162 ) ) ( not ( = ?auto_86160 ?auto_86163 ) ) ( not ( = ?auto_86160 ?auto_86164 ) ) ( not ( = ?auto_86160 ?auto_86165 ) ) ( not ( = ?auto_86160 ?auto_86166 ) ) ( not ( = ?auto_86160 ?auto_86167 ) ) ( not ( = ?auto_86161 ?auto_86162 ) ) ( not ( = ?auto_86161 ?auto_86163 ) ) ( not ( = ?auto_86161 ?auto_86164 ) ) ( not ( = ?auto_86161 ?auto_86165 ) ) ( not ( = ?auto_86161 ?auto_86166 ) ) ( not ( = ?auto_86161 ?auto_86167 ) ) ( not ( = ?auto_86162 ?auto_86163 ) ) ( not ( = ?auto_86162 ?auto_86164 ) ) ( not ( = ?auto_86162 ?auto_86165 ) ) ( not ( = ?auto_86162 ?auto_86166 ) ) ( not ( = ?auto_86162 ?auto_86167 ) ) ( not ( = ?auto_86163 ?auto_86164 ) ) ( not ( = ?auto_86163 ?auto_86165 ) ) ( not ( = ?auto_86163 ?auto_86166 ) ) ( not ( = ?auto_86163 ?auto_86167 ) ) ( not ( = ?auto_86164 ?auto_86165 ) ) ( not ( = ?auto_86164 ?auto_86166 ) ) ( not ( = ?auto_86164 ?auto_86167 ) ) ( not ( = ?auto_86165 ?auto_86166 ) ) ( not ( = ?auto_86165 ?auto_86167 ) ) ( not ( = ?auto_86166 ?auto_86167 ) ) ( ON ?auto_86165 ?auto_86166 ) ( ON ?auto_86164 ?auto_86165 ) ( CLEAR ?auto_86162 ) ( ON ?auto_86163 ?auto_86164 ) ( CLEAR ?auto_86163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86158 ?auto_86159 ?auto_86160 ?auto_86161 ?auto_86162 ?auto_86163 )
      ( MAKE-9PILE ?auto_86158 ?auto_86159 ?auto_86160 ?auto_86161 ?auto_86162 ?auto_86163 ?auto_86164 ?auto_86165 ?auto_86166 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86196 - BLOCK
      ?auto_86197 - BLOCK
      ?auto_86198 - BLOCK
      ?auto_86199 - BLOCK
      ?auto_86200 - BLOCK
      ?auto_86201 - BLOCK
      ?auto_86202 - BLOCK
      ?auto_86203 - BLOCK
      ?auto_86204 - BLOCK
    )
    :vars
    (
      ?auto_86205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86204 ?auto_86205 ) ( ON-TABLE ?auto_86196 ) ( ON ?auto_86197 ?auto_86196 ) ( ON ?auto_86198 ?auto_86197 ) ( ON ?auto_86199 ?auto_86198 ) ( not ( = ?auto_86196 ?auto_86197 ) ) ( not ( = ?auto_86196 ?auto_86198 ) ) ( not ( = ?auto_86196 ?auto_86199 ) ) ( not ( = ?auto_86196 ?auto_86200 ) ) ( not ( = ?auto_86196 ?auto_86201 ) ) ( not ( = ?auto_86196 ?auto_86202 ) ) ( not ( = ?auto_86196 ?auto_86203 ) ) ( not ( = ?auto_86196 ?auto_86204 ) ) ( not ( = ?auto_86196 ?auto_86205 ) ) ( not ( = ?auto_86197 ?auto_86198 ) ) ( not ( = ?auto_86197 ?auto_86199 ) ) ( not ( = ?auto_86197 ?auto_86200 ) ) ( not ( = ?auto_86197 ?auto_86201 ) ) ( not ( = ?auto_86197 ?auto_86202 ) ) ( not ( = ?auto_86197 ?auto_86203 ) ) ( not ( = ?auto_86197 ?auto_86204 ) ) ( not ( = ?auto_86197 ?auto_86205 ) ) ( not ( = ?auto_86198 ?auto_86199 ) ) ( not ( = ?auto_86198 ?auto_86200 ) ) ( not ( = ?auto_86198 ?auto_86201 ) ) ( not ( = ?auto_86198 ?auto_86202 ) ) ( not ( = ?auto_86198 ?auto_86203 ) ) ( not ( = ?auto_86198 ?auto_86204 ) ) ( not ( = ?auto_86198 ?auto_86205 ) ) ( not ( = ?auto_86199 ?auto_86200 ) ) ( not ( = ?auto_86199 ?auto_86201 ) ) ( not ( = ?auto_86199 ?auto_86202 ) ) ( not ( = ?auto_86199 ?auto_86203 ) ) ( not ( = ?auto_86199 ?auto_86204 ) ) ( not ( = ?auto_86199 ?auto_86205 ) ) ( not ( = ?auto_86200 ?auto_86201 ) ) ( not ( = ?auto_86200 ?auto_86202 ) ) ( not ( = ?auto_86200 ?auto_86203 ) ) ( not ( = ?auto_86200 ?auto_86204 ) ) ( not ( = ?auto_86200 ?auto_86205 ) ) ( not ( = ?auto_86201 ?auto_86202 ) ) ( not ( = ?auto_86201 ?auto_86203 ) ) ( not ( = ?auto_86201 ?auto_86204 ) ) ( not ( = ?auto_86201 ?auto_86205 ) ) ( not ( = ?auto_86202 ?auto_86203 ) ) ( not ( = ?auto_86202 ?auto_86204 ) ) ( not ( = ?auto_86202 ?auto_86205 ) ) ( not ( = ?auto_86203 ?auto_86204 ) ) ( not ( = ?auto_86203 ?auto_86205 ) ) ( not ( = ?auto_86204 ?auto_86205 ) ) ( ON ?auto_86203 ?auto_86204 ) ( ON ?auto_86202 ?auto_86203 ) ( ON ?auto_86201 ?auto_86202 ) ( CLEAR ?auto_86199 ) ( ON ?auto_86200 ?auto_86201 ) ( CLEAR ?auto_86200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86196 ?auto_86197 ?auto_86198 ?auto_86199 ?auto_86200 )
      ( MAKE-9PILE ?auto_86196 ?auto_86197 ?auto_86198 ?auto_86199 ?auto_86200 ?auto_86201 ?auto_86202 ?auto_86203 ?auto_86204 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86234 - BLOCK
      ?auto_86235 - BLOCK
      ?auto_86236 - BLOCK
      ?auto_86237 - BLOCK
      ?auto_86238 - BLOCK
      ?auto_86239 - BLOCK
      ?auto_86240 - BLOCK
      ?auto_86241 - BLOCK
      ?auto_86242 - BLOCK
    )
    :vars
    (
      ?auto_86243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86242 ?auto_86243 ) ( ON-TABLE ?auto_86234 ) ( ON ?auto_86235 ?auto_86234 ) ( ON ?auto_86236 ?auto_86235 ) ( not ( = ?auto_86234 ?auto_86235 ) ) ( not ( = ?auto_86234 ?auto_86236 ) ) ( not ( = ?auto_86234 ?auto_86237 ) ) ( not ( = ?auto_86234 ?auto_86238 ) ) ( not ( = ?auto_86234 ?auto_86239 ) ) ( not ( = ?auto_86234 ?auto_86240 ) ) ( not ( = ?auto_86234 ?auto_86241 ) ) ( not ( = ?auto_86234 ?auto_86242 ) ) ( not ( = ?auto_86234 ?auto_86243 ) ) ( not ( = ?auto_86235 ?auto_86236 ) ) ( not ( = ?auto_86235 ?auto_86237 ) ) ( not ( = ?auto_86235 ?auto_86238 ) ) ( not ( = ?auto_86235 ?auto_86239 ) ) ( not ( = ?auto_86235 ?auto_86240 ) ) ( not ( = ?auto_86235 ?auto_86241 ) ) ( not ( = ?auto_86235 ?auto_86242 ) ) ( not ( = ?auto_86235 ?auto_86243 ) ) ( not ( = ?auto_86236 ?auto_86237 ) ) ( not ( = ?auto_86236 ?auto_86238 ) ) ( not ( = ?auto_86236 ?auto_86239 ) ) ( not ( = ?auto_86236 ?auto_86240 ) ) ( not ( = ?auto_86236 ?auto_86241 ) ) ( not ( = ?auto_86236 ?auto_86242 ) ) ( not ( = ?auto_86236 ?auto_86243 ) ) ( not ( = ?auto_86237 ?auto_86238 ) ) ( not ( = ?auto_86237 ?auto_86239 ) ) ( not ( = ?auto_86237 ?auto_86240 ) ) ( not ( = ?auto_86237 ?auto_86241 ) ) ( not ( = ?auto_86237 ?auto_86242 ) ) ( not ( = ?auto_86237 ?auto_86243 ) ) ( not ( = ?auto_86238 ?auto_86239 ) ) ( not ( = ?auto_86238 ?auto_86240 ) ) ( not ( = ?auto_86238 ?auto_86241 ) ) ( not ( = ?auto_86238 ?auto_86242 ) ) ( not ( = ?auto_86238 ?auto_86243 ) ) ( not ( = ?auto_86239 ?auto_86240 ) ) ( not ( = ?auto_86239 ?auto_86241 ) ) ( not ( = ?auto_86239 ?auto_86242 ) ) ( not ( = ?auto_86239 ?auto_86243 ) ) ( not ( = ?auto_86240 ?auto_86241 ) ) ( not ( = ?auto_86240 ?auto_86242 ) ) ( not ( = ?auto_86240 ?auto_86243 ) ) ( not ( = ?auto_86241 ?auto_86242 ) ) ( not ( = ?auto_86241 ?auto_86243 ) ) ( not ( = ?auto_86242 ?auto_86243 ) ) ( ON ?auto_86241 ?auto_86242 ) ( ON ?auto_86240 ?auto_86241 ) ( ON ?auto_86239 ?auto_86240 ) ( ON ?auto_86238 ?auto_86239 ) ( CLEAR ?auto_86236 ) ( ON ?auto_86237 ?auto_86238 ) ( CLEAR ?auto_86237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86234 ?auto_86235 ?auto_86236 ?auto_86237 )
      ( MAKE-9PILE ?auto_86234 ?auto_86235 ?auto_86236 ?auto_86237 ?auto_86238 ?auto_86239 ?auto_86240 ?auto_86241 ?auto_86242 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86272 - BLOCK
      ?auto_86273 - BLOCK
      ?auto_86274 - BLOCK
      ?auto_86275 - BLOCK
      ?auto_86276 - BLOCK
      ?auto_86277 - BLOCK
      ?auto_86278 - BLOCK
      ?auto_86279 - BLOCK
      ?auto_86280 - BLOCK
    )
    :vars
    (
      ?auto_86281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86280 ?auto_86281 ) ( ON-TABLE ?auto_86272 ) ( ON ?auto_86273 ?auto_86272 ) ( not ( = ?auto_86272 ?auto_86273 ) ) ( not ( = ?auto_86272 ?auto_86274 ) ) ( not ( = ?auto_86272 ?auto_86275 ) ) ( not ( = ?auto_86272 ?auto_86276 ) ) ( not ( = ?auto_86272 ?auto_86277 ) ) ( not ( = ?auto_86272 ?auto_86278 ) ) ( not ( = ?auto_86272 ?auto_86279 ) ) ( not ( = ?auto_86272 ?auto_86280 ) ) ( not ( = ?auto_86272 ?auto_86281 ) ) ( not ( = ?auto_86273 ?auto_86274 ) ) ( not ( = ?auto_86273 ?auto_86275 ) ) ( not ( = ?auto_86273 ?auto_86276 ) ) ( not ( = ?auto_86273 ?auto_86277 ) ) ( not ( = ?auto_86273 ?auto_86278 ) ) ( not ( = ?auto_86273 ?auto_86279 ) ) ( not ( = ?auto_86273 ?auto_86280 ) ) ( not ( = ?auto_86273 ?auto_86281 ) ) ( not ( = ?auto_86274 ?auto_86275 ) ) ( not ( = ?auto_86274 ?auto_86276 ) ) ( not ( = ?auto_86274 ?auto_86277 ) ) ( not ( = ?auto_86274 ?auto_86278 ) ) ( not ( = ?auto_86274 ?auto_86279 ) ) ( not ( = ?auto_86274 ?auto_86280 ) ) ( not ( = ?auto_86274 ?auto_86281 ) ) ( not ( = ?auto_86275 ?auto_86276 ) ) ( not ( = ?auto_86275 ?auto_86277 ) ) ( not ( = ?auto_86275 ?auto_86278 ) ) ( not ( = ?auto_86275 ?auto_86279 ) ) ( not ( = ?auto_86275 ?auto_86280 ) ) ( not ( = ?auto_86275 ?auto_86281 ) ) ( not ( = ?auto_86276 ?auto_86277 ) ) ( not ( = ?auto_86276 ?auto_86278 ) ) ( not ( = ?auto_86276 ?auto_86279 ) ) ( not ( = ?auto_86276 ?auto_86280 ) ) ( not ( = ?auto_86276 ?auto_86281 ) ) ( not ( = ?auto_86277 ?auto_86278 ) ) ( not ( = ?auto_86277 ?auto_86279 ) ) ( not ( = ?auto_86277 ?auto_86280 ) ) ( not ( = ?auto_86277 ?auto_86281 ) ) ( not ( = ?auto_86278 ?auto_86279 ) ) ( not ( = ?auto_86278 ?auto_86280 ) ) ( not ( = ?auto_86278 ?auto_86281 ) ) ( not ( = ?auto_86279 ?auto_86280 ) ) ( not ( = ?auto_86279 ?auto_86281 ) ) ( not ( = ?auto_86280 ?auto_86281 ) ) ( ON ?auto_86279 ?auto_86280 ) ( ON ?auto_86278 ?auto_86279 ) ( ON ?auto_86277 ?auto_86278 ) ( ON ?auto_86276 ?auto_86277 ) ( ON ?auto_86275 ?auto_86276 ) ( CLEAR ?auto_86273 ) ( ON ?auto_86274 ?auto_86275 ) ( CLEAR ?auto_86274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86272 ?auto_86273 ?auto_86274 )
      ( MAKE-9PILE ?auto_86272 ?auto_86273 ?auto_86274 ?auto_86275 ?auto_86276 ?auto_86277 ?auto_86278 ?auto_86279 ?auto_86280 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86310 - BLOCK
      ?auto_86311 - BLOCK
      ?auto_86312 - BLOCK
      ?auto_86313 - BLOCK
      ?auto_86314 - BLOCK
      ?auto_86315 - BLOCK
      ?auto_86316 - BLOCK
      ?auto_86317 - BLOCK
      ?auto_86318 - BLOCK
    )
    :vars
    (
      ?auto_86319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86318 ?auto_86319 ) ( ON-TABLE ?auto_86310 ) ( not ( = ?auto_86310 ?auto_86311 ) ) ( not ( = ?auto_86310 ?auto_86312 ) ) ( not ( = ?auto_86310 ?auto_86313 ) ) ( not ( = ?auto_86310 ?auto_86314 ) ) ( not ( = ?auto_86310 ?auto_86315 ) ) ( not ( = ?auto_86310 ?auto_86316 ) ) ( not ( = ?auto_86310 ?auto_86317 ) ) ( not ( = ?auto_86310 ?auto_86318 ) ) ( not ( = ?auto_86310 ?auto_86319 ) ) ( not ( = ?auto_86311 ?auto_86312 ) ) ( not ( = ?auto_86311 ?auto_86313 ) ) ( not ( = ?auto_86311 ?auto_86314 ) ) ( not ( = ?auto_86311 ?auto_86315 ) ) ( not ( = ?auto_86311 ?auto_86316 ) ) ( not ( = ?auto_86311 ?auto_86317 ) ) ( not ( = ?auto_86311 ?auto_86318 ) ) ( not ( = ?auto_86311 ?auto_86319 ) ) ( not ( = ?auto_86312 ?auto_86313 ) ) ( not ( = ?auto_86312 ?auto_86314 ) ) ( not ( = ?auto_86312 ?auto_86315 ) ) ( not ( = ?auto_86312 ?auto_86316 ) ) ( not ( = ?auto_86312 ?auto_86317 ) ) ( not ( = ?auto_86312 ?auto_86318 ) ) ( not ( = ?auto_86312 ?auto_86319 ) ) ( not ( = ?auto_86313 ?auto_86314 ) ) ( not ( = ?auto_86313 ?auto_86315 ) ) ( not ( = ?auto_86313 ?auto_86316 ) ) ( not ( = ?auto_86313 ?auto_86317 ) ) ( not ( = ?auto_86313 ?auto_86318 ) ) ( not ( = ?auto_86313 ?auto_86319 ) ) ( not ( = ?auto_86314 ?auto_86315 ) ) ( not ( = ?auto_86314 ?auto_86316 ) ) ( not ( = ?auto_86314 ?auto_86317 ) ) ( not ( = ?auto_86314 ?auto_86318 ) ) ( not ( = ?auto_86314 ?auto_86319 ) ) ( not ( = ?auto_86315 ?auto_86316 ) ) ( not ( = ?auto_86315 ?auto_86317 ) ) ( not ( = ?auto_86315 ?auto_86318 ) ) ( not ( = ?auto_86315 ?auto_86319 ) ) ( not ( = ?auto_86316 ?auto_86317 ) ) ( not ( = ?auto_86316 ?auto_86318 ) ) ( not ( = ?auto_86316 ?auto_86319 ) ) ( not ( = ?auto_86317 ?auto_86318 ) ) ( not ( = ?auto_86317 ?auto_86319 ) ) ( not ( = ?auto_86318 ?auto_86319 ) ) ( ON ?auto_86317 ?auto_86318 ) ( ON ?auto_86316 ?auto_86317 ) ( ON ?auto_86315 ?auto_86316 ) ( ON ?auto_86314 ?auto_86315 ) ( ON ?auto_86313 ?auto_86314 ) ( ON ?auto_86312 ?auto_86313 ) ( CLEAR ?auto_86310 ) ( ON ?auto_86311 ?auto_86312 ) ( CLEAR ?auto_86311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86310 ?auto_86311 )
      ( MAKE-9PILE ?auto_86310 ?auto_86311 ?auto_86312 ?auto_86313 ?auto_86314 ?auto_86315 ?auto_86316 ?auto_86317 ?auto_86318 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_86348 - BLOCK
      ?auto_86349 - BLOCK
      ?auto_86350 - BLOCK
      ?auto_86351 - BLOCK
      ?auto_86352 - BLOCK
      ?auto_86353 - BLOCK
      ?auto_86354 - BLOCK
      ?auto_86355 - BLOCK
      ?auto_86356 - BLOCK
    )
    :vars
    (
      ?auto_86357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86356 ?auto_86357 ) ( not ( = ?auto_86348 ?auto_86349 ) ) ( not ( = ?auto_86348 ?auto_86350 ) ) ( not ( = ?auto_86348 ?auto_86351 ) ) ( not ( = ?auto_86348 ?auto_86352 ) ) ( not ( = ?auto_86348 ?auto_86353 ) ) ( not ( = ?auto_86348 ?auto_86354 ) ) ( not ( = ?auto_86348 ?auto_86355 ) ) ( not ( = ?auto_86348 ?auto_86356 ) ) ( not ( = ?auto_86348 ?auto_86357 ) ) ( not ( = ?auto_86349 ?auto_86350 ) ) ( not ( = ?auto_86349 ?auto_86351 ) ) ( not ( = ?auto_86349 ?auto_86352 ) ) ( not ( = ?auto_86349 ?auto_86353 ) ) ( not ( = ?auto_86349 ?auto_86354 ) ) ( not ( = ?auto_86349 ?auto_86355 ) ) ( not ( = ?auto_86349 ?auto_86356 ) ) ( not ( = ?auto_86349 ?auto_86357 ) ) ( not ( = ?auto_86350 ?auto_86351 ) ) ( not ( = ?auto_86350 ?auto_86352 ) ) ( not ( = ?auto_86350 ?auto_86353 ) ) ( not ( = ?auto_86350 ?auto_86354 ) ) ( not ( = ?auto_86350 ?auto_86355 ) ) ( not ( = ?auto_86350 ?auto_86356 ) ) ( not ( = ?auto_86350 ?auto_86357 ) ) ( not ( = ?auto_86351 ?auto_86352 ) ) ( not ( = ?auto_86351 ?auto_86353 ) ) ( not ( = ?auto_86351 ?auto_86354 ) ) ( not ( = ?auto_86351 ?auto_86355 ) ) ( not ( = ?auto_86351 ?auto_86356 ) ) ( not ( = ?auto_86351 ?auto_86357 ) ) ( not ( = ?auto_86352 ?auto_86353 ) ) ( not ( = ?auto_86352 ?auto_86354 ) ) ( not ( = ?auto_86352 ?auto_86355 ) ) ( not ( = ?auto_86352 ?auto_86356 ) ) ( not ( = ?auto_86352 ?auto_86357 ) ) ( not ( = ?auto_86353 ?auto_86354 ) ) ( not ( = ?auto_86353 ?auto_86355 ) ) ( not ( = ?auto_86353 ?auto_86356 ) ) ( not ( = ?auto_86353 ?auto_86357 ) ) ( not ( = ?auto_86354 ?auto_86355 ) ) ( not ( = ?auto_86354 ?auto_86356 ) ) ( not ( = ?auto_86354 ?auto_86357 ) ) ( not ( = ?auto_86355 ?auto_86356 ) ) ( not ( = ?auto_86355 ?auto_86357 ) ) ( not ( = ?auto_86356 ?auto_86357 ) ) ( ON ?auto_86355 ?auto_86356 ) ( ON ?auto_86354 ?auto_86355 ) ( ON ?auto_86353 ?auto_86354 ) ( ON ?auto_86352 ?auto_86353 ) ( ON ?auto_86351 ?auto_86352 ) ( ON ?auto_86350 ?auto_86351 ) ( ON ?auto_86349 ?auto_86350 ) ( ON ?auto_86348 ?auto_86349 ) ( CLEAR ?auto_86348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86348 )
      ( MAKE-9PILE ?auto_86348 ?auto_86349 ?auto_86350 ?auto_86351 ?auto_86352 ?auto_86353 ?auto_86354 ?auto_86355 ?auto_86356 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86387 - BLOCK
      ?auto_86388 - BLOCK
      ?auto_86389 - BLOCK
      ?auto_86390 - BLOCK
      ?auto_86391 - BLOCK
      ?auto_86392 - BLOCK
      ?auto_86393 - BLOCK
      ?auto_86394 - BLOCK
      ?auto_86395 - BLOCK
      ?auto_86396 - BLOCK
    )
    :vars
    (
      ?auto_86397 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86395 ) ( ON ?auto_86396 ?auto_86397 ) ( CLEAR ?auto_86396 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86387 ) ( ON ?auto_86388 ?auto_86387 ) ( ON ?auto_86389 ?auto_86388 ) ( ON ?auto_86390 ?auto_86389 ) ( ON ?auto_86391 ?auto_86390 ) ( ON ?auto_86392 ?auto_86391 ) ( ON ?auto_86393 ?auto_86392 ) ( ON ?auto_86394 ?auto_86393 ) ( ON ?auto_86395 ?auto_86394 ) ( not ( = ?auto_86387 ?auto_86388 ) ) ( not ( = ?auto_86387 ?auto_86389 ) ) ( not ( = ?auto_86387 ?auto_86390 ) ) ( not ( = ?auto_86387 ?auto_86391 ) ) ( not ( = ?auto_86387 ?auto_86392 ) ) ( not ( = ?auto_86387 ?auto_86393 ) ) ( not ( = ?auto_86387 ?auto_86394 ) ) ( not ( = ?auto_86387 ?auto_86395 ) ) ( not ( = ?auto_86387 ?auto_86396 ) ) ( not ( = ?auto_86387 ?auto_86397 ) ) ( not ( = ?auto_86388 ?auto_86389 ) ) ( not ( = ?auto_86388 ?auto_86390 ) ) ( not ( = ?auto_86388 ?auto_86391 ) ) ( not ( = ?auto_86388 ?auto_86392 ) ) ( not ( = ?auto_86388 ?auto_86393 ) ) ( not ( = ?auto_86388 ?auto_86394 ) ) ( not ( = ?auto_86388 ?auto_86395 ) ) ( not ( = ?auto_86388 ?auto_86396 ) ) ( not ( = ?auto_86388 ?auto_86397 ) ) ( not ( = ?auto_86389 ?auto_86390 ) ) ( not ( = ?auto_86389 ?auto_86391 ) ) ( not ( = ?auto_86389 ?auto_86392 ) ) ( not ( = ?auto_86389 ?auto_86393 ) ) ( not ( = ?auto_86389 ?auto_86394 ) ) ( not ( = ?auto_86389 ?auto_86395 ) ) ( not ( = ?auto_86389 ?auto_86396 ) ) ( not ( = ?auto_86389 ?auto_86397 ) ) ( not ( = ?auto_86390 ?auto_86391 ) ) ( not ( = ?auto_86390 ?auto_86392 ) ) ( not ( = ?auto_86390 ?auto_86393 ) ) ( not ( = ?auto_86390 ?auto_86394 ) ) ( not ( = ?auto_86390 ?auto_86395 ) ) ( not ( = ?auto_86390 ?auto_86396 ) ) ( not ( = ?auto_86390 ?auto_86397 ) ) ( not ( = ?auto_86391 ?auto_86392 ) ) ( not ( = ?auto_86391 ?auto_86393 ) ) ( not ( = ?auto_86391 ?auto_86394 ) ) ( not ( = ?auto_86391 ?auto_86395 ) ) ( not ( = ?auto_86391 ?auto_86396 ) ) ( not ( = ?auto_86391 ?auto_86397 ) ) ( not ( = ?auto_86392 ?auto_86393 ) ) ( not ( = ?auto_86392 ?auto_86394 ) ) ( not ( = ?auto_86392 ?auto_86395 ) ) ( not ( = ?auto_86392 ?auto_86396 ) ) ( not ( = ?auto_86392 ?auto_86397 ) ) ( not ( = ?auto_86393 ?auto_86394 ) ) ( not ( = ?auto_86393 ?auto_86395 ) ) ( not ( = ?auto_86393 ?auto_86396 ) ) ( not ( = ?auto_86393 ?auto_86397 ) ) ( not ( = ?auto_86394 ?auto_86395 ) ) ( not ( = ?auto_86394 ?auto_86396 ) ) ( not ( = ?auto_86394 ?auto_86397 ) ) ( not ( = ?auto_86395 ?auto_86396 ) ) ( not ( = ?auto_86395 ?auto_86397 ) ) ( not ( = ?auto_86396 ?auto_86397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86396 ?auto_86397 )
      ( !STACK ?auto_86396 ?auto_86395 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86408 - BLOCK
      ?auto_86409 - BLOCK
      ?auto_86410 - BLOCK
      ?auto_86411 - BLOCK
      ?auto_86412 - BLOCK
      ?auto_86413 - BLOCK
      ?auto_86414 - BLOCK
      ?auto_86415 - BLOCK
      ?auto_86416 - BLOCK
      ?auto_86417 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86416 ) ( ON-TABLE ?auto_86417 ) ( CLEAR ?auto_86417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86408 ) ( ON ?auto_86409 ?auto_86408 ) ( ON ?auto_86410 ?auto_86409 ) ( ON ?auto_86411 ?auto_86410 ) ( ON ?auto_86412 ?auto_86411 ) ( ON ?auto_86413 ?auto_86412 ) ( ON ?auto_86414 ?auto_86413 ) ( ON ?auto_86415 ?auto_86414 ) ( ON ?auto_86416 ?auto_86415 ) ( not ( = ?auto_86408 ?auto_86409 ) ) ( not ( = ?auto_86408 ?auto_86410 ) ) ( not ( = ?auto_86408 ?auto_86411 ) ) ( not ( = ?auto_86408 ?auto_86412 ) ) ( not ( = ?auto_86408 ?auto_86413 ) ) ( not ( = ?auto_86408 ?auto_86414 ) ) ( not ( = ?auto_86408 ?auto_86415 ) ) ( not ( = ?auto_86408 ?auto_86416 ) ) ( not ( = ?auto_86408 ?auto_86417 ) ) ( not ( = ?auto_86409 ?auto_86410 ) ) ( not ( = ?auto_86409 ?auto_86411 ) ) ( not ( = ?auto_86409 ?auto_86412 ) ) ( not ( = ?auto_86409 ?auto_86413 ) ) ( not ( = ?auto_86409 ?auto_86414 ) ) ( not ( = ?auto_86409 ?auto_86415 ) ) ( not ( = ?auto_86409 ?auto_86416 ) ) ( not ( = ?auto_86409 ?auto_86417 ) ) ( not ( = ?auto_86410 ?auto_86411 ) ) ( not ( = ?auto_86410 ?auto_86412 ) ) ( not ( = ?auto_86410 ?auto_86413 ) ) ( not ( = ?auto_86410 ?auto_86414 ) ) ( not ( = ?auto_86410 ?auto_86415 ) ) ( not ( = ?auto_86410 ?auto_86416 ) ) ( not ( = ?auto_86410 ?auto_86417 ) ) ( not ( = ?auto_86411 ?auto_86412 ) ) ( not ( = ?auto_86411 ?auto_86413 ) ) ( not ( = ?auto_86411 ?auto_86414 ) ) ( not ( = ?auto_86411 ?auto_86415 ) ) ( not ( = ?auto_86411 ?auto_86416 ) ) ( not ( = ?auto_86411 ?auto_86417 ) ) ( not ( = ?auto_86412 ?auto_86413 ) ) ( not ( = ?auto_86412 ?auto_86414 ) ) ( not ( = ?auto_86412 ?auto_86415 ) ) ( not ( = ?auto_86412 ?auto_86416 ) ) ( not ( = ?auto_86412 ?auto_86417 ) ) ( not ( = ?auto_86413 ?auto_86414 ) ) ( not ( = ?auto_86413 ?auto_86415 ) ) ( not ( = ?auto_86413 ?auto_86416 ) ) ( not ( = ?auto_86413 ?auto_86417 ) ) ( not ( = ?auto_86414 ?auto_86415 ) ) ( not ( = ?auto_86414 ?auto_86416 ) ) ( not ( = ?auto_86414 ?auto_86417 ) ) ( not ( = ?auto_86415 ?auto_86416 ) ) ( not ( = ?auto_86415 ?auto_86417 ) ) ( not ( = ?auto_86416 ?auto_86417 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_86417 )
      ( !STACK ?auto_86417 ?auto_86416 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86428 - BLOCK
      ?auto_86429 - BLOCK
      ?auto_86430 - BLOCK
      ?auto_86431 - BLOCK
      ?auto_86432 - BLOCK
      ?auto_86433 - BLOCK
      ?auto_86434 - BLOCK
      ?auto_86435 - BLOCK
      ?auto_86436 - BLOCK
      ?auto_86437 - BLOCK
    )
    :vars
    (
      ?auto_86438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86437 ?auto_86438 ) ( ON-TABLE ?auto_86428 ) ( ON ?auto_86429 ?auto_86428 ) ( ON ?auto_86430 ?auto_86429 ) ( ON ?auto_86431 ?auto_86430 ) ( ON ?auto_86432 ?auto_86431 ) ( ON ?auto_86433 ?auto_86432 ) ( ON ?auto_86434 ?auto_86433 ) ( ON ?auto_86435 ?auto_86434 ) ( not ( = ?auto_86428 ?auto_86429 ) ) ( not ( = ?auto_86428 ?auto_86430 ) ) ( not ( = ?auto_86428 ?auto_86431 ) ) ( not ( = ?auto_86428 ?auto_86432 ) ) ( not ( = ?auto_86428 ?auto_86433 ) ) ( not ( = ?auto_86428 ?auto_86434 ) ) ( not ( = ?auto_86428 ?auto_86435 ) ) ( not ( = ?auto_86428 ?auto_86436 ) ) ( not ( = ?auto_86428 ?auto_86437 ) ) ( not ( = ?auto_86428 ?auto_86438 ) ) ( not ( = ?auto_86429 ?auto_86430 ) ) ( not ( = ?auto_86429 ?auto_86431 ) ) ( not ( = ?auto_86429 ?auto_86432 ) ) ( not ( = ?auto_86429 ?auto_86433 ) ) ( not ( = ?auto_86429 ?auto_86434 ) ) ( not ( = ?auto_86429 ?auto_86435 ) ) ( not ( = ?auto_86429 ?auto_86436 ) ) ( not ( = ?auto_86429 ?auto_86437 ) ) ( not ( = ?auto_86429 ?auto_86438 ) ) ( not ( = ?auto_86430 ?auto_86431 ) ) ( not ( = ?auto_86430 ?auto_86432 ) ) ( not ( = ?auto_86430 ?auto_86433 ) ) ( not ( = ?auto_86430 ?auto_86434 ) ) ( not ( = ?auto_86430 ?auto_86435 ) ) ( not ( = ?auto_86430 ?auto_86436 ) ) ( not ( = ?auto_86430 ?auto_86437 ) ) ( not ( = ?auto_86430 ?auto_86438 ) ) ( not ( = ?auto_86431 ?auto_86432 ) ) ( not ( = ?auto_86431 ?auto_86433 ) ) ( not ( = ?auto_86431 ?auto_86434 ) ) ( not ( = ?auto_86431 ?auto_86435 ) ) ( not ( = ?auto_86431 ?auto_86436 ) ) ( not ( = ?auto_86431 ?auto_86437 ) ) ( not ( = ?auto_86431 ?auto_86438 ) ) ( not ( = ?auto_86432 ?auto_86433 ) ) ( not ( = ?auto_86432 ?auto_86434 ) ) ( not ( = ?auto_86432 ?auto_86435 ) ) ( not ( = ?auto_86432 ?auto_86436 ) ) ( not ( = ?auto_86432 ?auto_86437 ) ) ( not ( = ?auto_86432 ?auto_86438 ) ) ( not ( = ?auto_86433 ?auto_86434 ) ) ( not ( = ?auto_86433 ?auto_86435 ) ) ( not ( = ?auto_86433 ?auto_86436 ) ) ( not ( = ?auto_86433 ?auto_86437 ) ) ( not ( = ?auto_86433 ?auto_86438 ) ) ( not ( = ?auto_86434 ?auto_86435 ) ) ( not ( = ?auto_86434 ?auto_86436 ) ) ( not ( = ?auto_86434 ?auto_86437 ) ) ( not ( = ?auto_86434 ?auto_86438 ) ) ( not ( = ?auto_86435 ?auto_86436 ) ) ( not ( = ?auto_86435 ?auto_86437 ) ) ( not ( = ?auto_86435 ?auto_86438 ) ) ( not ( = ?auto_86436 ?auto_86437 ) ) ( not ( = ?auto_86436 ?auto_86438 ) ) ( not ( = ?auto_86437 ?auto_86438 ) ) ( CLEAR ?auto_86435 ) ( ON ?auto_86436 ?auto_86437 ) ( CLEAR ?auto_86436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_86428 ?auto_86429 ?auto_86430 ?auto_86431 ?auto_86432 ?auto_86433 ?auto_86434 ?auto_86435 ?auto_86436 )
      ( MAKE-10PILE ?auto_86428 ?auto_86429 ?auto_86430 ?auto_86431 ?auto_86432 ?auto_86433 ?auto_86434 ?auto_86435 ?auto_86436 ?auto_86437 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86449 - BLOCK
      ?auto_86450 - BLOCK
      ?auto_86451 - BLOCK
      ?auto_86452 - BLOCK
      ?auto_86453 - BLOCK
      ?auto_86454 - BLOCK
      ?auto_86455 - BLOCK
      ?auto_86456 - BLOCK
      ?auto_86457 - BLOCK
      ?auto_86458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86458 ) ( ON-TABLE ?auto_86449 ) ( ON ?auto_86450 ?auto_86449 ) ( ON ?auto_86451 ?auto_86450 ) ( ON ?auto_86452 ?auto_86451 ) ( ON ?auto_86453 ?auto_86452 ) ( ON ?auto_86454 ?auto_86453 ) ( ON ?auto_86455 ?auto_86454 ) ( ON ?auto_86456 ?auto_86455 ) ( not ( = ?auto_86449 ?auto_86450 ) ) ( not ( = ?auto_86449 ?auto_86451 ) ) ( not ( = ?auto_86449 ?auto_86452 ) ) ( not ( = ?auto_86449 ?auto_86453 ) ) ( not ( = ?auto_86449 ?auto_86454 ) ) ( not ( = ?auto_86449 ?auto_86455 ) ) ( not ( = ?auto_86449 ?auto_86456 ) ) ( not ( = ?auto_86449 ?auto_86457 ) ) ( not ( = ?auto_86449 ?auto_86458 ) ) ( not ( = ?auto_86450 ?auto_86451 ) ) ( not ( = ?auto_86450 ?auto_86452 ) ) ( not ( = ?auto_86450 ?auto_86453 ) ) ( not ( = ?auto_86450 ?auto_86454 ) ) ( not ( = ?auto_86450 ?auto_86455 ) ) ( not ( = ?auto_86450 ?auto_86456 ) ) ( not ( = ?auto_86450 ?auto_86457 ) ) ( not ( = ?auto_86450 ?auto_86458 ) ) ( not ( = ?auto_86451 ?auto_86452 ) ) ( not ( = ?auto_86451 ?auto_86453 ) ) ( not ( = ?auto_86451 ?auto_86454 ) ) ( not ( = ?auto_86451 ?auto_86455 ) ) ( not ( = ?auto_86451 ?auto_86456 ) ) ( not ( = ?auto_86451 ?auto_86457 ) ) ( not ( = ?auto_86451 ?auto_86458 ) ) ( not ( = ?auto_86452 ?auto_86453 ) ) ( not ( = ?auto_86452 ?auto_86454 ) ) ( not ( = ?auto_86452 ?auto_86455 ) ) ( not ( = ?auto_86452 ?auto_86456 ) ) ( not ( = ?auto_86452 ?auto_86457 ) ) ( not ( = ?auto_86452 ?auto_86458 ) ) ( not ( = ?auto_86453 ?auto_86454 ) ) ( not ( = ?auto_86453 ?auto_86455 ) ) ( not ( = ?auto_86453 ?auto_86456 ) ) ( not ( = ?auto_86453 ?auto_86457 ) ) ( not ( = ?auto_86453 ?auto_86458 ) ) ( not ( = ?auto_86454 ?auto_86455 ) ) ( not ( = ?auto_86454 ?auto_86456 ) ) ( not ( = ?auto_86454 ?auto_86457 ) ) ( not ( = ?auto_86454 ?auto_86458 ) ) ( not ( = ?auto_86455 ?auto_86456 ) ) ( not ( = ?auto_86455 ?auto_86457 ) ) ( not ( = ?auto_86455 ?auto_86458 ) ) ( not ( = ?auto_86456 ?auto_86457 ) ) ( not ( = ?auto_86456 ?auto_86458 ) ) ( not ( = ?auto_86457 ?auto_86458 ) ) ( CLEAR ?auto_86456 ) ( ON ?auto_86457 ?auto_86458 ) ( CLEAR ?auto_86457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_86449 ?auto_86450 ?auto_86451 ?auto_86452 ?auto_86453 ?auto_86454 ?auto_86455 ?auto_86456 ?auto_86457 )
      ( MAKE-10PILE ?auto_86449 ?auto_86450 ?auto_86451 ?auto_86452 ?auto_86453 ?auto_86454 ?auto_86455 ?auto_86456 ?auto_86457 ?auto_86458 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86469 - BLOCK
      ?auto_86470 - BLOCK
      ?auto_86471 - BLOCK
      ?auto_86472 - BLOCK
      ?auto_86473 - BLOCK
      ?auto_86474 - BLOCK
      ?auto_86475 - BLOCK
      ?auto_86476 - BLOCK
      ?auto_86477 - BLOCK
      ?auto_86478 - BLOCK
    )
    :vars
    (
      ?auto_86479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86478 ?auto_86479 ) ( ON-TABLE ?auto_86469 ) ( ON ?auto_86470 ?auto_86469 ) ( ON ?auto_86471 ?auto_86470 ) ( ON ?auto_86472 ?auto_86471 ) ( ON ?auto_86473 ?auto_86472 ) ( ON ?auto_86474 ?auto_86473 ) ( ON ?auto_86475 ?auto_86474 ) ( not ( = ?auto_86469 ?auto_86470 ) ) ( not ( = ?auto_86469 ?auto_86471 ) ) ( not ( = ?auto_86469 ?auto_86472 ) ) ( not ( = ?auto_86469 ?auto_86473 ) ) ( not ( = ?auto_86469 ?auto_86474 ) ) ( not ( = ?auto_86469 ?auto_86475 ) ) ( not ( = ?auto_86469 ?auto_86476 ) ) ( not ( = ?auto_86469 ?auto_86477 ) ) ( not ( = ?auto_86469 ?auto_86478 ) ) ( not ( = ?auto_86469 ?auto_86479 ) ) ( not ( = ?auto_86470 ?auto_86471 ) ) ( not ( = ?auto_86470 ?auto_86472 ) ) ( not ( = ?auto_86470 ?auto_86473 ) ) ( not ( = ?auto_86470 ?auto_86474 ) ) ( not ( = ?auto_86470 ?auto_86475 ) ) ( not ( = ?auto_86470 ?auto_86476 ) ) ( not ( = ?auto_86470 ?auto_86477 ) ) ( not ( = ?auto_86470 ?auto_86478 ) ) ( not ( = ?auto_86470 ?auto_86479 ) ) ( not ( = ?auto_86471 ?auto_86472 ) ) ( not ( = ?auto_86471 ?auto_86473 ) ) ( not ( = ?auto_86471 ?auto_86474 ) ) ( not ( = ?auto_86471 ?auto_86475 ) ) ( not ( = ?auto_86471 ?auto_86476 ) ) ( not ( = ?auto_86471 ?auto_86477 ) ) ( not ( = ?auto_86471 ?auto_86478 ) ) ( not ( = ?auto_86471 ?auto_86479 ) ) ( not ( = ?auto_86472 ?auto_86473 ) ) ( not ( = ?auto_86472 ?auto_86474 ) ) ( not ( = ?auto_86472 ?auto_86475 ) ) ( not ( = ?auto_86472 ?auto_86476 ) ) ( not ( = ?auto_86472 ?auto_86477 ) ) ( not ( = ?auto_86472 ?auto_86478 ) ) ( not ( = ?auto_86472 ?auto_86479 ) ) ( not ( = ?auto_86473 ?auto_86474 ) ) ( not ( = ?auto_86473 ?auto_86475 ) ) ( not ( = ?auto_86473 ?auto_86476 ) ) ( not ( = ?auto_86473 ?auto_86477 ) ) ( not ( = ?auto_86473 ?auto_86478 ) ) ( not ( = ?auto_86473 ?auto_86479 ) ) ( not ( = ?auto_86474 ?auto_86475 ) ) ( not ( = ?auto_86474 ?auto_86476 ) ) ( not ( = ?auto_86474 ?auto_86477 ) ) ( not ( = ?auto_86474 ?auto_86478 ) ) ( not ( = ?auto_86474 ?auto_86479 ) ) ( not ( = ?auto_86475 ?auto_86476 ) ) ( not ( = ?auto_86475 ?auto_86477 ) ) ( not ( = ?auto_86475 ?auto_86478 ) ) ( not ( = ?auto_86475 ?auto_86479 ) ) ( not ( = ?auto_86476 ?auto_86477 ) ) ( not ( = ?auto_86476 ?auto_86478 ) ) ( not ( = ?auto_86476 ?auto_86479 ) ) ( not ( = ?auto_86477 ?auto_86478 ) ) ( not ( = ?auto_86477 ?auto_86479 ) ) ( not ( = ?auto_86478 ?auto_86479 ) ) ( ON ?auto_86477 ?auto_86478 ) ( CLEAR ?auto_86475 ) ( ON ?auto_86476 ?auto_86477 ) ( CLEAR ?auto_86476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_86469 ?auto_86470 ?auto_86471 ?auto_86472 ?auto_86473 ?auto_86474 ?auto_86475 ?auto_86476 )
      ( MAKE-10PILE ?auto_86469 ?auto_86470 ?auto_86471 ?auto_86472 ?auto_86473 ?auto_86474 ?auto_86475 ?auto_86476 ?auto_86477 ?auto_86478 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86490 - BLOCK
      ?auto_86491 - BLOCK
      ?auto_86492 - BLOCK
      ?auto_86493 - BLOCK
      ?auto_86494 - BLOCK
      ?auto_86495 - BLOCK
      ?auto_86496 - BLOCK
      ?auto_86497 - BLOCK
      ?auto_86498 - BLOCK
      ?auto_86499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86499 ) ( ON-TABLE ?auto_86490 ) ( ON ?auto_86491 ?auto_86490 ) ( ON ?auto_86492 ?auto_86491 ) ( ON ?auto_86493 ?auto_86492 ) ( ON ?auto_86494 ?auto_86493 ) ( ON ?auto_86495 ?auto_86494 ) ( ON ?auto_86496 ?auto_86495 ) ( not ( = ?auto_86490 ?auto_86491 ) ) ( not ( = ?auto_86490 ?auto_86492 ) ) ( not ( = ?auto_86490 ?auto_86493 ) ) ( not ( = ?auto_86490 ?auto_86494 ) ) ( not ( = ?auto_86490 ?auto_86495 ) ) ( not ( = ?auto_86490 ?auto_86496 ) ) ( not ( = ?auto_86490 ?auto_86497 ) ) ( not ( = ?auto_86490 ?auto_86498 ) ) ( not ( = ?auto_86490 ?auto_86499 ) ) ( not ( = ?auto_86491 ?auto_86492 ) ) ( not ( = ?auto_86491 ?auto_86493 ) ) ( not ( = ?auto_86491 ?auto_86494 ) ) ( not ( = ?auto_86491 ?auto_86495 ) ) ( not ( = ?auto_86491 ?auto_86496 ) ) ( not ( = ?auto_86491 ?auto_86497 ) ) ( not ( = ?auto_86491 ?auto_86498 ) ) ( not ( = ?auto_86491 ?auto_86499 ) ) ( not ( = ?auto_86492 ?auto_86493 ) ) ( not ( = ?auto_86492 ?auto_86494 ) ) ( not ( = ?auto_86492 ?auto_86495 ) ) ( not ( = ?auto_86492 ?auto_86496 ) ) ( not ( = ?auto_86492 ?auto_86497 ) ) ( not ( = ?auto_86492 ?auto_86498 ) ) ( not ( = ?auto_86492 ?auto_86499 ) ) ( not ( = ?auto_86493 ?auto_86494 ) ) ( not ( = ?auto_86493 ?auto_86495 ) ) ( not ( = ?auto_86493 ?auto_86496 ) ) ( not ( = ?auto_86493 ?auto_86497 ) ) ( not ( = ?auto_86493 ?auto_86498 ) ) ( not ( = ?auto_86493 ?auto_86499 ) ) ( not ( = ?auto_86494 ?auto_86495 ) ) ( not ( = ?auto_86494 ?auto_86496 ) ) ( not ( = ?auto_86494 ?auto_86497 ) ) ( not ( = ?auto_86494 ?auto_86498 ) ) ( not ( = ?auto_86494 ?auto_86499 ) ) ( not ( = ?auto_86495 ?auto_86496 ) ) ( not ( = ?auto_86495 ?auto_86497 ) ) ( not ( = ?auto_86495 ?auto_86498 ) ) ( not ( = ?auto_86495 ?auto_86499 ) ) ( not ( = ?auto_86496 ?auto_86497 ) ) ( not ( = ?auto_86496 ?auto_86498 ) ) ( not ( = ?auto_86496 ?auto_86499 ) ) ( not ( = ?auto_86497 ?auto_86498 ) ) ( not ( = ?auto_86497 ?auto_86499 ) ) ( not ( = ?auto_86498 ?auto_86499 ) ) ( ON ?auto_86498 ?auto_86499 ) ( CLEAR ?auto_86496 ) ( ON ?auto_86497 ?auto_86498 ) ( CLEAR ?auto_86497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_86490 ?auto_86491 ?auto_86492 ?auto_86493 ?auto_86494 ?auto_86495 ?auto_86496 ?auto_86497 )
      ( MAKE-10PILE ?auto_86490 ?auto_86491 ?auto_86492 ?auto_86493 ?auto_86494 ?auto_86495 ?auto_86496 ?auto_86497 ?auto_86498 ?auto_86499 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86510 - BLOCK
      ?auto_86511 - BLOCK
      ?auto_86512 - BLOCK
      ?auto_86513 - BLOCK
      ?auto_86514 - BLOCK
      ?auto_86515 - BLOCK
      ?auto_86516 - BLOCK
      ?auto_86517 - BLOCK
      ?auto_86518 - BLOCK
      ?auto_86519 - BLOCK
    )
    :vars
    (
      ?auto_86520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86519 ?auto_86520 ) ( ON-TABLE ?auto_86510 ) ( ON ?auto_86511 ?auto_86510 ) ( ON ?auto_86512 ?auto_86511 ) ( ON ?auto_86513 ?auto_86512 ) ( ON ?auto_86514 ?auto_86513 ) ( ON ?auto_86515 ?auto_86514 ) ( not ( = ?auto_86510 ?auto_86511 ) ) ( not ( = ?auto_86510 ?auto_86512 ) ) ( not ( = ?auto_86510 ?auto_86513 ) ) ( not ( = ?auto_86510 ?auto_86514 ) ) ( not ( = ?auto_86510 ?auto_86515 ) ) ( not ( = ?auto_86510 ?auto_86516 ) ) ( not ( = ?auto_86510 ?auto_86517 ) ) ( not ( = ?auto_86510 ?auto_86518 ) ) ( not ( = ?auto_86510 ?auto_86519 ) ) ( not ( = ?auto_86510 ?auto_86520 ) ) ( not ( = ?auto_86511 ?auto_86512 ) ) ( not ( = ?auto_86511 ?auto_86513 ) ) ( not ( = ?auto_86511 ?auto_86514 ) ) ( not ( = ?auto_86511 ?auto_86515 ) ) ( not ( = ?auto_86511 ?auto_86516 ) ) ( not ( = ?auto_86511 ?auto_86517 ) ) ( not ( = ?auto_86511 ?auto_86518 ) ) ( not ( = ?auto_86511 ?auto_86519 ) ) ( not ( = ?auto_86511 ?auto_86520 ) ) ( not ( = ?auto_86512 ?auto_86513 ) ) ( not ( = ?auto_86512 ?auto_86514 ) ) ( not ( = ?auto_86512 ?auto_86515 ) ) ( not ( = ?auto_86512 ?auto_86516 ) ) ( not ( = ?auto_86512 ?auto_86517 ) ) ( not ( = ?auto_86512 ?auto_86518 ) ) ( not ( = ?auto_86512 ?auto_86519 ) ) ( not ( = ?auto_86512 ?auto_86520 ) ) ( not ( = ?auto_86513 ?auto_86514 ) ) ( not ( = ?auto_86513 ?auto_86515 ) ) ( not ( = ?auto_86513 ?auto_86516 ) ) ( not ( = ?auto_86513 ?auto_86517 ) ) ( not ( = ?auto_86513 ?auto_86518 ) ) ( not ( = ?auto_86513 ?auto_86519 ) ) ( not ( = ?auto_86513 ?auto_86520 ) ) ( not ( = ?auto_86514 ?auto_86515 ) ) ( not ( = ?auto_86514 ?auto_86516 ) ) ( not ( = ?auto_86514 ?auto_86517 ) ) ( not ( = ?auto_86514 ?auto_86518 ) ) ( not ( = ?auto_86514 ?auto_86519 ) ) ( not ( = ?auto_86514 ?auto_86520 ) ) ( not ( = ?auto_86515 ?auto_86516 ) ) ( not ( = ?auto_86515 ?auto_86517 ) ) ( not ( = ?auto_86515 ?auto_86518 ) ) ( not ( = ?auto_86515 ?auto_86519 ) ) ( not ( = ?auto_86515 ?auto_86520 ) ) ( not ( = ?auto_86516 ?auto_86517 ) ) ( not ( = ?auto_86516 ?auto_86518 ) ) ( not ( = ?auto_86516 ?auto_86519 ) ) ( not ( = ?auto_86516 ?auto_86520 ) ) ( not ( = ?auto_86517 ?auto_86518 ) ) ( not ( = ?auto_86517 ?auto_86519 ) ) ( not ( = ?auto_86517 ?auto_86520 ) ) ( not ( = ?auto_86518 ?auto_86519 ) ) ( not ( = ?auto_86518 ?auto_86520 ) ) ( not ( = ?auto_86519 ?auto_86520 ) ) ( ON ?auto_86518 ?auto_86519 ) ( ON ?auto_86517 ?auto_86518 ) ( CLEAR ?auto_86515 ) ( ON ?auto_86516 ?auto_86517 ) ( CLEAR ?auto_86516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86510 ?auto_86511 ?auto_86512 ?auto_86513 ?auto_86514 ?auto_86515 ?auto_86516 )
      ( MAKE-10PILE ?auto_86510 ?auto_86511 ?auto_86512 ?auto_86513 ?auto_86514 ?auto_86515 ?auto_86516 ?auto_86517 ?auto_86518 ?auto_86519 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86531 - BLOCK
      ?auto_86532 - BLOCK
      ?auto_86533 - BLOCK
      ?auto_86534 - BLOCK
      ?auto_86535 - BLOCK
      ?auto_86536 - BLOCK
      ?auto_86537 - BLOCK
      ?auto_86538 - BLOCK
      ?auto_86539 - BLOCK
      ?auto_86540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86540 ) ( ON-TABLE ?auto_86531 ) ( ON ?auto_86532 ?auto_86531 ) ( ON ?auto_86533 ?auto_86532 ) ( ON ?auto_86534 ?auto_86533 ) ( ON ?auto_86535 ?auto_86534 ) ( ON ?auto_86536 ?auto_86535 ) ( not ( = ?auto_86531 ?auto_86532 ) ) ( not ( = ?auto_86531 ?auto_86533 ) ) ( not ( = ?auto_86531 ?auto_86534 ) ) ( not ( = ?auto_86531 ?auto_86535 ) ) ( not ( = ?auto_86531 ?auto_86536 ) ) ( not ( = ?auto_86531 ?auto_86537 ) ) ( not ( = ?auto_86531 ?auto_86538 ) ) ( not ( = ?auto_86531 ?auto_86539 ) ) ( not ( = ?auto_86531 ?auto_86540 ) ) ( not ( = ?auto_86532 ?auto_86533 ) ) ( not ( = ?auto_86532 ?auto_86534 ) ) ( not ( = ?auto_86532 ?auto_86535 ) ) ( not ( = ?auto_86532 ?auto_86536 ) ) ( not ( = ?auto_86532 ?auto_86537 ) ) ( not ( = ?auto_86532 ?auto_86538 ) ) ( not ( = ?auto_86532 ?auto_86539 ) ) ( not ( = ?auto_86532 ?auto_86540 ) ) ( not ( = ?auto_86533 ?auto_86534 ) ) ( not ( = ?auto_86533 ?auto_86535 ) ) ( not ( = ?auto_86533 ?auto_86536 ) ) ( not ( = ?auto_86533 ?auto_86537 ) ) ( not ( = ?auto_86533 ?auto_86538 ) ) ( not ( = ?auto_86533 ?auto_86539 ) ) ( not ( = ?auto_86533 ?auto_86540 ) ) ( not ( = ?auto_86534 ?auto_86535 ) ) ( not ( = ?auto_86534 ?auto_86536 ) ) ( not ( = ?auto_86534 ?auto_86537 ) ) ( not ( = ?auto_86534 ?auto_86538 ) ) ( not ( = ?auto_86534 ?auto_86539 ) ) ( not ( = ?auto_86534 ?auto_86540 ) ) ( not ( = ?auto_86535 ?auto_86536 ) ) ( not ( = ?auto_86535 ?auto_86537 ) ) ( not ( = ?auto_86535 ?auto_86538 ) ) ( not ( = ?auto_86535 ?auto_86539 ) ) ( not ( = ?auto_86535 ?auto_86540 ) ) ( not ( = ?auto_86536 ?auto_86537 ) ) ( not ( = ?auto_86536 ?auto_86538 ) ) ( not ( = ?auto_86536 ?auto_86539 ) ) ( not ( = ?auto_86536 ?auto_86540 ) ) ( not ( = ?auto_86537 ?auto_86538 ) ) ( not ( = ?auto_86537 ?auto_86539 ) ) ( not ( = ?auto_86537 ?auto_86540 ) ) ( not ( = ?auto_86538 ?auto_86539 ) ) ( not ( = ?auto_86538 ?auto_86540 ) ) ( not ( = ?auto_86539 ?auto_86540 ) ) ( ON ?auto_86539 ?auto_86540 ) ( ON ?auto_86538 ?auto_86539 ) ( CLEAR ?auto_86536 ) ( ON ?auto_86537 ?auto_86538 ) ( CLEAR ?auto_86537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86531 ?auto_86532 ?auto_86533 ?auto_86534 ?auto_86535 ?auto_86536 ?auto_86537 )
      ( MAKE-10PILE ?auto_86531 ?auto_86532 ?auto_86533 ?auto_86534 ?auto_86535 ?auto_86536 ?auto_86537 ?auto_86538 ?auto_86539 ?auto_86540 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86551 - BLOCK
      ?auto_86552 - BLOCK
      ?auto_86553 - BLOCK
      ?auto_86554 - BLOCK
      ?auto_86555 - BLOCK
      ?auto_86556 - BLOCK
      ?auto_86557 - BLOCK
      ?auto_86558 - BLOCK
      ?auto_86559 - BLOCK
      ?auto_86560 - BLOCK
    )
    :vars
    (
      ?auto_86561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86560 ?auto_86561 ) ( ON-TABLE ?auto_86551 ) ( ON ?auto_86552 ?auto_86551 ) ( ON ?auto_86553 ?auto_86552 ) ( ON ?auto_86554 ?auto_86553 ) ( ON ?auto_86555 ?auto_86554 ) ( not ( = ?auto_86551 ?auto_86552 ) ) ( not ( = ?auto_86551 ?auto_86553 ) ) ( not ( = ?auto_86551 ?auto_86554 ) ) ( not ( = ?auto_86551 ?auto_86555 ) ) ( not ( = ?auto_86551 ?auto_86556 ) ) ( not ( = ?auto_86551 ?auto_86557 ) ) ( not ( = ?auto_86551 ?auto_86558 ) ) ( not ( = ?auto_86551 ?auto_86559 ) ) ( not ( = ?auto_86551 ?auto_86560 ) ) ( not ( = ?auto_86551 ?auto_86561 ) ) ( not ( = ?auto_86552 ?auto_86553 ) ) ( not ( = ?auto_86552 ?auto_86554 ) ) ( not ( = ?auto_86552 ?auto_86555 ) ) ( not ( = ?auto_86552 ?auto_86556 ) ) ( not ( = ?auto_86552 ?auto_86557 ) ) ( not ( = ?auto_86552 ?auto_86558 ) ) ( not ( = ?auto_86552 ?auto_86559 ) ) ( not ( = ?auto_86552 ?auto_86560 ) ) ( not ( = ?auto_86552 ?auto_86561 ) ) ( not ( = ?auto_86553 ?auto_86554 ) ) ( not ( = ?auto_86553 ?auto_86555 ) ) ( not ( = ?auto_86553 ?auto_86556 ) ) ( not ( = ?auto_86553 ?auto_86557 ) ) ( not ( = ?auto_86553 ?auto_86558 ) ) ( not ( = ?auto_86553 ?auto_86559 ) ) ( not ( = ?auto_86553 ?auto_86560 ) ) ( not ( = ?auto_86553 ?auto_86561 ) ) ( not ( = ?auto_86554 ?auto_86555 ) ) ( not ( = ?auto_86554 ?auto_86556 ) ) ( not ( = ?auto_86554 ?auto_86557 ) ) ( not ( = ?auto_86554 ?auto_86558 ) ) ( not ( = ?auto_86554 ?auto_86559 ) ) ( not ( = ?auto_86554 ?auto_86560 ) ) ( not ( = ?auto_86554 ?auto_86561 ) ) ( not ( = ?auto_86555 ?auto_86556 ) ) ( not ( = ?auto_86555 ?auto_86557 ) ) ( not ( = ?auto_86555 ?auto_86558 ) ) ( not ( = ?auto_86555 ?auto_86559 ) ) ( not ( = ?auto_86555 ?auto_86560 ) ) ( not ( = ?auto_86555 ?auto_86561 ) ) ( not ( = ?auto_86556 ?auto_86557 ) ) ( not ( = ?auto_86556 ?auto_86558 ) ) ( not ( = ?auto_86556 ?auto_86559 ) ) ( not ( = ?auto_86556 ?auto_86560 ) ) ( not ( = ?auto_86556 ?auto_86561 ) ) ( not ( = ?auto_86557 ?auto_86558 ) ) ( not ( = ?auto_86557 ?auto_86559 ) ) ( not ( = ?auto_86557 ?auto_86560 ) ) ( not ( = ?auto_86557 ?auto_86561 ) ) ( not ( = ?auto_86558 ?auto_86559 ) ) ( not ( = ?auto_86558 ?auto_86560 ) ) ( not ( = ?auto_86558 ?auto_86561 ) ) ( not ( = ?auto_86559 ?auto_86560 ) ) ( not ( = ?auto_86559 ?auto_86561 ) ) ( not ( = ?auto_86560 ?auto_86561 ) ) ( ON ?auto_86559 ?auto_86560 ) ( ON ?auto_86558 ?auto_86559 ) ( ON ?auto_86557 ?auto_86558 ) ( CLEAR ?auto_86555 ) ( ON ?auto_86556 ?auto_86557 ) ( CLEAR ?auto_86556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86551 ?auto_86552 ?auto_86553 ?auto_86554 ?auto_86555 ?auto_86556 )
      ( MAKE-10PILE ?auto_86551 ?auto_86552 ?auto_86553 ?auto_86554 ?auto_86555 ?auto_86556 ?auto_86557 ?auto_86558 ?auto_86559 ?auto_86560 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86572 - BLOCK
      ?auto_86573 - BLOCK
      ?auto_86574 - BLOCK
      ?auto_86575 - BLOCK
      ?auto_86576 - BLOCK
      ?auto_86577 - BLOCK
      ?auto_86578 - BLOCK
      ?auto_86579 - BLOCK
      ?auto_86580 - BLOCK
      ?auto_86581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86581 ) ( ON-TABLE ?auto_86572 ) ( ON ?auto_86573 ?auto_86572 ) ( ON ?auto_86574 ?auto_86573 ) ( ON ?auto_86575 ?auto_86574 ) ( ON ?auto_86576 ?auto_86575 ) ( not ( = ?auto_86572 ?auto_86573 ) ) ( not ( = ?auto_86572 ?auto_86574 ) ) ( not ( = ?auto_86572 ?auto_86575 ) ) ( not ( = ?auto_86572 ?auto_86576 ) ) ( not ( = ?auto_86572 ?auto_86577 ) ) ( not ( = ?auto_86572 ?auto_86578 ) ) ( not ( = ?auto_86572 ?auto_86579 ) ) ( not ( = ?auto_86572 ?auto_86580 ) ) ( not ( = ?auto_86572 ?auto_86581 ) ) ( not ( = ?auto_86573 ?auto_86574 ) ) ( not ( = ?auto_86573 ?auto_86575 ) ) ( not ( = ?auto_86573 ?auto_86576 ) ) ( not ( = ?auto_86573 ?auto_86577 ) ) ( not ( = ?auto_86573 ?auto_86578 ) ) ( not ( = ?auto_86573 ?auto_86579 ) ) ( not ( = ?auto_86573 ?auto_86580 ) ) ( not ( = ?auto_86573 ?auto_86581 ) ) ( not ( = ?auto_86574 ?auto_86575 ) ) ( not ( = ?auto_86574 ?auto_86576 ) ) ( not ( = ?auto_86574 ?auto_86577 ) ) ( not ( = ?auto_86574 ?auto_86578 ) ) ( not ( = ?auto_86574 ?auto_86579 ) ) ( not ( = ?auto_86574 ?auto_86580 ) ) ( not ( = ?auto_86574 ?auto_86581 ) ) ( not ( = ?auto_86575 ?auto_86576 ) ) ( not ( = ?auto_86575 ?auto_86577 ) ) ( not ( = ?auto_86575 ?auto_86578 ) ) ( not ( = ?auto_86575 ?auto_86579 ) ) ( not ( = ?auto_86575 ?auto_86580 ) ) ( not ( = ?auto_86575 ?auto_86581 ) ) ( not ( = ?auto_86576 ?auto_86577 ) ) ( not ( = ?auto_86576 ?auto_86578 ) ) ( not ( = ?auto_86576 ?auto_86579 ) ) ( not ( = ?auto_86576 ?auto_86580 ) ) ( not ( = ?auto_86576 ?auto_86581 ) ) ( not ( = ?auto_86577 ?auto_86578 ) ) ( not ( = ?auto_86577 ?auto_86579 ) ) ( not ( = ?auto_86577 ?auto_86580 ) ) ( not ( = ?auto_86577 ?auto_86581 ) ) ( not ( = ?auto_86578 ?auto_86579 ) ) ( not ( = ?auto_86578 ?auto_86580 ) ) ( not ( = ?auto_86578 ?auto_86581 ) ) ( not ( = ?auto_86579 ?auto_86580 ) ) ( not ( = ?auto_86579 ?auto_86581 ) ) ( not ( = ?auto_86580 ?auto_86581 ) ) ( ON ?auto_86580 ?auto_86581 ) ( ON ?auto_86579 ?auto_86580 ) ( ON ?auto_86578 ?auto_86579 ) ( CLEAR ?auto_86576 ) ( ON ?auto_86577 ?auto_86578 ) ( CLEAR ?auto_86577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86572 ?auto_86573 ?auto_86574 ?auto_86575 ?auto_86576 ?auto_86577 )
      ( MAKE-10PILE ?auto_86572 ?auto_86573 ?auto_86574 ?auto_86575 ?auto_86576 ?auto_86577 ?auto_86578 ?auto_86579 ?auto_86580 ?auto_86581 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86592 - BLOCK
      ?auto_86593 - BLOCK
      ?auto_86594 - BLOCK
      ?auto_86595 - BLOCK
      ?auto_86596 - BLOCK
      ?auto_86597 - BLOCK
      ?auto_86598 - BLOCK
      ?auto_86599 - BLOCK
      ?auto_86600 - BLOCK
      ?auto_86601 - BLOCK
    )
    :vars
    (
      ?auto_86602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86601 ?auto_86602 ) ( ON-TABLE ?auto_86592 ) ( ON ?auto_86593 ?auto_86592 ) ( ON ?auto_86594 ?auto_86593 ) ( ON ?auto_86595 ?auto_86594 ) ( not ( = ?auto_86592 ?auto_86593 ) ) ( not ( = ?auto_86592 ?auto_86594 ) ) ( not ( = ?auto_86592 ?auto_86595 ) ) ( not ( = ?auto_86592 ?auto_86596 ) ) ( not ( = ?auto_86592 ?auto_86597 ) ) ( not ( = ?auto_86592 ?auto_86598 ) ) ( not ( = ?auto_86592 ?auto_86599 ) ) ( not ( = ?auto_86592 ?auto_86600 ) ) ( not ( = ?auto_86592 ?auto_86601 ) ) ( not ( = ?auto_86592 ?auto_86602 ) ) ( not ( = ?auto_86593 ?auto_86594 ) ) ( not ( = ?auto_86593 ?auto_86595 ) ) ( not ( = ?auto_86593 ?auto_86596 ) ) ( not ( = ?auto_86593 ?auto_86597 ) ) ( not ( = ?auto_86593 ?auto_86598 ) ) ( not ( = ?auto_86593 ?auto_86599 ) ) ( not ( = ?auto_86593 ?auto_86600 ) ) ( not ( = ?auto_86593 ?auto_86601 ) ) ( not ( = ?auto_86593 ?auto_86602 ) ) ( not ( = ?auto_86594 ?auto_86595 ) ) ( not ( = ?auto_86594 ?auto_86596 ) ) ( not ( = ?auto_86594 ?auto_86597 ) ) ( not ( = ?auto_86594 ?auto_86598 ) ) ( not ( = ?auto_86594 ?auto_86599 ) ) ( not ( = ?auto_86594 ?auto_86600 ) ) ( not ( = ?auto_86594 ?auto_86601 ) ) ( not ( = ?auto_86594 ?auto_86602 ) ) ( not ( = ?auto_86595 ?auto_86596 ) ) ( not ( = ?auto_86595 ?auto_86597 ) ) ( not ( = ?auto_86595 ?auto_86598 ) ) ( not ( = ?auto_86595 ?auto_86599 ) ) ( not ( = ?auto_86595 ?auto_86600 ) ) ( not ( = ?auto_86595 ?auto_86601 ) ) ( not ( = ?auto_86595 ?auto_86602 ) ) ( not ( = ?auto_86596 ?auto_86597 ) ) ( not ( = ?auto_86596 ?auto_86598 ) ) ( not ( = ?auto_86596 ?auto_86599 ) ) ( not ( = ?auto_86596 ?auto_86600 ) ) ( not ( = ?auto_86596 ?auto_86601 ) ) ( not ( = ?auto_86596 ?auto_86602 ) ) ( not ( = ?auto_86597 ?auto_86598 ) ) ( not ( = ?auto_86597 ?auto_86599 ) ) ( not ( = ?auto_86597 ?auto_86600 ) ) ( not ( = ?auto_86597 ?auto_86601 ) ) ( not ( = ?auto_86597 ?auto_86602 ) ) ( not ( = ?auto_86598 ?auto_86599 ) ) ( not ( = ?auto_86598 ?auto_86600 ) ) ( not ( = ?auto_86598 ?auto_86601 ) ) ( not ( = ?auto_86598 ?auto_86602 ) ) ( not ( = ?auto_86599 ?auto_86600 ) ) ( not ( = ?auto_86599 ?auto_86601 ) ) ( not ( = ?auto_86599 ?auto_86602 ) ) ( not ( = ?auto_86600 ?auto_86601 ) ) ( not ( = ?auto_86600 ?auto_86602 ) ) ( not ( = ?auto_86601 ?auto_86602 ) ) ( ON ?auto_86600 ?auto_86601 ) ( ON ?auto_86599 ?auto_86600 ) ( ON ?auto_86598 ?auto_86599 ) ( ON ?auto_86597 ?auto_86598 ) ( CLEAR ?auto_86595 ) ( ON ?auto_86596 ?auto_86597 ) ( CLEAR ?auto_86596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86592 ?auto_86593 ?auto_86594 ?auto_86595 ?auto_86596 )
      ( MAKE-10PILE ?auto_86592 ?auto_86593 ?auto_86594 ?auto_86595 ?auto_86596 ?auto_86597 ?auto_86598 ?auto_86599 ?auto_86600 ?auto_86601 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86613 - BLOCK
      ?auto_86614 - BLOCK
      ?auto_86615 - BLOCK
      ?auto_86616 - BLOCK
      ?auto_86617 - BLOCK
      ?auto_86618 - BLOCK
      ?auto_86619 - BLOCK
      ?auto_86620 - BLOCK
      ?auto_86621 - BLOCK
      ?auto_86622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86622 ) ( ON-TABLE ?auto_86613 ) ( ON ?auto_86614 ?auto_86613 ) ( ON ?auto_86615 ?auto_86614 ) ( ON ?auto_86616 ?auto_86615 ) ( not ( = ?auto_86613 ?auto_86614 ) ) ( not ( = ?auto_86613 ?auto_86615 ) ) ( not ( = ?auto_86613 ?auto_86616 ) ) ( not ( = ?auto_86613 ?auto_86617 ) ) ( not ( = ?auto_86613 ?auto_86618 ) ) ( not ( = ?auto_86613 ?auto_86619 ) ) ( not ( = ?auto_86613 ?auto_86620 ) ) ( not ( = ?auto_86613 ?auto_86621 ) ) ( not ( = ?auto_86613 ?auto_86622 ) ) ( not ( = ?auto_86614 ?auto_86615 ) ) ( not ( = ?auto_86614 ?auto_86616 ) ) ( not ( = ?auto_86614 ?auto_86617 ) ) ( not ( = ?auto_86614 ?auto_86618 ) ) ( not ( = ?auto_86614 ?auto_86619 ) ) ( not ( = ?auto_86614 ?auto_86620 ) ) ( not ( = ?auto_86614 ?auto_86621 ) ) ( not ( = ?auto_86614 ?auto_86622 ) ) ( not ( = ?auto_86615 ?auto_86616 ) ) ( not ( = ?auto_86615 ?auto_86617 ) ) ( not ( = ?auto_86615 ?auto_86618 ) ) ( not ( = ?auto_86615 ?auto_86619 ) ) ( not ( = ?auto_86615 ?auto_86620 ) ) ( not ( = ?auto_86615 ?auto_86621 ) ) ( not ( = ?auto_86615 ?auto_86622 ) ) ( not ( = ?auto_86616 ?auto_86617 ) ) ( not ( = ?auto_86616 ?auto_86618 ) ) ( not ( = ?auto_86616 ?auto_86619 ) ) ( not ( = ?auto_86616 ?auto_86620 ) ) ( not ( = ?auto_86616 ?auto_86621 ) ) ( not ( = ?auto_86616 ?auto_86622 ) ) ( not ( = ?auto_86617 ?auto_86618 ) ) ( not ( = ?auto_86617 ?auto_86619 ) ) ( not ( = ?auto_86617 ?auto_86620 ) ) ( not ( = ?auto_86617 ?auto_86621 ) ) ( not ( = ?auto_86617 ?auto_86622 ) ) ( not ( = ?auto_86618 ?auto_86619 ) ) ( not ( = ?auto_86618 ?auto_86620 ) ) ( not ( = ?auto_86618 ?auto_86621 ) ) ( not ( = ?auto_86618 ?auto_86622 ) ) ( not ( = ?auto_86619 ?auto_86620 ) ) ( not ( = ?auto_86619 ?auto_86621 ) ) ( not ( = ?auto_86619 ?auto_86622 ) ) ( not ( = ?auto_86620 ?auto_86621 ) ) ( not ( = ?auto_86620 ?auto_86622 ) ) ( not ( = ?auto_86621 ?auto_86622 ) ) ( ON ?auto_86621 ?auto_86622 ) ( ON ?auto_86620 ?auto_86621 ) ( ON ?auto_86619 ?auto_86620 ) ( ON ?auto_86618 ?auto_86619 ) ( CLEAR ?auto_86616 ) ( ON ?auto_86617 ?auto_86618 ) ( CLEAR ?auto_86617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86613 ?auto_86614 ?auto_86615 ?auto_86616 ?auto_86617 )
      ( MAKE-10PILE ?auto_86613 ?auto_86614 ?auto_86615 ?auto_86616 ?auto_86617 ?auto_86618 ?auto_86619 ?auto_86620 ?auto_86621 ?auto_86622 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86633 - BLOCK
      ?auto_86634 - BLOCK
      ?auto_86635 - BLOCK
      ?auto_86636 - BLOCK
      ?auto_86637 - BLOCK
      ?auto_86638 - BLOCK
      ?auto_86639 - BLOCK
      ?auto_86640 - BLOCK
      ?auto_86641 - BLOCK
      ?auto_86642 - BLOCK
    )
    :vars
    (
      ?auto_86643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86642 ?auto_86643 ) ( ON-TABLE ?auto_86633 ) ( ON ?auto_86634 ?auto_86633 ) ( ON ?auto_86635 ?auto_86634 ) ( not ( = ?auto_86633 ?auto_86634 ) ) ( not ( = ?auto_86633 ?auto_86635 ) ) ( not ( = ?auto_86633 ?auto_86636 ) ) ( not ( = ?auto_86633 ?auto_86637 ) ) ( not ( = ?auto_86633 ?auto_86638 ) ) ( not ( = ?auto_86633 ?auto_86639 ) ) ( not ( = ?auto_86633 ?auto_86640 ) ) ( not ( = ?auto_86633 ?auto_86641 ) ) ( not ( = ?auto_86633 ?auto_86642 ) ) ( not ( = ?auto_86633 ?auto_86643 ) ) ( not ( = ?auto_86634 ?auto_86635 ) ) ( not ( = ?auto_86634 ?auto_86636 ) ) ( not ( = ?auto_86634 ?auto_86637 ) ) ( not ( = ?auto_86634 ?auto_86638 ) ) ( not ( = ?auto_86634 ?auto_86639 ) ) ( not ( = ?auto_86634 ?auto_86640 ) ) ( not ( = ?auto_86634 ?auto_86641 ) ) ( not ( = ?auto_86634 ?auto_86642 ) ) ( not ( = ?auto_86634 ?auto_86643 ) ) ( not ( = ?auto_86635 ?auto_86636 ) ) ( not ( = ?auto_86635 ?auto_86637 ) ) ( not ( = ?auto_86635 ?auto_86638 ) ) ( not ( = ?auto_86635 ?auto_86639 ) ) ( not ( = ?auto_86635 ?auto_86640 ) ) ( not ( = ?auto_86635 ?auto_86641 ) ) ( not ( = ?auto_86635 ?auto_86642 ) ) ( not ( = ?auto_86635 ?auto_86643 ) ) ( not ( = ?auto_86636 ?auto_86637 ) ) ( not ( = ?auto_86636 ?auto_86638 ) ) ( not ( = ?auto_86636 ?auto_86639 ) ) ( not ( = ?auto_86636 ?auto_86640 ) ) ( not ( = ?auto_86636 ?auto_86641 ) ) ( not ( = ?auto_86636 ?auto_86642 ) ) ( not ( = ?auto_86636 ?auto_86643 ) ) ( not ( = ?auto_86637 ?auto_86638 ) ) ( not ( = ?auto_86637 ?auto_86639 ) ) ( not ( = ?auto_86637 ?auto_86640 ) ) ( not ( = ?auto_86637 ?auto_86641 ) ) ( not ( = ?auto_86637 ?auto_86642 ) ) ( not ( = ?auto_86637 ?auto_86643 ) ) ( not ( = ?auto_86638 ?auto_86639 ) ) ( not ( = ?auto_86638 ?auto_86640 ) ) ( not ( = ?auto_86638 ?auto_86641 ) ) ( not ( = ?auto_86638 ?auto_86642 ) ) ( not ( = ?auto_86638 ?auto_86643 ) ) ( not ( = ?auto_86639 ?auto_86640 ) ) ( not ( = ?auto_86639 ?auto_86641 ) ) ( not ( = ?auto_86639 ?auto_86642 ) ) ( not ( = ?auto_86639 ?auto_86643 ) ) ( not ( = ?auto_86640 ?auto_86641 ) ) ( not ( = ?auto_86640 ?auto_86642 ) ) ( not ( = ?auto_86640 ?auto_86643 ) ) ( not ( = ?auto_86641 ?auto_86642 ) ) ( not ( = ?auto_86641 ?auto_86643 ) ) ( not ( = ?auto_86642 ?auto_86643 ) ) ( ON ?auto_86641 ?auto_86642 ) ( ON ?auto_86640 ?auto_86641 ) ( ON ?auto_86639 ?auto_86640 ) ( ON ?auto_86638 ?auto_86639 ) ( ON ?auto_86637 ?auto_86638 ) ( CLEAR ?auto_86635 ) ( ON ?auto_86636 ?auto_86637 ) ( CLEAR ?auto_86636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86633 ?auto_86634 ?auto_86635 ?auto_86636 )
      ( MAKE-10PILE ?auto_86633 ?auto_86634 ?auto_86635 ?auto_86636 ?auto_86637 ?auto_86638 ?auto_86639 ?auto_86640 ?auto_86641 ?auto_86642 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86654 - BLOCK
      ?auto_86655 - BLOCK
      ?auto_86656 - BLOCK
      ?auto_86657 - BLOCK
      ?auto_86658 - BLOCK
      ?auto_86659 - BLOCK
      ?auto_86660 - BLOCK
      ?auto_86661 - BLOCK
      ?auto_86662 - BLOCK
      ?auto_86663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86663 ) ( ON-TABLE ?auto_86654 ) ( ON ?auto_86655 ?auto_86654 ) ( ON ?auto_86656 ?auto_86655 ) ( not ( = ?auto_86654 ?auto_86655 ) ) ( not ( = ?auto_86654 ?auto_86656 ) ) ( not ( = ?auto_86654 ?auto_86657 ) ) ( not ( = ?auto_86654 ?auto_86658 ) ) ( not ( = ?auto_86654 ?auto_86659 ) ) ( not ( = ?auto_86654 ?auto_86660 ) ) ( not ( = ?auto_86654 ?auto_86661 ) ) ( not ( = ?auto_86654 ?auto_86662 ) ) ( not ( = ?auto_86654 ?auto_86663 ) ) ( not ( = ?auto_86655 ?auto_86656 ) ) ( not ( = ?auto_86655 ?auto_86657 ) ) ( not ( = ?auto_86655 ?auto_86658 ) ) ( not ( = ?auto_86655 ?auto_86659 ) ) ( not ( = ?auto_86655 ?auto_86660 ) ) ( not ( = ?auto_86655 ?auto_86661 ) ) ( not ( = ?auto_86655 ?auto_86662 ) ) ( not ( = ?auto_86655 ?auto_86663 ) ) ( not ( = ?auto_86656 ?auto_86657 ) ) ( not ( = ?auto_86656 ?auto_86658 ) ) ( not ( = ?auto_86656 ?auto_86659 ) ) ( not ( = ?auto_86656 ?auto_86660 ) ) ( not ( = ?auto_86656 ?auto_86661 ) ) ( not ( = ?auto_86656 ?auto_86662 ) ) ( not ( = ?auto_86656 ?auto_86663 ) ) ( not ( = ?auto_86657 ?auto_86658 ) ) ( not ( = ?auto_86657 ?auto_86659 ) ) ( not ( = ?auto_86657 ?auto_86660 ) ) ( not ( = ?auto_86657 ?auto_86661 ) ) ( not ( = ?auto_86657 ?auto_86662 ) ) ( not ( = ?auto_86657 ?auto_86663 ) ) ( not ( = ?auto_86658 ?auto_86659 ) ) ( not ( = ?auto_86658 ?auto_86660 ) ) ( not ( = ?auto_86658 ?auto_86661 ) ) ( not ( = ?auto_86658 ?auto_86662 ) ) ( not ( = ?auto_86658 ?auto_86663 ) ) ( not ( = ?auto_86659 ?auto_86660 ) ) ( not ( = ?auto_86659 ?auto_86661 ) ) ( not ( = ?auto_86659 ?auto_86662 ) ) ( not ( = ?auto_86659 ?auto_86663 ) ) ( not ( = ?auto_86660 ?auto_86661 ) ) ( not ( = ?auto_86660 ?auto_86662 ) ) ( not ( = ?auto_86660 ?auto_86663 ) ) ( not ( = ?auto_86661 ?auto_86662 ) ) ( not ( = ?auto_86661 ?auto_86663 ) ) ( not ( = ?auto_86662 ?auto_86663 ) ) ( ON ?auto_86662 ?auto_86663 ) ( ON ?auto_86661 ?auto_86662 ) ( ON ?auto_86660 ?auto_86661 ) ( ON ?auto_86659 ?auto_86660 ) ( ON ?auto_86658 ?auto_86659 ) ( CLEAR ?auto_86656 ) ( ON ?auto_86657 ?auto_86658 ) ( CLEAR ?auto_86657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86654 ?auto_86655 ?auto_86656 ?auto_86657 )
      ( MAKE-10PILE ?auto_86654 ?auto_86655 ?auto_86656 ?auto_86657 ?auto_86658 ?auto_86659 ?auto_86660 ?auto_86661 ?auto_86662 ?auto_86663 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86674 - BLOCK
      ?auto_86675 - BLOCK
      ?auto_86676 - BLOCK
      ?auto_86677 - BLOCK
      ?auto_86678 - BLOCK
      ?auto_86679 - BLOCK
      ?auto_86680 - BLOCK
      ?auto_86681 - BLOCK
      ?auto_86682 - BLOCK
      ?auto_86683 - BLOCK
    )
    :vars
    (
      ?auto_86684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86683 ?auto_86684 ) ( ON-TABLE ?auto_86674 ) ( ON ?auto_86675 ?auto_86674 ) ( not ( = ?auto_86674 ?auto_86675 ) ) ( not ( = ?auto_86674 ?auto_86676 ) ) ( not ( = ?auto_86674 ?auto_86677 ) ) ( not ( = ?auto_86674 ?auto_86678 ) ) ( not ( = ?auto_86674 ?auto_86679 ) ) ( not ( = ?auto_86674 ?auto_86680 ) ) ( not ( = ?auto_86674 ?auto_86681 ) ) ( not ( = ?auto_86674 ?auto_86682 ) ) ( not ( = ?auto_86674 ?auto_86683 ) ) ( not ( = ?auto_86674 ?auto_86684 ) ) ( not ( = ?auto_86675 ?auto_86676 ) ) ( not ( = ?auto_86675 ?auto_86677 ) ) ( not ( = ?auto_86675 ?auto_86678 ) ) ( not ( = ?auto_86675 ?auto_86679 ) ) ( not ( = ?auto_86675 ?auto_86680 ) ) ( not ( = ?auto_86675 ?auto_86681 ) ) ( not ( = ?auto_86675 ?auto_86682 ) ) ( not ( = ?auto_86675 ?auto_86683 ) ) ( not ( = ?auto_86675 ?auto_86684 ) ) ( not ( = ?auto_86676 ?auto_86677 ) ) ( not ( = ?auto_86676 ?auto_86678 ) ) ( not ( = ?auto_86676 ?auto_86679 ) ) ( not ( = ?auto_86676 ?auto_86680 ) ) ( not ( = ?auto_86676 ?auto_86681 ) ) ( not ( = ?auto_86676 ?auto_86682 ) ) ( not ( = ?auto_86676 ?auto_86683 ) ) ( not ( = ?auto_86676 ?auto_86684 ) ) ( not ( = ?auto_86677 ?auto_86678 ) ) ( not ( = ?auto_86677 ?auto_86679 ) ) ( not ( = ?auto_86677 ?auto_86680 ) ) ( not ( = ?auto_86677 ?auto_86681 ) ) ( not ( = ?auto_86677 ?auto_86682 ) ) ( not ( = ?auto_86677 ?auto_86683 ) ) ( not ( = ?auto_86677 ?auto_86684 ) ) ( not ( = ?auto_86678 ?auto_86679 ) ) ( not ( = ?auto_86678 ?auto_86680 ) ) ( not ( = ?auto_86678 ?auto_86681 ) ) ( not ( = ?auto_86678 ?auto_86682 ) ) ( not ( = ?auto_86678 ?auto_86683 ) ) ( not ( = ?auto_86678 ?auto_86684 ) ) ( not ( = ?auto_86679 ?auto_86680 ) ) ( not ( = ?auto_86679 ?auto_86681 ) ) ( not ( = ?auto_86679 ?auto_86682 ) ) ( not ( = ?auto_86679 ?auto_86683 ) ) ( not ( = ?auto_86679 ?auto_86684 ) ) ( not ( = ?auto_86680 ?auto_86681 ) ) ( not ( = ?auto_86680 ?auto_86682 ) ) ( not ( = ?auto_86680 ?auto_86683 ) ) ( not ( = ?auto_86680 ?auto_86684 ) ) ( not ( = ?auto_86681 ?auto_86682 ) ) ( not ( = ?auto_86681 ?auto_86683 ) ) ( not ( = ?auto_86681 ?auto_86684 ) ) ( not ( = ?auto_86682 ?auto_86683 ) ) ( not ( = ?auto_86682 ?auto_86684 ) ) ( not ( = ?auto_86683 ?auto_86684 ) ) ( ON ?auto_86682 ?auto_86683 ) ( ON ?auto_86681 ?auto_86682 ) ( ON ?auto_86680 ?auto_86681 ) ( ON ?auto_86679 ?auto_86680 ) ( ON ?auto_86678 ?auto_86679 ) ( ON ?auto_86677 ?auto_86678 ) ( CLEAR ?auto_86675 ) ( ON ?auto_86676 ?auto_86677 ) ( CLEAR ?auto_86676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86674 ?auto_86675 ?auto_86676 )
      ( MAKE-10PILE ?auto_86674 ?auto_86675 ?auto_86676 ?auto_86677 ?auto_86678 ?auto_86679 ?auto_86680 ?auto_86681 ?auto_86682 ?auto_86683 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86695 - BLOCK
      ?auto_86696 - BLOCK
      ?auto_86697 - BLOCK
      ?auto_86698 - BLOCK
      ?auto_86699 - BLOCK
      ?auto_86700 - BLOCK
      ?auto_86701 - BLOCK
      ?auto_86702 - BLOCK
      ?auto_86703 - BLOCK
      ?auto_86704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86704 ) ( ON-TABLE ?auto_86695 ) ( ON ?auto_86696 ?auto_86695 ) ( not ( = ?auto_86695 ?auto_86696 ) ) ( not ( = ?auto_86695 ?auto_86697 ) ) ( not ( = ?auto_86695 ?auto_86698 ) ) ( not ( = ?auto_86695 ?auto_86699 ) ) ( not ( = ?auto_86695 ?auto_86700 ) ) ( not ( = ?auto_86695 ?auto_86701 ) ) ( not ( = ?auto_86695 ?auto_86702 ) ) ( not ( = ?auto_86695 ?auto_86703 ) ) ( not ( = ?auto_86695 ?auto_86704 ) ) ( not ( = ?auto_86696 ?auto_86697 ) ) ( not ( = ?auto_86696 ?auto_86698 ) ) ( not ( = ?auto_86696 ?auto_86699 ) ) ( not ( = ?auto_86696 ?auto_86700 ) ) ( not ( = ?auto_86696 ?auto_86701 ) ) ( not ( = ?auto_86696 ?auto_86702 ) ) ( not ( = ?auto_86696 ?auto_86703 ) ) ( not ( = ?auto_86696 ?auto_86704 ) ) ( not ( = ?auto_86697 ?auto_86698 ) ) ( not ( = ?auto_86697 ?auto_86699 ) ) ( not ( = ?auto_86697 ?auto_86700 ) ) ( not ( = ?auto_86697 ?auto_86701 ) ) ( not ( = ?auto_86697 ?auto_86702 ) ) ( not ( = ?auto_86697 ?auto_86703 ) ) ( not ( = ?auto_86697 ?auto_86704 ) ) ( not ( = ?auto_86698 ?auto_86699 ) ) ( not ( = ?auto_86698 ?auto_86700 ) ) ( not ( = ?auto_86698 ?auto_86701 ) ) ( not ( = ?auto_86698 ?auto_86702 ) ) ( not ( = ?auto_86698 ?auto_86703 ) ) ( not ( = ?auto_86698 ?auto_86704 ) ) ( not ( = ?auto_86699 ?auto_86700 ) ) ( not ( = ?auto_86699 ?auto_86701 ) ) ( not ( = ?auto_86699 ?auto_86702 ) ) ( not ( = ?auto_86699 ?auto_86703 ) ) ( not ( = ?auto_86699 ?auto_86704 ) ) ( not ( = ?auto_86700 ?auto_86701 ) ) ( not ( = ?auto_86700 ?auto_86702 ) ) ( not ( = ?auto_86700 ?auto_86703 ) ) ( not ( = ?auto_86700 ?auto_86704 ) ) ( not ( = ?auto_86701 ?auto_86702 ) ) ( not ( = ?auto_86701 ?auto_86703 ) ) ( not ( = ?auto_86701 ?auto_86704 ) ) ( not ( = ?auto_86702 ?auto_86703 ) ) ( not ( = ?auto_86702 ?auto_86704 ) ) ( not ( = ?auto_86703 ?auto_86704 ) ) ( ON ?auto_86703 ?auto_86704 ) ( ON ?auto_86702 ?auto_86703 ) ( ON ?auto_86701 ?auto_86702 ) ( ON ?auto_86700 ?auto_86701 ) ( ON ?auto_86699 ?auto_86700 ) ( ON ?auto_86698 ?auto_86699 ) ( CLEAR ?auto_86696 ) ( ON ?auto_86697 ?auto_86698 ) ( CLEAR ?auto_86697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86695 ?auto_86696 ?auto_86697 )
      ( MAKE-10PILE ?auto_86695 ?auto_86696 ?auto_86697 ?auto_86698 ?auto_86699 ?auto_86700 ?auto_86701 ?auto_86702 ?auto_86703 ?auto_86704 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86715 - BLOCK
      ?auto_86716 - BLOCK
      ?auto_86717 - BLOCK
      ?auto_86718 - BLOCK
      ?auto_86719 - BLOCK
      ?auto_86720 - BLOCK
      ?auto_86721 - BLOCK
      ?auto_86722 - BLOCK
      ?auto_86723 - BLOCK
      ?auto_86724 - BLOCK
    )
    :vars
    (
      ?auto_86725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86724 ?auto_86725 ) ( ON-TABLE ?auto_86715 ) ( not ( = ?auto_86715 ?auto_86716 ) ) ( not ( = ?auto_86715 ?auto_86717 ) ) ( not ( = ?auto_86715 ?auto_86718 ) ) ( not ( = ?auto_86715 ?auto_86719 ) ) ( not ( = ?auto_86715 ?auto_86720 ) ) ( not ( = ?auto_86715 ?auto_86721 ) ) ( not ( = ?auto_86715 ?auto_86722 ) ) ( not ( = ?auto_86715 ?auto_86723 ) ) ( not ( = ?auto_86715 ?auto_86724 ) ) ( not ( = ?auto_86715 ?auto_86725 ) ) ( not ( = ?auto_86716 ?auto_86717 ) ) ( not ( = ?auto_86716 ?auto_86718 ) ) ( not ( = ?auto_86716 ?auto_86719 ) ) ( not ( = ?auto_86716 ?auto_86720 ) ) ( not ( = ?auto_86716 ?auto_86721 ) ) ( not ( = ?auto_86716 ?auto_86722 ) ) ( not ( = ?auto_86716 ?auto_86723 ) ) ( not ( = ?auto_86716 ?auto_86724 ) ) ( not ( = ?auto_86716 ?auto_86725 ) ) ( not ( = ?auto_86717 ?auto_86718 ) ) ( not ( = ?auto_86717 ?auto_86719 ) ) ( not ( = ?auto_86717 ?auto_86720 ) ) ( not ( = ?auto_86717 ?auto_86721 ) ) ( not ( = ?auto_86717 ?auto_86722 ) ) ( not ( = ?auto_86717 ?auto_86723 ) ) ( not ( = ?auto_86717 ?auto_86724 ) ) ( not ( = ?auto_86717 ?auto_86725 ) ) ( not ( = ?auto_86718 ?auto_86719 ) ) ( not ( = ?auto_86718 ?auto_86720 ) ) ( not ( = ?auto_86718 ?auto_86721 ) ) ( not ( = ?auto_86718 ?auto_86722 ) ) ( not ( = ?auto_86718 ?auto_86723 ) ) ( not ( = ?auto_86718 ?auto_86724 ) ) ( not ( = ?auto_86718 ?auto_86725 ) ) ( not ( = ?auto_86719 ?auto_86720 ) ) ( not ( = ?auto_86719 ?auto_86721 ) ) ( not ( = ?auto_86719 ?auto_86722 ) ) ( not ( = ?auto_86719 ?auto_86723 ) ) ( not ( = ?auto_86719 ?auto_86724 ) ) ( not ( = ?auto_86719 ?auto_86725 ) ) ( not ( = ?auto_86720 ?auto_86721 ) ) ( not ( = ?auto_86720 ?auto_86722 ) ) ( not ( = ?auto_86720 ?auto_86723 ) ) ( not ( = ?auto_86720 ?auto_86724 ) ) ( not ( = ?auto_86720 ?auto_86725 ) ) ( not ( = ?auto_86721 ?auto_86722 ) ) ( not ( = ?auto_86721 ?auto_86723 ) ) ( not ( = ?auto_86721 ?auto_86724 ) ) ( not ( = ?auto_86721 ?auto_86725 ) ) ( not ( = ?auto_86722 ?auto_86723 ) ) ( not ( = ?auto_86722 ?auto_86724 ) ) ( not ( = ?auto_86722 ?auto_86725 ) ) ( not ( = ?auto_86723 ?auto_86724 ) ) ( not ( = ?auto_86723 ?auto_86725 ) ) ( not ( = ?auto_86724 ?auto_86725 ) ) ( ON ?auto_86723 ?auto_86724 ) ( ON ?auto_86722 ?auto_86723 ) ( ON ?auto_86721 ?auto_86722 ) ( ON ?auto_86720 ?auto_86721 ) ( ON ?auto_86719 ?auto_86720 ) ( ON ?auto_86718 ?auto_86719 ) ( ON ?auto_86717 ?auto_86718 ) ( CLEAR ?auto_86715 ) ( ON ?auto_86716 ?auto_86717 ) ( CLEAR ?auto_86716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86715 ?auto_86716 )
      ( MAKE-10PILE ?auto_86715 ?auto_86716 ?auto_86717 ?auto_86718 ?auto_86719 ?auto_86720 ?auto_86721 ?auto_86722 ?auto_86723 ?auto_86724 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86736 - BLOCK
      ?auto_86737 - BLOCK
      ?auto_86738 - BLOCK
      ?auto_86739 - BLOCK
      ?auto_86740 - BLOCK
      ?auto_86741 - BLOCK
      ?auto_86742 - BLOCK
      ?auto_86743 - BLOCK
      ?auto_86744 - BLOCK
      ?auto_86745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86745 ) ( ON-TABLE ?auto_86736 ) ( not ( = ?auto_86736 ?auto_86737 ) ) ( not ( = ?auto_86736 ?auto_86738 ) ) ( not ( = ?auto_86736 ?auto_86739 ) ) ( not ( = ?auto_86736 ?auto_86740 ) ) ( not ( = ?auto_86736 ?auto_86741 ) ) ( not ( = ?auto_86736 ?auto_86742 ) ) ( not ( = ?auto_86736 ?auto_86743 ) ) ( not ( = ?auto_86736 ?auto_86744 ) ) ( not ( = ?auto_86736 ?auto_86745 ) ) ( not ( = ?auto_86737 ?auto_86738 ) ) ( not ( = ?auto_86737 ?auto_86739 ) ) ( not ( = ?auto_86737 ?auto_86740 ) ) ( not ( = ?auto_86737 ?auto_86741 ) ) ( not ( = ?auto_86737 ?auto_86742 ) ) ( not ( = ?auto_86737 ?auto_86743 ) ) ( not ( = ?auto_86737 ?auto_86744 ) ) ( not ( = ?auto_86737 ?auto_86745 ) ) ( not ( = ?auto_86738 ?auto_86739 ) ) ( not ( = ?auto_86738 ?auto_86740 ) ) ( not ( = ?auto_86738 ?auto_86741 ) ) ( not ( = ?auto_86738 ?auto_86742 ) ) ( not ( = ?auto_86738 ?auto_86743 ) ) ( not ( = ?auto_86738 ?auto_86744 ) ) ( not ( = ?auto_86738 ?auto_86745 ) ) ( not ( = ?auto_86739 ?auto_86740 ) ) ( not ( = ?auto_86739 ?auto_86741 ) ) ( not ( = ?auto_86739 ?auto_86742 ) ) ( not ( = ?auto_86739 ?auto_86743 ) ) ( not ( = ?auto_86739 ?auto_86744 ) ) ( not ( = ?auto_86739 ?auto_86745 ) ) ( not ( = ?auto_86740 ?auto_86741 ) ) ( not ( = ?auto_86740 ?auto_86742 ) ) ( not ( = ?auto_86740 ?auto_86743 ) ) ( not ( = ?auto_86740 ?auto_86744 ) ) ( not ( = ?auto_86740 ?auto_86745 ) ) ( not ( = ?auto_86741 ?auto_86742 ) ) ( not ( = ?auto_86741 ?auto_86743 ) ) ( not ( = ?auto_86741 ?auto_86744 ) ) ( not ( = ?auto_86741 ?auto_86745 ) ) ( not ( = ?auto_86742 ?auto_86743 ) ) ( not ( = ?auto_86742 ?auto_86744 ) ) ( not ( = ?auto_86742 ?auto_86745 ) ) ( not ( = ?auto_86743 ?auto_86744 ) ) ( not ( = ?auto_86743 ?auto_86745 ) ) ( not ( = ?auto_86744 ?auto_86745 ) ) ( ON ?auto_86744 ?auto_86745 ) ( ON ?auto_86743 ?auto_86744 ) ( ON ?auto_86742 ?auto_86743 ) ( ON ?auto_86741 ?auto_86742 ) ( ON ?auto_86740 ?auto_86741 ) ( ON ?auto_86739 ?auto_86740 ) ( ON ?auto_86738 ?auto_86739 ) ( CLEAR ?auto_86736 ) ( ON ?auto_86737 ?auto_86738 ) ( CLEAR ?auto_86737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86736 ?auto_86737 )
      ( MAKE-10PILE ?auto_86736 ?auto_86737 ?auto_86738 ?auto_86739 ?auto_86740 ?auto_86741 ?auto_86742 ?auto_86743 ?auto_86744 ?auto_86745 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86756 - BLOCK
      ?auto_86757 - BLOCK
      ?auto_86758 - BLOCK
      ?auto_86759 - BLOCK
      ?auto_86760 - BLOCK
      ?auto_86761 - BLOCK
      ?auto_86762 - BLOCK
      ?auto_86763 - BLOCK
      ?auto_86764 - BLOCK
      ?auto_86765 - BLOCK
    )
    :vars
    (
      ?auto_86766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86765 ?auto_86766 ) ( not ( = ?auto_86756 ?auto_86757 ) ) ( not ( = ?auto_86756 ?auto_86758 ) ) ( not ( = ?auto_86756 ?auto_86759 ) ) ( not ( = ?auto_86756 ?auto_86760 ) ) ( not ( = ?auto_86756 ?auto_86761 ) ) ( not ( = ?auto_86756 ?auto_86762 ) ) ( not ( = ?auto_86756 ?auto_86763 ) ) ( not ( = ?auto_86756 ?auto_86764 ) ) ( not ( = ?auto_86756 ?auto_86765 ) ) ( not ( = ?auto_86756 ?auto_86766 ) ) ( not ( = ?auto_86757 ?auto_86758 ) ) ( not ( = ?auto_86757 ?auto_86759 ) ) ( not ( = ?auto_86757 ?auto_86760 ) ) ( not ( = ?auto_86757 ?auto_86761 ) ) ( not ( = ?auto_86757 ?auto_86762 ) ) ( not ( = ?auto_86757 ?auto_86763 ) ) ( not ( = ?auto_86757 ?auto_86764 ) ) ( not ( = ?auto_86757 ?auto_86765 ) ) ( not ( = ?auto_86757 ?auto_86766 ) ) ( not ( = ?auto_86758 ?auto_86759 ) ) ( not ( = ?auto_86758 ?auto_86760 ) ) ( not ( = ?auto_86758 ?auto_86761 ) ) ( not ( = ?auto_86758 ?auto_86762 ) ) ( not ( = ?auto_86758 ?auto_86763 ) ) ( not ( = ?auto_86758 ?auto_86764 ) ) ( not ( = ?auto_86758 ?auto_86765 ) ) ( not ( = ?auto_86758 ?auto_86766 ) ) ( not ( = ?auto_86759 ?auto_86760 ) ) ( not ( = ?auto_86759 ?auto_86761 ) ) ( not ( = ?auto_86759 ?auto_86762 ) ) ( not ( = ?auto_86759 ?auto_86763 ) ) ( not ( = ?auto_86759 ?auto_86764 ) ) ( not ( = ?auto_86759 ?auto_86765 ) ) ( not ( = ?auto_86759 ?auto_86766 ) ) ( not ( = ?auto_86760 ?auto_86761 ) ) ( not ( = ?auto_86760 ?auto_86762 ) ) ( not ( = ?auto_86760 ?auto_86763 ) ) ( not ( = ?auto_86760 ?auto_86764 ) ) ( not ( = ?auto_86760 ?auto_86765 ) ) ( not ( = ?auto_86760 ?auto_86766 ) ) ( not ( = ?auto_86761 ?auto_86762 ) ) ( not ( = ?auto_86761 ?auto_86763 ) ) ( not ( = ?auto_86761 ?auto_86764 ) ) ( not ( = ?auto_86761 ?auto_86765 ) ) ( not ( = ?auto_86761 ?auto_86766 ) ) ( not ( = ?auto_86762 ?auto_86763 ) ) ( not ( = ?auto_86762 ?auto_86764 ) ) ( not ( = ?auto_86762 ?auto_86765 ) ) ( not ( = ?auto_86762 ?auto_86766 ) ) ( not ( = ?auto_86763 ?auto_86764 ) ) ( not ( = ?auto_86763 ?auto_86765 ) ) ( not ( = ?auto_86763 ?auto_86766 ) ) ( not ( = ?auto_86764 ?auto_86765 ) ) ( not ( = ?auto_86764 ?auto_86766 ) ) ( not ( = ?auto_86765 ?auto_86766 ) ) ( ON ?auto_86764 ?auto_86765 ) ( ON ?auto_86763 ?auto_86764 ) ( ON ?auto_86762 ?auto_86763 ) ( ON ?auto_86761 ?auto_86762 ) ( ON ?auto_86760 ?auto_86761 ) ( ON ?auto_86759 ?auto_86760 ) ( ON ?auto_86758 ?auto_86759 ) ( ON ?auto_86757 ?auto_86758 ) ( ON ?auto_86756 ?auto_86757 ) ( CLEAR ?auto_86756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86756 )
      ( MAKE-10PILE ?auto_86756 ?auto_86757 ?auto_86758 ?auto_86759 ?auto_86760 ?auto_86761 ?auto_86762 ?auto_86763 ?auto_86764 ?auto_86765 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86777 - BLOCK
      ?auto_86778 - BLOCK
      ?auto_86779 - BLOCK
      ?auto_86780 - BLOCK
      ?auto_86781 - BLOCK
      ?auto_86782 - BLOCK
      ?auto_86783 - BLOCK
      ?auto_86784 - BLOCK
      ?auto_86785 - BLOCK
      ?auto_86786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86786 ) ( not ( = ?auto_86777 ?auto_86778 ) ) ( not ( = ?auto_86777 ?auto_86779 ) ) ( not ( = ?auto_86777 ?auto_86780 ) ) ( not ( = ?auto_86777 ?auto_86781 ) ) ( not ( = ?auto_86777 ?auto_86782 ) ) ( not ( = ?auto_86777 ?auto_86783 ) ) ( not ( = ?auto_86777 ?auto_86784 ) ) ( not ( = ?auto_86777 ?auto_86785 ) ) ( not ( = ?auto_86777 ?auto_86786 ) ) ( not ( = ?auto_86778 ?auto_86779 ) ) ( not ( = ?auto_86778 ?auto_86780 ) ) ( not ( = ?auto_86778 ?auto_86781 ) ) ( not ( = ?auto_86778 ?auto_86782 ) ) ( not ( = ?auto_86778 ?auto_86783 ) ) ( not ( = ?auto_86778 ?auto_86784 ) ) ( not ( = ?auto_86778 ?auto_86785 ) ) ( not ( = ?auto_86778 ?auto_86786 ) ) ( not ( = ?auto_86779 ?auto_86780 ) ) ( not ( = ?auto_86779 ?auto_86781 ) ) ( not ( = ?auto_86779 ?auto_86782 ) ) ( not ( = ?auto_86779 ?auto_86783 ) ) ( not ( = ?auto_86779 ?auto_86784 ) ) ( not ( = ?auto_86779 ?auto_86785 ) ) ( not ( = ?auto_86779 ?auto_86786 ) ) ( not ( = ?auto_86780 ?auto_86781 ) ) ( not ( = ?auto_86780 ?auto_86782 ) ) ( not ( = ?auto_86780 ?auto_86783 ) ) ( not ( = ?auto_86780 ?auto_86784 ) ) ( not ( = ?auto_86780 ?auto_86785 ) ) ( not ( = ?auto_86780 ?auto_86786 ) ) ( not ( = ?auto_86781 ?auto_86782 ) ) ( not ( = ?auto_86781 ?auto_86783 ) ) ( not ( = ?auto_86781 ?auto_86784 ) ) ( not ( = ?auto_86781 ?auto_86785 ) ) ( not ( = ?auto_86781 ?auto_86786 ) ) ( not ( = ?auto_86782 ?auto_86783 ) ) ( not ( = ?auto_86782 ?auto_86784 ) ) ( not ( = ?auto_86782 ?auto_86785 ) ) ( not ( = ?auto_86782 ?auto_86786 ) ) ( not ( = ?auto_86783 ?auto_86784 ) ) ( not ( = ?auto_86783 ?auto_86785 ) ) ( not ( = ?auto_86783 ?auto_86786 ) ) ( not ( = ?auto_86784 ?auto_86785 ) ) ( not ( = ?auto_86784 ?auto_86786 ) ) ( not ( = ?auto_86785 ?auto_86786 ) ) ( ON ?auto_86785 ?auto_86786 ) ( ON ?auto_86784 ?auto_86785 ) ( ON ?auto_86783 ?auto_86784 ) ( ON ?auto_86782 ?auto_86783 ) ( ON ?auto_86781 ?auto_86782 ) ( ON ?auto_86780 ?auto_86781 ) ( ON ?auto_86779 ?auto_86780 ) ( ON ?auto_86778 ?auto_86779 ) ( ON ?auto_86777 ?auto_86778 ) ( CLEAR ?auto_86777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86777 )
      ( MAKE-10PILE ?auto_86777 ?auto_86778 ?auto_86779 ?auto_86780 ?auto_86781 ?auto_86782 ?auto_86783 ?auto_86784 ?auto_86785 ?auto_86786 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_86797 - BLOCK
      ?auto_86798 - BLOCK
      ?auto_86799 - BLOCK
      ?auto_86800 - BLOCK
      ?auto_86801 - BLOCK
      ?auto_86802 - BLOCK
      ?auto_86803 - BLOCK
      ?auto_86804 - BLOCK
      ?auto_86805 - BLOCK
      ?auto_86806 - BLOCK
    )
    :vars
    (
      ?auto_86807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86797 ?auto_86798 ) ) ( not ( = ?auto_86797 ?auto_86799 ) ) ( not ( = ?auto_86797 ?auto_86800 ) ) ( not ( = ?auto_86797 ?auto_86801 ) ) ( not ( = ?auto_86797 ?auto_86802 ) ) ( not ( = ?auto_86797 ?auto_86803 ) ) ( not ( = ?auto_86797 ?auto_86804 ) ) ( not ( = ?auto_86797 ?auto_86805 ) ) ( not ( = ?auto_86797 ?auto_86806 ) ) ( not ( = ?auto_86798 ?auto_86799 ) ) ( not ( = ?auto_86798 ?auto_86800 ) ) ( not ( = ?auto_86798 ?auto_86801 ) ) ( not ( = ?auto_86798 ?auto_86802 ) ) ( not ( = ?auto_86798 ?auto_86803 ) ) ( not ( = ?auto_86798 ?auto_86804 ) ) ( not ( = ?auto_86798 ?auto_86805 ) ) ( not ( = ?auto_86798 ?auto_86806 ) ) ( not ( = ?auto_86799 ?auto_86800 ) ) ( not ( = ?auto_86799 ?auto_86801 ) ) ( not ( = ?auto_86799 ?auto_86802 ) ) ( not ( = ?auto_86799 ?auto_86803 ) ) ( not ( = ?auto_86799 ?auto_86804 ) ) ( not ( = ?auto_86799 ?auto_86805 ) ) ( not ( = ?auto_86799 ?auto_86806 ) ) ( not ( = ?auto_86800 ?auto_86801 ) ) ( not ( = ?auto_86800 ?auto_86802 ) ) ( not ( = ?auto_86800 ?auto_86803 ) ) ( not ( = ?auto_86800 ?auto_86804 ) ) ( not ( = ?auto_86800 ?auto_86805 ) ) ( not ( = ?auto_86800 ?auto_86806 ) ) ( not ( = ?auto_86801 ?auto_86802 ) ) ( not ( = ?auto_86801 ?auto_86803 ) ) ( not ( = ?auto_86801 ?auto_86804 ) ) ( not ( = ?auto_86801 ?auto_86805 ) ) ( not ( = ?auto_86801 ?auto_86806 ) ) ( not ( = ?auto_86802 ?auto_86803 ) ) ( not ( = ?auto_86802 ?auto_86804 ) ) ( not ( = ?auto_86802 ?auto_86805 ) ) ( not ( = ?auto_86802 ?auto_86806 ) ) ( not ( = ?auto_86803 ?auto_86804 ) ) ( not ( = ?auto_86803 ?auto_86805 ) ) ( not ( = ?auto_86803 ?auto_86806 ) ) ( not ( = ?auto_86804 ?auto_86805 ) ) ( not ( = ?auto_86804 ?auto_86806 ) ) ( not ( = ?auto_86805 ?auto_86806 ) ) ( ON ?auto_86797 ?auto_86807 ) ( not ( = ?auto_86806 ?auto_86807 ) ) ( not ( = ?auto_86805 ?auto_86807 ) ) ( not ( = ?auto_86804 ?auto_86807 ) ) ( not ( = ?auto_86803 ?auto_86807 ) ) ( not ( = ?auto_86802 ?auto_86807 ) ) ( not ( = ?auto_86801 ?auto_86807 ) ) ( not ( = ?auto_86800 ?auto_86807 ) ) ( not ( = ?auto_86799 ?auto_86807 ) ) ( not ( = ?auto_86798 ?auto_86807 ) ) ( not ( = ?auto_86797 ?auto_86807 ) ) ( ON ?auto_86798 ?auto_86797 ) ( ON ?auto_86799 ?auto_86798 ) ( ON ?auto_86800 ?auto_86799 ) ( ON ?auto_86801 ?auto_86800 ) ( ON ?auto_86802 ?auto_86801 ) ( ON ?auto_86803 ?auto_86802 ) ( ON ?auto_86804 ?auto_86803 ) ( ON ?auto_86805 ?auto_86804 ) ( ON ?auto_86806 ?auto_86805 ) ( CLEAR ?auto_86806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_86806 ?auto_86805 ?auto_86804 ?auto_86803 ?auto_86802 ?auto_86801 ?auto_86800 ?auto_86799 ?auto_86798 ?auto_86797 )
      ( MAKE-10PILE ?auto_86797 ?auto_86798 ?auto_86799 ?auto_86800 ?auto_86801 ?auto_86802 ?auto_86803 ?auto_86804 ?auto_86805 ?auto_86806 ) )
  )

)

