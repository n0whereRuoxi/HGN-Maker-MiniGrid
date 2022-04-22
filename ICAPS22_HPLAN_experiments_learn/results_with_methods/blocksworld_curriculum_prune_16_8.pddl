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
      ?auto_515125 - BLOCK
    )
    :vars
    (
      ?auto_515126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515125 ?auto_515126 ) ( CLEAR ?auto_515125 ) ( HAND-EMPTY ) ( not ( = ?auto_515125 ?auto_515126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515125 ?auto_515126 )
      ( !PUTDOWN ?auto_515125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_515132 - BLOCK
      ?auto_515133 - BLOCK
    )
    :vars
    (
      ?auto_515134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_515132 ) ( ON ?auto_515133 ?auto_515134 ) ( CLEAR ?auto_515133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_515132 ) ( not ( = ?auto_515132 ?auto_515133 ) ) ( not ( = ?auto_515132 ?auto_515134 ) ) ( not ( = ?auto_515133 ?auto_515134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515133 ?auto_515134 )
      ( !STACK ?auto_515133 ?auto_515132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_515142 - BLOCK
      ?auto_515143 - BLOCK
    )
    :vars
    (
      ?auto_515144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515143 ?auto_515144 ) ( not ( = ?auto_515142 ?auto_515143 ) ) ( not ( = ?auto_515142 ?auto_515144 ) ) ( not ( = ?auto_515143 ?auto_515144 ) ) ( ON ?auto_515142 ?auto_515143 ) ( CLEAR ?auto_515142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515142 )
      ( MAKE-2PILE ?auto_515142 ?auto_515143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_515153 - BLOCK
      ?auto_515154 - BLOCK
      ?auto_515155 - BLOCK
    )
    :vars
    (
      ?auto_515156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_515154 ) ( ON ?auto_515155 ?auto_515156 ) ( CLEAR ?auto_515155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_515153 ) ( ON ?auto_515154 ?auto_515153 ) ( not ( = ?auto_515153 ?auto_515154 ) ) ( not ( = ?auto_515153 ?auto_515155 ) ) ( not ( = ?auto_515153 ?auto_515156 ) ) ( not ( = ?auto_515154 ?auto_515155 ) ) ( not ( = ?auto_515154 ?auto_515156 ) ) ( not ( = ?auto_515155 ?auto_515156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515155 ?auto_515156 )
      ( !STACK ?auto_515155 ?auto_515154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_515167 - BLOCK
      ?auto_515168 - BLOCK
      ?auto_515169 - BLOCK
    )
    :vars
    (
      ?auto_515170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515169 ?auto_515170 ) ( ON-TABLE ?auto_515167 ) ( not ( = ?auto_515167 ?auto_515168 ) ) ( not ( = ?auto_515167 ?auto_515169 ) ) ( not ( = ?auto_515167 ?auto_515170 ) ) ( not ( = ?auto_515168 ?auto_515169 ) ) ( not ( = ?auto_515168 ?auto_515170 ) ) ( not ( = ?auto_515169 ?auto_515170 ) ) ( CLEAR ?auto_515167 ) ( ON ?auto_515168 ?auto_515169 ) ( CLEAR ?auto_515168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_515167 ?auto_515168 )
      ( MAKE-3PILE ?auto_515167 ?auto_515168 ?auto_515169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_515181 - BLOCK
      ?auto_515182 - BLOCK
      ?auto_515183 - BLOCK
    )
    :vars
    (
      ?auto_515184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515183 ?auto_515184 ) ( not ( = ?auto_515181 ?auto_515182 ) ) ( not ( = ?auto_515181 ?auto_515183 ) ) ( not ( = ?auto_515181 ?auto_515184 ) ) ( not ( = ?auto_515182 ?auto_515183 ) ) ( not ( = ?auto_515182 ?auto_515184 ) ) ( not ( = ?auto_515183 ?auto_515184 ) ) ( ON ?auto_515182 ?auto_515183 ) ( ON ?auto_515181 ?auto_515182 ) ( CLEAR ?auto_515181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515181 )
      ( MAKE-3PILE ?auto_515181 ?auto_515182 ?auto_515183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_515196 - BLOCK
      ?auto_515197 - BLOCK
      ?auto_515198 - BLOCK
      ?auto_515199 - BLOCK
    )
    :vars
    (
      ?auto_515200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_515198 ) ( ON ?auto_515199 ?auto_515200 ) ( CLEAR ?auto_515199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_515196 ) ( ON ?auto_515197 ?auto_515196 ) ( ON ?auto_515198 ?auto_515197 ) ( not ( = ?auto_515196 ?auto_515197 ) ) ( not ( = ?auto_515196 ?auto_515198 ) ) ( not ( = ?auto_515196 ?auto_515199 ) ) ( not ( = ?auto_515196 ?auto_515200 ) ) ( not ( = ?auto_515197 ?auto_515198 ) ) ( not ( = ?auto_515197 ?auto_515199 ) ) ( not ( = ?auto_515197 ?auto_515200 ) ) ( not ( = ?auto_515198 ?auto_515199 ) ) ( not ( = ?auto_515198 ?auto_515200 ) ) ( not ( = ?auto_515199 ?auto_515200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515199 ?auto_515200 )
      ( !STACK ?auto_515199 ?auto_515198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_515214 - BLOCK
      ?auto_515215 - BLOCK
      ?auto_515216 - BLOCK
      ?auto_515217 - BLOCK
    )
    :vars
    (
      ?auto_515218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515217 ?auto_515218 ) ( ON-TABLE ?auto_515214 ) ( ON ?auto_515215 ?auto_515214 ) ( not ( = ?auto_515214 ?auto_515215 ) ) ( not ( = ?auto_515214 ?auto_515216 ) ) ( not ( = ?auto_515214 ?auto_515217 ) ) ( not ( = ?auto_515214 ?auto_515218 ) ) ( not ( = ?auto_515215 ?auto_515216 ) ) ( not ( = ?auto_515215 ?auto_515217 ) ) ( not ( = ?auto_515215 ?auto_515218 ) ) ( not ( = ?auto_515216 ?auto_515217 ) ) ( not ( = ?auto_515216 ?auto_515218 ) ) ( not ( = ?auto_515217 ?auto_515218 ) ) ( CLEAR ?auto_515215 ) ( ON ?auto_515216 ?auto_515217 ) ( CLEAR ?auto_515216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_515214 ?auto_515215 ?auto_515216 )
      ( MAKE-4PILE ?auto_515214 ?auto_515215 ?auto_515216 ?auto_515217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_515232 - BLOCK
      ?auto_515233 - BLOCK
      ?auto_515234 - BLOCK
      ?auto_515235 - BLOCK
    )
    :vars
    (
      ?auto_515236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515235 ?auto_515236 ) ( ON-TABLE ?auto_515232 ) ( not ( = ?auto_515232 ?auto_515233 ) ) ( not ( = ?auto_515232 ?auto_515234 ) ) ( not ( = ?auto_515232 ?auto_515235 ) ) ( not ( = ?auto_515232 ?auto_515236 ) ) ( not ( = ?auto_515233 ?auto_515234 ) ) ( not ( = ?auto_515233 ?auto_515235 ) ) ( not ( = ?auto_515233 ?auto_515236 ) ) ( not ( = ?auto_515234 ?auto_515235 ) ) ( not ( = ?auto_515234 ?auto_515236 ) ) ( not ( = ?auto_515235 ?auto_515236 ) ) ( ON ?auto_515234 ?auto_515235 ) ( CLEAR ?auto_515232 ) ( ON ?auto_515233 ?auto_515234 ) ( CLEAR ?auto_515233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_515232 ?auto_515233 )
      ( MAKE-4PILE ?auto_515232 ?auto_515233 ?auto_515234 ?auto_515235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_515250 - BLOCK
      ?auto_515251 - BLOCK
      ?auto_515252 - BLOCK
      ?auto_515253 - BLOCK
    )
    :vars
    (
      ?auto_515254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515253 ?auto_515254 ) ( not ( = ?auto_515250 ?auto_515251 ) ) ( not ( = ?auto_515250 ?auto_515252 ) ) ( not ( = ?auto_515250 ?auto_515253 ) ) ( not ( = ?auto_515250 ?auto_515254 ) ) ( not ( = ?auto_515251 ?auto_515252 ) ) ( not ( = ?auto_515251 ?auto_515253 ) ) ( not ( = ?auto_515251 ?auto_515254 ) ) ( not ( = ?auto_515252 ?auto_515253 ) ) ( not ( = ?auto_515252 ?auto_515254 ) ) ( not ( = ?auto_515253 ?auto_515254 ) ) ( ON ?auto_515252 ?auto_515253 ) ( ON ?auto_515251 ?auto_515252 ) ( ON ?auto_515250 ?auto_515251 ) ( CLEAR ?auto_515250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515250 )
      ( MAKE-4PILE ?auto_515250 ?auto_515251 ?auto_515252 ?auto_515253 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_515269 - BLOCK
      ?auto_515270 - BLOCK
      ?auto_515271 - BLOCK
      ?auto_515272 - BLOCK
      ?auto_515273 - BLOCK
    )
    :vars
    (
      ?auto_515274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_515272 ) ( ON ?auto_515273 ?auto_515274 ) ( CLEAR ?auto_515273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_515269 ) ( ON ?auto_515270 ?auto_515269 ) ( ON ?auto_515271 ?auto_515270 ) ( ON ?auto_515272 ?auto_515271 ) ( not ( = ?auto_515269 ?auto_515270 ) ) ( not ( = ?auto_515269 ?auto_515271 ) ) ( not ( = ?auto_515269 ?auto_515272 ) ) ( not ( = ?auto_515269 ?auto_515273 ) ) ( not ( = ?auto_515269 ?auto_515274 ) ) ( not ( = ?auto_515270 ?auto_515271 ) ) ( not ( = ?auto_515270 ?auto_515272 ) ) ( not ( = ?auto_515270 ?auto_515273 ) ) ( not ( = ?auto_515270 ?auto_515274 ) ) ( not ( = ?auto_515271 ?auto_515272 ) ) ( not ( = ?auto_515271 ?auto_515273 ) ) ( not ( = ?auto_515271 ?auto_515274 ) ) ( not ( = ?auto_515272 ?auto_515273 ) ) ( not ( = ?auto_515272 ?auto_515274 ) ) ( not ( = ?auto_515273 ?auto_515274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515273 ?auto_515274 )
      ( !STACK ?auto_515273 ?auto_515272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_515291 - BLOCK
      ?auto_515292 - BLOCK
      ?auto_515293 - BLOCK
      ?auto_515294 - BLOCK
      ?auto_515295 - BLOCK
    )
    :vars
    (
      ?auto_515296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515295 ?auto_515296 ) ( ON-TABLE ?auto_515291 ) ( ON ?auto_515292 ?auto_515291 ) ( ON ?auto_515293 ?auto_515292 ) ( not ( = ?auto_515291 ?auto_515292 ) ) ( not ( = ?auto_515291 ?auto_515293 ) ) ( not ( = ?auto_515291 ?auto_515294 ) ) ( not ( = ?auto_515291 ?auto_515295 ) ) ( not ( = ?auto_515291 ?auto_515296 ) ) ( not ( = ?auto_515292 ?auto_515293 ) ) ( not ( = ?auto_515292 ?auto_515294 ) ) ( not ( = ?auto_515292 ?auto_515295 ) ) ( not ( = ?auto_515292 ?auto_515296 ) ) ( not ( = ?auto_515293 ?auto_515294 ) ) ( not ( = ?auto_515293 ?auto_515295 ) ) ( not ( = ?auto_515293 ?auto_515296 ) ) ( not ( = ?auto_515294 ?auto_515295 ) ) ( not ( = ?auto_515294 ?auto_515296 ) ) ( not ( = ?auto_515295 ?auto_515296 ) ) ( CLEAR ?auto_515293 ) ( ON ?auto_515294 ?auto_515295 ) ( CLEAR ?auto_515294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_515291 ?auto_515292 ?auto_515293 ?auto_515294 )
      ( MAKE-5PILE ?auto_515291 ?auto_515292 ?auto_515293 ?auto_515294 ?auto_515295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_515313 - BLOCK
      ?auto_515314 - BLOCK
      ?auto_515315 - BLOCK
      ?auto_515316 - BLOCK
      ?auto_515317 - BLOCK
    )
    :vars
    (
      ?auto_515318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515317 ?auto_515318 ) ( ON-TABLE ?auto_515313 ) ( ON ?auto_515314 ?auto_515313 ) ( not ( = ?auto_515313 ?auto_515314 ) ) ( not ( = ?auto_515313 ?auto_515315 ) ) ( not ( = ?auto_515313 ?auto_515316 ) ) ( not ( = ?auto_515313 ?auto_515317 ) ) ( not ( = ?auto_515313 ?auto_515318 ) ) ( not ( = ?auto_515314 ?auto_515315 ) ) ( not ( = ?auto_515314 ?auto_515316 ) ) ( not ( = ?auto_515314 ?auto_515317 ) ) ( not ( = ?auto_515314 ?auto_515318 ) ) ( not ( = ?auto_515315 ?auto_515316 ) ) ( not ( = ?auto_515315 ?auto_515317 ) ) ( not ( = ?auto_515315 ?auto_515318 ) ) ( not ( = ?auto_515316 ?auto_515317 ) ) ( not ( = ?auto_515316 ?auto_515318 ) ) ( not ( = ?auto_515317 ?auto_515318 ) ) ( ON ?auto_515316 ?auto_515317 ) ( CLEAR ?auto_515314 ) ( ON ?auto_515315 ?auto_515316 ) ( CLEAR ?auto_515315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_515313 ?auto_515314 ?auto_515315 )
      ( MAKE-5PILE ?auto_515313 ?auto_515314 ?auto_515315 ?auto_515316 ?auto_515317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_515335 - BLOCK
      ?auto_515336 - BLOCK
      ?auto_515337 - BLOCK
      ?auto_515338 - BLOCK
      ?auto_515339 - BLOCK
    )
    :vars
    (
      ?auto_515340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515339 ?auto_515340 ) ( ON-TABLE ?auto_515335 ) ( not ( = ?auto_515335 ?auto_515336 ) ) ( not ( = ?auto_515335 ?auto_515337 ) ) ( not ( = ?auto_515335 ?auto_515338 ) ) ( not ( = ?auto_515335 ?auto_515339 ) ) ( not ( = ?auto_515335 ?auto_515340 ) ) ( not ( = ?auto_515336 ?auto_515337 ) ) ( not ( = ?auto_515336 ?auto_515338 ) ) ( not ( = ?auto_515336 ?auto_515339 ) ) ( not ( = ?auto_515336 ?auto_515340 ) ) ( not ( = ?auto_515337 ?auto_515338 ) ) ( not ( = ?auto_515337 ?auto_515339 ) ) ( not ( = ?auto_515337 ?auto_515340 ) ) ( not ( = ?auto_515338 ?auto_515339 ) ) ( not ( = ?auto_515338 ?auto_515340 ) ) ( not ( = ?auto_515339 ?auto_515340 ) ) ( ON ?auto_515338 ?auto_515339 ) ( ON ?auto_515337 ?auto_515338 ) ( CLEAR ?auto_515335 ) ( ON ?auto_515336 ?auto_515337 ) ( CLEAR ?auto_515336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_515335 ?auto_515336 )
      ( MAKE-5PILE ?auto_515335 ?auto_515336 ?auto_515337 ?auto_515338 ?auto_515339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_515357 - BLOCK
      ?auto_515358 - BLOCK
      ?auto_515359 - BLOCK
      ?auto_515360 - BLOCK
      ?auto_515361 - BLOCK
    )
    :vars
    (
      ?auto_515362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515361 ?auto_515362 ) ( not ( = ?auto_515357 ?auto_515358 ) ) ( not ( = ?auto_515357 ?auto_515359 ) ) ( not ( = ?auto_515357 ?auto_515360 ) ) ( not ( = ?auto_515357 ?auto_515361 ) ) ( not ( = ?auto_515357 ?auto_515362 ) ) ( not ( = ?auto_515358 ?auto_515359 ) ) ( not ( = ?auto_515358 ?auto_515360 ) ) ( not ( = ?auto_515358 ?auto_515361 ) ) ( not ( = ?auto_515358 ?auto_515362 ) ) ( not ( = ?auto_515359 ?auto_515360 ) ) ( not ( = ?auto_515359 ?auto_515361 ) ) ( not ( = ?auto_515359 ?auto_515362 ) ) ( not ( = ?auto_515360 ?auto_515361 ) ) ( not ( = ?auto_515360 ?auto_515362 ) ) ( not ( = ?auto_515361 ?auto_515362 ) ) ( ON ?auto_515360 ?auto_515361 ) ( ON ?auto_515359 ?auto_515360 ) ( ON ?auto_515358 ?auto_515359 ) ( ON ?auto_515357 ?auto_515358 ) ( CLEAR ?auto_515357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515357 )
      ( MAKE-5PILE ?auto_515357 ?auto_515358 ?auto_515359 ?auto_515360 ?auto_515361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_515380 - BLOCK
      ?auto_515381 - BLOCK
      ?auto_515382 - BLOCK
      ?auto_515383 - BLOCK
      ?auto_515384 - BLOCK
      ?auto_515385 - BLOCK
    )
    :vars
    (
      ?auto_515386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_515384 ) ( ON ?auto_515385 ?auto_515386 ) ( CLEAR ?auto_515385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_515380 ) ( ON ?auto_515381 ?auto_515380 ) ( ON ?auto_515382 ?auto_515381 ) ( ON ?auto_515383 ?auto_515382 ) ( ON ?auto_515384 ?auto_515383 ) ( not ( = ?auto_515380 ?auto_515381 ) ) ( not ( = ?auto_515380 ?auto_515382 ) ) ( not ( = ?auto_515380 ?auto_515383 ) ) ( not ( = ?auto_515380 ?auto_515384 ) ) ( not ( = ?auto_515380 ?auto_515385 ) ) ( not ( = ?auto_515380 ?auto_515386 ) ) ( not ( = ?auto_515381 ?auto_515382 ) ) ( not ( = ?auto_515381 ?auto_515383 ) ) ( not ( = ?auto_515381 ?auto_515384 ) ) ( not ( = ?auto_515381 ?auto_515385 ) ) ( not ( = ?auto_515381 ?auto_515386 ) ) ( not ( = ?auto_515382 ?auto_515383 ) ) ( not ( = ?auto_515382 ?auto_515384 ) ) ( not ( = ?auto_515382 ?auto_515385 ) ) ( not ( = ?auto_515382 ?auto_515386 ) ) ( not ( = ?auto_515383 ?auto_515384 ) ) ( not ( = ?auto_515383 ?auto_515385 ) ) ( not ( = ?auto_515383 ?auto_515386 ) ) ( not ( = ?auto_515384 ?auto_515385 ) ) ( not ( = ?auto_515384 ?auto_515386 ) ) ( not ( = ?auto_515385 ?auto_515386 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515385 ?auto_515386 )
      ( !STACK ?auto_515385 ?auto_515384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_515406 - BLOCK
      ?auto_515407 - BLOCK
      ?auto_515408 - BLOCK
      ?auto_515409 - BLOCK
      ?auto_515410 - BLOCK
      ?auto_515411 - BLOCK
    )
    :vars
    (
      ?auto_515412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515411 ?auto_515412 ) ( ON-TABLE ?auto_515406 ) ( ON ?auto_515407 ?auto_515406 ) ( ON ?auto_515408 ?auto_515407 ) ( ON ?auto_515409 ?auto_515408 ) ( not ( = ?auto_515406 ?auto_515407 ) ) ( not ( = ?auto_515406 ?auto_515408 ) ) ( not ( = ?auto_515406 ?auto_515409 ) ) ( not ( = ?auto_515406 ?auto_515410 ) ) ( not ( = ?auto_515406 ?auto_515411 ) ) ( not ( = ?auto_515406 ?auto_515412 ) ) ( not ( = ?auto_515407 ?auto_515408 ) ) ( not ( = ?auto_515407 ?auto_515409 ) ) ( not ( = ?auto_515407 ?auto_515410 ) ) ( not ( = ?auto_515407 ?auto_515411 ) ) ( not ( = ?auto_515407 ?auto_515412 ) ) ( not ( = ?auto_515408 ?auto_515409 ) ) ( not ( = ?auto_515408 ?auto_515410 ) ) ( not ( = ?auto_515408 ?auto_515411 ) ) ( not ( = ?auto_515408 ?auto_515412 ) ) ( not ( = ?auto_515409 ?auto_515410 ) ) ( not ( = ?auto_515409 ?auto_515411 ) ) ( not ( = ?auto_515409 ?auto_515412 ) ) ( not ( = ?auto_515410 ?auto_515411 ) ) ( not ( = ?auto_515410 ?auto_515412 ) ) ( not ( = ?auto_515411 ?auto_515412 ) ) ( CLEAR ?auto_515409 ) ( ON ?auto_515410 ?auto_515411 ) ( CLEAR ?auto_515410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_515406 ?auto_515407 ?auto_515408 ?auto_515409 ?auto_515410 )
      ( MAKE-6PILE ?auto_515406 ?auto_515407 ?auto_515408 ?auto_515409 ?auto_515410 ?auto_515411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_515432 - BLOCK
      ?auto_515433 - BLOCK
      ?auto_515434 - BLOCK
      ?auto_515435 - BLOCK
      ?auto_515436 - BLOCK
      ?auto_515437 - BLOCK
    )
    :vars
    (
      ?auto_515438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515437 ?auto_515438 ) ( ON-TABLE ?auto_515432 ) ( ON ?auto_515433 ?auto_515432 ) ( ON ?auto_515434 ?auto_515433 ) ( not ( = ?auto_515432 ?auto_515433 ) ) ( not ( = ?auto_515432 ?auto_515434 ) ) ( not ( = ?auto_515432 ?auto_515435 ) ) ( not ( = ?auto_515432 ?auto_515436 ) ) ( not ( = ?auto_515432 ?auto_515437 ) ) ( not ( = ?auto_515432 ?auto_515438 ) ) ( not ( = ?auto_515433 ?auto_515434 ) ) ( not ( = ?auto_515433 ?auto_515435 ) ) ( not ( = ?auto_515433 ?auto_515436 ) ) ( not ( = ?auto_515433 ?auto_515437 ) ) ( not ( = ?auto_515433 ?auto_515438 ) ) ( not ( = ?auto_515434 ?auto_515435 ) ) ( not ( = ?auto_515434 ?auto_515436 ) ) ( not ( = ?auto_515434 ?auto_515437 ) ) ( not ( = ?auto_515434 ?auto_515438 ) ) ( not ( = ?auto_515435 ?auto_515436 ) ) ( not ( = ?auto_515435 ?auto_515437 ) ) ( not ( = ?auto_515435 ?auto_515438 ) ) ( not ( = ?auto_515436 ?auto_515437 ) ) ( not ( = ?auto_515436 ?auto_515438 ) ) ( not ( = ?auto_515437 ?auto_515438 ) ) ( ON ?auto_515436 ?auto_515437 ) ( CLEAR ?auto_515434 ) ( ON ?auto_515435 ?auto_515436 ) ( CLEAR ?auto_515435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_515432 ?auto_515433 ?auto_515434 ?auto_515435 )
      ( MAKE-6PILE ?auto_515432 ?auto_515433 ?auto_515434 ?auto_515435 ?auto_515436 ?auto_515437 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_515458 - BLOCK
      ?auto_515459 - BLOCK
      ?auto_515460 - BLOCK
      ?auto_515461 - BLOCK
      ?auto_515462 - BLOCK
      ?auto_515463 - BLOCK
    )
    :vars
    (
      ?auto_515464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515463 ?auto_515464 ) ( ON-TABLE ?auto_515458 ) ( ON ?auto_515459 ?auto_515458 ) ( not ( = ?auto_515458 ?auto_515459 ) ) ( not ( = ?auto_515458 ?auto_515460 ) ) ( not ( = ?auto_515458 ?auto_515461 ) ) ( not ( = ?auto_515458 ?auto_515462 ) ) ( not ( = ?auto_515458 ?auto_515463 ) ) ( not ( = ?auto_515458 ?auto_515464 ) ) ( not ( = ?auto_515459 ?auto_515460 ) ) ( not ( = ?auto_515459 ?auto_515461 ) ) ( not ( = ?auto_515459 ?auto_515462 ) ) ( not ( = ?auto_515459 ?auto_515463 ) ) ( not ( = ?auto_515459 ?auto_515464 ) ) ( not ( = ?auto_515460 ?auto_515461 ) ) ( not ( = ?auto_515460 ?auto_515462 ) ) ( not ( = ?auto_515460 ?auto_515463 ) ) ( not ( = ?auto_515460 ?auto_515464 ) ) ( not ( = ?auto_515461 ?auto_515462 ) ) ( not ( = ?auto_515461 ?auto_515463 ) ) ( not ( = ?auto_515461 ?auto_515464 ) ) ( not ( = ?auto_515462 ?auto_515463 ) ) ( not ( = ?auto_515462 ?auto_515464 ) ) ( not ( = ?auto_515463 ?auto_515464 ) ) ( ON ?auto_515462 ?auto_515463 ) ( ON ?auto_515461 ?auto_515462 ) ( CLEAR ?auto_515459 ) ( ON ?auto_515460 ?auto_515461 ) ( CLEAR ?auto_515460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_515458 ?auto_515459 ?auto_515460 )
      ( MAKE-6PILE ?auto_515458 ?auto_515459 ?auto_515460 ?auto_515461 ?auto_515462 ?auto_515463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_515484 - BLOCK
      ?auto_515485 - BLOCK
      ?auto_515486 - BLOCK
      ?auto_515487 - BLOCK
      ?auto_515488 - BLOCK
      ?auto_515489 - BLOCK
    )
    :vars
    (
      ?auto_515490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515489 ?auto_515490 ) ( ON-TABLE ?auto_515484 ) ( not ( = ?auto_515484 ?auto_515485 ) ) ( not ( = ?auto_515484 ?auto_515486 ) ) ( not ( = ?auto_515484 ?auto_515487 ) ) ( not ( = ?auto_515484 ?auto_515488 ) ) ( not ( = ?auto_515484 ?auto_515489 ) ) ( not ( = ?auto_515484 ?auto_515490 ) ) ( not ( = ?auto_515485 ?auto_515486 ) ) ( not ( = ?auto_515485 ?auto_515487 ) ) ( not ( = ?auto_515485 ?auto_515488 ) ) ( not ( = ?auto_515485 ?auto_515489 ) ) ( not ( = ?auto_515485 ?auto_515490 ) ) ( not ( = ?auto_515486 ?auto_515487 ) ) ( not ( = ?auto_515486 ?auto_515488 ) ) ( not ( = ?auto_515486 ?auto_515489 ) ) ( not ( = ?auto_515486 ?auto_515490 ) ) ( not ( = ?auto_515487 ?auto_515488 ) ) ( not ( = ?auto_515487 ?auto_515489 ) ) ( not ( = ?auto_515487 ?auto_515490 ) ) ( not ( = ?auto_515488 ?auto_515489 ) ) ( not ( = ?auto_515488 ?auto_515490 ) ) ( not ( = ?auto_515489 ?auto_515490 ) ) ( ON ?auto_515488 ?auto_515489 ) ( ON ?auto_515487 ?auto_515488 ) ( ON ?auto_515486 ?auto_515487 ) ( CLEAR ?auto_515484 ) ( ON ?auto_515485 ?auto_515486 ) ( CLEAR ?auto_515485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_515484 ?auto_515485 )
      ( MAKE-6PILE ?auto_515484 ?auto_515485 ?auto_515486 ?auto_515487 ?auto_515488 ?auto_515489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_515510 - BLOCK
      ?auto_515511 - BLOCK
      ?auto_515512 - BLOCK
      ?auto_515513 - BLOCK
      ?auto_515514 - BLOCK
      ?auto_515515 - BLOCK
    )
    :vars
    (
      ?auto_515516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515515 ?auto_515516 ) ( not ( = ?auto_515510 ?auto_515511 ) ) ( not ( = ?auto_515510 ?auto_515512 ) ) ( not ( = ?auto_515510 ?auto_515513 ) ) ( not ( = ?auto_515510 ?auto_515514 ) ) ( not ( = ?auto_515510 ?auto_515515 ) ) ( not ( = ?auto_515510 ?auto_515516 ) ) ( not ( = ?auto_515511 ?auto_515512 ) ) ( not ( = ?auto_515511 ?auto_515513 ) ) ( not ( = ?auto_515511 ?auto_515514 ) ) ( not ( = ?auto_515511 ?auto_515515 ) ) ( not ( = ?auto_515511 ?auto_515516 ) ) ( not ( = ?auto_515512 ?auto_515513 ) ) ( not ( = ?auto_515512 ?auto_515514 ) ) ( not ( = ?auto_515512 ?auto_515515 ) ) ( not ( = ?auto_515512 ?auto_515516 ) ) ( not ( = ?auto_515513 ?auto_515514 ) ) ( not ( = ?auto_515513 ?auto_515515 ) ) ( not ( = ?auto_515513 ?auto_515516 ) ) ( not ( = ?auto_515514 ?auto_515515 ) ) ( not ( = ?auto_515514 ?auto_515516 ) ) ( not ( = ?auto_515515 ?auto_515516 ) ) ( ON ?auto_515514 ?auto_515515 ) ( ON ?auto_515513 ?auto_515514 ) ( ON ?auto_515512 ?auto_515513 ) ( ON ?auto_515511 ?auto_515512 ) ( ON ?auto_515510 ?auto_515511 ) ( CLEAR ?auto_515510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515510 )
      ( MAKE-6PILE ?auto_515510 ?auto_515511 ?auto_515512 ?auto_515513 ?auto_515514 ?auto_515515 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_515537 - BLOCK
      ?auto_515538 - BLOCK
      ?auto_515539 - BLOCK
      ?auto_515540 - BLOCK
      ?auto_515541 - BLOCK
      ?auto_515542 - BLOCK
      ?auto_515543 - BLOCK
    )
    :vars
    (
      ?auto_515544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_515542 ) ( ON ?auto_515543 ?auto_515544 ) ( CLEAR ?auto_515543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_515537 ) ( ON ?auto_515538 ?auto_515537 ) ( ON ?auto_515539 ?auto_515538 ) ( ON ?auto_515540 ?auto_515539 ) ( ON ?auto_515541 ?auto_515540 ) ( ON ?auto_515542 ?auto_515541 ) ( not ( = ?auto_515537 ?auto_515538 ) ) ( not ( = ?auto_515537 ?auto_515539 ) ) ( not ( = ?auto_515537 ?auto_515540 ) ) ( not ( = ?auto_515537 ?auto_515541 ) ) ( not ( = ?auto_515537 ?auto_515542 ) ) ( not ( = ?auto_515537 ?auto_515543 ) ) ( not ( = ?auto_515537 ?auto_515544 ) ) ( not ( = ?auto_515538 ?auto_515539 ) ) ( not ( = ?auto_515538 ?auto_515540 ) ) ( not ( = ?auto_515538 ?auto_515541 ) ) ( not ( = ?auto_515538 ?auto_515542 ) ) ( not ( = ?auto_515538 ?auto_515543 ) ) ( not ( = ?auto_515538 ?auto_515544 ) ) ( not ( = ?auto_515539 ?auto_515540 ) ) ( not ( = ?auto_515539 ?auto_515541 ) ) ( not ( = ?auto_515539 ?auto_515542 ) ) ( not ( = ?auto_515539 ?auto_515543 ) ) ( not ( = ?auto_515539 ?auto_515544 ) ) ( not ( = ?auto_515540 ?auto_515541 ) ) ( not ( = ?auto_515540 ?auto_515542 ) ) ( not ( = ?auto_515540 ?auto_515543 ) ) ( not ( = ?auto_515540 ?auto_515544 ) ) ( not ( = ?auto_515541 ?auto_515542 ) ) ( not ( = ?auto_515541 ?auto_515543 ) ) ( not ( = ?auto_515541 ?auto_515544 ) ) ( not ( = ?auto_515542 ?auto_515543 ) ) ( not ( = ?auto_515542 ?auto_515544 ) ) ( not ( = ?auto_515543 ?auto_515544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515543 ?auto_515544 )
      ( !STACK ?auto_515543 ?auto_515542 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_515567 - BLOCK
      ?auto_515568 - BLOCK
      ?auto_515569 - BLOCK
      ?auto_515570 - BLOCK
      ?auto_515571 - BLOCK
      ?auto_515572 - BLOCK
      ?auto_515573 - BLOCK
    )
    :vars
    (
      ?auto_515574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515573 ?auto_515574 ) ( ON-TABLE ?auto_515567 ) ( ON ?auto_515568 ?auto_515567 ) ( ON ?auto_515569 ?auto_515568 ) ( ON ?auto_515570 ?auto_515569 ) ( ON ?auto_515571 ?auto_515570 ) ( not ( = ?auto_515567 ?auto_515568 ) ) ( not ( = ?auto_515567 ?auto_515569 ) ) ( not ( = ?auto_515567 ?auto_515570 ) ) ( not ( = ?auto_515567 ?auto_515571 ) ) ( not ( = ?auto_515567 ?auto_515572 ) ) ( not ( = ?auto_515567 ?auto_515573 ) ) ( not ( = ?auto_515567 ?auto_515574 ) ) ( not ( = ?auto_515568 ?auto_515569 ) ) ( not ( = ?auto_515568 ?auto_515570 ) ) ( not ( = ?auto_515568 ?auto_515571 ) ) ( not ( = ?auto_515568 ?auto_515572 ) ) ( not ( = ?auto_515568 ?auto_515573 ) ) ( not ( = ?auto_515568 ?auto_515574 ) ) ( not ( = ?auto_515569 ?auto_515570 ) ) ( not ( = ?auto_515569 ?auto_515571 ) ) ( not ( = ?auto_515569 ?auto_515572 ) ) ( not ( = ?auto_515569 ?auto_515573 ) ) ( not ( = ?auto_515569 ?auto_515574 ) ) ( not ( = ?auto_515570 ?auto_515571 ) ) ( not ( = ?auto_515570 ?auto_515572 ) ) ( not ( = ?auto_515570 ?auto_515573 ) ) ( not ( = ?auto_515570 ?auto_515574 ) ) ( not ( = ?auto_515571 ?auto_515572 ) ) ( not ( = ?auto_515571 ?auto_515573 ) ) ( not ( = ?auto_515571 ?auto_515574 ) ) ( not ( = ?auto_515572 ?auto_515573 ) ) ( not ( = ?auto_515572 ?auto_515574 ) ) ( not ( = ?auto_515573 ?auto_515574 ) ) ( CLEAR ?auto_515571 ) ( ON ?auto_515572 ?auto_515573 ) ( CLEAR ?auto_515572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_515567 ?auto_515568 ?auto_515569 ?auto_515570 ?auto_515571 ?auto_515572 )
      ( MAKE-7PILE ?auto_515567 ?auto_515568 ?auto_515569 ?auto_515570 ?auto_515571 ?auto_515572 ?auto_515573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_515597 - BLOCK
      ?auto_515598 - BLOCK
      ?auto_515599 - BLOCK
      ?auto_515600 - BLOCK
      ?auto_515601 - BLOCK
      ?auto_515602 - BLOCK
      ?auto_515603 - BLOCK
    )
    :vars
    (
      ?auto_515604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515603 ?auto_515604 ) ( ON-TABLE ?auto_515597 ) ( ON ?auto_515598 ?auto_515597 ) ( ON ?auto_515599 ?auto_515598 ) ( ON ?auto_515600 ?auto_515599 ) ( not ( = ?auto_515597 ?auto_515598 ) ) ( not ( = ?auto_515597 ?auto_515599 ) ) ( not ( = ?auto_515597 ?auto_515600 ) ) ( not ( = ?auto_515597 ?auto_515601 ) ) ( not ( = ?auto_515597 ?auto_515602 ) ) ( not ( = ?auto_515597 ?auto_515603 ) ) ( not ( = ?auto_515597 ?auto_515604 ) ) ( not ( = ?auto_515598 ?auto_515599 ) ) ( not ( = ?auto_515598 ?auto_515600 ) ) ( not ( = ?auto_515598 ?auto_515601 ) ) ( not ( = ?auto_515598 ?auto_515602 ) ) ( not ( = ?auto_515598 ?auto_515603 ) ) ( not ( = ?auto_515598 ?auto_515604 ) ) ( not ( = ?auto_515599 ?auto_515600 ) ) ( not ( = ?auto_515599 ?auto_515601 ) ) ( not ( = ?auto_515599 ?auto_515602 ) ) ( not ( = ?auto_515599 ?auto_515603 ) ) ( not ( = ?auto_515599 ?auto_515604 ) ) ( not ( = ?auto_515600 ?auto_515601 ) ) ( not ( = ?auto_515600 ?auto_515602 ) ) ( not ( = ?auto_515600 ?auto_515603 ) ) ( not ( = ?auto_515600 ?auto_515604 ) ) ( not ( = ?auto_515601 ?auto_515602 ) ) ( not ( = ?auto_515601 ?auto_515603 ) ) ( not ( = ?auto_515601 ?auto_515604 ) ) ( not ( = ?auto_515602 ?auto_515603 ) ) ( not ( = ?auto_515602 ?auto_515604 ) ) ( not ( = ?auto_515603 ?auto_515604 ) ) ( ON ?auto_515602 ?auto_515603 ) ( CLEAR ?auto_515600 ) ( ON ?auto_515601 ?auto_515602 ) ( CLEAR ?auto_515601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_515597 ?auto_515598 ?auto_515599 ?auto_515600 ?auto_515601 )
      ( MAKE-7PILE ?auto_515597 ?auto_515598 ?auto_515599 ?auto_515600 ?auto_515601 ?auto_515602 ?auto_515603 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_515627 - BLOCK
      ?auto_515628 - BLOCK
      ?auto_515629 - BLOCK
      ?auto_515630 - BLOCK
      ?auto_515631 - BLOCK
      ?auto_515632 - BLOCK
      ?auto_515633 - BLOCK
    )
    :vars
    (
      ?auto_515634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515633 ?auto_515634 ) ( ON-TABLE ?auto_515627 ) ( ON ?auto_515628 ?auto_515627 ) ( ON ?auto_515629 ?auto_515628 ) ( not ( = ?auto_515627 ?auto_515628 ) ) ( not ( = ?auto_515627 ?auto_515629 ) ) ( not ( = ?auto_515627 ?auto_515630 ) ) ( not ( = ?auto_515627 ?auto_515631 ) ) ( not ( = ?auto_515627 ?auto_515632 ) ) ( not ( = ?auto_515627 ?auto_515633 ) ) ( not ( = ?auto_515627 ?auto_515634 ) ) ( not ( = ?auto_515628 ?auto_515629 ) ) ( not ( = ?auto_515628 ?auto_515630 ) ) ( not ( = ?auto_515628 ?auto_515631 ) ) ( not ( = ?auto_515628 ?auto_515632 ) ) ( not ( = ?auto_515628 ?auto_515633 ) ) ( not ( = ?auto_515628 ?auto_515634 ) ) ( not ( = ?auto_515629 ?auto_515630 ) ) ( not ( = ?auto_515629 ?auto_515631 ) ) ( not ( = ?auto_515629 ?auto_515632 ) ) ( not ( = ?auto_515629 ?auto_515633 ) ) ( not ( = ?auto_515629 ?auto_515634 ) ) ( not ( = ?auto_515630 ?auto_515631 ) ) ( not ( = ?auto_515630 ?auto_515632 ) ) ( not ( = ?auto_515630 ?auto_515633 ) ) ( not ( = ?auto_515630 ?auto_515634 ) ) ( not ( = ?auto_515631 ?auto_515632 ) ) ( not ( = ?auto_515631 ?auto_515633 ) ) ( not ( = ?auto_515631 ?auto_515634 ) ) ( not ( = ?auto_515632 ?auto_515633 ) ) ( not ( = ?auto_515632 ?auto_515634 ) ) ( not ( = ?auto_515633 ?auto_515634 ) ) ( ON ?auto_515632 ?auto_515633 ) ( ON ?auto_515631 ?auto_515632 ) ( CLEAR ?auto_515629 ) ( ON ?auto_515630 ?auto_515631 ) ( CLEAR ?auto_515630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_515627 ?auto_515628 ?auto_515629 ?auto_515630 )
      ( MAKE-7PILE ?auto_515627 ?auto_515628 ?auto_515629 ?auto_515630 ?auto_515631 ?auto_515632 ?auto_515633 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_515657 - BLOCK
      ?auto_515658 - BLOCK
      ?auto_515659 - BLOCK
      ?auto_515660 - BLOCK
      ?auto_515661 - BLOCK
      ?auto_515662 - BLOCK
      ?auto_515663 - BLOCK
    )
    :vars
    (
      ?auto_515664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515663 ?auto_515664 ) ( ON-TABLE ?auto_515657 ) ( ON ?auto_515658 ?auto_515657 ) ( not ( = ?auto_515657 ?auto_515658 ) ) ( not ( = ?auto_515657 ?auto_515659 ) ) ( not ( = ?auto_515657 ?auto_515660 ) ) ( not ( = ?auto_515657 ?auto_515661 ) ) ( not ( = ?auto_515657 ?auto_515662 ) ) ( not ( = ?auto_515657 ?auto_515663 ) ) ( not ( = ?auto_515657 ?auto_515664 ) ) ( not ( = ?auto_515658 ?auto_515659 ) ) ( not ( = ?auto_515658 ?auto_515660 ) ) ( not ( = ?auto_515658 ?auto_515661 ) ) ( not ( = ?auto_515658 ?auto_515662 ) ) ( not ( = ?auto_515658 ?auto_515663 ) ) ( not ( = ?auto_515658 ?auto_515664 ) ) ( not ( = ?auto_515659 ?auto_515660 ) ) ( not ( = ?auto_515659 ?auto_515661 ) ) ( not ( = ?auto_515659 ?auto_515662 ) ) ( not ( = ?auto_515659 ?auto_515663 ) ) ( not ( = ?auto_515659 ?auto_515664 ) ) ( not ( = ?auto_515660 ?auto_515661 ) ) ( not ( = ?auto_515660 ?auto_515662 ) ) ( not ( = ?auto_515660 ?auto_515663 ) ) ( not ( = ?auto_515660 ?auto_515664 ) ) ( not ( = ?auto_515661 ?auto_515662 ) ) ( not ( = ?auto_515661 ?auto_515663 ) ) ( not ( = ?auto_515661 ?auto_515664 ) ) ( not ( = ?auto_515662 ?auto_515663 ) ) ( not ( = ?auto_515662 ?auto_515664 ) ) ( not ( = ?auto_515663 ?auto_515664 ) ) ( ON ?auto_515662 ?auto_515663 ) ( ON ?auto_515661 ?auto_515662 ) ( ON ?auto_515660 ?auto_515661 ) ( CLEAR ?auto_515658 ) ( ON ?auto_515659 ?auto_515660 ) ( CLEAR ?auto_515659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_515657 ?auto_515658 ?auto_515659 )
      ( MAKE-7PILE ?auto_515657 ?auto_515658 ?auto_515659 ?auto_515660 ?auto_515661 ?auto_515662 ?auto_515663 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_515687 - BLOCK
      ?auto_515688 - BLOCK
      ?auto_515689 - BLOCK
      ?auto_515690 - BLOCK
      ?auto_515691 - BLOCK
      ?auto_515692 - BLOCK
      ?auto_515693 - BLOCK
    )
    :vars
    (
      ?auto_515694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515693 ?auto_515694 ) ( ON-TABLE ?auto_515687 ) ( not ( = ?auto_515687 ?auto_515688 ) ) ( not ( = ?auto_515687 ?auto_515689 ) ) ( not ( = ?auto_515687 ?auto_515690 ) ) ( not ( = ?auto_515687 ?auto_515691 ) ) ( not ( = ?auto_515687 ?auto_515692 ) ) ( not ( = ?auto_515687 ?auto_515693 ) ) ( not ( = ?auto_515687 ?auto_515694 ) ) ( not ( = ?auto_515688 ?auto_515689 ) ) ( not ( = ?auto_515688 ?auto_515690 ) ) ( not ( = ?auto_515688 ?auto_515691 ) ) ( not ( = ?auto_515688 ?auto_515692 ) ) ( not ( = ?auto_515688 ?auto_515693 ) ) ( not ( = ?auto_515688 ?auto_515694 ) ) ( not ( = ?auto_515689 ?auto_515690 ) ) ( not ( = ?auto_515689 ?auto_515691 ) ) ( not ( = ?auto_515689 ?auto_515692 ) ) ( not ( = ?auto_515689 ?auto_515693 ) ) ( not ( = ?auto_515689 ?auto_515694 ) ) ( not ( = ?auto_515690 ?auto_515691 ) ) ( not ( = ?auto_515690 ?auto_515692 ) ) ( not ( = ?auto_515690 ?auto_515693 ) ) ( not ( = ?auto_515690 ?auto_515694 ) ) ( not ( = ?auto_515691 ?auto_515692 ) ) ( not ( = ?auto_515691 ?auto_515693 ) ) ( not ( = ?auto_515691 ?auto_515694 ) ) ( not ( = ?auto_515692 ?auto_515693 ) ) ( not ( = ?auto_515692 ?auto_515694 ) ) ( not ( = ?auto_515693 ?auto_515694 ) ) ( ON ?auto_515692 ?auto_515693 ) ( ON ?auto_515691 ?auto_515692 ) ( ON ?auto_515690 ?auto_515691 ) ( ON ?auto_515689 ?auto_515690 ) ( CLEAR ?auto_515687 ) ( ON ?auto_515688 ?auto_515689 ) ( CLEAR ?auto_515688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_515687 ?auto_515688 )
      ( MAKE-7PILE ?auto_515687 ?auto_515688 ?auto_515689 ?auto_515690 ?auto_515691 ?auto_515692 ?auto_515693 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_515717 - BLOCK
      ?auto_515718 - BLOCK
      ?auto_515719 - BLOCK
      ?auto_515720 - BLOCK
      ?auto_515721 - BLOCK
      ?auto_515722 - BLOCK
      ?auto_515723 - BLOCK
    )
    :vars
    (
      ?auto_515724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515723 ?auto_515724 ) ( not ( = ?auto_515717 ?auto_515718 ) ) ( not ( = ?auto_515717 ?auto_515719 ) ) ( not ( = ?auto_515717 ?auto_515720 ) ) ( not ( = ?auto_515717 ?auto_515721 ) ) ( not ( = ?auto_515717 ?auto_515722 ) ) ( not ( = ?auto_515717 ?auto_515723 ) ) ( not ( = ?auto_515717 ?auto_515724 ) ) ( not ( = ?auto_515718 ?auto_515719 ) ) ( not ( = ?auto_515718 ?auto_515720 ) ) ( not ( = ?auto_515718 ?auto_515721 ) ) ( not ( = ?auto_515718 ?auto_515722 ) ) ( not ( = ?auto_515718 ?auto_515723 ) ) ( not ( = ?auto_515718 ?auto_515724 ) ) ( not ( = ?auto_515719 ?auto_515720 ) ) ( not ( = ?auto_515719 ?auto_515721 ) ) ( not ( = ?auto_515719 ?auto_515722 ) ) ( not ( = ?auto_515719 ?auto_515723 ) ) ( not ( = ?auto_515719 ?auto_515724 ) ) ( not ( = ?auto_515720 ?auto_515721 ) ) ( not ( = ?auto_515720 ?auto_515722 ) ) ( not ( = ?auto_515720 ?auto_515723 ) ) ( not ( = ?auto_515720 ?auto_515724 ) ) ( not ( = ?auto_515721 ?auto_515722 ) ) ( not ( = ?auto_515721 ?auto_515723 ) ) ( not ( = ?auto_515721 ?auto_515724 ) ) ( not ( = ?auto_515722 ?auto_515723 ) ) ( not ( = ?auto_515722 ?auto_515724 ) ) ( not ( = ?auto_515723 ?auto_515724 ) ) ( ON ?auto_515722 ?auto_515723 ) ( ON ?auto_515721 ?auto_515722 ) ( ON ?auto_515720 ?auto_515721 ) ( ON ?auto_515719 ?auto_515720 ) ( ON ?auto_515718 ?auto_515719 ) ( ON ?auto_515717 ?auto_515718 ) ( CLEAR ?auto_515717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515717 )
      ( MAKE-7PILE ?auto_515717 ?auto_515718 ?auto_515719 ?auto_515720 ?auto_515721 ?auto_515722 ?auto_515723 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515748 - BLOCK
      ?auto_515749 - BLOCK
      ?auto_515750 - BLOCK
      ?auto_515751 - BLOCK
      ?auto_515752 - BLOCK
      ?auto_515753 - BLOCK
      ?auto_515754 - BLOCK
      ?auto_515755 - BLOCK
    )
    :vars
    (
      ?auto_515756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_515754 ) ( ON ?auto_515755 ?auto_515756 ) ( CLEAR ?auto_515755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_515748 ) ( ON ?auto_515749 ?auto_515748 ) ( ON ?auto_515750 ?auto_515749 ) ( ON ?auto_515751 ?auto_515750 ) ( ON ?auto_515752 ?auto_515751 ) ( ON ?auto_515753 ?auto_515752 ) ( ON ?auto_515754 ?auto_515753 ) ( not ( = ?auto_515748 ?auto_515749 ) ) ( not ( = ?auto_515748 ?auto_515750 ) ) ( not ( = ?auto_515748 ?auto_515751 ) ) ( not ( = ?auto_515748 ?auto_515752 ) ) ( not ( = ?auto_515748 ?auto_515753 ) ) ( not ( = ?auto_515748 ?auto_515754 ) ) ( not ( = ?auto_515748 ?auto_515755 ) ) ( not ( = ?auto_515748 ?auto_515756 ) ) ( not ( = ?auto_515749 ?auto_515750 ) ) ( not ( = ?auto_515749 ?auto_515751 ) ) ( not ( = ?auto_515749 ?auto_515752 ) ) ( not ( = ?auto_515749 ?auto_515753 ) ) ( not ( = ?auto_515749 ?auto_515754 ) ) ( not ( = ?auto_515749 ?auto_515755 ) ) ( not ( = ?auto_515749 ?auto_515756 ) ) ( not ( = ?auto_515750 ?auto_515751 ) ) ( not ( = ?auto_515750 ?auto_515752 ) ) ( not ( = ?auto_515750 ?auto_515753 ) ) ( not ( = ?auto_515750 ?auto_515754 ) ) ( not ( = ?auto_515750 ?auto_515755 ) ) ( not ( = ?auto_515750 ?auto_515756 ) ) ( not ( = ?auto_515751 ?auto_515752 ) ) ( not ( = ?auto_515751 ?auto_515753 ) ) ( not ( = ?auto_515751 ?auto_515754 ) ) ( not ( = ?auto_515751 ?auto_515755 ) ) ( not ( = ?auto_515751 ?auto_515756 ) ) ( not ( = ?auto_515752 ?auto_515753 ) ) ( not ( = ?auto_515752 ?auto_515754 ) ) ( not ( = ?auto_515752 ?auto_515755 ) ) ( not ( = ?auto_515752 ?auto_515756 ) ) ( not ( = ?auto_515753 ?auto_515754 ) ) ( not ( = ?auto_515753 ?auto_515755 ) ) ( not ( = ?auto_515753 ?auto_515756 ) ) ( not ( = ?auto_515754 ?auto_515755 ) ) ( not ( = ?auto_515754 ?auto_515756 ) ) ( not ( = ?auto_515755 ?auto_515756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_515755 ?auto_515756 )
      ( !STACK ?auto_515755 ?auto_515754 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515782 - BLOCK
      ?auto_515783 - BLOCK
      ?auto_515784 - BLOCK
      ?auto_515785 - BLOCK
      ?auto_515786 - BLOCK
      ?auto_515787 - BLOCK
      ?auto_515788 - BLOCK
      ?auto_515789 - BLOCK
    )
    :vars
    (
      ?auto_515790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515789 ?auto_515790 ) ( ON-TABLE ?auto_515782 ) ( ON ?auto_515783 ?auto_515782 ) ( ON ?auto_515784 ?auto_515783 ) ( ON ?auto_515785 ?auto_515784 ) ( ON ?auto_515786 ?auto_515785 ) ( ON ?auto_515787 ?auto_515786 ) ( not ( = ?auto_515782 ?auto_515783 ) ) ( not ( = ?auto_515782 ?auto_515784 ) ) ( not ( = ?auto_515782 ?auto_515785 ) ) ( not ( = ?auto_515782 ?auto_515786 ) ) ( not ( = ?auto_515782 ?auto_515787 ) ) ( not ( = ?auto_515782 ?auto_515788 ) ) ( not ( = ?auto_515782 ?auto_515789 ) ) ( not ( = ?auto_515782 ?auto_515790 ) ) ( not ( = ?auto_515783 ?auto_515784 ) ) ( not ( = ?auto_515783 ?auto_515785 ) ) ( not ( = ?auto_515783 ?auto_515786 ) ) ( not ( = ?auto_515783 ?auto_515787 ) ) ( not ( = ?auto_515783 ?auto_515788 ) ) ( not ( = ?auto_515783 ?auto_515789 ) ) ( not ( = ?auto_515783 ?auto_515790 ) ) ( not ( = ?auto_515784 ?auto_515785 ) ) ( not ( = ?auto_515784 ?auto_515786 ) ) ( not ( = ?auto_515784 ?auto_515787 ) ) ( not ( = ?auto_515784 ?auto_515788 ) ) ( not ( = ?auto_515784 ?auto_515789 ) ) ( not ( = ?auto_515784 ?auto_515790 ) ) ( not ( = ?auto_515785 ?auto_515786 ) ) ( not ( = ?auto_515785 ?auto_515787 ) ) ( not ( = ?auto_515785 ?auto_515788 ) ) ( not ( = ?auto_515785 ?auto_515789 ) ) ( not ( = ?auto_515785 ?auto_515790 ) ) ( not ( = ?auto_515786 ?auto_515787 ) ) ( not ( = ?auto_515786 ?auto_515788 ) ) ( not ( = ?auto_515786 ?auto_515789 ) ) ( not ( = ?auto_515786 ?auto_515790 ) ) ( not ( = ?auto_515787 ?auto_515788 ) ) ( not ( = ?auto_515787 ?auto_515789 ) ) ( not ( = ?auto_515787 ?auto_515790 ) ) ( not ( = ?auto_515788 ?auto_515789 ) ) ( not ( = ?auto_515788 ?auto_515790 ) ) ( not ( = ?auto_515789 ?auto_515790 ) ) ( CLEAR ?auto_515787 ) ( ON ?auto_515788 ?auto_515789 ) ( CLEAR ?auto_515788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_515782 ?auto_515783 ?auto_515784 ?auto_515785 ?auto_515786 ?auto_515787 ?auto_515788 )
      ( MAKE-8PILE ?auto_515782 ?auto_515783 ?auto_515784 ?auto_515785 ?auto_515786 ?auto_515787 ?auto_515788 ?auto_515789 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515816 - BLOCK
      ?auto_515817 - BLOCK
      ?auto_515818 - BLOCK
      ?auto_515819 - BLOCK
      ?auto_515820 - BLOCK
      ?auto_515821 - BLOCK
      ?auto_515822 - BLOCK
      ?auto_515823 - BLOCK
    )
    :vars
    (
      ?auto_515824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515823 ?auto_515824 ) ( ON-TABLE ?auto_515816 ) ( ON ?auto_515817 ?auto_515816 ) ( ON ?auto_515818 ?auto_515817 ) ( ON ?auto_515819 ?auto_515818 ) ( ON ?auto_515820 ?auto_515819 ) ( not ( = ?auto_515816 ?auto_515817 ) ) ( not ( = ?auto_515816 ?auto_515818 ) ) ( not ( = ?auto_515816 ?auto_515819 ) ) ( not ( = ?auto_515816 ?auto_515820 ) ) ( not ( = ?auto_515816 ?auto_515821 ) ) ( not ( = ?auto_515816 ?auto_515822 ) ) ( not ( = ?auto_515816 ?auto_515823 ) ) ( not ( = ?auto_515816 ?auto_515824 ) ) ( not ( = ?auto_515817 ?auto_515818 ) ) ( not ( = ?auto_515817 ?auto_515819 ) ) ( not ( = ?auto_515817 ?auto_515820 ) ) ( not ( = ?auto_515817 ?auto_515821 ) ) ( not ( = ?auto_515817 ?auto_515822 ) ) ( not ( = ?auto_515817 ?auto_515823 ) ) ( not ( = ?auto_515817 ?auto_515824 ) ) ( not ( = ?auto_515818 ?auto_515819 ) ) ( not ( = ?auto_515818 ?auto_515820 ) ) ( not ( = ?auto_515818 ?auto_515821 ) ) ( not ( = ?auto_515818 ?auto_515822 ) ) ( not ( = ?auto_515818 ?auto_515823 ) ) ( not ( = ?auto_515818 ?auto_515824 ) ) ( not ( = ?auto_515819 ?auto_515820 ) ) ( not ( = ?auto_515819 ?auto_515821 ) ) ( not ( = ?auto_515819 ?auto_515822 ) ) ( not ( = ?auto_515819 ?auto_515823 ) ) ( not ( = ?auto_515819 ?auto_515824 ) ) ( not ( = ?auto_515820 ?auto_515821 ) ) ( not ( = ?auto_515820 ?auto_515822 ) ) ( not ( = ?auto_515820 ?auto_515823 ) ) ( not ( = ?auto_515820 ?auto_515824 ) ) ( not ( = ?auto_515821 ?auto_515822 ) ) ( not ( = ?auto_515821 ?auto_515823 ) ) ( not ( = ?auto_515821 ?auto_515824 ) ) ( not ( = ?auto_515822 ?auto_515823 ) ) ( not ( = ?auto_515822 ?auto_515824 ) ) ( not ( = ?auto_515823 ?auto_515824 ) ) ( ON ?auto_515822 ?auto_515823 ) ( CLEAR ?auto_515820 ) ( ON ?auto_515821 ?auto_515822 ) ( CLEAR ?auto_515821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_515816 ?auto_515817 ?auto_515818 ?auto_515819 ?auto_515820 ?auto_515821 )
      ( MAKE-8PILE ?auto_515816 ?auto_515817 ?auto_515818 ?auto_515819 ?auto_515820 ?auto_515821 ?auto_515822 ?auto_515823 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515850 - BLOCK
      ?auto_515851 - BLOCK
      ?auto_515852 - BLOCK
      ?auto_515853 - BLOCK
      ?auto_515854 - BLOCK
      ?auto_515855 - BLOCK
      ?auto_515856 - BLOCK
      ?auto_515857 - BLOCK
    )
    :vars
    (
      ?auto_515858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515857 ?auto_515858 ) ( ON-TABLE ?auto_515850 ) ( ON ?auto_515851 ?auto_515850 ) ( ON ?auto_515852 ?auto_515851 ) ( ON ?auto_515853 ?auto_515852 ) ( not ( = ?auto_515850 ?auto_515851 ) ) ( not ( = ?auto_515850 ?auto_515852 ) ) ( not ( = ?auto_515850 ?auto_515853 ) ) ( not ( = ?auto_515850 ?auto_515854 ) ) ( not ( = ?auto_515850 ?auto_515855 ) ) ( not ( = ?auto_515850 ?auto_515856 ) ) ( not ( = ?auto_515850 ?auto_515857 ) ) ( not ( = ?auto_515850 ?auto_515858 ) ) ( not ( = ?auto_515851 ?auto_515852 ) ) ( not ( = ?auto_515851 ?auto_515853 ) ) ( not ( = ?auto_515851 ?auto_515854 ) ) ( not ( = ?auto_515851 ?auto_515855 ) ) ( not ( = ?auto_515851 ?auto_515856 ) ) ( not ( = ?auto_515851 ?auto_515857 ) ) ( not ( = ?auto_515851 ?auto_515858 ) ) ( not ( = ?auto_515852 ?auto_515853 ) ) ( not ( = ?auto_515852 ?auto_515854 ) ) ( not ( = ?auto_515852 ?auto_515855 ) ) ( not ( = ?auto_515852 ?auto_515856 ) ) ( not ( = ?auto_515852 ?auto_515857 ) ) ( not ( = ?auto_515852 ?auto_515858 ) ) ( not ( = ?auto_515853 ?auto_515854 ) ) ( not ( = ?auto_515853 ?auto_515855 ) ) ( not ( = ?auto_515853 ?auto_515856 ) ) ( not ( = ?auto_515853 ?auto_515857 ) ) ( not ( = ?auto_515853 ?auto_515858 ) ) ( not ( = ?auto_515854 ?auto_515855 ) ) ( not ( = ?auto_515854 ?auto_515856 ) ) ( not ( = ?auto_515854 ?auto_515857 ) ) ( not ( = ?auto_515854 ?auto_515858 ) ) ( not ( = ?auto_515855 ?auto_515856 ) ) ( not ( = ?auto_515855 ?auto_515857 ) ) ( not ( = ?auto_515855 ?auto_515858 ) ) ( not ( = ?auto_515856 ?auto_515857 ) ) ( not ( = ?auto_515856 ?auto_515858 ) ) ( not ( = ?auto_515857 ?auto_515858 ) ) ( ON ?auto_515856 ?auto_515857 ) ( ON ?auto_515855 ?auto_515856 ) ( CLEAR ?auto_515853 ) ( ON ?auto_515854 ?auto_515855 ) ( CLEAR ?auto_515854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_515850 ?auto_515851 ?auto_515852 ?auto_515853 ?auto_515854 )
      ( MAKE-8PILE ?auto_515850 ?auto_515851 ?auto_515852 ?auto_515853 ?auto_515854 ?auto_515855 ?auto_515856 ?auto_515857 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515884 - BLOCK
      ?auto_515885 - BLOCK
      ?auto_515886 - BLOCK
      ?auto_515887 - BLOCK
      ?auto_515888 - BLOCK
      ?auto_515889 - BLOCK
      ?auto_515890 - BLOCK
      ?auto_515891 - BLOCK
    )
    :vars
    (
      ?auto_515892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515891 ?auto_515892 ) ( ON-TABLE ?auto_515884 ) ( ON ?auto_515885 ?auto_515884 ) ( ON ?auto_515886 ?auto_515885 ) ( not ( = ?auto_515884 ?auto_515885 ) ) ( not ( = ?auto_515884 ?auto_515886 ) ) ( not ( = ?auto_515884 ?auto_515887 ) ) ( not ( = ?auto_515884 ?auto_515888 ) ) ( not ( = ?auto_515884 ?auto_515889 ) ) ( not ( = ?auto_515884 ?auto_515890 ) ) ( not ( = ?auto_515884 ?auto_515891 ) ) ( not ( = ?auto_515884 ?auto_515892 ) ) ( not ( = ?auto_515885 ?auto_515886 ) ) ( not ( = ?auto_515885 ?auto_515887 ) ) ( not ( = ?auto_515885 ?auto_515888 ) ) ( not ( = ?auto_515885 ?auto_515889 ) ) ( not ( = ?auto_515885 ?auto_515890 ) ) ( not ( = ?auto_515885 ?auto_515891 ) ) ( not ( = ?auto_515885 ?auto_515892 ) ) ( not ( = ?auto_515886 ?auto_515887 ) ) ( not ( = ?auto_515886 ?auto_515888 ) ) ( not ( = ?auto_515886 ?auto_515889 ) ) ( not ( = ?auto_515886 ?auto_515890 ) ) ( not ( = ?auto_515886 ?auto_515891 ) ) ( not ( = ?auto_515886 ?auto_515892 ) ) ( not ( = ?auto_515887 ?auto_515888 ) ) ( not ( = ?auto_515887 ?auto_515889 ) ) ( not ( = ?auto_515887 ?auto_515890 ) ) ( not ( = ?auto_515887 ?auto_515891 ) ) ( not ( = ?auto_515887 ?auto_515892 ) ) ( not ( = ?auto_515888 ?auto_515889 ) ) ( not ( = ?auto_515888 ?auto_515890 ) ) ( not ( = ?auto_515888 ?auto_515891 ) ) ( not ( = ?auto_515888 ?auto_515892 ) ) ( not ( = ?auto_515889 ?auto_515890 ) ) ( not ( = ?auto_515889 ?auto_515891 ) ) ( not ( = ?auto_515889 ?auto_515892 ) ) ( not ( = ?auto_515890 ?auto_515891 ) ) ( not ( = ?auto_515890 ?auto_515892 ) ) ( not ( = ?auto_515891 ?auto_515892 ) ) ( ON ?auto_515890 ?auto_515891 ) ( ON ?auto_515889 ?auto_515890 ) ( ON ?auto_515888 ?auto_515889 ) ( CLEAR ?auto_515886 ) ( ON ?auto_515887 ?auto_515888 ) ( CLEAR ?auto_515887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_515884 ?auto_515885 ?auto_515886 ?auto_515887 )
      ( MAKE-8PILE ?auto_515884 ?auto_515885 ?auto_515886 ?auto_515887 ?auto_515888 ?auto_515889 ?auto_515890 ?auto_515891 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515918 - BLOCK
      ?auto_515919 - BLOCK
      ?auto_515920 - BLOCK
      ?auto_515921 - BLOCK
      ?auto_515922 - BLOCK
      ?auto_515923 - BLOCK
      ?auto_515924 - BLOCK
      ?auto_515925 - BLOCK
    )
    :vars
    (
      ?auto_515926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515925 ?auto_515926 ) ( ON-TABLE ?auto_515918 ) ( ON ?auto_515919 ?auto_515918 ) ( not ( = ?auto_515918 ?auto_515919 ) ) ( not ( = ?auto_515918 ?auto_515920 ) ) ( not ( = ?auto_515918 ?auto_515921 ) ) ( not ( = ?auto_515918 ?auto_515922 ) ) ( not ( = ?auto_515918 ?auto_515923 ) ) ( not ( = ?auto_515918 ?auto_515924 ) ) ( not ( = ?auto_515918 ?auto_515925 ) ) ( not ( = ?auto_515918 ?auto_515926 ) ) ( not ( = ?auto_515919 ?auto_515920 ) ) ( not ( = ?auto_515919 ?auto_515921 ) ) ( not ( = ?auto_515919 ?auto_515922 ) ) ( not ( = ?auto_515919 ?auto_515923 ) ) ( not ( = ?auto_515919 ?auto_515924 ) ) ( not ( = ?auto_515919 ?auto_515925 ) ) ( not ( = ?auto_515919 ?auto_515926 ) ) ( not ( = ?auto_515920 ?auto_515921 ) ) ( not ( = ?auto_515920 ?auto_515922 ) ) ( not ( = ?auto_515920 ?auto_515923 ) ) ( not ( = ?auto_515920 ?auto_515924 ) ) ( not ( = ?auto_515920 ?auto_515925 ) ) ( not ( = ?auto_515920 ?auto_515926 ) ) ( not ( = ?auto_515921 ?auto_515922 ) ) ( not ( = ?auto_515921 ?auto_515923 ) ) ( not ( = ?auto_515921 ?auto_515924 ) ) ( not ( = ?auto_515921 ?auto_515925 ) ) ( not ( = ?auto_515921 ?auto_515926 ) ) ( not ( = ?auto_515922 ?auto_515923 ) ) ( not ( = ?auto_515922 ?auto_515924 ) ) ( not ( = ?auto_515922 ?auto_515925 ) ) ( not ( = ?auto_515922 ?auto_515926 ) ) ( not ( = ?auto_515923 ?auto_515924 ) ) ( not ( = ?auto_515923 ?auto_515925 ) ) ( not ( = ?auto_515923 ?auto_515926 ) ) ( not ( = ?auto_515924 ?auto_515925 ) ) ( not ( = ?auto_515924 ?auto_515926 ) ) ( not ( = ?auto_515925 ?auto_515926 ) ) ( ON ?auto_515924 ?auto_515925 ) ( ON ?auto_515923 ?auto_515924 ) ( ON ?auto_515922 ?auto_515923 ) ( ON ?auto_515921 ?auto_515922 ) ( CLEAR ?auto_515919 ) ( ON ?auto_515920 ?auto_515921 ) ( CLEAR ?auto_515920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_515918 ?auto_515919 ?auto_515920 )
      ( MAKE-8PILE ?auto_515918 ?auto_515919 ?auto_515920 ?auto_515921 ?auto_515922 ?auto_515923 ?auto_515924 ?auto_515925 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515952 - BLOCK
      ?auto_515953 - BLOCK
      ?auto_515954 - BLOCK
      ?auto_515955 - BLOCK
      ?auto_515956 - BLOCK
      ?auto_515957 - BLOCK
      ?auto_515958 - BLOCK
      ?auto_515959 - BLOCK
    )
    :vars
    (
      ?auto_515960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515959 ?auto_515960 ) ( ON-TABLE ?auto_515952 ) ( not ( = ?auto_515952 ?auto_515953 ) ) ( not ( = ?auto_515952 ?auto_515954 ) ) ( not ( = ?auto_515952 ?auto_515955 ) ) ( not ( = ?auto_515952 ?auto_515956 ) ) ( not ( = ?auto_515952 ?auto_515957 ) ) ( not ( = ?auto_515952 ?auto_515958 ) ) ( not ( = ?auto_515952 ?auto_515959 ) ) ( not ( = ?auto_515952 ?auto_515960 ) ) ( not ( = ?auto_515953 ?auto_515954 ) ) ( not ( = ?auto_515953 ?auto_515955 ) ) ( not ( = ?auto_515953 ?auto_515956 ) ) ( not ( = ?auto_515953 ?auto_515957 ) ) ( not ( = ?auto_515953 ?auto_515958 ) ) ( not ( = ?auto_515953 ?auto_515959 ) ) ( not ( = ?auto_515953 ?auto_515960 ) ) ( not ( = ?auto_515954 ?auto_515955 ) ) ( not ( = ?auto_515954 ?auto_515956 ) ) ( not ( = ?auto_515954 ?auto_515957 ) ) ( not ( = ?auto_515954 ?auto_515958 ) ) ( not ( = ?auto_515954 ?auto_515959 ) ) ( not ( = ?auto_515954 ?auto_515960 ) ) ( not ( = ?auto_515955 ?auto_515956 ) ) ( not ( = ?auto_515955 ?auto_515957 ) ) ( not ( = ?auto_515955 ?auto_515958 ) ) ( not ( = ?auto_515955 ?auto_515959 ) ) ( not ( = ?auto_515955 ?auto_515960 ) ) ( not ( = ?auto_515956 ?auto_515957 ) ) ( not ( = ?auto_515956 ?auto_515958 ) ) ( not ( = ?auto_515956 ?auto_515959 ) ) ( not ( = ?auto_515956 ?auto_515960 ) ) ( not ( = ?auto_515957 ?auto_515958 ) ) ( not ( = ?auto_515957 ?auto_515959 ) ) ( not ( = ?auto_515957 ?auto_515960 ) ) ( not ( = ?auto_515958 ?auto_515959 ) ) ( not ( = ?auto_515958 ?auto_515960 ) ) ( not ( = ?auto_515959 ?auto_515960 ) ) ( ON ?auto_515958 ?auto_515959 ) ( ON ?auto_515957 ?auto_515958 ) ( ON ?auto_515956 ?auto_515957 ) ( ON ?auto_515955 ?auto_515956 ) ( ON ?auto_515954 ?auto_515955 ) ( CLEAR ?auto_515952 ) ( ON ?auto_515953 ?auto_515954 ) ( CLEAR ?auto_515953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_515952 ?auto_515953 )
      ( MAKE-8PILE ?auto_515952 ?auto_515953 ?auto_515954 ?auto_515955 ?auto_515956 ?auto_515957 ?auto_515958 ?auto_515959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_515986 - BLOCK
      ?auto_515987 - BLOCK
      ?auto_515988 - BLOCK
      ?auto_515989 - BLOCK
      ?auto_515990 - BLOCK
      ?auto_515991 - BLOCK
      ?auto_515992 - BLOCK
      ?auto_515993 - BLOCK
    )
    :vars
    (
      ?auto_515994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_515993 ?auto_515994 ) ( not ( = ?auto_515986 ?auto_515987 ) ) ( not ( = ?auto_515986 ?auto_515988 ) ) ( not ( = ?auto_515986 ?auto_515989 ) ) ( not ( = ?auto_515986 ?auto_515990 ) ) ( not ( = ?auto_515986 ?auto_515991 ) ) ( not ( = ?auto_515986 ?auto_515992 ) ) ( not ( = ?auto_515986 ?auto_515993 ) ) ( not ( = ?auto_515986 ?auto_515994 ) ) ( not ( = ?auto_515987 ?auto_515988 ) ) ( not ( = ?auto_515987 ?auto_515989 ) ) ( not ( = ?auto_515987 ?auto_515990 ) ) ( not ( = ?auto_515987 ?auto_515991 ) ) ( not ( = ?auto_515987 ?auto_515992 ) ) ( not ( = ?auto_515987 ?auto_515993 ) ) ( not ( = ?auto_515987 ?auto_515994 ) ) ( not ( = ?auto_515988 ?auto_515989 ) ) ( not ( = ?auto_515988 ?auto_515990 ) ) ( not ( = ?auto_515988 ?auto_515991 ) ) ( not ( = ?auto_515988 ?auto_515992 ) ) ( not ( = ?auto_515988 ?auto_515993 ) ) ( not ( = ?auto_515988 ?auto_515994 ) ) ( not ( = ?auto_515989 ?auto_515990 ) ) ( not ( = ?auto_515989 ?auto_515991 ) ) ( not ( = ?auto_515989 ?auto_515992 ) ) ( not ( = ?auto_515989 ?auto_515993 ) ) ( not ( = ?auto_515989 ?auto_515994 ) ) ( not ( = ?auto_515990 ?auto_515991 ) ) ( not ( = ?auto_515990 ?auto_515992 ) ) ( not ( = ?auto_515990 ?auto_515993 ) ) ( not ( = ?auto_515990 ?auto_515994 ) ) ( not ( = ?auto_515991 ?auto_515992 ) ) ( not ( = ?auto_515991 ?auto_515993 ) ) ( not ( = ?auto_515991 ?auto_515994 ) ) ( not ( = ?auto_515992 ?auto_515993 ) ) ( not ( = ?auto_515992 ?auto_515994 ) ) ( not ( = ?auto_515993 ?auto_515994 ) ) ( ON ?auto_515992 ?auto_515993 ) ( ON ?auto_515991 ?auto_515992 ) ( ON ?auto_515990 ?auto_515991 ) ( ON ?auto_515989 ?auto_515990 ) ( ON ?auto_515988 ?auto_515989 ) ( ON ?auto_515987 ?auto_515988 ) ( ON ?auto_515986 ?auto_515987 ) ( CLEAR ?auto_515986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_515986 )
      ( MAKE-8PILE ?auto_515986 ?auto_515987 ?auto_515988 ?auto_515989 ?auto_515990 ?auto_515991 ?auto_515992 ?auto_515993 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516021 - BLOCK
      ?auto_516022 - BLOCK
      ?auto_516023 - BLOCK
      ?auto_516024 - BLOCK
      ?auto_516025 - BLOCK
      ?auto_516026 - BLOCK
      ?auto_516027 - BLOCK
      ?auto_516028 - BLOCK
      ?auto_516029 - BLOCK
    )
    :vars
    (
      ?auto_516030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_516028 ) ( ON ?auto_516029 ?auto_516030 ) ( CLEAR ?auto_516029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_516021 ) ( ON ?auto_516022 ?auto_516021 ) ( ON ?auto_516023 ?auto_516022 ) ( ON ?auto_516024 ?auto_516023 ) ( ON ?auto_516025 ?auto_516024 ) ( ON ?auto_516026 ?auto_516025 ) ( ON ?auto_516027 ?auto_516026 ) ( ON ?auto_516028 ?auto_516027 ) ( not ( = ?auto_516021 ?auto_516022 ) ) ( not ( = ?auto_516021 ?auto_516023 ) ) ( not ( = ?auto_516021 ?auto_516024 ) ) ( not ( = ?auto_516021 ?auto_516025 ) ) ( not ( = ?auto_516021 ?auto_516026 ) ) ( not ( = ?auto_516021 ?auto_516027 ) ) ( not ( = ?auto_516021 ?auto_516028 ) ) ( not ( = ?auto_516021 ?auto_516029 ) ) ( not ( = ?auto_516021 ?auto_516030 ) ) ( not ( = ?auto_516022 ?auto_516023 ) ) ( not ( = ?auto_516022 ?auto_516024 ) ) ( not ( = ?auto_516022 ?auto_516025 ) ) ( not ( = ?auto_516022 ?auto_516026 ) ) ( not ( = ?auto_516022 ?auto_516027 ) ) ( not ( = ?auto_516022 ?auto_516028 ) ) ( not ( = ?auto_516022 ?auto_516029 ) ) ( not ( = ?auto_516022 ?auto_516030 ) ) ( not ( = ?auto_516023 ?auto_516024 ) ) ( not ( = ?auto_516023 ?auto_516025 ) ) ( not ( = ?auto_516023 ?auto_516026 ) ) ( not ( = ?auto_516023 ?auto_516027 ) ) ( not ( = ?auto_516023 ?auto_516028 ) ) ( not ( = ?auto_516023 ?auto_516029 ) ) ( not ( = ?auto_516023 ?auto_516030 ) ) ( not ( = ?auto_516024 ?auto_516025 ) ) ( not ( = ?auto_516024 ?auto_516026 ) ) ( not ( = ?auto_516024 ?auto_516027 ) ) ( not ( = ?auto_516024 ?auto_516028 ) ) ( not ( = ?auto_516024 ?auto_516029 ) ) ( not ( = ?auto_516024 ?auto_516030 ) ) ( not ( = ?auto_516025 ?auto_516026 ) ) ( not ( = ?auto_516025 ?auto_516027 ) ) ( not ( = ?auto_516025 ?auto_516028 ) ) ( not ( = ?auto_516025 ?auto_516029 ) ) ( not ( = ?auto_516025 ?auto_516030 ) ) ( not ( = ?auto_516026 ?auto_516027 ) ) ( not ( = ?auto_516026 ?auto_516028 ) ) ( not ( = ?auto_516026 ?auto_516029 ) ) ( not ( = ?auto_516026 ?auto_516030 ) ) ( not ( = ?auto_516027 ?auto_516028 ) ) ( not ( = ?auto_516027 ?auto_516029 ) ) ( not ( = ?auto_516027 ?auto_516030 ) ) ( not ( = ?auto_516028 ?auto_516029 ) ) ( not ( = ?auto_516028 ?auto_516030 ) ) ( not ( = ?auto_516029 ?auto_516030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_516029 ?auto_516030 )
      ( !STACK ?auto_516029 ?auto_516028 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516059 - BLOCK
      ?auto_516060 - BLOCK
      ?auto_516061 - BLOCK
      ?auto_516062 - BLOCK
      ?auto_516063 - BLOCK
      ?auto_516064 - BLOCK
      ?auto_516065 - BLOCK
      ?auto_516066 - BLOCK
      ?auto_516067 - BLOCK
    )
    :vars
    (
      ?auto_516068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516067 ?auto_516068 ) ( ON-TABLE ?auto_516059 ) ( ON ?auto_516060 ?auto_516059 ) ( ON ?auto_516061 ?auto_516060 ) ( ON ?auto_516062 ?auto_516061 ) ( ON ?auto_516063 ?auto_516062 ) ( ON ?auto_516064 ?auto_516063 ) ( ON ?auto_516065 ?auto_516064 ) ( not ( = ?auto_516059 ?auto_516060 ) ) ( not ( = ?auto_516059 ?auto_516061 ) ) ( not ( = ?auto_516059 ?auto_516062 ) ) ( not ( = ?auto_516059 ?auto_516063 ) ) ( not ( = ?auto_516059 ?auto_516064 ) ) ( not ( = ?auto_516059 ?auto_516065 ) ) ( not ( = ?auto_516059 ?auto_516066 ) ) ( not ( = ?auto_516059 ?auto_516067 ) ) ( not ( = ?auto_516059 ?auto_516068 ) ) ( not ( = ?auto_516060 ?auto_516061 ) ) ( not ( = ?auto_516060 ?auto_516062 ) ) ( not ( = ?auto_516060 ?auto_516063 ) ) ( not ( = ?auto_516060 ?auto_516064 ) ) ( not ( = ?auto_516060 ?auto_516065 ) ) ( not ( = ?auto_516060 ?auto_516066 ) ) ( not ( = ?auto_516060 ?auto_516067 ) ) ( not ( = ?auto_516060 ?auto_516068 ) ) ( not ( = ?auto_516061 ?auto_516062 ) ) ( not ( = ?auto_516061 ?auto_516063 ) ) ( not ( = ?auto_516061 ?auto_516064 ) ) ( not ( = ?auto_516061 ?auto_516065 ) ) ( not ( = ?auto_516061 ?auto_516066 ) ) ( not ( = ?auto_516061 ?auto_516067 ) ) ( not ( = ?auto_516061 ?auto_516068 ) ) ( not ( = ?auto_516062 ?auto_516063 ) ) ( not ( = ?auto_516062 ?auto_516064 ) ) ( not ( = ?auto_516062 ?auto_516065 ) ) ( not ( = ?auto_516062 ?auto_516066 ) ) ( not ( = ?auto_516062 ?auto_516067 ) ) ( not ( = ?auto_516062 ?auto_516068 ) ) ( not ( = ?auto_516063 ?auto_516064 ) ) ( not ( = ?auto_516063 ?auto_516065 ) ) ( not ( = ?auto_516063 ?auto_516066 ) ) ( not ( = ?auto_516063 ?auto_516067 ) ) ( not ( = ?auto_516063 ?auto_516068 ) ) ( not ( = ?auto_516064 ?auto_516065 ) ) ( not ( = ?auto_516064 ?auto_516066 ) ) ( not ( = ?auto_516064 ?auto_516067 ) ) ( not ( = ?auto_516064 ?auto_516068 ) ) ( not ( = ?auto_516065 ?auto_516066 ) ) ( not ( = ?auto_516065 ?auto_516067 ) ) ( not ( = ?auto_516065 ?auto_516068 ) ) ( not ( = ?auto_516066 ?auto_516067 ) ) ( not ( = ?auto_516066 ?auto_516068 ) ) ( not ( = ?auto_516067 ?auto_516068 ) ) ( CLEAR ?auto_516065 ) ( ON ?auto_516066 ?auto_516067 ) ( CLEAR ?auto_516066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_516059 ?auto_516060 ?auto_516061 ?auto_516062 ?auto_516063 ?auto_516064 ?auto_516065 ?auto_516066 )
      ( MAKE-9PILE ?auto_516059 ?auto_516060 ?auto_516061 ?auto_516062 ?auto_516063 ?auto_516064 ?auto_516065 ?auto_516066 ?auto_516067 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516097 - BLOCK
      ?auto_516098 - BLOCK
      ?auto_516099 - BLOCK
      ?auto_516100 - BLOCK
      ?auto_516101 - BLOCK
      ?auto_516102 - BLOCK
      ?auto_516103 - BLOCK
      ?auto_516104 - BLOCK
      ?auto_516105 - BLOCK
    )
    :vars
    (
      ?auto_516106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516105 ?auto_516106 ) ( ON-TABLE ?auto_516097 ) ( ON ?auto_516098 ?auto_516097 ) ( ON ?auto_516099 ?auto_516098 ) ( ON ?auto_516100 ?auto_516099 ) ( ON ?auto_516101 ?auto_516100 ) ( ON ?auto_516102 ?auto_516101 ) ( not ( = ?auto_516097 ?auto_516098 ) ) ( not ( = ?auto_516097 ?auto_516099 ) ) ( not ( = ?auto_516097 ?auto_516100 ) ) ( not ( = ?auto_516097 ?auto_516101 ) ) ( not ( = ?auto_516097 ?auto_516102 ) ) ( not ( = ?auto_516097 ?auto_516103 ) ) ( not ( = ?auto_516097 ?auto_516104 ) ) ( not ( = ?auto_516097 ?auto_516105 ) ) ( not ( = ?auto_516097 ?auto_516106 ) ) ( not ( = ?auto_516098 ?auto_516099 ) ) ( not ( = ?auto_516098 ?auto_516100 ) ) ( not ( = ?auto_516098 ?auto_516101 ) ) ( not ( = ?auto_516098 ?auto_516102 ) ) ( not ( = ?auto_516098 ?auto_516103 ) ) ( not ( = ?auto_516098 ?auto_516104 ) ) ( not ( = ?auto_516098 ?auto_516105 ) ) ( not ( = ?auto_516098 ?auto_516106 ) ) ( not ( = ?auto_516099 ?auto_516100 ) ) ( not ( = ?auto_516099 ?auto_516101 ) ) ( not ( = ?auto_516099 ?auto_516102 ) ) ( not ( = ?auto_516099 ?auto_516103 ) ) ( not ( = ?auto_516099 ?auto_516104 ) ) ( not ( = ?auto_516099 ?auto_516105 ) ) ( not ( = ?auto_516099 ?auto_516106 ) ) ( not ( = ?auto_516100 ?auto_516101 ) ) ( not ( = ?auto_516100 ?auto_516102 ) ) ( not ( = ?auto_516100 ?auto_516103 ) ) ( not ( = ?auto_516100 ?auto_516104 ) ) ( not ( = ?auto_516100 ?auto_516105 ) ) ( not ( = ?auto_516100 ?auto_516106 ) ) ( not ( = ?auto_516101 ?auto_516102 ) ) ( not ( = ?auto_516101 ?auto_516103 ) ) ( not ( = ?auto_516101 ?auto_516104 ) ) ( not ( = ?auto_516101 ?auto_516105 ) ) ( not ( = ?auto_516101 ?auto_516106 ) ) ( not ( = ?auto_516102 ?auto_516103 ) ) ( not ( = ?auto_516102 ?auto_516104 ) ) ( not ( = ?auto_516102 ?auto_516105 ) ) ( not ( = ?auto_516102 ?auto_516106 ) ) ( not ( = ?auto_516103 ?auto_516104 ) ) ( not ( = ?auto_516103 ?auto_516105 ) ) ( not ( = ?auto_516103 ?auto_516106 ) ) ( not ( = ?auto_516104 ?auto_516105 ) ) ( not ( = ?auto_516104 ?auto_516106 ) ) ( not ( = ?auto_516105 ?auto_516106 ) ) ( ON ?auto_516104 ?auto_516105 ) ( CLEAR ?auto_516102 ) ( ON ?auto_516103 ?auto_516104 ) ( CLEAR ?auto_516103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_516097 ?auto_516098 ?auto_516099 ?auto_516100 ?auto_516101 ?auto_516102 ?auto_516103 )
      ( MAKE-9PILE ?auto_516097 ?auto_516098 ?auto_516099 ?auto_516100 ?auto_516101 ?auto_516102 ?auto_516103 ?auto_516104 ?auto_516105 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516135 - BLOCK
      ?auto_516136 - BLOCK
      ?auto_516137 - BLOCK
      ?auto_516138 - BLOCK
      ?auto_516139 - BLOCK
      ?auto_516140 - BLOCK
      ?auto_516141 - BLOCK
      ?auto_516142 - BLOCK
      ?auto_516143 - BLOCK
    )
    :vars
    (
      ?auto_516144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516143 ?auto_516144 ) ( ON-TABLE ?auto_516135 ) ( ON ?auto_516136 ?auto_516135 ) ( ON ?auto_516137 ?auto_516136 ) ( ON ?auto_516138 ?auto_516137 ) ( ON ?auto_516139 ?auto_516138 ) ( not ( = ?auto_516135 ?auto_516136 ) ) ( not ( = ?auto_516135 ?auto_516137 ) ) ( not ( = ?auto_516135 ?auto_516138 ) ) ( not ( = ?auto_516135 ?auto_516139 ) ) ( not ( = ?auto_516135 ?auto_516140 ) ) ( not ( = ?auto_516135 ?auto_516141 ) ) ( not ( = ?auto_516135 ?auto_516142 ) ) ( not ( = ?auto_516135 ?auto_516143 ) ) ( not ( = ?auto_516135 ?auto_516144 ) ) ( not ( = ?auto_516136 ?auto_516137 ) ) ( not ( = ?auto_516136 ?auto_516138 ) ) ( not ( = ?auto_516136 ?auto_516139 ) ) ( not ( = ?auto_516136 ?auto_516140 ) ) ( not ( = ?auto_516136 ?auto_516141 ) ) ( not ( = ?auto_516136 ?auto_516142 ) ) ( not ( = ?auto_516136 ?auto_516143 ) ) ( not ( = ?auto_516136 ?auto_516144 ) ) ( not ( = ?auto_516137 ?auto_516138 ) ) ( not ( = ?auto_516137 ?auto_516139 ) ) ( not ( = ?auto_516137 ?auto_516140 ) ) ( not ( = ?auto_516137 ?auto_516141 ) ) ( not ( = ?auto_516137 ?auto_516142 ) ) ( not ( = ?auto_516137 ?auto_516143 ) ) ( not ( = ?auto_516137 ?auto_516144 ) ) ( not ( = ?auto_516138 ?auto_516139 ) ) ( not ( = ?auto_516138 ?auto_516140 ) ) ( not ( = ?auto_516138 ?auto_516141 ) ) ( not ( = ?auto_516138 ?auto_516142 ) ) ( not ( = ?auto_516138 ?auto_516143 ) ) ( not ( = ?auto_516138 ?auto_516144 ) ) ( not ( = ?auto_516139 ?auto_516140 ) ) ( not ( = ?auto_516139 ?auto_516141 ) ) ( not ( = ?auto_516139 ?auto_516142 ) ) ( not ( = ?auto_516139 ?auto_516143 ) ) ( not ( = ?auto_516139 ?auto_516144 ) ) ( not ( = ?auto_516140 ?auto_516141 ) ) ( not ( = ?auto_516140 ?auto_516142 ) ) ( not ( = ?auto_516140 ?auto_516143 ) ) ( not ( = ?auto_516140 ?auto_516144 ) ) ( not ( = ?auto_516141 ?auto_516142 ) ) ( not ( = ?auto_516141 ?auto_516143 ) ) ( not ( = ?auto_516141 ?auto_516144 ) ) ( not ( = ?auto_516142 ?auto_516143 ) ) ( not ( = ?auto_516142 ?auto_516144 ) ) ( not ( = ?auto_516143 ?auto_516144 ) ) ( ON ?auto_516142 ?auto_516143 ) ( ON ?auto_516141 ?auto_516142 ) ( CLEAR ?auto_516139 ) ( ON ?auto_516140 ?auto_516141 ) ( CLEAR ?auto_516140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_516135 ?auto_516136 ?auto_516137 ?auto_516138 ?auto_516139 ?auto_516140 )
      ( MAKE-9PILE ?auto_516135 ?auto_516136 ?auto_516137 ?auto_516138 ?auto_516139 ?auto_516140 ?auto_516141 ?auto_516142 ?auto_516143 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516173 - BLOCK
      ?auto_516174 - BLOCK
      ?auto_516175 - BLOCK
      ?auto_516176 - BLOCK
      ?auto_516177 - BLOCK
      ?auto_516178 - BLOCK
      ?auto_516179 - BLOCK
      ?auto_516180 - BLOCK
      ?auto_516181 - BLOCK
    )
    :vars
    (
      ?auto_516182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516181 ?auto_516182 ) ( ON-TABLE ?auto_516173 ) ( ON ?auto_516174 ?auto_516173 ) ( ON ?auto_516175 ?auto_516174 ) ( ON ?auto_516176 ?auto_516175 ) ( not ( = ?auto_516173 ?auto_516174 ) ) ( not ( = ?auto_516173 ?auto_516175 ) ) ( not ( = ?auto_516173 ?auto_516176 ) ) ( not ( = ?auto_516173 ?auto_516177 ) ) ( not ( = ?auto_516173 ?auto_516178 ) ) ( not ( = ?auto_516173 ?auto_516179 ) ) ( not ( = ?auto_516173 ?auto_516180 ) ) ( not ( = ?auto_516173 ?auto_516181 ) ) ( not ( = ?auto_516173 ?auto_516182 ) ) ( not ( = ?auto_516174 ?auto_516175 ) ) ( not ( = ?auto_516174 ?auto_516176 ) ) ( not ( = ?auto_516174 ?auto_516177 ) ) ( not ( = ?auto_516174 ?auto_516178 ) ) ( not ( = ?auto_516174 ?auto_516179 ) ) ( not ( = ?auto_516174 ?auto_516180 ) ) ( not ( = ?auto_516174 ?auto_516181 ) ) ( not ( = ?auto_516174 ?auto_516182 ) ) ( not ( = ?auto_516175 ?auto_516176 ) ) ( not ( = ?auto_516175 ?auto_516177 ) ) ( not ( = ?auto_516175 ?auto_516178 ) ) ( not ( = ?auto_516175 ?auto_516179 ) ) ( not ( = ?auto_516175 ?auto_516180 ) ) ( not ( = ?auto_516175 ?auto_516181 ) ) ( not ( = ?auto_516175 ?auto_516182 ) ) ( not ( = ?auto_516176 ?auto_516177 ) ) ( not ( = ?auto_516176 ?auto_516178 ) ) ( not ( = ?auto_516176 ?auto_516179 ) ) ( not ( = ?auto_516176 ?auto_516180 ) ) ( not ( = ?auto_516176 ?auto_516181 ) ) ( not ( = ?auto_516176 ?auto_516182 ) ) ( not ( = ?auto_516177 ?auto_516178 ) ) ( not ( = ?auto_516177 ?auto_516179 ) ) ( not ( = ?auto_516177 ?auto_516180 ) ) ( not ( = ?auto_516177 ?auto_516181 ) ) ( not ( = ?auto_516177 ?auto_516182 ) ) ( not ( = ?auto_516178 ?auto_516179 ) ) ( not ( = ?auto_516178 ?auto_516180 ) ) ( not ( = ?auto_516178 ?auto_516181 ) ) ( not ( = ?auto_516178 ?auto_516182 ) ) ( not ( = ?auto_516179 ?auto_516180 ) ) ( not ( = ?auto_516179 ?auto_516181 ) ) ( not ( = ?auto_516179 ?auto_516182 ) ) ( not ( = ?auto_516180 ?auto_516181 ) ) ( not ( = ?auto_516180 ?auto_516182 ) ) ( not ( = ?auto_516181 ?auto_516182 ) ) ( ON ?auto_516180 ?auto_516181 ) ( ON ?auto_516179 ?auto_516180 ) ( ON ?auto_516178 ?auto_516179 ) ( CLEAR ?auto_516176 ) ( ON ?auto_516177 ?auto_516178 ) ( CLEAR ?auto_516177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_516173 ?auto_516174 ?auto_516175 ?auto_516176 ?auto_516177 )
      ( MAKE-9PILE ?auto_516173 ?auto_516174 ?auto_516175 ?auto_516176 ?auto_516177 ?auto_516178 ?auto_516179 ?auto_516180 ?auto_516181 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516211 - BLOCK
      ?auto_516212 - BLOCK
      ?auto_516213 - BLOCK
      ?auto_516214 - BLOCK
      ?auto_516215 - BLOCK
      ?auto_516216 - BLOCK
      ?auto_516217 - BLOCK
      ?auto_516218 - BLOCK
      ?auto_516219 - BLOCK
    )
    :vars
    (
      ?auto_516220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516219 ?auto_516220 ) ( ON-TABLE ?auto_516211 ) ( ON ?auto_516212 ?auto_516211 ) ( ON ?auto_516213 ?auto_516212 ) ( not ( = ?auto_516211 ?auto_516212 ) ) ( not ( = ?auto_516211 ?auto_516213 ) ) ( not ( = ?auto_516211 ?auto_516214 ) ) ( not ( = ?auto_516211 ?auto_516215 ) ) ( not ( = ?auto_516211 ?auto_516216 ) ) ( not ( = ?auto_516211 ?auto_516217 ) ) ( not ( = ?auto_516211 ?auto_516218 ) ) ( not ( = ?auto_516211 ?auto_516219 ) ) ( not ( = ?auto_516211 ?auto_516220 ) ) ( not ( = ?auto_516212 ?auto_516213 ) ) ( not ( = ?auto_516212 ?auto_516214 ) ) ( not ( = ?auto_516212 ?auto_516215 ) ) ( not ( = ?auto_516212 ?auto_516216 ) ) ( not ( = ?auto_516212 ?auto_516217 ) ) ( not ( = ?auto_516212 ?auto_516218 ) ) ( not ( = ?auto_516212 ?auto_516219 ) ) ( not ( = ?auto_516212 ?auto_516220 ) ) ( not ( = ?auto_516213 ?auto_516214 ) ) ( not ( = ?auto_516213 ?auto_516215 ) ) ( not ( = ?auto_516213 ?auto_516216 ) ) ( not ( = ?auto_516213 ?auto_516217 ) ) ( not ( = ?auto_516213 ?auto_516218 ) ) ( not ( = ?auto_516213 ?auto_516219 ) ) ( not ( = ?auto_516213 ?auto_516220 ) ) ( not ( = ?auto_516214 ?auto_516215 ) ) ( not ( = ?auto_516214 ?auto_516216 ) ) ( not ( = ?auto_516214 ?auto_516217 ) ) ( not ( = ?auto_516214 ?auto_516218 ) ) ( not ( = ?auto_516214 ?auto_516219 ) ) ( not ( = ?auto_516214 ?auto_516220 ) ) ( not ( = ?auto_516215 ?auto_516216 ) ) ( not ( = ?auto_516215 ?auto_516217 ) ) ( not ( = ?auto_516215 ?auto_516218 ) ) ( not ( = ?auto_516215 ?auto_516219 ) ) ( not ( = ?auto_516215 ?auto_516220 ) ) ( not ( = ?auto_516216 ?auto_516217 ) ) ( not ( = ?auto_516216 ?auto_516218 ) ) ( not ( = ?auto_516216 ?auto_516219 ) ) ( not ( = ?auto_516216 ?auto_516220 ) ) ( not ( = ?auto_516217 ?auto_516218 ) ) ( not ( = ?auto_516217 ?auto_516219 ) ) ( not ( = ?auto_516217 ?auto_516220 ) ) ( not ( = ?auto_516218 ?auto_516219 ) ) ( not ( = ?auto_516218 ?auto_516220 ) ) ( not ( = ?auto_516219 ?auto_516220 ) ) ( ON ?auto_516218 ?auto_516219 ) ( ON ?auto_516217 ?auto_516218 ) ( ON ?auto_516216 ?auto_516217 ) ( ON ?auto_516215 ?auto_516216 ) ( CLEAR ?auto_516213 ) ( ON ?auto_516214 ?auto_516215 ) ( CLEAR ?auto_516214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_516211 ?auto_516212 ?auto_516213 ?auto_516214 )
      ( MAKE-9PILE ?auto_516211 ?auto_516212 ?auto_516213 ?auto_516214 ?auto_516215 ?auto_516216 ?auto_516217 ?auto_516218 ?auto_516219 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516249 - BLOCK
      ?auto_516250 - BLOCK
      ?auto_516251 - BLOCK
      ?auto_516252 - BLOCK
      ?auto_516253 - BLOCK
      ?auto_516254 - BLOCK
      ?auto_516255 - BLOCK
      ?auto_516256 - BLOCK
      ?auto_516257 - BLOCK
    )
    :vars
    (
      ?auto_516258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516257 ?auto_516258 ) ( ON-TABLE ?auto_516249 ) ( ON ?auto_516250 ?auto_516249 ) ( not ( = ?auto_516249 ?auto_516250 ) ) ( not ( = ?auto_516249 ?auto_516251 ) ) ( not ( = ?auto_516249 ?auto_516252 ) ) ( not ( = ?auto_516249 ?auto_516253 ) ) ( not ( = ?auto_516249 ?auto_516254 ) ) ( not ( = ?auto_516249 ?auto_516255 ) ) ( not ( = ?auto_516249 ?auto_516256 ) ) ( not ( = ?auto_516249 ?auto_516257 ) ) ( not ( = ?auto_516249 ?auto_516258 ) ) ( not ( = ?auto_516250 ?auto_516251 ) ) ( not ( = ?auto_516250 ?auto_516252 ) ) ( not ( = ?auto_516250 ?auto_516253 ) ) ( not ( = ?auto_516250 ?auto_516254 ) ) ( not ( = ?auto_516250 ?auto_516255 ) ) ( not ( = ?auto_516250 ?auto_516256 ) ) ( not ( = ?auto_516250 ?auto_516257 ) ) ( not ( = ?auto_516250 ?auto_516258 ) ) ( not ( = ?auto_516251 ?auto_516252 ) ) ( not ( = ?auto_516251 ?auto_516253 ) ) ( not ( = ?auto_516251 ?auto_516254 ) ) ( not ( = ?auto_516251 ?auto_516255 ) ) ( not ( = ?auto_516251 ?auto_516256 ) ) ( not ( = ?auto_516251 ?auto_516257 ) ) ( not ( = ?auto_516251 ?auto_516258 ) ) ( not ( = ?auto_516252 ?auto_516253 ) ) ( not ( = ?auto_516252 ?auto_516254 ) ) ( not ( = ?auto_516252 ?auto_516255 ) ) ( not ( = ?auto_516252 ?auto_516256 ) ) ( not ( = ?auto_516252 ?auto_516257 ) ) ( not ( = ?auto_516252 ?auto_516258 ) ) ( not ( = ?auto_516253 ?auto_516254 ) ) ( not ( = ?auto_516253 ?auto_516255 ) ) ( not ( = ?auto_516253 ?auto_516256 ) ) ( not ( = ?auto_516253 ?auto_516257 ) ) ( not ( = ?auto_516253 ?auto_516258 ) ) ( not ( = ?auto_516254 ?auto_516255 ) ) ( not ( = ?auto_516254 ?auto_516256 ) ) ( not ( = ?auto_516254 ?auto_516257 ) ) ( not ( = ?auto_516254 ?auto_516258 ) ) ( not ( = ?auto_516255 ?auto_516256 ) ) ( not ( = ?auto_516255 ?auto_516257 ) ) ( not ( = ?auto_516255 ?auto_516258 ) ) ( not ( = ?auto_516256 ?auto_516257 ) ) ( not ( = ?auto_516256 ?auto_516258 ) ) ( not ( = ?auto_516257 ?auto_516258 ) ) ( ON ?auto_516256 ?auto_516257 ) ( ON ?auto_516255 ?auto_516256 ) ( ON ?auto_516254 ?auto_516255 ) ( ON ?auto_516253 ?auto_516254 ) ( ON ?auto_516252 ?auto_516253 ) ( CLEAR ?auto_516250 ) ( ON ?auto_516251 ?auto_516252 ) ( CLEAR ?auto_516251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_516249 ?auto_516250 ?auto_516251 )
      ( MAKE-9PILE ?auto_516249 ?auto_516250 ?auto_516251 ?auto_516252 ?auto_516253 ?auto_516254 ?auto_516255 ?auto_516256 ?auto_516257 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516287 - BLOCK
      ?auto_516288 - BLOCK
      ?auto_516289 - BLOCK
      ?auto_516290 - BLOCK
      ?auto_516291 - BLOCK
      ?auto_516292 - BLOCK
      ?auto_516293 - BLOCK
      ?auto_516294 - BLOCK
      ?auto_516295 - BLOCK
    )
    :vars
    (
      ?auto_516296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516295 ?auto_516296 ) ( ON-TABLE ?auto_516287 ) ( not ( = ?auto_516287 ?auto_516288 ) ) ( not ( = ?auto_516287 ?auto_516289 ) ) ( not ( = ?auto_516287 ?auto_516290 ) ) ( not ( = ?auto_516287 ?auto_516291 ) ) ( not ( = ?auto_516287 ?auto_516292 ) ) ( not ( = ?auto_516287 ?auto_516293 ) ) ( not ( = ?auto_516287 ?auto_516294 ) ) ( not ( = ?auto_516287 ?auto_516295 ) ) ( not ( = ?auto_516287 ?auto_516296 ) ) ( not ( = ?auto_516288 ?auto_516289 ) ) ( not ( = ?auto_516288 ?auto_516290 ) ) ( not ( = ?auto_516288 ?auto_516291 ) ) ( not ( = ?auto_516288 ?auto_516292 ) ) ( not ( = ?auto_516288 ?auto_516293 ) ) ( not ( = ?auto_516288 ?auto_516294 ) ) ( not ( = ?auto_516288 ?auto_516295 ) ) ( not ( = ?auto_516288 ?auto_516296 ) ) ( not ( = ?auto_516289 ?auto_516290 ) ) ( not ( = ?auto_516289 ?auto_516291 ) ) ( not ( = ?auto_516289 ?auto_516292 ) ) ( not ( = ?auto_516289 ?auto_516293 ) ) ( not ( = ?auto_516289 ?auto_516294 ) ) ( not ( = ?auto_516289 ?auto_516295 ) ) ( not ( = ?auto_516289 ?auto_516296 ) ) ( not ( = ?auto_516290 ?auto_516291 ) ) ( not ( = ?auto_516290 ?auto_516292 ) ) ( not ( = ?auto_516290 ?auto_516293 ) ) ( not ( = ?auto_516290 ?auto_516294 ) ) ( not ( = ?auto_516290 ?auto_516295 ) ) ( not ( = ?auto_516290 ?auto_516296 ) ) ( not ( = ?auto_516291 ?auto_516292 ) ) ( not ( = ?auto_516291 ?auto_516293 ) ) ( not ( = ?auto_516291 ?auto_516294 ) ) ( not ( = ?auto_516291 ?auto_516295 ) ) ( not ( = ?auto_516291 ?auto_516296 ) ) ( not ( = ?auto_516292 ?auto_516293 ) ) ( not ( = ?auto_516292 ?auto_516294 ) ) ( not ( = ?auto_516292 ?auto_516295 ) ) ( not ( = ?auto_516292 ?auto_516296 ) ) ( not ( = ?auto_516293 ?auto_516294 ) ) ( not ( = ?auto_516293 ?auto_516295 ) ) ( not ( = ?auto_516293 ?auto_516296 ) ) ( not ( = ?auto_516294 ?auto_516295 ) ) ( not ( = ?auto_516294 ?auto_516296 ) ) ( not ( = ?auto_516295 ?auto_516296 ) ) ( ON ?auto_516294 ?auto_516295 ) ( ON ?auto_516293 ?auto_516294 ) ( ON ?auto_516292 ?auto_516293 ) ( ON ?auto_516291 ?auto_516292 ) ( ON ?auto_516290 ?auto_516291 ) ( ON ?auto_516289 ?auto_516290 ) ( CLEAR ?auto_516287 ) ( ON ?auto_516288 ?auto_516289 ) ( CLEAR ?auto_516288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_516287 ?auto_516288 )
      ( MAKE-9PILE ?auto_516287 ?auto_516288 ?auto_516289 ?auto_516290 ?auto_516291 ?auto_516292 ?auto_516293 ?auto_516294 ?auto_516295 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_516325 - BLOCK
      ?auto_516326 - BLOCK
      ?auto_516327 - BLOCK
      ?auto_516328 - BLOCK
      ?auto_516329 - BLOCK
      ?auto_516330 - BLOCK
      ?auto_516331 - BLOCK
      ?auto_516332 - BLOCK
      ?auto_516333 - BLOCK
    )
    :vars
    (
      ?auto_516334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516333 ?auto_516334 ) ( not ( = ?auto_516325 ?auto_516326 ) ) ( not ( = ?auto_516325 ?auto_516327 ) ) ( not ( = ?auto_516325 ?auto_516328 ) ) ( not ( = ?auto_516325 ?auto_516329 ) ) ( not ( = ?auto_516325 ?auto_516330 ) ) ( not ( = ?auto_516325 ?auto_516331 ) ) ( not ( = ?auto_516325 ?auto_516332 ) ) ( not ( = ?auto_516325 ?auto_516333 ) ) ( not ( = ?auto_516325 ?auto_516334 ) ) ( not ( = ?auto_516326 ?auto_516327 ) ) ( not ( = ?auto_516326 ?auto_516328 ) ) ( not ( = ?auto_516326 ?auto_516329 ) ) ( not ( = ?auto_516326 ?auto_516330 ) ) ( not ( = ?auto_516326 ?auto_516331 ) ) ( not ( = ?auto_516326 ?auto_516332 ) ) ( not ( = ?auto_516326 ?auto_516333 ) ) ( not ( = ?auto_516326 ?auto_516334 ) ) ( not ( = ?auto_516327 ?auto_516328 ) ) ( not ( = ?auto_516327 ?auto_516329 ) ) ( not ( = ?auto_516327 ?auto_516330 ) ) ( not ( = ?auto_516327 ?auto_516331 ) ) ( not ( = ?auto_516327 ?auto_516332 ) ) ( not ( = ?auto_516327 ?auto_516333 ) ) ( not ( = ?auto_516327 ?auto_516334 ) ) ( not ( = ?auto_516328 ?auto_516329 ) ) ( not ( = ?auto_516328 ?auto_516330 ) ) ( not ( = ?auto_516328 ?auto_516331 ) ) ( not ( = ?auto_516328 ?auto_516332 ) ) ( not ( = ?auto_516328 ?auto_516333 ) ) ( not ( = ?auto_516328 ?auto_516334 ) ) ( not ( = ?auto_516329 ?auto_516330 ) ) ( not ( = ?auto_516329 ?auto_516331 ) ) ( not ( = ?auto_516329 ?auto_516332 ) ) ( not ( = ?auto_516329 ?auto_516333 ) ) ( not ( = ?auto_516329 ?auto_516334 ) ) ( not ( = ?auto_516330 ?auto_516331 ) ) ( not ( = ?auto_516330 ?auto_516332 ) ) ( not ( = ?auto_516330 ?auto_516333 ) ) ( not ( = ?auto_516330 ?auto_516334 ) ) ( not ( = ?auto_516331 ?auto_516332 ) ) ( not ( = ?auto_516331 ?auto_516333 ) ) ( not ( = ?auto_516331 ?auto_516334 ) ) ( not ( = ?auto_516332 ?auto_516333 ) ) ( not ( = ?auto_516332 ?auto_516334 ) ) ( not ( = ?auto_516333 ?auto_516334 ) ) ( ON ?auto_516332 ?auto_516333 ) ( ON ?auto_516331 ?auto_516332 ) ( ON ?auto_516330 ?auto_516331 ) ( ON ?auto_516329 ?auto_516330 ) ( ON ?auto_516328 ?auto_516329 ) ( ON ?auto_516327 ?auto_516328 ) ( ON ?auto_516326 ?auto_516327 ) ( ON ?auto_516325 ?auto_516326 ) ( CLEAR ?auto_516325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_516325 )
      ( MAKE-9PILE ?auto_516325 ?auto_516326 ?auto_516327 ?auto_516328 ?auto_516329 ?auto_516330 ?auto_516331 ?auto_516332 ?auto_516333 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516364 - BLOCK
      ?auto_516365 - BLOCK
      ?auto_516366 - BLOCK
      ?auto_516367 - BLOCK
      ?auto_516368 - BLOCK
      ?auto_516369 - BLOCK
      ?auto_516370 - BLOCK
      ?auto_516371 - BLOCK
      ?auto_516372 - BLOCK
      ?auto_516373 - BLOCK
    )
    :vars
    (
      ?auto_516374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_516372 ) ( ON ?auto_516373 ?auto_516374 ) ( CLEAR ?auto_516373 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_516364 ) ( ON ?auto_516365 ?auto_516364 ) ( ON ?auto_516366 ?auto_516365 ) ( ON ?auto_516367 ?auto_516366 ) ( ON ?auto_516368 ?auto_516367 ) ( ON ?auto_516369 ?auto_516368 ) ( ON ?auto_516370 ?auto_516369 ) ( ON ?auto_516371 ?auto_516370 ) ( ON ?auto_516372 ?auto_516371 ) ( not ( = ?auto_516364 ?auto_516365 ) ) ( not ( = ?auto_516364 ?auto_516366 ) ) ( not ( = ?auto_516364 ?auto_516367 ) ) ( not ( = ?auto_516364 ?auto_516368 ) ) ( not ( = ?auto_516364 ?auto_516369 ) ) ( not ( = ?auto_516364 ?auto_516370 ) ) ( not ( = ?auto_516364 ?auto_516371 ) ) ( not ( = ?auto_516364 ?auto_516372 ) ) ( not ( = ?auto_516364 ?auto_516373 ) ) ( not ( = ?auto_516364 ?auto_516374 ) ) ( not ( = ?auto_516365 ?auto_516366 ) ) ( not ( = ?auto_516365 ?auto_516367 ) ) ( not ( = ?auto_516365 ?auto_516368 ) ) ( not ( = ?auto_516365 ?auto_516369 ) ) ( not ( = ?auto_516365 ?auto_516370 ) ) ( not ( = ?auto_516365 ?auto_516371 ) ) ( not ( = ?auto_516365 ?auto_516372 ) ) ( not ( = ?auto_516365 ?auto_516373 ) ) ( not ( = ?auto_516365 ?auto_516374 ) ) ( not ( = ?auto_516366 ?auto_516367 ) ) ( not ( = ?auto_516366 ?auto_516368 ) ) ( not ( = ?auto_516366 ?auto_516369 ) ) ( not ( = ?auto_516366 ?auto_516370 ) ) ( not ( = ?auto_516366 ?auto_516371 ) ) ( not ( = ?auto_516366 ?auto_516372 ) ) ( not ( = ?auto_516366 ?auto_516373 ) ) ( not ( = ?auto_516366 ?auto_516374 ) ) ( not ( = ?auto_516367 ?auto_516368 ) ) ( not ( = ?auto_516367 ?auto_516369 ) ) ( not ( = ?auto_516367 ?auto_516370 ) ) ( not ( = ?auto_516367 ?auto_516371 ) ) ( not ( = ?auto_516367 ?auto_516372 ) ) ( not ( = ?auto_516367 ?auto_516373 ) ) ( not ( = ?auto_516367 ?auto_516374 ) ) ( not ( = ?auto_516368 ?auto_516369 ) ) ( not ( = ?auto_516368 ?auto_516370 ) ) ( not ( = ?auto_516368 ?auto_516371 ) ) ( not ( = ?auto_516368 ?auto_516372 ) ) ( not ( = ?auto_516368 ?auto_516373 ) ) ( not ( = ?auto_516368 ?auto_516374 ) ) ( not ( = ?auto_516369 ?auto_516370 ) ) ( not ( = ?auto_516369 ?auto_516371 ) ) ( not ( = ?auto_516369 ?auto_516372 ) ) ( not ( = ?auto_516369 ?auto_516373 ) ) ( not ( = ?auto_516369 ?auto_516374 ) ) ( not ( = ?auto_516370 ?auto_516371 ) ) ( not ( = ?auto_516370 ?auto_516372 ) ) ( not ( = ?auto_516370 ?auto_516373 ) ) ( not ( = ?auto_516370 ?auto_516374 ) ) ( not ( = ?auto_516371 ?auto_516372 ) ) ( not ( = ?auto_516371 ?auto_516373 ) ) ( not ( = ?auto_516371 ?auto_516374 ) ) ( not ( = ?auto_516372 ?auto_516373 ) ) ( not ( = ?auto_516372 ?auto_516374 ) ) ( not ( = ?auto_516373 ?auto_516374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_516373 ?auto_516374 )
      ( !STACK ?auto_516373 ?auto_516372 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516406 - BLOCK
      ?auto_516407 - BLOCK
      ?auto_516408 - BLOCK
      ?auto_516409 - BLOCK
      ?auto_516410 - BLOCK
      ?auto_516411 - BLOCK
      ?auto_516412 - BLOCK
      ?auto_516413 - BLOCK
      ?auto_516414 - BLOCK
      ?auto_516415 - BLOCK
    )
    :vars
    (
      ?auto_516416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516415 ?auto_516416 ) ( ON-TABLE ?auto_516406 ) ( ON ?auto_516407 ?auto_516406 ) ( ON ?auto_516408 ?auto_516407 ) ( ON ?auto_516409 ?auto_516408 ) ( ON ?auto_516410 ?auto_516409 ) ( ON ?auto_516411 ?auto_516410 ) ( ON ?auto_516412 ?auto_516411 ) ( ON ?auto_516413 ?auto_516412 ) ( not ( = ?auto_516406 ?auto_516407 ) ) ( not ( = ?auto_516406 ?auto_516408 ) ) ( not ( = ?auto_516406 ?auto_516409 ) ) ( not ( = ?auto_516406 ?auto_516410 ) ) ( not ( = ?auto_516406 ?auto_516411 ) ) ( not ( = ?auto_516406 ?auto_516412 ) ) ( not ( = ?auto_516406 ?auto_516413 ) ) ( not ( = ?auto_516406 ?auto_516414 ) ) ( not ( = ?auto_516406 ?auto_516415 ) ) ( not ( = ?auto_516406 ?auto_516416 ) ) ( not ( = ?auto_516407 ?auto_516408 ) ) ( not ( = ?auto_516407 ?auto_516409 ) ) ( not ( = ?auto_516407 ?auto_516410 ) ) ( not ( = ?auto_516407 ?auto_516411 ) ) ( not ( = ?auto_516407 ?auto_516412 ) ) ( not ( = ?auto_516407 ?auto_516413 ) ) ( not ( = ?auto_516407 ?auto_516414 ) ) ( not ( = ?auto_516407 ?auto_516415 ) ) ( not ( = ?auto_516407 ?auto_516416 ) ) ( not ( = ?auto_516408 ?auto_516409 ) ) ( not ( = ?auto_516408 ?auto_516410 ) ) ( not ( = ?auto_516408 ?auto_516411 ) ) ( not ( = ?auto_516408 ?auto_516412 ) ) ( not ( = ?auto_516408 ?auto_516413 ) ) ( not ( = ?auto_516408 ?auto_516414 ) ) ( not ( = ?auto_516408 ?auto_516415 ) ) ( not ( = ?auto_516408 ?auto_516416 ) ) ( not ( = ?auto_516409 ?auto_516410 ) ) ( not ( = ?auto_516409 ?auto_516411 ) ) ( not ( = ?auto_516409 ?auto_516412 ) ) ( not ( = ?auto_516409 ?auto_516413 ) ) ( not ( = ?auto_516409 ?auto_516414 ) ) ( not ( = ?auto_516409 ?auto_516415 ) ) ( not ( = ?auto_516409 ?auto_516416 ) ) ( not ( = ?auto_516410 ?auto_516411 ) ) ( not ( = ?auto_516410 ?auto_516412 ) ) ( not ( = ?auto_516410 ?auto_516413 ) ) ( not ( = ?auto_516410 ?auto_516414 ) ) ( not ( = ?auto_516410 ?auto_516415 ) ) ( not ( = ?auto_516410 ?auto_516416 ) ) ( not ( = ?auto_516411 ?auto_516412 ) ) ( not ( = ?auto_516411 ?auto_516413 ) ) ( not ( = ?auto_516411 ?auto_516414 ) ) ( not ( = ?auto_516411 ?auto_516415 ) ) ( not ( = ?auto_516411 ?auto_516416 ) ) ( not ( = ?auto_516412 ?auto_516413 ) ) ( not ( = ?auto_516412 ?auto_516414 ) ) ( not ( = ?auto_516412 ?auto_516415 ) ) ( not ( = ?auto_516412 ?auto_516416 ) ) ( not ( = ?auto_516413 ?auto_516414 ) ) ( not ( = ?auto_516413 ?auto_516415 ) ) ( not ( = ?auto_516413 ?auto_516416 ) ) ( not ( = ?auto_516414 ?auto_516415 ) ) ( not ( = ?auto_516414 ?auto_516416 ) ) ( not ( = ?auto_516415 ?auto_516416 ) ) ( CLEAR ?auto_516413 ) ( ON ?auto_516414 ?auto_516415 ) ( CLEAR ?auto_516414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_516406 ?auto_516407 ?auto_516408 ?auto_516409 ?auto_516410 ?auto_516411 ?auto_516412 ?auto_516413 ?auto_516414 )
      ( MAKE-10PILE ?auto_516406 ?auto_516407 ?auto_516408 ?auto_516409 ?auto_516410 ?auto_516411 ?auto_516412 ?auto_516413 ?auto_516414 ?auto_516415 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516448 - BLOCK
      ?auto_516449 - BLOCK
      ?auto_516450 - BLOCK
      ?auto_516451 - BLOCK
      ?auto_516452 - BLOCK
      ?auto_516453 - BLOCK
      ?auto_516454 - BLOCK
      ?auto_516455 - BLOCK
      ?auto_516456 - BLOCK
      ?auto_516457 - BLOCK
    )
    :vars
    (
      ?auto_516458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516457 ?auto_516458 ) ( ON-TABLE ?auto_516448 ) ( ON ?auto_516449 ?auto_516448 ) ( ON ?auto_516450 ?auto_516449 ) ( ON ?auto_516451 ?auto_516450 ) ( ON ?auto_516452 ?auto_516451 ) ( ON ?auto_516453 ?auto_516452 ) ( ON ?auto_516454 ?auto_516453 ) ( not ( = ?auto_516448 ?auto_516449 ) ) ( not ( = ?auto_516448 ?auto_516450 ) ) ( not ( = ?auto_516448 ?auto_516451 ) ) ( not ( = ?auto_516448 ?auto_516452 ) ) ( not ( = ?auto_516448 ?auto_516453 ) ) ( not ( = ?auto_516448 ?auto_516454 ) ) ( not ( = ?auto_516448 ?auto_516455 ) ) ( not ( = ?auto_516448 ?auto_516456 ) ) ( not ( = ?auto_516448 ?auto_516457 ) ) ( not ( = ?auto_516448 ?auto_516458 ) ) ( not ( = ?auto_516449 ?auto_516450 ) ) ( not ( = ?auto_516449 ?auto_516451 ) ) ( not ( = ?auto_516449 ?auto_516452 ) ) ( not ( = ?auto_516449 ?auto_516453 ) ) ( not ( = ?auto_516449 ?auto_516454 ) ) ( not ( = ?auto_516449 ?auto_516455 ) ) ( not ( = ?auto_516449 ?auto_516456 ) ) ( not ( = ?auto_516449 ?auto_516457 ) ) ( not ( = ?auto_516449 ?auto_516458 ) ) ( not ( = ?auto_516450 ?auto_516451 ) ) ( not ( = ?auto_516450 ?auto_516452 ) ) ( not ( = ?auto_516450 ?auto_516453 ) ) ( not ( = ?auto_516450 ?auto_516454 ) ) ( not ( = ?auto_516450 ?auto_516455 ) ) ( not ( = ?auto_516450 ?auto_516456 ) ) ( not ( = ?auto_516450 ?auto_516457 ) ) ( not ( = ?auto_516450 ?auto_516458 ) ) ( not ( = ?auto_516451 ?auto_516452 ) ) ( not ( = ?auto_516451 ?auto_516453 ) ) ( not ( = ?auto_516451 ?auto_516454 ) ) ( not ( = ?auto_516451 ?auto_516455 ) ) ( not ( = ?auto_516451 ?auto_516456 ) ) ( not ( = ?auto_516451 ?auto_516457 ) ) ( not ( = ?auto_516451 ?auto_516458 ) ) ( not ( = ?auto_516452 ?auto_516453 ) ) ( not ( = ?auto_516452 ?auto_516454 ) ) ( not ( = ?auto_516452 ?auto_516455 ) ) ( not ( = ?auto_516452 ?auto_516456 ) ) ( not ( = ?auto_516452 ?auto_516457 ) ) ( not ( = ?auto_516452 ?auto_516458 ) ) ( not ( = ?auto_516453 ?auto_516454 ) ) ( not ( = ?auto_516453 ?auto_516455 ) ) ( not ( = ?auto_516453 ?auto_516456 ) ) ( not ( = ?auto_516453 ?auto_516457 ) ) ( not ( = ?auto_516453 ?auto_516458 ) ) ( not ( = ?auto_516454 ?auto_516455 ) ) ( not ( = ?auto_516454 ?auto_516456 ) ) ( not ( = ?auto_516454 ?auto_516457 ) ) ( not ( = ?auto_516454 ?auto_516458 ) ) ( not ( = ?auto_516455 ?auto_516456 ) ) ( not ( = ?auto_516455 ?auto_516457 ) ) ( not ( = ?auto_516455 ?auto_516458 ) ) ( not ( = ?auto_516456 ?auto_516457 ) ) ( not ( = ?auto_516456 ?auto_516458 ) ) ( not ( = ?auto_516457 ?auto_516458 ) ) ( ON ?auto_516456 ?auto_516457 ) ( CLEAR ?auto_516454 ) ( ON ?auto_516455 ?auto_516456 ) ( CLEAR ?auto_516455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_516448 ?auto_516449 ?auto_516450 ?auto_516451 ?auto_516452 ?auto_516453 ?auto_516454 ?auto_516455 )
      ( MAKE-10PILE ?auto_516448 ?auto_516449 ?auto_516450 ?auto_516451 ?auto_516452 ?auto_516453 ?auto_516454 ?auto_516455 ?auto_516456 ?auto_516457 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516490 - BLOCK
      ?auto_516491 - BLOCK
      ?auto_516492 - BLOCK
      ?auto_516493 - BLOCK
      ?auto_516494 - BLOCK
      ?auto_516495 - BLOCK
      ?auto_516496 - BLOCK
      ?auto_516497 - BLOCK
      ?auto_516498 - BLOCK
      ?auto_516499 - BLOCK
    )
    :vars
    (
      ?auto_516500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516499 ?auto_516500 ) ( ON-TABLE ?auto_516490 ) ( ON ?auto_516491 ?auto_516490 ) ( ON ?auto_516492 ?auto_516491 ) ( ON ?auto_516493 ?auto_516492 ) ( ON ?auto_516494 ?auto_516493 ) ( ON ?auto_516495 ?auto_516494 ) ( not ( = ?auto_516490 ?auto_516491 ) ) ( not ( = ?auto_516490 ?auto_516492 ) ) ( not ( = ?auto_516490 ?auto_516493 ) ) ( not ( = ?auto_516490 ?auto_516494 ) ) ( not ( = ?auto_516490 ?auto_516495 ) ) ( not ( = ?auto_516490 ?auto_516496 ) ) ( not ( = ?auto_516490 ?auto_516497 ) ) ( not ( = ?auto_516490 ?auto_516498 ) ) ( not ( = ?auto_516490 ?auto_516499 ) ) ( not ( = ?auto_516490 ?auto_516500 ) ) ( not ( = ?auto_516491 ?auto_516492 ) ) ( not ( = ?auto_516491 ?auto_516493 ) ) ( not ( = ?auto_516491 ?auto_516494 ) ) ( not ( = ?auto_516491 ?auto_516495 ) ) ( not ( = ?auto_516491 ?auto_516496 ) ) ( not ( = ?auto_516491 ?auto_516497 ) ) ( not ( = ?auto_516491 ?auto_516498 ) ) ( not ( = ?auto_516491 ?auto_516499 ) ) ( not ( = ?auto_516491 ?auto_516500 ) ) ( not ( = ?auto_516492 ?auto_516493 ) ) ( not ( = ?auto_516492 ?auto_516494 ) ) ( not ( = ?auto_516492 ?auto_516495 ) ) ( not ( = ?auto_516492 ?auto_516496 ) ) ( not ( = ?auto_516492 ?auto_516497 ) ) ( not ( = ?auto_516492 ?auto_516498 ) ) ( not ( = ?auto_516492 ?auto_516499 ) ) ( not ( = ?auto_516492 ?auto_516500 ) ) ( not ( = ?auto_516493 ?auto_516494 ) ) ( not ( = ?auto_516493 ?auto_516495 ) ) ( not ( = ?auto_516493 ?auto_516496 ) ) ( not ( = ?auto_516493 ?auto_516497 ) ) ( not ( = ?auto_516493 ?auto_516498 ) ) ( not ( = ?auto_516493 ?auto_516499 ) ) ( not ( = ?auto_516493 ?auto_516500 ) ) ( not ( = ?auto_516494 ?auto_516495 ) ) ( not ( = ?auto_516494 ?auto_516496 ) ) ( not ( = ?auto_516494 ?auto_516497 ) ) ( not ( = ?auto_516494 ?auto_516498 ) ) ( not ( = ?auto_516494 ?auto_516499 ) ) ( not ( = ?auto_516494 ?auto_516500 ) ) ( not ( = ?auto_516495 ?auto_516496 ) ) ( not ( = ?auto_516495 ?auto_516497 ) ) ( not ( = ?auto_516495 ?auto_516498 ) ) ( not ( = ?auto_516495 ?auto_516499 ) ) ( not ( = ?auto_516495 ?auto_516500 ) ) ( not ( = ?auto_516496 ?auto_516497 ) ) ( not ( = ?auto_516496 ?auto_516498 ) ) ( not ( = ?auto_516496 ?auto_516499 ) ) ( not ( = ?auto_516496 ?auto_516500 ) ) ( not ( = ?auto_516497 ?auto_516498 ) ) ( not ( = ?auto_516497 ?auto_516499 ) ) ( not ( = ?auto_516497 ?auto_516500 ) ) ( not ( = ?auto_516498 ?auto_516499 ) ) ( not ( = ?auto_516498 ?auto_516500 ) ) ( not ( = ?auto_516499 ?auto_516500 ) ) ( ON ?auto_516498 ?auto_516499 ) ( ON ?auto_516497 ?auto_516498 ) ( CLEAR ?auto_516495 ) ( ON ?auto_516496 ?auto_516497 ) ( CLEAR ?auto_516496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_516490 ?auto_516491 ?auto_516492 ?auto_516493 ?auto_516494 ?auto_516495 ?auto_516496 )
      ( MAKE-10PILE ?auto_516490 ?auto_516491 ?auto_516492 ?auto_516493 ?auto_516494 ?auto_516495 ?auto_516496 ?auto_516497 ?auto_516498 ?auto_516499 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516532 - BLOCK
      ?auto_516533 - BLOCK
      ?auto_516534 - BLOCK
      ?auto_516535 - BLOCK
      ?auto_516536 - BLOCK
      ?auto_516537 - BLOCK
      ?auto_516538 - BLOCK
      ?auto_516539 - BLOCK
      ?auto_516540 - BLOCK
      ?auto_516541 - BLOCK
    )
    :vars
    (
      ?auto_516542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516541 ?auto_516542 ) ( ON-TABLE ?auto_516532 ) ( ON ?auto_516533 ?auto_516532 ) ( ON ?auto_516534 ?auto_516533 ) ( ON ?auto_516535 ?auto_516534 ) ( ON ?auto_516536 ?auto_516535 ) ( not ( = ?auto_516532 ?auto_516533 ) ) ( not ( = ?auto_516532 ?auto_516534 ) ) ( not ( = ?auto_516532 ?auto_516535 ) ) ( not ( = ?auto_516532 ?auto_516536 ) ) ( not ( = ?auto_516532 ?auto_516537 ) ) ( not ( = ?auto_516532 ?auto_516538 ) ) ( not ( = ?auto_516532 ?auto_516539 ) ) ( not ( = ?auto_516532 ?auto_516540 ) ) ( not ( = ?auto_516532 ?auto_516541 ) ) ( not ( = ?auto_516532 ?auto_516542 ) ) ( not ( = ?auto_516533 ?auto_516534 ) ) ( not ( = ?auto_516533 ?auto_516535 ) ) ( not ( = ?auto_516533 ?auto_516536 ) ) ( not ( = ?auto_516533 ?auto_516537 ) ) ( not ( = ?auto_516533 ?auto_516538 ) ) ( not ( = ?auto_516533 ?auto_516539 ) ) ( not ( = ?auto_516533 ?auto_516540 ) ) ( not ( = ?auto_516533 ?auto_516541 ) ) ( not ( = ?auto_516533 ?auto_516542 ) ) ( not ( = ?auto_516534 ?auto_516535 ) ) ( not ( = ?auto_516534 ?auto_516536 ) ) ( not ( = ?auto_516534 ?auto_516537 ) ) ( not ( = ?auto_516534 ?auto_516538 ) ) ( not ( = ?auto_516534 ?auto_516539 ) ) ( not ( = ?auto_516534 ?auto_516540 ) ) ( not ( = ?auto_516534 ?auto_516541 ) ) ( not ( = ?auto_516534 ?auto_516542 ) ) ( not ( = ?auto_516535 ?auto_516536 ) ) ( not ( = ?auto_516535 ?auto_516537 ) ) ( not ( = ?auto_516535 ?auto_516538 ) ) ( not ( = ?auto_516535 ?auto_516539 ) ) ( not ( = ?auto_516535 ?auto_516540 ) ) ( not ( = ?auto_516535 ?auto_516541 ) ) ( not ( = ?auto_516535 ?auto_516542 ) ) ( not ( = ?auto_516536 ?auto_516537 ) ) ( not ( = ?auto_516536 ?auto_516538 ) ) ( not ( = ?auto_516536 ?auto_516539 ) ) ( not ( = ?auto_516536 ?auto_516540 ) ) ( not ( = ?auto_516536 ?auto_516541 ) ) ( not ( = ?auto_516536 ?auto_516542 ) ) ( not ( = ?auto_516537 ?auto_516538 ) ) ( not ( = ?auto_516537 ?auto_516539 ) ) ( not ( = ?auto_516537 ?auto_516540 ) ) ( not ( = ?auto_516537 ?auto_516541 ) ) ( not ( = ?auto_516537 ?auto_516542 ) ) ( not ( = ?auto_516538 ?auto_516539 ) ) ( not ( = ?auto_516538 ?auto_516540 ) ) ( not ( = ?auto_516538 ?auto_516541 ) ) ( not ( = ?auto_516538 ?auto_516542 ) ) ( not ( = ?auto_516539 ?auto_516540 ) ) ( not ( = ?auto_516539 ?auto_516541 ) ) ( not ( = ?auto_516539 ?auto_516542 ) ) ( not ( = ?auto_516540 ?auto_516541 ) ) ( not ( = ?auto_516540 ?auto_516542 ) ) ( not ( = ?auto_516541 ?auto_516542 ) ) ( ON ?auto_516540 ?auto_516541 ) ( ON ?auto_516539 ?auto_516540 ) ( ON ?auto_516538 ?auto_516539 ) ( CLEAR ?auto_516536 ) ( ON ?auto_516537 ?auto_516538 ) ( CLEAR ?auto_516537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_516532 ?auto_516533 ?auto_516534 ?auto_516535 ?auto_516536 ?auto_516537 )
      ( MAKE-10PILE ?auto_516532 ?auto_516533 ?auto_516534 ?auto_516535 ?auto_516536 ?auto_516537 ?auto_516538 ?auto_516539 ?auto_516540 ?auto_516541 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516574 - BLOCK
      ?auto_516575 - BLOCK
      ?auto_516576 - BLOCK
      ?auto_516577 - BLOCK
      ?auto_516578 - BLOCK
      ?auto_516579 - BLOCK
      ?auto_516580 - BLOCK
      ?auto_516581 - BLOCK
      ?auto_516582 - BLOCK
      ?auto_516583 - BLOCK
    )
    :vars
    (
      ?auto_516584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516583 ?auto_516584 ) ( ON-TABLE ?auto_516574 ) ( ON ?auto_516575 ?auto_516574 ) ( ON ?auto_516576 ?auto_516575 ) ( ON ?auto_516577 ?auto_516576 ) ( not ( = ?auto_516574 ?auto_516575 ) ) ( not ( = ?auto_516574 ?auto_516576 ) ) ( not ( = ?auto_516574 ?auto_516577 ) ) ( not ( = ?auto_516574 ?auto_516578 ) ) ( not ( = ?auto_516574 ?auto_516579 ) ) ( not ( = ?auto_516574 ?auto_516580 ) ) ( not ( = ?auto_516574 ?auto_516581 ) ) ( not ( = ?auto_516574 ?auto_516582 ) ) ( not ( = ?auto_516574 ?auto_516583 ) ) ( not ( = ?auto_516574 ?auto_516584 ) ) ( not ( = ?auto_516575 ?auto_516576 ) ) ( not ( = ?auto_516575 ?auto_516577 ) ) ( not ( = ?auto_516575 ?auto_516578 ) ) ( not ( = ?auto_516575 ?auto_516579 ) ) ( not ( = ?auto_516575 ?auto_516580 ) ) ( not ( = ?auto_516575 ?auto_516581 ) ) ( not ( = ?auto_516575 ?auto_516582 ) ) ( not ( = ?auto_516575 ?auto_516583 ) ) ( not ( = ?auto_516575 ?auto_516584 ) ) ( not ( = ?auto_516576 ?auto_516577 ) ) ( not ( = ?auto_516576 ?auto_516578 ) ) ( not ( = ?auto_516576 ?auto_516579 ) ) ( not ( = ?auto_516576 ?auto_516580 ) ) ( not ( = ?auto_516576 ?auto_516581 ) ) ( not ( = ?auto_516576 ?auto_516582 ) ) ( not ( = ?auto_516576 ?auto_516583 ) ) ( not ( = ?auto_516576 ?auto_516584 ) ) ( not ( = ?auto_516577 ?auto_516578 ) ) ( not ( = ?auto_516577 ?auto_516579 ) ) ( not ( = ?auto_516577 ?auto_516580 ) ) ( not ( = ?auto_516577 ?auto_516581 ) ) ( not ( = ?auto_516577 ?auto_516582 ) ) ( not ( = ?auto_516577 ?auto_516583 ) ) ( not ( = ?auto_516577 ?auto_516584 ) ) ( not ( = ?auto_516578 ?auto_516579 ) ) ( not ( = ?auto_516578 ?auto_516580 ) ) ( not ( = ?auto_516578 ?auto_516581 ) ) ( not ( = ?auto_516578 ?auto_516582 ) ) ( not ( = ?auto_516578 ?auto_516583 ) ) ( not ( = ?auto_516578 ?auto_516584 ) ) ( not ( = ?auto_516579 ?auto_516580 ) ) ( not ( = ?auto_516579 ?auto_516581 ) ) ( not ( = ?auto_516579 ?auto_516582 ) ) ( not ( = ?auto_516579 ?auto_516583 ) ) ( not ( = ?auto_516579 ?auto_516584 ) ) ( not ( = ?auto_516580 ?auto_516581 ) ) ( not ( = ?auto_516580 ?auto_516582 ) ) ( not ( = ?auto_516580 ?auto_516583 ) ) ( not ( = ?auto_516580 ?auto_516584 ) ) ( not ( = ?auto_516581 ?auto_516582 ) ) ( not ( = ?auto_516581 ?auto_516583 ) ) ( not ( = ?auto_516581 ?auto_516584 ) ) ( not ( = ?auto_516582 ?auto_516583 ) ) ( not ( = ?auto_516582 ?auto_516584 ) ) ( not ( = ?auto_516583 ?auto_516584 ) ) ( ON ?auto_516582 ?auto_516583 ) ( ON ?auto_516581 ?auto_516582 ) ( ON ?auto_516580 ?auto_516581 ) ( ON ?auto_516579 ?auto_516580 ) ( CLEAR ?auto_516577 ) ( ON ?auto_516578 ?auto_516579 ) ( CLEAR ?auto_516578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_516574 ?auto_516575 ?auto_516576 ?auto_516577 ?auto_516578 )
      ( MAKE-10PILE ?auto_516574 ?auto_516575 ?auto_516576 ?auto_516577 ?auto_516578 ?auto_516579 ?auto_516580 ?auto_516581 ?auto_516582 ?auto_516583 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516616 - BLOCK
      ?auto_516617 - BLOCK
      ?auto_516618 - BLOCK
      ?auto_516619 - BLOCK
      ?auto_516620 - BLOCK
      ?auto_516621 - BLOCK
      ?auto_516622 - BLOCK
      ?auto_516623 - BLOCK
      ?auto_516624 - BLOCK
      ?auto_516625 - BLOCK
    )
    :vars
    (
      ?auto_516626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516625 ?auto_516626 ) ( ON-TABLE ?auto_516616 ) ( ON ?auto_516617 ?auto_516616 ) ( ON ?auto_516618 ?auto_516617 ) ( not ( = ?auto_516616 ?auto_516617 ) ) ( not ( = ?auto_516616 ?auto_516618 ) ) ( not ( = ?auto_516616 ?auto_516619 ) ) ( not ( = ?auto_516616 ?auto_516620 ) ) ( not ( = ?auto_516616 ?auto_516621 ) ) ( not ( = ?auto_516616 ?auto_516622 ) ) ( not ( = ?auto_516616 ?auto_516623 ) ) ( not ( = ?auto_516616 ?auto_516624 ) ) ( not ( = ?auto_516616 ?auto_516625 ) ) ( not ( = ?auto_516616 ?auto_516626 ) ) ( not ( = ?auto_516617 ?auto_516618 ) ) ( not ( = ?auto_516617 ?auto_516619 ) ) ( not ( = ?auto_516617 ?auto_516620 ) ) ( not ( = ?auto_516617 ?auto_516621 ) ) ( not ( = ?auto_516617 ?auto_516622 ) ) ( not ( = ?auto_516617 ?auto_516623 ) ) ( not ( = ?auto_516617 ?auto_516624 ) ) ( not ( = ?auto_516617 ?auto_516625 ) ) ( not ( = ?auto_516617 ?auto_516626 ) ) ( not ( = ?auto_516618 ?auto_516619 ) ) ( not ( = ?auto_516618 ?auto_516620 ) ) ( not ( = ?auto_516618 ?auto_516621 ) ) ( not ( = ?auto_516618 ?auto_516622 ) ) ( not ( = ?auto_516618 ?auto_516623 ) ) ( not ( = ?auto_516618 ?auto_516624 ) ) ( not ( = ?auto_516618 ?auto_516625 ) ) ( not ( = ?auto_516618 ?auto_516626 ) ) ( not ( = ?auto_516619 ?auto_516620 ) ) ( not ( = ?auto_516619 ?auto_516621 ) ) ( not ( = ?auto_516619 ?auto_516622 ) ) ( not ( = ?auto_516619 ?auto_516623 ) ) ( not ( = ?auto_516619 ?auto_516624 ) ) ( not ( = ?auto_516619 ?auto_516625 ) ) ( not ( = ?auto_516619 ?auto_516626 ) ) ( not ( = ?auto_516620 ?auto_516621 ) ) ( not ( = ?auto_516620 ?auto_516622 ) ) ( not ( = ?auto_516620 ?auto_516623 ) ) ( not ( = ?auto_516620 ?auto_516624 ) ) ( not ( = ?auto_516620 ?auto_516625 ) ) ( not ( = ?auto_516620 ?auto_516626 ) ) ( not ( = ?auto_516621 ?auto_516622 ) ) ( not ( = ?auto_516621 ?auto_516623 ) ) ( not ( = ?auto_516621 ?auto_516624 ) ) ( not ( = ?auto_516621 ?auto_516625 ) ) ( not ( = ?auto_516621 ?auto_516626 ) ) ( not ( = ?auto_516622 ?auto_516623 ) ) ( not ( = ?auto_516622 ?auto_516624 ) ) ( not ( = ?auto_516622 ?auto_516625 ) ) ( not ( = ?auto_516622 ?auto_516626 ) ) ( not ( = ?auto_516623 ?auto_516624 ) ) ( not ( = ?auto_516623 ?auto_516625 ) ) ( not ( = ?auto_516623 ?auto_516626 ) ) ( not ( = ?auto_516624 ?auto_516625 ) ) ( not ( = ?auto_516624 ?auto_516626 ) ) ( not ( = ?auto_516625 ?auto_516626 ) ) ( ON ?auto_516624 ?auto_516625 ) ( ON ?auto_516623 ?auto_516624 ) ( ON ?auto_516622 ?auto_516623 ) ( ON ?auto_516621 ?auto_516622 ) ( ON ?auto_516620 ?auto_516621 ) ( CLEAR ?auto_516618 ) ( ON ?auto_516619 ?auto_516620 ) ( CLEAR ?auto_516619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_516616 ?auto_516617 ?auto_516618 ?auto_516619 )
      ( MAKE-10PILE ?auto_516616 ?auto_516617 ?auto_516618 ?auto_516619 ?auto_516620 ?auto_516621 ?auto_516622 ?auto_516623 ?auto_516624 ?auto_516625 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516658 - BLOCK
      ?auto_516659 - BLOCK
      ?auto_516660 - BLOCK
      ?auto_516661 - BLOCK
      ?auto_516662 - BLOCK
      ?auto_516663 - BLOCK
      ?auto_516664 - BLOCK
      ?auto_516665 - BLOCK
      ?auto_516666 - BLOCK
      ?auto_516667 - BLOCK
    )
    :vars
    (
      ?auto_516668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516667 ?auto_516668 ) ( ON-TABLE ?auto_516658 ) ( ON ?auto_516659 ?auto_516658 ) ( not ( = ?auto_516658 ?auto_516659 ) ) ( not ( = ?auto_516658 ?auto_516660 ) ) ( not ( = ?auto_516658 ?auto_516661 ) ) ( not ( = ?auto_516658 ?auto_516662 ) ) ( not ( = ?auto_516658 ?auto_516663 ) ) ( not ( = ?auto_516658 ?auto_516664 ) ) ( not ( = ?auto_516658 ?auto_516665 ) ) ( not ( = ?auto_516658 ?auto_516666 ) ) ( not ( = ?auto_516658 ?auto_516667 ) ) ( not ( = ?auto_516658 ?auto_516668 ) ) ( not ( = ?auto_516659 ?auto_516660 ) ) ( not ( = ?auto_516659 ?auto_516661 ) ) ( not ( = ?auto_516659 ?auto_516662 ) ) ( not ( = ?auto_516659 ?auto_516663 ) ) ( not ( = ?auto_516659 ?auto_516664 ) ) ( not ( = ?auto_516659 ?auto_516665 ) ) ( not ( = ?auto_516659 ?auto_516666 ) ) ( not ( = ?auto_516659 ?auto_516667 ) ) ( not ( = ?auto_516659 ?auto_516668 ) ) ( not ( = ?auto_516660 ?auto_516661 ) ) ( not ( = ?auto_516660 ?auto_516662 ) ) ( not ( = ?auto_516660 ?auto_516663 ) ) ( not ( = ?auto_516660 ?auto_516664 ) ) ( not ( = ?auto_516660 ?auto_516665 ) ) ( not ( = ?auto_516660 ?auto_516666 ) ) ( not ( = ?auto_516660 ?auto_516667 ) ) ( not ( = ?auto_516660 ?auto_516668 ) ) ( not ( = ?auto_516661 ?auto_516662 ) ) ( not ( = ?auto_516661 ?auto_516663 ) ) ( not ( = ?auto_516661 ?auto_516664 ) ) ( not ( = ?auto_516661 ?auto_516665 ) ) ( not ( = ?auto_516661 ?auto_516666 ) ) ( not ( = ?auto_516661 ?auto_516667 ) ) ( not ( = ?auto_516661 ?auto_516668 ) ) ( not ( = ?auto_516662 ?auto_516663 ) ) ( not ( = ?auto_516662 ?auto_516664 ) ) ( not ( = ?auto_516662 ?auto_516665 ) ) ( not ( = ?auto_516662 ?auto_516666 ) ) ( not ( = ?auto_516662 ?auto_516667 ) ) ( not ( = ?auto_516662 ?auto_516668 ) ) ( not ( = ?auto_516663 ?auto_516664 ) ) ( not ( = ?auto_516663 ?auto_516665 ) ) ( not ( = ?auto_516663 ?auto_516666 ) ) ( not ( = ?auto_516663 ?auto_516667 ) ) ( not ( = ?auto_516663 ?auto_516668 ) ) ( not ( = ?auto_516664 ?auto_516665 ) ) ( not ( = ?auto_516664 ?auto_516666 ) ) ( not ( = ?auto_516664 ?auto_516667 ) ) ( not ( = ?auto_516664 ?auto_516668 ) ) ( not ( = ?auto_516665 ?auto_516666 ) ) ( not ( = ?auto_516665 ?auto_516667 ) ) ( not ( = ?auto_516665 ?auto_516668 ) ) ( not ( = ?auto_516666 ?auto_516667 ) ) ( not ( = ?auto_516666 ?auto_516668 ) ) ( not ( = ?auto_516667 ?auto_516668 ) ) ( ON ?auto_516666 ?auto_516667 ) ( ON ?auto_516665 ?auto_516666 ) ( ON ?auto_516664 ?auto_516665 ) ( ON ?auto_516663 ?auto_516664 ) ( ON ?auto_516662 ?auto_516663 ) ( ON ?auto_516661 ?auto_516662 ) ( CLEAR ?auto_516659 ) ( ON ?auto_516660 ?auto_516661 ) ( CLEAR ?auto_516660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_516658 ?auto_516659 ?auto_516660 )
      ( MAKE-10PILE ?auto_516658 ?auto_516659 ?auto_516660 ?auto_516661 ?auto_516662 ?auto_516663 ?auto_516664 ?auto_516665 ?auto_516666 ?auto_516667 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516700 - BLOCK
      ?auto_516701 - BLOCK
      ?auto_516702 - BLOCK
      ?auto_516703 - BLOCK
      ?auto_516704 - BLOCK
      ?auto_516705 - BLOCK
      ?auto_516706 - BLOCK
      ?auto_516707 - BLOCK
      ?auto_516708 - BLOCK
      ?auto_516709 - BLOCK
    )
    :vars
    (
      ?auto_516710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516709 ?auto_516710 ) ( ON-TABLE ?auto_516700 ) ( not ( = ?auto_516700 ?auto_516701 ) ) ( not ( = ?auto_516700 ?auto_516702 ) ) ( not ( = ?auto_516700 ?auto_516703 ) ) ( not ( = ?auto_516700 ?auto_516704 ) ) ( not ( = ?auto_516700 ?auto_516705 ) ) ( not ( = ?auto_516700 ?auto_516706 ) ) ( not ( = ?auto_516700 ?auto_516707 ) ) ( not ( = ?auto_516700 ?auto_516708 ) ) ( not ( = ?auto_516700 ?auto_516709 ) ) ( not ( = ?auto_516700 ?auto_516710 ) ) ( not ( = ?auto_516701 ?auto_516702 ) ) ( not ( = ?auto_516701 ?auto_516703 ) ) ( not ( = ?auto_516701 ?auto_516704 ) ) ( not ( = ?auto_516701 ?auto_516705 ) ) ( not ( = ?auto_516701 ?auto_516706 ) ) ( not ( = ?auto_516701 ?auto_516707 ) ) ( not ( = ?auto_516701 ?auto_516708 ) ) ( not ( = ?auto_516701 ?auto_516709 ) ) ( not ( = ?auto_516701 ?auto_516710 ) ) ( not ( = ?auto_516702 ?auto_516703 ) ) ( not ( = ?auto_516702 ?auto_516704 ) ) ( not ( = ?auto_516702 ?auto_516705 ) ) ( not ( = ?auto_516702 ?auto_516706 ) ) ( not ( = ?auto_516702 ?auto_516707 ) ) ( not ( = ?auto_516702 ?auto_516708 ) ) ( not ( = ?auto_516702 ?auto_516709 ) ) ( not ( = ?auto_516702 ?auto_516710 ) ) ( not ( = ?auto_516703 ?auto_516704 ) ) ( not ( = ?auto_516703 ?auto_516705 ) ) ( not ( = ?auto_516703 ?auto_516706 ) ) ( not ( = ?auto_516703 ?auto_516707 ) ) ( not ( = ?auto_516703 ?auto_516708 ) ) ( not ( = ?auto_516703 ?auto_516709 ) ) ( not ( = ?auto_516703 ?auto_516710 ) ) ( not ( = ?auto_516704 ?auto_516705 ) ) ( not ( = ?auto_516704 ?auto_516706 ) ) ( not ( = ?auto_516704 ?auto_516707 ) ) ( not ( = ?auto_516704 ?auto_516708 ) ) ( not ( = ?auto_516704 ?auto_516709 ) ) ( not ( = ?auto_516704 ?auto_516710 ) ) ( not ( = ?auto_516705 ?auto_516706 ) ) ( not ( = ?auto_516705 ?auto_516707 ) ) ( not ( = ?auto_516705 ?auto_516708 ) ) ( not ( = ?auto_516705 ?auto_516709 ) ) ( not ( = ?auto_516705 ?auto_516710 ) ) ( not ( = ?auto_516706 ?auto_516707 ) ) ( not ( = ?auto_516706 ?auto_516708 ) ) ( not ( = ?auto_516706 ?auto_516709 ) ) ( not ( = ?auto_516706 ?auto_516710 ) ) ( not ( = ?auto_516707 ?auto_516708 ) ) ( not ( = ?auto_516707 ?auto_516709 ) ) ( not ( = ?auto_516707 ?auto_516710 ) ) ( not ( = ?auto_516708 ?auto_516709 ) ) ( not ( = ?auto_516708 ?auto_516710 ) ) ( not ( = ?auto_516709 ?auto_516710 ) ) ( ON ?auto_516708 ?auto_516709 ) ( ON ?auto_516707 ?auto_516708 ) ( ON ?auto_516706 ?auto_516707 ) ( ON ?auto_516705 ?auto_516706 ) ( ON ?auto_516704 ?auto_516705 ) ( ON ?auto_516703 ?auto_516704 ) ( ON ?auto_516702 ?auto_516703 ) ( CLEAR ?auto_516700 ) ( ON ?auto_516701 ?auto_516702 ) ( CLEAR ?auto_516701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_516700 ?auto_516701 )
      ( MAKE-10PILE ?auto_516700 ?auto_516701 ?auto_516702 ?auto_516703 ?auto_516704 ?auto_516705 ?auto_516706 ?auto_516707 ?auto_516708 ?auto_516709 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_516742 - BLOCK
      ?auto_516743 - BLOCK
      ?auto_516744 - BLOCK
      ?auto_516745 - BLOCK
      ?auto_516746 - BLOCK
      ?auto_516747 - BLOCK
      ?auto_516748 - BLOCK
      ?auto_516749 - BLOCK
      ?auto_516750 - BLOCK
      ?auto_516751 - BLOCK
    )
    :vars
    (
      ?auto_516752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516751 ?auto_516752 ) ( not ( = ?auto_516742 ?auto_516743 ) ) ( not ( = ?auto_516742 ?auto_516744 ) ) ( not ( = ?auto_516742 ?auto_516745 ) ) ( not ( = ?auto_516742 ?auto_516746 ) ) ( not ( = ?auto_516742 ?auto_516747 ) ) ( not ( = ?auto_516742 ?auto_516748 ) ) ( not ( = ?auto_516742 ?auto_516749 ) ) ( not ( = ?auto_516742 ?auto_516750 ) ) ( not ( = ?auto_516742 ?auto_516751 ) ) ( not ( = ?auto_516742 ?auto_516752 ) ) ( not ( = ?auto_516743 ?auto_516744 ) ) ( not ( = ?auto_516743 ?auto_516745 ) ) ( not ( = ?auto_516743 ?auto_516746 ) ) ( not ( = ?auto_516743 ?auto_516747 ) ) ( not ( = ?auto_516743 ?auto_516748 ) ) ( not ( = ?auto_516743 ?auto_516749 ) ) ( not ( = ?auto_516743 ?auto_516750 ) ) ( not ( = ?auto_516743 ?auto_516751 ) ) ( not ( = ?auto_516743 ?auto_516752 ) ) ( not ( = ?auto_516744 ?auto_516745 ) ) ( not ( = ?auto_516744 ?auto_516746 ) ) ( not ( = ?auto_516744 ?auto_516747 ) ) ( not ( = ?auto_516744 ?auto_516748 ) ) ( not ( = ?auto_516744 ?auto_516749 ) ) ( not ( = ?auto_516744 ?auto_516750 ) ) ( not ( = ?auto_516744 ?auto_516751 ) ) ( not ( = ?auto_516744 ?auto_516752 ) ) ( not ( = ?auto_516745 ?auto_516746 ) ) ( not ( = ?auto_516745 ?auto_516747 ) ) ( not ( = ?auto_516745 ?auto_516748 ) ) ( not ( = ?auto_516745 ?auto_516749 ) ) ( not ( = ?auto_516745 ?auto_516750 ) ) ( not ( = ?auto_516745 ?auto_516751 ) ) ( not ( = ?auto_516745 ?auto_516752 ) ) ( not ( = ?auto_516746 ?auto_516747 ) ) ( not ( = ?auto_516746 ?auto_516748 ) ) ( not ( = ?auto_516746 ?auto_516749 ) ) ( not ( = ?auto_516746 ?auto_516750 ) ) ( not ( = ?auto_516746 ?auto_516751 ) ) ( not ( = ?auto_516746 ?auto_516752 ) ) ( not ( = ?auto_516747 ?auto_516748 ) ) ( not ( = ?auto_516747 ?auto_516749 ) ) ( not ( = ?auto_516747 ?auto_516750 ) ) ( not ( = ?auto_516747 ?auto_516751 ) ) ( not ( = ?auto_516747 ?auto_516752 ) ) ( not ( = ?auto_516748 ?auto_516749 ) ) ( not ( = ?auto_516748 ?auto_516750 ) ) ( not ( = ?auto_516748 ?auto_516751 ) ) ( not ( = ?auto_516748 ?auto_516752 ) ) ( not ( = ?auto_516749 ?auto_516750 ) ) ( not ( = ?auto_516749 ?auto_516751 ) ) ( not ( = ?auto_516749 ?auto_516752 ) ) ( not ( = ?auto_516750 ?auto_516751 ) ) ( not ( = ?auto_516750 ?auto_516752 ) ) ( not ( = ?auto_516751 ?auto_516752 ) ) ( ON ?auto_516750 ?auto_516751 ) ( ON ?auto_516749 ?auto_516750 ) ( ON ?auto_516748 ?auto_516749 ) ( ON ?auto_516747 ?auto_516748 ) ( ON ?auto_516746 ?auto_516747 ) ( ON ?auto_516745 ?auto_516746 ) ( ON ?auto_516744 ?auto_516745 ) ( ON ?auto_516743 ?auto_516744 ) ( ON ?auto_516742 ?auto_516743 ) ( CLEAR ?auto_516742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_516742 )
      ( MAKE-10PILE ?auto_516742 ?auto_516743 ?auto_516744 ?auto_516745 ?auto_516746 ?auto_516747 ?auto_516748 ?auto_516749 ?auto_516750 ?auto_516751 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_516785 - BLOCK
      ?auto_516786 - BLOCK
      ?auto_516787 - BLOCK
      ?auto_516788 - BLOCK
      ?auto_516789 - BLOCK
      ?auto_516790 - BLOCK
      ?auto_516791 - BLOCK
      ?auto_516792 - BLOCK
      ?auto_516793 - BLOCK
      ?auto_516794 - BLOCK
      ?auto_516795 - BLOCK
    )
    :vars
    (
      ?auto_516796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_516794 ) ( ON ?auto_516795 ?auto_516796 ) ( CLEAR ?auto_516795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_516785 ) ( ON ?auto_516786 ?auto_516785 ) ( ON ?auto_516787 ?auto_516786 ) ( ON ?auto_516788 ?auto_516787 ) ( ON ?auto_516789 ?auto_516788 ) ( ON ?auto_516790 ?auto_516789 ) ( ON ?auto_516791 ?auto_516790 ) ( ON ?auto_516792 ?auto_516791 ) ( ON ?auto_516793 ?auto_516792 ) ( ON ?auto_516794 ?auto_516793 ) ( not ( = ?auto_516785 ?auto_516786 ) ) ( not ( = ?auto_516785 ?auto_516787 ) ) ( not ( = ?auto_516785 ?auto_516788 ) ) ( not ( = ?auto_516785 ?auto_516789 ) ) ( not ( = ?auto_516785 ?auto_516790 ) ) ( not ( = ?auto_516785 ?auto_516791 ) ) ( not ( = ?auto_516785 ?auto_516792 ) ) ( not ( = ?auto_516785 ?auto_516793 ) ) ( not ( = ?auto_516785 ?auto_516794 ) ) ( not ( = ?auto_516785 ?auto_516795 ) ) ( not ( = ?auto_516785 ?auto_516796 ) ) ( not ( = ?auto_516786 ?auto_516787 ) ) ( not ( = ?auto_516786 ?auto_516788 ) ) ( not ( = ?auto_516786 ?auto_516789 ) ) ( not ( = ?auto_516786 ?auto_516790 ) ) ( not ( = ?auto_516786 ?auto_516791 ) ) ( not ( = ?auto_516786 ?auto_516792 ) ) ( not ( = ?auto_516786 ?auto_516793 ) ) ( not ( = ?auto_516786 ?auto_516794 ) ) ( not ( = ?auto_516786 ?auto_516795 ) ) ( not ( = ?auto_516786 ?auto_516796 ) ) ( not ( = ?auto_516787 ?auto_516788 ) ) ( not ( = ?auto_516787 ?auto_516789 ) ) ( not ( = ?auto_516787 ?auto_516790 ) ) ( not ( = ?auto_516787 ?auto_516791 ) ) ( not ( = ?auto_516787 ?auto_516792 ) ) ( not ( = ?auto_516787 ?auto_516793 ) ) ( not ( = ?auto_516787 ?auto_516794 ) ) ( not ( = ?auto_516787 ?auto_516795 ) ) ( not ( = ?auto_516787 ?auto_516796 ) ) ( not ( = ?auto_516788 ?auto_516789 ) ) ( not ( = ?auto_516788 ?auto_516790 ) ) ( not ( = ?auto_516788 ?auto_516791 ) ) ( not ( = ?auto_516788 ?auto_516792 ) ) ( not ( = ?auto_516788 ?auto_516793 ) ) ( not ( = ?auto_516788 ?auto_516794 ) ) ( not ( = ?auto_516788 ?auto_516795 ) ) ( not ( = ?auto_516788 ?auto_516796 ) ) ( not ( = ?auto_516789 ?auto_516790 ) ) ( not ( = ?auto_516789 ?auto_516791 ) ) ( not ( = ?auto_516789 ?auto_516792 ) ) ( not ( = ?auto_516789 ?auto_516793 ) ) ( not ( = ?auto_516789 ?auto_516794 ) ) ( not ( = ?auto_516789 ?auto_516795 ) ) ( not ( = ?auto_516789 ?auto_516796 ) ) ( not ( = ?auto_516790 ?auto_516791 ) ) ( not ( = ?auto_516790 ?auto_516792 ) ) ( not ( = ?auto_516790 ?auto_516793 ) ) ( not ( = ?auto_516790 ?auto_516794 ) ) ( not ( = ?auto_516790 ?auto_516795 ) ) ( not ( = ?auto_516790 ?auto_516796 ) ) ( not ( = ?auto_516791 ?auto_516792 ) ) ( not ( = ?auto_516791 ?auto_516793 ) ) ( not ( = ?auto_516791 ?auto_516794 ) ) ( not ( = ?auto_516791 ?auto_516795 ) ) ( not ( = ?auto_516791 ?auto_516796 ) ) ( not ( = ?auto_516792 ?auto_516793 ) ) ( not ( = ?auto_516792 ?auto_516794 ) ) ( not ( = ?auto_516792 ?auto_516795 ) ) ( not ( = ?auto_516792 ?auto_516796 ) ) ( not ( = ?auto_516793 ?auto_516794 ) ) ( not ( = ?auto_516793 ?auto_516795 ) ) ( not ( = ?auto_516793 ?auto_516796 ) ) ( not ( = ?auto_516794 ?auto_516795 ) ) ( not ( = ?auto_516794 ?auto_516796 ) ) ( not ( = ?auto_516795 ?auto_516796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_516795 ?auto_516796 )
      ( !STACK ?auto_516795 ?auto_516794 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_516831 - BLOCK
      ?auto_516832 - BLOCK
      ?auto_516833 - BLOCK
      ?auto_516834 - BLOCK
      ?auto_516835 - BLOCK
      ?auto_516836 - BLOCK
      ?auto_516837 - BLOCK
      ?auto_516838 - BLOCK
      ?auto_516839 - BLOCK
      ?auto_516840 - BLOCK
      ?auto_516841 - BLOCK
    )
    :vars
    (
      ?auto_516842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516841 ?auto_516842 ) ( ON-TABLE ?auto_516831 ) ( ON ?auto_516832 ?auto_516831 ) ( ON ?auto_516833 ?auto_516832 ) ( ON ?auto_516834 ?auto_516833 ) ( ON ?auto_516835 ?auto_516834 ) ( ON ?auto_516836 ?auto_516835 ) ( ON ?auto_516837 ?auto_516836 ) ( ON ?auto_516838 ?auto_516837 ) ( ON ?auto_516839 ?auto_516838 ) ( not ( = ?auto_516831 ?auto_516832 ) ) ( not ( = ?auto_516831 ?auto_516833 ) ) ( not ( = ?auto_516831 ?auto_516834 ) ) ( not ( = ?auto_516831 ?auto_516835 ) ) ( not ( = ?auto_516831 ?auto_516836 ) ) ( not ( = ?auto_516831 ?auto_516837 ) ) ( not ( = ?auto_516831 ?auto_516838 ) ) ( not ( = ?auto_516831 ?auto_516839 ) ) ( not ( = ?auto_516831 ?auto_516840 ) ) ( not ( = ?auto_516831 ?auto_516841 ) ) ( not ( = ?auto_516831 ?auto_516842 ) ) ( not ( = ?auto_516832 ?auto_516833 ) ) ( not ( = ?auto_516832 ?auto_516834 ) ) ( not ( = ?auto_516832 ?auto_516835 ) ) ( not ( = ?auto_516832 ?auto_516836 ) ) ( not ( = ?auto_516832 ?auto_516837 ) ) ( not ( = ?auto_516832 ?auto_516838 ) ) ( not ( = ?auto_516832 ?auto_516839 ) ) ( not ( = ?auto_516832 ?auto_516840 ) ) ( not ( = ?auto_516832 ?auto_516841 ) ) ( not ( = ?auto_516832 ?auto_516842 ) ) ( not ( = ?auto_516833 ?auto_516834 ) ) ( not ( = ?auto_516833 ?auto_516835 ) ) ( not ( = ?auto_516833 ?auto_516836 ) ) ( not ( = ?auto_516833 ?auto_516837 ) ) ( not ( = ?auto_516833 ?auto_516838 ) ) ( not ( = ?auto_516833 ?auto_516839 ) ) ( not ( = ?auto_516833 ?auto_516840 ) ) ( not ( = ?auto_516833 ?auto_516841 ) ) ( not ( = ?auto_516833 ?auto_516842 ) ) ( not ( = ?auto_516834 ?auto_516835 ) ) ( not ( = ?auto_516834 ?auto_516836 ) ) ( not ( = ?auto_516834 ?auto_516837 ) ) ( not ( = ?auto_516834 ?auto_516838 ) ) ( not ( = ?auto_516834 ?auto_516839 ) ) ( not ( = ?auto_516834 ?auto_516840 ) ) ( not ( = ?auto_516834 ?auto_516841 ) ) ( not ( = ?auto_516834 ?auto_516842 ) ) ( not ( = ?auto_516835 ?auto_516836 ) ) ( not ( = ?auto_516835 ?auto_516837 ) ) ( not ( = ?auto_516835 ?auto_516838 ) ) ( not ( = ?auto_516835 ?auto_516839 ) ) ( not ( = ?auto_516835 ?auto_516840 ) ) ( not ( = ?auto_516835 ?auto_516841 ) ) ( not ( = ?auto_516835 ?auto_516842 ) ) ( not ( = ?auto_516836 ?auto_516837 ) ) ( not ( = ?auto_516836 ?auto_516838 ) ) ( not ( = ?auto_516836 ?auto_516839 ) ) ( not ( = ?auto_516836 ?auto_516840 ) ) ( not ( = ?auto_516836 ?auto_516841 ) ) ( not ( = ?auto_516836 ?auto_516842 ) ) ( not ( = ?auto_516837 ?auto_516838 ) ) ( not ( = ?auto_516837 ?auto_516839 ) ) ( not ( = ?auto_516837 ?auto_516840 ) ) ( not ( = ?auto_516837 ?auto_516841 ) ) ( not ( = ?auto_516837 ?auto_516842 ) ) ( not ( = ?auto_516838 ?auto_516839 ) ) ( not ( = ?auto_516838 ?auto_516840 ) ) ( not ( = ?auto_516838 ?auto_516841 ) ) ( not ( = ?auto_516838 ?auto_516842 ) ) ( not ( = ?auto_516839 ?auto_516840 ) ) ( not ( = ?auto_516839 ?auto_516841 ) ) ( not ( = ?auto_516839 ?auto_516842 ) ) ( not ( = ?auto_516840 ?auto_516841 ) ) ( not ( = ?auto_516840 ?auto_516842 ) ) ( not ( = ?auto_516841 ?auto_516842 ) ) ( CLEAR ?auto_516839 ) ( ON ?auto_516840 ?auto_516841 ) ( CLEAR ?auto_516840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_516831 ?auto_516832 ?auto_516833 ?auto_516834 ?auto_516835 ?auto_516836 ?auto_516837 ?auto_516838 ?auto_516839 ?auto_516840 )
      ( MAKE-11PILE ?auto_516831 ?auto_516832 ?auto_516833 ?auto_516834 ?auto_516835 ?auto_516836 ?auto_516837 ?auto_516838 ?auto_516839 ?auto_516840 ?auto_516841 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_516877 - BLOCK
      ?auto_516878 - BLOCK
      ?auto_516879 - BLOCK
      ?auto_516880 - BLOCK
      ?auto_516881 - BLOCK
      ?auto_516882 - BLOCK
      ?auto_516883 - BLOCK
      ?auto_516884 - BLOCK
      ?auto_516885 - BLOCK
      ?auto_516886 - BLOCK
      ?auto_516887 - BLOCK
    )
    :vars
    (
      ?auto_516888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516887 ?auto_516888 ) ( ON-TABLE ?auto_516877 ) ( ON ?auto_516878 ?auto_516877 ) ( ON ?auto_516879 ?auto_516878 ) ( ON ?auto_516880 ?auto_516879 ) ( ON ?auto_516881 ?auto_516880 ) ( ON ?auto_516882 ?auto_516881 ) ( ON ?auto_516883 ?auto_516882 ) ( ON ?auto_516884 ?auto_516883 ) ( not ( = ?auto_516877 ?auto_516878 ) ) ( not ( = ?auto_516877 ?auto_516879 ) ) ( not ( = ?auto_516877 ?auto_516880 ) ) ( not ( = ?auto_516877 ?auto_516881 ) ) ( not ( = ?auto_516877 ?auto_516882 ) ) ( not ( = ?auto_516877 ?auto_516883 ) ) ( not ( = ?auto_516877 ?auto_516884 ) ) ( not ( = ?auto_516877 ?auto_516885 ) ) ( not ( = ?auto_516877 ?auto_516886 ) ) ( not ( = ?auto_516877 ?auto_516887 ) ) ( not ( = ?auto_516877 ?auto_516888 ) ) ( not ( = ?auto_516878 ?auto_516879 ) ) ( not ( = ?auto_516878 ?auto_516880 ) ) ( not ( = ?auto_516878 ?auto_516881 ) ) ( not ( = ?auto_516878 ?auto_516882 ) ) ( not ( = ?auto_516878 ?auto_516883 ) ) ( not ( = ?auto_516878 ?auto_516884 ) ) ( not ( = ?auto_516878 ?auto_516885 ) ) ( not ( = ?auto_516878 ?auto_516886 ) ) ( not ( = ?auto_516878 ?auto_516887 ) ) ( not ( = ?auto_516878 ?auto_516888 ) ) ( not ( = ?auto_516879 ?auto_516880 ) ) ( not ( = ?auto_516879 ?auto_516881 ) ) ( not ( = ?auto_516879 ?auto_516882 ) ) ( not ( = ?auto_516879 ?auto_516883 ) ) ( not ( = ?auto_516879 ?auto_516884 ) ) ( not ( = ?auto_516879 ?auto_516885 ) ) ( not ( = ?auto_516879 ?auto_516886 ) ) ( not ( = ?auto_516879 ?auto_516887 ) ) ( not ( = ?auto_516879 ?auto_516888 ) ) ( not ( = ?auto_516880 ?auto_516881 ) ) ( not ( = ?auto_516880 ?auto_516882 ) ) ( not ( = ?auto_516880 ?auto_516883 ) ) ( not ( = ?auto_516880 ?auto_516884 ) ) ( not ( = ?auto_516880 ?auto_516885 ) ) ( not ( = ?auto_516880 ?auto_516886 ) ) ( not ( = ?auto_516880 ?auto_516887 ) ) ( not ( = ?auto_516880 ?auto_516888 ) ) ( not ( = ?auto_516881 ?auto_516882 ) ) ( not ( = ?auto_516881 ?auto_516883 ) ) ( not ( = ?auto_516881 ?auto_516884 ) ) ( not ( = ?auto_516881 ?auto_516885 ) ) ( not ( = ?auto_516881 ?auto_516886 ) ) ( not ( = ?auto_516881 ?auto_516887 ) ) ( not ( = ?auto_516881 ?auto_516888 ) ) ( not ( = ?auto_516882 ?auto_516883 ) ) ( not ( = ?auto_516882 ?auto_516884 ) ) ( not ( = ?auto_516882 ?auto_516885 ) ) ( not ( = ?auto_516882 ?auto_516886 ) ) ( not ( = ?auto_516882 ?auto_516887 ) ) ( not ( = ?auto_516882 ?auto_516888 ) ) ( not ( = ?auto_516883 ?auto_516884 ) ) ( not ( = ?auto_516883 ?auto_516885 ) ) ( not ( = ?auto_516883 ?auto_516886 ) ) ( not ( = ?auto_516883 ?auto_516887 ) ) ( not ( = ?auto_516883 ?auto_516888 ) ) ( not ( = ?auto_516884 ?auto_516885 ) ) ( not ( = ?auto_516884 ?auto_516886 ) ) ( not ( = ?auto_516884 ?auto_516887 ) ) ( not ( = ?auto_516884 ?auto_516888 ) ) ( not ( = ?auto_516885 ?auto_516886 ) ) ( not ( = ?auto_516885 ?auto_516887 ) ) ( not ( = ?auto_516885 ?auto_516888 ) ) ( not ( = ?auto_516886 ?auto_516887 ) ) ( not ( = ?auto_516886 ?auto_516888 ) ) ( not ( = ?auto_516887 ?auto_516888 ) ) ( ON ?auto_516886 ?auto_516887 ) ( CLEAR ?auto_516884 ) ( ON ?auto_516885 ?auto_516886 ) ( CLEAR ?auto_516885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_516877 ?auto_516878 ?auto_516879 ?auto_516880 ?auto_516881 ?auto_516882 ?auto_516883 ?auto_516884 ?auto_516885 )
      ( MAKE-11PILE ?auto_516877 ?auto_516878 ?auto_516879 ?auto_516880 ?auto_516881 ?auto_516882 ?auto_516883 ?auto_516884 ?auto_516885 ?auto_516886 ?auto_516887 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_516923 - BLOCK
      ?auto_516924 - BLOCK
      ?auto_516925 - BLOCK
      ?auto_516926 - BLOCK
      ?auto_516927 - BLOCK
      ?auto_516928 - BLOCK
      ?auto_516929 - BLOCK
      ?auto_516930 - BLOCK
      ?auto_516931 - BLOCK
      ?auto_516932 - BLOCK
      ?auto_516933 - BLOCK
    )
    :vars
    (
      ?auto_516934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516933 ?auto_516934 ) ( ON-TABLE ?auto_516923 ) ( ON ?auto_516924 ?auto_516923 ) ( ON ?auto_516925 ?auto_516924 ) ( ON ?auto_516926 ?auto_516925 ) ( ON ?auto_516927 ?auto_516926 ) ( ON ?auto_516928 ?auto_516927 ) ( ON ?auto_516929 ?auto_516928 ) ( not ( = ?auto_516923 ?auto_516924 ) ) ( not ( = ?auto_516923 ?auto_516925 ) ) ( not ( = ?auto_516923 ?auto_516926 ) ) ( not ( = ?auto_516923 ?auto_516927 ) ) ( not ( = ?auto_516923 ?auto_516928 ) ) ( not ( = ?auto_516923 ?auto_516929 ) ) ( not ( = ?auto_516923 ?auto_516930 ) ) ( not ( = ?auto_516923 ?auto_516931 ) ) ( not ( = ?auto_516923 ?auto_516932 ) ) ( not ( = ?auto_516923 ?auto_516933 ) ) ( not ( = ?auto_516923 ?auto_516934 ) ) ( not ( = ?auto_516924 ?auto_516925 ) ) ( not ( = ?auto_516924 ?auto_516926 ) ) ( not ( = ?auto_516924 ?auto_516927 ) ) ( not ( = ?auto_516924 ?auto_516928 ) ) ( not ( = ?auto_516924 ?auto_516929 ) ) ( not ( = ?auto_516924 ?auto_516930 ) ) ( not ( = ?auto_516924 ?auto_516931 ) ) ( not ( = ?auto_516924 ?auto_516932 ) ) ( not ( = ?auto_516924 ?auto_516933 ) ) ( not ( = ?auto_516924 ?auto_516934 ) ) ( not ( = ?auto_516925 ?auto_516926 ) ) ( not ( = ?auto_516925 ?auto_516927 ) ) ( not ( = ?auto_516925 ?auto_516928 ) ) ( not ( = ?auto_516925 ?auto_516929 ) ) ( not ( = ?auto_516925 ?auto_516930 ) ) ( not ( = ?auto_516925 ?auto_516931 ) ) ( not ( = ?auto_516925 ?auto_516932 ) ) ( not ( = ?auto_516925 ?auto_516933 ) ) ( not ( = ?auto_516925 ?auto_516934 ) ) ( not ( = ?auto_516926 ?auto_516927 ) ) ( not ( = ?auto_516926 ?auto_516928 ) ) ( not ( = ?auto_516926 ?auto_516929 ) ) ( not ( = ?auto_516926 ?auto_516930 ) ) ( not ( = ?auto_516926 ?auto_516931 ) ) ( not ( = ?auto_516926 ?auto_516932 ) ) ( not ( = ?auto_516926 ?auto_516933 ) ) ( not ( = ?auto_516926 ?auto_516934 ) ) ( not ( = ?auto_516927 ?auto_516928 ) ) ( not ( = ?auto_516927 ?auto_516929 ) ) ( not ( = ?auto_516927 ?auto_516930 ) ) ( not ( = ?auto_516927 ?auto_516931 ) ) ( not ( = ?auto_516927 ?auto_516932 ) ) ( not ( = ?auto_516927 ?auto_516933 ) ) ( not ( = ?auto_516927 ?auto_516934 ) ) ( not ( = ?auto_516928 ?auto_516929 ) ) ( not ( = ?auto_516928 ?auto_516930 ) ) ( not ( = ?auto_516928 ?auto_516931 ) ) ( not ( = ?auto_516928 ?auto_516932 ) ) ( not ( = ?auto_516928 ?auto_516933 ) ) ( not ( = ?auto_516928 ?auto_516934 ) ) ( not ( = ?auto_516929 ?auto_516930 ) ) ( not ( = ?auto_516929 ?auto_516931 ) ) ( not ( = ?auto_516929 ?auto_516932 ) ) ( not ( = ?auto_516929 ?auto_516933 ) ) ( not ( = ?auto_516929 ?auto_516934 ) ) ( not ( = ?auto_516930 ?auto_516931 ) ) ( not ( = ?auto_516930 ?auto_516932 ) ) ( not ( = ?auto_516930 ?auto_516933 ) ) ( not ( = ?auto_516930 ?auto_516934 ) ) ( not ( = ?auto_516931 ?auto_516932 ) ) ( not ( = ?auto_516931 ?auto_516933 ) ) ( not ( = ?auto_516931 ?auto_516934 ) ) ( not ( = ?auto_516932 ?auto_516933 ) ) ( not ( = ?auto_516932 ?auto_516934 ) ) ( not ( = ?auto_516933 ?auto_516934 ) ) ( ON ?auto_516932 ?auto_516933 ) ( ON ?auto_516931 ?auto_516932 ) ( CLEAR ?auto_516929 ) ( ON ?auto_516930 ?auto_516931 ) ( CLEAR ?auto_516930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_516923 ?auto_516924 ?auto_516925 ?auto_516926 ?auto_516927 ?auto_516928 ?auto_516929 ?auto_516930 )
      ( MAKE-11PILE ?auto_516923 ?auto_516924 ?auto_516925 ?auto_516926 ?auto_516927 ?auto_516928 ?auto_516929 ?auto_516930 ?auto_516931 ?auto_516932 ?auto_516933 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_516969 - BLOCK
      ?auto_516970 - BLOCK
      ?auto_516971 - BLOCK
      ?auto_516972 - BLOCK
      ?auto_516973 - BLOCK
      ?auto_516974 - BLOCK
      ?auto_516975 - BLOCK
      ?auto_516976 - BLOCK
      ?auto_516977 - BLOCK
      ?auto_516978 - BLOCK
      ?auto_516979 - BLOCK
    )
    :vars
    (
      ?auto_516980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_516979 ?auto_516980 ) ( ON-TABLE ?auto_516969 ) ( ON ?auto_516970 ?auto_516969 ) ( ON ?auto_516971 ?auto_516970 ) ( ON ?auto_516972 ?auto_516971 ) ( ON ?auto_516973 ?auto_516972 ) ( ON ?auto_516974 ?auto_516973 ) ( not ( = ?auto_516969 ?auto_516970 ) ) ( not ( = ?auto_516969 ?auto_516971 ) ) ( not ( = ?auto_516969 ?auto_516972 ) ) ( not ( = ?auto_516969 ?auto_516973 ) ) ( not ( = ?auto_516969 ?auto_516974 ) ) ( not ( = ?auto_516969 ?auto_516975 ) ) ( not ( = ?auto_516969 ?auto_516976 ) ) ( not ( = ?auto_516969 ?auto_516977 ) ) ( not ( = ?auto_516969 ?auto_516978 ) ) ( not ( = ?auto_516969 ?auto_516979 ) ) ( not ( = ?auto_516969 ?auto_516980 ) ) ( not ( = ?auto_516970 ?auto_516971 ) ) ( not ( = ?auto_516970 ?auto_516972 ) ) ( not ( = ?auto_516970 ?auto_516973 ) ) ( not ( = ?auto_516970 ?auto_516974 ) ) ( not ( = ?auto_516970 ?auto_516975 ) ) ( not ( = ?auto_516970 ?auto_516976 ) ) ( not ( = ?auto_516970 ?auto_516977 ) ) ( not ( = ?auto_516970 ?auto_516978 ) ) ( not ( = ?auto_516970 ?auto_516979 ) ) ( not ( = ?auto_516970 ?auto_516980 ) ) ( not ( = ?auto_516971 ?auto_516972 ) ) ( not ( = ?auto_516971 ?auto_516973 ) ) ( not ( = ?auto_516971 ?auto_516974 ) ) ( not ( = ?auto_516971 ?auto_516975 ) ) ( not ( = ?auto_516971 ?auto_516976 ) ) ( not ( = ?auto_516971 ?auto_516977 ) ) ( not ( = ?auto_516971 ?auto_516978 ) ) ( not ( = ?auto_516971 ?auto_516979 ) ) ( not ( = ?auto_516971 ?auto_516980 ) ) ( not ( = ?auto_516972 ?auto_516973 ) ) ( not ( = ?auto_516972 ?auto_516974 ) ) ( not ( = ?auto_516972 ?auto_516975 ) ) ( not ( = ?auto_516972 ?auto_516976 ) ) ( not ( = ?auto_516972 ?auto_516977 ) ) ( not ( = ?auto_516972 ?auto_516978 ) ) ( not ( = ?auto_516972 ?auto_516979 ) ) ( not ( = ?auto_516972 ?auto_516980 ) ) ( not ( = ?auto_516973 ?auto_516974 ) ) ( not ( = ?auto_516973 ?auto_516975 ) ) ( not ( = ?auto_516973 ?auto_516976 ) ) ( not ( = ?auto_516973 ?auto_516977 ) ) ( not ( = ?auto_516973 ?auto_516978 ) ) ( not ( = ?auto_516973 ?auto_516979 ) ) ( not ( = ?auto_516973 ?auto_516980 ) ) ( not ( = ?auto_516974 ?auto_516975 ) ) ( not ( = ?auto_516974 ?auto_516976 ) ) ( not ( = ?auto_516974 ?auto_516977 ) ) ( not ( = ?auto_516974 ?auto_516978 ) ) ( not ( = ?auto_516974 ?auto_516979 ) ) ( not ( = ?auto_516974 ?auto_516980 ) ) ( not ( = ?auto_516975 ?auto_516976 ) ) ( not ( = ?auto_516975 ?auto_516977 ) ) ( not ( = ?auto_516975 ?auto_516978 ) ) ( not ( = ?auto_516975 ?auto_516979 ) ) ( not ( = ?auto_516975 ?auto_516980 ) ) ( not ( = ?auto_516976 ?auto_516977 ) ) ( not ( = ?auto_516976 ?auto_516978 ) ) ( not ( = ?auto_516976 ?auto_516979 ) ) ( not ( = ?auto_516976 ?auto_516980 ) ) ( not ( = ?auto_516977 ?auto_516978 ) ) ( not ( = ?auto_516977 ?auto_516979 ) ) ( not ( = ?auto_516977 ?auto_516980 ) ) ( not ( = ?auto_516978 ?auto_516979 ) ) ( not ( = ?auto_516978 ?auto_516980 ) ) ( not ( = ?auto_516979 ?auto_516980 ) ) ( ON ?auto_516978 ?auto_516979 ) ( ON ?auto_516977 ?auto_516978 ) ( ON ?auto_516976 ?auto_516977 ) ( CLEAR ?auto_516974 ) ( ON ?auto_516975 ?auto_516976 ) ( CLEAR ?auto_516975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_516969 ?auto_516970 ?auto_516971 ?auto_516972 ?auto_516973 ?auto_516974 ?auto_516975 )
      ( MAKE-11PILE ?auto_516969 ?auto_516970 ?auto_516971 ?auto_516972 ?auto_516973 ?auto_516974 ?auto_516975 ?auto_516976 ?auto_516977 ?auto_516978 ?auto_516979 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_517015 - BLOCK
      ?auto_517016 - BLOCK
      ?auto_517017 - BLOCK
      ?auto_517018 - BLOCK
      ?auto_517019 - BLOCK
      ?auto_517020 - BLOCK
      ?auto_517021 - BLOCK
      ?auto_517022 - BLOCK
      ?auto_517023 - BLOCK
      ?auto_517024 - BLOCK
      ?auto_517025 - BLOCK
    )
    :vars
    (
      ?auto_517026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517025 ?auto_517026 ) ( ON-TABLE ?auto_517015 ) ( ON ?auto_517016 ?auto_517015 ) ( ON ?auto_517017 ?auto_517016 ) ( ON ?auto_517018 ?auto_517017 ) ( ON ?auto_517019 ?auto_517018 ) ( not ( = ?auto_517015 ?auto_517016 ) ) ( not ( = ?auto_517015 ?auto_517017 ) ) ( not ( = ?auto_517015 ?auto_517018 ) ) ( not ( = ?auto_517015 ?auto_517019 ) ) ( not ( = ?auto_517015 ?auto_517020 ) ) ( not ( = ?auto_517015 ?auto_517021 ) ) ( not ( = ?auto_517015 ?auto_517022 ) ) ( not ( = ?auto_517015 ?auto_517023 ) ) ( not ( = ?auto_517015 ?auto_517024 ) ) ( not ( = ?auto_517015 ?auto_517025 ) ) ( not ( = ?auto_517015 ?auto_517026 ) ) ( not ( = ?auto_517016 ?auto_517017 ) ) ( not ( = ?auto_517016 ?auto_517018 ) ) ( not ( = ?auto_517016 ?auto_517019 ) ) ( not ( = ?auto_517016 ?auto_517020 ) ) ( not ( = ?auto_517016 ?auto_517021 ) ) ( not ( = ?auto_517016 ?auto_517022 ) ) ( not ( = ?auto_517016 ?auto_517023 ) ) ( not ( = ?auto_517016 ?auto_517024 ) ) ( not ( = ?auto_517016 ?auto_517025 ) ) ( not ( = ?auto_517016 ?auto_517026 ) ) ( not ( = ?auto_517017 ?auto_517018 ) ) ( not ( = ?auto_517017 ?auto_517019 ) ) ( not ( = ?auto_517017 ?auto_517020 ) ) ( not ( = ?auto_517017 ?auto_517021 ) ) ( not ( = ?auto_517017 ?auto_517022 ) ) ( not ( = ?auto_517017 ?auto_517023 ) ) ( not ( = ?auto_517017 ?auto_517024 ) ) ( not ( = ?auto_517017 ?auto_517025 ) ) ( not ( = ?auto_517017 ?auto_517026 ) ) ( not ( = ?auto_517018 ?auto_517019 ) ) ( not ( = ?auto_517018 ?auto_517020 ) ) ( not ( = ?auto_517018 ?auto_517021 ) ) ( not ( = ?auto_517018 ?auto_517022 ) ) ( not ( = ?auto_517018 ?auto_517023 ) ) ( not ( = ?auto_517018 ?auto_517024 ) ) ( not ( = ?auto_517018 ?auto_517025 ) ) ( not ( = ?auto_517018 ?auto_517026 ) ) ( not ( = ?auto_517019 ?auto_517020 ) ) ( not ( = ?auto_517019 ?auto_517021 ) ) ( not ( = ?auto_517019 ?auto_517022 ) ) ( not ( = ?auto_517019 ?auto_517023 ) ) ( not ( = ?auto_517019 ?auto_517024 ) ) ( not ( = ?auto_517019 ?auto_517025 ) ) ( not ( = ?auto_517019 ?auto_517026 ) ) ( not ( = ?auto_517020 ?auto_517021 ) ) ( not ( = ?auto_517020 ?auto_517022 ) ) ( not ( = ?auto_517020 ?auto_517023 ) ) ( not ( = ?auto_517020 ?auto_517024 ) ) ( not ( = ?auto_517020 ?auto_517025 ) ) ( not ( = ?auto_517020 ?auto_517026 ) ) ( not ( = ?auto_517021 ?auto_517022 ) ) ( not ( = ?auto_517021 ?auto_517023 ) ) ( not ( = ?auto_517021 ?auto_517024 ) ) ( not ( = ?auto_517021 ?auto_517025 ) ) ( not ( = ?auto_517021 ?auto_517026 ) ) ( not ( = ?auto_517022 ?auto_517023 ) ) ( not ( = ?auto_517022 ?auto_517024 ) ) ( not ( = ?auto_517022 ?auto_517025 ) ) ( not ( = ?auto_517022 ?auto_517026 ) ) ( not ( = ?auto_517023 ?auto_517024 ) ) ( not ( = ?auto_517023 ?auto_517025 ) ) ( not ( = ?auto_517023 ?auto_517026 ) ) ( not ( = ?auto_517024 ?auto_517025 ) ) ( not ( = ?auto_517024 ?auto_517026 ) ) ( not ( = ?auto_517025 ?auto_517026 ) ) ( ON ?auto_517024 ?auto_517025 ) ( ON ?auto_517023 ?auto_517024 ) ( ON ?auto_517022 ?auto_517023 ) ( ON ?auto_517021 ?auto_517022 ) ( CLEAR ?auto_517019 ) ( ON ?auto_517020 ?auto_517021 ) ( CLEAR ?auto_517020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_517015 ?auto_517016 ?auto_517017 ?auto_517018 ?auto_517019 ?auto_517020 )
      ( MAKE-11PILE ?auto_517015 ?auto_517016 ?auto_517017 ?auto_517018 ?auto_517019 ?auto_517020 ?auto_517021 ?auto_517022 ?auto_517023 ?auto_517024 ?auto_517025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_517061 - BLOCK
      ?auto_517062 - BLOCK
      ?auto_517063 - BLOCK
      ?auto_517064 - BLOCK
      ?auto_517065 - BLOCK
      ?auto_517066 - BLOCK
      ?auto_517067 - BLOCK
      ?auto_517068 - BLOCK
      ?auto_517069 - BLOCK
      ?auto_517070 - BLOCK
      ?auto_517071 - BLOCK
    )
    :vars
    (
      ?auto_517072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517071 ?auto_517072 ) ( ON-TABLE ?auto_517061 ) ( ON ?auto_517062 ?auto_517061 ) ( ON ?auto_517063 ?auto_517062 ) ( ON ?auto_517064 ?auto_517063 ) ( not ( = ?auto_517061 ?auto_517062 ) ) ( not ( = ?auto_517061 ?auto_517063 ) ) ( not ( = ?auto_517061 ?auto_517064 ) ) ( not ( = ?auto_517061 ?auto_517065 ) ) ( not ( = ?auto_517061 ?auto_517066 ) ) ( not ( = ?auto_517061 ?auto_517067 ) ) ( not ( = ?auto_517061 ?auto_517068 ) ) ( not ( = ?auto_517061 ?auto_517069 ) ) ( not ( = ?auto_517061 ?auto_517070 ) ) ( not ( = ?auto_517061 ?auto_517071 ) ) ( not ( = ?auto_517061 ?auto_517072 ) ) ( not ( = ?auto_517062 ?auto_517063 ) ) ( not ( = ?auto_517062 ?auto_517064 ) ) ( not ( = ?auto_517062 ?auto_517065 ) ) ( not ( = ?auto_517062 ?auto_517066 ) ) ( not ( = ?auto_517062 ?auto_517067 ) ) ( not ( = ?auto_517062 ?auto_517068 ) ) ( not ( = ?auto_517062 ?auto_517069 ) ) ( not ( = ?auto_517062 ?auto_517070 ) ) ( not ( = ?auto_517062 ?auto_517071 ) ) ( not ( = ?auto_517062 ?auto_517072 ) ) ( not ( = ?auto_517063 ?auto_517064 ) ) ( not ( = ?auto_517063 ?auto_517065 ) ) ( not ( = ?auto_517063 ?auto_517066 ) ) ( not ( = ?auto_517063 ?auto_517067 ) ) ( not ( = ?auto_517063 ?auto_517068 ) ) ( not ( = ?auto_517063 ?auto_517069 ) ) ( not ( = ?auto_517063 ?auto_517070 ) ) ( not ( = ?auto_517063 ?auto_517071 ) ) ( not ( = ?auto_517063 ?auto_517072 ) ) ( not ( = ?auto_517064 ?auto_517065 ) ) ( not ( = ?auto_517064 ?auto_517066 ) ) ( not ( = ?auto_517064 ?auto_517067 ) ) ( not ( = ?auto_517064 ?auto_517068 ) ) ( not ( = ?auto_517064 ?auto_517069 ) ) ( not ( = ?auto_517064 ?auto_517070 ) ) ( not ( = ?auto_517064 ?auto_517071 ) ) ( not ( = ?auto_517064 ?auto_517072 ) ) ( not ( = ?auto_517065 ?auto_517066 ) ) ( not ( = ?auto_517065 ?auto_517067 ) ) ( not ( = ?auto_517065 ?auto_517068 ) ) ( not ( = ?auto_517065 ?auto_517069 ) ) ( not ( = ?auto_517065 ?auto_517070 ) ) ( not ( = ?auto_517065 ?auto_517071 ) ) ( not ( = ?auto_517065 ?auto_517072 ) ) ( not ( = ?auto_517066 ?auto_517067 ) ) ( not ( = ?auto_517066 ?auto_517068 ) ) ( not ( = ?auto_517066 ?auto_517069 ) ) ( not ( = ?auto_517066 ?auto_517070 ) ) ( not ( = ?auto_517066 ?auto_517071 ) ) ( not ( = ?auto_517066 ?auto_517072 ) ) ( not ( = ?auto_517067 ?auto_517068 ) ) ( not ( = ?auto_517067 ?auto_517069 ) ) ( not ( = ?auto_517067 ?auto_517070 ) ) ( not ( = ?auto_517067 ?auto_517071 ) ) ( not ( = ?auto_517067 ?auto_517072 ) ) ( not ( = ?auto_517068 ?auto_517069 ) ) ( not ( = ?auto_517068 ?auto_517070 ) ) ( not ( = ?auto_517068 ?auto_517071 ) ) ( not ( = ?auto_517068 ?auto_517072 ) ) ( not ( = ?auto_517069 ?auto_517070 ) ) ( not ( = ?auto_517069 ?auto_517071 ) ) ( not ( = ?auto_517069 ?auto_517072 ) ) ( not ( = ?auto_517070 ?auto_517071 ) ) ( not ( = ?auto_517070 ?auto_517072 ) ) ( not ( = ?auto_517071 ?auto_517072 ) ) ( ON ?auto_517070 ?auto_517071 ) ( ON ?auto_517069 ?auto_517070 ) ( ON ?auto_517068 ?auto_517069 ) ( ON ?auto_517067 ?auto_517068 ) ( ON ?auto_517066 ?auto_517067 ) ( CLEAR ?auto_517064 ) ( ON ?auto_517065 ?auto_517066 ) ( CLEAR ?auto_517065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_517061 ?auto_517062 ?auto_517063 ?auto_517064 ?auto_517065 )
      ( MAKE-11PILE ?auto_517061 ?auto_517062 ?auto_517063 ?auto_517064 ?auto_517065 ?auto_517066 ?auto_517067 ?auto_517068 ?auto_517069 ?auto_517070 ?auto_517071 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_517107 - BLOCK
      ?auto_517108 - BLOCK
      ?auto_517109 - BLOCK
      ?auto_517110 - BLOCK
      ?auto_517111 - BLOCK
      ?auto_517112 - BLOCK
      ?auto_517113 - BLOCK
      ?auto_517114 - BLOCK
      ?auto_517115 - BLOCK
      ?auto_517116 - BLOCK
      ?auto_517117 - BLOCK
    )
    :vars
    (
      ?auto_517118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517117 ?auto_517118 ) ( ON-TABLE ?auto_517107 ) ( ON ?auto_517108 ?auto_517107 ) ( ON ?auto_517109 ?auto_517108 ) ( not ( = ?auto_517107 ?auto_517108 ) ) ( not ( = ?auto_517107 ?auto_517109 ) ) ( not ( = ?auto_517107 ?auto_517110 ) ) ( not ( = ?auto_517107 ?auto_517111 ) ) ( not ( = ?auto_517107 ?auto_517112 ) ) ( not ( = ?auto_517107 ?auto_517113 ) ) ( not ( = ?auto_517107 ?auto_517114 ) ) ( not ( = ?auto_517107 ?auto_517115 ) ) ( not ( = ?auto_517107 ?auto_517116 ) ) ( not ( = ?auto_517107 ?auto_517117 ) ) ( not ( = ?auto_517107 ?auto_517118 ) ) ( not ( = ?auto_517108 ?auto_517109 ) ) ( not ( = ?auto_517108 ?auto_517110 ) ) ( not ( = ?auto_517108 ?auto_517111 ) ) ( not ( = ?auto_517108 ?auto_517112 ) ) ( not ( = ?auto_517108 ?auto_517113 ) ) ( not ( = ?auto_517108 ?auto_517114 ) ) ( not ( = ?auto_517108 ?auto_517115 ) ) ( not ( = ?auto_517108 ?auto_517116 ) ) ( not ( = ?auto_517108 ?auto_517117 ) ) ( not ( = ?auto_517108 ?auto_517118 ) ) ( not ( = ?auto_517109 ?auto_517110 ) ) ( not ( = ?auto_517109 ?auto_517111 ) ) ( not ( = ?auto_517109 ?auto_517112 ) ) ( not ( = ?auto_517109 ?auto_517113 ) ) ( not ( = ?auto_517109 ?auto_517114 ) ) ( not ( = ?auto_517109 ?auto_517115 ) ) ( not ( = ?auto_517109 ?auto_517116 ) ) ( not ( = ?auto_517109 ?auto_517117 ) ) ( not ( = ?auto_517109 ?auto_517118 ) ) ( not ( = ?auto_517110 ?auto_517111 ) ) ( not ( = ?auto_517110 ?auto_517112 ) ) ( not ( = ?auto_517110 ?auto_517113 ) ) ( not ( = ?auto_517110 ?auto_517114 ) ) ( not ( = ?auto_517110 ?auto_517115 ) ) ( not ( = ?auto_517110 ?auto_517116 ) ) ( not ( = ?auto_517110 ?auto_517117 ) ) ( not ( = ?auto_517110 ?auto_517118 ) ) ( not ( = ?auto_517111 ?auto_517112 ) ) ( not ( = ?auto_517111 ?auto_517113 ) ) ( not ( = ?auto_517111 ?auto_517114 ) ) ( not ( = ?auto_517111 ?auto_517115 ) ) ( not ( = ?auto_517111 ?auto_517116 ) ) ( not ( = ?auto_517111 ?auto_517117 ) ) ( not ( = ?auto_517111 ?auto_517118 ) ) ( not ( = ?auto_517112 ?auto_517113 ) ) ( not ( = ?auto_517112 ?auto_517114 ) ) ( not ( = ?auto_517112 ?auto_517115 ) ) ( not ( = ?auto_517112 ?auto_517116 ) ) ( not ( = ?auto_517112 ?auto_517117 ) ) ( not ( = ?auto_517112 ?auto_517118 ) ) ( not ( = ?auto_517113 ?auto_517114 ) ) ( not ( = ?auto_517113 ?auto_517115 ) ) ( not ( = ?auto_517113 ?auto_517116 ) ) ( not ( = ?auto_517113 ?auto_517117 ) ) ( not ( = ?auto_517113 ?auto_517118 ) ) ( not ( = ?auto_517114 ?auto_517115 ) ) ( not ( = ?auto_517114 ?auto_517116 ) ) ( not ( = ?auto_517114 ?auto_517117 ) ) ( not ( = ?auto_517114 ?auto_517118 ) ) ( not ( = ?auto_517115 ?auto_517116 ) ) ( not ( = ?auto_517115 ?auto_517117 ) ) ( not ( = ?auto_517115 ?auto_517118 ) ) ( not ( = ?auto_517116 ?auto_517117 ) ) ( not ( = ?auto_517116 ?auto_517118 ) ) ( not ( = ?auto_517117 ?auto_517118 ) ) ( ON ?auto_517116 ?auto_517117 ) ( ON ?auto_517115 ?auto_517116 ) ( ON ?auto_517114 ?auto_517115 ) ( ON ?auto_517113 ?auto_517114 ) ( ON ?auto_517112 ?auto_517113 ) ( ON ?auto_517111 ?auto_517112 ) ( CLEAR ?auto_517109 ) ( ON ?auto_517110 ?auto_517111 ) ( CLEAR ?auto_517110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_517107 ?auto_517108 ?auto_517109 ?auto_517110 )
      ( MAKE-11PILE ?auto_517107 ?auto_517108 ?auto_517109 ?auto_517110 ?auto_517111 ?auto_517112 ?auto_517113 ?auto_517114 ?auto_517115 ?auto_517116 ?auto_517117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_517153 - BLOCK
      ?auto_517154 - BLOCK
      ?auto_517155 - BLOCK
      ?auto_517156 - BLOCK
      ?auto_517157 - BLOCK
      ?auto_517158 - BLOCK
      ?auto_517159 - BLOCK
      ?auto_517160 - BLOCK
      ?auto_517161 - BLOCK
      ?auto_517162 - BLOCK
      ?auto_517163 - BLOCK
    )
    :vars
    (
      ?auto_517164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517163 ?auto_517164 ) ( ON-TABLE ?auto_517153 ) ( ON ?auto_517154 ?auto_517153 ) ( not ( = ?auto_517153 ?auto_517154 ) ) ( not ( = ?auto_517153 ?auto_517155 ) ) ( not ( = ?auto_517153 ?auto_517156 ) ) ( not ( = ?auto_517153 ?auto_517157 ) ) ( not ( = ?auto_517153 ?auto_517158 ) ) ( not ( = ?auto_517153 ?auto_517159 ) ) ( not ( = ?auto_517153 ?auto_517160 ) ) ( not ( = ?auto_517153 ?auto_517161 ) ) ( not ( = ?auto_517153 ?auto_517162 ) ) ( not ( = ?auto_517153 ?auto_517163 ) ) ( not ( = ?auto_517153 ?auto_517164 ) ) ( not ( = ?auto_517154 ?auto_517155 ) ) ( not ( = ?auto_517154 ?auto_517156 ) ) ( not ( = ?auto_517154 ?auto_517157 ) ) ( not ( = ?auto_517154 ?auto_517158 ) ) ( not ( = ?auto_517154 ?auto_517159 ) ) ( not ( = ?auto_517154 ?auto_517160 ) ) ( not ( = ?auto_517154 ?auto_517161 ) ) ( not ( = ?auto_517154 ?auto_517162 ) ) ( not ( = ?auto_517154 ?auto_517163 ) ) ( not ( = ?auto_517154 ?auto_517164 ) ) ( not ( = ?auto_517155 ?auto_517156 ) ) ( not ( = ?auto_517155 ?auto_517157 ) ) ( not ( = ?auto_517155 ?auto_517158 ) ) ( not ( = ?auto_517155 ?auto_517159 ) ) ( not ( = ?auto_517155 ?auto_517160 ) ) ( not ( = ?auto_517155 ?auto_517161 ) ) ( not ( = ?auto_517155 ?auto_517162 ) ) ( not ( = ?auto_517155 ?auto_517163 ) ) ( not ( = ?auto_517155 ?auto_517164 ) ) ( not ( = ?auto_517156 ?auto_517157 ) ) ( not ( = ?auto_517156 ?auto_517158 ) ) ( not ( = ?auto_517156 ?auto_517159 ) ) ( not ( = ?auto_517156 ?auto_517160 ) ) ( not ( = ?auto_517156 ?auto_517161 ) ) ( not ( = ?auto_517156 ?auto_517162 ) ) ( not ( = ?auto_517156 ?auto_517163 ) ) ( not ( = ?auto_517156 ?auto_517164 ) ) ( not ( = ?auto_517157 ?auto_517158 ) ) ( not ( = ?auto_517157 ?auto_517159 ) ) ( not ( = ?auto_517157 ?auto_517160 ) ) ( not ( = ?auto_517157 ?auto_517161 ) ) ( not ( = ?auto_517157 ?auto_517162 ) ) ( not ( = ?auto_517157 ?auto_517163 ) ) ( not ( = ?auto_517157 ?auto_517164 ) ) ( not ( = ?auto_517158 ?auto_517159 ) ) ( not ( = ?auto_517158 ?auto_517160 ) ) ( not ( = ?auto_517158 ?auto_517161 ) ) ( not ( = ?auto_517158 ?auto_517162 ) ) ( not ( = ?auto_517158 ?auto_517163 ) ) ( not ( = ?auto_517158 ?auto_517164 ) ) ( not ( = ?auto_517159 ?auto_517160 ) ) ( not ( = ?auto_517159 ?auto_517161 ) ) ( not ( = ?auto_517159 ?auto_517162 ) ) ( not ( = ?auto_517159 ?auto_517163 ) ) ( not ( = ?auto_517159 ?auto_517164 ) ) ( not ( = ?auto_517160 ?auto_517161 ) ) ( not ( = ?auto_517160 ?auto_517162 ) ) ( not ( = ?auto_517160 ?auto_517163 ) ) ( not ( = ?auto_517160 ?auto_517164 ) ) ( not ( = ?auto_517161 ?auto_517162 ) ) ( not ( = ?auto_517161 ?auto_517163 ) ) ( not ( = ?auto_517161 ?auto_517164 ) ) ( not ( = ?auto_517162 ?auto_517163 ) ) ( not ( = ?auto_517162 ?auto_517164 ) ) ( not ( = ?auto_517163 ?auto_517164 ) ) ( ON ?auto_517162 ?auto_517163 ) ( ON ?auto_517161 ?auto_517162 ) ( ON ?auto_517160 ?auto_517161 ) ( ON ?auto_517159 ?auto_517160 ) ( ON ?auto_517158 ?auto_517159 ) ( ON ?auto_517157 ?auto_517158 ) ( ON ?auto_517156 ?auto_517157 ) ( CLEAR ?auto_517154 ) ( ON ?auto_517155 ?auto_517156 ) ( CLEAR ?auto_517155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_517153 ?auto_517154 ?auto_517155 )
      ( MAKE-11PILE ?auto_517153 ?auto_517154 ?auto_517155 ?auto_517156 ?auto_517157 ?auto_517158 ?auto_517159 ?auto_517160 ?auto_517161 ?auto_517162 ?auto_517163 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_517199 - BLOCK
      ?auto_517200 - BLOCK
      ?auto_517201 - BLOCK
      ?auto_517202 - BLOCK
      ?auto_517203 - BLOCK
      ?auto_517204 - BLOCK
      ?auto_517205 - BLOCK
      ?auto_517206 - BLOCK
      ?auto_517207 - BLOCK
      ?auto_517208 - BLOCK
      ?auto_517209 - BLOCK
    )
    :vars
    (
      ?auto_517210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517209 ?auto_517210 ) ( ON-TABLE ?auto_517199 ) ( not ( = ?auto_517199 ?auto_517200 ) ) ( not ( = ?auto_517199 ?auto_517201 ) ) ( not ( = ?auto_517199 ?auto_517202 ) ) ( not ( = ?auto_517199 ?auto_517203 ) ) ( not ( = ?auto_517199 ?auto_517204 ) ) ( not ( = ?auto_517199 ?auto_517205 ) ) ( not ( = ?auto_517199 ?auto_517206 ) ) ( not ( = ?auto_517199 ?auto_517207 ) ) ( not ( = ?auto_517199 ?auto_517208 ) ) ( not ( = ?auto_517199 ?auto_517209 ) ) ( not ( = ?auto_517199 ?auto_517210 ) ) ( not ( = ?auto_517200 ?auto_517201 ) ) ( not ( = ?auto_517200 ?auto_517202 ) ) ( not ( = ?auto_517200 ?auto_517203 ) ) ( not ( = ?auto_517200 ?auto_517204 ) ) ( not ( = ?auto_517200 ?auto_517205 ) ) ( not ( = ?auto_517200 ?auto_517206 ) ) ( not ( = ?auto_517200 ?auto_517207 ) ) ( not ( = ?auto_517200 ?auto_517208 ) ) ( not ( = ?auto_517200 ?auto_517209 ) ) ( not ( = ?auto_517200 ?auto_517210 ) ) ( not ( = ?auto_517201 ?auto_517202 ) ) ( not ( = ?auto_517201 ?auto_517203 ) ) ( not ( = ?auto_517201 ?auto_517204 ) ) ( not ( = ?auto_517201 ?auto_517205 ) ) ( not ( = ?auto_517201 ?auto_517206 ) ) ( not ( = ?auto_517201 ?auto_517207 ) ) ( not ( = ?auto_517201 ?auto_517208 ) ) ( not ( = ?auto_517201 ?auto_517209 ) ) ( not ( = ?auto_517201 ?auto_517210 ) ) ( not ( = ?auto_517202 ?auto_517203 ) ) ( not ( = ?auto_517202 ?auto_517204 ) ) ( not ( = ?auto_517202 ?auto_517205 ) ) ( not ( = ?auto_517202 ?auto_517206 ) ) ( not ( = ?auto_517202 ?auto_517207 ) ) ( not ( = ?auto_517202 ?auto_517208 ) ) ( not ( = ?auto_517202 ?auto_517209 ) ) ( not ( = ?auto_517202 ?auto_517210 ) ) ( not ( = ?auto_517203 ?auto_517204 ) ) ( not ( = ?auto_517203 ?auto_517205 ) ) ( not ( = ?auto_517203 ?auto_517206 ) ) ( not ( = ?auto_517203 ?auto_517207 ) ) ( not ( = ?auto_517203 ?auto_517208 ) ) ( not ( = ?auto_517203 ?auto_517209 ) ) ( not ( = ?auto_517203 ?auto_517210 ) ) ( not ( = ?auto_517204 ?auto_517205 ) ) ( not ( = ?auto_517204 ?auto_517206 ) ) ( not ( = ?auto_517204 ?auto_517207 ) ) ( not ( = ?auto_517204 ?auto_517208 ) ) ( not ( = ?auto_517204 ?auto_517209 ) ) ( not ( = ?auto_517204 ?auto_517210 ) ) ( not ( = ?auto_517205 ?auto_517206 ) ) ( not ( = ?auto_517205 ?auto_517207 ) ) ( not ( = ?auto_517205 ?auto_517208 ) ) ( not ( = ?auto_517205 ?auto_517209 ) ) ( not ( = ?auto_517205 ?auto_517210 ) ) ( not ( = ?auto_517206 ?auto_517207 ) ) ( not ( = ?auto_517206 ?auto_517208 ) ) ( not ( = ?auto_517206 ?auto_517209 ) ) ( not ( = ?auto_517206 ?auto_517210 ) ) ( not ( = ?auto_517207 ?auto_517208 ) ) ( not ( = ?auto_517207 ?auto_517209 ) ) ( not ( = ?auto_517207 ?auto_517210 ) ) ( not ( = ?auto_517208 ?auto_517209 ) ) ( not ( = ?auto_517208 ?auto_517210 ) ) ( not ( = ?auto_517209 ?auto_517210 ) ) ( ON ?auto_517208 ?auto_517209 ) ( ON ?auto_517207 ?auto_517208 ) ( ON ?auto_517206 ?auto_517207 ) ( ON ?auto_517205 ?auto_517206 ) ( ON ?auto_517204 ?auto_517205 ) ( ON ?auto_517203 ?auto_517204 ) ( ON ?auto_517202 ?auto_517203 ) ( ON ?auto_517201 ?auto_517202 ) ( CLEAR ?auto_517199 ) ( ON ?auto_517200 ?auto_517201 ) ( CLEAR ?auto_517200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_517199 ?auto_517200 )
      ( MAKE-11PILE ?auto_517199 ?auto_517200 ?auto_517201 ?auto_517202 ?auto_517203 ?auto_517204 ?auto_517205 ?auto_517206 ?auto_517207 ?auto_517208 ?auto_517209 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_517245 - BLOCK
      ?auto_517246 - BLOCK
      ?auto_517247 - BLOCK
      ?auto_517248 - BLOCK
      ?auto_517249 - BLOCK
      ?auto_517250 - BLOCK
      ?auto_517251 - BLOCK
      ?auto_517252 - BLOCK
      ?auto_517253 - BLOCK
      ?auto_517254 - BLOCK
      ?auto_517255 - BLOCK
    )
    :vars
    (
      ?auto_517256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517255 ?auto_517256 ) ( not ( = ?auto_517245 ?auto_517246 ) ) ( not ( = ?auto_517245 ?auto_517247 ) ) ( not ( = ?auto_517245 ?auto_517248 ) ) ( not ( = ?auto_517245 ?auto_517249 ) ) ( not ( = ?auto_517245 ?auto_517250 ) ) ( not ( = ?auto_517245 ?auto_517251 ) ) ( not ( = ?auto_517245 ?auto_517252 ) ) ( not ( = ?auto_517245 ?auto_517253 ) ) ( not ( = ?auto_517245 ?auto_517254 ) ) ( not ( = ?auto_517245 ?auto_517255 ) ) ( not ( = ?auto_517245 ?auto_517256 ) ) ( not ( = ?auto_517246 ?auto_517247 ) ) ( not ( = ?auto_517246 ?auto_517248 ) ) ( not ( = ?auto_517246 ?auto_517249 ) ) ( not ( = ?auto_517246 ?auto_517250 ) ) ( not ( = ?auto_517246 ?auto_517251 ) ) ( not ( = ?auto_517246 ?auto_517252 ) ) ( not ( = ?auto_517246 ?auto_517253 ) ) ( not ( = ?auto_517246 ?auto_517254 ) ) ( not ( = ?auto_517246 ?auto_517255 ) ) ( not ( = ?auto_517246 ?auto_517256 ) ) ( not ( = ?auto_517247 ?auto_517248 ) ) ( not ( = ?auto_517247 ?auto_517249 ) ) ( not ( = ?auto_517247 ?auto_517250 ) ) ( not ( = ?auto_517247 ?auto_517251 ) ) ( not ( = ?auto_517247 ?auto_517252 ) ) ( not ( = ?auto_517247 ?auto_517253 ) ) ( not ( = ?auto_517247 ?auto_517254 ) ) ( not ( = ?auto_517247 ?auto_517255 ) ) ( not ( = ?auto_517247 ?auto_517256 ) ) ( not ( = ?auto_517248 ?auto_517249 ) ) ( not ( = ?auto_517248 ?auto_517250 ) ) ( not ( = ?auto_517248 ?auto_517251 ) ) ( not ( = ?auto_517248 ?auto_517252 ) ) ( not ( = ?auto_517248 ?auto_517253 ) ) ( not ( = ?auto_517248 ?auto_517254 ) ) ( not ( = ?auto_517248 ?auto_517255 ) ) ( not ( = ?auto_517248 ?auto_517256 ) ) ( not ( = ?auto_517249 ?auto_517250 ) ) ( not ( = ?auto_517249 ?auto_517251 ) ) ( not ( = ?auto_517249 ?auto_517252 ) ) ( not ( = ?auto_517249 ?auto_517253 ) ) ( not ( = ?auto_517249 ?auto_517254 ) ) ( not ( = ?auto_517249 ?auto_517255 ) ) ( not ( = ?auto_517249 ?auto_517256 ) ) ( not ( = ?auto_517250 ?auto_517251 ) ) ( not ( = ?auto_517250 ?auto_517252 ) ) ( not ( = ?auto_517250 ?auto_517253 ) ) ( not ( = ?auto_517250 ?auto_517254 ) ) ( not ( = ?auto_517250 ?auto_517255 ) ) ( not ( = ?auto_517250 ?auto_517256 ) ) ( not ( = ?auto_517251 ?auto_517252 ) ) ( not ( = ?auto_517251 ?auto_517253 ) ) ( not ( = ?auto_517251 ?auto_517254 ) ) ( not ( = ?auto_517251 ?auto_517255 ) ) ( not ( = ?auto_517251 ?auto_517256 ) ) ( not ( = ?auto_517252 ?auto_517253 ) ) ( not ( = ?auto_517252 ?auto_517254 ) ) ( not ( = ?auto_517252 ?auto_517255 ) ) ( not ( = ?auto_517252 ?auto_517256 ) ) ( not ( = ?auto_517253 ?auto_517254 ) ) ( not ( = ?auto_517253 ?auto_517255 ) ) ( not ( = ?auto_517253 ?auto_517256 ) ) ( not ( = ?auto_517254 ?auto_517255 ) ) ( not ( = ?auto_517254 ?auto_517256 ) ) ( not ( = ?auto_517255 ?auto_517256 ) ) ( ON ?auto_517254 ?auto_517255 ) ( ON ?auto_517253 ?auto_517254 ) ( ON ?auto_517252 ?auto_517253 ) ( ON ?auto_517251 ?auto_517252 ) ( ON ?auto_517250 ?auto_517251 ) ( ON ?auto_517249 ?auto_517250 ) ( ON ?auto_517248 ?auto_517249 ) ( ON ?auto_517247 ?auto_517248 ) ( ON ?auto_517246 ?auto_517247 ) ( ON ?auto_517245 ?auto_517246 ) ( CLEAR ?auto_517245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_517245 )
      ( MAKE-11PILE ?auto_517245 ?auto_517246 ?auto_517247 ?auto_517248 ?auto_517249 ?auto_517250 ?auto_517251 ?auto_517252 ?auto_517253 ?auto_517254 ?auto_517255 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517292 - BLOCK
      ?auto_517293 - BLOCK
      ?auto_517294 - BLOCK
      ?auto_517295 - BLOCK
      ?auto_517296 - BLOCK
      ?auto_517297 - BLOCK
      ?auto_517298 - BLOCK
      ?auto_517299 - BLOCK
      ?auto_517300 - BLOCK
      ?auto_517301 - BLOCK
      ?auto_517302 - BLOCK
      ?auto_517303 - BLOCK
    )
    :vars
    (
      ?auto_517304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_517302 ) ( ON ?auto_517303 ?auto_517304 ) ( CLEAR ?auto_517303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_517292 ) ( ON ?auto_517293 ?auto_517292 ) ( ON ?auto_517294 ?auto_517293 ) ( ON ?auto_517295 ?auto_517294 ) ( ON ?auto_517296 ?auto_517295 ) ( ON ?auto_517297 ?auto_517296 ) ( ON ?auto_517298 ?auto_517297 ) ( ON ?auto_517299 ?auto_517298 ) ( ON ?auto_517300 ?auto_517299 ) ( ON ?auto_517301 ?auto_517300 ) ( ON ?auto_517302 ?auto_517301 ) ( not ( = ?auto_517292 ?auto_517293 ) ) ( not ( = ?auto_517292 ?auto_517294 ) ) ( not ( = ?auto_517292 ?auto_517295 ) ) ( not ( = ?auto_517292 ?auto_517296 ) ) ( not ( = ?auto_517292 ?auto_517297 ) ) ( not ( = ?auto_517292 ?auto_517298 ) ) ( not ( = ?auto_517292 ?auto_517299 ) ) ( not ( = ?auto_517292 ?auto_517300 ) ) ( not ( = ?auto_517292 ?auto_517301 ) ) ( not ( = ?auto_517292 ?auto_517302 ) ) ( not ( = ?auto_517292 ?auto_517303 ) ) ( not ( = ?auto_517292 ?auto_517304 ) ) ( not ( = ?auto_517293 ?auto_517294 ) ) ( not ( = ?auto_517293 ?auto_517295 ) ) ( not ( = ?auto_517293 ?auto_517296 ) ) ( not ( = ?auto_517293 ?auto_517297 ) ) ( not ( = ?auto_517293 ?auto_517298 ) ) ( not ( = ?auto_517293 ?auto_517299 ) ) ( not ( = ?auto_517293 ?auto_517300 ) ) ( not ( = ?auto_517293 ?auto_517301 ) ) ( not ( = ?auto_517293 ?auto_517302 ) ) ( not ( = ?auto_517293 ?auto_517303 ) ) ( not ( = ?auto_517293 ?auto_517304 ) ) ( not ( = ?auto_517294 ?auto_517295 ) ) ( not ( = ?auto_517294 ?auto_517296 ) ) ( not ( = ?auto_517294 ?auto_517297 ) ) ( not ( = ?auto_517294 ?auto_517298 ) ) ( not ( = ?auto_517294 ?auto_517299 ) ) ( not ( = ?auto_517294 ?auto_517300 ) ) ( not ( = ?auto_517294 ?auto_517301 ) ) ( not ( = ?auto_517294 ?auto_517302 ) ) ( not ( = ?auto_517294 ?auto_517303 ) ) ( not ( = ?auto_517294 ?auto_517304 ) ) ( not ( = ?auto_517295 ?auto_517296 ) ) ( not ( = ?auto_517295 ?auto_517297 ) ) ( not ( = ?auto_517295 ?auto_517298 ) ) ( not ( = ?auto_517295 ?auto_517299 ) ) ( not ( = ?auto_517295 ?auto_517300 ) ) ( not ( = ?auto_517295 ?auto_517301 ) ) ( not ( = ?auto_517295 ?auto_517302 ) ) ( not ( = ?auto_517295 ?auto_517303 ) ) ( not ( = ?auto_517295 ?auto_517304 ) ) ( not ( = ?auto_517296 ?auto_517297 ) ) ( not ( = ?auto_517296 ?auto_517298 ) ) ( not ( = ?auto_517296 ?auto_517299 ) ) ( not ( = ?auto_517296 ?auto_517300 ) ) ( not ( = ?auto_517296 ?auto_517301 ) ) ( not ( = ?auto_517296 ?auto_517302 ) ) ( not ( = ?auto_517296 ?auto_517303 ) ) ( not ( = ?auto_517296 ?auto_517304 ) ) ( not ( = ?auto_517297 ?auto_517298 ) ) ( not ( = ?auto_517297 ?auto_517299 ) ) ( not ( = ?auto_517297 ?auto_517300 ) ) ( not ( = ?auto_517297 ?auto_517301 ) ) ( not ( = ?auto_517297 ?auto_517302 ) ) ( not ( = ?auto_517297 ?auto_517303 ) ) ( not ( = ?auto_517297 ?auto_517304 ) ) ( not ( = ?auto_517298 ?auto_517299 ) ) ( not ( = ?auto_517298 ?auto_517300 ) ) ( not ( = ?auto_517298 ?auto_517301 ) ) ( not ( = ?auto_517298 ?auto_517302 ) ) ( not ( = ?auto_517298 ?auto_517303 ) ) ( not ( = ?auto_517298 ?auto_517304 ) ) ( not ( = ?auto_517299 ?auto_517300 ) ) ( not ( = ?auto_517299 ?auto_517301 ) ) ( not ( = ?auto_517299 ?auto_517302 ) ) ( not ( = ?auto_517299 ?auto_517303 ) ) ( not ( = ?auto_517299 ?auto_517304 ) ) ( not ( = ?auto_517300 ?auto_517301 ) ) ( not ( = ?auto_517300 ?auto_517302 ) ) ( not ( = ?auto_517300 ?auto_517303 ) ) ( not ( = ?auto_517300 ?auto_517304 ) ) ( not ( = ?auto_517301 ?auto_517302 ) ) ( not ( = ?auto_517301 ?auto_517303 ) ) ( not ( = ?auto_517301 ?auto_517304 ) ) ( not ( = ?auto_517302 ?auto_517303 ) ) ( not ( = ?auto_517302 ?auto_517304 ) ) ( not ( = ?auto_517303 ?auto_517304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_517303 ?auto_517304 )
      ( !STACK ?auto_517303 ?auto_517302 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517342 - BLOCK
      ?auto_517343 - BLOCK
      ?auto_517344 - BLOCK
      ?auto_517345 - BLOCK
      ?auto_517346 - BLOCK
      ?auto_517347 - BLOCK
      ?auto_517348 - BLOCK
      ?auto_517349 - BLOCK
      ?auto_517350 - BLOCK
      ?auto_517351 - BLOCK
      ?auto_517352 - BLOCK
      ?auto_517353 - BLOCK
    )
    :vars
    (
      ?auto_517354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517353 ?auto_517354 ) ( ON-TABLE ?auto_517342 ) ( ON ?auto_517343 ?auto_517342 ) ( ON ?auto_517344 ?auto_517343 ) ( ON ?auto_517345 ?auto_517344 ) ( ON ?auto_517346 ?auto_517345 ) ( ON ?auto_517347 ?auto_517346 ) ( ON ?auto_517348 ?auto_517347 ) ( ON ?auto_517349 ?auto_517348 ) ( ON ?auto_517350 ?auto_517349 ) ( ON ?auto_517351 ?auto_517350 ) ( not ( = ?auto_517342 ?auto_517343 ) ) ( not ( = ?auto_517342 ?auto_517344 ) ) ( not ( = ?auto_517342 ?auto_517345 ) ) ( not ( = ?auto_517342 ?auto_517346 ) ) ( not ( = ?auto_517342 ?auto_517347 ) ) ( not ( = ?auto_517342 ?auto_517348 ) ) ( not ( = ?auto_517342 ?auto_517349 ) ) ( not ( = ?auto_517342 ?auto_517350 ) ) ( not ( = ?auto_517342 ?auto_517351 ) ) ( not ( = ?auto_517342 ?auto_517352 ) ) ( not ( = ?auto_517342 ?auto_517353 ) ) ( not ( = ?auto_517342 ?auto_517354 ) ) ( not ( = ?auto_517343 ?auto_517344 ) ) ( not ( = ?auto_517343 ?auto_517345 ) ) ( not ( = ?auto_517343 ?auto_517346 ) ) ( not ( = ?auto_517343 ?auto_517347 ) ) ( not ( = ?auto_517343 ?auto_517348 ) ) ( not ( = ?auto_517343 ?auto_517349 ) ) ( not ( = ?auto_517343 ?auto_517350 ) ) ( not ( = ?auto_517343 ?auto_517351 ) ) ( not ( = ?auto_517343 ?auto_517352 ) ) ( not ( = ?auto_517343 ?auto_517353 ) ) ( not ( = ?auto_517343 ?auto_517354 ) ) ( not ( = ?auto_517344 ?auto_517345 ) ) ( not ( = ?auto_517344 ?auto_517346 ) ) ( not ( = ?auto_517344 ?auto_517347 ) ) ( not ( = ?auto_517344 ?auto_517348 ) ) ( not ( = ?auto_517344 ?auto_517349 ) ) ( not ( = ?auto_517344 ?auto_517350 ) ) ( not ( = ?auto_517344 ?auto_517351 ) ) ( not ( = ?auto_517344 ?auto_517352 ) ) ( not ( = ?auto_517344 ?auto_517353 ) ) ( not ( = ?auto_517344 ?auto_517354 ) ) ( not ( = ?auto_517345 ?auto_517346 ) ) ( not ( = ?auto_517345 ?auto_517347 ) ) ( not ( = ?auto_517345 ?auto_517348 ) ) ( not ( = ?auto_517345 ?auto_517349 ) ) ( not ( = ?auto_517345 ?auto_517350 ) ) ( not ( = ?auto_517345 ?auto_517351 ) ) ( not ( = ?auto_517345 ?auto_517352 ) ) ( not ( = ?auto_517345 ?auto_517353 ) ) ( not ( = ?auto_517345 ?auto_517354 ) ) ( not ( = ?auto_517346 ?auto_517347 ) ) ( not ( = ?auto_517346 ?auto_517348 ) ) ( not ( = ?auto_517346 ?auto_517349 ) ) ( not ( = ?auto_517346 ?auto_517350 ) ) ( not ( = ?auto_517346 ?auto_517351 ) ) ( not ( = ?auto_517346 ?auto_517352 ) ) ( not ( = ?auto_517346 ?auto_517353 ) ) ( not ( = ?auto_517346 ?auto_517354 ) ) ( not ( = ?auto_517347 ?auto_517348 ) ) ( not ( = ?auto_517347 ?auto_517349 ) ) ( not ( = ?auto_517347 ?auto_517350 ) ) ( not ( = ?auto_517347 ?auto_517351 ) ) ( not ( = ?auto_517347 ?auto_517352 ) ) ( not ( = ?auto_517347 ?auto_517353 ) ) ( not ( = ?auto_517347 ?auto_517354 ) ) ( not ( = ?auto_517348 ?auto_517349 ) ) ( not ( = ?auto_517348 ?auto_517350 ) ) ( not ( = ?auto_517348 ?auto_517351 ) ) ( not ( = ?auto_517348 ?auto_517352 ) ) ( not ( = ?auto_517348 ?auto_517353 ) ) ( not ( = ?auto_517348 ?auto_517354 ) ) ( not ( = ?auto_517349 ?auto_517350 ) ) ( not ( = ?auto_517349 ?auto_517351 ) ) ( not ( = ?auto_517349 ?auto_517352 ) ) ( not ( = ?auto_517349 ?auto_517353 ) ) ( not ( = ?auto_517349 ?auto_517354 ) ) ( not ( = ?auto_517350 ?auto_517351 ) ) ( not ( = ?auto_517350 ?auto_517352 ) ) ( not ( = ?auto_517350 ?auto_517353 ) ) ( not ( = ?auto_517350 ?auto_517354 ) ) ( not ( = ?auto_517351 ?auto_517352 ) ) ( not ( = ?auto_517351 ?auto_517353 ) ) ( not ( = ?auto_517351 ?auto_517354 ) ) ( not ( = ?auto_517352 ?auto_517353 ) ) ( not ( = ?auto_517352 ?auto_517354 ) ) ( not ( = ?auto_517353 ?auto_517354 ) ) ( CLEAR ?auto_517351 ) ( ON ?auto_517352 ?auto_517353 ) ( CLEAR ?auto_517352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_517342 ?auto_517343 ?auto_517344 ?auto_517345 ?auto_517346 ?auto_517347 ?auto_517348 ?auto_517349 ?auto_517350 ?auto_517351 ?auto_517352 )
      ( MAKE-12PILE ?auto_517342 ?auto_517343 ?auto_517344 ?auto_517345 ?auto_517346 ?auto_517347 ?auto_517348 ?auto_517349 ?auto_517350 ?auto_517351 ?auto_517352 ?auto_517353 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517392 - BLOCK
      ?auto_517393 - BLOCK
      ?auto_517394 - BLOCK
      ?auto_517395 - BLOCK
      ?auto_517396 - BLOCK
      ?auto_517397 - BLOCK
      ?auto_517398 - BLOCK
      ?auto_517399 - BLOCK
      ?auto_517400 - BLOCK
      ?auto_517401 - BLOCK
      ?auto_517402 - BLOCK
      ?auto_517403 - BLOCK
    )
    :vars
    (
      ?auto_517404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517403 ?auto_517404 ) ( ON-TABLE ?auto_517392 ) ( ON ?auto_517393 ?auto_517392 ) ( ON ?auto_517394 ?auto_517393 ) ( ON ?auto_517395 ?auto_517394 ) ( ON ?auto_517396 ?auto_517395 ) ( ON ?auto_517397 ?auto_517396 ) ( ON ?auto_517398 ?auto_517397 ) ( ON ?auto_517399 ?auto_517398 ) ( ON ?auto_517400 ?auto_517399 ) ( not ( = ?auto_517392 ?auto_517393 ) ) ( not ( = ?auto_517392 ?auto_517394 ) ) ( not ( = ?auto_517392 ?auto_517395 ) ) ( not ( = ?auto_517392 ?auto_517396 ) ) ( not ( = ?auto_517392 ?auto_517397 ) ) ( not ( = ?auto_517392 ?auto_517398 ) ) ( not ( = ?auto_517392 ?auto_517399 ) ) ( not ( = ?auto_517392 ?auto_517400 ) ) ( not ( = ?auto_517392 ?auto_517401 ) ) ( not ( = ?auto_517392 ?auto_517402 ) ) ( not ( = ?auto_517392 ?auto_517403 ) ) ( not ( = ?auto_517392 ?auto_517404 ) ) ( not ( = ?auto_517393 ?auto_517394 ) ) ( not ( = ?auto_517393 ?auto_517395 ) ) ( not ( = ?auto_517393 ?auto_517396 ) ) ( not ( = ?auto_517393 ?auto_517397 ) ) ( not ( = ?auto_517393 ?auto_517398 ) ) ( not ( = ?auto_517393 ?auto_517399 ) ) ( not ( = ?auto_517393 ?auto_517400 ) ) ( not ( = ?auto_517393 ?auto_517401 ) ) ( not ( = ?auto_517393 ?auto_517402 ) ) ( not ( = ?auto_517393 ?auto_517403 ) ) ( not ( = ?auto_517393 ?auto_517404 ) ) ( not ( = ?auto_517394 ?auto_517395 ) ) ( not ( = ?auto_517394 ?auto_517396 ) ) ( not ( = ?auto_517394 ?auto_517397 ) ) ( not ( = ?auto_517394 ?auto_517398 ) ) ( not ( = ?auto_517394 ?auto_517399 ) ) ( not ( = ?auto_517394 ?auto_517400 ) ) ( not ( = ?auto_517394 ?auto_517401 ) ) ( not ( = ?auto_517394 ?auto_517402 ) ) ( not ( = ?auto_517394 ?auto_517403 ) ) ( not ( = ?auto_517394 ?auto_517404 ) ) ( not ( = ?auto_517395 ?auto_517396 ) ) ( not ( = ?auto_517395 ?auto_517397 ) ) ( not ( = ?auto_517395 ?auto_517398 ) ) ( not ( = ?auto_517395 ?auto_517399 ) ) ( not ( = ?auto_517395 ?auto_517400 ) ) ( not ( = ?auto_517395 ?auto_517401 ) ) ( not ( = ?auto_517395 ?auto_517402 ) ) ( not ( = ?auto_517395 ?auto_517403 ) ) ( not ( = ?auto_517395 ?auto_517404 ) ) ( not ( = ?auto_517396 ?auto_517397 ) ) ( not ( = ?auto_517396 ?auto_517398 ) ) ( not ( = ?auto_517396 ?auto_517399 ) ) ( not ( = ?auto_517396 ?auto_517400 ) ) ( not ( = ?auto_517396 ?auto_517401 ) ) ( not ( = ?auto_517396 ?auto_517402 ) ) ( not ( = ?auto_517396 ?auto_517403 ) ) ( not ( = ?auto_517396 ?auto_517404 ) ) ( not ( = ?auto_517397 ?auto_517398 ) ) ( not ( = ?auto_517397 ?auto_517399 ) ) ( not ( = ?auto_517397 ?auto_517400 ) ) ( not ( = ?auto_517397 ?auto_517401 ) ) ( not ( = ?auto_517397 ?auto_517402 ) ) ( not ( = ?auto_517397 ?auto_517403 ) ) ( not ( = ?auto_517397 ?auto_517404 ) ) ( not ( = ?auto_517398 ?auto_517399 ) ) ( not ( = ?auto_517398 ?auto_517400 ) ) ( not ( = ?auto_517398 ?auto_517401 ) ) ( not ( = ?auto_517398 ?auto_517402 ) ) ( not ( = ?auto_517398 ?auto_517403 ) ) ( not ( = ?auto_517398 ?auto_517404 ) ) ( not ( = ?auto_517399 ?auto_517400 ) ) ( not ( = ?auto_517399 ?auto_517401 ) ) ( not ( = ?auto_517399 ?auto_517402 ) ) ( not ( = ?auto_517399 ?auto_517403 ) ) ( not ( = ?auto_517399 ?auto_517404 ) ) ( not ( = ?auto_517400 ?auto_517401 ) ) ( not ( = ?auto_517400 ?auto_517402 ) ) ( not ( = ?auto_517400 ?auto_517403 ) ) ( not ( = ?auto_517400 ?auto_517404 ) ) ( not ( = ?auto_517401 ?auto_517402 ) ) ( not ( = ?auto_517401 ?auto_517403 ) ) ( not ( = ?auto_517401 ?auto_517404 ) ) ( not ( = ?auto_517402 ?auto_517403 ) ) ( not ( = ?auto_517402 ?auto_517404 ) ) ( not ( = ?auto_517403 ?auto_517404 ) ) ( ON ?auto_517402 ?auto_517403 ) ( CLEAR ?auto_517400 ) ( ON ?auto_517401 ?auto_517402 ) ( CLEAR ?auto_517401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_517392 ?auto_517393 ?auto_517394 ?auto_517395 ?auto_517396 ?auto_517397 ?auto_517398 ?auto_517399 ?auto_517400 ?auto_517401 )
      ( MAKE-12PILE ?auto_517392 ?auto_517393 ?auto_517394 ?auto_517395 ?auto_517396 ?auto_517397 ?auto_517398 ?auto_517399 ?auto_517400 ?auto_517401 ?auto_517402 ?auto_517403 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517442 - BLOCK
      ?auto_517443 - BLOCK
      ?auto_517444 - BLOCK
      ?auto_517445 - BLOCK
      ?auto_517446 - BLOCK
      ?auto_517447 - BLOCK
      ?auto_517448 - BLOCK
      ?auto_517449 - BLOCK
      ?auto_517450 - BLOCK
      ?auto_517451 - BLOCK
      ?auto_517452 - BLOCK
      ?auto_517453 - BLOCK
    )
    :vars
    (
      ?auto_517454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517453 ?auto_517454 ) ( ON-TABLE ?auto_517442 ) ( ON ?auto_517443 ?auto_517442 ) ( ON ?auto_517444 ?auto_517443 ) ( ON ?auto_517445 ?auto_517444 ) ( ON ?auto_517446 ?auto_517445 ) ( ON ?auto_517447 ?auto_517446 ) ( ON ?auto_517448 ?auto_517447 ) ( ON ?auto_517449 ?auto_517448 ) ( not ( = ?auto_517442 ?auto_517443 ) ) ( not ( = ?auto_517442 ?auto_517444 ) ) ( not ( = ?auto_517442 ?auto_517445 ) ) ( not ( = ?auto_517442 ?auto_517446 ) ) ( not ( = ?auto_517442 ?auto_517447 ) ) ( not ( = ?auto_517442 ?auto_517448 ) ) ( not ( = ?auto_517442 ?auto_517449 ) ) ( not ( = ?auto_517442 ?auto_517450 ) ) ( not ( = ?auto_517442 ?auto_517451 ) ) ( not ( = ?auto_517442 ?auto_517452 ) ) ( not ( = ?auto_517442 ?auto_517453 ) ) ( not ( = ?auto_517442 ?auto_517454 ) ) ( not ( = ?auto_517443 ?auto_517444 ) ) ( not ( = ?auto_517443 ?auto_517445 ) ) ( not ( = ?auto_517443 ?auto_517446 ) ) ( not ( = ?auto_517443 ?auto_517447 ) ) ( not ( = ?auto_517443 ?auto_517448 ) ) ( not ( = ?auto_517443 ?auto_517449 ) ) ( not ( = ?auto_517443 ?auto_517450 ) ) ( not ( = ?auto_517443 ?auto_517451 ) ) ( not ( = ?auto_517443 ?auto_517452 ) ) ( not ( = ?auto_517443 ?auto_517453 ) ) ( not ( = ?auto_517443 ?auto_517454 ) ) ( not ( = ?auto_517444 ?auto_517445 ) ) ( not ( = ?auto_517444 ?auto_517446 ) ) ( not ( = ?auto_517444 ?auto_517447 ) ) ( not ( = ?auto_517444 ?auto_517448 ) ) ( not ( = ?auto_517444 ?auto_517449 ) ) ( not ( = ?auto_517444 ?auto_517450 ) ) ( not ( = ?auto_517444 ?auto_517451 ) ) ( not ( = ?auto_517444 ?auto_517452 ) ) ( not ( = ?auto_517444 ?auto_517453 ) ) ( not ( = ?auto_517444 ?auto_517454 ) ) ( not ( = ?auto_517445 ?auto_517446 ) ) ( not ( = ?auto_517445 ?auto_517447 ) ) ( not ( = ?auto_517445 ?auto_517448 ) ) ( not ( = ?auto_517445 ?auto_517449 ) ) ( not ( = ?auto_517445 ?auto_517450 ) ) ( not ( = ?auto_517445 ?auto_517451 ) ) ( not ( = ?auto_517445 ?auto_517452 ) ) ( not ( = ?auto_517445 ?auto_517453 ) ) ( not ( = ?auto_517445 ?auto_517454 ) ) ( not ( = ?auto_517446 ?auto_517447 ) ) ( not ( = ?auto_517446 ?auto_517448 ) ) ( not ( = ?auto_517446 ?auto_517449 ) ) ( not ( = ?auto_517446 ?auto_517450 ) ) ( not ( = ?auto_517446 ?auto_517451 ) ) ( not ( = ?auto_517446 ?auto_517452 ) ) ( not ( = ?auto_517446 ?auto_517453 ) ) ( not ( = ?auto_517446 ?auto_517454 ) ) ( not ( = ?auto_517447 ?auto_517448 ) ) ( not ( = ?auto_517447 ?auto_517449 ) ) ( not ( = ?auto_517447 ?auto_517450 ) ) ( not ( = ?auto_517447 ?auto_517451 ) ) ( not ( = ?auto_517447 ?auto_517452 ) ) ( not ( = ?auto_517447 ?auto_517453 ) ) ( not ( = ?auto_517447 ?auto_517454 ) ) ( not ( = ?auto_517448 ?auto_517449 ) ) ( not ( = ?auto_517448 ?auto_517450 ) ) ( not ( = ?auto_517448 ?auto_517451 ) ) ( not ( = ?auto_517448 ?auto_517452 ) ) ( not ( = ?auto_517448 ?auto_517453 ) ) ( not ( = ?auto_517448 ?auto_517454 ) ) ( not ( = ?auto_517449 ?auto_517450 ) ) ( not ( = ?auto_517449 ?auto_517451 ) ) ( not ( = ?auto_517449 ?auto_517452 ) ) ( not ( = ?auto_517449 ?auto_517453 ) ) ( not ( = ?auto_517449 ?auto_517454 ) ) ( not ( = ?auto_517450 ?auto_517451 ) ) ( not ( = ?auto_517450 ?auto_517452 ) ) ( not ( = ?auto_517450 ?auto_517453 ) ) ( not ( = ?auto_517450 ?auto_517454 ) ) ( not ( = ?auto_517451 ?auto_517452 ) ) ( not ( = ?auto_517451 ?auto_517453 ) ) ( not ( = ?auto_517451 ?auto_517454 ) ) ( not ( = ?auto_517452 ?auto_517453 ) ) ( not ( = ?auto_517452 ?auto_517454 ) ) ( not ( = ?auto_517453 ?auto_517454 ) ) ( ON ?auto_517452 ?auto_517453 ) ( ON ?auto_517451 ?auto_517452 ) ( CLEAR ?auto_517449 ) ( ON ?auto_517450 ?auto_517451 ) ( CLEAR ?auto_517450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_517442 ?auto_517443 ?auto_517444 ?auto_517445 ?auto_517446 ?auto_517447 ?auto_517448 ?auto_517449 ?auto_517450 )
      ( MAKE-12PILE ?auto_517442 ?auto_517443 ?auto_517444 ?auto_517445 ?auto_517446 ?auto_517447 ?auto_517448 ?auto_517449 ?auto_517450 ?auto_517451 ?auto_517452 ?auto_517453 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517492 - BLOCK
      ?auto_517493 - BLOCK
      ?auto_517494 - BLOCK
      ?auto_517495 - BLOCK
      ?auto_517496 - BLOCK
      ?auto_517497 - BLOCK
      ?auto_517498 - BLOCK
      ?auto_517499 - BLOCK
      ?auto_517500 - BLOCK
      ?auto_517501 - BLOCK
      ?auto_517502 - BLOCK
      ?auto_517503 - BLOCK
    )
    :vars
    (
      ?auto_517504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517503 ?auto_517504 ) ( ON-TABLE ?auto_517492 ) ( ON ?auto_517493 ?auto_517492 ) ( ON ?auto_517494 ?auto_517493 ) ( ON ?auto_517495 ?auto_517494 ) ( ON ?auto_517496 ?auto_517495 ) ( ON ?auto_517497 ?auto_517496 ) ( ON ?auto_517498 ?auto_517497 ) ( not ( = ?auto_517492 ?auto_517493 ) ) ( not ( = ?auto_517492 ?auto_517494 ) ) ( not ( = ?auto_517492 ?auto_517495 ) ) ( not ( = ?auto_517492 ?auto_517496 ) ) ( not ( = ?auto_517492 ?auto_517497 ) ) ( not ( = ?auto_517492 ?auto_517498 ) ) ( not ( = ?auto_517492 ?auto_517499 ) ) ( not ( = ?auto_517492 ?auto_517500 ) ) ( not ( = ?auto_517492 ?auto_517501 ) ) ( not ( = ?auto_517492 ?auto_517502 ) ) ( not ( = ?auto_517492 ?auto_517503 ) ) ( not ( = ?auto_517492 ?auto_517504 ) ) ( not ( = ?auto_517493 ?auto_517494 ) ) ( not ( = ?auto_517493 ?auto_517495 ) ) ( not ( = ?auto_517493 ?auto_517496 ) ) ( not ( = ?auto_517493 ?auto_517497 ) ) ( not ( = ?auto_517493 ?auto_517498 ) ) ( not ( = ?auto_517493 ?auto_517499 ) ) ( not ( = ?auto_517493 ?auto_517500 ) ) ( not ( = ?auto_517493 ?auto_517501 ) ) ( not ( = ?auto_517493 ?auto_517502 ) ) ( not ( = ?auto_517493 ?auto_517503 ) ) ( not ( = ?auto_517493 ?auto_517504 ) ) ( not ( = ?auto_517494 ?auto_517495 ) ) ( not ( = ?auto_517494 ?auto_517496 ) ) ( not ( = ?auto_517494 ?auto_517497 ) ) ( not ( = ?auto_517494 ?auto_517498 ) ) ( not ( = ?auto_517494 ?auto_517499 ) ) ( not ( = ?auto_517494 ?auto_517500 ) ) ( not ( = ?auto_517494 ?auto_517501 ) ) ( not ( = ?auto_517494 ?auto_517502 ) ) ( not ( = ?auto_517494 ?auto_517503 ) ) ( not ( = ?auto_517494 ?auto_517504 ) ) ( not ( = ?auto_517495 ?auto_517496 ) ) ( not ( = ?auto_517495 ?auto_517497 ) ) ( not ( = ?auto_517495 ?auto_517498 ) ) ( not ( = ?auto_517495 ?auto_517499 ) ) ( not ( = ?auto_517495 ?auto_517500 ) ) ( not ( = ?auto_517495 ?auto_517501 ) ) ( not ( = ?auto_517495 ?auto_517502 ) ) ( not ( = ?auto_517495 ?auto_517503 ) ) ( not ( = ?auto_517495 ?auto_517504 ) ) ( not ( = ?auto_517496 ?auto_517497 ) ) ( not ( = ?auto_517496 ?auto_517498 ) ) ( not ( = ?auto_517496 ?auto_517499 ) ) ( not ( = ?auto_517496 ?auto_517500 ) ) ( not ( = ?auto_517496 ?auto_517501 ) ) ( not ( = ?auto_517496 ?auto_517502 ) ) ( not ( = ?auto_517496 ?auto_517503 ) ) ( not ( = ?auto_517496 ?auto_517504 ) ) ( not ( = ?auto_517497 ?auto_517498 ) ) ( not ( = ?auto_517497 ?auto_517499 ) ) ( not ( = ?auto_517497 ?auto_517500 ) ) ( not ( = ?auto_517497 ?auto_517501 ) ) ( not ( = ?auto_517497 ?auto_517502 ) ) ( not ( = ?auto_517497 ?auto_517503 ) ) ( not ( = ?auto_517497 ?auto_517504 ) ) ( not ( = ?auto_517498 ?auto_517499 ) ) ( not ( = ?auto_517498 ?auto_517500 ) ) ( not ( = ?auto_517498 ?auto_517501 ) ) ( not ( = ?auto_517498 ?auto_517502 ) ) ( not ( = ?auto_517498 ?auto_517503 ) ) ( not ( = ?auto_517498 ?auto_517504 ) ) ( not ( = ?auto_517499 ?auto_517500 ) ) ( not ( = ?auto_517499 ?auto_517501 ) ) ( not ( = ?auto_517499 ?auto_517502 ) ) ( not ( = ?auto_517499 ?auto_517503 ) ) ( not ( = ?auto_517499 ?auto_517504 ) ) ( not ( = ?auto_517500 ?auto_517501 ) ) ( not ( = ?auto_517500 ?auto_517502 ) ) ( not ( = ?auto_517500 ?auto_517503 ) ) ( not ( = ?auto_517500 ?auto_517504 ) ) ( not ( = ?auto_517501 ?auto_517502 ) ) ( not ( = ?auto_517501 ?auto_517503 ) ) ( not ( = ?auto_517501 ?auto_517504 ) ) ( not ( = ?auto_517502 ?auto_517503 ) ) ( not ( = ?auto_517502 ?auto_517504 ) ) ( not ( = ?auto_517503 ?auto_517504 ) ) ( ON ?auto_517502 ?auto_517503 ) ( ON ?auto_517501 ?auto_517502 ) ( ON ?auto_517500 ?auto_517501 ) ( CLEAR ?auto_517498 ) ( ON ?auto_517499 ?auto_517500 ) ( CLEAR ?auto_517499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_517492 ?auto_517493 ?auto_517494 ?auto_517495 ?auto_517496 ?auto_517497 ?auto_517498 ?auto_517499 )
      ( MAKE-12PILE ?auto_517492 ?auto_517493 ?auto_517494 ?auto_517495 ?auto_517496 ?auto_517497 ?auto_517498 ?auto_517499 ?auto_517500 ?auto_517501 ?auto_517502 ?auto_517503 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517542 - BLOCK
      ?auto_517543 - BLOCK
      ?auto_517544 - BLOCK
      ?auto_517545 - BLOCK
      ?auto_517546 - BLOCK
      ?auto_517547 - BLOCK
      ?auto_517548 - BLOCK
      ?auto_517549 - BLOCK
      ?auto_517550 - BLOCK
      ?auto_517551 - BLOCK
      ?auto_517552 - BLOCK
      ?auto_517553 - BLOCK
    )
    :vars
    (
      ?auto_517554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517553 ?auto_517554 ) ( ON-TABLE ?auto_517542 ) ( ON ?auto_517543 ?auto_517542 ) ( ON ?auto_517544 ?auto_517543 ) ( ON ?auto_517545 ?auto_517544 ) ( ON ?auto_517546 ?auto_517545 ) ( ON ?auto_517547 ?auto_517546 ) ( not ( = ?auto_517542 ?auto_517543 ) ) ( not ( = ?auto_517542 ?auto_517544 ) ) ( not ( = ?auto_517542 ?auto_517545 ) ) ( not ( = ?auto_517542 ?auto_517546 ) ) ( not ( = ?auto_517542 ?auto_517547 ) ) ( not ( = ?auto_517542 ?auto_517548 ) ) ( not ( = ?auto_517542 ?auto_517549 ) ) ( not ( = ?auto_517542 ?auto_517550 ) ) ( not ( = ?auto_517542 ?auto_517551 ) ) ( not ( = ?auto_517542 ?auto_517552 ) ) ( not ( = ?auto_517542 ?auto_517553 ) ) ( not ( = ?auto_517542 ?auto_517554 ) ) ( not ( = ?auto_517543 ?auto_517544 ) ) ( not ( = ?auto_517543 ?auto_517545 ) ) ( not ( = ?auto_517543 ?auto_517546 ) ) ( not ( = ?auto_517543 ?auto_517547 ) ) ( not ( = ?auto_517543 ?auto_517548 ) ) ( not ( = ?auto_517543 ?auto_517549 ) ) ( not ( = ?auto_517543 ?auto_517550 ) ) ( not ( = ?auto_517543 ?auto_517551 ) ) ( not ( = ?auto_517543 ?auto_517552 ) ) ( not ( = ?auto_517543 ?auto_517553 ) ) ( not ( = ?auto_517543 ?auto_517554 ) ) ( not ( = ?auto_517544 ?auto_517545 ) ) ( not ( = ?auto_517544 ?auto_517546 ) ) ( not ( = ?auto_517544 ?auto_517547 ) ) ( not ( = ?auto_517544 ?auto_517548 ) ) ( not ( = ?auto_517544 ?auto_517549 ) ) ( not ( = ?auto_517544 ?auto_517550 ) ) ( not ( = ?auto_517544 ?auto_517551 ) ) ( not ( = ?auto_517544 ?auto_517552 ) ) ( not ( = ?auto_517544 ?auto_517553 ) ) ( not ( = ?auto_517544 ?auto_517554 ) ) ( not ( = ?auto_517545 ?auto_517546 ) ) ( not ( = ?auto_517545 ?auto_517547 ) ) ( not ( = ?auto_517545 ?auto_517548 ) ) ( not ( = ?auto_517545 ?auto_517549 ) ) ( not ( = ?auto_517545 ?auto_517550 ) ) ( not ( = ?auto_517545 ?auto_517551 ) ) ( not ( = ?auto_517545 ?auto_517552 ) ) ( not ( = ?auto_517545 ?auto_517553 ) ) ( not ( = ?auto_517545 ?auto_517554 ) ) ( not ( = ?auto_517546 ?auto_517547 ) ) ( not ( = ?auto_517546 ?auto_517548 ) ) ( not ( = ?auto_517546 ?auto_517549 ) ) ( not ( = ?auto_517546 ?auto_517550 ) ) ( not ( = ?auto_517546 ?auto_517551 ) ) ( not ( = ?auto_517546 ?auto_517552 ) ) ( not ( = ?auto_517546 ?auto_517553 ) ) ( not ( = ?auto_517546 ?auto_517554 ) ) ( not ( = ?auto_517547 ?auto_517548 ) ) ( not ( = ?auto_517547 ?auto_517549 ) ) ( not ( = ?auto_517547 ?auto_517550 ) ) ( not ( = ?auto_517547 ?auto_517551 ) ) ( not ( = ?auto_517547 ?auto_517552 ) ) ( not ( = ?auto_517547 ?auto_517553 ) ) ( not ( = ?auto_517547 ?auto_517554 ) ) ( not ( = ?auto_517548 ?auto_517549 ) ) ( not ( = ?auto_517548 ?auto_517550 ) ) ( not ( = ?auto_517548 ?auto_517551 ) ) ( not ( = ?auto_517548 ?auto_517552 ) ) ( not ( = ?auto_517548 ?auto_517553 ) ) ( not ( = ?auto_517548 ?auto_517554 ) ) ( not ( = ?auto_517549 ?auto_517550 ) ) ( not ( = ?auto_517549 ?auto_517551 ) ) ( not ( = ?auto_517549 ?auto_517552 ) ) ( not ( = ?auto_517549 ?auto_517553 ) ) ( not ( = ?auto_517549 ?auto_517554 ) ) ( not ( = ?auto_517550 ?auto_517551 ) ) ( not ( = ?auto_517550 ?auto_517552 ) ) ( not ( = ?auto_517550 ?auto_517553 ) ) ( not ( = ?auto_517550 ?auto_517554 ) ) ( not ( = ?auto_517551 ?auto_517552 ) ) ( not ( = ?auto_517551 ?auto_517553 ) ) ( not ( = ?auto_517551 ?auto_517554 ) ) ( not ( = ?auto_517552 ?auto_517553 ) ) ( not ( = ?auto_517552 ?auto_517554 ) ) ( not ( = ?auto_517553 ?auto_517554 ) ) ( ON ?auto_517552 ?auto_517553 ) ( ON ?auto_517551 ?auto_517552 ) ( ON ?auto_517550 ?auto_517551 ) ( ON ?auto_517549 ?auto_517550 ) ( CLEAR ?auto_517547 ) ( ON ?auto_517548 ?auto_517549 ) ( CLEAR ?auto_517548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_517542 ?auto_517543 ?auto_517544 ?auto_517545 ?auto_517546 ?auto_517547 ?auto_517548 )
      ( MAKE-12PILE ?auto_517542 ?auto_517543 ?auto_517544 ?auto_517545 ?auto_517546 ?auto_517547 ?auto_517548 ?auto_517549 ?auto_517550 ?auto_517551 ?auto_517552 ?auto_517553 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517592 - BLOCK
      ?auto_517593 - BLOCK
      ?auto_517594 - BLOCK
      ?auto_517595 - BLOCK
      ?auto_517596 - BLOCK
      ?auto_517597 - BLOCK
      ?auto_517598 - BLOCK
      ?auto_517599 - BLOCK
      ?auto_517600 - BLOCK
      ?auto_517601 - BLOCK
      ?auto_517602 - BLOCK
      ?auto_517603 - BLOCK
    )
    :vars
    (
      ?auto_517604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517603 ?auto_517604 ) ( ON-TABLE ?auto_517592 ) ( ON ?auto_517593 ?auto_517592 ) ( ON ?auto_517594 ?auto_517593 ) ( ON ?auto_517595 ?auto_517594 ) ( ON ?auto_517596 ?auto_517595 ) ( not ( = ?auto_517592 ?auto_517593 ) ) ( not ( = ?auto_517592 ?auto_517594 ) ) ( not ( = ?auto_517592 ?auto_517595 ) ) ( not ( = ?auto_517592 ?auto_517596 ) ) ( not ( = ?auto_517592 ?auto_517597 ) ) ( not ( = ?auto_517592 ?auto_517598 ) ) ( not ( = ?auto_517592 ?auto_517599 ) ) ( not ( = ?auto_517592 ?auto_517600 ) ) ( not ( = ?auto_517592 ?auto_517601 ) ) ( not ( = ?auto_517592 ?auto_517602 ) ) ( not ( = ?auto_517592 ?auto_517603 ) ) ( not ( = ?auto_517592 ?auto_517604 ) ) ( not ( = ?auto_517593 ?auto_517594 ) ) ( not ( = ?auto_517593 ?auto_517595 ) ) ( not ( = ?auto_517593 ?auto_517596 ) ) ( not ( = ?auto_517593 ?auto_517597 ) ) ( not ( = ?auto_517593 ?auto_517598 ) ) ( not ( = ?auto_517593 ?auto_517599 ) ) ( not ( = ?auto_517593 ?auto_517600 ) ) ( not ( = ?auto_517593 ?auto_517601 ) ) ( not ( = ?auto_517593 ?auto_517602 ) ) ( not ( = ?auto_517593 ?auto_517603 ) ) ( not ( = ?auto_517593 ?auto_517604 ) ) ( not ( = ?auto_517594 ?auto_517595 ) ) ( not ( = ?auto_517594 ?auto_517596 ) ) ( not ( = ?auto_517594 ?auto_517597 ) ) ( not ( = ?auto_517594 ?auto_517598 ) ) ( not ( = ?auto_517594 ?auto_517599 ) ) ( not ( = ?auto_517594 ?auto_517600 ) ) ( not ( = ?auto_517594 ?auto_517601 ) ) ( not ( = ?auto_517594 ?auto_517602 ) ) ( not ( = ?auto_517594 ?auto_517603 ) ) ( not ( = ?auto_517594 ?auto_517604 ) ) ( not ( = ?auto_517595 ?auto_517596 ) ) ( not ( = ?auto_517595 ?auto_517597 ) ) ( not ( = ?auto_517595 ?auto_517598 ) ) ( not ( = ?auto_517595 ?auto_517599 ) ) ( not ( = ?auto_517595 ?auto_517600 ) ) ( not ( = ?auto_517595 ?auto_517601 ) ) ( not ( = ?auto_517595 ?auto_517602 ) ) ( not ( = ?auto_517595 ?auto_517603 ) ) ( not ( = ?auto_517595 ?auto_517604 ) ) ( not ( = ?auto_517596 ?auto_517597 ) ) ( not ( = ?auto_517596 ?auto_517598 ) ) ( not ( = ?auto_517596 ?auto_517599 ) ) ( not ( = ?auto_517596 ?auto_517600 ) ) ( not ( = ?auto_517596 ?auto_517601 ) ) ( not ( = ?auto_517596 ?auto_517602 ) ) ( not ( = ?auto_517596 ?auto_517603 ) ) ( not ( = ?auto_517596 ?auto_517604 ) ) ( not ( = ?auto_517597 ?auto_517598 ) ) ( not ( = ?auto_517597 ?auto_517599 ) ) ( not ( = ?auto_517597 ?auto_517600 ) ) ( not ( = ?auto_517597 ?auto_517601 ) ) ( not ( = ?auto_517597 ?auto_517602 ) ) ( not ( = ?auto_517597 ?auto_517603 ) ) ( not ( = ?auto_517597 ?auto_517604 ) ) ( not ( = ?auto_517598 ?auto_517599 ) ) ( not ( = ?auto_517598 ?auto_517600 ) ) ( not ( = ?auto_517598 ?auto_517601 ) ) ( not ( = ?auto_517598 ?auto_517602 ) ) ( not ( = ?auto_517598 ?auto_517603 ) ) ( not ( = ?auto_517598 ?auto_517604 ) ) ( not ( = ?auto_517599 ?auto_517600 ) ) ( not ( = ?auto_517599 ?auto_517601 ) ) ( not ( = ?auto_517599 ?auto_517602 ) ) ( not ( = ?auto_517599 ?auto_517603 ) ) ( not ( = ?auto_517599 ?auto_517604 ) ) ( not ( = ?auto_517600 ?auto_517601 ) ) ( not ( = ?auto_517600 ?auto_517602 ) ) ( not ( = ?auto_517600 ?auto_517603 ) ) ( not ( = ?auto_517600 ?auto_517604 ) ) ( not ( = ?auto_517601 ?auto_517602 ) ) ( not ( = ?auto_517601 ?auto_517603 ) ) ( not ( = ?auto_517601 ?auto_517604 ) ) ( not ( = ?auto_517602 ?auto_517603 ) ) ( not ( = ?auto_517602 ?auto_517604 ) ) ( not ( = ?auto_517603 ?auto_517604 ) ) ( ON ?auto_517602 ?auto_517603 ) ( ON ?auto_517601 ?auto_517602 ) ( ON ?auto_517600 ?auto_517601 ) ( ON ?auto_517599 ?auto_517600 ) ( ON ?auto_517598 ?auto_517599 ) ( CLEAR ?auto_517596 ) ( ON ?auto_517597 ?auto_517598 ) ( CLEAR ?auto_517597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_517592 ?auto_517593 ?auto_517594 ?auto_517595 ?auto_517596 ?auto_517597 )
      ( MAKE-12PILE ?auto_517592 ?auto_517593 ?auto_517594 ?auto_517595 ?auto_517596 ?auto_517597 ?auto_517598 ?auto_517599 ?auto_517600 ?auto_517601 ?auto_517602 ?auto_517603 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517642 - BLOCK
      ?auto_517643 - BLOCK
      ?auto_517644 - BLOCK
      ?auto_517645 - BLOCK
      ?auto_517646 - BLOCK
      ?auto_517647 - BLOCK
      ?auto_517648 - BLOCK
      ?auto_517649 - BLOCK
      ?auto_517650 - BLOCK
      ?auto_517651 - BLOCK
      ?auto_517652 - BLOCK
      ?auto_517653 - BLOCK
    )
    :vars
    (
      ?auto_517654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517653 ?auto_517654 ) ( ON-TABLE ?auto_517642 ) ( ON ?auto_517643 ?auto_517642 ) ( ON ?auto_517644 ?auto_517643 ) ( ON ?auto_517645 ?auto_517644 ) ( not ( = ?auto_517642 ?auto_517643 ) ) ( not ( = ?auto_517642 ?auto_517644 ) ) ( not ( = ?auto_517642 ?auto_517645 ) ) ( not ( = ?auto_517642 ?auto_517646 ) ) ( not ( = ?auto_517642 ?auto_517647 ) ) ( not ( = ?auto_517642 ?auto_517648 ) ) ( not ( = ?auto_517642 ?auto_517649 ) ) ( not ( = ?auto_517642 ?auto_517650 ) ) ( not ( = ?auto_517642 ?auto_517651 ) ) ( not ( = ?auto_517642 ?auto_517652 ) ) ( not ( = ?auto_517642 ?auto_517653 ) ) ( not ( = ?auto_517642 ?auto_517654 ) ) ( not ( = ?auto_517643 ?auto_517644 ) ) ( not ( = ?auto_517643 ?auto_517645 ) ) ( not ( = ?auto_517643 ?auto_517646 ) ) ( not ( = ?auto_517643 ?auto_517647 ) ) ( not ( = ?auto_517643 ?auto_517648 ) ) ( not ( = ?auto_517643 ?auto_517649 ) ) ( not ( = ?auto_517643 ?auto_517650 ) ) ( not ( = ?auto_517643 ?auto_517651 ) ) ( not ( = ?auto_517643 ?auto_517652 ) ) ( not ( = ?auto_517643 ?auto_517653 ) ) ( not ( = ?auto_517643 ?auto_517654 ) ) ( not ( = ?auto_517644 ?auto_517645 ) ) ( not ( = ?auto_517644 ?auto_517646 ) ) ( not ( = ?auto_517644 ?auto_517647 ) ) ( not ( = ?auto_517644 ?auto_517648 ) ) ( not ( = ?auto_517644 ?auto_517649 ) ) ( not ( = ?auto_517644 ?auto_517650 ) ) ( not ( = ?auto_517644 ?auto_517651 ) ) ( not ( = ?auto_517644 ?auto_517652 ) ) ( not ( = ?auto_517644 ?auto_517653 ) ) ( not ( = ?auto_517644 ?auto_517654 ) ) ( not ( = ?auto_517645 ?auto_517646 ) ) ( not ( = ?auto_517645 ?auto_517647 ) ) ( not ( = ?auto_517645 ?auto_517648 ) ) ( not ( = ?auto_517645 ?auto_517649 ) ) ( not ( = ?auto_517645 ?auto_517650 ) ) ( not ( = ?auto_517645 ?auto_517651 ) ) ( not ( = ?auto_517645 ?auto_517652 ) ) ( not ( = ?auto_517645 ?auto_517653 ) ) ( not ( = ?auto_517645 ?auto_517654 ) ) ( not ( = ?auto_517646 ?auto_517647 ) ) ( not ( = ?auto_517646 ?auto_517648 ) ) ( not ( = ?auto_517646 ?auto_517649 ) ) ( not ( = ?auto_517646 ?auto_517650 ) ) ( not ( = ?auto_517646 ?auto_517651 ) ) ( not ( = ?auto_517646 ?auto_517652 ) ) ( not ( = ?auto_517646 ?auto_517653 ) ) ( not ( = ?auto_517646 ?auto_517654 ) ) ( not ( = ?auto_517647 ?auto_517648 ) ) ( not ( = ?auto_517647 ?auto_517649 ) ) ( not ( = ?auto_517647 ?auto_517650 ) ) ( not ( = ?auto_517647 ?auto_517651 ) ) ( not ( = ?auto_517647 ?auto_517652 ) ) ( not ( = ?auto_517647 ?auto_517653 ) ) ( not ( = ?auto_517647 ?auto_517654 ) ) ( not ( = ?auto_517648 ?auto_517649 ) ) ( not ( = ?auto_517648 ?auto_517650 ) ) ( not ( = ?auto_517648 ?auto_517651 ) ) ( not ( = ?auto_517648 ?auto_517652 ) ) ( not ( = ?auto_517648 ?auto_517653 ) ) ( not ( = ?auto_517648 ?auto_517654 ) ) ( not ( = ?auto_517649 ?auto_517650 ) ) ( not ( = ?auto_517649 ?auto_517651 ) ) ( not ( = ?auto_517649 ?auto_517652 ) ) ( not ( = ?auto_517649 ?auto_517653 ) ) ( not ( = ?auto_517649 ?auto_517654 ) ) ( not ( = ?auto_517650 ?auto_517651 ) ) ( not ( = ?auto_517650 ?auto_517652 ) ) ( not ( = ?auto_517650 ?auto_517653 ) ) ( not ( = ?auto_517650 ?auto_517654 ) ) ( not ( = ?auto_517651 ?auto_517652 ) ) ( not ( = ?auto_517651 ?auto_517653 ) ) ( not ( = ?auto_517651 ?auto_517654 ) ) ( not ( = ?auto_517652 ?auto_517653 ) ) ( not ( = ?auto_517652 ?auto_517654 ) ) ( not ( = ?auto_517653 ?auto_517654 ) ) ( ON ?auto_517652 ?auto_517653 ) ( ON ?auto_517651 ?auto_517652 ) ( ON ?auto_517650 ?auto_517651 ) ( ON ?auto_517649 ?auto_517650 ) ( ON ?auto_517648 ?auto_517649 ) ( ON ?auto_517647 ?auto_517648 ) ( CLEAR ?auto_517645 ) ( ON ?auto_517646 ?auto_517647 ) ( CLEAR ?auto_517646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_517642 ?auto_517643 ?auto_517644 ?auto_517645 ?auto_517646 )
      ( MAKE-12PILE ?auto_517642 ?auto_517643 ?auto_517644 ?auto_517645 ?auto_517646 ?auto_517647 ?auto_517648 ?auto_517649 ?auto_517650 ?auto_517651 ?auto_517652 ?auto_517653 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517692 - BLOCK
      ?auto_517693 - BLOCK
      ?auto_517694 - BLOCK
      ?auto_517695 - BLOCK
      ?auto_517696 - BLOCK
      ?auto_517697 - BLOCK
      ?auto_517698 - BLOCK
      ?auto_517699 - BLOCK
      ?auto_517700 - BLOCK
      ?auto_517701 - BLOCK
      ?auto_517702 - BLOCK
      ?auto_517703 - BLOCK
    )
    :vars
    (
      ?auto_517704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517703 ?auto_517704 ) ( ON-TABLE ?auto_517692 ) ( ON ?auto_517693 ?auto_517692 ) ( ON ?auto_517694 ?auto_517693 ) ( not ( = ?auto_517692 ?auto_517693 ) ) ( not ( = ?auto_517692 ?auto_517694 ) ) ( not ( = ?auto_517692 ?auto_517695 ) ) ( not ( = ?auto_517692 ?auto_517696 ) ) ( not ( = ?auto_517692 ?auto_517697 ) ) ( not ( = ?auto_517692 ?auto_517698 ) ) ( not ( = ?auto_517692 ?auto_517699 ) ) ( not ( = ?auto_517692 ?auto_517700 ) ) ( not ( = ?auto_517692 ?auto_517701 ) ) ( not ( = ?auto_517692 ?auto_517702 ) ) ( not ( = ?auto_517692 ?auto_517703 ) ) ( not ( = ?auto_517692 ?auto_517704 ) ) ( not ( = ?auto_517693 ?auto_517694 ) ) ( not ( = ?auto_517693 ?auto_517695 ) ) ( not ( = ?auto_517693 ?auto_517696 ) ) ( not ( = ?auto_517693 ?auto_517697 ) ) ( not ( = ?auto_517693 ?auto_517698 ) ) ( not ( = ?auto_517693 ?auto_517699 ) ) ( not ( = ?auto_517693 ?auto_517700 ) ) ( not ( = ?auto_517693 ?auto_517701 ) ) ( not ( = ?auto_517693 ?auto_517702 ) ) ( not ( = ?auto_517693 ?auto_517703 ) ) ( not ( = ?auto_517693 ?auto_517704 ) ) ( not ( = ?auto_517694 ?auto_517695 ) ) ( not ( = ?auto_517694 ?auto_517696 ) ) ( not ( = ?auto_517694 ?auto_517697 ) ) ( not ( = ?auto_517694 ?auto_517698 ) ) ( not ( = ?auto_517694 ?auto_517699 ) ) ( not ( = ?auto_517694 ?auto_517700 ) ) ( not ( = ?auto_517694 ?auto_517701 ) ) ( not ( = ?auto_517694 ?auto_517702 ) ) ( not ( = ?auto_517694 ?auto_517703 ) ) ( not ( = ?auto_517694 ?auto_517704 ) ) ( not ( = ?auto_517695 ?auto_517696 ) ) ( not ( = ?auto_517695 ?auto_517697 ) ) ( not ( = ?auto_517695 ?auto_517698 ) ) ( not ( = ?auto_517695 ?auto_517699 ) ) ( not ( = ?auto_517695 ?auto_517700 ) ) ( not ( = ?auto_517695 ?auto_517701 ) ) ( not ( = ?auto_517695 ?auto_517702 ) ) ( not ( = ?auto_517695 ?auto_517703 ) ) ( not ( = ?auto_517695 ?auto_517704 ) ) ( not ( = ?auto_517696 ?auto_517697 ) ) ( not ( = ?auto_517696 ?auto_517698 ) ) ( not ( = ?auto_517696 ?auto_517699 ) ) ( not ( = ?auto_517696 ?auto_517700 ) ) ( not ( = ?auto_517696 ?auto_517701 ) ) ( not ( = ?auto_517696 ?auto_517702 ) ) ( not ( = ?auto_517696 ?auto_517703 ) ) ( not ( = ?auto_517696 ?auto_517704 ) ) ( not ( = ?auto_517697 ?auto_517698 ) ) ( not ( = ?auto_517697 ?auto_517699 ) ) ( not ( = ?auto_517697 ?auto_517700 ) ) ( not ( = ?auto_517697 ?auto_517701 ) ) ( not ( = ?auto_517697 ?auto_517702 ) ) ( not ( = ?auto_517697 ?auto_517703 ) ) ( not ( = ?auto_517697 ?auto_517704 ) ) ( not ( = ?auto_517698 ?auto_517699 ) ) ( not ( = ?auto_517698 ?auto_517700 ) ) ( not ( = ?auto_517698 ?auto_517701 ) ) ( not ( = ?auto_517698 ?auto_517702 ) ) ( not ( = ?auto_517698 ?auto_517703 ) ) ( not ( = ?auto_517698 ?auto_517704 ) ) ( not ( = ?auto_517699 ?auto_517700 ) ) ( not ( = ?auto_517699 ?auto_517701 ) ) ( not ( = ?auto_517699 ?auto_517702 ) ) ( not ( = ?auto_517699 ?auto_517703 ) ) ( not ( = ?auto_517699 ?auto_517704 ) ) ( not ( = ?auto_517700 ?auto_517701 ) ) ( not ( = ?auto_517700 ?auto_517702 ) ) ( not ( = ?auto_517700 ?auto_517703 ) ) ( not ( = ?auto_517700 ?auto_517704 ) ) ( not ( = ?auto_517701 ?auto_517702 ) ) ( not ( = ?auto_517701 ?auto_517703 ) ) ( not ( = ?auto_517701 ?auto_517704 ) ) ( not ( = ?auto_517702 ?auto_517703 ) ) ( not ( = ?auto_517702 ?auto_517704 ) ) ( not ( = ?auto_517703 ?auto_517704 ) ) ( ON ?auto_517702 ?auto_517703 ) ( ON ?auto_517701 ?auto_517702 ) ( ON ?auto_517700 ?auto_517701 ) ( ON ?auto_517699 ?auto_517700 ) ( ON ?auto_517698 ?auto_517699 ) ( ON ?auto_517697 ?auto_517698 ) ( ON ?auto_517696 ?auto_517697 ) ( CLEAR ?auto_517694 ) ( ON ?auto_517695 ?auto_517696 ) ( CLEAR ?auto_517695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_517692 ?auto_517693 ?auto_517694 ?auto_517695 )
      ( MAKE-12PILE ?auto_517692 ?auto_517693 ?auto_517694 ?auto_517695 ?auto_517696 ?auto_517697 ?auto_517698 ?auto_517699 ?auto_517700 ?auto_517701 ?auto_517702 ?auto_517703 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517742 - BLOCK
      ?auto_517743 - BLOCK
      ?auto_517744 - BLOCK
      ?auto_517745 - BLOCK
      ?auto_517746 - BLOCK
      ?auto_517747 - BLOCK
      ?auto_517748 - BLOCK
      ?auto_517749 - BLOCK
      ?auto_517750 - BLOCK
      ?auto_517751 - BLOCK
      ?auto_517752 - BLOCK
      ?auto_517753 - BLOCK
    )
    :vars
    (
      ?auto_517754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517753 ?auto_517754 ) ( ON-TABLE ?auto_517742 ) ( ON ?auto_517743 ?auto_517742 ) ( not ( = ?auto_517742 ?auto_517743 ) ) ( not ( = ?auto_517742 ?auto_517744 ) ) ( not ( = ?auto_517742 ?auto_517745 ) ) ( not ( = ?auto_517742 ?auto_517746 ) ) ( not ( = ?auto_517742 ?auto_517747 ) ) ( not ( = ?auto_517742 ?auto_517748 ) ) ( not ( = ?auto_517742 ?auto_517749 ) ) ( not ( = ?auto_517742 ?auto_517750 ) ) ( not ( = ?auto_517742 ?auto_517751 ) ) ( not ( = ?auto_517742 ?auto_517752 ) ) ( not ( = ?auto_517742 ?auto_517753 ) ) ( not ( = ?auto_517742 ?auto_517754 ) ) ( not ( = ?auto_517743 ?auto_517744 ) ) ( not ( = ?auto_517743 ?auto_517745 ) ) ( not ( = ?auto_517743 ?auto_517746 ) ) ( not ( = ?auto_517743 ?auto_517747 ) ) ( not ( = ?auto_517743 ?auto_517748 ) ) ( not ( = ?auto_517743 ?auto_517749 ) ) ( not ( = ?auto_517743 ?auto_517750 ) ) ( not ( = ?auto_517743 ?auto_517751 ) ) ( not ( = ?auto_517743 ?auto_517752 ) ) ( not ( = ?auto_517743 ?auto_517753 ) ) ( not ( = ?auto_517743 ?auto_517754 ) ) ( not ( = ?auto_517744 ?auto_517745 ) ) ( not ( = ?auto_517744 ?auto_517746 ) ) ( not ( = ?auto_517744 ?auto_517747 ) ) ( not ( = ?auto_517744 ?auto_517748 ) ) ( not ( = ?auto_517744 ?auto_517749 ) ) ( not ( = ?auto_517744 ?auto_517750 ) ) ( not ( = ?auto_517744 ?auto_517751 ) ) ( not ( = ?auto_517744 ?auto_517752 ) ) ( not ( = ?auto_517744 ?auto_517753 ) ) ( not ( = ?auto_517744 ?auto_517754 ) ) ( not ( = ?auto_517745 ?auto_517746 ) ) ( not ( = ?auto_517745 ?auto_517747 ) ) ( not ( = ?auto_517745 ?auto_517748 ) ) ( not ( = ?auto_517745 ?auto_517749 ) ) ( not ( = ?auto_517745 ?auto_517750 ) ) ( not ( = ?auto_517745 ?auto_517751 ) ) ( not ( = ?auto_517745 ?auto_517752 ) ) ( not ( = ?auto_517745 ?auto_517753 ) ) ( not ( = ?auto_517745 ?auto_517754 ) ) ( not ( = ?auto_517746 ?auto_517747 ) ) ( not ( = ?auto_517746 ?auto_517748 ) ) ( not ( = ?auto_517746 ?auto_517749 ) ) ( not ( = ?auto_517746 ?auto_517750 ) ) ( not ( = ?auto_517746 ?auto_517751 ) ) ( not ( = ?auto_517746 ?auto_517752 ) ) ( not ( = ?auto_517746 ?auto_517753 ) ) ( not ( = ?auto_517746 ?auto_517754 ) ) ( not ( = ?auto_517747 ?auto_517748 ) ) ( not ( = ?auto_517747 ?auto_517749 ) ) ( not ( = ?auto_517747 ?auto_517750 ) ) ( not ( = ?auto_517747 ?auto_517751 ) ) ( not ( = ?auto_517747 ?auto_517752 ) ) ( not ( = ?auto_517747 ?auto_517753 ) ) ( not ( = ?auto_517747 ?auto_517754 ) ) ( not ( = ?auto_517748 ?auto_517749 ) ) ( not ( = ?auto_517748 ?auto_517750 ) ) ( not ( = ?auto_517748 ?auto_517751 ) ) ( not ( = ?auto_517748 ?auto_517752 ) ) ( not ( = ?auto_517748 ?auto_517753 ) ) ( not ( = ?auto_517748 ?auto_517754 ) ) ( not ( = ?auto_517749 ?auto_517750 ) ) ( not ( = ?auto_517749 ?auto_517751 ) ) ( not ( = ?auto_517749 ?auto_517752 ) ) ( not ( = ?auto_517749 ?auto_517753 ) ) ( not ( = ?auto_517749 ?auto_517754 ) ) ( not ( = ?auto_517750 ?auto_517751 ) ) ( not ( = ?auto_517750 ?auto_517752 ) ) ( not ( = ?auto_517750 ?auto_517753 ) ) ( not ( = ?auto_517750 ?auto_517754 ) ) ( not ( = ?auto_517751 ?auto_517752 ) ) ( not ( = ?auto_517751 ?auto_517753 ) ) ( not ( = ?auto_517751 ?auto_517754 ) ) ( not ( = ?auto_517752 ?auto_517753 ) ) ( not ( = ?auto_517752 ?auto_517754 ) ) ( not ( = ?auto_517753 ?auto_517754 ) ) ( ON ?auto_517752 ?auto_517753 ) ( ON ?auto_517751 ?auto_517752 ) ( ON ?auto_517750 ?auto_517751 ) ( ON ?auto_517749 ?auto_517750 ) ( ON ?auto_517748 ?auto_517749 ) ( ON ?auto_517747 ?auto_517748 ) ( ON ?auto_517746 ?auto_517747 ) ( ON ?auto_517745 ?auto_517746 ) ( CLEAR ?auto_517743 ) ( ON ?auto_517744 ?auto_517745 ) ( CLEAR ?auto_517744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_517742 ?auto_517743 ?auto_517744 )
      ( MAKE-12PILE ?auto_517742 ?auto_517743 ?auto_517744 ?auto_517745 ?auto_517746 ?auto_517747 ?auto_517748 ?auto_517749 ?auto_517750 ?auto_517751 ?auto_517752 ?auto_517753 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517792 - BLOCK
      ?auto_517793 - BLOCK
      ?auto_517794 - BLOCK
      ?auto_517795 - BLOCK
      ?auto_517796 - BLOCK
      ?auto_517797 - BLOCK
      ?auto_517798 - BLOCK
      ?auto_517799 - BLOCK
      ?auto_517800 - BLOCK
      ?auto_517801 - BLOCK
      ?auto_517802 - BLOCK
      ?auto_517803 - BLOCK
    )
    :vars
    (
      ?auto_517804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517803 ?auto_517804 ) ( ON-TABLE ?auto_517792 ) ( not ( = ?auto_517792 ?auto_517793 ) ) ( not ( = ?auto_517792 ?auto_517794 ) ) ( not ( = ?auto_517792 ?auto_517795 ) ) ( not ( = ?auto_517792 ?auto_517796 ) ) ( not ( = ?auto_517792 ?auto_517797 ) ) ( not ( = ?auto_517792 ?auto_517798 ) ) ( not ( = ?auto_517792 ?auto_517799 ) ) ( not ( = ?auto_517792 ?auto_517800 ) ) ( not ( = ?auto_517792 ?auto_517801 ) ) ( not ( = ?auto_517792 ?auto_517802 ) ) ( not ( = ?auto_517792 ?auto_517803 ) ) ( not ( = ?auto_517792 ?auto_517804 ) ) ( not ( = ?auto_517793 ?auto_517794 ) ) ( not ( = ?auto_517793 ?auto_517795 ) ) ( not ( = ?auto_517793 ?auto_517796 ) ) ( not ( = ?auto_517793 ?auto_517797 ) ) ( not ( = ?auto_517793 ?auto_517798 ) ) ( not ( = ?auto_517793 ?auto_517799 ) ) ( not ( = ?auto_517793 ?auto_517800 ) ) ( not ( = ?auto_517793 ?auto_517801 ) ) ( not ( = ?auto_517793 ?auto_517802 ) ) ( not ( = ?auto_517793 ?auto_517803 ) ) ( not ( = ?auto_517793 ?auto_517804 ) ) ( not ( = ?auto_517794 ?auto_517795 ) ) ( not ( = ?auto_517794 ?auto_517796 ) ) ( not ( = ?auto_517794 ?auto_517797 ) ) ( not ( = ?auto_517794 ?auto_517798 ) ) ( not ( = ?auto_517794 ?auto_517799 ) ) ( not ( = ?auto_517794 ?auto_517800 ) ) ( not ( = ?auto_517794 ?auto_517801 ) ) ( not ( = ?auto_517794 ?auto_517802 ) ) ( not ( = ?auto_517794 ?auto_517803 ) ) ( not ( = ?auto_517794 ?auto_517804 ) ) ( not ( = ?auto_517795 ?auto_517796 ) ) ( not ( = ?auto_517795 ?auto_517797 ) ) ( not ( = ?auto_517795 ?auto_517798 ) ) ( not ( = ?auto_517795 ?auto_517799 ) ) ( not ( = ?auto_517795 ?auto_517800 ) ) ( not ( = ?auto_517795 ?auto_517801 ) ) ( not ( = ?auto_517795 ?auto_517802 ) ) ( not ( = ?auto_517795 ?auto_517803 ) ) ( not ( = ?auto_517795 ?auto_517804 ) ) ( not ( = ?auto_517796 ?auto_517797 ) ) ( not ( = ?auto_517796 ?auto_517798 ) ) ( not ( = ?auto_517796 ?auto_517799 ) ) ( not ( = ?auto_517796 ?auto_517800 ) ) ( not ( = ?auto_517796 ?auto_517801 ) ) ( not ( = ?auto_517796 ?auto_517802 ) ) ( not ( = ?auto_517796 ?auto_517803 ) ) ( not ( = ?auto_517796 ?auto_517804 ) ) ( not ( = ?auto_517797 ?auto_517798 ) ) ( not ( = ?auto_517797 ?auto_517799 ) ) ( not ( = ?auto_517797 ?auto_517800 ) ) ( not ( = ?auto_517797 ?auto_517801 ) ) ( not ( = ?auto_517797 ?auto_517802 ) ) ( not ( = ?auto_517797 ?auto_517803 ) ) ( not ( = ?auto_517797 ?auto_517804 ) ) ( not ( = ?auto_517798 ?auto_517799 ) ) ( not ( = ?auto_517798 ?auto_517800 ) ) ( not ( = ?auto_517798 ?auto_517801 ) ) ( not ( = ?auto_517798 ?auto_517802 ) ) ( not ( = ?auto_517798 ?auto_517803 ) ) ( not ( = ?auto_517798 ?auto_517804 ) ) ( not ( = ?auto_517799 ?auto_517800 ) ) ( not ( = ?auto_517799 ?auto_517801 ) ) ( not ( = ?auto_517799 ?auto_517802 ) ) ( not ( = ?auto_517799 ?auto_517803 ) ) ( not ( = ?auto_517799 ?auto_517804 ) ) ( not ( = ?auto_517800 ?auto_517801 ) ) ( not ( = ?auto_517800 ?auto_517802 ) ) ( not ( = ?auto_517800 ?auto_517803 ) ) ( not ( = ?auto_517800 ?auto_517804 ) ) ( not ( = ?auto_517801 ?auto_517802 ) ) ( not ( = ?auto_517801 ?auto_517803 ) ) ( not ( = ?auto_517801 ?auto_517804 ) ) ( not ( = ?auto_517802 ?auto_517803 ) ) ( not ( = ?auto_517802 ?auto_517804 ) ) ( not ( = ?auto_517803 ?auto_517804 ) ) ( ON ?auto_517802 ?auto_517803 ) ( ON ?auto_517801 ?auto_517802 ) ( ON ?auto_517800 ?auto_517801 ) ( ON ?auto_517799 ?auto_517800 ) ( ON ?auto_517798 ?auto_517799 ) ( ON ?auto_517797 ?auto_517798 ) ( ON ?auto_517796 ?auto_517797 ) ( ON ?auto_517795 ?auto_517796 ) ( ON ?auto_517794 ?auto_517795 ) ( CLEAR ?auto_517792 ) ( ON ?auto_517793 ?auto_517794 ) ( CLEAR ?auto_517793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_517792 ?auto_517793 )
      ( MAKE-12PILE ?auto_517792 ?auto_517793 ?auto_517794 ?auto_517795 ?auto_517796 ?auto_517797 ?auto_517798 ?auto_517799 ?auto_517800 ?auto_517801 ?auto_517802 ?auto_517803 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_517842 - BLOCK
      ?auto_517843 - BLOCK
      ?auto_517844 - BLOCK
      ?auto_517845 - BLOCK
      ?auto_517846 - BLOCK
      ?auto_517847 - BLOCK
      ?auto_517848 - BLOCK
      ?auto_517849 - BLOCK
      ?auto_517850 - BLOCK
      ?auto_517851 - BLOCK
      ?auto_517852 - BLOCK
      ?auto_517853 - BLOCK
    )
    :vars
    (
      ?auto_517854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517853 ?auto_517854 ) ( not ( = ?auto_517842 ?auto_517843 ) ) ( not ( = ?auto_517842 ?auto_517844 ) ) ( not ( = ?auto_517842 ?auto_517845 ) ) ( not ( = ?auto_517842 ?auto_517846 ) ) ( not ( = ?auto_517842 ?auto_517847 ) ) ( not ( = ?auto_517842 ?auto_517848 ) ) ( not ( = ?auto_517842 ?auto_517849 ) ) ( not ( = ?auto_517842 ?auto_517850 ) ) ( not ( = ?auto_517842 ?auto_517851 ) ) ( not ( = ?auto_517842 ?auto_517852 ) ) ( not ( = ?auto_517842 ?auto_517853 ) ) ( not ( = ?auto_517842 ?auto_517854 ) ) ( not ( = ?auto_517843 ?auto_517844 ) ) ( not ( = ?auto_517843 ?auto_517845 ) ) ( not ( = ?auto_517843 ?auto_517846 ) ) ( not ( = ?auto_517843 ?auto_517847 ) ) ( not ( = ?auto_517843 ?auto_517848 ) ) ( not ( = ?auto_517843 ?auto_517849 ) ) ( not ( = ?auto_517843 ?auto_517850 ) ) ( not ( = ?auto_517843 ?auto_517851 ) ) ( not ( = ?auto_517843 ?auto_517852 ) ) ( not ( = ?auto_517843 ?auto_517853 ) ) ( not ( = ?auto_517843 ?auto_517854 ) ) ( not ( = ?auto_517844 ?auto_517845 ) ) ( not ( = ?auto_517844 ?auto_517846 ) ) ( not ( = ?auto_517844 ?auto_517847 ) ) ( not ( = ?auto_517844 ?auto_517848 ) ) ( not ( = ?auto_517844 ?auto_517849 ) ) ( not ( = ?auto_517844 ?auto_517850 ) ) ( not ( = ?auto_517844 ?auto_517851 ) ) ( not ( = ?auto_517844 ?auto_517852 ) ) ( not ( = ?auto_517844 ?auto_517853 ) ) ( not ( = ?auto_517844 ?auto_517854 ) ) ( not ( = ?auto_517845 ?auto_517846 ) ) ( not ( = ?auto_517845 ?auto_517847 ) ) ( not ( = ?auto_517845 ?auto_517848 ) ) ( not ( = ?auto_517845 ?auto_517849 ) ) ( not ( = ?auto_517845 ?auto_517850 ) ) ( not ( = ?auto_517845 ?auto_517851 ) ) ( not ( = ?auto_517845 ?auto_517852 ) ) ( not ( = ?auto_517845 ?auto_517853 ) ) ( not ( = ?auto_517845 ?auto_517854 ) ) ( not ( = ?auto_517846 ?auto_517847 ) ) ( not ( = ?auto_517846 ?auto_517848 ) ) ( not ( = ?auto_517846 ?auto_517849 ) ) ( not ( = ?auto_517846 ?auto_517850 ) ) ( not ( = ?auto_517846 ?auto_517851 ) ) ( not ( = ?auto_517846 ?auto_517852 ) ) ( not ( = ?auto_517846 ?auto_517853 ) ) ( not ( = ?auto_517846 ?auto_517854 ) ) ( not ( = ?auto_517847 ?auto_517848 ) ) ( not ( = ?auto_517847 ?auto_517849 ) ) ( not ( = ?auto_517847 ?auto_517850 ) ) ( not ( = ?auto_517847 ?auto_517851 ) ) ( not ( = ?auto_517847 ?auto_517852 ) ) ( not ( = ?auto_517847 ?auto_517853 ) ) ( not ( = ?auto_517847 ?auto_517854 ) ) ( not ( = ?auto_517848 ?auto_517849 ) ) ( not ( = ?auto_517848 ?auto_517850 ) ) ( not ( = ?auto_517848 ?auto_517851 ) ) ( not ( = ?auto_517848 ?auto_517852 ) ) ( not ( = ?auto_517848 ?auto_517853 ) ) ( not ( = ?auto_517848 ?auto_517854 ) ) ( not ( = ?auto_517849 ?auto_517850 ) ) ( not ( = ?auto_517849 ?auto_517851 ) ) ( not ( = ?auto_517849 ?auto_517852 ) ) ( not ( = ?auto_517849 ?auto_517853 ) ) ( not ( = ?auto_517849 ?auto_517854 ) ) ( not ( = ?auto_517850 ?auto_517851 ) ) ( not ( = ?auto_517850 ?auto_517852 ) ) ( not ( = ?auto_517850 ?auto_517853 ) ) ( not ( = ?auto_517850 ?auto_517854 ) ) ( not ( = ?auto_517851 ?auto_517852 ) ) ( not ( = ?auto_517851 ?auto_517853 ) ) ( not ( = ?auto_517851 ?auto_517854 ) ) ( not ( = ?auto_517852 ?auto_517853 ) ) ( not ( = ?auto_517852 ?auto_517854 ) ) ( not ( = ?auto_517853 ?auto_517854 ) ) ( ON ?auto_517852 ?auto_517853 ) ( ON ?auto_517851 ?auto_517852 ) ( ON ?auto_517850 ?auto_517851 ) ( ON ?auto_517849 ?auto_517850 ) ( ON ?auto_517848 ?auto_517849 ) ( ON ?auto_517847 ?auto_517848 ) ( ON ?auto_517846 ?auto_517847 ) ( ON ?auto_517845 ?auto_517846 ) ( ON ?auto_517844 ?auto_517845 ) ( ON ?auto_517843 ?auto_517844 ) ( ON ?auto_517842 ?auto_517843 ) ( CLEAR ?auto_517842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_517842 )
      ( MAKE-12PILE ?auto_517842 ?auto_517843 ?auto_517844 ?auto_517845 ?auto_517846 ?auto_517847 ?auto_517848 ?auto_517849 ?auto_517850 ?auto_517851 ?auto_517852 ?auto_517853 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_517893 - BLOCK
      ?auto_517894 - BLOCK
      ?auto_517895 - BLOCK
      ?auto_517896 - BLOCK
      ?auto_517897 - BLOCK
      ?auto_517898 - BLOCK
      ?auto_517899 - BLOCK
      ?auto_517900 - BLOCK
      ?auto_517901 - BLOCK
      ?auto_517902 - BLOCK
      ?auto_517903 - BLOCK
      ?auto_517904 - BLOCK
      ?auto_517905 - BLOCK
    )
    :vars
    (
      ?auto_517906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_517904 ) ( ON ?auto_517905 ?auto_517906 ) ( CLEAR ?auto_517905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_517893 ) ( ON ?auto_517894 ?auto_517893 ) ( ON ?auto_517895 ?auto_517894 ) ( ON ?auto_517896 ?auto_517895 ) ( ON ?auto_517897 ?auto_517896 ) ( ON ?auto_517898 ?auto_517897 ) ( ON ?auto_517899 ?auto_517898 ) ( ON ?auto_517900 ?auto_517899 ) ( ON ?auto_517901 ?auto_517900 ) ( ON ?auto_517902 ?auto_517901 ) ( ON ?auto_517903 ?auto_517902 ) ( ON ?auto_517904 ?auto_517903 ) ( not ( = ?auto_517893 ?auto_517894 ) ) ( not ( = ?auto_517893 ?auto_517895 ) ) ( not ( = ?auto_517893 ?auto_517896 ) ) ( not ( = ?auto_517893 ?auto_517897 ) ) ( not ( = ?auto_517893 ?auto_517898 ) ) ( not ( = ?auto_517893 ?auto_517899 ) ) ( not ( = ?auto_517893 ?auto_517900 ) ) ( not ( = ?auto_517893 ?auto_517901 ) ) ( not ( = ?auto_517893 ?auto_517902 ) ) ( not ( = ?auto_517893 ?auto_517903 ) ) ( not ( = ?auto_517893 ?auto_517904 ) ) ( not ( = ?auto_517893 ?auto_517905 ) ) ( not ( = ?auto_517893 ?auto_517906 ) ) ( not ( = ?auto_517894 ?auto_517895 ) ) ( not ( = ?auto_517894 ?auto_517896 ) ) ( not ( = ?auto_517894 ?auto_517897 ) ) ( not ( = ?auto_517894 ?auto_517898 ) ) ( not ( = ?auto_517894 ?auto_517899 ) ) ( not ( = ?auto_517894 ?auto_517900 ) ) ( not ( = ?auto_517894 ?auto_517901 ) ) ( not ( = ?auto_517894 ?auto_517902 ) ) ( not ( = ?auto_517894 ?auto_517903 ) ) ( not ( = ?auto_517894 ?auto_517904 ) ) ( not ( = ?auto_517894 ?auto_517905 ) ) ( not ( = ?auto_517894 ?auto_517906 ) ) ( not ( = ?auto_517895 ?auto_517896 ) ) ( not ( = ?auto_517895 ?auto_517897 ) ) ( not ( = ?auto_517895 ?auto_517898 ) ) ( not ( = ?auto_517895 ?auto_517899 ) ) ( not ( = ?auto_517895 ?auto_517900 ) ) ( not ( = ?auto_517895 ?auto_517901 ) ) ( not ( = ?auto_517895 ?auto_517902 ) ) ( not ( = ?auto_517895 ?auto_517903 ) ) ( not ( = ?auto_517895 ?auto_517904 ) ) ( not ( = ?auto_517895 ?auto_517905 ) ) ( not ( = ?auto_517895 ?auto_517906 ) ) ( not ( = ?auto_517896 ?auto_517897 ) ) ( not ( = ?auto_517896 ?auto_517898 ) ) ( not ( = ?auto_517896 ?auto_517899 ) ) ( not ( = ?auto_517896 ?auto_517900 ) ) ( not ( = ?auto_517896 ?auto_517901 ) ) ( not ( = ?auto_517896 ?auto_517902 ) ) ( not ( = ?auto_517896 ?auto_517903 ) ) ( not ( = ?auto_517896 ?auto_517904 ) ) ( not ( = ?auto_517896 ?auto_517905 ) ) ( not ( = ?auto_517896 ?auto_517906 ) ) ( not ( = ?auto_517897 ?auto_517898 ) ) ( not ( = ?auto_517897 ?auto_517899 ) ) ( not ( = ?auto_517897 ?auto_517900 ) ) ( not ( = ?auto_517897 ?auto_517901 ) ) ( not ( = ?auto_517897 ?auto_517902 ) ) ( not ( = ?auto_517897 ?auto_517903 ) ) ( not ( = ?auto_517897 ?auto_517904 ) ) ( not ( = ?auto_517897 ?auto_517905 ) ) ( not ( = ?auto_517897 ?auto_517906 ) ) ( not ( = ?auto_517898 ?auto_517899 ) ) ( not ( = ?auto_517898 ?auto_517900 ) ) ( not ( = ?auto_517898 ?auto_517901 ) ) ( not ( = ?auto_517898 ?auto_517902 ) ) ( not ( = ?auto_517898 ?auto_517903 ) ) ( not ( = ?auto_517898 ?auto_517904 ) ) ( not ( = ?auto_517898 ?auto_517905 ) ) ( not ( = ?auto_517898 ?auto_517906 ) ) ( not ( = ?auto_517899 ?auto_517900 ) ) ( not ( = ?auto_517899 ?auto_517901 ) ) ( not ( = ?auto_517899 ?auto_517902 ) ) ( not ( = ?auto_517899 ?auto_517903 ) ) ( not ( = ?auto_517899 ?auto_517904 ) ) ( not ( = ?auto_517899 ?auto_517905 ) ) ( not ( = ?auto_517899 ?auto_517906 ) ) ( not ( = ?auto_517900 ?auto_517901 ) ) ( not ( = ?auto_517900 ?auto_517902 ) ) ( not ( = ?auto_517900 ?auto_517903 ) ) ( not ( = ?auto_517900 ?auto_517904 ) ) ( not ( = ?auto_517900 ?auto_517905 ) ) ( not ( = ?auto_517900 ?auto_517906 ) ) ( not ( = ?auto_517901 ?auto_517902 ) ) ( not ( = ?auto_517901 ?auto_517903 ) ) ( not ( = ?auto_517901 ?auto_517904 ) ) ( not ( = ?auto_517901 ?auto_517905 ) ) ( not ( = ?auto_517901 ?auto_517906 ) ) ( not ( = ?auto_517902 ?auto_517903 ) ) ( not ( = ?auto_517902 ?auto_517904 ) ) ( not ( = ?auto_517902 ?auto_517905 ) ) ( not ( = ?auto_517902 ?auto_517906 ) ) ( not ( = ?auto_517903 ?auto_517904 ) ) ( not ( = ?auto_517903 ?auto_517905 ) ) ( not ( = ?auto_517903 ?auto_517906 ) ) ( not ( = ?auto_517904 ?auto_517905 ) ) ( not ( = ?auto_517904 ?auto_517906 ) ) ( not ( = ?auto_517905 ?auto_517906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_517905 ?auto_517906 )
      ( !STACK ?auto_517905 ?auto_517904 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_517947 - BLOCK
      ?auto_517948 - BLOCK
      ?auto_517949 - BLOCK
      ?auto_517950 - BLOCK
      ?auto_517951 - BLOCK
      ?auto_517952 - BLOCK
      ?auto_517953 - BLOCK
      ?auto_517954 - BLOCK
      ?auto_517955 - BLOCK
      ?auto_517956 - BLOCK
      ?auto_517957 - BLOCK
      ?auto_517958 - BLOCK
      ?auto_517959 - BLOCK
    )
    :vars
    (
      ?auto_517960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_517959 ?auto_517960 ) ( ON-TABLE ?auto_517947 ) ( ON ?auto_517948 ?auto_517947 ) ( ON ?auto_517949 ?auto_517948 ) ( ON ?auto_517950 ?auto_517949 ) ( ON ?auto_517951 ?auto_517950 ) ( ON ?auto_517952 ?auto_517951 ) ( ON ?auto_517953 ?auto_517952 ) ( ON ?auto_517954 ?auto_517953 ) ( ON ?auto_517955 ?auto_517954 ) ( ON ?auto_517956 ?auto_517955 ) ( ON ?auto_517957 ?auto_517956 ) ( not ( = ?auto_517947 ?auto_517948 ) ) ( not ( = ?auto_517947 ?auto_517949 ) ) ( not ( = ?auto_517947 ?auto_517950 ) ) ( not ( = ?auto_517947 ?auto_517951 ) ) ( not ( = ?auto_517947 ?auto_517952 ) ) ( not ( = ?auto_517947 ?auto_517953 ) ) ( not ( = ?auto_517947 ?auto_517954 ) ) ( not ( = ?auto_517947 ?auto_517955 ) ) ( not ( = ?auto_517947 ?auto_517956 ) ) ( not ( = ?auto_517947 ?auto_517957 ) ) ( not ( = ?auto_517947 ?auto_517958 ) ) ( not ( = ?auto_517947 ?auto_517959 ) ) ( not ( = ?auto_517947 ?auto_517960 ) ) ( not ( = ?auto_517948 ?auto_517949 ) ) ( not ( = ?auto_517948 ?auto_517950 ) ) ( not ( = ?auto_517948 ?auto_517951 ) ) ( not ( = ?auto_517948 ?auto_517952 ) ) ( not ( = ?auto_517948 ?auto_517953 ) ) ( not ( = ?auto_517948 ?auto_517954 ) ) ( not ( = ?auto_517948 ?auto_517955 ) ) ( not ( = ?auto_517948 ?auto_517956 ) ) ( not ( = ?auto_517948 ?auto_517957 ) ) ( not ( = ?auto_517948 ?auto_517958 ) ) ( not ( = ?auto_517948 ?auto_517959 ) ) ( not ( = ?auto_517948 ?auto_517960 ) ) ( not ( = ?auto_517949 ?auto_517950 ) ) ( not ( = ?auto_517949 ?auto_517951 ) ) ( not ( = ?auto_517949 ?auto_517952 ) ) ( not ( = ?auto_517949 ?auto_517953 ) ) ( not ( = ?auto_517949 ?auto_517954 ) ) ( not ( = ?auto_517949 ?auto_517955 ) ) ( not ( = ?auto_517949 ?auto_517956 ) ) ( not ( = ?auto_517949 ?auto_517957 ) ) ( not ( = ?auto_517949 ?auto_517958 ) ) ( not ( = ?auto_517949 ?auto_517959 ) ) ( not ( = ?auto_517949 ?auto_517960 ) ) ( not ( = ?auto_517950 ?auto_517951 ) ) ( not ( = ?auto_517950 ?auto_517952 ) ) ( not ( = ?auto_517950 ?auto_517953 ) ) ( not ( = ?auto_517950 ?auto_517954 ) ) ( not ( = ?auto_517950 ?auto_517955 ) ) ( not ( = ?auto_517950 ?auto_517956 ) ) ( not ( = ?auto_517950 ?auto_517957 ) ) ( not ( = ?auto_517950 ?auto_517958 ) ) ( not ( = ?auto_517950 ?auto_517959 ) ) ( not ( = ?auto_517950 ?auto_517960 ) ) ( not ( = ?auto_517951 ?auto_517952 ) ) ( not ( = ?auto_517951 ?auto_517953 ) ) ( not ( = ?auto_517951 ?auto_517954 ) ) ( not ( = ?auto_517951 ?auto_517955 ) ) ( not ( = ?auto_517951 ?auto_517956 ) ) ( not ( = ?auto_517951 ?auto_517957 ) ) ( not ( = ?auto_517951 ?auto_517958 ) ) ( not ( = ?auto_517951 ?auto_517959 ) ) ( not ( = ?auto_517951 ?auto_517960 ) ) ( not ( = ?auto_517952 ?auto_517953 ) ) ( not ( = ?auto_517952 ?auto_517954 ) ) ( not ( = ?auto_517952 ?auto_517955 ) ) ( not ( = ?auto_517952 ?auto_517956 ) ) ( not ( = ?auto_517952 ?auto_517957 ) ) ( not ( = ?auto_517952 ?auto_517958 ) ) ( not ( = ?auto_517952 ?auto_517959 ) ) ( not ( = ?auto_517952 ?auto_517960 ) ) ( not ( = ?auto_517953 ?auto_517954 ) ) ( not ( = ?auto_517953 ?auto_517955 ) ) ( not ( = ?auto_517953 ?auto_517956 ) ) ( not ( = ?auto_517953 ?auto_517957 ) ) ( not ( = ?auto_517953 ?auto_517958 ) ) ( not ( = ?auto_517953 ?auto_517959 ) ) ( not ( = ?auto_517953 ?auto_517960 ) ) ( not ( = ?auto_517954 ?auto_517955 ) ) ( not ( = ?auto_517954 ?auto_517956 ) ) ( not ( = ?auto_517954 ?auto_517957 ) ) ( not ( = ?auto_517954 ?auto_517958 ) ) ( not ( = ?auto_517954 ?auto_517959 ) ) ( not ( = ?auto_517954 ?auto_517960 ) ) ( not ( = ?auto_517955 ?auto_517956 ) ) ( not ( = ?auto_517955 ?auto_517957 ) ) ( not ( = ?auto_517955 ?auto_517958 ) ) ( not ( = ?auto_517955 ?auto_517959 ) ) ( not ( = ?auto_517955 ?auto_517960 ) ) ( not ( = ?auto_517956 ?auto_517957 ) ) ( not ( = ?auto_517956 ?auto_517958 ) ) ( not ( = ?auto_517956 ?auto_517959 ) ) ( not ( = ?auto_517956 ?auto_517960 ) ) ( not ( = ?auto_517957 ?auto_517958 ) ) ( not ( = ?auto_517957 ?auto_517959 ) ) ( not ( = ?auto_517957 ?auto_517960 ) ) ( not ( = ?auto_517958 ?auto_517959 ) ) ( not ( = ?auto_517958 ?auto_517960 ) ) ( not ( = ?auto_517959 ?auto_517960 ) ) ( CLEAR ?auto_517957 ) ( ON ?auto_517958 ?auto_517959 ) ( CLEAR ?auto_517958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_517947 ?auto_517948 ?auto_517949 ?auto_517950 ?auto_517951 ?auto_517952 ?auto_517953 ?auto_517954 ?auto_517955 ?auto_517956 ?auto_517957 ?auto_517958 )
      ( MAKE-13PILE ?auto_517947 ?auto_517948 ?auto_517949 ?auto_517950 ?auto_517951 ?auto_517952 ?auto_517953 ?auto_517954 ?auto_517955 ?auto_517956 ?auto_517957 ?auto_517958 ?auto_517959 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518001 - BLOCK
      ?auto_518002 - BLOCK
      ?auto_518003 - BLOCK
      ?auto_518004 - BLOCK
      ?auto_518005 - BLOCK
      ?auto_518006 - BLOCK
      ?auto_518007 - BLOCK
      ?auto_518008 - BLOCK
      ?auto_518009 - BLOCK
      ?auto_518010 - BLOCK
      ?auto_518011 - BLOCK
      ?auto_518012 - BLOCK
      ?auto_518013 - BLOCK
    )
    :vars
    (
      ?auto_518014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518013 ?auto_518014 ) ( ON-TABLE ?auto_518001 ) ( ON ?auto_518002 ?auto_518001 ) ( ON ?auto_518003 ?auto_518002 ) ( ON ?auto_518004 ?auto_518003 ) ( ON ?auto_518005 ?auto_518004 ) ( ON ?auto_518006 ?auto_518005 ) ( ON ?auto_518007 ?auto_518006 ) ( ON ?auto_518008 ?auto_518007 ) ( ON ?auto_518009 ?auto_518008 ) ( ON ?auto_518010 ?auto_518009 ) ( not ( = ?auto_518001 ?auto_518002 ) ) ( not ( = ?auto_518001 ?auto_518003 ) ) ( not ( = ?auto_518001 ?auto_518004 ) ) ( not ( = ?auto_518001 ?auto_518005 ) ) ( not ( = ?auto_518001 ?auto_518006 ) ) ( not ( = ?auto_518001 ?auto_518007 ) ) ( not ( = ?auto_518001 ?auto_518008 ) ) ( not ( = ?auto_518001 ?auto_518009 ) ) ( not ( = ?auto_518001 ?auto_518010 ) ) ( not ( = ?auto_518001 ?auto_518011 ) ) ( not ( = ?auto_518001 ?auto_518012 ) ) ( not ( = ?auto_518001 ?auto_518013 ) ) ( not ( = ?auto_518001 ?auto_518014 ) ) ( not ( = ?auto_518002 ?auto_518003 ) ) ( not ( = ?auto_518002 ?auto_518004 ) ) ( not ( = ?auto_518002 ?auto_518005 ) ) ( not ( = ?auto_518002 ?auto_518006 ) ) ( not ( = ?auto_518002 ?auto_518007 ) ) ( not ( = ?auto_518002 ?auto_518008 ) ) ( not ( = ?auto_518002 ?auto_518009 ) ) ( not ( = ?auto_518002 ?auto_518010 ) ) ( not ( = ?auto_518002 ?auto_518011 ) ) ( not ( = ?auto_518002 ?auto_518012 ) ) ( not ( = ?auto_518002 ?auto_518013 ) ) ( not ( = ?auto_518002 ?auto_518014 ) ) ( not ( = ?auto_518003 ?auto_518004 ) ) ( not ( = ?auto_518003 ?auto_518005 ) ) ( not ( = ?auto_518003 ?auto_518006 ) ) ( not ( = ?auto_518003 ?auto_518007 ) ) ( not ( = ?auto_518003 ?auto_518008 ) ) ( not ( = ?auto_518003 ?auto_518009 ) ) ( not ( = ?auto_518003 ?auto_518010 ) ) ( not ( = ?auto_518003 ?auto_518011 ) ) ( not ( = ?auto_518003 ?auto_518012 ) ) ( not ( = ?auto_518003 ?auto_518013 ) ) ( not ( = ?auto_518003 ?auto_518014 ) ) ( not ( = ?auto_518004 ?auto_518005 ) ) ( not ( = ?auto_518004 ?auto_518006 ) ) ( not ( = ?auto_518004 ?auto_518007 ) ) ( not ( = ?auto_518004 ?auto_518008 ) ) ( not ( = ?auto_518004 ?auto_518009 ) ) ( not ( = ?auto_518004 ?auto_518010 ) ) ( not ( = ?auto_518004 ?auto_518011 ) ) ( not ( = ?auto_518004 ?auto_518012 ) ) ( not ( = ?auto_518004 ?auto_518013 ) ) ( not ( = ?auto_518004 ?auto_518014 ) ) ( not ( = ?auto_518005 ?auto_518006 ) ) ( not ( = ?auto_518005 ?auto_518007 ) ) ( not ( = ?auto_518005 ?auto_518008 ) ) ( not ( = ?auto_518005 ?auto_518009 ) ) ( not ( = ?auto_518005 ?auto_518010 ) ) ( not ( = ?auto_518005 ?auto_518011 ) ) ( not ( = ?auto_518005 ?auto_518012 ) ) ( not ( = ?auto_518005 ?auto_518013 ) ) ( not ( = ?auto_518005 ?auto_518014 ) ) ( not ( = ?auto_518006 ?auto_518007 ) ) ( not ( = ?auto_518006 ?auto_518008 ) ) ( not ( = ?auto_518006 ?auto_518009 ) ) ( not ( = ?auto_518006 ?auto_518010 ) ) ( not ( = ?auto_518006 ?auto_518011 ) ) ( not ( = ?auto_518006 ?auto_518012 ) ) ( not ( = ?auto_518006 ?auto_518013 ) ) ( not ( = ?auto_518006 ?auto_518014 ) ) ( not ( = ?auto_518007 ?auto_518008 ) ) ( not ( = ?auto_518007 ?auto_518009 ) ) ( not ( = ?auto_518007 ?auto_518010 ) ) ( not ( = ?auto_518007 ?auto_518011 ) ) ( not ( = ?auto_518007 ?auto_518012 ) ) ( not ( = ?auto_518007 ?auto_518013 ) ) ( not ( = ?auto_518007 ?auto_518014 ) ) ( not ( = ?auto_518008 ?auto_518009 ) ) ( not ( = ?auto_518008 ?auto_518010 ) ) ( not ( = ?auto_518008 ?auto_518011 ) ) ( not ( = ?auto_518008 ?auto_518012 ) ) ( not ( = ?auto_518008 ?auto_518013 ) ) ( not ( = ?auto_518008 ?auto_518014 ) ) ( not ( = ?auto_518009 ?auto_518010 ) ) ( not ( = ?auto_518009 ?auto_518011 ) ) ( not ( = ?auto_518009 ?auto_518012 ) ) ( not ( = ?auto_518009 ?auto_518013 ) ) ( not ( = ?auto_518009 ?auto_518014 ) ) ( not ( = ?auto_518010 ?auto_518011 ) ) ( not ( = ?auto_518010 ?auto_518012 ) ) ( not ( = ?auto_518010 ?auto_518013 ) ) ( not ( = ?auto_518010 ?auto_518014 ) ) ( not ( = ?auto_518011 ?auto_518012 ) ) ( not ( = ?auto_518011 ?auto_518013 ) ) ( not ( = ?auto_518011 ?auto_518014 ) ) ( not ( = ?auto_518012 ?auto_518013 ) ) ( not ( = ?auto_518012 ?auto_518014 ) ) ( not ( = ?auto_518013 ?auto_518014 ) ) ( ON ?auto_518012 ?auto_518013 ) ( CLEAR ?auto_518010 ) ( ON ?auto_518011 ?auto_518012 ) ( CLEAR ?auto_518011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_518001 ?auto_518002 ?auto_518003 ?auto_518004 ?auto_518005 ?auto_518006 ?auto_518007 ?auto_518008 ?auto_518009 ?auto_518010 ?auto_518011 )
      ( MAKE-13PILE ?auto_518001 ?auto_518002 ?auto_518003 ?auto_518004 ?auto_518005 ?auto_518006 ?auto_518007 ?auto_518008 ?auto_518009 ?auto_518010 ?auto_518011 ?auto_518012 ?auto_518013 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518055 - BLOCK
      ?auto_518056 - BLOCK
      ?auto_518057 - BLOCK
      ?auto_518058 - BLOCK
      ?auto_518059 - BLOCK
      ?auto_518060 - BLOCK
      ?auto_518061 - BLOCK
      ?auto_518062 - BLOCK
      ?auto_518063 - BLOCK
      ?auto_518064 - BLOCK
      ?auto_518065 - BLOCK
      ?auto_518066 - BLOCK
      ?auto_518067 - BLOCK
    )
    :vars
    (
      ?auto_518068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518067 ?auto_518068 ) ( ON-TABLE ?auto_518055 ) ( ON ?auto_518056 ?auto_518055 ) ( ON ?auto_518057 ?auto_518056 ) ( ON ?auto_518058 ?auto_518057 ) ( ON ?auto_518059 ?auto_518058 ) ( ON ?auto_518060 ?auto_518059 ) ( ON ?auto_518061 ?auto_518060 ) ( ON ?auto_518062 ?auto_518061 ) ( ON ?auto_518063 ?auto_518062 ) ( not ( = ?auto_518055 ?auto_518056 ) ) ( not ( = ?auto_518055 ?auto_518057 ) ) ( not ( = ?auto_518055 ?auto_518058 ) ) ( not ( = ?auto_518055 ?auto_518059 ) ) ( not ( = ?auto_518055 ?auto_518060 ) ) ( not ( = ?auto_518055 ?auto_518061 ) ) ( not ( = ?auto_518055 ?auto_518062 ) ) ( not ( = ?auto_518055 ?auto_518063 ) ) ( not ( = ?auto_518055 ?auto_518064 ) ) ( not ( = ?auto_518055 ?auto_518065 ) ) ( not ( = ?auto_518055 ?auto_518066 ) ) ( not ( = ?auto_518055 ?auto_518067 ) ) ( not ( = ?auto_518055 ?auto_518068 ) ) ( not ( = ?auto_518056 ?auto_518057 ) ) ( not ( = ?auto_518056 ?auto_518058 ) ) ( not ( = ?auto_518056 ?auto_518059 ) ) ( not ( = ?auto_518056 ?auto_518060 ) ) ( not ( = ?auto_518056 ?auto_518061 ) ) ( not ( = ?auto_518056 ?auto_518062 ) ) ( not ( = ?auto_518056 ?auto_518063 ) ) ( not ( = ?auto_518056 ?auto_518064 ) ) ( not ( = ?auto_518056 ?auto_518065 ) ) ( not ( = ?auto_518056 ?auto_518066 ) ) ( not ( = ?auto_518056 ?auto_518067 ) ) ( not ( = ?auto_518056 ?auto_518068 ) ) ( not ( = ?auto_518057 ?auto_518058 ) ) ( not ( = ?auto_518057 ?auto_518059 ) ) ( not ( = ?auto_518057 ?auto_518060 ) ) ( not ( = ?auto_518057 ?auto_518061 ) ) ( not ( = ?auto_518057 ?auto_518062 ) ) ( not ( = ?auto_518057 ?auto_518063 ) ) ( not ( = ?auto_518057 ?auto_518064 ) ) ( not ( = ?auto_518057 ?auto_518065 ) ) ( not ( = ?auto_518057 ?auto_518066 ) ) ( not ( = ?auto_518057 ?auto_518067 ) ) ( not ( = ?auto_518057 ?auto_518068 ) ) ( not ( = ?auto_518058 ?auto_518059 ) ) ( not ( = ?auto_518058 ?auto_518060 ) ) ( not ( = ?auto_518058 ?auto_518061 ) ) ( not ( = ?auto_518058 ?auto_518062 ) ) ( not ( = ?auto_518058 ?auto_518063 ) ) ( not ( = ?auto_518058 ?auto_518064 ) ) ( not ( = ?auto_518058 ?auto_518065 ) ) ( not ( = ?auto_518058 ?auto_518066 ) ) ( not ( = ?auto_518058 ?auto_518067 ) ) ( not ( = ?auto_518058 ?auto_518068 ) ) ( not ( = ?auto_518059 ?auto_518060 ) ) ( not ( = ?auto_518059 ?auto_518061 ) ) ( not ( = ?auto_518059 ?auto_518062 ) ) ( not ( = ?auto_518059 ?auto_518063 ) ) ( not ( = ?auto_518059 ?auto_518064 ) ) ( not ( = ?auto_518059 ?auto_518065 ) ) ( not ( = ?auto_518059 ?auto_518066 ) ) ( not ( = ?auto_518059 ?auto_518067 ) ) ( not ( = ?auto_518059 ?auto_518068 ) ) ( not ( = ?auto_518060 ?auto_518061 ) ) ( not ( = ?auto_518060 ?auto_518062 ) ) ( not ( = ?auto_518060 ?auto_518063 ) ) ( not ( = ?auto_518060 ?auto_518064 ) ) ( not ( = ?auto_518060 ?auto_518065 ) ) ( not ( = ?auto_518060 ?auto_518066 ) ) ( not ( = ?auto_518060 ?auto_518067 ) ) ( not ( = ?auto_518060 ?auto_518068 ) ) ( not ( = ?auto_518061 ?auto_518062 ) ) ( not ( = ?auto_518061 ?auto_518063 ) ) ( not ( = ?auto_518061 ?auto_518064 ) ) ( not ( = ?auto_518061 ?auto_518065 ) ) ( not ( = ?auto_518061 ?auto_518066 ) ) ( not ( = ?auto_518061 ?auto_518067 ) ) ( not ( = ?auto_518061 ?auto_518068 ) ) ( not ( = ?auto_518062 ?auto_518063 ) ) ( not ( = ?auto_518062 ?auto_518064 ) ) ( not ( = ?auto_518062 ?auto_518065 ) ) ( not ( = ?auto_518062 ?auto_518066 ) ) ( not ( = ?auto_518062 ?auto_518067 ) ) ( not ( = ?auto_518062 ?auto_518068 ) ) ( not ( = ?auto_518063 ?auto_518064 ) ) ( not ( = ?auto_518063 ?auto_518065 ) ) ( not ( = ?auto_518063 ?auto_518066 ) ) ( not ( = ?auto_518063 ?auto_518067 ) ) ( not ( = ?auto_518063 ?auto_518068 ) ) ( not ( = ?auto_518064 ?auto_518065 ) ) ( not ( = ?auto_518064 ?auto_518066 ) ) ( not ( = ?auto_518064 ?auto_518067 ) ) ( not ( = ?auto_518064 ?auto_518068 ) ) ( not ( = ?auto_518065 ?auto_518066 ) ) ( not ( = ?auto_518065 ?auto_518067 ) ) ( not ( = ?auto_518065 ?auto_518068 ) ) ( not ( = ?auto_518066 ?auto_518067 ) ) ( not ( = ?auto_518066 ?auto_518068 ) ) ( not ( = ?auto_518067 ?auto_518068 ) ) ( ON ?auto_518066 ?auto_518067 ) ( ON ?auto_518065 ?auto_518066 ) ( CLEAR ?auto_518063 ) ( ON ?auto_518064 ?auto_518065 ) ( CLEAR ?auto_518064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_518055 ?auto_518056 ?auto_518057 ?auto_518058 ?auto_518059 ?auto_518060 ?auto_518061 ?auto_518062 ?auto_518063 ?auto_518064 )
      ( MAKE-13PILE ?auto_518055 ?auto_518056 ?auto_518057 ?auto_518058 ?auto_518059 ?auto_518060 ?auto_518061 ?auto_518062 ?auto_518063 ?auto_518064 ?auto_518065 ?auto_518066 ?auto_518067 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518109 - BLOCK
      ?auto_518110 - BLOCK
      ?auto_518111 - BLOCK
      ?auto_518112 - BLOCK
      ?auto_518113 - BLOCK
      ?auto_518114 - BLOCK
      ?auto_518115 - BLOCK
      ?auto_518116 - BLOCK
      ?auto_518117 - BLOCK
      ?auto_518118 - BLOCK
      ?auto_518119 - BLOCK
      ?auto_518120 - BLOCK
      ?auto_518121 - BLOCK
    )
    :vars
    (
      ?auto_518122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518121 ?auto_518122 ) ( ON-TABLE ?auto_518109 ) ( ON ?auto_518110 ?auto_518109 ) ( ON ?auto_518111 ?auto_518110 ) ( ON ?auto_518112 ?auto_518111 ) ( ON ?auto_518113 ?auto_518112 ) ( ON ?auto_518114 ?auto_518113 ) ( ON ?auto_518115 ?auto_518114 ) ( ON ?auto_518116 ?auto_518115 ) ( not ( = ?auto_518109 ?auto_518110 ) ) ( not ( = ?auto_518109 ?auto_518111 ) ) ( not ( = ?auto_518109 ?auto_518112 ) ) ( not ( = ?auto_518109 ?auto_518113 ) ) ( not ( = ?auto_518109 ?auto_518114 ) ) ( not ( = ?auto_518109 ?auto_518115 ) ) ( not ( = ?auto_518109 ?auto_518116 ) ) ( not ( = ?auto_518109 ?auto_518117 ) ) ( not ( = ?auto_518109 ?auto_518118 ) ) ( not ( = ?auto_518109 ?auto_518119 ) ) ( not ( = ?auto_518109 ?auto_518120 ) ) ( not ( = ?auto_518109 ?auto_518121 ) ) ( not ( = ?auto_518109 ?auto_518122 ) ) ( not ( = ?auto_518110 ?auto_518111 ) ) ( not ( = ?auto_518110 ?auto_518112 ) ) ( not ( = ?auto_518110 ?auto_518113 ) ) ( not ( = ?auto_518110 ?auto_518114 ) ) ( not ( = ?auto_518110 ?auto_518115 ) ) ( not ( = ?auto_518110 ?auto_518116 ) ) ( not ( = ?auto_518110 ?auto_518117 ) ) ( not ( = ?auto_518110 ?auto_518118 ) ) ( not ( = ?auto_518110 ?auto_518119 ) ) ( not ( = ?auto_518110 ?auto_518120 ) ) ( not ( = ?auto_518110 ?auto_518121 ) ) ( not ( = ?auto_518110 ?auto_518122 ) ) ( not ( = ?auto_518111 ?auto_518112 ) ) ( not ( = ?auto_518111 ?auto_518113 ) ) ( not ( = ?auto_518111 ?auto_518114 ) ) ( not ( = ?auto_518111 ?auto_518115 ) ) ( not ( = ?auto_518111 ?auto_518116 ) ) ( not ( = ?auto_518111 ?auto_518117 ) ) ( not ( = ?auto_518111 ?auto_518118 ) ) ( not ( = ?auto_518111 ?auto_518119 ) ) ( not ( = ?auto_518111 ?auto_518120 ) ) ( not ( = ?auto_518111 ?auto_518121 ) ) ( not ( = ?auto_518111 ?auto_518122 ) ) ( not ( = ?auto_518112 ?auto_518113 ) ) ( not ( = ?auto_518112 ?auto_518114 ) ) ( not ( = ?auto_518112 ?auto_518115 ) ) ( not ( = ?auto_518112 ?auto_518116 ) ) ( not ( = ?auto_518112 ?auto_518117 ) ) ( not ( = ?auto_518112 ?auto_518118 ) ) ( not ( = ?auto_518112 ?auto_518119 ) ) ( not ( = ?auto_518112 ?auto_518120 ) ) ( not ( = ?auto_518112 ?auto_518121 ) ) ( not ( = ?auto_518112 ?auto_518122 ) ) ( not ( = ?auto_518113 ?auto_518114 ) ) ( not ( = ?auto_518113 ?auto_518115 ) ) ( not ( = ?auto_518113 ?auto_518116 ) ) ( not ( = ?auto_518113 ?auto_518117 ) ) ( not ( = ?auto_518113 ?auto_518118 ) ) ( not ( = ?auto_518113 ?auto_518119 ) ) ( not ( = ?auto_518113 ?auto_518120 ) ) ( not ( = ?auto_518113 ?auto_518121 ) ) ( not ( = ?auto_518113 ?auto_518122 ) ) ( not ( = ?auto_518114 ?auto_518115 ) ) ( not ( = ?auto_518114 ?auto_518116 ) ) ( not ( = ?auto_518114 ?auto_518117 ) ) ( not ( = ?auto_518114 ?auto_518118 ) ) ( not ( = ?auto_518114 ?auto_518119 ) ) ( not ( = ?auto_518114 ?auto_518120 ) ) ( not ( = ?auto_518114 ?auto_518121 ) ) ( not ( = ?auto_518114 ?auto_518122 ) ) ( not ( = ?auto_518115 ?auto_518116 ) ) ( not ( = ?auto_518115 ?auto_518117 ) ) ( not ( = ?auto_518115 ?auto_518118 ) ) ( not ( = ?auto_518115 ?auto_518119 ) ) ( not ( = ?auto_518115 ?auto_518120 ) ) ( not ( = ?auto_518115 ?auto_518121 ) ) ( not ( = ?auto_518115 ?auto_518122 ) ) ( not ( = ?auto_518116 ?auto_518117 ) ) ( not ( = ?auto_518116 ?auto_518118 ) ) ( not ( = ?auto_518116 ?auto_518119 ) ) ( not ( = ?auto_518116 ?auto_518120 ) ) ( not ( = ?auto_518116 ?auto_518121 ) ) ( not ( = ?auto_518116 ?auto_518122 ) ) ( not ( = ?auto_518117 ?auto_518118 ) ) ( not ( = ?auto_518117 ?auto_518119 ) ) ( not ( = ?auto_518117 ?auto_518120 ) ) ( not ( = ?auto_518117 ?auto_518121 ) ) ( not ( = ?auto_518117 ?auto_518122 ) ) ( not ( = ?auto_518118 ?auto_518119 ) ) ( not ( = ?auto_518118 ?auto_518120 ) ) ( not ( = ?auto_518118 ?auto_518121 ) ) ( not ( = ?auto_518118 ?auto_518122 ) ) ( not ( = ?auto_518119 ?auto_518120 ) ) ( not ( = ?auto_518119 ?auto_518121 ) ) ( not ( = ?auto_518119 ?auto_518122 ) ) ( not ( = ?auto_518120 ?auto_518121 ) ) ( not ( = ?auto_518120 ?auto_518122 ) ) ( not ( = ?auto_518121 ?auto_518122 ) ) ( ON ?auto_518120 ?auto_518121 ) ( ON ?auto_518119 ?auto_518120 ) ( ON ?auto_518118 ?auto_518119 ) ( CLEAR ?auto_518116 ) ( ON ?auto_518117 ?auto_518118 ) ( CLEAR ?auto_518117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_518109 ?auto_518110 ?auto_518111 ?auto_518112 ?auto_518113 ?auto_518114 ?auto_518115 ?auto_518116 ?auto_518117 )
      ( MAKE-13PILE ?auto_518109 ?auto_518110 ?auto_518111 ?auto_518112 ?auto_518113 ?auto_518114 ?auto_518115 ?auto_518116 ?auto_518117 ?auto_518118 ?auto_518119 ?auto_518120 ?auto_518121 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518163 - BLOCK
      ?auto_518164 - BLOCK
      ?auto_518165 - BLOCK
      ?auto_518166 - BLOCK
      ?auto_518167 - BLOCK
      ?auto_518168 - BLOCK
      ?auto_518169 - BLOCK
      ?auto_518170 - BLOCK
      ?auto_518171 - BLOCK
      ?auto_518172 - BLOCK
      ?auto_518173 - BLOCK
      ?auto_518174 - BLOCK
      ?auto_518175 - BLOCK
    )
    :vars
    (
      ?auto_518176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518175 ?auto_518176 ) ( ON-TABLE ?auto_518163 ) ( ON ?auto_518164 ?auto_518163 ) ( ON ?auto_518165 ?auto_518164 ) ( ON ?auto_518166 ?auto_518165 ) ( ON ?auto_518167 ?auto_518166 ) ( ON ?auto_518168 ?auto_518167 ) ( ON ?auto_518169 ?auto_518168 ) ( not ( = ?auto_518163 ?auto_518164 ) ) ( not ( = ?auto_518163 ?auto_518165 ) ) ( not ( = ?auto_518163 ?auto_518166 ) ) ( not ( = ?auto_518163 ?auto_518167 ) ) ( not ( = ?auto_518163 ?auto_518168 ) ) ( not ( = ?auto_518163 ?auto_518169 ) ) ( not ( = ?auto_518163 ?auto_518170 ) ) ( not ( = ?auto_518163 ?auto_518171 ) ) ( not ( = ?auto_518163 ?auto_518172 ) ) ( not ( = ?auto_518163 ?auto_518173 ) ) ( not ( = ?auto_518163 ?auto_518174 ) ) ( not ( = ?auto_518163 ?auto_518175 ) ) ( not ( = ?auto_518163 ?auto_518176 ) ) ( not ( = ?auto_518164 ?auto_518165 ) ) ( not ( = ?auto_518164 ?auto_518166 ) ) ( not ( = ?auto_518164 ?auto_518167 ) ) ( not ( = ?auto_518164 ?auto_518168 ) ) ( not ( = ?auto_518164 ?auto_518169 ) ) ( not ( = ?auto_518164 ?auto_518170 ) ) ( not ( = ?auto_518164 ?auto_518171 ) ) ( not ( = ?auto_518164 ?auto_518172 ) ) ( not ( = ?auto_518164 ?auto_518173 ) ) ( not ( = ?auto_518164 ?auto_518174 ) ) ( not ( = ?auto_518164 ?auto_518175 ) ) ( not ( = ?auto_518164 ?auto_518176 ) ) ( not ( = ?auto_518165 ?auto_518166 ) ) ( not ( = ?auto_518165 ?auto_518167 ) ) ( not ( = ?auto_518165 ?auto_518168 ) ) ( not ( = ?auto_518165 ?auto_518169 ) ) ( not ( = ?auto_518165 ?auto_518170 ) ) ( not ( = ?auto_518165 ?auto_518171 ) ) ( not ( = ?auto_518165 ?auto_518172 ) ) ( not ( = ?auto_518165 ?auto_518173 ) ) ( not ( = ?auto_518165 ?auto_518174 ) ) ( not ( = ?auto_518165 ?auto_518175 ) ) ( not ( = ?auto_518165 ?auto_518176 ) ) ( not ( = ?auto_518166 ?auto_518167 ) ) ( not ( = ?auto_518166 ?auto_518168 ) ) ( not ( = ?auto_518166 ?auto_518169 ) ) ( not ( = ?auto_518166 ?auto_518170 ) ) ( not ( = ?auto_518166 ?auto_518171 ) ) ( not ( = ?auto_518166 ?auto_518172 ) ) ( not ( = ?auto_518166 ?auto_518173 ) ) ( not ( = ?auto_518166 ?auto_518174 ) ) ( not ( = ?auto_518166 ?auto_518175 ) ) ( not ( = ?auto_518166 ?auto_518176 ) ) ( not ( = ?auto_518167 ?auto_518168 ) ) ( not ( = ?auto_518167 ?auto_518169 ) ) ( not ( = ?auto_518167 ?auto_518170 ) ) ( not ( = ?auto_518167 ?auto_518171 ) ) ( not ( = ?auto_518167 ?auto_518172 ) ) ( not ( = ?auto_518167 ?auto_518173 ) ) ( not ( = ?auto_518167 ?auto_518174 ) ) ( not ( = ?auto_518167 ?auto_518175 ) ) ( not ( = ?auto_518167 ?auto_518176 ) ) ( not ( = ?auto_518168 ?auto_518169 ) ) ( not ( = ?auto_518168 ?auto_518170 ) ) ( not ( = ?auto_518168 ?auto_518171 ) ) ( not ( = ?auto_518168 ?auto_518172 ) ) ( not ( = ?auto_518168 ?auto_518173 ) ) ( not ( = ?auto_518168 ?auto_518174 ) ) ( not ( = ?auto_518168 ?auto_518175 ) ) ( not ( = ?auto_518168 ?auto_518176 ) ) ( not ( = ?auto_518169 ?auto_518170 ) ) ( not ( = ?auto_518169 ?auto_518171 ) ) ( not ( = ?auto_518169 ?auto_518172 ) ) ( not ( = ?auto_518169 ?auto_518173 ) ) ( not ( = ?auto_518169 ?auto_518174 ) ) ( not ( = ?auto_518169 ?auto_518175 ) ) ( not ( = ?auto_518169 ?auto_518176 ) ) ( not ( = ?auto_518170 ?auto_518171 ) ) ( not ( = ?auto_518170 ?auto_518172 ) ) ( not ( = ?auto_518170 ?auto_518173 ) ) ( not ( = ?auto_518170 ?auto_518174 ) ) ( not ( = ?auto_518170 ?auto_518175 ) ) ( not ( = ?auto_518170 ?auto_518176 ) ) ( not ( = ?auto_518171 ?auto_518172 ) ) ( not ( = ?auto_518171 ?auto_518173 ) ) ( not ( = ?auto_518171 ?auto_518174 ) ) ( not ( = ?auto_518171 ?auto_518175 ) ) ( not ( = ?auto_518171 ?auto_518176 ) ) ( not ( = ?auto_518172 ?auto_518173 ) ) ( not ( = ?auto_518172 ?auto_518174 ) ) ( not ( = ?auto_518172 ?auto_518175 ) ) ( not ( = ?auto_518172 ?auto_518176 ) ) ( not ( = ?auto_518173 ?auto_518174 ) ) ( not ( = ?auto_518173 ?auto_518175 ) ) ( not ( = ?auto_518173 ?auto_518176 ) ) ( not ( = ?auto_518174 ?auto_518175 ) ) ( not ( = ?auto_518174 ?auto_518176 ) ) ( not ( = ?auto_518175 ?auto_518176 ) ) ( ON ?auto_518174 ?auto_518175 ) ( ON ?auto_518173 ?auto_518174 ) ( ON ?auto_518172 ?auto_518173 ) ( ON ?auto_518171 ?auto_518172 ) ( CLEAR ?auto_518169 ) ( ON ?auto_518170 ?auto_518171 ) ( CLEAR ?auto_518170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_518163 ?auto_518164 ?auto_518165 ?auto_518166 ?auto_518167 ?auto_518168 ?auto_518169 ?auto_518170 )
      ( MAKE-13PILE ?auto_518163 ?auto_518164 ?auto_518165 ?auto_518166 ?auto_518167 ?auto_518168 ?auto_518169 ?auto_518170 ?auto_518171 ?auto_518172 ?auto_518173 ?auto_518174 ?auto_518175 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518217 - BLOCK
      ?auto_518218 - BLOCK
      ?auto_518219 - BLOCK
      ?auto_518220 - BLOCK
      ?auto_518221 - BLOCK
      ?auto_518222 - BLOCK
      ?auto_518223 - BLOCK
      ?auto_518224 - BLOCK
      ?auto_518225 - BLOCK
      ?auto_518226 - BLOCK
      ?auto_518227 - BLOCK
      ?auto_518228 - BLOCK
      ?auto_518229 - BLOCK
    )
    :vars
    (
      ?auto_518230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518229 ?auto_518230 ) ( ON-TABLE ?auto_518217 ) ( ON ?auto_518218 ?auto_518217 ) ( ON ?auto_518219 ?auto_518218 ) ( ON ?auto_518220 ?auto_518219 ) ( ON ?auto_518221 ?auto_518220 ) ( ON ?auto_518222 ?auto_518221 ) ( not ( = ?auto_518217 ?auto_518218 ) ) ( not ( = ?auto_518217 ?auto_518219 ) ) ( not ( = ?auto_518217 ?auto_518220 ) ) ( not ( = ?auto_518217 ?auto_518221 ) ) ( not ( = ?auto_518217 ?auto_518222 ) ) ( not ( = ?auto_518217 ?auto_518223 ) ) ( not ( = ?auto_518217 ?auto_518224 ) ) ( not ( = ?auto_518217 ?auto_518225 ) ) ( not ( = ?auto_518217 ?auto_518226 ) ) ( not ( = ?auto_518217 ?auto_518227 ) ) ( not ( = ?auto_518217 ?auto_518228 ) ) ( not ( = ?auto_518217 ?auto_518229 ) ) ( not ( = ?auto_518217 ?auto_518230 ) ) ( not ( = ?auto_518218 ?auto_518219 ) ) ( not ( = ?auto_518218 ?auto_518220 ) ) ( not ( = ?auto_518218 ?auto_518221 ) ) ( not ( = ?auto_518218 ?auto_518222 ) ) ( not ( = ?auto_518218 ?auto_518223 ) ) ( not ( = ?auto_518218 ?auto_518224 ) ) ( not ( = ?auto_518218 ?auto_518225 ) ) ( not ( = ?auto_518218 ?auto_518226 ) ) ( not ( = ?auto_518218 ?auto_518227 ) ) ( not ( = ?auto_518218 ?auto_518228 ) ) ( not ( = ?auto_518218 ?auto_518229 ) ) ( not ( = ?auto_518218 ?auto_518230 ) ) ( not ( = ?auto_518219 ?auto_518220 ) ) ( not ( = ?auto_518219 ?auto_518221 ) ) ( not ( = ?auto_518219 ?auto_518222 ) ) ( not ( = ?auto_518219 ?auto_518223 ) ) ( not ( = ?auto_518219 ?auto_518224 ) ) ( not ( = ?auto_518219 ?auto_518225 ) ) ( not ( = ?auto_518219 ?auto_518226 ) ) ( not ( = ?auto_518219 ?auto_518227 ) ) ( not ( = ?auto_518219 ?auto_518228 ) ) ( not ( = ?auto_518219 ?auto_518229 ) ) ( not ( = ?auto_518219 ?auto_518230 ) ) ( not ( = ?auto_518220 ?auto_518221 ) ) ( not ( = ?auto_518220 ?auto_518222 ) ) ( not ( = ?auto_518220 ?auto_518223 ) ) ( not ( = ?auto_518220 ?auto_518224 ) ) ( not ( = ?auto_518220 ?auto_518225 ) ) ( not ( = ?auto_518220 ?auto_518226 ) ) ( not ( = ?auto_518220 ?auto_518227 ) ) ( not ( = ?auto_518220 ?auto_518228 ) ) ( not ( = ?auto_518220 ?auto_518229 ) ) ( not ( = ?auto_518220 ?auto_518230 ) ) ( not ( = ?auto_518221 ?auto_518222 ) ) ( not ( = ?auto_518221 ?auto_518223 ) ) ( not ( = ?auto_518221 ?auto_518224 ) ) ( not ( = ?auto_518221 ?auto_518225 ) ) ( not ( = ?auto_518221 ?auto_518226 ) ) ( not ( = ?auto_518221 ?auto_518227 ) ) ( not ( = ?auto_518221 ?auto_518228 ) ) ( not ( = ?auto_518221 ?auto_518229 ) ) ( not ( = ?auto_518221 ?auto_518230 ) ) ( not ( = ?auto_518222 ?auto_518223 ) ) ( not ( = ?auto_518222 ?auto_518224 ) ) ( not ( = ?auto_518222 ?auto_518225 ) ) ( not ( = ?auto_518222 ?auto_518226 ) ) ( not ( = ?auto_518222 ?auto_518227 ) ) ( not ( = ?auto_518222 ?auto_518228 ) ) ( not ( = ?auto_518222 ?auto_518229 ) ) ( not ( = ?auto_518222 ?auto_518230 ) ) ( not ( = ?auto_518223 ?auto_518224 ) ) ( not ( = ?auto_518223 ?auto_518225 ) ) ( not ( = ?auto_518223 ?auto_518226 ) ) ( not ( = ?auto_518223 ?auto_518227 ) ) ( not ( = ?auto_518223 ?auto_518228 ) ) ( not ( = ?auto_518223 ?auto_518229 ) ) ( not ( = ?auto_518223 ?auto_518230 ) ) ( not ( = ?auto_518224 ?auto_518225 ) ) ( not ( = ?auto_518224 ?auto_518226 ) ) ( not ( = ?auto_518224 ?auto_518227 ) ) ( not ( = ?auto_518224 ?auto_518228 ) ) ( not ( = ?auto_518224 ?auto_518229 ) ) ( not ( = ?auto_518224 ?auto_518230 ) ) ( not ( = ?auto_518225 ?auto_518226 ) ) ( not ( = ?auto_518225 ?auto_518227 ) ) ( not ( = ?auto_518225 ?auto_518228 ) ) ( not ( = ?auto_518225 ?auto_518229 ) ) ( not ( = ?auto_518225 ?auto_518230 ) ) ( not ( = ?auto_518226 ?auto_518227 ) ) ( not ( = ?auto_518226 ?auto_518228 ) ) ( not ( = ?auto_518226 ?auto_518229 ) ) ( not ( = ?auto_518226 ?auto_518230 ) ) ( not ( = ?auto_518227 ?auto_518228 ) ) ( not ( = ?auto_518227 ?auto_518229 ) ) ( not ( = ?auto_518227 ?auto_518230 ) ) ( not ( = ?auto_518228 ?auto_518229 ) ) ( not ( = ?auto_518228 ?auto_518230 ) ) ( not ( = ?auto_518229 ?auto_518230 ) ) ( ON ?auto_518228 ?auto_518229 ) ( ON ?auto_518227 ?auto_518228 ) ( ON ?auto_518226 ?auto_518227 ) ( ON ?auto_518225 ?auto_518226 ) ( ON ?auto_518224 ?auto_518225 ) ( CLEAR ?auto_518222 ) ( ON ?auto_518223 ?auto_518224 ) ( CLEAR ?auto_518223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_518217 ?auto_518218 ?auto_518219 ?auto_518220 ?auto_518221 ?auto_518222 ?auto_518223 )
      ( MAKE-13PILE ?auto_518217 ?auto_518218 ?auto_518219 ?auto_518220 ?auto_518221 ?auto_518222 ?auto_518223 ?auto_518224 ?auto_518225 ?auto_518226 ?auto_518227 ?auto_518228 ?auto_518229 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518271 - BLOCK
      ?auto_518272 - BLOCK
      ?auto_518273 - BLOCK
      ?auto_518274 - BLOCK
      ?auto_518275 - BLOCK
      ?auto_518276 - BLOCK
      ?auto_518277 - BLOCK
      ?auto_518278 - BLOCK
      ?auto_518279 - BLOCK
      ?auto_518280 - BLOCK
      ?auto_518281 - BLOCK
      ?auto_518282 - BLOCK
      ?auto_518283 - BLOCK
    )
    :vars
    (
      ?auto_518284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518283 ?auto_518284 ) ( ON-TABLE ?auto_518271 ) ( ON ?auto_518272 ?auto_518271 ) ( ON ?auto_518273 ?auto_518272 ) ( ON ?auto_518274 ?auto_518273 ) ( ON ?auto_518275 ?auto_518274 ) ( not ( = ?auto_518271 ?auto_518272 ) ) ( not ( = ?auto_518271 ?auto_518273 ) ) ( not ( = ?auto_518271 ?auto_518274 ) ) ( not ( = ?auto_518271 ?auto_518275 ) ) ( not ( = ?auto_518271 ?auto_518276 ) ) ( not ( = ?auto_518271 ?auto_518277 ) ) ( not ( = ?auto_518271 ?auto_518278 ) ) ( not ( = ?auto_518271 ?auto_518279 ) ) ( not ( = ?auto_518271 ?auto_518280 ) ) ( not ( = ?auto_518271 ?auto_518281 ) ) ( not ( = ?auto_518271 ?auto_518282 ) ) ( not ( = ?auto_518271 ?auto_518283 ) ) ( not ( = ?auto_518271 ?auto_518284 ) ) ( not ( = ?auto_518272 ?auto_518273 ) ) ( not ( = ?auto_518272 ?auto_518274 ) ) ( not ( = ?auto_518272 ?auto_518275 ) ) ( not ( = ?auto_518272 ?auto_518276 ) ) ( not ( = ?auto_518272 ?auto_518277 ) ) ( not ( = ?auto_518272 ?auto_518278 ) ) ( not ( = ?auto_518272 ?auto_518279 ) ) ( not ( = ?auto_518272 ?auto_518280 ) ) ( not ( = ?auto_518272 ?auto_518281 ) ) ( not ( = ?auto_518272 ?auto_518282 ) ) ( not ( = ?auto_518272 ?auto_518283 ) ) ( not ( = ?auto_518272 ?auto_518284 ) ) ( not ( = ?auto_518273 ?auto_518274 ) ) ( not ( = ?auto_518273 ?auto_518275 ) ) ( not ( = ?auto_518273 ?auto_518276 ) ) ( not ( = ?auto_518273 ?auto_518277 ) ) ( not ( = ?auto_518273 ?auto_518278 ) ) ( not ( = ?auto_518273 ?auto_518279 ) ) ( not ( = ?auto_518273 ?auto_518280 ) ) ( not ( = ?auto_518273 ?auto_518281 ) ) ( not ( = ?auto_518273 ?auto_518282 ) ) ( not ( = ?auto_518273 ?auto_518283 ) ) ( not ( = ?auto_518273 ?auto_518284 ) ) ( not ( = ?auto_518274 ?auto_518275 ) ) ( not ( = ?auto_518274 ?auto_518276 ) ) ( not ( = ?auto_518274 ?auto_518277 ) ) ( not ( = ?auto_518274 ?auto_518278 ) ) ( not ( = ?auto_518274 ?auto_518279 ) ) ( not ( = ?auto_518274 ?auto_518280 ) ) ( not ( = ?auto_518274 ?auto_518281 ) ) ( not ( = ?auto_518274 ?auto_518282 ) ) ( not ( = ?auto_518274 ?auto_518283 ) ) ( not ( = ?auto_518274 ?auto_518284 ) ) ( not ( = ?auto_518275 ?auto_518276 ) ) ( not ( = ?auto_518275 ?auto_518277 ) ) ( not ( = ?auto_518275 ?auto_518278 ) ) ( not ( = ?auto_518275 ?auto_518279 ) ) ( not ( = ?auto_518275 ?auto_518280 ) ) ( not ( = ?auto_518275 ?auto_518281 ) ) ( not ( = ?auto_518275 ?auto_518282 ) ) ( not ( = ?auto_518275 ?auto_518283 ) ) ( not ( = ?auto_518275 ?auto_518284 ) ) ( not ( = ?auto_518276 ?auto_518277 ) ) ( not ( = ?auto_518276 ?auto_518278 ) ) ( not ( = ?auto_518276 ?auto_518279 ) ) ( not ( = ?auto_518276 ?auto_518280 ) ) ( not ( = ?auto_518276 ?auto_518281 ) ) ( not ( = ?auto_518276 ?auto_518282 ) ) ( not ( = ?auto_518276 ?auto_518283 ) ) ( not ( = ?auto_518276 ?auto_518284 ) ) ( not ( = ?auto_518277 ?auto_518278 ) ) ( not ( = ?auto_518277 ?auto_518279 ) ) ( not ( = ?auto_518277 ?auto_518280 ) ) ( not ( = ?auto_518277 ?auto_518281 ) ) ( not ( = ?auto_518277 ?auto_518282 ) ) ( not ( = ?auto_518277 ?auto_518283 ) ) ( not ( = ?auto_518277 ?auto_518284 ) ) ( not ( = ?auto_518278 ?auto_518279 ) ) ( not ( = ?auto_518278 ?auto_518280 ) ) ( not ( = ?auto_518278 ?auto_518281 ) ) ( not ( = ?auto_518278 ?auto_518282 ) ) ( not ( = ?auto_518278 ?auto_518283 ) ) ( not ( = ?auto_518278 ?auto_518284 ) ) ( not ( = ?auto_518279 ?auto_518280 ) ) ( not ( = ?auto_518279 ?auto_518281 ) ) ( not ( = ?auto_518279 ?auto_518282 ) ) ( not ( = ?auto_518279 ?auto_518283 ) ) ( not ( = ?auto_518279 ?auto_518284 ) ) ( not ( = ?auto_518280 ?auto_518281 ) ) ( not ( = ?auto_518280 ?auto_518282 ) ) ( not ( = ?auto_518280 ?auto_518283 ) ) ( not ( = ?auto_518280 ?auto_518284 ) ) ( not ( = ?auto_518281 ?auto_518282 ) ) ( not ( = ?auto_518281 ?auto_518283 ) ) ( not ( = ?auto_518281 ?auto_518284 ) ) ( not ( = ?auto_518282 ?auto_518283 ) ) ( not ( = ?auto_518282 ?auto_518284 ) ) ( not ( = ?auto_518283 ?auto_518284 ) ) ( ON ?auto_518282 ?auto_518283 ) ( ON ?auto_518281 ?auto_518282 ) ( ON ?auto_518280 ?auto_518281 ) ( ON ?auto_518279 ?auto_518280 ) ( ON ?auto_518278 ?auto_518279 ) ( ON ?auto_518277 ?auto_518278 ) ( CLEAR ?auto_518275 ) ( ON ?auto_518276 ?auto_518277 ) ( CLEAR ?auto_518276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_518271 ?auto_518272 ?auto_518273 ?auto_518274 ?auto_518275 ?auto_518276 )
      ( MAKE-13PILE ?auto_518271 ?auto_518272 ?auto_518273 ?auto_518274 ?auto_518275 ?auto_518276 ?auto_518277 ?auto_518278 ?auto_518279 ?auto_518280 ?auto_518281 ?auto_518282 ?auto_518283 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518325 - BLOCK
      ?auto_518326 - BLOCK
      ?auto_518327 - BLOCK
      ?auto_518328 - BLOCK
      ?auto_518329 - BLOCK
      ?auto_518330 - BLOCK
      ?auto_518331 - BLOCK
      ?auto_518332 - BLOCK
      ?auto_518333 - BLOCK
      ?auto_518334 - BLOCK
      ?auto_518335 - BLOCK
      ?auto_518336 - BLOCK
      ?auto_518337 - BLOCK
    )
    :vars
    (
      ?auto_518338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518337 ?auto_518338 ) ( ON-TABLE ?auto_518325 ) ( ON ?auto_518326 ?auto_518325 ) ( ON ?auto_518327 ?auto_518326 ) ( ON ?auto_518328 ?auto_518327 ) ( not ( = ?auto_518325 ?auto_518326 ) ) ( not ( = ?auto_518325 ?auto_518327 ) ) ( not ( = ?auto_518325 ?auto_518328 ) ) ( not ( = ?auto_518325 ?auto_518329 ) ) ( not ( = ?auto_518325 ?auto_518330 ) ) ( not ( = ?auto_518325 ?auto_518331 ) ) ( not ( = ?auto_518325 ?auto_518332 ) ) ( not ( = ?auto_518325 ?auto_518333 ) ) ( not ( = ?auto_518325 ?auto_518334 ) ) ( not ( = ?auto_518325 ?auto_518335 ) ) ( not ( = ?auto_518325 ?auto_518336 ) ) ( not ( = ?auto_518325 ?auto_518337 ) ) ( not ( = ?auto_518325 ?auto_518338 ) ) ( not ( = ?auto_518326 ?auto_518327 ) ) ( not ( = ?auto_518326 ?auto_518328 ) ) ( not ( = ?auto_518326 ?auto_518329 ) ) ( not ( = ?auto_518326 ?auto_518330 ) ) ( not ( = ?auto_518326 ?auto_518331 ) ) ( not ( = ?auto_518326 ?auto_518332 ) ) ( not ( = ?auto_518326 ?auto_518333 ) ) ( not ( = ?auto_518326 ?auto_518334 ) ) ( not ( = ?auto_518326 ?auto_518335 ) ) ( not ( = ?auto_518326 ?auto_518336 ) ) ( not ( = ?auto_518326 ?auto_518337 ) ) ( not ( = ?auto_518326 ?auto_518338 ) ) ( not ( = ?auto_518327 ?auto_518328 ) ) ( not ( = ?auto_518327 ?auto_518329 ) ) ( not ( = ?auto_518327 ?auto_518330 ) ) ( not ( = ?auto_518327 ?auto_518331 ) ) ( not ( = ?auto_518327 ?auto_518332 ) ) ( not ( = ?auto_518327 ?auto_518333 ) ) ( not ( = ?auto_518327 ?auto_518334 ) ) ( not ( = ?auto_518327 ?auto_518335 ) ) ( not ( = ?auto_518327 ?auto_518336 ) ) ( not ( = ?auto_518327 ?auto_518337 ) ) ( not ( = ?auto_518327 ?auto_518338 ) ) ( not ( = ?auto_518328 ?auto_518329 ) ) ( not ( = ?auto_518328 ?auto_518330 ) ) ( not ( = ?auto_518328 ?auto_518331 ) ) ( not ( = ?auto_518328 ?auto_518332 ) ) ( not ( = ?auto_518328 ?auto_518333 ) ) ( not ( = ?auto_518328 ?auto_518334 ) ) ( not ( = ?auto_518328 ?auto_518335 ) ) ( not ( = ?auto_518328 ?auto_518336 ) ) ( not ( = ?auto_518328 ?auto_518337 ) ) ( not ( = ?auto_518328 ?auto_518338 ) ) ( not ( = ?auto_518329 ?auto_518330 ) ) ( not ( = ?auto_518329 ?auto_518331 ) ) ( not ( = ?auto_518329 ?auto_518332 ) ) ( not ( = ?auto_518329 ?auto_518333 ) ) ( not ( = ?auto_518329 ?auto_518334 ) ) ( not ( = ?auto_518329 ?auto_518335 ) ) ( not ( = ?auto_518329 ?auto_518336 ) ) ( not ( = ?auto_518329 ?auto_518337 ) ) ( not ( = ?auto_518329 ?auto_518338 ) ) ( not ( = ?auto_518330 ?auto_518331 ) ) ( not ( = ?auto_518330 ?auto_518332 ) ) ( not ( = ?auto_518330 ?auto_518333 ) ) ( not ( = ?auto_518330 ?auto_518334 ) ) ( not ( = ?auto_518330 ?auto_518335 ) ) ( not ( = ?auto_518330 ?auto_518336 ) ) ( not ( = ?auto_518330 ?auto_518337 ) ) ( not ( = ?auto_518330 ?auto_518338 ) ) ( not ( = ?auto_518331 ?auto_518332 ) ) ( not ( = ?auto_518331 ?auto_518333 ) ) ( not ( = ?auto_518331 ?auto_518334 ) ) ( not ( = ?auto_518331 ?auto_518335 ) ) ( not ( = ?auto_518331 ?auto_518336 ) ) ( not ( = ?auto_518331 ?auto_518337 ) ) ( not ( = ?auto_518331 ?auto_518338 ) ) ( not ( = ?auto_518332 ?auto_518333 ) ) ( not ( = ?auto_518332 ?auto_518334 ) ) ( not ( = ?auto_518332 ?auto_518335 ) ) ( not ( = ?auto_518332 ?auto_518336 ) ) ( not ( = ?auto_518332 ?auto_518337 ) ) ( not ( = ?auto_518332 ?auto_518338 ) ) ( not ( = ?auto_518333 ?auto_518334 ) ) ( not ( = ?auto_518333 ?auto_518335 ) ) ( not ( = ?auto_518333 ?auto_518336 ) ) ( not ( = ?auto_518333 ?auto_518337 ) ) ( not ( = ?auto_518333 ?auto_518338 ) ) ( not ( = ?auto_518334 ?auto_518335 ) ) ( not ( = ?auto_518334 ?auto_518336 ) ) ( not ( = ?auto_518334 ?auto_518337 ) ) ( not ( = ?auto_518334 ?auto_518338 ) ) ( not ( = ?auto_518335 ?auto_518336 ) ) ( not ( = ?auto_518335 ?auto_518337 ) ) ( not ( = ?auto_518335 ?auto_518338 ) ) ( not ( = ?auto_518336 ?auto_518337 ) ) ( not ( = ?auto_518336 ?auto_518338 ) ) ( not ( = ?auto_518337 ?auto_518338 ) ) ( ON ?auto_518336 ?auto_518337 ) ( ON ?auto_518335 ?auto_518336 ) ( ON ?auto_518334 ?auto_518335 ) ( ON ?auto_518333 ?auto_518334 ) ( ON ?auto_518332 ?auto_518333 ) ( ON ?auto_518331 ?auto_518332 ) ( ON ?auto_518330 ?auto_518331 ) ( CLEAR ?auto_518328 ) ( ON ?auto_518329 ?auto_518330 ) ( CLEAR ?auto_518329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_518325 ?auto_518326 ?auto_518327 ?auto_518328 ?auto_518329 )
      ( MAKE-13PILE ?auto_518325 ?auto_518326 ?auto_518327 ?auto_518328 ?auto_518329 ?auto_518330 ?auto_518331 ?auto_518332 ?auto_518333 ?auto_518334 ?auto_518335 ?auto_518336 ?auto_518337 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518379 - BLOCK
      ?auto_518380 - BLOCK
      ?auto_518381 - BLOCK
      ?auto_518382 - BLOCK
      ?auto_518383 - BLOCK
      ?auto_518384 - BLOCK
      ?auto_518385 - BLOCK
      ?auto_518386 - BLOCK
      ?auto_518387 - BLOCK
      ?auto_518388 - BLOCK
      ?auto_518389 - BLOCK
      ?auto_518390 - BLOCK
      ?auto_518391 - BLOCK
    )
    :vars
    (
      ?auto_518392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518391 ?auto_518392 ) ( ON-TABLE ?auto_518379 ) ( ON ?auto_518380 ?auto_518379 ) ( ON ?auto_518381 ?auto_518380 ) ( not ( = ?auto_518379 ?auto_518380 ) ) ( not ( = ?auto_518379 ?auto_518381 ) ) ( not ( = ?auto_518379 ?auto_518382 ) ) ( not ( = ?auto_518379 ?auto_518383 ) ) ( not ( = ?auto_518379 ?auto_518384 ) ) ( not ( = ?auto_518379 ?auto_518385 ) ) ( not ( = ?auto_518379 ?auto_518386 ) ) ( not ( = ?auto_518379 ?auto_518387 ) ) ( not ( = ?auto_518379 ?auto_518388 ) ) ( not ( = ?auto_518379 ?auto_518389 ) ) ( not ( = ?auto_518379 ?auto_518390 ) ) ( not ( = ?auto_518379 ?auto_518391 ) ) ( not ( = ?auto_518379 ?auto_518392 ) ) ( not ( = ?auto_518380 ?auto_518381 ) ) ( not ( = ?auto_518380 ?auto_518382 ) ) ( not ( = ?auto_518380 ?auto_518383 ) ) ( not ( = ?auto_518380 ?auto_518384 ) ) ( not ( = ?auto_518380 ?auto_518385 ) ) ( not ( = ?auto_518380 ?auto_518386 ) ) ( not ( = ?auto_518380 ?auto_518387 ) ) ( not ( = ?auto_518380 ?auto_518388 ) ) ( not ( = ?auto_518380 ?auto_518389 ) ) ( not ( = ?auto_518380 ?auto_518390 ) ) ( not ( = ?auto_518380 ?auto_518391 ) ) ( not ( = ?auto_518380 ?auto_518392 ) ) ( not ( = ?auto_518381 ?auto_518382 ) ) ( not ( = ?auto_518381 ?auto_518383 ) ) ( not ( = ?auto_518381 ?auto_518384 ) ) ( not ( = ?auto_518381 ?auto_518385 ) ) ( not ( = ?auto_518381 ?auto_518386 ) ) ( not ( = ?auto_518381 ?auto_518387 ) ) ( not ( = ?auto_518381 ?auto_518388 ) ) ( not ( = ?auto_518381 ?auto_518389 ) ) ( not ( = ?auto_518381 ?auto_518390 ) ) ( not ( = ?auto_518381 ?auto_518391 ) ) ( not ( = ?auto_518381 ?auto_518392 ) ) ( not ( = ?auto_518382 ?auto_518383 ) ) ( not ( = ?auto_518382 ?auto_518384 ) ) ( not ( = ?auto_518382 ?auto_518385 ) ) ( not ( = ?auto_518382 ?auto_518386 ) ) ( not ( = ?auto_518382 ?auto_518387 ) ) ( not ( = ?auto_518382 ?auto_518388 ) ) ( not ( = ?auto_518382 ?auto_518389 ) ) ( not ( = ?auto_518382 ?auto_518390 ) ) ( not ( = ?auto_518382 ?auto_518391 ) ) ( not ( = ?auto_518382 ?auto_518392 ) ) ( not ( = ?auto_518383 ?auto_518384 ) ) ( not ( = ?auto_518383 ?auto_518385 ) ) ( not ( = ?auto_518383 ?auto_518386 ) ) ( not ( = ?auto_518383 ?auto_518387 ) ) ( not ( = ?auto_518383 ?auto_518388 ) ) ( not ( = ?auto_518383 ?auto_518389 ) ) ( not ( = ?auto_518383 ?auto_518390 ) ) ( not ( = ?auto_518383 ?auto_518391 ) ) ( not ( = ?auto_518383 ?auto_518392 ) ) ( not ( = ?auto_518384 ?auto_518385 ) ) ( not ( = ?auto_518384 ?auto_518386 ) ) ( not ( = ?auto_518384 ?auto_518387 ) ) ( not ( = ?auto_518384 ?auto_518388 ) ) ( not ( = ?auto_518384 ?auto_518389 ) ) ( not ( = ?auto_518384 ?auto_518390 ) ) ( not ( = ?auto_518384 ?auto_518391 ) ) ( not ( = ?auto_518384 ?auto_518392 ) ) ( not ( = ?auto_518385 ?auto_518386 ) ) ( not ( = ?auto_518385 ?auto_518387 ) ) ( not ( = ?auto_518385 ?auto_518388 ) ) ( not ( = ?auto_518385 ?auto_518389 ) ) ( not ( = ?auto_518385 ?auto_518390 ) ) ( not ( = ?auto_518385 ?auto_518391 ) ) ( not ( = ?auto_518385 ?auto_518392 ) ) ( not ( = ?auto_518386 ?auto_518387 ) ) ( not ( = ?auto_518386 ?auto_518388 ) ) ( not ( = ?auto_518386 ?auto_518389 ) ) ( not ( = ?auto_518386 ?auto_518390 ) ) ( not ( = ?auto_518386 ?auto_518391 ) ) ( not ( = ?auto_518386 ?auto_518392 ) ) ( not ( = ?auto_518387 ?auto_518388 ) ) ( not ( = ?auto_518387 ?auto_518389 ) ) ( not ( = ?auto_518387 ?auto_518390 ) ) ( not ( = ?auto_518387 ?auto_518391 ) ) ( not ( = ?auto_518387 ?auto_518392 ) ) ( not ( = ?auto_518388 ?auto_518389 ) ) ( not ( = ?auto_518388 ?auto_518390 ) ) ( not ( = ?auto_518388 ?auto_518391 ) ) ( not ( = ?auto_518388 ?auto_518392 ) ) ( not ( = ?auto_518389 ?auto_518390 ) ) ( not ( = ?auto_518389 ?auto_518391 ) ) ( not ( = ?auto_518389 ?auto_518392 ) ) ( not ( = ?auto_518390 ?auto_518391 ) ) ( not ( = ?auto_518390 ?auto_518392 ) ) ( not ( = ?auto_518391 ?auto_518392 ) ) ( ON ?auto_518390 ?auto_518391 ) ( ON ?auto_518389 ?auto_518390 ) ( ON ?auto_518388 ?auto_518389 ) ( ON ?auto_518387 ?auto_518388 ) ( ON ?auto_518386 ?auto_518387 ) ( ON ?auto_518385 ?auto_518386 ) ( ON ?auto_518384 ?auto_518385 ) ( ON ?auto_518383 ?auto_518384 ) ( CLEAR ?auto_518381 ) ( ON ?auto_518382 ?auto_518383 ) ( CLEAR ?auto_518382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_518379 ?auto_518380 ?auto_518381 ?auto_518382 )
      ( MAKE-13PILE ?auto_518379 ?auto_518380 ?auto_518381 ?auto_518382 ?auto_518383 ?auto_518384 ?auto_518385 ?auto_518386 ?auto_518387 ?auto_518388 ?auto_518389 ?auto_518390 ?auto_518391 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518433 - BLOCK
      ?auto_518434 - BLOCK
      ?auto_518435 - BLOCK
      ?auto_518436 - BLOCK
      ?auto_518437 - BLOCK
      ?auto_518438 - BLOCK
      ?auto_518439 - BLOCK
      ?auto_518440 - BLOCK
      ?auto_518441 - BLOCK
      ?auto_518442 - BLOCK
      ?auto_518443 - BLOCK
      ?auto_518444 - BLOCK
      ?auto_518445 - BLOCK
    )
    :vars
    (
      ?auto_518446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518445 ?auto_518446 ) ( ON-TABLE ?auto_518433 ) ( ON ?auto_518434 ?auto_518433 ) ( not ( = ?auto_518433 ?auto_518434 ) ) ( not ( = ?auto_518433 ?auto_518435 ) ) ( not ( = ?auto_518433 ?auto_518436 ) ) ( not ( = ?auto_518433 ?auto_518437 ) ) ( not ( = ?auto_518433 ?auto_518438 ) ) ( not ( = ?auto_518433 ?auto_518439 ) ) ( not ( = ?auto_518433 ?auto_518440 ) ) ( not ( = ?auto_518433 ?auto_518441 ) ) ( not ( = ?auto_518433 ?auto_518442 ) ) ( not ( = ?auto_518433 ?auto_518443 ) ) ( not ( = ?auto_518433 ?auto_518444 ) ) ( not ( = ?auto_518433 ?auto_518445 ) ) ( not ( = ?auto_518433 ?auto_518446 ) ) ( not ( = ?auto_518434 ?auto_518435 ) ) ( not ( = ?auto_518434 ?auto_518436 ) ) ( not ( = ?auto_518434 ?auto_518437 ) ) ( not ( = ?auto_518434 ?auto_518438 ) ) ( not ( = ?auto_518434 ?auto_518439 ) ) ( not ( = ?auto_518434 ?auto_518440 ) ) ( not ( = ?auto_518434 ?auto_518441 ) ) ( not ( = ?auto_518434 ?auto_518442 ) ) ( not ( = ?auto_518434 ?auto_518443 ) ) ( not ( = ?auto_518434 ?auto_518444 ) ) ( not ( = ?auto_518434 ?auto_518445 ) ) ( not ( = ?auto_518434 ?auto_518446 ) ) ( not ( = ?auto_518435 ?auto_518436 ) ) ( not ( = ?auto_518435 ?auto_518437 ) ) ( not ( = ?auto_518435 ?auto_518438 ) ) ( not ( = ?auto_518435 ?auto_518439 ) ) ( not ( = ?auto_518435 ?auto_518440 ) ) ( not ( = ?auto_518435 ?auto_518441 ) ) ( not ( = ?auto_518435 ?auto_518442 ) ) ( not ( = ?auto_518435 ?auto_518443 ) ) ( not ( = ?auto_518435 ?auto_518444 ) ) ( not ( = ?auto_518435 ?auto_518445 ) ) ( not ( = ?auto_518435 ?auto_518446 ) ) ( not ( = ?auto_518436 ?auto_518437 ) ) ( not ( = ?auto_518436 ?auto_518438 ) ) ( not ( = ?auto_518436 ?auto_518439 ) ) ( not ( = ?auto_518436 ?auto_518440 ) ) ( not ( = ?auto_518436 ?auto_518441 ) ) ( not ( = ?auto_518436 ?auto_518442 ) ) ( not ( = ?auto_518436 ?auto_518443 ) ) ( not ( = ?auto_518436 ?auto_518444 ) ) ( not ( = ?auto_518436 ?auto_518445 ) ) ( not ( = ?auto_518436 ?auto_518446 ) ) ( not ( = ?auto_518437 ?auto_518438 ) ) ( not ( = ?auto_518437 ?auto_518439 ) ) ( not ( = ?auto_518437 ?auto_518440 ) ) ( not ( = ?auto_518437 ?auto_518441 ) ) ( not ( = ?auto_518437 ?auto_518442 ) ) ( not ( = ?auto_518437 ?auto_518443 ) ) ( not ( = ?auto_518437 ?auto_518444 ) ) ( not ( = ?auto_518437 ?auto_518445 ) ) ( not ( = ?auto_518437 ?auto_518446 ) ) ( not ( = ?auto_518438 ?auto_518439 ) ) ( not ( = ?auto_518438 ?auto_518440 ) ) ( not ( = ?auto_518438 ?auto_518441 ) ) ( not ( = ?auto_518438 ?auto_518442 ) ) ( not ( = ?auto_518438 ?auto_518443 ) ) ( not ( = ?auto_518438 ?auto_518444 ) ) ( not ( = ?auto_518438 ?auto_518445 ) ) ( not ( = ?auto_518438 ?auto_518446 ) ) ( not ( = ?auto_518439 ?auto_518440 ) ) ( not ( = ?auto_518439 ?auto_518441 ) ) ( not ( = ?auto_518439 ?auto_518442 ) ) ( not ( = ?auto_518439 ?auto_518443 ) ) ( not ( = ?auto_518439 ?auto_518444 ) ) ( not ( = ?auto_518439 ?auto_518445 ) ) ( not ( = ?auto_518439 ?auto_518446 ) ) ( not ( = ?auto_518440 ?auto_518441 ) ) ( not ( = ?auto_518440 ?auto_518442 ) ) ( not ( = ?auto_518440 ?auto_518443 ) ) ( not ( = ?auto_518440 ?auto_518444 ) ) ( not ( = ?auto_518440 ?auto_518445 ) ) ( not ( = ?auto_518440 ?auto_518446 ) ) ( not ( = ?auto_518441 ?auto_518442 ) ) ( not ( = ?auto_518441 ?auto_518443 ) ) ( not ( = ?auto_518441 ?auto_518444 ) ) ( not ( = ?auto_518441 ?auto_518445 ) ) ( not ( = ?auto_518441 ?auto_518446 ) ) ( not ( = ?auto_518442 ?auto_518443 ) ) ( not ( = ?auto_518442 ?auto_518444 ) ) ( not ( = ?auto_518442 ?auto_518445 ) ) ( not ( = ?auto_518442 ?auto_518446 ) ) ( not ( = ?auto_518443 ?auto_518444 ) ) ( not ( = ?auto_518443 ?auto_518445 ) ) ( not ( = ?auto_518443 ?auto_518446 ) ) ( not ( = ?auto_518444 ?auto_518445 ) ) ( not ( = ?auto_518444 ?auto_518446 ) ) ( not ( = ?auto_518445 ?auto_518446 ) ) ( ON ?auto_518444 ?auto_518445 ) ( ON ?auto_518443 ?auto_518444 ) ( ON ?auto_518442 ?auto_518443 ) ( ON ?auto_518441 ?auto_518442 ) ( ON ?auto_518440 ?auto_518441 ) ( ON ?auto_518439 ?auto_518440 ) ( ON ?auto_518438 ?auto_518439 ) ( ON ?auto_518437 ?auto_518438 ) ( ON ?auto_518436 ?auto_518437 ) ( CLEAR ?auto_518434 ) ( ON ?auto_518435 ?auto_518436 ) ( CLEAR ?auto_518435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_518433 ?auto_518434 ?auto_518435 )
      ( MAKE-13PILE ?auto_518433 ?auto_518434 ?auto_518435 ?auto_518436 ?auto_518437 ?auto_518438 ?auto_518439 ?auto_518440 ?auto_518441 ?auto_518442 ?auto_518443 ?auto_518444 ?auto_518445 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518487 - BLOCK
      ?auto_518488 - BLOCK
      ?auto_518489 - BLOCK
      ?auto_518490 - BLOCK
      ?auto_518491 - BLOCK
      ?auto_518492 - BLOCK
      ?auto_518493 - BLOCK
      ?auto_518494 - BLOCK
      ?auto_518495 - BLOCK
      ?auto_518496 - BLOCK
      ?auto_518497 - BLOCK
      ?auto_518498 - BLOCK
      ?auto_518499 - BLOCK
    )
    :vars
    (
      ?auto_518500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518499 ?auto_518500 ) ( ON-TABLE ?auto_518487 ) ( not ( = ?auto_518487 ?auto_518488 ) ) ( not ( = ?auto_518487 ?auto_518489 ) ) ( not ( = ?auto_518487 ?auto_518490 ) ) ( not ( = ?auto_518487 ?auto_518491 ) ) ( not ( = ?auto_518487 ?auto_518492 ) ) ( not ( = ?auto_518487 ?auto_518493 ) ) ( not ( = ?auto_518487 ?auto_518494 ) ) ( not ( = ?auto_518487 ?auto_518495 ) ) ( not ( = ?auto_518487 ?auto_518496 ) ) ( not ( = ?auto_518487 ?auto_518497 ) ) ( not ( = ?auto_518487 ?auto_518498 ) ) ( not ( = ?auto_518487 ?auto_518499 ) ) ( not ( = ?auto_518487 ?auto_518500 ) ) ( not ( = ?auto_518488 ?auto_518489 ) ) ( not ( = ?auto_518488 ?auto_518490 ) ) ( not ( = ?auto_518488 ?auto_518491 ) ) ( not ( = ?auto_518488 ?auto_518492 ) ) ( not ( = ?auto_518488 ?auto_518493 ) ) ( not ( = ?auto_518488 ?auto_518494 ) ) ( not ( = ?auto_518488 ?auto_518495 ) ) ( not ( = ?auto_518488 ?auto_518496 ) ) ( not ( = ?auto_518488 ?auto_518497 ) ) ( not ( = ?auto_518488 ?auto_518498 ) ) ( not ( = ?auto_518488 ?auto_518499 ) ) ( not ( = ?auto_518488 ?auto_518500 ) ) ( not ( = ?auto_518489 ?auto_518490 ) ) ( not ( = ?auto_518489 ?auto_518491 ) ) ( not ( = ?auto_518489 ?auto_518492 ) ) ( not ( = ?auto_518489 ?auto_518493 ) ) ( not ( = ?auto_518489 ?auto_518494 ) ) ( not ( = ?auto_518489 ?auto_518495 ) ) ( not ( = ?auto_518489 ?auto_518496 ) ) ( not ( = ?auto_518489 ?auto_518497 ) ) ( not ( = ?auto_518489 ?auto_518498 ) ) ( not ( = ?auto_518489 ?auto_518499 ) ) ( not ( = ?auto_518489 ?auto_518500 ) ) ( not ( = ?auto_518490 ?auto_518491 ) ) ( not ( = ?auto_518490 ?auto_518492 ) ) ( not ( = ?auto_518490 ?auto_518493 ) ) ( not ( = ?auto_518490 ?auto_518494 ) ) ( not ( = ?auto_518490 ?auto_518495 ) ) ( not ( = ?auto_518490 ?auto_518496 ) ) ( not ( = ?auto_518490 ?auto_518497 ) ) ( not ( = ?auto_518490 ?auto_518498 ) ) ( not ( = ?auto_518490 ?auto_518499 ) ) ( not ( = ?auto_518490 ?auto_518500 ) ) ( not ( = ?auto_518491 ?auto_518492 ) ) ( not ( = ?auto_518491 ?auto_518493 ) ) ( not ( = ?auto_518491 ?auto_518494 ) ) ( not ( = ?auto_518491 ?auto_518495 ) ) ( not ( = ?auto_518491 ?auto_518496 ) ) ( not ( = ?auto_518491 ?auto_518497 ) ) ( not ( = ?auto_518491 ?auto_518498 ) ) ( not ( = ?auto_518491 ?auto_518499 ) ) ( not ( = ?auto_518491 ?auto_518500 ) ) ( not ( = ?auto_518492 ?auto_518493 ) ) ( not ( = ?auto_518492 ?auto_518494 ) ) ( not ( = ?auto_518492 ?auto_518495 ) ) ( not ( = ?auto_518492 ?auto_518496 ) ) ( not ( = ?auto_518492 ?auto_518497 ) ) ( not ( = ?auto_518492 ?auto_518498 ) ) ( not ( = ?auto_518492 ?auto_518499 ) ) ( not ( = ?auto_518492 ?auto_518500 ) ) ( not ( = ?auto_518493 ?auto_518494 ) ) ( not ( = ?auto_518493 ?auto_518495 ) ) ( not ( = ?auto_518493 ?auto_518496 ) ) ( not ( = ?auto_518493 ?auto_518497 ) ) ( not ( = ?auto_518493 ?auto_518498 ) ) ( not ( = ?auto_518493 ?auto_518499 ) ) ( not ( = ?auto_518493 ?auto_518500 ) ) ( not ( = ?auto_518494 ?auto_518495 ) ) ( not ( = ?auto_518494 ?auto_518496 ) ) ( not ( = ?auto_518494 ?auto_518497 ) ) ( not ( = ?auto_518494 ?auto_518498 ) ) ( not ( = ?auto_518494 ?auto_518499 ) ) ( not ( = ?auto_518494 ?auto_518500 ) ) ( not ( = ?auto_518495 ?auto_518496 ) ) ( not ( = ?auto_518495 ?auto_518497 ) ) ( not ( = ?auto_518495 ?auto_518498 ) ) ( not ( = ?auto_518495 ?auto_518499 ) ) ( not ( = ?auto_518495 ?auto_518500 ) ) ( not ( = ?auto_518496 ?auto_518497 ) ) ( not ( = ?auto_518496 ?auto_518498 ) ) ( not ( = ?auto_518496 ?auto_518499 ) ) ( not ( = ?auto_518496 ?auto_518500 ) ) ( not ( = ?auto_518497 ?auto_518498 ) ) ( not ( = ?auto_518497 ?auto_518499 ) ) ( not ( = ?auto_518497 ?auto_518500 ) ) ( not ( = ?auto_518498 ?auto_518499 ) ) ( not ( = ?auto_518498 ?auto_518500 ) ) ( not ( = ?auto_518499 ?auto_518500 ) ) ( ON ?auto_518498 ?auto_518499 ) ( ON ?auto_518497 ?auto_518498 ) ( ON ?auto_518496 ?auto_518497 ) ( ON ?auto_518495 ?auto_518496 ) ( ON ?auto_518494 ?auto_518495 ) ( ON ?auto_518493 ?auto_518494 ) ( ON ?auto_518492 ?auto_518493 ) ( ON ?auto_518491 ?auto_518492 ) ( ON ?auto_518490 ?auto_518491 ) ( ON ?auto_518489 ?auto_518490 ) ( CLEAR ?auto_518487 ) ( ON ?auto_518488 ?auto_518489 ) ( CLEAR ?auto_518488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_518487 ?auto_518488 )
      ( MAKE-13PILE ?auto_518487 ?auto_518488 ?auto_518489 ?auto_518490 ?auto_518491 ?auto_518492 ?auto_518493 ?auto_518494 ?auto_518495 ?auto_518496 ?auto_518497 ?auto_518498 ?auto_518499 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_518541 - BLOCK
      ?auto_518542 - BLOCK
      ?auto_518543 - BLOCK
      ?auto_518544 - BLOCK
      ?auto_518545 - BLOCK
      ?auto_518546 - BLOCK
      ?auto_518547 - BLOCK
      ?auto_518548 - BLOCK
      ?auto_518549 - BLOCK
      ?auto_518550 - BLOCK
      ?auto_518551 - BLOCK
      ?auto_518552 - BLOCK
      ?auto_518553 - BLOCK
    )
    :vars
    (
      ?auto_518554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518553 ?auto_518554 ) ( not ( = ?auto_518541 ?auto_518542 ) ) ( not ( = ?auto_518541 ?auto_518543 ) ) ( not ( = ?auto_518541 ?auto_518544 ) ) ( not ( = ?auto_518541 ?auto_518545 ) ) ( not ( = ?auto_518541 ?auto_518546 ) ) ( not ( = ?auto_518541 ?auto_518547 ) ) ( not ( = ?auto_518541 ?auto_518548 ) ) ( not ( = ?auto_518541 ?auto_518549 ) ) ( not ( = ?auto_518541 ?auto_518550 ) ) ( not ( = ?auto_518541 ?auto_518551 ) ) ( not ( = ?auto_518541 ?auto_518552 ) ) ( not ( = ?auto_518541 ?auto_518553 ) ) ( not ( = ?auto_518541 ?auto_518554 ) ) ( not ( = ?auto_518542 ?auto_518543 ) ) ( not ( = ?auto_518542 ?auto_518544 ) ) ( not ( = ?auto_518542 ?auto_518545 ) ) ( not ( = ?auto_518542 ?auto_518546 ) ) ( not ( = ?auto_518542 ?auto_518547 ) ) ( not ( = ?auto_518542 ?auto_518548 ) ) ( not ( = ?auto_518542 ?auto_518549 ) ) ( not ( = ?auto_518542 ?auto_518550 ) ) ( not ( = ?auto_518542 ?auto_518551 ) ) ( not ( = ?auto_518542 ?auto_518552 ) ) ( not ( = ?auto_518542 ?auto_518553 ) ) ( not ( = ?auto_518542 ?auto_518554 ) ) ( not ( = ?auto_518543 ?auto_518544 ) ) ( not ( = ?auto_518543 ?auto_518545 ) ) ( not ( = ?auto_518543 ?auto_518546 ) ) ( not ( = ?auto_518543 ?auto_518547 ) ) ( not ( = ?auto_518543 ?auto_518548 ) ) ( not ( = ?auto_518543 ?auto_518549 ) ) ( not ( = ?auto_518543 ?auto_518550 ) ) ( not ( = ?auto_518543 ?auto_518551 ) ) ( not ( = ?auto_518543 ?auto_518552 ) ) ( not ( = ?auto_518543 ?auto_518553 ) ) ( not ( = ?auto_518543 ?auto_518554 ) ) ( not ( = ?auto_518544 ?auto_518545 ) ) ( not ( = ?auto_518544 ?auto_518546 ) ) ( not ( = ?auto_518544 ?auto_518547 ) ) ( not ( = ?auto_518544 ?auto_518548 ) ) ( not ( = ?auto_518544 ?auto_518549 ) ) ( not ( = ?auto_518544 ?auto_518550 ) ) ( not ( = ?auto_518544 ?auto_518551 ) ) ( not ( = ?auto_518544 ?auto_518552 ) ) ( not ( = ?auto_518544 ?auto_518553 ) ) ( not ( = ?auto_518544 ?auto_518554 ) ) ( not ( = ?auto_518545 ?auto_518546 ) ) ( not ( = ?auto_518545 ?auto_518547 ) ) ( not ( = ?auto_518545 ?auto_518548 ) ) ( not ( = ?auto_518545 ?auto_518549 ) ) ( not ( = ?auto_518545 ?auto_518550 ) ) ( not ( = ?auto_518545 ?auto_518551 ) ) ( not ( = ?auto_518545 ?auto_518552 ) ) ( not ( = ?auto_518545 ?auto_518553 ) ) ( not ( = ?auto_518545 ?auto_518554 ) ) ( not ( = ?auto_518546 ?auto_518547 ) ) ( not ( = ?auto_518546 ?auto_518548 ) ) ( not ( = ?auto_518546 ?auto_518549 ) ) ( not ( = ?auto_518546 ?auto_518550 ) ) ( not ( = ?auto_518546 ?auto_518551 ) ) ( not ( = ?auto_518546 ?auto_518552 ) ) ( not ( = ?auto_518546 ?auto_518553 ) ) ( not ( = ?auto_518546 ?auto_518554 ) ) ( not ( = ?auto_518547 ?auto_518548 ) ) ( not ( = ?auto_518547 ?auto_518549 ) ) ( not ( = ?auto_518547 ?auto_518550 ) ) ( not ( = ?auto_518547 ?auto_518551 ) ) ( not ( = ?auto_518547 ?auto_518552 ) ) ( not ( = ?auto_518547 ?auto_518553 ) ) ( not ( = ?auto_518547 ?auto_518554 ) ) ( not ( = ?auto_518548 ?auto_518549 ) ) ( not ( = ?auto_518548 ?auto_518550 ) ) ( not ( = ?auto_518548 ?auto_518551 ) ) ( not ( = ?auto_518548 ?auto_518552 ) ) ( not ( = ?auto_518548 ?auto_518553 ) ) ( not ( = ?auto_518548 ?auto_518554 ) ) ( not ( = ?auto_518549 ?auto_518550 ) ) ( not ( = ?auto_518549 ?auto_518551 ) ) ( not ( = ?auto_518549 ?auto_518552 ) ) ( not ( = ?auto_518549 ?auto_518553 ) ) ( not ( = ?auto_518549 ?auto_518554 ) ) ( not ( = ?auto_518550 ?auto_518551 ) ) ( not ( = ?auto_518550 ?auto_518552 ) ) ( not ( = ?auto_518550 ?auto_518553 ) ) ( not ( = ?auto_518550 ?auto_518554 ) ) ( not ( = ?auto_518551 ?auto_518552 ) ) ( not ( = ?auto_518551 ?auto_518553 ) ) ( not ( = ?auto_518551 ?auto_518554 ) ) ( not ( = ?auto_518552 ?auto_518553 ) ) ( not ( = ?auto_518552 ?auto_518554 ) ) ( not ( = ?auto_518553 ?auto_518554 ) ) ( ON ?auto_518552 ?auto_518553 ) ( ON ?auto_518551 ?auto_518552 ) ( ON ?auto_518550 ?auto_518551 ) ( ON ?auto_518549 ?auto_518550 ) ( ON ?auto_518548 ?auto_518549 ) ( ON ?auto_518547 ?auto_518548 ) ( ON ?auto_518546 ?auto_518547 ) ( ON ?auto_518545 ?auto_518546 ) ( ON ?auto_518544 ?auto_518545 ) ( ON ?auto_518543 ?auto_518544 ) ( ON ?auto_518542 ?auto_518543 ) ( ON ?auto_518541 ?auto_518542 ) ( CLEAR ?auto_518541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_518541 )
      ( MAKE-13PILE ?auto_518541 ?auto_518542 ?auto_518543 ?auto_518544 ?auto_518545 ?auto_518546 ?auto_518547 ?auto_518548 ?auto_518549 ?auto_518550 ?auto_518551 ?auto_518552 ?auto_518553 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_518596 - BLOCK
      ?auto_518597 - BLOCK
      ?auto_518598 - BLOCK
      ?auto_518599 - BLOCK
      ?auto_518600 - BLOCK
      ?auto_518601 - BLOCK
      ?auto_518602 - BLOCK
      ?auto_518603 - BLOCK
      ?auto_518604 - BLOCK
      ?auto_518605 - BLOCK
      ?auto_518606 - BLOCK
      ?auto_518607 - BLOCK
      ?auto_518608 - BLOCK
      ?auto_518609 - BLOCK
    )
    :vars
    (
      ?auto_518610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_518608 ) ( ON ?auto_518609 ?auto_518610 ) ( CLEAR ?auto_518609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_518596 ) ( ON ?auto_518597 ?auto_518596 ) ( ON ?auto_518598 ?auto_518597 ) ( ON ?auto_518599 ?auto_518598 ) ( ON ?auto_518600 ?auto_518599 ) ( ON ?auto_518601 ?auto_518600 ) ( ON ?auto_518602 ?auto_518601 ) ( ON ?auto_518603 ?auto_518602 ) ( ON ?auto_518604 ?auto_518603 ) ( ON ?auto_518605 ?auto_518604 ) ( ON ?auto_518606 ?auto_518605 ) ( ON ?auto_518607 ?auto_518606 ) ( ON ?auto_518608 ?auto_518607 ) ( not ( = ?auto_518596 ?auto_518597 ) ) ( not ( = ?auto_518596 ?auto_518598 ) ) ( not ( = ?auto_518596 ?auto_518599 ) ) ( not ( = ?auto_518596 ?auto_518600 ) ) ( not ( = ?auto_518596 ?auto_518601 ) ) ( not ( = ?auto_518596 ?auto_518602 ) ) ( not ( = ?auto_518596 ?auto_518603 ) ) ( not ( = ?auto_518596 ?auto_518604 ) ) ( not ( = ?auto_518596 ?auto_518605 ) ) ( not ( = ?auto_518596 ?auto_518606 ) ) ( not ( = ?auto_518596 ?auto_518607 ) ) ( not ( = ?auto_518596 ?auto_518608 ) ) ( not ( = ?auto_518596 ?auto_518609 ) ) ( not ( = ?auto_518596 ?auto_518610 ) ) ( not ( = ?auto_518597 ?auto_518598 ) ) ( not ( = ?auto_518597 ?auto_518599 ) ) ( not ( = ?auto_518597 ?auto_518600 ) ) ( not ( = ?auto_518597 ?auto_518601 ) ) ( not ( = ?auto_518597 ?auto_518602 ) ) ( not ( = ?auto_518597 ?auto_518603 ) ) ( not ( = ?auto_518597 ?auto_518604 ) ) ( not ( = ?auto_518597 ?auto_518605 ) ) ( not ( = ?auto_518597 ?auto_518606 ) ) ( not ( = ?auto_518597 ?auto_518607 ) ) ( not ( = ?auto_518597 ?auto_518608 ) ) ( not ( = ?auto_518597 ?auto_518609 ) ) ( not ( = ?auto_518597 ?auto_518610 ) ) ( not ( = ?auto_518598 ?auto_518599 ) ) ( not ( = ?auto_518598 ?auto_518600 ) ) ( not ( = ?auto_518598 ?auto_518601 ) ) ( not ( = ?auto_518598 ?auto_518602 ) ) ( not ( = ?auto_518598 ?auto_518603 ) ) ( not ( = ?auto_518598 ?auto_518604 ) ) ( not ( = ?auto_518598 ?auto_518605 ) ) ( not ( = ?auto_518598 ?auto_518606 ) ) ( not ( = ?auto_518598 ?auto_518607 ) ) ( not ( = ?auto_518598 ?auto_518608 ) ) ( not ( = ?auto_518598 ?auto_518609 ) ) ( not ( = ?auto_518598 ?auto_518610 ) ) ( not ( = ?auto_518599 ?auto_518600 ) ) ( not ( = ?auto_518599 ?auto_518601 ) ) ( not ( = ?auto_518599 ?auto_518602 ) ) ( not ( = ?auto_518599 ?auto_518603 ) ) ( not ( = ?auto_518599 ?auto_518604 ) ) ( not ( = ?auto_518599 ?auto_518605 ) ) ( not ( = ?auto_518599 ?auto_518606 ) ) ( not ( = ?auto_518599 ?auto_518607 ) ) ( not ( = ?auto_518599 ?auto_518608 ) ) ( not ( = ?auto_518599 ?auto_518609 ) ) ( not ( = ?auto_518599 ?auto_518610 ) ) ( not ( = ?auto_518600 ?auto_518601 ) ) ( not ( = ?auto_518600 ?auto_518602 ) ) ( not ( = ?auto_518600 ?auto_518603 ) ) ( not ( = ?auto_518600 ?auto_518604 ) ) ( not ( = ?auto_518600 ?auto_518605 ) ) ( not ( = ?auto_518600 ?auto_518606 ) ) ( not ( = ?auto_518600 ?auto_518607 ) ) ( not ( = ?auto_518600 ?auto_518608 ) ) ( not ( = ?auto_518600 ?auto_518609 ) ) ( not ( = ?auto_518600 ?auto_518610 ) ) ( not ( = ?auto_518601 ?auto_518602 ) ) ( not ( = ?auto_518601 ?auto_518603 ) ) ( not ( = ?auto_518601 ?auto_518604 ) ) ( not ( = ?auto_518601 ?auto_518605 ) ) ( not ( = ?auto_518601 ?auto_518606 ) ) ( not ( = ?auto_518601 ?auto_518607 ) ) ( not ( = ?auto_518601 ?auto_518608 ) ) ( not ( = ?auto_518601 ?auto_518609 ) ) ( not ( = ?auto_518601 ?auto_518610 ) ) ( not ( = ?auto_518602 ?auto_518603 ) ) ( not ( = ?auto_518602 ?auto_518604 ) ) ( not ( = ?auto_518602 ?auto_518605 ) ) ( not ( = ?auto_518602 ?auto_518606 ) ) ( not ( = ?auto_518602 ?auto_518607 ) ) ( not ( = ?auto_518602 ?auto_518608 ) ) ( not ( = ?auto_518602 ?auto_518609 ) ) ( not ( = ?auto_518602 ?auto_518610 ) ) ( not ( = ?auto_518603 ?auto_518604 ) ) ( not ( = ?auto_518603 ?auto_518605 ) ) ( not ( = ?auto_518603 ?auto_518606 ) ) ( not ( = ?auto_518603 ?auto_518607 ) ) ( not ( = ?auto_518603 ?auto_518608 ) ) ( not ( = ?auto_518603 ?auto_518609 ) ) ( not ( = ?auto_518603 ?auto_518610 ) ) ( not ( = ?auto_518604 ?auto_518605 ) ) ( not ( = ?auto_518604 ?auto_518606 ) ) ( not ( = ?auto_518604 ?auto_518607 ) ) ( not ( = ?auto_518604 ?auto_518608 ) ) ( not ( = ?auto_518604 ?auto_518609 ) ) ( not ( = ?auto_518604 ?auto_518610 ) ) ( not ( = ?auto_518605 ?auto_518606 ) ) ( not ( = ?auto_518605 ?auto_518607 ) ) ( not ( = ?auto_518605 ?auto_518608 ) ) ( not ( = ?auto_518605 ?auto_518609 ) ) ( not ( = ?auto_518605 ?auto_518610 ) ) ( not ( = ?auto_518606 ?auto_518607 ) ) ( not ( = ?auto_518606 ?auto_518608 ) ) ( not ( = ?auto_518606 ?auto_518609 ) ) ( not ( = ?auto_518606 ?auto_518610 ) ) ( not ( = ?auto_518607 ?auto_518608 ) ) ( not ( = ?auto_518607 ?auto_518609 ) ) ( not ( = ?auto_518607 ?auto_518610 ) ) ( not ( = ?auto_518608 ?auto_518609 ) ) ( not ( = ?auto_518608 ?auto_518610 ) ) ( not ( = ?auto_518609 ?auto_518610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_518609 ?auto_518610 )
      ( !STACK ?auto_518609 ?auto_518608 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_518654 - BLOCK
      ?auto_518655 - BLOCK
      ?auto_518656 - BLOCK
      ?auto_518657 - BLOCK
      ?auto_518658 - BLOCK
      ?auto_518659 - BLOCK
      ?auto_518660 - BLOCK
      ?auto_518661 - BLOCK
      ?auto_518662 - BLOCK
      ?auto_518663 - BLOCK
      ?auto_518664 - BLOCK
      ?auto_518665 - BLOCK
      ?auto_518666 - BLOCK
      ?auto_518667 - BLOCK
    )
    :vars
    (
      ?auto_518668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518667 ?auto_518668 ) ( ON-TABLE ?auto_518654 ) ( ON ?auto_518655 ?auto_518654 ) ( ON ?auto_518656 ?auto_518655 ) ( ON ?auto_518657 ?auto_518656 ) ( ON ?auto_518658 ?auto_518657 ) ( ON ?auto_518659 ?auto_518658 ) ( ON ?auto_518660 ?auto_518659 ) ( ON ?auto_518661 ?auto_518660 ) ( ON ?auto_518662 ?auto_518661 ) ( ON ?auto_518663 ?auto_518662 ) ( ON ?auto_518664 ?auto_518663 ) ( ON ?auto_518665 ?auto_518664 ) ( not ( = ?auto_518654 ?auto_518655 ) ) ( not ( = ?auto_518654 ?auto_518656 ) ) ( not ( = ?auto_518654 ?auto_518657 ) ) ( not ( = ?auto_518654 ?auto_518658 ) ) ( not ( = ?auto_518654 ?auto_518659 ) ) ( not ( = ?auto_518654 ?auto_518660 ) ) ( not ( = ?auto_518654 ?auto_518661 ) ) ( not ( = ?auto_518654 ?auto_518662 ) ) ( not ( = ?auto_518654 ?auto_518663 ) ) ( not ( = ?auto_518654 ?auto_518664 ) ) ( not ( = ?auto_518654 ?auto_518665 ) ) ( not ( = ?auto_518654 ?auto_518666 ) ) ( not ( = ?auto_518654 ?auto_518667 ) ) ( not ( = ?auto_518654 ?auto_518668 ) ) ( not ( = ?auto_518655 ?auto_518656 ) ) ( not ( = ?auto_518655 ?auto_518657 ) ) ( not ( = ?auto_518655 ?auto_518658 ) ) ( not ( = ?auto_518655 ?auto_518659 ) ) ( not ( = ?auto_518655 ?auto_518660 ) ) ( not ( = ?auto_518655 ?auto_518661 ) ) ( not ( = ?auto_518655 ?auto_518662 ) ) ( not ( = ?auto_518655 ?auto_518663 ) ) ( not ( = ?auto_518655 ?auto_518664 ) ) ( not ( = ?auto_518655 ?auto_518665 ) ) ( not ( = ?auto_518655 ?auto_518666 ) ) ( not ( = ?auto_518655 ?auto_518667 ) ) ( not ( = ?auto_518655 ?auto_518668 ) ) ( not ( = ?auto_518656 ?auto_518657 ) ) ( not ( = ?auto_518656 ?auto_518658 ) ) ( not ( = ?auto_518656 ?auto_518659 ) ) ( not ( = ?auto_518656 ?auto_518660 ) ) ( not ( = ?auto_518656 ?auto_518661 ) ) ( not ( = ?auto_518656 ?auto_518662 ) ) ( not ( = ?auto_518656 ?auto_518663 ) ) ( not ( = ?auto_518656 ?auto_518664 ) ) ( not ( = ?auto_518656 ?auto_518665 ) ) ( not ( = ?auto_518656 ?auto_518666 ) ) ( not ( = ?auto_518656 ?auto_518667 ) ) ( not ( = ?auto_518656 ?auto_518668 ) ) ( not ( = ?auto_518657 ?auto_518658 ) ) ( not ( = ?auto_518657 ?auto_518659 ) ) ( not ( = ?auto_518657 ?auto_518660 ) ) ( not ( = ?auto_518657 ?auto_518661 ) ) ( not ( = ?auto_518657 ?auto_518662 ) ) ( not ( = ?auto_518657 ?auto_518663 ) ) ( not ( = ?auto_518657 ?auto_518664 ) ) ( not ( = ?auto_518657 ?auto_518665 ) ) ( not ( = ?auto_518657 ?auto_518666 ) ) ( not ( = ?auto_518657 ?auto_518667 ) ) ( not ( = ?auto_518657 ?auto_518668 ) ) ( not ( = ?auto_518658 ?auto_518659 ) ) ( not ( = ?auto_518658 ?auto_518660 ) ) ( not ( = ?auto_518658 ?auto_518661 ) ) ( not ( = ?auto_518658 ?auto_518662 ) ) ( not ( = ?auto_518658 ?auto_518663 ) ) ( not ( = ?auto_518658 ?auto_518664 ) ) ( not ( = ?auto_518658 ?auto_518665 ) ) ( not ( = ?auto_518658 ?auto_518666 ) ) ( not ( = ?auto_518658 ?auto_518667 ) ) ( not ( = ?auto_518658 ?auto_518668 ) ) ( not ( = ?auto_518659 ?auto_518660 ) ) ( not ( = ?auto_518659 ?auto_518661 ) ) ( not ( = ?auto_518659 ?auto_518662 ) ) ( not ( = ?auto_518659 ?auto_518663 ) ) ( not ( = ?auto_518659 ?auto_518664 ) ) ( not ( = ?auto_518659 ?auto_518665 ) ) ( not ( = ?auto_518659 ?auto_518666 ) ) ( not ( = ?auto_518659 ?auto_518667 ) ) ( not ( = ?auto_518659 ?auto_518668 ) ) ( not ( = ?auto_518660 ?auto_518661 ) ) ( not ( = ?auto_518660 ?auto_518662 ) ) ( not ( = ?auto_518660 ?auto_518663 ) ) ( not ( = ?auto_518660 ?auto_518664 ) ) ( not ( = ?auto_518660 ?auto_518665 ) ) ( not ( = ?auto_518660 ?auto_518666 ) ) ( not ( = ?auto_518660 ?auto_518667 ) ) ( not ( = ?auto_518660 ?auto_518668 ) ) ( not ( = ?auto_518661 ?auto_518662 ) ) ( not ( = ?auto_518661 ?auto_518663 ) ) ( not ( = ?auto_518661 ?auto_518664 ) ) ( not ( = ?auto_518661 ?auto_518665 ) ) ( not ( = ?auto_518661 ?auto_518666 ) ) ( not ( = ?auto_518661 ?auto_518667 ) ) ( not ( = ?auto_518661 ?auto_518668 ) ) ( not ( = ?auto_518662 ?auto_518663 ) ) ( not ( = ?auto_518662 ?auto_518664 ) ) ( not ( = ?auto_518662 ?auto_518665 ) ) ( not ( = ?auto_518662 ?auto_518666 ) ) ( not ( = ?auto_518662 ?auto_518667 ) ) ( not ( = ?auto_518662 ?auto_518668 ) ) ( not ( = ?auto_518663 ?auto_518664 ) ) ( not ( = ?auto_518663 ?auto_518665 ) ) ( not ( = ?auto_518663 ?auto_518666 ) ) ( not ( = ?auto_518663 ?auto_518667 ) ) ( not ( = ?auto_518663 ?auto_518668 ) ) ( not ( = ?auto_518664 ?auto_518665 ) ) ( not ( = ?auto_518664 ?auto_518666 ) ) ( not ( = ?auto_518664 ?auto_518667 ) ) ( not ( = ?auto_518664 ?auto_518668 ) ) ( not ( = ?auto_518665 ?auto_518666 ) ) ( not ( = ?auto_518665 ?auto_518667 ) ) ( not ( = ?auto_518665 ?auto_518668 ) ) ( not ( = ?auto_518666 ?auto_518667 ) ) ( not ( = ?auto_518666 ?auto_518668 ) ) ( not ( = ?auto_518667 ?auto_518668 ) ) ( CLEAR ?auto_518665 ) ( ON ?auto_518666 ?auto_518667 ) ( CLEAR ?auto_518666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_518654 ?auto_518655 ?auto_518656 ?auto_518657 ?auto_518658 ?auto_518659 ?auto_518660 ?auto_518661 ?auto_518662 ?auto_518663 ?auto_518664 ?auto_518665 ?auto_518666 )
      ( MAKE-14PILE ?auto_518654 ?auto_518655 ?auto_518656 ?auto_518657 ?auto_518658 ?auto_518659 ?auto_518660 ?auto_518661 ?auto_518662 ?auto_518663 ?auto_518664 ?auto_518665 ?auto_518666 ?auto_518667 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_518712 - BLOCK
      ?auto_518713 - BLOCK
      ?auto_518714 - BLOCK
      ?auto_518715 - BLOCK
      ?auto_518716 - BLOCK
      ?auto_518717 - BLOCK
      ?auto_518718 - BLOCK
      ?auto_518719 - BLOCK
      ?auto_518720 - BLOCK
      ?auto_518721 - BLOCK
      ?auto_518722 - BLOCK
      ?auto_518723 - BLOCK
      ?auto_518724 - BLOCK
      ?auto_518725 - BLOCK
    )
    :vars
    (
      ?auto_518726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518725 ?auto_518726 ) ( ON-TABLE ?auto_518712 ) ( ON ?auto_518713 ?auto_518712 ) ( ON ?auto_518714 ?auto_518713 ) ( ON ?auto_518715 ?auto_518714 ) ( ON ?auto_518716 ?auto_518715 ) ( ON ?auto_518717 ?auto_518716 ) ( ON ?auto_518718 ?auto_518717 ) ( ON ?auto_518719 ?auto_518718 ) ( ON ?auto_518720 ?auto_518719 ) ( ON ?auto_518721 ?auto_518720 ) ( ON ?auto_518722 ?auto_518721 ) ( not ( = ?auto_518712 ?auto_518713 ) ) ( not ( = ?auto_518712 ?auto_518714 ) ) ( not ( = ?auto_518712 ?auto_518715 ) ) ( not ( = ?auto_518712 ?auto_518716 ) ) ( not ( = ?auto_518712 ?auto_518717 ) ) ( not ( = ?auto_518712 ?auto_518718 ) ) ( not ( = ?auto_518712 ?auto_518719 ) ) ( not ( = ?auto_518712 ?auto_518720 ) ) ( not ( = ?auto_518712 ?auto_518721 ) ) ( not ( = ?auto_518712 ?auto_518722 ) ) ( not ( = ?auto_518712 ?auto_518723 ) ) ( not ( = ?auto_518712 ?auto_518724 ) ) ( not ( = ?auto_518712 ?auto_518725 ) ) ( not ( = ?auto_518712 ?auto_518726 ) ) ( not ( = ?auto_518713 ?auto_518714 ) ) ( not ( = ?auto_518713 ?auto_518715 ) ) ( not ( = ?auto_518713 ?auto_518716 ) ) ( not ( = ?auto_518713 ?auto_518717 ) ) ( not ( = ?auto_518713 ?auto_518718 ) ) ( not ( = ?auto_518713 ?auto_518719 ) ) ( not ( = ?auto_518713 ?auto_518720 ) ) ( not ( = ?auto_518713 ?auto_518721 ) ) ( not ( = ?auto_518713 ?auto_518722 ) ) ( not ( = ?auto_518713 ?auto_518723 ) ) ( not ( = ?auto_518713 ?auto_518724 ) ) ( not ( = ?auto_518713 ?auto_518725 ) ) ( not ( = ?auto_518713 ?auto_518726 ) ) ( not ( = ?auto_518714 ?auto_518715 ) ) ( not ( = ?auto_518714 ?auto_518716 ) ) ( not ( = ?auto_518714 ?auto_518717 ) ) ( not ( = ?auto_518714 ?auto_518718 ) ) ( not ( = ?auto_518714 ?auto_518719 ) ) ( not ( = ?auto_518714 ?auto_518720 ) ) ( not ( = ?auto_518714 ?auto_518721 ) ) ( not ( = ?auto_518714 ?auto_518722 ) ) ( not ( = ?auto_518714 ?auto_518723 ) ) ( not ( = ?auto_518714 ?auto_518724 ) ) ( not ( = ?auto_518714 ?auto_518725 ) ) ( not ( = ?auto_518714 ?auto_518726 ) ) ( not ( = ?auto_518715 ?auto_518716 ) ) ( not ( = ?auto_518715 ?auto_518717 ) ) ( not ( = ?auto_518715 ?auto_518718 ) ) ( not ( = ?auto_518715 ?auto_518719 ) ) ( not ( = ?auto_518715 ?auto_518720 ) ) ( not ( = ?auto_518715 ?auto_518721 ) ) ( not ( = ?auto_518715 ?auto_518722 ) ) ( not ( = ?auto_518715 ?auto_518723 ) ) ( not ( = ?auto_518715 ?auto_518724 ) ) ( not ( = ?auto_518715 ?auto_518725 ) ) ( not ( = ?auto_518715 ?auto_518726 ) ) ( not ( = ?auto_518716 ?auto_518717 ) ) ( not ( = ?auto_518716 ?auto_518718 ) ) ( not ( = ?auto_518716 ?auto_518719 ) ) ( not ( = ?auto_518716 ?auto_518720 ) ) ( not ( = ?auto_518716 ?auto_518721 ) ) ( not ( = ?auto_518716 ?auto_518722 ) ) ( not ( = ?auto_518716 ?auto_518723 ) ) ( not ( = ?auto_518716 ?auto_518724 ) ) ( not ( = ?auto_518716 ?auto_518725 ) ) ( not ( = ?auto_518716 ?auto_518726 ) ) ( not ( = ?auto_518717 ?auto_518718 ) ) ( not ( = ?auto_518717 ?auto_518719 ) ) ( not ( = ?auto_518717 ?auto_518720 ) ) ( not ( = ?auto_518717 ?auto_518721 ) ) ( not ( = ?auto_518717 ?auto_518722 ) ) ( not ( = ?auto_518717 ?auto_518723 ) ) ( not ( = ?auto_518717 ?auto_518724 ) ) ( not ( = ?auto_518717 ?auto_518725 ) ) ( not ( = ?auto_518717 ?auto_518726 ) ) ( not ( = ?auto_518718 ?auto_518719 ) ) ( not ( = ?auto_518718 ?auto_518720 ) ) ( not ( = ?auto_518718 ?auto_518721 ) ) ( not ( = ?auto_518718 ?auto_518722 ) ) ( not ( = ?auto_518718 ?auto_518723 ) ) ( not ( = ?auto_518718 ?auto_518724 ) ) ( not ( = ?auto_518718 ?auto_518725 ) ) ( not ( = ?auto_518718 ?auto_518726 ) ) ( not ( = ?auto_518719 ?auto_518720 ) ) ( not ( = ?auto_518719 ?auto_518721 ) ) ( not ( = ?auto_518719 ?auto_518722 ) ) ( not ( = ?auto_518719 ?auto_518723 ) ) ( not ( = ?auto_518719 ?auto_518724 ) ) ( not ( = ?auto_518719 ?auto_518725 ) ) ( not ( = ?auto_518719 ?auto_518726 ) ) ( not ( = ?auto_518720 ?auto_518721 ) ) ( not ( = ?auto_518720 ?auto_518722 ) ) ( not ( = ?auto_518720 ?auto_518723 ) ) ( not ( = ?auto_518720 ?auto_518724 ) ) ( not ( = ?auto_518720 ?auto_518725 ) ) ( not ( = ?auto_518720 ?auto_518726 ) ) ( not ( = ?auto_518721 ?auto_518722 ) ) ( not ( = ?auto_518721 ?auto_518723 ) ) ( not ( = ?auto_518721 ?auto_518724 ) ) ( not ( = ?auto_518721 ?auto_518725 ) ) ( not ( = ?auto_518721 ?auto_518726 ) ) ( not ( = ?auto_518722 ?auto_518723 ) ) ( not ( = ?auto_518722 ?auto_518724 ) ) ( not ( = ?auto_518722 ?auto_518725 ) ) ( not ( = ?auto_518722 ?auto_518726 ) ) ( not ( = ?auto_518723 ?auto_518724 ) ) ( not ( = ?auto_518723 ?auto_518725 ) ) ( not ( = ?auto_518723 ?auto_518726 ) ) ( not ( = ?auto_518724 ?auto_518725 ) ) ( not ( = ?auto_518724 ?auto_518726 ) ) ( not ( = ?auto_518725 ?auto_518726 ) ) ( ON ?auto_518724 ?auto_518725 ) ( CLEAR ?auto_518722 ) ( ON ?auto_518723 ?auto_518724 ) ( CLEAR ?auto_518723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_518712 ?auto_518713 ?auto_518714 ?auto_518715 ?auto_518716 ?auto_518717 ?auto_518718 ?auto_518719 ?auto_518720 ?auto_518721 ?auto_518722 ?auto_518723 )
      ( MAKE-14PILE ?auto_518712 ?auto_518713 ?auto_518714 ?auto_518715 ?auto_518716 ?auto_518717 ?auto_518718 ?auto_518719 ?auto_518720 ?auto_518721 ?auto_518722 ?auto_518723 ?auto_518724 ?auto_518725 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_518770 - BLOCK
      ?auto_518771 - BLOCK
      ?auto_518772 - BLOCK
      ?auto_518773 - BLOCK
      ?auto_518774 - BLOCK
      ?auto_518775 - BLOCK
      ?auto_518776 - BLOCK
      ?auto_518777 - BLOCK
      ?auto_518778 - BLOCK
      ?auto_518779 - BLOCK
      ?auto_518780 - BLOCK
      ?auto_518781 - BLOCK
      ?auto_518782 - BLOCK
      ?auto_518783 - BLOCK
    )
    :vars
    (
      ?auto_518784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518783 ?auto_518784 ) ( ON-TABLE ?auto_518770 ) ( ON ?auto_518771 ?auto_518770 ) ( ON ?auto_518772 ?auto_518771 ) ( ON ?auto_518773 ?auto_518772 ) ( ON ?auto_518774 ?auto_518773 ) ( ON ?auto_518775 ?auto_518774 ) ( ON ?auto_518776 ?auto_518775 ) ( ON ?auto_518777 ?auto_518776 ) ( ON ?auto_518778 ?auto_518777 ) ( ON ?auto_518779 ?auto_518778 ) ( not ( = ?auto_518770 ?auto_518771 ) ) ( not ( = ?auto_518770 ?auto_518772 ) ) ( not ( = ?auto_518770 ?auto_518773 ) ) ( not ( = ?auto_518770 ?auto_518774 ) ) ( not ( = ?auto_518770 ?auto_518775 ) ) ( not ( = ?auto_518770 ?auto_518776 ) ) ( not ( = ?auto_518770 ?auto_518777 ) ) ( not ( = ?auto_518770 ?auto_518778 ) ) ( not ( = ?auto_518770 ?auto_518779 ) ) ( not ( = ?auto_518770 ?auto_518780 ) ) ( not ( = ?auto_518770 ?auto_518781 ) ) ( not ( = ?auto_518770 ?auto_518782 ) ) ( not ( = ?auto_518770 ?auto_518783 ) ) ( not ( = ?auto_518770 ?auto_518784 ) ) ( not ( = ?auto_518771 ?auto_518772 ) ) ( not ( = ?auto_518771 ?auto_518773 ) ) ( not ( = ?auto_518771 ?auto_518774 ) ) ( not ( = ?auto_518771 ?auto_518775 ) ) ( not ( = ?auto_518771 ?auto_518776 ) ) ( not ( = ?auto_518771 ?auto_518777 ) ) ( not ( = ?auto_518771 ?auto_518778 ) ) ( not ( = ?auto_518771 ?auto_518779 ) ) ( not ( = ?auto_518771 ?auto_518780 ) ) ( not ( = ?auto_518771 ?auto_518781 ) ) ( not ( = ?auto_518771 ?auto_518782 ) ) ( not ( = ?auto_518771 ?auto_518783 ) ) ( not ( = ?auto_518771 ?auto_518784 ) ) ( not ( = ?auto_518772 ?auto_518773 ) ) ( not ( = ?auto_518772 ?auto_518774 ) ) ( not ( = ?auto_518772 ?auto_518775 ) ) ( not ( = ?auto_518772 ?auto_518776 ) ) ( not ( = ?auto_518772 ?auto_518777 ) ) ( not ( = ?auto_518772 ?auto_518778 ) ) ( not ( = ?auto_518772 ?auto_518779 ) ) ( not ( = ?auto_518772 ?auto_518780 ) ) ( not ( = ?auto_518772 ?auto_518781 ) ) ( not ( = ?auto_518772 ?auto_518782 ) ) ( not ( = ?auto_518772 ?auto_518783 ) ) ( not ( = ?auto_518772 ?auto_518784 ) ) ( not ( = ?auto_518773 ?auto_518774 ) ) ( not ( = ?auto_518773 ?auto_518775 ) ) ( not ( = ?auto_518773 ?auto_518776 ) ) ( not ( = ?auto_518773 ?auto_518777 ) ) ( not ( = ?auto_518773 ?auto_518778 ) ) ( not ( = ?auto_518773 ?auto_518779 ) ) ( not ( = ?auto_518773 ?auto_518780 ) ) ( not ( = ?auto_518773 ?auto_518781 ) ) ( not ( = ?auto_518773 ?auto_518782 ) ) ( not ( = ?auto_518773 ?auto_518783 ) ) ( not ( = ?auto_518773 ?auto_518784 ) ) ( not ( = ?auto_518774 ?auto_518775 ) ) ( not ( = ?auto_518774 ?auto_518776 ) ) ( not ( = ?auto_518774 ?auto_518777 ) ) ( not ( = ?auto_518774 ?auto_518778 ) ) ( not ( = ?auto_518774 ?auto_518779 ) ) ( not ( = ?auto_518774 ?auto_518780 ) ) ( not ( = ?auto_518774 ?auto_518781 ) ) ( not ( = ?auto_518774 ?auto_518782 ) ) ( not ( = ?auto_518774 ?auto_518783 ) ) ( not ( = ?auto_518774 ?auto_518784 ) ) ( not ( = ?auto_518775 ?auto_518776 ) ) ( not ( = ?auto_518775 ?auto_518777 ) ) ( not ( = ?auto_518775 ?auto_518778 ) ) ( not ( = ?auto_518775 ?auto_518779 ) ) ( not ( = ?auto_518775 ?auto_518780 ) ) ( not ( = ?auto_518775 ?auto_518781 ) ) ( not ( = ?auto_518775 ?auto_518782 ) ) ( not ( = ?auto_518775 ?auto_518783 ) ) ( not ( = ?auto_518775 ?auto_518784 ) ) ( not ( = ?auto_518776 ?auto_518777 ) ) ( not ( = ?auto_518776 ?auto_518778 ) ) ( not ( = ?auto_518776 ?auto_518779 ) ) ( not ( = ?auto_518776 ?auto_518780 ) ) ( not ( = ?auto_518776 ?auto_518781 ) ) ( not ( = ?auto_518776 ?auto_518782 ) ) ( not ( = ?auto_518776 ?auto_518783 ) ) ( not ( = ?auto_518776 ?auto_518784 ) ) ( not ( = ?auto_518777 ?auto_518778 ) ) ( not ( = ?auto_518777 ?auto_518779 ) ) ( not ( = ?auto_518777 ?auto_518780 ) ) ( not ( = ?auto_518777 ?auto_518781 ) ) ( not ( = ?auto_518777 ?auto_518782 ) ) ( not ( = ?auto_518777 ?auto_518783 ) ) ( not ( = ?auto_518777 ?auto_518784 ) ) ( not ( = ?auto_518778 ?auto_518779 ) ) ( not ( = ?auto_518778 ?auto_518780 ) ) ( not ( = ?auto_518778 ?auto_518781 ) ) ( not ( = ?auto_518778 ?auto_518782 ) ) ( not ( = ?auto_518778 ?auto_518783 ) ) ( not ( = ?auto_518778 ?auto_518784 ) ) ( not ( = ?auto_518779 ?auto_518780 ) ) ( not ( = ?auto_518779 ?auto_518781 ) ) ( not ( = ?auto_518779 ?auto_518782 ) ) ( not ( = ?auto_518779 ?auto_518783 ) ) ( not ( = ?auto_518779 ?auto_518784 ) ) ( not ( = ?auto_518780 ?auto_518781 ) ) ( not ( = ?auto_518780 ?auto_518782 ) ) ( not ( = ?auto_518780 ?auto_518783 ) ) ( not ( = ?auto_518780 ?auto_518784 ) ) ( not ( = ?auto_518781 ?auto_518782 ) ) ( not ( = ?auto_518781 ?auto_518783 ) ) ( not ( = ?auto_518781 ?auto_518784 ) ) ( not ( = ?auto_518782 ?auto_518783 ) ) ( not ( = ?auto_518782 ?auto_518784 ) ) ( not ( = ?auto_518783 ?auto_518784 ) ) ( ON ?auto_518782 ?auto_518783 ) ( ON ?auto_518781 ?auto_518782 ) ( CLEAR ?auto_518779 ) ( ON ?auto_518780 ?auto_518781 ) ( CLEAR ?auto_518780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_518770 ?auto_518771 ?auto_518772 ?auto_518773 ?auto_518774 ?auto_518775 ?auto_518776 ?auto_518777 ?auto_518778 ?auto_518779 ?auto_518780 )
      ( MAKE-14PILE ?auto_518770 ?auto_518771 ?auto_518772 ?auto_518773 ?auto_518774 ?auto_518775 ?auto_518776 ?auto_518777 ?auto_518778 ?auto_518779 ?auto_518780 ?auto_518781 ?auto_518782 ?auto_518783 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_518828 - BLOCK
      ?auto_518829 - BLOCK
      ?auto_518830 - BLOCK
      ?auto_518831 - BLOCK
      ?auto_518832 - BLOCK
      ?auto_518833 - BLOCK
      ?auto_518834 - BLOCK
      ?auto_518835 - BLOCK
      ?auto_518836 - BLOCK
      ?auto_518837 - BLOCK
      ?auto_518838 - BLOCK
      ?auto_518839 - BLOCK
      ?auto_518840 - BLOCK
      ?auto_518841 - BLOCK
    )
    :vars
    (
      ?auto_518842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518841 ?auto_518842 ) ( ON-TABLE ?auto_518828 ) ( ON ?auto_518829 ?auto_518828 ) ( ON ?auto_518830 ?auto_518829 ) ( ON ?auto_518831 ?auto_518830 ) ( ON ?auto_518832 ?auto_518831 ) ( ON ?auto_518833 ?auto_518832 ) ( ON ?auto_518834 ?auto_518833 ) ( ON ?auto_518835 ?auto_518834 ) ( ON ?auto_518836 ?auto_518835 ) ( not ( = ?auto_518828 ?auto_518829 ) ) ( not ( = ?auto_518828 ?auto_518830 ) ) ( not ( = ?auto_518828 ?auto_518831 ) ) ( not ( = ?auto_518828 ?auto_518832 ) ) ( not ( = ?auto_518828 ?auto_518833 ) ) ( not ( = ?auto_518828 ?auto_518834 ) ) ( not ( = ?auto_518828 ?auto_518835 ) ) ( not ( = ?auto_518828 ?auto_518836 ) ) ( not ( = ?auto_518828 ?auto_518837 ) ) ( not ( = ?auto_518828 ?auto_518838 ) ) ( not ( = ?auto_518828 ?auto_518839 ) ) ( not ( = ?auto_518828 ?auto_518840 ) ) ( not ( = ?auto_518828 ?auto_518841 ) ) ( not ( = ?auto_518828 ?auto_518842 ) ) ( not ( = ?auto_518829 ?auto_518830 ) ) ( not ( = ?auto_518829 ?auto_518831 ) ) ( not ( = ?auto_518829 ?auto_518832 ) ) ( not ( = ?auto_518829 ?auto_518833 ) ) ( not ( = ?auto_518829 ?auto_518834 ) ) ( not ( = ?auto_518829 ?auto_518835 ) ) ( not ( = ?auto_518829 ?auto_518836 ) ) ( not ( = ?auto_518829 ?auto_518837 ) ) ( not ( = ?auto_518829 ?auto_518838 ) ) ( not ( = ?auto_518829 ?auto_518839 ) ) ( not ( = ?auto_518829 ?auto_518840 ) ) ( not ( = ?auto_518829 ?auto_518841 ) ) ( not ( = ?auto_518829 ?auto_518842 ) ) ( not ( = ?auto_518830 ?auto_518831 ) ) ( not ( = ?auto_518830 ?auto_518832 ) ) ( not ( = ?auto_518830 ?auto_518833 ) ) ( not ( = ?auto_518830 ?auto_518834 ) ) ( not ( = ?auto_518830 ?auto_518835 ) ) ( not ( = ?auto_518830 ?auto_518836 ) ) ( not ( = ?auto_518830 ?auto_518837 ) ) ( not ( = ?auto_518830 ?auto_518838 ) ) ( not ( = ?auto_518830 ?auto_518839 ) ) ( not ( = ?auto_518830 ?auto_518840 ) ) ( not ( = ?auto_518830 ?auto_518841 ) ) ( not ( = ?auto_518830 ?auto_518842 ) ) ( not ( = ?auto_518831 ?auto_518832 ) ) ( not ( = ?auto_518831 ?auto_518833 ) ) ( not ( = ?auto_518831 ?auto_518834 ) ) ( not ( = ?auto_518831 ?auto_518835 ) ) ( not ( = ?auto_518831 ?auto_518836 ) ) ( not ( = ?auto_518831 ?auto_518837 ) ) ( not ( = ?auto_518831 ?auto_518838 ) ) ( not ( = ?auto_518831 ?auto_518839 ) ) ( not ( = ?auto_518831 ?auto_518840 ) ) ( not ( = ?auto_518831 ?auto_518841 ) ) ( not ( = ?auto_518831 ?auto_518842 ) ) ( not ( = ?auto_518832 ?auto_518833 ) ) ( not ( = ?auto_518832 ?auto_518834 ) ) ( not ( = ?auto_518832 ?auto_518835 ) ) ( not ( = ?auto_518832 ?auto_518836 ) ) ( not ( = ?auto_518832 ?auto_518837 ) ) ( not ( = ?auto_518832 ?auto_518838 ) ) ( not ( = ?auto_518832 ?auto_518839 ) ) ( not ( = ?auto_518832 ?auto_518840 ) ) ( not ( = ?auto_518832 ?auto_518841 ) ) ( not ( = ?auto_518832 ?auto_518842 ) ) ( not ( = ?auto_518833 ?auto_518834 ) ) ( not ( = ?auto_518833 ?auto_518835 ) ) ( not ( = ?auto_518833 ?auto_518836 ) ) ( not ( = ?auto_518833 ?auto_518837 ) ) ( not ( = ?auto_518833 ?auto_518838 ) ) ( not ( = ?auto_518833 ?auto_518839 ) ) ( not ( = ?auto_518833 ?auto_518840 ) ) ( not ( = ?auto_518833 ?auto_518841 ) ) ( not ( = ?auto_518833 ?auto_518842 ) ) ( not ( = ?auto_518834 ?auto_518835 ) ) ( not ( = ?auto_518834 ?auto_518836 ) ) ( not ( = ?auto_518834 ?auto_518837 ) ) ( not ( = ?auto_518834 ?auto_518838 ) ) ( not ( = ?auto_518834 ?auto_518839 ) ) ( not ( = ?auto_518834 ?auto_518840 ) ) ( not ( = ?auto_518834 ?auto_518841 ) ) ( not ( = ?auto_518834 ?auto_518842 ) ) ( not ( = ?auto_518835 ?auto_518836 ) ) ( not ( = ?auto_518835 ?auto_518837 ) ) ( not ( = ?auto_518835 ?auto_518838 ) ) ( not ( = ?auto_518835 ?auto_518839 ) ) ( not ( = ?auto_518835 ?auto_518840 ) ) ( not ( = ?auto_518835 ?auto_518841 ) ) ( not ( = ?auto_518835 ?auto_518842 ) ) ( not ( = ?auto_518836 ?auto_518837 ) ) ( not ( = ?auto_518836 ?auto_518838 ) ) ( not ( = ?auto_518836 ?auto_518839 ) ) ( not ( = ?auto_518836 ?auto_518840 ) ) ( not ( = ?auto_518836 ?auto_518841 ) ) ( not ( = ?auto_518836 ?auto_518842 ) ) ( not ( = ?auto_518837 ?auto_518838 ) ) ( not ( = ?auto_518837 ?auto_518839 ) ) ( not ( = ?auto_518837 ?auto_518840 ) ) ( not ( = ?auto_518837 ?auto_518841 ) ) ( not ( = ?auto_518837 ?auto_518842 ) ) ( not ( = ?auto_518838 ?auto_518839 ) ) ( not ( = ?auto_518838 ?auto_518840 ) ) ( not ( = ?auto_518838 ?auto_518841 ) ) ( not ( = ?auto_518838 ?auto_518842 ) ) ( not ( = ?auto_518839 ?auto_518840 ) ) ( not ( = ?auto_518839 ?auto_518841 ) ) ( not ( = ?auto_518839 ?auto_518842 ) ) ( not ( = ?auto_518840 ?auto_518841 ) ) ( not ( = ?auto_518840 ?auto_518842 ) ) ( not ( = ?auto_518841 ?auto_518842 ) ) ( ON ?auto_518840 ?auto_518841 ) ( ON ?auto_518839 ?auto_518840 ) ( ON ?auto_518838 ?auto_518839 ) ( CLEAR ?auto_518836 ) ( ON ?auto_518837 ?auto_518838 ) ( CLEAR ?auto_518837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_518828 ?auto_518829 ?auto_518830 ?auto_518831 ?auto_518832 ?auto_518833 ?auto_518834 ?auto_518835 ?auto_518836 ?auto_518837 )
      ( MAKE-14PILE ?auto_518828 ?auto_518829 ?auto_518830 ?auto_518831 ?auto_518832 ?auto_518833 ?auto_518834 ?auto_518835 ?auto_518836 ?auto_518837 ?auto_518838 ?auto_518839 ?auto_518840 ?auto_518841 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_518886 - BLOCK
      ?auto_518887 - BLOCK
      ?auto_518888 - BLOCK
      ?auto_518889 - BLOCK
      ?auto_518890 - BLOCK
      ?auto_518891 - BLOCK
      ?auto_518892 - BLOCK
      ?auto_518893 - BLOCK
      ?auto_518894 - BLOCK
      ?auto_518895 - BLOCK
      ?auto_518896 - BLOCK
      ?auto_518897 - BLOCK
      ?auto_518898 - BLOCK
      ?auto_518899 - BLOCK
    )
    :vars
    (
      ?auto_518900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518899 ?auto_518900 ) ( ON-TABLE ?auto_518886 ) ( ON ?auto_518887 ?auto_518886 ) ( ON ?auto_518888 ?auto_518887 ) ( ON ?auto_518889 ?auto_518888 ) ( ON ?auto_518890 ?auto_518889 ) ( ON ?auto_518891 ?auto_518890 ) ( ON ?auto_518892 ?auto_518891 ) ( ON ?auto_518893 ?auto_518892 ) ( not ( = ?auto_518886 ?auto_518887 ) ) ( not ( = ?auto_518886 ?auto_518888 ) ) ( not ( = ?auto_518886 ?auto_518889 ) ) ( not ( = ?auto_518886 ?auto_518890 ) ) ( not ( = ?auto_518886 ?auto_518891 ) ) ( not ( = ?auto_518886 ?auto_518892 ) ) ( not ( = ?auto_518886 ?auto_518893 ) ) ( not ( = ?auto_518886 ?auto_518894 ) ) ( not ( = ?auto_518886 ?auto_518895 ) ) ( not ( = ?auto_518886 ?auto_518896 ) ) ( not ( = ?auto_518886 ?auto_518897 ) ) ( not ( = ?auto_518886 ?auto_518898 ) ) ( not ( = ?auto_518886 ?auto_518899 ) ) ( not ( = ?auto_518886 ?auto_518900 ) ) ( not ( = ?auto_518887 ?auto_518888 ) ) ( not ( = ?auto_518887 ?auto_518889 ) ) ( not ( = ?auto_518887 ?auto_518890 ) ) ( not ( = ?auto_518887 ?auto_518891 ) ) ( not ( = ?auto_518887 ?auto_518892 ) ) ( not ( = ?auto_518887 ?auto_518893 ) ) ( not ( = ?auto_518887 ?auto_518894 ) ) ( not ( = ?auto_518887 ?auto_518895 ) ) ( not ( = ?auto_518887 ?auto_518896 ) ) ( not ( = ?auto_518887 ?auto_518897 ) ) ( not ( = ?auto_518887 ?auto_518898 ) ) ( not ( = ?auto_518887 ?auto_518899 ) ) ( not ( = ?auto_518887 ?auto_518900 ) ) ( not ( = ?auto_518888 ?auto_518889 ) ) ( not ( = ?auto_518888 ?auto_518890 ) ) ( not ( = ?auto_518888 ?auto_518891 ) ) ( not ( = ?auto_518888 ?auto_518892 ) ) ( not ( = ?auto_518888 ?auto_518893 ) ) ( not ( = ?auto_518888 ?auto_518894 ) ) ( not ( = ?auto_518888 ?auto_518895 ) ) ( not ( = ?auto_518888 ?auto_518896 ) ) ( not ( = ?auto_518888 ?auto_518897 ) ) ( not ( = ?auto_518888 ?auto_518898 ) ) ( not ( = ?auto_518888 ?auto_518899 ) ) ( not ( = ?auto_518888 ?auto_518900 ) ) ( not ( = ?auto_518889 ?auto_518890 ) ) ( not ( = ?auto_518889 ?auto_518891 ) ) ( not ( = ?auto_518889 ?auto_518892 ) ) ( not ( = ?auto_518889 ?auto_518893 ) ) ( not ( = ?auto_518889 ?auto_518894 ) ) ( not ( = ?auto_518889 ?auto_518895 ) ) ( not ( = ?auto_518889 ?auto_518896 ) ) ( not ( = ?auto_518889 ?auto_518897 ) ) ( not ( = ?auto_518889 ?auto_518898 ) ) ( not ( = ?auto_518889 ?auto_518899 ) ) ( not ( = ?auto_518889 ?auto_518900 ) ) ( not ( = ?auto_518890 ?auto_518891 ) ) ( not ( = ?auto_518890 ?auto_518892 ) ) ( not ( = ?auto_518890 ?auto_518893 ) ) ( not ( = ?auto_518890 ?auto_518894 ) ) ( not ( = ?auto_518890 ?auto_518895 ) ) ( not ( = ?auto_518890 ?auto_518896 ) ) ( not ( = ?auto_518890 ?auto_518897 ) ) ( not ( = ?auto_518890 ?auto_518898 ) ) ( not ( = ?auto_518890 ?auto_518899 ) ) ( not ( = ?auto_518890 ?auto_518900 ) ) ( not ( = ?auto_518891 ?auto_518892 ) ) ( not ( = ?auto_518891 ?auto_518893 ) ) ( not ( = ?auto_518891 ?auto_518894 ) ) ( not ( = ?auto_518891 ?auto_518895 ) ) ( not ( = ?auto_518891 ?auto_518896 ) ) ( not ( = ?auto_518891 ?auto_518897 ) ) ( not ( = ?auto_518891 ?auto_518898 ) ) ( not ( = ?auto_518891 ?auto_518899 ) ) ( not ( = ?auto_518891 ?auto_518900 ) ) ( not ( = ?auto_518892 ?auto_518893 ) ) ( not ( = ?auto_518892 ?auto_518894 ) ) ( not ( = ?auto_518892 ?auto_518895 ) ) ( not ( = ?auto_518892 ?auto_518896 ) ) ( not ( = ?auto_518892 ?auto_518897 ) ) ( not ( = ?auto_518892 ?auto_518898 ) ) ( not ( = ?auto_518892 ?auto_518899 ) ) ( not ( = ?auto_518892 ?auto_518900 ) ) ( not ( = ?auto_518893 ?auto_518894 ) ) ( not ( = ?auto_518893 ?auto_518895 ) ) ( not ( = ?auto_518893 ?auto_518896 ) ) ( not ( = ?auto_518893 ?auto_518897 ) ) ( not ( = ?auto_518893 ?auto_518898 ) ) ( not ( = ?auto_518893 ?auto_518899 ) ) ( not ( = ?auto_518893 ?auto_518900 ) ) ( not ( = ?auto_518894 ?auto_518895 ) ) ( not ( = ?auto_518894 ?auto_518896 ) ) ( not ( = ?auto_518894 ?auto_518897 ) ) ( not ( = ?auto_518894 ?auto_518898 ) ) ( not ( = ?auto_518894 ?auto_518899 ) ) ( not ( = ?auto_518894 ?auto_518900 ) ) ( not ( = ?auto_518895 ?auto_518896 ) ) ( not ( = ?auto_518895 ?auto_518897 ) ) ( not ( = ?auto_518895 ?auto_518898 ) ) ( not ( = ?auto_518895 ?auto_518899 ) ) ( not ( = ?auto_518895 ?auto_518900 ) ) ( not ( = ?auto_518896 ?auto_518897 ) ) ( not ( = ?auto_518896 ?auto_518898 ) ) ( not ( = ?auto_518896 ?auto_518899 ) ) ( not ( = ?auto_518896 ?auto_518900 ) ) ( not ( = ?auto_518897 ?auto_518898 ) ) ( not ( = ?auto_518897 ?auto_518899 ) ) ( not ( = ?auto_518897 ?auto_518900 ) ) ( not ( = ?auto_518898 ?auto_518899 ) ) ( not ( = ?auto_518898 ?auto_518900 ) ) ( not ( = ?auto_518899 ?auto_518900 ) ) ( ON ?auto_518898 ?auto_518899 ) ( ON ?auto_518897 ?auto_518898 ) ( ON ?auto_518896 ?auto_518897 ) ( ON ?auto_518895 ?auto_518896 ) ( CLEAR ?auto_518893 ) ( ON ?auto_518894 ?auto_518895 ) ( CLEAR ?auto_518894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_518886 ?auto_518887 ?auto_518888 ?auto_518889 ?auto_518890 ?auto_518891 ?auto_518892 ?auto_518893 ?auto_518894 )
      ( MAKE-14PILE ?auto_518886 ?auto_518887 ?auto_518888 ?auto_518889 ?auto_518890 ?auto_518891 ?auto_518892 ?auto_518893 ?auto_518894 ?auto_518895 ?auto_518896 ?auto_518897 ?auto_518898 ?auto_518899 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_518944 - BLOCK
      ?auto_518945 - BLOCK
      ?auto_518946 - BLOCK
      ?auto_518947 - BLOCK
      ?auto_518948 - BLOCK
      ?auto_518949 - BLOCK
      ?auto_518950 - BLOCK
      ?auto_518951 - BLOCK
      ?auto_518952 - BLOCK
      ?auto_518953 - BLOCK
      ?auto_518954 - BLOCK
      ?auto_518955 - BLOCK
      ?auto_518956 - BLOCK
      ?auto_518957 - BLOCK
    )
    :vars
    (
      ?auto_518958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_518957 ?auto_518958 ) ( ON-TABLE ?auto_518944 ) ( ON ?auto_518945 ?auto_518944 ) ( ON ?auto_518946 ?auto_518945 ) ( ON ?auto_518947 ?auto_518946 ) ( ON ?auto_518948 ?auto_518947 ) ( ON ?auto_518949 ?auto_518948 ) ( ON ?auto_518950 ?auto_518949 ) ( not ( = ?auto_518944 ?auto_518945 ) ) ( not ( = ?auto_518944 ?auto_518946 ) ) ( not ( = ?auto_518944 ?auto_518947 ) ) ( not ( = ?auto_518944 ?auto_518948 ) ) ( not ( = ?auto_518944 ?auto_518949 ) ) ( not ( = ?auto_518944 ?auto_518950 ) ) ( not ( = ?auto_518944 ?auto_518951 ) ) ( not ( = ?auto_518944 ?auto_518952 ) ) ( not ( = ?auto_518944 ?auto_518953 ) ) ( not ( = ?auto_518944 ?auto_518954 ) ) ( not ( = ?auto_518944 ?auto_518955 ) ) ( not ( = ?auto_518944 ?auto_518956 ) ) ( not ( = ?auto_518944 ?auto_518957 ) ) ( not ( = ?auto_518944 ?auto_518958 ) ) ( not ( = ?auto_518945 ?auto_518946 ) ) ( not ( = ?auto_518945 ?auto_518947 ) ) ( not ( = ?auto_518945 ?auto_518948 ) ) ( not ( = ?auto_518945 ?auto_518949 ) ) ( not ( = ?auto_518945 ?auto_518950 ) ) ( not ( = ?auto_518945 ?auto_518951 ) ) ( not ( = ?auto_518945 ?auto_518952 ) ) ( not ( = ?auto_518945 ?auto_518953 ) ) ( not ( = ?auto_518945 ?auto_518954 ) ) ( not ( = ?auto_518945 ?auto_518955 ) ) ( not ( = ?auto_518945 ?auto_518956 ) ) ( not ( = ?auto_518945 ?auto_518957 ) ) ( not ( = ?auto_518945 ?auto_518958 ) ) ( not ( = ?auto_518946 ?auto_518947 ) ) ( not ( = ?auto_518946 ?auto_518948 ) ) ( not ( = ?auto_518946 ?auto_518949 ) ) ( not ( = ?auto_518946 ?auto_518950 ) ) ( not ( = ?auto_518946 ?auto_518951 ) ) ( not ( = ?auto_518946 ?auto_518952 ) ) ( not ( = ?auto_518946 ?auto_518953 ) ) ( not ( = ?auto_518946 ?auto_518954 ) ) ( not ( = ?auto_518946 ?auto_518955 ) ) ( not ( = ?auto_518946 ?auto_518956 ) ) ( not ( = ?auto_518946 ?auto_518957 ) ) ( not ( = ?auto_518946 ?auto_518958 ) ) ( not ( = ?auto_518947 ?auto_518948 ) ) ( not ( = ?auto_518947 ?auto_518949 ) ) ( not ( = ?auto_518947 ?auto_518950 ) ) ( not ( = ?auto_518947 ?auto_518951 ) ) ( not ( = ?auto_518947 ?auto_518952 ) ) ( not ( = ?auto_518947 ?auto_518953 ) ) ( not ( = ?auto_518947 ?auto_518954 ) ) ( not ( = ?auto_518947 ?auto_518955 ) ) ( not ( = ?auto_518947 ?auto_518956 ) ) ( not ( = ?auto_518947 ?auto_518957 ) ) ( not ( = ?auto_518947 ?auto_518958 ) ) ( not ( = ?auto_518948 ?auto_518949 ) ) ( not ( = ?auto_518948 ?auto_518950 ) ) ( not ( = ?auto_518948 ?auto_518951 ) ) ( not ( = ?auto_518948 ?auto_518952 ) ) ( not ( = ?auto_518948 ?auto_518953 ) ) ( not ( = ?auto_518948 ?auto_518954 ) ) ( not ( = ?auto_518948 ?auto_518955 ) ) ( not ( = ?auto_518948 ?auto_518956 ) ) ( not ( = ?auto_518948 ?auto_518957 ) ) ( not ( = ?auto_518948 ?auto_518958 ) ) ( not ( = ?auto_518949 ?auto_518950 ) ) ( not ( = ?auto_518949 ?auto_518951 ) ) ( not ( = ?auto_518949 ?auto_518952 ) ) ( not ( = ?auto_518949 ?auto_518953 ) ) ( not ( = ?auto_518949 ?auto_518954 ) ) ( not ( = ?auto_518949 ?auto_518955 ) ) ( not ( = ?auto_518949 ?auto_518956 ) ) ( not ( = ?auto_518949 ?auto_518957 ) ) ( not ( = ?auto_518949 ?auto_518958 ) ) ( not ( = ?auto_518950 ?auto_518951 ) ) ( not ( = ?auto_518950 ?auto_518952 ) ) ( not ( = ?auto_518950 ?auto_518953 ) ) ( not ( = ?auto_518950 ?auto_518954 ) ) ( not ( = ?auto_518950 ?auto_518955 ) ) ( not ( = ?auto_518950 ?auto_518956 ) ) ( not ( = ?auto_518950 ?auto_518957 ) ) ( not ( = ?auto_518950 ?auto_518958 ) ) ( not ( = ?auto_518951 ?auto_518952 ) ) ( not ( = ?auto_518951 ?auto_518953 ) ) ( not ( = ?auto_518951 ?auto_518954 ) ) ( not ( = ?auto_518951 ?auto_518955 ) ) ( not ( = ?auto_518951 ?auto_518956 ) ) ( not ( = ?auto_518951 ?auto_518957 ) ) ( not ( = ?auto_518951 ?auto_518958 ) ) ( not ( = ?auto_518952 ?auto_518953 ) ) ( not ( = ?auto_518952 ?auto_518954 ) ) ( not ( = ?auto_518952 ?auto_518955 ) ) ( not ( = ?auto_518952 ?auto_518956 ) ) ( not ( = ?auto_518952 ?auto_518957 ) ) ( not ( = ?auto_518952 ?auto_518958 ) ) ( not ( = ?auto_518953 ?auto_518954 ) ) ( not ( = ?auto_518953 ?auto_518955 ) ) ( not ( = ?auto_518953 ?auto_518956 ) ) ( not ( = ?auto_518953 ?auto_518957 ) ) ( not ( = ?auto_518953 ?auto_518958 ) ) ( not ( = ?auto_518954 ?auto_518955 ) ) ( not ( = ?auto_518954 ?auto_518956 ) ) ( not ( = ?auto_518954 ?auto_518957 ) ) ( not ( = ?auto_518954 ?auto_518958 ) ) ( not ( = ?auto_518955 ?auto_518956 ) ) ( not ( = ?auto_518955 ?auto_518957 ) ) ( not ( = ?auto_518955 ?auto_518958 ) ) ( not ( = ?auto_518956 ?auto_518957 ) ) ( not ( = ?auto_518956 ?auto_518958 ) ) ( not ( = ?auto_518957 ?auto_518958 ) ) ( ON ?auto_518956 ?auto_518957 ) ( ON ?auto_518955 ?auto_518956 ) ( ON ?auto_518954 ?auto_518955 ) ( ON ?auto_518953 ?auto_518954 ) ( ON ?auto_518952 ?auto_518953 ) ( CLEAR ?auto_518950 ) ( ON ?auto_518951 ?auto_518952 ) ( CLEAR ?auto_518951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_518944 ?auto_518945 ?auto_518946 ?auto_518947 ?auto_518948 ?auto_518949 ?auto_518950 ?auto_518951 )
      ( MAKE-14PILE ?auto_518944 ?auto_518945 ?auto_518946 ?auto_518947 ?auto_518948 ?auto_518949 ?auto_518950 ?auto_518951 ?auto_518952 ?auto_518953 ?auto_518954 ?auto_518955 ?auto_518956 ?auto_518957 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_519002 - BLOCK
      ?auto_519003 - BLOCK
      ?auto_519004 - BLOCK
      ?auto_519005 - BLOCK
      ?auto_519006 - BLOCK
      ?auto_519007 - BLOCK
      ?auto_519008 - BLOCK
      ?auto_519009 - BLOCK
      ?auto_519010 - BLOCK
      ?auto_519011 - BLOCK
      ?auto_519012 - BLOCK
      ?auto_519013 - BLOCK
      ?auto_519014 - BLOCK
      ?auto_519015 - BLOCK
    )
    :vars
    (
      ?auto_519016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519015 ?auto_519016 ) ( ON-TABLE ?auto_519002 ) ( ON ?auto_519003 ?auto_519002 ) ( ON ?auto_519004 ?auto_519003 ) ( ON ?auto_519005 ?auto_519004 ) ( ON ?auto_519006 ?auto_519005 ) ( ON ?auto_519007 ?auto_519006 ) ( not ( = ?auto_519002 ?auto_519003 ) ) ( not ( = ?auto_519002 ?auto_519004 ) ) ( not ( = ?auto_519002 ?auto_519005 ) ) ( not ( = ?auto_519002 ?auto_519006 ) ) ( not ( = ?auto_519002 ?auto_519007 ) ) ( not ( = ?auto_519002 ?auto_519008 ) ) ( not ( = ?auto_519002 ?auto_519009 ) ) ( not ( = ?auto_519002 ?auto_519010 ) ) ( not ( = ?auto_519002 ?auto_519011 ) ) ( not ( = ?auto_519002 ?auto_519012 ) ) ( not ( = ?auto_519002 ?auto_519013 ) ) ( not ( = ?auto_519002 ?auto_519014 ) ) ( not ( = ?auto_519002 ?auto_519015 ) ) ( not ( = ?auto_519002 ?auto_519016 ) ) ( not ( = ?auto_519003 ?auto_519004 ) ) ( not ( = ?auto_519003 ?auto_519005 ) ) ( not ( = ?auto_519003 ?auto_519006 ) ) ( not ( = ?auto_519003 ?auto_519007 ) ) ( not ( = ?auto_519003 ?auto_519008 ) ) ( not ( = ?auto_519003 ?auto_519009 ) ) ( not ( = ?auto_519003 ?auto_519010 ) ) ( not ( = ?auto_519003 ?auto_519011 ) ) ( not ( = ?auto_519003 ?auto_519012 ) ) ( not ( = ?auto_519003 ?auto_519013 ) ) ( not ( = ?auto_519003 ?auto_519014 ) ) ( not ( = ?auto_519003 ?auto_519015 ) ) ( not ( = ?auto_519003 ?auto_519016 ) ) ( not ( = ?auto_519004 ?auto_519005 ) ) ( not ( = ?auto_519004 ?auto_519006 ) ) ( not ( = ?auto_519004 ?auto_519007 ) ) ( not ( = ?auto_519004 ?auto_519008 ) ) ( not ( = ?auto_519004 ?auto_519009 ) ) ( not ( = ?auto_519004 ?auto_519010 ) ) ( not ( = ?auto_519004 ?auto_519011 ) ) ( not ( = ?auto_519004 ?auto_519012 ) ) ( not ( = ?auto_519004 ?auto_519013 ) ) ( not ( = ?auto_519004 ?auto_519014 ) ) ( not ( = ?auto_519004 ?auto_519015 ) ) ( not ( = ?auto_519004 ?auto_519016 ) ) ( not ( = ?auto_519005 ?auto_519006 ) ) ( not ( = ?auto_519005 ?auto_519007 ) ) ( not ( = ?auto_519005 ?auto_519008 ) ) ( not ( = ?auto_519005 ?auto_519009 ) ) ( not ( = ?auto_519005 ?auto_519010 ) ) ( not ( = ?auto_519005 ?auto_519011 ) ) ( not ( = ?auto_519005 ?auto_519012 ) ) ( not ( = ?auto_519005 ?auto_519013 ) ) ( not ( = ?auto_519005 ?auto_519014 ) ) ( not ( = ?auto_519005 ?auto_519015 ) ) ( not ( = ?auto_519005 ?auto_519016 ) ) ( not ( = ?auto_519006 ?auto_519007 ) ) ( not ( = ?auto_519006 ?auto_519008 ) ) ( not ( = ?auto_519006 ?auto_519009 ) ) ( not ( = ?auto_519006 ?auto_519010 ) ) ( not ( = ?auto_519006 ?auto_519011 ) ) ( not ( = ?auto_519006 ?auto_519012 ) ) ( not ( = ?auto_519006 ?auto_519013 ) ) ( not ( = ?auto_519006 ?auto_519014 ) ) ( not ( = ?auto_519006 ?auto_519015 ) ) ( not ( = ?auto_519006 ?auto_519016 ) ) ( not ( = ?auto_519007 ?auto_519008 ) ) ( not ( = ?auto_519007 ?auto_519009 ) ) ( not ( = ?auto_519007 ?auto_519010 ) ) ( not ( = ?auto_519007 ?auto_519011 ) ) ( not ( = ?auto_519007 ?auto_519012 ) ) ( not ( = ?auto_519007 ?auto_519013 ) ) ( not ( = ?auto_519007 ?auto_519014 ) ) ( not ( = ?auto_519007 ?auto_519015 ) ) ( not ( = ?auto_519007 ?auto_519016 ) ) ( not ( = ?auto_519008 ?auto_519009 ) ) ( not ( = ?auto_519008 ?auto_519010 ) ) ( not ( = ?auto_519008 ?auto_519011 ) ) ( not ( = ?auto_519008 ?auto_519012 ) ) ( not ( = ?auto_519008 ?auto_519013 ) ) ( not ( = ?auto_519008 ?auto_519014 ) ) ( not ( = ?auto_519008 ?auto_519015 ) ) ( not ( = ?auto_519008 ?auto_519016 ) ) ( not ( = ?auto_519009 ?auto_519010 ) ) ( not ( = ?auto_519009 ?auto_519011 ) ) ( not ( = ?auto_519009 ?auto_519012 ) ) ( not ( = ?auto_519009 ?auto_519013 ) ) ( not ( = ?auto_519009 ?auto_519014 ) ) ( not ( = ?auto_519009 ?auto_519015 ) ) ( not ( = ?auto_519009 ?auto_519016 ) ) ( not ( = ?auto_519010 ?auto_519011 ) ) ( not ( = ?auto_519010 ?auto_519012 ) ) ( not ( = ?auto_519010 ?auto_519013 ) ) ( not ( = ?auto_519010 ?auto_519014 ) ) ( not ( = ?auto_519010 ?auto_519015 ) ) ( not ( = ?auto_519010 ?auto_519016 ) ) ( not ( = ?auto_519011 ?auto_519012 ) ) ( not ( = ?auto_519011 ?auto_519013 ) ) ( not ( = ?auto_519011 ?auto_519014 ) ) ( not ( = ?auto_519011 ?auto_519015 ) ) ( not ( = ?auto_519011 ?auto_519016 ) ) ( not ( = ?auto_519012 ?auto_519013 ) ) ( not ( = ?auto_519012 ?auto_519014 ) ) ( not ( = ?auto_519012 ?auto_519015 ) ) ( not ( = ?auto_519012 ?auto_519016 ) ) ( not ( = ?auto_519013 ?auto_519014 ) ) ( not ( = ?auto_519013 ?auto_519015 ) ) ( not ( = ?auto_519013 ?auto_519016 ) ) ( not ( = ?auto_519014 ?auto_519015 ) ) ( not ( = ?auto_519014 ?auto_519016 ) ) ( not ( = ?auto_519015 ?auto_519016 ) ) ( ON ?auto_519014 ?auto_519015 ) ( ON ?auto_519013 ?auto_519014 ) ( ON ?auto_519012 ?auto_519013 ) ( ON ?auto_519011 ?auto_519012 ) ( ON ?auto_519010 ?auto_519011 ) ( ON ?auto_519009 ?auto_519010 ) ( CLEAR ?auto_519007 ) ( ON ?auto_519008 ?auto_519009 ) ( CLEAR ?auto_519008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_519002 ?auto_519003 ?auto_519004 ?auto_519005 ?auto_519006 ?auto_519007 ?auto_519008 )
      ( MAKE-14PILE ?auto_519002 ?auto_519003 ?auto_519004 ?auto_519005 ?auto_519006 ?auto_519007 ?auto_519008 ?auto_519009 ?auto_519010 ?auto_519011 ?auto_519012 ?auto_519013 ?auto_519014 ?auto_519015 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_519060 - BLOCK
      ?auto_519061 - BLOCK
      ?auto_519062 - BLOCK
      ?auto_519063 - BLOCK
      ?auto_519064 - BLOCK
      ?auto_519065 - BLOCK
      ?auto_519066 - BLOCK
      ?auto_519067 - BLOCK
      ?auto_519068 - BLOCK
      ?auto_519069 - BLOCK
      ?auto_519070 - BLOCK
      ?auto_519071 - BLOCK
      ?auto_519072 - BLOCK
      ?auto_519073 - BLOCK
    )
    :vars
    (
      ?auto_519074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519073 ?auto_519074 ) ( ON-TABLE ?auto_519060 ) ( ON ?auto_519061 ?auto_519060 ) ( ON ?auto_519062 ?auto_519061 ) ( ON ?auto_519063 ?auto_519062 ) ( ON ?auto_519064 ?auto_519063 ) ( not ( = ?auto_519060 ?auto_519061 ) ) ( not ( = ?auto_519060 ?auto_519062 ) ) ( not ( = ?auto_519060 ?auto_519063 ) ) ( not ( = ?auto_519060 ?auto_519064 ) ) ( not ( = ?auto_519060 ?auto_519065 ) ) ( not ( = ?auto_519060 ?auto_519066 ) ) ( not ( = ?auto_519060 ?auto_519067 ) ) ( not ( = ?auto_519060 ?auto_519068 ) ) ( not ( = ?auto_519060 ?auto_519069 ) ) ( not ( = ?auto_519060 ?auto_519070 ) ) ( not ( = ?auto_519060 ?auto_519071 ) ) ( not ( = ?auto_519060 ?auto_519072 ) ) ( not ( = ?auto_519060 ?auto_519073 ) ) ( not ( = ?auto_519060 ?auto_519074 ) ) ( not ( = ?auto_519061 ?auto_519062 ) ) ( not ( = ?auto_519061 ?auto_519063 ) ) ( not ( = ?auto_519061 ?auto_519064 ) ) ( not ( = ?auto_519061 ?auto_519065 ) ) ( not ( = ?auto_519061 ?auto_519066 ) ) ( not ( = ?auto_519061 ?auto_519067 ) ) ( not ( = ?auto_519061 ?auto_519068 ) ) ( not ( = ?auto_519061 ?auto_519069 ) ) ( not ( = ?auto_519061 ?auto_519070 ) ) ( not ( = ?auto_519061 ?auto_519071 ) ) ( not ( = ?auto_519061 ?auto_519072 ) ) ( not ( = ?auto_519061 ?auto_519073 ) ) ( not ( = ?auto_519061 ?auto_519074 ) ) ( not ( = ?auto_519062 ?auto_519063 ) ) ( not ( = ?auto_519062 ?auto_519064 ) ) ( not ( = ?auto_519062 ?auto_519065 ) ) ( not ( = ?auto_519062 ?auto_519066 ) ) ( not ( = ?auto_519062 ?auto_519067 ) ) ( not ( = ?auto_519062 ?auto_519068 ) ) ( not ( = ?auto_519062 ?auto_519069 ) ) ( not ( = ?auto_519062 ?auto_519070 ) ) ( not ( = ?auto_519062 ?auto_519071 ) ) ( not ( = ?auto_519062 ?auto_519072 ) ) ( not ( = ?auto_519062 ?auto_519073 ) ) ( not ( = ?auto_519062 ?auto_519074 ) ) ( not ( = ?auto_519063 ?auto_519064 ) ) ( not ( = ?auto_519063 ?auto_519065 ) ) ( not ( = ?auto_519063 ?auto_519066 ) ) ( not ( = ?auto_519063 ?auto_519067 ) ) ( not ( = ?auto_519063 ?auto_519068 ) ) ( not ( = ?auto_519063 ?auto_519069 ) ) ( not ( = ?auto_519063 ?auto_519070 ) ) ( not ( = ?auto_519063 ?auto_519071 ) ) ( not ( = ?auto_519063 ?auto_519072 ) ) ( not ( = ?auto_519063 ?auto_519073 ) ) ( not ( = ?auto_519063 ?auto_519074 ) ) ( not ( = ?auto_519064 ?auto_519065 ) ) ( not ( = ?auto_519064 ?auto_519066 ) ) ( not ( = ?auto_519064 ?auto_519067 ) ) ( not ( = ?auto_519064 ?auto_519068 ) ) ( not ( = ?auto_519064 ?auto_519069 ) ) ( not ( = ?auto_519064 ?auto_519070 ) ) ( not ( = ?auto_519064 ?auto_519071 ) ) ( not ( = ?auto_519064 ?auto_519072 ) ) ( not ( = ?auto_519064 ?auto_519073 ) ) ( not ( = ?auto_519064 ?auto_519074 ) ) ( not ( = ?auto_519065 ?auto_519066 ) ) ( not ( = ?auto_519065 ?auto_519067 ) ) ( not ( = ?auto_519065 ?auto_519068 ) ) ( not ( = ?auto_519065 ?auto_519069 ) ) ( not ( = ?auto_519065 ?auto_519070 ) ) ( not ( = ?auto_519065 ?auto_519071 ) ) ( not ( = ?auto_519065 ?auto_519072 ) ) ( not ( = ?auto_519065 ?auto_519073 ) ) ( not ( = ?auto_519065 ?auto_519074 ) ) ( not ( = ?auto_519066 ?auto_519067 ) ) ( not ( = ?auto_519066 ?auto_519068 ) ) ( not ( = ?auto_519066 ?auto_519069 ) ) ( not ( = ?auto_519066 ?auto_519070 ) ) ( not ( = ?auto_519066 ?auto_519071 ) ) ( not ( = ?auto_519066 ?auto_519072 ) ) ( not ( = ?auto_519066 ?auto_519073 ) ) ( not ( = ?auto_519066 ?auto_519074 ) ) ( not ( = ?auto_519067 ?auto_519068 ) ) ( not ( = ?auto_519067 ?auto_519069 ) ) ( not ( = ?auto_519067 ?auto_519070 ) ) ( not ( = ?auto_519067 ?auto_519071 ) ) ( not ( = ?auto_519067 ?auto_519072 ) ) ( not ( = ?auto_519067 ?auto_519073 ) ) ( not ( = ?auto_519067 ?auto_519074 ) ) ( not ( = ?auto_519068 ?auto_519069 ) ) ( not ( = ?auto_519068 ?auto_519070 ) ) ( not ( = ?auto_519068 ?auto_519071 ) ) ( not ( = ?auto_519068 ?auto_519072 ) ) ( not ( = ?auto_519068 ?auto_519073 ) ) ( not ( = ?auto_519068 ?auto_519074 ) ) ( not ( = ?auto_519069 ?auto_519070 ) ) ( not ( = ?auto_519069 ?auto_519071 ) ) ( not ( = ?auto_519069 ?auto_519072 ) ) ( not ( = ?auto_519069 ?auto_519073 ) ) ( not ( = ?auto_519069 ?auto_519074 ) ) ( not ( = ?auto_519070 ?auto_519071 ) ) ( not ( = ?auto_519070 ?auto_519072 ) ) ( not ( = ?auto_519070 ?auto_519073 ) ) ( not ( = ?auto_519070 ?auto_519074 ) ) ( not ( = ?auto_519071 ?auto_519072 ) ) ( not ( = ?auto_519071 ?auto_519073 ) ) ( not ( = ?auto_519071 ?auto_519074 ) ) ( not ( = ?auto_519072 ?auto_519073 ) ) ( not ( = ?auto_519072 ?auto_519074 ) ) ( not ( = ?auto_519073 ?auto_519074 ) ) ( ON ?auto_519072 ?auto_519073 ) ( ON ?auto_519071 ?auto_519072 ) ( ON ?auto_519070 ?auto_519071 ) ( ON ?auto_519069 ?auto_519070 ) ( ON ?auto_519068 ?auto_519069 ) ( ON ?auto_519067 ?auto_519068 ) ( ON ?auto_519066 ?auto_519067 ) ( CLEAR ?auto_519064 ) ( ON ?auto_519065 ?auto_519066 ) ( CLEAR ?auto_519065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_519060 ?auto_519061 ?auto_519062 ?auto_519063 ?auto_519064 ?auto_519065 )
      ( MAKE-14PILE ?auto_519060 ?auto_519061 ?auto_519062 ?auto_519063 ?auto_519064 ?auto_519065 ?auto_519066 ?auto_519067 ?auto_519068 ?auto_519069 ?auto_519070 ?auto_519071 ?auto_519072 ?auto_519073 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_519118 - BLOCK
      ?auto_519119 - BLOCK
      ?auto_519120 - BLOCK
      ?auto_519121 - BLOCK
      ?auto_519122 - BLOCK
      ?auto_519123 - BLOCK
      ?auto_519124 - BLOCK
      ?auto_519125 - BLOCK
      ?auto_519126 - BLOCK
      ?auto_519127 - BLOCK
      ?auto_519128 - BLOCK
      ?auto_519129 - BLOCK
      ?auto_519130 - BLOCK
      ?auto_519131 - BLOCK
    )
    :vars
    (
      ?auto_519132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519131 ?auto_519132 ) ( ON-TABLE ?auto_519118 ) ( ON ?auto_519119 ?auto_519118 ) ( ON ?auto_519120 ?auto_519119 ) ( ON ?auto_519121 ?auto_519120 ) ( not ( = ?auto_519118 ?auto_519119 ) ) ( not ( = ?auto_519118 ?auto_519120 ) ) ( not ( = ?auto_519118 ?auto_519121 ) ) ( not ( = ?auto_519118 ?auto_519122 ) ) ( not ( = ?auto_519118 ?auto_519123 ) ) ( not ( = ?auto_519118 ?auto_519124 ) ) ( not ( = ?auto_519118 ?auto_519125 ) ) ( not ( = ?auto_519118 ?auto_519126 ) ) ( not ( = ?auto_519118 ?auto_519127 ) ) ( not ( = ?auto_519118 ?auto_519128 ) ) ( not ( = ?auto_519118 ?auto_519129 ) ) ( not ( = ?auto_519118 ?auto_519130 ) ) ( not ( = ?auto_519118 ?auto_519131 ) ) ( not ( = ?auto_519118 ?auto_519132 ) ) ( not ( = ?auto_519119 ?auto_519120 ) ) ( not ( = ?auto_519119 ?auto_519121 ) ) ( not ( = ?auto_519119 ?auto_519122 ) ) ( not ( = ?auto_519119 ?auto_519123 ) ) ( not ( = ?auto_519119 ?auto_519124 ) ) ( not ( = ?auto_519119 ?auto_519125 ) ) ( not ( = ?auto_519119 ?auto_519126 ) ) ( not ( = ?auto_519119 ?auto_519127 ) ) ( not ( = ?auto_519119 ?auto_519128 ) ) ( not ( = ?auto_519119 ?auto_519129 ) ) ( not ( = ?auto_519119 ?auto_519130 ) ) ( not ( = ?auto_519119 ?auto_519131 ) ) ( not ( = ?auto_519119 ?auto_519132 ) ) ( not ( = ?auto_519120 ?auto_519121 ) ) ( not ( = ?auto_519120 ?auto_519122 ) ) ( not ( = ?auto_519120 ?auto_519123 ) ) ( not ( = ?auto_519120 ?auto_519124 ) ) ( not ( = ?auto_519120 ?auto_519125 ) ) ( not ( = ?auto_519120 ?auto_519126 ) ) ( not ( = ?auto_519120 ?auto_519127 ) ) ( not ( = ?auto_519120 ?auto_519128 ) ) ( not ( = ?auto_519120 ?auto_519129 ) ) ( not ( = ?auto_519120 ?auto_519130 ) ) ( not ( = ?auto_519120 ?auto_519131 ) ) ( not ( = ?auto_519120 ?auto_519132 ) ) ( not ( = ?auto_519121 ?auto_519122 ) ) ( not ( = ?auto_519121 ?auto_519123 ) ) ( not ( = ?auto_519121 ?auto_519124 ) ) ( not ( = ?auto_519121 ?auto_519125 ) ) ( not ( = ?auto_519121 ?auto_519126 ) ) ( not ( = ?auto_519121 ?auto_519127 ) ) ( not ( = ?auto_519121 ?auto_519128 ) ) ( not ( = ?auto_519121 ?auto_519129 ) ) ( not ( = ?auto_519121 ?auto_519130 ) ) ( not ( = ?auto_519121 ?auto_519131 ) ) ( not ( = ?auto_519121 ?auto_519132 ) ) ( not ( = ?auto_519122 ?auto_519123 ) ) ( not ( = ?auto_519122 ?auto_519124 ) ) ( not ( = ?auto_519122 ?auto_519125 ) ) ( not ( = ?auto_519122 ?auto_519126 ) ) ( not ( = ?auto_519122 ?auto_519127 ) ) ( not ( = ?auto_519122 ?auto_519128 ) ) ( not ( = ?auto_519122 ?auto_519129 ) ) ( not ( = ?auto_519122 ?auto_519130 ) ) ( not ( = ?auto_519122 ?auto_519131 ) ) ( not ( = ?auto_519122 ?auto_519132 ) ) ( not ( = ?auto_519123 ?auto_519124 ) ) ( not ( = ?auto_519123 ?auto_519125 ) ) ( not ( = ?auto_519123 ?auto_519126 ) ) ( not ( = ?auto_519123 ?auto_519127 ) ) ( not ( = ?auto_519123 ?auto_519128 ) ) ( not ( = ?auto_519123 ?auto_519129 ) ) ( not ( = ?auto_519123 ?auto_519130 ) ) ( not ( = ?auto_519123 ?auto_519131 ) ) ( not ( = ?auto_519123 ?auto_519132 ) ) ( not ( = ?auto_519124 ?auto_519125 ) ) ( not ( = ?auto_519124 ?auto_519126 ) ) ( not ( = ?auto_519124 ?auto_519127 ) ) ( not ( = ?auto_519124 ?auto_519128 ) ) ( not ( = ?auto_519124 ?auto_519129 ) ) ( not ( = ?auto_519124 ?auto_519130 ) ) ( not ( = ?auto_519124 ?auto_519131 ) ) ( not ( = ?auto_519124 ?auto_519132 ) ) ( not ( = ?auto_519125 ?auto_519126 ) ) ( not ( = ?auto_519125 ?auto_519127 ) ) ( not ( = ?auto_519125 ?auto_519128 ) ) ( not ( = ?auto_519125 ?auto_519129 ) ) ( not ( = ?auto_519125 ?auto_519130 ) ) ( not ( = ?auto_519125 ?auto_519131 ) ) ( not ( = ?auto_519125 ?auto_519132 ) ) ( not ( = ?auto_519126 ?auto_519127 ) ) ( not ( = ?auto_519126 ?auto_519128 ) ) ( not ( = ?auto_519126 ?auto_519129 ) ) ( not ( = ?auto_519126 ?auto_519130 ) ) ( not ( = ?auto_519126 ?auto_519131 ) ) ( not ( = ?auto_519126 ?auto_519132 ) ) ( not ( = ?auto_519127 ?auto_519128 ) ) ( not ( = ?auto_519127 ?auto_519129 ) ) ( not ( = ?auto_519127 ?auto_519130 ) ) ( not ( = ?auto_519127 ?auto_519131 ) ) ( not ( = ?auto_519127 ?auto_519132 ) ) ( not ( = ?auto_519128 ?auto_519129 ) ) ( not ( = ?auto_519128 ?auto_519130 ) ) ( not ( = ?auto_519128 ?auto_519131 ) ) ( not ( = ?auto_519128 ?auto_519132 ) ) ( not ( = ?auto_519129 ?auto_519130 ) ) ( not ( = ?auto_519129 ?auto_519131 ) ) ( not ( = ?auto_519129 ?auto_519132 ) ) ( not ( = ?auto_519130 ?auto_519131 ) ) ( not ( = ?auto_519130 ?auto_519132 ) ) ( not ( = ?auto_519131 ?auto_519132 ) ) ( ON ?auto_519130 ?auto_519131 ) ( ON ?auto_519129 ?auto_519130 ) ( ON ?auto_519128 ?auto_519129 ) ( ON ?auto_519127 ?auto_519128 ) ( ON ?auto_519126 ?auto_519127 ) ( ON ?auto_519125 ?auto_519126 ) ( ON ?auto_519124 ?auto_519125 ) ( ON ?auto_519123 ?auto_519124 ) ( CLEAR ?auto_519121 ) ( ON ?auto_519122 ?auto_519123 ) ( CLEAR ?auto_519122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_519118 ?auto_519119 ?auto_519120 ?auto_519121 ?auto_519122 )
      ( MAKE-14PILE ?auto_519118 ?auto_519119 ?auto_519120 ?auto_519121 ?auto_519122 ?auto_519123 ?auto_519124 ?auto_519125 ?auto_519126 ?auto_519127 ?auto_519128 ?auto_519129 ?auto_519130 ?auto_519131 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_519176 - BLOCK
      ?auto_519177 - BLOCK
      ?auto_519178 - BLOCK
      ?auto_519179 - BLOCK
      ?auto_519180 - BLOCK
      ?auto_519181 - BLOCK
      ?auto_519182 - BLOCK
      ?auto_519183 - BLOCK
      ?auto_519184 - BLOCK
      ?auto_519185 - BLOCK
      ?auto_519186 - BLOCK
      ?auto_519187 - BLOCK
      ?auto_519188 - BLOCK
      ?auto_519189 - BLOCK
    )
    :vars
    (
      ?auto_519190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519189 ?auto_519190 ) ( ON-TABLE ?auto_519176 ) ( ON ?auto_519177 ?auto_519176 ) ( ON ?auto_519178 ?auto_519177 ) ( not ( = ?auto_519176 ?auto_519177 ) ) ( not ( = ?auto_519176 ?auto_519178 ) ) ( not ( = ?auto_519176 ?auto_519179 ) ) ( not ( = ?auto_519176 ?auto_519180 ) ) ( not ( = ?auto_519176 ?auto_519181 ) ) ( not ( = ?auto_519176 ?auto_519182 ) ) ( not ( = ?auto_519176 ?auto_519183 ) ) ( not ( = ?auto_519176 ?auto_519184 ) ) ( not ( = ?auto_519176 ?auto_519185 ) ) ( not ( = ?auto_519176 ?auto_519186 ) ) ( not ( = ?auto_519176 ?auto_519187 ) ) ( not ( = ?auto_519176 ?auto_519188 ) ) ( not ( = ?auto_519176 ?auto_519189 ) ) ( not ( = ?auto_519176 ?auto_519190 ) ) ( not ( = ?auto_519177 ?auto_519178 ) ) ( not ( = ?auto_519177 ?auto_519179 ) ) ( not ( = ?auto_519177 ?auto_519180 ) ) ( not ( = ?auto_519177 ?auto_519181 ) ) ( not ( = ?auto_519177 ?auto_519182 ) ) ( not ( = ?auto_519177 ?auto_519183 ) ) ( not ( = ?auto_519177 ?auto_519184 ) ) ( not ( = ?auto_519177 ?auto_519185 ) ) ( not ( = ?auto_519177 ?auto_519186 ) ) ( not ( = ?auto_519177 ?auto_519187 ) ) ( not ( = ?auto_519177 ?auto_519188 ) ) ( not ( = ?auto_519177 ?auto_519189 ) ) ( not ( = ?auto_519177 ?auto_519190 ) ) ( not ( = ?auto_519178 ?auto_519179 ) ) ( not ( = ?auto_519178 ?auto_519180 ) ) ( not ( = ?auto_519178 ?auto_519181 ) ) ( not ( = ?auto_519178 ?auto_519182 ) ) ( not ( = ?auto_519178 ?auto_519183 ) ) ( not ( = ?auto_519178 ?auto_519184 ) ) ( not ( = ?auto_519178 ?auto_519185 ) ) ( not ( = ?auto_519178 ?auto_519186 ) ) ( not ( = ?auto_519178 ?auto_519187 ) ) ( not ( = ?auto_519178 ?auto_519188 ) ) ( not ( = ?auto_519178 ?auto_519189 ) ) ( not ( = ?auto_519178 ?auto_519190 ) ) ( not ( = ?auto_519179 ?auto_519180 ) ) ( not ( = ?auto_519179 ?auto_519181 ) ) ( not ( = ?auto_519179 ?auto_519182 ) ) ( not ( = ?auto_519179 ?auto_519183 ) ) ( not ( = ?auto_519179 ?auto_519184 ) ) ( not ( = ?auto_519179 ?auto_519185 ) ) ( not ( = ?auto_519179 ?auto_519186 ) ) ( not ( = ?auto_519179 ?auto_519187 ) ) ( not ( = ?auto_519179 ?auto_519188 ) ) ( not ( = ?auto_519179 ?auto_519189 ) ) ( not ( = ?auto_519179 ?auto_519190 ) ) ( not ( = ?auto_519180 ?auto_519181 ) ) ( not ( = ?auto_519180 ?auto_519182 ) ) ( not ( = ?auto_519180 ?auto_519183 ) ) ( not ( = ?auto_519180 ?auto_519184 ) ) ( not ( = ?auto_519180 ?auto_519185 ) ) ( not ( = ?auto_519180 ?auto_519186 ) ) ( not ( = ?auto_519180 ?auto_519187 ) ) ( not ( = ?auto_519180 ?auto_519188 ) ) ( not ( = ?auto_519180 ?auto_519189 ) ) ( not ( = ?auto_519180 ?auto_519190 ) ) ( not ( = ?auto_519181 ?auto_519182 ) ) ( not ( = ?auto_519181 ?auto_519183 ) ) ( not ( = ?auto_519181 ?auto_519184 ) ) ( not ( = ?auto_519181 ?auto_519185 ) ) ( not ( = ?auto_519181 ?auto_519186 ) ) ( not ( = ?auto_519181 ?auto_519187 ) ) ( not ( = ?auto_519181 ?auto_519188 ) ) ( not ( = ?auto_519181 ?auto_519189 ) ) ( not ( = ?auto_519181 ?auto_519190 ) ) ( not ( = ?auto_519182 ?auto_519183 ) ) ( not ( = ?auto_519182 ?auto_519184 ) ) ( not ( = ?auto_519182 ?auto_519185 ) ) ( not ( = ?auto_519182 ?auto_519186 ) ) ( not ( = ?auto_519182 ?auto_519187 ) ) ( not ( = ?auto_519182 ?auto_519188 ) ) ( not ( = ?auto_519182 ?auto_519189 ) ) ( not ( = ?auto_519182 ?auto_519190 ) ) ( not ( = ?auto_519183 ?auto_519184 ) ) ( not ( = ?auto_519183 ?auto_519185 ) ) ( not ( = ?auto_519183 ?auto_519186 ) ) ( not ( = ?auto_519183 ?auto_519187 ) ) ( not ( = ?auto_519183 ?auto_519188 ) ) ( not ( = ?auto_519183 ?auto_519189 ) ) ( not ( = ?auto_519183 ?auto_519190 ) ) ( not ( = ?auto_519184 ?auto_519185 ) ) ( not ( = ?auto_519184 ?auto_519186 ) ) ( not ( = ?auto_519184 ?auto_519187 ) ) ( not ( = ?auto_519184 ?auto_519188 ) ) ( not ( = ?auto_519184 ?auto_519189 ) ) ( not ( = ?auto_519184 ?auto_519190 ) ) ( not ( = ?auto_519185 ?auto_519186 ) ) ( not ( = ?auto_519185 ?auto_519187 ) ) ( not ( = ?auto_519185 ?auto_519188 ) ) ( not ( = ?auto_519185 ?auto_519189 ) ) ( not ( = ?auto_519185 ?auto_519190 ) ) ( not ( = ?auto_519186 ?auto_519187 ) ) ( not ( = ?auto_519186 ?auto_519188 ) ) ( not ( = ?auto_519186 ?auto_519189 ) ) ( not ( = ?auto_519186 ?auto_519190 ) ) ( not ( = ?auto_519187 ?auto_519188 ) ) ( not ( = ?auto_519187 ?auto_519189 ) ) ( not ( = ?auto_519187 ?auto_519190 ) ) ( not ( = ?auto_519188 ?auto_519189 ) ) ( not ( = ?auto_519188 ?auto_519190 ) ) ( not ( = ?auto_519189 ?auto_519190 ) ) ( ON ?auto_519188 ?auto_519189 ) ( ON ?auto_519187 ?auto_519188 ) ( ON ?auto_519186 ?auto_519187 ) ( ON ?auto_519185 ?auto_519186 ) ( ON ?auto_519184 ?auto_519185 ) ( ON ?auto_519183 ?auto_519184 ) ( ON ?auto_519182 ?auto_519183 ) ( ON ?auto_519181 ?auto_519182 ) ( ON ?auto_519180 ?auto_519181 ) ( CLEAR ?auto_519178 ) ( ON ?auto_519179 ?auto_519180 ) ( CLEAR ?auto_519179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_519176 ?auto_519177 ?auto_519178 ?auto_519179 )
      ( MAKE-14PILE ?auto_519176 ?auto_519177 ?auto_519178 ?auto_519179 ?auto_519180 ?auto_519181 ?auto_519182 ?auto_519183 ?auto_519184 ?auto_519185 ?auto_519186 ?auto_519187 ?auto_519188 ?auto_519189 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_519234 - BLOCK
      ?auto_519235 - BLOCK
      ?auto_519236 - BLOCK
      ?auto_519237 - BLOCK
      ?auto_519238 - BLOCK
      ?auto_519239 - BLOCK
      ?auto_519240 - BLOCK
      ?auto_519241 - BLOCK
      ?auto_519242 - BLOCK
      ?auto_519243 - BLOCK
      ?auto_519244 - BLOCK
      ?auto_519245 - BLOCK
      ?auto_519246 - BLOCK
      ?auto_519247 - BLOCK
    )
    :vars
    (
      ?auto_519248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519247 ?auto_519248 ) ( ON-TABLE ?auto_519234 ) ( ON ?auto_519235 ?auto_519234 ) ( not ( = ?auto_519234 ?auto_519235 ) ) ( not ( = ?auto_519234 ?auto_519236 ) ) ( not ( = ?auto_519234 ?auto_519237 ) ) ( not ( = ?auto_519234 ?auto_519238 ) ) ( not ( = ?auto_519234 ?auto_519239 ) ) ( not ( = ?auto_519234 ?auto_519240 ) ) ( not ( = ?auto_519234 ?auto_519241 ) ) ( not ( = ?auto_519234 ?auto_519242 ) ) ( not ( = ?auto_519234 ?auto_519243 ) ) ( not ( = ?auto_519234 ?auto_519244 ) ) ( not ( = ?auto_519234 ?auto_519245 ) ) ( not ( = ?auto_519234 ?auto_519246 ) ) ( not ( = ?auto_519234 ?auto_519247 ) ) ( not ( = ?auto_519234 ?auto_519248 ) ) ( not ( = ?auto_519235 ?auto_519236 ) ) ( not ( = ?auto_519235 ?auto_519237 ) ) ( not ( = ?auto_519235 ?auto_519238 ) ) ( not ( = ?auto_519235 ?auto_519239 ) ) ( not ( = ?auto_519235 ?auto_519240 ) ) ( not ( = ?auto_519235 ?auto_519241 ) ) ( not ( = ?auto_519235 ?auto_519242 ) ) ( not ( = ?auto_519235 ?auto_519243 ) ) ( not ( = ?auto_519235 ?auto_519244 ) ) ( not ( = ?auto_519235 ?auto_519245 ) ) ( not ( = ?auto_519235 ?auto_519246 ) ) ( not ( = ?auto_519235 ?auto_519247 ) ) ( not ( = ?auto_519235 ?auto_519248 ) ) ( not ( = ?auto_519236 ?auto_519237 ) ) ( not ( = ?auto_519236 ?auto_519238 ) ) ( not ( = ?auto_519236 ?auto_519239 ) ) ( not ( = ?auto_519236 ?auto_519240 ) ) ( not ( = ?auto_519236 ?auto_519241 ) ) ( not ( = ?auto_519236 ?auto_519242 ) ) ( not ( = ?auto_519236 ?auto_519243 ) ) ( not ( = ?auto_519236 ?auto_519244 ) ) ( not ( = ?auto_519236 ?auto_519245 ) ) ( not ( = ?auto_519236 ?auto_519246 ) ) ( not ( = ?auto_519236 ?auto_519247 ) ) ( not ( = ?auto_519236 ?auto_519248 ) ) ( not ( = ?auto_519237 ?auto_519238 ) ) ( not ( = ?auto_519237 ?auto_519239 ) ) ( not ( = ?auto_519237 ?auto_519240 ) ) ( not ( = ?auto_519237 ?auto_519241 ) ) ( not ( = ?auto_519237 ?auto_519242 ) ) ( not ( = ?auto_519237 ?auto_519243 ) ) ( not ( = ?auto_519237 ?auto_519244 ) ) ( not ( = ?auto_519237 ?auto_519245 ) ) ( not ( = ?auto_519237 ?auto_519246 ) ) ( not ( = ?auto_519237 ?auto_519247 ) ) ( not ( = ?auto_519237 ?auto_519248 ) ) ( not ( = ?auto_519238 ?auto_519239 ) ) ( not ( = ?auto_519238 ?auto_519240 ) ) ( not ( = ?auto_519238 ?auto_519241 ) ) ( not ( = ?auto_519238 ?auto_519242 ) ) ( not ( = ?auto_519238 ?auto_519243 ) ) ( not ( = ?auto_519238 ?auto_519244 ) ) ( not ( = ?auto_519238 ?auto_519245 ) ) ( not ( = ?auto_519238 ?auto_519246 ) ) ( not ( = ?auto_519238 ?auto_519247 ) ) ( not ( = ?auto_519238 ?auto_519248 ) ) ( not ( = ?auto_519239 ?auto_519240 ) ) ( not ( = ?auto_519239 ?auto_519241 ) ) ( not ( = ?auto_519239 ?auto_519242 ) ) ( not ( = ?auto_519239 ?auto_519243 ) ) ( not ( = ?auto_519239 ?auto_519244 ) ) ( not ( = ?auto_519239 ?auto_519245 ) ) ( not ( = ?auto_519239 ?auto_519246 ) ) ( not ( = ?auto_519239 ?auto_519247 ) ) ( not ( = ?auto_519239 ?auto_519248 ) ) ( not ( = ?auto_519240 ?auto_519241 ) ) ( not ( = ?auto_519240 ?auto_519242 ) ) ( not ( = ?auto_519240 ?auto_519243 ) ) ( not ( = ?auto_519240 ?auto_519244 ) ) ( not ( = ?auto_519240 ?auto_519245 ) ) ( not ( = ?auto_519240 ?auto_519246 ) ) ( not ( = ?auto_519240 ?auto_519247 ) ) ( not ( = ?auto_519240 ?auto_519248 ) ) ( not ( = ?auto_519241 ?auto_519242 ) ) ( not ( = ?auto_519241 ?auto_519243 ) ) ( not ( = ?auto_519241 ?auto_519244 ) ) ( not ( = ?auto_519241 ?auto_519245 ) ) ( not ( = ?auto_519241 ?auto_519246 ) ) ( not ( = ?auto_519241 ?auto_519247 ) ) ( not ( = ?auto_519241 ?auto_519248 ) ) ( not ( = ?auto_519242 ?auto_519243 ) ) ( not ( = ?auto_519242 ?auto_519244 ) ) ( not ( = ?auto_519242 ?auto_519245 ) ) ( not ( = ?auto_519242 ?auto_519246 ) ) ( not ( = ?auto_519242 ?auto_519247 ) ) ( not ( = ?auto_519242 ?auto_519248 ) ) ( not ( = ?auto_519243 ?auto_519244 ) ) ( not ( = ?auto_519243 ?auto_519245 ) ) ( not ( = ?auto_519243 ?auto_519246 ) ) ( not ( = ?auto_519243 ?auto_519247 ) ) ( not ( = ?auto_519243 ?auto_519248 ) ) ( not ( = ?auto_519244 ?auto_519245 ) ) ( not ( = ?auto_519244 ?auto_519246 ) ) ( not ( = ?auto_519244 ?auto_519247 ) ) ( not ( = ?auto_519244 ?auto_519248 ) ) ( not ( = ?auto_519245 ?auto_519246 ) ) ( not ( = ?auto_519245 ?auto_519247 ) ) ( not ( = ?auto_519245 ?auto_519248 ) ) ( not ( = ?auto_519246 ?auto_519247 ) ) ( not ( = ?auto_519246 ?auto_519248 ) ) ( not ( = ?auto_519247 ?auto_519248 ) ) ( ON ?auto_519246 ?auto_519247 ) ( ON ?auto_519245 ?auto_519246 ) ( ON ?auto_519244 ?auto_519245 ) ( ON ?auto_519243 ?auto_519244 ) ( ON ?auto_519242 ?auto_519243 ) ( ON ?auto_519241 ?auto_519242 ) ( ON ?auto_519240 ?auto_519241 ) ( ON ?auto_519239 ?auto_519240 ) ( ON ?auto_519238 ?auto_519239 ) ( ON ?auto_519237 ?auto_519238 ) ( CLEAR ?auto_519235 ) ( ON ?auto_519236 ?auto_519237 ) ( CLEAR ?auto_519236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_519234 ?auto_519235 ?auto_519236 )
      ( MAKE-14PILE ?auto_519234 ?auto_519235 ?auto_519236 ?auto_519237 ?auto_519238 ?auto_519239 ?auto_519240 ?auto_519241 ?auto_519242 ?auto_519243 ?auto_519244 ?auto_519245 ?auto_519246 ?auto_519247 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_519292 - BLOCK
      ?auto_519293 - BLOCK
      ?auto_519294 - BLOCK
      ?auto_519295 - BLOCK
      ?auto_519296 - BLOCK
      ?auto_519297 - BLOCK
      ?auto_519298 - BLOCK
      ?auto_519299 - BLOCK
      ?auto_519300 - BLOCK
      ?auto_519301 - BLOCK
      ?auto_519302 - BLOCK
      ?auto_519303 - BLOCK
      ?auto_519304 - BLOCK
      ?auto_519305 - BLOCK
    )
    :vars
    (
      ?auto_519306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519305 ?auto_519306 ) ( ON-TABLE ?auto_519292 ) ( not ( = ?auto_519292 ?auto_519293 ) ) ( not ( = ?auto_519292 ?auto_519294 ) ) ( not ( = ?auto_519292 ?auto_519295 ) ) ( not ( = ?auto_519292 ?auto_519296 ) ) ( not ( = ?auto_519292 ?auto_519297 ) ) ( not ( = ?auto_519292 ?auto_519298 ) ) ( not ( = ?auto_519292 ?auto_519299 ) ) ( not ( = ?auto_519292 ?auto_519300 ) ) ( not ( = ?auto_519292 ?auto_519301 ) ) ( not ( = ?auto_519292 ?auto_519302 ) ) ( not ( = ?auto_519292 ?auto_519303 ) ) ( not ( = ?auto_519292 ?auto_519304 ) ) ( not ( = ?auto_519292 ?auto_519305 ) ) ( not ( = ?auto_519292 ?auto_519306 ) ) ( not ( = ?auto_519293 ?auto_519294 ) ) ( not ( = ?auto_519293 ?auto_519295 ) ) ( not ( = ?auto_519293 ?auto_519296 ) ) ( not ( = ?auto_519293 ?auto_519297 ) ) ( not ( = ?auto_519293 ?auto_519298 ) ) ( not ( = ?auto_519293 ?auto_519299 ) ) ( not ( = ?auto_519293 ?auto_519300 ) ) ( not ( = ?auto_519293 ?auto_519301 ) ) ( not ( = ?auto_519293 ?auto_519302 ) ) ( not ( = ?auto_519293 ?auto_519303 ) ) ( not ( = ?auto_519293 ?auto_519304 ) ) ( not ( = ?auto_519293 ?auto_519305 ) ) ( not ( = ?auto_519293 ?auto_519306 ) ) ( not ( = ?auto_519294 ?auto_519295 ) ) ( not ( = ?auto_519294 ?auto_519296 ) ) ( not ( = ?auto_519294 ?auto_519297 ) ) ( not ( = ?auto_519294 ?auto_519298 ) ) ( not ( = ?auto_519294 ?auto_519299 ) ) ( not ( = ?auto_519294 ?auto_519300 ) ) ( not ( = ?auto_519294 ?auto_519301 ) ) ( not ( = ?auto_519294 ?auto_519302 ) ) ( not ( = ?auto_519294 ?auto_519303 ) ) ( not ( = ?auto_519294 ?auto_519304 ) ) ( not ( = ?auto_519294 ?auto_519305 ) ) ( not ( = ?auto_519294 ?auto_519306 ) ) ( not ( = ?auto_519295 ?auto_519296 ) ) ( not ( = ?auto_519295 ?auto_519297 ) ) ( not ( = ?auto_519295 ?auto_519298 ) ) ( not ( = ?auto_519295 ?auto_519299 ) ) ( not ( = ?auto_519295 ?auto_519300 ) ) ( not ( = ?auto_519295 ?auto_519301 ) ) ( not ( = ?auto_519295 ?auto_519302 ) ) ( not ( = ?auto_519295 ?auto_519303 ) ) ( not ( = ?auto_519295 ?auto_519304 ) ) ( not ( = ?auto_519295 ?auto_519305 ) ) ( not ( = ?auto_519295 ?auto_519306 ) ) ( not ( = ?auto_519296 ?auto_519297 ) ) ( not ( = ?auto_519296 ?auto_519298 ) ) ( not ( = ?auto_519296 ?auto_519299 ) ) ( not ( = ?auto_519296 ?auto_519300 ) ) ( not ( = ?auto_519296 ?auto_519301 ) ) ( not ( = ?auto_519296 ?auto_519302 ) ) ( not ( = ?auto_519296 ?auto_519303 ) ) ( not ( = ?auto_519296 ?auto_519304 ) ) ( not ( = ?auto_519296 ?auto_519305 ) ) ( not ( = ?auto_519296 ?auto_519306 ) ) ( not ( = ?auto_519297 ?auto_519298 ) ) ( not ( = ?auto_519297 ?auto_519299 ) ) ( not ( = ?auto_519297 ?auto_519300 ) ) ( not ( = ?auto_519297 ?auto_519301 ) ) ( not ( = ?auto_519297 ?auto_519302 ) ) ( not ( = ?auto_519297 ?auto_519303 ) ) ( not ( = ?auto_519297 ?auto_519304 ) ) ( not ( = ?auto_519297 ?auto_519305 ) ) ( not ( = ?auto_519297 ?auto_519306 ) ) ( not ( = ?auto_519298 ?auto_519299 ) ) ( not ( = ?auto_519298 ?auto_519300 ) ) ( not ( = ?auto_519298 ?auto_519301 ) ) ( not ( = ?auto_519298 ?auto_519302 ) ) ( not ( = ?auto_519298 ?auto_519303 ) ) ( not ( = ?auto_519298 ?auto_519304 ) ) ( not ( = ?auto_519298 ?auto_519305 ) ) ( not ( = ?auto_519298 ?auto_519306 ) ) ( not ( = ?auto_519299 ?auto_519300 ) ) ( not ( = ?auto_519299 ?auto_519301 ) ) ( not ( = ?auto_519299 ?auto_519302 ) ) ( not ( = ?auto_519299 ?auto_519303 ) ) ( not ( = ?auto_519299 ?auto_519304 ) ) ( not ( = ?auto_519299 ?auto_519305 ) ) ( not ( = ?auto_519299 ?auto_519306 ) ) ( not ( = ?auto_519300 ?auto_519301 ) ) ( not ( = ?auto_519300 ?auto_519302 ) ) ( not ( = ?auto_519300 ?auto_519303 ) ) ( not ( = ?auto_519300 ?auto_519304 ) ) ( not ( = ?auto_519300 ?auto_519305 ) ) ( not ( = ?auto_519300 ?auto_519306 ) ) ( not ( = ?auto_519301 ?auto_519302 ) ) ( not ( = ?auto_519301 ?auto_519303 ) ) ( not ( = ?auto_519301 ?auto_519304 ) ) ( not ( = ?auto_519301 ?auto_519305 ) ) ( not ( = ?auto_519301 ?auto_519306 ) ) ( not ( = ?auto_519302 ?auto_519303 ) ) ( not ( = ?auto_519302 ?auto_519304 ) ) ( not ( = ?auto_519302 ?auto_519305 ) ) ( not ( = ?auto_519302 ?auto_519306 ) ) ( not ( = ?auto_519303 ?auto_519304 ) ) ( not ( = ?auto_519303 ?auto_519305 ) ) ( not ( = ?auto_519303 ?auto_519306 ) ) ( not ( = ?auto_519304 ?auto_519305 ) ) ( not ( = ?auto_519304 ?auto_519306 ) ) ( not ( = ?auto_519305 ?auto_519306 ) ) ( ON ?auto_519304 ?auto_519305 ) ( ON ?auto_519303 ?auto_519304 ) ( ON ?auto_519302 ?auto_519303 ) ( ON ?auto_519301 ?auto_519302 ) ( ON ?auto_519300 ?auto_519301 ) ( ON ?auto_519299 ?auto_519300 ) ( ON ?auto_519298 ?auto_519299 ) ( ON ?auto_519297 ?auto_519298 ) ( ON ?auto_519296 ?auto_519297 ) ( ON ?auto_519295 ?auto_519296 ) ( ON ?auto_519294 ?auto_519295 ) ( CLEAR ?auto_519292 ) ( ON ?auto_519293 ?auto_519294 ) ( CLEAR ?auto_519293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_519292 ?auto_519293 )
      ( MAKE-14PILE ?auto_519292 ?auto_519293 ?auto_519294 ?auto_519295 ?auto_519296 ?auto_519297 ?auto_519298 ?auto_519299 ?auto_519300 ?auto_519301 ?auto_519302 ?auto_519303 ?auto_519304 ?auto_519305 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_519350 - BLOCK
      ?auto_519351 - BLOCK
      ?auto_519352 - BLOCK
      ?auto_519353 - BLOCK
      ?auto_519354 - BLOCK
      ?auto_519355 - BLOCK
      ?auto_519356 - BLOCK
      ?auto_519357 - BLOCK
      ?auto_519358 - BLOCK
      ?auto_519359 - BLOCK
      ?auto_519360 - BLOCK
      ?auto_519361 - BLOCK
      ?auto_519362 - BLOCK
      ?auto_519363 - BLOCK
    )
    :vars
    (
      ?auto_519364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519363 ?auto_519364 ) ( not ( = ?auto_519350 ?auto_519351 ) ) ( not ( = ?auto_519350 ?auto_519352 ) ) ( not ( = ?auto_519350 ?auto_519353 ) ) ( not ( = ?auto_519350 ?auto_519354 ) ) ( not ( = ?auto_519350 ?auto_519355 ) ) ( not ( = ?auto_519350 ?auto_519356 ) ) ( not ( = ?auto_519350 ?auto_519357 ) ) ( not ( = ?auto_519350 ?auto_519358 ) ) ( not ( = ?auto_519350 ?auto_519359 ) ) ( not ( = ?auto_519350 ?auto_519360 ) ) ( not ( = ?auto_519350 ?auto_519361 ) ) ( not ( = ?auto_519350 ?auto_519362 ) ) ( not ( = ?auto_519350 ?auto_519363 ) ) ( not ( = ?auto_519350 ?auto_519364 ) ) ( not ( = ?auto_519351 ?auto_519352 ) ) ( not ( = ?auto_519351 ?auto_519353 ) ) ( not ( = ?auto_519351 ?auto_519354 ) ) ( not ( = ?auto_519351 ?auto_519355 ) ) ( not ( = ?auto_519351 ?auto_519356 ) ) ( not ( = ?auto_519351 ?auto_519357 ) ) ( not ( = ?auto_519351 ?auto_519358 ) ) ( not ( = ?auto_519351 ?auto_519359 ) ) ( not ( = ?auto_519351 ?auto_519360 ) ) ( not ( = ?auto_519351 ?auto_519361 ) ) ( not ( = ?auto_519351 ?auto_519362 ) ) ( not ( = ?auto_519351 ?auto_519363 ) ) ( not ( = ?auto_519351 ?auto_519364 ) ) ( not ( = ?auto_519352 ?auto_519353 ) ) ( not ( = ?auto_519352 ?auto_519354 ) ) ( not ( = ?auto_519352 ?auto_519355 ) ) ( not ( = ?auto_519352 ?auto_519356 ) ) ( not ( = ?auto_519352 ?auto_519357 ) ) ( not ( = ?auto_519352 ?auto_519358 ) ) ( not ( = ?auto_519352 ?auto_519359 ) ) ( not ( = ?auto_519352 ?auto_519360 ) ) ( not ( = ?auto_519352 ?auto_519361 ) ) ( not ( = ?auto_519352 ?auto_519362 ) ) ( not ( = ?auto_519352 ?auto_519363 ) ) ( not ( = ?auto_519352 ?auto_519364 ) ) ( not ( = ?auto_519353 ?auto_519354 ) ) ( not ( = ?auto_519353 ?auto_519355 ) ) ( not ( = ?auto_519353 ?auto_519356 ) ) ( not ( = ?auto_519353 ?auto_519357 ) ) ( not ( = ?auto_519353 ?auto_519358 ) ) ( not ( = ?auto_519353 ?auto_519359 ) ) ( not ( = ?auto_519353 ?auto_519360 ) ) ( not ( = ?auto_519353 ?auto_519361 ) ) ( not ( = ?auto_519353 ?auto_519362 ) ) ( not ( = ?auto_519353 ?auto_519363 ) ) ( not ( = ?auto_519353 ?auto_519364 ) ) ( not ( = ?auto_519354 ?auto_519355 ) ) ( not ( = ?auto_519354 ?auto_519356 ) ) ( not ( = ?auto_519354 ?auto_519357 ) ) ( not ( = ?auto_519354 ?auto_519358 ) ) ( not ( = ?auto_519354 ?auto_519359 ) ) ( not ( = ?auto_519354 ?auto_519360 ) ) ( not ( = ?auto_519354 ?auto_519361 ) ) ( not ( = ?auto_519354 ?auto_519362 ) ) ( not ( = ?auto_519354 ?auto_519363 ) ) ( not ( = ?auto_519354 ?auto_519364 ) ) ( not ( = ?auto_519355 ?auto_519356 ) ) ( not ( = ?auto_519355 ?auto_519357 ) ) ( not ( = ?auto_519355 ?auto_519358 ) ) ( not ( = ?auto_519355 ?auto_519359 ) ) ( not ( = ?auto_519355 ?auto_519360 ) ) ( not ( = ?auto_519355 ?auto_519361 ) ) ( not ( = ?auto_519355 ?auto_519362 ) ) ( not ( = ?auto_519355 ?auto_519363 ) ) ( not ( = ?auto_519355 ?auto_519364 ) ) ( not ( = ?auto_519356 ?auto_519357 ) ) ( not ( = ?auto_519356 ?auto_519358 ) ) ( not ( = ?auto_519356 ?auto_519359 ) ) ( not ( = ?auto_519356 ?auto_519360 ) ) ( not ( = ?auto_519356 ?auto_519361 ) ) ( not ( = ?auto_519356 ?auto_519362 ) ) ( not ( = ?auto_519356 ?auto_519363 ) ) ( not ( = ?auto_519356 ?auto_519364 ) ) ( not ( = ?auto_519357 ?auto_519358 ) ) ( not ( = ?auto_519357 ?auto_519359 ) ) ( not ( = ?auto_519357 ?auto_519360 ) ) ( not ( = ?auto_519357 ?auto_519361 ) ) ( not ( = ?auto_519357 ?auto_519362 ) ) ( not ( = ?auto_519357 ?auto_519363 ) ) ( not ( = ?auto_519357 ?auto_519364 ) ) ( not ( = ?auto_519358 ?auto_519359 ) ) ( not ( = ?auto_519358 ?auto_519360 ) ) ( not ( = ?auto_519358 ?auto_519361 ) ) ( not ( = ?auto_519358 ?auto_519362 ) ) ( not ( = ?auto_519358 ?auto_519363 ) ) ( not ( = ?auto_519358 ?auto_519364 ) ) ( not ( = ?auto_519359 ?auto_519360 ) ) ( not ( = ?auto_519359 ?auto_519361 ) ) ( not ( = ?auto_519359 ?auto_519362 ) ) ( not ( = ?auto_519359 ?auto_519363 ) ) ( not ( = ?auto_519359 ?auto_519364 ) ) ( not ( = ?auto_519360 ?auto_519361 ) ) ( not ( = ?auto_519360 ?auto_519362 ) ) ( not ( = ?auto_519360 ?auto_519363 ) ) ( not ( = ?auto_519360 ?auto_519364 ) ) ( not ( = ?auto_519361 ?auto_519362 ) ) ( not ( = ?auto_519361 ?auto_519363 ) ) ( not ( = ?auto_519361 ?auto_519364 ) ) ( not ( = ?auto_519362 ?auto_519363 ) ) ( not ( = ?auto_519362 ?auto_519364 ) ) ( not ( = ?auto_519363 ?auto_519364 ) ) ( ON ?auto_519362 ?auto_519363 ) ( ON ?auto_519361 ?auto_519362 ) ( ON ?auto_519360 ?auto_519361 ) ( ON ?auto_519359 ?auto_519360 ) ( ON ?auto_519358 ?auto_519359 ) ( ON ?auto_519357 ?auto_519358 ) ( ON ?auto_519356 ?auto_519357 ) ( ON ?auto_519355 ?auto_519356 ) ( ON ?auto_519354 ?auto_519355 ) ( ON ?auto_519353 ?auto_519354 ) ( ON ?auto_519352 ?auto_519353 ) ( ON ?auto_519351 ?auto_519352 ) ( ON ?auto_519350 ?auto_519351 ) ( CLEAR ?auto_519350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_519350 )
      ( MAKE-14PILE ?auto_519350 ?auto_519351 ?auto_519352 ?auto_519353 ?auto_519354 ?auto_519355 ?auto_519356 ?auto_519357 ?auto_519358 ?auto_519359 ?auto_519360 ?auto_519361 ?auto_519362 ?auto_519363 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519409 - BLOCK
      ?auto_519410 - BLOCK
      ?auto_519411 - BLOCK
      ?auto_519412 - BLOCK
      ?auto_519413 - BLOCK
      ?auto_519414 - BLOCK
      ?auto_519415 - BLOCK
      ?auto_519416 - BLOCK
      ?auto_519417 - BLOCK
      ?auto_519418 - BLOCK
      ?auto_519419 - BLOCK
      ?auto_519420 - BLOCK
      ?auto_519421 - BLOCK
      ?auto_519422 - BLOCK
      ?auto_519423 - BLOCK
    )
    :vars
    (
      ?auto_519424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_519422 ) ( ON ?auto_519423 ?auto_519424 ) ( CLEAR ?auto_519423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_519409 ) ( ON ?auto_519410 ?auto_519409 ) ( ON ?auto_519411 ?auto_519410 ) ( ON ?auto_519412 ?auto_519411 ) ( ON ?auto_519413 ?auto_519412 ) ( ON ?auto_519414 ?auto_519413 ) ( ON ?auto_519415 ?auto_519414 ) ( ON ?auto_519416 ?auto_519415 ) ( ON ?auto_519417 ?auto_519416 ) ( ON ?auto_519418 ?auto_519417 ) ( ON ?auto_519419 ?auto_519418 ) ( ON ?auto_519420 ?auto_519419 ) ( ON ?auto_519421 ?auto_519420 ) ( ON ?auto_519422 ?auto_519421 ) ( not ( = ?auto_519409 ?auto_519410 ) ) ( not ( = ?auto_519409 ?auto_519411 ) ) ( not ( = ?auto_519409 ?auto_519412 ) ) ( not ( = ?auto_519409 ?auto_519413 ) ) ( not ( = ?auto_519409 ?auto_519414 ) ) ( not ( = ?auto_519409 ?auto_519415 ) ) ( not ( = ?auto_519409 ?auto_519416 ) ) ( not ( = ?auto_519409 ?auto_519417 ) ) ( not ( = ?auto_519409 ?auto_519418 ) ) ( not ( = ?auto_519409 ?auto_519419 ) ) ( not ( = ?auto_519409 ?auto_519420 ) ) ( not ( = ?auto_519409 ?auto_519421 ) ) ( not ( = ?auto_519409 ?auto_519422 ) ) ( not ( = ?auto_519409 ?auto_519423 ) ) ( not ( = ?auto_519409 ?auto_519424 ) ) ( not ( = ?auto_519410 ?auto_519411 ) ) ( not ( = ?auto_519410 ?auto_519412 ) ) ( not ( = ?auto_519410 ?auto_519413 ) ) ( not ( = ?auto_519410 ?auto_519414 ) ) ( not ( = ?auto_519410 ?auto_519415 ) ) ( not ( = ?auto_519410 ?auto_519416 ) ) ( not ( = ?auto_519410 ?auto_519417 ) ) ( not ( = ?auto_519410 ?auto_519418 ) ) ( not ( = ?auto_519410 ?auto_519419 ) ) ( not ( = ?auto_519410 ?auto_519420 ) ) ( not ( = ?auto_519410 ?auto_519421 ) ) ( not ( = ?auto_519410 ?auto_519422 ) ) ( not ( = ?auto_519410 ?auto_519423 ) ) ( not ( = ?auto_519410 ?auto_519424 ) ) ( not ( = ?auto_519411 ?auto_519412 ) ) ( not ( = ?auto_519411 ?auto_519413 ) ) ( not ( = ?auto_519411 ?auto_519414 ) ) ( not ( = ?auto_519411 ?auto_519415 ) ) ( not ( = ?auto_519411 ?auto_519416 ) ) ( not ( = ?auto_519411 ?auto_519417 ) ) ( not ( = ?auto_519411 ?auto_519418 ) ) ( not ( = ?auto_519411 ?auto_519419 ) ) ( not ( = ?auto_519411 ?auto_519420 ) ) ( not ( = ?auto_519411 ?auto_519421 ) ) ( not ( = ?auto_519411 ?auto_519422 ) ) ( not ( = ?auto_519411 ?auto_519423 ) ) ( not ( = ?auto_519411 ?auto_519424 ) ) ( not ( = ?auto_519412 ?auto_519413 ) ) ( not ( = ?auto_519412 ?auto_519414 ) ) ( not ( = ?auto_519412 ?auto_519415 ) ) ( not ( = ?auto_519412 ?auto_519416 ) ) ( not ( = ?auto_519412 ?auto_519417 ) ) ( not ( = ?auto_519412 ?auto_519418 ) ) ( not ( = ?auto_519412 ?auto_519419 ) ) ( not ( = ?auto_519412 ?auto_519420 ) ) ( not ( = ?auto_519412 ?auto_519421 ) ) ( not ( = ?auto_519412 ?auto_519422 ) ) ( not ( = ?auto_519412 ?auto_519423 ) ) ( not ( = ?auto_519412 ?auto_519424 ) ) ( not ( = ?auto_519413 ?auto_519414 ) ) ( not ( = ?auto_519413 ?auto_519415 ) ) ( not ( = ?auto_519413 ?auto_519416 ) ) ( not ( = ?auto_519413 ?auto_519417 ) ) ( not ( = ?auto_519413 ?auto_519418 ) ) ( not ( = ?auto_519413 ?auto_519419 ) ) ( not ( = ?auto_519413 ?auto_519420 ) ) ( not ( = ?auto_519413 ?auto_519421 ) ) ( not ( = ?auto_519413 ?auto_519422 ) ) ( not ( = ?auto_519413 ?auto_519423 ) ) ( not ( = ?auto_519413 ?auto_519424 ) ) ( not ( = ?auto_519414 ?auto_519415 ) ) ( not ( = ?auto_519414 ?auto_519416 ) ) ( not ( = ?auto_519414 ?auto_519417 ) ) ( not ( = ?auto_519414 ?auto_519418 ) ) ( not ( = ?auto_519414 ?auto_519419 ) ) ( not ( = ?auto_519414 ?auto_519420 ) ) ( not ( = ?auto_519414 ?auto_519421 ) ) ( not ( = ?auto_519414 ?auto_519422 ) ) ( not ( = ?auto_519414 ?auto_519423 ) ) ( not ( = ?auto_519414 ?auto_519424 ) ) ( not ( = ?auto_519415 ?auto_519416 ) ) ( not ( = ?auto_519415 ?auto_519417 ) ) ( not ( = ?auto_519415 ?auto_519418 ) ) ( not ( = ?auto_519415 ?auto_519419 ) ) ( not ( = ?auto_519415 ?auto_519420 ) ) ( not ( = ?auto_519415 ?auto_519421 ) ) ( not ( = ?auto_519415 ?auto_519422 ) ) ( not ( = ?auto_519415 ?auto_519423 ) ) ( not ( = ?auto_519415 ?auto_519424 ) ) ( not ( = ?auto_519416 ?auto_519417 ) ) ( not ( = ?auto_519416 ?auto_519418 ) ) ( not ( = ?auto_519416 ?auto_519419 ) ) ( not ( = ?auto_519416 ?auto_519420 ) ) ( not ( = ?auto_519416 ?auto_519421 ) ) ( not ( = ?auto_519416 ?auto_519422 ) ) ( not ( = ?auto_519416 ?auto_519423 ) ) ( not ( = ?auto_519416 ?auto_519424 ) ) ( not ( = ?auto_519417 ?auto_519418 ) ) ( not ( = ?auto_519417 ?auto_519419 ) ) ( not ( = ?auto_519417 ?auto_519420 ) ) ( not ( = ?auto_519417 ?auto_519421 ) ) ( not ( = ?auto_519417 ?auto_519422 ) ) ( not ( = ?auto_519417 ?auto_519423 ) ) ( not ( = ?auto_519417 ?auto_519424 ) ) ( not ( = ?auto_519418 ?auto_519419 ) ) ( not ( = ?auto_519418 ?auto_519420 ) ) ( not ( = ?auto_519418 ?auto_519421 ) ) ( not ( = ?auto_519418 ?auto_519422 ) ) ( not ( = ?auto_519418 ?auto_519423 ) ) ( not ( = ?auto_519418 ?auto_519424 ) ) ( not ( = ?auto_519419 ?auto_519420 ) ) ( not ( = ?auto_519419 ?auto_519421 ) ) ( not ( = ?auto_519419 ?auto_519422 ) ) ( not ( = ?auto_519419 ?auto_519423 ) ) ( not ( = ?auto_519419 ?auto_519424 ) ) ( not ( = ?auto_519420 ?auto_519421 ) ) ( not ( = ?auto_519420 ?auto_519422 ) ) ( not ( = ?auto_519420 ?auto_519423 ) ) ( not ( = ?auto_519420 ?auto_519424 ) ) ( not ( = ?auto_519421 ?auto_519422 ) ) ( not ( = ?auto_519421 ?auto_519423 ) ) ( not ( = ?auto_519421 ?auto_519424 ) ) ( not ( = ?auto_519422 ?auto_519423 ) ) ( not ( = ?auto_519422 ?auto_519424 ) ) ( not ( = ?auto_519423 ?auto_519424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_519423 ?auto_519424 )
      ( !STACK ?auto_519423 ?auto_519422 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519471 - BLOCK
      ?auto_519472 - BLOCK
      ?auto_519473 - BLOCK
      ?auto_519474 - BLOCK
      ?auto_519475 - BLOCK
      ?auto_519476 - BLOCK
      ?auto_519477 - BLOCK
      ?auto_519478 - BLOCK
      ?auto_519479 - BLOCK
      ?auto_519480 - BLOCK
      ?auto_519481 - BLOCK
      ?auto_519482 - BLOCK
      ?auto_519483 - BLOCK
      ?auto_519484 - BLOCK
      ?auto_519485 - BLOCK
    )
    :vars
    (
      ?auto_519486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519485 ?auto_519486 ) ( ON-TABLE ?auto_519471 ) ( ON ?auto_519472 ?auto_519471 ) ( ON ?auto_519473 ?auto_519472 ) ( ON ?auto_519474 ?auto_519473 ) ( ON ?auto_519475 ?auto_519474 ) ( ON ?auto_519476 ?auto_519475 ) ( ON ?auto_519477 ?auto_519476 ) ( ON ?auto_519478 ?auto_519477 ) ( ON ?auto_519479 ?auto_519478 ) ( ON ?auto_519480 ?auto_519479 ) ( ON ?auto_519481 ?auto_519480 ) ( ON ?auto_519482 ?auto_519481 ) ( ON ?auto_519483 ?auto_519482 ) ( not ( = ?auto_519471 ?auto_519472 ) ) ( not ( = ?auto_519471 ?auto_519473 ) ) ( not ( = ?auto_519471 ?auto_519474 ) ) ( not ( = ?auto_519471 ?auto_519475 ) ) ( not ( = ?auto_519471 ?auto_519476 ) ) ( not ( = ?auto_519471 ?auto_519477 ) ) ( not ( = ?auto_519471 ?auto_519478 ) ) ( not ( = ?auto_519471 ?auto_519479 ) ) ( not ( = ?auto_519471 ?auto_519480 ) ) ( not ( = ?auto_519471 ?auto_519481 ) ) ( not ( = ?auto_519471 ?auto_519482 ) ) ( not ( = ?auto_519471 ?auto_519483 ) ) ( not ( = ?auto_519471 ?auto_519484 ) ) ( not ( = ?auto_519471 ?auto_519485 ) ) ( not ( = ?auto_519471 ?auto_519486 ) ) ( not ( = ?auto_519472 ?auto_519473 ) ) ( not ( = ?auto_519472 ?auto_519474 ) ) ( not ( = ?auto_519472 ?auto_519475 ) ) ( not ( = ?auto_519472 ?auto_519476 ) ) ( not ( = ?auto_519472 ?auto_519477 ) ) ( not ( = ?auto_519472 ?auto_519478 ) ) ( not ( = ?auto_519472 ?auto_519479 ) ) ( not ( = ?auto_519472 ?auto_519480 ) ) ( not ( = ?auto_519472 ?auto_519481 ) ) ( not ( = ?auto_519472 ?auto_519482 ) ) ( not ( = ?auto_519472 ?auto_519483 ) ) ( not ( = ?auto_519472 ?auto_519484 ) ) ( not ( = ?auto_519472 ?auto_519485 ) ) ( not ( = ?auto_519472 ?auto_519486 ) ) ( not ( = ?auto_519473 ?auto_519474 ) ) ( not ( = ?auto_519473 ?auto_519475 ) ) ( not ( = ?auto_519473 ?auto_519476 ) ) ( not ( = ?auto_519473 ?auto_519477 ) ) ( not ( = ?auto_519473 ?auto_519478 ) ) ( not ( = ?auto_519473 ?auto_519479 ) ) ( not ( = ?auto_519473 ?auto_519480 ) ) ( not ( = ?auto_519473 ?auto_519481 ) ) ( not ( = ?auto_519473 ?auto_519482 ) ) ( not ( = ?auto_519473 ?auto_519483 ) ) ( not ( = ?auto_519473 ?auto_519484 ) ) ( not ( = ?auto_519473 ?auto_519485 ) ) ( not ( = ?auto_519473 ?auto_519486 ) ) ( not ( = ?auto_519474 ?auto_519475 ) ) ( not ( = ?auto_519474 ?auto_519476 ) ) ( not ( = ?auto_519474 ?auto_519477 ) ) ( not ( = ?auto_519474 ?auto_519478 ) ) ( not ( = ?auto_519474 ?auto_519479 ) ) ( not ( = ?auto_519474 ?auto_519480 ) ) ( not ( = ?auto_519474 ?auto_519481 ) ) ( not ( = ?auto_519474 ?auto_519482 ) ) ( not ( = ?auto_519474 ?auto_519483 ) ) ( not ( = ?auto_519474 ?auto_519484 ) ) ( not ( = ?auto_519474 ?auto_519485 ) ) ( not ( = ?auto_519474 ?auto_519486 ) ) ( not ( = ?auto_519475 ?auto_519476 ) ) ( not ( = ?auto_519475 ?auto_519477 ) ) ( not ( = ?auto_519475 ?auto_519478 ) ) ( not ( = ?auto_519475 ?auto_519479 ) ) ( not ( = ?auto_519475 ?auto_519480 ) ) ( not ( = ?auto_519475 ?auto_519481 ) ) ( not ( = ?auto_519475 ?auto_519482 ) ) ( not ( = ?auto_519475 ?auto_519483 ) ) ( not ( = ?auto_519475 ?auto_519484 ) ) ( not ( = ?auto_519475 ?auto_519485 ) ) ( not ( = ?auto_519475 ?auto_519486 ) ) ( not ( = ?auto_519476 ?auto_519477 ) ) ( not ( = ?auto_519476 ?auto_519478 ) ) ( not ( = ?auto_519476 ?auto_519479 ) ) ( not ( = ?auto_519476 ?auto_519480 ) ) ( not ( = ?auto_519476 ?auto_519481 ) ) ( not ( = ?auto_519476 ?auto_519482 ) ) ( not ( = ?auto_519476 ?auto_519483 ) ) ( not ( = ?auto_519476 ?auto_519484 ) ) ( not ( = ?auto_519476 ?auto_519485 ) ) ( not ( = ?auto_519476 ?auto_519486 ) ) ( not ( = ?auto_519477 ?auto_519478 ) ) ( not ( = ?auto_519477 ?auto_519479 ) ) ( not ( = ?auto_519477 ?auto_519480 ) ) ( not ( = ?auto_519477 ?auto_519481 ) ) ( not ( = ?auto_519477 ?auto_519482 ) ) ( not ( = ?auto_519477 ?auto_519483 ) ) ( not ( = ?auto_519477 ?auto_519484 ) ) ( not ( = ?auto_519477 ?auto_519485 ) ) ( not ( = ?auto_519477 ?auto_519486 ) ) ( not ( = ?auto_519478 ?auto_519479 ) ) ( not ( = ?auto_519478 ?auto_519480 ) ) ( not ( = ?auto_519478 ?auto_519481 ) ) ( not ( = ?auto_519478 ?auto_519482 ) ) ( not ( = ?auto_519478 ?auto_519483 ) ) ( not ( = ?auto_519478 ?auto_519484 ) ) ( not ( = ?auto_519478 ?auto_519485 ) ) ( not ( = ?auto_519478 ?auto_519486 ) ) ( not ( = ?auto_519479 ?auto_519480 ) ) ( not ( = ?auto_519479 ?auto_519481 ) ) ( not ( = ?auto_519479 ?auto_519482 ) ) ( not ( = ?auto_519479 ?auto_519483 ) ) ( not ( = ?auto_519479 ?auto_519484 ) ) ( not ( = ?auto_519479 ?auto_519485 ) ) ( not ( = ?auto_519479 ?auto_519486 ) ) ( not ( = ?auto_519480 ?auto_519481 ) ) ( not ( = ?auto_519480 ?auto_519482 ) ) ( not ( = ?auto_519480 ?auto_519483 ) ) ( not ( = ?auto_519480 ?auto_519484 ) ) ( not ( = ?auto_519480 ?auto_519485 ) ) ( not ( = ?auto_519480 ?auto_519486 ) ) ( not ( = ?auto_519481 ?auto_519482 ) ) ( not ( = ?auto_519481 ?auto_519483 ) ) ( not ( = ?auto_519481 ?auto_519484 ) ) ( not ( = ?auto_519481 ?auto_519485 ) ) ( not ( = ?auto_519481 ?auto_519486 ) ) ( not ( = ?auto_519482 ?auto_519483 ) ) ( not ( = ?auto_519482 ?auto_519484 ) ) ( not ( = ?auto_519482 ?auto_519485 ) ) ( not ( = ?auto_519482 ?auto_519486 ) ) ( not ( = ?auto_519483 ?auto_519484 ) ) ( not ( = ?auto_519483 ?auto_519485 ) ) ( not ( = ?auto_519483 ?auto_519486 ) ) ( not ( = ?auto_519484 ?auto_519485 ) ) ( not ( = ?auto_519484 ?auto_519486 ) ) ( not ( = ?auto_519485 ?auto_519486 ) ) ( CLEAR ?auto_519483 ) ( ON ?auto_519484 ?auto_519485 ) ( CLEAR ?auto_519484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_519471 ?auto_519472 ?auto_519473 ?auto_519474 ?auto_519475 ?auto_519476 ?auto_519477 ?auto_519478 ?auto_519479 ?auto_519480 ?auto_519481 ?auto_519482 ?auto_519483 ?auto_519484 )
      ( MAKE-15PILE ?auto_519471 ?auto_519472 ?auto_519473 ?auto_519474 ?auto_519475 ?auto_519476 ?auto_519477 ?auto_519478 ?auto_519479 ?auto_519480 ?auto_519481 ?auto_519482 ?auto_519483 ?auto_519484 ?auto_519485 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519533 - BLOCK
      ?auto_519534 - BLOCK
      ?auto_519535 - BLOCK
      ?auto_519536 - BLOCK
      ?auto_519537 - BLOCK
      ?auto_519538 - BLOCK
      ?auto_519539 - BLOCK
      ?auto_519540 - BLOCK
      ?auto_519541 - BLOCK
      ?auto_519542 - BLOCK
      ?auto_519543 - BLOCK
      ?auto_519544 - BLOCK
      ?auto_519545 - BLOCK
      ?auto_519546 - BLOCK
      ?auto_519547 - BLOCK
    )
    :vars
    (
      ?auto_519548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519547 ?auto_519548 ) ( ON-TABLE ?auto_519533 ) ( ON ?auto_519534 ?auto_519533 ) ( ON ?auto_519535 ?auto_519534 ) ( ON ?auto_519536 ?auto_519535 ) ( ON ?auto_519537 ?auto_519536 ) ( ON ?auto_519538 ?auto_519537 ) ( ON ?auto_519539 ?auto_519538 ) ( ON ?auto_519540 ?auto_519539 ) ( ON ?auto_519541 ?auto_519540 ) ( ON ?auto_519542 ?auto_519541 ) ( ON ?auto_519543 ?auto_519542 ) ( ON ?auto_519544 ?auto_519543 ) ( not ( = ?auto_519533 ?auto_519534 ) ) ( not ( = ?auto_519533 ?auto_519535 ) ) ( not ( = ?auto_519533 ?auto_519536 ) ) ( not ( = ?auto_519533 ?auto_519537 ) ) ( not ( = ?auto_519533 ?auto_519538 ) ) ( not ( = ?auto_519533 ?auto_519539 ) ) ( not ( = ?auto_519533 ?auto_519540 ) ) ( not ( = ?auto_519533 ?auto_519541 ) ) ( not ( = ?auto_519533 ?auto_519542 ) ) ( not ( = ?auto_519533 ?auto_519543 ) ) ( not ( = ?auto_519533 ?auto_519544 ) ) ( not ( = ?auto_519533 ?auto_519545 ) ) ( not ( = ?auto_519533 ?auto_519546 ) ) ( not ( = ?auto_519533 ?auto_519547 ) ) ( not ( = ?auto_519533 ?auto_519548 ) ) ( not ( = ?auto_519534 ?auto_519535 ) ) ( not ( = ?auto_519534 ?auto_519536 ) ) ( not ( = ?auto_519534 ?auto_519537 ) ) ( not ( = ?auto_519534 ?auto_519538 ) ) ( not ( = ?auto_519534 ?auto_519539 ) ) ( not ( = ?auto_519534 ?auto_519540 ) ) ( not ( = ?auto_519534 ?auto_519541 ) ) ( not ( = ?auto_519534 ?auto_519542 ) ) ( not ( = ?auto_519534 ?auto_519543 ) ) ( not ( = ?auto_519534 ?auto_519544 ) ) ( not ( = ?auto_519534 ?auto_519545 ) ) ( not ( = ?auto_519534 ?auto_519546 ) ) ( not ( = ?auto_519534 ?auto_519547 ) ) ( not ( = ?auto_519534 ?auto_519548 ) ) ( not ( = ?auto_519535 ?auto_519536 ) ) ( not ( = ?auto_519535 ?auto_519537 ) ) ( not ( = ?auto_519535 ?auto_519538 ) ) ( not ( = ?auto_519535 ?auto_519539 ) ) ( not ( = ?auto_519535 ?auto_519540 ) ) ( not ( = ?auto_519535 ?auto_519541 ) ) ( not ( = ?auto_519535 ?auto_519542 ) ) ( not ( = ?auto_519535 ?auto_519543 ) ) ( not ( = ?auto_519535 ?auto_519544 ) ) ( not ( = ?auto_519535 ?auto_519545 ) ) ( not ( = ?auto_519535 ?auto_519546 ) ) ( not ( = ?auto_519535 ?auto_519547 ) ) ( not ( = ?auto_519535 ?auto_519548 ) ) ( not ( = ?auto_519536 ?auto_519537 ) ) ( not ( = ?auto_519536 ?auto_519538 ) ) ( not ( = ?auto_519536 ?auto_519539 ) ) ( not ( = ?auto_519536 ?auto_519540 ) ) ( not ( = ?auto_519536 ?auto_519541 ) ) ( not ( = ?auto_519536 ?auto_519542 ) ) ( not ( = ?auto_519536 ?auto_519543 ) ) ( not ( = ?auto_519536 ?auto_519544 ) ) ( not ( = ?auto_519536 ?auto_519545 ) ) ( not ( = ?auto_519536 ?auto_519546 ) ) ( not ( = ?auto_519536 ?auto_519547 ) ) ( not ( = ?auto_519536 ?auto_519548 ) ) ( not ( = ?auto_519537 ?auto_519538 ) ) ( not ( = ?auto_519537 ?auto_519539 ) ) ( not ( = ?auto_519537 ?auto_519540 ) ) ( not ( = ?auto_519537 ?auto_519541 ) ) ( not ( = ?auto_519537 ?auto_519542 ) ) ( not ( = ?auto_519537 ?auto_519543 ) ) ( not ( = ?auto_519537 ?auto_519544 ) ) ( not ( = ?auto_519537 ?auto_519545 ) ) ( not ( = ?auto_519537 ?auto_519546 ) ) ( not ( = ?auto_519537 ?auto_519547 ) ) ( not ( = ?auto_519537 ?auto_519548 ) ) ( not ( = ?auto_519538 ?auto_519539 ) ) ( not ( = ?auto_519538 ?auto_519540 ) ) ( not ( = ?auto_519538 ?auto_519541 ) ) ( not ( = ?auto_519538 ?auto_519542 ) ) ( not ( = ?auto_519538 ?auto_519543 ) ) ( not ( = ?auto_519538 ?auto_519544 ) ) ( not ( = ?auto_519538 ?auto_519545 ) ) ( not ( = ?auto_519538 ?auto_519546 ) ) ( not ( = ?auto_519538 ?auto_519547 ) ) ( not ( = ?auto_519538 ?auto_519548 ) ) ( not ( = ?auto_519539 ?auto_519540 ) ) ( not ( = ?auto_519539 ?auto_519541 ) ) ( not ( = ?auto_519539 ?auto_519542 ) ) ( not ( = ?auto_519539 ?auto_519543 ) ) ( not ( = ?auto_519539 ?auto_519544 ) ) ( not ( = ?auto_519539 ?auto_519545 ) ) ( not ( = ?auto_519539 ?auto_519546 ) ) ( not ( = ?auto_519539 ?auto_519547 ) ) ( not ( = ?auto_519539 ?auto_519548 ) ) ( not ( = ?auto_519540 ?auto_519541 ) ) ( not ( = ?auto_519540 ?auto_519542 ) ) ( not ( = ?auto_519540 ?auto_519543 ) ) ( not ( = ?auto_519540 ?auto_519544 ) ) ( not ( = ?auto_519540 ?auto_519545 ) ) ( not ( = ?auto_519540 ?auto_519546 ) ) ( not ( = ?auto_519540 ?auto_519547 ) ) ( not ( = ?auto_519540 ?auto_519548 ) ) ( not ( = ?auto_519541 ?auto_519542 ) ) ( not ( = ?auto_519541 ?auto_519543 ) ) ( not ( = ?auto_519541 ?auto_519544 ) ) ( not ( = ?auto_519541 ?auto_519545 ) ) ( not ( = ?auto_519541 ?auto_519546 ) ) ( not ( = ?auto_519541 ?auto_519547 ) ) ( not ( = ?auto_519541 ?auto_519548 ) ) ( not ( = ?auto_519542 ?auto_519543 ) ) ( not ( = ?auto_519542 ?auto_519544 ) ) ( not ( = ?auto_519542 ?auto_519545 ) ) ( not ( = ?auto_519542 ?auto_519546 ) ) ( not ( = ?auto_519542 ?auto_519547 ) ) ( not ( = ?auto_519542 ?auto_519548 ) ) ( not ( = ?auto_519543 ?auto_519544 ) ) ( not ( = ?auto_519543 ?auto_519545 ) ) ( not ( = ?auto_519543 ?auto_519546 ) ) ( not ( = ?auto_519543 ?auto_519547 ) ) ( not ( = ?auto_519543 ?auto_519548 ) ) ( not ( = ?auto_519544 ?auto_519545 ) ) ( not ( = ?auto_519544 ?auto_519546 ) ) ( not ( = ?auto_519544 ?auto_519547 ) ) ( not ( = ?auto_519544 ?auto_519548 ) ) ( not ( = ?auto_519545 ?auto_519546 ) ) ( not ( = ?auto_519545 ?auto_519547 ) ) ( not ( = ?auto_519545 ?auto_519548 ) ) ( not ( = ?auto_519546 ?auto_519547 ) ) ( not ( = ?auto_519546 ?auto_519548 ) ) ( not ( = ?auto_519547 ?auto_519548 ) ) ( ON ?auto_519546 ?auto_519547 ) ( CLEAR ?auto_519544 ) ( ON ?auto_519545 ?auto_519546 ) ( CLEAR ?auto_519545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_519533 ?auto_519534 ?auto_519535 ?auto_519536 ?auto_519537 ?auto_519538 ?auto_519539 ?auto_519540 ?auto_519541 ?auto_519542 ?auto_519543 ?auto_519544 ?auto_519545 )
      ( MAKE-15PILE ?auto_519533 ?auto_519534 ?auto_519535 ?auto_519536 ?auto_519537 ?auto_519538 ?auto_519539 ?auto_519540 ?auto_519541 ?auto_519542 ?auto_519543 ?auto_519544 ?auto_519545 ?auto_519546 ?auto_519547 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519595 - BLOCK
      ?auto_519596 - BLOCK
      ?auto_519597 - BLOCK
      ?auto_519598 - BLOCK
      ?auto_519599 - BLOCK
      ?auto_519600 - BLOCK
      ?auto_519601 - BLOCK
      ?auto_519602 - BLOCK
      ?auto_519603 - BLOCK
      ?auto_519604 - BLOCK
      ?auto_519605 - BLOCK
      ?auto_519606 - BLOCK
      ?auto_519607 - BLOCK
      ?auto_519608 - BLOCK
      ?auto_519609 - BLOCK
    )
    :vars
    (
      ?auto_519610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519609 ?auto_519610 ) ( ON-TABLE ?auto_519595 ) ( ON ?auto_519596 ?auto_519595 ) ( ON ?auto_519597 ?auto_519596 ) ( ON ?auto_519598 ?auto_519597 ) ( ON ?auto_519599 ?auto_519598 ) ( ON ?auto_519600 ?auto_519599 ) ( ON ?auto_519601 ?auto_519600 ) ( ON ?auto_519602 ?auto_519601 ) ( ON ?auto_519603 ?auto_519602 ) ( ON ?auto_519604 ?auto_519603 ) ( ON ?auto_519605 ?auto_519604 ) ( not ( = ?auto_519595 ?auto_519596 ) ) ( not ( = ?auto_519595 ?auto_519597 ) ) ( not ( = ?auto_519595 ?auto_519598 ) ) ( not ( = ?auto_519595 ?auto_519599 ) ) ( not ( = ?auto_519595 ?auto_519600 ) ) ( not ( = ?auto_519595 ?auto_519601 ) ) ( not ( = ?auto_519595 ?auto_519602 ) ) ( not ( = ?auto_519595 ?auto_519603 ) ) ( not ( = ?auto_519595 ?auto_519604 ) ) ( not ( = ?auto_519595 ?auto_519605 ) ) ( not ( = ?auto_519595 ?auto_519606 ) ) ( not ( = ?auto_519595 ?auto_519607 ) ) ( not ( = ?auto_519595 ?auto_519608 ) ) ( not ( = ?auto_519595 ?auto_519609 ) ) ( not ( = ?auto_519595 ?auto_519610 ) ) ( not ( = ?auto_519596 ?auto_519597 ) ) ( not ( = ?auto_519596 ?auto_519598 ) ) ( not ( = ?auto_519596 ?auto_519599 ) ) ( not ( = ?auto_519596 ?auto_519600 ) ) ( not ( = ?auto_519596 ?auto_519601 ) ) ( not ( = ?auto_519596 ?auto_519602 ) ) ( not ( = ?auto_519596 ?auto_519603 ) ) ( not ( = ?auto_519596 ?auto_519604 ) ) ( not ( = ?auto_519596 ?auto_519605 ) ) ( not ( = ?auto_519596 ?auto_519606 ) ) ( not ( = ?auto_519596 ?auto_519607 ) ) ( not ( = ?auto_519596 ?auto_519608 ) ) ( not ( = ?auto_519596 ?auto_519609 ) ) ( not ( = ?auto_519596 ?auto_519610 ) ) ( not ( = ?auto_519597 ?auto_519598 ) ) ( not ( = ?auto_519597 ?auto_519599 ) ) ( not ( = ?auto_519597 ?auto_519600 ) ) ( not ( = ?auto_519597 ?auto_519601 ) ) ( not ( = ?auto_519597 ?auto_519602 ) ) ( not ( = ?auto_519597 ?auto_519603 ) ) ( not ( = ?auto_519597 ?auto_519604 ) ) ( not ( = ?auto_519597 ?auto_519605 ) ) ( not ( = ?auto_519597 ?auto_519606 ) ) ( not ( = ?auto_519597 ?auto_519607 ) ) ( not ( = ?auto_519597 ?auto_519608 ) ) ( not ( = ?auto_519597 ?auto_519609 ) ) ( not ( = ?auto_519597 ?auto_519610 ) ) ( not ( = ?auto_519598 ?auto_519599 ) ) ( not ( = ?auto_519598 ?auto_519600 ) ) ( not ( = ?auto_519598 ?auto_519601 ) ) ( not ( = ?auto_519598 ?auto_519602 ) ) ( not ( = ?auto_519598 ?auto_519603 ) ) ( not ( = ?auto_519598 ?auto_519604 ) ) ( not ( = ?auto_519598 ?auto_519605 ) ) ( not ( = ?auto_519598 ?auto_519606 ) ) ( not ( = ?auto_519598 ?auto_519607 ) ) ( not ( = ?auto_519598 ?auto_519608 ) ) ( not ( = ?auto_519598 ?auto_519609 ) ) ( not ( = ?auto_519598 ?auto_519610 ) ) ( not ( = ?auto_519599 ?auto_519600 ) ) ( not ( = ?auto_519599 ?auto_519601 ) ) ( not ( = ?auto_519599 ?auto_519602 ) ) ( not ( = ?auto_519599 ?auto_519603 ) ) ( not ( = ?auto_519599 ?auto_519604 ) ) ( not ( = ?auto_519599 ?auto_519605 ) ) ( not ( = ?auto_519599 ?auto_519606 ) ) ( not ( = ?auto_519599 ?auto_519607 ) ) ( not ( = ?auto_519599 ?auto_519608 ) ) ( not ( = ?auto_519599 ?auto_519609 ) ) ( not ( = ?auto_519599 ?auto_519610 ) ) ( not ( = ?auto_519600 ?auto_519601 ) ) ( not ( = ?auto_519600 ?auto_519602 ) ) ( not ( = ?auto_519600 ?auto_519603 ) ) ( not ( = ?auto_519600 ?auto_519604 ) ) ( not ( = ?auto_519600 ?auto_519605 ) ) ( not ( = ?auto_519600 ?auto_519606 ) ) ( not ( = ?auto_519600 ?auto_519607 ) ) ( not ( = ?auto_519600 ?auto_519608 ) ) ( not ( = ?auto_519600 ?auto_519609 ) ) ( not ( = ?auto_519600 ?auto_519610 ) ) ( not ( = ?auto_519601 ?auto_519602 ) ) ( not ( = ?auto_519601 ?auto_519603 ) ) ( not ( = ?auto_519601 ?auto_519604 ) ) ( not ( = ?auto_519601 ?auto_519605 ) ) ( not ( = ?auto_519601 ?auto_519606 ) ) ( not ( = ?auto_519601 ?auto_519607 ) ) ( not ( = ?auto_519601 ?auto_519608 ) ) ( not ( = ?auto_519601 ?auto_519609 ) ) ( not ( = ?auto_519601 ?auto_519610 ) ) ( not ( = ?auto_519602 ?auto_519603 ) ) ( not ( = ?auto_519602 ?auto_519604 ) ) ( not ( = ?auto_519602 ?auto_519605 ) ) ( not ( = ?auto_519602 ?auto_519606 ) ) ( not ( = ?auto_519602 ?auto_519607 ) ) ( not ( = ?auto_519602 ?auto_519608 ) ) ( not ( = ?auto_519602 ?auto_519609 ) ) ( not ( = ?auto_519602 ?auto_519610 ) ) ( not ( = ?auto_519603 ?auto_519604 ) ) ( not ( = ?auto_519603 ?auto_519605 ) ) ( not ( = ?auto_519603 ?auto_519606 ) ) ( not ( = ?auto_519603 ?auto_519607 ) ) ( not ( = ?auto_519603 ?auto_519608 ) ) ( not ( = ?auto_519603 ?auto_519609 ) ) ( not ( = ?auto_519603 ?auto_519610 ) ) ( not ( = ?auto_519604 ?auto_519605 ) ) ( not ( = ?auto_519604 ?auto_519606 ) ) ( not ( = ?auto_519604 ?auto_519607 ) ) ( not ( = ?auto_519604 ?auto_519608 ) ) ( not ( = ?auto_519604 ?auto_519609 ) ) ( not ( = ?auto_519604 ?auto_519610 ) ) ( not ( = ?auto_519605 ?auto_519606 ) ) ( not ( = ?auto_519605 ?auto_519607 ) ) ( not ( = ?auto_519605 ?auto_519608 ) ) ( not ( = ?auto_519605 ?auto_519609 ) ) ( not ( = ?auto_519605 ?auto_519610 ) ) ( not ( = ?auto_519606 ?auto_519607 ) ) ( not ( = ?auto_519606 ?auto_519608 ) ) ( not ( = ?auto_519606 ?auto_519609 ) ) ( not ( = ?auto_519606 ?auto_519610 ) ) ( not ( = ?auto_519607 ?auto_519608 ) ) ( not ( = ?auto_519607 ?auto_519609 ) ) ( not ( = ?auto_519607 ?auto_519610 ) ) ( not ( = ?auto_519608 ?auto_519609 ) ) ( not ( = ?auto_519608 ?auto_519610 ) ) ( not ( = ?auto_519609 ?auto_519610 ) ) ( ON ?auto_519608 ?auto_519609 ) ( ON ?auto_519607 ?auto_519608 ) ( CLEAR ?auto_519605 ) ( ON ?auto_519606 ?auto_519607 ) ( CLEAR ?auto_519606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_519595 ?auto_519596 ?auto_519597 ?auto_519598 ?auto_519599 ?auto_519600 ?auto_519601 ?auto_519602 ?auto_519603 ?auto_519604 ?auto_519605 ?auto_519606 )
      ( MAKE-15PILE ?auto_519595 ?auto_519596 ?auto_519597 ?auto_519598 ?auto_519599 ?auto_519600 ?auto_519601 ?auto_519602 ?auto_519603 ?auto_519604 ?auto_519605 ?auto_519606 ?auto_519607 ?auto_519608 ?auto_519609 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519657 - BLOCK
      ?auto_519658 - BLOCK
      ?auto_519659 - BLOCK
      ?auto_519660 - BLOCK
      ?auto_519661 - BLOCK
      ?auto_519662 - BLOCK
      ?auto_519663 - BLOCK
      ?auto_519664 - BLOCK
      ?auto_519665 - BLOCK
      ?auto_519666 - BLOCK
      ?auto_519667 - BLOCK
      ?auto_519668 - BLOCK
      ?auto_519669 - BLOCK
      ?auto_519670 - BLOCK
      ?auto_519671 - BLOCK
    )
    :vars
    (
      ?auto_519672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519671 ?auto_519672 ) ( ON-TABLE ?auto_519657 ) ( ON ?auto_519658 ?auto_519657 ) ( ON ?auto_519659 ?auto_519658 ) ( ON ?auto_519660 ?auto_519659 ) ( ON ?auto_519661 ?auto_519660 ) ( ON ?auto_519662 ?auto_519661 ) ( ON ?auto_519663 ?auto_519662 ) ( ON ?auto_519664 ?auto_519663 ) ( ON ?auto_519665 ?auto_519664 ) ( ON ?auto_519666 ?auto_519665 ) ( not ( = ?auto_519657 ?auto_519658 ) ) ( not ( = ?auto_519657 ?auto_519659 ) ) ( not ( = ?auto_519657 ?auto_519660 ) ) ( not ( = ?auto_519657 ?auto_519661 ) ) ( not ( = ?auto_519657 ?auto_519662 ) ) ( not ( = ?auto_519657 ?auto_519663 ) ) ( not ( = ?auto_519657 ?auto_519664 ) ) ( not ( = ?auto_519657 ?auto_519665 ) ) ( not ( = ?auto_519657 ?auto_519666 ) ) ( not ( = ?auto_519657 ?auto_519667 ) ) ( not ( = ?auto_519657 ?auto_519668 ) ) ( not ( = ?auto_519657 ?auto_519669 ) ) ( not ( = ?auto_519657 ?auto_519670 ) ) ( not ( = ?auto_519657 ?auto_519671 ) ) ( not ( = ?auto_519657 ?auto_519672 ) ) ( not ( = ?auto_519658 ?auto_519659 ) ) ( not ( = ?auto_519658 ?auto_519660 ) ) ( not ( = ?auto_519658 ?auto_519661 ) ) ( not ( = ?auto_519658 ?auto_519662 ) ) ( not ( = ?auto_519658 ?auto_519663 ) ) ( not ( = ?auto_519658 ?auto_519664 ) ) ( not ( = ?auto_519658 ?auto_519665 ) ) ( not ( = ?auto_519658 ?auto_519666 ) ) ( not ( = ?auto_519658 ?auto_519667 ) ) ( not ( = ?auto_519658 ?auto_519668 ) ) ( not ( = ?auto_519658 ?auto_519669 ) ) ( not ( = ?auto_519658 ?auto_519670 ) ) ( not ( = ?auto_519658 ?auto_519671 ) ) ( not ( = ?auto_519658 ?auto_519672 ) ) ( not ( = ?auto_519659 ?auto_519660 ) ) ( not ( = ?auto_519659 ?auto_519661 ) ) ( not ( = ?auto_519659 ?auto_519662 ) ) ( not ( = ?auto_519659 ?auto_519663 ) ) ( not ( = ?auto_519659 ?auto_519664 ) ) ( not ( = ?auto_519659 ?auto_519665 ) ) ( not ( = ?auto_519659 ?auto_519666 ) ) ( not ( = ?auto_519659 ?auto_519667 ) ) ( not ( = ?auto_519659 ?auto_519668 ) ) ( not ( = ?auto_519659 ?auto_519669 ) ) ( not ( = ?auto_519659 ?auto_519670 ) ) ( not ( = ?auto_519659 ?auto_519671 ) ) ( not ( = ?auto_519659 ?auto_519672 ) ) ( not ( = ?auto_519660 ?auto_519661 ) ) ( not ( = ?auto_519660 ?auto_519662 ) ) ( not ( = ?auto_519660 ?auto_519663 ) ) ( not ( = ?auto_519660 ?auto_519664 ) ) ( not ( = ?auto_519660 ?auto_519665 ) ) ( not ( = ?auto_519660 ?auto_519666 ) ) ( not ( = ?auto_519660 ?auto_519667 ) ) ( not ( = ?auto_519660 ?auto_519668 ) ) ( not ( = ?auto_519660 ?auto_519669 ) ) ( not ( = ?auto_519660 ?auto_519670 ) ) ( not ( = ?auto_519660 ?auto_519671 ) ) ( not ( = ?auto_519660 ?auto_519672 ) ) ( not ( = ?auto_519661 ?auto_519662 ) ) ( not ( = ?auto_519661 ?auto_519663 ) ) ( not ( = ?auto_519661 ?auto_519664 ) ) ( not ( = ?auto_519661 ?auto_519665 ) ) ( not ( = ?auto_519661 ?auto_519666 ) ) ( not ( = ?auto_519661 ?auto_519667 ) ) ( not ( = ?auto_519661 ?auto_519668 ) ) ( not ( = ?auto_519661 ?auto_519669 ) ) ( not ( = ?auto_519661 ?auto_519670 ) ) ( not ( = ?auto_519661 ?auto_519671 ) ) ( not ( = ?auto_519661 ?auto_519672 ) ) ( not ( = ?auto_519662 ?auto_519663 ) ) ( not ( = ?auto_519662 ?auto_519664 ) ) ( not ( = ?auto_519662 ?auto_519665 ) ) ( not ( = ?auto_519662 ?auto_519666 ) ) ( not ( = ?auto_519662 ?auto_519667 ) ) ( not ( = ?auto_519662 ?auto_519668 ) ) ( not ( = ?auto_519662 ?auto_519669 ) ) ( not ( = ?auto_519662 ?auto_519670 ) ) ( not ( = ?auto_519662 ?auto_519671 ) ) ( not ( = ?auto_519662 ?auto_519672 ) ) ( not ( = ?auto_519663 ?auto_519664 ) ) ( not ( = ?auto_519663 ?auto_519665 ) ) ( not ( = ?auto_519663 ?auto_519666 ) ) ( not ( = ?auto_519663 ?auto_519667 ) ) ( not ( = ?auto_519663 ?auto_519668 ) ) ( not ( = ?auto_519663 ?auto_519669 ) ) ( not ( = ?auto_519663 ?auto_519670 ) ) ( not ( = ?auto_519663 ?auto_519671 ) ) ( not ( = ?auto_519663 ?auto_519672 ) ) ( not ( = ?auto_519664 ?auto_519665 ) ) ( not ( = ?auto_519664 ?auto_519666 ) ) ( not ( = ?auto_519664 ?auto_519667 ) ) ( not ( = ?auto_519664 ?auto_519668 ) ) ( not ( = ?auto_519664 ?auto_519669 ) ) ( not ( = ?auto_519664 ?auto_519670 ) ) ( not ( = ?auto_519664 ?auto_519671 ) ) ( not ( = ?auto_519664 ?auto_519672 ) ) ( not ( = ?auto_519665 ?auto_519666 ) ) ( not ( = ?auto_519665 ?auto_519667 ) ) ( not ( = ?auto_519665 ?auto_519668 ) ) ( not ( = ?auto_519665 ?auto_519669 ) ) ( not ( = ?auto_519665 ?auto_519670 ) ) ( not ( = ?auto_519665 ?auto_519671 ) ) ( not ( = ?auto_519665 ?auto_519672 ) ) ( not ( = ?auto_519666 ?auto_519667 ) ) ( not ( = ?auto_519666 ?auto_519668 ) ) ( not ( = ?auto_519666 ?auto_519669 ) ) ( not ( = ?auto_519666 ?auto_519670 ) ) ( not ( = ?auto_519666 ?auto_519671 ) ) ( not ( = ?auto_519666 ?auto_519672 ) ) ( not ( = ?auto_519667 ?auto_519668 ) ) ( not ( = ?auto_519667 ?auto_519669 ) ) ( not ( = ?auto_519667 ?auto_519670 ) ) ( not ( = ?auto_519667 ?auto_519671 ) ) ( not ( = ?auto_519667 ?auto_519672 ) ) ( not ( = ?auto_519668 ?auto_519669 ) ) ( not ( = ?auto_519668 ?auto_519670 ) ) ( not ( = ?auto_519668 ?auto_519671 ) ) ( not ( = ?auto_519668 ?auto_519672 ) ) ( not ( = ?auto_519669 ?auto_519670 ) ) ( not ( = ?auto_519669 ?auto_519671 ) ) ( not ( = ?auto_519669 ?auto_519672 ) ) ( not ( = ?auto_519670 ?auto_519671 ) ) ( not ( = ?auto_519670 ?auto_519672 ) ) ( not ( = ?auto_519671 ?auto_519672 ) ) ( ON ?auto_519670 ?auto_519671 ) ( ON ?auto_519669 ?auto_519670 ) ( ON ?auto_519668 ?auto_519669 ) ( CLEAR ?auto_519666 ) ( ON ?auto_519667 ?auto_519668 ) ( CLEAR ?auto_519667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_519657 ?auto_519658 ?auto_519659 ?auto_519660 ?auto_519661 ?auto_519662 ?auto_519663 ?auto_519664 ?auto_519665 ?auto_519666 ?auto_519667 )
      ( MAKE-15PILE ?auto_519657 ?auto_519658 ?auto_519659 ?auto_519660 ?auto_519661 ?auto_519662 ?auto_519663 ?auto_519664 ?auto_519665 ?auto_519666 ?auto_519667 ?auto_519668 ?auto_519669 ?auto_519670 ?auto_519671 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519719 - BLOCK
      ?auto_519720 - BLOCK
      ?auto_519721 - BLOCK
      ?auto_519722 - BLOCK
      ?auto_519723 - BLOCK
      ?auto_519724 - BLOCK
      ?auto_519725 - BLOCK
      ?auto_519726 - BLOCK
      ?auto_519727 - BLOCK
      ?auto_519728 - BLOCK
      ?auto_519729 - BLOCK
      ?auto_519730 - BLOCK
      ?auto_519731 - BLOCK
      ?auto_519732 - BLOCK
      ?auto_519733 - BLOCK
    )
    :vars
    (
      ?auto_519734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519733 ?auto_519734 ) ( ON-TABLE ?auto_519719 ) ( ON ?auto_519720 ?auto_519719 ) ( ON ?auto_519721 ?auto_519720 ) ( ON ?auto_519722 ?auto_519721 ) ( ON ?auto_519723 ?auto_519722 ) ( ON ?auto_519724 ?auto_519723 ) ( ON ?auto_519725 ?auto_519724 ) ( ON ?auto_519726 ?auto_519725 ) ( ON ?auto_519727 ?auto_519726 ) ( not ( = ?auto_519719 ?auto_519720 ) ) ( not ( = ?auto_519719 ?auto_519721 ) ) ( not ( = ?auto_519719 ?auto_519722 ) ) ( not ( = ?auto_519719 ?auto_519723 ) ) ( not ( = ?auto_519719 ?auto_519724 ) ) ( not ( = ?auto_519719 ?auto_519725 ) ) ( not ( = ?auto_519719 ?auto_519726 ) ) ( not ( = ?auto_519719 ?auto_519727 ) ) ( not ( = ?auto_519719 ?auto_519728 ) ) ( not ( = ?auto_519719 ?auto_519729 ) ) ( not ( = ?auto_519719 ?auto_519730 ) ) ( not ( = ?auto_519719 ?auto_519731 ) ) ( not ( = ?auto_519719 ?auto_519732 ) ) ( not ( = ?auto_519719 ?auto_519733 ) ) ( not ( = ?auto_519719 ?auto_519734 ) ) ( not ( = ?auto_519720 ?auto_519721 ) ) ( not ( = ?auto_519720 ?auto_519722 ) ) ( not ( = ?auto_519720 ?auto_519723 ) ) ( not ( = ?auto_519720 ?auto_519724 ) ) ( not ( = ?auto_519720 ?auto_519725 ) ) ( not ( = ?auto_519720 ?auto_519726 ) ) ( not ( = ?auto_519720 ?auto_519727 ) ) ( not ( = ?auto_519720 ?auto_519728 ) ) ( not ( = ?auto_519720 ?auto_519729 ) ) ( not ( = ?auto_519720 ?auto_519730 ) ) ( not ( = ?auto_519720 ?auto_519731 ) ) ( not ( = ?auto_519720 ?auto_519732 ) ) ( not ( = ?auto_519720 ?auto_519733 ) ) ( not ( = ?auto_519720 ?auto_519734 ) ) ( not ( = ?auto_519721 ?auto_519722 ) ) ( not ( = ?auto_519721 ?auto_519723 ) ) ( not ( = ?auto_519721 ?auto_519724 ) ) ( not ( = ?auto_519721 ?auto_519725 ) ) ( not ( = ?auto_519721 ?auto_519726 ) ) ( not ( = ?auto_519721 ?auto_519727 ) ) ( not ( = ?auto_519721 ?auto_519728 ) ) ( not ( = ?auto_519721 ?auto_519729 ) ) ( not ( = ?auto_519721 ?auto_519730 ) ) ( not ( = ?auto_519721 ?auto_519731 ) ) ( not ( = ?auto_519721 ?auto_519732 ) ) ( not ( = ?auto_519721 ?auto_519733 ) ) ( not ( = ?auto_519721 ?auto_519734 ) ) ( not ( = ?auto_519722 ?auto_519723 ) ) ( not ( = ?auto_519722 ?auto_519724 ) ) ( not ( = ?auto_519722 ?auto_519725 ) ) ( not ( = ?auto_519722 ?auto_519726 ) ) ( not ( = ?auto_519722 ?auto_519727 ) ) ( not ( = ?auto_519722 ?auto_519728 ) ) ( not ( = ?auto_519722 ?auto_519729 ) ) ( not ( = ?auto_519722 ?auto_519730 ) ) ( not ( = ?auto_519722 ?auto_519731 ) ) ( not ( = ?auto_519722 ?auto_519732 ) ) ( not ( = ?auto_519722 ?auto_519733 ) ) ( not ( = ?auto_519722 ?auto_519734 ) ) ( not ( = ?auto_519723 ?auto_519724 ) ) ( not ( = ?auto_519723 ?auto_519725 ) ) ( not ( = ?auto_519723 ?auto_519726 ) ) ( not ( = ?auto_519723 ?auto_519727 ) ) ( not ( = ?auto_519723 ?auto_519728 ) ) ( not ( = ?auto_519723 ?auto_519729 ) ) ( not ( = ?auto_519723 ?auto_519730 ) ) ( not ( = ?auto_519723 ?auto_519731 ) ) ( not ( = ?auto_519723 ?auto_519732 ) ) ( not ( = ?auto_519723 ?auto_519733 ) ) ( not ( = ?auto_519723 ?auto_519734 ) ) ( not ( = ?auto_519724 ?auto_519725 ) ) ( not ( = ?auto_519724 ?auto_519726 ) ) ( not ( = ?auto_519724 ?auto_519727 ) ) ( not ( = ?auto_519724 ?auto_519728 ) ) ( not ( = ?auto_519724 ?auto_519729 ) ) ( not ( = ?auto_519724 ?auto_519730 ) ) ( not ( = ?auto_519724 ?auto_519731 ) ) ( not ( = ?auto_519724 ?auto_519732 ) ) ( not ( = ?auto_519724 ?auto_519733 ) ) ( not ( = ?auto_519724 ?auto_519734 ) ) ( not ( = ?auto_519725 ?auto_519726 ) ) ( not ( = ?auto_519725 ?auto_519727 ) ) ( not ( = ?auto_519725 ?auto_519728 ) ) ( not ( = ?auto_519725 ?auto_519729 ) ) ( not ( = ?auto_519725 ?auto_519730 ) ) ( not ( = ?auto_519725 ?auto_519731 ) ) ( not ( = ?auto_519725 ?auto_519732 ) ) ( not ( = ?auto_519725 ?auto_519733 ) ) ( not ( = ?auto_519725 ?auto_519734 ) ) ( not ( = ?auto_519726 ?auto_519727 ) ) ( not ( = ?auto_519726 ?auto_519728 ) ) ( not ( = ?auto_519726 ?auto_519729 ) ) ( not ( = ?auto_519726 ?auto_519730 ) ) ( not ( = ?auto_519726 ?auto_519731 ) ) ( not ( = ?auto_519726 ?auto_519732 ) ) ( not ( = ?auto_519726 ?auto_519733 ) ) ( not ( = ?auto_519726 ?auto_519734 ) ) ( not ( = ?auto_519727 ?auto_519728 ) ) ( not ( = ?auto_519727 ?auto_519729 ) ) ( not ( = ?auto_519727 ?auto_519730 ) ) ( not ( = ?auto_519727 ?auto_519731 ) ) ( not ( = ?auto_519727 ?auto_519732 ) ) ( not ( = ?auto_519727 ?auto_519733 ) ) ( not ( = ?auto_519727 ?auto_519734 ) ) ( not ( = ?auto_519728 ?auto_519729 ) ) ( not ( = ?auto_519728 ?auto_519730 ) ) ( not ( = ?auto_519728 ?auto_519731 ) ) ( not ( = ?auto_519728 ?auto_519732 ) ) ( not ( = ?auto_519728 ?auto_519733 ) ) ( not ( = ?auto_519728 ?auto_519734 ) ) ( not ( = ?auto_519729 ?auto_519730 ) ) ( not ( = ?auto_519729 ?auto_519731 ) ) ( not ( = ?auto_519729 ?auto_519732 ) ) ( not ( = ?auto_519729 ?auto_519733 ) ) ( not ( = ?auto_519729 ?auto_519734 ) ) ( not ( = ?auto_519730 ?auto_519731 ) ) ( not ( = ?auto_519730 ?auto_519732 ) ) ( not ( = ?auto_519730 ?auto_519733 ) ) ( not ( = ?auto_519730 ?auto_519734 ) ) ( not ( = ?auto_519731 ?auto_519732 ) ) ( not ( = ?auto_519731 ?auto_519733 ) ) ( not ( = ?auto_519731 ?auto_519734 ) ) ( not ( = ?auto_519732 ?auto_519733 ) ) ( not ( = ?auto_519732 ?auto_519734 ) ) ( not ( = ?auto_519733 ?auto_519734 ) ) ( ON ?auto_519732 ?auto_519733 ) ( ON ?auto_519731 ?auto_519732 ) ( ON ?auto_519730 ?auto_519731 ) ( ON ?auto_519729 ?auto_519730 ) ( CLEAR ?auto_519727 ) ( ON ?auto_519728 ?auto_519729 ) ( CLEAR ?auto_519728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_519719 ?auto_519720 ?auto_519721 ?auto_519722 ?auto_519723 ?auto_519724 ?auto_519725 ?auto_519726 ?auto_519727 ?auto_519728 )
      ( MAKE-15PILE ?auto_519719 ?auto_519720 ?auto_519721 ?auto_519722 ?auto_519723 ?auto_519724 ?auto_519725 ?auto_519726 ?auto_519727 ?auto_519728 ?auto_519729 ?auto_519730 ?auto_519731 ?auto_519732 ?auto_519733 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519781 - BLOCK
      ?auto_519782 - BLOCK
      ?auto_519783 - BLOCK
      ?auto_519784 - BLOCK
      ?auto_519785 - BLOCK
      ?auto_519786 - BLOCK
      ?auto_519787 - BLOCK
      ?auto_519788 - BLOCK
      ?auto_519789 - BLOCK
      ?auto_519790 - BLOCK
      ?auto_519791 - BLOCK
      ?auto_519792 - BLOCK
      ?auto_519793 - BLOCK
      ?auto_519794 - BLOCK
      ?auto_519795 - BLOCK
    )
    :vars
    (
      ?auto_519796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519795 ?auto_519796 ) ( ON-TABLE ?auto_519781 ) ( ON ?auto_519782 ?auto_519781 ) ( ON ?auto_519783 ?auto_519782 ) ( ON ?auto_519784 ?auto_519783 ) ( ON ?auto_519785 ?auto_519784 ) ( ON ?auto_519786 ?auto_519785 ) ( ON ?auto_519787 ?auto_519786 ) ( ON ?auto_519788 ?auto_519787 ) ( not ( = ?auto_519781 ?auto_519782 ) ) ( not ( = ?auto_519781 ?auto_519783 ) ) ( not ( = ?auto_519781 ?auto_519784 ) ) ( not ( = ?auto_519781 ?auto_519785 ) ) ( not ( = ?auto_519781 ?auto_519786 ) ) ( not ( = ?auto_519781 ?auto_519787 ) ) ( not ( = ?auto_519781 ?auto_519788 ) ) ( not ( = ?auto_519781 ?auto_519789 ) ) ( not ( = ?auto_519781 ?auto_519790 ) ) ( not ( = ?auto_519781 ?auto_519791 ) ) ( not ( = ?auto_519781 ?auto_519792 ) ) ( not ( = ?auto_519781 ?auto_519793 ) ) ( not ( = ?auto_519781 ?auto_519794 ) ) ( not ( = ?auto_519781 ?auto_519795 ) ) ( not ( = ?auto_519781 ?auto_519796 ) ) ( not ( = ?auto_519782 ?auto_519783 ) ) ( not ( = ?auto_519782 ?auto_519784 ) ) ( not ( = ?auto_519782 ?auto_519785 ) ) ( not ( = ?auto_519782 ?auto_519786 ) ) ( not ( = ?auto_519782 ?auto_519787 ) ) ( not ( = ?auto_519782 ?auto_519788 ) ) ( not ( = ?auto_519782 ?auto_519789 ) ) ( not ( = ?auto_519782 ?auto_519790 ) ) ( not ( = ?auto_519782 ?auto_519791 ) ) ( not ( = ?auto_519782 ?auto_519792 ) ) ( not ( = ?auto_519782 ?auto_519793 ) ) ( not ( = ?auto_519782 ?auto_519794 ) ) ( not ( = ?auto_519782 ?auto_519795 ) ) ( not ( = ?auto_519782 ?auto_519796 ) ) ( not ( = ?auto_519783 ?auto_519784 ) ) ( not ( = ?auto_519783 ?auto_519785 ) ) ( not ( = ?auto_519783 ?auto_519786 ) ) ( not ( = ?auto_519783 ?auto_519787 ) ) ( not ( = ?auto_519783 ?auto_519788 ) ) ( not ( = ?auto_519783 ?auto_519789 ) ) ( not ( = ?auto_519783 ?auto_519790 ) ) ( not ( = ?auto_519783 ?auto_519791 ) ) ( not ( = ?auto_519783 ?auto_519792 ) ) ( not ( = ?auto_519783 ?auto_519793 ) ) ( not ( = ?auto_519783 ?auto_519794 ) ) ( not ( = ?auto_519783 ?auto_519795 ) ) ( not ( = ?auto_519783 ?auto_519796 ) ) ( not ( = ?auto_519784 ?auto_519785 ) ) ( not ( = ?auto_519784 ?auto_519786 ) ) ( not ( = ?auto_519784 ?auto_519787 ) ) ( not ( = ?auto_519784 ?auto_519788 ) ) ( not ( = ?auto_519784 ?auto_519789 ) ) ( not ( = ?auto_519784 ?auto_519790 ) ) ( not ( = ?auto_519784 ?auto_519791 ) ) ( not ( = ?auto_519784 ?auto_519792 ) ) ( not ( = ?auto_519784 ?auto_519793 ) ) ( not ( = ?auto_519784 ?auto_519794 ) ) ( not ( = ?auto_519784 ?auto_519795 ) ) ( not ( = ?auto_519784 ?auto_519796 ) ) ( not ( = ?auto_519785 ?auto_519786 ) ) ( not ( = ?auto_519785 ?auto_519787 ) ) ( not ( = ?auto_519785 ?auto_519788 ) ) ( not ( = ?auto_519785 ?auto_519789 ) ) ( not ( = ?auto_519785 ?auto_519790 ) ) ( not ( = ?auto_519785 ?auto_519791 ) ) ( not ( = ?auto_519785 ?auto_519792 ) ) ( not ( = ?auto_519785 ?auto_519793 ) ) ( not ( = ?auto_519785 ?auto_519794 ) ) ( not ( = ?auto_519785 ?auto_519795 ) ) ( not ( = ?auto_519785 ?auto_519796 ) ) ( not ( = ?auto_519786 ?auto_519787 ) ) ( not ( = ?auto_519786 ?auto_519788 ) ) ( not ( = ?auto_519786 ?auto_519789 ) ) ( not ( = ?auto_519786 ?auto_519790 ) ) ( not ( = ?auto_519786 ?auto_519791 ) ) ( not ( = ?auto_519786 ?auto_519792 ) ) ( not ( = ?auto_519786 ?auto_519793 ) ) ( not ( = ?auto_519786 ?auto_519794 ) ) ( not ( = ?auto_519786 ?auto_519795 ) ) ( not ( = ?auto_519786 ?auto_519796 ) ) ( not ( = ?auto_519787 ?auto_519788 ) ) ( not ( = ?auto_519787 ?auto_519789 ) ) ( not ( = ?auto_519787 ?auto_519790 ) ) ( not ( = ?auto_519787 ?auto_519791 ) ) ( not ( = ?auto_519787 ?auto_519792 ) ) ( not ( = ?auto_519787 ?auto_519793 ) ) ( not ( = ?auto_519787 ?auto_519794 ) ) ( not ( = ?auto_519787 ?auto_519795 ) ) ( not ( = ?auto_519787 ?auto_519796 ) ) ( not ( = ?auto_519788 ?auto_519789 ) ) ( not ( = ?auto_519788 ?auto_519790 ) ) ( not ( = ?auto_519788 ?auto_519791 ) ) ( not ( = ?auto_519788 ?auto_519792 ) ) ( not ( = ?auto_519788 ?auto_519793 ) ) ( not ( = ?auto_519788 ?auto_519794 ) ) ( not ( = ?auto_519788 ?auto_519795 ) ) ( not ( = ?auto_519788 ?auto_519796 ) ) ( not ( = ?auto_519789 ?auto_519790 ) ) ( not ( = ?auto_519789 ?auto_519791 ) ) ( not ( = ?auto_519789 ?auto_519792 ) ) ( not ( = ?auto_519789 ?auto_519793 ) ) ( not ( = ?auto_519789 ?auto_519794 ) ) ( not ( = ?auto_519789 ?auto_519795 ) ) ( not ( = ?auto_519789 ?auto_519796 ) ) ( not ( = ?auto_519790 ?auto_519791 ) ) ( not ( = ?auto_519790 ?auto_519792 ) ) ( not ( = ?auto_519790 ?auto_519793 ) ) ( not ( = ?auto_519790 ?auto_519794 ) ) ( not ( = ?auto_519790 ?auto_519795 ) ) ( not ( = ?auto_519790 ?auto_519796 ) ) ( not ( = ?auto_519791 ?auto_519792 ) ) ( not ( = ?auto_519791 ?auto_519793 ) ) ( not ( = ?auto_519791 ?auto_519794 ) ) ( not ( = ?auto_519791 ?auto_519795 ) ) ( not ( = ?auto_519791 ?auto_519796 ) ) ( not ( = ?auto_519792 ?auto_519793 ) ) ( not ( = ?auto_519792 ?auto_519794 ) ) ( not ( = ?auto_519792 ?auto_519795 ) ) ( not ( = ?auto_519792 ?auto_519796 ) ) ( not ( = ?auto_519793 ?auto_519794 ) ) ( not ( = ?auto_519793 ?auto_519795 ) ) ( not ( = ?auto_519793 ?auto_519796 ) ) ( not ( = ?auto_519794 ?auto_519795 ) ) ( not ( = ?auto_519794 ?auto_519796 ) ) ( not ( = ?auto_519795 ?auto_519796 ) ) ( ON ?auto_519794 ?auto_519795 ) ( ON ?auto_519793 ?auto_519794 ) ( ON ?auto_519792 ?auto_519793 ) ( ON ?auto_519791 ?auto_519792 ) ( ON ?auto_519790 ?auto_519791 ) ( CLEAR ?auto_519788 ) ( ON ?auto_519789 ?auto_519790 ) ( CLEAR ?auto_519789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_519781 ?auto_519782 ?auto_519783 ?auto_519784 ?auto_519785 ?auto_519786 ?auto_519787 ?auto_519788 ?auto_519789 )
      ( MAKE-15PILE ?auto_519781 ?auto_519782 ?auto_519783 ?auto_519784 ?auto_519785 ?auto_519786 ?auto_519787 ?auto_519788 ?auto_519789 ?auto_519790 ?auto_519791 ?auto_519792 ?auto_519793 ?auto_519794 ?auto_519795 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519843 - BLOCK
      ?auto_519844 - BLOCK
      ?auto_519845 - BLOCK
      ?auto_519846 - BLOCK
      ?auto_519847 - BLOCK
      ?auto_519848 - BLOCK
      ?auto_519849 - BLOCK
      ?auto_519850 - BLOCK
      ?auto_519851 - BLOCK
      ?auto_519852 - BLOCK
      ?auto_519853 - BLOCK
      ?auto_519854 - BLOCK
      ?auto_519855 - BLOCK
      ?auto_519856 - BLOCK
      ?auto_519857 - BLOCK
    )
    :vars
    (
      ?auto_519858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519857 ?auto_519858 ) ( ON-TABLE ?auto_519843 ) ( ON ?auto_519844 ?auto_519843 ) ( ON ?auto_519845 ?auto_519844 ) ( ON ?auto_519846 ?auto_519845 ) ( ON ?auto_519847 ?auto_519846 ) ( ON ?auto_519848 ?auto_519847 ) ( ON ?auto_519849 ?auto_519848 ) ( not ( = ?auto_519843 ?auto_519844 ) ) ( not ( = ?auto_519843 ?auto_519845 ) ) ( not ( = ?auto_519843 ?auto_519846 ) ) ( not ( = ?auto_519843 ?auto_519847 ) ) ( not ( = ?auto_519843 ?auto_519848 ) ) ( not ( = ?auto_519843 ?auto_519849 ) ) ( not ( = ?auto_519843 ?auto_519850 ) ) ( not ( = ?auto_519843 ?auto_519851 ) ) ( not ( = ?auto_519843 ?auto_519852 ) ) ( not ( = ?auto_519843 ?auto_519853 ) ) ( not ( = ?auto_519843 ?auto_519854 ) ) ( not ( = ?auto_519843 ?auto_519855 ) ) ( not ( = ?auto_519843 ?auto_519856 ) ) ( not ( = ?auto_519843 ?auto_519857 ) ) ( not ( = ?auto_519843 ?auto_519858 ) ) ( not ( = ?auto_519844 ?auto_519845 ) ) ( not ( = ?auto_519844 ?auto_519846 ) ) ( not ( = ?auto_519844 ?auto_519847 ) ) ( not ( = ?auto_519844 ?auto_519848 ) ) ( not ( = ?auto_519844 ?auto_519849 ) ) ( not ( = ?auto_519844 ?auto_519850 ) ) ( not ( = ?auto_519844 ?auto_519851 ) ) ( not ( = ?auto_519844 ?auto_519852 ) ) ( not ( = ?auto_519844 ?auto_519853 ) ) ( not ( = ?auto_519844 ?auto_519854 ) ) ( not ( = ?auto_519844 ?auto_519855 ) ) ( not ( = ?auto_519844 ?auto_519856 ) ) ( not ( = ?auto_519844 ?auto_519857 ) ) ( not ( = ?auto_519844 ?auto_519858 ) ) ( not ( = ?auto_519845 ?auto_519846 ) ) ( not ( = ?auto_519845 ?auto_519847 ) ) ( not ( = ?auto_519845 ?auto_519848 ) ) ( not ( = ?auto_519845 ?auto_519849 ) ) ( not ( = ?auto_519845 ?auto_519850 ) ) ( not ( = ?auto_519845 ?auto_519851 ) ) ( not ( = ?auto_519845 ?auto_519852 ) ) ( not ( = ?auto_519845 ?auto_519853 ) ) ( not ( = ?auto_519845 ?auto_519854 ) ) ( not ( = ?auto_519845 ?auto_519855 ) ) ( not ( = ?auto_519845 ?auto_519856 ) ) ( not ( = ?auto_519845 ?auto_519857 ) ) ( not ( = ?auto_519845 ?auto_519858 ) ) ( not ( = ?auto_519846 ?auto_519847 ) ) ( not ( = ?auto_519846 ?auto_519848 ) ) ( not ( = ?auto_519846 ?auto_519849 ) ) ( not ( = ?auto_519846 ?auto_519850 ) ) ( not ( = ?auto_519846 ?auto_519851 ) ) ( not ( = ?auto_519846 ?auto_519852 ) ) ( not ( = ?auto_519846 ?auto_519853 ) ) ( not ( = ?auto_519846 ?auto_519854 ) ) ( not ( = ?auto_519846 ?auto_519855 ) ) ( not ( = ?auto_519846 ?auto_519856 ) ) ( not ( = ?auto_519846 ?auto_519857 ) ) ( not ( = ?auto_519846 ?auto_519858 ) ) ( not ( = ?auto_519847 ?auto_519848 ) ) ( not ( = ?auto_519847 ?auto_519849 ) ) ( not ( = ?auto_519847 ?auto_519850 ) ) ( not ( = ?auto_519847 ?auto_519851 ) ) ( not ( = ?auto_519847 ?auto_519852 ) ) ( not ( = ?auto_519847 ?auto_519853 ) ) ( not ( = ?auto_519847 ?auto_519854 ) ) ( not ( = ?auto_519847 ?auto_519855 ) ) ( not ( = ?auto_519847 ?auto_519856 ) ) ( not ( = ?auto_519847 ?auto_519857 ) ) ( not ( = ?auto_519847 ?auto_519858 ) ) ( not ( = ?auto_519848 ?auto_519849 ) ) ( not ( = ?auto_519848 ?auto_519850 ) ) ( not ( = ?auto_519848 ?auto_519851 ) ) ( not ( = ?auto_519848 ?auto_519852 ) ) ( not ( = ?auto_519848 ?auto_519853 ) ) ( not ( = ?auto_519848 ?auto_519854 ) ) ( not ( = ?auto_519848 ?auto_519855 ) ) ( not ( = ?auto_519848 ?auto_519856 ) ) ( not ( = ?auto_519848 ?auto_519857 ) ) ( not ( = ?auto_519848 ?auto_519858 ) ) ( not ( = ?auto_519849 ?auto_519850 ) ) ( not ( = ?auto_519849 ?auto_519851 ) ) ( not ( = ?auto_519849 ?auto_519852 ) ) ( not ( = ?auto_519849 ?auto_519853 ) ) ( not ( = ?auto_519849 ?auto_519854 ) ) ( not ( = ?auto_519849 ?auto_519855 ) ) ( not ( = ?auto_519849 ?auto_519856 ) ) ( not ( = ?auto_519849 ?auto_519857 ) ) ( not ( = ?auto_519849 ?auto_519858 ) ) ( not ( = ?auto_519850 ?auto_519851 ) ) ( not ( = ?auto_519850 ?auto_519852 ) ) ( not ( = ?auto_519850 ?auto_519853 ) ) ( not ( = ?auto_519850 ?auto_519854 ) ) ( not ( = ?auto_519850 ?auto_519855 ) ) ( not ( = ?auto_519850 ?auto_519856 ) ) ( not ( = ?auto_519850 ?auto_519857 ) ) ( not ( = ?auto_519850 ?auto_519858 ) ) ( not ( = ?auto_519851 ?auto_519852 ) ) ( not ( = ?auto_519851 ?auto_519853 ) ) ( not ( = ?auto_519851 ?auto_519854 ) ) ( not ( = ?auto_519851 ?auto_519855 ) ) ( not ( = ?auto_519851 ?auto_519856 ) ) ( not ( = ?auto_519851 ?auto_519857 ) ) ( not ( = ?auto_519851 ?auto_519858 ) ) ( not ( = ?auto_519852 ?auto_519853 ) ) ( not ( = ?auto_519852 ?auto_519854 ) ) ( not ( = ?auto_519852 ?auto_519855 ) ) ( not ( = ?auto_519852 ?auto_519856 ) ) ( not ( = ?auto_519852 ?auto_519857 ) ) ( not ( = ?auto_519852 ?auto_519858 ) ) ( not ( = ?auto_519853 ?auto_519854 ) ) ( not ( = ?auto_519853 ?auto_519855 ) ) ( not ( = ?auto_519853 ?auto_519856 ) ) ( not ( = ?auto_519853 ?auto_519857 ) ) ( not ( = ?auto_519853 ?auto_519858 ) ) ( not ( = ?auto_519854 ?auto_519855 ) ) ( not ( = ?auto_519854 ?auto_519856 ) ) ( not ( = ?auto_519854 ?auto_519857 ) ) ( not ( = ?auto_519854 ?auto_519858 ) ) ( not ( = ?auto_519855 ?auto_519856 ) ) ( not ( = ?auto_519855 ?auto_519857 ) ) ( not ( = ?auto_519855 ?auto_519858 ) ) ( not ( = ?auto_519856 ?auto_519857 ) ) ( not ( = ?auto_519856 ?auto_519858 ) ) ( not ( = ?auto_519857 ?auto_519858 ) ) ( ON ?auto_519856 ?auto_519857 ) ( ON ?auto_519855 ?auto_519856 ) ( ON ?auto_519854 ?auto_519855 ) ( ON ?auto_519853 ?auto_519854 ) ( ON ?auto_519852 ?auto_519853 ) ( ON ?auto_519851 ?auto_519852 ) ( CLEAR ?auto_519849 ) ( ON ?auto_519850 ?auto_519851 ) ( CLEAR ?auto_519850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_519843 ?auto_519844 ?auto_519845 ?auto_519846 ?auto_519847 ?auto_519848 ?auto_519849 ?auto_519850 )
      ( MAKE-15PILE ?auto_519843 ?auto_519844 ?auto_519845 ?auto_519846 ?auto_519847 ?auto_519848 ?auto_519849 ?auto_519850 ?auto_519851 ?auto_519852 ?auto_519853 ?auto_519854 ?auto_519855 ?auto_519856 ?auto_519857 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519905 - BLOCK
      ?auto_519906 - BLOCK
      ?auto_519907 - BLOCK
      ?auto_519908 - BLOCK
      ?auto_519909 - BLOCK
      ?auto_519910 - BLOCK
      ?auto_519911 - BLOCK
      ?auto_519912 - BLOCK
      ?auto_519913 - BLOCK
      ?auto_519914 - BLOCK
      ?auto_519915 - BLOCK
      ?auto_519916 - BLOCK
      ?auto_519917 - BLOCK
      ?auto_519918 - BLOCK
      ?auto_519919 - BLOCK
    )
    :vars
    (
      ?auto_519920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519919 ?auto_519920 ) ( ON-TABLE ?auto_519905 ) ( ON ?auto_519906 ?auto_519905 ) ( ON ?auto_519907 ?auto_519906 ) ( ON ?auto_519908 ?auto_519907 ) ( ON ?auto_519909 ?auto_519908 ) ( ON ?auto_519910 ?auto_519909 ) ( not ( = ?auto_519905 ?auto_519906 ) ) ( not ( = ?auto_519905 ?auto_519907 ) ) ( not ( = ?auto_519905 ?auto_519908 ) ) ( not ( = ?auto_519905 ?auto_519909 ) ) ( not ( = ?auto_519905 ?auto_519910 ) ) ( not ( = ?auto_519905 ?auto_519911 ) ) ( not ( = ?auto_519905 ?auto_519912 ) ) ( not ( = ?auto_519905 ?auto_519913 ) ) ( not ( = ?auto_519905 ?auto_519914 ) ) ( not ( = ?auto_519905 ?auto_519915 ) ) ( not ( = ?auto_519905 ?auto_519916 ) ) ( not ( = ?auto_519905 ?auto_519917 ) ) ( not ( = ?auto_519905 ?auto_519918 ) ) ( not ( = ?auto_519905 ?auto_519919 ) ) ( not ( = ?auto_519905 ?auto_519920 ) ) ( not ( = ?auto_519906 ?auto_519907 ) ) ( not ( = ?auto_519906 ?auto_519908 ) ) ( not ( = ?auto_519906 ?auto_519909 ) ) ( not ( = ?auto_519906 ?auto_519910 ) ) ( not ( = ?auto_519906 ?auto_519911 ) ) ( not ( = ?auto_519906 ?auto_519912 ) ) ( not ( = ?auto_519906 ?auto_519913 ) ) ( not ( = ?auto_519906 ?auto_519914 ) ) ( not ( = ?auto_519906 ?auto_519915 ) ) ( not ( = ?auto_519906 ?auto_519916 ) ) ( not ( = ?auto_519906 ?auto_519917 ) ) ( not ( = ?auto_519906 ?auto_519918 ) ) ( not ( = ?auto_519906 ?auto_519919 ) ) ( not ( = ?auto_519906 ?auto_519920 ) ) ( not ( = ?auto_519907 ?auto_519908 ) ) ( not ( = ?auto_519907 ?auto_519909 ) ) ( not ( = ?auto_519907 ?auto_519910 ) ) ( not ( = ?auto_519907 ?auto_519911 ) ) ( not ( = ?auto_519907 ?auto_519912 ) ) ( not ( = ?auto_519907 ?auto_519913 ) ) ( not ( = ?auto_519907 ?auto_519914 ) ) ( not ( = ?auto_519907 ?auto_519915 ) ) ( not ( = ?auto_519907 ?auto_519916 ) ) ( not ( = ?auto_519907 ?auto_519917 ) ) ( not ( = ?auto_519907 ?auto_519918 ) ) ( not ( = ?auto_519907 ?auto_519919 ) ) ( not ( = ?auto_519907 ?auto_519920 ) ) ( not ( = ?auto_519908 ?auto_519909 ) ) ( not ( = ?auto_519908 ?auto_519910 ) ) ( not ( = ?auto_519908 ?auto_519911 ) ) ( not ( = ?auto_519908 ?auto_519912 ) ) ( not ( = ?auto_519908 ?auto_519913 ) ) ( not ( = ?auto_519908 ?auto_519914 ) ) ( not ( = ?auto_519908 ?auto_519915 ) ) ( not ( = ?auto_519908 ?auto_519916 ) ) ( not ( = ?auto_519908 ?auto_519917 ) ) ( not ( = ?auto_519908 ?auto_519918 ) ) ( not ( = ?auto_519908 ?auto_519919 ) ) ( not ( = ?auto_519908 ?auto_519920 ) ) ( not ( = ?auto_519909 ?auto_519910 ) ) ( not ( = ?auto_519909 ?auto_519911 ) ) ( not ( = ?auto_519909 ?auto_519912 ) ) ( not ( = ?auto_519909 ?auto_519913 ) ) ( not ( = ?auto_519909 ?auto_519914 ) ) ( not ( = ?auto_519909 ?auto_519915 ) ) ( not ( = ?auto_519909 ?auto_519916 ) ) ( not ( = ?auto_519909 ?auto_519917 ) ) ( not ( = ?auto_519909 ?auto_519918 ) ) ( not ( = ?auto_519909 ?auto_519919 ) ) ( not ( = ?auto_519909 ?auto_519920 ) ) ( not ( = ?auto_519910 ?auto_519911 ) ) ( not ( = ?auto_519910 ?auto_519912 ) ) ( not ( = ?auto_519910 ?auto_519913 ) ) ( not ( = ?auto_519910 ?auto_519914 ) ) ( not ( = ?auto_519910 ?auto_519915 ) ) ( not ( = ?auto_519910 ?auto_519916 ) ) ( not ( = ?auto_519910 ?auto_519917 ) ) ( not ( = ?auto_519910 ?auto_519918 ) ) ( not ( = ?auto_519910 ?auto_519919 ) ) ( not ( = ?auto_519910 ?auto_519920 ) ) ( not ( = ?auto_519911 ?auto_519912 ) ) ( not ( = ?auto_519911 ?auto_519913 ) ) ( not ( = ?auto_519911 ?auto_519914 ) ) ( not ( = ?auto_519911 ?auto_519915 ) ) ( not ( = ?auto_519911 ?auto_519916 ) ) ( not ( = ?auto_519911 ?auto_519917 ) ) ( not ( = ?auto_519911 ?auto_519918 ) ) ( not ( = ?auto_519911 ?auto_519919 ) ) ( not ( = ?auto_519911 ?auto_519920 ) ) ( not ( = ?auto_519912 ?auto_519913 ) ) ( not ( = ?auto_519912 ?auto_519914 ) ) ( not ( = ?auto_519912 ?auto_519915 ) ) ( not ( = ?auto_519912 ?auto_519916 ) ) ( not ( = ?auto_519912 ?auto_519917 ) ) ( not ( = ?auto_519912 ?auto_519918 ) ) ( not ( = ?auto_519912 ?auto_519919 ) ) ( not ( = ?auto_519912 ?auto_519920 ) ) ( not ( = ?auto_519913 ?auto_519914 ) ) ( not ( = ?auto_519913 ?auto_519915 ) ) ( not ( = ?auto_519913 ?auto_519916 ) ) ( not ( = ?auto_519913 ?auto_519917 ) ) ( not ( = ?auto_519913 ?auto_519918 ) ) ( not ( = ?auto_519913 ?auto_519919 ) ) ( not ( = ?auto_519913 ?auto_519920 ) ) ( not ( = ?auto_519914 ?auto_519915 ) ) ( not ( = ?auto_519914 ?auto_519916 ) ) ( not ( = ?auto_519914 ?auto_519917 ) ) ( not ( = ?auto_519914 ?auto_519918 ) ) ( not ( = ?auto_519914 ?auto_519919 ) ) ( not ( = ?auto_519914 ?auto_519920 ) ) ( not ( = ?auto_519915 ?auto_519916 ) ) ( not ( = ?auto_519915 ?auto_519917 ) ) ( not ( = ?auto_519915 ?auto_519918 ) ) ( not ( = ?auto_519915 ?auto_519919 ) ) ( not ( = ?auto_519915 ?auto_519920 ) ) ( not ( = ?auto_519916 ?auto_519917 ) ) ( not ( = ?auto_519916 ?auto_519918 ) ) ( not ( = ?auto_519916 ?auto_519919 ) ) ( not ( = ?auto_519916 ?auto_519920 ) ) ( not ( = ?auto_519917 ?auto_519918 ) ) ( not ( = ?auto_519917 ?auto_519919 ) ) ( not ( = ?auto_519917 ?auto_519920 ) ) ( not ( = ?auto_519918 ?auto_519919 ) ) ( not ( = ?auto_519918 ?auto_519920 ) ) ( not ( = ?auto_519919 ?auto_519920 ) ) ( ON ?auto_519918 ?auto_519919 ) ( ON ?auto_519917 ?auto_519918 ) ( ON ?auto_519916 ?auto_519917 ) ( ON ?auto_519915 ?auto_519916 ) ( ON ?auto_519914 ?auto_519915 ) ( ON ?auto_519913 ?auto_519914 ) ( ON ?auto_519912 ?auto_519913 ) ( CLEAR ?auto_519910 ) ( ON ?auto_519911 ?auto_519912 ) ( CLEAR ?auto_519911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_519905 ?auto_519906 ?auto_519907 ?auto_519908 ?auto_519909 ?auto_519910 ?auto_519911 )
      ( MAKE-15PILE ?auto_519905 ?auto_519906 ?auto_519907 ?auto_519908 ?auto_519909 ?auto_519910 ?auto_519911 ?auto_519912 ?auto_519913 ?auto_519914 ?auto_519915 ?auto_519916 ?auto_519917 ?auto_519918 ?auto_519919 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_519967 - BLOCK
      ?auto_519968 - BLOCK
      ?auto_519969 - BLOCK
      ?auto_519970 - BLOCK
      ?auto_519971 - BLOCK
      ?auto_519972 - BLOCK
      ?auto_519973 - BLOCK
      ?auto_519974 - BLOCK
      ?auto_519975 - BLOCK
      ?auto_519976 - BLOCK
      ?auto_519977 - BLOCK
      ?auto_519978 - BLOCK
      ?auto_519979 - BLOCK
      ?auto_519980 - BLOCK
      ?auto_519981 - BLOCK
    )
    :vars
    (
      ?auto_519982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_519981 ?auto_519982 ) ( ON-TABLE ?auto_519967 ) ( ON ?auto_519968 ?auto_519967 ) ( ON ?auto_519969 ?auto_519968 ) ( ON ?auto_519970 ?auto_519969 ) ( ON ?auto_519971 ?auto_519970 ) ( not ( = ?auto_519967 ?auto_519968 ) ) ( not ( = ?auto_519967 ?auto_519969 ) ) ( not ( = ?auto_519967 ?auto_519970 ) ) ( not ( = ?auto_519967 ?auto_519971 ) ) ( not ( = ?auto_519967 ?auto_519972 ) ) ( not ( = ?auto_519967 ?auto_519973 ) ) ( not ( = ?auto_519967 ?auto_519974 ) ) ( not ( = ?auto_519967 ?auto_519975 ) ) ( not ( = ?auto_519967 ?auto_519976 ) ) ( not ( = ?auto_519967 ?auto_519977 ) ) ( not ( = ?auto_519967 ?auto_519978 ) ) ( not ( = ?auto_519967 ?auto_519979 ) ) ( not ( = ?auto_519967 ?auto_519980 ) ) ( not ( = ?auto_519967 ?auto_519981 ) ) ( not ( = ?auto_519967 ?auto_519982 ) ) ( not ( = ?auto_519968 ?auto_519969 ) ) ( not ( = ?auto_519968 ?auto_519970 ) ) ( not ( = ?auto_519968 ?auto_519971 ) ) ( not ( = ?auto_519968 ?auto_519972 ) ) ( not ( = ?auto_519968 ?auto_519973 ) ) ( not ( = ?auto_519968 ?auto_519974 ) ) ( not ( = ?auto_519968 ?auto_519975 ) ) ( not ( = ?auto_519968 ?auto_519976 ) ) ( not ( = ?auto_519968 ?auto_519977 ) ) ( not ( = ?auto_519968 ?auto_519978 ) ) ( not ( = ?auto_519968 ?auto_519979 ) ) ( not ( = ?auto_519968 ?auto_519980 ) ) ( not ( = ?auto_519968 ?auto_519981 ) ) ( not ( = ?auto_519968 ?auto_519982 ) ) ( not ( = ?auto_519969 ?auto_519970 ) ) ( not ( = ?auto_519969 ?auto_519971 ) ) ( not ( = ?auto_519969 ?auto_519972 ) ) ( not ( = ?auto_519969 ?auto_519973 ) ) ( not ( = ?auto_519969 ?auto_519974 ) ) ( not ( = ?auto_519969 ?auto_519975 ) ) ( not ( = ?auto_519969 ?auto_519976 ) ) ( not ( = ?auto_519969 ?auto_519977 ) ) ( not ( = ?auto_519969 ?auto_519978 ) ) ( not ( = ?auto_519969 ?auto_519979 ) ) ( not ( = ?auto_519969 ?auto_519980 ) ) ( not ( = ?auto_519969 ?auto_519981 ) ) ( not ( = ?auto_519969 ?auto_519982 ) ) ( not ( = ?auto_519970 ?auto_519971 ) ) ( not ( = ?auto_519970 ?auto_519972 ) ) ( not ( = ?auto_519970 ?auto_519973 ) ) ( not ( = ?auto_519970 ?auto_519974 ) ) ( not ( = ?auto_519970 ?auto_519975 ) ) ( not ( = ?auto_519970 ?auto_519976 ) ) ( not ( = ?auto_519970 ?auto_519977 ) ) ( not ( = ?auto_519970 ?auto_519978 ) ) ( not ( = ?auto_519970 ?auto_519979 ) ) ( not ( = ?auto_519970 ?auto_519980 ) ) ( not ( = ?auto_519970 ?auto_519981 ) ) ( not ( = ?auto_519970 ?auto_519982 ) ) ( not ( = ?auto_519971 ?auto_519972 ) ) ( not ( = ?auto_519971 ?auto_519973 ) ) ( not ( = ?auto_519971 ?auto_519974 ) ) ( not ( = ?auto_519971 ?auto_519975 ) ) ( not ( = ?auto_519971 ?auto_519976 ) ) ( not ( = ?auto_519971 ?auto_519977 ) ) ( not ( = ?auto_519971 ?auto_519978 ) ) ( not ( = ?auto_519971 ?auto_519979 ) ) ( not ( = ?auto_519971 ?auto_519980 ) ) ( not ( = ?auto_519971 ?auto_519981 ) ) ( not ( = ?auto_519971 ?auto_519982 ) ) ( not ( = ?auto_519972 ?auto_519973 ) ) ( not ( = ?auto_519972 ?auto_519974 ) ) ( not ( = ?auto_519972 ?auto_519975 ) ) ( not ( = ?auto_519972 ?auto_519976 ) ) ( not ( = ?auto_519972 ?auto_519977 ) ) ( not ( = ?auto_519972 ?auto_519978 ) ) ( not ( = ?auto_519972 ?auto_519979 ) ) ( not ( = ?auto_519972 ?auto_519980 ) ) ( not ( = ?auto_519972 ?auto_519981 ) ) ( not ( = ?auto_519972 ?auto_519982 ) ) ( not ( = ?auto_519973 ?auto_519974 ) ) ( not ( = ?auto_519973 ?auto_519975 ) ) ( not ( = ?auto_519973 ?auto_519976 ) ) ( not ( = ?auto_519973 ?auto_519977 ) ) ( not ( = ?auto_519973 ?auto_519978 ) ) ( not ( = ?auto_519973 ?auto_519979 ) ) ( not ( = ?auto_519973 ?auto_519980 ) ) ( not ( = ?auto_519973 ?auto_519981 ) ) ( not ( = ?auto_519973 ?auto_519982 ) ) ( not ( = ?auto_519974 ?auto_519975 ) ) ( not ( = ?auto_519974 ?auto_519976 ) ) ( not ( = ?auto_519974 ?auto_519977 ) ) ( not ( = ?auto_519974 ?auto_519978 ) ) ( not ( = ?auto_519974 ?auto_519979 ) ) ( not ( = ?auto_519974 ?auto_519980 ) ) ( not ( = ?auto_519974 ?auto_519981 ) ) ( not ( = ?auto_519974 ?auto_519982 ) ) ( not ( = ?auto_519975 ?auto_519976 ) ) ( not ( = ?auto_519975 ?auto_519977 ) ) ( not ( = ?auto_519975 ?auto_519978 ) ) ( not ( = ?auto_519975 ?auto_519979 ) ) ( not ( = ?auto_519975 ?auto_519980 ) ) ( not ( = ?auto_519975 ?auto_519981 ) ) ( not ( = ?auto_519975 ?auto_519982 ) ) ( not ( = ?auto_519976 ?auto_519977 ) ) ( not ( = ?auto_519976 ?auto_519978 ) ) ( not ( = ?auto_519976 ?auto_519979 ) ) ( not ( = ?auto_519976 ?auto_519980 ) ) ( not ( = ?auto_519976 ?auto_519981 ) ) ( not ( = ?auto_519976 ?auto_519982 ) ) ( not ( = ?auto_519977 ?auto_519978 ) ) ( not ( = ?auto_519977 ?auto_519979 ) ) ( not ( = ?auto_519977 ?auto_519980 ) ) ( not ( = ?auto_519977 ?auto_519981 ) ) ( not ( = ?auto_519977 ?auto_519982 ) ) ( not ( = ?auto_519978 ?auto_519979 ) ) ( not ( = ?auto_519978 ?auto_519980 ) ) ( not ( = ?auto_519978 ?auto_519981 ) ) ( not ( = ?auto_519978 ?auto_519982 ) ) ( not ( = ?auto_519979 ?auto_519980 ) ) ( not ( = ?auto_519979 ?auto_519981 ) ) ( not ( = ?auto_519979 ?auto_519982 ) ) ( not ( = ?auto_519980 ?auto_519981 ) ) ( not ( = ?auto_519980 ?auto_519982 ) ) ( not ( = ?auto_519981 ?auto_519982 ) ) ( ON ?auto_519980 ?auto_519981 ) ( ON ?auto_519979 ?auto_519980 ) ( ON ?auto_519978 ?auto_519979 ) ( ON ?auto_519977 ?auto_519978 ) ( ON ?auto_519976 ?auto_519977 ) ( ON ?auto_519975 ?auto_519976 ) ( ON ?auto_519974 ?auto_519975 ) ( ON ?auto_519973 ?auto_519974 ) ( CLEAR ?auto_519971 ) ( ON ?auto_519972 ?auto_519973 ) ( CLEAR ?auto_519972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_519967 ?auto_519968 ?auto_519969 ?auto_519970 ?auto_519971 ?auto_519972 )
      ( MAKE-15PILE ?auto_519967 ?auto_519968 ?auto_519969 ?auto_519970 ?auto_519971 ?auto_519972 ?auto_519973 ?auto_519974 ?auto_519975 ?auto_519976 ?auto_519977 ?auto_519978 ?auto_519979 ?auto_519980 ?auto_519981 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_520029 - BLOCK
      ?auto_520030 - BLOCK
      ?auto_520031 - BLOCK
      ?auto_520032 - BLOCK
      ?auto_520033 - BLOCK
      ?auto_520034 - BLOCK
      ?auto_520035 - BLOCK
      ?auto_520036 - BLOCK
      ?auto_520037 - BLOCK
      ?auto_520038 - BLOCK
      ?auto_520039 - BLOCK
      ?auto_520040 - BLOCK
      ?auto_520041 - BLOCK
      ?auto_520042 - BLOCK
      ?auto_520043 - BLOCK
    )
    :vars
    (
      ?auto_520044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520043 ?auto_520044 ) ( ON-TABLE ?auto_520029 ) ( ON ?auto_520030 ?auto_520029 ) ( ON ?auto_520031 ?auto_520030 ) ( ON ?auto_520032 ?auto_520031 ) ( not ( = ?auto_520029 ?auto_520030 ) ) ( not ( = ?auto_520029 ?auto_520031 ) ) ( not ( = ?auto_520029 ?auto_520032 ) ) ( not ( = ?auto_520029 ?auto_520033 ) ) ( not ( = ?auto_520029 ?auto_520034 ) ) ( not ( = ?auto_520029 ?auto_520035 ) ) ( not ( = ?auto_520029 ?auto_520036 ) ) ( not ( = ?auto_520029 ?auto_520037 ) ) ( not ( = ?auto_520029 ?auto_520038 ) ) ( not ( = ?auto_520029 ?auto_520039 ) ) ( not ( = ?auto_520029 ?auto_520040 ) ) ( not ( = ?auto_520029 ?auto_520041 ) ) ( not ( = ?auto_520029 ?auto_520042 ) ) ( not ( = ?auto_520029 ?auto_520043 ) ) ( not ( = ?auto_520029 ?auto_520044 ) ) ( not ( = ?auto_520030 ?auto_520031 ) ) ( not ( = ?auto_520030 ?auto_520032 ) ) ( not ( = ?auto_520030 ?auto_520033 ) ) ( not ( = ?auto_520030 ?auto_520034 ) ) ( not ( = ?auto_520030 ?auto_520035 ) ) ( not ( = ?auto_520030 ?auto_520036 ) ) ( not ( = ?auto_520030 ?auto_520037 ) ) ( not ( = ?auto_520030 ?auto_520038 ) ) ( not ( = ?auto_520030 ?auto_520039 ) ) ( not ( = ?auto_520030 ?auto_520040 ) ) ( not ( = ?auto_520030 ?auto_520041 ) ) ( not ( = ?auto_520030 ?auto_520042 ) ) ( not ( = ?auto_520030 ?auto_520043 ) ) ( not ( = ?auto_520030 ?auto_520044 ) ) ( not ( = ?auto_520031 ?auto_520032 ) ) ( not ( = ?auto_520031 ?auto_520033 ) ) ( not ( = ?auto_520031 ?auto_520034 ) ) ( not ( = ?auto_520031 ?auto_520035 ) ) ( not ( = ?auto_520031 ?auto_520036 ) ) ( not ( = ?auto_520031 ?auto_520037 ) ) ( not ( = ?auto_520031 ?auto_520038 ) ) ( not ( = ?auto_520031 ?auto_520039 ) ) ( not ( = ?auto_520031 ?auto_520040 ) ) ( not ( = ?auto_520031 ?auto_520041 ) ) ( not ( = ?auto_520031 ?auto_520042 ) ) ( not ( = ?auto_520031 ?auto_520043 ) ) ( not ( = ?auto_520031 ?auto_520044 ) ) ( not ( = ?auto_520032 ?auto_520033 ) ) ( not ( = ?auto_520032 ?auto_520034 ) ) ( not ( = ?auto_520032 ?auto_520035 ) ) ( not ( = ?auto_520032 ?auto_520036 ) ) ( not ( = ?auto_520032 ?auto_520037 ) ) ( not ( = ?auto_520032 ?auto_520038 ) ) ( not ( = ?auto_520032 ?auto_520039 ) ) ( not ( = ?auto_520032 ?auto_520040 ) ) ( not ( = ?auto_520032 ?auto_520041 ) ) ( not ( = ?auto_520032 ?auto_520042 ) ) ( not ( = ?auto_520032 ?auto_520043 ) ) ( not ( = ?auto_520032 ?auto_520044 ) ) ( not ( = ?auto_520033 ?auto_520034 ) ) ( not ( = ?auto_520033 ?auto_520035 ) ) ( not ( = ?auto_520033 ?auto_520036 ) ) ( not ( = ?auto_520033 ?auto_520037 ) ) ( not ( = ?auto_520033 ?auto_520038 ) ) ( not ( = ?auto_520033 ?auto_520039 ) ) ( not ( = ?auto_520033 ?auto_520040 ) ) ( not ( = ?auto_520033 ?auto_520041 ) ) ( not ( = ?auto_520033 ?auto_520042 ) ) ( not ( = ?auto_520033 ?auto_520043 ) ) ( not ( = ?auto_520033 ?auto_520044 ) ) ( not ( = ?auto_520034 ?auto_520035 ) ) ( not ( = ?auto_520034 ?auto_520036 ) ) ( not ( = ?auto_520034 ?auto_520037 ) ) ( not ( = ?auto_520034 ?auto_520038 ) ) ( not ( = ?auto_520034 ?auto_520039 ) ) ( not ( = ?auto_520034 ?auto_520040 ) ) ( not ( = ?auto_520034 ?auto_520041 ) ) ( not ( = ?auto_520034 ?auto_520042 ) ) ( not ( = ?auto_520034 ?auto_520043 ) ) ( not ( = ?auto_520034 ?auto_520044 ) ) ( not ( = ?auto_520035 ?auto_520036 ) ) ( not ( = ?auto_520035 ?auto_520037 ) ) ( not ( = ?auto_520035 ?auto_520038 ) ) ( not ( = ?auto_520035 ?auto_520039 ) ) ( not ( = ?auto_520035 ?auto_520040 ) ) ( not ( = ?auto_520035 ?auto_520041 ) ) ( not ( = ?auto_520035 ?auto_520042 ) ) ( not ( = ?auto_520035 ?auto_520043 ) ) ( not ( = ?auto_520035 ?auto_520044 ) ) ( not ( = ?auto_520036 ?auto_520037 ) ) ( not ( = ?auto_520036 ?auto_520038 ) ) ( not ( = ?auto_520036 ?auto_520039 ) ) ( not ( = ?auto_520036 ?auto_520040 ) ) ( not ( = ?auto_520036 ?auto_520041 ) ) ( not ( = ?auto_520036 ?auto_520042 ) ) ( not ( = ?auto_520036 ?auto_520043 ) ) ( not ( = ?auto_520036 ?auto_520044 ) ) ( not ( = ?auto_520037 ?auto_520038 ) ) ( not ( = ?auto_520037 ?auto_520039 ) ) ( not ( = ?auto_520037 ?auto_520040 ) ) ( not ( = ?auto_520037 ?auto_520041 ) ) ( not ( = ?auto_520037 ?auto_520042 ) ) ( not ( = ?auto_520037 ?auto_520043 ) ) ( not ( = ?auto_520037 ?auto_520044 ) ) ( not ( = ?auto_520038 ?auto_520039 ) ) ( not ( = ?auto_520038 ?auto_520040 ) ) ( not ( = ?auto_520038 ?auto_520041 ) ) ( not ( = ?auto_520038 ?auto_520042 ) ) ( not ( = ?auto_520038 ?auto_520043 ) ) ( not ( = ?auto_520038 ?auto_520044 ) ) ( not ( = ?auto_520039 ?auto_520040 ) ) ( not ( = ?auto_520039 ?auto_520041 ) ) ( not ( = ?auto_520039 ?auto_520042 ) ) ( not ( = ?auto_520039 ?auto_520043 ) ) ( not ( = ?auto_520039 ?auto_520044 ) ) ( not ( = ?auto_520040 ?auto_520041 ) ) ( not ( = ?auto_520040 ?auto_520042 ) ) ( not ( = ?auto_520040 ?auto_520043 ) ) ( not ( = ?auto_520040 ?auto_520044 ) ) ( not ( = ?auto_520041 ?auto_520042 ) ) ( not ( = ?auto_520041 ?auto_520043 ) ) ( not ( = ?auto_520041 ?auto_520044 ) ) ( not ( = ?auto_520042 ?auto_520043 ) ) ( not ( = ?auto_520042 ?auto_520044 ) ) ( not ( = ?auto_520043 ?auto_520044 ) ) ( ON ?auto_520042 ?auto_520043 ) ( ON ?auto_520041 ?auto_520042 ) ( ON ?auto_520040 ?auto_520041 ) ( ON ?auto_520039 ?auto_520040 ) ( ON ?auto_520038 ?auto_520039 ) ( ON ?auto_520037 ?auto_520038 ) ( ON ?auto_520036 ?auto_520037 ) ( ON ?auto_520035 ?auto_520036 ) ( ON ?auto_520034 ?auto_520035 ) ( CLEAR ?auto_520032 ) ( ON ?auto_520033 ?auto_520034 ) ( CLEAR ?auto_520033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_520029 ?auto_520030 ?auto_520031 ?auto_520032 ?auto_520033 )
      ( MAKE-15PILE ?auto_520029 ?auto_520030 ?auto_520031 ?auto_520032 ?auto_520033 ?auto_520034 ?auto_520035 ?auto_520036 ?auto_520037 ?auto_520038 ?auto_520039 ?auto_520040 ?auto_520041 ?auto_520042 ?auto_520043 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_520091 - BLOCK
      ?auto_520092 - BLOCK
      ?auto_520093 - BLOCK
      ?auto_520094 - BLOCK
      ?auto_520095 - BLOCK
      ?auto_520096 - BLOCK
      ?auto_520097 - BLOCK
      ?auto_520098 - BLOCK
      ?auto_520099 - BLOCK
      ?auto_520100 - BLOCK
      ?auto_520101 - BLOCK
      ?auto_520102 - BLOCK
      ?auto_520103 - BLOCK
      ?auto_520104 - BLOCK
      ?auto_520105 - BLOCK
    )
    :vars
    (
      ?auto_520106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520105 ?auto_520106 ) ( ON-TABLE ?auto_520091 ) ( ON ?auto_520092 ?auto_520091 ) ( ON ?auto_520093 ?auto_520092 ) ( not ( = ?auto_520091 ?auto_520092 ) ) ( not ( = ?auto_520091 ?auto_520093 ) ) ( not ( = ?auto_520091 ?auto_520094 ) ) ( not ( = ?auto_520091 ?auto_520095 ) ) ( not ( = ?auto_520091 ?auto_520096 ) ) ( not ( = ?auto_520091 ?auto_520097 ) ) ( not ( = ?auto_520091 ?auto_520098 ) ) ( not ( = ?auto_520091 ?auto_520099 ) ) ( not ( = ?auto_520091 ?auto_520100 ) ) ( not ( = ?auto_520091 ?auto_520101 ) ) ( not ( = ?auto_520091 ?auto_520102 ) ) ( not ( = ?auto_520091 ?auto_520103 ) ) ( not ( = ?auto_520091 ?auto_520104 ) ) ( not ( = ?auto_520091 ?auto_520105 ) ) ( not ( = ?auto_520091 ?auto_520106 ) ) ( not ( = ?auto_520092 ?auto_520093 ) ) ( not ( = ?auto_520092 ?auto_520094 ) ) ( not ( = ?auto_520092 ?auto_520095 ) ) ( not ( = ?auto_520092 ?auto_520096 ) ) ( not ( = ?auto_520092 ?auto_520097 ) ) ( not ( = ?auto_520092 ?auto_520098 ) ) ( not ( = ?auto_520092 ?auto_520099 ) ) ( not ( = ?auto_520092 ?auto_520100 ) ) ( not ( = ?auto_520092 ?auto_520101 ) ) ( not ( = ?auto_520092 ?auto_520102 ) ) ( not ( = ?auto_520092 ?auto_520103 ) ) ( not ( = ?auto_520092 ?auto_520104 ) ) ( not ( = ?auto_520092 ?auto_520105 ) ) ( not ( = ?auto_520092 ?auto_520106 ) ) ( not ( = ?auto_520093 ?auto_520094 ) ) ( not ( = ?auto_520093 ?auto_520095 ) ) ( not ( = ?auto_520093 ?auto_520096 ) ) ( not ( = ?auto_520093 ?auto_520097 ) ) ( not ( = ?auto_520093 ?auto_520098 ) ) ( not ( = ?auto_520093 ?auto_520099 ) ) ( not ( = ?auto_520093 ?auto_520100 ) ) ( not ( = ?auto_520093 ?auto_520101 ) ) ( not ( = ?auto_520093 ?auto_520102 ) ) ( not ( = ?auto_520093 ?auto_520103 ) ) ( not ( = ?auto_520093 ?auto_520104 ) ) ( not ( = ?auto_520093 ?auto_520105 ) ) ( not ( = ?auto_520093 ?auto_520106 ) ) ( not ( = ?auto_520094 ?auto_520095 ) ) ( not ( = ?auto_520094 ?auto_520096 ) ) ( not ( = ?auto_520094 ?auto_520097 ) ) ( not ( = ?auto_520094 ?auto_520098 ) ) ( not ( = ?auto_520094 ?auto_520099 ) ) ( not ( = ?auto_520094 ?auto_520100 ) ) ( not ( = ?auto_520094 ?auto_520101 ) ) ( not ( = ?auto_520094 ?auto_520102 ) ) ( not ( = ?auto_520094 ?auto_520103 ) ) ( not ( = ?auto_520094 ?auto_520104 ) ) ( not ( = ?auto_520094 ?auto_520105 ) ) ( not ( = ?auto_520094 ?auto_520106 ) ) ( not ( = ?auto_520095 ?auto_520096 ) ) ( not ( = ?auto_520095 ?auto_520097 ) ) ( not ( = ?auto_520095 ?auto_520098 ) ) ( not ( = ?auto_520095 ?auto_520099 ) ) ( not ( = ?auto_520095 ?auto_520100 ) ) ( not ( = ?auto_520095 ?auto_520101 ) ) ( not ( = ?auto_520095 ?auto_520102 ) ) ( not ( = ?auto_520095 ?auto_520103 ) ) ( not ( = ?auto_520095 ?auto_520104 ) ) ( not ( = ?auto_520095 ?auto_520105 ) ) ( not ( = ?auto_520095 ?auto_520106 ) ) ( not ( = ?auto_520096 ?auto_520097 ) ) ( not ( = ?auto_520096 ?auto_520098 ) ) ( not ( = ?auto_520096 ?auto_520099 ) ) ( not ( = ?auto_520096 ?auto_520100 ) ) ( not ( = ?auto_520096 ?auto_520101 ) ) ( not ( = ?auto_520096 ?auto_520102 ) ) ( not ( = ?auto_520096 ?auto_520103 ) ) ( not ( = ?auto_520096 ?auto_520104 ) ) ( not ( = ?auto_520096 ?auto_520105 ) ) ( not ( = ?auto_520096 ?auto_520106 ) ) ( not ( = ?auto_520097 ?auto_520098 ) ) ( not ( = ?auto_520097 ?auto_520099 ) ) ( not ( = ?auto_520097 ?auto_520100 ) ) ( not ( = ?auto_520097 ?auto_520101 ) ) ( not ( = ?auto_520097 ?auto_520102 ) ) ( not ( = ?auto_520097 ?auto_520103 ) ) ( not ( = ?auto_520097 ?auto_520104 ) ) ( not ( = ?auto_520097 ?auto_520105 ) ) ( not ( = ?auto_520097 ?auto_520106 ) ) ( not ( = ?auto_520098 ?auto_520099 ) ) ( not ( = ?auto_520098 ?auto_520100 ) ) ( not ( = ?auto_520098 ?auto_520101 ) ) ( not ( = ?auto_520098 ?auto_520102 ) ) ( not ( = ?auto_520098 ?auto_520103 ) ) ( not ( = ?auto_520098 ?auto_520104 ) ) ( not ( = ?auto_520098 ?auto_520105 ) ) ( not ( = ?auto_520098 ?auto_520106 ) ) ( not ( = ?auto_520099 ?auto_520100 ) ) ( not ( = ?auto_520099 ?auto_520101 ) ) ( not ( = ?auto_520099 ?auto_520102 ) ) ( not ( = ?auto_520099 ?auto_520103 ) ) ( not ( = ?auto_520099 ?auto_520104 ) ) ( not ( = ?auto_520099 ?auto_520105 ) ) ( not ( = ?auto_520099 ?auto_520106 ) ) ( not ( = ?auto_520100 ?auto_520101 ) ) ( not ( = ?auto_520100 ?auto_520102 ) ) ( not ( = ?auto_520100 ?auto_520103 ) ) ( not ( = ?auto_520100 ?auto_520104 ) ) ( not ( = ?auto_520100 ?auto_520105 ) ) ( not ( = ?auto_520100 ?auto_520106 ) ) ( not ( = ?auto_520101 ?auto_520102 ) ) ( not ( = ?auto_520101 ?auto_520103 ) ) ( not ( = ?auto_520101 ?auto_520104 ) ) ( not ( = ?auto_520101 ?auto_520105 ) ) ( not ( = ?auto_520101 ?auto_520106 ) ) ( not ( = ?auto_520102 ?auto_520103 ) ) ( not ( = ?auto_520102 ?auto_520104 ) ) ( not ( = ?auto_520102 ?auto_520105 ) ) ( not ( = ?auto_520102 ?auto_520106 ) ) ( not ( = ?auto_520103 ?auto_520104 ) ) ( not ( = ?auto_520103 ?auto_520105 ) ) ( not ( = ?auto_520103 ?auto_520106 ) ) ( not ( = ?auto_520104 ?auto_520105 ) ) ( not ( = ?auto_520104 ?auto_520106 ) ) ( not ( = ?auto_520105 ?auto_520106 ) ) ( ON ?auto_520104 ?auto_520105 ) ( ON ?auto_520103 ?auto_520104 ) ( ON ?auto_520102 ?auto_520103 ) ( ON ?auto_520101 ?auto_520102 ) ( ON ?auto_520100 ?auto_520101 ) ( ON ?auto_520099 ?auto_520100 ) ( ON ?auto_520098 ?auto_520099 ) ( ON ?auto_520097 ?auto_520098 ) ( ON ?auto_520096 ?auto_520097 ) ( ON ?auto_520095 ?auto_520096 ) ( CLEAR ?auto_520093 ) ( ON ?auto_520094 ?auto_520095 ) ( CLEAR ?auto_520094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_520091 ?auto_520092 ?auto_520093 ?auto_520094 )
      ( MAKE-15PILE ?auto_520091 ?auto_520092 ?auto_520093 ?auto_520094 ?auto_520095 ?auto_520096 ?auto_520097 ?auto_520098 ?auto_520099 ?auto_520100 ?auto_520101 ?auto_520102 ?auto_520103 ?auto_520104 ?auto_520105 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_520153 - BLOCK
      ?auto_520154 - BLOCK
      ?auto_520155 - BLOCK
      ?auto_520156 - BLOCK
      ?auto_520157 - BLOCK
      ?auto_520158 - BLOCK
      ?auto_520159 - BLOCK
      ?auto_520160 - BLOCK
      ?auto_520161 - BLOCK
      ?auto_520162 - BLOCK
      ?auto_520163 - BLOCK
      ?auto_520164 - BLOCK
      ?auto_520165 - BLOCK
      ?auto_520166 - BLOCK
      ?auto_520167 - BLOCK
    )
    :vars
    (
      ?auto_520168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520167 ?auto_520168 ) ( ON-TABLE ?auto_520153 ) ( ON ?auto_520154 ?auto_520153 ) ( not ( = ?auto_520153 ?auto_520154 ) ) ( not ( = ?auto_520153 ?auto_520155 ) ) ( not ( = ?auto_520153 ?auto_520156 ) ) ( not ( = ?auto_520153 ?auto_520157 ) ) ( not ( = ?auto_520153 ?auto_520158 ) ) ( not ( = ?auto_520153 ?auto_520159 ) ) ( not ( = ?auto_520153 ?auto_520160 ) ) ( not ( = ?auto_520153 ?auto_520161 ) ) ( not ( = ?auto_520153 ?auto_520162 ) ) ( not ( = ?auto_520153 ?auto_520163 ) ) ( not ( = ?auto_520153 ?auto_520164 ) ) ( not ( = ?auto_520153 ?auto_520165 ) ) ( not ( = ?auto_520153 ?auto_520166 ) ) ( not ( = ?auto_520153 ?auto_520167 ) ) ( not ( = ?auto_520153 ?auto_520168 ) ) ( not ( = ?auto_520154 ?auto_520155 ) ) ( not ( = ?auto_520154 ?auto_520156 ) ) ( not ( = ?auto_520154 ?auto_520157 ) ) ( not ( = ?auto_520154 ?auto_520158 ) ) ( not ( = ?auto_520154 ?auto_520159 ) ) ( not ( = ?auto_520154 ?auto_520160 ) ) ( not ( = ?auto_520154 ?auto_520161 ) ) ( not ( = ?auto_520154 ?auto_520162 ) ) ( not ( = ?auto_520154 ?auto_520163 ) ) ( not ( = ?auto_520154 ?auto_520164 ) ) ( not ( = ?auto_520154 ?auto_520165 ) ) ( not ( = ?auto_520154 ?auto_520166 ) ) ( not ( = ?auto_520154 ?auto_520167 ) ) ( not ( = ?auto_520154 ?auto_520168 ) ) ( not ( = ?auto_520155 ?auto_520156 ) ) ( not ( = ?auto_520155 ?auto_520157 ) ) ( not ( = ?auto_520155 ?auto_520158 ) ) ( not ( = ?auto_520155 ?auto_520159 ) ) ( not ( = ?auto_520155 ?auto_520160 ) ) ( not ( = ?auto_520155 ?auto_520161 ) ) ( not ( = ?auto_520155 ?auto_520162 ) ) ( not ( = ?auto_520155 ?auto_520163 ) ) ( not ( = ?auto_520155 ?auto_520164 ) ) ( not ( = ?auto_520155 ?auto_520165 ) ) ( not ( = ?auto_520155 ?auto_520166 ) ) ( not ( = ?auto_520155 ?auto_520167 ) ) ( not ( = ?auto_520155 ?auto_520168 ) ) ( not ( = ?auto_520156 ?auto_520157 ) ) ( not ( = ?auto_520156 ?auto_520158 ) ) ( not ( = ?auto_520156 ?auto_520159 ) ) ( not ( = ?auto_520156 ?auto_520160 ) ) ( not ( = ?auto_520156 ?auto_520161 ) ) ( not ( = ?auto_520156 ?auto_520162 ) ) ( not ( = ?auto_520156 ?auto_520163 ) ) ( not ( = ?auto_520156 ?auto_520164 ) ) ( not ( = ?auto_520156 ?auto_520165 ) ) ( not ( = ?auto_520156 ?auto_520166 ) ) ( not ( = ?auto_520156 ?auto_520167 ) ) ( not ( = ?auto_520156 ?auto_520168 ) ) ( not ( = ?auto_520157 ?auto_520158 ) ) ( not ( = ?auto_520157 ?auto_520159 ) ) ( not ( = ?auto_520157 ?auto_520160 ) ) ( not ( = ?auto_520157 ?auto_520161 ) ) ( not ( = ?auto_520157 ?auto_520162 ) ) ( not ( = ?auto_520157 ?auto_520163 ) ) ( not ( = ?auto_520157 ?auto_520164 ) ) ( not ( = ?auto_520157 ?auto_520165 ) ) ( not ( = ?auto_520157 ?auto_520166 ) ) ( not ( = ?auto_520157 ?auto_520167 ) ) ( not ( = ?auto_520157 ?auto_520168 ) ) ( not ( = ?auto_520158 ?auto_520159 ) ) ( not ( = ?auto_520158 ?auto_520160 ) ) ( not ( = ?auto_520158 ?auto_520161 ) ) ( not ( = ?auto_520158 ?auto_520162 ) ) ( not ( = ?auto_520158 ?auto_520163 ) ) ( not ( = ?auto_520158 ?auto_520164 ) ) ( not ( = ?auto_520158 ?auto_520165 ) ) ( not ( = ?auto_520158 ?auto_520166 ) ) ( not ( = ?auto_520158 ?auto_520167 ) ) ( not ( = ?auto_520158 ?auto_520168 ) ) ( not ( = ?auto_520159 ?auto_520160 ) ) ( not ( = ?auto_520159 ?auto_520161 ) ) ( not ( = ?auto_520159 ?auto_520162 ) ) ( not ( = ?auto_520159 ?auto_520163 ) ) ( not ( = ?auto_520159 ?auto_520164 ) ) ( not ( = ?auto_520159 ?auto_520165 ) ) ( not ( = ?auto_520159 ?auto_520166 ) ) ( not ( = ?auto_520159 ?auto_520167 ) ) ( not ( = ?auto_520159 ?auto_520168 ) ) ( not ( = ?auto_520160 ?auto_520161 ) ) ( not ( = ?auto_520160 ?auto_520162 ) ) ( not ( = ?auto_520160 ?auto_520163 ) ) ( not ( = ?auto_520160 ?auto_520164 ) ) ( not ( = ?auto_520160 ?auto_520165 ) ) ( not ( = ?auto_520160 ?auto_520166 ) ) ( not ( = ?auto_520160 ?auto_520167 ) ) ( not ( = ?auto_520160 ?auto_520168 ) ) ( not ( = ?auto_520161 ?auto_520162 ) ) ( not ( = ?auto_520161 ?auto_520163 ) ) ( not ( = ?auto_520161 ?auto_520164 ) ) ( not ( = ?auto_520161 ?auto_520165 ) ) ( not ( = ?auto_520161 ?auto_520166 ) ) ( not ( = ?auto_520161 ?auto_520167 ) ) ( not ( = ?auto_520161 ?auto_520168 ) ) ( not ( = ?auto_520162 ?auto_520163 ) ) ( not ( = ?auto_520162 ?auto_520164 ) ) ( not ( = ?auto_520162 ?auto_520165 ) ) ( not ( = ?auto_520162 ?auto_520166 ) ) ( not ( = ?auto_520162 ?auto_520167 ) ) ( not ( = ?auto_520162 ?auto_520168 ) ) ( not ( = ?auto_520163 ?auto_520164 ) ) ( not ( = ?auto_520163 ?auto_520165 ) ) ( not ( = ?auto_520163 ?auto_520166 ) ) ( not ( = ?auto_520163 ?auto_520167 ) ) ( not ( = ?auto_520163 ?auto_520168 ) ) ( not ( = ?auto_520164 ?auto_520165 ) ) ( not ( = ?auto_520164 ?auto_520166 ) ) ( not ( = ?auto_520164 ?auto_520167 ) ) ( not ( = ?auto_520164 ?auto_520168 ) ) ( not ( = ?auto_520165 ?auto_520166 ) ) ( not ( = ?auto_520165 ?auto_520167 ) ) ( not ( = ?auto_520165 ?auto_520168 ) ) ( not ( = ?auto_520166 ?auto_520167 ) ) ( not ( = ?auto_520166 ?auto_520168 ) ) ( not ( = ?auto_520167 ?auto_520168 ) ) ( ON ?auto_520166 ?auto_520167 ) ( ON ?auto_520165 ?auto_520166 ) ( ON ?auto_520164 ?auto_520165 ) ( ON ?auto_520163 ?auto_520164 ) ( ON ?auto_520162 ?auto_520163 ) ( ON ?auto_520161 ?auto_520162 ) ( ON ?auto_520160 ?auto_520161 ) ( ON ?auto_520159 ?auto_520160 ) ( ON ?auto_520158 ?auto_520159 ) ( ON ?auto_520157 ?auto_520158 ) ( ON ?auto_520156 ?auto_520157 ) ( CLEAR ?auto_520154 ) ( ON ?auto_520155 ?auto_520156 ) ( CLEAR ?auto_520155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_520153 ?auto_520154 ?auto_520155 )
      ( MAKE-15PILE ?auto_520153 ?auto_520154 ?auto_520155 ?auto_520156 ?auto_520157 ?auto_520158 ?auto_520159 ?auto_520160 ?auto_520161 ?auto_520162 ?auto_520163 ?auto_520164 ?auto_520165 ?auto_520166 ?auto_520167 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_520215 - BLOCK
      ?auto_520216 - BLOCK
      ?auto_520217 - BLOCK
      ?auto_520218 - BLOCK
      ?auto_520219 - BLOCK
      ?auto_520220 - BLOCK
      ?auto_520221 - BLOCK
      ?auto_520222 - BLOCK
      ?auto_520223 - BLOCK
      ?auto_520224 - BLOCK
      ?auto_520225 - BLOCK
      ?auto_520226 - BLOCK
      ?auto_520227 - BLOCK
      ?auto_520228 - BLOCK
      ?auto_520229 - BLOCK
    )
    :vars
    (
      ?auto_520230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520229 ?auto_520230 ) ( ON-TABLE ?auto_520215 ) ( not ( = ?auto_520215 ?auto_520216 ) ) ( not ( = ?auto_520215 ?auto_520217 ) ) ( not ( = ?auto_520215 ?auto_520218 ) ) ( not ( = ?auto_520215 ?auto_520219 ) ) ( not ( = ?auto_520215 ?auto_520220 ) ) ( not ( = ?auto_520215 ?auto_520221 ) ) ( not ( = ?auto_520215 ?auto_520222 ) ) ( not ( = ?auto_520215 ?auto_520223 ) ) ( not ( = ?auto_520215 ?auto_520224 ) ) ( not ( = ?auto_520215 ?auto_520225 ) ) ( not ( = ?auto_520215 ?auto_520226 ) ) ( not ( = ?auto_520215 ?auto_520227 ) ) ( not ( = ?auto_520215 ?auto_520228 ) ) ( not ( = ?auto_520215 ?auto_520229 ) ) ( not ( = ?auto_520215 ?auto_520230 ) ) ( not ( = ?auto_520216 ?auto_520217 ) ) ( not ( = ?auto_520216 ?auto_520218 ) ) ( not ( = ?auto_520216 ?auto_520219 ) ) ( not ( = ?auto_520216 ?auto_520220 ) ) ( not ( = ?auto_520216 ?auto_520221 ) ) ( not ( = ?auto_520216 ?auto_520222 ) ) ( not ( = ?auto_520216 ?auto_520223 ) ) ( not ( = ?auto_520216 ?auto_520224 ) ) ( not ( = ?auto_520216 ?auto_520225 ) ) ( not ( = ?auto_520216 ?auto_520226 ) ) ( not ( = ?auto_520216 ?auto_520227 ) ) ( not ( = ?auto_520216 ?auto_520228 ) ) ( not ( = ?auto_520216 ?auto_520229 ) ) ( not ( = ?auto_520216 ?auto_520230 ) ) ( not ( = ?auto_520217 ?auto_520218 ) ) ( not ( = ?auto_520217 ?auto_520219 ) ) ( not ( = ?auto_520217 ?auto_520220 ) ) ( not ( = ?auto_520217 ?auto_520221 ) ) ( not ( = ?auto_520217 ?auto_520222 ) ) ( not ( = ?auto_520217 ?auto_520223 ) ) ( not ( = ?auto_520217 ?auto_520224 ) ) ( not ( = ?auto_520217 ?auto_520225 ) ) ( not ( = ?auto_520217 ?auto_520226 ) ) ( not ( = ?auto_520217 ?auto_520227 ) ) ( not ( = ?auto_520217 ?auto_520228 ) ) ( not ( = ?auto_520217 ?auto_520229 ) ) ( not ( = ?auto_520217 ?auto_520230 ) ) ( not ( = ?auto_520218 ?auto_520219 ) ) ( not ( = ?auto_520218 ?auto_520220 ) ) ( not ( = ?auto_520218 ?auto_520221 ) ) ( not ( = ?auto_520218 ?auto_520222 ) ) ( not ( = ?auto_520218 ?auto_520223 ) ) ( not ( = ?auto_520218 ?auto_520224 ) ) ( not ( = ?auto_520218 ?auto_520225 ) ) ( not ( = ?auto_520218 ?auto_520226 ) ) ( not ( = ?auto_520218 ?auto_520227 ) ) ( not ( = ?auto_520218 ?auto_520228 ) ) ( not ( = ?auto_520218 ?auto_520229 ) ) ( not ( = ?auto_520218 ?auto_520230 ) ) ( not ( = ?auto_520219 ?auto_520220 ) ) ( not ( = ?auto_520219 ?auto_520221 ) ) ( not ( = ?auto_520219 ?auto_520222 ) ) ( not ( = ?auto_520219 ?auto_520223 ) ) ( not ( = ?auto_520219 ?auto_520224 ) ) ( not ( = ?auto_520219 ?auto_520225 ) ) ( not ( = ?auto_520219 ?auto_520226 ) ) ( not ( = ?auto_520219 ?auto_520227 ) ) ( not ( = ?auto_520219 ?auto_520228 ) ) ( not ( = ?auto_520219 ?auto_520229 ) ) ( not ( = ?auto_520219 ?auto_520230 ) ) ( not ( = ?auto_520220 ?auto_520221 ) ) ( not ( = ?auto_520220 ?auto_520222 ) ) ( not ( = ?auto_520220 ?auto_520223 ) ) ( not ( = ?auto_520220 ?auto_520224 ) ) ( not ( = ?auto_520220 ?auto_520225 ) ) ( not ( = ?auto_520220 ?auto_520226 ) ) ( not ( = ?auto_520220 ?auto_520227 ) ) ( not ( = ?auto_520220 ?auto_520228 ) ) ( not ( = ?auto_520220 ?auto_520229 ) ) ( not ( = ?auto_520220 ?auto_520230 ) ) ( not ( = ?auto_520221 ?auto_520222 ) ) ( not ( = ?auto_520221 ?auto_520223 ) ) ( not ( = ?auto_520221 ?auto_520224 ) ) ( not ( = ?auto_520221 ?auto_520225 ) ) ( not ( = ?auto_520221 ?auto_520226 ) ) ( not ( = ?auto_520221 ?auto_520227 ) ) ( not ( = ?auto_520221 ?auto_520228 ) ) ( not ( = ?auto_520221 ?auto_520229 ) ) ( not ( = ?auto_520221 ?auto_520230 ) ) ( not ( = ?auto_520222 ?auto_520223 ) ) ( not ( = ?auto_520222 ?auto_520224 ) ) ( not ( = ?auto_520222 ?auto_520225 ) ) ( not ( = ?auto_520222 ?auto_520226 ) ) ( not ( = ?auto_520222 ?auto_520227 ) ) ( not ( = ?auto_520222 ?auto_520228 ) ) ( not ( = ?auto_520222 ?auto_520229 ) ) ( not ( = ?auto_520222 ?auto_520230 ) ) ( not ( = ?auto_520223 ?auto_520224 ) ) ( not ( = ?auto_520223 ?auto_520225 ) ) ( not ( = ?auto_520223 ?auto_520226 ) ) ( not ( = ?auto_520223 ?auto_520227 ) ) ( not ( = ?auto_520223 ?auto_520228 ) ) ( not ( = ?auto_520223 ?auto_520229 ) ) ( not ( = ?auto_520223 ?auto_520230 ) ) ( not ( = ?auto_520224 ?auto_520225 ) ) ( not ( = ?auto_520224 ?auto_520226 ) ) ( not ( = ?auto_520224 ?auto_520227 ) ) ( not ( = ?auto_520224 ?auto_520228 ) ) ( not ( = ?auto_520224 ?auto_520229 ) ) ( not ( = ?auto_520224 ?auto_520230 ) ) ( not ( = ?auto_520225 ?auto_520226 ) ) ( not ( = ?auto_520225 ?auto_520227 ) ) ( not ( = ?auto_520225 ?auto_520228 ) ) ( not ( = ?auto_520225 ?auto_520229 ) ) ( not ( = ?auto_520225 ?auto_520230 ) ) ( not ( = ?auto_520226 ?auto_520227 ) ) ( not ( = ?auto_520226 ?auto_520228 ) ) ( not ( = ?auto_520226 ?auto_520229 ) ) ( not ( = ?auto_520226 ?auto_520230 ) ) ( not ( = ?auto_520227 ?auto_520228 ) ) ( not ( = ?auto_520227 ?auto_520229 ) ) ( not ( = ?auto_520227 ?auto_520230 ) ) ( not ( = ?auto_520228 ?auto_520229 ) ) ( not ( = ?auto_520228 ?auto_520230 ) ) ( not ( = ?auto_520229 ?auto_520230 ) ) ( ON ?auto_520228 ?auto_520229 ) ( ON ?auto_520227 ?auto_520228 ) ( ON ?auto_520226 ?auto_520227 ) ( ON ?auto_520225 ?auto_520226 ) ( ON ?auto_520224 ?auto_520225 ) ( ON ?auto_520223 ?auto_520224 ) ( ON ?auto_520222 ?auto_520223 ) ( ON ?auto_520221 ?auto_520222 ) ( ON ?auto_520220 ?auto_520221 ) ( ON ?auto_520219 ?auto_520220 ) ( ON ?auto_520218 ?auto_520219 ) ( ON ?auto_520217 ?auto_520218 ) ( CLEAR ?auto_520215 ) ( ON ?auto_520216 ?auto_520217 ) ( CLEAR ?auto_520216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_520215 ?auto_520216 )
      ( MAKE-15PILE ?auto_520215 ?auto_520216 ?auto_520217 ?auto_520218 ?auto_520219 ?auto_520220 ?auto_520221 ?auto_520222 ?auto_520223 ?auto_520224 ?auto_520225 ?auto_520226 ?auto_520227 ?auto_520228 ?auto_520229 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_520277 - BLOCK
      ?auto_520278 - BLOCK
      ?auto_520279 - BLOCK
      ?auto_520280 - BLOCK
      ?auto_520281 - BLOCK
      ?auto_520282 - BLOCK
      ?auto_520283 - BLOCK
      ?auto_520284 - BLOCK
      ?auto_520285 - BLOCK
      ?auto_520286 - BLOCK
      ?auto_520287 - BLOCK
      ?auto_520288 - BLOCK
      ?auto_520289 - BLOCK
      ?auto_520290 - BLOCK
      ?auto_520291 - BLOCK
    )
    :vars
    (
      ?auto_520292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520291 ?auto_520292 ) ( not ( = ?auto_520277 ?auto_520278 ) ) ( not ( = ?auto_520277 ?auto_520279 ) ) ( not ( = ?auto_520277 ?auto_520280 ) ) ( not ( = ?auto_520277 ?auto_520281 ) ) ( not ( = ?auto_520277 ?auto_520282 ) ) ( not ( = ?auto_520277 ?auto_520283 ) ) ( not ( = ?auto_520277 ?auto_520284 ) ) ( not ( = ?auto_520277 ?auto_520285 ) ) ( not ( = ?auto_520277 ?auto_520286 ) ) ( not ( = ?auto_520277 ?auto_520287 ) ) ( not ( = ?auto_520277 ?auto_520288 ) ) ( not ( = ?auto_520277 ?auto_520289 ) ) ( not ( = ?auto_520277 ?auto_520290 ) ) ( not ( = ?auto_520277 ?auto_520291 ) ) ( not ( = ?auto_520277 ?auto_520292 ) ) ( not ( = ?auto_520278 ?auto_520279 ) ) ( not ( = ?auto_520278 ?auto_520280 ) ) ( not ( = ?auto_520278 ?auto_520281 ) ) ( not ( = ?auto_520278 ?auto_520282 ) ) ( not ( = ?auto_520278 ?auto_520283 ) ) ( not ( = ?auto_520278 ?auto_520284 ) ) ( not ( = ?auto_520278 ?auto_520285 ) ) ( not ( = ?auto_520278 ?auto_520286 ) ) ( not ( = ?auto_520278 ?auto_520287 ) ) ( not ( = ?auto_520278 ?auto_520288 ) ) ( not ( = ?auto_520278 ?auto_520289 ) ) ( not ( = ?auto_520278 ?auto_520290 ) ) ( not ( = ?auto_520278 ?auto_520291 ) ) ( not ( = ?auto_520278 ?auto_520292 ) ) ( not ( = ?auto_520279 ?auto_520280 ) ) ( not ( = ?auto_520279 ?auto_520281 ) ) ( not ( = ?auto_520279 ?auto_520282 ) ) ( not ( = ?auto_520279 ?auto_520283 ) ) ( not ( = ?auto_520279 ?auto_520284 ) ) ( not ( = ?auto_520279 ?auto_520285 ) ) ( not ( = ?auto_520279 ?auto_520286 ) ) ( not ( = ?auto_520279 ?auto_520287 ) ) ( not ( = ?auto_520279 ?auto_520288 ) ) ( not ( = ?auto_520279 ?auto_520289 ) ) ( not ( = ?auto_520279 ?auto_520290 ) ) ( not ( = ?auto_520279 ?auto_520291 ) ) ( not ( = ?auto_520279 ?auto_520292 ) ) ( not ( = ?auto_520280 ?auto_520281 ) ) ( not ( = ?auto_520280 ?auto_520282 ) ) ( not ( = ?auto_520280 ?auto_520283 ) ) ( not ( = ?auto_520280 ?auto_520284 ) ) ( not ( = ?auto_520280 ?auto_520285 ) ) ( not ( = ?auto_520280 ?auto_520286 ) ) ( not ( = ?auto_520280 ?auto_520287 ) ) ( not ( = ?auto_520280 ?auto_520288 ) ) ( not ( = ?auto_520280 ?auto_520289 ) ) ( not ( = ?auto_520280 ?auto_520290 ) ) ( not ( = ?auto_520280 ?auto_520291 ) ) ( not ( = ?auto_520280 ?auto_520292 ) ) ( not ( = ?auto_520281 ?auto_520282 ) ) ( not ( = ?auto_520281 ?auto_520283 ) ) ( not ( = ?auto_520281 ?auto_520284 ) ) ( not ( = ?auto_520281 ?auto_520285 ) ) ( not ( = ?auto_520281 ?auto_520286 ) ) ( not ( = ?auto_520281 ?auto_520287 ) ) ( not ( = ?auto_520281 ?auto_520288 ) ) ( not ( = ?auto_520281 ?auto_520289 ) ) ( not ( = ?auto_520281 ?auto_520290 ) ) ( not ( = ?auto_520281 ?auto_520291 ) ) ( not ( = ?auto_520281 ?auto_520292 ) ) ( not ( = ?auto_520282 ?auto_520283 ) ) ( not ( = ?auto_520282 ?auto_520284 ) ) ( not ( = ?auto_520282 ?auto_520285 ) ) ( not ( = ?auto_520282 ?auto_520286 ) ) ( not ( = ?auto_520282 ?auto_520287 ) ) ( not ( = ?auto_520282 ?auto_520288 ) ) ( not ( = ?auto_520282 ?auto_520289 ) ) ( not ( = ?auto_520282 ?auto_520290 ) ) ( not ( = ?auto_520282 ?auto_520291 ) ) ( not ( = ?auto_520282 ?auto_520292 ) ) ( not ( = ?auto_520283 ?auto_520284 ) ) ( not ( = ?auto_520283 ?auto_520285 ) ) ( not ( = ?auto_520283 ?auto_520286 ) ) ( not ( = ?auto_520283 ?auto_520287 ) ) ( not ( = ?auto_520283 ?auto_520288 ) ) ( not ( = ?auto_520283 ?auto_520289 ) ) ( not ( = ?auto_520283 ?auto_520290 ) ) ( not ( = ?auto_520283 ?auto_520291 ) ) ( not ( = ?auto_520283 ?auto_520292 ) ) ( not ( = ?auto_520284 ?auto_520285 ) ) ( not ( = ?auto_520284 ?auto_520286 ) ) ( not ( = ?auto_520284 ?auto_520287 ) ) ( not ( = ?auto_520284 ?auto_520288 ) ) ( not ( = ?auto_520284 ?auto_520289 ) ) ( not ( = ?auto_520284 ?auto_520290 ) ) ( not ( = ?auto_520284 ?auto_520291 ) ) ( not ( = ?auto_520284 ?auto_520292 ) ) ( not ( = ?auto_520285 ?auto_520286 ) ) ( not ( = ?auto_520285 ?auto_520287 ) ) ( not ( = ?auto_520285 ?auto_520288 ) ) ( not ( = ?auto_520285 ?auto_520289 ) ) ( not ( = ?auto_520285 ?auto_520290 ) ) ( not ( = ?auto_520285 ?auto_520291 ) ) ( not ( = ?auto_520285 ?auto_520292 ) ) ( not ( = ?auto_520286 ?auto_520287 ) ) ( not ( = ?auto_520286 ?auto_520288 ) ) ( not ( = ?auto_520286 ?auto_520289 ) ) ( not ( = ?auto_520286 ?auto_520290 ) ) ( not ( = ?auto_520286 ?auto_520291 ) ) ( not ( = ?auto_520286 ?auto_520292 ) ) ( not ( = ?auto_520287 ?auto_520288 ) ) ( not ( = ?auto_520287 ?auto_520289 ) ) ( not ( = ?auto_520287 ?auto_520290 ) ) ( not ( = ?auto_520287 ?auto_520291 ) ) ( not ( = ?auto_520287 ?auto_520292 ) ) ( not ( = ?auto_520288 ?auto_520289 ) ) ( not ( = ?auto_520288 ?auto_520290 ) ) ( not ( = ?auto_520288 ?auto_520291 ) ) ( not ( = ?auto_520288 ?auto_520292 ) ) ( not ( = ?auto_520289 ?auto_520290 ) ) ( not ( = ?auto_520289 ?auto_520291 ) ) ( not ( = ?auto_520289 ?auto_520292 ) ) ( not ( = ?auto_520290 ?auto_520291 ) ) ( not ( = ?auto_520290 ?auto_520292 ) ) ( not ( = ?auto_520291 ?auto_520292 ) ) ( ON ?auto_520290 ?auto_520291 ) ( ON ?auto_520289 ?auto_520290 ) ( ON ?auto_520288 ?auto_520289 ) ( ON ?auto_520287 ?auto_520288 ) ( ON ?auto_520286 ?auto_520287 ) ( ON ?auto_520285 ?auto_520286 ) ( ON ?auto_520284 ?auto_520285 ) ( ON ?auto_520283 ?auto_520284 ) ( ON ?auto_520282 ?auto_520283 ) ( ON ?auto_520281 ?auto_520282 ) ( ON ?auto_520280 ?auto_520281 ) ( ON ?auto_520279 ?auto_520280 ) ( ON ?auto_520278 ?auto_520279 ) ( ON ?auto_520277 ?auto_520278 ) ( CLEAR ?auto_520277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_520277 )
      ( MAKE-15PILE ?auto_520277 ?auto_520278 ?auto_520279 ?auto_520280 ?auto_520281 ?auto_520282 ?auto_520283 ?auto_520284 ?auto_520285 ?auto_520286 ?auto_520287 ?auto_520288 ?auto_520289 ?auto_520290 ?auto_520291 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520340 - BLOCK
      ?auto_520341 - BLOCK
      ?auto_520342 - BLOCK
      ?auto_520343 - BLOCK
      ?auto_520344 - BLOCK
      ?auto_520345 - BLOCK
      ?auto_520346 - BLOCK
      ?auto_520347 - BLOCK
      ?auto_520348 - BLOCK
      ?auto_520349 - BLOCK
      ?auto_520350 - BLOCK
      ?auto_520351 - BLOCK
      ?auto_520352 - BLOCK
      ?auto_520353 - BLOCK
      ?auto_520354 - BLOCK
      ?auto_520355 - BLOCK
    )
    :vars
    (
      ?auto_520356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_520354 ) ( ON ?auto_520355 ?auto_520356 ) ( CLEAR ?auto_520355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_520340 ) ( ON ?auto_520341 ?auto_520340 ) ( ON ?auto_520342 ?auto_520341 ) ( ON ?auto_520343 ?auto_520342 ) ( ON ?auto_520344 ?auto_520343 ) ( ON ?auto_520345 ?auto_520344 ) ( ON ?auto_520346 ?auto_520345 ) ( ON ?auto_520347 ?auto_520346 ) ( ON ?auto_520348 ?auto_520347 ) ( ON ?auto_520349 ?auto_520348 ) ( ON ?auto_520350 ?auto_520349 ) ( ON ?auto_520351 ?auto_520350 ) ( ON ?auto_520352 ?auto_520351 ) ( ON ?auto_520353 ?auto_520352 ) ( ON ?auto_520354 ?auto_520353 ) ( not ( = ?auto_520340 ?auto_520341 ) ) ( not ( = ?auto_520340 ?auto_520342 ) ) ( not ( = ?auto_520340 ?auto_520343 ) ) ( not ( = ?auto_520340 ?auto_520344 ) ) ( not ( = ?auto_520340 ?auto_520345 ) ) ( not ( = ?auto_520340 ?auto_520346 ) ) ( not ( = ?auto_520340 ?auto_520347 ) ) ( not ( = ?auto_520340 ?auto_520348 ) ) ( not ( = ?auto_520340 ?auto_520349 ) ) ( not ( = ?auto_520340 ?auto_520350 ) ) ( not ( = ?auto_520340 ?auto_520351 ) ) ( not ( = ?auto_520340 ?auto_520352 ) ) ( not ( = ?auto_520340 ?auto_520353 ) ) ( not ( = ?auto_520340 ?auto_520354 ) ) ( not ( = ?auto_520340 ?auto_520355 ) ) ( not ( = ?auto_520340 ?auto_520356 ) ) ( not ( = ?auto_520341 ?auto_520342 ) ) ( not ( = ?auto_520341 ?auto_520343 ) ) ( not ( = ?auto_520341 ?auto_520344 ) ) ( not ( = ?auto_520341 ?auto_520345 ) ) ( not ( = ?auto_520341 ?auto_520346 ) ) ( not ( = ?auto_520341 ?auto_520347 ) ) ( not ( = ?auto_520341 ?auto_520348 ) ) ( not ( = ?auto_520341 ?auto_520349 ) ) ( not ( = ?auto_520341 ?auto_520350 ) ) ( not ( = ?auto_520341 ?auto_520351 ) ) ( not ( = ?auto_520341 ?auto_520352 ) ) ( not ( = ?auto_520341 ?auto_520353 ) ) ( not ( = ?auto_520341 ?auto_520354 ) ) ( not ( = ?auto_520341 ?auto_520355 ) ) ( not ( = ?auto_520341 ?auto_520356 ) ) ( not ( = ?auto_520342 ?auto_520343 ) ) ( not ( = ?auto_520342 ?auto_520344 ) ) ( not ( = ?auto_520342 ?auto_520345 ) ) ( not ( = ?auto_520342 ?auto_520346 ) ) ( not ( = ?auto_520342 ?auto_520347 ) ) ( not ( = ?auto_520342 ?auto_520348 ) ) ( not ( = ?auto_520342 ?auto_520349 ) ) ( not ( = ?auto_520342 ?auto_520350 ) ) ( not ( = ?auto_520342 ?auto_520351 ) ) ( not ( = ?auto_520342 ?auto_520352 ) ) ( not ( = ?auto_520342 ?auto_520353 ) ) ( not ( = ?auto_520342 ?auto_520354 ) ) ( not ( = ?auto_520342 ?auto_520355 ) ) ( not ( = ?auto_520342 ?auto_520356 ) ) ( not ( = ?auto_520343 ?auto_520344 ) ) ( not ( = ?auto_520343 ?auto_520345 ) ) ( not ( = ?auto_520343 ?auto_520346 ) ) ( not ( = ?auto_520343 ?auto_520347 ) ) ( not ( = ?auto_520343 ?auto_520348 ) ) ( not ( = ?auto_520343 ?auto_520349 ) ) ( not ( = ?auto_520343 ?auto_520350 ) ) ( not ( = ?auto_520343 ?auto_520351 ) ) ( not ( = ?auto_520343 ?auto_520352 ) ) ( not ( = ?auto_520343 ?auto_520353 ) ) ( not ( = ?auto_520343 ?auto_520354 ) ) ( not ( = ?auto_520343 ?auto_520355 ) ) ( not ( = ?auto_520343 ?auto_520356 ) ) ( not ( = ?auto_520344 ?auto_520345 ) ) ( not ( = ?auto_520344 ?auto_520346 ) ) ( not ( = ?auto_520344 ?auto_520347 ) ) ( not ( = ?auto_520344 ?auto_520348 ) ) ( not ( = ?auto_520344 ?auto_520349 ) ) ( not ( = ?auto_520344 ?auto_520350 ) ) ( not ( = ?auto_520344 ?auto_520351 ) ) ( not ( = ?auto_520344 ?auto_520352 ) ) ( not ( = ?auto_520344 ?auto_520353 ) ) ( not ( = ?auto_520344 ?auto_520354 ) ) ( not ( = ?auto_520344 ?auto_520355 ) ) ( not ( = ?auto_520344 ?auto_520356 ) ) ( not ( = ?auto_520345 ?auto_520346 ) ) ( not ( = ?auto_520345 ?auto_520347 ) ) ( not ( = ?auto_520345 ?auto_520348 ) ) ( not ( = ?auto_520345 ?auto_520349 ) ) ( not ( = ?auto_520345 ?auto_520350 ) ) ( not ( = ?auto_520345 ?auto_520351 ) ) ( not ( = ?auto_520345 ?auto_520352 ) ) ( not ( = ?auto_520345 ?auto_520353 ) ) ( not ( = ?auto_520345 ?auto_520354 ) ) ( not ( = ?auto_520345 ?auto_520355 ) ) ( not ( = ?auto_520345 ?auto_520356 ) ) ( not ( = ?auto_520346 ?auto_520347 ) ) ( not ( = ?auto_520346 ?auto_520348 ) ) ( not ( = ?auto_520346 ?auto_520349 ) ) ( not ( = ?auto_520346 ?auto_520350 ) ) ( not ( = ?auto_520346 ?auto_520351 ) ) ( not ( = ?auto_520346 ?auto_520352 ) ) ( not ( = ?auto_520346 ?auto_520353 ) ) ( not ( = ?auto_520346 ?auto_520354 ) ) ( not ( = ?auto_520346 ?auto_520355 ) ) ( not ( = ?auto_520346 ?auto_520356 ) ) ( not ( = ?auto_520347 ?auto_520348 ) ) ( not ( = ?auto_520347 ?auto_520349 ) ) ( not ( = ?auto_520347 ?auto_520350 ) ) ( not ( = ?auto_520347 ?auto_520351 ) ) ( not ( = ?auto_520347 ?auto_520352 ) ) ( not ( = ?auto_520347 ?auto_520353 ) ) ( not ( = ?auto_520347 ?auto_520354 ) ) ( not ( = ?auto_520347 ?auto_520355 ) ) ( not ( = ?auto_520347 ?auto_520356 ) ) ( not ( = ?auto_520348 ?auto_520349 ) ) ( not ( = ?auto_520348 ?auto_520350 ) ) ( not ( = ?auto_520348 ?auto_520351 ) ) ( not ( = ?auto_520348 ?auto_520352 ) ) ( not ( = ?auto_520348 ?auto_520353 ) ) ( not ( = ?auto_520348 ?auto_520354 ) ) ( not ( = ?auto_520348 ?auto_520355 ) ) ( not ( = ?auto_520348 ?auto_520356 ) ) ( not ( = ?auto_520349 ?auto_520350 ) ) ( not ( = ?auto_520349 ?auto_520351 ) ) ( not ( = ?auto_520349 ?auto_520352 ) ) ( not ( = ?auto_520349 ?auto_520353 ) ) ( not ( = ?auto_520349 ?auto_520354 ) ) ( not ( = ?auto_520349 ?auto_520355 ) ) ( not ( = ?auto_520349 ?auto_520356 ) ) ( not ( = ?auto_520350 ?auto_520351 ) ) ( not ( = ?auto_520350 ?auto_520352 ) ) ( not ( = ?auto_520350 ?auto_520353 ) ) ( not ( = ?auto_520350 ?auto_520354 ) ) ( not ( = ?auto_520350 ?auto_520355 ) ) ( not ( = ?auto_520350 ?auto_520356 ) ) ( not ( = ?auto_520351 ?auto_520352 ) ) ( not ( = ?auto_520351 ?auto_520353 ) ) ( not ( = ?auto_520351 ?auto_520354 ) ) ( not ( = ?auto_520351 ?auto_520355 ) ) ( not ( = ?auto_520351 ?auto_520356 ) ) ( not ( = ?auto_520352 ?auto_520353 ) ) ( not ( = ?auto_520352 ?auto_520354 ) ) ( not ( = ?auto_520352 ?auto_520355 ) ) ( not ( = ?auto_520352 ?auto_520356 ) ) ( not ( = ?auto_520353 ?auto_520354 ) ) ( not ( = ?auto_520353 ?auto_520355 ) ) ( not ( = ?auto_520353 ?auto_520356 ) ) ( not ( = ?auto_520354 ?auto_520355 ) ) ( not ( = ?auto_520354 ?auto_520356 ) ) ( not ( = ?auto_520355 ?auto_520356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_520355 ?auto_520356 )
      ( !STACK ?auto_520355 ?auto_520354 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520373 - BLOCK
      ?auto_520374 - BLOCK
      ?auto_520375 - BLOCK
      ?auto_520376 - BLOCK
      ?auto_520377 - BLOCK
      ?auto_520378 - BLOCK
      ?auto_520379 - BLOCK
      ?auto_520380 - BLOCK
      ?auto_520381 - BLOCK
      ?auto_520382 - BLOCK
      ?auto_520383 - BLOCK
      ?auto_520384 - BLOCK
      ?auto_520385 - BLOCK
      ?auto_520386 - BLOCK
      ?auto_520387 - BLOCK
      ?auto_520388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_520387 ) ( ON-TABLE ?auto_520388 ) ( CLEAR ?auto_520388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_520373 ) ( ON ?auto_520374 ?auto_520373 ) ( ON ?auto_520375 ?auto_520374 ) ( ON ?auto_520376 ?auto_520375 ) ( ON ?auto_520377 ?auto_520376 ) ( ON ?auto_520378 ?auto_520377 ) ( ON ?auto_520379 ?auto_520378 ) ( ON ?auto_520380 ?auto_520379 ) ( ON ?auto_520381 ?auto_520380 ) ( ON ?auto_520382 ?auto_520381 ) ( ON ?auto_520383 ?auto_520382 ) ( ON ?auto_520384 ?auto_520383 ) ( ON ?auto_520385 ?auto_520384 ) ( ON ?auto_520386 ?auto_520385 ) ( ON ?auto_520387 ?auto_520386 ) ( not ( = ?auto_520373 ?auto_520374 ) ) ( not ( = ?auto_520373 ?auto_520375 ) ) ( not ( = ?auto_520373 ?auto_520376 ) ) ( not ( = ?auto_520373 ?auto_520377 ) ) ( not ( = ?auto_520373 ?auto_520378 ) ) ( not ( = ?auto_520373 ?auto_520379 ) ) ( not ( = ?auto_520373 ?auto_520380 ) ) ( not ( = ?auto_520373 ?auto_520381 ) ) ( not ( = ?auto_520373 ?auto_520382 ) ) ( not ( = ?auto_520373 ?auto_520383 ) ) ( not ( = ?auto_520373 ?auto_520384 ) ) ( not ( = ?auto_520373 ?auto_520385 ) ) ( not ( = ?auto_520373 ?auto_520386 ) ) ( not ( = ?auto_520373 ?auto_520387 ) ) ( not ( = ?auto_520373 ?auto_520388 ) ) ( not ( = ?auto_520374 ?auto_520375 ) ) ( not ( = ?auto_520374 ?auto_520376 ) ) ( not ( = ?auto_520374 ?auto_520377 ) ) ( not ( = ?auto_520374 ?auto_520378 ) ) ( not ( = ?auto_520374 ?auto_520379 ) ) ( not ( = ?auto_520374 ?auto_520380 ) ) ( not ( = ?auto_520374 ?auto_520381 ) ) ( not ( = ?auto_520374 ?auto_520382 ) ) ( not ( = ?auto_520374 ?auto_520383 ) ) ( not ( = ?auto_520374 ?auto_520384 ) ) ( not ( = ?auto_520374 ?auto_520385 ) ) ( not ( = ?auto_520374 ?auto_520386 ) ) ( not ( = ?auto_520374 ?auto_520387 ) ) ( not ( = ?auto_520374 ?auto_520388 ) ) ( not ( = ?auto_520375 ?auto_520376 ) ) ( not ( = ?auto_520375 ?auto_520377 ) ) ( not ( = ?auto_520375 ?auto_520378 ) ) ( not ( = ?auto_520375 ?auto_520379 ) ) ( not ( = ?auto_520375 ?auto_520380 ) ) ( not ( = ?auto_520375 ?auto_520381 ) ) ( not ( = ?auto_520375 ?auto_520382 ) ) ( not ( = ?auto_520375 ?auto_520383 ) ) ( not ( = ?auto_520375 ?auto_520384 ) ) ( not ( = ?auto_520375 ?auto_520385 ) ) ( not ( = ?auto_520375 ?auto_520386 ) ) ( not ( = ?auto_520375 ?auto_520387 ) ) ( not ( = ?auto_520375 ?auto_520388 ) ) ( not ( = ?auto_520376 ?auto_520377 ) ) ( not ( = ?auto_520376 ?auto_520378 ) ) ( not ( = ?auto_520376 ?auto_520379 ) ) ( not ( = ?auto_520376 ?auto_520380 ) ) ( not ( = ?auto_520376 ?auto_520381 ) ) ( not ( = ?auto_520376 ?auto_520382 ) ) ( not ( = ?auto_520376 ?auto_520383 ) ) ( not ( = ?auto_520376 ?auto_520384 ) ) ( not ( = ?auto_520376 ?auto_520385 ) ) ( not ( = ?auto_520376 ?auto_520386 ) ) ( not ( = ?auto_520376 ?auto_520387 ) ) ( not ( = ?auto_520376 ?auto_520388 ) ) ( not ( = ?auto_520377 ?auto_520378 ) ) ( not ( = ?auto_520377 ?auto_520379 ) ) ( not ( = ?auto_520377 ?auto_520380 ) ) ( not ( = ?auto_520377 ?auto_520381 ) ) ( not ( = ?auto_520377 ?auto_520382 ) ) ( not ( = ?auto_520377 ?auto_520383 ) ) ( not ( = ?auto_520377 ?auto_520384 ) ) ( not ( = ?auto_520377 ?auto_520385 ) ) ( not ( = ?auto_520377 ?auto_520386 ) ) ( not ( = ?auto_520377 ?auto_520387 ) ) ( not ( = ?auto_520377 ?auto_520388 ) ) ( not ( = ?auto_520378 ?auto_520379 ) ) ( not ( = ?auto_520378 ?auto_520380 ) ) ( not ( = ?auto_520378 ?auto_520381 ) ) ( not ( = ?auto_520378 ?auto_520382 ) ) ( not ( = ?auto_520378 ?auto_520383 ) ) ( not ( = ?auto_520378 ?auto_520384 ) ) ( not ( = ?auto_520378 ?auto_520385 ) ) ( not ( = ?auto_520378 ?auto_520386 ) ) ( not ( = ?auto_520378 ?auto_520387 ) ) ( not ( = ?auto_520378 ?auto_520388 ) ) ( not ( = ?auto_520379 ?auto_520380 ) ) ( not ( = ?auto_520379 ?auto_520381 ) ) ( not ( = ?auto_520379 ?auto_520382 ) ) ( not ( = ?auto_520379 ?auto_520383 ) ) ( not ( = ?auto_520379 ?auto_520384 ) ) ( not ( = ?auto_520379 ?auto_520385 ) ) ( not ( = ?auto_520379 ?auto_520386 ) ) ( not ( = ?auto_520379 ?auto_520387 ) ) ( not ( = ?auto_520379 ?auto_520388 ) ) ( not ( = ?auto_520380 ?auto_520381 ) ) ( not ( = ?auto_520380 ?auto_520382 ) ) ( not ( = ?auto_520380 ?auto_520383 ) ) ( not ( = ?auto_520380 ?auto_520384 ) ) ( not ( = ?auto_520380 ?auto_520385 ) ) ( not ( = ?auto_520380 ?auto_520386 ) ) ( not ( = ?auto_520380 ?auto_520387 ) ) ( not ( = ?auto_520380 ?auto_520388 ) ) ( not ( = ?auto_520381 ?auto_520382 ) ) ( not ( = ?auto_520381 ?auto_520383 ) ) ( not ( = ?auto_520381 ?auto_520384 ) ) ( not ( = ?auto_520381 ?auto_520385 ) ) ( not ( = ?auto_520381 ?auto_520386 ) ) ( not ( = ?auto_520381 ?auto_520387 ) ) ( not ( = ?auto_520381 ?auto_520388 ) ) ( not ( = ?auto_520382 ?auto_520383 ) ) ( not ( = ?auto_520382 ?auto_520384 ) ) ( not ( = ?auto_520382 ?auto_520385 ) ) ( not ( = ?auto_520382 ?auto_520386 ) ) ( not ( = ?auto_520382 ?auto_520387 ) ) ( not ( = ?auto_520382 ?auto_520388 ) ) ( not ( = ?auto_520383 ?auto_520384 ) ) ( not ( = ?auto_520383 ?auto_520385 ) ) ( not ( = ?auto_520383 ?auto_520386 ) ) ( not ( = ?auto_520383 ?auto_520387 ) ) ( not ( = ?auto_520383 ?auto_520388 ) ) ( not ( = ?auto_520384 ?auto_520385 ) ) ( not ( = ?auto_520384 ?auto_520386 ) ) ( not ( = ?auto_520384 ?auto_520387 ) ) ( not ( = ?auto_520384 ?auto_520388 ) ) ( not ( = ?auto_520385 ?auto_520386 ) ) ( not ( = ?auto_520385 ?auto_520387 ) ) ( not ( = ?auto_520385 ?auto_520388 ) ) ( not ( = ?auto_520386 ?auto_520387 ) ) ( not ( = ?auto_520386 ?auto_520388 ) ) ( not ( = ?auto_520387 ?auto_520388 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_520388 )
      ( !STACK ?auto_520388 ?auto_520387 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520405 - BLOCK
      ?auto_520406 - BLOCK
      ?auto_520407 - BLOCK
      ?auto_520408 - BLOCK
      ?auto_520409 - BLOCK
      ?auto_520410 - BLOCK
      ?auto_520411 - BLOCK
      ?auto_520412 - BLOCK
      ?auto_520413 - BLOCK
      ?auto_520414 - BLOCK
      ?auto_520415 - BLOCK
      ?auto_520416 - BLOCK
      ?auto_520417 - BLOCK
      ?auto_520418 - BLOCK
      ?auto_520419 - BLOCK
      ?auto_520420 - BLOCK
    )
    :vars
    (
      ?auto_520421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520420 ?auto_520421 ) ( ON-TABLE ?auto_520405 ) ( ON ?auto_520406 ?auto_520405 ) ( ON ?auto_520407 ?auto_520406 ) ( ON ?auto_520408 ?auto_520407 ) ( ON ?auto_520409 ?auto_520408 ) ( ON ?auto_520410 ?auto_520409 ) ( ON ?auto_520411 ?auto_520410 ) ( ON ?auto_520412 ?auto_520411 ) ( ON ?auto_520413 ?auto_520412 ) ( ON ?auto_520414 ?auto_520413 ) ( ON ?auto_520415 ?auto_520414 ) ( ON ?auto_520416 ?auto_520415 ) ( ON ?auto_520417 ?auto_520416 ) ( ON ?auto_520418 ?auto_520417 ) ( not ( = ?auto_520405 ?auto_520406 ) ) ( not ( = ?auto_520405 ?auto_520407 ) ) ( not ( = ?auto_520405 ?auto_520408 ) ) ( not ( = ?auto_520405 ?auto_520409 ) ) ( not ( = ?auto_520405 ?auto_520410 ) ) ( not ( = ?auto_520405 ?auto_520411 ) ) ( not ( = ?auto_520405 ?auto_520412 ) ) ( not ( = ?auto_520405 ?auto_520413 ) ) ( not ( = ?auto_520405 ?auto_520414 ) ) ( not ( = ?auto_520405 ?auto_520415 ) ) ( not ( = ?auto_520405 ?auto_520416 ) ) ( not ( = ?auto_520405 ?auto_520417 ) ) ( not ( = ?auto_520405 ?auto_520418 ) ) ( not ( = ?auto_520405 ?auto_520419 ) ) ( not ( = ?auto_520405 ?auto_520420 ) ) ( not ( = ?auto_520405 ?auto_520421 ) ) ( not ( = ?auto_520406 ?auto_520407 ) ) ( not ( = ?auto_520406 ?auto_520408 ) ) ( not ( = ?auto_520406 ?auto_520409 ) ) ( not ( = ?auto_520406 ?auto_520410 ) ) ( not ( = ?auto_520406 ?auto_520411 ) ) ( not ( = ?auto_520406 ?auto_520412 ) ) ( not ( = ?auto_520406 ?auto_520413 ) ) ( not ( = ?auto_520406 ?auto_520414 ) ) ( not ( = ?auto_520406 ?auto_520415 ) ) ( not ( = ?auto_520406 ?auto_520416 ) ) ( not ( = ?auto_520406 ?auto_520417 ) ) ( not ( = ?auto_520406 ?auto_520418 ) ) ( not ( = ?auto_520406 ?auto_520419 ) ) ( not ( = ?auto_520406 ?auto_520420 ) ) ( not ( = ?auto_520406 ?auto_520421 ) ) ( not ( = ?auto_520407 ?auto_520408 ) ) ( not ( = ?auto_520407 ?auto_520409 ) ) ( not ( = ?auto_520407 ?auto_520410 ) ) ( not ( = ?auto_520407 ?auto_520411 ) ) ( not ( = ?auto_520407 ?auto_520412 ) ) ( not ( = ?auto_520407 ?auto_520413 ) ) ( not ( = ?auto_520407 ?auto_520414 ) ) ( not ( = ?auto_520407 ?auto_520415 ) ) ( not ( = ?auto_520407 ?auto_520416 ) ) ( not ( = ?auto_520407 ?auto_520417 ) ) ( not ( = ?auto_520407 ?auto_520418 ) ) ( not ( = ?auto_520407 ?auto_520419 ) ) ( not ( = ?auto_520407 ?auto_520420 ) ) ( not ( = ?auto_520407 ?auto_520421 ) ) ( not ( = ?auto_520408 ?auto_520409 ) ) ( not ( = ?auto_520408 ?auto_520410 ) ) ( not ( = ?auto_520408 ?auto_520411 ) ) ( not ( = ?auto_520408 ?auto_520412 ) ) ( not ( = ?auto_520408 ?auto_520413 ) ) ( not ( = ?auto_520408 ?auto_520414 ) ) ( not ( = ?auto_520408 ?auto_520415 ) ) ( not ( = ?auto_520408 ?auto_520416 ) ) ( not ( = ?auto_520408 ?auto_520417 ) ) ( not ( = ?auto_520408 ?auto_520418 ) ) ( not ( = ?auto_520408 ?auto_520419 ) ) ( not ( = ?auto_520408 ?auto_520420 ) ) ( not ( = ?auto_520408 ?auto_520421 ) ) ( not ( = ?auto_520409 ?auto_520410 ) ) ( not ( = ?auto_520409 ?auto_520411 ) ) ( not ( = ?auto_520409 ?auto_520412 ) ) ( not ( = ?auto_520409 ?auto_520413 ) ) ( not ( = ?auto_520409 ?auto_520414 ) ) ( not ( = ?auto_520409 ?auto_520415 ) ) ( not ( = ?auto_520409 ?auto_520416 ) ) ( not ( = ?auto_520409 ?auto_520417 ) ) ( not ( = ?auto_520409 ?auto_520418 ) ) ( not ( = ?auto_520409 ?auto_520419 ) ) ( not ( = ?auto_520409 ?auto_520420 ) ) ( not ( = ?auto_520409 ?auto_520421 ) ) ( not ( = ?auto_520410 ?auto_520411 ) ) ( not ( = ?auto_520410 ?auto_520412 ) ) ( not ( = ?auto_520410 ?auto_520413 ) ) ( not ( = ?auto_520410 ?auto_520414 ) ) ( not ( = ?auto_520410 ?auto_520415 ) ) ( not ( = ?auto_520410 ?auto_520416 ) ) ( not ( = ?auto_520410 ?auto_520417 ) ) ( not ( = ?auto_520410 ?auto_520418 ) ) ( not ( = ?auto_520410 ?auto_520419 ) ) ( not ( = ?auto_520410 ?auto_520420 ) ) ( not ( = ?auto_520410 ?auto_520421 ) ) ( not ( = ?auto_520411 ?auto_520412 ) ) ( not ( = ?auto_520411 ?auto_520413 ) ) ( not ( = ?auto_520411 ?auto_520414 ) ) ( not ( = ?auto_520411 ?auto_520415 ) ) ( not ( = ?auto_520411 ?auto_520416 ) ) ( not ( = ?auto_520411 ?auto_520417 ) ) ( not ( = ?auto_520411 ?auto_520418 ) ) ( not ( = ?auto_520411 ?auto_520419 ) ) ( not ( = ?auto_520411 ?auto_520420 ) ) ( not ( = ?auto_520411 ?auto_520421 ) ) ( not ( = ?auto_520412 ?auto_520413 ) ) ( not ( = ?auto_520412 ?auto_520414 ) ) ( not ( = ?auto_520412 ?auto_520415 ) ) ( not ( = ?auto_520412 ?auto_520416 ) ) ( not ( = ?auto_520412 ?auto_520417 ) ) ( not ( = ?auto_520412 ?auto_520418 ) ) ( not ( = ?auto_520412 ?auto_520419 ) ) ( not ( = ?auto_520412 ?auto_520420 ) ) ( not ( = ?auto_520412 ?auto_520421 ) ) ( not ( = ?auto_520413 ?auto_520414 ) ) ( not ( = ?auto_520413 ?auto_520415 ) ) ( not ( = ?auto_520413 ?auto_520416 ) ) ( not ( = ?auto_520413 ?auto_520417 ) ) ( not ( = ?auto_520413 ?auto_520418 ) ) ( not ( = ?auto_520413 ?auto_520419 ) ) ( not ( = ?auto_520413 ?auto_520420 ) ) ( not ( = ?auto_520413 ?auto_520421 ) ) ( not ( = ?auto_520414 ?auto_520415 ) ) ( not ( = ?auto_520414 ?auto_520416 ) ) ( not ( = ?auto_520414 ?auto_520417 ) ) ( not ( = ?auto_520414 ?auto_520418 ) ) ( not ( = ?auto_520414 ?auto_520419 ) ) ( not ( = ?auto_520414 ?auto_520420 ) ) ( not ( = ?auto_520414 ?auto_520421 ) ) ( not ( = ?auto_520415 ?auto_520416 ) ) ( not ( = ?auto_520415 ?auto_520417 ) ) ( not ( = ?auto_520415 ?auto_520418 ) ) ( not ( = ?auto_520415 ?auto_520419 ) ) ( not ( = ?auto_520415 ?auto_520420 ) ) ( not ( = ?auto_520415 ?auto_520421 ) ) ( not ( = ?auto_520416 ?auto_520417 ) ) ( not ( = ?auto_520416 ?auto_520418 ) ) ( not ( = ?auto_520416 ?auto_520419 ) ) ( not ( = ?auto_520416 ?auto_520420 ) ) ( not ( = ?auto_520416 ?auto_520421 ) ) ( not ( = ?auto_520417 ?auto_520418 ) ) ( not ( = ?auto_520417 ?auto_520419 ) ) ( not ( = ?auto_520417 ?auto_520420 ) ) ( not ( = ?auto_520417 ?auto_520421 ) ) ( not ( = ?auto_520418 ?auto_520419 ) ) ( not ( = ?auto_520418 ?auto_520420 ) ) ( not ( = ?auto_520418 ?auto_520421 ) ) ( not ( = ?auto_520419 ?auto_520420 ) ) ( not ( = ?auto_520419 ?auto_520421 ) ) ( not ( = ?auto_520420 ?auto_520421 ) ) ( CLEAR ?auto_520418 ) ( ON ?auto_520419 ?auto_520420 ) ( CLEAR ?auto_520419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_520405 ?auto_520406 ?auto_520407 ?auto_520408 ?auto_520409 ?auto_520410 ?auto_520411 ?auto_520412 ?auto_520413 ?auto_520414 ?auto_520415 ?auto_520416 ?auto_520417 ?auto_520418 ?auto_520419 )
      ( MAKE-16PILE ?auto_520405 ?auto_520406 ?auto_520407 ?auto_520408 ?auto_520409 ?auto_520410 ?auto_520411 ?auto_520412 ?auto_520413 ?auto_520414 ?auto_520415 ?auto_520416 ?auto_520417 ?auto_520418 ?auto_520419 ?auto_520420 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520438 - BLOCK
      ?auto_520439 - BLOCK
      ?auto_520440 - BLOCK
      ?auto_520441 - BLOCK
      ?auto_520442 - BLOCK
      ?auto_520443 - BLOCK
      ?auto_520444 - BLOCK
      ?auto_520445 - BLOCK
      ?auto_520446 - BLOCK
      ?auto_520447 - BLOCK
      ?auto_520448 - BLOCK
      ?auto_520449 - BLOCK
      ?auto_520450 - BLOCK
      ?auto_520451 - BLOCK
      ?auto_520452 - BLOCK
      ?auto_520453 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520453 ) ( ON-TABLE ?auto_520438 ) ( ON ?auto_520439 ?auto_520438 ) ( ON ?auto_520440 ?auto_520439 ) ( ON ?auto_520441 ?auto_520440 ) ( ON ?auto_520442 ?auto_520441 ) ( ON ?auto_520443 ?auto_520442 ) ( ON ?auto_520444 ?auto_520443 ) ( ON ?auto_520445 ?auto_520444 ) ( ON ?auto_520446 ?auto_520445 ) ( ON ?auto_520447 ?auto_520446 ) ( ON ?auto_520448 ?auto_520447 ) ( ON ?auto_520449 ?auto_520448 ) ( ON ?auto_520450 ?auto_520449 ) ( ON ?auto_520451 ?auto_520450 ) ( not ( = ?auto_520438 ?auto_520439 ) ) ( not ( = ?auto_520438 ?auto_520440 ) ) ( not ( = ?auto_520438 ?auto_520441 ) ) ( not ( = ?auto_520438 ?auto_520442 ) ) ( not ( = ?auto_520438 ?auto_520443 ) ) ( not ( = ?auto_520438 ?auto_520444 ) ) ( not ( = ?auto_520438 ?auto_520445 ) ) ( not ( = ?auto_520438 ?auto_520446 ) ) ( not ( = ?auto_520438 ?auto_520447 ) ) ( not ( = ?auto_520438 ?auto_520448 ) ) ( not ( = ?auto_520438 ?auto_520449 ) ) ( not ( = ?auto_520438 ?auto_520450 ) ) ( not ( = ?auto_520438 ?auto_520451 ) ) ( not ( = ?auto_520438 ?auto_520452 ) ) ( not ( = ?auto_520438 ?auto_520453 ) ) ( not ( = ?auto_520439 ?auto_520440 ) ) ( not ( = ?auto_520439 ?auto_520441 ) ) ( not ( = ?auto_520439 ?auto_520442 ) ) ( not ( = ?auto_520439 ?auto_520443 ) ) ( not ( = ?auto_520439 ?auto_520444 ) ) ( not ( = ?auto_520439 ?auto_520445 ) ) ( not ( = ?auto_520439 ?auto_520446 ) ) ( not ( = ?auto_520439 ?auto_520447 ) ) ( not ( = ?auto_520439 ?auto_520448 ) ) ( not ( = ?auto_520439 ?auto_520449 ) ) ( not ( = ?auto_520439 ?auto_520450 ) ) ( not ( = ?auto_520439 ?auto_520451 ) ) ( not ( = ?auto_520439 ?auto_520452 ) ) ( not ( = ?auto_520439 ?auto_520453 ) ) ( not ( = ?auto_520440 ?auto_520441 ) ) ( not ( = ?auto_520440 ?auto_520442 ) ) ( not ( = ?auto_520440 ?auto_520443 ) ) ( not ( = ?auto_520440 ?auto_520444 ) ) ( not ( = ?auto_520440 ?auto_520445 ) ) ( not ( = ?auto_520440 ?auto_520446 ) ) ( not ( = ?auto_520440 ?auto_520447 ) ) ( not ( = ?auto_520440 ?auto_520448 ) ) ( not ( = ?auto_520440 ?auto_520449 ) ) ( not ( = ?auto_520440 ?auto_520450 ) ) ( not ( = ?auto_520440 ?auto_520451 ) ) ( not ( = ?auto_520440 ?auto_520452 ) ) ( not ( = ?auto_520440 ?auto_520453 ) ) ( not ( = ?auto_520441 ?auto_520442 ) ) ( not ( = ?auto_520441 ?auto_520443 ) ) ( not ( = ?auto_520441 ?auto_520444 ) ) ( not ( = ?auto_520441 ?auto_520445 ) ) ( not ( = ?auto_520441 ?auto_520446 ) ) ( not ( = ?auto_520441 ?auto_520447 ) ) ( not ( = ?auto_520441 ?auto_520448 ) ) ( not ( = ?auto_520441 ?auto_520449 ) ) ( not ( = ?auto_520441 ?auto_520450 ) ) ( not ( = ?auto_520441 ?auto_520451 ) ) ( not ( = ?auto_520441 ?auto_520452 ) ) ( not ( = ?auto_520441 ?auto_520453 ) ) ( not ( = ?auto_520442 ?auto_520443 ) ) ( not ( = ?auto_520442 ?auto_520444 ) ) ( not ( = ?auto_520442 ?auto_520445 ) ) ( not ( = ?auto_520442 ?auto_520446 ) ) ( not ( = ?auto_520442 ?auto_520447 ) ) ( not ( = ?auto_520442 ?auto_520448 ) ) ( not ( = ?auto_520442 ?auto_520449 ) ) ( not ( = ?auto_520442 ?auto_520450 ) ) ( not ( = ?auto_520442 ?auto_520451 ) ) ( not ( = ?auto_520442 ?auto_520452 ) ) ( not ( = ?auto_520442 ?auto_520453 ) ) ( not ( = ?auto_520443 ?auto_520444 ) ) ( not ( = ?auto_520443 ?auto_520445 ) ) ( not ( = ?auto_520443 ?auto_520446 ) ) ( not ( = ?auto_520443 ?auto_520447 ) ) ( not ( = ?auto_520443 ?auto_520448 ) ) ( not ( = ?auto_520443 ?auto_520449 ) ) ( not ( = ?auto_520443 ?auto_520450 ) ) ( not ( = ?auto_520443 ?auto_520451 ) ) ( not ( = ?auto_520443 ?auto_520452 ) ) ( not ( = ?auto_520443 ?auto_520453 ) ) ( not ( = ?auto_520444 ?auto_520445 ) ) ( not ( = ?auto_520444 ?auto_520446 ) ) ( not ( = ?auto_520444 ?auto_520447 ) ) ( not ( = ?auto_520444 ?auto_520448 ) ) ( not ( = ?auto_520444 ?auto_520449 ) ) ( not ( = ?auto_520444 ?auto_520450 ) ) ( not ( = ?auto_520444 ?auto_520451 ) ) ( not ( = ?auto_520444 ?auto_520452 ) ) ( not ( = ?auto_520444 ?auto_520453 ) ) ( not ( = ?auto_520445 ?auto_520446 ) ) ( not ( = ?auto_520445 ?auto_520447 ) ) ( not ( = ?auto_520445 ?auto_520448 ) ) ( not ( = ?auto_520445 ?auto_520449 ) ) ( not ( = ?auto_520445 ?auto_520450 ) ) ( not ( = ?auto_520445 ?auto_520451 ) ) ( not ( = ?auto_520445 ?auto_520452 ) ) ( not ( = ?auto_520445 ?auto_520453 ) ) ( not ( = ?auto_520446 ?auto_520447 ) ) ( not ( = ?auto_520446 ?auto_520448 ) ) ( not ( = ?auto_520446 ?auto_520449 ) ) ( not ( = ?auto_520446 ?auto_520450 ) ) ( not ( = ?auto_520446 ?auto_520451 ) ) ( not ( = ?auto_520446 ?auto_520452 ) ) ( not ( = ?auto_520446 ?auto_520453 ) ) ( not ( = ?auto_520447 ?auto_520448 ) ) ( not ( = ?auto_520447 ?auto_520449 ) ) ( not ( = ?auto_520447 ?auto_520450 ) ) ( not ( = ?auto_520447 ?auto_520451 ) ) ( not ( = ?auto_520447 ?auto_520452 ) ) ( not ( = ?auto_520447 ?auto_520453 ) ) ( not ( = ?auto_520448 ?auto_520449 ) ) ( not ( = ?auto_520448 ?auto_520450 ) ) ( not ( = ?auto_520448 ?auto_520451 ) ) ( not ( = ?auto_520448 ?auto_520452 ) ) ( not ( = ?auto_520448 ?auto_520453 ) ) ( not ( = ?auto_520449 ?auto_520450 ) ) ( not ( = ?auto_520449 ?auto_520451 ) ) ( not ( = ?auto_520449 ?auto_520452 ) ) ( not ( = ?auto_520449 ?auto_520453 ) ) ( not ( = ?auto_520450 ?auto_520451 ) ) ( not ( = ?auto_520450 ?auto_520452 ) ) ( not ( = ?auto_520450 ?auto_520453 ) ) ( not ( = ?auto_520451 ?auto_520452 ) ) ( not ( = ?auto_520451 ?auto_520453 ) ) ( not ( = ?auto_520452 ?auto_520453 ) ) ( CLEAR ?auto_520451 ) ( ON ?auto_520452 ?auto_520453 ) ( CLEAR ?auto_520452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_520438 ?auto_520439 ?auto_520440 ?auto_520441 ?auto_520442 ?auto_520443 ?auto_520444 ?auto_520445 ?auto_520446 ?auto_520447 ?auto_520448 ?auto_520449 ?auto_520450 ?auto_520451 ?auto_520452 )
      ( MAKE-16PILE ?auto_520438 ?auto_520439 ?auto_520440 ?auto_520441 ?auto_520442 ?auto_520443 ?auto_520444 ?auto_520445 ?auto_520446 ?auto_520447 ?auto_520448 ?auto_520449 ?auto_520450 ?auto_520451 ?auto_520452 ?auto_520453 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520470 - BLOCK
      ?auto_520471 - BLOCK
      ?auto_520472 - BLOCK
      ?auto_520473 - BLOCK
      ?auto_520474 - BLOCK
      ?auto_520475 - BLOCK
      ?auto_520476 - BLOCK
      ?auto_520477 - BLOCK
      ?auto_520478 - BLOCK
      ?auto_520479 - BLOCK
      ?auto_520480 - BLOCK
      ?auto_520481 - BLOCK
      ?auto_520482 - BLOCK
      ?auto_520483 - BLOCK
      ?auto_520484 - BLOCK
      ?auto_520485 - BLOCK
    )
    :vars
    (
      ?auto_520486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520485 ?auto_520486 ) ( ON-TABLE ?auto_520470 ) ( ON ?auto_520471 ?auto_520470 ) ( ON ?auto_520472 ?auto_520471 ) ( ON ?auto_520473 ?auto_520472 ) ( ON ?auto_520474 ?auto_520473 ) ( ON ?auto_520475 ?auto_520474 ) ( ON ?auto_520476 ?auto_520475 ) ( ON ?auto_520477 ?auto_520476 ) ( ON ?auto_520478 ?auto_520477 ) ( ON ?auto_520479 ?auto_520478 ) ( ON ?auto_520480 ?auto_520479 ) ( ON ?auto_520481 ?auto_520480 ) ( ON ?auto_520482 ?auto_520481 ) ( not ( = ?auto_520470 ?auto_520471 ) ) ( not ( = ?auto_520470 ?auto_520472 ) ) ( not ( = ?auto_520470 ?auto_520473 ) ) ( not ( = ?auto_520470 ?auto_520474 ) ) ( not ( = ?auto_520470 ?auto_520475 ) ) ( not ( = ?auto_520470 ?auto_520476 ) ) ( not ( = ?auto_520470 ?auto_520477 ) ) ( not ( = ?auto_520470 ?auto_520478 ) ) ( not ( = ?auto_520470 ?auto_520479 ) ) ( not ( = ?auto_520470 ?auto_520480 ) ) ( not ( = ?auto_520470 ?auto_520481 ) ) ( not ( = ?auto_520470 ?auto_520482 ) ) ( not ( = ?auto_520470 ?auto_520483 ) ) ( not ( = ?auto_520470 ?auto_520484 ) ) ( not ( = ?auto_520470 ?auto_520485 ) ) ( not ( = ?auto_520470 ?auto_520486 ) ) ( not ( = ?auto_520471 ?auto_520472 ) ) ( not ( = ?auto_520471 ?auto_520473 ) ) ( not ( = ?auto_520471 ?auto_520474 ) ) ( not ( = ?auto_520471 ?auto_520475 ) ) ( not ( = ?auto_520471 ?auto_520476 ) ) ( not ( = ?auto_520471 ?auto_520477 ) ) ( not ( = ?auto_520471 ?auto_520478 ) ) ( not ( = ?auto_520471 ?auto_520479 ) ) ( not ( = ?auto_520471 ?auto_520480 ) ) ( not ( = ?auto_520471 ?auto_520481 ) ) ( not ( = ?auto_520471 ?auto_520482 ) ) ( not ( = ?auto_520471 ?auto_520483 ) ) ( not ( = ?auto_520471 ?auto_520484 ) ) ( not ( = ?auto_520471 ?auto_520485 ) ) ( not ( = ?auto_520471 ?auto_520486 ) ) ( not ( = ?auto_520472 ?auto_520473 ) ) ( not ( = ?auto_520472 ?auto_520474 ) ) ( not ( = ?auto_520472 ?auto_520475 ) ) ( not ( = ?auto_520472 ?auto_520476 ) ) ( not ( = ?auto_520472 ?auto_520477 ) ) ( not ( = ?auto_520472 ?auto_520478 ) ) ( not ( = ?auto_520472 ?auto_520479 ) ) ( not ( = ?auto_520472 ?auto_520480 ) ) ( not ( = ?auto_520472 ?auto_520481 ) ) ( not ( = ?auto_520472 ?auto_520482 ) ) ( not ( = ?auto_520472 ?auto_520483 ) ) ( not ( = ?auto_520472 ?auto_520484 ) ) ( not ( = ?auto_520472 ?auto_520485 ) ) ( not ( = ?auto_520472 ?auto_520486 ) ) ( not ( = ?auto_520473 ?auto_520474 ) ) ( not ( = ?auto_520473 ?auto_520475 ) ) ( not ( = ?auto_520473 ?auto_520476 ) ) ( not ( = ?auto_520473 ?auto_520477 ) ) ( not ( = ?auto_520473 ?auto_520478 ) ) ( not ( = ?auto_520473 ?auto_520479 ) ) ( not ( = ?auto_520473 ?auto_520480 ) ) ( not ( = ?auto_520473 ?auto_520481 ) ) ( not ( = ?auto_520473 ?auto_520482 ) ) ( not ( = ?auto_520473 ?auto_520483 ) ) ( not ( = ?auto_520473 ?auto_520484 ) ) ( not ( = ?auto_520473 ?auto_520485 ) ) ( not ( = ?auto_520473 ?auto_520486 ) ) ( not ( = ?auto_520474 ?auto_520475 ) ) ( not ( = ?auto_520474 ?auto_520476 ) ) ( not ( = ?auto_520474 ?auto_520477 ) ) ( not ( = ?auto_520474 ?auto_520478 ) ) ( not ( = ?auto_520474 ?auto_520479 ) ) ( not ( = ?auto_520474 ?auto_520480 ) ) ( not ( = ?auto_520474 ?auto_520481 ) ) ( not ( = ?auto_520474 ?auto_520482 ) ) ( not ( = ?auto_520474 ?auto_520483 ) ) ( not ( = ?auto_520474 ?auto_520484 ) ) ( not ( = ?auto_520474 ?auto_520485 ) ) ( not ( = ?auto_520474 ?auto_520486 ) ) ( not ( = ?auto_520475 ?auto_520476 ) ) ( not ( = ?auto_520475 ?auto_520477 ) ) ( not ( = ?auto_520475 ?auto_520478 ) ) ( not ( = ?auto_520475 ?auto_520479 ) ) ( not ( = ?auto_520475 ?auto_520480 ) ) ( not ( = ?auto_520475 ?auto_520481 ) ) ( not ( = ?auto_520475 ?auto_520482 ) ) ( not ( = ?auto_520475 ?auto_520483 ) ) ( not ( = ?auto_520475 ?auto_520484 ) ) ( not ( = ?auto_520475 ?auto_520485 ) ) ( not ( = ?auto_520475 ?auto_520486 ) ) ( not ( = ?auto_520476 ?auto_520477 ) ) ( not ( = ?auto_520476 ?auto_520478 ) ) ( not ( = ?auto_520476 ?auto_520479 ) ) ( not ( = ?auto_520476 ?auto_520480 ) ) ( not ( = ?auto_520476 ?auto_520481 ) ) ( not ( = ?auto_520476 ?auto_520482 ) ) ( not ( = ?auto_520476 ?auto_520483 ) ) ( not ( = ?auto_520476 ?auto_520484 ) ) ( not ( = ?auto_520476 ?auto_520485 ) ) ( not ( = ?auto_520476 ?auto_520486 ) ) ( not ( = ?auto_520477 ?auto_520478 ) ) ( not ( = ?auto_520477 ?auto_520479 ) ) ( not ( = ?auto_520477 ?auto_520480 ) ) ( not ( = ?auto_520477 ?auto_520481 ) ) ( not ( = ?auto_520477 ?auto_520482 ) ) ( not ( = ?auto_520477 ?auto_520483 ) ) ( not ( = ?auto_520477 ?auto_520484 ) ) ( not ( = ?auto_520477 ?auto_520485 ) ) ( not ( = ?auto_520477 ?auto_520486 ) ) ( not ( = ?auto_520478 ?auto_520479 ) ) ( not ( = ?auto_520478 ?auto_520480 ) ) ( not ( = ?auto_520478 ?auto_520481 ) ) ( not ( = ?auto_520478 ?auto_520482 ) ) ( not ( = ?auto_520478 ?auto_520483 ) ) ( not ( = ?auto_520478 ?auto_520484 ) ) ( not ( = ?auto_520478 ?auto_520485 ) ) ( not ( = ?auto_520478 ?auto_520486 ) ) ( not ( = ?auto_520479 ?auto_520480 ) ) ( not ( = ?auto_520479 ?auto_520481 ) ) ( not ( = ?auto_520479 ?auto_520482 ) ) ( not ( = ?auto_520479 ?auto_520483 ) ) ( not ( = ?auto_520479 ?auto_520484 ) ) ( not ( = ?auto_520479 ?auto_520485 ) ) ( not ( = ?auto_520479 ?auto_520486 ) ) ( not ( = ?auto_520480 ?auto_520481 ) ) ( not ( = ?auto_520480 ?auto_520482 ) ) ( not ( = ?auto_520480 ?auto_520483 ) ) ( not ( = ?auto_520480 ?auto_520484 ) ) ( not ( = ?auto_520480 ?auto_520485 ) ) ( not ( = ?auto_520480 ?auto_520486 ) ) ( not ( = ?auto_520481 ?auto_520482 ) ) ( not ( = ?auto_520481 ?auto_520483 ) ) ( not ( = ?auto_520481 ?auto_520484 ) ) ( not ( = ?auto_520481 ?auto_520485 ) ) ( not ( = ?auto_520481 ?auto_520486 ) ) ( not ( = ?auto_520482 ?auto_520483 ) ) ( not ( = ?auto_520482 ?auto_520484 ) ) ( not ( = ?auto_520482 ?auto_520485 ) ) ( not ( = ?auto_520482 ?auto_520486 ) ) ( not ( = ?auto_520483 ?auto_520484 ) ) ( not ( = ?auto_520483 ?auto_520485 ) ) ( not ( = ?auto_520483 ?auto_520486 ) ) ( not ( = ?auto_520484 ?auto_520485 ) ) ( not ( = ?auto_520484 ?auto_520486 ) ) ( not ( = ?auto_520485 ?auto_520486 ) ) ( ON ?auto_520484 ?auto_520485 ) ( CLEAR ?auto_520482 ) ( ON ?auto_520483 ?auto_520484 ) ( CLEAR ?auto_520483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_520470 ?auto_520471 ?auto_520472 ?auto_520473 ?auto_520474 ?auto_520475 ?auto_520476 ?auto_520477 ?auto_520478 ?auto_520479 ?auto_520480 ?auto_520481 ?auto_520482 ?auto_520483 )
      ( MAKE-16PILE ?auto_520470 ?auto_520471 ?auto_520472 ?auto_520473 ?auto_520474 ?auto_520475 ?auto_520476 ?auto_520477 ?auto_520478 ?auto_520479 ?auto_520480 ?auto_520481 ?auto_520482 ?auto_520483 ?auto_520484 ?auto_520485 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520503 - BLOCK
      ?auto_520504 - BLOCK
      ?auto_520505 - BLOCK
      ?auto_520506 - BLOCK
      ?auto_520507 - BLOCK
      ?auto_520508 - BLOCK
      ?auto_520509 - BLOCK
      ?auto_520510 - BLOCK
      ?auto_520511 - BLOCK
      ?auto_520512 - BLOCK
      ?auto_520513 - BLOCK
      ?auto_520514 - BLOCK
      ?auto_520515 - BLOCK
      ?auto_520516 - BLOCK
      ?auto_520517 - BLOCK
      ?auto_520518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520518 ) ( ON-TABLE ?auto_520503 ) ( ON ?auto_520504 ?auto_520503 ) ( ON ?auto_520505 ?auto_520504 ) ( ON ?auto_520506 ?auto_520505 ) ( ON ?auto_520507 ?auto_520506 ) ( ON ?auto_520508 ?auto_520507 ) ( ON ?auto_520509 ?auto_520508 ) ( ON ?auto_520510 ?auto_520509 ) ( ON ?auto_520511 ?auto_520510 ) ( ON ?auto_520512 ?auto_520511 ) ( ON ?auto_520513 ?auto_520512 ) ( ON ?auto_520514 ?auto_520513 ) ( ON ?auto_520515 ?auto_520514 ) ( not ( = ?auto_520503 ?auto_520504 ) ) ( not ( = ?auto_520503 ?auto_520505 ) ) ( not ( = ?auto_520503 ?auto_520506 ) ) ( not ( = ?auto_520503 ?auto_520507 ) ) ( not ( = ?auto_520503 ?auto_520508 ) ) ( not ( = ?auto_520503 ?auto_520509 ) ) ( not ( = ?auto_520503 ?auto_520510 ) ) ( not ( = ?auto_520503 ?auto_520511 ) ) ( not ( = ?auto_520503 ?auto_520512 ) ) ( not ( = ?auto_520503 ?auto_520513 ) ) ( not ( = ?auto_520503 ?auto_520514 ) ) ( not ( = ?auto_520503 ?auto_520515 ) ) ( not ( = ?auto_520503 ?auto_520516 ) ) ( not ( = ?auto_520503 ?auto_520517 ) ) ( not ( = ?auto_520503 ?auto_520518 ) ) ( not ( = ?auto_520504 ?auto_520505 ) ) ( not ( = ?auto_520504 ?auto_520506 ) ) ( not ( = ?auto_520504 ?auto_520507 ) ) ( not ( = ?auto_520504 ?auto_520508 ) ) ( not ( = ?auto_520504 ?auto_520509 ) ) ( not ( = ?auto_520504 ?auto_520510 ) ) ( not ( = ?auto_520504 ?auto_520511 ) ) ( not ( = ?auto_520504 ?auto_520512 ) ) ( not ( = ?auto_520504 ?auto_520513 ) ) ( not ( = ?auto_520504 ?auto_520514 ) ) ( not ( = ?auto_520504 ?auto_520515 ) ) ( not ( = ?auto_520504 ?auto_520516 ) ) ( not ( = ?auto_520504 ?auto_520517 ) ) ( not ( = ?auto_520504 ?auto_520518 ) ) ( not ( = ?auto_520505 ?auto_520506 ) ) ( not ( = ?auto_520505 ?auto_520507 ) ) ( not ( = ?auto_520505 ?auto_520508 ) ) ( not ( = ?auto_520505 ?auto_520509 ) ) ( not ( = ?auto_520505 ?auto_520510 ) ) ( not ( = ?auto_520505 ?auto_520511 ) ) ( not ( = ?auto_520505 ?auto_520512 ) ) ( not ( = ?auto_520505 ?auto_520513 ) ) ( not ( = ?auto_520505 ?auto_520514 ) ) ( not ( = ?auto_520505 ?auto_520515 ) ) ( not ( = ?auto_520505 ?auto_520516 ) ) ( not ( = ?auto_520505 ?auto_520517 ) ) ( not ( = ?auto_520505 ?auto_520518 ) ) ( not ( = ?auto_520506 ?auto_520507 ) ) ( not ( = ?auto_520506 ?auto_520508 ) ) ( not ( = ?auto_520506 ?auto_520509 ) ) ( not ( = ?auto_520506 ?auto_520510 ) ) ( not ( = ?auto_520506 ?auto_520511 ) ) ( not ( = ?auto_520506 ?auto_520512 ) ) ( not ( = ?auto_520506 ?auto_520513 ) ) ( not ( = ?auto_520506 ?auto_520514 ) ) ( not ( = ?auto_520506 ?auto_520515 ) ) ( not ( = ?auto_520506 ?auto_520516 ) ) ( not ( = ?auto_520506 ?auto_520517 ) ) ( not ( = ?auto_520506 ?auto_520518 ) ) ( not ( = ?auto_520507 ?auto_520508 ) ) ( not ( = ?auto_520507 ?auto_520509 ) ) ( not ( = ?auto_520507 ?auto_520510 ) ) ( not ( = ?auto_520507 ?auto_520511 ) ) ( not ( = ?auto_520507 ?auto_520512 ) ) ( not ( = ?auto_520507 ?auto_520513 ) ) ( not ( = ?auto_520507 ?auto_520514 ) ) ( not ( = ?auto_520507 ?auto_520515 ) ) ( not ( = ?auto_520507 ?auto_520516 ) ) ( not ( = ?auto_520507 ?auto_520517 ) ) ( not ( = ?auto_520507 ?auto_520518 ) ) ( not ( = ?auto_520508 ?auto_520509 ) ) ( not ( = ?auto_520508 ?auto_520510 ) ) ( not ( = ?auto_520508 ?auto_520511 ) ) ( not ( = ?auto_520508 ?auto_520512 ) ) ( not ( = ?auto_520508 ?auto_520513 ) ) ( not ( = ?auto_520508 ?auto_520514 ) ) ( not ( = ?auto_520508 ?auto_520515 ) ) ( not ( = ?auto_520508 ?auto_520516 ) ) ( not ( = ?auto_520508 ?auto_520517 ) ) ( not ( = ?auto_520508 ?auto_520518 ) ) ( not ( = ?auto_520509 ?auto_520510 ) ) ( not ( = ?auto_520509 ?auto_520511 ) ) ( not ( = ?auto_520509 ?auto_520512 ) ) ( not ( = ?auto_520509 ?auto_520513 ) ) ( not ( = ?auto_520509 ?auto_520514 ) ) ( not ( = ?auto_520509 ?auto_520515 ) ) ( not ( = ?auto_520509 ?auto_520516 ) ) ( not ( = ?auto_520509 ?auto_520517 ) ) ( not ( = ?auto_520509 ?auto_520518 ) ) ( not ( = ?auto_520510 ?auto_520511 ) ) ( not ( = ?auto_520510 ?auto_520512 ) ) ( not ( = ?auto_520510 ?auto_520513 ) ) ( not ( = ?auto_520510 ?auto_520514 ) ) ( not ( = ?auto_520510 ?auto_520515 ) ) ( not ( = ?auto_520510 ?auto_520516 ) ) ( not ( = ?auto_520510 ?auto_520517 ) ) ( not ( = ?auto_520510 ?auto_520518 ) ) ( not ( = ?auto_520511 ?auto_520512 ) ) ( not ( = ?auto_520511 ?auto_520513 ) ) ( not ( = ?auto_520511 ?auto_520514 ) ) ( not ( = ?auto_520511 ?auto_520515 ) ) ( not ( = ?auto_520511 ?auto_520516 ) ) ( not ( = ?auto_520511 ?auto_520517 ) ) ( not ( = ?auto_520511 ?auto_520518 ) ) ( not ( = ?auto_520512 ?auto_520513 ) ) ( not ( = ?auto_520512 ?auto_520514 ) ) ( not ( = ?auto_520512 ?auto_520515 ) ) ( not ( = ?auto_520512 ?auto_520516 ) ) ( not ( = ?auto_520512 ?auto_520517 ) ) ( not ( = ?auto_520512 ?auto_520518 ) ) ( not ( = ?auto_520513 ?auto_520514 ) ) ( not ( = ?auto_520513 ?auto_520515 ) ) ( not ( = ?auto_520513 ?auto_520516 ) ) ( not ( = ?auto_520513 ?auto_520517 ) ) ( not ( = ?auto_520513 ?auto_520518 ) ) ( not ( = ?auto_520514 ?auto_520515 ) ) ( not ( = ?auto_520514 ?auto_520516 ) ) ( not ( = ?auto_520514 ?auto_520517 ) ) ( not ( = ?auto_520514 ?auto_520518 ) ) ( not ( = ?auto_520515 ?auto_520516 ) ) ( not ( = ?auto_520515 ?auto_520517 ) ) ( not ( = ?auto_520515 ?auto_520518 ) ) ( not ( = ?auto_520516 ?auto_520517 ) ) ( not ( = ?auto_520516 ?auto_520518 ) ) ( not ( = ?auto_520517 ?auto_520518 ) ) ( ON ?auto_520517 ?auto_520518 ) ( CLEAR ?auto_520515 ) ( ON ?auto_520516 ?auto_520517 ) ( CLEAR ?auto_520516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_520503 ?auto_520504 ?auto_520505 ?auto_520506 ?auto_520507 ?auto_520508 ?auto_520509 ?auto_520510 ?auto_520511 ?auto_520512 ?auto_520513 ?auto_520514 ?auto_520515 ?auto_520516 )
      ( MAKE-16PILE ?auto_520503 ?auto_520504 ?auto_520505 ?auto_520506 ?auto_520507 ?auto_520508 ?auto_520509 ?auto_520510 ?auto_520511 ?auto_520512 ?auto_520513 ?auto_520514 ?auto_520515 ?auto_520516 ?auto_520517 ?auto_520518 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520535 - BLOCK
      ?auto_520536 - BLOCK
      ?auto_520537 - BLOCK
      ?auto_520538 - BLOCK
      ?auto_520539 - BLOCK
      ?auto_520540 - BLOCK
      ?auto_520541 - BLOCK
      ?auto_520542 - BLOCK
      ?auto_520543 - BLOCK
      ?auto_520544 - BLOCK
      ?auto_520545 - BLOCK
      ?auto_520546 - BLOCK
      ?auto_520547 - BLOCK
      ?auto_520548 - BLOCK
      ?auto_520549 - BLOCK
      ?auto_520550 - BLOCK
    )
    :vars
    (
      ?auto_520551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520550 ?auto_520551 ) ( ON-TABLE ?auto_520535 ) ( ON ?auto_520536 ?auto_520535 ) ( ON ?auto_520537 ?auto_520536 ) ( ON ?auto_520538 ?auto_520537 ) ( ON ?auto_520539 ?auto_520538 ) ( ON ?auto_520540 ?auto_520539 ) ( ON ?auto_520541 ?auto_520540 ) ( ON ?auto_520542 ?auto_520541 ) ( ON ?auto_520543 ?auto_520542 ) ( ON ?auto_520544 ?auto_520543 ) ( ON ?auto_520545 ?auto_520544 ) ( ON ?auto_520546 ?auto_520545 ) ( not ( = ?auto_520535 ?auto_520536 ) ) ( not ( = ?auto_520535 ?auto_520537 ) ) ( not ( = ?auto_520535 ?auto_520538 ) ) ( not ( = ?auto_520535 ?auto_520539 ) ) ( not ( = ?auto_520535 ?auto_520540 ) ) ( not ( = ?auto_520535 ?auto_520541 ) ) ( not ( = ?auto_520535 ?auto_520542 ) ) ( not ( = ?auto_520535 ?auto_520543 ) ) ( not ( = ?auto_520535 ?auto_520544 ) ) ( not ( = ?auto_520535 ?auto_520545 ) ) ( not ( = ?auto_520535 ?auto_520546 ) ) ( not ( = ?auto_520535 ?auto_520547 ) ) ( not ( = ?auto_520535 ?auto_520548 ) ) ( not ( = ?auto_520535 ?auto_520549 ) ) ( not ( = ?auto_520535 ?auto_520550 ) ) ( not ( = ?auto_520535 ?auto_520551 ) ) ( not ( = ?auto_520536 ?auto_520537 ) ) ( not ( = ?auto_520536 ?auto_520538 ) ) ( not ( = ?auto_520536 ?auto_520539 ) ) ( not ( = ?auto_520536 ?auto_520540 ) ) ( not ( = ?auto_520536 ?auto_520541 ) ) ( not ( = ?auto_520536 ?auto_520542 ) ) ( not ( = ?auto_520536 ?auto_520543 ) ) ( not ( = ?auto_520536 ?auto_520544 ) ) ( not ( = ?auto_520536 ?auto_520545 ) ) ( not ( = ?auto_520536 ?auto_520546 ) ) ( not ( = ?auto_520536 ?auto_520547 ) ) ( not ( = ?auto_520536 ?auto_520548 ) ) ( not ( = ?auto_520536 ?auto_520549 ) ) ( not ( = ?auto_520536 ?auto_520550 ) ) ( not ( = ?auto_520536 ?auto_520551 ) ) ( not ( = ?auto_520537 ?auto_520538 ) ) ( not ( = ?auto_520537 ?auto_520539 ) ) ( not ( = ?auto_520537 ?auto_520540 ) ) ( not ( = ?auto_520537 ?auto_520541 ) ) ( not ( = ?auto_520537 ?auto_520542 ) ) ( not ( = ?auto_520537 ?auto_520543 ) ) ( not ( = ?auto_520537 ?auto_520544 ) ) ( not ( = ?auto_520537 ?auto_520545 ) ) ( not ( = ?auto_520537 ?auto_520546 ) ) ( not ( = ?auto_520537 ?auto_520547 ) ) ( not ( = ?auto_520537 ?auto_520548 ) ) ( not ( = ?auto_520537 ?auto_520549 ) ) ( not ( = ?auto_520537 ?auto_520550 ) ) ( not ( = ?auto_520537 ?auto_520551 ) ) ( not ( = ?auto_520538 ?auto_520539 ) ) ( not ( = ?auto_520538 ?auto_520540 ) ) ( not ( = ?auto_520538 ?auto_520541 ) ) ( not ( = ?auto_520538 ?auto_520542 ) ) ( not ( = ?auto_520538 ?auto_520543 ) ) ( not ( = ?auto_520538 ?auto_520544 ) ) ( not ( = ?auto_520538 ?auto_520545 ) ) ( not ( = ?auto_520538 ?auto_520546 ) ) ( not ( = ?auto_520538 ?auto_520547 ) ) ( not ( = ?auto_520538 ?auto_520548 ) ) ( not ( = ?auto_520538 ?auto_520549 ) ) ( not ( = ?auto_520538 ?auto_520550 ) ) ( not ( = ?auto_520538 ?auto_520551 ) ) ( not ( = ?auto_520539 ?auto_520540 ) ) ( not ( = ?auto_520539 ?auto_520541 ) ) ( not ( = ?auto_520539 ?auto_520542 ) ) ( not ( = ?auto_520539 ?auto_520543 ) ) ( not ( = ?auto_520539 ?auto_520544 ) ) ( not ( = ?auto_520539 ?auto_520545 ) ) ( not ( = ?auto_520539 ?auto_520546 ) ) ( not ( = ?auto_520539 ?auto_520547 ) ) ( not ( = ?auto_520539 ?auto_520548 ) ) ( not ( = ?auto_520539 ?auto_520549 ) ) ( not ( = ?auto_520539 ?auto_520550 ) ) ( not ( = ?auto_520539 ?auto_520551 ) ) ( not ( = ?auto_520540 ?auto_520541 ) ) ( not ( = ?auto_520540 ?auto_520542 ) ) ( not ( = ?auto_520540 ?auto_520543 ) ) ( not ( = ?auto_520540 ?auto_520544 ) ) ( not ( = ?auto_520540 ?auto_520545 ) ) ( not ( = ?auto_520540 ?auto_520546 ) ) ( not ( = ?auto_520540 ?auto_520547 ) ) ( not ( = ?auto_520540 ?auto_520548 ) ) ( not ( = ?auto_520540 ?auto_520549 ) ) ( not ( = ?auto_520540 ?auto_520550 ) ) ( not ( = ?auto_520540 ?auto_520551 ) ) ( not ( = ?auto_520541 ?auto_520542 ) ) ( not ( = ?auto_520541 ?auto_520543 ) ) ( not ( = ?auto_520541 ?auto_520544 ) ) ( not ( = ?auto_520541 ?auto_520545 ) ) ( not ( = ?auto_520541 ?auto_520546 ) ) ( not ( = ?auto_520541 ?auto_520547 ) ) ( not ( = ?auto_520541 ?auto_520548 ) ) ( not ( = ?auto_520541 ?auto_520549 ) ) ( not ( = ?auto_520541 ?auto_520550 ) ) ( not ( = ?auto_520541 ?auto_520551 ) ) ( not ( = ?auto_520542 ?auto_520543 ) ) ( not ( = ?auto_520542 ?auto_520544 ) ) ( not ( = ?auto_520542 ?auto_520545 ) ) ( not ( = ?auto_520542 ?auto_520546 ) ) ( not ( = ?auto_520542 ?auto_520547 ) ) ( not ( = ?auto_520542 ?auto_520548 ) ) ( not ( = ?auto_520542 ?auto_520549 ) ) ( not ( = ?auto_520542 ?auto_520550 ) ) ( not ( = ?auto_520542 ?auto_520551 ) ) ( not ( = ?auto_520543 ?auto_520544 ) ) ( not ( = ?auto_520543 ?auto_520545 ) ) ( not ( = ?auto_520543 ?auto_520546 ) ) ( not ( = ?auto_520543 ?auto_520547 ) ) ( not ( = ?auto_520543 ?auto_520548 ) ) ( not ( = ?auto_520543 ?auto_520549 ) ) ( not ( = ?auto_520543 ?auto_520550 ) ) ( not ( = ?auto_520543 ?auto_520551 ) ) ( not ( = ?auto_520544 ?auto_520545 ) ) ( not ( = ?auto_520544 ?auto_520546 ) ) ( not ( = ?auto_520544 ?auto_520547 ) ) ( not ( = ?auto_520544 ?auto_520548 ) ) ( not ( = ?auto_520544 ?auto_520549 ) ) ( not ( = ?auto_520544 ?auto_520550 ) ) ( not ( = ?auto_520544 ?auto_520551 ) ) ( not ( = ?auto_520545 ?auto_520546 ) ) ( not ( = ?auto_520545 ?auto_520547 ) ) ( not ( = ?auto_520545 ?auto_520548 ) ) ( not ( = ?auto_520545 ?auto_520549 ) ) ( not ( = ?auto_520545 ?auto_520550 ) ) ( not ( = ?auto_520545 ?auto_520551 ) ) ( not ( = ?auto_520546 ?auto_520547 ) ) ( not ( = ?auto_520546 ?auto_520548 ) ) ( not ( = ?auto_520546 ?auto_520549 ) ) ( not ( = ?auto_520546 ?auto_520550 ) ) ( not ( = ?auto_520546 ?auto_520551 ) ) ( not ( = ?auto_520547 ?auto_520548 ) ) ( not ( = ?auto_520547 ?auto_520549 ) ) ( not ( = ?auto_520547 ?auto_520550 ) ) ( not ( = ?auto_520547 ?auto_520551 ) ) ( not ( = ?auto_520548 ?auto_520549 ) ) ( not ( = ?auto_520548 ?auto_520550 ) ) ( not ( = ?auto_520548 ?auto_520551 ) ) ( not ( = ?auto_520549 ?auto_520550 ) ) ( not ( = ?auto_520549 ?auto_520551 ) ) ( not ( = ?auto_520550 ?auto_520551 ) ) ( ON ?auto_520549 ?auto_520550 ) ( ON ?auto_520548 ?auto_520549 ) ( CLEAR ?auto_520546 ) ( ON ?auto_520547 ?auto_520548 ) ( CLEAR ?auto_520547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_520535 ?auto_520536 ?auto_520537 ?auto_520538 ?auto_520539 ?auto_520540 ?auto_520541 ?auto_520542 ?auto_520543 ?auto_520544 ?auto_520545 ?auto_520546 ?auto_520547 )
      ( MAKE-16PILE ?auto_520535 ?auto_520536 ?auto_520537 ?auto_520538 ?auto_520539 ?auto_520540 ?auto_520541 ?auto_520542 ?auto_520543 ?auto_520544 ?auto_520545 ?auto_520546 ?auto_520547 ?auto_520548 ?auto_520549 ?auto_520550 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520568 - BLOCK
      ?auto_520569 - BLOCK
      ?auto_520570 - BLOCK
      ?auto_520571 - BLOCK
      ?auto_520572 - BLOCK
      ?auto_520573 - BLOCK
      ?auto_520574 - BLOCK
      ?auto_520575 - BLOCK
      ?auto_520576 - BLOCK
      ?auto_520577 - BLOCK
      ?auto_520578 - BLOCK
      ?auto_520579 - BLOCK
      ?auto_520580 - BLOCK
      ?auto_520581 - BLOCK
      ?auto_520582 - BLOCK
      ?auto_520583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520583 ) ( ON-TABLE ?auto_520568 ) ( ON ?auto_520569 ?auto_520568 ) ( ON ?auto_520570 ?auto_520569 ) ( ON ?auto_520571 ?auto_520570 ) ( ON ?auto_520572 ?auto_520571 ) ( ON ?auto_520573 ?auto_520572 ) ( ON ?auto_520574 ?auto_520573 ) ( ON ?auto_520575 ?auto_520574 ) ( ON ?auto_520576 ?auto_520575 ) ( ON ?auto_520577 ?auto_520576 ) ( ON ?auto_520578 ?auto_520577 ) ( ON ?auto_520579 ?auto_520578 ) ( not ( = ?auto_520568 ?auto_520569 ) ) ( not ( = ?auto_520568 ?auto_520570 ) ) ( not ( = ?auto_520568 ?auto_520571 ) ) ( not ( = ?auto_520568 ?auto_520572 ) ) ( not ( = ?auto_520568 ?auto_520573 ) ) ( not ( = ?auto_520568 ?auto_520574 ) ) ( not ( = ?auto_520568 ?auto_520575 ) ) ( not ( = ?auto_520568 ?auto_520576 ) ) ( not ( = ?auto_520568 ?auto_520577 ) ) ( not ( = ?auto_520568 ?auto_520578 ) ) ( not ( = ?auto_520568 ?auto_520579 ) ) ( not ( = ?auto_520568 ?auto_520580 ) ) ( not ( = ?auto_520568 ?auto_520581 ) ) ( not ( = ?auto_520568 ?auto_520582 ) ) ( not ( = ?auto_520568 ?auto_520583 ) ) ( not ( = ?auto_520569 ?auto_520570 ) ) ( not ( = ?auto_520569 ?auto_520571 ) ) ( not ( = ?auto_520569 ?auto_520572 ) ) ( not ( = ?auto_520569 ?auto_520573 ) ) ( not ( = ?auto_520569 ?auto_520574 ) ) ( not ( = ?auto_520569 ?auto_520575 ) ) ( not ( = ?auto_520569 ?auto_520576 ) ) ( not ( = ?auto_520569 ?auto_520577 ) ) ( not ( = ?auto_520569 ?auto_520578 ) ) ( not ( = ?auto_520569 ?auto_520579 ) ) ( not ( = ?auto_520569 ?auto_520580 ) ) ( not ( = ?auto_520569 ?auto_520581 ) ) ( not ( = ?auto_520569 ?auto_520582 ) ) ( not ( = ?auto_520569 ?auto_520583 ) ) ( not ( = ?auto_520570 ?auto_520571 ) ) ( not ( = ?auto_520570 ?auto_520572 ) ) ( not ( = ?auto_520570 ?auto_520573 ) ) ( not ( = ?auto_520570 ?auto_520574 ) ) ( not ( = ?auto_520570 ?auto_520575 ) ) ( not ( = ?auto_520570 ?auto_520576 ) ) ( not ( = ?auto_520570 ?auto_520577 ) ) ( not ( = ?auto_520570 ?auto_520578 ) ) ( not ( = ?auto_520570 ?auto_520579 ) ) ( not ( = ?auto_520570 ?auto_520580 ) ) ( not ( = ?auto_520570 ?auto_520581 ) ) ( not ( = ?auto_520570 ?auto_520582 ) ) ( not ( = ?auto_520570 ?auto_520583 ) ) ( not ( = ?auto_520571 ?auto_520572 ) ) ( not ( = ?auto_520571 ?auto_520573 ) ) ( not ( = ?auto_520571 ?auto_520574 ) ) ( not ( = ?auto_520571 ?auto_520575 ) ) ( not ( = ?auto_520571 ?auto_520576 ) ) ( not ( = ?auto_520571 ?auto_520577 ) ) ( not ( = ?auto_520571 ?auto_520578 ) ) ( not ( = ?auto_520571 ?auto_520579 ) ) ( not ( = ?auto_520571 ?auto_520580 ) ) ( not ( = ?auto_520571 ?auto_520581 ) ) ( not ( = ?auto_520571 ?auto_520582 ) ) ( not ( = ?auto_520571 ?auto_520583 ) ) ( not ( = ?auto_520572 ?auto_520573 ) ) ( not ( = ?auto_520572 ?auto_520574 ) ) ( not ( = ?auto_520572 ?auto_520575 ) ) ( not ( = ?auto_520572 ?auto_520576 ) ) ( not ( = ?auto_520572 ?auto_520577 ) ) ( not ( = ?auto_520572 ?auto_520578 ) ) ( not ( = ?auto_520572 ?auto_520579 ) ) ( not ( = ?auto_520572 ?auto_520580 ) ) ( not ( = ?auto_520572 ?auto_520581 ) ) ( not ( = ?auto_520572 ?auto_520582 ) ) ( not ( = ?auto_520572 ?auto_520583 ) ) ( not ( = ?auto_520573 ?auto_520574 ) ) ( not ( = ?auto_520573 ?auto_520575 ) ) ( not ( = ?auto_520573 ?auto_520576 ) ) ( not ( = ?auto_520573 ?auto_520577 ) ) ( not ( = ?auto_520573 ?auto_520578 ) ) ( not ( = ?auto_520573 ?auto_520579 ) ) ( not ( = ?auto_520573 ?auto_520580 ) ) ( not ( = ?auto_520573 ?auto_520581 ) ) ( not ( = ?auto_520573 ?auto_520582 ) ) ( not ( = ?auto_520573 ?auto_520583 ) ) ( not ( = ?auto_520574 ?auto_520575 ) ) ( not ( = ?auto_520574 ?auto_520576 ) ) ( not ( = ?auto_520574 ?auto_520577 ) ) ( not ( = ?auto_520574 ?auto_520578 ) ) ( not ( = ?auto_520574 ?auto_520579 ) ) ( not ( = ?auto_520574 ?auto_520580 ) ) ( not ( = ?auto_520574 ?auto_520581 ) ) ( not ( = ?auto_520574 ?auto_520582 ) ) ( not ( = ?auto_520574 ?auto_520583 ) ) ( not ( = ?auto_520575 ?auto_520576 ) ) ( not ( = ?auto_520575 ?auto_520577 ) ) ( not ( = ?auto_520575 ?auto_520578 ) ) ( not ( = ?auto_520575 ?auto_520579 ) ) ( not ( = ?auto_520575 ?auto_520580 ) ) ( not ( = ?auto_520575 ?auto_520581 ) ) ( not ( = ?auto_520575 ?auto_520582 ) ) ( not ( = ?auto_520575 ?auto_520583 ) ) ( not ( = ?auto_520576 ?auto_520577 ) ) ( not ( = ?auto_520576 ?auto_520578 ) ) ( not ( = ?auto_520576 ?auto_520579 ) ) ( not ( = ?auto_520576 ?auto_520580 ) ) ( not ( = ?auto_520576 ?auto_520581 ) ) ( not ( = ?auto_520576 ?auto_520582 ) ) ( not ( = ?auto_520576 ?auto_520583 ) ) ( not ( = ?auto_520577 ?auto_520578 ) ) ( not ( = ?auto_520577 ?auto_520579 ) ) ( not ( = ?auto_520577 ?auto_520580 ) ) ( not ( = ?auto_520577 ?auto_520581 ) ) ( not ( = ?auto_520577 ?auto_520582 ) ) ( not ( = ?auto_520577 ?auto_520583 ) ) ( not ( = ?auto_520578 ?auto_520579 ) ) ( not ( = ?auto_520578 ?auto_520580 ) ) ( not ( = ?auto_520578 ?auto_520581 ) ) ( not ( = ?auto_520578 ?auto_520582 ) ) ( not ( = ?auto_520578 ?auto_520583 ) ) ( not ( = ?auto_520579 ?auto_520580 ) ) ( not ( = ?auto_520579 ?auto_520581 ) ) ( not ( = ?auto_520579 ?auto_520582 ) ) ( not ( = ?auto_520579 ?auto_520583 ) ) ( not ( = ?auto_520580 ?auto_520581 ) ) ( not ( = ?auto_520580 ?auto_520582 ) ) ( not ( = ?auto_520580 ?auto_520583 ) ) ( not ( = ?auto_520581 ?auto_520582 ) ) ( not ( = ?auto_520581 ?auto_520583 ) ) ( not ( = ?auto_520582 ?auto_520583 ) ) ( ON ?auto_520582 ?auto_520583 ) ( ON ?auto_520581 ?auto_520582 ) ( CLEAR ?auto_520579 ) ( ON ?auto_520580 ?auto_520581 ) ( CLEAR ?auto_520580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_520568 ?auto_520569 ?auto_520570 ?auto_520571 ?auto_520572 ?auto_520573 ?auto_520574 ?auto_520575 ?auto_520576 ?auto_520577 ?auto_520578 ?auto_520579 ?auto_520580 )
      ( MAKE-16PILE ?auto_520568 ?auto_520569 ?auto_520570 ?auto_520571 ?auto_520572 ?auto_520573 ?auto_520574 ?auto_520575 ?auto_520576 ?auto_520577 ?auto_520578 ?auto_520579 ?auto_520580 ?auto_520581 ?auto_520582 ?auto_520583 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520600 - BLOCK
      ?auto_520601 - BLOCK
      ?auto_520602 - BLOCK
      ?auto_520603 - BLOCK
      ?auto_520604 - BLOCK
      ?auto_520605 - BLOCK
      ?auto_520606 - BLOCK
      ?auto_520607 - BLOCK
      ?auto_520608 - BLOCK
      ?auto_520609 - BLOCK
      ?auto_520610 - BLOCK
      ?auto_520611 - BLOCK
      ?auto_520612 - BLOCK
      ?auto_520613 - BLOCK
      ?auto_520614 - BLOCK
      ?auto_520615 - BLOCK
    )
    :vars
    (
      ?auto_520616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520615 ?auto_520616 ) ( ON-TABLE ?auto_520600 ) ( ON ?auto_520601 ?auto_520600 ) ( ON ?auto_520602 ?auto_520601 ) ( ON ?auto_520603 ?auto_520602 ) ( ON ?auto_520604 ?auto_520603 ) ( ON ?auto_520605 ?auto_520604 ) ( ON ?auto_520606 ?auto_520605 ) ( ON ?auto_520607 ?auto_520606 ) ( ON ?auto_520608 ?auto_520607 ) ( ON ?auto_520609 ?auto_520608 ) ( ON ?auto_520610 ?auto_520609 ) ( not ( = ?auto_520600 ?auto_520601 ) ) ( not ( = ?auto_520600 ?auto_520602 ) ) ( not ( = ?auto_520600 ?auto_520603 ) ) ( not ( = ?auto_520600 ?auto_520604 ) ) ( not ( = ?auto_520600 ?auto_520605 ) ) ( not ( = ?auto_520600 ?auto_520606 ) ) ( not ( = ?auto_520600 ?auto_520607 ) ) ( not ( = ?auto_520600 ?auto_520608 ) ) ( not ( = ?auto_520600 ?auto_520609 ) ) ( not ( = ?auto_520600 ?auto_520610 ) ) ( not ( = ?auto_520600 ?auto_520611 ) ) ( not ( = ?auto_520600 ?auto_520612 ) ) ( not ( = ?auto_520600 ?auto_520613 ) ) ( not ( = ?auto_520600 ?auto_520614 ) ) ( not ( = ?auto_520600 ?auto_520615 ) ) ( not ( = ?auto_520600 ?auto_520616 ) ) ( not ( = ?auto_520601 ?auto_520602 ) ) ( not ( = ?auto_520601 ?auto_520603 ) ) ( not ( = ?auto_520601 ?auto_520604 ) ) ( not ( = ?auto_520601 ?auto_520605 ) ) ( not ( = ?auto_520601 ?auto_520606 ) ) ( not ( = ?auto_520601 ?auto_520607 ) ) ( not ( = ?auto_520601 ?auto_520608 ) ) ( not ( = ?auto_520601 ?auto_520609 ) ) ( not ( = ?auto_520601 ?auto_520610 ) ) ( not ( = ?auto_520601 ?auto_520611 ) ) ( not ( = ?auto_520601 ?auto_520612 ) ) ( not ( = ?auto_520601 ?auto_520613 ) ) ( not ( = ?auto_520601 ?auto_520614 ) ) ( not ( = ?auto_520601 ?auto_520615 ) ) ( not ( = ?auto_520601 ?auto_520616 ) ) ( not ( = ?auto_520602 ?auto_520603 ) ) ( not ( = ?auto_520602 ?auto_520604 ) ) ( not ( = ?auto_520602 ?auto_520605 ) ) ( not ( = ?auto_520602 ?auto_520606 ) ) ( not ( = ?auto_520602 ?auto_520607 ) ) ( not ( = ?auto_520602 ?auto_520608 ) ) ( not ( = ?auto_520602 ?auto_520609 ) ) ( not ( = ?auto_520602 ?auto_520610 ) ) ( not ( = ?auto_520602 ?auto_520611 ) ) ( not ( = ?auto_520602 ?auto_520612 ) ) ( not ( = ?auto_520602 ?auto_520613 ) ) ( not ( = ?auto_520602 ?auto_520614 ) ) ( not ( = ?auto_520602 ?auto_520615 ) ) ( not ( = ?auto_520602 ?auto_520616 ) ) ( not ( = ?auto_520603 ?auto_520604 ) ) ( not ( = ?auto_520603 ?auto_520605 ) ) ( not ( = ?auto_520603 ?auto_520606 ) ) ( not ( = ?auto_520603 ?auto_520607 ) ) ( not ( = ?auto_520603 ?auto_520608 ) ) ( not ( = ?auto_520603 ?auto_520609 ) ) ( not ( = ?auto_520603 ?auto_520610 ) ) ( not ( = ?auto_520603 ?auto_520611 ) ) ( not ( = ?auto_520603 ?auto_520612 ) ) ( not ( = ?auto_520603 ?auto_520613 ) ) ( not ( = ?auto_520603 ?auto_520614 ) ) ( not ( = ?auto_520603 ?auto_520615 ) ) ( not ( = ?auto_520603 ?auto_520616 ) ) ( not ( = ?auto_520604 ?auto_520605 ) ) ( not ( = ?auto_520604 ?auto_520606 ) ) ( not ( = ?auto_520604 ?auto_520607 ) ) ( not ( = ?auto_520604 ?auto_520608 ) ) ( not ( = ?auto_520604 ?auto_520609 ) ) ( not ( = ?auto_520604 ?auto_520610 ) ) ( not ( = ?auto_520604 ?auto_520611 ) ) ( not ( = ?auto_520604 ?auto_520612 ) ) ( not ( = ?auto_520604 ?auto_520613 ) ) ( not ( = ?auto_520604 ?auto_520614 ) ) ( not ( = ?auto_520604 ?auto_520615 ) ) ( not ( = ?auto_520604 ?auto_520616 ) ) ( not ( = ?auto_520605 ?auto_520606 ) ) ( not ( = ?auto_520605 ?auto_520607 ) ) ( not ( = ?auto_520605 ?auto_520608 ) ) ( not ( = ?auto_520605 ?auto_520609 ) ) ( not ( = ?auto_520605 ?auto_520610 ) ) ( not ( = ?auto_520605 ?auto_520611 ) ) ( not ( = ?auto_520605 ?auto_520612 ) ) ( not ( = ?auto_520605 ?auto_520613 ) ) ( not ( = ?auto_520605 ?auto_520614 ) ) ( not ( = ?auto_520605 ?auto_520615 ) ) ( not ( = ?auto_520605 ?auto_520616 ) ) ( not ( = ?auto_520606 ?auto_520607 ) ) ( not ( = ?auto_520606 ?auto_520608 ) ) ( not ( = ?auto_520606 ?auto_520609 ) ) ( not ( = ?auto_520606 ?auto_520610 ) ) ( not ( = ?auto_520606 ?auto_520611 ) ) ( not ( = ?auto_520606 ?auto_520612 ) ) ( not ( = ?auto_520606 ?auto_520613 ) ) ( not ( = ?auto_520606 ?auto_520614 ) ) ( not ( = ?auto_520606 ?auto_520615 ) ) ( not ( = ?auto_520606 ?auto_520616 ) ) ( not ( = ?auto_520607 ?auto_520608 ) ) ( not ( = ?auto_520607 ?auto_520609 ) ) ( not ( = ?auto_520607 ?auto_520610 ) ) ( not ( = ?auto_520607 ?auto_520611 ) ) ( not ( = ?auto_520607 ?auto_520612 ) ) ( not ( = ?auto_520607 ?auto_520613 ) ) ( not ( = ?auto_520607 ?auto_520614 ) ) ( not ( = ?auto_520607 ?auto_520615 ) ) ( not ( = ?auto_520607 ?auto_520616 ) ) ( not ( = ?auto_520608 ?auto_520609 ) ) ( not ( = ?auto_520608 ?auto_520610 ) ) ( not ( = ?auto_520608 ?auto_520611 ) ) ( not ( = ?auto_520608 ?auto_520612 ) ) ( not ( = ?auto_520608 ?auto_520613 ) ) ( not ( = ?auto_520608 ?auto_520614 ) ) ( not ( = ?auto_520608 ?auto_520615 ) ) ( not ( = ?auto_520608 ?auto_520616 ) ) ( not ( = ?auto_520609 ?auto_520610 ) ) ( not ( = ?auto_520609 ?auto_520611 ) ) ( not ( = ?auto_520609 ?auto_520612 ) ) ( not ( = ?auto_520609 ?auto_520613 ) ) ( not ( = ?auto_520609 ?auto_520614 ) ) ( not ( = ?auto_520609 ?auto_520615 ) ) ( not ( = ?auto_520609 ?auto_520616 ) ) ( not ( = ?auto_520610 ?auto_520611 ) ) ( not ( = ?auto_520610 ?auto_520612 ) ) ( not ( = ?auto_520610 ?auto_520613 ) ) ( not ( = ?auto_520610 ?auto_520614 ) ) ( not ( = ?auto_520610 ?auto_520615 ) ) ( not ( = ?auto_520610 ?auto_520616 ) ) ( not ( = ?auto_520611 ?auto_520612 ) ) ( not ( = ?auto_520611 ?auto_520613 ) ) ( not ( = ?auto_520611 ?auto_520614 ) ) ( not ( = ?auto_520611 ?auto_520615 ) ) ( not ( = ?auto_520611 ?auto_520616 ) ) ( not ( = ?auto_520612 ?auto_520613 ) ) ( not ( = ?auto_520612 ?auto_520614 ) ) ( not ( = ?auto_520612 ?auto_520615 ) ) ( not ( = ?auto_520612 ?auto_520616 ) ) ( not ( = ?auto_520613 ?auto_520614 ) ) ( not ( = ?auto_520613 ?auto_520615 ) ) ( not ( = ?auto_520613 ?auto_520616 ) ) ( not ( = ?auto_520614 ?auto_520615 ) ) ( not ( = ?auto_520614 ?auto_520616 ) ) ( not ( = ?auto_520615 ?auto_520616 ) ) ( ON ?auto_520614 ?auto_520615 ) ( ON ?auto_520613 ?auto_520614 ) ( ON ?auto_520612 ?auto_520613 ) ( CLEAR ?auto_520610 ) ( ON ?auto_520611 ?auto_520612 ) ( CLEAR ?auto_520611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_520600 ?auto_520601 ?auto_520602 ?auto_520603 ?auto_520604 ?auto_520605 ?auto_520606 ?auto_520607 ?auto_520608 ?auto_520609 ?auto_520610 ?auto_520611 )
      ( MAKE-16PILE ?auto_520600 ?auto_520601 ?auto_520602 ?auto_520603 ?auto_520604 ?auto_520605 ?auto_520606 ?auto_520607 ?auto_520608 ?auto_520609 ?auto_520610 ?auto_520611 ?auto_520612 ?auto_520613 ?auto_520614 ?auto_520615 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520633 - BLOCK
      ?auto_520634 - BLOCK
      ?auto_520635 - BLOCK
      ?auto_520636 - BLOCK
      ?auto_520637 - BLOCK
      ?auto_520638 - BLOCK
      ?auto_520639 - BLOCK
      ?auto_520640 - BLOCK
      ?auto_520641 - BLOCK
      ?auto_520642 - BLOCK
      ?auto_520643 - BLOCK
      ?auto_520644 - BLOCK
      ?auto_520645 - BLOCK
      ?auto_520646 - BLOCK
      ?auto_520647 - BLOCK
      ?auto_520648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520648 ) ( ON-TABLE ?auto_520633 ) ( ON ?auto_520634 ?auto_520633 ) ( ON ?auto_520635 ?auto_520634 ) ( ON ?auto_520636 ?auto_520635 ) ( ON ?auto_520637 ?auto_520636 ) ( ON ?auto_520638 ?auto_520637 ) ( ON ?auto_520639 ?auto_520638 ) ( ON ?auto_520640 ?auto_520639 ) ( ON ?auto_520641 ?auto_520640 ) ( ON ?auto_520642 ?auto_520641 ) ( ON ?auto_520643 ?auto_520642 ) ( not ( = ?auto_520633 ?auto_520634 ) ) ( not ( = ?auto_520633 ?auto_520635 ) ) ( not ( = ?auto_520633 ?auto_520636 ) ) ( not ( = ?auto_520633 ?auto_520637 ) ) ( not ( = ?auto_520633 ?auto_520638 ) ) ( not ( = ?auto_520633 ?auto_520639 ) ) ( not ( = ?auto_520633 ?auto_520640 ) ) ( not ( = ?auto_520633 ?auto_520641 ) ) ( not ( = ?auto_520633 ?auto_520642 ) ) ( not ( = ?auto_520633 ?auto_520643 ) ) ( not ( = ?auto_520633 ?auto_520644 ) ) ( not ( = ?auto_520633 ?auto_520645 ) ) ( not ( = ?auto_520633 ?auto_520646 ) ) ( not ( = ?auto_520633 ?auto_520647 ) ) ( not ( = ?auto_520633 ?auto_520648 ) ) ( not ( = ?auto_520634 ?auto_520635 ) ) ( not ( = ?auto_520634 ?auto_520636 ) ) ( not ( = ?auto_520634 ?auto_520637 ) ) ( not ( = ?auto_520634 ?auto_520638 ) ) ( not ( = ?auto_520634 ?auto_520639 ) ) ( not ( = ?auto_520634 ?auto_520640 ) ) ( not ( = ?auto_520634 ?auto_520641 ) ) ( not ( = ?auto_520634 ?auto_520642 ) ) ( not ( = ?auto_520634 ?auto_520643 ) ) ( not ( = ?auto_520634 ?auto_520644 ) ) ( not ( = ?auto_520634 ?auto_520645 ) ) ( not ( = ?auto_520634 ?auto_520646 ) ) ( not ( = ?auto_520634 ?auto_520647 ) ) ( not ( = ?auto_520634 ?auto_520648 ) ) ( not ( = ?auto_520635 ?auto_520636 ) ) ( not ( = ?auto_520635 ?auto_520637 ) ) ( not ( = ?auto_520635 ?auto_520638 ) ) ( not ( = ?auto_520635 ?auto_520639 ) ) ( not ( = ?auto_520635 ?auto_520640 ) ) ( not ( = ?auto_520635 ?auto_520641 ) ) ( not ( = ?auto_520635 ?auto_520642 ) ) ( not ( = ?auto_520635 ?auto_520643 ) ) ( not ( = ?auto_520635 ?auto_520644 ) ) ( not ( = ?auto_520635 ?auto_520645 ) ) ( not ( = ?auto_520635 ?auto_520646 ) ) ( not ( = ?auto_520635 ?auto_520647 ) ) ( not ( = ?auto_520635 ?auto_520648 ) ) ( not ( = ?auto_520636 ?auto_520637 ) ) ( not ( = ?auto_520636 ?auto_520638 ) ) ( not ( = ?auto_520636 ?auto_520639 ) ) ( not ( = ?auto_520636 ?auto_520640 ) ) ( not ( = ?auto_520636 ?auto_520641 ) ) ( not ( = ?auto_520636 ?auto_520642 ) ) ( not ( = ?auto_520636 ?auto_520643 ) ) ( not ( = ?auto_520636 ?auto_520644 ) ) ( not ( = ?auto_520636 ?auto_520645 ) ) ( not ( = ?auto_520636 ?auto_520646 ) ) ( not ( = ?auto_520636 ?auto_520647 ) ) ( not ( = ?auto_520636 ?auto_520648 ) ) ( not ( = ?auto_520637 ?auto_520638 ) ) ( not ( = ?auto_520637 ?auto_520639 ) ) ( not ( = ?auto_520637 ?auto_520640 ) ) ( not ( = ?auto_520637 ?auto_520641 ) ) ( not ( = ?auto_520637 ?auto_520642 ) ) ( not ( = ?auto_520637 ?auto_520643 ) ) ( not ( = ?auto_520637 ?auto_520644 ) ) ( not ( = ?auto_520637 ?auto_520645 ) ) ( not ( = ?auto_520637 ?auto_520646 ) ) ( not ( = ?auto_520637 ?auto_520647 ) ) ( not ( = ?auto_520637 ?auto_520648 ) ) ( not ( = ?auto_520638 ?auto_520639 ) ) ( not ( = ?auto_520638 ?auto_520640 ) ) ( not ( = ?auto_520638 ?auto_520641 ) ) ( not ( = ?auto_520638 ?auto_520642 ) ) ( not ( = ?auto_520638 ?auto_520643 ) ) ( not ( = ?auto_520638 ?auto_520644 ) ) ( not ( = ?auto_520638 ?auto_520645 ) ) ( not ( = ?auto_520638 ?auto_520646 ) ) ( not ( = ?auto_520638 ?auto_520647 ) ) ( not ( = ?auto_520638 ?auto_520648 ) ) ( not ( = ?auto_520639 ?auto_520640 ) ) ( not ( = ?auto_520639 ?auto_520641 ) ) ( not ( = ?auto_520639 ?auto_520642 ) ) ( not ( = ?auto_520639 ?auto_520643 ) ) ( not ( = ?auto_520639 ?auto_520644 ) ) ( not ( = ?auto_520639 ?auto_520645 ) ) ( not ( = ?auto_520639 ?auto_520646 ) ) ( not ( = ?auto_520639 ?auto_520647 ) ) ( not ( = ?auto_520639 ?auto_520648 ) ) ( not ( = ?auto_520640 ?auto_520641 ) ) ( not ( = ?auto_520640 ?auto_520642 ) ) ( not ( = ?auto_520640 ?auto_520643 ) ) ( not ( = ?auto_520640 ?auto_520644 ) ) ( not ( = ?auto_520640 ?auto_520645 ) ) ( not ( = ?auto_520640 ?auto_520646 ) ) ( not ( = ?auto_520640 ?auto_520647 ) ) ( not ( = ?auto_520640 ?auto_520648 ) ) ( not ( = ?auto_520641 ?auto_520642 ) ) ( not ( = ?auto_520641 ?auto_520643 ) ) ( not ( = ?auto_520641 ?auto_520644 ) ) ( not ( = ?auto_520641 ?auto_520645 ) ) ( not ( = ?auto_520641 ?auto_520646 ) ) ( not ( = ?auto_520641 ?auto_520647 ) ) ( not ( = ?auto_520641 ?auto_520648 ) ) ( not ( = ?auto_520642 ?auto_520643 ) ) ( not ( = ?auto_520642 ?auto_520644 ) ) ( not ( = ?auto_520642 ?auto_520645 ) ) ( not ( = ?auto_520642 ?auto_520646 ) ) ( not ( = ?auto_520642 ?auto_520647 ) ) ( not ( = ?auto_520642 ?auto_520648 ) ) ( not ( = ?auto_520643 ?auto_520644 ) ) ( not ( = ?auto_520643 ?auto_520645 ) ) ( not ( = ?auto_520643 ?auto_520646 ) ) ( not ( = ?auto_520643 ?auto_520647 ) ) ( not ( = ?auto_520643 ?auto_520648 ) ) ( not ( = ?auto_520644 ?auto_520645 ) ) ( not ( = ?auto_520644 ?auto_520646 ) ) ( not ( = ?auto_520644 ?auto_520647 ) ) ( not ( = ?auto_520644 ?auto_520648 ) ) ( not ( = ?auto_520645 ?auto_520646 ) ) ( not ( = ?auto_520645 ?auto_520647 ) ) ( not ( = ?auto_520645 ?auto_520648 ) ) ( not ( = ?auto_520646 ?auto_520647 ) ) ( not ( = ?auto_520646 ?auto_520648 ) ) ( not ( = ?auto_520647 ?auto_520648 ) ) ( ON ?auto_520647 ?auto_520648 ) ( ON ?auto_520646 ?auto_520647 ) ( ON ?auto_520645 ?auto_520646 ) ( CLEAR ?auto_520643 ) ( ON ?auto_520644 ?auto_520645 ) ( CLEAR ?auto_520644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_520633 ?auto_520634 ?auto_520635 ?auto_520636 ?auto_520637 ?auto_520638 ?auto_520639 ?auto_520640 ?auto_520641 ?auto_520642 ?auto_520643 ?auto_520644 )
      ( MAKE-16PILE ?auto_520633 ?auto_520634 ?auto_520635 ?auto_520636 ?auto_520637 ?auto_520638 ?auto_520639 ?auto_520640 ?auto_520641 ?auto_520642 ?auto_520643 ?auto_520644 ?auto_520645 ?auto_520646 ?auto_520647 ?auto_520648 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520665 - BLOCK
      ?auto_520666 - BLOCK
      ?auto_520667 - BLOCK
      ?auto_520668 - BLOCK
      ?auto_520669 - BLOCK
      ?auto_520670 - BLOCK
      ?auto_520671 - BLOCK
      ?auto_520672 - BLOCK
      ?auto_520673 - BLOCK
      ?auto_520674 - BLOCK
      ?auto_520675 - BLOCK
      ?auto_520676 - BLOCK
      ?auto_520677 - BLOCK
      ?auto_520678 - BLOCK
      ?auto_520679 - BLOCK
      ?auto_520680 - BLOCK
    )
    :vars
    (
      ?auto_520681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520680 ?auto_520681 ) ( ON-TABLE ?auto_520665 ) ( ON ?auto_520666 ?auto_520665 ) ( ON ?auto_520667 ?auto_520666 ) ( ON ?auto_520668 ?auto_520667 ) ( ON ?auto_520669 ?auto_520668 ) ( ON ?auto_520670 ?auto_520669 ) ( ON ?auto_520671 ?auto_520670 ) ( ON ?auto_520672 ?auto_520671 ) ( ON ?auto_520673 ?auto_520672 ) ( ON ?auto_520674 ?auto_520673 ) ( not ( = ?auto_520665 ?auto_520666 ) ) ( not ( = ?auto_520665 ?auto_520667 ) ) ( not ( = ?auto_520665 ?auto_520668 ) ) ( not ( = ?auto_520665 ?auto_520669 ) ) ( not ( = ?auto_520665 ?auto_520670 ) ) ( not ( = ?auto_520665 ?auto_520671 ) ) ( not ( = ?auto_520665 ?auto_520672 ) ) ( not ( = ?auto_520665 ?auto_520673 ) ) ( not ( = ?auto_520665 ?auto_520674 ) ) ( not ( = ?auto_520665 ?auto_520675 ) ) ( not ( = ?auto_520665 ?auto_520676 ) ) ( not ( = ?auto_520665 ?auto_520677 ) ) ( not ( = ?auto_520665 ?auto_520678 ) ) ( not ( = ?auto_520665 ?auto_520679 ) ) ( not ( = ?auto_520665 ?auto_520680 ) ) ( not ( = ?auto_520665 ?auto_520681 ) ) ( not ( = ?auto_520666 ?auto_520667 ) ) ( not ( = ?auto_520666 ?auto_520668 ) ) ( not ( = ?auto_520666 ?auto_520669 ) ) ( not ( = ?auto_520666 ?auto_520670 ) ) ( not ( = ?auto_520666 ?auto_520671 ) ) ( not ( = ?auto_520666 ?auto_520672 ) ) ( not ( = ?auto_520666 ?auto_520673 ) ) ( not ( = ?auto_520666 ?auto_520674 ) ) ( not ( = ?auto_520666 ?auto_520675 ) ) ( not ( = ?auto_520666 ?auto_520676 ) ) ( not ( = ?auto_520666 ?auto_520677 ) ) ( not ( = ?auto_520666 ?auto_520678 ) ) ( not ( = ?auto_520666 ?auto_520679 ) ) ( not ( = ?auto_520666 ?auto_520680 ) ) ( not ( = ?auto_520666 ?auto_520681 ) ) ( not ( = ?auto_520667 ?auto_520668 ) ) ( not ( = ?auto_520667 ?auto_520669 ) ) ( not ( = ?auto_520667 ?auto_520670 ) ) ( not ( = ?auto_520667 ?auto_520671 ) ) ( not ( = ?auto_520667 ?auto_520672 ) ) ( not ( = ?auto_520667 ?auto_520673 ) ) ( not ( = ?auto_520667 ?auto_520674 ) ) ( not ( = ?auto_520667 ?auto_520675 ) ) ( not ( = ?auto_520667 ?auto_520676 ) ) ( not ( = ?auto_520667 ?auto_520677 ) ) ( not ( = ?auto_520667 ?auto_520678 ) ) ( not ( = ?auto_520667 ?auto_520679 ) ) ( not ( = ?auto_520667 ?auto_520680 ) ) ( not ( = ?auto_520667 ?auto_520681 ) ) ( not ( = ?auto_520668 ?auto_520669 ) ) ( not ( = ?auto_520668 ?auto_520670 ) ) ( not ( = ?auto_520668 ?auto_520671 ) ) ( not ( = ?auto_520668 ?auto_520672 ) ) ( not ( = ?auto_520668 ?auto_520673 ) ) ( not ( = ?auto_520668 ?auto_520674 ) ) ( not ( = ?auto_520668 ?auto_520675 ) ) ( not ( = ?auto_520668 ?auto_520676 ) ) ( not ( = ?auto_520668 ?auto_520677 ) ) ( not ( = ?auto_520668 ?auto_520678 ) ) ( not ( = ?auto_520668 ?auto_520679 ) ) ( not ( = ?auto_520668 ?auto_520680 ) ) ( not ( = ?auto_520668 ?auto_520681 ) ) ( not ( = ?auto_520669 ?auto_520670 ) ) ( not ( = ?auto_520669 ?auto_520671 ) ) ( not ( = ?auto_520669 ?auto_520672 ) ) ( not ( = ?auto_520669 ?auto_520673 ) ) ( not ( = ?auto_520669 ?auto_520674 ) ) ( not ( = ?auto_520669 ?auto_520675 ) ) ( not ( = ?auto_520669 ?auto_520676 ) ) ( not ( = ?auto_520669 ?auto_520677 ) ) ( not ( = ?auto_520669 ?auto_520678 ) ) ( not ( = ?auto_520669 ?auto_520679 ) ) ( not ( = ?auto_520669 ?auto_520680 ) ) ( not ( = ?auto_520669 ?auto_520681 ) ) ( not ( = ?auto_520670 ?auto_520671 ) ) ( not ( = ?auto_520670 ?auto_520672 ) ) ( not ( = ?auto_520670 ?auto_520673 ) ) ( not ( = ?auto_520670 ?auto_520674 ) ) ( not ( = ?auto_520670 ?auto_520675 ) ) ( not ( = ?auto_520670 ?auto_520676 ) ) ( not ( = ?auto_520670 ?auto_520677 ) ) ( not ( = ?auto_520670 ?auto_520678 ) ) ( not ( = ?auto_520670 ?auto_520679 ) ) ( not ( = ?auto_520670 ?auto_520680 ) ) ( not ( = ?auto_520670 ?auto_520681 ) ) ( not ( = ?auto_520671 ?auto_520672 ) ) ( not ( = ?auto_520671 ?auto_520673 ) ) ( not ( = ?auto_520671 ?auto_520674 ) ) ( not ( = ?auto_520671 ?auto_520675 ) ) ( not ( = ?auto_520671 ?auto_520676 ) ) ( not ( = ?auto_520671 ?auto_520677 ) ) ( not ( = ?auto_520671 ?auto_520678 ) ) ( not ( = ?auto_520671 ?auto_520679 ) ) ( not ( = ?auto_520671 ?auto_520680 ) ) ( not ( = ?auto_520671 ?auto_520681 ) ) ( not ( = ?auto_520672 ?auto_520673 ) ) ( not ( = ?auto_520672 ?auto_520674 ) ) ( not ( = ?auto_520672 ?auto_520675 ) ) ( not ( = ?auto_520672 ?auto_520676 ) ) ( not ( = ?auto_520672 ?auto_520677 ) ) ( not ( = ?auto_520672 ?auto_520678 ) ) ( not ( = ?auto_520672 ?auto_520679 ) ) ( not ( = ?auto_520672 ?auto_520680 ) ) ( not ( = ?auto_520672 ?auto_520681 ) ) ( not ( = ?auto_520673 ?auto_520674 ) ) ( not ( = ?auto_520673 ?auto_520675 ) ) ( not ( = ?auto_520673 ?auto_520676 ) ) ( not ( = ?auto_520673 ?auto_520677 ) ) ( not ( = ?auto_520673 ?auto_520678 ) ) ( not ( = ?auto_520673 ?auto_520679 ) ) ( not ( = ?auto_520673 ?auto_520680 ) ) ( not ( = ?auto_520673 ?auto_520681 ) ) ( not ( = ?auto_520674 ?auto_520675 ) ) ( not ( = ?auto_520674 ?auto_520676 ) ) ( not ( = ?auto_520674 ?auto_520677 ) ) ( not ( = ?auto_520674 ?auto_520678 ) ) ( not ( = ?auto_520674 ?auto_520679 ) ) ( not ( = ?auto_520674 ?auto_520680 ) ) ( not ( = ?auto_520674 ?auto_520681 ) ) ( not ( = ?auto_520675 ?auto_520676 ) ) ( not ( = ?auto_520675 ?auto_520677 ) ) ( not ( = ?auto_520675 ?auto_520678 ) ) ( not ( = ?auto_520675 ?auto_520679 ) ) ( not ( = ?auto_520675 ?auto_520680 ) ) ( not ( = ?auto_520675 ?auto_520681 ) ) ( not ( = ?auto_520676 ?auto_520677 ) ) ( not ( = ?auto_520676 ?auto_520678 ) ) ( not ( = ?auto_520676 ?auto_520679 ) ) ( not ( = ?auto_520676 ?auto_520680 ) ) ( not ( = ?auto_520676 ?auto_520681 ) ) ( not ( = ?auto_520677 ?auto_520678 ) ) ( not ( = ?auto_520677 ?auto_520679 ) ) ( not ( = ?auto_520677 ?auto_520680 ) ) ( not ( = ?auto_520677 ?auto_520681 ) ) ( not ( = ?auto_520678 ?auto_520679 ) ) ( not ( = ?auto_520678 ?auto_520680 ) ) ( not ( = ?auto_520678 ?auto_520681 ) ) ( not ( = ?auto_520679 ?auto_520680 ) ) ( not ( = ?auto_520679 ?auto_520681 ) ) ( not ( = ?auto_520680 ?auto_520681 ) ) ( ON ?auto_520679 ?auto_520680 ) ( ON ?auto_520678 ?auto_520679 ) ( ON ?auto_520677 ?auto_520678 ) ( ON ?auto_520676 ?auto_520677 ) ( CLEAR ?auto_520674 ) ( ON ?auto_520675 ?auto_520676 ) ( CLEAR ?auto_520675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_520665 ?auto_520666 ?auto_520667 ?auto_520668 ?auto_520669 ?auto_520670 ?auto_520671 ?auto_520672 ?auto_520673 ?auto_520674 ?auto_520675 )
      ( MAKE-16PILE ?auto_520665 ?auto_520666 ?auto_520667 ?auto_520668 ?auto_520669 ?auto_520670 ?auto_520671 ?auto_520672 ?auto_520673 ?auto_520674 ?auto_520675 ?auto_520676 ?auto_520677 ?auto_520678 ?auto_520679 ?auto_520680 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520698 - BLOCK
      ?auto_520699 - BLOCK
      ?auto_520700 - BLOCK
      ?auto_520701 - BLOCK
      ?auto_520702 - BLOCK
      ?auto_520703 - BLOCK
      ?auto_520704 - BLOCK
      ?auto_520705 - BLOCK
      ?auto_520706 - BLOCK
      ?auto_520707 - BLOCK
      ?auto_520708 - BLOCK
      ?auto_520709 - BLOCK
      ?auto_520710 - BLOCK
      ?auto_520711 - BLOCK
      ?auto_520712 - BLOCK
      ?auto_520713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520713 ) ( ON-TABLE ?auto_520698 ) ( ON ?auto_520699 ?auto_520698 ) ( ON ?auto_520700 ?auto_520699 ) ( ON ?auto_520701 ?auto_520700 ) ( ON ?auto_520702 ?auto_520701 ) ( ON ?auto_520703 ?auto_520702 ) ( ON ?auto_520704 ?auto_520703 ) ( ON ?auto_520705 ?auto_520704 ) ( ON ?auto_520706 ?auto_520705 ) ( ON ?auto_520707 ?auto_520706 ) ( not ( = ?auto_520698 ?auto_520699 ) ) ( not ( = ?auto_520698 ?auto_520700 ) ) ( not ( = ?auto_520698 ?auto_520701 ) ) ( not ( = ?auto_520698 ?auto_520702 ) ) ( not ( = ?auto_520698 ?auto_520703 ) ) ( not ( = ?auto_520698 ?auto_520704 ) ) ( not ( = ?auto_520698 ?auto_520705 ) ) ( not ( = ?auto_520698 ?auto_520706 ) ) ( not ( = ?auto_520698 ?auto_520707 ) ) ( not ( = ?auto_520698 ?auto_520708 ) ) ( not ( = ?auto_520698 ?auto_520709 ) ) ( not ( = ?auto_520698 ?auto_520710 ) ) ( not ( = ?auto_520698 ?auto_520711 ) ) ( not ( = ?auto_520698 ?auto_520712 ) ) ( not ( = ?auto_520698 ?auto_520713 ) ) ( not ( = ?auto_520699 ?auto_520700 ) ) ( not ( = ?auto_520699 ?auto_520701 ) ) ( not ( = ?auto_520699 ?auto_520702 ) ) ( not ( = ?auto_520699 ?auto_520703 ) ) ( not ( = ?auto_520699 ?auto_520704 ) ) ( not ( = ?auto_520699 ?auto_520705 ) ) ( not ( = ?auto_520699 ?auto_520706 ) ) ( not ( = ?auto_520699 ?auto_520707 ) ) ( not ( = ?auto_520699 ?auto_520708 ) ) ( not ( = ?auto_520699 ?auto_520709 ) ) ( not ( = ?auto_520699 ?auto_520710 ) ) ( not ( = ?auto_520699 ?auto_520711 ) ) ( not ( = ?auto_520699 ?auto_520712 ) ) ( not ( = ?auto_520699 ?auto_520713 ) ) ( not ( = ?auto_520700 ?auto_520701 ) ) ( not ( = ?auto_520700 ?auto_520702 ) ) ( not ( = ?auto_520700 ?auto_520703 ) ) ( not ( = ?auto_520700 ?auto_520704 ) ) ( not ( = ?auto_520700 ?auto_520705 ) ) ( not ( = ?auto_520700 ?auto_520706 ) ) ( not ( = ?auto_520700 ?auto_520707 ) ) ( not ( = ?auto_520700 ?auto_520708 ) ) ( not ( = ?auto_520700 ?auto_520709 ) ) ( not ( = ?auto_520700 ?auto_520710 ) ) ( not ( = ?auto_520700 ?auto_520711 ) ) ( not ( = ?auto_520700 ?auto_520712 ) ) ( not ( = ?auto_520700 ?auto_520713 ) ) ( not ( = ?auto_520701 ?auto_520702 ) ) ( not ( = ?auto_520701 ?auto_520703 ) ) ( not ( = ?auto_520701 ?auto_520704 ) ) ( not ( = ?auto_520701 ?auto_520705 ) ) ( not ( = ?auto_520701 ?auto_520706 ) ) ( not ( = ?auto_520701 ?auto_520707 ) ) ( not ( = ?auto_520701 ?auto_520708 ) ) ( not ( = ?auto_520701 ?auto_520709 ) ) ( not ( = ?auto_520701 ?auto_520710 ) ) ( not ( = ?auto_520701 ?auto_520711 ) ) ( not ( = ?auto_520701 ?auto_520712 ) ) ( not ( = ?auto_520701 ?auto_520713 ) ) ( not ( = ?auto_520702 ?auto_520703 ) ) ( not ( = ?auto_520702 ?auto_520704 ) ) ( not ( = ?auto_520702 ?auto_520705 ) ) ( not ( = ?auto_520702 ?auto_520706 ) ) ( not ( = ?auto_520702 ?auto_520707 ) ) ( not ( = ?auto_520702 ?auto_520708 ) ) ( not ( = ?auto_520702 ?auto_520709 ) ) ( not ( = ?auto_520702 ?auto_520710 ) ) ( not ( = ?auto_520702 ?auto_520711 ) ) ( not ( = ?auto_520702 ?auto_520712 ) ) ( not ( = ?auto_520702 ?auto_520713 ) ) ( not ( = ?auto_520703 ?auto_520704 ) ) ( not ( = ?auto_520703 ?auto_520705 ) ) ( not ( = ?auto_520703 ?auto_520706 ) ) ( not ( = ?auto_520703 ?auto_520707 ) ) ( not ( = ?auto_520703 ?auto_520708 ) ) ( not ( = ?auto_520703 ?auto_520709 ) ) ( not ( = ?auto_520703 ?auto_520710 ) ) ( not ( = ?auto_520703 ?auto_520711 ) ) ( not ( = ?auto_520703 ?auto_520712 ) ) ( not ( = ?auto_520703 ?auto_520713 ) ) ( not ( = ?auto_520704 ?auto_520705 ) ) ( not ( = ?auto_520704 ?auto_520706 ) ) ( not ( = ?auto_520704 ?auto_520707 ) ) ( not ( = ?auto_520704 ?auto_520708 ) ) ( not ( = ?auto_520704 ?auto_520709 ) ) ( not ( = ?auto_520704 ?auto_520710 ) ) ( not ( = ?auto_520704 ?auto_520711 ) ) ( not ( = ?auto_520704 ?auto_520712 ) ) ( not ( = ?auto_520704 ?auto_520713 ) ) ( not ( = ?auto_520705 ?auto_520706 ) ) ( not ( = ?auto_520705 ?auto_520707 ) ) ( not ( = ?auto_520705 ?auto_520708 ) ) ( not ( = ?auto_520705 ?auto_520709 ) ) ( not ( = ?auto_520705 ?auto_520710 ) ) ( not ( = ?auto_520705 ?auto_520711 ) ) ( not ( = ?auto_520705 ?auto_520712 ) ) ( not ( = ?auto_520705 ?auto_520713 ) ) ( not ( = ?auto_520706 ?auto_520707 ) ) ( not ( = ?auto_520706 ?auto_520708 ) ) ( not ( = ?auto_520706 ?auto_520709 ) ) ( not ( = ?auto_520706 ?auto_520710 ) ) ( not ( = ?auto_520706 ?auto_520711 ) ) ( not ( = ?auto_520706 ?auto_520712 ) ) ( not ( = ?auto_520706 ?auto_520713 ) ) ( not ( = ?auto_520707 ?auto_520708 ) ) ( not ( = ?auto_520707 ?auto_520709 ) ) ( not ( = ?auto_520707 ?auto_520710 ) ) ( not ( = ?auto_520707 ?auto_520711 ) ) ( not ( = ?auto_520707 ?auto_520712 ) ) ( not ( = ?auto_520707 ?auto_520713 ) ) ( not ( = ?auto_520708 ?auto_520709 ) ) ( not ( = ?auto_520708 ?auto_520710 ) ) ( not ( = ?auto_520708 ?auto_520711 ) ) ( not ( = ?auto_520708 ?auto_520712 ) ) ( not ( = ?auto_520708 ?auto_520713 ) ) ( not ( = ?auto_520709 ?auto_520710 ) ) ( not ( = ?auto_520709 ?auto_520711 ) ) ( not ( = ?auto_520709 ?auto_520712 ) ) ( not ( = ?auto_520709 ?auto_520713 ) ) ( not ( = ?auto_520710 ?auto_520711 ) ) ( not ( = ?auto_520710 ?auto_520712 ) ) ( not ( = ?auto_520710 ?auto_520713 ) ) ( not ( = ?auto_520711 ?auto_520712 ) ) ( not ( = ?auto_520711 ?auto_520713 ) ) ( not ( = ?auto_520712 ?auto_520713 ) ) ( ON ?auto_520712 ?auto_520713 ) ( ON ?auto_520711 ?auto_520712 ) ( ON ?auto_520710 ?auto_520711 ) ( ON ?auto_520709 ?auto_520710 ) ( CLEAR ?auto_520707 ) ( ON ?auto_520708 ?auto_520709 ) ( CLEAR ?auto_520708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_520698 ?auto_520699 ?auto_520700 ?auto_520701 ?auto_520702 ?auto_520703 ?auto_520704 ?auto_520705 ?auto_520706 ?auto_520707 ?auto_520708 )
      ( MAKE-16PILE ?auto_520698 ?auto_520699 ?auto_520700 ?auto_520701 ?auto_520702 ?auto_520703 ?auto_520704 ?auto_520705 ?auto_520706 ?auto_520707 ?auto_520708 ?auto_520709 ?auto_520710 ?auto_520711 ?auto_520712 ?auto_520713 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520730 - BLOCK
      ?auto_520731 - BLOCK
      ?auto_520732 - BLOCK
      ?auto_520733 - BLOCK
      ?auto_520734 - BLOCK
      ?auto_520735 - BLOCK
      ?auto_520736 - BLOCK
      ?auto_520737 - BLOCK
      ?auto_520738 - BLOCK
      ?auto_520739 - BLOCK
      ?auto_520740 - BLOCK
      ?auto_520741 - BLOCK
      ?auto_520742 - BLOCK
      ?auto_520743 - BLOCK
      ?auto_520744 - BLOCK
      ?auto_520745 - BLOCK
    )
    :vars
    (
      ?auto_520746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520745 ?auto_520746 ) ( ON-TABLE ?auto_520730 ) ( ON ?auto_520731 ?auto_520730 ) ( ON ?auto_520732 ?auto_520731 ) ( ON ?auto_520733 ?auto_520732 ) ( ON ?auto_520734 ?auto_520733 ) ( ON ?auto_520735 ?auto_520734 ) ( ON ?auto_520736 ?auto_520735 ) ( ON ?auto_520737 ?auto_520736 ) ( ON ?auto_520738 ?auto_520737 ) ( not ( = ?auto_520730 ?auto_520731 ) ) ( not ( = ?auto_520730 ?auto_520732 ) ) ( not ( = ?auto_520730 ?auto_520733 ) ) ( not ( = ?auto_520730 ?auto_520734 ) ) ( not ( = ?auto_520730 ?auto_520735 ) ) ( not ( = ?auto_520730 ?auto_520736 ) ) ( not ( = ?auto_520730 ?auto_520737 ) ) ( not ( = ?auto_520730 ?auto_520738 ) ) ( not ( = ?auto_520730 ?auto_520739 ) ) ( not ( = ?auto_520730 ?auto_520740 ) ) ( not ( = ?auto_520730 ?auto_520741 ) ) ( not ( = ?auto_520730 ?auto_520742 ) ) ( not ( = ?auto_520730 ?auto_520743 ) ) ( not ( = ?auto_520730 ?auto_520744 ) ) ( not ( = ?auto_520730 ?auto_520745 ) ) ( not ( = ?auto_520730 ?auto_520746 ) ) ( not ( = ?auto_520731 ?auto_520732 ) ) ( not ( = ?auto_520731 ?auto_520733 ) ) ( not ( = ?auto_520731 ?auto_520734 ) ) ( not ( = ?auto_520731 ?auto_520735 ) ) ( not ( = ?auto_520731 ?auto_520736 ) ) ( not ( = ?auto_520731 ?auto_520737 ) ) ( not ( = ?auto_520731 ?auto_520738 ) ) ( not ( = ?auto_520731 ?auto_520739 ) ) ( not ( = ?auto_520731 ?auto_520740 ) ) ( not ( = ?auto_520731 ?auto_520741 ) ) ( not ( = ?auto_520731 ?auto_520742 ) ) ( not ( = ?auto_520731 ?auto_520743 ) ) ( not ( = ?auto_520731 ?auto_520744 ) ) ( not ( = ?auto_520731 ?auto_520745 ) ) ( not ( = ?auto_520731 ?auto_520746 ) ) ( not ( = ?auto_520732 ?auto_520733 ) ) ( not ( = ?auto_520732 ?auto_520734 ) ) ( not ( = ?auto_520732 ?auto_520735 ) ) ( not ( = ?auto_520732 ?auto_520736 ) ) ( not ( = ?auto_520732 ?auto_520737 ) ) ( not ( = ?auto_520732 ?auto_520738 ) ) ( not ( = ?auto_520732 ?auto_520739 ) ) ( not ( = ?auto_520732 ?auto_520740 ) ) ( not ( = ?auto_520732 ?auto_520741 ) ) ( not ( = ?auto_520732 ?auto_520742 ) ) ( not ( = ?auto_520732 ?auto_520743 ) ) ( not ( = ?auto_520732 ?auto_520744 ) ) ( not ( = ?auto_520732 ?auto_520745 ) ) ( not ( = ?auto_520732 ?auto_520746 ) ) ( not ( = ?auto_520733 ?auto_520734 ) ) ( not ( = ?auto_520733 ?auto_520735 ) ) ( not ( = ?auto_520733 ?auto_520736 ) ) ( not ( = ?auto_520733 ?auto_520737 ) ) ( not ( = ?auto_520733 ?auto_520738 ) ) ( not ( = ?auto_520733 ?auto_520739 ) ) ( not ( = ?auto_520733 ?auto_520740 ) ) ( not ( = ?auto_520733 ?auto_520741 ) ) ( not ( = ?auto_520733 ?auto_520742 ) ) ( not ( = ?auto_520733 ?auto_520743 ) ) ( not ( = ?auto_520733 ?auto_520744 ) ) ( not ( = ?auto_520733 ?auto_520745 ) ) ( not ( = ?auto_520733 ?auto_520746 ) ) ( not ( = ?auto_520734 ?auto_520735 ) ) ( not ( = ?auto_520734 ?auto_520736 ) ) ( not ( = ?auto_520734 ?auto_520737 ) ) ( not ( = ?auto_520734 ?auto_520738 ) ) ( not ( = ?auto_520734 ?auto_520739 ) ) ( not ( = ?auto_520734 ?auto_520740 ) ) ( not ( = ?auto_520734 ?auto_520741 ) ) ( not ( = ?auto_520734 ?auto_520742 ) ) ( not ( = ?auto_520734 ?auto_520743 ) ) ( not ( = ?auto_520734 ?auto_520744 ) ) ( not ( = ?auto_520734 ?auto_520745 ) ) ( not ( = ?auto_520734 ?auto_520746 ) ) ( not ( = ?auto_520735 ?auto_520736 ) ) ( not ( = ?auto_520735 ?auto_520737 ) ) ( not ( = ?auto_520735 ?auto_520738 ) ) ( not ( = ?auto_520735 ?auto_520739 ) ) ( not ( = ?auto_520735 ?auto_520740 ) ) ( not ( = ?auto_520735 ?auto_520741 ) ) ( not ( = ?auto_520735 ?auto_520742 ) ) ( not ( = ?auto_520735 ?auto_520743 ) ) ( not ( = ?auto_520735 ?auto_520744 ) ) ( not ( = ?auto_520735 ?auto_520745 ) ) ( not ( = ?auto_520735 ?auto_520746 ) ) ( not ( = ?auto_520736 ?auto_520737 ) ) ( not ( = ?auto_520736 ?auto_520738 ) ) ( not ( = ?auto_520736 ?auto_520739 ) ) ( not ( = ?auto_520736 ?auto_520740 ) ) ( not ( = ?auto_520736 ?auto_520741 ) ) ( not ( = ?auto_520736 ?auto_520742 ) ) ( not ( = ?auto_520736 ?auto_520743 ) ) ( not ( = ?auto_520736 ?auto_520744 ) ) ( not ( = ?auto_520736 ?auto_520745 ) ) ( not ( = ?auto_520736 ?auto_520746 ) ) ( not ( = ?auto_520737 ?auto_520738 ) ) ( not ( = ?auto_520737 ?auto_520739 ) ) ( not ( = ?auto_520737 ?auto_520740 ) ) ( not ( = ?auto_520737 ?auto_520741 ) ) ( not ( = ?auto_520737 ?auto_520742 ) ) ( not ( = ?auto_520737 ?auto_520743 ) ) ( not ( = ?auto_520737 ?auto_520744 ) ) ( not ( = ?auto_520737 ?auto_520745 ) ) ( not ( = ?auto_520737 ?auto_520746 ) ) ( not ( = ?auto_520738 ?auto_520739 ) ) ( not ( = ?auto_520738 ?auto_520740 ) ) ( not ( = ?auto_520738 ?auto_520741 ) ) ( not ( = ?auto_520738 ?auto_520742 ) ) ( not ( = ?auto_520738 ?auto_520743 ) ) ( not ( = ?auto_520738 ?auto_520744 ) ) ( not ( = ?auto_520738 ?auto_520745 ) ) ( not ( = ?auto_520738 ?auto_520746 ) ) ( not ( = ?auto_520739 ?auto_520740 ) ) ( not ( = ?auto_520739 ?auto_520741 ) ) ( not ( = ?auto_520739 ?auto_520742 ) ) ( not ( = ?auto_520739 ?auto_520743 ) ) ( not ( = ?auto_520739 ?auto_520744 ) ) ( not ( = ?auto_520739 ?auto_520745 ) ) ( not ( = ?auto_520739 ?auto_520746 ) ) ( not ( = ?auto_520740 ?auto_520741 ) ) ( not ( = ?auto_520740 ?auto_520742 ) ) ( not ( = ?auto_520740 ?auto_520743 ) ) ( not ( = ?auto_520740 ?auto_520744 ) ) ( not ( = ?auto_520740 ?auto_520745 ) ) ( not ( = ?auto_520740 ?auto_520746 ) ) ( not ( = ?auto_520741 ?auto_520742 ) ) ( not ( = ?auto_520741 ?auto_520743 ) ) ( not ( = ?auto_520741 ?auto_520744 ) ) ( not ( = ?auto_520741 ?auto_520745 ) ) ( not ( = ?auto_520741 ?auto_520746 ) ) ( not ( = ?auto_520742 ?auto_520743 ) ) ( not ( = ?auto_520742 ?auto_520744 ) ) ( not ( = ?auto_520742 ?auto_520745 ) ) ( not ( = ?auto_520742 ?auto_520746 ) ) ( not ( = ?auto_520743 ?auto_520744 ) ) ( not ( = ?auto_520743 ?auto_520745 ) ) ( not ( = ?auto_520743 ?auto_520746 ) ) ( not ( = ?auto_520744 ?auto_520745 ) ) ( not ( = ?auto_520744 ?auto_520746 ) ) ( not ( = ?auto_520745 ?auto_520746 ) ) ( ON ?auto_520744 ?auto_520745 ) ( ON ?auto_520743 ?auto_520744 ) ( ON ?auto_520742 ?auto_520743 ) ( ON ?auto_520741 ?auto_520742 ) ( ON ?auto_520740 ?auto_520741 ) ( CLEAR ?auto_520738 ) ( ON ?auto_520739 ?auto_520740 ) ( CLEAR ?auto_520739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_520730 ?auto_520731 ?auto_520732 ?auto_520733 ?auto_520734 ?auto_520735 ?auto_520736 ?auto_520737 ?auto_520738 ?auto_520739 )
      ( MAKE-16PILE ?auto_520730 ?auto_520731 ?auto_520732 ?auto_520733 ?auto_520734 ?auto_520735 ?auto_520736 ?auto_520737 ?auto_520738 ?auto_520739 ?auto_520740 ?auto_520741 ?auto_520742 ?auto_520743 ?auto_520744 ?auto_520745 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520763 - BLOCK
      ?auto_520764 - BLOCK
      ?auto_520765 - BLOCK
      ?auto_520766 - BLOCK
      ?auto_520767 - BLOCK
      ?auto_520768 - BLOCK
      ?auto_520769 - BLOCK
      ?auto_520770 - BLOCK
      ?auto_520771 - BLOCK
      ?auto_520772 - BLOCK
      ?auto_520773 - BLOCK
      ?auto_520774 - BLOCK
      ?auto_520775 - BLOCK
      ?auto_520776 - BLOCK
      ?auto_520777 - BLOCK
      ?auto_520778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520778 ) ( ON-TABLE ?auto_520763 ) ( ON ?auto_520764 ?auto_520763 ) ( ON ?auto_520765 ?auto_520764 ) ( ON ?auto_520766 ?auto_520765 ) ( ON ?auto_520767 ?auto_520766 ) ( ON ?auto_520768 ?auto_520767 ) ( ON ?auto_520769 ?auto_520768 ) ( ON ?auto_520770 ?auto_520769 ) ( ON ?auto_520771 ?auto_520770 ) ( not ( = ?auto_520763 ?auto_520764 ) ) ( not ( = ?auto_520763 ?auto_520765 ) ) ( not ( = ?auto_520763 ?auto_520766 ) ) ( not ( = ?auto_520763 ?auto_520767 ) ) ( not ( = ?auto_520763 ?auto_520768 ) ) ( not ( = ?auto_520763 ?auto_520769 ) ) ( not ( = ?auto_520763 ?auto_520770 ) ) ( not ( = ?auto_520763 ?auto_520771 ) ) ( not ( = ?auto_520763 ?auto_520772 ) ) ( not ( = ?auto_520763 ?auto_520773 ) ) ( not ( = ?auto_520763 ?auto_520774 ) ) ( not ( = ?auto_520763 ?auto_520775 ) ) ( not ( = ?auto_520763 ?auto_520776 ) ) ( not ( = ?auto_520763 ?auto_520777 ) ) ( not ( = ?auto_520763 ?auto_520778 ) ) ( not ( = ?auto_520764 ?auto_520765 ) ) ( not ( = ?auto_520764 ?auto_520766 ) ) ( not ( = ?auto_520764 ?auto_520767 ) ) ( not ( = ?auto_520764 ?auto_520768 ) ) ( not ( = ?auto_520764 ?auto_520769 ) ) ( not ( = ?auto_520764 ?auto_520770 ) ) ( not ( = ?auto_520764 ?auto_520771 ) ) ( not ( = ?auto_520764 ?auto_520772 ) ) ( not ( = ?auto_520764 ?auto_520773 ) ) ( not ( = ?auto_520764 ?auto_520774 ) ) ( not ( = ?auto_520764 ?auto_520775 ) ) ( not ( = ?auto_520764 ?auto_520776 ) ) ( not ( = ?auto_520764 ?auto_520777 ) ) ( not ( = ?auto_520764 ?auto_520778 ) ) ( not ( = ?auto_520765 ?auto_520766 ) ) ( not ( = ?auto_520765 ?auto_520767 ) ) ( not ( = ?auto_520765 ?auto_520768 ) ) ( not ( = ?auto_520765 ?auto_520769 ) ) ( not ( = ?auto_520765 ?auto_520770 ) ) ( not ( = ?auto_520765 ?auto_520771 ) ) ( not ( = ?auto_520765 ?auto_520772 ) ) ( not ( = ?auto_520765 ?auto_520773 ) ) ( not ( = ?auto_520765 ?auto_520774 ) ) ( not ( = ?auto_520765 ?auto_520775 ) ) ( not ( = ?auto_520765 ?auto_520776 ) ) ( not ( = ?auto_520765 ?auto_520777 ) ) ( not ( = ?auto_520765 ?auto_520778 ) ) ( not ( = ?auto_520766 ?auto_520767 ) ) ( not ( = ?auto_520766 ?auto_520768 ) ) ( not ( = ?auto_520766 ?auto_520769 ) ) ( not ( = ?auto_520766 ?auto_520770 ) ) ( not ( = ?auto_520766 ?auto_520771 ) ) ( not ( = ?auto_520766 ?auto_520772 ) ) ( not ( = ?auto_520766 ?auto_520773 ) ) ( not ( = ?auto_520766 ?auto_520774 ) ) ( not ( = ?auto_520766 ?auto_520775 ) ) ( not ( = ?auto_520766 ?auto_520776 ) ) ( not ( = ?auto_520766 ?auto_520777 ) ) ( not ( = ?auto_520766 ?auto_520778 ) ) ( not ( = ?auto_520767 ?auto_520768 ) ) ( not ( = ?auto_520767 ?auto_520769 ) ) ( not ( = ?auto_520767 ?auto_520770 ) ) ( not ( = ?auto_520767 ?auto_520771 ) ) ( not ( = ?auto_520767 ?auto_520772 ) ) ( not ( = ?auto_520767 ?auto_520773 ) ) ( not ( = ?auto_520767 ?auto_520774 ) ) ( not ( = ?auto_520767 ?auto_520775 ) ) ( not ( = ?auto_520767 ?auto_520776 ) ) ( not ( = ?auto_520767 ?auto_520777 ) ) ( not ( = ?auto_520767 ?auto_520778 ) ) ( not ( = ?auto_520768 ?auto_520769 ) ) ( not ( = ?auto_520768 ?auto_520770 ) ) ( not ( = ?auto_520768 ?auto_520771 ) ) ( not ( = ?auto_520768 ?auto_520772 ) ) ( not ( = ?auto_520768 ?auto_520773 ) ) ( not ( = ?auto_520768 ?auto_520774 ) ) ( not ( = ?auto_520768 ?auto_520775 ) ) ( not ( = ?auto_520768 ?auto_520776 ) ) ( not ( = ?auto_520768 ?auto_520777 ) ) ( not ( = ?auto_520768 ?auto_520778 ) ) ( not ( = ?auto_520769 ?auto_520770 ) ) ( not ( = ?auto_520769 ?auto_520771 ) ) ( not ( = ?auto_520769 ?auto_520772 ) ) ( not ( = ?auto_520769 ?auto_520773 ) ) ( not ( = ?auto_520769 ?auto_520774 ) ) ( not ( = ?auto_520769 ?auto_520775 ) ) ( not ( = ?auto_520769 ?auto_520776 ) ) ( not ( = ?auto_520769 ?auto_520777 ) ) ( not ( = ?auto_520769 ?auto_520778 ) ) ( not ( = ?auto_520770 ?auto_520771 ) ) ( not ( = ?auto_520770 ?auto_520772 ) ) ( not ( = ?auto_520770 ?auto_520773 ) ) ( not ( = ?auto_520770 ?auto_520774 ) ) ( not ( = ?auto_520770 ?auto_520775 ) ) ( not ( = ?auto_520770 ?auto_520776 ) ) ( not ( = ?auto_520770 ?auto_520777 ) ) ( not ( = ?auto_520770 ?auto_520778 ) ) ( not ( = ?auto_520771 ?auto_520772 ) ) ( not ( = ?auto_520771 ?auto_520773 ) ) ( not ( = ?auto_520771 ?auto_520774 ) ) ( not ( = ?auto_520771 ?auto_520775 ) ) ( not ( = ?auto_520771 ?auto_520776 ) ) ( not ( = ?auto_520771 ?auto_520777 ) ) ( not ( = ?auto_520771 ?auto_520778 ) ) ( not ( = ?auto_520772 ?auto_520773 ) ) ( not ( = ?auto_520772 ?auto_520774 ) ) ( not ( = ?auto_520772 ?auto_520775 ) ) ( not ( = ?auto_520772 ?auto_520776 ) ) ( not ( = ?auto_520772 ?auto_520777 ) ) ( not ( = ?auto_520772 ?auto_520778 ) ) ( not ( = ?auto_520773 ?auto_520774 ) ) ( not ( = ?auto_520773 ?auto_520775 ) ) ( not ( = ?auto_520773 ?auto_520776 ) ) ( not ( = ?auto_520773 ?auto_520777 ) ) ( not ( = ?auto_520773 ?auto_520778 ) ) ( not ( = ?auto_520774 ?auto_520775 ) ) ( not ( = ?auto_520774 ?auto_520776 ) ) ( not ( = ?auto_520774 ?auto_520777 ) ) ( not ( = ?auto_520774 ?auto_520778 ) ) ( not ( = ?auto_520775 ?auto_520776 ) ) ( not ( = ?auto_520775 ?auto_520777 ) ) ( not ( = ?auto_520775 ?auto_520778 ) ) ( not ( = ?auto_520776 ?auto_520777 ) ) ( not ( = ?auto_520776 ?auto_520778 ) ) ( not ( = ?auto_520777 ?auto_520778 ) ) ( ON ?auto_520777 ?auto_520778 ) ( ON ?auto_520776 ?auto_520777 ) ( ON ?auto_520775 ?auto_520776 ) ( ON ?auto_520774 ?auto_520775 ) ( ON ?auto_520773 ?auto_520774 ) ( CLEAR ?auto_520771 ) ( ON ?auto_520772 ?auto_520773 ) ( CLEAR ?auto_520772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_520763 ?auto_520764 ?auto_520765 ?auto_520766 ?auto_520767 ?auto_520768 ?auto_520769 ?auto_520770 ?auto_520771 ?auto_520772 )
      ( MAKE-16PILE ?auto_520763 ?auto_520764 ?auto_520765 ?auto_520766 ?auto_520767 ?auto_520768 ?auto_520769 ?auto_520770 ?auto_520771 ?auto_520772 ?auto_520773 ?auto_520774 ?auto_520775 ?auto_520776 ?auto_520777 ?auto_520778 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520795 - BLOCK
      ?auto_520796 - BLOCK
      ?auto_520797 - BLOCK
      ?auto_520798 - BLOCK
      ?auto_520799 - BLOCK
      ?auto_520800 - BLOCK
      ?auto_520801 - BLOCK
      ?auto_520802 - BLOCK
      ?auto_520803 - BLOCK
      ?auto_520804 - BLOCK
      ?auto_520805 - BLOCK
      ?auto_520806 - BLOCK
      ?auto_520807 - BLOCK
      ?auto_520808 - BLOCK
      ?auto_520809 - BLOCK
      ?auto_520810 - BLOCK
    )
    :vars
    (
      ?auto_520811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520810 ?auto_520811 ) ( ON-TABLE ?auto_520795 ) ( ON ?auto_520796 ?auto_520795 ) ( ON ?auto_520797 ?auto_520796 ) ( ON ?auto_520798 ?auto_520797 ) ( ON ?auto_520799 ?auto_520798 ) ( ON ?auto_520800 ?auto_520799 ) ( ON ?auto_520801 ?auto_520800 ) ( ON ?auto_520802 ?auto_520801 ) ( not ( = ?auto_520795 ?auto_520796 ) ) ( not ( = ?auto_520795 ?auto_520797 ) ) ( not ( = ?auto_520795 ?auto_520798 ) ) ( not ( = ?auto_520795 ?auto_520799 ) ) ( not ( = ?auto_520795 ?auto_520800 ) ) ( not ( = ?auto_520795 ?auto_520801 ) ) ( not ( = ?auto_520795 ?auto_520802 ) ) ( not ( = ?auto_520795 ?auto_520803 ) ) ( not ( = ?auto_520795 ?auto_520804 ) ) ( not ( = ?auto_520795 ?auto_520805 ) ) ( not ( = ?auto_520795 ?auto_520806 ) ) ( not ( = ?auto_520795 ?auto_520807 ) ) ( not ( = ?auto_520795 ?auto_520808 ) ) ( not ( = ?auto_520795 ?auto_520809 ) ) ( not ( = ?auto_520795 ?auto_520810 ) ) ( not ( = ?auto_520795 ?auto_520811 ) ) ( not ( = ?auto_520796 ?auto_520797 ) ) ( not ( = ?auto_520796 ?auto_520798 ) ) ( not ( = ?auto_520796 ?auto_520799 ) ) ( not ( = ?auto_520796 ?auto_520800 ) ) ( not ( = ?auto_520796 ?auto_520801 ) ) ( not ( = ?auto_520796 ?auto_520802 ) ) ( not ( = ?auto_520796 ?auto_520803 ) ) ( not ( = ?auto_520796 ?auto_520804 ) ) ( not ( = ?auto_520796 ?auto_520805 ) ) ( not ( = ?auto_520796 ?auto_520806 ) ) ( not ( = ?auto_520796 ?auto_520807 ) ) ( not ( = ?auto_520796 ?auto_520808 ) ) ( not ( = ?auto_520796 ?auto_520809 ) ) ( not ( = ?auto_520796 ?auto_520810 ) ) ( not ( = ?auto_520796 ?auto_520811 ) ) ( not ( = ?auto_520797 ?auto_520798 ) ) ( not ( = ?auto_520797 ?auto_520799 ) ) ( not ( = ?auto_520797 ?auto_520800 ) ) ( not ( = ?auto_520797 ?auto_520801 ) ) ( not ( = ?auto_520797 ?auto_520802 ) ) ( not ( = ?auto_520797 ?auto_520803 ) ) ( not ( = ?auto_520797 ?auto_520804 ) ) ( not ( = ?auto_520797 ?auto_520805 ) ) ( not ( = ?auto_520797 ?auto_520806 ) ) ( not ( = ?auto_520797 ?auto_520807 ) ) ( not ( = ?auto_520797 ?auto_520808 ) ) ( not ( = ?auto_520797 ?auto_520809 ) ) ( not ( = ?auto_520797 ?auto_520810 ) ) ( not ( = ?auto_520797 ?auto_520811 ) ) ( not ( = ?auto_520798 ?auto_520799 ) ) ( not ( = ?auto_520798 ?auto_520800 ) ) ( not ( = ?auto_520798 ?auto_520801 ) ) ( not ( = ?auto_520798 ?auto_520802 ) ) ( not ( = ?auto_520798 ?auto_520803 ) ) ( not ( = ?auto_520798 ?auto_520804 ) ) ( not ( = ?auto_520798 ?auto_520805 ) ) ( not ( = ?auto_520798 ?auto_520806 ) ) ( not ( = ?auto_520798 ?auto_520807 ) ) ( not ( = ?auto_520798 ?auto_520808 ) ) ( not ( = ?auto_520798 ?auto_520809 ) ) ( not ( = ?auto_520798 ?auto_520810 ) ) ( not ( = ?auto_520798 ?auto_520811 ) ) ( not ( = ?auto_520799 ?auto_520800 ) ) ( not ( = ?auto_520799 ?auto_520801 ) ) ( not ( = ?auto_520799 ?auto_520802 ) ) ( not ( = ?auto_520799 ?auto_520803 ) ) ( not ( = ?auto_520799 ?auto_520804 ) ) ( not ( = ?auto_520799 ?auto_520805 ) ) ( not ( = ?auto_520799 ?auto_520806 ) ) ( not ( = ?auto_520799 ?auto_520807 ) ) ( not ( = ?auto_520799 ?auto_520808 ) ) ( not ( = ?auto_520799 ?auto_520809 ) ) ( not ( = ?auto_520799 ?auto_520810 ) ) ( not ( = ?auto_520799 ?auto_520811 ) ) ( not ( = ?auto_520800 ?auto_520801 ) ) ( not ( = ?auto_520800 ?auto_520802 ) ) ( not ( = ?auto_520800 ?auto_520803 ) ) ( not ( = ?auto_520800 ?auto_520804 ) ) ( not ( = ?auto_520800 ?auto_520805 ) ) ( not ( = ?auto_520800 ?auto_520806 ) ) ( not ( = ?auto_520800 ?auto_520807 ) ) ( not ( = ?auto_520800 ?auto_520808 ) ) ( not ( = ?auto_520800 ?auto_520809 ) ) ( not ( = ?auto_520800 ?auto_520810 ) ) ( not ( = ?auto_520800 ?auto_520811 ) ) ( not ( = ?auto_520801 ?auto_520802 ) ) ( not ( = ?auto_520801 ?auto_520803 ) ) ( not ( = ?auto_520801 ?auto_520804 ) ) ( not ( = ?auto_520801 ?auto_520805 ) ) ( not ( = ?auto_520801 ?auto_520806 ) ) ( not ( = ?auto_520801 ?auto_520807 ) ) ( not ( = ?auto_520801 ?auto_520808 ) ) ( not ( = ?auto_520801 ?auto_520809 ) ) ( not ( = ?auto_520801 ?auto_520810 ) ) ( not ( = ?auto_520801 ?auto_520811 ) ) ( not ( = ?auto_520802 ?auto_520803 ) ) ( not ( = ?auto_520802 ?auto_520804 ) ) ( not ( = ?auto_520802 ?auto_520805 ) ) ( not ( = ?auto_520802 ?auto_520806 ) ) ( not ( = ?auto_520802 ?auto_520807 ) ) ( not ( = ?auto_520802 ?auto_520808 ) ) ( not ( = ?auto_520802 ?auto_520809 ) ) ( not ( = ?auto_520802 ?auto_520810 ) ) ( not ( = ?auto_520802 ?auto_520811 ) ) ( not ( = ?auto_520803 ?auto_520804 ) ) ( not ( = ?auto_520803 ?auto_520805 ) ) ( not ( = ?auto_520803 ?auto_520806 ) ) ( not ( = ?auto_520803 ?auto_520807 ) ) ( not ( = ?auto_520803 ?auto_520808 ) ) ( not ( = ?auto_520803 ?auto_520809 ) ) ( not ( = ?auto_520803 ?auto_520810 ) ) ( not ( = ?auto_520803 ?auto_520811 ) ) ( not ( = ?auto_520804 ?auto_520805 ) ) ( not ( = ?auto_520804 ?auto_520806 ) ) ( not ( = ?auto_520804 ?auto_520807 ) ) ( not ( = ?auto_520804 ?auto_520808 ) ) ( not ( = ?auto_520804 ?auto_520809 ) ) ( not ( = ?auto_520804 ?auto_520810 ) ) ( not ( = ?auto_520804 ?auto_520811 ) ) ( not ( = ?auto_520805 ?auto_520806 ) ) ( not ( = ?auto_520805 ?auto_520807 ) ) ( not ( = ?auto_520805 ?auto_520808 ) ) ( not ( = ?auto_520805 ?auto_520809 ) ) ( not ( = ?auto_520805 ?auto_520810 ) ) ( not ( = ?auto_520805 ?auto_520811 ) ) ( not ( = ?auto_520806 ?auto_520807 ) ) ( not ( = ?auto_520806 ?auto_520808 ) ) ( not ( = ?auto_520806 ?auto_520809 ) ) ( not ( = ?auto_520806 ?auto_520810 ) ) ( not ( = ?auto_520806 ?auto_520811 ) ) ( not ( = ?auto_520807 ?auto_520808 ) ) ( not ( = ?auto_520807 ?auto_520809 ) ) ( not ( = ?auto_520807 ?auto_520810 ) ) ( not ( = ?auto_520807 ?auto_520811 ) ) ( not ( = ?auto_520808 ?auto_520809 ) ) ( not ( = ?auto_520808 ?auto_520810 ) ) ( not ( = ?auto_520808 ?auto_520811 ) ) ( not ( = ?auto_520809 ?auto_520810 ) ) ( not ( = ?auto_520809 ?auto_520811 ) ) ( not ( = ?auto_520810 ?auto_520811 ) ) ( ON ?auto_520809 ?auto_520810 ) ( ON ?auto_520808 ?auto_520809 ) ( ON ?auto_520807 ?auto_520808 ) ( ON ?auto_520806 ?auto_520807 ) ( ON ?auto_520805 ?auto_520806 ) ( ON ?auto_520804 ?auto_520805 ) ( CLEAR ?auto_520802 ) ( ON ?auto_520803 ?auto_520804 ) ( CLEAR ?auto_520803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_520795 ?auto_520796 ?auto_520797 ?auto_520798 ?auto_520799 ?auto_520800 ?auto_520801 ?auto_520802 ?auto_520803 )
      ( MAKE-16PILE ?auto_520795 ?auto_520796 ?auto_520797 ?auto_520798 ?auto_520799 ?auto_520800 ?auto_520801 ?auto_520802 ?auto_520803 ?auto_520804 ?auto_520805 ?auto_520806 ?auto_520807 ?auto_520808 ?auto_520809 ?auto_520810 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520828 - BLOCK
      ?auto_520829 - BLOCK
      ?auto_520830 - BLOCK
      ?auto_520831 - BLOCK
      ?auto_520832 - BLOCK
      ?auto_520833 - BLOCK
      ?auto_520834 - BLOCK
      ?auto_520835 - BLOCK
      ?auto_520836 - BLOCK
      ?auto_520837 - BLOCK
      ?auto_520838 - BLOCK
      ?auto_520839 - BLOCK
      ?auto_520840 - BLOCK
      ?auto_520841 - BLOCK
      ?auto_520842 - BLOCK
      ?auto_520843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520843 ) ( ON-TABLE ?auto_520828 ) ( ON ?auto_520829 ?auto_520828 ) ( ON ?auto_520830 ?auto_520829 ) ( ON ?auto_520831 ?auto_520830 ) ( ON ?auto_520832 ?auto_520831 ) ( ON ?auto_520833 ?auto_520832 ) ( ON ?auto_520834 ?auto_520833 ) ( ON ?auto_520835 ?auto_520834 ) ( not ( = ?auto_520828 ?auto_520829 ) ) ( not ( = ?auto_520828 ?auto_520830 ) ) ( not ( = ?auto_520828 ?auto_520831 ) ) ( not ( = ?auto_520828 ?auto_520832 ) ) ( not ( = ?auto_520828 ?auto_520833 ) ) ( not ( = ?auto_520828 ?auto_520834 ) ) ( not ( = ?auto_520828 ?auto_520835 ) ) ( not ( = ?auto_520828 ?auto_520836 ) ) ( not ( = ?auto_520828 ?auto_520837 ) ) ( not ( = ?auto_520828 ?auto_520838 ) ) ( not ( = ?auto_520828 ?auto_520839 ) ) ( not ( = ?auto_520828 ?auto_520840 ) ) ( not ( = ?auto_520828 ?auto_520841 ) ) ( not ( = ?auto_520828 ?auto_520842 ) ) ( not ( = ?auto_520828 ?auto_520843 ) ) ( not ( = ?auto_520829 ?auto_520830 ) ) ( not ( = ?auto_520829 ?auto_520831 ) ) ( not ( = ?auto_520829 ?auto_520832 ) ) ( not ( = ?auto_520829 ?auto_520833 ) ) ( not ( = ?auto_520829 ?auto_520834 ) ) ( not ( = ?auto_520829 ?auto_520835 ) ) ( not ( = ?auto_520829 ?auto_520836 ) ) ( not ( = ?auto_520829 ?auto_520837 ) ) ( not ( = ?auto_520829 ?auto_520838 ) ) ( not ( = ?auto_520829 ?auto_520839 ) ) ( not ( = ?auto_520829 ?auto_520840 ) ) ( not ( = ?auto_520829 ?auto_520841 ) ) ( not ( = ?auto_520829 ?auto_520842 ) ) ( not ( = ?auto_520829 ?auto_520843 ) ) ( not ( = ?auto_520830 ?auto_520831 ) ) ( not ( = ?auto_520830 ?auto_520832 ) ) ( not ( = ?auto_520830 ?auto_520833 ) ) ( not ( = ?auto_520830 ?auto_520834 ) ) ( not ( = ?auto_520830 ?auto_520835 ) ) ( not ( = ?auto_520830 ?auto_520836 ) ) ( not ( = ?auto_520830 ?auto_520837 ) ) ( not ( = ?auto_520830 ?auto_520838 ) ) ( not ( = ?auto_520830 ?auto_520839 ) ) ( not ( = ?auto_520830 ?auto_520840 ) ) ( not ( = ?auto_520830 ?auto_520841 ) ) ( not ( = ?auto_520830 ?auto_520842 ) ) ( not ( = ?auto_520830 ?auto_520843 ) ) ( not ( = ?auto_520831 ?auto_520832 ) ) ( not ( = ?auto_520831 ?auto_520833 ) ) ( not ( = ?auto_520831 ?auto_520834 ) ) ( not ( = ?auto_520831 ?auto_520835 ) ) ( not ( = ?auto_520831 ?auto_520836 ) ) ( not ( = ?auto_520831 ?auto_520837 ) ) ( not ( = ?auto_520831 ?auto_520838 ) ) ( not ( = ?auto_520831 ?auto_520839 ) ) ( not ( = ?auto_520831 ?auto_520840 ) ) ( not ( = ?auto_520831 ?auto_520841 ) ) ( not ( = ?auto_520831 ?auto_520842 ) ) ( not ( = ?auto_520831 ?auto_520843 ) ) ( not ( = ?auto_520832 ?auto_520833 ) ) ( not ( = ?auto_520832 ?auto_520834 ) ) ( not ( = ?auto_520832 ?auto_520835 ) ) ( not ( = ?auto_520832 ?auto_520836 ) ) ( not ( = ?auto_520832 ?auto_520837 ) ) ( not ( = ?auto_520832 ?auto_520838 ) ) ( not ( = ?auto_520832 ?auto_520839 ) ) ( not ( = ?auto_520832 ?auto_520840 ) ) ( not ( = ?auto_520832 ?auto_520841 ) ) ( not ( = ?auto_520832 ?auto_520842 ) ) ( not ( = ?auto_520832 ?auto_520843 ) ) ( not ( = ?auto_520833 ?auto_520834 ) ) ( not ( = ?auto_520833 ?auto_520835 ) ) ( not ( = ?auto_520833 ?auto_520836 ) ) ( not ( = ?auto_520833 ?auto_520837 ) ) ( not ( = ?auto_520833 ?auto_520838 ) ) ( not ( = ?auto_520833 ?auto_520839 ) ) ( not ( = ?auto_520833 ?auto_520840 ) ) ( not ( = ?auto_520833 ?auto_520841 ) ) ( not ( = ?auto_520833 ?auto_520842 ) ) ( not ( = ?auto_520833 ?auto_520843 ) ) ( not ( = ?auto_520834 ?auto_520835 ) ) ( not ( = ?auto_520834 ?auto_520836 ) ) ( not ( = ?auto_520834 ?auto_520837 ) ) ( not ( = ?auto_520834 ?auto_520838 ) ) ( not ( = ?auto_520834 ?auto_520839 ) ) ( not ( = ?auto_520834 ?auto_520840 ) ) ( not ( = ?auto_520834 ?auto_520841 ) ) ( not ( = ?auto_520834 ?auto_520842 ) ) ( not ( = ?auto_520834 ?auto_520843 ) ) ( not ( = ?auto_520835 ?auto_520836 ) ) ( not ( = ?auto_520835 ?auto_520837 ) ) ( not ( = ?auto_520835 ?auto_520838 ) ) ( not ( = ?auto_520835 ?auto_520839 ) ) ( not ( = ?auto_520835 ?auto_520840 ) ) ( not ( = ?auto_520835 ?auto_520841 ) ) ( not ( = ?auto_520835 ?auto_520842 ) ) ( not ( = ?auto_520835 ?auto_520843 ) ) ( not ( = ?auto_520836 ?auto_520837 ) ) ( not ( = ?auto_520836 ?auto_520838 ) ) ( not ( = ?auto_520836 ?auto_520839 ) ) ( not ( = ?auto_520836 ?auto_520840 ) ) ( not ( = ?auto_520836 ?auto_520841 ) ) ( not ( = ?auto_520836 ?auto_520842 ) ) ( not ( = ?auto_520836 ?auto_520843 ) ) ( not ( = ?auto_520837 ?auto_520838 ) ) ( not ( = ?auto_520837 ?auto_520839 ) ) ( not ( = ?auto_520837 ?auto_520840 ) ) ( not ( = ?auto_520837 ?auto_520841 ) ) ( not ( = ?auto_520837 ?auto_520842 ) ) ( not ( = ?auto_520837 ?auto_520843 ) ) ( not ( = ?auto_520838 ?auto_520839 ) ) ( not ( = ?auto_520838 ?auto_520840 ) ) ( not ( = ?auto_520838 ?auto_520841 ) ) ( not ( = ?auto_520838 ?auto_520842 ) ) ( not ( = ?auto_520838 ?auto_520843 ) ) ( not ( = ?auto_520839 ?auto_520840 ) ) ( not ( = ?auto_520839 ?auto_520841 ) ) ( not ( = ?auto_520839 ?auto_520842 ) ) ( not ( = ?auto_520839 ?auto_520843 ) ) ( not ( = ?auto_520840 ?auto_520841 ) ) ( not ( = ?auto_520840 ?auto_520842 ) ) ( not ( = ?auto_520840 ?auto_520843 ) ) ( not ( = ?auto_520841 ?auto_520842 ) ) ( not ( = ?auto_520841 ?auto_520843 ) ) ( not ( = ?auto_520842 ?auto_520843 ) ) ( ON ?auto_520842 ?auto_520843 ) ( ON ?auto_520841 ?auto_520842 ) ( ON ?auto_520840 ?auto_520841 ) ( ON ?auto_520839 ?auto_520840 ) ( ON ?auto_520838 ?auto_520839 ) ( ON ?auto_520837 ?auto_520838 ) ( CLEAR ?auto_520835 ) ( ON ?auto_520836 ?auto_520837 ) ( CLEAR ?auto_520836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_520828 ?auto_520829 ?auto_520830 ?auto_520831 ?auto_520832 ?auto_520833 ?auto_520834 ?auto_520835 ?auto_520836 )
      ( MAKE-16PILE ?auto_520828 ?auto_520829 ?auto_520830 ?auto_520831 ?auto_520832 ?auto_520833 ?auto_520834 ?auto_520835 ?auto_520836 ?auto_520837 ?auto_520838 ?auto_520839 ?auto_520840 ?auto_520841 ?auto_520842 ?auto_520843 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520860 - BLOCK
      ?auto_520861 - BLOCK
      ?auto_520862 - BLOCK
      ?auto_520863 - BLOCK
      ?auto_520864 - BLOCK
      ?auto_520865 - BLOCK
      ?auto_520866 - BLOCK
      ?auto_520867 - BLOCK
      ?auto_520868 - BLOCK
      ?auto_520869 - BLOCK
      ?auto_520870 - BLOCK
      ?auto_520871 - BLOCK
      ?auto_520872 - BLOCK
      ?auto_520873 - BLOCK
      ?auto_520874 - BLOCK
      ?auto_520875 - BLOCK
    )
    :vars
    (
      ?auto_520876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520875 ?auto_520876 ) ( ON-TABLE ?auto_520860 ) ( ON ?auto_520861 ?auto_520860 ) ( ON ?auto_520862 ?auto_520861 ) ( ON ?auto_520863 ?auto_520862 ) ( ON ?auto_520864 ?auto_520863 ) ( ON ?auto_520865 ?auto_520864 ) ( ON ?auto_520866 ?auto_520865 ) ( not ( = ?auto_520860 ?auto_520861 ) ) ( not ( = ?auto_520860 ?auto_520862 ) ) ( not ( = ?auto_520860 ?auto_520863 ) ) ( not ( = ?auto_520860 ?auto_520864 ) ) ( not ( = ?auto_520860 ?auto_520865 ) ) ( not ( = ?auto_520860 ?auto_520866 ) ) ( not ( = ?auto_520860 ?auto_520867 ) ) ( not ( = ?auto_520860 ?auto_520868 ) ) ( not ( = ?auto_520860 ?auto_520869 ) ) ( not ( = ?auto_520860 ?auto_520870 ) ) ( not ( = ?auto_520860 ?auto_520871 ) ) ( not ( = ?auto_520860 ?auto_520872 ) ) ( not ( = ?auto_520860 ?auto_520873 ) ) ( not ( = ?auto_520860 ?auto_520874 ) ) ( not ( = ?auto_520860 ?auto_520875 ) ) ( not ( = ?auto_520860 ?auto_520876 ) ) ( not ( = ?auto_520861 ?auto_520862 ) ) ( not ( = ?auto_520861 ?auto_520863 ) ) ( not ( = ?auto_520861 ?auto_520864 ) ) ( not ( = ?auto_520861 ?auto_520865 ) ) ( not ( = ?auto_520861 ?auto_520866 ) ) ( not ( = ?auto_520861 ?auto_520867 ) ) ( not ( = ?auto_520861 ?auto_520868 ) ) ( not ( = ?auto_520861 ?auto_520869 ) ) ( not ( = ?auto_520861 ?auto_520870 ) ) ( not ( = ?auto_520861 ?auto_520871 ) ) ( not ( = ?auto_520861 ?auto_520872 ) ) ( not ( = ?auto_520861 ?auto_520873 ) ) ( not ( = ?auto_520861 ?auto_520874 ) ) ( not ( = ?auto_520861 ?auto_520875 ) ) ( not ( = ?auto_520861 ?auto_520876 ) ) ( not ( = ?auto_520862 ?auto_520863 ) ) ( not ( = ?auto_520862 ?auto_520864 ) ) ( not ( = ?auto_520862 ?auto_520865 ) ) ( not ( = ?auto_520862 ?auto_520866 ) ) ( not ( = ?auto_520862 ?auto_520867 ) ) ( not ( = ?auto_520862 ?auto_520868 ) ) ( not ( = ?auto_520862 ?auto_520869 ) ) ( not ( = ?auto_520862 ?auto_520870 ) ) ( not ( = ?auto_520862 ?auto_520871 ) ) ( not ( = ?auto_520862 ?auto_520872 ) ) ( not ( = ?auto_520862 ?auto_520873 ) ) ( not ( = ?auto_520862 ?auto_520874 ) ) ( not ( = ?auto_520862 ?auto_520875 ) ) ( not ( = ?auto_520862 ?auto_520876 ) ) ( not ( = ?auto_520863 ?auto_520864 ) ) ( not ( = ?auto_520863 ?auto_520865 ) ) ( not ( = ?auto_520863 ?auto_520866 ) ) ( not ( = ?auto_520863 ?auto_520867 ) ) ( not ( = ?auto_520863 ?auto_520868 ) ) ( not ( = ?auto_520863 ?auto_520869 ) ) ( not ( = ?auto_520863 ?auto_520870 ) ) ( not ( = ?auto_520863 ?auto_520871 ) ) ( not ( = ?auto_520863 ?auto_520872 ) ) ( not ( = ?auto_520863 ?auto_520873 ) ) ( not ( = ?auto_520863 ?auto_520874 ) ) ( not ( = ?auto_520863 ?auto_520875 ) ) ( not ( = ?auto_520863 ?auto_520876 ) ) ( not ( = ?auto_520864 ?auto_520865 ) ) ( not ( = ?auto_520864 ?auto_520866 ) ) ( not ( = ?auto_520864 ?auto_520867 ) ) ( not ( = ?auto_520864 ?auto_520868 ) ) ( not ( = ?auto_520864 ?auto_520869 ) ) ( not ( = ?auto_520864 ?auto_520870 ) ) ( not ( = ?auto_520864 ?auto_520871 ) ) ( not ( = ?auto_520864 ?auto_520872 ) ) ( not ( = ?auto_520864 ?auto_520873 ) ) ( not ( = ?auto_520864 ?auto_520874 ) ) ( not ( = ?auto_520864 ?auto_520875 ) ) ( not ( = ?auto_520864 ?auto_520876 ) ) ( not ( = ?auto_520865 ?auto_520866 ) ) ( not ( = ?auto_520865 ?auto_520867 ) ) ( not ( = ?auto_520865 ?auto_520868 ) ) ( not ( = ?auto_520865 ?auto_520869 ) ) ( not ( = ?auto_520865 ?auto_520870 ) ) ( not ( = ?auto_520865 ?auto_520871 ) ) ( not ( = ?auto_520865 ?auto_520872 ) ) ( not ( = ?auto_520865 ?auto_520873 ) ) ( not ( = ?auto_520865 ?auto_520874 ) ) ( not ( = ?auto_520865 ?auto_520875 ) ) ( not ( = ?auto_520865 ?auto_520876 ) ) ( not ( = ?auto_520866 ?auto_520867 ) ) ( not ( = ?auto_520866 ?auto_520868 ) ) ( not ( = ?auto_520866 ?auto_520869 ) ) ( not ( = ?auto_520866 ?auto_520870 ) ) ( not ( = ?auto_520866 ?auto_520871 ) ) ( not ( = ?auto_520866 ?auto_520872 ) ) ( not ( = ?auto_520866 ?auto_520873 ) ) ( not ( = ?auto_520866 ?auto_520874 ) ) ( not ( = ?auto_520866 ?auto_520875 ) ) ( not ( = ?auto_520866 ?auto_520876 ) ) ( not ( = ?auto_520867 ?auto_520868 ) ) ( not ( = ?auto_520867 ?auto_520869 ) ) ( not ( = ?auto_520867 ?auto_520870 ) ) ( not ( = ?auto_520867 ?auto_520871 ) ) ( not ( = ?auto_520867 ?auto_520872 ) ) ( not ( = ?auto_520867 ?auto_520873 ) ) ( not ( = ?auto_520867 ?auto_520874 ) ) ( not ( = ?auto_520867 ?auto_520875 ) ) ( not ( = ?auto_520867 ?auto_520876 ) ) ( not ( = ?auto_520868 ?auto_520869 ) ) ( not ( = ?auto_520868 ?auto_520870 ) ) ( not ( = ?auto_520868 ?auto_520871 ) ) ( not ( = ?auto_520868 ?auto_520872 ) ) ( not ( = ?auto_520868 ?auto_520873 ) ) ( not ( = ?auto_520868 ?auto_520874 ) ) ( not ( = ?auto_520868 ?auto_520875 ) ) ( not ( = ?auto_520868 ?auto_520876 ) ) ( not ( = ?auto_520869 ?auto_520870 ) ) ( not ( = ?auto_520869 ?auto_520871 ) ) ( not ( = ?auto_520869 ?auto_520872 ) ) ( not ( = ?auto_520869 ?auto_520873 ) ) ( not ( = ?auto_520869 ?auto_520874 ) ) ( not ( = ?auto_520869 ?auto_520875 ) ) ( not ( = ?auto_520869 ?auto_520876 ) ) ( not ( = ?auto_520870 ?auto_520871 ) ) ( not ( = ?auto_520870 ?auto_520872 ) ) ( not ( = ?auto_520870 ?auto_520873 ) ) ( not ( = ?auto_520870 ?auto_520874 ) ) ( not ( = ?auto_520870 ?auto_520875 ) ) ( not ( = ?auto_520870 ?auto_520876 ) ) ( not ( = ?auto_520871 ?auto_520872 ) ) ( not ( = ?auto_520871 ?auto_520873 ) ) ( not ( = ?auto_520871 ?auto_520874 ) ) ( not ( = ?auto_520871 ?auto_520875 ) ) ( not ( = ?auto_520871 ?auto_520876 ) ) ( not ( = ?auto_520872 ?auto_520873 ) ) ( not ( = ?auto_520872 ?auto_520874 ) ) ( not ( = ?auto_520872 ?auto_520875 ) ) ( not ( = ?auto_520872 ?auto_520876 ) ) ( not ( = ?auto_520873 ?auto_520874 ) ) ( not ( = ?auto_520873 ?auto_520875 ) ) ( not ( = ?auto_520873 ?auto_520876 ) ) ( not ( = ?auto_520874 ?auto_520875 ) ) ( not ( = ?auto_520874 ?auto_520876 ) ) ( not ( = ?auto_520875 ?auto_520876 ) ) ( ON ?auto_520874 ?auto_520875 ) ( ON ?auto_520873 ?auto_520874 ) ( ON ?auto_520872 ?auto_520873 ) ( ON ?auto_520871 ?auto_520872 ) ( ON ?auto_520870 ?auto_520871 ) ( ON ?auto_520869 ?auto_520870 ) ( ON ?auto_520868 ?auto_520869 ) ( CLEAR ?auto_520866 ) ( ON ?auto_520867 ?auto_520868 ) ( CLEAR ?auto_520867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_520860 ?auto_520861 ?auto_520862 ?auto_520863 ?auto_520864 ?auto_520865 ?auto_520866 ?auto_520867 )
      ( MAKE-16PILE ?auto_520860 ?auto_520861 ?auto_520862 ?auto_520863 ?auto_520864 ?auto_520865 ?auto_520866 ?auto_520867 ?auto_520868 ?auto_520869 ?auto_520870 ?auto_520871 ?auto_520872 ?auto_520873 ?auto_520874 ?auto_520875 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520893 - BLOCK
      ?auto_520894 - BLOCK
      ?auto_520895 - BLOCK
      ?auto_520896 - BLOCK
      ?auto_520897 - BLOCK
      ?auto_520898 - BLOCK
      ?auto_520899 - BLOCK
      ?auto_520900 - BLOCK
      ?auto_520901 - BLOCK
      ?auto_520902 - BLOCK
      ?auto_520903 - BLOCK
      ?auto_520904 - BLOCK
      ?auto_520905 - BLOCK
      ?auto_520906 - BLOCK
      ?auto_520907 - BLOCK
      ?auto_520908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520908 ) ( ON-TABLE ?auto_520893 ) ( ON ?auto_520894 ?auto_520893 ) ( ON ?auto_520895 ?auto_520894 ) ( ON ?auto_520896 ?auto_520895 ) ( ON ?auto_520897 ?auto_520896 ) ( ON ?auto_520898 ?auto_520897 ) ( ON ?auto_520899 ?auto_520898 ) ( not ( = ?auto_520893 ?auto_520894 ) ) ( not ( = ?auto_520893 ?auto_520895 ) ) ( not ( = ?auto_520893 ?auto_520896 ) ) ( not ( = ?auto_520893 ?auto_520897 ) ) ( not ( = ?auto_520893 ?auto_520898 ) ) ( not ( = ?auto_520893 ?auto_520899 ) ) ( not ( = ?auto_520893 ?auto_520900 ) ) ( not ( = ?auto_520893 ?auto_520901 ) ) ( not ( = ?auto_520893 ?auto_520902 ) ) ( not ( = ?auto_520893 ?auto_520903 ) ) ( not ( = ?auto_520893 ?auto_520904 ) ) ( not ( = ?auto_520893 ?auto_520905 ) ) ( not ( = ?auto_520893 ?auto_520906 ) ) ( not ( = ?auto_520893 ?auto_520907 ) ) ( not ( = ?auto_520893 ?auto_520908 ) ) ( not ( = ?auto_520894 ?auto_520895 ) ) ( not ( = ?auto_520894 ?auto_520896 ) ) ( not ( = ?auto_520894 ?auto_520897 ) ) ( not ( = ?auto_520894 ?auto_520898 ) ) ( not ( = ?auto_520894 ?auto_520899 ) ) ( not ( = ?auto_520894 ?auto_520900 ) ) ( not ( = ?auto_520894 ?auto_520901 ) ) ( not ( = ?auto_520894 ?auto_520902 ) ) ( not ( = ?auto_520894 ?auto_520903 ) ) ( not ( = ?auto_520894 ?auto_520904 ) ) ( not ( = ?auto_520894 ?auto_520905 ) ) ( not ( = ?auto_520894 ?auto_520906 ) ) ( not ( = ?auto_520894 ?auto_520907 ) ) ( not ( = ?auto_520894 ?auto_520908 ) ) ( not ( = ?auto_520895 ?auto_520896 ) ) ( not ( = ?auto_520895 ?auto_520897 ) ) ( not ( = ?auto_520895 ?auto_520898 ) ) ( not ( = ?auto_520895 ?auto_520899 ) ) ( not ( = ?auto_520895 ?auto_520900 ) ) ( not ( = ?auto_520895 ?auto_520901 ) ) ( not ( = ?auto_520895 ?auto_520902 ) ) ( not ( = ?auto_520895 ?auto_520903 ) ) ( not ( = ?auto_520895 ?auto_520904 ) ) ( not ( = ?auto_520895 ?auto_520905 ) ) ( not ( = ?auto_520895 ?auto_520906 ) ) ( not ( = ?auto_520895 ?auto_520907 ) ) ( not ( = ?auto_520895 ?auto_520908 ) ) ( not ( = ?auto_520896 ?auto_520897 ) ) ( not ( = ?auto_520896 ?auto_520898 ) ) ( not ( = ?auto_520896 ?auto_520899 ) ) ( not ( = ?auto_520896 ?auto_520900 ) ) ( not ( = ?auto_520896 ?auto_520901 ) ) ( not ( = ?auto_520896 ?auto_520902 ) ) ( not ( = ?auto_520896 ?auto_520903 ) ) ( not ( = ?auto_520896 ?auto_520904 ) ) ( not ( = ?auto_520896 ?auto_520905 ) ) ( not ( = ?auto_520896 ?auto_520906 ) ) ( not ( = ?auto_520896 ?auto_520907 ) ) ( not ( = ?auto_520896 ?auto_520908 ) ) ( not ( = ?auto_520897 ?auto_520898 ) ) ( not ( = ?auto_520897 ?auto_520899 ) ) ( not ( = ?auto_520897 ?auto_520900 ) ) ( not ( = ?auto_520897 ?auto_520901 ) ) ( not ( = ?auto_520897 ?auto_520902 ) ) ( not ( = ?auto_520897 ?auto_520903 ) ) ( not ( = ?auto_520897 ?auto_520904 ) ) ( not ( = ?auto_520897 ?auto_520905 ) ) ( not ( = ?auto_520897 ?auto_520906 ) ) ( not ( = ?auto_520897 ?auto_520907 ) ) ( not ( = ?auto_520897 ?auto_520908 ) ) ( not ( = ?auto_520898 ?auto_520899 ) ) ( not ( = ?auto_520898 ?auto_520900 ) ) ( not ( = ?auto_520898 ?auto_520901 ) ) ( not ( = ?auto_520898 ?auto_520902 ) ) ( not ( = ?auto_520898 ?auto_520903 ) ) ( not ( = ?auto_520898 ?auto_520904 ) ) ( not ( = ?auto_520898 ?auto_520905 ) ) ( not ( = ?auto_520898 ?auto_520906 ) ) ( not ( = ?auto_520898 ?auto_520907 ) ) ( not ( = ?auto_520898 ?auto_520908 ) ) ( not ( = ?auto_520899 ?auto_520900 ) ) ( not ( = ?auto_520899 ?auto_520901 ) ) ( not ( = ?auto_520899 ?auto_520902 ) ) ( not ( = ?auto_520899 ?auto_520903 ) ) ( not ( = ?auto_520899 ?auto_520904 ) ) ( not ( = ?auto_520899 ?auto_520905 ) ) ( not ( = ?auto_520899 ?auto_520906 ) ) ( not ( = ?auto_520899 ?auto_520907 ) ) ( not ( = ?auto_520899 ?auto_520908 ) ) ( not ( = ?auto_520900 ?auto_520901 ) ) ( not ( = ?auto_520900 ?auto_520902 ) ) ( not ( = ?auto_520900 ?auto_520903 ) ) ( not ( = ?auto_520900 ?auto_520904 ) ) ( not ( = ?auto_520900 ?auto_520905 ) ) ( not ( = ?auto_520900 ?auto_520906 ) ) ( not ( = ?auto_520900 ?auto_520907 ) ) ( not ( = ?auto_520900 ?auto_520908 ) ) ( not ( = ?auto_520901 ?auto_520902 ) ) ( not ( = ?auto_520901 ?auto_520903 ) ) ( not ( = ?auto_520901 ?auto_520904 ) ) ( not ( = ?auto_520901 ?auto_520905 ) ) ( not ( = ?auto_520901 ?auto_520906 ) ) ( not ( = ?auto_520901 ?auto_520907 ) ) ( not ( = ?auto_520901 ?auto_520908 ) ) ( not ( = ?auto_520902 ?auto_520903 ) ) ( not ( = ?auto_520902 ?auto_520904 ) ) ( not ( = ?auto_520902 ?auto_520905 ) ) ( not ( = ?auto_520902 ?auto_520906 ) ) ( not ( = ?auto_520902 ?auto_520907 ) ) ( not ( = ?auto_520902 ?auto_520908 ) ) ( not ( = ?auto_520903 ?auto_520904 ) ) ( not ( = ?auto_520903 ?auto_520905 ) ) ( not ( = ?auto_520903 ?auto_520906 ) ) ( not ( = ?auto_520903 ?auto_520907 ) ) ( not ( = ?auto_520903 ?auto_520908 ) ) ( not ( = ?auto_520904 ?auto_520905 ) ) ( not ( = ?auto_520904 ?auto_520906 ) ) ( not ( = ?auto_520904 ?auto_520907 ) ) ( not ( = ?auto_520904 ?auto_520908 ) ) ( not ( = ?auto_520905 ?auto_520906 ) ) ( not ( = ?auto_520905 ?auto_520907 ) ) ( not ( = ?auto_520905 ?auto_520908 ) ) ( not ( = ?auto_520906 ?auto_520907 ) ) ( not ( = ?auto_520906 ?auto_520908 ) ) ( not ( = ?auto_520907 ?auto_520908 ) ) ( ON ?auto_520907 ?auto_520908 ) ( ON ?auto_520906 ?auto_520907 ) ( ON ?auto_520905 ?auto_520906 ) ( ON ?auto_520904 ?auto_520905 ) ( ON ?auto_520903 ?auto_520904 ) ( ON ?auto_520902 ?auto_520903 ) ( ON ?auto_520901 ?auto_520902 ) ( CLEAR ?auto_520899 ) ( ON ?auto_520900 ?auto_520901 ) ( CLEAR ?auto_520900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_520893 ?auto_520894 ?auto_520895 ?auto_520896 ?auto_520897 ?auto_520898 ?auto_520899 ?auto_520900 )
      ( MAKE-16PILE ?auto_520893 ?auto_520894 ?auto_520895 ?auto_520896 ?auto_520897 ?auto_520898 ?auto_520899 ?auto_520900 ?auto_520901 ?auto_520902 ?auto_520903 ?auto_520904 ?auto_520905 ?auto_520906 ?auto_520907 ?auto_520908 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520925 - BLOCK
      ?auto_520926 - BLOCK
      ?auto_520927 - BLOCK
      ?auto_520928 - BLOCK
      ?auto_520929 - BLOCK
      ?auto_520930 - BLOCK
      ?auto_520931 - BLOCK
      ?auto_520932 - BLOCK
      ?auto_520933 - BLOCK
      ?auto_520934 - BLOCK
      ?auto_520935 - BLOCK
      ?auto_520936 - BLOCK
      ?auto_520937 - BLOCK
      ?auto_520938 - BLOCK
      ?auto_520939 - BLOCK
      ?auto_520940 - BLOCK
    )
    :vars
    (
      ?auto_520941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_520940 ?auto_520941 ) ( ON-TABLE ?auto_520925 ) ( ON ?auto_520926 ?auto_520925 ) ( ON ?auto_520927 ?auto_520926 ) ( ON ?auto_520928 ?auto_520927 ) ( ON ?auto_520929 ?auto_520928 ) ( ON ?auto_520930 ?auto_520929 ) ( not ( = ?auto_520925 ?auto_520926 ) ) ( not ( = ?auto_520925 ?auto_520927 ) ) ( not ( = ?auto_520925 ?auto_520928 ) ) ( not ( = ?auto_520925 ?auto_520929 ) ) ( not ( = ?auto_520925 ?auto_520930 ) ) ( not ( = ?auto_520925 ?auto_520931 ) ) ( not ( = ?auto_520925 ?auto_520932 ) ) ( not ( = ?auto_520925 ?auto_520933 ) ) ( not ( = ?auto_520925 ?auto_520934 ) ) ( not ( = ?auto_520925 ?auto_520935 ) ) ( not ( = ?auto_520925 ?auto_520936 ) ) ( not ( = ?auto_520925 ?auto_520937 ) ) ( not ( = ?auto_520925 ?auto_520938 ) ) ( not ( = ?auto_520925 ?auto_520939 ) ) ( not ( = ?auto_520925 ?auto_520940 ) ) ( not ( = ?auto_520925 ?auto_520941 ) ) ( not ( = ?auto_520926 ?auto_520927 ) ) ( not ( = ?auto_520926 ?auto_520928 ) ) ( not ( = ?auto_520926 ?auto_520929 ) ) ( not ( = ?auto_520926 ?auto_520930 ) ) ( not ( = ?auto_520926 ?auto_520931 ) ) ( not ( = ?auto_520926 ?auto_520932 ) ) ( not ( = ?auto_520926 ?auto_520933 ) ) ( not ( = ?auto_520926 ?auto_520934 ) ) ( not ( = ?auto_520926 ?auto_520935 ) ) ( not ( = ?auto_520926 ?auto_520936 ) ) ( not ( = ?auto_520926 ?auto_520937 ) ) ( not ( = ?auto_520926 ?auto_520938 ) ) ( not ( = ?auto_520926 ?auto_520939 ) ) ( not ( = ?auto_520926 ?auto_520940 ) ) ( not ( = ?auto_520926 ?auto_520941 ) ) ( not ( = ?auto_520927 ?auto_520928 ) ) ( not ( = ?auto_520927 ?auto_520929 ) ) ( not ( = ?auto_520927 ?auto_520930 ) ) ( not ( = ?auto_520927 ?auto_520931 ) ) ( not ( = ?auto_520927 ?auto_520932 ) ) ( not ( = ?auto_520927 ?auto_520933 ) ) ( not ( = ?auto_520927 ?auto_520934 ) ) ( not ( = ?auto_520927 ?auto_520935 ) ) ( not ( = ?auto_520927 ?auto_520936 ) ) ( not ( = ?auto_520927 ?auto_520937 ) ) ( not ( = ?auto_520927 ?auto_520938 ) ) ( not ( = ?auto_520927 ?auto_520939 ) ) ( not ( = ?auto_520927 ?auto_520940 ) ) ( not ( = ?auto_520927 ?auto_520941 ) ) ( not ( = ?auto_520928 ?auto_520929 ) ) ( not ( = ?auto_520928 ?auto_520930 ) ) ( not ( = ?auto_520928 ?auto_520931 ) ) ( not ( = ?auto_520928 ?auto_520932 ) ) ( not ( = ?auto_520928 ?auto_520933 ) ) ( not ( = ?auto_520928 ?auto_520934 ) ) ( not ( = ?auto_520928 ?auto_520935 ) ) ( not ( = ?auto_520928 ?auto_520936 ) ) ( not ( = ?auto_520928 ?auto_520937 ) ) ( not ( = ?auto_520928 ?auto_520938 ) ) ( not ( = ?auto_520928 ?auto_520939 ) ) ( not ( = ?auto_520928 ?auto_520940 ) ) ( not ( = ?auto_520928 ?auto_520941 ) ) ( not ( = ?auto_520929 ?auto_520930 ) ) ( not ( = ?auto_520929 ?auto_520931 ) ) ( not ( = ?auto_520929 ?auto_520932 ) ) ( not ( = ?auto_520929 ?auto_520933 ) ) ( not ( = ?auto_520929 ?auto_520934 ) ) ( not ( = ?auto_520929 ?auto_520935 ) ) ( not ( = ?auto_520929 ?auto_520936 ) ) ( not ( = ?auto_520929 ?auto_520937 ) ) ( not ( = ?auto_520929 ?auto_520938 ) ) ( not ( = ?auto_520929 ?auto_520939 ) ) ( not ( = ?auto_520929 ?auto_520940 ) ) ( not ( = ?auto_520929 ?auto_520941 ) ) ( not ( = ?auto_520930 ?auto_520931 ) ) ( not ( = ?auto_520930 ?auto_520932 ) ) ( not ( = ?auto_520930 ?auto_520933 ) ) ( not ( = ?auto_520930 ?auto_520934 ) ) ( not ( = ?auto_520930 ?auto_520935 ) ) ( not ( = ?auto_520930 ?auto_520936 ) ) ( not ( = ?auto_520930 ?auto_520937 ) ) ( not ( = ?auto_520930 ?auto_520938 ) ) ( not ( = ?auto_520930 ?auto_520939 ) ) ( not ( = ?auto_520930 ?auto_520940 ) ) ( not ( = ?auto_520930 ?auto_520941 ) ) ( not ( = ?auto_520931 ?auto_520932 ) ) ( not ( = ?auto_520931 ?auto_520933 ) ) ( not ( = ?auto_520931 ?auto_520934 ) ) ( not ( = ?auto_520931 ?auto_520935 ) ) ( not ( = ?auto_520931 ?auto_520936 ) ) ( not ( = ?auto_520931 ?auto_520937 ) ) ( not ( = ?auto_520931 ?auto_520938 ) ) ( not ( = ?auto_520931 ?auto_520939 ) ) ( not ( = ?auto_520931 ?auto_520940 ) ) ( not ( = ?auto_520931 ?auto_520941 ) ) ( not ( = ?auto_520932 ?auto_520933 ) ) ( not ( = ?auto_520932 ?auto_520934 ) ) ( not ( = ?auto_520932 ?auto_520935 ) ) ( not ( = ?auto_520932 ?auto_520936 ) ) ( not ( = ?auto_520932 ?auto_520937 ) ) ( not ( = ?auto_520932 ?auto_520938 ) ) ( not ( = ?auto_520932 ?auto_520939 ) ) ( not ( = ?auto_520932 ?auto_520940 ) ) ( not ( = ?auto_520932 ?auto_520941 ) ) ( not ( = ?auto_520933 ?auto_520934 ) ) ( not ( = ?auto_520933 ?auto_520935 ) ) ( not ( = ?auto_520933 ?auto_520936 ) ) ( not ( = ?auto_520933 ?auto_520937 ) ) ( not ( = ?auto_520933 ?auto_520938 ) ) ( not ( = ?auto_520933 ?auto_520939 ) ) ( not ( = ?auto_520933 ?auto_520940 ) ) ( not ( = ?auto_520933 ?auto_520941 ) ) ( not ( = ?auto_520934 ?auto_520935 ) ) ( not ( = ?auto_520934 ?auto_520936 ) ) ( not ( = ?auto_520934 ?auto_520937 ) ) ( not ( = ?auto_520934 ?auto_520938 ) ) ( not ( = ?auto_520934 ?auto_520939 ) ) ( not ( = ?auto_520934 ?auto_520940 ) ) ( not ( = ?auto_520934 ?auto_520941 ) ) ( not ( = ?auto_520935 ?auto_520936 ) ) ( not ( = ?auto_520935 ?auto_520937 ) ) ( not ( = ?auto_520935 ?auto_520938 ) ) ( not ( = ?auto_520935 ?auto_520939 ) ) ( not ( = ?auto_520935 ?auto_520940 ) ) ( not ( = ?auto_520935 ?auto_520941 ) ) ( not ( = ?auto_520936 ?auto_520937 ) ) ( not ( = ?auto_520936 ?auto_520938 ) ) ( not ( = ?auto_520936 ?auto_520939 ) ) ( not ( = ?auto_520936 ?auto_520940 ) ) ( not ( = ?auto_520936 ?auto_520941 ) ) ( not ( = ?auto_520937 ?auto_520938 ) ) ( not ( = ?auto_520937 ?auto_520939 ) ) ( not ( = ?auto_520937 ?auto_520940 ) ) ( not ( = ?auto_520937 ?auto_520941 ) ) ( not ( = ?auto_520938 ?auto_520939 ) ) ( not ( = ?auto_520938 ?auto_520940 ) ) ( not ( = ?auto_520938 ?auto_520941 ) ) ( not ( = ?auto_520939 ?auto_520940 ) ) ( not ( = ?auto_520939 ?auto_520941 ) ) ( not ( = ?auto_520940 ?auto_520941 ) ) ( ON ?auto_520939 ?auto_520940 ) ( ON ?auto_520938 ?auto_520939 ) ( ON ?auto_520937 ?auto_520938 ) ( ON ?auto_520936 ?auto_520937 ) ( ON ?auto_520935 ?auto_520936 ) ( ON ?auto_520934 ?auto_520935 ) ( ON ?auto_520933 ?auto_520934 ) ( ON ?auto_520932 ?auto_520933 ) ( CLEAR ?auto_520930 ) ( ON ?auto_520931 ?auto_520932 ) ( CLEAR ?auto_520931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_520925 ?auto_520926 ?auto_520927 ?auto_520928 ?auto_520929 ?auto_520930 ?auto_520931 )
      ( MAKE-16PILE ?auto_520925 ?auto_520926 ?auto_520927 ?auto_520928 ?auto_520929 ?auto_520930 ?auto_520931 ?auto_520932 ?auto_520933 ?auto_520934 ?auto_520935 ?auto_520936 ?auto_520937 ?auto_520938 ?auto_520939 ?auto_520940 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520958 - BLOCK
      ?auto_520959 - BLOCK
      ?auto_520960 - BLOCK
      ?auto_520961 - BLOCK
      ?auto_520962 - BLOCK
      ?auto_520963 - BLOCK
      ?auto_520964 - BLOCK
      ?auto_520965 - BLOCK
      ?auto_520966 - BLOCK
      ?auto_520967 - BLOCK
      ?auto_520968 - BLOCK
      ?auto_520969 - BLOCK
      ?auto_520970 - BLOCK
      ?auto_520971 - BLOCK
      ?auto_520972 - BLOCK
      ?auto_520973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_520973 ) ( ON-TABLE ?auto_520958 ) ( ON ?auto_520959 ?auto_520958 ) ( ON ?auto_520960 ?auto_520959 ) ( ON ?auto_520961 ?auto_520960 ) ( ON ?auto_520962 ?auto_520961 ) ( ON ?auto_520963 ?auto_520962 ) ( not ( = ?auto_520958 ?auto_520959 ) ) ( not ( = ?auto_520958 ?auto_520960 ) ) ( not ( = ?auto_520958 ?auto_520961 ) ) ( not ( = ?auto_520958 ?auto_520962 ) ) ( not ( = ?auto_520958 ?auto_520963 ) ) ( not ( = ?auto_520958 ?auto_520964 ) ) ( not ( = ?auto_520958 ?auto_520965 ) ) ( not ( = ?auto_520958 ?auto_520966 ) ) ( not ( = ?auto_520958 ?auto_520967 ) ) ( not ( = ?auto_520958 ?auto_520968 ) ) ( not ( = ?auto_520958 ?auto_520969 ) ) ( not ( = ?auto_520958 ?auto_520970 ) ) ( not ( = ?auto_520958 ?auto_520971 ) ) ( not ( = ?auto_520958 ?auto_520972 ) ) ( not ( = ?auto_520958 ?auto_520973 ) ) ( not ( = ?auto_520959 ?auto_520960 ) ) ( not ( = ?auto_520959 ?auto_520961 ) ) ( not ( = ?auto_520959 ?auto_520962 ) ) ( not ( = ?auto_520959 ?auto_520963 ) ) ( not ( = ?auto_520959 ?auto_520964 ) ) ( not ( = ?auto_520959 ?auto_520965 ) ) ( not ( = ?auto_520959 ?auto_520966 ) ) ( not ( = ?auto_520959 ?auto_520967 ) ) ( not ( = ?auto_520959 ?auto_520968 ) ) ( not ( = ?auto_520959 ?auto_520969 ) ) ( not ( = ?auto_520959 ?auto_520970 ) ) ( not ( = ?auto_520959 ?auto_520971 ) ) ( not ( = ?auto_520959 ?auto_520972 ) ) ( not ( = ?auto_520959 ?auto_520973 ) ) ( not ( = ?auto_520960 ?auto_520961 ) ) ( not ( = ?auto_520960 ?auto_520962 ) ) ( not ( = ?auto_520960 ?auto_520963 ) ) ( not ( = ?auto_520960 ?auto_520964 ) ) ( not ( = ?auto_520960 ?auto_520965 ) ) ( not ( = ?auto_520960 ?auto_520966 ) ) ( not ( = ?auto_520960 ?auto_520967 ) ) ( not ( = ?auto_520960 ?auto_520968 ) ) ( not ( = ?auto_520960 ?auto_520969 ) ) ( not ( = ?auto_520960 ?auto_520970 ) ) ( not ( = ?auto_520960 ?auto_520971 ) ) ( not ( = ?auto_520960 ?auto_520972 ) ) ( not ( = ?auto_520960 ?auto_520973 ) ) ( not ( = ?auto_520961 ?auto_520962 ) ) ( not ( = ?auto_520961 ?auto_520963 ) ) ( not ( = ?auto_520961 ?auto_520964 ) ) ( not ( = ?auto_520961 ?auto_520965 ) ) ( not ( = ?auto_520961 ?auto_520966 ) ) ( not ( = ?auto_520961 ?auto_520967 ) ) ( not ( = ?auto_520961 ?auto_520968 ) ) ( not ( = ?auto_520961 ?auto_520969 ) ) ( not ( = ?auto_520961 ?auto_520970 ) ) ( not ( = ?auto_520961 ?auto_520971 ) ) ( not ( = ?auto_520961 ?auto_520972 ) ) ( not ( = ?auto_520961 ?auto_520973 ) ) ( not ( = ?auto_520962 ?auto_520963 ) ) ( not ( = ?auto_520962 ?auto_520964 ) ) ( not ( = ?auto_520962 ?auto_520965 ) ) ( not ( = ?auto_520962 ?auto_520966 ) ) ( not ( = ?auto_520962 ?auto_520967 ) ) ( not ( = ?auto_520962 ?auto_520968 ) ) ( not ( = ?auto_520962 ?auto_520969 ) ) ( not ( = ?auto_520962 ?auto_520970 ) ) ( not ( = ?auto_520962 ?auto_520971 ) ) ( not ( = ?auto_520962 ?auto_520972 ) ) ( not ( = ?auto_520962 ?auto_520973 ) ) ( not ( = ?auto_520963 ?auto_520964 ) ) ( not ( = ?auto_520963 ?auto_520965 ) ) ( not ( = ?auto_520963 ?auto_520966 ) ) ( not ( = ?auto_520963 ?auto_520967 ) ) ( not ( = ?auto_520963 ?auto_520968 ) ) ( not ( = ?auto_520963 ?auto_520969 ) ) ( not ( = ?auto_520963 ?auto_520970 ) ) ( not ( = ?auto_520963 ?auto_520971 ) ) ( not ( = ?auto_520963 ?auto_520972 ) ) ( not ( = ?auto_520963 ?auto_520973 ) ) ( not ( = ?auto_520964 ?auto_520965 ) ) ( not ( = ?auto_520964 ?auto_520966 ) ) ( not ( = ?auto_520964 ?auto_520967 ) ) ( not ( = ?auto_520964 ?auto_520968 ) ) ( not ( = ?auto_520964 ?auto_520969 ) ) ( not ( = ?auto_520964 ?auto_520970 ) ) ( not ( = ?auto_520964 ?auto_520971 ) ) ( not ( = ?auto_520964 ?auto_520972 ) ) ( not ( = ?auto_520964 ?auto_520973 ) ) ( not ( = ?auto_520965 ?auto_520966 ) ) ( not ( = ?auto_520965 ?auto_520967 ) ) ( not ( = ?auto_520965 ?auto_520968 ) ) ( not ( = ?auto_520965 ?auto_520969 ) ) ( not ( = ?auto_520965 ?auto_520970 ) ) ( not ( = ?auto_520965 ?auto_520971 ) ) ( not ( = ?auto_520965 ?auto_520972 ) ) ( not ( = ?auto_520965 ?auto_520973 ) ) ( not ( = ?auto_520966 ?auto_520967 ) ) ( not ( = ?auto_520966 ?auto_520968 ) ) ( not ( = ?auto_520966 ?auto_520969 ) ) ( not ( = ?auto_520966 ?auto_520970 ) ) ( not ( = ?auto_520966 ?auto_520971 ) ) ( not ( = ?auto_520966 ?auto_520972 ) ) ( not ( = ?auto_520966 ?auto_520973 ) ) ( not ( = ?auto_520967 ?auto_520968 ) ) ( not ( = ?auto_520967 ?auto_520969 ) ) ( not ( = ?auto_520967 ?auto_520970 ) ) ( not ( = ?auto_520967 ?auto_520971 ) ) ( not ( = ?auto_520967 ?auto_520972 ) ) ( not ( = ?auto_520967 ?auto_520973 ) ) ( not ( = ?auto_520968 ?auto_520969 ) ) ( not ( = ?auto_520968 ?auto_520970 ) ) ( not ( = ?auto_520968 ?auto_520971 ) ) ( not ( = ?auto_520968 ?auto_520972 ) ) ( not ( = ?auto_520968 ?auto_520973 ) ) ( not ( = ?auto_520969 ?auto_520970 ) ) ( not ( = ?auto_520969 ?auto_520971 ) ) ( not ( = ?auto_520969 ?auto_520972 ) ) ( not ( = ?auto_520969 ?auto_520973 ) ) ( not ( = ?auto_520970 ?auto_520971 ) ) ( not ( = ?auto_520970 ?auto_520972 ) ) ( not ( = ?auto_520970 ?auto_520973 ) ) ( not ( = ?auto_520971 ?auto_520972 ) ) ( not ( = ?auto_520971 ?auto_520973 ) ) ( not ( = ?auto_520972 ?auto_520973 ) ) ( ON ?auto_520972 ?auto_520973 ) ( ON ?auto_520971 ?auto_520972 ) ( ON ?auto_520970 ?auto_520971 ) ( ON ?auto_520969 ?auto_520970 ) ( ON ?auto_520968 ?auto_520969 ) ( ON ?auto_520967 ?auto_520968 ) ( ON ?auto_520966 ?auto_520967 ) ( ON ?auto_520965 ?auto_520966 ) ( CLEAR ?auto_520963 ) ( ON ?auto_520964 ?auto_520965 ) ( CLEAR ?auto_520964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_520958 ?auto_520959 ?auto_520960 ?auto_520961 ?auto_520962 ?auto_520963 ?auto_520964 )
      ( MAKE-16PILE ?auto_520958 ?auto_520959 ?auto_520960 ?auto_520961 ?auto_520962 ?auto_520963 ?auto_520964 ?auto_520965 ?auto_520966 ?auto_520967 ?auto_520968 ?auto_520969 ?auto_520970 ?auto_520971 ?auto_520972 ?auto_520973 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_520990 - BLOCK
      ?auto_520991 - BLOCK
      ?auto_520992 - BLOCK
      ?auto_520993 - BLOCK
      ?auto_520994 - BLOCK
      ?auto_520995 - BLOCK
      ?auto_520996 - BLOCK
      ?auto_520997 - BLOCK
      ?auto_520998 - BLOCK
      ?auto_520999 - BLOCK
      ?auto_521000 - BLOCK
      ?auto_521001 - BLOCK
      ?auto_521002 - BLOCK
      ?auto_521003 - BLOCK
      ?auto_521004 - BLOCK
      ?auto_521005 - BLOCK
    )
    :vars
    (
      ?auto_521006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521005 ?auto_521006 ) ( ON-TABLE ?auto_520990 ) ( ON ?auto_520991 ?auto_520990 ) ( ON ?auto_520992 ?auto_520991 ) ( ON ?auto_520993 ?auto_520992 ) ( ON ?auto_520994 ?auto_520993 ) ( not ( = ?auto_520990 ?auto_520991 ) ) ( not ( = ?auto_520990 ?auto_520992 ) ) ( not ( = ?auto_520990 ?auto_520993 ) ) ( not ( = ?auto_520990 ?auto_520994 ) ) ( not ( = ?auto_520990 ?auto_520995 ) ) ( not ( = ?auto_520990 ?auto_520996 ) ) ( not ( = ?auto_520990 ?auto_520997 ) ) ( not ( = ?auto_520990 ?auto_520998 ) ) ( not ( = ?auto_520990 ?auto_520999 ) ) ( not ( = ?auto_520990 ?auto_521000 ) ) ( not ( = ?auto_520990 ?auto_521001 ) ) ( not ( = ?auto_520990 ?auto_521002 ) ) ( not ( = ?auto_520990 ?auto_521003 ) ) ( not ( = ?auto_520990 ?auto_521004 ) ) ( not ( = ?auto_520990 ?auto_521005 ) ) ( not ( = ?auto_520990 ?auto_521006 ) ) ( not ( = ?auto_520991 ?auto_520992 ) ) ( not ( = ?auto_520991 ?auto_520993 ) ) ( not ( = ?auto_520991 ?auto_520994 ) ) ( not ( = ?auto_520991 ?auto_520995 ) ) ( not ( = ?auto_520991 ?auto_520996 ) ) ( not ( = ?auto_520991 ?auto_520997 ) ) ( not ( = ?auto_520991 ?auto_520998 ) ) ( not ( = ?auto_520991 ?auto_520999 ) ) ( not ( = ?auto_520991 ?auto_521000 ) ) ( not ( = ?auto_520991 ?auto_521001 ) ) ( not ( = ?auto_520991 ?auto_521002 ) ) ( not ( = ?auto_520991 ?auto_521003 ) ) ( not ( = ?auto_520991 ?auto_521004 ) ) ( not ( = ?auto_520991 ?auto_521005 ) ) ( not ( = ?auto_520991 ?auto_521006 ) ) ( not ( = ?auto_520992 ?auto_520993 ) ) ( not ( = ?auto_520992 ?auto_520994 ) ) ( not ( = ?auto_520992 ?auto_520995 ) ) ( not ( = ?auto_520992 ?auto_520996 ) ) ( not ( = ?auto_520992 ?auto_520997 ) ) ( not ( = ?auto_520992 ?auto_520998 ) ) ( not ( = ?auto_520992 ?auto_520999 ) ) ( not ( = ?auto_520992 ?auto_521000 ) ) ( not ( = ?auto_520992 ?auto_521001 ) ) ( not ( = ?auto_520992 ?auto_521002 ) ) ( not ( = ?auto_520992 ?auto_521003 ) ) ( not ( = ?auto_520992 ?auto_521004 ) ) ( not ( = ?auto_520992 ?auto_521005 ) ) ( not ( = ?auto_520992 ?auto_521006 ) ) ( not ( = ?auto_520993 ?auto_520994 ) ) ( not ( = ?auto_520993 ?auto_520995 ) ) ( not ( = ?auto_520993 ?auto_520996 ) ) ( not ( = ?auto_520993 ?auto_520997 ) ) ( not ( = ?auto_520993 ?auto_520998 ) ) ( not ( = ?auto_520993 ?auto_520999 ) ) ( not ( = ?auto_520993 ?auto_521000 ) ) ( not ( = ?auto_520993 ?auto_521001 ) ) ( not ( = ?auto_520993 ?auto_521002 ) ) ( not ( = ?auto_520993 ?auto_521003 ) ) ( not ( = ?auto_520993 ?auto_521004 ) ) ( not ( = ?auto_520993 ?auto_521005 ) ) ( not ( = ?auto_520993 ?auto_521006 ) ) ( not ( = ?auto_520994 ?auto_520995 ) ) ( not ( = ?auto_520994 ?auto_520996 ) ) ( not ( = ?auto_520994 ?auto_520997 ) ) ( not ( = ?auto_520994 ?auto_520998 ) ) ( not ( = ?auto_520994 ?auto_520999 ) ) ( not ( = ?auto_520994 ?auto_521000 ) ) ( not ( = ?auto_520994 ?auto_521001 ) ) ( not ( = ?auto_520994 ?auto_521002 ) ) ( not ( = ?auto_520994 ?auto_521003 ) ) ( not ( = ?auto_520994 ?auto_521004 ) ) ( not ( = ?auto_520994 ?auto_521005 ) ) ( not ( = ?auto_520994 ?auto_521006 ) ) ( not ( = ?auto_520995 ?auto_520996 ) ) ( not ( = ?auto_520995 ?auto_520997 ) ) ( not ( = ?auto_520995 ?auto_520998 ) ) ( not ( = ?auto_520995 ?auto_520999 ) ) ( not ( = ?auto_520995 ?auto_521000 ) ) ( not ( = ?auto_520995 ?auto_521001 ) ) ( not ( = ?auto_520995 ?auto_521002 ) ) ( not ( = ?auto_520995 ?auto_521003 ) ) ( not ( = ?auto_520995 ?auto_521004 ) ) ( not ( = ?auto_520995 ?auto_521005 ) ) ( not ( = ?auto_520995 ?auto_521006 ) ) ( not ( = ?auto_520996 ?auto_520997 ) ) ( not ( = ?auto_520996 ?auto_520998 ) ) ( not ( = ?auto_520996 ?auto_520999 ) ) ( not ( = ?auto_520996 ?auto_521000 ) ) ( not ( = ?auto_520996 ?auto_521001 ) ) ( not ( = ?auto_520996 ?auto_521002 ) ) ( not ( = ?auto_520996 ?auto_521003 ) ) ( not ( = ?auto_520996 ?auto_521004 ) ) ( not ( = ?auto_520996 ?auto_521005 ) ) ( not ( = ?auto_520996 ?auto_521006 ) ) ( not ( = ?auto_520997 ?auto_520998 ) ) ( not ( = ?auto_520997 ?auto_520999 ) ) ( not ( = ?auto_520997 ?auto_521000 ) ) ( not ( = ?auto_520997 ?auto_521001 ) ) ( not ( = ?auto_520997 ?auto_521002 ) ) ( not ( = ?auto_520997 ?auto_521003 ) ) ( not ( = ?auto_520997 ?auto_521004 ) ) ( not ( = ?auto_520997 ?auto_521005 ) ) ( not ( = ?auto_520997 ?auto_521006 ) ) ( not ( = ?auto_520998 ?auto_520999 ) ) ( not ( = ?auto_520998 ?auto_521000 ) ) ( not ( = ?auto_520998 ?auto_521001 ) ) ( not ( = ?auto_520998 ?auto_521002 ) ) ( not ( = ?auto_520998 ?auto_521003 ) ) ( not ( = ?auto_520998 ?auto_521004 ) ) ( not ( = ?auto_520998 ?auto_521005 ) ) ( not ( = ?auto_520998 ?auto_521006 ) ) ( not ( = ?auto_520999 ?auto_521000 ) ) ( not ( = ?auto_520999 ?auto_521001 ) ) ( not ( = ?auto_520999 ?auto_521002 ) ) ( not ( = ?auto_520999 ?auto_521003 ) ) ( not ( = ?auto_520999 ?auto_521004 ) ) ( not ( = ?auto_520999 ?auto_521005 ) ) ( not ( = ?auto_520999 ?auto_521006 ) ) ( not ( = ?auto_521000 ?auto_521001 ) ) ( not ( = ?auto_521000 ?auto_521002 ) ) ( not ( = ?auto_521000 ?auto_521003 ) ) ( not ( = ?auto_521000 ?auto_521004 ) ) ( not ( = ?auto_521000 ?auto_521005 ) ) ( not ( = ?auto_521000 ?auto_521006 ) ) ( not ( = ?auto_521001 ?auto_521002 ) ) ( not ( = ?auto_521001 ?auto_521003 ) ) ( not ( = ?auto_521001 ?auto_521004 ) ) ( not ( = ?auto_521001 ?auto_521005 ) ) ( not ( = ?auto_521001 ?auto_521006 ) ) ( not ( = ?auto_521002 ?auto_521003 ) ) ( not ( = ?auto_521002 ?auto_521004 ) ) ( not ( = ?auto_521002 ?auto_521005 ) ) ( not ( = ?auto_521002 ?auto_521006 ) ) ( not ( = ?auto_521003 ?auto_521004 ) ) ( not ( = ?auto_521003 ?auto_521005 ) ) ( not ( = ?auto_521003 ?auto_521006 ) ) ( not ( = ?auto_521004 ?auto_521005 ) ) ( not ( = ?auto_521004 ?auto_521006 ) ) ( not ( = ?auto_521005 ?auto_521006 ) ) ( ON ?auto_521004 ?auto_521005 ) ( ON ?auto_521003 ?auto_521004 ) ( ON ?auto_521002 ?auto_521003 ) ( ON ?auto_521001 ?auto_521002 ) ( ON ?auto_521000 ?auto_521001 ) ( ON ?auto_520999 ?auto_521000 ) ( ON ?auto_520998 ?auto_520999 ) ( ON ?auto_520997 ?auto_520998 ) ( ON ?auto_520996 ?auto_520997 ) ( CLEAR ?auto_520994 ) ( ON ?auto_520995 ?auto_520996 ) ( CLEAR ?auto_520995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_520990 ?auto_520991 ?auto_520992 ?auto_520993 ?auto_520994 ?auto_520995 )
      ( MAKE-16PILE ?auto_520990 ?auto_520991 ?auto_520992 ?auto_520993 ?auto_520994 ?auto_520995 ?auto_520996 ?auto_520997 ?auto_520998 ?auto_520999 ?auto_521000 ?auto_521001 ?auto_521002 ?auto_521003 ?auto_521004 ?auto_521005 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521023 - BLOCK
      ?auto_521024 - BLOCK
      ?auto_521025 - BLOCK
      ?auto_521026 - BLOCK
      ?auto_521027 - BLOCK
      ?auto_521028 - BLOCK
      ?auto_521029 - BLOCK
      ?auto_521030 - BLOCK
      ?auto_521031 - BLOCK
      ?auto_521032 - BLOCK
      ?auto_521033 - BLOCK
      ?auto_521034 - BLOCK
      ?auto_521035 - BLOCK
      ?auto_521036 - BLOCK
      ?auto_521037 - BLOCK
      ?auto_521038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_521038 ) ( ON-TABLE ?auto_521023 ) ( ON ?auto_521024 ?auto_521023 ) ( ON ?auto_521025 ?auto_521024 ) ( ON ?auto_521026 ?auto_521025 ) ( ON ?auto_521027 ?auto_521026 ) ( not ( = ?auto_521023 ?auto_521024 ) ) ( not ( = ?auto_521023 ?auto_521025 ) ) ( not ( = ?auto_521023 ?auto_521026 ) ) ( not ( = ?auto_521023 ?auto_521027 ) ) ( not ( = ?auto_521023 ?auto_521028 ) ) ( not ( = ?auto_521023 ?auto_521029 ) ) ( not ( = ?auto_521023 ?auto_521030 ) ) ( not ( = ?auto_521023 ?auto_521031 ) ) ( not ( = ?auto_521023 ?auto_521032 ) ) ( not ( = ?auto_521023 ?auto_521033 ) ) ( not ( = ?auto_521023 ?auto_521034 ) ) ( not ( = ?auto_521023 ?auto_521035 ) ) ( not ( = ?auto_521023 ?auto_521036 ) ) ( not ( = ?auto_521023 ?auto_521037 ) ) ( not ( = ?auto_521023 ?auto_521038 ) ) ( not ( = ?auto_521024 ?auto_521025 ) ) ( not ( = ?auto_521024 ?auto_521026 ) ) ( not ( = ?auto_521024 ?auto_521027 ) ) ( not ( = ?auto_521024 ?auto_521028 ) ) ( not ( = ?auto_521024 ?auto_521029 ) ) ( not ( = ?auto_521024 ?auto_521030 ) ) ( not ( = ?auto_521024 ?auto_521031 ) ) ( not ( = ?auto_521024 ?auto_521032 ) ) ( not ( = ?auto_521024 ?auto_521033 ) ) ( not ( = ?auto_521024 ?auto_521034 ) ) ( not ( = ?auto_521024 ?auto_521035 ) ) ( not ( = ?auto_521024 ?auto_521036 ) ) ( not ( = ?auto_521024 ?auto_521037 ) ) ( not ( = ?auto_521024 ?auto_521038 ) ) ( not ( = ?auto_521025 ?auto_521026 ) ) ( not ( = ?auto_521025 ?auto_521027 ) ) ( not ( = ?auto_521025 ?auto_521028 ) ) ( not ( = ?auto_521025 ?auto_521029 ) ) ( not ( = ?auto_521025 ?auto_521030 ) ) ( not ( = ?auto_521025 ?auto_521031 ) ) ( not ( = ?auto_521025 ?auto_521032 ) ) ( not ( = ?auto_521025 ?auto_521033 ) ) ( not ( = ?auto_521025 ?auto_521034 ) ) ( not ( = ?auto_521025 ?auto_521035 ) ) ( not ( = ?auto_521025 ?auto_521036 ) ) ( not ( = ?auto_521025 ?auto_521037 ) ) ( not ( = ?auto_521025 ?auto_521038 ) ) ( not ( = ?auto_521026 ?auto_521027 ) ) ( not ( = ?auto_521026 ?auto_521028 ) ) ( not ( = ?auto_521026 ?auto_521029 ) ) ( not ( = ?auto_521026 ?auto_521030 ) ) ( not ( = ?auto_521026 ?auto_521031 ) ) ( not ( = ?auto_521026 ?auto_521032 ) ) ( not ( = ?auto_521026 ?auto_521033 ) ) ( not ( = ?auto_521026 ?auto_521034 ) ) ( not ( = ?auto_521026 ?auto_521035 ) ) ( not ( = ?auto_521026 ?auto_521036 ) ) ( not ( = ?auto_521026 ?auto_521037 ) ) ( not ( = ?auto_521026 ?auto_521038 ) ) ( not ( = ?auto_521027 ?auto_521028 ) ) ( not ( = ?auto_521027 ?auto_521029 ) ) ( not ( = ?auto_521027 ?auto_521030 ) ) ( not ( = ?auto_521027 ?auto_521031 ) ) ( not ( = ?auto_521027 ?auto_521032 ) ) ( not ( = ?auto_521027 ?auto_521033 ) ) ( not ( = ?auto_521027 ?auto_521034 ) ) ( not ( = ?auto_521027 ?auto_521035 ) ) ( not ( = ?auto_521027 ?auto_521036 ) ) ( not ( = ?auto_521027 ?auto_521037 ) ) ( not ( = ?auto_521027 ?auto_521038 ) ) ( not ( = ?auto_521028 ?auto_521029 ) ) ( not ( = ?auto_521028 ?auto_521030 ) ) ( not ( = ?auto_521028 ?auto_521031 ) ) ( not ( = ?auto_521028 ?auto_521032 ) ) ( not ( = ?auto_521028 ?auto_521033 ) ) ( not ( = ?auto_521028 ?auto_521034 ) ) ( not ( = ?auto_521028 ?auto_521035 ) ) ( not ( = ?auto_521028 ?auto_521036 ) ) ( not ( = ?auto_521028 ?auto_521037 ) ) ( not ( = ?auto_521028 ?auto_521038 ) ) ( not ( = ?auto_521029 ?auto_521030 ) ) ( not ( = ?auto_521029 ?auto_521031 ) ) ( not ( = ?auto_521029 ?auto_521032 ) ) ( not ( = ?auto_521029 ?auto_521033 ) ) ( not ( = ?auto_521029 ?auto_521034 ) ) ( not ( = ?auto_521029 ?auto_521035 ) ) ( not ( = ?auto_521029 ?auto_521036 ) ) ( not ( = ?auto_521029 ?auto_521037 ) ) ( not ( = ?auto_521029 ?auto_521038 ) ) ( not ( = ?auto_521030 ?auto_521031 ) ) ( not ( = ?auto_521030 ?auto_521032 ) ) ( not ( = ?auto_521030 ?auto_521033 ) ) ( not ( = ?auto_521030 ?auto_521034 ) ) ( not ( = ?auto_521030 ?auto_521035 ) ) ( not ( = ?auto_521030 ?auto_521036 ) ) ( not ( = ?auto_521030 ?auto_521037 ) ) ( not ( = ?auto_521030 ?auto_521038 ) ) ( not ( = ?auto_521031 ?auto_521032 ) ) ( not ( = ?auto_521031 ?auto_521033 ) ) ( not ( = ?auto_521031 ?auto_521034 ) ) ( not ( = ?auto_521031 ?auto_521035 ) ) ( not ( = ?auto_521031 ?auto_521036 ) ) ( not ( = ?auto_521031 ?auto_521037 ) ) ( not ( = ?auto_521031 ?auto_521038 ) ) ( not ( = ?auto_521032 ?auto_521033 ) ) ( not ( = ?auto_521032 ?auto_521034 ) ) ( not ( = ?auto_521032 ?auto_521035 ) ) ( not ( = ?auto_521032 ?auto_521036 ) ) ( not ( = ?auto_521032 ?auto_521037 ) ) ( not ( = ?auto_521032 ?auto_521038 ) ) ( not ( = ?auto_521033 ?auto_521034 ) ) ( not ( = ?auto_521033 ?auto_521035 ) ) ( not ( = ?auto_521033 ?auto_521036 ) ) ( not ( = ?auto_521033 ?auto_521037 ) ) ( not ( = ?auto_521033 ?auto_521038 ) ) ( not ( = ?auto_521034 ?auto_521035 ) ) ( not ( = ?auto_521034 ?auto_521036 ) ) ( not ( = ?auto_521034 ?auto_521037 ) ) ( not ( = ?auto_521034 ?auto_521038 ) ) ( not ( = ?auto_521035 ?auto_521036 ) ) ( not ( = ?auto_521035 ?auto_521037 ) ) ( not ( = ?auto_521035 ?auto_521038 ) ) ( not ( = ?auto_521036 ?auto_521037 ) ) ( not ( = ?auto_521036 ?auto_521038 ) ) ( not ( = ?auto_521037 ?auto_521038 ) ) ( ON ?auto_521037 ?auto_521038 ) ( ON ?auto_521036 ?auto_521037 ) ( ON ?auto_521035 ?auto_521036 ) ( ON ?auto_521034 ?auto_521035 ) ( ON ?auto_521033 ?auto_521034 ) ( ON ?auto_521032 ?auto_521033 ) ( ON ?auto_521031 ?auto_521032 ) ( ON ?auto_521030 ?auto_521031 ) ( ON ?auto_521029 ?auto_521030 ) ( CLEAR ?auto_521027 ) ( ON ?auto_521028 ?auto_521029 ) ( CLEAR ?auto_521028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_521023 ?auto_521024 ?auto_521025 ?auto_521026 ?auto_521027 ?auto_521028 )
      ( MAKE-16PILE ?auto_521023 ?auto_521024 ?auto_521025 ?auto_521026 ?auto_521027 ?auto_521028 ?auto_521029 ?auto_521030 ?auto_521031 ?auto_521032 ?auto_521033 ?auto_521034 ?auto_521035 ?auto_521036 ?auto_521037 ?auto_521038 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521055 - BLOCK
      ?auto_521056 - BLOCK
      ?auto_521057 - BLOCK
      ?auto_521058 - BLOCK
      ?auto_521059 - BLOCK
      ?auto_521060 - BLOCK
      ?auto_521061 - BLOCK
      ?auto_521062 - BLOCK
      ?auto_521063 - BLOCK
      ?auto_521064 - BLOCK
      ?auto_521065 - BLOCK
      ?auto_521066 - BLOCK
      ?auto_521067 - BLOCK
      ?auto_521068 - BLOCK
      ?auto_521069 - BLOCK
      ?auto_521070 - BLOCK
    )
    :vars
    (
      ?auto_521071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521070 ?auto_521071 ) ( ON-TABLE ?auto_521055 ) ( ON ?auto_521056 ?auto_521055 ) ( ON ?auto_521057 ?auto_521056 ) ( ON ?auto_521058 ?auto_521057 ) ( not ( = ?auto_521055 ?auto_521056 ) ) ( not ( = ?auto_521055 ?auto_521057 ) ) ( not ( = ?auto_521055 ?auto_521058 ) ) ( not ( = ?auto_521055 ?auto_521059 ) ) ( not ( = ?auto_521055 ?auto_521060 ) ) ( not ( = ?auto_521055 ?auto_521061 ) ) ( not ( = ?auto_521055 ?auto_521062 ) ) ( not ( = ?auto_521055 ?auto_521063 ) ) ( not ( = ?auto_521055 ?auto_521064 ) ) ( not ( = ?auto_521055 ?auto_521065 ) ) ( not ( = ?auto_521055 ?auto_521066 ) ) ( not ( = ?auto_521055 ?auto_521067 ) ) ( not ( = ?auto_521055 ?auto_521068 ) ) ( not ( = ?auto_521055 ?auto_521069 ) ) ( not ( = ?auto_521055 ?auto_521070 ) ) ( not ( = ?auto_521055 ?auto_521071 ) ) ( not ( = ?auto_521056 ?auto_521057 ) ) ( not ( = ?auto_521056 ?auto_521058 ) ) ( not ( = ?auto_521056 ?auto_521059 ) ) ( not ( = ?auto_521056 ?auto_521060 ) ) ( not ( = ?auto_521056 ?auto_521061 ) ) ( not ( = ?auto_521056 ?auto_521062 ) ) ( not ( = ?auto_521056 ?auto_521063 ) ) ( not ( = ?auto_521056 ?auto_521064 ) ) ( not ( = ?auto_521056 ?auto_521065 ) ) ( not ( = ?auto_521056 ?auto_521066 ) ) ( not ( = ?auto_521056 ?auto_521067 ) ) ( not ( = ?auto_521056 ?auto_521068 ) ) ( not ( = ?auto_521056 ?auto_521069 ) ) ( not ( = ?auto_521056 ?auto_521070 ) ) ( not ( = ?auto_521056 ?auto_521071 ) ) ( not ( = ?auto_521057 ?auto_521058 ) ) ( not ( = ?auto_521057 ?auto_521059 ) ) ( not ( = ?auto_521057 ?auto_521060 ) ) ( not ( = ?auto_521057 ?auto_521061 ) ) ( not ( = ?auto_521057 ?auto_521062 ) ) ( not ( = ?auto_521057 ?auto_521063 ) ) ( not ( = ?auto_521057 ?auto_521064 ) ) ( not ( = ?auto_521057 ?auto_521065 ) ) ( not ( = ?auto_521057 ?auto_521066 ) ) ( not ( = ?auto_521057 ?auto_521067 ) ) ( not ( = ?auto_521057 ?auto_521068 ) ) ( not ( = ?auto_521057 ?auto_521069 ) ) ( not ( = ?auto_521057 ?auto_521070 ) ) ( not ( = ?auto_521057 ?auto_521071 ) ) ( not ( = ?auto_521058 ?auto_521059 ) ) ( not ( = ?auto_521058 ?auto_521060 ) ) ( not ( = ?auto_521058 ?auto_521061 ) ) ( not ( = ?auto_521058 ?auto_521062 ) ) ( not ( = ?auto_521058 ?auto_521063 ) ) ( not ( = ?auto_521058 ?auto_521064 ) ) ( not ( = ?auto_521058 ?auto_521065 ) ) ( not ( = ?auto_521058 ?auto_521066 ) ) ( not ( = ?auto_521058 ?auto_521067 ) ) ( not ( = ?auto_521058 ?auto_521068 ) ) ( not ( = ?auto_521058 ?auto_521069 ) ) ( not ( = ?auto_521058 ?auto_521070 ) ) ( not ( = ?auto_521058 ?auto_521071 ) ) ( not ( = ?auto_521059 ?auto_521060 ) ) ( not ( = ?auto_521059 ?auto_521061 ) ) ( not ( = ?auto_521059 ?auto_521062 ) ) ( not ( = ?auto_521059 ?auto_521063 ) ) ( not ( = ?auto_521059 ?auto_521064 ) ) ( not ( = ?auto_521059 ?auto_521065 ) ) ( not ( = ?auto_521059 ?auto_521066 ) ) ( not ( = ?auto_521059 ?auto_521067 ) ) ( not ( = ?auto_521059 ?auto_521068 ) ) ( not ( = ?auto_521059 ?auto_521069 ) ) ( not ( = ?auto_521059 ?auto_521070 ) ) ( not ( = ?auto_521059 ?auto_521071 ) ) ( not ( = ?auto_521060 ?auto_521061 ) ) ( not ( = ?auto_521060 ?auto_521062 ) ) ( not ( = ?auto_521060 ?auto_521063 ) ) ( not ( = ?auto_521060 ?auto_521064 ) ) ( not ( = ?auto_521060 ?auto_521065 ) ) ( not ( = ?auto_521060 ?auto_521066 ) ) ( not ( = ?auto_521060 ?auto_521067 ) ) ( not ( = ?auto_521060 ?auto_521068 ) ) ( not ( = ?auto_521060 ?auto_521069 ) ) ( not ( = ?auto_521060 ?auto_521070 ) ) ( not ( = ?auto_521060 ?auto_521071 ) ) ( not ( = ?auto_521061 ?auto_521062 ) ) ( not ( = ?auto_521061 ?auto_521063 ) ) ( not ( = ?auto_521061 ?auto_521064 ) ) ( not ( = ?auto_521061 ?auto_521065 ) ) ( not ( = ?auto_521061 ?auto_521066 ) ) ( not ( = ?auto_521061 ?auto_521067 ) ) ( not ( = ?auto_521061 ?auto_521068 ) ) ( not ( = ?auto_521061 ?auto_521069 ) ) ( not ( = ?auto_521061 ?auto_521070 ) ) ( not ( = ?auto_521061 ?auto_521071 ) ) ( not ( = ?auto_521062 ?auto_521063 ) ) ( not ( = ?auto_521062 ?auto_521064 ) ) ( not ( = ?auto_521062 ?auto_521065 ) ) ( not ( = ?auto_521062 ?auto_521066 ) ) ( not ( = ?auto_521062 ?auto_521067 ) ) ( not ( = ?auto_521062 ?auto_521068 ) ) ( not ( = ?auto_521062 ?auto_521069 ) ) ( not ( = ?auto_521062 ?auto_521070 ) ) ( not ( = ?auto_521062 ?auto_521071 ) ) ( not ( = ?auto_521063 ?auto_521064 ) ) ( not ( = ?auto_521063 ?auto_521065 ) ) ( not ( = ?auto_521063 ?auto_521066 ) ) ( not ( = ?auto_521063 ?auto_521067 ) ) ( not ( = ?auto_521063 ?auto_521068 ) ) ( not ( = ?auto_521063 ?auto_521069 ) ) ( not ( = ?auto_521063 ?auto_521070 ) ) ( not ( = ?auto_521063 ?auto_521071 ) ) ( not ( = ?auto_521064 ?auto_521065 ) ) ( not ( = ?auto_521064 ?auto_521066 ) ) ( not ( = ?auto_521064 ?auto_521067 ) ) ( not ( = ?auto_521064 ?auto_521068 ) ) ( not ( = ?auto_521064 ?auto_521069 ) ) ( not ( = ?auto_521064 ?auto_521070 ) ) ( not ( = ?auto_521064 ?auto_521071 ) ) ( not ( = ?auto_521065 ?auto_521066 ) ) ( not ( = ?auto_521065 ?auto_521067 ) ) ( not ( = ?auto_521065 ?auto_521068 ) ) ( not ( = ?auto_521065 ?auto_521069 ) ) ( not ( = ?auto_521065 ?auto_521070 ) ) ( not ( = ?auto_521065 ?auto_521071 ) ) ( not ( = ?auto_521066 ?auto_521067 ) ) ( not ( = ?auto_521066 ?auto_521068 ) ) ( not ( = ?auto_521066 ?auto_521069 ) ) ( not ( = ?auto_521066 ?auto_521070 ) ) ( not ( = ?auto_521066 ?auto_521071 ) ) ( not ( = ?auto_521067 ?auto_521068 ) ) ( not ( = ?auto_521067 ?auto_521069 ) ) ( not ( = ?auto_521067 ?auto_521070 ) ) ( not ( = ?auto_521067 ?auto_521071 ) ) ( not ( = ?auto_521068 ?auto_521069 ) ) ( not ( = ?auto_521068 ?auto_521070 ) ) ( not ( = ?auto_521068 ?auto_521071 ) ) ( not ( = ?auto_521069 ?auto_521070 ) ) ( not ( = ?auto_521069 ?auto_521071 ) ) ( not ( = ?auto_521070 ?auto_521071 ) ) ( ON ?auto_521069 ?auto_521070 ) ( ON ?auto_521068 ?auto_521069 ) ( ON ?auto_521067 ?auto_521068 ) ( ON ?auto_521066 ?auto_521067 ) ( ON ?auto_521065 ?auto_521066 ) ( ON ?auto_521064 ?auto_521065 ) ( ON ?auto_521063 ?auto_521064 ) ( ON ?auto_521062 ?auto_521063 ) ( ON ?auto_521061 ?auto_521062 ) ( ON ?auto_521060 ?auto_521061 ) ( CLEAR ?auto_521058 ) ( ON ?auto_521059 ?auto_521060 ) ( CLEAR ?auto_521059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_521055 ?auto_521056 ?auto_521057 ?auto_521058 ?auto_521059 )
      ( MAKE-16PILE ?auto_521055 ?auto_521056 ?auto_521057 ?auto_521058 ?auto_521059 ?auto_521060 ?auto_521061 ?auto_521062 ?auto_521063 ?auto_521064 ?auto_521065 ?auto_521066 ?auto_521067 ?auto_521068 ?auto_521069 ?auto_521070 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521088 - BLOCK
      ?auto_521089 - BLOCK
      ?auto_521090 - BLOCK
      ?auto_521091 - BLOCK
      ?auto_521092 - BLOCK
      ?auto_521093 - BLOCK
      ?auto_521094 - BLOCK
      ?auto_521095 - BLOCK
      ?auto_521096 - BLOCK
      ?auto_521097 - BLOCK
      ?auto_521098 - BLOCK
      ?auto_521099 - BLOCK
      ?auto_521100 - BLOCK
      ?auto_521101 - BLOCK
      ?auto_521102 - BLOCK
      ?auto_521103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_521103 ) ( ON-TABLE ?auto_521088 ) ( ON ?auto_521089 ?auto_521088 ) ( ON ?auto_521090 ?auto_521089 ) ( ON ?auto_521091 ?auto_521090 ) ( not ( = ?auto_521088 ?auto_521089 ) ) ( not ( = ?auto_521088 ?auto_521090 ) ) ( not ( = ?auto_521088 ?auto_521091 ) ) ( not ( = ?auto_521088 ?auto_521092 ) ) ( not ( = ?auto_521088 ?auto_521093 ) ) ( not ( = ?auto_521088 ?auto_521094 ) ) ( not ( = ?auto_521088 ?auto_521095 ) ) ( not ( = ?auto_521088 ?auto_521096 ) ) ( not ( = ?auto_521088 ?auto_521097 ) ) ( not ( = ?auto_521088 ?auto_521098 ) ) ( not ( = ?auto_521088 ?auto_521099 ) ) ( not ( = ?auto_521088 ?auto_521100 ) ) ( not ( = ?auto_521088 ?auto_521101 ) ) ( not ( = ?auto_521088 ?auto_521102 ) ) ( not ( = ?auto_521088 ?auto_521103 ) ) ( not ( = ?auto_521089 ?auto_521090 ) ) ( not ( = ?auto_521089 ?auto_521091 ) ) ( not ( = ?auto_521089 ?auto_521092 ) ) ( not ( = ?auto_521089 ?auto_521093 ) ) ( not ( = ?auto_521089 ?auto_521094 ) ) ( not ( = ?auto_521089 ?auto_521095 ) ) ( not ( = ?auto_521089 ?auto_521096 ) ) ( not ( = ?auto_521089 ?auto_521097 ) ) ( not ( = ?auto_521089 ?auto_521098 ) ) ( not ( = ?auto_521089 ?auto_521099 ) ) ( not ( = ?auto_521089 ?auto_521100 ) ) ( not ( = ?auto_521089 ?auto_521101 ) ) ( not ( = ?auto_521089 ?auto_521102 ) ) ( not ( = ?auto_521089 ?auto_521103 ) ) ( not ( = ?auto_521090 ?auto_521091 ) ) ( not ( = ?auto_521090 ?auto_521092 ) ) ( not ( = ?auto_521090 ?auto_521093 ) ) ( not ( = ?auto_521090 ?auto_521094 ) ) ( not ( = ?auto_521090 ?auto_521095 ) ) ( not ( = ?auto_521090 ?auto_521096 ) ) ( not ( = ?auto_521090 ?auto_521097 ) ) ( not ( = ?auto_521090 ?auto_521098 ) ) ( not ( = ?auto_521090 ?auto_521099 ) ) ( not ( = ?auto_521090 ?auto_521100 ) ) ( not ( = ?auto_521090 ?auto_521101 ) ) ( not ( = ?auto_521090 ?auto_521102 ) ) ( not ( = ?auto_521090 ?auto_521103 ) ) ( not ( = ?auto_521091 ?auto_521092 ) ) ( not ( = ?auto_521091 ?auto_521093 ) ) ( not ( = ?auto_521091 ?auto_521094 ) ) ( not ( = ?auto_521091 ?auto_521095 ) ) ( not ( = ?auto_521091 ?auto_521096 ) ) ( not ( = ?auto_521091 ?auto_521097 ) ) ( not ( = ?auto_521091 ?auto_521098 ) ) ( not ( = ?auto_521091 ?auto_521099 ) ) ( not ( = ?auto_521091 ?auto_521100 ) ) ( not ( = ?auto_521091 ?auto_521101 ) ) ( not ( = ?auto_521091 ?auto_521102 ) ) ( not ( = ?auto_521091 ?auto_521103 ) ) ( not ( = ?auto_521092 ?auto_521093 ) ) ( not ( = ?auto_521092 ?auto_521094 ) ) ( not ( = ?auto_521092 ?auto_521095 ) ) ( not ( = ?auto_521092 ?auto_521096 ) ) ( not ( = ?auto_521092 ?auto_521097 ) ) ( not ( = ?auto_521092 ?auto_521098 ) ) ( not ( = ?auto_521092 ?auto_521099 ) ) ( not ( = ?auto_521092 ?auto_521100 ) ) ( not ( = ?auto_521092 ?auto_521101 ) ) ( not ( = ?auto_521092 ?auto_521102 ) ) ( not ( = ?auto_521092 ?auto_521103 ) ) ( not ( = ?auto_521093 ?auto_521094 ) ) ( not ( = ?auto_521093 ?auto_521095 ) ) ( not ( = ?auto_521093 ?auto_521096 ) ) ( not ( = ?auto_521093 ?auto_521097 ) ) ( not ( = ?auto_521093 ?auto_521098 ) ) ( not ( = ?auto_521093 ?auto_521099 ) ) ( not ( = ?auto_521093 ?auto_521100 ) ) ( not ( = ?auto_521093 ?auto_521101 ) ) ( not ( = ?auto_521093 ?auto_521102 ) ) ( not ( = ?auto_521093 ?auto_521103 ) ) ( not ( = ?auto_521094 ?auto_521095 ) ) ( not ( = ?auto_521094 ?auto_521096 ) ) ( not ( = ?auto_521094 ?auto_521097 ) ) ( not ( = ?auto_521094 ?auto_521098 ) ) ( not ( = ?auto_521094 ?auto_521099 ) ) ( not ( = ?auto_521094 ?auto_521100 ) ) ( not ( = ?auto_521094 ?auto_521101 ) ) ( not ( = ?auto_521094 ?auto_521102 ) ) ( not ( = ?auto_521094 ?auto_521103 ) ) ( not ( = ?auto_521095 ?auto_521096 ) ) ( not ( = ?auto_521095 ?auto_521097 ) ) ( not ( = ?auto_521095 ?auto_521098 ) ) ( not ( = ?auto_521095 ?auto_521099 ) ) ( not ( = ?auto_521095 ?auto_521100 ) ) ( not ( = ?auto_521095 ?auto_521101 ) ) ( not ( = ?auto_521095 ?auto_521102 ) ) ( not ( = ?auto_521095 ?auto_521103 ) ) ( not ( = ?auto_521096 ?auto_521097 ) ) ( not ( = ?auto_521096 ?auto_521098 ) ) ( not ( = ?auto_521096 ?auto_521099 ) ) ( not ( = ?auto_521096 ?auto_521100 ) ) ( not ( = ?auto_521096 ?auto_521101 ) ) ( not ( = ?auto_521096 ?auto_521102 ) ) ( not ( = ?auto_521096 ?auto_521103 ) ) ( not ( = ?auto_521097 ?auto_521098 ) ) ( not ( = ?auto_521097 ?auto_521099 ) ) ( not ( = ?auto_521097 ?auto_521100 ) ) ( not ( = ?auto_521097 ?auto_521101 ) ) ( not ( = ?auto_521097 ?auto_521102 ) ) ( not ( = ?auto_521097 ?auto_521103 ) ) ( not ( = ?auto_521098 ?auto_521099 ) ) ( not ( = ?auto_521098 ?auto_521100 ) ) ( not ( = ?auto_521098 ?auto_521101 ) ) ( not ( = ?auto_521098 ?auto_521102 ) ) ( not ( = ?auto_521098 ?auto_521103 ) ) ( not ( = ?auto_521099 ?auto_521100 ) ) ( not ( = ?auto_521099 ?auto_521101 ) ) ( not ( = ?auto_521099 ?auto_521102 ) ) ( not ( = ?auto_521099 ?auto_521103 ) ) ( not ( = ?auto_521100 ?auto_521101 ) ) ( not ( = ?auto_521100 ?auto_521102 ) ) ( not ( = ?auto_521100 ?auto_521103 ) ) ( not ( = ?auto_521101 ?auto_521102 ) ) ( not ( = ?auto_521101 ?auto_521103 ) ) ( not ( = ?auto_521102 ?auto_521103 ) ) ( ON ?auto_521102 ?auto_521103 ) ( ON ?auto_521101 ?auto_521102 ) ( ON ?auto_521100 ?auto_521101 ) ( ON ?auto_521099 ?auto_521100 ) ( ON ?auto_521098 ?auto_521099 ) ( ON ?auto_521097 ?auto_521098 ) ( ON ?auto_521096 ?auto_521097 ) ( ON ?auto_521095 ?auto_521096 ) ( ON ?auto_521094 ?auto_521095 ) ( ON ?auto_521093 ?auto_521094 ) ( CLEAR ?auto_521091 ) ( ON ?auto_521092 ?auto_521093 ) ( CLEAR ?auto_521092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_521088 ?auto_521089 ?auto_521090 ?auto_521091 ?auto_521092 )
      ( MAKE-16PILE ?auto_521088 ?auto_521089 ?auto_521090 ?auto_521091 ?auto_521092 ?auto_521093 ?auto_521094 ?auto_521095 ?auto_521096 ?auto_521097 ?auto_521098 ?auto_521099 ?auto_521100 ?auto_521101 ?auto_521102 ?auto_521103 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521120 - BLOCK
      ?auto_521121 - BLOCK
      ?auto_521122 - BLOCK
      ?auto_521123 - BLOCK
      ?auto_521124 - BLOCK
      ?auto_521125 - BLOCK
      ?auto_521126 - BLOCK
      ?auto_521127 - BLOCK
      ?auto_521128 - BLOCK
      ?auto_521129 - BLOCK
      ?auto_521130 - BLOCK
      ?auto_521131 - BLOCK
      ?auto_521132 - BLOCK
      ?auto_521133 - BLOCK
      ?auto_521134 - BLOCK
      ?auto_521135 - BLOCK
    )
    :vars
    (
      ?auto_521136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521135 ?auto_521136 ) ( ON-TABLE ?auto_521120 ) ( ON ?auto_521121 ?auto_521120 ) ( ON ?auto_521122 ?auto_521121 ) ( not ( = ?auto_521120 ?auto_521121 ) ) ( not ( = ?auto_521120 ?auto_521122 ) ) ( not ( = ?auto_521120 ?auto_521123 ) ) ( not ( = ?auto_521120 ?auto_521124 ) ) ( not ( = ?auto_521120 ?auto_521125 ) ) ( not ( = ?auto_521120 ?auto_521126 ) ) ( not ( = ?auto_521120 ?auto_521127 ) ) ( not ( = ?auto_521120 ?auto_521128 ) ) ( not ( = ?auto_521120 ?auto_521129 ) ) ( not ( = ?auto_521120 ?auto_521130 ) ) ( not ( = ?auto_521120 ?auto_521131 ) ) ( not ( = ?auto_521120 ?auto_521132 ) ) ( not ( = ?auto_521120 ?auto_521133 ) ) ( not ( = ?auto_521120 ?auto_521134 ) ) ( not ( = ?auto_521120 ?auto_521135 ) ) ( not ( = ?auto_521120 ?auto_521136 ) ) ( not ( = ?auto_521121 ?auto_521122 ) ) ( not ( = ?auto_521121 ?auto_521123 ) ) ( not ( = ?auto_521121 ?auto_521124 ) ) ( not ( = ?auto_521121 ?auto_521125 ) ) ( not ( = ?auto_521121 ?auto_521126 ) ) ( not ( = ?auto_521121 ?auto_521127 ) ) ( not ( = ?auto_521121 ?auto_521128 ) ) ( not ( = ?auto_521121 ?auto_521129 ) ) ( not ( = ?auto_521121 ?auto_521130 ) ) ( not ( = ?auto_521121 ?auto_521131 ) ) ( not ( = ?auto_521121 ?auto_521132 ) ) ( not ( = ?auto_521121 ?auto_521133 ) ) ( not ( = ?auto_521121 ?auto_521134 ) ) ( not ( = ?auto_521121 ?auto_521135 ) ) ( not ( = ?auto_521121 ?auto_521136 ) ) ( not ( = ?auto_521122 ?auto_521123 ) ) ( not ( = ?auto_521122 ?auto_521124 ) ) ( not ( = ?auto_521122 ?auto_521125 ) ) ( not ( = ?auto_521122 ?auto_521126 ) ) ( not ( = ?auto_521122 ?auto_521127 ) ) ( not ( = ?auto_521122 ?auto_521128 ) ) ( not ( = ?auto_521122 ?auto_521129 ) ) ( not ( = ?auto_521122 ?auto_521130 ) ) ( not ( = ?auto_521122 ?auto_521131 ) ) ( not ( = ?auto_521122 ?auto_521132 ) ) ( not ( = ?auto_521122 ?auto_521133 ) ) ( not ( = ?auto_521122 ?auto_521134 ) ) ( not ( = ?auto_521122 ?auto_521135 ) ) ( not ( = ?auto_521122 ?auto_521136 ) ) ( not ( = ?auto_521123 ?auto_521124 ) ) ( not ( = ?auto_521123 ?auto_521125 ) ) ( not ( = ?auto_521123 ?auto_521126 ) ) ( not ( = ?auto_521123 ?auto_521127 ) ) ( not ( = ?auto_521123 ?auto_521128 ) ) ( not ( = ?auto_521123 ?auto_521129 ) ) ( not ( = ?auto_521123 ?auto_521130 ) ) ( not ( = ?auto_521123 ?auto_521131 ) ) ( not ( = ?auto_521123 ?auto_521132 ) ) ( not ( = ?auto_521123 ?auto_521133 ) ) ( not ( = ?auto_521123 ?auto_521134 ) ) ( not ( = ?auto_521123 ?auto_521135 ) ) ( not ( = ?auto_521123 ?auto_521136 ) ) ( not ( = ?auto_521124 ?auto_521125 ) ) ( not ( = ?auto_521124 ?auto_521126 ) ) ( not ( = ?auto_521124 ?auto_521127 ) ) ( not ( = ?auto_521124 ?auto_521128 ) ) ( not ( = ?auto_521124 ?auto_521129 ) ) ( not ( = ?auto_521124 ?auto_521130 ) ) ( not ( = ?auto_521124 ?auto_521131 ) ) ( not ( = ?auto_521124 ?auto_521132 ) ) ( not ( = ?auto_521124 ?auto_521133 ) ) ( not ( = ?auto_521124 ?auto_521134 ) ) ( not ( = ?auto_521124 ?auto_521135 ) ) ( not ( = ?auto_521124 ?auto_521136 ) ) ( not ( = ?auto_521125 ?auto_521126 ) ) ( not ( = ?auto_521125 ?auto_521127 ) ) ( not ( = ?auto_521125 ?auto_521128 ) ) ( not ( = ?auto_521125 ?auto_521129 ) ) ( not ( = ?auto_521125 ?auto_521130 ) ) ( not ( = ?auto_521125 ?auto_521131 ) ) ( not ( = ?auto_521125 ?auto_521132 ) ) ( not ( = ?auto_521125 ?auto_521133 ) ) ( not ( = ?auto_521125 ?auto_521134 ) ) ( not ( = ?auto_521125 ?auto_521135 ) ) ( not ( = ?auto_521125 ?auto_521136 ) ) ( not ( = ?auto_521126 ?auto_521127 ) ) ( not ( = ?auto_521126 ?auto_521128 ) ) ( not ( = ?auto_521126 ?auto_521129 ) ) ( not ( = ?auto_521126 ?auto_521130 ) ) ( not ( = ?auto_521126 ?auto_521131 ) ) ( not ( = ?auto_521126 ?auto_521132 ) ) ( not ( = ?auto_521126 ?auto_521133 ) ) ( not ( = ?auto_521126 ?auto_521134 ) ) ( not ( = ?auto_521126 ?auto_521135 ) ) ( not ( = ?auto_521126 ?auto_521136 ) ) ( not ( = ?auto_521127 ?auto_521128 ) ) ( not ( = ?auto_521127 ?auto_521129 ) ) ( not ( = ?auto_521127 ?auto_521130 ) ) ( not ( = ?auto_521127 ?auto_521131 ) ) ( not ( = ?auto_521127 ?auto_521132 ) ) ( not ( = ?auto_521127 ?auto_521133 ) ) ( not ( = ?auto_521127 ?auto_521134 ) ) ( not ( = ?auto_521127 ?auto_521135 ) ) ( not ( = ?auto_521127 ?auto_521136 ) ) ( not ( = ?auto_521128 ?auto_521129 ) ) ( not ( = ?auto_521128 ?auto_521130 ) ) ( not ( = ?auto_521128 ?auto_521131 ) ) ( not ( = ?auto_521128 ?auto_521132 ) ) ( not ( = ?auto_521128 ?auto_521133 ) ) ( not ( = ?auto_521128 ?auto_521134 ) ) ( not ( = ?auto_521128 ?auto_521135 ) ) ( not ( = ?auto_521128 ?auto_521136 ) ) ( not ( = ?auto_521129 ?auto_521130 ) ) ( not ( = ?auto_521129 ?auto_521131 ) ) ( not ( = ?auto_521129 ?auto_521132 ) ) ( not ( = ?auto_521129 ?auto_521133 ) ) ( not ( = ?auto_521129 ?auto_521134 ) ) ( not ( = ?auto_521129 ?auto_521135 ) ) ( not ( = ?auto_521129 ?auto_521136 ) ) ( not ( = ?auto_521130 ?auto_521131 ) ) ( not ( = ?auto_521130 ?auto_521132 ) ) ( not ( = ?auto_521130 ?auto_521133 ) ) ( not ( = ?auto_521130 ?auto_521134 ) ) ( not ( = ?auto_521130 ?auto_521135 ) ) ( not ( = ?auto_521130 ?auto_521136 ) ) ( not ( = ?auto_521131 ?auto_521132 ) ) ( not ( = ?auto_521131 ?auto_521133 ) ) ( not ( = ?auto_521131 ?auto_521134 ) ) ( not ( = ?auto_521131 ?auto_521135 ) ) ( not ( = ?auto_521131 ?auto_521136 ) ) ( not ( = ?auto_521132 ?auto_521133 ) ) ( not ( = ?auto_521132 ?auto_521134 ) ) ( not ( = ?auto_521132 ?auto_521135 ) ) ( not ( = ?auto_521132 ?auto_521136 ) ) ( not ( = ?auto_521133 ?auto_521134 ) ) ( not ( = ?auto_521133 ?auto_521135 ) ) ( not ( = ?auto_521133 ?auto_521136 ) ) ( not ( = ?auto_521134 ?auto_521135 ) ) ( not ( = ?auto_521134 ?auto_521136 ) ) ( not ( = ?auto_521135 ?auto_521136 ) ) ( ON ?auto_521134 ?auto_521135 ) ( ON ?auto_521133 ?auto_521134 ) ( ON ?auto_521132 ?auto_521133 ) ( ON ?auto_521131 ?auto_521132 ) ( ON ?auto_521130 ?auto_521131 ) ( ON ?auto_521129 ?auto_521130 ) ( ON ?auto_521128 ?auto_521129 ) ( ON ?auto_521127 ?auto_521128 ) ( ON ?auto_521126 ?auto_521127 ) ( ON ?auto_521125 ?auto_521126 ) ( ON ?auto_521124 ?auto_521125 ) ( CLEAR ?auto_521122 ) ( ON ?auto_521123 ?auto_521124 ) ( CLEAR ?auto_521123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_521120 ?auto_521121 ?auto_521122 ?auto_521123 )
      ( MAKE-16PILE ?auto_521120 ?auto_521121 ?auto_521122 ?auto_521123 ?auto_521124 ?auto_521125 ?auto_521126 ?auto_521127 ?auto_521128 ?auto_521129 ?auto_521130 ?auto_521131 ?auto_521132 ?auto_521133 ?auto_521134 ?auto_521135 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521153 - BLOCK
      ?auto_521154 - BLOCK
      ?auto_521155 - BLOCK
      ?auto_521156 - BLOCK
      ?auto_521157 - BLOCK
      ?auto_521158 - BLOCK
      ?auto_521159 - BLOCK
      ?auto_521160 - BLOCK
      ?auto_521161 - BLOCK
      ?auto_521162 - BLOCK
      ?auto_521163 - BLOCK
      ?auto_521164 - BLOCK
      ?auto_521165 - BLOCK
      ?auto_521166 - BLOCK
      ?auto_521167 - BLOCK
      ?auto_521168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_521168 ) ( ON-TABLE ?auto_521153 ) ( ON ?auto_521154 ?auto_521153 ) ( ON ?auto_521155 ?auto_521154 ) ( not ( = ?auto_521153 ?auto_521154 ) ) ( not ( = ?auto_521153 ?auto_521155 ) ) ( not ( = ?auto_521153 ?auto_521156 ) ) ( not ( = ?auto_521153 ?auto_521157 ) ) ( not ( = ?auto_521153 ?auto_521158 ) ) ( not ( = ?auto_521153 ?auto_521159 ) ) ( not ( = ?auto_521153 ?auto_521160 ) ) ( not ( = ?auto_521153 ?auto_521161 ) ) ( not ( = ?auto_521153 ?auto_521162 ) ) ( not ( = ?auto_521153 ?auto_521163 ) ) ( not ( = ?auto_521153 ?auto_521164 ) ) ( not ( = ?auto_521153 ?auto_521165 ) ) ( not ( = ?auto_521153 ?auto_521166 ) ) ( not ( = ?auto_521153 ?auto_521167 ) ) ( not ( = ?auto_521153 ?auto_521168 ) ) ( not ( = ?auto_521154 ?auto_521155 ) ) ( not ( = ?auto_521154 ?auto_521156 ) ) ( not ( = ?auto_521154 ?auto_521157 ) ) ( not ( = ?auto_521154 ?auto_521158 ) ) ( not ( = ?auto_521154 ?auto_521159 ) ) ( not ( = ?auto_521154 ?auto_521160 ) ) ( not ( = ?auto_521154 ?auto_521161 ) ) ( not ( = ?auto_521154 ?auto_521162 ) ) ( not ( = ?auto_521154 ?auto_521163 ) ) ( not ( = ?auto_521154 ?auto_521164 ) ) ( not ( = ?auto_521154 ?auto_521165 ) ) ( not ( = ?auto_521154 ?auto_521166 ) ) ( not ( = ?auto_521154 ?auto_521167 ) ) ( not ( = ?auto_521154 ?auto_521168 ) ) ( not ( = ?auto_521155 ?auto_521156 ) ) ( not ( = ?auto_521155 ?auto_521157 ) ) ( not ( = ?auto_521155 ?auto_521158 ) ) ( not ( = ?auto_521155 ?auto_521159 ) ) ( not ( = ?auto_521155 ?auto_521160 ) ) ( not ( = ?auto_521155 ?auto_521161 ) ) ( not ( = ?auto_521155 ?auto_521162 ) ) ( not ( = ?auto_521155 ?auto_521163 ) ) ( not ( = ?auto_521155 ?auto_521164 ) ) ( not ( = ?auto_521155 ?auto_521165 ) ) ( not ( = ?auto_521155 ?auto_521166 ) ) ( not ( = ?auto_521155 ?auto_521167 ) ) ( not ( = ?auto_521155 ?auto_521168 ) ) ( not ( = ?auto_521156 ?auto_521157 ) ) ( not ( = ?auto_521156 ?auto_521158 ) ) ( not ( = ?auto_521156 ?auto_521159 ) ) ( not ( = ?auto_521156 ?auto_521160 ) ) ( not ( = ?auto_521156 ?auto_521161 ) ) ( not ( = ?auto_521156 ?auto_521162 ) ) ( not ( = ?auto_521156 ?auto_521163 ) ) ( not ( = ?auto_521156 ?auto_521164 ) ) ( not ( = ?auto_521156 ?auto_521165 ) ) ( not ( = ?auto_521156 ?auto_521166 ) ) ( not ( = ?auto_521156 ?auto_521167 ) ) ( not ( = ?auto_521156 ?auto_521168 ) ) ( not ( = ?auto_521157 ?auto_521158 ) ) ( not ( = ?auto_521157 ?auto_521159 ) ) ( not ( = ?auto_521157 ?auto_521160 ) ) ( not ( = ?auto_521157 ?auto_521161 ) ) ( not ( = ?auto_521157 ?auto_521162 ) ) ( not ( = ?auto_521157 ?auto_521163 ) ) ( not ( = ?auto_521157 ?auto_521164 ) ) ( not ( = ?auto_521157 ?auto_521165 ) ) ( not ( = ?auto_521157 ?auto_521166 ) ) ( not ( = ?auto_521157 ?auto_521167 ) ) ( not ( = ?auto_521157 ?auto_521168 ) ) ( not ( = ?auto_521158 ?auto_521159 ) ) ( not ( = ?auto_521158 ?auto_521160 ) ) ( not ( = ?auto_521158 ?auto_521161 ) ) ( not ( = ?auto_521158 ?auto_521162 ) ) ( not ( = ?auto_521158 ?auto_521163 ) ) ( not ( = ?auto_521158 ?auto_521164 ) ) ( not ( = ?auto_521158 ?auto_521165 ) ) ( not ( = ?auto_521158 ?auto_521166 ) ) ( not ( = ?auto_521158 ?auto_521167 ) ) ( not ( = ?auto_521158 ?auto_521168 ) ) ( not ( = ?auto_521159 ?auto_521160 ) ) ( not ( = ?auto_521159 ?auto_521161 ) ) ( not ( = ?auto_521159 ?auto_521162 ) ) ( not ( = ?auto_521159 ?auto_521163 ) ) ( not ( = ?auto_521159 ?auto_521164 ) ) ( not ( = ?auto_521159 ?auto_521165 ) ) ( not ( = ?auto_521159 ?auto_521166 ) ) ( not ( = ?auto_521159 ?auto_521167 ) ) ( not ( = ?auto_521159 ?auto_521168 ) ) ( not ( = ?auto_521160 ?auto_521161 ) ) ( not ( = ?auto_521160 ?auto_521162 ) ) ( not ( = ?auto_521160 ?auto_521163 ) ) ( not ( = ?auto_521160 ?auto_521164 ) ) ( not ( = ?auto_521160 ?auto_521165 ) ) ( not ( = ?auto_521160 ?auto_521166 ) ) ( not ( = ?auto_521160 ?auto_521167 ) ) ( not ( = ?auto_521160 ?auto_521168 ) ) ( not ( = ?auto_521161 ?auto_521162 ) ) ( not ( = ?auto_521161 ?auto_521163 ) ) ( not ( = ?auto_521161 ?auto_521164 ) ) ( not ( = ?auto_521161 ?auto_521165 ) ) ( not ( = ?auto_521161 ?auto_521166 ) ) ( not ( = ?auto_521161 ?auto_521167 ) ) ( not ( = ?auto_521161 ?auto_521168 ) ) ( not ( = ?auto_521162 ?auto_521163 ) ) ( not ( = ?auto_521162 ?auto_521164 ) ) ( not ( = ?auto_521162 ?auto_521165 ) ) ( not ( = ?auto_521162 ?auto_521166 ) ) ( not ( = ?auto_521162 ?auto_521167 ) ) ( not ( = ?auto_521162 ?auto_521168 ) ) ( not ( = ?auto_521163 ?auto_521164 ) ) ( not ( = ?auto_521163 ?auto_521165 ) ) ( not ( = ?auto_521163 ?auto_521166 ) ) ( not ( = ?auto_521163 ?auto_521167 ) ) ( not ( = ?auto_521163 ?auto_521168 ) ) ( not ( = ?auto_521164 ?auto_521165 ) ) ( not ( = ?auto_521164 ?auto_521166 ) ) ( not ( = ?auto_521164 ?auto_521167 ) ) ( not ( = ?auto_521164 ?auto_521168 ) ) ( not ( = ?auto_521165 ?auto_521166 ) ) ( not ( = ?auto_521165 ?auto_521167 ) ) ( not ( = ?auto_521165 ?auto_521168 ) ) ( not ( = ?auto_521166 ?auto_521167 ) ) ( not ( = ?auto_521166 ?auto_521168 ) ) ( not ( = ?auto_521167 ?auto_521168 ) ) ( ON ?auto_521167 ?auto_521168 ) ( ON ?auto_521166 ?auto_521167 ) ( ON ?auto_521165 ?auto_521166 ) ( ON ?auto_521164 ?auto_521165 ) ( ON ?auto_521163 ?auto_521164 ) ( ON ?auto_521162 ?auto_521163 ) ( ON ?auto_521161 ?auto_521162 ) ( ON ?auto_521160 ?auto_521161 ) ( ON ?auto_521159 ?auto_521160 ) ( ON ?auto_521158 ?auto_521159 ) ( ON ?auto_521157 ?auto_521158 ) ( CLEAR ?auto_521155 ) ( ON ?auto_521156 ?auto_521157 ) ( CLEAR ?auto_521156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_521153 ?auto_521154 ?auto_521155 ?auto_521156 )
      ( MAKE-16PILE ?auto_521153 ?auto_521154 ?auto_521155 ?auto_521156 ?auto_521157 ?auto_521158 ?auto_521159 ?auto_521160 ?auto_521161 ?auto_521162 ?auto_521163 ?auto_521164 ?auto_521165 ?auto_521166 ?auto_521167 ?auto_521168 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521185 - BLOCK
      ?auto_521186 - BLOCK
      ?auto_521187 - BLOCK
      ?auto_521188 - BLOCK
      ?auto_521189 - BLOCK
      ?auto_521190 - BLOCK
      ?auto_521191 - BLOCK
      ?auto_521192 - BLOCK
      ?auto_521193 - BLOCK
      ?auto_521194 - BLOCK
      ?auto_521195 - BLOCK
      ?auto_521196 - BLOCK
      ?auto_521197 - BLOCK
      ?auto_521198 - BLOCK
      ?auto_521199 - BLOCK
      ?auto_521200 - BLOCK
    )
    :vars
    (
      ?auto_521201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521200 ?auto_521201 ) ( ON-TABLE ?auto_521185 ) ( ON ?auto_521186 ?auto_521185 ) ( not ( = ?auto_521185 ?auto_521186 ) ) ( not ( = ?auto_521185 ?auto_521187 ) ) ( not ( = ?auto_521185 ?auto_521188 ) ) ( not ( = ?auto_521185 ?auto_521189 ) ) ( not ( = ?auto_521185 ?auto_521190 ) ) ( not ( = ?auto_521185 ?auto_521191 ) ) ( not ( = ?auto_521185 ?auto_521192 ) ) ( not ( = ?auto_521185 ?auto_521193 ) ) ( not ( = ?auto_521185 ?auto_521194 ) ) ( not ( = ?auto_521185 ?auto_521195 ) ) ( not ( = ?auto_521185 ?auto_521196 ) ) ( not ( = ?auto_521185 ?auto_521197 ) ) ( not ( = ?auto_521185 ?auto_521198 ) ) ( not ( = ?auto_521185 ?auto_521199 ) ) ( not ( = ?auto_521185 ?auto_521200 ) ) ( not ( = ?auto_521185 ?auto_521201 ) ) ( not ( = ?auto_521186 ?auto_521187 ) ) ( not ( = ?auto_521186 ?auto_521188 ) ) ( not ( = ?auto_521186 ?auto_521189 ) ) ( not ( = ?auto_521186 ?auto_521190 ) ) ( not ( = ?auto_521186 ?auto_521191 ) ) ( not ( = ?auto_521186 ?auto_521192 ) ) ( not ( = ?auto_521186 ?auto_521193 ) ) ( not ( = ?auto_521186 ?auto_521194 ) ) ( not ( = ?auto_521186 ?auto_521195 ) ) ( not ( = ?auto_521186 ?auto_521196 ) ) ( not ( = ?auto_521186 ?auto_521197 ) ) ( not ( = ?auto_521186 ?auto_521198 ) ) ( not ( = ?auto_521186 ?auto_521199 ) ) ( not ( = ?auto_521186 ?auto_521200 ) ) ( not ( = ?auto_521186 ?auto_521201 ) ) ( not ( = ?auto_521187 ?auto_521188 ) ) ( not ( = ?auto_521187 ?auto_521189 ) ) ( not ( = ?auto_521187 ?auto_521190 ) ) ( not ( = ?auto_521187 ?auto_521191 ) ) ( not ( = ?auto_521187 ?auto_521192 ) ) ( not ( = ?auto_521187 ?auto_521193 ) ) ( not ( = ?auto_521187 ?auto_521194 ) ) ( not ( = ?auto_521187 ?auto_521195 ) ) ( not ( = ?auto_521187 ?auto_521196 ) ) ( not ( = ?auto_521187 ?auto_521197 ) ) ( not ( = ?auto_521187 ?auto_521198 ) ) ( not ( = ?auto_521187 ?auto_521199 ) ) ( not ( = ?auto_521187 ?auto_521200 ) ) ( not ( = ?auto_521187 ?auto_521201 ) ) ( not ( = ?auto_521188 ?auto_521189 ) ) ( not ( = ?auto_521188 ?auto_521190 ) ) ( not ( = ?auto_521188 ?auto_521191 ) ) ( not ( = ?auto_521188 ?auto_521192 ) ) ( not ( = ?auto_521188 ?auto_521193 ) ) ( not ( = ?auto_521188 ?auto_521194 ) ) ( not ( = ?auto_521188 ?auto_521195 ) ) ( not ( = ?auto_521188 ?auto_521196 ) ) ( not ( = ?auto_521188 ?auto_521197 ) ) ( not ( = ?auto_521188 ?auto_521198 ) ) ( not ( = ?auto_521188 ?auto_521199 ) ) ( not ( = ?auto_521188 ?auto_521200 ) ) ( not ( = ?auto_521188 ?auto_521201 ) ) ( not ( = ?auto_521189 ?auto_521190 ) ) ( not ( = ?auto_521189 ?auto_521191 ) ) ( not ( = ?auto_521189 ?auto_521192 ) ) ( not ( = ?auto_521189 ?auto_521193 ) ) ( not ( = ?auto_521189 ?auto_521194 ) ) ( not ( = ?auto_521189 ?auto_521195 ) ) ( not ( = ?auto_521189 ?auto_521196 ) ) ( not ( = ?auto_521189 ?auto_521197 ) ) ( not ( = ?auto_521189 ?auto_521198 ) ) ( not ( = ?auto_521189 ?auto_521199 ) ) ( not ( = ?auto_521189 ?auto_521200 ) ) ( not ( = ?auto_521189 ?auto_521201 ) ) ( not ( = ?auto_521190 ?auto_521191 ) ) ( not ( = ?auto_521190 ?auto_521192 ) ) ( not ( = ?auto_521190 ?auto_521193 ) ) ( not ( = ?auto_521190 ?auto_521194 ) ) ( not ( = ?auto_521190 ?auto_521195 ) ) ( not ( = ?auto_521190 ?auto_521196 ) ) ( not ( = ?auto_521190 ?auto_521197 ) ) ( not ( = ?auto_521190 ?auto_521198 ) ) ( not ( = ?auto_521190 ?auto_521199 ) ) ( not ( = ?auto_521190 ?auto_521200 ) ) ( not ( = ?auto_521190 ?auto_521201 ) ) ( not ( = ?auto_521191 ?auto_521192 ) ) ( not ( = ?auto_521191 ?auto_521193 ) ) ( not ( = ?auto_521191 ?auto_521194 ) ) ( not ( = ?auto_521191 ?auto_521195 ) ) ( not ( = ?auto_521191 ?auto_521196 ) ) ( not ( = ?auto_521191 ?auto_521197 ) ) ( not ( = ?auto_521191 ?auto_521198 ) ) ( not ( = ?auto_521191 ?auto_521199 ) ) ( not ( = ?auto_521191 ?auto_521200 ) ) ( not ( = ?auto_521191 ?auto_521201 ) ) ( not ( = ?auto_521192 ?auto_521193 ) ) ( not ( = ?auto_521192 ?auto_521194 ) ) ( not ( = ?auto_521192 ?auto_521195 ) ) ( not ( = ?auto_521192 ?auto_521196 ) ) ( not ( = ?auto_521192 ?auto_521197 ) ) ( not ( = ?auto_521192 ?auto_521198 ) ) ( not ( = ?auto_521192 ?auto_521199 ) ) ( not ( = ?auto_521192 ?auto_521200 ) ) ( not ( = ?auto_521192 ?auto_521201 ) ) ( not ( = ?auto_521193 ?auto_521194 ) ) ( not ( = ?auto_521193 ?auto_521195 ) ) ( not ( = ?auto_521193 ?auto_521196 ) ) ( not ( = ?auto_521193 ?auto_521197 ) ) ( not ( = ?auto_521193 ?auto_521198 ) ) ( not ( = ?auto_521193 ?auto_521199 ) ) ( not ( = ?auto_521193 ?auto_521200 ) ) ( not ( = ?auto_521193 ?auto_521201 ) ) ( not ( = ?auto_521194 ?auto_521195 ) ) ( not ( = ?auto_521194 ?auto_521196 ) ) ( not ( = ?auto_521194 ?auto_521197 ) ) ( not ( = ?auto_521194 ?auto_521198 ) ) ( not ( = ?auto_521194 ?auto_521199 ) ) ( not ( = ?auto_521194 ?auto_521200 ) ) ( not ( = ?auto_521194 ?auto_521201 ) ) ( not ( = ?auto_521195 ?auto_521196 ) ) ( not ( = ?auto_521195 ?auto_521197 ) ) ( not ( = ?auto_521195 ?auto_521198 ) ) ( not ( = ?auto_521195 ?auto_521199 ) ) ( not ( = ?auto_521195 ?auto_521200 ) ) ( not ( = ?auto_521195 ?auto_521201 ) ) ( not ( = ?auto_521196 ?auto_521197 ) ) ( not ( = ?auto_521196 ?auto_521198 ) ) ( not ( = ?auto_521196 ?auto_521199 ) ) ( not ( = ?auto_521196 ?auto_521200 ) ) ( not ( = ?auto_521196 ?auto_521201 ) ) ( not ( = ?auto_521197 ?auto_521198 ) ) ( not ( = ?auto_521197 ?auto_521199 ) ) ( not ( = ?auto_521197 ?auto_521200 ) ) ( not ( = ?auto_521197 ?auto_521201 ) ) ( not ( = ?auto_521198 ?auto_521199 ) ) ( not ( = ?auto_521198 ?auto_521200 ) ) ( not ( = ?auto_521198 ?auto_521201 ) ) ( not ( = ?auto_521199 ?auto_521200 ) ) ( not ( = ?auto_521199 ?auto_521201 ) ) ( not ( = ?auto_521200 ?auto_521201 ) ) ( ON ?auto_521199 ?auto_521200 ) ( ON ?auto_521198 ?auto_521199 ) ( ON ?auto_521197 ?auto_521198 ) ( ON ?auto_521196 ?auto_521197 ) ( ON ?auto_521195 ?auto_521196 ) ( ON ?auto_521194 ?auto_521195 ) ( ON ?auto_521193 ?auto_521194 ) ( ON ?auto_521192 ?auto_521193 ) ( ON ?auto_521191 ?auto_521192 ) ( ON ?auto_521190 ?auto_521191 ) ( ON ?auto_521189 ?auto_521190 ) ( ON ?auto_521188 ?auto_521189 ) ( CLEAR ?auto_521186 ) ( ON ?auto_521187 ?auto_521188 ) ( CLEAR ?auto_521187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_521185 ?auto_521186 ?auto_521187 )
      ( MAKE-16PILE ?auto_521185 ?auto_521186 ?auto_521187 ?auto_521188 ?auto_521189 ?auto_521190 ?auto_521191 ?auto_521192 ?auto_521193 ?auto_521194 ?auto_521195 ?auto_521196 ?auto_521197 ?auto_521198 ?auto_521199 ?auto_521200 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521218 - BLOCK
      ?auto_521219 - BLOCK
      ?auto_521220 - BLOCK
      ?auto_521221 - BLOCK
      ?auto_521222 - BLOCK
      ?auto_521223 - BLOCK
      ?auto_521224 - BLOCK
      ?auto_521225 - BLOCK
      ?auto_521226 - BLOCK
      ?auto_521227 - BLOCK
      ?auto_521228 - BLOCK
      ?auto_521229 - BLOCK
      ?auto_521230 - BLOCK
      ?auto_521231 - BLOCK
      ?auto_521232 - BLOCK
      ?auto_521233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_521233 ) ( ON-TABLE ?auto_521218 ) ( ON ?auto_521219 ?auto_521218 ) ( not ( = ?auto_521218 ?auto_521219 ) ) ( not ( = ?auto_521218 ?auto_521220 ) ) ( not ( = ?auto_521218 ?auto_521221 ) ) ( not ( = ?auto_521218 ?auto_521222 ) ) ( not ( = ?auto_521218 ?auto_521223 ) ) ( not ( = ?auto_521218 ?auto_521224 ) ) ( not ( = ?auto_521218 ?auto_521225 ) ) ( not ( = ?auto_521218 ?auto_521226 ) ) ( not ( = ?auto_521218 ?auto_521227 ) ) ( not ( = ?auto_521218 ?auto_521228 ) ) ( not ( = ?auto_521218 ?auto_521229 ) ) ( not ( = ?auto_521218 ?auto_521230 ) ) ( not ( = ?auto_521218 ?auto_521231 ) ) ( not ( = ?auto_521218 ?auto_521232 ) ) ( not ( = ?auto_521218 ?auto_521233 ) ) ( not ( = ?auto_521219 ?auto_521220 ) ) ( not ( = ?auto_521219 ?auto_521221 ) ) ( not ( = ?auto_521219 ?auto_521222 ) ) ( not ( = ?auto_521219 ?auto_521223 ) ) ( not ( = ?auto_521219 ?auto_521224 ) ) ( not ( = ?auto_521219 ?auto_521225 ) ) ( not ( = ?auto_521219 ?auto_521226 ) ) ( not ( = ?auto_521219 ?auto_521227 ) ) ( not ( = ?auto_521219 ?auto_521228 ) ) ( not ( = ?auto_521219 ?auto_521229 ) ) ( not ( = ?auto_521219 ?auto_521230 ) ) ( not ( = ?auto_521219 ?auto_521231 ) ) ( not ( = ?auto_521219 ?auto_521232 ) ) ( not ( = ?auto_521219 ?auto_521233 ) ) ( not ( = ?auto_521220 ?auto_521221 ) ) ( not ( = ?auto_521220 ?auto_521222 ) ) ( not ( = ?auto_521220 ?auto_521223 ) ) ( not ( = ?auto_521220 ?auto_521224 ) ) ( not ( = ?auto_521220 ?auto_521225 ) ) ( not ( = ?auto_521220 ?auto_521226 ) ) ( not ( = ?auto_521220 ?auto_521227 ) ) ( not ( = ?auto_521220 ?auto_521228 ) ) ( not ( = ?auto_521220 ?auto_521229 ) ) ( not ( = ?auto_521220 ?auto_521230 ) ) ( not ( = ?auto_521220 ?auto_521231 ) ) ( not ( = ?auto_521220 ?auto_521232 ) ) ( not ( = ?auto_521220 ?auto_521233 ) ) ( not ( = ?auto_521221 ?auto_521222 ) ) ( not ( = ?auto_521221 ?auto_521223 ) ) ( not ( = ?auto_521221 ?auto_521224 ) ) ( not ( = ?auto_521221 ?auto_521225 ) ) ( not ( = ?auto_521221 ?auto_521226 ) ) ( not ( = ?auto_521221 ?auto_521227 ) ) ( not ( = ?auto_521221 ?auto_521228 ) ) ( not ( = ?auto_521221 ?auto_521229 ) ) ( not ( = ?auto_521221 ?auto_521230 ) ) ( not ( = ?auto_521221 ?auto_521231 ) ) ( not ( = ?auto_521221 ?auto_521232 ) ) ( not ( = ?auto_521221 ?auto_521233 ) ) ( not ( = ?auto_521222 ?auto_521223 ) ) ( not ( = ?auto_521222 ?auto_521224 ) ) ( not ( = ?auto_521222 ?auto_521225 ) ) ( not ( = ?auto_521222 ?auto_521226 ) ) ( not ( = ?auto_521222 ?auto_521227 ) ) ( not ( = ?auto_521222 ?auto_521228 ) ) ( not ( = ?auto_521222 ?auto_521229 ) ) ( not ( = ?auto_521222 ?auto_521230 ) ) ( not ( = ?auto_521222 ?auto_521231 ) ) ( not ( = ?auto_521222 ?auto_521232 ) ) ( not ( = ?auto_521222 ?auto_521233 ) ) ( not ( = ?auto_521223 ?auto_521224 ) ) ( not ( = ?auto_521223 ?auto_521225 ) ) ( not ( = ?auto_521223 ?auto_521226 ) ) ( not ( = ?auto_521223 ?auto_521227 ) ) ( not ( = ?auto_521223 ?auto_521228 ) ) ( not ( = ?auto_521223 ?auto_521229 ) ) ( not ( = ?auto_521223 ?auto_521230 ) ) ( not ( = ?auto_521223 ?auto_521231 ) ) ( not ( = ?auto_521223 ?auto_521232 ) ) ( not ( = ?auto_521223 ?auto_521233 ) ) ( not ( = ?auto_521224 ?auto_521225 ) ) ( not ( = ?auto_521224 ?auto_521226 ) ) ( not ( = ?auto_521224 ?auto_521227 ) ) ( not ( = ?auto_521224 ?auto_521228 ) ) ( not ( = ?auto_521224 ?auto_521229 ) ) ( not ( = ?auto_521224 ?auto_521230 ) ) ( not ( = ?auto_521224 ?auto_521231 ) ) ( not ( = ?auto_521224 ?auto_521232 ) ) ( not ( = ?auto_521224 ?auto_521233 ) ) ( not ( = ?auto_521225 ?auto_521226 ) ) ( not ( = ?auto_521225 ?auto_521227 ) ) ( not ( = ?auto_521225 ?auto_521228 ) ) ( not ( = ?auto_521225 ?auto_521229 ) ) ( not ( = ?auto_521225 ?auto_521230 ) ) ( not ( = ?auto_521225 ?auto_521231 ) ) ( not ( = ?auto_521225 ?auto_521232 ) ) ( not ( = ?auto_521225 ?auto_521233 ) ) ( not ( = ?auto_521226 ?auto_521227 ) ) ( not ( = ?auto_521226 ?auto_521228 ) ) ( not ( = ?auto_521226 ?auto_521229 ) ) ( not ( = ?auto_521226 ?auto_521230 ) ) ( not ( = ?auto_521226 ?auto_521231 ) ) ( not ( = ?auto_521226 ?auto_521232 ) ) ( not ( = ?auto_521226 ?auto_521233 ) ) ( not ( = ?auto_521227 ?auto_521228 ) ) ( not ( = ?auto_521227 ?auto_521229 ) ) ( not ( = ?auto_521227 ?auto_521230 ) ) ( not ( = ?auto_521227 ?auto_521231 ) ) ( not ( = ?auto_521227 ?auto_521232 ) ) ( not ( = ?auto_521227 ?auto_521233 ) ) ( not ( = ?auto_521228 ?auto_521229 ) ) ( not ( = ?auto_521228 ?auto_521230 ) ) ( not ( = ?auto_521228 ?auto_521231 ) ) ( not ( = ?auto_521228 ?auto_521232 ) ) ( not ( = ?auto_521228 ?auto_521233 ) ) ( not ( = ?auto_521229 ?auto_521230 ) ) ( not ( = ?auto_521229 ?auto_521231 ) ) ( not ( = ?auto_521229 ?auto_521232 ) ) ( not ( = ?auto_521229 ?auto_521233 ) ) ( not ( = ?auto_521230 ?auto_521231 ) ) ( not ( = ?auto_521230 ?auto_521232 ) ) ( not ( = ?auto_521230 ?auto_521233 ) ) ( not ( = ?auto_521231 ?auto_521232 ) ) ( not ( = ?auto_521231 ?auto_521233 ) ) ( not ( = ?auto_521232 ?auto_521233 ) ) ( ON ?auto_521232 ?auto_521233 ) ( ON ?auto_521231 ?auto_521232 ) ( ON ?auto_521230 ?auto_521231 ) ( ON ?auto_521229 ?auto_521230 ) ( ON ?auto_521228 ?auto_521229 ) ( ON ?auto_521227 ?auto_521228 ) ( ON ?auto_521226 ?auto_521227 ) ( ON ?auto_521225 ?auto_521226 ) ( ON ?auto_521224 ?auto_521225 ) ( ON ?auto_521223 ?auto_521224 ) ( ON ?auto_521222 ?auto_521223 ) ( ON ?auto_521221 ?auto_521222 ) ( CLEAR ?auto_521219 ) ( ON ?auto_521220 ?auto_521221 ) ( CLEAR ?auto_521220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_521218 ?auto_521219 ?auto_521220 )
      ( MAKE-16PILE ?auto_521218 ?auto_521219 ?auto_521220 ?auto_521221 ?auto_521222 ?auto_521223 ?auto_521224 ?auto_521225 ?auto_521226 ?auto_521227 ?auto_521228 ?auto_521229 ?auto_521230 ?auto_521231 ?auto_521232 ?auto_521233 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521250 - BLOCK
      ?auto_521251 - BLOCK
      ?auto_521252 - BLOCK
      ?auto_521253 - BLOCK
      ?auto_521254 - BLOCK
      ?auto_521255 - BLOCK
      ?auto_521256 - BLOCK
      ?auto_521257 - BLOCK
      ?auto_521258 - BLOCK
      ?auto_521259 - BLOCK
      ?auto_521260 - BLOCK
      ?auto_521261 - BLOCK
      ?auto_521262 - BLOCK
      ?auto_521263 - BLOCK
      ?auto_521264 - BLOCK
      ?auto_521265 - BLOCK
    )
    :vars
    (
      ?auto_521266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521265 ?auto_521266 ) ( ON-TABLE ?auto_521250 ) ( not ( = ?auto_521250 ?auto_521251 ) ) ( not ( = ?auto_521250 ?auto_521252 ) ) ( not ( = ?auto_521250 ?auto_521253 ) ) ( not ( = ?auto_521250 ?auto_521254 ) ) ( not ( = ?auto_521250 ?auto_521255 ) ) ( not ( = ?auto_521250 ?auto_521256 ) ) ( not ( = ?auto_521250 ?auto_521257 ) ) ( not ( = ?auto_521250 ?auto_521258 ) ) ( not ( = ?auto_521250 ?auto_521259 ) ) ( not ( = ?auto_521250 ?auto_521260 ) ) ( not ( = ?auto_521250 ?auto_521261 ) ) ( not ( = ?auto_521250 ?auto_521262 ) ) ( not ( = ?auto_521250 ?auto_521263 ) ) ( not ( = ?auto_521250 ?auto_521264 ) ) ( not ( = ?auto_521250 ?auto_521265 ) ) ( not ( = ?auto_521250 ?auto_521266 ) ) ( not ( = ?auto_521251 ?auto_521252 ) ) ( not ( = ?auto_521251 ?auto_521253 ) ) ( not ( = ?auto_521251 ?auto_521254 ) ) ( not ( = ?auto_521251 ?auto_521255 ) ) ( not ( = ?auto_521251 ?auto_521256 ) ) ( not ( = ?auto_521251 ?auto_521257 ) ) ( not ( = ?auto_521251 ?auto_521258 ) ) ( not ( = ?auto_521251 ?auto_521259 ) ) ( not ( = ?auto_521251 ?auto_521260 ) ) ( not ( = ?auto_521251 ?auto_521261 ) ) ( not ( = ?auto_521251 ?auto_521262 ) ) ( not ( = ?auto_521251 ?auto_521263 ) ) ( not ( = ?auto_521251 ?auto_521264 ) ) ( not ( = ?auto_521251 ?auto_521265 ) ) ( not ( = ?auto_521251 ?auto_521266 ) ) ( not ( = ?auto_521252 ?auto_521253 ) ) ( not ( = ?auto_521252 ?auto_521254 ) ) ( not ( = ?auto_521252 ?auto_521255 ) ) ( not ( = ?auto_521252 ?auto_521256 ) ) ( not ( = ?auto_521252 ?auto_521257 ) ) ( not ( = ?auto_521252 ?auto_521258 ) ) ( not ( = ?auto_521252 ?auto_521259 ) ) ( not ( = ?auto_521252 ?auto_521260 ) ) ( not ( = ?auto_521252 ?auto_521261 ) ) ( not ( = ?auto_521252 ?auto_521262 ) ) ( not ( = ?auto_521252 ?auto_521263 ) ) ( not ( = ?auto_521252 ?auto_521264 ) ) ( not ( = ?auto_521252 ?auto_521265 ) ) ( not ( = ?auto_521252 ?auto_521266 ) ) ( not ( = ?auto_521253 ?auto_521254 ) ) ( not ( = ?auto_521253 ?auto_521255 ) ) ( not ( = ?auto_521253 ?auto_521256 ) ) ( not ( = ?auto_521253 ?auto_521257 ) ) ( not ( = ?auto_521253 ?auto_521258 ) ) ( not ( = ?auto_521253 ?auto_521259 ) ) ( not ( = ?auto_521253 ?auto_521260 ) ) ( not ( = ?auto_521253 ?auto_521261 ) ) ( not ( = ?auto_521253 ?auto_521262 ) ) ( not ( = ?auto_521253 ?auto_521263 ) ) ( not ( = ?auto_521253 ?auto_521264 ) ) ( not ( = ?auto_521253 ?auto_521265 ) ) ( not ( = ?auto_521253 ?auto_521266 ) ) ( not ( = ?auto_521254 ?auto_521255 ) ) ( not ( = ?auto_521254 ?auto_521256 ) ) ( not ( = ?auto_521254 ?auto_521257 ) ) ( not ( = ?auto_521254 ?auto_521258 ) ) ( not ( = ?auto_521254 ?auto_521259 ) ) ( not ( = ?auto_521254 ?auto_521260 ) ) ( not ( = ?auto_521254 ?auto_521261 ) ) ( not ( = ?auto_521254 ?auto_521262 ) ) ( not ( = ?auto_521254 ?auto_521263 ) ) ( not ( = ?auto_521254 ?auto_521264 ) ) ( not ( = ?auto_521254 ?auto_521265 ) ) ( not ( = ?auto_521254 ?auto_521266 ) ) ( not ( = ?auto_521255 ?auto_521256 ) ) ( not ( = ?auto_521255 ?auto_521257 ) ) ( not ( = ?auto_521255 ?auto_521258 ) ) ( not ( = ?auto_521255 ?auto_521259 ) ) ( not ( = ?auto_521255 ?auto_521260 ) ) ( not ( = ?auto_521255 ?auto_521261 ) ) ( not ( = ?auto_521255 ?auto_521262 ) ) ( not ( = ?auto_521255 ?auto_521263 ) ) ( not ( = ?auto_521255 ?auto_521264 ) ) ( not ( = ?auto_521255 ?auto_521265 ) ) ( not ( = ?auto_521255 ?auto_521266 ) ) ( not ( = ?auto_521256 ?auto_521257 ) ) ( not ( = ?auto_521256 ?auto_521258 ) ) ( not ( = ?auto_521256 ?auto_521259 ) ) ( not ( = ?auto_521256 ?auto_521260 ) ) ( not ( = ?auto_521256 ?auto_521261 ) ) ( not ( = ?auto_521256 ?auto_521262 ) ) ( not ( = ?auto_521256 ?auto_521263 ) ) ( not ( = ?auto_521256 ?auto_521264 ) ) ( not ( = ?auto_521256 ?auto_521265 ) ) ( not ( = ?auto_521256 ?auto_521266 ) ) ( not ( = ?auto_521257 ?auto_521258 ) ) ( not ( = ?auto_521257 ?auto_521259 ) ) ( not ( = ?auto_521257 ?auto_521260 ) ) ( not ( = ?auto_521257 ?auto_521261 ) ) ( not ( = ?auto_521257 ?auto_521262 ) ) ( not ( = ?auto_521257 ?auto_521263 ) ) ( not ( = ?auto_521257 ?auto_521264 ) ) ( not ( = ?auto_521257 ?auto_521265 ) ) ( not ( = ?auto_521257 ?auto_521266 ) ) ( not ( = ?auto_521258 ?auto_521259 ) ) ( not ( = ?auto_521258 ?auto_521260 ) ) ( not ( = ?auto_521258 ?auto_521261 ) ) ( not ( = ?auto_521258 ?auto_521262 ) ) ( not ( = ?auto_521258 ?auto_521263 ) ) ( not ( = ?auto_521258 ?auto_521264 ) ) ( not ( = ?auto_521258 ?auto_521265 ) ) ( not ( = ?auto_521258 ?auto_521266 ) ) ( not ( = ?auto_521259 ?auto_521260 ) ) ( not ( = ?auto_521259 ?auto_521261 ) ) ( not ( = ?auto_521259 ?auto_521262 ) ) ( not ( = ?auto_521259 ?auto_521263 ) ) ( not ( = ?auto_521259 ?auto_521264 ) ) ( not ( = ?auto_521259 ?auto_521265 ) ) ( not ( = ?auto_521259 ?auto_521266 ) ) ( not ( = ?auto_521260 ?auto_521261 ) ) ( not ( = ?auto_521260 ?auto_521262 ) ) ( not ( = ?auto_521260 ?auto_521263 ) ) ( not ( = ?auto_521260 ?auto_521264 ) ) ( not ( = ?auto_521260 ?auto_521265 ) ) ( not ( = ?auto_521260 ?auto_521266 ) ) ( not ( = ?auto_521261 ?auto_521262 ) ) ( not ( = ?auto_521261 ?auto_521263 ) ) ( not ( = ?auto_521261 ?auto_521264 ) ) ( not ( = ?auto_521261 ?auto_521265 ) ) ( not ( = ?auto_521261 ?auto_521266 ) ) ( not ( = ?auto_521262 ?auto_521263 ) ) ( not ( = ?auto_521262 ?auto_521264 ) ) ( not ( = ?auto_521262 ?auto_521265 ) ) ( not ( = ?auto_521262 ?auto_521266 ) ) ( not ( = ?auto_521263 ?auto_521264 ) ) ( not ( = ?auto_521263 ?auto_521265 ) ) ( not ( = ?auto_521263 ?auto_521266 ) ) ( not ( = ?auto_521264 ?auto_521265 ) ) ( not ( = ?auto_521264 ?auto_521266 ) ) ( not ( = ?auto_521265 ?auto_521266 ) ) ( ON ?auto_521264 ?auto_521265 ) ( ON ?auto_521263 ?auto_521264 ) ( ON ?auto_521262 ?auto_521263 ) ( ON ?auto_521261 ?auto_521262 ) ( ON ?auto_521260 ?auto_521261 ) ( ON ?auto_521259 ?auto_521260 ) ( ON ?auto_521258 ?auto_521259 ) ( ON ?auto_521257 ?auto_521258 ) ( ON ?auto_521256 ?auto_521257 ) ( ON ?auto_521255 ?auto_521256 ) ( ON ?auto_521254 ?auto_521255 ) ( ON ?auto_521253 ?auto_521254 ) ( ON ?auto_521252 ?auto_521253 ) ( CLEAR ?auto_521250 ) ( ON ?auto_521251 ?auto_521252 ) ( CLEAR ?auto_521251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_521250 ?auto_521251 )
      ( MAKE-16PILE ?auto_521250 ?auto_521251 ?auto_521252 ?auto_521253 ?auto_521254 ?auto_521255 ?auto_521256 ?auto_521257 ?auto_521258 ?auto_521259 ?auto_521260 ?auto_521261 ?auto_521262 ?auto_521263 ?auto_521264 ?auto_521265 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521283 - BLOCK
      ?auto_521284 - BLOCK
      ?auto_521285 - BLOCK
      ?auto_521286 - BLOCK
      ?auto_521287 - BLOCK
      ?auto_521288 - BLOCK
      ?auto_521289 - BLOCK
      ?auto_521290 - BLOCK
      ?auto_521291 - BLOCK
      ?auto_521292 - BLOCK
      ?auto_521293 - BLOCK
      ?auto_521294 - BLOCK
      ?auto_521295 - BLOCK
      ?auto_521296 - BLOCK
      ?auto_521297 - BLOCK
      ?auto_521298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_521298 ) ( ON-TABLE ?auto_521283 ) ( not ( = ?auto_521283 ?auto_521284 ) ) ( not ( = ?auto_521283 ?auto_521285 ) ) ( not ( = ?auto_521283 ?auto_521286 ) ) ( not ( = ?auto_521283 ?auto_521287 ) ) ( not ( = ?auto_521283 ?auto_521288 ) ) ( not ( = ?auto_521283 ?auto_521289 ) ) ( not ( = ?auto_521283 ?auto_521290 ) ) ( not ( = ?auto_521283 ?auto_521291 ) ) ( not ( = ?auto_521283 ?auto_521292 ) ) ( not ( = ?auto_521283 ?auto_521293 ) ) ( not ( = ?auto_521283 ?auto_521294 ) ) ( not ( = ?auto_521283 ?auto_521295 ) ) ( not ( = ?auto_521283 ?auto_521296 ) ) ( not ( = ?auto_521283 ?auto_521297 ) ) ( not ( = ?auto_521283 ?auto_521298 ) ) ( not ( = ?auto_521284 ?auto_521285 ) ) ( not ( = ?auto_521284 ?auto_521286 ) ) ( not ( = ?auto_521284 ?auto_521287 ) ) ( not ( = ?auto_521284 ?auto_521288 ) ) ( not ( = ?auto_521284 ?auto_521289 ) ) ( not ( = ?auto_521284 ?auto_521290 ) ) ( not ( = ?auto_521284 ?auto_521291 ) ) ( not ( = ?auto_521284 ?auto_521292 ) ) ( not ( = ?auto_521284 ?auto_521293 ) ) ( not ( = ?auto_521284 ?auto_521294 ) ) ( not ( = ?auto_521284 ?auto_521295 ) ) ( not ( = ?auto_521284 ?auto_521296 ) ) ( not ( = ?auto_521284 ?auto_521297 ) ) ( not ( = ?auto_521284 ?auto_521298 ) ) ( not ( = ?auto_521285 ?auto_521286 ) ) ( not ( = ?auto_521285 ?auto_521287 ) ) ( not ( = ?auto_521285 ?auto_521288 ) ) ( not ( = ?auto_521285 ?auto_521289 ) ) ( not ( = ?auto_521285 ?auto_521290 ) ) ( not ( = ?auto_521285 ?auto_521291 ) ) ( not ( = ?auto_521285 ?auto_521292 ) ) ( not ( = ?auto_521285 ?auto_521293 ) ) ( not ( = ?auto_521285 ?auto_521294 ) ) ( not ( = ?auto_521285 ?auto_521295 ) ) ( not ( = ?auto_521285 ?auto_521296 ) ) ( not ( = ?auto_521285 ?auto_521297 ) ) ( not ( = ?auto_521285 ?auto_521298 ) ) ( not ( = ?auto_521286 ?auto_521287 ) ) ( not ( = ?auto_521286 ?auto_521288 ) ) ( not ( = ?auto_521286 ?auto_521289 ) ) ( not ( = ?auto_521286 ?auto_521290 ) ) ( not ( = ?auto_521286 ?auto_521291 ) ) ( not ( = ?auto_521286 ?auto_521292 ) ) ( not ( = ?auto_521286 ?auto_521293 ) ) ( not ( = ?auto_521286 ?auto_521294 ) ) ( not ( = ?auto_521286 ?auto_521295 ) ) ( not ( = ?auto_521286 ?auto_521296 ) ) ( not ( = ?auto_521286 ?auto_521297 ) ) ( not ( = ?auto_521286 ?auto_521298 ) ) ( not ( = ?auto_521287 ?auto_521288 ) ) ( not ( = ?auto_521287 ?auto_521289 ) ) ( not ( = ?auto_521287 ?auto_521290 ) ) ( not ( = ?auto_521287 ?auto_521291 ) ) ( not ( = ?auto_521287 ?auto_521292 ) ) ( not ( = ?auto_521287 ?auto_521293 ) ) ( not ( = ?auto_521287 ?auto_521294 ) ) ( not ( = ?auto_521287 ?auto_521295 ) ) ( not ( = ?auto_521287 ?auto_521296 ) ) ( not ( = ?auto_521287 ?auto_521297 ) ) ( not ( = ?auto_521287 ?auto_521298 ) ) ( not ( = ?auto_521288 ?auto_521289 ) ) ( not ( = ?auto_521288 ?auto_521290 ) ) ( not ( = ?auto_521288 ?auto_521291 ) ) ( not ( = ?auto_521288 ?auto_521292 ) ) ( not ( = ?auto_521288 ?auto_521293 ) ) ( not ( = ?auto_521288 ?auto_521294 ) ) ( not ( = ?auto_521288 ?auto_521295 ) ) ( not ( = ?auto_521288 ?auto_521296 ) ) ( not ( = ?auto_521288 ?auto_521297 ) ) ( not ( = ?auto_521288 ?auto_521298 ) ) ( not ( = ?auto_521289 ?auto_521290 ) ) ( not ( = ?auto_521289 ?auto_521291 ) ) ( not ( = ?auto_521289 ?auto_521292 ) ) ( not ( = ?auto_521289 ?auto_521293 ) ) ( not ( = ?auto_521289 ?auto_521294 ) ) ( not ( = ?auto_521289 ?auto_521295 ) ) ( not ( = ?auto_521289 ?auto_521296 ) ) ( not ( = ?auto_521289 ?auto_521297 ) ) ( not ( = ?auto_521289 ?auto_521298 ) ) ( not ( = ?auto_521290 ?auto_521291 ) ) ( not ( = ?auto_521290 ?auto_521292 ) ) ( not ( = ?auto_521290 ?auto_521293 ) ) ( not ( = ?auto_521290 ?auto_521294 ) ) ( not ( = ?auto_521290 ?auto_521295 ) ) ( not ( = ?auto_521290 ?auto_521296 ) ) ( not ( = ?auto_521290 ?auto_521297 ) ) ( not ( = ?auto_521290 ?auto_521298 ) ) ( not ( = ?auto_521291 ?auto_521292 ) ) ( not ( = ?auto_521291 ?auto_521293 ) ) ( not ( = ?auto_521291 ?auto_521294 ) ) ( not ( = ?auto_521291 ?auto_521295 ) ) ( not ( = ?auto_521291 ?auto_521296 ) ) ( not ( = ?auto_521291 ?auto_521297 ) ) ( not ( = ?auto_521291 ?auto_521298 ) ) ( not ( = ?auto_521292 ?auto_521293 ) ) ( not ( = ?auto_521292 ?auto_521294 ) ) ( not ( = ?auto_521292 ?auto_521295 ) ) ( not ( = ?auto_521292 ?auto_521296 ) ) ( not ( = ?auto_521292 ?auto_521297 ) ) ( not ( = ?auto_521292 ?auto_521298 ) ) ( not ( = ?auto_521293 ?auto_521294 ) ) ( not ( = ?auto_521293 ?auto_521295 ) ) ( not ( = ?auto_521293 ?auto_521296 ) ) ( not ( = ?auto_521293 ?auto_521297 ) ) ( not ( = ?auto_521293 ?auto_521298 ) ) ( not ( = ?auto_521294 ?auto_521295 ) ) ( not ( = ?auto_521294 ?auto_521296 ) ) ( not ( = ?auto_521294 ?auto_521297 ) ) ( not ( = ?auto_521294 ?auto_521298 ) ) ( not ( = ?auto_521295 ?auto_521296 ) ) ( not ( = ?auto_521295 ?auto_521297 ) ) ( not ( = ?auto_521295 ?auto_521298 ) ) ( not ( = ?auto_521296 ?auto_521297 ) ) ( not ( = ?auto_521296 ?auto_521298 ) ) ( not ( = ?auto_521297 ?auto_521298 ) ) ( ON ?auto_521297 ?auto_521298 ) ( ON ?auto_521296 ?auto_521297 ) ( ON ?auto_521295 ?auto_521296 ) ( ON ?auto_521294 ?auto_521295 ) ( ON ?auto_521293 ?auto_521294 ) ( ON ?auto_521292 ?auto_521293 ) ( ON ?auto_521291 ?auto_521292 ) ( ON ?auto_521290 ?auto_521291 ) ( ON ?auto_521289 ?auto_521290 ) ( ON ?auto_521288 ?auto_521289 ) ( ON ?auto_521287 ?auto_521288 ) ( ON ?auto_521286 ?auto_521287 ) ( ON ?auto_521285 ?auto_521286 ) ( CLEAR ?auto_521283 ) ( ON ?auto_521284 ?auto_521285 ) ( CLEAR ?auto_521284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_521283 ?auto_521284 )
      ( MAKE-16PILE ?auto_521283 ?auto_521284 ?auto_521285 ?auto_521286 ?auto_521287 ?auto_521288 ?auto_521289 ?auto_521290 ?auto_521291 ?auto_521292 ?auto_521293 ?auto_521294 ?auto_521295 ?auto_521296 ?auto_521297 ?auto_521298 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521315 - BLOCK
      ?auto_521316 - BLOCK
      ?auto_521317 - BLOCK
      ?auto_521318 - BLOCK
      ?auto_521319 - BLOCK
      ?auto_521320 - BLOCK
      ?auto_521321 - BLOCK
      ?auto_521322 - BLOCK
      ?auto_521323 - BLOCK
      ?auto_521324 - BLOCK
      ?auto_521325 - BLOCK
      ?auto_521326 - BLOCK
      ?auto_521327 - BLOCK
      ?auto_521328 - BLOCK
      ?auto_521329 - BLOCK
      ?auto_521330 - BLOCK
    )
    :vars
    (
      ?auto_521331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_521330 ?auto_521331 ) ( not ( = ?auto_521315 ?auto_521316 ) ) ( not ( = ?auto_521315 ?auto_521317 ) ) ( not ( = ?auto_521315 ?auto_521318 ) ) ( not ( = ?auto_521315 ?auto_521319 ) ) ( not ( = ?auto_521315 ?auto_521320 ) ) ( not ( = ?auto_521315 ?auto_521321 ) ) ( not ( = ?auto_521315 ?auto_521322 ) ) ( not ( = ?auto_521315 ?auto_521323 ) ) ( not ( = ?auto_521315 ?auto_521324 ) ) ( not ( = ?auto_521315 ?auto_521325 ) ) ( not ( = ?auto_521315 ?auto_521326 ) ) ( not ( = ?auto_521315 ?auto_521327 ) ) ( not ( = ?auto_521315 ?auto_521328 ) ) ( not ( = ?auto_521315 ?auto_521329 ) ) ( not ( = ?auto_521315 ?auto_521330 ) ) ( not ( = ?auto_521315 ?auto_521331 ) ) ( not ( = ?auto_521316 ?auto_521317 ) ) ( not ( = ?auto_521316 ?auto_521318 ) ) ( not ( = ?auto_521316 ?auto_521319 ) ) ( not ( = ?auto_521316 ?auto_521320 ) ) ( not ( = ?auto_521316 ?auto_521321 ) ) ( not ( = ?auto_521316 ?auto_521322 ) ) ( not ( = ?auto_521316 ?auto_521323 ) ) ( not ( = ?auto_521316 ?auto_521324 ) ) ( not ( = ?auto_521316 ?auto_521325 ) ) ( not ( = ?auto_521316 ?auto_521326 ) ) ( not ( = ?auto_521316 ?auto_521327 ) ) ( not ( = ?auto_521316 ?auto_521328 ) ) ( not ( = ?auto_521316 ?auto_521329 ) ) ( not ( = ?auto_521316 ?auto_521330 ) ) ( not ( = ?auto_521316 ?auto_521331 ) ) ( not ( = ?auto_521317 ?auto_521318 ) ) ( not ( = ?auto_521317 ?auto_521319 ) ) ( not ( = ?auto_521317 ?auto_521320 ) ) ( not ( = ?auto_521317 ?auto_521321 ) ) ( not ( = ?auto_521317 ?auto_521322 ) ) ( not ( = ?auto_521317 ?auto_521323 ) ) ( not ( = ?auto_521317 ?auto_521324 ) ) ( not ( = ?auto_521317 ?auto_521325 ) ) ( not ( = ?auto_521317 ?auto_521326 ) ) ( not ( = ?auto_521317 ?auto_521327 ) ) ( not ( = ?auto_521317 ?auto_521328 ) ) ( not ( = ?auto_521317 ?auto_521329 ) ) ( not ( = ?auto_521317 ?auto_521330 ) ) ( not ( = ?auto_521317 ?auto_521331 ) ) ( not ( = ?auto_521318 ?auto_521319 ) ) ( not ( = ?auto_521318 ?auto_521320 ) ) ( not ( = ?auto_521318 ?auto_521321 ) ) ( not ( = ?auto_521318 ?auto_521322 ) ) ( not ( = ?auto_521318 ?auto_521323 ) ) ( not ( = ?auto_521318 ?auto_521324 ) ) ( not ( = ?auto_521318 ?auto_521325 ) ) ( not ( = ?auto_521318 ?auto_521326 ) ) ( not ( = ?auto_521318 ?auto_521327 ) ) ( not ( = ?auto_521318 ?auto_521328 ) ) ( not ( = ?auto_521318 ?auto_521329 ) ) ( not ( = ?auto_521318 ?auto_521330 ) ) ( not ( = ?auto_521318 ?auto_521331 ) ) ( not ( = ?auto_521319 ?auto_521320 ) ) ( not ( = ?auto_521319 ?auto_521321 ) ) ( not ( = ?auto_521319 ?auto_521322 ) ) ( not ( = ?auto_521319 ?auto_521323 ) ) ( not ( = ?auto_521319 ?auto_521324 ) ) ( not ( = ?auto_521319 ?auto_521325 ) ) ( not ( = ?auto_521319 ?auto_521326 ) ) ( not ( = ?auto_521319 ?auto_521327 ) ) ( not ( = ?auto_521319 ?auto_521328 ) ) ( not ( = ?auto_521319 ?auto_521329 ) ) ( not ( = ?auto_521319 ?auto_521330 ) ) ( not ( = ?auto_521319 ?auto_521331 ) ) ( not ( = ?auto_521320 ?auto_521321 ) ) ( not ( = ?auto_521320 ?auto_521322 ) ) ( not ( = ?auto_521320 ?auto_521323 ) ) ( not ( = ?auto_521320 ?auto_521324 ) ) ( not ( = ?auto_521320 ?auto_521325 ) ) ( not ( = ?auto_521320 ?auto_521326 ) ) ( not ( = ?auto_521320 ?auto_521327 ) ) ( not ( = ?auto_521320 ?auto_521328 ) ) ( not ( = ?auto_521320 ?auto_521329 ) ) ( not ( = ?auto_521320 ?auto_521330 ) ) ( not ( = ?auto_521320 ?auto_521331 ) ) ( not ( = ?auto_521321 ?auto_521322 ) ) ( not ( = ?auto_521321 ?auto_521323 ) ) ( not ( = ?auto_521321 ?auto_521324 ) ) ( not ( = ?auto_521321 ?auto_521325 ) ) ( not ( = ?auto_521321 ?auto_521326 ) ) ( not ( = ?auto_521321 ?auto_521327 ) ) ( not ( = ?auto_521321 ?auto_521328 ) ) ( not ( = ?auto_521321 ?auto_521329 ) ) ( not ( = ?auto_521321 ?auto_521330 ) ) ( not ( = ?auto_521321 ?auto_521331 ) ) ( not ( = ?auto_521322 ?auto_521323 ) ) ( not ( = ?auto_521322 ?auto_521324 ) ) ( not ( = ?auto_521322 ?auto_521325 ) ) ( not ( = ?auto_521322 ?auto_521326 ) ) ( not ( = ?auto_521322 ?auto_521327 ) ) ( not ( = ?auto_521322 ?auto_521328 ) ) ( not ( = ?auto_521322 ?auto_521329 ) ) ( not ( = ?auto_521322 ?auto_521330 ) ) ( not ( = ?auto_521322 ?auto_521331 ) ) ( not ( = ?auto_521323 ?auto_521324 ) ) ( not ( = ?auto_521323 ?auto_521325 ) ) ( not ( = ?auto_521323 ?auto_521326 ) ) ( not ( = ?auto_521323 ?auto_521327 ) ) ( not ( = ?auto_521323 ?auto_521328 ) ) ( not ( = ?auto_521323 ?auto_521329 ) ) ( not ( = ?auto_521323 ?auto_521330 ) ) ( not ( = ?auto_521323 ?auto_521331 ) ) ( not ( = ?auto_521324 ?auto_521325 ) ) ( not ( = ?auto_521324 ?auto_521326 ) ) ( not ( = ?auto_521324 ?auto_521327 ) ) ( not ( = ?auto_521324 ?auto_521328 ) ) ( not ( = ?auto_521324 ?auto_521329 ) ) ( not ( = ?auto_521324 ?auto_521330 ) ) ( not ( = ?auto_521324 ?auto_521331 ) ) ( not ( = ?auto_521325 ?auto_521326 ) ) ( not ( = ?auto_521325 ?auto_521327 ) ) ( not ( = ?auto_521325 ?auto_521328 ) ) ( not ( = ?auto_521325 ?auto_521329 ) ) ( not ( = ?auto_521325 ?auto_521330 ) ) ( not ( = ?auto_521325 ?auto_521331 ) ) ( not ( = ?auto_521326 ?auto_521327 ) ) ( not ( = ?auto_521326 ?auto_521328 ) ) ( not ( = ?auto_521326 ?auto_521329 ) ) ( not ( = ?auto_521326 ?auto_521330 ) ) ( not ( = ?auto_521326 ?auto_521331 ) ) ( not ( = ?auto_521327 ?auto_521328 ) ) ( not ( = ?auto_521327 ?auto_521329 ) ) ( not ( = ?auto_521327 ?auto_521330 ) ) ( not ( = ?auto_521327 ?auto_521331 ) ) ( not ( = ?auto_521328 ?auto_521329 ) ) ( not ( = ?auto_521328 ?auto_521330 ) ) ( not ( = ?auto_521328 ?auto_521331 ) ) ( not ( = ?auto_521329 ?auto_521330 ) ) ( not ( = ?auto_521329 ?auto_521331 ) ) ( not ( = ?auto_521330 ?auto_521331 ) ) ( ON ?auto_521329 ?auto_521330 ) ( ON ?auto_521328 ?auto_521329 ) ( ON ?auto_521327 ?auto_521328 ) ( ON ?auto_521326 ?auto_521327 ) ( ON ?auto_521325 ?auto_521326 ) ( ON ?auto_521324 ?auto_521325 ) ( ON ?auto_521323 ?auto_521324 ) ( ON ?auto_521322 ?auto_521323 ) ( ON ?auto_521321 ?auto_521322 ) ( ON ?auto_521320 ?auto_521321 ) ( ON ?auto_521319 ?auto_521320 ) ( ON ?auto_521318 ?auto_521319 ) ( ON ?auto_521317 ?auto_521318 ) ( ON ?auto_521316 ?auto_521317 ) ( ON ?auto_521315 ?auto_521316 ) ( CLEAR ?auto_521315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521315 )
      ( MAKE-16PILE ?auto_521315 ?auto_521316 ?auto_521317 ?auto_521318 ?auto_521319 ?auto_521320 ?auto_521321 ?auto_521322 ?auto_521323 ?auto_521324 ?auto_521325 ?auto_521326 ?auto_521327 ?auto_521328 ?auto_521329 ?auto_521330 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521348 - BLOCK
      ?auto_521349 - BLOCK
      ?auto_521350 - BLOCK
      ?auto_521351 - BLOCK
      ?auto_521352 - BLOCK
      ?auto_521353 - BLOCK
      ?auto_521354 - BLOCK
      ?auto_521355 - BLOCK
      ?auto_521356 - BLOCK
      ?auto_521357 - BLOCK
      ?auto_521358 - BLOCK
      ?auto_521359 - BLOCK
      ?auto_521360 - BLOCK
      ?auto_521361 - BLOCK
      ?auto_521362 - BLOCK
      ?auto_521363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_521363 ) ( not ( = ?auto_521348 ?auto_521349 ) ) ( not ( = ?auto_521348 ?auto_521350 ) ) ( not ( = ?auto_521348 ?auto_521351 ) ) ( not ( = ?auto_521348 ?auto_521352 ) ) ( not ( = ?auto_521348 ?auto_521353 ) ) ( not ( = ?auto_521348 ?auto_521354 ) ) ( not ( = ?auto_521348 ?auto_521355 ) ) ( not ( = ?auto_521348 ?auto_521356 ) ) ( not ( = ?auto_521348 ?auto_521357 ) ) ( not ( = ?auto_521348 ?auto_521358 ) ) ( not ( = ?auto_521348 ?auto_521359 ) ) ( not ( = ?auto_521348 ?auto_521360 ) ) ( not ( = ?auto_521348 ?auto_521361 ) ) ( not ( = ?auto_521348 ?auto_521362 ) ) ( not ( = ?auto_521348 ?auto_521363 ) ) ( not ( = ?auto_521349 ?auto_521350 ) ) ( not ( = ?auto_521349 ?auto_521351 ) ) ( not ( = ?auto_521349 ?auto_521352 ) ) ( not ( = ?auto_521349 ?auto_521353 ) ) ( not ( = ?auto_521349 ?auto_521354 ) ) ( not ( = ?auto_521349 ?auto_521355 ) ) ( not ( = ?auto_521349 ?auto_521356 ) ) ( not ( = ?auto_521349 ?auto_521357 ) ) ( not ( = ?auto_521349 ?auto_521358 ) ) ( not ( = ?auto_521349 ?auto_521359 ) ) ( not ( = ?auto_521349 ?auto_521360 ) ) ( not ( = ?auto_521349 ?auto_521361 ) ) ( not ( = ?auto_521349 ?auto_521362 ) ) ( not ( = ?auto_521349 ?auto_521363 ) ) ( not ( = ?auto_521350 ?auto_521351 ) ) ( not ( = ?auto_521350 ?auto_521352 ) ) ( not ( = ?auto_521350 ?auto_521353 ) ) ( not ( = ?auto_521350 ?auto_521354 ) ) ( not ( = ?auto_521350 ?auto_521355 ) ) ( not ( = ?auto_521350 ?auto_521356 ) ) ( not ( = ?auto_521350 ?auto_521357 ) ) ( not ( = ?auto_521350 ?auto_521358 ) ) ( not ( = ?auto_521350 ?auto_521359 ) ) ( not ( = ?auto_521350 ?auto_521360 ) ) ( not ( = ?auto_521350 ?auto_521361 ) ) ( not ( = ?auto_521350 ?auto_521362 ) ) ( not ( = ?auto_521350 ?auto_521363 ) ) ( not ( = ?auto_521351 ?auto_521352 ) ) ( not ( = ?auto_521351 ?auto_521353 ) ) ( not ( = ?auto_521351 ?auto_521354 ) ) ( not ( = ?auto_521351 ?auto_521355 ) ) ( not ( = ?auto_521351 ?auto_521356 ) ) ( not ( = ?auto_521351 ?auto_521357 ) ) ( not ( = ?auto_521351 ?auto_521358 ) ) ( not ( = ?auto_521351 ?auto_521359 ) ) ( not ( = ?auto_521351 ?auto_521360 ) ) ( not ( = ?auto_521351 ?auto_521361 ) ) ( not ( = ?auto_521351 ?auto_521362 ) ) ( not ( = ?auto_521351 ?auto_521363 ) ) ( not ( = ?auto_521352 ?auto_521353 ) ) ( not ( = ?auto_521352 ?auto_521354 ) ) ( not ( = ?auto_521352 ?auto_521355 ) ) ( not ( = ?auto_521352 ?auto_521356 ) ) ( not ( = ?auto_521352 ?auto_521357 ) ) ( not ( = ?auto_521352 ?auto_521358 ) ) ( not ( = ?auto_521352 ?auto_521359 ) ) ( not ( = ?auto_521352 ?auto_521360 ) ) ( not ( = ?auto_521352 ?auto_521361 ) ) ( not ( = ?auto_521352 ?auto_521362 ) ) ( not ( = ?auto_521352 ?auto_521363 ) ) ( not ( = ?auto_521353 ?auto_521354 ) ) ( not ( = ?auto_521353 ?auto_521355 ) ) ( not ( = ?auto_521353 ?auto_521356 ) ) ( not ( = ?auto_521353 ?auto_521357 ) ) ( not ( = ?auto_521353 ?auto_521358 ) ) ( not ( = ?auto_521353 ?auto_521359 ) ) ( not ( = ?auto_521353 ?auto_521360 ) ) ( not ( = ?auto_521353 ?auto_521361 ) ) ( not ( = ?auto_521353 ?auto_521362 ) ) ( not ( = ?auto_521353 ?auto_521363 ) ) ( not ( = ?auto_521354 ?auto_521355 ) ) ( not ( = ?auto_521354 ?auto_521356 ) ) ( not ( = ?auto_521354 ?auto_521357 ) ) ( not ( = ?auto_521354 ?auto_521358 ) ) ( not ( = ?auto_521354 ?auto_521359 ) ) ( not ( = ?auto_521354 ?auto_521360 ) ) ( not ( = ?auto_521354 ?auto_521361 ) ) ( not ( = ?auto_521354 ?auto_521362 ) ) ( not ( = ?auto_521354 ?auto_521363 ) ) ( not ( = ?auto_521355 ?auto_521356 ) ) ( not ( = ?auto_521355 ?auto_521357 ) ) ( not ( = ?auto_521355 ?auto_521358 ) ) ( not ( = ?auto_521355 ?auto_521359 ) ) ( not ( = ?auto_521355 ?auto_521360 ) ) ( not ( = ?auto_521355 ?auto_521361 ) ) ( not ( = ?auto_521355 ?auto_521362 ) ) ( not ( = ?auto_521355 ?auto_521363 ) ) ( not ( = ?auto_521356 ?auto_521357 ) ) ( not ( = ?auto_521356 ?auto_521358 ) ) ( not ( = ?auto_521356 ?auto_521359 ) ) ( not ( = ?auto_521356 ?auto_521360 ) ) ( not ( = ?auto_521356 ?auto_521361 ) ) ( not ( = ?auto_521356 ?auto_521362 ) ) ( not ( = ?auto_521356 ?auto_521363 ) ) ( not ( = ?auto_521357 ?auto_521358 ) ) ( not ( = ?auto_521357 ?auto_521359 ) ) ( not ( = ?auto_521357 ?auto_521360 ) ) ( not ( = ?auto_521357 ?auto_521361 ) ) ( not ( = ?auto_521357 ?auto_521362 ) ) ( not ( = ?auto_521357 ?auto_521363 ) ) ( not ( = ?auto_521358 ?auto_521359 ) ) ( not ( = ?auto_521358 ?auto_521360 ) ) ( not ( = ?auto_521358 ?auto_521361 ) ) ( not ( = ?auto_521358 ?auto_521362 ) ) ( not ( = ?auto_521358 ?auto_521363 ) ) ( not ( = ?auto_521359 ?auto_521360 ) ) ( not ( = ?auto_521359 ?auto_521361 ) ) ( not ( = ?auto_521359 ?auto_521362 ) ) ( not ( = ?auto_521359 ?auto_521363 ) ) ( not ( = ?auto_521360 ?auto_521361 ) ) ( not ( = ?auto_521360 ?auto_521362 ) ) ( not ( = ?auto_521360 ?auto_521363 ) ) ( not ( = ?auto_521361 ?auto_521362 ) ) ( not ( = ?auto_521361 ?auto_521363 ) ) ( not ( = ?auto_521362 ?auto_521363 ) ) ( ON ?auto_521362 ?auto_521363 ) ( ON ?auto_521361 ?auto_521362 ) ( ON ?auto_521360 ?auto_521361 ) ( ON ?auto_521359 ?auto_521360 ) ( ON ?auto_521358 ?auto_521359 ) ( ON ?auto_521357 ?auto_521358 ) ( ON ?auto_521356 ?auto_521357 ) ( ON ?auto_521355 ?auto_521356 ) ( ON ?auto_521354 ?auto_521355 ) ( ON ?auto_521353 ?auto_521354 ) ( ON ?auto_521352 ?auto_521353 ) ( ON ?auto_521351 ?auto_521352 ) ( ON ?auto_521350 ?auto_521351 ) ( ON ?auto_521349 ?auto_521350 ) ( ON ?auto_521348 ?auto_521349 ) ( CLEAR ?auto_521348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_521348 )
      ( MAKE-16PILE ?auto_521348 ?auto_521349 ?auto_521350 ?auto_521351 ?auto_521352 ?auto_521353 ?auto_521354 ?auto_521355 ?auto_521356 ?auto_521357 ?auto_521358 ?auto_521359 ?auto_521360 ?auto_521361 ?auto_521362 ?auto_521363 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_521380 - BLOCK
      ?auto_521381 - BLOCK
      ?auto_521382 - BLOCK
      ?auto_521383 - BLOCK
      ?auto_521384 - BLOCK
      ?auto_521385 - BLOCK
      ?auto_521386 - BLOCK
      ?auto_521387 - BLOCK
      ?auto_521388 - BLOCK
      ?auto_521389 - BLOCK
      ?auto_521390 - BLOCK
      ?auto_521391 - BLOCK
      ?auto_521392 - BLOCK
      ?auto_521393 - BLOCK
      ?auto_521394 - BLOCK
      ?auto_521395 - BLOCK
    )
    :vars
    (
      ?auto_521396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_521380 ?auto_521381 ) ) ( not ( = ?auto_521380 ?auto_521382 ) ) ( not ( = ?auto_521380 ?auto_521383 ) ) ( not ( = ?auto_521380 ?auto_521384 ) ) ( not ( = ?auto_521380 ?auto_521385 ) ) ( not ( = ?auto_521380 ?auto_521386 ) ) ( not ( = ?auto_521380 ?auto_521387 ) ) ( not ( = ?auto_521380 ?auto_521388 ) ) ( not ( = ?auto_521380 ?auto_521389 ) ) ( not ( = ?auto_521380 ?auto_521390 ) ) ( not ( = ?auto_521380 ?auto_521391 ) ) ( not ( = ?auto_521380 ?auto_521392 ) ) ( not ( = ?auto_521380 ?auto_521393 ) ) ( not ( = ?auto_521380 ?auto_521394 ) ) ( not ( = ?auto_521380 ?auto_521395 ) ) ( not ( = ?auto_521381 ?auto_521382 ) ) ( not ( = ?auto_521381 ?auto_521383 ) ) ( not ( = ?auto_521381 ?auto_521384 ) ) ( not ( = ?auto_521381 ?auto_521385 ) ) ( not ( = ?auto_521381 ?auto_521386 ) ) ( not ( = ?auto_521381 ?auto_521387 ) ) ( not ( = ?auto_521381 ?auto_521388 ) ) ( not ( = ?auto_521381 ?auto_521389 ) ) ( not ( = ?auto_521381 ?auto_521390 ) ) ( not ( = ?auto_521381 ?auto_521391 ) ) ( not ( = ?auto_521381 ?auto_521392 ) ) ( not ( = ?auto_521381 ?auto_521393 ) ) ( not ( = ?auto_521381 ?auto_521394 ) ) ( not ( = ?auto_521381 ?auto_521395 ) ) ( not ( = ?auto_521382 ?auto_521383 ) ) ( not ( = ?auto_521382 ?auto_521384 ) ) ( not ( = ?auto_521382 ?auto_521385 ) ) ( not ( = ?auto_521382 ?auto_521386 ) ) ( not ( = ?auto_521382 ?auto_521387 ) ) ( not ( = ?auto_521382 ?auto_521388 ) ) ( not ( = ?auto_521382 ?auto_521389 ) ) ( not ( = ?auto_521382 ?auto_521390 ) ) ( not ( = ?auto_521382 ?auto_521391 ) ) ( not ( = ?auto_521382 ?auto_521392 ) ) ( not ( = ?auto_521382 ?auto_521393 ) ) ( not ( = ?auto_521382 ?auto_521394 ) ) ( not ( = ?auto_521382 ?auto_521395 ) ) ( not ( = ?auto_521383 ?auto_521384 ) ) ( not ( = ?auto_521383 ?auto_521385 ) ) ( not ( = ?auto_521383 ?auto_521386 ) ) ( not ( = ?auto_521383 ?auto_521387 ) ) ( not ( = ?auto_521383 ?auto_521388 ) ) ( not ( = ?auto_521383 ?auto_521389 ) ) ( not ( = ?auto_521383 ?auto_521390 ) ) ( not ( = ?auto_521383 ?auto_521391 ) ) ( not ( = ?auto_521383 ?auto_521392 ) ) ( not ( = ?auto_521383 ?auto_521393 ) ) ( not ( = ?auto_521383 ?auto_521394 ) ) ( not ( = ?auto_521383 ?auto_521395 ) ) ( not ( = ?auto_521384 ?auto_521385 ) ) ( not ( = ?auto_521384 ?auto_521386 ) ) ( not ( = ?auto_521384 ?auto_521387 ) ) ( not ( = ?auto_521384 ?auto_521388 ) ) ( not ( = ?auto_521384 ?auto_521389 ) ) ( not ( = ?auto_521384 ?auto_521390 ) ) ( not ( = ?auto_521384 ?auto_521391 ) ) ( not ( = ?auto_521384 ?auto_521392 ) ) ( not ( = ?auto_521384 ?auto_521393 ) ) ( not ( = ?auto_521384 ?auto_521394 ) ) ( not ( = ?auto_521384 ?auto_521395 ) ) ( not ( = ?auto_521385 ?auto_521386 ) ) ( not ( = ?auto_521385 ?auto_521387 ) ) ( not ( = ?auto_521385 ?auto_521388 ) ) ( not ( = ?auto_521385 ?auto_521389 ) ) ( not ( = ?auto_521385 ?auto_521390 ) ) ( not ( = ?auto_521385 ?auto_521391 ) ) ( not ( = ?auto_521385 ?auto_521392 ) ) ( not ( = ?auto_521385 ?auto_521393 ) ) ( not ( = ?auto_521385 ?auto_521394 ) ) ( not ( = ?auto_521385 ?auto_521395 ) ) ( not ( = ?auto_521386 ?auto_521387 ) ) ( not ( = ?auto_521386 ?auto_521388 ) ) ( not ( = ?auto_521386 ?auto_521389 ) ) ( not ( = ?auto_521386 ?auto_521390 ) ) ( not ( = ?auto_521386 ?auto_521391 ) ) ( not ( = ?auto_521386 ?auto_521392 ) ) ( not ( = ?auto_521386 ?auto_521393 ) ) ( not ( = ?auto_521386 ?auto_521394 ) ) ( not ( = ?auto_521386 ?auto_521395 ) ) ( not ( = ?auto_521387 ?auto_521388 ) ) ( not ( = ?auto_521387 ?auto_521389 ) ) ( not ( = ?auto_521387 ?auto_521390 ) ) ( not ( = ?auto_521387 ?auto_521391 ) ) ( not ( = ?auto_521387 ?auto_521392 ) ) ( not ( = ?auto_521387 ?auto_521393 ) ) ( not ( = ?auto_521387 ?auto_521394 ) ) ( not ( = ?auto_521387 ?auto_521395 ) ) ( not ( = ?auto_521388 ?auto_521389 ) ) ( not ( = ?auto_521388 ?auto_521390 ) ) ( not ( = ?auto_521388 ?auto_521391 ) ) ( not ( = ?auto_521388 ?auto_521392 ) ) ( not ( = ?auto_521388 ?auto_521393 ) ) ( not ( = ?auto_521388 ?auto_521394 ) ) ( not ( = ?auto_521388 ?auto_521395 ) ) ( not ( = ?auto_521389 ?auto_521390 ) ) ( not ( = ?auto_521389 ?auto_521391 ) ) ( not ( = ?auto_521389 ?auto_521392 ) ) ( not ( = ?auto_521389 ?auto_521393 ) ) ( not ( = ?auto_521389 ?auto_521394 ) ) ( not ( = ?auto_521389 ?auto_521395 ) ) ( not ( = ?auto_521390 ?auto_521391 ) ) ( not ( = ?auto_521390 ?auto_521392 ) ) ( not ( = ?auto_521390 ?auto_521393 ) ) ( not ( = ?auto_521390 ?auto_521394 ) ) ( not ( = ?auto_521390 ?auto_521395 ) ) ( not ( = ?auto_521391 ?auto_521392 ) ) ( not ( = ?auto_521391 ?auto_521393 ) ) ( not ( = ?auto_521391 ?auto_521394 ) ) ( not ( = ?auto_521391 ?auto_521395 ) ) ( not ( = ?auto_521392 ?auto_521393 ) ) ( not ( = ?auto_521392 ?auto_521394 ) ) ( not ( = ?auto_521392 ?auto_521395 ) ) ( not ( = ?auto_521393 ?auto_521394 ) ) ( not ( = ?auto_521393 ?auto_521395 ) ) ( not ( = ?auto_521394 ?auto_521395 ) ) ( ON ?auto_521380 ?auto_521396 ) ( not ( = ?auto_521395 ?auto_521396 ) ) ( not ( = ?auto_521394 ?auto_521396 ) ) ( not ( = ?auto_521393 ?auto_521396 ) ) ( not ( = ?auto_521392 ?auto_521396 ) ) ( not ( = ?auto_521391 ?auto_521396 ) ) ( not ( = ?auto_521390 ?auto_521396 ) ) ( not ( = ?auto_521389 ?auto_521396 ) ) ( not ( = ?auto_521388 ?auto_521396 ) ) ( not ( = ?auto_521387 ?auto_521396 ) ) ( not ( = ?auto_521386 ?auto_521396 ) ) ( not ( = ?auto_521385 ?auto_521396 ) ) ( not ( = ?auto_521384 ?auto_521396 ) ) ( not ( = ?auto_521383 ?auto_521396 ) ) ( not ( = ?auto_521382 ?auto_521396 ) ) ( not ( = ?auto_521381 ?auto_521396 ) ) ( not ( = ?auto_521380 ?auto_521396 ) ) ( ON ?auto_521381 ?auto_521380 ) ( ON ?auto_521382 ?auto_521381 ) ( ON ?auto_521383 ?auto_521382 ) ( ON ?auto_521384 ?auto_521383 ) ( ON ?auto_521385 ?auto_521384 ) ( ON ?auto_521386 ?auto_521385 ) ( ON ?auto_521387 ?auto_521386 ) ( ON ?auto_521388 ?auto_521387 ) ( ON ?auto_521389 ?auto_521388 ) ( ON ?auto_521390 ?auto_521389 ) ( ON ?auto_521391 ?auto_521390 ) ( ON ?auto_521392 ?auto_521391 ) ( ON ?auto_521393 ?auto_521392 ) ( ON ?auto_521394 ?auto_521393 ) ( ON ?auto_521395 ?auto_521394 ) ( CLEAR ?auto_521395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_521395 ?auto_521394 ?auto_521393 ?auto_521392 ?auto_521391 ?auto_521390 ?auto_521389 ?auto_521388 ?auto_521387 ?auto_521386 ?auto_521385 ?auto_521384 ?auto_521383 ?auto_521382 ?auto_521381 ?auto_521380 )
      ( MAKE-16PILE ?auto_521380 ?auto_521381 ?auto_521382 ?auto_521383 ?auto_521384 ?auto_521385 ?auto_521386 ?auto_521387 ?auto_521388 ?auto_521389 ?auto_521390 ?auto_521391 ?auto_521392 ?auto_521393 ?auto_521394 ?auto_521395 ) )
  )

)

