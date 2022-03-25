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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47282 - BLOCK
      ?auto_47283 - BLOCK
      ?auto_47284 - BLOCK
      ?auto_47285 - BLOCK
      ?auto_47286 - BLOCK
      ?auto_47287 - BLOCK
    )
    :vars
    (
      ?auto_47288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47288 ?auto_47287 ) ( CLEAR ?auto_47288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47282 ) ( ON ?auto_47283 ?auto_47282 ) ( ON ?auto_47284 ?auto_47283 ) ( ON ?auto_47285 ?auto_47284 ) ( ON ?auto_47286 ?auto_47285 ) ( ON ?auto_47287 ?auto_47286 ) ( not ( = ?auto_47282 ?auto_47283 ) ) ( not ( = ?auto_47282 ?auto_47284 ) ) ( not ( = ?auto_47282 ?auto_47285 ) ) ( not ( = ?auto_47282 ?auto_47286 ) ) ( not ( = ?auto_47282 ?auto_47287 ) ) ( not ( = ?auto_47282 ?auto_47288 ) ) ( not ( = ?auto_47283 ?auto_47284 ) ) ( not ( = ?auto_47283 ?auto_47285 ) ) ( not ( = ?auto_47283 ?auto_47286 ) ) ( not ( = ?auto_47283 ?auto_47287 ) ) ( not ( = ?auto_47283 ?auto_47288 ) ) ( not ( = ?auto_47284 ?auto_47285 ) ) ( not ( = ?auto_47284 ?auto_47286 ) ) ( not ( = ?auto_47284 ?auto_47287 ) ) ( not ( = ?auto_47284 ?auto_47288 ) ) ( not ( = ?auto_47285 ?auto_47286 ) ) ( not ( = ?auto_47285 ?auto_47287 ) ) ( not ( = ?auto_47285 ?auto_47288 ) ) ( not ( = ?auto_47286 ?auto_47287 ) ) ( not ( = ?auto_47286 ?auto_47288 ) ) ( not ( = ?auto_47287 ?auto_47288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47288 ?auto_47287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47290 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47290 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_47290 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47291 - BLOCK
    )
    :vars
    (
      ?auto_47292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47291 ?auto_47292 ) ( CLEAR ?auto_47291 ) ( HAND-EMPTY ) ( not ( = ?auto_47291 ?auto_47292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47291 ?auto_47292 )
      ( MAKE-1PILE ?auto_47291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47298 - BLOCK
      ?auto_47299 - BLOCK
      ?auto_47300 - BLOCK
      ?auto_47301 - BLOCK
      ?auto_47302 - BLOCK
    )
    :vars
    (
      ?auto_47303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47303 ?auto_47302 ) ( CLEAR ?auto_47303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47298 ) ( ON ?auto_47299 ?auto_47298 ) ( ON ?auto_47300 ?auto_47299 ) ( ON ?auto_47301 ?auto_47300 ) ( ON ?auto_47302 ?auto_47301 ) ( not ( = ?auto_47298 ?auto_47299 ) ) ( not ( = ?auto_47298 ?auto_47300 ) ) ( not ( = ?auto_47298 ?auto_47301 ) ) ( not ( = ?auto_47298 ?auto_47302 ) ) ( not ( = ?auto_47298 ?auto_47303 ) ) ( not ( = ?auto_47299 ?auto_47300 ) ) ( not ( = ?auto_47299 ?auto_47301 ) ) ( not ( = ?auto_47299 ?auto_47302 ) ) ( not ( = ?auto_47299 ?auto_47303 ) ) ( not ( = ?auto_47300 ?auto_47301 ) ) ( not ( = ?auto_47300 ?auto_47302 ) ) ( not ( = ?auto_47300 ?auto_47303 ) ) ( not ( = ?auto_47301 ?auto_47302 ) ) ( not ( = ?auto_47301 ?auto_47303 ) ) ( not ( = ?auto_47302 ?auto_47303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47303 ?auto_47302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47304 - BLOCK
      ?auto_47305 - BLOCK
      ?auto_47306 - BLOCK
      ?auto_47307 - BLOCK
      ?auto_47308 - BLOCK
    )
    :vars
    (
      ?auto_47309 - BLOCK
      ?auto_47310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47309 ?auto_47308 ) ( CLEAR ?auto_47309 ) ( ON-TABLE ?auto_47304 ) ( ON ?auto_47305 ?auto_47304 ) ( ON ?auto_47306 ?auto_47305 ) ( ON ?auto_47307 ?auto_47306 ) ( ON ?auto_47308 ?auto_47307 ) ( not ( = ?auto_47304 ?auto_47305 ) ) ( not ( = ?auto_47304 ?auto_47306 ) ) ( not ( = ?auto_47304 ?auto_47307 ) ) ( not ( = ?auto_47304 ?auto_47308 ) ) ( not ( = ?auto_47304 ?auto_47309 ) ) ( not ( = ?auto_47305 ?auto_47306 ) ) ( not ( = ?auto_47305 ?auto_47307 ) ) ( not ( = ?auto_47305 ?auto_47308 ) ) ( not ( = ?auto_47305 ?auto_47309 ) ) ( not ( = ?auto_47306 ?auto_47307 ) ) ( not ( = ?auto_47306 ?auto_47308 ) ) ( not ( = ?auto_47306 ?auto_47309 ) ) ( not ( = ?auto_47307 ?auto_47308 ) ) ( not ( = ?auto_47307 ?auto_47309 ) ) ( not ( = ?auto_47308 ?auto_47309 ) ) ( HOLDING ?auto_47310 ) ( not ( = ?auto_47304 ?auto_47310 ) ) ( not ( = ?auto_47305 ?auto_47310 ) ) ( not ( = ?auto_47306 ?auto_47310 ) ) ( not ( = ?auto_47307 ?auto_47310 ) ) ( not ( = ?auto_47308 ?auto_47310 ) ) ( not ( = ?auto_47309 ?auto_47310 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_47310 )
      ( MAKE-5PILE ?auto_47304 ?auto_47305 ?auto_47306 ?auto_47307 ?auto_47308 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47311 - BLOCK
      ?auto_47312 - BLOCK
      ?auto_47313 - BLOCK
      ?auto_47314 - BLOCK
      ?auto_47315 - BLOCK
    )
    :vars
    (
      ?auto_47316 - BLOCK
      ?auto_47317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47316 ?auto_47315 ) ( ON-TABLE ?auto_47311 ) ( ON ?auto_47312 ?auto_47311 ) ( ON ?auto_47313 ?auto_47312 ) ( ON ?auto_47314 ?auto_47313 ) ( ON ?auto_47315 ?auto_47314 ) ( not ( = ?auto_47311 ?auto_47312 ) ) ( not ( = ?auto_47311 ?auto_47313 ) ) ( not ( = ?auto_47311 ?auto_47314 ) ) ( not ( = ?auto_47311 ?auto_47315 ) ) ( not ( = ?auto_47311 ?auto_47316 ) ) ( not ( = ?auto_47312 ?auto_47313 ) ) ( not ( = ?auto_47312 ?auto_47314 ) ) ( not ( = ?auto_47312 ?auto_47315 ) ) ( not ( = ?auto_47312 ?auto_47316 ) ) ( not ( = ?auto_47313 ?auto_47314 ) ) ( not ( = ?auto_47313 ?auto_47315 ) ) ( not ( = ?auto_47313 ?auto_47316 ) ) ( not ( = ?auto_47314 ?auto_47315 ) ) ( not ( = ?auto_47314 ?auto_47316 ) ) ( not ( = ?auto_47315 ?auto_47316 ) ) ( not ( = ?auto_47311 ?auto_47317 ) ) ( not ( = ?auto_47312 ?auto_47317 ) ) ( not ( = ?auto_47313 ?auto_47317 ) ) ( not ( = ?auto_47314 ?auto_47317 ) ) ( not ( = ?auto_47315 ?auto_47317 ) ) ( not ( = ?auto_47316 ?auto_47317 ) ) ( ON ?auto_47317 ?auto_47316 ) ( CLEAR ?auto_47317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47311 ?auto_47312 ?auto_47313 ?auto_47314 ?auto_47315 ?auto_47316 )
      ( MAKE-5PILE ?auto_47311 ?auto_47312 ?auto_47313 ?auto_47314 ?auto_47315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47320 - BLOCK
      ?auto_47321 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47321 ) ( CLEAR ?auto_47320 ) ( ON-TABLE ?auto_47320 ) ( not ( = ?auto_47320 ?auto_47321 ) ) )
    :subtasks
    ( ( !STACK ?auto_47321 ?auto_47320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47322 - BLOCK
      ?auto_47323 - BLOCK
    )
    :vars
    (
      ?auto_47324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47322 ) ( ON-TABLE ?auto_47322 ) ( not ( = ?auto_47322 ?auto_47323 ) ) ( ON ?auto_47323 ?auto_47324 ) ( CLEAR ?auto_47323 ) ( HAND-EMPTY ) ( not ( = ?auto_47322 ?auto_47324 ) ) ( not ( = ?auto_47323 ?auto_47324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47323 ?auto_47324 )
      ( MAKE-2PILE ?auto_47322 ?auto_47323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47325 - BLOCK
      ?auto_47326 - BLOCK
    )
    :vars
    (
      ?auto_47327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47325 ?auto_47326 ) ) ( ON ?auto_47326 ?auto_47327 ) ( CLEAR ?auto_47326 ) ( not ( = ?auto_47325 ?auto_47327 ) ) ( not ( = ?auto_47326 ?auto_47327 ) ) ( HOLDING ?auto_47325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47325 )
      ( MAKE-2PILE ?auto_47325 ?auto_47326 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47328 - BLOCK
      ?auto_47329 - BLOCK
    )
    :vars
    (
      ?auto_47330 - BLOCK
      ?auto_47334 - BLOCK
      ?auto_47332 - BLOCK
      ?auto_47331 - BLOCK
      ?auto_47333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47328 ?auto_47329 ) ) ( ON ?auto_47329 ?auto_47330 ) ( not ( = ?auto_47328 ?auto_47330 ) ) ( not ( = ?auto_47329 ?auto_47330 ) ) ( ON ?auto_47328 ?auto_47329 ) ( CLEAR ?auto_47328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47334 ) ( ON ?auto_47332 ?auto_47334 ) ( ON ?auto_47331 ?auto_47332 ) ( ON ?auto_47333 ?auto_47331 ) ( ON ?auto_47330 ?auto_47333 ) ( not ( = ?auto_47334 ?auto_47332 ) ) ( not ( = ?auto_47334 ?auto_47331 ) ) ( not ( = ?auto_47334 ?auto_47333 ) ) ( not ( = ?auto_47334 ?auto_47330 ) ) ( not ( = ?auto_47334 ?auto_47329 ) ) ( not ( = ?auto_47334 ?auto_47328 ) ) ( not ( = ?auto_47332 ?auto_47331 ) ) ( not ( = ?auto_47332 ?auto_47333 ) ) ( not ( = ?auto_47332 ?auto_47330 ) ) ( not ( = ?auto_47332 ?auto_47329 ) ) ( not ( = ?auto_47332 ?auto_47328 ) ) ( not ( = ?auto_47331 ?auto_47333 ) ) ( not ( = ?auto_47331 ?auto_47330 ) ) ( not ( = ?auto_47331 ?auto_47329 ) ) ( not ( = ?auto_47331 ?auto_47328 ) ) ( not ( = ?auto_47333 ?auto_47330 ) ) ( not ( = ?auto_47333 ?auto_47329 ) ) ( not ( = ?auto_47333 ?auto_47328 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47334 ?auto_47332 ?auto_47331 ?auto_47333 ?auto_47330 ?auto_47329 )
      ( MAKE-2PILE ?auto_47328 ?auto_47329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47339 - BLOCK
      ?auto_47340 - BLOCK
      ?auto_47341 - BLOCK
      ?auto_47342 - BLOCK
    )
    :vars
    (
      ?auto_47343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47343 ?auto_47342 ) ( CLEAR ?auto_47343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47339 ) ( ON ?auto_47340 ?auto_47339 ) ( ON ?auto_47341 ?auto_47340 ) ( ON ?auto_47342 ?auto_47341 ) ( not ( = ?auto_47339 ?auto_47340 ) ) ( not ( = ?auto_47339 ?auto_47341 ) ) ( not ( = ?auto_47339 ?auto_47342 ) ) ( not ( = ?auto_47339 ?auto_47343 ) ) ( not ( = ?auto_47340 ?auto_47341 ) ) ( not ( = ?auto_47340 ?auto_47342 ) ) ( not ( = ?auto_47340 ?auto_47343 ) ) ( not ( = ?auto_47341 ?auto_47342 ) ) ( not ( = ?auto_47341 ?auto_47343 ) ) ( not ( = ?auto_47342 ?auto_47343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47343 ?auto_47342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47344 - BLOCK
      ?auto_47345 - BLOCK
      ?auto_47346 - BLOCK
      ?auto_47347 - BLOCK
    )
    :vars
    (
      ?auto_47348 - BLOCK
      ?auto_47349 - BLOCK
      ?auto_47350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47348 ?auto_47347 ) ( CLEAR ?auto_47348 ) ( ON-TABLE ?auto_47344 ) ( ON ?auto_47345 ?auto_47344 ) ( ON ?auto_47346 ?auto_47345 ) ( ON ?auto_47347 ?auto_47346 ) ( not ( = ?auto_47344 ?auto_47345 ) ) ( not ( = ?auto_47344 ?auto_47346 ) ) ( not ( = ?auto_47344 ?auto_47347 ) ) ( not ( = ?auto_47344 ?auto_47348 ) ) ( not ( = ?auto_47345 ?auto_47346 ) ) ( not ( = ?auto_47345 ?auto_47347 ) ) ( not ( = ?auto_47345 ?auto_47348 ) ) ( not ( = ?auto_47346 ?auto_47347 ) ) ( not ( = ?auto_47346 ?auto_47348 ) ) ( not ( = ?auto_47347 ?auto_47348 ) ) ( HOLDING ?auto_47349 ) ( CLEAR ?auto_47350 ) ( not ( = ?auto_47344 ?auto_47349 ) ) ( not ( = ?auto_47344 ?auto_47350 ) ) ( not ( = ?auto_47345 ?auto_47349 ) ) ( not ( = ?auto_47345 ?auto_47350 ) ) ( not ( = ?auto_47346 ?auto_47349 ) ) ( not ( = ?auto_47346 ?auto_47350 ) ) ( not ( = ?auto_47347 ?auto_47349 ) ) ( not ( = ?auto_47347 ?auto_47350 ) ) ( not ( = ?auto_47348 ?auto_47349 ) ) ( not ( = ?auto_47348 ?auto_47350 ) ) ( not ( = ?auto_47349 ?auto_47350 ) ) )
    :subtasks
    ( ( !STACK ?auto_47349 ?auto_47350 )
      ( MAKE-4PILE ?auto_47344 ?auto_47345 ?auto_47346 ?auto_47347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47950 - BLOCK
      ?auto_47951 - BLOCK
      ?auto_47952 - BLOCK
      ?auto_47953 - BLOCK
    )
    :vars
    (
      ?auto_47954 - BLOCK
      ?auto_47955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47954 ?auto_47953 ) ( ON-TABLE ?auto_47950 ) ( ON ?auto_47951 ?auto_47950 ) ( ON ?auto_47952 ?auto_47951 ) ( ON ?auto_47953 ?auto_47952 ) ( not ( = ?auto_47950 ?auto_47951 ) ) ( not ( = ?auto_47950 ?auto_47952 ) ) ( not ( = ?auto_47950 ?auto_47953 ) ) ( not ( = ?auto_47950 ?auto_47954 ) ) ( not ( = ?auto_47951 ?auto_47952 ) ) ( not ( = ?auto_47951 ?auto_47953 ) ) ( not ( = ?auto_47951 ?auto_47954 ) ) ( not ( = ?auto_47952 ?auto_47953 ) ) ( not ( = ?auto_47952 ?auto_47954 ) ) ( not ( = ?auto_47953 ?auto_47954 ) ) ( not ( = ?auto_47950 ?auto_47955 ) ) ( not ( = ?auto_47951 ?auto_47955 ) ) ( not ( = ?auto_47952 ?auto_47955 ) ) ( not ( = ?auto_47953 ?auto_47955 ) ) ( not ( = ?auto_47954 ?auto_47955 ) ) ( ON ?auto_47955 ?auto_47954 ) ( CLEAR ?auto_47955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47950 ?auto_47951 ?auto_47952 ?auto_47953 ?auto_47954 )
      ( MAKE-4PILE ?auto_47950 ?auto_47951 ?auto_47952 ?auto_47953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47358 - BLOCK
      ?auto_47359 - BLOCK
      ?auto_47360 - BLOCK
      ?auto_47361 - BLOCK
    )
    :vars
    (
      ?auto_47364 - BLOCK
      ?auto_47363 - BLOCK
      ?auto_47362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47364 ?auto_47361 ) ( ON-TABLE ?auto_47358 ) ( ON ?auto_47359 ?auto_47358 ) ( ON ?auto_47360 ?auto_47359 ) ( ON ?auto_47361 ?auto_47360 ) ( not ( = ?auto_47358 ?auto_47359 ) ) ( not ( = ?auto_47358 ?auto_47360 ) ) ( not ( = ?auto_47358 ?auto_47361 ) ) ( not ( = ?auto_47358 ?auto_47364 ) ) ( not ( = ?auto_47359 ?auto_47360 ) ) ( not ( = ?auto_47359 ?auto_47361 ) ) ( not ( = ?auto_47359 ?auto_47364 ) ) ( not ( = ?auto_47360 ?auto_47361 ) ) ( not ( = ?auto_47360 ?auto_47364 ) ) ( not ( = ?auto_47361 ?auto_47364 ) ) ( not ( = ?auto_47358 ?auto_47363 ) ) ( not ( = ?auto_47358 ?auto_47362 ) ) ( not ( = ?auto_47359 ?auto_47363 ) ) ( not ( = ?auto_47359 ?auto_47362 ) ) ( not ( = ?auto_47360 ?auto_47363 ) ) ( not ( = ?auto_47360 ?auto_47362 ) ) ( not ( = ?auto_47361 ?auto_47363 ) ) ( not ( = ?auto_47361 ?auto_47362 ) ) ( not ( = ?auto_47364 ?auto_47363 ) ) ( not ( = ?auto_47364 ?auto_47362 ) ) ( not ( = ?auto_47363 ?auto_47362 ) ) ( ON ?auto_47363 ?auto_47364 ) ( CLEAR ?auto_47363 ) ( HOLDING ?auto_47362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47362 )
      ( MAKE-4PILE ?auto_47358 ?auto_47359 ?auto_47360 ?auto_47361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47365 - BLOCK
      ?auto_47366 - BLOCK
      ?auto_47367 - BLOCK
      ?auto_47368 - BLOCK
    )
    :vars
    (
      ?auto_47370 - BLOCK
      ?auto_47369 - BLOCK
      ?auto_47371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47370 ?auto_47368 ) ( ON-TABLE ?auto_47365 ) ( ON ?auto_47366 ?auto_47365 ) ( ON ?auto_47367 ?auto_47366 ) ( ON ?auto_47368 ?auto_47367 ) ( not ( = ?auto_47365 ?auto_47366 ) ) ( not ( = ?auto_47365 ?auto_47367 ) ) ( not ( = ?auto_47365 ?auto_47368 ) ) ( not ( = ?auto_47365 ?auto_47370 ) ) ( not ( = ?auto_47366 ?auto_47367 ) ) ( not ( = ?auto_47366 ?auto_47368 ) ) ( not ( = ?auto_47366 ?auto_47370 ) ) ( not ( = ?auto_47367 ?auto_47368 ) ) ( not ( = ?auto_47367 ?auto_47370 ) ) ( not ( = ?auto_47368 ?auto_47370 ) ) ( not ( = ?auto_47365 ?auto_47369 ) ) ( not ( = ?auto_47365 ?auto_47371 ) ) ( not ( = ?auto_47366 ?auto_47369 ) ) ( not ( = ?auto_47366 ?auto_47371 ) ) ( not ( = ?auto_47367 ?auto_47369 ) ) ( not ( = ?auto_47367 ?auto_47371 ) ) ( not ( = ?auto_47368 ?auto_47369 ) ) ( not ( = ?auto_47368 ?auto_47371 ) ) ( not ( = ?auto_47370 ?auto_47369 ) ) ( not ( = ?auto_47370 ?auto_47371 ) ) ( not ( = ?auto_47369 ?auto_47371 ) ) ( ON ?auto_47369 ?auto_47370 ) ( ON ?auto_47371 ?auto_47369 ) ( CLEAR ?auto_47371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47365 ?auto_47366 ?auto_47367 ?auto_47368 ?auto_47370 ?auto_47369 )
      ( MAKE-4PILE ?auto_47365 ?auto_47366 ?auto_47367 ?auto_47368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47375 - BLOCK
      ?auto_47376 - BLOCK
      ?auto_47377 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47377 ) ( CLEAR ?auto_47376 ) ( ON-TABLE ?auto_47375 ) ( ON ?auto_47376 ?auto_47375 ) ( not ( = ?auto_47375 ?auto_47376 ) ) ( not ( = ?auto_47375 ?auto_47377 ) ) ( not ( = ?auto_47376 ?auto_47377 ) ) )
    :subtasks
    ( ( !STACK ?auto_47377 ?auto_47376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47378 - BLOCK
      ?auto_47379 - BLOCK
      ?auto_47380 - BLOCK
    )
    :vars
    (
      ?auto_47381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47379 ) ( ON-TABLE ?auto_47378 ) ( ON ?auto_47379 ?auto_47378 ) ( not ( = ?auto_47378 ?auto_47379 ) ) ( not ( = ?auto_47378 ?auto_47380 ) ) ( not ( = ?auto_47379 ?auto_47380 ) ) ( ON ?auto_47380 ?auto_47381 ) ( CLEAR ?auto_47380 ) ( HAND-EMPTY ) ( not ( = ?auto_47378 ?auto_47381 ) ) ( not ( = ?auto_47379 ?auto_47381 ) ) ( not ( = ?auto_47380 ?auto_47381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47380 ?auto_47381 )
      ( MAKE-3PILE ?auto_47378 ?auto_47379 ?auto_47380 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47382 - BLOCK
      ?auto_47383 - BLOCK
      ?auto_47384 - BLOCK
    )
    :vars
    (
      ?auto_47385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47382 ) ( not ( = ?auto_47382 ?auto_47383 ) ) ( not ( = ?auto_47382 ?auto_47384 ) ) ( not ( = ?auto_47383 ?auto_47384 ) ) ( ON ?auto_47384 ?auto_47385 ) ( CLEAR ?auto_47384 ) ( not ( = ?auto_47382 ?auto_47385 ) ) ( not ( = ?auto_47383 ?auto_47385 ) ) ( not ( = ?auto_47384 ?auto_47385 ) ) ( HOLDING ?auto_47383 ) ( CLEAR ?auto_47382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47382 ?auto_47383 )
      ( MAKE-3PILE ?auto_47382 ?auto_47383 ?auto_47384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47386 - BLOCK
      ?auto_47387 - BLOCK
      ?auto_47388 - BLOCK
    )
    :vars
    (
      ?auto_47389 - BLOCK
      ?auto_47391 - BLOCK
      ?auto_47390 - BLOCK
      ?auto_47392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47386 ) ( not ( = ?auto_47386 ?auto_47387 ) ) ( not ( = ?auto_47386 ?auto_47388 ) ) ( not ( = ?auto_47387 ?auto_47388 ) ) ( ON ?auto_47388 ?auto_47389 ) ( not ( = ?auto_47386 ?auto_47389 ) ) ( not ( = ?auto_47387 ?auto_47389 ) ) ( not ( = ?auto_47388 ?auto_47389 ) ) ( CLEAR ?auto_47386 ) ( ON ?auto_47387 ?auto_47388 ) ( CLEAR ?auto_47387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47391 ) ( ON ?auto_47390 ?auto_47391 ) ( ON ?auto_47392 ?auto_47390 ) ( ON ?auto_47389 ?auto_47392 ) ( not ( = ?auto_47391 ?auto_47390 ) ) ( not ( = ?auto_47391 ?auto_47392 ) ) ( not ( = ?auto_47391 ?auto_47389 ) ) ( not ( = ?auto_47391 ?auto_47388 ) ) ( not ( = ?auto_47391 ?auto_47387 ) ) ( not ( = ?auto_47390 ?auto_47392 ) ) ( not ( = ?auto_47390 ?auto_47389 ) ) ( not ( = ?auto_47390 ?auto_47388 ) ) ( not ( = ?auto_47390 ?auto_47387 ) ) ( not ( = ?auto_47392 ?auto_47389 ) ) ( not ( = ?auto_47392 ?auto_47388 ) ) ( not ( = ?auto_47392 ?auto_47387 ) ) ( not ( = ?auto_47386 ?auto_47391 ) ) ( not ( = ?auto_47386 ?auto_47390 ) ) ( not ( = ?auto_47386 ?auto_47392 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47391 ?auto_47390 ?auto_47392 ?auto_47389 ?auto_47388 )
      ( MAKE-3PILE ?auto_47386 ?auto_47387 ?auto_47388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47393 - BLOCK
      ?auto_47394 - BLOCK
      ?auto_47395 - BLOCK
    )
    :vars
    (
      ?auto_47399 - BLOCK
      ?auto_47397 - BLOCK
      ?auto_47398 - BLOCK
      ?auto_47396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47393 ?auto_47394 ) ) ( not ( = ?auto_47393 ?auto_47395 ) ) ( not ( = ?auto_47394 ?auto_47395 ) ) ( ON ?auto_47395 ?auto_47399 ) ( not ( = ?auto_47393 ?auto_47399 ) ) ( not ( = ?auto_47394 ?auto_47399 ) ) ( not ( = ?auto_47395 ?auto_47399 ) ) ( ON ?auto_47394 ?auto_47395 ) ( CLEAR ?auto_47394 ) ( ON-TABLE ?auto_47397 ) ( ON ?auto_47398 ?auto_47397 ) ( ON ?auto_47396 ?auto_47398 ) ( ON ?auto_47399 ?auto_47396 ) ( not ( = ?auto_47397 ?auto_47398 ) ) ( not ( = ?auto_47397 ?auto_47396 ) ) ( not ( = ?auto_47397 ?auto_47399 ) ) ( not ( = ?auto_47397 ?auto_47395 ) ) ( not ( = ?auto_47397 ?auto_47394 ) ) ( not ( = ?auto_47398 ?auto_47396 ) ) ( not ( = ?auto_47398 ?auto_47399 ) ) ( not ( = ?auto_47398 ?auto_47395 ) ) ( not ( = ?auto_47398 ?auto_47394 ) ) ( not ( = ?auto_47396 ?auto_47399 ) ) ( not ( = ?auto_47396 ?auto_47395 ) ) ( not ( = ?auto_47396 ?auto_47394 ) ) ( not ( = ?auto_47393 ?auto_47397 ) ) ( not ( = ?auto_47393 ?auto_47398 ) ) ( not ( = ?auto_47393 ?auto_47396 ) ) ( HOLDING ?auto_47393 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47393 )
      ( MAKE-3PILE ?auto_47393 ?auto_47394 ?auto_47395 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47400 - BLOCK
      ?auto_47401 - BLOCK
      ?auto_47402 - BLOCK
    )
    :vars
    (
      ?auto_47403 - BLOCK
      ?auto_47404 - BLOCK
      ?auto_47406 - BLOCK
      ?auto_47405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47400 ?auto_47401 ) ) ( not ( = ?auto_47400 ?auto_47402 ) ) ( not ( = ?auto_47401 ?auto_47402 ) ) ( ON ?auto_47402 ?auto_47403 ) ( not ( = ?auto_47400 ?auto_47403 ) ) ( not ( = ?auto_47401 ?auto_47403 ) ) ( not ( = ?auto_47402 ?auto_47403 ) ) ( ON ?auto_47401 ?auto_47402 ) ( ON-TABLE ?auto_47404 ) ( ON ?auto_47406 ?auto_47404 ) ( ON ?auto_47405 ?auto_47406 ) ( ON ?auto_47403 ?auto_47405 ) ( not ( = ?auto_47404 ?auto_47406 ) ) ( not ( = ?auto_47404 ?auto_47405 ) ) ( not ( = ?auto_47404 ?auto_47403 ) ) ( not ( = ?auto_47404 ?auto_47402 ) ) ( not ( = ?auto_47404 ?auto_47401 ) ) ( not ( = ?auto_47406 ?auto_47405 ) ) ( not ( = ?auto_47406 ?auto_47403 ) ) ( not ( = ?auto_47406 ?auto_47402 ) ) ( not ( = ?auto_47406 ?auto_47401 ) ) ( not ( = ?auto_47405 ?auto_47403 ) ) ( not ( = ?auto_47405 ?auto_47402 ) ) ( not ( = ?auto_47405 ?auto_47401 ) ) ( not ( = ?auto_47400 ?auto_47404 ) ) ( not ( = ?auto_47400 ?auto_47406 ) ) ( not ( = ?auto_47400 ?auto_47405 ) ) ( ON ?auto_47400 ?auto_47401 ) ( CLEAR ?auto_47400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47404 ?auto_47406 ?auto_47405 ?auto_47403 ?auto_47402 ?auto_47401 )
      ( MAKE-3PILE ?auto_47400 ?auto_47401 ?auto_47402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47410 - BLOCK
      ?auto_47411 - BLOCK
      ?auto_47412 - BLOCK
    )
    :vars
    (
      ?auto_47413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47413 ?auto_47412 ) ( CLEAR ?auto_47413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47410 ) ( ON ?auto_47411 ?auto_47410 ) ( ON ?auto_47412 ?auto_47411 ) ( not ( = ?auto_47410 ?auto_47411 ) ) ( not ( = ?auto_47410 ?auto_47412 ) ) ( not ( = ?auto_47410 ?auto_47413 ) ) ( not ( = ?auto_47411 ?auto_47412 ) ) ( not ( = ?auto_47411 ?auto_47413 ) ) ( not ( = ?auto_47412 ?auto_47413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47413 ?auto_47412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47414 - BLOCK
      ?auto_47415 - BLOCK
      ?auto_47416 - BLOCK
    )
    :vars
    (
      ?auto_47417 - BLOCK
      ?auto_47418 - BLOCK
      ?auto_47419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47417 ?auto_47416 ) ( CLEAR ?auto_47417 ) ( ON-TABLE ?auto_47414 ) ( ON ?auto_47415 ?auto_47414 ) ( ON ?auto_47416 ?auto_47415 ) ( not ( = ?auto_47414 ?auto_47415 ) ) ( not ( = ?auto_47414 ?auto_47416 ) ) ( not ( = ?auto_47414 ?auto_47417 ) ) ( not ( = ?auto_47415 ?auto_47416 ) ) ( not ( = ?auto_47415 ?auto_47417 ) ) ( not ( = ?auto_47416 ?auto_47417 ) ) ( HOLDING ?auto_47418 ) ( CLEAR ?auto_47419 ) ( not ( = ?auto_47414 ?auto_47418 ) ) ( not ( = ?auto_47414 ?auto_47419 ) ) ( not ( = ?auto_47415 ?auto_47418 ) ) ( not ( = ?auto_47415 ?auto_47419 ) ) ( not ( = ?auto_47416 ?auto_47418 ) ) ( not ( = ?auto_47416 ?auto_47419 ) ) ( not ( = ?auto_47417 ?auto_47418 ) ) ( not ( = ?auto_47417 ?auto_47419 ) ) ( not ( = ?auto_47418 ?auto_47419 ) ) )
    :subtasks
    ( ( !STACK ?auto_47418 ?auto_47419 )
      ( MAKE-3PILE ?auto_47414 ?auto_47415 ?auto_47416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47420 - BLOCK
      ?auto_47421 - BLOCK
      ?auto_47422 - BLOCK
    )
    :vars
    (
      ?auto_47425 - BLOCK
      ?auto_47424 - BLOCK
      ?auto_47423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47425 ?auto_47422 ) ( ON-TABLE ?auto_47420 ) ( ON ?auto_47421 ?auto_47420 ) ( ON ?auto_47422 ?auto_47421 ) ( not ( = ?auto_47420 ?auto_47421 ) ) ( not ( = ?auto_47420 ?auto_47422 ) ) ( not ( = ?auto_47420 ?auto_47425 ) ) ( not ( = ?auto_47421 ?auto_47422 ) ) ( not ( = ?auto_47421 ?auto_47425 ) ) ( not ( = ?auto_47422 ?auto_47425 ) ) ( CLEAR ?auto_47424 ) ( not ( = ?auto_47420 ?auto_47423 ) ) ( not ( = ?auto_47420 ?auto_47424 ) ) ( not ( = ?auto_47421 ?auto_47423 ) ) ( not ( = ?auto_47421 ?auto_47424 ) ) ( not ( = ?auto_47422 ?auto_47423 ) ) ( not ( = ?auto_47422 ?auto_47424 ) ) ( not ( = ?auto_47425 ?auto_47423 ) ) ( not ( = ?auto_47425 ?auto_47424 ) ) ( not ( = ?auto_47423 ?auto_47424 ) ) ( ON ?auto_47423 ?auto_47425 ) ( CLEAR ?auto_47423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47420 ?auto_47421 ?auto_47422 ?auto_47425 )
      ( MAKE-3PILE ?auto_47420 ?auto_47421 ?auto_47422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47426 - BLOCK
      ?auto_47427 - BLOCK
      ?auto_47428 - BLOCK
    )
    :vars
    (
      ?auto_47431 - BLOCK
      ?auto_47429 - BLOCK
      ?auto_47430 - BLOCK
      ?auto_47432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47431 ?auto_47428 ) ( ON-TABLE ?auto_47426 ) ( ON ?auto_47427 ?auto_47426 ) ( ON ?auto_47428 ?auto_47427 ) ( not ( = ?auto_47426 ?auto_47427 ) ) ( not ( = ?auto_47426 ?auto_47428 ) ) ( not ( = ?auto_47426 ?auto_47431 ) ) ( not ( = ?auto_47427 ?auto_47428 ) ) ( not ( = ?auto_47427 ?auto_47431 ) ) ( not ( = ?auto_47428 ?auto_47431 ) ) ( not ( = ?auto_47426 ?auto_47429 ) ) ( not ( = ?auto_47426 ?auto_47430 ) ) ( not ( = ?auto_47427 ?auto_47429 ) ) ( not ( = ?auto_47427 ?auto_47430 ) ) ( not ( = ?auto_47428 ?auto_47429 ) ) ( not ( = ?auto_47428 ?auto_47430 ) ) ( not ( = ?auto_47431 ?auto_47429 ) ) ( not ( = ?auto_47431 ?auto_47430 ) ) ( not ( = ?auto_47429 ?auto_47430 ) ) ( ON ?auto_47429 ?auto_47431 ) ( CLEAR ?auto_47429 ) ( HOLDING ?auto_47430 ) ( CLEAR ?auto_47432 ) ( ON-TABLE ?auto_47432 ) ( not ( = ?auto_47432 ?auto_47430 ) ) ( not ( = ?auto_47426 ?auto_47432 ) ) ( not ( = ?auto_47427 ?auto_47432 ) ) ( not ( = ?auto_47428 ?auto_47432 ) ) ( not ( = ?auto_47431 ?auto_47432 ) ) ( not ( = ?auto_47429 ?auto_47432 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47432 ?auto_47430 )
      ( MAKE-3PILE ?auto_47426 ?auto_47427 ?auto_47428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48124 - BLOCK
      ?auto_48125 - BLOCK
      ?auto_48126 - BLOCK
    )
    :vars
    (
      ?auto_48128 - BLOCK
      ?auto_48127 - BLOCK
      ?auto_48129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48128 ?auto_48126 ) ( ON-TABLE ?auto_48124 ) ( ON ?auto_48125 ?auto_48124 ) ( ON ?auto_48126 ?auto_48125 ) ( not ( = ?auto_48124 ?auto_48125 ) ) ( not ( = ?auto_48124 ?auto_48126 ) ) ( not ( = ?auto_48124 ?auto_48128 ) ) ( not ( = ?auto_48125 ?auto_48126 ) ) ( not ( = ?auto_48125 ?auto_48128 ) ) ( not ( = ?auto_48126 ?auto_48128 ) ) ( not ( = ?auto_48124 ?auto_48127 ) ) ( not ( = ?auto_48124 ?auto_48129 ) ) ( not ( = ?auto_48125 ?auto_48127 ) ) ( not ( = ?auto_48125 ?auto_48129 ) ) ( not ( = ?auto_48126 ?auto_48127 ) ) ( not ( = ?auto_48126 ?auto_48129 ) ) ( not ( = ?auto_48128 ?auto_48127 ) ) ( not ( = ?auto_48128 ?auto_48129 ) ) ( not ( = ?auto_48127 ?auto_48129 ) ) ( ON ?auto_48127 ?auto_48128 ) ( ON ?auto_48129 ?auto_48127 ) ( CLEAR ?auto_48129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48124 ?auto_48125 ?auto_48126 ?auto_48128 ?auto_48127 )
      ( MAKE-3PILE ?auto_48124 ?auto_48125 ?auto_48126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47440 - BLOCK
      ?auto_47441 - BLOCK
      ?auto_47442 - BLOCK
    )
    :vars
    (
      ?auto_47445 - BLOCK
      ?auto_47446 - BLOCK
      ?auto_47444 - BLOCK
      ?auto_47443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47445 ?auto_47442 ) ( ON-TABLE ?auto_47440 ) ( ON ?auto_47441 ?auto_47440 ) ( ON ?auto_47442 ?auto_47441 ) ( not ( = ?auto_47440 ?auto_47441 ) ) ( not ( = ?auto_47440 ?auto_47442 ) ) ( not ( = ?auto_47440 ?auto_47445 ) ) ( not ( = ?auto_47441 ?auto_47442 ) ) ( not ( = ?auto_47441 ?auto_47445 ) ) ( not ( = ?auto_47442 ?auto_47445 ) ) ( not ( = ?auto_47440 ?auto_47446 ) ) ( not ( = ?auto_47440 ?auto_47444 ) ) ( not ( = ?auto_47441 ?auto_47446 ) ) ( not ( = ?auto_47441 ?auto_47444 ) ) ( not ( = ?auto_47442 ?auto_47446 ) ) ( not ( = ?auto_47442 ?auto_47444 ) ) ( not ( = ?auto_47445 ?auto_47446 ) ) ( not ( = ?auto_47445 ?auto_47444 ) ) ( not ( = ?auto_47446 ?auto_47444 ) ) ( ON ?auto_47446 ?auto_47445 ) ( not ( = ?auto_47443 ?auto_47444 ) ) ( not ( = ?auto_47440 ?auto_47443 ) ) ( not ( = ?auto_47441 ?auto_47443 ) ) ( not ( = ?auto_47442 ?auto_47443 ) ) ( not ( = ?auto_47445 ?auto_47443 ) ) ( not ( = ?auto_47446 ?auto_47443 ) ) ( ON ?auto_47444 ?auto_47446 ) ( CLEAR ?auto_47444 ) ( HOLDING ?auto_47443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47443 )
      ( MAKE-3PILE ?auto_47440 ?auto_47441 ?auto_47442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47447 - BLOCK
      ?auto_47448 - BLOCK
      ?auto_47449 - BLOCK
    )
    :vars
    (
      ?auto_47450 - BLOCK
      ?auto_47451 - BLOCK
      ?auto_47453 - BLOCK
      ?auto_47452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47450 ?auto_47449 ) ( ON-TABLE ?auto_47447 ) ( ON ?auto_47448 ?auto_47447 ) ( ON ?auto_47449 ?auto_47448 ) ( not ( = ?auto_47447 ?auto_47448 ) ) ( not ( = ?auto_47447 ?auto_47449 ) ) ( not ( = ?auto_47447 ?auto_47450 ) ) ( not ( = ?auto_47448 ?auto_47449 ) ) ( not ( = ?auto_47448 ?auto_47450 ) ) ( not ( = ?auto_47449 ?auto_47450 ) ) ( not ( = ?auto_47447 ?auto_47451 ) ) ( not ( = ?auto_47447 ?auto_47453 ) ) ( not ( = ?auto_47448 ?auto_47451 ) ) ( not ( = ?auto_47448 ?auto_47453 ) ) ( not ( = ?auto_47449 ?auto_47451 ) ) ( not ( = ?auto_47449 ?auto_47453 ) ) ( not ( = ?auto_47450 ?auto_47451 ) ) ( not ( = ?auto_47450 ?auto_47453 ) ) ( not ( = ?auto_47451 ?auto_47453 ) ) ( ON ?auto_47451 ?auto_47450 ) ( not ( = ?auto_47452 ?auto_47453 ) ) ( not ( = ?auto_47447 ?auto_47452 ) ) ( not ( = ?auto_47448 ?auto_47452 ) ) ( not ( = ?auto_47449 ?auto_47452 ) ) ( not ( = ?auto_47450 ?auto_47452 ) ) ( not ( = ?auto_47451 ?auto_47452 ) ) ( ON ?auto_47453 ?auto_47451 ) ( ON ?auto_47452 ?auto_47453 ) ( CLEAR ?auto_47452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47447 ?auto_47448 ?auto_47449 ?auto_47450 ?auto_47451 ?auto_47453 )
      ( MAKE-3PILE ?auto_47447 ?auto_47448 ?auto_47449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47458 - BLOCK
      ?auto_47459 - BLOCK
      ?auto_47460 - BLOCK
      ?auto_47461 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47461 ) ( CLEAR ?auto_47460 ) ( ON-TABLE ?auto_47458 ) ( ON ?auto_47459 ?auto_47458 ) ( ON ?auto_47460 ?auto_47459 ) ( not ( = ?auto_47458 ?auto_47459 ) ) ( not ( = ?auto_47458 ?auto_47460 ) ) ( not ( = ?auto_47458 ?auto_47461 ) ) ( not ( = ?auto_47459 ?auto_47460 ) ) ( not ( = ?auto_47459 ?auto_47461 ) ) ( not ( = ?auto_47460 ?auto_47461 ) ) )
    :subtasks
    ( ( !STACK ?auto_47461 ?auto_47460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47462 - BLOCK
      ?auto_47463 - BLOCK
      ?auto_47464 - BLOCK
      ?auto_47465 - BLOCK
    )
    :vars
    (
      ?auto_47466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47464 ) ( ON-TABLE ?auto_47462 ) ( ON ?auto_47463 ?auto_47462 ) ( ON ?auto_47464 ?auto_47463 ) ( not ( = ?auto_47462 ?auto_47463 ) ) ( not ( = ?auto_47462 ?auto_47464 ) ) ( not ( = ?auto_47462 ?auto_47465 ) ) ( not ( = ?auto_47463 ?auto_47464 ) ) ( not ( = ?auto_47463 ?auto_47465 ) ) ( not ( = ?auto_47464 ?auto_47465 ) ) ( ON ?auto_47465 ?auto_47466 ) ( CLEAR ?auto_47465 ) ( HAND-EMPTY ) ( not ( = ?auto_47462 ?auto_47466 ) ) ( not ( = ?auto_47463 ?auto_47466 ) ) ( not ( = ?auto_47464 ?auto_47466 ) ) ( not ( = ?auto_47465 ?auto_47466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47465 ?auto_47466 )
      ( MAKE-4PILE ?auto_47462 ?auto_47463 ?auto_47464 ?auto_47465 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47467 - BLOCK
      ?auto_47468 - BLOCK
      ?auto_47469 - BLOCK
      ?auto_47470 - BLOCK
    )
    :vars
    (
      ?auto_47471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47467 ) ( ON ?auto_47468 ?auto_47467 ) ( not ( = ?auto_47467 ?auto_47468 ) ) ( not ( = ?auto_47467 ?auto_47469 ) ) ( not ( = ?auto_47467 ?auto_47470 ) ) ( not ( = ?auto_47468 ?auto_47469 ) ) ( not ( = ?auto_47468 ?auto_47470 ) ) ( not ( = ?auto_47469 ?auto_47470 ) ) ( ON ?auto_47470 ?auto_47471 ) ( CLEAR ?auto_47470 ) ( not ( = ?auto_47467 ?auto_47471 ) ) ( not ( = ?auto_47468 ?auto_47471 ) ) ( not ( = ?auto_47469 ?auto_47471 ) ) ( not ( = ?auto_47470 ?auto_47471 ) ) ( HOLDING ?auto_47469 ) ( CLEAR ?auto_47468 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47467 ?auto_47468 ?auto_47469 )
      ( MAKE-4PILE ?auto_47467 ?auto_47468 ?auto_47469 ?auto_47470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47472 - BLOCK
      ?auto_47473 - BLOCK
      ?auto_47474 - BLOCK
      ?auto_47475 - BLOCK
    )
    :vars
    (
      ?auto_47476 - BLOCK
      ?auto_47478 - BLOCK
      ?auto_47477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47472 ) ( ON ?auto_47473 ?auto_47472 ) ( not ( = ?auto_47472 ?auto_47473 ) ) ( not ( = ?auto_47472 ?auto_47474 ) ) ( not ( = ?auto_47472 ?auto_47475 ) ) ( not ( = ?auto_47473 ?auto_47474 ) ) ( not ( = ?auto_47473 ?auto_47475 ) ) ( not ( = ?auto_47474 ?auto_47475 ) ) ( ON ?auto_47475 ?auto_47476 ) ( not ( = ?auto_47472 ?auto_47476 ) ) ( not ( = ?auto_47473 ?auto_47476 ) ) ( not ( = ?auto_47474 ?auto_47476 ) ) ( not ( = ?auto_47475 ?auto_47476 ) ) ( CLEAR ?auto_47473 ) ( ON ?auto_47474 ?auto_47475 ) ( CLEAR ?auto_47474 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47478 ) ( ON ?auto_47477 ?auto_47478 ) ( ON ?auto_47476 ?auto_47477 ) ( not ( = ?auto_47478 ?auto_47477 ) ) ( not ( = ?auto_47478 ?auto_47476 ) ) ( not ( = ?auto_47478 ?auto_47475 ) ) ( not ( = ?auto_47478 ?auto_47474 ) ) ( not ( = ?auto_47477 ?auto_47476 ) ) ( not ( = ?auto_47477 ?auto_47475 ) ) ( not ( = ?auto_47477 ?auto_47474 ) ) ( not ( = ?auto_47472 ?auto_47478 ) ) ( not ( = ?auto_47472 ?auto_47477 ) ) ( not ( = ?auto_47473 ?auto_47478 ) ) ( not ( = ?auto_47473 ?auto_47477 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47478 ?auto_47477 ?auto_47476 ?auto_47475 )
      ( MAKE-4PILE ?auto_47472 ?auto_47473 ?auto_47474 ?auto_47475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47479 - BLOCK
      ?auto_47480 - BLOCK
      ?auto_47481 - BLOCK
      ?auto_47482 - BLOCK
    )
    :vars
    (
      ?auto_47484 - BLOCK
      ?auto_47483 - BLOCK
      ?auto_47485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47479 ) ( not ( = ?auto_47479 ?auto_47480 ) ) ( not ( = ?auto_47479 ?auto_47481 ) ) ( not ( = ?auto_47479 ?auto_47482 ) ) ( not ( = ?auto_47480 ?auto_47481 ) ) ( not ( = ?auto_47480 ?auto_47482 ) ) ( not ( = ?auto_47481 ?auto_47482 ) ) ( ON ?auto_47482 ?auto_47484 ) ( not ( = ?auto_47479 ?auto_47484 ) ) ( not ( = ?auto_47480 ?auto_47484 ) ) ( not ( = ?auto_47481 ?auto_47484 ) ) ( not ( = ?auto_47482 ?auto_47484 ) ) ( ON ?auto_47481 ?auto_47482 ) ( CLEAR ?auto_47481 ) ( ON-TABLE ?auto_47483 ) ( ON ?auto_47485 ?auto_47483 ) ( ON ?auto_47484 ?auto_47485 ) ( not ( = ?auto_47483 ?auto_47485 ) ) ( not ( = ?auto_47483 ?auto_47484 ) ) ( not ( = ?auto_47483 ?auto_47482 ) ) ( not ( = ?auto_47483 ?auto_47481 ) ) ( not ( = ?auto_47485 ?auto_47484 ) ) ( not ( = ?auto_47485 ?auto_47482 ) ) ( not ( = ?auto_47485 ?auto_47481 ) ) ( not ( = ?auto_47479 ?auto_47483 ) ) ( not ( = ?auto_47479 ?auto_47485 ) ) ( not ( = ?auto_47480 ?auto_47483 ) ) ( not ( = ?auto_47480 ?auto_47485 ) ) ( HOLDING ?auto_47480 ) ( CLEAR ?auto_47479 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47479 ?auto_47480 )
      ( MAKE-4PILE ?auto_47479 ?auto_47480 ?auto_47481 ?auto_47482 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47486 - BLOCK
      ?auto_47487 - BLOCK
      ?auto_47488 - BLOCK
      ?auto_47489 - BLOCK
    )
    :vars
    (
      ?auto_47492 - BLOCK
      ?auto_47491 - BLOCK
      ?auto_47490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47486 ) ( not ( = ?auto_47486 ?auto_47487 ) ) ( not ( = ?auto_47486 ?auto_47488 ) ) ( not ( = ?auto_47486 ?auto_47489 ) ) ( not ( = ?auto_47487 ?auto_47488 ) ) ( not ( = ?auto_47487 ?auto_47489 ) ) ( not ( = ?auto_47488 ?auto_47489 ) ) ( ON ?auto_47489 ?auto_47492 ) ( not ( = ?auto_47486 ?auto_47492 ) ) ( not ( = ?auto_47487 ?auto_47492 ) ) ( not ( = ?auto_47488 ?auto_47492 ) ) ( not ( = ?auto_47489 ?auto_47492 ) ) ( ON ?auto_47488 ?auto_47489 ) ( ON-TABLE ?auto_47491 ) ( ON ?auto_47490 ?auto_47491 ) ( ON ?auto_47492 ?auto_47490 ) ( not ( = ?auto_47491 ?auto_47490 ) ) ( not ( = ?auto_47491 ?auto_47492 ) ) ( not ( = ?auto_47491 ?auto_47489 ) ) ( not ( = ?auto_47491 ?auto_47488 ) ) ( not ( = ?auto_47490 ?auto_47492 ) ) ( not ( = ?auto_47490 ?auto_47489 ) ) ( not ( = ?auto_47490 ?auto_47488 ) ) ( not ( = ?auto_47486 ?auto_47491 ) ) ( not ( = ?auto_47486 ?auto_47490 ) ) ( not ( = ?auto_47487 ?auto_47491 ) ) ( not ( = ?auto_47487 ?auto_47490 ) ) ( CLEAR ?auto_47486 ) ( ON ?auto_47487 ?auto_47488 ) ( CLEAR ?auto_47487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47491 ?auto_47490 ?auto_47492 ?auto_47489 ?auto_47488 )
      ( MAKE-4PILE ?auto_47486 ?auto_47487 ?auto_47488 ?auto_47489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47493 - BLOCK
      ?auto_47494 - BLOCK
      ?auto_47495 - BLOCK
      ?auto_47496 - BLOCK
    )
    :vars
    (
      ?auto_47499 - BLOCK
      ?auto_47498 - BLOCK
      ?auto_47497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47493 ?auto_47494 ) ) ( not ( = ?auto_47493 ?auto_47495 ) ) ( not ( = ?auto_47493 ?auto_47496 ) ) ( not ( = ?auto_47494 ?auto_47495 ) ) ( not ( = ?auto_47494 ?auto_47496 ) ) ( not ( = ?auto_47495 ?auto_47496 ) ) ( ON ?auto_47496 ?auto_47499 ) ( not ( = ?auto_47493 ?auto_47499 ) ) ( not ( = ?auto_47494 ?auto_47499 ) ) ( not ( = ?auto_47495 ?auto_47499 ) ) ( not ( = ?auto_47496 ?auto_47499 ) ) ( ON ?auto_47495 ?auto_47496 ) ( ON-TABLE ?auto_47498 ) ( ON ?auto_47497 ?auto_47498 ) ( ON ?auto_47499 ?auto_47497 ) ( not ( = ?auto_47498 ?auto_47497 ) ) ( not ( = ?auto_47498 ?auto_47499 ) ) ( not ( = ?auto_47498 ?auto_47496 ) ) ( not ( = ?auto_47498 ?auto_47495 ) ) ( not ( = ?auto_47497 ?auto_47499 ) ) ( not ( = ?auto_47497 ?auto_47496 ) ) ( not ( = ?auto_47497 ?auto_47495 ) ) ( not ( = ?auto_47493 ?auto_47498 ) ) ( not ( = ?auto_47493 ?auto_47497 ) ) ( not ( = ?auto_47494 ?auto_47498 ) ) ( not ( = ?auto_47494 ?auto_47497 ) ) ( ON ?auto_47494 ?auto_47495 ) ( CLEAR ?auto_47494 ) ( HOLDING ?auto_47493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47493 )
      ( MAKE-4PILE ?auto_47493 ?auto_47494 ?auto_47495 ?auto_47496 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47500 - BLOCK
      ?auto_47501 - BLOCK
      ?auto_47502 - BLOCK
      ?auto_47503 - BLOCK
    )
    :vars
    (
      ?auto_47504 - BLOCK
      ?auto_47505 - BLOCK
      ?auto_47506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47500 ?auto_47501 ) ) ( not ( = ?auto_47500 ?auto_47502 ) ) ( not ( = ?auto_47500 ?auto_47503 ) ) ( not ( = ?auto_47501 ?auto_47502 ) ) ( not ( = ?auto_47501 ?auto_47503 ) ) ( not ( = ?auto_47502 ?auto_47503 ) ) ( ON ?auto_47503 ?auto_47504 ) ( not ( = ?auto_47500 ?auto_47504 ) ) ( not ( = ?auto_47501 ?auto_47504 ) ) ( not ( = ?auto_47502 ?auto_47504 ) ) ( not ( = ?auto_47503 ?auto_47504 ) ) ( ON ?auto_47502 ?auto_47503 ) ( ON-TABLE ?auto_47505 ) ( ON ?auto_47506 ?auto_47505 ) ( ON ?auto_47504 ?auto_47506 ) ( not ( = ?auto_47505 ?auto_47506 ) ) ( not ( = ?auto_47505 ?auto_47504 ) ) ( not ( = ?auto_47505 ?auto_47503 ) ) ( not ( = ?auto_47505 ?auto_47502 ) ) ( not ( = ?auto_47506 ?auto_47504 ) ) ( not ( = ?auto_47506 ?auto_47503 ) ) ( not ( = ?auto_47506 ?auto_47502 ) ) ( not ( = ?auto_47500 ?auto_47505 ) ) ( not ( = ?auto_47500 ?auto_47506 ) ) ( not ( = ?auto_47501 ?auto_47505 ) ) ( not ( = ?auto_47501 ?auto_47506 ) ) ( ON ?auto_47501 ?auto_47502 ) ( ON ?auto_47500 ?auto_47501 ) ( CLEAR ?auto_47500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47505 ?auto_47506 ?auto_47504 ?auto_47503 ?auto_47502 ?auto_47501 )
      ( MAKE-4PILE ?auto_47500 ?auto_47501 ?auto_47502 ?auto_47503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47509 - BLOCK
      ?auto_47510 - BLOCK
    )
    :vars
    (
      ?auto_47511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47511 ?auto_47510 ) ( CLEAR ?auto_47511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47509 ) ( ON ?auto_47510 ?auto_47509 ) ( not ( = ?auto_47509 ?auto_47510 ) ) ( not ( = ?auto_47509 ?auto_47511 ) ) ( not ( = ?auto_47510 ?auto_47511 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47511 ?auto_47510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47512 - BLOCK
      ?auto_47513 - BLOCK
    )
    :vars
    (
      ?auto_47514 - BLOCK
      ?auto_47515 - BLOCK
      ?auto_47516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47514 ?auto_47513 ) ( CLEAR ?auto_47514 ) ( ON-TABLE ?auto_47512 ) ( ON ?auto_47513 ?auto_47512 ) ( not ( = ?auto_47512 ?auto_47513 ) ) ( not ( = ?auto_47512 ?auto_47514 ) ) ( not ( = ?auto_47513 ?auto_47514 ) ) ( HOLDING ?auto_47515 ) ( CLEAR ?auto_47516 ) ( not ( = ?auto_47512 ?auto_47515 ) ) ( not ( = ?auto_47512 ?auto_47516 ) ) ( not ( = ?auto_47513 ?auto_47515 ) ) ( not ( = ?auto_47513 ?auto_47516 ) ) ( not ( = ?auto_47514 ?auto_47515 ) ) ( not ( = ?auto_47514 ?auto_47516 ) ) ( not ( = ?auto_47515 ?auto_47516 ) ) )
    :subtasks
    ( ( !STACK ?auto_47515 ?auto_47516 )
      ( MAKE-2PILE ?auto_47512 ?auto_47513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47517 - BLOCK
      ?auto_47518 - BLOCK
    )
    :vars
    (
      ?auto_47519 - BLOCK
      ?auto_47520 - BLOCK
      ?auto_47521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47519 ?auto_47518 ) ( ON-TABLE ?auto_47517 ) ( ON ?auto_47518 ?auto_47517 ) ( not ( = ?auto_47517 ?auto_47518 ) ) ( not ( = ?auto_47517 ?auto_47519 ) ) ( not ( = ?auto_47518 ?auto_47519 ) ) ( CLEAR ?auto_47520 ) ( not ( = ?auto_47517 ?auto_47521 ) ) ( not ( = ?auto_47517 ?auto_47520 ) ) ( not ( = ?auto_47518 ?auto_47521 ) ) ( not ( = ?auto_47518 ?auto_47520 ) ) ( not ( = ?auto_47519 ?auto_47521 ) ) ( not ( = ?auto_47519 ?auto_47520 ) ) ( not ( = ?auto_47521 ?auto_47520 ) ) ( ON ?auto_47521 ?auto_47519 ) ( CLEAR ?auto_47521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47517 ?auto_47518 ?auto_47519 )
      ( MAKE-2PILE ?auto_47517 ?auto_47518 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47522 - BLOCK
      ?auto_47523 - BLOCK
    )
    :vars
    (
      ?auto_47525 - BLOCK
      ?auto_47524 - BLOCK
      ?auto_47526 - BLOCK
      ?auto_47528 - BLOCK
      ?auto_47527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47525 ?auto_47523 ) ( ON-TABLE ?auto_47522 ) ( ON ?auto_47523 ?auto_47522 ) ( not ( = ?auto_47522 ?auto_47523 ) ) ( not ( = ?auto_47522 ?auto_47525 ) ) ( not ( = ?auto_47523 ?auto_47525 ) ) ( not ( = ?auto_47522 ?auto_47524 ) ) ( not ( = ?auto_47522 ?auto_47526 ) ) ( not ( = ?auto_47523 ?auto_47524 ) ) ( not ( = ?auto_47523 ?auto_47526 ) ) ( not ( = ?auto_47525 ?auto_47524 ) ) ( not ( = ?auto_47525 ?auto_47526 ) ) ( not ( = ?auto_47524 ?auto_47526 ) ) ( ON ?auto_47524 ?auto_47525 ) ( CLEAR ?auto_47524 ) ( HOLDING ?auto_47526 ) ( CLEAR ?auto_47528 ) ( ON-TABLE ?auto_47527 ) ( ON ?auto_47528 ?auto_47527 ) ( not ( = ?auto_47527 ?auto_47528 ) ) ( not ( = ?auto_47527 ?auto_47526 ) ) ( not ( = ?auto_47528 ?auto_47526 ) ) ( not ( = ?auto_47522 ?auto_47528 ) ) ( not ( = ?auto_47522 ?auto_47527 ) ) ( not ( = ?auto_47523 ?auto_47528 ) ) ( not ( = ?auto_47523 ?auto_47527 ) ) ( not ( = ?auto_47525 ?auto_47528 ) ) ( not ( = ?auto_47525 ?auto_47527 ) ) ( not ( = ?auto_47524 ?auto_47528 ) ) ( not ( = ?auto_47524 ?auto_47527 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47527 ?auto_47528 ?auto_47526 )
      ( MAKE-2PILE ?auto_47522 ?auto_47523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47529 - BLOCK
      ?auto_47530 - BLOCK
    )
    :vars
    (
      ?auto_47531 - BLOCK
      ?auto_47535 - BLOCK
      ?auto_47533 - BLOCK
      ?auto_47534 - BLOCK
      ?auto_47532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47531 ?auto_47530 ) ( ON-TABLE ?auto_47529 ) ( ON ?auto_47530 ?auto_47529 ) ( not ( = ?auto_47529 ?auto_47530 ) ) ( not ( = ?auto_47529 ?auto_47531 ) ) ( not ( = ?auto_47530 ?auto_47531 ) ) ( not ( = ?auto_47529 ?auto_47535 ) ) ( not ( = ?auto_47529 ?auto_47533 ) ) ( not ( = ?auto_47530 ?auto_47535 ) ) ( not ( = ?auto_47530 ?auto_47533 ) ) ( not ( = ?auto_47531 ?auto_47535 ) ) ( not ( = ?auto_47531 ?auto_47533 ) ) ( not ( = ?auto_47535 ?auto_47533 ) ) ( ON ?auto_47535 ?auto_47531 ) ( CLEAR ?auto_47534 ) ( ON-TABLE ?auto_47532 ) ( ON ?auto_47534 ?auto_47532 ) ( not ( = ?auto_47532 ?auto_47534 ) ) ( not ( = ?auto_47532 ?auto_47533 ) ) ( not ( = ?auto_47534 ?auto_47533 ) ) ( not ( = ?auto_47529 ?auto_47534 ) ) ( not ( = ?auto_47529 ?auto_47532 ) ) ( not ( = ?auto_47530 ?auto_47534 ) ) ( not ( = ?auto_47530 ?auto_47532 ) ) ( not ( = ?auto_47531 ?auto_47534 ) ) ( not ( = ?auto_47531 ?auto_47532 ) ) ( not ( = ?auto_47535 ?auto_47534 ) ) ( not ( = ?auto_47535 ?auto_47532 ) ) ( ON ?auto_47533 ?auto_47535 ) ( CLEAR ?auto_47533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47529 ?auto_47530 ?auto_47531 ?auto_47535 )
      ( MAKE-2PILE ?auto_47529 ?auto_47530 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47536 - BLOCK
      ?auto_47537 - BLOCK
    )
    :vars
    (
      ?auto_47541 - BLOCK
      ?auto_47538 - BLOCK
      ?auto_47542 - BLOCK
      ?auto_47540 - BLOCK
      ?auto_47539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47541 ?auto_47537 ) ( ON-TABLE ?auto_47536 ) ( ON ?auto_47537 ?auto_47536 ) ( not ( = ?auto_47536 ?auto_47537 ) ) ( not ( = ?auto_47536 ?auto_47541 ) ) ( not ( = ?auto_47537 ?auto_47541 ) ) ( not ( = ?auto_47536 ?auto_47538 ) ) ( not ( = ?auto_47536 ?auto_47542 ) ) ( not ( = ?auto_47537 ?auto_47538 ) ) ( not ( = ?auto_47537 ?auto_47542 ) ) ( not ( = ?auto_47541 ?auto_47538 ) ) ( not ( = ?auto_47541 ?auto_47542 ) ) ( not ( = ?auto_47538 ?auto_47542 ) ) ( ON ?auto_47538 ?auto_47541 ) ( ON-TABLE ?auto_47540 ) ( not ( = ?auto_47540 ?auto_47539 ) ) ( not ( = ?auto_47540 ?auto_47542 ) ) ( not ( = ?auto_47539 ?auto_47542 ) ) ( not ( = ?auto_47536 ?auto_47539 ) ) ( not ( = ?auto_47536 ?auto_47540 ) ) ( not ( = ?auto_47537 ?auto_47539 ) ) ( not ( = ?auto_47537 ?auto_47540 ) ) ( not ( = ?auto_47541 ?auto_47539 ) ) ( not ( = ?auto_47541 ?auto_47540 ) ) ( not ( = ?auto_47538 ?auto_47539 ) ) ( not ( = ?auto_47538 ?auto_47540 ) ) ( ON ?auto_47542 ?auto_47538 ) ( CLEAR ?auto_47542 ) ( HOLDING ?auto_47539 ) ( CLEAR ?auto_47540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47540 ?auto_47539 )
      ( MAKE-2PILE ?auto_47536 ?auto_47537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48314 - BLOCK
      ?auto_48315 - BLOCK
    )
    :vars
    (
      ?auto_48318 - BLOCK
      ?auto_48319 - BLOCK
      ?auto_48317 - BLOCK
      ?auto_48316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48318 ?auto_48315 ) ( ON-TABLE ?auto_48314 ) ( ON ?auto_48315 ?auto_48314 ) ( not ( = ?auto_48314 ?auto_48315 ) ) ( not ( = ?auto_48314 ?auto_48318 ) ) ( not ( = ?auto_48315 ?auto_48318 ) ) ( not ( = ?auto_48314 ?auto_48319 ) ) ( not ( = ?auto_48314 ?auto_48317 ) ) ( not ( = ?auto_48315 ?auto_48319 ) ) ( not ( = ?auto_48315 ?auto_48317 ) ) ( not ( = ?auto_48318 ?auto_48319 ) ) ( not ( = ?auto_48318 ?auto_48317 ) ) ( not ( = ?auto_48319 ?auto_48317 ) ) ( ON ?auto_48319 ?auto_48318 ) ( not ( = ?auto_48316 ?auto_48317 ) ) ( not ( = ?auto_48314 ?auto_48316 ) ) ( not ( = ?auto_48315 ?auto_48316 ) ) ( not ( = ?auto_48318 ?auto_48316 ) ) ( not ( = ?auto_48319 ?auto_48316 ) ) ( ON ?auto_48317 ?auto_48319 ) ( ON ?auto_48316 ?auto_48317 ) ( CLEAR ?auto_48316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48314 ?auto_48315 ?auto_48318 ?auto_48319 ?auto_48317 )
      ( MAKE-2PILE ?auto_48314 ?auto_48315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47550 - BLOCK
      ?auto_47551 - BLOCK
    )
    :vars
    (
      ?auto_47556 - BLOCK
      ?auto_47552 - BLOCK
      ?auto_47553 - BLOCK
      ?auto_47554 - BLOCK
      ?auto_47555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47556 ?auto_47551 ) ( ON-TABLE ?auto_47550 ) ( ON ?auto_47551 ?auto_47550 ) ( not ( = ?auto_47550 ?auto_47551 ) ) ( not ( = ?auto_47550 ?auto_47556 ) ) ( not ( = ?auto_47551 ?auto_47556 ) ) ( not ( = ?auto_47550 ?auto_47552 ) ) ( not ( = ?auto_47550 ?auto_47553 ) ) ( not ( = ?auto_47551 ?auto_47552 ) ) ( not ( = ?auto_47551 ?auto_47553 ) ) ( not ( = ?auto_47556 ?auto_47552 ) ) ( not ( = ?auto_47556 ?auto_47553 ) ) ( not ( = ?auto_47552 ?auto_47553 ) ) ( ON ?auto_47552 ?auto_47556 ) ( not ( = ?auto_47554 ?auto_47555 ) ) ( not ( = ?auto_47554 ?auto_47553 ) ) ( not ( = ?auto_47555 ?auto_47553 ) ) ( not ( = ?auto_47550 ?auto_47555 ) ) ( not ( = ?auto_47550 ?auto_47554 ) ) ( not ( = ?auto_47551 ?auto_47555 ) ) ( not ( = ?auto_47551 ?auto_47554 ) ) ( not ( = ?auto_47556 ?auto_47555 ) ) ( not ( = ?auto_47556 ?auto_47554 ) ) ( not ( = ?auto_47552 ?auto_47555 ) ) ( not ( = ?auto_47552 ?auto_47554 ) ) ( ON ?auto_47553 ?auto_47552 ) ( ON ?auto_47555 ?auto_47553 ) ( CLEAR ?auto_47555 ) ( HOLDING ?auto_47554 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47554 )
      ( MAKE-2PILE ?auto_47550 ?auto_47551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47557 - BLOCK
      ?auto_47558 - BLOCK
    )
    :vars
    (
      ?auto_47562 - BLOCK
      ?auto_47563 - BLOCK
      ?auto_47561 - BLOCK
      ?auto_47560 - BLOCK
      ?auto_47559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47562 ?auto_47558 ) ( ON-TABLE ?auto_47557 ) ( ON ?auto_47558 ?auto_47557 ) ( not ( = ?auto_47557 ?auto_47558 ) ) ( not ( = ?auto_47557 ?auto_47562 ) ) ( not ( = ?auto_47558 ?auto_47562 ) ) ( not ( = ?auto_47557 ?auto_47563 ) ) ( not ( = ?auto_47557 ?auto_47561 ) ) ( not ( = ?auto_47558 ?auto_47563 ) ) ( not ( = ?auto_47558 ?auto_47561 ) ) ( not ( = ?auto_47562 ?auto_47563 ) ) ( not ( = ?auto_47562 ?auto_47561 ) ) ( not ( = ?auto_47563 ?auto_47561 ) ) ( ON ?auto_47563 ?auto_47562 ) ( not ( = ?auto_47560 ?auto_47559 ) ) ( not ( = ?auto_47560 ?auto_47561 ) ) ( not ( = ?auto_47559 ?auto_47561 ) ) ( not ( = ?auto_47557 ?auto_47559 ) ) ( not ( = ?auto_47557 ?auto_47560 ) ) ( not ( = ?auto_47558 ?auto_47559 ) ) ( not ( = ?auto_47558 ?auto_47560 ) ) ( not ( = ?auto_47562 ?auto_47559 ) ) ( not ( = ?auto_47562 ?auto_47560 ) ) ( not ( = ?auto_47563 ?auto_47559 ) ) ( not ( = ?auto_47563 ?auto_47560 ) ) ( ON ?auto_47561 ?auto_47563 ) ( ON ?auto_47559 ?auto_47561 ) ( ON ?auto_47560 ?auto_47559 ) ( CLEAR ?auto_47560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47557 ?auto_47558 ?auto_47562 ?auto_47563 ?auto_47561 ?auto_47559 )
      ( MAKE-2PILE ?auto_47557 ?auto_47558 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47569 - BLOCK
      ?auto_47570 - BLOCK
      ?auto_47571 - BLOCK
      ?auto_47572 - BLOCK
      ?auto_47573 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47573 ) ( CLEAR ?auto_47572 ) ( ON-TABLE ?auto_47569 ) ( ON ?auto_47570 ?auto_47569 ) ( ON ?auto_47571 ?auto_47570 ) ( ON ?auto_47572 ?auto_47571 ) ( not ( = ?auto_47569 ?auto_47570 ) ) ( not ( = ?auto_47569 ?auto_47571 ) ) ( not ( = ?auto_47569 ?auto_47572 ) ) ( not ( = ?auto_47569 ?auto_47573 ) ) ( not ( = ?auto_47570 ?auto_47571 ) ) ( not ( = ?auto_47570 ?auto_47572 ) ) ( not ( = ?auto_47570 ?auto_47573 ) ) ( not ( = ?auto_47571 ?auto_47572 ) ) ( not ( = ?auto_47571 ?auto_47573 ) ) ( not ( = ?auto_47572 ?auto_47573 ) ) )
    :subtasks
    ( ( !STACK ?auto_47573 ?auto_47572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47574 - BLOCK
      ?auto_47575 - BLOCK
      ?auto_47576 - BLOCK
      ?auto_47577 - BLOCK
      ?auto_47578 - BLOCK
    )
    :vars
    (
      ?auto_47579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47577 ) ( ON-TABLE ?auto_47574 ) ( ON ?auto_47575 ?auto_47574 ) ( ON ?auto_47576 ?auto_47575 ) ( ON ?auto_47577 ?auto_47576 ) ( not ( = ?auto_47574 ?auto_47575 ) ) ( not ( = ?auto_47574 ?auto_47576 ) ) ( not ( = ?auto_47574 ?auto_47577 ) ) ( not ( = ?auto_47574 ?auto_47578 ) ) ( not ( = ?auto_47575 ?auto_47576 ) ) ( not ( = ?auto_47575 ?auto_47577 ) ) ( not ( = ?auto_47575 ?auto_47578 ) ) ( not ( = ?auto_47576 ?auto_47577 ) ) ( not ( = ?auto_47576 ?auto_47578 ) ) ( not ( = ?auto_47577 ?auto_47578 ) ) ( ON ?auto_47578 ?auto_47579 ) ( CLEAR ?auto_47578 ) ( HAND-EMPTY ) ( not ( = ?auto_47574 ?auto_47579 ) ) ( not ( = ?auto_47575 ?auto_47579 ) ) ( not ( = ?auto_47576 ?auto_47579 ) ) ( not ( = ?auto_47577 ?auto_47579 ) ) ( not ( = ?auto_47578 ?auto_47579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47578 ?auto_47579 )
      ( MAKE-5PILE ?auto_47574 ?auto_47575 ?auto_47576 ?auto_47577 ?auto_47578 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47580 - BLOCK
      ?auto_47581 - BLOCK
      ?auto_47582 - BLOCK
      ?auto_47583 - BLOCK
      ?auto_47584 - BLOCK
    )
    :vars
    (
      ?auto_47585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47580 ) ( ON ?auto_47581 ?auto_47580 ) ( ON ?auto_47582 ?auto_47581 ) ( not ( = ?auto_47580 ?auto_47581 ) ) ( not ( = ?auto_47580 ?auto_47582 ) ) ( not ( = ?auto_47580 ?auto_47583 ) ) ( not ( = ?auto_47580 ?auto_47584 ) ) ( not ( = ?auto_47581 ?auto_47582 ) ) ( not ( = ?auto_47581 ?auto_47583 ) ) ( not ( = ?auto_47581 ?auto_47584 ) ) ( not ( = ?auto_47582 ?auto_47583 ) ) ( not ( = ?auto_47582 ?auto_47584 ) ) ( not ( = ?auto_47583 ?auto_47584 ) ) ( ON ?auto_47584 ?auto_47585 ) ( CLEAR ?auto_47584 ) ( not ( = ?auto_47580 ?auto_47585 ) ) ( not ( = ?auto_47581 ?auto_47585 ) ) ( not ( = ?auto_47582 ?auto_47585 ) ) ( not ( = ?auto_47583 ?auto_47585 ) ) ( not ( = ?auto_47584 ?auto_47585 ) ) ( HOLDING ?auto_47583 ) ( CLEAR ?auto_47582 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47580 ?auto_47581 ?auto_47582 ?auto_47583 )
      ( MAKE-5PILE ?auto_47580 ?auto_47581 ?auto_47582 ?auto_47583 ?auto_47584 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47586 - BLOCK
      ?auto_47587 - BLOCK
      ?auto_47588 - BLOCK
      ?auto_47589 - BLOCK
      ?auto_47590 - BLOCK
    )
    :vars
    (
      ?auto_47591 - BLOCK
      ?auto_47592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47586 ) ( ON ?auto_47587 ?auto_47586 ) ( ON ?auto_47588 ?auto_47587 ) ( not ( = ?auto_47586 ?auto_47587 ) ) ( not ( = ?auto_47586 ?auto_47588 ) ) ( not ( = ?auto_47586 ?auto_47589 ) ) ( not ( = ?auto_47586 ?auto_47590 ) ) ( not ( = ?auto_47587 ?auto_47588 ) ) ( not ( = ?auto_47587 ?auto_47589 ) ) ( not ( = ?auto_47587 ?auto_47590 ) ) ( not ( = ?auto_47588 ?auto_47589 ) ) ( not ( = ?auto_47588 ?auto_47590 ) ) ( not ( = ?auto_47589 ?auto_47590 ) ) ( ON ?auto_47590 ?auto_47591 ) ( not ( = ?auto_47586 ?auto_47591 ) ) ( not ( = ?auto_47587 ?auto_47591 ) ) ( not ( = ?auto_47588 ?auto_47591 ) ) ( not ( = ?auto_47589 ?auto_47591 ) ) ( not ( = ?auto_47590 ?auto_47591 ) ) ( CLEAR ?auto_47588 ) ( ON ?auto_47589 ?auto_47590 ) ( CLEAR ?auto_47589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47592 ) ( ON ?auto_47591 ?auto_47592 ) ( not ( = ?auto_47592 ?auto_47591 ) ) ( not ( = ?auto_47592 ?auto_47590 ) ) ( not ( = ?auto_47592 ?auto_47589 ) ) ( not ( = ?auto_47586 ?auto_47592 ) ) ( not ( = ?auto_47587 ?auto_47592 ) ) ( not ( = ?auto_47588 ?auto_47592 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47592 ?auto_47591 ?auto_47590 )
      ( MAKE-5PILE ?auto_47586 ?auto_47587 ?auto_47588 ?auto_47589 ?auto_47590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47593 - BLOCK
      ?auto_47594 - BLOCK
      ?auto_47595 - BLOCK
      ?auto_47596 - BLOCK
      ?auto_47597 - BLOCK
    )
    :vars
    (
      ?auto_47598 - BLOCK
      ?auto_47599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47593 ) ( ON ?auto_47594 ?auto_47593 ) ( not ( = ?auto_47593 ?auto_47594 ) ) ( not ( = ?auto_47593 ?auto_47595 ) ) ( not ( = ?auto_47593 ?auto_47596 ) ) ( not ( = ?auto_47593 ?auto_47597 ) ) ( not ( = ?auto_47594 ?auto_47595 ) ) ( not ( = ?auto_47594 ?auto_47596 ) ) ( not ( = ?auto_47594 ?auto_47597 ) ) ( not ( = ?auto_47595 ?auto_47596 ) ) ( not ( = ?auto_47595 ?auto_47597 ) ) ( not ( = ?auto_47596 ?auto_47597 ) ) ( ON ?auto_47597 ?auto_47598 ) ( not ( = ?auto_47593 ?auto_47598 ) ) ( not ( = ?auto_47594 ?auto_47598 ) ) ( not ( = ?auto_47595 ?auto_47598 ) ) ( not ( = ?auto_47596 ?auto_47598 ) ) ( not ( = ?auto_47597 ?auto_47598 ) ) ( ON ?auto_47596 ?auto_47597 ) ( CLEAR ?auto_47596 ) ( ON-TABLE ?auto_47599 ) ( ON ?auto_47598 ?auto_47599 ) ( not ( = ?auto_47599 ?auto_47598 ) ) ( not ( = ?auto_47599 ?auto_47597 ) ) ( not ( = ?auto_47599 ?auto_47596 ) ) ( not ( = ?auto_47593 ?auto_47599 ) ) ( not ( = ?auto_47594 ?auto_47599 ) ) ( not ( = ?auto_47595 ?auto_47599 ) ) ( HOLDING ?auto_47595 ) ( CLEAR ?auto_47594 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47593 ?auto_47594 ?auto_47595 )
      ( MAKE-5PILE ?auto_47593 ?auto_47594 ?auto_47595 ?auto_47596 ?auto_47597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47600 - BLOCK
      ?auto_47601 - BLOCK
      ?auto_47602 - BLOCK
      ?auto_47603 - BLOCK
      ?auto_47604 - BLOCK
    )
    :vars
    (
      ?auto_47605 - BLOCK
      ?auto_47606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47600 ) ( ON ?auto_47601 ?auto_47600 ) ( not ( = ?auto_47600 ?auto_47601 ) ) ( not ( = ?auto_47600 ?auto_47602 ) ) ( not ( = ?auto_47600 ?auto_47603 ) ) ( not ( = ?auto_47600 ?auto_47604 ) ) ( not ( = ?auto_47601 ?auto_47602 ) ) ( not ( = ?auto_47601 ?auto_47603 ) ) ( not ( = ?auto_47601 ?auto_47604 ) ) ( not ( = ?auto_47602 ?auto_47603 ) ) ( not ( = ?auto_47602 ?auto_47604 ) ) ( not ( = ?auto_47603 ?auto_47604 ) ) ( ON ?auto_47604 ?auto_47605 ) ( not ( = ?auto_47600 ?auto_47605 ) ) ( not ( = ?auto_47601 ?auto_47605 ) ) ( not ( = ?auto_47602 ?auto_47605 ) ) ( not ( = ?auto_47603 ?auto_47605 ) ) ( not ( = ?auto_47604 ?auto_47605 ) ) ( ON ?auto_47603 ?auto_47604 ) ( ON-TABLE ?auto_47606 ) ( ON ?auto_47605 ?auto_47606 ) ( not ( = ?auto_47606 ?auto_47605 ) ) ( not ( = ?auto_47606 ?auto_47604 ) ) ( not ( = ?auto_47606 ?auto_47603 ) ) ( not ( = ?auto_47600 ?auto_47606 ) ) ( not ( = ?auto_47601 ?auto_47606 ) ) ( not ( = ?auto_47602 ?auto_47606 ) ) ( CLEAR ?auto_47601 ) ( ON ?auto_47602 ?auto_47603 ) ( CLEAR ?auto_47602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47606 ?auto_47605 ?auto_47604 ?auto_47603 )
      ( MAKE-5PILE ?auto_47600 ?auto_47601 ?auto_47602 ?auto_47603 ?auto_47604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47607 - BLOCK
      ?auto_47608 - BLOCK
      ?auto_47609 - BLOCK
      ?auto_47610 - BLOCK
      ?auto_47611 - BLOCK
    )
    :vars
    (
      ?auto_47612 - BLOCK
      ?auto_47613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47607 ) ( not ( = ?auto_47607 ?auto_47608 ) ) ( not ( = ?auto_47607 ?auto_47609 ) ) ( not ( = ?auto_47607 ?auto_47610 ) ) ( not ( = ?auto_47607 ?auto_47611 ) ) ( not ( = ?auto_47608 ?auto_47609 ) ) ( not ( = ?auto_47608 ?auto_47610 ) ) ( not ( = ?auto_47608 ?auto_47611 ) ) ( not ( = ?auto_47609 ?auto_47610 ) ) ( not ( = ?auto_47609 ?auto_47611 ) ) ( not ( = ?auto_47610 ?auto_47611 ) ) ( ON ?auto_47611 ?auto_47612 ) ( not ( = ?auto_47607 ?auto_47612 ) ) ( not ( = ?auto_47608 ?auto_47612 ) ) ( not ( = ?auto_47609 ?auto_47612 ) ) ( not ( = ?auto_47610 ?auto_47612 ) ) ( not ( = ?auto_47611 ?auto_47612 ) ) ( ON ?auto_47610 ?auto_47611 ) ( ON-TABLE ?auto_47613 ) ( ON ?auto_47612 ?auto_47613 ) ( not ( = ?auto_47613 ?auto_47612 ) ) ( not ( = ?auto_47613 ?auto_47611 ) ) ( not ( = ?auto_47613 ?auto_47610 ) ) ( not ( = ?auto_47607 ?auto_47613 ) ) ( not ( = ?auto_47608 ?auto_47613 ) ) ( not ( = ?auto_47609 ?auto_47613 ) ) ( ON ?auto_47609 ?auto_47610 ) ( CLEAR ?auto_47609 ) ( HOLDING ?auto_47608 ) ( CLEAR ?auto_47607 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47607 ?auto_47608 )
      ( MAKE-5PILE ?auto_47607 ?auto_47608 ?auto_47609 ?auto_47610 ?auto_47611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47614 - BLOCK
      ?auto_47615 - BLOCK
      ?auto_47616 - BLOCK
      ?auto_47617 - BLOCK
      ?auto_47618 - BLOCK
    )
    :vars
    (
      ?auto_47619 - BLOCK
      ?auto_47620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47614 ) ( not ( = ?auto_47614 ?auto_47615 ) ) ( not ( = ?auto_47614 ?auto_47616 ) ) ( not ( = ?auto_47614 ?auto_47617 ) ) ( not ( = ?auto_47614 ?auto_47618 ) ) ( not ( = ?auto_47615 ?auto_47616 ) ) ( not ( = ?auto_47615 ?auto_47617 ) ) ( not ( = ?auto_47615 ?auto_47618 ) ) ( not ( = ?auto_47616 ?auto_47617 ) ) ( not ( = ?auto_47616 ?auto_47618 ) ) ( not ( = ?auto_47617 ?auto_47618 ) ) ( ON ?auto_47618 ?auto_47619 ) ( not ( = ?auto_47614 ?auto_47619 ) ) ( not ( = ?auto_47615 ?auto_47619 ) ) ( not ( = ?auto_47616 ?auto_47619 ) ) ( not ( = ?auto_47617 ?auto_47619 ) ) ( not ( = ?auto_47618 ?auto_47619 ) ) ( ON ?auto_47617 ?auto_47618 ) ( ON-TABLE ?auto_47620 ) ( ON ?auto_47619 ?auto_47620 ) ( not ( = ?auto_47620 ?auto_47619 ) ) ( not ( = ?auto_47620 ?auto_47618 ) ) ( not ( = ?auto_47620 ?auto_47617 ) ) ( not ( = ?auto_47614 ?auto_47620 ) ) ( not ( = ?auto_47615 ?auto_47620 ) ) ( not ( = ?auto_47616 ?auto_47620 ) ) ( ON ?auto_47616 ?auto_47617 ) ( CLEAR ?auto_47614 ) ( ON ?auto_47615 ?auto_47616 ) ( CLEAR ?auto_47615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47620 ?auto_47619 ?auto_47618 ?auto_47617 ?auto_47616 )
      ( MAKE-5PILE ?auto_47614 ?auto_47615 ?auto_47616 ?auto_47617 ?auto_47618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47621 - BLOCK
      ?auto_47622 - BLOCK
      ?auto_47623 - BLOCK
      ?auto_47624 - BLOCK
      ?auto_47625 - BLOCK
    )
    :vars
    (
      ?auto_47627 - BLOCK
      ?auto_47626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47621 ?auto_47622 ) ) ( not ( = ?auto_47621 ?auto_47623 ) ) ( not ( = ?auto_47621 ?auto_47624 ) ) ( not ( = ?auto_47621 ?auto_47625 ) ) ( not ( = ?auto_47622 ?auto_47623 ) ) ( not ( = ?auto_47622 ?auto_47624 ) ) ( not ( = ?auto_47622 ?auto_47625 ) ) ( not ( = ?auto_47623 ?auto_47624 ) ) ( not ( = ?auto_47623 ?auto_47625 ) ) ( not ( = ?auto_47624 ?auto_47625 ) ) ( ON ?auto_47625 ?auto_47627 ) ( not ( = ?auto_47621 ?auto_47627 ) ) ( not ( = ?auto_47622 ?auto_47627 ) ) ( not ( = ?auto_47623 ?auto_47627 ) ) ( not ( = ?auto_47624 ?auto_47627 ) ) ( not ( = ?auto_47625 ?auto_47627 ) ) ( ON ?auto_47624 ?auto_47625 ) ( ON-TABLE ?auto_47626 ) ( ON ?auto_47627 ?auto_47626 ) ( not ( = ?auto_47626 ?auto_47627 ) ) ( not ( = ?auto_47626 ?auto_47625 ) ) ( not ( = ?auto_47626 ?auto_47624 ) ) ( not ( = ?auto_47621 ?auto_47626 ) ) ( not ( = ?auto_47622 ?auto_47626 ) ) ( not ( = ?auto_47623 ?auto_47626 ) ) ( ON ?auto_47623 ?auto_47624 ) ( ON ?auto_47622 ?auto_47623 ) ( CLEAR ?auto_47622 ) ( HOLDING ?auto_47621 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47621 )
      ( MAKE-5PILE ?auto_47621 ?auto_47622 ?auto_47623 ?auto_47624 ?auto_47625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47628 - BLOCK
      ?auto_47629 - BLOCK
      ?auto_47630 - BLOCK
      ?auto_47631 - BLOCK
      ?auto_47632 - BLOCK
    )
    :vars
    (
      ?auto_47634 - BLOCK
      ?auto_47633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47628 ?auto_47629 ) ) ( not ( = ?auto_47628 ?auto_47630 ) ) ( not ( = ?auto_47628 ?auto_47631 ) ) ( not ( = ?auto_47628 ?auto_47632 ) ) ( not ( = ?auto_47629 ?auto_47630 ) ) ( not ( = ?auto_47629 ?auto_47631 ) ) ( not ( = ?auto_47629 ?auto_47632 ) ) ( not ( = ?auto_47630 ?auto_47631 ) ) ( not ( = ?auto_47630 ?auto_47632 ) ) ( not ( = ?auto_47631 ?auto_47632 ) ) ( ON ?auto_47632 ?auto_47634 ) ( not ( = ?auto_47628 ?auto_47634 ) ) ( not ( = ?auto_47629 ?auto_47634 ) ) ( not ( = ?auto_47630 ?auto_47634 ) ) ( not ( = ?auto_47631 ?auto_47634 ) ) ( not ( = ?auto_47632 ?auto_47634 ) ) ( ON ?auto_47631 ?auto_47632 ) ( ON-TABLE ?auto_47633 ) ( ON ?auto_47634 ?auto_47633 ) ( not ( = ?auto_47633 ?auto_47634 ) ) ( not ( = ?auto_47633 ?auto_47632 ) ) ( not ( = ?auto_47633 ?auto_47631 ) ) ( not ( = ?auto_47628 ?auto_47633 ) ) ( not ( = ?auto_47629 ?auto_47633 ) ) ( not ( = ?auto_47630 ?auto_47633 ) ) ( ON ?auto_47630 ?auto_47631 ) ( ON ?auto_47629 ?auto_47630 ) ( ON ?auto_47628 ?auto_47629 ) ( CLEAR ?auto_47628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47633 ?auto_47634 ?auto_47632 ?auto_47631 ?auto_47630 ?auto_47629 )
      ( MAKE-5PILE ?auto_47628 ?auto_47629 ?auto_47630 ?auto_47631 ?auto_47632 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47636 - BLOCK
    )
    :vars
    (
      ?auto_47637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47637 ?auto_47636 ) ( CLEAR ?auto_47637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47636 ) ( not ( = ?auto_47636 ?auto_47637 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47637 ?auto_47636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47638 - BLOCK
    )
    :vars
    (
      ?auto_47639 - BLOCK
      ?auto_47640 - BLOCK
      ?auto_47641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47639 ?auto_47638 ) ( CLEAR ?auto_47639 ) ( ON-TABLE ?auto_47638 ) ( not ( = ?auto_47638 ?auto_47639 ) ) ( HOLDING ?auto_47640 ) ( CLEAR ?auto_47641 ) ( not ( = ?auto_47638 ?auto_47640 ) ) ( not ( = ?auto_47638 ?auto_47641 ) ) ( not ( = ?auto_47639 ?auto_47640 ) ) ( not ( = ?auto_47639 ?auto_47641 ) ) ( not ( = ?auto_47640 ?auto_47641 ) ) )
    :subtasks
    ( ( !STACK ?auto_47640 ?auto_47641 )
      ( MAKE-1PILE ?auto_47638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47642 - BLOCK
    )
    :vars
    (
      ?auto_47645 - BLOCK
      ?auto_47644 - BLOCK
      ?auto_47643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47645 ?auto_47642 ) ( ON-TABLE ?auto_47642 ) ( not ( = ?auto_47642 ?auto_47645 ) ) ( CLEAR ?auto_47644 ) ( not ( = ?auto_47642 ?auto_47643 ) ) ( not ( = ?auto_47642 ?auto_47644 ) ) ( not ( = ?auto_47645 ?auto_47643 ) ) ( not ( = ?auto_47645 ?auto_47644 ) ) ( not ( = ?auto_47643 ?auto_47644 ) ) ( ON ?auto_47643 ?auto_47645 ) ( CLEAR ?auto_47643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47642 ?auto_47645 )
      ( MAKE-1PILE ?auto_47642 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47646 - BLOCK
    )
    :vars
    (
      ?auto_47648 - BLOCK
      ?auto_47649 - BLOCK
      ?auto_47647 - BLOCK
      ?auto_47650 - BLOCK
      ?auto_47652 - BLOCK
      ?auto_47651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47648 ?auto_47646 ) ( ON-TABLE ?auto_47646 ) ( not ( = ?auto_47646 ?auto_47648 ) ) ( not ( = ?auto_47646 ?auto_47649 ) ) ( not ( = ?auto_47646 ?auto_47647 ) ) ( not ( = ?auto_47648 ?auto_47649 ) ) ( not ( = ?auto_47648 ?auto_47647 ) ) ( not ( = ?auto_47649 ?auto_47647 ) ) ( ON ?auto_47649 ?auto_47648 ) ( CLEAR ?auto_47649 ) ( HOLDING ?auto_47647 ) ( CLEAR ?auto_47650 ) ( ON-TABLE ?auto_47652 ) ( ON ?auto_47651 ?auto_47652 ) ( ON ?auto_47650 ?auto_47651 ) ( not ( = ?auto_47652 ?auto_47651 ) ) ( not ( = ?auto_47652 ?auto_47650 ) ) ( not ( = ?auto_47652 ?auto_47647 ) ) ( not ( = ?auto_47651 ?auto_47650 ) ) ( not ( = ?auto_47651 ?auto_47647 ) ) ( not ( = ?auto_47650 ?auto_47647 ) ) ( not ( = ?auto_47646 ?auto_47650 ) ) ( not ( = ?auto_47646 ?auto_47652 ) ) ( not ( = ?auto_47646 ?auto_47651 ) ) ( not ( = ?auto_47648 ?auto_47650 ) ) ( not ( = ?auto_47648 ?auto_47652 ) ) ( not ( = ?auto_47648 ?auto_47651 ) ) ( not ( = ?auto_47649 ?auto_47650 ) ) ( not ( = ?auto_47649 ?auto_47652 ) ) ( not ( = ?auto_47649 ?auto_47651 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47652 ?auto_47651 ?auto_47650 ?auto_47647 )
      ( MAKE-1PILE ?auto_47646 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47653 - BLOCK
    )
    :vars
    (
      ?auto_47657 - BLOCK
      ?auto_47656 - BLOCK
      ?auto_47658 - BLOCK
      ?auto_47659 - BLOCK
      ?auto_47654 - BLOCK
      ?auto_47655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47657 ?auto_47653 ) ( ON-TABLE ?auto_47653 ) ( not ( = ?auto_47653 ?auto_47657 ) ) ( not ( = ?auto_47653 ?auto_47656 ) ) ( not ( = ?auto_47653 ?auto_47658 ) ) ( not ( = ?auto_47657 ?auto_47656 ) ) ( not ( = ?auto_47657 ?auto_47658 ) ) ( not ( = ?auto_47656 ?auto_47658 ) ) ( ON ?auto_47656 ?auto_47657 ) ( CLEAR ?auto_47659 ) ( ON-TABLE ?auto_47654 ) ( ON ?auto_47655 ?auto_47654 ) ( ON ?auto_47659 ?auto_47655 ) ( not ( = ?auto_47654 ?auto_47655 ) ) ( not ( = ?auto_47654 ?auto_47659 ) ) ( not ( = ?auto_47654 ?auto_47658 ) ) ( not ( = ?auto_47655 ?auto_47659 ) ) ( not ( = ?auto_47655 ?auto_47658 ) ) ( not ( = ?auto_47659 ?auto_47658 ) ) ( not ( = ?auto_47653 ?auto_47659 ) ) ( not ( = ?auto_47653 ?auto_47654 ) ) ( not ( = ?auto_47653 ?auto_47655 ) ) ( not ( = ?auto_47657 ?auto_47659 ) ) ( not ( = ?auto_47657 ?auto_47654 ) ) ( not ( = ?auto_47657 ?auto_47655 ) ) ( not ( = ?auto_47656 ?auto_47659 ) ) ( not ( = ?auto_47656 ?auto_47654 ) ) ( not ( = ?auto_47656 ?auto_47655 ) ) ( ON ?auto_47658 ?auto_47656 ) ( CLEAR ?auto_47658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47653 ?auto_47657 ?auto_47656 )
      ( MAKE-1PILE ?auto_47653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47660 - BLOCK
    )
    :vars
    (
      ?auto_47666 - BLOCK
      ?auto_47663 - BLOCK
      ?auto_47662 - BLOCK
      ?auto_47664 - BLOCK
      ?auto_47661 - BLOCK
      ?auto_47665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47666 ?auto_47660 ) ( ON-TABLE ?auto_47660 ) ( not ( = ?auto_47660 ?auto_47666 ) ) ( not ( = ?auto_47660 ?auto_47663 ) ) ( not ( = ?auto_47660 ?auto_47662 ) ) ( not ( = ?auto_47666 ?auto_47663 ) ) ( not ( = ?auto_47666 ?auto_47662 ) ) ( not ( = ?auto_47663 ?auto_47662 ) ) ( ON ?auto_47663 ?auto_47666 ) ( ON-TABLE ?auto_47664 ) ( ON ?auto_47661 ?auto_47664 ) ( not ( = ?auto_47664 ?auto_47661 ) ) ( not ( = ?auto_47664 ?auto_47665 ) ) ( not ( = ?auto_47664 ?auto_47662 ) ) ( not ( = ?auto_47661 ?auto_47665 ) ) ( not ( = ?auto_47661 ?auto_47662 ) ) ( not ( = ?auto_47665 ?auto_47662 ) ) ( not ( = ?auto_47660 ?auto_47665 ) ) ( not ( = ?auto_47660 ?auto_47664 ) ) ( not ( = ?auto_47660 ?auto_47661 ) ) ( not ( = ?auto_47666 ?auto_47665 ) ) ( not ( = ?auto_47666 ?auto_47664 ) ) ( not ( = ?auto_47666 ?auto_47661 ) ) ( not ( = ?auto_47663 ?auto_47665 ) ) ( not ( = ?auto_47663 ?auto_47664 ) ) ( not ( = ?auto_47663 ?auto_47661 ) ) ( ON ?auto_47662 ?auto_47663 ) ( CLEAR ?auto_47662 ) ( HOLDING ?auto_47665 ) ( CLEAR ?auto_47661 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47664 ?auto_47661 ?auto_47665 )
      ( MAKE-1PILE ?auto_47660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47667 - BLOCK
    )
    :vars
    (
      ?auto_47668 - BLOCK
      ?auto_47671 - BLOCK
      ?auto_47669 - BLOCK
      ?auto_47670 - BLOCK
      ?auto_47673 - BLOCK
      ?auto_47672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47668 ?auto_47667 ) ( ON-TABLE ?auto_47667 ) ( not ( = ?auto_47667 ?auto_47668 ) ) ( not ( = ?auto_47667 ?auto_47671 ) ) ( not ( = ?auto_47667 ?auto_47669 ) ) ( not ( = ?auto_47668 ?auto_47671 ) ) ( not ( = ?auto_47668 ?auto_47669 ) ) ( not ( = ?auto_47671 ?auto_47669 ) ) ( ON ?auto_47671 ?auto_47668 ) ( ON-TABLE ?auto_47670 ) ( ON ?auto_47673 ?auto_47670 ) ( not ( = ?auto_47670 ?auto_47673 ) ) ( not ( = ?auto_47670 ?auto_47672 ) ) ( not ( = ?auto_47670 ?auto_47669 ) ) ( not ( = ?auto_47673 ?auto_47672 ) ) ( not ( = ?auto_47673 ?auto_47669 ) ) ( not ( = ?auto_47672 ?auto_47669 ) ) ( not ( = ?auto_47667 ?auto_47672 ) ) ( not ( = ?auto_47667 ?auto_47670 ) ) ( not ( = ?auto_47667 ?auto_47673 ) ) ( not ( = ?auto_47668 ?auto_47672 ) ) ( not ( = ?auto_47668 ?auto_47670 ) ) ( not ( = ?auto_47668 ?auto_47673 ) ) ( not ( = ?auto_47671 ?auto_47672 ) ) ( not ( = ?auto_47671 ?auto_47670 ) ) ( not ( = ?auto_47671 ?auto_47673 ) ) ( ON ?auto_47669 ?auto_47671 ) ( CLEAR ?auto_47673 ) ( ON ?auto_47672 ?auto_47669 ) ( CLEAR ?auto_47672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47667 ?auto_47668 ?auto_47671 ?auto_47669 )
      ( MAKE-1PILE ?auto_47667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47674 - BLOCK
    )
    :vars
    (
      ?auto_47678 - BLOCK
      ?auto_47680 - BLOCK
      ?auto_47677 - BLOCK
      ?auto_47676 - BLOCK
      ?auto_47679 - BLOCK
      ?auto_47675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47678 ?auto_47674 ) ( ON-TABLE ?auto_47674 ) ( not ( = ?auto_47674 ?auto_47678 ) ) ( not ( = ?auto_47674 ?auto_47680 ) ) ( not ( = ?auto_47674 ?auto_47677 ) ) ( not ( = ?auto_47678 ?auto_47680 ) ) ( not ( = ?auto_47678 ?auto_47677 ) ) ( not ( = ?auto_47680 ?auto_47677 ) ) ( ON ?auto_47680 ?auto_47678 ) ( ON-TABLE ?auto_47676 ) ( not ( = ?auto_47676 ?auto_47679 ) ) ( not ( = ?auto_47676 ?auto_47675 ) ) ( not ( = ?auto_47676 ?auto_47677 ) ) ( not ( = ?auto_47679 ?auto_47675 ) ) ( not ( = ?auto_47679 ?auto_47677 ) ) ( not ( = ?auto_47675 ?auto_47677 ) ) ( not ( = ?auto_47674 ?auto_47675 ) ) ( not ( = ?auto_47674 ?auto_47676 ) ) ( not ( = ?auto_47674 ?auto_47679 ) ) ( not ( = ?auto_47678 ?auto_47675 ) ) ( not ( = ?auto_47678 ?auto_47676 ) ) ( not ( = ?auto_47678 ?auto_47679 ) ) ( not ( = ?auto_47680 ?auto_47675 ) ) ( not ( = ?auto_47680 ?auto_47676 ) ) ( not ( = ?auto_47680 ?auto_47679 ) ) ( ON ?auto_47677 ?auto_47680 ) ( ON ?auto_47675 ?auto_47677 ) ( CLEAR ?auto_47675 ) ( HOLDING ?auto_47679 ) ( CLEAR ?auto_47676 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47676 ?auto_47679 )
      ( MAKE-1PILE ?auto_47674 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48527 - BLOCK
    )
    :vars
    (
      ?auto_48530 - BLOCK
      ?auto_48528 - BLOCK
      ?auto_48531 - BLOCK
      ?auto_48529 - BLOCK
      ?auto_48532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48530 ?auto_48527 ) ( ON-TABLE ?auto_48527 ) ( not ( = ?auto_48527 ?auto_48530 ) ) ( not ( = ?auto_48527 ?auto_48528 ) ) ( not ( = ?auto_48527 ?auto_48531 ) ) ( not ( = ?auto_48530 ?auto_48528 ) ) ( not ( = ?auto_48530 ?auto_48531 ) ) ( not ( = ?auto_48528 ?auto_48531 ) ) ( ON ?auto_48528 ?auto_48530 ) ( not ( = ?auto_48529 ?auto_48532 ) ) ( not ( = ?auto_48529 ?auto_48531 ) ) ( not ( = ?auto_48532 ?auto_48531 ) ) ( not ( = ?auto_48527 ?auto_48532 ) ) ( not ( = ?auto_48527 ?auto_48529 ) ) ( not ( = ?auto_48530 ?auto_48532 ) ) ( not ( = ?auto_48530 ?auto_48529 ) ) ( not ( = ?auto_48528 ?auto_48532 ) ) ( not ( = ?auto_48528 ?auto_48529 ) ) ( ON ?auto_48531 ?auto_48528 ) ( ON ?auto_48532 ?auto_48531 ) ( ON ?auto_48529 ?auto_48532 ) ( CLEAR ?auto_48529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48527 ?auto_48530 ?auto_48528 ?auto_48531 ?auto_48532 )
      ( MAKE-1PILE ?auto_48527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47688 - BLOCK
    )
    :vars
    (
      ?auto_47690 - BLOCK
      ?auto_47692 - BLOCK
      ?auto_47689 - BLOCK
      ?auto_47691 - BLOCK
      ?auto_47693 - BLOCK
      ?auto_47694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47690 ?auto_47688 ) ( ON-TABLE ?auto_47688 ) ( not ( = ?auto_47688 ?auto_47690 ) ) ( not ( = ?auto_47688 ?auto_47692 ) ) ( not ( = ?auto_47688 ?auto_47689 ) ) ( not ( = ?auto_47690 ?auto_47692 ) ) ( not ( = ?auto_47690 ?auto_47689 ) ) ( not ( = ?auto_47692 ?auto_47689 ) ) ( ON ?auto_47692 ?auto_47690 ) ( not ( = ?auto_47691 ?auto_47693 ) ) ( not ( = ?auto_47691 ?auto_47694 ) ) ( not ( = ?auto_47691 ?auto_47689 ) ) ( not ( = ?auto_47693 ?auto_47694 ) ) ( not ( = ?auto_47693 ?auto_47689 ) ) ( not ( = ?auto_47694 ?auto_47689 ) ) ( not ( = ?auto_47688 ?auto_47694 ) ) ( not ( = ?auto_47688 ?auto_47691 ) ) ( not ( = ?auto_47688 ?auto_47693 ) ) ( not ( = ?auto_47690 ?auto_47694 ) ) ( not ( = ?auto_47690 ?auto_47691 ) ) ( not ( = ?auto_47690 ?auto_47693 ) ) ( not ( = ?auto_47692 ?auto_47694 ) ) ( not ( = ?auto_47692 ?auto_47691 ) ) ( not ( = ?auto_47692 ?auto_47693 ) ) ( ON ?auto_47689 ?auto_47692 ) ( ON ?auto_47694 ?auto_47689 ) ( ON ?auto_47693 ?auto_47694 ) ( CLEAR ?auto_47693 ) ( HOLDING ?auto_47691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47691 )
      ( MAKE-1PILE ?auto_47688 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47695 - BLOCK
    )
    :vars
    (
      ?auto_47696 - BLOCK
      ?auto_47699 - BLOCK
      ?auto_47701 - BLOCK
      ?auto_47698 - BLOCK
      ?auto_47700 - BLOCK
      ?auto_47697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47696 ?auto_47695 ) ( ON-TABLE ?auto_47695 ) ( not ( = ?auto_47695 ?auto_47696 ) ) ( not ( = ?auto_47695 ?auto_47699 ) ) ( not ( = ?auto_47695 ?auto_47701 ) ) ( not ( = ?auto_47696 ?auto_47699 ) ) ( not ( = ?auto_47696 ?auto_47701 ) ) ( not ( = ?auto_47699 ?auto_47701 ) ) ( ON ?auto_47699 ?auto_47696 ) ( not ( = ?auto_47698 ?auto_47700 ) ) ( not ( = ?auto_47698 ?auto_47697 ) ) ( not ( = ?auto_47698 ?auto_47701 ) ) ( not ( = ?auto_47700 ?auto_47697 ) ) ( not ( = ?auto_47700 ?auto_47701 ) ) ( not ( = ?auto_47697 ?auto_47701 ) ) ( not ( = ?auto_47695 ?auto_47697 ) ) ( not ( = ?auto_47695 ?auto_47698 ) ) ( not ( = ?auto_47695 ?auto_47700 ) ) ( not ( = ?auto_47696 ?auto_47697 ) ) ( not ( = ?auto_47696 ?auto_47698 ) ) ( not ( = ?auto_47696 ?auto_47700 ) ) ( not ( = ?auto_47699 ?auto_47697 ) ) ( not ( = ?auto_47699 ?auto_47698 ) ) ( not ( = ?auto_47699 ?auto_47700 ) ) ( ON ?auto_47701 ?auto_47699 ) ( ON ?auto_47697 ?auto_47701 ) ( ON ?auto_47700 ?auto_47697 ) ( ON ?auto_47698 ?auto_47700 ) ( CLEAR ?auto_47698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47695 ?auto_47696 ?auto_47699 ?auto_47701 ?auto_47697 ?auto_47700 )
      ( MAKE-1PILE ?auto_47695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47708 - BLOCK
      ?auto_47709 - BLOCK
      ?auto_47710 - BLOCK
      ?auto_47711 - BLOCK
      ?auto_47712 - BLOCK
      ?auto_47713 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47713 ) ( CLEAR ?auto_47712 ) ( ON-TABLE ?auto_47708 ) ( ON ?auto_47709 ?auto_47708 ) ( ON ?auto_47710 ?auto_47709 ) ( ON ?auto_47711 ?auto_47710 ) ( ON ?auto_47712 ?auto_47711 ) ( not ( = ?auto_47708 ?auto_47709 ) ) ( not ( = ?auto_47708 ?auto_47710 ) ) ( not ( = ?auto_47708 ?auto_47711 ) ) ( not ( = ?auto_47708 ?auto_47712 ) ) ( not ( = ?auto_47708 ?auto_47713 ) ) ( not ( = ?auto_47709 ?auto_47710 ) ) ( not ( = ?auto_47709 ?auto_47711 ) ) ( not ( = ?auto_47709 ?auto_47712 ) ) ( not ( = ?auto_47709 ?auto_47713 ) ) ( not ( = ?auto_47710 ?auto_47711 ) ) ( not ( = ?auto_47710 ?auto_47712 ) ) ( not ( = ?auto_47710 ?auto_47713 ) ) ( not ( = ?auto_47711 ?auto_47712 ) ) ( not ( = ?auto_47711 ?auto_47713 ) ) ( not ( = ?auto_47712 ?auto_47713 ) ) )
    :subtasks
    ( ( !STACK ?auto_47713 ?auto_47712 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47714 - BLOCK
      ?auto_47715 - BLOCK
      ?auto_47716 - BLOCK
      ?auto_47717 - BLOCK
      ?auto_47718 - BLOCK
      ?auto_47719 - BLOCK
    )
    :vars
    (
      ?auto_47720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47718 ) ( ON-TABLE ?auto_47714 ) ( ON ?auto_47715 ?auto_47714 ) ( ON ?auto_47716 ?auto_47715 ) ( ON ?auto_47717 ?auto_47716 ) ( ON ?auto_47718 ?auto_47717 ) ( not ( = ?auto_47714 ?auto_47715 ) ) ( not ( = ?auto_47714 ?auto_47716 ) ) ( not ( = ?auto_47714 ?auto_47717 ) ) ( not ( = ?auto_47714 ?auto_47718 ) ) ( not ( = ?auto_47714 ?auto_47719 ) ) ( not ( = ?auto_47715 ?auto_47716 ) ) ( not ( = ?auto_47715 ?auto_47717 ) ) ( not ( = ?auto_47715 ?auto_47718 ) ) ( not ( = ?auto_47715 ?auto_47719 ) ) ( not ( = ?auto_47716 ?auto_47717 ) ) ( not ( = ?auto_47716 ?auto_47718 ) ) ( not ( = ?auto_47716 ?auto_47719 ) ) ( not ( = ?auto_47717 ?auto_47718 ) ) ( not ( = ?auto_47717 ?auto_47719 ) ) ( not ( = ?auto_47718 ?auto_47719 ) ) ( ON ?auto_47719 ?auto_47720 ) ( CLEAR ?auto_47719 ) ( HAND-EMPTY ) ( not ( = ?auto_47714 ?auto_47720 ) ) ( not ( = ?auto_47715 ?auto_47720 ) ) ( not ( = ?auto_47716 ?auto_47720 ) ) ( not ( = ?auto_47717 ?auto_47720 ) ) ( not ( = ?auto_47718 ?auto_47720 ) ) ( not ( = ?auto_47719 ?auto_47720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47719 ?auto_47720 )
      ( MAKE-6PILE ?auto_47714 ?auto_47715 ?auto_47716 ?auto_47717 ?auto_47718 ?auto_47719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47721 - BLOCK
      ?auto_47722 - BLOCK
      ?auto_47723 - BLOCK
      ?auto_47724 - BLOCK
      ?auto_47725 - BLOCK
      ?auto_47726 - BLOCK
    )
    :vars
    (
      ?auto_47727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47721 ) ( ON ?auto_47722 ?auto_47721 ) ( ON ?auto_47723 ?auto_47722 ) ( ON ?auto_47724 ?auto_47723 ) ( not ( = ?auto_47721 ?auto_47722 ) ) ( not ( = ?auto_47721 ?auto_47723 ) ) ( not ( = ?auto_47721 ?auto_47724 ) ) ( not ( = ?auto_47721 ?auto_47725 ) ) ( not ( = ?auto_47721 ?auto_47726 ) ) ( not ( = ?auto_47722 ?auto_47723 ) ) ( not ( = ?auto_47722 ?auto_47724 ) ) ( not ( = ?auto_47722 ?auto_47725 ) ) ( not ( = ?auto_47722 ?auto_47726 ) ) ( not ( = ?auto_47723 ?auto_47724 ) ) ( not ( = ?auto_47723 ?auto_47725 ) ) ( not ( = ?auto_47723 ?auto_47726 ) ) ( not ( = ?auto_47724 ?auto_47725 ) ) ( not ( = ?auto_47724 ?auto_47726 ) ) ( not ( = ?auto_47725 ?auto_47726 ) ) ( ON ?auto_47726 ?auto_47727 ) ( CLEAR ?auto_47726 ) ( not ( = ?auto_47721 ?auto_47727 ) ) ( not ( = ?auto_47722 ?auto_47727 ) ) ( not ( = ?auto_47723 ?auto_47727 ) ) ( not ( = ?auto_47724 ?auto_47727 ) ) ( not ( = ?auto_47725 ?auto_47727 ) ) ( not ( = ?auto_47726 ?auto_47727 ) ) ( HOLDING ?auto_47725 ) ( CLEAR ?auto_47724 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47721 ?auto_47722 ?auto_47723 ?auto_47724 ?auto_47725 )
      ( MAKE-6PILE ?auto_47721 ?auto_47722 ?auto_47723 ?auto_47724 ?auto_47725 ?auto_47726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47728 - BLOCK
      ?auto_47729 - BLOCK
      ?auto_47730 - BLOCK
      ?auto_47731 - BLOCK
      ?auto_47732 - BLOCK
      ?auto_47733 - BLOCK
    )
    :vars
    (
      ?auto_47734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47728 ) ( ON ?auto_47729 ?auto_47728 ) ( ON ?auto_47730 ?auto_47729 ) ( ON ?auto_47731 ?auto_47730 ) ( not ( = ?auto_47728 ?auto_47729 ) ) ( not ( = ?auto_47728 ?auto_47730 ) ) ( not ( = ?auto_47728 ?auto_47731 ) ) ( not ( = ?auto_47728 ?auto_47732 ) ) ( not ( = ?auto_47728 ?auto_47733 ) ) ( not ( = ?auto_47729 ?auto_47730 ) ) ( not ( = ?auto_47729 ?auto_47731 ) ) ( not ( = ?auto_47729 ?auto_47732 ) ) ( not ( = ?auto_47729 ?auto_47733 ) ) ( not ( = ?auto_47730 ?auto_47731 ) ) ( not ( = ?auto_47730 ?auto_47732 ) ) ( not ( = ?auto_47730 ?auto_47733 ) ) ( not ( = ?auto_47731 ?auto_47732 ) ) ( not ( = ?auto_47731 ?auto_47733 ) ) ( not ( = ?auto_47732 ?auto_47733 ) ) ( ON ?auto_47733 ?auto_47734 ) ( not ( = ?auto_47728 ?auto_47734 ) ) ( not ( = ?auto_47729 ?auto_47734 ) ) ( not ( = ?auto_47730 ?auto_47734 ) ) ( not ( = ?auto_47731 ?auto_47734 ) ) ( not ( = ?auto_47732 ?auto_47734 ) ) ( not ( = ?auto_47733 ?auto_47734 ) ) ( CLEAR ?auto_47731 ) ( ON ?auto_47732 ?auto_47733 ) ( CLEAR ?auto_47732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47734 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47734 ?auto_47733 )
      ( MAKE-6PILE ?auto_47728 ?auto_47729 ?auto_47730 ?auto_47731 ?auto_47732 ?auto_47733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47735 - BLOCK
      ?auto_47736 - BLOCK
      ?auto_47737 - BLOCK
      ?auto_47738 - BLOCK
      ?auto_47739 - BLOCK
      ?auto_47740 - BLOCK
    )
    :vars
    (
      ?auto_47741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47735 ) ( ON ?auto_47736 ?auto_47735 ) ( ON ?auto_47737 ?auto_47736 ) ( not ( = ?auto_47735 ?auto_47736 ) ) ( not ( = ?auto_47735 ?auto_47737 ) ) ( not ( = ?auto_47735 ?auto_47738 ) ) ( not ( = ?auto_47735 ?auto_47739 ) ) ( not ( = ?auto_47735 ?auto_47740 ) ) ( not ( = ?auto_47736 ?auto_47737 ) ) ( not ( = ?auto_47736 ?auto_47738 ) ) ( not ( = ?auto_47736 ?auto_47739 ) ) ( not ( = ?auto_47736 ?auto_47740 ) ) ( not ( = ?auto_47737 ?auto_47738 ) ) ( not ( = ?auto_47737 ?auto_47739 ) ) ( not ( = ?auto_47737 ?auto_47740 ) ) ( not ( = ?auto_47738 ?auto_47739 ) ) ( not ( = ?auto_47738 ?auto_47740 ) ) ( not ( = ?auto_47739 ?auto_47740 ) ) ( ON ?auto_47740 ?auto_47741 ) ( not ( = ?auto_47735 ?auto_47741 ) ) ( not ( = ?auto_47736 ?auto_47741 ) ) ( not ( = ?auto_47737 ?auto_47741 ) ) ( not ( = ?auto_47738 ?auto_47741 ) ) ( not ( = ?auto_47739 ?auto_47741 ) ) ( not ( = ?auto_47740 ?auto_47741 ) ) ( ON ?auto_47739 ?auto_47740 ) ( CLEAR ?auto_47739 ) ( ON-TABLE ?auto_47741 ) ( HOLDING ?auto_47738 ) ( CLEAR ?auto_47737 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47735 ?auto_47736 ?auto_47737 ?auto_47738 )
      ( MAKE-6PILE ?auto_47735 ?auto_47736 ?auto_47737 ?auto_47738 ?auto_47739 ?auto_47740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47742 - BLOCK
      ?auto_47743 - BLOCK
      ?auto_47744 - BLOCK
      ?auto_47745 - BLOCK
      ?auto_47746 - BLOCK
      ?auto_47747 - BLOCK
    )
    :vars
    (
      ?auto_47748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47742 ) ( ON ?auto_47743 ?auto_47742 ) ( ON ?auto_47744 ?auto_47743 ) ( not ( = ?auto_47742 ?auto_47743 ) ) ( not ( = ?auto_47742 ?auto_47744 ) ) ( not ( = ?auto_47742 ?auto_47745 ) ) ( not ( = ?auto_47742 ?auto_47746 ) ) ( not ( = ?auto_47742 ?auto_47747 ) ) ( not ( = ?auto_47743 ?auto_47744 ) ) ( not ( = ?auto_47743 ?auto_47745 ) ) ( not ( = ?auto_47743 ?auto_47746 ) ) ( not ( = ?auto_47743 ?auto_47747 ) ) ( not ( = ?auto_47744 ?auto_47745 ) ) ( not ( = ?auto_47744 ?auto_47746 ) ) ( not ( = ?auto_47744 ?auto_47747 ) ) ( not ( = ?auto_47745 ?auto_47746 ) ) ( not ( = ?auto_47745 ?auto_47747 ) ) ( not ( = ?auto_47746 ?auto_47747 ) ) ( ON ?auto_47747 ?auto_47748 ) ( not ( = ?auto_47742 ?auto_47748 ) ) ( not ( = ?auto_47743 ?auto_47748 ) ) ( not ( = ?auto_47744 ?auto_47748 ) ) ( not ( = ?auto_47745 ?auto_47748 ) ) ( not ( = ?auto_47746 ?auto_47748 ) ) ( not ( = ?auto_47747 ?auto_47748 ) ) ( ON ?auto_47746 ?auto_47747 ) ( ON-TABLE ?auto_47748 ) ( CLEAR ?auto_47744 ) ( ON ?auto_47745 ?auto_47746 ) ( CLEAR ?auto_47745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47748 ?auto_47747 ?auto_47746 )
      ( MAKE-6PILE ?auto_47742 ?auto_47743 ?auto_47744 ?auto_47745 ?auto_47746 ?auto_47747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47749 - BLOCK
      ?auto_47750 - BLOCK
      ?auto_47751 - BLOCK
      ?auto_47752 - BLOCK
      ?auto_47753 - BLOCK
      ?auto_47754 - BLOCK
    )
    :vars
    (
      ?auto_47755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47749 ) ( ON ?auto_47750 ?auto_47749 ) ( not ( = ?auto_47749 ?auto_47750 ) ) ( not ( = ?auto_47749 ?auto_47751 ) ) ( not ( = ?auto_47749 ?auto_47752 ) ) ( not ( = ?auto_47749 ?auto_47753 ) ) ( not ( = ?auto_47749 ?auto_47754 ) ) ( not ( = ?auto_47750 ?auto_47751 ) ) ( not ( = ?auto_47750 ?auto_47752 ) ) ( not ( = ?auto_47750 ?auto_47753 ) ) ( not ( = ?auto_47750 ?auto_47754 ) ) ( not ( = ?auto_47751 ?auto_47752 ) ) ( not ( = ?auto_47751 ?auto_47753 ) ) ( not ( = ?auto_47751 ?auto_47754 ) ) ( not ( = ?auto_47752 ?auto_47753 ) ) ( not ( = ?auto_47752 ?auto_47754 ) ) ( not ( = ?auto_47753 ?auto_47754 ) ) ( ON ?auto_47754 ?auto_47755 ) ( not ( = ?auto_47749 ?auto_47755 ) ) ( not ( = ?auto_47750 ?auto_47755 ) ) ( not ( = ?auto_47751 ?auto_47755 ) ) ( not ( = ?auto_47752 ?auto_47755 ) ) ( not ( = ?auto_47753 ?auto_47755 ) ) ( not ( = ?auto_47754 ?auto_47755 ) ) ( ON ?auto_47753 ?auto_47754 ) ( ON-TABLE ?auto_47755 ) ( ON ?auto_47752 ?auto_47753 ) ( CLEAR ?auto_47752 ) ( HOLDING ?auto_47751 ) ( CLEAR ?auto_47750 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47749 ?auto_47750 ?auto_47751 )
      ( MAKE-6PILE ?auto_47749 ?auto_47750 ?auto_47751 ?auto_47752 ?auto_47753 ?auto_47754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47756 - BLOCK
      ?auto_47757 - BLOCK
      ?auto_47758 - BLOCK
      ?auto_47759 - BLOCK
      ?auto_47760 - BLOCK
      ?auto_47761 - BLOCK
    )
    :vars
    (
      ?auto_47762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47756 ) ( ON ?auto_47757 ?auto_47756 ) ( not ( = ?auto_47756 ?auto_47757 ) ) ( not ( = ?auto_47756 ?auto_47758 ) ) ( not ( = ?auto_47756 ?auto_47759 ) ) ( not ( = ?auto_47756 ?auto_47760 ) ) ( not ( = ?auto_47756 ?auto_47761 ) ) ( not ( = ?auto_47757 ?auto_47758 ) ) ( not ( = ?auto_47757 ?auto_47759 ) ) ( not ( = ?auto_47757 ?auto_47760 ) ) ( not ( = ?auto_47757 ?auto_47761 ) ) ( not ( = ?auto_47758 ?auto_47759 ) ) ( not ( = ?auto_47758 ?auto_47760 ) ) ( not ( = ?auto_47758 ?auto_47761 ) ) ( not ( = ?auto_47759 ?auto_47760 ) ) ( not ( = ?auto_47759 ?auto_47761 ) ) ( not ( = ?auto_47760 ?auto_47761 ) ) ( ON ?auto_47761 ?auto_47762 ) ( not ( = ?auto_47756 ?auto_47762 ) ) ( not ( = ?auto_47757 ?auto_47762 ) ) ( not ( = ?auto_47758 ?auto_47762 ) ) ( not ( = ?auto_47759 ?auto_47762 ) ) ( not ( = ?auto_47760 ?auto_47762 ) ) ( not ( = ?auto_47761 ?auto_47762 ) ) ( ON ?auto_47760 ?auto_47761 ) ( ON-TABLE ?auto_47762 ) ( ON ?auto_47759 ?auto_47760 ) ( CLEAR ?auto_47757 ) ( ON ?auto_47758 ?auto_47759 ) ( CLEAR ?auto_47758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47762 ?auto_47761 ?auto_47760 ?auto_47759 )
      ( MAKE-6PILE ?auto_47756 ?auto_47757 ?auto_47758 ?auto_47759 ?auto_47760 ?auto_47761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47763 - BLOCK
      ?auto_47764 - BLOCK
      ?auto_47765 - BLOCK
      ?auto_47766 - BLOCK
      ?auto_47767 - BLOCK
      ?auto_47768 - BLOCK
    )
    :vars
    (
      ?auto_47769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47763 ) ( not ( = ?auto_47763 ?auto_47764 ) ) ( not ( = ?auto_47763 ?auto_47765 ) ) ( not ( = ?auto_47763 ?auto_47766 ) ) ( not ( = ?auto_47763 ?auto_47767 ) ) ( not ( = ?auto_47763 ?auto_47768 ) ) ( not ( = ?auto_47764 ?auto_47765 ) ) ( not ( = ?auto_47764 ?auto_47766 ) ) ( not ( = ?auto_47764 ?auto_47767 ) ) ( not ( = ?auto_47764 ?auto_47768 ) ) ( not ( = ?auto_47765 ?auto_47766 ) ) ( not ( = ?auto_47765 ?auto_47767 ) ) ( not ( = ?auto_47765 ?auto_47768 ) ) ( not ( = ?auto_47766 ?auto_47767 ) ) ( not ( = ?auto_47766 ?auto_47768 ) ) ( not ( = ?auto_47767 ?auto_47768 ) ) ( ON ?auto_47768 ?auto_47769 ) ( not ( = ?auto_47763 ?auto_47769 ) ) ( not ( = ?auto_47764 ?auto_47769 ) ) ( not ( = ?auto_47765 ?auto_47769 ) ) ( not ( = ?auto_47766 ?auto_47769 ) ) ( not ( = ?auto_47767 ?auto_47769 ) ) ( not ( = ?auto_47768 ?auto_47769 ) ) ( ON ?auto_47767 ?auto_47768 ) ( ON-TABLE ?auto_47769 ) ( ON ?auto_47766 ?auto_47767 ) ( ON ?auto_47765 ?auto_47766 ) ( CLEAR ?auto_47765 ) ( HOLDING ?auto_47764 ) ( CLEAR ?auto_47763 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47763 ?auto_47764 )
      ( MAKE-6PILE ?auto_47763 ?auto_47764 ?auto_47765 ?auto_47766 ?auto_47767 ?auto_47768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47770 - BLOCK
      ?auto_47771 - BLOCK
      ?auto_47772 - BLOCK
      ?auto_47773 - BLOCK
      ?auto_47774 - BLOCK
      ?auto_47775 - BLOCK
    )
    :vars
    (
      ?auto_47776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47770 ) ( not ( = ?auto_47770 ?auto_47771 ) ) ( not ( = ?auto_47770 ?auto_47772 ) ) ( not ( = ?auto_47770 ?auto_47773 ) ) ( not ( = ?auto_47770 ?auto_47774 ) ) ( not ( = ?auto_47770 ?auto_47775 ) ) ( not ( = ?auto_47771 ?auto_47772 ) ) ( not ( = ?auto_47771 ?auto_47773 ) ) ( not ( = ?auto_47771 ?auto_47774 ) ) ( not ( = ?auto_47771 ?auto_47775 ) ) ( not ( = ?auto_47772 ?auto_47773 ) ) ( not ( = ?auto_47772 ?auto_47774 ) ) ( not ( = ?auto_47772 ?auto_47775 ) ) ( not ( = ?auto_47773 ?auto_47774 ) ) ( not ( = ?auto_47773 ?auto_47775 ) ) ( not ( = ?auto_47774 ?auto_47775 ) ) ( ON ?auto_47775 ?auto_47776 ) ( not ( = ?auto_47770 ?auto_47776 ) ) ( not ( = ?auto_47771 ?auto_47776 ) ) ( not ( = ?auto_47772 ?auto_47776 ) ) ( not ( = ?auto_47773 ?auto_47776 ) ) ( not ( = ?auto_47774 ?auto_47776 ) ) ( not ( = ?auto_47775 ?auto_47776 ) ) ( ON ?auto_47774 ?auto_47775 ) ( ON-TABLE ?auto_47776 ) ( ON ?auto_47773 ?auto_47774 ) ( ON ?auto_47772 ?auto_47773 ) ( CLEAR ?auto_47770 ) ( ON ?auto_47771 ?auto_47772 ) ( CLEAR ?auto_47771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47776 ?auto_47775 ?auto_47774 ?auto_47773 ?auto_47772 )
      ( MAKE-6PILE ?auto_47770 ?auto_47771 ?auto_47772 ?auto_47773 ?auto_47774 ?auto_47775 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47777 - BLOCK
      ?auto_47778 - BLOCK
      ?auto_47779 - BLOCK
      ?auto_47780 - BLOCK
      ?auto_47781 - BLOCK
      ?auto_47782 - BLOCK
    )
    :vars
    (
      ?auto_47783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47777 ?auto_47778 ) ) ( not ( = ?auto_47777 ?auto_47779 ) ) ( not ( = ?auto_47777 ?auto_47780 ) ) ( not ( = ?auto_47777 ?auto_47781 ) ) ( not ( = ?auto_47777 ?auto_47782 ) ) ( not ( = ?auto_47778 ?auto_47779 ) ) ( not ( = ?auto_47778 ?auto_47780 ) ) ( not ( = ?auto_47778 ?auto_47781 ) ) ( not ( = ?auto_47778 ?auto_47782 ) ) ( not ( = ?auto_47779 ?auto_47780 ) ) ( not ( = ?auto_47779 ?auto_47781 ) ) ( not ( = ?auto_47779 ?auto_47782 ) ) ( not ( = ?auto_47780 ?auto_47781 ) ) ( not ( = ?auto_47780 ?auto_47782 ) ) ( not ( = ?auto_47781 ?auto_47782 ) ) ( ON ?auto_47782 ?auto_47783 ) ( not ( = ?auto_47777 ?auto_47783 ) ) ( not ( = ?auto_47778 ?auto_47783 ) ) ( not ( = ?auto_47779 ?auto_47783 ) ) ( not ( = ?auto_47780 ?auto_47783 ) ) ( not ( = ?auto_47781 ?auto_47783 ) ) ( not ( = ?auto_47782 ?auto_47783 ) ) ( ON ?auto_47781 ?auto_47782 ) ( ON-TABLE ?auto_47783 ) ( ON ?auto_47780 ?auto_47781 ) ( ON ?auto_47779 ?auto_47780 ) ( ON ?auto_47778 ?auto_47779 ) ( CLEAR ?auto_47778 ) ( HOLDING ?auto_47777 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47777 )
      ( MAKE-6PILE ?auto_47777 ?auto_47778 ?auto_47779 ?auto_47780 ?auto_47781 ?auto_47782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47784 - BLOCK
      ?auto_47785 - BLOCK
      ?auto_47786 - BLOCK
      ?auto_47787 - BLOCK
      ?auto_47788 - BLOCK
      ?auto_47789 - BLOCK
    )
    :vars
    (
      ?auto_47790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47784 ?auto_47785 ) ) ( not ( = ?auto_47784 ?auto_47786 ) ) ( not ( = ?auto_47784 ?auto_47787 ) ) ( not ( = ?auto_47784 ?auto_47788 ) ) ( not ( = ?auto_47784 ?auto_47789 ) ) ( not ( = ?auto_47785 ?auto_47786 ) ) ( not ( = ?auto_47785 ?auto_47787 ) ) ( not ( = ?auto_47785 ?auto_47788 ) ) ( not ( = ?auto_47785 ?auto_47789 ) ) ( not ( = ?auto_47786 ?auto_47787 ) ) ( not ( = ?auto_47786 ?auto_47788 ) ) ( not ( = ?auto_47786 ?auto_47789 ) ) ( not ( = ?auto_47787 ?auto_47788 ) ) ( not ( = ?auto_47787 ?auto_47789 ) ) ( not ( = ?auto_47788 ?auto_47789 ) ) ( ON ?auto_47789 ?auto_47790 ) ( not ( = ?auto_47784 ?auto_47790 ) ) ( not ( = ?auto_47785 ?auto_47790 ) ) ( not ( = ?auto_47786 ?auto_47790 ) ) ( not ( = ?auto_47787 ?auto_47790 ) ) ( not ( = ?auto_47788 ?auto_47790 ) ) ( not ( = ?auto_47789 ?auto_47790 ) ) ( ON ?auto_47788 ?auto_47789 ) ( ON-TABLE ?auto_47790 ) ( ON ?auto_47787 ?auto_47788 ) ( ON ?auto_47786 ?auto_47787 ) ( ON ?auto_47785 ?auto_47786 ) ( ON ?auto_47784 ?auto_47785 ) ( CLEAR ?auto_47784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47790 ?auto_47789 ?auto_47788 ?auto_47787 ?auto_47786 ?auto_47785 )
      ( MAKE-6PILE ?auto_47784 ?auto_47785 ?auto_47786 ?auto_47787 ?auto_47788 ?auto_47789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47871 - BLOCK
    )
    :vars
    (
      ?auto_47872 - BLOCK
      ?auto_47873 - BLOCK
      ?auto_47874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47871 ?auto_47872 ) ( CLEAR ?auto_47871 ) ( not ( = ?auto_47871 ?auto_47872 ) ) ( HOLDING ?auto_47873 ) ( CLEAR ?auto_47874 ) ( not ( = ?auto_47871 ?auto_47873 ) ) ( not ( = ?auto_47871 ?auto_47874 ) ) ( not ( = ?auto_47872 ?auto_47873 ) ) ( not ( = ?auto_47872 ?auto_47874 ) ) ( not ( = ?auto_47873 ?auto_47874 ) ) )
    :subtasks
    ( ( !STACK ?auto_47873 ?auto_47874 )
      ( MAKE-1PILE ?auto_47871 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47875 - BLOCK
    )
    :vars
    (
      ?auto_47877 - BLOCK
      ?auto_47876 - BLOCK
      ?auto_47878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47875 ?auto_47877 ) ( not ( = ?auto_47875 ?auto_47877 ) ) ( CLEAR ?auto_47876 ) ( not ( = ?auto_47875 ?auto_47878 ) ) ( not ( = ?auto_47875 ?auto_47876 ) ) ( not ( = ?auto_47877 ?auto_47878 ) ) ( not ( = ?auto_47877 ?auto_47876 ) ) ( not ( = ?auto_47878 ?auto_47876 ) ) ( ON ?auto_47878 ?auto_47875 ) ( CLEAR ?auto_47878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47877 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47877 ?auto_47875 )
      ( MAKE-1PILE ?auto_47875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47879 - BLOCK
    )
    :vars
    (
      ?auto_47882 - BLOCK
      ?auto_47881 - BLOCK
      ?auto_47880 - BLOCK
      ?auto_47883 - BLOCK
      ?auto_47885 - BLOCK
      ?auto_47884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47879 ?auto_47882 ) ( not ( = ?auto_47879 ?auto_47882 ) ) ( not ( = ?auto_47879 ?auto_47881 ) ) ( not ( = ?auto_47879 ?auto_47880 ) ) ( not ( = ?auto_47882 ?auto_47881 ) ) ( not ( = ?auto_47882 ?auto_47880 ) ) ( not ( = ?auto_47881 ?auto_47880 ) ) ( ON ?auto_47881 ?auto_47879 ) ( CLEAR ?auto_47881 ) ( ON-TABLE ?auto_47882 ) ( HOLDING ?auto_47880 ) ( CLEAR ?auto_47883 ) ( ON-TABLE ?auto_47885 ) ( ON ?auto_47884 ?auto_47885 ) ( ON ?auto_47883 ?auto_47884 ) ( not ( = ?auto_47885 ?auto_47884 ) ) ( not ( = ?auto_47885 ?auto_47883 ) ) ( not ( = ?auto_47885 ?auto_47880 ) ) ( not ( = ?auto_47884 ?auto_47883 ) ) ( not ( = ?auto_47884 ?auto_47880 ) ) ( not ( = ?auto_47883 ?auto_47880 ) ) ( not ( = ?auto_47879 ?auto_47883 ) ) ( not ( = ?auto_47879 ?auto_47885 ) ) ( not ( = ?auto_47879 ?auto_47884 ) ) ( not ( = ?auto_47882 ?auto_47883 ) ) ( not ( = ?auto_47882 ?auto_47885 ) ) ( not ( = ?auto_47882 ?auto_47884 ) ) ( not ( = ?auto_47881 ?auto_47883 ) ) ( not ( = ?auto_47881 ?auto_47885 ) ) ( not ( = ?auto_47881 ?auto_47884 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47885 ?auto_47884 ?auto_47883 ?auto_47880 )
      ( MAKE-1PILE ?auto_47879 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47886 - BLOCK
    )
    :vars
    (
      ?auto_47890 - BLOCK
      ?auto_47891 - BLOCK
      ?auto_47892 - BLOCK
      ?auto_47887 - BLOCK
      ?auto_47888 - BLOCK
      ?auto_47889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47886 ?auto_47890 ) ( not ( = ?auto_47886 ?auto_47890 ) ) ( not ( = ?auto_47886 ?auto_47891 ) ) ( not ( = ?auto_47886 ?auto_47892 ) ) ( not ( = ?auto_47890 ?auto_47891 ) ) ( not ( = ?auto_47890 ?auto_47892 ) ) ( not ( = ?auto_47891 ?auto_47892 ) ) ( ON ?auto_47891 ?auto_47886 ) ( ON-TABLE ?auto_47890 ) ( CLEAR ?auto_47887 ) ( ON-TABLE ?auto_47888 ) ( ON ?auto_47889 ?auto_47888 ) ( ON ?auto_47887 ?auto_47889 ) ( not ( = ?auto_47888 ?auto_47889 ) ) ( not ( = ?auto_47888 ?auto_47887 ) ) ( not ( = ?auto_47888 ?auto_47892 ) ) ( not ( = ?auto_47889 ?auto_47887 ) ) ( not ( = ?auto_47889 ?auto_47892 ) ) ( not ( = ?auto_47887 ?auto_47892 ) ) ( not ( = ?auto_47886 ?auto_47887 ) ) ( not ( = ?auto_47886 ?auto_47888 ) ) ( not ( = ?auto_47886 ?auto_47889 ) ) ( not ( = ?auto_47890 ?auto_47887 ) ) ( not ( = ?auto_47890 ?auto_47888 ) ) ( not ( = ?auto_47890 ?auto_47889 ) ) ( not ( = ?auto_47891 ?auto_47887 ) ) ( not ( = ?auto_47891 ?auto_47888 ) ) ( not ( = ?auto_47891 ?auto_47889 ) ) ( ON ?auto_47892 ?auto_47891 ) ( CLEAR ?auto_47892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47890 ?auto_47886 ?auto_47891 )
      ( MAKE-1PILE ?auto_47886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47893 - BLOCK
    )
    :vars
    (
      ?auto_47898 - BLOCK
      ?auto_47899 - BLOCK
      ?auto_47895 - BLOCK
      ?auto_47897 - BLOCK
      ?auto_47894 - BLOCK
      ?auto_47896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47893 ?auto_47898 ) ( not ( = ?auto_47893 ?auto_47898 ) ) ( not ( = ?auto_47893 ?auto_47899 ) ) ( not ( = ?auto_47893 ?auto_47895 ) ) ( not ( = ?auto_47898 ?auto_47899 ) ) ( not ( = ?auto_47898 ?auto_47895 ) ) ( not ( = ?auto_47899 ?auto_47895 ) ) ( ON ?auto_47899 ?auto_47893 ) ( ON-TABLE ?auto_47898 ) ( ON-TABLE ?auto_47897 ) ( ON ?auto_47894 ?auto_47897 ) ( not ( = ?auto_47897 ?auto_47894 ) ) ( not ( = ?auto_47897 ?auto_47896 ) ) ( not ( = ?auto_47897 ?auto_47895 ) ) ( not ( = ?auto_47894 ?auto_47896 ) ) ( not ( = ?auto_47894 ?auto_47895 ) ) ( not ( = ?auto_47896 ?auto_47895 ) ) ( not ( = ?auto_47893 ?auto_47896 ) ) ( not ( = ?auto_47893 ?auto_47897 ) ) ( not ( = ?auto_47893 ?auto_47894 ) ) ( not ( = ?auto_47898 ?auto_47896 ) ) ( not ( = ?auto_47898 ?auto_47897 ) ) ( not ( = ?auto_47898 ?auto_47894 ) ) ( not ( = ?auto_47899 ?auto_47896 ) ) ( not ( = ?auto_47899 ?auto_47897 ) ) ( not ( = ?auto_47899 ?auto_47894 ) ) ( ON ?auto_47895 ?auto_47899 ) ( CLEAR ?auto_47895 ) ( HOLDING ?auto_47896 ) ( CLEAR ?auto_47894 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47897 ?auto_47894 ?auto_47896 )
      ( MAKE-1PILE ?auto_47893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47900 - BLOCK
    )
    :vars
    (
      ?auto_47901 - BLOCK
      ?auto_47906 - BLOCK
      ?auto_47903 - BLOCK
      ?auto_47904 - BLOCK
      ?auto_47902 - BLOCK
      ?auto_47905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47900 ?auto_47901 ) ( not ( = ?auto_47900 ?auto_47901 ) ) ( not ( = ?auto_47900 ?auto_47906 ) ) ( not ( = ?auto_47900 ?auto_47903 ) ) ( not ( = ?auto_47901 ?auto_47906 ) ) ( not ( = ?auto_47901 ?auto_47903 ) ) ( not ( = ?auto_47906 ?auto_47903 ) ) ( ON ?auto_47906 ?auto_47900 ) ( ON-TABLE ?auto_47901 ) ( ON-TABLE ?auto_47904 ) ( ON ?auto_47902 ?auto_47904 ) ( not ( = ?auto_47904 ?auto_47902 ) ) ( not ( = ?auto_47904 ?auto_47905 ) ) ( not ( = ?auto_47904 ?auto_47903 ) ) ( not ( = ?auto_47902 ?auto_47905 ) ) ( not ( = ?auto_47902 ?auto_47903 ) ) ( not ( = ?auto_47905 ?auto_47903 ) ) ( not ( = ?auto_47900 ?auto_47905 ) ) ( not ( = ?auto_47900 ?auto_47904 ) ) ( not ( = ?auto_47900 ?auto_47902 ) ) ( not ( = ?auto_47901 ?auto_47905 ) ) ( not ( = ?auto_47901 ?auto_47904 ) ) ( not ( = ?auto_47901 ?auto_47902 ) ) ( not ( = ?auto_47906 ?auto_47905 ) ) ( not ( = ?auto_47906 ?auto_47904 ) ) ( not ( = ?auto_47906 ?auto_47902 ) ) ( ON ?auto_47903 ?auto_47906 ) ( CLEAR ?auto_47902 ) ( ON ?auto_47905 ?auto_47903 ) ( CLEAR ?auto_47905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47901 ?auto_47900 ?auto_47906 ?auto_47903 )
      ( MAKE-1PILE ?auto_47900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47907 - BLOCK
    )
    :vars
    (
      ?auto_47913 - BLOCK
      ?auto_47910 - BLOCK
      ?auto_47909 - BLOCK
      ?auto_47911 - BLOCK
      ?auto_47908 - BLOCK
      ?auto_47912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47907 ?auto_47913 ) ( not ( = ?auto_47907 ?auto_47913 ) ) ( not ( = ?auto_47907 ?auto_47910 ) ) ( not ( = ?auto_47907 ?auto_47909 ) ) ( not ( = ?auto_47913 ?auto_47910 ) ) ( not ( = ?auto_47913 ?auto_47909 ) ) ( not ( = ?auto_47910 ?auto_47909 ) ) ( ON ?auto_47910 ?auto_47907 ) ( ON-TABLE ?auto_47913 ) ( ON-TABLE ?auto_47911 ) ( not ( = ?auto_47911 ?auto_47908 ) ) ( not ( = ?auto_47911 ?auto_47912 ) ) ( not ( = ?auto_47911 ?auto_47909 ) ) ( not ( = ?auto_47908 ?auto_47912 ) ) ( not ( = ?auto_47908 ?auto_47909 ) ) ( not ( = ?auto_47912 ?auto_47909 ) ) ( not ( = ?auto_47907 ?auto_47912 ) ) ( not ( = ?auto_47907 ?auto_47911 ) ) ( not ( = ?auto_47907 ?auto_47908 ) ) ( not ( = ?auto_47913 ?auto_47912 ) ) ( not ( = ?auto_47913 ?auto_47911 ) ) ( not ( = ?auto_47913 ?auto_47908 ) ) ( not ( = ?auto_47910 ?auto_47912 ) ) ( not ( = ?auto_47910 ?auto_47911 ) ) ( not ( = ?auto_47910 ?auto_47908 ) ) ( ON ?auto_47909 ?auto_47910 ) ( ON ?auto_47912 ?auto_47909 ) ( CLEAR ?auto_47912 ) ( HOLDING ?auto_47908 ) ( CLEAR ?auto_47911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47911 ?auto_47908 )
      ( MAKE-1PILE ?auto_47907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47914 - BLOCK
    )
    :vars
    (
      ?auto_47915 - BLOCK
      ?auto_47918 - BLOCK
      ?auto_47920 - BLOCK
      ?auto_47919 - BLOCK
      ?auto_47916 - BLOCK
      ?auto_47917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47914 ?auto_47915 ) ( not ( = ?auto_47914 ?auto_47915 ) ) ( not ( = ?auto_47914 ?auto_47918 ) ) ( not ( = ?auto_47914 ?auto_47920 ) ) ( not ( = ?auto_47915 ?auto_47918 ) ) ( not ( = ?auto_47915 ?auto_47920 ) ) ( not ( = ?auto_47918 ?auto_47920 ) ) ( ON ?auto_47918 ?auto_47914 ) ( ON-TABLE ?auto_47915 ) ( ON-TABLE ?auto_47919 ) ( not ( = ?auto_47919 ?auto_47916 ) ) ( not ( = ?auto_47919 ?auto_47917 ) ) ( not ( = ?auto_47919 ?auto_47920 ) ) ( not ( = ?auto_47916 ?auto_47917 ) ) ( not ( = ?auto_47916 ?auto_47920 ) ) ( not ( = ?auto_47917 ?auto_47920 ) ) ( not ( = ?auto_47914 ?auto_47917 ) ) ( not ( = ?auto_47914 ?auto_47919 ) ) ( not ( = ?auto_47914 ?auto_47916 ) ) ( not ( = ?auto_47915 ?auto_47917 ) ) ( not ( = ?auto_47915 ?auto_47919 ) ) ( not ( = ?auto_47915 ?auto_47916 ) ) ( not ( = ?auto_47918 ?auto_47917 ) ) ( not ( = ?auto_47918 ?auto_47919 ) ) ( not ( = ?auto_47918 ?auto_47916 ) ) ( ON ?auto_47920 ?auto_47918 ) ( ON ?auto_47917 ?auto_47920 ) ( CLEAR ?auto_47919 ) ( ON ?auto_47916 ?auto_47917 ) ( CLEAR ?auto_47916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47915 ?auto_47914 ?auto_47918 ?auto_47920 ?auto_47917 )
      ( MAKE-1PILE ?auto_47914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47921 - BLOCK
    )
    :vars
    (
      ?auto_47923 - BLOCK
      ?auto_47922 - BLOCK
      ?auto_47924 - BLOCK
      ?auto_47927 - BLOCK
      ?auto_47926 - BLOCK
      ?auto_47925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47921 ?auto_47923 ) ( not ( = ?auto_47921 ?auto_47923 ) ) ( not ( = ?auto_47921 ?auto_47922 ) ) ( not ( = ?auto_47921 ?auto_47924 ) ) ( not ( = ?auto_47923 ?auto_47922 ) ) ( not ( = ?auto_47923 ?auto_47924 ) ) ( not ( = ?auto_47922 ?auto_47924 ) ) ( ON ?auto_47922 ?auto_47921 ) ( ON-TABLE ?auto_47923 ) ( not ( = ?auto_47927 ?auto_47926 ) ) ( not ( = ?auto_47927 ?auto_47925 ) ) ( not ( = ?auto_47927 ?auto_47924 ) ) ( not ( = ?auto_47926 ?auto_47925 ) ) ( not ( = ?auto_47926 ?auto_47924 ) ) ( not ( = ?auto_47925 ?auto_47924 ) ) ( not ( = ?auto_47921 ?auto_47925 ) ) ( not ( = ?auto_47921 ?auto_47927 ) ) ( not ( = ?auto_47921 ?auto_47926 ) ) ( not ( = ?auto_47923 ?auto_47925 ) ) ( not ( = ?auto_47923 ?auto_47927 ) ) ( not ( = ?auto_47923 ?auto_47926 ) ) ( not ( = ?auto_47922 ?auto_47925 ) ) ( not ( = ?auto_47922 ?auto_47927 ) ) ( not ( = ?auto_47922 ?auto_47926 ) ) ( ON ?auto_47924 ?auto_47922 ) ( ON ?auto_47925 ?auto_47924 ) ( ON ?auto_47926 ?auto_47925 ) ( CLEAR ?auto_47926 ) ( HOLDING ?auto_47927 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47927 )
      ( MAKE-1PILE ?auto_47921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47928 - BLOCK
    )
    :vars
    (
      ?auto_47930 - BLOCK
      ?auto_47932 - BLOCK
      ?auto_47931 - BLOCK
      ?auto_47934 - BLOCK
      ?auto_47933 - BLOCK
      ?auto_47929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47928 ?auto_47930 ) ( not ( = ?auto_47928 ?auto_47930 ) ) ( not ( = ?auto_47928 ?auto_47932 ) ) ( not ( = ?auto_47928 ?auto_47931 ) ) ( not ( = ?auto_47930 ?auto_47932 ) ) ( not ( = ?auto_47930 ?auto_47931 ) ) ( not ( = ?auto_47932 ?auto_47931 ) ) ( ON ?auto_47932 ?auto_47928 ) ( ON-TABLE ?auto_47930 ) ( not ( = ?auto_47934 ?auto_47933 ) ) ( not ( = ?auto_47934 ?auto_47929 ) ) ( not ( = ?auto_47934 ?auto_47931 ) ) ( not ( = ?auto_47933 ?auto_47929 ) ) ( not ( = ?auto_47933 ?auto_47931 ) ) ( not ( = ?auto_47929 ?auto_47931 ) ) ( not ( = ?auto_47928 ?auto_47929 ) ) ( not ( = ?auto_47928 ?auto_47934 ) ) ( not ( = ?auto_47928 ?auto_47933 ) ) ( not ( = ?auto_47930 ?auto_47929 ) ) ( not ( = ?auto_47930 ?auto_47934 ) ) ( not ( = ?auto_47930 ?auto_47933 ) ) ( not ( = ?auto_47932 ?auto_47929 ) ) ( not ( = ?auto_47932 ?auto_47934 ) ) ( not ( = ?auto_47932 ?auto_47933 ) ) ( ON ?auto_47931 ?auto_47932 ) ( ON ?auto_47929 ?auto_47931 ) ( ON ?auto_47933 ?auto_47929 ) ( ON ?auto_47934 ?auto_47933 ) ( CLEAR ?auto_47934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47930 ?auto_47928 ?auto_47932 ?auto_47931 ?auto_47929 ?auto_47933 )
      ( MAKE-1PILE ?auto_47928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47944 - BLOCK
      ?auto_47945 - BLOCK
      ?auto_47946 - BLOCK
      ?auto_47947 - BLOCK
    )
    :vars
    (
      ?auto_47948 - BLOCK
      ?auto_47949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47948 ?auto_47947 ) ( CLEAR ?auto_47948 ) ( ON-TABLE ?auto_47944 ) ( ON ?auto_47945 ?auto_47944 ) ( ON ?auto_47946 ?auto_47945 ) ( ON ?auto_47947 ?auto_47946 ) ( not ( = ?auto_47944 ?auto_47945 ) ) ( not ( = ?auto_47944 ?auto_47946 ) ) ( not ( = ?auto_47944 ?auto_47947 ) ) ( not ( = ?auto_47944 ?auto_47948 ) ) ( not ( = ?auto_47945 ?auto_47946 ) ) ( not ( = ?auto_47945 ?auto_47947 ) ) ( not ( = ?auto_47945 ?auto_47948 ) ) ( not ( = ?auto_47946 ?auto_47947 ) ) ( not ( = ?auto_47946 ?auto_47948 ) ) ( not ( = ?auto_47947 ?auto_47948 ) ) ( HOLDING ?auto_47949 ) ( not ( = ?auto_47944 ?auto_47949 ) ) ( not ( = ?auto_47945 ?auto_47949 ) ) ( not ( = ?auto_47946 ?auto_47949 ) ) ( not ( = ?auto_47947 ?auto_47949 ) ) ( not ( = ?auto_47948 ?auto_47949 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_47949 )
      ( MAKE-4PILE ?auto_47944 ?auto_47945 ?auto_47946 ?auto_47947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48017 - BLOCK
      ?auto_48018 - BLOCK
    )
    :vars
    (
      ?auto_48019 - BLOCK
      ?auto_48021 - BLOCK
      ?auto_48022 - BLOCK
      ?auto_48020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48017 ?auto_48018 ) ) ( ON ?auto_48018 ?auto_48019 ) ( not ( = ?auto_48017 ?auto_48019 ) ) ( not ( = ?auto_48018 ?auto_48019 ) ) ( ON ?auto_48017 ?auto_48018 ) ( CLEAR ?auto_48017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48021 ) ( ON ?auto_48022 ?auto_48021 ) ( ON ?auto_48020 ?auto_48022 ) ( ON ?auto_48019 ?auto_48020 ) ( not ( = ?auto_48021 ?auto_48022 ) ) ( not ( = ?auto_48021 ?auto_48020 ) ) ( not ( = ?auto_48021 ?auto_48019 ) ) ( not ( = ?auto_48021 ?auto_48018 ) ) ( not ( = ?auto_48021 ?auto_48017 ) ) ( not ( = ?auto_48022 ?auto_48020 ) ) ( not ( = ?auto_48022 ?auto_48019 ) ) ( not ( = ?auto_48022 ?auto_48018 ) ) ( not ( = ?auto_48022 ?auto_48017 ) ) ( not ( = ?auto_48020 ?auto_48019 ) ) ( not ( = ?auto_48020 ?auto_48018 ) ) ( not ( = ?auto_48020 ?auto_48017 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48021 ?auto_48022 ?auto_48020 ?auto_48019 ?auto_48018 )
      ( MAKE-2PILE ?auto_48017 ?auto_48018 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48025 - BLOCK
      ?auto_48026 - BLOCK
    )
    :vars
    (
      ?auto_48027 - BLOCK
      ?auto_48028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48025 ?auto_48026 ) ) ( ON ?auto_48026 ?auto_48027 ) ( CLEAR ?auto_48026 ) ( not ( = ?auto_48025 ?auto_48027 ) ) ( not ( = ?auto_48026 ?auto_48027 ) ) ( ON ?auto_48025 ?auto_48028 ) ( CLEAR ?auto_48025 ) ( HAND-EMPTY ) ( not ( = ?auto_48025 ?auto_48028 ) ) ( not ( = ?auto_48026 ?auto_48028 ) ) ( not ( = ?auto_48027 ?auto_48028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48025 ?auto_48028 )
      ( MAKE-2PILE ?auto_48025 ?auto_48026 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48029 - BLOCK
      ?auto_48030 - BLOCK
    )
    :vars
    (
      ?auto_48031 - BLOCK
      ?auto_48032 - BLOCK
      ?auto_48035 - BLOCK
      ?auto_48034 - BLOCK
      ?auto_48033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48029 ?auto_48030 ) ) ( not ( = ?auto_48029 ?auto_48031 ) ) ( not ( = ?auto_48030 ?auto_48031 ) ) ( ON ?auto_48029 ?auto_48032 ) ( CLEAR ?auto_48029 ) ( not ( = ?auto_48029 ?auto_48032 ) ) ( not ( = ?auto_48030 ?auto_48032 ) ) ( not ( = ?auto_48031 ?auto_48032 ) ) ( HOLDING ?auto_48030 ) ( CLEAR ?auto_48031 ) ( ON-TABLE ?auto_48035 ) ( ON ?auto_48034 ?auto_48035 ) ( ON ?auto_48033 ?auto_48034 ) ( ON ?auto_48031 ?auto_48033 ) ( not ( = ?auto_48035 ?auto_48034 ) ) ( not ( = ?auto_48035 ?auto_48033 ) ) ( not ( = ?auto_48035 ?auto_48031 ) ) ( not ( = ?auto_48035 ?auto_48030 ) ) ( not ( = ?auto_48034 ?auto_48033 ) ) ( not ( = ?auto_48034 ?auto_48031 ) ) ( not ( = ?auto_48034 ?auto_48030 ) ) ( not ( = ?auto_48033 ?auto_48031 ) ) ( not ( = ?auto_48033 ?auto_48030 ) ) ( not ( = ?auto_48029 ?auto_48035 ) ) ( not ( = ?auto_48029 ?auto_48034 ) ) ( not ( = ?auto_48029 ?auto_48033 ) ) ( not ( = ?auto_48032 ?auto_48035 ) ) ( not ( = ?auto_48032 ?auto_48034 ) ) ( not ( = ?auto_48032 ?auto_48033 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48035 ?auto_48034 ?auto_48033 ?auto_48031 ?auto_48030 )
      ( MAKE-2PILE ?auto_48029 ?auto_48030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48036 - BLOCK
      ?auto_48037 - BLOCK
    )
    :vars
    (
      ?auto_48039 - BLOCK
      ?auto_48038 - BLOCK
      ?auto_48041 - BLOCK
      ?auto_48042 - BLOCK
      ?auto_48040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48036 ?auto_48037 ) ) ( not ( = ?auto_48036 ?auto_48039 ) ) ( not ( = ?auto_48037 ?auto_48039 ) ) ( ON ?auto_48036 ?auto_48038 ) ( not ( = ?auto_48036 ?auto_48038 ) ) ( not ( = ?auto_48037 ?auto_48038 ) ) ( not ( = ?auto_48039 ?auto_48038 ) ) ( CLEAR ?auto_48039 ) ( ON-TABLE ?auto_48041 ) ( ON ?auto_48042 ?auto_48041 ) ( ON ?auto_48040 ?auto_48042 ) ( ON ?auto_48039 ?auto_48040 ) ( not ( = ?auto_48041 ?auto_48042 ) ) ( not ( = ?auto_48041 ?auto_48040 ) ) ( not ( = ?auto_48041 ?auto_48039 ) ) ( not ( = ?auto_48041 ?auto_48037 ) ) ( not ( = ?auto_48042 ?auto_48040 ) ) ( not ( = ?auto_48042 ?auto_48039 ) ) ( not ( = ?auto_48042 ?auto_48037 ) ) ( not ( = ?auto_48040 ?auto_48039 ) ) ( not ( = ?auto_48040 ?auto_48037 ) ) ( not ( = ?auto_48036 ?auto_48041 ) ) ( not ( = ?auto_48036 ?auto_48042 ) ) ( not ( = ?auto_48036 ?auto_48040 ) ) ( not ( = ?auto_48038 ?auto_48041 ) ) ( not ( = ?auto_48038 ?auto_48042 ) ) ( not ( = ?auto_48038 ?auto_48040 ) ) ( ON ?auto_48037 ?auto_48036 ) ( CLEAR ?auto_48037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48038 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48038 ?auto_48036 )
      ( MAKE-2PILE ?auto_48036 ?auto_48037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48043 - BLOCK
      ?auto_48044 - BLOCK
    )
    :vars
    (
      ?auto_48045 - BLOCK
      ?auto_48049 - BLOCK
      ?auto_48046 - BLOCK
      ?auto_48048 - BLOCK
      ?auto_48047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48043 ?auto_48044 ) ) ( not ( = ?auto_48043 ?auto_48045 ) ) ( not ( = ?auto_48044 ?auto_48045 ) ) ( ON ?auto_48043 ?auto_48049 ) ( not ( = ?auto_48043 ?auto_48049 ) ) ( not ( = ?auto_48044 ?auto_48049 ) ) ( not ( = ?auto_48045 ?auto_48049 ) ) ( ON-TABLE ?auto_48046 ) ( ON ?auto_48048 ?auto_48046 ) ( ON ?auto_48047 ?auto_48048 ) ( not ( = ?auto_48046 ?auto_48048 ) ) ( not ( = ?auto_48046 ?auto_48047 ) ) ( not ( = ?auto_48046 ?auto_48045 ) ) ( not ( = ?auto_48046 ?auto_48044 ) ) ( not ( = ?auto_48048 ?auto_48047 ) ) ( not ( = ?auto_48048 ?auto_48045 ) ) ( not ( = ?auto_48048 ?auto_48044 ) ) ( not ( = ?auto_48047 ?auto_48045 ) ) ( not ( = ?auto_48047 ?auto_48044 ) ) ( not ( = ?auto_48043 ?auto_48046 ) ) ( not ( = ?auto_48043 ?auto_48048 ) ) ( not ( = ?auto_48043 ?auto_48047 ) ) ( not ( = ?auto_48049 ?auto_48046 ) ) ( not ( = ?auto_48049 ?auto_48048 ) ) ( not ( = ?auto_48049 ?auto_48047 ) ) ( ON ?auto_48044 ?auto_48043 ) ( CLEAR ?auto_48044 ) ( ON-TABLE ?auto_48049 ) ( HOLDING ?auto_48045 ) ( CLEAR ?auto_48047 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48046 ?auto_48048 ?auto_48047 ?auto_48045 )
      ( MAKE-2PILE ?auto_48043 ?auto_48044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48050 - BLOCK
      ?auto_48051 - BLOCK
    )
    :vars
    (
      ?auto_48056 - BLOCK
      ?auto_48053 - BLOCK
      ?auto_48052 - BLOCK
      ?auto_48054 - BLOCK
      ?auto_48055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48050 ?auto_48051 ) ) ( not ( = ?auto_48050 ?auto_48056 ) ) ( not ( = ?auto_48051 ?auto_48056 ) ) ( ON ?auto_48050 ?auto_48053 ) ( not ( = ?auto_48050 ?auto_48053 ) ) ( not ( = ?auto_48051 ?auto_48053 ) ) ( not ( = ?auto_48056 ?auto_48053 ) ) ( ON-TABLE ?auto_48052 ) ( ON ?auto_48054 ?auto_48052 ) ( ON ?auto_48055 ?auto_48054 ) ( not ( = ?auto_48052 ?auto_48054 ) ) ( not ( = ?auto_48052 ?auto_48055 ) ) ( not ( = ?auto_48052 ?auto_48056 ) ) ( not ( = ?auto_48052 ?auto_48051 ) ) ( not ( = ?auto_48054 ?auto_48055 ) ) ( not ( = ?auto_48054 ?auto_48056 ) ) ( not ( = ?auto_48054 ?auto_48051 ) ) ( not ( = ?auto_48055 ?auto_48056 ) ) ( not ( = ?auto_48055 ?auto_48051 ) ) ( not ( = ?auto_48050 ?auto_48052 ) ) ( not ( = ?auto_48050 ?auto_48054 ) ) ( not ( = ?auto_48050 ?auto_48055 ) ) ( not ( = ?auto_48053 ?auto_48052 ) ) ( not ( = ?auto_48053 ?auto_48054 ) ) ( not ( = ?auto_48053 ?auto_48055 ) ) ( ON ?auto_48051 ?auto_48050 ) ( ON-TABLE ?auto_48053 ) ( CLEAR ?auto_48055 ) ( ON ?auto_48056 ?auto_48051 ) ( CLEAR ?auto_48056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48053 ?auto_48050 ?auto_48051 )
      ( MAKE-2PILE ?auto_48050 ?auto_48051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48057 - BLOCK
      ?auto_48058 - BLOCK
    )
    :vars
    (
      ?auto_48063 - BLOCK
      ?auto_48062 - BLOCK
      ?auto_48061 - BLOCK
      ?auto_48059 - BLOCK
      ?auto_48060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48057 ?auto_48058 ) ) ( not ( = ?auto_48057 ?auto_48063 ) ) ( not ( = ?auto_48058 ?auto_48063 ) ) ( ON ?auto_48057 ?auto_48062 ) ( not ( = ?auto_48057 ?auto_48062 ) ) ( not ( = ?auto_48058 ?auto_48062 ) ) ( not ( = ?auto_48063 ?auto_48062 ) ) ( ON-TABLE ?auto_48061 ) ( ON ?auto_48059 ?auto_48061 ) ( not ( = ?auto_48061 ?auto_48059 ) ) ( not ( = ?auto_48061 ?auto_48060 ) ) ( not ( = ?auto_48061 ?auto_48063 ) ) ( not ( = ?auto_48061 ?auto_48058 ) ) ( not ( = ?auto_48059 ?auto_48060 ) ) ( not ( = ?auto_48059 ?auto_48063 ) ) ( not ( = ?auto_48059 ?auto_48058 ) ) ( not ( = ?auto_48060 ?auto_48063 ) ) ( not ( = ?auto_48060 ?auto_48058 ) ) ( not ( = ?auto_48057 ?auto_48061 ) ) ( not ( = ?auto_48057 ?auto_48059 ) ) ( not ( = ?auto_48057 ?auto_48060 ) ) ( not ( = ?auto_48062 ?auto_48061 ) ) ( not ( = ?auto_48062 ?auto_48059 ) ) ( not ( = ?auto_48062 ?auto_48060 ) ) ( ON ?auto_48058 ?auto_48057 ) ( ON-TABLE ?auto_48062 ) ( ON ?auto_48063 ?auto_48058 ) ( CLEAR ?auto_48063 ) ( HOLDING ?auto_48060 ) ( CLEAR ?auto_48059 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48061 ?auto_48059 ?auto_48060 )
      ( MAKE-2PILE ?auto_48057 ?auto_48058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48064 - BLOCK
      ?auto_48065 - BLOCK
    )
    :vars
    (
      ?auto_48069 - BLOCK
      ?auto_48067 - BLOCK
      ?auto_48068 - BLOCK
      ?auto_48070 - BLOCK
      ?auto_48066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48064 ?auto_48065 ) ) ( not ( = ?auto_48064 ?auto_48069 ) ) ( not ( = ?auto_48065 ?auto_48069 ) ) ( ON ?auto_48064 ?auto_48067 ) ( not ( = ?auto_48064 ?auto_48067 ) ) ( not ( = ?auto_48065 ?auto_48067 ) ) ( not ( = ?auto_48069 ?auto_48067 ) ) ( ON-TABLE ?auto_48068 ) ( ON ?auto_48070 ?auto_48068 ) ( not ( = ?auto_48068 ?auto_48070 ) ) ( not ( = ?auto_48068 ?auto_48066 ) ) ( not ( = ?auto_48068 ?auto_48069 ) ) ( not ( = ?auto_48068 ?auto_48065 ) ) ( not ( = ?auto_48070 ?auto_48066 ) ) ( not ( = ?auto_48070 ?auto_48069 ) ) ( not ( = ?auto_48070 ?auto_48065 ) ) ( not ( = ?auto_48066 ?auto_48069 ) ) ( not ( = ?auto_48066 ?auto_48065 ) ) ( not ( = ?auto_48064 ?auto_48068 ) ) ( not ( = ?auto_48064 ?auto_48070 ) ) ( not ( = ?auto_48064 ?auto_48066 ) ) ( not ( = ?auto_48067 ?auto_48068 ) ) ( not ( = ?auto_48067 ?auto_48070 ) ) ( not ( = ?auto_48067 ?auto_48066 ) ) ( ON ?auto_48065 ?auto_48064 ) ( ON-TABLE ?auto_48067 ) ( ON ?auto_48069 ?auto_48065 ) ( CLEAR ?auto_48070 ) ( ON ?auto_48066 ?auto_48069 ) ( CLEAR ?auto_48066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48067 ?auto_48064 ?auto_48065 ?auto_48069 )
      ( MAKE-2PILE ?auto_48064 ?auto_48065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48071 - BLOCK
      ?auto_48072 - BLOCK
    )
    :vars
    (
      ?auto_48073 - BLOCK
      ?auto_48075 - BLOCK
      ?auto_48074 - BLOCK
      ?auto_48077 - BLOCK
      ?auto_48076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48071 ?auto_48072 ) ) ( not ( = ?auto_48071 ?auto_48073 ) ) ( not ( = ?auto_48072 ?auto_48073 ) ) ( ON ?auto_48071 ?auto_48075 ) ( not ( = ?auto_48071 ?auto_48075 ) ) ( not ( = ?auto_48072 ?auto_48075 ) ) ( not ( = ?auto_48073 ?auto_48075 ) ) ( ON-TABLE ?auto_48074 ) ( not ( = ?auto_48074 ?auto_48077 ) ) ( not ( = ?auto_48074 ?auto_48076 ) ) ( not ( = ?auto_48074 ?auto_48073 ) ) ( not ( = ?auto_48074 ?auto_48072 ) ) ( not ( = ?auto_48077 ?auto_48076 ) ) ( not ( = ?auto_48077 ?auto_48073 ) ) ( not ( = ?auto_48077 ?auto_48072 ) ) ( not ( = ?auto_48076 ?auto_48073 ) ) ( not ( = ?auto_48076 ?auto_48072 ) ) ( not ( = ?auto_48071 ?auto_48074 ) ) ( not ( = ?auto_48071 ?auto_48077 ) ) ( not ( = ?auto_48071 ?auto_48076 ) ) ( not ( = ?auto_48075 ?auto_48074 ) ) ( not ( = ?auto_48075 ?auto_48077 ) ) ( not ( = ?auto_48075 ?auto_48076 ) ) ( ON ?auto_48072 ?auto_48071 ) ( ON-TABLE ?auto_48075 ) ( ON ?auto_48073 ?auto_48072 ) ( ON ?auto_48076 ?auto_48073 ) ( CLEAR ?auto_48076 ) ( HOLDING ?auto_48077 ) ( CLEAR ?auto_48074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48074 ?auto_48077 )
      ( MAKE-2PILE ?auto_48071 ?auto_48072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48078 - BLOCK
      ?auto_48079 - BLOCK
    )
    :vars
    (
      ?auto_48080 - BLOCK
      ?auto_48084 - BLOCK
      ?auto_48081 - BLOCK
      ?auto_48082 - BLOCK
      ?auto_48083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48078 ?auto_48079 ) ) ( not ( = ?auto_48078 ?auto_48080 ) ) ( not ( = ?auto_48079 ?auto_48080 ) ) ( ON ?auto_48078 ?auto_48084 ) ( not ( = ?auto_48078 ?auto_48084 ) ) ( not ( = ?auto_48079 ?auto_48084 ) ) ( not ( = ?auto_48080 ?auto_48084 ) ) ( ON-TABLE ?auto_48081 ) ( not ( = ?auto_48081 ?auto_48082 ) ) ( not ( = ?auto_48081 ?auto_48083 ) ) ( not ( = ?auto_48081 ?auto_48080 ) ) ( not ( = ?auto_48081 ?auto_48079 ) ) ( not ( = ?auto_48082 ?auto_48083 ) ) ( not ( = ?auto_48082 ?auto_48080 ) ) ( not ( = ?auto_48082 ?auto_48079 ) ) ( not ( = ?auto_48083 ?auto_48080 ) ) ( not ( = ?auto_48083 ?auto_48079 ) ) ( not ( = ?auto_48078 ?auto_48081 ) ) ( not ( = ?auto_48078 ?auto_48082 ) ) ( not ( = ?auto_48078 ?auto_48083 ) ) ( not ( = ?auto_48084 ?auto_48081 ) ) ( not ( = ?auto_48084 ?auto_48082 ) ) ( not ( = ?auto_48084 ?auto_48083 ) ) ( ON ?auto_48079 ?auto_48078 ) ( ON-TABLE ?auto_48084 ) ( ON ?auto_48080 ?auto_48079 ) ( ON ?auto_48083 ?auto_48080 ) ( CLEAR ?auto_48081 ) ( ON ?auto_48082 ?auto_48083 ) ( CLEAR ?auto_48082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48084 ?auto_48078 ?auto_48079 ?auto_48080 ?auto_48083 )
      ( MAKE-2PILE ?auto_48078 ?auto_48079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48085 - BLOCK
      ?auto_48086 - BLOCK
    )
    :vars
    (
      ?auto_48091 - BLOCK
      ?auto_48089 - BLOCK
      ?auto_48090 - BLOCK
      ?auto_48087 - BLOCK
      ?auto_48088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48085 ?auto_48086 ) ) ( not ( = ?auto_48085 ?auto_48091 ) ) ( not ( = ?auto_48086 ?auto_48091 ) ) ( ON ?auto_48085 ?auto_48089 ) ( not ( = ?auto_48085 ?auto_48089 ) ) ( not ( = ?auto_48086 ?auto_48089 ) ) ( not ( = ?auto_48091 ?auto_48089 ) ) ( not ( = ?auto_48090 ?auto_48087 ) ) ( not ( = ?auto_48090 ?auto_48088 ) ) ( not ( = ?auto_48090 ?auto_48091 ) ) ( not ( = ?auto_48090 ?auto_48086 ) ) ( not ( = ?auto_48087 ?auto_48088 ) ) ( not ( = ?auto_48087 ?auto_48091 ) ) ( not ( = ?auto_48087 ?auto_48086 ) ) ( not ( = ?auto_48088 ?auto_48091 ) ) ( not ( = ?auto_48088 ?auto_48086 ) ) ( not ( = ?auto_48085 ?auto_48090 ) ) ( not ( = ?auto_48085 ?auto_48087 ) ) ( not ( = ?auto_48085 ?auto_48088 ) ) ( not ( = ?auto_48089 ?auto_48090 ) ) ( not ( = ?auto_48089 ?auto_48087 ) ) ( not ( = ?auto_48089 ?auto_48088 ) ) ( ON ?auto_48086 ?auto_48085 ) ( ON-TABLE ?auto_48089 ) ( ON ?auto_48091 ?auto_48086 ) ( ON ?auto_48088 ?auto_48091 ) ( ON ?auto_48087 ?auto_48088 ) ( CLEAR ?auto_48087 ) ( HOLDING ?auto_48090 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48090 )
      ( MAKE-2PILE ?auto_48085 ?auto_48086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48092 - BLOCK
      ?auto_48093 - BLOCK
    )
    :vars
    (
      ?auto_48095 - BLOCK
      ?auto_48096 - BLOCK
      ?auto_48098 - BLOCK
      ?auto_48097 - BLOCK
      ?auto_48094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48092 ?auto_48093 ) ) ( not ( = ?auto_48092 ?auto_48095 ) ) ( not ( = ?auto_48093 ?auto_48095 ) ) ( ON ?auto_48092 ?auto_48096 ) ( not ( = ?auto_48092 ?auto_48096 ) ) ( not ( = ?auto_48093 ?auto_48096 ) ) ( not ( = ?auto_48095 ?auto_48096 ) ) ( not ( = ?auto_48098 ?auto_48097 ) ) ( not ( = ?auto_48098 ?auto_48094 ) ) ( not ( = ?auto_48098 ?auto_48095 ) ) ( not ( = ?auto_48098 ?auto_48093 ) ) ( not ( = ?auto_48097 ?auto_48094 ) ) ( not ( = ?auto_48097 ?auto_48095 ) ) ( not ( = ?auto_48097 ?auto_48093 ) ) ( not ( = ?auto_48094 ?auto_48095 ) ) ( not ( = ?auto_48094 ?auto_48093 ) ) ( not ( = ?auto_48092 ?auto_48098 ) ) ( not ( = ?auto_48092 ?auto_48097 ) ) ( not ( = ?auto_48092 ?auto_48094 ) ) ( not ( = ?auto_48096 ?auto_48098 ) ) ( not ( = ?auto_48096 ?auto_48097 ) ) ( not ( = ?auto_48096 ?auto_48094 ) ) ( ON ?auto_48093 ?auto_48092 ) ( ON-TABLE ?auto_48096 ) ( ON ?auto_48095 ?auto_48093 ) ( ON ?auto_48094 ?auto_48095 ) ( ON ?auto_48097 ?auto_48094 ) ( ON ?auto_48098 ?auto_48097 ) ( CLEAR ?auto_48098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48096 ?auto_48092 ?auto_48093 ?auto_48095 ?auto_48094 ?auto_48097 )
      ( MAKE-2PILE ?auto_48092 ?auto_48093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48118 - BLOCK
      ?auto_48119 - BLOCK
      ?auto_48120 - BLOCK
    )
    :vars
    (
      ?auto_48122 - BLOCK
      ?auto_48121 - BLOCK
      ?auto_48123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48122 ?auto_48120 ) ( ON-TABLE ?auto_48118 ) ( ON ?auto_48119 ?auto_48118 ) ( ON ?auto_48120 ?auto_48119 ) ( not ( = ?auto_48118 ?auto_48119 ) ) ( not ( = ?auto_48118 ?auto_48120 ) ) ( not ( = ?auto_48118 ?auto_48122 ) ) ( not ( = ?auto_48119 ?auto_48120 ) ) ( not ( = ?auto_48119 ?auto_48122 ) ) ( not ( = ?auto_48120 ?auto_48122 ) ) ( not ( = ?auto_48118 ?auto_48121 ) ) ( not ( = ?auto_48118 ?auto_48123 ) ) ( not ( = ?auto_48119 ?auto_48121 ) ) ( not ( = ?auto_48119 ?auto_48123 ) ) ( not ( = ?auto_48120 ?auto_48121 ) ) ( not ( = ?auto_48120 ?auto_48123 ) ) ( not ( = ?auto_48122 ?auto_48121 ) ) ( not ( = ?auto_48122 ?auto_48123 ) ) ( not ( = ?auto_48121 ?auto_48123 ) ) ( ON ?auto_48121 ?auto_48122 ) ( CLEAR ?auto_48121 ) ( HOLDING ?auto_48123 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48123 )
      ( MAKE-3PILE ?auto_48118 ?auto_48119 ?auto_48120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48183 - BLOCK
      ?auto_48184 - BLOCK
      ?auto_48185 - BLOCK
    )
    :vars
    (
      ?auto_48186 - BLOCK
      ?auto_48188 - BLOCK
      ?auto_48187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48183 ) ( not ( = ?auto_48183 ?auto_48184 ) ) ( not ( = ?auto_48183 ?auto_48185 ) ) ( not ( = ?auto_48184 ?auto_48185 ) ) ( ON ?auto_48185 ?auto_48186 ) ( not ( = ?auto_48183 ?auto_48186 ) ) ( not ( = ?auto_48184 ?auto_48186 ) ) ( not ( = ?auto_48185 ?auto_48186 ) ) ( CLEAR ?auto_48183 ) ( ON ?auto_48184 ?auto_48185 ) ( CLEAR ?auto_48184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48188 ) ( ON ?auto_48187 ?auto_48188 ) ( ON ?auto_48186 ?auto_48187 ) ( not ( = ?auto_48188 ?auto_48187 ) ) ( not ( = ?auto_48188 ?auto_48186 ) ) ( not ( = ?auto_48188 ?auto_48185 ) ) ( not ( = ?auto_48188 ?auto_48184 ) ) ( not ( = ?auto_48187 ?auto_48186 ) ) ( not ( = ?auto_48187 ?auto_48185 ) ) ( not ( = ?auto_48187 ?auto_48184 ) ) ( not ( = ?auto_48183 ?auto_48188 ) ) ( not ( = ?auto_48183 ?auto_48187 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48188 ?auto_48187 ?auto_48186 ?auto_48185 )
      ( MAKE-3PILE ?auto_48183 ?auto_48184 ?auto_48185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48189 - BLOCK
      ?auto_48190 - BLOCK
      ?auto_48191 - BLOCK
    )
    :vars
    (
      ?auto_48194 - BLOCK
      ?auto_48192 - BLOCK
      ?auto_48193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48189 ?auto_48190 ) ) ( not ( = ?auto_48189 ?auto_48191 ) ) ( not ( = ?auto_48190 ?auto_48191 ) ) ( ON ?auto_48191 ?auto_48194 ) ( not ( = ?auto_48189 ?auto_48194 ) ) ( not ( = ?auto_48190 ?auto_48194 ) ) ( not ( = ?auto_48191 ?auto_48194 ) ) ( ON ?auto_48190 ?auto_48191 ) ( CLEAR ?auto_48190 ) ( ON-TABLE ?auto_48192 ) ( ON ?auto_48193 ?auto_48192 ) ( ON ?auto_48194 ?auto_48193 ) ( not ( = ?auto_48192 ?auto_48193 ) ) ( not ( = ?auto_48192 ?auto_48194 ) ) ( not ( = ?auto_48192 ?auto_48191 ) ) ( not ( = ?auto_48192 ?auto_48190 ) ) ( not ( = ?auto_48193 ?auto_48194 ) ) ( not ( = ?auto_48193 ?auto_48191 ) ) ( not ( = ?auto_48193 ?auto_48190 ) ) ( not ( = ?auto_48189 ?auto_48192 ) ) ( not ( = ?auto_48189 ?auto_48193 ) ) ( HOLDING ?auto_48189 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48189 )
      ( MAKE-3PILE ?auto_48189 ?auto_48190 ?auto_48191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48195 - BLOCK
      ?auto_48196 - BLOCK
      ?auto_48197 - BLOCK
    )
    :vars
    (
      ?auto_48199 - BLOCK
      ?auto_48200 - BLOCK
      ?auto_48198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48195 ?auto_48196 ) ) ( not ( = ?auto_48195 ?auto_48197 ) ) ( not ( = ?auto_48196 ?auto_48197 ) ) ( ON ?auto_48197 ?auto_48199 ) ( not ( = ?auto_48195 ?auto_48199 ) ) ( not ( = ?auto_48196 ?auto_48199 ) ) ( not ( = ?auto_48197 ?auto_48199 ) ) ( ON ?auto_48196 ?auto_48197 ) ( ON-TABLE ?auto_48200 ) ( ON ?auto_48198 ?auto_48200 ) ( ON ?auto_48199 ?auto_48198 ) ( not ( = ?auto_48200 ?auto_48198 ) ) ( not ( = ?auto_48200 ?auto_48199 ) ) ( not ( = ?auto_48200 ?auto_48197 ) ) ( not ( = ?auto_48200 ?auto_48196 ) ) ( not ( = ?auto_48198 ?auto_48199 ) ) ( not ( = ?auto_48198 ?auto_48197 ) ) ( not ( = ?auto_48198 ?auto_48196 ) ) ( not ( = ?auto_48195 ?auto_48200 ) ) ( not ( = ?auto_48195 ?auto_48198 ) ) ( ON ?auto_48195 ?auto_48196 ) ( CLEAR ?auto_48195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48200 ?auto_48198 ?auto_48199 ?auto_48197 ?auto_48196 )
      ( MAKE-3PILE ?auto_48195 ?auto_48196 ?auto_48197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48204 - BLOCK
      ?auto_48205 - BLOCK
      ?auto_48206 - BLOCK
    )
    :vars
    (
      ?auto_48209 - BLOCK
      ?auto_48207 - BLOCK
      ?auto_48208 - BLOCK
      ?auto_48210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48204 ?auto_48205 ) ) ( not ( = ?auto_48204 ?auto_48206 ) ) ( not ( = ?auto_48205 ?auto_48206 ) ) ( ON ?auto_48206 ?auto_48209 ) ( not ( = ?auto_48204 ?auto_48209 ) ) ( not ( = ?auto_48205 ?auto_48209 ) ) ( not ( = ?auto_48206 ?auto_48209 ) ) ( ON ?auto_48205 ?auto_48206 ) ( CLEAR ?auto_48205 ) ( ON-TABLE ?auto_48207 ) ( ON ?auto_48208 ?auto_48207 ) ( ON ?auto_48209 ?auto_48208 ) ( not ( = ?auto_48207 ?auto_48208 ) ) ( not ( = ?auto_48207 ?auto_48209 ) ) ( not ( = ?auto_48207 ?auto_48206 ) ) ( not ( = ?auto_48207 ?auto_48205 ) ) ( not ( = ?auto_48208 ?auto_48209 ) ) ( not ( = ?auto_48208 ?auto_48206 ) ) ( not ( = ?auto_48208 ?auto_48205 ) ) ( not ( = ?auto_48204 ?auto_48207 ) ) ( not ( = ?auto_48204 ?auto_48208 ) ) ( ON ?auto_48204 ?auto_48210 ) ( CLEAR ?auto_48204 ) ( HAND-EMPTY ) ( not ( = ?auto_48204 ?auto_48210 ) ) ( not ( = ?auto_48205 ?auto_48210 ) ) ( not ( = ?auto_48206 ?auto_48210 ) ) ( not ( = ?auto_48209 ?auto_48210 ) ) ( not ( = ?auto_48207 ?auto_48210 ) ) ( not ( = ?auto_48208 ?auto_48210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48204 ?auto_48210 )
      ( MAKE-3PILE ?auto_48204 ?auto_48205 ?auto_48206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48211 - BLOCK
      ?auto_48212 - BLOCK
      ?auto_48213 - BLOCK
    )
    :vars
    (
      ?auto_48215 - BLOCK
      ?auto_48217 - BLOCK
      ?auto_48216 - BLOCK
      ?auto_48214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48211 ?auto_48212 ) ) ( not ( = ?auto_48211 ?auto_48213 ) ) ( not ( = ?auto_48212 ?auto_48213 ) ) ( ON ?auto_48213 ?auto_48215 ) ( not ( = ?auto_48211 ?auto_48215 ) ) ( not ( = ?auto_48212 ?auto_48215 ) ) ( not ( = ?auto_48213 ?auto_48215 ) ) ( ON-TABLE ?auto_48217 ) ( ON ?auto_48216 ?auto_48217 ) ( ON ?auto_48215 ?auto_48216 ) ( not ( = ?auto_48217 ?auto_48216 ) ) ( not ( = ?auto_48217 ?auto_48215 ) ) ( not ( = ?auto_48217 ?auto_48213 ) ) ( not ( = ?auto_48217 ?auto_48212 ) ) ( not ( = ?auto_48216 ?auto_48215 ) ) ( not ( = ?auto_48216 ?auto_48213 ) ) ( not ( = ?auto_48216 ?auto_48212 ) ) ( not ( = ?auto_48211 ?auto_48217 ) ) ( not ( = ?auto_48211 ?auto_48216 ) ) ( ON ?auto_48211 ?auto_48214 ) ( CLEAR ?auto_48211 ) ( not ( = ?auto_48211 ?auto_48214 ) ) ( not ( = ?auto_48212 ?auto_48214 ) ) ( not ( = ?auto_48213 ?auto_48214 ) ) ( not ( = ?auto_48215 ?auto_48214 ) ) ( not ( = ?auto_48217 ?auto_48214 ) ) ( not ( = ?auto_48216 ?auto_48214 ) ) ( HOLDING ?auto_48212 ) ( CLEAR ?auto_48213 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48217 ?auto_48216 ?auto_48215 ?auto_48213 ?auto_48212 )
      ( MAKE-3PILE ?auto_48211 ?auto_48212 ?auto_48213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48218 - BLOCK
      ?auto_48219 - BLOCK
      ?auto_48220 - BLOCK
    )
    :vars
    (
      ?auto_48224 - BLOCK
      ?auto_48222 - BLOCK
      ?auto_48223 - BLOCK
      ?auto_48221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48218 ?auto_48219 ) ) ( not ( = ?auto_48218 ?auto_48220 ) ) ( not ( = ?auto_48219 ?auto_48220 ) ) ( ON ?auto_48220 ?auto_48224 ) ( not ( = ?auto_48218 ?auto_48224 ) ) ( not ( = ?auto_48219 ?auto_48224 ) ) ( not ( = ?auto_48220 ?auto_48224 ) ) ( ON-TABLE ?auto_48222 ) ( ON ?auto_48223 ?auto_48222 ) ( ON ?auto_48224 ?auto_48223 ) ( not ( = ?auto_48222 ?auto_48223 ) ) ( not ( = ?auto_48222 ?auto_48224 ) ) ( not ( = ?auto_48222 ?auto_48220 ) ) ( not ( = ?auto_48222 ?auto_48219 ) ) ( not ( = ?auto_48223 ?auto_48224 ) ) ( not ( = ?auto_48223 ?auto_48220 ) ) ( not ( = ?auto_48223 ?auto_48219 ) ) ( not ( = ?auto_48218 ?auto_48222 ) ) ( not ( = ?auto_48218 ?auto_48223 ) ) ( ON ?auto_48218 ?auto_48221 ) ( not ( = ?auto_48218 ?auto_48221 ) ) ( not ( = ?auto_48219 ?auto_48221 ) ) ( not ( = ?auto_48220 ?auto_48221 ) ) ( not ( = ?auto_48224 ?auto_48221 ) ) ( not ( = ?auto_48222 ?auto_48221 ) ) ( not ( = ?auto_48223 ?auto_48221 ) ) ( CLEAR ?auto_48220 ) ( ON ?auto_48219 ?auto_48218 ) ( CLEAR ?auto_48219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48221 ?auto_48218 )
      ( MAKE-3PILE ?auto_48218 ?auto_48219 ?auto_48220 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48225 - BLOCK
      ?auto_48226 - BLOCK
      ?auto_48227 - BLOCK
    )
    :vars
    (
      ?auto_48230 - BLOCK
      ?auto_48229 - BLOCK
      ?auto_48231 - BLOCK
      ?auto_48228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48225 ?auto_48226 ) ) ( not ( = ?auto_48225 ?auto_48227 ) ) ( not ( = ?auto_48226 ?auto_48227 ) ) ( not ( = ?auto_48225 ?auto_48230 ) ) ( not ( = ?auto_48226 ?auto_48230 ) ) ( not ( = ?auto_48227 ?auto_48230 ) ) ( ON-TABLE ?auto_48229 ) ( ON ?auto_48231 ?auto_48229 ) ( ON ?auto_48230 ?auto_48231 ) ( not ( = ?auto_48229 ?auto_48231 ) ) ( not ( = ?auto_48229 ?auto_48230 ) ) ( not ( = ?auto_48229 ?auto_48227 ) ) ( not ( = ?auto_48229 ?auto_48226 ) ) ( not ( = ?auto_48231 ?auto_48230 ) ) ( not ( = ?auto_48231 ?auto_48227 ) ) ( not ( = ?auto_48231 ?auto_48226 ) ) ( not ( = ?auto_48225 ?auto_48229 ) ) ( not ( = ?auto_48225 ?auto_48231 ) ) ( ON ?auto_48225 ?auto_48228 ) ( not ( = ?auto_48225 ?auto_48228 ) ) ( not ( = ?auto_48226 ?auto_48228 ) ) ( not ( = ?auto_48227 ?auto_48228 ) ) ( not ( = ?auto_48230 ?auto_48228 ) ) ( not ( = ?auto_48229 ?auto_48228 ) ) ( not ( = ?auto_48231 ?auto_48228 ) ) ( ON ?auto_48226 ?auto_48225 ) ( CLEAR ?auto_48226 ) ( ON-TABLE ?auto_48228 ) ( HOLDING ?auto_48227 ) ( CLEAR ?auto_48230 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48229 ?auto_48231 ?auto_48230 ?auto_48227 )
      ( MAKE-3PILE ?auto_48225 ?auto_48226 ?auto_48227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48232 - BLOCK
      ?auto_48233 - BLOCK
      ?auto_48234 - BLOCK
    )
    :vars
    (
      ?auto_48238 - BLOCK
      ?auto_48236 - BLOCK
      ?auto_48235 - BLOCK
      ?auto_48237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48232 ?auto_48233 ) ) ( not ( = ?auto_48232 ?auto_48234 ) ) ( not ( = ?auto_48233 ?auto_48234 ) ) ( not ( = ?auto_48232 ?auto_48238 ) ) ( not ( = ?auto_48233 ?auto_48238 ) ) ( not ( = ?auto_48234 ?auto_48238 ) ) ( ON-TABLE ?auto_48236 ) ( ON ?auto_48235 ?auto_48236 ) ( ON ?auto_48238 ?auto_48235 ) ( not ( = ?auto_48236 ?auto_48235 ) ) ( not ( = ?auto_48236 ?auto_48238 ) ) ( not ( = ?auto_48236 ?auto_48234 ) ) ( not ( = ?auto_48236 ?auto_48233 ) ) ( not ( = ?auto_48235 ?auto_48238 ) ) ( not ( = ?auto_48235 ?auto_48234 ) ) ( not ( = ?auto_48235 ?auto_48233 ) ) ( not ( = ?auto_48232 ?auto_48236 ) ) ( not ( = ?auto_48232 ?auto_48235 ) ) ( ON ?auto_48232 ?auto_48237 ) ( not ( = ?auto_48232 ?auto_48237 ) ) ( not ( = ?auto_48233 ?auto_48237 ) ) ( not ( = ?auto_48234 ?auto_48237 ) ) ( not ( = ?auto_48238 ?auto_48237 ) ) ( not ( = ?auto_48236 ?auto_48237 ) ) ( not ( = ?auto_48235 ?auto_48237 ) ) ( ON ?auto_48233 ?auto_48232 ) ( ON-TABLE ?auto_48237 ) ( CLEAR ?auto_48238 ) ( ON ?auto_48234 ?auto_48233 ) ( CLEAR ?auto_48234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48237 ?auto_48232 ?auto_48233 )
      ( MAKE-3PILE ?auto_48232 ?auto_48233 ?auto_48234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48239 - BLOCK
      ?auto_48240 - BLOCK
      ?auto_48241 - BLOCK
    )
    :vars
    (
      ?auto_48242 - BLOCK
      ?auto_48244 - BLOCK
      ?auto_48243 - BLOCK
      ?auto_48245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48239 ?auto_48240 ) ) ( not ( = ?auto_48239 ?auto_48241 ) ) ( not ( = ?auto_48240 ?auto_48241 ) ) ( not ( = ?auto_48239 ?auto_48242 ) ) ( not ( = ?auto_48240 ?auto_48242 ) ) ( not ( = ?auto_48241 ?auto_48242 ) ) ( ON-TABLE ?auto_48244 ) ( ON ?auto_48243 ?auto_48244 ) ( not ( = ?auto_48244 ?auto_48243 ) ) ( not ( = ?auto_48244 ?auto_48242 ) ) ( not ( = ?auto_48244 ?auto_48241 ) ) ( not ( = ?auto_48244 ?auto_48240 ) ) ( not ( = ?auto_48243 ?auto_48242 ) ) ( not ( = ?auto_48243 ?auto_48241 ) ) ( not ( = ?auto_48243 ?auto_48240 ) ) ( not ( = ?auto_48239 ?auto_48244 ) ) ( not ( = ?auto_48239 ?auto_48243 ) ) ( ON ?auto_48239 ?auto_48245 ) ( not ( = ?auto_48239 ?auto_48245 ) ) ( not ( = ?auto_48240 ?auto_48245 ) ) ( not ( = ?auto_48241 ?auto_48245 ) ) ( not ( = ?auto_48242 ?auto_48245 ) ) ( not ( = ?auto_48244 ?auto_48245 ) ) ( not ( = ?auto_48243 ?auto_48245 ) ) ( ON ?auto_48240 ?auto_48239 ) ( ON-TABLE ?auto_48245 ) ( ON ?auto_48241 ?auto_48240 ) ( CLEAR ?auto_48241 ) ( HOLDING ?auto_48242 ) ( CLEAR ?auto_48243 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48244 ?auto_48243 ?auto_48242 )
      ( MAKE-3PILE ?auto_48239 ?auto_48240 ?auto_48241 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48246 - BLOCK
      ?auto_48247 - BLOCK
      ?auto_48248 - BLOCK
    )
    :vars
    (
      ?auto_48251 - BLOCK
      ?auto_48249 - BLOCK
      ?auto_48252 - BLOCK
      ?auto_48250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48246 ?auto_48247 ) ) ( not ( = ?auto_48246 ?auto_48248 ) ) ( not ( = ?auto_48247 ?auto_48248 ) ) ( not ( = ?auto_48246 ?auto_48251 ) ) ( not ( = ?auto_48247 ?auto_48251 ) ) ( not ( = ?auto_48248 ?auto_48251 ) ) ( ON-TABLE ?auto_48249 ) ( ON ?auto_48252 ?auto_48249 ) ( not ( = ?auto_48249 ?auto_48252 ) ) ( not ( = ?auto_48249 ?auto_48251 ) ) ( not ( = ?auto_48249 ?auto_48248 ) ) ( not ( = ?auto_48249 ?auto_48247 ) ) ( not ( = ?auto_48252 ?auto_48251 ) ) ( not ( = ?auto_48252 ?auto_48248 ) ) ( not ( = ?auto_48252 ?auto_48247 ) ) ( not ( = ?auto_48246 ?auto_48249 ) ) ( not ( = ?auto_48246 ?auto_48252 ) ) ( ON ?auto_48246 ?auto_48250 ) ( not ( = ?auto_48246 ?auto_48250 ) ) ( not ( = ?auto_48247 ?auto_48250 ) ) ( not ( = ?auto_48248 ?auto_48250 ) ) ( not ( = ?auto_48251 ?auto_48250 ) ) ( not ( = ?auto_48249 ?auto_48250 ) ) ( not ( = ?auto_48252 ?auto_48250 ) ) ( ON ?auto_48247 ?auto_48246 ) ( ON-TABLE ?auto_48250 ) ( ON ?auto_48248 ?auto_48247 ) ( CLEAR ?auto_48252 ) ( ON ?auto_48251 ?auto_48248 ) ( CLEAR ?auto_48251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48250 ?auto_48246 ?auto_48247 ?auto_48248 )
      ( MAKE-3PILE ?auto_48246 ?auto_48247 ?auto_48248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48253 - BLOCK
      ?auto_48254 - BLOCK
      ?auto_48255 - BLOCK
    )
    :vars
    (
      ?auto_48257 - BLOCK
      ?auto_48256 - BLOCK
      ?auto_48258 - BLOCK
      ?auto_48259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48253 ?auto_48254 ) ) ( not ( = ?auto_48253 ?auto_48255 ) ) ( not ( = ?auto_48254 ?auto_48255 ) ) ( not ( = ?auto_48253 ?auto_48257 ) ) ( not ( = ?auto_48254 ?auto_48257 ) ) ( not ( = ?auto_48255 ?auto_48257 ) ) ( ON-TABLE ?auto_48256 ) ( not ( = ?auto_48256 ?auto_48258 ) ) ( not ( = ?auto_48256 ?auto_48257 ) ) ( not ( = ?auto_48256 ?auto_48255 ) ) ( not ( = ?auto_48256 ?auto_48254 ) ) ( not ( = ?auto_48258 ?auto_48257 ) ) ( not ( = ?auto_48258 ?auto_48255 ) ) ( not ( = ?auto_48258 ?auto_48254 ) ) ( not ( = ?auto_48253 ?auto_48256 ) ) ( not ( = ?auto_48253 ?auto_48258 ) ) ( ON ?auto_48253 ?auto_48259 ) ( not ( = ?auto_48253 ?auto_48259 ) ) ( not ( = ?auto_48254 ?auto_48259 ) ) ( not ( = ?auto_48255 ?auto_48259 ) ) ( not ( = ?auto_48257 ?auto_48259 ) ) ( not ( = ?auto_48256 ?auto_48259 ) ) ( not ( = ?auto_48258 ?auto_48259 ) ) ( ON ?auto_48254 ?auto_48253 ) ( ON-TABLE ?auto_48259 ) ( ON ?auto_48255 ?auto_48254 ) ( ON ?auto_48257 ?auto_48255 ) ( CLEAR ?auto_48257 ) ( HOLDING ?auto_48258 ) ( CLEAR ?auto_48256 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48256 ?auto_48258 )
      ( MAKE-3PILE ?auto_48253 ?auto_48254 ?auto_48255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48260 - BLOCK
      ?auto_48261 - BLOCK
      ?auto_48262 - BLOCK
    )
    :vars
    (
      ?auto_48264 - BLOCK
      ?auto_48263 - BLOCK
      ?auto_48266 - BLOCK
      ?auto_48265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48260 ?auto_48261 ) ) ( not ( = ?auto_48260 ?auto_48262 ) ) ( not ( = ?auto_48261 ?auto_48262 ) ) ( not ( = ?auto_48260 ?auto_48264 ) ) ( not ( = ?auto_48261 ?auto_48264 ) ) ( not ( = ?auto_48262 ?auto_48264 ) ) ( ON-TABLE ?auto_48263 ) ( not ( = ?auto_48263 ?auto_48266 ) ) ( not ( = ?auto_48263 ?auto_48264 ) ) ( not ( = ?auto_48263 ?auto_48262 ) ) ( not ( = ?auto_48263 ?auto_48261 ) ) ( not ( = ?auto_48266 ?auto_48264 ) ) ( not ( = ?auto_48266 ?auto_48262 ) ) ( not ( = ?auto_48266 ?auto_48261 ) ) ( not ( = ?auto_48260 ?auto_48263 ) ) ( not ( = ?auto_48260 ?auto_48266 ) ) ( ON ?auto_48260 ?auto_48265 ) ( not ( = ?auto_48260 ?auto_48265 ) ) ( not ( = ?auto_48261 ?auto_48265 ) ) ( not ( = ?auto_48262 ?auto_48265 ) ) ( not ( = ?auto_48264 ?auto_48265 ) ) ( not ( = ?auto_48263 ?auto_48265 ) ) ( not ( = ?auto_48266 ?auto_48265 ) ) ( ON ?auto_48261 ?auto_48260 ) ( ON-TABLE ?auto_48265 ) ( ON ?auto_48262 ?auto_48261 ) ( ON ?auto_48264 ?auto_48262 ) ( CLEAR ?auto_48263 ) ( ON ?auto_48266 ?auto_48264 ) ( CLEAR ?auto_48266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48265 ?auto_48260 ?auto_48261 ?auto_48262 ?auto_48264 )
      ( MAKE-3PILE ?auto_48260 ?auto_48261 ?auto_48262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48267 - BLOCK
      ?auto_48268 - BLOCK
      ?auto_48269 - BLOCK
    )
    :vars
    (
      ?auto_48271 - BLOCK
      ?auto_48270 - BLOCK
      ?auto_48272 - BLOCK
      ?auto_48273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48267 ?auto_48268 ) ) ( not ( = ?auto_48267 ?auto_48269 ) ) ( not ( = ?auto_48268 ?auto_48269 ) ) ( not ( = ?auto_48267 ?auto_48271 ) ) ( not ( = ?auto_48268 ?auto_48271 ) ) ( not ( = ?auto_48269 ?auto_48271 ) ) ( not ( = ?auto_48270 ?auto_48272 ) ) ( not ( = ?auto_48270 ?auto_48271 ) ) ( not ( = ?auto_48270 ?auto_48269 ) ) ( not ( = ?auto_48270 ?auto_48268 ) ) ( not ( = ?auto_48272 ?auto_48271 ) ) ( not ( = ?auto_48272 ?auto_48269 ) ) ( not ( = ?auto_48272 ?auto_48268 ) ) ( not ( = ?auto_48267 ?auto_48270 ) ) ( not ( = ?auto_48267 ?auto_48272 ) ) ( ON ?auto_48267 ?auto_48273 ) ( not ( = ?auto_48267 ?auto_48273 ) ) ( not ( = ?auto_48268 ?auto_48273 ) ) ( not ( = ?auto_48269 ?auto_48273 ) ) ( not ( = ?auto_48271 ?auto_48273 ) ) ( not ( = ?auto_48270 ?auto_48273 ) ) ( not ( = ?auto_48272 ?auto_48273 ) ) ( ON ?auto_48268 ?auto_48267 ) ( ON-TABLE ?auto_48273 ) ( ON ?auto_48269 ?auto_48268 ) ( ON ?auto_48271 ?auto_48269 ) ( ON ?auto_48272 ?auto_48271 ) ( CLEAR ?auto_48272 ) ( HOLDING ?auto_48270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48270 )
      ( MAKE-3PILE ?auto_48267 ?auto_48268 ?auto_48269 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_48274 - BLOCK
      ?auto_48275 - BLOCK
      ?auto_48276 - BLOCK
    )
    :vars
    (
      ?auto_48278 - BLOCK
      ?auto_48277 - BLOCK
      ?auto_48279 - BLOCK
      ?auto_48280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48274 ?auto_48275 ) ) ( not ( = ?auto_48274 ?auto_48276 ) ) ( not ( = ?auto_48275 ?auto_48276 ) ) ( not ( = ?auto_48274 ?auto_48278 ) ) ( not ( = ?auto_48275 ?auto_48278 ) ) ( not ( = ?auto_48276 ?auto_48278 ) ) ( not ( = ?auto_48277 ?auto_48279 ) ) ( not ( = ?auto_48277 ?auto_48278 ) ) ( not ( = ?auto_48277 ?auto_48276 ) ) ( not ( = ?auto_48277 ?auto_48275 ) ) ( not ( = ?auto_48279 ?auto_48278 ) ) ( not ( = ?auto_48279 ?auto_48276 ) ) ( not ( = ?auto_48279 ?auto_48275 ) ) ( not ( = ?auto_48274 ?auto_48277 ) ) ( not ( = ?auto_48274 ?auto_48279 ) ) ( ON ?auto_48274 ?auto_48280 ) ( not ( = ?auto_48274 ?auto_48280 ) ) ( not ( = ?auto_48275 ?auto_48280 ) ) ( not ( = ?auto_48276 ?auto_48280 ) ) ( not ( = ?auto_48278 ?auto_48280 ) ) ( not ( = ?auto_48277 ?auto_48280 ) ) ( not ( = ?auto_48279 ?auto_48280 ) ) ( ON ?auto_48275 ?auto_48274 ) ( ON-TABLE ?auto_48280 ) ( ON ?auto_48276 ?auto_48275 ) ( ON ?auto_48278 ?auto_48276 ) ( ON ?auto_48279 ?auto_48278 ) ( ON ?auto_48277 ?auto_48279 ) ( CLEAR ?auto_48277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48280 ?auto_48274 ?auto_48275 ?auto_48276 ?auto_48278 ?auto_48279 )
      ( MAKE-3PILE ?auto_48274 ?auto_48275 ?auto_48276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48296 - BLOCK
      ?auto_48297 - BLOCK
    )
    :vars
    (
      ?auto_48299 - BLOCK
      ?auto_48298 - BLOCK
      ?auto_48300 - BLOCK
      ?auto_48301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48299 ?auto_48297 ) ( ON-TABLE ?auto_48296 ) ( ON ?auto_48297 ?auto_48296 ) ( not ( = ?auto_48296 ?auto_48297 ) ) ( not ( = ?auto_48296 ?auto_48299 ) ) ( not ( = ?auto_48297 ?auto_48299 ) ) ( not ( = ?auto_48296 ?auto_48298 ) ) ( not ( = ?auto_48296 ?auto_48300 ) ) ( not ( = ?auto_48297 ?auto_48298 ) ) ( not ( = ?auto_48297 ?auto_48300 ) ) ( not ( = ?auto_48299 ?auto_48298 ) ) ( not ( = ?auto_48299 ?auto_48300 ) ) ( not ( = ?auto_48298 ?auto_48300 ) ) ( ON ?auto_48298 ?auto_48299 ) ( CLEAR ?auto_48298 ) ( HOLDING ?auto_48300 ) ( CLEAR ?auto_48301 ) ( ON-TABLE ?auto_48301 ) ( not ( = ?auto_48301 ?auto_48300 ) ) ( not ( = ?auto_48296 ?auto_48301 ) ) ( not ( = ?auto_48297 ?auto_48301 ) ) ( not ( = ?auto_48299 ?auto_48301 ) ) ( not ( = ?auto_48298 ?auto_48301 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48301 ?auto_48300 )
      ( MAKE-2PILE ?auto_48296 ?auto_48297 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48302 - BLOCK
      ?auto_48303 - BLOCK
    )
    :vars
    (
      ?auto_48307 - BLOCK
      ?auto_48305 - BLOCK
      ?auto_48304 - BLOCK
      ?auto_48306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48307 ?auto_48303 ) ( ON-TABLE ?auto_48302 ) ( ON ?auto_48303 ?auto_48302 ) ( not ( = ?auto_48302 ?auto_48303 ) ) ( not ( = ?auto_48302 ?auto_48307 ) ) ( not ( = ?auto_48303 ?auto_48307 ) ) ( not ( = ?auto_48302 ?auto_48305 ) ) ( not ( = ?auto_48302 ?auto_48304 ) ) ( not ( = ?auto_48303 ?auto_48305 ) ) ( not ( = ?auto_48303 ?auto_48304 ) ) ( not ( = ?auto_48307 ?auto_48305 ) ) ( not ( = ?auto_48307 ?auto_48304 ) ) ( not ( = ?auto_48305 ?auto_48304 ) ) ( ON ?auto_48305 ?auto_48307 ) ( CLEAR ?auto_48306 ) ( ON-TABLE ?auto_48306 ) ( not ( = ?auto_48306 ?auto_48304 ) ) ( not ( = ?auto_48302 ?auto_48306 ) ) ( not ( = ?auto_48303 ?auto_48306 ) ) ( not ( = ?auto_48307 ?auto_48306 ) ) ( not ( = ?auto_48305 ?auto_48306 ) ) ( ON ?auto_48304 ?auto_48305 ) ( CLEAR ?auto_48304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48302 ?auto_48303 ?auto_48307 ?auto_48305 )
      ( MAKE-2PILE ?auto_48302 ?auto_48303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48308 - BLOCK
      ?auto_48309 - BLOCK
    )
    :vars
    (
      ?auto_48311 - BLOCK
      ?auto_48313 - BLOCK
      ?auto_48312 - BLOCK
      ?auto_48310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48311 ?auto_48309 ) ( ON-TABLE ?auto_48308 ) ( ON ?auto_48309 ?auto_48308 ) ( not ( = ?auto_48308 ?auto_48309 ) ) ( not ( = ?auto_48308 ?auto_48311 ) ) ( not ( = ?auto_48309 ?auto_48311 ) ) ( not ( = ?auto_48308 ?auto_48313 ) ) ( not ( = ?auto_48308 ?auto_48312 ) ) ( not ( = ?auto_48309 ?auto_48313 ) ) ( not ( = ?auto_48309 ?auto_48312 ) ) ( not ( = ?auto_48311 ?auto_48313 ) ) ( not ( = ?auto_48311 ?auto_48312 ) ) ( not ( = ?auto_48313 ?auto_48312 ) ) ( ON ?auto_48313 ?auto_48311 ) ( not ( = ?auto_48310 ?auto_48312 ) ) ( not ( = ?auto_48308 ?auto_48310 ) ) ( not ( = ?auto_48309 ?auto_48310 ) ) ( not ( = ?auto_48311 ?auto_48310 ) ) ( not ( = ?auto_48313 ?auto_48310 ) ) ( ON ?auto_48312 ?auto_48313 ) ( CLEAR ?auto_48312 ) ( HOLDING ?auto_48310 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48310 )
      ( MAKE-2PILE ?auto_48308 ?auto_48309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48322 - BLOCK
      ?auto_48323 - BLOCK
    )
    :vars
    (
      ?auto_48324 - BLOCK
      ?auto_48325 - BLOCK
      ?auto_48326 - BLOCK
      ?auto_48327 - BLOCK
      ?auto_48328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48324 ?auto_48323 ) ( ON-TABLE ?auto_48322 ) ( ON ?auto_48323 ?auto_48322 ) ( not ( = ?auto_48322 ?auto_48323 ) ) ( not ( = ?auto_48322 ?auto_48324 ) ) ( not ( = ?auto_48323 ?auto_48324 ) ) ( not ( = ?auto_48322 ?auto_48325 ) ) ( not ( = ?auto_48322 ?auto_48326 ) ) ( not ( = ?auto_48323 ?auto_48325 ) ) ( not ( = ?auto_48323 ?auto_48326 ) ) ( not ( = ?auto_48324 ?auto_48325 ) ) ( not ( = ?auto_48324 ?auto_48326 ) ) ( not ( = ?auto_48325 ?auto_48326 ) ) ( ON ?auto_48325 ?auto_48324 ) ( not ( = ?auto_48327 ?auto_48326 ) ) ( not ( = ?auto_48322 ?auto_48327 ) ) ( not ( = ?auto_48323 ?auto_48327 ) ) ( not ( = ?auto_48324 ?auto_48327 ) ) ( not ( = ?auto_48325 ?auto_48327 ) ) ( ON ?auto_48326 ?auto_48325 ) ( CLEAR ?auto_48326 ) ( ON ?auto_48327 ?auto_48328 ) ( CLEAR ?auto_48327 ) ( HAND-EMPTY ) ( not ( = ?auto_48322 ?auto_48328 ) ) ( not ( = ?auto_48323 ?auto_48328 ) ) ( not ( = ?auto_48324 ?auto_48328 ) ) ( not ( = ?auto_48325 ?auto_48328 ) ) ( not ( = ?auto_48326 ?auto_48328 ) ) ( not ( = ?auto_48327 ?auto_48328 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48327 ?auto_48328 )
      ( MAKE-2PILE ?auto_48322 ?auto_48323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_48329 - BLOCK
      ?auto_48330 - BLOCK
    )
    :vars
    (
      ?auto_48334 - BLOCK
      ?auto_48331 - BLOCK
      ?auto_48332 - BLOCK
      ?auto_48333 - BLOCK
      ?auto_48335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48334 ?auto_48330 ) ( ON-TABLE ?auto_48329 ) ( ON ?auto_48330 ?auto_48329 ) ( not ( = ?auto_48329 ?auto_48330 ) ) ( not ( = ?auto_48329 ?auto_48334 ) ) ( not ( = ?auto_48330 ?auto_48334 ) ) ( not ( = ?auto_48329 ?auto_48331 ) ) ( not ( = ?auto_48329 ?auto_48332 ) ) ( not ( = ?auto_48330 ?auto_48331 ) ) ( not ( = ?auto_48330 ?auto_48332 ) ) ( not ( = ?auto_48334 ?auto_48331 ) ) ( not ( = ?auto_48334 ?auto_48332 ) ) ( not ( = ?auto_48331 ?auto_48332 ) ) ( ON ?auto_48331 ?auto_48334 ) ( not ( = ?auto_48333 ?auto_48332 ) ) ( not ( = ?auto_48329 ?auto_48333 ) ) ( not ( = ?auto_48330 ?auto_48333 ) ) ( not ( = ?auto_48334 ?auto_48333 ) ) ( not ( = ?auto_48331 ?auto_48333 ) ) ( ON ?auto_48333 ?auto_48335 ) ( CLEAR ?auto_48333 ) ( not ( = ?auto_48329 ?auto_48335 ) ) ( not ( = ?auto_48330 ?auto_48335 ) ) ( not ( = ?auto_48334 ?auto_48335 ) ) ( not ( = ?auto_48331 ?auto_48335 ) ) ( not ( = ?auto_48332 ?auto_48335 ) ) ( not ( = ?auto_48333 ?auto_48335 ) ) ( HOLDING ?auto_48332 ) ( CLEAR ?auto_48331 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48329 ?auto_48330 ?auto_48334 ?auto_48331 ?auto_48332 )
      ( MAKE-2PILE ?auto_48329 ?auto_48330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48375 - BLOCK
      ?auto_48376 - BLOCK
      ?auto_48377 - BLOCK
      ?auto_48378 - BLOCK
    )
    :vars
    (
      ?auto_48379 - BLOCK
      ?auto_48380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48375 ) ( ON ?auto_48376 ?auto_48375 ) ( not ( = ?auto_48375 ?auto_48376 ) ) ( not ( = ?auto_48375 ?auto_48377 ) ) ( not ( = ?auto_48375 ?auto_48378 ) ) ( not ( = ?auto_48376 ?auto_48377 ) ) ( not ( = ?auto_48376 ?auto_48378 ) ) ( not ( = ?auto_48377 ?auto_48378 ) ) ( ON ?auto_48378 ?auto_48379 ) ( not ( = ?auto_48375 ?auto_48379 ) ) ( not ( = ?auto_48376 ?auto_48379 ) ) ( not ( = ?auto_48377 ?auto_48379 ) ) ( not ( = ?auto_48378 ?auto_48379 ) ) ( CLEAR ?auto_48376 ) ( ON ?auto_48377 ?auto_48378 ) ( CLEAR ?auto_48377 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48380 ) ( ON ?auto_48379 ?auto_48380 ) ( not ( = ?auto_48380 ?auto_48379 ) ) ( not ( = ?auto_48380 ?auto_48378 ) ) ( not ( = ?auto_48380 ?auto_48377 ) ) ( not ( = ?auto_48375 ?auto_48380 ) ) ( not ( = ?auto_48376 ?auto_48380 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48380 ?auto_48379 ?auto_48378 )
      ( MAKE-4PILE ?auto_48375 ?auto_48376 ?auto_48377 ?auto_48378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48381 - BLOCK
      ?auto_48382 - BLOCK
      ?auto_48383 - BLOCK
      ?auto_48384 - BLOCK
    )
    :vars
    (
      ?auto_48385 - BLOCK
      ?auto_48386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48381 ) ( not ( = ?auto_48381 ?auto_48382 ) ) ( not ( = ?auto_48381 ?auto_48383 ) ) ( not ( = ?auto_48381 ?auto_48384 ) ) ( not ( = ?auto_48382 ?auto_48383 ) ) ( not ( = ?auto_48382 ?auto_48384 ) ) ( not ( = ?auto_48383 ?auto_48384 ) ) ( ON ?auto_48384 ?auto_48385 ) ( not ( = ?auto_48381 ?auto_48385 ) ) ( not ( = ?auto_48382 ?auto_48385 ) ) ( not ( = ?auto_48383 ?auto_48385 ) ) ( not ( = ?auto_48384 ?auto_48385 ) ) ( ON ?auto_48383 ?auto_48384 ) ( CLEAR ?auto_48383 ) ( ON-TABLE ?auto_48386 ) ( ON ?auto_48385 ?auto_48386 ) ( not ( = ?auto_48386 ?auto_48385 ) ) ( not ( = ?auto_48386 ?auto_48384 ) ) ( not ( = ?auto_48386 ?auto_48383 ) ) ( not ( = ?auto_48381 ?auto_48386 ) ) ( not ( = ?auto_48382 ?auto_48386 ) ) ( HOLDING ?auto_48382 ) ( CLEAR ?auto_48381 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48381 ?auto_48382 )
      ( MAKE-4PILE ?auto_48381 ?auto_48382 ?auto_48383 ?auto_48384 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48387 - BLOCK
      ?auto_48388 - BLOCK
      ?auto_48389 - BLOCK
      ?auto_48390 - BLOCK
    )
    :vars
    (
      ?auto_48392 - BLOCK
      ?auto_48391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48387 ) ( not ( = ?auto_48387 ?auto_48388 ) ) ( not ( = ?auto_48387 ?auto_48389 ) ) ( not ( = ?auto_48387 ?auto_48390 ) ) ( not ( = ?auto_48388 ?auto_48389 ) ) ( not ( = ?auto_48388 ?auto_48390 ) ) ( not ( = ?auto_48389 ?auto_48390 ) ) ( ON ?auto_48390 ?auto_48392 ) ( not ( = ?auto_48387 ?auto_48392 ) ) ( not ( = ?auto_48388 ?auto_48392 ) ) ( not ( = ?auto_48389 ?auto_48392 ) ) ( not ( = ?auto_48390 ?auto_48392 ) ) ( ON ?auto_48389 ?auto_48390 ) ( ON-TABLE ?auto_48391 ) ( ON ?auto_48392 ?auto_48391 ) ( not ( = ?auto_48391 ?auto_48392 ) ) ( not ( = ?auto_48391 ?auto_48390 ) ) ( not ( = ?auto_48391 ?auto_48389 ) ) ( not ( = ?auto_48387 ?auto_48391 ) ) ( not ( = ?auto_48388 ?auto_48391 ) ) ( CLEAR ?auto_48387 ) ( ON ?auto_48388 ?auto_48389 ) ( CLEAR ?auto_48388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48391 ?auto_48392 ?auto_48390 ?auto_48389 )
      ( MAKE-4PILE ?auto_48387 ?auto_48388 ?auto_48389 ?auto_48390 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48393 - BLOCK
      ?auto_48394 - BLOCK
      ?auto_48395 - BLOCK
      ?auto_48396 - BLOCK
    )
    :vars
    (
      ?auto_48398 - BLOCK
      ?auto_48397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48393 ?auto_48394 ) ) ( not ( = ?auto_48393 ?auto_48395 ) ) ( not ( = ?auto_48393 ?auto_48396 ) ) ( not ( = ?auto_48394 ?auto_48395 ) ) ( not ( = ?auto_48394 ?auto_48396 ) ) ( not ( = ?auto_48395 ?auto_48396 ) ) ( ON ?auto_48396 ?auto_48398 ) ( not ( = ?auto_48393 ?auto_48398 ) ) ( not ( = ?auto_48394 ?auto_48398 ) ) ( not ( = ?auto_48395 ?auto_48398 ) ) ( not ( = ?auto_48396 ?auto_48398 ) ) ( ON ?auto_48395 ?auto_48396 ) ( ON-TABLE ?auto_48397 ) ( ON ?auto_48398 ?auto_48397 ) ( not ( = ?auto_48397 ?auto_48398 ) ) ( not ( = ?auto_48397 ?auto_48396 ) ) ( not ( = ?auto_48397 ?auto_48395 ) ) ( not ( = ?auto_48393 ?auto_48397 ) ) ( not ( = ?auto_48394 ?auto_48397 ) ) ( ON ?auto_48394 ?auto_48395 ) ( CLEAR ?auto_48394 ) ( HOLDING ?auto_48393 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48393 )
      ( MAKE-4PILE ?auto_48393 ?auto_48394 ?auto_48395 ?auto_48396 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48399 - BLOCK
      ?auto_48400 - BLOCK
      ?auto_48401 - BLOCK
      ?auto_48402 - BLOCK
    )
    :vars
    (
      ?auto_48403 - BLOCK
      ?auto_48404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48399 ?auto_48400 ) ) ( not ( = ?auto_48399 ?auto_48401 ) ) ( not ( = ?auto_48399 ?auto_48402 ) ) ( not ( = ?auto_48400 ?auto_48401 ) ) ( not ( = ?auto_48400 ?auto_48402 ) ) ( not ( = ?auto_48401 ?auto_48402 ) ) ( ON ?auto_48402 ?auto_48403 ) ( not ( = ?auto_48399 ?auto_48403 ) ) ( not ( = ?auto_48400 ?auto_48403 ) ) ( not ( = ?auto_48401 ?auto_48403 ) ) ( not ( = ?auto_48402 ?auto_48403 ) ) ( ON ?auto_48401 ?auto_48402 ) ( ON-TABLE ?auto_48404 ) ( ON ?auto_48403 ?auto_48404 ) ( not ( = ?auto_48404 ?auto_48403 ) ) ( not ( = ?auto_48404 ?auto_48402 ) ) ( not ( = ?auto_48404 ?auto_48401 ) ) ( not ( = ?auto_48399 ?auto_48404 ) ) ( not ( = ?auto_48400 ?auto_48404 ) ) ( ON ?auto_48400 ?auto_48401 ) ( ON ?auto_48399 ?auto_48400 ) ( CLEAR ?auto_48399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48404 ?auto_48403 ?auto_48402 ?auto_48401 ?auto_48400 )
      ( MAKE-4PILE ?auto_48399 ?auto_48400 ?auto_48401 ?auto_48402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48409 - BLOCK
      ?auto_48410 - BLOCK
      ?auto_48411 - BLOCK
      ?auto_48412 - BLOCK
    )
    :vars
    (
      ?auto_48413 - BLOCK
      ?auto_48414 - BLOCK
      ?auto_48415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48409 ?auto_48410 ) ) ( not ( = ?auto_48409 ?auto_48411 ) ) ( not ( = ?auto_48409 ?auto_48412 ) ) ( not ( = ?auto_48410 ?auto_48411 ) ) ( not ( = ?auto_48410 ?auto_48412 ) ) ( not ( = ?auto_48411 ?auto_48412 ) ) ( ON ?auto_48412 ?auto_48413 ) ( not ( = ?auto_48409 ?auto_48413 ) ) ( not ( = ?auto_48410 ?auto_48413 ) ) ( not ( = ?auto_48411 ?auto_48413 ) ) ( not ( = ?auto_48412 ?auto_48413 ) ) ( ON ?auto_48411 ?auto_48412 ) ( ON-TABLE ?auto_48414 ) ( ON ?auto_48413 ?auto_48414 ) ( not ( = ?auto_48414 ?auto_48413 ) ) ( not ( = ?auto_48414 ?auto_48412 ) ) ( not ( = ?auto_48414 ?auto_48411 ) ) ( not ( = ?auto_48409 ?auto_48414 ) ) ( not ( = ?auto_48410 ?auto_48414 ) ) ( ON ?auto_48410 ?auto_48411 ) ( CLEAR ?auto_48410 ) ( ON ?auto_48409 ?auto_48415 ) ( CLEAR ?auto_48409 ) ( HAND-EMPTY ) ( not ( = ?auto_48409 ?auto_48415 ) ) ( not ( = ?auto_48410 ?auto_48415 ) ) ( not ( = ?auto_48411 ?auto_48415 ) ) ( not ( = ?auto_48412 ?auto_48415 ) ) ( not ( = ?auto_48413 ?auto_48415 ) ) ( not ( = ?auto_48414 ?auto_48415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48409 ?auto_48415 )
      ( MAKE-4PILE ?auto_48409 ?auto_48410 ?auto_48411 ?auto_48412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48416 - BLOCK
      ?auto_48417 - BLOCK
      ?auto_48418 - BLOCK
      ?auto_48419 - BLOCK
    )
    :vars
    (
      ?auto_48421 - BLOCK
      ?auto_48422 - BLOCK
      ?auto_48420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48416 ?auto_48417 ) ) ( not ( = ?auto_48416 ?auto_48418 ) ) ( not ( = ?auto_48416 ?auto_48419 ) ) ( not ( = ?auto_48417 ?auto_48418 ) ) ( not ( = ?auto_48417 ?auto_48419 ) ) ( not ( = ?auto_48418 ?auto_48419 ) ) ( ON ?auto_48419 ?auto_48421 ) ( not ( = ?auto_48416 ?auto_48421 ) ) ( not ( = ?auto_48417 ?auto_48421 ) ) ( not ( = ?auto_48418 ?auto_48421 ) ) ( not ( = ?auto_48419 ?auto_48421 ) ) ( ON ?auto_48418 ?auto_48419 ) ( ON-TABLE ?auto_48422 ) ( ON ?auto_48421 ?auto_48422 ) ( not ( = ?auto_48422 ?auto_48421 ) ) ( not ( = ?auto_48422 ?auto_48419 ) ) ( not ( = ?auto_48422 ?auto_48418 ) ) ( not ( = ?auto_48416 ?auto_48422 ) ) ( not ( = ?auto_48417 ?auto_48422 ) ) ( ON ?auto_48416 ?auto_48420 ) ( CLEAR ?auto_48416 ) ( not ( = ?auto_48416 ?auto_48420 ) ) ( not ( = ?auto_48417 ?auto_48420 ) ) ( not ( = ?auto_48418 ?auto_48420 ) ) ( not ( = ?auto_48419 ?auto_48420 ) ) ( not ( = ?auto_48421 ?auto_48420 ) ) ( not ( = ?auto_48422 ?auto_48420 ) ) ( HOLDING ?auto_48417 ) ( CLEAR ?auto_48418 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48422 ?auto_48421 ?auto_48419 ?auto_48418 ?auto_48417 )
      ( MAKE-4PILE ?auto_48416 ?auto_48417 ?auto_48418 ?auto_48419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48423 - BLOCK
      ?auto_48424 - BLOCK
      ?auto_48425 - BLOCK
      ?auto_48426 - BLOCK
    )
    :vars
    (
      ?auto_48429 - BLOCK
      ?auto_48428 - BLOCK
      ?auto_48427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48423 ?auto_48424 ) ) ( not ( = ?auto_48423 ?auto_48425 ) ) ( not ( = ?auto_48423 ?auto_48426 ) ) ( not ( = ?auto_48424 ?auto_48425 ) ) ( not ( = ?auto_48424 ?auto_48426 ) ) ( not ( = ?auto_48425 ?auto_48426 ) ) ( ON ?auto_48426 ?auto_48429 ) ( not ( = ?auto_48423 ?auto_48429 ) ) ( not ( = ?auto_48424 ?auto_48429 ) ) ( not ( = ?auto_48425 ?auto_48429 ) ) ( not ( = ?auto_48426 ?auto_48429 ) ) ( ON ?auto_48425 ?auto_48426 ) ( ON-TABLE ?auto_48428 ) ( ON ?auto_48429 ?auto_48428 ) ( not ( = ?auto_48428 ?auto_48429 ) ) ( not ( = ?auto_48428 ?auto_48426 ) ) ( not ( = ?auto_48428 ?auto_48425 ) ) ( not ( = ?auto_48423 ?auto_48428 ) ) ( not ( = ?auto_48424 ?auto_48428 ) ) ( ON ?auto_48423 ?auto_48427 ) ( not ( = ?auto_48423 ?auto_48427 ) ) ( not ( = ?auto_48424 ?auto_48427 ) ) ( not ( = ?auto_48425 ?auto_48427 ) ) ( not ( = ?auto_48426 ?auto_48427 ) ) ( not ( = ?auto_48429 ?auto_48427 ) ) ( not ( = ?auto_48428 ?auto_48427 ) ) ( CLEAR ?auto_48425 ) ( ON ?auto_48424 ?auto_48423 ) ( CLEAR ?auto_48424 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48427 ?auto_48423 )
      ( MAKE-4PILE ?auto_48423 ?auto_48424 ?auto_48425 ?auto_48426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48430 - BLOCK
      ?auto_48431 - BLOCK
      ?auto_48432 - BLOCK
      ?auto_48433 - BLOCK
    )
    :vars
    (
      ?auto_48436 - BLOCK
      ?auto_48435 - BLOCK
      ?auto_48434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48430 ?auto_48431 ) ) ( not ( = ?auto_48430 ?auto_48432 ) ) ( not ( = ?auto_48430 ?auto_48433 ) ) ( not ( = ?auto_48431 ?auto_48432 ) ) ( not ( = ?auto_48431 ?auto_48433 ) ) ( not ( = ?auto_48432 ?auto_48433 ) ) ( ON ?auto_48433 ?auto_48436 ) ( not ( = ?auto_48430 ?auto_48436 ) ) ( not ( = ?auto_48431 ?auto_48436 ) ) ( not ( = ?auto_48432 ?auto_48436 ) ) ( not ( = ?auto_48433 ?auto_48436 ) ) ( ON-TABLE ?auto_48435 ) ( ON ?auto_48436 ?auto_48435 ) ( not ( = ?auto_48435 ?auto_48436 ) ) ( not ( = ?auto_48435 ?auto_48433 ) ) ( not ( = ?auto_48435 ?auto_48432 ) ) ( not ( = ?auto_48430 ?auto_48435 ) ) ( not ( = ?auto_48431 ?auto_48435 ) ) ( ON ?auto_48430 ?auto_48434 ) ( not ( = ?auto_48430 ?auto_48434 ) ) ( not ( = ?auto_48431 ?auto_48434 ) ) ( not ( = ?auto_48432 ?auto_48434 ) ) ( not ( = ?auto_48433 ?auto_48434 ) ) ( not ( = ?auto_48436 ?auto_48434 ) ) ( not ( = ?auto_48435 ?auto_48434 ) ) ( ON ?auto_48431 ?auto_48430 ) ( CLEAR ?auto_48431 ) ( ON-TABLE ?auto_48434 ) ( HOLDING ?auto_48432 ) ( CLEAR ?auto_48433 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48435 ?auto_48436 ?auto_48433 ?auto_48432 )
      ( MAKE-4PILE ?auto_48430 ?auto_48431 ?auto_48432 ?auto_48433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48437 - BLOCK
      ?auto_48438 - BLOCK
      ?auto_48439 - BLOCK
      ?auto_48440 - BLOCK
    )
    :vars
    (
      ?auto_48443 - BLOCK
      ?auto_48441 - BLOCK
      ?auto_48442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48437 ?auto_48438 ) ) ( not ( = ?auto_48437 ?auto_48439 ) ) ( not ( = ?auto_48437 ?auto_48440 ) ) ( not ( = ?auto_48438 ?auto_48439 ) ) ( not ( = ?auto_48438 ?auto_48440 ) ) ( not ( = ?auto_48439 ?auto_48440 ) ) ( ON ?auto_48440 ?auto_48443 ) ( not ( = ?auto_48437 ?auto_48443 ) ) ( not ( = ?auto_48438 ?auto_48443 ) ) ( not ( = ?auto_48439 ?auto_48443 ) ) ( not ( = ?auto_48440 ?auto_48443 ) ) ( ON-TABLE ?auto_48441 ) ( ON ?auto_48443 ?auto_48441 ) ( not ( = ?auto_48441 ?auto_48443 ) ) ( not ( = ?auto_48441 ?auto_48440 ) ) ( not ( = ?auto_48441 ?auto_48439 ) ) ( not ( = ?auto_48437 ?auto_48441 ) ) ( not ( = ?auto_48438 ?auto_48441 ) ) ( ON ?auto_48437 ?auto_48442 ) ( not ( = ?auto_48437 ?auto_48442 ) ) ( not ( = ?auto_48438 ?auto_48442 ) ) ( not ( = ?auto_48439 ?auto_48442 ) ) ( not ( = ?auto_48440 ?auto_48442 ) ) ( not ( = ?auto_48443 ?auto_48442 ) ) ( not ( = ?auto_48441 ?auto_48442 ) ) ( ON ?auto_48438 ?auto_48437 ) ( ON-TABLE ?auto_48442 ) ( CLEAR ?auto_48440 ) ( ON ?auto_48439 ?auto_48438 ) ( CLEAR ?auto_48439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48442 ?auto_48437 ?auto_48438 )
      ( MAKE-4PILE ?auto_48437 ?auto_48438 ?auto_48439 ?auto_48440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48444 - BLOCK
      ?auto_48445 - BLOCK
      ?auto_48446 - BLOCK
      ?auto_48447 - BLOCK
    )
    :vars
    (
      ?auto_48450 - BLOCK
      ?auto_48448 - BLOCK
      ?auto_48449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48444 ?auto_48445 ) ) ( not ( = ?auto_48444 ?auto_48446 ) ) ( not ( = ?auto_48444 ?auto_48447 ) ) ( not ( = ?auto_48445 ?auto_48446 ) ) ( not ( = ?auto_48445 ?auto_48447 ) ) ( not ( = ?auto_48446 ?auto_48447 ) ) ( not ( = ?auto_48444 ?auto_48450 ) ) ( not ( = ?auto_48445 ?auto_48450 ) ) ( not ( = ?auto_48446 ?auto_48450 ) ) ( not ( = ?auto_48447 ?auto_48450 ) ) ( ON-TABLE ?auto_48448 ) ( ON ?auto_48450 ?auto_48448 ) ( not ( = ?auto_48448 ?auto_48450 ) ) ( not ( = ?auto_48448 ?auto_48447 ) ) ( not ( = ?auto_48448 ?auto_48446 ) ) ( not ( = ?auto_48444 ?auto_48448 ) ) ( not ( = ?auto_48445 ?auto_48448 ) ) ( ON ?auto_48444 ?auto_48449 ) ( not ( = ?auto_48444 ?auto_48449 ) ) ( not ( = ?auto_48445 ?auto_48449 ) ) ( not ( = ?auto_48446 ?auto_48449 ) ) ( not ( = ?auto_48447 ?auto_48449 ) ) ( not ( = ?auto_48450 ?auto_48449 ) ) ( not ( = ?auto_48448 ?auto_48449 ) ) ( ON ?auto_48445 ?auto_48444 ) ( ON-TABLE ?auto_48449 ) ( ON ?auto_48446 ?auto_48445 ) ( CLEAR ?auto_48446 ) ( HOLDING ?auto_48447 ) ( CLEAR ?auto_48450 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48448 ?auto_48450 ?auto_48447 )
      ( MAKE-4PILE ?auto_48444 ?auto_48445 ?auto_48446 ?auto_48447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48451 - BLOCK
      ?auto_48452 - BLOCK
      ?auto_48453 - BLOCK
      ?auto_48454 - BLOCK
    )
    :vars
    (
      ?auto_48456 - BLOCK
      ?auto_48455 - BLOCK
      ?auto_48457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48451 ?auto_48452 ) ) ( not ( = ?auto_48451 ?auto_48453 ) ) ( not ( = ?auto_48451 ?auto_48454 ) ) ( not ( = ?auto_48452 ?auto_48453 ) ) ( not ( = ?auto_48452 ?auto_48454 ) ) ( not ( = ?auto_48453 ?auto_48454 ) ) ( not ( = ?auto_48451 ?auto_48456 ) ) ( not ( = ?auto_48452 ?auto_48456 ) ) ( not ( = ?auto_48453 ?auto_48456 ) ) ( not ( = ?auto_48454 ?auto_48456 ) ) ( ON-TABLE ?auto_48455 ) ( ON ?auto_48456 ?auto_48455 ) ( not ( = ?auto_48455 ?auto_48456 ) ) ( not ( = ?auto_48455 ?auto_48454 ) ) ( not ( = ?auto_48455 ?auto_48453 ) ) ( not ( = ?auto_48451 ?auto_48455 ) ) ( not ( = ?auto_48452 ?auto_48455 ) ) ( ON ?auto_48451 ?auto_48457 ) ( not ( = ?auto_48451 ?auto_48457 ) ) ( not ( = ?auto_48452 ?auto_48457 ) ) ( not ( = ?auto_48453 ?auto_48457 ) ) ( not ( = ?auto_48454 ?auto_48457 ) ) ( not ( = ?auto_48456 ?auto_48457 ) ) ( not ( = ?auto_48455 ?auto_48457 ) ) ( ON ?auto_48452 ?auto_48451 ) ( ON-TABLE ?auto_48457 ) ( ON ?auto_48453 ?auto_48452 ) ( CLEAR ?auto_48456 ) ( ON ?auto_48454 ?auto_48453 ) ( CLEAR ?auto_48454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48457 ?auto_48451 ?auto_48452 ?auto_48453 )
      ( MAKE-4PILE ?auto_48451 ?auto_48452 ?auto_48453 ?auto_48454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48458 - BLOCK
      ?auto_48459 - BLOCK
      ?auto_48460 - BLOCK
      ?auto_48461 - BLOCK
    )
    :vars
    (
      ?auto_48463 - BLOCK
      ?auto_48464 - BLOCK
      ?auto_48462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48458 ?auto_48459 ) ) ( not ( = ?auto_48458 ?auto_48460 ) ) ( not ( = ?auto_48458 ?auto_48461 ) ) ( not ( = ?auto_48459 ?auto_48460 ) ) ( not ( = ?auto_48459 ?auto_48461 ) ) ( not ( = ?auto_48460 ?auto_48461 ) ) ( not ( = ?auto_48458 ?auto_48463 ) ) ( not ( = ?auto_48459 ?auto_48463 ) ) ( not ( = ?auto_48460 ?auto_48463 ) ) ( not ( = ?auto_48461 ?auto_48463 ) ) ( ON-TABLE ?auto_48464 ) ( not ( = ?auto_48464 ?auto_48463 ) ) ( not ( = ?auto_48464 ?auto_48461 ) ) ( not ( = ?auto_48464 ?auto_48460 ) ) ( not ( = ?auto_48458 ?auto_48464 ) ) ( not ( = ?auto_48459 ?auto_48464 ) ) ( ON ?auto_48458 ?auto_48462 ) ( not ( = ?auto_48458 ?auto_48462 ) ) ( not ( = ?auto_48459 ?auto_48462 ) ) ( not ( = ?auto_48460 ?auto_48462 ) ) ( not ( = ?auto_48461 ?auto_48462 ) ) ( not ( = ?auto_48463 ?auto_48462 ) ) ( not ( = ?auto_48464 ?auto_48462 ) ) ( ON ?auto_48459 ?auto_48458 ) ( ON-TABLE ?auto_48462 ) ( ON ?auto_48460 ?auto_48459 ) ( ON ?auto_48461 ?auto_48460 ) ( CLEAR ?auto_48461 ) ( HOLDING ?auto_48463 ) ( CLEAR ?auto_48464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48464 ?auto_48463 )
      ( MAKE-4PILE ?auto_48458 ?auto_48459 ?auto_48460 ?auto_48461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48465 - BLOCK
      ?auto_48466 - BLOCK
      ?auto_48467 - BLOCK
      ?auto_48468 - BLOCK
    )
    :vars
    (
      ?auto_48471 - BLOCK
      ?auto_48470 - BLOCK
      ?auto_48469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48465 ?auto_48466 ) ) ( not ( = ?auto_48465 ?auto_48467 ) ) ( not ( = ?auto_48465 ?auto_48468 ) ) ( not ( = ?auto_48466 ?auto_48467 ) ) ( not ( = ?auto_48466 ?auto_48468 ) ) ( not ( = ?auto_48467 ?auto_48468 ) ) ( not ( = ?auto_48465 ?auto_48471 ) ) ( not ( = ?auto_48466 ?auto_48471 ) ) ( not ( = ?auto_48467 ?auto_48471 ) ) ( not ( = ?auto_48468 ?auto_48471 ) ) ( ON-TABLE ?auto_48470 ) ( not ( = ?auto_48470 ?auto_48471 ) ) ( not ( = ?auto_48470 ?auto_48468 ) ) ( not ( = ?auto_48470 ?auto_48467 ) ) ( not ( = ?auto_48465 ?auto_48470 ) ) ( not ( = ?auto_48466 ?auto_48470 ) ) ( ON ?auto_48465 ?auto_48469 ) ( not ( = ?auto_48465 ?auto_48469 ) ) ( not ( = ?auto_48466 ?auto_48469 ) ) ( not ( = ?auto_48467 ?auto_48469 ) ) ( not ( = ?auto_48468 ?auto_48469 ) ) ( not ( = ?auto_48471 ?auto_48469 ) ) ( not ( = ?auto_48470 ?auto_48469 ) ) ( ON ?auto_48466 ?auto_48465 ) ( ON-TABLE ?auto_48469 ) ( ON ?auto_48467 ?auto_48466 ) ( ON ?auto_48468 ?auto_48467 ) ( CLEAR ?auto_48470 ) ( ON ?auto_48471 ?auto_48468 ) ( CLEAR ?auto_48471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48469 ?auto_48465 ?auto_48466 ?auto_48467 ?auto_48468 )
      ( MAKE-4PILE ?auto_48465 ?auto_48466 ?auto_48467 ?auto_48468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48472 - BLOCK
      ?auto_48473 - BLOCK
      ?auto_48474 - BLOCK
      ?auto_48475 - BLOCK
    )
    :vars
    (
      ?auto_48478 - BLOCK
      ?auto_48476 - BLOCK
      ?auto_48477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48472 ?auto_48473 ) ) ( not ( = ?auto_48472 ?auto_48474 ) ) ( not ( = ?auto_48472 ?auto_48475 ) ) ( not ( = ?auto_48473 ?auto_48474 ) ) ( not ( = ?auto_48473 ?auto_48475 ) ) ( not ( = ?auto_48474 ?auto_48475 ) ) ( not ( = ?auto_48472 ?auto_48478 ) ) ( not ( = ?auto_48473 ?auto_48478 ) ) ( not ( = ?auto_48474 ?auto_48478 ) ) ( not ( = ?auto_48475 ?auto_48478 ) ) ( not ( = ?auto_48476 ?auto_48478 ) ) ( not ( = ?auto_48476 ?auto_48475 ) ) ( not ( = ?auto_48476 ?auto_48474 ) ) ( not ( = ?auto_48472 ?auto_48476 ) ) ( not ( = ?auto_48473 ?auto_48476 ) ) ( ON ?auto_48472 ?auto_48477 ) ( not ( = ?auto_48472 ?auto_48477 ) ) ( not ( = ?auto_48473 ?auto_48477 ) ) ( not ( = ?auto_48474 ?auto_48477 ) ) ( not ( = ?auto_48475 ?auto_48477 ) ) ( not ( = ?auto_48478 ?auto_48477 ) ) ( not ( = ?auto_48476 ?auto_48477 ) ) ( ON ?auto_48473 ?auto_48472 ) ( ON-TABLE ?auto_48477 ) ( ON ?auto_48474 ?auto_48473 ) ( ON ?auto_48475 ?auto_48474 ) ( ON ?auto_48478 ?auto_48475 ) ( CLEAR ?auto_48478 ) ( HOLDING ?auto_48476 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48476 )
      ( MAKE-4PILE ?auto_48472 ?auto_48473 ?auto_48474 ?auto_48475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48479 - BLOCK
      ?auto_48480 - BLOCK
      ?auto_48481 - BLOCK
      ?auto_48482 - BLOCK
    )
    :vars
    (
      ?auto_48485 - BLOCK
      ?auto_48484 - BLOCK
      ?auto_48483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48479 ?auto_48480 ) ) ( not ( = ?auto_48479 ?auto_48481 ) ) ( not ( = ?auto_48479 ?auto_48482 ) ) ( not ( = ?auto_48480 ?auto_48481 ) ) ( not ( = ?auto_48480 ?auto_48482 ) ) ( not ( = ?auto_48481 ?auto_48482 ) ) ( not ( = ?auto_48479 ?auto_48485 ) ) ( not ( = ?auto_48480 ?auto_48485 ) ) ( not ( = ?auto_48481 ?auto_48485 ) ) ( not ( = ?auto_48482 ?auto_48485 ) ) ( not ( = ?auto_48484 ?auto_48485 ) ) ( not ( = ?auto_48484 ?auto_48482 ) ) ( not ( = ?auto_48484 ?auto_48481 ) ) ( not ( = ?auto_48479 ?auto_48484 ) ) ( not ( = ?auto_48480 ?auto_48484 ) ) ( ON ?auto_48479 ?auto_48483 ) ( not ( = ?auto_48479 ?auto_48483 ) ) ( not ( = ?auto_48480 ?auto_48483 ) ) ( not ( = ?auto_48481 ?auto_48483 ) ) ( not ( = ?auto_48482 ?auto_48483 ) ) ( not ( = ?auto_48485 ?auto_48483 ) ) ( not ( = ?auto_48484 ?auto_48483 ) ) ( ON ?auto_48480 ?auto_48479 ) ( ON-TABLE ?auto_48483 ) ( ON ?auto_48481 ?auto_48480 ) ( ON ?auto_48482 ?auto_48481 ) ( ON ?auto_48485 ?auto_48482 ) ( ON ?auto_48484 ?auto_48485 ) ( CLEAR ?auto_48484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48483 ?auto_48479 ?auto_48480 ?auto_48481 ?auto_48482 ?auto_48485 )
      ( MAKE-4PILE ?auto_48479 ?auto_48480 ?auto_48481 ?auto_48482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48497 - BLOCK
    )
    :vars
    (
      ?auto_48499 - BLOCK
      ?auto_48498 - BLOCK
      ?auto_48500 - BLOCK
      ?auto_48501 - BLOCK
      ?auto_48502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48499 ?auto_48497 ) ( ON-TABLE ?auto_48497 ) ( not ( = ?auto_48497 ?auto_48499 ) ) ( not ( = ?auto_48497 ?auto_48498 ) ) ( not ( = ?auto_48497 ?auto_48500 ) ) ( not ( = ?auto_48499 ?auto_48498 ) ) ( not ( = ?auto_48499 ?auto_48500 ) ) ( not ( = ?auto_48498 ?auto_48500 ) ) ( ON ?auto_48498 ?auto_48499 ) ( CLEAR ?auto_48498 ) ( HOLDING ?auto_48500 ) ( CLEAR ?auto_48501 ) ( ON-TABLE ?auto_48502 ) ( ON ?auto_48501 ?auto_48502 ) ( not ( = ?auto_48502 ?auto_48501 ) ) ( not ( = ?auto_48502 ?auto_48500 ) ) ( not ( = ?auto_48501 ?auto_48500 ) ) ( not ( = ?auto_48497 ?auto_48501 ) ) ( not ( = ?auto_48497 ?auto_48502 ) ) ( not ( = ?auto_48499 ?auto_48501 ) ) ( not ( = ?auto_48499 ?auto_48502 ) ) ( not ( = ?auto_48498 ?auto_48501 ) ) ( not ( = ?auto_48498 ?auto_48502 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48502 ?auto_48501 ?auto_48500 )
      ( MAKE-1PILE ?auto_48497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48503 - BLOCK
    )
    :vars
    (
      ?auto_48505 - BLOCK
      ?auto_48504 - BLOCK
      ?auto_48506 - BLOCK
      ?auto_48507 - BLOCK
      ?auto_48508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48505 ?auto_48503 ) ( ON-TABLE ?auto_48503 ) ( not ( = ?auto_48503 ?auto_48505 ) ) ( not ( = ?auto_48503 ?auto_48504 ) ) ( not ( = ?auto_48503 ?auto_48506 ) ) ( not ( = ?auto_48505 ?auto_48504 ) ) ( not ( = ?auto_48505 ?auto_48506 ) ) ( not ( = ?auto_48504 ?auto_48506 ) ) ( ON ?auto_48504 ?auto_48505 ) ( CLEAR ?auto_48507 ) ( ON-TABLE ?auto_48508 ) ( ON ?auto_48507 ?auto_48508 ) ( not ( = ?auto_48508 ?auto_48507 ) ) ( not ( = ?auto_48508 ?auto_48506 ) ) ( not ( = ?auto_48507 ?auto_48506 ) ) ( not ( = ?auto_48503 ?auto_48507 ) ) ( not ( = ?auto_48503 ?auto_48508 ) ) ( not ( = ?auto_48505 ?auto_48507 ) ) ( not ( = ?auto_48505 ?auto_48508 ) ) ( not ( = ?auto_48504 ?auto_48507 ) ) ( not ( = ?auto_48504 ?auto_48508 ) ) ( ON ?auto_48506 ?auto_48504 ) ( CLEAR ?auto_48506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48503 ?auto_48505 ?auto_48504 )
      ( MAKE-1PILE ?auto_48503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48509 - BLOCK
    )
    :vars
    (
      ?auto_48510 - BLOCK
      ?auto_48511 - BLOCK
      ?auto_48512 - BLOCK
      ?auto_48514 - BLOCK
      ?auto_48513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48510 ?auto_48509 ) ( ON-TABLE ?auto_48509 ) ( not ( = ?auto_48509 ?auto_48510 ) ) ( not ( = ?auto_48509 ?auto_48511 ) ) ( not ( = ?auto_48509 ?auto_48512 ) ) ( not ( = ?auto_48510 ?auto_48511 ) ) ( not ( = ?auto_48510 ?auto_48512 ) ) ( not ( = ?auto_48511 ?auto_48512 ) ) ( ON ?auto_48511 ?auto_48510 ) ( ON-TABLE ?auto_48514 ) ( not ( = ?auto_48514 ?auto_48513 ) ) ( not ( = ?auto_48514 ?auto_48512 ) ) ( not ( = ?auto_48513 ?auto_48512 ) ) ( not ( = ?auto_48509 ?auto_48513 ) ) ( not ( = ?auto_48509 ?auto_48514 ) ) ( not ( = ?auto_48510 ?auto_48513 ) ) ( not ( = ?auto_48510 ?auto_48514 ) ) ( not ( = ?auto_48511 ?auto_48513 ) ) ( not ( = ?auto_48511 ?auto_48514 ) ) ( ON ?auto_48512 ?auto_48511 ) ( CLEAR ?auto_48512 ) ( HOLDING ?auto_48513 ) ( CLEAR ?auto_48514 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48514 ?auto_48513 )
      ( MAKE-1PILE ?auto_48509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48515 - BLOCK
    )
    :vars
    (
      ?auto_48518 - BLOCK
      ?auto_48520 - BLOCK
      ?auto_48517 - BLOCK
      ?auto_48519 - BLOCK
      ?auto_48516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48518 ?auto_48515 ) ( ON-TABLE ?auto_48515 ) ( not ( = ?auto_48515 ?auto_48518 ) ) ( not ( = ?auto_48515 ?auto_48520 ) ) ( not ( = ?auto_48515 ?auto_48517 ) ) ( not ( = ?auto_48518 ?auto_48520 ) ) ( not ( = ?auto_48518 ?auto_48517 ) ) ( not ( = ?auto_48520 ?auto_48517 ) ) ( ON ?auto_48520 ?auto_48518 ) ( ON-TABLE ?auto_48519 ) ( not ( = ?auto_48519 ?auto_48516 ) ) ( not ( = ?auto_48519 ?auto_48517 ) ) ( not ( = ?auto_48516 ?auto_48517 ) ) ( not ( = ?auto_48515 ?auto_48516 ) ) ( not ( = ?auto_48515 ?auto_48519 ) ) ( not ( = ?auto_48518 ?auto_48516 ) ) ( not ( = ?auto_48518 ?auto_48519 ) ) ( not ( = ?auto_48520 ?auto_48516 ) ) ( not ( = ?auto_48520 ?auto_48519 ) ) ( ON ?auto_48517 ?auto_48520 ) ( CLEAR ?auto_48519 ) ( ON ?auto_48516 ?auto_48517 ) ( CLEAR ?auto_48516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48515 ?auto_48518 ?auto_48520 ?auto_48517 )
      ( MAKE-1PILE ?auto_48515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48521 - BLOCK
    )
    :vars
    (
      ?auto_48524 - BLOCK
      ?auto_48523 - BLOCK
      ?auto_48522 - BLOCK
      ?auto_48526 - BLOCK
      ?auto_48525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48524 ?auto_48521 ) ( ON-TABLE ?auto_48521 ) ( not ( = ?auto_48521 ?auto_48524 ) ) ( not ( = ?auto_48521 ?auto_48523 ) ) ( not ( = ?auto_48521 ?auto_48522 ) ) ( not ( = ?auto_48524 ?auto_48523 ) ) ( not ( = ?auto_48524 ?auto_48522 ) ) ( not ( = ?auto_48523 ?auto_48522 ) ) ( ON ?auto_48523 ?auto_48524 ) ( not ( = ?auto_48526 ?auto_48525 ) ) ( not ( = ?auto_48526 ?auto_48522 ) ) ( not ( = ?auto_48525 ?auto_48522 ) ) ( not ( = ?auto_48521 ?auto_48525 ) ) ( not ( = ?auto_48521 ?auto_48526 ) ) ( not ( = ?auto_48524 ?auto_48525 ) ) ( not ( = ?auto_48524 ?auto_48526 ) ) ( not ( = ?auto_48523 ?auto_48525 ) ) ( not ( = ?auto_48523 ?auto_48526 ) ) ( ON ?auto_48522 ?auto_48523 ) ( ON ?auto_48525 ?auto_48522 ) ( CLEAR ?auto_48525 ) ( HOLDING ?auto_48526 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48526 )
      ( MAKE-1PILE ?auto_48521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48534 - BLOCK
    )
    :vars
    (
      ?auto_48539 - BLOCK
      ?auto_48538 - BLOCK
      ?auto_48537 - BLOCK
      ?auto_48536 - BLOCK
      ?auto_48535 - BLOCK
      ?auto_48540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48539 ?auto_48534 ) ( ON-TABLE ?auto_48534 ) ( not ( = ?auto_48534 ?auto_48539 ) ) ( not ( = ?auto_48534 ?auto_48538 ) ) ( not ( = ?auto_48534 ?auto_48537 ) ) ( not ( = ?auto_48539 ?auto_48538 ) ) ( not ( = ?auto_48539 ?auto_48537 ) ) ( not ( = ?auto_48538 ?auto_48537 ) ) ( ON ?auto_48538 ?auto_48539 ) ( not ( = ?auto_48536 ?auto_48535 ) ) ( not ( = ?auto_48536 ?auto_48537 ) ) ( not ( = ?auto_48535 ?auto_48537 ) ) ( not ( = ?auto_48534 ?auto_48535 ) ) ( not ( = ?auto_48534 ?auto_48536 ) ) ( not ( = ?auto_48539 ?auto_48535 ) ) ( not ( = ?auto_48539 ?auto_48536 ) ) ( not ( = ?auto_48538 ?auto_48535 ) ) ( not ( = ?auto_48538 ?auto_48536 ) ) ( ON ?auto_48537 ?auto_48538 ) ( ON ?auto_48535 ?auto_48537 ) ( CLEAR ?auto_48535 ) ( ON ?auto_48536 ?auto_48540 ) ( CLEAR ?auto_48536 ) ( HAND-EMPTY ) ( not ( = ?auto_48534 ?auto_48540 ) ) ( not ( = ?auto_48539 ?auto_48540 ) ) ( not ( = ?auto_48538 ?auto_48540 ) ) ( not ( = ?auto_48537 ?auto_48540 ) ) ( not ( = ?auto_48536 ?auto_48540 ) ) ( not ( = ?auto_48535 ?auto_48540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48536 ?auto_48540 )
      ( MAKE-1PILE ?auto_48534 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48541 - BLOCK
    )
    :vars
    (
      ?auto_48545 - BLOCK
      ?auto_48547 - BLOCK
      ?auto_48544 - BLOCK
      ?auto_48546 - BLOCK
      ?auto_48543 - BLOCK
      ?auto_48542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48545 ?auto_48541 ) ( ON-TABLE ?auto_48541 ) ( not ( = ?auto_48541 ?auto_48545 ) ) ( not ( = ?auto_48541 ?auto_48547 ) ) ( not ( = ?auto_48541 ?auto_48544 ) ) ( not ( = ?auto_48545 ?auto_48547 ) ) ( not ( = ?auto_48545 ?auto_48544 ) ) ( not ( = ?auto_48547 ?auto_48544 ) ) ( ON ?auto_48547 ?auto_48545 ) ( not ( = ?auto_48546 ?auto_48543 ) ) ( not ( = ?auto_48546 ?auto_48544 ) ) ( not ( = ?auto_48543 ?auto_48544 ) ) ( not ( = ?auto_48541 ?auto_48543 ) ) ( not ( = ?auto_48541 ?auto_48546 ) ) ( not ( = ?auto_48545 ?auto_48543 ) ) ( not ( = ?auto_48545 ?auto_48546 ) ) ( not ( = ?auto_48547 ?auto_48543 ) ) ( not ( = ?auto_48547 ?auto_48546 ) ) ( ON ?auto_48544 ?auto_48547 ) ( ON ?auto_48546 ?auto_48542 ) ( CLEAR ?auto_48546 ) ( not ( = ?auto_48541 ?auto_48542 ) ) ( not ( = ?auto_48545 ?auto_48542 ) ) ( not ( = ?auto_48547 ?auto_48542 ) ) ( not ( = ?auto_48544 ?auto_48542 ) ) ( not ( = ?auto_48546 ?auto_48542 ) ) ( not ( = ?auto_48543 ?auto_48542 ) ) ( HOLDING ?auto_48543 ) ( CLEAR ?auto_48544 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48541 ?auto_48545 ?auto_48547 ?auto_48544 ?auto_48543 )
      ( MAKE-1PILE ?auto_48541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48548 - BLOCK
    )
    :vars
    (
      ?auto_48551 - BLOCK
      ?auto_48550 - BLOCK
      ?auto_48549 - BLOCK
      ?auto_48554 - BLOCK
      ?auto_48553 - BLOCK
      ?auto_48552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48551 ?auto_48548 ) ( ON-TABLE ?auto_48548 ) ( not ( = ?auto_48548 ?auto_48551 ) ) ( not ( = ?auto_48548 ?auto_48550 ) ) ( not ( = ?auto_48548 ?auto_48549 ) ) ( not ( = ?auto_48551 ?auto_48550 ) ) ( not ( = ?auto_48551 ?auto_48549 ) ) ( not ( = ?auto_48550 ?auto_48549 ) ) ( ON ?auto_48550 ?auto_48551 ) ( not ( = ?auto_48554 ?auto_48553 ) ) ( not ( = ?auto_48554 ?auto_48549 ) ) ( not ( = ?auto_48553 ?auto_48549 ) ) ( not ( = ?auto_48548 ?auto_48553 ) ) ( not ( = ?auto_48548 ?auto_48554 ) ) ( not ( = ?auto_48551 ?auto_48553 ) ) ( not ( = ?auto_48551 ?auto_48554 ) ) ( not ( = ?auto_48550 ?auto_48553 ) ) ( not ( = ?auto_48550 ?auto_48554 ) ) ( ON ?auto_48549 ?auto_48550 ) ( ON ?auto_48554 ?auto_48552 ) ( not ( = ?auto_48548 ?auto_48552 ) ) ( not ( = ?auto_48551 ?auto_48552 ) ) ( not ( = ?auto_48550 ?auto_48552 ) ) ( not ( = ?auto_48549 ?auto_48552 ) ) ( not ( = ?auto_48554 ?auto_48552 ) ) ( not ( = ?auto_48553 ?auto_48552 ) ) ( CLEAR ?auto_48549 ) ( ON ?auto_48553 ?auto_48554 ) ( CLEAR ?auto_48553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48552 ?auto_48554 )
      ( MAKE-1PILE ?auto_48548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48588 - BLOCK
      ?auto_48589 - BLOCK
      ?auto_48590 - BLOCK
      ?auto_48591 - BLOCK
      ?auto_48592 - BLOCK
    )
    :vars
    (
      ?auto_48593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48588 ) ( ON ?auto_48589 ?auto_48588 ) ( ON ?auto_48590 ?auto_48589 ) ( not ( = ?auto_48588 ?auto_48589 ) ) ( not ( = ?auto_48588 ?auto_48590 ) ) ( not ( = ?auto_48588 ?auto_48591 ) ) ( not ( = ?auto_48588 ?auto_48592 ) ) ( not ( = ?auto_48589 ?auto_48590 ) ) ( not ( = ?auto_48589 ?auto_48591 ) ) ( not ( = ?auto_48589 ?auto_48592 ) ) ( not ( = ?auto_48590 ?auto_48591 ) ) ( not ( = ?auto_48590 ?auto_48592 ) ) ( not ( = ?auto_48591 ?auto_48592 ) ) ( ON ?auto_48592 ?auto_48593 ) ( not ( = ?auto_48588 ?auto_48593 ) ) ( not ( = ?auto_48589 ?auto_48593 ) ) ( not ( = ?auto_48590 ?auto_48593 ) ) ( not ( = ?auto_48591 ?auto_48593 ) ) ( not ( = ?auto_48592 ?auto_48593 ) ) ( CLEAR ?auto_48590 ) ( ON ?auto_48591 ?auto_48592 ) ( CLEAR ?auto_48591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48593 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48593 ?auto_48592 )
      ( MAKE-5PILE ?auto_48588 ?auto_48589 ?auto_48590 ?auto_48591 ?auto_48592 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48594 - BLOCK
      ?auto_48595 - BLOCK
      ?auto_48596 - BLOCK
      ?auto_48597 - BLOCK
      ?auto_48598 - BLOCK
    )
    :vars
    (
      ?auto_48599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48594 ) ( ON ?auto_48595 ?auto_48594 ) ( not ( = ?auto_48594 ?auto_48595 ) ) ( not ( = ?auto_48594 ?auto_48596 ) ) ( not ( = ?auto_48594 ?auto_48597 ) ) ( not ( = ?auto_48594 ?auto_48598 ) ) ( not ( = ?auto_48595 ?auto_48596 ) ) ( not ( = ?auto_48595 ?auto_48597 ) ) ( not ( = ?auto_48595 ?auto_48598 ) ) ( not ( = ?auto_48596 ?auto_48597 ) ) ( not ( = ?auto_48596 ?auto_48598 ) ) ( not ( = ?auto_48597 ?auto_48598 ) ) ( ON ?auto_48598 ?auto_48599 ) ( not ( = ?auto_48594 ?auto_48599 ) ) ( not ( = ?auto_48595 ?auto_48599 ) ) ( not ( = ?auto_48596 ?auto_48599 ) ) ( not ( = ?auto_48597 ?auto_48599 ) ) ( not ( = ?auto_48598 ?auto_48599 ) ) ( ON ?auto_48597 ?auto_48598 ) ( CLEAR ?auto_48597 ) ( ON-TABLE ?auto_48599 ) ( HOLDING ?auto_48596 ) ( CLEAR ?auto_48595 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48594 ?auto_48595 ?auto_48596 )
      ( MAKE-5PILE ?auto_48594 ?auto_48595 ?auto_48596 ?auto_48597 ?auto_48598 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48600 - BLOCK
      ?auto_48601 - BLOCK
      ?auto_48602 - BLOCK
      ?auto_48603 - BLOCK
      ?auto_48604 - BLOCK
    )
    :vars
    (
      ?auto_48605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48600 ) ( ON ?auto_48601 ?auto_48600 ) ( not ( = ?auto_48600 ?auto_48601 ) ) ( not ( = ?auto_48600 ?auto_48602 ) ) ( not ( = ?auto_48600 ?auto_48603 ) ) ( not ( = ?auto_48600 ?auto_48604 ) ) ( not ( = ?auto_48601 ?auto_48602 ) ) ( not ( = ?auto_48601 ?auto_48603 ) ) ( not ( = ?auto_48601 ?auto_48604 ) ) ( not ( = ?auto_48602 ?auto_48603 ) ) ( not ( = ?auto_48602 ?auto_48604 ) ) ( not ( = ?auto_48603 ?auto_48604 ) ) ( ON ?auto_48604 ?auto_48605 ) ( not ( = ?auto_48600 ?auto_48605 ) ) ( not ( = ?auto_48601 ?auto_48605 ) ) ( not ( = ?auto_48602 ?auto_48605 ) ) ( not ( = ?auto_48603 ?auto_48605 ) ) ( not ( = ?auto_48604 ?auto_48605 ) ) ( ON ?auto_48603 ?auto_48604 ) ( ON-TABLE ?auto_48605 ) ( CLEAR ?auto_48601 ) ( ON ?auto_48602 ?auto_48603 ) ( CLEAR ?auto_48602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48605 ?auto_48604 ?auto_48603 )
      ( MAKE-5PILE ?auto_48600 ?auto_48601 ?auto_48602 ?auto_48603 ?auto_48604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48606 - BLOCK
      ?auto_48607 - BLOCK
      ?auto_48608 - BLOCK
      ?auto_48609 - BLOCK
      ?auto_48610 - BLOCK
    )
    :vars
    (
      ?auto_48611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48606 ) ( not ( = ?auto_48606 ?auto_48607 ) ) ( not ( = ?auto_48606 ?auto_48608 ) ) ( not ( = ?auto_48606 ?auto_48609 ) ) ( not ( = ?auto_48606 ?auto_48610 ) ) ( not ( = ?auto_48607 ?auto_48608 ) ) ( not ( = ?auto_48607 ?auto_48609 ) ) ( not ( = ?auto_48607 ?auto_48610 ) ) ( not ( = ?auto_48608 ?auto_48609 ) ) ( not ( = ?auto_48608 ?auto_48610 ) ) ( not ( = ?auto_48609 ?auto_48610 ) ) ( ON ?auto_48610 ?auto_48611 ) ( not ( = ?auto_48606 ?auto_48611 ) ) ( not ( = ?auto_48607 ?auto_48611 ) ) ( not ( = ?auto_48608 ?auto_48611 ) ) ( not ( = ?auto_48609 ?auto_48611 ) ) ( not ( = ?auto_48610 ?auto_48611 ) ) ( ON ?auto_48609 ?auto_48610 ) ( ON-TABLE ?auto_48611 ) ( ON ?auto_48608 ?auto_48609 ) ( CLEAR ?auto_48608 ) ( HOLDING ?auto_48607 ) ( CLEAR ?auto_48606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48606 ?auto_48607 )
      ( MAKE-5PILE ?auto_48606 ?auto_48607 ?auto_48608 ?auto_48609 ?auto_48610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48612 - BLOCK
      ?auto_48613 - BLOCK
      ?auto_48614 - BLOCK
      ?auto_48615 - BLOCK
      ?auto_48616 - BLOCK
    )
    :vars
    (
      ?auto_48617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48612 ) ( not ( = ?auto_48612 ?auto_48613 ) ) ( not ( = ?auto_48612 ?auto_48614 ) ) ( not ( = ?auto_48612 ?auto_48615 ) ) ( not ( = ?auto_48612 ?auto_48616 ) ) ( not ( = ?auto_48613 ?auto_48614 ) ) ( not ( = ?auto_48613 ?auto_48615 ) ) ( not ( = ?auto_48613 ?auto_48616 ) ) ( not ( = ?auto_48614 ?auto_48615 ) ) ( not ( = ?auto_48614 ?auto_48616 ) ) ( not ( = ?auto_48615 ?auto_48616 ) ) ( ON ?auto_48616 ?auto_48617 ) ( not ( = ?auto_48612 ?auto_48617 ) ) ( not ( = ?auto_48613 ?auto_48617 ) ) ( not ( = ?auto_48614 ?auto_48617 ) ) ( not ( = ?auto_48615 ?auto_48617 ) ) ( not ( = ?auto_48616 ?auto_48617 ) ) ( ON ?auto_48615 ?auto_48616 ) ( ON-TABLE ?auto_48617 ) ( ON ?auto_48614 ?auto_48615 ) ( CLEAR ?auto_48612 ) ( ON ?auto_48613 ?auto_48614 ) ( CLEAR ?auto_48613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48617 ?auto_48616 ?auto_48615 ?auto_48614 )
      ( MAKE-5PILE ?auto_48612 ?auto_48613 ?auto_48614 ?auto_48615 ?auto_48616 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48618 - BLOCK
      ?auto_48619 - BLOCK
      ?auto_48620 - BLOCK
      ?auto_48621 - BLOCK
      ?auto_48622 - BLOCK
    )
    :vars
    (
      ?auto_48623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48618 ?auto_48619 ) ) ( not ( = ?auto_48618 ?auto_48620 ) ) ( not ( = ?auto_48618 ?auto_48621 ) ) ( not ( = ?auto_48618 ?auto_48622 ) ) ( not ( = ?auto_48619 ?auto_48620 ) ) ( not ( = ?auto_48619 ?auto_48621 ) ) ( not ( = ?auto_48619 ?auto_48622 ) ) ( not ( = ?auto_48620 ?auto_48621 ) ) ( not ( = ?auto_48620 ?auto_48622 ) ) ( not ( = ?auto_48621 ?auto_48622 ) ) ( ON ?auto_48622 ?auto_48623 ) ( not ( = ?auto_48618 ?auto_48623 ) ) ( not ( = ?auto_48619 ?auto_48623 ) ) ( not ( = ?auto_48620 ?auto_48623 ) ) ( not ( = ?auto_48621 ?auto_48623 ) ) ( not ( = ?auto_48622 ?auto_48623 ) ) ( ON ?auto_48621 ?auto_48622 ) ( ON-TABLE ?auto_48623 ) ( ON ?auto_48620 ?auto_48621 ) ( ON ?auto_48619 ?auto_48620 ) ( CLEAR ?auto_48619 ) ( HOLDING ?auto_48618 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48618 )
      ( MAKE-5PILE ?auto_48618 ?auto_48619 ?auto_48620 ?auto_48621 ?auto_48622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48624 - BLOCK
      ?auto_48625 - BLOCK
      ?auto_48626 - BLOCK
      ?auto_48627 - BLOCK
      ?auto_48628 - BLOCK
    )
    :vars
    (
      ?auto_48629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48624 ?auto_48625 ) ) ( not ( = ?auto_48624 ?auto_48626 ) ) ( not ( = ?auto_48624 ?auto_48627 ) ) ( not ( = ?auto_48624 ?auto_48628 ) ) ( not ( = ?auto_48625 ?auto_48626 ) ) ( not ( = ?auto_48625 ?auto_48627 ) ) ( not ( = ?auto_48625 ?auto_48628 ) ) ( not ( = ?auto_48626 ?auto_48627 ) ) ( not ( = ?auto_48626 ?auto_48628 ) ) ( not ( = ?auto_48627 ?auto_48628 ) ) ( ON ?auto_48628 ?auto_48629 ) ( not ( = ?auto_48624 ?auto_48629 ) ) ( not ( = ?auto_48625 ?auto_48629 ) ) ( not ( = ?auto_48626 ?auto_48629 ) ) ( not ( = ?auto_48627 ?auto_48629 ) ) ( not ( = ?auto_48628 ?auto_48629 ) ) ( ON ?auto_48627 ?auto_48628 ) ( ON-TABLE ?auto_48629 ) ( ON ?auto_48626 ?auto_48627 ) ( ON ?auto_48625 ?auto_48626 ) ( ON ?auto_48624 ?auto_48625 ) ( CLEAR ?auto_48624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48629 ?auto_48628 ?auto_48627 ?auto_48626 ?auto_48625 )
      ( MAKE-5PILE ?auto_48624 ?auto_48625 ?auto_48626 ?auto_48627 ?auto_48628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48635 - BLOCK
      ?auto_48636 - BLOCK
      ?auto_48637 - BLOCK
      ?auto_48638 - BLOCK
      ?auto_48639 - BLOCK
    )
    :vars
    (
      ?auto_48640 - BLOCK
      ?auto_48641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48635 ?auto_48636 ) ) ( not ( = ?auto_48635 ?auto_48637 ) ) ( not ( = ?auto_48635 ?auto_48638 ) ) ( not ( = ?auto_48635 ?auto_48639 ) ) ( not ( = ?auto_48636 ?auto_48637 ) ) ( not ( = ?auto_48636 ?auto_48638 ) ) ( not ( = ?auto_48636 ?auto_48639 ) ) ( not ( = ?auto_48637 ?auto_48638 ) ) ( not ( = ?auto_48637 ?auto_48639 ) ) ( not ( = ?auto_48638 ?auto_48639 ) ) ( ON ?auto_48639 ?auto_48640 ) ( not ( = ?auto_48635 ?auto_48640 ) ) ( not ( = ?auto_48636 ?auto_48640 ) ) ( not ( = ?auto_48637 ?auto_48640 ) ) ( not ( = ?auto_48638 ?auto_48640 ) ) ( not ( = ?auto_48639 ?auto_48640 ) ) ( ON ?auto_48638 ?auto_48639 ) ( ON-TABLE ?auto_48640 ) ( ON ?auto_48637 ?auto_48638 ) ( ON ?auto_48636 ?auto_48637 ) ( CLEAR ?auto_48636 ) ( ON ?auto_48635 ?auto_48641 ) ( CLEAR ?auto_48635 ) ( HAND-EMPTY ) ( not ( = ?auto_48635 ?auto_48641 ) ) ( not ( = ?auto_48636 ?auto_48641 ) ) ( not ( = ?auto_48637 ?auto_48641 ) ) ( not ( = ?auto_48638 ?auto_48641 ) ) ( not ( = ?auto_48639 ?auto_48641 ) ) ( not ( = ?auto_48640 ?auto_48641 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48635 ?auto_48641 )
      ( MAKE-5PILE ?auto_48635 ?auto_48636 ?auto_48637 ?auto_48638 ?auto_48639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48642 - BLOCK
      ?auto_48643 - BLOCK
      ?auto_48644 - BLOCK
      ?auto_48645 - BLOCK
      ?auto_48646 - BLOCK
    )
    :vars
    (
      ?auto_48648 - BLOCK
      ?auto_48647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48642 ?auto_48643 ) ) ( not ( = ?auto_48642 ?auto_48644 ) ) ( not ( = ?auto_48642 ?auto_48645 ) ) ( not ( = ?auto_48642 ?auto_48646 ) ) ( not ( = ?auto_48643 ?auto_48644 ) ) ( not ( = ?auto_48643 ?auto_48645 ) ) ( not ( = ?auto_48643 ?auto_48646 ) ) ( not ( = ?auto_48644 ?auto_48645 ) ) ( not ( = ?auto_48644 ?auto_48646 ) ) ( not ( = ?auto_48645 ?auto_48646 ) ) ( ON ?auto_48646 ?auto_48648 ) ( not ( = ?auto_48642 ?auto_48648 ) ) ( not ( = ?auto_48643 ?auto_48648 ) ) ( not ( = ?auto_48644 ?auto_48648 ) ) ( not ( = ?auto_48645 ?auto_48648 ) ) ( not ( = ?auto_48646 ?auto_48648 ) ) ( ON ?auto_48645 ?auto_48646 ) ( ON-TABLE ?auto_48648 ) ( ON ?auto_48644 ?auto_48645 ) ( ON ?auto_48642 ?auto_48647 ) ( CLEAR ?auto_48642 ) ( not ( = ?auto_48642 ?auto_48647 ) ) ( not ( = ?auto_48643 ?auto_48647 ) ) ( not ( = ?auto_48644 ?auto_48647 ) ) ( not ( = ?auto_48645 ?auto_48647 ) ) ( not ( = ?auto_48646 ?auto_48647 ) ) ( not ( = ?auto_48648 ?auto_48647 ) ) ( HOLDING ?auto_48643 ) ( CLEAR ?auto_48644 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48648 ?auto_48646 ?auto_48645 ?auto_48644 ?auto_48643 )
      ( MAKE-5PILE ?auto_48642 ?auto_48643 ?auto_48644 ?auto_48645 ?auto_48646 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48649 - BLOCK
      ?auto_48650 - BLOCK
      ?auto_48651 - BLOCK
      ?auto_48652 - BLOCK
      ?auto_48653 - BLOCK
    )
    :vars
    (
      ?auto_48654 - BLOCK
      ?auto_48655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48649 ?auto_48650 ) ) ( not ( = ?auto_48649 ?auto_48651 ) ) ( not ( = ?auto_48649 ?auto_48652 ) ) ( not ( = ?auto_48649 ?auto_48653 ) ) ( not ( = ?auto_48650 ?auto_48651 ) ) ( not ( = ?auto_48650 ?auto_48652 ) ) ( not ( = ?auto_48650 ?auto_48653 ) ) ( not ( = ?auto_48651 ?auto_48652 ) ) ( not ( = ?auto_48651 ?auto_48653 ) ) ( not ( = ?auto_48652 ?auto_48653 ) ) ( ON ?auto_48653 ?auto_48654 ) ( not ( = ?auto_48649 ?auto_48654 ) ) ( not ( = ?auto_48650 ?auto_48654 ) ) ( not ( = ?auto_48651 ?auto_48654 ) ) ( not ( = ?auto_48652 ?auto_48654 ) ) ( not ( = ?auto_48653 ?auto_48654 ) ) ( ON ?auto_48652 ?auto_48653 ) ( ON-TABLE ?auto_48654 ) ( ON ?auto_48651 ?auto_48652 ) ( ON ?auto_48649 ?auto_48655 ) ( not ( = ?auto_48649 ?auto_48655 ) ) ( not ( = ?auto_48650 ?auto_48655 ) ) ( not ( = ?auto_48651 ?auto_48655 ) ) ( not ( = ?auto_48652 ?auto_48655 ) ) ( not ( = ?auto_48653 ?auto_48655 ) ) ( not ( = ?auto_48654 ?auto_48655 ) ) ( CLEAR ?auto_48651 ) ( ON ?auto_48650 ?auto_48649 ) ( CLEAR ?auto_48650 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48655 ?auto_48649 )
      ( MAKE-5PILE ?auto_48649 ?auto_48650 ?auto_48651 ?auto_48652 ?auto_48653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48656 - BLOCK
      ?auto_48657 - BLOCK
      ?auto_48658 - BLOCK
      ?auto_48659 - BLOCK
      ?auto_48660 - BLOCK
    )
    :vars
    (
      ?auto_48662 - BLOCK
      ?auto_48661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48656 ?auto_48657 ) ) ( not ( = ?auto_48656 ?auto_48658 ) ) ( not ( = ?auto_48656 ?auto_48659 ) ) ( not ( = ?auto_48656 ?auto_48660 ) ) ( not ( = ?auto_48657 ?auto_48658 ) ) ( not ( = ?auto_48657 ?auto_48659 ) ) ( not ( = ?auto_48657 ?auto_48660 ) ) ( not ( = ?auto_48658 ?auto_48659 ) ) ( not ( = ?auto_48658 ?auto_48660 ) ) ( not ( = ?auto_48659 ?auto_48660 ) ) ( ON ?auto_48660 ?auto_48662 ) ( not ( = ?auto_48656 ?auto_48662 ) ) ( not ( = ?auto_48657 ?auto_48662 ) ) ( not ( = ?auto_48658 ?auto_48662 ) ) ( not ( = ?auto_48659 ?auto_48662 ) ) ( not ( = ?auto_48660 ?auto_48662 ) ) ( ON ?auto_48659 ?auto_48660 ) ( ON-TABLE ?auto_48662 ) ( ON ?auto_48656 ?auto_48661 ) ( not ( = ?auto_48656 ?auto_48661 ) ) ( not ( = ?auto_48657 ?auto_48661 ) ) ( not ( = ?auto_48658 ?auto_48661 ) ) ( not ( = ?auto_48659 ?auto_48661 ) ) ( not ( = ?auto_48660 ?auto_48661 ) ) ( not ( = ?auto_48662 ?auto_48661 ) ) ( ON ?auto_48657 ?auto_48656 ) ( CLEAR ?auto_48657 ) ( ON-TABLE ?auto_48661 ) ( HOLDING ?auto_48658 ) ( CLEAR ?auto_48659 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48662 ?auto_48660 ?auto_48659 ?auto_48658 )
      ( MAKE-5PILE ?auto_48656 ?auto_48657 ?auto_48658 ?auto_48659 ?auto_48660 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48663 - BLOCK
      ?auto_48664 - BLOCK
      ?auto_48665 - BLOCK
      ?auto_48666 - BLOCK
      ?auto_48667 - BLOCK
    )
    :vars
    (
      ?auto_48668 - BLOCK
      ?auto_48669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48663 ?auto_48664 ) ) ( not ( = ?auto_48663 ?auto_48665 ) ) ( not ( = ?auto_48663 ?auto_48666 ) ) ( not ( = ?auto_48663 ?auto_48667 ) ) ( not ( = ?auto_48664 ?auto_48665 ) ) ( not ( = ?auto_48664 ?auto_48666 ) ) ( not ( = ?auto_48664 ?auto_48667 ) ) ( not ( = ?auto_48665 ?auto_48666 ) ) ( not ( = ?auto_48665 ?auto_48667 ) ) ( not ( = ?auto_48666 ?auto_48667 ) ) ( ON ?auto_48667 ?auto_48668 ) ( not ( = ?auto_48663 ?auto_48668 ) ) ( not ( = ?auto_48664 ?auto_48668 ) ) ( not ( = ?auto_48665 ?auto_48668 ) ) ( not ( = ?auto_48666 ?auto_48668 ) ) ( not ( = ?auto_48667 ?auto_48668 ) ) ( ON ?auto_48666 ?auto_48667 ) ( ON-TABLE ?auto_48668 ) ( ON ?auto_48663 ?auto_48669 ) ( not ( = ?auto_48663 ?auto_48669 ) ) ( not ( = ?auto_48664 ?auto_48669 ) ) ( not ( = ?auto_48665 ?auto_48669 ) ) ( not ( = ?auto_48666 ?auto_48669 ) ) ( not ( = ?auto_48667 ?auto_48669 ) ) ( not ( = ?auto_48668 ?auto_48669 ) ) ( ON ?auto_48664 ?auto_48663 ) ( ON-TABLE ?auto_48669 ) ( CLEAR ?auto_48666 ) ( ON ?auto_48665 ?auto_48664 ) ( CLEAR ?auto_48665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48669 ?auto_48663 ?auto_48664 )
      ( MAKE-5PILE ?auto_48663 ?auto_48664 ?auto_48665 ?auto_48666 ?auto_48667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48670 - BLOCK
      ?auto_48671 - BLOCK
      ?auto_48672 - BLOCK
      ?auto_48673 - BLOCK
      ?auto_48674 - BLOCK
    )
    :vars
    (
      ?auto_48676 - BLOCK
      ?auto_48675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48670 ?auto_48671 ) ) ( not ( = ?auto_48670 ?auto_48672 ) ) ( not ( = ?auto_48670 ?auto_48673 ) ) ( not ( = ?auto_48670 ?auto_48674 ) ) ( not ( = ?auto_48671 ?auto_48672 ) ) ( not ( = ?auto_48671 ?auto_48673 ) ) ( not ( = ?auto_48671 ?auto_48674 ) ) ( not ( = ?auto_48672 ?auto_48673 ) ) ( not ( = ?auto_48672 ?auto_48674 ) ) ( not ( = ?auto_48673 ?auto_48674 ) ) ( ON ?auto_48674 ?auto_48676 ) ( not ( = ?auto_48670 ?auto_48676 ) ) ( not ( = ?auto_48671 ?auto_48676 ) ) ( not ( = ?auto_48672 ?auto_48676 ) ) ( not ( = ?auto_48673 ?auto_48676 ) ) ( not ( = ?auto_48674 ?auto_48676 ) ) ( ON-TABLE ?auto_48676 ) ( ON ?auto_48670 ?auto_48675 ) ( not ( = ?auto_48670 ?auto_48675 ) ) ( not ( = ?auto_48671 ?auto_48675 ) ) ( not ( = ?auto_48672 ?auto_48675 ) ) ( not ( = ?auto_48673 ?auto_48675 ) ) ( not ( = ?auto_48674 ?auto_48675 ) ) ( not ( = ?auto_48676 ?auto_48675 ) ) ( ON ?auto_48671 ?auto_48670 ) ( ON-TABLE ?auto_48675 ) ( ON ?auto_48672 ?auto_48671 ) ( CLEAR ?auto_48672 ) ( HOLDING ?auto_48673 ) ( CLEAR ?auto_48674 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48676 ?auto_48674 ?auto_48673 )
      ( MAKE-5PILE ?auto_48670 ?auto_48671 ?auto_48672 ?auto_48673 ?auto_48674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48677 - BLOCK
      ?auto_48678 - BLOCK
      ?auto_48679 - BLOCK
      ?auto_48680 - BLOCK
      ?auto_48681 - BLOCK
    )
    :vars
    (
      ?auto_48683 - BLOCK
      ?auto_48682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48677 ?auto_48678 ) ) ( not ( = ?auto_48677 ?auto_48679 ) ) ( not ( = ?auto_48677 ?auto_48680 ) ) ( not ( = ?auto_48677 ?auto_48681 ) ) ( not ( = ?auto_48678 ?auto_48679 ) ) ( not ( = ?auto_48678 ?auto_48680 ) ) ( not ( = ?auto_48678 ?auto_48681 ) ) ( not ( = ?auto_48679 ?auto_48680 ) ) ( not ( = ?auto_48679 ?auto_48681 ) ) ( not ( = ?auto_48680 ?auto_48681 ) ) ( ON ?auto_48681 ?auto_48683 ) ( not ( = ?auto_48677 ?auto_48683 ) ) ( not ( = ?auto_48678 ?auto_48683 ) ) ( not ( = ?auto_48679 ?auto_48683 ) ) ( not ( = ?auto_48680 ?auto_48683 ) ) ( not ( = ?auto_48681 ?auto_48683 ) ) ( ON-TABLE ?auto_48683 ) ( ON ?auto_48677 ?auto_48682 ) ( not ( = ?auto_48677 ?auto_48682 ) ) ( not ( = ?auto_48678 ?auto_48682 ) ) ( not ( = ?auto_48679 ?auto_48682 ) ) ( not ( = ?auto_48680 ?auto_48682 ) ) ( not ( = ?auto_48681 ?auto_48682 ) ) ( not ( = ?auto_48683 ?auto_48682 ) ) ( ON ?auto_48678 ?auto_48677 ) ( ON-TABLE ?auto_48682 ) ( ON ?auto_48679 ?auto_48678 ) ( CLEAR ?auto_48681 ) ( ON ?auto_48680 ?auto_48679 ) ( CLEAR ?auto_48680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48682 ?auto_48677 ?auto_48678 ?auto_48679 )
      ( MAKE-5PILE ?auto_48677 ?auto_48678 ?auto_48679 ?auto_48680 ?auto_48681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48684 - BLOCK
      ?auto_48685 - BLOCK
      ?auto_48686 - BLOCK
      ?auto_48687 - BLOCK
      ?auto_48688 - BLOCK
    )
    :vars
    (
      ?auto_48689 - BLOCK
      ?auto_48690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48684 ?auto_48685 ) ) ( not ( = ?auto_48684 ?auto_48686 ) ) ( not ( = ?auto_48684 ?auto_48687 ) ) ( not ( = ?auto_48684 ?auto_48688 ) ) ( not ( = ?auto_48685 ?auto_48686 ) ) ( not ( = ?auto_48685 ?auto_48687 ) ) ( not ( = ?auto_48685 ?auto_48688 ) ) ( not ( = ?auto_48686 ?auto_48687 ) ) ( not ( = ?auto_48686 ?auto_48688 ) ) ( not ( = ?auto_48687 ?auto_48688 ) ) ( not ( = ?auto_48684 ?auto_48689 ) ) ( not ( = ?auto_48685 ?auto_48689 ) ) ( not ( = ?auto_48686 ?auto_48689 ) ) ( not ( = ?auto_48687 ?auto_48689 ) ) ( not ( = ?auto_48688 ?auto_48689 ) ) ( ON-TABLE ?auto_48689 ) ( ON ?auto_48684 ?auto_48690 ) ( not ( = ?auto_48684 ?auto_48690 ) ) ( not ( = ?auto_48685 ?auto_48690 ) ) ( not ( = ?auto_48686 ?auto_48690 ) ) ( not ( = ?auto_48687 ?auto_48690 ) ) ( not ( = ?auto_48688 ?auto_48690 ) ) ( not ( = ?auto_48689 ?auto_48690 ) ) ( ON ?auto_48685 ?auto_48684 ) ( ON-TABLE ?auto_48690 ) ( ON ?auto_48686 ?auto_48685 ) ( ON ?auto_48687 ?auto_48686 ) ( CLEAR ?auto_48687 ) ( HOLDING ?auto_48688 ) ( CLEAR ?auto_48689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48689 ?auto_48688 )
      ( MAKE-5PILE ?auto_48684 ?auto_48685 ?auto_48686 ?auto_48687 ?auto_48688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48691 - BLOCK
      ?auto_48692 - BLOCK
      ?auto_48693 - BLOCK
      ?auto_48694 - BLOCK
      ?auto_48695 - BLOCK
    )
    :vars
    (
      ?auto_48697 - BLOCK
      ?auto_48696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48691 ?auto_48692 ) ) ( not ( = ?auto_48691 ?auto_48693 ) ) ( not ( = ?auto_48691 ?auto_48694 ) ) ( not ( = ?auto_48691 ?auto_48695 ) ) ( not ( = ?auto_48692 ?auto_48693 ) ) ( not ( = ?auto_48692 ?auto_48694 ) ) ( not ( = ?auto_48692 ?auto_48695 ) ) ( not ( = ?auto_48693 ?auto_48694 ) ) ( not ( = ?auto_48693 ?auto_48695 ) ) ( not ( = ?auto_48694 ?auto_48695 ) ) ( not ( = ?auto_48691 ?auto_48697 ) ) ( not ( = ?auto_48692 ?auto_48697 ) ) ( not ( = ?auto_48693 ?auto_48697 ) ) ( not ( = ?auto_48694 ?auto_48697 ) ) ( not ( = ?auto_48695 ?auto_48697 ) ) ( ON-TABLE ?auto_48697 ) ( ON ?auto_48691 ?auto_48696 ) ( not ( = ?auto_48691 ?auto_48696 ) ) ( not ( = ?auto_48692 ?auto_48696 ) ) ( not ( = ?auto_48693 ?auto_48696 ) ) ( not ( = ?auto_48694 ?auto_48696 ) ) ( not ( = ?auto_48695 ?auto_48696 ) ) ( not ( = ?auto_48697 ?auto_48696 ) ) ( ON ?auto_48692 ?auto_48691 ) ( ON-TABLE ?auto_48696 ) ( ON ?auto_48693 ?auto_48692 ) ( ON ?auto_48694 ?auto_48693 ) ( CLEAR ?auto_48697 ) ( ON ?auto_48695 ?auto_48694 ) ( CLEAR ?auto_48695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48696 ?auto_48691 ?auto_48692 ?auto_48693 ?auto_48694 )
      ( MAKE-5PILE ?auto_48691 ?auto_48692 ?auto_48693 ?auto_48694 ?auto_48695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48698 - BLOCK
      ?auto_48699 - BLOCK
      ?auto_48700 - BLOCK
      ?auto_48701 - BLOCK
      ?auto_48702 - BLOCK
    )
    :vars
    (
      ?auto_48704 - BLOCK
      ?auto_48703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48698 ?auto_48699 ) ) ( not ( = ?auto_48698 ?auto_48700 ) ) ( not ( = ?auto_48698 ?auto_48701 ) ) ( not ( = ?auto_48698 ?auto_48702 ) ) ( not ( = ?auto_48699 ?auto_48700 ) ) ( not ( = ?auto_48699 ?auto_48701 ) ) ( not ( = ?auto_48699 ?auto_48702 ) ) ( not ( = ?auto_48700 ?auto_48701 ) ) ( not ( = ?auto_48700 ?auto_48702 ) ) ( not ( = ?auto_48701 ?auto_48702 ) ) ( not ( = ?auto_48698 ?auto_48704 ) ) ( not ( = ?auto_48699 ?auto_48704 ) ) ( not ( = ?auto_48700 ?auto_48704 ) ) ( not ( = ?auto_48701 ?auto_48704 ) ) ( not ( = ?auto_48702 ?auto_48704 ) ) ( ON ?auto_48698 ?auto_48703 ) ( not ( = ?auto_48698 ?auto_48703 ) ) ( not ( = ?auto_48699 ?auto_48703 ) ) ( not ( = ?auto_48700 ?auto_48703 ) ) ( not ( = ?auto_48701 ?auto_48703 ) ) ( not ( = ?auto_48702 ?auto_48703 ) ) ( not ( = ?auto_48704 ?auto_48703 ) ) ( ON ?auto_48699 ?auto_48698 ) ( ON-TABLE ?auto_48703 ) ( ON ?auto_48700 ?auto_48699 ) ( ON ?auto_48701 ?auto_48700 ) ( ON ?auto_48702 ?auto_48701 ) ( CLEAR ?auto_48702 ) ( HOLDING ?auto_48704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48704 )
      ( MAKE-5PILE ?auto_48698 ?auto_48699 ?auto_48700 ?auto_48701 ?auto_48702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48705 - BLOCK
      ?auto_48706 - BLOCK
      ?auto_48707 - BLOCK
      ?auto_48708 - BLOCK
      ?auto_48709 - BLOCK
    )
    :vars
    (
      ?auto_48711 - BLOCK
      ?auto_48710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48705 ?auto_48706 ) ) ( not ( = ?auto_48705 ?auto_48707 ) ) ( not ( = ?auto_48705 ?auto_48708 ) ) ( not ( = ?auto_48705 ?auto_48709 ) ) ( not ( = ?auto_48706 ?auto_48707 ) ) ( not ( = ?auto_48706 ?auto_48708 ) ) ( not ( = ?auto_48706 ?auto_48709 ) ) ( not ( = ?auto_48707 ?auto_48708 ) ) ( not ( = ?auto_48707 ?auto_48709 ) ) ( not ( = ?auto_48708 ?auto_48709 ) ) ( not ( = ?auto_48705 ?auto_48711 ) ) ( not ( = ?auto_48706 ?auto_48711 ) ) ( not ( = ?auto_48707 ?auto_48711 ) ) ( not ( = ?auto_48708 ?auto_48711 ) ) ( not ( = ?auto_48709 ?auto_48711 ) ) ( ON ?auto_48705 ?auto_48710 ) ( not ( = ?auto_48705 ?auto_48710 ) ) ( not ( = ?auto_48706 ?auto_48710 ) ) ( not ( = ?auto_48707 ?auto_48710 ) ) ( not ( = ?auto_48708 ?auto_48710 ) ) ( not ( = ?auto_48709 ?auto_48710 ) ) ( not ( = ?auto_48711 ?auto_48710 ) ) ( ON ?auto_48706 ?auto_48705 ) ( ON-TABLE ?auto_48710 ) ( ON ?auto_48707 ?auto_48706 ) ( ON ?auto_48708 ?auto_48707 ) ( ON ?auto_48709 ?auto_48708 ) ( ON ?auto_48711 ?auto_48709 ) ( CLEAR ?auto_48711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48710 ?auto_48705 ?auto_48706 ?auto_48707 ?auto_48708 ?auto_48709 )
      ( MAKE-5PILE ?auto_48705 ?auto_48706 ?auto_48707 ?auto_48708 ?auto_48709 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48724 - BLOCK
      ?auto_48725 - BLOCK
      ?auto_48726 - BLOCK
      ?auto_48727 - BLOCK
      ?auto_48728 - BLOCK
      ?auto_48729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48728 ) ( ON-TABLE ?auto_48724 ) ( ON ?auto_48725 ?auto_48724 ) ( ON ?auto_48726 ?auto_48725 ) ( ON ?auto_48727 ?auto_48726 ) ( ON ?auto_48728 ?auto_48727 ) ( not ( = ?auto_48724 ?auto_48725 ) ) ( not ( = ?auto_48724 ?auto_48726 ) ) ( not ( = ?auto_48724 ?auto_48727 ) ) ( not ( = ?auto_48724 ?auto_48728 ) ) ( not ( = ?auto_48724 ?auto_48729 ) ) ( not ( = ?auto_48725 ?auto_48726 ) ) ( not ( = ?auto_48725 ?auto_48727 ) ) ( not ( = ?auto_48725 ?auto_48728 ) ) ( not ( = ?auto_48725 ?auto_48729 ) ) ( not ( = ?auto_48726 ?auto_48727 ) ) ( not ( = ?auto_48726 ?auto_48728 ) ) ( not ( = ?auto_48726 ?auto_48729 ) ) ( not ( = ?auto_48727 ?auto_48728 ) ) ( not ( = ?auto_48727 ?auto_48729 ) ) ( not ( = ?auto_48728 ?auto_48729 ) ) ( ON-TABLE ?auto_48729 ) ( CLEAR ?auto_48729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_48729 )
      ( MAKE-6PILE ?auto_48724 ?auto_48725 ?auto_48726 ?auto_48727 ?auto_48728 ?auto_48729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48730 - BLOCK
      ?auto_48731 - BLOCK
      ?auto_48732 - BLOCK
      ?auto_48733 - BLOCK
      ?auto_48734 - BLOCK
      ?auto_48735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48730 ) ( ON ?auto_48731 ?auto_48730 ) ( ON ?auto_48732 ?auto_48731 ) ( ON ?auto_48733 ?auto_48732 ) ( not ( = ?auto_48730 ?auto_48731 ) ) ( not ( = ?auto_48730 ?auto_48732 ) ) ( not ( = ?auto_48730 ?auto_48733 ) ) ( not ( = ?auto_48730 ?auto_48734 ) ) ( not ( = ?auto_48730 ?auto_48735 ) ) ( not ( = ?auto_48731 ?auto_48732 ) ) ( not ( = ?auto_48731 ?auto_48733 ) ) ( not ( = ?auto_48731 ?auto_48734 ) ) ( not ( = ?auto_48731 ?auto_48735 ) ) ( not ( = ?auto_48732 ?auto_48733 ) ) ( not ( = ?auto_48732 ?auto_48734 ) ) ( not ( = ?auto_48732 ?auto_48735 ) ) ( not ( = ?auto_48733 ?auto_48734 ) ) ( not ( = ?auto_48733 ?auto_48735 ) ) ( not ( = ?auto_48734 ?auto_48735 ) ) ( ON-TABLE ?auto_48735 ) ( CLEAR ?auto_48735 ) ( HOLDING ?auto_48734 ) ( CLEAR ?auto_48733 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48730 ?auto_48731 ?auto_48732 ?auto_48733 ?auto_48734 )
      ( MAKE-6PILE ?auto_48730 ?auto_48731 ?auto_48732 ?auto_48733 ?auto_48734 ?auto_48735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48736 - BLOCK
      ?auto_48737 - BLOCK
      ?auto_48738 - BLOCK
      ?auto_48739 - BLOCK
      ?auto_48740 - BLOCK
      ?auto_48741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48736 ) ( ON ?auto_48737 ?auto_48736 ) ( ON ?auto_48738 ?auto_48737 ) ( ON ?auto_48739 ?auto_48738 ) ( not ( = ?auto_48736 ?auto_48737 ) ) ( not ( = ?auto_48736 ?auto_48738 ) ) ( not ( = ?auto_48736 ?auto_48739 ) ) ( not ( = ?auto_48736 ?auto_48740 ) ) ( not ( = ?auto_48736 ?auto_48741 ) ) ( not ( = ?auto_48737 ?auto_48738 ) ) ( not ( = ?auto_48737 ?auto_48739 ) ) ( not ( = ?auto_48737 ?auto_48740 ) ) ( not ( = ?auto_48737 ?auto_48741 ) ) ( not ( = ?auto_48738 ?auto_48739 ) ) ( not ( = ?auto_48738 ?auto_48740 ) ) ( not ( = ?auto_48738 ?auto_48741 ) ) ( not ( = ?auto_48739 ?auto_48740 ) ) ( not ( = ?auto_48739 ?auto_48741 ) ) ( not ( = ?auto_48740 ?auto_48741 ) ) ( ON-TABLE ?auto_48741 ) ( CLEAR ?auto_48739 ) ( ON ?auto_48740 ?auto_48741 ) ( CLEAR ?auto_48740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48741 )
      ( MAKE-6PILE ?auto_48736 ?auto_48737 ?auto_48738 ?auto_48739 ?auto_48740 ?auto_48741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48742 - BLOCK
      ?auto_48743 - BLOCK
      ?auto_48744 - BLOCK
      ?auto_48745 - BLOCK
      ?auto_48746 - BLOCK
      ?auto_48747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48742 ) ( ON ?auto_48743 ?auto_48742 ) ( ON ?auto_48744 ?auto_48743 ) ( not ( = ?auto_48742 ?auto_48743 ) ) ( not ( = ?auto_48742 ?auto_48744 ) ) ( not ( = ?auto_48742 ?auto_48745 ) ) ( not ( = ?auto_48742 ?auto_48746 ) ) ( not ( = ?auto_48742 ?auto_48747 ) ) ( not ( = ?auto_48743 ?auto_48744 ) ) ( not ( = ?auto_48743 ?auto_48745 ) ) ( not ( = ?auto_48743 ?auto_48746 ) ) ( not ( = ?auto_48743 ?auto_48747 ) ) ( not ( = ?auto_48744 ?auto_48745 ) ) ( not ( = ?auto_48744 ?auto_48746 ) ) ( not ( = ?auto_48744 ?auto_48747 ) ) ( not ( = ?auto_48745 ?auto_48746 ) ) ( not ( = ?auto_48745 ?auto_48747 ) ) ( not ( = ?auto_48746 ?auto_48747 ) ) ( ON-TABLE ?auto_48747 ) ( ON ?auto_48746 ?auto_48747 ) ( CLEAR ?auto_48746 ) ( HOLDING ?auto_48745 ) ( CLEAR ?auto_48744 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48742 ?auto_48743 ?auto_48744 ?auto_48745 )
      ( MAKE-6PILE ?auto_48742 ?auto_48743 ?auto_48744 ?auto_48745 ?auto_48746 ?auto_48747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48748 - BLOCK
      ?auto_48749 - BLOCK
      ?auto_48750 - BLOCK
      ?auto_48751 - BLOCK
      ?auto_48752 - BLOCK
      ?auto_48753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48748 ) ( ON ?auto_48749 ?auto_48748 ) ( ON ?auto_48750 ?auto_48749 ) ( not ( = ?auto_48748 ?auto_48749 ) ) ( not ( = ?auto_48748 ?auto_48750 ) ) ( not ( = ?auto_48748 ?auto_48751 ) ) ( not ( = ?auto_48748 ?auto_48752 ) ) ( not ( = ?auto_48748 ?auto_48753 ) ) ( not ( = ?auto_48749 ?auto_48750 ) ) ( not ( = ?auto_48749 ?auto_48751 ) ) ( not ( = ?auto_48749 ?auto_48752 ) ) ( not ( = ?auto_48749 ?auto_48753 ) ) ( not ( = ?auto_48750 ?auto_48751 ) ) ( not ( = ?auto_48750 ?auto_48752 ) ) ( not ( = ?auto_48750 ?auto_48753 ) ) ( not ( = ?auto_48751 ?auto_48752 ) ) ( not ( = ?auto_48751 ?auto_48753 ) ) ( not ( = ?auto_48752 ?auto_48753 ) ) ( ON-TABLE ?auto_48753 ) ( ON ?auto_48752 ?auto_48753 ) ( CLEAR ?auto_48750 ) ( ON ?auto_48751 ?auto_48752 ) ( CLEAR ?auto_48751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48753 ?auto_48752 )
      ( MAKE-6PILE ?auto_48748 ?auto_48749 ?auto_48750 ?auto_48751 ?auto_48752 ?auto_48753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48754 - BLOCK
      ?auto_48755 - BLOCK
      ?auto_48756 - BLOCK
      ?auto_48757 - BLOCK
      ?auto_48758 - BLOCK
      ?auto_48759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48754 ) ( ON ?auto_48755 ?auto_48754 ) ( not ( = ?auto_48754 ?auto_48755 ) ) ( not ( = ?auto_48754 ?auto_48756 ) ) ( not ( = ?auto_48754 ?auto_48757 ) ) ( not ( = ?auto_48754 ?auto_48758 ) ) ( not ( = ?auto_48754 ?auto_48759 ) ) ( not ( = ?auto_48755 ?auto_48756 ) ) ( not ( = ?auto_48755 ?auto_48757 ) ) ( not ( = ?auto_48755 ?auto_48758 ) ) ( not ( = ?auto_48755 ?auto_48759 ) ) ( not ( = ?auto_48756 ?auto_48757 ) ) ( not ( = ?auto_48756 ?auto_48758 ) ) ( not ( = ?auto_48756 ?auto_48759 ) ) ( not ( = ?auto_48757 ?auto_48758 ) ) ( not ( = ?auto_48757 ?auto_48759 ) ) ( not ( = ?auto_48758 ?auto_48759 ) ) ( ON-TABLE ?auto_48759 ) ( ON ?auto_48758 ?auto_48759 ) ( ON ?auto_48757 ?auto_48758 ) ( CLEAR ?auto_48757 ) ( HOLDING ?auto_48756 ) ( CLEAR ?auto_48755 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48754 ?auto_48755 ?auto_48756 )
      ( MAKE-6PILE ?auto_48754 ?auto_48755 ?auto_48756 ?auto_48757 ?auto_48758 ?auto_48759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48760 - BLOCK
      ?auto_48761 - BLOCK
      ?auto_48762 - BLOCK
      ?auto_48763 - BLOCK
      ?auto_48764 - BLOCK
      ?auto_48765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48760 ) ( ON ?auto_48761 ?auto_48760 ) ( not ( = ?auto_48760 ?auto_48761 ) ) ( not ( = ?auto_48760 ?auto_48762 ) ) ( not ( = ?auto_48760 ?auto_48763 ) ) ( not ( = ?auto_48760 ?auto_48764 ) ) ( not ( = ?auto_48760 ?auto_48765 ) ) ( not ( = ?auto_48761 ?auto_48762 ) ) ( not ( = ?auto_48761 ?auto_48763 ) ) ( not ( = ?auto_48761 ?auto_48764 ) ) ( not ( = ?auto_48761 ?auto_48765 ) ) ( not ( = ?auto_48762 ?auto_48763 ) ) ( not ( = ?auto_48762 ?auto_48764 ) ) ( not ( = ?auto_48762 ?auto_48765 ) ) ( not ( = ?auto_48763 ?auto_48764 ) ) ( not ( = ?auto_48763 ?auto_48765 ) ) ( not ( = ?auto_48764 ?auto_48765 ) ) ( ON-TABLE ?auto_48765 ) ( ON ?auto_48764 ?auto_48765 ) ( ON ?auto_48763 ?auto_48764 ) ( CLEAR ?auto_48761 ) ( ON ?auto_48762 ?auto_48763 ) ( CLEAR ?auto_48762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48765 ?auto_48764 ?auto_48763 )
      ( MAKE-6PILE ?auto_48760 ?auto_48761 ?auto_48762 ?auto_48763 ?auto_48764 ?auto_48765 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48766 - BLOCK
      ?auto_48767 - BLOCK
      ?auto_48768 - BLOCK
      ?auto_48769 - BLOCK
      ?auto_48770 - BLOCK
      ?auto_48771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48766 ) ( not ( = ?auto_48766 ?auto_48767 ) ) ( not ( = ?auto_48766 ?auto_48768 ) ) ( not ( = ?auto_48766 ?auto_48769 ) ) ( not ( = ?auto_48766 ?auto_48770 ) ) ( not ( = ?auto_48766 ?auto_48771 ) ) ( not ( = ?auto_48767 ?auto_48768 ) ) ( not ( = ?auto_48767 ?auto_48769 ) ) ( not ( = ?auto_48767 ?auto_48770 ) ) ( not ( = ?auto_48767 ?auto_48771 ) ) ( not ( = ?auto_48768 ?auto_48769 ) ) ( not ( = ?auto_48768 ?auto_48770 ) ) ( not ( = ?auto_48768 ?auto_48771 ) ) ( not ( = ?auto_48769 ?auto_48770 ) ) ( not ( = ?auto_48769 ?auto_48771 ) ) ( not ( = ?auto_48770 ?auto_48771 ) ) ( ON-TABLE ?auto_48771 ) ( ON ?auto_48770 ?auto_48771 ) ( ON ?auto_48769 ?auto_48770 ) ( ON ?auto_48768 ?auto_48769 ) ( CLEAR ?auto_48768 ) ( HOLDING ?auto_48767 ) ( CLEAR ?auto_48766 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48766 ?auto_48767 )
      ( MAKE-6PILE ?auto_48766 ?auto_48767 ?auto_48768 ?auto_48769 ?auto_48770 ?auto_48771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48772 - BLOCK
      ?auto_48773 - BLOCK
      ?auto_48774 - BLOCK
      ?auto_48775 - BLOCK
      ?auto_48776 - BLOCK
      ?auto_48777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48772 ) ( not ( = ?auto_48772 ?auto_48773 ) ) ( not ( = ?auto_48772 ?auto_48774 ) ) ( not ( = ?auto_48772 ?auto_48775 ) ) ( not ( = ?auto_48772 ?auto_48776 ) ) ( not ( = ?auto_48772 ?auto_48777 ) ) ( not ( = ?auto_48773 ?auto_48774 ) ) ( not ( = ?auto_48773 ?auto_48775 ) ) ( not ( = ?auto_48773 ?auto_48776 ) ) ( not ( = ?auto_48773 ?auto_48777 ) ) ( not ( = ?auto_48774 ?auto_48775 ) ) ( not ( = ?auto_48774 ?auto_48776 ) ) ( not ( = ?auto_48774 ?auto_48777 ) ) ( not ( = ?auto_48775 ?auto_48776 ) ) ( not ( = ?auto_48775 ?auto_48777 ) ) ( not ( = ?auto_48776 ?auto_48777 ) ) ( ON-TABLE ?auto_48777 ) ( ON ?auto_48776 ?auto_48777 ) ( ON ?auto_48775 ?auto_48776 ) ( ON ?auto_48774 ?auto_48775 ) ( CLEAR ?auto_48772 ) ( ON ?auto_48773 ?auto_48774 ) ( CLEAR ?auto_48773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48777 ?auto_48776 ?auto_48775 ?auto_48774 )
      ( MAKE-6PILE ?auto_48772 ?auto_48773 ?auto_48774 ?auto_48775 ?auto_48776 ?auto_48777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48778 - BLOCK
      ?auto_48779 - BLOCK
      ?auto_48780 - BLOCK
      ?auto_48781 - BLOCK
      ?auto_48782 - BLOCK
      ?auto_48783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48778 ?auto_48779 ) ) ( not ( = ?auto_48778 ?auto_48780 ) ) ( not ( = ?auto_48778 ?auto_48781 ) ) ( not ( = ?auto_48778 ?auto_48782 ) ) ( not ( = ?auto_48778 ?auto_48783 ) ) ( not ( = ?auto_48779 ?auto_48780 ) ) ( not ( = ?auto_48779 ?auto_48781 ) ) ( not ( = ?auto_48779 ?auto_48782 ) ) ( not ( = ?auto_48779 ?auto_48783 ) ) ( not ( = ?auto_48780 ?auto_48781 ) ) ( not ( = ?auto_48780 ?auto_48782 ) ) ( not ( = ?auto_48780 ?auto_48783 ) ) ( not ( = ?auto_48781 ?auto_48782 ) ) ( not ( = ?auto_48781 ?auto_48783 ) ) ( not ( = ?auto_48782 ?auto_48783 ) ) ( ON-TABLE ?auto_48783 ) ( ON ?auto_48782 ?auto_48783 ) ( ON ?auto_48781 ?auto_48782 ) ( ON ?auto_48780 ?auto_48781 ) ( ON ?auto_48779 ?auto_48780 ) ( CLEAR ?auto_48779 ) ( HOLDING ?auto_48778 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48778 )
      ( MAKE-6PILE ?auto_48778 ?auto_48779 ?auto_48780 ?auto_48781 ?auto_48782 ?auto_48783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48784 - BLOCK
      ?auto_48785 - BLOCK
      ?auto_48786 - BLOCK
      ?auto_48787 - BLOCK
      ?auto_48788 - BLOCK
      ?auto_48789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48784 ?auto_48785 ) ) ( not ( = ?auto_48784 ?auto_48786 ) ) ( not ( = ?auto_48784 ?auto_48787 ) ) ( not ( = ?auto_48784 ?auto_48788 ) ) ( not ( = ?auto_48784 ?auto_48789 ) ) ( not ( = ?auto_48785 ?auto_48786 ) ) ( not ( = ?auto_48785 ?auto_48787 ) ) ( not ( = ?auto_48785 ?auto_48788 ) ) ( not ( = ?auto_48785 ?auto_48789 ) ) ( not ( = ?auto_48786 ?auto_48787 ) ) ( not ( = ?auto_48786 ?auto_48788 ) ) ( not ( = ?auto_48786 ?auto_48789 ) ) ( not ( = ?auto_48787 ?auto_48788 ) ) ( not ( = ?auto_48787 ?auto_48789 ) ) ( not ( = ?auto_48788 ?auto_48789 ) ) ( ON-TABLE ?auto_48789 ) ( ON ?auto_48788 ?auto_48789 ) ( ON ?auto_48787 ?auto_48788 ) ( ON ?auto_48786 ?auto_48787 ) ( ON ?auto_48785 ?auto_48786 ) ( ON ?auto_48784 ?auto_48785 ) ( CLEAR ?auto_48784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48789 ?auto_48788 ?auto_48787 ?auto_48786 ?auto_48785 )
      ( MAKE-6PILE ?auto_48784 ?auto_48785 ?auto_48786 ?auto_48787 ?auto_48788 ?auto_48789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48796 - BLOCK
      ?auto_48797 - BLOCK
      ?auto_48798 - BLOCK
      ?auto_48799 - BLOCK
      ?auto_48800 - BLOCK
      ?auto_48801 - BLOCK
    )
    :vars
    (
      ?auto_48802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48796 ?auto_48797 ) ) ( not ( = ?auto_48796 ?auto_48798 ) ) ( not ( = ?auto_48796 ?auto_48799 ) ) ( not ( = ?auto_48796 ?auto_48800 ) ) ( not ( = ?auto_48796 ?auto_48801 ) ) ( not ( = ?auto_48797 ?auto_48798 ) ) ( not ( = ?auto_48797 ?auto_48799 ) ) ( not ( = ?auto_48797 ?auto_48800 ) ) ( not ( = ?auto_48797 ?auto_48801 ) ) ( not ( = ?auto_48798 ?auto_48799 ) ) ( not ( = ?auto_48798 ?auto_48800 ) ) ( not ( = ?auto_48798 ?auto_48801 ) ) ( not ( = ?auto_48799 ?auto_48800 ) ) ( not ( = ?auto_48799 ?auto_48801 ) ) ( not ( = ?auto_48800 ?auto_48801 ) ) ( ON-TABLE ?auto_48801 ) ( ON ?auto_48800 ?auto_48801 ) ( ON ?auto_48799 ?auto_48800 ) ( ON ?auto_48798 ?auto_48799 ) ( ON ?auto_48797 ?auto_48798 ) ( CLEAR ?auto_48797 ) ( ON ?auto_48796 ?auto_48802 ) ( CLEAR ?auto_48796 ) ( HAND-EMPTY ) ( not ( = ?auto_48796 ?auto_48802 ) ) ( not ( = ?auto_48797 ?auto_48802 ) ) ( not ( = ?auto_48798 ?auto_48802 ) ) ( not ( = ?auto_48799 ?auto_48802 ) ) ( not ( = ?auto_48800 ?auto_48802 ) ) ( not ( = ?auto_48801 ?auto_48802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48796 ?auto_48802 )
      ( MAKE-6PILE ?auto_48796 ?auto_48797 ?auto_48798 ?auto_48799 ?auto_48800 ?auto_48801 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48803 - BLOCK
      ?auto_48804 - BLOCK
      ?auto_48805 - BLOCK
      ?auto_48806 - BLOCK
      ?auto_48807 - BLOCK
      ?auto_48808 - BLOCK
    )
    :vars
    (
      ?auto_48809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48803 ?auto_48804 ) ) ( not ( = ?auto_48803 ?auto_48805 ) ) ( not ( = ?auto_48803 ?auto_48806 ) ) ( not ( = ?auto_48803 ?auto_48807 ) ) ( not ( = ?auto_48803 ?auto_48808 ) ) ( not ( = ?auto_48804 ?auto_48805 ) ) ( not ( = ?auto_48804 ?auto_48806 ) ) ( not ( = ?auto_48804 ?auto_48807 ) ) ( not ( = ?auto_48804 ?auto_48808 ) ) ( not ( = ?auto_48805 ?auto_48806 ) ) ( not ( = ?auto_48805 ?auto_48807 ) ) ( not ( = ?auto_48805 ?auto_48808 ) ) ( not ( = ?auto_48806 ?auto_48807 ) ) ( not ( = ?auto_48806 ?auto_48808 ) ) ( not ( = ?auto_48807 ?auto_48808 ) ) ( ON-TABLE ?auto_48808 ) ( ON ?auto_48807 ?auto_48808 ) ( ON ?auto_48806 ?auto_48807 ) ( ON ?auto_48805 ?auto_48806 ) ( ON ?auto_48803 ?auto_48809 ) ( CLEAR ?auto_48803 ) ( not ( = ?auto_48803 ?auto_48809 ) ) ( not ( = ?auto_48804 ?auto_48809 ) ) ( not ( = ?auto_48805 ?auto_48809 ) ) ( not ( = ?auto_48806 ?auto_48809 ) ) ( not ( = ?auto_48807 ?auto_48809 ) ) ( not ( = ?auto_48808 ?auto_48809 ) ) ( HOLDING ?auto_48804 ) ( CLEAR ?auto_48805 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48808 ?auto_48807 ?auto_48806 ?auto_48805 ?auto_48804 )
      ( MAKE-6PILE ?auto_48803 ?auto_48804 ?auto_48805 ?auto_48806 ?auto_48807 ?auto_48808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48810 - BLOCK
      ?auto_48811 - BLOCK
      ?auto_48812 - BLOCK
      ?auto_48813 - BLOCK
      ?auto_48814 - BLOCK
      ?auto_48815 - BLOCK
    )
    :vars
    (
      ?auto_48816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48810 ?auto_48811 ) ) ( not ( = ?auto_48810 ?auto_48812 ) ) ( not ( = ?auto_48810 ?auto_48813 ) ) ( not ( = ?auto_48810 ?auto_48814 ) ) ( not ( = ?auto_48810 ?auto_48815 ) ) ( not ( = ?auto_48811 ?auto_48812 ) ) ( not ( = ?auto_48811 ?auto_48813 ) ) ( not ( = ?auto_48811 ?auto_48814 ) ) ( not ( = ?auto_48811 ?auto_48815 ) ) ( not ( = ?auto_48812 ?auto_48813 ) ) ( not ( = ?auto_48812 ?auto_48814 ) ) ( not ( = ?auto_48812 ?auto_48815 ) ) ( not ( = ?auto_48813 ?auto_48814 ) ) ( not ( = ?auto_48813 ?auto_48815 ) ) ( not ( = ?auto_48814 ?auto_48815 ) ) ( ON-TABLE ?auto_48815 ) ( ON ?auto_48814 ?auto_48815 ) ( ON ?auto_48813 ?auto_48814 ) ( ON ?auto_48812 ?auto_48813 ) ( ON ?auto_48810 ?auto_48816 ) ( not ( = ?auto_48810 ?auto_48816 ) ) ( not ( = ?auto_48811 ?auto_48816 ) ) ( not ( = ?auto_48812 ?auto_48816 ) ) ( not ( = ?auto_48813 ?auto_48816 ) ) ( not ( = ?auto_48814 ?auto_48816 ) ) ( not ( = ?auto_48815 ?auto_48816 ) ) ( CLEAR ?auto_48812 ) ( ON ?auto_48811 ?auto_48810 ) ( CLEAR ?auto_48811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48816 ?auto_48810 )
      ( MAKE-6PILE ?auto_48810 ?auto_48811 ?auto_48812 ?auto_48813 ?auto_48814 ?auto_48815 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48817 - BLOCK
      ?auto_48818 - BLOCK
      ?auto_48819 - BLOCK
      ?auto_48820 - BLOCK
      ?auto_48821 - BLOCK
      ?auto_48822 - BLOCK
    )
    :vars
    (
      ?auto_48823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48817 ?auto_48818 ) ) ( not ( = ?auto_48817 ?auto_48819 ) ) ( not ( = ?auto_48817 ?auto_48820 ) ) ( not ( = ?auto_48817 ?auto_48821 ) ) ( not ( = ?auto_48817 ?auto_48822 ) ) ( not ( = ?auto_48818 ?auto_48819 ) ) ( not ( = ?auto_48818 ?auto_48820 ) ) ( not ( = ?auto_48818 ?auto_48821 ) ) ( not ( = ?auto_48818 ?auto_48822 ) ) ( not ( = ?auto_48819 ?auto_48820 ) ) ( not ( = ?auto_48819 ?auto_48821 ) ) ( not ( = ?auto_48819 ?auto_48822 ) ) ( not ( = ?auto_48820 ?auto_48821 ) ) ( not ( = ?auto_48820 ?auto_48822 ) ) ( not ( = ?auto_48821 ?auto_48822 ) ) ( ON-TABLE ?auto_48822 ) ( ON ?auto_48821 ?auto_48822 ) ( ON ?auto_48820 ?auto_48821 ) ( ON ?auto_48817 ?auto_48823 ) ( not ( = ?auto_48817 ?auto_48823 ) ) ( not ( = ?auto_48818 ?auto_48823 ) ) ( not ( = ?auto_48819 ?auto_48823 ) ) ( not ( = ?auto_48820 ?auto_48823 ) ) ( not ( = ?auto_48821 ?auto_48823 ) ) ( not ( = ?auto_48822 ?auto_48823 ) ) ( ON ?auto_48818 ?auto_48817 ) ( CLEAR ?auto_48818 ) ( ON-TABLE ?auto_48823 ) ( HOLDING ?auto_48819 ) ( CLEAR ?auto_48820 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48822 ?auto_48821 ?auto_48820 ?auto_48819 )
      ( MAKE-6PILE ?auto_48817 ?auto_48818 ?auto_48819 ?auto_48820 ?auto_48821 ?auto_48822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48824 - BLOCK
      ?auto_48825 - BLOCK
      ?auto_48826 - BLOCK
      ?auto_48827 - BLOCK
      ?auto_48828 - BLOCK
      ?auto_48829 - BLOCK
    )
    :vars
    (
      ?auto_48830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48824 ?auto_48825 ) ) ( not ( = ?auto_48824 ?auto_48826 ) ) ( not ( = ?auto_48824 ?auto_48827 ) ) ( not ( = ?auto_48824 ?auto_48828 ) ) ( not ( = ?auto_48824 ?auto_48829 ) ) ( not ( = ?auto_48825 ?auto_48826 ) ) ( not ( = ?auto_48825 ?auto_48827 ) ) ( not ( = ?auto_48825 ?auto_48828 ) ) ( not ( = ?auto_48825 ?auto_48829 ) ) ( not ( = ?auto_48826 ?auto_48827 ) ) ( not ( = ?auto_48826 ?auto_48828 ) ) ( not ( = ?auto_48826 ?auto_48829 ) ) ( not ( = ?auto_48827 ?auto_48828 ) ) ( not ( = ?auto_48827 ?auto_48829 ) ) ( not ( = ?auto_48828 ?auto_48829 ) ) ( ON-TABLE ?auto_48829 ) ( ON ?auto_48828 ?auto_48829 ) ( ON ?auto_48827 ?auto_48828 ) ( ON ?auto_48824 ?auto_48830 ) ( not ( = ?auto_48824 ?auto_48830 ) ) ( not ( = ?auto_48825 ?auto_48830 ) ) ( not ( = ?auto_48826 ?auto_48830 ) ) ( not ( = ?auto_48827 ?auto_48830 ) ) ( not ( = ?auto_48828 ?auto_48830 ) ) ( not ( = ?auto_48829 ?auto_48830 ) ) ( ON ?auto_48825 ?auto_48824 ) ( ON-TABLE ?auto_48830 ) ( CLEAR ?auto_48827 ) ( ON ?auto_48826 ?auto_48825 ) ( CLEAR ?auto_48826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48830 ?auto_48824 ?auto_48825 )
      ( MAKE-6PILE ?auto_48824 ?auto_48825 ?auto_48826 ?auto_48827 ?auto_48828 ?auto_48829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48831 - BLOCK
      ?auto_48832 - BLOCK
      ?auto_48833 - BLOCK
      ?auto_48834 - BLOCK
      ?auto_48835 - BLOCK
      ?auto_48836 - BLOCK
    )
    :vars
    (
      ?auto_48837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48831 ?auto_48832 ) ) ( not ( = ?auto_48831 ?auto_48833 ) ) ( not ( = ?auto_48831 ?auto_48834 ) ) ( not ( = ?auto_48831 ?auto_48835 ) ) ( not ( = ?auto_48831 ?auto_48836 ) ) ( not ( = ?auto_48832 ?auto_48833 ) ) ( not ( = ?auto_48832 ?auto_48834 ) ) ( not ( = ?auto_48832 ?auto_48835 ) ) ( not ( = ?auto_48832 ?auto_48836 ) ) ( not ( = ?auto_48833 ?auto_48834 ) ) ( not ( = ?auto_48833 ?auto_48835 ) ) ( not ( = ?auto_48833 ?auto_48836 ) ) ( not ( = ?auto_48834 ?auto_48835 ) ) ( not ( = ?auto_48834 ?auto_48836 ) ) ( not ( = ?auto_48835 ?auto_48836 ) ) ( ON-TABLE ?auto_48836 ) ( ON ?auto_48835 ?auto_48836 ) ( ON ?auto_48831 ?auto_48837 ) ( not ( = ?auto_48831 ?auto_48837 ) ) ( not ( = ?auto_48832 ?auto_48837 ) ) ( not ( = ?auto_48833 ?auto_48837 ) ) ( not ( = ?auto_48834 ?auto_48837 ) ) ( not ( = ?auto_48835 ?auto_48837 ) ) ( not ( = ?auto_48836 ?auto_48837 ) ) ( ON ?auto_48832 ?auto_48831 ) ( ON-TABLE ?auto_48837 ) ( ON ?auto_48833 ?auto_48832 ) ( CLEAR ?auto_48833 ) ( HOLDING ?auto_48834 ) ( CLEAR ?auto_48835 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48836 ?auto_48835 ?auto_48834 )
      ( MAKE-6PILE ?auto_48831 ?auto_48832 ?auto_48833 ?auto_48834 ?auto_48835 ?auto_48836 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48838 - BLOCK
      ?auto_48839 - BLOCK
      ?auto_48840 - BLOCK
      ?auto_48841 - BLOCK
      ?auto_48842 - BLOCK
      ?auto_48843 - BLOCK
    )
    :vars
    (
      ?auto_48844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48838 ?auto_48839 ) ) ( not ( = ?auto_48838 ?auto_48840 ) ) ( not ( = ?auto_48838 ?auto_48841 ) ) ( not ( = ?auto_48838 ?auto_48842 ) ) ( not ( = ?auto_48838 ?auto_48843 ) ) ( not ( = ?auto_48839 ?auto_48840 ) ) ( not ( = ?auto_48839 ?auto_48841 ) ) ( not ( = ?auto_48839 ?auto_48842 ) ) ( not ( = ?auto_48839 ?auto_48843 ) ) ( not ( = ?auto_48840 ?auto_48841 ) ) ( not ( = ?auto_48840 ?auto_48842 ) ) ( not ( = ?auto_48840 ?auto_48843 ) ) ( not ( = ?auto_48841 ?auto_48842 ) ) ( not ( = ?auto_48841 ?auto_48843 ) ) ( not ( = ?auto_48842 ?auto_48843 ) ) ( ON-TABLE ?auto_48843 ) ( ON ?auto_48842 ?auto_48843 ) ( ON ?auto_48838 ?auto_48844 ) ( not ( = ?auto_48838 ?auto_48844 ) ) ( not ( = ?auto_48839 ?auto_48844 ) ) ( not ( = ?auto_48840 ?auto_48844 ) ) ( not ( = ?auto_48841 ?auto_48844 ) ) ( not ( = ?auto_48842 ?auto_48844 ) ) ( not ( = ?auto_48843 ?auto_48844 ) ) ( ON ?auto_48839 ?auto_48838 ) ( ON-TABLE ?auto_48844 ) ( ON ?auto_48840 ?auto_48839 ) ( CLEAR ?auto_48842 ) ( ON ?auto_48841 ?auto_48840 ) ( CLEAR ?auto_48841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48844 ?auto_48838 ?auto_48839 ?auto_48840 )
      ( MAKE-6PILE ?auto_48838 ?auto_48839 ?auto_48840 ?auto_48841 ?auto_48842 ?auto_48843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48845 - BLOCK
      ?auto_48846 - BLOCK
      ?auto_48847 - BLOCK
      ?auto_48848 - BLOCK
      ?auto_48849 - BLOCK
      ?auto_48850 - BLOCK
    )
    :vars
    (
      ?auto_48851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48845 ?auto_48846 ) ) ( not ( = ?auto_48845 ?auto_48847 ) ) ( not ( = ?auto_48845 ?auto_48848 ) ) ( not ( = ?auto_48845 ?auto_48849 ) ) ( not ( = ?auto_48845 ?auto_48850 ) ) ( not ( = ?auto_48846 ?auto_48847 ) ) ( not ( = ?auto_48846 ?auto_48848 ) ) ( not ( = ?auto_48846 ?auto_48849 ) ) ( not ( = ?auto_48846 ?auto_48850 ) ) ( not ( = ?auto_48847 ?auto_48848 ) ) ( not ( = ?auto_48847 ?auto_48849 ) ) ( not ( = ?auto_48847 ?auto_48850 ) ) ( not ( = ?auto_48848 ?auto_48849 ) ) ( not ( = ?auto_48848 ?auto_48850 ) ) ( not ( = ?auto_48849 ?auto_48850 ) ) ( ON-TABLE ?auto_48850 ) ( ON ?auto_48845 ?auto_48851 ) ( not ( = ?auto_48845 ?auto_48851 ) ) ( not ( = ?auto_48846 ?auto_48851 ) ) ( not ( = ?auto_48847 ?auto_48851 ) ) ( not ( = ?auto_48848 ?auto_48851 ) ) ( not ( = ?auto_48849 ?auto_48851 ) ) ( not ( = ?auto_48850 ?auto_48851 ) ) ( ON ?auto_48846 ?auto_48845 ) ( ON-TABLE ?auto_48851 ) ( ON ?auto_48847 ?auto_48846 ) ( ON ?auto_48848 ?auto_48847 ) ( CLEAR ?auto_48848 ) ( HOLDING ?auto_48849 ) ( CLEAR ?auto_48850 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48850 ?auto_48849 )
      ( MAKE-6PILE ?auto_48845 ?auto_48846 ?auto_48847 ?auto_48848 ?auto_48849 ?auto_48850 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48852 - BLOCK
      ?auto_48853 - BLOCK
      ?auto_48854 - BLOCK
      ?auto_48855 - BLOCK
      ?auto_48856 - BLOCK
      ?auto_48857 - BLOCK
    )
    :vars
    (
      ?auto_48858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48852 ?auto_48853 ) ) ( not ( = ?auto_48852 ?auto_48854 ) ) ( not ( = ?auto_48852 ?auto_48855 ) ) ( not ( = ?auto_48852 ?auto_48856 ) ) ( not ( = ?auto_48852 ?auto_48857 ) ) ( not ( = ?auto_48853 ?auto_48854 ) ) ( not ( = ?auto_48853 ?auto_48855 ) ) ( not ( = ?auto_48853 ?auto_48856 ) ) ( not ( = ?auto_48853 ?auto_48857 ) ) ( not ( = ?auto_48854 ?auto_48855 ) ) ( not ( = ?auto_48854 ?auto_48856 ) ) ( not ( = ?auto_48854 ?auto_48857 ) ) ( not ( = ?auto_48855 ?auto_48856 ) ) ( not ( = ?auto_48855 ?auto_48857 ) ) ( not ( = ?auto_48856 ?auto_48857 ) ) ( ON-TABLE ?auto_48857 ) ( ON ?auto_48852 ?auto_48858 ) ( not ( = ?auto_48852 ?auto_48858 ) ) ( not ( = ?auto_48853 ?auto_48858 ) ) ( not ( = ?auto_48854 ?auto_48858 ) ) ( not ( = ?auto_48855 ?auto_48858 ) ) ( not ( = ?auto_48856 ?auto_48858 ) ) ( not ( = ?auto_48857 ?auto_48858 ) ) ( ON ?auto_48853 ?auto_48852 ) ( ON-TABLE ?auto_48858 ) ( ON ?auto_48854 ?auto_48853 ) ( ON ?auto_48855 ?auto_48854 ) ( CLEAR ?auto_48857 ) ( ON ?auto_48856 ?auto_48855 ) ( CLEAR ?auto_48856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48858 ?auto_48852 ?auto_48853 ?auto_48854 ?auto_48855 )
      ( MAKE-6PILE ?auto_48852 ?auto_48853 ?auto_48854 ?auto_48855 ?auto_48856 ?auto_48857 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48859 - BLOCK
      ?auto_48860 - BLOCK
      ?auto_48861 - BLOCK
      ?auto_48862 - BLOCK
      ?auto_48863 - BLOCK
      ?auto_48864 - BLOCK
    )
    :vars
    (
      ?auto_48865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48859 ?auto_48860 ) ) ( not ( = ?auto_48859 ?auto_48861 ) ) ( not ( = ?auto_48859 ?auto_48862 ) ) ( not ( = ?auto_48859 ?auto_48863 ) ) ( not ( = ?auto_48859 ?auto_48864 ) ) ( not ( = ?auto_48860 ?auto_48861 ) ) ( not ( = ?auto_48860 ?auto_48862 ) ) ( not ( = ?auto_48860 ?auto_48863 ) ) ( not ( = ?auto_48860 ?auto_48864 ) ) ( not ( = ?auto_48861 ?auto_48862 ) ) ( not ( = ?auto_48861 ?auto_48863 ) ) ( not ( = ?auto_48861 ?auto_48864 ) ) ( not ( = ?auto_48862 ?auto_48863 ) ) ( not ( = ?auto_48862 ?auto_48864 ) ) ( not ( = ?auto_48863 ?auto_48864 ) ) ( ON ?auto_48859 ?auto_48865 ) ( not ( = ?auto_48859 ?auto_48865 ) ) ( not ( = ?auto_48860 ?auto_48865 ) ) ( not ( = ?auto_48861 ?auto_48865 ) ) ( not ( = ?auto_48862 ?auto_48865 ) ) ( not ( = ?auto_48863 ?auto_48865 ) ) ( not ( = ?auto_48864 ?auto_48865 ) ) ( ON ?auto_48860 ?auto_48859 ) ( ON-TABLE ?auto_48865 ) ( ON ?auto_48861 ?auto_48860 ) ( ON ?auto_48862 ?auto_48861 ) ( ON ?auto_48863 ?auto_48862 ) ( CLEAR ?auto_48863 ) ( HOLDING ?auto_48864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48864 )
      ( MAKE-6PILE ?auto_48859 ?auto_48860 ?auto_48861 ?auto_48862 ?auto_48863 ?auto_48864 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48866 - BLOCK
      ?auto_48867 - BLOCK
      ?auto_48868 - BLOCK
      ?auto_48869 - BLOCK
      ?auto_48870 - BLOCK
      ?auto_48871 - BLOCK
    )
    :vars
    (
      ?auto_48872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48866 ?auto_48867 ) ) ( not ( = ?auto_48866 ?auto_48868 ) ) ( not ( = ?auto_48866 ?auto_48869 ) ) ( not ( = ?auto_48866 ?auto_48870 ) ) ( not ( = ?auto_48866 ?auto_48871 ) ) ( not ( = ?auto_48867 ?auto_48868 ) ) ( not ( = ?auto_48867 ?auto_48869 ) ) ( not ( = ?auto_48867 ?auto_48870 ) ) ( not ( = ?auto_48867 ?auto_48871 ) ) ( not ( = ?auto_48868 ?auto_48869 ) ) ( not ( = ?auto_48868 ?auto_48870 ) ) ( not ( = ?auto_48868 ?auto_48871 ) ) ( not ( = ?auto_48869 ?auto_48870 ) ) ( not ( = ?auto_48869 ?auto_48871 ) ) ( not ( = ?auto_48870 ?auto_48871 ) ) ( ON ?auto_48866 ?auto_48872 ) ( not ( = ?auto_48866 ?auto_48872 ) ) ( not ( = ?auto_48867 ?auto_48872 ) ) ( not ( = ?auto_48868 ?auto_48872 ) ) ( not ( = ?auto_48869 ?auto_48872 ) ) ( not ( = ?auto_48870 ?auto_48872 ) ) ( not ( = ?auto_48871 ?auto_48872 ) ) ( ON ?auto_48867 ?auto_48866 ) ( ON-TABLE ?auto_48872 ) ( ON ?auto_48868 ?auto_48867 ) ( ON ?auto_48869 ?auto_48868 ) ( ON ?auto_48870 ?auto_48869 ) ( ON ?auto_48871 ?auto_48870 ) ( CLEAR ?auto_48871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48872 ?auto_48866 ?auto_48867 ?auto_48868 ?auto_48869 ?auto_48870 )
      ( MAKE-6PILE ?auto_48866 ?auto_48867 ?auto_48868 ?auto_48869 ?auto_48870 ?auto_48871 ) )
  )

)

