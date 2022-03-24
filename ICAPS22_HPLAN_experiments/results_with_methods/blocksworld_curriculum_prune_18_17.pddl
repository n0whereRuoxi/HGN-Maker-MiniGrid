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
      ?auto_889230 - BLOCK
    )
    :vars
    (
      ?auto_889231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889230 ?auto_889231 ) ( CLEAR ?auto_889230 ) ( HAND-EMPTY ) ( not ( = ?auto_889230 ?auto_889231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889230 ?auto_889231 )
      ( !PUTDOWN ?auto_889230 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_889237 - BLOCK
      ?auto_889238 - BLOCK
    )
    :vars
    (
      ?auto_889239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_889237 ) ( ON ?auto_889238 ?auto_889239 ) ( CLEAR ?auto_889238 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_889237 ) ( not ( = ?auto_889237 ?auto_889238 ) ) ( not ( = ?auto_889237 ?auto_889239 ) ) ( not ( = ?auto_889238 ?auto_889239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889238 ?auto_889239 )
      ( !STACK ?auto_889238 ?auto_889237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_889247 - BLOCK
      ?auto_889248 - BLOCK
    )
    :vars
    (
      ?auto_889249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889248 ?auto_889249 ) ( not ( = ?auto_889247 ?auto_889248 ) ) ( not ( = ?auto_889247 ?auto_889249 ) ) ( not ( = ?auto_889248 ?auto_889249 ) ) ( ON ?auto_889247 ?auto_889248 ) ( CLEAR ?auto_889247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889247 )
      ( MAKE-2PILE ?auto_889247 ?auto_889248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_889258 - BLOCK
      ?auto_889259 - BLOCK
      ?auto_889260 - BLOCK
    )
    :vars
    (
      ?auto_889261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_889259 ) ( ON ?auto_889260 ?auto_889261 ) ( CLEAR ?auto_889260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_889258 ) ( ON ?auto_889259 ?auto_889258 ) ( not ( = ?auto_889258 ?auto_889259 ) ) ( not ( = ?auto_889258 ?auto_889260 ) ) ( not ( = ?auto_889258 ?auto_889261 ) ) ( not ( = ?auto_889259 ?auto_889260 ) ) ( not ( = ?auto_889259 ?auto_889261 ) ) ( not ( = ?auto_889260 ?auto_889261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889260 ?auto_889261 )
      ( !STACK ?auto_889260 ?auto_889259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_889272 - BLOCK
      ?auto_889273 - BLOCK
      ?auto_889274 - BLOCK
    )
    :vars
    (
      ?auto_889275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889274 ?auto_889275 ) ( ON-TABLE ?auto_889272 ) ( not ( = ?auto_889272 ?auto_889273 ) ) ( not ( = ?auto_889272 ?auto_889274 ) ) ( not ( = ?auto_889272 ?auto_889275 ) ) ( not ( = ?auto_889273 ?auto_889274 ) ) ( not ( = ?auto_889273 ?auto_889275 ) ) ( not ( = ?auto_889274 ?auto_889275 ) ) ( CLEAR ?auto_889272 ) ( ON ?auto_889273 ?auto_889274 ) ( CLEAR ?auto_889273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_889272 ?auto_889273 )
      ( MAKE-3PILE ?auto_889272 ?auto_889273 ?auto_889274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_889286 - BLOCK
      ?auto_889287 - BLOCK
      ?auto_889288 - BLOCK
    )
    :vars
    (
      ?auto_889289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889288 ?auto_889289 ) ( not ( = ?auto_889286 ?auto_889287 ) ) ( not ( = ?auto_889286 ?auto_889288 ) ) ( not ( = ?auto_889286 ?auto_889289 ) ) ( not ( = ?auto_889287 ?auto_889288 ) ) ( not ( = ?auto_889287 ?auto_889289 ) ) ( not ( = ?auto_889288 ?auto_889289 ) ) ( ON ?auto_889287 ?auto_889288 ) ( ON ?auto_889286 ?auto_889287 ) ( CLEAR ?auto_889286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889286 )
      ( MAKE-3PILE ?auto_889286 ?auto_889287 ?auto_889288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_889301 - BLOCK
      ?auto_889302 - BLOCK
      ?auto_889303 - BLOCK
      ?auto_889304 - BLOCK
    )
    :vars
    (
      ?auto_889305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_889303 ) ( ON ?auto_889304 ?auto_889305 ) ( CLEAR ?auto_889304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_889301 ) ( ON ?auto_889302 ?auto_889301 ) ( ON ?auto_889303 ?auto_889302 ) ( not ( = ?auto_889301 ?auto_889302 ) ) ( not ( = ?auto_889301 ?auto_889303 ) ) ( not ( = ?auto_889301 ?auto_889304 ) ) ( not ( = ?auto_889301 ?auto_889305 ) ) ( not ( = ?auto_889302 ?auto_889303 ) ) ( not ( = ?auto_889302 ?auto_889304 ) ) ( not ( = ?auto_889302 ?auto_889305 ) ) ( not ( = ?auto_889303 ?auto_889304 ) ) ( not ( = ?auto_889303 ?auto_889305 ) ) ( not ( = ?auto_889304 ?auto_889305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889304 ?auto_889305 )
      ( !STACK ?auto_889304 ?auto_889303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_889319 - BLOCK
      ?auto_889320 - BLOCK
      ?auto_889321 - BLOCK
      ?auto_889322 - BLOCK
    )
    :vars
    (
      ?auto_889323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889322 ?auto_889323 ) ( ON-TABLE ?auto_889319 ) ( ON ?auto_889320 ?auto_889319 ) ( not ( = ?auto_889319 ?auto_889320 ) ) ( not ( = ?auto_889319 ?auto_889321 ) ) ( not ( = ?auto_889319 ?auto_889322 ) ) ( not ( = ?auto_889319 ?auto_889323 ) ) ( not ( = ?auto_889320 ?auto_889321 ) ) ( not ( = ?auto_889320 ?auto_889322 ) ) ( not ( = ?auto_889320 ?auto_889323 ) ) ( not ( = ?auto_889321 ?auto_889322 ) ) ( not ( = ?auto_889321 ?auto_889323 ) ) ( not ( = ?auto_889322 ?auto_889323 ) ) ( CLEAR ?auto_889320 ) ( ON ?auto_889321 ?auto_889322 ) ( CLEAR ?auto_889321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_889319 ?auto_889320 ?auto_889321 )
      ( MAKE-4PILE ?auto_889319 ?auto_889320 ?auto_889321 ?auto_889322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_889337 - BLOCK
      ?auto_889338 - BLOCK
      ?auto_889339 - BLOCK
      ?auto_889340 - BLOCK
    )
    :vars
    (
      ?auto_889341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889340 ?auto_889341 ) ( ON-TABLE ?auto_889337 ) ( not ( = ?auto_889337 ?auto_889338 ) ) ( not ( = ?auto_889337 ?auto_889339 ) ) ( not ( = ?auto_889337 ?auto_889340 ) ) ( not ( = ?auto_889337 ?auto_889341 ) ) ( not ( = ?auto_889338 ?auto_889339 ) ) ( not ( = ?auto_889338 ?auto_889340 ) ) ( not ( = ?auto_889338 ?auto_889341 ) ) ( not ( = ?auto_889339 ?auto_889340 ) ) ( not ( = ?auto_889339 ?auto_889341 ) ) ( not ( = ?auto_889340 ?auto_889341 ) ) ( ON ?auto_889339 ?auto_889340 ) ( CLEAR ?auto_889337 ) ( ON ?auto_889338 ?auto_889339 ) ( CLEAR ?auto_889338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_889337 ?auto_889338 )
      ( MAKE-4PILE ?auto_889337 ?auto_889338 ?auto_889339 ?auto_889340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_889355 - BLOCK
      ?auto_889356 - BLOCK
      ?auto_889357 - BLOCK
      ?auto_889358 - BLOCK
    )
    :vars
    (
      ?auto_889359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889358 ?auto_889359 ) ( not ( = ?auto_889355 ?auto_889356 ) ) ( not ( = ?auto_889355 ?auto_889357 ) ) ( not ( = ?auto_889355 ?auto_889358 ) ) ( not ( = ?auto_889355 ?auto_889359 ) ) ( not ( = ?auto_889356 ?auto_889357 ) ) ( not ( = ?auto_889356 ?auto_889358 ) ) ( not ( = ?auto_889356 ?auto_889359 ) ) ( not ( = ?auto_889357 ?auto_889358 ) ) ( not ( = ?auto_889357 ?auto_889359 ) ) ( not ( = ?auto_889358 ?auto_889359 ) ) ( ON ?auto_889357 ?auto_889358 ) ( ON ?auto_889356 ?auto_889357 ) ( ON ?auto_889355 ?auto_889356 ) ( CLEAR ?auto_889355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889355 )
      ( MAKE-4PILE ?auto_889355 ?auto_889356 ?auto_889357 ?auto_889358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_889374 - BLOCK
      ?auto_889375 - BLOCK
      ?auto_889376 - BLOCK
      ?auto_889377 - BLOCK
      ?auto_889378 - BLOCK
    )
    :vars
    (
      ?auto_889379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_889377 ) ( ON ?auto_889378 ?auto_889379 ) ( CLEAR ?auto_889378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_889374 ) ( ON ?auto_889375 ?auto_889374 ) ( ON ?auto_889376 ?auto_889375 ) ( ON ?auto_889377 ?auto_889376 ) ( not ( = ?auto_889374 ?auto_889375 ) ) ( not ( = ?auto_889374 ?auto_889376 ) ) ( not ( = ?auto_889374 ?auto_889377 ) ) ( not ( = ?auto_889374 ?auto_889378 ) ) ( not ( = ?auto_889374 ?auto_889379 ) ) ( not ( = ?auto_889375 ?auto_889376 ) ) ( not ( = ?auto_889375 ?auto_889377 ) ) ( not ( = ?auto_889375 ?auto_889378 ) ) ( not ( = ?auto_889375 ?auto_889379 ) ) ( not ( = ?auto_889376 ?auto_889377 ) ) ( not ( = ?auto_889376 ?auto_889378 ) ) ( not ( = ?auto_889376 ?auto_889379 ) ) ( not ( = ?auto_889377 ?auto_889378 ) ) ( not ( = ?auto_889377 ?auto_889379 ) ) ( not ( = ?auto_889378 ?auto_889379 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889378 ?auto_889379 )
      ( !STACK ?auto_889378 ?auto_889377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_889396 - BLOCK
      ?auto_889397 - BLOCK
      ?auto_889398 - BLOCK
      ?auto_889399 - BLOCK
      ?auto_889400 - BLOCK
    )
    :vars
    (
      ?auto_889401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889400 ?auto_889401 ) ( ON-TABLE ?auto_889396 ) ( ON ?auto_889397 ?auto_889396 ) ( ON ?auto_889398 ?auto_889397 ) ( not ( = ?auto_889396 ?auto_889397 ) ) ( not ( = ?auto_889396 ?auto_889398 ) ) ( not ( = ?auto_889396 ?auto_889399 ) ) ( not ( = ?auto_889396 ?auto_889400 ) ) ( not ( = ?auto_889396 ?auto_889401 ) ) ( not ( = ?auto_889397 ?auto_889398 ) ) ( not ( = ?auto_889397 ?auto_889399 ) ) ( not ( = ?auto_889397 ?auto_889400 ) ) ( not ( = ?auto_889397 ?auto_889401 ) ) ( not ( = ?auto_889398 ?auto_889399 ) ) ( not ( = ?auto_889398 ?auto_889400 ) ) ( not ( = ?auto_889398 ?auto_889401 ) ) ( not ( = ?auto_889399 ?auto_889400 ) ) ( not ( = ?auto_889399 ?auto_889401 ) ) ( not ( = ?auto_889400 ?auto_889401 ) ) ( CLEAR ?auto_889398 ) ( ON ?auto_889399 ?auto_889400 ) ( CLEAR ?auto_889399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_889396 ?auto_889397 ?auto_889398 ?auto_889399 )
      ( MAKE-5PILE ?auto_889396 ?auto_889397 ?auto_889398 ?auto_889399 ?auto_889400 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_889418 - BLOCK
      ?auto_889419 - BLOCK
      ?auto_889420 - BLOCK
      ?auto_889421 - BLOCK
      ?auto_889422 - BLOCK
    )
    :vars
    (
      ?auto_889423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889422 ?auto_889423 ) ( ON-TABLE ?auto_889418 ) ( ON ?auto_889419 ?auto_889418 ) ( not ( = ?auto_889418 ?auto_889419 ) ) ( not ( = ?auto_889418 ?auto_889420 ) ) ( not ( = ?auto_889418 ?auto_889421 ) ) ( not ( = ?auto_889418 ?auto_889422 ) ) ( not ( = ?auto_889418 ?auto_889423 ) ) ( not ( = ?auto_889419 ?auto_889420 ) ) ( not ( = ?auto_889419 ?auto_889421 ) ) ( not ( = ?auto_889419 ?auto_889422 ) ) ( not ( = ?auto_889419 ?auto_889423 ) ) ( not ( = ?auto_889420 ?auto_889421 ) ) ( not ( = ?auto_889420 ?auto_889422 ) ) ( not ( = ?auto_889420 ?auto_889423 ) ) ( not ( = ?auto_889421 ?auto_889422 ) ) ( not ( = ?auto_889421 ?auto_889423 ) ) ( not ( = ?auto_889422 ?auto_889423 ) ) ( ON ?auto_889421 ?auto_889422 ) ( CLEAR ?auto_889419 ) ( ON ?auto_889420 ?auto_889421 ) ( CLEAR ?auto_889420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_889418 ?auto_889419 ?auto_889420 )
      ( MAKE-5PILE ?auto_889418 ?auto_889419 ?auto_889420 ?auto_889421 ?auto_889422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_889440 - BLOCK
      ?auto_889441 - BLOCK
      ?auto_889442 - BLOCK
      ?auto_889443 - BLOCK
      ?auto_889444 - BLOCK
    )
    :vars
    (
      ?auto_889445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889444 ?auto_889445 ) ( ON-TABLE ?auto_889440 ) ( not ( = ?auto_889440 ?auto_889441 ) ) ( not ( = ?auto_889440 ?auto_889442 ) ) ( not ( = ?auto_889440 ?auto_889443 ) ) ( not ( = ?auto_889440 ?auto_889444 ) ) ( not ( = ?auto_889440 ?auto_889445 ) ) ( not ( = ?auto_889441 ?auto_889442 ) ) ( not ( = ?auto_889441 ?auto_889443 ) ) ( not ( = ?auto_889441 ?auto_889444 ) ) ( not ( = ?auto_889441 ?auto_889445 ) ) ( not ( = ?auto_889442 ?auto_889443 ) ) ( not ( = ?auto_889442 ?auto_889444 ) ) ( not ( = ?auto_889442 ?auto_889445 ) ) ( not ( = ?auto_889443 ?auto_889444 ) ) ( not ( = ?auto_889443 ?auto_889445 ) ) ( not ( = ?auto_889444 ?auto_889445 ) ) ( ON ?auto_889443 ?auto_889444 ) ( ON ?auto_889442 ?auto_889443 ) ( CLEAR ?auto_889440 ) ( ON ?auto_889441 ?auto_889442 ) ( CLEAR ?auto_889441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_889440 ?auto_889441 )
      ( MAKE-5PILE ?auto_889440 ?auto_889441 ?auto_889442 ?auto_889443 ?auto_889444 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_889462 - BLOCK
      ?auto_889463 - BLOCK
      ?auto_889464 - BLOCK
      ?auto_889465 - BLOCK
      ?auto_889466 - BLOCK
    )
    :vars
    (
      ?auto_889467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889466 ?auto_889467 ) ( not ( = ?auto_889462 ?auto_889463 ) ) ( not ( = ?auto_889462 ?auto_889464 ) ) ( not ( = ?auto_889462 ?auto_889465 ) ) ( not ( = ?auto_889462 ?auto_889466 ) ) ( not ( = ?auto_889462 ?auto_889467 ) ) ( not ( = ?auto_889463 ?auto_889464 ) ) ( not ( = ?auto_889463 ?auto_889465 ) ) ( not ( = ?auto_889463 ?auto_889466 ) ) ( not ( = ?auto_889463 ?auto_889467 ) ) ( not ( = ?auto_889464 ?auto_889465 ) ) ( not ( = ?auto_889464 ?auto_889466 ) ) ( not ( = ?auto_889464 ?auto_889467 ) ) ( not ( = ?auto_889465 ?auto_889466 ) ) ( not ( = ?auto_889465 ?auto_889467 ) ) ( not ( = ?auto_889466 ?auto_889467 ) ) ( ON ?auto_889465 ?auto_889466 ) ( ON ?auto_889464 ?auto_889465 ) ( ON ?auto_889463 ?auto_889464 ) ( ON ?auto_889462 ?auto_889463 ) ( CLEAR ?auto_889462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889462 )
      ( MAKE-5PILE ?auto_889462 ?auto_889463 ?auto_889464 ?auto_889465 ?auto_889466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_889485 - BLOCK
      ?auto_889486 - BLOCK
      ?auto_889487 - BLOCK
      ?auto_889488 - BLOCK
      ?auto_889489 - BLOCK
      ?auto_889490 - BLOCK
    )
    :vars
    (
      ?auto_889491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_889489 ) ( ON ?auto_889490 ?auto_889491 ) ( CLEAR ?auto_889490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_889485 ) ( ON ?auto_889486 ?auto_889485 ) ( ON ?auto_889487 ?auto_889486 ) ( ON ?auto_889488 ?auto_889487 ) ( ON ?auto_889489 ?auto_889488 ) ( not ( = ?auto_889485 ?auto_889486 ) ) ( not ( = ?auto_889485 ?auto_889487 ) ) ( not ( = ?auto_889485 ?auto_889488 ) ) ( not ( = ?auto_889485 ?auto_889489 ) ) ( not ( = ?auto_889485 ?auto_889490 ) ) ( not ( = ?auto_889485 ?auto_889491 ) ) ( not ( = ?auto_889486 ?auto_889487 ) ) ( not ( = ?auto_889486 ?auto_889488 ) ) ( not ( = ?auto_889486 ?auto_889489 ) ) ( not ( = ?auto_889486 ?auto_889490 ) ) ( not ( = ?auto_889486 ?auto_889491 ) ) ( not ( = ?auto_889487 ?auto_889488 ) ) ( not ( = ?auto_889487 ?auto_889489 ) ) ( not ( = ?auto_889487 ?auto_889490 ) ) ( not ( = ?auto_889487 ?auto_889491 ) ) ( not ( = ?auto_889488 ?auto_889489 ) ) ( not ( = ?auto_889488 ?auto_889490 ) ) ( not ( = ?auto_889488 ?auto_889491 ) ) ( not ( = ?auto_889489 ?auto_889490 ) ) ( not ( = ?auto_889489 ?auto_889491 ) ) ( not ( = ?auto_889490 ?auto_889491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889490 ?auto_889491 )
      ( !STACK ?auto_889490 ?auto_889489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_889511 - BLOCK
      ?auto_889512 - BLOCK
      ?auto_889513 - BLOCK
      ?auto_889514 - BLOCK
      ?auto_889515 - BLOCK
      ?auto_889516 - BLOCK
    )
    :vars
    (
      ?auto_889517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889516 ?auto_889517 ) ( ON-TABLE ?auto_889511 ) ( ON ?auto_889512 ?auto_889511 ) ( ON ?auto_889513 ?auto_889512 ) ( ON ?auto_889514 ?auto_889513 ) ( not ( = ?auto_889511 ?auto_889512 ) ) ( not ( = ?auto_889511 ?auto_889513 ) ) ( not ( = ?auto_889511 ?auto_889514 ) ) ( not ( = ?auto_889511 ?auto_889515 ) ) ( not ( = ?auto_889511 ?auto_889516 ) ) ( not ( = ?auto_889511 ?auto_889517 ) ) ( not ( = ?auto_889512 ?auto_889513 ) ) ( not ( = ?auto_889512 ?auto_889514 ) ) ( not ( = ?auto_889512 ?auto_889515 ) ) ( not ( = ?auto_889512 ?auto_889516 ) ) ( not ( = ?auto_889512 ?auto_889517 ) ) ( not ( = ?auto_889513 ?auto_889514 ) ) ( not ( = ?auto_889513 ?auto_889515 ) ) ( not ( = ?auto_889513 ?auto_889516 ) ) ( not ( = ?auto_889513 ?auto_889517 ) ) ( not ( = ?auto_889514 ?auto_889515 ) ) ( not ( = ?auto_889514 ?auto_889516 ) ) ( not ( = ?auto_889514 ?auto_889517 ) ) ( not ( = ?auto_889515 ?auto_889516 ) ) ( not ( = ?auto_889515 ?auto_889517 ) ) ( not ( = ?auto_889516 ?auto_889517 ) ) ( CLEAR ?auto_889514 ) ( ON ?auto_889515 ?auto_889516 ) ( CLEAR ?auto_889515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_889511 ?auto_889512 ?auto_889513 ?auto_889514 ?auto_889515 )
      ( MAKE-6PILE ?auto_889511 ?auto_889512 ?auto_889513 ?auto_889514 ?auto_889515 ?auto_889516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_889537 - BLOCK
      ?auto_889538 - BLOCK
      ?auto_889539 - BLOCK
      ?auto_889540 - BLOCK
      ?auto_889541 - BLOCK
      ?auto_889542 - BLOCK
    )
    :vars
    (
      ?auto_889543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889542 ?auto_889543 ) ( ON-TABLE ?auto_889537 ) ( ON ?auto_889538 ?auto_889537 ) ( ON ?auto_889539 ?auto_889538 ) ( not ( = ?auto_889537 ?auto_889538 ) ) ( not ( = ?auto_889537 ?auto_889539 ) ) ( not ( = ?auto_889537 ?auto_889540 ) ) ( not ( = ?auto_889537 ?auto_889541 ) ) ( not ( = ?auto_889537 ?auto_889542 ) ) ( not ( = ?auto_889537 ?auto_889543 ) ) ( not ( = ?auto_889538 ?auto_889539 ) ) ( not ( = ?auto_889538 ?auto_889540 ) ) ( not ( = ?auto_889538 ?auto_889541 ) ) ( not ( = ?auto_889538 ?auto_889542 ) ) ( not ( = ?auto_889538 ?auto_889543 ) ) ( not ( = ?auto_889539 ?auto_889540 ) ) ( not ( = ?auto_889539 ?auto_889541 ) ) ( not ( = ?auto_889539 ?auto_889542 ) ) ( not ( = ?auto_889539 ?auto_889543 ) ) ( not ( = ?auto_889540 ?auto_889541 ) ) ( not ( = ?auto_889540 ?auto_889542 ) ) ( not ( = ?auto_889540 ?auto_889543 ) ) ( not ( = ?auto_889541 ?auto_889542 ) ) ( not ( = ?auto_889541 ?auto_889543 ) ) ( not ( = ?auto_889542 ?auto_889543 ) ) ( ON ?auto_889541 ?auto_889542 ) ( CLEAR ?auto_889539 ) ( ON ?auto_889540 ?auto_889541 ) ( CLEAR ?auto_889540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_889537 ?auto_889538 ?auto_889539 ?auto_889540 )
      ( MAKE-6PILE ?auto_889537 ?auto_889538 ?auto_889539 ?auto_889540 ?auto_889541 ?auto_889542 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_889563 - BLOCK
      ?auto_889564 - BLOCK
      ?auto_889565 - BLOCK
      ?auto_889566 - BLOCK
      ?auto_889567 - BLOCK
      ?auto_889568 - BLOCK
    )
    :vars
    (
      ?auto_889569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889568 ?auto_889569 ) ( ON-TABLE ?auto_889563 ) ( ON ?auto_889564 ?auto_889563 ) ( not ( = ?auto_889563 ?auto_889564 ) ) ( not ( = ?auto_889563 ?auto_889565 ) ) ( not ( = ?auto_889563 ?auto_889566 ) ) ( not ( = ?auto_889563 ?auto_889567 ) ) ( not ( = ?auto_889563 ?auto_889568 ) ) ( not ( = ?auto_889563 ?auto_889569 ) ) ( not ( = ?auto_889564 ?auto_889565 ) ) ( not ( = ?auto_889564 ?auto_889566 ) ) ( not ( = ?auto_889564 ?auto_889567 ) ) ( not ( = ?auto_889564 ?auto_889568 ) ) ( not ( = ?auto_889564 ?auto_889569 ) ) ( not ( = ?auto_889565 ?auto_889566 ) ) ( not ( = ?auto_889565 ?auto_889567 ) ) ( not ( = ?auto_889565 ?auto_889568 ) ) ( not ( = ?auto_889565 ?auto_889569 ) ) ( not ( = ?auto_889566 ?auto_889567 ) ) ( not ( = ?auto_889566 ?auto_889568 ) ) ( not ( = ?auto_889566 ?auto_889569 ) ) ( not ( = ?auto_889567 ?auto_889568 ) ) ( not ( = ?auto_889567 ?auto_889569 ) ) ( not ( = ?auto_889568 ?auto_889569 ) ) ( ON ?auto_889567 ?auto_889568 ) ( ON ?auto_889566 ?auto_889567 ) ( CLEAR ?auto_889564 ) ( ON ?auto_889565 ?auto_889566 ) ( CLEAR ?auto_889565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_889563 ?auto_889564 ?auto_889565 )
      ( MAKE-6PILE ?auto_889563 ?auto_889564 ?auto_889565 ?auto_889566 ?auto_889567 ?auto_889568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_889589 - BLOCK
      ?auto_889590 - BLOCK
      ?auto_889591 - BLOCK
      ?auto_889592 - BLOCK
      ?auto_889593 - BLOCK
      ?auto_889594 - BLOCK
    )
    :vars
    (
      ?auto_889595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889594 ?auto_889595 ) ( ON-TABLE ?auto_889589 ) ( not ( = ?auto_889589 ?auto_889590 ) ) ( not ( = ?auto_889589 ?auto_889591 ) ) ( not ( = ?auto_889589 ?auto_889592 ) ) ( not ( = ?auto_889589 ?auto_889593 ) ) ( not ( = ?auto_889589 ?auto_889594 ) ) ( not ( = ?auto_889589 ?auto_889595 ) ) ( not ( = ?auto_889590 ?auto_889591 ) ) ( not ( = ?auto_889590 ?auto_889592 ) ) ( not ( = ?auto_889590 ?auto_889593 ) ) ( not ( = ?auto_889590 ?auto_889594 ) ) ( not ( = ?auto_889590 ?auto_889595 ) ) ( not ( = ?auto_889591 ?auto_889592 ) ) ( not ( = ?auto_889591 ?auto_889593 ) ) ( not ( = ?auto_889591 ?auto_889594 ) ) ( not ( = ?auto_889591 ?auto_889595 ) ) ( not ( = ?auto_889592 ?auto_889593 ) ) ( not ( = ?auto_889592 ?auto_889594 ) ) ( not ( = ?auto_889592 ?auto_889595 ) ) ( not ( = ?auto_889593 ?auto_889594 ) ) ( not ( = ?auto_889593 ?auto_889595 ) ) ( not ( = ?auto_889594 ?auto_889595 ) ) ( ON ?auto_889593 ?auto_889594 ) ( ON ?auto_889592 ?auto_889593 ) ( ON ?auto_889591 ?auto_889592 ) ( CLEAR ?auto_889589 ) ( ON ?auto_889590 ?auto_889591 ) ( CLEAR ?auto_889590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_889589 ?auto_889590 )
      ( MAKE-6PILE ?auto_889589 ?auto_889590 ?auto_889591 ?auto_889592 ?auto_889593 ?auto_889594 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_889615 - BLOCK
      ?auto_889616 - BLOCK
      ?auto_889617 - BLOCK
      ?auto_889618 - BLOCK
      ?auto_889619 - BLOCK
      ?auto_889620 - BLOCK
    )
    :vars
    (
      ?auto_889621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889620 ?auto_889621 ) ( not ( = ?auto_889615 ?auto_889616 ) ) ( not ( = ?auto_889615 ?auto_889617 ) ) ( not ( = ?auto_889615 ?auto_889618 ) ) ( not ( = ?auto_889615 ?auto_889619 ) ) ( not ( = ?auto_889615 ?auto_889620 ) ) ( not ( = ?auto_889615 ?auto_889621 ) ) ( not ( = ?auto_889616 ?auto_889617 ) ) ( not ( = ?auto_889616 ?auto_889618 ) ) ( not ( = ?auto_889616 ?auto_889619 ) ) ( not ( = ?auto_889616 ?auto_889620 ) ) ( not ( = ?auto_889616 ?auto_889621 ) ) ( not ( = ?auto_889617 ?auto_889618 ) ) ( not ( = ?auto_889617 ?auto_889619 ) ) ( not ( = ?auto_889617 ?auto_889620 ) ) ( not ( = ?auto_889617 ?auto_889621 ) ) ( not ( = ?auto_889618 ?auto_889619 ) ) ( not ( = ?auto_889618 ?auto_889620 ) ) ( not ( = ?auto_889618 ?auto_889621 ) ) ( not ( = ?auto_889619 ?auto_889620 ) ) ( not ( = ?auto_889619 ?auto_889621 ) ) ( not ( = ?auto_889620 ?auto_889621 ) ) ( ON ?auto_889619 ?auto_889620 ) ( ON ?auto_889618 ?auto_889619 ) ( ON ?auto_889617 ?auto_889618 ) ( ON ?auto_889616 ?auto_889617 ) ( ON ?auto_889615 ?auto_889616 ) ( CLEAR ?auto_889615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889615 )
      ( MAKE-6PILE ?auto_889615 ?auto_889616 ?auto_889617 ?auto_889618 ?auto_889619 ?auto_889620 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_889642 - BLOCK
      ?auto_889643 - BLOCK
      ?auto_889644 - BLOCK
      ?auto_889645 - BLOCK
      ?auto_889646 - BLOCK
      ?auto_889647 - BLOCK
      ?auto_889648 - BLOCK
    )
    :vars
    (
      ?auto_889649 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_889647 ) ( ON ?auto_889648 ?auto_889649 ) ( CLEAR ?auto_889648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_889642 ) ( ON ?auto_889643 ?auto_889642 ) ( ON ?auto_889644 ?auto_889643 ) ( ON ?auto_889645 ?auto_889644 ) ( ON ?auto_889646 ?auto_889645 ) ( ON ?auto_889647 ?auto_889646 ) ( not ( = ?auto_889642 ?auto_889643 ) ) ( not ( = ?auto_889642 ?auto_889644 ) ) ( not ( = ?auto_889642 ?auto_889645 ) ) ( not ( = ?auto_889642 ?auto_889646 ) ) ( not ( = ?auto_889642 ?auto_889647 ) ) ( not ( = ?auto_889642 ?auto_889648 ) ) ( not ( = ?auto_889642 ?auto_889649 ) ) ( not ( = ?auto_889643 ?auto_889644 ) ) ( not ( = ?auto_889643 ?auto_889645 ) ) ( not ( = ?auto_889643 ?auto_889646 ) ) ( not ( = ?auto_889643 ?auto_889647 ) ) ( not ( = ?auto_889643 ?auto_889648 ) ) ( not ( = ?auto_889643 ?auto_889649 ) ) ( not ( = ?auto_889644 ?auto_889645 ) ) ( not ( = ?auto_889644 ?auto_889646 ) ) ( not ( = ?auto_889644 ?auto_889647 ) ) ( not ( = ?auto_889644 ?auto_889648 ) ) ( not ( = ?auto_889644 ?auto_889649 ) ) ( not ( = ?auto_889645 ?auto_889646 ) ) ( not ( = ?auto_889645 ?auto_889647 ) ) ( not ( = ?auto_889645 ?auto_889648 ) ) ( not ( = ?auto_889645 ?auto_889649 ) ) ( not ( = ?auto_889646 ?auto_889647 ) ) ( not ( = ?auto_889646 ?auto_889648 ) ) ( not ( = ?auto_889646 ?auto_889649 ) ) ( not ( = ?auto_889647 ?auto_889648 ) ) ( not ( = ?auto_889647 ?auto_889649 ) ) ( not ( = ?auto_889648 ?auto_889649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889648 ?auto_889649 )
      ( !STACK ?auto_889648 ?auto_889647 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_889672 - BLOCK
      ?auto_889673 - BLOCK
      ?auto_889674 - BLOCK
      ?auto_889675 - BLOCK
      ?auto_889676 - BLOCK
      ?auto_889677 - BLOCK
      ?auto_889678 - BLOCK
    )
    :vars
    (
      ?auto_889679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889678 ?auto_889679 ) ( ON-TABLE ?auto_889672 ) ( ON ?auto_889673 ?auto_889672 ) ( ON ?auto_889674 ?auto_889673 ) ( ON ?auto_889675 ?auto_889674 ) ( ON ?auto_889676 ?auto_889675 ) ( not ( = ?auto_889672 ?auto_889673 ) ) ( not ( = ?auto_889672 ?auto_889674 ) ) ( not ( = ?auto_889672 ?auto_889675 ) ) ( not ( = ?auto_889672 ?auto_889676 ) ) ( not ( = ?auto_889672 ?auto_889677 ) ) ( not ( = ?auto_889672 ?auto_889678 ) ) ( not ( = ?auto_889672 ?auto_889679 ) ) ( not ( = ?auto_889673 ?auto_889674 ) ) ( not ( = ?auto_889673 ?auto_889675 ) ) ( not ( = ?auto_889673 ?auto_889676 ) ) ( not ( = ?auto_889673 ?auto_889677 ) ) ( not ( = ?auto_889673 ?auto_889678 ) ) ( not ( = ?auto_889673 ?auto_889679 ) ) ( not ( = ?auto_889674 ?auto_889675 ) ) ( not ( = ?auto_889674 ?auto_889676 ) ) ( not ( = ?auto_889674 ?auto_889677 ) ) ( not ( = ?auto_889674 ?auto_889678 ) ) ( not ( = ?auto_889674 ?auto_889679 ) ) ( not ( = ?auto_889675 ?auto_889676 ) ) ( not ( = ?auto_889675 ?auto_889677 ) ) ( not ( = ?auto_889675 ?auto_889678 ) ) ( not ( = ?auto_889675 ?auto_889679 ) ) ( not ( = ?auto_889676 ?auto_889677 ) ) ( not ( = ?auto_889676 ?auto_889678 ) ) ( not ( = ?auto_889676 ?auto_889679 ) ) ( not ( = ?auto_889677 ?auto_889678 ) ) ( not ( = ?auto_889677 ?auto_889679 ) ) ( not ( = ?auto_889678 ?auto_889679 ) ) ( CLEAR ?auto_889676 ) ( ON ?auto_889677 ?auto_889678 ) ( CLEAR ?auto_889677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_889672 ?auto_889673 ?auto_889674 ?auto_889675 ?auto_889676 ?auto_889677 )
      ( MAKE-7PILE ?auto_889672 ?auto_889673 ?auto_889674 ?auto_889675 ?auto_889676 ?auto_889677 ?auto_889678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_889702 - BLOCK
      ?auto_889703 - BLOCK
      ?auto_889704 - BLOCK
      ?auto_889705 - BLOCK
      ?auto_889706 - BLOCK
      ?auto_889707 - BLOCK
      ?auto_889708 - BLOCK
    )
    :vars
    (
      ?auto_889709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889708 ?auto_889709 ) ( ON-TABLE ?auto_889702 ) ( ON ?auto_889703 ?auto_889702 ) ( ON ?auto_889704 ?auto_889703 ) ( ON ?auto_889705 ?auto_889704 ) ( not ( = ?auto_889702 ?auto_889703 ) ) ( not ( = ?auto_889702 ?auto_889704 ) ) ( not ( = ?auto_889702 ?auto_889705 ) ) ( not ( = ?auto_889702 ?auto_889706 ) ) ( not ( = ?auto_889702 ?auto_889707 ) ) ( not ( = ?auto_889702 ?auto_889708 ) ) ( not ( = ?auto_889702 ?auto_889709 ) ) ( not ( = ?auto_889703 ?auto_889704 ) ) ( not ( = ?auto_889703 ?auto_889705 ) ) ( not ( = ?auto_889703 ?auto_889706 ) ) ( not ( = ?auto_889703 ?auto_889707 ) ) ( not ( = ?auto_889703 ?auto_889708 ) ) ( not ( = ?auto_889703 ?auto_889709 ) ) ( not ( = ?auto_889704 ?auto_889705 ) ) ( not ( = ?auto_889704 ?auto_889706 ) ) ( not ( = ?auto_889704 ?auto_889707 ) ) ( not ( = ?auto_889704 ?auto_889708 ) ) ( not ( = ?auto_889704 ?auto_889709 ) ) ( not ( = ?auto_889705 ?auto_889706 ) ) ( not ( = ?auto_889705 ?auto_889707 ) ) ( not ( = ?auto_889705 ?auto_889708 ) ) ( not ( = ?auto_889705 ?auto_889709 ) ) ( not ( = ?auto_889706 ?auto_889707 ) ) ( not ( = ?auto_889706 ?auto_889708 ) ) ( not ( = ?auto_889706 ?auto_889709 ) ) ( not ( = ?auto_889707 ?auto_889708 ) ) ( not ( = ?auto_889707 ?auto_889709 ) ) ( not ( = ?auto_889708 ?auto_889709 ) ) ( ON ?auto_889707 ?auto_889708 ) ( CLEAR ?auto_889705 ) ( ON ?auto_889706 ?auto_889707 ) ( CLEAR ?auto_889706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_889702 ?auto_889703 ?auto_889704 ?auto_889705 ?auto_889706 )
      ( MAKE-7PILE ?auto_889702 ?auto_889703 ?auto_889704 ?auto_889705 ?auto_889706 ?auto_889707 ?auto_889708 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_889732 - BLOCK
      ?auto_889733 - BLOCK
      ?auto_889734 - BLOCK
      ?auto_889735 - BLOCK
      ?auto_889736 - BLOCK
      ?auto_889737 - BLOCK
      ?auto_889738 - BLOCK
    )
    :vars
    (
      ?auto_889739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889738 ?auto_889739 ) ( ON-TABLE ?auto_889732 ) ( ON ?auto_889733 ?auto_889732 ) ( ON ?auto_889734 ?auto_889733 ) ( not ( = ?auto_889732 ?auto_889733 ) ) ( not ( = ?auto_889732 ?auto_889734 ) ) ( not ( = ?auto_889732 ?auto_889735 ) ) ( not ( = ?auto_889732 ?auto_889736 ) ) ( not ( = ?auto_889732 ?auto_889737 ) ) ( not ( = ?auto_889732 ?auto_889738 ) ) ( not ( = ?auto_889732 ?auto_889739 ) ) ( not ( = ?auto_889733 ?auto_889734 ) ) ( not ( = ?auto_889733 ?auto_889735 ) ) ( not ( = ?auto_889733 ?auto_889736 ) ) ( not ( = ?auto_889733 ?auto_889737 ) ) ( not ( = ?auto_889733 ?auto_889738 ) ) ( not ( = ?auto_889733 ?auto_889739 ) ) ( not ( = ?auto_889734 ?auto_889735 ) ) ( not ( = ?auto_889734 ?auto_889736 ) ) ( not ( = ?auto_889734 ?auto_889737 ) ) ( not ( = ?auto_889734 ?auto_889738 ) ) ( not ( = ?auto_889734 ?auto_889739 ) ) ( not ( = ?auto_889735 ?auto_889736 ) ) ( not ( = ?auto_889735 ?auto_889737 ) ) ( not ( = ?auto_889735 ?auto_889738 ) ) ( not ( = ?auto_889735 ?auto_889739 ) ) ( not ( = ?auto_889736 ?auto_889737 ) ) ( not ( = ?auto_889736 ?auto_889738 ) ) ( not ( = ?auto_889736 ?auto_889739 ) ) ( not ( = ?auto_889737 ?auto_889738 ) ) ( not ( = ?auto_889737 ?auto_889739 ) ) ( not ( = ?auto_889738 ?auto_889739 ) ) ( ON ?auto_889737 ?auto_889738 ) ( ON ?auto_889736 ?auto_889737 ) ( CLEAR ?auto_889734 ) ( ON ?auto_889735 ?auto_889736 ) ( CLEAR ?auto_889735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_889732 ?auto_889733 ?auto_889734 ?auto_889735 )
      ( MAKE-7PILE ?auto_889732 ?auto_889733 ?auto_889734 ?auto_889735 ?auto_889736 ?auto_889737 ?auto_889738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_889762 - BLOCK
      ?auto_889763 - BLOCK
      ?auto_889764 - BLOCK
      ?auto_889765 - BLOCK
      ?auto_889766 - BLOCK
      ?auto_889767 - BLOCK
      ?auto_889768 - BLOCK
    )
    :vars
    (
      ?auto_889769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889768 ?auto_889769 ) ( ON-TABLE ?auto_889762 ) ( ON ?auto_889763 ?auto_889762 ) ( not ( = ?auto_889762 ?auto_889763 ) ) ( not ( = ?auto_889762 ?auto_889764 ) ) ( not ( = ?auto_889762 ?auto_889765 ) ) ( not ( = ?auto_889762 ?auto_889766 ) ) ( not ( = ?auto_889762 ?auto_889767 ) ) ( not ( = ?auto_889762 ?auto_889768 ) ) ( not ( = ?auto_889762 ?auto_889769 ) ) ( not ( = ?auto_889763 ?auto_889764 ) ) ( not ( = ?auto_889763 ?auto_889765 ) ) ( not ( = ?auto_889763 ?auto_889766 ) ) ( not ( = ?auto_889763 ?auto_889767 ) ) ( not ( = ?auto_889763 ?auto_889768 ) ) ( not ( = ?auto_889763 ?auto_889769 ) ) ( not ( = ?auto_889764 ?auto_889765 ) ) ( not ( = ?auto_889764 ?auto_889766 ) ) ( not ( = ?auto_889764 ?auto_889767 ) ) ( not ( = ?auto_889764 ?auto_889768 ) ) ( not ( = ?auto_889764 ?auto_889769 ) ) ( not ( = ?auto_889765 ?auto_889766 ) ) ( not ( = ?auto_889765 ?auto_889767 ) ) ( not ( = ?auto_889765 ?auto_889768 ) ) ( not ( = ?auto_889765 ?auto_889769 ) ) ( not ( = ?auto_889766 ?auto_889767 ) ) ( not ( = ?auto_889766 ?auto_889768 ) ) ( not ( = ?auto_889766 ?auto_889769 ) ) ( not ( = ?auto_889767 ?auto_889768 ) ) ( not ( = ?auto_889767 ?auto_889769 ) ) ( not ( = ?auto_889768 ?auto_889769 ) ) ( ON ?auto_889767 ?auto_889768 ) ( ON ?auto_889766 ?auto_889767 ) ( ON ?auto_889765 ?auto_889766 ) ( CLEAR ?auto_889763 ) ( ON ?auto_889764 ?auto_889765 ) ( CLEAR ?auto_889764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_889762 ?auto_889763 ?auto_889764 )
      ( MAKE-7PILE ?auto_889762 ?auto_889763 ?auto_889764 ?auto_889765 ?auto_889766 ?auto_889767 ?auto_889768 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_889792 - BLOCK
      ?auto_889793 - BLOCK
      ?auto_889794 - BLOCK
      ?auto_889795 - BLOCK
      ?auto_889796 - BLOCK
      ?auto_889797 - BLOCK
      ?auto_889798 - BLOCK
    )
    :vars
    (
      ?auto_889799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889798 ?auto_889799 ) ( ON-TABLE ?auto_889792 ) ( not ( = ?auto_889792 ?auto_889793 ) ) ( not ( = ?auto_889792 ?auto_889794 ) ) ( not ( = ?auto_889792 ?auto_889795 ) ) ( not ( = ?auto_889792 ?auto_889796 ) ) ( not ( = ?auto_889792 ?auto_889797 ) ) ( not ( = ?auto_889792 ?auto_889798 ) ) ( not ( = ?auto_889792 ?auto_889799 ) ) ( not ( = ?auto_889793 ?auto_889794 ) ) ( not ( = ?auto_889793 ?auto_889795 ) ) ( not ( = ?auto_889793 ?auto_889796 ) ) ( not ( = ?auto_889793 ?auto_889797 ) ) ( not ( = ?auto_889793 ?auto_889798 ) ) ( not ( = ?auto_889793 ?auto_889799 ) ) ( not ( = ?auto_889794 ?auto_889795 ) ) ( not ( = ?auto_889794 ?auto_889796 ) ) ( not ( = ?auto_889794 ?auto_889797 ) ) ( not ( = ?auto_889794 ?auto_889798 ) ) ( not ( = ?auto_889794 ?auto_889799 ) ) ( not ( = ?auto_889795 ?auto_889796 ) ) ( not ( = ?auto_889795 ?auto_889797 ) ) ( not ( = ?auto_889795 ?auto_889798 ) ) ( not ( = ?auto_889795 ?auto_889799 ) ) ( not ( = ?auto_889796 ?auto_889797 ) ) ( not ( = ?auto_889796 ?auto_889798 ) ) ( not ( = ?auto_889796 ?auto_889799 ) ) ( not ( = ?auto_889797 ?auto_889798 ) ) ( not ( = ?auto_889797 ?auto_889799 ) ) ( not ( = ?auto_889798 ?auto_889799 ) ) ( ON ?auto_889797 ?auto_889798 ) ( ON ?auto_889796 ?auto_889797 ) ( ON ?auto_889795 ?auto_889796 ) ( ON ?auto_889794 ?auto_889795 ) ( CLEAR ?auto_889792 ) ( ON ?auto_889793 ?auto_889794 ) ( CLEAR ?auto_889793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_889792 ?auto_889793 )
      ( MAKE-7PILE ?auto_889792 ?auto_889793 ?auto_889794 ?auto_889795 ?auto_889796 ?auto_889797 ?auto_889798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_889822 - BLOCK
      ?auto_889823 - BLOCK
      ?auto_889824 - BLOCK
      ?auto_889825 - BLOCK
      ?auto_889826 - BLOCK
      ?auto_889827 - BLOCK
      ?auto_889828 - BLOCK
    )
    :vars
    (
      ?auto_889829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889828 ?auto_889829 ) ( not ( = ?auto_889822 ?auto_889823 ) ) ( not ( = ?auto_889822 ?auto_889824 ) ) ( not ( = ?auto_889822 ?auto_889825 ) ) ( not ( = ?auto_889822 ?auto_889826 ) ) ( not ( = ?auto_889822 ?auto_889827 ) ) ( not ( = ?auto_889822 ?auto_889828 ) ) ( not ( = ?auto_889822 ?auto_889829 ) ) ( not ( = ?auto_889823 ?auto_889824 ) ) ( not ( = ?auto_889823 ?auto_889825 ) ) ( not ( = ?auto_889823 ?auto_889826 ) ) ( not ( = ?auto_889823 ?auto_889827 ) ) ( not ( = ?auto_889823 ?auto_889828 ) ) ( not ( = ?auto_889823 ?auto_889829 ) ) ( not ( = ?auto_889824 ?auto_889825 ) ) ( not ( = ?auto_889824 ?auto_889826 ) ) ( not ( = ?auto_889824 ?auto_889827 ) ) ( not ( = ?auto_889824 ?auto_889828 ) ) ( not ( = ?auto_889824 ?auto_889829 ) ) ( not ( = ?auto_889825 ?auto_889826 ) ) ( not ( = ?auto_889825 ?auto_889827 ) ) ( not ( = ?auto_889825 ?auto_889828 ) ) ( not ( = ?auto_889825 ?auto_889829 ) ) ( not ( = ?auto_889826 ?auto_889827 ) ) ( not ( = ?auto_889826 ?auto_889828 ) ) ( not ( = ?auto_889826 ?auto_889829 ) ) ( not ( = ?auto_889827 ?auto_889828 ) ) ( not ( = ?auto_889827 ?auto_889829 ) ) ( not ( = ?auto_889828 ?auto_889829 ) ) ( ON ?auto_889827 ?auto_889828 ) ( ON ?auto_889826 ?auto_889827 ) ( ON ?auto_889825 ?auto_889826 ) ( ON ?auto_889824 ?auto_889825 ) ( ON ?auto_889823 ?auto_889824 ) ( ON ?auto_889822 ?auto_889823 ) ( CLEAR ?auto_889822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_889822 )
      ( MAKE-7PILE ?auto_889822 ?auto_889823 ?auto_889824 ?auto_889825 ?auto_889826 ?auto_889827 ?auto_889828 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_889853 - BLOCK
      ?auto_889854 - BLOCK
      ?auto_889855 - BLOCK
      ?auto_889856 - BLOCK
      ?auto_889857 - BLOCK
      ?auto_889858 - BLOCK
      ?auto_889859 - BLOCK
      ?auto_889860 - BLOCK
    )
    :vars
    (
      ?auto_889861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_889859 ) ( ON ?auto_889860 ?auto_889861 ) ( CLEAR ?auto_889860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_889853 ) ( ON ?auto_889854 ?auto_889853 ) ( ON ?auto_889855 ?auto_889854 ) ( ON ?auto_889856 ?auto_889855 ) ( ON ?auto_889857 ?auto_889856 ) ( ON ?auto_889858 ?auto_889857 ) ( ON ?auto_889859 ?auto_889858 ) ( not ( = ?auto_889853 ?auto_889854 ) ) ( not ( = ?auto_889853 ?auto_889855 ) ) ( not ( = ?auto_889853 ?auto_889856 ) ) ( not ( = ?auto_889853 ?auto_889857 ) ) ( not ( = ?auto_889853 ?auto_889858 ) ) ( not ( = ?auto_889853 ?auto_889859 ) ) ( not ( = ?auto_889853 ?auto_889860 ) ) ( not ( = ?auto_889853 ?auto_889861 ) ) ( not ( = ?auto_889854 ?auto_889855 ) ) ( not ( = ?auto_889854 ?auto_889856 ) ) ( not ( = ?auto_889854 ?auto_889857 ) ) ( not ( = ?auto_889854 ?auto_889858 ) ) ( not ( = ?auto_889854 ?auto_889859 ) ) ( not ( = ?auto_889854 ?auto_889860 ) ) ( not ( = ?auto_889854 ?auto_889861 ) ) ( not ( = ?auto_889855 ?auto_889856 ) ) ( not ( = ?auto_889855 ?auto_889857 ) ) ( not ( = ?auto_889855 ?auto_889858 ) ) ( not ( = ?auto_889855 ?auto_889859 ) ) ( not ( = ?auto_889855 ?auto_889860 ) ) ( not ( = ?auto_889855 ?auto_889861 ) ) ( not ( = ?auto_889856 ?auto_889857 ) ) ( not ( = ?auto_889856 ?auto_889858 ) ) ( not ( = ?auto_889856 ?auto_889859 ) ) ( not ( = ?auto_889856 ?auto_889860 ) ) ( not ( = ?auto_889856 ?auto_889861 ) ) ( not ( = ?auto_889857 ?auto_889858 ) ) ( not ( = ?auto_889857 ?auto_889859 ) ) ( not ( = ?auto_889857 ?auto_889860 ) ) ( not ( = ?auto_889857 ?auto_889861 ) ) ( not ( = ?auto_889858 ?auto_889859 ) ) ( not ( = ?auto_889858 ?auto_889860 ) ) ( not ( = ?auto_889858 ?auto_889861 ) ) ( not ( = ?auto_889859 ?auto_889860 ) ) ( not ( = ?auto_889859 ?auto_889861 ) ) ( not ( = ?auto_889860 ?auto_889861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_889860 ?auto_889861 )
      ( !STACK ?auto_889860 ?auto_889859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_889887 - BLOCK
      ?auto_889888 - BLOCK
      ?auto_889889 - BLOCK
      ?auto_889890 - BLOCK
      ?auto_889891 - BLOCK
      ?auto_889892 - BLOCK
      ?auto_889893 - BLOCK
      ?auto_889894 - BLOCK
    )
    :vars
    (
      ?auto_889895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889894 ?auto_889895 ) ( ON-TABLE ?auto_889887 ) ( ON ?auto_889888 ?auto_889887 ) ( ON ?auto_889889 ?auto_889888 ) ( ON ?auto_889890 ?auto_889889 ) ( ON ?auto_889891 ?auto_889890 ) ( ON ?auto_889892 ?auto_889891 ) ( not ( = ?auto_889887 ?auto_889888 ) ) ( not ( = ?auto_889887 ?auto_889889 ) ) ( not ( = ?auto_889887 ?auto_889890 ) ) ( not ( = ?auto_889887 ?auto_889891 ) ) ( not ( = ?auto_889887 ?auto_889892 ) ) ( not ( = ?auto_889887 ?auto_889893 ) ) ( not ( = ?auto_889887 ?auto_889894 ) ) ( not ( = ?auto_889887 ?auto_889895 ) ) ( not ( = ?auto_889888 ?auto_889889 ) ) ( not ( = ?auto_889888 ?auto_889890 ) ) ( not ( = ?auto_889888 ?auto_889891 ) ) ( not ( = ?auto_889888 ?auto_889892 ) ) ( not ( = ?auto_889888 ?auto_889893 ) ) ( not ( = ?auto_889888 ?auto_889894 ) ) ( not ( = ?auto_889888 ?auto_889895 ) ) ( not ( = ?auto_889889 ?auto_889890 ) ) ( not ( = ?auto_889889 ?auto_889891 ) ) ( not ( = ?auto_889889 ?auto_889892 ) ) ( not ( = ?auto_889889 ?auto_889893 ) ) ( not ( = ?auto_889889 ?auto_889894 ) ) ( not ( = ?auto_889889 ?auto_889895 ) ) ( not ( = ?auto_889890 ?auto_889891 ) ) ( not ( = ?auto_889890 ?auto_889892 ) ) ( not ( = ?auto_889890 ?auto_889893 ) ) ( not ( = ?auto_889890 ?auto_889894 ) ) ( not ( = ?auto_889890 ?auto_889895 ) ) ( not ( = ?auto_889891 ?auto_889892 ) ) ( not ( = ?auto_889891 ?auto_889893 ) ) ( not ( = ?auto_889891 ?auto_889894 ) ) ( not ( = ?auto_889891 ?auto_889895 ) ) ( not ( = ?auto_889892 ?auto_889893 ) ) ( not ( = ?auto_889892 ?auto_889894 ) ) ( not ( = ?auto_889892 ?auto_889895 ) ) ( not ( = ?auto_889893 ?auto_889894 ) ) ( not ( = ?auto_889893 ?auto_889895 ) ) ( not ( = ?auto_889894 ?auto_889895 ) ) ( CLEAR ?auto_889892 ) ( ON ?auto_889893 ?auto_889894 ) ( CLEAR ?auto_889893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_889887 ?auto_889888 ?auto_889889 ?auto_889890 ?auto_889891 ?auto_889892 ?auto_889893 )
      ( MAKE-8PILE ?auto_889887 ?auto_889888 ?auto_889889 ?auto_889890 ?auto_889891 ?auto_889892 ?auto_889893 ?auto_889894 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_889921 - BLOCK
      ?auto_889922 - BLOCK
      ?auto_889923 - BLOCK
      ?auto_889924 - BLOCK
      ?auto_889925 - BLOCK
      ?auto_889926 - BLOCK
      ?auto_889927 - BLOCK
      ?auto_889928 - BLOCK
    )
    :vars
    (
      ?auto_889929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889928 ?auto_889929 ) ( ON-TABLE ?auto_889921 ) ( ON ?auto_889922 ?auto_889921 ) ( ON ?auto_889923 ?auto_889922 ) ( ON ?auto_889924 ?auto_889923 ) ( ON ?auto_889925 ?auto_889924 ) ( not ( = ?auto_889921 ?auto_889922 ) ) ( not ( = ?auto_889921 ?auto_889923 ) ) ( not ( = ?auto_889921 ?auto_889924 ) ) ( not ( = ?auto_889921 ?auto_889925 ) ) ( not ( = ?auto_889921 ?auto_889926 ) ) ( not ( = ?auto_889921 ?auto_889927 ) ) ( not ( = ?auto_889921 ?auto_889928 ) ) ( not ( = ?auto_889921 ?auto_889929 ) ) ( not ( = ?auto_889922 ?auto_889923 ) ) ( not ( = ?auto_889922 ?auto_889924 ) ) ( not ( = ?auto_889922 ?auto_889925 ) ) ( not ( = ?auto_889922 ?auto_889926 ) ) ( not ( = ?auto_889922 ?auto_889927 ) ) ( not ( = ?auto_889922 ?auto_889928 ) ) ( not ( = ?auto_889922 ?auto_889929 ) ) ( not ( = ?auto_889923 ?auto_889924 ) ) ( not ( = ?auto_889923 ?auto_889925 ) ) ( not ( = ?auto_889923 ?auto_889926 ) ) ( not ( = ?auto_889923 ?auto_889927 ) ) ( not ( = ?auto_889923 ?auto_889928 ) ) ( not ( = ?auto_889923 ?auto_889929 ) ) ( not ( = ?auto_889924 ?auto_889925 ) ) ( not ( = ?auto_889924 ?auto_889926 ) ) ( not ( = ?auto_889924 ?auto_889927 ) ) ( not ( = ?auto_889924 ?auto_889928 ) ) ( not ( = ?auto_889924 ?auto_889929 ) ) ( not ( = ?auto_889925 ?auto_889926 ) ) ( not ( = ?auto_889925 ?auto_889927 ) ) ( not ( = ?auto_889925 ?auto_889928 ) ) ( not ( = ?auto_889925 ?auto_889929 ) ) ( not ( = ?auto_889926 ?auto_889927 ) ) ( not ( = ?auto_889926 ?auto_889928 ) ) ( not ( = ?auto_889926 ?auto_889929 ) ) ( not ( = ?auto_889927 ?auto_889928 ) ) ( not ( = ?auto_889927 ?auto_889929 ) ) ( not ( = ?auto_889928 ?auto_889929 ) ) ( ON ?auto_889927 ?auto_889928 ) ( CLEAR ?auto_889925 ) ( ON ?auto_889926 ?auto_889927 ) ( CLEAR ?auto_889926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_889921 ?auto_889922 ?auto_889923 ?auto_889924 ?auto_889925 ?auto_889926 )
      ( MAKE-8PILE ?auto_889921 ?auto_889922 ?auto_889923 ?auto_889924 ?auto_889925 ?auto_889926 ?auto_889927 ?auto_889928 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_889955 - BLOCK
      ?auto_889956 - BLOCK
      ?auto_889957 - BLOCK
      ?auto_889958 - BLOCK
      ?auto_889959 - BLOCK
      ?auto_889960 - BLOCK
      ?auto_889961 - BLOCK
      ?auto_889962 - BLOCK
    )
    :vars
    (
      ?auto_889963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889962 ?auto_889963 ) ( ON-TABLE ?auto_889955 ) ( ON ?auto_889956 ?auto_889955 ) ( ON ?auto_889957 ?auto_889956 ) ( ON ?auto_889958 ?auto_889957 ) ( not ( = ?auto_889955 ?auto_889956 ) ) ( not ( = ?auto_889955 ?auto_889957 ) ) ( not ( = ?auto_889955 ?auto_889958 ) ) ( not ( = ?auto_889955 ?auto_889959 ) ) ( not ( = ?auto_889955 ?auto_889960 ) ) ( not ( = ?auto_889955 ?auto_889961 ) ) ( not ( = ?auto_889955 ?auto_889962 ) ) ( not ( = ?auto_889955 ?auto_889963 ) ) ( not ( = ?auto_889956 ?auto_889957 ) ) ( not ( = ?auto_889956 ?auto_889958 ) ) ( not ( = ?auto_889956 ?auto_889959 ) ) ( not ( = ?auto_889956 ?auto_889960 ) ) ( not ( = ?auto_889956 ?auto_889961 ) ) ( not ( = ?auto_889956 ?auto_889962 ) ) ( not ( = ?auto_889956 ?auto_889963 ) ) ( not ( = ?auto_889957 ?auto_889958 ) ) ( not ( = ?auto_889957 ?auto_889959 ) ) ( not ( = ?auto_889957 ?auto_889960 ) ) ( not ( = ?auto_889957 ?auto_889961 ) ) ( not ( = ?auto_889957 ?auto_889962 ) ) ( not ( = ?auto_889957 ?auto_889963 ) ) ( not ( = ?auto_889958 ?auto_889959 ) ) ( not ( = ?auto_889958 ?auto_889960 ) ) ( not ( = ?auto_889958 ?auto_889961 ) ) ( not ( = ?auto_889958 ?auto_889962 ) ) ( not ( = ?auto_889958 ?auto_889963 ) ) ( not ( = ?auto_889959 ?auto_889960 ) ) ( not ( = ?auto_889959 ?auto_889961 ) ) ( not ( = ?auto_889959 ?auto_889962 ) ) ( not ( = ?auto_889959 ?auto_889963 ) ) ( not ( = ?auto_889960 ?auto_889961 ) ) ( not ( = ?auto_889960 ?auto_889962 ) ) ( not ( = ?auto_889960 ?auto_889963 ) ) ( not ( = ?auto_889961 ?auto_889962 ) ) ( not ( = ?auto_889961 ?auto_889963 ) ) ( not ( = ?auto_889962 ?auto_889963 ) ) ( ON ?auto_889961 ?auto_889962 ) ( ON ?auto_889960 ?auto_889961 ) ( CLEAR ?auto_889958 ) ( ON ?auto_889959 ?auto_889960 ) ( CLEAR ?auto_889959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_889955 ?auto_889956 ?auto_889957 ?auto_889958 ?auto_889959 )
      ( MAKE-8PILE ?auto_889955 ?auto_889956 ?auto_889957 ?auto_889958 ?auto_889959 ?auto_889960 ?auto_889961 ?auto_889962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_889989 - BLOCK
      ?auto_889990 - BLOCK
      ?auto_889991 - BLOCK
      ?auto_889992 - BLOCK
      ?auto_889993 - BLOCK
      ?auto_889994 - BLOCK
      ?auto_889995 - BLOCK
      ?auto_889996 - BLOCK
    )
    :vars
    (
      ?auto_889997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_889996 ?auto_889997 ) ( ON-TABLE ?auto_889989 ) ( ON ?auto_889990 ?auto_889989 ) ( ON ?auto_889991 ?auto_889990 ) ( not ( = ?auto_889989 ?auto_889990 ) ) ( not ( = ?auto_889989 ?auto_889991 ) ) ( not ( = ?auto_889989 ?auto_889992 ) ) ( not ( = ?auto_889989 ?auto_889993 ) ) ( not ( = ?auto_889989 ?auto_889994 ) ) ( not ( = ?auto_889989 ?auto_889995 ) ) ( not ( = ?auto_889989 ?auto_889996 ) ) ( not ( = ?auto_889989 ?auto_889997 ) ) ( not ( = ?auto_889990 ?auto_889991 ) ) ( not ( = ?auto_889990 ?auto_889992 ) ) ( not ( = ?auto_889990 ?auto_889993 ) ) ( not ( = ?auto_889990 ?auto_889994 ) ) ( not ( = ?auto_889990 ?auto_889995 ) ) ( not ( = ?auto_889990 ?auto_889996 ) ) ( not ( = ?auto_889990 ?auto_889997 ) ) ( not ( = ?auto_889991 ?auto_889992 ) ) ( not ( = ?auto_889991 ?auto_889993 ) ) ( not ( = ?auto_889991 ?auto_889994 ) ) ( not ( = ?auto_889991 ?auto_889995 ) ) ( not ( = ?auto_889991 ?auto_889996 ) ) ( not ( = ?auto_889991 ?auto_889997 ) ) ( not ( = ?auto_889992 ?auto_889993 ) ) ( not ( = ?auto_889992 ?auto_889994 ) ) ( not ( = ?auto_889992 ?auto_889995 ) ) ( not ( = ?auto_889992 ?auto_889996 ) ) ( not ( = ?auto_889992 ?auto_889997 ) ) ( not ( = ?auto_889993 ?auto_889994 ) ) ( not ( = ?auto_889993 ?auto_889995 ) ) ( not ( = ?auto_889993 ?auto_889996 ) ) ( not ( = ?auto_889993 ?auto_889997 ) ) ( not ( = ?auto_889994 ?auto_889995 ) ) ( not ( = ?auto_889994 ?auto_889996 ) ) ( not ( = ?auto_889994 ?auto_889997 ) ) ( not ( = ?auto_889995 ?auto_889996 ) ) ( not ( = ?auto_889995 ?auto_889997 ) ) ( not ( = ?auto_889996 ?auto_889997 ) ) ( ON ?auto_889995 ?auto_889996 ) ( ON ?auto_889994 ?auto_889995 ) ( ON ?auto_889993 ?auto_889994 ) ( CLEAR ?auto_889991 ) ( ON ?auto_889992 ?auto_889993 ) ( CLEAR ?auto_889992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_889989 ?auto_889990 ?auto_889991 ?auto_889992 )
      ( MAKE-8PILE ?auto_889989 ?auto_889990 ?auto_889991 ?auto_889992 ?auto_889993 ?auto_889994 ?auto_889995 ?auto_889996 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_890023 - BLOCK
      ?auto_890024 - BLOCK
      ?auto_890025 - BLOCK
      ?auto_890026 - BLOCK
      ?auto_890027 - BLOCK
      ?auto_890028 - BLOCK
      ?auto_890029 - BLOCK
      ?auto_890030 - BLOCK
    )
    :vars
    (
      ?auto_890031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890030 ?auto_890031 ) ( ON-TABLE ?auto_890023 ) ( ON ?auto_890024 ?auto_890023 ) ( not ( = ?auto_890023 ?auto_890024 ) ) ( not ( = ?auto_890023 ?auto_890025 ) ) ( not ( = ?auto_890023 ?auto_890026 ) ) ( not ( = ?auto_890023 ?auto_890027 ) ) ( not ( = ?auto_890023 ?auto_890028 ) ) ( not ( = ?auto_890023 ?auto_890029 ) ) ( not ( = ?auto_890023 ?auto_890030 ) ) ( not ( = ?auto_890023 ?auto_890031 ) ) ( not ( = ?auto_890024 ?auto_890025 ) ) ( not ( = ?auto_890024 ?auto_890026 ) ) ( not ( = ?auto_890024 ?auto_890027 ) ) ( not ( = ?auto_890024 ?auto_890028 ) ) ( not ( = ?auto_890024 ?auto_890029 ) ) ( not ( = ?auto_890024 ?auto_890030 ) ) ( not ( = ?auto_890024 ?auto_890031 ) ) ( not ( = ?auto_890025 ?auto_890026 ) ) ( not ( = ?auto_890025 ?auto_890027 ) ) ( not ( = ?auto_890025 ?auto_890028 ) ) ( not ( = ?auto_890025 ?auto_890029 ) ) ( not ( = ?auto_890025 ?auto_890030 ) ) ( not ( = ?auto_890025 ?auto_890031 ) ) ( not ( = ?auto_890026 ?auto_890027 ) ) ( not ( = ?auto_890026 ?auto_890028 ) ) ( not ( = ?auto_890026 ?auto_890029 ) ) ( not ( = ?auto_890026 ?auto_890030 ) ) ( not ( = ?auto_890026 ?auto_890031 ) ) ( not ( = ?auto_890027 ?auto_890028 ) ) ( not ( = ?auto_890027 ?auto_890029 ) ) ( not ( = ?auto_890027 ?auto_890030 ) ) ( not ( = ?auto_890027 ?auto_890031 ) ) ( not ( = ?auto_890028 ?auto_890029 ) ) ( not ( = ?auto_890028 ?auto_890030 ) ) ( not ( = ?auto_890028 ?auto_890031 ) ) ( not ( = ?auto_890029 ?auto_890030 ) ) ( not ( = ?auto_890029 ?auto_890031 ) ) ( not ( = ?auto_890030 ?auto_890031 ) ) ( ON ?auto_890029 ?auto_890030 ) ( ON ?auto_890028 ?auto_890029 ) ( ON ?auto_890027 ?auto_890028 ) ( ON ?auto_890026 ?auto_890027 ) ( CLEAR ?auto_890024 ) ( ON ?auto_890025 ?auto_890026 ) ( CLEAR ?auto_890025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_890023 ?auto_890024 ?auto_890025 )
      ( MAKE-8PILE ?auto_890023 ?auto_890024 ?auto_890025 ?auto_890026 ?auto_890027 ?auto_890028 ?auto_890029 ?auto_890030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_890057 - BLOCK
      ?auto_890058 - BLOCK
      ?auto_890059 - BLOCK
      ?auto_890060 - BLOCK
      ?auto_890061 - BLOCK
      ?auto_890062 - BLOCK
      ?auto_890063 - BLOCK
      ?auto_890064 - BLOCK
    )
    :vars
    (
      ?auto_890065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890064 ?auto_890065 ) ( ON-TABLE ?auto_890057 ) ( not ( = ?auto_890057 ?auto_890058 ) ) ( not ( = ?auto_890057 ?auto_890059 ) ) ( not ( = ?auto_890057 ?auto_890060 ) ) ( not ( = ?auto_890057 ?auto_890061 ) ) ( not ( = ?auto_890057 ?auto_890062 ) ) ( not ( = ?auto_890057 ?auto_890063 ) ) ( not ( = ?auto_890057 ?auto_890064 ) ) ( not ( = ?auto_890057 ?auto_890065 ) ) ( not ( = ?auto_890058 ?auto_890059 ) ) ( not ( = ?auto_890058 ?auto_890060 ) ) ( not ( = ?auto_890058 ?auto_890061 ) ) ( not ( = ?auto_890058 ?auto_890062 ) ) ( not ( = ?auto_890058 ?auto_890063 ) ) ( not ( = ?auto_890058 ?auto_890064 ) ) ( not ( = ?auto_890058 ?auto_890065 ) ) ( not ( = ?auto_890059 ?auto_890060 ) ) ( not ( = ?auto_890059 ?auto_890061 ) ) ( not ( = ?auto_890059 ?auto_890062 ) ) ( not ( = ?auto_890059 ?auto_890063 ) ) ( not ( = ?auto_890059 ?auto_890064 ) ) ( not ( = ?auto_890059 ?auto_890065 ) ) ( not ( = ?auto_890060 ?auto_890061 ) ) ( not ( = ?auto_890060 ?auto_890062 ) ) ( not ( = ?auto_890060 ?auto_890063 ) ) ( not ( = ?auto_890060 ?auto_890064 ) ) ( not ( = ?auto_890060 ?auto_890065 ) ) ( not ( = ?auto_890061 ?auto_890062 ) ) ( not ( = ?auto_890061 ?auto_890063 ) ) ( not ( = ?auto_890061 ?auto_890064 ) ) ( not ( = ?auto_890061 ?auto_890065 ) ) ( not ( = ?auto_890062 ?auto_890063 ) ) ( not ( = ?auto_890062 ?auto_890064 ) ) ( not ( = ?auto_890062 ?auto_890065 ) ) ( not ( = ?auto_890063 ?auto_890064 ) ) ( not ( = ?auto_890063 ?auto_890065 ) ) ( not ( = ?auto_890064 ?auto_890065 ) ) ( ON ?auto_890063 ?auto_890064 ) ( ON ?auto_890062 ?auto_890063 ) ( ON ?auto_890061 ?auto_890062 ) ( ON ?auto_890060 ?auto_890061 ) ( ON ?auto_890059 ?auto_890060 ) ( CLEAR ?auto_890057 ) ( ON ?auto_890058 ?auto_890059 ) ( CLEAR ?auto_890058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_890057 ?auto_890058 )
      ( MAKE-8PILE ?auto_890057 ?auto_890058 ?auto_890059 ?auto_890060 ?auto_890061 ?auto_890062 ?auto_890063 ?auto_890064 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_890091 - BLOCK
      ?auto_890092 - BLOCK
      ?auto_890093 - BLOCK
      ?auto_890094 - BLOCK
      ?auto_890095 - BLOCK
      ?auto_890096 - BLOCK
      ?auto_890097 - BLOCK
      ?auto_890098 - BLOCK
    )
    :vars
    (
      ?auto_890099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890098 ?auto_890099 ) ( not ( = ?auto_890091 ?auto_890092 ) ) ( not ( = ?auto_890091 ?auto_890093 ) ) ( not ( = ?auto_890091 ?auto_890094 ) ) ( not ( = ?auto_890091 ?auto_890095 ) ) ( not ( = ?auto_890091 ?auto_890096 ) ) ( not ( = ?auto_890091 ?auto_890097 ) ) ( not ( = ?auto_890091 ?auto_890098 ) ) ( not ( = ?auto_890091 ?auto_890099 ) ) ( not ( = ?auto_890092 ?auto_890093 ) ) ( not ( = ?auto_890092 ?auto_890094 ) ) ( not ( = ?auto_890092 ?auto_890095 ) ) ( not ( = ?auto_890092 ?auto_890096 ) ) ( not ( = ?auto_890092 ?auto_890097 ) ) ( not ( = ?auto_890092 ?auto_890098 ) ) ( not ( = ?auto_890092 ?auto_890099 ) ) ( not ( = ?auto_890093 ?auto_890094 ) ) ( not ( = ?auto_890093 ?auto_890095 ) ) ( not ( = ?auto_890093 ?auto_890096 ) ) ( not ( = ?auto_890093 ?auto_890097 ) ) ( not ( = ?auto_890093 ?auto_890098 ) ) ( not ( = ?auto_890093 ?auto_890099 ) ) ( not ( = ?auto_890094 ?auto_890095 ) ) ( not ( = ?auto_890094 ?auto_890096 ) ) ( not ( = ?auto_890094 ?auto_890097 ) ) ( not ( = ?auto_890094 ?auto_890098 ) ) ( not ( = ?auto_890094 ?auto_890099 ) ) ( not ( = ?auto_890095 ?auto_890096 ) ) ( not ( = ?auto_890095 ?auto_890097 ) ) ( not ( = ?auto_890095 ?auto_890098 ) ) ( not ( = ?auto_890095 ?auto_890099 ) ) ( not ( = ?auto_890096 ?auto_890097 ) ) ( not ( = ?auto_890096 ?auto_890098 ) ) ( not ( = ?auto_890096 ?auto_890099 ) ) ( not ( = ?auto_890097 ?auto_890098 ) ) ( not ( = ?auto_890097 ?auto_890099 ) ) ( not ( = ?auto_890098 ?auto_890099 ) ) ( ON ?auto_890097 ?auto_890098 ) ( ON ?auto_890096 ?auto_890097 ) ( ON ?auto_890095 ?auto_890096 ) ( ON ?auto_890094 ?auto_890095 ) ( ON ?auto_890093 ?auto_890094 ) ( ON ?auto_890092 ?auto_890093 ) ( ON ?auto_890091 ?auto_890092 ) ( CLEAR ?auto_890091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_890091 )
      ( MAKE-8PILE ?auto_890091 ?auto_890092 ?auto_890093 ?auto_890094 ?auto_890095 ?auto_890096 ?auto_890097 ?auto_890098 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890126 - BLOCK
      ?auto_890127 - BLOCK
      ?auto_890128 - BLOCK
      ?auto_890129 - BLOCK
      ?auto_890130 - BLOCK
      ?auto_890131 - BLOCK
      ?auto_890132 - BLOCK
      ?auto_890133 - BLOCK
      ?auto_890134 - BLOCK
    )
    :vars
    (
      ?auto_890135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_890133 ) ( ON ?auto_890134 ?auto_890135 ) ( CLEAR ?auto_890134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_890126 ) ( ON ?auto_890127 ?auto_890126 ) ( ON ?auto_890128 ?auto_890127 ) ( ON ?auto_890129 ?auto_890128 ) ( ON ?auto_890130 ?auto_890129 ) ( ON ?auto_890131 ?auto_890130 ) ( ON ?auto_890132 ?auto_890131 ) ( ON ?auto_890133 ?auto_890132 ) ( not ( = ?auto_890126 ?auto_890127 ) ) ( not ( = ?auto_890126 ?auto_890128 ) ) ( not ( = ?auto_890126 ?auto_890129 ) ) ( not ( = ?auto_890126 ?auto_890130 ) ) ( not ( = ?auto_890126 ?auto_890131 ) ) ( not ( = ?auto_890126 ?auto_890132 ) ) ( not ( = ?auto_890126 ?auto_890133 ) ) ( not ( = ?auto_890126 ?auto_890134 ) ) ( not ( = ?auto_890126 ?auto_890135 ) ) ( not ( = ?auto_890127 ?auto_890128 ) ) ( not ( = ?auto_890127 ?auto_890129 ) ) ( not ( = ?auto_890127 ?auto_890130 ) ) ( not ( = ?auto_890127 ?auto_890131 ) ) ( not ( = ?auto_890127 ?auto_890132 ) ) ( not ( = ?auto_890127 ?auto_890133 ) ) ( not ( = ?auto_890127 ?auto_890134 ) ) ( not ( = ?auto_890127 ?auto_890135 ) ) ( not ( = ?auto_890128 ?auto_890129 ) ) ( not ( = ?auto_890128 ?auto_890130 ) ) ( not ( = ?auto_890128 ?auto_890131 ) ) ( not ( = ?auto_890128 ?auto_890132 ) ) ( not ( = ?auto_890128 ?auto_890133 ) ) ( not ( = ?auto_890128 ?auto_890134 ) ) ( not ( = ?auto_890128 ?auto_890135 ) ) ( not ( = ?auto_890129 ?auto_890130 ) ) ( not ( = ?auto_890129 ?auto_890131 ) ) ( not ( = ?auto_890129 ?auto_890132 ) ) ( not ( = ?auto_890129 ?auto_890133 ) ) ( not ( = ?auto_890129 ?auto_890134 ) ) ( not ( = ?auto_890129 ?auto_890135 ) ) ( not ( = ?auto_890130 ?auto_890131 ) ) ( not ( = ?auto_890130 ?auto_890132 ) ) ( not ( = ?auto_890130 ?auto_890133 ) ) ( not ( = ?auto_890130 ?auto_890134 ) ) ( not ( = ?auto_890130 ?auto_890135 ) ) ( not ( = ?auto_890131 ?auto_890132 ) ) ( not ( = ?auto_890131 ?auto_890133 ) ) ( not ( = ?auto_890131 ?auto_890134 ) ) ( not ( = ?auto_890131 ?auto_890135 ) ) ( not ( = ?auto_890132 ?auto_890133 ) ) ( not ( = ?auto_890132 ?auto_890134 ) ) ( not ( = ?auto_890132 ?auto_890135 ) ) ( not ( = ?auto_890133 ?auto_890134 ) ) ( not ( = ?auto_890133 ?auto_890135 ) ) ( not ( = ?auto_890134 ?auto_890135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_890134 ?auto_890135 )
      ( !STACK ?auto_890134 ?auto_890133 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890164 - BLOCK
      ?auto_890165 - BLOCK
      ?auto_890166 - BLOCK
      ?auto_890167 - BLOCK
      ?auto_890168 - BLOCK
      ?auto_890169 - BLOCK
      ?auto_890170 - BLOCK
      ?auto_890171 - BLOCK
      ?auto_890172 - BLOCK
    )
    :vars
    (
      ?auto_890173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890172 ?auto_890173 ) ( ON-TABLE ?auto_890164 ) ( ON ?auto_890165 ?auto_890164 ) ( ON ?auto_890166 ?auto_890165 ) ( ON ?auto_890167 ?auto_890166 ) ( ON ?auto_890168 ?auto_890167 ) ( ON ?auto_890169 ?auto_890168 ) ( ON ?auto_890170 ?auto_890169 ) ( not ( = ?auto_890164 ?auto_890165 ) ) ( not ( = ?auto_890164 ?auto_890166 ) ) ( not ( = ?auto_890164 ?auto_890167 ) ) ( not ( = ?auto_890164 ?auto_890168 ) ) ( not ( = ?auto_890164 ?auto_890169 ) ) ( not ( = ?auto_890164 ?auto_890170 ) ) ( not ( = ?auto_890164 ?auto_890171 ) ) ( not ( = ?auto_890164 ?auto_890172 ) ) ( not ( = ?auto_890164 ?auto_890173 ) ) ( not ( = ?auto_890165 ?auto_890166 ) ) ( not ( = ?auto_890165 ?auto_890167 ) ) ( not ( = ?auto_890165 ?auto_890168 ) ) ( not ( = ?auto_890165 ?auto_890169 ) ) ( not ( = ?auto_890165 ?auto_890170 ) ) ( not ( = ?auto_890165 ?auto_890171 ) ) ( not ( = ?auto_890165 ?auto_890172 ) ) ( not ( = ?auto_890165 ?auto_890173 ) ) ( not ( = ?auto_890166 ?auto_890167 ) ) ( not ( = ?auto_890166 ?auto_890168 ) ) ( not ( = ?auto_890166 ?auto_890169 ) ) ( not ( = ?auto_890166 ?auto_890170 ) ) ( not ( = ?auto_890166 ?auto_890171 ) ) ( not ( = ?auto_890166 ?auto_890172 ) ) ( not ( = ?auto_890166 ?auto_890173 ) ) ( not ( = ?auto_890167 ?auto_890168 ) ) ( not ( = ?auto_890167 ?auto_890169 ) ) ( not ( = ?auto_890167 ?auto_890170 ) ) ( not ( = ?auto_890167 ?auto_890171 ) ) ( not ( = ?auto_890167 ?auto_890172 ) ) ( not ( = ?auto_890167 ?auto_890173 ) ) ( not ( = ?auto_890168 ?auto_890169 ) ) ( not ( = ?auto_890168 ?auto_890170 ) ) ( not ( = ?auto_890168 ?auto_890171 ) ) ( not ( = ?auto_890168 ?auto_890172 ) ) ( not ( = ?auto_890168 ?auto_890173 ) ) ( not ( = ?auto_890169 ?auto_890170 ) ) ( not ( = ?auto_890169 ?auto_890171 ) ) ( not ( = ?auto_890169 ?auto_890172 ) ) ( not ( = ?auto_890169 ?auto_890173 ) ) ( not ( = ?auto_890170 ?auto_890171 ) ) ( not ( = ?auto_890170 ?auto_890172 ) ) ( not ( = ?auto_890170 ?auto_890173 ) ) ( not ( = ?auto_890171 ?auto_890172 ) ) ( not ( = ?auto_890171 ?auto_890173 ) ) ( not ( = ?auto_890172 ?auto_890173 ) ) ( CLEAR ?auto_890170 ) ( ON ?auto_890171 ?auto_890172 ) ( CLEAR ?auto_890171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_890164 ?auto_890165 ?auto_890166 ?auto_890167 ?auto_890168 ?auto_890169 ?auto_890170 ?auto_890171 )
      ( MAKE-9PILE ?auto_890164 ?auto_890165 ?auto_890166 ?auto_890167 ?auto_890168 ?auto_890169 ?auto_890170 ?auto_890171 ?auto_890172 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890202 - BLOCK
      ?auto_890203 - BLOCK
      ?auto_890204 - BLOCK
      ?auto_890205 - BLOCK
      ?auto_890206 - BLOCK
      ?auto_890207 - BLOCK
      ?auto_890208 - BLOCK
      ?auto_890209 - BLOCK
      ?auto_890210 - BLOCK
    )
    :vars
    (
      ?auto_890211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890210 ?auto_890211 ) ( ON-TABLE ?auto_890202 ) ( ON ?auto_890203 ?auto_890202 ) ( ON ?auto_890204 ?auto_890203 ) ( ON ?auto_890205 ?auto_890204 ) ( ON ?auto_890206 ?auto_890205 ) ( ON ?auto_890207 ?auto_890206 ) ( not ( = ?auto_890202 ?auto_890203 ) ) ( not ( = ?auto_890202 ?auto_890204 ) ) ( not ( = ?auto_890202 ?auto_890205 ) ) ( not ( = ?auto_890202 ?auto_890206 ) ) ( not ( = ?auto_890202 ?auto_890207 ) ) ( not ( = ?auto_890202 ?auto_890208 ) ) ( not ( = ?auto_890202 ?auto_890209 ) ) ( not ( = ?auto_890202 ?auto_890210 ) ) ( not ( = ?auto_890202 ?auto_890211 ) ) ( not ( = ?auto_890203 ?auto_890204 ) ) ( not ( = ?auto_890203 ?auto_890205 ) ) ( not ( = ?auto_890203 ?auto_890206 ) ) ( not ( = ?auto_890203 ?auto_890207 ) ) ( not ( = ?auto_890203 ?auto_890208 ) ) ( not ( = ?auto_890203 ?auto_890209 ) ) ( not ( = ?auto_890203 ?auto_890210 ) ) ( not ( = ?auto_890203 ?auto_890211 ) ) ( not ( = ?auto_890204 ?auto_890205 ) ) ( not ( = ?auto_890204 ?auto_890206 ) ) ( not ( = ?auto_890204 ?auto_890207 ) ) ( not ( = ?auto_890204 ?auto_890208 ) ) ( not ( = ?auto_890204 ?auto_890209 ) ) ( not ( = ?auto_890204 ?auto_890210 ) ) ( not ( = ?auto_890204 ?auto_890211 ) ) ( not ( = ?auto_890205 ?auto_890206 ) ) ( not ( = ?auto_890205 ?auto_890207 ) ) ( not ( = ?auto_890205 ?auto_890208 ) ) ( not ( = ?auto_890205 ?auto_890209 ) ) ( not ( = ?auto_890205 ?auto_890210 ) ) ( not ( = ?auto_890205 ?auto_890211 ) ) ( not ( = ?auto_890206 ?auto_890207 ) ) ( not ( = ?auto_890206 ?auto_890208 ) ) ( not ( = ?auto_890206 ?auto_890209 ) ) ( not ( = ?auto_890206 ?auto_890210 ) ) ( not ( = ?auto_890206 ?auto_890211 ) ) ( not ( = ?auto_890207 ?auto_890208 ) ) ( not ( = ?auto_890207 ?auto_890209 ) ) ( not ( = ?auto_890207 ?auto_890210 ) ) ( not ( = ?auto_890207 ?auto_890211 ) ) ( not ( = ?auto_890208 ?auto_890209 ) ) ( not ( = ?auto_890208 ?auto_890210 ) ) ( not ( = ?auto_890208 ?auto_890211 ) ) ( not ( = ?auto_890209 ?auto_890210 ) ) ( not ( = ?auto_890209 ?auto_890211 ) ) ( not ( = ?auto_890210 ?auto_890211 ) ) ( ON ?auto_890209 ?auto_890210 ) ( CLEAR ?auto_890207 ) ( ON ?auto_890208 ?auto_890209 ) ( CLEAR ?auto_890208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_890202 ?auto_890203 ?auto_890204 ?auto_890205 ?auto_890206 ?auto_890207 ?auto_890208 )
      ( MAKE-9PILE ?auto_890202 ?auto_890203 ?auto_890204 ?auto_890205 ?auto_890206 ?auto_890207 ?auto_890208 ?auto_890209 ?auto_890210 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890240 - BLOCK
      ?auto_890241 - BLOCK
      ?auto_890242 - BLOCK
      ?auto_890243 - BLOCK
      ?auto_890244 - BLOCK
      ?auto_890245 - BLOCK
      ?auto_890246 - BLOCK
      ?auto_890247 - BLOCK
      ?auto_890248 - BLOCK
    )
    :vars
    (
      ?auto_890249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890248 ?auto_890249 ) ( ON-TABLE ?auto_890240 ) ( ON ?auto_890241 ?auto_890240 ) ( ON ?auto_890242 ?auto_890241 ) ( ON ?auto_890243 ?auto_890242 ) ( ON ?auto_890244 ?auto_890243 ) ( not ( = ?auto_890240 ?auto_890241 ) ) ( not ( = ?auto_890240 ?auto_890242 ) ) ( not ( = ?auto_890240 ?auto_890243 ) ) ( not ( = ?auto_890240 ?auto_890244 ) ) ( not ( = ?auto_890240 ?auto_890245 ) ) ( not ( = ?auto_890240 ?auto_890246 ) ) ( not ( = ?auto_890240 ?auto_890247 ) ) ( not ( = ?auto_890240 ?auto_890248 ) ) ( not ( = ?auto_890240 ?auto_890249 ) ) ( not ( = ?auto_890241 ?auto_890242 ) ) ( not ( = ?auto_890241 ?auto_890243 ) ) ( not ( = ?auto_890241 ?auto_890244 ) ) ( not ( = ?auto_890241 ?auto_890245 ) ) ( not ( = ?auto_890241 ?auto_890246 ) ) ( not ( = ?auto_890241 ?auto_890247 ) ) ( not ( = ?auto_890241 ?auto_890248 ) ) ( not ( = ?auto_890241 ?auto_890249 ) ) ( not ( = ?auto_890242 ?auto_890243 ) ) ( not ( = ?auto_890242 ?auto_890244 ) ) ( not ( = ?auto_890242 ?auto_890245 ) ) ( not ( = ?auto_890242 ?auto_890246 ) ) ( not ( = ?auto_890242 ?auto_890247 ) ) ( not ( = ?auto_890242 ?auto_890248 ) ) ( not ( = ?auto_890242 ?auto_890249 ) ) ( not ( = ?auto_890243 ?auto_890244 ) ) ( not ( = ?auto_890243 ?auto_890245 ) ) ( not ( = ?auto_890243 ?auto_890246 ) ) ( not ( = ?auto_890243 ?auto_890247 ) ) ( not ( = ?auto_890243 ?auto_890248 ) ) ( not ( = ?auto_890243 ?auto_890249 ) ) ( not ( = ?auto_890244 ?auto_890245 ) ) ( not ( = ?auto_890244 ?auto_890246 ) ) ( not ( = ?auto_890244 ?auto_890247 ) ) ( not ( = ?auto_890244 ?auto_890248 ) ) ( not ( = ?auto_890244 ?auto_890249 ) ) ( not ( = ?auto_890245 ?auto_890246 ) ) ( not ( = ?auto_890245 ?auto_890247 ) ) ( not ( = ?auto_890245 ?auto_890248 ) ) ( not ( = ?auto_890245 ?auto_890249 ) ) ( not ( = ?auto_890246 ?auto_890247 ) ) ( not ( = ?auto_890246 ?auto_890248 ) ) ( not ( = ?auto_890246 ?auto_890249 ) ) ( not ( = ?auto_890247 ?auto_890248 ) ) ( not ( = ?auto_890247 ?auto_890249 ) ) ( not ( = ?auto_890248 ?auto_890249 ) ) ( ON ?auto_890247 ?auto_890248 ) ( ON ?auto_890246 ?auto_890247 ) ( CLEAR ?auto_890244 ) ( ON ?auto_890245 ?auto_890246 ) ( CLEAR ?auto_890245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_890240 ?auto_890241 ?auto_890242 ?auto_890243 ?auto_890244 ?auto_890245 )
      ( MAKE-9PILE ?auto_890240 ?auto_890241 ?auto_890242 ?auto_890243 ?auto_890244 ?auto_890245 ?auto_890246 ?auto_890247 ?auto_890248 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890278 - BLOCK
      ?auto_890279 - BLOCK
      ?auto_890280 - BLOCK
      ?auto_890281 - BLOCK
      ?auto_890282 - BLOCK
      ?auto_890283 - BLOCK
      ?auto_890284 - BLOCK
      ?auto_890285 - BLOCK
      ?auto_890286 - BLOCK
    )
    :vars
    (
      ?auto_890287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890286 ?auto_890287 ) ( ON-TABLE ?auto_890278 ) ( ON ?auto_890279 ?auto_890278 ) ( ON ?auto_890280 ?auto_890279 ) ( ON ?auto_890281 ?auto_890280 ) ( not ( = ?auto_890278 ?auto_890279 ) ) ( not ( = ?auto_890278 ?auto_890280 ) ) ( not ( = ?auto_890278 ?auto_890281 ) ) ( not ( = ?auto_890278 ?auto_890282 ) ) ( not ( = ?auto_890278 ?auto_890283 ) ) ( not ( = ?auto_890278 ?auto_890284 ) ) ( not ( = ?auto_890278 ?auto_890285 ) ) ( not ( = ?auto_890278 ?auto_890286 ) ) ( not ( = ?auto_890278 ?auto_890287 ) ) ( not ( = ?auto_890279 ?auto_890280 ) ) ( not ( = ?auto_890279 ?auto_890281 ) ) ( not ( = ?auto_890279 ?auto_890282 ) ) ( not ( = ?auto_890279 ?auto_890283 ) ) ( not ( = ?auto_890279 ?auto_890284 ) ) ( not ( = ?auto_890279 ?auto_890285 ) ) ( not ( = ?auto_890279 ?auto_890286 ) ) ( not ( = ?auto_890279 ?auto_890287 ) ) ( not ( = ?auto_890280 ?auto_890281 ) ) ( not ( = ?auto_890280 ?auto_890282 ) ) ( not ( = ?auto_890280 ?auto_890283 ) ) ( not ( = ?auto_890280 ?auto_890284 ) ) ( not ( = ?auto_890280 ?auto_890285 ) ) ( not ( = ?auto_890280 ?auto_890286 ) ) ( not ( = ?auto_890280 ?auto_890287 ) ) ( not ( = ?auto_890281 ?auto_890282 ) ) ( not ( = ?auto_890281 ?auto_890283 ) ) ( not ( = ?auto_890281 ?auto_890284 ) ) ( not ( = ?auto_890281 ?auto_890285 ) ) ( not ( = ?auto_890281 ?auto_890286 ) ) ( not ( = ?auto_890281 ?auto_890287 ) ) ( not ( = ?auto_890282 ?auto_890283 ) ) ( not ( = ?auto_890282 ?auto_890284 ) ) ( not ( = ?auto_890282 ?auto_890285 ) ) ( not ( = ?auto_890282 ?auto_890286 ) ) ( not ( = ?auto_890282 ?auto_890287 ) ) ( not ( = ?auto_890283 ?auto_890284 ) ) ( not ( = ?auto_890283 ?auto_890285 ) ) ( not ( = ?auto_890283 ?auto_890286 ) ) ( not ( = ?auto_890283 ?auto_890287 ) ) ( not ( = ?auto_890284 ?auto_890285 ) ) ( not ( = ?auto_890284 ?auto_890286 ) ) ( not ( = ?auto_890284 ?auto_890287 ) ) ( not ( = ?auto_890285 ?auto_890286 ) ) ( not ( = ?auto_890285 ?auto_890287 ) ) ( not ( = ?auto_890286 ?auto_890287 ) ) ( ON ?auto_890285 ?auto_890286 ) ( ON ?auto_890284 ?auto_890285 ) ( ON ?auto_890283 ?auto_890284 ) ( CLEAR ?auto_890281 ) ( ON ?auto_890282 ?auto_890283 ) ( CLEAR ?auto_890282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_890278 ?auto_890279 ?auto_890280 ?auto_890281 ?auto_890282 )
      ( MAKE-9PILE ?auto_890278 ?auto_890279 ?auto_890280 ?auto_890281 ?auto_890282 ?auto_890283 ?auto_890284 ?auto_890285 ?auto_890286 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890316 - BLOCK
      ?auto_890317 - BLOCK
      ?auto_890318 - BLOCK
      ?auto_890319 - BLOCK
      ?auto_890320 - BLOCK
      ?auto_890321 - BLOCK
      ?auto_890322 - BLOCK
      ?auto_890323 - BLOCK
      ?auto_890324 - BLOCK
    )
    :vars
    (
      ?auto_890325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890324 ?auto_890325 ) ( ON-TABLE ?auto_890316 ) ( ON ?auto_890317 ?auto_890316 ) ( ON ?auto_890318 ?auto_890317 ) ( not ( = ?auto_890316 ?auto_890317 ) ) ( not ( = ?auto_890316 ?auto_890318 ) ) ( not ( = ?auto_890316 ?auto_890319 ) ) ( not ( = ?auto_890316 ?auto_890320 ) ) ( not ( = ?auto_890316 ?auto_890321 ) ) ( not ( = ?auto_890316 ?auto_890322 ) ) ( not ( = ?auto_890316 ?auto_890323 ) ) ( not ( = ?auto_890316 ?auto_890324 ) ) ( not ( = ?auto_890316 ?auto_890325 ) ) ( not ( = ?auto_890317 ?auto_890318 ) ) ( not ( = ?auto_890317 ?auto_890319 ) ) ( not ( = ?auto_890317 ?auto_890320 ) ) ( not ( = ?auto_890317 ?auto_890321 ) ) ( not ( = ?auto_890317 ?auto_890322 ) ) ( not ( = ?auto_890317 ?auto_890323 ) ) ( not ( = ?auto_890317 ?auto_890324 ) ) ( not ( = ?auto_890317 ?auto_890325 ) ) ( not ( = ?auto_890318 ?auto_890319 ) ) ( not ( = ?auto_890318 ?auto_890320 ) ) ( not ( = ?auto_890318 ?auto_890321 ) ) ( not ( = ?auto_890318 ?auto_890322 ) ) ( not ( = ?auto_890318 ?auto_890323 ) ) ( not ( = ?auto_890318 ?auto_890324 ) ) ( not ( = ?auto_890318 ?auto_890325 ) ) ( not ( = ?auto_890319 ?auto_890320 ) ) ( not ( = ?auto_890319 ?auto_890321 ) ) ( not ( = ?auto_890319 ?auto_890322 ) ) ( not ( = ?auto_890319 ?auto_890323 ) ) ( not ( = ?auto_890319 ?auto_890324 ) ) ( not ( = ?auto_890319 ?auto_890325 ) ) ( not ( = ?auto_890320 ?auto_890321 ) ) ( not ( = ?auto_890320 ?auto_890322 ) ) ( not ( = ?auto_890320 ?auto_890323 ) ) ( not ( = ?auto_890320 ?auto_890324 ) ) ( not ( = ?auto_890320 ?auto_890325 ) ) ( not ( = ?auto_890321 ?auto_890322 ) ) ( not ( = ?auto_890321 ?auto_890323 ) ) ( not ( = ?auto_890321 ?auto_890324 ) ) ( not ( = ?auto_890321 ?auto_890325 ) ) ( not ( = ?auto_890322 ?auto_890323 ) ) ( not ( = ?auto_890322 ?auto_890324 ) ) ( not ( = ?auto_890322 ?auto_890325 ) ) ( not ( = ?auto_890323 ?auto_890324 ) ) ( not ( = ?auto_890323 ?auto_890325 ) ) ( not ( = ?auto_890324 ?auto_890325 ) ) ( ON ?auto_890323 ?auto_890324 ) ( ON ?auto_890322 ?auto_890323 ) ( ON ?auto_890321 ?auto_890322 ) ( ON ?auto_890320 ?auto_890321 ) ( CLEAR ?auto_890318 ) ( ON ?auto_890319 ?auto_890320 ) ( CLEAR ?auto_890319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_890316 ?auto_890317 ?auto_890318 ?auto_890319 )
      ( MAKE-9PILE ?auto_890316 ?auto_890317 ?auto_890318 ?auto_890319 ?auto_890320 ?auto_890321 ?auto_890322 ?auto_890323 ?auto_890324 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890354 - BLOCK
      ?auto_890355 - BLOCK
      ?auto_890356 - BLOCK
      ?auto_890357 - BLOCK
      ?auto_890358 - BLOCK
      ?auto_890359 - BLOCK
      ?auto_890360 - BLOCK
      ?auto_890361 - BLOCK
      ?auto_890362 - BLOCK
    )
    :vars
    (
      ?auto_890363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890362 ?auto_890363 ) ( ON-TABLE ?auto_890354 ) ( ON ?auto_890355 ?auto_890354 ) ( not ( = ?auto_890354 ?auto_890355 ) ) ( not ( = ?auto_890354 ?auto_890356 ) ) ( not ( = ?auto_890354 ?auto_890357 ) ) ( not ( = ?auto_890354 ?auto_890358 ) ) ( not ( = ?auto_890354 ?auto_890359 ) ) ( not ( = ?auto_890354 ?auto_890360 ) ) ( not ( = ?auto_890354 ?auto_890361 ) ) ( not ( = ?auto_890354 ?auto_890362 ) ) ( not ( = ?auto_890354 ?auto_890363 ) ) ( not ( = ?auto_890355 ?auto_890356 ) ) ( not ( = ?auto_890355 ?auto_890357 ) ) ( not ( = ?auto_890355 ?auto_890358 ) ) ( not ( = ?auto_890355 ?auto_890359 ) ) ( not ( = ?auto_890355 ?auto_890360 ) ) ( not ( = ?auto_890355 ?auto_890361 ) ) ( not ( = ?auto_890355 ?auto_890362 ) ) ( not ( = ?auto_890355 ?auto_890363 ) ) ( not ( = ?auto_890356 ?auto_890357 ) ) ( not ( = ?auto_890356 ?auto_890358 ) ) ( not ( = ?auto_890356 ?auto_890359 ) ) ( not ( = ?auto_890356 ?auto_890360 ) ) ( not ( = ?auto_890356 ?auto_890361 ) ) ( not ( = ?auto_890356 ?auto_890362 ) ) ( not ( = ?auto_890356 ?auto_890363 ) ) ( not ( = ?auto_890357 ?auto_890358 ) ) ( not ( = ?auto_890357 ?auto_890359 ) ) ( not ( = ?auto_890357 ?auto_890360 ) ) ( not ( = ?auto_890357 ?auto_890361 ) ) ( not ( = ?auto_890357 ?auto_890362 ) ) ( not ( = ?auto_890357 ?auto_890363 ) ) ( not ( = ?auto_890358 ?auto_890359 ) ) ( not ( = ?auto_890358 ?auto_890360 ) ) ( not ( = ?auto_890358 ?auto_890361 ) ) ( not ( = ?auto_890358 ?auto_890362 ) ) ( not ( = ?auto_890358 ?auto_890363 ) ) ( not ( = ?auto_890359 ?auto_890360 ) ) ( not ( = ?auto_890359 ?auto_890361 ) ) ( not ( = ?auto_890359 ?auto_890362 ) ) ( not ( = ?auto_890359 ?auto_890363 ) ) ( not ( = ?auto_890360 ?auto_890361 ) ) ( not ( = ?auto_890360 ?auto_890362 ) ) ( not ( = ?auto_890360 ?auto_890363 ) ) ( not ( = ?auto_890361 ?auto_890362 ) ) ( not ( = ?auto_890361 ?auto_890363 ) ) ( not ( = ?auto_890362 ?auto_890363 ) ) ( ON ?auto_890361 ?auto_890362 ) ( ON ?auto_890360 ?auto_890361 ) ( ON ?auto_890359 ?auto_890360 ) ( ON ?auto_890358 ?auto_890359 ) ( ON ?auto_890357 ?auto_890358 ) ( CLEAR ?auto_890355 ) ( ON ?auto_890356 ?auto_890357 ) ( CLEAR ?auto_890356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_890354 ?auto_890355 ?auto_890356 )
      ( MAKE-9PILE ?auto_890354 ?auto_890355 ?auto_890356 ?auto_890357 ?auto_890358 ?auto_890359 ?auto_890360 ?auto_890361 ?auto_890362 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890392 - BLOCK
      ?auto_890393 - BLOCK
      ?auto_890394 - BLOCK
      ?auto_890395 - BLOCK
      ?auto_890396 - BLOCK
      ?auto_890397 - BLOCK
      ?auto_890398 - BLOCK
      ?auto_890399 - BLOCK
      ?auto_890400 - BLOCK
    )
    :vars
    (
      ?auto_890401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890400 ?auto_890401 ) ( ON-TABLE ?auto_890392 ) ( not ( = ?auto_890392 ?auto_890393 ) ) ( not ( = ?auto_890392 ?auto_890394 ) ) ( not ( = ?auto_890392 ?auto_890395 ) ) ( not ( = ?auto_890392 ?auto_890396 ) ) ( not ( = ?auto_890392 ?auto_890397 ) ) ( not ( = ?auto_890392 ?auto_890398 ) ) ( not ( = ?auto_890392 ?auto_890399 ) ) ( not ( = ?auto_890392 ?auto_890400 ) ) ( not ( = ?auto_890392 ?auto_890401 ) ) ( not ( = ?auto_890393 ?auto_890394 ) ) ( not ( = ?auto_890393 ?auto_890395 ) ) ( not ( = ?auto_890393 ?auto_890396 ) ) ( not ( = ?auto_890393 ?auto_890397 ) ) ( not ( = ?auto_890393 ?auto_890398 ) ) ( not ( = ?auto_890393 ?auto_890399 ) ) ( not ( = ?auto_890393 ?auto_890400 ) ) ( not ( = ?auto_890393 ?auto_890401 ) ) ( not ( = ?auto_890394 ?auto_890395 ) ) ( not ( = ?auto_890394 ?auto_890396 ) ) ( not ( = ?auto_890394 ?auto_890397 ) ) ( not ( = ?auto_890394 ?auto_890398 ) ) ( not ( = ?auto_890394 ?auto_890399 ) ) ( not ( = ?auto_890394 ?auto_890400 ) ) ( not ( = ?auto_890394 ?auto_890401 ) ) ( not ( = ?auto_890395 ?auto_890396 ) ) ( not ( = ?auto_890395 ?auto_890397 ) ) ( not ( = ?auto_890395 ?auto_890398 ) ) ( not ( = ?auto_890395 ?auto_890399 ) ) ( not ( = ?auto_890395 ?auto_890400 ) ) ( not ( = ?auto_890395 ?auto_890401 ) ) ( not ( = ?auto_890396 ?auto_890397 ) ) ( not ( = ?auto_890396 ?auto_890398 ) ) ( not ( = ?auto_890396 ?auto_890399 ) ) ( not ( = ?auto_890396 ?auto_890400 ) ) ( not ( = ?auto_890396 ?auto_890401 ) ) ( not ( = ?auto_890397 ?auto_890398 ) ) ( not ( = ?auto_890397 ?auto_890399 ) ) ( not ( = ?auto_890397 ?auto_890400 ) ) ( not ( = ?auto_890397 ?auto_890401 ) ) ( not ( = ?auto_890398 ?auto_890399 ) ) ( not ( = ?auto_890398 ?auto_890400 ) ) ( not ( = ?auto_890398 ?auto_890401 ) ) ( not ( = ?auto_890399 ?auto_890400 ) ) ( not ( = ?auto_890399 ?auto_890401 ) ) ( not ( = ?auto_890400 ?auto_890401 ) ) ( ON ?auto_890399 ?auto_890400 ) ( ON ?auto_890398 ?auto_890399 ) ( ON ?auto_890397 ?auto_890398 ) ( ON ?auto_890396 ?auto_890397 ) ( ON ?auto_890395 ?auto_890396 ) ( ON ?auto_890394 ?auto_890395 ) ( CLEAR ?auto_890392 ) ( ON ?auto_890393 ?auto_890394 ) ( CLEAR ?auto_890393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_890392 ?auto_890393 )
      ( MAKE-9PILE ?auto_890392 ?auto_890393 ?auto_890394 ?auto_890395 ?auto_890396 ?auto_890397 ?auto_890398 ?auto_890399 ?auto_890400 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_890430 - BLOCK
      ?auto_890431 - BLOCK
      ?auto_890432 - BLOCK
      ?auto_890433 - BLOCK
      ?auto_890434 - BLOCK
      ?auto_890435 - BLOCK
      ?auto_890436 - BLOCK
      ?auto_890437 - BLOCK
      ?auto_890438 - BLOCK
    )
    :vars
    (
      ?auto_890439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890438 ?auto_890439 ) ( not ( = ?auto_890430 ?auto_890431 ) ) ( not ( = ?auto_890430 ?auto_890432 ) ) ( not ( = ?auto_890430 ?auto_890433 ) ) ( not ( = ?auto_890430 ?auto_890434 ) ) ( not ( = ?auto_890430 ?auto_890435 ) ) ( not ( = ?auto_890430 ?auto_890436 ) ) ( not ( = ?auto_890430 ?auto_890437 ) ) ( not ( = ?auto_890430 ?auto_890438 ) ) ( not ( = ?auto_890430 ?auto_890439 ) ) ( not ( = ?auto_890431 ?auto_890432 ) ) ( not ( = ?auto_890431 ?auto_890433 ) ) ( not ( = ?auto_890431 ?auto_890434 ) ) ( not ( = ?auto_890431 ?auto_890435 ) ) ( not ( = ?auto_890431 ?auto_890436 ) ) ( not ( = ?auto_890431 ?auto_890437 ) ) ( not ( = ?auto_890431 ?auto_890438 ) ) ( not ( = ?auto_890431 ?auto_890439 ) ) ( not ( = ?auto_890432 ?auto_890433 ) ) ( not ( = ?auto_890432 ?auto_890434 ) ) ( not ( = ?auto_890432 ?auto_890435 ) ) ( not ( = ?auto_890432 ?auto_890436 ) ) ( not ( = ?auto_890432 ?auto_890437 ) ) ( not ( = ?auto_890432 ?auto_890438 ) ) ( not ( = ?auto_890432 ?auto_890439 ) ) ( not ( = ?auto_890433 ?auto_890434 ) ) ( not ( = ?auto_890433 ?auto_890435 ) ) ( not ( = ?auto_890433 ?auto_890436 ) ) ( not ( = ?auto_890433 ?auto_890437 ) ) ( not ( = ?auto_890433 ?auto_890438 ) ) ( not ( = ?auto_890433 ?auto_890439 ) ) ( not ( = ?auto_890434 ?auto_890435 ) ) ( not ( = ?auto_890434 ?auto_890436 ) ) ( not ( = ?auto_890434 ?auto_890437 ) ) ( not ( = ?auto_890434 ?auto_890438 ) ) ( not ( = ?auto_890434 ?auto_890439 ) ) ( not ( = ?auto_890435 ?auto_890436 ) ) ( not ( = ?auto_890435 ?auto_890437 ) ) ( not ( = ?auto_890435 ?auto_890438 ) ) ( not ( = ?auto_890435 ?auto_890439 ) ) ( not ( = ?auto_890436 ?auto_890437 ) ) ( not ( = ?auto_890436 ?auto_890438 ) ) ( not ( = ?auto_890436 ?auto_890439 ) ) ( not ( = ?auto_890437 ?auto_890438 ) ) ( not ( = ?auto_890437 ?auto_890439 ) ) ( not ( = ?auto_890438 ?auto_890439 ) ) ( ON ?auto_890437 ?auto_890438 ) ( ON ?auto_890436 ?auto_890437 ) ( ON ?auto_890435 ?auto_890436 ) ( ON ?auto_890434 ?auto_890435 ) ( ON ?auto_890433 ?auto_890434 ) ( ON ?auto_890432 ?auto_890433 ) ( ON ?auto_890431 ?auto_890432 ) ( ON ?auto_890430 ?auto_890431 ) ( CLEAR ?auto_890430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_890430 )
      ( MAKE-9PILE ?auto_890430 ?auto_890431 ?auto_890432 ?auto_890433 ?auto_890434 ?auto_890435 ?auto_890436 ?auto_890437 ?auto_890438 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890469 - BLOCK
      ?auto_890470 - BLOCK
      ?auto_890471 - BLOCK
      ?auto_890472 - BLOCK
      ?auto_890473 - BLOCK
      ?auto_890474 - BLOCK
      ?auto_890475 - BLOCK
      ?auto_890476 - BLOCK
      ?auto_890477 - BLOCK
      ?auto_890478 - BLOCK
    )
    :vars
    (
      ?auto_890479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_890477 ) ( ON ?auto_890478 ?auto_890479 ) ( CLEAR ?auto_890478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_890469 ) ( ON ?auto_890470 ?auto_890469 ) ( ON ?auto_890471 ?auto_890470 ) ( ON ?auto_890472 ?auto_890471 ) ( ON ?auto_890473 ?auto_890472 ) ( ON ?auto_890474 ?auto_890473 ) ( ON ?auto_890475 ?auto_890474 ) ( ON ?auto_890476 ?auto_890475 ) ( ON ?auto_890477 ?auto_890476 ) ( not ( = ?auto_890469 ?auto_890470 ) ) ( not ( = ?auto_890469 ?auto_890471 ) ) ( not ( = ?auto_890469 ?auto_890472 ) ) ( not ( = ?auto_890469 ?auto_890473 ) ) ( not ( = ?auto_890469 ?auto_890474 ) ) ( not ( = ?auto_890469 ?auto_890475 ) ) ( not ( = ?auto_890469 ?auto_890476 ) ) ( not ( = ?auto_890469 ?auto_890477 ) ) ( not ( = ?auto_890469 ?auto_890478 ) ) ( not ( = ?auto_890469 ?auto_890479 ) ) ( not ( = ?auto_890470 ?auto_890471 ) ) ( not ( = ?auto_890470 ?auto_890472 ) ) ( not ( = ?auto_890470 ?auto_890473 ) ) ( not ( = ?auto_890470 ?auto_890474 ) ) ( not ( = ?auto_890470 ?auto_890475 ) ) ( not ( = ?auto_890470 ?auto_890476 ) ) ( not ( = ?auto_890470 ?auto_890477 ) ) ( not ( = ?auto_890470 ?auto_890478 ) ) ( not ( = ?auto_890470 ?auto_890479 ) ) ( not ( = ?auto_890471 ?auto_890472 ) ) ( not ( = ?auto_890471 ?auto_890473 ) ) ( not ( = ?auto_890471 ?auto_890474 ) ) ( not ( = ?auto_890471 ?auto_890475 ) ) ( not ( = ?auto_890471 ?auto_890476 ) ) ( not ( = ?auto_890471 ?auto_890477 ) ) ( not ( = ?auto_890471 ?auto_890478 ) ) ( not ( = ?auto_890471 ?auto_890479 ) ) ( not ( = ?auto_890472 ?auto_890473 ) ) ( not ( = ?auto_890472 ?auto_890474 ) ) ( not ( = ?auto_890472 ?auto_890475 ) ) ( not ( = ?auto_890472 ?auto_890476 ) ) ( not ( = ?auto_890472 ?auto_890477 ) ) ( not ( = ?auto_890472 ?auto_890478 ) ) ( not ( = ?auto_890472 ?auto_890479 ) ) ( not ( = ?auto_890473 ?auto_890474 ) ) ( not ( = ?auto_890473 ?auto_890475 ) ) ( not ( = ?auto_890473 ?auto_890476 ) ) ( not ( = ?auto_890473 ?auto_890477 ) ) ( not ( = ?auto_890473 ?auto_890478 ) ) ( not ( = ?auto_890473 ?auto_890479 ) ) ( not ( = ?auto_890474 ?auto_890475 ) ) ( not ( = ?auto_890474 ?auto_890476 ) ) ( not ( = ?auto_890474 ?auto_890477 ) ) ( not ( = ?auto_890474 ?auto_890478 ) ) ( not ( = ?auto_890474 ?auto_890479 ) ) ( not ( = ?auto_890475 ?auto_890476 ) ) ( not ( = ?auto_890475 ?auto_890477 ) ) ( not ( = ?auto_890475 ?auto_890478 ) ) ( not ( = ?auto_890475 ?auto_890479 ) ) ( not ( = ?auto_890476 ?auto_890477 ) ) ( not ( = ?auto_890476 ?auto_890478 ) ) ( not ( = ?auto_890476 ?auto_890479 ) ) ( not ( = ?auto_890477 ?auto_890478 ) ) ( not ( = ?auto_890477 ?auto_890479 ) ) ( not ( = ?auto_890478 ?auto_890479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_890478 ?auto_890479 )
      ( !STACK ?auto_890478 ?auto_890477 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890511 - BLOCK
      ?auto_890512 - BLOCK
      ?auto_890513 - BLOCK
      ?auto_890514 - BLOCK
      ?auto_890515 - BLOCK
      ?auto_890516 - BLOCK
      ?auto_890517 - BLOCK
      ?auto_890518 - BLOCK
      ?auto_890519 - BLOCK
      ?auto_890520 - BLOCK
    )
    :vars
    (
      ?auto_890521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890520 ?auto_890521 ) ( ON-TABLE ?auto_890511 ) ( ON ?auto_890512 ?auto_890511 ) ( ON ?auto_890513 ?auto_890512 ) ( ON ?auto_890514 ?auto_890513 ) ( ON ?auto_890515 ?auto_890514 ) ( ON ?auto_890516 ?auto_890515 ) ( ON ?auto_890517 ?auto_890516 ) ( ON ?auto_890518 ?auto_890517 ) ( not ( = ?auto_890511 ?auto_890512 ) ) ( not ( = ?auto_890511 ?auto_890513 ) ) ( not ( = ?auto_890511 ?auto_890514 ) ) ( not ( = ?auto_890511 ?auto_890515 ) ) ( not ( = ?auto_890511 ?auto_890516 ) ) ( not ( = ?auto_890511 ?auto_890517 ) ) ( not ( = ?auto_890511 ?auto_890518 ) ) ( not ( = ?auto_890511 ?auto_890519 ) ) ( not ( = ?auto_890511 ?auto_890520 ) ) ( not ( = ?auto_890511 ?auto_890521 ) ) ( not ( = ?auto_890512 ?auto_890513 ) ) ( not ( = ?auto_890512 ?auto_890514 ) ) ( not ( = ?auto_890512 ?auto_890515 ) ) ( not ( = ?auto_890512 ?auto_890516 ) ) ( not ( = ?auto_890512 ?auto_890517 ) ) ( not ( = ?auto_890512 ?auto_890518 ) ) ( not ( = ?auto_890512 ?auto_890519 ) ) ( not ( = ?auto_890512 ?auto_890520 ) ) ( not ( = ?auto_890512 ?auto_890521 ) ) ( not ( = ?auto_890513 ?auto_890514 ) ) ( not ( = ?auto_890513 ?auto_890515 ) ) ( not ( = ?auto_890513 ?auto_890516 ) ) ( not ( = ?auto_890513 ?auto_890517 ) ) ( not ( = ?auto_890513 ?auto_890518 ) ) ( not ( = ?auto_890513 ?auto_890519 ) ) ( not ( = ?auto_890513 ?auto_890520 ) ) ( not ( = ?auto_890513 ?auto_890521 ) ) ( not ( = ?auto_890514 ?auto_890515 ) ) ( not ( = ?auto_890514 ?auto_890516 ) ) ( not ( = ?auto_890514 ?auto_890517 ) ) ( not ( = ?auto_890514 ?auto_890518 ) ) ( not ( = ?auto_890514 ?auto_890519 ) ) ( not ( = ?auto_890514 ?auto_890520 ) ) ( not ( = ?auto_890514 ?auto_890521 ) ) ( not ( = ?auto_890515 ?auto_890516 ) ) ( not ( = ?auto_890515 ?auto_890517 ) ) ( not ( = ?auto_890515 ?auto_890518 ) ) ( not ( = ?auto_890515 ?auto_890519 ) ) ( not ( = ?auto_890515 ?auto_890520 ) ) ( not ( = ?auto_890515 ?auto_890521 ) ) ( not ( = ?auto_890516 ?auto_890517 ) ) ( not ( = ?auto_890516 ?auto_890518 ) ) ( not ( = ?auto_890516 ?auto_890519 ) ) ( not ( = ?auto_890516 ?auto_890520 ) ) ( not ( = ?auto_890516 ?auto_890521 ) ) ( not ( = ?auto_890517 ?auto_890518 ) ) ( not ( = ?auto_890517 ?auto_890519 ) ) ( not ( = ?auto_890517 ?auto_890520 ) ) ( not ( = ?auto_890517 ?auto_890521 ) ) ( not ( = ?auto_890518 ?auto_890519 ) ) ( not ( = ?auto_890518 ?auto_890520 ) ) ( not ( = ?auto_890518 ?auto_890521 ) ) ( not ( = ?auto_890519 ?auto_890520 ) ) ( not ( = ?auto_890519 ?auto_890521 ) ) ( not ( = ?auto_890520 ?auto_890521 ) ) ( CLEAR ?auto_890518 ) ( ON ?auto_890519 ?auto_890520 ) ( CLEAR ?auto_890519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_890511 ?auto_890512 ?auto_890513 ?auto_890514 ?auto_890515 ?auto_890516 ?auto_890517 ?auto_890518 ?auto_890519 )
      ( MAKE-10PILE ?auto_890511 ?auto_890512 ?auto_890513 ?auto_890514 ?auto_890515 ?auto_890516 ?auto_890517 ?auto_890518 ?auto_890519 ?auto_890520 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890553 - BLOCK
      ?auto_890554 - BLOCK
      ?auto_890555 - BLOCK
      ?auto_890556 - BLOCK
      ?auto_890557 - BLOCK
      ?auto_890558 - BLOCK
      ?auto_890559 - BLOCK
      ?auto_890560 - BLOCK
      ?auto_890561 - BLOCK
      ?auto_890562 - BLOCK
    )
    :vars
    (
      ?auto_890563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890562 ?auto_890563 ) ( ON-TABLE ?auto_890553 ) ( ON ?auto_890554 ?auto_890553 ) ( ON ?auto_890555 ?auto_890554 ) ( ON ?auto_890556 ?auto_890555 ) ( ON ?auto_890557 ?auto_890556 ) ( ON ?auto_890558 ?auto_890557 ) ( ON ?auto_890559 ?auto_890558 ) ( not ( = ?auto_890553 ?auto_890554 ) ) ( not ( = ?auto_890553 ?auto_890555 ) ) ( not ( = ?auto_890553 ?auto_890556 ) ) ( not ( = ?auto_890553 ?auto_890557 ) ) ( not ( = ?auto_890553 ?auto_890558 ) ) ( not ( = ?auto_890553 ?auto_890559 ) ) ( not ( = ?auto_890553 ?auto_890560 ) ) ( not ( = ?auto_890553 ?auto_890561 ) ) ( not ( = ?auto_890553 ?auto_890562 ) ) ( not ( = ?auto_890553 ?auto_890563 ) ) ( not ( = ?auto_890554 ?auto_890555 ) ) ( not ( = ?auto_890554 ?auto_890556 ) ) ( not ( = ?auto_890554 ?auto_890557 ) ) ( not ( = ?auto_890554 ?auto_890558 ) ) ( not ( = ?auto_890554 ?auto_890559 ) ) ( not ( = ?auto_890554 ?auto_890560 ) ) ( not ( = ?auto_890554 ?auto_890561 ) ) ( not ( = ?auto_890554 ?auto_890562 ) ) ( not ( = ?auto_890554 ?auto_890563 ) ) ( not ( = ?auto_890555 ?auto_890556 ) ) ( not ( = ?auto_890555 ?auto_890557 ) ) ( not ( = ?auto_890555 ?auto_890558 ) ) ( not ( = ?auto_890555 ?auto_890559 ) ) ( not ( = ?auto_890555 ?auto_890560 ) ) ( not ( = ?auto_890555 ?auto_890561 ) ) ( not ( = ?auto_890555 ?auto_890562 ) ) ( not ( = ?auto_890555 ?auto_890563 ) ) ( not ( = ?auto_890556 ?auto_890557 ) ) ( not ( = ?auto_890556 ?auto_890558 ) ) ( not ( = ?auto_890556 ?auto_890559 ) ) ( not ( = ?auto_890556 ?auto_890560 ) ) ( not ( = ?auto_890556 ?auto_890561 ) ) ( not ( = ?auto_890556 ?auto_890562 ) ) ( not ( = ?auto_890556 ?auto_890563 ) ) ( not ( = ?auto_890557 ?auto_890558 ) ) ( not ( = ?auto_890557 ?auto_890559 ) ) ( not ( = ?auto_890557 ?auto_890560 ) ) ( not ( = ?auto_890557 ?auto_890561 ) ) ( not ( = ?auto_890557 ?auto_890562 ) ) ( not ( = ?auto_890557 ?auto_890563 ) ) ( not ( = ?auto_890558 ?auto_890559 ) ) ( not ( = ?auto_890558 ?auto_890560 ) ) ( not ( = ?auto_890558 ?auto_890561 ) ) ( not ( = ?auto_890558 ?auto_890562 ) ) ( not ( = ?auto_890558 ?auto_890563 ) ) ( not ( = ?auto_890559 ?auto_890560 ) ) ( not ( = ?auto_890559 ?auto_890561 ) ) ( not ( = ?auto_890559 ?auto_890562 ) ) ( not ( = ?auto_890559 ?auto_890563 ) ) ( not ( = ?auto_890560 ?auto_890561 ) ) ( not ( = ?auto_890560 ?auto_890562 ) ) ( not ( = ?auto_890560 ?auto_890563 ) ) ( not ( = ?auto_890561 ?auto_890562 ) ) ( not ( = ?auto_890561 ?auto_890563 ) ) ( not ( = ?auto_890562 ?auto_890563 ) ) ( ON ?auto_890561 ?auto_890562 ) ( CLEAR ?auto_890559 ) ( ON ?auto_890560 ?auto_890561 ) ( CLEAR ?auto_890560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_890553 ?auto_890554 ?auto_890555 ?auto_890556 ?auto_890557 ?auto_890558 ?auto_890559 ?auto_890560 )
      ( MAKE-10PILE ?auto_890553 ?auto_890554 ?auto_890555 ?auto_890556 ?auto_890557 ?auto_890558 ?auto_890559 ?auto_890560 ?auto_890561 ?auto_890562 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890595 - BLOCK
      ?auto_890596 - BLOCK
      ?auto_890597 - BLOCK
      ?auto_890598 - BLOCK
      ?auto_890599 - BLOCK
      ?auto_890600 - BLOCK
      ?auto_890601 - BLOCK
      ?auto_890602 - BLOCK
      ?auto_890603 - BLOCK
      ?auto_890604 - BLOCK
    )
    :vars
    (
      ?auto_890605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890604 ?auto_890605 ) ( ON-TABLE ?auto_890595 ) ( ON ?auto_890596 ?auto_890595 ) ( ON ?auto_890597 ?auto_890596 ) ( ON ?auto_890598 ?auto_890597 ) ( ON ?auto_890599 ?auto_890598 ) ( ON ?auto_890600 ?auto_890599 ) ( not ( = ?auto_890595 ?auto_890596 ) ) ( not ( = ?auto_890595 ?auto_890597 ) ) ( not ( = ?auto_890595 ?auto_890598 ) ) ( not ( = ?auto_890595 ?auto_890599 ) ) ( not ( = ?auto_890595 ?auto_890600 ) ) ( not ( = ?auto_890595 ?auto_890601 ) ) ( not ( = ?auto_890595 ?auto_890602 ) ) ( not ( = ?auto_890595 ?auto_890603 ) ) ( not ( = ?auto_890595 ?auto_890604 ) ) ( not ( = ?auto_890595 ?auto_890605 ) ) ( not ( = ?auto_890596 ?auto_890597 ) ) ( not ( = ?auto_890596 ?auto_890598 ) ) ( not ( = ?auto_890596 ?auto_890599 ) ) ( not ( = ?auto_890596 ?auto_890600 ) ) ( not ( = ?auto_890596 ?auto_890601 ) ) ( not ( = ?auto_890596 ?auto_890602 ) ) ( not ( = ?auto_890596 ?auto_890603 ) ) ( not ( = ?auto_890596 ?auto_890604 ) ) ( not ( = ?auto_890596 ?auto_890605 ) ) ( not ( = ?auto_890597 ?auto_890598 ) ) ( not ( = ?auto_890597 ?auto_890599 ) ) ( not ( = ?auto_890597 ?auto_890600 ) ) ( not ( = ?auto_890597 ?auto_890601 ) ) ( not ( = ?auto_890597 ?auto_890602 ) ) ( not ( = ?auto_890597 ?auto_890603 ) ) ( not ( = ?auto_890597 ?auto_890604 ) ) ( not ( = ?auto_890597 ?auto_890605 ) ) ( not ( = ?auto_890598 ?auto_890599 ) ) ( not ( = ?auto_890598 ?auto_890600 ) ) ( not ( = ?auto_890598 ?auto_890601 ) ) ( not ( = ?auto_890598 ?auto_890602 ) ) ( not ( = ?auto_890598 ?auto_890603 ) ) ( not ( = ?auto_890598 ?auto_890604 ) ) ( not ( = ?auto_890598 ?auto_890605 ) ) ( not ( = ?auto_890599 ?auto_890600 ) ) ( not ( = ?auto_890599 ?auto_890601 ) ) ( not ( = ?auto_890599 ?auto_890602 ) ) ( not ( = ?auto_890599 ?auto_890603 ) ) ( not ( = ?auto_890599 ?auto_890604 ) ) ( not ( = ?auto_890599 ?auto_890605 ) ) ( not ( = ?auto_890600 ?auto_890601 ) ) ( not ( = ?auto_890600 ?auto_890602 ) ) ( not ( = ?auto_890600 ?auto_890603 ) ) ( not ( = ?auto_890600 ?auto_890604 ) ) ( not ( = ?auto_890600 ?auto_890605 ) ) ( not ( = ?auto_890601 ?auto_890602 ) ) ( not ( = ?auto_890601 ?auto_890603 ) ) ( not ( = ?auto_890601 ?auto_890604 ) ) ( not ( = ?auto_890601 ?auto_890605 ) ) ( not ( = ?auto_890602 ?auto_890603 ) ) ( not ( = ?auto_890602 ?auto_890604 ) ) ( not ( = ?auto_890602 ?auto_890605 ) ) ( not ( = ?auto_890603 ?auto_890604 ) ) ( not ( = ?auto_890603 ?auto_890605 ) ) ( not ( = ?auto_890604 ?auto_890605 ) ) ( ON ?auto_890603 ?auto_890604 ) ( ON ?auto_890602 ?auto_890603 ) ( CLEAR ?auto_890600 ) ( ON ?auto_890601 ?auto_890602 ) ( CLEAR ?auto_890601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_890595 ?auto_890596 ?auto_890597 ?auto_890598 ?auto_890599 ?auto_890600 ?auto_890601 )
      ( MAKE-10PILE ?auto_890595 ?auto_890596 ?auto_890597 ?auto_890598 ?auto_890599 ?auto_890600 ?auto_890601 ?auto_890602 ?auto_890603 ?auto_890604 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890637 - BLOCK
      ?auto_890638 - BLOCK
      ?auto_890639 - BLOCK
      ?auto_890640 - BLOCK
      ?auto_890641 - BLOCK
      ?auto_890642 - BLOCK
      ?auto_890643 - BLOCK
      ?auto_890644 - BLOCK
      ?auto_890645 - BLOCK
      ?auto_890646 - BLOCK
    )
    :vars
    (
      ?auto_890647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890646 ?auto_890647 ) ( ON-TABLE ?auto_890637 ) ( ON ?auto_890638 ?auto_890637 ) ( ON ?auto_890639 ?auto_890638 ) ( ON ?auto_890640 ?auto_890639 ) ( ON ?auto_890641 ?auto_890640 ) ( not ( = ?auto_890637 ?auto_890638 ) ) ( not ( = ?auto_890637 ?auto_890639 ) ) ( not ( = ?auto_890637 ?auto_890640 ) ) ( not ( = ?auto_890637 ?auto_890641 ) ) ( not ( = ?auto_890637 ?auto_890642 ) ) ( not ( = ?auto_890637 ?auto_890643 ) ) ( not ( = ?auto_890637 ?auto_890644 ) ) ( not ( = ?auto_890637 ?auto_890645 ) ) ( not ( = ?auto_890637 ?auto_890646 ) ) ( not ( = ?auto_890637 ?auto_890647 ) ) ( not ( = ?auto_890638 ?auto_890639 ) ) ( not ( = ?auto_890638 ?auto_890640 ) ) ( not ( = ?auto_890638 ?auto_890641 ) ) ( not ( = ?auto_890638 ?auto_890642 ) ) ( not ( = ?auto_890638 ?auto_890643 ) ) ( not ( = ?auto_890638 ?auto_890644 ) ) ( not ( = ?auto_890638 ?auto_890645 ) ) ( not ( = ?auto_890638 ?auto_890646 ) ) ( not ( = ?auto_890638 ?auto_890647 ) ) ( not ( = ?auto_890639 ?auto_890640 ) ) ( not ( = ?auto_890639 ?auto_890641 ) ) ( not ( = ?auto_890639 ?auto_890642 ) ) ( not ( = ?auto_890639 ?auto_890643 ) ) ( not ( = ?auto_890639 ?auto_890644 ) ) ( not ( = ?auto_890639 ?auto_890645 ) ) ( not ( = ?auto_890639 ?auto_890646 ) ) ( not ( = ?auto_890639 ?auto_890647 ) ) ( not ( = ?auto_890640 ?auto_890641 ) ) ( not ( = ?auto_890640 ?auto_890642 ) ) ( not ( = ?auto_890640 ?auto_890643 ) ) ( not ( = ?auto_890640 ?auto_890644 ) ) ( not ( = ?auto_890640 ?auto_890645 ) ) ( not ( = ?auto_890640 ?auto_890646 ) ) ( not ( = ?auto_890640 ?auto_890647 ) ) ( not ( = ?auto_890641 ?auto_890642 ) ) ( not ( = ?auto_890641 ?auto_890643 ) ) ( not ( = ?auto_890641 ?auto_890644 ) ) ( not ( = ?auto_890641 ?auto_890645 ) ) ( not ( = ?auto_890641 ?auto_890646 ) ) ( not ( = ?auto_890641 ?auto_890647 ) ) ( not ( = ?auto_890642 ?auto_890643 ) ) ( not ( = ?auto_890642 ?auto_890644 ) ) ( not ( = ?auto_890642 ?auto_890645 ) ) ( not ( = ?auto_890642 ?auto_890646 ) ) ( not ( = ?auto_890642 ?auto_890647 ) ) ( not ( = ?auto_890643 ?auto_890644 ) ) ( not ( = ?auto_890643 ?auto_890645 ) ) ( not ( = ?auto_890643 ?auto_890646 ) ) ( not ( = ?auto_890643 ?auto_890647 ) ) ( not ( = ?auto_890644 ?auto_890645 ) ) ( not ( = ?auto_890644 ?auto_890646 ) ) ( not ( = ?auto_890644 ?auto_890647 ) ) ( not ( = ?auto_890645 ?auto_890646 ) ) ( not ( = ?auto_890645 ?auto_890647 ) ) ( not ( = ?auto_890646 ?auto_890647 ) ) ( ON ?auto_890645 ?auto_890646 ) ( ON ?auto_890644 ?auto_890645 ) ( ON ?auto_890643 ?auto_890644 ) ( CLEAR ?auto_890641 ) ( ON ?auto_890642 ?auto_890643 ) ( CLEAR ?auto_890642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_890637 ?auto_890638 ?auto_890639 ?auto_890640 ?auto_890641 ?auto_890642 )
      ( MAKE-10PILE ?auto_890637 ?auto_890638 ?auto_890639 ?auto_890640 ?auto_890641 ?auto_890642 ?auto_890643 ?auto_890644 ?auto_890645 ?auto_890646 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890679 - BLOCK
      ?auto_890680 - BLOCK
      ?auto_890681 - BLOCK
      ?auto_890682 - BLOCK
      ?auto_890683 - BLOCK
      ?auto_890684 - BLOCK
      ?auto_890685 - BLOCK
      ?auto_890686 - BLOCK
      ?auto_890687 - BLOCK
      ?auto_890688 - BLOCK
    )
    :vars
    (
      ?auto_890689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890688 ?auto_890689 ) ( ON-TABLE ?auto_890679 ) ( ON ?auto_890680 ?auto_890679 ) ( ON ?auto_890681 ?auto_890680 ) ( ON ?auto_890682 ?auto_890681 ) ( not ( = ?auto_890679 ?auto_890680 ) ) ( not ( = ?auto_890679 ?auto_890681 ) ) ( not ( = ?auto_890679 ?auto_890682 ) ) ( not ( = ?auto_890679 ?auto_890683 ) ) ( not ( = ?auto_890679 ?auto_890684 ) ) ( not ( = ?auto_890679 ?auto_890685 ) ) ( not ( = ?auto_890679 ?auto_890686 ) ) ( not ( = ?auto_890679 ?auto_890687 ) ) ( not ( = ?auto_890679 ?auto_890688 ) ) ( not ( = ?auto_890679 ?auto_890689 ) ) ( not ( = ?auto_890680 ?auto_890681 ) ) ( not ( = ?auto_890680 ?auto_890682 ) ) ( not ( = ?auto_890680 ?auto_890683 ) ) ( not ( = ?auto_890680 ?auto_890684 ) ) ( not ( = ?auto_890680 ?auto_890685 ) ) ( not ( = ?auto_890680 ?auto_890686 ) ) ( not ( = ?auto_890680 ?auto_890687 ) ) ( not ( = ?auto_890680 ?auto_890688 ) ) ( not ( = ?auto_890680 ?auto_890689 ) ) ( not ( = ?auto_890681 ?auto_890682 ) ) ( not ( = ?auto_890681 ?auto_890683 ) ) ( not ( = ?auto_890681 ?auto_890684 ) ) ( not ( = ?auto_890681 ?auto_890685 ) ) ( not ( = ?auto_890681 ?auto_890686 ) ) ( not ( = ?auto_890681 ?auto_890687 ) ) ( not ( = ?auto_890681 ?auto_890688 ) ) ( not ( = ?auto_890681 ?auto_890689 ) ) ( not ( = ?auto_890682 ?auto_890683 ) ) ( not ( = ?auto_890682 ?auto_890684 ) ) ( not ( = ?auto_890682 ?auto_890685 ) ) ( not ( = ?auto_890682 ?auto_890686 ) ) ( not ( = ?auto_890682 ?auto_890687 ) ) ( not ( = ?auto_890682 ?auto_890688 ) ) ( not ( = ?auto_890682 ?auto_890689 ) ) ( not ( = ?auto_890683 ?auto_890684 ) ) ( not ( = ?auto_890683 ?auto_890685 ) ) ( not ( = ?auto_890683 ?auto_890686 ) ) ( not ( = ?auto_890683 ?auto_890687 ) ) ( not ( = ?auto_890683 ?auto_890688 ) ) ( not ( = ?auto_890683 ?auto_890689 ) ) ( not ( = ?auto_890684 ?auto_890685 ) ) ( not ( = ?auto_890684 ?auto_890686 ) ) ( not ( = ?auto_890684 ?auto_890687 ) ) ( not ( = ?auto_890684 ?auto_890688 ) ) ( not ( = ?auto_890684 ?auto_890689 ) ) ( not ( = ?auto_890685 ?auto_890686 ) ) ( not ( = ?auto_890685 ?auto_890687 ) ) ( not ( = ?auto_890685 ?auto_890688 ) ) ( not ( = ?auto_890685 ?auto_890689 ) ) ( not ( = ?auto_890686 ?auto_890687 ) ) ( not ( = ?auto_890686 ?auto_890688 ) ) ( not ( = ?auto_890686 ?auto_890689 ) ) ( not ( = ?auto_890687 ?auto_890688 ) ) ( not ( = ?auto_890687 ?auto_890689 ) ) ( not ( = ?auto_890688 ?auto_890689 ) ) ( ON ?auto_890687 ?auto_890688 ) ( ON ?auto_890686 ?auto_890687 ) ( ON ?auto_890685 ?auto_890686 ) ( ON ?auto_890684 ?auto_890685 ) ( CLEAR ?auto_890682 ) ( ON ?auto_890683 ?auto_890684 ) ( CLEAR ?auto_890683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_890679 ?auto_890680 ?auto_890681 ?auto_890682 ?auto_890683 )
      ( MAKE-10PILE ?auto_890679 ?auto_890680 ?auto_890681 ?auto_890682 ?auto_890683 ?auto_890684 ?auto_890685 ?auto_890686 ?auto_890687 ?auto_890688 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890721 - BLOCK
      ?auto_890722 - BLOCK
      ?auto_890723 - BLOCK
      ?auto_890724 - BLOCK
      ?auto_890725 - BLOCK
      ?auto_890726 - BLOCK
      ?auto_890727 - BLOCK
      ?auto_890728 - BLOCK
      ?auto_890729 - BLOCK
      ?auto_890730 - BLOCK
    )
    :vars
    (
      ?auto_890731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890730 ?auto_890731 ) ( ON-TABLE ?auto_890721 ) ( ON ?auto_890722 ?auto_890721 ) ( ON ?auto_890723 ?auto_890722 ) ( not ( = ?auto_890721 ?auto_890722 ) ) ( not ( = ?auto_890721 ?auto_890723 ) ) ( not ( = ?auto_890721 ?auto_890724 ) ) ( not ( = ?auto_890721 ?auto_890725 ) ) ( not ( = ?auto_890721 ?auto_890726 ) ) ( not ( = ?auto_890721 ?auto_890727 ) ) ( not ( = ?auto_890721 ?auto_890728 ) ) ( not ( = ?auto_890721 ?auto_890729 ) ) ( not ( = ?auto_890721 ?auto_890730 ) ) ( not ( = ?auto_890721 ?auto_890731 ) ) ( not ( = ?auto_890722 ?auto_890723 ) ) ( not ( = ?auto_890722 ?auto_890724 ) ) ( not ( = ?auto_890722 ?auto_890725 ) ) ( not ( = ?auto_890722 ?auto_890726 ) ) ( not ( = ?auto_890722 ?auto_890727 ) ) ( not ( = ?auto_890722 ?auto_890728 ) ) ( not ( = ?auto_890722 ?auto_890729 ) ) ( not ( = ?auto_890722 ?auto_890730 ) ) ( not ( = ?auto_890722 ?auto_890731 ) ) ( not ( = ?auto_890723 ?auto_890724 ) ) ( not ( = ?auto_890723 ?auto_890725 ) ) ( not ( = ?auto_890723 ?auto_890726 ) ) ( not ( = ?auto_890723 ?auto_890727 ) ) ( not ( = ?auto_890723 ?auto_890728 ) ) ( not ( = ?auto_890723 ?auto_890729 ) ) ( not ( = ?auto_890723 ?auto_890730 ) ) ( not ( = ?auto_890723 ?auto_890731 ) ) ( not ( = ?auto_890724 ?auto_890725 ) ) ( not ( = ?auto_890724 ?auto_890726 ) ) ( not ( = ?auto_890724 ?auto_890727 ) ) ( not ( = ?auto_890724 ?auto_890728 ) ) ( not ( = ?auto_890724 ?auto_890729 ) ) ( not ( = ?auto_890724 ?auto_890730 ) ) ( not ( = ?auto_890724 ?auto_890731 ) ) ( not ( = ?auto_890725 ?auto_890726 ) ) ( not ( = ?auto_890725 ?auto_890727 ) ) ( not ( = ?auto_890725 ?auto_890728 ) ) ( not ( = ?auto_890725 ?auto_890729 ) ) ( not ( = ?auto_890725 ?auto_890730 ) ) ( not ( = ?auto_890725 ?auto_890731 ) ) ( not ( = ?auto_890726 ?auto_890727 ) ) ( not ( = ?auto_890726 ?auto_890728 ) ) ( not ( = ?auto_890726 ?auto_890729 ) ) ( not ( = ?auto_890726 ?auto_890730 ) ) ( not ( = ?auto_890726 ?auto_890731 ) ) ( not ( = ?auto_890727 ?auto_890728 ) ) ( not ( = ?auto_890727 ?auto_890729 ) ) ( not ( = ?auto_890727 ?auto_890730 ) ) ( not ( = ?auto_890727 ?auto_890731 ) ) ( not ( = ?auto_890728 ?auto_890729 ) ) ( not ( = ?auto_890728 ?auto_890730 ) ) ( not ( = ?auto_890728 ?auto_890731 ) ) ( not ( = ?auto_890729 ?auto_890730 ) ) ( not ( = ?auto_890729 ?auto_890731 ) ) ( not ( = ?auto_890730 ?auto_890731 ) ) ( ON ?auto_890729 ?auto_890730 ) ( ON ?auto_890728 ?auto_890729 ) ( ON ?auto_890727 ?auto_890728 ) ( ON ?auto_890726 ?auto_890727 ) ( ON ?auto_890725 ?auto_890726 ) ( CLEAR ?auto_890723 ) ( ON ?auto_890724 ?auto_890725 ) ( CLEAR ?auto_890724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_890721 ?auto_890722 ?auto_890723 ?auto_890724 )
      ( MAKE-10PILE ?auto_890721 ?auto_890722 ?auto_890723 ?auto_890724 ?auto_890725 ?auto_890726 ?auto_890727 ?auto_890728 ?auto_890729 ?auto_890730 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890763 - BLOCK
      ?auto_890764 - BLOCK
      ?auto_890765 - BLOCK
      ?auto_890766 - BLOCK
      ?auto_890767 - BLOCK
      ?auto_890768 - BLOCK
      ?auto_890769 - BLOCK
      ?auto_890770 - BLOCK
      ?auto_890771 - BLOCK
      ?auto_890772 - BLOCK
    )
    :vars
    (
      ?auto_890773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890772 ?auto_890773 ) ( ON-TABLE ?auto_890763 ) ( ON ?auto_890764 ?auto_890763 ) ( not ( = ?auto_890763 ?auto_890764 ) ) ( not ( = ?auto_890763 ?auto_890765 ) ) ( not ( = ?auto_890763 ?auto_890766 ) ) ( not ( = ?auto_890763 ?auto_890767 ) ) ( not ( = ?auto_890763 ?auto_890768 ) ) ( not ( = ?auto_890763 ?auto_890769 ) ) ( not ( = ?auto_890763 ?auto_890770 ) ) ( not ( = ?auto_890763 ?auto_890771 ) ) ( not ( = ?auto_890763 ?auto_890772 ) ) ( not ( = ?auto_890763 ?auto_890773 ) ) ( not ( = ?auto_890764 ?auto_890765 ) ) ( not ( = ?auto_890764 ?auto_890766 ) ) ( not ( = ?auto_890764 ?auto_890767 ) ) ( not ( = ?auto_890764 ?auto_890768 ) ) ( not ( = ?auto_890764 ?auto_890769 ) ) ( not ( = ?auto_890764 ?auto_890770 ) ) ( not ( = ?auto_890764 ?auto_890771 ) ) ( not ( = ?auto_890764 ?auto_890772 ) ) ( not ( = ?auto_890764 ?auto_890773 ) ) ( not ( = ?auto_890765 ?auto_890766 ) ) ( not ( = ?auto_890765 ?auto_890767 ) ) ( not ( = ?auto_890765 ?auto_890768 ) ) ( not ( = ?auto_890765 ?auto_890769 ) ) ( not ( = ?auto_890765 ?auto_890770 ) ) ( not ( = ?auto_890765 ?auto_890771 ) ) ( not ( = ?auto_890765 ?auto_890772 ) ) ( not ( = ?auto_890765 ?auto_890773 ) ) ( not ( = ?auto_890766 ?auto_890767 ) ) ( not ( = ?auto_890766 ?auto_890768 ) ) ( not ( = ?auto_890766 ?auto_890769 ) ) ( not ( = ?auto_890766 ?auto_890770 ) ) ( not ( = ?auto_890766 ?auto_890771 ) ) ( not ( = ?auto_890766 ?auto_890772 ) ) ( not ( = ?auto_890766 ?auto_890773 ) ) ( not ( = ?auto_890767 ?auto_890768 ) ) ( not ( = ?auto_890767 ?auto_890769 ) ) ( not ( = ?auto_890767 ?auto_890770 ) ) ( not ( = ?auto_890767 ?auto_890771 ) ) ( not ( = ?auto_890767 ?auto_890772 ) ) ( not ( = ?auto_890767 ?auto_890773 ) ) ( not ( = ?auto_890768 ?auto_890769 ) ) ( not ( = ?auto_890768 ?auto_890770 ) ) ( not ( = ?auto_890768 ?auto_890771 ) ) ( not ( = ?auto_890768 ?auto_890772 ) ) ( not ( = ?auto_890768 ?auto_890773 ) ) ( not ( = ?auto_890769 ?auto_890770 ) ) ( not ( = ?auto_890769 ?auto_890771 ) ) ( not ( = ?auto_890769 ?auto_890772 ) ) ( not ( = ?auto_890769 ?auto_890773 ) ) ( not ( = ?auto_890770 ?auto_890771 ) ) ( not ( = ?auto_890770 ?auto_890772 ) ) ( not ( = ?auto_890770 ?auto_890773 ) ) ( not ( = ?auto_890771 ?auto_890772 ) ) ( not ( = ?auto_890771 ?auto_890773 ) ) ( not ( = ?auto_890772 ?auto_890773 ) ) ( ON ?auto_890771 ?auto_890772 ) ( ON ?auto_890770 ?auto_890771 ) ( ON ?auto_890769 ?auto_890770 ) ( ON ?auto_890768 ?auto_890769 ) ( ON ?auto_890767 ?auto_890768 ) ( ON ?auto_890766 ?auto_890767 ) ( CLEAR ?auto_890764 ) ( ON ?auto_890765 ?auto_890766 ) ( CLEAR ?auto_890765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_890763 ?auto_890764 ?auto_890765 )
      ( MAKE-10PILE ?auto_890763 ?auto_890764 ?auto_890765 ?auto_890766 ?auto_890767 ?auto_890768 ?auto_890769 ?auto_890770 ?auto_890771 ?auto_890772 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890805 - BLOCK
      ?auto_890806 - BLOCK
      ?auto_890807 - BLOCK
      ?auto_890808 - BLOCK
      ?auto_890809 - BLOCK
      ?auto_890810 - BLOCK
      ?auto_890811 - BLOCK
      ?auto_890812 - BLOCK
      ?auto_890813 - BLOCK
      ?auto_890814 - BLOCK
    )
    :vars
    (
      ?auto_890815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890814 ?auto_890815 ) ( ON-TABLE ?auto_890805 ) ( not ( = ?auto_890805 ?auto_890806 ) ) ( not ( = ?auto_890805 ?auto_890807 ) ) ( not ( = ?auto_890805 ?auto_890808 ) ) ( not ( = ?auto_890805 ?auto_890809 ) ) ( not ( = ?auto_890805 ?auto_890810 ) ) ( not ( = ?auto_890805 ?auto_890811 ) ) ( not ( = ?auto_890805 ?auto_890812 ) ) ( not ( = ?auto_890805 ?auto_890813 ) ) ( not ( = ?auto_890805 ?auto_890814 ) ) ( not ( = ?auto_890805 ?auto_890815 ) ) ( not ( = ?auto_890806 ?auto_890807 ) ) ( not ( = ?auto_890806 ?auto_890808 ) ) ( not ( = ?auto_890806 ?auto_890809 ) ) ( not ( = ?auto_890806 ?auto_890810 ) ) ( not ( = ?auto_890806 ?auto_890811 ) ) ( not ( = ?auto_890806 ?auto_890812 ) ) ( not ( = ?auto_890806 ?auto_890813 ) ) ( not ( = ?auto_890806 ?auto_890814 ) ) ( not ( = ?auto_890806 ?auto_890815 ) ) ( not ( = ?auto_890807 ?auto_890808 ) ) ( not ( = ?auto_890807 ?auto_890809 ) ) ( not ( = ?auto_890807 ?auto_890810 ) ) ( not ( = ?auto_890807 ?auto_890811 ) ) ( not ( = ?auto_890807 ?auto_890812 ) ) ( not ( = ?auto_890807 ?auto_890813 ) ) ( not ( = ?auto_890807 ?auto_890814 ) ) ( not ( = ?auto_890807 ?auto_890815 ) ) ( not ( = ?auto_890808 ?auto_890809 ) ) ( not ( = ?auto_890808 ?auto_890810 ) ) ( not ( = ?auto_890808 ?auto_890811 ) ) ( not ( = ?auto_890808 ?auto_890812 ) ) ( not ( = ?auto_890808 ?auto_890813 ) ) ( not ( = ?auto_890808 ?auto_890814 ) ) ( not ( = ?auto_890808 ?auto_890815 ) ) ( not ( = ?auto_890809 ?auto_890810 ) ) ( not ( = ?auto_890809 ?auto_890811 ) ) ( not ( = ?auto_890809 ?auto_890812 ) ) ( not ( = ?auto_890809 ?auto_890813 ) ) ( not ( = ?auto_890809 ?auto_890814 ) ) ( not ( = ?auto_890809 ?auto_890815 ) ) ( not ( = ?auto_890810 ?auto_890811 ) ) ( not ( = ?auto_890810 ?auto_890812 ) ) ( not ( = ?auto_890810 ?auto_890813 ) ) ( not ( = ?auto_890810 ?auto_890814 ) ) ( not ( = ?auto_890810 ?auto_890815 ) ) ( not ( = ?auto_890811 ?auto_890812 ) ) ( not ( = ?auto_890811 ?auto_890813 ) ) ( not ( = ?auto_890811 ?auto_890814 ) ) ( not ( = ?auto_890811 ?auto_890815 ) ) ( not ( = ?auto_890812 ?auto_890813 ) ) ( not ( = ?auto_890812 ?auto_890814 ) ) ( not ( = ?auto_890812 ?auto_890815 ) ) ( not ( = ?auto_890813 ?auto_890814 ) ) ( not ( = ?auto_890813 ?auto_890815 ) ) ( not ( = ?auto_890814 ?auto_890815 ) ) ( ON ?auto_890813 ?auto_890814 ) ( ON ?auto_890812 ?auto_890813 ) ( ON ?auto_890811 ?auto_890812 ) ( ON ?auto_890810 ?auto_890811 ) ( ON ?auto_890809 ?auto_890810 ) ( ON ?auto_890808 ?auto_890809 ) ( ON ?auto_890807 ?auto_890808 ) ( CLEAR ?auto_890805 ) ( ON ?auto_890806 ?auto_890807 ) ( CLEAR ?auto_890806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_890805 ?auto_890806 )
      ( MAKE-10PILE ?auto_890805 ?auto_890806 ?auto_890807 ?auto_890808 ?auto_890809 ?auto_890810 ?auto_890811 ?auto_890812 ?auto_890813 ?auto_890814 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_890847 - BLOCK
      ?auto_890848 - BLOCK
      ?auto_890849 - BLOCK
      ?auto_890850 - BLOCK
      ?auto_890851 - BLOCK
      ?auto_890852 - BLOCK
      ?auto_890853 - BLOCK
      ?auto_890854 - BLOCK
      ?auto_890855 - BLOCK
      ?auto_890856 - BLOCK
    )
    :vars
    (
      ?auto_890857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890856 ?auto_890857 ) ( not ( = ?auto_890847 ?auto_890848 ) ) ( not ( = ?auto_890847 ?auto_890849 ) ) ( not ( = ?auto_890847 ?auto_890850 ) ) ( not ( = ?auto_890847 ?auto_890851 ) ) ( not ( = ?auto_890847 ?auto_890852 ) ) ( not ( = ?auto_890847 ?auto_890853 ) ) ( not ( = ?auto_890847 ?auto_890854 ) ) ( not ( = ?auto_890847 ?auto_890855 ) ) ( not ( = ?auto_890847 ?auto_890856 ) ) ( not ( = ?auto_890847 ?auto_890857 ) ) ( not ( = ?auto_890848 ?auto_890849 ) ) ( not ( = ?auto_890848 ?auto_890850 ) ) ( not ( = ?auto_890848 ?auto_890851 ) ) ( not ( = ?auto_890848 ?auto_890852 ) ) ( not ( = ?auto_890848 ?auto_890853 ) ) ( not ( = ?auto_890848 ?auto_890854 ) ) ( not ( = ?auto_890848 ?auto_890855 ) ) ( not ( = ?auto_890848 ?auto_890856 ) ) ( not ( = ?auto_890848 ?auto_890857 ) ) ( not ( = ?auto_890849 ?auto_890850 ) ) ( not ( = ?auto_890849 ?auto_890851 ) ) ( not ( = ?auto_890849 ?auto_890852 ) ) ( not ( = ?auto_890849 ?auto_890853 ) ) ( not ( = ?auto_890849 ?auto_890854 ) ) ( not ( = ?auto_890849 ?auto_890855 ) ) ( not ( = ?auto_890849 ?auto_890856 ) ) ( not ( = ?auto_890849 ?auto_890857 ) ) ( not ( = ?auto_890850 ?auto_890851 ) ) ( not ( = ?auto_890850 ?auto_890852 ) ) ( not ( = ?auto_890850 ?auto_890853 ) ) ( not ( = ?auto_890850 ?auto_890854 ) ) ( not ( = ?auto_890850 ?auto_890855 ) ) ( not ( = ?auto_890850 ?auto_890856 ) ) ( not ( = ?auto_890850 ?auto_890857 ) ) ( not ( = ?auto_890851 ?auto_890852 ) ) ( not ( = ?auto_890851 ?auto_890853 ) ) ( not ( = ?auto_890851 ?auto_890854 ) ) ( not ( = ?auto_890851 ?auto_890855 ) ) ( not ( = ?auto_890851 ?auto_890856 ) ) ( not ( = ?auto_890851 ?auto_890857 ) ) ( not ( = ?auto_890852 ?auto_890853 ) ) ( not ( = ?auto_890852 ?auto_890854 ) ) ( not ( = ?auto_890852 ?auto_890855 ) ) ( not ( = ?auto_890852 ?auto_890856 ) ) ( not ( = ?auto_890852 ?auto_890857 ) ) ( not ( = ?auto_890853 ?auto_890854 ) ) ( not ( = ?auto_890853 ?auto_890855 ) ) ( not ( = ?auto_890853 ?auto_890856 ) ) ( not ( = ?auto_890853 ?auto_890857 ) ) ( not ( = ?auto_890854 ?auto_890855 ) ) ( not ( = ?auto_890854 ?auto_890856 ) ) ( not ( = ?auto_890854 ?auto_890857 ) ) ( not ( = ?auto_890855 ?auto_890856 ) ) ( not ( = ?auto_890855 ?auto_890857 ) ) ( not ( = ?auto_890856 ?auto_890857 ) ) ( ON ?auto_890855 ?auto_890856 ) ( ON ?auto_890854 ?auto_890855 ) ( ON ?auto_890853 ?auto_890854 ) ( ON ?auto_890852 ?auto_890853 ) ( ON ?auto_890851 ?auto_890852 ) ( ON ?auto_890850 ?auto_890851 ) ( ON ?auto_890849 ?auto_890850 ) ( ON ?auto_890848 ?auto_890849 ) ( ON ?auto_890847 ?auto_890848 ) ( CLEAR ?auto_890847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_890847 )
      ( MAKE-10PILE ?auto_890847 ?auto_890848 ?auto_890849 ?auto_890850 ?auto_890851 ?auto_890852 ?auto_890853 ?auto_890854 ?auto_890855 ?auto_890856 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_890890 - BLOCK
      ?auto_890891 - BLOCK
      ?auto_890892 - BLOCK
      ?auto_890893 - BLOCK
      ?auto_890894 - BLOCK
      ?auto_890895 - BLOCK
      ?auto_890896 - BLOCK
      ?auto_890897 - BLOCK
      ?auto_890898 - BLOCK
      ?auto_890899 - BLOCK
      ?auto_890900 - BLOCK
    )
    :vars
    (
      ?auto_890901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_890899 ) ( ON ?auto_890900 ?auto_890901 ) ( CLEAR ?auto_890900 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_890890 ) ( ON ?auto_890891 ?auto_890890 ) ( ON ?auto_890892 ?auto_890891 ) ( ON ?auto_890893 ?auto_890892 ) ( ON ?auto_890894 ?auto_890893 ) ( ON ?auto_890895 ?auto_890894 ) ( ON ?auto_890896 ?auto_890895 ) ( ON ?auto_890897 ?auto_890896 ) ( ON ?auto_890898 ?auto_890897 ) ( ON ?auto_890899 ?auto_890898 ) ( not ( = ?auto_890890 ?auto_890891 ) ) ( not ( = ?auto_890890 ?auto_890892 ) ) ( not ( = ?auto_890890 ?auto_890893 ) ) ( not ( = ?auto_890890 ?auto_890894 ) ) ( not ( = ?auto_890890 ?auto_890895 ) ) ( not ( = ?auto_890890 ?auto_890896 ) ) ( not ( = ?auto_890890 ?auto_890897 ) ) ( not ( = ?auto_890890 ?auto_890898 ) ) ( not ( = ?auto_890890 ?auto_890899 ) ) ( not ( = ?auto_890890 ?auto_890900 ) ) ( not ( = ?auto_890890 ?auto_890901 ) ) ( not ( = ?auto_890891 ?auto_890892 ) ) ( not ( = ?auto_890891 ?auto_890893 ) ) ( not ( = ?auto_890891 ?auto_890894 ) ) ( not ( = ?auto_890891 ?auto_890895 ) ) ( not ( = ?auto_890891 ?auto_890896 ) ) ( not ( = ?auto_890891 ?auto_890897 ) ) ( not ( = ?auto_890891 ?auto_890898 ) ) ( not ( = ?auto_890891 ?auto_890899 ) ) ( not ( = ?auto_890891 ?auto_890900 ) ) ( not ( = ?auto_890891 ?auto_890901 ) ) ( not ( = ?auto_890892 ?auto_890893 ) ) ( not ( = ?auto_890892 ?auto_890894 ) ) ( not ( = ?auto_890892 ?auto_890895 ) ) ( not ( = ?auto_890892 ?auto_890896 ) ) ( not ( = ?auto_890892 ?auto_890897 ) ) ( not ( = ?auto_890892 ?auto_890898 ) ) ( not ( = ?auto_890892 ?auto_890899 ) ) ( not ( = ?auto_890892 ?auto_890900 ) ) ( not ( = ?auto_890892 ?auto_890901 ) ) ( not ( = ?auto_890893 ?auto_890894 ) ) ( not ( = ?auto_890893 ?auto_890895 ) ) ( not ( = ?auto_890893 ?auto_890896 ) ) ( not ( = ?auto_890893 ?auto_890897 ) ) ( not ( = ?auto_890893 ?auto_890898 ) ) ( not ( = ?auto_890893 ?auto_890899 ) ) ( not ( = ?auto_890893 ?auto_890900 ) ) ( not ( = ?auto_890893 ?auto_890901 ) ) ( not ( = ?auto_890894 ?auto_890895 ) ) ( not ( = ?auto_890894 ?auto_890896 ) ) ( not ( = ?auto_890894 ?auto_890897 ) ) ( not ( = ?auto_890894 ?auto_890898 ) ) ( not ( = ?auto_890894 ?auto_890899 ) ) ( not ( = ?auto_890894 ?auto_890900 ) ) ( not ( = ?auto_890894 ?auto_890901 ) ) ( not ( = ?auto_890895 ?auto_890896 ) ) ( not ( = ?auto_890895 ?auto_890897 ) ) ( not ( = ?auto_890895 ?auto_890898 ) ) ( not ( = ?auto_890895 ?auto_890899 ) ) ( not ( = ?auto_890895 ?auto_890900 ) ) ( not ( = ?auto_890895 ?auto_890901 ) ) ( not ( = ?auto_890896 ?auto_890897 ) ) ( not ( = ?auto_890896 ?auto_890898 ) ) ( not ( = ?auto_890896 ?auto_890899 ) ) ( not ( = ?auto_890896 ?auto_890900 ) ) ( not ( = ?auto_890896 ?auto_890901 ) ) ( not ( = ?auto_890897 ?auto_890898 ) ) ( not ( = ?auto_890897 ?auto_890899 ) ) ( not ( = ?auto_890897 ?auto_890900 ) ) ( not ( = ?auto_890897 ?auto_890901 ) ) ( not ( = ?auto_890898 ?auto_890899 ) ) ( not ( = ?auto_890898 ?auto_890900 ) ) ( not ( = ?auto_890898 ?auto_890901 ) ) ( not ( = ?auto_890899 ?auto_890900 ) ) ( not ( = ?auto_890899 ?auto_890901 ) ) ( not ( = ?auto_890900 ?auto_890901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_890900 ?auto_890901 )
      ( !STACK ?auto_890900 ?auto_890899 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_890936 - BLOCK
      ?auto_890937 - BLOCK
      ?auto_890938 - BLOCK
      ?auto_890939 - BLOCK
      ?auto_890940 - BLOCK
      ?auto_890941 - BLOCK
      ?auto_890942 - BLOCK
      ?auto_890943 - BLOCK
      ?auto_890944 - BLOCK
      ?auto_890945 - BLOCK
      ?auto_890946 - BLOCK
    )
    :vars
    (
      ?auto_890947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890946 ?auto_890947 ) ( ON-TABLE ?auto_890936 ) ( ON ?auto_890937 ?auto_890936 ) ( ON ?auto_890938 ?auto_890937 ) ( ON ?auto_890939 ?auto_890938 ) ( ON ?auto_890940 ?auto_890939 ) ( ON ?auto_890941 ?auto_890940 ) ( ON ?auto_890942 ?auto_890941 ) ( ON ?auto_890943 ?auto_890942 ) ( ON ?auto_890944 ?auto_890943 ) ( not ( = ?auto_890936 ?auto_890937 ) ) ( not ( = ?auto_890936 ?auto_890938 ) ) ( not ( = ?auto_890936 ?auto_890939 ) ) ( not ( = ?auto_890936 ?auto_890940 ) ) ( not ( = ?auto_890936 ?auto_890941 ) ) ( not ( = ?auto_890936 ?auto_890942 ) ) ( not ( = ?auto_890936 ?auto_890943 ) ) ( not ( = ?auto_890936 ?auto_890944 ) ) ( not ( = ?auto_890936 ?auto_890945 ) ) ( not ( = ?auto_890936 ?auto_890946 ) ) ( not ( = ?auto_890936 ?auto_890947 ) ) ( not ( = ?auto_890937 ?auto_890938 ) ) ( not ( = ?auto_890937 ?auto_890939 ) ) ( not ( = ?auto_890937 ?auto_890940 ) ) ( not ( = ?auto_890937 ?auto_890941 ) ) ( not ( = ?auto_890937 ?auto_890942 ) ) ( not ( = ?auto_890937 ?auto_890943 ) ) ( not ( = ?auto_890937 ?auto_890944 ) ) ( not ( = ?auto_890937 ?auto_890945 ) ) ( not ( = ?auto_890937 ?auto_890946 ) ) ( not ( = ?auto_890937 ?auto_890947 ) ) ( not ( = ?auto_890938 ?auto_890939 ) ) ( not ( = ?auto_890938 ?auto_890940 ) ) ( not ( = ?auto_890938 ?auto_890941 ) ) ( not ( = ?auto_890938 ?auto_890942 ) ) ( not ( = ?auto_890938 ?auto_890943 ) ) ( not ( = ?auto_890938 ?auto_890944 ) ) ( not ( = ?auto_890938 ?auto_890945 ) ) ( not ( = ?auto_890938 ?auto_890946 ) ) ( not ( = ?auto_890938 ?auto_890947 ) ) ( not ( = ?auto_890939 ?auto_890940 ) ) ( not ( = ?auto_890939 ?auto_890941 ) ) ( not ( = ?auto_890939 ?auto_890942 ) ) ( not ( = ?auto_890939 ?auto_890943 ) ) ( not ( = ?auto_890939 ?auto_890944 ) ) ( not ( = ?auto_890939 ?auto_890945 ) ) ( not ( = ?auto_890939 ?auto_890946 ) ) ( not ( = ?auto_890939 ?auto_890947 ) ) ( not ( = ?auto_890940 ?auto_890941 ) ) ( not ( = ?auto_890940 ?auto_890942 ) ) ( not ( = ?auto_890940 ?auto_890943 ) ) ( not ( = ?auto_890940 ?auto_890944 ) ) ( not ( = ?auto_890940 ?auto_890945 ) ) ( not ( = ?auto_890940 ?auto_890946 ) ) ( not ( = ?auto_890940 ?auto_890947 ) ) ( not ( = ?auto_890941 ?auto_890942 ) ) ( not ( = ?auto_890941 ?auto_890943 ) ) ( not ( = ?auto_890941 ?auto_890944 ) ) ( not ( = ?auto_890941 ?auto_890945 ) ) ( not ( = ?auto_890941 ?auto_890946 ) ) ( not ( = ?auto_890941 ?auto_890947 ) ) ( not ( = ?auto_890942 ?auto_890943 ) ) ( not ( = ?auto_890942 ?auto_890944 ) ) ( not ( = ?auto_890942 ?auto_890945 ) ) ( not ( = ?auto_890942 ?auto_890946 ) ) ( not ( = ?auto_890942 ?auto_890947 ) ) ( not ( = ?auto_890943 ?auto_890944 ) ) ( not ( = ?auto_890943 ?auto_890945 ) ) ( not ( = ?auto_890943 ?auto_890946 ) ) ( not ( = ?auto_890943 ?auto_890947 ) ) ( not ( = ?auto_890944 ?auto_890945 ) ) ( not ( = ?auto_890944 ?auto_890946 ) ) ( not ( = ?auto_890944 ?auto_890947 ) ) ( not ( = ?auto_890945 ?auto_890946 ) ) ( not ( = ?auto_890945 ?auto_890947 ) ) ( not ( = ?auto_890946 ?auto_890947 ) ) ( CLEAR ?auto_890944 ) ( ON ?auto_890945 ?auto_890946 ) ( CLEAR ?auto_890945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_890936 ?auto_890937 ?auto_890938 ?auto_890939 ?auto_890940 ?auto_890941 ?auto_890942 ?auto_890943 ?auto_890944 ?auto_890945 )
      ( MAKE-11PILE ?auto_890936 ?auto_890937 ?auto_890938 ?auto_890939 ?auto_890940 ?auto_890941 ?auto_890942 ?auto_890943 ?auto_890944 ?auto_890945 ?auto_890946 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_890982 - BLOCK
      ?auto_890983 - BLOCK
      ?auto_890984 - BLOCK
      ?auto_890985 - BLOCK
      ?auto_890986 - BLOCK
      ?auto_890987 - BLOCK
      ?auto_890988 - BLOCK
      ?auto_890989 - BLOCK
      ?auto_890990 - BLOCK
      ?auto_890991 - BLOCK
      ?auto_890992 - BLOCK
    )
    :vars
    (
      ?auto_890993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_890992 ?auto_890993 ) ( ON-TABLE ?auto_890982 ) ( ON ?auto_890983 ?auto_890982 ) ( ON ?auto_890984 ?auto_890983 ) ( ON ?auto_890985 ?auto_890984 ) ( ON ?auto_890986 ?auto_890985 ) ( ON ?auto_890987 ?auto_890986 ) ( ON ?auto_890988 ?auto_890987 ) ( ON ?auto_890989 ?auto_890988 ) ( not ( = ?auto_890982 ?auto_890983 ) ) ( not ( = ?auto_890982 ?auto_890984 ) ) ( not ( = ?auto_890982 ?auto_890985 ) ) ( not ( = ?auto_890982 ?auto_890986 ) ) ( not ( = ?auto_890982 ?auto_890987 ) ) ( not ( = ?auto_890982 ?auto_890988 ) ) ( not ( = ?auto_890982 ?auto_890989 ) ) ( not ( = ?auto_890982 ?auto_890990 ) ) ( not ( = ?auto_890982 ?auto_890991 ) ) ( not ( = ?auto_890982 ?auto_890992 ) ) ( not ( = ?auto_890982 ?auto_890993 ) ) ( not ( = ?auto_890983 ?auto_890984 ) ) ( not ( = ?auto_890983 ?auto_890985 ) ) ( not ( = ?auto_890983 ?auto_890986 ) ) ( not ( = ?auto_890983 ?auto_890987 ) ) ( not ( = ?auto_890983 ?auto_890988 ) ) ( not ( = ?auto_890983 ?auto_890989 ) ) ( not ( = ?auto_890983 ?auto_890990 ) ) ( not ( = ?auto_890983 ?auto_890991 ) ) ( not ( = ?auto_890983 ?auto_890992 ) ) ( not ( = ?auto_890983 ?auto_890993 ) ) ( not ( = ?auto_890984 ?auto_890985 ) ) ( not ( = ?auto_890984 ?auto_890986 ) ) ( not ( = ?auto_890984 ?auto_890987 ) ) ( not ( = ?auto_890984 ?auto_890988 ) ) ( not ( = ?auto_890984 ?auto_890989 ) ) ( not ( = ?auto_890984 ?auto_890990 ) ) ( not ( = ?auto_890984 ?auto_890991 ) ) ( not ( = ?auto_890984 ?auto_890992 ) ) ( not ( = ?auto_890984 ?auto_890993 ) ) ( not ( = ?auto_890985 ?auto_890986 ) ) ( not ( = ?auto_890985 ?auto_890987 ) ) ( not ( = ?auto_890985 ?auto_890988 ) ) ( not ( = ?auto_890985 ?auto_890989 ) ) ( not ( = ?auto_890985 ?auto_890990 ) ) ( not ( = ?auto_890985 ?auto_890991 ) ) ( not ( = ?auto_890985 ?auto_890992 ) ) ( not ( = ?auto_890985 ?auto_890993 ) ) ( not ( = ?auto_890986 ?auto_890987 ) ) ( not ( = ?auto_890986 ?auto_890988 ) ) ( not ( = ?auto_890986 ?auto_890989 ) ) ( not ( = ?auto_890986 ?auto_890990 ) ) ( not ( = ?auto_890986 ?auto_890991 ) ) ( not ( = ?auto_890986 ?auto_890992 ) ) ( not ( = ?auto_890986 ?auto_890993 ) ) ( not ( = ?auto_890987 ?auto_890988 ) ) ( not ( = ?auto_890987 ?auto_890989 ) ) ( not ( = ?auto_890987 ?auto_890990 ) ) ( not ( = ?auto_890987 ?auto_890991 ) ) ( not ( = ?auto_890987 ?auto_890992 ) ) ( not ( = ?auto_890987 ?auto_890993 ) ) ( not ( = ?auto_890988 ?auto_890989 ) ) ( not ( = ?auto_890988 ?auto_890990 ) ) ( not ( = ?auto_890988 ?auto_890991 ) ) ( not ( = ?auto_890988 ?auto_890992 ) ) ( not ( = ?auto_890988 ?auto_890993 ) ) ( not ( = ?auto_890989 ?auto_890990 ) ) ( not ( = ?auto_890989 ?auto_890991 ) ) ( not ( = ?auto_890989 ?auto_890992 ) ) ( not ( = ?auto_890989 ?auto_890993 ) ) ( not ( = ?auto_890990 ?auto_890991 ) ) ( not ( = ?auto_890990 ?auto_890992 ) ) ( not ( = ?auto_890990 ?auto_890993 ) ) ( not ( = ?auto_890991 ?auto_890992 ) ) ( not ( = ?auto_890991 ?auto_890993 ) ) ( not ( = ?auto_890992 ?auto_890993 ) ) ( ON ?auto_890991 ?auto_890992 ) ( CLEAR ?auto_890989 ) ( ON ?auto_890990 ?auto_890991 ) ( CLEAR ?auto_890990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_890982 ?auto_890983 ?auto_890984 ?auto_890985 ?auto_890986 ?auto_890987 ?auto_890988 ?auto_890989 ?auto_890990 )
      ( MAKE-11PILE ?auto_890982 ?auto_890983 ?auto_890984 ?auto_890985 ?auto_890986 ?auto_890987 ?auto_890988 ?auto_890989 ?auto_890990 ?auto_890991 ?auto_890992 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891028 - BLOCK
      ?auto_891029 - BLOCK
      ?auto_891030 - BLOCK
      ?auto_891031 - BLOCK
      ?auto_891032 - BLOCK
      ?auto_891033 - BLOCK
      ?auto_891034 - BLOCK
      ?auto_891035 - BLOCK
      ?auto_891036 - BLOCK
      ?auto_891037 - BLOCK
      ?auto_891038 - BLOCK
    )
    :vars
    (
      ?auto_891039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891038 ?auto_891039 ) ( ON-TABLE ?auto_891028 ) ( ON ?auto_891029 ?auto_891028 ) ( ON ?auto_891030 ?auto_891029 ) ( ON ?auto_891031 ?auto_891030 ) ( ON ?auto_891032 ?auto_891031 ) ( ON ?auto_891033 ?auto_891032 ) ( ON ?auto_891034 ?auto_891033 ) ( not ( = ?auto_891028 ?auto_891029 ) ) ( not ( = ?auto_891028 ?auto_891030 ) ) ( not ( = ?auto_891028 ?auto_891031 ) ) ( not ( = ?auto_891028 ?auto_891032 ) ) ( not ( = ?auto_891028 ?auto_891033 ) ) ( not ( = ?auto_891028 ?auto_891034 ) ) ( not ( = ?auto_891028 ?auto_891035 ) ) ( not ( = ?auto_891028 ?auto_891036 ) ) ( not ( = ?auto_891028 ?auto_891037 ) ) ( not ( = ?auto_891028 ?auto_891038 ) ) ( not ( = ?auto_891028 ?auto_891039 ) ) ( not ( = ?auto_891029 ?auto_891030 ) ) ( not ( = ?auto_891029 ?auto_891031 ) ) ( not ( = ?auto_891029 ?auto_891032 ) ) ( not ( = ?auto_891029 ?auto_891033 ) ) ( not ( = ?auto_891029 ?auto_891034 ) ) ( not ( = ?auto_891029 ?auto_891035 ) ) ( not ( = ?auto_891029 ?auto_891036 ) ) ( not ( = ?auto_891029 ?auto_891037 ) ) ( not ( = ?auto_891029 ?auto_891038 ) ) ( not ( = ?auto_891029 ?auto_891039 ) ) ( not ( = ?auto_891030 ?auto_891031 ) ) ( not ( = ?auto_891030 ?auto_891032 ) ) ( not ( = ?auto_891030 ?auto_891033 ) ) ( not ( = ?auto_891030 ?auto_891034 ) ) ( not ( = ?auto_891030 ?auto_891035 ) ) ( not ( = ?auto_891030 ?auto_891036 ) ) ( not ( = ?auto_891030 ?auto_891037 ) ) ( not ( = ?auto_891030 ?auto_891038 ) ) ( not ( = ?auto_891030 ?auto_891039 ) ) ( not ( = ?auto_891031 ?auto_891032 ) ) ( not ( = ?auto_891031 ?auto_891033 ) ) ( not ( = ?auto_891031 ?auto_891034 ) ) ( not ( = ?auto_891031 ?auto_891035 ) ) ( not ( = ?auto_891031 ?auto_891036 ) ) ( not ( = ?auto_891031 ?auto_891037 ) ) ( not ( = ?auto_891031 ?auto_891038 ) ) ( not ( = ?auto_891031 ?auto_891039 ) ) ( not ( = ?auto_891032 ?auto_891033 ) ) ( not ( = ?auto_891032 ?auto_891034 ) ) ( not ( = ?auto_891032 ?auto_891035 ) ) ( not ( = ?auto_891032 ?auto_891036 ) ) ( not ( = ?auto_891032 ?auto_891037 ) ) ( not ( = ?auto_891032 ?auto_891038 ) ) ( not ( = ?auto_891032 ?auto_891039 ) ) ( not ( = ?auto_891033 ?auto_891034 ) ) ( not ( = ?auto_891033 ?auto_891035 ) ) ( not ( = ?auto_891033 ?auto_891036 ) ) ( not ( = ?auto_891033 ?auto_891037 ) ) ( not ( = ?auto_891033 ?auto_891038 ) ) ( not ( = ?auto_891033 ?auto_891039 ) ) ( not ( = ?auto_891034 ?auto_891035 ) ) ( not ( = ?auto_891034 ?auto_891036 ) ) ( not ( = ?auto_891034 ?auto_891037 ) ) ( not ( = ?auto_891034 ?auto_891038 ) ) ( not ( = ?auto_891034 ?auto_891039 ) ) ( not ( = ?auto_891035 ?auto_891036 ) ) ( not ( = ?auto_891035 ?auto_891037 ) ) ( not ( = ?auto_891035 ?auto_891038 ) ) ( not ( = ?auto_891035 ?auto_891039 ) ) ( not ( = ?auto_891036 ?auto_891037 ) ) ( not ( = ?auto_891036 ?auto_891038 ) ) ( not ( = ?auto_891036 ?auto_891039 ) ) ( not ( = ?auto_891037 ?auto_891038 ) ) ( not ( = ?auto_891037 ?auto_891039 ) ) ( not ( = ?auto_891038 ?auto_891039 ) ) ( ON ?auto_891037 ?auto_891038 ) ( ON ?auto_891036 ?auto_891037 ) ( CLEAR ?auto_891034 ) ( ON ?auto_891035 ?auto_891036 ) ( CLEAR ?auto_891035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_891028 ?auto_891029 ?auto_891030 ?auto_891031 ?auto_891032 ?auto_891033 ?auto_891034 ?auto_891035 )
      ( MAKE-11PILE ?auto_891028 ?auto_891029 ?auto_891030 ?auto_891031 ?auto_891032 ?auto_891033 ?auto_891034 ?auto_891035 ?auto_891036 ?auto_891037 ?auto_891038 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891074 - BLOCK
      ?auto_891075 - BLOCK
      ?auto_891076 - BLOCK
      ?auto_891077 - BLOCK
      ?auto_891078 - BLOCK
      ?auto_891079 - BLOCK
      ?auto_891080 - BLOCK
      ?auto_891081 - BLOCK
      ?auto_891082 - BLOCK
      ?auto_891083 - BLOCK
      ?auto_891084 - BLOCK
    )
    :vars
    (
      ?auto_891085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891084 ?auto_891085 ) ( ON-TABLE ?auto_891074 ) ( ON ?auto_891075 ?auto_891074 ) ( ON ?auto_891076 ?auto_891075 ) ( ON ?auto_891077 ?auto_891076 ) ( ON ?auto_891078 ?auto_891077 ) ( ON ?auto_891079 ?auto_891078 ) ( not ( = ?auto_891074 ?auto_891075 ) ) ( not ( = ?auto_891074 ?auto_891076 ) ) ( not ( = ?auto_891074 ?auto_891077 ) ) ( not ( = ?auto_891074 ?auto_891078 ) ) ( not ( = ?auto_891074 ?auto_891079 ) ) ( not ( = ?auto_891074 ?auto_891080 ) ) ( not ( = ?auto_891074 ?auto_891081 ) ) ( not ( = ?auto_891074 ?auto_891082 ) ) ( not ( = ?auto_891074 ?auto_891083 ) ) ( not ( = ?auto_891074 ?auto_891084 ) ) ( not ( = ?auto_891074 ?auto_891085 ) ) ( not ( = ?auto_891075 ?auto_891076 ) ) ( not ( = ?auto_891075 ?auto_891077 ) ) ( not ( = ?auto_891075 ?auto_891078 ) ) ( not ( = ?auto_891075 ?auto_891079 ) ) ( not ( = ?auto_891075 ?auto_891080 ) ) ( not ( = ?auto_891075 ?auto_891081 ) ) ( not ( = ?auto_891075 ?auto_891082 ) ) ( not ( = ?auto_891075 ?auto_891083 ) ) ( not ( = ?auto_891075 ?auto_891084 ) ) ( not ( = ?auto_891075 ?auto_891085 ) ) ( not ( = ?auto_891076 ?auto_891077 ) ) ( not ( = ?auto_891076 ?auto_891078 ) ) ( not ( = ?auto_891076 ?auto_891079 ) ) ( not ( = ?auto_891076 ?auto_891080 ) ) ( not ( = ?auto_891076 ?auto_891081 ) ) ( not ( = ?auto_891076 ?auto_891082 ) ) ( not ( = ?auto_891076 ?auto_891083 ) ) ( not ( = ?auto_891076 ?auto_891084 ) ) ( not ( = ?auto_891076 ?auto_891085 ) ) ( not ( = ?auto_891077 ?auto_891078 ) ) ( not ( = ?auto_891077 ?auto_891079 ) ) ( not ( = ?auto_891077 ?auto_891080 ) ) ( not ( = ?auto_891077 ?auto_891081 ) ) ( not ( = ?auto_891077 ?auto_891082 ) ) ( not ( = ?auto_891077 ?auto_891083 ) ) ( not ( = ?auto_891077 ?auto_891084 ) ) ( not ( = ?auto_891077 ?auto_891085 ) ) ( not ( = ?auto_891078 ?auto_891079 ) ) ( not ( = ?auto_891078 ?auto_891080 ) ) ( not ( = ?auto_891078 ?auto_891081 ) ) ( not ( = ?auto_891078 ?auto_891082 ) ) ( not ( = ?auto_891078 ?auto_891083 ) ) ( not ( = ?auto_891078 ?auto_891084 ) ) ( not ( = ?auto_891078 ?auto_891085 ) ) ( not ( = ?auto_891079 ?auto_891080 ) ) ( not ( = ?auto_891079 ?auto_891081 ) ) ( not ( = ?auto_891079 ?auto_891082 ) ) ( not ( = ?auto_891079 ?auto_891083 ) ) ( not ( = ?auto_891079 ?auto_891084 ) ) ( not ( = ?auto_891079 ?auto_891085 ) ) ( not ( = ?auto_891080 ?auto_891081 ) ) ( not ( = ?auto_891080 ?auto_891082 ) ) ( not ( = ?auto_891080 ?auto_891083 ) ) ( not ( = ?auto_891080 ?auto_891084 ) ) ( not ( = ?auto_891080 ?auto_891085 ) ) ( not ( = ?auto_891081 ?auto_891082 ) ) ( not ( = ?auto_891081 ?auto_891083 ) ) ( not ( = ?auto_891081 ?auto_891084 ) ) ( not ( = ?auto_891081 ?auto_891085 ) ) ( not ( = ?auto_891082 ?auto_891083 ) ) ( not ( = ?auto_891082 ?auto_891084 ) ) ( not ( = ?auto_891082 ?auto_891085 ) ) ( not ( = ?auto_891083 ?auto_891084 ) ) ( not ( = ?auto_891083 ?auto_891085 ) ) ( not ( = ?auto_891084 ?auto_891085 ) ) ( ON ?auto_891083 ?auto_891084 ) ( ON ?auto_891082 ?auto_891083 ) ( ON ?auto_891081 ?auto_891082 ) ( CLEAR ?auto_891079 ) ( ON ?auto_891080 ?auto_891081 ) ( CLEAR ?auto_891080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_891074 ?auto_891075 ?auto_891076 ?auto_891077 ?auto_891078 ?auto_891079 ?auto_891080 )
      ( MAKE-11PILE ?auto_891074 ?auto_891075 ?auto_891076 ?auto_891077 ?auto_891078 ?auto_891079 ?auto_891080 ?auto_891081 ?auto_891082 ?auto_891083 ?auto_891084 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891120 - BLOCK
      ?auto_891121 - BLOCK
      ?auto_891122 - BLOCK
      ?auto_891123 - BLOCK
      ?auto_891124 - BLOCK
      ?auto_891125 - BLOCK
      ?auto_891126 - BLOCK
      ?auto_891127 - BLOCK
      ?auto_891128 - BLOCK
      ?auto_891129 - BLOCK
      ?auto_891130 - BLOCK
    )
    :vars
    (
      ?auto_891131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891130 ?auto_891131 ) ( ON-TABLE ?auto_891120 ) ( ON ?auto_891121 ?auto_891120 ) ( ON ?auto_891122 ?auto_891121 ) ( ON ?auto_891123 ?auto_891122 ) ( ON ?auto_891124 ?auto_891123 ) ( not ( = ?auto_891120 ?auto_891121 ) ) ( not ( = ?auto_891120 ?auto_891122 ) ) ( not ( = ?auto_891120 ?auto_891123 ) ) ( not ( = ?auto_891120 ?auto_891124 ) ) ( not ( = ?auto_891120 ?auto_891125 ) ) ( not ( = ?auto_891120 ?auto_891126 ) ) ( not ( = ?auto_891120 ?auto_891127 ) ) ( not ( = ?auto_891120 ?auto_891128 ) ) ( not ( = ?auto_891120 ?auto_891129 ) ) ( not ( = ?auto_891120 ?auto_891130 ) ) ( not ( = ?auto_891120 ?auto_891131 ) ) ( not ( = ?auto_891121 ?auto_891122 ) ) ( not ( = ?auto_891121 ?auto_891123 ) ) ( not ( = ?auto_891121 ?auto_891124 ) ) ( not ( = ?auto_891121 ?auto_891125 ) ) ( not ( = ?auto_891121 ?auto_891126 ) ) ( not ( = ?auto_891121 ?auto_891127 ) ) ( not ( = ?auto_891121 ?auto_891128 ) ) ( not ( = ?auto_891121 ?auto_891129 ) ) ( not ( = ?auto_891121 ?auto_891130 ) ) ( not ( = ?auto_891121 ?auto_891131 ) ) ( not ( = ?auto_891122 ?auto_891123 ) ) ( not ( = ?auto_891122 ?auto_891124 ) ) ( not ( = ?auto_891122 ?auto_891125 ) ) ( not ( = ?auto_891122 ?auto_891126 ) ) ( not ( = ?auto_891122 ?auto_891127 ) ) ( not ( = ?auto_891122 ?auto_891128 ) ) ( not ( = ?auto_891122 ?auto_891129 ) ) ( not ( = ?auto_891122 ?auto_891130 ) ) ( not ( = ?auto_891122 ?auto_891131 ) ) ( not ( = ?auto_891123 ?auto_891124 ) ) ( not ( = ?auto_891123 ?auto_891125 ) ) ( not ( = ?auto_891123 ?auto_891126 ) ) ( not ( = ?auto_891123 ?auto_891127 ) ) ( not ( = ?auto_891123 ?auto_891128 ) ) ( not ( = ?auto_891123 ?auto_891129 ) ) ( not ( = ?auto_891123 ?auto_891130 ) ) ( not ( = ?auto_891123 ?auto_891131 ) ) ( not ( = ?auto_891124 ?auto_891125 ) ) ( not ( = ?auto_891124 ?auto_891126 ) ) ( not ( = ?auto_891124 ?auto_891127 ) ) ( not ( = ?auto_891124 ?auto_891128 ) ) ( not ( = ?auto_891124 ?auto_891129 ) ) ( not ( = ?auto_891124 ?auto_891130 ) ) ( not ( = ?auto_891124 ?auto_891131 ) ) ( not ( = ?auto_891125 ?auto_891126 ) ) ( not ( = ?auto_891125 ?auto_891127 ) ) ( not ( = ?auto_891125 ?auto_891128 ) ) ( not ( = ?auto_891125 ?auto_891129 ) ) ( not ( = ?auto_891125 ?auto_891130 ) ) ( not ( = ?auto_891125 ?auto_891131 ) ) ( not ( = ?auto_891126 ?auto_891127 ) ) ( not ( = ?auto_891126 ?auto_891128 ) ) ( not ( = ?auto_891126 ?auto_891129 ) ) ( not ( = ?auto_891126 ?auto_891130 ) ) ( not ( = ?auto_891126 ?auto_891131 ) ) ( not ( = ?auto_891127 ?auto_891128 ) ) ( not ( = ?auto_891127 ?auto_891129 ) ) ( not ( = ?auto_891127 ?auto_891130 ) ) ( not ( = ?auto_891127 ?auto_891131 ) ) ( not ( = ?auto_891128 ?auto_891129 ) ) ( not ( = ?auto_891128 ?auto_891130 ) ) ( not ( = ?auto_891128 ?auto_891131 ) ) ( not ( = ?auto_891129 ?auto_891130 ) ) ( not ( = ?auto_891129 ?auto_891131 ) ) ( not ( = ?auto_891130 ?auto_891131 ) ) ( ON ?auto_891129 ?auto_891130 ) ( ON ?auto_891128 ?auto_891129 ) ( ON ?auto_891127 ?auto_891128 ) ( ON ?auto_891126 ?auto_891127 ) ( CLEAR ?auto_891124 ) ( ON ?auto_891125 ?auto_891126 ) ( CLEAR ?auto_891125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_891120 ?auto_891121 ?auto_891122 ?auto_891123 ?auto_891124 ?auto_891125 )
      ( MAKE-11PILE ?auto_891120 ?auto_891121 ?auto_891122 ?auto_891123 ?auto_891124 ?auto_891125 ?auto_891126 ?auto_891127 ?auto_891128 ?auto_891129 ?auto_891130 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891166 - BLOCK
      ?auto_891167 - BLOCK
      ?auto_891168 - BLOCK
      ?auto_891169 - BLOCK
      ?auto_891170 - BLOCK
      ?auto_891171 - BLOCK
      ?auto_891172 - BLOCK
      ?auto_891173 - BLOCK
      ?auto_891174 - BLOCK
      ?auto_891175 - BLOCK
      ?auto_891176 - BLOCK
    )
    :vars
    (
      ?auto_891177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891176 ?auto_891177 ) ( ON-TABLE ?auto_891166 ) ( ON ?auto_891167 ?auto_891166 ) ( ON ?auto_891168 ?auto_891167 ) ( ON ?auto_891169 ?auto_891168 ) ( not ( = ?auto_891166 ?auto_891167 ) ) ( not ( = ?auto_891166 ?auto_891168 ) ) ( not ( = ?auto_891166 ?auto_891169 ) ) ( not ( = ?auto_891166 ?auto_891170 ) ) ( not ( = ?auto_891166 ?auto_891171 ) ) ( not ( = ?auto_891166 ?auto_891172 ) ) ( not ( = ?auto_891166 ?auto_891173 ) ) ( not ( = ?auto_891166 ?auto_891174 ) ) ( not ( = ?auto_891166 ?auto_891175 ) ) ( not ( = ?auto_891166 ?auto_891176 ) ) ( not ( = ?auto_891166 ?auto_891177 ) ) ( not ( = ?auto_891167 ?auto_891168 ) ) ( not ( = ?auto_891167 ?auto_891169 ) ) ( not ( = ?auto_891167 ?auto_891170 ) ) ( not ( = ?auto_891167 ?auto_891171 ) ) ( not ( = ?auto_891167 ?auto_891172 ) ) ( not ( = ?auto_891167 ?auto_891173 ) ) ( not ( = ?auto_891167 ?auto_891174 ) ) ( not ( = ?auto_891167 ?auto_891175 ) ) ( not ( = ?auto_891167 ?auto_891176 ) ) ( not ( = ?auto_891167 ?auto_891177 ) ) ( not ( = ?auto_891168 ?auto_891169 ) ) ( not ( = ?auto_891168 ?auto_891170 ) ) ( not ( = ?auto_891168 ?auto_891171 ) ) ( not ( = ?auto_891168 ?auto_891172 ) ) ( not ( = ?auto_891168 ?auto_891173 ) ) ( not ( = ?auto_891168 ?auto_891174 ) ) ( not ( = ?auto_891168 ?auto_891175 ) ) ( not ( = ?auto_891168 ?auto_891176 ) ) ( not ( = ?auto_891168 ?auto_891177 ) ) ( not ( = ?auto_891169 ?auto_891170 ) ) ( not ( = ?auto_891169 ?auto_891171 ) ) ( not ( = ?auto_891169 ?auto_891172 ) ) ( not ( = ?auto_891169 ?auto_891173 ) ) ( not ( = ?auto_891169 ?auto_891174 ) ) ( not ( = ?auto_891169 ?auto_891175 ) ) ( not ( = ?auto_891169 ?auto_891176 ) ) ( not ( = ?auto_891169 ?auto_891177 ) ) ( not ( = ?auto_891170 ?auto_891171 ) ) ( not ( = ?auto_891170 ?auto_891172 ) ) ( not ( = ?auto_891170 ?auto_891173 ) ) ( not ( = ?auto_891170 ?auto_891174 ) ) ( not ( = ?auto_891170 ?auto_891175 ) ) ( not ( = ?auto_891170 ?auto_891176 ) ) ( not ( = ?auto_891170 ?auto_891177 ) ) ( not ( = ?auto_891171 ?auto_891172 ) ) ( not ( = ?auto_891171 ?auto_891173 ) ) ( not ( = ?auto_891171 ?auto_891174 ) ) ( not ( = ?auto_891171 ?auto_891175 ) ) ( not ( = ?auto_891171 ?auto_891176 ) ) ( not ( = ?auto_891171 ?auto_891177 ) ) ( not ( = ?auto_891172 ?auto_891173 ) ) ( not ( = ?auto_891172 ?auto_891174 ) ) ( not ( = ?auto_891172 ?auto_891175 ) ) ( not ( = ?auto_891172 ?auto_891176 ) ) ( not ( = ?auto_891172 ?auto_891177 ) ) ( not ( = ?auto_891173 ?auto_891174 ) ) ( not ( = ?auto_891173 ?auto_891175 ) ) ( not ( = ?auto_891173 ?auto_891176 ) ) ( not ( = ?auto_891173 ?auto_891177 ) ) ( not ( = ?auto_891174 ?auto_891175 ) ) ( not ( = ?auto_891174 ?auto_891176 ) ) ( not ( = ?auto_891174 ?auto_891177 ) ) ( not ( = ?auto_891175 ?auto_891176 ) ) ( not ( = ?auto_891175 ?auto_891177 ) ) ( not ( = ?auto_891176 ?auto_891177 ) ) ( ON ?auto_891175 ?auto_891176 ) ( ON ?auto_891174 ?auto_891175 ) ( ON ?auto_891173 ?auto_891174 ) ( ON ?auto_891172 ?auto_891173 ) ( ON ?auto_891171 ?auto_891172 ) ( CLEAR ?auto_891169 ) ( ON ?auto_891170 ?auto_891171 ) ( CLEAR ?auto_891170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_891166 ?auto_891167 ?auto_891168 ?auto_891169 ?auto_891170 )
      ( MAKE-11PILE ?auto_891166 ?auto_891167 ?auto_891168 ?auto_891169 ?auto_891170 ?auto_891171 ?auto_891172 ?auto_891173 ?auto_891174 ?auto_891175 ?auto_891176 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891212 - BLOCK
      ?auto_891213 - BLOCK
      ?auto_891214 - BLOCK
      ?auto_891215 - BLOCK
      ?auto_891216 - BLOCK
      ?auto_891217 - BLOCK
      ?auto_891218 - BLOCK
      ?auto_891219 - BLOCK
      ?auto_891220 - BLOCK
      ?auto_891221 - BLOCK
      ?auto_891222 - BLOCK
    )
    :vars
    (
      ?auto_891223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891222 ?auto_891223 ) ( ON-TABLE ?auto_891212 ) ( ON ?auto_891213 ?auto_891212 ) ( ON ?auto_891214 ?auto_891213 ) ( not ( = ?auto_891212 ?auto_891213 ) ) ( not ( = ?auto_891212 ?auto_891214 ) ) ( not ( = ?auto_891212 ?auto_891215 ) ) ( not ( = ?auto_891212 ?auto_891216 ) ) ( not ( = ?auto_891212 ?auto_891217 ) ) ( not ( = ?auto_891212 ?auto_891218 ) ) ( not ( = ?auto_891212 ?auto_891219 ) ) ( not ( = ?auto_891212 ?auto_891220 ) ) ( not ( = ?auto_891212 ?auto_891221 ) ) ( not ( = ?auto_891212 ?auto_891222 ) ) ( not ( = ?auto_891212 ?auto_891223 ) ) ( not ( = ?auto_891213 ?auto_891214 ) ) ( not ( = ?auto_891213 ?auto_891215 ) ) ( not ( = ?auto_891213 ?auto_891216 ) ) ( not ( = ?auto_891213 ?auto_891217 ) ) ( not ( = ?auto_891213 ?auto_891218 ) ) ( not ( = ?auto_891213 ?auto_891219 ) ) ( not ( = ?auto_891213 ?auto_891220 ) ) ( not ( = ?auto_891213 ?auto_891221 ) ) ( not ( = ?auto_891213 ?auto_891222 ) ) ( not ( = ?auto_891213 ?auto_891223 ) ) ( not ( = ?auto_891214 ?auto_891215 ) ) ( not ( = ?auto_891214 ?auto_891216 ) ) ( not ( = ?auto_891214 ?auto_891217 ) ) ( not ( = ?auto_891214 ?auto_891218 ) ) ( not ( = ?auto_891214 ?auto_891219 ) ) ( not ( = ?auto_891214 ?auto_891220 ) ) ( not ( = ?auto_891214 ?auto_891221 ) ) ( not ( = ?auto_891214 ?auto_891222 ) ) ( not ( = ?auto_891214 ?auto_891223 ) ) ( not ( = ?auto_891215 ?auto_891216 ) ) ( not ( = ?auto_891215 ?auto_891217 ) ) ( not ( = ?auto_891215 ?auto_891218 ) ) ( not ( = ?auto_891215 ?auto_891219 ) ) ( not ( = ?auto_891215 ?auto_891220 ) ) ( not ( = ?auto_891215 ?auto_891221 ) ) ( not ( = ?auto_891215 ?auto_891222 ) ) ( not ( = ?auto_891215 ?auto_891223 ) ) ( not ( = ?auto_891216 ?auto_891217 ) ) ( not ( = ?auto_891216 ?auto_891218 ) ) ( not ( = ?auto_891216 ?auto_891219 ) ) ( not ( = ?auto_891216 ?auto_891220 ) ) ( not ( = ?auto_891216 ?auto_891221 ) ) ( not ( = ?auto_891216 ?auto_891222 ) ) ( not ( = ?auto_891216 ?auto_891223 ) ) ( not ( = ?auto_891217 ?auto_891218 ) ) ( not ( = ?auto_891217 ?auto_891219 ) ) ( not ( = ?auto_891217 ?auto_891220 ) ) ( not ( = ?auto_891217 ?auto_891221 ) ) ( not ( = ?auto_891217 ?auto_891222 ) ) ( not ( = ?auto_891217 ?auto_891223 ) ) ( not ( = ?auto_891218 ?auto_891219 ) ) ( not ( = ?auto_891218 ?auto_891220 ) ) ( not ( = ?auto_891218 ?auto_891221 ) ) ( not ( = ?auto_891218 ?auto_891222 ) ) ( not ( = ?auto_891218 ?auto_891223 ) ) ( not ( = ?auto_891219 ?auto_891220 ) ) ( not ( = ?auto_891219 ?auto_891221 ) ) ( not ( = ?auto_891219 ?auto_891222 ) ) ( not ( = ?auto_891219 ?auto_891223 ) ) ( not ( = ?auto_891220 ?auto_891221 ) ) ( not ( = ?auto_891220 ?auto_891222 ) ) ( not ( = ?auto_891220 ?auto_891223 ) ) ( not ( = ?auto_891221 ?auto_891222 ) ) ( not ( = ?auto_891221 ?auto_891223 ) ) ( not ( = ?auto_891222 ?auto_891223 ) ) ( ON ?auto_891221 ?auto_891222 ) ( ON ?auto_891220 ?auto_891221 ) ( ON ?auto_891219 ?auto_891220 ) ( ON ?auto_891218 ?auto_891219 ) ( ON ?auto_891217 ?auto_891218 ) ( ON ?auto_891216 ?auto_891217 ) ( CLEAR ?auto_891214 ) ( ON ?auto_891215 ?auto_891216 ) ( CLEAR ?auto_891215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_891212 ?auto_891213 ?auto_891214 ?auto_891215 )
      ( MAKE-11PILE ?auto_891212 ?auto_891213 ?auto_891214 ?auto_891215 ?auto_891216 ?auto_891217 ?auto_891218 ?auto_891219 ?auto_891220 ?auto_891221 ?auto_891222 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891258 - BLOCK
      ?auto_891259 - BLOCK
      ?auto_891260 - BLOCK
      ?auto_891261 - BLOCK
      ?auto_891262 - BLOCK
      ?auto_891263 - BLOCK
      ?auto_891264 - BLOCK
      ?auto_891265 - BLOCK
      ?auto_891266 - BLOCK
      ?auto_891267 - BLOCK
      ?auto_891268 - BLOCK
    )
    :vars
    (
      ?auto_891269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891268 ?auto_891269 ) ( ON-TABLE ?auto_891258 ) ( ON ?auto_891259 ?auto_891258 ) ( not ( = ?auto_891258 ?auto_891259 ) ) ( not ( = ?auto_891258 ?auto_891260 ) ) ( not ( = ?auto_891258 ?auto_891261 ) ) ( not ( = ?auto_891258 ?auto_891262 ) ) ( not ( = ?auto_891258 ?auto_891263 ) ) ( not ( = ?auto_891258 ?auto_891264 ) ) ( not ( = ?auto_891258 ?auto_891265 ) ) ( not ( = ?auto_891258 ?auto_891266 ) ) ( not ( = ?auto_891258 ?auto_891267 ) ) ( not ( = ?auto_891258 ?auto_891268 ) ) ( not ( = ?auto_891258 ?auto_891269 ) ) ( not ( = ?auto_891259 ?auto_891260 ) ) ( not ( = ?auto_891259 ?auto_891261 ) ) ( not ( = ?auto_891259 ?auto_891262 ) ) ( not ( = ?auto_891259 ?auto_891263 ) ) ( not ( = ?auto_891259 ?auto_891264 ) ) ( not ( = ?auto_891259 ?auto_891265 ) ) ( not ( = ?auto_891259 ?auto_891266 ) ) ( not ( = ?auto_891259 ?auto_891267 ) ) ( not ( = ?auto_891259 ?auto_891268 ) ) ( not ( = ?auto_891259 ?auto_891269 ) ) ( not ( = ?auto_891260 ?auto_891261 ) ) ( not ( = ?auto_891260 ?auto_891262 ) ) ( not ( = ?auto_891260 ?auto_891263 ) ) ( not ( = ?auto_891260 ?auto_891264 ) ) ( not ( = ?auto_891260 ?auto_891265 ) ) ( not ( = ?auto_891260 ?auto_891266 ) ) ( not ( = ?auto_891260 ?auto_891267 ) ) ( not ( = ?auto_891260 ?auto_891268 ) ) ( not ( = ?auto_891260 ?auto_891269 ) ) ( not ( = ?auto_891261 ?auto_891262 ) ) ( not ( = ?auto_891261 ?auto_891263 ) ) ( not ( = ?auto_891261 ?auto_891264 ) ) ( not ( = ?auto_891261 ?auto_891265 ) ) ( not ( = ?auto_891261 ?auto_891266 ) ) ( not ( = ?auto_891261 ?auto_891267 ) ) ( not ( = ?auto_891261 ?auto_891268 ) ) ( not ( = ?auto_891261 ?auto_891269 ) ) ( not ( = ?auto_891262 ?auto_891263 ) ) ( not ( = ?auto_891262 ?auto_891264 ) ) ( not ( = ?auto_891262 ?auto_891265 ) ) ( not ( = ?auto_891262 ?auto_891266 ) ) ( not ( = ?auto_891262 ?auto_891267 ) ) ( not ( = ?auto_891262 ?auto_891268 ) ) ( not ( = ?auto_891262 ?auto_891269 ) ) ( not ( = ?auto_891263 ?auto_891264 ) ) ( not ( = ?auto_891263 ?auto_891265 ) ) ( not ( = ?auto_891263 ?auto_891266 ) ) ( not ( = ?auto_891263 ?auto_891267 ) ) ( not ( = ?auto_891263 ?auto_891268 ) ) ( not ( = ?auto_891263 ?auto_891269 ) ) ( not ( = ?auto_891264 ?auto_891265 ) ) ( not ( = ?auto_891264 ?auto_891266 ) ) ( not ( = ?auto_891264 ?auto_891267 ) ) ( not ( = ?auto_891264 ?auto_891268 ) ) ( not ( = ?auto_891264 ?auto_891269 ) ) ( not ( = ?auto_891265 ?auto_891266 ) ) ( not ( = ?auto_891265 ?auto_891267 ) ) ( not ( = ?auto_891265 ?auto_891268 ) ) ( not ( = ?auto_891265 ?auto_891269 ) ) ( not ( = ?auto_891266 ?auto_891267 ) ) ( not ( = ?auto_891266 ?auto_891268 ) ) ( not ( = ?auto_891266 ?auto_891269 ) ) ( not ( = ?auto_891267 ?auto_891268 ) ) ( not ( = ?auto_891267 ?auto_891269 ) ) ( not ( = ?auto_891268 ?auto_891269 ) ) ( ON ?auto_891267 ?auto_891268 ) ( ON ?auto_891266 ?auto_891267 ) ( ON ?auto_891265 ?auto_891266 ) ( ON ?auto_891264 ?auto_891265 ) ( ON ?auto_891263 ?auto_891264 ) ( ON ?auto_891262 ?auto_891263 ) ( ON ?auto_891261 ?auto_891262 ) ( CLEAR ?auto_891259 ) ( ON ?auto_891260 ?auto_891261 ) ( CLEAR ?auto_891260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_891258 ?auto_891259 ?auto_891260 )
      ( MAKE-11PILE ?auto_891258 ?auto_891259 ?auto_891260 ?auto_891261 ?auto_891262 ?auto_891263 ?auto_891264 ?auto_891265 ?auto_891266 ?auto_891267 ?auto_891268 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891304 - BLOCK
      ?auto_891305 - BLOCK
      ?auto_891306 - BLOCK
      ?auto_891307 - BLOCK
      ?auto_891308 - BLOCK
      ?auto_891309 - BLOCK
      ?auto_891310 - BLOCK
      ?auto_891311 - BLOCK
      ?auto_891312 - BLOCK
      ?auto_891313 - BLOCK
      ?auto_891314 - BLOCK
    )
    :vars
    (
      ?auto_891315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891314 ?auto_891315 ) ( ON-TABLE ?auto_891304 ) ( not ( = ?auto_891304 ?auto_891305 ) ) ( not ( = ?auto_891304 ?auto_891306 ) ) ( not ( = ?auto_891304 ?auto_891307 ) ) ( not ( = ?auto_891304 ?auto_891308 ) ) ( not ( = ?auto_891304 ?auto_891309 ) ) ( not ( = ?auto_891304 ?auto_891310 ) ) ( not ( = ?auto_891304 ?auto_891311 ) ) ( not ( = ?auto_891304 ?auto_891312 ) ) ( not ( = ?auto_891304 ?auto_891313 ) ) ( not ( = ?auto_891304 ?auto_891314 ) ) ( not ( = ?auto_891304 ?auto_891315 ) ) ( not ( = ?auto_891305 ?auto_891306 ) ) ( not ( = ?auto_891305 ?auto_891307 ) ) ( not ( = ?auto_891305 ?auto_891308 ) ) ( not ( = ?auto_891305 ?auto_891309 ) ) ( not ( = ?auto_891305 ?auto_891310 ) ) ( not ( = ?auto_891305 ?auto_891311 ) ) ( not ( = ?auto_891305 ?auto_891312 ) ) ( not ( = ?auto_891305 ?auto_891313 ) ) ( not ( = ?auto_891305 ?auto_891314 ) ) ( not ( = ?auto_891305 ?auto_891315 ) ) ( not ( = ?auto_891306 ?auto_891307 ) ) ( not ( = ?auto_891306 ?auto_891308 ) ) ( not ( = ?auto_891306 ?auto_891309 ) ) ( not ( = ?auto_891306 ?auto_891310 ) ) ( not ( = ?auto_891306 ?auto_891311 ) ) ( not ( = ?auto_891306 ?auto_891312 ) ) ( not ( = ?auto_891306 ?auto_891313 ) ) ( not ( = ?auto_891306 ?auto_891314 ) ) ( not ( = ?auto_891306 ?auto_891315 ) ) ( not ( = ?auto_891307 ?auto_891308 ) ) ( not ( = ?auto_891307 ?auto_891309 ) ) ( not ( = ?auto_891307 ?auto_891310 ) ) ( not ( = ?auto_891307 ?auto_891311 ) ) ( not ( = ?auto_891307 ?auto_891312 ) ) ( not ( = ?auto_891307 ?auto_891313 ) ) ( not ( = ?auto_891307 ?auto_891314 ) ) ( not ( = ?auto_891307 ?auto_891315 ) ) ( not ( = ?auto_891308 ?auto_891309 ) ) ( not ( = ?auto_891308 ?auto_891310 ) ) ( not ( = ?auto_891308 ?auto_891311 ) ) ( not ( = ?auto_891308 ?auto_891312 ) ) ( not ( = ?auto_891308 ?auto_891313 ) ) ( not ( = ?auto_891308 ?auto_891314 ) ) ( not ( = ?auto_891308 ?auto_891315 ) ) ( not ( = ?auto_891309 ?auto_891310 ) ) ( not ( = ?auto_891309 ?auto_891311 ) ) ( not ( = ?auto_891309 ?auto_891312 ) ) ( not ( = ?auto_891309 ?auto_891313 ) ) ( not ( = ?auto_891309 ?auto_891314 ) ) ( not ( = ?auto_891309 ?auto_891315 ) ) ( not ( = ?auto_891310 ?auto_891311 ) ) ( not ( = ?auto_891310 ?auto_891312 ) ) ( not ( = ?auto_891310 ?auto_891313 ) ) ( not ( = ?auto_891310 ?auto_891314 ) ) ( not ( = ?auto_891310 ?auto_891315 ) ) ( not ( = ?auto_891311 ?auto_891312 ) ) ( not ( = ?auto_891311 ?auto_891313 ) ) ( not ( = ?auto_891311 ?auto_891314 ) ) ( not ( = ?auto_891311 ?auto_891315 ) ) ( not ( = ?auto_891312 ?auto_891313 ) ) ( not ( = ?auto_891312 ?auto_891314 ) ) ( not ( = ?auto_891312 ?auto_891315 ) ) ( not ( = ?auto_891313 ?auto_891314 ) ) ( not ( = ?auto_891313 ?auto_891315 ) ) ( not ( = ?auto_891314 ?auto_891315 ) ) ( ON ?auto_891313 ?auto_891314 ) ( ON ?auto_891312 ?auto_891313 ) ( ON ?auto_891311 ?auto_891312 ) ( ON ?auto_891310 ?auto_891311 ) ( ON ?auto_891309 ?auto_891310 ) ( ON ?auto_891308 ?auto_891309 ) ( ON ?auto_891307 ?auto_891308 ) ( ON ?auto_891306 ?auto_891307 ) ( CLEAR ?auto_891304 ) ( ON ?auto_891305 ?auto_891306 ) ( CLEAR ?auto_891305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_891304 ?auto_891305 )
      ( MAKE-11PILE ?auto_891304 ?auto_891305 ?auto_891306 ?auto_891307 ?auto_891308 ?auto_891309 ?auto_891310 ?auto_891311 ?auto_891312 ?auto_891313 ?auto_891314 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_891350 - BLOCK
      ?auto_891351 - BLOCK
      ?auto_891352 - BLOCK
      ?auto_891353 - BLOCK
      ?auto_891354 - BLOCK
      ?auto_891355 - BLOCK
      ?auto_891356 - BLOCK
      ?auto_891357 - BLOCK
      ?auto_891358 - BLOCK
      ?auto_891359 - BLOCK
      ?auto_891360 - BLOCK
    )
    :vars
    (
      ?auto_891361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891360 ?auto_891361 ) ( not ( = ?auto_891350 ?auto_891351 ) ) ( not ( = ?auto_891350 ?auto_891352 ) ) ( not ( = ?auto_891350 ?auto_891353 ) ) ( not ( = ?auto_891350 ?auto_891354 ) ) ( not ( = ?auto_891350 ?auto_891355 ) ) ( not ( = ?auto_891350 ?auto_891356 ) ) ( not ( = ?auto_891350 ?auto_891357 ) ) ( not ( = ?auto_891350 ?auto_891358 ) ) ( not ( = ?auto_891350 ?auto_891359 ) ) ( not ( = ?auto_891350 ?auto_891360 ) ) ( not ( = ?auto_891350 ?auto_891361 ) ) ( not ( = ?auto_891351 ?auto_891352 ) ) ( not ( = ?auto_891351 ?auto_891353 ) ) ( not ( = ?auto_891351 ?auto_891354 ) ) ( not ( = ?auto_891351 ?auto_891355 ) ) ( not ( = ?auto_891351 ?auto_891356 ) ) ( not ( = ?auto_891351 ?auto_891357 ) ) ( not ( = ?auto_891351 ?auto_891358 ) ) ( not ( = ?auto_891351 ?auto_891359 ) ) ( not ( = ?auto_891351 ?auto_891360 ) ) ( not ( = ?auto_891351 ?auto_891361 ) ) ( not ( = ?auto_891352 ?auto_891353 ) ) ( not ( = ?auto_891352 ?auto_891354 ) ) ( not ( = ?auto_891352 ?auto_891355 ) ) ( not ( = ?auto_891352 ?auto_891356 ) ) ( not ( = ?auto_891352 ?auto_891357 ) ) ( not ( = ?auto_891352 ?auto_891358 ) ) ( not ( = ?auto_891352 ?auto_891359 ) ) ( not ( = ?auto_891352 ?auto_891360 ) ) ( not ( = ?auto_891352 ?auto_891361 ) ) ( not ( = ?auto_891353 ?auto_891354 ) ) ( not ( = ?auto_891353 ?auto_891355 ) ) ( not ( = ?auto_891353 ?auto_891356 ) ) ( not ( = ?auto_891353 ?auto_891357 ) ) ( not ( = ?auto_891353 ?auto_891358 ) ) ( not ( = ?auto_891353 ?auto_891359 ) ) ( not ( = ?auto_891353 ?auto_891360 ) ) ( not ( = ?auto_891353 ?auto_891361 ) ) ( not ( = ?auto_891354 ?auto_891355 ) ) ( not ( = ?auto_891354 ?auto_891356 ) ) ( not ( = ?auto_891354 ?auto_891357 ) ) ( not ( = ?auto_891354 ?auto_891358 ) ) ( not ( = ?auto_891354 ?auto_891359 ) ) ( not ( = ?auto_891354 ?auto_891360 ) ) ( not ( = ?auto_891354 ?auto_891361 ) ) ( not ( = ?auto_891355 ?auto_891356 ) ) ( not ( = ?auto_891355 ?auto_891357 ) ) ( not ( = ?auto_891355 ?auto_891358 ) ) ( not ( = ?auto_891355 ?auto_891359 ) ) ( not ( = ?auto_891355 ?auto_891360 ) ) ( not ( = ?auto_891355 ?auto_891361 ) ) ( not ( = ?auto_891356 ?auto_891357 ) ) ( not ( = ?auto_891356 ?auto_891358 ) ) ( not ( = ?auto_891356 ?auto_891359 ) ) ( not ( = ?auto_891356 ?auto_891360 ) ) ( not ( = ?auto_891356 ?auto_891361 ) ) ( not ( = ?auto_891357 ?auto_891358 ) ) ( not ( = ?auto_891357 ?auto_891359 ) ) ( not ( = ?auto_891357 ?auto_891360 ) ) ( not ( = ?auto_891357 ?auto_891361 ) ) ( not ( = ?auto_891358 ?auto_891359 ) ) ( not ( = ?auto_891358 ?auto_891360 ) ) ( not ( = ?auto_891358 ?auto_891361 ) ) ( not ( = ?auto_891359 ?auto_891360 ) ) ( not ( = ?auto_891359 ?auto_891361 ) ) ( not ( = ?auto_891360 ?auto_891361 ) ) ( ON ?auto_891359 ?auto_891360 ) ( ON ?auto_891358 ?auto_891359 ) ( ON ?auto_891357 ?auto_891358 ) ( ON ?auto_891356 ?auto_891357 ) ( ON ?auto_891355 ?auto_891356 ) ( ON ?auto_891354 ?auto_891355 ) ( ON ?auto_891353 ?auto_891354 ) ( ON ?auto_891352 ?auto_891353 ) ( ON ?auto_891351 ?auto_891352 ) ( ON ?auto_891350 ?auto_891351 ) ( CLEAR ?auto_891350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_891350 )
      ( MAKE-11PILE ?auto_891350 ?auto_891351 ?auto_891352 ?auto_891353 ?auto_891354 ?auto_891355 ?auto_891356 ?auto_891357 ?auto_891358 ?auto_891359 ?auto_891360 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891397 - BLOCK
      ?auto_891398 - BLOCK
      ?auto_891399 - BLOCK
      ?auto_891400 - BLOCK
      ?auto_891401 - BLOCK
      ?auto_891402 - BLOCK
      ?auto_891403 - BLOCK
      ?auto_891404 - BLOCK
      ?auto_891405 - BLOCK
      ?auto_891406 - BLOCK
      ?auto_891407 - BLOCK
      ?auto_891408 - BLOCK
    )
    :vars
    (
      ?auto_891409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_891407 ) ( ON ?auto_891408 ?auto_891409 ) ( CLEAR ?auto_891408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_891397 ) ( ON ?auto_891398 ?auto_891397 ) ( ON ?auto_891399 ?auto_891398 ) ( ON ?auto_891400 ?auto_891399 ) ( ON ?auto_891401 ?auto_891400 ) ( ON ?auto_891402 ?auto_891401 ) ( ON ?auto_891403 ?auto_891402 ) ( ON ?auto_891404 ?auto_891403 ) ( ON ?auto_891405 ?auto_891404 ) ( ON ?auto_891406 ?auto_891405 ) ( ON ?auto_891407 ?auto_891406 ) ( not ( = ?auto_891397 ?auto_891398 ) ) ( not ( = ?auto_891397 ?auto_891399 ) ) ( not ( = ?auto_891397 ?auto_891400 ) ) ( not ( = ?auto_891397 ?auto_891401 ) ) ( not ( = ?auto_891397 ?auto_891402 ) ) ( not ( = ?auto_891397 ?auto_891403 ) ) ( not ( = ?auto_891397 ?auto_891404 ) ) ( not ( = ?auto_891397 ?auto_891405 ) ) ( not ( = ?auto_891397 ?auto_891406 ) ) ( not ( = ?auto_891397 ?auto_891407 ) ) ( not ( = ?auto_891397 ?auto_891408 ) ) ( not ( = ?auto_891397 ?auto_891409 ) ) ( not ( = ?auto_891398 ?auto_891399 ) ) ( not ( = ?auto_891398 ?auto_891400 ) ) ( not ( = ?auto_891398 ?auto_891401 ) ) ( not ( = ?auto_891398 ?auto_891402 ) ) ( not ( = ?auto_891398 ?auto_891403 ) ) ( not ( = ?auto_891398 ?auto_891404 ) ) ( not ( = ?auto_891398 ?auto_891405 ) ) ( not ( = ?auto_891398 ?auto_891406 ) ) ( not ( = ?auto_891398 ?auto_891407 ) ) ( not ( = ?auto_891398 ?auto_891408 ) ) ( not ( = ?auto_891398 ?auto_891409 ) ) ( not ( = ?auto_891399 ?auto_891400 ) ) ( not ( = ?auto_891399 ?auto_891401 ) ) ( not ( = ?auto_891399 ?auto_891402 ) ) ( not ( = ?auto_891399 ?auto_891403 ) ) ( not ( = ?auto_891399 ?auto_891404 ) ) ( not ( = ?auto_891399 ?auto_891405 ) ) ( not ( = ?auto_891399 ?auto_891406 ) ) ( not ( = ?auto_891399 ?auto_891407 ) ) ( not ( = ?auto_891399 ?auto_891408 ) ) ( not ( = ?auto_891399 ?auto_891409 ) ) ( not ( = ?auto_891400 ?auto_891401 ) ) ( not ( = ?auto_891400 ?auto_891402 ) ) ( not ( = ?auto_891400 ?auto_891403 ) ) ( not ( = ?auto_891400 ?auto_891404 ) ) ( not ( = ?auto_891400 ?auto_891405 ) ) ( not ( = ?auto_891400 ?auto_891406 ) ) ( not ( = ?auto_891400 ?auto_891407 ) ) ( not ( = ?auto_891400 ?auto_891408 ) ) ( not ( = ?auto_891400 ?auto_891409 ) ) ( not ( = ?auto_891401 ?auto_891402 ) ) ( not ( = ?auto_891401 ?auto_891403 ) ) ( not ( = ?auto_891401 ?auto_891404 ) ) ( not ( = ?auto_891401 ?auto_891405 ) ) ( not ( = ?auto_891401 ?auto_891406 ) ) ( not ( = ?auto_891401 ?auto_891407 ) ) ( not ( = ?auto_891401 ?auto_891408 ) ) ( not ( = ?auto_891401 ?auto_891409 ) ) ( not ( = ?auto_891402 ?auto_891403 ) ) ( not ( = ?auto_891402 ?auto_891404 ) ) ( not ( = ?auto_891402 ?auto_891405 ) ) ( not ( = ?auto_891402 ?auto_891406 ) ) ( not ( = ?auto_891402 ?auto_891407 ) ) ( not ( = ?auto_891402 ?auto_891408 ) ) ( not ( = ?auto_891402 ?auto_891409 ) ) ( not ( = ?auto_891403 ?auto_891404 ) ) ( not ( = ?auto_891403 ?auto_891405 ) ) ( not ( = ?auto_891403 ?auto_891406 ) ) ( not ( = ?auto_891403 ?auto_891407 ) ) ( not ( = ?auto_891403 ?auto_891408 ) ) ( not ( = ?auto_891403 ?auto_891409 ) ) ( not ( = ?auto_891404 ?auto_891405 ) ) ( not ( = ?auto_891404 ?auto_891406 ) ) ( not ( = ?auto_891404 ?auto_891407 ) ) ( not ( = ?auto_891404 ?auto_891408 ) ) ( not ( = ?auto_891404 ?auto_891409 ) ) ( not ( = ?auto_891405 ?auto_891406 ) ) ( not ( = ?auto_891405 ?auto_891407 ) ) ( not ( = ?auto_891405 ?auto_891408 ) ) ( not ( = ?auto_891405 ?auto_891409 ) ) ( not ( = ?auto_891406 ?auto_891407 ) ) ( not ( = ?auto_891406 ?auto_891408 ) ) ( not ( = ?auto_891406 ?auto_891409 ) ) ( not ( = ?auto_891407 ?auto_891408 ) ) ( not ( = ?auto_891407 ?auto_891409 ) ) ( not ( = ?auto_891408 ?auto_891409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_891408 ?auto_891409 )
      ( !STACK ?auto_891408 ?auto_891407 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891447 - BLOCK
      ?auto_891448 - BLOCK
      ?auto_891449 - BLOCK
      ?auto_891450 - BLOCK
      ?auto_891451 - BLOCK
      ?auto_891452 - BLOCK
      ?auto_891453 - BLOCK
      ?auto_891454 - BLOCK
      ?auto_891455 - BLOCK
      ?auto_891456 - BLOCK
      ?auto_891457 - BLOCK
      ?auto_891458 - BLOCK
    )
    :vars
    (
      ?auto_891459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891458 ?auto_891459 ) ( ON-TABLE ?auto_891447 ) ( ON ?auto_891448 ?auto_891447 ) ( ON ?auto_891449 ?auto_891448 ) ( ON ?auto_891450 ?auto_891449 ) ( ON ?auto_891451 ?auto_891450 ) ( ON ?auto_891452 ?auto_891451 ) ( ON ?auto_891453 ?auto_891452 ) ( ON ?auto_891454 ?auto_891453 ) ( ON ?auto_891455 ?auto_891454 ) ( ON ?auto_891456 ?auto_891455 ) ( not ( = ?auto_891447 ?auto_891448 ) ) ( not ( = ?auto_891447 ?auto_891449 ) ) ( not ( = ?auto_891447 ?auto_891450 ) ) ( not ( = ?auto_891447 ?auto_891451 ) ) ( not ( = ?auto_891447 ?auto_891452 ) ) ( not ( = ?auto_891447 ?auto_891453 ) ) ( not ( = ?auto_891447 ?auto_891454 ) ) ( not ( = ?auto_891447 ?auto_891455 ) ) ( not ( = ?auto_891447 ?auto_891456 ) ) ( not ( = ?auto_891447 ?auto_891457 ) ) ( not ( = ?auto_891447 ?auto_891458 ) ) ( not ( = ?auto_891447 ?auto_891459 ) ) ( not ( = ?auto_891448 ?auto_891449 ) ) ( not ( = ?auto_891448 ?auto_891450 ) ) ( not ( = ?auto_891448 ?auto_891451 ) ) ( not ( = ?auto_891448 ?auto_891452 ) ) ( not ( = ?auto_891448 ?auto_891453 ) ) ( not ( = ?auto_891448 ?auto_891454 ) ) ( not ( = ?auto_891448 ?auto_891455 ) ) ( not ( = ?auto_891448 ?auto_891456 ) ) ( not ( = ?auto_891448 ?auto_891457 ) ) ( not ( = ?auto_891448 ?auto_891458 ) ) ( not ( = ?auto_891448 ?auto_891459 ) ) ( not ( = ?auto_891449 ?auto_891450 ) ) ( not ( = ?auto_891449 ?auto_891451 ) ) ( not ( = ?auto_891449 ?auto_891452 ) ) ( not ( = ?auto_891449 ?auto_891453 ) ) ( not ( = ?auto_891449 ?auto_891454 ) ) ( not ( = ?auto_891449 ?auto_891455 ) ) ( not ( = ?auto_891449 ?auto_891456 ) ) ( not ( = ?auto_891449 ?auto_891457 ) ) ( not ( = ?auto_891449 ?auto_891458 ) ) ( not ( = ?auto_891449 ?auto_891459 ) ) ( not ( = ?auto_891450 ?auto_891451 ) ) ( not ( = ?auto_891450 ?auto_891452 ) ) ( not ( = ?auto_891450 ?auto_891453 ) ) ( not ( = ?auto_891450 ?auto_891454 ) ) ( not ( = ?auto_891450 ?auto_891455 ) ) ( not ( = ?auto_891450 ?auto_891456 ) ) ( not ( = ?auto_891450 ?auto_891457 ) ) ( not ( = ?auto_891450 ?auto_891458 ) ) ( not ( = ?auto_891450 ?auto_891459 ) ) ( not ( = ?auto_891451 ?auto_891452 ) ) ( not ( = ?auto_891451 ?auto_891453 ) ) ( not ( = ?auto_891451 ?auto_891454 ) ) ( not ( = ?auto_891451 ?auto_891455 ) ) ( not ( = ?auto_891451 ?auto_891456 ) ) ( not ( = ?auto_891451 ?auto_891457 ) ) ( not ( = ?auto_891451 ?auto_891458 ) ) ( not ( = ?auto_891451 ?auto_891459 ) ) ( not ( = ?auto_891452 ?auto_891453 ) ) ( not ( = ?auto_891452 ?auto_891454 ) ) ( not ( = ?auto_891452 ?auto_891455 ) ) ( not ( = ?auto_891452 ?auto_891456 ) ) ( not ( = ?auto_891452 ?auto_891457 ) ) ( not ( = ?auto_891452 ?auto_891458 ) ) ( not ( = ?auto_891452 ?auto_891459 ) ) ( not ( = ?auto_891453 ?auto_891454 ) ) ( not ( = ?auto_891453 ?auto_891455 ) ) ( not ( = ?auto_891453 ?auto_891456 ) ) ( not ( = ?auto_891453 ?auto_891457 ) ) ( not ( = ?auto_891453 ?auto_891458 ) ) ( not ( = ?auto_891453 ?auto_891459 ) ) ( not ( = ?auto_891454 ?auto_891455 ) ) ( not ( = ?auto_891454 ?auto_891456 ) ) ( not ( = ?auto_891454 ?auto_891457 ) ) ( not ( = ?auto_891454 ?auto_891458 ) ) ( not ( = ?auto_891454 ?auto_891459 ) ) ( not ( = ?auto_891455 ?auto_891456 ) ) ( not ( = ?auto_891455 ?auto_891457 ) ) ( not ( = ?auto_891455 ?auto_891458 ) ) ( not ( = ?auto_891455 ?auto_891459 ) ) ( not ( = ?auto_891456 ?auto_891457 ) ) ( not ( = ?auto_891456 ?auto_891458 ) ) ( not ( = ?auto_891456 ?auto_891459 ) ) ( not ( = ?auto_891457 ?auto_891458 ) ) ( not ( = ?auto_891457 ?auto_891459 ) ) ( not ( = ?auto_891458 ?auto_891459 ) ) ( CLEAR ?auto_891456 ) ( ON ?auto_891457 ?auto_891458 ) ( CLEAR ?auto_891457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_891447 ?auto_891448 ?auto_891449 ?auto_891450 ?auto_891451 ?auto_891452 ?auto_891453 ?auto_891454 ?auto_891455 ?auto_891456 ?auto_891457 )
      ( MAKE-12PILE ?auto_891447 ?auto_891448 ?auto_891449 ?auto_891450 ?auto_891451 ?auto_891452 ?auto_891453 ?auto_891454 ?auto_891455 ?auto_891456 ?auto_891457 ?auto_891458 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891497 - BLOCK
      ?auto_891498 - BLOCK
      ?auto_891499 - BLOCK
      ?auto_891500 - BLOCK
      ?auto_891501 - BLOCK
      ?auto_891502 - BLOCK
      ?auto_891503 - BLOCK
      ?auto_891504 - BLOCK
      ?auto_891505 - BLOCK
      ?auto_891506 - BLOCK
      ?auto_891507 - BLOCK
      ?auto_891508 - BLOCK
    )
    :vars
    (
      ?auto_891509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891508 ?auto_891509 ) ( ON-TABLE ?auto_891497 ) ( ON ?auto_891498 ?auto_891497 ) ( ON ?auto_891499 ?auto_891498 ) ( ON ?auto_891500 ?auto_891499 ) ( ON ?auto_891501 ?auto_891500 ) ( ON ?auto_891502 ?auto_891501 ) ( ON ?auto_891503 ?auto_891502 ) ( ON ?auto_891504 ?auto_891503 ) ( ON ?auto_891505 ?auto_891504 ) ( not ( = ?auto_891497 ?auto_891498 ) ) ( not ( = ?auto_891497 ?auto_891499 ) ) ( not ( = ?auto_891497 ?auto_891500 ) ) ( not ( = ?auto_891497 ?auto_891501 ) ) ( not ( = ?auto_891497 ?auto_891502 ) ) ( not ( = ?auto_891497 ?auto_891503 ) ) ( not ( = ?auto_891497 ?auto_891504 ) ) ( not ( = ?auto_891497 ?auto_891505 ) ) ( not ( = ?auto_891497 ?auto_891506 ) ) ( not ( = ?auto_891497 ?auto_891507 ) ) ( not ( = ?auto_891497 ?auto_891508 ) ) ( not ( = ?auto_891497 ?auto_891509 ) ) ( not ( = ?auto_891498 ?auto_891499 ) ) ( not ( = ?auto_891498 ?auto_891500 ) ) ( not ( = ?auto_891498 ?auto_891501 ) ) ( not ( = ?auto_891498 ?auto_891502 ) ) ( not ( = ?auto_891498 ?auto_891503 ) ) ( not ( = ?auto_891498 ?auto_891504 ) ) ( not ( = ?auto_891498 ?auto_891505 ) ) ( not ( = ?auto_891498 ?auto_891506 ) ) ( not ( = ?auto_891498 ?auto_891507 ) ) ( not ( = ?auto_891498 ?auto_891508 ) ) ( not ( = ?auto_891498 ?auto_891509 ) ) ( not ( = ?auto_891499 ?auto_891500 ) ) ( not ( = ?auto_891499 ?auto_891501 ) ) ( not ( = ?auto_891499 ?auto_891502 ) ) ( not ( = ?auto_891499 ?auto_891503 ) ) ( not ( = ?auto_891499 ?auto_891504 ) ) ( not ( = ?auto_891499 ?auto_891505 ) ) ( not ( = ?auto_891499 ?auto_891506 ) ) ( not ( = ?auto_891499 ?auto_891507 ) ) ( not ( = ?auto_891499 ?auto_891508 ) ) ( not ( = ?auto_891499 ?auto_891509 ) ) ( not ( = ?auto_891500 ?auto_891501 ) ) ( not ( = ?auto_891500 ?auto_891502 ) ) ( not ( = ?auto_891500 ?auto_891503 ) ) ( not ( = ?auto_891500 ?auto_891504 ) ) ( not ( = ?auto_891500 ?auto_891505 ) ) ( not ( = ?auto_891500 ?auto_891506 ) ) ( not ( = ?auto_891500 ?auto_891507 ) ) ( not ( = ?auto_891500 ?auto_891508 ) ) ( not ( = ?auto_891500 ?auto_891509 ) ) ( not ( = ?auto_891501 ?auto_891502 ) ) ( not ( = ?auto_891501 ?auto_891503 ) ) ( not ( = ?auto_891501 ?auto_891504 ) ) ( not ( = ?auto_891501 ?auto_891505 ) ) ( not ( = ?auto_891501 ?auto_891506 ) ) ( not ( = ?auto_891501 ?auto_891507 ) ) ( not ( = ?auto_891501 ?auto_891508 ) ) ( not ( = ?auto_891501 ?auto_891509 ) ) ( not ( = ?auto_891502 ?auto_891503 ) ) ( not ( = ?auto_891502 ?auto_891504 ) ) ( not ( = ?auto_891502 ?auto_891505 ) ) ( not ( = ?auto_891502 ?auto_891506 ) ) ( not ( = ?auto_891502 ?auto_891507 ) ) ( not ( = ?auto_891502 ?auto_891508 ) ) ( not ( = ?auto_891502 ?auto_891509 ) ) ( not ( = ?auto_891503 ?auto_891504 ) ) ( not ( = ?auto_891503 ?auto_891505 ) ) ( not ( = ?auto_891503 ?auto_891506 ) ) ( not ( = ?auto_891503 ?auto_891507 ) ) ( not ( = ?auto_891503 ?auto_891508 ) ) ( not ( = ?auto_891503 ?auto_891509 ) ) ( not ( = ?auto_891504 ?auto_891505 ) ) ( not ( = ?auto_891504 ?auto_891506 ) ) ( not ( = ?auto_891504 ?auto_891507 ) ) ( not ( = ?auto_891504 ?auto_891508 ) ) ( not ( = ?auto_891504 ?auto_891509 ) ) ( not ( = ?auto_891505 ?auto_891506 ) ) ( not ( = ?auto_891505 ?auto_891507 ) ) ( not ( = ?auto_891505 ?auto_891508 ) ) ( not ( = ?auto_891505 ?auto_891509 ) ) ( not ( = ?auto_891506 ?auto_891507 ) ) ( not ( = ?auto_891506 ?auto_891508 ) ) ( not ( = ?auto_891506 ?auto_891509 ) ) ( not ( = ?auto_891507 ?auto_891508 ) ) ( not ( = ?auto_891507 ?auto_891509 ) ) ( not ( = ?auto_891508 ?auto_891509 ) ) ( ON ?auto_891507 ?auto_891508 ) ( CLEAR ?auto_891505 ) ( ON ?auto_891506 ?auto_891507 ) ( CLEAR ?auto_891506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_891497 ?auto_891498 ?auto_891499 ?auto_891500 ?auto_891501 ?auto_891502 ?auto_891503 ?auto_891504 ?auto_891505 ?auto_891506 )
      ( MAKE-12PILE ?auto_891497 ?auto_891498 ?auto_891499 ?auto_891500 ?auto_891501 ?auto_891502 ?auto_891503 ?auto_891504 ?auto_891505 ?auto_891506 ?auto_891507 ?auto_891508 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891547 - BLOCK
      ?auto_891548 - BLOCK
      ?auto_891549 - BLOCK
      ?auto_891550 - BLOCK
      ?auto_891551 - BLOCK
      ?auto_891552 - BLOCK
      ?auto_891553 - BLOCK
      ?auto_891554 - BLOCK
      ?auto_891555 - BLOCK
      ?auto_891556 - BLOCK
      ?auto_891557 - BLOCK
      ?auto_891558 - BLOCK
    )
    :vars
    (
      ?auto_891559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891558 ?auto_891559 ) ( ON-TABLE ?auto_891547 ) ( ON ?auto_891548 ?auto_891547 ) ( ON ?auto_891549 ?auto_891548 ) ( ON ?auto_891550 ?auto_891549 ) ( ON ?auto_891551 ?auto_891550 ) ( ON ?auto_891552 ?auto_891551 ) ( ON ?auto_891553 ?auto_891552 ) ( ON ?auto_891554 ?auto_891553 ) ( not ( = ?auto_891547 ?auto_891548 ) ) ( not ( = ?auto_891547 ?auto_891549 ) ) ( not ( = ?auto_891547 ?auto_891550 ) ) ( not ( = ?auto_891547 ?auto_891551 ) ) ( not ( = ?auto_891547 ?auto_891552 ) ) ( not ( = ?auto_891547 ?auto_891553 ) ) ( not ( = ?auto_891547 ?auto_891554 ) ) ( not ( = ?auto_891547 ?auto_891555 ) ) ( not ( = ?auto_891547 ?auto_891556 ) ) ( not ( = ?auto_891547 ?auto_891557 ) ) ( not ( = ?auto_891547 ?auto_891558 ) ) ( not ( = ?auto_891547 ?auto_891559 ) ) ( not ( = ?auto_891548 ?auto_891549 ) ) ( not ( = ?auto_891548 ?auto_891550 ) ) ( not ( = ?auto_891548 ?auto_891551 ) ) ( not ( = ?auto_891548 ?auto_891552 ) ) ( not ( = ?auto_891548 ?auto_891553 ) ) ( not ( = ?auto_891548 ?auto_891554 ) ) ( not ( = ?auto_891548 ?auto_891555 ) ) ( not ( = ?auto_891548 ?auto_891556 ) ) ( not ( = ?auto_891548 ?auto_891557 ) ) ( not ( = ?auto_891548 ?auto_891558 ) ) ( not ( = ?auto_891548 ?auto_891559 ) ) ( not ( = ?auto_891549 ?auto_891550 ) ) ( not ( = ?auto_891549 ?auto_891551 ) ) ( not ( = ?auto_891549 ?auto_891552 ) ) ( not ( = ?auto_891549 ?auto_891553 ) ) ( not ( = ?auto_891549 ?auto_891554 ) ) ( not ( = ?auto_891549 ?auto_891555 ) ) ( not ( = ?auto_891549 ?auto_891556 ) ) ( not ( = ?auto_891549 ?auto_891557 ) ) ( not ( = ?auto_891549 ?auto_891558 ) ) ( not ( = ?auto_891549 ?auto_891559 ) ) ( not ( = ?auto_891550 ?auto_891551 ) ) ( not ( = ?auto_891550 ?auto_891552 ) ) ( not ( = ?auto_891550 ?auto_891553 ) ) ( not ( = ?auto_891550 ?auto_891554 ) ) ( not ( = ?auto_891550 ?auto_891555 ) ) ( not ( = ?auto_891550 ?auto_891556 ) ) ( not ( = ?auto_891550 ?auto_891557 ) ) ( not ( = ?auto_891550 ?auto_891558 ) ) ( not ( = ?auto_891550 ?auto_891559 ) ) ( not ( = ?auto_891551 ?auto_891552 ) ) ( not ( = ?auto_891551 ?auto_891553 ) ) ( not ( = ?auto_891551 ?auto_891554 ) ) ( not ( = ?auto_891551 ?auto_891555 ) ) ( not ( = ?auto_891551 ?auto_891556 ) ) ( not ( = ?auto_891551 ?auto_891557 ) ) ( not ( = ?auto_891551 ?auto_891558 ) ) ( not ( = ?auto_891551 ?auto_891559 ) ) ( not ( = ?auto_891552 ?auto_891553 ) ) ( not ( = ?auto_891552 ?auto_891554 ) ) ( not ( = ?auto_891552 ?auto_891555 ) ) ( not ( = ?auto_891552 ?auto_891556 ) ) ( not ( = ?auto_891552 ?auto_891557 ) ) ( not ( = ?auto_891552 ?auto_891558 ) ) ( not ( = ?auto_891552 ?auto_891559 ) ) ( not ( = ?auto_891553 ?auto_891554 ) ) ( not ( = ?auto_891553 ?auto_891555 ) ) ( not ( = ?auto_891553 ?auto_891556 ) ) ( not ( = ?auto_891553 ?auto_891557 ) ) ( not ( = ?auto_891553 ?auto_891558 ) ) ( not ( = ?auto_891553 ?auto_891559 ) ) ( not ( = ?auto_891554 ?auto_891555 ) ) ( not ( = ?auto_891554 ?auto_891556 ) ) ( not ( = ?auto_891554 ?auto_891557 ) ) ( not ( = ?auto_891554 ?auto_891558 ) ) ( not ( = ?auto_891554 ?auto_891559 ) ) ( not ( = ?auto_891555 ?auto_891556 ) ) ( not ( = ?auto_891555 ?auto_891557 ) ) ( not ( = ?auto_891555 ?auto_891558 ) ) ( not ( = ?auto_891555 ?auto_891559 ) ) ( not ( = ?auto_891556 ?auto_891557 ) ) ( not ( = ?auto_891556 ?auto_891558 ) ) ( not ( = ?auto_891556 ?auto_891559 ) ) ( not ( = ?auto_891557 ?auto_891558 ) ) ( not ( = ?auto_891557 ?auto_891559 ) ) ( not ( = ?auto_891558 ?auto_891559 ) ) ( ON ?auto_891557 ?auto_891558 ) ( ON ?auto_891556 ?auto_891557 ) ( CLEAR ?auto_891554 ) ( ON ?auto_891555 ?auto_891556 ) ( CLEAR ?auto_891555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_891547 ?auto_891548 ?auto_891549 ?auto_891550 ?auto_891551 ?auto_891552 ?auto_891553 ?auto_891554 ?auto_891555 )
      ( MAKE-12PILE ?auto_891547 ?auto_891548 ?auto_891549 ?auto_891550 ?auto_891551 ?auto_891552 ?auto_891553 ?auto_891554 ?auto_891555 ?auto_891556 ?auto_891557 ?auto_891558 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891597 - BLOCK
      ?auto_891598 - BLOCK
      ?auto_891599 - BLOCK
      ?auto_891600 - BLOCK
      ?auto_891601 - BLOCK
      ?auto_891602 - BLOCK
      ?auto_891603 - BLOCK
      ?auto_891604 - BLOCK
      ?auto_891605 - BLOCK
      ?auto_891606 - BLOCK
      ?auto_891607 - BLOCK
      ?auto_891608 - BLOCK
    )
    :vars
    (
      ?auto_891609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891608 ?auto_891609 ) ( ON-TABLE ?auto_891597 ) ( ON ?auto_891598 ?auto_891597 ) ( ON ?auto_891599 ?auto_891598 ) ( ON ?auto_891600 ?auto_891599 ) ( ON ?auto_891601 ?auto_891600 ) ( ON ?auto_891602 ?auto_891601 ) ( ON ?auto_891603 ?auto_891602 ) ( not ( = ?auto_891597 ?auto_891598 ) ) ( not ( = ?auto_891597 ?auto_891599 ) ) ( not ( = ?auto_891597 ?auto_891600 ) ) ( not ( = ?auto_891597 ?auto_891601 ) ) ( not ( = ?auto_891597 ?auto_891602 ) ) ( not ( = ?auto_891597 ?auto_891603 ) ) ( not ( = ?auto_891597 ?auto_891604 ) ) ( not ( = ?auto_891597 ?auto_891605 ) ) ( not ( = ?auto_891597 ?auto_891606 ) ) ( not ( = ?auto_891597 ?auto_891607 ) ) ( not ( = ?auto_891597 ?auto_891608 ) ) ( not ( = ?auto_891597 ?auto_891609 ) ) ( not ( = ?auto_891598 ?auto_891599 ) ) ( not ( = ?auto_891598 ?auto_891600 ) ) ( not ( = ?auto_891598 ?auto_891601 ) ) ( not ( = ?auto_891598 ?auto_891602 ) ) ( not ( = ?auto_891598 ?auto_891603 ) ) ( not ( = ?auto_891598 ?auto_891604 ) ) ( not ( = ?auto_891598 ?auto_891605 ) ) ( not ( = ?auto_891598 ?auto_891606 ) ) ( not ( = ?auto_891598 ?auto_891607 ) ) ( not ( = ?auto_891598 ?auto_891608 ) ) ( not ( = ?auto_891598 ?auto_891609 ) ) ( not ( = ?auto_891599 ?auto_891600 ) ) ( not ( = ?auto_891599 ?auto_891601 ) ) ( not ( = ?auto_891599 ?auto_891602 ) ) ( not ( = ?auto_891599 ?auto_891603 ) ) ( not ( = ?auto_891599 ?auto_891604 ) ) ( not ( = ?auto_891599 ?auto_891605 ) ) ( not ( = ?auto_891599 ?auto_891606 ) ) ( not ( = ?auto_891599 ?auto_891607 ) ) ( not ( = ?auto_891599 ?auto_891608 ) ) ( not ( = ?auto_891599 ?auto_891609 ) ) ( not ( = ?auto_891600 ?auto_891601 ) ) ( not ( = ?auto_891600 ?auto_891602 ) ) ( not ( = ?auto_891600 ?auto_891603 ) ) ( not ( = ?auto_891600 ?auto_891604 ) ) ( not ( = ?auto_891600 ?auto_891605 ) ) ( not ( = ?auto_891600 ?auto_891606 ) ) ( not ( = ?auto_891600 ?auto_891607 ) ) ( not ( = ?auto_891600 ?auto_891608 ) ) ( not ( = ?auto_891600 ?auto_891609 ) ) ( not ( = ?auto_891601 ?auto_891602 ) ) ( not ( = ?auto_891601 ?auto_891603 ) ) ( not ( = ?auto_891601 ?auto_891604 ) ) ( not ( = ?auto_891601 ?auto_891605 ) ) ( not ( = ?auto_891601 ?auto_891606 ) ) ( not ( = ?auto_891601 ?auto_891607 ) ) ( not ( = ?auto_891601 ?auto_891608 ) ) ( not ( = ?auto_891601 ?auto_891609 ) ) ( not ( = ?auto_891602 ?auto_891603 ) ) ( not ( = ?auto_891602 ?auto_891604 ) ) ( not ( = ?auto_891602 ?auto_891605 ) ) ( not ( = ?auto_891602 ?auto_891606 ) ) ( not ( = ?auto_891602 ?auto_891607 ) ) ( not ( = ?auto_891602 ?auto_891608 ) ) ( not ( = ?auto_891602 ?auto_891609 ) ) ( not ( = ?auto_891603 ?auto_891604 ) ) ( not ( = ?auto_891603 ?auto_891605 ) ) ( not ( = ?auto_891603 ?auto_891606 ) ) ( not ( = ?auto_891603 ?auto_891607 ) ) ( not ( = ?auto_891603 ?auto_891608 ) ) ( not ( = ?auto_891603 ?auto_891609 ) ) ( not ( = ?auto_891604 ?auto_891605 ) ) ( not ( = ?auto_891604 ?auto_891606 ) ) ( not ( = ?auto_891604 ?auto_891607 ) ) ( not ( = ?auto_891604 ?auto_891608 ) ) ( not ( = ?auto_891604 ?auto_891609 ) ) ( not ( = ?auto_891605 ?auto_891606 ) ) ( not ( = ?auto_891605 ?auto_891607 ) ) ( not ( = ?auto_891605 ?auto_891608 ) ) ( not ( = ?auto_891605 ?auto_891609 ) ) ( not ( = ?auto_891606 ?auto_891607 ) ) ( not ( = ?auto_891606 ?auto_891608 ) ) ( not ( = ?auto_891606 ?auto_891609 ) ) ( not ( = ?auto_891607 ?auto_891608 ) ) ( not ( = ?auto_891607 ?auto_891609 ) ) ( not ( = ?auto_891608 ?auto_891609 ) ) ( ON ?auto_891607 ?auto_891608 ) ( ON ?auto_891606 ?auto_891607 ) ( ON ?auto_891605 ?auto_891606 ) ( CLEAR ?auto_891603 ) ( ON ?auto_891604 ?auto_891605 ) ( CLEAR ?auto_891604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_891597 ?auto_891598 ?auto_891599 ?auto_891600 ?auto_891601 ?auto_891602 ?auto_891603 ?auto_891604 )
      ( MAKE-12PILE ?auto_891597 ?auto_891598 ?auto_891599 ?auto_891600 ?auto_891601 ?auto_891602 ?auto_891603 ?auto_891604 ?auto_891605 ?auto_891606 ?auto_891607 ?auto_891608 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891647 - BLOCK
      ?auto_891648 - BLOCK
      ?auto_891649 - BLOCK
      ?auto_891650 - BLOCK
      ?auto_891651 - BLOCK
      ?auto_891652 - BLOCK
      ?auto_891653 - BLOCK
      ?auto_891654 - BLOCK
      ?auto_891655 - BLOCK
      ?auto_891656 - BLOCK
      ?auto_891657 - BLOCK
      ?auto_891658 - BLOCK
    )
    :vars
    (
      ?auto_891659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891658 ?auto_891659 ) ( ON-TABLE ?auto_891647 ) ( ON ?auto_891648 ?auto_891647 ) ( ON ?auto_891649 ?auto_891648 ) ( ON ?auto_891650 ?auto_891649 ) ( ON ?auto_891651 ?auto_891650 ) ( ON ?auto_891652 ?auto_891651 ) ( not ( = ?auto_891647 ?auto_891648 ) ) ( not ( = ?auto_891647 ?auto_891649 ) ) ( not ( = ?auto_891647 ?auto_891650 ) ) ( not ( = ?auto_891647 ?auto_891651 ) ) ( not ( = ?auto_891647 ?auto_891652 ) ) ( not ( = ?auto_891647 ?auto_891653 ) ) ( not ( = ?auto_891647 ?auto_891654 ) ) ( not ( = ?auto_891647 ?auto_891655 ) ) ( not ( = ?auto_891647 ?auto_891656 ) ) ( not ( = ?auto_891647 ?auto_891657 ) ) ( not ( = ?auto_891647 ?auto_891658 ) ) ( not ( = ?auto_891647 ?auto_891659 ) ) ( not ( = ?auto_891648 ?auto_891649 ) ) ( not ( = ?auto_891648 ?auto_891650 ) ) ( not ( = ?auto_891648 ?auto_891651 ) ) ( not ( = ?auto_891648 ?auto_891652 ) ) ( not ( = ?auto_891648 ?auto_891653 ) ) ( not ( = ?auto_891648 ?auto_891654 ) ) ( not ( = ?auto_891648 ?auto_891655 ) ) ( not ( = ?auto_891648 ?auto_891656 ) ) ( not ( = ?auto_891648 ?auto_891657 ) ) ( not ( = ?auto_891648 ?auto_891658 ) ) ( not ( = ?auto_891648 ?auto_891659 ) ) ( not ( = ?auto_891649 ?auto_891650 ) ) ( not ( = ?auto_891649 ?auto_891651 ) ) ( not ( = ?auto_891649 ?auto_891652 ) ) ( not ( = ?auto_891649 ?auto_891653 ) ) ( not ( = ?auto_891649 ?auto_891654 ) ) ( not ( = ?auto_891649 ?auto_891655 ) ) ( not ( = ?auto_891649 ?auto_891656 ) ) ( not ( = ?auto_891649 ?auto_891657 ) ) ( not ( = ?auto_891649 ?auto_891658 ) ) ( not ( = ?auto_891649 ?auto_891659 ) ) ( not ( = ?auto_891650 ?auto_891651 ) ) ( not ( = ?auto_891650 ?auto_891652 ) ) ( not ( = ?auto_891650 ?auto_891653 ) ) ( not ( = ?auto_891650 ?auto_891654 ) ) ( not ( = ?auto_891650 ?auto_891655 ) ) ( not ( = ?auto_891650 ?auto_891656 ) ) ( not ( = ?auto_891650 ?auto_891657 ) ) ( not ( = ?auto_891650 ?auto_891658 ) ) ( not ( = ?auto_891650 ?auto_891659 ) ) ( not ( = ?auto_891651 ?auto_891652 ) ) ( not ( = ?auto_891651 ?auto_891653 ) ) ( not ( = ?auto_891651 ?auto_891654 ) ) ( not ( = ?auto_891651 ?auto_891655 ) ) ( not ( = ?auto_891651 ?auto_891656 ) ) ( not ( = ?auto_891651 ?auto_891657 ) ) ( not ( = ?auto_891651 ?auto_891658 ) ) ( not ( = ?auto_891651 ?auto_891659 ) ) ( not ( = ?auto_891652 ?auto_891653 ) ) ( not ( = ?auto_891652 ?auto_891654 ) ) ( not ( = ?auto_891652 ?auto_891655 ) ) ( not ( = ?auto_891652 ?auto_891656 ) ) ( not ( = ?auto_891652 ?auto_891657 ) ) ( not ( = ?auto_891652 ?auto_891658 ) ) ( not ( = ?auto_891652 ?auto_891659 ) ) ( not ( = ?auto_891653 ?auto_891654 ) ) ( not ( = ?auto_891653 ?auto_891655 ) ) ( not ( = ?auto_891653 ?auto_891656 ) ) ( not ( = ?auto_891653 ?auto_891657 ) ) ( not ( = ?auto_891653 ?auto_891658 ) ) ( not ( = ?auto_891653 ?auto_891659 ) ) ( not ( = ?auto_891654 ?auto_891655 ) ) ( not ( = ?auto_891654 ?auto_891656 ) ) ( not ( = ?auto_891654 ?auto_891657 ) ) ( not ( = ?auto_891654 ?auto_891658 ) ) ( not ( = ?auto_891654 ?auto_891659 ) ) ( not ( = ?auto_891655 ?auto_891656 ) ) ( not ( = ?auto_891655 ?auto_891657 ) ) ( not ( = ?auto_891655 ?auto_891658 ) ) ( not ( = ?auto_891655 ?auto_891659 ) ) ( not ( = ?auto_891656 ?auto_891657 ) ) ( not ( = ?auto_891656 ?auto_891658 ) ) ( not ( = ?auto_891656 ?auto_891659 ) ) ( not ( = ?auto_891657 ?auto_891658 ) ) ( not ( = ?auto_891657 ?auto_891659 ) ) ( not ( = ?auto_891658 ?auto_891659 ) ) ( ON ?auto_891657 ?auto_891658 ) ( ON ?auto_891656 ?auto_891657 ) ( ON ?auto_891655 ?auto_891656 ) ( ON ?auto_891654 ?auto_891655 ) ( CLEAR ?auto_891652 ) ( ON ?auto_891653 ?auto_891654 ) ( CLEAR ?auto_891653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_891647 ?auto_891648 ?auto_891649 ?auto_891650 ?auto_891651 ?auto_891652 ?auto_891653 )
      ( MAKE-12PILE ?auto_891647 ?auto_891648 ?auto_891649 ?auto_891650 ?auto_891651 ?auto_891652 ?auto_891653 ?auto_891654 ?auto_891655 ?auto_891656 ?auto_891657 ?auto_891658 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891697 - BLOCK
      ?auto_891698 - BLOCK
      ?auto_891699 - BLOCK
      ?auto_891700 - BLOCK
      ?auto_891701 - BLOCK
      ?auto_891702 - BLOCK
      ?auto_891703 - BLOCK
      ?auto_891704 - BLOCK
      ?auto_891705 - BLOCK
      ?auto_891706 - BLOCK
      ?auto_891707 - BLOCK
      ?auto_891708 - BLOCK
    )
    :vars
    (
      ?auto_891709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891708 ?auto_891709 ) ( ON-TABLE ?auto_891697 ) ( ON ?auto_891698 ?auto_891697 ) ( ON ?auto_891699 ?auto_891698 ) ( ON ?auto_891700 ?auto_891699 ) ( ON ?auto_891701 ?auto_891700 ) ( not ( = ?auto_891697 ?auto_891698 ) ) ( not ( = ?auto_891697 ?auto_891699 ) ) ( not ( = ?auto_891697 ?auto_891700 ) ) ( not ( = ?auto_891697 ?auto_891701 ) ) ( not ( = ?auto_891697 ?auto_891702 ) ) ( not ( = ?auto_891697 ?auto_891703 ) ) ( not ( = ?auto_891697 ?auto_891704 ) ) ( not ( = ?auto_891697 ?auto_891705 ) ) ( not ( = ?auto_891697 ?auto_891706 ) ) ( not ( = ?auto_891697 ?auto_891707 ) ) ( not ( = ?auto_891697 ?auto_891708 ) ) ( not ( = ?auto_891697 ?auto_891709 ) ) ( not ( = ?auto_891698 ?auto_891699 ) ) ( not ( = ?auto_891698 ?auto_891700 ) ) ( not ( = ?auto_891698 ?auto_891701 ) ) ( not ( = ?auto_891698 ?auto_891702 ) ) ( not ( = ?auto_891698 ?auto_891703 ) ) ( not ( = ?auto_891698 ?auto_891704 ) ) ( not ( = ?auto_891698 ?auto_891705 ) ) ( not ( = ?auto_891698 ?auto_891706 ) ) ( not ( = ?auto_891698 ?auto_891707 ) ) ( not ( = ?auto_891698 ?auto_891708 ) ) ( not ( = ?auto_891698 ?auto_891709 ) ) ( not ( = ?auto_891699 ?auto_891700 ) ) ( not ( = ?auto_891699 ?auto_891701 ) ) ( not ( = ?auto_891699 ?auto_891702 ) ) ( not ( = ?auto_891699 ?auto_891703 ) ) ( not ( = ?auto_891699 ?auto_891704 ) ) ( not ( = ?auto_891699 ?auto_891705 ) ) ( not ( = ?auto_891699 ?auto_891706 ) ) ( not ( = ?auto_891699 ?auto_891707 ) ) ( not ( = ?auto_891699 ?auto_891708 ) ) ( not ( = ?auto_891699 ?auto_891709 ) ) ( not ( = ?auto_891700 ?auto_891701 ) ) ( not ( = ?auto_891700 ?auto_891702 ) ) ( not ( = ?auto_891700 ?auto_891703 ) ) ( not ( = ?auto_891700 ?auto_891704 ) ) ( not ( = ?auto_891700 ?auto_891705 ) ) ( not ( = ?auto_891700 ?auto_891706 ) ) ( not ( = ?auto_891700 ?auto_891707 ) ) ( not ( = ?auto_891700 ?auto_891708 ) ) ( not ( = ?auto_891700 ?auto_891709 ) ) ( not ( = ?auto_891701 ?auto_891702 ) ) ( not ( = ?auto_891701 ?auto_891703 ) ) ( not ( = ?auto_891701 ?auto_891704 ) ) ( not ( = ?auto_891701 ?auto_891705 ) ) ( not ( = ?auto_891701 ?auto_891706 ) ) ( not ( = ?auto_891701 ?auto_891707 ) ) ( not ( = ?auto_891701 ?auto_891708 ) ) ( not ( = ?auto_891701 ?auto_891709 ) ) ( not ( = ?auto_891702 ?auto_891703 ) ) ( not ( = ?auto_891702 ?auto_891704 ) ) ( not ( = ?auto_891702 ?auto_891705 ) ) ( not ( = ?auto_891702 ?auto_891706 ) ) ( not ( = ?auto_891702 ?auto_891707 ) ) ( not ( = ?auto_891702 ?auto_891708 ) ) ( not ( = ?auto_891702 ?auto_891709 ) ) ( not ( = ?auto_891703 ?auto_891704 ) ) ( not ( = ?auto_891703 ?auto_891705 ) ) ( not ( = ?auto_891703 ?auto_891706 ) ) ( not ( = ?auto_891703 ?auto_891707 ) ) ( not ( = ?auto_891703 ?auto_891708 ) ) ( not ( = ?auto_891703 ?auto_891709 ) ) ( not ( = ?auto_891704 ?auto_891705 ) ) ( not ( = ?auto_891704 ?auto_891706 ) ) ( not ( = ?auto_891704 ?auto_891707 ) ) ( not ( = ?auto_891704 ?auto_891708 ) ) ( not ( = ?auto_891704 ?auto_891709 ) ) ( not ( = ?auto_891705 ?auto_891706 ) ) ( not ( = ?auto_891705 ?auto_891707 ) ) ( not ( = ?auto_891705 ?auto_891708 ) ) ( not ( = ?auto_891705 ?auto_891709 ) ) ( not ( = ?auto_891706 ?auto_891707 ) ) ( not ( = ?auto_891706 ?auto_891708 ) ) ( not ( = ?auto_891706 ?auto_891709 ) ) ( not ( = ?auto_891707 ?auto_891708 ) ) ( not ( = ?auto_891707 ?auto_891709 ) ) ( not ( = ?auto_891708 ?auto_891709 ) ) ( ON ?auto_891707 ?auto_891708 ) ( ON ?auto_891706 ?auto_891707 ) ( ON ?auto_891705 ?auto_891706 ) ( ON ?auto_891704 ?auto_891705 ) ( ON ?auto_891703 ?auto_891704 ) ( CLEAR ?auto_891701 ) ( ON ?auto_891702 ?auto_891703 ) ( CLEAR ?auto_891702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_891697 ?auto_891698 ?auto_891699 ?auto_891700 ?auto_891701 ?auto_891702 )
      ( MAKE-12PILE ?auto_891697 ?auto_891698 ?auto_891699 ?auto_891700 ?auto_891701 ?auto_891702 ?auto_891703 ?auto_891704 ?auto_891705 ?auto_891706 ?auto_891707 ?auto_891708 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891747 - BLOCK
      ?auto_891748 - BLOCK
      ?auto_891749 - BLOCK
      ?auto_891750 - BLOCK
      ?auto_891751 - BLOCK
      ?auto_891752 - BLOCK
      ?auto_891753 - BLOCK
      ?auto_891754 - BLOCK
      ?auto_891755 - BLOCK
      ?auto_891756 - BLOCK
      ?auto_891757 - BLOCK
      ?auto_891758 - BLOCK
    )
    :vars
    (
      ?auto_891759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891758 ?auto_891759 ) ( ON-TABLE ?auto_891747 ) ( ON ?auto_891748 ?auto_891747 ) ( ON ?auto_891749 ?auto_891748 ) ( ON ?auto_891750 ?auto_891749 ) ( not ( = ?auto_891747 ?auto_891748 ) ) ( not ( = ?auto_891747 ?auto_891749 ) ) ( not ( = ?auto_891747 ?auto_891750 ) ) ( not ( = ?auto_891747 ?auto_891751 ) ) ( not ( = ?auto_891747 ?auto_891752 ) ) ( not ( = ?auto_891747 ?auto_891753 ) ) ( not ( = ?auto_891747 ?auto_891754 ) ) ( not ( = ?auto_891747 ?auto_891755 ) ) ( not ( = ?auto_891747 ?auto_891756 ) ) ( not ( = ?auto_891747 ?auto_891757 ) ) ( not ( = ?auto_891747 ?auto_891758 ) ) ( not ( = ?auto_891747 ?auto_891759 ) ) ( not ( = ?auto_891748 ?auto_891749 ) ) ( not ( = ?auto_891748 ?auto_891750 ) ) ( not ( = ?auto_891748 ?auto_891751 ) ) ( not ( = ?auto_891748 ?auto_891752 ) ) ( not ( = ?auto_891748 ?auto_891753 ) ) ( not ( = ?auto_891748 ?auto_891754 ) ) ( not ( = ?auto_891748 ?auto_891755 ) ) ( not ( = ?auto_891748 ?auto_891756 ) ) ( not ( = ?auto_891748 ?auto_891757 ) ) ( not ( = ?auto_891748 ?auto_891758 ) ) ( not ( = ?auto_891748 ?auto_891759 ) ) ( not ( = ?auto_891749 ?auto_891750 ) ) ( not ( = ?auto_891749 ?auto_891751 ) ) ( not ( = ?auto_891749 ?auto_891752 ) ) ( not ( = ?auto_891749 ?auto_891753 ) ) ( not ( = ?auto_891749 ?auto_891754 ) ) ( not ( = ?auto_891749 ?auto_891755 ) ) ( not ( = ?auto_891749 ?auto_891756 ) ) ( not ( = ?auto_891749 ?auto_891757 ) ) ( not ( = ?auto_891749 ?auto_891758 ) ) ( not ( = ?auto_891749 ?auto_891759 ) ) ( not ( = ?auto_891750 ?auto_891751 ) ) ( not ( = ?auto_891750 ?auto_891752 ) ) ( not ( = ?auto_891750 ?auto_891753 ) ) ( not ( = ?auto_891750 ?auto_891754 ) ) ( not ( = ?auto_891750 ?auto_891755 ) ) ( not ( = ?auto_891750 ?auto_891756 ) ) ( not ( = ?auto_891750 ?auto_891757 ) ) ( not ( = ?auto_891750 ?auto_891758 ) ) ( not ( = ?auto_891750 ?auto_891759 ) ) ( not ( = ?auto_891751 ?auto_891752 ) ) ( not ( = ?auto_891751 ?auto_891753 ) ) ( not ( = ?auto_891751 ?auto_891754 ) ) ( not ( = ?auto_891751 ?auto_891755 ) ) ( not ( = ?auto_891751 ?auto_891756 ) ) ( not ( = ?auto_891751 ?auto_891757 ) ) ( not ( = ?auto_891751 ?auto_891758 ) ) ( not ( = ?auto_891751 ?auto_891759 ) ) ( not ( = ?auto_891752 ?auto_891753 ) ) ( not ( = ?auto_891752 ?auto_891754 ) ) ( not ( = ?auto_891752 ?auto_891755 ) ) ( not ( = ?auto_891752 ?auto_891756 ) ) ( not ( = ?auto_891752 ?auto_891757 ) ) ( not ( = ?auto_891752 ?auto_891758 ) ) ( not ( = ?auto_891752 ?auto_891759 ) ) ( not ( = ?auto_891753 ?auto_891754 ) ) ( not ( = ?auto_891753 ?auto_891755 ) ) ( not ( = ?auto_891753 ?auto_891756 ) ) ( not ( = ?auto_891753 ?auto_891757 ) ) ( not ( = ?auto_891753 ?auto_891758 ) ) ( not ( = ?auto_891753 ?auto_891759 ) ) ( not ( = ?auto_891754 ?auto_891755 ) ) ( not ( = ?auto_891754 ?auto_891756 ) ) ( not ( = ?auto_891754 ?auto_891757 ) ) ( not ( = ?auto_891754 ?auto_891758 ) ) ( not ( = ?auto_891754 ?auto_891759 ) ) ( not ( = ?auto_891755 ?auto_891756 ) ) ( not ( = ?auto_891755 ?auto_891757 ) ) ( not ( = ?auto_891755 ?auto_891758 ) ) ( not ( = ?auto_891755 ?auto_891759 ) ) ( not ( = ?auto_891756 ?auto_891757 ) ) ( not ( = ?auto_891756 ?auto_891758 ) ) ( not ( = ?auto_891756 ?auto_891759 ) ) ( not ( = ?auto_891757 ?auto_891758 ) ) ( not ( = ?auto_891757 ?auto_891759 ) ) ( not ( = ?auto_891758 ?auto_891759 ) ) ( ON ?auto_891757 ?auto_891758 ) ( ON ?auto_891756 ?auto_891757 ) ( ON ?auto_891755 ?auto_891756 ) ( ON ?auto_891754 ?auto_891755 ) ( ON ?auto_891753 ?auto_891754 ) ( ON ?auto_891752 ?auto_891753 ) ( CLEAR ?auto_891750 ) ( ON ?auto_891751 ?auto_891752 ) ( CLEAR ?auto_891751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_891747 ?auto_891748 ?auto_891749 ?auto_891750 ?auto_891751 )
      ( MAKE-12PILE ?auto_891747 ?auto_891748 ?auto_891749 ?auto_891750 ?auto_891751 ?auto_891752 ?auto_891753 ?auto_891754 ?auto_891755 ?auto_891756 ?auto_891757 ?auto_891758 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891797 - BLOCK
      ?auto_891798 - BLOCK
      ?auto_891799 - BLOCK
      ?auto_891800 - BLOCK
      ?auto_891801 - BLOCK
      ?auto_891802 - BLOCK
      ?auto_891803 - BLOCK
      ?auto_891804 - BLOCK
      ?auto_891805 - BLOCK
      ?auto_891806 - BLOCK
      ?auto_891807 - BLOCK
      ?auto_891808 - BLOCK
    )
    :vars
    (
      ?auto_891809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891808 ?auto_891809 ) ( ON-TABLE ?auto_891797 ) ( ON ?auto_891798 ?auto_891797 ) ( ON ?auto_891799 ?auto_891798 ) ( not ( = ?auto_891797 ?auto_891798 ) ) ( not ( = ?auto_891797 ?auto_891799 ) ) ( not ( = ?auto_891797 ?auto_891800 ) ) ( not ( = ?auto_891797 ?auto_891801 ) ) ( not ( = ?auto_891797 ?auto_891802 ) ) ( not ( = ?auto_891797 ?auto_891803 ) ) ( not ( = ?auto_891797 ?auto_891804 ) ) ( not ( = ?auto_891797 ?auto_891805 ) ) ( not ( = ?auto_891797 ?auto_891806 ) ) ( not ( = ?auto_891797 ?auto_891807 ) ) ( not ( = ?auto_891797 ?auto_891808 ) ) ( not ( = ?auto_891797 ?auto_891809 ) ) ( not ( = ?auto_891798 ?auto_891799 ) ) ( not ( = ?auto_891798 ?auto_891800 ) ) ( not ( = ?auto_891798 ?auto_891801 ) ) ( not ( = ?auto_891798 ?auto_891802 ) ) ( not ( = ?auto_891798 ?auto_891803 ) ) ( not ( = ?auto_891798 ?auto_891804 ) ) ( not ( = ?auto_891798 ?auto_891805 ) ) ( not ( = ?auto_891798 ?auto_891806 ) ) ( not ( = ?auto_891798 ?auto_891807 ) ) ( not ( = ?auto_891798 ?auto_891808 ) ) ( not ( = ?auto_891798 ?auto_891809 ) ) ( not ( = ?auto_891799 ?auto_891800 ) ) ( not ( = ?auto_891799 ?auto_891801 ) ) ( not ( = ?auto_891799 ?auto_891802 ) ) ( not ( = ?auto_891799 ?auto_891803 ) ) ( not ( = ?auto_891799 ?auto_891804 ) ) ( not ( = ?auto_891799 ?auto_891805 ) ) ( not ( = ?auto_891799 ?auto_891806 ) ) ( not ( = ?auto_891799 ?auto_891807 ) ) ( not ( = ?auto_891799 ?auto_891808 ) ) ( not ( = ?auto_891799 ?auto_891809 ) ) ( not ( = ?auto_891800 ?auto_891801 ) ) ( not ( = ?auto_891800 ?auto_891802 ) ) ( not ( = ?auto_891800 ?auto_891803 ) ) ( not ( = ?auto_891800 ?auto_891804 ) ) ( not ( = ?auto_891800 ?auto_891805 ) ) ( not ( = ?auto_891800 ?auto_891806 ) ) ( not ( = ?auto_891800 ?auto_891807 ) ) ( not ( = ?auto_891800 ?auto_891808 ) ) ( not ( = ?auto_891800 ?auto_891809 ) ) ( not ( = ?auto_891801 ?auto_891802 ) ) ( not ( = ?auto_891801 ?auto_891803 ) ) ( not ( = ?auto_891801 ?auto_891804 ) ) ( not ( = ?auto_891801 ?auto_891805 ) ) ( not ( = ?auto_891801 ?auto_891806 ) ) ( not ( = ?auto_891801 ?auto_891807 ) ) ( not ( = ?auto_891801 ?auto_891808 ) ) ( not ( = ?auto_891801 ?auto_891809 ) ) ( not ( = ?auto_891802 ?auto_891803 ) ) ( not ( = ?auto_891802 ?auto_891804 ) ) ( not ( = ?auto_891802 ?auto_891805 ) ) ( not ( = ?auto_891802 ?auto_891806 ) ) ( not ( = ?auto_891802 ?auto_891807 ) ) ( not ( = ?auto_891802 ?auto_891808 ) ) ( not ( = ?auto_891802 ?auto_891809 ) ) ( not ( = ?auto_891803 ?auto_891804 ) ) ( not ( = ?auto_891803 ?auto_891805 ) ) ( not ( = ?auto_891803 ?auto_891806 ) ) ( not ( = ?auto_891803 ?auto_891807 ) ) ( not ( = ?auto_891803 ?auto_891808 ) ) ( not ( = ?auto_891803 ?auto_891809 ) ) ( not ( = ?auto_891804 ?auto_891805 ) ) ( not ( = ?auto_891804 ?auto_891806 ) ) ( not ( = ?auto_891804 ?auto_891807 ) ) ( not ( = ?auto_891804 ?auto_891808 ) ) ( not ( = ?auto_891804 ?auto_891809 ) ) ( not ( = ?auto_891805 ?auto_891806 ) ) ( not ( = ?auto_891805 ?auto_891807 ) ) ( not ( = ?auto_891805 ?auto_891808 ) ) ( not ( = ?auto_891805 ?auto_891809 ) ) ( not ( = ?auto_891806 ?auto_891807 ) ) ( not ( = ?auto_891806 ?auto_891808 ) ) ( not ( = ?auto_891806 ?auto_891809 ) ) ( not ( = ?auto_891807 ?auto_891808 ) ) ( not ( = ?auto_891807 ?auto_891809 ) ) ( not ( = ?auto_891808 ?auto_891809 ) ) ( ON ?auto_891807 ?auto_891808 ) ( ON ?auto_891806 ?auto_891807 ) ( ON ?auto_891805 ?auto_891806 ) ( ON ?auto_891804 ?auto_891805 ) ( ON ?auto_891803 ?auto_891804 ) ( ON ?auto_891802 ?auto_891803 ) ( ON ?auto_891801 ?auto_891802 ) ( CLEAR ?auto_891799 ) ( ON ?auto_891800 ?auto_891801 ) ( CLEAR ?auto_891800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_891797 ?auto_891798 ?auto_891799 ?auto_891800 )
      ( MAKE-12PILE ?auto_891797 ?auto_891798 ?auto_891799 ?auto_891800 ?auto_891801 ?auto_891802 ?auto_891803 ?auto_891804 ?auto_891805 ?auto_891806 ?auto_891807 ?auto_891808 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891847 - BLOCK
      ?auto_891848 - BLOCK
      ?auto_891849 - BLOCK
      ?auto_891850 - BLOCK
      ?auto_891851 - BLOCK
      ?auto_891852 - BLOCK
      ?auto_891853 - BLOCK
      ?auto_891854 - BLOCK
      ?auto_891855 - BLOCK
      ?auto_891856 - BLOCK
      ?auto_891857 - BLOCK
      ?auto_891858 - BLOCK
    )
    :vars
    (
      ?auto_891859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891858 ?auto_891859 ) ( ON-TABLE ?auto_891847 ) ( ON ?auto_891848 ?auto_891847 ) ( not ( = ?auto_891847 ?auto_891848 ) ) ( not ( = ?auto_891847 ?auto_891849 ) ) ( not ( = ?auto_891847 ?auto_891850 ) ) ( not ( = ?auto_891847 ?auto_891851 ) ) ( not ( = ?auto_891847 ?auto_891852 ) ) ( not ( = ?auto_891847 ?auto_891853 ) ) ( not ( = ?auto_891847 ?auto_891854 ) ) ( not ( = ?auto_891847 ?auto_891855 ) ) ( not ( = ?auto_891847 ?auto_891856 ) ) ( not ( = ?auto_891847 ?auto_891857 ) ) ( not ( = ?auto_891847 ?auto_891858 ) ) ( not ( = ?auto_891847 ?auto_891859 ) ) ( not ( = ?auto_891848 ?auto_891849 ) ) ( not ( = ?auto_891848 ?auto_891850 ) ) ( not ( = ?auto_891848 ?auto_891851 ) ) ( not ( = ?auto_891848 ?auto_891852 ) ) ( not ( = ?auto_891848 ?auto_891853 ) ) ( not ( = ?auto_891848 ?auto_891854 ) ) ( not ( = ?auto_891848 ?auto_891855 ) ) ( not ( = ?auto_891848 ?auto_891856 ) ) ( not ( = ?auto_891848 ?auto_891857 ) ) ( not ( = ?auto_891848 ?auto_891858 ) ) ( not ( = ?auto_891848 ?auto_891859 ) ) ( not ( = ?auto_891849 ?auto_891850 ) ) ( not ( = ?auto_891849 ?auto_891851 ) ) ( not ( = ?auto_891849 ?auto_891852 ) ) ( not ( = ?auto_891849 ?auto_891853 ) ) ( not ( = ?auto_891849 ?auto_891854 ) ) ( not ( = ?auto_891849 ?auto_891855 ) ) ( not ( = ?auto_891849 ?auto_891856 ) ) ( not ( = ?auto_891849 ?auto_891857 ) ) ( not ( = ?auto_891849 ?auto_891858 ) ) ( not ( = ?auto_891849 ?auto_891859 ) ) ( not ( = ?auto_891850 ?auto_891851 ) ) ( not ( = ?auto_891850 ?auto_891852 ) ) ( not ( = ?auto_891850 ?auto_891853 ) ) ( not ( = ?auto_891850 ?auto_891854 ) ) ( not ( = ?auto_891850 ?auto_891855 ) ) ( not ( = ?auto_891850 ?auto_891856 ) ) ( not ( = ?auto_891850 ?auto_891857 ) ) ( not ( = ?auto_891850 ?auto_891858 ) ) ( not ( = ?auto_891850 ?auto_891859 ) ) ( not ( = ?auto_891851 ?auto_891852 ) ) ( not ( = ?auto_891851 ?auto_891853 ) ) ( not ( = ?auto_891851 ?auto_891854 ) ) ( not ( = ?auto_891851 ?auto_891855 ) ) ( not ( = ?auto_891851 ?auto_891856 ) ) ( not ( = ?auto_891851 ?auto_891857 ) ) ( not ( = ?auto_891851 ?auto_891858 ) ) ( not ( = ?auto_891851 ?auto_891859 ) ) ( not ( = ?auto_891852 ?auto_891853 ) ) ( not ( = ?auto_891852 ?auto_891854 ) ) ( not ( = ?auto_891852 ?auto_891855 ) ) ( not ( = ?auto_891852 ?auto_891856 ) ) ( not ( = ?auto_891852 ?auto_891857 ) ) ( not ( = ?auto_891852 ?auto_891858 ) ) ( not ( = ?auto_891852 ?auto_891859 ) ) ( not ( = ?auto_891853 ?auto_891854 ) ) ( not ( = ?auto_891853 ?auto_891855 ) ) ( not ( = ?auto_891853 ?auto_891856 ) ) ( not ( = ?auto_891853 ?auto_891857 ) ) ( not ( = ?auto_891853 ?auto_891858 ) ) ( not ( = ?auto_891853 ?auto_891859 ) ) ( not ( = ?auto_891854 ?auto_891855 ) ) ( not ( = ?auto_891854 ?auto_891856 ) ) ( not ( = ?auto_891854 ?auto_891857 ) ) ( not ( = ?auto_891854 ?auto_891858 ) ) ( not ( = ?auto_891854 ?auto_891859 ) ) ( not ( = ?auto_891855 ?auto_891856 ) ) ( not ( = ?auto_891855 ?auto_891857 ) ) ( not ( = ?auto_891855 ?auto_891858 ) ) ( not ( = ?auto_891855 ?auto_891859 ) ) ( not ( = ?auto_891856 ?auto_891857 ) ) ( not ( = ?auto_891856 ?auto_891858 ) ) ( not ( = ?auto_891856 ?auto_891859 ) ) ( not ( = ?auto_891857 ?auto_891858 ) ) ( not ( = ?auto_891857 ?auto_891859 ) ) ( not ( = ?auto_891858 ?auto_891859 ) ) ( ON ?auto_891857 ?auto_891858 ) ( ON ?auto_891856 ?auto_891857 ) ( ON ?auto_891855 ?auto_891856 ) ( ON ?auto_891854 ?auto_891855 ) ( ON ?auto_891853 ?auto_891854 ) ( ON ?auto_891852 ?auto_891853 ) ( ON ?auto_891851 ?auto_891852 ) ( ON ?auto_891850 ?auto_891851 ) ( CLEAR ?auto_891848 ) ( ON ?auto_891849 ?auto_891850 ) ( CLEAR ?auto_891849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_891847 ?auto_891848 ?auto_891849 )
      ( MAKE-12PILE ?auto_891847 ?auto_891848 ?auto_891849 ?auto_891850 ?auto_891851 ?auto_891852 ?auto_891853 ?auto_891854 ?auto_891855 ?auto_891856 ?auto_891857 ?auto_891858 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891897 - BLOCK
      ?auto_891898 - BLOCK
      ?auto_891899 - BLOCK
      ?auto_891900 - BLOCK
      ?auto_891901 - BLOCK
      ?auto_891902 - BLOCK
      ?auto_891903 - BLOCK
      ?auto_891904 - BLOCK
      ?auto_891905 - BLOCK
      ?auto_891906 - BLOCK
      ?auto_891907 - BLOCK
      ?auto_891908 - BLOCK
    )
    :vars
    (
      ?auto_891909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891908 ?auto_891909 ) ( ON-TABLE ?auto_891897 ) ( not ( = ?auto_891897 ?auto_891898 ) ) ( not ( = ?auto_891897 ?auto_891899 ) ) ( not ( = ?auto_891897 ?auto_891900 ) ) ( not ( = ?auto_891897 ?auto_891901 ) ) ( not ( = ?auto_891897 ?auto_891902 ) ) ( not ( = ?auto_891897 ?auto_891903 ) ) ( not ( = ?auto_891897 ?auto_891904 ) ) ( not ( = ?auto_891897 ?auto_891905 ) ) ( not ( = ?auto_891897 ?auto_891906 ) ) ( not ( = ?auto_891897 ?auto_891907 ) ) ( not ( = ?auto_891897 ?auto_891908 ) ) ( not ( = ?auto_891897 ?auto_891909 ) ) ( not ( = ?auto_891898 ?auto_891899 ) ) ( not ( = ?auto_891898 ?auto_891900 ) ) ( not ( = ?auto_891898 ?auto_891901 ) ) ( not ( = ?auto_891898 ?auto_891902 ) ) ( not ( = ?auto_891898 ?auto_891903 ) ) ( not ( = ?auto_891898 ?auto_891904 ) ) ( not ( = ?auto_891898 ?auto_891905 ) ) ( not ( = ?auto_891898 ?auto_891906 ) ) ( not ( = ?auto_891898 ?auto_891907 ) ) ( not ( = ?auto_891898 ?auto_891908 ) ) ( not ( = ?auto_891898 ?auto_891909 ) ) ( not ( = ?auto_891899 ?auto_891900 ) ) ( not ( = ?auto_891899 ?auto_891901 ) ) ( not ( = ?auto_891899 ?auto_891902 ) ) ( not ( = ?auto_891899 ?auto_891903 ) ) ( not ( = ?auto_891899 ?auto_891904 ) ) ( not ( = ?auto_891899 ?auto_891905 ) ) ( not ( = ?auto_891899 ?auto_891906 ) ) ( not ( = ?auto_891899 ?auto_891907 ) ) ( not ( = ?auto_891899 ?auto_891908 ) ) ( not ( = ?auto_891899 ?auto_891909 ) ) ( not ( = ?auto_891900 ?auto_891901 ) ) ( not ( = ?auto_891900 ?auto_891902 ) ) ( not ( = ?auto_891900 ?auto_891903 ) ) ( not ( = ?auto_891900 ?auto_891904 ) ) ( not ( = ?auto_891900 ?auto_891905 ) ) ( not ( = ?auto_891900 ?auto_891906 ) ) ( not ( = ?auto_891900 ?auto_891907 ) ) ( not ( = ?auto_891900 ?auto_891908 ) ) ( not ( = ?auto_891900 ?auto_891909 ) ) ( not ( = ?auto_891901 ?auto_891902 ) ) ( not ( = ?auto_891901 ?auto_891903 ) ) ( not ( = ?auto_891901 ?auto_891904 ) ) ( not ( = ?auto_891901 ?auto_891905 ) ) ( not ( = ?auto_891901 ?auto_891906 ) ) ( not ( = ?auto_891901 ?auto_891907 ) ) ( not ( = ?auto_891901 ?auto_891908 ) ) ( not ( = ?auto_891901 ?auto_891909 ) ) ( not ( = ?auto_891902 ?auto_891903 ) ) ( not ( = ?auto_891902 ?auto_891904 ) ) ( not ( = ?auto_891902 ?auto_891905 ) ) ( not ( = ?auto_891902 ?auto_891906 ) ) ( not ( = ?auto_891902 ?auto_891907 ) ) ( not ( = ?auto_891902 ?auto_891908 ) ) ( not ( = ?auto_891902 ?auto_891909 ) ) ( not ( = ?auto_891903 ?auto_891904 ) ) ( not ( = ?auto_891903 ?auto_891905 ) ) ( not ( = ?auto_891903 ?auto_891906 ) ) ( not ( = ?auto_891903 ?auto_891907 ) ) ( not ( = ?auto_891903 ?auto_891908 ) ) ( not ( = ?auto_891903 ?auto_891909 ) ) ( not ( = ?auto_891904 ?auto_891905 ) ) ( not ( = ?auto_891904 ?auto_891906 ) ) ( not ( = ?auto_891904 ?auto_891907 ) ) ( not ( = ?auto_891904 ?auto_891908 ) ) ( not ( = ?auto_891904 ?auto_891909 ) ) ( not ( = ?auto_891905 ?auto_891906 ) ) ( not ( = ?auto_891905 ?auto_891907 ) ) ( not ( = ?auto_891905 ?auto_891908 ) ) ( not ( = ?auto_891905 ?auto_891909 ) ) ( not ( = ?auto_891906 ?auto_891907 ) ) ( not ( = ?auto_891906 ?auto_891908 ) ) ( not ( = ?auto_891906 ?auto_891909 ) ) ( not ( = ?auto_891907 ?auto_891908 ) ) ( not ( = ?auto_891907 ?auto_891909 ) ) ( not ( = ?auto_891908 ?auto_891909 ) ) ( ON ?auto_891907 ?auto_891908 ) ( ON ?auto_891906 ?auto_891907 ) ( ON ?auto_891905 ?auto_891906 ) ( ON ?auto_891904 ?auto_891905 ) ( ON ?auto_891903 ?auto_891904 ) ( ON ?auto_891902 ?auto_891903 ) ( ON ?auto_891901 ?auto_891902 ) ( ON ?auto_891900 ?auto_891901 ) ( ON ?auto_891899 ?auto_891900 ) ( CLEAR ?auto_891897 ) ( ON ?auto_891898 ?auto_891899 ) ( CLEAR ?auto_891898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_891897 ?auto_891898 )
      ( MAKE-12PILE ?auto_891897 ?auto_891898 ?auto_891899 ?auto_891900 ?auto_891901 ?auto_891902 ?auto_891903 ?auto_891904 ?auto_891905 ?auto_891906 ?auto_891907 ?auto_891908 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_891947 - BLOCK
      ?auto_891948 - BLOCK
      ?auto_891949 - BLOCK
      ?auto_891950 - BLOCK
      ?auto_891951 - BLOCK
      ?auto_891952 - BLOCK
      ?auto_891953 - BLOCK
      ?auto_891954 - BLOCK
      ?auto_891955 - BLOCK
      ?auto_891956 - BLOCK
      ?auto_891957 - BLOCK
      ?auto_891958 - BLOCK
    )
    :vars
    (
      ?auto_891959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_891958 ?auto_891959 ) ( not ( = ?auto_891947 ?auto_891948 ) ) ( not ( = ?auto_891947 ?auto_891949 ) ) ( not ( = ?auto_891947 ?auto_891950 ) ) ( not ( = ?auto_891947 ?auto_891951 ) ) ( not ( = ?auto_891947 ?auto_891952 ) ) ( not ( = ?auto_891947 ?auto_891953 ) ) ( not ( = ?auto_891947 ?auto_891954 ) ) ( not ( = ?auto_891947 ?auto_891955 ) ) ( not ( = ?auto_891947 ?auto_891956 ) ) ( not ( = ?auto_891947 ?auto_891957 ) ) ( not ( = ?auto_891947 ?auto_891958 ) ) ( not ( = ?auto_891947 ?auto_891959 ) ) ( not ( = ?auto_891948 ?auto_891949 ) ) ( not ( = ?auto_891948 ?auto_891950 ) ) ( not ( = ?auto_891948 ?auto_891951 ) ) ( not ( = ?auto_891948 ?auto_891952 ) ) ( not ( = ?auto_891948 ?auto_891953 ) ) ( not ( = ?auto_891948 ?auto_891954 ) ) ( not ( = ?auto_891948 ?auto_891955 ) ) ( not ( = ?auto_891948 ?auto_891956 ) ) ( not ( = ?auto_891948 ?auto_891957 ) ) ( not ( = ?auto_891948 ?auto_891958 ) ) ( not ( = ?auto_891948 ?auto_891959 ) ) ( not ( = ?auto_891949 ?auto_891950 ) ) ( not ( = ?auto_891949 ?auto_891951 ) ) ( not ( = ?auto_891949 ?auto_891952 ) ) ( not ( = ?auto_891949 ?auto_891953 ) ) ( not ( = ?auto_891949 ?auto_891954 ) ) ( not ( = ?auto_891949 ?auto_891955 ) ) ( not ( = ?auto_891949 ?auto_891956 ) ) ( not ( = ?auto_891949 ?auto_891957 ) ) ( not ( = ?auto_891949 ?auto_891958 ) ) ( not ( = ?auto_891949 ?auto_891959 ) ) ( not ( = ?auto_891950 ?auto_891951 ) ) ( not ( = ?auto_891950 ?auto_891952 ) ) ( not ( = ?auto_891950 ?auto_891953 ) ) ( not ( = ?auto_891950 ?auto_891954 ) ) ( not ( = ?auto_891950 ?auto_891955 ) ) ( not ( = ?auto_891950 ?auto_891956 ) ) ( not ( = ?auto_891950 ?auto_891957 ) ) ( not ( = ?auto_891950 ?auto_891958 ) ) ( not ( = ?auto_891950 ?auto_891959 ) ) ( not ( = ?auto_891951 ?auto_891952 ) ) ( not ( = ?auto_891951 ?auto_891953 ) ) ( not ( = ?auto_891951 ?auto_891954 ) ) ( not ( = ?auto_891951 ?auto_891955 ) ) ( not ( = ?auto_891951 ?auto_891956 ) ) ( not ( = ?auto_891951 ?auto_891957 ) ) ( not ( = ?auto_891951 ?auto_891958 ) ) ( not ( = ?auto_891951 ?auto_891959 ) ) ( not ( = ?auto_891952 ?auto_891953 ) ) ( not ( = ?auto_891952 ?auto_891954 ) ) ( not ( = ?auto_891952 ?auto_891955 ) ) ( not ( = ?auto_891952 ?auto_891956 ) ) ( not ( = ?auto_891952 ?auto_891957 ) ) ( not ( = ?auto_891952 ?auto_891958 ) ) ( not ( = ?auto_891952 ?auto_891959 ) ) ( not ( = ?auto_891953 ?auto_891954 ) ) ( not ( = ?auto_891953 ?auto_891955 ) ) ( not ( = ?auto_891953 ?auto_891956 ) ) ( not ( = ?auto_891953 ?auto_891957 ) ) ( not ( = ?auto_891953 ?auto_891958 ) ) ( not ( = ?auto_891953 ?auto_891959 ) ) ( not ( = ?auto_891954 ?auto_891955 ) ) ( not ( = ?auto_891954 ?auto_891956 ) ) ( not ( = ?auto_891954 ?auto_891957 ) ) ( not ( = ?auto_891954 ?auto_891958 ) ) ( not ( = ?auto_891954 ?auto_891959 ) ) ( not ( = ?auto_891955 ?auto_891956 ) ) ( not ( = ?auto_891955 ?auto_891957 ) ) ( not ( = ?auto_891955 ?auto_891958 ) ) ( not ( = ?auto_891955 ?auto_891959 ) ) ( not ( = ?auto_891956 ?auto_891957 ) ) ( not ( = ?auto_891956 ?auto_891958 ) ) ( not ( = ?auto_891956 ?auto_891959 ) ) ( not ( = ?auto_891957 ?auto_891958 ) ) ( not ( = ?auto_891957 ?auto_891959 ) ) ( not ( = ?auto_891958 ?auto_891959 ) ) ( ON ?auto_891957 ?auto_891958 ) ( ON ?auto_891956 ?auto_891957 ) ( ON ?auto_891955 ?auto_891956 ) ( ON ?auto_891954 ?auto_891955 ) ( ON ?auto_891953 ?auto_891954 ) ( ON ?auto_891952 ?auto_891953 ) ( ON ?auto_891951 ?auto_891952 ) ( ON ?auto_891950 ?auto_891951 ) ( ON ?auto_891949 ?auto_891950 ) ( ON ?auto_891948 ?auto_891949 ) ( ON ?auto_891947 ?auto_891948 ) ( CLEAR ?auto_891947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_891947 )
      ( MAKE-12PILE ?auto_891947 ?auto_891948 ?auto_891949 ?auto_891950 ?auto_891951 ?auto_891952 ?auto_891953 ?auto_891954 ?auto_891955 ?auto_891956 ?auto_891957 ?auto_891958 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_891998 - BLOCK
      ?auto_891999 - BLOCK
      ?auto_892000 - BLOCK
      ?auto_892001 - BLOCK
      ?auto_892002 - BLOCK
      ?auto_892003 - BLOCK
      ?auto_892004 - BLOCK
      ?auto_892005 - BLOCK
      ?auto_892006 - BLOCK
      ?auto_892007 - BLOCK
      ?auto_892008 - BLOCK
      ?auto_892009 - BLOCK
      ?auto_892010 - BLOCK
    )
    :vars
    (
      ?auto_892011 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_892009 ) ( ON ?auto_892010 ?auto_892011 ) ( CLEAR ?auto_892010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_891998 ) ( ON ?auto_891999 ?auto_891998 ) ( ON ?auto_892000 ?auto_891999 ) ( ON ?auto_892001 ?auto_892000 ) ( ON ?auto_892002 ?auto_892001 ) ( ON ?auto_892003 ?auto_892002 ) ( ON ?auto_892004 ?auto_892003 ) ( ON ?auto_892005 ?auto_892004 ) ( ON ?auto_892006 ?auto_892005 ) ( ON ?auto_892007 ?auto_892006 ) ( ON ?auto_892008 ?auto_892007 ) ( ON ?auto_892009 ?auto_892008 ) ( not ( = ?auto_891998 ?auto_891999 ) ) ( not ( = ?auto_891998 ?auto_892000 ) ) ( not ( = ?auto_891998 ?auto_892001 ) ) ( not ( = ?auto_891998 ?auto_892002 ) ) ( not ( = ?auto_891998 ?auto_892003 ) ) ( not ( = ?auto_891998 ?auto_892004 ) ) ( not ( = ?auto_891998 ?auto_892005 ) ) ( not ( = ?auto_891998 ?auto_892006 ) ) ( not ( = ?auto_891998 ?auto_892007 ) ) ( not ( = ?auto_891998 ?auto_892008 ) ) ( not ( = ?auto_891998 ?auto_892009 ) ) ( not ( = ?auto_891998 ?auto_892010 ) ) ( not ( = ?auto_891998 ?auto_892011 ) ) ( not ( = ?auto_891999 ?auto_892000 ) ) ( not ( = ?auto_891999 ?auto_892001 ) ) ( not ( = ?auto_891999 ?auto_892002 ) ) ( not ( = ?auto_891999 ?auto_892003 ) ) ( not ( = ?auto_891999 ?auto_892004 ) ) ( not ( = ?auto_891999 ?auto_892005 ) ) ( not ( = ?auto_891999 ?auto_892006 ) ) ( not ( = ?auto_891999 ?auto_892007 ) ) ( not ( = ?auto_891999 ?auto_892008 ) ) ( not ( = ?auto_891999 ?auto_892009 ) ) ( not ( = ?auto_891999 ?auto_892010 ) ) ( not ( = ?auto_891999 ?auto_892011 ) ) ( not ( = ?auto_892000 ?auto_892001 ) ) ( not ( = ?auto_892000 ?auto_892002 ) ) ( not ( = ?auto_892000 ?auto_892003 ) ) ( not ( = ?auto_892000 ?auto_892004 ) ) ( not ( = ?auto_892000 ?auto_892005 ) ) ( not ( = ?auto_892000 ?auto_892006 ) ) ( not ( = ?auto_892000 ?auto_892007 ) ) ( not ( = ?auto_892000 ?auto_892008 ) ) ( not ( = ?auto_892000 ?auto_892009 ) ) ( not ( = ?auto_892000 ?auto_892010 ) ) ( not ( = ?auto_892000 ?auto_892011 ) ) ( not ( = ?auto_892001 ?auto_892002 ) ) ( not ( = ?auto_892001 ?auto_892003 ) ) ( not ( = ?auto_892001 ?auto_892004 ) ) ( not ( = ?auto_892001 ?auto_892005 ) ) ( not ( = ?auto_892001 ?auto_892006 ) ) ( not ( = ?auto_892001 ?auto_892007 ) ) ( not ( = ?auto_892001 ?auto_892008 ) ) ( not ( = ?auto_892001 ?auto_892009 ) ) ( not ( = ?auto_892001 ?auto_892010 ) ) ( not ( = ?auto_892001 ?auto_892011 ) ) ( not ( = ?auto_892002 ?auto_892003 ) ) ( not ( = ?auto_892002 ?auto_892004 ) ) ( not ( = ?auto_892002 ?auto_892005 ) ) ( not ( = ?auto_892002 ?auto_892006 ) ) ( not ( = ?auto_892002 ?auto_892007 ) ) ( not ( = ?auto_892002 ?auto_892008 ) ) ( not ( = ?auto_892002 ?auto_892009 ) ) ( not ( = ?auto_892002 ?auto_892010 ) ) ( not ( = ?auto_892002 ?auto_892011 ) ) ( not ( = ?auto_892003 ?auto_892004 ) ) ( not ( = ?auto_892003 ?auto_892005 ) ) ( not ( = ?auto_892003 ?auto_892006 ) ) ( not ( = ?auto_892003 ?auto_892007 ) ) ( not ( = ?auto_892003 ?auto_892008 ) ) ( not ( = ?auto_892003 ?auto_892009 ) ) ( not ( = ?auto_892003 ?auto_892010 ) ) ( not ( = ?auto_892003 ?auto_892011 ) ) ( not ( = ?auto_892004 ?auto_892005 ) ) ( not ( = ?auto_892004 ?auto_892006 ) ) ( not ( = ?auto_892004 ?auto_892007 ) ) ( not ( = ?auto_892004 ?auto_892008 ) ) ( not ( = ?auto_892004 ?auto_892009 ) ) ( not ( = ?auto_892004 ?auto_892010 ) ) ( not ( = ?auto_892004 ?auto_892011 ) ) ( not ( = ?auto_892005 ?auto_892006 ) ) ( not ( = ?auto_892005 ?auto_892007 ) ) ( not ( = ?auto_892005 ?auto_892008 ) ) ( not ( = ?auto_892005 ?auto_892009 ) ) ( not ( = ?auto_892005 ?auto_892010 ) ) ( not ( = ?auto_892005 ?auto_892011 ) ) ( not ( = ?auto_892006 ?auto_892007 ) ) ( not ( = ?auto_892006 ?auto_892008 ) ) ( not ( = ?auto_892006 ?auto_892009 ) ) ( not ( = ?auto_892006 ?auto_892010 ) ) ( not ( = ?auto_892006 ?auto_892011 ) ) ( not ( = ?auto_892007 ?auto_892008 ) ) ( not ( = ?auto_892007 ?auto_892009 ) ) ( not ( = ?auto_892007 ?auto_892010 ) ) ( not ( = ?auto_892007 ?auto_892011 ) ) ( not ( = ?auto_892008 ?auto_892009 ) ) ( not ( = ?auto_892008 ?auto_892010 ) ) ( not ( = ?auto_892008 ?auto_892011 ) ) ( not ( = ?auto_892009 ?auto_892010 ) ) ( not ( = ?auto_892009 ?auto_892011 ) ) ( not ( = ?auto_892010 ?auto_892011 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_892010 ?auto_892011 )
      ( !STACK ?auto_892010 ?auto_892009 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892052 - BLOCK
      ?auto_892053 - BLOCK
      ?auto_892054 - BLOCK
      ?auto_892055 - BLOCK
      ?auto_892056 - BLOCK
      ?auto_892057 - BLOCK
      ?auto_892058 - BLOCK
      ?auto_892059 - BLOCK
      ?auto_892060 - BLOCK
      ?auto_892061 - BLOCK
      ?auto_892062 - BLOCK
      ?auto_892063 - BLOCK
      ?auto_892064 - BLOCK
    )
    :vars
    (
      ?auto_892065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892064 ?auto_892065 ) ( ON-TABLE ?auto_892052 ) ( ON ?auto_892053 ?auto_892052 ) ( ON ?auto_892054 ?auto_892053 ) ( ON ?auto_892055 ?auto_892054 ) ( ON ?auto_892056 ?auto_892055 ) ( ON ?auto_892057 ?auto_892056 ) ( ON ?auto_892058 ?auto_892057 ) ( ON ?auto_892059 ?auto_892058 ) ( ON ?auto_892060 ?auto_892059 ) ( ON ?auto_892061 ?auto_892060 ) ( ON ?auto_892062 ?auto_892061 ) ( not ( = ?auto_892052 ?auto_892053 ) ) ( not ( = ?auto_892052 ?auto_892054 ) ) ( not ( = ?auto_892052 ?auto_892055 ) ) ( not ( = ?auto_892052 ?auto_892056 ) ) ( not ( = ?auto_892052 ?auto_892057 ) ) ( not ( = ?auto_892052 ?auto_892058 ) ) ( not ( = ?auto_892052 ?auto_892059 ) ) ( not ( = ?auto_892052 ?auto_892060 ) ) ( not ( = ?auto_892052 ?auto_892061 ) ) ( not ( = ?auto_892052 ?auto_892062 ) ) ( not ( = ?auto_892052 ?auto_892063 ) ) ( not ( = ?auto_892052 ?auto_892064 ) ) ( not ( = ?auto_892052 ?auto_892065 ) ) ( not ( = ?auto_892053 ?auto_892054 ) ) ( not ( = ?auto_892053 ?auto_892055 ) ) ( not ( = ?auto_892053 ?auto_892056 ) ) ( not ( = ?auto_892053 ?auto_892057 ) ) ( not ( = ?auto_892053 ?auto_892058 ) ) ( not ( = ?auto_892053 ?auto_892059 ) ) ( not ( = ?auto_892053 ?auto_892060 ) ) ( not ( = ?auto_892053 ?auto_892061 ) ) ( not ( = ?auto_892053 ?auto_892062 ) ) ( not ( = ?auto_892053 ?auto_892063 ) ) ( not ( = ?auto_892053 ?auto_892064 ) ) ( not ( = ?auto_892053 ?auto_892065 ) ) ( not ( = ?auto_892054 ?auto_892055 ) ) ( not ( = ?auto_892054 ?auto_892056 ) ) ( not ( = ?auto_892054 ?auto_892057 ) ) ( not ( = ?auto_892054 ?auto_892058 ) ) ( not ( = ?auto_892054 ?auto_892059 ) ) ( not ( = ?auto_892054 ?auto_892060 ) ) ( not ( = ?auto_892054 ?auto_892061 ) ) ( not ( = ?auto_892054 ?auto_892062 ) ) ( not ( = ?auto_892054 ?auto_892063 ) ) ( not ( = ?auto_892054 ?auto_892064 ) ) ( not ( = ?auto_892054 ?auto_892065 ) ) ( not ( = ?auto_892055 ?auto_892056 ) ) ( not ( = ?auto_892055 ?auto_892057 ) ) ( not ( = ?auto_892055 ?auto_892058 ) ) ( not ( = ?auto_892055 ?auto_892059 ) ) ( not ( = ?auto_892055 ?auto_892060 ) ) ( not ( = ?auto_892055 ?auto_892061 ) ) ( not ( = ?auto_892055 ?auto_892062 ) ) ( not ( = ?auto_892055 ?auto_892063 ) ) ( not ( = ?auto_892055 ?auto_892064 ) ) ( not ( = ?auto_892055 ?auto_892065 ) ) ( not ( = ?auto_892056 ?auto_892057 ) ) ( not ( = ?auto_892056 ?auto_892058 ) ) ( not ( = ?auto_892056 ?auto_892059 ) ) ( not ( = ?auto_892056 ?auto_892060 ) ) ( not ( = ?auto_892056 ?auto_892061 ) ) ( not ( = ?auto_892056 ?auto_892062 ) ) ( not ( = ?auto_892056 ?auto_892063 ) ) ( not ( = ?auto_892056 ?auto_892064 ) ) ( not ( = ?auto_892056 ?auto_892065 ) ) ( not ( = ?auto_892057 ?auto_892058 ) ) ( not ( = ?auto_892057 ?auto_892059 ) ) ( not ( = ?auto_892057 ?auto_892060 ) ) ( not ( = ?auto_892057 ?auto_892061 ) ) ( not ( = ?auto_892057 ?auto_892062 ) ) ( not ( = ?auto_892057 ?auto_892063 ) ) ( not ( = ?auto_892057 ?auto_892064 ) ) ( not ( = ?auto_892057 ?auto_892065 ) ) ( not ( = ?auto_892058 ?auto_892059 ) ) ( not ( = ?auto_892058 ?auto_892060 ) ) ( not ( = ?auto_892058 ?auto_892061 ) ) ( not ( = ?auto_892058 ?auto_892062 ) ) ( not ( = ?auto_892058 ?auto_892063 ) ) ( not ( = ?auto_892058 ?auto_892064 ) ) ( not ( = ?auto_892058 ?auto_892065 ) ) ( not ( = ?auto_892059 ?auto_892060 ) ) ( not ( = ?auto_892059 ?auto_892061 ) ) ( not ( = ?auto_892059 ?auto_892062 ) ) ( not ( = ?auto_892059 ?auto_892063 ) ) ( not ( = ?auto_892059 ?auto_892064 ) ) ( not ( = ?auto_892059 ?auto_892065 ) ) ( not ( = ?auto_892060 ?auto_892061 ) ) ( not ( = ?auto_892060 ?auto_892062 ) ) ( not ( = ?auto_892060 ?auto_892063 ) ) ( not ( = ?auto_892060 ?auto_892064 ) ) ( not ( = ?auto_892060 ?auto_892065 ) ) ( not ( = ?auto_892061 ?auto_892062 ) ) ( not ( = ?auto_892061 ?auto_892063 ) ) ( not ( = ?auto_892061 ?auto_892064 ) ) ( not ( = ?auto_892061 ?auto_892065 ) ) ( not ( = ?auto_892062 ?auto_892063 ) ) ( not ( = ?auto_892062 ?auto_892064 ) ) ( not ( = ?auto_892062 ?auto_892065 ) ) ( not ( = ?auto_892063 ?auto_892064 ) ) ( not ( = ?auto_892063 ?auto_892065 ) ) ( not ( = ?auto_892064 ?auto_892065 ) ) ( CLEAR ?auto_892062 ) ( ON ?auto_892063 ?auto_892064 ) ( CLEAR ?auto_892063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_892052 ?auto_892053 ?auto_892054 ?auto_892055 ?auto_892056 ?auto_892057 ?auto_892058 ?auto_892059 ?auto_892060 ?auto_892061 ?auto_892062 ?auto_892063 )
      ( MAKE-13PILE ?auto_892052 ?auto_892053 ?auto_892054 ?auto_892055 ?auto_892056 ?auto_892057 ?auto_892058 ?auto_892059 ?auto_892060 ?auto_892061 ?auto_892062 ?auto_892063 ?auto_892064 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892106 - BLOCK
      ?auto_892107 - BLOCK
      ?auto_892108 - BLOCK
      ?auto_892109 - BLOCK
      ?auto_892110 - BLOCK
      ?auto_892111 - BLOCK
      ?auto_892112 - BLOCK
      ?auto_892113 - BLOCK
      ?auto_892114 - BLOCK
      ?auto_892115 - BLOCK
      ?auto_892116 - BLOCK
      ?auto_892117 - BLOCK
      ?auto_892118 - BLOCK
    )
    :vars
    (
      ?auto_892119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892118 ?auto_892119 ) ( ON-TABLE ?auto_892106 ) ( ON ?auto_892107 ?auto_892106 ) ( ON ?auto_892108 ?auto_892107 ) ( ON ?auto_892109 ?auto_892108 ) ( ON ?auto_892110 ?auto_892109 ) ( ON ?auto_892111 ?auto_892110 ) ( ON ?auto_892112 ?auto_892111 ) ( ON ?auto_892113 ?auto_892112 ) ( ON ?auto_892114 ?auto_892113 ) ( ON ?auto_892115 ?auto_892114 ) ( not ( = ?auto_892106 ?auto_892107 ) ) ( not ( = ?auto_892106 ?auto_892108 ) ) ( not ( = ?auto_892106 ?auto_892109 ) ) ( not ( = ?auto_892106 ?auto_892110 ) ) ( not ( = ?auto_892106 ?auto_892111 ) ) ( not ( = ?auto_892106 ?auto_892112 ) ) ( not ( = ?auto_892106 ?auto_892113 ) ) ( not ( = ?auto_892106 ?auto_892114 ) ) ( not ( = ?auto_892106 ?auto_892115 ) ) ( not ( = ?auto_892106 ?auto_892116 ) ) ( not ( = ?auto_892106 ?auto_892117 ) ) ( not ( = ?auto_892106 ?auto_892118 ) ) ( not ( = ?auto_892106 ?auto_892119 ) ) ( not ( = ?auto_892107 ?auto_892108 ) ) ( not ( = ?auto_892107 ?auto_892109 ) ) ( not ( = ?auto_892107 ?auto_892110 ) ) ( not ( = ?auto_892107 ?auto_892111 ) ) ( not ( = ?auto_892107 ?auto_892112 ) ) ( not ( = ?auto_892107 ?auto_892113 ) ) ( not ( = ?auto_892107 ?auto_892114 ) ) ( not ( = ?auto_892107 ?auto_892115 ) ) ( not ( = ?auto_892107 ?auto_892116 ) ) ( not ( = ?auto_892107 ?auto_892117 ) ) ( not ( = ?auto_892107 ?auto_892118 ) ) ( not ( = ?auto_892107 ?auto_892119 ) ) ( not ( = ?auto_892108 ?auto_892109 ) ) ( not ( = ?auto_892108 ?auto_892110 ) ) ( not ( = ?auto_892108 ?auto_892111 ) ) ( not ( = ?auto_892108 ?auto_892112 ) ) ( not ( = ?auto_892108 ?auto_892113 ) ) ( not ( = ?auto_892108 ?auto_892114 ) ) ( not ( = ?auto_892108 ?auto_892115 ) ) ( not ( = ?auto_892108 ?auto_892116 ) ) ( not ( = ?auto_892108 ?auto_892117 ) ) ( not ( = ?auto_892108 ?auto_892118 ) ) ( not ( = ?auto_892108 ?auto_892119 ) ) ( not ( = ?auto_892109 ?auto_892110 ) ) ( not ( = ?auto_892109 ?auto_892111 ) ) ( not ( = ?auto_892109 ?auto_892112 ) ) ( not ( = ?auto_892109 ?auto_892113 ) ) ( not ( = ?auto_892109 ?auto_892114 ) ) ( not ( = ?auto_892109 ?auto_892115 ) ) ( not ( = ?auto_892109 ?auto_892116 ) ) ( not ( = ?auto_892109 ?auto_892117 ) ) ( not ( = ?auto_892109 ?auto_892118 ) ) ( not ( = ?auto_892109 ?auto_892119 ) ) ( not ( = ?auto_892110 ?auto_892111 ) ) ( not ( = ?auto_892110 ?auto_892112 ) ) ( not ( = ?auto_892110 ?auto_892113 ) ) ( not ( = ?auto_892110 ?auto_892114 ) ) ( not ( = ?auto_892110 ?auto_892115 ) ) ( not ( = ?auto_892110 ?auto_892116 ) ) ( not ( = ?auto_892110 ?auto_892117 ) ) ( not ( = ?auto_892110 ?auto_892118 ) ) ( not ( = ?auto_892110 ?auto_892119 ) ) ( not ( = ?auto_892111 ?auto_892112 ) ) ( not ( = ?auto_892111 ?auto_892113 ) ) ( not ( = ?auto_892111 ?auto_892114 ) ) ( not ( = ?auto_892111 ?auto_892115 ) ) ( not ( = ?auto_892111 ?auto_892116 ) ) ( not ( = ?auto_892111 ?auto_892117 ) ) ( not ( = ?auto_892111 ?auto_892118 ) ) ( not ( = ?auto_892111 ?auto_892119 ) ) ( not ( = ?auto_892112 ?auto_892113 ) ) ( not ( = ?auto_892112 ?auto_892114 ) ) ( not ( = ?auto_892112 ?auto_892115 ) ) ( not ( = ?auto_892112 ?auto_892116 ) ) ( not ( = ?auto_892112 ?auto_892117 ) ) ( not ( = ?auto_892112 ?auto_892118 ) ) ( not ( = ?auto_892112 ?auto_892119 ) ) ( not ( = ?auto_892113 ?auto_892114 ) ) ( not ( = ?auto_892113 ?auto_892115 ) ) ( not ( = ?auto_892113 ?auto_892116 ) ) ( not ( = ?auto_892113 ?auto_892117 ) ) ( not ( = ?auto_892113 ?auto_892118 ) ) ( not ( = ?auto_892113 ?auto_892119 ) ) ( not ( = ?auto_892114 ?auto_892115 ) ) ( not ( = ?auto_892114 ?auto_892116 ) ) ( not ( = ?auto_892114 ?auto_892117 ) ) ( not ( = ?auto_892114 ?auto_892118 ) ) ( not ( = ?auto_892114 ?auto_892119 ) ) ( not ( = ?auto_892115 ?auto_892116 ) ) ( not ( = ?auto_892115 ?auto_892117 ) ) ( not ( = ?auto_892115 ?auto_892118 ) ) ( not ( = ?auto_892115 ?auto_892119 ) ) ( not ( = ?auto_892116 ?auto_892117 ) ) ( not ( = ?auto_892116 ?auto_892118 ) ) ( not ( = ?auto_892116 ?auto_892119 ) ) ( not ( = ?auto_892117 ?auto_892118 ) ) ( not ( = ?auto_892117 ?auto_892119 ) ) ( not ( = ?auto_892118 ?auto_892119 ) ) ( ON ?auto_892117 ?auto_892118 ) ( CLEAR ?auto_892115 ) ( ON ?auto_892116 ?auto_892117 ) ( CLEAR ?auto_892116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_892106 ?auto_892107 ?auto_892108 ?auto_892109 ?auto_892110 ?auto_892111 ?auto_892112 ?auto_892113 ?auto_892114 ?auto_892115 ?auto_892116 )
      ( MAKE-13PILE ?auto_892106 ?auto_892107 ?auto_892108 ?auto_892109 ?auto_892110 ?auto_892111 ?auto_892112 ?auto_892113 ?auto_892114 ?auto_892115 ?auto_892116 ?auto_892117 ?auto_892118 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892160 - BLOCK
      ?auto_892161 - BLOCK
      ?auto_892162 - BLOCK
      ?auto_892163 - BLOCK
      ?auto_892164 - BLOCK
      ?auto_892165 - BLOCK
      ?auto_892166 - BLOCK
      ?auto_892167 - BLOCK
      ?auto_892168 - BLOCK
      ?auto_892169 - BLOCK
      ?auto_892170 - BLOCK
      ?auto_892171 - BLOCK
      ?auto_892172 - BLOCK
    )
    :vars
    (
      ?auto_892173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892172 ?auto_892173 ) ( ON-TABLE ?auto_892160 ) ( ON ?auto_892161 ?auto_892160 ) ( ON ?auto_892162 ?auto_892161 ) ( ON ?auto_892163 ?auto_892162 ) ( ON ?auto_892164 ?auto_892163 ) ( ON ?auto_892165 ?auto_892164 ) ( ON ?auto_892166 ?auto_892165 ) ( ON ?auto_892167 ?auto_892166 ) ( ON ?auto_892168 ?auto_892167 ) ( not ( = ?auto_892160 ?auto_892161 ) ) ( not ( = ?auto_892160 ?auto_892162 ) ) ( not ( = ?auto_892160 ?auto_892163 ) ) ( not ( = ?auto_892160 ?auto_892164 ) ) ( not ( = ?auto_892160 ?auto_892165 ) ) ( not ( = ?auto_892160 ?auto_892166 ) ) ( not ( = ?auto_892160 ?auto_892167 ) ) ( not ( = ?auto_892160 ?auto_892168 ) ) ( not ( = ?auto_892160 ?auto_892169 ) ) ( not ( = ?auto_892160 ?auto_892170 ) ) ( not ( = ?auto_892160 ?auto_892171 ) ) ( not ( = ?auto_892160 ?auto_892172 ) ) ( not ( = ?auto_892160 ?auto_892173 ) ) ( not ( = ?auto_892161 ?auto_892162 ) ) ( not ( = ?auto_892161 ?auto_892163 ) ) ( not ( = ?auto_892161 ?auto_892164 ) ) ( not ( = ?auto_892161 ?auto_892165 ) ) ( not ( = ?auto_892161 ?auto_892166 ) ) ( not ( = ?auto_892161 ?auto_892167 ) ) ( not ( = ?auto_892161 ?auto_892168 ) ) ( not ( = ?auto_892161 ?auto_892169 ) ) ( not ( = ?auto_892161 ?auto_892170 ) ) ( not ( = ?auto_892161 ?auto_892171 ) ) ( not ( = ?auto_892161 ?auto_892172 ) ) ( not ( = ?auto_892161 ?auto_892173 ) ) ( not ( = ?auto_892162 ?auto_892163 ) ) ( not ( = ?auto_892162 ?auto_892164 ) ) ( not ( = ?auto_892162 ?auto_892165 ) ) ( not ( = ?auto_892162 ?auto_892166 ) ) ( not ( = ?auto_892162 ?auto_892167 ) ) ( not ( = ?auto_892162 ?auto_892168 ) ) ( not ( = ?auto_892162 ?auto_892169 ) ) ( not ( = ?auto_892162 ?auto_892170 ) ) ( not ( = ?auto_892162 ?auto_892171 ) ) ( not ( = ?auto_892162 ?auto_892172 ) ) ( not ( = ?auto_892162 ?auto_892173 ) ) ( not ( = ?auto_892163 ?auto_892164 ) ) ( not ( = ?auto_892163 ?auto_892165 ) ) ( not ( = ?auto_892163 ?auto_892166 ) ) ( not ( = ?auto_892163 ?auto_892167 ) ) ( not ( = ?auto_892163 ?auto_892168 ) ) ( not ( = ?auto_892163 ?auto_892169 ) ) ( not ( = ?auto_892163 ?auto_892170 ) ) ( not ( = ?auto_892163 ?auto_892171 ) ) ( not ( = ?auto_892163 ?auto_892172 ) ) ( not ( = ?auto_892163 ?auto_892173 ) ) ( not ( = ?auto_892164 ?auto_892165 ) ) ( not ( = ?auto_892164 ?auto_892166 ) ) ( not ( = ?auto_892164 ?auto_892167 ) ) ( not ( = ?auto_892164 ?auto_892168 ) ) ( not ( = ?auto_892164 ?auto_892169 ) ) ( not ( = ?auto_892164 ?auto_892170 ) ) ( not ( = ?auto_892164 ?auto_892171 ) ) ( not ( = ?auto_892164 ?auto_892172 ) ) ( not ( = ?auto_892164 ?auto_892173 ) ) ( not ( = ?auto_892165 ?auto_892166 ) ) ( not ( = ?auto_892165 ?auto_892167 ) ) ( not ( = ?auto_892165 ?auto_892168 ) ) ( not ( = ?auto_892165 ?auto_892169 ) ) ( not ( = ?auto_892165 ?auto_892170 ) ) ( not ( = ?auto_892165 ?auto_892171 ) ) ( not ( = ?auto_892165 ?auto_892172 ) ) ( not ( = ?auto_892165 ?auto_892173 ) ) ( not ( = ?auto_892166 ?auto_892167 ) ) ( not ( = ?auto_892166 ?auto_892168 ) ) ( not ( = ?auto_892166 ?auto_892169 ) ) ( not ( = ?auto_892166 ?auto_892170 ) ) ( not ( = ?auto_892166 ?auto_892171 ) ) ( not ( = ?auto_892166 ?auto_892172 ) ) ( not ( = ?auto_892166 ?auto_892173 ) ) ( not ( = ?auto_892167 ?auto_892168 ) ) ( not ( = ?auto_892167 ?auto_892169 ) ) ( not ( = ?auto_892167 ?auto_892170 ) ) ( not ( = ?auto_892167 ?auto_892171 ) ) ( not ( = ?auto_892167 ?auto_892172 ) ) ( not ( = ?auto_892167 ?auto_892173 ) ) ( not ( = ?auto_892168 ?auto_892169 ) ) ( not ( = ?auto_892168 ?auto_892170 ) ) ( not ( = ?auto_892168 ?auto_892171 ) ) ( not ( = ?auto_892168 ?auto_892172 ) ) ( not ( = ?auto_892168 ?auto_892173 ) ) ( not ( = ?auto_892169 ?auto_892170 ) ) ( not ( = ?auto_892169 ?auto_892171 ) ) ( not ( = ?auto_892169 ?auto_892172 ) ) ( not ( = ?auto_892169 ?auto_892173 ) ) ( not ( = ?auto_892170 ?auto_892171 ) ) ( not ( = ?auto_892170 ?auto_892172 ) ) ( not ( = ?auto_892170 ?auto_892173 ) ) ( not ( = ?auto_892171 ?auto_892172 ) ) ( not ( = ?auto_892171 ?auto_892173 ) ) ( not ( = ?auto_892172 ?auto_892173 ) ) ( ON ?auto_892171 ?auto_892172 ) ( ON ?auto_892170 ?auto_892171 ) ( CLEAR ?auto_892168 ) ( ON ?auto_892169 ?auto_892170 ) ( CLEAR ?auto_892169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_892160 ?auto_892161 ?auto_892162 ?auto_892163 ?auto_892164 ?auto_892165 ?auto_892166 ?auto_892167 ?auto_892168 ?auto_892169 )
      ( MAKE-13PILE ?auto_892160 ?auto_892161 ?auto_892162 ?auto_892163 ?auto_892164 ?auto_892165 ?auto_892166 ?auto_892167 ?auto_892168 ?auto_892169 ?auto_892170 ?auto_892171 ?auto_892172 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892214 - BLOCK
      ?auto_892215 - BLOCK
      ?auto_892216 - BLOCK
      ?auto_892217 - BLOCK
      ?auto_892218 - BLOCK
      ?auto_892219 - BLOCK
      ?auto_892220 - BLOCK
      ?auto_892221 - BLOCK
      ?auto_892222 - BLOCK
      ?auto_892223 - BLOCK
      ?auto_892224 - BLOCK
      ?auto_892225 - BLOCK
      ?auto_892226 - BLOCK
    )
    :vars
    (
      ?auto_892227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892226 ?auto_892227 ) ( ON-TABLE ?auto_892214 ) ( ON ?auto_892215 ?auto_892214 ) ( ON ?auto_892216 ?auto_892215 ) ( ON ?auto_892217 ?auto_892216 ) ( ON ?auto_892218 ?auto_892217 ) ( ON ?auto_892219 ?auto_892218 ) ( ON ?auto_892220 ?auto_892219 ) ( ON ?auto_892221 ?auto_892220 ) ( not ( = ?auto_892214 ?auto_892215 ) ) ( not ( = ?auto_892214 ?auto_892216 ) ) ( not ( = ?auto_892214 ?auto_892217 ) ) ( not ( = ?auto_892214 ?auto_892218 ) ) ( not ( = ?auto_892214 ?auto_892219 ) ) ( not ( = ?auto_892214 ?auto_892220 ) ) ( not ( = ?auto_892214 ?auto_892221 ) ) ( not ( = ?auto_892214 ?auto_892222 ) ) ( not ( = ?auto_892214 ?auto_892223 ) ) ( not ( = ?auto_892214 ?auto_892224 ) ) ( not ( = ?auto_892214 ?auto_892225 ) ) ( not ( = ?auto_892214 ?auto_892226 ) ) ( not ( = ?auto_892214 ?auto_892227 ) ) ( not ( = ?auto_892215 ?auto_892216 ) ) ( not ( = ?auto_892215 ?auto_892217 ) ) ( not ( = ?auto_892215 ?auto_892218 ) ) ( not ( = ?auto_892215 ?auto_892219 ) ) ( not ( = ?auto_892215 ?auto_892220 ) ) ( not ( = ?auto_892215 ?auto_892221 ) ) ( not ( = ?auto_892215 ?auto_892222 ) ) ( not ( = ?auto_892215 ?auto_892223 ) ) ( not ( = ?auto_892215 ?auto_892224 ) ) ( not ( = ?auto_892215 ?auto_892225 ) ) ( not ( = ?auto_892215 ?auto_892226 ) ) ( not ( = ?auto_892215 ?auto_892227 ) ) ( not ( = ?auto_892216 ?auto_892217 ) ) ( not ( = ?auto_892216 ?auto_892218 ) ) ( not ( = ?auto_892216 ?auto_892219 ) ) ( not ( = ?auto_892216 ?auto_892220 ) ) ( not ( = ?auto_892216 ?auto_892221 ) ) ( not ( = ?auto_892216 ?auto_892222 ) ) ( not ( = ?auto_892216 ?auto_892223 ) ) ( not ( = ?auto_892216 ?auto_892224 ) ) ( not ( = ?auto_892216 ?auto_892225 ) ) ( not ( = ?auto_892216 ?auto_892226 ) ) ( not ( = ?auto_892216 ?auto_892227 ) ) ( not ( = ?auto_892217 ?auto_892218 ) ) ( not ( = ?auto_892217 ?auto_892219 ) ) ( not ( = ?auto_892217 ?auto_892220 ) ) ( not ( = ?auto_892217 ?auto_892221 ) ) ( not ( = ?auto_892217 ?auto_892222 ) ) ( not ( = ?auto_892217 ?auto_892223 ) ) ( not ( = ?auto_892217 ?auto_892224 ) ) ( not ( = ?auto_892217 ?auto_892225 ) ) ( not ( = ?auto_892217 ?auto_892226 ) ) ( not ( = ?auto_892217 ?auto_892227 ) ) ( not ( = ?auto_892218 ?auto_892219 ) ) ( not ( = ?auto_892218 ?auto_892220 ) ) ( not ( = ?auto_892218 ?auto_892221 ) ) ( not ( = ?auto_892218 ?auto_892222 ) ) ( not ( = ?auto_892218 ?auto_892223 ) ) ( not ( = ?auto_892218 ?auto_892224 ) ) ( not ( = ?auto_892218 ?auto_892225 ) ) ( not ( = ?auto_892218 ?auto_892226 ) ) ( not ( = ?auto_892218 ?auto_892227 ) ) ( not ( = ?auto_892219 ?auto_892220 ) ) ( not ( = ?auto_892219 ?auto_892221 ) ) ( not ( = ?auto_892219 ?auto_892222 ) ) ( not ( = ?auto_892219 ?auto_892223 ) ) ( not ( = ?auto_892219 ?auto_892224 ) ) ( not ( = ?auto_892219 ?auto_892225 ) ) ( not ( = ?auto_892219 ?auto_892226 ) ) ( not ( = ?auto_892219 ?auto_892227 ) ) ( not ( = ?auto_892220 ?auto_892221 ) ) ( not ( = ?auto_892220 ?auto_892222 ) ) ( not ( = ?auto_892220 ?auto_892223 ) ) ( not ( = ?auto_892220 ?auto_892224 ) ) ( not ( = ?auto_892220 ?auto_892225 ) ) ( not ( = ?auto_892220 ?auto_892226 ) ) ( not ( = ?auto_892220 ?auto_892227 ) ) ( not ( = ?auto_892221 ?auto_892222 ) ) ( not ( = ?auto_892221 ?auto_892223 ) ) ( not ( = ?auto_892221 ?auto_892224 ) ) ( not ( = ?auto_892221 ?auto_892225 ) ) ( not ( = ?auto_892221 ?auto_892226 ) ) ( not ( = ?auto_892221 ?auto_892227 ) ) ( not ( = ?auto_892222 ?auto_892223 ) ) ( not ( = ?auto_892222 ?auto_892224 ) ) ( not ( = ?auto_892222 ?auto_892225 ) ) ( not ( = ?auto_892222 ?auto_892226 ) ) ( not ( = ?auto_892222 ?auto_892227 ) ) ( not ( = ?auto_892223 ?auto_892224 ) ) ( not ( = ?auto_892223 ?auto_892225 ) ) ( not ( = ?auto_892223 ?auto_892226 ) ) ( not ( = ?auto_892223 ?auto_892227 ) ) ( not ( = ?auto_892224 ?auto_892225 ) ) ( not ( = ?auto_892224 ?auto_892226 ) ) ( not ( = ?auto_892224 ?auto_892227 ) ) ( not ( = ?auto_892225 ?auto_892226 ) ) ( not ( = ?auto_892225 ?auto_892227 ) ) ( not ( = ?auto_892226 ?auto_892227 ) ) ( ON ?auto_892225 ?auto_892226 ) ( ON ?auto_892224 ?auto_892225 ) ( ON ?auto_892223 ?auto_892224 ) ( CLEAR ?auto_892221 ) ( ON ?auto_892222 ?auto_892223 ) ( CLEAR ?auto_892222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_892214 ?auto_892215 ?auto_892216 ?auto_892217 ?auto_892218 ?auto_892219 ?auto_892220 ?auto_892221 ?auto_892222 )
      ( MAKE-13PILE ?auto_892214 ?auto_892215 ?auto_892216 ?auto_892217 ?auto_892218 ?auto_892219 ?auto_892220 ?auto_892221 ?auto_892222 ?auto_892223 ?auto_892224 ?auto_892225 ?auto_892226 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892268 - BLOCK
      ?auto_892269 - BLOCK
      ?auto_892270 - BLOCK
      ?auto_892271 - BLOCK
      ?auto_892272 - BLOCK
      ?auto_892273 - BLOCK
      ?auto_892274 - BLOCK
      ?auto_892275 - BLOCK
      ?auto_892276 - BLOCK
      ?auto_892277 - BLOCK
      ?auto_892278 - BLOCK
      ?auto_892279 - BLOCK
      ?auto_892280 - BLOCK
    )
    :vars
    (
      ?auto_892281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892280 ?auto_892281 ) ( ON-TABLE ?auto_892268 ) ( ON ?auto_892269 ?auto_892268 ) ( ON ?auto_892270 ?auto_892269 ) ( ON ?auto_892271 ?auto_892270 ) ( ON ?auto_892272 ?auto_892271 ) ( ON ?auto_892273 ?auto_892272 ) ( ON ?auto_892274 ?auto_892273 ) ( not ( = ?auto_892268 ?auto_892269 ) ) ( not ( = ?auto_892268 ?auto_892270 ) ) ( not ( = ?auto_892268 ?auto_892271 ) ) ( not ( = ?auto_892268 ?auto_892272 ) ) ( not ( = ?auto_892268 ?auto_892273 ) ) ( not ( = ?auto_892268 ?auto_892274 ) ) ( not ( = ?auto_892268 ?auto_892275 ) ) ( not ( = ?auto_892268 ?auto_892276 ) ) ( not ( = ?auto_892268 ?auto_892277 ) ) ( not ( = ?auto_892268 ?auto_892278 ) ) ( not ( = ?auto_892268 ?auto_892279 ) ) ( not ( = ?auto_892268 ?auto_892280 ) ) ( not ( = ?auto_892268 ?auto_892281 ) ) ( not ( = ?auto_892269 ?auto_892270 ) ) ( not ( = ?auto_892269 ?auto_892271 ) ) ( not ( = ?auto_892269 ?auto_892272 ) ) ( not ( = ?auto_892269 ?auto_892273 ) ) ( not ( = ?auto_892269 ?auto_892274 ) ) ( not ( = ?auto_892269 ?auto_892275 ) ) ( not ( = ?auto_892269 ?auto_892276 ) ) ( not ( = ?auto_892269 ?auto_892277 ) ) ( not ( = ?auto_892269 ?auto_892278 ) ) ( not ( = ?auto_892269 ?auto_892279 ) ) ( not ( = ?auto_892269 ?auto_892280 ) ) ( not ( = ?auto_892269 ?auto_892281 ) ) ( not ( = ?auto_892270 ?auto_892271 ) ) ( not ( = ?auto_892270 ?auto_892272 ) ) ( not ( = ?auto_892270 ?auto_892273 ) ) ( not ( = ?auto_892270 ?auto_892274 ) ) ( not ( = ?auto_892270 ?auto_892275 ) ) ( not ( = ?auto_892270 ?auto_892276 ) ) ( not ( = ?auto_892270 ?auto_892277 ) ) ( not ( = ?auto_892270 ?auto_892278 ) ) ( not ( = ?auto_892270 ?auto_892279 ) ) ( not ( = ?auto_892270 ?auto_892280 ) ) ( not ( = ?auto_892270 ?auto_892281 ) ) ( not ( = ?auto_892271 ?auto_892272 ) ) ( not ( = ?auto_892271 ?auto_892273 ) ) ( not ( = ?auto_892271 ?auto_892274 ) ) ( not ( = ?auto_892271 ?auto_892275 ) ) ( not ( = ?auto_892271 ?auto_892276 ) ) ( not ( = ?auto_892271 ?auto_892277 ) ) ( not ( = ?auto_892271 ?auto_892278 ) ) ( not ( = ?auto_892271 ?auto_892279 ) ) ( not ( = ?auto_892271 ?auto_892280 ) ) ( not ( = ?auto_892271 ?auto_892281 ) ) ( not ( = ?auto_892272 ?auto_892273 ) ) ( not ( = ?auto_892272 ?auto_892274 ) ) ( not ( = ?auto_892272 ?auto_892275 ) ) ( not ( = ?auto_892272 ?auto_892276 ) ) ( not ( = ?auto_892272 ?auto_892277 ) ) ( not ( = ?auto_892272 ?auto_892278 ) ) ( not ( = ?auto_892272 ?auto_892279 ) ) ( not ( = ?auto_892272 ?auto_892280 ) ) ( not ( = ?auto_892272 ?auto_892281 ) ) ( not ( = ?auto_892273 ?auto_892274 ) ) ( not ( = ?auto_892273 ?auto_892275 ) ) ( not ( = ?auto_892273 ?auto_892276 ) ) ( not ( = ?auto_892273 ?auto_892277 ) ) ( not ( = ?auto_892273 ?auto_892278 ) ) ( not ( = ?auto_892273 ?auto_892279 ) ) ( not ( = ?auto_892273 ?auto_892280 ) ) ( not ( = ?auto_892273 ?auto_892281 ) ) ( not ( = ?auto_892274 ?auto_892275 ) ) ( not ( = ?auto_892274 ?auto_892276 ) ) ( not ( = ?auto_892274 ?auto_892277 ) ) ( not ( = ?auto_892274 ?auto_892278 ) ) ( not ( = ?auto_892274 ?auto_892279 ) ) ( not ( = ?auto_892274 ?auto_892280 ) ) ( not ( = ?auto_892274 ?auto_892281 ) ) ( not ( = ?auto_892275 ?auto_892276 ) ) ( not ( = ?auto_892275 ?auto_892277 ) ) ( not ( = ?auto_892275 ?auto_892278 ) ) ( not ( = ?auto_892275 ?auto_892279 ) ) ( not ( = ?auto_892275 ?auto_892280 ) ) ( not ( = ?auto_892275 ?auto_892281 ) ) ( not ( = ?auto_892276 ?auto_892277 ) ) ( not ( = ?auto_892276 ?auto_892278 ) ) ( not ( = ?auto_892276 ?auto_892279 ) ) ( not ( = ?auto_892276 ?auto_892280 ) ) ( not ( = ?auto_892276 ?auto_892281 ) ) ( not ( = ?auto_892277 ?auto_892278 ) ) ( not ( = ?auto_892277 ?auto_892279 ) ) ( not ( = ?auto_892277 ?auto_892280 ) ) ( not ( = ?auto_892277 ?auto_892281 ) ) ( not ( = ?auto_892278 ?auto_892279 ) ) ( not ( = ?auto_892278 ?auto_892280 ) ) ( not ( = ?auto_892278 ?auto_892281 ) ) ( not ( = ?auto_892279 ?auto_892280 ) ) ( not ( = ?auto_892279 ?auto_892281 ) ) ( not ( = ?auto_892280 ?auto_892281 ) ) ( ON ?auto_892279 ?auto_892280 ) ( ON ?auto_892278 ?auto_892279 ) ( ON ?auto_892277 ?auto_892278 ) ( ON ?auto_892276 ?auto_892277 ) ( CLEAR ?auto_892274 ) ( ON ?auto_892275 ?auto_892276 ) ( CLEAR ?auto_892275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_892268 ?auto_892269 ?auto_892270 ?auto_892271 ?auto_892272 ?auto_892273 ?auto_892274 ?auto_892275 )
      ( MAKE-13PILE ?auto_892268 ?auto_892269 ?auto_892270 ?auto_892271 ?auto_892272 ?auto_892273 ?auto_892274 ?auto_892275 ?auto_892276 ?auto_892277 ?auto_892278 ?auto_892279 ?auto_892280 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892322 - BLOCK
      ?auto_892323 - BLOCK
      ?auto_892324 - BLOCK
      ?auto_892325 - BLOCK
      ?auto_892326 - BLOCK
      ?auto_892327 - BLOCK
      ?auto_892328 - BLOCK
      ?auto_892329 - BLOCK
      ?auto_892330 - BLOCK
      ?auto_892331 - BLOCK
      ?auto_892332 - BLOCK
      ?auto_892333 - BLOCK
      ?auto_892334 - BLOCK
    )
    :vars
    (
      ?auto_892335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892334 ?auto_892335 ) ( ON-TABLE ?auto_892322 ) ( ON ?auto_892323 ?auto_892322 ) ( ON ?auto_892324 ?auto_892323 ) ( ON ?auto_892325 ?auto_892324 ) ( ON ?auto_892326 ?auto_892325 ) ( ON ?auto_892327 ?auto_892326 ) ( not ( = ?auto_892322 ?auto_892323 ) ) ( not ( = ?auto_892322 ?auto_892324 ) ) ( not ( = ?auto_892322 ?auto_892325 ) ) ( not ( = ?auto_892322 ?auto_892326 ) ) ( not ( = ?auto_892322 ?auto_892327 ) ) ( not ( = ?auto_892322 ?auto_892328 ) ) ( not ( = ?auto_892322 ?auto_892329 ) ) ( not ( = ?auto_892322 ?auto_892330 ) ) ( not ( = ?auto_892322 ?auto_892331 ) ) ( not ( = ?auto_892322 ?auto_892332 ) ) ( not ( = ?auto_892322 ?auto_892333 ) ) ( not ( = ?auto_892322 ?auto_892334 ) ) ( not ( = ?auto_892322 ?auto_892335 ) ) ( not ( = ?auto_892323 ?auto_892324 ) ) ( not ( = ?auto_892323 ?auto_892325 ) ) ( not ( = ?auto_892323 ?auto_892326 ) ) ( not ( = ?auto_892323 ?auto_892327 ) ) ( not ( = ?auto_892323 ?auto_892328 ) ) ( not ( = ?auto_892323 ?auto_892329 ) ) ( not ( = ?auto_892323 ?auto_892330 ) ) ( not ( = ?auto_892323 ?auto_892331 ) ) ( not ( = ?auto_892323 ?auto_892332 ) ) ( not ( = ?auto_892323 ?auto_892333 ) ) ( not ( = ?auto_892323 ?auto_892334 ) ) ( not ( = ?auto_892323 ?auto_892335 ) ) ( not ( = ?auto_892324 ?auto_892325 ) ) ( not ( = ?auto_892324 ?auto_892326 ) ) ( not ( = ?auto_892324 ?auto_892327 ) ) ( not ( = ?auto_892324 ?auto_892328 ) ) ( not ( = ?auto_892324 ?auto_892329 ) ) ( not ( = ?auto_892324 ?auto_892330 ) ) ( not ( = ?auto_892324 ?auto_892331 ) ) ( not ( = ?auto_892324 ?auto_892332 ) ) ( not ( = ?auto_892324 ?auto_892333 ) ) ( not ( = ?auto_892324 ?auto_892334 ) ) ( not ( = ?auto_892324 ?auto_892335 ) ) ( not ( = ?auto_892325 ?auto_892326 ) ) ( not ( = ?auto_892325 ?auto_892327 ) ) ( not ( = ?auto_892325 ?auto_892328 ) ) ( not ( = ?auto_892325 ?auto_892329 ) ) ( not ( = ?auto_892325 ?auto_892330 ) ) ( not ( = ?auto_892325 ?auto_892331 ) ) ( not ( = ?auto_892325 ?auto_892332 ) ) ( not ( = ?auto_892325 ?auto_892333 ) ) ( not ( = ?auto_892325 ?auto_892334 ) ) ( not ( = ?auto_892325 ?auto_892335 ) ) ( not ( = ?auto_892326 ?auto_892327 ) ) ( not ( = ?auto_892326 ?auto_892328 ) ) ( not ( = ?auto_892326 ?auto_892329 ) ) ( not ( = ?auto_892326 ?auto_892330 ) ) ( not ( = ?auto_892326 ?auto_892331 ) ) ( not ( = ?auto_892326 ?auto_892332 ) ) ( not ( = ?auto_892326 ?auto_892333 ) ) ( not ( = ?auto_892326 ?auto_892334 ) ) ( not ( = ?auto_892326 ?auto_892335 ) ) ( not ( = ?auto_892327 ?auto_892328 ) ) ( not ( = ?auto_892327 ?auto_892329 ) ) ( not ( = ?auto_892327 ?auto_892330 ) ) ( not ( = ?auto_892327 ?auto_892331 ) ) ( not ( = ?auto_892327 ?auto_892332 ) ) ( not ( = ?auto_892327 ?auto_892333 ) ) ( not ( = ?auto_892327 ?auto_892334 ) ) ( not ( = ?auto_892327 ?auto_892335 ) ) ( not ( = ?auto_892328 ?auto_892329 ) ) ( not ( = ?auto_892328 ?auto_892330 ) ) ( not ( = ?auto_892328 ?auto_892331 ) ) ( not ( = ?auto_892328 ?auto_892332 ) ) ( not ( = ?auto_892328 ?auto_892333 ) ) ( not ( = ?auto_892328 ?auto_892334 ) ) ( not ( = ?auto_892328 ?auto_892335 ) ) ( not ( = ?auto_892329 ?auto_892330 ) ) ( not ( = ?auto_892329 ?auto_892331 ) ) ( not ( = ?auto_892329 ?auto_892332 ) ) ( not ( = ?auto_892329 ?auto_892333 ) ) ( not ( = ?auto_892329 ?auto_892334 ) ) ( not ( = ?auto_892329 ?auto_892335 ) ) ( not ( = ?auto_892330 ?auto_892331 ) ) ( not ( = ?auto_892330 ?auto_892332 ) ) ( not ( = ?auto_892330 ?auto_892333 ) ) ( not ( = ?auto_892330 ?auto_892334 ) ) ( not ( = ?auto_892330 ?auto_892335 ) ) ( not ( = ?auto_892331 ?auto_892332 ) ) ( not ( = ?auto_892331 ?auto_892333 ) ) ( not ( = ?auto_892331 ?auto_892334 ) ) ( not ( = ?auto_892331 ?auto_892335 ) ) ( not ( = ?auto_892332 ?auto_892333 ) ) ( not ( = ?auto_892332 ?auto_892334 ) ) ( not ( = ?auto_892332 ?auto_892335 ) ) ( not ( = ?auto_892333 ?auto_892334 ) ) ( not ( = ?auto_892333 ?auto_892335 ) ) ( not ( = ?auto_892334 ?auto_892335 ) ) ( ON ?auto_892333 ?auto_892334 ) ( ON ?auto_892332 ?auto_892333 ) ( ON ?auto_892331 ?auto_892332 ) ( ON ?auto_892330 ?auto_892331 ) ( ON ?auto_892329 ?auto_892330 ) ( CLEAR ?auto_892327 ) ( ON ?auto_892328 ?auto_892329 ) ( CLEAR ?auto_892328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_892322 ?auto_892323 ?auto_892324 ?auto_892325 ?auto_892326 ?auto_892327 ?auto_892328 )
      ( MAKE-13PILE ?auto_892322 ?auto_892323 ?auto_892324 ?auto_892325 ?auto_892326 ?auto_892327 ?auto_892328 ?auto_892329 ?auto_892330 ?auto_892331 ?auto_892332 ?auto_892333 ?auto_892334 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892376 - BLOCK
      ?auto_892377 - BLOCK
      ?auto_892378 - BLOCK
      ?auto_892379 - BLOCK
      ?auto_892380 - BLOCK
      ?auto_892381 - BLOCK
      ?auto_892382 - BLOCK
      ?auto_892383 - BLOCK
      ?auto_892384 - BLOCK
      ?auto_892385 - BLOCK
      ?auto_892386 - BLOCK
      ?auto_892387 - BLOCK
      ?auto_892388 - BLOCK
    )
    :vars
    (
      ?auto_892389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892388 ?auto_892389 ) ( ON-TABLE ?auto_892376 ) ( ON ?auto_892377 ?auto_892376 ) ( ON ?auto_892378 ?auto_892377 ) ( ON ?auto_892379 ?auto_892378 ) ( ON ?auto_892380 ?auto_892379 ) ( not ( = ?auto_892376 ?auto_892377 ) ) ( not ( = ?auto_892376 ?auto_892378 ) ) ( not ( = ?auto_892376 ?auto_892379 ) ) ( not ( = ?auto_892376 ?auto_892380 ) ) ( not ( = ?auto_892376 ?auto_892381 ) ) ( not ( = ?auto_892376 ?auto_892382 ) ) ( not ( = ?auto_892376 ?auto_892383 ) ) ( not ( = ?auto_892376 ?auto_892384 ) ) ( not ( = ?auto_892376 ?auto_892385 ) ) ( not ( = ?auto_892376 ?auto_892386 ) ) ( not ( = ?auto_892376 ?auto_892387 ) ) ( not ( = ?auto_892376 ?auto_892388 ) ) ( not ( = ?auto_892376 ?auto_892389 ) ) ( not ( = ?auto_892377 ?auto_892378 ) ) ( not ( = ?auto_892377 ?auto_892379 ) ) ( not ( = ?auto_892377 ?auto_892380 ) ) ( not ( = ?auto_892377 ?auto_892381 ) ) ( not ( = ?auto_892377 ?auto_892382 ) ) ( not ( = ?auto_892377 ?auto_892383 ) ) ( not ( = ?auto_892377 ?auto_892384 ) ) ( not ( = ?auto_892377 ?auto_892385 ) ) ( not ( = ?auto_892377 ?auto_892386 ) ) ( not ( = ?auto_892377 ?auto_892387 ) ) ( not ( = ?auto_892377 ?auto_892388 ) ) ( not ( = ?auto_892377 ?auto_892389 ) ) ( not ( = ?auto_892378 ?auto_892379 ) ) ( not ( = ?auto_892378 ?auto_892380 ) ) ( not ( = ?auto_892378 ?auto_892381 ) ) ( not ( = ?auto_892378 ?auto_892382 ) ) ( not ( = ?auto_892378 ?auto_892383 ) ) ( not ( = ?auto_892378 ?auto_892384 ) ) ( not ( = ?auto_892378 ?auto_892385 ) ) ( not ( = ?auto_892378 ?auto_892386 ) ) ( not ( = ?auto_892378 ?auto_892387 ) ) ( not ( = ?auto_892378 ?auto_892388 ) ) ( not ( = ?auto_892378 ?auto_892389 ) ) ( not ( = ?auto_892379 ?auto_892380 ) ) ( not ( = ?auto_892379 ?auto_892381 ) ) ( not ( = ?auto_892379 ?auto_892382 ) ) ( not ( = ?auto_892379 ?auto_892383 ) ) ( not ( = ?auto_892379 ?auto_892384 ) ) ( not ( = ?auto_892379 ?auto_892385 ) ) ( not ( = ?auto_892379 ?auto_892386 ) ) ( not ( = ?auto_892379 ?auto_892387 ) ) ( not ( = ?auto_892379 ?auto_892388 ) ) ( not ( = ?auto_892379 ?auto_892389 ) ) ( not ( = ?auto_892380 ?auto_892381 ) ) ( not ( = ?auto_892380 ?auto_892382 ) ) ( not ( = ?auto_892380 ?auto_892383 ) ) ( not ( = ?auto_892380 ?auto_892384 ) ) ( not ( = ?auto_892380 ?auto_892385 ) ) ( not ( = ?auto_892380 ?auto_892386 ) ) ( not ( = ?auto_892380 ?auto_892387 ) ) ( not ( = ?auto_892380 ?auto_892388 ) ) ( not ( = ?auto_892380 ?auto_892389 ) ) ( not ( = ?auto_892381 ?auto_892382 ) ) ( not ( = ?auto_892381 ?auto_892383 ) ) ( not ( = ?auto_892381 ?auto_892384 ) ) ( not ( = ?auto_892381 ?auto_892385 ) ) ( not ( = ?auto_892381 ?auto_892386 ) ) ( not ( = ?auto_892381 ?auto_892387 ) ) ( not ( = ?auto_892381 ?auto_892388 ) ) ( not ( = ?auto_892381 ?auto_892389 ) ) ( not ( = ?auto_892382 ?auto_892383 ) ) ( not ( = ?auto_892382 ?auto_892384 ) ) ( not ( = ?auto_892382 ?auto_892385 ) ) ( not ( = ?auto_892382 ?auto_892386 ) ) ( not ( = ?auto_892382 ?auto_892387 ) ) ( not ( = ?auto_892382 ?auto_892388 ) ) ( not ( = ?auto_892382 ?auto_892389 ) ) ( not ( = ?auto_892383 ?auto_892384 ) ) ( not ( = ?auto_892383 ?auto_892385 ) ) ( not ( = ?auto_892383 ?auto_892386 ) ) ( not ( = ?auto_892383 ?auto_892387 ) ) ( not ( = ?auto_892383 ?auto_892388 ) ) ( not ( = ?auto_892383 ?auto_892389 ) ) ( not ( = ?auto_892384 ?auto_892385 ) ) ( not ( = ?auto_892384 ?auto_892386 ) ) ( not ( = ?auto_892384 ?auto_892387 ) ) ( not ( = ?auto_892384 ?auto_892388 ) ) ( not ( = ?auto_892384 ?auto_892389 ) ) ( not ( = ?auto_892385 ?auto_892386 ) ) ( not ( = ?auto_892385 ?auto_892387 ) ) ( not ( = ?auto_892385 ?auto_892388 ) ) ( not ( = ?auto_892385 ?auto_892389 ) ) ( not ( = ?auto_892386 ?auto_892387 ) ) ( not ( = ?auto_892386 ?auto_892388 ) ) ( not ( = ?auto_892386 ?auto_892389 ) ) ( not ( = ?auto_892387 ?auto_892388 ) ) ( not ( = ?auto_892387 ?auto_892389 ) ) ( not ( = ?auto_892388 ?auto_892389 ) ) ( ON ?auto_892387 ?auto_892388 ) ( ON ?auto_892386 ?auto_892387 ) ( ON ?auto_892385 ?auto_892386 ) ( ON ?auto_892384 ?auto_892385 ) ( ON ?auto_892383 ?auto_892384 ) ( ON ?auto_892382 ?auto_892383 ) ( CLEAR ?auto_892380 ) ( ON ?auto_892381 ?auto_892382 ) ( CLEAR ?auto_892381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_892376 ?auto_892377 ?auto_892378 ?auto_892379 ?auto_892380 ?auto_892381 )
      ( MAKE-13PILE ?auto_892376 ?auto_892377 ?auto_892378 ?auto_892379 ?auto_892380 ?auto_892381 ?auto_892382 ?auto_892383 ?auto_892384 ?auto_892385 ?auto_892386 ?auto_892387 ?auto_892388 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892430 - BLOCK
      ?auto_892431 - BLOCK
      ?auto_892432 - BLOCK
      ?auto_892433 - BLOCK
      ?auto_892434 - BLOCK
      ?auto_892435 - BLOCK
      ?auto_892436 - BLOCK
      ?auto_892437 - BLOCK
      ?auto_892438 - BLOCK
      ?auto_892439 - BLOCK
      ?auto_892440 - BLOCK
      ?auto_892441 - BLOCK
      ?auto_892442 - BLOCK
    )
    :vars
    (
      ?auto_892443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892442 ?auto_892443 ) ( ON-TABLE ?auto_892430 ) ( ON ?auto_892431 ?auto_892430 ) ( ON ?auto_892432 ?auto_892431 ) ( ON ?auto_892433 ?auto_892432 ) ( not ( = ?auto_892430 ?auto_892431 ) ) ( not ( = ?auto_892430 ?auto_892432 ) ) ( not ( = ?auto_892430 ?auto_892433 ) ) ( not ( = ?auto_892430 ?auto_892434 ) ) ( not ( = ?auto_892430 ?auto_892435 ) ) ( not ( = ?auto_892430 ?auto_892436 ) ) ( not ( = ?auto_892430 ?auto_892437 ) ) ( not ( = ?auto_892430 ?auto_892438 ) ) ( not ( = ?auto_892430 ?auto_892439 ) ) ( not ( = ?auto_892430 ?auto_892440 ) ) ( not ( = ?auto_892430 ?auto_892441 ) ) ( not ( = ?auto_892430 ?auto_892442 ) ) ( not ( = ?auto_892430 ?auto_892443 ) ) ( not ( = ?auto_892431 ?auto_892432 ) ) ( not ( = ?auto_892431 ?auto_892433 ) ) ( not ( = ?auto_892431 ?auto_892434 ) ) ( not ( = ?auto_892431 ?auto_892435 ) ) ( not ( = ?auto_892431 ?auto_892436 ) ) ( not ( = ?auto_892431 ?auto_892437 ) ) ( not ( = ?auto_892431 ?auto_892438 ) ) ( not ( = ?auto_892431 ?auto_892439 ) ) ( not ( = ?auto_892431 ?auto_892440 ) ) ( not ( = ?auto_892431 ?auto_892441 ) ) ( not ( = ?auto_892431 ?auto_892442 ) ) ( not ( = ?auto_892431 ?auto_892443 ) ) ( not ( = ?auto_892432 ?auto_892433 ) ) ( not ( = ?auto_892432 ?auto_892434 ) ) ( not ( = ?auto_892432 ?auto_892435 ) ) ( not ( = ?auto_892432 ?auto_892436 ) ) ( not ( = ?auto_892432 ?auto_892437 ) ) ( not ( = ?auto_892432 ?auto_892438 ) ) ( not ( = ?auto_892432 ?auto_892439 ) ) ( not ( = ?auto_892432 ?auto_892440 ) ) ( not ( = ?auto_892432 ?auto_892441 ) ) ( not ( = ?auto_892432 ?auto_892442 ) ) ( not ( = ?auto_892432 ?auto_892443 ) ) ( not ( = ?auto_892433 ?auto_892434 ) ) ( not ( = ?auto_892433 ?auto_892435 ) ) ( not ( = ?auto_892433 ?auto_892436 ) ) ( not ( = ?auto_892433 ?auto_892437 ) ) ( not ( = ?auto_892433 ?auto_892438 ) ) ( not ( = ?auto_892433 ?auto_892439 ) ) ( not ( = ?auto_892433 ?auto_892440 ) ) ( not ( = ?auto_892433 ?auto_892441 ) ) ( not ( = ?auto_892433 ?auto_892442 ) ) ( not ( = ?auto_892433 ?auto_892443 ) ) ( not ( = ?auto_892434 ?auto_892435 ) ) ( not ( = ?auto_892434 ?auto_892436 ) ) ( not ( = ?auto_892434 ?auto_892437 ) ) ( not ( = ?auto_892434 ?auto_892438 ) ) ( not ( = ?auto_892434 ?auto_892439 ) ) ( not ( = ?auto_892434 ?auto_892440 ) ) ( not ( = ?auto_892434 ?auto_892441 ) ) ( not ( = ?auto_892434 ?auto_892442 ) ) ( not ( = ?auto_892434 ?auto_892443 ) ) ( not ( = ?auto_892435 ?auto_892436 ) ) ( not ( = ?auto_892435 ?auto_892437 ) ) ( not ( = ?auto_892435 ?auto_892438 ) ) ( not ( = ?auto_892435 ?auto_892439 ) ) ( not ( = ?auto_892435 ?auto_892440 ) ) ( not ( = ?auto_892435 ?auto_892441 ) ) ( not ( = ?auto_892435 ?auto_892442 ) ) ( not ( = ?auto_892435 ?auto_892443 ) ) ( not ( = ?auto_892436 ?auto_892437 ) ) ( not ( = ?auto_892436 ?auto_892438 ) ) ( not ( = ?auto_892436 ?auto_892439 ) ) ( not ( = ?auto_892436 ?auto_892440 ) ) ( not ( = ?auto_892436 ?auto_892441 ) ) ( not ( = ?auto_892436 ?auto_892442 ) ) ( not ( = ?auto_892436 ?auto_892443 ) ) ( not ( = ?auto_892437 ?auto_892438 ) ) ( not ( = ?auto_892437 ?auto_892439 ) ) ( not ( = ?auto_892437 ?auto_892440 ) ) ( not ( = ?auto_892437 ?auto_892441 ) ) ( not ( = ?auto_892437 ?auto_892442 ) ) ( not ( = ?auto_892437 ?auto_892443 ) ) ( not ( = ?auto_892438 ?auto_892439 ) ) ( not ( = ?auto_892438 ?auto_892440 ) ) ( not ( = ?auto_892438 ?auto_892441 ) ) ( not ( = ?auto_892438 ?auto_892442 ) ) ( not ( = ?auto_892438 ?auto_892443 ) ) ( not ( = ?auto_892439 ?auto_892440 ) ) ( not ( = ?auto_892439 ?auto_892441 ) ) ( not ( = ?auto_892439 ?auto_892442 ) ) ( not ( = ?auto_892439 ?auto_892443 ) ) ( not ( = ?auto_892440 ?auto_892441 ) ) ( not ( = ?auto_892440 ?auto_892442 ) ) ( not ( = ?auto_892440 ?auto_892443 ) ) ( not ( = ?auto_892441 ?auto_892442 ) ) ( not ( = ?auto_892441 ?auto_892443 ) ) ( not ( = ?auto_892442 ?auto_892443 ) ) ( ON ?auto_892441 ?auto_892442 ) ( ON ?auto_892440 ?auto_892441 ) ( ON ?auto_892439 ?auto_892440 ) ( ON ?auto_892438 ?auto_892439 ) ( ON ?auto_892437 ?auto_892438 ) ( ON ?auto_892436 ?auto_892437 ) ( ON ?auto_892435 ?auto_892436 ) ( CLEAR ?auto_892433 ) ( ON ?auto_892434 ?auto_892435 ) ( CLEAR ?auto_892434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_892430 ?auto_892431 ?auto_892432 ?auto_892433 ?auto_892434 )
      ( MAKE-13PILE ?auto_892430 ?auto_892431 ?auto_892432 ?auto_892433 ?auto_892434 ?auto_892435 ?auto_892436 ?auto_892437 ?auto_892438 ?auto_892439 ?auto_892440 ?auto_892441 ?auto_892442 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892484 - BLOCK
      ?auto_892485 - BLOCK
      ?auto_892486 - BLOCK
      ?auto_892487 - BLOCK
      ?auto_892488 - BLOCK
      ?auto_892489 - BLOCK
      ?auto_892490 - BLOCK
      ?auto_892491 - BLOCK
      ?auto_892492 - BLOCK
      ?auto_892493 - BLOCK
      ?auto_892494 - BLOCK
      ?auto_892495 - BLOCK
      ?auto_892496 - BLOCK
    )
    :vars
    (
      ?auto_892497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892496 ?auto_892497 ) ( ON-TABLE ?auto_892484 ) ( ON ?auto_892485 ?auto_892484 ) ( ON ?auto_892486 ?auto_892485 ) ( not ( = ?auto_892484 ?auto_892485 ) ) ( not ( = ?auto_892484 ?auto_892486 ) ) ( not ( = ?auto_892484 ?auto_892487 ) ) ( not ( = ?auto_892484 ?auto_892488 ) ) ( not ( = ?auto_892484 ?auto_892489 ) ) ( not ( = ?auto_892484 ?auto_892490 ) ) ( not ( = ?auto_892484 ?auto_892491 ) ) ( not ( = ?auto_892484 ?auto_892492 ) ) ( not ( = ?auto_892484 ?auto_892493 ) ) ( not ( = ?auto_892484 ?auto_892494 ) ) ( not ( = ?auto_892484 ?auto_892495 ) ) ( not ( = ?auto_892484 ?auto_892496 ) ) ( not ( = ?auto_892484 ?auto_892497 ) ) ( not ( = ?auto_892485 ?auto_892486 ) ) ( not ( = ?auto_892485 ?auto_892487 ) ) ( not ( = ?auto_892485 ?auto_892488 ) ) ( not ( = ?auto_892485 ?auto_892489 ) ) ( not ( = ?auto_892485 ?auto_892490 ) ) ( not ( = ?auto_892485 ?auto_892491 ) ) ( not ( = ?auto_892485 ?auto_892492 ) ) ( not ( = ?auto_892485 ?auto_892493 ) ) ( not ( = ?auto_892485 ?auto_892494 ) ) ( not ( = ?auto_892485 ?auto_892495 ) ) ( not ( = ?auto_892485 ?auto_892496 ) ) ( not ( = ?auto_892485 ?auto_892497 ) ) ( not ( = ?auto_892486 ?auto_892487 ) ) ( not ( = ?auto_892486 ?auto_892488 ) ) ( not ( = ?auto_892486 ?auto_892489 ) ) ( not ( = ?auto_892486 ?auto_892490 ) ) ( not ( = ?auto_892486 ?auto_892491 ) ) ( not ( = ?auto_892486 ?auto_892492 ) ) ( not ( = ?auto_892486 ?auto_892493 ) ) ( not ( = ?auto_892486 ?auto_892494 ) ) ( not ( = ?auto_892486 ?auto_892495 ) ) ( not ( = ?auto_892486 ?auto_892496 ) ) ( not ( = ?auto_892486 ?auto_892497 ) ) ( not ( = ?auto_892487 ?auto_892488 ) ) ( not ( = ?auto_892487 ?auto_892489 ) ) ( not ( = ?auto_892487 ?auto_892490 ) ) ( not ( = ?auto_892487 ?auto_892491 ) ) ( not ( = ?auto_892487 ?auto_892492 ) ) ( not ( = ?auto_892487 ?auto_892493 ) ) ( not ( = ?auto_892487 ?auto_892494 ) ) ( not ( = ?auto_892487 ?auto_892495 ) ) ( not ( = ?auto_892487 ?auto_892496 ) ) ( not ( = ?auto_892487 ?auto_892497 ) ) ( not ( = ?auto_892488 ?auto_892489 ) ) ( not ( = ?auto_892488 ?auto_892490 ) ) ( not ( = ?auto_892488 ?auto_892491 ) ) ( not ( = ?auto_892488 ?auto_892492 ) ) ( not ( = ?auto_892488 ?auto_892493 ) ) ( not ( = ?auto_892488 ?auto_892494 ) ) ( not ( = ?auto_892488 ?auto_892495 ) ) ( not ( = ?auto_892488 ?auto_892496 ) ) ( not ( = ?auto_892488 ?auto_892497 ) ) ( not ( = ?auto_892489 ?auto_892490 ) ) ( not ( = ?auto_892489 ?auto_892491 ) ) ( not ( = ?auto_892489 ?auto_892492 ) ) ( not ( = ?auto_892489 ?auto_892493 ) ) ( not ( = ?auto_892489 ?auto_892494 ) ) ( not ( = ?auto_892489 ?auto_892495 ) ) ( not ( = ?auto_892489 ?auto_892496 ) ) ( not ( = ?auto_892489 ?auto_892497 ) ) ( not ( = ?auto_892490 ?auto_892491 ) ) ( not ( = ?auto_892490 ?auto_892492 ) ) ( not ( = ?auto_892490 ?auto_892493 ) ) ( not ( = ?auto_892490 ?auto_892494 ) ) ( not ( = ?auto_892490 ?auto_892495 ) ) ( not ( = ?auto_892490 ?auto_892496 ) ) ( not ( = ?auto_892490 ?auto_892497 ) ) ( not ( = ?auto_892491 ?auto_892492 ) ) ( not ( = ?auto_892491 ?auto_892493 ) ) ( not ( = ?auto_892491 ?auto_892494 ) ) ( not ( = ?auto_892491 ?auto_892495 ) ) ( not ( = ?auto_892491 ?auto_892496 ) ) ( not ( = ?auto_892491 ?auto_892497 ) ) ( not ( = ?auto_892492 ?auto_892493 ) ) ( not ( = ?auto_892492 ?auto_892494 ) ) ( not ( = ?auto_892492 ?auto_892495 ) ) ( not ( = ?auto_892492 ?auto_892496 ) ) ( not ( = ?auto_892492 ?auto_892497 ) ) ( not ( = ?auto_892493 ?auto_892494 ) ) ( not ( = ?auto_892493 ?auto_892495 ) ) ( not ( = ?auto_892493 ?auto_892496 ) ) ( not ( = ?auto_892493 ?auto_892497 ) ) ( not ( = ?auto_892494 ?auto_892495 ) ) ( not ( = ?auto_892494 ?auto_892496 ) ) ( not ( = ?auto_892494 ?auto_892497 ) ) ( not ( = ?auto_892495 ?auto_892496 ) ) ( not ( = ?auto_892495 ?auto_892497 ) ) ( not ( = ?auto_892496 ?auto_892497 ) ) ( ON ?auto_892495 ?auto_892496 ) ( ON ?auto_892494 ?auto_892495 ) ( ON ?auto_892493 ?auto_892494 ) ( ON ?auto_892492 ?auto_892493 ) ( ON ?auto_892491 ?auto_892492 ) ( ON ?auto_892490 ?auto_892491 ) ( ON ?auto_892489 ?auto_892490 ) ( ON ?auto_892488 ?auto_892489 ) ( CLEAR ?auto_892486 ) ( ON ?auto_892487 ?auto_892488 ) ( CLEAR ?auto_892487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_892484 ?auto_892485 ?auto_892486 ?auto_892487 )
      ( MAKE-13PILE ?auto_892484 ?auto_892485 ?auto_892486 ?auto_892487 ?auto_892488 ?auto_892489 ?auto_892490 ?auto_892491 ?auto_892492 ?auto_892493 ?auto_892494 ?auto_892495 ?auto_892496 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892538 - BLOCK
      ?auto_892539 - BLOCK
      ?auto_892540 - BLOCK
      ?auto_892541 - BLOCK
      ?auto_892542 - BLOCK
      ?auto_892543 - BLOCK
      ?auto_892544 - BLOCK
      ?auto_892545 - BLOCK
      ?auto_892546 - BLOCK
      ?auto_892547 - BLOCK
      ?auto_892548 - BLOCK
      ?auto_892549 - BLOCK
      ?auto_892550 - BLOCK
    )
    :vars
    (
      ?auto_892551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892550 ?auto_892551 ) ( ON-TABLE ?auto_892538 ) ( ON ?auto_892539 ?auto_892538 ) ( not ( = ?auto_892538 ?auto_892539 ) ) ( not ( = ?auto_892538 ?auto_892540 ) ) ( not ( = ?auto_892538 ?auto_892541 ) ) ( not ( = ?auto_892538 ?auto_892542 ) ) ( not ( = ?auto_892538 ?auto_892543 ) ) ( not ( = ?auto_892538 ?auto_892544 ) ) ( not ( = ?auto_892538 ?auto_892545 ) ) ( not ( = ?auto_892538 ?auto_892546 ) ) ( not ( = ?auto_892538 ?auto_892547 ) ) ( not ( = ?auto_892538 ?auto_892548 ) ) ( not ( = ?auto_892538 ?auto_892549 ) ) ( not ( = ?auto_892538 ?auto_892550 ) ) ( not ( = ?auto_892538 ?auto_892551 ) ) ( not ( = ?auto_892539 ?auto_892540 ) ) ( not ( = ?auto_892539 ?auto_892541 ) ) ( not ( = ?auto_892539 ?auto_892542 ) ) ( not ( = ?auto_892539 ?auto_892543 ) ) ( not ( = ?auto_892539 ?auto_892544 ) ) ( not ( = ?auto_892539 ?auto_892545 ) ) ( not ( = ?auto_892539 ?auto_892546 ) ) ( not ( = ?auto_892539 ?auto_892547 ) ) ( not ( = ?auto_892539 ?auto_892548 ) ) ( not ( = ?auto_892539 ?auto_892549 ) ) ( not ( = ?auto_892539 ?auto_892550 ) ) ( not ( = ?auto_892539 ?auto_892551 ) ) ( not ( = ?auto_892540 ?auto_892541 ) ) ( not ( = ?auto_892540 ?auto_892542 ) ) ( not ( = ?auto_892540 ?auto_892543 ) ) ( not ( = ?auto_892540 ?auto_892544 ) ) ( not ( = ?auto_892540 ?auto_892545 ) ) ( not ( = ?auto_892540 ?auto_892546 ) ) ( not ( = ?auto_892540 ?auto_892547 ) ) ( not ( = ?auto_892540 ?auto_892548 ) ) ( not ( = ?auto_892540 ?auto_892549 ) ) ( not ( = ?auto_892540 ?auto_892550 ) ) ( not ( = ?auto_892540 ?auto_892551 ) ) ( not ( = ?auto_892541 ?auto_892542 ) ) ( not ( = ?auto_892541 ?auto_892543 ) ) ( not ( = ?auto_892541 ?auto_892544 ) ) ( not ( = ?auto_892541 ?auto_892545 ) ) ( not ( = ?auto_892541 ?auto_892546 ) ) ( not ( = ?auto_892541 ?auto_892547 ) ) ( not ( = ?auto_892541 ?auto_892548 ) ) ( not ( = ?auto_892541 ?auto_892549 ) ) ( not ( = ?auto_892541 ?auto_892550 ) ) ( not ( = ?auto_892541 ?auto_892551 ) ) ( not ( = ?auto_892542 ?auto_892543 ) ) ( not ( = ?auto_892542 ?auto_892544 ) ) ( not ( = ?auto_892542 ?auto_892545 ) ) ( not ( = ?auto_892542 ?auto_892546 ) ) ( not ( = ?auto_892542 ?auto_892547 ) ) ( not ( = ?auto_892542 ?auto_892548 ) ) ( not ( = ?auto_892542 ?auto_892549 ) ) ( not ( = ?auto_892542 ?auto_892550 ) ) ( not ( = ?auto_892542 ?auto_892551 ) ) ( not ( = ?auto_892543 ?auto_892544 ) ) ( not ( = ?auto_892543 ?auto_892545 ) ) ( not ( = ?auto_892543 ?auto_892546 ) ) ( not ( = ?auto_892543 ?auto_892547 ) ) ( not ( = ?auto_892543 ?auto_892548 ) ) ( not ( = ?auto_892543 ?auto_892549 ) ) ( not ( = ?auto_892543 ?auto_892550 ) ) ( not ( = ?auto_892543 ?auto_892551 ) ) ( not ( = ?auto_892544 ?auto_892545 ) ) ( not ( = ?auto_892544 ?auto_892546 ) ) ( not ( = ?auto_892544 ?auto_892547 ) ) ( not ( = ?auto_892544 ?auto_892548 ) ) ( not ( = ?auto_892544 ?auto_892549 ) ) ( not ( = ?auto_892544 ?auto_892550 ) ) ( not ( = ?auto_892544 ?auto_892551 ) ) ( not ( = ?auto_892545 ?auto_892546 ) ) ( not ( = ?auto_892545 ?auto_892547 ) ) ( not ( = ?auto_892545 ?auto_892548 ) ) ( not ( = ?auto_892545 ?auto_892549 ) ) ( not ( = ?auto_892545 ?auto_892550 ) ) ( not ( = ?auto_892545 ?auto_892551 ) ) ( not ( = ?auto_892546 ?auto_892547 ) ) ( not ( = ?auto_892546 ?auto_892548 ) ) ( not ( = ?auto_892546 ?auto_892549 ) ) ( not ( = ?auto_892546 ?auto_892550 ) ) ( not ( = ?auto_892546 ?auto_892551 ) ) ( not ( = ?auto_892547 ?auto_892548 ) ) ( not ( = ?auto_892547 ?auto_892549 ) ) ( not ( = ?auto_892547 ?auto_892550 ) ) ( not ( = ?auto_892547 ?auto_892551 ) ) ( not ( = ?auto_892548 ?auto_892549 ) ) ( not ( = ?auto_892548 ?auto_892550 ) ) ( not ( = ?auto_892548 ?auto_892551 ) ) ( not ( = ?auto_892549 ?auto_892550 ) ) ( not ( = ?auto_892549 ?auto_892551 ) ) ( not ( = ?auto_892550 ?auto_892551 ) ) ( ON ?auto_892549 ?auto_892550 ) ( ON ?auto_892548 ?auto_892549 ) ( ON ?auto_892547 ?auto_892548 ) ( ON ?auto_892546 ?auto_892547 ) ( ON ?auto_892545 ?auto_892546 ) ( ON ?auto_892544 ?auto_892545 ) ( ON ?auto_892543 ?auto_892544 ) ( ON ?auto_892542 ?auto_892543 ) ( ON ?auto_892541 ?auto_892542 ) ( CLEAR ?auto_892539 ) ( ON ?auto_892540 ?auto_892541 ) ( CLEAR ?auto_892540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_892538 ?auto_892539 ?auto_892540 )
      ( MAKE-13PILE ?auto_892538 ?auto_892539 ?auto_892540 ?auto_892541 ?auto_892542 ?auto_892543 ?auto_892544 ?auto_892545 ?auto_892546 ?auto_892547 ?auto_892548 ?auto_892549 ?auto_892550 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892592 - BLOCK
      ?auto_892593 - BLOCK
      ?auto_892594 - BLOCK
      ?auto_892595 - BLOCK
      ?auto_892596 - BLOCK
      ?auto_892597 - BLOCK
      ?auto_892598 - BLOCK
      ?auto_892599 - BLOCK
      ?auto_892600 - BLOCK
      ?auto_892601 - BLOCK
      ?auto_892602 - BLOCK
      ?auto_892603 - BLOCK
      ?auto_892604 - BLOCK
    )
    :vars
    (
      ?auto_892605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892604 ?auto_892605 ) ( ON-TABLE ?auto_892592 ) ( not ( = ?auto_892592 ?auto_892593 ) ) ( not ( = ?auto_892592 ?auto_892594 ) ) ( not ( = ?auto_892592 ?auto_892595 ) ) ( not ( = ?auto_892592 ?auto_892596 ) ) ( not ( = ?auto_892592 ?auto_892597 ) ) ( not ( = ?auto_892592 ?auto_892598 ) ) ( not ( = ?auto_892592 ?auto_892599 ) ) ( not ( = ?auto_892592 ?auto_892600 ) ) ( not ( = ?auto_892592 ?auto_892601 ) ) ( not ( = ?auto_892592 ?auto_892602 ) ) ( not ( = ?auto_892592 ?auto_892603 ) ) ( not ( = ?auto_892592 ?auto_892604 ) ) ( not ( = ?auto_892592 ?auto_892605 ) ) ( not ( = ?auto_892593 ?auto_892594 ) ) ( not ( = ?auto_892593 ?auto_892595 ) ) ( not ( = ?auto_892593 ?auto_892596 ) ) ( not ( = ?auto_892593 ?auto_892597 ) ) ( not ( = ?auto_892593 ?auto_892598 ) ) ( not ( = ?auto_892593 ?auto_892599 ) ) ( not ( = ?auto_892593 ?auto_892600 ) ) ( not ( = ?auto_892593 ?auto_892601 ) ) ( not ( = ?auto_892593 ?auto_892602 ) ) ( not ( = ?auto_892593 ?auto_892603 ) ) ( not ( = ?auto_892593 ?auto_892604 ) ) ( not ( = ?auto_892593 ?auto_892605 ) ) ( not ( = ?auto_892594 ?auto_892595 ) ) ( not ( = ?auto_892594 ?auto_892596 ) ) ( not ( = ?auto_892594 ?auto_892597 ) ) ( not ( = ?auto_892594 ?auto_892598 ) ) ( not ( = ?auto_892594 ?auto_892599 ) ) ( not ( = ?auto_892594 ?auto_892600 ) ) ( not ( = ?auto_892594 ?auto_892601 ) ) ( not ( = ?auto_892594 ?auto_892602 ) ) ( not ( = ?auto_892594 ?auto_892603 ) ) ( not ( = ?auto_892594 ?auto_892604 ) ) ( not ( = ?auto_892594 ?auto_892605 ) ) ( not ( = ?auto_892595 ?auto_892596 ) ) ( not ( = ?auto_892595 ?auto_892597 ) ) ( not ( = ?auto_892595 ?auto_892598 ) ) ( not ( = ?auto_892595 ?auto_892599 ) ) ( not ( = ?auto_892595 ?auto_892600 ) ) ( not ( = ?auto_892595 ?auto_892601 ) ) ( not ( = ?auto_892595 ?auto_892602 ) ) ( not ( = ?auto_892595 ?auto_892603 ) ) ( not ( = ?auto_892595 ?auto_892604 ) ) ( not ( = ?auto_892595 ?auto_892605 ) ) ( not ( = ?auto_892596 ?auto_892597 ) ) ( not ( = ?auto_892596 ?auto_892598 ) ) ( not ( = ?auto_892596 ?auto_892599 ) ) ( not ( = ?auto_892596 ?auto_892600 ) ) ( not ( = ?auto_892596 ?auto_892601 ) ) ( not ( = ?auto_892596 ?auto_892602 ) ) ( not ( = ?auto_892596 ?auto_892603 ) ) ( not ( = ?auto_892596 ?auto_892604 ) ) ( not ( = ?auto_892596 ?auto_892605 ) ) ( not ( = ?auto_892597 ?auto_892598 ) ) ( not ( = ?auto_892597 ?auto_892599 ) ) ( not ( = ?auto_892597 ?auto_892600 ) ) ( not ( = ?auto_892597 ?auto_892601 ) ) ( not ( = ?auto_892597 ?auto_892602 ) ) ( not ( = ?auto_892597 ?auto_892603 ) ) ( not ( = ?auto_892597 ?auto_892604 ) ) ( not ( = ?auto_892597 ?auto_892605 ) ) ( not ( = ?auto_892598 ?auto_892599 ) ) ( not ( = ?auto_892598 ?auto_892600 ) ) ( not ( = ?auto_892598 ?auto_892601 ) ) ( not ( = ?auto_892598 ?auto_892602 ) ) ( not ( = ?auto_892598 ?auto_892603 ) ) ( not ( = ?auto_892598 ?auto_892604 ) ) ( not ( = ?auto_892598 ?auto_892605 ) ) ( not ( = ?auto_892599 ?auto_892600 ) ) ( not ( = ?auto_892599 ?auto_892601 ) ) ( not ( = ?auto_892599 ?auto_892602 ) ) ( not ( = ?auto_892599 ?auto_892603 ) ) ( not ( = ?auto_892599 ?auto_892604 ) ) ( not ( = ?auto_892599 ?auto_892605 ) ) ( not ( = ?auto_892600 ?auto_892601 ) ) ( not ( = ?auto_892600 ?auto_892602 ) ) ( not ( = ?auto_892600 ?auto_892603 ) ) ( not ( = ?auto_892600 ?auto_892604 ) ) ( not ( = ?auto_892600 ?auto_892605 ) ) ( not ( = ?auto_892601 ?auto_892602 ) ) ( not ( = ?auto_892601 ?auto_892603 ) ) ( not ( = ?auto_892601 ?auto_892604 ) ) ( not ( = ?auto_892601 ?auto_892605 ) ) ( not ( = ?auto_892602 ?auto_892603 ) ) ( not ( = ?auto_892602 ?auto_892604 ) ) ( not ( = ?auto_892602 ?auto_892605 ) ) ( not ( = ?auto_892603 ?auto_892604 ) ) ( not ( = ?auto_892603 ?auto_892605 ) ) ( not ( = ?auto_892604 ?auto_892605 ) ) ( ON ?auto_892603 ?auto_892604 ) ( ON ?auto_892602 ?auto_892603 ) ( ON ?auto_892601 ?auto_892602 ) ( ON ?auto_892600 ?auto_892601 ) ( ON ?auto_892599 ?auto_892600 ) ( ON ?auto_892598 ?auto_892599 ) ( ON ?auto_892597 ?auto_892598 ) ( ON ?auto_892596 ?auto_892597 ) ( ON ?auto_892595 ?auto_892596 ) ( ON ?auto_892594 ?auto_892595 ) ( CLEAR ?auto_892592 ) ( ON ?auto_892593 ?auto_892594 ) ( CLEAR ?auto_892593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_892592 ?auto_892593 )
      ( MAKE-13PILE ?auto_892592 ?auto_892593 ?auto_892594 ?auto_892595 ?auto_892596 ?auto_892597 ?auto_892598 ?auto_892599 ?auto_892600 ?auto_892601 ?auto_892602 ?auto_892603 ?auto_892604 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_892646 - BLOCK
      ?auto_892647 - BLOCK
      ?auto_892648 - BLOCK
      ?auto_892649 - BLOCK
      ?auto_892650 - BLOCK
      ?auto_892651 - BLOCK
      ?auto_892652 - BLOCK
      ?auto_892653 - BLOCK
      ?auto_892654 - BLOCK
      ?auto_892655 - BLOCK
      ?auto_892656 - BLOCK
      ?auto_892657 - BLOCK
      ?auto_892658 - BLOCK
    )
    :vars
    (
      ?auto_892659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892658 ?auto_892659 ) ( not ( = ?auto_892646 ?auto_892647 ) ) ( not ( = ?auto_892646 ?auto_892648 ) ) ( not ( = ?auto_892646 ?auto_892649 ) ) ( not ( = ?auto_892646 ?auto_892650 ) ) ( not ( = ?auto_892646 ?auto_892651 ) ) ( not ( = ?auto_892646 ?auto_892652 ) ) ( not ( = ?auto_892646 ?auto_892653 ) ) ( not ( = ?auto_892646 ?auto_892654 ) ) ( not ( = ?auto_892646 ?auto_892655 ) ) ( not ( = ?auto_892646 ?auto_892656 ) ) ( not ( = ?auto_892646 ?auto_892657 ) ) ( not ( = ?auto_892646 ?auto_892658 ) ) ( not ( = ?auto_892646 ?auto_892659 ) ) ( not ( = ?auto_892647 ?auto_892648 ) ) ( not ( = ?auto_892647 ?auto_892649 ) ) ( not ( = ?auto_892647 ?auto_892650 ) ) ( not ( = ?auto_892647 ?auto_892651 ) ) ( not ( = ?auto_892647 ?auto_892652 ) ) ( not ( = ?auto_892647 ?auto_892653 ) ) ( not ( = ?auto_892647 ?auto_892654 ) ) ( not ( = ?auto_892647 ?auto_892655 ) ) ( not ( = ?auto_892647 ?auto_892656 ) ) ( not ( = ?auto_892647 ?auto_892657 ) ) ( not ( = ?auto_892647 ?auto_892658 ) ) ( not ( = ?auto_892647 ?auto_892659 ) ) ( not ( = ?auto_892648 ?auto_892649 ) ) ( not ( = ?auto_892648 ?auto_892650 ) ) ( not ( = ?auto_892648 ?auto_892651 ) ) ( not ( = ?auto_892648 ?auto_892652 ) ) ( not ( = ?auto_892648 ?auto_892653 ) ) ( not ( = ?auto_892648 ?auto_892654 ) ) ( not ( = ?auto_892648 ?auto_892655 ) ) ( not ( = ?auto_892648 ?auto_892656 ) ) ( not ( = ?auto_892648 ?auto_892657 ) ) ( not ( = ?auto_892648 ?auto_892658 ) ) ( not ( = ?auto_892648 ?auto_892659 ) ) ( not ( = ?auto_892649 ?auto_892650 ) ) ( not ( = ?auto_892649 ?auto_892651 ) ) ( not ( = ?auto_892649 ?auto_892652 ) ) ( not ( = ?auto_892649 ?auto_892653 ) ) ( not ( = ?auto_892649 ?auto_892654 ) ) ( not ( = ?auto_892649 ?auto_892655 ) ) ( not ( = ?auto_892649 ?auto_892656 ) ) ( not ( = ?auto_892649 ?auto_892657 ) ) ( not ( = ?auto_892649 ?auto_892658 ) ) ( not ( = ?auto_892649 ?auto_892659 ) ) ( not ( = ?auto_892650 ?auto_892651 ) ) ( not ( = ?auto_892650 ?auto_892652 ) ) ( not ( = ?auto_892650 ?auto_892653 ) ) ( not ( = ?auto_892650 ?auto_892654 ) ) ( not ( = ?auto_892650 ?auto_892655 ) ) ( not ( = ?auto_892650 ?auto_892656 ) ) ( not ( = ?auto_892650 ?auto_892657 ) ) ( not ( = ?auto_892650 ?auto_892658 ) ) ( not ( = ?auto_892650 ?auto_892659 ) ) ( not ( = ?auto_892651 ?auto_892652 ) ) ( not ( = ?auto_892651 ?auto_892653 ) ) ( not ( = ?auto_892651 ?auto_892654 ) ) ( not ( = ?auto_892651 ?auto_892655 ) ) ( not ( = ?auto_892651 ?auto_892656 ) ) ( not ( = ?auto_892651 ?auto_892657 ) ) ( not ( = ?auto_892651 ?auto_892658 ) ) ( not ( = ?auto_892651 ?auto_892659 ) ) ( not ( = ?auto_892652 ?auto_892653 ) ) ( not ( = ?auto_892652 ?auto_892654 ) ) ( not ( = ?auto_892652 ?auto_892655 ) ) ( not ( = ?auto_892652 ?auto_892656 ) ) ( not ( = ?auto_892652 ?auto_892657 ) ) ( not ( = ?auto_892652 ?auto_892658 ) ) ( not ( = ?auto_892652 ?auto_892659 ) ) ( not ( = ?auto_892653 ?auto_892654 ) ) ( not ( = ?auto_892653 ?auto_892655 ) ) ( not ( = ?auto_892653 ?auto_892656 ) ) ( not ( = ?auto_892653 ?auto_892657 ) ) ( not ( = ?auto_892653 ?auto_892658 ) ) ( not ( = ?auto_892653 ?auto_892659 ) ) ( not ( = ?auto_892654 ?auto_892655 ) ) ( not ( = ?auto_892654 ?auto_892656 ) ) ( not ( = ?auto_892654 ?auto_892657 ) ) ( not ( = ?auto_892654 ?auto_892658 ) ) ( not ( = ?auto_892654 ?auto_892659 ) ) ( not ( = ?auto_892655 ?auto_892656 ) ) ( not ( = ?auto_892655 ?auto_892657 ) ) ( not ( = ?auto_892655 ?auto_892658 ) ) ( not ( = ?auto_892655 ?auto_892659 ) ) ( not ( = ?auto_892656 ?auto_892657 ) ) ( not ( = ?auto_892656 ?auto_892658 ) ) ( not ( = ?auto_892656 ?auto_892659 ) ) ( not ( = ?auto_892657 ?auto_892658 ) ) ( not ( = ?auto_892657 ?auto_892659 ) ) ( not ( = ?auto_892658 ?auto_892659 ) ) ( ON ?auto_892657 ?auto_892658 ) ( ON ?auto_892656 ?auto_892657 ) ( ON ?auto_892655 ?auto_892656 ) ( ON ?auto_892654 ?auto_892655 ) ( ON ?auto_892653 ?auto_892654 ) ( ON ?auto_892652 ?auto_892653 ) ( ON ?auto_892651 ?auto_892652 ) ( ON ?auto_892650 ?auto_892651 ) ( ON ?auto_892649 ?auto_892650 ) ( ON ?auto_892648 ?auto_892649 ) ( ON ?auto_892647 ?auto_892648 ) ( ON ?auto_892646 ?auto_892647 ) ( CLEAR ?auto_892646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_892646 )
      ( MAKE-13PILE ?auto_892646 ?auto_892647 ?auto_892648 ?auto_892649 ?auto_892650 ?auto_892651 ?auto_892652 ?auto_892653 ?auto_892654 ?auto_892655 ?auto_892656 ?auto_892657 ?auto_892658 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_892701 - BLOCK
      ?auto_892702 - BLOCK
      ?auto_892703 - BLOCK
      ?auto_892704 - BLOCK
      ?auto_892705 - BLOCK
      ?auto_892706 - BLOCK
      ?auto_892707 - BLOCK
      ?auto_892708 - BLOCK
      ?auto_892709 - BLOCK
      ?auto_892710 - BLOCK
      ?auto_892711 - BLOCK
      ?auto_892712 - BLOCK
      ?auto_892713 - BLOCK
      ?auto_892714 - BLOCK
    )
    :vars
    (
      ?auto_892715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_892713 ) ( ON ?auto_892714 ?auto_892715 ) ( CLEAR ?auto_892714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_892701 ) ( ON ?auto_892702 ?auto_892701 ) ( ON ?auto_892703 ?auto_892702 ) ( ON ?auto_892704 ?auto_892703 ) ( ON ?auto_892705 ?auto_892704 ) ( ON ?auto_892706 ?auto_892705 ) ( ON ?auto_892707 ?auto_892706 ) ( ON ?auto_892708 ?auto_892707 ) ( ON ?auto_892709 ?auto_892708 ) ( ON ?auto_892710 ?auto_892709 ) ( ON ?auto_892711 ?auto_892710 ) ( ON ?auto_892712 ?auto_892711 ) ( ON ?auto_892713 ?auto_892712 ) ( not ( = ?auto_892701 ?auto_892702 ) ) ( not ( = ?auto_892701 ?auto_892703 ) ) ( not ( = ?auto_892701 ?auto_892704 ) ) ( not ( = ?auto_892701 ?auto_892705 ) ) ( not ( = ?auto_892701 ?auto_892706 ) ) ( not ( = ?auto_892701 ?auto_892707 ) ) ( not ( = ?auto_892701 ?auto_892708 ) ) ( not ( = ?auto_892701 ?auto_892709 ) ) ( not ( = ?auto_892701 ?auto_892710 ) ) ( not ( = ?auto_892701 ?auto_892711 ) ) ( not ( = ?auto_892701 ?auto_892712 ) ) ( not ( = ?auto_892701 ?auto_892713 ) ) ( not ( = ?auto_892701 ?auto_892714 ) ) ( not ( = ?auto_892701 ?auto_892715 ) ) ( not ( = ?auto_892702 ?auto_892703 ) ) ( not ( = ?auto_892702 ?auto_892704 ) ) ( not ( = ?auto_892702 ?auto_892705 ) ) ( not ( = ?auto_892702 ?auto_892706 ) ) ( not ( = ?auto_892702 ?auto_892707 ) ) ( not ( = ?auto_892702 ?auto_892708 ) ) ( not ( = ?auto_892702 ?auto_892709 ) ) ( not ( = ?auto_892702 ?auto_892710 ) ) ( not ( = ?auto_892702 ?auto_892711 ) ) ( not ( = ?auto_892702 ?auto_892712 ) ) ( not ( = ?auto_892702 ?auto_892713 ) ) ( not ( = ?auto_892702 ?auto_892714 ) ) ( not ( = ?auto_892702 ?auto_892715 ) ) ( not ( = ?auto_892703 ?auto_892704 ) ) ( not ( = ?auto_892703 ?auto_892705 ) ) ( not ( = ?auto_892703 ?auto_892706 ) ) ( not ( = ?auto_892703 ?auto_892707 ) ) ( not ( = ?auto_892703 ?auto_892708 ) ) ( not ( = ?auto_892703 ?auto_892709 ) ) ( not ( = ?auto_892703 ?auto_892710 ) ) ( not ( = ?auto_892703 ?auto_892711 ) ) ( not ( = ?auto_892703 ?auto_892712 ) ) ( not ( = ?auto_892703 ?auto_892713 ) ) ( not ( = ?auto_892703 ?auto_892714 ) ) ( not ( = ?auto_892703 ?auto_892715 ) ) ( not ( = ?auto_892704 ?auto_892705 ) ) ( not ( = ?auto_892704 ?auto_892706 ) ) ( not ( = ?auto_892704 ?auto_892707 ) ) ( not ( = ?auto_892704 ?auto_892708 ) ) ( not ( = ?auto_892704 ?auto_892709 ) ) ( not ( = ?auto_892704 ?auto_892710 ) ) ( not ( = ?auto_892704 ?auto_892711 ) ) ( not ( = ?auto_892704 ?auto_892712 ) ) ( not ( = ?auto_892704 ?auto_892713 ) ) ( not ( = ?auto_892704 ?auto_892714 ) ) ( not ( = ?auto_892704 ?auto_892715 ) ) ( not ( = ?auto_892705 ?auto_892706 ) ) ( not ( = ?auto_892705 ?auto_892707 ) ) ( not ( = ?auto_892705 ?auto_892708 ) ) ( not ( = ?auto_892705 ?auto_892709 ) ) ( not ( = ?auto_892705 ?auto_892710 ) ) ( not ( = ?auto_892705 ?auto_892711 ) ) ( not ( = ?auto_892705 ?auto_892712 ) ) ( not ( = ?auto_892705 ?auto_892713 ) ) ( not ( = ?auto_892705 ?auto_892714 ) ) ( not ( = ?auto_892705 ?auto_892715 ) ) ( not ( = ?auto_892706 ?auto_892707 ) ) ( not ( = ?auto_892706 ?auto_892708 ) ) ( not ( = ?auto_892706 ?auto_892709 ) ) ( not ( = ?auto_892706 ?auto_892710 ) ) ( not ( = ?auto_892706 ?auto_892711 ) ) ( not ( = ?auto_892706 ?auto_892712 ) ) ( not ( = ?auto_892706 ?auto_892713 ) ) ( not ( = ?auto_892706 ?auto_892714 ) ) ( not ( = ?auto_892706 ?auto_892715 ) ) ( not ( = ?auto_892707 ?auto_892708 ) ) ( not ( = ?auto_892707 ?auto_892709 ) ) ( not ( = ?auto_892707 ?auto_892710 ) ) ( not ( = ?auto_892707 ?auto_892711 ) ) ( not ( = ?auto_892707 ?auto_892712 ) ) ( not ( = ?auto_892707 ?auto_892713 ) ) ( not ( = ?auto_892707 ?auto_892714 ) ) ( not ( = ?auto_892707 ?auto_892715 ) ) ( not ( = ?auto_892708 ?auto_892709 ) ) ( not ( = ?auto_892708 ?auto_892710 ) ) ( not ( = ?auto_892708 ?auto_892711 ) ) ( not ( = ?auto_892708 ?auto_892712 ) ) ( not ( = ?auto_892708 ?auto_892713 ) ) ( not ( = ?auto_892708 ?auto_892714 ) ) ( not ( = ?auto_892708 ?auto_892715 ) ) ( not ( = ?auto_892709 ?auto_892710 ) ) ( not ( = ?auto_892709 ?auto_892711 ) ) ( not ( = ?auto_892709 ?auto_892712 ) ) ( not ( = ?auto_892709 ?auto_892713 ) ) ( not ( = ?auto_892709 ?auto_892714 ) ) ( not ( = ?auto_892709 ?auto_892715 ) ) ( not ( = ?auto_892710 ?auto_892711 ) ) ( not ( = ?auto_892710 ?auto_892712 ) ) ( not ( = ?auto_892710 ?auto_892713 ) ) ( not ( = ?auto_892710 ?auto_892714 ) ) ( not ( = ?auto_892710 ?auto_892715 ) ) ( not ( = ?auto_892711 ?auto_892712 ) ) ( not ( = ?auto_892711 ?auto_892713 ) ) ( not ( = ?auto_892711 ?auto_892714 ) ) ( not ( = ?auto_892711 ?auto_892715 ) ) ( not ( = ?auto_892712 ?auto_892713 ) ) ( not ( = ?auto_892712 ?auto_892714 ) ) ( not ( = ?auto_892712 ?auto_892715 ) ) ( not ( = ?auto_892713 ?auto_892714 ) ) ( not ( = ?auto_892713 ?auto_892715 ) ) ( not ( = ?auto_892714 ?auto_892715 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_892714 ?auto_892715 )
      ( !STACK ?auto_892714 ?auto_892713 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_892759 - BLOCK
      ?auto_892760 - BLOCK
      ?auto_892761 - BLOCK
      ?auto_892762 - BLOCK
      ?auto_892763 - BLOCK
      ?auto_892764 - BLOCK
      ?auto_892765 - BLOCK
      ?auto_892766 - BLOCK
      ?auto_892767 - BLOCK
      ?auto_892768 - BLOCK
      ?auto_892769 - BLOCK
      ?auto_892770 - BLOCK
      ?auto_892771 - BLOCK
      ?auto_892772 - BLOCK
    )
    :vars
    (
      ?auto_892773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892772 ?auto_892773 ) ( ON-TABLE ?auto_892759 ) ( ON ?auto_892760 ?auto_892759 ) ( ON ?auto_892761 ?auto_892760 ) ( ON ?auto_892762 ?auto_892761 ) ( ON ?auto_892763 ?auto_892762 ) ( ON ?auto_892764 ?auto_892763 ) ( ON ?auto_892765 ?auto_892764 ) ( ON ?auto_892766 ?auto_892765 ) ( ON ?auto_892767 ?auto_892766 ) ( ON ?auto_892768 ?auto_892767 ) ( ON ?auto_892769 ?auto_892768 ) ( ON ?auto_892770 ?auto_892769 ) ( not ( = ?auto_892759 ?auto_892760 ) ) ( not ( = ?auto_892759 ?auto_892761 ) ) ( not ( = ?auto_892759 ?auto_892762 ) ) ( not ( = ?auto_892759 ?auto_892763 ) ) ( not ( = ?auto_892759 ?auto_892764 ) ) ( not ( = ?auto_892759 ?auto_892765 ) ) ( not ( = ?auto_892759 ?auto_892766 ) ) ( not ( = ?auto_892759 ?auto_892767 ) ) ( not ( = ?auto_892759 ?auto_892768 ) ) ( not ( = ?auto_892759 ?auto_892769 ) ) ( not ( = ?auto_892759 ?auto_892770 ) ) ( not ( = ?auto_892759 ?auto_892771 ) ) ( not ( = ?auto_892759 ?auto_892772 ) ) ( not ( = ?auto_892759 ?auto_892773 ) ) ( not ( = ?auto_892760 ?auto_892761 ) ) ( not ( = ?auto_892760 ?auto_892762 ) ) ( not ( = ?auto_892760 ?auto_892763 ) ) ( not ( = ?auto_892760 ?auto_892764 ) ) ( not ( = ?auto_892760 ?auto_892765 ) ) ( not ( = ?auto_892760 ?auto_892766 ) ) ( not ( = ?auto_892760 ?auto_892767 ) ) ( not ( = ?auto_892760 ?auto_892768 ) ) ( not ( = ?auto_892760 ?auto_892769 ) ) ( not ( = ?auto_892760 ?auto_892770 ) ) ( not ( = ?auto_892760 ?auto_892771 ) ) ( not ( = ?auto_892760 ?auto_892772 ) ) ( not ( = ?auto_892760 ?auto_892773 ) ) ( not ( = ?auto_892761 ?auto_892762 ) ) ( not ( = ?auto_892761 ?auto_892763 ) ) ( not ( = ?auto_892761 ?auto_892764 ) ) ( not ( = ?auto_892761 ?auto_892765 ) ) ( not ( = ?auto_892761 ?auto_892766 ) ) ( not ( = ?auto_892761 ?auto_892767 ) ) ( not ( = ?auto_892761 ?auto_892768 ) ) ( not ( = ?auto_892761 ?auto_892769 ) ) ( not ( = ?auto_892761 ?auto_892770 ) ) ( not ( = ?auto_892761 ?auto_892771 ) ) ( not ( = ?auto_892761 ?auto_892772 ) ) ( not ( = ?auto_892761 ?auto_892773 ) ) ( not ( = ?auto_892762 ?auto_892763 ) ) ( not ( = ?auto_892762 ?auto_892764 ) ) ( not ( = ?auto_892762 ?auto_892765 ) ) ( not ( = ?auto_892762 ?auto_892766 ) ) ( not ( = ?auto_892762 ?auto_892767 ) ) ( not ( = ?auto_892762 ?auto_892768 ) ) ( not ( = ?auto_892762 ?auto_892769 ) ) ( not ( = ?auto_892762 ?auto_892770 ) ) ( not ( = ?auto_892762 ?auto_892771 ) ) ( not ( = ?auto_892762 ?auto_892772 ) ) ( not ( = ?auto_892762 ?auto_892773 ) ) ( not ( = ?auto_892763 ?auto_892764 ) ) ( not ( = ?auto_892763 ?auto_892765 ) ) ( not ( = ?auto_892763 ?auto_892766 ) ) ( not ( = ?auto_892763 ?auto_892767 ) ) ( not ( = ?auto_892763 ?auto_892768 ) ) ( not ( = ?auto_892763 ?auto_892769 ) ) ( not ( = ?auto_892763 ?auto_892770 ) ) ( not ( = ?auto_892763 ?auto_892771 ) ) ( not ( = ?auto_892763 ?auto_892772 ) ) ( not ( = ?auto_892763 ?auto_892773 ) ) ( not ( = ?auto_892764 ?auto_892765 ) ) ( not ( = ?auto_892764 ?auto_892766 ) ) ( not ( = ?auto_892764 ?auto_892767 ) ) ( not ( = ?auto_892764 ?auto_892768 ) ) ( not ( = ?auto_892764 ?auto_892769 ) ) ( not ( = ?auto_892764 ?auto_892770 ) ) ( not ( = ?auto_892764 ?auto_892771 ) ) ( not ( = ?auto_892764 ?auto_892772 ) ) ( not ( = ?auto_892764 ?auto_892773 ) ) ( not ( = ?auto_892765 ?auto_892766 ) ) ( not ( = ?auto_892765 ?auto_892767 ) ) ( not ( = ?auto_892765 ?auto_892768 ) ) ( not ( = ?auto_892765 ?auto_892769 ) ) ( not ( = ?auto_892765 ?auto_892770 ) ) ( not ( = ?auto_892765 ?auto_892771 ) ) ( not ( = ?auto_892765 ?auto_892772 ) ) ( not ( = ?auto_892765 ?auto_892773 ) ) ( not ( = ?auto_892766 ?auto_892767 ) ) ( not ( = ?auto_892766 ?auto_892768 ) ) ( not ( = ?auto_892766 ?auto_892769 ) ) ( not ( = ?auto_892766 ?auto_892770 ) ) ( not ( = ?auto_892766 ?auto_892771 ) ) ( not ( = ?auto_892766 ?auto_892772 ) ) ( not ( = ?auto_892766 ?auto_892773 ) ) ( not ( = ?auto_892767 ?auto_892768 ) ) ( not ( = ?auto_892767 ?auto_892769 ) ) ( not ( = ?auto_892767 ?auto_892770 ) ) ( not ( = ?auto_892767 ?auto_892771 ) ) ( not ( = ?auto_892767 ?auto_892772 ) ) ( not ( = ?auto_892767 ?auto_892773 ) ) ( not ( = ?auto_892768 ?auto_892769 ) ) ( not ( = ?auto_892768 ?auto_892770 ) ) ( not ( = ?auto_892768 ?auto_892771 ) ) ( not ( = ?auto_892768 ?auto_892772 ) ) ( not ( = ?auto_892768 ?auto_892773 ) ) ( not ( = ?auto_892769 ?auto_892770 ) ) ( not ( = ?auto_892769 ?auto_892771 ) ) ( not ( = ?auto_892769 ?auto_892772 ) ) ( not ( = ?auto_892769 ?auto_892773 ) ) ( not ( = ?auto_892770 ?auto_892771 ) ) ( not ( = ?auto_892770 ?auto_892772 ) ) ( not ( = ?auto_892770 ?auto_892773 ) ) ( not ( = ?auto_892771 ?auto_892772 ) ) ( not ( = ?auto_892771 ?auto_892773 ) ) ( not ( = ?auto_892772 ?auto_892773 ) ) ( CLEAR ?auto_892770 ) ( ON ?auto_892771 ?auto_892772 ) ( CLEAR ?auto_892771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_892759 ?auto_892760 ?auto_892761 ?auto_892762 ?auto_892763 ?auto_892764 ?auto_892765 ?auto_892766 ?auto_892767 ?auto_892768 ?auto_892769 ?auto_892770 ?auto_892771 )
      ( MAKE-14PILE ?auto_892759 ?auto_892760 ?auto_892761 ?auto_892762 ?auto_892763 ?auto_892764 ?auto_892765 ?auto_892766 ?auto_892767 ?auto_892768 ?auto_892769 ?auto_892770 ?auto_892771 ?auto_892772 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_892817 - BLOCK
      ?auto_892818 - BLOCK
      ?auto_892819 - BLOCK
      ?auto_892820 - BLOCK
      ?auto_892821 - BLOCK
      ?auto_892822 - BLOCK
      ?auto_892823 - BLOCK
      ?auto_892824 - BLOCK
      ?auto_892825 - BLOCK
      ?auto_892826 - BLOCK
      ?auto_892827 - BLOCK
      ?auto_892828 - BLOCK
      ?auto_892829 - BLOCK
      ?auto_892830 - BLOCK
    )
    :vars
    (
      ?auto_892831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892830 ?auto_892831 ) ( ON-TABLE ?auto_892817 ) ( ON ?auto_892818 ?auto_892817 ) ( ON ?auto_892819 ?auto_892818 ) ( ON ?auto_892820 ?auto_892819 ) ( ON ?auto_892821 ?auto_892820 ) ( ON ?auto_892822 ?auto_892821 ) ( ON ?auto_892823 ?auto_892822 ) ( ON ?auto_892824 ?auto_892823 ) ( ON ?auto_892825 ?auto_892824 ) ( ON ?auto_892826 ?auto_892825 ) ( ON ?auto_892827 ?auto_892826 ) ( not ( = ?auto_892817 ?auto_892818 ) ) ( not ( = ?auto_892817 ?auto_892819 ) ) ( not ( = ?auto_892817 ?auto_892820 ) ) ( not ( = ?auto_892817 ?auto_892821 ) ) ( not ( = ?auto_892817 ?auto_892822 ) ) ( not ( = ?auto_892817 ?auto_892823 ) ) ( not ( = ?auto_892817 ?auto_892824 ) ) ( not ( = ?auto_892817 ?auto_892825 ) ) ( not ( = ?auto_892817 ?auto_892826 ) ) ( not ( = ?auto_892817 ?auto_892827 ) ) ( not ( = ?auto_892817 ?auto_892828 ) ) ( not ( = ?auto_892817 ?auto_892829 ) ) ( not ( = ?auto_892817 ?auto_892830 ) ) ( not ( = ?auto_892817 ?auto_892831 ) ) ( not ( = ?auto_892818 ?auto_892819 ) ) ( not ( = ?auto_892818 ?auto_892820 ) ) ( not ( = ?auto_892818 ?auto_892821 ) ) ( not ( = ?auto_892818 ?auto_892822 ) ) ( not ( = ?auto_892818 ?auto_892823 ) ) ( not ( = ?auto_892818 ?auto_892824 ) ) ( not ( = ?auto_892818 ?auto_892825 ) ) ( not ( = ?auto_892818 ?auto_892826 ) ) ( not ( = ?auto_892818 ?auto_892827 ) ) ( not ( = ?auto_892818 ?auto_892828 ) ) ( not ( = ?auto_892818 ?auto_892829 ) ) ( not ( = ?auto_892818 ?auto_892830 ) ) ( not ( = ?auto_892818 ?auto_892831 ) ) ( not ( = ?auto_892819 ?auto_892820 ) ) ( not ( = ?auto_892819 ?auto_892821 ) ) ( not ( = ?auto_892819 ?auto_892822 ) ) ( not ( = ?auto_892819 ?auto_892823 ) ) ( not ( = ?auto_892819 ?auto_892824 ) ) ( not ( = ?auto_892819 ?auto_892825 ) ) ( not ( = ?auto_892819 ?auto_892826 ) ) ( not ( = ?auto_892819 ?auto_892827 ) ) ( not ( = ?auto_892819 ?auto_892828 ) ) ( not ( = ?auto_892819 ?auto_892829 ) ) ( not ( = ?auto_892819 ?auto_892830 ) ) ( not ( = ?auto_892819 ?auto_892831 ) ) ( not ( = ?auto_892820 ?auto_892821 ) ) ( not ( = ?auto_892820 ?auto_892822 ) ) ( not ( = ?auto_892820 ?auto_892823 ) ) ( not ( = ?auto_892820 ?auto_892824 ) ) ( not ( = ?auto_892820 ?auto_892825 ) ) ( not ( = ?auto_892820 ?auto_892826 ) ) ( not ( = ?auto_892820 ?auto_892827 ) ) ( not ( = ?auto_892820 ?auto_892828 ) ) ( not ( = ?auto_892820 ?auto_892829 ) ) ( not ( = ?auto_892820 ?auto_892830 ) ) ( not ( = ?auto_892820 ?auto_892831 ) ) ( not ( = ?auto_892821 ?auto_892822 ) ) ( not ( = ?auto_892821 ?auto_892823 ) ) ( not ( = ?auto_892821 ?auto_892824 ) ) ( not ( = ?auto_892821 ?auto_892825 ) ) ( not ( = ?auto_892821 ?auto_892826 ) ) ( not ( = ?auto_892821 ?auto_892827 ) ) ( not ( = ?auto_892821 ?auto_892828 ) ) ( not ( = ?auto_892821 ?auto_892829 ) ) ( not ( = ?auto_892821 ?auto_892830 ) ) ( not ( = ?auto_892821 ?auto_892831 ) ) ( not ( = ?auto_892822 ?auto_892823 ) ) ( not ( = ?auto_892822 ?auto_892824 ) ) ( not ( = ?auto_892822 ?auto_892825 ) ) ( not ( = ?auto_892822 ?auto_892826 ) ) ( not ( = ?auto_892822 ?auto_892827 ) ) ( not ( = ?auto_892822 ?auto_892828 ) ) ( not ( = ?auto_892822 ?auto_892829 ) ) ( not ( = ?auto_892822 ?auto_892830 ) ) ( not ( = ?auto_892822 ?auto_892831 ) ) ( not ( = ?auto_892823 ?auto_892824 ) ) ( not ( = ?auto_892823 ?auto_892825 ) ) ( not ( = ?auto_892823 ?auto_892826 ) ) ( not ( = ?auto_892823 ?auto_892827 ) ) ( not ( = ?auto_892823 ?auto_892828 ) ) ( not ( = ?auto_892823 ?auto_892829 ) ) ( not ( = ?auto_892823 ?auto_892830 ) ) ( not ( = ?auto_892823 ?auto_892831 ) ) ( not ( = ?auto_892824 ?auto_892825 ) ) ( not ( = ?auto_892824 ?auto_892826 ) ) ( not ( = ?auto_892824 ?auto_892827 ) ) ( not ( = ?auto_892824 ?auto_892828 ) ) ( not ( = ?auto_892824 ?auto_892829 ) ) ( not ( = ?auto_892824 ?auto_892830 ) ) ( not ( = ?auto_892824 ?auto_892831 ) ) ( not ( = ?auto_892825 ?auto_892826 ) ) ( not ( = ?auto_892825 ?auto_892827 ) ) ( not ( = ?auto_892825 ?auto_892828 ) ) ( not ( = ?auto_892825 ?auto_892829 ) ) ( not ( = ?auto_892825 ?auto_892830 ) ) ( not ( = ?auto_892825 ?auto_892831 ) ) ( not ( = ?auto_892826 ?auto_892827 ) ) ( not ( = ?auto_892826 ?auto_892828 ) ) ( not ( = ?auto_892826 ?auto_892829 ) ) ( not ( = ?auto_892826 ?auto_892830 ) ) ( not ( = ?auto_892826 ?auto_892831 ) ) ( not ( = ?auto_892827 ?auto_892828 ) ) ( not ( = ?auto_892827 ?auto_892829 ) ) ( not ( = ?auto_892827 ?auto_892830 ) ) ( not ( = ?auto_892827 ?auto_892831 ) ) ( not ( = ?auto_892828 ?auto_892829 ) ) ( not ( = ?auto_892828 ?auto_892830 ) ) ( not ( = ?auto_892828 ?auto_892831 ) ) ( not ( = ?auto_892829 ?auto_892830 ) ) ( not ( = ?auto_892829 ?auto_892831 ) ) ( not ( = ?auto_892830 ?auto_892831 ) ) ( ON ?auto_892829 ?auto_892830 ) ( CLEAR ?auto_892827 ) ( ON ?auto_892828 ?auto_892829 ) ( CLEAR ?auto_892828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_892817 ?auto_892818 ?auto_892819 ?auto_892820 ?auto_892821 ?auto_892822 ?auto_892823 ?auto_892824 ?auto_892825 ?auto_892826 ?auto_892827 ?auto_892828 )
      ( MAKE-14PILE ?auto_892817 ?auto_892818 ?auto_892819 ?auto_892820 ?auto_892821 ?auto_892822 ?auto_892823 ?auto_892824 ?auto_892825 ?auto_892826 ?auto_892827 ?auto_892828 ?auto_892829 ?auto_892830 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_892875 - BLOCK
      ?auto_892876 - BLOCK
      ?auto_892877 - BLOCK
      ?auto_892878 - BLOCK
      ?auto_892879 - BLOCK
      ?auto_892880 - BLOCK
      ?auto_892881 - BLOCK
      ?auto_892882 - BLOCK
      ?auto_892883 - BLOCK
      ?auto_892884 - BLOCK
      ?auto_892885 - BLOCK
      ?auto_892886 - BLOCK
      ?auto_892887 - BLOCK
      ?auto_892888 - BLOCK
    )
    :vars
    (
      ?auto_892889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892888 ?auto_892889 ) ( ON-TABLE ?auto_892875 ) ( ON ?auto_892876 ?auto_892875 ) ( ON ?auto_892877 ?auto_892876 ) ( ON ?auto_892878 ?auto_892877 ) ( ON ?auto_892879 ?auto_892878 ) ( ON ?auto_892880 ?auto_892879 ) ( ON ?auto_892881 ?auto_892880 ) ( ON ?auto_892882 ?auto_892881 ) ( ON ?auto_892883 ?auto_892882 ) ( ON ?auto_892884 ?auto_892883 ) ( not ( = ?auto_892875 ?auto_892876 ) ) ( not ( = ?auto_892875 ?auto_892877 ) ) ( not ( = ?auto_892875 ?auto_892878 ) ) ( not ( = ?auto_892875 ?auto_892879 ) ) ( not ( = ?auto_892875 ?auto_892880 ) ) ( not ( = ?auto_892875 ?auto_892881 ) ) ( not ( = ?auto_892875 ?auto_892882 ) ) ( not ( = ?auto_892875 ?auto_892883 ) ) ( not ( = ?auto_892875 ?auto_892884 ) ) ( not ( = ?auto_892875 ?auto_892885 ) ) ( not ( = ?auto_892875 ?auto_892886 ) ) ( not ( = ?auto_892875 ?auto_892887 ) ) ( not ( = ?auto_892875 ?auto_892888 ) ) ( not ( = ?auto_892875 ?auto_892889 ) ) ( not ( = ?auto_892876 ?auto_892877 ) ) ( not ( = ?auto_892876 ?auto_892878 ) ) ( not ( = ?auto_892876 ?auto_892879 ) ) ( not ( = ?auto_892876 ?auto_892880 ) ) ( not ( = ?auto_892876 ?auto_892881 ) ) ( not ( = ?auto_892876 ?auto_892882 ) ) ( not ( = ?auto_892876 ?auto_892883 ) ) ( not ( = ?auto_892876 ?auto_892884 ) ) ( not ( = ?auto_892876 ?auto_892885 ) ) ( not ( = ?auto_892876 ?auto_892886 ) ) ( not ( = ?auto_892876 ?auto_892887 ) ) ( not ( = ?auto_892876 ?auto_892888 ) ) ( not ( = ?auto_892876 ?auto_892889 ) ) ( not ( = ?auto_892877 ?auto_892878 ) ) ( not ( = ?auto_892877 ?auto_892879 ) ) ( not ( = ?auto_892877 ?auto_892880 ) ) ( not ( = ?auto_892877 ?auto_892881 ) ) ( not ( = ?auto_892877 ?auto_892882 ) ) ( not ( = ?auto_892877 ?auto_892883 ) ) ( not ( = ?auto_892877 ?auto_892884 ) ) ( not ( = ?auto_892877 ?auto_892885 ) ) ( not ( = ?auto_892877 ?auto_892886 ) ) ( not ( = ?auto_892877 ?auto_892887 ) ) ( not ( = ?auto_892877 ?auto_892888 ) ) ( not ( = ?auto_892877 ?auto_892889 ) ) ( not ( = ?auto_892878 ?auto_892879 ) ) ( not ( = ?auto_892878 ?auto_892880 ) ) ( not ( = ?auto_892878 ?auto_892881 ) ) ( not ( = ?auto_892878 ?auto_892882 ) ) ( not ( = ?auto_892878 ?auto_892883 ) ) ( not ( = ?auto_892878 ?auto_892884 ) ) ( not ( = ?auto_892878 ?auto_892885 ) ) ( not ( = ?auto_892878 ?auto_892886 ) ) ( not ( = ?auto_892878 ?auto_892887 ) ) ( not ( = ?auto_892878 ?auto_892888 ) ) ( not ( = ?auto_892878 ?auto_892889 ) ) ( not ( = ?auto_892879 ?auto_892880 ) ) ( not ( = ?auto_892879 ?auto_892881 ) ) ( not ( = ?auto_892879 ?auto_892882 ) ) ( not ( = ?auto_892879 ?auto_892883 ) ) ( not ( = ?auto_892879 ?auto_892884 ) ) ( not ( = ?auto_892879 ?auto_892885 ) ) ( not ( = ?auto_892879 ?auto_892886 ) ) ( not ( = ?auto_892879 ?auto_892887 ) ) ( not ( = ?auto_892879 ?auto_892888 ) ) ( not ( = ?auto_892879 ?auto_892889 ) ) ( not ( = ?auto_892880 ?auto_892881 ) ) ( not ( = ?auto_892880 ?auto_892882 ) ) ( not ( = ?auto_892880 ?auto_892883 ) ) ( not ( = ?auto_892880 ?auto_892884 ) ) ( not ( = ?auto_892880 ?auto_892885 ) ) ( not ( = ?auto_892880 ?auto_892886 ) ) ( not ( = ?auto_892880 ?auto_892887 ) ) ( not ( = ?auto_892880 ?auto_892888 ) ) ( not ( = ?auto_892880 ?auto_892889 ) ) ( not ( = ?auto_892881 ?auto_892882 ) ) ( not ( = ?auto_892881 ?auto_892883 ) ) ( not ( = ?auto_892881 ?auto_892884 ) ) ( not ( = ?auto_892881 ?auto_892885 ) ) ( not ( = ?auto_892881 ?auto_892886 ) ) ( not ( = ?auto_892881 ?auto_892887 ) ) ( not ( = ?auto_892881 ?auto_892888 ) ) ( not ( = ?auto_892881 ?auto_892889 ) ) ( not ( = ?auto_892882 ?auto_892883 ) ) ( not ( = ?auto_892882 ?auto_892884 ) ) ( not ( = ?auto_892882 ?auto_892885 ) ) ( not ( = ?auto_892882 ?auto_892886 ) ) ( not ( = ?auto_892882 ?auto_892887 ) ) ( not ( = ?auto_892882 ?auto_892888 ) ) ( not ( = ?auto_892882 ?auto_892889 ) ) ( not ( = ?auto_892883 ?auto_892884 ) ) ( not ( = ?auto_892883 ?auto_892885 ) ) ( not ( = ?auto_892883 ?auto_892886 ) ) ( not ( = ?auto_892883 ?auto_892887 ) ) ( not ( = ?auto_892883 ?auto_892888 ) ) ( not ( = ?auto_892883 ?auto_892889 ) ) ( not ( = ?auto_892884 ?auto_892885 ) ) ( not ( = ?auto_892884 ?auto_892886 ) ) ( not ( = ?auto_892884 ?auto_892887 ) ) ( not ( = ?auto_892884 ?auto_892888 ) ) ( not ( = ?auto_892884 ?auto_892889 ) ) ( not ( = ?auto_892885 ?auto_892886 ) ) ( not ( = ?auto_892885 ?auto_892887 ) ) ( not ( = ?auto_892885 ?auto_892888 ) ) ( not ( = ?auto_892885 ?auto_892889 ) ) ( not ( = ?auto_892886 ?auto_892887 ) ) ( not ( = ?auto_892886 ?auto_892888 ) ) ( not ( = ?auto_892886 ?auto_892889 ) ) ( not ( = ?auto_892887 ?auto_892888 ) ) ( not ( = ?auto_892887 ?auto_892889 ) ) ( not ( = ?auto_892888 ?auto_892889 ) ) ( ON ?auto_892887 ?auto_892888 ) ( ON ?auto_892886 ?auto_892887 ) ( CLEAR ?auto_892884 ) ( ON ?auto_892885 ?auto_892886 ) ( CLEAR ?auto_892885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_892875 ?auto_892876 ?auto_892877 ?auto_892878 ?auto_892879 ?auto_892880 ?auto_892881 ?auto_892882 ?auto_892883 ?auto_892884 ?auto_892885 )
      ( MAKE-14PILE ?auto_892875 ?auto_892876 ?auto_892877 ?auto_892878 ?auto_892879 ?auto_892880 ?auto_892881 ?auto_892882 ?auto_892883 ?auto_892884 ?auto_892885 ?auto_892886 ?auto_892887 ?auto_892888 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_892933 - BLOCK
      ?auto_892934 - BLOCK
      ?auto_892935 - BLOCK
      ?auto_892936 - BLOCK
      ?auto_892937 - BLOCK
      ?auto_892938 - BLOCK
      ?auto_892939 - BLOCK
      ?auto_892940 - BLOCK
      ?auto_892941 - BLOCK
      ?auto_892942 - BLOCK
      ?auto_892943 - BLOCK
      ?auto_892944 - BLOCK
      ?auto_892945 - BLOCK
      ?auto_892946 - BLOCK
    )
    :vars
    (
      ?auto_892947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_892946 ?auto_892947 ) ( ON-TABLE ?auto_892933 ) ( ON ?auto_892934 ?auto_892933 ) ( ON ?auto_892935 ?auto_892934 ) ( ON ?auto_892936 ?auto_892935 ) ( ON ?auto_892937 ?auto_892936 ) ( ON ?auto_892938 ?auto_892937 ) ( ON ?auto_892939 ?auto_892938 ) ( ON ?auto_892940 ?auto_892939 ) ( ON ?auto_892941 ?auto_892940 ) ( not ( = ?auto_892933 ?auto_892934 ) ) ( not ( = ?auto_892933 ?auto_892935 ) ) ( not ( = ?auto_892933 ?auto_892936 ) ) ( not ( = ?auto_892933 ?auto_892937 ) ) ( not ( = ?auto_892933 ?auto_892938 ) ) ( not ( = ?auto_892933 ?auto_892939 ) ) ( not ( = ?auto_892933 ?auto_892940 ) ) ( not ( = ?auto_892933 ?auto_892941 ) ) ( not ( = ?auto_892933 ?auto_892942 ) ) ( not ( = ?auto_892933 ?auto_892943 ) ) ( not ( = ?auto_892933 ?auto_892944 ) ) ( not ( = ?auto_892933 ?auto_892945 ) ) ( not ( = ?auto_892933 ?auto_892946 ) ) ( not ( = ?auto_892933 ?auto_892947 ) ) ( not ( = ?auto_892934 ?auto_892935 ) ) ( not ( = ?auto_892934 ?auto_892936 ) ) ( not ( = ?auto_892934 ?auto_892937 ) ) ( not ( = ?auto_892934 ?auto_892938 ) ) ( not ( = ?auto_892934 ?auto_892939 ) ) ( not ( = ?auto_892934 ?auto_892940 ) ) ( not ( = ?auto_892934 ?auto_892941 ) ) ( not ( = ?auto_892934 ?auto_892942 ) ) ( not ( = ?auto_892934 ?auto_892943 ) ) ( not ( = ?auto_892934 ?auto_892944 ) ) ( not ( = ?auto_892934 ?auto_892945 ) ) ( not ( = ?auto_892934 ?auto_892946 ) ) ( not ( = ?auto_892934 ?auto_892947 ) ) ( not ( = ?auto_892935 ?auto_892936 ) ) ( not ( = ?auto_892935 ?auto_892937 ) ) ( not ( = ?auto_892935 ?auto_892938 ) ) ( not ( = ?auto_892935 ?auto_892939 ) ) ( not ( = ?auto_892935 ?auto_892940 ) ) ( not ( = ?auto_892935 ?auto_892941 ) ) ( not ( = ?auto_892935 ?auto_892942 ) ) ( not ( = ?auto_892935 ?auto_892943 ) ) ( not ( = ?auto_892935 ?auto_892944 ) ) ( not ( = ?auto_892935 ?auto_892945 ) ) ( not ( = ?auto_892935 ?auto_892946 ) ) ( not ( = ?auto_892935 ?auto_892947 ) ) ( not ( = ?auto_892936 ?auto_892937 ) ) ( not ( = ?auto_892936 ?auto_892938 ) ) ( not ( = ?auto_892936 ?auto_892939 ) ) ( not ( = ?auto_892936 ?auto_892940 ) ) ( not ( = ?auto_892936 ?auto_892941 ) ) ( not ( = ?auto_892936 ?auto_892942 ) ) ( not ( = ?auto_892936 ?auto_892943 ) ) ( not ( = ?auto_892936 ?auto_892944 ) ) ( not ( = ?auto_892936 ?auto_892945 ) ) ( not ( = ?auto_892936 ?auto_892946 ) ) ( not ( = ?auto_892936 ?auto_892947 ) ) ( not ( = ?auto_892937 ?auto_892938 ) ) ( not ( = ?auto_892937 ?auto_892939 ) ) ( not ( = ?auto_892937 ?auto_892940 ) ) ( not ( = ?auto_892937 ?auto_892941 ) ) ( not ( = ?auto_892937 ?auto_892942 ) ) ( not ( = ?auto_892937 ?auto_892943 ) ) ( not ( = ?auto_892937 ?auto_892944 ) ) ( not ( = ?auto_892937 ?auto_892945 ) ) ( not ( = ?auto_892937 ?auto_892946 ) ) ( not ( = ?auto_892937 ?auto_892947 ) ) ( not ( = ?auto_892938 ?auto_892939 ) ) ( not ( = ?auto_892938 ?auto_892940 ) ) ( not ( = ?auto_892938 ?auto_892941 ) ) ( not ( = ?auto_892938 ?auto_892942 ) ) ( not ( = ?auto_892938 ?auto_892943 ) ) ( not ( = ?auto_892938 ?auto_892944 ) ) ( not ( = ?auto_892938 ?auto_892945 ) ) ( not ( = ?auto_892938 ?auto_892946 ) ) ( not ( = ?auto_892938 ?auto_892947 ) ) ( not ( = ?auto_892939 ?auto_892940 ) ) ( not ( = ?auto_892939 ?auto_892941 ) ) ( not ( = ?auto_892939 ?auto_892942 ) ) ( not ( = ?auto_892939 ?auto_892943 ) ) ( not ( = ?auto_892939 ?auto_892944 ) ) ( not ( = ?auto_892939 ?auto_892945 ) ) ( not ( = ?auto_892939 ?auto_892946 ) ) ( not ( = ?auto_892939 ?auto_892947 ) ) ( not ( = ?auto_892940 ?auto_892941 ) ) ( not ( = ?auto_892940 ?auto_892942 ) ) ( not ( = ?auto_892940 ?auto_892943 ) ) ( not ( = ?auto_892940 ?auto_892944 ) ) ( not ( = ?auto_892940 ?auto_892945 ) ) ( not ( = ?auto_892940 ?auto_892946 ) ) ( not ( = ?auto_892940 ?auto_892947 ) ) ( not ( = ?auto_892941 ?auto_892942 ) ) ( not ( = ?auto_892941 ?auto_892943 ) ) ( not ( = ?auto_892941 ?auto_892944 ) ) ( not ( = ?auto_892941 ?auto_892945 ) ) ( not ( = ?auto_892941 ?auto_892946 ) ) ( not ( = ?auto_892941 ?auto_892947 ) ) ( not ( = ?auto_892942 ?auto_892943 ) ) ( not ( = ?auto_892942 ?auto_892944 ) ) ( not ( = ?auto_892942 ?auto_892945 ) ) ( not ( = ?auto_892942 ?auto_892946 ) ) ( not ( = ?auto_892942 ?auto_892947 ) ) ( not ( = ?auto_892943 ?auto_892944 ) ) ( not ( = ?auto_892943 ?auto_892945 ) ) ( not ( = ?auto_892943 ?auto_892946 ) ) ( not ( = ?auto_892943 ?auto_892947 ) ) ( not ( = ?auto_892944 ?auto_892945 ) ) ( not ( = ?auto_892944 ?auto_892946 ) ) ( not ( = ?auto_892944 ?auto_892947 ) ) ( not ( = ?auto_892945 ?auto_892946 ) ) ( not ( = ?auto_892945 ?auto_892947 ) ) ( not ( = ?auto_892946 ?auto_892947 ) ) ( ON ?auto_892945 ?auto_892946 ) ( ON ?auto_892944 ?auto_892945 ) ( ON ?auto_892943 ?auto_892944 ) ( CLEAR ?auto_892941 ) ( ON ?auto_892942 ?auto_892943 ) ( CLEAR ?auto_892942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_892933 ?auto_892934 ?auto_892935 ?auto_892936 ?auto_892937 ?auto_892938 ?auto_892939 ?auto_892940 ?auto_892941 ?auto_892942 )
      ( MAKE-14PILE ?auto_892933 ?auto_892934 ?auto_892935 ?auto_892936 ?auto_892937 ?auto_892938 ?auto_892939 ?auto_892940 ?auto_892941 ?auto_892942 ?auto_892943 ?auto_892944 ?auto_892945 ?auto_892946 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_892991 - BLOCK
      ?auto_892992 - BLOCK
      ?auto_892993 - BLOCK
      ?auto_892994 - BLOCK
      ?auto_892995 - BLOCK
      ?auto_892996 - BLOCK
      ?auto_892997 - BLOCK
      ?auto_892998 - BLOCK
      ?auto_892999 - BLOCK
      ?auto_893000 - BLOCK
      ?auto_893001 - BLOCK
      ?auto_893002 - BLOCK
      ?auto_893003 - BLOCK
      ?auto_893004 - BLOCK
    )
    :vars
    (
      ?auto_893005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893004 ?auto_893005 ) ( ON-TABLE ?auto_892991 ) ( ON ?auto_892992 ?auto_892991 ) ( ON ?auto_892993 ?auto_892992 ) ( ON ?auto_892994 ?auto_892993 ) ( ON ?auto_892995 ?auto_892994 ) ( ON ?auto_892996 ?auto_892995 ) ( ON ?auto_892997 ?auto_892996 ) ( ON ?auto_892998 ?auto_892997 ) ( not ( = ?auto_892991 ?auto_892992 ) ) ( not ( = ?auto_892991 ?auto_892993 ) ) ( not ( = ?auto_892991 ?auto_892994 ) ) ( not ( = ?auto_892991 ?auto_892995 ) ) ( not ( = ?auto_892991 ?auto_892996 ) ) ( not ( = ?auto_892991 ?auto_892997 ) ) ( not ( = ?auto_892991 ?auto_892998 ) ) ( not ( = ?auto_892991 ?auto_892999 ) ) ( not ( = ?auto_892991 ?auto_893000 ) ) ( not ( = ?auto_892991 ?auto_893001 ) ) ( not ( = ?auto_892991 ?auto_893002 ) ) ( not ( = ?auto_892991 ?auto_893003 ) ) ( not ( = ?auto_892991 ?auto_893004 ) ) ( not ( = ?auto_892991 ?auto_893005 ) ) ( not ( = ?auto_892992 ?auto_892993 ) ) ( not ( = ?auto_892992 ?auto_892994 ) ) ( not ( = ?auto_892992 ?auto_892995 ) ) ( not ( = ?auto_892992 ?auto_892996 ) ) ( not ( = ?auto_892992 ?auto_892997 ) ) ( not ( = ?auto_892992 ?auto_892998 ) ) ( not ( = ?auto_892992 ?auto_892999 ) ) ( not ( = ?auto_892992 ?auto_893000 ) ) ( not ( = ?auto_892992 ?auto_893001 ) ) ( not ( = ?auto_892992 ?auto_893002 ) ) ( not ( = ?auto_892992 ?auto_893003 ) ) ( not ( = ?auto_892992 ?auto_893004 ) ) ( not ( = ?auto_892992 ?auto_893005 ) ) ( not ( = ?auto_892993 ?auto_892994 ) ) ( not ( = ?auto_892993 ?auto_892995 ) ) ( not ( = ?auto_892993 ?auto_892996 ) ) ( not ( = ?auto_892993 ?auto_892997 ) ) ( not ( = ?auto_892993 ?auto_892998 ) ) ( not ( = ?auto_892993 ?auto_892999 ) ) ( not ( = ?auto_892993 ?auto_893000 ) ) ( not ( = ?auto_892993 ?auto_893001 ) ) ( not ( = ?auto_892993 ?auto_893002 ) ) ( not ( = ?auto_892993 ?auto_893003 ) ) ( not ( = ?auto_892993 ?auto_893004 ) ) ( not ( = ?auto_892993 ?auto_893005 ) ) ( not ( = ?auto_892994 ?auto_892995 ) ) ( not ( = ?auto_892994 ?auto_892996 ) ) ( not ( = ?auto_892994 ?auto_892997 ) ) ( not ( = ?auto_892994 ?auto_892998 ) ) ( not ( = ?auto_892994 ?auto_892999 ) ) ( not ( = ?auto_892994 ?auto_893000 ) ) ( not ( = ?auto_892994 ?auto_893001 ) ) ( not ( = ?auto_892994 ?auto_893002 ) ) ( not ( = ?auto_892994 ?auto_893003 ) ) ( not ( = ?auto_892994 ?auto_893004 ) ) ( not ( = ?auto_892994 ?auto_893005 ) ) ( not ( = ?auto_892995 ?auto_892996 ) ) ( not ( = ?auto_892995 ?auto_892997 ) ) ( not ( = ?auto_892995 ?auto_892998 ) ) ( not ( = ?auto_892995 ?auto_892999 ) ) ( not ( = ?auto_892995 ?auto_893000 ) ) ( not ( = ?auto_892995 ?auto_893001 ) ) ( not ( = ?auto_892995 ?auto_893002 ) ) ( not ( = ?auto_892995 ?auto_893003 ) ) ( not ( = ?auto_892995 ?auto_893004 ) ) ( not ( = ?auto_892995 ?auto_893005 ) ) ( not ( = ?auto_892996 ?auto_892997 ) ) ( not ( = ?auto_892996 ?auto_892998 ) ) ( not ( = ?auto_892996 ?auto_892999 ) ) ( not ( = ?auto_892996 ?auto_893000 ) ) ( not ( = ?auto_892996 ?auto_893001 ) ) ( not ( = ?auto_892996 ?auto_893002 ) ) ( not ( = ?auto_892996 ?auto_893003 ) ) ( not ( = ?auto_892996 ?auto_893004 ) ) ( not ( = ?auto_892996 ?auto_893005 ) ) ( not ( = ?auto_892997 ?auto_892998 ) ) ( not ( = ?auto_892997 ?auto_892999 ) ) ( not ( = ?auto_892997 ?auto_893000 ) ) ( not ( = ?auto_892997 ?auto_893001 ) ) ( not ( = ?auto_892997 ?auto_893002 ) ) ( not ( = ?auto_892997 ?auto_893003 ) ) ( not ( = ?auto_892997 ?auto_893004 ) ) ( not ( = ?auto_892997 ?auto_893005 ) ) ( not ( = ?auto_892998 ?auto_892999 ) ) ( not ( = ?auto_892998 ?auto_893000 ) ) ( not ( = ?auto_892998 ?auto_893001 ) ) ( not ( = ?auto_892998 ?auto_893002 ) ) ( not ( = ?auto_892998 ?auto_893003 ) ) ( not ( = ?auto_892998 ?auto_893004 ) ) ( not ( = ?auto_892998 ?auto_893005 ) ) ( not ( = ?auto_892999 ?auto_893000 ) ) ( not ( = ?auto_892999 ?auto_893001 ) ) ( not ( = ?auto_892999 ?auto_893002 ) ) ( not ( = ?auto_892999 ?auto_893003 ) ) ( not ( = ?auto_892999 ?auto_893004 ) ) ( not ( = ?auto_892999 ?auto_893005 ) ) ( not ( = ?auto_893000 ?auto_893001 ) ) ( not ( = ?auto_893000 ?auto_893002 ) ) ( not ( = ?auto_893000 ?auto_893003 ) ) ( not ( = ?auto_893000 ?auto_893004 ) ) ( not ( = ?auto_893000 ?auto_893005 ) ) ( not ( = ?auto_893001 ?auto_893002 ) ) ( not ( = ?auto_893001 ?auto_893003 ) ) ( not ( = ?auto_893001 ?auto_893004 ) ) ( not ( = ?auto_893001 ?auto_893005 ) ) ( not ( = ?auto_893002 ?auto_893003 ) ) ( not ( = ?auto_893002 ?auto_893004 ) ) ( not ( = ?auto_893002 ?auto_893005 ) ) ( not ( = ?auto_893003 ?auto_893004 ) ) ( not ( = ?auto_893003 ?auto_893005 ) ) ( not ( = ?auto_893004 ?auto_893005 ) ) ( ON ?auto_893003 ?auto_893004 ) ( ON ?auto_893002 ?auto_893003 ) ( ON ?auto_893001 ?auto_893002 ) ( ON ?auto_893000 ?auto_893001 ) ( CLEAR ?auto_892998 ) ( ON ?auto_892999 ?auto_893000 ) ( CLEAR ?auto_892999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_892991 ?auto_892992 ?auto_892993 ?auto_892994 ?auto_892995 ?auto_892996 ?auto_892997 ?auto_892998 ?auto_892999 )
      ( MAKE-14PILE ?auto_892991 ?auto_892992 ?auto_892993 ?auto_892994 ?auto_892995 ?auto_892996 ?auto_892997 ?auto_892998 ?auto_892999 ?auto_893000 ?auto_893001 ?auto_893002 ?auto_893003 ?auto_893004 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893049 - BLOCK
      ?auto_893050 - BLOCK
      ?auto_893051 - BLOCK
      ?auto_893052 - BLOCK
      ?auto_893053 - BLOCK
      ?auto_893054 - BLOCK
      ?auto_893055 - BLOCK
      ?auto_893056 - BLOCK
      ?auto_893057 - BLOCK
      ?auto_893058 - BLOCK
      ?auto_893059 - BLOCK
      ?auto_893060 - BLOCK
      ?auto_893061 - BLOCK
      ?auto_893062 - BLOCK
    )
    :vars
    (
      ?auto_893063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893062 ?auto_893063 ) ( ON-TABLE ?auto_893049 ) ( ON ?auto_893050 ?auto_893049 ) ( ON ?auto_893051 ?auto_893050 ) ( ON ?auto_893052 ?auto_893051 ) ( ON ?auto_893053 ?auto_893052 ) ( ON ?auto_893054 ?auto_893053 ) ( ON ?auto_893055 ?auto_893054 ) ( not ( = ?auto_893049 ?auto_893050 ) ) ( not ( = ?auto_893049 ?auto_893051 ) ) ( not ( = ?auto_893049 ?auto_893052 ) ) ( not ( = ?auto_893049 ?auto_893053 ) ) ( not ( = ?auto_893049 ?auto_893054 ) ) ( not ( = ?auto_893049 ?auto_893055 ) ) ( not ( = ?auto_893049 ?auto_893056 ) ) ( not ( = ?auto_893049 ?auto_893057 ) ) ( not ( = ?auto_893049 ?auto_893058 ) ) ( not ( = ?auto_893049 ?auto_893059 ) ) ( not ( = ?auto_893049 ?auto_893060 ) ) ( not ( = ?auto_893049 ?auto_893061 ) ) ( not ( = ?auto_893049 ?auto_893062 ) ) ( not ( = ?auto_893049 ?auto_893063 ) ) ( not ( = ?auto_893050 ?auto_893051 ) ) ( not ( = ?auto_893050 ?auto_893052 ) ) ( not ( = ?auto_893050 ?auto_893053 ) ) ( not ( = ?auto_893050 ?auto_893054 ) ) ( not ( = ?auto_893050 ?auto_893055 ) ) ( not ( = ?auto_893050 ?auto_893056 ) ) ( not ( = ?auto_893050 ?auto_893057 ) ) ( not ( = ?auto_893050 ?auto_893058 ) ) ( not ( = ?auto_893050 ?auto_893059 ) ) ( not ( = ?auto_893050 ?auto_893060 ) ) ( not ( = ?auto_893050 ?auto_893061 ) ) ( not ( = ?auto_893050 ?auto_893062 ) ) ( not ( = ?auto_893050 ?auto_893063 ) ) ( not ( = ?auto_893051 ?auto_893052 ) ) ( not ( = ?auto_893051 ?auto_893053 ) ) ( not ( = ?auto_893051 ?auto_893054 ) ) ( not ( = ?auto_893051 ?auto_893055 ) ) ( not ( = ?auto_893051 ?auto_893056 ) ) ( not ( = ?auto_893051 ?auto_893057 ) ) ( not ( = ?auto_893051 ?auto_893058 ) ) ( not ( = ?auto_893051 ?auto_893059 ) ) ( not ( = ?auto_893051 ?auto_893060 ) ) ( not ( = ?auto_893051 ?auto_893061 ) ) ( not ( = ?auto_893051 ?auto_893062 ) ) ( not ( = ?auto_893051 ?auto_893063 ) ) ( not ( = ?auto_893052 ?auto_893053 ) ) ( not ( = ?auto_893052 ?auto_893054 ) ) ( not ( = ?auto_893052 ?auto_893055 ) ) ( not ( = ?auto_893052 ?auto_893056 ) ) ( not ( = ?auto_893052 ?auto_893057 ) ) ( not ( = ?auto_893052 ?auto_893058 ) ) ( not ( = ?auto_893052 ?auto_893059 ) ) ( not ( = ?auto_893052 ?auto_893060 ) ) ( not ( = ?auto_893052 ?auto_893061 ) ) ( not ( = ?auto_893052 ?auto_893062 ) ) ( not ( = ?auto_893052 ?auto_893063 ) ) ( not ( = ?auto_893053 ?auto_893054 ) ) ( not ( = ?auto_893053 ?auto_893055 ) ) ( not ( = ?auto_893053 ?auto_893056 ) ) ( not ( = ?auto_893053 ?auto_893057 ) ) ( not ( = ?auto_893053 ?auto_893058 ) ) ( not ( = ?auto_893053 ?auto_893059 ) ) ( not ( = ?auto_893053 ?auto_893060 ) ) ( not ( = ?auto_893053 ?auto_893061 ) ) ( not ( = ?auto_893053 ?auto_893062 ) ) ( not ( = ?auto_893053 ?auto_893063 ) ) ( not ( = ?auto_893054 ?auto_893055 ) ) ( not ( = ?auto_893054 ?auto_893056 ) ) ( not ( = ?auto_893054 ?auto_893057 ) ) ( not ( = ?auto_893054 ?auto_893058 ) ) ( not ( = ?auto_893054 ?auto_893059 ) ) ( not ( = ?auto_893054 ?auto_893060 ) ) ( not ( = ?auto_893054 ?auto_893061 ) ) ( not ( = ?auto_893054 ?auto_893062 ) ) ( not ( = ?auto_893054 ?auto_893063 ) ) ( not ( = ?auto_893055 ?auto_893056 ) ) ( not ( = ?auto_893055 ?auto_893057 ) ) ( not ( = ?auto_893055 ?auto_893058 ) ) ( not ( = ?auto_893055 ?auto_893059 ) ) ( not ( = ?auto_893055 ?auto_893060 ) ) ( not ( = ?auto_893055 ?auto_893061 ) ) ( not ( = ?auto_893055 ?auto_893062 ) ) ( not ( = ?auto_893055 ?auto_893063 ) ) ( not ( = ?auto_893056 ?auto_893057 ) ) ( not ( = ?auto_893056 ?auto_893058 ) ) ( not ( = ?auto_893056 ?auto_893059 ) ) ( not ( = ?auto_893056 ?auto_893060 ) ) ( not ( = ?auto_893056 ?auto_893061 ) ) ( not ( = ?auto_893056 ?auto_893062 ) ) ( not ( = ?auto_893056 ?auto_893063 ) ) ( not ( = ?auto_893057 ?auto_893058 ) ) ( not ( = ?auto_893057 ?auto_893059 ) ) ( not ( = ?auto_893057 ?auto_893060 ) ) ( not ( = ?auto_893057 ?auto_893061 ) ) ( not ( = ?auto_893057 ?auto_893062 ) ) ( not ( = ?auto_893057 ?auto_893063 ) ) ( not ( = ?auto_893058 ?auto_893059 ) ) ( not ( = ?auto_893058 ?auto_893060 ) ) ( not ( = ?auto_893058 ?auto_893061 ) ) ( not ( = ?auto_893058 ?auto_893062 ) ) ( not ( = ?auto_893058 ?auto_893063 ) ) ( not ( = ?auto_893059 ?auto_893060 ) ) ( not ( = ?auto_893059 ?auto_893061 ) ) ( not ( = ?auto_893059 ?auto_893062 ) ) ( not ( = ?auto_893059 ?auto_893063 ) ) ( not ( = ?auto_893060 ?auto_893061 ) ) ( not ( = ?auto_893060 ?auto_893062 ) ) ( not ( = ?auto_893060 ?auto_893063 ) ) ( not ( = ?auto_893061 ?auto_893062 ) ) ( not ( = ?auto_893061 ?auto_893063 ) ) ( not ( = ?auto_893062 ?auto_893063 ) ) ( ON ?auto_893061 ?auto_893062 ) ( ON ?auto_893060 ?auto_893061 ) ( ON ?auto_893059 ?auto_893060 ) ( ON ?auto_893058 ?auto_893059 ) ( ON ?auto_893057 ?auto_893058 ) ( CLEAR ?auto_893055 ) ( ON ?auto_893056 ?auto_893057 ) ( CLEAR ?auto_893056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_893049 ?auto_893050 ?auto_893051 ?auto_893052 ?auto_893053 ?auto_893054 ?auto_893055 ?auto_893056 )
      ( MAKE-14PILE ?auto_893049 ?auto_893050 ?auto_893051 ?auto_893052 ?auto_893053 ?auto_893054 ?auto_893055 ?auto_893056 ?auto_893057 ?auto_893058 ?auto_893059 ?auto_893060 ?auto_893061 ?auto_893062 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893107 - BLOCK
      ?auto_893108 - BLOCK
      ?auto_893109 - BLOCK
      ?auto_893110 - BLOCK
      ?auto_893111 - BLOCK
      ?auto_893112 - BLOCK
      ?auto_893113 - BLOCK
      ?auto_893114 - BLOCK
      ?auto_893115 - BLOCK
      ?auto_893116 - BLOCK
      ?auto_893117 - BLOCK
      ?auto_893118 - BLOCK
      ?auto_893119 - BLOCK
      ?auto_893120 - BLOCK
    )
    :vars
    (
      ?auto_893121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893120 ?auto_893121 ) ( ON-TABLE ?auto_893107 ) ( ON ?auto_893108 ?auto_893107 ) ( ON ?auto_893109 ?auto_893108 ) ( ON ?auto_893110 ?auto_893109 ) ( ON ?auto_893111 ?auto_893110 ) ( ON ?auto_893112 ?auto_893111 ) ( not ( = ?auto_893107 ?auto_893108 ) ) ( not ( = ?auto_893107 ?auto_893109 ) ) ( not ( = ?auto_893107 ?auto_893110 ) ) ( not ( = ?auto_893107 ?auto_893111 ) ) ( not ( = ?auto_893107 ?auto_893112 ) ) ( not ( = ?auto_893107 ?auto_893113 ) ) ( not ( = ?auto_893107 ?auto_893114 ) ) ( not ( = ?auto_893107 ?auto_893115 ) ) ( not ( = ?auto_893107 ?auto_893116 ) ) ( not ( = ?auto_893107 ?auto_893117 ) ) ( not ( = ?auto_893107 ?auto_893118 ) ) ( not ( = ?auto_893107 ?auto_893119 ) ) ( not ( = ?auto_893107 ?auto_893120 ) ) ( not ( = ?auto_893107 ?auto_893121 ) ) ( not ( = ?auto_893108 ?auto_893109 ) ) ( not ( = ?auto_893108 ?auto_893110 ) ) ( not ( = ?auto_893108 ?auto_893111 ) ) ( not ( = ?auto_893108 ?auto_893112 ) ) ( not ( = ?auto_893108 ?auto_893113 ) ) ( not ( = ?auto_893108 ?auto_893114 ) ) ( not ( = ?auto_893108 ?auto_893115 ) ) ( not ( = ?auto_893108 ?auto_893116 ) ) ( not ( = ?auto_893108 ?auto_893117 ) ) ( not ( = ?auto_893108 ?auto_893118 ) ) ( not ( = ?auto_893108 ?auto_893119 ) ) ( not ( = ?auto_893108 ?auto_893120 ) ) ( not ( = ?auto_893108 ?auto_893121 ) ) ( not ( = ?auto_893109 ?auto_893110 ) ) ( not ( = ?auto_893109 ?auto_893111 ) ) ( not ( = ?auto_893109 ?auto_893112 ) ) ( not ( = ?auto_893109 ?auto_893113 ) ) ( not ( = ?auto_893109 ?auto_893114 ) ) ( not ( = ?auto_893109 ?auto_893115 ) ) ( not ( = ?auto_893109 ?auto_893116 ) ) ( not ( = ?auto_893109 ?auto_893117 ) ) ( not ( = ?auto_893109 ?auto_893118 ) ) ( not ( = ?auto_893109 ?auto_893119 ) ) ( not ( = ?auto_893109 ?auto_893120 ) ) ( not ( = ?auto_893109 ?auto_893121 ) ) ( not ( = ?auto_893110 ?auto_893111 ) ) ( not ( = ?auto_893110 ?auto_893112 ) ) ( not ( = ?auto_893110 ?auto_893113 ) ) ( not ( = ?auto_893110 ?auto_893114 ) ) ( not ( = ?auto_893110 ?auto_893115 ) ) ( not ( = ?auto_893110 ?auto_893116 ) ) ( not ( = ?auto_893110 ?auto_893117 ) ) ( not ( = ?auto_893110 ?auto_893118 ) ) ( not ( = ?auto_893110 ?auto_893119 ) ) ( not ( = ?auto_893110 ?auto_893120 ) ) ( not ( = ?auto_893110 ?auto_893121 ) ) ( not ( = ?auto_893111 ?auto_893112 ) ) ( not ( = ?auto_893111 ?auto_893113 ) ) ( not ( = ?auto_893111 ?auto_893114 ) ) ( not ( = ?auto_893111 ?auto_893115 ) ) ( not ( = ?auto_893111 ?auto_893116 ) ) ( not ( = ?auto_893111 ?auto_893117 ) ) ( not ( = ?auto_893111 ?auto_893118 ) ) ( not ( = ?auto_893111 ?auto_893119 ) ) ( not ( = ?auto_893111 ?auto_893120 ) ) ( not ( = ?auto_893111 ?auto_893121 ) ) ( not ( = ?auto_893112 ?auto_893113 ) ) ( not ( = ?auto_893112 ?auto_893114 ) ) ( not ( = ?auto_893112 ?auto_893115 ) ) ( not ( = ?auto_893112 ?auto_893116 ) ) ( not ( = ?auto_893112 ?auto_893117 ) ) ( not ( = ?auto_893112 ?auto_893118 ) ) ( not ( = ?auto_893112 ?auto_893119 ) ) ( not ( = ?auto_893112 ?auto_893120 ) ) ( not ( = ?auto_893112 ?auto_893121 ) ) ( not ( = ?auto_893113 ?auto_893114 ) ) ( not ( = ?auto_893113 ?auto_893115 ) ) ( not ( = ?auto_893113 ?auto_893116 ) ) ( not ( = ?auto_893113 ?auto_893117 ) ) ( not ( = ?auto_893113 ?auto_893118 ) ) ( not ( = ?auto_893113 ?auto_893119 ) ) ( not ( = ?auto_893113 ?auto_893120 ) ) ( not ( = ?auto_893113 ?auto_893121 ) ) ( not ( = ?auto_893114 ?auto_893115 ) ) ( not ( = ?auto_893114 ?auto_893116 ) ) ( not ( = ?auto_893114 ?auto_893117 ) ) ( not ( = ?auto_893114 ?auto_893118 ) ) ( not ( = ?auto_893114 ?auto_893119 ) ) ( not ( = ?auto_893114 ?auto_893120 ) ) ( not ( = ?auto_893114 ?auto_893121 ) ) ( not ( = ?auto_893115 ?auto_893116 ) ) ( not ( = ?auto_893115 ?auto_893117 ) ) ( not ( = ?auto_893115 ?auto_893118 ) ) ( not ( = ?auto_893115 ?auto_893119 ) ) ( not ( = ?auto_893115 ?auto_893120 ) ) ( not ( = ?auto_893115 ?auto_893121 ) ) ( not ( = ?auto_893116 ?auto_893117 ) ) ( not ( = ?auto_893116 ?auto_893118 ) ) ( not ( = ?auto_893116 ?auto_893119 ) ) ( not ( = ?auto_893116 ?auto_893120 ) ) ( not ( = ?auto_893116 ?auto_893121 ) ) ( not ( = ?auto_893117 ?auto_893118 ) ) ( not ( = ?auto_893117 ?auto_893119 ) ) ( not ( = ?auto_893117 ?auto_893120 ) ) ( not ( = ?auto_893117 ?auto_893121 ) ) ( not ( = ?auto_893118 ?auto_893119 ) ) ( not ( = ?auto_893118 ?auto_893120 ) ) ( not ( = ?auto_893118 ?auto_893121 ) ) ( not ( = ?auto_893119 ?auto_893120 ) ) ( not ( = ?auto_893119 ?auto_893121 ) ) ( not ( = ?auto_893120 ?auto_893121 ) ) ( ON ?auto_893119 ?auto_893120 ) ( ON ?auto_893118 ?auto_893119 ) ( ON ?auto_893117 ?auto_893118 ) ( ON ?auto_893116 ?auto_893117 ) ( ON ?auto_893115 ?auto_893116 ) ( ON ?auto_893114 ?auto_893115 ) ( CLEAR ?auto_893112 ) ( ON ?auto_893113 ?auto_893114 ) ( CLEAR ?auto_893113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_893107 ?auto_893108 ?auto_893109 ?auto_893110 ?auto_893111 ?auto_893112 ?auto_893113 )
      ( MAKE-14PILE ?auto_893107 ?auto_893108 ?auto_893109 ?auto_893110 ?auto_893111 ?auto_893112 ?auto_893113 ?auto_893114 ?auto_893115 ?auto_893116 ?auto_893117 ?auto_893118 ?auto_893119 ?auto_893120 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893165 - BLOCK
      ?auto_893166 - BLOCK
      ?auto_893167 - BLOCK
      ?auto_893168 - BLOCK
      ?auto_893169 - BLOCK
      ?auto_893170 - BLOCK
      ?auto_893171 - BLOCK
      ?auto_893172 - BLOCK
      ?auto_893173 - BLOCK
      ?auto_893174 - BLOCK
      ?auto_893175 - BLOCK
      ?auto_893176 - BLOCK
      ?auto_893177 - BLOCK
      ?auto_893178 - BLOCK
    )
    :vars
    (
      ?auto_893179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893178 ?auto_893179 ) ( ON-TABLE ?auto_893165 ) ( ON ?auto_893166 ?auto_893165 ) ( ON ?auto_893167 ?auto_893166 ) ( ON ?auto_893168 ?auto_893167 ) ( ON ?auto_893169 ?auto_893168 ) ( not ( = ?auto_893165 ?auto_893166 ) ) ( not ( = ?auto_893165 ?auto_893167 ) ) ( not ( = ?auto_893165 ?auto_893168 ) ) ( not ( = ?auto_893165 ?auto_893169 ) ) ( not ( = ?auto_893165 ?auto_893170 ) ) ( not ( = ?auto_893165 ?auto_893171 ) ) ( not ( = ?auto_893165 ?auto_893172 ) ) ( not ( = ?auto_893165 ?auto_893173 ) ) ( not ( = ?auto_893165 ?auto_893174 ) ) ( not ( = ?auto_893165 ?auto_893175 ) ) ( not ( = ?auto_893165 ?auto_893176 ) ) ( not ( = ?auto_893165 ?auto_893177 ) ) ( not ( = ?auto_893165 ?auto_893178 ) ) ( not ( = ?auto_893165 ?auto_893179 ) ) ( not ( = ?auto_893166 ?auto_893167 ) ) ( not ( = ?auto_893166 ?auto_893168 ) ) ( not ( = ?auto_893166 ?auto_893169 ) ) ( not ( = ?auto_893166 ?auto_893170 ) ) ( not ( = ?auto_893166 ?auto_893171 ) ) ( not ( = ?auto_893166 ?auto_893172 ) ) ( not ( = ?auto_893166 ?auto_893173 ) ) ( not ( = ?auto_893166 ?auto_893174 ) ) ( not ( = ?auto_893166 ?auto_893175 ) ) ( not ( = ?auto_893166 ?auto_893176 ) ) ( not ( = ?auto_893166 ?auto_893177 ) ) ( not ( = ?auto_893166 ?auto_893178 ) ) ( not ( = ?auto_893166 ?auto_893179 ) ) ( not ( = ?auto_893167 ?auto_893168 ) ) ( not ( = ?auto_893167 ?auto_893169 ) ) ( not ( = ?auto_893167 ?auto_893170 ) ) ( not ( = ?auto_893167 ?auto_893171 ) ) ( not ( = ?auto_893167 ?auto_893172 ) ) ( not ( = ?auto_893167 ?auto_893173 ) ) ( not ( = ?auto_893167 ?auto_893174 ) ) ( not ( = ?auto_893167 ?auto_893175 ) ) ( not ( = ?auto_893167 ?auto_893176 ) ) ( not ( = ?auto_893167 ?auto_893177 ) ) ( not ( = ?auto_893167 ?auto_893178 ) ) ( not ( = ?auto_893167 ?auto_893179 ) ) ( not ( = ?auto_893168 ?auto_893169 ) ) ( not ( = ?auto_893168 ?auto_893170 ) ) ( not ( = ?auto_893168 ?auto_893171 ) ) ( not ( = ?auto_893168 ?auto_893172 ) ) ( not ( = ?auto_893168 ?auto_893173 ) ) ( not ( = ?auto_893168 ?auto_893174 ) ) ( not ( = ?auto_893168 ?auto_893175 ) ) ( not ( = ?auto_893168 ?auto_893176 ) ) ( not ( = ?auto_893168 ?auto_893177 ) ) ( not ( = ?auto_893168 ?auto_893178 ) ) ( not ( = ?auto_893168 ?auto_893179 ) ) ( not ( = ?auto_893169 ?auto_893170 ) ) ( not ( = ?auto_893169 ?auto_893171 ) ) ( not ( = ?auto_893169 ?auto_893172 ) ) ( not ( = ?auto_893169 ?auto_893173 ) ) ( not ( = ?auto_893169 ?auto_893174 ) ) ( not ( = ?auto_893169 ?auto_893175 ) ) ( not ( = ?auto_893169 ?auto_893176 ) ) ( not ( = ?auto_893169 ?auto_893177 ) ) ( not ( = ?auto_893169 ?auto_893178 ) ) ( not ( = ?auto_893169 ?auto_893179 ) ) ( not ( = ?auto_893170 ?auto_893171 ) ) ( not ( = ?auto_893170 ?auto_893172 ) ) ( not ( = ?auto_893170 ?auto_893173 ) ) ( not ( = ?auto_893170 ?auto_893174 ) ) ( not ( = ?auto_893170 ?auto_893175 ) ) ( not ( = ?auto_893170 ?auto_893176 ) ) ( not ( = ?auto_893170 ?auto_893177 ) ) ( not ( = ?auto_893170 ?auto_893178 ) ) ( not ( = ?auto_893170 ?auto_893179 ) ) ( not ( = ?auto_893171 ?auto_893172 ) ) ( not ( = ?auto_893171 ?auto_893173 ) ) ( not ( = ?auto_893171 ?auto_893174 ) ) ( not ( = ?auto_893171 ?auto_893175 ) ) ( not ( = ?auto_893171 ?auto_893176 ) ) ( not ( = ?auto_893171 ?auto_893177 ) ) ( not ( = ?auto_893171 ?auto_893178 ) ) ( not ( = ?auto_893171 ?auto_893179 ) ) ( not ( = ?auto_893172 ?auto_893173 ) ) ( not ( = ?auto_893172 ?auto_893174 ) ) ( not ( = ?auto_893172 ?auto_893175 ) ) ( not ( = ?auto_893172 ?auto_893176 ) ) ( not ( = ?auto_893172 ?auto_893177 ) ) ( not ( = ?auto_893172 ?auto_893178 ) ) ( not ( = ?auto_893172 ?auto_893179 ) ) ( not ( = ?auto_893173 ?auto_893174 ) ) ( not ( = ?auto_893173 ?auto_893175 ) ) ( not ( = ?auto_893173 ?auto_893176 ) ) ( not ( = ?auto_893173 ?auto_893177 ) ) ( not ( = ?auto_893173 ?auto_893178 ) ) ( not ( = ?auto_893173 ?auto_893179 ) ) ( not ( = ?auto_893174 ?auto_893175 ) ) ( not ( = ?auto_893174 ?auto_893176 ) ) ( not ( = ?auto_893174 ?auto_893177 ) ) ( not ( = ?auto_893174 ?auto_893178 ) ) ( not ( = ?auto_893174 ?auto_893179 ) ) ( not ( = ?auto_893175 ?auto_893176 ) ) ( not ( = ?auto_893175 ?auto_893177 ) ) ( not ( = ?auto_893175 ?auto_893178 ) ) ( not ( = ?auto_893175 ?auto_893179 ) ) ( not ( = ?auto_893176 ?auto_893177 ) ) ( not ( = ?auto_893176 ?auto_893178 ) ) ( not ( = ?auto_893176 ?auto_893179 ) ) ( not ( = ?auto_893177 ?auto_893178 ) ) ( not ( = ?auto_893177 ?auto_893179 ) ) ( not ( = ?auto_893178 ?auto_893179 ) ) ( ON ?auto_893177 ?auto_893178 ) ( ON ?auto_893176 ?auto_893177 ) ( ON ?auto_893175 ?auto_893176 ) ( ON ?auto_893174 ?auto_893175 ) ( ON ?auto_893173 ?auto_893174 ) ( ON ?auto_893172 ?auto_893173 ) ( ON ?auto_893171 ?auto_893172 ) ( CLEAR ?auto_893169 ) ( ON ?auto_893170 ?auto_893171 ) ( CLEAR ?auto_893170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_893165 ?auto_893166 ?auto_893167 ?auto_893168 ?auto_893169 ?auto_893170 )
      ( MAKE-14PILE ?auto_893165 ?auto_893166 ?auto_893167 ?auto_893168 ?auto_893169 ?auto_893170 ?auto_893171 ?auto_893172 ?auto_893173 ?auto_893174 ?auto_893175 ?auto_893176 ?auto_893177 ?auto_893178 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893223 - BLOCK
      ?auto_893224 - BLOCK
      ?auto_893225 - BLOCK
      ?auto_893226 - BLOCK
      ?auto_893227 - BLOCK
      ?auto_893228 - BLOCK
      ?auto_893229 - BLOCK
      ?auto_893230 - BLOCK
      ?auto_893231 - BLOCK
      ?auto_893232 - BLOCK
      ?auto_893233 - BLOCK
      ?auto_893234 - BLOCK
      ?auto_893235 - BLOCK
      ?auto_893236 - BLOCK
    )
    :vars
    (
      ?auto_893237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893236 ?auto_893237 ) ( ON-TABLE ?auto_893223 ) ( ON ?auto_893224 ?auto_893223 ) ( ON ?auto_893225 ?auto_893224 ) ( ON ?auto_893226 ?auto_893225 ) ( not ( = ?auto_893223 ?auto_893224 ) ) ( not ( = ?auto_893223 ?auto_893225 ) ) ( not ( = ?auto_893223 ?auto_893226 ) ) ( not ( = ?auto_893223 ?auto_893227 ) ) ( not ( = ?auto_893223 ?auto_893228 ) ) ( not ( = ?auto_893223 ?auto_893229 ) ) ( not ( = ?auto_893223 ?auto_893230 ) ) ( not ( = ?auto_893223 ?auto_893231 ) ) ( not ( = ?auto_893223 ?auto_893232 ) ) ( not ( = ?auto_893223 ?auto_893233 ) ) ( not ( = ?auto_893223 ?auto_893234 ) ) ( not ( = ?auto_893223 ?auto_893235 ) ) ( not ( = ?auto_893223 ?auto_893236 ) ) ( not ( = ?auto_893223 ?auto_893237 ) ) ( not ( = ?auto_893224 ?auto_893225 ) ) ( not ( = ?auto_893224 ?auto_893226 ) ) ( not ( = ?auto_893224 ?auto_893227 ) ) ( not ( = ?auto_893224 ?auto_893228 ) ) ( not ( = ?auto_893224 ?auto_893229 ) ) ( not ( = ?auto_893224 ?auto_893230 ) ) ( not ( = ?auto_893224 ?auto_893231 ) ) ( not ( = ?auto_893224 ?auto_893232 ) ) ( not ( = ?auto_893224 ?auto_893233 ) ) ( not ( = ?auto_893224 ?auto_893234 ) ) ( not ( = ?auto_893224 ?auto_893235 ) ) ( not ( = ?auto_893224 ?auto_893236 ) ) ( not ( = ?auto_893224 ?auto_893237 ) ) ( not ( = ?auto_893225 ?auto_893226 ) ) ( not ( = ?auto_893225 ?auto_893227 ) ) ( not ( = ?auto_893225 ?auto_893228 ) ) ( not ( = ?auto_893225 ?auto_893229 ) ) ( not ( = ?auto_893225 ?auto_893230 ) ) ( not ( = ?auto_893225 ?auto_893231 ) ) ( not ( = ?auto_893225 ?auto_893232 ) ) ( not ( = ?auto_893225 ?auto_893233 ) ) ( not ( = ?auto_893225 ?auto_893234 ) ) ( not ( = ?auto_893225 ?auto_893235 ) ) ( not ( = ?auto_893225 ?auto_893236 ) ) ( not ( = ?auto_893225 ?auto_893237 ) ) ( not ( = ?auto_893226 ?auto_893227 ) ) ( not ( = ?auto_893226 ?auto_893228 ) ) ( not ( = ?auto_893226 ?auto_893229 ) ) ( not ( = ?auto_893226 ?auto_893230 ) ) ( not ( = ?auto_893226 ?auto_893231 ) ) ( not ( = ?auto_893226 ?auto_893232 ) ) ( not ( = ?auto_893226 ?auto_893233 ) ) ( not ( = ?auto_893226 ?auto_893234 ) ) ( not ( = ?auto_893226 ?auto_893235 ) ) ( not ( = ?auto_893226 ?auto_893236 ) ) ( not ( = ?auto_893226 ?auto_893237 ) ) ( not ( = ?auto_893227 ?auto_893228 ) ) ( not ( = ?auto_893227 ?auto_893229 ) ) ( not ( = ?auto_893227 ?auto_893230 ) ) ( not ( = ?auto_893227 ?auto_893231 ) ) ( not ( = ?auto_893227 ?auto_893232 ) ) ( not ( = ?auto_893227 ?auto_893233 ) ) ( not ( = ?auto_893227 ?auto_893234 ) ) ( not ( = ?auto_893227 ?auto_893235 ) ) ( not ( = ?auto_893227 ?auto_893236 ) ) ( not ( = ?auto_893227 ?auto_893237 ) ) ( not ( = ?auto_893228 ?auto_893229 ) ) ( not ( = ?auto_893228 ?auto_893230 ) ) ( not ( = ?auto_893228 ?auto_893231 ) ) ( not ( = ?auto_893228 ?auto_893232 ) ) ( not ( = ?auto_893228 ?auto_893233 ) ) ( not ( = ?auto_893228 ?auto_893234 ) ) ( not ( = ?auto_893228 ?auto_893235 ) ) ( not ( = ?auto_893228 ?auto_893236 ) ) ( not ( = ?auto_893228 ?auto_893237 ) ) ( not ( = ?auto_893229 ?auto_893230 ) ) ( not ( = ?auto_893229 ?auto_893231 ) ) ( not ( = ?auto_893229 ?auto_893232 ) ) ( not ( = ?auto_893229 ?auto_893233 ) ) ( not ( = ?auto_893229 ?auto_893234 ) ) ( not ( = ?auto_893229 ?auto_893235 ) ) ( not ( = ?auto_893229 ?auto_893236 ) ) ( not ( = ?auto_893229 ?auto_893237 ) ) ( not ( = ?auto_893230 ?auto_893231 ) ) ( not ( = ?auto_893230 ?auto_893232 ) ) ( not ( = ?auto_893230 ?auto_893233 ) ) ( not ( = ?auto_893230 ?auto_893234 ) ) ( not ( = ?auto_893230 ?auto_893235 ) ) ( not ( = ?auto_893230 ?auto_893236 ) ) ( not ( = ?auto_893230 ?auto_893237 ) ) ( not ( = ?auto_893231 ?auto_893232 ) ) ( not ( = ?auto_893231 ?auto_893233 ) ) ( not ( = ?auto_893231 ?auto_893234 ) ) ( not ( = ?auto_893231 ?auto_893235 ) ) ( not ( = ?auto_893231 ?auto_893236 ) ) ( not ( = ?auto_893231 ?auto_893237 ) ) ( not ( = ?auto_893232 ?auto_893233 ) ) ( not ( = ?auto_893232 ?auto_893234 ) ) ( not ( = ?auto_893232 ?auto_893235 ) ) ( not ( = ?auto_893232 ?auto_893236 ) ) ( not ( = ?auto_893232 ?auto_893237 ) ) ( not ( = ?auto_893233 ?auto_893234 ) ) ( not ( = ?auto_893233 ?auto_893235 ) ) ( not ( = ?auto_893233 ?auto_893236 ) ) ( not ( = ?auto_893233 ?auto_893237 ) ) ( not ( = ?auto_893234 ?auto_893235 ) ) ( not ( = ?auto_893234 ?auto_893236 ) ) ( not ( = ?auto_893234 ?auto_893237 ) ) ( not ( = ?auto_893235 ?auto_893236 ) ) ( not ( = ?auto_893235 ?auto_893237 ) ) ( not ( = ?auto_893236 ?auto_893237 ) ) ( ON ?auto_893235 ?auto_893236 ) ( ON ?auto_893234 ?auto_893235 ) ( ON ?auto_893233 ?auto_893234 ) ( ON ?auto_893232 ?auto_893233 ) ( ON ?auto_893231 ?auto_893232 ) ( ON ?auto_893230 ?auto_893231 ) ( ON ?auto_893229 ?auto_893230 ) ( ON ?auto_893228 ?auto_893229 ) ( CLEAR ?auto_893226 ) ( ON ?auto_893227 ?auto_893228 ) ( CLEAR ?auto_893227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_893223 ?auto_893224 ?auto_893225 ?auto_893226 ?auto_893227 )
      ( MAKE-14PILE ?auto_893223 ?auto_893224 ?auto_893225 ?auto_893226 ?auto_893227 ?auto_893228 ?auto_893229 ?auto_893230 ?auto_893231 ?auto_893232 ?auto_893233 ?auto_893234 ?auto_893235 ?auto_893236 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893281 - BLOCK
      ?auto_893282 - BLOCK
      ?auto_893283 - BLOCK
      ?auto_893284 - BLOCK
      ?auto_893285 - BLOCK
      ?auto_893286 - BLOCK
      ?auto_893287 - BLOCK
      ?auto_893288 - BLOCK
      ?auto_893289 - BLOCK
      ?auto_893290 - BLOCK
      ?auto_893291 - BLOCK
      ?auto_893292 - BLOCK
      ?auto_893293 - BLOCK
      ?auto_893294 - BLOCK
    )
    :vars
    (
      ?auto_893295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893294 ?auto_893295 ) ( ON-TABLE ?auto_893281 ) ( ON ?auto_893282 ?auto_893281 ) ( ON ?auto_893283 ?auto_893282 ) ( not ( = ?auto_893281 ?auto_893282 ) ) ( not ( = ?auto_893281 ?auto_893283 ) ) ( not ( = ?auto_893281 ?auto_893284 ) ) ( not ( = ?auto_893281 ?auto_893285 ) ) ( not ( = ?auto_893281 ?auto_893286 ) ) ( not ( = ?auto_893281 ?auto_893287 ) ) ( not ( = ?auto_893281 ?auto_893288 ) ) ( not ( = ?auto_893281 ?auto_893289 ) ) ( not ( = ?auto_893281 ?auto_893290 ) ) ( not ( = ?auto_893281 ?auto_893291 ) ) ( not ( = ?auto_893281 ?auto_893292 ) ) ( not ( = ?auto_893281 ?auto_893293 ) ) ( not ( = ?auto_893281 ?auto_893294 ) ) ( not ( = ?auto_893281 ?auto_893295 ) ) ( not ( = ?auto_893282 ?auto_893283 ) ) ( not ( = ?auto_893282 ?auto_893284 ) ) ( not ( = ?auto_893282 ?auto_893285 ) ) ( not ( = ?auto_893282 ?auto_893286 ) ) ( not ( = ?auto_893282 ?auto_893287 ) ) ( not ( = ?auto_893282 ?auto_893288 ) ) ( not ( = ?auto_893282 ?auto_893289 ) ) ( not ( = ?auto_893282 ?auto_893290 ) ) ( not ( = ?auto_893282 ?auto_893291 ) ) ( not ( = ?auto_893282 ?auto_893292 ) ) ( not ( = ?auto_893282 ?auto_893293 ) ) ( not ( = ?auto_893282 ?auto_893294 ) ) ( not ( = ?auto_893282 ?auto_893295 ) ) ( not ( = ?auto_893283 ?auto_893284 ) ) ( not ( = ?auto_893283 ?auto_893285 ) ) ( not ( = ?auto_893283 ?auto_893286 ) ) ( not ( = ?auto_893283 ?auto_893287 ) ) ( not ( = ?auto_893283 ?auto_893288 ) ) ( not ( = ?auto_893283 ?auto_893289 ) ) ( not ( = ?auto_893283 ?auto_893290 ) ) ( not ( = ?auto_893283 ?auto_893291 ) ) ( not ( = ?auto_893283 ?auto_893292 ) ) ( not ( = ?auto_893283 ?auto_893293 ) ) ( not ( = ?auto_893283 ?auto_893294 ) ) ( not ( = ?auto_893283 ?auto_893295 ) ) ( not ( = ?auto_893284 ?auto_893285 ) ) ( not ( = ?auto_893284 ?auto_893286 ) ) ( not ( = ?auto_893284 ?auto_893287 ) ) ( not ( = ?auto_893284 ?auto_893288 ) ) ( not ( = ?auto_893284 ?auto_893289 ) ) ( not ( = ?auto_893284 ?auto_893290 ) ) ( not ( = ?auto_893284 ?auto_893291 ) ) ( not ( = ?auto_893284 ?auto_893292 ) ) ( not ( = ?auto_893284 ?auto_893293 ) ) ( not ( = ?auto_893284 ?auto_893294 ) ) ( not ( = ?auto_893284 ?auto_893295 ) ) ( not ( = ?auto_893285 ?auto_893286 ) ) ( not ( = ?auto_893285 ?auto_893287 ) ) ( not ( = ?auto_893285 ?auto_893288 ) ) ( not ( = ?auto_893285 ?auto_893289 ) ) ( not ( = ?auto_893285 ?auto_893290 ) ) ( not ( = ?auto_893285 ?auto_893291 ) ) ( not ( = ?auto_893285 ?auto_893292 ) ) ( not ( = ?auto_893285 ?auto_893293 ) ) ( not ( = ?auto_893285 ?auto_893294 ) ) ( not ( = ?auto_893285 ?auto_893295 ) ) ( not ( = ?auto_893286 ?auto_893287 ) ) ( not ( = ?auto_893286 ?auto_893288 ) ) ( not ( = ?auto_893286 ?auto_893289 ) ) ( not ( = ?auto_893286 ?auto_893290 ) ) ( not ( = ?auto_893286 ?auto_893291 ) ) ( not ( = ?auto_893286 ?auto_893292 ) ) ( not ( = ?auto_893286 ?auto_893293 ) ) ( not ( = ?auto_893286 ?auto_893294 ) ) ( not ( = ?auto_893286 ?auto_893295 ) ) ( not ( = ?auto_893287 ?auto_893288 ) ) ( not ( = ?auto_893287 ?auto_893289 ) ) ( not ( = ?auto_893287 ?auto_893290 ) ) ( not ( = ?auto_893287 ?auto_893291 ) ) ( not ( = ?auto_893287 ?auto_893292 ) ) ( not ( = ?auto_893287 ?auto_893293 ) ) ( not ( = ?auto_893287 ?auto_893294 ) ) ( not ( = ?auto_893287 ?auto_893295 ) ) ( not ( = ?auto_893288 ?auto_893289 ) ) ( not ( = ?auto_893288 ?auto_893290 ) ) ( not ( = ?auto_893288 ?auto_893291 ) ) ( not ( = ?auto_893288 ?auto_893292 ) ) ( not ( = ?auto_893288 ?auto_893293 ) ) ( not ( = ?auto_893288 ?auto_893294 ) ) ( not ( = ?auto_893288 ?auto_893295 ) ) ( not ( = ?auto_893289 ?auto_893290 ) ) ( not ( = ?auto_893289 ?auto_893291 ) ) ( not ( = ?auto_893289 ?auto_893292 ) ) ( not ( = ?auto_893289 ?auto_893293 ) ) ( not ( = ?auto_893289 ?auto_893294 ) ) ( not ( = ?auto_893289 ?auto_893295 ) ) ( not ( = ?auto_893290 ?auto_893291 ) ) ( not ( = ?auto_893290 ?auto_893292 ) ) ( not ( = ?auto_893290 ?auto_893293 ) ) ( not ( = ?auto_893290 ?auto_893294 ) ) ( not ( = ?auto_893290 ?auto_893295 ) ) ( not ( = ?auto_893291 ?auto_893292 ) ) ( not ( = ?auto_893291 ?auto_893293 ) ) ( not ( = ?auto_893291 ?auto_893294 ) ) ( not ( = ?auto_893291 ?auto_893295 ) ) ( not ( = ?auto_893292 ?auto_893293 ) ) ( not ( = ?auto_893292 ?auto_893294 ) ) ( not ( = ?auto_893292 ?auto_893295 ) ) ( not ( = ?auto_893293 ?auto_893294 ) ) ( not ( = ?auto_893293 ?auto_893295 ) ) ( not ( = ?auto_893294 ?auto_893295 ) ) ( ON ?auto_893293 ?auto_893294 ) ( ON ?auto_893292 ?auto_893293 ) ( ON ?auto_893291 ?auto_893292 ) ( ON ?auto_893290 ?auto_893291 ) ( ON ?auto_893289 ?auto_893290 ) ( ON ?auto_893288 ?auto_893289 ) ( ON ?auto_893287 ?auto_893288 ) ( ON ?auto_893286 ?auto_893287 ) ( ON ?auto_893285 ?auto_893286 ) ( CLEAR ?auto_893283 ) ( ON ?auto_893284 ?auto_893285 ) ( CLEAR ?auto_893284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_893281 ?auto_893282 ?auto_893283 ?auto_893284 )
      ( MAKE-14PILE ?auto_893281 ?auto_893282 ?auto_893283 ?auto_893284 ?auto_893285 ?auto_893286 ?auto_893287 ?auto_893288 ?auto_893289 ?auto_893290 ?auto_893291 ?auto_893292 ?auto_893293 ?auto_893294 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893339 - BLOCK
      ?auto_893340 - BLOCK
      ?auto_893341 - BLOCK
      ?auto_893342 - BLOCK
      ?auto_893343 - BLOCK
      ?auto_893344 - BLOCK
      ?auto_893345 - BLOCK
      ?auto_893346 - BLOCK
      ?auto_893347 - BLOCK
      ?auto_893348 - BLOCK
      ?auto_893349 - BLOCK
      ?auto_893350 - BLOCK
      ?auto_893351 - BLOCK
      ?auto_893352 - BLOCK
    )
    :vars
    (
      ?auto_893353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893352 ?auto_893353 ) ( ON-TABLE ?auto_893339 ) ( ON ?auto_893340 ?auto_893339 ) ( not ( = ?auto_893339 ?auto_893340 ) ) ( not ( = ?auto_893339 ?auto_893341 ) ) ( not ( = ?auto_893339 ?auto_893342 ) ) ( not ( = ?auto_893339 ?auto_893343 ) ) ( not ( = ?auto_893339 ?auto_893344 ) ) ( not ( = ?auto_893339 ?auto_893345 ) ) ( not ( = ?auto_893339 ?auto_893346 ) ) ( not ( = ?auto_893339 ?auto_893347 ) ) ( not ( = ?auto_893339 ?auto_893348 ) ) ( not ( = ?auto_893339 ?auto_893349 ) ) ( not ( = ?auto_893339 ?auto_893350 ) ) ( not ( = ?auto_893339 ?auto_893351 ) ) ( not ( = ?auto_893339 ?auto_893352 ) ) ( not ( = ?auto_893339 ?auto_893353 ) ) ( not ( = ?auto_893340 ?auto_893341 ) ) ( not ( = ?auto_893340 ?auto_893342 ) ) ( not ( = ?auto_893340 ?auto_893343 ) ) ( not ( = ?auto_893340 ?auto_893344 ) ) ( not ( = ?auto_893340 ?auto_893345 ) ) ( not ( = ?auto_893340 ?auto_893346 ) ) ( not ( = ?auto_893340 ?auto_893347 ) ) ( not ( = ?auto_893340 ?auto_893348 ) ) ( not ( = ?auto_893340 ?auto_893349 ) ) ( not ( = ?auto_893340 ?auto_893350 ) ) ( not ( = ?auto_893340 ?auto_893351 ) ) ( not ( = ?auto_893340 ?auto_893352 ) ) ( not ( = ?auto_893340 ?auto_893353 ) ) ( not ( = ?auto_893341 ?auto_893342 ) ) ( not ( = ?auto_893341 ?auto_893343 ) ) ( not ( = ?auto_893341 ?auto_893344 ) ) ( not ( = ?auto_893341 ?auto_893345 ) ) ( not ( = ?auto_893341 ?auto_893346 ) ) ( not ( = ?auto_893341 ?auto_893347 ) ) ( not ( = ?auto_893341 ?auto_893348 ) ) ( not ( = ?auto_893341 ?auto_893349 ) ) ( not ( = ?auto_893341 ?auto_893350 ) ) ( not ( = ?auto_893341 ?auto_893351 ) ) ( not ( = ?auto_893341 ?auto_893352 ) ) ( not ( = ?auto_893341 ?auto_893353 ) ) ( not ( = ?auto_893342 ?auto_893343 ) ) ( not ( = ?auto_893342 ?auto_893344 ) ) ( not ( = ?auto_893342 ?auto_893345 ) ) ( not ( = ?auto_893342 ?auto_893346 ) ) ( not ( = ?auto_893342 ?auto_893347 ) ) ( not ( = ?auto_893342 ?auto_893348 ) ) ( not ( = ?auto_893342 ?auto_893349 ) ) ( not ( = ?auto_893342 ?auto_893350 ) ) ( not ( = ?auto_893342 ?auto_893351 ) ) ( not ( = ?auto_893342 ?auto_893352 ) ) ( not ( = ?auto_893342 ?auto_893353 ) ) ( not ( = ?auto_893343 ?auto_893344 ) ) ( not ( = ?auto_893343 ?auto_893345 ) ) ( not ( = ?auto_893343 ?auto_893346 ) ) ( not ( = ?auto_893343 ?auto_893347 ) ) ( not ( = ?auto_893343 ?auto_893348 ) ) ( not ( = ?auto_893343 ?auto_893349 ) ) ( not ( = ?auto_893343 ?auto_893350 ) ) ( not ( = ?auto_893343 ?auto_893351 ) ) ( not ( = ?auto_893343 ?auto_893352 ) ) ( not ( = ?auto_893343 ?auto_893353 ) ) ( not ( = ?auto_893344 ?auto_893345 ) ) ( not ( = ?auto_893344 ?auto_893346 ) ) ( not ( = ?auto_893344 ?auto_893347 ) ) ( not ( = ?auto_893344 ?auto_893348 ) ) ( not ( = ?auto_893344 ?auto_893349 ) ) ( not ( = ?auto_893344 ?auto_893350 ) ) ( not ( = ?auto_893344 ?auto_893351 ) ) ( not ( = ?auto_893344 ?auto_893352 ) ) ( not ( = ?auto_893344 ?auto_893353 ) ) ( not ( = ?auto_893345 ?auto_893346 ) ) ( not ( = ?auto_893345 ?auto_893347 ) ) ( not ( = ?auto_893345 ?auto_893348 ) ) ( not ( = ?auto_893345 ?auto_893349 ) ) ( not ( = ?auto_893345 ?auto_893350 ) ) ( not ( = ?auto_893345 ?auto_893351 ) ) ( not ( = ?auto_893345 ?auto_893352 ) ) ( not ( = ?auto_893345 ?auto_893353 ) ) ( not ( = ?auto_893346 ?auto_893347 ) ) ( not ( = ?auto_893346 ?auto_893348 ) ) ( not ( = ?auto_893346 ?auto_893349 ) ) ( not ( = ?auto_893346 ?auto_893350 ) ) ( not ( = ?auto_893346 ?auto_893351 ) ) ( not ( = ?auto_893346 ?auto_893352 ) ) ( not ( = ?auto_893346 ?auto_893353 ) ) ( not ( = ?auto_893347 ?auto_893348 ) ) ( not ( = ?auto_893347 ?auto_893349 ) ) ( not ( = ?auto_893347 ?auto_893350 ) ) ( not ( = ?auto_893347 ?auto_893351 ) ) ( not ( = ?auto_893347 ?auto_893352 ) ) ( not ( = ?auto_893347 ?auto_893353 ) ) ( not ( = ?auto_893348 ?auto_893349 ) ) ( not ( = ?auto_893348 ?auto_893350 ) ) ( not ( = ?auto_893348 ?auto_893351 ) ) ( not ( = ?auto_893348 ?auto_893352 ) ) ( not ( = ?auto_893348 ?auto_893353 ) ) ( not ( = ?auto_893349 ?auto_893350 ) ) ( not ( = ?auto_893349 ?auto_893351 ) ) ( not ( = ?auto_893349 ?auto_893352 ) ) ( not ( = ?auto_893349 ?auto_893353 ) ) ( not ( = ?auto_893350 ?auto_893351 ) ) ( not ( = ?auto_893350 ?auto_893352 ) ) ( not ( = ?auto_893350 ?auto_893353 ) ) ( not ( = ?auto_893351 ?auto_893352 ) ) ( not ( = ?auto_893351 ?auto_893353 ) ) ( not ( = ?auto_893352 ?auto_893353 ) ) ( ON ?auto_893351 ?auto_893352 ) ( ON ?auto_893350 ?auto_893351 ) ( ON ?auto_893349 ?auto_893350 ) ( ON ?auto_893348 ?auto_893349 ) ( ON ?auto_893347 ?auto_893348 ) ( ON ?auto_893346 ?auto_893347 ) ( ON ?auto_893345 ?auto_893346 ) ( ON ?auto_893344 ?auto_893345 ) ( ON ?auto_893343 ?auto_893344 ) ( ON ?auto_893342 ?auto_893343 ) ( CLEAR ?auto_893340 ) ( ON ?auto_893341 ?auto_893342 ) ( CLEAR ?auto_893341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_893339 ?auto_893340 ?auto_893341 )
      ( MAKE-14PILE ?auto_893339 ?auto_893340 ?auto_893341 ?auto_893342 ?auto_893343 ?auto_893344 ?auto_893345 ?auto_893346 ?auto_893347 ?auto_893348 ?auto_893349 ?auto_893350 ?auto_893351 ?auto_893352 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893397 - BLOCK
      ?auto_893398 - BLOCK
      ?auto_893399 - BLOCK
      ?auto_893400 - BLOCK
      ?auto_893401 - BLOCK
      ?auto_893402 - BLOCK
      ?auto_893403 - BLOCK
      ?auto_893404 - BLOCK
      ?auto_893405 - BLOCK
      ?auto_893406 - BLOCK
      ?auto_893407 - BLOCK
      ?auto_893408 - BLOCK
      ?auto_893409 - BLOCK
      ?auto_893410 - BLOCK
    )
    :vars
    (
      ?auto_893411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893410 ?auto_893411 ) ( ON-TABLE ?auto_893397 ) ( not ( = ?auto_893397 ?auto_893398 ) ) ( not ( = ?auto_893397 ?auto_893399 ) ) ( not ( = ?auto_893397 ?auto_893400 ) ) ( not ( = ?auto_893397 ?auto_893401 ) ) ( not ( = ?auto_893397 ?auto_893402 ) ) ( not ( = ?auto_893397 ?auto_893403 ) ) ( not ( = ?auto_893397 ?auto_893404 ) ) ( not ( = ?auto_893397 ?auto_893405 ) ) ( not ( = ?auto_893397 ?auto_893406 ) ) ( not ( = ?auto_893397 ?auto_893407 ) ) ( not ( = ?auto_893397 ?auto_893408 ) ) ( not ( = ?auto_893397 ?auto_893409 ) ) ( not ( = ?auto_893397 ?auto_893410 ) ) ( not ( = ?auto_893397 ?auto_893411 ) ) ( not ( = ?auto_893398 ?auto_893399 ) ) ( not ( = ?auto_893398 ?auto_893400 ) ) ( not ( = ?auto_893398 ?auto_893401 ) ) ( not ( = ?auto_893398 ?auto_893402 ) ) ( not ( = ?auto_893398 ?auto_893403 ) ) ( not ( = ?auto_893398 ?auto_893404 ) ) ( not ( = ?auto_893398 ?auto_893405 ) ) ( not ( = ?auto_893398 ?auto_893406 ) ) ( not ( = ?auto_893398 ?auto_893407 ) ) ( not ( = ?auto_893398 ?auto_893408 ) ) ( not ( = ?auto_893398 ?auto_893409 ) ) ( not ( = ?auto_893398 ?auto_893410 ) ) ( not ( = ?auto_893398 ?auto_893411 ) ) ( not ( = ?auto_893399 ?auto_893400 ) ) ( not ( = ?auto_893399 ?auto_893401 ) ) ( not ( = ?auto_893399 ?auto_893402 ) ) ( not ( = ?auto_893399 ?auto_893403 ) ) ( not ( = ?auto_893399 ?auto_893404 ) ) ( not ( = ?auto_893399 ?auto_893405 ) ) ( not ( = ?auto_893399 ?auto_893406 ) ) ( not ( = ?auto_893399 ?auto_893407 ) ) ( not ( = ?auto_893399 ?auto_893408 ) ) ( not ( = ?auto_893399 ?auto_893409 ) ) ( not ( = ?auto_893399 ?auto_893410 ) ) ( not ( = ?auto_893399 ?auto_893411 ) ) ( not ( = ?auto_893400 ?auto_893401 ) ) ( not ( = ?auto_893400 ?auto_893402 ) ) ( not ( = ?auto_893400 ?auto_893403 ) ) ( not ( = ?auto_893400 ?auto_893404 ) ) ( not ( = ?auto_893400 ?auto_893405 ) ) ( not ( = ?auto_893400 ?auto_893406 ) ) ( not ( = ?auto_893400 ?auto_893407 ) ) ( not ( = ?auto_893400 ?auto_893408 ) ) ( not ( = ?auto_893400 ?auto_893409 ) ) ( not ( = ?auto_893400 ?auto_893410 ) ) ( not ( = ?auto_893400 ?auto_893411 ) ) ( not ( = ?auto_893401 ?auto_893402 ) ) ( not ( = ?auto_893401 ?auto_893403 ) ) ( not ( = ?auto_893401 ?auto_893404 ) ) ( not ( = ?auto_893401 ?auto_893405 ) ) ( not ( = ?auto_893401 ?auto_893406 ) ) ( not ( = ?auto_893401 ?auto_893407 ) ) ( not ( = ?auto_893401 ?auto_893408 ) ) ( not ( = ?auto_893401 ?auto_893409 ) ) ( not ( = ?auto_893401 ?auto_893410 ) ) ( not ( = ?auto_893401 ?auto_893411 ) ) ( not ( = ?auto_893402 ?auto_893403 ) ) ( not ( = ?auto_893402 ?auto_893404 ) ) ( not ( = ?auto_893402 ?auto_893405 ) ) ( not ( = ?auto_893402 ?auto_893406 ) ) ( not ( = ?auto_893402 ?auto_893407 ) ) ( not ( = ?auto_893402 ?auto_893408 ) ) ( not ( = ?auto_893402 ?auto_893409 ) ) ( not ( = ?auto_893402 ?auto_893410 ) ) ( not ( = ?auto_893402 ?auto_893411 ) ) ( not ( = ?auto_893403 ?auto_893404 ) ) ( not ( = ?auto_893403 ?auto_893405 ) ) ( not ( = ?auto_893403 ?auto_893406 ) ) ( not ( = ?auto_893403 ?auto_893407 ) ) ( not ( = ?auto_893403 ?auto_893408 ) ) ( not ( = ?auto_893403 ?auto_893409 ) ) ( not ( = ?auto_893403 ?auto_893410 ) ) ( not ( = ?auto_893403 ?auto_893411 ) ) ( not ( = ?auto_893404 ?auto_893405 ) ) ( not ( = ?auto_893404 ?auto_893406 ) ) ( not ( = ?auto_893404 ?auto_893407 ) ) ( not ( = ?auto_893404 ?auto_893408 ) ) ( not ( = ?auto_893404 ?auto_893409 ) ) ( not ( = ?auto_893404 ?auto_893410 ) ) ( not ( = ?auto_893404 ?auto_893411 ) ) ( not ( = ?auto_893405 ?auto_893406 ) ) ( not ( = ?auto_893405 ?auto_893407 ) ) ( not ( = ?auto_893405 ?auto_893408 ) ) ( not ( = ?auto_893405 ?auto_893409 ) ) ( not ( = ?auto_893405 ?auto_893410 ) ) ( not ( = ?auto_893405 ?auto_893411 ) ) ( not ( = ?auto_893406 ?auto_893407 ) ) ( not ( = ?auto_893406 ?auto_893408 ) ) ( not ( = ?auto_893406 ?auto_893409 ) ) ( not ( = ?auto_893406 ?auto_893410 ) ) ( not ( = ?auto_893406 ?auto_893411 ) ) ( not ( = ?auto_893407 ?auto_893408 ) ) ( not ( = ?auto_893407 ?auto_893409 ) ) ( not ( = ?auto_893407 ?auto_893410 ) ) ( not ( = ?auto_893407 ?auto_893411 ) ) ( not ( = ?auto_893408 ?auto_893409 ) ) ( not ( = ?auto_893408 ?auto_893410 ) ) ( not ( = ?auto_893408 ?auto_893411 ) ) ( not ( = ?auto_893409 ?auto_893410 ) ) ( not ( = ?auto_893409 ?auto_893411 ) ) ( not ( = ?auto_893410 ?auto_893411 ) ) ( ON ?auto_893409 ?auto_893410 ) ( ON ?auto_893408 ?auto_893409 ) ( ON ?auto_893407 ?auto_893408 ) ( ON ?auto_893406 ?auto_893407 ) ( ON ?auto_893405 ?auto_893406 ) ( ON ?auto_893404 ?auto_893405 ) ( ON ?auto_893403 ?auto_893404 ) ( ON ?auto_893402 ?auto_893403 ) ( ON ?auto_893401 ?auto_893402 ) ( ON ?auto_893400 ?auto_893401 ) ( ON ?auto_893399 ?auto_893400 ) ( CLEAR ?auto_893397 ) ( ON ?auto_893398 ?auto_893399 ) ( CLEAR ?auto_893398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_893397 ?auto_893398 )
      ( MAKE-14PILE ?auto_893397 ?auto_893398 ?auto_893399 ?auto_893400 ?auto_893401 ?auto_893402 ?auto_893403 ?auto_893404 ?auto_893405 ?auto_893406 ?auto_893407 ?auto_893408 ?auto_893409 ?auto_893410 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_893455 - BLOCK
      ?auto_893456 - BLOCK
      ?auto_893457 - BLOCK
      ?auto_893458 - BLOCK
      ?auto_893459 - BLOCK
      ?auto_893460 - BLOCK
      ?auto_893461 - BLOCK
      ?auto_893462 - BLOCK
      ?auto_893463 - BLOCK
      ?auto_893464 - BLOCK
      ?auto_893465 - BLOCK
      ?auto_893466 - BLOCK
      ?auto_893467 - BLOCK
      ?auto_893468 - BLOCK
    )
    :vars
    (
      ?auto_893469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893468 ?auto_893469 ) ( not ( = ?auto_893455 ?auto_893456 ) ) ( not ( = ?auto_893455 ?auto_893457 ) ) ( not ( = ?auto_893455 ?auto_893458 ) ) ( not ( = ?auto_893455 ?auto_893459 ) ) ( not ( = ?auto_893455 ?auto_893460 ) ) ( not ( = ?auto_893455 ?auto_893461 ) ) ( not ( = ?auto_893455 ?auto_893462 ) ) ( not ( = ?auto_893455 ?auto_893463 ) ) ( not ( = ?auto_893455 ?auto_893464 ) ) ( not ( = ?auto_893455 ?auto_893465 ) ) ( not ( = ?auto_893455 ?auto_893466 ) ) ( not ( = ?auto_893455 ?auto_893467 ) ) ( not ( = ?auto_893455 ?auto_893468 ) ) ( not ( = ?auto_893455 ?auto_893469 ) ) ( not ( = ?auto_893456 ?auto_893457 ) ) ( not ( = ?auto_893456 ?auto_893458 ) ) ( not ( = ?auto_893456 ?auto_893459 ) ) ( not ( = ?auto_893456 ?auto_893460 ) ) ( not ( = ?auto_893456 ?auto_893461 ) ) ( not ( = ?auto_893456 ?auto_893462 ) ) ( not ( = ?auto_893456 ?auto_893463 ) ) ( not ( = ?auto_893456 ?auto_893464 ) ) ( not ( = ?auto_893456 ?auto_893465 ) ) ( not ( = ?auto_893456 ?auto_893466 ) ) ( not ( = ?auto_893456 ?auto_893467 ) ) ( not ( = ?auto_893456 ?auto_893468 ) ) ( not ( = ?auto_893456 ?auto_893469 ) ) ( not ( = ?auto_893457 ?auto_893458 ) ) ( not ( = ?auto_893457 ?auto_893459 ) ) ( not ( = ?auto_893457 ?auto_893460 ) ) ( not ( = ?auto_893457 ?auto_893461 ) ) ( not ( = ?auto_893457 ?auto_893462 ) ) ( not ( = ?auto_893457 ?auto_893463 ) ) ( not ( = ?auto_893457 ?auto_893464 ) ) ( not ( = ?auto_893457 ?auto_893465 ) ) ( not ( = ?auto_893457 ?auto_893466 ) ) ( not ( = ?auto_893457 ?auto_893467 ) ) ( not ( = ?auto_893457 ?auto_893468 ) ) ( not ( = ?auto_893457 ?auto_893469 ) ) ( not ( = ?auto_893458 ?auto_893459 ) ) ( not ( = ?auto_893458 ?auto_893460 ) ) ( not ( = ?auto_893458 ?auto_893461 ) ) ( not ( = ?auto_893458 ?auto_893462 ) ) ( not ( = ?auto_893458 ?auto_893463 ) ) ( not ( = ?auto_893458 ?auto_893464 ) ) ( not ( = ?auto_893458 ?auto_893465 ) ) ( not ( = ?auto_893458 ?auto_893466 ) ) ( not ( = ?auto_893458 ?auto_893467 ) ) ( not ( = ?auto_893458 ?auto_893468 ) ) ( not ( = ?auto_893458 ?auto_893469 ) ) ( not ( = ?auto_893459 ?auto_893460 ) ) ( not ( = ?auto_893459 ?auto_893461 ) ) ( not ( = ?auto_893459 ?auto_893462 ) ) ( not ( = ?auto_893459 ?auto_893463 ) ) ( not ( = ?auto_893459 ?auto_893464 ) ) ( not ( = ?auto_893459 ?auto_893465 ) ) ( not ( = ?auto_893459 ?auto_893466 ) ) ( not ( = ?auto_893459 ?auto_893467 ) ) ( not ( = ?auto_893459 ?auto_893468 ) ) ( not ( = ?auto_893459 ?auto_893469 ) ) ( not ( = ?auto_893460 ?auto_893461 ) ) ( not ( = ?auto_893460 ?auto_893462 ) ) ( not ( = ?auto_893460 ?auto_893463 ) ) ( not ( = ?auto_893460 ?auto_893464 ) ) ( not ( = ?auto_893460 ?auto_893465 ) ) ( not ( = ?auto_893460 ?auto_893466 ) ) ( not ( = ?auto_893460 ?auto_893467 ) ) ( not ( = ?auto_893460 ?auto_893468 ) ) ( not ( = ?auto_893460 ?auto_893469 ) ) ( not ( = ?auto_893461 ?auto_893462 ) ) ( not ( = ?auto_893461 ?auto_893463 ) ) ( not ( = ?auto_893461 ?auto_893464 ) ) ( not ( = ?auto_893461 ?auto_893465 ) ) ( not ( = ?auto_893461 ?auto_893466 ) ) ( not ( = ?auto_893461 ?auto_893467 ) ) ( not ( = ?auto_893461 ?auto_893468 ) ) ( not ( = ?auto_893461 ?auto_893469 ) ) ( not ( = ?auto_893462 ?auto_893463 ) ) ( not ( = ?auto_893462 ?auto_893464 ) ) ( not ( = ?auto_893462 ?auto_893465 ) ) ( not ( = ?auto_893462 ?auto_893466 ) ) ( not ( = ?auto_893462 ?auto_893467 ) ) ( not ( = ?auto_893462 ?auto_893468 ) ) ( not ( = ?auto_893462 ?auto_893469 ) ) ( not ( = ?auto_893463 ?auto_893464 ) ) ( not ( = ?auto_893463 ?auto_893465 ) ) ( not ( = ?auto_893463 ?auto_893466 ) ) ( not ( = ?auto_893463 ?auto_893467 ) ) ( not ( = ?auto_893463 ?auto_893468 ) ) ( not ( = ?auto_893463 ?auto_893469 ) ) ( not ( = ?auto_893464 ?auto_893465 ) ) ( not ( = ?auto_893464 ?auto_893466 ) ) ( not ( = ?auto_893464 ?auto_893467 ) ) ( not ( = ?auto_893464 ?auto_893468 ) ) ( not ( = ?auto_893464 ?auto_893469 ) ) ( not ( = ?auto_893465 ?auto_893466 ) ) ( not ( = ?auto_893465 ?auto_893467 ) ) ( not ( = ?auto_893465 ?auto_893468 ) ) ( not ( = ?auto_893465 ?auto_893469 ) ) ( not ( = ?auto_893466 ?auto_893467 ) ) ( not ( = ?auto_893466 ?auto_893468 ) ) ( not ( = ?auto_893466 ?auto_893469 ) ) ( not ( = ?auto_893467 ?auto_893468 ) ) ( not ( = ?auto_893467 ?auto_893469 ) ) ( not ( = ?auto_893468 ?auto_893469 ) ) ( ON ?auto_893467 ?auto_893468 ) ( ON ?auto_893466 ?auto_893467 ) ( ON ?auto_893465 ?auto_893466 ) ( ON ?auto_893464 ?auto_893465 ) ( ON ?auto_893463 ?auto_893464 ) ( ON ?auto_893462 ?auto_893463 ) ( ON ?auto_893461 ?auto_893462 ) ( ON ?auto_893460 ?auto_893461 ) ( ON ?auto_893459 ?auto_893460 ) ( ON ?auto_893458 ?auto_893459 ) ( ON ?auto_893457 ?auto_893458 ) ( ON ?auto_893456 ?auto_893457 ) ( ON ?auto_893455 ?auto_893456 ) ( CLEAR ?auto_893455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_893455 )
      ( MAKE-14PILE ?auto_893455 ?auto_893456 ?auto_893457 ?auto_893458 ?auto_893459 ?auto_893460 ?auto_893461 ?auto_893462 ?auto_893463 ?auto_893464 ?auto_893465 ?auto_893466 ?auto_893467 ?auto_893468 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893514 - BLOCK
      ?auto_893515 - BLOCK
      ?auto_893516 - BLOCK
      ?auto_893517 - BLOCK
      ?auto_893518 - BLOCK
      ?auto_893519 - BLOCK
      ?auto_893520 - BLOCK
      ?auto_893521 - BLOCK
      ?auto_893522 - BLOCK
      ?auto_893523 - BLOCK
      ?auto_893524 - BLOCK
      ?auto_893525 - BLOCK
      ?auto_893526 - BLOCK
      ?auto_893527 - BLOCK
      ?auto_893528 - BLOCK
    )
    :vars
    (
      ?auto_893529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_893527 ) ( ON ?auto_893528 ?auto_893529 ) ( CLEAR ?auto_893528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_893514 ) ( ON ?auto_893515 ?auto_893514 ) ( ON ?auto_893516 ?auto_893515 ) ( ON ?auto_893517 ?auto_893516 ) ( ON ?auto_893518 ?auto_893517 ) ( ON ?auto_893519 ?auto_893518 ) ( ON ?auto_893520 ?auto_893519 ) ( ON ?auto_893521 ?auto_893520 ) ( ON ?auto_893522 ?auto_893521 ) ( ON ?auto_893523 ?auto_893522 ) ( ON ?auto_893524 ?auto_893523 ) ( ON ?auto_893525 ?auto_893524 ) ( ON ?auto_893526 ?auto_893525 ) ( ON ?auto_893527 ?auto_893526 ) ( not ( = ?auto_893514 ?auto_893515 ) ) ( not ( = ?auto_893514 ?auto_893516 ) ) ( not ( = ?auto_893514 ?auto_893517 ) ) ( not ( = ?auto_893514 ?auto_893518 ) ) ( not ( = ?auto_893514 ?auto_893519 ) ) ( not ( = ?auto_893514 ?auto_893520 ) ) ( not ( = ?auto_893514 ?auto_893521 ) ) ( not ( = ?auto_893514 ?auto_893522 ) ) ( not ( = ?auto_893514 ?auto_893523 ) ) ( not ( = ?auto_893514 ?auto_893524 ) ) ( not ( = ?auto_893514 ?auto_893525 ) ) ( not ( = ?auto_893514 ?auto_893526 ) ) ( not ( = ?auto_893514 ?auto_893527 ) ) ( not ( = ?auto_893514 ?auto_893528 ) ) ( not ( = ?auto_893514 ?auto_893529 ) ) ( not ( = ?auto_893515 ?auto_893516 ) ) ( not ( = ?auto_893515 ?auto_893517 ) ) ( not ( = ?auto_893515 ?auto_893518 ) ) ( not ( = ?auto_893515 ?auto_893519 ) ) ( not ( = ?auto_893515 ?auto_893520 ) ) ( not ( = ?auto_893515 ?auto_893521 ) ) ( not ( = ?auto_893515 ?auto_893522 ) ) ( not ( = ?auto_893515 ?auto_893523 ) ) ( not ( = ?auto_893515 ?auto_893524 ) ) ( not ( = ?auto_893515 ?auto_893525 ) ) ( not ( = ?auto_893515 ?auto_893526 ) ) ( not ( = ?auto_893515 ?auto_893527 ) ) ( not ( = ?auto_893515 ?auto_893528 ) ) ( not ( = ?auto_893515 ?auto_893529 ) ) ( not ( = ?auto_893516 ?auto_893517 ) ) ( not ( = ?auto_893516 ?auto_893518 ) ) ( not ( = ?auto_893516 ?auto_893519 ) ) ( not ( = ?auto_893516 ?auto_893520 ) ) ( not ( = ?auto_893516 ?auto_893521 ) ) ( not ( = ?auto_893516 ?auto_893522 ) ) ( not ( = ?auto_893516 ?auto_893523 ) ) ( not ( = ?auto_893516 ?auto_893524 ) ) ( not ( = ?auto_893516 ?auto_893525 ) ) ( not ( = ?auto_893516 ?auto_893526 ) ) ( not ( = ?auto_893516 ?auto_893527 ) ) ( not ( = ?auto_893516 ?auto_893528 ) ) ( not ( = ?auto_893516 ?auto_893529 ) ) ( not ( = ?auto_893517 ?auto_893518 ) ) ( not ( = ?auto_893517 ?auto_893519 ) ) ( not ( = ?auto_893517 ?auto_893520 ) ) ( not ( = ?auto_893517 ?auto_893521 ) ) ( not ( = ?auto_893517 ?auto_893522 ) ) ( not ( = ?auto_893517 ?auto_893523 ) ) ( not ( = ?auto_893517 ?auto_893524 ) ) ( not ( = ?auto_893517 ?auto_893525 ) ) ( not ( = ?auto_893517 ?auto_893526 ) ) ( not ( = ?auto_893517 ?auto_893527 ) ) ( not ( = ?auto_893517 ?auto_893528 ) ) ( not ( = ?auto_893517 ?auto_893529 ) ) ( not ( = ?auto_893518 ?auto_893519 ) ) ( not ( = ?auto_893518 ?auto_893520 ) ) ( not ( = ?auto_893518 ?auto_893521 ) ) ( not ( = ?auto_893518 ?auto_893522 ) ) ( not ( = ?auto_893518 ?auto_893523 ) ) ( not ( = ?auto_893518 ?auto_893524 ) ) ( not ( = ?auto_893518 ?auto_893525 ) ) ( not ( = ?auto_893518 ?auto_893526 ) ) ( not ( = ?auto_893518 ?auto_893527 ) ) ( not ( = ?auto_893518 ?auto_893528 ) ) ( not ( = ?auto_893518 ?auto_893529 ) ) ( not ( = ?auto_893519 ?auto_893520 ) ) ( not ( = ?auto_893519 ?auto_893521 ) ) ( not ( = ?auto_893519 ?auto_893522 ) ) ( not ( = ?auto_893519 ?auto_893523 ) ) ( not ( = ?auto_893519 ?auto_893524 ) ) ( not ( = ?auto_893519 ?auto_893525 ) ) ( not ( = ?auto_893519 ?auto_893526 ) ) ( not ( = ?auto_893519 ?auto_893527 ) ) ( not ( = ?auto_893519 ?auto_893528 ) ) ( not ( = ?auto_893519 ?auto_893529 ) ) ( not ( = ?auto_893520 ?auto_893521 ) ) ( not ( = ?auto_893520 ?auto_893522 ) ) ( not ( = ?auto_893520 ?auto_893523 ) ) ( not ( = ?auto_893520 ?auto_893524 ) ) ( not ( = ?auto_893520 ?auto_893525 ) ) ( not ( = ?auto_893520 ?auto_893526 ) ) ( not ( = ?auto_893520 ?auto_893527 ) ) ( not ( = ?auto_893520 ?auto_893528 ) ) ( not ( = ?auto_893520 ?auto_893529 ) ) ( not ( = ?auto_893521 ?auto_893522 ) ) ( not ( = ?auto_893521 ?auto_893523 ) ) ( not ( = ?auto_893521 ?auto_893524 ) ) ( not ( = ?auto_893521 ?auto_893525 ) ) ( not ( = ?auto_893521 ?auto_893526 ) ) ( not ( = ?auto_893521 ?auto_893527 ) ) ( not ( = ?auto_893521 ?auto_893528 ) ) ( not ( = ?auto_893521 ?auto_893529 ) ) ( not ( = ?auto_893522 ?auto_893523 ) ) ( not ( = ?auto_893522 ?auto_893524 ) ) ( not ( = ?auto_893522 ?auto_893525 ) ) ( not ( = ?auto_893522 ?auto_893526 ) ) ( not ( = ?auto_893522 ?auto_893527 ) ) ( not ( = ?auto_893522 ?auto_893528 ) ) ( not ( = ?auto_893522 ?auto_893529 ) ) ( not ( = ?auto_893523 ?auto_893524 ) ) ( not ( = ?auto_893523 ?auto_893525 ) ) ( not ( = ?auto_893523 ?auto_893526 ) ) ( not ( = ?auto_893523 ?auto_893527 ) ) ( not ( = ?auto_893523 ?auto_893528 ) ) ( not ( = ?auto_893523 ?auto_893529 ) ) ( not ( = ?auto_893524 ?auto_893525 ) ) ( not ( = ?auto_893524 ?auto_893526 ) ) ( not ( = ?auto_893524 ?auto_893527 ) ) ( not ( = ?auto_893524 ?auto_893528 ) ) ( not ( = ?auto_893524 ?auto_893529 ) ) ( not ( = ?auto_893525 ?auto_893526 ) ) ( not ( = ?auto_893525 ?auto_893527 ) ) ( not ( = ?auto_893525 ?auto_893528 ) ) ( not ( = ?auto_893525 ?auto_893529 ) ) ( not ( = ?auto_893526 ?auto_893527 ) ) ( not ( = ?auto_893526 ?auto_893528 ) ) ( not ( = ?auto_893526 ?auto_893529 ) ) ( not ( = ?auto_893527 ?auto_893528 ) ) ( not ( = ?auto_893527 ?auto_893529 ) ) ( not ( = ?auto_893528 ?auto_893529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_893528 ?auto_893529 )
      ( !STACK ?auto_893528 ?auto_893527 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893576 - BLOCK
      ?auto_893577 - BLOCK
      ?auto_893578 - BLOCK
      ?auto_893579 - BLOCK
      ?auto_893580 - BLOCK
      ?auto_893581 - BLOCK
      ?auto_893582 - BLOCK
      ?auto_893583 - BLOCK
      ?auto_893584 - BLOCK
      ?auto_893585 - BLOCK
      ?auto_893586 - BLOCK
      ?auto_893587 - BLOCK
      ?auto_893588 - BLOCK
      ?auto_893589 - BLOCK
      ?auto_893590 - BLOCK
    )
    :vars
    (
      ?auto_893591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893590 ?auto_893591 ) ( ON-TABLE ?auto_893576 ) ( ON ?auto_893577 ?auto_893576 ) ( ON ?auto_893578 ?auto_893577 ) ( ON ?auto_893579 ?auto_893578 ) ( ON ?auto_893580 ?auto_893579 ) ( ON ?auto_893581 ?auto_893580 ) ( ON ?auto_893582 ?auto_893581 ) ( ON ?auto_893583 ?auto_893582 ) ( ON ?auto_893584 ?auto_893583 ) ( ON ?auto_893585 ?auto_893584 ) ( ON ?auto_893586 ?auto_893585 ) ( ON ?auto_893587 ?auto_893586 ) ( ON ?auto_893588 ?auto_893587 ) ( not ( = ?auto_893576 ?auto_893577 ) ) ( not ( = ?auto_893576 ?auto_893578 ) ) ( not ( = ?auto_893576 ?auto_893579 ) ) ( not ( = ?auto_893576 ?auto_893580 ) ) ( not ( = ?auto_893576 ?auto_893581 ) ) ( not ( = ?auto_893576 ?auto_893582 ) ) ( not ( = ?auto_893576 ?auto_893583 ) ) ( not ( = ?auto_893576 ?auto_893584 ) ) ( not ( = ?auto_893576 ?auto_893585 ) ) ( not ( = ?auto_893576 ?auto_893586 ) ) ( not ( = ?auto_893576 ?auto_893587 ) ) ( not ( = ?auto_893576 ?auto_893588 ) ) ( not ( = ?auto_893576 ?auto_893589 ) ) ( not ( = ?auto_893576 ?auto_893590 ) ) ( not ( = ?auto_893576 ?auto_893591 ) ) ( not ( = ?auto_893577 ?auto_893578 ) ) ( not ( = ?auto_893577 ?auto_893579 ) ) ( not ( = ?auto_893577 ?auto_893580 ) ) ( not ( = ?auto_893577 ?auto_893581 ) ) ( not ( = ?auto_893577 ?auto_893582 ) ) ( not ( = ?auto_893577 ?auto_893583 ) ) ( not ( = ?auto_893577 ?auto_893584 ) ) ( not ( = ?auto_893577 ?auto_893585 ) ) ( not ( = ?auto_893577 ?auto_893586 ) ) ( not ( = ?auto_893577 ?auto_893587 ) ) ( not ( = ?auto_893577 ?auto_893588 ) ) ( not ( = ?auto_893577 ?auto_893589 ) ) ( not ( = ?auto_893577 ?auto_893590 ) ) ( not ( = ?auto_893577 ?auto_893591 ) ) ( not ( = ?auto_893578 ?auto_893579 ) ) ( not ( = ?auto_893578 ?auto_893580 ) ) ( not ( = ?auto_893578 ?auto_893581 ) ) ( not ( = ?auto_893578 ?auto_893582 ) ) ( not ( = ?auto_893578 ?auto_893583 ) ) ( not ( = ?auto_893578 ?auto_893584 ) ) ( not ( = ?auto_893578 ?auto_893585 ) ) ( not ( = ?auto_893578 ?auto_893586 ) ) ( not ( = ?auto_893578 ?auto_893587 ) ) ( not ( = ?auto_893578 ?auto_893588 ) ) ( not ( = ?auto_893578 ?auto_893589 ) ) ( not ( = ?auto_893578 ?auto_893590 ) ) ( not ( = ?auto_893578 ?auto_893591 ) ) ( not ( = ?auto_893579 ?auto_893580 ) ) ( not ( = ?auto_893579 ?auto_893581 ) ) ( not ( = ?auto_893579 ?auto_893582 ) ) ( not ( = ?auto_893579 ?auto_893583 ) ) ( not ( = ?auto_893579 ?auto_893584 ) ) ( not ( = ?auto_893579 ?auto_893585 ) ) ( not ( = ?auto_893579 ?auto_893586 ) ) ( not ( = ?auto_893579 ?auto_893587 ) ) ( not ( = ?auto_893579 ?auto_893588 ) ) ( not ( = ?auto_893579 ?auto_893589 ) ) ( not ( = ?auto_893579 ?auto_893590 ) ) ( not ( = ?auto_893579 ?auto_893591 ) ) ( not ( = ?auto_893580 ?auto_893581 ) ) ( not ( = ?auto_893580 ?auto_893582 ) ) ( not ( = ?auto_893580 ?auto_893583 ) ) ( not ( = ?auto_893580 ?auto_893584 ) ) ( not ( = ?auto_893580 ?auto_893585 ) ) ( not ( = ?auto_893580 ?auto_893586 ) ) ( not ( = ?auto_893580 ?auto_893587 ) ) ( not ( = ?auto_893580 ?auto_893588 ) ) ( not ( = ?auto_893580 ?auto_893589 ) ) ( not ( = ?auto_893580 ?auto_893590 ) ) ( not ( = ?auto_893580 ?auto_893591 ) ) ( not ( = ?auto_893581 ?auto_893582 ) ) ( not ( = ?auto_893581 ?auto_893583 ) ) ( not ( = ?auto_893581 ?auto_893584 ) ) ( not ( = ?auto_893581 ?auto_893585 ) ) ( not ( = ?auto_893581 ?auto_893586 ) ) ( not ( = ?auto_893581 ?auto_893587 ) ) ( not ( = ?auto_893581 ?auto_893588 ) ) ( not ( = ?auto_893581 ?auto_893589 ) ) ( not ( = ?auto_893581 ?auto_893590 ) ) ( not ( = ?auto_893581 ?auto_893591 ) ) ( not ( = ?auto_893582 ?auto_893583 ) ) ( not ( = ?auto_893582 ?auto_893584 ) ) ( not ( = ?auto_893582 ?auto_893585 ) ) ( not ( = ?auto_893582 ?auto_893586 ) ) ( not ( = ?auto_893582 ?auto_893587 ) ) ( not ( = ?auto_893582 ?auto_893588 ) ) ( not ( = ?auto_893582 ?auto_893589 ) ) ( not ( = ?auto_893582 ?auto_893590 ) ) ( not ( = ?auto_893582 ?auto_893591 ) ) ( not ( = ?auto_893583 ?auto_893584 ) ) ( not ( = ?auto_893583 ?auto_893585 ) ) ( not ( = ?auto_893583 ?auto_893586 ) ) ( not ( = ?auto_893583 ?auto_893587 ) ) ( not ( = ?auto_893583 ?auto_893588 ) ) ( not ( = ?auto_893583 ?auto_893589 ) ) ( not ( = ?auto_893583 ?auto_893590 ) ) ( not ( = ?auto_893583 ?auto_893591 ) ) ( not ( = ?auto_893584 ?auto_893585 ) ) ( not ( = ?auto_893584 ?auto_893586 ) ) ( not ( = ?auto_893584 ?auto_893587 ) ) ( not ( = ?auto_893584 ?auto_893588 ) ) ( not ( = ?auto_893584 ?auto_893589 ) ) ( not ( = ?auto_893584 ?auto_893590 ) ) ( not ( = ?auto_893584 ?auto_893591 ) ) ( not ( = ?auto_893585 ?auto_893586 ) ) ( not ( = ?auto_893585 ?auto_893587 ) ) ( not ( = ?auto_893585 ?auto_893588 ) ) ( not ( = ?auto_893585 ?auto_893589 ) ) ( not ( = ?auto_893585 ?auto_893590 ) ) ( not ( = ?auto_893585 ?auto_893591 ) ) ( not ( = ?auto_893586 ?auto_893587 ) ) ( not ( = ?auto_893586 ?auto_893588 ) ) ( not ( = ?auto_893586 ?auto_893589 ) ) ( not ( = ?auto_893586 ?auto_893590 ) ) ( not ( = ?auto_893586 ?auto_893591 ) ) ( not ( = ?auto_893587 ?auto_893588 ) ) ( not ( = ?auto_893587 ?auto_893589 ) ) ( not ( = ?auto_893587 ?auto_893590 ) ) ( not ( = ?auto_893587 ?auto_893591 ) ) ( not ( = ?auto_893588 ?auto_893589 ) ) ( not ( = ?auto_893588 ?auto_893590 ) ) ( not ( = ?auto_893588 ?auto_893591 ) ) ( not ( = ?auto_893589 ?auto_893590 ) ) ( not ( = ?auto_893589 ?auto_893591 ) ) ( not ( = ?auto_893590 ?auto_893591 ) ) ( CLEAR ?auto_893588 ) ( ON ?auto_893589 ?auto_893590 ) ( CLEAR ?auto_893589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_893576 ?auto_893577 ?auto_893578 ?auto_893579 ?auto_893580 ?auto_893581 ?auto_893582 ?auto_893583 ?auto_893584 ?auto_893585 ?auto_893586 ?auto_893587 ?auto_893588 ?auto_893589 )
      ( MAKE-15PILE ?auto_893576 ?auto_893577 ?auto_893578 ?auto_893579 ?auto_893580 ?auto_893581 ?auto_893582 ?auto_893583 ?auto_893584 ?auto_893585 ?auto_893586 ?auto_893587 ?auto_893588 ?auto_893589 ?auto_893590 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893638 - BLOCK
      ?auto_893639 - BLOCK
      ?auto_893640 - BLOCK
      ?auto_893641 - BLOCK
      ?auto_893642 - BLOCK
      ?auto_893643 - BLOCK
      ?auto_893644 - BLOCK
      ?auto_893645 - BLOCK
      ?auto_893646 - BLOCK
      ?auto_893647 - BLOCK
      ?auto_893648 - BLOCK
      ?auto_893649 - BLOCK
      ?auto_893650 - BLOCK
      ?auto_893651 - BLOCK
      ?auto_893652 - BLOCK
    )
    :vars
    (
      ?auto_893653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893652 ?auto_893653 ) ( ON-TABLE ?auto_893638 ) ( ON ?auto_893639 ?auto_893638 ) ( ON ?auto_893640 ?auto_893639 ) ( ON ?auto_893641 ?auto_893640 ) ( ON ?auto_893642 ?auto_893641 ) ( ON ?auto_893643 ?auto_893642 ) ( ON ?auto_893644 ?auto_893643 ) ( ON ?auto_893645 ?auto_893644 ) ( ON ?auto_893646 ?auto_893645 ) ( ON ?auto_893647 ?auto_893646 ) ( ON ?auto_893648 ?auto_893647 ) ( ON ?auto_893649 ?auto_893648 ) ( not ( = ?auto_893638 ?auto_893639 ) ) ( not ( = ?auto_893638 ?auto_893640 ) ) ( not ( = ?auto_893638 ?auto_893641 ) ) ( not ( = ?auto_893638 ?auto_893642 ) ) ( not ( = ?auto_893638 ?auto_893643 ) ) ( not ( = ?auto_893638 ?auto_893644 ) ) ( not ( = ?auto_893638 ?auto_893645 ) ) ( not ( = ?auto_893638 ?auto_893646 ) ) ( not ( = ?auto_893638 ?auto_893647 ) ) ( not ( = ?auto_893638 ?auto_893648 ) ) ( not ( = ?auto_893638 ?auto_893649 ) ) ( not ( = ?auto_893638 ?auto_893650 ) ) ( not ( = ?auto_893638 ?auto_893651 ) ) ( not ( = ?auto_893638 ?auto_893652 ) ) ( not ( = ?auto_893638 ?auto_893653 ) ) ( not ( = ?auto_893639 ?auto_893640 ) ) ( not ( = ?auto_893639 ?auto_893641 ) ) ( not ( = ?auto_893639 ?auto_893642 ) ) ( not ( = ?auto_893639 ?auto_893643 ) ) ( not ( = ?auto_893639 ?auto_893644 ) ) ( not ( = ?auto_893639 ?auto_893645 ) ) ( not ( = ?auto_893639 ?auto_893646 ) ) ( not ( = ?auto_893639 ?auto_893647 ) ) ( not ( = ?auto_893639 ?auto_893648 ) ) ( not ( = ?auto_893639 ?auto_893649 ) ) ( not ( = ?auto_893639 ?auto_893650 ) ) ( not ( = ?auto_893639 ?auto_893651 ) ) ( not ( = ?auto_893639 ?auto_893652 ) ) ( not ( = ?auto_893639 ?auto_893653 ) ) ( not ( = ?auto_893640 ?auto_893641 ) ) ( not ( = ?auto_893640 ?auto_893642 ) ) ( not ( = ?auto_893640 ?auto_893643 ) ) ( not ( = ?auto_893640 ?auto_893644 ) ) ( not ( = ?auto_893640 ?auto_893645 ) ) ( not ( = ?auto_893640 ?auto_893646 ) ) ( not ( = ?auto_893640 ?auto_893647 ) ) ( not ( = ?auto_893640 ?auto_893648 ) ) ( not ( = ?auto_893640 ?auto_893649 ) ) ( not ( = ?auto_893640 ?auto_893650 ) ) ( not ( = ?auto_893640 ?auto_893651 ) ) ( not ( = ?auto_893640 ?auto_893652 ) ) ( not ( = ?auto_893640 ?auto_893653 ) ) ( not ( = ?auto_893641 ?auto_893642 ) ) ( not ( = ?auto_893641 ?auto_893643 ) ) ( not ( = ?auto_893641 ?auto_893644 ) ) ( not ( = ?auto_893641 ?auto_893645 ) ) ( not ( = ?auto_893641 ?auto_893646 ) ) ( not ( = ?auto_893641 ?auto_893647 ) ) ( not ( = ?auto_893641 ?auto_893648 ) ) ( not ( = ?auto_893641 ?auto_893649 ) ) ( not ( = ?auto_893641 ?auto_893650 ) ) ( not ( = ?auto_893641 ?auto_893651 ) ) ( not ( = ?auto_893641 ?auto_893652 ) ) ( not ( = ?auto_893641 ?auto_893653 ) ) ( not ( = ?auto_893642 ?auto_893643 ) ) ( not ( = ?auto_893642 ?auto_893644 ) ) ( not ( = ?auto_893642 ?auto_893645 ) ) ( not ( = ?auto_893642 ?auto_893646 ) ) ( not ( = ?auto_893642 ?auto_893647 ) ) ( not ( = ?auto_893642 ?auto_893648 ) ) ( not ( = ?auto_893642 ?auto_893649 ) ) ( not ( = ?auto_893642 ?auto_893650 ) ) ( not ( = ?auto_893642 ?auto_893651 ) ) ( not ( = ?auto_893642 ?auto_893652 ) ) ( not ( = ?auto_893642 ?auto_893653 ) ) ( not ( = ?auto_893643 ?auto_893644 ) ) ( not ( = ?auto_893643 ?auto_893645 ) ) ( not ( = ?auto_893643 ?auto_893646 ) ) ( not ( = ?auto_893643 ?auto_893647 ) ) ( not ( = ?auto_893643 ?auto_893648 ) ) ( not ( = ?auto_893643 ?auto_893649 ) ) ( not ( = ?auto_893643 ?auto_893650 ) ) ( not ( = ?auto_893643 ?auto_893651 ) ) ( not ( = ?auto_893643 ?auto_893652 ) ) ( not ( = ?auto_893643 ?auto_893653 ) ) ( not ( = ?auto_893644 ?auto_893645 ) ) ( not ( = ?auto_893644 ?auto_893646 ) ) ( not ( = ?auto_893644 ?auto_893647 ) ) ( not ( = ?auto_893644 ?auto_893648 ) ) ( not ( = ?auto_893644 ?auto_893649 ) ) ( not ( = ?auto_893644 ?auto_893650 ) ) ( not ( = ?auto_893644 ?auto_893651 ) ) ( not ( = ?auto_893644 ?auto_893652 ) ) ( not ( = ?auto_893644 ?auto_893653 ) ) ( not ( = ?auto_893645 ?auto_893646 ) ) ( not ( = ?auto_893645 ?auto_893647 ) ) ( not ( = ?auto_893645 ?auto_893648 ) ) ( not ( = ?auto_893645 ?auto_893649 ) ) ( not ( = ?auto_893645 ?auto_893650 ) ) ( not ( = ?auto_893645 ?auto_893651 ) ) ( not ( = ?auto_893645 ?auto_893652 ) ) ( not ( = ?auto_893645 ?auto_893653 ) ) ( not ( = ?auto_893646 ?auto_893647 ) ) ( not ( = ?auto_893646 ?auto_893648 ) ) ( not ( = ?auto_893646 ?auto_893649 ) ) ( not ( = ?auto_893646 ?auto_893650 ) ) ( not ( = ?auto_893646 ?auto_893651 ) ) ( not ( = ?auto_893646 ?auto_893652 ) ) ( not ( = ?auto_893646 ?auto_893653 ) ) ( not ( = ?auto_893647 ?auto_893648 ) ) ( not ( = ?auto_893647 ?auto_893649 ) ) ( not ( = ?auto_893647 ?auto_893650 ) ) ( not ( = ?auto_893647 ?auto_893651 ) ) ( not ( = ?auto_893647 ?auto_893652 ) ) ( not ( = ?auto_893647 ?auto_893653 ) ) ( not ( = ?auto_893648 ?auto_893649 ) ) ( not ( = ?auto_893648 ?auto_893650 ) ) ( not ( = ?auto_893648 ?auto_893651 ) ) ( not ( = ?auto_893648 ?auto_893652 ) ) ( not ( = ?auto_893648 ?auto_893653 ) ) ( not ( = ?auto_893649 ?auto_893650 ) ) ( not ( = ?auto_893649 ?auto_893651 ) ) ( not ( = ?auto_893649 ?auto_893652 ) ) ( not ( = ?auto_893649 ?auto_893653 ) ) ( not ( = ?auto_893650 ?auto_893651 ) ) ( not ( = ?auto_893650 ?auto_893652 ) ) ( not ( = ?auto_893650 ?auto_893653 ) ) ( not ( = ?auto_893651 ?auto_893652 ) ) ( not ( = ?auto_893651 ?auto_893653 ) ) ( not ( = ?auto_893652 ?auto_893653 ) ) ( ON ?auto_893651 ?auto_893652 ) ( CLEAR ?auto_893649 ) ( ON ?auto_893650 ?auto_893651 ) ( CLEAR ?auto_893650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_893638 ?auto_893639 ?auto_893640 ?auto_893641 ?auto_893642 ?auto_893643 ?auto_893644 ?auto_893645 ?auto_893646 ?auto_893647 ?auto_893648 ?auto_893649 ?auto_893650 )
      ( MAKE-15PILE ?auto_893638 ?auto_893639 ?auto_893640 ?auto_893641 ?auto_893642 ?auto_893643 ?auto_893644 ?auto_893645 ?auto_893646 ?auto_893647 ?auto_893648 ?auto_893649 ?auto_893650 ?auto_893651 ?auto_893652 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893700 - BLOCK
      ?auto_893701 - BLOCK
      ?auto_893702 - BLOCK
      ?auto_893703 - BLOCK
      ?auto_893704 - BLOCK
      ?auto_893705 - BLOCK
      ?auto_893706 - BLOCK
      ?auto_893707 - BLOCK
      ?auto_893708 - BLOCK
      ?auto_893709 - BLOCK
      ?auto_893710 - BLOCK
      ?auto_893711 - BLOCK
      ?auto_893712 - BLOCK
      ?auto_893713 - BLOCK
      ?auto_893714 - BLOCK
    )
    :vars
    (
      ?auto_893715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893714 ?auto_893715 ) ( ON-TABLE ?auto_893700 ) ( ON ?auto_893701 ?auto_893700 ) ( ON ?auto_893702 ?auto_893701 ) ( ON ?auto_893703 ?auto_893702 ) ( ON ?auto_893704 ?auto_893703 ) ( ON ?auto_893705 ?auto_893704 ) ( ON ?auto_893706 ?auto_893705 ) ( ON ?auto_893707 ?auto_893706 ) ( ON ?auto_893708 ?auto_893707 ) ( ON ?auto_893709 ?auto_893708 ) ( ON ?auto_893710 ?auto_893709 ) ( not ( = ?auto_893700 ?auto_893701 ) ) ( not ( = ?auto_893700 ?auto_893702 ) ) ( not ( = ?auto_893700 ?auto_893703 ) ) ( not ( = ?auto_893700 ?auto_893704 ) ) ( not ( = ?auto_893700 ?auto_893705 ) ) ( not ( = ?auto_893700 ?auto_893706 ) ) ( not ( = ?auto_893700 ?auto_893707 ) ) ( not ( = ?auto_893700 ?auto_893708 ) ) ( not ( = ?auto_893700 ?auto_893709 ) ) ( not ( = ?auto_893700 ?auto_893710 ) ) ( not ( = ?auto_893700 ?auto_893711 ) ) ( not ( = ?auto_893700 ?auto_893712 ) ) ( not ( = ?auto_893700 ?auto_893713 ) ) ( not ( = ?auto_893700 ?auto_893714 ) ) ( not ( = ?auto_893700 ?auto_893715 ) ) ( not ( = ?auto_893701 ?auto_893702 ) ) ( not ( = ?auto_893701 ?auto_893703 ) ) ( not ( = ?auto_893701 ?auto_893704 ) ) ( not ( = ?auto_893701 ?auto_893705 ) ) ( not ( = ?auto_893701 ?auto_893706 ) ) ( not ( = ?auto_893701 ?auto_893707 ) ) ( not ( = ?auto_893701 ?auto_893708 ) ) ( not ( = ?auto_893701 ?auto_893709 ) ) ( not ( = ?auto_893701 ?auto_893710 ) ) ( not ( = ?auto_893701 ?auto_893711 ) ) ( not ( = ?auto_893701 ?auto_893712 ) ) ( not ( = ?auto_893701 ?auto_893713 ) ) ( not ( = ?auto_893701 ?auto_893714 ) ) ( not ( = ?auto_893701 ?auto_893715 ) ) ( not ( = ?auto_893702 ?auto_893703 ) ) ( not ( = ?auto_893702 ?auto_893704 ) ) ( not ( = ?auto_893702 ?auto_893705 ) ) ( not ( = ?auto_893702 ?auto_893706 ) ) ( not ( = ?auto_893702 ?auto_893707 ) ) ( not ( = ?auto_893702 ?auto_893708 ) ) ( not ( = ?auto_893702 ?auto_893709 ) ) ( not ( = ?auto_893702 ?auto_893710 ) ) ( not ( = ?auto_893702 ?auto_893711 ) ) ( not ( = ?auto_893702 ?auto_893712 ) ) ( not ( = ?auto_893702 ?auto_893713 ) ) ( not ( = ?auto_893702 ?auto_893714 ) ) ( not ( = ?auto_893702 ?auto_893715 ) ) ( not ( = ?auto_893703 ?auto_893704 ) ) ( not ( = ?auto_893703 ?auto_893705 ) ) ( not ( = ?auto_893703 ?auto_893706 ) ) ( not ( = ?auto_893703 ?auto_893707 ) ) ( not ( = ?auto_893703 ?auto_893708 ) ) ( not ( = ?auto_893703 ?auto_893709 ) ) ( not ( = ?auto_893703 ?auto_893710 ) ) ( not ( = ?auto_893703 ?auto_893711 ) ) ( not ( = ?auto_893703 ?auto_893712 ) ) ( not ( = ?auto_893703 ?auto_893713 ) ) ( not ( = ?auto_893703 ?auto_893714 ) ) ( not ( = ?auto_893703 ?auto_893715 ) ) ( not ( = ?auto_893704 ?auto_893705 ) ) ( not ( = ?auto_893704 ?auto_893706 ) ) ( not ( = ?auto_893704 ?auto_893707 ) ) ( not ( = ?auto_893704 ?auto_893708 ) ) ( not ( = ?auto_893704 ?auto_893709 ) ) ( not ( = ?auto_893704 ?auto_893710 ) ) ( not ( = ?auto_893704 ?auto_893711 ) ) ( not ( = ?auto_893704 ?auto_893712 ) ) ( not ( = ?auto_893704 ?auto_893713 ) ) ( not ( = ?auto_893704 ?auto_893714 ) ) ( not ( = ?auto_893704 ?auto_893715 ) ) ( not ( = ?auto_893705 ?auto_893706 ) ) ( not ( = ?auto_893705 ?auto_893707 ) ) ( not ( = ?auto_893705 ?auto_893708 ) ) ( not ( = ?auto_893705 ?auto_893709 ) ) ( not ( = ?auto_893705 ?auto_893710 ) ) ( not ( = ?auto_893705 ?auto_893711 ) ) ( not ( = ?auto_893705 ?auto_893712 ) ) ( not ( = ?auto_893705 ?auto_893713 ) ) ( not ( = ?auto_893705 ?auto_893714 ) ) ( not ( = ?auto_893705 ?auto_893715 ) ) ( not ( = ?auto_893706 ?auto_893707 ) ) ( not ( = ?auto_893706 ?auto_893708 ) ) ( not ( = ?auto_893706 ?auto_893709 ) ) ( not ( = ?auto_893706 ?auto_893710 ) ) ( not ( = ?auto_893706 ?auto_893711 ) ) ( not ( = ?auto_893706 ?auto_893712 ) ) ( not ( = ?auto_893706 ?auto_893713 ) ) ( not ( = ?auto_893706 ?auto_893714 ) ) ( not ( = ?auto_893706 ?auto_893715 ) ) ( not ( = ?auto_893707 ?auto_893708 ) ) ( not ( = ?auto_893707 ?auto_893709 ) ) ( not ( = ?auto_893707 ?auto_893710 ) ) ( not ( = ?auto_893707 ?auto_893711 ) ) ( not ( = ?auto_893707 ?auto_893712 ) ) ( not ( = ?auto_893707 ?auto_893713 ) ) ( not ( = ?auto_893707 ?auto_893714 ) ) ( not ( = ?auto_893707 ?auto_893715 ) ) ( not ( = ?auto_893708 ?auto_893709 ) ) ( not ( = ?auto_893708 ?auto_893710 ) ) ( not ( = ?auto_893708 ?auto_893711 ) ) ( not ( = ?auto_893708 ?auto_893712 ) ) ( not ( = ?auto_893708 ?auto_893713 ) ) ( not ( = ?auto_893708 ?auto_893714 ) ) ( not ( = ?auto_893708 ?auto_893715 ) ) ( not ( = ?auto_893709 ?auto_893710 ) ) ( not ( = ?auto_893709 ?auto_893711 ) ) ( not ( = ?auto_893709 ?auto_893712 ) ) ( not ( = ?auto_893709 ?auto_893713 ) ) ( not ( = ?auto_893709 ?auto_893714 ) ) ( not ( = ?auto_893709 ?auto_893715 ) ) ( not ( = ?auto_893710 ?auto_893711 ) ) ( not ( = ?auto_893710 ?auto_893712 ) ) ( not ( = ?auto_893710 ?auto_893713 ) ) ( not ( = ?auto_893710 ?auto_893714 ) ) ( not ( = ?auto_893710 ?auto_893715 ) ) ( not ( = ?auto_893711 ?auto_893712 ) ) ( not ( = ?auto_893711 ?auto_893713 ) ) ( not ( = ?auto_893711 ?auto_893714 ) ) ( not ( = ?auto_893711 ?auto_893715 ) ) ( not ( = ?auto_893712 ?auto_893713 ) ) ( not ( = ?auto_893712 ?auto_893714 ) ) ( not ( = ?auto_893712 ?auto_893715 ) ) ( not ( = ?auto_893713 ?auto_893714 ) ) ( not ( = ?auto_893713 ?auto_893715 ) ) ( not ( = ?auto_893714 ?auto_893715 ) ) ( ON ?auto_893713 ?auto_893714 ) ( ON ?auto_893712 ?auto_893713 ) ( CLEAR ?auto_893710 ) ( ON ?auto_893711 ?auto_893712 ) ( CLEAR ?auto_893711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_893700 ?auto_893701 ?auto_893702 ?auto_893703 ?auto_893704 ?auto_893705 ?auto_893706 ?auto_893707 ?auto_893708 ?auto_893709 ?auto_893710 ?auto_893711 )
      ( MAKE-15PILE ?auto_893700 ?auto_893701 ?auto_893702 ?auto_893703 ?auto_893704 ?auto_893705 ?auto_893706 ?auto_893707 ?auto_893708 ?auto_893709 ?auto_893710 ?auto_893711 ?auto_893712 ?auto_893713 ?auto_893714 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893762 - BLOCK
      ?auto_893763 - BLOCK
      ?auto_893764 - BLOCK
      ?auto_893765 - BLOCK
      ?auto_893766 - BLOCK
      ?auto_893767 - BLOCK
      ?auto_893768 - BLOCK
      ?auto_893769 - BLOCK
      ?auto_893770 - BLOCK
      ?auto_893771 - BLOCK
      ?auto_893772 - BLOCK
      ?auto_893773 - BLOCK
      ?auto_893774 - BLOCK
      ?auto_893775 - BLOCK
      ?auto_893776 - BLOCK
    )
    :vars
    (
      ?auto_893777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893776 ?auto_893777 ) ( ON-TABLE ?auto_893762 ) ( ON ?auto_893763 ?auto_893762 ) ( ON ?auto_893764 ?auto_893763 ) ( ON ?auto_893765 ?auto_893764 ) ( ON ?auto_893766 ?auto_893765 ) ( ON ?auto_893767 ?auto_893766 ) ( ON ?auto_893768 ?auto_893767 ) ( ON ?auto_893769 ?auto_893768 ) ( ON ?auto_893770 ?auto_893769 ) ( ON ?auto_893771 ?auto_893770 ) ( not ( = ?auto_893762 ?auto_893763 ) ) ( not ( = ?auto_893762 ?auto_893764 ) ) ( not ( = ?auto_893762 ?auto_893765 ) ) ( not ( = ?auto_893762 ?auto_893766 ) ) ( not ( = ?auto_893762 ?auto_893767 ) ) ( not ( = ?auto_893762 ?auto_893768 ) ) ( not ( = ?auto_893762 ?auto_893769 ) ) ( not ( = ?auto_893762 ?auto_893770 ) ) ( not ( = ?auto_893762 ?auto_893771 ) ) ( not ( = ?auto_893762 ?auto_893772 ) ) ( not ( = ?auto_893762 ?auto_893773 ) ) ( not ( = ?auto_893762 ?auto_893774 ) ) ( not ( = ?auto_893762 ?auto_893775 ) ) ( not ( = ?auto_893762 ?auto_893776 ) ) ( not ( = ?auto_893762 ?auto_893777 ) ) ( not ( = ?auto_893763 ?auto_893764 ) ) ( not ( = ?auto_893763 ?auto_893765 ) ) ( not ( = ?auto_893763 ?auto_893766 ) ) ( not ( = ?auto_893763 ?auto_893767 ) ) ( not ( = ?auto_893763 ?auto_893768 ) ) ( not ( = ?auto_893763 ?auto_893769 ) ) ( not ( = ?auto_893763 ?auto_893770 ) ) ( not ( = ?auto_893763 ?auto_893771 ) ) ( not ( = ?auto_893763 ?auto_893772 ) ) ( not ( = ?auto_893763 ?auto_893773 ) ) ( not ( = ?auto_893763 ?auto_893774 ) ) ( not ( = ?auto_893763 ?auto_893775 ) ) ( not ( = ?auto_893763 ?auto_893776 ) ) ( not ( = ?auto_893763 ?auto_893777 ) ) ( not ( = ?auto_893764 ?auto_893765 ) ) ( not ( = ?auto_893764 ?auto_893766 ) ) ( not ( = ?auto_893764 ?auto_893767 ) ) ( not ( = ?auto_893764 ?auto_893768 ) ) ( not ( = ?auto_893764 ?auto_893769 ) ) ( not ( = ?auto_893764 ?auto_893770 ) ) ( not ( = ?auto_893764 ?auto_893771 ) ) ( not ( = ?auto_893764 ?auto_893772 ) ) ( not ( = ?auto_893764 ?auto_893773 ) ) ( not ( = ?auto_893764 ?auto_893774 ) ) ( not ( = ?auto_893764 ?auto_893775 ) ) ( not ( = ?auto_893764 ?auto_893776 ) ) ( not ( = ?auto_893764 ?auto_893777 ) ) ( not ( = ?auto_893765 ?auto_893766 ) ) ( not ( = ?auto_893765 ?auto_893767 ) ) ( not ( = ?auto_893765 ?auto_893768 ) ) ( not ( = ?auto_893765 ?auto_893769 ) ) ( not ( = ?auto_893765 ?auto_893770 ) ) ( not ( = ?auto_893765 ?auto_893771 ) ) ( not ( = ?auto_893765 ?auto_893772 ) ) ( not ( = ?auto_893765 ?auto_893773 ) ) ( not ( = ?auto_893765 ?auto_893774 ) ) ( not ( = ?auto_893765 ?auto_893775 ) ) ( not ( = ?auto_893765 ?auto_893776 ) ) ( not ( = ?auto_893765 ?auto_893777 ) ) ( not ( = ?auto_893766 ?auto_893767 ) ) ( not ( = ?auto_893766 ?auto_893768 ) ) ( not ( = ?auto_893766 ?auto_893769 ) ) ( not ( = ?auto_893766 ?auto_893770 ) ) ( not ( = ?auto_893766 ?auto_893771 ) ) ( not ( = ?auto_893766 ?auto_893772 ) ) ( not ( = ?auto_893766 ?auto_893773 ) ) ( not ( = ?auto_893766 ?auto_893774 ) ) ( not ( = ?auto_893766 ?auto_893775 ) ) ( not ( = ?auto_893766 ?auto_893776 ) ) ( not ( = ?auto_893766 ?auto_893777 ) ) ( not ( = ?auto_893767 ?auto_893768 ) ) ( not ( = ?auto_893767 ?auto_893769 ) ) ( not ( = ?auto_893767 ?auto_893770 ) ) ( not ( = ?auto_893767 ?auto_893771 ) ) ( not ( = ?auto_893767 ?auto_893772 ) ) ( not ( = ?auto_893767 ?auto_893773 ) ) ( not ( = ?auto_893767 ?auto_893774 ) ) ( not ( = ?auto_893767 ?auto_893775 ) ) ( not ( = ?auto_893767 ?auto_893776 ) ) ( not ( = ?auto_893767 ?auto_893777 ) ) ( not ( = ?auto_893768 ?auto_893769 ) ) ( not ( = ?auto_893768 ?auto_893770 ) ) ( not ( = ?auto_893768 ?auto_893771 ) ) ( not ( = ?auto_893768 ?auto_893772 ) ) ( not ( = ?auto_893768 ?auto_893773 ) ) ( not ( = ?auto_893768 ?auto_893774 ) ) ( not ( = ?auto_893768 ?auto_893775 ) ) ( not ( = ?auto_893768 ?auto_893776 ) ) ( not ( = ?auto_893768 ?auto_893777 ) ) ( not ( = ?auto_893769 ?auto_893770 ) ) ( not ( = ?auto_893769 ?auto_893771 ) ) ( not ( = ?auto_893769 ?auto_893772 ) ) ( not ( = ?auto_893769 ?auto_893773 ) ) ( not ( = ?auto_893769 ?auto_893774 ) ) ( not ( = ?auto_893769 ?auto_893775 ) ) ( not ( = ?auto_893769 ?auto_893776 ) ) ( not ( = ?auto_893769 ?auto_893777 ) ) ( not ( = ?auto_893770 ?auto_893771 ) ) ( not ( = ?auto_893770 ?auto_893772 ) ) ( not ( = ?auto_893770 ?auto_893773 ) ) ( not ( = ?auto_893770 ?auto_893774 ) ) ( not ( = ?auto_893770 ?auto_893775 ) ) ( not ( = ?auto_893770 ?auto_893776 ) ) ( not ( = ?auto_893770 ?auto_893777 ) ) ( not ( = ?auto_893771 ?auto_893772 ) ) ( not ( = ?auto_893771 ?auto_893773 ) ) ( not ( = ?auto_893771 ?auto_893774 ) ) ( not ( = ?auto_893771 ?auto_893775 ) ) ( not ( = ?auto_893771 ?auto_893776 ) ) ( not ( = ?auto_893771 ?auto_893777 ) ) ( not ( = ?auto_893772 ?auto_893773 ) ) ( not ( = ?auto_893772 ?auto_893774 ) ) ( not ( = ?auto_893772 ?auto_893775 ) ) ( not ( = ?auto_893772 ?auto_893776 ) ) ( not ( = ?auto_893772 ?auto_893777 ) ) ( not ( = ?auto_893773 ?auto_893774 ) ) ( not ( = ?auto_893773 ?auto_893775 ) ) ( not ( = ?auto_893773 ?auto_893776 ) ) ( not ( = ?auto_893773 ?auto_893777 ) ) ( not ( = ?auto_893774 ?auto_893775 ) ) ( not ( = ?auto_893774 ?auto_893776 ) ) ( not ( = ?auto_893774 ?auto_893777 ) ) ( not ( = ?auto_893775 ?auto_893776 ) ) ( not ( = ?auto_893775 ?auto_893777 ) ) ( not ( = ?auto_893776 ?auto_893777 ) ) ( ON ?auto_893775 ?auto_893776 ) ( ON ?auto_893774 ?auto_893775 ) ( ON ?auto_893773 ?auto_893774 ) ( CLEAR ?auto_893771 ) ( ON ?auto_893772 ?auto_893773 ) ( CLEAR ?auto_893772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_893762 ?auto_893763 ?auto_893764 ?auto_893765 ?auto_893766 ?auto_893767 ?auto_893768 ?auto_893769 ?auto_893770 ?auto_893771 ?auto_893772 )
      ( MAKE-15PILE ?auto_893762 ?auto_893763 ?auto_893764 ?auto_893765 ?auto_893766 ?auto_893767 ?auto_893768 ?auto_893769 ?auto_893770 ?auto_893771 ?auto_893772 ?auto_893773 ?auto_893774 ?auto_893775 ?auto_893776 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893824 - BLOCK
      ?auto_893825 - BLOCK
      ?auto_893826 - BLOCK
      ?auto_893827 - BLOCK
      ?auto_893828 - BLOCK
      ?auto_893829 - BLOCK
      ?auto_893830 - BLOCK
      ?auto_893831 - BLOCK
      ?auto_893832 - BLOCK
      ?auto_893833 - BLOCK
      ?auto_893834 - BLOCK
      ?auto_893835 - BLOCK
      ?auto_893836 - BLOCK
      ?auto_893837 - BLOCK
      ?auto_893838 - BLOCK
    )
    :vars
    (
      ?auto_893839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893838 ?auto_893839 ) ( ON-TABLE ?auto_893824 ) ( ON ?auto_893825 ?auto_893824 ) ( ON ?auto_893826 ?auto_893825 ) ( ON ?auto_893827 ?auto_893826 ) ( ON ?auto_893828 ?auto_893827 ) ( ON ?auto_893829 ?auto_893828 ) ( ON ?auto_893830 ?auto_893829 ) ( ON ?auto_893831 ?auto_893830 ) ( ON ?auto_893832 ?auto_893831 ) ( not ( = ?auto_893824 ?auto_893825 ) ) ( not ( = ?auto_893824 ?auto_893826 ) ) ( not ( = ?auto_893824 ?auto_893827 ) ) ( not ( = ?auto_893824 ?auto_893828 ) ) ( not ( = ?auto_893824 ?auto_893829 ) ) ( not ( = ?auto_893824 ?auto_893830 ) ) ( not ( = ?auto_893824 ?auto_893831 ) ) ( not ( = ?auto_893824 ?auto_893832 ) ) ( not ( = ?auto_893824 ?auto_893833 ) ) ( not ( = ?auto_893824 ?auto_893834 ) ) ( not ( = ?auto_893824 ?auto_893835 ) ) ( not ( = ?auto_893824 ?auto_893836 ) ) ( not ( = ?auto_893824 ?auto_893837 ) ) ( not ( = ?auto_893824 ?auto_893838 ) ) ( not ( = ?auto_893824 ?auto_893839 ) ) ( not ( = ?auto_893825 ?auto_893826 ) ) ( not ( = ?auto_893825 ?auto_893827 ) ) ( not ( = ?auto_893825 ?auto_893828 ) ) ( not ( = ?auto_893825 ?auto_893829 ) ) ( not ( = ?auto_893825 ?auto_893830 ) ) ( not ( = ?auto_893825 ?auto_893831 ) ) ( not ( = ?auto_893825 ?auto_893832 ) ) ( not ( = ?auto_893825 ?auto_893833 ) ) ( not ( = ?auto_893825 ?auto_893834 ) ) ( not ( = ?auto_893825 ?auto_893835 ) ) ( not ( = ?auto_893825 ?auto_893836 ) ) ( not ( = ?auto_893825 ?auto_893837 ) ) ( not ( = ?auto_893825 ?auto_893838 ) ) ( not ( = ?auto_893825 ?auto_893839 ) ) ( not ( = ?auto_893826 ?auto_893827 ) ) ( not ( = ?auto_893826 ?auto_893828 ) ) ( not ( = ?auto_893826 ?auto_893829 ) ) ( not ( = ?auto_893826 ?auto_893830 ) ) ( not ( = ?auto_893826 ?auto_893831 ) ) ( not ( = ?auto_893826 ?auto_893832 ) ) ( not ( = ?auto_893826 ?auto_893833 ) ) ( not ( = ?auto_893826 ?auto_893834 ) ) ( not ( = ?auto_893826 ?auto_893835 ) ) ( not ( = ?auto_893826 ?auto_893836 ) ) ( not ( = ?auto_893826 ?auto_893837 ) ) ( not ( = ?auto_893826 ?auto_893838 ) ) ( not ( = ?auto_893826 ?auto_893839 ) ) ( not ( = ?auto_893827 ?auto_893828 ) ) ( not ( = ?auto_893827 ?auto_893829 ) ) ( not ( = ?auto_893827 ?auto_893830 ) ) ( not ( = ?auto_893827 ?auto_893831 ) ) ( not ( = ?auto_893827 ?auto_893832 ) ) ( not ( = ?auto_893827 ?auto_893833 ) ) ( not ( = ?auto_893827 ?auto_893834 ) ) ( not ( = ?auto_893827 ?auto_893835 ) ) ( not ( = ?auto_893827 ?auto_893836 ) ) ( not ( = ?auto_893827 ?auto_893837 ) ) ( not ( = ?auto_893827 ?auto_893838 ) ) ( not ( = ?auto_893827 ?auto_893839 ) ) ( not ( = ?auto_893828 ?auto_893829 ) ) ( not ( = ?auto_893828 ?auto_893830 ) ) ( not ( = ?auto_893828 ?auto_893831 ) ) ( not ( = ?auto_893828 ?auto_893832 ) ) ( not ( = ?auto_893828 ?auto_893833 ) ) ( not ( = ?auto_893828 ?auto_893834 ) ) ( not ( = ?auto_893828 ?auto_893835 ) ) ( not ( = ?auto_893828 ?auto_893836 ) ) ( not ( = ?auto_893828 ?auto_893837 ) ) ( not ( = ?auto_893828 ?auto_893838 ) ) ( not ( = ?auto_893828 ?auto_893839 ) ) ( not ( = ?auto_893829 ?auto_893830 ) ) ( not ( = ?auto_893829 ?auto_893831 ) ) ( not ( = ?auto_893829 ?auto_893832 ) ) ( not ( = ?auto_893829 ?auto_893833 ) ) ( not ( = ?auto_893829 ?auto_893834 ) ) ( not ( = ?auto_893829 ?auto_893835 ) ) ( not ( = ?auto_893829 ?auto_893836 ) ) ( not ( = ?auto_893829 ?auto_893837 ) ) ( not ( = ?auto_893829 ?auto_893838 ) ) ( not ( = ?auto_893829 ?auto_893839 ) ) ( not ( = ?auto_893830 ?auto_893831 ) ) ( not ( = ?auto_893830 ?auto_893832 ) ) ( not ( = ?auto_893830 ?auto_893833 ) ) ( not ( = ?auto_893830 ?auto_893834 ) ) ( not ( = ?auto_893830 ?auto_893835 ) ) ( not ( = ?auto_893830 ?auto_893836 ) ) ( not ( = ?auto_893830 ?auto_893837 ) ) ( not ( = ?auto_893830 ?auto_893838 ) ) ( not ( = ?auto_893830 ?auto_893839 ) ) ( not ( = ?auto_893831 ?auto_893832 ) ) ( not ( = ?auto_893831 ?auto_893833 ) ) ( not ( = ?auto_893831 ?auto_893834 ) ) ( not ( = ?auto_893831 ?auto_893835 ) ) ( not ( = ?auto_893831 ?auto_893836 ) ) ( not ( = ?auto_893831 ?auto_893837 ) ) ( not ( = ?auto_893831 ?auto_893838 ) ) ( not ( = ?auto_893831 ?auto_893839 ) ) ( not ( = ?auto_893832 ?auto_893833 ) ) ( not ( = ?auto_893832 ?auto_893834 ) ) ( not ( = ?auto_893832 ?auto_893835 ) ) ( not ( = ?auto_893832 ?auto_893836 ) ) ( not ( = ?auto_893832 ?auto_893837 ) ) ( not ( = ?auto_893832 ?auto_893838 ) ) ( not ( = ?auto_893832 ?auto_893839 ) ) ( not ( = ?auto_893833 ?auto_893834 ) ) ( not ( = ?auto_893833 ?auto_893835 ) ) ( not ( = ?auto_893833 ?auto_893836 ) ) ( not ( = ?auto_893833 ?auto_893837 ) ) ( not ( = ?auto_893833 ?auto_893838 ) ) ( not ( = ?auto_893833 ?auto_893839 ) ) ( not ( = ?auto_893834 ?auto_893835 ) ) ( not ( = ?auto_893834 ?auto_893836 ) ) ( not ( = ?auto_893834 ?auto_893837 ) ) ( not ( = ?auto_893834 ?auto_893838 ) ) ( not ( = ?auto_893834 ?auto_893839 ) ) ( not ( = ?auto_893835 ?auto_893836 ) ) ( not ( = ?auto_893835 ?auto_893837 ) ) ( not ( = ?auto_893835 ?auto_893838 ) ) ( not ( = ?auto_893835 ?auto_893839 ) ) ( not ( = ?auto_893836 ?auto_893837 ) ) ( not ( = ?auto_893836 ?auto_893838 ) ) ( not ( = ?auto_893836 ?auto_893839 ) ) ( not ( = ?auto_893837 ?auto_893838 ) ) ( not ( = ?auto_893837 ?auto_893839 ) ) ( not ( = ?auto_893838 ?auto_893839 ) ) ( ON ?auto_893837 ?auto_893838 ) ( ON ?auto_893836 ?auto_893837 ) ( ON ?auto_893835 ?auto_893836 ) ( ON ?auto_893834 ?auto_893835 ) ( CLEAR ?auto_893832 ) ( ON ?auto_893833 ?auto_893834 ) ( CLEAR ?auto_893833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_893824 ?auto_893825 ?auto_893826 ?auto_893827 ?auto_893828 ?auto_893829 ?auto_893830 ?auto_893831 ?auto_893832 ?auto_893833 )
      ( MAKE-15PILE ?auto_893824 ?auto_893825 ?auto_893826 ?auto_893827 ?auto_893828 ?auto_893829 ?auto_893830 ?auto_893831 ?auto_893832 ?auto_893833 ?auto_893834 ?auto_893835 ?auto_893836 ?auto_893837 ?auto_893838 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893886 - BLOCK
      ?auto_893887 - BLOCK
      ?auto_893888 - BLOCK
      ?auto_893889 - BLOCK
      ?auto_893890 - BLOCK
      ?auto_893891 - BLOCK
      ?auto_893892 - BLOCK
      ?auto_893893 - BLOCK
      ?auto_893894 - BLOCK
      ?auto_893895 - BLOCK
      ?auto_893896 - BLOCK
      ?auto_893897 - BLOCK
      ?auto_893898 - BLOCK
      ?auto_893899 - BLOCK
      ?auto_893900 - BLOCK
    )
    :vars
    (
      ?auto_893901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893900 ?auto_893901 ) ( ON-TABLE ?auto_893886 ) ( ON ?auto_893887 ?auto_893886 ) ( ON ?auto_893888 ?auto_893887 ) ( ON ?auto_893889 ?auto_893888 ) ( ON ?auto_893890 ?auto_893889 ) ( ON ?auto_893891 ?auto_893890 ) ( ON ?auto_893892 ?auto_893891 ) ( ON ?auto_893893 ?auto_893892 ) ( not ( = ?auto_893886 ?auto_893887 ) ) ( not ( = ?auto_893886 ?auto_893888 ) ) ( not ( = ?auto_893886 ?auto_893889 ) ) ( not ( = ?auto_893886 ?auto_893890 ) ) ( not ( = ?auto_893886 ?auto_893891 ) ) ( not ( = ?auto_893886 ?auto_893892 ) ) ( not ( = ?auto_893886 ?auto_893893 ) ) ( not ( = ?auto_893886 ?auto_893894 ) ) ( not ( = ?auto_893886 ?auto_893895 ) ) ( not ( = ?auto_893886 ?auto_893896 ) ) ( not ( = ?auto_893886 ?auto_893897 ) ) ( not ( = ?auto_893886 ?auto_893898 ) ) ( not ( = ?auto_893886 ?auto_893899 ) ) ( not ( = ?auto_893886 ?auto_893900 ) ) ( not ( = ?auto_893886 ?auto_893901 ) ) ( not ( = ?auto_893887 ?auto_893888 ) ) ( not ( = ?auto_893887 ?auto_893889 ) ) ( not ( = ?auto_893887 ?auto_893890 ) ) ( not ( = ?auto_893887 ?auto_893891 ) ) ( not ( = ?auto_893887 ?auto_893892 ) ) ( not ( = ?auto_893887 ?auto_893893 ) ) ( not ( = ?auto_893887 ?auto_893894 ) ) ( not ( = ?auto_893887 ?auto_893895 ) ) ( not ( = ?auto_893887 ?auto_893896 ) ) ( not ( = ?auto_893887 ?auto_893897 ) ) ( not ( = ?auto_893887 ?auto_893898 ) ) ( not ( = ?auto_893887 ?auto_893899 ) ) ( not ( = ?auto_893887 ?auto_893900 ) ) ( not ( = ?auto_893887 ?auto_893901 ) ) ( not ( = ?auto_893888 ?auto_893889 ) ) ( not ( = ?auto_893888 ?auto_893890 ) ) ( not ( = ?auto_893888 ?auto_893891 ) ) ( not ( = ?auto_893888 ?auto_893892 ) ) ( not ( = ?auto_893888 ?auto_893893 ) ) ( not ( = ?auto_893888 ?auto_893894 ) ) ( not ( = ?auto_893888 ?auto_893895 ) ) ( not ( = ?auto_893888 ?auto_893896 ) ) ( not ( = ?auto_893888 ?auto_893897 ) ) ( not ( = ?auto_893888 ?auto_893898 ) ) ( not ( = ?auto_893888 ?auto_893899 ) ) ( not ( = ?auto_893888 ?auto_893900 ) ) ( not ( = ?auto_893888 ?auto_893901 ) ) ( not ( = ?auto_893889 ?auto_893890 ) ) ( not ( = ?auto_893889 ?auto_893891 ) ) ( not ( = ?auto_893889 ?auto_893892 ) ) ( not ( = ?auto_893889 ?auto_893893 ) ) ( not ( = ?auto_893889 ?auto_893894 ) ) ( not ( = ?auto_893889 ?auto_893895 ) ) ( not ( = ?auto_893889 ?auto_893896 ) ) ( not ( = ?auto_893889 ?auto_893897 ) ) ( not ( = ?auto_893889 ?auto_893898 ) ) ( not ( = ?auto_893889 ?auto_893899 ) ) ( not ( = ?auto_893889 ?auto_893900 ) ) ( not ( = ?auto_893889 ?auto_893901 ) ) ( not ( = ?auto_893890 ?auto_893891 ) ) ( not ( = ?auto_893890 ?auto_893892 ) ) ( not ( = ?auto_893890 ?auto_893893 ) ) ( not ( = ?auto_893890 ?auto_893894 ) ) ( not ( = ?auto_893890 ?auto_893895 ) ) ( not ( = ?auto_893890 ?auto_893896 ) ) ( not ( = ?auto_893890 ?auto_893897 ) ) ( not ( = ?auto_893890 ?auto_893898 ) ) ( not ( = ?auto_893890 ?auto_893899 ) ) ( not ( = ?auto_893890 ?auto_893900 ) ) ( not ( = ?auto_893890 ?auto_893901 ) ) ( not ( = ?auto_893891 ?auto_893892 ) ) ( not ( = ?auto_893891 ?auto_893893 ) ) ( not ( = ?auto_893891 ?auto_893894 ) ) ( not ( = ?auto_893891 ?auto_893895 ) ) ( not ( = ?auto_893891 ?auto_893896 ) ) ( not ( = ?auto_893891 ?auto_893897 ) ) ( not ( = ?auto_893891 ?auto_893898 ) ) ( not ( = ?auto_893891 ?auto_893899 ) ) ( not ( = ?auto_893891 ?auto_893900 ) ) ( not ( = ?auto_893891 ?auto_893901 ) ) ( not ( = ?auto_893892 ?auto_893893 ) ) ( not ( = ?auto_893892 ?auto_893894 ) ) ( not ( = ?auto_893892 ?auto_893895 ) ) ( not ( = ?auto_893892 ?auto_893896 ) ) ( not ( = ?auto_893892 ?auto_893897 ) ) ( not ( = ?auto_893892 ?auto_893898 ) ) ( not ( = ?auto_893892 ?auto_893899 ) ) ( not ( = ?auto_893892 ?auto_893900 ) ) ( not ( = ?auto_893892 ?auto_893901 ) ) ( not ( = ?auto_893893 ?auto_893894 ) ) ( not ( = ?auto_893893 ?auto_893895 ) ) ( not ( = ?auto_893893 ?auto_893896 ) ) ( not ( = ?auto_893893 ?auto_893897 ) ) ( not ( = ?auto_893893 ?auto_893898 ) ) ( not ( = ?auto_893893 ?auto_893899 ) ) ( not ( = ?auto_893893 ?auto_893900 ) ) ( not ( = ?auto_893893 ?auto_893901 ) ) ( not ( = ?auto_893894 ?auto_893895 ) ) ( not ( = ?auto_893894 ?auto_893896 ) ) ( not ( = ?auto_893894 ?auto_893897 ) ) ( not ( = ?auto_893894 ?auto_893898 ) ) ( not ( = ?auto_893894 ?auto_893899 ) ) ( not ( = ?auto_893894 ?auto_893900 ) ) ( not ( = ?auto_893894 ?auto_893901 ) ) ( not ( = ?auto_893895 ?auto_893896 ) ) ( not ( = ?auto_893895 ?auto_893897 ) ) ( not ( = ?auto_893895 ?auto_893898 ) ) ( not ( = ?auto_893895 ?auto_893899 ) ) ( not ( = ?auto_893895 ?auto_893900 ) ) ( not ( = ?auto_893895 ?auto_893901 ) ) ( not ( = ?auto_893896 ?auto_893897 ) ) ( not ( = ?auto_893896 ?auto_893898 ) ) ( not ( = ?auto_893896 ?auto_893899 ) ) ( not ( = ?auto_893896 ?auto_893900 ) ) ( not ( = ?auto_893896 ?auto_893901 ) ) ( not ( = ?auto_893897 ?auto_893898 ) ) ( not ( = ?auto_893897 ?auto_893899 ) ) ( not ( = ?auto_893897 ?auto_893900 ) ) ( not ( = ?auto_893897 ?auto_893901 ) ) ( not ( = ?auto_893898 ?auto_893899 ) ) ( not ( = ?auto_893898 ?auto_893900 ) ) ( not ( = ?auto_893898 ?auto_893901 ) ) ( not ( = ?auto_893899 ?auto_893900 ) ) ( not ( = ?auto_893899 ?auto_893901 ) ) ( not ( = ?auto_893900 ?auto_893901 ) ) ( ON ?auto_893899 ?auto_893900 ) ( ON ?auto_893898 ?auto_893899 ) ( ON ?auto_893897 ?auto_893898 ) ( ON ?auto_893896 ?auto_893897 ) ( ON ?auto_893895 ?auto_893896 ) ( CLEAR ?auto_893893 ) ( ON ?auto_893894 ?auto_893895 ) ( CLEAR ?auto_893894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_893886 ?auto_893887 ?auto_893888 ?auto_893889 ?auto_893890 ?auto_893891 ?auto_893892 ?auto_893893 ?auto_893894 )
      ( MAKE-15PILE ?auto_893886 ?auto_893887 ?auto_893888 ?auto_893889 ?auto_893890 ?auto_893891 ?auto_893892 ?auto_893893 ?auto_893894 ?auto_893895 ?auto_893896 ?auto_893897 ?auto_893898 ?auto_893899 ?auto_893900 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_893948 - BLOCK
      ?auto_893949 - BLOCK
      ?auto_893950 - BLOCK
      ?auto_893951 - BLOCK
      ?auto_893952 - BLOCK
      ?auto_893953 - BLOCK
      ?auto_893954 - BLOCK
      ?auto_893955 - BLOCK
      ?auto_893956 - BLOCK
      ?auto_893957 - BLOCK
      ?auto_893958 - BLOCK
      ?auto_893959 - BLOCK
      ?auto_893960 - BLOCK
      ?auto_893961 - BLOCK
      ?auto_893962 - BLOCK
    )
    :vars
    (
      ?auto_893963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_893962 ?auto_893963 ) ( ON-TABLE ?auto_893948 ) ( ON ?auto_893949 ?auto_893948 ) ( ON ?auto_893950 ?auto_893949 ) ( ON ?auto_893951 ?auto_893950 ) ( ON ?auto_893952 ?auto_893951 ) ( ON ?auto_893953 ?auto_893952 ) ( ON ?auto_893954 ?auto_893953 ) ( not ( = ?auto_893948 ?auto_893949 ) ) ( not ( = ?auto_893948 ?auto_893950 ) ) ( not ( = ?auto_893948 ?auto_893951 ) ) ( not ( = ?auto_893948 ?auto_893952 ) ) ( not ( = ?auto_893948 ?auto_893953 ) ) ( not ( = ?auto_893948 ?auto_893954 ) ) ( not ( = ?auto_893948 ?auto_893955 ) ) ( not ( = ?auto_893948 ?auto_893956 ) ) ( not ( = ?auto_893948 ?auto_893957 ) ) ( not ( = ?auto_893948 ?auto_893958 ) ) ( not ( = ?auto_893948 ?auto_893959 ) ) ( not ( = ?auto_893948 ?auto_893960 ) ) ( not ( = ?auto_893948 ?auto_893961 ) ) ( not ( = ?auto_893948 ?auto_893962 ) ) ( not ( = ?auto_893948 ?auto_893963 ) ) ( not ( = ?auto_893949 ?auto_893950 ) ) ( not ( = ?auto_893949 ?auto_893951 ) ) ( not ( = ?auto_893949 ?auto_893952 ) ) ( not ( = ?auto_893949 ?auto_893953 ) ) ( not ( = ?auto_893949 ?auto_893954 ) ) ( not ( = ?auto_893949 ?auto_893955 ) ) ( not ( = ?auto_893949 ?auto_893956 ) ) ( not ( = ?auto_893949 ?auto_893957 ) ) ( not ( = ?auto_893949 ?auto_893958 ) ) ( not ( = ?auto_893949 ?auto_893959 ) ) ( not ( = ?auto_893949 ?auto_893960 ) ) ( not ( = ?auto_893949 ?auto_893961 ) ) ( not ( = ?auto_893949 ?auto_893962 ) ) ( not ( = ?auto_893949 ?auto_893963 ) ) ( not ( = ?auto_893950 ?auto_893951 ) ) ( not ( = ?auto_893950 ?auto_893952 ) ) ( not ( = ?auto_893950 ?auto_893953 ) ) ( not ( = ?auto_893950 ?auto_893954 ) ) ( not ( = ?auto_893950 ?auto_893955 ) ) ( not ( = ?auto_893950 ?auto_893956 ) ) ( not ( = ?auto_893950 ?auto_893957 ) ) ( not ( = ?auto_893950 ?auto_893958 ) ) ( not ( = ?auto_893950 ?auto_893959 ) ) ( not ( = ?auto_893950 ?auto_893960 ) ) ( not ( = ?auto_893950 ?auto_893961 ) ) ( not ( = ?auto_893950 ?auto_893962 ) ) ( not ( = ?auto_893950 ?auto_893963 ) ) ( not ( = ?auto_893951 ?auto_893952 ) ) ( not ( = ?auto_893951 ?auto_893953 ) ) ( not ( = ?auto_893951 ?auto_893954 ) ) ( not ( = ?auto_893951 ?auto_893955 ) ) ( not ( = ?auto_893951 ?auto_893956 ) ) ( not ( = ?auto_893951 ?auto_893957 ) ) ( not ( = ?auto_893951 ?auto_893958 ) ) ( not ( = ?auto_893951 ?auto_893959 ) ) ( not ( = ?auto_893951 ?auto_893960 ) ) ( not ( = ?auto_893951 ?auto_893961 ) ) ( not ( = ?auto_893951 ?auto_893962 ) ) ( not ( = ?auto_893951 ?auto_893963 ) ) ( not ( = ?auto_893952 ?auto_893953 ) ) ( not ( = ?auto_893952 ?auto_893954 ) ) ( not ( = ?auto_893952 ?auto_893955 ) ) ( not ( = ?auto_893952 ?auto_893956 ) ) ( not ( = ?auto_893952 ?auto_893957 ) ) ( not ( = ?auto_893952 ?auto_893958 ) ) ( not ( = ?auto_893952 ?auto_893959 ) ) ( not ( = ?auto_893952 ?auto_893960 ) ) ( not ( = ?auto_893952 ?auto_893961 ) ) ( not ( = ?auto_893952 ?auto_893962 ) ) ( not ( = ?auto_893952 ?auto_893963 ) ) ( not ( = ?auto_893953 ?auto_893954 ) ) ( not ( = ?auto_893953 ?auto_893955 ) ) ( not ( = ?auto_893953 ?auto_893956 ) ) ( not ( = ?auto_893953 ?auto_893957 ) ) ( not ( = ?auto_893953 ?auto_893958 ) ) ( not ( = ?auto_893953 ?auto_893959 ) ) ( not ( = ?auto_893953 ?auto_893960 ) ) ( not ( = ?auto_893953 ?auto_893961 ) ) ( not ( = ?auto_893953 ?auto_893962 ) ) ( not ( = ?auto_893953 ?auto_893963 ) ) ( not ( = ?auto_893954 ?auto_893955 ) ) ( not ( = ?auto_893954 ?auto_893956 ) ) ( not ( = ?auto_893954 ?auto_893957 ) ) ( not ( = ?auto_893954 ?auto_893958 ) ) ( not ( = ?auto_893954 ?auto_893959 ) ) ( not ( = ?auto_893954 ?auto_893960 ) ) ( not ( = ?auto_893954 ?auto_893961 ) ) ( not ( = ?auto_893954 ?auto_893962 ) ) ( not ( = ?auto_893954 ?auto_893963 ) ) ( not ( = ?auto_893955 ?auto_893956 ) ) ( not ( = ?auto_893955 ?auto_893957 ) ) ( not ( = ?auto_893955 ?auto_893958 ) ) ( not ( = ?auto_893955 ?auto_893959 ) ) ( not ( = ?auto_893955 ?auto_893960 ) ) ( not ( = ?auto_893955 ?auto_893961 ) ) ( not ( = ?auto_893955 ?auto_893962 ) ) ( not ( = ?auto_893955 ?auto_893963 ) ) ( not ( = ?auto_893956 ?auto_893957 ) ) ( not ( = ?auto_893956 ?auto_893958 ) ) ( not ( = ?auto_893956 ?auto_893959 ) ) ( not ( = ?auto_893956 ?auto_893960 ) ) ( not ( = ?auto_893956 ?auto_893961 ) ) ( not ( = ?auto_893956 ?auto_893962 ) ) ( not ( = ?auto_893956 ?auto_893963 ) ) ( not ( = ?auto_893957 ?auto_893958 ) ) ( not ( = ?auto_893957 ?auto_893959 ) ) ( not ( = ?auto_893957 ?auto_893960 ) ) ( not ( = ?auto_893957 ?auto_893961 ) ) ( not ( = ?auto_893957 ?auto_893962 ) ) ( not ( = ?auto_893957 ?auto_893963 ) ) ( not ( = ?auto_893958 ?auto_893959 ) ) ( not ( = ?auto_893958 ?auto_893960 ) ) ( not ( = ?auto_893958 ?auto_893961 ) ) ( not ( = ?auto_893958 ?auto_893962 ) ) ( not ( = ?auto_893958 ?auto_893963 ) ) ( not ( = ?auto_893959 ?auto_893960 ) ) ( not ( = ?auto_893959 ?auto_893961 ) ) ( not ( = ?auto_893959 ?auto_893962 ) ) ( not ( = ?auto_893959 ?auto_893963 ) ) ( not ( = ?auto_893960 ?auto_893961 ) ) ( not ( = ?auto_893960 ?auto_893962 ) ) ( not ( = ?auto_893960 ?auto_893963 ) ) ( not ( = ?auto_893961 ?auto_893962 ) ) ( not ( = ?auto_893961 ?auto_893963 ) ) ( not ( = ?auto_893962 ?auto_893963 ) ) ( ON ?auto_893961 ?auto_893962 ) ( ON ?auto_893960 ?auto_893961 ) ( ON ?auto_893959 ?auto_893960 ) ( ON ?auto_893958 ?auto_893959 ) ( ON ?auto_893957 ?auto_893958 ) ( ON ?auto_893956 ?auto_893957 ) ( CLEAR ?auto_893954 ) ( ON ?auto_893955 ?auto_893956 ) ( CLEAR ?auto_893955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_893948 ?auto_893949 ?auto_893950 ?auto_893951 ?auto_893952 ?auto_893953 ?auto_893954 ?auto_893955 )
      ( MAKE-15PILE ?auto_893948 ?auto_893949 ?auto_893950 ?auto_893951 ?auto_893952 ?auto_893953 ?auto_893954 ?auto_893955 ?auto_893956 ?auto_893957 ?auto_893958 ?auto_893959 ?auto_893960 ?auto_893961 ?auto_893962 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_894010 - BLOCK
      ?auto_894011 - BLOCK
      ?auto_894012 - BLOCK
      ?auto_894013 - BLOCK
      ?auto_894014 - BLOCK
      ?auto_894015 - BLOCK
      ?auto_894016 - BLOCK
      ?auto_894017 - BLOCK
      ?auto_894018 - BLOCK
      ?auto_894019 - BLOCK
      ?auto_894020 - BLOCK
      ?auto_894021 - BLOCK
      ?auto_894022 - BLOCK
      ?auto_894023 - BLOCK
      ?auto_894024 - BLOCK
    )
    :vars
    (
      ?auto_894025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894024 ?auto_894025 ) ( ON-TABLE ?auto_894010 ) ( ON ?auto_894011 ?auto_894010 ) ( ON ?auto_894012 ?auto_894011 ) ( ON ?auto_894013 ?auto_894012 ) ( ON ?auto_894014 ?auto_894013 ) ( ON ?auto_894015 ?auto_894014 ) ( not ( = ?auto_894010 ?auto_894011 ) ) ( not ( = ?auto_894010 ?auto_894012 ) ) ( not ( = ?auto_894010 ?auto_894013 ) ) ( not ( = ?auto_894010 ?auto_894014 ) ) ( not ( = ?auto_894010 ?auto_894015 ) ) ( not ( = ?auto_894010 ?auto_894016 ) ) ( not ( = ?auto_894010 ?auto_894017 ) ) ( not ( = ?auto_894010 ?auto_894018 ) ) ( not ( = ?auto_894010 ?auto_894019 ) ) ( not ( = ?auto_894010 ?auto_894020 ) ) ( not ( = ?auto_894010 ?auto_894021 ) ) ( not ( = ?auto_894010 ?auto_894022 ) ) ( not ( = ?auto_894010 ?auto_894023 ) ) ( not ( = ?auto_894010 ?auto_894024 ) ) ( not ( = ?auto_894010 ?auto_894025 ) ) ( not ( = ?auto_894011 ?auto_894012 ) ) ( not ( = ?auto_894011 ?auto_894013 ) ) ( not ( = ?auto_894011 ?auto_894014 ) ) ( not ( = ?auto_894011 ?auto_894015 ) ) ( not ( = ?auto_894011 ?auto_894016 ) ) ( not ( = ?auto_894011 ?auto_894017 ) ) ( not ( = ?auto_894011 ?auto_894018 ) ) ( not ( = ?auto_894011 ?auto_894019 ) ) ( not ( = ?auto_894011 ?auto_894020 ) ) ( not ( = ?auto_894011 ?auto_894021 ) ) ( not ( = ?auto_894011 ?auto_894022 ) ) ( not ( = ?auto_894011 ?auto_894023 ) ) ( not ( = ?auto_894011 ?auto_894024 ) ) ( not ( = ?auto_894011 ?auto_894025 ) ) ( not ( = ?auto_894012 ?auto_894013 ) ) ( not ( = ?auto_894012 ?auto_894014 ) ) ( not ( = ?auto_894012 ?auto_894015 ) ) ( not ( = ?auto_894012 ?auto_894016 ) ) ( not ( = ?auto_894012 ?auto_894017 ) ) ( not ( = ?auto_894012 ?auto_894018 ) ) ( not ( = ?auto_894012 ?auto_894019 ) ) ( not ( = ?auto_894012 ?auto_894020 ) ) ( not ( = ?auto_894012 ?auto_894021 ) ) ( not ( = ?auto_894012 ?auto_894022 ) ) ( not ( = ?auto_894012 ?auto_894023 ) ) ( not ( = ?auto_894012 ?auto_894024 ) ) ( not ( = ?auto_894012 ?auto_894025 ) ) ( not ( = ?auto_894013 ?auto_894014 ) ) ( not ( = ?auto_894013 ?auto_894015 ) ) ( not ( = ?auto_894013 ?auto_894016 ) ) ( not ( = ?auto_894013 ?auto_894017 ) ) ( not ( = ?auto_894013 ?auto_894018 ) ) ( not ( = ?auto_894013 ?auto_894019 ) ) ( not ( = ?auto_894013 ?auto_894020 ) ) ( not ( = ?auto_894013 ?auto_894021 ) ) ( not ( = ?auto_894013 ?auto_894022 ) ) ( not ( = ?auto_894013 ?auto_894023 ) ) ( not ( = ?auto_894013 ?auto_894024 ) ) ( not ( = ?auto_894013 ?auto_894025 ) ) ( not ( = ?auto_894014 ?auto_894015 ) ) ( not ( = ?auto_894014 ?auto_894016 ) ) ( not ( = ?auto_894014 ?auto_894017 ) ) ( not ( = ?auto_894014 ?auto_894018 ) ) ( not ( = ?auto_894014 ?auto_894019 ) ) ( not ( = ?auto_894014 ?auto_894020 ) ) ( not ( = ?auto_894014 ?auto_894021 ) ) ( not ( = ?auto_894014 ?auto_894022 ) ) ( not ( = ?auto_894014 ?auto_894023 ) ) ( not ( = ?auto_894014 ?auto_894024 ) ) ( not ( = ?auto_894014 ?auto_894025 ) ) ( not ( = ?auto_894015 ?auto_894016 ) ) ( not ( = ?auto_894015 ?auto_894017 ) ) ( not ( = ?auto_894015 ?auto_894018 ) ) ( not ( = ?auto_894015 ?auto_894019 ) ) ( not ( = ?auto_894015 ?auto_894020 ) ) ( not ( = ?auto_894015 ?auto_894021 ) ) ( not ( = ?auto_894015 ?auto_894022 ) ) ( not ( = ?auto_894015 ?auto_894023 ) ) ( not ( = ?auto_894015 ?auto_894024 ) ) ( not ( = ?auto_894015 ?auto_894025 ) ) ( not ( = ?auto_894016 ?auto_894017 ) ) ( not ( = ?auto_894016 ?auto_894018 ) ) ( not ( = ?auto_894016 ?auto_894019 ) ) ( not ( = ?auto_894016 ?auto_894020 ) ) ( not ( = ?auto_894016 ?auto_894021 ) ) ( not ( = ?auto_894016 ?auto_894022 ) ) ( not ( = ?auto_894016 ?auto_894023 ) ) ( not ( = ?auto_894016 ?auto_894024 ) ) ( not ( = ?auto_894016 ?auto_894025 ) ) ( not ( = ?auto_894017 ?auto_894018 ) ) ( not ( = ?auto_894017 ?auto_894019 ) ) ( not ( = ?auto_894017 ?auto_894020 ) ) ( not ( = ?auto_894017 ?auto_894021 ) ) ( not ( = ?auto_894017 ?auto_894022 ) ) ( not ( = ?auto_894017 ?auto_894023 ) ) ( not ( = ?auto_894017 ?auto_894024 ) ) ( not ( = ?auto_894017 ?auto_894025 ) ) ( not ( = ?auto_894018 ?auto_894019 ) ) ( not ( = ?auto_894018 ?auto_894020 ) ) ( not ( = ?auto_894018 ?auto_894021 ) ) ( not ( = ?auto_894018 ?auto_894022 ) ) ( not ( = ?auto_894018 ?auto_894023 ) ) ( not ( = ?auto_894018 ?auto_894024 ) ) ( not ( = ?auto_894018 ?auto_894025 ) ) ( not ( = ?auto_894019 ?auto_894020 ) ) ( not ( = ?auto_894019 ?auto_894021 ) ) ( not ( = ?auto_894019 ?auto_894022 ) ) ( not ( = ?auto_894019 ?auto_894023 ) ) ( not ( = ?auto_894019 ?auto_894024 ) ) ( not ( = ?auto_894019 ?auto_894025 ) ) ( not ( = ?auto_894020 ?auto_894021 ) ) ( not ( = ?auto_894020 ?auto_894022 ) ) ( not ( = ?auto_894020 ?auto_894023 ) ) ( not ( = ?auto_894020 ?auto_894024 ) ) ( not ( = ?auto_894020 ?auto_894025 ) ) ( not ( = ?auto_894021 ?auto_894022 ) ) ( not ( = ?auto_894021 ?auto_894023 ) ) ( not ( = ?auto_894021 ?auto_894024 ) ) ( not ( = ?auto_894021 ?auto_894025 ) ) ( not ( = ?auto_894022 ?auto_894023 ) ) ( not ( = ?auto_894022 ?auto_894024 ) ) ( not ( = ?auto_894022 ?auto_894025 ) ) ( not ( = ?auto_894023 ?auto_894024 ) ) ( not ( = ?auto_894023 ?auto_894025 ) ) ( not ( = ?auto_894024 ?auto_894025 ) ) ( ON ?auto_894023 ?auto_894024 ) ( ON ?auto_894022 ?auto_894023 ) ( ON ?auto_894021 ?auto_894022 ) ( ON ?auto_894020 ?auto_894021 ) ( ON ?auto_894019 ?auto_894020 ) ( ON ?auto_894018 ?auto_894019 ) ( ON ?auto_894017 ?auto_894018 ) ( CLEAR ?auto_894015 ) ( ON ?auto_894016 ?auto_894017 ) ( CLEAR ?auto_894016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_894010 ?auto_894011 ?auto_894012 ?auto_894013 ?auto_894014 ?auto_894015 ?auto_894016 )
      ( MAKE-15PILE ?auto_894010 ?auto_894011 ?auto_894012 ?auto_894013 ?auto_894014 ?auto_894015 ?auto_894016 ?auto_894017 ?auto_894018 ?auto_894019 ?auto_894020 ?auto_894021 ?auto_894022 ?auto_894023 ?auto_894024 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_894072 - BLOCK
      ?auto_894073 - BLOCK
      ?auto_894074 - BLOCK
      ?auto_894075 - BLOCK
      ?auto_894076 - BLOCK
      ?auto_894077 - BLOCK
      ?auto_894078 - BLOCK
      ?auto_894079 - BLOCK
      ?auto_894080 - BLOCK
      ?auto_894081 - BLOCK
      ?auto_894082 - BLOCK
      ?auto_894083 - BLOCK
      ?auto_894084 - BLOCK
      ?auto_894085 - BLOCK
      ?auto_894086 - BLOCK
    )
    :vars
    (
      ?auto_894087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894086 ?auto_894087 ) ( ON-TABLE ?auto_894072 ) ( ON ?auto_894073 ?auto_894072 ) ( ON ?auto_894074 ?auto_894073 ) ( ON ?auto_894075 ?auto_894074 ) ( ON ?auto_894076 ?auto_894075 ) ( not ( = ?auto_894072 ?auto_894073 ) ) ( not ( = ?auto_894072 ?auto_894074 ) ) ( not ( = ?auto_894072 ?auto_894075 ) ) ( not ( = ?auto_894072 ?auto_894076 ) ) ( not ( = ?auto_894072 ?auto_894077 ) ) ( not ( = ?auto_894072 ?auto_894078 ) ) ( not ( = ?auto_894072 ?auto_894079 ) ) ( not ( = ?auto_894072 ?auto_894080 ) ) ( not ( = ?auto_894072 ?auto_894081 ) ) ( not ( = ?auto_894072 ?auto_894082 ) ) ( not ( = ?auto_894072 ?auto_894083 ) ) ( not ( = ?auto_894072 ?auto_894084 ) ) ( not ( = ?auto_894072 ?auto_894085 ) ) ( not ( = ?auto_894072 ?auto_894086 ) ) ( not ( = ?auto_894072 ?auto_894087 ) ) ( not ( = ?auto_894073 ?auto_894074 ) ) ( not ( = ?auto_894073 ?auto_894075 ) ) ( not ( = ?auto_894073 ?auto_894076 ) ) ( not ( = ?auto_894073 ?auto_894077 ) ) ( not ( = ?auto_894073 ?auto_894078 ) ) ( not ( = ?auto_894073 ?auto_894079 ) ) ( not ( = ?auto_894073 ?auto_894080 ) ) ( not ( = ?auto_894073 ?auto_894081 ) ) ( not ( = ?auto_894073 ?auto_894082 ) ) ( not ( = ?auto_894073 ?auto_894083 ) ) ( not ( = ?auto_894073 ?auto_894084 ) ) ( not ( = ?auto_894073 ?auto_894085 ) ) ( not ( = ?auto_894073 ?auto_894086 ) ) ( not ( = ?auto_894073 ?auto_894087 ) ) ( not ( = ?auto_894074 ?auto_894075 ) ) ( not ( = ?auto_894074 ?auto_894076 ) ) ( not ( = ?auto_894074 ?auto_894077 ) ) ( not ( = ?auto_894074 ?auto_894078 ) ) ( not ( = ?auto_894074 ?auto_894079 ) ) ( not ( = ?auto_894074 ?auto_894080 ) ) ( not ( = ?auto_894074 ?auto_894081 ) ) ( not ( = ?auto_894074 ?auto_894082 ) ) ( not ( = ?auto_894074 ?auto_894083 ) ) ( not ( = ?auto_894074 ?auto_894084 ) ) ( not ( = ?auto_894074 ?auto_894085 ) ) ( not ( = ?auto_894074 ?auto_894086 ) ) ( not ( = ?auto_894074 ?auto_894087 ) ) ( not ( = ?auto_894075 ?auto_894076 ) ) ( not ( = ?auto_894075 ?auto_894077 ) ) ( not ( = ?auto_894075 ?auto_894078 ) ) ( not ( = ?auto_894075 ?auto_894079 ) ) ( not ( = ?auto_894075 ?auto_894080 ) ) ( not ( = ?auto_894075 ?auto_894081 ) ) ( not ( = ?auto_894075 ?auto_894082 ) ) ( not ( = ?auto_894075 ?auto_894083 ) ) ( not ( = ?auto_894075 ?auto_894084 ) ) ( not ( = ?auto_894075 ?auto_894085 ) ) ( not ( = ?auto_894075 ?auto_894086 ) ) ( not ( = ?auto_894075 ?auto_894087 ) ) ( not ( = ?auto_894076 ?auto_894077 ) ) ( not ( = ?auto_894076 ?auto_894078 ) ) ( not ( = ?auto_894076 ?auto_894079 ) ) ( not ( = ?auto_894076 ?auto_894080 ) ) ( not ( = ?auto_894076 ?auto_894081 ) ) ( not ( = ?auto_894076 ?auto_894082 ) ) ( not ( = ?auto_894076 ?auto_894083 ) ) ( not ( = ?auto_894076 ?auto_894084 ) ) ( not ( = ?auto_894076 ?auto_894085 ) ) ( not ( = ?auto_894076 ?auto_894086 ) ) ( not ( = ?auto_894076 ?auto_894087 ) ) ( not ( = ?auto_894077 ?auto_894078 ) ) ( not ( = ?auto_894077 ?auto_894079 ) ) ( not ( = ?auto_894077 ?auto_894080 ) ) ( not ( = ?auto_894077 ?auto_894081 ) ) ( not ( = ?auto_894077 ?auto_894082 ) ) ( not ( = ?auto_894077 ?auto_894083 ) ) ( not ( = ?auto_894077 ?auto_894084 ) ) ( not ( = ?auto_894077 ?auto_894085 ) ) ( not ( = ?auto_894077 ?auto_894086 ) ) ( not ( = ?auto_894077 ?auto_894087 ) ) ( not ( = ?auto_894078 ?auto_894079 ) ) ( not ( = ?auto_894078 ?auto_894080 ) ) ( not ( = ?auto_894078 ?auto_894081 ) ) ( not ( = ?auto_894078 ?auto_894082 ) ) ( not ( = ?auto_894078 ?auto_894083 ) ) ( not ( = ?auto_894078 ?auto_894084 ) ) ( not ( = ?auto_894078 ?auto_894085 ) ) ( not ( = ?auto_894078 ?auto_894086 ) ) ( not ( = ?auto_894078 ?auto_894087 ) ) ( not ( = ?auto_894079 ?auto_894080 ) ) ( not ( = ?auto_894079 ?auto_894081 ) ) ( not ( = ?auto_894079 ?auto_894082 ) ) ( not ( = ?auto_894079 ?auto_894083 ) ) ( not ( = ?auto_894079 ?auto_894084 ) ) ( not ( = ?auto_894079 ?auto_894085 ) ) ( not ( = ?auto_894079 ?auto_894086 ) ) ( not ( = ?auto_894079 ?auto_894087 ) ) ( not ( = ?auto_894080 ?auto_894081 ) ) ( not ( = ?auto_894080 ?auto_894082 ) ) ( not ( = ?auto_894080 ?auto_894083 ) ) ( not ( = ?auto_894080 ?auto_894084 ) ) ( not ( = ?auto_894080 ?auto_894085 ) ) ( not ( = ?auto_894080 ?auto_894086 ) ) ( not ( = ?auto_894080 ?auto_894087 ) ) ( not ( = ?auto_894081 ?auto_894082 ) ) ( not ( = ?auto_894081 ?auto_894083 ) ) ( not ( = ?auto_894081 ?auto_894084 ) ) ( not ( = ?auto_894081 ?auto_894085 ) ) ( not ( = ?auto_894081 ?auto_894086 ) ) ( not ( = ?auto_894081 ?auto_894087 ) ) ( not ( = ?auto_894082 ?auto_894083 ) ) ( not ( = ?auto_894082 ?auto_894084 ) ) ( not ( = ?auto_894082 ?auto_894085 ) ) ( not ( = ?auto_894082 ?auto_894086 ) ) ( not ( = ?auto_894082 ?auto_894087 ) ) ( not ( = ?auto_894083 ?auto_894084 ) ) ( not ( = ?auto_894083 ?auto_894085 ) ) ( not ( = ?auto_894083 ?auto_894086 ) ) ( not ( = ?auto_894083 ?auto_894087 ) ) ( not ( = ?auto_894084 ?auto_894085 ) ) ( not ( = ?auto_894084 ?auto_894086 ) ) ( not ( = ?auto_894084 ?auto_894087 ) ) ( not ( = ?auto_894085 ?auto_894086 ) ) ( not ( = ?auto_894085 ?auto_894087 ) ) ( not ( = ?auto_894086 ?auto_894087 ) ) ( ON ?auto_894085 ?auto_894086 ) ( ON ?auto_894084 ?auto_894085 ) ( ON ?auto_894083 ?auto_894084 ) ( ON ?auto_894082 ?auto_894083 ) ( ON ?auto_894081 ?auto_894082 ) ( ON ?auto_894080 ?auto_894081 ) ( ON ?auto_894079 ?auto_894080 ) ( ON ?auto_894078 ?auto_894079 ) ( CLEAR ?auto_894076 ) ( ON ?auto_894077 ?auto_894078 ) ( CLEAR ?auto_894077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_894072 ?auto_894073 ?auto_894074 ?auto_894075 ?auto_894076 ?auto_894077 )
      ( MAKE-15PILE ?auto_894072 ?auto_894073 ?auto_894074 ?auto_894075 ?auto_894076 ?auto_894077 ?auto_894078 ?auto_894079 ?auto_894080 ?auto_894081 ?auto_894082 ?auto_894083 ?auto_894084 ?auto_894085 ?auto_894086 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_894134 - BLOCK
      ?auto_894135 - BLOCK
      ?auto_894136 - BLOCK
      ?auto_894137 - BLOCK
      ?auto_894138 - BLOCK
      ?auto_894139 - BLOCK
      ?auto_894140 - BLOCK
      ?auto_894141 - BLOCK
      ?auto_894142 - BLOCK
      ?auto_894143 - BLOCK
      ?auto_894144 - BLOCK
      ?auto_894145 - BLOCK
      ?auto_894146 - BLOCK
      ?auto_894147 - BLOCK
      ?auto_894148 - BLOCK
    )
    :vars
    (
      ?auto_894149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894148 ?auto_894149 ) ( ON-TABLE ?auto_894134 ) ( ON ?auto_894135 ?auto_894134 ) ( ON ?auto_894136 ?auto_894135 ) ( ON ?auto_894137 ?auto_894136 ) ( not ( = ?auto_894134 ?auto_894135 ) ) ( not ( = ?auto_894134 ?auto_894136 ) ) ( not ( = ?auto_894134 ?auto_894137 ) ) ( not ( = ?auto_894134 ?auto_894138 ) ) ( not ( = ?auto_894134 ?auto_894139 ) ) ( not ( = ?auto_894134 ?auto_894140 ) ) ( not ( = ?auto_894134 ?auto_894141 ) ) ( not ( = ?auto_894134 ?auto_894142 ) ) ( not ( = ?auto_894134 ?auto_894143 ) ) ( not ( = ?auto_894134 ?auto_894144 ) ) ( not ( = ?auto_894134 ?auto_894145 ) ) ( not ( = ?auto_894134 ?auto_894146 ) ) ( not ( = ?auto_894134 ?auto_894147 ) ) ( not ( = ?auto_894134 ?auto_894148 ) ) ( not ( = ?auto_894134 ?auto_894149 ) ) ( not ( = ?auto_894135 ?auto_894136 ) ) ( not ( = ?auto_894135 ?auto_894137 ) ) ( not ( = ?auto_894135 ?auto_894138 ) ) ( not ( = ?auto_894135 ?auto_894139 ) ) ( not ( = ?auto_894135 ?auto_894140 ) ) ( not ( = ?auto_894135 ?auto_894141 ) ) ( not ( = ?auto_894135 ?auto_894142 ) ) ( not ( = ?auto_894135 ?auto_894143 ) ) ( not ( = ?auto_894135 ?auto_894144 ) ) ( not ( = ?auto_894135 ?auto_894145 ) ) ( not ( = ?auto_894135 ?auto_894146 ) ) ( not ( = ?auto_894135 ?auto_894147 ) ) ( not ( = ?auto_894135 ?auto_894148 ) ) ( not ( = ?auto_894135 ?auto_894149 ) ) ( not ( = ?auto_894136 ?auto_894137 ) ) ( not ( = ?auto_894136 ?auto_894138 ) ) ( not ( = ?auto_894136 ?auto_894139 ) ) ( not ( = ?auto_894136 ?auto_894140 ) ) ( not ( = ?auto_894136 ?auto_894141 ) ) ( not ( = ?auto_894136 ?auto_894142 ) ) ( not ( = ?auto_894136 ?auto_894143 ) ) ( not ( = ?auto_894136 ?auto_894144 ) ) ( not ( = ?auto_894136 ?auto_894145 ) ) ( not ( = ?auto_894136 ?auto_894146 ) ) ( not ( = ?auto_894136 ?auto_894147 ) ) ( not ( = ?auto_894136 ?auto_894148 ) ) ( not ( = ?auto_894136 ?auto_894149 ) ) ( not ( = ?auto_894137 ?auto_894138 ) ) ( not ( = ?auto_894137 ?auto_894139 ) ) ( not ( = ?auto_894137 ?auto_894140 ) ) ( not ( = ?auto_894137 ?auto_894141 ) ) ( not ( = ?auto_894137 ?auto_894142 ) ) ( not ( = ?auto_894137 ?auto_894143 ) ) ( not ( = ?auto_894137 ?auto_894144 ) ) ( not ( = ?auto_894137 ?auto_894145 ) ) ( not ( = ?auto_894137 ?auto_894146 ) ) ( not ( = ?auto_894137 ?auto_894147 ) ) ( not ( = ?auto_894137 ?auto_894148 ) ) ( not ( = ?auto_894137 ?auto_894149 ) ) ( not ( = ?auto_894138 ?auto_894139 ) ) ( not ( = ?auto_894138 ?auto_894140 ) ) ( not ( = ?auto_894138 ?auto_894141 ) ) ( not ( = ?auto_894138 ?auto_894142 ) ) ( not ( = ?auto_894138 ?auto_894143 ) ) ( not ( = ?auto_894138 ?auto_894144 ) ) ( not ( = ?auto_894138 ?auto_894145 ) ) ( not ( = ?auto_894138 ?auto_894146 ) ) ( not ( = ?auto_894138 ?auto_894147 ) ) ( not ( = ?auto_894138 ?auto_894148 ) ) ( not ( = ?auto_894138 ?auto_894149 ) ) ( not ( = ?auto_894139 ?auto_894140 ) ) ( not ( = ?auto_894139 ?auto_894141 ) ) ( not ( = ?auto_894139 ?auto_894142 ) ) ( not ( = ?auto_894139 ?auto_894143 ) ) ( not ( = ?auto_894139 ?auto_894144 ) ) ( not ( = ?auto_894139 ?auto_894145 ) ) ( not ( = ?auto_894139 ?auto_894146 ) ) ( not ( = ?auto_894139 ?auto_894147 ) ) ( not ( = ?auto_894139 ?auto_894148 ) ) ( not ( = ?auto_894139 ?auto_894149 ) ) ( not ( = ?auto_894140 ?auto_894141 ) ) ( not ( = ?auto_894140 ?auto_894142 ) ) ( not ( = ?auto_894140 ?auto_894143 ) ) ( not ( = ?auto_894140 ?auto_894144 ) ) ( not ( = ?auto_894140 ?auto_894145 ) ) ( not ( = ?auto_894140 ?auto_894146 ) ) ( not ( = ?auto_894140 ?auto_894147 ) ) ( not ( = ?auto_894140 ?auto_894148 ) ) ( not ( = ?auto_894140 ?auto_894149 ) ) ( not ( = ?auto_894141 ?auto_894142 ) ) ( not ( = ?auto_894141 ?auto_894143 ) ) ( not ( = ?auto_894141 ?auto_894144 ) ) ( not ( = ?auto_894141 ?auto_894145 ) ) ( not ( = ?auto_894141 ?auto_894146 ) ) ( not ( = ?auto_894141 ?auto_894147 ) ) ( not ( = ?auto_894141 ?auto_894148 ) ) ( not ( = ?auto_894141 ?auto_894149 ) ) ( not ( = ?auto_894142 ?auto_894143 ) ) ( not ( = ?auto_894142 ?auto_894144 ) ) ( not ( = ?auto_894142 ?auto_894145 ) ) ( not ( = ?auto_894142 ?auto_894146 ) ) ( not ( = ?auto_894142 ?auto_894147 ) ) ( not ( = ?auto_894142 ?auto_894148 ) ) ( not ( = ?auto_894142 ?auto_894149 ) ) ( not ( = ?auto_894143 ?auto_894144 ) ) ( not ( = ?auto_894143 ?auto_894145 ) ) ( not ( = ?auto_894143 ?auto_894146 ) ) ( not ( = ?auto_894143 ?auto_894147 ) ) ( not ( = ?auto_894143 ?auto_894148 ) ) ( not ( = ?auto_894143 ?auto_894149 ) ) ( not ( = ?auto_894144 ?auto_894145 ) ) ( not ( = ?auto_894144 ?auto_894146 ) ) ( not ( = ?auto_894144 ?auto_894147 ) ) ( not ( = ?auto_894144 ?auto_894148 ) ) ( not ( = ?auto_894144 ?auto_894149 ) ) ( not ( = ?auto_894145 ?auto_894146 ) ) ( not ( = ?auto_894145 ?auto_894147 ) ) ( not ( = ?auto_894145 ?auto_894148 ) ) ( not ( = ?auto_894145 ?auto_894149 ) ) ( not ( = ?auto_894146 ?auto_894147 ) ) ( not ( = ?auto_894146 ?auto_894148 ) ) ( not ( = ?auto_894146 ?auto_894149 ) ) ( not ( = ?auto_894147 ?auto_894148 ) ) ( not ( = ?auto_894147 ?auto_894149 ) ) ( not ( = ?auto_894148 ?auto_894149 ) ) ( ON ?auto_894147 ?auto_894148 ) ( ON ?auto_894146 ?auto_894147 ) ( ON ?auto_894145 ?auto_894146 ) ( ON ?auto_894144 ?auto_894145 ) ( ON ?auto_894143 ?auto_894144 ) ( ON ?auto_894142 ?auto_894143 ) ( ON ?auto_894141 ?auto_894142 ) ( ON ?auto_894140 ?auto_894141 ) ( ON ?auto_894139 ?auto_894140 ) ( CLEAR ?auto_894137 ) ( ON ?auto_894138 ?auto_894139 ) ( CLEAR ?auto_894138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_894134 ?auto_894135 ?auto_894136 ?auto_894137 ?auto_894138 )
      ( MAKE-15PILE ?auto_894134 ?auto_894135 ?auto_894136 ?auto_894137 ?auto_894138 ?auto_894139 ?auto_894140 ?auto_894141 ?auto_894142 ?auto_894143 ?auto_894144 ?auto_894145 ?auto_894146 ?auto_894147 ?auto_894148 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_894196 - BLOCK
      ?auto_894197 - BLOCK
      ?auto_894198 - BLOCK
      ?auto_894199 - BLOCK
      ?auto_894200 - BLOCK
      ?auto_894201 - BLOCK
      ?auto_894202 - BLOCK
      ?auto_894203 - BLOCK
      ?auto_894204 - BLOCK
      ?auto_894205 - BLOCK
      ?auto_894206 - BLOCK
      ?auto_894207 - BLOCK
      ?auto_894208 - BLOCK
      ?auto_894209 - BLOCK
      ?auto_894210 - BLOCK
    )
    :vars
    (
      ?auto_894211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894210 ?auto_894211 ) ( ON-TABLE ?auto_894196 ) ( ON ?auto_894197 ?auto_894196 ) ( ON ?auto_894198 ?auto_894197 ) ( not ( = ?auto_894196 ?auto_894197 ) ) ( not ( = ?auto_894196 ?auto_894198 ) ) ( not ( = ?auto_894196 ?auto_894199 ) ) ( not ( = ?auto_894196 ?auto_894200 ) ) ( not ( = ?auto_894196 ?auto_894201 ) ) ( not ( = ?auto_894196 ?auto_894202 ) ) ( not ( = ?auto_894196 ?auto_894203 ) ) ( not ( = ?auto_894196 ?auto_894204 ) ) ( not ( = ?auto_894196 ?auto_894205 ) ) ( not ( = ?auto_894196 ?auto_894206 ) ) ( not ( = ?auto_894196 ?auto_894207 ) ) ( not ( = ?auto_894196 ?auto_894208 ) ) ( not ( = ?auto_894196 ?auto_894209 ) ) ( not ( = ?auto_894196 ?auto_894210 ) ) ( not ( = ?auto_894196 ?auto_894211 ) ) ( not ( = ?auto_894197 ?auto_894198 ) ) ( not ( = ?auto_894197 ?auto_894199 ) ) ( not ( = ?auto_894197 ?auto_894200 ) ) ( not ( = ?auto_894197 ?auto_894201 ) ) ( not ( = ?auto_894197 ?auto_894202 ) ) ( not ( = ?auto_894197 ?auto_894203 ) ) ( not ( = ?auto_894197 ?auto_894204 ) ) ( not ( = ?auto_894197 ?auto_894205 ) ) ( not ( = ?auto_894197 ?auto_894206 ) ) ( not ( = ?auto_894197 ?auto_894207 ) ) ( not ( = ?auto_894197 ?auto_894208 ) ) ( not ( = ?auto_894197 ?auto_894209 ) ) ( not ( = ?auto_894197 ?auto_894210 ) ) ( not ( = ?auto_894197 ?auto_894211 ) ) ( not ( = ?auto_894198 ?auto_894199 ) ) ( not ( = ?auto_894198 ?auto_894200 ) ) ( not ( = ?auto_894198 ?auto_894201 ) ) ( not ( = ?auto_894198 ?auto_894202 ) ) ( not ( = ?auto_894198 ?auto_894203 ) ) ( not ( = ?auto_894198 ?auto_894204 ) ) ( not ( = ?auto_894198 ?auto_894205 ) ) ( not ( = ?auto_894198 ?auto_894206 ) ) ( not ( = ?auto_894198 ?auto_894207 ) ) ( not ( = ?auto_894198 ?auto_894208 ) ) ( not ( = ?auto_894198 ?auto_894209 ) ) ( not ( = ?auto_894198 ?auto_894210 ) ) ( not ( = ?auto_894198 ?auto_894211 ) ) ( not ( = ?auto_894199 ?auto_894200 ) ) ( not ( = ?auto_894199 ?auto_894201 ) ) ( not ( = ?auto_894199 ?auto_894202 ) ) ( not ( = ?auto_894199 ?auto_894203 ) ) ( not ( = ?auto_894199 ?auto_894204 ) ) ( not ( = ?auto_894199 ?auto_894205 ) ) ( not ( = ?auto_894199 ?auto_894206 ) ) ( not ( = ?auto_894199 ?auto_894207 ) ) ( not ( = ?auto_894199 ?auto_894208 ) ) ( not ( = ?auto_894199 ?auto_894209 ) ) ( not ( = ?auto_894199 ?auto_894210 ) ) ( not ( = ?auto_894199 ?auto_894211 ) ) ( not ( = ?auto_894200 ?auto_894201 ) ) ( not ( = ?auto_894200 ?auto_894202 ) ) ( not ( = ?auto_894200 ?auto_894203 ) ) ( not ( = ?auto_894200 ?auto_894204 ) ) ( not ( = ?auto_894200 ?auto_894205 ) ) ( not ( = ?auto_894200 ?auto_894206 ) ) ( not ( = ?auto_894200 ?auto_894207 ) ) ( not ( = ?auto_894200 ?auto_894208 ) ) ( not ( = ?auto_894200 ?auto_894209 ) ) ( not ( = ?auto_894200 ?auto_894210 ) ) ( not ( = ?auto_894200 ?auto_894211 ) ) ( not ( = ?auto_894201 ?auto_894202 ) ) ( not ( = ?auto_894201 ?auto_894203 ) ) ( not ( = ?auto_894201 ?auto_894204 ) ) ( not ( = ?auto_894201 ?auto_894205 ) ) ( not ( = ?auto_894201 ?auto_894206 ) ) ( not ( = ?auto_894201 ?auto_894207 ) ) ( not ( = ?auto_894201 ?auto_894208 ) ) ( not ( = ?auto_894201 ?auto_894209 ) ) ( not ( = ?auto_894201 ?auto_894210 ) ) ( not ( = ?auto_894201 ?auto_894211 ) ) ( not ( = ?auto_894202 ?auto_894203 ) ) ( not ( = ?auto_894202 ?auto_894204 ) ) ( not ( = ?auto_894202 ?auto_894205 ) ) ( not ( = ?auto_894202 ?auto_894206 ) ) ( not ( = ?auto_894202 ?auto_894207 ) ) ( not ( = ?auto_894202 ?auto_894208 ) ) ( not ( = ?auto_894202 ?auto_894209 ) ) ( not ( = ?auto_894202 ?auto_894210 ) ) ( not ( = ?auto_894202 ?auto_894211 ) ) ( not ( = ?auto_894203 ?auto_894204 ) ) ( not ( = ?auto_894203 ?auto_894205 ) ) ( not ( = ?auto_894203 ?auto_894206 ) ) ( not ( = ?auto_894203 ?auto_894207 ) ) ( not ( = ?auto_894203 ?auto_894208 ) ) ( not ( = ?auto_894203 ?auto_894209 ) ) ( not ( = ?auto_894203 ?auto_894210 ) ) ( not ( = ?auto_894203 ?auto_894211 ) ) ( not ( = ?auto_894204 ?auto_894205 ) ) ( not ( = ?auto_894204 ?auto_894206 ) ) ( not ( = ?auto_894204 ?auto_894207 ) ) ( not ( = ?auto_894204 ?auto_894208 ) ) ( not ( = ?auto_894204 ?auto_894209 ) ) ( not ( = ?auto_894204 ?auto_894210 ) ) ( not ( = ?auto_894204 ?auto_894211 ) ) ( not ( = ?auto_894205 ?auto_894206 ) ) ( not ( = ?auto_894205 ?auto_894207 ) ) ( not ( = ?auto_894205 ?auto_894208 ) ) ( not ( = ?auto_894205 ?auto_894209 ) ) ( not ( = ?auto_894205 ?auto_894210 ) ) ( not ( = ?auto_894205 ?auto_894211 ) ) ( not ( = ?auto_894206 ?auto_894207 ) ) ( not ( = ?auto_894206 ?auto_894208 ) ) ( not ( = ?auto_894206 ?auto_894209 ) ) ( not ( = ?auto_894206 ?auto_894210 ) ) ( not ( = ?auto_894206 ?auto_894211 ) ) ( not ( = ?auto_894207 ?auto_894208 ) ) ( not ( = ?auto_894207 ?auto_894209 ) ) ( not ( = ?auto_894207 ?auto_894210 ) ) ( not ( = ?auto_894207 ?auto_894211 ) ) ( not ( = ?auto_894208 ?auto_894209 ) ) ( not ( = ?auto_894208 ?auto_894210 ) ) ( not ( = ?auto_894208 ?auto_894211 ) ) ( not ( = ?auto_894209 ?auto_894210 ) ) ( not ( = ?auto_894209 ?auto_894211 ) ) ( not ( = ?auto_894210 ?auto_894211 ) ) ( ON ?auto_894209 ?auto_894210 ) ( ON ?auto_894208 ?auto_894209 ) ( ON ?auto_894207 ?auto_894208 ) ( ON ?auto_894206 ?auto_894207 ) ( ON ?auto_894205 ?auto_894206 ) ( ON ?auto_894204 ?auto_894205 ) ( ON ?auto_894203 ?auto_894204 ) ( ON ?auto_894202 ?auto_894203 ) ( ON ?auto_894201 ?auto_894202 ) ( ON ?auto_894200 ?auto_894201 ) ( CLEAR ?auto_894198 ) ( ON ?auto_894199 ?auto_894200 ) ( CLEAR ?auto_894199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_894196 ?auto_894197 ?auto_894198 ?auto_894199 )
      ( MAKE-15PILE ?auto_894196 ?auto_894197 ?auto_894198 ?auto_894199 ?auto_894200 ?auto_894201 ?auto_894202 ?auto_894203 ?auto_894204 ?auto_894205 ?auto_894206 ?auto_894207 ?auto_894208 ?auto_894209 ?auto_894210 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_894258 - BLOCK
      ?auto_894259 - BLOCK
      ?auto_894260 - BLOCK
      ?auto_894261 - BLOCK
      ?auto_894262 - BLOCK
      ?auto_894263 - BLOCK
      ?auto_894264 - BLOCK
      ?auto_894265 - BLOCK
      ?auto_894266 - BLOCK
      ?auto_894267 - BLOCK
      ?auto_894268 - BLOCK
      ?auto_894269 - BLOCK
      ?auto_894270 - BLOCK
      ?auto_894271 - BLOCK
      ?auto_894272 - BLOCK
    )
    :vars
    (
      ?auto_894273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894272 ?auto_894273 ) ( ON-TABLE ?auto_894258 ) ( ON ?auto_894259 ?auto_894258 ) ( not ( = ?auto_894258 ?auto_894259 ) ) ( not ( = ?auto_894258 ?auto_894260 ) ) ( not ( = ?auto_894258 ?auto_894261 ) ) ( not ( = ?auto_894258 ?auto_894262 ) ) ( not ( = ?auto_894258 ?auto_894263 ) ) ( not ( = ?auto_894258 ?auto_894264 ) ) ( not ( = ?auto_894258 ?auto_894265 ) ) ( not ( = ?auto_894258 ?auto_894266 ) ) ( not ( = ?auto_894258 ?auto_894267 ) ) ( not ( = ?auto_894258 ?auto_894268 ) ) ( not ( = ?auto_894258 ?auto_894269 ) ) ( not ( = ?auto_894258 ?auto_894270 ) ) ( not ( = ?auto_894258 ?auto_894271 ) ) ( not ( = ?auto_894258 ?auto_894272 ) ) ( not ( = ?auto_894258 ?auto_894273 ) ) ( not ( = ?auto_894259 ?auto_894260 ) ) ( not ( = ?auto_894259 ?auto_894261 ) ) ( not ( = ?auto_894259 ?auto_894262 ) ) ( not ( = ?auto_894259 ?auto_894263 ) ) ( not ( = ?auto_894259 ?auto_894264 ) ) ( not ( = ?auto_894259 ?auto_894265 ) ) ( not ( = ?auto_894259 ?auto_894266 ) ) ( not ( = ?auto_894259 ?auto_894267 ) ) ( not ( = ?auto_894259 ?auto_894268 ) ) ( not ( = ?auto_894259 ?auto_894269 ) ) ( not ( = ?auto_894259 ?auto_894270 ) ) ( not ( = ?auto_894259 ?auto_894271 ) ) ( not ( = ?auto_894259 ?auto_894272 ) ) ( not ( = ?auto_894259 ?auto_894273 ) ) ( not ( = ?auto_894260 ?auto_894261 ) ) ( not ( = ?auto_894260 ?auto_894262 ) ) ( not ( = ?auto_894260 ?auto_894263 ) ) ( not ( = ?auto_894260 ?auto_894264 ) ) ( not ( = ?auto_894260 ?auto_894265 ) ) ( not ( = ?auto_894260 ?auto_894266 ) ) ( not ( = ?auto_894260 ?auto_894267 ) ) ( not ( = ?auto_894260 ?auto_894268 ) ) ( not ( = ?auto_894260 ?auto_894269 ) ) ( not ( = ?auto_894260 ?auto_894270 ) ) ( not ( = ?auto_894260 ?auto_894271 ) ) ( not ( = ?auto_894260 ?auto_894272 ) ) ( not ( = ?auto_894260 ?auto_894273 ) ) ( not ( = ?auto_894261 ?auto_894262 ) ) ( not ( = ?auto_894261 ?auto_894263 ) ) ( not ( = ?auto_894261 ?auto_894264 ) ) ( not ( = ?auto_894261 ?auto_894265 ) ) ( not ( = ?auto_894261 ?auto_894266 ) ) ( not ( = ?auto_894261 ?auto_894267 ) ) ( not ( = ?auto_894261 ?auto_894268 ) ) ( not ( = ?auto_894261 ?auto_894269 ) ) ( not ( = ?auto_894261 ?auto_894270 ) ) ( not ( = ?auto_894261 ?auto_894271 ) ) ( not ( = ?auto_894261 ?auto_894272 ) ) ( not ( = ?auto_894261 ?auto_894273 ) ) ( not ( = ?auto_894262 ?auto_894263 ) ) ( not ( = ?auto_894262 ?auto_894264 ) ) ( not ( = ?auto_894262 ?auto_894265 ) ) ( not ( = ?auto_894262 ?auto_894266 ) ) ( not ( = ?auto_894262 ?auto_894267 ) ) ( not ( = ?auto_894262 ?auto_894268 ) ) ( not ( = ?auto_894262 ?auto_894269 ) ) ( not ( = ?auto_894262 ?auto_894270 ) ) ( not ( = ?auto_894262 ?auto_894271 ) ) ( not ( = ?auto_894262 ?auto_894272 ) ) ( not ( = ?auto_894262 ?auto_894273 ) ) ( not ( = ?auto_894263 ?auto_894264 ) ) ( not ( = ?auto_894263 ?auto_894265 ) ) ( not ( = ?auto_894263 ?auto_894266 ) ) ( not ( = ?auto_894263 ?auto_894267 ) ) ( not ( = ?auto_894263 ?auto_894268 ) ) ( not ( = ?auto_894263 ?auto_894269 ) ) ( not ( = ?auto_894263 ?auto_894270 ) ) ( not ( = ?auto_894263 ?auto_894271 ) ) ( not ( = ?auto_894263 ?auto_894272 ) ) ( not ( = ?auto_894263 ?auto_894273 ) ) ( not ( = ?auto_894264 ?auto_894265 ) ) ( not ( = ?auto_894264 ?auto_894266 ) ) ( not ( = ?auto_894264 ?auto_894267 ) ) ( not ( = ?auto_894264 ?auto_894268 ) ) ( not ( = ?auto_894264 ?auto_894269 ) ) ( not ( = ?auto_894264 ?auto_894270 ) ) ( not ( = ?auto_894264 ?auto_894271 ) ) ( not ( = ?auto_894264 ?auto_894272 ) ) ( not ( = ?auto_894264 ?auto_894273 ) ) ( not ( = ?auto_894265 ?auto_894266 ) ) ( not ( = ?auto_894265 ?auto_894267 ) ) ( not ( = ?auto_894265 ?auto_894268 ) ) ( not ( = ?auto_894265 ?auto_894269 ) ) ( not ( = ?auto_894265 ?auto_894270 ) ) ( not ( = ?auto_894265 ?auto_894271 ) ) ( not ( = ?auto_894265 ?auto_894272 ) ) ( not ( = ?auto_894265 ?auto_894273 ) ) ( not ( = ?auto_894266 ?auto_894267 ) ) ( not ( = ?auto_894266 ?auto_894268 ) ) ( not ( = ?auto_894266 ?auto_894269 ) ) ( not ( = ?auto_894266 ?auto_894270 ) ) ( not ( = ?auto_894266 ?auto_894271 ) ) ( not ( = ?auto_894266 ?auto_894272 ) ) ( not ( = ?auto_894266 ?auto_894273 ) ) ( not ( = ?auto_894267 ?auto_894268 ) ) ( not ( = ?auto_894267 ?auto_894269 ) ) ( not ( = ?auto_894267 ?auto_894270 ) ) ( not ( = ?auto_894267 ?auto_894271 ) ) ( not ( = ?auto_894267 ?auto_894272 ) ) ( not ( = ?auto_894267 ?auto_894273 ) ) ( not ( = ?auto_894268 ?auto_894269 ) ) ( not ( = ?auto_894268 ?auto_894270 ) ) ( not ( = ?auto_894268 ?auto_894271 ) ) ( not ( = ?auto_894268 ?auto_894272 ) ) ( not ( = ?auto_894268 ?auto_894273 ) ) ( not ( = ?auto_894269 ?auto_894270 ) ) ( not ( = ?auto_894269 ?auto_894271 ) ) ( not ( = ?auto_894269 ?auto_894272 ) ) ( not ( = ?auto_894269 ?auto_894273 ) ) ( not ( = ?auto_894270 ?auto_894271 ) ) ( not ( = ?auto_894270 ?auto_894272 ) ) ( not ( = ?auto_894270 ?auto_894273 ) ) ( not ( = ?auto_894271 ?auto_894272 ) ) ( not ( = ?auto_894271 ?auto_894273 ) ) ( not ( = ?auto_894272 ?auto_894273 ) ) ( ON ?auto_894271 ?auto_894272 ) ( ON ?auto_894270 ?auto_894271 ) ( ON ?auto_894269 ?auto_894270 ) ( ON ?auto_894268 ?auto_894269 ) ( ON ?auto_894267 ?auto_894268 ) ( ON ?auto_894266 ?auto_894267 ) ( ON ?auto_894265 ?auto_894266 ) ( ON ?auto_894264 ?auto_894265 ) ( ON ?auto_894263 ?auto_894264 ) ( ON ?auto_894262 ?auto_894263 ) ( ON ?auto_894261 ?auto_894262 ) ( CLEAR ?auto_894259 ) ( ON ?auto_894260 ?auto_894261 ) ( CLEAR ?auto_894260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_894258 ?auto_894259 ?auto_894260 )
      ( MAKE-15PILE ?auto_894258 ?auto_894259 ?auto_894260 ?auto_894261 ?auto_894262 ?auto_894263 ?auto_894264 ?auto_894265 ?auto_894266 ?auto_894267 ?auto_894268 ?auto_894269 ?auto_894270 ?auto_894271 ?auto_894272 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_894320 - BLOCK
      ?auto_894321 - BLOCK
      ?auto_894322 - BLOCK
      ?auto_894323 - BLOCK
      ?auto_894324 - BLOCK
      ?auto_894325 - BLOCK
      ?auto_894326 - BLOCK
      ?auto_894327 - BLOCK
      ?auto_894328 - BLOCK
      ?auto_894329 - BLOCK
      ?auto_894330 - BLOCK
      ?auto_894331 - BLOCK
      ?auto_894332 - BLOCK
      ?auto_894333 - BLOCK
      ?auto_894334 - BLOCK
    )
    :vars
    (
      ?auto_894335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894334 ?auto_894335 ) ( ON-TABLE ?auto_894320 ) ( not ( = ?auto_894320 ?auto_894321 ) ) ( not ( = ?auto_894320 ?auto_894322 ) ) ( not ( = ?auto_894320 ?auto_894323 ) ) ( not ( = ?auto_894320 ?auto_894324 ) ) ( not ( = ?auto_894320 ?auto_894325 ) ) ( not ( = ?auto_894320 ?auto_894326 ) ) ( not ( = ?auto_894320 ?auto_894327 ) ) ( not ( = ?auto_894320 ?auto_894328 ) ) ( not ( = ?auto_894320 ?auto_894329 ) ) ( not ( = ?auto_894320 ?auto_894330 ) ) ( not ( = ?auto_894320 ?auto_894331 ) ) ( not ( = ?auto_894320 ?auto_894332 ) ) ( not ( = ?auto_894320 ?auto_894333 ) ) ( not ( = ?auto_894320 ?auto_894334 ) ) ( not ( = ?auto_894320 ?auto_894335 ) ) ( not ( = ?auto_894321 ?auto_894322 ) ) ( not ( = ?auto_894321 ?auto_894323 ) ) ( not ( = ?auto_894321 ?auto_894324 ) ) ( not ( = ?auto_894321 ?auto_894325 ) ) ( not ( = ?auto_894321 ?auto_894326 ) ) ( not ( = ?auto_894321 ?auto_894327 ) ) ( not ( = ?auto_894321 ?auto_894328 ) ) ( not ( = ?auto_894321 ?auto_894329 ) ) ( not ( = ?auto_894321 ?auto_894330 ) ) ( not ( = ?auto_894321 ?auto_894331 ) ) ( not ( = ?auto_894321 ?auto_894332 ) ) ( not ( = ?auto_894321 ?auto_894333 ) ) ( not ( = ?auto_894321 ?auto_894334 ) ) ( not ( = ?auto_894321 ?auto_894335 ) ) ( not ( = ?auto_894322 ?auto_894323 ) ) ( not ( = ?auto_894322 ?auto_894324 ) ) ( not ( = ?auto_894322 ?auto_894325 ) ) ( not ( = ?auto_894322 ?auto_894326 ) ) ( not ( = ?auto_894322 ?auto_894327 ) ) ( not ( = ?auto_894322 ?auto_894328 ) ) ( not ( = ?auto_894322 ?auto_894329 ) ) ( not ( = ?auto_894322 ?auto_894330 ) ) ( not ( = ?auto_894322 ?auto_894331 ) ) ( not ( = ?auto_894322 ?auto_894332 ) ) ( not ( = ?auto_894322 ?auto_894333 ) ) ( not ( = ?auto_894322 ?auto_894334 ) ) ( not ( = ?auto_894322 ?auto_894335 ) ) ( not ( = ?auto_894323 ?auto_894324 ) ) ( not ( = ?auto_894323 ?auto_894325 ) ) ( not ( = ?auto_894323 ?auto_894326 ) ) ( not ( = ?auto_894323 ?auto_894327 ) ) ( not ( = ?auto_894323 ?auto_894328 ) ) ( not ( = ?auto_894323 ?auto_894329 ) ) ( not ( = ?auto_894323 ?auto_894330 ) ) ( not ( = ?auto_894323 ?auto_894331 ) ) ( not ( = ?auto_894323 ?auto_894332 ) ) ( not ( = ?auto_894323 ?auto_894333 ) ) ( not ( = ?auto_894323 ?auto_894334 ) ) ( not ( = ?auto_894323 ?auto_894335 ) ) ( not ( = ?auto_894324 ?auto_894325 ) ) ( not ( = ?auto_894324 ?auto_894326 ) ) ( not ( = ?auto_894324 ?auto_894327 ) ) ( not ( = ?auto_894324 ?auto_894328 ) ) ( not ( = ?auto_894324 ?auto_894329 ) ) ( not ( = ?auto_894324 ?auto_894330 ) ) ( not ( = ?auto_894324 ?auto_894331 ) ) ( not ( = ?auto_894324 ?auto_894332 ) ) ( not ( = ?auto_894324 ?auto_894333 ) ) ( not ( = ?auto_894324 ?auto_894334 ) ) ( not ( = ?auto_894324 ?auto_894335 ) ) ( not ( = ?auto_894325 ?auto_894326 ) ) ( not ( = ?auto_894325 ?auto_894327 ) ) ( not ( = ?auto_894325 ?auto_894328 ) ) ( not ( = ?auto_894325 ?auto_894329 ) ) ( not ( = ?auto_894325 ?auto_894330 ) ) ( not ( = ?auto_894325 ?auto_894331 ) ) ( not ( = ?auto_894325 ?auto_894332 ) ) ( not ( = ?auto_894325 ?auto_894333 ) ) ( not ( = ?auto_894325 ?auto_894334 ) ) ( not ( = ?auto_894325 ?auto_894335 ) ) ( not ( = ?auto_894326 ?auto_894327 ) ) ( not ( = ?auto_894326 ?auto_894328 ) ) ( not ( = ?auto_894326 ?auto_894329 ) ) ( not ( = ?auto_894326 ?auto_894330 ) ) ( not ( = ?auto_894326 ?auto_894331 ) ) ( not ( = ?auto_894326 ?auto_894332 ) ) ( not ( = ?auto_894326 ?auto_894333 ) ) ( not ( = ?auto_894326 ?auto_894334 ) ) ( not ( = ?auto_894326 ?auto_894335 ) ) ( not ( = ?auto_894327 ?auto_894328 ) ) ( not ( = ?auto_894327 ?auto_894329 ) ) ( not ( = ?auto_894327 ?auto_894330 ) ) ( not ( = ?auto_894327 ?auto_894331 ) ) ( not ( = ?auto_894327 ?auto_894332 ) ) ( not ( = ?auto_894327 ?auto_894333 ) ) ( not ( = ?auto_894327 ?auto_894334 ) ) ( not ( = ?auto_894327 ?auto_894335 ) ) ( not ( = ?auto_894328 ?auto_894329 ) ) ( not ( = ?auto_894328 ?auto_894330 ) ) ( not ( = ?auto_894328 ?auto_894331 ) ) ( not ( = ?auto_894328 ?auto_894332 ) ) ( not ( = ?auto_894328 ?auto_894333 ) ) ( not ( = ?auto_894328 ?auto_894334 ) ) ( not ( = ?auto_894328 ?auto_894335 ) ) ( not ( = ?auto_894329 ?auto_894330 ) ) ( not ( = ?auto_894329 ?auto_894331 ) ) ( not ( = ?auto_894329 ?auto_894332 ) ) ( not ( = ?auto_894329 ?auto_894333 ) ) ( not ( = ?auto_894329 ?auto_894334 ) ) ( not ( = ?auto_894329 ?auto_894335 ) ) ( not ( = ?auto_894330 ?auto_894331 ) ) ( not ( = ?auto_894330 ?auto_894332 ) ) ( not ( = ?auto_894330 ?auto_894333 ) ) ( not ( = ?auto_894330 ?auto_894334 ) ) ( not ( = ?auto_894330 ?auto_894335 ) ) ( not ( = ?auto_894331 ?auto_894332 ) ) ( not ( = ?auto_894331 ?auto_894333 ) ) ( not ( = ?auto_894331 ?auto_894334 ) ) ( not ( = ?auto_894331 ?auto_894335 ) ) ( not ( = ?auto_894332 ?auto_894333 ) ) ( not ( = ?auto_894332 ?auto_894334 ) ) ( not ( = ?auto_894332 ?auto_894335 ) ) ( not ( = ?auto_894333 ?auto_894334 ) ) ( not ( = ?auto_894333 ?auto_894335 ) ) ( not ( = ?auto_894334 ?auto_894335 ) ) ( ON ?auto_894333 ?auto_894334 ) ( ON ?auto_894332 ?auto_894333 ) ( ON ?auto_894331 ?auto_894332 ) ( ON ?auto_894330 ?auto_894331 ) ( ON ?auto_894329 ?auto_894330 ) ( ON ?auto_894328 ?auto_894329 ) ( ON ?auto_894327 ?auto_894328 ) ( ON ?auto_894326 ?auto_894327 ) ( ON ?auto_894325 ?auto_894326 ) ( ON ?auto_894324 ?auto_894325 ) ( ON ?auto_894323 ?auto_894324 ) ( ON ?auto_894322 ?auto_894323 ) ( CLEAR ?auto_894320 ) ( ON ?auto_894321 ?auto_894322 ) ( CLEAR ?auto_894321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_894320 ?auto_894321 )
      ( MAKE-15PILE ?auto_894320 ?auto_894321 ?auto_894322 ?auto_894323 ?auto_894324 ?auto_894325 ?auto_894326 ?auto_894327 ?auto_894328 ?auto_894329 ?auto_894330 ?auto_894331 ?auto_894332 ?auto_894333 ?auto_894334 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_894382 - BLOCK
      ?auto_894383 - BLOCK
      ?auto_894384 - BLOCK
      ?auto_894385 - BLOCK
      ?auto_894386 - BLOCK
      ?auto_894387 - BLOCK
      ?auto_894388 - BLOCK
      ?auto_894389 - BLOCK
      ?auto_894390 - BLOCK
      ?auto_894391 - BLOCK
      ?auto_894392 - BLOCK
      ?auto_894393 - BLOCK
      ?auto_894394 - BLOCK
      ?auto_894395 - BLOCK
      ?auto_894396 - BLOCK
    )
    :vars
    (
      ?auto_894397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894396 ?auto_894397 ) ( not ( = ?auto_894382 ?auto_894383 ) ) ( not ( = ?auto_894382 ?auto_894384 ) ) ( not ( = ?auto_894382 ?auto_894385 ) ) ( not ( = ?auto_894382 ?auto_894386 ) ) ( not ( = ?auto_894382 ?auto_894387 ) ) ( not ( = ?auto_894382 ?auto_894388 ) ) ( not ( = ?auto_894382 ?auto_894389 ) ) ( not ( = ?auto_894382 ?auto_894390 ) ) ( not ( = ?auto_894382 ?auto_894391 ) ) ( not ( = ?auto_894382 ?auto_894392 ) ) ( not ( = ?auto_894382 ?auto_894393 ) ) ( not ( = ?auto_894382 ?auto_894394 ) ) ( not ( = ?auto_894382 ?auto_894395 ) ) ( not ( = ?auto_894382 ?auto_894396 ) ) ( not ( = ?auto_894382 ?auto_894397 ) ) ( not ( = ?auto_894383 ?auto_894384 ) ) ( not ( = ?auto_894383 ?auto_894385 ) ) ( not ( = ?auto_894383 ?auto_894386 ) ) ( not ( = ?auto_894383 ?auto_894387 ) ) ( not ( = ?auto_894383 ?auto_894388 ) ) ( not ( = ?auto_894383 ?auto_894389 ) ) ( not ( = ?auto_894383 ?auto_894390 ) ) ( not ( = ?auto_894383 ?auto_894391 ) ) ( not ( = ?auto_894383 ?auto_894392 ) ) ( not ( = ?auto_894383 ?auto_894393 ) ) ( not ( = ?auto_894383 ?auto_894394 ) ) ( not ( = ?auto_894383 ?auto_894395 ) ) ( not ( = ?auto_894383 ?auto_894396 ) ) ( not ( = ?auto_894383 ?auto_894397 ) ) ( not ( = ?auto_894384 ?auto_894385 ) ) ( not ( = ?auto_894384 ?auto_894386 ) ) ( not ( = ?auto_894384 ?auto_894387 ) ) ( not ( = ?auto_894384 ?auto_894388 ) ) ( not ( = ?auto_894384 ?auto_894389 ) ) ( not ( = ?auto_894384 ?auto_894390 ) ) ( not ( = ?auto_894384 ?auto_894391 ) ) ( not ( = ?auto_894384 ?auto_894392 ) ) ( not ( = ?auto_894384 ?auto_894393 ) ) ( not ( = ?auto_894384 ?auto_894394 ) ) ( not ( = ?auto_894384 ?auto_894395 ) ) ( not ( = ?auto_894384 ?auto_894396 ) ) ( not ( = ?auto_894384 ?auto_894397 ) ) ( not ( = ?auto_894385 ?auto_894386 ) ) ( not ( = ?auto_894385 ?auto_894387 ) ) ( not ( = ?auto_894385 ?auto_894388 ) ) ( not ( = ?auto_894385 ?auto_894389 ) ) ( not ( = ?auto_894385 ?auto_894390 ) ) ( not ( = ?auto_894385 ?auto_894391 ) ) ( not ( = ?auto_894385 ?auto_894392 ) ) ( not ( = ?auto_894385 ?auto_894393 ) ) ( not ( = ?auto_894385 ?auto_894394 ) ) ( not ( = ?auto_894385 ?auto_894395 ) ) ( not ( = ?auto_894385 ?auto_894396 ) ) ( not ( = ?auto_894385 ?auto_894397 ) ) ( not ( = ?auto_894386 ?auto_894387 ) ) ( not ( = ?auto_894386 ?auto_894388 ) ) ( not ( = ?auto_894386 ?auto_894389 ) ) ( not ( = ?auto_894386 ?auto_894390 ) ) ( not ( = ?auto_894386 ?auto_894391 ) ) ( not ( = ?auto_894386 ?auto_894392 ) ) ( not ( = ?auto_894386 ?auto_894393 ) ) ( not ( = ?auto_894386 ?auto_894394 ) ) ( not ( = ?auto_894386 ?auto_894395 ) ) ( not ( = ?auto_894386 ?auto_894396 ) ) ( not ( = ?auto_894386 ?auto_894397 ) ) ( not ( = ?auto_894387 ?auto_894388 ) ) ( not ( = ?auto_894387 ?auto_894389 ) ) ( not ( = ?auto_894387 ?auto_894390 ) ) ( not ( = ?auto_894387 ?auto_894391 ) ) ( not ( = ?auto_894387 ?auto_894392 ) ) ( not ( = ?auto_894387 ?auto_894393 ) ) ( not ( = ?auto_894387 ?auto_894394 ) ) ( not ( = ?auto_894387 ?auto_894395 ) ) ( not ( = ?auto_894387 ?auto_894396 ) ) ( not ( = ?auto_894387 ?auto_894397 ) ) ( not ( = ?auto_894388 ?auto_894389 ) ) ( not ( = ?auto_894388 ?auto_894390 ) ) ( not ( = ?auto_894388 ?auto_894391 ) ) ( not ( = ?auto_894388 ?auto_894392 ) ) ( not ( = ?auto_894388 ?auto_894393 ) ) ( not ( = ?auto_894388 ?auto_894394 ) ) ( not ( = ?auto_894388 ?auto_894395 ) ) ( not ( = ?auto_894388 ?auto_894396 ) ) ( not ( = ?auto_894388 ?auto_894397 ) ) ( not ( = ?auto_894389 ?auto_894390 ) ) ( not ( = ?auto_894389 ?auto_894391 ) ) ( not ( = ?auto_894389 ?auto_894392 ) ) ( not ( = ?auto_894389 ?auto_894393 ) ) ( not ( = ?auto_894389 ?auto_894394 ) ) ( not ( = ?auto_894389 ?auto_894395 ) ) ( not ( = ?auto_894389 ?auto_894396 ) ) ( not ( = ?auto_894389 ?auto_894397 ) ) ( not ( = ?auto_894390 ?auto_894391 ) ) ( not ( = ?auto_894390 ?auto_894392 ) ) ( not ( = ?auto_894390 ?auto_894393 ) ) ( not ( = ?auto_894390 ?auto_894394 ) ) ( not ( = ?auto_894390 ?auto_894395 ) ) ( not ( = ?auto_894390 ?auto_894396 ) ) ( not ( = ?auto_894390 ?auto_894397 ) ) ( not ( = ?auto_894391 ?auto_894392 ) ) ( not ( = ?auto_894391 ?auto_894393 ) ) ( not ( = ?auto_894391 ?auto_894394 ) ) ( not ( = ?auto_894391 ?auto_894395 ) ) ( not ( = ?auto_894391 ?auto_894396 ) ) ( not ( = ?auto_894391 ?auto_894397 ) ) ( not ( = ?auto_894392 ?auto_894393 ) ) ( not ( = ?auto_894392 ?auto_894394 ) ) ( not ( = ?auto_894392 ?auto_894395 ) ) ( not ( = ?auto_894392 ?auto_894396 ) ) ( not ( = ?auto_894392 ?auto_894397 ) ) ( not ( = ?auto_894393 ?auto_894394 ) ) ( not ( = ?auto_894393 ?auto_894395 ) ) ( not ( = ?auto_894393 ?auto_894396 ) ) ( not ( = ?auto_894393 ?auto_894397 ) ) ( not ( = ?auto_894394 ?auto_894395 ) ) ( not ( = ?auto_894394 ?auto_894396 ) ) ( not ( = ?auto_894394 ?auto_894397 ) ) ( not ( = ?auto_894395 ?auto_894396 ) ) ( not ( = ?auto_894395 ?auto_894397 ) ) ( not ( = ?auto_894396 ?auto_894397 ) ) ( ON ?auto_894395 ?auto_894396 ) ( ON ?auto_894394 ?auto_894395 ) ( ON ?auto_894393 ?auto_894394 ) ( ON ?auto_894392 ?auto_894393 ) ( ON ?auto_894391 ?auto_894392 ) ( ON ?auto_894390 ?auto_894391 ) ( ON ?auto_894389 ?auto_894390 ) ( ON ?auto_894388 ?auto_894389 ) ( ON ?auto_894387 ?auto_894388 ) ( ON ?auto_894386 ?auto_894387 ) ( ON ?auto_894385 ?auto_894386 ) ( ON ?auto_894384 ?auto_894385 ) ( ON ?auto_894383 ?auto_894384 ) ( ON ?auto_894382 ?auto_894383 ) ( CLEAR ?auto_894382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_894382 )
      ( MAKE-15PILE ?auto_894382 ?auto_894383 ?auto_894384 ?auto_894385 ?auto_894386 ?auto_894387 ?auto_894388 ?auto_894389 ?auto_894390 ?auto_894391 ?auto_894392 ?auto_894393 ?auto_894394 ?auto_894395 ?auto_894396 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894445 - BLOCK
      ?auto_894446 - BLOCK
      ?auto_894447 - BLOCK
      ?auto_894448 - BLOCK
      ?auto_894449 - BLOCK
      ?auto_894450 - BLOCK
      ?auto_894451 - BLOCK
      ?auto_894452 - BLOCK
      ?auto_894453 - BLOCK
      ?auto_894454 - BLOCK
      ?auto_894455 - BLOCK
      ?auto_894456 - BLOCK
      ?auto_894457 - BLOCK
      ?auto_894458 - BLOCK
      ?auto_894459 - BLOCK
      ?auto_894460 - BLOCK
    )
    :vars
    (
      ?auto_894461 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_894459 ) ( ON ?auto_894460 ?auto_894461 ) ( CLEAR ?auto_894460 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_894445 ) ( ON ?auto_894446 ?auto_894445 ) ( ON ?auto_894447 ?auto_894446 ) ( ON ?auto_894448 ?auto_894447 ) ( ON ?auto_894449 ?auto_894448 ) ( ON ?auto_894450 ?auto_894449 ) ( ON ?auto_894451 ?auto_894450 ) ( ON ?auto_894452 ?auto_894451 ) ( ON ?auto_894453 ?auto_894452 ) ( ON ?auto_894454 ?auto_894453 ) ( ON ?auto_894455 ?auto_894454 ) ( ON ?auto_894456 ?auto_894455 ) ( ON ?auto_894457 ?auto_894456 ) ( ON ?auto_894458 ?auto_894457 ) ( ON ?auto_894459 ?auto_894458 ) ( not ( = ?auto_894445 ?auto_894446 ) ) ( not ( = ?auto_894445 ?auto_894447 ) ) ( not ( = ?auto_894445 ?auto_894448 ) ) ( not ( = ?auto_894445 ?auto_894449 ) ) ( not ( = ?auto_894445 ?auto_894450 ) ) ( not ( = ?auto_894445 ?auto_894451 ) ) ( not ( = ?auto_894445 ?auto_894452 ) ) ( not ( = ?auto_894445 ?auto_894453 ) ) ( not ( = ?auto_894445 ?auto_894454 ) ) ( not ( = ?auto_894445 ?auto_894455 ) ) ( not ( = ?auto_894445 ?auto_894456 ) ) ( not ( = ?auto_894445 ?auto_894457 ) ) ( not ( = ?auto_894445 ?auto_894458 ) ) ( not ( = ?auto_894445 ?auto_894459 ) ) ( not ( = ?auto_894445 ?auto_894460 ) ) ( not ( = ?auto_894445 ?auto_894461 ) ) ( not ( = ?auto_894446 ?auto_894447 ) ) ( not ( = ?auto_894446 ?auto_894448 ) ) ( not ( = ?auto_894446 ?auto_894449 ) ) ( not ( = ?auto_894446 ?auto_894450 ) ) ( not ( = ?auto_894446 ?auto_894451 ) ) ( not ( = ?auto_894446 ?auto_894452 ) ) ( not ( = ?auto_894446 ?auto_894453 ) ) ( not ( = ?auto_894446 ?auto_894454 ) ) ( not ( = ?auto_894446 ?auto_894455 ) ) ( not ( = ?auto_894446 ?auto_894456 ) ) ( not ( = ?auto_894446 ?auto_894457 ) ) ( not ( = ?auto_894446 ?auto_894458 ) ) ( not ( = ?auto_894446 ?auto_894459 ) ) ( not ( = ?auto_894446 ?auto_894460 ) ) ( not ( = ?auto_894446 ?auto_894461 ) ) ( not ( = ?auto_894447 ?auto_894448 ) ) ( not ( = ?auto_894447 ?auto_894449 ) ) ( not ( = ?auto_894447 ?auto_894450 ) ) ( not ( = ?auto_894447 ?auto_894451 ) ) ( not ( = ?auto_894447 ?auto_894452 ) ) ( not ( = ?auto_894447 ?auto_894453 ) ) ( not ( = ?auto_894447 ?auto_894454 ) ) ( not ( = ?auto_894447 ?auto_894455 ) ) ( not ( = ?auto_894447 ?auto_894456 ) ) ( not ( = ?auto_894447 ?auto_894457 ) ) ( not ( = ?auto_894447 ?auto_894458 ) ) ( not ( = ?auto_894447 ?auto_894459 ) ) ( not ( = ?auto_894447 ?auto_894460 ) ) ( not ( = ?auto_894447 ?auto_894461 ) ) ( not ( = ?auto_894448 ?auto_894449 ) ) ( not ( = ?auto_894448 ?auto_894450 ) ) ( not ( = ?auto_894448 ?auto_894451 ) ) ( not ( = ?auto_894448 ?auto_894452 ) ) ( not ( = ?auto_894448 ?auto_894453 ) ) ( not ( = ?auto_894448 ?auto_894454 ) ) ( not ( = ?auto_894448 ?auto_894455 ) ) ( not ( = ?auto_894448 ?auto_894456 ) ) ( not ( = ?auto_894448 ?auto_894457 ) ) ( not ( = ?auto_894448 ?auto_894458 ) ) ( not ( = ?auto_894448 ?auto_894459 ) ) ( not ( = ?auto_894448 ?auto_894460 ) ) ( not ( = ?auto_894448 ?auto_894461 ) ) ( not ( = ?auto_894449 ?auto_894450 ) ) ( not ( = ?auto_894449 ?auto_894451 ) ) ( not ( = ?auto_894449 ?auto_894452 ) ) ( not ( = ?auto_894449 ?auto_894453 ) ) ( not ( = ?auto_894449 ?auto_894454 ) ) ( not ( = ?auto_894449 ?auto_894455 ) ) ( not ( = ?auto_894449 ?auto_894456 ) ) ( not ( = ?auto_894449 ?auto_894457 ) ) ( not ( = ?auto_894449 ?auto_894458 ) ) ( not ( = ?auto_894449 ?auto_894459 ) ) ( not ( = ?auto_894449 ?auto_894460 ) ) ( not ( = ?auto_894449 ?auto_894461 ) ) ( not ( = ?auto_894450 ?auto_894451 ) ) ( not ( = ?auto_894450 ?auto_894452 ) ) ( not ( = ?auto_894450 ?auto_894453 ) ) ( not ( = ?auto_894450 ?auto_894454 ) ) ( not ( = ?auto_894450 ?auto_894455 ) ) ( not ( = ?auto_894450 ?auto_894456 ) ) ( not ( = ?auto_894450 ?auto_894457 ) ) ( not ( = ?auto_894450 ?auto_894458 ) ) ( not ( = ?auto_894450 ?auto_894459 ) ) ( not ( = ?auto_894450 ?auto_894460 ) ) ( not ( = ?auto_894450 ?auto_894461 ) ) ( not ( = ?auto_894451 ?auto_894452 ) ) ( not ( = ?auto_894451 ?auto_894453 ) ) ( not ( = ?auto_894451 ?auto_894454 ) ) ( not ( = ?auto_894451 ?auto_894455 ) ) ( not ( = ?auto_894451 ?auto_894456 ) ) ( not ( = ?auto_894451 ?auto_894457 ) ) ( not ( = ?auto_894451 ?auto_894458 ) ) ( not ( = ?auto_894451 ?auto_894459 ) ) ( not ( = ?auto_894451 ?auto_894460 ) ) ( not ( = ?auto_894451 ?auto_894461 ) ) ( not ( = ?auto_894452 ?auto_894453 ) ) ( not ( = ?auto_894452 ?auto_894454 ) ) ( not ( = ?auto_894452 ?auto_894455 ) ) ( not ( = ?auto_894452 ?auto_894456 ) ) ( not ( = ?auto_894452 ?auto_894457 ) ) ( not ( = ?auto_894452 ?auto_894458 ) ) ( not ( = ?auto_894452 ?auto_894459 ) ) ( not ( = ?auto_894452 ?auto_894460 ) ) ( not ( = ?auto_894452 ?auto_894461 ) ) ( not ( = ?auto_894453 ?auto_894454 ) ) ( not ( = ?auto_894453 ?auto_894455 ) ) ( not ( = ?auto_894453 ?auto_894456 ) ) ( not ( = ?auto_894453 ?auto_894457 ) ) ( not ( = ?auto_894453 ?auto_894458 ) ) ( not ( = ?auto_894453 ?auto_894459 ) ) ( not ( = ?auto_894453 ?auto_894460 ) ) ( not ( = ?auto_894453 ?auto_894461 ) ) ( not ( = ?auto_894454 ?auto_894455 ) ) ( not ( = ?auto_894454 ?auto_894456 ) ) ( not ( = ?auto_894454 ?auto_894457 ) ) ( not ( = ?auto_894454 ?auto_894458 ) ) ( not ( = ?auto_894454 ?auto_894459 ) ) ( not ( = ?auto_894454 ?auto_894460 ) ) ( not ( = ?auto_894454 ?auto_894461 ) ) ( not ( = ?auto_894455 ?auto_894456 ) ) ( not ( = ?auto_894455 ?auto_894457 ) ) ( not ( = ?auto_894455 ?auto_894458 ) ) ( not ( = ?auto_894455 ?auto_894459 ) ) ( not ( = ?auto_894455 ?auto_894460 ) ) ( not ( = ?auto_894455 ?auto_894461 ) ) ( not ( = ?auto_894456 ?auto_894457 ) ) ( not ( = ?auto_894456 ?auto_894458 ) ) ( not ( = ?auto_894456 ?auto_894459 ) ) ( not ( = ?auto_894456 ?auto_894460 ) ) ( not ( = ?auto_894456 ?auto_894461 ) ) ( not ( = ?auto_894457 ?auto_894458 ) ) ( not ( = ?auto_894457 ?auto_894459 ) ) ( not ( = ?auto_894457 ?auto_894460 ) ) ( not ( = ?auto_894457 ?auto_894461 ) ) ( not ( = ?auto_894458 ?auto_894459 ) ) ( not ( = ?auto_894458 ?auto_894460 ) ) ( not ( = ?auto_894458 ?auto_894461 ) ) ( not ( = ?auto_894459 ?auto_894460 ) ) ( not ( = ?auto_894459 ?auto_894461 ) ) ( not ( = ?auto_894460 ?auto_894461 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_894460 ?auto_894461 )
      ( !STACK ?auto_894460 ?auto_894459 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894511 - BLOCK
      ?auto_894512 - BLOCK
      ?auto_894513 - BLOCK
      ?auto_894514 - BLOCK
      ?auto_894515 - BLOCK
      ?auto_894516 - BLOCK
      ?auto_894517 - BLOCK
      ?auto_894518 - BLOCK
      ?auto_894519 - BLOCK
      ?auto_894520 - BLOCK
      ?auto_894521 - BLOCK
      ?auto_894522 - BLOCK
      ?auto_894523 - BLOCK
      ?auto_894524 - BLOCK
      ?auto_894525 - BLOCK
      ?auto_894526 - BLOCK
    )
    :vars
    (
      ?auto_894527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894526 ?auto_894527 ) ( ON-TABLE ?auto_894511 ) ( ON ?auto_894512 ?auto_894511 ) ( ON ?auto_894513 ?auto_894512 ) ( ON ?auto_894514 ?auto_894513 ) ( ON ?auto_894515 ?auto_894514 ) ( ON ?auto_894516 ?auto_894515 ) ( ON ?auto_894517 ?auto_894516 ) ( ON ?auto_894518 ?auto_894517 ) ( ON ?auto_894519 ?auto_894518 ) ( ON ?auto_894520 ?auto_894519 ) ( ON ?auto_894521 ?auto_894520 ) ( ON ?auto_894522 ?auto_894521 ) ( ON ?auto_894523 ?auto_894522 ) ( ON ?auto_894524 ?auto_894523 ) ( not ( = ?auto_894511 ?auto_894512 ) ) ( not ( = ?auto_894511 ?auto_894513 ) ) ( not ( = ?auto_894511 ?auto_894514 ) ) ( not ( = ?auto_894511 ?auto_894515 ) ) ( not ( = ?auto_894511 ?auto_894516 ) ) ( not ( = ?auto_894511 ?auto_894517 ) ) ( not ( = ?auto_894511 ?auto_894518 ) ) ( not ( = ?auto_894511 ?auto_894519 ) ) ( not ( = ?auto_894511 ?auto_894520 ) ) ( not ( = ?auto_894511 ?auto_894521 ) ) ( not ( = ?auto_894511 ?auto_894522 ) ) ( not ( = ?auto_894511 ?auto_894523 ) ) ( not ( = ?auto_894511 ?auto_894524 ) ) ( not ( = ?auto_894511 ?auto_894525 ) ) ( not ( = ?auto_894511 ?auto_894526 ) ) ( not ( = ?auto_894511 ?auto_894527 ) ) ( not ( = ?auto_894512 ?auto_894513 ) ) ( not ( = ?auto_894512 ?auto_894514 ) ) ( not ( = ?auto_894512 ?auto_894515 ) ) ( not ( = ?auto_894512 ?auto_894516 ) ) ( not ( = ?auto_894512 ?auto_894517 ) ) ( not ( = ?auto_894512 ?auto_894518 ) ) ( not ( = ?auto_894512 ?auto_894519 ) ) ( not ( = ?auto_894512 ?auto_894520 ) ) ( not ( = ?auto_894512 ?auto_894521 ) ) ( not ( = ?auto_894512 ?auto_894522 ) ) ( not ( = ?auto_894512 ?auto_894523 ) ) ( not ( = ?auto_894512 ?auto_894524 ) ) ( not ( = ?auto_894512 ?auto_894525 ) ) ( not ( = ?auto_894512 ?auto_894526 ) ) ( not ( = ?auto_894512 ?auto_894527 ) ) ( not ( = ?auto_894513 ?auto_894514 ) ) ( not ( = ?auto_894513 ?auto_894515 ) ) ( not ( = ?auto_894513 ?auto_894516 ) ) ( not ( = ?auto_894513 ?auto_894517 ) ) ( not ( = ?auto_894513 ?auto_894518 ) ) ( not ( = ?auto_894513 ?auto_894519 ) ) ( not ( = ?auto_894513 ?auto_894520 ) ) ( not ( = ?auto_894513 ?auto_894521 ) ) ( not ( = ?auto_894513 ?auto_894522 ) ) ( not ( = ?auto_894513 ?auto_894523 ) ) ( not ( = ?auto_894513 ?auto_894524 ) ) ( not ( = ?auto_894513 ?auto_894525 ) ) ( not ( = ?auto_894513 ?auto_894526 ) ) ( not ( = ?auto_894513 ?auto_894527 ) ) ( not ( = ?auto_894514 ?auto_894515 ) ) ( not ( = ?auto_894514 ?auto_894516 ) ) ( not ( = ?auto_894514 ?auto_894517 ) ) ( not ( = ?auto_894514 ?auto_894518 ) ) ( not ( = ?auto_894514 ?auto_894519 ) ) ( not ( = ?auto_894514 ?auto_894520 ) ) ( not ( = ?auto_894514 ?auto_894521 ) ) ( not ( = ?auto_894514 ?auto_894522 ) ) ( not ( = ?auto_894514 ?auto_894523 ) ) ( not ( = ?auto_894514 ?auto_894524 ) ) ( not ( = ?auto_894514 ?auto_894525 ) ) ( not ( = ?auto_894514 ?auto_894526 ) ) ( not ( = ?auto_894514 ?auto_894527 ) ) ( not ( = ?auto_894515 ?auto_894516 ) ) ( not ( = ?auto_894515 ?auto_894517 ) ) ( not ( = ?auto_894515 ?auto_894518 ) ) ( not ( = ?auto_894515 ?auto_894519 ) ) ( not ( = ?auto_894515 ?auto_894520 ) ) ( not ( = ?auto_894515 ?auto_894521 ) ) ( not ( = ?auto_894515 ?auto_894522 ) ) ( not ( = ?auto_894515 ?auto_894523 ) ) ( not ( = ?auto_894515 ?auto_894524 ) ) ( not ( = ?auto_894515 ?auto_894525 ) ) ( not ( = ?auto_894515 ?auto_894526 ) ) ( not ( = ?auto_894515 ?auto_894527 ) ) ( not ( = ?auto_894516 ?auto_894517 ) ) ( not ( = ?auto_894516 ?auto_894518 ) ) ( not ( = ?auto_894516 ?auto_894519 ) ) ( not ( = ?auto_894516 ?auto_894520 ) ) ( not ( = ?auto_894516 ?auto_894521 ) ) ( not ( = ?auto_894516 ?auto_894522 ) ) ( not ( = ?auto_894516 ?auto_894523 ) ) ( not ( = ?auto_894516 ?auto_894524 ) ) ( not ( = ?auto_894516 ?auto_894525 ) ) ( not ( = ?auto_894516 ?auto_894526 ) ) ( not ( = ?auto_894516 ?auto_894527 ) ) ( not ( = ?auto_894517 ?auto_894518 ) ) ( not ( = ?auto_894517 ?auto_894519 ) ) ( not ( = ?auto_894517 ?auto_894520 ) ) ( not ( = ?auto_894517 ?auto_894521 ) ) ( not ( = ?auto_894517 ?auto_894522 ) ) ( not ( = ?auto_894517 ?auto_894523 ) ) ( not ( = ?auto_894517 ?auto_894524 ) ) ( not ( = ?auto_894517 ?auto_894525 ) ) ( not ( = ?auto_894517 ?auto_894526 ) ) ( not ( = ?auto_894517 ?auto_894527 ) ) ( not ( = ?auto_894518 ?auto_894519 ) ) ( not ( = ?auto_894518 ?auto_894520 ) ) ( not ( = ?auto_894518 ?auto_894521 ) ) ( not ( = ?auto_894518 ?auto_894522 ) ) ( not ( = ?auto_894518 ?auto_894523 ) ) ( not ( = ?auto_894518 ?auto_894524 ) ) ( not ( = ?auto_894518 ?auto_894525 ) ) ( not ( = ?auto_894518 ?auto_894526 ) ) ( not ( = ?auto_894518 ?auto_894527 ) ) ( not ( = ?auto_894519 ?auto_894520 ) ) ( not ( = ?auto_894519 ?auto_894521 ) ) ( not ( = ?auto_894519 ?auto_894522 ) ) ( not ( = ?auto_894519 ?auto_894523 ) ) ( not ( = ?auto_894519 ?auto_894524 ) ) ( not ( = ?auto_894519 ?auto_894525 ) ) ( not ( = ?auto_894519 ?auto_894526 ) ) ( not ( = ?auto_894519 ?auto_894527 ) ) ( not ( = ?auto_894520 ?auto_894521 ) ) ( not ( = ?auto_894520 ?auto_894522 ) ) ( not ( = ?auto_894520 ?auto_894523 ) ) ( not ( = ?auto_894520 ?auto_894524 ) ) ( not ( = ?auto_894520 ?auto_894525 ) ) ( not ( = ?auto_894520 ?auto_894526 ) ) ( not ( = ?auto_894520 ?auto_894527 ) ) ( not ( = ?auto_894521 ?auto_894522 ) ) ( not ( = ?auto_894521 ?auto_894523 ) ) ( not ( = ?auto_894521 ?auto_894524 ) ) ( not ( = ?auto_894521 ?auto_894525 ) ) ( not ( = ?auto_894521 ?auto_894526 ) ) ( not ( = ?auto_894521 ?auto_894527 ) ) ( not ( = ?auto_894522 ?auto_894523 ) ) ( not ( = ?auto_894522 ?auto_894524 ) ) ( not ( = ?auto_894522 ?auto_894525 ) ) ( not ( = ?auto_894522 ?auto_894526 ) ) ( not ( = ?auto_894522 ?auto_894527 ) ) ( not ( = ?auto_894523 ?auto_894524 ) ) ( not ( = ?auto_894523 ?auto_894525 ) ) ( not ( = ?auto_894523 ?auto_894526 ) ) ( not ( = ?auto_894523 ?auto_894527 ) ) ( not ( = ?auto_894524 ?auto_894525 ) ) ( not ( = ?auto_894524 ?auto_894526 ) ) ( not ( = ?auto_894524 ?auto_894527 ) ) ( not ( = ?auto_894525 ?auto_894526 ) ) ( not ( = ?auto_894525 ?auto_894527 ) ) ( not ( = ?auto_894526 ?auto_894527 ) ) ( CLEAR ?auto_894524 ) ( ON ?auto_894525 ?auto_894526 ) ( CLEAR ?auto_894525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_894511 ?auto_894512 ?auto_894513 ?auto_894514 ?auto_894515 ?auto_894516 ?auto_894517 ?auto_894518 ?auto_894519 ?auto_894520 ?auto_894521 ?auto_894522 ?auto_894523 ?auto_894524 ?auto_894525 )
      ( MAKE-16PILE ?auto_894511 ?auto_894512 ?auto_894513 ?auto_894514 ?auto_894515 ?auto_894516 ?auto_894517 ?auto_894518 ?auto_894519 ?auto_894520 ?auto_894521 ?auto_894522 ?auto_894523 ?auto_894524 ?auto_894525 ?auto_894526 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894577 - BLOCK
      ?auto_894578 - BLOCK
      ?auto_894579 - BLOCK
      ?auto_894580 - BLOCK
      ?auto_894581 - BLOCK
      ?auto_894582 - BLOCK
      ?auto_894583 - BLOCK
      ?auto_894584 - BLOCK
      ?auto_894585 - BLOCK
      ?auto_894586 - BLOCK
      ?auto_894587 - BLOCK
      ?auto_894588 - BLOCK
      ?auto_894589 - BLOCK
      ?auto_894590 - BLOCK
      ?auto_894591 - BLOCK
      ?auto_894592 - BLOCK
    )
    :vars
    (
      ?auto_894593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894592 ?auto_894593 ) ( ON-TABLE ?auto_894577 ) ( ON ?auto_894578 ?auto_894577 ) ( ON ?auto_894579 ?auto_894578 ) ( ON ?auto_894580 ?auto_894579 ) ( ON ?auto_894581 ?auto_894580 ) ( ON ?auto_894582 ?auto_894581 ) ( ON ?auto_894583 ?auto_894582 ) ( ON ?auto_894584 ?auto_894583 ) ( ON ?auto_894585 ?auto_894584 ) ( ON ?auto_894586 ?auto_894585 ) ( ON ?auto_894587 ?auto_894586 ) ( ON ?auto_894588 ?auto_894587 ) ( ON ?auto_894589 ?auto_894588 ) ( not ( = ?auto_894577 ?auto_894578 ) ) ( not ( = ?auto_894577 ?auto_894579 ) ) ( not ( = ?auto_894577 ?auto_894580 ) ) ( not ( = ?auto_894577 ?auto_894581 ) ) ( not ( = ?auto_894577 ?auto_894582 ) ) ( not ( = ?auto_894577 ?auto_894583 ) ) ( not ( = ?auto_894577 ?auto_894584 ) ) ( not ( = ?auto_894577 ?auto_894585 ) ) ( not ( = ?auto_894577 ?auto_894586 ) ) ( not ( = ?auto_894577 ?auto_894587 ) ) ( not ( = ?auto_894577 ?auto_894588 ) ) ( not ( = ?auto_894577 ?auto_894589 ) ) ( not ( = ?auto_894577 ?auto_894590 ) ) ( not ( = ?auto_894577 ?auto_894591 ) ) ( not ( = ?auto_894577 ?auto_894592 ) ) ( not ( = ?auto_894577 ?auto_894593 ) ) ( not ( = ?auto_894578 ?auto_894579 ) ) ( not ( = ?auto_894578 ?auto_894580 ) ) ( not ( = ?auto_894578 ?auto_894581 ) ) ( not ( = ?auto_894578 ?auto_894582 ) ) ( not ( = ?auto_894578 ?auto_894583 ) ) ( not ( = ?auto_894578 ?auto_894584 ) ) ( not ( = ?auto_894578 ?auto_894585 ) ) ( not ( = ?auto_894578 ?auto_894586 ) ) ( not ( = ?auto_894578 ?auto_894587 ) ) ( not ( = ?auto_894578 ?auto_894588 ) ) ( not ( = ?auto_894578 ?auto_894589 ) ) ( not ( = ?auto_894578 ?auto_894590 ) ) ( not ( = ?auto_894578 ?auto_894591 ) ) ( not ( = ?auto_894578 ?auto_894592 ) ) ( not ( = ?auto_894578 ?auto_894593 ) ) ( not ( = ?auto_894579 ?auto_894580 ) ) ( not ( = ?auto_894579 ?auto_894581 ) ) ( not ( = ?auto_894579 ?auto_894582 ) ) ( not ( = ?auto_894579 ?auto_894583 ) ) ( not ( = ?auto_894579 ?auto_894584 ) ) ( not ( = ?auto_894579 ?auto_894585 ) ) ( not ( = ?auto_894579 ?auto_894586 ) ) ( not ( = ?auto_894579 ?auto_894587 ) ) ( not ( = ?auto_894579 ?auto_894588 ) ) ( not ( = ?auto_894579 ?auto_894589 ) ) ( not ( = ?auto_894579 ?auto_894590 ) ) ( not ( = ?auto_894579 ?auto_894591 ) ) ( not ( = ?auto_894579 ?auto_894592 ) ) ( not ( = ?auto_894579 ?auto_894593 ) ) ( not ( = ?auto_894580 ?auto_894581 ) ) ( not ( = ?auto_894580 ?auto_894582 ) ) ( not ( = ?auto_894580 ?auto_894583 ) ) ( not ( = ?auto_894580 ?auto_894584 ) ) ( not ( = ?auto_894580 ?auto_894585 ) ) ( not ( = ?auto_894580 ?auto_894586 ) ) ( not ( = ?auto_894580 ?auto_894587 ) ) ( not ( = ?auto_894580 ?auto_894588 ) ) ( not ( = ?auto_894580 ?auto_894589 ) ) ( not ( = ?auto_894580 ?auto_894590 ) ) ( not ( = ?auto_894580 ?auto_894591 ) ) ( not ( = ?auto_894580 ?auto_894592 ) ) ( not ( = ?auto_894580 ?auto_894593 ) ) ( not ( = ?auto_894581 ?auto_894582 ) ) ( not ( = ?auto_894581 ?auto_894583 ) ) ( not ( = ?auto_894581 ?auto_894584 ) ) ( not ( = ?auto_894581 ?auto_894585 ) ) ( not ( = ?auto_894581 ?auto_894586 ) ) ( not ( = ?auto_894581 ?auto_894587 ) ) ( not ( = ?auto_894581 ?auto_894588 ) ) ( not ( = ?auto_894581 ?auto_894589 ) ) ( not ( = ?auto_894581 ?auto_894590 ) ) ( not ( = ?auto_894581 ?auto_894591 ) ) ( not ( = ?auto_894581 ?auto_894592 ) ) ( not ( = ?auto_894581 ?auto_894593 ) ) ( not ( = ?auto_894582 ?auto_894583 ) ) ( not ( = ?auto_894582 ?auto_894584 ) ) ( not ( = ?auto_894582 ?auto_894585 ) ) ( not ( = ?auto_894582 ?auto_894586 ) ) ( not ( = ?auto_894582 ?auto_894587 ) ) ( not ( = ?auto_894582 ?auto_894588 ) ) ( not ( = ?auto_894582 ?auto_894589 ) ) ( not ( = ?auto_894582 ?auto_894590 ) ) ( not ( = ?auto_894582 ?auto_894591 ) ) ( not ( = ?auto_894582 ?auto_894592 ) ) ( not ( = ?auto_894582 ?auto_894593 ) ) ( not ( = ?auto_894583 ?auto_894584 ) ) ( not ( = ?auto_894583 ?auto_894585 ) ) ( not ( = ?auto_894583 ?auto_894586 ) ) ( not ( = ?auto_894583 ?auto_894587 ) ) ( not ( = ?auto_894583 ?auto_894588 ) ) ( not ( = ?auto_894583 ?auto_894589 ) ) ( not ( = ?auto_894583 ?auto_894590 ) ) ( not ( = ?auto_894583 ?auto_894591 ) ) ( not ( = ?auto_894583 ?auto_894592 ) ) ( not ( = ?auto_894583 ?auto_894593 ) ) ( not ( = ?auto_894584 ?auto_894585 ) ) ( not ( = ?auto_894584 ?auto_894586 ) ) ( not ( = ?auto_894584 ?auto_894587 ) ) ( not ( = ?auto_894584 ?auto_894588 ) ) ( not ( = ?auto_894584 ?auto_894589 ) ) ( not ( = ?auto_894584 ?auto_894590 ) ) ( not ( = ?auto_894584 ?auto_894591 ) ) ( not ( = ?auto_894584 ?auto_894592 ) ) ( not ( = ?auto_894584 ?auto_894593 ) ) ( not ( = ?auto_894585 ?auto_894586 ) ) ( not ( = ?auto_894585 ?auto_894587 ) ) ( not ( = ?auto_894585 ?auto_894588 ) ) ( not ( = ?auto_894585 ?auto_894589 ) ) ( not ( = ?auto_894585 ?auto_894590 ) ) ( not ( = ?auto_894585 ?auto_894591 ) ) ( not ( = ?auto_894585 ?auto_894592 ) ) ( not ( = ?auto_894585 ?auto_894593 ) ) ( not ( = ?auto_894586 ?auto_894587 ) ) ( not ( = ?auto_894586 ?auto_894588 ) ) ( not ( = ?auto_894586 ?auto_894589 ) ) ( not ( = ?auto_894586 ?auto_894590 ) ) ( not ( = ?auto_894586 ?auto_894591 ) ) ( not ( = ?auto_894586 ?auto_894592 ) ) ( not ( = ?auto_894586 ?auto_894593 ) ) ( not ( = ?auto_894587 ?auto_894588 ) ) ( not ( = ?auto_894587 ?auto_894589 ) ) ( not ( = ?auto_894587 ?auto_894590 ) ) ( not ( = ?auto_894587 ?auto_894591 ) ) ( not ( = ?auto_894587 ?auto_894592 ) ) ( not ( = ?auto_894587 ?auto_894593 ) ) ( not ( = ?auto_894588 ?auto_894589 ) ) ( not ( = ?auto_894588 ?auto_894590 ) ) ( not ( = ?auto_894588 ?auto_894591 ) ) ( not ( = ?auto_894588 ?auto_894592 ) ) ( not ( = ?auto_894588 ?auto_894593 ) ) ( not ( = ?auto_894589 ?auto_894590 ) ) ( not ( = ?auto_894589 ?auto_894591 ) ) ( not ( = ?auto_894589 ?auto_894592 ) ) ( not ( = ?auto_894589 ?auto_894593 ) ) ( not ( = ?auto_894590 ?auto_894591 ) ) ( not ( = ?auto_894590 ?auto_894592 ) ) ( not ( = ?auto_894590 ?auto_894593 ) ) ( not ( = ?auto_894591 ?auto_894592 ) ) ( not ( = ?auto_894591 ?auto_894593 ) ) ( not ( = ?auto_894592 ?auto_894593 ) ) ( ON ?auto_894591 ?auto_894592 ) ( CLEAR ?auto_894589 ) ( ON ?auto_894590 ?auto_894591 ) ( CLEAR ?auto_894590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_894577 ?auto_894578 ?auto_894579 ?auto_894580 ?auto_894581 ?auto_894582 ?auto_894583 ?auto_894584 ?auto_894585 ?auto_894586 ?auto_894587 ?auto_894588 ?auto_894589 ?auto_894590 )
      ( MAKE-16PILE ?auto_894577 ?auto_894578 ?auto_894579 ?auto_894580 ?auto_894581 ?auto_894582 ?auto_894583 ?auto_894584 ?auto_894585 ?auto_894586 ?auto_894587 ?auto_894588 ?auto_894589 ?auto_894590 ?auto_894591 ?auto_894592 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894643 - BLOCK
      ?auto_894644 - BLOCK
      ?auto_894645 - BLOCK
      ?auto_894646 - BLOCK
      ?auto_894647 - BLOCK
      ?auto_894648 - BLOCK
      ?auto_894649 - BLOCK
      ?auto_894650 - BLOCK
      ?auto_894651 - BLOCK
      ?auto_894652 - BLOCK
      ?auto_894653 - BLOCK
      ?auto_894654 - BLOCK
      ?auto_894655 - BLOCK
      ?auto_894656 - BLOCK
      ?auto_894657 - BLOCK
      ?auto_894658 - BLOCK
    )
    :vars
    (
      ?auto_894659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894658 ?auto_894659 ) ( ON-TABLE ?auto_894643 ) ( ON ?auto_894644 ?auto_894643 ) ( ON ?auto_894645 ?auto_894644 ) ( ON ?auto_894646 ?auto_894645 ) ( ON ?auto_894647 ?auto_894646 ) ( ON ?auto_894648 ?auto_894647 ) ( ON ?auto_894649 ?auto_894648 ) ( ON ?auto_894650 ?auto_894649 ) ( ON ?auto_894651 ?auto_894650 ) ( ON ?auto_894652 ?auto_894651 ) ( ON ?auto_894653 ?auto_894652 ) ( ON ?auto_894654 ?auto_894653 ) ( not ( = ?auto_894643 ?auto_894644 ) ) ( not ( = ?auto_894643 ?auto_894645 ) ) ( not ( = ?auto_894643 ?auto_894646 ) ) ( not ( = ?auto_894643 ?auto_894647 ) ) ( not ( = ?auto_894643 ?auto_894648 ) ) ( not ( = ?auto_894643 ?auto_894649 ) ) ( not ( = ?auto_894643 ?auto_894650 ) ) ( not ( = ?auto_894643 ?auto_894651 ) ) ( not ( = ?auto_894643 ?auto_894652 ) ) ( not ( = ?auto_894643 ?auto_894653 ) ) ( not ( = ?auto_894643 ?auto_894654 ) ) ( not ( = ?auto_894643 ?auto_894655 ) ) ( not ( = ?auto_894643 ?auto_894656 ) ) ( not ( = ?auto_894643 ?auto_894657 ) ) ( not ( = ?auto_894643 ?auto_894658 ) ) ( not ( = ?auto_894643 ?auto_894659 ) ) ( not ( = ?auto_894644 ?auto_894645 ) ) ( not ( = ?auto_894644 ?auto_894646 ) ) ( not ( = ?auto_894644 ?auto_894647 ) ) ( not ( = ?auto_894644 ?auto_894648 ) ) ( not ( = ?auto_894644 ?auto_894649 ) ) ( not ( = ?auto_894644 ?auto_894650 ) ) ( not ( = ?auto_894644 ?auto_894651 ) ) ( not ( = ?auto_894644 ?auto_894652 ) ) ( not ( = ?auto_894644 ?auto_894653 ) ) ( not ( = ?auto_894644 ?auto_894654 ) ) ( not ( = ?auto_894644 ?auto_894655 ) ) ( not ( = ?auto_894644 ?auto_894656 ) ) ( not ( = ?auto_894644 ?auto_894657 ) ) ( not ( = ?auto_894644 ?auto_894658 ) ) ( not ( = ?auto_894644 ?auto_894659 ) ) ( not ( = ?auto_894645 ?auto_894646 ) ) ( not ( = ?auto_894645 ?auto_894647 ) ) ( not ( = ?auto_894645 ?auto_894648 ) ) ( not ( = ?auto_894645 ?auto_894649 ) ) ( not ( = ?auto_894645 ?auto_894650 ) ) ( not ( = ?auto_894645 ?auto_894651 ) ) ( not ( = ?auto_894645 ?auto_894652 ) ) ( not ( = ?auto_894645 ?auto_894653 ) ) ( not ( = ?auto_894645 ?auto_894654 ) ) ( not ( = ?auto_894645 ?auto_894655 ) ) ( not ( = ?auto_894645 ?auto_894656 ) ) ( not ( = ?auto_894645 ?auto_894657 ) ) ( not ( = ?auto_894645 ?auto_894658 ) ) ( not ( = ?auto_894645 ?auto_894659 ) ) ( not ( = ?auto_894646 ?auto_894647 ) ) ( not ( = ?auto_894646 ?auto_894648 ) ) ( not ( = ?auto_894646 ?auto_894649 ) ) ( not ( = ?auto_894646 ?auto_894650 ) ) ( not ( = ?auto_894646 ?auto_894651 ) ) ( not ( = ?auto_894646 ?auto_894652 ) ) ( not ( = ?auto_894646 ?auto_894653 ) ) ( not ( = ?auto_894646 ?auto_894654 ) ) ( not ( = ?auto_894646 ?auto_894655 ) ) ( not ( = ?auto_894646 ?auto_894656 ) ) ( not ( = ?auto_894646 ?auto_894657 ) ) ( not ( = ?auto_894646 ?auto_894658 ) ) ( not ( = ?auto_894646 ?auto_894659 ) ) ( not ( = ?auto_894647 ?auto_894648 ) ) ( not ( = ?auto_894647 ?auto_894649 ) ) ( not ( = ?auto_894647 ?auto_894650 ) ) ( not ( = ?auto_894647 ?auto_894651 ) ) ( not ( = ?auto_894647 ?auto_894652 ) ) ( not ( = ?auto_894647 ?auto_894653 ) ) ( not ( = ?auto_894647 ?auto_894654 ) ) ( not ( = ?auto_894647 ?auto_894655 ) ) ( not ( = ?auto_894647 ?auto_894656 ) ) ( not ( = ?auto_894647 ?auto_894657 ) ) ( not ( = ?auto_894647 ?auto_894658 ) ) ( not ( = ?auto_894647 ?auto_894659 ) ) ( not ( = ?auto_894648 ?auto_894649 ) ) ( not ( = ?auto_894648 ?auto_894650 ) ) ( not ( = ?auto_894648 ?auto_894651 ) ) ( not ( = ?auto_894648 ?auto_894652 ) ) ( not ( = ?auto_894648 ?auto_894653 ) ) ( not ( = ?auto_894648 ?auto_894654 ) ) ( not ( = ?auto_894648 ?auto_894655 ) ) ( not ( = ?auto_894648 ?auto_894656 ) ) ( not ( = ?auto_894648 ?auto_894657 ) ) ( not ( = ?auto_894648 ?auto_894658 ) ) ( not ( = ?auto_894648 ?auto_894659 ) ) ( not ( = ?auto_894649 ?auto_894650 ) ) ( not ( = ?auto_894649 ?auto_894651 ) ) ( not ( = ?auto_894649 ?auto_894652 ) ) ( not ( = ?auto_894649 ?auto_894653 ) ) ( not ( = ?auto_894649 ?auto_894654 ) ) ( not ( = ?auto_894649 ?auto_894655 ) ) ( not ( = ?auto_894649 ?auto_894656 ) ) ( not ( = ?auto_894649 ?auto_894657 ) ) ( not ( = ?auto_894649 ?auto_894658 ) ) ( not ( = ?auto_894649 ?auto_894659 ) ) ( not ( = ?auto_894650 ?auto_894651 ) ) ( not ( = ?auto_894650 ?auto_894652 ) ) ( not ( = ?auto_894650 ?auto_894653 ) ) ( not ( = ?auto_894650 ?auto_894654 ) ) ( not ( = ?auto_894650 ?auto_894655 ) ) ( not ( = ?auto_894650 ?auto_894656 ) ) ( not ( = ?auto_894650 ?auto_894657 ) ) ( not ( = ?auto_894650 ?auto_894658 ) ) ( not ( = ?auto_894650 ?auto_894659 ) ) ( not ( = ?auto_894651 ?auto_894652 ) ) ( not ( = ?auto_894651 ?auto_894653 ) ) ( not ( = ?auto_894651 ?auto_894654 ) ) ( not ( = ?auto_894651 ?auto_894655 ) ) ( not ( = ?auto_894651 ?auto_894656 ) ) ( not ( = ?auto_894651 ?auto_894657 ) ) ( not ( = ?auto_894651 ?auto_894658 ) ) ( not ( = ?auto_894651 ?auto_894659 ) ) ( not ( = ?auto_894652 ?auto_894653 ) ) ( not ( = ?auto_894652 ?auto_894654 ) ) ( not ( = ?auto_894652 ?auto_894655 ) ) ( not ( = ?auto_894652 ?auto_894656 ) ) ( not ( = ?auto_894652 ?auto_894657 ) ) ( not ( = ?auto_894652 ?auto_894658 ) ) ( not ( = ?auto_894652 ?auto_894659 ) ) ( not ( = ?auto_894653 ?auto_894654 ) ) ( not ( = ?auto_894653 ?auto_894655 ) ) ( not ( = ?auto_894653 ?auto_894656 ) ) ( not ( = ?auto_894653 ?auto_894657 ) ) ( not ( = ?auto_894653 ?auto_894658 ) ) ( not ( = ?auto_894653 ?auto_894659 ) ) ( not ( = ?auto_894654 ?auto_894655 ) ) ( not ( = ?auto_894654 ?auto_894656 ) ) ( not ( = ?auto_894654 ?auto_894657 ) ) ( not ( = ?auto_894654 ?auto_894658 ) ) ( not ( = ?auto_894654 ?auto_894659 ) ) ( not ( = ?auto_894655 ?auto_894656 ) ) ( not ( = ?auto_894655 ?auto_894657 ) ) ( not ( = ?auto_894655 ?auto_894658 ) ) ( not ( = ?auto_894655 ?auto_894659 ) ) ( not ( = ?auto_894656 ?auto_894657 ) ) ( not ( = ?auto_894656 ?auto_894658 ) ) ( not ( = ?auto_894656 ?auto_894659 ) ) ( not ( = ?auto_894657 ?auto_894658 ) ) ( not ( = ?auto_894657 ?auto_894659 ) ) ( not ( = ?auto_894658 ?auto_894659 ) ) ( ON ?auto_894657 ?auto_894658 ) ( ON ?auto_894656 ?auto_894657 ) ( CLEAR ?auto_894654 ) ( ON ?auto_894655 ?auto_894656 ) ( CLEAR ?auto_894655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_894643 ?auto_894644 ?auto_894645 ?auto_894646 ?auto_894647 ?auto_894648 ?auto_894649 ?auto_894650 ?auto_894651 ?auto_894652 ?auto_894653 ?auto_894654 ?auto_894655 )
      ( MAKE-16PILE ?auto_894643 ?auto_894644 ?auto_894645 ?auto_894646 ?auto_894647 ?auto_894648 ?auto_894649 ?auto_894650 ?auto_894651 ?auto_894652 ?auto_894653 ?auto_894654 ?auto_894655 ?auto_894656 ?auto_894657 ?auto_894658 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894709 - BLOCK
      ?auto_894710 - BLOCK
      ?auto_894711 - BLOCK
      ?auto_894712 - BLOCK
      ?auto_894713 - BLOCK
      ?auto_894714 - BLOCK
      ?auto_894715 - BLOCK
      ?auto_894716 - BLOCK
      ?auto_894717 - BLOCK
      ?auto_894718 - BLOCK
      ?auto_894719 - BLOCK
      ?auto_894720 - BLOCK
      ?auto_894721 - BLOCK
      ?auto_894722 - BLOCK
      ?auto_894723 - BLOCK
      ?auto_894724 - BLOCK
    )
    :vars
    (
      ?auto_894725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894724 ?auto_894725 ) ( ON-TABLE ?auto_894709 ) ( ON ?auto_894710 ?auto_894709 ) ( ON ?auto_894711 ?auto_894710 ) ( ON ?auto_894712 ?auto_894711 ) ( ON ?auto_894713 ?auto_894712 ) ( ON ?auto_894714 ?auto_894713 ) ( ON ?auto_894715 ?auto_894714 ) ( ON ?auto_894716 ?auto_894715 ) ( ON ?auto_894717 ?auto_894716 ) ( ON ?auto_894718 ?auto_894717 ) ( ON ?auto_894719 ?auto_894718 ) ( not ( = ?auto_894709 ?auto_894710 ) ) ( not ( = ?auto_894709 ?auto_894711 ) ) ( not ( = ?auto_894709 ?auto_894712 ) ) ( not ( = ?auto_894709 ?auto_894713 ) ) ( not ( = ?auto_894709 ?auto_894714 ) ) ( not ( = ?auto_894709 ?auto_894715 ) ) ( not ( = ?auto_894709 ?auto_894716 ) ) ( not ( = ?auto_894709 ?auto_894717 ) ) ( not ( = ?auto_894709 ?auto_894718 ) ) ( not ( = ?auto_894709 ?auto_894719 ) ) ( not ( = ?auto_894709 ?auto_894720 ) ) ( not ( = ?auto_894709 ?auto_894721 ) ) ( not ( = ?auto_894709 ?auto_894722 ) ) ( not ( = ?auto_894709 ?auto_894723 ) ) ( not ( = ?auto_894709 ?auto_894724 ) ) ( not ( = ?auto_894709 ?auto_894725 ) ) ( not ( = ?auto_894710 ?auto_894711 ) ) ( not ( = ?auto_894710 ?auto_894712 ) ) ( not ( = ?auto_894710 ?auto_894713 ) ) ( not ( = ?auto_894710 ?auto_894714 ) ) ( not ( = ?auto_894710 ?auto_894715 ) ) ( not ( = ?auto_894710 ?auto_894716 ) ) ( not ( = ?auto_894710 ?auto_894717 ) ) ( not ( = ?auto_894710 ?auto_894718 ) ) ( not ( = ?auto_894710 ?auto_894719 ) ) ( not ( = ?auto_894710 ?auto_894720 ) ) ( not ( = ?auto_894710 ?auto_894721 ) ) ( not ( = ?auto_894710 ?auto_894722 ) ) ( not ( = ?auto_894710 ?auto_894723 ) ) ( not ( = ?auto_894710 ?auto_894724 ) ) ( not ( = ?auto_894710 ?auto_894725 ) ) ( not ( = ?auto_894711 ?auto_894712 ) ) ( not ( = ?auto_894711 ?auto_894713 ) ) ( not ( = ?auto_894711 ?auto_894714 ) ) ( not ( = ?auto_894711 ?auto_894715 ) ) ( not ( = ?auto_894711 ?auto_894716 ) ) ( not ( = ?auto_894711 ?auto_894717 ) ) ( not ( = ?auto_894711 ?auto_894718 ) ) ( not ( = ?auto_894711 ?auto_894719 ) ) ( not ( = ?auto_894711 ?auto_894720 ) ) ( not ( = ?auto_894711 ?auto_894721 ) ) ( not ( = ?auto_894711 ?auto_894722 ) ) ( not ( = ?auto_894711 ?auto_894723 ) ) ( not ( = ?auto_894711 ?auto_894724 ) ) ( not ( = ?auto_894711 ?auto_894725 ) ) ( not ( = ?auto_894712 ?auto_894713 ) ) ( not ( = ?auto_894712 ?auto_894714 ) ) ( not ( = ?auto_894712 ?auto_894715 ) ) ( not ( = ?auto_894712 ?auto_894716 ) ) ( not ( = ?auto_894712 ?auto_894717 ) ) ( not ( = ?auto_894712 ?auto_894718 ) ) ( not ( = ?auto_894712 ?auto_894719 ) ) ( not ( = ?auto_894712 ?auto_894720 ) ) ( not ( = ?auto_894712 ?auto_894721 ) ) ( not ( = ?auto_894712 ?auto_894722 ) ) ( not ( = ?auto_894712 ?auto_894723 ) ) ( not ( = ?auto_894712 ?auto_894724 ) ) ( not ( = ?auto_894712 ?auto_894725 ) ) ( not ( = ?auto_894713 ?auto_894714 ) ) ( not ( = ?auto_894713 ?auto_894715 ) ) ( not ( = ?auto_894713 ?auto_894716 ) ) ( not ( = ?auto_894713 ?auto_894717 ) ) ( not ( = ?auto_894713 ?auto_894718 ) ) ( not ( = ?auto_894713 ?auto_894719 ) ) ( not ( = ?auto_894713 ?auto_894720 ) ) ( not ( = ?auto_894713 ?auto_894721 ) ) ( not ( = ?auto_894713 ?auto_894722 ) ) ( not ( = ?auto_894713 ?auto_894723 ) ) ( not ( = ?auto_894713 ?auto_894724 ) ) ( not ( = ?auto_894713 ?auto_894725 ) ) ( not ( = ?auto_894714 ?auto_894715 ) ) ( not ( = ?auto_894714 ?auto_894716 ) ) ( not ( = ?auto_894714 ?auto_894717 ) ) ( not ( = ?auto_894714 ?auto_894718 ) ) ( not ( = ?auto_894714 ?auto_894719 ) ) ( not ( = ?auto_894714 ?auto_894720 ) ) ( not ( = ?auto_894714 ?auto_894721 ) ) ( not ( = ?auto_894714 ?auto_894722 ) ) ( not ( = ?auto_894714 ?auto_894723 ) ) ( not ( = ?auto_894714 ?auto_894724 ) ) ( not ( = ?auto_894714 ?auto_894725 ) ) ( not ( = ?auto_894715 ?auto_894716 ) ) ( not ( = ?auto_894715 ?auto_894717 ) ) ( not ( = ?auto_894715 ?auto_894718 ) ) ( not ( = ?auto_894715 ?auto_894719 ) ) ( not ( = ?auto_894715 ?auto_894720 ) ) ( not ( = ?auto_894715 ?auto_894721 ) ) ( not ( = ?auto_894715 ?auto_894722 ) ) ( not ( = ?auto_894715 ?auto_894723 ) ) ( not ( = ?auto_894715 ?auto_894724 ) ) ( not ( = ?auto_894715 ?auto_894725 ) ) ( not ( = ?auto_894716 ?auto_894717 ) ) ( not ( = ?auto_894716 ?auto_894718 ) ) ( not ( = ?auto_894716 ?auto_894719 ) ) ( not ( = ?auto_894716 ?auto_894720 ) ) ( not ( = ?auto_894716 ?auto_894721 ) ) ( not ( = ?auto_894716 ?auto_894722 ) ) ( not ( = ?auto_894716 ?auto_894723 ) ) ( not ( = ?auto_894716 ?auto_894724 ) ) ( not ( = ?auto_894716 ?auto_894725 ) ) ( not ( = ?auto_894717 ?auto_894718 ) ) ( not ( = ?auto_894717 ?auto_894719 ) ) ( not ( = ?auto_894717 ?auto_894720 ) ) ( not ( = ?auto_894717 ?auto_894721 ) ) ( not ( = ?auto_894717 ?auto_894722 ) ) ( not ( = ?auto_894717 ?auto_894723 ) ) ( not ( = ?auto_894717 ?auto_894724 ) ) ( not ( = ?auto_894717 ?auto_894725 ) ) ( not ( = ?auto_894718 ?auto_894719 ) ) ( not ( = ?auto_894718 ?auto_894720 ) ) ( not ( = ?auto_894718 ?auto_894721 ) ) ( not ( = ?auto_894718 ?auto_894722 ) ) ( not ( = ?auto_894718 ?auto_894723 ) ) ( not ( = ?auto_894718 ?auto_894724 ) ) ( not ( = ?auto_894718 ?auto_894725 ) ) ( not ( = ?auto_894719 ?auto_894720 ) ) ( not ( = ?auto_894719 ?auto_894721 ) ) ( not ( = ?auto_894719 ?auto_894722 ) ) ( not ( = ?auto_894719 ?auto_894723 ) ) ( not ( = ?auto_894719 ?auto_894724 ) ) ( not ( = ?auto_894719 ?auto_894725 ) ) ( not ( = ?auto_894720 ?auto_894721 ) ) ( not ( = ?auto_894720 ?auto_894722 ) ) ( not ( = ?auto_894720 ?auto_894723 ) ) ( not ( = ?auto_894720 ?auto_894724 ) ) ( not ( = ?auto_894720 ?auto_894725 ) ) ( not ( = ?auto_894721 ?auto_894722 ) ) ( not ( = ?auto_894721 ?auto_894723 ) ) ( not ( = ?auto_894721 ?auto_894724 ) ) ( not ( = ?auto_894721 ?auto_894725 ) ) ( not ( = ?auto_894722 ?auto_894723 ) ) ( not ( = ?auto_894722 ?auto_894724 ) ) ( not ( = ?auto_894722 ?auto_894725 ) ) ( not ( = ?auto_894723 ?auto_894724 ) ) ( not ( = ?auto_894723 ?auto_894725 ) ) ( not ( = ?auto_894724 ?auto_894725 ) ) ( ON ?auto_894723 ?auto_894724 ) ( ON ?auto_894722 ?auto_894723 ) ( ON ?auto_894721 ?auto_894722 ) ( CLEAR ?auto_894719 ) ( ON ?auto_894720 ?auto_894721 ) ( CLEAR ?auto_894720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_894709 ?auto_894710 ?auto_894711 ?auto_894712 ?auto_894713 ?auto_894714 ?auto_894715 ?auto_894716 ?auto_894717 ?auto_894718 ?auto_894719 ?auto_894720 )
      ( MAKE-16PILE ?auto_894709 ?auto_894710 ?auto_894711 ?auto_894712 ?auto_894713 ?auto_894714 ?auto_894715 ?auto_894716 ?auto_894717 ?auto_894718 ?auto_894719 ?auto_894720 ?auto_894721 ?auto_894722 ?auto_894723 ?auto_894724 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894775 - BLOCK
      ?auto_894776 - BLOCK
      ?auto_894777 - BLOCK
      ?auto_894778 - BLOCK
      ?auto_894779 - BLOCK
      ?auto_894780 - BLOCK
      ?auto_894781 - BLOCK
      ?auto_894782 - BLOCK
      ?auto_894783 - BLOCK
      ?auto_894784 - BLOCK
      ?auto_894785 - BLOCK
      ?auto_894786 - BLOCK
      ?auto_894787 - BLOCK
      ?auto_894788 - BLOCK
      ?auto_894789 - BLOCK
      ?auto_894790 - BLOCK
    )
    :vars
    (
      ?auto_894791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894790 ?auto_894791 ) ( ON-TABLE ?auto_894775 ) ( ON ?auto_894776 ?auto_894775 ) ( ON ?auto_894777 ?auto_894776 ) ( ON ?auto_894778 ?auto_894777 ) ( ON ?auto_894779 ?auto_894778 ) ( ON ?auto_894780 ?auto_894779 ) ( ON ?auto_894781 ?auto_894780 ) ( ON ?auto_894782 ?auto_894781 ) ( ON ?auto_894783 ?auto_894782 ) ( ON ?auto_894784 ?auto_894783 ) ( not ( = ?auto_894775 ?auto_894776 ) ) ( not ( = ?auto_894775 ?auto_894777 ) ) ( not ( = ?auto_894775 ?auto_894778 ) ) ( not ( = ?auto_894775 ?auto_894779 ) ) ( not ( = ?auto_894775 ?auto_894780 ) ) ( not ( = ?auto_894775 ?auto_894781 ) ) ( not ( = ?auto_894775 ?auto_894782 ) ) ( not ( = ?auto_894775 ?auto_894783 ) ) ( not ( = ?auto_894775 ?auto_894784 ) ) ( not ( = ?auto_894775 ?auto_894785 ) ) ( not ( = ?auto_894775 ?auto_894786 ) ) ( not ( = ?auto_894775 ?auto_894787 ) ) ( not ( = ?auto_894775 ?auto_894788 ) ) ( not ( = ?auto_894775 ?auto_894789 ) ) ( not ( = ?auto_894775 ?auto_894790 ) ) ( not ( = ?auto_894775 ?auto_894791 ) ) ( not ( = ?auto_894776 ?auto_894777 ) ) ( not ( = ?auto_894776 ?auto_894778 ) ) ( not ( = ?auto_894776 ?auto_894779 ) ) ( not ( = ?auto_894776 ?auto_894780 ) ) ( not ( = ?auto_894776 ?auto_894781 ) ) ( not ( = ?auto_894776 ?auto_894782 ) ) ( not ( = ?auto_894776 ?auto_894783 ) ) ( not ( = ?auto_894776 ?auto_894784 ) ) ( not ( = ?auto_894776 ?auto_894785 ) ) ( not ( = ?auto_894776 ?auto_894786 ) ) ( not ( = ?auto_894776 ?auto_894787 ) ) ( not ( = ?auto_894776 ?auto_894788 ) ) ( not ( = ?auto_894776 ?auto_894789 ) ) ( not ( = ?auto_894776 ?auto_894790 ) ) ( not ( = ?auto_894776 ?auto_894791 ) ) ( not ( = ?auto_894777 ?auto_894778 ) ) ( not ( = ?auto_894777 ?auto_894779 ) ) ( not ( = ?auto_894777 ?auto_894780 ) ) ( not ( = ?auto_894777 ?auto_894781 ) ) ( not ( = ?auto_894777 ?auto_894782 ) ) ( not ( = ?auto_894777 ?auto_894783 ) ) ( not ( = ?auto_894777 ?auto_894784 ) ) ( not ( = ?auto_894777 ?auto_894785 ) ) ( not ( = ?auto_894777 ?auto_894786 ) ) ( not ( = ?auto_894777 ?auto_894787 ) ) ( not ( = ?auto_894777 ?auto_894788 ) ) ( not ( = ?auto_894777 ?auto_894789 ) ) ( not ( = ?auto_894777 ?auto_894790 ) ) ( not ( = ?auto_894777 ?auto_894791 ) ) ( not ( = ?auto_894778 ?auto_894779 ) ) ( not ( = ?auto_894778 ?auto_894780 ) ) ( not ( = ?auto_894778 ?auto_894781 ) ) ( not ( = ?auto_894778 ?auto_894782 ) ) ( not ( = ?auto_894778 ?auto_894783 ) ) ( not ( = ?auto_894778 ?auto_894784 ) ) ( not ( = ?auto_894778 ?auto_894785 ) ) ( not ( = ?auto_894778 ?auto_894786 ) ) ( not ( = ?auto_894778 ?auto_894787 ) ) ( not ( = ?auto_894778 ?auto_894788 ) ) ( not ( = ?auto_894778 ?auto_894789 ) ) ( not ( = ?auto_894778 ?auto_894790 ) ) ( not ( = ?auto_894778 ?auto_894791 ) ) ( not ( = ?auto_894779 ?auto_894780 ) ) ( not ( = ?auto_894779 ?auto_894781 ) ) ( not ( = ?auto_894779 ?auto_894782 ) ) ( not ( = ?auto_894779 ?auto_894783 ) ) ( not ( = ?auto_894779 ?auto_894784 ) ) ( not ( = ?auto_894779 ?auto_894785 ) ) ( not ( = ?auto_894779 ?auto_894786 ) ) ( not ( = ?auto_894779 ?auto_894787 ) ) ( not ( = ?auto_894779 ?auto_894788 ) ) ( not ( = ?auto_894779 ?auto_894789 ) ) ( not ( = ?auto_894779 ?auto_894790 ) ) ( not ( = ?auto_894779 ?auto_894791 ) ) ( not ( = ?auto_894780 ?auto_894781 ) ) ( not ( = ?auto_894780 ?auto_894782 ) ) ( not ( = ?auto_894780 ?auto_894783 ) ) ( not ( = ?auto_894780 ?auto_894784 ) ) ( not ( = ?auto_894780 ?auto_894785 ) ) ( not ( = ?auto_894780 ?auto_894786 ) ) ( not ( = ?auto_894780 ?auto_894787 ) ) ( not ( = ?auto_894780 ?auto_894788 ) ) ( not ( = ?auto_894780 ?auto_894789 ) ) ( not ( = ?auto_894780 ?auto_894790 ) ) ( not ( = ?auto_894780 ?auto_894791 ) ) ( not ( = ?auto_894781 ?auto_894782 ) ) ( not ( = ?auto_894781 ?auto_894783 ) ) ( not ( = ?auto_894781 ?auto_894784 ) ) ( not ( = ?auto_894781 ?auto_894785 ) ) ( not ( = ?auto_894781 ?auto_894786 ) ) ( not ( = ?auto_894781 ?auto_894787 ) ) ( not ( = ?auto_894781 ?auto_894788 ) ) ( not ( = ?auto_894781 ?auto_894789 ) ) ( not ( = ?auto_894781 ?auto_894790 ) ) ( not ( = ?auto_894781 ?auto_894791 ) ) ( not ( = ?auto_894782 ?auto_894783 ) ) ( not ( = ?auto_894782 ?auto_894784 ) ) ( not ( = ?auto_894782 ?auto_894785 ) ) ( not ( = ?auto_894782 ?auto_894786 ) ) ( not ( = ?auto_894782 ?auto_894787 ) ) ( not ( = ?auto_894782 ?auto_894788 ) ) ( not ( = ?auto_894782 ?auto_894789 ) ) ( not ( = ?auto_894782 ?auto_894790 ) ) ( not ( = ?auto_894782 ?auto_894791 ) ) ( not ( = ?auto_894783 ?auto_894784 ) ) ( not ( = ?auto_894783 ?auto_894785 ) ) ( not ( = ?auto_894783 ?auto_894786 ) ) ( not ( = ?auto_894783 ?auto_894787 ) ) ( not ( = ?auto_894783 ?auto_894788 ) ) ( not ( = ?auto_894783 ?auto_894789 ) ) ( not ( = ?auto_894783 ?auto_894790 ) ) ( not ( = ?auto_894783 ?auto_894791 ) ) ( not ( = ?auto_894784 ?auto_894785 ) ) ( not ( = ?auto_894784 ?auto_894786 ) ) ( not ( = ?auto_894784 ?auto_894787 ) ) ( not ( = ?auto_894784 ?auto_894788 ) ) ( not ( = ?auto_894784 ?auto_894789 ) ) ( not ( = ?auto_894784 ?auto_894790 ) ) ( not ( = ?auto_894784 ?auto_894791 ) ) ( not ( = ?auto_894785 ?auto_894786 ) ) ( not ( = ?auto_894785 ?auto_894787 ) ) ( not ( = ?auto_894785 ?auto_894788 ) ) ( not ( = ?auto_894785 ?auto_894789 ) ) ( not ( = ?auto_894785 ?auto_894790 ) ) ( not ( = ?auto_894785 ?auto_894791 ) ) ( not ( = ?auto_894786 ?auto_894787 ) ) ( not ( = ?auto_894786 ?auto_894788 ) ) ( not ( = ?auto_894786 ?auto_894789 ) ) ( not ( = ?auto_894786 ?auto_894790 ) ) ( not ( = ?auto_894786 ?auto_894791 ) ) ( not ( = ?auto_894787 ?auto_894788 ) ) ( not ( = ?auto_894787 ?auto_894789 ) ) ( not ( = ?auto_894787 ?auto_894790 ) ) ( not ( = ?auto_894787 ?auto_894791 ) ) ( not ( = ?auto_894788 ?auto_894789 ) ) ( not ( = ?auto_894788 ?auto_894790 ) ) ( not ( = ?auto_894788 ?auto_894791 ) ) ( not ( = ?auto_894789 ?auto_894790 ) ) ( not ( = ?auto_894789 ?auto_894791 ) ) ( not ( = ?auto_894790 ?auto_894791 ) ) ( ON ?auto_894789 ?auto_894790 ) ( ON ?auto_894788 ?auto_894789 ) ( ON ?auto_894787 ?auto_894788 ) ( ON ?auto_894786 ?auto_894787 ) ( CLEAR ?auto_894784 ) ( ON ?auto_894785 ?auto_894786 ) ( CLEAR ?auto_894785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_894775 ?auto_894776 ?auto_894777 ?auto_894778 ?auto_894779 ?auto_894780 ?auto_894781 ?auto_894782 ?auto_894783 ?auto_894784 ?auto_894785 )
      ( MAKE-16PILE ?auto_894775 ?auto_894776 ?auto_894777 ?auto_894778 ?auto_894779 ?auto_894780 ?auto_894781 ?auto_894782 ?auto_894783 ?auto_894784 ?auto_894785 ?auto_894786 ?auto_894787 ?auto_894788 ?auto_894789 ?auto_894790 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894841 - BLOCK
      ?auto_894842 - BLOCK
      ?auto_894843 - BLOCK
      ?auto_894844 - BLOCK
      ?auto_894845 - BLOCK
      ?auto_894846 - BLOCK
      ?auto_894847 - BLOCK
      ?auto_894848 - BLOCK
      ?auto_894849 - BLOCK
      ?auto_894850 - BLOCK
      ?auto_894851 - BLOCK
      ?auto_894852 - BLOCK
      ?auto_894853 - BLOCK
      ?auto_894854 - BLOCK
      ?auto_894855 - BLOCK
      ?auto_894856 - BLOCK
    )
    :vars
    (
      ?auto_894857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894856 ?auto_894857 ) ( ON-TABLE ?auto_894841 ) ( ON ?auto_894842 ?auto_894841 ) ( ON ?auto_894843 ?auto_894842 ) ( ON ?auto_894844 ?auto_894843 ) ( ON ?auto_894845 ?auto_894844 ) ( ON ?auto_894846 ?auto_894845 ) ( ON ?auto_894847 ?auto_894846 ) ( ON ?auto_894848 ?auto_894847 ) ( ON ?auto_894849 ?auto_894848 ) ( not ( = ?auto_894841 ?auto_894842 ) ) ( not ( = ?auto_894841 ?auto_894843 ) ) ( not ( = ?auto_894841 ?auto_894844 ) ) ( not ( = ?auto_894841 ?auto_894845 ) ) ( not ( = ?auto_894841 ?auto_894846 ) ) ( not ( = ?auto_894841 ?auto_894847 ) ) ( not ( = ?auto_894841 ?auto_894848 ) ) ( not ( = ?auto_894841 ?auto_894849 ) ) ( not ( = ?auto_894841 ?auto_894850 ) ) ( not ( = ?auto_894841 ?auto_894851 ) ) ( not ( = ?auto_894841 ?auto_894852 ) ) ( not ( = ?auto_894841 ?auto_894853 ) ) ( not ( = ?auto_894841 ?auto_894854 ) ) ( not ( = ?auto_894841 ?auto_894855 ) ) ( not ( = ?auto_894841 ?auto_894856 ) ) ( not ( = ?auto_894841 ?auto_894857 ) ) ( not ( = ?auto_894842 ?auto_894843 ) ) ( not ( = ?auto_894842 ?auto_894844 ) ) ( not ( = ?auto_894842 ?auto_894845 ) ) ( not ( = ?auto_894842 ?auto_894846 ) ) ( not ( = ?auto_894842 ?auto_894847 ) ) ( not ( = ?auto_894842 ?auto_894848 ) ) ( not ( = ?auto_894842 ?auto_894849 ) ) ( not ( = ?auto_894842 ?auto_894850 ) ) ( not ( = ?auto_894842 ?auto_894851 ) ) ( not ( = ?auto_894842 ?auto_894852 ) ) ( not ( = ?auto_894842 ?auto_894853 ) ) ( not ( = ?auto_894842 ?auto_894854 ) ) ( not ( = ?auto_894842 ?auto_894855 ) ) ( not ( = ?auto_894842 ?auto_894856 ) ) ( not ( = ?auto_894842 ?auto_894857 ) ) ( not ( = ?auto_894843 ?auto_894844 ) ) ( not ( = ?auto_894843 ?auto_894845 ) ) ( not ( = ?auto_894843 ?auto_894846 ) ) ( not ( = ?auto_894843 ?auto_894847 ) ) ( not ( = ?auto_894843 ?auto_894848 ) ) ( not ( = ?auto_894843 ?auto_894849 ) ) ( not ( = ?auto_894843 ?auto_894850 ) ) ( not ( = ?auto_894843 ?auto_894851 ) ) ( not ( = ?auto_894843 ?auto_894852 ) ) ( not ( = ?auto_894843 ?auto_894853 ) ) ( not ( = ?auto_894843 ?auto_894854 ) ) ( not ( = ?auto_894843 ?auto_894855 ) ) ( not ( = ?auto_894843 ?auto_894856 ) ) ( not ( = ?auto_894843 ?auto_894857 ) ) ( not ( = ?auto_894844 ?auto_894845 ) ) ( not ( = ?auto_894844 ?auto_894846 ) ) ( not ( = ?auto_894844 ?auto_894847 ) ) ( not ( = ?auto_894844 ?auto_894848 ) ) ( not ( = ?auto_894844 ?auto_894849 ) ) ( not ( = ?auto_894844 ?auto_894850 ) ) ( not ( = ?auto_894844 ?auto_894851 ) ) ( not ( = ?auto_894844 ?auto_894852 ) ) ( not ( = ?auto_894844 ?auto_894853 ) ) ( not ( = ?auto_894844 ?auto_894854 ) ) ( not ( = ?auto_894844 ?auto_894855 ) ) ( not ( = ?auto_894844 ?auto_894856 ) ) ( not ( = ?auto_894844 ?auto_894857 ) ) ( not ( = ?auto_894845 ?auto_894846 ) ) ( not ( = ?auto_894845 ?auto_894847 ) ) ( not ( = ?auto_894845 ?auto_894848 ) ) ( not ( = ?auto_894845 ?auto_894849 ) ) ( not ( = ?auto_894845 ?auto_894850 ) ) ( not ( = ?auto_894845 ?auto_894851 ) ) ( not ( = ?auto_894845 ?auto_894852 ) ) ( not ( = ?auto_894845 ?auto_894853 ) ) ( not ( = ?auto_894845 ?auto_894854 ) ) ( not ( = ?auto_894845 ?auto_894855 ) ) ( not ( = ?auto_894845 ?auto_894856 ) ) ( not ( = ?auto_894845 ?auto_894857 ) ) ( not ( = ?auto_894846 ?auto_894847 ) ) ( not ( = ?auto_894846 ?auto_894848 ) ) ( not ( = ?auto_894846 ?auto_894849 ) ) ( not ( = ?auto_894846 ?auto_894850 ) ) ( not ( = ?auto_894846 ?auto_894851 ) ) ( not ( = ?auto_894846 ?auto_894852 ) ) ( not ( = ?auto_894846 ?auto_894853 ) ) ( not ( = ?auto_894846 ?auto_894854 ) ) ( not ( = ?auto_894846 ?auto_894855 ) ) ( not ( = ?auto_894846 ?auto_894856 ) ) ( not ( = ?auto_894846 ?auto_894857 ) ) ( not ( = ?auto_894847 ?auto_894848 ) ) ( not ( = ?auto_894847 ?auto_894849 ) ) ( not ( = ?auto_894847 ?auto_894850 ) ) ( not ( = ?auto_894847 ?auto_894851 ) ) ( not ( = ?auto_894847 ?auto_894852 ) ) ( not ( = ?auto_894847 ?auto_894853 ) ) ( not ( = ?auto_894847 ?auto_894854 ) ) ( not ( = ?auto_894847 ?auto_894855 ) ) ( not ( = ?auto_894847 ?auto_894856 ) ) ( not ( = ?auto_894847 ?auto_894857 ) ) ( not ( = ?auto_894848 ?auto_894849 ) ) ( not ( = ?auto_894848 ?auto_894850 ) ) ( not ( = ?auto_894848 ?auto_894851 ) ) ( not ( = ?auto_894848 ?auto_894852 ) ) ( not ( = ?auto_894848 ?auto_894853 ) ) ( not ( = ?auto_894848 ?auto_894854 ) ) ( not ( = ?auto_894848 ?auto_894855 ) ) ( not ( = ?auto_894848 ?auto_894856 ) ) ( not ( = ?auto_894848 ?auto_894857 ) ) ( not ( = ?auto_894849 ?auto_894850 ) ) ( not ( = ?auto_894849 ?auto_894851 ) ) ( not ( = ?auto_894849 ?auto_894852 ) ) ( not ( = ?auto_894849 ?auto_894853 ) ) ( not ( = ?auto_894849 ?auto_894854 ) ) ( not ( = ?auto_894849 ?auto_894855 ) ) ( not ( = ?auto_894849 ?auto_894856 ) ) ( not ( = ?auto_894849 ?auto_894857 ) ) ( not ( = ?auto_894850 ?auto_894851 ) ) ( not ( = ?auto_894850 ?auto_894852 ) ) ( not ( = ?auto_894850 ?auto_894853 ) ) ( not ( = ?auto_894850 ?auto_894854 ) ) ( not ( = ?auto_894850 ?auto_894855 ) ) ( not ( = ?auto_894850 ?auto_894856 ) ) ( not ( = ?auto_894850 ?auto_894857 ) ) ( not ( = ?auto_894851 ?auto_894852 ) ) ( not ( = ?auto_894851 ?auto_894853 ) ) ( not ( = ?auto_894851 ?auto_894854 ) ) ( not ( = ?auto_894851 ?auto_894855 ) ) ( not ( = ?auto_894851 ?auto_894856 ) ) ( not ( = ?auto_894851 ?auto_894857 ) ) ( not ( = ?auto_894852 ?auto_894853 ) ) ( not ( = ?auto_894852 ?auto_894854 ) ) ( not ( = ?auto_894852 ?auto_894855 ) ) ( not ( = ?auto_894852 ?auto_894856 ) ) ( not ( = ?auto_894852 ?auto_894857 ) ) ( not ( = ?auto_894853 ?auto_894854 ) ) ( not ( = ?auto_894853 ?auto_894855 ) ) ( not ( = ?auto_894853 ?auto_894856 ) ) ( not ( = ?auto_894853 ?auto_894857 ) ) ( not ( = ?auto_894854 ?auto_894855 ) ) ( not ( = ?auto_894854 ?auto_894856 ) ) ( not ( = ?auto_894854 ?auto_894857 ) ) ( not ( = ?auto_894855 ?auto_894856 ) ) ( not ( = ?auto_894855 ?auto_894857 ) ) ( not ( = ?auto_894856 ?auto_894857 ) ) ( ON ?auto_894855 ?auto_894856 ) ( ON ?auto_894854 ?auto_894855 ) ( ON ?auto_894853 ?auto_894854 ) ( ON ?auto_894852 ?auto_894853 ) ( ON ?auto_894851 ?auto_894852 ) ( CLEAR ?auto_894849 ) ( ON ?auto_894850 ?auto_894851 ) ( CLEAR ?auto_894850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_894841 ?auto_894842 ?auto_894843 ?auto_894844 ?auto_894845 ?auto_894846 ?auto_894847 ?auto_894848 ?auto_894849 ?auto_894850 )
      ( MAKE-16PILE ?auto_894841 ?auto_894842 ?auto_894843 ?auto_894844 ?auto_894845 ?auto_894846 ?auto_894847 ?auto_894848 ?auto_894849 ?auto_894850 ?auto_894851 ?auto_894852 ?auto_894853 ?auto_894854 ?auto_894855 ?auto_894856 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894907 - BLOCK
      ?auto_894908 - BLOCK
      ?auto_894909 - BLOCK
      ?auto_894910 - BLOCK
      ?auto_894911 - BLOCK
      ?auto_894912 - BLOCK
      ?auto_894913 - BLOCK
      ?auto_894914 - BLOCK
      ?auto_894915 - BLOCK
      ?auto_894916 - BLOCK
      ?auto_894917 - BLOCK
      ?auto_894918 - BLOCK
      ?auto_894919 - BLOCK
      ?auto_894920 - BLOCK
      ?auto_894921 - BLOCK
      ?auto_894922 - BLOCK
    )
    :vars
    (
      ?auto_894923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894922 ?auto_894923 ) ( ON-TABLE ?auto_894907 ) ( ON ?auto_894908 ?auto_894907 ) ( ON ?auto_894909 ?auto_894908 ) ( ON ?auto_894910 ?auto_894909 ) ( ON ?auto_894911 ?auto_894910 ) ( ON ?auto_894912 ?auto_894911 ) ( ON ?auto_894913 ?auto_894912 ) ( ON ?auto_894914 ?auto_894913 ) ( not ( = ?auto_894907 ?auto_894908 ) ) ( not ( = ?auto_894907 ?auto_894909 ) ) ( not ( = ?auto_894907 ?auto_894910 ) ) ( not ( = ?auto_894907 ?auto_894911 ) ) ( not ( = ?auto_894907 ?auto_894912 ) ) ( not ( = ?auto_894907 ?auto_894913 ) ) ( not ( = ?auto_894907 ?auto_894914 ) ) ( not ( = ?auto_894907 ?auto_894915 ) ) ( not ( = ?auto_894907 ?auto_894916 ) ) ( not ( = ?auto_894907 ?auto_894917 ) ) ( not ( = ?auto_894907 ?auto_894918 ) ) ( not ( = ?auto_894907 ?auto_894919 ) ) ( not ( = ?auto_894907 ?auto_894920 ) ) ( not ( = ?auto_894907 ?auto_894921 ) ) ( not ( = ?auto_894907 ?auto_894922 ) ) ( not ( = ?auto_894907 ?auto_894923 ) ) ( not ( = ?auto_894908 ?auto_894909 ) ) ( not ( = ?auto_894908 ?auto_894910 ) ) ( not ( = ?auto_894908 ?auto_894911 ) ) ( not ( = ?auto_894908 ?auto_894912 ) ) ( not ( = ?auto_894908 ?auto_894913 ) ) ( not ( = ?auto_894908 ?auto_894914 ) ) ( not ( = ?auto_894908 ?auto_894915 ) ) ( not ( = ?auto_894908 ?auto_894916 ) ) ( not ( = ?auto_894908 ?auto_894917 ) ) ( not ( = ?auto_894908 ?auto_894918 ) ) ( not ( = ?auto_894908 ?auto_894919 ) ) ( not ( = ?auto_894908 ?auto_894920 ) ) ( not ( = ?auto_894908 ?auto_894921 ) ) ( not ( = ?auto_894908 ?auto_894922 ) ) ( not ( = ?auto_894908 ?auto_894923 ) ) ( not ( = ?auto_894909 ?auto_894910 ) ) ( not ( = ?auto_894909 ?auto_894911 ) ) ( not ( = ?auto_894909 ?auto_894912 ) ) ( not ( = ?auto_894909 ?auto_894913 ) ) ( not ( = ?auto_894909 ?auto_894914 ) ) ( not ( = ?auto_894909 ?auto_894915 ) ) ( not ( = ?auto_894909 ?auto_894916 ) ) ( not ( = ?auto_894909 ?auto_894917 ) ) ( not ( = ?auto_894909 ?auto_894918 ) ) ( not ( = ?auto_894909 ?auto_894919 ) ) ( not ( = ?auto_894909 ?auto_894920 ) ) ( not ( = ?auto_894909 ?auto_894921 ) ) ( not ( = ?auto_894909 ?auto_894922 ) ) ( not ( = ?auto_894909 ?auto_894923 ) ) ( not ( = ?auto_894910 ?auto_894911 ) ) ( not ( = ?auto_894910 ?auto_894912 ) ) ( not ( = ?auto_894910 ?auto_894913 ) ) ( not ( = ?auto_894910 ?auto_894914 ) ) ( not ( = ?auto_894910 ?auto_894915 ) ) ( not ( = ?auto_894910 ?auto_894916 ) ) ( not ( = ?auto_894910 ?auto_894917 ) ) ( not ( = ?auto_894910 ?auto_894918 ) ) ( not ( = ?auto_894910 ?auto_894919 ) ) ( not ( = ?auto_894910 ?auto_894920 ) ) ( not ( = ?auto_894910 ?auto_894921 ) ) ( not ( = ?auto_894910 ?auto_894922 ) ) ( not ( = ?auto_894910 ?auto_894923 ) ) ( not ( = ?auto_894911 ?auto_894912 ) ) ( not ( = ?auto_894911 ?auto_894913 ) ) ( not ( = ?auto_894911 ?auto_894914 ) ) ( not ( = ?auto_894911 ?auto_894915 ) ) ( not ( = ?auto_894911 ?auto_894916 ) ) ( not ( = ?auto_894911 ?auto_894917 ) ) ( not ( = ?auto_894911 ?auto_894918 ) ) ( not ( = ?auto_894911 ?auto_894919 ) ) ( not ( = ?auto_894911 ?auto_894920 ) ) ( not ( = ?auto_894911 ?auto_894921 ) ) ( not ( = ?auto_894911 ?auto_894922 ) ) ( not ( = ?auto_894911 ?auto_894923 ) ) ( not ( = ?auto_894912 ?auto_894913 ) ) ( not ( = ?auto_894912 ?auto_894914 ) ) ( not ( = ?auto_894912 ?auto_894915 ) ) ( not ( = ?auto_894912 ?auto_894916 ) ) ( not ( = ?auto_894912 ?auto_894917 ) ) ( not ( = ?auto_894912 ?auto_894918 ) ) ( not ( = ?auto_894912 ?auto_894919 ) ) ( not ( = ?auto_894912 ?auto_894920 ) ) ( not ( = ?auto_894912 ?auto_894921 ) ) ( not ( = ?auto_894912 ?auto_894922 ) ) ( not ( = ?auto_894912 ?auto_894923 ) ) ( not ( = ?auto_894913 ?auto_894914 ) ) ( not ( = ?auto_894913 ?auto_894915 ) ) ( not ( = ?auto_894913 ?auto_894916 ) ) ( not ( = ?auto_894913 ?auto_894917 ) ) ( not ( = ?auto_894913 ?auto_894918 ) ) ( not ( = ?auto_894913 ?auto_894919 ) ) ( not ( = ?auto_894913 ?auto_894920 ) ) ( not ( = ?auto_894913 ?auto_894921 ) ) ( not ( = ?auto_894913 ?auto_894922 ) ) ( not ( = ?auto_894913 ?auto_894923 ) ) ( not ( = ?auto_894914 ?auto_894915 ) ) ( not ( = ?auto_894914 ?auto_894916 ) ) ( not ( = ?auto_894914 ?auto_894917 ) ) ( not ( = ?auto_894914 ?auto_894918 ) ) ( not ( = ?auto_894914 ?auto_894919 ) ) ( not ( = ?auto_894914 ?auto_894920 ) ) ( not ( = ?auto_894914 ?auto_894921 ) ) ( not ( = ?auto_894914 ?auto_894922 ) ) ( not ( = ?auto_894914 ?auto_894923 ) ) ( not ( = ?auto_894915 ?auto_894916 ) ) ( not ( = ?auto_894915 ?auto_894917 ) ) ( not ( = ?auto_894915 ?auto_894918 ) ) ( not ( = ?auto_894915 ?auto_894919 ) ) ( not ( = ?auto_894915 ?auto_894920 ) ) ( not ( = ?auto_894915 ?auto_894921 ) ) ( not ( = ?auto_894915 ?auto_894922 ) ) ( not ( = ?auto_894915 ?auto_894923 ) ) ( not ( = ?auto_894916 ?auto_894917 ) ) ( not ( = ?auto_894916 ?auto_894918 ) ) ( not ( = ?auto_894916 ?auto_894919 ) ) ( not ( = ?auto_894916 ?auto_894920 ) ) ( not ( = ?auto_894916 ?auto_894921 ) ) ( not ( = ?auto_894916 ?auto_894922 ) ) ( not ( = ?auto_894916 ?auto_894923 ) ) ( not ( = ?auto_894917 ?auto_894918 ) ) ( not ( = ?auto_894917 ?auto_894919 ) ) ( not ( = ?auto_894917 ?auto_894920 ) ) ( not ( = ?auto_894917 ?auto_894921 ) ) ( not ( = ?auto_894917 ?auto_894922 ) ) ( not ( = ?auto_894917 ?auto_894923 ) ) ( not ( = ?auto_894918 ?auto_894919 ) ) ( not ( = ?auto_894918 ?auto_894920 ) ) ( not ( = ?auto_894918 ?auto_894921 ) ) ( not ( = ?auto_894918 ?auto_894922 ) ) ( not ( = ?auto_894918 ?auto_894923 ) ) ( not ( = ?auto_894919 ?auto_894920 ) ) ( not ( = ?auto_894919 ?auto_894921 ) ) ( not ( = ?auto_894919 ?auto_894922 ) ) ( not ( = ?auto_894919 ?auto_894923 ) ) ( not ( = ?auto_894920 ?auto_894921 ) ) ( not ( = ?auto_894920 ?auto_894922 ) ) ( not ( = ?auto_894920 ?auto_894923 ) ) ( not ( = ?auto_894921 ?auto_894922 ) ) ( not ( = ?auto_894921 ?auto_894923 ) ) ( not ( = ?auto_894922 ?auto_894923 ) ) ( ON ?auto_894921 ?auto_894922 ) ( ON ?auto_894920 ?auto_894921 ) ( ON ?auto_894919 ?auto_894920 ) ( ON ?auto_894918 ?auto_894919 ) ( ON ?auto_894917 ?auto_894918 ) ( ON ?auto_894916 ?auto_894917 ) ( CLEAR ?auto_894914 ) ( ON ?auto_894915 ?auto_894916 ) ( CLEAR ?auto_894915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_894907 ?auto_894908 ?auto_894909 ?auto_894910 ?auto_894911 ?auto_894912 ?auto_894913 ?auto_894914 ?auto_894915 )
      ( MAKE-16PILE ?auto_894907 ?auto_894908 ?auto_894909 ?auto_894910 ?auto_894911 ?auto_894912 ?auto_894913 ?auto_894914 ?auto_894915 ?auto_894916 ?auto_894917 ?auto_894918 ?auto_894919 ?auto_894920 ?auto_894921 ?auto_894922 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_894973 - BLOCK
      ?auto_894974 - BLOCK
      ?auto_894975 - BLOCK
      ?auto_894976 - BLOCK
      ?auto_894977 - BLOCK
      ?auto_894978 - BLOCK
      ?auto_894979 - BLOCK
      ?auto_894980 - BLOCK
      ?auto_894981 - BLOCK
      ?auto_894982 - BLOCK
      ?auto_894983 - BLOCK
      ?auto_894984 - BLOCK
      ?auto_894985 - BLOCK
      ?auto_894986 - BLOCK
      ?auto_894987 - BLOCK
      ?auto_894988 - BLOCK
    )
    :vars
    (
      ?auto_894989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_894988 ?auto_894989 ) ( ON-TABLE ?auto_894973 ) ( ON ?auto_894974 ?auto_894973 ) ( ON ?auto_894975 ?auto_894974 ) ( ON ?auto_894976 ?auto_894975 ) ( ON ?auto_894977 ?auto_894976 ) ( ON ?auto_894978 ?auto_894977 ) ( ON ?auto_894979 ?auto_894978 ) ( not ( = ?auto_894973 ?auto_894974 ) ) ( not ( = ?auto_894973 ?auto_894975 ) ) ( not ( = ?auto_894973 ?auto_894976 ) ) ( not ( = ?auto_894973 ?auto_894977 ) ) ( not ( = ?auto_894973 ?auto_894978 ) ) ( not ( = ?auto_894973 ?auto_894979 ) ) ( not ( = ?auto_894973 ?auto_894980 ) ) ( not ( = ?auto_894973 ?auto_894981 ) ) ( not ( = ?auto_894973 ?auto_894982 ) ) ( not ( = ?auto_894973 ?auto_894983 ) ) ( not ( = ?auto_894973 ?auto_894984 ) ) ( not ( = ?auto_894973 ?auto_894985 ) ) ( not ( = ?auto_894973 ?auto_894986 ) ) ( not ( = ?auto_894973 ?auto_894987 ) ) ( not ( = ?auto_894973 ?auto_894988 ) ) ( not ( = ?auto_894973 ?auto_894989 ) ) ( not ( = ?auto_894974 ?auto_894975 ) ) ( not ( = ?auto_894974 ?auto_894976 ) ) ( not ( = ?auto_894974 ?auto_894977 ) ) ( not ( = ?auto_894974 ?auto_894978 ) ) ( not ( = ?auto_894974 ?auto_894979 ) ) ( not ( = ?auto_894974 ?auto_894980 ) ) ( not ( = ?auto_894974 ?auto_894981 ) ) ( not ( = ?auto_894974 ?auto_894982 ) ) ( not ( = ?auto_894974 ?auto_894983 ) ) ( not ( = ?auto_894974 ?auto_894984 ) ) ( not ( = ?auto_894974 ?auto_894985 ) ) ( not ( = ?auto_894974 ?auto_894986 ) ) ( not ( = ?auto_894974 ?auto_894987 ) ) ( not ( = ?auto_894974 ?auto_894988 ) ) ( not ( = ?auto_894974 ?auto_894989 ) ) ( not ( = ?auto_894975 ?auto_894976 ) ) ( not ( = ?auto_894975 ?auto_894977 ) ) ( not ( = ?auto_894975 ?auto_894978 ) ) ( not ( = ?auto_894975 ?auto_894979 ) ) ( not ( = ?auto_894975 ?auto_894980 ) ) ( not ( = ?auto_894975 ?auto_894981 ) ) ( not ( = ?auto_894975 ?auto_894982 ) ) ( not ( = ?auto_894975 ?auto_894983 ) ) ( not ( = ?auto_894975 ?auto_894984 ) ) ( not ( = ?auto_894975 ?auto_894985 ) ) ( not ( = ?auto_894975 ?auto_894986 ) ) ( not ( = ?auto_894975 ?auto_894987 ) ) ( not ( = ?auto_894975 ?auto_894988 ) ) ( not ( = ?auto_894975 ?auto_894989 ) ) ( not ( = ?auto_894976 ?auto_894977 ) ) ( not ( = ?auto_894976 ?auto_894978 ) ) ( not ( = ?auto_894976 ?auto_894979 ) ) ( not ( = ?auto_894976 ?auto_894980 ) ) ( not ( = ?auto_894976 ?auto_894981 ) ) ( not ( = ?auto_894976 ?auto_894982 ) ) ( not ( = ?auto_894976 ?auto_894983 ) ) ( not ( = ?auto_894976 ?auto_894984 ) ) ( not ( = ?auto_894976 ?auto_894985 ) ) ( not ( = ?auto_894976 ?auto_894986 ) ) ( not ( = ?auto_894976 ?auto_894987 ) ) ( not ( = ?auto_894976 ?auto_894988 ) ) ( not ( = ?auto_894976 ?auto_894989 ) ) ( not ( = ?auto_894977 ?auto_894978 ) ) ( not ( = ?auto_894977 ?auto_894979 ) ) ( not ( = ?auto_894977 ?auto_894980 ) ) ( not ( = ?auto_894977 ?auto_894981 ) ) ( not ( = ?auto_894977 ?auto_894982 ) ) ( not ( = ?auto_894977 ?auto_894983 ) ) ( not ( = ?auto_894977 ?auto_894984 ) ) ( not ( = ?auto_894977 ?auto_894985 ) ) ( not ( = ?auto_894977 ?auto_894986 ) ) ( not ( = ?auto_894977 ?auto_894987 ) ) ( not ( = ?auto_894977 ?auto_894988 ) ) ( not ( = ?auto_894977 ?auto_894989 ) ) ( not ( = ?auto_894978 ?auto_894979 ) ) ( not ( = ?auto_894978 ?auto_894980 ) ) ( not ( = ?auto_894978 ?auto_894981 ) ) ( not ( = ?auto_894978 ?auto_894982 ) ) ( not ( = ?auto_894978 ?auto_894983 ) ) ( not ( = ?auto_894978 ?auto_894984 ) ) ( not ( = ?auto_894978 ?auto_894985 ) ) ( not ( = ?auto_894978 ?auto_894986 ) ) ( not ( = ?auto_894978 ?auto_894987 ) ) ( not ( = ?auto_894978 ?auto_894988 ) ) ( not ( = ?auto_894978 ?auto_894989 ) ) ( not ( = ?auto_894979 ?auto_894980 ) ) ( not ( = ?auto_894979 ?auto_894981 ) ) ( not ( = ?auto_894979 ?auto_894982 ) ) ( not ( = ?auto_894979 ?auto_894983 ) ) ( not ( = ?auto_894979 ?auto_894984 ) ) ( not ( = ?auto_894979 ?auto_894985 ) ) ( not ( = ?auto_894979 ?auto_894986 ) ) ( not ( = ?auto_894979 ?auto_894987 ) ) ( not ( = ?auto_894979 ?auto_894988 ) ) ( not ( = ?auto_894979 ?auto_894989 ) ) ( not ( = ?auto_894980 ?auto_894981 ) ) ( not ( = ?auto_894980 ?auto_894982 ) ) ( not ( = ?auto_894980 ?auto_894983 ) ) ( not ( = ?auto_894980 ?auto_894984 ) ) ( not ( = ?auto_894980 ?auto_894985 ) ) ( not ( = ?auto_894980 ?auto_894986 ) ) ( not ( = ?auto_894980 ?auto_894987 ) ) ( not ( = ?auto_894980 ?auto_894988 ) ) ( not ( = ?auto_894980 ?auto_894989 ) ) ( not ( = ?auto_894981 ?auto_894982 ) ) ( not ( = ?auto_894981 ?auto_894983 ) ) ( not ( = ?auto_894981 ?auto_894984 ) ) ( not ( = ?auto_894981 ?auto_894985 ) ) ( not ( = ?auto_894981 ?auto_894986 ) ) ( not ( = ?auto_894981 ?auto_894987 ) ) ( not ( = ?auto_894981 ?auto_894988 ) ) ( not ( = ?auto_894981 ?auto_894989 ) ) ( not ( = ?auto_894982 ?auto_894983 ) ) ( not ( = ?auto_894982 ?auto_894984 ) ) ( not ( = ?auto_894982 ?auto_894985 ) ) ( not ( = ?auto_894982 ?auto_894986 ) ) ( not ( = ?auto_894982 ?auto_894987 ) ) ( not ( = ?auto_894982 ?auto_894988 ) ) ( not ( = ?auto_894982 ?auto_894989 ) ) ( not ( = ?auto_894983 ?auto_894984 ) ) ( not ( = ?auto_894983 ?auto_894985 ) ) ( not ( = ?auto_894983 ?auto_894986 ) ) ( not ( = ?auto_894983 ?auto_894987 ) ) ( not ( = ?auto_894983 ?auto_894988 ) ) ( not ( = ?auto_894983 ?auto_894989 ) ) ( not ( = ?auto_894984 ?auto_894985 ) ) ( not ( = ?auto_894984 ?auto_894986 ) ) ( not ( = ?auto_894984 ?auto_894987 ) ) ( not ( = ?auto_894984 ?auto_894988 ) ) ( not ( = ?auto_894984 ?auto_894989 ) ) ( not ( = ?auto_894985 ?auto_894986 ) ) ( not ( = ?auto_894985 ?auto_894987 ) ) ( not ( = ?auto_894985 ?auto_894988 ) ) ( not ( = ?auto_894985 ?auto_894989 ) ) ( not ( = ?auto_894986 ?auto_894987 ) ) ( not ( = ?auto_894986 ?auto_894988 ) ) ( not ( = ?auto_894986 ?auto_894989 ) ) ( not ( = ?auto_894987 ?auto_894988 ) ) ( not ( = ?auto_894987 ?auto_894989 ) ) ( not ( = ?auto_894988 ?auto_894989 ) ) ( ON ?auto_894987 ?auto_894988 ) ( ON ?auto_894986 ?auto_894987 ) ( ON ?auto_894985 ?auto_894986 ) ( ON ?auto_894984 ?auto_894985 ) ( ON ?auto_894983 ?auto_894984 ) ( ON ?auto_894982 ?auto_894983 ) ( ON ?auto_894981 ?auto_894982 ) ( CLEAR ?auto_894979 ) ( ON ?auto_894980 ?auto_894981 ) ( CLEAR ?auto_894980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_894973 ?auto_894974 ?auto_894975 ?auto_894976 ?auto_894977 ?auto_894978 ?auto_894979 ?auto_894980 )
      ( MAKE-16PILE ?auto_894973 ?auto_894974 ?auto_894975 ?auto_894976 ?auto_894977 ?auto_894978 ?auto_894979 ?auto_894980 ?auto_894981 ?auto_894982 ?auto_894983 ?auto_894984 ?auto_894985 ?auto_894986 ?auto_894987 ?auto_894988 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_895039 - BLOCK
      ?auto_895040 - BLOCK
      ?auto_895041 - BLOCK
      ?auto_895042 - BLOCK
      ?auto_895043 - BLOCK
      ?auto_895044 - BLOCK
      ?auto_895045 - BLOCK
      ?auto_895046 - BLOCK
      ?auto_895047 - BLOCK
      ?auto_895048 - BLOCK
      ?auto_895049 - BLOCK
      ?auto_895050 - BLOCK
      ?auto_895051 - BLOCK
      ?auto_895052 - BLOCK
      ?auto_895053 - BLOCK
      ?auto_895054 - BLOCK
    )
    :vars
    (
      ?auto_895055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895054 ?auto_895055 ) ( ON-TABLE ?auto_895039 ) ( ON ?auto_895040 ?auto_895039 ) ( ON ?auto_895041 ?auto_895040 ) ( ON ?auto_895042 ?auto_895041 ) ( ON ?auto_895043 ?auto_895042 ) ( ON ?auto_895044 ?auto_895043 ) ( not ( = ?auto_895039 ?auto_895040 ) ) ( not ( = ?auto_895039 ?auto_895041 ) ) ( not ( = ?auto_895039 ?auto_895042 ) ) ( not ( = ?auto_895039 ?auto_895043 ) ) ( not ( = ?auto_895039 ?auto_895044 ) ) ( not ( = ?auto_895039 ?auto_895045 ) ) ( not ( = ?auto_895039 ?auto_895046 ) ) ( not ( = ?auto_895039 ?auto_895047 ) ) ( not ( = ?auto_895039 ?auto_895048 ) ) ( not ( = ?auto_895039 ?auto_895049 ) ) ( not ( = ?auto_895039 ?auto_895050 ) ) ( not ( = ?auto_895039 ?auto_895051 ) ) ( not ( = ?auto_895039 ?auto_895052 ) ) ( not ( = ?auto_895039 ?auto_895053 ) ) ( not ( = ?auto_895039 ?auto_895054 ) ) ( not ( = ?auto_895039 ?auto_895055 ) ) ( not ( = ?auto_895040 ?auto_895041 ) ) ( not ( = ?auto_895040 ?auto_895042 ) ) ( not ( = ?auto_895040 ?auto_895043 ) ) ( not ( = ?auto_895040 ?auto_895044 ) ) ( not ( = ?auto_895040 ?auto_895045 ) ) ( not ( = ?auto_895040 ?auto_895046 ) ) ( not ( = ?auto_895040 ?auto_895047 ) ) ( not ( = ?auto_895040 ?auto_895048 ) ) ( not ( = ?auto_895040 ?auto_895049 ) ) ( not ( = ?auto_895040 ?auto_895050 ) ) ( not ( = ?auto_895040 ?auto_895051 ) ) ( not ( = ?auto_895040 ?auto_895052 ) ) ( not ( = ?auto_895040 ?auto_895053 ) ) ( not ( = ?auto_895040 ?auto_895054 ) ) ( not ( = ?auto_895040 ?auto_895055 ) ) ( not ( = ?auto_895041 ?auto_895042 ) ) ( not ( = ?auto_895041 ?auto_895043 ) ) ( not ( = ?auto_895041 ?auto_895044 ) ) ( not ( = ?auto_895041 ?auto_895045 ) ) ( not ( = ?auto_895041 ?auto_895046 ) ) ( not ( = ?auto_895041 ?auto_895047 ) ) ( not ( = ?auto_895041 ?auto_895048 ) ) ( not ( = ?auto_895041 ?auto_895049 ) ) ( not ( = ?auto_895041 ?auto_895050 ) ) ( not ( = ?auto_895041 ?auto_895051 ) ) ( not ( = ?auto_895041 ?auto_895052 ) ) ( not ( = ?auto_895041 ?auto_895053 ) ) ( not ( = ?auto_895041 ?auto_895054 ) ) ( not ( = ?auto_895041 ?auto_895055 ) ) ( not ( = ?auto_895042 ?auto_895043 ) ) ( not ( = ?auto_895042 ?auto_895044 ) ) ( not ( = ?auto_895042 ?auto_895045 ) ) ( not ( = ?auto_895042 ?auto_895046 ) ) ( not ( = ?auto_895042 ?auto_895047 ) ) ( not ( = ?auto_895042 ?auto_895048 ) ) ( not ( = ?auto_895042 ?auto_895049 ) ) ( not ( = ?auto_895042 ?auto_895050 ) ) ( not ( = ?auto_895042 ?auto_895051 ) ) ( not ( = ?auto_895042 ?auto_895052 ) ) ( not ( = ?auto_895042 ?auto_895053 ) ) ( not ( = ?auto_895042 ?auto_895054 ) ) ( not ( = ?auto_895042 ?auto_895055 ) ) ( not ( = ?auto_895043 ?auto_895044 ) ) ( not ( = ?auto_895043 ?auto_895045 ) ) ( not ( = ?auto_895043 ?auto_895046 ) ) ( not ( = ?auto_895043 ?auto_895047 ) ) ( not ( = ?auto_895043 ?auto_895048 ) ) ( not ( = ?auto_895043 ?auto_895049 ) ) ( not ( = ?auto_895043 ?auto_895050 ) ) ( not ( = ?auto_895043 ?auto_895051 ) ) ( not ( = ?auto_895043 ?auto_895052 ) ) ( not ( = ?auto_895043 ?auto_895053 ) ) ( not ( = ?auto_895043 ?auto_895054 ) ) ( not ( = ?auto_895043 ?auto_895055 ) ) ( not ( = ?auto_895044 ?auto_895045 ) ) ( not ( = ?auto_895044 ?auto_895046 ) ) ( not ( = ?auto_895044 ?auto_895047 ) ) ( not ( = ?auto_895044 ?auto_895048 ) ) ( not ( = ?auto_895044 ?auto_895049 ) ) ( not ( = ?auto_895044 ?auto_895050 ) ) ( not ( = ?auto_895044 ?auto_895051 ) ) ( not ( = ?auto_895044 ?auto_895052 ) ) ( not ( = ?auto_895044 ?auto_895053 ) ) ( not ( = ?auto_895044 ?auto_895054 ) ) ( not ( = ?auto_895044 ?auto_895055 ) ) ( not ( = ?auto_895045 ?auto_895046 ) ) ( not ( = ?auto_895045 ?auto_895047 ) ) ( not ( = ?auto_895045 ?auto_895048 ) ) ( not ( = ?auto_895045 ?auto_895049 ) ) ( not ( = ?auto_895045 ?auto_895050 ) ) ( not ( = ?auto_895045 ?auto_895051 ) ) ( not ( = ?auto_895045 ?auto_895052 ) ) ( not ( = ?auto_895045 ?auto_895053 ) ) ( not ( = ?auto_895045 ?auto_895054 ) ) ( not ( = ?auto_895045 ?auto_895055 ) ) ( not ( = ?auto_895046 ?auto_895047 ) ) ( not ( = ?auto_895046 ?auto_895048 ) ) ( not ( = ?auto_895046 ?auto_895049 ) ) ( not ( = ?auto_895046 ?auto_895050 ) ) ( not ( = ?auto_895046 ?auto_895051 ) ) ( not ( = ?auto_895046 ?auto_895052 ) ) ( not ( = ?auto_895046 ?auto_895053 ) ) ( not ( = ?auto_895046 ?auto_895054 ) ) ( not ( = ?auto_895046 ?auto_895055 ) ) ( not ( = ?auto_895047 ?auto_895048 ) ) ( not ( = ?auto_895047 ?auto_895049 ) ) ( not ( = ?auto_895047 ?auto_895050 ) ) ( not ( = ?auto_895047 ?auto_895051 ) ) ( not ( = ?auto_895047 ?auto_895052 ) ) ( not ( = ?auto_895047 ?auto_895053 ) ) ( not ( = ?auto_895047 ?auto_895054 ) ) ( not ( = ?auto_895047 ?auto_895055 ) ) ( not ( = ?auto_895048 ?auto_895049 ) ) ( not ( = ?auto_895048 ?auto_895050 ) ) ( not ( = ?auto_895048 ?auto_895051 ) ) ( not ( = ?auto_895048 ?auto_895052 ) ) ( not ( = ?auto_895048 ?auto_895053 ) ) ( not ( = ?auto_895048 ?auto_895054 ) ) ( not ( = ?auto_895048 ?auto_895055 ) ) ( not ( = ?auto_895049 ?auto_895050 ) ) ( not ( = ?auto_895049 ?auto_895051 ) ) ( not ( = ?auto_895049 ?auto_895052 ) ) ( not ( = ?auto_895049 ?auto_895053 ) ) ( not ( = ?auto_895049 ?auto_895054 ) ) ( not ( = ?auto_895049 ?auto_895055 ) ) ( not ( = ?auto_895050 ?auto_895051 ) ) ( not ( = ?auto_895050 ?auto_895052 ) ) ( not ( = ?auto_895050 ?auto_895053 ) ) ( not ( = ?auto_895050 ?auto_895054 ) ) ( not ( = ?auto_895050 ?auto_895055 ) ) ( not ( = ?auto_895051 ?auto_895052 ) ) ( not ( = ?auto_895051 ?auto_895053 ) ) ( not ( = ?auto_895051 ?auto_895054 ) ) ( not ( = ?auto_895051 ?auto_895055 ) ) ( not ( = ?auto_895052 ?auto_895053 ) ) ( not ( = ?auto_895052 ?auto_895054 ) ) ( not ( = ?auto_895052 ?auto_895055 ) ) ( not ( = ?auto_895053 ?auto_895054 ) ) ( not ( = ?auto_895053 ?auto_895055 ) ) ( not ( = ?auto_895054 ?auto_895055 ) ) ( ON ?auto_895053 ?auto_895054 ) ( ON ?auto_895052 ?auto_895053 ) ( ON ?auto_895051 ?auto_895052 ) ( ON ?auto_895050 ?auto_895051 ) ( ON ?auto_895049 ?auto_895050 ) ( ON ?auto_895048 ?auto_895049 ) ( ON ?auto_895047 ?auto_895048 ) ( ON ?auto_895046 ?auto_895047 ) ( CLEAR ?auto_895044 ) ( ON ?auto_895045 ?auto_895046 ) ( CLEAR ?auto_895045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_895039 ?auto_895040 ?auto_895041 ?auto_895042 ?auto_895043 ?auto_895044 ?auto_895045 )
      ( MAKE-16PILE ?auto_895039 ?auto_895040 ?auto_895041 ?auto_895042 ?auto_895043 ?auto_895044 ?auto_895045 ?auto_895046 ?auto_895047 ?auto_895048 ?auto_895049 ?auto_895050 ?auto_895051 ?auto_895052 ?auto_895053 ?auto_895054 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_895105 - BLOCK
      ?auto_895106 - BLOCK
      ?auto_895107 - BLOCK
      ?auto_895108 - BLOCK
      ?auto_895109 - BLOCK
      ?auto_895110 - BLOCK
      ?auto_895111 - BLOCK
      ?auto_895112 - BLOCK
      ?auto_895113 - BLOCK
      ?auto_895114 - BLOCK
      ?auto_895115 - BLOCK
      ?auto_895116 - BLOCK
      ?auto_895117 - BLOCK
      ?auto_895118 - BLOCK
      ?auto_895119 - BLOCK
      ?auto_895120 - BLOCK
    )
    :vars
    (
      ?auto_895121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895120 ?auto_895121 ) ( ON-TABLE ?auto_895105 ) ( ON ?auto_895106 ?auto_895105 ) ( ON ?auto_895107 ?auto_895106 ) ( ON ?auto_895108 ?auto_895107 ) ( ON ?auto_895109 ?auto_895108 ) ( not ( = ?auto_895105 ?auto_895106 ) ) ( not ( = ?auto_895105 ?auto_895107 ) ) ( not ( = ?auto_895105 ?auto_895108 ) ) ( not ( = ?auto_895105 ?auto_895109 ) ) ( not ( = ?auto_895105 ?auto_895110 ) ) ( not ( = ?auto_895105 ?auto_895111 ) ) ( not ( = ?auto_895105 ?auto_895112 ) ) ( not ( = ?auto_895105 ?auto_895113 ) ) ( not ( = ?auto_895105 ?auto_895114 ) ) ( not ( = ?auto_895105 ?auto_895115 ) ) ( not ( = ?auto_895105 ?auto_895116 ) ) ( not ( = ?auto_895105 ?auto_895117 ) ) ( not ( = ?auto_895105 ?auto_895118 ) ) ( not ( = ?auto_895105 ?auto_895119 ) ) ( not ( = ?auto_895105 ?auto_895120 ) ) ( not ( = ?auto_895105 ?auto_895121 ) ) ( not ( = ?auto_895106 ?auto_895107 ) ) ( not ( = ?auto_895106 ?auto_895108 ) ) ( not ( = ?auto_895106 ?auto_895109 ) ) ( not ( = ?auto_895106 ?auto_895110 ) ) ( not ( = ?auto_895106 ?auto_895111 ) ) ( not ( = ?auto_895106 ?auto_895112 ) ) ( not ( = ?auto_895106 ?auto_895113 ) ) ( not ( = ?auto_895106 ?auto_895114 ) ) ( not ( = ?auto_895106 ?auto_895115 ) ) ( not ( = ?auto_895106 ?auto_895116 ) ) ( not ( = ?auto_895106 ?auto_895117 ) ) ( not ( = ?auto_895106 ?auto_895118 ) ) ( not ( = ?auto_895106 ?auto_895119 ) ) ( not ( = ?auto_895106 ?auto_895120 ) ) ( not ( = ?auto_895106 ?auto_895121 ) ) ( not ( = ?auto_895107 ?auto_895108 ) ) ( not ( = ?auto_895107 ?auto_895109 ) ) ( not ( = ?auto_895107 ?auto_895110 ) ) ( not ( = ?auto_895107 ?auto_895111 ) ) ( not ( = ?auto_895107 ?auto_895112 ) ) ( not ( = ?auto_895107 ?auto_895113 ) ) ( not ( = ?auto_895107 ?auto_895114 ) ) ( not ( = ?auto_895107 ?auto_895115 ) ) ( not ( = ?auto_895107 ?auto_895116 ) ) ( not ( = ?auto_895107 ?auto_895117 ) ) ( not ( = ?auto_895107 ?auto_895118 ) ) ( not ( = ?auto_895107 ?auto_895119 ) ) ( not ( = ?auto_895107 ?auto_895120 ) ) ( not ( = ?auto_895107 ?auto_895121 ) ) ( not ( = ?auto_895108 ?auto_895109 ) ) ( not ( = ?auto_895108 ?auto_895110 ) ) ( not ( = ?auto_895108 ?auto_895111 ) ) ( not ( = ?auto_895108 ?auto_895112 ) ) ( not ( = ?auto_895108 ?auto_895113 ) ) ( not ( = ?auto_895108 ?auto_895114 ) ) ( not ( = ?auto_895108 ?auto_895115 ) ) ( not ( = ?auto_895108 ?auto_895116 ) ) ( not ( = ?auto_895108 ?auto_895117 ) ) ( not ( = ?auto_895108 ?auto_895118 ) ) ( not ( = ?auto_895108 ?auto_895119 ) ) ( not ( = ?auto_895108 ?auto_895120 ) ) ( not ( = ?auto_895108 ?auto_895121 ) ) ( not ( = ?auto_895109 ?auto_895110 ) ) ( not ( = ?auto_895109 ?auto_895111 ) ) ( not ( = ?auto_895109 ?auto_895112 ) ) ( not ( = ?auto_895109 ?auto_895113 ) ) ( not ( = ?auto_895109 ?auto_895114 ) ) ( not ( = ?auto_895109 ?auto_895115 ) ) ( not ( = ?auto_895109 ?auto_895116 ) ) ( not ( = ?auto_895109 ?auto_895117 ) ) ( not ( = ?auto_895109 ?auto_895118 ) ) ( not ( = ?auto_895109 ?auto_895119 ) ) ( not ( = ?auto_895109 ?auto_895120 ) ) ( not ( = ?auto_895109 ?auto_895121 ) ) ( not ( = ?auto_895110 ?auto_895111 ) ) ( not ( = ?auto_895110 ?auto_895112 ) ) ( not ( = ?auto_895110 ?auto_895113 ) ) ( not ( = ?auto_895110 ?auto_895114 ) ) ( not ( = ?auto_895110 ?auto_895115 ) ) ( not ( = ?auto_895110 ?auto_895116 ) ) ( not ( = ?auto_895110 ?auto_895117 ) ) ( not ( = ?auto_895110 ?auto_895118 ) ) ( not ( = ?auto_895110 ?auto_895119 ) ) ( not ( = ?auto_895110 ?auto_895120 ) ) ( not ( = ?auto_895110 ?auto_895121 ) ) ( not ( = ?auto_895111 ?auto_895112 ) ) ( not ( = ?auto_895111 ?auto_895113 ) ) ( not ( = ?auto_895111 ?auto_895114 ) ) ( not ( = ?auto_895111 ?auto_895115 ) ) ( not ( = ?auto_895111 ?auto_895116 ) ) ( not ( = ?auto_895111 ?auto_895117 ) ) ( not ( = ?auto_895111 ?auto_895118 ) ) ( not ( = ?auto_895111 ?auto_895119 ) ) ( not ( = ?auto_895111 ?auto_895120 ) ) ( not ( = ?auto_895111 ?auto_895121 ) ) ( not ( = ?auto_895112 ?auto_895113 ) ) ( not ( = ?auto_895112 ?auto_895114 ) ) ( not ( = ?auto_895112 ?auto_895115 ) ) ( not ( = ?auto_895112 ?auto_895116 ) ) ( not ( = ?auto_895112 ?auto_895117 ) ) ( not ( = ?auto_895112 ?auto_895118 ) ) ( not ( = ?auto_895112 ?auto_895119 ) ) ( not ( = ?auto_895112 ?auto_895120 ) ) ( not ( = ?auto_895112 ?auto_895121 ) ) ( not ( = ?auto_895113 ?auto_895114 ) ) ( not ( = ?auto_895113 ?auto_895115 ) ) ( not ( = ?auto_895113 ?auto_895116 ) ) ( not ( = ?auto_895113 ?auto_895117 ) ) ( not ( = ?auto_895113 ?auto_895118 ) ) ( not ( = ?auto_895113 ?auto_895119 ) ) ( not ( = ?auto_895113 ?auto_895120 ) ) ( not ( = ?auto_895113 ?auto_895121 ) ) ( not ( = ?auto_895114 ?auto_895115 ) ) ( not ( = ?auto_895114 ?auto_895116 ) ) ( not ( = ?auto_895114 ?auto_895117 ) ) ( not ( = ?auto_895114 ?auto_895118 ) ) ( not ( = ?auto_895114 ?auto_895119 ) ) ( not ( = ?auto_895114 ?auto_895120 ) ) ( not ( = ?auto_895114 ?auto_895121 ) ) ( not ( = ?auto_895115 ?auto_895116 ) ) ( not ( = ?auto_895115 ?auto_895117 ) ) ( not ( = ?auto_895115 ?auto_895118 ) ) ( not ( = ?auto_895115 ?auto_895119 ) ) ( not ( = ?auto_895115 ?auto_895120 ) ) ( not ( = ?auto_895115 ?auto_895121 ) ) ( not ( = ?auto_895116 ?auto_895117 ) ) ( not ( = ?auto_895116 ?auto_895118 ) ) ( not ( = ?auto_895116 ?auto_895119 ) ) ( not ( = ?auto_895116 ?auto_895120 ) ) ( not ( = ?auto_895116 ?auto_895121 ) ) ( not ( = ?auto_895117 ?auto_895118 ) ) ( not ( = ?auto_895117 ?auto_895119 ) ) ( not ( = ?auto_895117 ?auto_895120 ) ) ( not ( = ?auto_895117 ?auto_895121 ) ) ( not ( = ?auto_895118 ?auto_895119 ) ) ( not ( = ?auto_895118 ?auto_895120 ) ) ( not ( = ?auto_895118 ?auto_895121 ) ) ( not ( = ?auto_895119 ?auto_895120 ) ) ( not ( = ?auto_895119 ?auto_895121 ) ) ( not ( = ?auto_895120 ?auto_895121 ) ) ( ON ?auto_895119 ?auto_895120 ) ( ON ?auto_895118 ?auto_895119 ) ( ON ?auto_895117 ?auto_895118 ) ( ON ?auto_895116 ?auto_895117 ) ( ON ?auto_895115 ?auto_895116 ) ( ON ?auto_895114 ?auto_895115 ) ( ON ?auto_895113 ?auto_895114 ) ( ON ?auto_895112 ?auto_895113 ) ( ON ?auto_895111 ?auto_895112 ) ( CLEAR ?auto_895109 ) ( ON ?auto_895110 ?auto_895111 ) ( CLEAR ?auto_895110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_895105 ?auto_895106 ?auto_895107 ?auto_895108 ?auto_895109 ?auto_895110 )
      ( MAKE-16PILE ?auto_895105 ?auto_895106 ?auto_895107 ?auto_895108 ?auto_895109 ?auto_895110 ?auto_895111 ?auto_895112 ?auto_895113 ?auto_895114 ?auto_895115 ?auto_895116 ?auto_895117 ?auto_895118 ?auto_895119 ?auto_895120 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_895171 - BLOCK
      ?auto_895172 - BLOCK
      ?auto_895173 - BLOCK
      ?auto_895174 - BLOCK
      ?auto_895175 - BLOCK
      ?auto_895176 - BLOCK
      ?auto_895177 - BLOCK
      ?auto_895178 - BLOCK
      ?auto_895179 - BLOCK
      ?auto_895180 - BLOCK
      ?auto_895181 - BLOCK
      ?auto_895182 - BLOCK
      ?auto_895183 - BLOCK
      ?auto_895184 - BLOCK
      ?auto_895185 - BLOCK
      ?auto_895186 - BLOCK
    )
    :vars
    (
      ?auto_895187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895186 ?auto_895187 ) ( ON-TABLE ?auto_895171 ) ( ON ?auto_895172 ?auto_895171 ) ( ON ?auto_895173 ?auto_895172 ) ( ON ?auto_895174 ?auto_895173 ) ( not ( = ?auto_895171 ?auto_895172 ) ) ( not ( = ?auto_895171 ?auto_895173 ) ) ( not ( = ?auto_895171 ?auto_895174 ) ) ( not ( = ?auto_895171 ?auto_895175 ) ) ( not ( = ?auto_895171 ?auto_895176 ) ) ( not ( = ?auto_895171 ?auto_895177 ) ) ( not ( = ?auto_895171 ?auto_895178 ) ) ( not ( = ?auto_895171 ?auto_895179 ) ) ( not ( = ?auto_895171 ?auto_895180 ) ) ( not ( = ?auto_895171 ?auto_895181 ) ) ( not ( = ?auto_895171 ?auto_895182 ) ) ( not ( = ?auto_895171 ?auto_895183 ) ) ( not ( = ?auto_895171 ?auto_895184 ) ) ( not ( = ?auto_895171 ?auto_895185 ) ) ( not ( = ?auto_895171 ?auto_895186 ) ) ( not ( = ?auto_895171 ?auto_895187 ) ) ( not ( = ?auto_895172 ?auto_895173 ) ) ( not ( = ?auto_895172 ?auto_895174 ) ) ( not ( = ?auto_895172 ?auto_895175 ) ) ( not ( = ?auto_895172 ?auto_895176 ) ) ( not ( = ?auto_895172 ?auto_895177 ) ) ( not ( = ?auto_895172 ?auto_895178 ) ) ( not ( = ?auto_895172 ?auto_895179 ) ) ( not ( = ?auto_895172 ?auto_895180 ) ) ( not ( = ?auto_895172 ?auto_895181 ) ) ( not ( = ?auto_895172 ?auto_895182 ) ) ( not ( = ?auto_895172 ?auto_895183 ) ) ( not ( = ?auto_895172 ?auto_895184 ) ) ( not ( = ?auto_895172 ?auto_895185 ) ) ( not ( = ?auto_895172 ?auto_895186 ) ) ( not ( = ?auto_895172 ?auto_895187 ) ) ( not ( = ?auto_895173 ?auto_895174 ) ) ( not ( = ?auto_895173 ?auto_895175 ) ) ( not ( = ?auto_895173 ?auto_895176 ) ) ( not ( = ?auto_895173 ?auto_895177 ) ) ( not ( = ?auto_895173 ?auto_895178 ) ) ( not ( = ?auto_895173 ?auto_895179 ) ) ( not ( = ?auto_895173 ?auto_895180 ) ) ( not ( = ?auto_895173 ?auto_895181 ) ) ( not ( = ?auto_895173 ?auto_895182 ) ) ( not ( = ?auto_895173 ?auto_895183 ) ) ( not ( = ?auto_895173 ?auto_895184 ) ) ( not ( = ?auto_895173 ?auto_895185 ) ) ( not ( = ?auto_895173 ?auto_895186 ) ) ( not ( = ?auto_895173 ?auto_895187 ) ) ( not ( = ?auto_895174 ?auto_895175 ) ) ( not ( = ?auto_895174 ?auto_895176 ) ) ( not ( = ?auto_895174 ?auto_895177 ) ) ( not ( = ?auto_895174 ?auto_895178 ) ) ( not ( = ?auto_895174 ?auto_895179 ) ) ( not ( = ?auto_895174 ?auto_895180 ) ) ( not ( = ?auto_895174 ?auto_895181 ) ) ( not ( = ?auto_895174 ?auto_895182 ) ) ( not ( = ?auto_895174 ?auto_895183 ) ) ( not ( = ?auto_895174 ?auto_895184 ) ) ( not ( = ?auto_895174 ?auto_895185 ) ) ( not ( = ?auto_895174 ?auto_895186 ) ) ( not ( = ?auto_895174 ?auto_895187 ) ) ( not ( = ?auto_895175 ?auto_895176 ) ) ( not ( = ?auto_895175 ?auto_895177 ) ) ( not ( = ?auto_895175 ?auto_895178 ) ) ( not ( = ?auto_895175 ?auto_895179 ) ) ( not ( = ?auto_895175 ?auto_895180 ) ) ( not ( = ?auto_895175 ?auto_895181 ) ) ( not ( = ?auto_895175 ?auto_895182 ) ) ( not ( = ?auto_895175 ?auto_895183 ) ) ( not ( = ?auto_895175 ?auto_895184 ) ) ( not ( = ?auto_895175 ?auto_895185 ) ) ( not ( = ?auto_895175 ?auto_895186 ) ) ( not ( = ?auto_895175 ?auto_895187 ) ) ( not ( = ?auto_895176 ?auto_895177 ) ) ( not ( = ?auto_895176 ?auto_895178 ) ) ( not ( = ?auto_895176 ?auto_895179 ) ) ( not ( = ?auto_895176 ?auto_895180 ) ) ( not ( = ?auto_895176 ?auto_895181 ) ) ( not ( = ?auto_895176 ?auto_895182 ) ) ( not ( = ?auto_895176 ?auto_895183 ) ) ( not ( = ?auto_895176 ?auto_895184 ) ) ( not ( = ?auto_895176 ?auto_895185 ) ) ( not ( = ?auto_895176 ?auto_895186 ) ) ( not ( = ?auto_895176 ?auto_895187 ) ) ( not ( = ?auto_895177 ?auto_895178 ) ) ( not ( = ?auto_895177 ?auto_895179 ) ) ( not ( = ?auto_895177 ?auto_895180 ) ) ( not ( = ?auto_895177 ?auto_895181 ) ) ( not ( = ?auto_895177 ?auto_895182 ) ) ( not ( = ?auto_895177 ?auto_895183 ) ) ( not ( = ?auto_895177 ?auto_895184 ) ) ( not ( = ?auto_895177 ?auto_895185 ) ) ( not ( = ?auto_895177 ?auto_895186 ) ) ( not ( = ?auto_895177 ?auto_895187 ) ) ( not ( = ?auto_895178 ?auto_895179 ) ) ( not ( = ?auto_895178 ?auto_895180 ) ) ( not ( = ?auto_895178 ?auto_895181 ) ) ( not ( = ?auto_895178 ?auto_895182 ) ) ( not ( = ?auto_895178 ?auto_895183 ) ) ( not ( = ?auto_895178 ?auto_895184 ) ) ( not ( = ?auto_895178 ?auto_895185 ) ) ( not ( = ?auto_895178 ?auto_895186 ) ) ( not ( = ?auto_895178 ?auto_895187 ) ) ( not ( = ?auto_895179 ?auto_895180 ) ) ( not ( = ?auto_895179 ?auto_895181 ) ) ( not ( = ?auto_895179 ?auto_895182 ) ) ( not ( = ?auto_895179 ?auto_895183 ) ) ( not ( = ?auto_895179 ?auto_895184 ) ) ( not ( = ?auto_895179 ?auto_895185 ) ) ( not ( = ?auto_895179 ?auto_895186 ) ) ( not ( = ?auto_895179 ?auto_895187 ) ) ( not ( = ?auto_895180 ?auto_895181 ) ) ( not ( = ?auto_895180 ?auto_895182 ) ) ( not ( = ?auto_895180 ?auto_895183 ) ) ( not ( = ?auto_895180 ?auto_895184 ) ) ( not ( = ?auto_895180 ?auto_895185 ) ) ( not ( = ?auto_895180 ?auto_895186 ) ) ( not ( = ?auto_895180 ?auto_895187 ) ) ( not ( = ?auto_895181 ?auto_895182 ) ) ( not ( = ?auto_895181 ?auto_895183 ) ) ( not ( = ?auto_895181 ?auto_895184 ) ) ( not ( = ?auto_895181 ?auto_895185 ) ) ( not ( = ?auto_895181 ?auto_895186 ) ) ( not ( = ?auto_895181 ?auto_895187 ) ) ( not ( = ?auto_895182 ?auto_895183 ) ) ( not ( = ?auto_895182 ?auto_895184 ) ) ( not ( = ?auto_895182 ?auto_895185 ) ) ( not ( = ?auto_895182 ?auto_895186 ) ) ( not ( = ?auto_895182 ?auto_895187 ) ) ( not ( = ?auto_895183 ?auto_895184 ) ) ( not ( = ?auto_895183 ?auto_895185 ) ) ( not ( = ?auto_895183 ?auto_895186 ) ) ( not ( = ?auto_895183 ?auto_895187 ) ) ( not ( = ?auto_895184 ?auto_895185 ) ) ( not ( = ?auto_895184 ?auto_895186 ) ) ( not ( = ?auto_895184 ?auto_895187 ) ) ( not ( = ?auto_895185 ?auto_895186 ) ) ( not ( = ?auto_895185 ?auto_895187 ) ) ( not ( = ?auto_895186 ?auto_895187 ) ) ( ON ?auto_895185 ?auto_895186 ) ( ON ?auto_895184 ?auto_895185 ) ( ON ?auto_895183 ?auto_895184 ) ( ON ?auto_895182 ?auto_895183 ) ( ON ?auto_895181 ?auto_895182 ) ( ON ?auto_895180 ?auto_895181 ) ( ON ?auto_895179 ?auto_895180 ) ( ON ?auto_895178 ?auto_895179 ) ( ON ?auto_895177 ?auto_895178 ) ( ON ?auto_895176 ?auto_895177 ) ( CLEAR ?auto_895174 ) ( ON ?auto_895175 ?auto_895176 ) ( CLEAR ?auto_895175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_895171 ?auto_895172 ?auto_895173 ?auto_895174 ?auto_895175 )
      ( MAKE-16PILE ?auto_895171 ?auto_895172 ?auto_895173 ?auto_895174 ?auto_895175 ?auto_895176 ?auto_895177 ?auto_895178 ?auto_895179 ?auto_895180 ?auto_895181 ?auto_895182 ?auto_895183 ?auto_895184 ?auto_895185 ?auto_895186 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_895237 - BLOCK
      ?auto_895238 - BLOCK
      ?auto_895239 - BLOCK
      ?auto_895240 - BLOCK
      ?auto_895241 - BLOCK
      ?auto_895242 - BLOCK
      ?auto_895243 - BLOCK
      ?auto_895244 - BLOCK
      ?auto_895245 - BLOCK
      ?auto_895246 - BLOCK
      ?auto_895247 - BLOCK
      ?auto_895248 - BLOCK
      ?auto_895249 - BLOCK
      ?auto_895250 - BLOCK
      ?auto_895251 - BLOCK
      ?auto_895252 - BLOCK
    )
    :vars
    (
      ?auto_895253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895252 ?auto_895253 ) ( ON-TABLE ?auto_895237 ) ( ON ?auto_895238 ?auto_895237 ) ( ON ?auto_895239 ?auto_895238 ) ( not ( = ?auto_895237 ?auto_895238 ) ) ( not ( = ?auto_895237 ?auto_895239 ) ) ( not ( = ?auto_895237 ?auto_895240 ) ) ( not ( = ?auto_895237 ?auto_895241 ) ) ( not ( = ?auto_895237 ?auto_895242 ) ) ( not ( = ?auto_895237 ?auto_895243 ) ) ( not ( = ?auto_895237 ?auto_895244 ) ) ( not ( = ?auto_895237 ?auto_895245 ) ) ( not ( = ?auto_895237 ?auto_895246 ) ) ( not ( = ?auto_895237 ?auto_895247 ) ) ( not ( = ?auto_895237 ?auto_895248 ) ) ( not ( = ?auto_895237 ?auto_895249 ) ) ( not ( = ?auto_895237 ?auto_895250 ) ) ( not ( = ?auto_895237 ?auto_895251 ) ) ( not ( = ?auto_895237 ?auto_895252 ) ) ( not ( = ?auto_895237 ?auto_895253 ) ) ( not ( = ?auto_895238 ?auto_895239 ) ) ( not ( = ?auto_895238 ?auto_895240 ) ) ( not ( = ?auto_895238 ?auto_895241 ) ) ( not ( = ?auto_895238 ?auto_895242 ) ) ( not ( = ?auto_895238 ?auto_895243 ) ) ( not ( = ?auto_895238 ?auto_895244 ) ) ( not ( = ?auto_895238 ?auto_895245 ) ) ( not ( = ?auto_895238 ?auto_895246 ) ) ( not ( = ?auto_895238 ?auto_895247 ) ) ( not ( = ?auto_895238 ?auto_895248 ) ) ( not ( = ?auto_895238 ?auto_895249 ) ) ( not ( = ?auto_895238 ?auto_895250 ) ) ( not ( = ?auto_895238 ?auto_895251 ) ) ( not ( = ?auto_895238 ?auto_895252 ) ) ( not ( = ?auto_895238 ?auto_895253 ) ) ( not ( = ?auto_895239 ?auto_895240 ) ) ( not ( = ?auto_895239 ?auto_895241 ) ) ( not ( = ?auto_895239 ?auto_895242 ) ) ( not ( = ?auto_895239 ?auto_895243 ) ) ( not ( = ?auto_895239 ?auto_895244 ) ) ( not ( = ?auto_895239 ?auto_895245 ) ) ( not ( = ?auto_895239 ?auto_895246 ) ) ( not ( = ?auto_895239 ?auto_895247 ) ) ( not ( = ?auto_895239 ?auto_895248 ) ) ( not ( = ?auto_895239 ?auto_895249 ) ) ( not ( = ?auto_895239 ?auto_895250 ) ) ( not ( = ?auto_895239 ?auto_895251 ) ) ( not ( = ?auto_895239 ?auto_895252 ) ) ( not ( = ?auto_895239 ?auto_895253 ) ) ( not ( = ?auto_895240 ?auto_895241 ) ) ( not ( = ?auto_895240 ?auto_895242 ) ) ( not ( = ?auto_895240 ?auto_895243 ) ) ( not ( = ?auto_895240 ?auto_895244 ) ) ( not ( = ?auto_895240 ?auto_895245 ) ) ( not ( = ?auto_895240 ?auto_895246 ) ) ( not ( = ?auto_895240 ?auto_895247 ) ) ( not ( = ?auto_895240 ?auto_895248 ) ) ( not ( = ?auto_895240 ?auto_895249 ) ) ( not ( = ?auto_895240 ?auto_895250 ) ) ( not ( = ?auto_895240 ?auto_895251 ) ) ( not ( = ?auto_895240 ?auto_895252 ) ) ( not ( = ?auto_895240 ?auto_895253 ) ) ( not ( = ?auto_895241 ?auto_895242 ) ) ( not ( = ?auto_895241 ?auto_895243 ) ) ( not ( = ?auto_895241 ?auto_895244 ) ) ( not ( = ?auto_895241 ?auto_895245 ) ) ( not ( = ?auto_895241 ?auto_895246 ) ) ( not ( = ?auto_895241 ?auto_895247 ) ) ( not ( = ?auto_895241 ?auto_895248 ) ) ( not ( = ?auto_895241 ?auto_895249 ) ) ( not ( = ?auto_895241 ?auto_895250 ) ) ( not ( = ?auto_895241 ?auto_895251 ) ) ( not ( = ?auto_895241 ?auto_895252 ) ) ( not ( = ?auto_895241 ?auto_895253 ) ) ( not ( = ?auto_895242 ?auto_895243 ) ) ( not ( = ?auto_895242 ?auto_895244 ) ) ( not ( = ?auto_895242 ?auto_895245 ) ) ( not ( = ?auto_895242 ?auto_895246 ) ) ( not ( = ?auto_895242 ?auto_895247 ) ) ( not ( = ?auto_895242 ?auto_895248 ) ) ( not ( = ?auto_895242 ?auto_895249 ) ) ( not ( = ?auto_895242 ?auto_895250 ) ) ( not ( = ?auto_895242 ?auto_895251 ) ) ( not ( = ?auto_895242 ?auto_895252 ) ) ( not ( = ?auto_895242 ?auto_895253 ) ) ( not ( = ?auto_895243 ?auto_895244 ) ) ( not ( = ?auto_895243 ?auto_895245 ) ) ( not ( = ?auto_895243 ?auto_895246 ) ) ( not ( = ?auto_895243 ?auto_895247 ) ) ( not ( = ?auto_895243 ?auto_895248 ) ) ( not ( = ?auto_895243 ?auto_895249 ) ) ( not ( = ?auto_895243 ?auto_895250 ) ) ( not ( = ?auto_895243 ?auto_895251 ) ) ( not ( = ?auto_895243 ?auto_895252 ) ) ( not ( = ?auto_895243 ?auto_895253 ) ) ( not ( = ?auto_895244 ?auto_895245 ) ) ( not ( = ?auto_895244 ?auto_895246 ) ) ( not ( = ?auto_895244 ?auto_895247 ) ) ( not ( = ?auto_895244 ?auto_895248 ) ) ( not ( = ?auto_895244 ?auto_895249 ) ) ( not ( = ?auto_895244 ?auto_895250 ) ) ( not ( = ?auto_895244 ?auto_895251 ) ) ( not ( = ?auto_895244 ?auto_895252 ) ) ( not ( = ?auto_895244 ?auto_895253 ) ) ( not ( = ?auto_895245 ?auto_895246 ) ) ( not ( = ?auto_895245 ?auto_895247 ) ) ( not ( = ?auto_895245 ?auto_895248 ) ) ( not ( = ?auto_895245 ?auto_895249 ) ) ( not ( = ?auto_895245 ?auto_895250 ) ) ( not ( = ?auto_895245 ?auto_895251 ) ) ( not ( = ?auto_895245 ?auto_895252 ) ) ( not ( = ?auto_895245 ?auto_895253 ) ) ( not ( = ?auto_895246 ?auto_895247 ) ) ( not ( = ?auto_895246 ?auto_895248 ) ) ( not ( = ?auto_895246 ?auto_895249 ) ) ( not ( = ?auto_895246 ?auto_895250 ) ) ( not ( = ?auto_895246 ?auto_895251 ) ) ( not ( = ?auto_895246 ?auto_895252 ) ) ( not ( = ?auto_895246 ?auto_895253 ) ) ( not ( = ?auto_895247 ?auto_895248 ) ) ( not ( = ?auto_895247 ?auto_895249 ) ) ( not ( = ?auto_895247 ?auto_895250 ) ) ( not ( = ?auto_895247 ?auto_895251 ) ) ( not ( = ?auto_895247 ?auto_895252 ) ) ( not ( = ?auto_895247 ?auto_895253 ) ) ( not ( = ?auto_895248 ?auto_895249 ) ) ( not ( = ?auto_895248 ?auto_895250 ) ) ( not ( = ?auto_895248 ?auto_895251 ) ) ( not ( = ?auto_895248 ?auto_895252 ) ) ( not ( = ?auto_895248 ?auto_895253 ) ) ( not ( = ?auto_895249 ?auto_895250 ) ) ( not ( = ?auto_895249 ?auto_895251 ) ) ( not ( = ?auto_895249 ?auto_895252 ) ) ( not ( = ?auto_895249 ?auto_895253 ) ) ( not ( = ?auto_895250 ?auto_895251 ) ) ( not ( = ?auto_895250 ?auto_895252 ) ) ( not ( = ?auto_895250 ?auto_895253 ) ) ( not ( = ?auto_895251 ?auto_895252 ) ) ( not ( = ?auto_895251 ?auto_895253 ) ) ( not ( = ?auto_895252 ?auto_895253 ) ) ( ON ?auto_895251 ?auto_895252 ) ( ON ?auto_895250 ?auto_895251 ) ( ON ?auto_895249 ?auto_895250 ) ( ON ?auto_895248 ?auto_895249 ) ( ON ?auto_895247 ?auto_895248 ) ( ON ?auto_895246 ?auto_895247 ) ( ON ?auto_895245 ?auto_895246 ) ( ON ?auto_895244 ?auto_895245 ) ( ON ?auto_895243 ?auto_895244 ) ( ON ?auto_895242 ?auto_895243 ) ( ON ?auto_895241 ?auto_895242 ) ( CLEAR ?auto_895239 ) ( ON ?auto_895240 ?auto_895241 ) ( CLEAR ?auto_895240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_895237 ?auto_895238 ?auto_895239 ?auto_895240 )
      ( MAKE-16PILE ?auto_895237 ?auto_895238 ?auto_895239 ?auto_895240 ?auto_895241 ?auto_895242 ?auto_895243 ?auto_895244 ?auto_895245 ?auto_895246 ?auto_895247 ?auto_895248 ?auto_895249 ?auto_895250 ?auto_895251 ?auto_895252 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_895303 - BLOCK
      ?auto_895304 - BLOCK
      ?auto_895305 - BLOCK
      ?auto_895306 - BLOCK
      ?auto_895307 - BLOCK
      ?auto_895308 - BLOCK
      ?auto_895309 - BLOCK
      ?auto_895310 - BLOCK
      ?auto_895311 - BLOCK
      ?auto_895312 - BLOCK
      ?auto_895313 - BLOCK
      ?auto_895314 - BLOCK
      ?auto_895315 - BLOCK
      ?auto_895316 - BLOCK
      ?auto_895317 - BLOCK
      ?auto_895318 - BLOCK
    )
    :vars
    (
      ?auto_895319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895318 ?auto_895319 ) ( ON-TABLE ?auto_895303 ) ( ON ?auto_895304 ?auto_895303 ) ( not ( = ?auto_895303 ?auto_895304 ) ) ( not ( = ?auto_895303 ?auto_895305 ) ) ( not ( = ?auto_895303 ?auto_895306 ) ) ( not ( = ?auto_895303 ?auto_895307 ) ) ( not ( = ?auto_895303 ?auto_895308 ) ) ( not ( = ?auto_895303 ?auto_895309 ) ) ( not ( = ?auto_895303 ?auto_895310 ) ) ( not ( = ?auto_895303 ?auto_895311 ) ) ( not ( = ?auto_895303 ?auto_895312 ) ) ( not ( = ?auto_895303 ?auto_895313 ) ) ( not ( = ?auto_895303 ?auto_895314 ) ) ( not ( = ?auto_895303 ?auto_895315 ) ) ( not ( = ?auto_895303 ?auto_895316 ) ) ( not ( = ?auto_895303 ?auto_895317 ) ) ( not ( = ?auto_895303 ?auto_895318 ) ) ( not ( = ?auto_895303 ?auto_895319 ) ) ( not ( = ?auto_895304 ?auto_895305 ) ) ( not ( = ?auto_895304 ?auto_895306 ) ) ( not ( = ?auto_895304 ?auto_895307 ) ) ( not ( = ?auto_895304 ?auto_895308 ) ) ( not ( = ?auto_895304 ?auto_895309 ) ) ( not ( = ?auto_895304 ?auto_895310 ) ) ( not ( = ?auto_895304 ?auto_895311 ) ) ( not ( = ?auto_895304 ?auto_895312 ) ) ( not ( = ?auto_895304 ?auto_895313 ) ) ( not ( = ?auto_895304 ?auto_895314 ) ) ( not ( = ?auto_895304 ?auto_895315 ) ) ( not ( = ?auto_895304 ?auto_895316 ) ) ( not ( = ?auto_895304 ?auto_895317 ) ) ( not ( = ?auto_895304 ?auto_895318 ) ) ( not ( = ?auto_895304 ?auto_895319 ) ) ( not ( = ?auto_895305 ?auto_895306 ) ) ( not ( = ?auto_895305 ?auto_895307 ) ) ( not ( = ?auto_895305 ?auto_895308 ) ) ( not ( = ?auto_895305 ?auto_895309 ) ) ( not ( = ?auto_895305 ?auto_895310 ) ) ( not ( = ?auto_895305 ?auto_895311 ) ) ( not ( = ?auto_895305 ?auto_895312 ) ) ( not ( = ?auto_895305 ?auto_895313 ) ) ( not ( = ?auto_895305 ?auto_895314 ) ) ( not ( = ?auto_895305 ?auto_895315 ) ) ( not ( = ?auto_895305 ?auto_895316 ) ) ( not ( = ?auto_895305 ?auto_895317 ) ) ( not ( = ?auto_895305 ?auto_895318 ) ) ( not ( = ?auto_895305 ?auto_895319 ) ) ( not ( = ?auto_895306 ?auto_895307 ) ) ( not ( = ?auto_895306 ?auto_895308 ) ) ( not ( = ?auto_895306 ?auto_895309 ) ) ( not ( = ?auto_895306 ?auto_895310 ) ) ( not ( = ?auto_895306 ?auto_895311 ) ) ( not ( = ?auto_895306 ?auto_895312 ) ) ( not ( = ?auto_895306 ?auto_895313 ) ) ( not ( = ?auto_895306 ?auto_895314 ) ) ( not ( = ?auto_895306 ?auto_895315 ) ) ( not ( = ?auto_895306 ?auto_895316 ) ) ( not ( = ?auto_895306 ?auto_895317 ) ) ( not ( = ?auto_895306 ?auto_895318 ) ) ( not ( = ?auto_895306 ?auto_895319 ) ) ( not ( = ?auto_895307 ?auto_895308 ) ) ( not ( = ?auto_895307 ?auto_895309 ) ) ( not ( = ?auto_895307 ?auto_895310 ) ) ( not ( = ?auto_895307 ?auto_895311 ) ) ( not ( = ?auto_895307 ?auto_895312 ) ) ( not ( = ?auto_895307 ?auto_895313 ) ) ( not ( = ?auto_895307 ?auto_895314 ) ) ( not ( = ?auto_895307 ?auto_895315 ) ) ( not ( = ?auto_895307 ?auto_895316 ) ) ( not ( = ?auto_895307 ?auto_895317 ) ) ( not ( = ?auto_895307 ?auto_895318 ) ) ( not ( = ?auto_895307 ?auto_895319 ) ) ( not ( = ?auto_895308 ?auto_895309 ) ) ( not ( = ?auto_895308 ?auto_895310 ) ) ( not ( = ?auto_895308 ?auto_895311 ) ) ( not ( = ?auto_895308 ?auto_895312 ) ) ( not ( = ?auto_895308 ?auto_895313 ) ) ( not ( = ?auto_895308 ?auto_895314 ) ) ( not ( = ?auto_895308 ?auto_895315 ) ) ( not ( = ?auto_895308 ?auto_895316 ) ) ( not ( = ?auto_895308 ?auto_895317 ) ) ( not ( = ?auto_895308 ?auto_895318 ) ) ( not ( = ?auto_895308 ?auto_895319 ) ) ( not ( = ?auto_895309 ?auto_895310 ) ) ( not ( = ?auto_895309 ?auto_895311 ) ) ( not ( = ?auto_895309 ?auto_895312 ) ) ( not ( = ?auto_895309 ?auto_895313 ) ) ( not ( = ?auto_895309 ?auto_895314 ) ) ( not ( = ?auto_895309 ?auto_895315 ) ) ( not ( = ?auto_895309 ?auto_895316 ) ) ( not ( = ?auto_895309 ?auto_895317 ) ) ( not ( = ?auto_895309 ?auto_895318 ) ) ( not ( = ?auto_895309 ?auto_895319 ) ) ( not ( = ?auto_895310 ?auto_895311 ) ) ( not ( = ?auto_895310 ?auto_895312 ) ) ( not ( = ?auto_895310 ?auto_895313 ) ) ( not ( = ?auto_895310 ?auto_895314 ) ) ( not ( = ?auto_895310 ?auto_895315 ) ) ( not ( = ?auto_895310 ?auto_895316 ) ) ( not ( = ?auto_895310 ?auto_895317 ) ) ( not ( = ?auto_895310 ?auto_895318 ) ) ( not ( = ?auto_895310 ?auto_895319 ) ) ( not ( = ?auto_895311 ?auto_895312 ) ) ( not ( = ?auto_895311 ?auto_895313 ) ) ( not ( = ?auto_895311 ?auto_895314 ) ) ( not ( = ?auto_895311 ?auto_895315 ) ) ( not ( = ?auto_895311 ?auto_895316 ) ) ( not ( = ?auto_895311 ?auto_895317 ) ) ( not ( = ?auto_895311 ?auto_895318 ) ) ( not ( = ?auto_895311 ?auto_895319 ) ) ( not ( = ?auto_895312 ?auto_895313 ) ) ( not ( = ?auto_895312 ?auto_895314 ) ) ( not ( = ?auto_895312 ?auto_895315 ) ) ( not ( = ?auto_895312 ?auto_895316 ) ) ( not ( = ?auto_895312 ?auto_895317 ) ) ( not ( = ?auto_895312 ?auto_895318 ) ) ( not ( = ?auto_895312 ?auto_895319 ) ) ( not ( = ?auto_895313 ?auto_895314 ) ) ( not ( = ?auto_895313 ?auto_895315 ) ) ( not ( = ?auto_895313 ?auto_895316 ) ) ( not ( = ?auto_895313 ?auto_895317 ) ) ( not ( = ?auto_895313 ?auto_895318 ) ) ( not ( = ?auto_895313 ?auto_895319 ) ) ( not ( = ?auto_895314 ?auto_895315 ) ) ( not ( = ?auto_895314 ?auto_895316 ) ) ( not ( = ?auto_895314 ?auto_895317 ) ) ( not ( = ?auto_895314 ?auto_895318 ) ) ( not ( = ?auto_895314 ?auto_895319 ) ) ( not ( = ?auto_895315 ?auto_895316 ) ) ( not ( = ?auto_895315 ?auto_895317 ) ) ( not ( = ?auto_895315 ?auto_895318 ) ) ( not ( = ?auto_895315 ?auto_895319 ) ) ( not ( = ?auto_895316 ?auto_895317 ) ) ( not ( = ?auto_895316 ?auto_895318 ) ) ( not ( = ?auto_895316 ?auto_895319 ) ) ( not ( = ?auto_895317 ?auto_895318 ) ) ( not ( = ?auto_895317 ?auto_895319 ) ) ( not ( = ?auto_895318 ?auto_895319 ) ) ( ON ?auto_895317 ?auto_895318 ) ( ON ?auto_895316 ?auto_895317 ) ( ON ?auto_895315 ?auto_895316 ) ( ON ?auto_895314 ?auto_895315 ) ( ON ?auto_895313 ?auto_895314 ) ( ON ?auto_895312 ?auto_895313 ) ( ON ?auto_895311 ?auto_895312 ) ( ON ?auto_895310 ?auto_895311 ) ( ON ?auto_895309 ?auto_895310 ) ( ON ?auto_895308 ?auto_895309 ) ( ON ?auto_895307 ?auto_895308 ) ( ON ?auto_895306 ?auto_895307 ) ( CLEAR ?auto_895304 ) ( ON ?auto_895305 ?auto_895306 ) ( CLEAR ?auto_895305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_895303 ?auto_895304 ?auto_895305 )
      ( MAKE-16PILE ?auto_895303 ?auto_895304 ?auto_895305 ?auto_895306 ?auto_895307 ?auto_895308 ?auto_895309 ?auto_895310 ?auto_895311 ?auto_895312 ?auto_895313 ?auto_895314 ?auto_895315 ?auto_895316 ?auto_895317 ?auto_895318 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_895369 - BLOCK
      ?auto_895370 - BLOCK
      ?auto_895371 - BLOCK
      ?auto_895372 - BLOCK
      ?auto_895373 - BLOCK
      ?auto_895374 - BLOCK
      ?auto_895375 - BLOCK
      ?auto_895376 - BLOCK
      ?auto_895377 - BLOCK
      ?auto_895378 - BLOCK
      ?auto_895379 - BLOCK
      ?auto_895380 - BLOCK
      ?auto_895381 - BLOCK
      ?auto_895382 - BLOCK
      ?auto_895383 - BLOCK
      ?auto_895384 - BLOCK
    )
    :vars
    (
      ?auto_895385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895384 ?auto_895385 ) ( ON-TABLE ?auto_895369 ) ( not ( = ?auto_895369 ?auto_895370 ) ) ( not ( = ?auto_895369 ?auto_895371 ) ) ( not ( = ?auto_895369 ?auto_895372 ) ) ( not ( = ?auto_895369 ?auto_895373 ) ) ( not ( = ?auto_895369 ?auto_895374 ) ) ( not ( = ?auto_895369 ?auto_895375 ) ) ( not ( = ?auto_895369 ?auto_895376 ) ) ( not ( = ?auto_895369 ?auto_895377 ) ) ( not ( = ?auto_895369 ?auto_895378 ) ) ( not ( = ?auto_895369 ?auto_895379 ) ) ( not ( = ?auto_895369 ?auto_895380 ) ) ( not ( = ?auto_895369 ?auto_895381 ) ) ( not ( = ?auto_895369 ?auto_895382 ) ) ( not ( = ?auto_895369 ?auto_895383 ) ) ( not ( = ?auto_895369 ?auto_895384 ) ) ( not ( = ?auto_895369 ?auto_895385 ) ) ( not ( = ?auto_895370 ?auto_895371 ) ) ( not ( = ?auto_895370 ?auto_895372 ) ) ( not ( = ?auto_895370 ?auto_895373 ) ) ( not ( = ?auto_895370 ?auto_895374 ) ) ( not ( = ?auto_895370 ?auto_895375 ) ) ( not ( = ?auto_895370 ?auto_895376 ) ) ( not ( = ?auto_895370 ?auto_895377 ) ) ( not ( = ?auto_895370 ?auto_895378 ) ) ( not ( = ?auto_895370 ?auto_895379 ) ) ( not ( = ?auto_895370 ?auto_895380 ) ) ( not ( = ?auto_895370 ?auto_895381 ) ) ( not ( = ?auto_895370 ?auto_895382 ) ) ( not ( = ?auto_895370 ?auto_895383 ) ) ( not ( = ?auto_895370 ?auto_895384 ) ) ( not ( = ?auto_895370 ?auto_895385 ) ) ( not ( = ?auto_895371 ?auto_895372 ) ) ( not ( = ?auto_895371 ?auto_895373 ) ) ( not ( = ?auto_895371 ?auto_895374 ) ) ( not ( = ?auto_895371 ?auto_895375 ) ) ( not ( = ?auto_895371 ?auto_895376 ) ) ( not ( = ?auto_895371 ?auto_895377 ) ) ( not ( = ?auto_895371 ?auto_895378 ) ) ( not ( = ?auto_895371 ?auto_895379 ) ) ( not ( = ?auto_895371 ?auto_895380 ) ) ( not ( = ?auto_895371 ?auto_895381 ) ) ( not ( = ?auto_895371 ?auto_895382 ) ) ( not ( = ?auto_895371 ?auto_895383 ) ) ( not ( = ?auto_895371 ?auto_895384 ) ) ( not ( = ?auto_895371 ?auto_895385 ) ) ( not ( = ?auto_895372 ?auto_895373 ) ) ( not ( = ?auto_895372 ?auto_895374 ) ) ( not ( = ?auto_895372 ?auto_895375 ) ) ( not ( = ?auto_895372 ?auto_895376 ) ) ( not ( = ?auto_895372 ?auto_895377 ) ) ( not ( = ?auto_895372 ?auto_895378 ) ) ( not ( = ?auto_895372 ?auto_895379 ) ) ( not ( = ?auto_895372 ?auto_895380 ) ) ( not ( = ?auto_895372 ?auto_895381 ) ) ( not ( = ?auto_895372 ?auto_895382 ) ) ( not ( = ?auto_895372 ?auto_895383 ) ) ( not ( = ?auto_895372 ?auto_895384 ) ) ( not ( = ?auto_895372 ?auto_895385 ) ) ( not ( = ?auto_895373 ?auto_895374 ) ) ( not ( = ?auto_895373 ?auto_895375 ) ) ( not ( = ?auto_895373 ?auto_895376 ) ) ( not ( = ?auto_895373 ?auto_895377 ) ) ( not ( = ?auto_895373 ?auto_895378 ) ) ( not ( = ?auto_895373 ?auto_895379 ) ) ( not ( = ?auto_895373 ?auto_895380 ) ) ( not ( = ?auto_895373 ?auto_895381 ) ) ( not ( = ?auto_895373 ?auto_895382 ) ) ( not ( = ?auto_895373 ?auto_895383 ) ) ( not ( = ?auto_895373 ?auto_895384 ) ) ( not ( = ?auto_895373 ?auto_895385 ) ) ( not ( = ?auto_895374 ?auto_895375 ) ) ( not ( = ?auto_895374 ?auto_895376 ) ) ( not ( = ?auto_895374 ?auto_895377 ) ) ( not ( = ?auto_895374 ?auto_895378 ) ) ( not ( = ?auto_895374 ?auto_895379 ) ) ( not ( = ?auto_895374 ?auto_895380 ) ) ( not ( = ?auto_895374 ?auto_895381 ) ) ( not ( = ?auto_895374 ?auto_895382 ) ) ( not ( = ?auto_895374 ?auto_895383 ) ) ( not ( = ?auto_895374 ?auto_895384 ) ) ( not ( = ?auto_895374 ?auto_895385 ) ) ( not ( = ?auto_895375 ?auto_895376 ) ) ( not ( = ?auto_895375 ?auto_895377 ) ) ( not ( = ?auto_895375 ?auto_895378 ) ) ( not ( = ?auto_895375 ?auto_895379 ) ) ( not ( = ?auto_895375 ?auto_895380 ) ) ( not ( = ?auto_895375 ?auto_895381 ) ) ( not ( = ?auto_895375 ?auto_895382 ) ) ( not ( = ?auto_895375 ?auto_895383 ) ) ( not ( = ?auto_895375 ?auto_895384 ) ) ( not ( = ?auto_895375 ?auto_895385 ) ) ( not ( = ?auto_895376 ?auto_895377 ) ) ( not ( = ?auto_895376 ?auto_895378 ) ) ( not ( = ?auto_895376 ?auto_895379 ) ) ( not ( = ?auto_895376 ?auto_895380 ) ) ( not ( = ?auto_895376 ?auto_895381 ) ) ( not ( = ?auto_895376 ?auto_895382 ) ) ( not ( = ?auto_895376 ?auto_895383 ) ) ( not ( = ?auto_895376 ?auto_895384 ) ) ( not ( = ?auto_895376 ?auto_895385 ) ) ( not ( = ?auto_895377 ?auto_895378 ) ) ( not ( = ?auto_895377 ?auto_895379 ) ) ( not ( = ?auto_895377 ?auto_895380 ) ) ( not ( = ?auto_895377 ?auto_895381 ) ) ( not ( = ?auto_895377 ?auto_895382 ) ) ( not ( = ?auto_895377 ?auto_895383 ) ) ( not ( = ?auto_895377 ?auto_895384 ) ) ( not ( = ?auto_895377 ?auto_895385 ) ) ( not ( = ?auto_895378 ?auto_895379 ) ) ( not ( = ?auto_895378 ?auto_895380 ) ) ( not ( = ?auto_895378 ?auto_895381 ) ) ( not ( = ?auto_895378 ?auto_895382 ) ) ( not ( = ?auto_895378 ?auto_895383 ) ) ( not ( = ?auto_895378 ?auto_895384 ) ) ( not ( = ?auto_895378 ?auto_895385 ) ) ( not ( = ?auto_895379 ?auto_895380 ) ) ( not ( = ?auto_895379 ?auto_895381 ) ) ( not ( = ?auto_895379 ?auto_895382 ) ) ( not ( = ?auto_895379 ?auto_895383 ) ) ( not ( = ?auto_895379 ?auto_895384 ) ) ( not ( = ?auto_895379 ?auto_895385 ) ) ( not ( = ?auto_895380 ?auto_895381 ) ) ( not ( = ?auto_895380 ?auto_895382 ) ) ( not ( = ?auto_895380 ?auto_895383 ) ) ( not ( = ?auto_895380 ?auto_895384 ) ) ( not ( = ?auto_895380 ?auto_895385 ) ) ( not ( = ?auto_895381 ?auto_895382 ) ) ( not ( = ?auto_895381 ?auto_895383 ) ) ( not ( = ?auto_895381 ?auto_895384 ) ) ( not ( = ?auto_895381 ?auto_895385 ) ) ( not ( = ?auto_895382 ?auto_895383 ) ) ( not ( = ?auto_895382 ?auto_895384 ) ) ( not ( = ?auto_895382 ?auto_895385 ) ) ( not ( = ?auto_895383 ?auto_895384 ) ) ( not ( = ?auto_895383 ?auto_895385 ) ) ( not ( = ?auto_895384 ?auto_895385 ) ) ( ON ?auto_895383 ?auto_895384 ) ( ON ?auto_895382 ?auto_895383 ) ( ON ?auto_895381 ?auto_895382 ) ( ON ?auto_895380 ?auto_895381 ) ( ON ?auto_895379 ?auto_895380 ) ( ON ?auto_895378 ?auto_895379 ) ( ON ?auto_895377 ?auto_895378 ) ( ON ?auto_895376 ?auto_895377 ) ( ON ?auto_895375 ?auto_895376 ) ( ON ?auto_895374 ?auto_895375 ) ( ON ?auto_895373 ?auto_895374 ) ( ON ?auto_895372 ?auto_895373 ) ( ON ?auto_895371 ?auto_895372 ) ( CLEAR ?auto_895369 ) ( ON ?auto_895370 ?auto_895371 ) ( CLEAR ?auto_895370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_895369 ?auto_895370 )
      ( MAKE-16PILE ?auto_895369 ?auto_895370 ?auto_895371 ?auto_895372 ?auto_895373 ?auto_895374 ?auto_895375 ?auto_895376 ?auto_895377 ?auto_895378 ?auto_895379 ?auto_895380 ?auto_895381 ?auto_895382 ?auto_895383 ?auto_895384 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_895435 - BLOCK
      ?auto_895436 - BLOCK
      ?auto_895437 - BLOCK
      ?auto_895438 - BLOCK
      ?auto_895439 - BLOCK
      ?auto_895440 - BLOCK
      ?auto_895441 - BLOCK
      ?auto_895442 - BLOCK
      ?auto_895443 - BLOCK
      ?auto_895444 - BLOCK
      ?auto_895445 - BLOCK
      ?auto_895446 - BLOCK
      ?auto_895447 - BLOCK
      ?auto_895448 - BLOCK
      ?auto_895449 - BLOCK
      ?auto_895450 - BLOCK
    )
    :vars
    (
      ?auto_895451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895450 ?auto_895451 ) ( not ( = ?auto_895435 ?auto_895436 ) ) ( not ( = ?auto_895435 ?auto_895437 ) ) ( not ( = ?auto_895435 ?auto_895438 ) ) ( not ( = ?auto_895435 ?auto_895439 ) ) ( not ( = ?auto_895435 ?auto_895440 ) ) ( not ( = ?auto_895435 ?auto_895441 ) ) ( not ( = ?auto_895435 ?auto_895442 ) ) ( not ( = ?auto_895435 ?auto_895443 ) ) ( not ( = ?auto_895435 ?auto_895444 ) ) ( not ( = ?auto_895435 ?auto_895445 ) ) ( not ( = ?auto_895435 ?auto_895446 ) ) ( not ( = ?auto_895435 ?auto_895447 ) ) ( not ( = ?auto_895435 ?auto_895448 ) ) ( not ( = ?auto_895435 ?auto_895449 ) ) ( not ( = ?auto_895435 ?auto_895450 ) ) ( not ( = ?auto_895435 ?auto_895451 ) ) ( not ( = ?auto_895436 ?auto_895437 ) ) ( not ( = ?auto_895436 ?auto_895438 ) ) ( not ( = ?auto_895436 ?auto_895439 ) ) ( not ( = ?auto_895436 ?auto_895440 ) ) ( not ( = ?auto_895436 ?auto_895441 ) ) ( not ( = ?auto_895436 ?auto_895442 ) ) ( not ( = ?auto_895436 ?auto_895443 ) ) ( not ( = ?auto_895436 ?auto_895444 ) ) ( not ( = ?auto_895436 ?auto_895445 ) ) ( not ( = ?auto_895436 ?auto_895446 ) ) ( not ( = ?auto_895436 ?auto_895447 ) ) ( not ( = ?auto_895436 ?auto_895448 ) ) ( not ( = ?auto_895436 ?auto_895449 ) ) ( not ( = ?auto_895436 ?auto_895450 ) ) ( not ( = ?auto_895436 ?auto_895451 ) ) ( not ( = ?auto_895437 ?auto_895438 ) ) ( not ( = ?auto_895437 ?auto_895439 ) ) ( not ( = ?auto_895437 ?auto_895440 ) ) ( not ( = ?auto_895437 ?auto_895441 ) ) ( not ( = ?auto_895437 ?auto_895442 ) ) ( not ( = ?auto_895437 ?auto_895443 ) ) ( not ( = ?auto_895437 ?auto_895444 ) ) ( not ( = ?auto_895437 ?auto_895445 ) ) ( not ( = ?auto_895437 ?auto_895446 ) ) ( not ( = ?auto_895437 ?auto_895447 ) ) ( not ( = ?auto_895437 ?auto_895448 ) ) ( not ( = ?auto_895437 ?auto_895449 ) ) ( not ( = ?auto_895437 ?auto_895450 ) ) ( not ( = ?auto_895437 ?auto_895451 ) ) ( not ( = ?auto_895438 ?auto_895439 ) ) ( not ( = ?auto_895438 ?auto_895440 ) ) ( not ( = ?auto_895438 ?auto_895441 ) ) ( not ( = ?auto_895438 ?auto_895442 ) ) ( not ( = ?auto_895438 ?auto_895443 ) ) ( not ( = ?auto_895438 ?auto_895444 ) ) ( not ( = ?auto_895438 ?auto_895445 ) ) ( not ( = ?auto_895438 ?auto_895446 ) ) ( not ( = ?auto_895438 ?auto_895447 ) ) ( not ( = ?auto_895438 ?auto_895448 ) ) ( not ( = ?auto_895438 ?auto_895449 ) ) ( not ( = ?auto_895438 ?auto_895450 ) ) ( not ( = ?auto_895438 ?auto_895451 ) ) ( not ( = ?auto_895439 ?auto_895440 ) ) ( not ( = ?auto_895439 ?auto_895441 ) ) ( not ( = ?auto_895439 ?auto_895442 ) ) ( not ( = ?auto_895439 ?auto_895443 ) ) ( not ( = ?auto_895439 ?auto_895444 ) ) ( not ( = ?auto_895439 ?auto_895445 ) ) ( not ( = ?auto_895439 ?auto_895446 ) ) ( not ( = ?auto_895439 ?auto_895447 ) ) ( not ( = ?auto_895439 ?auto_895448 ) ) ( not ( = ?auto_895439 ?auto_895449 ) ) ( not ( = ?auto_895439 ?auto_895450 ) ) ( not ( = ?auto_895439 ?auto_895451 ) ) ( not ( = ?auto_895440 ?auto_895441 ) ) ( not ( = ?auto_895440 ?auto_895442 ) ) ( not ( = ?auto_895440 ?auto_895443 ) ) ( not ( = ?auto_895440 ?auto_895444 ) ) ( not ( = ?auto_895440 ?auto_895445 ) ) ( not ( = ?auto_895440 ?auto_895446 ) ) ( not ( = ?auto_895440 ?auto_895447 ) ) ( not ( = ?auto_895440 ?auto_895448 ) ) ( not ( = ?auto_895440 ?auto_895449 ) ) ( not ( = ?auto_895440 ?auto_895450 ) ) ( not ( = ?auto_895440 ?auto_895451 ) ) ( not ( = ?auto_895441 ?auto_895442 ) ) ( not ( = ?auto_895441 ?auto_895443 ) ) ( not ( = ?auto_895441 ?auto_895444 ) ) ( not ( = ?auto_895441 ?auto_895445 ) ) ( not ( = ?auto_895441 ?auto_895446 ) ) ( not ( = ?auto_895441 ?auto_895447 ) ) ( not ( = ?auto_895441 ?auto_895448 ) ) ( not ( = ?auto_895441 ?auto_895449 ) ) ( not ( = ?auto_895441 ?auto_895450 ) ) ( not ( = ?auto_895441 ?auto_895451 ) ) ( not ( = ?auto_895442 ?auto_895443 ) ) ( not ( = ?auto_895442 ?auto_895444 ) ) ( not ( = ?auto_895442 ?auto_895445 ) ) ( not ( = ?auto_895442 ?auto_895446 ) ) ( not ( = ?auto_895442 ?auto_895447 ) ) ( not ( = ?auto_895442 ?auto_895448 ) ) ( not ( = ?auto_895442 ?auto_895449 ) ) ( not ( = ?auto_895442 ?auto_895450 ) ) ( not ( = ?auto_895442 ?auto_895451 ) ) ( not ( = ?auto_895443 ?auto_895444 ) ) ( not ( = ?auto_895443 ?auto_895445 ) ) ( not ( = ?auto_895443 ?auto_895446 ) ) ( not ( = ?auto_895443 ?auto_895447 ) ) ( not ( = ?auto_895443 ?auto_895448 ) ) ( not ( = ?auto_895443 ?auto_895449 ) ) ( not ( = ?auto_895443 ?auto_895450 ) ) ( not ( = ?auto_895443 ?auto_895451 ) ) ( not ( = ?auto_895444 ?auto_895445 ) ) ( not ( = ?auto_895444 ?auto_895446 ) ) ( not ( = ?auto_895444 ?auto_895447 ) ) ( not ( = ?auto_895444 ?auto_895448 ) ) ( not ( = ?auto_895444 ?auto_895449 ) ) ( not ( = ?auto_895444 ?auto_895450 ) ) ( not ( = ?auto_895444 ?auto_895451 ) ) ( not ( = ?auto_895445 ?auto_895446 ) ) ( not ( = ?auto_895445 ?auto_895447 ) ) ( not ( = ?auto_895445 ?auto_895448 ) ) ( not ( = ?auto_895445 ?auto_895449 ) ) ( not ( = ?auto_895445 ?auto_895450 ) ) ( not ( = ?auto_895445 ?auto_895451 ) ) ( not ( = ?auto_895446 ?auto_895447 ) ) ( not ( = ?auto_895446 ?auto_895448 ) ) ( not ( = ?auto_895446 ?auto_895449 ) ) ( not ( = ?auto_895446 ?auto_895450 ) ) ( not ( = ?auto_895446 ?auto_895451 ) ) ( not ( = ?auto_895447 ?auto_895448 ) ) ( not ( = ?auto_895447 ?auto_895449 ) ) ( not ( = ?auto_895447 ?auto_895450 ) ) ( not ( = ?auto_895447 ?auto_895451 ) ) ( not ( = ?auto_895448 ?auto_895449 ) ) ( not ( = ?auto_895448 ?auto_895450 ) ) ( not ( = ?auto_895448 ?auto_895451 ) ) ( not ( = ?auto_895449 ?auto_895450 ) ) ( not ( = ?auto_895449 ?auto_895451 ) ) ( not ( = ?auto_895450 ?auto_895451 ) ) ( ON ?auto_895449 ?auto_895450 ) ( ON ?auto_895448 ?auto_895449 ) ( ON ?auto_895447 ?auto_895448 ) ( ON ?auto_895446 ?auto_895447 ) ( ON ?auto_895445 ?auto_895446 ) ( ON ?auto_895444 ?auto_895445 ) ( ON ?auto_895443 ?auto_895444 ) ( ON ?auto_895442 ?auto_895443 ) ( ON ?auto_895441 ?auto_895442 ) ( ON ?auto_895440 ?auto_895441 ) ( ON ?auto_895439 ?auto_895440 ) ( ON ?auto_895438 ?auto_895439 ) ( ON ?auto_895437 ?auto_895438 ) ( ON ?auto_895436 ?auto_895437 ) ( ON ?auto_895435 ?auto_895436 ) ( CLEAR ?auto_895435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_895435 )
      ( MAKE-16PILE ?auto_895435 ?auto_895436 ?auto_895437 ?auto_895438 ?auto_895439 ?auto_895440 ?auto_895441 ?auto_895442 ?auto_895443 ?auto_895444 ?auto_895445 ?auto_895446 ?auto_895447 ?auto_895448 ?auto_895449 ?auto_895450 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895502 - BLOCK
      ?auto_895503 - BLOCK
      ?auto_895504 - BLOCK
      ?auto_895505 - BLOCK
      ?auto_895506 - BLOCK
      ?auto_895507 - BLOCK
      ?auto_895508 - BLOCK
      ?auto_895509 - BLOCK
      ?auto_895510 - BLOCK
      ?auto_895511 - BLOCK
      ?auto_895512 - BLOCK
      ?auto_895513 - BLOCK
      ?auto_895514 - BLOCK
      ?auto_895515 - BLOCK
      ?auto_895516 - BLOCK
      ?auto_895517 - BLOCK
      ?auto_895518 - BLOCK
    )
    :vars
    (
      ?auto_895519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_895517 ) ( ON ?auto_895518 ?auto_895519 ) ( CLEAR ?auto_895518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_895502 ) ( ON ?auto_895503 ?auto_895502 ) ( ON ?auto_895504 ?auto_895503 ) ( ON ?auto_895505 ?auto_895504 ) ( ON ?auto_895506 ?auto_895505 ) ( ON ?auto_895507 ?auto_895506 ) ( ON ?auto_895508 ?auto_895507 ) ( ON ?auto_895509 ?auto_895508 ) ( ON ?auto_895510 ?auto_895509 ) ( ON ?auto_895511 ?auto_895510 ) ( ON ?auto_895512 ?auto_895511 ) ( ON ?auto_895513 ?auto_895512 ) ( ON ?auto_895514 ?auto_895513 ) ( ON ?auto_895515 ?auto_895514 ) ( ON ?auto_895516 ?auto_895515 ) ( ON ?auto_895517 ?auto_895516 ) ( not ( = ?auto_895502 ?auto_895503 ) ) ( not ( = ?auto_895502 ?auto_895504 ) ) ( not ( = ?auto_895502 ?auto_895505 ) ) ( not ( = ?auto_895502 ?auto_895506 ) ) ( not ( = ?auto_895502 ?auto_895507 ) ) ( not ( = ?auto_895502 ?auto_895508 ) ) ( not ( = ?auto_895502 ?auto_895509 ) ) ( not ( = ?auto_895502 ?auto_895510 ) ) ( not ( = ?auto_895502 ?auto_895511 ) ) ( not ( = ?auto_895502 ?auto_895512 ) ) ( not ( = ?auto_895502 ?auto_895513 ) ) ( not ( = ?auto_895502 ?auto_895514 ) ) ( not ( = ?auto_895502 ?auto_895515 ) ) ( not ( = ?auto_895502 ?auto_895516 ) ) ( not ( = ?auto_895502 ?auto_895517 ) ) ( not ( = ?auto_895502 ?auto_895518 ) ) ( not ( = ?auto_895502 ?auto_895519 ) ) ( not ( = ?auto_895503 ?auto_895504 ) ) ( not ( = ?auto_895503 ?auto_895505 ) ) ( not ( = ?auto_895503 ?auto_895506 ) ) ( not ( = ?auto_895503 ?auto_895507 ) ) ( not ( = ?auto_895503 ?auto_895508 ) ) ( not ( = ?auto_895503 ?auto_895509 ) ) ( not ( = ?auto_895503 ?auto_895510 ) ) ( not ( = ?auto_895503 ?auto_895511 ) ) ( not ( = ?auto_895503 ?auto_895512 ) ) ( not ( = ?auto_895503 ?auto_895513 ) ) ( not ( = ?auto_895503 ?auto_895514 ) ) ( not ( = ?auto_895503 ?auto_895515 ) ) ( not ( = ?auto_895503 ?auto_895516 ) ) ( not ( = ?auto_895503 ?auto_895517 ) ) ( not ( = ?auto_895503 ?auto_895518 ) ) ( not ( = ?auto_895503 ?auto_895519 ) ) ( not ( = ?auto_895504 ?auto_895505 ) ) ( not ( = ?auto_895504 ?auto_895506 ) ) ( not ( = ?auto_895504 ?auto_895507 ) ) ( not ( = ?auto_895504 ?auto_895508 ) ) ( not ( = ?auto_895504 ?auto_895509 ) ) ( not ( = ?auto_895504 ?auto_895510 ) ) ( not ( = ?auto_895504 ?auto_895511 ) ) ( not ( = ?auto_895504 ?auto_895512 ) ) ( not ( = ?auto_895504 ?auto_895513 ) ) ( not ( = ?auto_895504 ?auto_895514 ) ) ( not ( = ?auto_895504 ?auto_895515 ) ) ( not ( = ?auto_895504 ?auto_895516 ) ) ( not ( = ?auto_895504 ?auto_895517 ) ) ( not ( = ?auto_895504 ?auto_895518 ) ) ( not ( = ?auto_895504 ?auto_895519 ) ) ( not ( = ?auto_895505 ?auto_895506 ) ) ( not ( = ?auto_895505 ?auto_895507 ) ) ( not ( = ?auto_895505 ?auto_895508 ) ) ( not ( = ?auto_895505 ?auto_895509 ) ) ( not ( = ?auto_895505 ?auto_895510 ) ) ( not ( = ?auto_895505 ?auto_895511 ) ) ( not ( = ?auto_895505 ?auto_895512 ) ) ( not ( = ?auto_895505 ?auto_895513 ) ) ( not ( = ?auto_895505 ?auto_895514 ) ) ( not ( = ?auto_895505 ?auto_895515 ) ) ( not ( = ?auto_895505 ?auto_895516 ) ) ( not ( = ?auto_895505 ?auto_895517 ) ) ( not ( = ?auto_895505 ?auto_895518 ) ) ( not ( = ?auto_895505 ?auto_895519 ) ) ( not ( = ?auto_895506 ?auto_895507 ) ) ( not ( = ?auto_895506 ?auto_895508 ) ) ( not ( = ?auto_895506 ?auto_895509 ) ) ( not ( = ?auto_895506 ?auto_895510 ) ) ( not ( = ?auto_895506 ?auto_895511 ) ) ( not ( = ?auto_895506 ?auto_895512 ) ) ( not ( = ?auto_895506 ?auto_895513 ) ) ( not ( = ?auto_895506 ?auto_895514 ) ) ( not ( = ?auto_895506 ?auto_895515 ) ) ( not ( = ?auto_895506 ?auto_895516 ) ) ( not ( = ?auto_895506 ?auto_895517 ) ) ( not ( = ?auto_895506 ?auto_895518 ) ) ( not ( = ?auto_895506 ?auto_895519 ) ) ( not ( = ?auto_895507 ?auto_895508 ) ) ( not ( = ?auto_895507 ?auto_895509 ) ) ( not ( = ?auto_895507 ?auto_895510 ) ) ( not ( = ?auto_895507 ?auto_895511 ) ) ( not ( = ?auto_895507 ?auto_895512 ) ) ( not ( = ?auto_895507 ?auto_895513 ) ) ( not ( = ?auto_895507 ?auto_895514 ) ) ( not ( = ?auto_895507 ?auto_895515 ) ) ( not ( = ?auto_895507 ?auto_895516 ) ) ( not ( = ?auto_895507 ?auto_895517 ) ) ( not ( = ?auto_895507 ?auto_895518 ) ) ( not ( = ?auto_895507 ?auto_895519 ) ) ( not ( = ?auto_895508 ?auto_895509 ) ) ( not ( = ?auto_895508 ?auto_895510 ) ) ( not ( = ?auto_895508 ?auto_895511 ) ) ( not ( = ?auto_895508 ?auto_895512 ) ) ( not ( = ?auto_895508 ?auto_895513 ) ) ( not ( = ?auto_895508 ?auto_895514 ) ) ( not ( = ?auto_895508 ?auto_895515 ) ) ( not ( = ?auto_895508 ?auto_895516 ) ) ( not ( = ?auto_895508 ?auto_895517 ) ) ( not ( = ?auto_895508 ?auto_895518 ) ) ( not ( = ?auto_895508 ?auto_895519 ) ) ( not ( = ?auto_895509 ?auto_895510 ) ) ( not ( = ?auto_895509 ?auto_895511 ) ) ( not ( = ?auto_895509 ?auto_895512 ) ) ( not ( = ?auto_895509 ?auto_895513 ) ) ( not ( = ?auto_895509 ?auto_895514 ) ) ( not ( = ?auto_895509 ?auto_895515 ) ) ( not ( = ?auto_895509 ?auto_895516 ) ) ( not ( = ?auto_895509 ?auto_895517 ) ) ( not ( = ?auto_895509 ?auto_895518 ) ) ( not ( = ?auto_895509 ?auto_895519 ) ) ( not ( = ?auto_895510 ?auto_895511 ) ) ( not ( = ?auto_895510 ?auto_895512 ) ) ( not ( = ?auto_895510 ?auto_895513 ) ) ( not ( = ?auto_895510 ?auto_895514 ) ) ( not ( = ?auto_895510 ?auto_895515 ) ) ( not ( = ?auto_895510 ?auto_895516 ) ) ( not ( = ?auto_895510 ?auto_895517 ) ) ( not ( = ?auto_895510 ?auto_895518 ) ) ( not ( = ?auto_895510 ?auto_895519 ) ) ( not ( = ?auto_895511 ?auto_895512 ) ) ( not ( = ?auto_895511 ?auto_895513 ) ) ( not ( = ?auto_895511 ?auto_895514 ) ) ( not ( = ?auto_895511 ?auto_895515 ) ) ( not ( = ?auto_895511 ?auto_895516 ) ) ( not ( = ?auto_895511 ?auto_895517 ) ) ( not ( = ?auto_895511 ?auto_895518 ) ) ( not ( = ?auto_895511 ?auto_895519 ) ) ( not ( = ?auto_895512 ?auto_895513 ) ) ( not ( = ?auto_895512 ?auto_895514 ) ) ( not ( = ?auto_895512 ?auto_895515 ) ) ( not ( = ?auto_895512 ?auto_895516 ) ) ( not ( = ?auto_895512 ?auto_895517 ) ) ( not ( = ?auto_895512 ?auto_895518 ) ) ( not ( = ?auto_895512 ?auto_895519 ) ) ( not ( = ?auto_895513 ?auto_895514 ) ) ( not ( = ?auto_895513 ?auto_895515 ) ) ( not ( = ?auto_895513 ?auto_895516 ) ) ( not ( = ?auto_895513 ?auto_895517 ) ) ( not ( = ?auto_895513 ?auto_895518 ) ) ( not ( = ?auto_895513 ?auto_895519 ) ) ( not ( = ?auto_895514 ?auto_895515 ) ) ( not ( = ?auto_895514 ?auto_895516 ) ) ( not ( = ?auto_895514 ?auto_895517 ) ) ( not ( = ?auto_895514 ?auto_895518 ) ) ( not ( = ?auto_895514 ?auto_895519 ) ) ( not ( = ?auto_895515 ?auto_895516 ) ) ( not ( = ?auto_895515 ?auto_895517 ) ) ( not ( = ?auto_895515 ?auto_895518 ) ) ( not ( = ?auto_895515 ?auto_895519 ) ) ( not ( = ?auto_895516 ?auto_895517 ) ) ( not ( = ?auto_895516 ?auto_895518 ) ) ( not ( = ?auto_895516 ?auto_895519 ) ) ( not ( = ?auto_895517 ?auto_895518 ) ) ( not ( = ?auto_895517 ?auto_895519 ) ) ( not ( = ?auto_895518 ?auto_895519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_895518 ?auto_895519 )
      ( !STACK ?auto_895518 ?auto_895517 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895572 - BLOCK
      ?auto_895573 - BLOCK
      ?auto_895574 - BLOCK
      ?auto_895575 - BLOCK
      ?auto_895576 - BLOCK
      ?auto_895577 - BLOCK
      ?auto_895578 - BLOCK
      ?auto_895579 - BLOCK
      ?auto_895580 - BLOCK
      ?auto_895581 - BLOCK
      ?auto_895582 - BLOCK
      ?auto_895583 - BLOCK
      ?auto_895584 - BLOCK
      ?auto_895585 - BLOCK
      ?auto_895586 - BLOCK
      ?auto_895587 - BLOCK
      ?auto_895588 - BLOCK
    )
    :vars
    (
      ?auto_895589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895588 ?auto_895589 ) ( ON-TABLE ?auto_895572 ) ( ON ?auto_895573 ?auto_895572 ) ( ON ?auto_895574 ?auto_895573 ) ( ON ?auto_895575 ?auto_895574 ) ( ON ?auto_895576 ?auto_895575 ) ( ON ?auto_895577 ?auto_895576 ) ( ON ?auto_895578 ?auto_895577 ) ( ON ?auto_895579 ?auto_895578 ) ( ON ?auto_895580 ?auto_895579 ) ( ON ?auto_895581 ?auto_895580 ) ( ON ?auto_895582 ?auto_895581 ) ( ON ?auto_895583 ?auto_895582 ) ( ON ?auto_895584 ?auto_895583 ) ( ON ?auto_895585 ?auto_895584 ) ( ON ?auto_895586 ?auto_895585 ) ( not ( = ?auto_895572 ?auto_895573 ) ) ( not ( = ?auto_895572 ?auto_895574 ) ) ( not ( = ?auto_895572 ?auto_895575 ) ) ( not ( = ?auto_895572 ?auto_895576 ) ) ( not ( = ?auto_895572 ?auto_895577 ) ) ( not ( = ?auto_895572 ?auto_895578 ) ) ( not ( = ?auto_895572 ?auto_895579 ) ) ( not ( = ?auto_895572 ?auto_895580 ) ) ( not ( = ?auto_895572 ?auto_895581 ) ) ( not ( = ?auto_895572 ?auto_895582 ) ) ( not ( = ?auto_895572 ?auto_895583 ) ) ( not ( = ?auto_895572 ?auto_895584 ) ) ( not ( = ?auto_895572 ?auto_895585 ) ) ( not ( = ?auto_895572 ?auto_895586 ) ) ( not ( = ?auto_895572 ?auto_895587 ) ) ( not ( = ?auto_895572 ?auto_895588 ) ) ( not ( = ?auto_895572 ?auto_895589 ) ) ( not ( = ?auto_895573 ?auto_895574 ) ) ( not ( = ?auto_895573 ?auto_895575 ) ) ( not ( = ?auto_895573 ?auto_895576 ) ) ( not ( = ?auto_895573 ?auto_895577 ) ) ( not ( = ?auto_895573 ?auto_895578 ) ) ( not ( = ?auto_895573 ?auto_895579 ) ) ( not ( = ?auto_895573 ?auto_895580 ) ) ( not ( = ?auto_895573 ?auto_895581 ) ) ( not ( = ?auto_895573 ?auto_895582 ) ) ( not ( = ?auto_895573 ?auto_895583 ) ) ( not ( = ?auto_895573 ?auto_895584 ) ) ( not ( = ?auto_895573 ?auto_895585 ) ) ( not ( = ?auto_895573 ?auto_895586 ) ) ( not ( = ?auto_895573 ?auto_895587 ) ) ( not ( = ?auto_895573 ?auto_895588 ) ) ( not ( = ?auto_895573 ?auto_895589 ) ) ( not ( = ?auto_895574 ?auto_895575 ) ) ( not ( = ?auto_895574 ?auto_895576 ) ) ( not ( = ?auto_895574 ?auto_895577 ) ) ( not ( = ?auto_895574 ?auto_895578 ) ) ( not ( = ?auto_895574 ?auto_895579 ) ) ( not ( = ?auto_895574 ?auto_895580 ) ) ( not ( = ?auto_895574 ?auto_895581 ) ) ( not ( = ?auto_895574 ?auto_895582 ) ) ( not ( = ?auto_895574 ?auto_895583 ) ) ( not ( = ?auto_895574 ?auto_895584 ) ) ( not ( = ?auto_895574 ?auto_895585 ) ) ( not ( = ?auto_895574 ?auto_895586 ) ) ( not ( = ?auto_895574 ?auto_895587 ) ) ( not ( = ?auto_895574 ?auto_895588 ) ) ( not ( = ?auto_895574 ?auto_895589 ) ) ( not ( = ?auto_895575 ?auto_895576 ) ) ( not ( = ?auto_895575 ?auto_895577 ) ) ( not ( = ?auto_895575 ?auto_895578 ) ) ( not ( = ?auto_895575 ?auto_895579 ) ) ( not ( = ?auto_895575 ?auto_895580 ) ) ( not ( = ?auto_895575 ?auto_895581 ) ) ( not ( = ?auto_895575 ?auto_895582 ) ) ( not ( = ?auto_895575 ?auto_895583 ) ) ( not ( = ?auto_895575 ?auto_895584 ) ) ( not ( = ?auto_895575 ?auto_895585 ) ) ( not ( = ?auto_895575 ?auto_895586 ) ) ( not ( = ?auto_895575 ?auto_895587 ) ) ( not ( = ?auto_895575 ?auto_895588 ) ) ( not ( = ?auto_895575 ?auto_895589 ) ) ( not ( = ?auto_895576 ?auto_895577 ) ) ( not ( = ?auto_895576 ?auto_895578 ) ) ( not ( = ?auto_895576 ?auto_895579 ) ) ( not ( = ?auto_895576 ?auto_895580 ) ) ( not ( = ?auto_895576 ?auto_895581 ) ) ( not ( = ?auto_895576 ?auto_895582 ) ) ( not ( = ?auto_895576 ?auto_895583 ) ) ( not ( = ?auto_895576 ?auto_895584 ) ) ( not ( = ?auto_895576 ?auto_895585 ) ) ( not ( = ?auto_895576 ?auto_895586 ) ) ( not ( = ?auto_895576 ?auto_895587 ) ) ( not ( = ?auto_895576 ?auto_895588 ) ) ( not ( = ?auto_895576 ?auto_895589 ) ) ( not ( = ?auto_895577 ?auto_895578 ) ) ( not ( = ?auto_895577 ?auto_895579 ) ) ( not ( = ?auto_895577 ?auto_895580 ) ) ( not ( = ?auto_895577 ?auto_895581 ) ) ( not ( = ?auto_895577 ?auto_895582 ) ) ( not ( = ?auto_895577 ?auto_895583 ) ) ( not ( = ?auto_895577 ?auto_895584 ) ) ( not ( = ?auto_895577 ?auto_895585 ) ) ( not ( = ?auto_895577 ?auto_895586 ) ) ( not ( = ?auto_895577 ?auto_895587 ) ) ( not ( = ?auto_895577 ?auto_895588 ) ) ( not ( = ?auto_895577 ?auto_895589 ) ) ( not ( = ?auto_895578 ?auto_895579 ) ) ( not ( = ?auto_895578 ?auto_895580 ) ) ( not ( = ?auto_895578 ?auto_895581 ) ) ( not ( = ?auto_895578 ?auto_895582 ) ) ( not ( = ?auto_895578 ?auto_895583 ) ) ( not ( = ?auto_895578 ?auto_895584 ) ) ( not ( = ?auto_895578 ?auto_895585 ) ) ( not ( = ?auto_895578 ?auto_895586 ) ) ( not ( = ?auto_895578 ?auto_895587 ) ) ( not ( = ?auto_895578 ?auto_895588 ) ) ( not ( = ?auto_895578 ?auto_895589 ) ) ( not ( = ?auto_895579 ?auto_895580 ) ) ( not ( = ?auto_895579 ?auto_895581 ) ) ( not ( = ?auto_895579 ?auto_895582 ) ) ( not ( = ?auto_895579 ?auto_895583 ) ) ( not ( = ?auto_895579 ?auto_895584 ) ) ( not ( = ?auto_895579 ?auto_895585 ) ) ( not ( = ?auto_895579 ?auto_895586 ) ) ( not ( = ?auto_895579 ?auto_895587 ) ) ( not ( = ?auto_895579 ?auto_895588 ) ) ( not ( = ?auto_895579 ?auto_895589 ) ) ( not ( = ?auto_895580 ?auto_895581 ) ) ( not ( = ?auto_895580 ?auto_895582 ) ) ( not ( = ?auto_895580 ?auto_895583 ) ) ( not ( = ?auto_895580 ?auto_895584 ) ) ( not ( = ?auto_895580 ?auto_895585 ) ) ( not ( = ?auto_895580 ?auto_895586 ) ) ( not ( = ?auto_895580 ?auto_895587 ) ) ( not ( = ?auto_895580 ?auto_895588 ) ) ( not ( = ?auto_895580 ?auto_895589 ) ) ( not ( = ?auto_895581 ?auto_895582 ) ) ( not ( = ?auto_895581 ?auto_895583 ) ) ( not ( = ?auto_895581 ?auto_895584 ) ) ( not ( = ?auto_895581 ?auto_895585 ) ) ( not ( = ?auto_895581 ?auto_895586 ) ) ( not ( = ?auto_895581 ?auto_895587 ) ) ( not ( = ?auto_895581 ?auto_895588 ) ) ( not ( = ?auto_895581 ?auto_895589 ) ) ( not ( = ?auto_895582 ?auto_895583 ) ) ( not ( = ?auto_895582 ?auto_895584 ) ) ( not ( = ?auto_895582 ?auto_895585 ) ) ( not ( = ?auto_895582 ?auto_895586 ) ) ( not ( = ?auto_895582 ?auto_895587 ) ) ( not ( = ?auto_895582 ?auto_895588 ) ) ( not ( = ?auto_895582 ?auto_895589 ) ) ( not ( = ?auto_895583 ?auto_895584 ) ) ( not ( = ?auto_895583 ?auto_895585 ) ) ( not ( = ?auto_895583 ?auto_895586 ) ) ( not ( = ?auto_895583 ?auto_895587 ) ) ( not ( = ?auto_895583 ?auto_895588 ) ) ( not ( = ?auto_895583 ?auto_895589 ) ) ( not ( = ?auto_895584 ?auto_895585 ) ) ( not ( = ?auto_895584 ?auto_895586 ) ) ( not ( = ?auto_895584 ?auto_895587 ) ) ( not ( = ?auto_895584 ?auto_895588 ) ) ( not ( = ?auto_895584 ?auto_895589 ) ) ( not ( = ?auto_895585 ?auto_895586 ) ) ( not ( = ?auto_895585 ?auto_895587 ) ) ( not ( = ?auto_895585 ?auto_895588 ) ) ( not ( = ?auto_895585 ?auto_895589 ) ) ( not ( = ?auto_895586 ?auto_895587 ) ) ( not ( = ?auto_895586 ?auto_895588 ) ) ( not ( = ?auto_895586 ?auto_895589 ) ) ( not ( = ?auto_895587 ?auto_895588 ) ) ( not ( = ?auto_895587 ?auto_895589 ) ) ( not ( = ?auto_895588 ?auto_895589 ) ) ( CLEAR ?auto_895586 ) ( ON ?auto_895587 ?auto_895588 ) ( CLEAR ?auto_895587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_895572 ?auto_895573 ?auto_895574 ?auto_895575 ?auto_895576 ?auto_895577 ?auto_895578 ?auto_895579 ?auto_895580 ?auto_895581 ?auto_895582 ?auto_895583 ?auto_895584 ?auto_895585 ?auto_895586 ?auto_895587 )
      ( MAKE-17PILE ?auto_895572 ?auto_895573 ?auto_895574 ?auto_895575 ?auto_895576 ?auto_895577 ?auto_895578 ?auto_895579 ?auto_895580 ?auto_895581 ?auto_895582 ?auto_895583 ?auto_895584 ?auto_895585 ?auto_895586 ?auto_895587 ?auto_895588 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895642 - BLOCK
      ?auto_895643 - BLOCK
      ?auto_895644 - BLOCK
      ?auto_895645 - BLOCK
      ?auto_895646 - BLOCK
      ?auto_895647 - BLOCK
      ?auto_895648 - BLOCK
      ?auto_895649 - BLOCK
      ?auto_895650 - BLOCK
      ?auto_895651 - BLOCK
      ?auto_895652 - BLOCK
      ?auto_895653 - BLOCK
      ?auto_895654 - BLOCK
      ?auto_895655 - BLOCK
      ?auto_895656 - BLOCK
      ?auto_895657 - BLOCK
      ?auto_895658 - BLOCK
    )
    :vars
    (
      ?auto_895659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895658 ?auto_895659 ) ( ON-TABLE ?auto_895642 ) ( ON ?auto_895643 ?auto_895642 ) ( ON ?auto_895644 ?auto_895643 ) ( ON ?auto_895645 ?auto_895644 ) ( ON ?auto_895646 ?auto_895645 ) ( ON ?auto_895647 ?auto_895646 ) ( ON ?auto_895648 ?auto_895647 ) ( ON ?auto_895649 ?auto_895648 ) ( ON ?auto_895650 ?auto_895649 ) ( ON ?auto_895651 ?auto_895650 ) ( ON ?auto_895652 ?auto_895651 ) ( ON ?auto_895653 ?auto_895652 ) ( ON ?auto_895654 ?auto_895653 ) ( ON ?auto_895655 ?auto_895654 ) ( not ( = ?auto_895642 ?auto_895643 ) ) ( not ( = ?auto_895642 ?auto_895644 ) ) ( not ( = ?auto_895642 ?auto_895645 ) ) ( not ( = ?auto_895642 ?auto_895646 ) ) ( not ( = ?auto_895642 ?auto_895647 ) ) ( not ( = ?auto_895642 ?auto_895648 ) ) ( not ( = ?auto_895642 ?auto_895649 ) ) ( not ( = ?auto_895642 ?auto_895650 ) ) ( not ( = ?auto_895642 ?auto_895651 ) ) ( not ( = ?auto_895642 ?auto_895652 ) ) ( not ( = ?auto_895642 ?auto_895653 ) ) ( not ( = ?auto_895642 ?auto_895654 ) ) ( not ( = ?auto_895642 ?auto_895655 ) ) ( not ( = ?auto_895642 ?auto_895656 ) ) ( not ( = ?auto_895642 ?auto_895657 ) ) ( not ( = ?auto_895642 ?auto_895658 ) ) ( not ( = ?auto_895642 ?auto_895659 ) ) ( not ( = ?auto_895643 ?auto_895644 ) ) ( not ( = ?auto_895643 ?auto_895645 ) ) ( not ( = ?auto_895643 ?auto_895646 ) ) ( not ( = ?auto_895643 ?auto_895647 ) ) ( not ( = ?auto_895643 ?auto_895648 ) ) ( not ( = ?auto_895643 ?auto_895649 ) ) ( not ( = ?auto_895643 ?auto_895650 ) ) ( not ( = ?auto_895643 ?auto_895651 ) ) ( not ( = ?auto_895643 ?auto_895652 ) ) ( not ( = ?auto_895643 ?auto_895653 ) ) ( not ( = ?auto_895643 ?auto_895654 ) ) ( not ( = ?auto_895643 ?auto_895655 ) ) ( not ( = ?auto_895643 ?auto_895656 ) ) ( not ( = ?auto_895643 ?auto_895657 ) ) ( not ( = ?auto_895643 ?auto_895658 ) ) ( not ( = ?auto_895643 ?auto_895659 ) ) ( not ( = ?auto_895644 ?auto_895645 ) ) ( not ( = ?auto_895644 ?auto_895646 ) ) ( not ( = ?auto_895644 ?auto_895647 ) ) ( not ( = ?auto_895644 ?auto_895648 ) ) ( not ( = ?auto_895644 ?auto_895649 ) ) ( not ( = ?auto_895644 ?auto_895650 ) ) ( not ( = ?auto_895644 ?auto_895651 ) ) ( not ( = ?auto_895644 ?auto_895652 ) ) ( not ( = ?auto_895644 ?auto_895653 ) ) ( not ( = ?auto_895644 ?auto_895654 ) ) ( not ( = ?auto_895644 ?auto_895655 ) ) ( not ( = ?auto_895644 ?auto_895656 ) ) ( not ( = ?auto_895644 ?auto_895657 ) ) ( not ( = ?auto_895644 ?auto_895658 ) ) ( not ( = ?auto_895644 ?auto_895659 ) ) ( not ( = ?auto_895645 ?auto_895646 ) ) ( not ( = ?auto_895645 ?auto_895647 ) ) ( not ( = ?auto_895645 ?auto_895648 ) ) ( not ( = ?auto_895645 ?auto_895649 ) ) ( not ( = ?auto_895645 ?auto_895650 ) ) ( not ( = ?auto_895645 ?auto_895651 ) ) ( not ( = ?auto_895645 ?auto_895652 ) ) ( not ( = ?auto_895645 ?auto_895653 ) ) ( not ( = ?auto_895645 ?auto_895654 ) ) ( not ( = ?auto_895645 ?auto_895655 ) ) ( not ( = ?auto_895645 ?auto_895656 ) ) ( not ( = ?auto_895645 ?auto_895657 ) ) ( not ( = ?auto_895645 ?auto_895658 ) ) ( not ( = ?auto_895645 ?auto_895659 ) ) ( not ( = ?auto_895646 ?auto_895647 ) ) ( not ( = ?auto_895646 ?auto_895648 ) ) ( not ( = ?auto_895646 ?auto_895649 ) ) ( not ( = ?auto_895646 ?auto_895650 ) ) ( not ( = ?auto_895646 ?auto_895651 ) ) ( not ( = ?auto_895646 ?auto_895652 ) ) ( not ( = ?auto_895646 ?auto_895653 ) ) ( not ( = ?auto_895646 ?auto_895654 ) ) ( not ( = ?auto_895646 ?auto_895655 ) ) ( not ( = ?auto_895646 ?auto_895656 ) ) ( not ( = ?auto_895646 ?auto_895657 ) ) ( not ( = ?auto_895646 ?auto_895658 ) ) ( not ( = ?auto_895646 ?auto_895659 ) ) ( not ( = ?auto_895647 ?auto_895648 ) ) ( not ( = ?auto_895647 ?auto_895649 ) ) ( not ( = ?auto_895647 ?auto_895650 ) ) ( not ( = ?auto_895647 ?auto_895651 ) ) ( not ( = ?auto_895647 ?auto_895652 ) ) ( not ( = ?auto_895647 ?auto_895653 ) ) ( not ( = ?auto_895647 ?auto_895654 ) ) ( not ( = ?auto_895647 ?auto_895655 ) ) ( not ( = ?auto_895647 ?auto_895656 ) ) ( not ( = ?auto_895647 ?auto_895657 ) ) ( not ( = ?auto_895647 ?auto_895658 ) ) ( not ( = ?auto_895647 ?auto_895659 ) ) ( not ( = ?auto_895648 ?auto_895649 ) ) ( not ( = ?auto_895648 ?auto_895650 ) ) ( not ( = ?auto_895648 ?auto_895651 ) ) ( not ( = ?auto_895648 ?auto_895652 ) ) ( not ( = ?auto_895648 ?auto_895653 ) ) ( not ( = ?auto_895648 ?auto_895654 ) ) ( not ( = ?auto_895648 ?auto_895655 ) ) ( not ( = ?auto_895648 ?auto_895656 ) ) ( not ( = ?auto_895648 ?auto_895657 ) ) ( not ( = ?auto_895648 ?auto_895658 ) ) ( not ( = ?auto_895648 ?auto_895659 ) ) ( not ( = ?auto_895649 ?auto_895650 ) ) ( not ( = ?auto_895649 ?auto_895651 ) ) ( not ( = ?auto_895649 ?auto_895652 ) ) ( not ( = ?auto_895649 ?auto_895653 ) ) ( not ( = ?auto_895649 ?auto_895654 ) ) ( not ( = ?auto_895649 ?auto_895655 ) ) ( not ( = ?auto_895649 ?auto_895656 ) ) ( not ( = ?auto_895649 ?auto_895657 ) ) ( not ( = ?auto_895649 ?auto_895658 ) ) ( not ( = ?auto_895649 ?auto_895659 ) ) ( not ( = ?auto_895650 ?auto_895651 ) ) ( not ( = ?auto_895650 ?auto_895652 ) ) ( not ( = ?auto_895650 ?auto_895653 ) ) ( not ( = ?auto_895650 ?auto_895654 ) ) ( not ( = ?auto_895650 ?auto_895655 ) ) ( not ( = ?auto_895650 ?auto_895656 ) ) ( not ( = ?auto_895650 ?auto_895657 ) ) ( not ( = ?auto_895650 ?auto_895658 ) ) ( not ( = ?auto_895650 ?auto_895659 ) ) ( not ( = ?auto_895651 ?auto_895652 ) ) ( not ( = ?auto_895651 ?auto_895653 ) ) ( not ( = ?auto_895651 ?auto_895654 ) ) ( not ( = ?auto_895651 ?auto_895655 ) ) ( not ( = ?auto_895651 ?auto_895656 ) ) ( not ( = ?auto_895651 ?auto_895657 ) ) ( not ( = ?auto_895651 ?auto_895658 ) ) ( not ( = ?auto_895651 ?auto_895659 ) ) ( not ( = ?auto_895652 ?auto_895653 ) ) ( not ( = ?auto_895652 ?auto_895654 ) ) ( not ( = ?auto_895652 ?auto_895655 ) ) ( not ( = ?auto_895652 ?auto_895656 ) ) ( not ( = ?auto_895652 ?auto_895657 ) ) ( not ( = ?auto_895652 ?auto_895658 ) ) ( not ( = ?auto_895652 ?auto_895659 ) ) ( not ( = ?auto_895653 ?auto_895654 ) ) ( not ( = ?auto_895653 ?auto_895655 ) ) ( not ( = ?auto_895653 ?auto_895656 ) ) ( not ( = ?auto_895653 ?auto_895657 ) ) ( not ( = ?auto_895653 ?auto_895658 ) ) ( not ( = ?auto_895653 ?auto_895659 ) ) ( not ( = ?auto_895654 ?auto_895655 ) ) ( not ( = ?auto_895654 ?auto_895656 ) ) ( not ( = ?auto_895654 ?auto_895657 ) ) ( not ( = ?auto_895654 ?auto_895658 ) ) ( not ( = ?auto_895654 ?auto_895659 ) ) ( not ( = ?auto_895655 ?auto_895656 ) ) ( not ( = ?auto_895655 ?auto_895657 ) ) ( not ( = ?auto_895655 ?auto_895658 ) ) ( not ( = ?auto_895655 ?auto_895659 ) ) ( not ( = ?auto_895656 ?auto_895657 ) ) ( not ( = ?auto_895656 ?auto_895658 ) ) ( not ( = ?auto_895656 ?auto_895659 ) ) ( not ( = ?auto_895657 ?auto_895658 ) ) ( not ( = ?auto_895657 ?auto_895659 ) ) ( not ( = ?auto_895658 ?auto_895659 ) ) ( ON ?auto_895657 ?auto_895658 ) ( CLEAR ?auto_895655 ) ( ON ?auto_895656 ?auto_895657 ) ( CLEAR ?auto_895656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_895642 ?auto_895643 ?auto_895644 ?auto_895645 ?auto_895646 ?auto_895647 ?auto_895648 ?auto_895649 ?auto_895650 ?auto_895651 ?auto_895652 ?auto_895653 ?auto_895654 ?auto_895655 ?auto_895656 )
      ( MAKE-17PILE ?auto_895642 ?auto_895643 ?auto_895644 ?auto_895645 ?auto_895646 ?auto_895647 ?auto_895648 ?auto_895649 ?auto_895650 ?auto_895651 ?auto_895652 ?auto_895653 ?auto_895654 ?auto_895655 ?auto_895656 ?auto_895657 ?auto_895658 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895712 - BLOCK
      ?auto_895713 - BLOCK
      ?auto_895714 - BLOCK
      ?auto_895715 - BLOCK
      ?auto_895716 - BLOCK
      ?auto_895717 - BLOCK
      ?auto_895718 - BLOCK
      ?auto_895719 - BLOCK
      ?auto_895720 - BLOCK
      ?auto_895721 - BLOCK
      ?auto_895722 - BLOCK
      ?auto_895723 - BLOCK
      ?auto_895724 - BLOCK
      ?auto_895725 - BLOCK
      ?auto_895726 - BLOCK
      ?auto_895727 - BLOCK
      ?auto_895728 - BLOCK
    )
    :vars
    (
      ?auto_895729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895728 ?auto_895729 ) ( ON-TABLE ?auto_895712 ) ( ON ?auto_895713 ?auto_895712 ) ( ON ?auto_895714 ?auto_895713 ) ( ON ?auto_895715 ?auto_895714 ) ( ON ?auto_895716 ?auto_895715 ) ( ON ?auto_895717 ?auto_895716 ) ( ON ?auto_895718 ?auto_895717 ) ( ON ?auto_895719 ?auto_895718 ) ( ON ?auto_895720 ?auto_895719 ) ( ON ?auto_895721 ?auto_895720 ) ( ON ?auto_895722 ?auto_895721 ) ( ON ?auto_895723 ?auto_895722 ) ( ON ?auto_895724 ?auto_895723 ) ( not ( = ?auto_895712 ?auto_895713 ) ) ( not ( = ?auto_895712 ?auto_895714 ) ) ( not ( = ?auto_895712 ?auto_895715 ) ) ( not ( = ?auto_895712 ?auto_895716 ) ) ( not ( = ?auto_895712 ?auto_895717 ) ) ( not ( = ?auto_895712 ?auto_895718 ) ) ( not ( = ?auto_895712 ?auto_895719 ) ) ( not ( = ?auto_895712 ?auto_895720 ) ) ( not ( = ?auto_895712 ?auto_895721 ) ) ( not ( = ?auto_895712 ?auto_895722 ) ) ( not ( = ?auto_895712 ?auto_895723 ) ) ( not ( = ?auto_895712 ?auto_895724 ) ) ( not ( = ?auto_895712 ?auto_895725 ) ) ( not ( = ?auto_895712 ?auto_895726 ) ) ( not ( = ?auto_895712 ?auto_895727 ) ) ( not ( = ?auto_895712 ?auto_895728 ) ) ( not ( = ?auto_895712 ?auto_895729 ) ) ( not ( = ?auto_895713 ?auto_895714 ) ) ( not ( = ?auto_895713 ?auto_895715 ) ) ( not ( = ?auto_895713 ?auto_895716 ) ) ( not ( = ?auto_895713 ?auto_895717 ) ) ( not ( = ?auto_895713 ?auto_895718 ) ) ( not ( = ?auto_895713 ?auto_895719 ) ) ( not ( = ?auto_895713 ?auto_895720 ) ) ( not ( = ?auto_895713 ?auto_895721 ) ) ( not ( = ?auto_895713 ?auto_895722 ) ) ( not ( = ?auto_895713 ?auto_895723 ) ) ( not ( = ?auto_895713 ?auto_895724 ) ) ( not ( = ?auto_895713 ?auto_895725 ) ) ( not ( = ?auto_895713 ?auto_895726 ) ) ( not ( = ?auto_895713 ?auto_895727 ) ) ( not ( = ?auto_895713 ?auto_895728 ) ) ( not ( = ?auto_895713 ?auto_895729 ) ) ( not ( = ?auto_895714 ?auto_895715 ) ) ( not ( = ?auto_895714 ?auto_895716 ) ) ( not ( = ?auto_895714 ?auto_895717 ) ) ( not ( = ?auto_895714 ?auto_895718 ) ) ( not ( = ?auto_895714 ?auto_895719 ) ) ( not ( = ?auto_895714 ?auto_895720 ) ) ( not ( = ?auto_895714 ?auto_895721 ) ) ( not ( = ?auto_895714 ?auto_895722 ) ) ( not ( = ?auto_895714 ?auto_895723 ) ) ( not ( = ?auto_895714 ?auto_895724 ) ) ( not ( = ?auto_895714 ?auto_895725 ) ) ( not ( = ?auto_895714 ?auto_895726 ) ) ( not ( = ?auto_895714 ?auto_895727 ) ) ( not ( = ?auto_895714 ?auto_895728 ) ) ( not ( = ?auto_895714 ?auto_895729 ) ) ( not ( = ?auto_895715 ?auto_895716 ) ) ( not ( = ?auto_895715 ?auto_895717 ) ) ( not ( = ?auto_895715 ?auto_895718 ) ) ( not ( = ?auto_895715 ?auto_895719 ) ) ( not ( = ?auto_895715 ?auto_895720 ) ) ( not ( = ?auto_895715 ?auto_895721 ) ) ( not ( = ?auto_895715 ?auto_895722 ) ) ( not ( = ?auto_895715 ?auto_895723 ) ) ( not ( = ?auto_895715 ?auto_895724 ) ) ( not ( = ?auto_895715 ?auto_895725 ) ) ( not ( = ?auto_895715 ?auto_895726 ) ) ( not ( = ?auto_895715 ?auto_895727 ) ) ( not ( = ?auto_895715 ?auto_895728 ) ) ( not ( = ?auto_895715 ?auto_895729 ) ) ( not ( = ?auto_895716 ?auto_895717 ) ) ( not ( = ?auto_895716 ?auto_895718 ) ) ( not ( = ?auto_895716 ?auto_895719 ) ) ( not ( = ?auto_895716 ?auto_895720 ) ) ( not ( = ?auto_895716 ?auto_895721 ) ) ( not ( = ?auto_895716 ?auto_895722 ) ) ( not ( = ?auto_895716 ?auto_895723 ) ) ( not ( = ?auto_895716 ?auto_895724 ) ) ( not ( = ?auto_895716 ?auto_895725 ) ) ( not ( = ?auto_895716 ?auto_895726 ) ) ( not ( = ?auto_895716 ?auto_895727 ) ) ( not ( = ?auto_895716 ?auto_895728 ) ) ( not ( = ?auto_895716 ?auto_895729 ) ) ( not ( = ?auto_895717 ?auto_895718 ) ) ( not ( = ?auto_895717 ?auto_895719 ) ) ( not ( = ?auto_895717 ?auto_895720 ) ) ( not ( = ?auto_895717 ?auto_895721 ) ) ( not ( = ?auto_895717 ?auto_895722 ) ) ( not ( = ?auto_895717 ?auto_895723 ) ) ( not ( = ?auto_895717 ?auto_895724 ) ) ( not ( = ?auto_895717 ?auto_895725 ) ) ( not ( = ?auto_895717 ?auto_895726 ) ) ( not ( = ?auto_895717 ?auto_895727 ) ) ( not ( = ?auto_895717 ?auto_895728 ) ) ( not ( = ?auto_895717 ?auto_895729 ) ) ( not ( = ?auto_895718 ?auto_895719 ) ) ( not ( = ?auto_895718 ?auto_895720 ) ) ( not ( = ?auto_895718 ?auto_895721 ) ) ( not ( = ?auto_895718 ?auto_895722 ) ) ( not ( = ?auto_895718 ?auto_895723 ) ) ( not ( = ?auto_895718 ?auto_895724 ) ) ( not ( = ?auto_895718 ?auto_895725 ) ) ( not ( = ?auto_895718 ?auto_895726 ) ) ( not ( = ?auto_895718 ?auto_895727 ) ) ( not ( = ?auto_895718 ?auto_895728 ) ) ( not ( = ?auto_895718 ?auto_895729 ) ) ( not ( = ?auto_895719 ?auto_895720 ) ) ( not ( = ?auto_895719 ?auto_895721 ) ) ( not ( = ?auto_895719 ?auto_895722 ) ) ( not ( = ?auto_895719 ?auto_895723 ) ) ( not ( = ?auto_895719 ?auto_895724 ) ) ( not ( = ?auto_895719 ?auto_895725 ) ) ( not ( = ?auto_895719 ?auto_895726 ) ) ( not ( = ?auto_895719 ?auto_895727 ) ) ( not ( = ?auto_895719 ?auto_895728 ) ) ( not ( = ?auto_895719 ?auto_895729 ) ) ( not ( = ?auto_895720 ?auto_895721 ) ) ( not ( = ?auto_895720 ?auto_895722 ) ) ( not ( = ?auto_895720 ?auto_895723 ) ) ( not ( = ?auto_895720 ?auto_895724 ) ) ( not ( = ?auto_895720 ?auto_895725 ) ) ( not ( = ?auto_895720 ?auto_895726 ) ) ( not ( = ?auto_895720 ?auto_895727 ) ) ( not ( = ?auto_895720 ?auto_895728 ) ) ( not ( = ?auto_895720 ?auto_895729 ) ) ( not ( = ?auto_895721 ?auto_895722 ) ) ( not ( = ?auto_895721 ?auto_895723 ) ) ( not ( = ?auto_895721 ?auto_895724 ) ) ( not ( = ?auto_895721 ?auto_895725 ) ) ( not ( = ?auto_895721 ?auto_895726 ) ) ( not ( = ?auto_895721 ?auto_895727 ) ) ( not ( = ?auto_895721 ?auto_895728 ) ) ( not ( = ?auto_895721 ?auto_895729 ) ) ( not ( = ?auto_895722 ?auto_895723 ) ) ( not ( = ?auto_895722 ?auto_895724 ) ) ( not ( = ?auto_895722 ?auto_895725 ) ) ( not ( = ?auto_895722 ?auto_895726 ) ) ( not ( = ?auto_895722 ?auto_895727 ) ) ( not ( = ?auto_895722 ?auto_895728 ) ) ( not ( = ?auto_895722 ?auto_895729 ) ) ( not ( = ?auto_895723 ?auto_895724 ) ) ( not ( = ?auto_895723 ?auto_895725 ) ) ( not ( = ?auto_895723 ?auto_895726 ) ) ( not ( = ?auto_895723 ?auto_895727 ) ) ( not ( = ?auto_895723 ?auto_895728 ) ) ( not ( = ?auto_895723 ?auto_895729 ) ) ( not ( = ?auto_895724 ?auto_895725 ) ) ( not ( = ?auto_895724 ?auto_895726 ) ) ( not ( = ?auto_895724 ?auto_895727 ) ) ( not ( = ?auto_895724 ?auto_895728 ) ) ( not ( = ?auto_895724 ?auto_895729 ) ) ( not ( = ?auto_895725 ?auto_895726 ) ) ( not ( = ?auto_895725 ?auto_895727 ) ) ( not ( = ?auto_895725 ?auto_895728 ) ) ( not ( = ?auto_895725 ?auto_895729 ) ) ( not ( = ?auto_895726 ?auto_895727 ) ) ( not ( = ?auto_895726 ?auto_895728 ) ) ( not ( = ?auto_895726 ?auto_895729 ) ) ( not ( = ?auto_895727 ?auto_895728 ) ) ( not ( = ?auto_895727 ?auto_895729 ) ) ( not ( = ?auto_895728 ?auto_895729 ) ) ( ON ?auto_895727 ?auto_895728 ) ( ON ?auto_895726 ?auto_895727 ) ( CLEAR ?auto_895724 ) ( ON ?auto_895725 ?auto_895726 ) ( CLEAR ?auto_895725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_895712 ?auto_895713 ?auto_895714 ?auto_895715 ?auto_895716 ?auto_895717 ?auto_895718 ?auto_895719 ?auto_895720 ?auto_895721 ?auto_895722 ?auto_895723 ?auto_895724 ?auto_895725 )
      ( MAKE-17PILE ?auto_895712 ?auto_895713 ?auto_895714 ?auto_895715 ?auto_895716 ?auto_895717 ?auto_895718 ?auto_895719 ?auto_895720 ?auto_895721 ?auto_895722 ?auto_895723 ?auto_895724 ?auto_895725 ?auto_895726 ?auto_895727 ?auto_895728 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895782 - BLOCK
      ?auto_895783 - BLOCK
      ?auto_895784 - BLOCK
      ?auto_895785 - BLOCK
      ?auto_895786 - BLOCK
      ?auto_895787 - BLOCK
      ?auto_895788 - BLOCK
      ?auto_895789 - BLOCK
      ?auto_895790 - BLOCK
      ?auto_895791 - BLOCK
      ?auto_895792 - BLOCK
      ?auto_895793 - BLOCK
      ?auto_895794 - BLOCK
      ?auto_895795 - BLOCK
      ?auto_895796 - BLOCK
      ?auto_895797 - BLOCK
      ?auto_895798 - BLOCK
    )
    :vars
    (
      ?auto_895799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895798 ?auto_895799 ) ( ON-TABLE ?auto_895782 ) ( ON ?auto_895783 ?auto_895782 ) ( ON ?auto_895784 ?auto_895783 ) ( ON ?auto_895785 ?auto_895784 ) ( ON ?auto_895786 ?auto_895785 ) ( ON ?auto_895787 ?auto_895786 ) ( ON ?auto_895788 ?auto_895787 ) ( ON ?auto_895789 ?auto_895788 ) ( ON ?auto_895790 ?auto_895789 ) ( ON ?auto_895791 ?auto_895790 ) ( ON ?auto_895792 ?auto_895791 ) ( ON ?auto_895793 ?auto_895792 ) ( not ( = ?auto_895782 ?auto_895783 ) ) ( not ( = ?auto_895782 ?auto_895784 ) ) ( not ( = ?auto_895782 ?auto_895785 ) ) ( not ( = ?auto_895782 ?auto_895786 ) ) ( not ( = ?auto_895782 ?auto_895787 ) ) ( not ( = ?auto_895782 ?auto_895788 ) ) ( not ( = ?auto_895782 ?auto_895789 ) ) ( not ( = ?auto_895782 ?auto_895790 ) ) ( not ( = ?auto_895782 ?auto_895791 ) ) ( not ( = ?auto_895782 ?auto_895792 ) ) ( not ( = ?auto_895782 ?auto_895793 ) ) ( not ( = ?auto_895782 ?auto_895794 ) ) ( not ( = ?auto_895782 ?auto_895795 ) ) ( not ( = ?auto_895782 ?auto_895796 ) ) ( not ( = ?auto_895782 ?auto_895797 ) ) ( not ( = ?auto_895782 ?auto_895798 ) ) ( not ( = ?auto_895782 ?auto_895799 ) ) ( not ( = ?auto_895783 ?auto_895784 ) ) ( not ( = ?auto_895783 ?auto_895785 ) ) ( not ( = ?auto_895783 ?auto_895786 ) ) ( not ( = ?auto_895783 ?auto_895787 ) ) ( not ( = ?auto_895783 ?auto_895788 ) ) ( not ( = ?auto_895783 ?auto_895789 ) ) ( not ( = ?auto_895783 ?auto_895790 ) ) ( not ( = ?auto_895783 ?auto_895791 ) ) ( not ( = ?auto_895783 ?auto_895792 ) ) ( not ( = ?auto_895783 ?auto_895793 ) ) ( not ( = ?auto_895783 ?auto_895794 ) ) ( not ( = ?auto_895783 ?auto_895795 ) ) ( not ( = ?auto_895783 ?auto_895796 ) ) ( not ( = ?auto_895783 ?auto_895797 ) ) ( not ( = ?auto_895783 ?auto_895798 ) ) ( not ( = ?auto_895783 ?auto_895799 ) ) ( not ( = ?auto_895784 ?auto_895785 ) ) ( not ( = ?auto_895784 ?auto_895786 ) ) ( not ( = ?auto_895784 ?auto_895787 ) ) ( not ( = ?auto_895784 ?auto_895788 ) ) ( not ( = ?auto_895784 ?auto_895789 ) ) ( not ( = ?auto_895784 ?auto_895790 ) ) ( not ( = ?auto_895784 ?auto_895791 ) ) ( not ( = ?auto_895784 ?auto_895792 ) ) ( not ( = ?auto_895784 ?auto_895793 ) ) ( not ( = ?auto_895784 ?auto_895794 ) ) ( not ( = ?auto_895784 ?auto_895795 ) ) ( not ( = ?auto_895784 ?auto_895796 ) ) ( not ( = ?auto_895784 ?auto_895797 ) ) ( not ( = ?auto_895784 ?auto_895798 ) ) ( not ( = ?auto_895784 ?auto_895799 ) ) ( not ( = ?auto_895785 ?auto_895786 ) ) ( not ( = ?auto_895785 ?auto_895787 ) ) ( not ( = ?auto_895785 ?auto_895788 ) ) ( not ( = ?auto_895785 ?auto_895789 ) ) ( not ( = ?auto_895785 ?auto_895790 ) ) ( not ( = ?auto_895785 ?auto_895791 ) ) ( not ( = ?auto_895785 ?auto_895792 ) ) ( not ( = ?auto_895785 ?auto_895793 ) ) ( not ( = ?auto_895785 ?auto_895794 ) ) ( not ( = ?auto_895785 ?auto_895795 ) ) ( not ( = ?auto_895785 ?auto_895796 ) ) ( not ( = ?auto_895785 ?auto_895797 ) ) ( not ( = ?auto_895785 ?auto_895798 ) ) ( not ( = ?auto_895785 ?auto_895799 ) ) ( not ( = ?auto_895786 ?auto_895787 ) ) ( not ( = ?auto_895786 ?auto_895788 ) ) ( not ( = ?auto_895786 ?auto_895789 ) ) ( not ( = ?auto_895786 ?auto_895790 ) ) ( not ( = ?auto_895786 ?auto_895791 ) ) ( not ( = ?auto_895786 ?auto_895792 ) ) ( not ( = ?auto_895786 ?auto_895793 ) ) ( not ( = ?auto_895786 ?auto_895794 ) ) ( not ( = ?auto_895786 ?auto_895795 ) ) ( not ( = ?auto_895786 ?auto_895796 ) ) ( not ( = ?auto_895786 ?auto_895797 ) ) ( not ( = ?auto_895786 ?auto_895798 ) ) ( not ( = ?auto_895786 ?auto_895799 ) ) ( not ( = ?auto_895787 ?auto_895788 ) ) ( not ( = ?auto_895787 ?auto_895789 ) ) ( not ( = ?auto_895787 ?auto_895790 ) ) ( not ( = ?auto_895787 ?auto_895791 ) ) ( not ( = ?auto_895787 ?auto_895792 ) ) ( not ( = ?auto_895787 ?auto_895793 ) ) ( not ( = ?auto_895787 ?auto_895794 ) ) ( not ( = ?auto_895787 ?auto_895795 ) ) ( not ( = ?auto_895787 ?auto_895796 ) ) ( not ( = ?auto_895787 ?auto_895797 ) ) ( not ( = ?auto_895787 ?auto_895798 ) ) ( not ( = ?auto_895787 ?auto_895799 ) ) ( not ( = ?auto_895788 ?auto_895789 ) ) ( not ( = ?auto_895788 ?auto_895790 ) ) ( not ( = ?auto_895788 ?auto_895791 ) ) ( not ( = ?auto_895788 ?auto_895792 ) ) ( not ( = ?auto_895788 ?auto_895793 ) ) ( not ( = ?auto_895788 ?auto_895794 ) ) ( not ( = ?auto_895788 ?auto_895795 ) ) ( not ( = ?auto_895788 ?auto_895796 ) ) ( not ( = ?auto_895788 ?auto_895797 ) ) ( not ( = ?auto_895788 ?auto_895798 ) ) ( not ( = ?auto_895788 ?auto_895799 ) ) ( not ( = ?auto_895789 ?auto_895790 ) ) ( not ( = ?auto_895789 ?auto_895791 ) ) ( not ( = ?auto_895789 ?auto_895792 ) ) ( not ( = ?auto_895789 ?auto_895793 ) ) ( not ( = ?auto_895789 ?auto_895794 ) ) ( not ( = ?auto_895789 ?auto_895795 ) ) ( not ( = ?auto_895789 ?auto_895796 ) ) ( not ( = ?auto_895789 ?auto_895797 ) ) ( not ( = ?auto_895789 ?auto_895798 ) ) ( not ( = ?auto_895789 ?auto_895799 ) ) ( not ( = ?auto_895790 ?auto_895791 ) ) ( not ( = ?auto_895790 ?auto_895792 ) ) ( not ( = ?auto_895790 ?auto_895793 ) ) ( not ( = ?auto_895790 ?auto_895794 ) ) ( not ( = ?auto_895790 ?auto_895795 ) ) ( not ( = ?auto_895790 ?auto_895796 ) ) ( not ( = ?auto_895790 ?auto_895797 ) ) ( not ( = ?auto_895790 ?auto_895798 ) ) ( not ( = ?auto_895790 ?auto_895799 ) ) ( not ( = ?auto_895791 ?auto_895792 ) ) ( not ( = ?auto_895791 ?auto_895793 ) ) ( not ( = ?auto_895791 ?auto_895794 ) ) ( not ( = ?auto_895791 ?auto_895795 ) ) ( not ( = ?auto_895791 ?auto_895796 ) ) ( not ( = ?auto_895791 ?auto_895797 ) ) ( not ( = ?auto_895791 ?auto_895798 ) ) ( not ( = ?auto_895791 ?auto_895799 ) ) ( not ( = ?auto_895792 ?auto_895793 ) ) ( not ( = ?auto_895792 ?auto_895794 ) ) ( not ( = ?auto_895792 ?auto_895795 ) ) ( not ( = ?auto_895792 ?auto_895796 ) ) ( not ( = ?auto_895792 ?auto_895797 ) ) ( not ( = ?auto_895792 ?auto_895798 ) ) ( not ( = ?auto_895792 ?auto_895799 ) ) ( not ( = ?auto_895793 ?auto_895794 ) ) ( not ( = ?auto_895793 ?auto_895795 ) ) ( not ( = ?auto_895793 ?auto_895796 ) ) ( not ( = ?auto_895793 ?auto_895797 ) ) ( not ( = ?auto_895793 ?auto_895798 ) ) ( not ( = ?auto_895793 ?auto_895799 ) ) ( not ( = ?auto_895794 ?auto_895795 ) ) ( not ( = ?auto_895794 ?auto_895796 ) ) ( not ( = ?auto_895794 ?auto_895797 ) ) ( not ( = ?auto_895794 ?auto_895798 ) ) ( not ( = ?auto_895794 ?auto_895799 ) ) ( not ( = ?auto_895795 ?auto_895796 ) ) ( not ( = ?auto_895795 ?auto_895797 ) ) ( not ( = ?auto_895795 ?auto_895798 ) ) ( not ( = ?auto_895795 ?auto_895799 ) ) ( not ( = ?auto_895796 ?auto_895797 ) ) ( not ( = ?auto_895796 ?auto_895798 ) ) ( not ( = ?auto_895796 ?auto_895799 ) ) ( not ( = ?auto_895797 ?auto_895798 ) ) ( not ( = ?auto_895797 ?auto_895799 ) ) ( not ( = ?auto_895798 ?auto_895799 ) ) ( ON ?auto_895797 ?auto_895798 ) ( ON ?auto_895796 ?auto_895797 ) ( ON ?auto_895795 ?auto_895796 ) ( CLEAR ?auto_895793 ) ( ON ?auto_895794 ?auto_895795 ) ( CLEAR ?auto_895794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_895782 ?auto_895783 ?auto_895784 ?auto_895785 ?auto_895786 ?auto_895787 ?auto_895788 ?auto_895789 ?auto_895790 ?auto_895791 ?auto_895792 ?auto_895793 ?auto_895794 )
      ( MAKE-17PILE ?auto_895782 ?auto_895783 ?auto_895784 ?auto_895785 ?auto_895786 ?auto_895787 ?auto_895788 ?auto_895789 ?auto_895790 ?auto_895791 ?auto_895792 ?auto_895793 ?auto_895794 ?auto_895795 ?auto_895796 ?auto_895797 ?auto_895798 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895852 - BLOCK
      ?auto_895853 - BLOCK
      ?auto_895854 - BLOCK
      ?auto_895855 - BLOCK
      ?auto_895856 - BLOCK
      ?auto_895857 - BLOCK
      ?auto_895858 - BLOCK
      ?auto_895859 - BLOCK
      ?auto_895860 - BLOCK
      ?auto_895861 - BLOCK
      ?auto_895862 - BLOCK
      ?auto_895863 - BLOCK
      ?auto_895864 - BLOCK
      ?auto_895865 - BLOCK
      ?auto_895866 - BLOCK
      ?auto_895867 - BLOCK
      ?auto_895868 - BLOCK
    )
    :vars
    (
      ?auto_895869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895868 ?auto_895869 ) ( ON-TABLE ?auto_895852 ) ( ON ?auto_895853 ?auto_895852 ) ( ON ?auto_895854 ?auto_895853 ) ( ON ?auto_895855 ?auto_895854 ) ( ON ?auto_895856 ?auto_895855 ) ( ON ?auto_895857 ?auto_895856 ) ( ON ?auto_895858 ?auto_895857 ) ( ON ?auto_895859 ?auto_895858 ) ( ON ?auto_895860 ?auto_895859 ) ( ON ?auto_895861 ?auto_895860 ) ( ON ?auto_895862 ?auto_895861 ) ( not ( = ?auto_895852 ?auto_895853 ) ) ( not ( = ?auto_895852 ?auto_895854 ) ) ( not ( = ?auto_895852 ?auto_895855 ) ) ( not ( = ?auto_895852 ?auto_895856 ) ) ( not ( = ?auto_895852 ?auto_895857 ) ) ( not ( = ?auto_895852 ?auto_895858 ) ) ( not ( = ?auto_895852 ?auto_895859 ) ) ( not ( = ?auto_895852 ?auto_895860 ) ) ( not ( = ?auto_895852 ?auto_895861 ) ) ( not ( = ?auto_895852 ?auto_895862 ) ) ( not ( = ?auto_895852 ?auto_895863 ) ) ( not ( = ?auto_895852 ?auto_895864 ) ) ( not ( = ?auto_895852 ?auto_895865 ) ) ( not ( = ?auto_895852 ?auto_895866 ) ) ( not ( = ?auto_895852 ?auto_895867 ) ) ( not ( = ?auto_895852 ?auto_895868 ) ) ( not ( = ?auto_895852 ?auto_895869 ) ) ( not ( = ?auto_895853 ?auto_895854 ) ) ( not ( = ?auto_895853 ?auto_895855 ) ) ( not ( = ?auto_895853 ?auto_895856 ) ) ( not ( = ?auto_895853 ?auto_895857 ) ) ( not ( = ?auto_895853 ?auto_895858 ) ) ( not ( = ?auto_895853 ?auto_895859 ) ) ( not ( = ?auto_895853 ?auto_895860 ) ) ( not ( = ?auto_895853 ?auto_895861 ) ) ( not ( = ?auto_895853 ?auto_895862 ) ) ( not ( = ?auto_895853 ?auto_895863 ) ) ( not ( = ?auto_895853 ?auto_895864 ) ) ( not ( = ?auto_895853 ?auto_895865 ) ) ( not ( = ?auto_895853 ?auto_895866 ) ) ( not ( = ?auto_895853 ?auto_895867 ) ) ( not ( = ?auto_895853 ?auto_895868 ) ) ( not ( = ?auto_895853 ?auto_895869 ) ) ( not ( = ?auto_895854 ?auto_895855 ) ) ( not ( = ?auto_895854 ?auto_895856 ) ) ( not ( = ?auto_895854 ?auto_895857 ) ) ( not ( = ?auto_895854 ?auto_895858 ) ) ( not ( = ?auto_895854 ?auto_895859 ) ) ( not ( = ?auto_895854 ?auto_895860 ) ) ( not ( = ?auto_895854 ?auto_895861 ) ) ( not ( = ?auto_895854 ?auto_895862 ) ) ( not ( = ?auto_895854 ?auto_895863 ) ) ( not ( = ?auto_895854 ?auto_895864 ) ) ( not ( = ?auto_895854 ?auto_895865 ) ) ( not ( = ?auto_895854 ?auto_895866 ) ) ( not ( = ?auto_895854 ?auto_895867 ) ) ( not ( = ?auto_895854 ?auto_895868 ) ) ( not ( = ?auto_895854 ?auto_895869 ) ) ( not ( = ?auto_895855 ?auto_895856 ) ) ( not ( = ?auto_895855 ?auto_895857 ) ) ( not ( = ?auto_895855 ?auto_895858 ) ) ( not ( = ?auto_895855 ?auto_895859 ) ) ( not ( = ?auto_895855 ?auto_895860 ) ) ( not ( = ?auto_895855 ?auto_895861 ) ) ( not ( = ?auto_895855 ?auto_895862 ) ) ( not ( = ?auto_895855 ?auto_895863 ) ) ( not ( = ?auto_895855 ?auto_895864 ) ) ( not ( = ?auto_895855 ?auto_895865 ) ) ( not ( = ?auto_895855 ?auto_895866 ) ) ( not ( = ?auto_895855 ?auto_895867 ) ) ( not ( = ?auto_895855 ?auto_895868 ) ) ( not ( = ?auto_895855 ?auto_895869 ) ) ( not ( = ?auto_895856 ?auto_895857 ) ) ( not ( = ?auto_895856 ?auto_895858 ) ) ( not ( = ?auto_895856 ?auto_895859 ) ) ( not ( = ?auto_895856 ?auto_895860 ) ) ( not ( = ?auto_895856 ?auto_895861 ) ) ( not ( = ?auto_895856 ?auto_895862 ) ) ( not ( = ?auto_895856 ?auto_895863 ) ) ( not ( = ?auto_895856 ?auto_895864 ) ) ( not ( = ?auto_895856 ?auto_895865 ) ) ( not ( = ?auto_895856 ?auto_895866 ) ) ( not ( = ?auto_895856 ?auto_895867 ) ) ( not ( = ?auto_895856 ?auto_895868 ) ) ( not ( = ?auto_895856 ?auto_895869 ) ) ( not ( = ?auto_895857 ?auto_895858 ) ) ( not ( = ?auto_895857 ?auto_895859 ) ) ( not ( = ?auto_895857 ?auto_895860 ) ) ( not ( = ?auto_895857 ?auto_895861 ) ) ( not ( = ?auto_895857 ?auto_895862 ) ) ( not ( = ?auto_895857 ?auto_895863 ) ) ( not ( = ?auto_895857 ?auto_895864 ) ) ( not ( = ?auto_895857 ?auto_895865 ) ) ( not ( = ?auto_895857 ?auto_895866 ) ) ( not ( = ?auto_895857 ?auto_895867 ) ) ( not ( = ?auto_895857 ?auto_895868 ) ) ( not ( = ?auto_895857 ?auto_895869 ) ) ( not ( = ?auto_895858 ?auto_895859 ) ) ( not ( = ?auto_895858 ?auto_895860 ) ) ( not ( = ?auto_895858 ?auto_895861 ) ) ( not ( = ?auto_895858 ?auto_895862 ) ) ( not ( = ?auto_895858 ?auto_895863 ) ) ( not ( = ?auto_895858 ?auto_895864 ) ) ( not ( = ?auto_895858 ?auto_895865 ) ) ( not ( = ?auto_895858 ?auto_895866 ) ) ( not ( = ?auto_895858 ?auto_895867 ) ) ( not ( = ?auto_895858 ?auto_895868 ) ) ( not ( = ?auto_895858 ?auto_895869 ) ) ( not ( = ?auto_895859 ?auto_895860 ) ) ( not ( = ?auto_895859 ?auto_895861 ) ) ( not ( = ?auto_895859 ?auto_895862 ) ) ( not ( = ?auto_895859 ?auto_895863 ) ) ( not ( = ?auto_895859 ?auto_895864 ) ) ( not ( = ?auto_895859 ?auto_895865 ) ) ( not ( = ?auto_895859 ?auto_895866 ) ) ( not ( = ?auto_895859 ?auto_895867 ) ) ( not ( = ?auto_895859 ?auto_895868 ) ) ( not ( = ?auto_895859 ?auto_895869 ) ) ( not ( = ?auto_895860 ?auto_895861 ) ) ( not ( = ?auto_895860 ?auto_895862 ) ) ( not ( = ?auto_895860 ?auto_895863 ) ) ( not ( = ?auto_895860 ?auto_895864 ) ) ( not ( = ?auto_895860 ?auto_895865 ) ) ( not ( = ?auto_895860 ?auto_895866 ) ) ( not ( = ?auto_895860 ?auto_895867 ) ) ( not ( = ?auto_895860 ?auto_895868 ) ) ( not ( = ?auto_895860 ?auto_895869 ) ) ( not ( = ?auto_895861 ?auto_895862 ) ) ( not ( = ?auto_895861 ?auto_895863 ) ) ( not ( = ?auto_895861 ?auto_895864 ) ) ( not ( = ?auto_895861 ?auto_895865 ) ) ( not ( = ?auto_895861 ?auto_895866 ) ) ( not ( = ?auto_895861 ?auto_895867 ) ) ( not ( = ?auto_895861 ?auto_895868 ) ) ( not ( = ?auto_895861 ?auto_895869 ) ) ( not ( = ?auto_895862 ?auto_895863 ) ) ( not ( = ?auto_895862 ?auto_895864 ) ) ( not ( = ?auto_895862 ?auto_895865 ) ) ( not ( = ?auto_895862 ?auto_895866 ) ) ( not ( = ?auto_895862 ?auto_895867 ) ) ( not ( = ?auto_895862 ?auto_895868 ) ) ( not ( = ?auto_895862 ?auto_895869 ) ) ( not ( = ?auto_895863 ?auto_895864 ) ) ( not ( = ?auto_895863 ?auto_895865 ) ) ( not ( = ?auto_895863 ?auto_895866 ) ) ( not ( = ?auto_895863 ?auto_895867 ) ) ( not ( = ?auto_895863 ?auto_895868 ) ) ( not ( = ?auto_895863 ?auto_895869 ) ) ( not ( = ?auto_895864 ?auto_895865 ) ) ( not ( = ?auto_895864 ?auto_895866 ) ) ( not ( = ?auto_895864 ?auto_895867 ) ) ( not ( = ?auto_895864 ?auto_895868 ) ) ( not ( = ?auto_895864 ?auto_895869 ) ) ( not ( = ?auto_895865 ?auto_895866 ) ) ( not ( = ?auto_895865 ?auto_895867 ) ) ( not ( = ?auto_895865 ?auto_895868 ) ) ( not ( = ?auto_895865 ?auto_895869 ) ) ( not ( = ?auto_895866 ?auto_895867 ) ) ( not ( = ?auto_895866 ?auto_895868 ) ) ( not ( = ?auto_895866 ?auto_895869 ) ) ( not ( = ?auto_895867 ?auto_895868 ) ) ( not ( = ?auto_895867 ?auto_895869 ) ) ( not ( = ?auto_895868 ?auto_895869 ) ) ( ON ?auto_895867 ?auto_895868 ) ( ON ?auto_895866 ?auto_895867 ) ( ON ?auto_895865 ?auto_895866 ) ( ON ?auto_895864 ?auto_895865 ) ( CLEAR ?auto_895862 ) ( ON ?auto_895863 ?auto_895864 ) ( CLEAR ?auto_895863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_895852 ?auto_895853 ?auto_895854 ?auto_895855 ?auto_895856 ?auto_895857 ?auto_895858 ?auto_895859 ?auto_895860 ?auto_895861 ?auto_895862 ?auto_895863 )
      ( MAKE-17PILE ?auto_895852 ?auto_895853 ?auto_895854 ?auto_895855 ?auto_895856 ?auto_895857 ?auto_895858 ?auto_895859 ?auto_895860 ?auto_895861 ?auto_895862 ?auto_895863 ?auto_895864 ?auto_895865 ?auto_895866 ?auto_895867 ?auto_895868 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895922 - BLOCK
      ?auto_895923 - BLOCK
      ?auto_895924 - BLOCK
      ?auto_895925 - BLOCK
      ?auto_895926 - BLOCK
      ?auto_895927 - BLOCK
      ?auto_895928 - BLOCK
      ?auto_895929 - BLOCK
      ?auto_895930 - BLOCK
      ?auto_895931 - BLOCK
      ?auto_895932 - BLOCK
      ?auto_895933 - BLOCK
      ?auto_895934 - BLOCK
      ?auto_895935 - BLOCK
      ?auto_895936 - BLOCK
      ?auto_895937 - BLOCK
      ?auto_895938 - BLOCK
    )
    :vars
    (
      ?auto_895939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_895938 ?auto_895939 ) ( ON-TABLE ?auto_895922 ) ( ON ?auto_895923 ?auto_895922 ) ( ON ?auto_895924 ?auto_895923 ) ( ON ?auto_895925 ?auto_895924 ) ( ON ?auto_895926 ?auto_895925 ) ( ON ?auto_895927 ?auto_895926 ) ( ON ?auto_895928 ?auto_895927 ) ( ON ?auto_895929 ?auto_895928 ) ( ON ?auto_895930 ?auto_895929 ) ( ON ?auto_895931 ?auto_895930 ) ( not ( = ?auto_895922 ?auto_895923 ) ) ( not ( = ?auto_895922 ?auto_895924 ) ) ( not ( = ?auto_895922 ?auto_895925 ) ) ( not ( = ?auto_895922 ?auto_895926 ) ) ( not ( = ?auto_895922 ?auto_895927 ) ) ( not ( = ?auto_895922 ?auto_895928 ) ) ( not ( = ?auto_895922 ?auto_895929 ) ) ( not ( = ?auto_895922 ?auto_895930 ) ) ( not ( = ?auto_895922 ?auto_895931 ) ) ( not ( = ?auto_895922 ?auto_895932 ) ) ( not ( = ?auto_895922 ?auto_895933 ) ) ( not ( = ?auto_895922 ?auto_895934 ) ) ( not ( = ?auto_895922 ?auto_895935 ) ) ( not ( = ?auto_895922 ?auto_895936 ) ) ( not ( = ?auto_895922 ?auto_895937 ) ) ( not ( = ?auto_895922 ?auto_895938 ) ) ( not ( = ?auto_895922 ?auto_895939 ) ) ( not ( = ?auto_895923 ?auto_895924 ) ) ( not ( = ?auto_895923 ?auto_895925 ) ) ( not ( = ?auto_895923 ?auto_895926 ) ) ( not ( = ?auto_895923 ?auto_895927 ) ) ( not ( = ?auto_895923 ?auto_895928 ) ) ( not ( = ?auto_895923 ?auto_895929 ) ) ( not ( = ?auto_895923 ?auto_895930 ) ) ( not ( = ?auto_895923 ?auto_895931 ) ) ( not ( = ?auto_895923 ?auto_895932 ) ) ( not ( = ?auto_895923 ?auto_895933 ) ) ( not ( = ?auto_895923 ?auto_895934 ) ) ( not ( = ?auto_895923 ?auto_895935 ) ) ( not ( = ?auto_895923 ?auto_895936 ) ) ( not ( = ?auto_895923 ?auto_895937 ) ) ( not ( = ?auto_895923 ?auto_895938 ) ) ( not ( = ?auto_895923 ?auto_895939 ) ) ( not ( = ?auto_895924 ?auto_895925 ) ) ( not ( = ?auto_895924 ?auto_895926 ) ) ( not ( = ?auto_895924 ?auto_895927 ) ) ( not ( = ?auto_895924 ?auto_895928 ) ) ( not ( = ?auto_895924 ?auto_895929 ) ) ( not ( = ?auto_895924 ?auto_895930 ) ) ( not ( = ?auto_895924 ?auto_895931 ) ) ( not ( = ?auto_895924 ?auto_895932 ) ) ( not ( = ?auto_895924 ?auto_895933 ) ) ( not ( = ?auto_895924 ?auto_895934 ) ) ( not ( = ?auto_895924 ?auto_895935 ) ) ( not ( = ?auto_895924 ?auto_895936 ) ) ( not ( = ?auto_895924 ?auto_895937 ) ) ( not ( = ?auto_895924 ?auto_895938 ) ) ( not ( = ?auto_895924 ?auto_895939 ) ) ( not ( = ?auto_895925 ?auto_895926 ) ) ( not ( = ?auto_895925 ?auto_895927 ) ) ( not ( = ?auto_895925 ?auto_895928 ) ) ( not ( = ?auto_895925 ?auto_895929 ) ) ( not ( = ?auto_895925 ?auto_895930 ) ) ( not ( = ?auto_895925 ?auto_895931 ) ) ( not ( = ?auto_895925 ?auto_895932 ) ) ( not ( = ?auto_895925 ?auto_895933 ) ) ( not ( = ?auto_895925 ?auto_895934 ) ) ( not ( = ?auto_895925 ?auto_895935 ) ) ( not ( = ?auto_895925 ?auto_895936 ) ) ( not ( = ?auto_895925 ?auto_895937 ) ) ( not ( = ?auto_895925 ?auto_895938 ) ) ( not ( = ?auto_895925 ?auto_895939 ) ) ( not ( = ?auto_895926 ?auto_895927 ) ) ( not ( = ?auto_895926 ?auto_895928 ) ) ( not ( = ?auto_895926 ?auto_895929 ) ) ( not ( = ?auto_895926 ?auto_895930 ) ) ( not ( = ?auto_895926 ?auto_895931 ) ) ( not ( = ?auto_895926 ?auto_895932 ) ) ( not ( = ?auto_895926 ?auto_895933 ) ) ( not ( = ?auto_895926 ?auto_895934 ) ) ( not ( = ?auto_895926 ?auto_895935 ) ) ( not ( = ?auto_895926 ?auto_895936 ) ) ( not ( = ?auto_895926 ?auto_895937 ) ) ( not ( = ?auto_895926 ?auto_895938 ) ) ( not ( = ?auto_895926 ?auto_895939 ) ) ( not ( = ?auto_895927 ?auto_895928 ) ) ( not ( = ?auto_895927 ?auto_895929 ) ) ( not ( = ?auto_895927 ?auto_895930 ) ) ( not ( = ?auto_895927 ?auto_895931 ) ) ( not ( = ?auto_895927 ?auto_895932 ) ) ( not ( = ?auto_895927 ?auto_895933 ) ) ( not ( = ?auto_895927 ?auto_895934 ) ) ( not ( = ?auto_895927 ?auto_895935 ) ) ( not ( = ?auto_895927 ?auto_895936 ) ) ( not ( = ?auto_895927 ?auto_895937 ) ) ( not ( = ?auto_895927 ?auto_895938 ) ) ( not ( = ?auto_895927 ?auto_895939 ) ) ( not ( = ?auto_895928 ?auto_895929 ) ) ( not ( = ?auto_895928 ?auto_895930 ) ) ( not ( = ?auto_895928 ?auto_895931 ) ) ( not ( = ?auto_895928 ?auto_895932 ) ) ( not ( = ?auto_895928 ?auto_895933 ) ) ( not ( = ?auto_895928 ?auto_895934 ) ) ( not ( = ?auto_895928 ?auto_895935 ) ) ( not ( = ?auto_895928 ?auto_895936 ) ) ( not ( = ?auto_895928 ?auto_895937 ) ) ( not ( = ?auto_895928 ?auto_895938 ) ) ( not ( = ?auto_895928 ?auto_895939 ) ) ( not ( = ?auto_895929 ?auto_895930 ) ) ( not ( = ?auto_895929 ?auto_895931 ) ) ( not ( = ?auto_895929 ?auto_895932 ) ) ( not ( = ?auto_895929 ?auto_895933 ) ) ( not ( = ?auto_895929 ?auto_895934 ) ) ( not ( = ?auto_895929 ?auto_895935 ) ) ( not ( = ?auto_895929 ?auto_895936 ) ) ( not ( = ?auto_895929 ?auto_895937 ) ) ( not ( = ?auto_895929 ?auto_895938 ) ) ( not ( = ?auto_895929 ?auto_895939 ) ) ( not ( = ?auto_895930 ?auto_895931 ) ) ( not ( = ?auto_895930 ?auto_895932 ) ) ( not ( = ?auto_895930 ?auto_895933 ) ) ( not ( = ?auto_895930 ?auto_895934 ) ) ( not ( = ?auto_895930 ?auto_895935 ) ) ( not ( = ?auto_895930 ?auto_895936 ) ) ( not ( = ?auto_895930 ?auto_895937 ) ) ( not ( = ?auto_895930 ?auto_895938 ) ) ( not ( = ?auto_895930 ?auto_895939 ) ) ( not ( = ?auto_895931 ?auto_895932 ) ) ( not ( = ?auto_895931 ?auto_895933 ) ) ( not ( = ?auto_895931 ?auto_895934 ) ) ( not ( = ?auto_895931 ?auto_895935 ) ) ( not ( = ?auto_895931 ?auto_895936 ) ) ( not ( = ?auto_895931 ?auto_895937 ) ) ( not ( = ?auto_895931 ?auto_895938 ) ) ( not ( = ?auto_895931 ?auto_895939 ) ) ( not ( = ?auto_895932 ?auto_895933 ) ) ( not ( = ?auto_895932 ?auto_895934 ) ) ( not ( = ?auto_895932 ?auto_895935 ) ) ( not ( = ?auto_895932 ?auto_895936 ) ) ( not ( = ?auto_895932 ?auto_895937 ) ) ( not ( = ?auto_895932 ?auto_895938 ) ) ( not ( = ?auto_895932 ?auto_895939 ) ) ( not ( = ?auto_895933 ?auto_895934 ) ) ( not ( = ?auto_895933 ?auto_895935 ) ) ( not ( = ?auto_895933 ?auto_895936 ) ) ( not ( = ?auto_895933 ?auto_895937 ) ) ( not ( = ?auto_895933 ?auto_895938 ) ) ( not ( = ?auto_895933 ?auto_895939 ) ) ( not ( = ?auto_895934 ?auto_895935 ) ) ( not ( = ?auto_895934 ?auto_895936 ) ) ( not ( = ?auto_895934 ?auto_895937 ) ) ( not ( = ?auto_895934 ?auto_895938 ) ) ( not ( = ?auto_895934 ?auto_895939 ) ) ( not ( = ?auto_895935 ?auto_895936 ) ) ( not ( = ?auto_895935 ?auto_895937 ) ) ( not ( = ?auto_895935 ?auto_895938 ) ) ( not ( = ?auto_895935 ?auto_895939 ) ) ( not ( = ?auto_895936 ?auto_895937 ) ) ( not ( = ?auto_895936 ?auto_895938 ) ) ( not ( = ?auto_895936 ?auto_895939 ) ) ( not ( = ?auto_895937 ?auto_895938 ) ) ( not ( = ?auto_895937 ?auto_895939 ) ) ( not ( = ?auto_895938 ?auto_895939 ) ) ( ON ?auto_895937 ?auto_895938 ) ( ON ?auto_895936 ?auto_895937 ) ( ON ?auto_895935 ?auto_895936 ) ( ON ?auto_895934 ?auto_895935 ) ( ON ?auto_895933 ?auto_895934 ) ( CLEAR ?auto_895931 ) ( ON ?auto_895932 ?auto_895933 ) ( CLEAR ?auto_895932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_895922 ?auto_895923 ?auto_895924 ?auto_895925 ?auto_895926 ?auto_895927 ?auto_895928 ?auto_895929 ?auto_895930 ?auto_895931 ?auto_895932 )
      ( MAKE-17PILE ?auto_895922 ?auto_895923 ?auto_895924 ?auto_895925 ?auto_895926 ?auto_895927 ?auto_895928 ?auto_895929 ?auto_895930 ?auto_895931 ?auto_895932 ?auto_895933 ?auto_895934 ?auto_895935 ?auto_895936 ?auto_895937 ?auto_895938 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_895992 - BLOCK
      ?auto_895993 - BLOCK
      ?auto_895994 - BLOCK
      ?auto_895995 - BLOCK
      ?auto_895996 - BLOCK
      ?auto_895997 - BLOCK
      ?auto_895998 - BLOCK
      ?auto_895999 - BLOCK
      ?auto_896000 - BLOCK
      ?auto_896001 - BLOCK
      ?auto_896002 - BLOCK
      ?auto_896003 - BLOCK
      ?auto_896004 - BLOCK
      ?auto_896005 - BLOCK
      ?auto_896006 - BLOCK
      ?auto_896007 - BLOCK
      ?auto_896008 - BLOCK
    )
    :vars
    (
      ?auto_896009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896008 ?auto_896009 ) ( ON-TABLE ?auto_895992 ) ( ON ?auto_895993 ?auto_895992 ) ( ON ?auto_895994 ?auto_895993 ) ( ON ?auto_895995 ?auto_895994 ) ( ON ?auto_895996 ?auto_895995 ) ( ON ?auto_895997 ?auto_895996 ) ( ON ?auto_895998 ?auto_895997 ) ( ON ?auto_895999 ?auto_895998 ) ( ON ?auto_896000 ?auto_895999 ) ( not ( = ?auto_895992 ?auto_895993 ) ) ( not ( = ?auto_895992 ?auto_895994 ) ) ( not ( = ?auto_895992 ?auto_895995 ) ) ( not ( = ?auto_895992 ?auto_895996 ) ) ( not ( = ?auto_895992 ?auto_895997 ) ) ( not ( = ?auto_895992 ?auto_895998 ) ) ( not ( = ?auto_895992 ?auto_895999 ) ) ( not ( = ?auto_895992 ?auto_896000 ) ) ( not ( = ?auto_895992 ?auto_896001 ) ) ( not ( = ?auto_895992 ?auto_896002 ) ) ( not ( = ?auto_895992 ?auto_896003 ) ) ( not ( = ?auto_895992 ?auto_896004 ) ) ( not ( = ?auto_895992 ?auto_896005 ) ) ( not ( = ?auto_895992 ?auto_896006 ) ) ( not ( = ?auto_895992 ?auto_896007 ) ) ( not ( = ?auto_895992 ?auto_896008 ) ) ( not ( = ?auto_895992 ?auto_896009 ) ) ( not ( = ?auto_895993 ?auto_895994 ) ) ( not ( = ?auto_895993 ?auto_895995 ) ) ( not ( = ?auto_895993 ?auto_895996 ) ) ( not ( = ?auto_895993 ?auto_895997 ) ) ( not ( = ?auto_895993 ?auto_895998 ) ) ( not ( = ?auto_895993 ?auto_895999 ) ) ( not ( = ?auto_895993 ?auto_896000 ) ) ( not ( = ?auto_895993 ?auto_896001 ) ) ( not ( = ?auto_895993 ?auto_896002 ) ) ( not ( = ?auto_895993 ?auto_896003 ) ) ( not ( = ?auto_895993 ?auto_896004 ) ) ( not ( = ?auto_895993 ?auto_896005 ) ) ( not ( = ?auto_895993 ?auto_896006 ) ) ( not ( = ?auto_895993 ?auto_896007 ) ) ( not ( = ?auto_895993 ?auto_896008 ) ) ( not ( = ?auto_895993 ?auto_896009 ) ) ( not ( = ?auto_895994 ?auto_895995 ) ) ( not ( = ?auto_895994 ?auto_895996 ) ) ( not ( = ?auto_895994 ?auto_895997 ) ) ( not ( = ?auto_895994 ?auto_895998 ) ) ( not ( = ?auto_895994 ?auto_895999 ) ) ( not ( = ?auto_895994 ?auto_896000 ) ) ( not ( = ?auto_895994 ?auto_896001 ) ) ( not ( = ?auto_895994 ?auto_896002 ) ) ( not ( = ?auto_895994 ?auto_896003 ) ) ( not ( = ?auto_895994 ?auto_896004 ) ) ( not ( = ?auto_895994 ?auto_896005 ) ) ( not ( = ?auto_895994 ?auto_896006 ) ) ( not ( = ?auto_895994 ?auto_896007 ) ) ( not ( = ?auto_895994 ?auto_896008 ) ) ( not ( = ?auto_895994 ?auto_896009 ) ) ( not ( = ?auto_895995 ?auto_895996 ) ) ( not ( = ?auto_895995 ?auto_895997 ) ) ( not ( = ?auto_895995 ?auto_895998 ) ) ( not ( = ?auto_895995 ?auto_895999 ) ) ( not ( = ?auto_895995 ?auto_896000 ) ) ( not ( = ?auto_895995 ?auto_896001 ) ) ( not ( = ?auto_895995 ?auto_896002 ) ) ( not ( = ?auto_895995 ?auto_896003 ) ) ( not ( = ?auto_895995 ?auto_896004 ) ) ( not ( = ?auto_895995 ?auto_896005 ) ) ( not ( = ?auto_895995 ?auto_896006 ) ) ( not ( = ?auto_895995 ?auto_896007 ) ) ( not ( = ?auto_895995 ?auto_896008 ) ) ( not ( = ?auto_895995 ?auto_896009 ) ) ( not ( = ?auto_895996 ?auto_895997 ) ) ( not ( = ?auto_895996 ?auto_895998 ) ) ( not ( = ?auto_895996 ?auto_895999 ) ) ( not ( = ?auto_895996 ?auto_896000 ) ) ( not ( = ?auto_895996 ?auto_896001 ) ) ( not ( = ?auto_895996 ?auto_896002 ) ) ( not ( = ?auto_895996 ?auto_896003 ) ) ( not ( = ?auto_895996 ?auto_896004 ) ) ( not ( = ?auto_895996 ?auto_896005 ) ) ( not ( = ?auto_895996 ?auto_896006 ) ) ( not ( = ?auto_895996 ?auto_896007 ) ) ( not ( = ?auto_895996 ?auto_896008 ) ) ( not ( = ?auto_895996 ?auto_896009 ) ) ( not ( = ?auto_895997 ?auto_895998 ) ) ( not ( = ?auto_895997 ?auto_895999 ) ) ( not ( = ?auto_895997 ?auto_896000 ) ) ( not ( = ?auto_895997 ?auto_896001 ) ) ( not ( = ?auto_895997 ?auto_896002 ) ) ( not ( = ?auto_895997 ?auto_896003 ) ) ( not ( = ?auto_895997 ?auto_896004 ) ) ( not ( = ?auto_895997 ?auto_896005 ) ) ( not ( = ?auto_895997 ?auto_896006 ) ) ( not ( = ?auto_895997 ?auto_896007 ) ) ( not ( = ?auto_895997 ?auto_896008 ) ) ( not ( = ?auto_895997 ?auto_896009 ) ) ( not ( = ?auto_895998 ?auto_895999 ) ) ( not ( = ?auto_895998 ?auto_896000 ) ) ( not ( = ?auto_895998 ?auto_896001 ) ) ( not ( = ?auto_895998 ?auto_896002 ) ) ( not ( = ?auto_895998 ?auto_896003 ) ) ( not ( = ?auto_895998 ?auto_896004 ) ) ( not ( = ?auto_895998 ?auto_896005 ) ) ( not ( = ?auto_895998 ?auto_896006 ) ) ( not ( = ?auto_895998 ?auto_896007 ) ) ( not ( = ?auto_895998 ?auto_896008 ) ) ( not ( = ?auto_895998 ?auto_896009 ) ) ( not ( = ?auto_895999 ?auto_896000 ) ) ( not ( = ?auto_895999 ?auto_896001 ) ) ( not ( = ?auto_895999 ?auto_896002 ) ) ( not ( = ?auto_895999 ?auto_896003 ) ) ( not ( = ?auto_895999 ?auto_896004 ) ) ( not ( = ?auto_895999 ?auto_896005 ) ) ( not ( = ?auto_895999 ?auto_896006 ) ) ( not ( = ?auto_895999 ?auto_896007 ) ) ( not ( = ?auto_895999 ?auto_896008 ) ) ( not ( = ?auto_895999 ?auto_896009 ) ) ( not ( = ?auto_896000 ?auto_896001 ) ) ( not ( = ?auto_896000 ?auto_896002 ) ) ( not ( = ?auto_896000 ?auto_896003 ) ) ( not ( = ?auto_896000 ?auto_896004 ) ) ( not ( = ?auto_896000 ?auto_896005 ) ) ( not ( = ?auto_896000 ?auto_896006 ) ) ( not ( = ?auto_896000 ?auto_896007 ) ) ( not ( = ?auto_896000 ?auto_896008 ) ) ( not ( = ?auto_896000 ?auto_896009 ) ) ( not ( = ?auto_896001 ?auto_896002 ) ) ( not ( = ?auto_896001 ?auto_896003 ) ) ( not ( = ?auto_896001 ?auto_896004 ) ) ( not ( = ?auto_896001 ?auto_896005 ) ) ( not ( = ?auto_896001 ?auto_896006 ) ) ( not ( = ?auto_896001 ?auto_896007 ) ) ( not ( = ?auto_896001 ?auto_896008 ) ) ( not ( = ?auto_896001 ?auto_896009 ) ) ( not ( = ?auto_896002 ?auto_896003 ) ) ( not ( = ?auto_896002 ?auto_896004 ) ) ( not ( = ?auto_896002 ?auto_896005 ) ) ( not ( = ?auto_896002 ?auto_896006 ) ) ( not ( = ?auto_896002 ?auto_896007 ) ) ( not ( = ?auto_896002 ?auto_896008 ) ) ( not ( = ?auto_896002 ?auto_896009 ) ) ( not ( = ?auto_896003 ?auto_896004 ) ) ( not ( = ?auto_896003 ?auto_896005 ) ) ( not ( = ?auto_896003 ?auto_896006 ) ) ( not ( = ?auto_896003 ?auto_896007 ) ) ( not ( = ?auto_896003 ?auto_896008 ) ) ( not ( = ?auto_896003 ?auto_896009 ) ) ( not ( = ?auto_896004 ?auto_896005 ) ) ( not ( = ?auto_896004 ?auto_896006 ) ) ( not ( = ?auto_896004 ?auto_896007 ) ) ( not ( = ?auto_896004 ?auto_896008 ) ) ( not ( = ?auto_896004 ?auto_896009 ) ) ( not ( = ?auto_896005 ?auto_896006 ) ) ( not ( = ?auto_896005 ?auto_896007 ) ) ( not ( = ?auto_896005 ?auto_896008 ) ) ( not ( = ?auto_896005 ?auto_896009 ) ) ( not ( = ?auto_896006 ?auto_896007 ) ) ( not ( = ?auto_896006 ?auto_896008 ) ) ( not ( = ?auto_896006 ?auto_896009 ) ) ( not ( = ?auto_896007 ?auto_896008 ) ) ( not ( = ?auto_896007 ?auto_896009 ) ) ( not ( = ?auto_896008 ?auto_896009 ) ) ( ON ?auto_896007 ?auto_896008 ) ( ON ?auto_896006 ?auto_896007 ) ( ON ?auto_896005 ?auto_896006 ) ( ON ?auto_896004 ?auto_896005 ) ( ON ?auto_896003 ?auto_896004 ) ( ON ?auto_896002 ?auto_896003 ) ( CLEAR ?auto_896000 ) ( ON ?auto_896001 ?auto_896002 ) ( CLEAR ?auto_896001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_895992 ?auto_895993 ?auto_895994 ?auto_895995 ?auto_895996 ?auto_895997 ?auto_895998 ?auto_895999 ?auto_896000 ?auto_896001 )
      ( MAKE-17PILE ?auto_895992 ?auto_895993 ?auto_895994 ?auto_895995 ?auto_895996 ?auto_895997 ?auto_895998 ?auto_895999 ?auto_896000 ?auto_896001 ?auto_896002 ?auto_896003 ?auto_896004 ?auto_896005 ?auto_896006 ?auto_896007 ?auto_896008 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896062 - BLOCK
      ?auto_896063 - BLOCK
      ?auto_896064 - BLOCK
      ?auto_896065 - BLOCK
      ?auto_896066 - BLOCK
      ?auto_896067 - BLOCK
      ?auto_896068 - BLOCK
      ?auto_896069 - BLOCK
      ?auto_896070 - BLOCK
      ?auto_896071 - BLOCK
      ?auto_896072 - BLOCK
      ?auto_896073 - BLOCK
      ?auto_896074 - BLOCK
      ?auto_896075 - BLOCK
      ?auto_896076 - BLOCK
      ?auto_896077 - BLOCK
      ?auto_896078 - BLOCK
    )
    :vars
    (
      ?auto_896079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896078 ?auto_896079 ) ( ON-TABLE ?auto_896062 ) ( ON ?auto_896063 ?auto_896062 ) ( ON ?auto_896064 ?auto_896063 ) ( ON ?auto_896065 ?auto_896064 ) ( ON ?auto_896066 ?auto_896065 ) ( ON ?auto_896067 ?auto_896066 ) ( ON ?auto_896068 ?auto_896067 ) ( ON ?auto_896069 ?auto_896068 ) ( not ( = ?auto_896062 ?auto_896063 ) ) ( not ( = ?auto_896062 ?auto_896064 ) ) ( not ( = ?auto_896062 ?auto_896065 ) ) ( not ( = ?auto_896062 ?auto_896066 ) ) ( not ( = ?auto_896062 ?auto_896067 ) ) ( not ( = ?auto_896062 ?auto_896068 ) ) ( not ( = ?auto_896062 ?auto_896069 ) ) ( not ( = ?auto_896062 ?auto_896070 ) ) ( not ( = ?auto_896062 ?auto_896071 ) ) ( not ( = ?auto_896062 ?auto_896072 ) ) ( not ( = ?auto_896062 ?auto_896073 ) ) ( not ( = ?auto_896062 ?auto_896074 ) ) ( not ( = ?auto_896062 ?auto_896075 ) ) ( not ( = ?auto_896062 ?auto_896076 ) ) ( not ( = ?auto_896062 ?auto_896077 ) ) ( not ( = ?auto_896062 ?auto_896078 ) ) ( not ( = ?auto_896062 ?auto_896079 ) ) ( not ( = ?auto_896063 ?auto_896064 ) ) ( not ( = ?auto_896063 ?auto_896065 ) ) ( not ( = ?auto_896063 ?auto_896066 ) ) ( not ( = ?auto_896063 ?auto_896067 ) ) ( not ( = ?auto_896063 ?auto_896068 ) ) ( not ( = ?auto_896063 ?auto_896069 ) ) ( not ( = ?auto_896063 ?auto_896070 ) ) ( not ( = ?auto_896063 ?auto_896071 ) ) ( not ( = ?auto_896063 ?auto_896072 ) ) ( not ( = ?auto_896063 ?auto_896073 ) ) ( not ( = ?auto_896063 ?auto_896074 ) ) ( not ( = ?auto_896063 ?auto_896075 ) ) ( not ( = ?auto_896063 ?auto_896076 ) ) ( not ( = ?auto_896063 ?auto_896077 ) ) ( not ( = ?auto_896063 ?auto_896078 ) ) ( not ( = ?auto_896063 ?auto_896079 ) ) ( not ( = ?auto_896064 ?auto_896065 ) ) ( not ( = ?auto_896064 ?auto_896066 ) ) ( not ( = ?auto_896064 ?auto_896067 ) ) ( not ( = ?auto_896064 ?auto_896068 ) ) ( not ( = ?auto_896064 ?auto_896069 ) ) ( not ( = ?auto_896064 ?auto_896070 ) ) ( not ( = ?auto_896064 ?auto_896071 ) ) ( not ( = ?auto_896064 ?auto_896072 ) ) ( not ( = ?auto_896064 ?auto_896073 ) ) ( not ( = ?auto_896064 ?auto_896074 ) ) ( not ( = ?auto_896064 ?auto_896075 ) ) ( not ( = ?auto_896064 ?auto_896076 ) ) ( not ( = ?auto_896064 ?auto_896077 ) ) ( not ( = ?auto_896064 ?auto_896078 ) ) ( not ( = ?auto_896064 ?auto_896079 ) ) ( not ( = ?auto_896065 ?auto_896066 ) ) ( not ( = ?auto_896065 ?auto_896067 ) ) ( not ( = ?auto_896065 ?auto_896068 ) ) ( not ( = ?auto_896065 ?auto_896069 ) ) ( not ( = ?auto_896065 ?auto_896070 ) ) ( not ( = ?auto_896065 ?auto_896071 ) ) ( not ( = ?auto_896065 ?auto_896072 ) ) ( not ( = ?auto_896065 ?auto_896073 ) ) ( not ( = ?auto_896065 ?auto_896074 ) ) ( not ( = ?auto_896065 ?auto_896075 ) ) ( not ( = ?auto_896065 ?auto_896076 ) ) ( not ( = ?auto_896065 ?auto_896077 ) ) ( not ( = ?auto_896065 ?auto_896078 ) ) ( not ( = ?auto_896065 ?auto_896079 ) ) ( not ( = ?auto_896066 ?auto_896067 ) ) ( not ( = ?auto_896066 ?auto_896068 ) ) ( not ( = ?auto_896066 ?auto_896069 ) ) ( not ( = ?auto_896066 ?auto_896070 ) ) ( not ( = ?auto_896066 ?auto_896071 ) ) ( not ( = ?auto_896066 ?auto_896072 ) ) ( not ( = ?auto_896066 ?auto_896073 ) ) ( not ( = ?auto_896066 ?auto_896074 ) ) ( not ( = ?auto_896066 ?auto_896075 ) ) ( not ( = ?auto_896066 ?auto_896076 ) ) ( not ( = ?auto_896066 ?auto_896077 ) ) ( not ( = ?auto_896066 ?auto_896078 ) ) ( not ( = ?auto_896066 ?auto_896079 ) ) ( not ( = ?auto_896067 ?auto_896068 ) ) ( not ( = ?auto_896067 ?auto_896069 ) ) ( not ( = ?auto_896067 ?auto_896070 ) ) ( not ( = ?auto_896067 ?auto_896071 ) ) ( not ( = ?auto_896067 ?auto_896072 ) ) ( not ( = ?auto_896067 ?auto_896073 ) ) ( not ( = ?auto_896067 ?auto_896074 ) ) ( not ( = ?auto_896067 ?auto_896075 ) ) ( not ( = ?auto_896067 ?auto_896076 ) ) ( not ( = ?auto_896067 ?auto_896077 ) ) ( not ( = ?auto_896067 ?auto_896078 ) ) ( not ( = ?auto_896067 ?auto_896079 ) ) ( not ( = ?auto_896068 ?auto_896069 ) ) ( not ( = ?auto_896068 ?auto_896070 ) ) ( not ( = ?auto_896068 ?auto_896071 ) ) ( not ( = ?auto_896068 ?auto_896072 ) ) ( not ( = ?auto_896068 ?auto_896073 ) ) ( not ( = ?auto_896068 ?auto_896074 ) ) ( not ( = ?auto_896068 ?auto_896075 ) ) ( not ( = ?auto_896068 ?auto_896076 ) ) ( not ( = ?auto_896068 ?auto_896077 ) ) ( not ( = ?auto_896068 ?auto_896078 ) ) ( not ( = ?auto_896068 ?auto_896079 ) ) ( not ( = ?auto_896069 ?auto_896070 ) ) ( not ( = ?auto_896069 ?auto_896071 ) ) ( not ( = ?auto_896069 ?auto_896072 ) ) ( not ( = ?auto_896069 ?auto_896073 ) ) ( not ( = ?auto_896069 ?auto_896074 ) ) ( not ( = ?auto_896069 ?auto_896075 ) ) ( not ( = ?auto_896069 ?auto_896076 ) ) ( not ( = ?auto_896069 ?auto_896077 ) ) ( not ( = ?auto_896069 ?auto_896078 ) ) ( not ( = ?auto_896069 ?auto_896079 ) ) ( not ( = ?auto_896070 ?auto_896071 ) ) ( not ( = ?auto_896070 ?auto_896072 ) ) ( not ( = ?auto_896070 ?auto_896073 ) ) ( not ( = ?auto_896070 ?auto_896074 ) ) ( not ( = ?auto_896070 ?auto_896075 ) ) ( not ( = ?auto_896070 ?auto_896076 ) ) ( not ( = ?auto_896070 ?auto_896077 ) ) ( not ( = ?auto_896070 ?auto_896078 ) ) ( not ( = ?auto_896070 ?auto_896079 ) ) ( not ( = ?auto_896071 ?auto_896072 ) ) ( not ( = ?auto_896071 ?auto_896073 ) ) ( not ( = ?auto_896071 ?auto_896074 ) ) ( not ( = ?auto_896071 ?auto_896075 ) ) ( not ( = ?auto_896071 ?auto_896076 ) ) ( not ( = ?auto_896071 ?auto_896077 ) ) ( not ( = ?auto_896071 ?auto_896078 ) ) ( not ( = ?auto_896071 ?auto_896079 ) ) ( not ( = ?auto_896072 ?auto_896073 ) ) ( not ( = ?auto_896072 ?auto_896074 ) ) ( not ( = ?auto_896072 ?auto_896075 ) ) ( not ( = ?auto_896072 ?auto_896076 ) ) ( not ( = ?auto_896072 ?auto_896077 ) ) ( not ( = ?auto_896072 ?auto_896078 ) ) ( not ( = ?auto_896072 ?auto_896079 ) ) ( not ( = ?auto_896073 ?auto_896074 ) ) ( not ( = ?auto_896073 ?auto_896075 ) ) ( not ( = ?auto_896073 ?auto_896076 ) ) ( not ( = ?auto_896073 ?auto_896077 ) ) ( not ( = ?auto_896073 ?auto_896078 ) ) ( not ( = ?auto_896073 ?auto_896079 ) ) ( not ( = ?auto_896074 ?auto_896075 ) ) ( not ( = ?auto_896074 ?auto_896076 ) ) ( not ( = ?auto_896074 ?auto_896077 ) ) ( not ( = ?auto_896074 ?auto_896078 ) ) ( not ( = ?auto_896074 ?auto_896079 ) ) ( not ( = ?auto_896075 ?auto_896076 ) ) ( not ( = ?auto_896075 ?auto_896077 ) ) ( not ( = ?auto_896075 ?auto_896078 ) ) ( not ( = ?auto_896075 ?auto_896079 ) ) ( not ( = ?auto_896076 ?auto_896077 ) ) ( not ( = ?auto_896076 ?auto_896078 ) ) ( not ( = ?auto_896076 ?auto_896079 ) ) ( not ( = ?auto_896077 ?auto_896078 ) ) ( not ( = ?auto_896077 ?auto_896079 ) ) ( not ( = ?auto_896078 ?auto_896079 ) ) ( ON ?auto_896077 ?auto_896078 ) ( ON ?auto_896076 ?auto_896077 ) ( ON ?auto_896075 ?auto_896076 ) ( ON ?auto_896074 ?auto_896075 ) ( ON ?auto_896073 ?auto_896074 ) ( ON ?auto_896072 ?auto_896073 ) ( ON ?auto_896071 ?auto_896072 ) ( CLEAR ?auto_896069 ) ( ON ?auto_896070 ?auto_896071 ) ( CLEAR ?auto_896070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_896062 ?auto_896063 ?auto_896064 ?auto_896065 ?auto_896066 ?auto_896067 ?auto_896068 ?auto_896069 ?auto_896070 )
      ( MAKE-17PILE ?auto_896062 ?auto_896063 ?auto_896064 ?auto_896065 ?auto_896066 ?auto_896067 ?auto_896068 ?auto_896069 ?auto_896070 ?auto_896071 ?auto_896072 ?auto_896073 ?auto_896074 ?auto_896075 ?auto_896076 ?auto_896077 ?auto_896078 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896132 - BLOCK
      ?auto_896133 - BLOCK
      ?auto_896134 - BLOCK
      ?auto_896135 - BLOCK
      ?auto_896136 - BLOCK
      ?auto_896137 - BLOCK
      ?auto_896138 - BLOCK
      ?auto_896139 - BLOCK
      ?auto_896140 - BLOCK
      ?auto_896141 - BLOCK
      ?auto_896142 - BLOCK
      ?auto_896143 - BLOCK
      ?auto_896144 - BLOCK
      ?auto_896145 - BLOCK
      ?auto_896146 - BLOCK
      ?auto_896147 - BLOCK
      ?auto_896148 - BLOCK
    )
    :vars
    (
      ?auto_896149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896148 ?auto_896149 ) ( ON-TABLE ?auto_896132 ) ( ON ?auto_896133 ?auto_896132 ) ( ON ?auto_896134 ?auto_896133 ) ( ON ?auto_896135 ?auto_896134 ) ( ON ?auto_896136 ?auto_896135 ) ( ON ?auto_896137 ?auto_896136 ) ( ON ?auto_896138 ?auto_896137 ) ( not ( = ?auto_896132 ?auto_896133 ) ) ( not ( = ?auto_896132 ?auto_896134 ) ) ( not ( = ?auto_896132 ?auto_896135 ) ) ( not ( = ?auto_896132 ?auto_896136 ) ) ( not ( = ?auto_896132 ?auto_896137 ) ) ( not ( = ?auto_896132 ?auto_896138 ) ) ( not ( = ?auto_896132 ?auto_896139 ) ) ( not ( = ?auto_896132 ?auto_896140 ) ) ( not ( = ?auto_896132 ?auto_896141 ) ) ( not ( = ?auto_896132 ?auto_896142 ) ) ( not ( = ?auto_896132 ?auto_896143 ) ) ( not ( = ?auto_896132 ?auto_896144 ) ) ( not ( = ?auto_896132 ?auto_896145 ) ) ( not ( = ?auto_896132 ?auto_896146 ) ) ( not ( = ?auto_896132 ?auto_896147 ) ) ( not ( = ?auto_896132 ?auto_896148 ) ) ( not ( = ?auto_896132 ?auto_896149 ) ) ( not ( = ?auto_896133 ?auto_896134 ) ) ( not ( = ?auto_896133 ?auto_896135 ) ) ( not ( = ?auto_896133 ?auto_896136 ) ) ( not ( = ?auto_896133 ?auto_896137 ) ) ( not ( = ?auto_896133 ?auto_896138 ) ) ( not ( = ?auto_896133 ?auto_896139 ) ) ( not ( = ?auto_896133 ?auto_896140 ) ) ( not ( = ?auto_896133 ?auto_896141 ) ) ( not ( = ?auto_896133 ?auto_896142 ) ) ( not ( = ?auto_896133 ?auto_896143 ) ) ( not ( = ?auto_896133 ?auto_896144 ) ) ( not ( = ?auto_896133 ?auto_896145 ) ) ( not ( = ?auto_896133 ?auto_896146 ) ) ( not ( = ?auto_896133 ?auto_896147 ) ) ( not ( = ?auto_896133 ?auto_896148 ) ) ( not ( = ?auto_896133 ?auto_896149 ) ) ( not ( = ?auto_896134 ?auto_896135 ) ) ( not ( = ?auto_896134 ?auto_896136 ) ) ( not ( = ?auto_896134 ?auto_896137 ) ) ( not ( = ?auto_896134 ?auto_896138 ) ) ( not ( = ?auto_896134 ?auto_896139 ) ) ( not ( = ?auto_896134 ?auto_896140 ) ) ( not ( = ?auto_896134 ?auto_896141 ) ) ( not ( = ?auto_896134 ?auto_896142 ) ) ( not ( = ?auto_896134 ?auto_896143 ) ) ( not ( = ?auto_896134 ?auto_896144 ) ) ( not ( = ?auto_896134 ?auto_896145 ) ) ( not ( = ?auto_896134 ?auto_896146 ) ) ( not ( = ?auto_896134 ?auto_896147 ) ) ( not ( = ?auto_896134 ?auto_896148 ) ) ( not ( = ?auto_896134 ?auto_896149 ) ) ( not ( = ?auto_896135 ?auto_896136 ) ) ( not ( = ?auto_896135 ?auto_896137 ) ) ( not ( = ?auto_896135 ?auto_896138 ) ) ( not ( = ?auto_896135 ?auto_896139 ) ) ( not ( = ?auto_896135 ?auto_896140 ) ) ( not ( = ?auto_896135 ?auto_896141 ) ) ( not ( = ?auto_896135 ?auto_896142 ) ) ( not ( = ?auto_896135 ?auto_896143 ) ) ( not ( = ?auto_896135 ?auto_896144 ) ) ( not ( = ?auto_896135 ?auto_896145 ) ) ( not ( = ?auto_896135 ?auto_896146 ) ) ( not ( = ?auto_896135 ?auto_896147 ) ) ( not ( = ?auto_896135 ?auto_896148 ) ) ( not ( = ?auto_896135 ?auto_896149 ) ) ( not ( = ?auto_896136 ?auto_896137 ) ) ( not ( = ?auto_896136 ?auto_896138 ) ) ( not ( = ?auto_896136 ?auto_896139 ) ) ( not ( = ?auto_896136 ?auto_896140 ) ) ( not ( = ?auto_896136 ?auto_896141 ) ) ( not ( = ?auto_896136 ?auto_896142 ) ) ( not ( = ?auto_896136 ?auto_896143 ) ) ( not ( = ?auto_896136 ?auto_896144 ) ) ( not ( = ?auto_896136 ?auto_896145 ) ) ( not ( = ?auto_896136 ?auto_896146 ) ) ( not ( = ?auto_896136 ?auto_896147 ) ) ( not ( = ?auto_896136 ?auto_896148 ) ) ( not ( = ?auto_896136 ?auto_896149 ) ) ( not ( = ?auto_896137 ?auto_896138 ) ) ( not ( = ?auto_896137 ?auto_896139 ) ) ( not ( = ?auto_896137 ?auto_896140 ) ) ( not ( = ?auto_896137 ?auto_896141 ) ) ( not ( = ?auto_896137 ?auto_896142 ) ) ( not ( = ?auto_896137 ?auto_896143 ) ) ( not ( = ?auto_896137 ?auto_896144 ) ) ( not ( = ?auto_896137 ?auto_896145 ) ) ( not ( = ?auto_896137 ?auto_896146 ) ) ( not ( = ?auto_896137 ?auto_896147 ) ) ( not ( = ?auto_896137 ?auto_896148 ) ) ( not ( = ?auto_896137 ?auto_896149 ) ) ( not ( = ?auto_896138 ?auto_896139 ) ) ( not ( = ?auto_896138 ?auto_896140 ) ) ( not ( = ?auto_896138 ?auto_896141 ) ) ( not ( = ?auto_896138 ?auto_896142 ) ) ( not ( = ?auto_896138 ?auto_896143 ) ) ( not ( = ?auto_896138 ?auto_896144 ) ) ( not ( = ?auto_896138 ?auto_896145 ) ) ( not ( = ?auto_896138 ?auto_896146 ) ) ( not ( = ?auto_896138 ?auto_896147 ) ) ( not ( = ?auto_896138 ?auto_896148 ) ) ( not ( = ?auto_896138 ?auto_896149 ) ) ( not ( = ?auto_896139 ?auto_896140 ) ) ( not ( = ?auto_896139 ?auto_896141 ) ) ( not ( = ?auto_896139 ?auto_896142 ) ) ( not ( = ?auto_896139 ?auto_896143 ) ) ( not ( = ?auto_896139 ?auto_896144 ) ) ( not ( = ?auto_896139 ?auto_896145 ) ) ( not ( = ?auto_896139 ?auto_896146 ) ) ( not ( = ?auto_896139 ?auto_896147 ) ) ( not ( = ?auto_896139 ?auto_896148 ) ) ( not ( = ?auto_896139 ?auto_896149 ) ) ( not ( = ?auto_896140 ?auto_896141 ) ) ( not ( = ?auto_896140 ?auto_896142 ) ) ( not ( = ?auto_896140 ?auto_896143 ) ) ( not ( = ?auto_896140 ?auto_896144 ) ) ( not ( = ?auto_896140 ?auto_896145 ) ) ( not ( = ?auto_896140 ?auto_896146 ) ) ( not ( = ?auto_896140 ?auto_896147 ) ) ( not ( = ?auto_896140 ?auto_896148 ) ) ( not ( = ?auto_896140 ?auto_896149 ) ) ( not ( = ?auto_896141 ?auto_896142 ) ) ( not ( = ?auto_896141 ?auto_896143 ) ) ( not ( = ?auto_896141 ?auto_896144 ) ) ( not ( = ?auto_896141 ?auto_896145 ) ) ( not ( = ?auto_896141 ?auto_896146 ) ) ( not ( = ?auto_896141 ?auto_896147 ) ) ( not ( = ?auto_896141 ?auto_896148 ) ) ( not ( = ?auto_896141 ?auto_896149 ) ) ( not ( = ?auto_896142 ?auto_896143 ) ) ( not ( = ?auto_896142 ?auto_896144 ) ) ( not ( = ?auto_896142 ?auto_896145 ) ) ( not ( = ?auto_896142 ?auto_896146 ) ) ( not ( = ?auto_896142 ?auto_896147 ) ) ( not ( = ?auto_896142 ?auto_896148 ) ) ( not ( = ?auto_896142 ?auto_896149 ) ) ( not ( = ?auto_896143 ?auto_896144 ) ) ( not ( = ?auto_896143 ?auto_896145 ) ) ( not ( = ?auto_896143 ?auto_896146 ) ) ( not ( = ?auto_896143 ?auto_896147 ) ) ( not ( = ?auto_896143 ?auto_896148 ) ) ( not ( = ?auto_896143 ?auto_896149 ) ) ( not ( = ?auto_896144 ?auto_896145 ) ) ( not ( = ?auto_896144 ?auto_896146 ) ) ( not ( = ?auto_896144 ?auto_896147 ) ) ( not ( = ?auto_896144 ?auto_896148 ) ) ( not ( = ?auto_896144 ?auto_896149 ) ) ( not ( = ?auto_896145 ?auto_896146 ) ) ( not ( = ?auto_896145 ?auto_896147 ) ) ( not ( = ?auto_896145 ?auto_896148 ) ) ( not ( = ?auto_896145 ?auto_896149 ) ) ( not ( = ?auto_896146 ?auto_896147 ) ) ( not ( = ?auto_896146 ?auto_896148 ) ) ( not ( = ?auto_896146 ?auto_896149 ) ) ( not ( = ?auto_896147 ?auto_896148 ) ) ( not ( = ?auto_896147 ?auto_896149 ) ) ( not ( = ?auto_896148 ?auto_896149 ) ) ( ON ?auto_896147 ?auto_896148 ) ( ON ?auto_896146 ?auto_896147 ) ( ON ?auto_896145 ?auto_896146 ) ( ON ?auto_896144 ?auto_896145 ) ( ON ?auto_896143 ?auto_896144 ) ( ON ?auto_896142 ?auto_896143 ) ( ON ?auto_896141 ?auto_896142 ) ( ON ?auto_896140 ?auto_896141 ) ( CLEAR ?auto_896138 ) ( ON ?auto_896139 ?auto_896140 ) ( CLEAR ?auto_896139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_896132 ?auto_896133 ?auto_896134 ?auto_896135 ?auto_896136 ?auto_896137 ?auto_896138 ?auto_896139 )
      ( MAKE-17PILE ?auto_896132 ?auto_896133 ?auto_896134 ?auto_896135 ?auto_896136 ?auto_896137 ?auto_896138 ?auto_896139 ?auto_896140 ?auto_896141 ?auto_896142 ?auto_896143 ?auto_896144 ?auto_896145 ?auto_896146 ?auto_896147 ?auto_896148 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896202 - BLOCK
      ?auto_896203 - BLOCK
      ?auto_896204 - BLOCK
      ?auto_896205 - BLOCK
      ?auto_896206 - BLOCK
      ?auto_896207 - BLOCK
      ?auto_896208 - BLOCK
      ?auto_896209 - BLOCK
      ?auto_896210 - BLOCK
      ?auto_896211 - BLOCK
      ?auto_896212 - BLOCK
      ?auto_896213 - BLOCK
      ?auto_896214 - BLOCK
      ?auto_896215 - BLOCK
      ?auto_896216 - BLOCK
      ?auto_896217 - BLOCK
      ?auto_896218 - BLOCK
    )
    :vars
    (
      ?auto_896219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896218 ?auto_896219 ) ( ON-TABLE ?auto_896202 ) ( ON ?auto_896203 ?auto_896202 ) ( ON ?auto_896204 ?auto_896203 ) ( ON ?auto_896205 ?auto_896204 ) ( ON ?auto_896206 ?auto_896205 ) ( ON ?auto_896207 ?auto_896206 ) ( not ( = ?auto_896202 ?auto_896203 ) ) ( not ( = ?auto_896202 ?auto_896204 ) ) ( not ( = ?auto_896202 ?auto_896205 ) ) ( not ( = ?auto_896202 ?auto_896206 ) ) ( not ( = ?auto_896202 ?auto_896207 ) ) ( not ( = ?auto_896202 ?auto_896208 ) ) ( not ( = ?auto_896202 ?auto_896209 ) ) ( not ( = ?auto_896202 ?auto_896210 ) ) ( not ( = ?auto_896202 ?auto_896211 ) ) ( not ( = ?auto_896202 ?auto_896212 ) ) ( not ( = ?auto_896202 ?auto_896213 ) ) ( not ( = ?auto_896202 ?auto_896214 ) ) ( not ( = ?auto_896202 ?auto_896215 ) ) ( not ( = ?auto_896202 ?auto_896216 ) ) ( not ( = ?auto_896202 ?auto_896217 ) ) ( not ( = ?auto_896202 ?auto_896218 ) ) ( not ( = ?auto_896202 ?auto_896219 ) ) ( not ( = ?auto_896203 ?auto_896204 ) ) ( not ( = ?auto_896203 ?auto_896205 ) ) ( not ( = ?auto_896203 ?auto_896206 ) ) ( not ( = ?auto_896203 ?auto_896207 ) ) ( not ( = ?auto_896203 ?auto_896208 ) ) ( not ( = ?auto_896203 ?auto_896209 ) ) ( not ( = ?auto_896203 ?auto_896210 ) ) ( not ( = ?auto_896203 ?auto_896211 ) ) ( not ( = ?auto_896203 ?auto_896212 ) ) ( not ( = ?auto_896203 ?auto_896213 ) ) ( not ( = ?auto_896203 ?auto_896214 ) ) ( not ( = ?auto_896203 ?auto_896215 ) ) ( not ( = ?auto_896203 ?auto_896216 ) ) ( not ( = ?auto_896203 ?auto_896217 ) ) ( not ( = ?auto_896203 ?auto_896218 ) ) ( not ( = ?auto_896203 ?auto_896219 ) ) ( not ( = ?auto_896204 ?auto_896205 ) ) ( not ( = ?auto_896204 ?auto_896206 ) ) ( not ( = ?auto_896204 ?auto_896207 ) ) ( not ( = ?auto_896204 ?auto_896208 ) ) ( not ( = ?auto_896204 ?auto_896209 ) ) ( not ( = ?auto_896204 ?auto_896210 ) ) ( not ( = ?auto_896204 ?auto_896211 ) ) ( not ( = ?auto_896204 ?auto_896212 ) ) ( not ( = ?auto_896204 ?auto_896213 ) ) ( not ( = ?auto_896204 ?auto_896214 ) ) ( not ( = ?auto_896204 ?auto_896215 ) ) ( not ( = ?auto_896204 ?auto_896216 ) ) ( not ( = ?auto_896204 ?auto_896217 ) ) ( not ( = ?auto_896204 ?auto_896218 ) ) ( not ( = ?auto_896204 ?auto_896219 ) ) ( not ( = ?auto_896205 ?auto_896206 ) ) ( not ( = ?auto_896205 ?auto_896207 ) ) ( not ( = ?auto_896205 ?auto_896208 ) ) ( not ( = ?auto_896205 ?auto_896209 ) ) ( not ( = ?auto_896205 ?auto_896210 ) ) ( not ( = ?auto_896205 ?auto_896211 ) ) ( not ( = ?auto_896205 ?auto_896212 ) ) ( not ( = ?auto_896205 ?auto_896213 ) ) ( not ( = ?auto_896205 ?auto_896214 ) ) ( not ( = ?auto_896205 ?auto_896215 ) ) ( not ( = ?auto_896205 ?auto_896216 ) ) ( not ( = ?auto_896205 ?auto_896217 ) ) ( not ( = ?auto_896205 ?auto_896218 ) ) ( not ( = ?auto_896205 ?auto_896219 ) ) ( not ( = ?auto_896206 ?auto_896207 ) ) ( not ( = ?auto_896206 ?auto_896208 ) ) ( not ( = ?auto_896206 ?auto_896209 ) ) ( not ( = ?auto_896206 ?auto_896210 ) ) ( not ( = ?auto_896206 ?auto_896211 ) ) ( not ( = ?auto_896206 ?auto_896212 ) ) ( not ( = ?auto_896206 ?auto_896213 ) ) ( not ( = ?auto_896206 ?auto_896214 ) ) ( not ( = ?auto_896206 ?auto_896215 ) ) ( not ( = ?auto_896206 ?auto_896216 ) ) ( not ( = ?auto_896206 ?auto_896217 ) ) ( not ( = ?auto_896206 ?auto_896218 ) ) ( not ( = ?auto_896206 ?auto_896219 ) ) ( not ( = ?auto_896207 ?auto_896208 ) ) ( not ( = ?auto_896207 ?auto_896209 ) ) ( not ( = ?auto_896207 ?auto_896210 ) ) ( not ( = ?auto_896207 ?auto_896211 ) ) ( not ( = ?auto_896207 ?auto_896212 ) ) ( not ( = ?auto_896207 ?auto_896213 ) ) ( not ( = ?auto_896207 ?auto_896214 ) ) ( not ( = ?auto_896207 ?auto_896215 ) ) ( not ( = ?auto_896207 ?auto_896216 ) ) ( not ( = ?auto_896207 ?auto_896217 ) ) ( not ( = ?auto_896207 ?auto_896218 ) ) ( not ( = ?auto_896207 ?auto_896219 ) ) ( not ( = ?auto_896208 ?auto_896209 ) ) ( not ( = ?auto_896208 ?auto_896210 ) ) ( not ( = ?auto_896208 ?auto_896211 ) ) ( not ( = ?auto_896208 ?auto_896212 ) ) ( not ( = ?auto_896208 ?auto_896213 ) ) ( not ( = ?auto_896208 ?auto_896214 ) ) ( not ( = ?auto_896208 ?auto_896215 ) ) ( not ( = ?auto_896208 ?auto_896216 ) ) ( not ( = ?auto_896208 ?auto_896217 ) ) ( not ( = ?auto_896208 ?auto_896218 ) ) ( not ( = ?auto_896208 ?auto_896219 ) ) ( not ( = ?auto_896209 ?auto_896210 ) ) ( not ( = ?auto_896209 ?auto_896211 ) ) ( not ( = ?auto_896209 ?auto_896212 ) ) ( not ( = ?auto_896209 ?auto_896213 ) ) ( not ( = ?auto_896209 ?auto_896214 ) ) ( not ( = ?auto_896209 ?auto_896215 ) ) ( not ( = ?auto_896209 ?auto_896216 ) ) ( not ( = ?auto_896209 ?auto_896217 ) ) ( not ( = ?auto_896209 ?auto_896218 ) ) ( not ( = ?auto_896209 ?auto_896219 ) ) ( not ( = ?auto_896210 ?auto_896211 ) ) ( not ( = ?auto_896210 ?auto_896212 ) ) ( not ( = ?auto_896210 ?auto_896213 ) ) ( not ( = ?auto_896210 ?auto_896214 ) ) ( not ( = ?auto_896210 ?auto_896215 ) ) ( not ( = ?auto_896210 ?auto_896216 ) ) ( not ( = ?auto_896210 ?auto_896217 ) ) ( not ( = ?auto_896210 ?auto_896218 ) ) ( not ( = ?auto_896210 ?auto_896219 ) ) ( not ( = ?auto_896211 ?auto_896212 ) ) ( not ( = ?auto_896211 ?auto_896213 ) ) ( not ( = ?auto_896211 ?auto_896214 ) ) ( not ( = ?auto_896211 ?auto_896215 ) ) ( not ( = ?auto_896211 ?auto_896216 ) ) ( not ( = ?auto_896211 ?auto_896217 ) ) ( not ( = ?auto_896211 ?auto_896218 ) ) ( not ( = ?auto_896211 ?auto_896219 ) ) ( not ( = ?auto_896212 ?auto_896213 ) ) ( not ( = ?auto_896212 ?auto_896214 ) ) ( not ( = ?auto_896212 ?auto_896215 ) ) ( not ( = ?auto_896212 ?auto_896216 ) ) ( not ( = ?auto_896212 ?auto_896217 ) ) ( not ( = ?auto_896212 ?auto_896218 ) ) ( not ( = ?auto_896212 ?auto_896219 ) ) ( not ( = ?auto_896213 ?auto_896214 ) ) ( not ( = ?auto_896213 ?auto_896215 ) ) ( not ( = ?auto_896213 ?auto_896216 ) ) ( not ( = ?auto_896213 ?auto_896217 ) ) ( not ( = ?auto_896213 ?auto_896218 ) ) ( not ( = ?auto_896213 ?auto_896219 ) ) ( not ( = ?auto_896214 ?auto_896215 ) ) ( not ( = ?auto_896214 ?auto_896216 ) ) ( not ( = ?auto_896214 ?auto_896217 ) ) ( not ( = ?auto_896214 ?auto_896218 ) ) ( not ( = ?auto_896214 ?auto_896219 ) ) ( not ( = ?auto_896215 ?auto_896216 ) ) ( not ( = ?auto_896215 ?auto_896217 ) ) ( not ( = ?auto_896215 ?auto_896218 ) ) ( not ( = ?auto_896215 ?auto_896219 ) ) ( not ( = ?auto_896216 ?auto_896217 ) ) ( not ( = ?auto_896216 ?auto_896218 ) ) ( not ( = ?auto_896216 ?auto_896219 ) ) ( not ( = ?auto_896217 ?auto_896218 ) ) ( not ( = ?auto_896217 ?auto_896219 ) ) ( not ( = ?auto_896218 ?auto_896219 ) ) ( ON ?auto_896217 ?auto_896218 ) ( ON ?auto_896216 ?auto_896217 ) ( ON ?auto_896215 ?auto_896216 ) ( ON ?auto_896214 ?auto_896215 ) ( ON ?auto_896213 ?auto_896214 ) ( ON ?auto_896212 ?auto_896213 ) ( ON ?auto_896211 ?auto_896212 ) ( ON ?auto_896210 ?auto_896211 ) ( ON ?auto_896209 ?auto_896210 ) ( CLEAR ?auto_896207 ) ( ON ?auto_896208 ?auto_896209 ) ( CLEAR ?auto_896208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_896202 ?auto_896203 ?auto_896204 ?auto_896205 ?auto_896206 ?auto_896207 ?auto_896208 )
      ( MAKE-17PILE ?auto_896202 ?auto_896203 ?auto_896204 ?auto_896205 ?auto_896206 ?auto_896207 ?auto_896208 ?auto_896209 ?auto_896210 ?auto_896211 ?auto_896212 ?auto_896213 ?auto_896214 ?auto_896215 ?auto_896216 ?auto_896217 ?auto_896218 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896272 - BLOCK
      ?auto_896273 - BLOCK
      ?auto_896274 - BLOCK
      ?auto_896275 - BLOCK
      ?auto_896276 - BLOCK
      ?auto_896277 - BLOCK
      ?auto_896278 - BLOCK
      ?auto_896279 - BLOCK
      ?auto_896280 - BLOCK
      ?auto_896281 - BLOCK
      ?auto_896282 - BLOCK
      ?auto_896283 - BLOCK
      ?auto_896284 - BLOCK
      ?auto_896285 - BLOCK
      ?auto_896286 - BLOCK
      ?auto_896287 - BLOCK
      ?auto_896288 - BLOCK
    )
    :vars
    (
      ?auto_896289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896288 ?auto_896289 ) ( ON-TABLE ?auto_896272 ) ( ON ?auto_896273 ?auto_896272 ) ( ON ?auto_896274 ?auto_896273 ) ( ON ?auto_896275 ?auto_896274 ) ( ON ?auto_896276 ?auto_896275 ) ( not ( = ?auto_896272 ?auto_896273 ) ) ( not ( = ?auto_896272 ?auto_896274 ) ) ( not ( = ?auto_896272 ?auto_896275 ) ) ( not ( = ?auto_896272 ?auto_896276 ) ) ( not ( = ?auto_896272 ?auto_896277 ) ) ( not ( = ?auto_896272 ?auto_896278 ) ) ( not ( = ?auto_896272 ?auto_896279 ) ) ( not ( = ?auto_896272 ?auto_896280 ) ) ( not ( = ?auto_896272 ?auto_896281 ) ) ( not ( = ?auto_896272 ?auto_896282 ) ) ( not ( = ?auto_896272 ?auto_896283 ) ) ( not ( = ?auto_896272 ?auto_896284 ) ) ( not ( = ?auto_896272 ?auto_896285 ) ) ( not ( = ?auto_896272 ?auto_896286 ) ) ( not ( = ?auto_896272 ?auto_896287 ) ) ( not ( = ?auto_896272 ?auto_896288 ) ) ( not ( = ?auto_896272 ?auto_896289 ) ) ( not ( = ?auto_896273 ?auto_896274 ) ) ( not ( = ?auto_896273 ?auto_896275 ) ) ( not ( = ?auto_896273 ?auto_896276 ) ) ( not ( = ?auto_896273 ?auto_896277 ) ) ( not ( = ?auto_896273 ?auto_896278 ) ) ( not ( = ?auto_896273 ?auto_896279 ) ) ( not ( = ?auto_896273 ?auto_896280 ) ) ( not ( = ?auto_896273 ?auto_896281 ) ) ( not ( = ?auto_896273 ?auto_896282 ) ) ( not ( = ?auto_896273 ?auto_896283 ) ) ( not ( = ?auto_896273 ?auto_896284 ) ) ( not ( = ?auto_896273 ?auto_896285 ) ) ( not ( = ?auto_896273 ?auto_896286 ) ) ( not ( = ?auto_896273 ?auto_896287 ) ) ( not ( = ?auto_896273 ?auto_896288 ) ) ( not ( = ?auto_896273 ?auto_896289 ) ) ( not ( = ?auto_896274 ?auto_896275 ) ) ( not ( = ?auto_896274 ?auto_896276 ) ) ( not ( = ?auto_896274 ?auto_896277 ) ) ( not ( = ?auto_896274 ?auto_896278 ) ) ( not ( = ?auto_896274 ?auto_896279 ) ) ( not ( = ?auto_896274 ?auto_896280 ) ) ( not ( = ?auto_896274 ?auto_896281 ) ) ( not ( = ?auto_896274 ?auto_896282 ) ) ( not ( = ?auto_896274 ?auto_896283 ) ) ( not ( = ?auto_896274 ?auto_896284 ) ) ( not ( = ?auto_896274 ?auto_896285 ) ) ( not ( = ?auto_896274 ?auto_896286 ) ) ( not ( = ?auto_896274 ?auto_896287 ) ) ( not ( = ?auto_896274 ?auto_896288 ) ) ( not ( = ?auto_896274 ?auto_896289 ) ) ( not ( = ?auto_896275 ?auto_896276 ) ) ( not ( = ?auto_896275 ?auto_896277 ) ) ( not ( = ?auto_896275 ?auto_896278 ) ) ( not ( = ?auto_896275 ?auto_896279 ) ) ( not ( = ?auto_896275 ?auto_896280 ) ) ( not ( = ?auto_896275 ?auto_896281 ) ) ( not ( = ?auto_896275 ?auto_896282 ) ) ( not ( = ?auto_896275 ?auto_896283 ) ) ( not ( = ?auto_896275 ?auto_896284 ) ) ( not ( = ?auto_896275 ?auto_896285 ) ) ( not ( = ?auto_896275 ?auto_896286 ) ) ( not ( = ?auto_896275 ?auto_896287 ) ) ( not ( = ?auto_896275 ?auto_896288 ) ) ( not ( = ?auto_896275 ?auto_896289 ) ) ( not ( = ?auto_896276 ?auto_896277 ) ) ( not ( = ?auto_896276 ?auto_896278 ) ) ( not ( = ?auto_896276 ?auto_896279 ) ) ( not ( = ?auto_896276 ?auto_896280 ) ) ( not ( = ?auto_896276 ?auto_896281 ) ) ( not ( = ?auto_896276 ?auto_896282 ) ) ( not ( = ?auto_896276 ?auto_896283 ) ) ( not ( = ?auto_896276 ?auto_896284 ) ) ( not ( = ?auto_896276 ?auto_896285 ) ) ( not ( = ?auto_896276 ?auto_896286 ) ) ( not ( = ?auto_896276 ?auto_896287 ) ) ( not ( = ?auto_896276 ?auto_896288 ) ) ( not ( = ?auto_896276 ?auto_896289 ) ) ( not ( = ?auto_896277 ?auto_896278 ) ) ( not ( = ?auto_896277 ?auto_896279 ) ) ( not ( = ?auto_896277 ?auto_896280 ) ) ( not ( = ?auto_896277 ?auto_896281 ) ) ( not ( = ?auto_896277 ?auto_896282 ) ) ( not ( = ?auto_896277 ?auto_896283 ) ) ( not ( = ?auto_896277 ?auto_896284 ) ) ( not ( = ?auto_896277 ?auto_896285 ) ) ( not ( = ?auto_896277 ?auto_896286 ) ) ( not ( = ?auto_896277 ?auto_896287 ) ) ( not ( = ?auto_896277 ?auto_896288 ) ) ( not ( = ?auto_896277 ?auto_896289 ) ) ( not ( = ?auto_896278 ?auto_896279 ) ) ( not ( = ?auto_896278 ?auto_896280 ) ) ( not ( = ?auto_896278 ?auto_896281 ) ) ( not ( = ?auto_896278 ?auto_896282 ) ) ( not ( = ?auto_896278 ?auto_896283 ) ) ( not ( = ?auto_896278 ?auto_896284 ) ) ( not ( = ?auto_896278 ?auto_896285 ) ) ( not ( = ?auto_896278 ?auto_896286 ) ) ( not ( = ?auto_896278 ?auto_896287 ) ) ( not ( = ?auto_896278 ?auto_896288 ) ) ( not ( = ?auto_896278 ?auto_896289 ) ) ( not ( = ?auto_896279 ?auto_896280 ) ) ( not ( = ?auto_896279 ?auto_896281 ) ) ( not ( = ?auto_896279 ?auto_896282 ) ) ( not ( = ?auto_896279 ?auto_896283 ) ) ( not ( = ?auto_896279 ?auto_896284 ) ) ( not ( = ?auto_896279 ?auto_896285 ) ) ( not ( = ?auto_896279 ?auto_896286 ) ) ( not ( = ?auto_896279 ?auto_896287 ) ) ( not ( = ?auto_896279 ?auto_896288 ) ) ( not ( = ?auto_896279 ?auto_896289 ) ) ( not ( = ?auto_896280 ?auto_896281 ) ) ( not ( = ?auto_896280 ?auto_896282 ) ) ( not ( = ?auto_896280 ?auto_896283 ) ) ( not ( = ?auto_896280 ?auto_896284 ) ) ( not ( = ?auto_896280 ?auto_896285 ) ) ( not ( = ?auto_896280 ?auto_896286 ) ) ( not ( = ?auto_896280 ?auto_896287 ) ) ( not ( = ?auto_896280 ?auto_896288 ) ) ( not ( = ?auto_896280 ?auto_896289 ) ) ( not ( = ?auto_896281 ?auto_896282 ) ) ( not ( = ?auto_896281 ?auto_896283 ) ) ( not ( = ?auto_896281 ?auto_896284 ) ) ( not ( = ?auto_896281 ?auto_896285 ) ) ( not ( = ?auto_896281 ?auto_896286 ) ) ( not ( = ?auto_896281 ?auto_896287 ) ) ( not ( = ?auto_896281 ?auto_896288 ) ) ( not ( = ?auto_896281 ?auto_896289 ) ) ( not ( = ?auto_896282 ?auto_896283 ) ) ( not ( = ?auto_896282 ?auto_896284 ) ) ( not ( = ?auto_896282 ?auto_896285 ) ) ( not ( = ?auto_896282 ?auto_896286 ) ) ( not ( = ?auto_896282 ?auto_896287 ) ) ( not ( = ?auto_896282 ?auto_896288 ) ) ( not ( = ?auto_896282 ?auto_896289 ) ) ( not ( = ?auto_896283 ?auto_896284 ) ) ( not ( = ?auto_896283 ?auto_896285 ) ) ( not ( = ?auto_896283 ?auto_896286 ) ) ( not ( = ?auto_896283 ?auto_896287 ) ) ( not ( = ?auto_896283 ?auto_896288 ) ) ( not ( = ?auto_896283 ?auto_896289 ) ) ( not ( = ?auto_896284 ?auto_896285 ) ) ( not ( = ?auto_896284 ?auto_896286 ) ) ( not ( = ?auto_896284 ?auto_896287 ) ) ( not ( = ?auto_896284 ?auto_896288 ) ) ( not ( = ?auto_896284 ?auto_896289 ) ) ( not ( = ?auto_896285 ?auto_896286 ) ) ( not ( = ?auto_896285 ?auto_896287 ) ) ( not ( = ?auto_896285 ?auto_896288 ) ) ( not ( = ?auto_896285 ?auto_896289 ) ) ( not ( = ?auto_896286 ?auto_896287 ) ) ( not ( = ?auto_896286 ?auto_896288 ) ) ( not ( = ?auto_896286 ?auto_896289 ) ) ( not ( = ?auto_896287 ?auto_896288 ) ) ( not ( = ?auto_896287 ?auto_896289 ) ) ( not ( = ?auto_896288 ?auto_896289 ) ) ( ON ?auto_896287 ?auto_896288 ) ( ON ?auto_896286 ?auto_896287 ) ( ON ?auto_896285 ?auto_896286 ) ( ON ?auto_896284 ?auto_896285 ) ( ON ?auto_896283 ?auto_896284 ) ( ON ?auto_896282 ?auto_896283 ) ( ON ?auto_896281 ?auto_896282 ) ( ON ?auto_896280 ?auto_896281 ) ( ON ?auto_896279 ?auto_896280 ) ( ON ?auto_896278 ?auto_896279 ) ( CLEAR ?auto_896276 ) ( ON ?auto_896277 ?auto_896278 ) ( CLEAR ?auto_896277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_896272 ?auto_896273 ?auto_896274 ?auto_896275 ?auto_896276 ?auto_896277 )
      ( MAKE-17PILE ?auto_896272 ?auto_896273 ?auto_896274 ?auto_896275 ?auto_896276 ?auto_896277 ?auto_896278 ?auto_896279 ?auto_896280 ?auto_896281 ?auto_896282 ?auto_896283 ?auto_896284 ?auto_896285 ?auto_896286 ?auto_896287 ?auto_896288 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896342 - BLOCK
      ?auto_896343 - BLOCK
      ?auto_896344 - BLOCK
      ?auto_896345 - BLOCK
      ?auto_896346 - BLOCK
      ?auto_896347 - BLOCK
      ?auto_896348 - BLOCK
      ?auto_896349 - BLOCK
      ?auto_896350 - BLOCK
      ?auto_896351 - BLOCK
      ?auto_896352 - BLOCK
      ?auto_896353 - BLOCK
      ?auto_896354 - BLOCK
      ?auto_896355 - BLOCK
      ?auto_896356 - BLOCK
      ?auto_896357 - BLOCK
      ?auto_896358 - BLOCK
    )
    :vars
    (
      ?auto_896359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896358 ?auto_896359 ) ( ON-TABLE ?auto_896342 ) ( ON ?auto_896343 ?auto_896342 ) ( ON ?auto_896344 ?auto_896343 ) ( ON ?auto_896345 ?auto_896344 ) ( not ( = ?auto_896342 ?auto_896343 ) ) ( not ( = ?auto_896342 ?auto_896344 ) ) ( not ( = ?auto_896342 ?auto_896345 ) ) ( not ( = ?auto_896342 ?auto_896346 ) ) ( not ( = ?auto_896342 ?auto_896347 ) ) ( not ( = ?auto_896342 ?auto_896348 ) ) ( not ( = ?auto_896342 ?auto_896349 ) ) ( not ( = ?auto_896342 ?auto_896350 ) ) ( not ( = ?auto_896342 ?auto_896351 ) ) ( not ( = ?auto_896342 ?auto_896352 ) ) ( not ( = ?auto_896342 ?auto_896353 ) ) ( not ( = ?auto_896342 ?auto_896354 ) ) ( not ( = ?auto_896342 ?auto_896355 ) ) ( not ( = ?auto_896342 ?auto_896356 ) ) ( not ( = ?auto_896342 ?auto_896357 ) ) ( not ( = ?auto_896342 ?auto_896358 ) ) ( not ( = ?auto_896342 ?auto_896359 ) ) ( not ( = ?auto_896343 ?auto_896344 ) ) ( not ( = ?auto_896343 ?auto_896345 ) ) ( not ( = ?auto_896343 ?auto_896346 ) ) ( not ( = ?auto_896343 ?auto_896347 ) ) ( not ( = ?auto_896343 ?auto_896348 ) ) ( not ( = ?auto_896343 ?auto_896349 ) ) ( not ( = ?auto_896343 ?auto_896350 ) ) ( not ( = ?auto_896343 ?auto_896351 ) ) ( not ( = ?auto_896343 ?auto_896352 ) ) ( not ( = ?auto_896343 ?auto_896353 ) ) ( not ( = ?auto_896343 ?auto_896354 ) ) ( not ( = ?auto_896343 ?auto_896355 ) ) ( not ( = ?auto_896343 ?auto_896356 ) ) ( not ( = ?auto_896343 ?auto_896357 ) ) ( not ( = ?auto_896343 ?auto_896358 ) ) ( not ( = ?auto_896343 ?auto_896359 ) ) ( not ( = ?auto_896344 ?auto_896345 ) ) ( not ( = ?auto_896344 ?auto_896346 ) ) ( not ( = ?auto_896344 ?auto_896347 ) ) ( not ( = ?auto_896344 ?auto_896348 ) ) ( not ( = ?auto_896344 ?auto_896349 ) ) ( not ( = ?auto_896344 ?auto_896350 ) ) ( not ( = ?auto_896344 ?auto_896351 ) ) ( not ( = ?auto_896344 ?auto_896352 ) ) ( not ( = ?auto_896344 ?auto_896353 ) ) ( not ( = ?auto_896344 ?auto_896354 ) ) ( not ( = ?auto_896344 ?auto_896355 ) ) ( not ( = ?auto_896344 ?auto_896356 ) ) ( not ( = ?auto_896344 ?auto_896357 ) ) ( not ( = ?auto_896344 ?auto_896358 ) ) ( not ( = ?auto_896344 ?auto_896359 ) ) ( not ( = ?auto_896345 ?auto_896346 ) ) ( not ( = ?auto_896345 ?auto_896347 ) ) ( not ( = ?auto_896345 ?auto_896348 ) ) ( not ( = ?auto_896345 ?auto_896349 ) ) ( not ( = ?auto_896345 ?auto_896350 ) ) ( not ( = ?auto_896345 ?auto_896351 ) ) ( not ( = ?auto_896345 ?auto_896352 ) ) ( not ( = ?auto_896345 ?auto_896353 ) ) ( not ( = ?auto_896345 ?auto_896354 ) ) ( not ( = ?auto_896345 ?auto_896355 ) ) ( not ( = ?auto_896345 ?auto_896356 ) ) ( not ( = ?auto_896345 ?auto_896357 ) ) ( not ( = ?auto_896345 ?auto_896358 ) ) ( not ( = ?auto_896345 ?auto_896359 ) ) ( not ( = ?auto_896346 ?auto_896347 ) ) ( not ( = ?auto_896346 ?auto_896348 ) ) ( not ( = ?auto_896346 ?auto_896349 ) ) ( not ( = ?auto_896346 ?auto_896350 ) ) ( not ( = ?auto_896346 ?auto_896351 ) ) ( not ( = ?auto_896346 ?auto_896352 ) ) ( not ( = ?auto_896346 ?auto_896353 ) ) ( not ( = ?auto_896346 ?auto_896354 ) ) ( not ( = ?auto_896346 ?auto_896355 ) ) ( not ( = ?auto_896346 ?auto_896356 ) ) ( not ( = ?auto_896346 ?auto_896357 ) ) ( not ( = ?auto_896346 ?auto_896358 ) ) ( not ( = ?auto_896346 ?auto_896359 ) ) ( not ( = ?auto_896347 ?auto_896348 ) ) ( not ( = ?auto_896347 ?auto_896349 ) ) ( not ( = ?auto_896347 ?auto_896350 ) ) ( not ( = ?auto_896347 ?auto_896351 ) ) ( not ( = ?auto_896347 ?auto_896352 ) ) ( not ( = ?auto_896347 ?auto_896353 ) ) ( not ( = ?auto_896347 ?auto_896354 ) ) ( not ( = ?auto_896347 ?auto_896355 ) ) ( not ( = ?auto_896347 ?auto_896356 ) ) ( not ( = ?auto_896347 ?auto_896357 ) ) ( not ( = ?auto_896347 ?auto_896358 ) ) ( not ( = ?auto_896347 ?auto_896359 ) ) ( not ( = ?auto_896348 ?auto_896349 ) ) ( not ( = ?auto_896348 ?auto_896350 ) ) ( not ( = ?auto_896348 ?auto_896351 ) ) ( not ( = ?auto_896348 ?auto_896352 ) ) ( not ( = ?auto_896348 ?auto_896353 ) ) ( not ( = ?auto_896348 ?auto_896354 ) ) ( not ( = ?auto_896348 ?auto_896355 ) ) ( not ( = ?auto_896348 ?auto_896356 ) ) ( not ( = ?auto_896348 ?auto_896357 ) ) ( not ( = ?auto_896348 ?auto_896358 ) ) ( not ( = ?auto_896348 ?auto_896359 ) ) ( not ( = ?auto_896349 ?auto_896350 ) ) ( not ( = ?auto_896349 ?auto_896351 ) ) ( not ( = ?auto_896349 ?auto_896352 ) ) ( not ( = ?auto_896349 ?auto_896353 ) ) ( not ( = ?auto_896349 ?auto_896354 ) ) ( not ( = ?auto_896349 ?auto_896355 ) ) ( not ( = ?auto_896349 ?auto_896356 ) ) ( not ( = ?auto_896349 ?auto_896357 ) ) ( not ( = ?auto_896349 ?auto_896358 ) ) ( not ( = ?auto_896349 ?auto_896359 ) ) ( not ( = ?auto_896350 ?auto_896351 ) ) ( not ( = ?auto_896350 ?auto_896352 ) ) ( not ( = ?auto_896350 ?auto_896353 ) ) ( not ( = ?auto_896350 ?auto_896354 ) ) ( not ( = ?auto_896350 ?auto_896355 ) ) ( not ( = ?auto_896350 ?auto_896356 ) ) ( not ( = ?auto_896350 ?auto_896357 ) ) ( not ( = ?auto_896350 ?auto_896358 ) ) ( not ( = ?auto_896350 ?auto_896359 ) ) ( not ( = ?auto_896351 ?auto_896352 ) ) ( not ( = ?auto_896351 ?auto_896353 ) ) ( not ( = ?auto_896351 ?auto_896354 ) ) ( not ( = ?auto_896351 ?auto_896355 ) ) ( not ( = ?auto_896351 ?auto_896356 ) ) ( not ( = ?auto_896351 ?auto_896357 ) ) ( not ( = ?auto_896351 ?auto_896358 ) ) ( not ( = ?auto_896351 ?auto_896359 ) ) ( not ( = ?auto_896352 ?auto_896353 ) ) ( not ( = ?auto_896352 ?auto_896354 ) ) ( not ( = ?auto_896352 ?auto_896355 ) ) ( not ( = ?auto_896352 ?auto_896356 ) ) ( not ( = ?auto_896352 ?auto_896357 ) ) ( not ( = ?auto_896352 ?auto_896358 ) ) ( not ( = ?auto_896352 ?auto_896359 ) ) ( not ( = ?auto_896353 ?auto_896354 ) ) ( not ( = ?auto_896353 ?auto_896355 ) ) ( not ( = ?auto_896353 ?auto_896356 ) ) ( not ( = ?auto_896353 ?auto_896357 ) ) ( not ( = ?auto_896353 ?auto_896358 ) ) ( not ( = ?auto_896353 ?auto_896359 ) ) ( not ( = ?auto_896354 ?auto_896355 ) ) ( not ( = ?auto_896354 ?auto_896356 ) ) ( not ( = ?auto_896354 ?auto_896357 ) ) ( not ( = ?auto_896354 ?auto_896358 ) ) ( not ( = ?auto_896354 ?auto_896359 ) ) ( not ( = ?auto_896355 ?auto_896356 ) ) ( not ( = ?auto_896355 ?auto_896357 ) ) ( not ( = ?auto_896355 ?auto_896358 ) ) ( not ( = ?auto_896355 ?auto_896359 ) ) ( not ( = ?auto_896356 ?auto_896357 ) ) ( not ( = ?auto_896356 ?auto_896358 ) ) ( not ( = ?auto_896356 ?auto_896359 ) ) ( not ( = ?auto_896357 ?auto_896358 ) ) ( not ( = ?auto_896357 ?auto_896359 ) ) ( not ( = ?auto_896358 ?auto_896359 ) ) ( ON ?auto_896357 ?auto_896358 ) ( ON ?auto_896356 ?auto_896357 ) ( ON ?auto_896355 ?auto_896356 ) ( ON ?auto_896354 ?auto_896355 ) ( ON ?auto_896353 ?auto_896354 ) ( ON ?auto_896352 ?auto_896353 ) ( ON ?auto_896351 ?auto_896352 ) ( ON ?auto_896350 ?auto_896351 ) ( ON ?auto_896349 ?auto_896350 ) ( ON ?auto_896348 ?auto_896349 ) ( ON ?auto_896347 ?auto_896348 ) ( CLEAR ?auto_896345 ) ( ON ?auto_896346 ?auto_896347 ) ( CLEAR ?auto_896346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_896342 ?auto_896343 ?auto_896344 ?auto_896345 ?auto_896346 )
      ( MAKE-17PILE ?auto_896342 ?auto_896343 ?auto_896344 ?auto_896345 ?auto_896346 ?auto_896347 ?auto_896348 ?auto_896349 ?auto_896350 ?auto_896351 ?auto_896352 ?auto_896353 ?auto_896354 ?auto_896355 ?auto_896356 ?auto_896357 ?auto_896358 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896412 - BLOCK
      ?auto_896413 - BLOCK
      ?auto_896414 - BLOCK
      ?auto_896415 - BLOCK
      ?auto_896416 - BLOCK
      ?auto_896417 - BLOCK
      ?auto_896418 - BLOCK
      ?auto_896419 - BLOCK
      ?auto_896420 - BLOCK
      ?auto_896421 - BLOCK
      ?auto_896422 - BLOCK
      ?auto_896423 - BLOCK
      ?auto_896424 - BLOCK
      ?auto_896425 - BLOCK
      ?auto_896426 - BLOCK
      ?auto_896427 - BLOCK
      ?auto_896428 - BLOCK
    )
    :vars
    (
      ?auto_896429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896428 ?auto_896429 ) ( ON-TABLE ?auto_896412 ) ( ON ?auto_896413 ?auto_896412 ) ( ON ?auto_896414 ?auto_896413 ) ( not ( = ?auto_896412 ?auto_896413 ) ) ( not ( = ?auto_896412 ?auto_896414 ) ) ( not ( = ?auto_896412 ?auto_896415 ) ) ( not ( = ?auto_896412 ?auto_896416 ) ) ( not ( = ?auto_896412 ?auto_896417 ) ) ( not ( = ?auto_896412 ?auto_896418 ) ) ( not ( = ?auto_896412 ?auto_896419 ) ) ( not ( = ?auto_896412 ?auto_896420 ) ) ( not ( = ?auto_896412 ?auto_896421 ) ) ( not ( = ?auto_896412 ?auto_896422 ) ) ( not ( = ?auto_896412 ?auto_896423 ) ) ( not ( = ?auto_896412 ?auto_896424 ) ) ( not ( = ?auto_896412 ?auto_896425 ) ) ( not ( = ?auto_896412 ?auto_896426 ) ) ( not ( = ?auto_896412 ?auto_896427 ) ) ( not ( = ?auto_896412 ?auto_896428 ) ) ( not ( = ?auto_896412 ?auto_896429 ) ) ( not ( = ?auto_896413 ?auto_896414 ) ) ( not ( = ?auto_896413 ?auto_896415 ) ) ( not ( = ?auto_896413 ?auto_896416 ) ) ( not ( = ?auto_896413 ?auto_896417 ) ) ( not ( = ?auto_896413 ?auto_896418 ) ) ( not ( = ?auto_896413 ?auto_896419 ) ) ( not ( = ?auto_896413 ?auto_896420 ) ) ( not ( = ?auto_896413 ?auto_896421 ) ) ( not ( = ?auto_896413 ?auto_896422 ) ) ( not ( = ?auto_896413 ?auto_896423 ) ) ( not ( = ?auto_896413 ?auto_896424 ) ) ( not ( = ?auto_896413 ?auto_896425 ) ) ( not ( = ?auto_896413 ?auto_896426 ) ) ( not ( = ?auto_896413 ?auto_896427 ) ) ( not ( = ?auto_896413 ?auto_896428 ) ) ( not ( = ?auto_896413 ?auto_896429 ) ) ( not ( = ?auto_896414 ?auto_896415 ) ) ( not ( = ?auto_896414 ?auto_896416 ) ) ( not ( = ?auto_896414 ?auto_896417 ) ) ( not ( = ?auto_896414 ?auto_896418 ) ) ( not ( = ?auto_896414 ?auto_896419 ) ) ( not ( = ?auto_896414 ?auto_896420 ) ) ( not ( = ?auto_896414 ?auto_896421 ) ) ( not ( = ?auto_896414 ?auto_896422 ) ) ( not ( = ?auto_896414 ?auto_896423 ) ) ( not ( = ?auto_896414 ?auto_896424 ) ) ( not ( = ?auto_896414 ?auto_896425 ) ) ( not ( = ?auto_896414 ?auto_896426 ) ) ( not ( = ?auto_896414 ?auto_896427 ) ) ( not ( = ?auto_896414 ?auto_896428 ) ) ( not ( = ?auto_896414 ?auto_896429 ) ) ( not ( = ?auto_896415 ?auto_896416 ) ) ( not ( = ?auto_896415 ?auto_896417 ) ) ( not ( = ?auto_896415 ?auto_896418 ) ) ( not ( = ?auto_896415 ?auto_896419 ) ) ( not ( = ?auto_896415 ?auto_896420 ) ) ( not ( = ?auto_896415 ?auto_896421 ) ) ( not ( = ?auto_896415 ?auto_896422 ) ) ( not ( = ?auto_896415 ?auto_896423 ) ) ( not ( = ?auto_896415 ?auto_896424 ) ) ( not ( = ?auto_896415 ?auto_896425 ) ) ( not ( = ?auto_896415 ?auto_896426 ) ) ( not ( = ?auto_896415 ?auto_896427 ) ) ( not ( = ?auto_896415 ?auto_896428 ) ) ( not ( = ?auto_896415 ?auto_896429 ) ) ( not ( = ?auto_896416 ?auto_896417 ) ) ( not ( = ?auto_896416 ?auto_896418 ) ) ( not ( = ?auto_896416 ?auto_896419 ) ) ( not ( = ?auto_896416 ?auto_896420 ) ) ( not ( = ?auto_896416 ?auto_896421 ) ) ( not ( = ?auto_896416 ?auto_896422 ) ) ( not ( = ?auto_896416 ?auto_896423 ) ) ( not ( = ?auto_896416 ?auto_896424 ) ) ( not ( = ?auto_896416 ?auto_896425 ) ) ( not ( = ?auto_896416 ?auto_896426 ) ) ( not ( = ?auto_896416 ?auto_896427 ) ) ( not ( = ?auto_896416 ?auto_896428 ) ) ( not ( = ?auto_896416 ?auto_896429 ) ) ( not ( = ?auto_896417 ?auto_896418 ) ) ( not ( = ?auto_896417 ?auto_896419 ) ) ( not ( = ?auto_896417 ?auto_896420 ) ) ( not ( = ?auto_896417 ?auto_896421 ) ) ( not ( = ?auto_896417 ?auto_896422 ) ) ( not ( = ?auto_896417 ?auto_896423 ) ) ( not ( = ?auto_896417 ?auto_896424 ) ) ( not ( = ?auto_896417 ?auto_896425 ) ) ( not ( = ?auto_896417 ?auto_896426 ) ) ( not ( = ?auto_896417 ?auto_896427 ) ) ( not ( = ?auto_896417 ?auto_896428 ) ) ( not ( = ?auto_896417 ?auto_896429 ) ) ( not ( = ?auto_896418 ?auto_896419 ) ) ( not ( = ?auto_896418 ?auto_896420 ) ) ( not ( = ?auto_896418 ?auto_896421 ) ) ( not ( = ?auto_896418 ?auto_896422 ) ) ( not ( = ?auto_896418 ?auto_896423 ) ) ( not ( = ?auto_896418 ?auto_896424 ) ) ( not ( = ?auto_896418 ?auto_896425 ) ) ( not ( = ?auto_896418 ?auto_896426 ) ) ( not ( = ?auto_896418 ?auto_896427 ) ) ( not ( = ?auto_896418 ?auto_896428 ) ) ( not ( = ?auto_896418 ?auto_896429 ) ) ( not ( = ?auto_896419 ?auto_896420 ) ) ( not ( = ?auto_896419 ?auto_896421 ) ) ( not ( = ?auto_896419 ?auto_896422 ) ) ( not ( = ?auto_896419 ?auto_896423 ) ) ( not ( = ?auto_896419 ?auto_896424 ) ) ( not ( = ?auto_896419 ?auto_896425 ) ) ( not ( = ?auto_896419 ?auto_896426 ) ) ( not ( = ?auto_896419 ?auto_896427 ) ) ( not ( = ?auto_896419 ?auto_896428 ) ) ( not ( = ?auto_896419 ?auto_896429 ) ) ( not ( = ?auto_896420 ?auto_896421 ) ) ( not ( = ?auto_896420 ?auto_896422 ) ) ( not ( = ?auto_896420 ?auto_896423 ) ) ( not ( = ?auto_896420 ?auto_896424 ) ) ( not ( = ?auto_896420 ?auto_896425 ) ) ( not ( = ?auto_896420 ?auto_896426 ) ) ( not ( = ?auto_896420 ?auto_896427 ) ) ( not ( = ?auto_896420 ?auto_896428 ) ) ( not ( = ?auto_896420 ?auto_896429 ) ) ( not ( = ?auto_896421 ?auto_896422 ) ) ( not ( = ?auto_896421 ?auto_896423 ) ) ( not ( = ?auto_896421 ?auto_896424 ) ) ( not ( = ?auto_896421 ?auto_896425 ) ) ( not ( = ?auto_896421 ?auto_896426 ) ) ( not ( = ?auto_896421 ?auto_896427 ) ) ( not ( = ?auto_896421 ?auto_896428 ) ) ( not ( = ?auto_896421 ?auto_896429 ) ) ( not ( = ?auto_896422 ?auto_896423 ) ) ( not ( = ?auto_896422 ?auto_896424 ) ) ( not ( = ?auto_896422 ?auto_896425 ) ) ( not ( = ?auto_896422 ?auto_896426 ) ) ( not ( = ?auto_896422 ?auto_896427 ) ) ( not ( = ?auto_896422 ?auto_896428 ) ) ( not ( = ?auto_896422 ?auto_896429 ) ) ( not ( = ?auto_896423 ?auto_896424 ) ) ( not ( = ?auto_896423 ?auto_896425 ) ) ( not ( = ?auto_896423 ?auto_896426 ) ) ( not ( = ?auto_896423 ?auto_896427 ) ) ( not ( = ?auto_896423 ?auto_896428 ) ) ( not ( = ?auto_896423 ?auto_896429 ) ) ( not ( = ?auto_896424 ?auto_896425 ) ) ( not ( = ?auto_896424 ?auto_896426 ) ) ( not ( = ?auto_896424 ?auto_896427 ) ) ( not ( = ?auto_896424 ?auto_896428 ) ) ( not ( = ?auto_896424 ?auto_896429 ) ) ( not ( = ?auto_896425 ?auto_896426 ) ) ( not ( = ?auto_896425 ?auto_896427 ) ) ( not ( = ?auto_896425 ?auto_896428 ) ) ( not ( = ?auto_896425 ?auto_896429 ) ) ( not ( = ?auto_896426 ?auto_896427 ) ) ( not ( = ?auto_896426 ?auto_896428 ) ) ( not ( = ?auto_896426 ?auto_896429 ) ) ( not ( = ?auto_896427 ?auto_896428 ) ) ( not ( = ?auto_896427 ?auto_896429 ) ) ( not ( = ?auto_896428 ?auto_896429 ) ) ( ON ?auto_896427 ?auto_896428 ) ( ON ?auto_896426 ?auto_896427 ) ( ON ?auto_896425 ?auto_896426 ) ( ON ?auto_896424 ?auto_896425 ) ( ON ?auto_896423 ?auto_896424 ) ( ON ?auto_896422 ?auto_896423 ) ( ON ?auto_896421 ?auto_896422 ) ( ON ?auto_896420 ?auto_896421 ) ( ON ?auto_896419 ?auto_896420 ) ( ON ?auto_896418 ?auto_896419 ) ( ON ?auto_896417 ?auto_896418 ) ( ON ?auto_896416 ?auto_896417 ) ( CLEAR ?auto_896414 ) ( ON ?auto_896415 ?auto_896416 ) ( CLEAR ?auto_896415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_896412 ?auto_896413 ?auto_896414 ?auto_896415 )
      ( MAKE-17PILE ?auto_896412 ?auto_896413 ?auto_896414 ?auto_896415 ?auto_896416 ?auto_896417 ?auto_896418 ?auto_896419 ?auto_896420 ?auto_896421 ?auto_896422 ?auto_896423 ?auto_896424 ?auto_896425 ?auto_896426 ?auto_896427 ?auto_896428 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896482 - BLOCK
      ?auto_896483 - BLOCK
      ?auto_896484 - BLOCK
      ?auto_896485 - BLOCK
      ?auto_896486 - BLOCK
      ?auto_896487 - BLOCK
      ?auto_896488 - BLOCK
      ?auto_896489 - BLOCK
      ?auto_896490 - BLOCK
      ?auto_896491 - BLOCK
      ?auto_896492 - BLOCK
      ?auto_896493 - BLOCK
      ?auto_896494 - BLOCK
      ?auto_896495 - BLOCK
      ?auto_896496 - BLOCK
      ?auto_896497 - BLOCK
      ?auto_896498 - BLOCK
    )
    :vars
    (
      ?auto_896499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896498 ?auto_896499 ) ( ON-TABLE ?auto_896482 ) ( ON ?auto_896483 ?auto_896482 ) ( not ( = ?auto_896482 ?auto_896483 ) ) ( not ( = ?auto_896482 ?auto_896484 ) ) ( not ( = ?auto_896482 ?auto_896485 ) ) ( not ( = ?auto_896482 ?auto_896486 ) ) ( not ( = ?auto_896482 ?auto_896487 ) ) ( not ( = ?auto_896482 ?auto_896488 ) ) ( not ( = ?auto_896482 ?auto_896489 ) ) ( not ( = ?auto_896482 ?auto_896490 ) ) ( not ( = ?auto_896482 ?auto_896491 ) ) ( not ( = ?auto_896482 ?auto_896492 ) ) ( not ( = ?auto_896482 ?auto_896493 ) ) ( not ( = ?auto_896482 ?auto_896494 ) ) ( not ( = ?auto_896482 ?auto_896495 ) ) ( not ( = ?auto_896482 ?auto_896496 ) ) ( not ( = ?auto_896482 ?auto_896497 ) ) ( not ( = ?auto_896482 ?auto_896498 ) ) ( not ( = ?auto_896482 ?auto_896499 ) ) ( not ( = ?auto_896483 ?auto_896484 ) ) ( not ( = ?auto_896483 ?auto_896485 ) ) ( not ( = ?auto_896483 ?auto_896486 ) ) ( not ( = ?auto_896483 ?auto_896487 ) ) ( not ( = ?auto_896483 ?auto_896488 ) ) ( not ( = ?auto_896483 ?auto_896489 ) ) ( not ( = ?auto_896483 ?auto_896490 ) ) ( not ( = ?auto_896483 ?auto_896491 ) ) ( not ( = ?auto_896483 ?auto_896492 ) ) ( not ( = ?auto_896483 ?auto_896493 ) ) ( not ( = ?auto_896483 ?auto_896494 ) ) ( not ( = ?auto_896483 ?auto_896495 ) ) ( not ( = ?auto_896483 ?auto_896496 ) ) ( not ( = ?auto_896483 ?auto_896497 ) ) ( not ( = ?auto_896483 ?auto_896498 ) ) ( not ( = ?auto_896483 ?auto_896499 ) ) ( not ( = ?auto_896484 ?auto_896485 ) ) ( not ( = ?auto_896484 ?auto_896486 ) ) ( not ( = ?auto_896484 ?auto_896487 ) ) ( not ( = ?auto_896484 ?auto_896488 ) ) ( not ( = ?auto_896484 ?auto_896489 ) ) ( not ( = ?auto_896484 ?auto_896490 ) ) ( not ( = ?auto_896484 ?auto_896491 ) ) ( not ( = ?auto_896484 ?auto_896492 ) ) ( not ( = ?auto_896484 ?auto_896493 ) ) ( not ( = ?auto_896484 ?auto_896494 ) ) ( not ( = ?auto_896484 ?auto_896495 ) ) ( not ( = ?auto_896484 ?auto_896496 ) ) ( not ( = ?auto_896484 ?auto_896497 ) ) ( not ( = ?auto_896484 ?auto_896498 ) ) ( not ( = ?auto_896484 ?auto_896499 ) ) ( not ( = ?auto_896485 ?auto_896486 ) ) ( not ( = ?auto_896485 ?auto_896487 ) ) ( not ( = ?auto_896485 ?auto_896488 ) ) ( not ( = ?auto_896485 ?auto_896489 ) ) ( not ( = ?auto_896485 ?auto_896490 ) ) ( not ( = ?auto_896485 ?auto_896491 ) ) ( not ( = ?auto_896485 ?auto_896492 ) ) ( not ( = ?auto_896485 ?auto_896493 ) ) ( not ( = ?auto_896485 ?auto_896494 ) ) ( not ( = ?auto_896485 ?auto_896495 ) ) ( not ( = ?auto_896485 ?auto_896496 ) ) ( not ( = ?auto_896485 ?auto_896497 ) ) ( not ( = ?auto_896485 ?auto_896498 ) ) ( not ( = ?auto_896485 ?auto_896499 ) ) ( not ( = ?auto_896486 ?auto_896487 ) ) ( not ( = ?auto_896486 ?auto_896488 ) ) ( not ( = ?auto_896486 ?auto_896489 ) ) ( not ( = ?auto_896486 ?auto_896490 ) ) ( not ( = ?auto_896486 ?auto_896491 ) ) ( not ( = ?auto_896486 ?auto_896492 ) ) ( not ( = ?auto_896486 ?auto_896493 ) ) ( not ( = ?auto_896486 ?auto_896494 ) ) ( not ( = ?auto_896486 ?auto_896495 ) ) ( not ( = ?auto_896486 ?auto_896496 ) ) ( not ( = ?auto_896486 ?auto_896497 ) ) ( not ( = ?auto_896486 ?auto_896498 ) ) ( not ( = ?auto_896486 ?auto_896499 ) ) ( not ( = ?auto_896487 ?auto_896488 ) ) ( not ( = ?auto_896487 ?auto_896489 ) ) ( not ( = ?auto_896487 ?auto_896490 ) ) ( not ( = ?auto_896487 ?auto_896491 ) ) ( not ( = ?auto_896487 ?auto_896492 ) ) ( not ( = ?auto_896487 ?auto_896493 ) ) ( not ( = ?auto_896487 ?auto_896494 ) ) ( not ( = ?auto_896487 ?auto_896495 ) ) ( not ( = ?auto_896487 ?auto_896496 ) ) ( not ( = ?auto_896487 ?auto_896497 ) ) ( not ( = ?auto_896487 ?auto_896498 ) ) ( not ( = ?auto_896487 ?auto_896499 ) ) ( not ( = ?auto_896488 ?auto_896489 ) ) ( not ( = ?auto_896488 ?auto_896490 ) ) ( not ( = ?auto_896488 ?auto_896491 ) ) ( not ( = ?auto_896488 ?auto_896492 ) ) ( not ( = ?auto_896488 ?auto_896493 ) ) ( not ( = ?auto_896488 ?auto_896494 ) ) ( not ( = ?auto_896488 ?auto_896495 ) ) ( not ( = ?auto_896488 ?auto_896496 ) ) ( not ( = ?auto_896488 ?auto_896497 ) ) ( not ( = ?auto_896488 ?auto_896498 ) ) ( not ( = ?auto_896488 ?auto_896499 ) ) ( not ( = ?auto_896489 ?auto_896490 ) ) ( not ( = ?auto_896489 ?auto_896491 ) ) ( not ( = ?auto_896489 ?auto_896492 ) ) ( not ( = ?auto_896489 ?auto_896493 ) ) ( not ( = ?auto_896489 ?auto_896494 ) ) ( not ( = ?auto_896489 ?auto_896495 ) ) ( not ( = ?auto_896489 ?auto_896496 ) ) ( not ( = ?auto_896489 ?auto_896497 ) ) ( not ( = ?auto_896489 ?auto_896498 ) ) ( not ( = ?auto_896489 ?auto_896499 ) ) ( not ( = ?auto_896490 ?auto_896491 ) ) ( not ( = ?auto_896490 ?auto_896492 ) ) ( not ( = ?auto_896490 ?auto_896493 ) ) ( not ( = ?auto_896490 ?auto_896494 ) ) ( not ( = ?auto_896490 ?auto_896495 ) ) ( not ( = ?auto_896490 ?auto_896496 ) ) ( not ( = ?auto_896490 ?auto_896497 ) ) ( not ( = ?auto_896490 ?auto_896498 ) ) ( not ( = ?auto_896490 ?auto_896499 ) ) ( not ( = ?auto_896491 ?auto_896492 ) ) ( not ( = ?auto_896491 ?auto_896493 ) ) ( not ( = ?auto_896491 ?auto_896494 ) ) ( not ( = ?auto_896491 ?auto_896495 ) ) ( not ( = ?auto_896491 ?auto_896496 ) ) ( not ( = ?auto_896491 ?auto_896497 ) ) ( not ( = ?auto_896491 ?auto_896498 ) ) ( not ( = ?auto_896491 ?auto_896499 ) ) ( not ( = ?auto_896492 ?auto_896493 ) ) ( not ( = ?auto_896492 ?auto_896494 ) ) ( not ( = ?auto_896492 ?auto_896495 ) ) ( not ( = ?auto_896492 ?auto_896496 ) ) ( not ( = ?auto_896492 ?auto_896497 ) ) ( not ( = ?auto_896492 ?auto_896498 ) ) ( not ( = ?auto_896492 ?auto_896499 ) ) ( not ( = ?auto_896493 ?auto_896494 ) ) ( not ( = ?auto_896493 ?auto_896495 ) ) ( not ( = ?auto_896493 ?auto_896496 ) ) ( not ( = ?auto_896493 ?auto_896497 ) ) ( not ( = ?auto_896493 ?auto_896498 ) ) ( not ( = ?auto_896493 ?auto_896499 ) ) ( not ( = ?auto_896494 ?auto_896495 ) ) ( not ( = ?auto_896494 ?auto_896496 ) ) ( not ( = ?auto_896494 ?auto_896497 ) ) ( not ( = ?auto_896494 ?auto_896498 ) ) ( not ( = ?auto_896494 ?auto_896499 ) ) ( not ( = ?auto_896495 ?auto_896496 ) ) ( not ( = ?auto_896495 ?auto_896497 ) ) ( not ( = ?auto_896495 ?auto_896498 ) ) ( not ( = ?auto_896495 ?auto_896499 ) ) ( not ( = ?auto_896496 ?auto_896497 ) ) ( not ( = ?auto_896496 ?auto_896498 ) ) ( not ( = ?auto_896496 ?auto_896499 ) ) ( not ( = ?auto_896497 ?auto_896498 ) ) ( not ( = ?auto_896497 ?auto_896499 ) ) ( not ( = ?auto_896498 ?auto_896499 ) ) ( ON ?auto_896497 ?auto_896498 ) ( ON ?auto_896496 ?auto_896497 ) ( ON ?auto_896495 ?auto_896496 ) ( ON ?auto_896494 ?auto_896495 ) ( ON ?auto_896493 ?auto_896494 ) ( ON ?auto_896492 ?auto_896493 ) ( ON ?auto_896491 ?auto_896492 ) ( ON ?auto_896490 ?auto_896491 ) ( ON ?auto_896489 ?auto_896490 ) ( ON ?auto_896488 ?auto_896489 ) ( ON ?auto_896487 ?auto_896488 ) ( ON ?auto_896486 ?auto_896487 ) ( ON ?auto_896485 ?auto_896486 ) ( CLEAR ?auto_896483 ) ( ON ?auto_896484 ?auto_896485 ) ( CLEAR ?auto_896484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_896482 ?auto_896483 ?auto_896484 )
      ( MAKE-17PILE ?auto_896482 ?auto_896483 ?auto_896484 ?auto_896485 ?auto_896486 ?auto_896487 ?auto_896488 ?auto_896489 ?auto_896490 ?auto_896491 ?auto_896492 ?auto_896493 ?auto_896494 ?auto_896495 ?auto_896496 ?auto_896497 ?auto_896498 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896552 - BLOCK
      ?auto_896553 - BLOCK
      ?auto_896554 - BLOCK
      ?auto_896555 - BLOCK
      ?auto_896556 - BLOCK
      ?auto_896557 - BLOCK
      ?auto_896558 - BLOCK
      ?auto_896559 - BLOCK
      ?auto_896560 - BLOCK
      ?auto_896561 - BLOCK
      ?auto_896562 - BLOCK
      ?auto_896563 - BLOCK
      ?auto_896564 - BLOCK
      ?auto_896565 - BLOCK
      ?auto_896566 - BLOCK
      ?auto_896567 - BLOCK
      ?auto_896568 - BLOCK
    )
    :vars
    (
      ?auto_896569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896568 ?auto_896569 ) ( ON-TABLE ?auto_896552 ) ( not ( = ?auto_896552 ?auto_896553 ) ) ( not ( = ?auto_896552 ?auto_896554 ) ) ( not ( = ?auto_896552 ?auto_896555 ) ) ( not ( = ?auto_896552 ?auto_896556 ) ) ( not ( = ?auto_896552 ?auto_896557 ) ) ( not ( = ?auto_896552 ?auto_896558 ) ) ( not ( = ?auto_896552 ?auto_896559 ) ) ( not ( = ?auto_896552 ?auto_896560 ) ) ( not ( = ?auto_896552 ?auto_896561 ) ) ( not ( = ?auto_896552 ?auto_896562 ) ) ( not ( = ?auto_896552 ?auto_896563 ) ) ( not ( = ?auto_896552 ?auto_896564 ) ) ( not ( = ?auto_896552 ?auto_896565 ) ) ( not ( = ?auto_896552 ?auto_896566 ) ) ( not ( = ?auto_896552 ?auto_896567 ) ) ( not ( = ?auto_896552 ?auto_896568 ) ) ( not ( = ?auto_896552 ?auto_896569 ) ) ( not ( = ?auto_896553 ?auto_896554 ) ) ( not ( = ?auto_896553 ?auto_896555 ) ) ( not ( = ?auto_896553 ?auto_896556 ) ) ( not ( = ?auto_896553 ?auto_896557 ) ) ( not ( = ?auto_896553 ?auto_896558 ) ) ( not ( = ?auto_896553 ?auto_896559 ) ) ( not ( = ?auto_896553 ?auto_896560 ) ) ( not ( = ?auto_896553 ?auto_896561 ) ) ( not ( = ?auto_896553 ?auto_896562 ) ) ( not ( = ?auto_896553 ?auto_896563 ) ) ( not ( = ?auto_896553 ?auto_896564 ) ) ( not ( = ?auto_896553 ?auto_896565 ) ) ( not ( = ?auto_896553 ?auto_896566 ) ) ( not ( = ?auto_896553 ?auto_896567 ) ) ( not ( = ?auto_896553 ?auto_896568 ) ) ( not ( = ?auto_896553 ?auto_896569 ) ) ( not ( = ?auto_896554 ?auto_896555 ) ) ( not ( = ?auto_896554 ?auto_896556 ) ) ( not ( = ?auto_896554 ?auto_896557 ) ) ( not ( = ?auto_896554 ?auto_896558 ) ) ( not ( = ?auto_896554 ?auto_896559 ) ) ( not ( = ?auto_896554 ?auto_896560 ) ) ( not ( = ?auto_896554 ?auto_896561 ) ) ( not ( = ?auto_896554 ?auto_896562 ) ) ( not ( = ?auto_896554 ?auto_896563 ) ) ( not ( = ?auto_896554 ?auto_896564 ) ) ( not ( = ?auto_896554 ?auto_896565 ) ) ( not ( = ?auto_896554 ?auto_896566 ) ) ( not ( = ?auto_896554 ?auto_896567 ) ) ( not ( = ?auto_896554 ?auto_896568 ) ) ( not ( = ?auto_896554 ?auto_896569 ) ) ( not ( = ?auto_896555 ?auto_896556 ) ) ( not ( = ?auto_896555 ?auto_896557 ) ) ( not ( = ?auto_896555 ?auto_896558 ) ) ( not ( = ?auto_896555 ?auto_896559 ) ) ( not ( = ?auto_896555 ?auto_896560 ) ) ( not ( = ?auto_896555 ?auto_896561 ) ) ( not ( = ?auto_896555 ?auto_896562 ) ) ( not ( = ?auto_896555 ?auto_896563 ) ) ( not ( = ?auto_896555 ?auto_896564 ) ) ( not ( = ?auto_896555 ?auto_896565 ) ) ( not ( = ?auto_896555 ?auto_896566 ) ) ( not ( = ?auto_896555 ?auto_896567 ) ) ( not ( = ?auto_896555 ?auto_896568 ) ) ( not ( = ?auto_896555 ?auto_896569 ) ) ( not ( = ?auto_896556 ?auto_896557 ) ) ( not ( = ?auto_896556 ?auto_896558 ) ) ( not ( = ?auto_896556 ?auto_896559 ) ) ( not ( = ?auto_896556 ?auto_896560 ) ) ( not ( = ?auto_896556 ?auto_896561 ) ) ( not ( = ?auto_896556 ?auto_896562 ) ) ( not ( = ?auto_896556 ?auto_896563 ) ) ( not ( = ?auto_896556 ?auto_896564 ) ) ( not ( = ?auto_896556 ?auto_896565 ) ) ( not ( = ?auto_896556 ?auto_896566 ) ) ( not ( = ?auto_896556 ?auto_896567 ) ) ( not ( = ?auto_896556 ?auto_896568 ) ) ( not ( = ?auto_896556 ?auto_896569 ) ) ( not ( = ?auto_896557 ?auto_896558 ) ) ( not ( = ?auto_896557 ?auto_896559 ) ) ( not ( = ?auto_896557 ?auto_896560 ) ) ( not ( = ?auto_896557 ?auto_896561 ) ) ( not ( = ?auto_896557 ?auto_896562 ) ) ( not ( = ?auto_896557 ?auto_896563 ) ) ( not ( = ?auto_896557 ?auto_896564 ) ) ( not ( = ?auto_896557 ?auto_896565 ) ) ( not ( = ?auto_896557 ?auto_896566 ) ) ( not ( = ?auto_896557 ?auto_896567 ) ) ( not ( = ?auto_896557 ?auto_896568 ) ) ( not ( = ?auto_896557 ?auto_896569 ) ) ( not ( = ?auto_896558 ?auto_896559 ) ) ( not ( = ?auto_896558 ?auto_896560 ) ) ( not ( = ?auto_896558 ?auto_896561 ) ) ( not ( = ?auto_896558 ?auto_896562 ) ) ( not ( = ?auto_896558 ?auto_896563 ) ) ( not ( = ?auto_896558 ?auto_896564 ) ) ( not ( = ?auto_896558 ?auto_896565 ) ) ( not ( = ?auto_896558 ?auto_896566 ) ) ( not ( = ?auto_896558 ?auto_896567 ) ) ( not ( = ?auto_896558 ?auto_896568 ) ) ( not ( = ?auto_896558 ?auto_896569 ) ) ( not ( = ?auto_896559 ?auto_896560 ) ) ( not ( = ?auto_896559 ?auto_896561 ) ) ( not ( = ?auto_896559 ?auto_896562 ) ) ( not ( = ?auto_896559 ?auto_896563 ) ) ( not ( = ?auto_896559 ?auto_896564 ) ) ( not ( = ?auto_896559 ?auto_896565 ) ) ( not ( = ?auto_896559 ?auto_896566 ) ) ( not ( = ?auto_896559 ?auto_896567 ) ) ( not ( = ?auto_896559 ?auto_896568 ) ) ( not ( = ?auto_896559 ?auto_896569 ) ) ( not ( = ?auto_896560 ?auto_896561 ) ) ( not ( = ?auto_896560 ?auto_896562 ) ) ( not ( = ?auto_896560 ?auto_896563 ) ) ( not ( = ?auto_896560 ?auto_896564 ) ) ( not ( = ?auto_896560 ?auto_896565 ) ) ( not ( = ?auto_896560 ?auto_896566 ) ) ( not ( = ?auto_896560 ?auto_896567 ) ) ( not ( = ?auto_896560 ?auto_896568 ) ) ( not ( = ?auto_896560 ?auto_896569 ) ) ( not ( = ?auto_896561 ?auto_896562 ) ) ( not ( = ?auto_896561 ?auto_896563 ) ) ( not ( = ?auto_896561 ?auto_896564 ) ) ( not ( = ?auto_896561 ?auto_896565 ) ) ( not ( = ?auto_896561 ?auto_896566 ) ) ( not ( = ?auto_896561 ?auto_896567 ) ) ( not ( = ?auto_896561 ?auto_896568 ) ) ( not ( = ?auto_896561 ?auto_896569 ) ) ( not ( = ?auto_896562 ?auto_896563 ) ) ( not ( = ?auto_896562 ?auto_896564 ) ) ( not ( = ?auto_896562 ?auto_896565 ) ) ( not ( = ?auto_896562 ?auto_896566 ) ) ( not ( = ?auto_896562 ?auto_896567 ) ) ( not ( = ?auto_896562 ?auto_896568 ) ) ( not ( = ?auto_896562 ?auto_896569 ) ) ( not ( = ?auto_896563 ?auto_896564 ) ) ( not ( = ?auto_896563 ?auto_896565 ) ) ( not ( = ?auto_896563 ?auto_896566 ) ) ( not ( = ?auto_896563 ?auto_896567 ) ) ( not ( = ?auto_896563 ?auto_896568 ) ) ( not ( = ?auto_896563 ?auto_896569 ) ) ( not ( = ?auto_896564 ?auto_896565 ) ) ( not ( = ?auto_896564 ?auto_896566 ) ) ( not ( = ?auto_896564 ?auto_896567 ) ) ( not ( = ?auto_896564 ?auto_896568 ) ) ( not ( = ?auto_896564 ?auto_896569 ) ) ( not ( = ?auto_896565 ?auto_896566 ) ) ( not ( = ?auto_896565 ?auto_896567 ) ) ( not ( = ?auto_896565 ?auto_896568 ) ) ( not ( = ?auto_896565 ?auto_896569 ) ) ( not ( = ?auto_896566 ?auto_896567 ) ) ( not ( = ?auto_896566 ?auto_896568 ) ) ( not ( = ?auto_896566 ?auto_896569 ) ) ( not ( = ?auto_896567 ?auto_896568 ) ) ( not ( = ?auto_896567 ?auto_896569 ) ) ( not ( = ?auto_896568 ?auto_896569 ) ) ( ON ?auto_896567 ?auto_896568 ) ( ON ?auto_896566 ?auto_896567 ) ( ON ?auto_896565 ?auto_896566 ) ( ON ?auto_896564 ?auto_896565 ) ( ON ?auto_896563 ?auto_896564 ) ( ON ?auto_896562 ?auto_896563 ) ( ON ?auto_896561 ?auto_896562 ) ( ON ?auto_896560 ?auto_896561 ) ( ON ?auto_896559 ?auto_896560 ) ( ON ?auto_896558 ?auto_896559 ) ( ON ?auto_896557 ?auto_896558 ) ( ON ?auto_896556 ?auto_896557 ) ( ON ?auto_896555 ?auto_896556 ) ( ON ?auto_896554 ?auto_896555 ) ( CLEAR ?auto_896552 ) ( ON ?auto_896553 ?auto_896554 ) ( CLEAR ?auto_896553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_896552 ?auto_896553 )
      ( MAKE-17PILE ?auto_896552 ?auto_896553 ?auto_896554 ?auto_896555 ?auto_896556 ?auto_896557 ?auto_896558 ?auto_896559 ?auto_896560 ?auto_896561 ?auto_896562 ?auto_896563 ?auto_896564 ?auto_896565 ?auto_896566 ?auto_896567 ?auto_896568 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_896622 - BLOCK
      ?auto_896623 - BLOCK
      ?auto_896624 - BLOCK
      ?auto_896625 - BLOCK
      ?auto_896626 - BLOCK
      ?auto_896627 - BLOCK
      ?auto_896628 - BLOCK
      ?auto_896629 - BLOCK
      ?auto_896630 - BLOCK
      ?auto_896631 - BLOCK
      ?auto_896632 - BLOCK
      ?auto_896633 - BLOCK
      ?auto_896634 - BLOCK
      ?auto_896635 - BLOCK
      ?auto_896636 - BLOCK
      ?auto_896637 - BLOCK
      ?auto_896638 - BLOCK
    )
    :vars
    (
      ?auto_896639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896638 ?auto_896639 ) ( not ( = ?auto_896622 ?auto_896623 ) ) ( not ( = ?auto_896622 ?auto_896624 ) ) ( not ( = ?auto_896622 ?auto_896625 ) ) ( not ( = ?auto_896622 ?auto_896626 ) ) ( not ( = ?auto_896622 ?auto_896627 ) ) ( not ( = ?auto_896622 ?auto_896628 ) ) ( not ( = ?auto_896622 ?auto_896629 ) ) ( not ( = ?auto_896622 ?auto_896630 ) ) ( not ( = ?auto_896622 ?auto_896631 ) ) ( not ( = ?auto_896622 ?auto_896632 ) ) ( not ( = ?auto_896622 ?auto_896633 ) ) ( not ( = ?auto_896622 ?auto_896634 ) ) ( not ( = ?auto_896622 ?auto_896635 ) ) ( not ( = ?auto_896622 ?auto_896636 ) ) ( not ( = ?auto_896622 ?auto_896637 ) ) ( not ( = ?auto_896622 ?auto_896638 ) ) ( not ( = ?auto_896622 ?auto_896639 ) ) ( not ( = ?auto_896623 ?auto_896624 ) ) ( not ( = ?auto_896623 ?auto_896625 ) ) ( not ( = ?auto_896623 ?auto_896626 ) ) ( not ( = ?auto_896623 ?auto_896627 ) ) ( not ( = ?auto_896623 ?auto_896628 ) ) ( not ( = ?auto_896623 ?auto_896629 ) ) ( not ( = ?auto_896623 ?auto_896630 ) ) ( not ( = ?auto_896623 ?auto_896631 ) ) ( not ( = ?auto_896623 ?auto_896632 ) ) ( not ( = ?auto_896623 ?auto_896633 ) ) ( not ( = ?auto_896623 ?auto_896634 ) ) ( not ( = ?auto_896623 ?auto_896635 ) ) ( not ( = ?auto_896623 ?auto_896636 ) ) ( not ( = ?auto_896623 ?auto_896637 ) ) ( not ( = ?auto_896623 ?auto_896638 ) ) ( not ( = ?auto_896623 ?auto_896639 ) ) ( not ( = ?auto_896624 ?auto_896625 ) ) ( not ( = ?auto_896624 ?auto_896626 ) ) ( not ( = ?auto_896624 ?auto_896627 ) ) ( not ( = ?auto_896624 ?auto_896628 ) ) ( not ( = ?auto_896624 ?auto_896629 ) ) ( not ( = ?auto_896624 ?auto_896630 ) ) ( not ( = ?auto_896624 ?auto_896631 ) ) ( not ( = ?auto_896624 ?auto_896632 ) ) ( not ( = ?auto_896624 ?auto_896633 ) ) ( not ( = ?auto_896624 ?auto_896634 ) ) ( not ( = ?auto_896624 ?auto_896635 ) ) ( not ( = ?auto_896624 ?auto_896636 ) ) ( not ( = ?auto_896624 ?auto_896637 ) ) ( not ( = ?auto_896624 ?auto_896638 ) ) ( not ( = ?auto_896624 ?auto_896639 ) ) ( not ( = ?auto_896625 ?auto_896626 ) ) ( not ( = ?auto_896625 ?auto_896627 ) ) ( not ( = ?auto_896625 ?auto_896628 ) ) ( not ( = ?auto_896625 ?auto_896629 ) ) ( not ( = ?auto_896625 ?auto_896630 ) ) ( not ( = ?auto_896625 ?auto_896631 ) ) ( not ( = ?auto_896625 ?auto_896632 ) ) ( not ( = ?auto_896625 ?auto_896633 ) ) ( not ( = ?auto_896625 ?auto_896634 ) ) ( not ( = ?auto_896625 ?auto_896635 ) ) ( not ( = ?auto_896625 ?auto_896636 ) ) ( not ( = ?auto_896625 ?auto_896637 ) ) ( not ( = ?auto_896625 ?auto_896638 ) ) ( not ( = ?auto_896625 ?auto_896639 ) ) ( not ( = ?auto_896626 ?auto_896627 ) ) ( not ( = ?auto_896626 ?auto_896628 ) ) ( not ( = ?auto_896626 ?auto_896629 ) ) ( not ( = ?auto_896626 ?auto_896630 ) ) ( not ( = ?auto_896626 ?auto_896631 ) ) ( not ( = ?auto_896626 ?auto_896632 ) ) ( not ( = ?auto_896626 ?auto_896633 ) ) ( not ( = ?auto_896626 ?auto_896634 ) ) ( not ( = ?auto_896626 ?auto_896635 ) ) ( not ( = ?auto_896626 ?auto_896636 ) ) ( not ( = ?auto_896626 ?auto_896637 ) ) ( not ( = ?auto_896626 ?auto_896638 ) ) ( not ( = ?auto_896626 ?auto_896639 ) ) ( not ( = ?auto_896627 ?auto_896628 ) ) ( not ( = ?auto_896627 ?auto_896629 ) ) ( not ( = ?auto_896627 ?auto_896630 ) ) ( not ( = ?auto_896627 ?auto_896631 ) ) ( not ( = ?auto_896627 ?auto_896632 ) ) ( not ( = ?auto_896627 ?auto_896633 ) ) ( not ( = ?auto_896627 ?auto_896634 ) ) ( not ( = ?auto_896627 ?auto_896635 ) ) ( not ( = ?auto_896627 ?auto_896636 ) ) ( not ( = ?auto_896627 ?auto_896637 ) ) ( not ( = ?auto_896627 ?auto_896638 ) ) ( not ( = ?auto_896627 ?auto_896639 ) ) ( not ( = ?auto_896628 ?auto_896629 ) ) ( not ( = ?auto_896628 ?auto_896630 ) ) ( not ( = ?auto_896628 ?auto_896631 ) ) ( not ( = ?auto_896628 ?auto_896632 ) ) ( not ( = ?auto_896628 ?auto_896633 ) ) ( not ( = ?auto_896628 ?auto_896634 ) ) ( not ( = ?auto_896628 ?auto_896635 ) ) ( not ( = ?auto_896628 ?auto_896636 ) ) ( not ( = ?auto_896628 ?auto_896637 ) ) ( not ( = ?auto_896628 ?auto_896638 ) ) ( not ( = ?auto_896628 ?auto_896639 ) ) ( not ( = ?auto_896629 ?auto_896630 ) ) ( not ( = ?auto_896629 ?auto_896631 ) ) ( not ( = ?auto_896629 ?auto_896632 ) ) ( not ( = ?auto_896629 ?auto_896633 ) ) ( not ( = ?auto_896629 ?auto_896634 ) ) ( not ( = ?auto_896629 ?auto_896635 ) ) ( not ( = ?auto_896629 ?auto_896636 ) ) ( not ( = ?auto_896629 ?auto_896637 ) ) ( not ( = ?auto_896629 ?auto_896638 ) ) ( not ( = ?auto_896629 ?auto_896639 ) ) ( not ( = ?auto_896630 ?auto_896631 ) ) ( not ( = ?auto_896630 ?auto_896632 ) ) ( not ( = ?auto_896630 ?auto_896633 ) ) ( not ( = ?auto_896630 ?auto_896634 ) ) ( not ( = ?auto_896630 ?auto_896635 ) ) ( not ( = ?auto_896630 ?auto_896636 ) ) ( not ( = ?auto_896630 ?auto_896637 ) ) ( not ( = ?auto_896630 ?auto_896638 ) ) ( not ( = ?auto_896630 ?auto_896639 ) ) ( not ( = ?auto_896631 ?auto_896632 ) ) ( not ( = ?auto_896631 ?auto_896633 ) ) ( not ( = ?auto_896631 ?auto_896634 ) ) ( not ( = ?auto_896631 ?auto_896635 ) ) ( not ( = ?auto_896631 ?auto_896636 ) ) ( not ( = ?auto_896631 ?auto_896637 ) ) ( not ( = ?auto_896631 ?auto_896638 ) ) ( not ( = ?auto_896631 ?auto_896639 ) ) ( not ( = ?auto_896632 ?auto_896633 ) ) ( not ( = ?auto_896632 ?auto_896634 ) ) ( not ( = ?auto_896632 ?auto_896635 ) ) ( not ( = ?auto_896632 ?auto_896636 ) ) ( not ( = ?auto_896632 ?auto_896637 ) ) ( not ( = ?auto_896632 ?auto_896638 ) ) ( not ( = ?auto_896632 ?auto_896639 ) ) ( not ( = ?auto_896633 ?auto_896634 ) ) ( not ( = ?auto_896633 ?auto_896635 ) ) ( not ( = ?auto_896633 ?auto_896636 ) ) ( not ( = ?auto_896633 ?auto_896637 ) ) ( not ( = ?auto_896633 ?auto_896638 ) ) ( not ( = ?auto_896633 ?auto_896639 ) ) ( not ( = ?auto_896634 ?auto_896635 ) ) ( not ( = ?auto_896634 ?auto_896636 ) ) ( not ( = ?auto_896634 ?auto_896637 ) ) ( not ( = ?auto_896634 ?auto_896638 ) ) ( not ( = ?auto_896634 ?auto_896639 ) ) ( not ( = ?auto_896635 ?auto_896636 ) ) ( not ( = ?auto_896635 ?auto_896637 ) ) ( not ( = ?auto_896635 ?auto_896638 ) ) ( not ( = ?auto_896635 ?auto_896639 ) ) ( not ( = ?auto_896636 ?auto_896637 ) ) ( not ( = ?auto_896636 ?auto_896638 ) ) ( not ( = ?auto_896636 ?auto_896639 ) ) ( not ( = ?auto_896637 ?auto_896638 ) ) ( not ( = ?auto_896637 ?auto_896639 ) ) ( not ( = ?auto_896638 ?auto_896639 ) ) ( ON ?auto_896637 ?auto_896638 ) ( ON ?auto_896636 ?auto_896637 ) ( ON ?auto_896635 ?auto_896636 ) ( ON ?auto_896634 ?auto_896635 ) ( ON ?auto_896633 ?auto_896634 ) ( ON ?auto_896632 ?auto_896633 ) ( ON ?auto_896631 ?auto_896632 ) ( ON ?auto_896630 ?auto_896631 ) ( ON ?auto_896629 ?auto_896630 ) ( ON ?auto_896628 ?auto_896629 ) ( ON ?auto_896627 ?auto_896628 ) ( ON ?auto_896626 ?auto_896627 ) ( ON ?auto_896625 ?auto_896626 ) ( ON ?auto_896624 ?auto_896625 ) ( ON ?auto_896623 ?auto_896624 ) ( ON ?auto_896622 ?auto_896623 ) ( CLEAR ?auto_896622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_896622 )
      ( MAKE-17PILE ?auto_896622 ?auto_896623 ?auto_896624 ?auto_896625 ?auto_896626 ?auto_896627 ?auto_896628 ?auto_896629 ?auto_896630 ?auto_896631 ?auto_896632 ?auto_896633 ?auto_896634 ?auto_896635 ?auto_896636 ?auto_896637 ?auto_896638 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896693 - BLOCK
      ?auto_896694 - BLOCK
      ?auto_896695 - BLOCK
      ?auto_896696 - BLOCK
      ?auto_896697 - BLOCK
      ?auto_896698 - BLOCK
      ?auto_896699 - BLOCK
      ?auto_896700 - BLOCK
      ?auto_896701 - BLOCK
      ?auto_896702 - BLOCK
      ?auto_896703 - BLOCK
      ?auto_896704 - BLOCK
      ?auto_896705 - BLOCK
      ?auto_896706 - BLOCK
      ?auto_896707 - BLOCK
      ?auto_896708 - BLOCK
      ?auto_896709 - BLOCK
      ?auto_896710 - BLOCK
    )
    :vars
    (
      ?auto_896711 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_896709 ) ( ON ?auto_896710 ?auto_896711 ) ( CLEAR ?auto_896710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_896693 ) ( ON ?auto_896694 ?auto_896693 ) ( ON ?auto_896695 ?auto_896694 ) ( ON ?auto_896696 ?auto_896695 ) ( ON ?auto_896697 ?auto_896696 ) ( ON ?auto_896698 ?auto_896697 ) ( ON ?auto_896699 ?auto_896698 ) ( ON ?auto_896700 ?auto_896699 ) ( ON ?auto_896701 ?auto_896700 ) ( ON ?auto_896702 ?auto_896701 ) ( ON ?auto_896703 ?auto_896702 ) ( ON ?auto_896704 ?auto_896703 ) ( ON ?auto_896705 ?auto_896704 ) ( ON ?auto_896706 ?auto_896705 ) ( ON ?auto_896707 ?auto_896706 ) ( ON ?auto_896708 ?auto_896707 ) ( ON ?auto_896709 ?auto_896708 ) ( not ( = ?auto_896693 ?auto_896694 ) ) ( not ( = ?auto_896693 ?auto_896695 ) ) ( not ( = ?auto_896693 ?auto_896696 ) ) ( not ( = ?auto_896693 ?auto_896697 ) ) ( not ( = ?auto_896693 ?auto_896698 ) ) ( not ( = ?auto_896693 ?auto_896699 ) ) ( not ( = ?auto_896693 ?auto_896700 ) ) ( not ( = ?auto_896693 ?auto_896701 ) ) ( not ( = ?auto_896693 ?auto_896702 ) ) ( not ( = ?auto_896693 ?auto_896703 ) ) ( not ( = ?auto_896693 ?auto_896704 ) ) ( not ( = ?auto_896693 ?auto_896705 ) ) ( not ( = ?auto_896693 ?auto_896706 ) ) ( not ( = ?auto_896693 ?auto_896707 ) ) ( not ( = ?auto_896693 ?auto_896708 ) ) ( not ( = ?auto_896693 ?auto_896709 ) ) ( not ( = ?auto_896693 ?auto_896710 ) ) ( not ( = ?auto_896693 ?auto_896711 ) ) ( not ( = ?auto_896694 ?auto_896695 ) ) ( not ( = ?auto_896694 ?auto_896696 ) ) ( not ( = ?auto_896694 ?auto_896697 ) ) ( not ( = ?auto_896694 ?auto_896698 ) ) ( not ( = ?auto_896694 ?auto_896699 ) ) ( not ( = ?auto_896694 ?auto_896700 ) ) ( not ( = ?auto_896694 ?auto_896701 ) ) ( not ( = ?auto_896694 ?auto_896702 ) ) ( not ( = ?auto_896694 ?auto_896703 ) ) ( not ( = ?auto_896694 ?auto_896704 ) ) ( not ( = ?auto_896694 ?auto_896705 ) ) ( not ( = ?auto_896694 ?auto_896706 ) ) ( not ( = ?auto_896694 ?auto_896707 ) ) ( not ( = ?auto_896694 ?auto_896708 ) ) ( not ( = ?auto_896694 ?auto_896709 ) ) ( not ( = ?auto_896694 ?auto_896710 ) ) ( not ( = ?auto_896694 ?auto_896711 ) ) ( not ( = ?auto_896695 ?auto_896696 ) ) ( not ( = ?auto_896695 ?auto_896697 ) ) ( not ( = ?auto_896695 ?auto_896698 ) ) ( not ( = ?auto_896695 ?auto_896699 ) ) ( not ( = ?auto_896695 ?auto_896700 ) ) ( not ( = ?auto_896695 ?auto_896701 ) ) ( not ( = ?auto_896695 ?auto_896702 ) ) ( not ( = ?auto_896695 ?auto_896703 ) ) ( not ( = ?auto_896695 ?auto_896704 ) ) ( not ( = ?auto_896695 ?auto_896705 ) ) ( not ( = ?auto_896695 ?auto_896706 ) ) ( not ( = ?auto_896695 ?auto_896707 ) ) ( not ( = ?auto_896695 ?auto_896708 ) ) ( not ( = ?auto_896695 ?auto_896709 ) ) ( not ( = ?auto_896695 ?auto_896710 ) ) ( not ( = ?auto_896695 ?auto_896711 ) ) ( not ( = ?auto_896696 ?auto_896697 ) ) ( not ( = ?auto_896696 ?auto_896698 ) ) ( not ( = ?auto_896696 ?auto_896699 ) ) ( not ( = ?auto_896696 ?auto_896700 ) ) ( not ( = ?auto_896696 ?auto_896701 ) ) ( not ( = ?auto_896696 ?auto_896702 ) ) ( not ( = ?auto_896696 ?auto_896703 ) ) ( not ( = ?auto_896696 ?auto_896704 ) ) ( not ( = ?auto_896696 ?auto_896705 ) ) ( not ( = ?auto_896696 ?auto_896706 ) ) ( not ( = ?auto_896696 ?auto_896707 ) ) ( not ( = ?auto_896696 ?auto_896708 ) ) ( not ( = ?auto_896696 ?auto_896709 ) ) ( not ( = ?auto_896696 ?auto_896710 ) ) ( not ( = ?auto_896696 ?auto_896711 ) ) ( not ( = ?auto_896697 ?auto_896698 ) ) ( not ( = ?auto_896697 ?auto_896699 ) ) ( not ( = ?auto_896697 ?auto_896700 ) ) ( not ( = ?auto_896697 ?auto_896701 ) ) ( not ( = ?auto_896697 ?auto_896702 ) ) ( not ( = ?auto_896697 ?auto_896703 ) ) ( not ( = ?auto_896697 ?auto_896704 ) ) ( not ( = ?auto_896697 ?auto_896705 ) ) ( not ( = ?auto_896697 ?auto_896706 ) ) ( not ( = ?auto_896697 ?auto_896707 ) ) ( not ( = ?auto_896697 ?auto_896708 ) ) ( not ( = ?auto_896697 ?auto_896709 ) ) ( not ( = ?auto_896697 ?auto_896710 ) ) ( not ( = ?auto_896697 ?auto_896711 ) ) ( not ( = ?auto_896698 ?auto_896699 ) ) ( not ( = ?auto_896698 ?auto_896700 ) ) ( not ( = ?auto_896698 ?auto_896701 ) ) ( not ( = ?auto_896698 ?auto_896702 ) ) ( not ( = ?auto_896698 ?auto_896703 ) ) ( not ( = ?auto_896698 ?auto_896704 ) ) ( not ( = ?auto_896698 ?auto_896705 ) ) ( not ( = ?auto_896698 ?auto_896706 ) ) ( not ( = ?auto_896698 ?auto_896707 ) ) ( not ( = ?auto_896698 ?auto_896708 ) ) ( not ( = ?auto_896698 ?auto_896709 ) ) ( not ( = ?auto_896698 ?auto_896710 ) ) ( not ( = ?auto_896698 ?auto_896711 ) ) ( not ( = ?auto_896699 ?auto_896700 ) ) ( not ( = ?auto_896699 ?auto_896701 ) ) ( not ( = ?auto_896699 ?auto_896702 ) ) ( not ( = ?auto_896699 ?auto_896703 ) ) ( not ( = ?auto_896699 ?auto_896704 ) ) ( not ( = ?auto_896699 ?auto_896705 ) ) ( not ( = ?auto_896699 ?auto_896706 ) ) ( not ( = ?auto_896699 ?auto_896707 ) ) ( not ( = ?auto_896699 ?auto_896708 ) ) ( not ( = ?auto_896699 ?auto_896709 ) ) ( not ( = ?auto_896699 ?auto_896710 ) ) ( not ( = ?auto_896699 ?auto_896711 ) ) ( not ( = ?auto_896700 ?auto_896701 ) ) ( not ( = ?auto_896700 ?auto_896702 ) ) ( not ( = ?auto_896700 ?auto_896703 ) ) ( not ( = ?auto_896700 ?auto_896704 ) ) ( not ( = ?auto_896700 ?auto_896705 ) ) ( not ( = ?auto_896700 ?auto_896706 ) ) ( not ( = ?auto_896700 ?auto_896707 ) ) ( not ( = ?auto_896700 ?auto_896708 ) ) ( not ( = ?auto_896700 ?auto_896709 ) ) ( not ( = ?auto_896700 ?auto_896710 ) ) ( not ( = ?auto_896700 ?auto_896711 ) ) ( not ( = ?auto_896701 ?auto_896702 ) ) ( not ( = ?auto_896701 ?auto_896703 ) ) ( not ( = ?auto_896701 ?auto_896704 ) ) ( not ( = ?auto_896701 ?auto_896705 ) ) ( not ( = ?auto_896701 ?auto_896706 ) ) ( not ( = ?auto_896701 ?auto_896707 ) ) ( not ( = ?auto_896701 ?auto_896708 ) ) ( not ( = ?auto_896701 ?auto_896709 ) ) ( not ( = ?auto_896701 ?auto_896710 ) ) ( not ( = ?auto_896701 ?auto_896711 ) ) ( not ( = ?auto_896702 ?auto_896703 ) ) ( not ( = ?auto_896702 ?auto_896704 ) ) ( not ( = ?auto_896702 ?auto_896705 ) ) ( not ( = ?auto_896702 ?auto_896706 ) ) ( not ( = ?auto_896702 ?auto_896707 ) ) ( not ( = ?auto_896702 ?auto_896708 ) ) ( not ( = ?auto_896702 ?auto_896709 ) ) ( not ( = ?auto_896702 ?auto_896710 ) ) ( not ( = ?auto_896702 ?auto_896711 ) ) ( not ( = ?auto_896703 ?auto_896704 ) ) ( not ( = ?auto_896703 ?auto_896705 ) ) ( not ( = ?auto_896703 ?auto_896706 ) ) ( not ( = ?auto_896703 ?auto_896707 ) ) ( not ( = ?auto_896703 ?auto_896708 ) ) ( not ( = ?auto_896703 ?auto_896709 ) ) ( not ( = ?auto_896703 ?auto_896710 ) ) ( not ( = ?auto_896703 ?auto_896711 ) ) ( not ( = ?auto_896704 ?auto_896705 ) ) ( not ( = ?auto_896704 ?auto_896706 ) ) ( not ( = ?auto_896704 ?auto_896707 ) ) ( not ( = ?auto_896704 ?auto_896708 ) ) ( not ( = ?auto_896704 ?auto_896709 ) ) ( not ( = ?auto_896704 ?auto_896710 ) ) ( not ( = ?auto_896704 ?auto_896711 ) ) ( not ( = ?auto_896705 ?auto_896706 ) ) ( not ( = ?auto_896705 ?auto_896707 ) ) ( not ( = ?auto_896705 ?auto_896708 ) ) ( not ( = ?auto_896705 ?auto_896709 ) ) ( not ( = ?auto_896705 ?auto_896710 ) ) ( not ( = ?auto_896705 ?auto_896711 ) ) ( not ( = ?auto_896706 ?auto_896707 ) ) ( not ( = ?auto_896706 ?auto_896708 ) ) ( not ( = ?auto_896706 ?auto_896709 ) ) ( not ( = ?auto_896706 ?auto_896710 ) ) ( not ( = ?auto_896706 ?auto_896711 ) ) ( not ( = ?auto_896707 ?auto_896708 ) ) ( not ( = ?auto_896707 ?auto_896709 ) ) ( not ( = ?auto_896707 ?auto_896710 ) ) ( not ( = ?auto_896707 ?auto_896711 ) ) ( not ( = ?auto_896708 ?auto_896709 ) ) ( not ( = ?auto_896708 ?auto_896710 ) ) ( not ( = ?auto_896708 ?auto_896711 ) ) ( not ( = ?auto_896709 ?auto_896710 ) ) ( not ( = ?auto_896709 ?auto_896711 ) ) ( not ( = ?auto_896710 ?auto_896711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_896710 ?auto_896711 )
      ( !STACK ?auto_896710 ?auto_896709 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896730 - BLOCK
      ?auto_896731 - BLOCK
      ?auto_896732 - BLOCK
      ?auto_896733 - BLOCK
      ?auto_896734 - BLOCK
      ?auto_896735 - BLOCK
      ?auto_896736 - BLOCK
      ?auto_896737 - BLOCK
      ?auto_896738 - BLOCK
      ?auto_896739 - BLOCK
      ?auto_896740 - BLOCK
      ?auto_896741 - BLOCK
      ?auto_896742 - BLOCK
      ?auto_896743 - BLOCK
      ?auto_896744 - BLOCK
      ?auto_896745 - BLOCK
      ?auto_896746 - BLOCK
      ?auto_896747 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_896746 ) ( ON-TABLE ?auto_896747 ) ( CLEAR ?auto_896747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_896730 ) ( ON ?auto_896731 ?auto_896730 ) ( ON ?auto_896732 ?auto_896731 ) ( ON ?auto_896733 ?auto_896732 ) ( ON ?auto_896734 ?auto_896733 ) ( ON ?auto_896735 ?auto_896734 ) ( ON ?auto_896736 ?auto_896735 ) ( ON ?auto_896737 ?auto_896736 ) ( ON ?auto_896738 ?auto_896737 ) ( ON ?auto_896739 ?auto_896738 ) ( ON ?auto_896740 ?auto_896739 ) ( ON ?auto_896741 ?auto_896740 ) ( ON ?auto_896742 ?auto_896741 ) ( ON ?auto_896743 ?auto_896742 ) ( ON ?auto_896744 ?auto_896743 ) ( ON ?auto_896745 ?auto_896744 ) ( ON ?auto_896746 ?auto_896745 ) ( not ( = ?auto_896730 ?auto_896731 ) ) ( not ( = ?auto_896730 ?auto_896732 ) ) ( not ( = ?auto_896730 ?auto_896733 ) ) ( not ( = ?auto_896730 ?auto_896734 ) ) ( not ( = ?auto_896730 ?auto_896735 ) ) ( not ( = ?auto_896730 ?auto_896736 ) ) ( not ( = ?auto_896730 ?auto_896737 ) ) ( not ( = ?auto_896730 ?auto_896738 ) ) ( not ( = ?auto_896730 ?auto_896739 ) ) ( not ( = ?auto_896730 ?auto_896740 ) ) ( not ( = ?auto_896730 ?auto_896741 ) ) ( not ( = ?auto_896730 ?auto_896742 ) ) ( not ( = ?auto_896730 ?auto_896743 ) ) ( not ( = ?auto_896730 ?auto_896744 ) ) ( not ( = ?auto_896730 ?auto_896745 ) ) ( not ( = ?auto_896730 ?auto_896746 ) ) ( not ( = ?auto_896730 ?auto_896747 ) ) ( not ( = ?auto_896731 ?auto_896732 ) ) ( not ( = ?auto_896731 ?auto_896733 ) ) ( not ( = ?auto_896731 ?auto_896734 ) ) ( not ( = ?auto_896731 ?auto_896735 ) ) ( not ( = ?auto_896731 ?auto_896736 ) ) ( not ( = ?auto_896731 ?auto_896737 ) ) ( not ( = ?auto_896731 ?auto_896738 ) ) ( not ( = ?auto_896731 ?auto_896739 ) ) ( not ( = ?auto_896731 ?auto_896740 ) ) ( not ( = ?auto_896731 ?auto_896741 ) ) ( not ( = ?auto_896731 ?auto_896742 ) ) ( not ( = ?auto_896731 ?auto_896743 ) ) ( not ( = ?auto_896731 ?auto_896744 ) ) ( not ( = ?auto_896731 ?auto_896745 ) ) ( not ( = ?auto_896731 ?auto_896746 ) ) ( not ( = ?auto_896731 ?auto_896747 ) ) ( not ( = ?auto_896732 ?auto_896733 ) ) ( not ( = ?auto_896732 ?auto_896734 ) ) ( not ( = ?auto_896732 ?auto_896735 ) ) ( not ( = ?auto_896732 ?auto_896736 ) ) ( not ( = ?auto_896732 ?auto_896737 ) ) ( not ( = ?auto_896732 ?auto_896738 ) ) ( not ( = ?auto_896732 ?auto_896739 ) ) ( not ( = ?auto_896732 ?auto_896740 ) ) ( not ( = ?auto_896732 ?auto_896741 ) ) ( not ( = ?auto_896732 ?auto_896742 ) ) ( not ( = ?auto_896732 ?auto_896743 ) ) ( not ( = ?auto_896732 ?auto_896744 ) ) ( not ( = ?auto_896732 ?auto_896745 ) ) ( not ( = ?auto_896732 ?auto_896746 ) ) ( not ( = ?auto_896732 ?auto_896747 ) ) ( not ( = ?auto_896733 ?auto_896734 ) ) ( not ( = ?auto_896733 ?auto_896735 ) ) ( not ( = ?auto_896733 ?auto_896736 ) ) ( not ( = ?auto_896733 ?auto_896737 ) ) ( not ( = ?auto_896733 ?auto_896738 ) ) ( not ( = ?auto_896733 ?auto_896739 ) ) ( not ( = ?auto_896733 ?auto_896740 ) ) ( not ( = ?auto_896733 ?auto_896741 ) ) ( not ( = ?auto_896733 ?auto_896742 ) ) ( not ( = ?auto_896733 ?auto_896743 ) ) ( not ( = ?auto_896733 ?auto_896744 ) ) ( not ( = ?auto_896733 ?auto_896745 ) ) ( not ( = ?auto_896733 ?auto_896746 ) ) ( not ( = ?auto_896733 ?auto_896747 ) ) ( not ( = ?auto_896734 ?auto_896735 ) ) ( not ( = ?auto_896734 ?auto_896736 ) ) ( not ( = ?auto_896734 ?auto_896737 ) ) ( not ( = ?auto_896734 ?auto_896738 ) ) ( not ( = ?auto_896734 ?auto_896739 ) ) ( not ( = ?auto_896734 ?auto_896740 ) ) ( not ( = ?auto_896734 ?auto_896741 ) ) ( not ( = ?auto_896734 ?auto_896742 ) ) ( not ( = ?auto_896734 ?auto_896743 ) ) ( not ( = ?auto_896734 ?auto_896744 ) ) ( not ( = ?auto_896734 ?auto_896745 ) ) ( not ( = ?auto_896734 ?auto_896746 ) ) ( not ( = ?auto_896734 ?auto_896747 ) ) ( not ( = ?auto_896735 ?auto_896736 ) ) ( not ( = ?auto_896735 ?auto_896737 ) ) ( not ( = ?auto_896735 ?auto_896738 ) ) ( not ( = ?auto_896735 ?auto_896739 ) ) ( not ( = ?auto_896735 ?auto_896740 ) ) ( not ( = ?auto_896735 ?auto_896741 ) ) ( not ( = ?auto_896735 ?auto_896742 ) ) ( not ( = ?auto_896735 ?auto_896743 ) ) ( not ( = ?auto_896735 ?auto_896744 ) ) ( not ( = ?auto_896735 ?auto_896745 ) ) ( not ( = ?auto_896735 ?auto_896746 ) ) ( not ( = ?auto_896735 ?auto_896747 ) ) ( not ( = ?auto_896736 ?auto_896737 ) ) ( not ( = ?auto_896736 ?auto_896738 ) ) ( not ( = ?auto_896736 ?auto_896739 ) ) ( not ( = ?auto_896736 ?auto_896740 ) ) ( not ( = ?auto_896736 ?auto_896741 ) ) ( not ( = ?auto_896736 ?auto_896742 ) ) ( not ( = ?auto_896736 ?auto_896743 ) ) ( not ( = ?auto_896736 ?auto_896744 ) ) ( not ( = ?auto_896736 ?auto_896745 ) ) ( not ( = ?auto_896736 ?auto_896746 ) ) ( not ( = ?auto_896736 ?auto_896747 ) ) ( not ( = ?auto_896737 ?auto_896738 ) ) ( not ( = ?auto_896737 ?auto_896739 ) ) ( not ( = ?auto_896737 ?auto_896740 ) ) ( not ( = ?auto_896737 ?auto_896741 ) ) ( not ( = ?auto_896737 ?auto_896742 ) ) ( not ( = ?auto_896737 ?auto_896743 ) ) ( not ( = ?auto_896737 ?auto_896744 ) ) ( not ( = ?auto_896737 ?auto_896745 ) ) ( not ( = ?auto_896737 ?auto_896746 ) ) ( not ( = ?auto_896737 ?auto_896747 ) ) ( not ( = ?auto_896738 ?auto_896739 ) ) ( not ( = ?auto_896738 ?auto_896740 ) ) ( not ( = ?auto_896738 ?auto_896741 ) ) ( not ( = ?auto_896738 ?auto_896742 ) ) ( not ( = ?auto_896738 ?auto_896743 ) ) ( not ( = ?auto_896738 ?auto_896744 ) ) ( not ( = ?auto_896738 ?auto_896745 ) ) ( not ( = ?auto_896738 ?auto_896746 ) ) ( not ( = ?auto_896738 ?auto_896747 ) ) ( not ( = ?auto_896739 ?auto_896740 ) ) ( not ( = ?auto_896739 ?auto_896741 ) ) ( not ( = ?auto_896739 ?auto_896742 ) ) ( not ( = ?auto_896739 ?auto_896743 ) ) ( not ( = ?auto_896739 ?auto_896744 ) ) ( not ( = ?auto_896739 ?auto_896745 ) ) ( not ( = ?auto_896739 ?auto_896746 ) ) ( not ( = ?auto_896739 ?auto_896747 ) ) ( not ( = ?auto_896740 ?auto_896741 ) ) ( not ( = ?auto_896740 ?auto_896742 ) ) ( not ( = ?auto_896740 ?auto_896743 ) ) ( not ( = ?auto_896740 ?auto_896744 ) ) ( not ( = ?auto_896740 ?auto_896745 ) ) ( not ( = ?auto_896740 ?auto_896746 ) ) ( not ( = ?auto_896740 ?auto_896747 ) ) ( not ( = ?auto_896741 ?auto_896742 ) ) ( not ( = ?auto_896741 ?auto_896743 ) ) ( not ( = ?auto_896741 ?auto_896744 ) ) ( not ( = ?auto_896741 ?auto_896745 ) ) ( not ( = ?auto_896741 ?auto_896746 ) ) ( not ( = ?auto_896741 ?auto_896747 ) ) ( not ( = ?auto_896742 ?auto_896743 ) ) ( not ( = ?auto_896742 ?auto_896744 ) ) ( not ( = ?auto_896742 ?auto_896745 ) ) ( not ( = ?auto_896742 ?auto_896746 ) ) ( not ( = ?auto_896742 ?auto_896747 ) ) ( not ( = ?auto_896743 ?auto_896744 ) ) ( not ( = ?auto_896743 ?auto_896745 ) ) ( not ( = ?auto_896743 ?auto_896746 ) ) ( not ( = ?auto_896743 ?auto_896747 ) ) ( not ( = ?auto_896744 ?auto_896745 ) ) ( not ( = ?auto_896744 ?auto_896746 ) ) ( not ( = ?auto_896744 ?auto_896747 ) ) ( not ( = ?auto_896745 ?auto_896746 ) ) ( not ( = ?auto_896745 ?auto_896747 ) ) ( not ( = ?auto_896746 ?auto_896747 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_896747 )
      ( !STACK ?auto_896747 ?auto_896746 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896766 - BLOCK
      ?auto_896767 - BLOCK
      ?auto_896768 - BLOCK
      ?auto_896769 - BLOCK
      ?auto_896770 - BLOCK
      ?auto_896771 - BLOCK
      ?auto_896772 - BLOCK
      ?auto_896773 - BLOCK
      ?auto_896774 - BLOCK
      ?auto_896775 - BLOCK
      ?auto_896776 - BLOCK
      ?auto_896777 - BLOCK
      ?auto_896778 - BLOCK
      ?auto_896779 - BLOCK
      ?auto_896780 - BLOCK
      ?auto_896781 - BLOCK
      ?auto_896782 - BLOCK
      ?auto_896783 - BLOCK
    )
    :vars
    (
      ?auto_896784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896783 ?auto_896784 ) ( ON-TABLE ?auto_896766 ) ( ON ?auto_896767 ?auto_896766 ) ( ON ?auto_896768 ?auto_896767 ) ( ON ?auto_896769 ?auto_896768 ) ( ON ?auto_896770 ?auto_896769 ) ( ON ?auto_896771 ?auto_896770 ) ( ON ?auto_896772 ?auto_896771 ) ( ON ?auto_896773 ?auto_896772 ) ( ON ?auto_896774 ?auto_896773 ) ( ON ?auto_896775 ?auto_896774 ) ( ON ?auto_896776 ?auto_896775 ) ( ON ?auto_896777 ?auto_896776 ) ( ON ?auto_896778 ?auto_896777 ) ( ON ?auto_896779 ?auto_896778 ) ( ON ?auto_896780 ?auto_896779 ) ( ON ?auto_896781 ?auto_896780 ) ( not ( = ?auto_896766 ?auto_896767 ) ) ( not ( = ?auto_896766 ?auto_896768 ) ) ( not ( = ?auto_896766 ?auto_896769 ) ) ( not ( = ?auto_896766 ?auto_896770 ) ) ( not ( = ?auto_896766 ?auto_896771 ) ) ( not ( = ?auto_896766 ?auto_896772 ) ) ( not ( = ?auto_896766 ?auto_896773 ) ) ( not ( = ?auto_896766 ?auto_896774 ) ) ( not ( = ?auto_896766 ?auto_896775 ) ) ( not ( = ?auto_896766 ?auto_896776 ) ) ( not ( = ?auto_896766 ?auto_896777 ) ) ( not ( = ?auto_896766 ?auto_896778 ) ) ( not ( = ?auto_896766 ?auto_896779 ) ) ( not ( = ?auto_896766 ?auto_896780 ) ) ( not ( = ?auto_896766 ?auto_896781 ) ) ( not ( = ?auto_896766 ?auto_896782 ) ) ( not ( = ?auto_896766 ?auto_896783 ) ) ( not ( = ?auto_896766 ?auto_896784 ) ) ( not ( = ?auto_896767 ?auto_896768 ) ) ( not ( = ?auto_896767 ?auto_896769 ) ) ( not ( = ?auto_896767 ?auto_896770 ) ) ( not ( = ?auto_896767 ?auto_896771 ) ) ( not ( = ?auto_896767 ?auto_896772 ) ) ( not ( = ?auto_896767 ?auto_896773 ) ) ( not ( = ?auto_896767 ?auto_896774 ) ) ( not ( = ?auto_896767 ?auto_896775 ) ) ( not ( = ?auto_896767 ?auto_896776 ) ) ( not ( = ?auto_896767 ?auto_896777 ) ) ( not ( = ?auto_896767 ?auto_896778 ) ) ( not ( = ?auto_896767 ?auto_896779 ) ) ( not ( = ?auto_896767 ?auto_896780 ) ) ( not ( = ?auto_896767 ?auto_896781 ) ) ( not ( = ?auto_896767 ?auto_896782 ) ) ( not ( = ?auto_896767 ?auto_896783 ) ) ( not ( = ?auto_896767 ?auto_896784 ) ) ( not ( = ?auto_896768 ?auto_896769 ) ) ( not ( = ?auto_896768 ?auto_896770 ) ) ( not ( = ?auto_896768 ?auto_896771 ) ) ( not ( = ?auto_896768 ?auto_896772 ) ) ( not ( = ?auto_896768 ?auto_896773 ) ) ( not ( = ?auto_896768 ?auto_896774 ) ) ( not ( = ?auto_896768 ?auto_896775 ) ) ( not ( = ?auto_896768 ?auto_896776 ) ) ( not ( = ?auto_896768 ?auto_896777 ) ) ( not ( = ?auto_896768 ?auto_896778 ) ) ( not ( = ?auto_896768 ?auto_896779 ) ) ( not ( = ?auto_896768 ?auto_896780 ) ) ( not ( = ?auto_896768 ?auto_896781 ) ) ( not ( = ?auto_896768 ?auto_896782 ) ) ( not ( = ?auto_896768 ?auto_896783 ) ) ( not ( = ?auto_896768 ?auto_896784 ) ) ( not ( = ?auto_896769 ?auto_896770 ) ) ( not ( = ?auto_896769 ?auto_896771 ) ) ( not ( = ?auto_896769 ?auto_896772 ) ) ( not ( = ?auto_896769 ?auto_896773 ) ) ( not ( = ?auto_896769 ?auto_896774 ) ) ( not ( = ?auto_896769 ?auto_896775 ) ) ( not ( = ?auto_896769 ?auto_896776 ) ) ( not ( = ?auto_896769 ?auto_896777 ) ) ( not ( = ?auto_896769 ?auto_896778 ) ) ( not ( = ?auto_896769 ?auto_896779 ) ) ( not ( = ?auto_896769 ?auto_896780 ) ) ( not ( = ?auto_896769 ?auto_896781 ) ) ( not ( = ?auto_896769 ?auto_896782 ) ) ( not ( = ?auto_896769 ?auto_896783 ) ) ( not ( = ?auto_896769 ?auto_896784 ) ) ( not ( = ?auto_896770 ?auto_896771 ) ) ( not ( = ?auto_896770 ?auto_896772 ) ) ( not ( = ?auto_896770 ?auto_896773 ) ) ( not ( = ?auto_896770 ?auto_896774 ) ) ( not ( = ?auto_896770 ?auto_896775 ) ) ( not ( = ?auto_896770 ?auto_896776 ) ) ( not ( = ?auto_896770 ?auto_896777 ) ) ( not ( = ?auto_896770 ?auto_896778 ) ) ( not ( = ?auto_896770 ?auto_896779 ) ) ( not ( = ?auto_896770 ?auto_896780 ) ) ( not ( = ?auto_896770 ?auto_896781 ) ) ( not ( = ?auto_896770 ?auto_896782 ) ) ( not ( = ?auto_896770 ?auto_896783 ) ) ( not ( = ?auto_896770 ?auto_896784 ) ) ( not ( = ?auto_896771 ?auto_896772 ) ) ( not ( = ?auto_896771 ?auto_896773 ) ) ( not ( = ?auto_896771 ?auto_896774 ) ) ( not ( = ?auto_896771 ?auto_896775 ) ) ( not ( = ?auto_896771 ?auto_896776 ) ) ( not ( = ?auto_896771 ?auto_896777 ) ) ( not ( = ?auto_896771 ?auto_896778 ) ) ( not ( = ?auto_896771 ?auto_896779 ) ) ( not ( = ?auto_896771 ?auto_896780 ) ) ( not ( = ?auto_896771 ?auto_896781 ) ) ( not ( = ?auto_896771 ?auto_896782 ) ) ( not ( = ?auto_896771 ?auto_896783 ) ) ( not ( = ?auto_896771 ?auto_896784 ) ) ( not ( = ?auto_896772 ?auto_896773 ) ) ( not ( = ?auto_896772 ?auto_896774 ) ) ( not ( = ?auto_896772 ?auto_896775 ) ) ( not ( = ?auto_896772 ?auto_896776 ) ) ( not ( = ?auto_896772 ?auto_896777 ) ) ( not ( = ?auto_896772 ?auto_896778 ) ) ( not ( = ?auto_896772 ?auto_896779 ) ) ( not ( = ?auto_896772 ?auto_896780 ) ) ( not ( = ?auto_896772 ?auto_896781 ) ) ( not ( = ?auto_896772 ?auto_896782 ) ) ( not ( = ?auto_896772 ?auto_896783 ) ) ( not ( = ?auto_896772 ?auto_896784 ) ) ( not ( = ?auto_896773 ?auto_896774 ) ) ( not ( = ?auto_896773 ?auto_896775 ) ) ( not ( = ?auto_896773 ?auto_896776 ) ) ( not ( = ?auto_896773 ?auto_896777 ) ) ( not ( = ?auto_896773 ?auto_896778 ) ) ( not ( = ?auto_896773 ?auto_896779 ) ) ( not ( = ?auto_896773 ?auto_896780 ) ) ( not ( = ?auto_896773 ?auto_896781 ) ) ( not ( = ?auto_896773 ?auto_896782 ) ) ( not ( = ?auto_896773 ?auto_896783 ) ) ( not ( = ?auto_896773 ?auto_896784 ) ) ( not ( = ?auto_896774 ?auto_896775 ) ) ( not ( = ?auto_896774 ?auto_896776 ) ) ( not ( = ?auto_896774 ?auto_896777 ) ) ( not ( = ?auto_896774 ?auto_896778 ) ) ( not ( = ?auto_896774 ?auto_896779 ) ) ( not ( = ?auto_896774 ?auto_896780 ) ) ( not ( = ?auto_896774 ?auto_896781 ) ) ( not ( = ?auto_896774 ?auto_896782 ) ) ( not ( = ?auto_896774 ?auto_896783 ) ) ( not ( = ?auto_896774 ?auto_896784 ) ) ( not ( = ?auto_896775 ?auto_896776 ) ) ( not ( = ?auto_896775 ?auto_896777 ) ) ( not ( = ?auto_896775 ?auto_896778 ) ) ( not ( = ?auto_896775 ?auto_896779 ) ) ( not ( = ?auto_896775 ?auto_896780 ) ) ( not ( = ?auto_896775 ?auto_896781 ) ) ( not ( = ?auto_896775 ?auto_896782 ) ) ( not ( = ?auto_896775 ?auto_896783 ) ) ( not ( = ?auto_896775 ?auto_896784 ) ) ( not ( = ?auto_896776 ?auto_896777 ) ) ( not ( = ?auto_896776 ?auto_896778 ) ) ( not ( = ?auto_896776 ?auto_896779 ) ) ( not ( = ?auto_896776 ?auto_896780 ) ) ( not ( = ?auto_896776 ?auto_896781 ) ) ( not ( = ?auto_896776 ?auto_896782 ) ) ( not ( = ?auto_896776 ?auto_896783 ) ) ( not ( = ?auto_896776 ?auto_896784 ) ) ( not ( = ?auto_896777 ?auto_896778 ) ) ( not ( = ?auto_896777 ?auto_896779 ) ) ( not ( = ?auto_896777 ?auto_896780 ) ) ( not ( = ?auto_896777 ?auto_896781 ) ) ( not ( = ?auto_896777 ?auto_896782 ) ) ( not ( = ?auto_896777 ?auto_896783 ) ) ( not ( = ?auto_896777 ?auto_896784 ) ) ( not ( = ?auto_896778 ?auto_896779 ) ) ( not ( = ?auto_896778 ?auto_896780 ) ) ( not ( = ?auto_896778 ?auto_896781 ) ) ( not ( = ?auto_896778 ?auto_896782 ) ) ( not ( = ?auto_896778 ?auto_896783 ) ) ( not ( = ?auto_896778 ?auto_896784 ) ) ( not ( = ?auto_896779 ?auto_896780 ) ) ( not ( = ?auto_896779 ?auto_896781 ) ) ( not ( = ?auto_896779 ?auto_896782 ) ) ( not ( = ?auto_896779 ?auto_896783 ) ) ( not ( = ?auto_896779 ?auto_896784 ) ) ( not ( = ?auto_896780 ?auto_896781 ) ) ( not ( = ?auto_896780 ?auto_896782 ) ) ( not ( = ?auto_896780 ?auto_896783 ) ) ( not ( = ?auto_896780 ?auto_896784 ) ) ( not ( = ?auto_896781 ?auto_896782 ) ) ( not ( = ?auto_896781 ?auto_896783 ) ) ( not ( = ?auto_896781 ?auto_896784 ) ) ( not ( = ?auto_896782 ?auto_896783 ) ) ( not ( = ?auto_896782 ?auto_896784 ) ) ( not ( = ?auto_896783 ?auto_896784 ) ) ( CLEAR ?auto_896781 ) ( ON ?auto_896782 ?auto_896783 ) ( CLEAR ?auto_896782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_896766 ?auto_896767 ?auto_896768 ?auto_896769 ?auto_896770 ?auto_896771 ?auto_896772 ?auto_896773 ?auto_896774 ?auto_896775 ?auto_896776 ?auto_896777 ?auto_896778 ?auto_896779 ?auto_896780 ?auto_896781 ?auto_896782 )
      ( MAKE-18PILE ?auto_896766 ?auto_896767 ?auto_896768 ?auto_896769 ?auto_896770 ?auto_896771 ?auto_896772 ?auto_896773 ?auto_896774 ?auto_896775 ?auto_896776 ?auto_896777 ?auto_896778 ?auto_896779 ?auto_896780 ?auto_896781 ?auto_896782 ?auto_896783 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896803 - BLOCK
      ?auto_896804 - BLOCK
      ?auto_896805 - BLOCK
      ?auto_896806 - BLOCK
      ?auto_896807 - BLOCK
      ?auto_896808 - BLOCK
      ?auto_896809 - BLOCK
      ?auto_896810 - BLOCK
      ?auto_896811 - BLOCK
      ?auto_896812 - BLOCK
      ?auto_896813 - BLOCK
      ?auto_896814 - BLOCK
      ?auto_896815 - BLOCK
      ?auto_896816 - BLOCK
      ?auto_896817 - BLOCK
      ?auto_896818 - BLOCK
      ?auto_896819 - BLOCK
      ?auto_896820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_896820 ) ( ON-TABLE ?auto_896803 ) ( ON ?auto_896804 ?auto_896803 ) ( ON ?auto_896805 ?auto_896804 ) ( ON ?auto_896806 ?auto_896805 ) ( ON ?auto_896807 ?auto_896806 ) ( ON ?auto_896808 ?auto_896807 ) ( ON ?auto_896809 ?auto_896808 ) ( ON ?auto_896810 ?auto_896809 ) ( ON ?auto_896811 ?auto_896810 ) ( ON ?auto_896812 ?auto_896811 ) ( ON ?auto_896813 ?auto_896812 ) ( ON ?auto_896814 ?auto_896813 ) ( ON ?auto_896815 ?auto_896814 ) ( ON ?auto_896816 ?auto_896815 ) ( ON ?auto_896817 ?auto_896816 ) ( ON ?auto_896818 ?auto_896817 ) ( not ( = ?auto_896803 ?auto_896804 ) ) ( not ( = ?auto_896803 ?auto_896805 ) ) ( not ( = ?auto_896803 ?auto_896806 ) ) ( not ( = ?auto_896803 ?auto_896807 ) ) ( not ( = ?auto_896803 ?auto_896808 ) ) ( not ( = ?auto_896803 ?auto_896809 ) ) ( not ( = ?auto_896803 ?auto_896810 ) ) ( not ( = ?auto_896803 ?auto_896811 ) ) ( not ( = ?auto_896803 ?auto_896812 ) ) ( not ( = ?auto_896803 ?auto_896813 ) ) ( not ( = ?auto_896803 ?auto_896814 ) ) ( not ( = ?auto_896803 ?auto_896815 ) ) ( not ( = ?auto_896803 ?auto_896816 ) ) ( not ( = ?auto_896803 ?auto_896817 ) ) ( not ( = ?auto_896803 ?auto_896818 ) ) ( not ( = ?auto_896803 ?auto_896819 ) ) ( not ( = ?auto_896803 ?auto_896820 ) ) ( not ( = ?auto_896804 ?auto_896805 ) ) ( not ( = ?auto_896804 ?auto_896806 ) ) ( not ( = ?auto_896804 ?auto_896807 ) ) ( not ( = ?auto_896804 ?auto_896808 ) ) ( not ( = ?auto_896804 ?auto_896809 ) ) ( not ( = ?auto_896804 ?auto_896810 ) ) ( not ( = ?auto_896804 ?auto_896811 ) ) ( not ( = ?auto_896804 ?auto_896812 ) ) ( not ( = ?auto_896804 ?auto_896813 ) ) ( not ( = ?auto_896804 ?auto_896814 ) ) ( not ( = ?auto_896804 ?auto_896815 ) ) ( not ( = ?auto_896804 ?auto_896816 ) ) ( not ( = ?auto_896804 ?auto_896817 ) ) ( not ( = ?auto_896804 ?auto_896818 ) ) ( not ( = ?auto_896804 ?auto_896819 ) ) ( not ( = ?auto_896804 ?auto_896820 ) ) ( not ( = ?auto_896805 ?auto_896806 ) ) ( not ( = ?auto_896805 ?auto_896807 ) ) ( not ( = ?auto_896805 ?auto_896808 ) ) ( not ( = ?auto_896805 ?auto_896809 ) ) ( not ( = ?auto_896805 ?auto_896810 ) ) ( not ( = ?auto_896805 ?auto_896811 ) ) ( not ( = ?auto_896805 ?auto_896812 ) ) ( not ( = ?auto_896805 ?auto_896813 ) ) ( not ( = ?auto_896805 ?auto_896814 ) ) ( not ( = ?auto_896805 ?auto_896815 ) ) ( not ( = ?auto_896805 ?auto_896816 ) ) ( not ( = ?auto_896805 ?auto_896817 ) ) ( not ( = ?auto_896805 ?auto_896818 ) ) ( not ( = ?auto_896805 ?auto_896819 ) ) ( not ( = ?auto_896805 ?auto_896820 ) ) ( not ( = ?auto_896806 ?auto_896807 ) ) ( not ( = ?auto_896806 ?auto_896808 ) ) ( not ( = ?auto_896806 ?auto_896809 ) ) ( not ( = ?auto_896806 ?auto_896810 ) ) ( not ( = ?auto_896806 ?auto_896811 ) ) ( not ( = ?auto_896806 ?auto_896812 ) ) ( not ( = ?auto_896806 ?auto_896813 ) ) ( not ( = ?auto_896806 ?auto_896814 ) ) ( not ( = ?auto_896806 ?auto_896815 ) ) ( not ( = ?auto_896806 ?auto_896816 ) ) ( not ( = ?auto_896806 ?auto_896817 ) ) ( not ( = ?auto_896806 ?auto_896818 ) ) ( not ( = ?auto_896806 ?auto_896819 ) ) ( not ( = ?auto_896806 ?auto_896820 ) ) ( not ( = ?auto_896807 ?auto_896808 ) ) ( not ( = ?auto_896807 ?auto_896809 ) ) ( not ( = ?auto_896807 ?auto_896810 ) ) ( not ( = ?auto_896807 ?auto_896811 ) ) ( not ( = ?auto_896807 ?auto_896812 ) ) ( not ( = ?auto_896807 ?auto_896813 ) ) ( not ( = ?auto_896807 ?auto_896814 ) ) ( not ( = ?auto_896807 ?auto_896815 ) ) ( not ( = ?auto_896807 ?auto_896816 ) ) ( not ( = ?auto_896807 ?auto_896817 ) ) ( not ( = ?auto_896807 ?auto_896818 ) ) ( not ( = ?auto_896807 ?auto_896819 ) ) ( not ( = ?auto_896807 ?auto_896820 ) ) ( not ( = ?auto_896808 ?auto_896809 ) ) ( not ( = ?auto_896808 ?auto_896810 ) ) ( not ( = ?auto_896808 ?auto_896811 ) ) ( not ( = ?auto_896808 ?auto_896812 ) ) ( not ( = ?auto_896808 ?auto_896813 ) ) ( not ( = ?auto_896808 ?auto_896814 ) ) ( not ( = ?auto_896808 ?auto_896815 ) ) ( not ( = ?auto_896808 ?auto_896816 ) ) ( not ( = ?auto_896808 ?auto_896817 ) ) ( not ( = ?auto_896808 ?auto_896818 ) ) ( not ( = ?auto_896808 ?auto_896819 ) ) ( not ( = ?auto_896808 ?auto_896820 ) ) ( not ( = ?auto_896809 ?auto_896810 ) ) ( not ( = ?auto_896809 ?auto_896811 ) ) ( not ( = ?auto_896809 ?auto_896812 ) ) ( not ( = ?auto_896809 ?auto_896813 ) ) ( not ( = ?auto_896809 ?auto_896814 ) ) ( not ( = ?auto_896809 ?auto_896815 ) ) ( not ( = ?auto_896809 ?auto_896816 ) ) ( not ( = ?auto_896809 ?auto_896817 ) ) ( not ( = ?auto_896809 ?auto_896818 ) ) ( not ( = ?auto_896809 ?auto_896819 ) ) ( not ( = ?auto_896809 ?auto_896820 ) ) ( not ( = ?auto_896810 ?auto_896811 ) ) ( not ( = ?auto_896810 ?auto_896812 ) ) ( not ( = ?auto_896810 ?auto_896813 ) ) ( not ( = ?auto_896810 ?auto_896814 ) ) ( not ( = ?auto_896810 ?auto_896815 ) ) ( not ( = ?auto_896810 ?auto_896816 ) ) ( not ( = ?auto_896810 ?auto_896817 ) ) ( not ( = ?auto_896810 ?auto_896818 ) ) ( not ( = ?auto_896810 ?auto_896819 ) ) ( not ( = ?auto_896810 ?auto_896820 ) ) ( not ( = ?auto_896811 ?auto_896812 ) ) ( not ( = ?auto_896811 ?auto_896813 ) ) ( not ( = ?auto_896811 ?auto_896814 ) ) ( not ( = ?auto_896811 ?auto_896815 ) ) ( not ( = ?auto_896811 ?auto_896816 ) ) ( not ( = ?auto_896811 ?auto_896817 ) ) ( not ( = ?auto_896811 ?auto_896818 ) ) ( not ( = ?auto_896811 ?auto_896819 ) ) ( not ( = ?auto_896811 ?auto_896820 ) ) ( not ( = ?auto_896812 ?auto_896813 ) ) ( not ( = ?auto_896812 ?auto_896814 ) ) ( not ( = ?auto_896812 ?auto_896815 ) ) ( not ( = ?auto_896812 ?auto_896816 ) ) ( not ( = ?auto_896812 ?auto_896817 ) ) ( not ( = ?auto_896812 ?auto_896818 ) ) ( not ( = ?auto_896812 ?auto_896819 ) ) ( not ( = ?auto_896812 ?auto_896820 ) ) ( not ( = ?auto_896813 ?auto_896814 ) ) ( not ( = ?auto_896813 ?auto_896815 ) ) ( not ( = ?auto_896813 ?auto_896816 ) ) ( not ( = ?auto_896813 ?auto_896817 ) ) ( not ( = ?auto_896813 ?auto_896818 ) ) ( not ( = ?auto_896813 ?auto_896819 ) ) ( not ( = ?auto_896813 ?auto_896820 ) ) ( not ( = ?auto_896814 ?auto_896815 ) ) ( not ( = ?auto_896814 ?auto_896816 ) ) ( not ( = ?auto_896814 ?auto_896817 ) ) ( not ( = ?auto_896814 ?auto_896818 ) ) ( not ( = ?auto_896814 ?auto_896819 ) ) ( not ( = ?auto_896814 ?auto_896820 ) ) ( not ( = ?auto_896815 ?auto_896816 ) ) ( not ( = ?auto_896815 ?auto_896817 ) ) ( not ( = ?auto_896815 ?auto_896818 ) ) ( not ( = ?auto_896815 ?auto_896819 ) ) ( not ( = ?auto_896815 ?auto_896820 ) ) ( not ( = ?auto_896816 ?auto_896817 ) ) ( not ( = ?auto_896816 ?auto_896818 ) ) ( not ( = ?auto_896816 ?auto_896819 ) ) ( not ( = ?auto_896816 ?auto_896820 ) ) ( not ( = ?auto_896817 ?auto_896818 ) ) ( not ( = ?auto_896817 ?auto_896819 ) ) ( not ( = ?auto_896817 ?auto_896820 ) ) ( not ( = ?auto_896818 ?auto_896819 ) ) ( not ( = ?auto_896818 ?auto_896820 ) ) ( not ( = ?auto_896819 ?auto_896820 ) ) ( CLEAR ?auto_896818 ) ( ON ?auto_896819 ?auto_896820 ) ( CLEAR ?auto_896819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_896803 ?auto_896804 ?auto_896805 ?auto_896806 ?auto_896807 ?auto_896808 ?auto_896809 ?auto_896810 ?auto_896811 ?auto_896812 ?auto_896813 ?auto_896814 ?auto_896815 ?auto_896816 ?auto_896817 ?auto_896818 ?auto_896819 )
      ( MAKE-18PILE ?auto_896803 ?auto_896804 ?auto_896805 ?auto_896806 ?auto_896807 ?auto_896808 ?auto_896809 ?auto_896810 ?auto_896811 ?auto_896812 ?auto_896813 ?auto_896814 ?auto_896815 ?auto_896816 ?auto_896817 ?auto_896818 ?auto_896819 ?auto_896820 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896839 - BLOCK
      ?auto_896840 - BLOCK
      ?auto_896841 - BLOCK
      ?auto_896842 - BLOCK
      ?auto_896843 - BLOCK
      ?auto_896844 - BLOCK
      ?auto_896845 - BLOCK
      ?auto_896846 - BLOCK
      ?auto_896847 - BLOCK
      ?auto_896848 - BLOCK
      ?auto_896849 - BLOCK
      ?auto_896850 - BLOCK
      ?auto_896851 - BLOCK
      ?auto_896852 - BLOCK
      ?auto_896853 - BLOCK
      ?auto_896854 - BLOCK
      ?auto_896855 - BLOCK
      ?auto_896856 - BLOCK
    )
    :vars
    (
      ?auto_896857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896856 ?auto_896857 ) ( ON-TABLE ?auto_896839 ) ( ON ?auto_896840 ?auto_896839 ) ( ON ?auto_896841 ?auto_896840 ) ( ON ?auto_896842 ?auto_896841 ) ( ON ?auto_896843 ?auto_896842 ) ( ON ?auto_896844 ?auto_896843 ) ( ON ?auto_896845 ?auto_896844 ) ( ON ?auto_896846 ?auto_896845 ) ( ON ?auto_896847 ?auto_896846 ) ( ON ?auto_896848 ?auto_896847 ) ( ON ?auto_896849 ?auto_896848 ) ( ON ?auto_896850 ?auto_896849 ) ( ON ?auto_896851 ?auto_896850 ) ( ON ?auto_896852 ?auto_896851 ) ( ON ?auto_896853 ?auto_896852 ) ( not ( = ?auto_896839 ?auto_896840 ) ) ( not ( = ?auto_896839 ?auto_896841 ) ) ( not ( = ?auto_896839 ?auto_896842 ) ) ( not ( = ?auto_896839 ?auto_896843 ) ) ( not ( = ?auto_896839 ?auto_896844 ) ) ( not ( = ?auto_896839 ?auto_896845 ) ) ( not ( = ?auto_896839 ?auto_896846 ) ) ( not ( = ?auto_896839 ?auto_896847 ) ) ( not ( = ?auto_896839 ?auto_896848 ) ) ( not ( = ?auto_896839 ?auto_896849 ) ) ( not ( = ?auto_896839 ?auto_896850 ) ) ( not ( = ?auto_896839 ?auto_896851 ) ) ( not ( = ?auto_896839 ?auto_896852 ) ) ( not ( = ?auto_896839 ?auto_896853 ) ) ( not ( = ?auto_896839 ?auto_896854 ) ) ( not ( = ?auto_896839 ?auto_896855 ) ) ( not ( = ?auto_896839 ?auto_896856 ) ) ( not ( = ?auto_896839 ?auto_896857 ) ) ( not ( = ?auto_896840 ?auto_896841 ) ) ( not ( = ?auto_896840 ?auto_896842 ) ) ( not ( = ?auto_896840 ?auto_896843 ) ) ( not ( = ?auto_896840 ?auto_896844 ) ) ( not ( = ?auto_896840 ?auto_896845 ) ) ( not ( = ?auto_896840 ?auto_896846 ) ) ( not ( = ?auto_896840 ?auto_896847 ) ) ( not ( = ?auto_896840 ?auto_896848 ) ) ( not ( = ?auto_896840 ?auto_896849 ) ) ( not ( = ?auto_896840 ?auto_896850 ) ) ( not ( = ?auto_896840 ?auto_896851 ) ) ( not ( = ?auto_896840 ?auto_896852 ) ) ( not ( = ?auto_896840 ?auto_896853 ) ) ( not ( = ?auto_896840 ?auto_896854 ) ) ( not ( = ?auto_896840 ?auto_896855 ) ) ( not ( = ?auto_896840 ?auto_896856 ) ) ( not ( = ?auto_896840 ?auto_896857 ) ) ( not ( = ?auto_896841 ?auto_896842 ) ) ( not ( = ?auto_896841 ?auto_896843 ) ) ( not ( = ?auto_896841 ?auto_896844 ) ) ( not ( = ?auto_896841 ?auto_896845 ) ) ( not ( = ?auto_896841 ?auto_896846 ) ) ( not ( = ?auto_896841 ?auto_896847 ) ) ( not ( = ?auto_896841 ?auto_896848 ) ) ( not ( = ?auto_896841 ?auto_896849 ) ) ( not ( = ?auto_896841 ?auto_896850 ) ) ( not ( = ?auto_896841 ?auto_896851 ) ) ( not ( = ?auto_896841 ?auto_896852 ) ) ( not ( = ?auto_896841 ?auto_896853 ) ) ( not ( = ?auto_896841 ?auto_896854 ) ) ( not ( = ?auto_896841 ?auto_896855 ) ) ( not ( = ?auto_896841 ?auto_896856 ) ) ( not ( = ?auto_896841 ?auto_896857 ) ) ( not ( = ?auto_896842 ?auto_896843 ) ) ( not ( = ?auto_896842 ?auto_896844 ) ) ( not ( = ?auto_896842 ?auto_896845 ) ) ( not ( = ?auto_896842 ?auto_896846 ) ) ( not ( = ?auto_896842 ?auto_896847 ) ) ( not ( = ?auto_896842 ?auto_896848 ) ) ( not ( = ?auto_896842 ?auto_896849 ) ) ( not ( = ?auto_896842 ?auto_896850 ) ) ( not ( = ?auto_896842 ?auto_896851 ) ) ( not ( = ?auto_896842 ?auto_896852 ) ) ( not ( = ?auto_896842 ?auto_896853 ) ) ( not ( = ?auto_896842 ?auto_896854 ) ) ( not ( = ?auto_896842 ?auto_896855 ) ) ( not ( = ?auto_896842 ?auto_896856 ) ) ( not ( = ?auto_896842 ?auto_896857 ) ) ( not ( = ?auto_896843 ?auto_896844 ) ) ( not ( = ?auto_896843 ?auto_896845 ) ) ( not ( = ?auto_896843 ?auto_896846 ) ) ( not ( = ?auto_896843 ?auto_896847 ) ) ( not ( = ?auto_896843 ?auto_896848 ) ) ( not ( = ?auto_896843 ?auto_896849 ) ) ( not ( = ?auto_896843 ?auto_896850 ) ) ( not ( = ?auto_896843 ?auto_896851 ) ) ( not ( = ?auto_896843 ?auto_896852 ) ) ( not ( = ?auto_896843 ?auto_896853 ) ) ( not ( = ?auto_896843 ?auto_896854 ) ) ( not ( = ?auto_896843 ?auto_896855 ) ) ( not ( = ?auto_896843 ?auto_896856 ) ) ( not ( = ?auto_896843 ?auto_896857 ) ) ( not ( = ?auto_896844 ?auto_896845 ) ) ( not ( = ?auto_896844 ?auto_896846 ) ) ( not ( = ?auto_896844 ?auto_896847 ) ) ( not ( = ?auto_896844 ?auto_896848 ) ) ( not ( = ?auto_896844 ?auto_896849 ) ) ( not ( = ?auto_896844 ?auto_896850 ) ) ( not ( = ?auto_896844 ?auto_896851 ) ) ( not ( = ?auto_896844 ?auto_896852 ) ) ( not ( = ?auto_896844 ?auto_896853 ) ) ( not ( = ?auto_896844 ?auto_896854 ) ) ( not ( = ?auto_896844 ?auto_896855 ) ) ( not ( = ?auto_896844 ?auto_896856 ) ) ( not ( = ?auto_896844 ?auto_896857 ) ) ( not ( = ?auto_896845 ?auto_896846 ) ) ( not ( = ?auto_896845 ?auto_896847 ) ) ( not ( = ?auto_896845 ?auto_896848 ) ) ( not ( = ?auto_896845 ?auto_896849 ) ) ( not ( = ?auto_896845 ?auto_896850 ) ) ( not ( = ?auto_896845 ?auto_896851 ) ) ( not ( = ?auto_896845 ?auto_896852 ) ) ( not ( = ?auto_896845 ?auto_896853 ) ) ( not ( = ?auto_896845 ?auto_896854 ) ) ( not ( = ?auto_896845 ?auto_896855 ) ) ( not ( = ?auto_896845 ?auto_896856 ) ) ( not ( = ?auto_896845 ?auto_896857 ) ) ( not ( = ?auto_896846 ?auto_896847 ) ) ( not ( = ?auto_896846 ?auto_896848 ) ) ( not ( = ?auto_896846 ?auto_896849 ) ) ( not ( = ?auto_896846 ?auto_896850 ) ) ( not ( = ?auto_896846 ?auto_896851 ) ) ( not ( = ?auto_896846 ?auto_896852 ) ) ( not ( = ?auto_896846 ?auto_896853 ) ) ( not ( = ?auto_896846 ?auto_896854 ) ) ( not ( = ?auto_896846 ?auto_896855 ) ) ( not ( = ?auto_896846 ?auto_896856 ) ) ( not ( = ?auto_896846 ?auto_896857 ) ) ( not ( = ?auto_896847 ?auto_896848 ) ) ( not ( = ?auto_896847 ?auto_896849 ) ) ( not ( = ?auto_896847 ?auto_896850 ) ) ( not ( = ?auto_896847 ?auto_896851 ) ) ( not ( = ?auto_896847 ?auto_896852 ) ) ( not ( = ?auto_896847 ?auto_896853 ) ) ( not ( = ?auto_896847 ?auto_896854 ) ) ( not ( = ?auto_896847 ?auto_896855 ) ) ( not ( = ?auto_896847 ?auto_896856 ) ) ( not ( = ?auto_896847 ?auto_896857 ) ) ( not ( = ?auto_896848 ?auto_896849 ) ) ( not ( = ?auto_896848 ?auto_896850 ) ) ( not ( = ?auto_896848 ?auto_896851 ) ) ( not ( = ?auto_896848 ?auto_896852 ) ) ( not ( = ?auto_896848 ?auto_896853 ) ) ( not ( = ?auto_896848 ?auto_896854 ) ) ( not ( = ?auto_896848 ?auto_896855 ) ) ( not ( = ?auto_896848 ?auto_896856 ) ) ( not ( = ?auto_896848 ?auto_896857 ) ) ( not ( = ?auto_896849 ?auto_896850 ) ) ( not ( = ?auto_896849 ?auto_896851 ) ) ( not ( = ?auto_896849 ?auto_896852 ) ) ( not ( = ?auto_896849 ?auto_896853 ) ) ( not ( = ?auto_896849 ?auto_896854 ) ) ( not ( = ?auto_896849 ?auto_896855 ) ) ( not ( = ?auto_896849 ?auto_896856 ) ) ( not ( = ?auto_896849 ?auto_896857 ) ) ( not ( = ?auto_896850 ?auto_896851 ) ) ( not ( = ?auto_896850 ?auto_896852 ) ) ( not ( = ?auto_896850 ?auto_896853 ) ) ( not ( = ?auto_896850 ?auto_896854 ) ) ( not ( = ?auto_896850 ?auto_896855 ) ) ( not ( = ?auto_896850 ?auto_896856 ) ) ( not ( = ?auto_896850 ?auto_896857 ) ) ( not ( = ?auto_896851 ?auto_896852 ) ) ( not ( = ?auto_896851 ?auto_896853 ) ) ( not ( = ?auto_896851 ?auto_896854 ) ) ( not ( = ?auto_896851 ?auto_896855 ) ) ( not ( = ?auto_896851 ?auto_896856 ) ) ( not ( = ?auto_896851 ?auto_896857 ) ) ( not ( = ?auto_896852 ?auto_896853 ) ) ( not ( = ?auto_896852 ?auto_896854 ) ) ( not ( = ?auto_896852 ?auto_896855 ) ) ( not ( = ?auto_896852 ?auto_896856 ) ) ( not ( = ?auto_896852 ?auto_896857 ) ) ( not ( = ?auto_896853 ?auto_896854 ) ) ( not ( = ?auto_896853 ?auto_896855 ) ) ( not ( = ?auto_896853 ?auto_896856 ) ) ( not ( = ?auto_896853 ?auto_896857 ) ) ( not ( = ?auto_896854 ?auto_896855 ) ) ( not ( = ?auto_896854 ?auto_896856 ) ) ( not ( = ?auto_896854 ?auto_896857 ) ) ( not ( = ?auto_896855 ?auto_896856 ) ) ( not ( = ?auto_896855 ?auto_896857 ) ) ( not ( = ?auto_896856 ?auto_896857 ) ) ( ON ?auto_896855 ?auto_896856 ) ( CLEAR ?auto_896853 ) ( ON ?auto_896854 ?auto_896855 ) ( CLEAR ?auto_896854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_896839 ?auto_896840 ?auto_896841 ?auto_896842 ?auto_896843 ?auto_896844 ?auto_896845 ?auto_896846 ?auto_896847 ?auto_896848 ?auto_896849 ?auto_896850 ?auto_896851 ?auto_896852 ?auto_896853 ?auto_896854 )
      ( MAKE-18PILE ?auto_896839 ?auto_896840 ?auto_896841 ?auto_896842 ?auto_896843 ?auto_896844 ?auto_896845 ?auto_896846 ?auto_896847 ?auto_896848 ?auto_896849 ?auto_896850 ?auto_896851 ?auto_896852 ?auto_896853 ?auto_896854 ?auto_896855 ?auto_896856 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896876 - BLOCK
      ?auto_896877 - BLOCK
      ?auto_896878 - BLOCK
      ?auto_896879 - BLOCK
      ?auto_896880 - BLOCK
      ?auto_896881 - BLOCK
      ?auto_896882 - BLOCK
      ?auto_896883 - BLOCK
      ?auto_896884 - BLOCK
      ?auto_896885 - BLOCK
      ?auto_896886 - BLOCK
      ?auto_896887 - BLOCK
      ?auto_896888 - BLOCK
      ?auto_896889 - BLOCK
      ?auto_896890 - BLOCK
      ?auto_896891 - BLOCK
      ?auto_896892 - BLOCK
      ?auto_896893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_896893 ) ( ON-TABLE ?auto_896876 ) ( ON ?auto_896877 ?auto_896876 ) ( ON ?auto_896878 ?auto_896877 ) ( ON ?auto_896879 ?auto_896878 ) ( ON ?auto_896880 ?auto_896879 ) ( ON ?auto_896881 ?auto_896880 ) ( ON ?auto_896882 ?auto_896881 ) ( ON ?auto_896883 ?auto_896882 ) ( ON ?auto_896884 ?auto_896883 ) ( ON ?auto_896885 ?auto_896884 ) ( ON ?auto_896886 ?auto_896885 ) ( ON ?auto_896887 ?auto_896886 ) ( ON ?auto_896888 ?auto_896887 ) ( ON ?auto_896889 ?auto_896888 ) ( ON ?auto_896890 ?auto_896889 ) ( not ( = ?auto_896876 ?auto_896877 ) ) ( not ( = ?auto_896876 ?auto_896878 ) ) ( not ( = ?auto_896876 ?auto_896879 ) ) ( not ( = ?auto_896876 ?auto_896880 ) ) ( not ( = ?auto_896876 ?auto_896881 ) ) ( not ( = ?auto_896876 ?auto_896882 ) ) ( not ( = ?auto_896876 ?auto_896883 ) ) ( not ( = ?auto_896876 ?auto_896884 ) ) ( not ( = ?auto_896876 ?auto_896885 ) ) ( not ( = ?auto_896876 ?auto_896886 ) ) ( not ( = ?auto_896876 ?auto_896887 ) ) ( not ( = ?auto_896876 ?auto_896888 ) ) ( not ( = ?auto_896876 ?auto_896889 ) ) ( not ( = ?auto_896876 ?auto_896890 ) ) ( not ( = ?auto_896876 ?auto_896891 ) ) ( not ( = ?auto_896876 ?auto_896892 ) ) ( not ( = ?auto_896876 ?auto_896893 ) ) ( not ( = ?auto_896877 ?auto_896878 ) ) ( not ( = ?auto_896877 ?auto_896879 ) ) ( not ( = ?auto_896877 ?auto_896880 ) ) ( not ( = ?auto_896877 ?auto_896881 ) ) ( not ( = ?auto_896877 ?auto_896882 ) ) ( not ( = ?auto_896877 ?auto_896883 ) ) ( not ( = ?auto_896877 ?auto_896884 ) ) ( not ( = ?auto_896877 ?auto_896885 ) ) ( not ( = ?auto_896877 ?auto_896886 ) ) ( not ( = ?auto_896877 ?auto_896887 ) ) ( not ( = ?auto_896877 ?auto_896888 ) ) ( not ( = ?auto_896877 ?auto_896889 ) ) ( not ( = ?auto_896877 ?auto_896890 ) ) ( not ( = ?auto_896877 ?auto_896891 ) ) ( not ( = ?auto_896877 ?auto_896892 ) ) ( not ( = ?auto_896877 ?auto_896893 ) ) ( not ( = ?auto_896878 ?auto_896879 ) ) ( not ( = ?auto_896878 ?auto_896880 ) ) ( not ( = ?auto_896878 ?auto_896881 ) ) ( not ( = ?auto_896878 ?auto_896882 ) ) ( not ( = ?auto_896878 ?auto_896883 ) ) ( not ( = ?auto_896878 ?auto_896884 ) ) ( not ( = ?auto_896878 ?auto_896885 ) ) ( not ( = ?auto_896878 ?auto_896886 ) ) ( not ( = ?auto_896878 ?auto_896887 ) ) ( not ( = ?auto_896878 ?auto_896888 ) ) ( not ( = ?auto_896878 ?auto_896889 ) ) ( not ( = ?auto_896878 ?auto_896890 ) ) ( not ( = ?auto_896878 ?auto_896891 ) ) ( not ( = ?auto_896878 ?auto_896892 ) ) ( not ( = ?auto_896878 ?auto_896893 ) ) ( not ( = ?auto_896879 ?auto_896880 ) ) ( not ( = ?auto_896879 ?auto_896881 ) ) ( not ( = ?auto_896879 ?auto_896882 ) ) ( not ( = ?auto_896879 ?auto_896883 ) ) ( not ( = ?auto_896879 ?auto_896884 ) ) ( not ( = ?auto_896879 ?auto_896885 ) ) ( not ( = ?auto_896879 ?auto_896886 ) ) ( not ( = ?auto_896879 ?auto_896887 ) ) ( not ( = ?auto_896879 ?auto_896888 ) ) ( not ( = ?auto_896879 ?auto_896889 ) ) ( not ( = ?auto_896879 ?auto_896890 ) ) ( not ( = ?auto_896879 ?auto_896891 ) ) ( not ( = ?auto_896879 ?auto_896892 ) ) ( not ( = ?auto_896879 ?auto_896893 ) ) ( not ( = ?auto_896880 ?auto_896881 ) ) ( not ( = ?auto_896880 ?auto_896882 ) ) ( not ( = ?auto_896880 ?auto_896883 ) ) ( not ( = ?auto_896880 ?auto_896884 ) ) ( not ( = ?auto_896880 ?auto_896885 ) ) ( not ( = ?auto_896880 ?auto_896886 ) ) ( not ( = ?auto_896880 ?auto_896887 ) ) ( not ( = ?auto_896880 ?auto_896888 ) ) ( not ( = ?auto_896880 ?auto_896889 ) ) ( not ( = ?auto_896880 ?auto_896890 ) ) ( not ( = ?auto_896880 ?auto_896891 ) ) ( not ( = ?auto_896880 ?auto_896892 ) ) ( not ( = ?auto_896880 ?auto_896893 ) ) ( not ( = ?auto_896881 ?auto_896882 ) ) ( not ( = ?auto_896881 ?auto_896883 ) ) ( not ( = ?auto_896881 ?auto_896884 ) ) ( not ( = ?auto_896881 ?auto_896885 ) ) ( not ( = ?auto_896881 ?auto_896886 ) ) ( not ( = ?auto_896881 ?auto_896887 ) ) ( not ( = ?auto_896881 ?auto_896888 ) ) ( not ( = ?auto_896881 ?auto_896889 ) ) ( not ( = ?auto_896881 ?auto_896890 ) ) ( not ( = ?auto_896881 ?auto_896891 ) ) ( not ( = ?auto_896881 ?auto_896892 ) ) ( not ( = ?auto_896881 ?auto_896893 ) ) ( not ( = ?auto_896882 ?auto_896883 ) ) ( not ( = ?auto_896882 ?auto_896884 ) ) ( not ( = ?auto_896882 ?auto_896885 ) ) ( not ( = ?auto_896882 ?auto_896886 ) ) ( not ( = ?auto_896882 ?auto_896887 ) ) ( not ( = ?auto_896882 ?auto_896888 ) ) ( not ( = ?auto_896882 ?auto_896889 ) ) ( not ( = ?auto_896882 ?auto_896890 ) ) ( not ( = ?auto_896882 ?auto_896891 ) ) ( not ( = ?auto_896882 ?auto_896892 ) ) ( not ( = ?auto_896882 ?auto_896893 ) ) ( not ( = ?auto_896883 ?auto_896884 ) ) ( not ( = ?auto_896883 ?auto_896885 ) ) ( not ( = ?auto_896883 ?auto_896886 ) ) ( not ( = ?auto_896883 ?auto_896887 ) ) ( not ( = ?auto_896883 ?auto_896888 ) ) ( not ( = ?auto_896883 ?auto_896889 ) ) ( not ( = ?auto_896883 ?auto_896890 ) ) ( not ( = ?auto_896883 ?auto_896891 ) ) ( not ( = ?auto_896883 ?auto_896892 ) ) ( not ( = ?auto_896883 ?auto_896893 ) ) ( not ( = ?auto_896884 ?auto_896885 ) ) ( not ( = ?auto_896884 ?auto_896886 ) ) ( not ( = ?auto_896884 ?auto_896887 ) ) ( not ( = ?auto_896884 ?auto_896888 ) ) ( not ( = ?auto_896884 ?auto_896889 ) ) ( not ( = ?auto_896884 ?auto_896890 ) ) ( not ( = ?auto_896884 ?auto_896891 ) ) ( not ( = ?auto_896884 ?auto_896892 ) ) ( not ( = ?auto_896884 ?auto_896893 ) ) ( not ( = ?auto_896885 ?auto_896886 ) ) ( not ( = ?auto_896885 ?auto_896887 ) ) ( not ( = ?auto_896885 ?auto_896888 ) ) ( not ( = ?auto_896885 ?auto_896889 ) ) ( not ( = ?auto_896885 ?auto_896890 ) ) ( not ( = ?auto_896885 ?auto_896891 ) ) ( not ( = ?auto_896885 ?auto_896892 ) ) ( not ( = ?auto_896885 ?auto_896893 ) ) ( not ( = ?auto_896886 ?auto_896887 ) ) ( not ( = ?auto_896886 ?auto_896888 ) ) ( not ( = ?auto_896886 ?auto_896889 ) ) ( not ( = ?auto_896886 ?auto_896890 ) ) ( not ( = ?auto_896886 ?auto_896891 ) ) ( not ( = ?auto_896886 ?auto_896892 ) ) ( not ( = ?auto_896886 ?auto_896893 ) ) ( not ( = ?auto_896887 ?auto_896888 ) ) ( not ( = ?auto_896887 ?auto_896889 ) ) ( not ( = ?auto_896887 ?auto_896890 ) ) ( not ( = ?auto_896887 ?auto_896891 ) ) ( not ( = ?auto_896887 ?auto_896892 ) ) ( not ( = ?auto_896887 ?auto_896893 ) ) ( not ( = ?auto_896888 ?auto_896889 ) ) ( not ( = ?auto_896888 ?auto_896890 ) ) ( not ( = ?auto_896888 ?auto_896891 ) ) ( not ( = ?auto_896888 ?auto_896892 ) ) ( not ( = ?auto_896888 ?auto_896893 ) ) ( not ( = ?auto_896889 ?auto_896890 ) ) ( not ( = ?auto_896889 ?auto_896891 ) ) ( not ( = ?auto_896889 ?auto_896892 ) ) ( not ( = ?auto_896889 ?auto_896893 ) ) ( not ( = ?auto_896890 ?auto_896891 ) ) ( not ( = ?auto_896890 ?auto_896892 ) ) ( not ( = ?auto_896890 ?auto_896893 ) ) ( not ( = ?auto_896891 ?auto_896892 ) ) ( not ( = ?auto_896891 ?auto_896893 ) ) ( not ( = ?auto_896892 ?auto_896893 ) ) ( ON ?auto_896892 ?auto_896893 ) ( CLEAR ?auto_896890 ) ( ON ?auto_896891 ?auto_896892 ) ( CLEAR ?auto_896891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_896876 ?auto_896877 ?auto_896878 ?auto_896879 ?auto_896880 ?auto_896881 ?auto_896882 ?auto_896883 ?auto_896884 ?auto_896885 ?auto_896886 ?auto_896887 ?auto_896888 ?auto_896889 ?auto_896890 ?auto_896891 )
      ( MAKE-18PILE ?auto_896876 ?auto_896877 ?auto_896878 ?auto_896879 ?auto_896880 ?auto_896881 ?auto_896882 ?auto_896883 ?auto_896884 ?auto_896885 ?auto_896886 ?auto_896887 ?auto_896888 ?auto_896889 ?auto_896890 ?auto_896891 ?auto_896892 ?auto_896893 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896912 - BLOCK
      ?auto_896913 - BLOCK
      ?auto_896914 - BLOCK
      ?auto_896915 - BLOCK
      ?auto_896916 - BLOCK
      ?auto_896917 - BLOCK
      ?auto_896918 - BLOCK
      ?auto_896919 - BLOCK
      ?auto_896920 - BLOCK
      ?auto_896921 - BLOCK
      ?auto_896922 - BLOCK
      ?auto_896923 - BLOCK
      ?auto_896924 - BLOCK
      ?auto_896925 - BLOCK
      ?auto_896926 - BLOCK
      ?auto_896927 - BLOCK
      ?auto_896928 - BLOCK
      ?auto_896929 - BLOCK
    )
    :vars
    (
      ?auto_896930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_896929 ?auto_896930 ) ( ON-TABLE ?auto_896912 ) ( ON ?auto_896913 ?auto_896912 ) ( ON ?auto_896914 ?auto_896913 ) ( ON ?auto_896915 ?auto_896914 ) ( ON ?auto_896916 ?auto_896915 ) ( ON ?auto_896917 ?auto_896916 ) ( ON ?auto_896918 ?auto_896917 ) ( ON ?auto_896919 ?auto_896918 ) ( ON ?auto_896920 ?auto_896919 ) ( ON ?auto_896921 ?auto_896920 ) ( ON ?auto_896922 ?auto_896921 ) ( ON ?auto_896923 ?auto_896922 ) ( ON ?auto_896924 ?auto_896923 ) ( ON ?auto_896925 ?auto_896924 ) ( not ( = ?auto_896912 ?auto_896913 ) ) ( not ( = ?auto_896912 ?auto_896914 ) ) ( not ( = ?auto_896912 ?auto_896915 ) ) ( not ( = ?auto_896912 ?auto_896916 ) ) ( not ( = ?auto_896912 ?auto_896917 ) ) ( not ( = ?auto_896912 ?auto_896918 ) ) ( not ( = ?auto_896912 ?auto_896919 ) ) ( not ( = ?auto_896912 ?auto_896920 ) ) ( not ( = ?auto_896912 ?auto_896921 ) ) ( not ( = ?auto_896912 ?auto_896922 ) ) ( not ( = ?auto_896912 ?auto_896923 ) ) ( not ( = ?auto_896912 ?auto_896924 ) ) ( not ( = ?auto_896912 ?auto_896925 ) ) ( not ( = ?auto_896912 ?auto_896926 ) ) ( not ( = ?auto_896912 ?auto_896927 ) ) ( not ( = ?auto_896912 ?auto_896928 ) ) ( not ( = ?auto_896912 ?auto_896929 ) ) ( not ( = ?auto_896912 ?auto_896930 ) ) ( not ( = ?auto_896913 ?auto_896914 ) ) ( not ( = ?auto_896913 ?auto_896915 ) ) ( not ( = ?auto_896913 ?auto_896916 ) ) ( not ( = ?auto_896913 ?auto_896917 ) ) ( not ( = ?auto_896913 ?auto_896918 ) ) ( not ( = ?auto_896913 ?auto_896919 ) ) ( not ( = ?auto_896913 ?auto_896920 ) ) ( not ( = ?auto_896913 ?auto_896921 ) ) ( not ( = ?auto_896913 ?auto_896922 ) ) ( not ( = ?auto_896913 ?auto_896923 ) ) ( not ( = ?auto_896913 ?auto_896924 ) ) ( not ( = ?auto_896913 ?auto_896925 ) ) ( not ( = ?auto_896913 ?auto_896926 ) ) ( not ( = ?auto_896913 ?auto_896927 ) ) ( not ( = ?auto_896913 ?auto_896928 ) ) ( not ( = ?auto_896913 ?auto_896929 ) ) ( not ( = ?auto_896913 ?auto_896930 ) ) ( not ( = ?auto_896914 ?auto_896915 ) ) ( not ( = ?auto_896914 ?auto_896916 ) ) ( not ( = ?auto_896914 ?auto_896917 ) ) ( not ( = ?auto_896914 ?auto_896918 ) ) ( not ( = ?auto_896914 ?auto_896919 ) ) ( not ( = ?auto_896914 ?auto_896920 ) ) ( not ( = ?auto_896914 ?auto_896921 ) ) ( not ( = ?auto_896914 ?auto_896922 ) ) ( not ( = ?auto_896914 ?auto_896923 ) ) ( not ( = ?auto_896914 ?auto_896924 ) ) ( not ( = ?auto_896914 ?auto_896925 ) ) ( not ( = ?auto_896914 ?auto_896926 ) ) ( not ( = ?auto_896914 ?auto_896927 ) ) ( not ( = ?auto_896914 ?auto_896928 ) ) ( not ( = ?auto_896914 ?auto_896929 ) ) ( not ( = ?auto_896914 ?auto_896930 ) ) ( not ( = ?auto_896915 ?auto_896916 ) ) ( not ( = ?auto_896915 ?auto_896917 ) ) ( not ( = ?auto_896915 ?auto_896918 ) ) ( not ( = ?auto_896915 ?auto_896919 ) ) ( not ( = ?auto_896915 ?auto_896920 ) ) ( not ( = ?auto_896915 ?auto_896921 ) ) ( not ( = ?auto_896915 ?auto_896922 ) ) ( not ( = ?auto_896915 ?auto_896923 ) ) ( not ( = ?auto_896915 ?auto_896924 ) ) ( not ( = ?auto_896915 ?auto_896925 ) ) ( not ( = ?auto_896915 ?auto_896926 ) ) ( not ( = ?auto_896915 ?auto_896927 ) ) ( not ( = ?auto_896915 ?auto_896928 ) ) ( not ( = ?auto_896915 ?auto_896929 ) ) ( not ( = ?auto_896915 ?auto_896930 ) ) ( not ( = ?auto_896916 ?auto_896917 ) ) ( not ( = ?auto_896916 ?auto_896918 ) ) ( not ( = ?auto_896916 ?auto_896919 ) ) ( not ( = ?auto_896916 ?auto_896920 ) ) ( not ( = ?auto_896916 ?auto_896921 ) ) ( not ( = ?auto_896916 ?auto_896922 ) ) ( not ( = ?auto_896916 ?auto_896923 ) ) ( not ( = ?auto_896916 ?auto_896924 ) ) ( not ( = ?auto_896916 ?auto_896925 ) ) ( not ( = ?auto_896916 ?auto_896926 ) ) ( not ( = ?auto_896916 ?auto_896927 ) ) ( not ( = ?auto_896916 ?auto_896928 ) ) ( not ( = ?auto_896916 ?auto_896929 ) ) ( not ( = ?auto_896916 ?auto_896930 ) ) ( not ( = ?auto_896917 ?auto_896918 ) ) ( not ( = ?auto_896917 ?auto_896919 ) ) ( not ( = ?auto_896917 ?auto_896920 ) ) ( not ( = ?auto_896917 ?auto_896921 ) ) ( not ( = ?auto_896917 ?auto_896922 ) ) ( not ( = ?auto_896917 ?auto_896923 ) ) ( not ( = ?auto_896917 ?auto_896924 ) ) ( not ( = ?auto_896917 ?auto_896925 ) ) ( not ( = ?auto_896917 ?auto_896926 ) ) ( not ( = ?auto_896917 ?auto_896927 ) ) ( not ( = ?auto_896917 ?auto_896928 ) ) ( not ( = ?auto_896917 ?auto_896929 ) ) ( not ( = ?auto_896917 ?auto_896930 ) ) ( not ( = ?auto_896918 ?auto_896919 ) ) ( not ( = ?auto_896918 ?auto_896920 ) ) ( not ( = ?auto_896918 ?auto_896921 ) ) ( not ( = ?auto_896918 ?auto_896922 ) ) ( not ( = ?auto_896918 ?auto_896923 ) ) ( not ( = ?auto_896918 ?auto_896924 ) ) ( not ( = ?auto_896918 ?auto_896925 ) ) ( not ( = ?auto_896918 ?auto_896926 ) ) ( not ( = ?auto_896918 ?auto_896927 ) ) ( not ( = ?auto_896918 ?auto_896928 ) ) ( not ( = ?auto_896918 ?auto_896929 ) ) ( not ( = ?auto_896918 ?auto_896930 ) ) ( not ( = ?auto_896919 ?auto_896920 ) ) ( not ( = ?auto_896919 ?auto_896921 ) ) ( not ( = ?auto_896919 ?auto_896922 ) ) ( not ( = ?auto_896919 ?auto_896923 ) ) ( not ( = ?auto_896919 ?auto_896924 ) ) ( not ( = ?auto_896919 ?auto_896925 ) ) ( not ( = ?auto_896919 ?auto_896926 ) ) ( not ( = ?auto_896919 ?auto_896927 ) ) ( not ( = ?auto_896919 ?auto_896928 ) ) ( not ( = ?auto_896919 ?auto_896929 ) ) ( not ( = ?auto_896919 ?auto_896930 ) ) ( not ( = ?auto_896920 ?auto_896921 ) ) ( not ( = ?auto_896920 ?auto_896922 ) ) ( not ( = ?auto_896920 ?auto_896923 ) ) ( not ( = ?auto_896920 ?auto_896924 ) ) ( not ( = ?auto_896920 ?auto_896925 ) ) ( not ( = ?auto_896920 ?auto_896926 ) ) ( not ( = ?auto_896920 ?auto_896927 ) ) ( not ( = ?auto_896920 ?auto_896928 ) ) ( not ( = ?auto_896920 ?auto_896929 ) ) ( not ( = ?auto_896920 ?auto_896930 ) ) ( not ( = ?auto_896921 ?auto_896922 ) ) ( not ( = ?auto_896921 ?auto_896923 ) ) ( not ( = ?auto_896921 ?auto_896924 ) ) ( not ( = ?auto_896921 ?auto_896925 ) ) ( not ( = ?auto_896921 ?auto_896926 ) ) ( not ( = ?auto_896921 ?auto_896927 ) ) ( not ( = ?auto_896921 ?auto_896928 ) ) ( not ( = ?auto_896921 ?auto_896929 ) ) ( not ( = ?auto_896921 ?auto_896930 ) ) ( not ( = ?auto_896922 ?auto_896923 ) ) ( not ( = ?auto_896922 ?auto_896924 ) ) ( not ( = ?auto_896922 ?auto_896925 ) ) ( not ( = ?auto_896922 ?auto_896926 ) ) ( not ( = ?auto_896922 ?auto_896927 ) ) ( not ( = ?auto_896922 ?auto_896928 ) ) ( not ( = ?auto_896922 ?auto_896929 ) ) ( not ( = ?auto_896922 ?auto_896930 ) ) ( not ( = ?auto_896923 ?auto_896924 ) ) ( not ( = ?auto_896923 ?auto_896925 ) ) ( not ( = ?auto_896923 ?auto_896926 ) ) ( not ( = ?auto_896923 ?auto_896927 ) ) ( not ( = ?auto_896923 ?auto_896928 ) ) ( not ( = ?auto_896923 ?auto_896929 ) ) ( not ( = ?auto_896923 ?auto_896930 ) ) ( not ( = ?auto_896924 ?auto_896925 ) ) ( not ( = ?auto_896924 ?auto_896926 ) ) ( not ( = ?auto_896924 ?auto_896927 ) ) ( not ( = ?auto_896924 ?auto_896928 ) ) ( not ( = ?auto_896924 ?auto_896929 ) ) ( not ( = ?auto_896924 ?auto_896930 ) ) ( not ( = ?auto_896925 ?auto_896926 ) ) ( not ( = ?auto_896925 ?auto_896927 ) ) ( not ( = ?auto_896925 ?auto_896928 ) ) ( not ( = ?auto_896925 ?auto_896929 ) ) ( not ( = ?auto_896925 ?auto_896930 ) ) ( not ( = ?auto_896926 ?auto_896927 ) ) ( not ( = ?auto_896926 ?auto_896928 ) ) ( not ( = ?auto_896926 ?auto_896929 ) ) ( not ( = ?auto_896926 ?auto_896930 ) ) ( not ( = ?auto_896927 ?auto_896928 ) ) ( not ( = ?auto_896927 ?auto_896929 ) ) ( not ( = ?auto_896927 ?auto_896930 ) ) ( not ( = ?auto_896928 ?auto_896929 ) ) ( not ( = ?auto_896928 ?auto_896930 ) ) ( not ( = ?auto_896929 ?auto_896930 ) ) ( ON ?auto_896928 ?auto_896929 ) ( ON ?auto_896927 ?auto_896928 ) ( CLEAR ?auto_896925 ) ( ON ?auto_896926 ?auto_896927 ) ( CLEAR ?auto_896926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_896912 ?auto_896913 ?auto_896914 ?auto_896915 ?auto_896916 ?auto_896917 ?auto_896918 ?auto_896919 ?auto_896920 ?auto_896921 ?auto_896922 ?auto_896923 ?auto_896924 ?auto_896925 ?auto_896926 )
      ( MAKE-18PILE ?auto_896912 ?auto_896913 ?auto_896914 ?auto_896915 ?auto_896916 ?auto_896917 ?auto_896918 ?auto_896919 ?auto_896920 ?auto_896921 ?auto_896922 ?auto_896923 ?auto_896924 ?auto_896925 ?auto_896926 ?auto_896927 ?auto_896928 ?auto_896929 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896949 - BLOCK
      ?auto_896950 - BLOCK
      ?auto_896951 - BLOCK
      ?auto_896952 - BLOCK
      ?auto_896953 - BLOCK
      ?auto_896954 - BLOCK
      ?auto_896955 - BLOCK
      ?auto_896956 - BLOCK
      ?auto_896957 - BLOCK
      ?auto_896958 - BLOCK
      ?auto_896959 - BLOCK
      ?auto_896960 - BLOCK
      ?auto_896961 - BLOCK
      ?auto_896962 - BLOCK
      ?auto_896963 - BLOCK
      ?auto_896964 - BLOCK
      ?auto_896965 - BLOCK
      ?auto_896966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_896966 ) ( ON-TABLE ?auto_896949 ) ( ON ?auto_896950 ?auto_896949 ) ( ON ?auto_896951 ?auto_896950 ) ( ON ?auto_896952 ?auto_896951 ) ( ON ?auto_896953 ?auto_896952 ) ( ON ?auto_896954 ?auto_896953 ) ( ON ?auto_896955 ?auto_896954 ) ( ON ?auto_896956 ?auto_896955 ) ( ON ?auto_896957 ?auto_896956 ) ( ON ?auto_896958 ?auto_896957 ) ( ON ?auto_896959 ?auto_896958 ) ( ON ?auto_896960 ?auto_896959 ) ( ON ?auto_896961 ?auto_896960 ) ( ON ?auto_896962 ?auto_896961 ) ( not ( = ?auto_896949 ?auto_896950 ) ) ( not ( = ?auto_896949 ?auto_896951 ) ) ( not ( = ?auto_896949 ?auto_896952 ) ) ( not ( = ?auto_896949 ?auto_896953 ) ) ( not ( = ?auto_896949 ?auto_896954 ) ) ( not ( = ?auto_896949 ?auto_896955 ) ) ( not ( = ?auto_896949 ?auto_896956 ) ) ( not ( = ?auto_896949 ?auto_896957 ) ) ( not ( = ?auto_896949 ?auto_896958 ) ) ( not ( = ?auto_896949 ?auto_896959 ) ) ( not ( = ?auto_896949 ?auto_896960 ) ) ( not ( = ?auto_896949 ?auto_896961 ) ) ( not ( = ?auto_896949 ?auto_896962 ) ) ( not ( = ?auto_896949 ?auto_896963 ) ) ( not ( = ?auto_896949 ?auto_896964 ) ) ( not ( = ?auto_896949 ?auto_896965 ) ) ( not ( = ?auto_896949 ?auto_896966 ) ) ( not ( = ?auto_896950 ?auto_896951 ) ) ( not ( = ?auto_896950 ?auto_896952 ) ) ( not ( = ?auto_896950 ?auto_896953 ) ) ( not ( = ?auto_896950 ?auto_896954 ) ) ( not ( = ?auto_896950 ?auto_896955 ) ) ( not ( = ?auto_896950 ?auto_896956 ) ) ( not ( = ?auto_896950 ?auto_896957 ) ) ( not ( = ?auto_896950 ?auto_896958 ) ) ( not ( = ?auto_896950 ?auto_896959 ) ) ( not ( = ?auto_896950 ?auto_896960 ) ) ( not ( = ?auto_896950 ?auto_896961 ) ) ( not ( = ?auto_896950 ?auto_896962 ) ) ( not ( = ?auto_896950 ?auto_896963 ) ) ( not ( = ?auto_896950 ?auto_896964 ) ) ( not ( = ?auto_896950 ?auto_896965 ) ) ( not ( = ?auto_896950 ?auto_896966 ) ) ( not ( = ?auto_896951 ?auto_896952 ) ) ( not ( = ?auto_896951 ?auto_896953 ) ) ( not ( = ?auto_896951 ?auto_896954 ) ) ( not ( = ?auto_896951 ?auto_896955 ) ) ( not ( = ?auto_896951 ?auto_896956 ) ) ( not ( = ?auto_896951 ?auto_896957 ) ) ( not ( = ?auto_896951 ?auto_896958 ) ) ( not ( = ?auto_896951 ?auto_896959 ) ) ( not ( = ?auto_896951 ?auto_896960 ) ) ( not ( = ?auto_896951 ?auto_896961 ) ) ( not ( = ?auto_896951 ?auto_896962 ) ) ( not ( = ?auto_896951 ?auto_896963 ) ) ( not ( = ?auto_896951 ?auto_896964 ) ) ( not ( = ?auto_896951 ?auto_896965 ) ) ( not ( = ?auto_896951 ?auto_896966 ) ) ( not ( = ?auto_896952 ?auto_896953 ) ) ( not ( = ?auto_896952 ?auto_896954 ) ) ( not ( = ?auto_896952 ?auto_896955 ) ) ( not ( = ?auto_896952 ?auto_896956 ) ) ( not ( = ?auto_896952 ?auto_896957 ) ) ( not ( = ?auto_896952 ?auto_896958 ) ) ( not ( = ?auto_896952 ?auto_896959 ) ) ( not ( = ?auto_896952 ?auto_896960 ) ) ( not ( = ?auto_896952 ?auto_896961 ) ) ( not ( = ?auto_896952 ?auto_896962 ) ) ( not ( = ?auto_896952 ?auto_896963 ) ) ( not ( = ?auto_896952 ?auto_896964 ) ) ( not ( = ?auto_896952 ?auto_896965 ) ) ( not ( = ?auto_896952 ?auto_896966 ) ) ( not ( = ?auto_896953 ?auto_896954 ) ) ( not ( = ?auto_896953 ?auto_896955 ) ) ( not ( = ?auto_896953 ?auto_896956 ) ) ( not ( = ?auto_896953 ?auto_896957 ) ) ( not ( = ?auto_896953 ?auto_896958 ) ) ( not ( = ?auto_896953 ?auto_896959 ) ) ( not ( = ?auto_896953 ?auto_896960 ) ) ( not ( = ?auto_896953 ?auto_896961 ) ) ( not ( = ?auto_896953 ?auto_896962 ) ) ( not ( = ?auto_896953 ?auto_896963 ) ) ( not ( = ?auto_896953 ?auto_896964 ) ) ( not ( = ?auto_896953 ?auto_896965 ) ) ( not ( = ?auto_896953 ?auto_896966 ) ) ( not ( = ?auto_896954 ?auto_896955 ) ) ( not ( = ?auto_896954 ?auto_896956 ) ) ( not ( = ?auto_896954 ?auto_896957 ) ) ( not ( = ?auto_896954 ?auto_896958 ) ) ( not ( = ?auto_896954 ?auto_896959 ) ) ( not ( = ?auto_896954 ?auto_896960 ) ) ( not ( = ?auto_896954 ?auto_896961 ) ) ( not ( = ?auto_896954 ?auto_896962 ) ) ( not ( = ?auto_896954 ?auto_896963 ) ) ( not ( = ?auto_896954 ?auto_896964 ) ) ( not ( = ?auto_896954 ?auto_896965 ) ) ( not ( = ?auto_896954 ?auto_896966 ) ) ( not ( = ?auto_896955 ?auto_896956 ) ) ( not ( = ?auto_896955 ?auto_896957 ) ) ( not ( = ?auto_896955 ?auto_896958 ) ) ( not ( = ?auto_896955 ?auto_896959 ) ) ( not ( = ?auto_896955 ?auto_896960 ) ) ( not ( = ?auto_896955 ?auto_896961 ) ) ( not ( = ?auto_896955 ?auto_896962 ) ) ( not ( = ?auto_896955 ?auto_896963 ) ) ( not ( = ?auto_896955 ?auto_896964 ) ) ( not ( = ?auto_896955 ?auto_896965 ) ) ( not ( = ?auto_896955 ?auto_896966 ) ) ( not ( = ?auto_896956 ?auto_896957 ) ) ( not ( = ?auto_896956 ?auto_896958 ) ) ( not ( = ?auto_896956 ?auto_896959 ) ) ( not ( = ?auto_896956 ?auto_896960 ) ) ( not ( = ?auto_896956 ?auto_896961 ) ) ( not ( = ?auto_896956 ?auto_896962 ) ) ( not ( = ?auto_896956 ?auto_896963 ) ) ( not ( = ?auto_896956 ?auto_896964 ) ) ( not ( = ?auto_896956 ?auto_896965 ) ) ( not ( = ?auto_896956 ?auto_896966 ) ) ( not ( = ?auto_896957 ?auto_896958 ) ) ( not ( = ?auto_896957 ?auto_896959 ) ) ( not ( = ?auto_896957 ?auto_896960 ) ) ( not ( = ?auto_896957 ?auto_896961 ) ) ( not ( = ?auto_896957 ?auto_896962 ) ) ( not ( = ?auto_896957 ?auto_896963 ) ) ( not ( = ?auto_896957 ?auto_896964 ) ) ( not ( = ?auto_896957 ?auto_896965 ) ) ( not ( = ?auto_896957 ?auto_896966 ) ) ( not ( = ?auto_896958 ?auto_896959 ) ) ( not ( = ?auto_896958 ?auto_896960 ) ) ( not ( = ?auto_896958 ?auto_896961 ) ) ( not ( = ?auto_896958 ?auto_896962 ) ) ( not ( = ?auto_896958 ?auto_896963 ) ) ( not ( = ?auto_896958 ?auto_896964 ) ) ( not ( = ?auto_896958 ?auto_896965 ) ) ( not ( = ?auto_896958 ?auto_896966 ) ) ( not ( = ?auto_896959 ?auto_896960 ) ) ( not ( = ?auto_896959 ?auto_896961 ) ) ( not ( = ?auto_896959 ?auto_896962 ) ) ( not ( = ?auto_896959 ?auto_896963 ) ) ( not ( = ?auto_896959 ?auto_896964 ) ) ( not ( = ?auto_896959 ?auto_896965 ) ) ( not ( = ?auto_896959 ?auto_896966 ) ) ( not ( = ?auto_896960 ?auto_896961 ) ) ( not ( = ?auto_896960 ?auto_896962 ) ) ( not ( = ?auto_896960 ?auto_896963 ) ) ( not ( = ?auto_896960 ?auto_896964 ) ) ( not ( = ?auto_896960 ?auto_896965 ) ) ( not ( = ?auto_896960 ?auto_896966 ) ) ( not ( = ?auto_896961 ?auto_896962 ) ) ( not ( = ?auto_896961 ?auto_896963 ) ) ( not ( = ?auto_896961 ?auto_896964 ) ) ( not ( = ?auto_896961 ?auto_896965 ) ) ( not ( = ?auto_896961 ?auto_896966 ) ) ( not ( = ?auto_896962 ?auto_896963 ) ) ( not ( = ?auto_896962 ?auto_896964 ) ) ( not ( = ?auto_896962 ?auto_896965 ) ) ( not ( = ?auto_896962 ?auto_896966 ) ) ( not ( = ?auto_896963 ?auto_896964 ) ) ( not ( = ?auto_896963 ?auto_896965 ) ) ( not ( = ?auto_896963 ?auto_896966 ) ) ( not ( = ?auto_896964 ?auto_896965 ) ) ( not ( = ?auto_896964 ?auto_896966 ) ) ( not ( = ?auto_896965 ?auto_896966 ) ) ( ON ?auto_896965 ?auto_896966 ) ( ON ?auto_896964 ?auto_896965 ) ( CLEAR ?auto_896962 ) ( ON ?auto_896963 ?auto_896964 ) ( CLEAR ?auto_896963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_896949 ?auto_896950 ?auto_896951 ?auto_896952 ?auto_896953 ?auto_896954 ?auto_896955 ?auto_896956 ?auto_896957 ?auto_896958 ?auto_896959 ?auto_896960 ?auto_896961 ?auto_896962 ?auto_896963 )
      ( MAKE-18PILE ?auto_896949 ?auto_896950 ?auto_896951 ?auto_896952 ?auto_896953 ?auto_896954 ?auto_896955 ?auto_896956 ?auto_896957 ?auto_896958 ?auto_896959 ?auto_896960 ?auto_896961 ?auto_896962 ?auto_896963 ?auto_896964 ?auto_896965 ?auto_896966 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_896985 - BLOCK
      ?auto_896986 - BLOCK
      ?auto_896987 - BLOCK
      ?auto_896988 - BLOCK
      ?auto_896989 - BLOCK
      ?auto_896990 - BLOCK
      ?auto_896991 - BLOCK
      ?auto_896992 - BLOCK
      ?auto_896993 - BLOCK
      ?auto_896994 - BLOCK
      ?auto_896995 - BLOCK
      ?auto_896996 - BLOCK
      ?auto_896997 - BLOCK
      ?auto_896998 - BLOCK
      ?auto_896999 - BLOCK
      ?auto_897000 - BLOCK
      ?auto_897001 - BLOCK
      ?auto_897002 - BLOCK
    )
    :vars
    (
      ?auto_897003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897002 ?auto_897003 ) ( ON-TABLE ?auto_896985 ) ( ON ?auto_896986 ?auto_896985 ) ( ON ?auto_896987 ?auto_896986 ) ( ON ?auto_896988 ?auto_896987 ) ( ON ?auto_896989 ?auto_896988 ) ( ON ?auto_896990 ?auto_896989 ) ( ON ?auto_896991 ?auto_896990 ) ( ON ?auto_896992 ?auto_896991 ) ( ON ?auto_896993 ?auto_896992 ) ( ON ?auto_896994 ?auto_896993 ) ( ON ?auto_896995 ?auto_896994 ) ( ON ?auto_896996 ?auto_896995 ) ( ON ?auto_896997 ?auto_896996 ) ( not ( = ?auto_896985 ?auto_896986 ) ) ( not ( = ?auto_896985 ?auto_896987 ) ) ( not ( = ?auto_896985 ?auto_896988 ) ) ( not ( = ?auto_896985 ?auto_896989 ) ) ( not ( = ?auto_896985 ?auto_896990 ) ) ( not ( = ?auto_896985 ?auto_896991 ) ) ( not ( = ?auto_896985 ?auto_896992 ) ) ( not ( = ?auto_896985 ?auto_896993 ) ) ( not ( = ?auto_896985 ?auto_896994 ) ) ( not ( = ?auto_896985 ?auto_896995 ) ) ( not ( = ?auto_896985 ?auto_896996 ) ) ( not ( = ?auto_896985 ?auto_896997 ) ) ( not ( = ?auto_896985 ?auto_896998 ) ) ( not ( = ?auto_896985 ?auto_896999 ) ) ( not ( = ?auto_896985 ?auto_897000 ) ) ( not ( = ?auto_896985 ?auto_897001 ) ) ( not ( = ?auto_896985 ?auto_897002 ) ) ( not ( = ?auto_896985 ?auto_897003 ) ) ( not ( = ?auto_896986 ?auto_896987 ) ) ( not ( = ?auto_896986 ?auto_896988 ) ) ( not ( = ?auto_896986 ?auto_896989 ) ) ( not ( = ?auto_896986 ?auto_896990 ) ) ( not ( = ?auto_896986 ?auto_896991 ) ) ( not ( = ?auto_896986 ?auto_896992 ) ) ( not ( = ?auto_896986 ?auto_896993 ) ) ( not ( = ?auto_896986 ?auto_896994 ) ) ( not ( = ?auto_896986 ?auto_896995 ) ) ( not ( = ?auto_896986 ?auto_896996 ) ) ( not ( = ?auto_896986 ?auto_896997 ) ) ( not ( = ?auto_896986 ?auto_896998 ) ) ( not ( = ?auto_896986 ?auto_896999 ) ) ( not ( = ?auto_896986 ?auto_897000 ) ) ( not ( = ?auto_896986 ?auto_897001 ) ) ( not ( = ?auto_896986 ?auto_897002 ) ) ( not ( = ?auto_896986 ?auto_897003 ) ) ( not ( = ?auto_896987 ?auto_896988 ) ) ( not ( = ?auto_896987 ?auto_896989 ) ) ( not ( = ?auto_896987 ?auto_896990 ) ) ( not ( = ?auto_896987 ?auto_896991 ) ) ( not ( = ?auto_896987 ?auto_896992 ) ) ( not ( = ?auto_896987 ?auto_896993 ) ) ( not ( = ?auto_896987 ?auto_896994 ) ) ( not ( = ?auto_896987 ?auto_896995 ) ) ( not ( = ?auto_896987 ?auto_896996 ) ) ( not ( = ?auto_896987 ?auto_896997 ) ) ( not ( = ?auto_896987 ?auto_896998 ) ) ( not ( = ?auto_896987 ?auto_896999 ) ) ( not ( = ?auto_896987 ?auto_897000 ) ) ( not ( = ?auto_896987 ?auto_897001 ) ) ( not ( = ?auto_896987 ?auto_897002 ) ) ( not ( = ?auto_896987 ?auto_897003 ) ) ( not ( = ?auto_896988 ?auto_896989 ) ) ( not ( = ?auto_896988 ?auto_896990 ) ) ( not ( = ?auto_896988 ?auto_896991 ) ) ( not ( = ?auto_896988 ?auto_896992 ) ) ( not ( = ?auto_896988 ?auto_896993 ) ) ( not ( = ?auto_896988 ?auto_896994 ) ) ( not ( = ?auto_896988 ?auto_896995 ) ) ( not ( = ?auto_896988 ?auto_896996 ) ) ( not ( = ?auto_896988 ?auto_896997 ) ) ( not ( = ?auto_896988 ?auto_896998 ) ) ( not ( = ?auto_896988 ?auto_896999 ) ) ( not ( = ?auto_896988 ?auto_897000 ) ) ( not ( = ?auto_896988 ?auto_897001 ) ) ( not ( = ?auto_896988 ?auto_897002 ) ) ( not ( = ?auto_896988 ?auto_897003 ) ) ( not ( = ?auto_896989 ?auto_896990 ) ) ( not ( = ?auto_896989 ?auto_896991 ) ) ( not ( = ?auto_896989 ?auto_896992 ) ) ( not ( = ?auto_896989 ?auto_896993 ) ) ( not ( = ?auto_896989 ?auto_896994 ) ) ( not ( = ?auto_896989 ?auto_896995 ) ) ( not ( = ?auto_896989 ?auto_896996 ) ) ( not ( = ?auto_896989 ?auto_896997 ) ) ( not ( = ?auto_896989 ?auto_896998 ) ) ( not ( = ?auto_896989 ?auto_896999 ) ) ( not ( = ?auto_896989 ?auto_897000 ) ) ( not ( = ?auto_896989 ?auto_897001 ) ) ( not ( = ?auto_896989 ?auto_897002 ) ) ( not ( = ?auto_896989 ?auto_897003 ) ) ( not ( = ?auto_896990 ?auto_896991 ) ) ( not ( = ?auto_896990 ?auto_896992 ) ) ( not ( = ?auto_896990 ?auto_896993 ) ) ( not ( = ?auto_896990 ?auto_896994 ) ) ( not ( = ?auto_896990 ?auto_896995 ) ) ( not ( = ?auto_896990 ?auto_896996 ) ) ( not ( = ?auto_896990 ?auto_896997 ) ) ( not ( = ?auto_896990 ?auto_896998 ) ) ( not ( = ?auto_896990 ?auto_896999 ) ) ( not ( = ?auto_896990 ?auto_897000 ) ) ( not ( = ?auto_896990 ?auto_897001 ) ) ( not ( = ?auto_896990 ?auto_897002 ) ) ( not ( = ?auto_896990 ?auto_897003 ) ) ( not ( = ?auto_896991 ?auto_896992 ) ) ( not ( = ?auto_896991 ?auto_896993 ) ) ( not ( = ?auto_896991 ?auto_896994 ) ) ( not ( = ?auto_896991 ?auto_896995 ) ) ( not ( = ?auto_896991 ?auto_896996 ) ) ( not ( = ?auto_896991 ?auto_896997 ) ) ( not ( = ?auto_896991 ?auto_896998 ) ) ( not ( = ?auto_896991 ?auto_896999 ) ) ( not ( = ?auto_896991 ?auto_897000 ) ) ( not ( = ?auto_896991 ?auto_897001 ) ) ( not ( = ?auto_896991 ?auto_897002 ) ) ( not ( = ?auto_896991 ?auto_897003 ) ) ( not ( = ?auto_896992 ?auto_896993 ) ) ( not ( = ?auto_896992 ?auto_896994 ) ) ( not ( = ?auto_896992 ?auto_896995 ) ) ( not ( = ?auto_896992 ?auto_896996 ) ) ( not ( = ?auto_896992 ?auto_896997 ) ) ( not ( = ?auto_896992 ?auto_896998 ) ) ( not ( = ?auto_896992 ?auto_896999 ) ) ( not ( = ?auto_896992 ?auto_897000 ) ) ( not ( = ?auto_896992 ?auto_897001 ) ) ( not ( = ?auto_896992 ?auto_897002 ) ) ( not ( = ?auto_896992 ?auto_897003 ) ) ( not ( = ?auto_896993 ?auto_896994 ) ) ( not ( = ?auto_896993 ?auto_896995 ) ) ( not ( = ?auto_896993 ?auto_896996 ) ) ( not ( = ?auto_896993 ?auto_896997 ) ) ( not ( = ?auto_896993 ?auto_896998 ) ) ( not ( = ?auto_896993 ?auto_896999 ) ) ( not ( = ?auto_896993 ?auto_897000 ) ) ( not ( = ?auto_896993 ?auto_897001 ) ) ( not ( = ?auto_896993 ?auto_897002 ) ) ( not ( = ?auto_896993 ?auto_897003 ) ) ( not ( = ?auto_896994 ?auto_896995 ) ) ( not ( = ?auto_896994 ?auto_896996 ) ) ( not ( = ?auto_896994 ?auto_896997 ) ) ( not ( = ?auto_896994 ?auto_896998 ) ) ( not ( = ?auto_896994 ?auto_896999 ) ) ( not ( = ?auto_896994 ?auto_897000 ) ) ( not ( = ?auto_896994 ?auto_897001 ) ) ( not ( = ?auto_896994 ?auto_897002 ) ) ( not ( = ?auto_896994 ?auto_897003 ) ) ( not ( = ?auto_896995 ?auto_896996 ) ) ( not ( = ?auto_896995 ?auto_896997 ) ) ( not ( = ?auto_896995 ?auto_896998 ) ) ( not ( = ?auto_896995 ?auto_896999 ) ) ( not ( = ?auto_896995 ?auto_897000 ) ) ( not ( = ?auto_896995 ?auto_897001 ) ) ( not ( = ?auto_896995 ?auto_897002 ) ) ( not ( = ?auto_896995 ?auto_897003 ) ) ( not ( = ?auto_896996 ?auto_896997 ) ) ( not ( = ?auto_896996 ?auto_896998 ) ) ( not ( = ?auto_896996 ?auto_896999 ) ) ( not ( = ?auto_896996 ?auto_897000 ) ) ( not ( = ?auto_896996 ?auto_897001 ) ) ( not ( = ?auto_896996 ?auto_897002 ) ) ( not ( = ?auto_896996 ?auto_897003 ) ) ( not ( = ?auto_896997 ?auto_896998 ) ) ( not ( = ?auto_896997 ?auto_896999 ) ) ( not ( = ?auto_896997 ?auto_897000 ) ) ( not ( = ?auto_896997 ?auto_897001 ) ) ( not ( = ?auto_896997 ?auto_897002 ) ) ( not ( = ?auto_896997 ?auto_897003 ) ) ( not ( = ?auto_896998 ?auto_896999 ) ) ( not ( = ?auto_896998 ?auto_897000 ) ) ( not ( = ?auto_896998 ?auto_897001 ) ) ( not ( = ?auto_896998 ?auto_897002 ) ) ( not ( = ?auto_896998 ?auto_897003 ) ) ( not ( = ?auto_896999 ?auto_897000 ) ) ( not ( = ?auto_896999 ?auto_897001 ) ) ( not ( = ?auto_896999 ?auto_897002 ) ) ( not ( = ?auto_896999 ?auto_897003 ) ) ( not ( = ?auto_897000 ?auto_897001 ) ) ( not ( = ?auto_897000 ?auto_897002 ) ) ( not ( = ?auto_897000 ?auto_897003 ) ) ( not ( = ?auto_897001 ?auto_897002 ) ) ( not ( = ?auto_897001 ?auto_897003 ) ) ( not ( = ?auto_897002 ?auto_897003 ) ) ( ON ?auto_897001 ?auto_897002 ) ( ON ?auto_897000 ?auto_897001 ) ( ON ?auto_896999 ?auto_897000 ) ( CLEAR ?auto_896997 ) ( ON ?auto_896998 ?auto_896999 ) ( CLEAR ?auto_896998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_896985 ?auto_896986 ?auto_896987 ?auto_896988 ?auto_896989 ?auto_896990 ?auto_896991 ?auto_896992 ?auto_896993 ?auto_896994 ?auto_896995 ?auto_896996 ?auto_896997 ?auto_896998 )
      ( MAKE-18PILE ?auto_896985 ?auto_896986 ?auto_896987 ?auto_896988 ?auto_896989 ?auto_896990 ?auto_896991 ?auto_896992 ?auto_896993 ?auto_896994 ?auto_896995 ?auto_896996 ?auto_896997 ?auto_896998 ?auto_896999 ?auto_897000 ?auto_897001 ?auto_897002 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897022 - BLOCK
      ?auto_897023 - BLOCK
      ?auto_897024 - BLOCK
      ?auto_897025 - BLOCK
      ?auto_897026 - BLOCK
      ?auto_897027 - BLOCK
      ?auto_897028 - BLOCK
      ?auto_897029 - BLOCK
      ?auto_897030 - BLOCK
      ?auto_897031 - BLOCK
      ?auto_897032 - BLOCK
      ?auto_897033 - BLOCK
      ?auto_897034 - BLOCK
      ?auto_897035 - BLOCK
      ?auto_897036 - BLOCK
      ?auto_897037 - BLOCK
      ?auto_897038 - BLOCK
      ?auto_897039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897039 ) ( ON-TABLE ?auto_897022 ) ( ON ?auto_897023 ?auto_897022 ) ( ON ?auto_897024 ?auto_897023 ) ( ON ?auto_897025 ?auto_897024 ) ( ON ?auto_897026 ?auto_897025 ) ( ON ?auto_897027 ?auto_897026 ) ( ON ?auto_897028 ?auto_897027 ) ( ON ?auto_897029 ?auto_897028 ) ( ON ?auto_897030 ?auto_897029 ) ( ON ?auto_897031 ?auto_897030 ) ( ON ?auto_897032 ?auto_897031 ) ( ON ?auto_897033 ?auto_897032 ) ( ON ?auto_897034 ?auto_897033 ) ( not ( = ?auto_897022 ?auto_897023 ) ) ( not ( = ?auto_897022 ?auto_897024 ) ) ( not ( = ?auto_897022 ?auto_897025 ) ) ( not ( = ?auto_897022 ?auto_897026 ) ) ( not ( = ?auto_897022 ?auto_897027 ) ) ( not ( = ?auto_897022 ?auto_897028 ) ) ( not ( = ?auto_897022 ?auto_897029 ) ) ( not ( = ?auto_897022 ?auto_897030 ) ) ( not ( = ?auto_897022 ?auto_897031 ) ) ( not ( = ?auto_897022 ?auto_897032 ) ) ( not ( = ?auto_897022 ?auto_897033 ) ) ( not ( = ?auto_897022 ?auto_897034 ) ) ( not ( = ?auto_897022 ?auto_897035 ) ) ( not ( = ?auto_897022 ?auto_897036 ) ) ( not ( = ?auto_897022 ?auto_897037 ) ) ( not ( = ?auto_897022 ?auto_897038 ) ) ( not ( = ?auto_897022 ?auto_897039 ) ) ( not ( = ?auto_897023 ?auto_897024 ) ) ( not ( = ?auto_897023 ?auto_897025 ) ) ( not ( = ?auto_897023 ?auto_897026 ) ) ( not ( = ?auto_897023 ?auto_897027 ) ) ( not ( = ?auto_897023 ?auto_897028 ) ) ( not ( = ?auto_897023 ?auto_897029 ) ) ( not ( = ?auto_897023 ?auto_897030 ) ) ( not ( = ?auto_897023 ?auto_897031 ) ) ( not ( = ?auto_897023 ?auto_897032 ) ) ( not ( = ?auto_897023 ?auto_897033 ) ) ( not ( = ?auto_897023 ?auto_897034 ) ) ( not ( = ?auto_897023 ?auto_897035 ) ) ( not ( = ?auto_897023 ?auto_897036 ) ) ( not ( = ?auto_897023 ?auto_897037 ) ) ( not ( = ?auto_897023 ?auto_897038 ) ) ( not ( = ?auto_897023 ?auto_897039 ) ) ( not ( = ?auto_897024 ?auto_897025 ) ) ( not ( = ?auto_897024 ?auto_897026 ) ) ( not ( = ?auto_897024 ?auto_897027 ) ) ( not ( = ?auto_897024 ?auto_897028 ) ) ( not ( = ?auto_897024 ?auto_897029 ) ) ( not ( = ?auto_897024 ?auto_897030 ) ) ( not ( = ?auto_897024 ?auto_897031 ) ) ( not ( = ?auto_897024 ?auto_897032 ) ) ( not ( = ?auto_897024 ?auto_897033 ) ) ( not ( = ?auto_897024 ?auto_897034 ) ) ( not ( = ?auto_897024 ?auto_897035 ) ) ( not ( = ?auto_897024 ?auto_897036 ) ) ( not ( = ?auto_897024 ?auto_897037 ) ) ( not ( = ?auto_897024 ?auto_897038 ) ) ( not ( = ?auto_897024 ?auto_897039 ) ) ( not ( = ?auto_897025 ?auto_897026 ) ) ( not ( = ?auto_897025 ?auto_897027 ) ) ( not ( = ?auto_897025 ?auto_897028 ) ) ( not ( = ?auto_897025 ?auto_897029 ) ) ( not ( = ?auto_897025 ?auto_897030 ) ) ( not ( = ?auto_897025 ?auto_897031 ) ) ( not ( = ?auto_897025 ?auto_897032 ) ) ( not ( = ?auto_897025 ?auto_897033 ) ) ( not ( = ?auto_897025 ?auto_897034 ) ) ( not ( = ?auto_897025 ?auto_897035 ) ) ( not ( = ?auto_897025 ?auto_897036 ) ) ( not ( = ?auto_897025 ?auto_897037 ) ) ( not ( = ?auto_897025 ?auto_897038 ) ) ( not ( = ?auto_897025 ?auto_897039 ) ) ( not ( = ?auto_897026 ?auto_897027 ) ) ( not ( = ?auto_897026 ?auto_897028 ) ) ( not ( = ?auto_897026 ?auto_897029 ) ) ( not ( = ?auto_897026 ?auto_897030 ) ) ( not ( = ?auto_897026 ?auto_897031 ) ) ( not ( = ?auto_897026 ?auto_897032 ) ) ( not ( = ?auto_897026 ?auto_897033 ) ) ( not ( = ?auto_897026 ?auto_897034 ) ) ( not ( = ?auto_897026 ?auto_897035 ) ) ( not ( = ?auto_897026 ?auto_897036 ) ) ( not ( = ?auto_897026 ?auto_897037 ) ) ( not ( = ?auto_897026 ?auto_897038 ) ) ( not ( = ?auto_897026 ?auto_897039 ) ) ( not ( = ?auto_897027 ?auto_897028 ) ) ( not ( = ?auto_897027 ?auto_897029 ) ) ( not ( = ?auto_897027 ?auto_897030 ) ) ( not ( = ?auto_897027 ?auto_897031 ) ) ( not ( = ?auto_897027 ?auto_897032 ) ) ( not ( = ?auto_897027 ?auto_897033 ) ) ( not ( = ?auto_897027 ?auto_897034 ) ) ( not ( = ?auto_897027 ?auto_897035 ) ) ( not ( = ?auto_897027 ?auto_897036 ) ) ( not ( = ?auto_897027 ?auto_897037 ) ) ( not ( = ?auto_897027 ?auto_897038 ) ) ( not ( = ?auto_897027 ?auto_897039 ) ) ( not ( = ?auto_897028 ?auto_897029 ) ) ( not ( = ?auto_897028 ?auto_897030 ) ) ( not ( = ?auto_897028 ?auto_897031 ) ) ( not ( = ?auto_897028 ?auto_897032 ) ) ( not ( = ?auto_897028 ?auto_897033 ) ) ( not ( = ?auto_897028 ?auto_897034 ) ) ( not ( = ?auto_897028 ?auto_897035 ) ) ( not ( = ?auto_897028 ?auto_897036 ) ) ( not ( = ?auto_897028 ?auto_897037 ) ) ( not ( = ?auto_897028 ?auto_897038 ) ) ( not ( = ?auto_897028 ?auto_897039 ) ) ( not ( = ?auto_897029 ?auto_897030 ) ) ( not ( = ?auto_897029 ?auto_897031 ) ) ( not ( = ?auto_897029 ?auto_897032 ) ) ( not ( = ?auto_897029 ?auto_897033 ) ) ( not ( = ?auto_897029 ?auto_897034 ) ) ( not ( = ?auto_897029 ?auto_897035 ) ) ( not ( = ?auto_897029 ?auto_897036 ) ) ( not ( = ?auto_897029 ?auto_897037 ) ) ( not ( = ?auto_897029 ?auto_897038 ) ) ( not ( = ?auto_897029 ?auto_897039 ) ) ( not ( = ?auto_897030 ?auto_897031 ) ) ( not ( = ?auto_897030 ?auto_897032 ) ) ( not ( = ?auto_897030 ?auto_897033 ) ) ( not ( = ?auto_897030 ?auto_897034 ) ) ( not ( = ?auto_897030 ?auto_897035 ) ) ( not ( = ?auto_897030 ?auto_897036 ) ) ( not ( = ?auto_897030 ?auto_897037 ) ) ( not ( = ?auto_897030 ?auto_897038 ) ) ( not ( = ?auto_897030 ?auto_897039 ) ) ( not ( = ?auto_897031 ?auto_897032 ) ) ( not ( = ?auto_897031 ?auto_897033 ) ) ( not ( = ?auto_897031 ?auto_897034 ) ) ( not ( = ?auto_897031 ?auto_897035 ) ) ( not ( = ?auto_897031 ?auto_897036 ) ) ( not ( = ?auto_897031 ?auto_897037 ) ) ( not ( = ?auto_897031 ?auto_897038 ) ) ( not ( = ?auto_897031 ?auto_897039 ) ) ( not ( = ?auto_897032 ?auto_897033 ) ) ( not ( = ?auto_897032 ?auto_897034 ) ) ( not ( = ?auto_897032 ?auto_897035 ) ) ( not ( = ?auto_897032 ?auto_897036 ) ) ( not ( = ?auto_897032 ?auto_897037 ) ) ( not ( = ?auto_897032 ?auto_897038 ) ) ( not ( = ?auto_897032 ?auto_897039 ) ) ( not ( = ?auto_897033 ?auto_897034 ) ) ( not ( = ?auto_897033 ?auto_897035 ) ) ( not ( = ?auto_897033 ?auto_897036 ) ) ( not ( = ?auto_897033 ?auto_897037 ) ) ( not ( = ?auto_897033 ?auto_897038 ) ) ( not ( = ?auto_897033 ?auto_897039 ) ) ( not ( = ?auto_897034 ?auto_897035 ) ) ( not ( = ?auto_897034 ?auto_897036 ) ) ( not ( = ?auto_897034 ?auto_897037 ) ) ( not ( = ?auto_897034 ?auto_897038 ) ) ( not ( = ?auto_897034 ?auto_897039 ) ) ( not ( = ?auto_897035 ?auto_897036 ) ) ( not ( = ?auto_897035 ?auto_897037 ) ) ( not ( = ?auto_897035 ?auto_897038 ) ) ( not ( = ?auto_897035 ?auto_897039 ) ) ( not ( = ?auto_897036 ?auto_897037 ) ) ( not ( = ?auto_897036 ?auto_897038 ) ) ( not ( = ?auto_897036 ?auto_897039 ) ) ( not ( = ?auto_897037 ?auto_897038 ) ) ( not ( = ?auto_897037 ?auto_897039 ) ) ( not ( = ?auto_897038 ?auto_897039 ) ) ( ON ?auto_897038 ?auto_897039 ) ( ON ?auto_897037 ?auto_897038 ) ( ON ?auto_897036 ?auto_897037 ) ( CLEAR ?auto_897034 ) ( ON ?auto_897035 ?auto_897036 ) ( CLEAR ?auto_897035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_897022 ?auto_897023 ?auto_897024 ?auto_897025 ?auto_897026 ?auto_897027 ?auto_897028 ?auto_897029 ?auto_897030 ?auto_897031 ?auto_897032 ?auto_897033 ?auto_897034 ?auto_897035 )
      ( MAKE-18PILE ?auto_897022 ?auto_897023 ?auto_897024 ?auto_897025 ?auto_897026 ?auto_897027 ?auto_897028 ?auto_897029 ?auto_897030 ?auto_897031 ?auto_897032 ?auto_897033 ?auto_897034 ?auto_897035 ?auto_897036 ?auto_897037 ?auto_897038 ?auto_897039 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897058 - BLOCK
      ?auto_897059 - BLOCK
      ?auto_897060 - BLOCK
      ?auto_897061 - BLOCK
      ?auto_897062 - BLOCK
      ?auto_897063 - BLOCK
      ?auto_897064 - BLOCK
      ?auto_897065 - BLOCK
      ?auto_897066 - BLOCK
      ?auto_897067 - BLOCK
      ?auto_897068 - BLOCK
      ?auto_897069 - BLOCK
      ?auto_897070 - BLOCK
      ?auto_897071 - BLOCK
      ?auto_897072 - BLOCK
      ?auto_897073 - BLOCK
      ?auto_897074 - BLOCK
      ?auto_897075 - BLOCK
    )
    :vars
    (
      ?auto_897076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897075 ?auto_897076 ) ( ON-TABLE ?auto_897058 ) ( ON ?auto_897059 ?auto_897058 ) ( ON ?auto_897060 ?auto_897059 ) ( ON ?auto_897061 ?auto_897060 ) ( ON ?auto_897062 ?auto_897061 ) ( ON ?auto_897063 ?auto_897062 ) ( ON ?auto_897064 ?auto_897063 ) ( ON ?auto_897065 ?auto_897064 ) ( ON ?auto_897066 ?auto_897065 ) ( ON ?auto_897067 ?auto_897066 ) ( ON ?auto_897068 ?auto_897067 ) ( ON ?auto_897069 ?auto_897068 ) ( not ( = ?auto_897058 ?auto_897059 ) ) ( not ( = ?auto_897058 ?auto_897060 ) ) ( not ( = ?auto_897058 ?auto_897061 ) ) ( not ( = ?auto_897058 ?auto_897062 ) ) ( not ( = ?auto_897058 ?auto_897063 ) ) ( not ( = ?auto_897058 ?auto_897064 ) ) ( not ( = ?auto_897058 ?auto_897065 ) ) ( not ( = ?auto_897058 ?auto_897066 ) ) ( not ( = ?auto_897058 ?auto_897067 ) ) ( not ( = ?auto_897058 ?auto_897068 ) ) ( not ( = ?auto_897058 ?auto_897069 ) ) ( not ( = ?auto_897058 ?auto_897070 ) ) ( not ( = ?auto_897058 ?auto_897071 ) ) ( not ( = ?auto_897058 ?auto_897072 ) ) ( not ( = ?auto_897058 ?auto_897073 ) ) ( not ( = ?auto_897058 ?auto_897074 ) ) ( not ( = ?auto_897058 ?auto_897075 ) ) ( not ( = ?auto_897058 ?auto_897076 ) ) ( not ( = ?auto_897059 ?auto_897060 ) ) ( not ( = ?auto_897059 ?auto_897061 ) ) ( not ( = ?auto_897059 ?auto_897062 ) ) ( not ( = ?auto_897059 ?auto_897063 ) ) ( not ( = ?auto_897059 ?auto_897064 ) ) ( not ( = ?auto_897059 ?auto_897065 ) ) ( not ( = ?auto_897059 ?auto_897066 ) ) ( not ( = ?auto_897059 ?auto_897067 ) ) ( not ( = ?auto_897059 ?auto_897068 ) ) ( not ( = ?auto_897059 ?auto_897069 ) ) ( not ( = ?auto_897059 ?auto_897070 ) ) ( not ( = ?auto_897059 ?auto_897071 ) ) ( not ( = ?auto_897059 ?auto_897072 ) ) ( not ( = ?auto_897059 ?auto_897073 ) ) ( not ( = ?auto_897059 ?auto_897074 ) ) ( not ( = ?auto_897059 ?auto_897075 ) ) ( not ( = ?auto_897059 ?auto_897076 ) ) ( not ( = ?auto_897060 ?auto_897061 ) ) ( not ( = ?auto_897060 ?auto_897062 ) ) ( not ( = ?auto_897060 ?auto_897063 ) ) ( not ( = ?auto_897060 ?auto_897064 ) ) ( not ( = ?auto_897060 ?auto_897065 ) ) ( not ( = ?auto_897060 ?auto_897066 ) ) ( not ( = ?auto_897060 ?auto_897067 ) ) ( not ( = ?auto_897060 ?auto_897068 ) ) ( not ( = ?auto_897060 ?auto_897069 ) ) ( not ( = ?auto_897060 ?auto_897070 ) ) ( not ( = ?auto_897060 ?auto_897071 ) ) ( not ( = ?auto_897060 ?auto_897072 ) ) ( not ( = ?auto_897060 ?auto_897073 ) ) ( not ( = ?auto_897060 ?auto_897074 ) ) ( not ( = ?auto_897060 ?auto_897075 ) ) ( not ( = ?auto_897060 ?auto_897076 ) ) ( not ( = ?auto_897061 ?auto_897062 ) ) ( not ( = ?auto_897061 ?auto_897063 ) ) ( not ( = ?auto_897061 ?auto_897064 ) ) ( not ( = ?auto_897061 ?auto_897065 ) ) ( not ( = ?auto_897061 ?auto_897066 ) ) ( not ( = ?auto_897061 ?auto_897067 ) ) ( not ( = ?auto_897061 ?auto_897068 ) ) ( not ( = ?auto_897061 ?auto_897069 ) ) ( not ( = ?auto_897061 ?auto_897070 ) ) ( not ( = ?auto_897061 ?auto_897071 ) ) ( not ( = ?auto_897061 ?auto_897072 ) ) ( not ( = ?auto_897061 ?auto_897073 ) ) ( not ( = ?auto_897061 ?auto_897074 ) ) ( not ( = ?auto_897061 ?auto_897075 ) ) ( not ( = ?auto_897061 ?auto_897076 ) ) ( not ( = ?auto_897062 ?auto_897063 ) ) ( not ( = ?auto_897062 ?auto_897064 ) ) ( not ( = ?auto_897062 ?auto_897065 ) ) ( not ( = ?auto_897062 ?auto_897066 ) ) ( not ( = ?auto_897062 ?auto_897067 ) ) ( not ( = ?auto_897062 ?auto_897068 ) ) ( not ( = ?auto_897062 ?auto_897069 ) ) ( not ( = ?auto_897062 ?auto_897070 ) ) ( not ( = ?auto_897062 ?auto_897071 ) ) ( not ( = ?auto_897062 ?auto_897072 ) ) ( not ( = ?auto_897062 ?auto_897073 ) ) ( not ( = ?auto_897062 ?auto_897074 ) ) ( not ( = ?auto_897062 ?auto_897075 ) ) ( not ( = ?auto_897062 ?auto_897076 ) ) ( not ( = ?auto_897063 ?auto_897064 ) ) ( not ( = ?auto_897063 ?auto_897065 ) ) ( not ( = ?auto_897063 ?auto_897066 ) ) ( not ( = ?auto_897063 ?auto_897067 ) ) ( not ( = ?auto_897063 ?auto_897068 ) ) ( not ( = ?auto_897063 ?auto_897069 ) ) ( not ( = ?auto_897063 ?auto_897070 ) ) ( not ( = ?auto_897063 ?auto_897071 ) ) ( not ( = ?auto_897063 ?auto_897072 ) ) ( not ( = ?auto_897063 ?auto_897073 ) ) ( not ( = ?auto_897063 ?auto_897074 ) ) ( not ( = ?auto_897063 ?auto_897075 ) ) ( not ( = ?auto_897063 ?auto_897076 ) ) ( not ( = ?auto_897064 ?auto_897065 ) ) ( not ( = ?auto_897064 ?auto_897066 ) ) ( not ( = ?auto_897064 ?auto_897067 ) ) ( not ( = ?auto_897064 ?auto_897068 ) ) ( not ( = ?auto_897064 ?auto_897069 ) ) ( not ( = ?auto_897064 ?auto_897070 ) ) ( not ( = ?auto_897064 ?auto_897071 ) ) ( not ( = ?auto_897064 ?auto_897072 ) ) ( not ( = ?auto_897064 ?auto_897073 ) ) ( not ( = ?auto_897064 ?auto_897074 ) ) ( not ( = ?auto_897064 ?auto_897075 ) ) ( not ( = ?auto_897064 ?auto_897076 ) ) ( not ( = ?auto_897065 ?auto_897066 ) ) ( not ( = ?auto_897065 ?auto_897067 ) ) ( not ( = ?auto_897065 ?auto_897068 ) ) ( not ( = ?auto_897065 ?auto_897069 ) ) ( not ( = ?auto_897065 ?auto_897070 ) ) ( not ( = ?auto_897065 ?auto_897071 ) ) ( not ( = ?auto_897065 ?auto_897072 ) ) ( not ( = ?auto_897065 ?auto_897073 ) ) ( not ( = ?auto_897065 ?auto_897074 ) ) ( not ( = ?auto_897065 ?auto_897075 ) ) ( not ( = ?auto_897065 ?auto_897076 ) ) ( not ( = ?auto_897066 ?auto_897067 ) ) ( not ( = ?auto_897066 ?auto_897068 ) ) ( not ( = ?auto_897066 ?auto_897069 ) ) ( not ( = ?auto_897066 ?auto_897070 ) ) ( not ( = ?auto_897066 ?auto_897071 ) ) ( not ( = ?auto_897066 ?auto_897072 ) ) ( not ( = ?auto_897066 ?auto_897073 ) ) ( not ( = ?auto_897066 ?auto_897074 ) ) ( not ( = ?auto_897066 ?auto_897075 ) ) ( not ( = ?auto_897066 ?auto_897076 ) ) ( not ( = ?auto_897067 ?auto_897068 ) ) ( not ( = ?auto_897067 ?auto_897069 ) ) ( not ( = ?auto_897067 ?auto_897070 ) ) ( not ( = ?auto_897067 ?auto_897071 ) ) ( not ( = ?auto_897067 ?auto_897072 ) ) ( not ( = ?auto_897067 ?auto_897073 ) ) ( not ( = ?auto_897067 ?auto_897074 ) ) ( not ( = ?auto_897067 ?auto_897075 ) ) ( not ( = ?auto_897067 ?auto_897076 ) ) ( not ( = ?auto_897068 ?auto_897069 ) ) ( not ( = ?auto_897068 ?auto_897070 ) ) ( not ( = ?auto_897068 ?auto_897071 ) ) ( not ( = ?auto_897068 ?auto_897072 ) ) ( not ( = ?auto_897068 ?auto_897073 ) ) ( not ( = ?auto_897068 ?auto_897074 ) ) ( not ( = ?auto_897068 ?auto_897075 ) ) ( not ( = ?auto_897068 ?auto_897076 ) ) ( not ( = ?auto_897069 ?auto_897070 ) ) ( not ( = ?auto_897069 ?auto_897071 ) ) ( not ( = ?auto_897069 ?auto_897072 ) ) ( not ( = ?auto_897069 ?auto_897073 ) ) ( not ( = ?auto_897069 ?auto_897074 ) ) ( not ( = ?auto_897069 ?auto_897075 ) ) ( not ( = ?auto_897069 ?auto_897076 ) ) ( not ( = ?auto_897070 ?auto_897071 ) ) ( not ( = ?auto_897070 ?auto_897072 ) ) ( not ( = ?auto_897070 ?auto_897073 ) ) ( not ( = ?auto_897070 ?auto_897074 ) ) ( not ( = ?auto_897070 ?auto_897075 ) ) ( not ( = ?auto_897070 ?auto_897076 ) ) ( not ( = ?auto_897071 ?auto_897072 ) ) ( not ( = ?auto_897071 ?auto_897073 ) ) ( not ( = ?auto_897071 ?auto_897074 ) ) ( not ( = ?auto_897071 ?auto_897075 ) ) ( not ( = ?auto_897071 ?auto_897076 ) ) ( not ( = ?auto_897072 ?auto_897073 ) ) ( not ( = ?auto_897072 ?auto_897074 ) ) ( not ( = ?auto_897072 ?auto_897075 ) ) ( not ( = ?auto_897072 ?auto_897076 ) ) ( not ( = ?auto_897073 ?auto_897074 ) ) ( not ( = ?auto_897073 ?auto_897075 ) ) ( not ( = ?auto_897073 ?auto_897076 ) ) ( not ( = ?auto_897074 ?auto_897075 ) ) ( not ( = ?auto_897074 ?auto_897076 ) ) ( not ( = ?auto_897075 ?auto_897076 ) ) ( ON ?auto_897074 ?auto_897075 ) ( ON ?auto_897073 ?auto_897074 ) ( ON ?auto_897072 ?auto_897073 ) ( ON ?auto_897071 ?auto_897072 ) ( CLEAR ?auto_897069 ) ( ON ?auto_897070 ?auto_897071 ) ( CLEAR ?auto_897070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_897058 ?auto_897059 ?auto_897060 ?auto_897061 ?auto_897062 ?auto_897063 ?auto_897064 ?auto_897065 ?auto_897066 ?auto_897067 ?auto_897068 ?auto_897069 ?auto_897070 )
      ( MAKE-18PILE ?auto_897058 ?auto_897059 ?auto_897060 ?auto_897061 ?auto_897062 ?auto_897063 ?auto_897064 ?auto_897065 ?auto_897066 ?auto_897067 ?auto_897068 ?auto_897069 ?auto_897070 ?auto_897071 ?auto_897072 ?auto_897073 ?auto_897074 ?auto_897075 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897095 - BLOCK
      ?auto_897096 - BLOCK
      ?auto_897097 - BLOCK
      ?auto_897098 - BLOCK
      ?auto_897099 - BLOCK
      ?auto_897100 - BLOCK
      ?auto_897101 - BLOCK
      ?auto_897102 - BLOCK
      ?auto_897103 - BLOCK
      ?auto_897104 - BLOCK
      ?auto_897105 - BLOCK
      ?auto_897106 - BLOCK
      ?auto_897107 - BLOCK
      ?auto_897108 - BLOCK
      ?auto_897109 - BLOCK
      ?auto_897110 - BLOCK
      ?auto_897111 - BLOCK
      ?auto_897112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897112 ) ( ON-TABLE ?auto_897095 ) ( ON ?auto_897096 ?auto_897095 ) ( ON ?auto_897097 ?auto_897096 ) ( ON ?auto_897098 ?auto_897097 ) ( ON ?auto_897099 ?auto_897098 ) ( ON ?auto_897100 ?auto_897099 ) ( ON ?auto_897101 ?auto_897100 ) ( ON ?auto_897102 ?auto_897101 ) ( ON ?auto_897103 ?auto_897102 ) ( ON ?auto_897104 ?auto_897103 ) ( ON ?auto_897105 ?auto_897104 ) ( ON ?auto_897106 ?auto_897105 ) ( not ( = ?auto_897095 ?auto_897096 ) ) ( not ( = ?auto_897095 ?auto_897097 ) ) ( not ( = ?auto_897095 ?auto_897098 ) ) ( not ( = ?auto_897095 ?auto_897099 ) ) ( not ( = ?auto_897095 ?auto_897100 ) ) ( not ( = ?auto_897095 ?auto_897101 ) ) ( not ( = ?auto_897095 ?auto_897102 ) ) ( not ( = ?auto_897095 ?auto_897103 ) ) ( not ( = ?auto_897095 ?auto_897104 ) ) ( not ( = ?auto_897095 ?auto_897105 ) ) ( not ( = ?auto_897095 ?auto_897106 ) ) ( not ( = ?auto_897095 ?auto_897107 ) ) ( not ( = ?auto_897095 ?auto_897108 ) ) ( not ( = ?auto_897095 ?auto_897109 ) ) ( not ( = ?auto_897095 ?auto_897110 ) ) ( not ( = ?auto_897095 ?auto_897111 ) ) ( not ( = ?auto_897095 ?auto_897112 ) ) ( not ( = ?auto_897096 ?auto_897097 ) ) ( not ( = ?auto_897096 ?auto_897098 ) ) ( not ( = ?auto_897096 ?auto_897099 ) ) ( not ( = ?auto_897096 ?auto_897100 ) ) ( not ( = ?auto_897096 ?auto_897101 ) ) ( not ( = ?auto_897096 ?auto_897102 ) ) ( not ( = ?auto_897096 ?auto_897103 ) ) ( not ( = ?auto_897096 ?auto_897104 ) ) ( not ( = ?auto_897096 ?auto_897105 ) ) ( not ( = ?auto_897096 ?auto_897106 ) ) ( not ( = ?auto_897096 ?auto_897107 ) ) ( not ( = ?auto_897096 ?auto_897108 ) ) ( not ( = ?auto_897096 ?auto_897109 ) ) ( not ( = ?auto_897096 ?auto_897110 ) ) ( not ( = ?auto_897096 ?auto_897111 ) ) ( not ( = ?auto_897096 ?auto_897112 ) ) ( not ( = ?auto_897097 ?auto_897098 ) ) ( not ( = ?auto_897097 ?auto_897099 ) ) ( not ( = ?auto_897097 ?auto_897100 ) ) ( not ( = ?auto_897097 ?auto_897101 ) ) ( not ( = ?auto_897097 ?auto_897102 ) ) ( not ( = ?auto_897097 ?auto_897103 ) ) ( not ( = ?auto_897097 ?auto_897104 ) ) ( not ( = ?auto_897097 ?auto_897105 ) ) ( not ( = ?auto_897097 ?auto_897106 ) ) ( not ( = ?auto_897097 ?auto_897107 ) ) ( not ( = ?auto_897097 ?auto_897108 ) ) ( not ( = ?auto_897097 ?auto_897109 ) ) ( not ( = ?auto_897097 ?auto_897110 ) ) ( not ( = ?auto_897097 ?auto_897111 ) ) ( not ( = ?auto_897097 ?auto_897112 ) ) ( not ( = ?auto_897098 ?auto_897099 ) ) ( not ( = ?auto_897098 ?auto_897100 ) ) ( not ( = ?auto_897098 ?auto_897101 ) ) ( not ( = ?auto_897098 ?auto_897102 ) ) ( not ( = ?auto_897098 ?auto_897103 ) ) ( not ( = ?auto_897098 ?auto_897104 ) ) ( not ( = ?auto_897098 ?auto_897105 ) ) ( not ( = ?auto_897098 ?auto_897106 ) ) ( not ( = ?auto_897098 ?auto_897107 ) ) ( not ( = ?auto_897098 ?auto_897108 ) ) ( not ( = ?auto_897098 ?auto_897109 ) ) ( not ( = ?auto_897098 ?auto_897110 ) ) ( not ( = ?auto_897098 ?auto_897111 ) ) ( not ( = ?auto_897098 ?auto_897112 ) ) ( not ( = ?auto_897099 ?auto_897100 ) ) ( not ( = ?auto_897099 ?auto_897101 ) ) ( not ( = ?auto_897099 ?auto_897102 ) ) ( not ( = ?auto_897099 ?auto_897103 ) ) ( not ( = ?auto_897099 ?auto_897104 ) ) ( not ( = ?auto_897099 ?auto_897105 ) ) ( not ( = ?auto_897099 ?auto_897106 ) ) ( not ( = ?auto_897099 ?auto_897107 ) ) ( not ( = ?auto_897099 ?auto_897108 ) ) ( not ( = ?auto_897099 ?auto_897109 ) ) ( not ( = ?auto_897099 ?auto_897110 ) ) ( not ( = ?auto_897099 ?auto_897111 ) ) ( not ( = ?auto_897099 ?auto_897112 ) ) ( not ( = ?auto_897100 ?auto_897101 ) ) ( not ( = ?auto_897100 ?auto_897102 ) ) ( not ( = ?auto_897100 ?auto_897103 ) ) ( not ( = ?auto_897100 ?auto_897104 ) ) ( not ( = ?auto_897100 ?auto_897105 ) ) ( not ( = ?auto_897100 ?auto_897106 ) ) ( not ( = ?auto_897100 ?auto_897107 ) ) ( not ( = ?auto_897100 ?auto_897108 ) ) ( not ( = ?auto_897100 ?auto_897109 ) ) ( not ( = ?auto_897100 ?auto_897110 ) ) ( not ( = ?auto_897100 ?auto_897111 ) ) ( not ( = ?auto_897100 ?auto_897112 ) ) ( not ( = ?auto_897101 ?auto_897102 ) ) ( not ( = ?auto_897101 ?auto_897103 ) ) ( not ( = ?auto_897101 ?auto_897104 ) ) ( not ( = ?auto_897101 ?auto_897105 ) ) ( not ( = ?auto_897101 ?auto_897106 ) ) ( not ( = ?auto_897101 ?auto_897107 ) ) ( not ( = ?auto_897101 ?auto_897108 ) ) ( not ( = ?auto_897101 ?auto_897109 ) ) ( not ( = ?auto_897101 ?auto_897110 ) ) ( not ( = ?auto_897101 ?auto_897111 ) ) ( not ( = ?auto_897101 ?auto_897112 ) ) ( not ( = ?auto_897102 ?auto_897103 ) ) ( not ( = ?auto_897102 ?auto_897104 ) ) ( not ( = ?auto_897102 ?auto_897105 ) ) ( not ( = ?auto_897102 ?auto_897106 ) ) ( not ( = ?auto_897102 ?auto_897107 ) ) ( not ( = ?auto_897102 ?auto_897108 ) ) ( not ( = ?auto_897102 ?auto_897109 ) ) ( not ( = ?auto_897102 ?auto_897110 ) ) ( not ( = ?auto_897102 ?auto_897111 ) ) ( not ( = ?auto_897102 ?auto_897112 ) ) ( not ( = ?auto_897103 ?auto_897104 ) ) ( not ( = ?auto_897103 ?auto_897105 ) ) ( not ( = ?auto_897103 ?auto_897106 ) ) ( not ( = ?auto_897103 ?auto_897107 ) ) ( not ( = ?auto_897103 ?auto_897108 ) ) ( not ( = ?auto_897103 ?auto_897109 ) ) ( not ( = ?auto_897103 ?auto_897110 ) ) ( not ( = ?auto_897103 ?auto_897111 ) ) ( not ( = ?auto_897103 ?auto_897112 ) ) ( not ( = ?auto_897104 ?auto_897105 ) ) ( not ( = ?auto_897104 ?auto_897106 ) ) ( not ( = ?auto_897104 ?auto_897107 ) ) ( not ( = ?auto_897104 ?auto_897108 ) ) ( not ( = ?auto_897104 ?auto_897109 ) ) ( not ( = ?auto_897104 ?auto_897110 ) ) ( not ( = ?auto_897104 ?auto_897111 ) ) ( not ( = ?auto_897104 ?auto_897112 ) ) ( not ( = ?auto_897105 ?auto_897106 ) ) ( not ( = ?auto_897105 ?auto_897107 ) ) ( not ( = ?auto_897105 ?auto_897108 ) ) ( not ( = ?auto_897105 ?auto_897109 ) ) ( not ( = ?auto_897105 ?auto_897110 ) ) ( not ( = ?auto_897105 ?auto_897111 ) ) ( not ( = ?auto_897105 ?auto_897112 ) ) ( not ( = ?auto_897106 ?auto_897107 ) ) ( not ( = ?auto_897106 ?auto_897108 ) ) ( not ( = ?auto_897106 ?auto_897109 ) ) ( not ( = ?auto_897106 ?auto_897110 ) ) ( not ( = ?auto_897106 ?auto_897111 ) ) ( not ( = ?auto_897106 ?auto_897112 ) ) ( not ( = ?auto_897107 ?auto_897108 ) ) ( not ( = ?auto_897107 ?auto_897109 ) ) ( not ( = ?auto_897107 ?auto_897110 ) ) ( not ( = ?auto_897107 ?auto_897111 ) ) ( not ( = ?auto_897107 ?auto_897112 ) ) ( not ( = ?auto_897108 ?auto_897109 ) ) ( not ( = ?auto_897108 ?auto_897110 ) ) ( not ( = ?auto_897108 ?auto_897111 ) ) ( not ( = ?auto_897108 ?auto_897112 ) ) ( not ( = ?auto_897109 ?auto_897110 ) ) ( not ( = ?auto_897109 ?auto_897111 ) ) ( not ( = ?auto_897109 ?auto_897112 ) ) ( not ( = ?auto_897110 ?auto_897111 ) ) ( not ( = ?auto_897110 ?auto_897112 ) ) ( not ( = ?auto_897111 ?auto_897112 ) ) ( ON ?auto_897111 ?auto_897112 ) ( ON ?auto_897110 ?auto_897111 ) ( ON ?auto_897109 ?auto_897110 ) ( ON ?auto_897108 ?auto_897109 ) ( CLEAR ?auto_897106 ) ( ON ?auto_897107 ?auto_897108 ) ( CLEAR ?auto_897107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_897095 ?auto_897096 ?auto_897097 ?auto_897098 ?auto_897099 ?auto_897100 ?auto_897101 ?auto_897102 ?auto_897103 ?auto_897104 ?auto_897105 ?auto_897106 ?auto_897107 )
      ( MAKE-18PILE ?auto_897095 ?auto_897096 ?auto_897097 ?auto_897098 ?auto_897099 ?auto_897100 ?auto_897101 ?auto_897102 ?auto_897103 ?auto_897104 ?auto_897105 ?auto_897106 ?auto_897107 ?auto_897108 ?auto_897109 ?auto_897110 ?auto_897111 ?auto_897112 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897131 - BLOCK
      ?auto_897132 - BLOCK
      ?auto_897133 - BLOCK
      ?auto_897134 - BLOCK
      ?auto_897135 - BLOCK
      ?auto_897136 - BLOCK
      ?auto_897137 - BLOCK
      ?auto_897138 - BLOCK
      ?auto_897139 - BLOCK
      ?auto_897140 - BLOCK
      ?auto_897141 - BLOCK
      ?auto_897142 - BLOCK
      ?auto_897143 - BLOCK
      ?auto_897144 - BLOCK
      ?auto_897145 - BLOCK
      ?auto_897146 - BLOCK
      ?auto_897147 - BLOCK
      ?auto_897148 - BLOCK
    )
    :vars
    (
      ?auto_897149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897148 ?auto_897149 ) ( ON-TABLE ?auto_897131 ) ( ON ?auto_897132 ?auto_897131 ) ( ON ?auto_897133 ?auto_897132 ) ( ON ?auto_897134 ?auto_897133 ) ( ON ?auto_897135 ?auto_897134 ) ( ON ?auto_897136 ?auto_897135 ) ( ON ?auto_897137 ?auto_897136 ) ( ON ?auto_897138 ?auto_897137 ) ( ON ?auto_897139 ?auto_897138 ) ( ON ?auto_897140 ?auto_897139 ) ( ON ?auto_897141 ?auto_897140 ) ( not ( = ?auto_897131 ?auto_897132 ) ) ( not ( = ?auto_897131 ?auto_897133 ) ) ( not ( = ?auto_897131 ?auto_897134 ) ) ( not ( = ?auto_897131 ?auto_897135 ) ) ( not ( = ?auto_897131 ?auto_897136 ) ) ( not ( = ?auto_897131 ?auto_897137 ) ) ( not ( = ?auto_897131 ?auto_897138 ) ) ( not ( = ?auto_897131 ?auto_897139 ) ) ( not ( = ?auto_897131 ?auto_897140 ) ) ( not ( = ?auto_897131 ?auto_897141 ) ) ( not ( = ?auto_897131 ?auto_897142 ) ) ( not ( = ?auto_897131 ?auto_897143 ) ) ( not ( = ?auto_897131 ?auto_897144 ) ) ( not ( = ?auto_897131 ?auto_897145 ) ) ( not ( = ?auto_897131 ?auto_897146 ) ) ( not ( = ?auto_897131 ?auto_897147 ) ) ( not ( = ?auto_897131 ?auto_897148 ) ) ( not ( = ?auto_897131 ?auto_897149 ) ) ( not ( = ?auto_897132 ?auto_897133 ) ) ( not ( = ?auto_897132 ?auto_897134 ) ) ( not ( = ?auto_897132 ?auto_897135 ) ) ( not ( = ?auto_897132 ?auto_897136 ) ) ( not ( = ?auto_897132 ?auto_897137 ) ) ( not ( = ?auto_897132 ?auto_897138 ) ) ( not ( = ?auto_897132 ?auto_897139 ) ) ( not ( = ?auto_897132 ?auto_897140 ) ) ( not ( = ?auto_897132 ?auto_897141 ) ) ( not ( = ?auto_897132 ?auto_897142 ) ) ( not ( = ?auto_897132 ?auto_897143 ) ) ( not ( = ?auto_897132 ?auto_897144 ) ) ( not ( = ?auto_897132 ?auto_897145 ) ) ( not ( = ?auto_897132 ?auto_897146 ) ) ( not ( = ?auto_897132 ?auto_897147 ) ) ( not ( = ?auto_897132 ?auto_897148 ) ) ( not ( = ?auto_897132 ?auto_897149 ) ) ( not ( = ?auto_897133 ?auto_897134 ) ) ( not ( = ?auto_897133 ?auto_897135 ) ) ( not ( = ?auto_897133 ?auto_897136 ) ) ( not ( = ?auto_897133 ?auto_897137 ) ) ( not ( = ?auto_897133 ?auto_897138 ) ) ( not ( = ?auto_897133 ?auto_897139 ) ) ( not ( = ?auto_897133 ?auto_897140 ) ) ( not ( = ?auto_897133 ?auto_897141 ) ) ( not ( = ?auto_897133 ?auto_897142 ) ) ( not ( = ?auto_897133 ?auto_897143 ) ) ( not ( = ?auto_897133 ?auto_897144 ) ) ( not ( = ?auto_897133 ?auto_897145 ) ) ( not ( = ?auto_897133 ?auto_897146 ) ) ( not ( = ?auto_897133 ?auto_897147 ) ) ( not ( = ?auto_897133 ?auto_897148 ) ) ( not ( = ?auto_897133 ?auto_897149 ) ) ( not ( = ?auto_897134 ?auto_897135 ) ) ( not ( = ?auto_897134 ?auto_897136 ) ) ( not ( = ?auto_897134 ?auto_897137 ) ) ( not ( = ?auto_897134 ?auto_897138 ) ) ( not ( = ?auto_897134 ?auto_897139 ) ) ( not ( = ?auto_897134 ?auto_897140 ) ) ( not ( = ?auto_897134 ?auto_897141 ) ) ( not ( = ?auto_897134 ?auto_897142 ) ) ( not ( = ?auto_897134 ?auto_897143 ) ) ( not ( = ?auto_897134 ?auto_897144 ) ) ( not ( = ?auto_897134 ?auto_897145 ) ) ( not ( = ?auto_897134 ?auto_897146 ) ) ( not ( = ?auto_897134 ?auto_897147 ) ) ( not ( = ?auto_897134 ?auto_897148 ) ) ( not ( = ?auto_897134 ?auto_897149 ) ) ( not ( = ?auto_897135 ?auto_897136 ) ) ( not ( = ?auto_897135 ?auto_897137 ) ) ( not ( = ?auto_897135 ?auto_897138 ) ) ( not ( = ?auto_897135 ?auto_897139 ) ) ( not ( = ?auto_897135 ?auto_897140 ) ) ( not ( = ?auto_897135 ?auto_897141 ) ) ( not ( = ?auto_897135 ?auto_897142 ) ) ( not ( = ?auto_897135 ?auto_897143 ) ) ( not ( = ?auto_897135 ?auto_897144 ) ) ( not ( = ?auto_897135 ?auto_897145 ) ) ( not ( = ?auto_897135 ?auto_897146 ) ) ( not ( = ?auto_897135 ?auto_897147 ) ) ( not ( = ?auto_897135 ?auto_897148 ) ) ( not ( = ?auto_897135 ?auto_897149 ) ) ( not ( = ?auto_897136 ?auto_897137 ) ) ( not ( = ?auto_897136 ?auto_897138 ) ) ( not ( = ?auto_897136 ?auto_897139 ) ) ( not ( = ?auto_897136 ?auto_897140 ) ) ( not ( = ?auto_897136 ?auto_897141 ) ) ( not ( = ?auto_897136 ?auto_897142 ) ) ( not ( = ?auto_897136 ?auto_897143 ) ) ( not ( = ?auto_897136 ?auto_897144 ) ) ( not ( = ?auto_897136 ?auto_897145 ) ) ( not ( = ?auto_897136 ?auto_897146 ) ) ( not ( = ?auto_897136 ?auto_897147 ) ) ( not ( = ?auto_897136 ?auto_897148 ) ) ( not ( = ?auto_897136 ?auto_897149 ) ) ( not ( = ?auto_897137 ?auto_897138 ) ) ( not ( = ?auto_897137 ?auto_897139 ) ) ( not ( = ?auto_897137 ?auto_897140 ) ) ( not ( = ?auto_897137 ?auto_897141 ) ) ( not ( = ?auto_897137 ?auto_897142 ) ) ( not ( = ?auto_897137 ?auto_897143 ) ) ( not ( = ?auto_897137 ?auto_897144 ) ) ( not ( = ?auto_897137 ?auto_897145 ) ) ( not ( = ?auto_897137 ?auto_897146 ) ) ( not ( = ?auto_897137 ?auto_897147 ) ) ( not ( = ?auto_897137 ?auto_897148 ) ) ( not ( = ?auto_897137 ?auto_897149 ) ) ( not ( = ?auto_897138 ?auto_897139 ) ) ( not ( = ?auto_897138 ?auto_897140 ) ) ( not ( = ?auto_897138 ?auto_897141 ) ) ( not ( = ?auto_897138 ?auto_897142 ) ) ( not ( = ?auto_897138 ?auto_897143 ) ) ( not ( = ?auto_897138 ?auto_897144 ) ) ( not ( = ?auto_897138 ?auto_897145 ) ) ( not ( = ?auto_897138 ?auto_897146 ) ) ( not ( = ?auto_897138 ?auto_897147 ) ) ( not ( = ?auto_897138 ?auto_897148 ) ) ( not ( = ?auto_897138 ?auto_897149 ) ) ( not ( = ?auto_897139 ?auto_897140 ) ) ( not ( = ?auto_897139 ?auto_897141 ) ) ( not ( = ?auto_897139 ?auto_897142 ) ) ( not ( = ?auto_897139 ?auto_897143 ) ) ( not ( = ?auto_897139 ?auto_897144 ) ) ( not ( = ?auto_897139 ?auto_897145 ) ) ( not ( = ?auto_897139 ?auto_897146 ) ) ( not ( = ?auto_897139 ?auto_897147 ) ) ( not ( = ?auto_897139 ?auto_897148 ) ) ( not ( = ?auto_897139 ?auto_897149 ) ) ( not ( = ?auto_897140 ?auto_897141 ) ) ( not ( = ?auto_897140 ?auto_897142 ) ) ( not ( = ?auto_897140 ?auto_897143 ) ) ( not ( = ?auto_897140 ?auto_897144 ) ) ( not ( = ?auto_897140 ?auto_897145 ) ) ( not ( = ?auto_897140 ?auto_897146 ) ) ( not ( = ?auto_897140 ?auto_897147 ) ) ( not ( = ?auto_897140 ?auto_897148 ) ) ( not ( = ?auto_897140 ?auto_897149 ) ) ( not ( = ?auto_897141 ?auto_897142 ) ) ( not ( = ?auto_897141 ?auto_897143 ) ) ( not ( = ?auto_897141 ?auto_897144 ) ) ( not ( = ?auto_897141 ?auto_897145 ) ) ( not ( = ?auto_897141 ?auto_897146 ) ) ( not ( = ?auto_897141 ?auto_897147 ) ) ( not ( = ?auto_897141 ?auto_897148 ) ) ( not ( = ?auto_897141 ?auto_897149 ) ) ( not ( = ?auto_897142 ?auto_897143 ) ) ( not ( = ?auto_897142 ?auto_897144 ) ) ( not ( = ?auto_897142 ?auto_897145 ) ) ( not ( = ?auto_897142 ?auto_897146 ) ) ( not ( = ?auto_897142 ?auto_897147 ) ) ( not ( = ?auto_897142 ?auto_897148 ) ) ( not ( = ?auto_897142 ?auto_897149 ) ) ( not ( = ?auto_897143 ?auto_897144 ) ) ( not ( = ?auto_897143 ?auto_897145 ) ) ( not ( = ?auto_897143 ?auto_897146 ) ) ( not ( = ?auto_897143 ?auto_897147 ) ) ( not ( = ?auto_897143 ?auto_897148 ) ) ( not ( = ?auto_897143 ?auto_897149 ) ) ( not ( = ?auto_897144 ?auto_897145 ) ) ( not ( = ?auto_897144 ?auto_897146 ) ) ( not ( = ?auto_897144 ?auto_897147 ) ) ( not ( = ?auto_897144 ?auto_897148 ) ) ( not ( = ?auto_897144 ?auto_897149 ) ) ( not ( = ?auto_897145 ?auto_897146 ) ) ( not ( = ?auto_897145 ?auto_897147 ) ) ( not ( = ?auto_897145 ?auto_897148 ) ) ( not ( = ?auto_897145 ?auto_897149 ) ) ( not ( = ?auto_897146 ?auto_897147 ) ) ( not ( = ?auto_897146 ?auto_897148 ) ) ( not ( = ?auto_897146 ?auto_897149 ) ) ( not ( = ?auto_897147 ?auto_897148 ) ) ( not ( = ?auto_897147 ?auto_897149 ) ) ( not ( = ?auto_897148 ?auto_897149 ) ) ( ON ?auto_897147 ?auto_897148 ) ( ON ?auto_897146 ?auto_897147 ) ( ON ?auto_897145 ?auto_897146 ) ( ON ?auto_897144 ?auto_897145 ) ( ON ?auto_897143 ?auto_897144 ) ( CLEAR ?auto_897141 ) ( ON ?auto_897142 ?auto_897143 ) ( CLEAR ?auto_897142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_897131 ?auto_897132 ?auto_897133 ?auto_897134 ?auto_897135 ?auto_897136 ?auto_897137 ?auto_897138 ?auto_897139 ?auto_897140 ?auto_897141 ?auto_897142 )
      ( MAKE-18PILE ?auto_897131 ?auto_897132 ?auto_897133 ?auto_897134 ?auto_897135 ?auto_897136 ?auto_897137 ?auto_897138 ?auto_897139 ?auto_897140 ?auto_897141 ?auto_897142 ?auto_897143 ?auto_897144 ?auto_897145 ?auto_897146 ?auto_897147 ?auto_897148 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897168 - BLOCK
      ?auto_897169 - BLOCK
      ?auto_897170 - BLOCK
      ?auto_897171 - BLOCK
      ?auto_897172 - BLOCK
      ?auto_897173 - BLOCK
      ?auto_897174 - BLOCK
      ?auto_897175 - BLOCK
      ?auto_897176 - BLOCK
      ?auto_897177 - BLOCK
      ?auto_897178 - BLOCK
      ?auto_897179 - BLOCK
      ?auto_897180 - BLOCK
      ?auto_897181 - BLOCK
      ?auto_897182 - BLOCK
      ?auto_897183 - BLOCK
      ?auto_897184 - BLOCK
      ?auto_897185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897185 ) ( ON-TABLE ?auto_897168 ) ( ON ?auto_897169 ?auto_897168 ) ( ON ?auto_897170 ?auto_897169 ) ( ON ?auto_897171 ?auto_897170 ) ( ON ?auto_897172 ?auto_897171 ) ( ON ?auto_897173 ?auto_897172 ) ( ON ?auto_897174 ?auto_897173 ) ( ON ?auto_897175 ?auto_897174 ) ( ON ?auto_897176 ?auto_897175 ) ( ON ?auto_897177 ?auto_897176 ) ( ON ?auto_897178 ?auto_897177 ) ( not ( = ?auto_897168 ?auto_897169 ) ) ( not ( = ?auto_897168 ?auto_897170 ) ) ( not ( = ?auto_897168 ?auto_897171 ) ) ( not ( = ?auto_897168 ?auto_897172 ) ) ( not ( = ?auto_897168 ?auto_897173 ) ) ( not ( = ?auto_897168 ?auto_897174 ) ) ( not ( = ?auto_897168 ?auto_897175 ) ) ( not ( = ?auto_897168 ?auto_897176 ) ) ( not ( = ?auto_897168 ?auto_897177 ) ) ( not ( = ?auto_897168 ?auto_897178 ) ) ( not ( = ?auto_897168 ?auto_897179 ) ) ( not ( = ?auto_897168 ?auto_897180 ) ) ( not ( = ?auto_897168 ?auto_897181 ) ) ( not ( = ?auto_897168 ?auto_897182 ) ) ( not ( = ?auto_897168 ?auto_897183 ) ) ( not ( = ?auto_897168 ?auto_897184 ) ) ( not ( = ?auto_897168 ?auto_897185 ) ) ( not ( = ?auto_897169 ?auto_897170 ) ) ( not ( = ?auto_897169 ?auto_897171 ) ) ( not ( = ?auto_897169 ?auto_897172 ) ) ( not ( = ?auto_897169 ?auto_897173 ) ) ( not ( = ?auto_897169 ?auto_897174 ) ) ( not ( = ?auto_897169 ?auto_897175 ) ) ( not ( = ?auto_897169 ?auto_897176 ) ) ( not ( = ?auto_897169 ?auto_897177 ) ) ( not ( = ?auto_897169 ?auto_897178 ) ) ( not ( = ?auto_897169 ?auto_897179 ) ) ( not ( = ?auto_897169 ?auto_897180 ) ) ( not ( = ?auto_897169 ?auto_897181 ) ) ( not ( = ?auto_897169 ?auto_897182 ) ) ( not ( = ?auto_897169 ?auto_897183 ) ) ( not ( = ?auto_897169 ?auto_897184 ) ) ( not ( = ?auto_897169 ?auto_897185 ) ) ( not ( = ?auto_897170 ?auto_897171 ) ) ( not ( = ?auto_897170 ?auto_897172 ) ) ( not ( = ?auto_897170 ?auto_897173 ) ) ( not ( = ?auto_897170 ?auto_897174 ) ) ( not ( = ?auto_897170 ?auto_897175 ) ) ( not ( = ?auto_897170 ?auto_897176 ) ) ( not ( = ?auto_897170 ?auto_897177 ) ) ( not ( = ?auto_897170 ?auto_897178 ) ) ( not ( = ?auto_897170 ?auto_897179 ) ) ( not ( = ?auto_897170 ?auto_897180 ) ) ( not ( = ?auto_897170 ?auto_897181 ) ) ( not ( = ?auto_897170 ?auto_897182 ) ) ( not ( = ?auto_897170 ?auto_897183 ) ) ( not ( = ?auto_897170 ?auto_897184 ) ) ( not ( = ?auto_897170 ?auto_897185 ) ) ( not ( = ?auto_897171 ?auto_897172 ) ) ( not ( = ?auto_897171 ?auto_897173 ) ) ( not ( = ?auto_897171 ?auto_897174 ) ) ( not ( = ?auto_897171 ?auto_897175 ) ) ( not ( = ?auto_897171 ?auto_897176 ) ) ( not ( = ?auto_897171 ?auto_897177 ) ) ( not ( = ?auto_897171 ?auto_897178 ) ) ( not ( = ?auto_897171 ?auto_897179 ) ) ( not ( = ?auto_897171 ?auto_897180 ) ) ( not ( = ?auto_897171 ?auto_897181 ) ) ( not ( = ?auto_897171 ?auto_897182 ) ) ( not ( = ?auto_897171 ?auto_897183 ) ) ( not ( = ?auto_897171 ?auto_897184 ) ) ( not ( = ?auto_897171 ?auto_897185 ) ) ( not ( = ?auto_897172 ?auto_897173 ) ) ( not ( = ?auto_897172 ?auto_897174 ) ) ( not ( = ?auto_897172 ?auto_897175 ) ) ( not ( = ?auto_897172 ?auto_897176 ) ) ( not ( = ?auto_897172 ?auto_897177 ) ) ( not ( = ?auto_897172 ?auto_897178 ) ) ( not ( = ?auto_897172 ?auto_897179 ) ) ( not ( = ?auto_897172 ?auto_897180 ) ) ( not ( = ?auto_897172 ?auto_897181 ) ) ( not ( = ?auto_897172 ?auto_897182 ) ) ( not ( = ?auto_897172 ?auto_897183 ) ) ( not ( = ?auto_897172 ?auto_897184 ) ) ( not ( = ?auto_897172 ?auto_897185 ) ) ( not ( = ?auto_897173 ?auto_897174 ) ) ( not ( = ?auto_897173 ?auto_897175 ) ) ( not ( = ?auto_897173 ?auto_897176 ) ) ( not ( = ?auto_897173 ?auto_897177 ) ) ( not ( = ?auto_897173 ?auto_897178 ) ) ( not ( = ?auto_897173 ?auto_897179 ) ) ( not ( = ?auto_897173 ?auto_897180 ) ) ( not ( = ?auto_897173 ?auto_897181 ) ) ( not ( = ?auto_897173 ?auto_897182 ) ) ( not ( = ?auto_897173 ?auto_897183 ) ) ( not ( = ?auto_897173 ?auto_897184 ) ) ( not ( = ?auto_897173 ?auto_897185 ) ) ( not ( = ?auto_897174 ?auto_897175 ) ) ( not ( = ?auto_897174 ?auto_897176 ) ) ( not ( = ?auto_897174 ?auto_897177 ) ) ( not ( = ?auto_897174 ?auto_897178 ) ) ( not ( = ?auto_897174 ?auto_897179 ) ) ( not ( = ?auto_897174 ?auto_897180 ) ) ( not ( = ?auto_897174 ?auto_897181 ) ) ( not ( = ?auto_897174 ?auto_897182 ) ) ( not ( = ?auto_897174 ?auto_897183 ) ) ( not ( = ?auto_897174 ?auto_897184 ) ) ( not ( = ?auto_897174 ?auto_897185 ) ) ( not ( = ?auto_897175 ?auto_897176 ) ) ( not ( = ?auto_897175 ?auto_897177 ) ) ( not ( = ?auto_897175 ?auto_897178 ) ) ( not ( = ?auto_897175 ?auto_897179 ) ) ( not ( = ?auto_897175 ?auto_897180 ) ) ( not ( = ?auto_897175 ?auto_897181 ) ) ( not ( = ?auto_897175 ?auto_897182 ) ) ( not ( = ?auto_897175 ?auto_897183 ) ) ( not ( = ?auto_897175 ?auto_897184 ) ) ( not ( = ?auto_897175 ?auto_897185 ) ) ( not ( = ?auto_897176 ?auto_897177 ) ) ( not ( = ?auto_897176 ?auto_897178 ) ) ( not ( = ?auto_897176 ?auto_897179 ) ) ( not ( = ?auto_897176 ?auto_897180 ) ) ( not ( = ?auto_897176 ?auto_897181 ) ) ( not ( = ?auto_897176 ?auto_897182 ) ) ( not ( = ?auto_897176 ?auto_897183 ) ) ( not ( = ?auto_897176 ?auto_897184 ) ) ( not ( = ?auto_897176 ?auto_897185 ) ) ( not ( = ?auto_897177 ?auto_897178 ) ) ( not ( = ?auto_897177 ?auto_897179 ) ) ( not ( = ?auto_897177 ?auto_897180 ) ) ( not ( = ?auto_897177 ?auto_897181 ) ) ( not ( = ?auto_897177 ?auto_897182 ) ) ( not ( = ?auto_897177 ?auto_897183 ) ) ( not ( = ?auto_897177 ?auto_897184 ) ) ( not ( = ?auto_897177 ?auto_897185 ) ) ( not ( = ?auto_897178 ?auto_897179 ) ) ( not ( = ?auto_897178 ?auto_897180 ) ) ( not ( = ?auto_897178 ?auto_897181 ) ) ( not ( = ?auto_897178 ?auto_897182 ) ) ( not ( = ?auto_897178 ?auto_897183 ) ) ( not ( = ?auto_897178 ?auto_897184 ) ) ( not ( = ?auto_897178 ?auto_897185 ) ) ( not ( = ?auto_897179 ?auto_897180 ) ) ( not ( = ?auto_897179 ?auto_897181 ) ) ( not ( = ?auto_897179 ?auto_897182 ) ) ( not ( = ?auto_897179 ?auto_897183 ) ) ( not ( = ?auto_897179 ?auto_897184 ) ) ( not ( = ?auto_897179 ?auto_897185 ) ) ( not ( = ?auto_897180 ?auto_897181 ) ) ( not ( = ?auto_897180 ?auto_897182 ) ) ( not ( = ?auto_897180 ?auto_897183 ) ) ( not ( = ?auto_897180 ?auto_897184 ) ) ( not ( = ?auto_897180 ?auto_897185 ) ) ( not ( = ?auto_897181 ?auto_897182 ) ) ( not ( = ?auto_897181 ?auto_897183 ) ) ( not ( = ?auto_897181 ?auto_897184 ) ) ( not ( = ?auto_897181 ?auto_897185 ) ) ( not ( = ?auto_897182 ?auto_897183 ) ) ( not ( = ?auto_897182 ?auto_897184 ) ) ( not ( = ?auto_897182 ?auto_897185 ) ) ( not ( = ?auto_897183 ?auto_897184 ) ) ( not ( = ?auto_897183 ?auto_897185 ) ) ( not ( = ?auto_897184 ?auto_897185 ) ) ( ON ?auto_897184 ?auto_897185 ) ( ON ?auto_897183 ?auto_897184 ) ( ON ?auto_897182 ?auto_897183 ) ( ON ?auto_897181 ?auto_897182 ) ( ON ?auto_897180 ?auto_897181 ) ( CLEAR ?auto_897178 ) ( ON ?auto_897179 ?auto_897180 ) ( CLEAR ?auto_897179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_897168 ?auto_897169 ?auto_897170 ?auto_897171 ?auto_897172 ?auto_897173 ?auto_897174 ?auto_897175 ?auto_897176 ?auto_897177 ?auto_897178 ?auto_897179 )
      ( MAKE-18PILE ?auto_897168 ?auto_897169 ?auto_897170 ?auto_897171 ?auto_897172 ?auto_897173 ?auto_897174 ?auto_897175 ?auto_897176 ?auto_897177 ?auto_897178 ?auto_897179 ?auto_897180 ?auto_897181 ?auto_897182 ?auto_897183 ?auto_897184 ?auto_897185 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897204 - BLOCK
      ?auto_897205 - BLOCK
      ?auto_897206 - BLOCK
      ?auto_897207 - BLOCK
      ?auto_897208 - BLOCK
      ?auto_897209 - BLOCK
      ?auto_897210 - BLOCK
      ?auto_897211 - BLOCK
      ?auto_897212 - BLOCK
      ?auto_897213 - BLOCK
      ?auto_897214 - BLOCK
      ?auto_897215 - BLOCK
      ?auto_897216 - BLOCK
      ?auto_897217 - BLOCK
      ?auto_897218 - BLOCK
      ?auto_897219 - BLOCK
      ?auto_897220 - BLOCK
      ?auto_897221 - BLOCK
    )
    :vars
    (
      ?auto_897222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897221 ?auto_897222 ) ( ON-TABLE ?auto_897204 ) ( ON ?auto_897205 ?auto_897204 ) ( ON ?auto_897206 ?auto_897205 ) ( ON ?auto_897207 ?auto_897206 ) ( ON ?auto_897208 ?auto_897207 ) ( ON ?auto_897209 ?auto_897208 ) ( ON ?auto_897210 ?auto_897209 ) ( ON ?auto_897211 ?auto_897210 ) ( ON ?auto_897212 ?auto_897211 ) ( ON ?auto_897213 ?auto_897212 ) ( not ( = ?auto_897204 ?auto_897205 ) ) ( not ( = ?auto_897204 ?auto_897206 ) ) ( not ( = ?auto_897204 ?auto_897207 ) ) ( not ( = ?auto_897204 ?auto_897208 ) ) ( not ( = ?auto_897204 ?auto_897209 ) ) ( not ( = ?auto_897204 ?auto_897210 ) ) ( not ( = ?auto_897204 ?auto_897211 ) ) ( not ( = ?auto_897204 ?auto_897212 ) ) ( not ( = ?auto_897204 ?auto_897213 ) ) ( not ( = ?auto_897204 ?auto_897214 ) ) ( not ( = ?auto_897204 ?auto_897215 ) ) ( not ( = ?auto_897204 ?auto_897216 ) ) ( not ( = ?auto_897204 ?auto_897217 ) ) ( not ( = ?auto_897204 ?auto_897218 ) ) ( not ( = ?auto_897204 ?auto_897219 ) ) ( not ( = ?auto_897204 ?auto_897220 ) ) ( not ( = ?auto_897204 ?auto_897221 ) ) ( not ( = ?auto_897204 ?auto_897222 ) ) ( not ( = ?auto_897205 ?auto_897206 ) ) ( not ( = ?auto_897205 ?auto_897207 ) ) ( not ( = ?auto_897205 ?auto_897208 ) ) ( not ( = ?auto_897205 ?auto_897209 ) ) ( not ( = ?auto_897205 ?auto_897210 ) ) ( not ( = ?auto_897205 ?auto_897211 ) ) ( not ( = ?auto_897205 ?auto_897212 ) ) ( not ( = ?auto_897205 ?auto_897213 ) ) ( not ( = ?auto_897205 ?auto_897214 ) ) ( not ( = ?auto_897205 ?auto_897215 ) ) ( not ( = ?auto_897205 ?auto_897216 ) ) ( not ( = ?auto_897205 ?auto_897217 ) ) ( not ( = ?auto_897205 ?auto_897218 ) ) ( not ( = ?auto_897205 ?auto_897219 ) ) ( not ( = ?auto_897205 ?auto_897220 ) ) ( not ( = ?auto_897205 ?auto_897221 ) ) ( not ( = ?auto_897205 ?auto_897222 ) ) ( not ( = ?auto_897206 ?auto_897207 ) ) ( not ( = ?auto_897206 ?auto_897208 ) ) ( not ( = ?auto_897206 ?auto_897209 ) ) ( not ( = ?auto_897206 ?auto_897210 ) ) ( not ( = ?auto_897206 ?auto_897211 ) ) ( not ( = ?auto_897206 ?auto_897212 ) ) ( not ( = ?auto_897206 ?auto_897213 ) ) ( not ( = ?auto_897206 ?auto_897214 ) ) ( not ( = ?auto_897206 ?auto_897215 ) ) ( not ( = ?auto_897206 ?auto_897216 ) ) ( not ( = ?auto_897206 ?auto_897217 ) ) ( not ( = ?auto_897206 ?auto_897218 ) ) ( not ( = ?auto_897206 ?auto_897219 ) ) ( not ( = ?auto_897206 ?auto_897220 ) ) ( not ( = ?auto_897206 ?auto_897221 ) ) ( not ( = ?auto_897206 ?auto_897222 ) ) ( not ( = ?auto_897207 ?auto_897208 ) ) ( not ( = ?auto_897207 ?auto_897209 ) ) ( not ( = ?auto_897207 ?auto_897210 ) ) ( not ( = ?auto_897207 ?auto_897211 ) ) ( not ( = ?auto_897207 ?auto_897212 ) ) ( not ( = ?auto_897207 ?auto_897213 ) ) ( not ( = ?auto_897207 ?auto_897214 ) ) ( not ( = ?auto_897207 ?auto_897215 ) ) ( not ( = ?auto_897207 ?auto_897216 ) ) ( not ( = ?auto_897207 ?auto_897217 ) ) ( not ( = ?auto_897207 ?auto_897218 ) ) ( not ( = ?auto_897207 ?auto_897219 ) ) ( not ( = ?auto_897207 ?auto_897220 ) ) ( not ( = ?auto_897207 ?auto_897221 ) ) ( not ( = ?auto_897207 ?auto_897222 ) ) ( not ( = ?auto_897208 ?auto_897209 ) ) ( not ( = ?auto_897208 ?auto_897210 ) ) ( not ( = ?auto_897208 ?auto_897211 ) ) ( not ( = ?auto_897208 ?auto_897212 ) ) ( not ( = ?auto_897208 ?auto_897213 ) ) ( not ( = ?auto_897208 ?auto_897214 ) ) ( not ( = ?auto_897208 ?auto_897215 ) ) ( not ( = ?auto_897208 ?auto_897216 ) ) ( not ( = ?auto_897208 ?auto_897217 ) ) ( not ( = ?auto_897208 ?auto_897218 ) ) ( not ( = ?auto_897208 ?auto_897219 ) ) ( not ( = ?auto_897208 ?auto_897220 ) ) ( not ( = ?auto_897208 ?auto_897221 ) ) ( not ( = ?auto_897208 ?auto_897222 ) ) ( not ( = ?auto_897209 ?auto_897210 ) ) ( not ( = ?auto_897209 ?auto_897211 ) ) ( not ( = ?auto_897209 ?auto_897212 ) ) ( not ( = ?auto_897209 ?auto_897213 ) ) ( not ( = ?auto_897209 ?auto_897214 ) ) ( not ( = ?auto_897209 ?auto_897215 ) ) ( not ( = ?auto_897209 ?auto_897216 ) ) ( not ( = ?auto_897209 ?auto_897217 ) ) ( not ( = ?auto_897209 ?auto_897218 ) ) ( not ( = ?auto_897209 ?auto_897219 ) ) ( not ( = ?auto_897209 ?auto_897220 ) ) ( not ( = ?auto_897209 ?auto_897221 ) ) ( not ( = ?auto_897209 ?auto_897222 ) ) ( not ( = ?auto_897210 ?auto_897211 ) ) ( not ( = ?auto_897210 ?auto_897212 ) ) ( not ( = ?auto_897210 ?auto_897213 ) ) ( not ( = ?auto_897210 ?auto_897214 ) ) ( not ( = ?auto_897210 ?auto_897215 ) ) ( not ( = ?auto_897210 ?auto_897216 ) ) ( not ( = ?auto_897210 ?auto_897217 ) ) ( not ( = ?auto_897210 ?auto_897218 ) ) ( not ( = ?auto_897210 ?auto_897219 ) ) ( not ( = ?auto_897210 ?auto_897220 ) ) ( not ( = ?auto_897210 ?auto_897221 ) ) ( not ( = ?auto_897210 ?auto_897222 ) ) ( not ( = ?auto_897211 ?auto_897212 ) ) ( not ( = ?auto_897211 ?auto_897213 ) ) ( not ( = ?auto_897211 ?auto_897214 ) ) ( not ( = ?auto_897211 ?auto_897215 ) ) ( not ( = ?auto_897211 ?auto_897216 ) ) ( not ( = ?auto_897211 ?auto_897217 ) ) ( not ( = ?auto_897211 ?auto_897218 ) ) ( not ( = ?auto_897211 ?auto_897219 ) ) ( not ( = ?auto_897211 ?auto_897220 ) ) ( not ( = ?auto_897211 ?auto_897221 ) ) ( not ( = ?auto_897211 ?auto_897222 ) ) ( not ( = ?auto_897212 ?auto_897213 ) ) ( not ( = ?auto_897212 ?auto_897214 ) ) ( not ( = ?auto_897212 ?auto_897215 ) ) ( not ( = ?auto_897212 ?auto_897216 ) ) ( not ( = ?auto_897212 ?auto_897217 ) ) ( not ( = ?auto_897212 ?auto_897218 ) ) ( not ( = ?auto_897212 ?auto_897219 ) ) ( not ( = ?auto_897212 ?auto_897220 ) ) ( not ( = ?auto_897212 ?auto_897221 ) ) ( not ( = ?auto_897212 ?auto_897222 ) ) ( not ( = ?auto_897213 ?auto_897214 ) ) ( not ( = ?auto_897213 ?auto_897215 ) ) ( not ( = ?auto_897213 ?auto_897216 ) ) ( not ( = ?auto_897213 ?auto_897217 ) ) ( not ( = ?auto_897213 ?auto_897218 ) ) ( not ( = ?auto_897213 ?auto_897219 ) ) ( not ( = ?auto_897213 ?auto_897220 ) ) ( not ( = ?auto_897213 ?auto_897221 ) ) ( not ( = ?auto_897213 ?auto_897222 ) ) ( not ( = ?auto_897214 ?auto_897215 ) ) ( not ( = ?auto_897214 ?auto_897216 ) ) ( not ( = ?auto_897214 ?auto_897217 ) ) ( not ( = ?auto_897214 ?auto_897218 ) ) ( not ( = ?auto_897214 ?auto_897219 ) ) ( not ( = ?auto_897214 ?auto_897220 ) ) ( not ( = ?auto_897214 ?auto_897221 ) ) ( not ( = ?auto_897214 ?auto_897222 ) ) ( not ( = ?auto_897215 ?auto_897216 ) ) ( not ( = ?auto_897215 ?auto_897217 ) ) ( not ( = ?auto_897215 ?auto_897218 ) ) ( not ( = ?auto_897215 ?auto_897219 ) ) ( not ( = ?auto_897215 ?auto_897220 ) ) ( not ( = ?auto_897215 ?auto_897221 ) ) ( not ( = ?auto_897215 ?auto_897222 ) ) ( not ( = ?auto_897216 ?auto_897217 ) ) ( not ( = ?auto_897216 ?auto_897218 ) ) ( not ( = ?auto_897216 ?auto_897219 ) ) ( not ( = ?auto_897216 ?auto_897220 ) ) ( not ( = ?auto_897216 ?auto_897221 ) ) ( not ( = ?auto_897216 ?auto_897222 ) ) ( not ( = ?auto_897217 ?auto_897218 ) ) ( not ( = ?auto_897217 ?auto_897219 ) ) ( not ( = ?auto_897217 ?auto_897220 ) ) ( not ( = ?auto_897217 ?auto_897221 ) ) ( not ( = ?auto_897217 ?auto_897222 ) ) ( not ( = ?auto_897218 ?auto_897219 ) ) ( not ( = ?auto_897218 ?auto_897220 ) ) ( not ( = ?auto_897218 ?auto_897221 ) ) ( not ( = ?auto_897218 ?auto_897222 ) ) ( not ( = ?auto_897219 ?auto_897220 ) ) ( not ( = ?auto_897219 ?auto_897221 ) ) ( not ( = ?auto_897219 ?auto_897222 ) ) ( not ( = ?auto_897220 ?auto_897221 ) ) ( not ( = ?auto_897220 ?auto_897222 ) ) ( not ( = ?auto_897221 ?auto_897222 ) ) ( ON ?auto_897220 ?auto_897221 ) ( ON ?auto_897219 ?auto_897220 ) ( ON ?auto_897218 ?auto_897219 ) ( ON ?auto_897217 ?auto_897218 ) ( ON ?auto_897216 ?auto_897217 ) ( ON ?auto_897215 ?auto_897216 ) ( CLEAR ?auto_897213 ) ( ON ?auto_897214 ?auto_897215 ) ( CLEAR ?auto_897214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_897204 ?auto_897205 ?auto_897206 ?auto_897207 ?auto_897208 ?auto_897209 ?auto_897210 ?auto_897211 ?auto_897212 ?auto_897213 ?auto_897214 )
      ( MAKE-18PILE ?auto_897204 ?auto_897205 ?auto_897206 ?auto_897207 ?auto_897208 ?auto_897209 ?auto_897210 ?auto_897211 ?auto_897212 ?auto_897213 ?auto_897214 ?auto_897215 ?auto_897216 ?auto_897217 ?auto_897218 ?auto_897219 ?auto_897220 ?auto_897221 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897241 - BLOCK
      ?auto_897242 - BLOCK
      ?auto_897243 - BLOCK
      ?auto_897244 - BLOCK
      ?auto_897245 - BLOCK
      ?auto_897246 - BLOCK
      ?auto_897247 - BLOCK
      ?auto_897248 - BLOCK
      ?auto_897249 - BLOCK
      ?auto_897250 - BLOCK
      ?auto_897251 - BLOCK
      ?auto_897252 - BLOCK
      ?auto_897253 - BLOCK
      ?auto_897254 - BLOCK
      ?auto_897255 - BLOCK
      ?auto_897256 - BLOCK
      ?auto_897257 - BLOCK
      ?auto_897258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897258 ) ( ON-TABLE ?auto_897241 ) ( ON ?auto_897242 ?auto_897241 ) ( ON ?auto_897243 ?auto_897242 ) ( ON ?auto_897244 ?auto_897243 ) ( ON ?auto_897245 ?auto_897244 ) ( ON ?auto_897246 ?auto_897245 ) ( ON ?auto_897247 ?auto_897246 ) ( ON ?auto_897248 ?auto_897247 ) ( ON ?auto_897249 ?auto_897248 ) ( ON ?auto_897250 ?auto_897249 ) ( not ( = ?auto_897241 ?auto_897242 ) ) ( not ( = ?auto_897241 ?auto_897243 ) ) ( not ( = ?auto_897241 ?auto_897244 ) ) ( not ( = ?auto_897241 ?auto_897245 ) ) ( not ( = ?auto_897241 ?auto_897246 ) ) ( not ( = ?auto_897241 ?auto_897247 ) ) ( not ( = ?auto_897241 ?auto_897248 ) ) ( not ( = ?auto_897241 ?auto_897249 ) ) ( not ( = ?auto_897241 ?auto_897250 ) ) ( not ( = ?auto_897241 ?auto_897251 ) ) ( not ( = ?auto_897241 ?auto_897252 ) ) ( not ( = ?auto_897241 ?auto_897253 ) ) ( not ( = ?auto_897241 ?auto_897254 ) ) ( not ( = ?auto_897241 ?auto_897255 ) ) ( not ( = ?auto_897241 ?auto_897256 ) ) ( not ( = ?auto_897241 ?auto_897257 ) ) ( not ( = ?auto_897241 ?auto_897258 ) ) ( not ( = ?auto_897242 ?auto_897243 ) ) ( not ( = ?auto_897242 ?auto_897244 ) ) ( not ( = ?auto_897242 ?auto_897245 ) ) ( not ( = ?auto_897242 ?auto_897246 ) ) ( not ( = ?auto_897242 ?auto_897247 ) ) ( not ( = ?auto_897242 ?auto_897248 ) ) ( not ( = ?auto_897242 ?auto_897249 ) ) ( not ( = ?auto_897242 ?auto_897250 ) ) ( not ( = ?auto_897242 ?auto_897251 ) ) ( not ( = ?auto_897242 ?auto_897252 ) ) ( not ( = ?auto_897242 ?auto_897253 ) ) ( not ( = ?auto_897242 ?auto_897254 ) ) ( not ( = ?auto_897242 ?auto_897255 ) ) ( not ( = ?auto_897242 ?auto_897256 ) ) ( not ( = ?auto_897242 ?auto_897257 ) ) ( not ( = ?auto_897242 ?auto_897258 ) ) ( not ( = ?auto_897243 ?auto_897244 ) ) ( not ( = ?auto_897243 ?auto_897245 ) ) ( not ( = ?auto_897243 ?auto_897246 ) ) ( not ( = ?auto_897243 ?auto_897247 ) ) ( not ( = ?auto_897243 ?auto_897248 ) ) ( not ( = ?auto_897243 ?auto_897249 ) ) ( not ( = ?auto_897243 ?auto_897250 ) ) ( not ( = ?auto_897243 ?auto_897251 ) ) ( not ( = ?auto_897243 ?auto_897252 ) ) ( not ( = ?auto_897243 ?auto_897253 ) ) ( not ( = ?auto_897243 ?auto_897254 ) ) ( not ( = ?auto_897243 ?auto_897255 ) ) ( not ( = ?auto_897243 ?auto_897256 ) ) ( not ( = ?auto_897243 ?auto_897257 ) ) ( not ( = ?auto_897243 ?auto_897258 ) ) ( not ( = ?auto_897244 ?auto_897245 ) ) ( not ( = ?auto_897244 ?auto_897246 ) ) ( not ( = ?auto_897244 ?auto_897247 ) ) ( not ( = ?auto_897244 ?auto_897248 ) ) ( not ( = ?auto_897244 ?auto_897249 ) ) ( not ( = ?auto_897244 ?auto_897250 ) ) ( not ( = ?auto_897244 ?auto_897251 ) ) ( not ( = ?auto_897244 ?auto_897252 ) ) ( not ( = ?auto_897244 ?auto_897253 ) ) ( not ( = ?auto_897244 ?auto_897254 ) ) ( not ( = ?auto_897244 ?auto_897255 ) ) ( not ( = ?auto_897244 ?auto_897256 ) ) ( not ( = ?auto_897244 ?auto_897257 ) ) ( not ( = ?auto_897244 ?auto_897258 ) ) ( not ( = ?auto_897245 ?auto_897246 ) ) ( not ( = ?auto_897245 ?auto_897247 ) ) ( not ( = ?auto_897245 ?auto_897248 ) ) ( not ( = ?auto_897245 ?auto_897249 ) ) ( not ( = ?auto_897245 ?auto_897250 ) ) ( not ( = ?auto_897245 ?auto_897251 ) ) ( not ( = ?auto_897245 ?auto_897252 ) ) ( not ( = ?auto_897245 ?auto_897253 ) ) ( not ( = ?auto_897245 ?auto_897254 ) ) ( not ( = ?auto_897245 ?auto_897255 ) ) ( not ( = ?auto_897245 ?auto_897256 ) ) ( not ( = ?auto_897245 ?auto_897257 ) ) ( not ( = ?auto_897245 ?auto_897258 ) ) ( not ( = ?auto_897246 ?auto_897247 ) ) ( not ( = ?auto_897246 ?auto_897248 ) ) ( not ( = ?auto_897246 ?auto_897249 ) ) ( not ( = ?auto_897246 ?auto_897250 ) ) ( not ( = ?auto_897246 ?auto_897251 ) ) ( not ( = ?auto_897246 ?auto_897252 ) ) ( not ( = ?auto_897246 ?auto_897253 ) ) ( not ( = ?auto_897246 ?auto_897254 ) ) ( not ( = ?auto_897246 ?auto_897255 ) ) ( not ( = ?auto_897246 ?auto_897256 ) ) ( not ( = ?auto_897246 ?auto_897257 ) ) ( not ( = ?auto_897246 ?auto_897258 ) ) ( not ( = ?auto_897247 ?auto_897248 ) ) ( not ( = ?auto_897247 ?auto_897249 ) ) ( not ( = ?auto_897247 ?auto_897250 ) ) ( not ( = ?auto_897247 ?auto_897251 ) ) ( not ( = ?auto_897247 ?auto_897252 ) ) ( not ( = ?auto_897247 ?auto_897253 ) ) ( not ( = ?auto_897247 ?auto_897254 ) ) ( not ( = ?auto_897247 ?auto_897255 ) ) ( not ( = ?auto_897247 ?auto_897256 ) ) ( not ( = ?auto_897247 ?auto_897257 ) ) ( not ( = ?auto_897247 ?auto_897258 ) ) ( not ( = ?auto_897248 ?auto_897249 ) ) ( not ( = ?auto_897248 ?auto_897250 ) ) ( not ( = ?auto_897248 ?auto_897251 ) ) ( not ( = ?auto_897248 ?auto_897252 ) ) ( not ( = ?auto_897248 ?auto_897253 ) ) ( not ( = ?auto_897248 ?auto_897254 ) ) ( not ( = ?auto_897248 ?auto_897255 ) ) ( not ( = ?auto_897248 ?auto_897256 ) ) ( not ( = ?auto_897248 ?auto_897257 ) ) ( not ( = ?auto_897248 ?auto_897258 ) ) ( not ( = ?auto_897249 ?auto_897250 ) ) ( not ( = ?auto_897249 ?auto_897251 ) ) ( not ( = ?auto_897249 ?auto_897252 ) ) ( not ( = ?auto_897249 ?auto_897253 ) ) ( not ( = ?auto_897249 ?auto_897254 ) ) ( not ( = ?auto_897249 ?auto_897255 ) ) ( not ( = ?auto_897249 ?auto_897256 ) ) ( not ( = ?auto_897249 ?auto_897257 ) ) ( not ( = ?auto_897249 ?auto_897258 ) ) ( not ( = ?auto_897250 ?auto_897251 ) ) ( not ( = ?auto_897250 ?auto_897252 ) ) ( not ( = ?auto_897250 ?auto_897253 ) ) ( not ( = ?auto_897250 ?auto_897254 ) ) ( not ( = ?auto_897250 ?auto_897255 ) ) ( not ( = ?auto_897250 ?auto_897256 ) ) ( not ( = ?auto_897250 ?auto_897257 ) ) ( not ( = ?auto_897250 ?auto_897258 ) ) ( not ( = ?auto_897251 ?auto_897252 ) ) ( not ( = ?auto_897251 ?auto_897253 ) ) ( not ( = ?auto_897251 ?auto_897254 ) ) ( not ( = ?auto_897251 ?auto_897255 ) ) ( not ( = ?auto_897251 ?auto_897256 ) ) ( not ( = ?auto_897251 ?auto_897257 ) ) ( not ( = ?auto_897251 ?auto_897258 ) ) ( not ( = ?auto_897252 ?auto_897253 ) ) ( not ( = ?auto_897252 ?auto_897254 ) ) ( not ( = ?auto_897252 ?auto_897255 ) ) ( not ( = ?auto_897252 ?auto_897256 ) ) ( not ( = ?auto_897252 ?auto_897257 ) ) ( not ( = ?auto_897252 ?auto_897258 ) ) ( not ( = ?auto_897253 ?auto_897254 ) ) ( not ( = ?auto_897253 ?auto_897255 ) ) ( not ( = ?auto_897253 ?auto_897256 ) ) ( not ( = ?auto_897253 ?auto_897257 ) ) ( not ( = ?auto_897253 ?auto_897258 ) ) ( not ( = ?auto_897254 ?auto_897255 ) ) ( not ( = ?auto_897254 ?auto_897256 ) ) ( not ( = ?auto_897254 ?auto_897257 ) ) ( not ( = ?auto_897254 ?auto_897258 ) ) ( not ( = ?auto_897255 ?auto_897256 ) ) ( not ( = ?auto_897255 ?auto_897257 ) ) ( not ( = ?auto_897255 ?auto_897258 ) ) ( not ( = ?auto_897256 ?auto_897257 ) ) ( not ( = ?auto_897256 ?auto_897258 ) ) ( not ( = ?auto_897257 ?auto_897258 ) ) ( ON ?auto_897257 ?auto_897258 ) ( ON ?auto_897256 ?auto_897257 ) ( ON ?auto_897255 ?auto_897256 ) ( ON ?auto_897254 ?auto_897255 ) ( ON ?auto_897253 ?auto_897254 ) ( ON ?auto_897252 ?auto_897253 ) ( CLEAR ?auto_897250 ) ( ON ?auto_897251 ?auto_897252 ) ( CLEAR ?auto_897251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_897241 ?auto_897242 ?auto_897243 ?auto_897244 ?auto_897245 ?auto_897246 ?auto_897247 ?auto_897248 ?auto_897249 ?auto_897250 ?auto_897251 )
      ( MAKE-18PILE ?auto_897241 ?auto_897242 ?auto_897243 ?auto_897244 ?auto_897245 ?auto_897246 ?auto_897247 ?auto_897248 ?auto_897249 ?auto_897250 ?auto_897251 ?auto_897252 ?auto_897253 ?auto_897254 ?auto_897255 ?auto_897256 ?auto_897257 ?auto_897258 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897277 - BLOCK
      ?auto_897278 - BLOCK
      ?auto_897279 - BLOCK
      ?auto_897280 - BLOCK
      ?auto_897281 - BLOCK
      ?auto_897282 - BLOCK
      ?auto_897283 - BLOCK
      ?auto_897284 - BLOCK
      ?auto_897285 - BLOCK
      ?auto_897286 - BLOCK
      ?auto_897287 - BLOCK
      ?auto_897288 - BLOCK
      ?auto_897289 - BLOCK
      ?auto_897290 - BLOCK
      ?auto_897291 - BLOCK
      ?auto_897292 - BLOCK
      ?auto_897293 - BLOCK
      ?auto_897294 - BLOCK
    )
    :vars
    (
      ?auto_897295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897294 ?auto_897295 ) ( ON-TABLE ?auto_897277 ) ( ON ?auto_897278 ?auto_897277 ) ( ON ?auto_897279 ?auto_897278 ) ( ON ?auto_897280 ?auto_897279 ) ( ON ?auto_897281 ?auto_897280 ) ( ON ?auto_897282 ?auto_897281 ) ( ON ?auto_897283 ?auto_897282 ) ( ON ?auto_897284 ?auto_897283 ) ( ON ?auto_897285 ?auto_897284 ) ( not ( = ?auto_897277 ?auto_897278 ) ) ( not ( = ?auto_897277 ?auto_897279 ) ) ( not ( = ?auto_897277 ?auto_897280 ) ) ( not ( = ?auto_897277 ?auto_897281 ) ) ( not ( = ?auto_897277 ?auto_897282 ) ) ( not ( = ?auto_897277 ?auto_897283 ) ) ( not ( = ?auto_897277 ?auto_897284 ) ) ( not ( = ?auto_897277 ?auto_897285 ) ) ( not ( = ?auto_897277 ?auto_897286 ) ) ( not ( = ?auto_897277 ?auto_897287 ) ) ( not ( = ?auto_897277 ?auto_897288 ) ) ( not ( = ?auto_897277 ?auto_897289 ) ) ( not ( = ?auto_897277 ?auto_897290 ) ) ( not ( = ?auto_897277 ?auto_897291 ) ) ( not ( = ?auto_897277 ?auto_897292 ) ) ( not ( = ?auto_897277 ?auto_897293 ) ) ( not ( = ?auto_897277 ?auto_897294 ) ) ( not ( = ?auto_897277 ?auto_897295 ) ) ( not ( = ?auto_897278 ?auto_897279 ) ) ( not ( = ?auto_897278 ?auto_897280 ) ) ( not ( = ?auto_897278 ?auto_897281 ) ) ( not ( = ?auto_897278 ?auto_897282 ) ) ( not ( = ?auto_897278 ?auto_897283 ) ) ( not ( = ?auto_897278 ?auto_897284 ) ) ( not ( = ?auto_897278 ?auto_897285 ) ) ( not ( = ?auto_897278 ?auto_897286 ) ) ( not ( = ?auto_897278 ?auto_897287 ) ) ( not ( = ?auto_897278 ?auto_897288 ) ) ( not ( = ?auto_897278 ?auto_897289 ) ) ( not ( = ?auto_897278 ?auto_897290 ) ) ( not ( = ?auto_897278 ?auto_897291 ) ) ( not ( = ?auto_897278 ?auto_897292 ) ) ( not ( = ?auto_897278 ?auto_897293 ) ) ( not ( = ?auto_897278 ?auto_897294 ) ) ( not ( = ?auto_897278 ?auto_897295 ) ) ( not ( = ?auto_897279 ?auto_897280 ) ) ( not ( = ?auto_897279 ?auto_897281 ) ) ( not ( = ?auto_897279 ?auto_897282 ) ) ( not ( = ?auto_897279 ?auto_897283 ) ) ( not ( = ?auto_897279 ?auto_897284 ) ) ( not ( = ?auto_897279 ?auto_897285 ) ) ( not ( = ?auto_897279 ?auto_897286 ) ) ( not ( = ?auto_897279 ?auto_897287 ) ) ( not ( = ?auto_897279 ?auto_897288 ) ) ( not ( = ?auto_897279 ?auto_897289 ) ) ( not ( = ?auto_897279 ?auto_897290 ) ) ( not ( = ?auto_897279 ?auto_897291 ) ) ( not ( = ?auto_897279 ?auto_897292 ) ) ( not ( = ?auto_897279 ?auto_897293 ) ) ( not ( = ?auto_897279 ?auto_897294 ) ) ( not ( = ?auto_897279 ?auto_897295 ) ) ( not ( = ?auto_897280 ?auto_897281 ) ) ( not ( = ?auto_897280 ?auto_897282 ) ) ( not ( = ?auto_897280 ?auto_897283 ) ) ( not ( = ?auto_897280 ?auto_897284 ) ) ( not ( = ?auto_897280 ?auto_897285 ) ) ( not ( = ?auto_897280 ?auto_897286 ) ) ( not ( = ?auto_897280 ?auto_897287 ) ) ( not ( = ?auto_897280 ?auto_897288 ) ) ( not ( = ?auto_897280 ?auto_897289 ) ) ( not ( = ?auto_897280 ?auto_897290 ) ) ( not ( = ?auto_897280 ?auto_897291 ) ) ( not ( = ?auto_897280 ?auto_897292 ) ) ( not ( = ?auto_897280 ?auto_897293 ) ) ( not ( = ?auto_897280 ?auto_897294 ) ) ( not ( = ?auto_897280 ?auto_897295 ) ) ( not ( = ?auto_897281 ?auto_897282 ) ) ( not ( = ?auto_897281 ?auto_897283 ) ) ( not ( = ?auto_897281 ?auto_897284 ) ) ( not ( = ?auto_897281 ?auto_897285 ) ) ( not ( = ?auto_897281 ?auto_897286 ) ) ( not ( = ?auto_897281 ?auto_897287 ) ) ( not ( = ?auto_897281 ?auto_897288 ) ) ( not ( = ?auto_897281 ?auto_897289 ) ) ( not ( = ?auto_897281 ?auto_897290 ) ) ( not ( = ?auto_897281 ?auto_897291 ) ) ( not ( = ?auto_897281 ?auto_897292 ) ) ( not ( = ?auto_897281 ?auto_897293 ) ) ( not ( = ?auto_897281 ?auto_897294 ) ) ( not ( = ?auto_897281 ?auto_897295 ) ) ( not ( = ?auto_897282 ?auto_897283 ) ) ( not ( = ?auto_897282 ?auto_897284 ) ) ( not ( = ?auto_897282 ?auto_897285 ) ) ( not ( = ?auto_897282 ?auto_897286 ) ) ( not ( = ?auto_897282 ?auto_897287 ) ) ( not ( = ?auto_897282 ?auto_897288 ) ) ( not ( = ?auto_897282 ?auto_897289 ) ) ( not ( = ?auto_897282 ?auto_897290 ) ) ( not ( = ?auto_897282 ?auto_897291 ) ) ( not ( = ?auto_897282 ?auto_897292 ) ) ( not ( = ?auto_897282 ?auto_897293 ) ) ( not ( = ?auto_897282 ?auto_897294 ) ) ( not ( = ?auto_897282 ?auto_897295 ) ) ( not ( = ?auto_897283 ?auto_897284 ) ) ( not ( = ?auto_897283 ?auto_897285 ) ) ( not ( = ?auto_897283 ?auto_897286 ) ) ( not ( = ?auto_897283 ?auto_897287 ) ) ( not ( = ?auto_897283 ?auto_897288 ) ) ( not ( = ?auto_897283 ?auto_897289 ) ) ( not ( = ?auto_897283 ?auto_897290 ) ) ( not ( = ?auto_897283 ?auto_897291 ) ) ( not ( = ?auto_897283 ?auto_897292 ) ) ( not ( = ?auto_897283 ?auto_897293 ) ) ( not ( = ?auto_897283 ?auto_897294 ) ) ( not ( = ?auto_897283 ?auto_897295 ) ) ( not ( = ?auto_897284 ?auto_897285 ) ) ( not ( = ?auto_897284 ?auto_897286 ) ) ( not ( = ?auto_897284 ?auto_897287 ) ) ( not ( = ?auto_897284 ?auto_897288 ) ) ( not ( = ?auto_897284 ?auto_897289 ) ) ( not ( = ?auto_897284 ?auto_897290 ) ) ( not ( = ?auto_897284 ?auto_897291 ) ) ( not ( = ?auto_897284 ?auto_897292 ) ) ( not ( = ?auto_897284 ?auto_897293 ) ) ( not ( = ?auto_897284 ?auto_897294 ) ) ( not ( = ?auto_897284 ?auto_897295 ) ) ( not ( = ?auto_897285 ?auto_897286 ) ) ( not ( = ?auto_897285 ?auto_897287 ) ) ( not ( = ?auto_897285 ?auto_897288 ) ) ( not ( = ?auto_897285 ?auto_897289 ) ) ( not ( = ?auto_897285 ?auto_897290 ) ) ( not ( = ?auto_897285 ?auto_897291 ) ) ( not ( = ?auto_897285 ?auto_897292 ) ) ( not ( = ?auto_897285 ?auto_897293 ) ) ( not ( = ?auto_897285 ?auto_897294 ) ) ( not ( = ?auto_897285 ?auto_897295 ) ) ( not ( = ?auto_897286 ?auto_897287 ) ) ( not ( = ?auto_897286 ?auto_897288 ) ) ( not ( = ?auto_897286 ?auto_897289 ) ) ( not ( = ?auto_897286 ?auto_897290 ) ) ( not ( = ?auto_897286 ?auto_897291 ) ) ( not ( = ?auto_897286 ?auto_897292 ) ) ( not ( = ?auto_897286 ?auto_897293 ) ) ( not ( = ?auto_897286 ?auto_897294 ) ) ( not ( = ?auto_897286 ?auto_897295 ) ) ( not ( = ?auto_897287 ?auto_897288 ) ) ( not ( = ?auto_897287 ?auto_897289 ) ) ( not ( = ?auto_897287 ?auto_897290 ) ) ( not ( = ?auto_897287 ?auto_897291 ) ) ( not ( = ?auto_897287 ?auto_897292 ) ) ( not ( = ?auto_897287 ?auto_897293 ) ) ( not ( = ?auto_897287 ?auto_897294 ) ) ( not ( = ?auto_897287 ?auto_897295 ) ) ( not ( = ?auto_897288 ?auto_897289 ) ) ( not ( = ?auto_897288 ?auto_897290 ) ) ( not ( = ?auto_897288 ?auto_897291 ) ) ( not ( = ?auto_897288 ?auto_897292 ) ) ( not ( = ?auto_897288 ?auto_897293 ) ) ( not ( = ?auto_897288 ?auto_897294 ) ) ( not ( = ?auto_897288 ?auto_897295 ) ) ( not ( = ?auto_897289 ?auto_897290 ) ) ( not ( = ?auto_897289 ?auto_897291 ) ) ( not ( = ?auto_897289 ?auto_897292 ) ) ( not ( = ?auto_897289 ?auto_897293 ) ) ( not ( = ?auto_897289 ?auto_897294 ) ) ( not ( = ?auto_897289 ?auto_897295 ) ) ( not ( = ?auto_897290 ?auto_897291 ) ) ( not ( = ?auto_897290 ?auto_897292 ) ) ( not ( = ?auto_897290 ?auto_897293 ) ) ( not ( = ?auto_897290 ?auto_897294 ) ) ( not ( = ?auto_897290 ?auto_897295 ) ) ( not ( = ?auto_897291 ?auto_897292 ) ) ( not ( = ?auto_897291 ?auto_897293 ) ) ( not ( = ?auto_897291 ?auto_897294 ) ) ( not ( = ?auto_897291 ?auto_897295 ) ) ( not ( = ?auto_897292 ?auto_897293 ) ) ( not ( = ?auto_897292 ?auto_897294 ) ) ( not ( = ?auto_897292 ?auto_897295 ) ) ( not ( = ?auto_897293 ?auto_897294 ) ) ( not ( = ?auto_897293 ?auto_897295 ) ) ( not ( = ?auto_897294 ?auto_897295 ) ) ( ON ?auto_897293 ?auto_897294 ) ( ON ?auto_897292 ?auto_897293 ) ( ON ?auto_897291 ?auto_897292 ) ( ON ?auto_897290 ?auto_897291 ) ( ON ?auto_897289 ?auto_897290 ) ( ON ?auto_897288 ?auto_897289 ) ( ON ?auto_897287 ?auto_897288 ) ( CLEAR ?auto_897285 ) ( ON ?auto_897286 ?auto_897287 ) ( CLEAR ?auto_897286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_897277 ?auto_897278 ?auto_897279 ?auto_897280 ?auto_897281 ?auto_897282 ?auto_897283 ?auto_897284 ?auto_897285 ?auto_897286 )
      ( MAKE-18PILE ?auto_897277 ?auto_897278 ?auto_897279 ?auto_897280 ?auto_897281 ?auto_897282 ?auto_897283 ?auto_897284 ?auto_897285 ?auto_897286 ?auto_897287 ?auto_897288 ?auto_897289 ?auto_897290 ?auto_897291 ?auto_897292 ?auto_897293 ?auto_897294 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897314 - BLOCK
      ?auto_897315 - BLOCK
      ?auto_897316 - BLOCK
      ?auto_897317 - BLOCK
      ?auto_897318 - BLOCK
      ?auto_897319 - BLOCK
      ?auto_897320 - BLOCK
      ?auto_897321 - BLOCK
      ?auto_897322 - BLOCK
      ?auto_897323 - BLOCK
      ?auto_897324 - BLOCK
      ?auto_897325 - BLOCK
      ?auto_897326 - BLOCK
      ?auto_897327 - BLOCK
      ?auto_897328 - BLOCK
      ?auto_897329 - BLOCK
      ?auto_897330 - BLOCK
      ?auto_897331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897331 ) ( ON-TABLE ?auto_897314 ) ( ON ?auto_897315 ?auto_897314 ) ( ON ?auto_897316 ?auto_897315 ) ( ON ?auto_897317 ?auto_897316 ) ( ON ?auto_897318 ?auto_897317 ) ( ON ?auto_897319 ?auto_897318 ) ( ON ?auto_897320 ?auto_897319 ) ( ON ?auto_897321 ?auto_897320 ) ( ON ?auto_897322 ?auto_897321 ) ( not ( = ?auto_897314 ?auto_897315 ) ) ( not ( = ?auto_897314 ?auto_897316 ) ) ( not ( = ?auto_897314 ?auto_897317 ) ) ( not ( = ?auto_897314 ?auto_897318 ) ) ( not ( = ?auto_897314 ?auto_897319 ) ) ( not ( = ?auto_897314 ?auto_897320 ) ) ( not ( = ?auto_897314 ?auto_897321 ) ) ( not ( = ?auto_897314 ?auto_897322 ) ) ( not ( = ?auto_897314 ?auto_897323 ) ) ( not ( = ?auto_897314 ?auto_897324 ) ) ( not ( = ?auto_897314 ?auto_897325 ) ) ( not ( = ?auto_897314 ?auto_897326 ) ) ( not ( = ?auto_897314 ?auto_897327 ) ) ( not ( = ?auto_897314 ?auto_897328 ) ) ( not ( = ?auto_897314 ?auto_897329 ) ) ( not ( = ?auto_897314 ?auto_897330 ) ) ( not ( = ?auto_897314 ?auto_897331 ) ) ( not ( = ?auto_897315 ?auto_897316 ) ) ( not ( = ?auto_897315 ?auto_897317 ) ) ( not ( = ?auto_897315 ?auto_897318 ) ) ( not ( = ?auto_897315 ?auto_897319 ) ) ( not ( = ?auto_897315 ?auto_897320 ) ) ( not ( = ?auto_897315 ?auto_897321 ) ) ( not ( = ?auto_897315 ?auto_897322 ) ) ( not ( = ?auto_897315 ?auto_897323 ) ) ( not ( = ?auto_897315 ?auto_897324 ) ) ( not ( = ?auto_897315 ?auto_897325 ) ) ( not ( = ?auto_897315 ?auto_897326 ) ) ( not ( = ?auto_897315 ?auto_897327 ) ) ( not ( = ?auto_897315 ?auto_897328 ) ) ( not ( = ?auto_897315 ?auto_897329 ) ) ( not ( = ?auto_897315 ?auto_897330 ) ) ( not ( = ?auto_897315 ?auto_897331 ) ) ( not ( = ?auto_897316 ?auto_897317 ) ) ( not ( = ?auto_897316 ?auto_897318 ) ) ( not ( = ?auto_897316 ?auto_897319 ) ) ( not ( = ?auto_897316 ?auto_897320 ) ) ( not ( = ?auto_897316 ?auto_897321 ) ) ( not ( = ?auto_897316 ?auto_897322 ) ) ( not ( = ?auto_897316 ?auto_897323 ) ) ( not ( = ?auto_897316 ?auto_897324 ) ) ( not ( = ?auto_897316 ?auto_897325 ) ) ( not ( = ?auto_897316 ?auto_897326 ) ) ( not ( = ?auto_897316 ?auto_897327 ) ) ( not ( = ?auto_897316 ?auto_897328 ) ) ( not ( = ?auto_897316 ?auto_897329 ) ) ( not ( = ?auto_897316 ?auto_897330 ) ) ( not ( = ?auto_897316 ?auto_897331 ) ) ( not ( = ?auto_897317 ?auto_897318 ) ) ( not ( = ?auto_897317 ?auto_897319 ) ) ( not ( = ?auto_897317 ?auto_897320 ) ) ( not ( = ?auto_897317 ?auto_897321 ) ) ( not ( = ?auto_897317 ?auto_897322 ) ) ( not ( = ?auto_897317 ?auto_897323 ) ) ( not ( = ?auto_897317 ?auto_897324 ) ) ( not ( = ?auto_897317 ?auto_897325 ) ) ( not ( = ?auto_897317 ?auto_897326 ) ) ( not ( = ?auto_897317 ?auto_897327 ) ) ( not ( = ?auto_897317 ?auto_897328 ) ) ( not ( = ?auto_897317 ?auto_897329 ) ) ( not ( = ?auto_897317 ?auto_897330 ) ) ( not ( = ?auto_897317 ?auto_897331 ) ) ( not ( = ?auto_897318 ?auto_897319 ) ) ( not ( = ?auto_897318 ?auto_897320 ) ) ( not ( = ?auto_897318 ?auto_897321 ) ) ( not ( = ?auto_897318 ?auto_897322 ) ) ( not ( = ?auto_897318 ?auto_897323 ) ) ( not ( = ?auto_897318 ?auto_897324 ) ) ( not ( = ?auto_897318 ?auto_897325 ) ) ( not ( = ?auto_897318 ?auto_897326 ) ) ( not ( = ?auto_897318 ?auto_897327 ) ) ( not ( = ?auto_897318 ?auto_897328 ) ) ( not ( = ?auto_897318 ?auto_897329 ) ) ( not ( = ?auto_897318 ?auto_897330 ) ) ( not ( = ?auto_897318 ?auto_897331 ) ) ( not ( = ?auto_897319 ?auto_897320 ) ) ( not ( = ?auto_897319 ?auto_897321 ) ) ( not ( = ?auto_897319 ?auto_897322 ) ) ( not ( = ?auto_897319 ?auto_897323 ) ) ( not ( = ?auto_897319 ?auto_897324 ) ) ( not ( = ?auto_897319 ?auto_897325 ) ) ( not ( = ?auto_897319 ?auto_897326 ) ) ( not ( = ?auto_897319 ?auto_897327 ) ) ( not ( = ?auto_897319 ?auto_897328 ) ) ( not ( = ?auto_897319 ?auto_897329 ) ) ( not ( = ?auto_897319 ?auto_897330 ) ) ( not ( = ?auto_897319 ?auto_897331 ) ) ( not ( = ?auto_897320 ?auto_897321 ) ) ( not ( = ?auto_897320 ?auto_897322 ) ) ( not ( = ?auto_897320 ?auto_897323 ) ) ( not ( = ?auto_897320 ?auto_897324 ) ) ( not ( = ?auto_897320 ?auto_897325 ) ) ( not ( = ?auto_897320 ?auto_897326 ) ) ( not ( = ?auto_897320 ?auto_897327 ) ) ( not ( = ?auto_897320 ?auto_897328 ) ) ( not ( = ?auto_897320 ?auto_897329 ) ) ( not ( = ?auto_897320 ?auto_897330 ) ) ( not ( = ?auto_897320 ?auto_897331 ) ) ( not ( = ?auto_897321 ?auto_897322 ) ) ( not ( = ?auto_897321 ?auto_897323 ) ) ( not ( = ?auto_897321 ?auto_897324 ) ) ( not ( = ?auto_897321 ?auto_897325 ) ) ( not ( = ?auto_897321 ?auto_897326 ) ) ( not ( = ?auto_897321 ?auto_897327 ) ) ( not ( = ?auto_897321 ?auto_897328 ) ) ( not ( = ?auto_897321 ?auto_897329 ) ) ( not ( = ?auto_897321 ?auto_897330 ) ) ( not ( = ?auto_897321 ?auto_897331 ) ) ( not ( = ?auto_897322 ?auto_897323 ) ) ( not ( = ?auto_897322 ?auto_897324 ) ) ( not ( = ?auto_897322 ?auto_897325 ) ) ( not ( = ?auto_897322 ?auto_897326 ) ) ( not ( = ?auto_897322 ?auto_897327 ) ) ( not ( = ?auto_897322 ?auto_897328 ) ) ( not ( = ?auto_897322 ?auto_897329 ) ) ( not ( = ?auto_897322 ?auto_897330 ) ) ( not ( = ?auto_897322 ?auto_897331 ) ) ( not ( = ?auto_897323 ?auto_897324 ) ) ( not ( = ?auto_897323 ?auto_897325 ) ) ( not ( = ?auto_897323 ?auto_897326 ) ) ( not ( = ?auto_897323 ?auto_897327 ) ) ( not ( = ?auto_897323 ?auto_897328 ) ) ( not ( = ?auto_897323 ?auto_897329 ) ) ( not ( = ?auto_897323 ?auto_897330 ) ) ( not ( = ?auto_897323 ?auto_897331 ) ) ( not ( = ?auto_897324 ?auto_897325 ) ) ( not ( = ?auto_897324 ?auto_897326 ) ) ( not ( = ?auto_897324 ?auto_897327 ) ) ( not ( = ?auto_897324 ?auto_897328 ) ) ( not ( = ?auto_897324 ?auto_897329 ) ) ( not ( = ?auto_897324 ?auto_897330 ) ) ( not ( = ?auto_897324 ?auto_897331 ) ) ( not ( = ?auto_897325 ?auto_897326 ) ) ( not ( = ?auto_897325 ?auto_897327 ) ) ( not ( = ?auto_897325 ?auto_897328 ) ) ( not ( = ?auto_897325 ?auto_897329 ) ) ( not ( = ?auto_897325 ?auto_897330 ) ) ( not ( = ?auto_897325 ?auto_897331 ) ) ( not ( = ?auto_897326 ?auto_897327 ) ) ( not ( = ?auto_897326 ?auto_897328 ) ) ( not ( = ?auto_897326 ?auto_897329 ) ) ( not ( = ?auto_897326 ?auto_897330 ) ) ( not ( = ?auto_897326 ?auto_897331 ) ) ( not ( = ?auto_897327 ?auto_897328 ) ) ( not ( = ?auto_897327 ?auto_897329 ) ) ( not ( = ?auto_897327 ?auto_897330 ) ) ( not ( = ?auto_897327 ?auto_897331 ) ) ( not ( = ?auto_897328 ?auto_897329 ) ) ( not ( = ?auto_897328 ?auto_897330 ) ) ( not ( = ?auto_897328 ?auto_897331 ) ) ( not ( = ?auto_897329 ?auto_897330 ) ) ( not ( = ?auto_897329 ?auto_897331 ) ) ( not ( = ?auto_897330 ?auto_897331 ) ) ( ON ?auto_897330 ?auto_897331 ) ( ON ?auto_897329 ?auto_897330 ) ( ON ?auto_897328 ?auto_897329 ) ( ON ?auto_897327 ?auto_897328 ) ( ON ?auto_897326 ?auto_897327 ) ( ON ?auto_897325 ?auto_897326 ) ( ON ?auto_897324 ?auto_897325 ) ( CLEAR ?auto_897322 ) ( ON ?auto_897323 ?auto_897324 ) ( CLEAR ?auto_897323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_897314 ?auto_897315 ?auto_897316 ?auto_897317 ?auto_897318 ?auto_897319 ?auto_897320 ?auto_897321 ?auto_897322 ?auto_897323 )
      ( MAKE-18PILE ?auto_897314 ?auto_897315 ?auto_897316 ?auto_897317 ?auto_897318 ?auto_897319 ?auto_897320 ?auto_897321 ?auto_897322 ?auto_897323 ?auto_897324 ?auto_897325 ?auto_897326 ?auto_897327 ?auto_897328 ?auto_897329 ?auto_897330 ?auto_897331 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897350 - BLOCK
      ?auto_897351 - BLOCK
      ?auto_897352 - BLOCK
      ?auto_897353 - BLOCK
      ?auto_897354 - BLOCK
      ?auto_897355 - BLOCK
      ?auto_897356 - BLOCK
      ?auto_897357 - BLOCK
      ?auto_897358 - BLOCK
      ?auto_897359 - BLOCK
      ?auto_897360 - BLOCK
      ?auto_897361 - BLOCK
      ?auto_897362 - BLOCK
      ?auto_897363 - BLOCK
      ?auto_897364 - BLOCK
      ?auto_897365 - BLOCK
      ?auto_897366 - BLOCK
      ?auto_897367 - BLOCK
    )
    :vars
    (
      ?auto_897368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897367 ?auto_897368 ) ( ON-TABLE ?auto_897350 ) ( ON ?auto_897351 ?auto_897350 ) ( ON ?auto_897352 ?auto_897351 ) ( ON ?auto_897353 ?auto_897352 ) ( ON ?auto_897354 ?auto_897353 ) ( ON ?auto_897355 ?auto_897354 ) ( ON ?auto_897356 ?auto_897355 ) ( ON ?auto_897357 ?auto_897356 ) ( not ( = ?auto_897350 ?auto_897351 ) ) ( not ( = ?auto_897350 ?auto_897352 ) ) ( not ( = ?auto_897350 ?auto_897353 ) ) ( not ( = ?auto_897350 ?auto_897354 ) ) ( not ( = ?auto_897350 ?auto_897355 ) ) ( not ( = ?auto_897350 ?auto_897356 ) ) ( not ( = ?auto_897350 ?auto_897357 ) ) ( not ( = ?auto_897350 ?auto_897358 ) ) ( not ( = ?auto_897350 ?auto_897359 ) ) ( not ( = ?auto_897350 ?auto_897360 ) ) ( not ( = ?auto_897350 ?auto_897361 ) ) ( not ( = ?auto_897350 ?auto_897362 ) ) ( not ( = ?auto_897350 ?auto_897363 ) ) ( not ( = ?auto_897350 ?auto_897364 ) ) ( not ( = ?auto_897350 ?auto_897365 ) ) ( not ( = ?auto_897350 ?auto_897366 ) ) ( not ( = ?auto_897350 ?auto_897367 ) ) ( not ( = ?auto_897350 ?auto_897368 ) ) ( not ( = ?auto_897351 ?auto_897352 ) ) ( not ( = ?auto_897351 ?auto_897353 ) ) ( not ( = ?auto_897351 ?auto_897354 ) ) ( not ( = ?auto_897351 ?auto_897355 ) ) ( not ( = ?auto_897351 ?auto_897356 ) ) ( not ( = ?auto_897351 ?auto_897357 ) ) ( not ( = ?auto_897351 ?auto_897358 ) ) ( not ( = ?auto_897351 ?auto_897359 ) ) ( not ( = ?auto_897351 ?auto_897360 ) ) ( not ( = ?auto_897351 ?auto_897361 ) ) ( not ( = ?auto_897351 ?auto_897362 ) ) ( not ( = ?auto_897351 ?auto_897363 ) ) ( not ( = ?auto_897351 ?auto_897364 ) ) ( not ( = ?auto_897351 ?auto_897365 ) ) ( not ( = ?auto_897351 ?auto_897366 ) ) ( not ( = ?auto_897351 ?auto_897367 ) ) ( not ( = ?auto_897351 ?auto_897368 ) ) ( not ( = ?auto_897352 ?auto_897353 ) ) ( not ( = ?auto_897352 ?auto_897354 ) ) ( not ( = ?auto_897352 ?auto_897355 ) ) ( not ( = ?auto_897352 ?auto_897356 ) ) ( not ( = ?auto_897352 ?auto_897357 ) ) ( not ( = ?auto_897352 ?auto_897358 ) ) ( not ( = ?auto_897352 ?auto_897359 ) ) ( not ( = ?auto_897352 ?auto_897360 ) ) ( not ( = ?auto_897352 ?auto_897361 ) ) ( not ( = ?auto_897352 ?auto_897362 ) ) ( not ( = ?auto_897352 ?auto_897363 ) ) ( not ( = ?auto_897352 ?auto_897364 ) ) ( not ( = ?auto_897352 ?auto_897365 ) ) ( not ( = ?auto_897352 ?auto_897366 ) ) ( not ( = ?auto_897352 ?auto_897367 ) ) ( not ( = ?auto_897352 ?auto_897368 ) ) ( not ( = ?auto_897353 ?auto_897354 ) ) ( not ( = ?auto_897353 ?auto_897355 ) ) ( not ( = ?auto_897353 ?auto_897356 ) ) ( not ( = ?auto_897353 ?auto_897357 ) ) ( not ( = ?auto_897353 ?auto_897358 ) ) ( not ( = ?auto_897353 ?auto_897359 ) ) ( not ( = ?auto_897353 ?auto_897360 ) ) ( not ( = ?auto_897353 ?auto_897361 ) ) ( not ( = ?auto_897353 ?auto_897362 ) ) ( not ( = ?auto_897353 ?auto_897363 ) ) ( not ( = ?auto_897353 ?auto_897364 ) ) ( not ( = ?auto_897353 ?auto_897365 ) ) ( not ( = ?auto_897353 ?auto_897366 ) ) ( not ( = ?auto_897353 ?auto_897367 ) ) ( not ( = ?auto_897353 ?auto_897368 ) ) ( not ( = ?auto_897354 ?auto_897355 ) ) ( not ( = ?auto_897354 ?auto_897356 ) ) ( not ( = ?auto_897354 ?auto_897357 ) ) ( not ( = ?auto_897354 ?auto_897358 ) ) ( not ( = ?auto_897354 ?auto_897359 ) ) ( not ( = ?auto_897354 ?auto_897360 ) ) ( not ( = ?auto_897354 ?auto_897361 ) ) ( not ( = ?auto_897354 ?auto_897362 ) ) ( not ( = ?auto_897354 ?auto_897363 ) ) ( not ( = ?auto_897354 ?auto_897364 ) ) ( not ( = ?auto_897354 ?auto_897365 ) ) ( not ( = ?auto_897354 ?auto_897366 ) ) ( not ( = ?auto_897354 ?auto_897367 ) ) ( not ( = ?auto_897354 ?auto_897368 ) ) ( not ( = ?auto_897355 ?auto_897356 ) ) ( not ( = ?auto_897355 ?auto_897357 ) ) ( not ( = ?auto_897355 ?auto_897358 ) ) ( not ( = ?auto_897355 ?auto_897359 ) ) ( not ( = ?auto_897355 ?auto_897360 ) ) ( not ( = ?auto_897355 ?auto_897361 ) ) ( not ( = ?auto_897355 ?auto_897362 ) ) ( not ( = ?auto_897355 ?auto_897363 ) ) ( not ( = ?auto_897355 ?auto_897364 ) ) ( not ( = ?auto_897355 ?auto_897365 ) ) ( not ( = ?auto_897355 ?auto_897366 ) ) ( not ( = ?auto_897355 ?auto_897367 ) ) ( not ( = ?auto_897355 ?auto_897368 ) ) ( not ( = ?auto_897356 ?auto_897357 ) ) ( not ( = ?auto_897356 ?auto_897358 ) ) ( not ( = ?auto_897356 ?auto_897359 ) ) ( not ( = ?auto_897356 ?auto_897360 ) ) ( not ( = ?auto_897356 ?auto_897361 ) ) ( not ( = ?auto_897356 ?auto_897362 ) ) ( not ( = ?auto_897356 ?auto_897363 ) ) ( not ( = ?auto_897356 ?auto_897364 ) ) ( not ( = ?auto_897356 ?auto_897365 ) ) ( not ( = ?auto_897356 ?auto_897366 ) ) ( not ( = ?auto_897356 ?auto_897367 ) ) ( not ( = ?auto_897356 ?auto_897368 ) ) ( not ( = ?auto_897357 ?auto_897358 ) ) ( not ( = ?auto_897357 ?auto_897359 ) ) ( not ( = ?auto_897357 ?auto_897360 ) ) ( not ( = ?auto_897357 ?auto_897361 ) ) ( not ( = ?auto_897357 ?auto_897362 ) ) ( not ( = ?auto_897357 ?auto_897363 ) ) ( not ( = ?auto_897357 ?auto_897364 ) ) ( not ( = ?auto_897357 ?auto_897365 ) ) ( not ( = ?auto_897357 ?auto_897366 ) ) ( not ( = ?auto_897357 ?auto_897367 ) ) ( not ( = ?auto_897357 ?auto_897368 ) ) ( not ( = ?auto_897358 ?auto_897359 ) ) ( not ( = ?auto_897358 ?auto_897360 ) ) ( not ( = ?auto_897358 ?auto_897361 ) ) ( not ( = ?auto_897358 ?auto_897362 ) ) ( not ( = ?auto_897358 ?auto_897363 ) ) ( not ( = ?auto_897358 ?auto_897364 ) ) ( not ( = ?auto_897358 ?auto_897365 ) ) ( not ( = ?auto_897358 ?auto_897366 ) ) ( not ( = ?auto_897358 ?auto_897367 ) ) ( not ( = ?auto_897358 ?auto_897368 ) ) ( not ( = ?auto_897359 ?auto_897360 ) ) ( not ( = ?auto_897359 ?auto_897361 ) ) ( not ( = ?auto_897359 ?auto_897362 ) ) ( not ( = ?auto_897359 ?auto_897363 ) ) ( not ( = ?auto_897359 ?auto_897364 ) ) ( not ( = ?auto_897359 ?auto_897365 ) ) ( not ( = ?auto_897359 ?auto_897366 ) ) ( not ( = ?auto_897359 ?auto_897367 ) ) ( not ( = ?auto_897359 ?auto_897368 ) ) ( not ( = ?auto_897360 ?auto_897361 ) ) ( not ( = ?auto_897360 ?auto_897362 ) ) ( not ( = ?auto_897360 ?auto_897363 ) ) ( not ( = ?auto_897360 ?auto_897364 ) ) ( not ( = ?auto_897360 ?auto_897365 ) ) ( not ( = ?auto_897360 ?auto_897366 ) ) ( not ( = ?auto_897360 ?auto_897367 ) ) ( not ( = ?auto_897360 ?auto_897368 ) ) ( not ( = ?auto_897361 ?auto_897362 ) ) ( not ( = ?auto_897361 ?auto_897363 ) ) ( not ( = ?auto_897361 ?auto_897364 ) ) ( not ( = ?auto_897361 ?auto_897365 ) ) ( not ( = ?auto_897361 ?auto_897366 ) ) ( not ( = ?auto_897361 ?auto_897367 ) ) ( not ( = ?auto_897361 ?auto_897368 ) ) ( not ( = ?auto_897362 ?auto_897363 ) ) ( not ( = ?auto_897362 ?auto_897364 ) ) ( not ( = ?auto_897362 ?auto_897365 ) ) ( not ( = ?auto_897362 ?auto_897366 ) ) ( not ( = ?auto_897362 ?auto_897367 ) ) ( not ( = ?auto_897362 ?auto_897368 ) ) ( not ( = ?auto_897363 ?auto_897364 ) ) ( not ( = ?auto_897363 ?auto_897365 ) ) ( not ( = ?auto_897363 ?auto_897366 ) ) ( not ( = ?auto_897363 ?auto_897367 ) ) ( not ( = ?auto_897363 ?auto_897368 ) ) ( not ( = ?auto_897364 ?auto_897365 ) ) ( not ( = ?auto_897364 ?auto_897366 ) ) ( not ( = ?auto_897364 ?auto_897367 ) ) ( not ( = ?auto_897364 ?auto_897368 ) ) ( not ( = ?auto_897365 ?auto_897366 ) ) ( not ( = ?auto_897365 ?auto_897367 ) ) ( not ( = ?auto_897365 ?auto_897368 ) ) ( not ( = ?auto_897366 ?auto_897367 ) ) ( not ( = ?auto_897366 ?auto_897368 ) ) ( not ( = ?auto_897367 ?auto_897368 ) ) ( ON ?auto_897366 ?auto_897367 ) ( ON ?auto_897365 ?auto_897366 ) ( ON ?auto_897364 ?auto_897365 ) ( ON ?auto_897363 ?auto_897364 ) ( ON ?auto_897362 ?auto_897363 ) ( ON ?auto_897361 ?auto_897362 ) ( ON ?auto_897360 ?auto_897361 ) ( ON ?auto_897359 ?auto_897360 ) ( CLEAR ?auto_897357 ) ( ON ?auto_897358 ?auto_897359 ) ( CLEAR ?auto_897358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_897350 ?auto_897351 ?auto_897352 ?auto_897353 ?auto_897354 ?auto_897355 ?auto_897356 ?auto_897357 ?auto_897358 )
      ( MAKE-18PILE ?auto_897350 ?auto_897351 ?auto_897352 ?auto_897353 ?auto_897354 ?auto_897355 ?auto_897356 ?auto_897357 ?auto_897358 ?auto_897359 ?auto_897360 ?auto_897361 ?auto_897362 ?auto_897363 ?auto_897364 ?auto_897365 ?auto_897366 ?auto_897367 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897387 - BLOCK
      ?auto_897388 - BLOCK
      ?auto_897389 - BLOCK
      ?auto_897390 - BLOCK
      ?auto_897391 - BLOCK
      ?auto_897392 - BLOCK
      ?auto_897393 - BLOCK
      ?auto_897394 - BLOCK
      ?auto_897395 - BLOCK
      ?auto_897396 - BLOCK
      ?auto_897397 - BLOCK
      ?auto_897398 - BLOCK
      ?auto_897399 - BLOCK
      ?auto_897400 - BLOCK
      ?auto_897401 - BLOCK
      ?auto_897402 - BLOCK
      ?auto_897403 - BLOCK
      ?auto_897404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897404 ) ( ON-TABLE ?auto_897387 ) ( ON ?auto_897388 ?auto_897387 ) ( ON ?auto_897389 ?auto_897388 ) ( ON ?auto_897390 ?auto_897389 ) ( ON ?auto_897391 ?auto_897390 ) ( ON ?auto_897392 ?auto_897391 ) ( ON ?auto_897393 ?auto_897392 ) ( ON ?auto_897394 ?auto_897393 ) ( not ( = ?auto_897387 ?auto_897388 ) ) ( not ( = ?auto_897387 ?auto_897389 ) ) ( not ( = ?auto_897387 ?auto_897390 ) ) ( not ( = ?auto_897387 ?auto_897391 ) ) ( not ( = ?auto_897387 ?auto_897392 ) ) ( not ( = ?auto_897387 ?auto_897393 ) ) ( not ( = ?auto_897387 ?auto_897394 ) ) ( not ( = ?auto_897387 ?auto_897395 ) ) ( not ( = ?auto_897387 ?auto_897396 ) ) ( not ( = ?auto_897387 ?auto_897397 ) ) ( not ( = ?auto_897387 ?auto_897398 ) ) ( not ( = ?auto_897387 ?auto_897399 ) ) ( not ( = ?auto_897387 ?auto_897400 ) ) ( not ( = ?auto_897387 ?auto_897401 ) ) ( not ( = ?auto_897387 ?auto_897402 ) ) ( not ( = ?auto_897387 ?auto_897403 ) ) ( not ( = ?auto_897387 ?auto_897404 ) ) ( not ( = ?auto_897388 ?auto_897389 ) ) ( not ( = ?auto_897388 ?auto_897390 ) ) ( not ( = ?auto_897388 ?auto_897391 ) ) ( not ( = ?auto_897388 ?auto_897392 ) ) ( not ( = ?auto_897388 ?auto_897393 ) ) ( not ( = ?auto_897388 ?auto_897394 ) ) ( not ( = ?auto_897388 ?auto_897395 ) ) ( not ( = ?auto_897388 ?auto_897396 ) ) ( not ( = ?auto_897388 ?auto_897397 ) ) ( not ( = ?auto_897388 ?auto_897398 ) ) ( not ( = ?auto_897388 ?auto_897399 ) ) ( not ( = ?auto_897388 ?auto_897400 ) ) ( not ( = ?auto_897388 ?auto_897401 ) ) ( not ( = ?auto_897388 ?auto_897402 ) ) ( not ( = ?auto_897388 ?auto_897403 ) ) ( not ( = ?auto_897388 ?auto_897404 ) ) ( not ( = ?auto_897389 ?auto_897390 ) ) ( not ( = ?auto_897389 ?auto_897391 ) ) ( not ( = ?auto_897389 ?auto_897392 ) ) ( not ( = ?auto_897389 ?auto_897393 ) ) ( not ( = ?auto_897389 ?auto_897394 ) ) ( not ( = ?auto_897389 ?auto_897395 ) ) ( not ( = ?auto_897389 ?auto_897396 ) ) ( not ( = ?auto_897389 ?auto_897397 ) ) ( not ( = ?auto_897389 ?auto_897398 ) ) ( not ( = ?auto_897389 ?auto_897399 ) ) ( not ( = ?auto_897389 ?auto_897400 ) ) ( not ( = ?auto_897389 ?auto_897401 ) ) ( not ( = ?auto_897389 ?auto_897402 ) ) ( not ( = ?auto_897389 ?auto_897403 ) ) ( not ( = ?auto_897389 ?auto_897404 ) ) ( not ( = ?auto_897390 ?auto_897391 ) ) ( not ( = ?auto_897390 ?auto_897392 ) ) ( not ( = ?auto_897390 ?auto_897393 ) ) ( not ( = ?auto_897390 ?auto_897394 ) ) ( not ( = ?auto_897390 ?auto_897395 ) ) ( not ( = ?auto_897390 ?auto_897396 ) ) ( not ( = ?auto_897390 ?auto_897397 ) ) ( not ( = ?auto_897390 ?auto_897398 ) ) ( not ( = ?auto_897390 ?auto_897399 ) ) ( not ( = ?auto_897390 ?auto_897400 ) ) ( not ( = ?auto_897390 ?auto_897401 ) ) ( not ( = ?auto_897390 ?auto_897402 ) ) ( not ( = ?auto_897390 ?auto_897403 ) ) ( not ( = ?auto_897390 ?auto_897404 ) ) ( not ( = ?auto_897391 ?auto_897392 ) ) ( not ( = ?auto_897391 ?auto_897393 ) ) ( not ( = ?auto_897391 ?auto_897394 ) ) ( not ( = ?auto_897391 ?auto_897395 ) ) ( not ( = ?auto_897391 ?auto_897396 ) ) ( not ( = ?auto_897391 ?auto_897397 ) ) ( not ( = ?auto_897391 ?auto_897398 ) ) ( not ( = ?auto_897391 ?auto_897399 ) ) ( not ( = ?auto_897391 ?auto_897400 ) ) ( not ( = ?auto_897391 ?auto_897401 ) ) ( not ( = ?auto_897391 ?auto_897402 ) ) ( not ( = ?auto_897391 ?auto_897403 ) ) ( not ( = ?auto_897391 ?auto_897404 ) ) ( not ( = ?auto_897392 ?auto_897393 ) ) ( not ( = ?auto_897392 ?auto_897394 ) ) ( not ( = ?auto_897392 ?auto_897395 ) ) ( not ( = ?auto_897392 ?auto_897396 ) ) ( not ( = ?auto_897392 ?auto_897397 ) ) ( not ( = ?auto_897392 ?auto_897398 ) ) ( not ( = ?auto_897392 ?auto_897399 ) ) ( not ( = ?auto_897392 ?auto_897400 ) ) ( not ( = ?auto_897392 ?auto_897401 ) ) ( not ( = ?auto_897392 ?auto_897402 ) ) ( not ( = ?auto_897392 ?auto_897403 ) ) ( not ( = ?auto_897392 ?auto_897404 ) ) ( not ( = ?auto_897393 ?auto_897394 ) ) ( not ( = ?auto_897393 ?auto_897395 ) ) ( not ( = ?auto_897393 ?auto_897396 ) ) ( not ( = ?auto_897393 ?auto_897397 ) ) ( not ( = ?auto_897393 ?auto_897398 ) ) ( not ( = ?auto_897393 ?auto_897399 ) ) ( not ( = ?auto_897393 ?auto_897400 ) ) ( not ( = ?auto_897393 ?auto_897401 ) ) ( not ( = ?auto_897393 ?auto_897402 ) ) ( not ( = ?auto_897393 ?auto_897403 ) ) ( not ( = ?auto_897393 ?auto_897404 ) ) ( not ( = ?auto_897394 ?auto_897395 ) ) ( not ( = ?auto_897394 ?auto_897396 ) ) ( not ( = ?auto_897394 ?auto_897397 ) ) ( not ( = ?auto_897394 ?auto_897398 ) ) ( not ( = ?auto_897394 ?auto_897399 ) ) ( not ( = ?auto_897394 ?auto_897400 ) ) ( not ( = ?auto_897394 ?auto_897401 ) ) ( not ( = ?auto_897394 ?auto_897402 ) ) ( not ( = ?auto_897394 ?auto_897403 ) ) ( not ( = ?auto_897394 ?auto_897404 ) ) ( not ( = ?auto_897395 ?auto_897396 ) ) ( not ( = ?auto_897395 ?auto_897397 ) ) ( not ( = ?auto_897395 ?auto_897398 ) ) ( not ( = ?auto_897395 ?auto_897399 ) ) ( not ( = ?auto_897395 ?auto_897400 ) ) ( not ( = ?auto_897395 ?auto_897401 ) ) ( not ( = ?auto_897395 ?auto_897402 ) ) ( not ( = ?auto_897395 ?auto_897403 ) ) ( not ( = ?auto_897395 ?auto_897404 ) ) ( not ( = ?auto_897396 ?auto_897397 ) ) ( not ( = ?auto_897396 ?auto_897398 ) ) ( not ( = ?auto_897396 ?auto_897399 ) ) ( not ( = ?auto_897396 ?auto_897400 ) ) ( not ( = ?auto_897396 ?auto_897401 ) ) ( not ( = ?auto_897396 ?auto_897402 ) ) ( not ( = ?auto_897396 ?auto_897403 ) ) ( not ( = ?auto_897396 ?auto_897404 ) ) ( not ( = ?auto_897397 ?auto_897398 ) ) ( not ( = ?auto_897397 ?auto_897399 ) ) ( not ( = ?auto_897397 ?auto_897400 ) ) ( not ( = ?auto_897397 ?auto_897401 ) ) ( not ( = ?auto_897397 ?auto_897402 ) ) ( not ( = ?auto_897397 ?auto_897403 ) ) ( not ( = ?auto_897397 ?auto_897404 ) ) ( not ( = ?auto_897398 ?auto_897399 ) ) ( not ( = ?auto_897398 ?auto_897400 ) ) ( not ( = ?auto_897398 ?auto_897401 ) ) ( not ( = ?auto_897398 ?auto_897402 ) ) ( not ( = ?auto_897398 ?auto_897403 ) ) ( not ( = ?auto_897398 ?auto_897404 ) ) ( not ( = ?auto_897399 ?auto_897400 ) ) ( not ( = ?auto_897399 ?auto_897401 ) ) ( not ( = ?auto_897399 ?auto_897402 ) ) ( not ( = ?auto_897399 ?auto_897403 ) ) ( not ( = ?auto_897399 ?auto_897404 ) ) ( not ( = ?auto_897400 ?auto_897401 ) ) ( not ( = ?auto_897400 ?auto_897402 ) ) ( not ( = ?auto_897400 ?auto_897403 ) ) ( not ( = ?auto_897400 ?auto_897404 ) ) ( not ( = ?auto_897401 ?auto_897402 ) ) ( not ( = ?auto_897401 ?auto_897403 ) ) ( not ( = ?auto_897401 ?auto_897404 ) ) ( not ( = ?auto_897402 ?auto_897403 ) ) ( not ( = ?auto_897402 ?auto_897404 ) ) ( not ( = ?auto_897403 ?auto_897404 ) ) ( ON ?auto_897403 ?auto_897404 ) ( ON ?auto_897402 ?auto_897403 ) ( ON ?auto_897401 ?auto_897402 ) ( ON ?auto_897400 ?auto_897401 ) ( ON ?auto_897399 ?auto_897400 ) ( ON ?auto_897398 ?auto_897399 ) ( ON ?auto_897397 ?auto_897398 ) ( ON ?auto_897396 ?auto_897397 ) ( CLEAR ?auto_897394 ) ( ON ?auto_897395 ?auto_897396 ) ( CLEAR ?auto_897395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_897387 ?auto_897388 ?auto_897389 ?auto_897390 ?auto_897391 ?auto_897392 ?auto_897393 ?auto_897394 ?auto_897395 )
      ( MAKE-18PILE ?auto_897387 ?auto_897388 ?auto_897389 ?auto_897390 ?auto_897391 ?auto_897392 ?auto_897393 ?auto_897394 ?auto_897395 ?auto_897396 ?auto_897397 ?auto_897398 ?auto_897399 ?auto_897400 ?auto_897401 ?auto_897402 ?auto_897403 ?auto_897404 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897423 - BLOCK
      ?auto_897424 - BLOCK
      ?auto_897425 - BLOCK
      ?auto_897426 - BLOCK
      ?auto_897427 - BLOCK
      ?auto_897428 - BLOCK
      ?auto_897429 - BLOCK
      ?auto_897430 - BLOCK
      ?auto_897431 - BLOCK
      ?auto_897432 - BLOCK
      ?auto_897433 - BLOCK
      ?auto_897434 - BLOCK
      ?auto_897435 - BLOCK
      ?auto_897436 - BLOCK
      ?auto_897437 - BLOCK
      ?auto_897438 - BLOCK
      ?auto_897439 - BLOCK
      ?auto_897440 - BLOCK
    )
    :vars
    (
      ?auto_897441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897440 ?auto_897441 ) ( ON-TABLE ?auto_897423 ) ( ON ?auto_897424 ?auto_897423 ) ( ON ?auto_897425 ?auto_897424 ) ( ON ?auto_897426 ?auto_897425 ) ( ON ?auto_897427 ?auto_897426 ) ( ON ?auto_897428 ?auto_897427 ) ( ON ?auto_897429 ?auto_897428 ) ( not ( = ?auto_897423 ?auto_897424 ) ) ( not ( = ?auto_897423 ?auto_897425 ) ) ( not ( = ?auto_897423 ?auto_897426 ) ) ( not ( = ?auto_897423 ?auto_897427 ) ) ( not ( = ?auto_897423 ?auto_897428 ) ) ( not ( = ?auto_897423 ?auto_897429 ) ) ( not ( = ?auto_897423 ?auto_897430 ) ) ( not ( = ?auto_897423 ?auto_897431 ) ) ( not ( = ?auto_897423 ?auto_897432 ) ) ( not ( = ?auto_897423 ?auto_897433 ) ) ( not ( = ?auto_897423 ?auto_897434 ) ) ( not ( = ?auto_897423 ?auto_897435 ) ) ( not ( = ?auto_897423 ?auto_897436 ) ) ( not ( = ?auto_897423 ?auto_897437 ) ) ( not ( = ?auto_897423 ?auto_897438 ) ) ( not ( = ?auto_897423 ?auto_897439 ) ) ( not ( = ?auto_897423 ?auto_897440 ) ) ( not ( = ?auto_897423 ?auto_897441 ) ) ( not ( = ?auto_897424 ?auto_897425 ) ) ( not ( = ?auto_897424 ?auto_897426 ) ) ( not ( = ?auto_897424 ?auto_897427 ) ) ( not ( = ?auto_897424 ?auto_897428 ) ) ( not ( = ?auto_897424 ?auto_897429 ) ) ( not ( = ?auto_897424 ?auto_897430 ) ) ( not ( = ?auto_897424 ?auto_897431 ) ) ( not ( = ?auto_897424 ?auto_897432 ) ) ( not ( = ?auto_897424 ?auto_897433 ) ) ( not ( = ?auto_897424 ?auto_897434 ) ) ( not ( = ?auto_897424 ?auto_897435 ) ) ( not ( = ?auto_897424 ?auto_897436 ) ) ( not ( = ?auto_897424 ?auto_897437 ) ) ( not ( = ?auto_897424 ?auto_897438 ) ) ( not ( = ?auto_897424 ?auto_897439 ) ) ( not ( = ?auto_897424 ?auto_897440 ) ) ( not ( = ?auto_897424 ?auto_897441 ) ) ( not ( = ?auto_897425 ?auto_897426 ) ) ( not ( = ?auto_897425 ?auto_897427 ) ) ( not ( = ?auto_897425 ?auto_897428 ) ) ( not ( = ?auto_897425 ?auto_897429 ) ) ( not ( = ?auto_897425 ?auto_897430 ) ) ( not ( = ?auto_897425 ?auto_897431 ) ) ( not ( = ?auto_897425 ?auto_897432 ) ) ( not ( = ?auto_897425 ?auto_897433 ) ) ( not ( = ?auto_897425 ?auto_897434 ) ) ( not ( = ?auto_897425 ?auto_897435 ) ) ( not ( = ?auto_897425 ?auto_897436 ) ) ( not ( = ?auto_897425 ?auto_897437 ) ) ( not ( = ?auto_897425 ?auto_897438 ) ) ( not ( = ?auto_897425 ?auto_897439 ) ) ( not ( = ?auto_897425 ?auto_897440 ) ) ( not ( = ?auto_897425 ?auto_897441 ) ) ( not ( = ?auto_897426 ?auto_897427 ) ) ( not ( = ?auto_897426 ?auto_897428 ) ) ( not ( = ?auto_897426 ?auto_897429 ) ) ( not ( = ?auto_897426 ?auto_897430 ) ) ( not ( = ?auto_897426 ?auto_897431 ) ) ( not ( = ?auto_897426 ?auto_897432 ) ) ( not ( = ?auto_897426 ?auto_897433 ) ) ( not ( = ?auto_897426 ?auto_897434 ) ) ( not ( = ?auto_897426 ?auto_897435 ) ) ( not ( = ?auto_897426 ?auto_897436 ) ) ( not ( = ?auto_897426 ?auto_897437 ) ) ( not ( = ?auto_897426 ?auto_897438 ) ) ( not ( = ?auto_897426 ?auto_897439 ) ) ( not ( = ?auto_897426 ?auto_897440 ) ) ( not ( = ?auto_897426 ?auto_897441 ) ) ( not ( = ?auto_897427 ?auto_897428 ) ) ( not ( = ?auto_897427 ?auto_897429 ) ) ( not ( = ?auto_897427 ?auto_897430 ) ) ( not ( = ?auto_897427 ?auto_897431 ) ) ( not ( = ?auto_897427 ?auto_897432 ) ) ( not ( = ?auto_897427 ?auto_897433 ) ) ( not ( = ?auto_897427 ?auto_897434 ) ) ( not ( = ?auto_897427 ?auto_897435 ) ) ( not ( = ?auto_897427 ?auto_897436 ) ) ( not ( = ?auto_897427 ?auto_897437 ) ) ( not ( = ?auto_897427 ?auto_897438 ) ) ( not ( = ?auto_897427 ?auto_897439 ) ) ( not ( = ?auto_897427 ?auto_897440 ) ) ( not ( = ?auto_897427 ?auto_897441 ) ) ( not ( = ?auto_897428 ?auto_897429 ) ) ( not ( = ?auto_897428 ?auto_897430 ) ) ( not ( = ?auto_897428 ?auto_897431 ) ) ( not ( = ?auto_897428 ?auto_897432 ) ) ( not ( = ?auto_897428 ?auto_897433 ) ) ( not ( = ?auto_897428 ?auto_897434 ) ) ( not ( = ?auto_897428 ?auto_897435 ) ) ( not ( = ?auto_897428 ?auto_897436 ) ) ( not ( = ?auto_897428 ?auto_897437 ) ) ( not ( = ?auto_897428 ?auto_897438 ) ) ( not ( = ?auto_897428 ?auto_897439 ) ) ( not ( = ?auto_897428 ?auto_897440 ) ) ( not ( = ?auto_897428 ?auto_897441 ) ) ( not ( = ?auto_897429 ?auto_897430 ) ) ( not ( = ?auto_897429 ?auto_897431 ) ) ( not ( = ?auto_897429 ?auto_897432 ) ) ( not ( = ?auto_897429 ?auto_897433 ) ) ( not ( = ?auto_897429 ?auto_897434 ) ) ( not ( = ?auto_897429 ?auto_897435 ) ) ( not ( = ?auto_897429 ?auto_897436 ) ) ( not ( = ?auto_897429 ?auto_897437 ) ) ( not ( = ?auto_897429 ?auto_897438 ) ) ( not ( = ?auto_897429 ?auto_897439 ) ) ( not ( = ?auto_897429 ?auto_897440 ) ) ( not ( = ?auto_897429 ?auto_897441 ) ) ( not ( = ?auto_897430 ?auto_897431 ) ) ( not ( = ?auto_897430 ?auto_897432 ) ) ( not ( = ?auto_897430 ?auto_897433 ) ) ( not ( = ?auto_897430 ?auto_897434 ) ) ( not ( = ?auto_897430 ?auto_897435 ) ) ( not ( = ?auto_897430 ?auto_897436 ) ) ( not ( = ?auto_897430 ?auto_897437 ) ) ( not ( = ?auto_897430 ?auto_897438 ) ) ( not ( = ?auto_897430 ?auto_897439 ) ) ( not ( = ?auto_897430 ?auto_897440 ) ) ( not ( = ?auto_897430 ?auto_897441 ) ) ( not ( = ?auto_897431 ?auto_897432 ) ) ( not ( = ?auto_897431 ?auto_897433 ) ) ( not ( = ?auto_897431 ?auto_897434 ) ) ( not ( = ?auto_897431 ?auto_897435 ) ) ( not ( = ?auto_897431 ?auto_897436 ) ) ( not ( = ?auto_897431 ?auto_897437 ) ) ( not ( = ?auto_897431 ?auto_897438 ) ) ( not ( = ?auto_897431 ?auto_897439 ) ) ( not ( = ?auto_897431 ?auto_897440 ) ) ( not ( = ?auto_897431 ?auto_897441 ) ) ( not ( = ?auto_897432 ?auto_897433 ) ) ( not ( = ?auto_897432 ?auto_897434 ) ) ( not ( = ?auto_897432 ?auto_897435 ) ) ( not ( = ?auto_897432 ?auto_897436 ) ) ( not ( = ?auto_897432 ?auto_897437 ) ) ( not ( = ?auto_897432 ?auto_897438 ) ) ( not ( = ?auto_897432 ?auto_897439 ) ) ( not ( = ?auto_897432 ?auto_897440 ) ) ( not ( = ?auto_897432 ?auto_897441 ) ) ( not ( = ?auto_897433 ?auto_897434 ) ) ( not ( = ?auto_897433 ?auto_897435 ) ) ( not ( = ?auto_897433 ?auto_897436 ) ) ( not ( = ?auto_897433 ?auto_897437 ) ) ( not ( = ?auto_897433 ?auto_897438 ) ) ( not ( = ?auto_897433 ?auto_897439 ) ) ( not ( = ?auto_897433 ?auto_897440 ) ) ( not ( = ?auto_897433 ?auto_897441 ) ) ( not ( = ?auto_897434 ?auto_897435 ) ) ( not ( = ?auto_897434 ?auto_897436 ) ) ( not ( = ?auto_897434 ?auto_897437 ) ) ( not ( = ?auto_897434 ?auto_897438 ) ) ( not ( = ?auto_897434 ?auto_897439 ) ) ( not ( = ?auto_897434 ?auto_897440 ) ) ( not ( = ?auto_897434 ?auto_897441 ) ) ( not ( = ?auto_897435 ?auto_897436 ) ) ( not ( = ?auto_897435 ?auto_897437 ) ) ( not ( = ?auto_897435 ?auto_897438 ) ) ( not ( = ?auto_897435 ?auto_897439 ) ) ( not ( = ?auto_897435 ?auto_897440 ) ) ( not ( = ?auto_897435 ?auto_897441 ) ) ( not ( = ?auto_897436 ?auto_897437 ) ) ( not ( = ?auto_897436 ?auto_897438 ) ) ( not ( = ?auto_897436 ?auto_897439 ) ) ( not ( = ?auto_897436 ?auto_897440 ) ) ( not ( = ?auto_897436 ?auto_897441 ) ) ( not ( = ?auto_897437 ?auto_897438 ) ) ( not ( = ?auto_897437 ?auto_897439 ) ) ( not ( = ?auto_897437 ?auto_897440 ) ) ( not ( = ?auto_897437 ?auto_897441 ) ) ( not ( = ?auto_897438 ?auto_897439 ) ) ( not ( = ?auto_897438 ?auto_897440 ) ) ( not ( = ?auto_897438 ?auto_897441 ) ) ( not ( = ?auto_897439 ?auto_897440 ) ) ( not ( = ?auto_897439 ?auto_897441 ) ) ( not ( = ?auto_897440 ?auto_897441 ) ) ( ON ?auto_897439 ?auto_897440 ) ( ON ?auto_897438 ?auto_897439 ) ( ON ?auto_897437 ?auto_897438 ) ( ON ?auto_897436 ?auto_897437 ) ( ON ?auto_897435 ?auto_897436 ) ( ON ?auto_897434 ?auto_897435 ) ( ON ?auto_897433 ?auto_897434 ) ( ON ?auto_897432 ?auto_897433 ) ( ON ?auto_897431 ?auto_897432 ) ( CLEAR ?auto_897429 ) ( ON ?auto_897430 ?auto_897431 ) ( CLEAR ?auto_897430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_897423 ?auto_897424 ?auto_897425 ?auto_897426 ?auto_897427 ?auto_897428 ?auto_897429 ?auto_897430 )
      ( MAKE-18PILE ?auto_897423 ?auto_897424 ?auto_897425 ?auto_897426 ?auto_897427 ?auto_897428 ?auto_897429 ?auto_897430 ?auto_897431 ?auto_897432 ?auto_897433 ?auto_897434 ?auto_897435 ?auto_897436 ?auto_897437 ?auto_897438 ?auto_897439 ?auto_897440 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897460 - BLOCK
      ?auto_897461 - BLOCK
      ?auto_897462 - BLOCK
      ?auto_897463 - BLOCK
      ?auto_897464 - BLOCK
      ?auto_897465 - BLOCK
      ?auto_897466 - BLOCK
      ?auto_897467 - BLOCK
      ?auto_897468 - BLOCK
      ?auto_897469 - BLOCK
      ?auto_897470 - BLOCK
      ?auto_897471 - BLOCK
      ?auto_897472 - BLOCK
      ?auto_897473 - BLOCK
      ?auto_897474 - BLOCK
      ?auto_897475 - BLOCK
      ?auto_897476 - BLOCK
      ?auto_897477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897477 ) ( ON-TABLE ?auto_897460 ) ( ON ?auto_897461 ?auto_897460 ) ( ON ?auto_897462 ?auto_897461 ) ( ON ?auto_897463 ?auto_897462 ) ( ON ?auto_897464 ?auto_897463 ) ( ON ?auto_897465 ?auto_897464 ) ( ON ?auto_897466 ?auto_897465 ) ( not ( = ?auto_897460 ?auto_897461 ) ) ( not ( = ?auto_897460 ?auto_897462 ) ) ( not ( = ?auto_897460 ?auto_897463 ) ) ( not ( = ?auto_897460 ?auto_897464 ) ) ( not ( = ?auto_897460 ?auto_897465 ) ) ( not ( = ?auto_897460 ?auto_897466 ) ) ( not ( = ?auto_897460 ?auto_897467 ) ) ( not ( = ?auto_897460 ?auto_897468 ) ) ( not ( = ?auto_897460 ?auto_897469 ) ) ( not ( = ?auto_897460 ?auto_897470 ) ) ( not ( = ?auto_897460 ?auto_897471 ) ) ( not ( = ?auto_897460 ?auto_897472 ) ) ( not ( = ?auto_897460 ?auto_897473 ) ) ( not ( = ?auto_897460 ?auto_897474 ) ) ( not ( = ?auto_897460 ?auto_897475 ) ) ( not ( = ?auto_897460 ?auto_897476 ) ) ( not ( = ?auto_897460 ?auto_897477 ) ) ( not ( = ?auto_897461 ?auto_897462 ) ) ( not ( = ?auto_897461 ?auto_897463 ) ) ( not ( = ?auto_897461 ?auto_897464 ) ) ( not ( = ?auto_897461 ?auto_897465 ) ) ( not ( = ?auto_897461 ?auto_897466 ) ) ( not ( = ?auto_897461 ?auto_897467 ) ) ( not ( = ?auto_897461 ?auto_897468 ) ) ( not ( = ?auto_897461 ?auto_897469 ) ) ( not ( = ?auto_897461 ?auto_897470 ) ) ( not ( = ?auto_897461 ?auto_897471 ) ) ( not ( = ?auto_897461 ?auto_897472 ) ) ( not ( = ?auto_897461 ?auto_897473 ) ) ( not ( = ?auto_897461 ?auto_897474 ) ) ( not ( = ?auto_897461 ?auto_897475 ) ) ( not ( = ?auto_897461 ?auto_897476 ) ) ( not ( = ?auto_897461 ?auto_897477 ) ) ( not ( = ?auto_897462 ?auto_897463 ) ) ( not ( = ?auto_897462 ?auto_897464 ) ) ( not ( = ?auto_897462 ?auto_897465 ) ) ( not ( = ?auto_897462 ?auto_897466 ) ) ( not ( = ?auto_897462 ?auto_897467 ) ) ( not ( = ?auto_897462 ?auto_897468 ) ) ( not ( = ?auto_897462 ?auto_897469 ) ) ( not ( = ?auto_897462 ?auto_897470 ) ) ( not ( = ?auto_897462 ?auto_897471 ) ) ( not ( = ?auto_897462 ?auto_897472 ) ) ( not ( = ?auto_897462 ?auto_897473 ) ) ( not ( = ?auto_897462 ?auto_897474 ) ) ( not ( = ?auto_897462 ?auto_897475 ) ) ( not ( = ?auto_897462 ?auto_897476 ) ) ( not ( = ?auto_897462 ?auto_897477 ) ) ( not ( = ?auto_897463 ?auto_897464 ) ) ( not ( = ?auto_897463 ?auto_897465 ) ) ( not ( = ?auto_897463 ?auto_897466 ) ) ( not ( = ?auto_897463 ?auto_897467 ) ) ( not ( = ?auto_897463 ?auto_897468 ) ) ( not ( = ?auto_897463 ?auto_897469 ) ) ( not ( = ?auto_897463 ?auto_897470 ) ) ( not ( = ?auto_897463 ?auto_897471 ) ) ( not ( = ?auto_897463 ?auto_897472 ) ) ( not ( = ?auto_897463 ?auto_897473 ) ) ( not ( = ?auto_897463 ?auto_897474 ) ) ( not ( = ?auto_897463 ?auto_897475 ) ) ( not ( = ?auto_897463 ?auto_897476 ) ) ( not ( = ?auto_897463 ?auto_897477 ) ) ( not ( = ?auto_897464 ?auto_897465 ) ) ( not ( = ?auto_897464 ?auto_897466 ) ) ( not ( = ?auto_897464 ?auto_897467 ) ) ( not ( = ?auto_897464 ?auto_897468 ) ) ( not ( = ?auto_897464 ?auto_897469 ) ) ( not ( = ?auto_897464 ?auto_897470 ) ) ( not ( = ?auto_897464 ?auto_897471 ) ) ( not ( = ?auto_897464 ?auto_897472 ) ) ( not ( = ?auto_897464 ?auto_897473 ) ) ( not ( = ?auto_897464 ?auto_897474 ) ) ( not ( = ?auto_897464 ?auto_897475 ) ) ( not ( = ?auto_897464 ?auto_897476 ) ) ( not ( = ?auto_897464 ?auto_897477 ) ) ( not ( = ?auto_897465 ?auto_897466 ) ) ( not ( = ?auto_897465 ?auto_897467 ) ) ( not ( = ?auto_897465 ?auto_897468 ) ) ( not ( = ?auto_897465 ?auto_897469 ) ) ( not ( = ?auto_897465 ?auto_897470 ) ) ( not ( = ?auto_897465 ?auto_897471 ) ) ( not ( = ?auto_897465 ?auto_897472 ) ) ( not ( = ?auto_897465 ?auto_897473 ) ) ( not ( = ?auto_897465 ?auto_897474 ) ) ( not ( = ?auto_897465 ?auto_897475 ) ) ( not ( = ?auto_897465 ?auto_897476 ) ) ( not ( = ?auto_897465 ?auto_897477 ) ) ( not ( = ?auto_897466 ?auto_897467 ) ) ( not ( = ?auto_897466 ?auto_897468 ) ) ( not ( = ?auto_897466 ?auto_897469 ) ) ( not ( = ?auto_897466 ?auto_897470 ) ) ( not ( = ?auto_897466 ?auto_897471 ) ) ( not ( = ?auto_897466 ?auto_897472 ) ) ( not ( = ?auto_897466 ?auto_897473 ) ) ( not ( = ?auto_897466 ?auto_897474 ) ) ( not ( = ?auto_897466 ?auto_897475 ) ) ( not ( = ?auto_897466 ?auto_897476 ) ) ( not ( = ?auto_897466 ?auto_897477 ) ) ( not ( = ?auto_897467 ?auto_897468 ) ) ( not ( = ?auto_897467 ?auto_897469 ) ) ( not ( = ?auto_897467 ?auto_897470 ) ) ( not ( = ?auto_897467 ?auto_897471 ) ) ( not ( = ?auto_897467 ?auto_897472 ) ) ( not ( = ?auto_897467 ?auto_897473 ) ) ( not ( = ?auto_897467 ?auto_897474 ) ) ( not ( = ?auto_897467 ?auto_897475 ) ) ( not ( = ?auto_897467 ?auto_897476 ) ) ( not ( = ?auto_897467 ?auto_897477 ) ) ( not ( = ?auto_897468 ?auto_897469 ) ) ( not ( = ?auto_897468 ?auto_897470 ) ) ( not ( = ?auto_897468 ?auto_897471 ) ) ( not ( = ?auto_897468 ?auto_897472 ) ) ( not ( = ?auto_897468 ?auto_897473 ) ) ( not ( = ?auto_897468 ?auto_897474 ) ) ( not ( = ?auto_897468 ?auto_897475 ) ) ( not ( = ?auto_897468 ?auto_897476 ) ) ( not ( = ?auto_897468 ?auto_897477 ) ) ( not ( = ?auto_897469 ?auto_897470 ) ) ( not ( = ?auto_897469 ?auto_897471 ) ) ( not ( = ?auto_897469 ?auto_897472 ) ) ( not ( = ?auto_897469 ?auto_897473 ) ) ( not ( = ?auto_897469 ?auto_897474 ) ) ( not ( = ?auto_897469 ?auto_897475 ) ) ( not ( = ?auto_897469 ?auto_897476 ) ) ( not ( = ?auto_897469 ?auto_897477 ) ) ( not ( = ?auto_897470 ?auto_897471 ) ) ( not ( = ?auto_897470 ?auto_897472 ) ) ( not ( = ?auto_897470 ?auto_897473 ) ) ( not ( = ?auto_897470 ?auto_897474 ) ) ( not ( = ?auto_897470 ?auto_897475 ) ) ( not ( = ?auto_897470 ?auto_897476 ) ) ( not ( = ?auto_897470 ?auto_897477 ) ) ( not ( = ?auto_897471 ?auto_897472 ) ) ( not ( = ?auto_897471 ?auto_897473 ) ) ( not ( = ?auto_897471 ?auto_897474 ) ) ( not ( = ?auto_897471 ?auto_897475 ) ) ( not ( = ?auto_897471 ?auto_897476 ) ) ( not ( = ?auto_897471 ?auto_897477 ) ) ( not ( = ?auto_897472 ?auto_897473 ) ) ( not ( = ?auto_897472 ?auto_897474 ) ) ( not ( = ?auto_897472 ?auto_897475 ) ) ( not ( = ?auto_897472 ?auto_897476 ) ) ( not ( = ?auto_897472 ?auto_897477 ) ) ( not ( = ?auto_897473 ?auto_897474 ) ) ( not ( = ?auto_897473 ?auto_897475 ) ) ( not ( = ?auto_897473 ?auto_897476 ) ) ( not ( = ?auto_897473 ?auto_897477 ) ) ( not ( = ?auto_897474 ?auto_897475 ) ) ( not ( = ?auto_897474 ?auto_897476 ) ) ( not ( = ?auto_897474 ?auto_897477 ) ) ( not ( = ?auto_897475 ?auto_897476 ) ) ( not ( = ?auto_897475 ?auto_897477 ) ) ( not ( = ?auto_897476 ?auto_897477 ) ) ( ON ?auto_897476 ?auto_897477 ) ( ON ?auto_897475 ?auto_897476 ) ( ON ?auto_897474 ?auto_897475 ) ( ON ?auto_897473 ?auto_897474 ) ( ON ?auto_897472 ?auto_897473 ) ( ON ?auto_897471 ?auto_897472 ) ( ON ?auto_897470 ?auto_897471 ) ( ON ?auto_897469 ?auto_897470 ) ( ON ?auto_897468 ?auto_897469 ) ( CLEAR ?auto_897466 ) ( ON ?auto_897467 ?auto_897468 ) ( CLEAR ?auto_897467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_897460 ?auto_897461 ?auto_897462 ?auto_897463 ?auto_897464 ?auto_897465 ?auto_897466 ?auto_897467 )
      ( MAKE-18PILE ?auto_897460 ?auto_897461 ?auto_897462 ?auto_897463 ?auto_897464 ?auto_897465 ?auto_897466 ?auto_897467 ?auto_897468 ?auto_897469 ?auto_897470 ?auto_897471 ?auto_897472 ?auto_897473 ?auto_897474 ?auto_897475 ?auto_897476 ?auto_897477 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897496 - BLOCK
      ?auto_897497 - BLOCK
      ?auto_897498 - BLOCK
      ?auto_897499 - BLOCK
      ?auto_897500 - BLOCK
      ?auto_897501 - BLOCK
      ?auto_897502 - BLOCK
      ?auto_897503 - BLOCK
      ?auto_897504 - BLOCK
      ?auto_897505 - BLOCK
      ?auto_897506 - BLOCK
      ?auto_897507 - BLOCK
      ?auto_897508 - BLOCK
      ?auto_897509 - BLOCK
      ?auto_897510 - BLOCK
      ?auto_897511 - BLOCK
      ?auto_897512 - BLOCK
      ?auto_897513 - BLOCK
    )
    :vars
    (
      ?auto_897514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897513 ?auto_897514 ) ( ON-TABLE ?auto_897496 ) ( ON ?auto_897497 ?auto_897496 ) ( ON ?auto_897498 ?auto_897497 ) ( ON ?auto_897499 ?auto_897498 ) ( ON ?auto_897500 ?auto_897499 ) ( ON ?auto_897501 ?auto_897500 ) ( not ( = ?auto_897496 ?auto_897497 ) ) ( not ( = ?auto_897496 ?auto_897498 ) ) ( not ( = ?auto_897496 ?auto_897499 ) ) ( not ( = ?auto_897496 ?auto_897500 ) ) ( not ( = ?auto_897496 ?auto_897501 ) ) ( not ( = ?auto_897496 ?auto_897502 ) ) ( not ( = ?auto_897496 ?auto_897503 ) ) ( not ( = ?auto_897496 ?auto_897504 ) ) ( not ( = ?auto_897496 ?auto_897505 ) ) ( not ( = ?auto_897496 ?auto_897506 ) ) ( not ( = ?auto_897496 ?auto_897507 ) ) ( not ( = ?auto_897496 ?auto_897508 ) ) ( not ( = ?auto_897496 ?auto_897509 ) ) ( not ( = ?auto_897496 ?auto_897510 ) ) ( not ( = ?auto_897496 ?auto_897511 ) ) ( not ( = ?auto_897496 ?auto_897512 ) ) ( not ( = ?auto_897496 ?auto_897513 ) ) ( not ( = ?auto_897496 ?auto_897514 ) ) ( not ( = ?auto_897497 ?auto_897498 ) ) ( not ( = ?auto_897497 ?auto_897499 ) ) ( not ( = ?auto_897497 ?auto_897500 ) ) ( not ( = ?auto_897497 ?auto_897501 ) ) ( not ( = ?auto_897497 ?auto_897502 ) ) ( not ( = ?auto_897497 ?auto_897503 ) ) ( not ( = ?auto_897497 ?auto_897504 ) ) ( not ( = ?auto_897497 ?auto_897505 ) ) ( not ( = ?auto_897497 ?auto_897506 ) ) ( not ( = ?auto_897497 ?auto_897507 ) ) ( not ( = ?auto_897497 ?auto_897508 ) ) ( not ( = ?auto_897497 ?auto_897509 ) ) ( not ( = ?auto_897497 ?auto_897510 ) ) ( not ( = ?auto_897497 ?auto_897511 ) ) ( not ( = ?auto_897497 ?auto_897512 ) ) ( not ( = ?auto_897497 ?auto_897513 ) ) ( not ( = ?auto_897497 ?auto_897514 ) ) ( not ( = ?auto_897498 ?auto_897499 ) ) ( not ( = ?auto_897498 ?auto_897500 ) ) ( not ( = ?auto_897498 ?auto_897501 ) ) ( not ( = ?auto_897498 ?auto_897502 ) ) ( not ( = ?auto_897498 ?auto_897503 ) ) ( not ( = ?auto_897498 ?auto_897504 ) ) ( not ( = ?auto_897498 ?auto_897505 ) ) ( not ( = ?auto_897498 ?auto_897506 ) ) ( not ( = ?auto_897498 ?auto_897507 ) ) ( not ( = ?auto_897498 ?auto_897508 ) ) ( not ( = ?auto_897498 ?auto_897509 ) ) ( not ( = ?auto_897498 ?auto_897510 ) ) ( not ( = ?auto_897498 ?auto_897511 ) ) ( not ( = ?auto_897498 ?auto_897512 ) ) ( not ( = ?auto_897498 ?auto_897513 ) ) ( not ( = ?auto_897498 ?auto_897514 ) ) ( not ( = ?auto_897499 ?auto_897500 ) ) ( not ( = ?auto_897499 ?auto_897501 ) ) ( not ( = ?auto_897499 ?auto_897502 ) ) ( not ( = ?auto_897499 ?auto_897503 ) ) ( not ( = ?auto_897499 ?auto_897504 ) ) ( not ( = ?auto_897499 ?auto_897505 ) ) ( not ( = ?auto_897499 ?auto_897506 ) ) ( not ( = ?auto_897499 ?auto_897507 ) ) ( not ( = ?auto_897499 ?auto_897508 ) ) ( not ( = ?auto_897499 ?auto_897509 ) ) ( not ( = ?auto_897499 ?auto_897510 ) ) ( not ( = ?auto_897499 ?auto_897511 ) ) ( not ( = ?auto_897499 ?auto_897512 ) ) ( not ( = ?auto_897499 ?auto_897513 ) ) ( not ( = ?auto_897499 ?auto_897514 ) ) ( not ( = ?auto_897500 ?auto_897501 ) ) ( not ( = ?auto_897500 ?auto_897502 ) ) ( not ( = ?auto_897500 ?auto_897503 ) ) ( not ( = ?auto_897500 ?auto_897504 ) ) ( not ( = ?auto_897500 ?auto_897505 ) ) ( not ( = ?auto_897500 ?auto_897506 ) ) ( not ( = ?auto_897500 ?auto_897507 ) ) ( not ( = ?auto_897500 ?auto_897508 ) ) ( not ( = ?auto_897500 ?auto_897509 ) ) ( not ( = ?auto_897500 ?auto_897510 ) ) ( not ( = ?auto_897500 ?auto_897511 ) ) ( not ( = ?auto_897500 ?auto_897512 ) ) ( not ( = ?auto_897500 ?auto_897513 ) ) ( not ( = ?auto_897500 ?auto_897514 ) ) ( not ( = ?auto_897501 ?auto_897502 ) ) ( not ( = ?auto_897501 ?auto_897503 ) ) ( not ( = ?auto_897501 ?auto_897504 ) ) ( not ( = ?auto_897501 ?auto_897505 ) ) ( not ( = ?auto_897501 ?auto_897506 ) ) ( not ( = ?auto_897501 ?auto_897507 ) ) ( not ( = ?auto_897501 ?auto_897508 ) ) ( not ( = ?auto_897501 ?auto_897509 ) ) ( not ( = ?auto_897501 ?auto_897510 ) ) ( not ( = ?auto_897501 ?auto_897511 ) ) ( not ( = ?auto_897501 ?auto_897512 ) ) ( not ( = ?auto_897501 ?auto_897513 ) ) ( not ( = ?auto_897501 ?auto_897514 ) ) ( not ( = ?auto_897502 ?auto_897503 ) ) ( not ( = ?auto_897502 ?auto_897504 ) ) ( not ( = ?auto_897502 ?auto_897505 ) ) ( not ( = ?auto_897502 ?auto_897506 ) ) ( not ( = ?auto_897502 ?auto_897507 ) ) ( not ( = ?auto_897502 ?auto_897508 ) ) ( not ( = ?auto_897502 ?auto_897509 ) ) ( not ( = ?auto_897502 ?auto_897510 ) ) ( not ( = ?auto_897502 ?auto_897511 ) ) ( not ( = ?auto_897502 ?auto_897512 ) ) ( not ( = ?auto_897502 ?auto_897513 ) ) ( not ( = ?auto_897502 ?auto_897514 ) ) ( not ( = ?auto_897503 ?auto_897504 ) ) ( not ( = ?auto_897503 ?auto_897505 ) ) ( not ( = ?auto_897503 ?auto_897506 ) ) ( not ( = ?auto_897503 ?auto_897507 ) ) ( not ( = ?auto_897503 ?auto_897508 ) ) ( not ( = ?auto_897503 ?auto_897509 ) ) ( not ( = ?auto_897503 ?auto_897510 ) ) ( not ( = ?auto_897503 ?auto_897511 ) ) ( not ( = ?auto_897503 ?auto_897512 ) ) ( not ( = ?auto_897503 ?auto_897513 ) ) ( not ( = ?auto_897503 ?auto_897514 ) ) ( not ( = ?auto_897504 ?auto_897505 ) ) ( not ( = ?auto_897504 ?auto_897506 ) ) ( not ( = ?auto_897504 ?auto_897507 ) ) ( not ( = ?auto_897504 ?auto_897508 ) ) ( not ( = ?auto_897504 ?auto_897509 ) ) ( not ( = ?auto_897504 ?auto_897510 ) ) ( not ( = ?auto_897504 ?auto_897511 ) ) ( not ( = ?auto_897504 ?auto_897512 ) ) ( not ( = ?auto_897504 ?auto_897513 ) ) ( not ( = ?auto_897504 ?auto_897514 ) ) ( not ( = ?auto_897505 ?auto_897506 ) ) ( not ( = ?auto_897505 ?auto_897507 ) ) ( not ( = ?auto_897505 ?auto_897508 ) ) ( not ( = ?auto_897505 ?auto_897509 ) ) ( not ( = ?auto_897505 ?auto_897510 ) ) ( not ( = ?auto_897505 ?auto_897511 ) ) ( not ( = ?auto_897505 ?auto_897512 ) ) ( not ( = ?auto_897505 ?auto_897513 ) ) ( not ( = ?auto_897505 ?auto_897514 ) ) ( not ( = ?auto_897506 ?auto_897507 ) ) ( not ( = ?auto_897506 ?auto_897508 ) ) ( not ( = ?auto_897506 ?auto_897509 ) ) ( not ( = ?auto_897506 ?auto_897510 ) ) ( not ( = ?auto_897506 ?auto_897511 ) ) ( not ( = ?auto_897506 ?auto_897512 ) ) ( not ( = ?auto_897506 ?auto_897513 ) ) ( not ( = ?auto_897506 ?auto_897514 ) ) ( not ( = ?auto_897507 ?auto_897508 ) ) ( not ( = ?auto_897507 ?auto_897509 ) ) ( not ( = ?auto_897507 ?auto_897510 ) ) ( not ( = ?auto_897507 ?auto_897511 ) ) ( not ( = ?auto_897507 ?auto_897512 ) ) ( not ( = ?auto_897507 ?auto_897513 ) ) ( not ( = ?auto_897507 ?auto_897514 ) ) ( not ( = ?auto_897508 ?auto_897509 ) ) ( not ( = ?auto_897508 ?auto_897510 ) ) ( not ( = ?auto_897508 ?auto_897511 ) ) ( not ( = ?auto_897508 ?auto_897512 ) ) ( not ( = ?auto_897508 ?auto_897513 ) ) ( not ( = ?auto_897508 ?auto_897514 ) ) ( not ( = ?auto_897509 ?auto_897510 ) ) ( not ( = ?auto_897509 ?auto_897511 ) ) ( not ( = ?auto_897509 ?auto_897512 ) ) ( not ( = ?auto_897509 ?auto_897513 ) ) ( not ( = ?auto_897509 ?auto_897514 ) ) ( not ( = ?auto_897510 ?auto_897511 ) ) ( not ( = ?auto_897510 ?auto_897512 ) ) ( not ( = ?auto_897510 ?auto_897513 ) ) ( not ( = ?auto_897510 ?auto_897514 ) ) ( not ( = ?auto_897511 ?auto_897512 ) ) ( not ( = ?auto_897511 ?auto_897513 ) ) ( not ( = ?auto_897511 ?auto_897514 ) ) ( not ( = ?auto_897512 ?auto_897513 ) ) ( not ( = ?auto_897512 ?auto_897514 ) ) ( not ( = ?auto_897513 ?auto_897514 ) ) ( ON ?auto_897512 ?auto_897513 ) ( ON ?auto_897511 ?auto_897512 ) ( ON ?auto_897510 ?auto_897511 ) ( ON ?auto_897509 ?auto_897510 ) ( ON ?auto_897508 ?auto_897509 ) ( ON ?auto_897507 ?auto_897508 ) ( ON ?auto_897506 ?auto_897507 ) ( ON ?auto_897505 ?auto_897506 ) ( ON ?auto_897504 ?auto_897505 ) ( ON ?auto_897503 ?auto_897504 ) ( CLEAR ?auto_897501 ) ( ON ?auto_897502 ?auto_897503 ) ( CLEAR ?auto_897502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_897496 ?auto_897497 ?auto_897498 ?auto_897499 ?auto_897500 ?auto_897501 ?auto_897502 )
      ( MAKE-18PILE ?auto_897496 ?auto_897497 ?auto_897498 ?auto_897499 ?auto_897500 ?auto_897501 ?auto_897502 ?auto_897503 ?auto_897504 ?auto_897505 ?auto_897506 ?auto_897507 ?auto_897508 ?auto_897509 ?auto_897510 ?auto_897511 ?auto_897512 ?auto_897513 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897533 - BLOCK
      ?auto_897534 - BLOCK
      ?auto_897535 - BLOCK
      ?auto_897536 - BLOCK
      ?auto_897537 - BLOCK
      ?auto_897538 - BLOCK
      ?auto_897539 - BLOCK
      ?auto_897540 - BLOCK
      ?auto_897541 - BLOCK
      ?auto_897542 - BLOCK
      ?auto_897543 - BLOCK
      ?auto_897544 - BLOCK
      ?auto_897545 - BLOCK
      ?auto_897546 - BLOCK
      ?auto_897547 - BLOCK
      ?auto_897548 - BLOCK
      ?auto_897549 - BLOCK
      ?auto_897550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897550 ) ( ON-TABLE ?auto_897533 ) ( ON ?auto_897534 ?auto_897533 ) ( ON ?auto_897535 ?auto_897534 ) ( ON ?auto_897536 ?auto_897535 ) ( ON ?auto_897537 ?auto_897536 ) ( ON ?auto_897538 ?auto_897537 ) ( not ( = ?auto_897533 ?auto_897534 ) ) ( not ( = ?auto_897533 ?auto_897535 ) ) ( not ( = ?auto_897533 ?auto_897536 ) ) ( not ( = ?auto_897533 ?auto_897537 ) ) ( not ( = ?auto_897533 ?auto_897538 ) ) ( not ( = ?auto_897533 ?auto_897539 ) ) ( not ( = ?auto_897533 ?auto_897540 ) ) ( not ( = ?auto_897533 ?auto_897541 ) ) ( not ( = ?auto_897533 ?auto_897542 ) ) ( not ( = ?auto_897533 ?auto_897543 ) ) ( not ( = ?auto_897533 ?auto_897544 ) ) ( not ( = ?auto_897533 ?auto_897545 ) ) ( not ( = ?auto_897533 ?auto_897546 ) ) ( not ( = ?auto_897533 ?auto_897547 ) ) ( not ( = ?auto_897533 ?auto_897548 ) ) ( not ( = ?auto_897533 ?auto_897549 ) ) ( not ( = ?auto_897533 ?auto_897550 ) ) ( not ( = ?auto_897534 ?auto_897535 ) ) ( not ( = ?auto_897534 ?auto_897536 ) ) ( not ( = ?auto_897534 ?auto_897537 ) ) ( not ( = ?auto_897534 ?auto_897538 ) ) ( not ( = ?auto_897534 ?auto_897539 ) ) ( not ( = ?auto_897534 ?auto_897540 ) ) ( not ( = ?auto_897534 ?auto_897541 ) ) ( not ( = ?auto_897534 ?auto_897542 ) ) ( not ( = ?auto_897534 ?auto_897543 ) ) ( not ( = ?auto_897534 ?auto_897544 ) ) ( not ( = ?auto_897534 ?auto_897545 ) ) ( not ( = ?auto_897534 ?auto_897546 ) ) ( not ( = ?auto_897534 ?auto_897547 ) ) ( not ( = ?auto_897534 ?auto_897548 ) ) ( not ( = ?auto_897534 ?auto_897549 ) ) ( not ( = ?auto_897534 ?auto_897550 ) ) ( not ( = ?auto_897535 ?auto_897536 ) ) ( not ( = ?auto_897535 ?auto_897537 ) ) ( not ( = ?auto_897535 ?auto_897538 ) ) ( not ( = ?auto_897535 ?auto_897539 ) ) ( not ( = ?auto_897535 ?auto_897540 ) ) ( not ( = ?auto_897535 ?auto_897541 ) ) ( not ( = ?auto_897535 ?auto_897542 ) ) ( not ( = ?auto_897535 ?auto_897543 ) ) ( not ( = ?auto_897535 ?auto_897544 ) ) ( not ( = ?auto_897535 ?auto_897545 ) ) ( not ( = ?auto_897535 ?auto_897546 ) ) ( not ( = ?auto_897535 ?auto_897547 ) ) ( not ( = ?auto_897535 ?auto_897548 ) ) ( not ( = ?auto_897535 ?auto_897549 ) ) ( not ( = ?auto_897535 ?auto_897550 ) ) ( not ( = ?auto_897536 ?auto_897537 ) ) ( not ( = ?auto_897536 ?auto_897538 ) ) ( not ( = ?auto_897536 ?auto_897539 ) ) ( not ( = ?auto_897536 ?auto_897540 ) ) ( not ( = ?auto_897536 ?auto_897541 ) ) ( not ( = ?auto_897536 ?auto_897542 ) ) ( not ( = ?auto_897536 ?auto_897543 ) ) ( not ( = ?auto_897536 ?auto_897544 ) ) ( not ( = ?auto_897536 ?auto_897545 ) ) ( not ( = ?auto_897536 ?auto_897546 ) ) ( not ( = ?auto_897536 ?auto_897547 ) ) ( not ( = ?auto_897536 ?auto_897548 ) ) ( not ( = ?auto_897536 ?auto_897549 ) ) ( not ( = ?auto_897536 ?auto_897550 ) ) ( not ( = ?auto_897537 ?auto_897538 ) ) ( not ( = ?auto_897537 ?auto_897539 ) ) ( not ( = ?auto_897537 ?auto_897540 ) ) ( not ( = ?auto_897537 ?auto_897541 ) ) ( not ( = ?auto_897537 ?auto_897542 ) ) ( not ( = ?auto_897537 ?auto_897543 ) ) ( not ( = ?auto_897537 ?auto_897544 ) ) ( not ( = ?auto_897537 ?auto_897545 ) ) ( not ( = ?auto_897537 ?auto_897546 ) ) ( not ( = ?auto_897537 ?auto_897547 ) ) ( not ( = ?auto_897537 ?auto_897548 ) ) ( not ( = ?auto_897537 ?auto_897549 ) ) ( not ( = ?auto_897537 ?auto_897550 ) ) ( not ( = ?auto_897538 ?auto_897539 ) ) ( not ( = ?auto_897538 ?auto_897540 ) ) ( not ( = ?auto_897538 ?auto_897541 ) ) ( not ( = ?auto_897538 ?auto_897542 ) ) ( not ( = ?auto_897538 ?auto_897543 ) ) ( not ( = ?auto_897538 ?auto_897544 ) ) ( not ( = ?auto_897538 ?auto_897545 ) ) ( not ( = ?auto_897538 ?auto_897546 ) ) ( not ( = ?auto_897538 ?auto_897547 ) ) ( not ( = ?auto_897538 ?auto_897548 ) ) ( not ( = ?auto_897538 ?auto_897549 ) ) ( not ( = ?auto_897538 ?auto_897550 ) ) ( not ( = ?auto_897539 ?auto_897540 ) ) ( not ( = ?auto_897539 ?auto_897541 ) ) ( not ( = ?auto_897539 ?auto_897542 ) ) ( not ( = ?auto_897539 ?auto_897543 ) ) ( not ( = ?auto_897539 ?auto_897544 ) ) ( not ( = ?auto_897539 ?auto_897545 ) ) ( not ( = ?auto_897539 ?auto_897546 ) ) ( not ( = ?auto_897539 ?auto_897547 ) ) ( not ( = ?auto_897539 ?auto_897548 ) ) ( not ( = ?auto_897539 ?auto_897549 ) ) ( not ( = ?auto_897539 ?auto_897550 ) ) ( not ( = ?auto_897540 ?auto_897541 ) ) ( not ( = ?auto_897540 ?auto_897542 ) ) ( not ( = ?auto_897540 ?auto_897543 ) ) ( not ( = ?auto_897540 ?auto_897544 ) ) ( not ( = ?auto_897540 ?auto_897545 ) ) ( not ( = ?auto_897540 ?auto_897546 ) ) ( not ( = ?auto_897540 ?auto_897547 ) ) ( not ( = ?auto_897540 ?auto_897548 ) ) ( not ( = ?auto_897540 ?auto_897549 ) ) ( not ( = ?auto_897540 ?auto_897550 ) ) ( not ( = ?auto_897541 ?auto_897542 ) ) ( not ( = ?auto_897541 ?auto_897543 ) ) ( not ( = ?auto_897541 ?auto_897544 ) ) ( not ( = ?auto_897541 ?auto_897545 ) ) ( not ( = ?auto_897541 ?auto_897546 ) ) ( not ( = ?auto_897541 ?auto_897547 ) ) ( not ( = ?auto_897541 ?auto_897548 ) ) ( not ( = ?auto_897541 ?auto_897549 ) ) ( not ( = ?auto_897541 ?auto_897550 ) ) ( not ( = ?auto_897542 ?auto_897543 ) ) ( not ( = ?auto_897542 ?auto_897544 ) ) ( not ( = ?auto_897542 ?auto_897545 ) ) ( not ( = ?auto_897542 ?auto_897546 ) ) ( not ( = ?auto_897542 ?auto_897547 ) ) ( not ( = ?auto_897542 ?auto_897548 ) ) ( not ( = ?auto_897542 ?auto_897549 ) ) ( not ( = ?auto_897542 ?auto_897550 ) ) ( not ( = ?auto_897543 ?auto_897544 ) ) ( not ( = ?auto_897543 ?auto_897545 ) ) ( not ( = ?auto_897543 ?auto_897546 ) ) ( not ( = ?auto_897543 ?auto_897547 ) ) ( not ( = ?auto_897543 ?auto_897548 ) ) ( not ( = ?auto_897543 ?auto_897549 ) ) ( not ( = ?auto_897543 ?auto_897550 ) ) ( not ( = ?auto_897544 ?auto_897545 ) ) ( not ( = ?auto_897544 ?auto_897546 ) ) ( not ( = ?auto_897544 ?auto_897547 ) ) ( not ( = ?auto_897544 ?auto_897548 ) ) ( not ( = ?auto_897544 ?auto_897549 ) ) ( not ( = ?auto_897544 ?auto_897550 ) ) ( not ( = ?auto_897545 ?auto_897546 ) ) ( not ( = ?auto_897545 ?auto_897547 ) ) ( not ( = ?auto_897545 ?auto_897548 ) ) ( not ( = ?auto_897545 ?auto_897549 ) ) ( not ( = ?auto_897545 ?auto_897550 ) ) ( not ( = ?auto_897546 ?auto_897547 ) ) ( not ( = ?auto_897546 ?auto_897548 ) ) ( not ( = ?auto_897546 ?auto_897549 ) ) ( not ( = ?auto_897546 ?auto_897550 ) ) ( not ( = ?auto_897547 ?auto_897548 ) ) ( not ( = ?auto_897547 ?auto_897549 ) ) ( not ( = ?auto_897547 ?auto_897550 ) ) ( not ( = ?auto_897548 ?auto_897549 ) ) ( not ( = ?auto_897548 ?auto_897550 ) ) ( not ( = ?auto_897549 ?auto_897550 ) ) ( ON ?auto_897549 ?auto_897550 ) ( ON ?auto_897548 ?auto_897549 ) ( ON ?auto_897547 ?auto_897548 ) ( ON ?auto_897546 ?auto_897547 ) ( ON ?auto_897545 ?auto_897546 ) ( ON ?auto_897544 ?auto_897545 ) ( ON ?auto_897543 ?auto_897544 ) ( ON ?auto_897542 ?auto_897543 ) ( ON ?auto_897541 ?auto_897542 ) ( ON ?auto_897540 ?auto_897541 ) ( CLEAR ?auto_897538 ) ( ON ?auto_897539 ?auto_897540 ) ( CLEAR ?auto_897539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_897533 ?auto_897534 ?auto_897535 ?auto_897536 ?auto_897537 ?auto_897538 ?auto_897539 )
      ( MAKE-18PILE ?auto_897533 ?auto_897534 ?auto_897535 ?auto_897536 ?auto_897537 ?auto_897538 ?auto_897539 ?auto_897540 ?auto_897541 ?auto_897542 ?auto_897543 ?auto_897544 ?auto_897545 ?auto_897546 ?auto_897547 ?auto_897548 ?auto_897549 ?auto_897550 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897569 - BLOCK
      ?auto_897570 - BLOCK
      ?auto_897571 - BLOCK
      ?auto_897572 - BLOCK
      ?auto_897573 - BLOCK
      ?auto_897574 - BLOCK
      ?auto_897575 - BLOCK
      ?auto_897576 - BLOCK
      ?auto_897577 - BLOCK
      ?auto_897578 - BLOCK
      ?auto_897579 - BLOCK
      ?auto_897580 - BLOCK
      ?auto_897581 - BLOCK
      ?auto_897582 - BLOCK
      ?auto_897583 - BLOCK
      ?auto_897584 - BLOCK
      ?auto_897585 - BLOCK
      ?auto_897586 - BLOCK
    )
    :vars
    (
      ?auto_897587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897586 ?auto_897587 ) ( ON-TABLE ?auto_897569 ) ( ON ?auto_897570 ?auto_897569 ) ( ON ?auto_897571 ?auto_897570 ) ( ON ?auto_897572 ?auto_897571 ) ( ON ?auto_897573 ?auto_897572 ) ( not ( = ?auto_897569 ?auto_897570 ) ) ( not ( = ?auto_897569 ?auto_897571 ) ) ( not ( = ?auto_897569 ?auto_897572 ) ) ( not ( = ?auto_897569 ?auto_897573 ) ) ( not ( = ?auto_897569 ?auto_897574 ) ) ( not ( = ?auto_897569 ?auto_897575 ) ) ( not ( = ?auto_897569 ?auto_897576 ) ) ( not ( = ?auto_897569 ?auto_897577 ) ) ( not ( = ?auto_897569 ?auto_897578 ) ) ( not ( = ?auto_897569 ?auto_897579 ) ) ( not ( = ?auto_897569 ?auto_897580 ) ) ( not ( = ?auto_897569 ?auto_897581 ) ) ( not ( = ?auto_897569 ?auto_897582 ) ) ( not ( = ?auto_897569 ?auto_897583 ) ) ( not ( = ?auto_897569 ?auto_897584 ) ) ( not ( = ?auto_897569 ?auto_897585 ) ) ( not ( = ?auto_897569 ?auto_897586 ) ) ( not ( = ?auto_897569 ?auto_897587 ) ) ( not ( = ?auto_897570 ?auto_897571 ) ) ( not ( = ?auto_897570 ?auto_897572 ) ) ( not ( = ?auto_897570 ?auto_897573 ) ) ( not ( = ?auto_897570 ?auto_897574 ) ) ( not ( = ?auto_897570 ?auto_897575 ) ) ( not ( = ?auto_897570 ?auto_897576 ) ) ( not ( = ?auto_897570 ?auto_897577 ) ) ( not ( = ?auto_897570 ?auto_897578 ) ) ( not ( = ?auto_897570 ?auto_897579 ) ) ( not ( = ?auto_897570 ?auto_897580 ) ) ( not ( = ?auto_897570 ?auto_897581 ) ) ( not ( = ?auto_897570 ?auto_897582 ) ) ( not ( = ?auto_897570 ?auto_897583 ) ) ( not ( = ?auto_897570 ?auto_897584 ) ) ( not ( = ?auto_897570 ?auto_897585 ) ) ( not ( = ?auto_897570 ?auto_897586 ) ) ( not ( = ?auto_897570 ?auto_897587 ) ) ( not ( = ?auto_897571 ?auto_897572 ) ) ( not ( = ?auto_897571 ?auto_897573 ) ) ( not ( = ?auto_897571 ?auto_897574 ) ) ( not ( = ?auto_897571 ?auto_897575 ) ) ( not ( = ?auto_897571 ?auto_897576 ) ) ( not ( = ?auto_897571 ?auto_897577 ) ) ( not ( = ?auto_897571 ?auto_897578 ) ) ( not ( = ?auto_897571 ?auto_897579 ) ) ( not ( = ?auto_897571 ?auto_897580 ) ) ( not ( = ?auto_897571 ?auto_897581 ) ) ( not ( = ?auto_897571 ?auto_897582 ) ) ( not ( = ?auto_897571 ?auto_897583 ) ) ( not ( = ?auto_897571 ?auto_897584 ) ) ( not ( = ?auto_897571 ?auto_897585 ) ) ( not ( = ?auto_897571 ?auto_897586 ) ) ( not ( = ?auto_897571 ?auto_897587 ) ) ( not ( = ?auto_897572 ?auto_897573 ) ) ( not ( = ?auto_897572 ?auto_897574 ) ) ( not ( = ?auto_897572 ?auto_897575 ) ) ( not ( = ?auto_897572 ?auto_897576 ) ) ( not ( = ?auto_897572 ?auto_897577 ) ) ( not ( = ?auto_897572 ?auto_897578 ) ) ( not ( = ?auto_897572 ?auto_897579 ) ) ( not ( = ?auto_897572 ?auto_897580 ) ) ( not ( = ?auto_897572 ?auto_897581 ) ) ( not ( = ?auto_897572 ?auto_897582 ) ) ( not ( = ?auto_897572 ?auto_897583 ) ) ( not ( = ?auto_897572 ?auto_897584 ) ) ( not ( = ?auto_897572 ?auto_897585 ) ) ( not ( = ?auto_897572 ?auto_897586 ) ) ( not ( = ?auto_897572 ?auto_897587 ) ) ( not ( = ?auto_897573 ?auto_897574 ) ) ( not ( = ?auto_897573 ?auto_897575 ) ) ( not ( = ?auto_897573 ?auto_897576 ) ) ( not ( = ?auto_897573 ?auto_897577 ) ) ( not ( = ?auto_897573 ?auto_897578 ) ) ( not ( = ?auto_897573 ?auto_897579 ) ) ( not ( = ?auto_897573 ?auto_897580 ) ) ( not ( = ?auto_897573 ?auto_897581 ) ) ( not ( = ?auto_897573 ?auto_897582 ) ) ( not ( = ?auto_897573 ?auto_897583 ) ) ( not ( = ?auto_897573 ?auto_897584 ) ) ( not ( = ?auto_897573 ?auto_897585 ) ) ( not ( = ?auto_897573 ?auto_897586 ) ) ( not ( = ?auto_897573 ?auto_897587 ) ) ( not ( = ?auto_897574 ?auto_897575 ) ) ( not ( = ?auto_897574 ?auto_897576 ) ) ( not ( = ?auto_897574 ?auto_897577 ) ) ( not ( = ?auto_897574 ?auto_897578 ) ) ( not ( = ?auto_897574 ?auto_897579 ) ) ( not ( = ?auto_897574 ?auto_897580 ) ) ( not ( = ?auto_897574 ?auto_897581 ) ) ( not ( = ?auto_897574 ?auto_897582 ) ) ( not ( = ?auto_897574 ?auto_897583 ) ) ( not ( = ?auto_897574 ?auto_897584 ) ) ( not ( = ?auto_897574 ?auto_897585 ) ) ( not ( = ?auto_897574 ?auto_897586 ) ) ( not ( = ?auto_897574 ?auto_897587 ) ) ( not ( = ?auto_897575 ?auto_897576 ) ) ( not ( = ?auto_897575 ?auto_897577 ) ) ( not ( = ?auto_897575 ?auto_897578 ) ) ( not ( = ?auto_897575 ?auto_897579 ) ) ( not ( = ?auto_897575 ?auto_897580 ) ) ( not ( = ?auto_897575 ?auto_897581 ) ) ( not ( = ?auto_897575 ?auto_897582 ) ) ( not ( = ?auto_897575 ?auto_897583 ) ) ( not ( = ?auto_897575 ?auto_897584 ) ) ( not ( = ?auto_897575 ?auto_897585 ) ) ( not ( = ?auto_897575 ?auto_897586 ) ) ( not ( = ?auto_897575 ?auto_897587 ) ) ( not ( = ?auto_897576 ?auto_897577 ) ) ( not ( = ?auto_897576 ?auto_897578 ) ) ( not ( = ?auto_897576 ?auto_897579 ) ) ( not ( = ?auto_897576 ?auto_897580 ) ) ( not ( = ?auto_897576 ?auto_897581 ) ) ( not ( = ?auto_897576 ?auto_897582 ) ) ( not ( = ?auto_897576 ?auto_897583 ) ) ( not ( = ?auto_897576 ?auto_897584 ) ) ( not ( = ?auto_897576 ?auto_897585 ) ) ( not ( = ?auto_897576 ?auto_897586 ) ) ( not ( = ?auto_897576 ?auto_897587 ) ) ( not ( = ?auto_897577 ?auto_897578 ) ) ( not ( = ?auto_897577 ?auto_897579 ) ) ( not ( = ?auto_897577 ?auto_897580 ) ) ( not ( = ?auto_897577 ?auto_897581 ) ) ( not ( = ?auto_897577 ?auto_897582 ) ) ( not ( = ?auto_897577 ?auto_897583 ) ) ( not ( = ?auto_897577 ?auto_897584 ) ) ( not ( = ?auto_897577 ?auto_897585 ) ) ( not ( = ?auto_897577 ?auto_897586 ) ) ( not ( = ?auto_897577 ?auto_897587 ) ) ( not ( = ?auto_897578 ?auto_897579 ) ) ( not ( = ?auto_897578 ?auto_897580 ) ) ( not ( = ?auto_897578 ?auto_897581 ) ) ( not ( = ?auto_897578 ?auto_897582 ) ) ( not ( = ?auto_897578 ?auto_897583 ) ) ( not ( = ?auto_897578 ?auto_897584 ) ) ( not ( = ?auto_897578 ?auto_897585 ) ) ( not ( = ?auto_897578 ?auto_897586 ) ) ( not ( = ?auto_897578 ?auto_897587 ) ) ( not ( = ?auto_897579 ?auto_897580 ) ) ( not ( = ?auto_897579 ?auto_897581 ) ) ( not ( = ?auto_897579 ?auto_897582 ) ) ( not ( = ?auto_897579 ?auto_897583 ) ) ( not ( = ?auto_897579 ?auto_897584 ) ) ( not ( = ?auto_897579 ?auto_897585 ) ) ( not ( = ?auto_897579 ?auto_897586 ) ) ( not ( = ?auto_897579 ?auto_897587 ) ) ( not ( = ?auto_897580 ?auto_897581 ) ) ( not ( = ?auto_897580 ?auto_897582 ) ) ( not ( = ?auto_897580 ?auto_897583 ) ) ( not ( = ?auto_897580 ?auto_897584 ) ) ( not ( = ?auto_897580 ?auto_897585 ) ) ( not ( = ?auto_897580 ?auto_897586 ) ) ( not ( = ?auto_897580 ?auto_897587 ) ) ( not ( = ?auto_897581 ?auto_897582 ) ) ( not ( = ?auto_897581 ?auto_897583 ) ) ( not ( = ?auto_897581 ?auto_897584 ) ) ( not ( = ?auto_897581 ?auto_897585 ) ) ( not ( = ?auto_897581 ?auto_897586 ) ) ( not ( = ?auto_897581 ?auto_897587 ) ) ( not ( = ?auto_897582 ?auto_897583 ) ) ( not ( = ?auto_897582 ?auto_897584 ) ) ( not ( = ?auto_897582 ?auto_897585 ) ) ( not ( = ?auto_897582 ?auto_897586 ) ) ( not ( = ?auto_897582 ?auto_897587 ) ) ( not ( = ?auto_897583 ?auto_897584 ) ) ( not ( = ?auto_897583 ?auto_897585 ) ) ( not ( = ?auto_897583 ?auto_897586 ) ) ( not ( = ?auto_897583 ?auto_897587 ) ) ( not ( = ?auto_897584 ?auto_897585 ) ) ( not ( = ?auto_897584 ?auto_897586 ) ) ( not ( = ?auto_897584 ?auto_897587 ) ) ( not ( = ?auto_897585 ?auto_897586 ) ) ( not ( = ?auto_897585 ?auto_897587 ) ) ( not ( = ?auto_897586 ?auto_897587 ) ) ( ON ?auto_897585 ?auto_897586 ) ( ON ?auto_897584 ?auto_897585 ) ( ON ?auto_897583 ?auto_897584 ) ( ON ?auto_897582 ?auto_897583 ) ( ON ?auto_897581 ?auto_897582 ) ( ON ?auto_897580 ?auto_897581 ) ( ON ?auto_897579 ?auto_897580 ) ( ON ?auto_897578 ?auto_897579 ) ( ON ?auto_897577 ?auto_897578 ) ( ON ?auto_897576 ?auto_897577 ) ( ON ?auto_897575 ?auto_897576 ) ( CLEAR ?auto_897573 ) ( ON ?auto_897574 ?auto_897575 ) ( CLEAR ?auto_897574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_897569 ?auto_897570 ?auto_897571 ?auto_897572 ?auto_897573 ?auto_897574 )
      ( MAKE-18PILE ?auto_897569 ?auto_897570 ?auto_897571 ?auto_897572 ?auto_897573 ?auto_897574 ?auto_897575 ?auto_897576 ?auto_897577 ?auto_897578 ?auto_897579 ?auto_897580 ?auto_897581 ?auto_897582 ?auto_897583 ?auto_897584 ?auto_897585 ?auto_897586 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897606 - BLOCK
      ?auto_897607 - BLOCK
      ?auto_897608 - BLOCK
      ?auto_897609 - BLOCK
      ?auto_897610 - BLOCK
      ?auto_897611 - BLOCK
      ?auto_897612 - BLOCK
      ?auto_897613 - BLOCK
      ?auto_897614 - BLOCK
      ?auto_897615 - BLOCK
      ?auto_897616 - BLOCK
      ?auto_897617 - BLOCK
      ?auto_897618 - BLOCK
      ?auto_897619 - BLOCK
      ?auto_897620 - BLOCK
      ?auto_897621 - BLOCK
      ?auto_897622 - BLOCK
      ?auto_897623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897623 ) ( ON-TABLE ?auto_897606 ) ( ON ?auto_897607 ?auto_897606 ) ( ON ?auto_897608 ?auto_897607 ) ( ON ?auto_897609 ?auto_897608 ) ( ON ?auto_897610 ?auto_897609 ) ( not ( = ?auto_897606 ?auto_897607 ) ) ( not ( = ?auto_897606 ?auto_897608 ) ) ( not ( = ?auto_897606 ?auto_897609 ) ) ( not ( = ?auto_897606 ?auto_897610 ) ) ( not ( = ?auto_897606 ?auto_897611 ) ) ( not ( = ?auto_897606 ?auto_897612 ) ) ( not ( = ?auto_897606 ?auto_897613 ) ) ( not ( = ?auto_897606 ?auto_897614 ) ) ( not ( = ?auto_897606 ?auto_897615 ) ) ( not ( = ?auto_897606 ?auto_897616 ) ) ( not ( = ?auto_897606 ?auto_897617 ) ) ( not ( = ?auto_897606 ?auto_897618 ) ) ( not ( = ?auto_897606 ?auto_897619 ) ) ( not ( = ?auto_897606 ?auto_897620 ) ) ( not ( = ?auto_897606 ?auto_897621 ) ) ( not ( = ?auto_897606 ?auto_897622 ) ) ( not ( = ?auto_897606 ?auto_897623 ) ) ( not ( = ?auto_897607 ?auto_897608 ) ) ( not ( = ?auto_897607 ?auto_897609 ) ) ( not ( = ?auto_897607 ?auto_897610 ) ) ( not ( = ?auto_897607 ?auto_897611 ) ) ( not ( = ?auto_897607 ?auto_897612 ) ) ( not ( = ?auto_897607 ?auto_897613 ) ) ( not ( = ?auto_897607 ?auto_897614 ) ) ( not ( = ?auto_897607 ?auto_897615 ) ) ( not ( = ?auto_897607 ?auto_897616 ) ) ( not ( = ?auto_897607 ?auto_897617 ) ) ( not ( = ?auto_897607 ?auto_897618 ) ) ( not ( = ?auto_897607 ?auto_897619 ) ) ( not ( = ?auto_897607 ?auto_897620 ) ) ( not ( = ?auto_897607 ?auto_897621 ) ) ( not ( = ?auto_897607 ?auto_897622 ) ) ( not ( = ?auto_897607 ?auto_897623 ) ) ( not ( = ?auto_897608 ?auto_897609 ) ) ( not ( = ?auto_897608 ?auto_897610 ) ) ( not ( = ?auto_897608 ?auto_897611 ) ) ( not ( = ?auto_897608 ?auto_897612 ) ) ( not ( = ?auto_897608 ?auto_897613 ) ) ( not ( = ?auto_897608 ?auto_897614 ) ) ( not ( = ?auto_897608 ?auto_897615 ) ) ( not ( = ?auto_897608 ?auto_897616 ) ) ( not ( = ?auto_897608 ?auto_897617 ) ) ( not ( = ?auto_897608 ?auto_897618 ) ) ( not ( = ?auto_897608 ?auto_897619 ) ) ( not ( = ?auto_897608 ?auto_897620 ) ) ( not ( = ?auto_897608 ?auto_897621 ) ) ( not ( = ?auto_897608 ?auto_897622 ) ) ( not ( = ?auto_897608 ?auto_897623 ) ) ( not ( = ?auto_897609 ?auto_897610 ) ) ( not ( = ?auto_897609 ?auto_897611 ) ) ( not ( = ?auto_897609 ?auto_897612 ) ) ( not ( = ?auto_897609 ?auto_897613 ) ) ( not ( = ?auto_897609 ?auto_897614 ) ) ( not ( = ?auto_897609 ?auto_897615 ) ) ( not ( = ?auto_897609 ?auto_897616 ) ) ( not ( = ?auto_897609 ?auto_897617 ) ) ( not ( = ?auto_897609 ?auto_897618 ) ) ( not ( = ?auto_897609 ?auto_897619 ) ) ( not ( = ?auto_897609 ?auto_897620 ) ) ( not ( = ?auto_897609 ?auto_897621 ) ) ( not ( = ?auto_897609 ?auto_897622 ) ) ( not ( = ?auto_897609 ?auto_897623 ) ) ( not ( = ?auto_897610 ?auto_897611 ) ) ( not ( = ?auto_897610 ?auto_897612 ) ) ( not ( = ?auto_897610 ?auto_897613 ) ) ( not ( = ?auto_897610 ?auto_897614 ) ) ( not ( = ?auto_897610 ?auto_897615 ) ) ( not ( = ?auto_897610 ?auto_897616 ) ) ( not ( = ?auto_897610 ?auto_897617 ) ) ( not ( = ?auto_897610 ?auto_897618 ) ) ( not ( = ?auto_897610 ?auto_897619 ) ) ( not ( = ?auto_897610 ?auto_897620 ) ) ( not ( = ?auto_897610 ?auto_897621 ) ) ( not ( = ?auto_897610 ?auto_897622 ) ) ( not ( = ?auto_897610 ?auto_897623 ) ) ( not ( = ?auto_897611 ?auto_897612 ) ) ( not ( = ?auto_897611 ?auto_897613 ) ) ( not ( = ?auto_897611 ?auto_897614 ) ) ( not ( = ?auto_897611 ?auto_897615 ) ) ( not ( = ?auto_897611 ?auto_897616 ) ) ( not ( = ?auto_897611 ?auto_897617 ) ) ( not ( = ?auto_897611 ?auto_897618 ) ) ( not ( = ?auto_897611 ?auto_897619 ) ) ( not ( = ?auto_897611 ?auto_897620 ) ) ( not ( = ?auto_897611 ?auto_897621 ) ) ( not ( = ?auto_897611 ?auto_897622 ) ) ( not ( = ?auto_897611 ?auto_897623 ) ) ( not ( = ?auto_897612 ?auto_897613 ) ) ( not ( = ?auto_897612 ?auto_897614 ) ) ( not ( = ?auto_897612 ?auto_897615 ) ) ( not ( = ?auto_897612 ?auto_897616 ) ) ( not ( = ?auto_897612 ?auto_897617 ) ) ( not ( = ?auto_897612 ?auto_897618 ) ) ( not ( = ?auto_897612 ?auto_897619 ) ) ( not ( = ?auto_897612 ?auto_897620 ) ) ( not ( = ?auto_897612 ?auto_897621 ) ) ( not ( = ?auto_897612 ?auto_897622 ) ) ( not ( = ?auto_897612 ?auto_897623 ) ) ( not ( = ?auto_897613 ?auto_897614 ) ) ( not ( = ?auto_897613 ?auto_897615 ) ) ( not ( = ?auto_897613 ?auto_897616 ) ) ( not ( = ?auto_897613 ?auto_897617 ) ) ( not ( = ?auto_897613 ?auto_897618 ) ) ( not ( = ?auto_897613 ?auto_897619 ) ) ( not ( = ?auto_897613 ?auto_897620 ) ) ( not ( = ?auto_897613 ?auto_897621 ) ) ( not ( = ?auto_897613 ?auto_897622 ) ) ( not ( = ?auto_897613 ?auto_897623 ) ) ( not ( = ?auto_897614 ?auto_897615 ) ) ( not ( = ?auto_897614 ?auto_897616 ) ) ( not ( = ?auto_897614 ?auto_897617 ) ) ( not ( = ?auto_897614 ?auto_897618 ) ) ( not ( = ?auto_897614 ?auto_897619 ) ) ( not ( = ?auto_897614 ?auto_897620 ) ) ( not ( = ?auto_897614 ?auto_897621 ) ) ( not ( = ?auto_897614 ?auto_897622 ) ) ( not ( = ?auto_897614 ?auto_897623 ) ) ( not ( = ?auto_897615 ?auto_897616 ) ) ( not ( = ?auto_897615 ?auto_897617 ) ) ( not ( = ?auto_897615 ?auto_897618 ) ) ( not ( = ?auto_897615 ?auto_897619 ) ) ( not ( = ?auto_897615 ?auto_897620 ) ) ( not ( = ?auto_897615 ?auto_897621 ) ) ( not ( = ?auto_897615 ?auto_897622 ) ) ( not ( = ?auto_897615 ?auto_897623 ) ) ( not ( = ?auto_897616 ?auto_897617 ) ) ( not ( = ?auto_897616 ?auto_897618 ) ) ( not ( = ?auto_897616 ?auto_897619 ) ) ( not ( = ?auto_897616 ?auto_897620 ) ) ( not ( = ?auto_897616 ?auto_897621 ) ) ( not ( = ?auto_897616 ?auto_897622 ) ) ( not ( = ?auto_897616 ?auto_897623 ) ) ( not ( = ?auto_897617 ?auto_897618 ) ) ( not ( = ?auto_897617 ?auto_897619 ) ) ( not ( = ?auto_897617 ?auto_897620 ) ) ( not ( = ?auto_897617 ?auto_897621 ) ) ( not ( = ?auto_897617 ?auto_897622 ) ) ( not ( = ?auto_897617 ?auto_897623 ) ) ( not ( = ?auto_897618 ?auto_897619 ) ) ( not ( = ?auto_897618 ?auto_897620 ) ) ( not ( = ?auto_897618 ?auto_897621 ) ) ( not ( = ?auto_897618 ?auto_897622 ) ) ( not ( = ?auto_897618 ?auto_897623 ) ) ( not ( = ?auto_897619 ?auto_897620 ) ) ( not ( = ?auto_897619 ?auto_897621 ) ) ( not ( = ?auto_897619 ?auto_897622 ) ) ( not ( = ?auto_897619 ?auto_897623 ) ) ( not ( = ?auto_897620 ?auto_897621 ) ) ( not ( = ?auto_897620 ?auto_897622 ) ) ( not ( = ?auto_897620 ?auto_897623 ) ) ( not ( = ?auto_897621 ?auto_897622 ) ) ( not ( = ?auto_897621 ?auto_897623 ) ) ( not ( = ?auto_897622 ?auto_897623 ) ) ( ON ?auto_897622 ?auto_897623 ) ( ON ?auto_897621 ?auto_897622 ) ( ON ?auto_897620 ?auto_897621 ) ( ON ?auto_897619 ?auto_897620 ) ( ON ?auto_897618 ?auto_897619 ) ( ON ?auto_897617 ?auto_897618 ) ( ON ?auto_897616 ?auto_897617 ) ( ON ?auto_897615 ?auto_897616 ) ( ON ?auto_897614 ?auto_897615 ) ( ON ?auto_897613 ?auto_897614 ) ( ON ?auto_897612 ?auto_897613 ) ( CLEAR ?auto_897610 ) ( ON ?auto_897611 ?auto_897612 ) ( CLEAR ?auto_897611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_897606 ?auto_897607 ?auto_897608 ?auto_897609 ?auto_897610 ?auto_897611 )
      ( MAKE-18PILE ?auto_897606 ?auto_897607 ?auto_897608 ?auto_897609 ?auto_897610 ?auto_897611 ?auto_897612 ?auto_897613 ?auto_897614 ?auto_897615 ?auto_897616 ?auto_897617 ?auto_897618 ?auto_897619 ?auto_897620 ?auto_897621 ?auto_897622 ?auto_897623 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897642 - BLOCK
      ?auto_897643 - BLOCK
      ?auto_897644 - BLOCK
      ?auto_897645 - BLOCK
      ?auto_897646 - BLOCK
      ?auto_897647 - BLOCK
      ?auto_897648 - BLOCK
      ?auto_897649 - BLOCK
      ?auto_897650 - BLOCK
      ?auto_897651 - BLOCK
      ?auto_897652 - BLOCK
      ?auto_897653 - BLOCK
      ?auto_897654 - BLOCK
      ?auto_897655 - BLOCK
      ?auto_897656 - BLOCK
      ?auto_897657 - BLOCK
      ?auto_897658 - BLOCK
      ?auto_897659 - BLOCK
    )
    :vars
    (
      ?auto_897660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897659 ?auto_897660 ) ( ON-TABLE ?auto_897642 ) ( ON ?auto_897643 ?auto_897642 ) ( ON ?auto_897644 ?auto_897643 ) ( ON ?auto_897645 ?auto_897644 ) ( not ( = ?auto_897642 ?auto_897643 ) ) ( not ( = ?auto_897642 ?auto_897644 ) ) ( not ( = ?auto_897642 ?auto_897645 ) ) ( not ( = ?auto_897642 ?auto_897646 ) ) ( not ( = ?auto_897642 ?auto_897647 ) ) ( not ( = ?auto_897642 ?auto_897648 ) ) ( not ( = ?auto_897642 ?auto_897649 ) ) ( not ( = ?auto_897642 ?auto_897650 ) ) ( not ( = ?auto_897642 ?auto_897651 ) ) ( not ( = ?auto_897642 ?auto_897652 ) ) ( not ( = ?auto_897642 ?auto_897653 ) ) ( not ( = ?auto_897642 ?auto_897654 ) ) ( not ( = ?auto_897642 ?auto_897655 ) ) ( not ( = ?auto_897642 ?auto_897656 ) ) ( not ( = ?auto_897642 ?auto_897657 ) ) ( not ( = ?auto_897642 ?auto_897658 ) ) ( not ( = ?auto_897642 ?auto_897659 ) ) ( not ( = ?auto_897642 ?auto_897660 ) ) ( not ( = ?auto_897643 ?auto_897644 ) ) ( not ( = ?auto_897643 ?auto_897645 ) ) ( not ( = ?auto_897643 ?auto_897646 ) ) ( not ( = ?auto_897643 ?auto_897647 ) ) ( not ( = ?auto_897643 ?auto_897648 ) ) ( not ( = ?auto_897643 ?auto_897649 ) ) ( not ( = ?auto_897643 ?auto_897650 ) ) ( not ( = ?auto_897643 ?auto_897651 ) ) ( not ( = ?auto_897643 ?auto_897652 ) ) ( not ( = ?auto_897643 ?auto_897653 ) ) ( not ( = ?auto_897643 ?auto_897654 ) ) ( not ( = ?auto_897643 ?auto_897655 ) ) ( not ( = ?auto_897643 ?auto_897656 ) ) ( not ( = ?auto_897643 ?auto_897657 ) ) ( not ( = ?auto_897643 ?auto_897658 ) ) ( not ( = ?auto_897643 ?auto_897659 ) ) ( not ( = ?auto_897643 ?auto_897660 ) ) ( not ( = ?auto_897644 ?auto_897645 ) ) ( not ( = ?auto_897644 ?auto_897646 ) ) ( not ( = ?auto_897644 ?auto_897647 ) ) ( not ( = ?auto_897644 ?auto_897648 ) ) ( not ( = ?auto_897644 ?auto_897649 ) ) ( not ( = ?auto_897644 ?auto_897650 ) ) ( not ( = ?auto_897644 ?auto_897651 ) ) ( not ( = ?auto_897644 ?auto_897652 ) ) ( not ( = ?auto_897644 ?auto_897653 ) ) ( not ( = ?auto_897644 ?auto_897654 ) ) ( not ( = ?auto_897644 ?auto_897655 ) ) ( not ( = ?auto_897644 ?auto_897656 ) ) ( not ( = ?auto_897644 ?auto_897657 ) ) ( not ( = ?auto_897644 ?auto_897658 ) ) ( not ( = ?auto_897644 ?auto_897659 ) ) ( not ( = ?auto_897644 ?auto_897660 ) ) ( not ( = ?auto_897645 ?auto_897646 ) ) ( not ( = ?auto_897645 ?auto_897647 ) ) ( not ( = ?auto_897645 ?auto_897648 ) ) ( not ( = ?auto_897645 ?auto_897649 ) ) ( not ( = ?auto_897645 ?auto_897650 ) ) ( not ( = ?auto_897645 ?auto_897651 ) ) ( not ( = ?auto_897645 ?auto_897652 ) ) ( not ( = ?auto_897645 ?auto_897653 ) ) ( not ( = ?auto_897645 ?auto_897654 ) ) ( not ( = ?auto_897645 ?auto_897655 ) ) ( not ( = ?auto_897645 ?auto_897656 ) ) ( not ( = ?auto_897645 ?auto_897657 ) ) ( not ( = ?auto_897645 ?auto_897658 ) ) ( not ( = ?auto_897645 ?auto_897659 ) ) ( not ( = ?auto_897645 ?auto_897660 ) ) ( not ( = ?auto_897646 ?auto_897647 ) ) ( not ( = ?auto_897646 ?auto_897648 ) ) ( not ( = ?auto_897646 ?auto_897649 ) ) ( not ( = ?auto_897646 ?auto_897650 ) ) ( not ( = ?auto_897646 ?auto_897651 ) ) ( not ( = ?auto_897646 ?auto_897652 ) ) ( not ( = ?auto_897646 ?auto_897653 ) ) ( not ( = ?auto_897646 ?auto_897654 ) ) ( not ( = ?auto_897646 ?auto_897655 ) ) ( not ( = ?auto_897646 ?auto_897656 ) ) ( not ( = ?auto_897646 ?auto_897657 ) ) ( not ( = ?auto_897646 ?auto_897658 ) ) ( not ( = ?auto_897646 ?auto_897659 ) ) ( not ( = ?auto_897646 ?auto_897660 ) ) ( not ( = ?auto_897647 ?auto_897648 ) ) ( not ( = ?auto_897647 ?auto_897649 ) ) ( not ( = ?auto_897647 ?auto_897650 ) ) ( not ( = ?auto_897647 ?auto_897651 ) ) ( not ( = ?auto_897647 ?auto_897652 ) ) ( not ( = ?auto_897647 ?auto_897653 ) ) ( not ( = ?auto_897647 ?auto_897654 ) ) ( not ( = ?auto_897647 ?auto_897655 ) ) ( not ( = ?auto_897647 ?auto_897656 ) ) ( not ( = ?auto_897647 ?auto_897657 ) ) ( not ( = ?auto_897647 ?auto_897658 ) ) ( not ( = ?auto_897647 ?auto_897659 ) ) ( not ( = ?auto_897647 ?auto_897660 ) ) ( not ( = ?auto_897648 ?auto_897649 ) ) ( not ( = ?auto_897648 ?auto_897650 ) ) ( not ( = ?auto_897648 ?auto_897651 ) ) ( not ( = ?auto_897648 ?auto_897652 ) ) ( not ( = ?auto_897648 ?auto_897653 ) ) ( not ( = ?auto_897648 ?auto_897654 ) ) ( not ( = ?auto_897648 ?auto_897655 ) ) ( not ( = ?auto_897648 ?auto_897656 ) ) ( not ( = ?auto_897648 ?auto_897657 ) ) ( not ( = ?auto_897648 ?auto_897658 ) ) ( not ( = ?auto_897648 ?auto_897659 ) ) ( not ( = ?auto_897648 ?auto_897660 ) ) ( not ( = ?auto_897649 ?auto_897650 ) ) ( not ( = ?auto_897649 ?auto_897651 ) ) ( not ( = ?auto_897649 ?auto_897652 ) ) ( not ( = ?auto_897649 ?auto_897653 ) ) ( not ( = ?auto_897649 ?auto_897654 ) ) ( not ( = ?auto_897649 ?auto_897655 ) ) ( not ( = ?auto_897649 ?auto_897656 ) ) ( not ( = ?auto_897649 ?auto_897657 ) ) ( not ( = ?auto_897649 ?auto_897658 ) ) ( not ( = ?auto_897649 ?auto_897659 ) ) ( not ( = ?auto_897649 ?auto_897660 ) ) ( not ( = ?auto_897650 ?auto_897651 ) ) ( not ( = ?auto_897650 ?auto_897652 ) ) ( not ( = ?auto_897650 ?auto_897653 ) ) ( not ( = ?auto_897650 ?auto_897654 ) ) ( not ( = ?auto_897650 ?auto_897655 ) ) ( not ( = ?auto_897650 ?auto_897656 ) ) ( not ( = ?auto_897650 ?auto_897657 ) ) ( not ( = ?auto_897650 ?auto_897658 ) ) ( not ( = ?auto_897650 ?auto_897659 ) ) ( not ( = ?auto_897650 ?auto_897660 ) ) ( not ( = ?auto_897651 ?auto_897652 ) ) ( not ( = ?auto_897651 ?auto_897653 ) ) ( not ( = ?auto_897651 ?auto_897654 ) ) ( not ( = ?auto_897651 ?auto_897655 ) ) ( not ( = ?auto_897651 ?auto_897656 ) ) ( not ( = ?auto_897651 ?auto_897657 ) ) ( not ( = ?auto_897651 ?auto_897658 ) ) ( not ( = ?auto_897651 ?auto_897659 ) ) ( not ( = ?auto_897651 ?auto_897660 ) ) ( not ( = ?auto_897652 ?auto_897653 ) ) ( not ( = ?auto_897652 ?auto_897654 ) ) ( not ( = ?auto_897652 ?auto_897655 ) ) ( not ( = ?auto_897652 ?auto_897656 ) ) ( not ( = ?auto_897652 ?auto_897657 ) ) ( not ( = ?auto_897652 ?auto_897658 ) ) ( not ( = ?auto_897652 ?auto_897659 ) ) ( not ( = ?auto_897652 ?auto_897660 ) ) ( not ( = ?auto_897653 ?auto_897654 ) ) ( not ( = ?auto_897653 ?auto_897655 ) ) ( not ( = ?auto_897653 ?auto_897656 ) ) ( not ( = ?auto_897653 ?auto_897657 ) ) ( not ( = ?auto_897653 ?auto_897658 ) ) ( not ( = ?auto_897653 ?auto_897659 ) ) ( not ( = ?auto_897653 ?auto_897660 ) ) ( not ( = ?auto_897654 ?auto_897655 ) ) ( not ( = ?auto_897654 ?auto_897656 ) ) ( not ( = ?auto_897654 ?auto_897657 ) ) ( not ( = ?auto_897654 ?auto_897658 ) ) ( not ( = ?auto_897654 ?auto_897659 ) ) ( not ( = ?auto_897654 ?auto_897660 ) ) ( not ( = ?auto_897655 ?auto_897656 ) ) ( not ( = ?auto_897655 ?auto_897657 ) ) ( not ( = ?auto_897655 ?auto_897658 ) ) ( not ( = ?auto_897655 ?auto_897659 ) ) ( not ( = ?auto_897655 ?auto_897660 ) ) ( not ( = ?auto_897656 ?auto_897657 ) ) ( not ( = ?auto_897656 ?auto_897658 ) ) ( not ( = ?auto_897656 ?auto_897659 ) ) ( not ( = ?auto_897656 ?auto_897660 ) ) ( not ( = ?auto_897657 ?auto_897658 ) ) ( not ( = ?auto_897657 ?auto_897659 ) ) ( not ( = ?auto_897657 ?auto_897660 ) ) ( not ( = ?auto_897658 ?auto_897659 ) ) ( not ( = ?auto_897658 ?auto_897660 ) ) ( not ( = ?auto_897659 ?auto_897660 ) ) ( ON ?auto_897658 ?auto_897659 ) ( ON ?auto_897657 ?auto_897658 ) ( ON ?auto_897656 ?auto_897657 ) ( ON ?auto_897655 ?auto_897656 ) ( ON ?auto_897654 ?auto_897655 ) ( ON ?auto_897653 ?auto_897654 ) ( ON ?auto_897652 ?auto_897653 ) ( ON ?auto_897651 ?auto_897652 ) ( ON ?auto_897650 ?auto_897651 ) ( ON ?auto_897649 ?auto_897650 ) ( ON ?auto_897648 ?auto_897649 ) ( ON ?auto_897647 ?auto_897648 ) ( CLEAR ?auto_897645 ) ( ON ?auto_897646 ?auto_897647 ) ( CLEAR ?auto_897646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_897642 ?auto_897643 ?auto_897644 ?auto_897645 ?auto_897646 )
      ( MAKE-18PILE ?auto_897642 ?auto_897643 ?auto_897644 ?auto_897645 ?auto_897646 ?auto_897647 ?auto_897648 ?auto_897649 ?auto_897650 ?auto_897651 ?auto_897652 ?auto_897653 ?auto_897654 ?auto_897655 ?auto_897656 ?auto_897657 ?auto_897658 ?auto_897659 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897679 - BLOCK
      ?auto_897680 - BLOCK
      ?auto_897681 - BLOCK
      ?auto_897682 - BLOCK
      ?auto_897683 - BLOCK
      ?auto_897684 - BLOCK
      ?auto_897685 - BLOCK
      ?auto_897686 - BLOCK
      ?auto_897687 - BLOCK
      ?auto_897688 - BLOCK
      ?auto_897689 - BLOCK
      ?auto_897690 - BLOCK
      ?auto_897691 - BLOCK
      ?auto_897692 - BLOCK
      ?auto_897693 - BLOCK
      ?auto_897694 - BLOCK
      ?auto_897695 - BLOCK
      ?auto_897696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897696 ) ( ON-TABLE ?auto_897679 ) ( ON ?auto_897680 ?auto_897679 ) ( ON ?auto_897681 ?auto_897680 ) ( ON ?auto_897682 ?auto_897681 ) ( not ( = ?auto_897679 ?auto_897680 ) ) ( not ( = ?auto_897679 ?auto_897681 ) ) ( not ( = ?auto_897679 ?auto_897682 ) ) ( not ( = ?auto_897679 ?auto_897683 ) ) ( not ( = ?auto_897679 ?auto_897684 ) ) ( not ( = ?auto_897679 ?auto_897685 ) ) ( not ( = ?auto_897679 ?auto_897686 ) ) ( not ( = ?auto_897679 ?auto_897687 ) ) ( not ( = ?auto_897679 ?auto_897688 ) ) ( not ( = ?auto_897679 ?auto_897689 ) ) ( not ( = ?auto_897679 ?auto_897690 ) ) ( not ( = ?auto_897679 ?auto_897691 ) ) ( not ( = ?auto_897679 ?auto_897692 ) ) ( not ( = ?auto_897679 ?auto_897693 ) ) ( not ( = ?auto_897679 ?auto_897694 ) ) ( not ( = ?auto_897679 ?auto_897695 ) ) ( not ( = ?auto_897679 ?auto_897696 ) ) ( not ( = ?auto_897680 ?auto_897681 ) ) ( not ( = ?auto_897680 ?auto_897682 ) ) ( not ( = ?auto_897680 ?auto_897683 ) ) ( not ( = ?auto_897680 ?auto_897684 ) ) ( not ( = ?auto_897680 ?auto_897685 ) ) ( not ( = ?auto_897680 ?auto_897686 ) ) ( not ( = ?auto_897680 ?auto_897687 ) ) ( not ( = ?auto_897680 ?auto_897688 ) ) ( not ( = ?auto_897680 ?auto_897689 ) ) ( not ( = ?auto_897680 ?auto_897690 ) ) ( not ( = ?auto_897680 ?auto_897691 ) ) ( not ( = ?auto_897680 ?auto_897692 ) ) ( not ( = ?auto_897680 ?auto_897693 ) ) ( not ( = ?auto_897680 ?auto_897694 ) ) ( not ( = ?auto_897680 ?auto_897695 ) ) ( not ( = ?auto_897680 ?auto_897696 ) ) ( not ( = ?auto_897681 ?auto_897682 ) ) ( not ( = ?auto_897681 ?auto_897683 ) ) ( not ( = ?auto_897681 ?auto_897684 ) ) ( not ( = ?auto_897681 ?auto_897685 ) ) ( not ( = ?auto_897681 ?auto_897686 ) ) ( not ( = ?auto_897681 ?auto_897687 ) ) ( not ( = ?auto_897681 ?auto_897688 ) ) ( not ( = ?auto_897681 ?auto_897689 ) ) ( not ( = ?auto_897681 ?auto_897690 ) ) ( not ( = ?auto_897681 ?auto_897691 ) ) ( not ( = ?auto_897681 ?auto_897692 ) ) ( not ( = ?auto_897681 ?auto_897693 ) ) ( not ( = ?auto_897681 ?auto_897694 ) ) ( not ( = ?auto_897681 ?auto_897695 ) ) ( not ( = ?auto_897681 ?auto_897696 ) ) ( not ( = ?auto_897682 ?auto_897683 ) ) ( not ( = ?auto_897682 ?auto_897684 ) ) ( not ( = ?auto_897682 ?auto_897685 ) ) ( not ( = ?auto_897682 ?auto_897686 ) ) ( not ( = ?auto_897682 ?auto_897687 ) ) ( not ( = ?auto_897682 ?auto_897688 ) ) ( not ( = ?auto_897682 ?auto_897689 ) ) ( not ( = ?auto_897682 ?auto_897690 ) ) ( not ( = ?auto_897682 ?auto_897691 ) ) ( not ( = ?auto_897682 ?auto_897692 ) ) ( not ( = ?auto_897682 ?auto_897693 ) ) ( not ( = ?auto_897682 ?auto_897694 ) ) ( not ( = ?auto_897682 ?auto_897695 ) ) ( not ( = ?auto_897682 ?auto_897696 ) ) ( not ( = ?auto_897683 ?auto_897684 ) ) ( not ( = ?auto_897683 ?auto_897685 ) ) ( not ( = ?auto_897683 ?auto_897686 ) ) ( not ( = ?auto_897683 ?auto_897687 ) ) ( not ( = ?auto_897683 ?auto_897688 ) ) ( not ( = ?auto_897683 ?auto_897689 ) ) ( not ( = ?auto_897683 ?auto_897690 ) ) ( not ( = ?auto_897683 ?auto_897691 ) ) ( not ( = ?auto_897683 ?auto_897692 ) ) ( not ( = ?auto_897683 ?auto_897693 ) ) ( not ( = ?auto_897683 ?auto_897694 ) ) ( not ( = ?auto_897683 ?auto_897695 ) ) ( not ( = ?auto_897683 ?auto_897696 ) ) ( not ( = ?auto_897684 ?auto_897685 ) ) ( not ( = ?auto_897684 ?auto_897686 ) ) ( not ( = ?auto_897684 ?auto_897687 ) ) ( not ( = ?auto_897684 ?auto_897688 ) ) ( not ( = ?auto_897684 ?auto_897689 ) ) ( not ( = ?auto_897684 ?auto_897690 ) ) ( not ( = ?auto_897684 ?auto_897691 ) ) ( not ( = ?auto_897684 ?auto_897692 ) ) ( not ( = ?auto_897684 ?auto_897693 ) ) ( not ( = ?auto_897684 ?auto_897694 ) ) ( not ( = ?auto_897684 ?auto_897695 ) ) ( not ( = ?auto_897684 ?auto_897696 ) ) ( not ( = ?auto_897685 ?auto_897686 ) ) ( not ( = ?auto_897685 ?auto_897687 ) ) ( not ( = ?auto_897685 ?auto_897688 ) ) ( not ( = ?auto_897685 ?auto_897689 ) ) ( not ( = ?auto_897685 ?auto_897690 ) ) ( not ( = ?auto_897685 ?auto_897691 ) ) ( not ( = ?auto_897685 ?auto_897692 ) ) ( not ( = ?auto_897685 ?auto_897693 ) ) ( not ( = ?auto_897685 ?auto_897694 ) ) ( not ( = ?auto_897685 ?auto_897695 ) ) ( not ( = ?auto_897685 ?auto_897696 ) ) ( not ( = ?auto_897686 ?auto_897687 ) ) ( not ( = ?auto_897686 ?auto_897688 ) ) ( not ( = ?auto_897686 ?auto_897689 ) ) ( not ( = ?auto_897686 ?auto_897690 ) ) ( not ( = ?auto_897686 ?auto_897691 ) ) ( not ( = ?auto_897686 ?auto_897692 ) ) ( not ( = ?auto_897686 ?auto_897693 ) ) ( not ( = ?auto_897686 ?auto_897694 ) ) ( not ( = ?auto_897686 ?auto_897695 ) ) ( not ( = ?auto_897686 ?auto_897696 ) ) ( not ( = ?auto_897687 ?auto_897688 ) ) ( not ( = ?auto_897687 ?auto_897689 ) ) ( not ( = ?auto_897687 ?auto_897690 ) ) ( not ( = ?auto_897687 ?auto_897691 ) ) ( not ( = ?auto_897687 ?auto_897692 ) ) ( not ( = ?auto_897687 ?auto_897693 ) ) ( not ( = ?auto_897687 ?auto_897694 ) ) ( not ( = ?auto_897687 ?auto_897695 ) ) ( not ( = ?auto_897687 ?auto_897696 ) ) ( not ( = ?auto_897688 ?auto_897689 ) ) ( not ( = ?auto_897688 ?auto_897690 ) ) ( not ( = ?auto_897688 ?auto_897691 ) ) ( not ( = ?auto_897688 ?auto_897692 ) ) ( not ( = ?auto_897688 ?auto_897693 ) ) ( not ( = ?auto_897688 ?auto_897694 ) ) ( not ( = ?auto_897688 ?auto_897695 ) ) ( not ( = ?auto_897688 ?auto_897696 ) ) ( not ( = ?auto_897689 ?auto_897690 ) ) ( not ( = ?auto_897689 ?auto_897691 ) ) ( not ( = ?auto_897689 ?auto_897692 ) ) ( not ( = ?auto_897689 ?auto_897693 ) ) ( not ( = ?auto_897689 ?auto_897694 ) ) ( not ( = ?auto_897689 ?auto_897695 ) ) ( not ( = ?auto_897689 ?auto_897696 ) ) ( not ( = ?auto_897690 ?auto_897691 ) ) ( not ( = ?auto_897690 ?auto_897692 ) ) ( not ( = ?auto_897690 ?auto_897693 ) ) ( not ( = ?auto_897690 ?auto_897694 ) ) ( not ( = ?auto_897690 ?auto_897695 ) ) ( not ( = ?auto_897690 ?auto_897696 ) ) ( not ( = ?auto_897691 ?auto_897692 ) ) ( not ( = ?auto_897691 ?auto_897693 ) ) ( not ( = ?auto_897691 ?auto_897694 ) ) ( not ( = ?auto_897691 ?auto_897695 ) ) ( not ( = ?auto_897691 ?auto_897696 ) ) ( not ( = ?auto_897692 ?auto_897693 ) ) ( not ( = ?auto_897692 ?auto_897694 ) ) ( not ( = ?auto_897692 ?auto_897695 ) ) ( not ( = ?auto_897692 ?auto_897696 ) ) ( not ( = ?auto_897693 ?auto_897694 ) ) ( not ( = ?auto_897693 ?auto_897695 ) ) ( not ( = ?auto_897693 ?auto_897696 ) ) ( not ( = ?auto_897694 ?auto_897695 ) ) ( not ( = ?auto_897694 ?auto_897696 ) ) ( not ( = ?auto_897695 ?auto_897696 ) ) ( ON ?auto_897695 ?auto_897696 ) ( ON ?auto_897694 ?auto_897695 ) ( ON ?auto_897693 ?auto_897694 ) ( ON ?auto_897692 ?auto_897693 ) ( ON ?auto_897691 ?auto_897692 ) ( ON ?auto_897690 ?auto_897691 ) ( ON ?auto_897689 ?auto_897690 ) ( ON ?auto_897688 ?auto_897689 ) ( ON ?auto_897687 ?auto_897688 ) ( ON ?auto_897686 ?auto_897687 ) ( ON ?auto_897685 ?auto_897686 ) ( ON ?auto_897684 ?auto_897685 ) ( CLEAR ?auto_897682 ) ( ON ?auto_897683 ?auto_897684 ) ( CLEAR ?auto_897683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_897679 ?auto_897680 ?auto_897681 ?auto_897682 ?auto_897683 )
      ( MAKE-18PILE ?auto_897679 ?auto_897680 ?auto_897681 ?auto_897682 ?auto_897683 ?auto_897684 ?auto_897685 ?auto_897686 ?auto_897687 ?auto_897688 ?auto_897689 ?auto_897690 ?auto_897691 ?auto_897692 ?auto_897693 ?auto_897694 ?auto_897695 ?auto_897696 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897715 - BLOCK
      ?auto_897716 - BLOCK
      ?auto_897717 - BLOCK
      ?auto_897718 - BLOCK
      ?auto_897719 - BLOCK
      ?auto_897720 - BLOCK
      ?auto_897721 - BLOCK
      ?auto_897722 - BLOCK
      ?auto_897723 - BLOCK
      ?auto_897724 - BLOCK
      ?auto_897725 - BLOCK
      ?auto_897726 - BLOCK
      ?auto_897727 - BLOCK
      ?auto_897728 - BLOCK
      ?auto_897729 - BLOCK
      ?auto_897730 - BLOCK
      ?auto_897731 - BLOCK
      ?auto_897732 - BLOCK
    )
    :vars
    (
      ?auto_897733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897732 ?auto_897733 ) ( ON-TABLE ?auto_897715 ) ( ON ?auto_897716 ?auto_897715 ) ( ON ?auto_897717 ?auto_897716 ) ( not ( = ?auto_897715 ?auto_897716 ) ) ( not ( = ?auto_897715 ?auto_897717 ) ) ( not ( = ?auto_897715 ?auto_897718 ) ) ( not ( = ?auto_897715 ?auto_897719 ) ) ( not ( = ?auto_897715 ?auto_897720 ) ) ( not ( = ?auto_897715 ?auto_897721 ) ) ( not ( = ?auto_897715 ?auto_897722 ) ) ( not ( = ?auto_897715 ?auto_897723 ) ) ( not ( = ?auto_897715 ?auto_897724 ) ) ( not ( = ?auto_897715 ?auto_897725 ) ) ( not ( = ?auto_897715 ?auto_897726 ) ) ( not ( = ?auto_897715 ?auto_897727 ) ) ( not ( = ?auto_897715 ?auto_897728 ) ) ( not ( = ?auto_897715 ?auto_897729 ) ) ( not ( = ?auto_897715 ?auto_897730 ) ) ( not ( = ?auto_897715 ?auto_897731 ) ) ( not ( = ?auto_897715 ?auto_897732 ) ) ( not ( = ?auto_897715 ?auto_897733 ) ) ( not ( = ?auto_897716 ?auto_897717 ) ) ( not ( = ?auto_897716 ?auto_897718 ) ) ( not ( = ?auto_897716 ?auto_897719 ) ) ( not ( = ?auto_897716 ?auto_897720 ) ) ( not ( = ?auto_897716 ?auto_897721 ) ) ( not ( = ?auto_897716 ?auto_897722 ) ) ( not ( = ?auto_897716 ?auto_897723 ) ) ( not ( = ?auto_897716 ?auto_897724 ) ) ( not ( = ?auto_897716 ?auto_897725 ) ) ( not ( = ?auto_897716 ?auto_897726 ) ) ( not ( = ?auto_897716 ?auto_897727 ) ) ( not ( = ?auto_897716 ?auto_897728 ) ) ( not ( = ?auto_897716 ?auto_897729 ) ) ( not ( = ?auto_897716 ?auto_897730 ) ) ( not ( = ?auto_897716 ?auto_897731 ) ) ( not ( = ?auto_897716 ?auto_897732 ) ) ( not ( = ?auto_897716 ?auto_897733 ) ) ( not ( = ?auto_897717 ?auto_897718 ) ) ( not ( = ?auto_897717 ?auto_897719 ) ) ( not ( = ?auto_897717 ?auto_897720 ) ) ( not ( = ?auto_897717 ?auto_897721 ) ) ( not ( = ?auto_897717 ?auto_897722 ) ) ( not ( = ?auto_897717 ?auto_897723 ) ) ( not ( = ?auto_897717 ?auto_897724 ) ) ( not ( = ?auto_897717 ?auto_897725 ) ) ( not ( = ?auto_897717 ?auto_897726 ) ) ( not ( = ?auto_897717 ?auto_897727 ) ) ( not ( = ?auto_897717 ?auto_897728 ) ) ( not ( = ?auto_897717 ?auto_897729 ) ) ( not ( = ?auto_897717 ?auto_897730 ) ) ( not ( = ?auto_897717 ?auto_897731 ) ) ( not ( = ?auto_897717 ?auto_897732 ) ) ( not ( = ?auto_897717 ?auto_897733 ) ) ( not ( = ?auto_897718 ?auto_897719 ) ) ( not ( = ?auto_897718 ?auto_897720 ) ) ( not ( = ?auto_897718 ?auto_897721 ) ) ( not ( = ?auto_897718 ?auto_897722 ) ) ( not ( = ?auto_897718 ?auto_897723 ) ) ( not ( = ?auto_897718 ?auto_897724 ) ) ( not ( = ?auto_897718 ?auto_897725 ) ) ( not ( = ?auto_897718 ?auto_897726 ) ) ( not ( = ?auto_897718 ?auto_897727 ) ) ( not ( = ?auto_897718 ?auto_897728 ) ) ( not ( = ?auto_897718 ?auto_897729 ) ) ( not ( = ?auto_897718 ?auto_897730 ) ) ( not ( = ?auto_897718 ?auto_897731 ) ) ( not ( = ?auto_897718 ?auto_897732 ) ) ( not ( = ?auto_897718 ?auto_897733 ) ) ( not ( = ?auto_897719 ?auto_897720 ) ) ( not ( = ?auto_897719 ?auto_897721 ) ) ( not ( = ?auto_897719 ?auto_897722 ) ) ( not ( = ?auto_897719 ?auto_897723 ) ) ( not ( = ?auto_897719 ?auto_897724 ) ) ( not ( = ?auto_897719 ?auto_897725 ) ) ( not ( = ?auto_897719 ?auto_897726 ) ) ( not ( = ?auto_897719 ?auto_897727 ) ) ( not ( = ?auto_897719 ?auto_897728 ) ) ( not ( = ?auto_897719 ?auto_897729 ) ) ( not ( = ?auto_897719 ?auto_897730 ) ) ( not ( = ?auto_897719 ?auto_897731 ) ) ( not ( = ?auto_897719 ?auto_897732 ) ) ( not ( = ?auto_897719 ?auto_897733 ) ) ( not ( = ?auto_897720 ?auto_897721 ) ) ( not ( = ?auto_897720 ?auto_897722 ) ) ( not ( = ?auto_897720 ?auto_897723 ) ) ( not ( = ?auto_897720 ?auto_897724 ) ) ( not ( = ?auto_897720 ?auto_897725 ) ) ( not ( = ?auto_897720 ?auto_897726 ) ) ( not ( = ?auto_897720 ?auto_897727 ) ) ( not ( = ?auto_897720 ?auto_897728 ) ) ( not ( = ?auto_897720 ?auto_897729 ) ) ( not ( = ?auto_897720 ?auto_897730 ) ) ( not ( = ?auto_897720 ?auto_897731 ) ) ( not ( = ?auto_897720 ?auto_897732 ) ) ( not ( = ?auto_897720 ?auto_897733 ) ) ( not ( = ?auto_897721 ?auto_897722 ) ) ( not ( = ?auto_897721 ?auto_897723 ) ) ( not ( = ?auto_897721 ?auto_897724 ) ) ( not ( = ?auto_897721 ?auto_897725 ) ) ( not ( = ?auto_897721 ?auto_897726 ) ) ( not ( = ?auto_897721 ?auto_897727 ) ) ( not ( = ?auto_897721 ?auto_897728 ) ) ( not ( = ?auto_897721 ?auto_897729 ) ) ( not ( = ?auto_897721 ?auto_897730 ) ) ( not ( = ?auto_897721 ?auto_897731 ) ) ( not ( = ?auto_897721 ?auto_897732 ) ) ( not ( = ?auto_897721 ?auto_897733 ) ) ( not ( = ?auto_897722 ?auto_897723 ) ) ( not ( = ?auto_897722 ?auto_897724 ) ) ( not ( = ?auto_897722 ?auto_897725 ) ) ( not ( = ?auto_897722 ?auto_897726 ) ) ( not ( = ?auto_897722 ?auto_897727 ) ) ( not ( = ?auto_897722 ?auto_897728 ) ) ( not ( = ?auto_897722 ?auto_897729 ) ) ( not ( = ?auto_897722 ?auto_897730 ) ) ( not ( = ?auto_897722 ?auto_897731 ) ) ( not ( = ?auto_897722 ?auto_897732 ) ) ( not ( = ?auto_897722 ?auto_897733 ) ) ( not ( = ?auto_897723 ?auto_897724 ) ) ( not ( = ?auto_897723 ?auto_897725 ) ) ( not ( = ?auto_897723 ?auto_897726 ) ) ( not ( = ?auto_897723 ?auto_897727 ) ) ( not ( = ?auto_897723 ?auto_897728 ) ) ( not ( = ?auto_897723 ?auto_897729 ) ) ( not ( = ?auto_897723 ?auto_897730 ) ) ( not ( = ?auto_897723 ?auto_897731 ) ) ( not ( = ?auto_897723 ?auto_897732 ) ) ( not ( = ?auto_897723 ?auto_897733 ) ) ( not ( = ?auto_897724 ?auto_897725 ) ) ( not ( = ?auto_897724 ?auto_897726 ) ) ( not ( = ?auto_897724 ?auto_897727 ) ) ( not ( = ?auto_897724 ?auto_897728 ) ) ( not ( = ?auto_897724 ?auto_897729 ) ) ( not ( = ?auto_897724 ?auto_897730 ) ) ( not ( = ?auto_897724 ?auto_897731 ) ) ( not ( = ?auto_897724 ?auto_897732 ) ) ( not ( = ?auto_897724 ?auto_897733 ) ) ( not ( = ?auto_897725 ?auto_897726 ) ) ( not ( = ?auto_897725 ?auto_897727 ) ) ( not ( = ?auto_897725 ?auto_897728 ) ) ( not ( = ?auto_897725 ?auto_897729 ) ) ( not ( = ?auto_897725 ?auto_897730 ) ) ( not ( = ?auto_897725 ?auto_897731 ) ) ( not ( = ?auto_897725 ?auto_897732 ) ) ( not ( = ?auto_897725 ?auto_897733 ) ) ( not ( = ?auto_897726 ?auto_897727 ) ) ( not ( = ?auto_897726 ?auto_897728 ) ) ( not ( = ?auto_897726 ?auto_897729 ) ) ( not ( = ?auto_897726 ?auto_897730 ) ) ( not ( = ?auto_897726 ?auto_897731 ) ) ( not ( = ?auto_897726 ?auto_897732 ) ) ( not ( = ?auto_897726 ?auto_897733 ) ) ( not ( = ?auto_897727 ?auto_897728 ) ) ( not ( = ?auto_897727 ?auto_897729 ) ) ( not ( = ?auto_897727 ?auto_897730 ) ) ( not ( = ?auto_897727 ?auto_897731 ) ) ( not ( = ?auto_897727 ?auto_897732 ) ) ( not ( = ?auto_897727 ?auto_897733 ) ) ( not ( = ?auto_897728 ?auto_897729 ) ) ( not ( = ?auto_897728 ?auto_897730 ) ) ( not ( = ?auto_897728 ?auto_897731 ) ) ( not ( = ?auto_897728 ?auto_897732 ) ) ( not ( = ?auto_897728 ?auto_897733 ) ) ( not ( = ?auto_897729 ?auto_897730 ) ) ( not ( = ?auto_897729 ?auto_897731 ) ) ( not ( = ?auto_897729 ?auto_897732 ) ) ( not ( = ?auto_897729 ?auto_897733 ) ) ( not ( = ?auto_897730 ?auto_897731 ) ) ( not ( = ?auto_897730 ?auto_897732 ) ) ( not ( = ?auto_897730 ?auto_897733 ) ) ( not ( = ?auto_897731 ?auto_897732 ) ) ( not ( = ?auto_897731 ?auto_897733 ) ) ( not ( = ?auto_897732 ?auto_897733 ) ) ( ON ?auto_897731 ?auto_897732 ) ( ON ?auto_897730 ?auto_897731 ) ( ON ?auto_897729 ?auto_897730 ) ( ON ?auto_897728 ?auto_897729 ) ( ON ?auto_897727 ?auto_897728 ) ( ON ?auto_897726 ?auto_897727 ) ( ON ?auto_897725 ?auto_897726 ) ( ON ?auto_897724 ?auto_897725 ) ( ON ?auto_897723 ?auto_897724 ) ( ON ?auto_897722 ?auto_897723 ) ( ON ?auto_897721 ?auto_897722 ) ( ON ?auto_897720 ?auto_897721 ) ( ON ?auto_897719 ?auto_897720 ) ( CLEAR ?auto_897717 ) ( ON ?auto_897718 ?auto_897719 ) ( CLEAR ?auto_897718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_897715 ?auto_897716 ?auto_897717 ?auto_897718 )
      ( MAKE-18PILE ?auto_897715 ?auto_897716 ?auto_897717 ?auto_897718 ?auto_897719 ?auto_897720 ?auto_897721 ?auto_897722 ?auto_897723 ?auto_897724 ?auto_897725 ?auto_897726 ?auto_897727 ?auto_897728 ?auto_897729 ?auto_897730 ?auto_897731 ?auto_897732 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897752 - BLOCK
      ?auto_897753 - BLOCK
      ?auto_897754 - BLOCK
      ?auto_897755 - BLOCK
      ?auto_897756 - BLOCK
      ?auto_897757 - BLOCK
      ?auto_897758 - BLOCK
      ?auto_897759 - BLOCK
      ?auto_897760 - BLOCK
      ?auto_897761 - BLOCK
      ?auto_897762 - BLOCK
      ?auto_897763 - BLOCK
      ?auto_897764 - BLOCK
      ?auto_897765 - BLOCK
      ?auto_897766 - BLOCK
      ?auto_897767 - BLOCK
      ?auto_897768 - BLOCK
      ?auto_897769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897769 ) ( ON-TABLE ?auto_897752 ) ( ON ?auto_897753 ?auto_897752 ) ( ON ?auto_897754 ?auto_897753 ) ( not ( = ?auto_897752 ?auto_897753 ) ) ( not ( = ?auto_897752 ?auto_897754 ) ) ( not ( = ?auto_897752 ?auto_897755 ) ) ( not ( = ?auto_897752 ?auto_897756 ) ) ( not ( = ?auto_897752 ?auto_897757 ) ) ( not ( = ?auto_897752 ?auto_897758 ) ) ( not ( = ?auto_897752 ?auto_897759 ) ) ( not ( = ?auto_897752 ?auto_897760 ) ) ( not ( = ?auto_897752 ?auto_897761 ) ) ( not ( = ?auto_897752 ?auto_897762 ) ) ( not ( = ?auto_897752 ?auto_897763 ) ) ( not ( = ?auto_897752 ?auto_897764 ) ) ( not ( = ?auto_897752 ?auto_897765 ) ) ( not ( = ?auto_897752 ?auto_897766 ) ) ( not ( = ?auto_897752 ?auto_897767 ) ) ( not ( = ?auto_897752 ?auto_897768 ) ) ( not ( = ?auto_897752 ?auto_897769 ) ) ( not ( = ?auto_897753 ?auto_897754 ) ) ( not ( = ?auto_897753 ?auto_897755 ) ) ( not ( = ?auto_897753 ?auto_897756 ) ) ( not ( = ?auto_897753 ?auto_897757 ) ) ( not ( = ?auto_897753 ?auto_897758 ) ) ( not ( = ?auto_897753 ?auto_897759 ) ) ( not ( = ?auto_897753 ?auto_897760 ) ) ( not ( = ?auto_897753 ?auto_897761 ) ) ( not ( = ?auto_897753 ?auto_897762 ) ) ( not ( = ?auto_897753 ?auto_897763 ) ) ( not ( = ?auto_897753 ?auto_897764 ) ) ( not ( = ?auto_897753 ?auto_897765 ) ) ( not ( = ?auto_897753 ?auto_897766 ) ) ( not ( = ?auto_897753 ?auto_897767 ) ) ( not ( = ?auto_897753 ?auto_897768 ) ) ( not ( = ?auto_897753 ?auto_897769 ) ) ( not ( = ?auto_897754 ?auto_897755 ) ) ( not ( = ?auto_897754 ?auto_897756 ) ) ( not ( = ?auto_897754 ?auto_897757 ) ) ( not ( = ?auto_897754 ?auto_897758 ) ) ( not ( = ?auto_897754 ?auto_897759 ) ) ( not ( = ?auto_897754 ?auto_897760 ) ) ( not ( = ?auto_897754 ?auto_897761 ) ) ( not ( = ?auto_897754 ?auto_897762 ) ) ( not ( = ?auto_897754 ?auto_897763 ) ) ( not ( = ?auto_897754 ?auto_897764 ) ) ( not ( = ?auto_897754 ?auto_897765 ) ) ( not ( = ?auto_897754 ?auto_897766 ) ) ( not ( = ?auto_897754 ?auto_897767 ) ) ( not ( = ?auto_897754 ?auto_897768 ) ) ( not ( = ?auto_897754 ?auto_897769 ) ) ( not ( = ?auto_897755 ?auto_897756 ) ) ( not ( = ?auto_897755 ?auto_897757 ) ) ( not ( = ?auto_897755 ?auto_897758 ) ) ( not ( = ?auto_897755 ?auto_897759 ) ) ( not ( = ?auto_897755 ?auto_897760 ) ) ( not ( = ?auto_897755 ?auto_897761 ) ) ( not ( = ?auto_897755 ?auto_897762 ) ) ( not ( = ?auto_897755 ?auto_897763 ) ) ( not ( = ?auto_897755 ?auto_897764 ) ) ( not ( = ?auto_897755 ?auto_897765 ) ) ( not ( = ?auto_897755 ?auto_897766 ) ) ( not ( = ?auto_897755 ?auto_897767 ) ) ( not ( = ?auto_897755 ?auto_897768 ) ) ( not ( = ?auto_897755 ?auto_897769 ) ) ( not ( = ?auto_897756 ?auto_897757 ) ) ( not ( = ?auto_897756 ?auto_897758 ) ) ( not ( = ?auto_897756 ?auto_897759 ) ) ( not ( = ?auto_897756 ?auto_897760 ) ) ( not ( = ?auto_897756 ?auto_897761 ) ) ( not ( = ?auto_897756 ?auto_897762 ) ) ( not ( = ?auto_897756 ?auto_897763 ) ) ( not ( = ?auto_897756 ?auto_897764 ) ) ( not ( = ?auto_897756 ?auto_897765 ) ) ( not ( = ?auto_897756 ?auto_897766 ) ) ( not ( = ?auto_897756 ?auto_897767 ) ) ( not ( = ?auto_897756 ?auto_897768 ) ) ( not ( = ?auto_897756 ?auto_897769 ) ) ( not ( = ?auto_897757 ?auto_897758 ) ) ( not ( = ?auto_897757 ?auto_897759 ) ) ( not ( = ?auto_897757 ?auto_897760 ) ) ( not ( = ?auto_897757 ?auto_897761 ) ) ( not ( = ?auto_897757 ?auto_897762 ) ) ( not ( = ?auto_897757 ?auto_897763 ) ) ( not ( = ?auto_897757 ?auto_897764 ) ) ( not ( = ?auto_897757 ?auto_897765 ) ) ( not ( = ?auto_897757 ?auto_897766 ) ) ( not ( = ?auto_897757 ?auto_897767 ) ) ( not ( = ?auto_897757 ?auto_897768 ) ) ( not ( = ?auto_897757 ?auto_897769 ) ) ( not ( = ?auto_897758 ?auto_897759 ) ) ( not ( = ?auto_897758 ?auto_897760 ) ) ( not ( = ?auto_897758 ?auto_897761 ) ) ( not ( = ?auto_897758 ?auto_897762 ) ) ( not ( = ?auto_897758 ?auto_897763 ) ) ( not ( = ?auto_897758 ?auto_897764 ) ) ( not ( = ?auto_897758 ?auto_897765 ) ) ( not ( = ?auto_897758 ?auto_897766 ) ) ( not ( = ?auto_897758 ?auto_897767 ) ) ( not ( = ?auto_897758 ?auto_897768 ) ) ( not ( = ?auto_897758 ?auto_897769 ) ) ( not ( = ?auto_897759 ?auto_897760 ) ) ( not ( = ?auto_897759 ?auto_897761 ) ) ( not ( = ?auto_897759 ?auto_897762 ) ) ( not ( = ?auto_897759 ?auto_897763 ) ) ( not ( = ?auto_897759 ?auto_897764 ) ) ( not ( = ?auto_897759 ?auto_897765 ) ) ( not ( = ?auto_897759 ?auto_897766 ) ) ( not ( = ?auto_897759 ?auto_897767 ) ) ( not ( = ?auto_897759 ?auto_897768 ) ) ( not ( = ?auto_897759 ?auto_897769 ) ) ( not ( = ?auto_897760 ?auto_897761 ) ) ( not ( = ?auto_897760 ?auto_897762 ) ) ( not ( = ?auto_897760 ?auto_897763 ) ) ( not ( = ?auto_897760 ?auto_897764 ) ) ( not ( = ?auto_897760 ?auto_897765 ) ) ( not ( = ?auto_897760 ?auto_897766 ) ) ( not ( = ?auto_897760 ?auto_897767 ) ) ( not ( = ?auto_897760 ?auto_897768 ) ) ( not ( = ?auto_897760 ?auto_897769 ) ) ( not ( = ?auto_897761 ?auto_897762 ) ) ( not ( = ?auto_897761 ?auto_897763 ) ) ( not ( = ?auto_897761 ?auto_897764 ) ) ( not ( = ?auto_897761 ?auto_897765 ) ) ( not ( = ?auto_897761 ?auto_897766 ) ) ( not ( = ?auto_897761 ?auto_897767 ) ) ( not ( = ?auto_897761 ?auto_897768 ) ) ( not ( = ?auto_897761 ?auto_897769 ) ) ( not ( = ?auto_897762 ?auto_897763 ) ) ( not ( = ?auto_897762 ?auto_897764 ) ) ( not ( = ?auto_897762 ?auto_897765 ) ) ( not ( = ?auto_897762 ?auto_897766 ) ) ( not ( = ?auto_897762 ?auto_897767 ) ) ( not ( = ?auto_897762 ?auto_897768 ) ) ( not ( = ?auto_897762 ?auto_897769 ) ) ( not ( = ?auto_897763 ?auto_897764 ) ) ( not ( = ?auto_897763 ?auto_897765 ) ) ( not ( = ?auto_897763 ?auto_897766 ) ) ( not ( = ?auto_897763 ?auto_897767 ) ) ( not ( = ?auto_897763 ?auto_897768 ) ) ( not ( = ?auto_897763 ?auto_897769 ) ) ( not ( = ?auto_897764 ?auto_897765 ) ) ( not ( = ?auto_897764 ?auto_897766 ) ) ( not ( = ?auto_897764 ?auto_897767 ) ) ( not ( = ?auto_897764 ?auto_897768 ) ) ( not ( = ?auto_897764 ?auto_897769 ) ) ( not ( = ?auto_897765 ?auto_897766 ) ) ( not ( = ?auto_897765 ?auto_897767 ) ) ( not ( = ?auto_897765 ?auto_897768 ) ) ( not ( = ?auto_897765 ?auto_897769 ) ) ( not ( = ?auto_897766 ?auto_897767 ) ) ( not ( = ?auto_897766 ?auto_897768 ) ) ( not ( = ?auto_897766 ?auto_897769 ) ) ( not ( = ?auto_897767 ?auto_897768 ) ) ( not ( = ?auto_897767 ?auto_897769 ) ) ( not ( = ?auto_897768 ?auto_897769 ) ) ( ON ?auto_897768 ?auto_897769 ) ( ON ?auto_897767 ?auto_897768 ) ( ON ?auto_897766 ?auto_897767 ) ( ON ?auto_897765 ?auto_897766 ) ( ON ?auto_897764 ?auto_897765 ) ( ON ?auto_897763 ?auto_897764 ) ( ON ?auto_897762 ?auto_897763 ) ( ON ?auto_897761 ?auto_897762 ) ( ON ?auto_897760 ?auto_897761 ) ( ON ?auto_897759 ?auto_897760 ) ( ON ?auto_897758 ?auto_897759 ) ( ON ?auto_897757 ?auto_897758 ) ( ON ?auto_897756 ?auto_897757 ) ( CLEAR ?auto_897754 ) ( ON ?auto_897755 ?auto_897756 ) ( CLEAR ?auto_897755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_897752 ?auto_897753 ?auto_897754 ?auto_897755 )
      ( MAKE-18PILE ?auto_897752 ?auto_897753 ?auto_897754 ?auto_897755 ?auto_897756 ?auto_897757 ?auto_897758 ?auto_897759 ?auto_897760 ?auto_897761 ?auto_897762 ?auto_897763 ?auto_897764 ?auto_897765 ?auto_897766 ?auto_897767 ?auto_897768 ?auto_897769 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897788 - BLOCK
      ?auto_897789 - BLOCK
      ?auto_897790 - BLOCK
      ?auto_897791 - BLOCK
      ?auto_897792 - BLOCK
      ?auto_897793 - BLOCK
      ?auto_897794 - BLOCK
      ?auto_897795 - BLOCK
      ?auto_897796 - BLOCK
      ?auto_897797 - BLOCK
      ?auto_897798 - BLOCK
      ?auto_897799 - BLOCK
      ?auto_897800 - BLOCK
      ?auto_897801 - BLOCK
      ?auto_897802 - BLOCK
      ?auto_897803 - BLOCK
      ?auto_897804 - BLOCK
      ?auto_897805 - BLOCK
    )
    :vars
    (
      ?auto_897806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897805 ?auto_897806 ) ( ON-TABLE ?auto_897788 ) ( ON ?auto_897789 ?auto_897788 ) ( not ( = ?auto_897788 ?auto_897789 ) ) ( not ( = ?auto_897788 ?auto_897790 ) ) ( not ( = ?auto_897788 ?auto_897791 ) ) ( not ( = ?auto_897788 ?auto_897792 ) ) ( not ( = ?auto_897788 ?auto_897793 ) ) ( not ( = ?auto_897788 ?auto_897794 ) ) ( not ( = ?auto_897788 ?auto_897795 ) ) ( not ( = ?auto_897788 ?auto_897796 ) ) ( not ( = ?auto_897788 ?auto_897797 ) ) ( not ( = ?auto_897788 ?auto_897798 ) ) ( not ( = ?auto_897788 ?auto_897799 ) ) ( not ( = ?auto_897788 ?auto_897800 ) ) ( not ( = ?auto_897788 ?auto_897801 ) ) ( not ( = ?auto_897788 ?auto_897802 ) ) ( not ( = ?auto_897788 ?auto_897803 ) ) ( not ( = ?auto_897788 ?auto_897804 ) ) ( not ( = ?auto_897788 ?auto_897805 ) ) ( not ( = ?auto_897788 ?auto_897806 ) ) ( not ( = ?auto_897789 ?auto_897790 ) ) ( not ( = ?auto_897789 ?auto_897791 ) ) ( not ( = ?auto_897789 ?auto_897792 ) ) ( not ( = ?auto_897789 ?auto_897793 ) ) ( not ( = ?auto_897789 ?auto_897794 ) ) ( not ( = ?auto_897789 ?auto_897795 ) ) ( not ( = ?auto_897789 ?auto_897796 ) ) ( not ( = ?auto_897789 ?auto_897797 ) ) ( not ( = ?auto_897789 ?auto_897798 ) ) ( not ( = ?auto_897789 ?auto_897799 ) ) ( not ( = ?auto_897789 ?auto_897800 ) ) ( not ( = ?auto_897789 ?auto_897801 ) ) ( not ( = ?auto_897789 ?auto_897802 ) ) ( not ( = ?auto_897789 ?auto_897803 ) ) ( not ( = ?auto_897789 ?auto_897804 ) ) ( not ( = ?auto_897789 ?auto_897805 ) ) ( not ( = ?auto_897789 ?auto_897806 ) ) ( not ( = ?auto_897790 ?auto_897791 ) ) ( not ( = ?auto_897790 ?auto_897792 ) ) ( not ( = ?auto_897790 ?auto_897793 ) ) ( not ( = ?auto_897790 ?auto_897794 ) ) ( not ( = ?auto_897790 ?auto_897795 ) ) ( not ( = ?auto_897790 ?auto_897796 ) ) ( not ( = ?auto_897790 ?auto_897797 ) ) ( not ( = ?auto_897790 ?auto_897798 ) ) ( not ( = ?auto_897790 ?auto_897799 ) ) ( not ( = ?auto_897790 ?auto_897800 ) ) ( not ( = ?auto_897790 ?auto_897801 ) ) ( not ( = ?auto_897790 ?auto_897802 ) ) ( not ( = ?auto_897790 ?auto_897803 ) ) ( not ( = ?auto_897790 ?auto_897804 ) ) ( not ( = ?auto_897790 ?auto_897805 ) ) ( not ( = ?auto_897790 ?auto_897806 ) ) ( not ( = ?auto_897791 ?auto_897792 ) ) ( not ( = ?auto_897791 ?auto_897793 ) ) ( not ( = ?auto_897791 ?auto_897794 ) ) ( not ( = ?auto_897791 ?auto_897795 ) ) ( not ( = ?auto_897791 ?auto_897796 ) ) ( not ( = ?auto_897791 ?auto_897797 ) ) ( not ( = ?auto_897791 ?auto_897798 ) ) ( not ( = ?auto_897791 ?auto_897799 ) ) ( not ( = ?auto_897791 ?auto_897800 ) ) ( not ( = ?auto_897791 ?auto_897801 ) ) ( not ( = ?auto_897791 ?auto_897802 ) ) ( not ( = ?auto_897791 ?auto_897803 ) ) ( not ( = ?auto_897791 ?auto_897804 ) ) ( not ( = ?auto_897791 ?auto_897805 ) ) ( not ( = ?auto_897791 ?auto_897806 ) ) ( not ( = ?auto_897792 ?auto_897793 ) ) ( not ( = ?auto_897792 ?auto_897794 ) ) ( not ( = ?auto_897792 ?auto_897795 ) ) ( not ( = ?auto_897792 ?auto_897796 ) ) ( not ( = ?auto_897792 ?auto_897797 ) ) ( not ( = ?auto_897792 ?auto_897798 ) ) ( not ( = ?auto_897792 ?auto_897799 ) ) ( not ( = ?auto_897792 ?auto_897800 ) ) ( not ( = ?auto_897792 ?auto_897801 ) ) ( not ( = ?auto_897792 ?auto_897802 ) ) ( not ( = ?auto_897792 ?auto_897803 ) ) ( not ( = ?auto_897792 ?auto_897804 ) ) ( not ( = ?auto_897792 ?auto_897805 ) ) ( not ( = ?auto_897792 ?auto_897806 ) ) ( not ( = ?auto_897793 ?auto_897794 ) ) ( not ( = ?auto_897793 ?auto_897795 ) ) ( not ( = ?auto_897793 ?auto_897796 ) ) ( not ( = ?auto_897793 ?auto_897797 ) ) ( not ( = ?auto_897793 ?auto_897798 ) ) ( not ( = ?auto_897793 ?auto_897799 ) ) ( not ( = ?auto_897793 ?auto_897800 ) ) ( not ( = ?auto_897793 ?auto_897801 ) ) ( not ( = ?auto_897793 ?auto_897802 ) ) ( not ( = ?auto_897793 ?auto_897803 ) ) ( not ( = ?auto_897793 ?auto_897804 ) ) ( not ( = ?auto_897793 ?auto_897805 ) ) ( not ( = ?auto_897793 ?auto_897806 ) ) ( not ( = ?auto_897794 ?auto_897795 ) ) ( not ( = ?auto_897794 ?auto_897796 ) ) ( not ( = ?auto_897794 ?auto_897797 ) ) ( not ( = ?auto_897794 ?auto_897798 ) ) ( not ( = ?auto_897794 ?auto_897799 ) ) ( not ( = ?auto_897794 ?auto_897800 ) ) ( not ( = ?auto_897794 ?auto_897801 ) ) ( not ( = ?auto_897794 ?auto_897802 ) ) ( not ( = ?auto_897794 ?auto_897803 ) ) ( not ( = ?auto_897794 ?auto_897804 ) ) ( not ( = ?auto_897794 ?auto_897805 ) ) ( not ( = ?auto_897794 ?auto_897806 ) ) ( not ( = ?auto_897795 ?auto_897796 ) ) ( not ( = ?auto_897795 ?auto_897797 ) ) ( not ( = ?auto_897795 ?auto_897798 ) ) ( not ( = ?auto_897795 ?auto_897799 ) ) ( not ( = ?auto_897795 ?auto_897800 ) ) ( not ( = ?auto_897795 ?auto_897801 ) ) ( not ( = ?auto_897795 ?auto_897802 ) ) ( not ( = ?auto_897795 ?auto_897803 ) ) ( not ( = ?auto_897795 ?auto_897804 ) ) ( not ( = ?auto_897795 ?auto_897805 ) ) ( not ( = ?auto_897795 ?auto_897806 ) ) ( not ( = ?auto_897796 ?auto_897797 ) ) ( not ( = ?auto_897796 ?auto_897798 ) ) ( not ( = ?auto_897796 ?auto_897799 ) ) ( not ( = ?auto_897796 ?auto_897800 ) ) ( not ( = ?auto_897796 ?auto_897801 ) ) ( not ( = ?auto_897796 ?auto_897802 ) ) ( not ( = ?auto_897796 ?auto_897803 ) ) ( not ( = ?auto_897796 ?auto_897804 ) ) ( not ( = ?auto_897796 ?auto_897805 ) ) ( not ( = ?auto_897796 ?auto_897806 ) ) ( not ( = ?auto_897797 ?auto_897798 ) ) ( not ( = ?auto_897797 ?auto_897799 ) ) ( not ( = ?auto_897797 ?auto_897800 ) ) ( not ( = ?auto_897797 ?auto_897801 ) ) ( not ( = ?auto_897797 ?auto_897802 ) ) ( not ( = ?auto_897797 ?auto_897803 ) ) ( not ( = ?auto_897797 ?auto_897804 ) ) ( not ( = ?auto_897797 ?auto_897805 ) ) ( not ( = ?auto_897797 ?auto_897806 ) ) ( not ( = ?auto_897798 ?auto_897799 ) ) ( not ( = ?auto_897798 ?auto_897800 ) ) ( not ( = ?auto_897798 ?auto_897801 ) ) ( not ( = ?auto_897798 ?auto_897802 ) ) ( not ( = ?auto_897798 ?auto_897803 ) ) ( not ( = ?auto_897798 ?auto_897804 ) ) ( not ( = ?auto_897798 ?auto_897805 ) ) ( not ( = ?auto_897798 ?auto_897806 ) ) ( not ( = ?auto_897799 ?auto_897800 ) ) ( not ( = ?auto_897799 ?auto_897801 ) ) ( not ( = ?auto_897799 ?auto_897802 ) ) ( not ( = ?auto_897799 ?auto_897803 ) ) ( not ( = ?auto_897799 ?auto_897804 ) ) ( not ( = ?auto_897799 ?auto_897805 ) ) ( not ( = ?auto_897799 ?auto_897806 ) ) ( not ( = ?auto_897800 ?auto_897801 ) ) ( not ( = ?auto_897800 ?auto_897802 ) ) ( not ( = ?auto_897800 ?auto_897803 ) ) ( not ( = ?auto_897800 ?auto_897804 ) ) ( not ( = ?auto_897800 ?auto_897805 ) ) ( not ( = ?auto_897800 ?auto_897806 ) ) ( not ( = ?auto_897801 ?auto_897802 ) ) ( not ( = ?auto_897801 ?auto_897803 ) ) ( not ( = ?auto_897801 ?auto_897804 ) ) ( not ( = ?auto_897801 ?auto_897805 ) ) ( not ( = ?auto_897801 ?auto_897806 ) ) ( not ( = ?auto_897802 ?auto_897803 ) ) ( not ( = ?auto_897802 ?auto_897804 ) ) ( not ( = ?auto_897802 ?auto_897805 ) ) ( not ( = ?auto_897802 ?auto_897806 ) ) ( not ( = ?auto_897803 ?auto_897804 ) ) ( not ( = ?auto_897803 ?auto_897805 ) ) ( not ( = ?auto_897803 ?auto_897806 ) ) ( not ( = ?auto_897804 ?auto_897805 ) ) ( not ( = ?auto_897804 ?auto_897806 ) ) ( not ( = ?auto_897805 ?auto_897806 ) ) ( ON ?auto_897804 ?auto_897805 ) ( ON ?auto_897803 ?auto_897804 ) ( ON ?auto_897802 ?auto_897803 ) ( ON ?auto_897801 ?auto_897802 ) ( ON ?auto_897800 ?auto_897801 ) ( ON ?auto_897799 ?auto_897800 ) ( ON ?auto_897798 ?auto_897799 ) ( ON ?auto_897797 ?auto_897798 ) ( ON ?auto_897796 ?auto_897797 ) ( ON ?auto_897795 ?auto_897796 ) ( ON ?auto_897794 ?auto_897795 ) ( ON ?auto_897793 ?auto_897794 ) ( ON ?auto_897792 ?auto_897793 ) ( ON ?auto_897791 ?auto_897792 ) ( CLEAR ?auto_897789 ) ( ON ?auto_897790 ?auto_897791 ) ( CLEAR ?auto_897790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_897788 ?auto_897789 ?auto_897790 )
      ( MAKE-18PILE ?auto_897788 ?auto_897789 ?auto_897790 ?auto_897791 ?auto_897792 ?auto_897793 ?auto_897794 ?auto_897795 ?auto_897796 ?auto_897797 ?auto_897798 ?auto_897799 ?auto_897800 ?auto_897801 ?auto_897802 ?auto_897803 ?auto_897804 ?auto_897805 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897825 - BLOCK
      ?auto_897826 - BLOCK
      ?auto_897827 - BLOCK
      ?auto_897828 - BLOCK
      ?auto_897829 - BLOCK
      ?auto_897830 - BLOCK
      ?auto_897831 - BLOCK
      ?auto_897832 - BLOCK
      ?auto_897833 - BLOCK
      ?auto_897834 - BLOCK
      ?auto_897835 - BLOCK
      ?auto_897836 - BLOCK
      ?auto_897837 - BLOCK
      ?auto_897838 - BLOCK
      ?auto_897839 - BLOCK
      ?auto_897840 - BLOCK
      ?auto_897841 - BLOCK
      ?auto_897842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897842 ) ( ON-TABLE ?auto_897825 ) ( ON ?auto_897826 ?auto_897825 ) ( not ( = ?auto_897825 ?auto_897826 ) ) ( not ( = ?auto_897825 ?auto_897827 ) ) ( not ( = ?auto_897825 ?auto_897828 ) ) ( not ( = ?auto_897825 ?auto_897829 ) ) ( not ( = ?auto_897825 ?auto_897830 ) ) ( not ( = ?auto_897825 ?auto_897831 ) ) ( not ( = ?auto_897825 ?auto_897832 ) ) ( not ( = ?auto_897825 ?auto_897833 ) ) ( not ( = ?auto_897825 ?auto_897834 ) ) ( not ( = ?auto_897825 ?auto_897835 ) ) ( not ( = ?auto_897825 ?auto_897836 ) ) ( not ( = ?auto_897825 ?auto_897837 ) ) ( not ( = ?auto_897825 ?auto_897838 ) ) ( not ( = ?auto_897825 ?auto_897839 ) ) ( not ( = ?auto_897825 ?auto_897840 ) ) ( not ( = ?auto_897825 ?auto_897841 ) ) ( not ( = ?auto_897825 ?auto_897842 ) ) ( not ( = ?auto_897826 ?auto_897827 ) ) ( not ( = ?auto_897826 ?auto_897828 ) ) ( not ( = ?auto_897826 ?auto_897829 ) ) ( not ( = ?auto_897826 ?auto_897830 ) ) ( not ( = ?auto_897826 ?auto_897831 ) ) ( not ( = ?auto_897826 ?auto_897832 ) ) ( not ( = ?auto_897826 ?auto_897833 ) ) ( not ( = ?auto_897826 ?auto_897834 ) ) ( not ( = ?auto_897826 ?auto_897835 ) ) ( not ( = ?auto_897826 ?auto_897836 ) ) ( not ( = ?auto_897826 ?auto_897837 ) ) ( not ( = ?auto_897826 ?auto_897838 ) ) ( not ( = ?auto_897826 ?auto_897839 ) ) ( not ( = ?auto_897826 ?auto_897840 ) ) ( not ( = ?auto_897826 ?auto_897841 ) ) ( not ( = ?auto_897826 ?auto_897842 ) ) ( not ( = ?auto_897827 ?auto_897828 ) ) ( not ( = ?auto_897827 ?auto_897829 ) ) ( not ( = ?auto_897827 ?auto_897830 ) ) ( not ( = ?auto_897827 ?auto_897831 ) ) ( not ( = ?auto_897827 ?auto_897832 ) ) ( not ( = ?auto_897827 ?auto_897833 ) ) ( not ( = ?auto_897827 ?auto_897834 ) ) ( not ( = ?auto_897827 ?auto_897835 ) ) ( not ( = ?auto_897827 ?auto_897836 ) ) ( not ( = ?auto_897827 ?auto_897837 ) ) ( not ( = ?auto_897827 ?auto_897838 ) ) ( not ( = ?auto_897827 ?auto_897839 ) ) ( not ( = ?auto_897827 ?auto_897840 ) ) ( not ( = ?auto_897827 ?auto_897841 ) ) ( not ( = ?auto_897827 ?auto_897842 ) ) ( not ( = ?auto_897828 ?auto_897829 ) ) ( not ( = ?auto_897828 ?auto_897830 ) ) ( not ( = ?auto_897828 ?auto_897831 ) ) ( not ( = ?auto_897828 ?auto_897832 ) ) ( not ( = ?auto_897828 ?auto_897833 ) ) ( not ( = ?auto_897828 ?auto_897834 ) ) ( not ( = ?auto_897828 ?auto_897835 ) ) ( not ( = ?auto_897828 ?auto_897836 ) ) ( not ( = ?auto_897828 ?auto_897837 ) ) ( not ( = ?auto_897828 ?auto_897838 ) ) ( not ( = ?auto_897828 ?auto_897839 ) ) ( not ( = ?auto_897828 ?auto_897840 ) ) ( not ( = ?auto_897828 ?auto_897841 ) ) ( not ( = ?auto_897828 ?auto_897842 ) ) ( not ( = ?auto_897829 ?auto_897830 ) ) ( not ( = ?auto_897829 ?auto_897831 ) ) ( not ( = ?auto_897829 ?auto_897832 ) ) ( not ( = ?auto_897829 ?auto_897833 ) ) ( not ( = ?auto_897829 ?auto_897834 ) ) ( not ( = ?auto_897829 ?auto_897835 ) ) ( not ( = ?auto_897829 ?auto_897836 ) ) ( not ( = ?auto_897829 ?auto_897837 ) ) ( not ( = ?auto_897829 ?auto_897838 ) ) ( not ( = ?auto_897829 ?auto_897839 ) ) ( not ( = ?auto_897829 ?auto_897840 ) ) ( not ( = ?auto_897829 ?auto_897841 ) ) ( not ( = ?auto_897829 ?auto_897842 ) ) ( not ( = ?auto_897830 ?auto_897831 ) ) ( not ( = ?auto_897830 ?auto_897832 ) ) ( not ( = ?auto_897830 ?auto_897833 ) ) ( not ( = ?auto_897830 ?auto_897834 ) ) ( not ( = ?auto_897830 ?auto_897835 ) ) ( not ( = ?auto_897830 ?auto_897836 ) ) ( not ( = ?auto_897830 ?auto_897837 ) ) ( not ( = ?auto_897830 ?auto_897838 ) ) ( not ( = ?auto_897830 ?auto_897839 ) ) ( not ( = ?auto_897830 ?auto_897840 ) ) ( not ( = ?auto_897830 ?auto_897841 ) ) ( not ( = ?auto_897830 ?auto_897842 ) ) ( not ( = ?auto_897831 ?auto_897832 ) ) ( not ( = ?auto_897831 ?auto_897833 ) ) ( not ( = ?auto_897831 ?auto_897834 ) ) ( not ( = ?auto_897831 ?auto_897835 ) ) ( not ( = ?auto_897831 ?auto_897836 ) ) ( not ( = ?auto_897831 ?auto_897837 ) ) ( not ( = ?auto_897831 ?auto_897838 ) ) ( not ( = ?auto_897831 ?auto_897839 ) ) ( not ( = ?auto_897831 ?auto_897840 ) ) ( not ( = ?auto_897831 ?auto_897841 ) ) ( not ( = ?auto_897831 ?auto_897842 ) ) ( not ( = ?auto_897832 ?auto_897833 ) ) ( not ( = ?auto_897832 ?auto_897834 ) ) ( not ( = ?auto_897832 ?auto_897835 ) ) ( not ( = ?auto_897832 ?auto_897836 ) ) ( not ( = ?auto_897832 ?auto_897837 ) ) ( not ( = ?auto_897832 ?auto_897838 ) ) ( not ( = ?auto_897832 ?auto_897839 ) ) ( not ( = ?auto_897832 ?auto_897840 ) ) ( not ( = ?auto_897832 ?auto_897841 ) ) ( not ( = ?auto_897832 ?auto_897842 ) ) ( not ( = ?auto_897833 ?auto_897834 ) ) ( not ( = ?auto_897833 ?auto_897835 ) ) ( not ( = ?auto_897833 ?auto_897836 ) ) ( not ( = ?auto_897833 ?auto_897837 ) ) ( not ( = ?auto_897833 ?auto_897838 ) ) ( not ( = ?auto_897833 ?auto_897839 ) ) ( not ( = ?auto_897833 ?auto_897840 ) ) ( not ( = ?auto_897833 ?auto_897841 ) ) ( not ( = ?auto_897833 ?auto_897842 ) ) ( not ( = ?auto_897834 ?auto_897835 ) ) ( not ( = ?auto_897834 ?auto_897836 ) ) ( not ( = ?auto_897834 ?auto_897837 ) ) ( not ( = ?auto_897834 ?auto_897838 ) ) ( not ( = ?auto_897834 ?auto_897839 ) ) ( not ( = ?auto_897834 ?auto_897840 ) ) ( not ( = ?auto_897834 ?auto_897841 ) ) ( not ( = ?auto_897834 ?auto_897842 ) ) ( not ( = ?auto_897835 ?auto_897836 ) ) ( not ( = ?auto_897835 ?auto_897837 ) ) ( not ( = ?auto_897835 ?auto_897838 ) ) ( not ( = ?auto_897835 ?auto_897839 ) ) ( not ( = ?auto_897835 ?auto_897840 ) ) ( not ( = ?auto_897835 ?auto_897841 ) ) ( not ( = ?auto_897835 ?auto_897842 ) ) ( not ( = ?auto_897836 ?auto_897837 ) ) ( not ( = ?auto_897836 ?auto_897838 ) ) ( not ( = ?auto_897836 ?auto_897839 ) ) ( not ( = ?auto_897836 ?auto_897840 ) ) ( not ( = ?auto_897836 ?auto_897841 ) ) ( not ( = ?auto_897836 ?auto_897842 ) ) ( not ( = ?auto_897837 ?auto_897838 ) ) ( not ( = ?auto_897837 ?auto_897839 ) ) ( not ( = ?auto_897837 ?auto_897840 ) ) ( not ( = ?auto_897837 ?auto_897841 ) ) ( not ( = ?auto_897837 ?auto_897842 ) ) ( not ( = ?auto_897838 ?auto_897839 ) ) ( not ( = ?auto_897838 ?auto_897840 ) ) ( not ( = ?auto_897838 ?auto_897841 ) ) ( not ( = ?auto_897838 ?auto_897842 ) ) ( not ( = ?auto_897839 ?auto_897840 ) ) ( not ( = ?auto_897839 ?auto_897841 ) ) ( not ( = ?auto_897839 ?auto_897842 ) ) ( not ( = ?auto_897840 ?auto_897841 ) ) ( not ( = ?auto_897840 ?auto_897842 ) ) ( not ( = ?auto_897841 ?auto_897842 ) ) ( ON ?auto_897841 ?auto_897842 ) ( ON ?auto_897840 ?auto_897841 ) ( ON ?auto_897839 ?auto_897840 ) ( ON ?auto_897838 ?auto_897839 ) ( ON ?auto_897837 ?auto_897838 ) ( ON ?auto_897836 ?auto_897837 ) ( ON ?auto_897835 ?auto_897836 ) ( ON ?auto_897834 ?auto_897835 ) ( ON ?auto_897833 ?auto_897834 ) ( ON ?auto_897832 ?auto_897833 ) ( ON ?auto_897831 ?auto_897832 ) ( ON ?auto_897830 ?auto_897831 ) ( ON ?auto_897829 ?auto_897830 ) ( ON ?auto_897828 ?auto_897829 ) ( CLEAR ?auto_897826 ) ( ON ?auto_897827 ?auto_897828 ) ( CLEAR ?auto_897827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_897825 ?auto_897826 ?auto_897827 )
      ( MAKE-18PILE ?auto_897825 ?auto_897826 ?auto_897827 ?auto_897828 ?auto_897829 ?auto_897830 ?auto_897831 ?auto_897832 ?auto_897833 ?auto_897834 ?auto_897835 ?auto_897836 ?auto_897837 ?auto_897838 ?auto_897839 ?auto_897840 ?auto_897841 ?auto_897842 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897861 - BLOCK
      ?auto_897862 - BLOCK
      ?auto_897863 - BLOCK
      ?auto_897864 - BLOCK
      ?auto_897865 - BLOCK
      ?auto_897866 - BLOCK
      ?auto_897867 - BLOCK
      ?auto_897868 - BLOCK
      ?auto_897869 - BLOCK
      ?auto_897870 - BLOCK
      ?auto_897871 - BLOCK
      ?auto_897872 - BLOCK
      ?auto_897873 - BLOCK
      ?auto_897874 - BLOCK
      ?auto_897875 - BLOCK
      ?auto_897876 - BLOCK
      ?auto_897877 - BLOCK
      ?auto_897878 - BLOCK
    )
    :vars
    (
      ?auto_897879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897878 ?auto_897879 ) ( ON-TABLE ?auto_897861 ) ( not ( = ?auto_897861 ?auto_897862 ) ) ( not ( = ?auto_897861 ?auto_897863 ) ) ( not ( = ?auto_897861 ?auto_897864 ) ) ( not ( = ?auto_897861 ?auto_897865 ) ) ( not ( = ?auto_897861 ?auto_897866 ) ) ( not ( = ?auto_897861 ?auto_897867 ) ) ( not ( = ?auto_897861 ?auto_897868 ) ) ( not ( = ?auto_897861 ?auto_897869 ) ) ( not ( = ?auto_897861 ?auto_897870 ) ) ( not ( = ?auto_897861 ?auto_897871 ) ) ( not ( = ?auto_897861 ?auto_897872 ) ) ( not ( = ?auto_897861 ?auto_897873 ) ) ( not ( = ?auto_897861 ?auto_897874 ) ) ( not ( = ?auto_897861 ?auto_897875 ) ) ( not ( = ?auto_897861 ?auto_897876 ) ) ( not ( = ?auto_897861 ?auto_897877 ) ) ( not ( = ?auto_897861 ?auto_897878 ) ) ( not ( = ?auto_897861 ?auto_897879 ) ) ( not ( = ?auto_897862 ?auto_897863 ) ) ( not ( = ?auto_897862 ?auto_897864 ) ) ( not ( = ?auto_897862 ?auto_897865 ) ) ( not ( = ?auto_897862 ?auto_897866 ) ) ( not ( = ?auto_897862 ?auto_897867 ) ) ( not ( = ?auto_897862 ?auto_897868 ) ) ( not ( = ?auto_897862 ?auto_897869 ) ) ( not ( = ?auto_897862 ?auto_897870 ) ) ( not ( = ?auto_897862 ?auto_897871 ) ) ( not ( = ?auto_897862 ?auto_897872 ) ) ( not ( = ?auto_897862 ?auto_897873 ) ) ( not ( = ?auto_897862 ?auto_897874 ) ) ( not ( = ?auto_897862 ?auto_897875 ) ) ( not ( = ?auto_897862 ?auto_897876 ) ) ( not ( = ?auto_897862 ?auto_897877 ) ) ( not ( = ?auto_897862 ?auto_897878 ) ) ( not ( = ?auto_897862 ?auto_897879 ) ) ( not ( = ?auto_897863 ?auto_897864 ) ) ( not ( = ?auto_897863 ?auto_897865 ) ) ( not ( = ?auto_897863 ?auto_897866 ) ) ( not ( = ?auto_897863 ?auto_897867 ) ) ( not ( = ?auto_897863 ?auto_897868 ) ) ( not ( = ?auto_897863 ?auto_897869 ) ) ( not ( = ?auto_897863 ?auto_897870 ) ) ( not ( = ?auto_897863 ?auto_897871 ) ) ( not ( = ?auto_897863 ?auto_897872 ) ) ( not ( = ?auto_897863 ?auto_897873 ) ) ( not ( = ?auto_897863 ?auto_897874 ) ) ( not ( = ?auto_897863 ?auto_897875 ) ) ( not ( = ?auto_897863 ?auto_897876 ) ) ( not ( = ?auto_897863 ?auto_897877 ) ) ( not ( = ?auto_897863 ?auto_897878 ) ) ( not ( = ?auto_897863 ?auto_897879 ) ) ( not ( = ?auto_897864 ?auto_897865 ) ) ( not ( = ?auto_897864 ?auto_897866 ) ) ( not ( = ?auto_897864 ?auto_897867 ) ) ( not ( = ?auto_897864 ?auto_897868 ) ) ( not ( = ?auto_897864 ?auto_897869 ) ) ( not ( = ?auto_897864 ?auto_897870 ) ) ( not ( = ?auto_897864 ?auto_897871 ) ) ( not ( = ?auto_897864 ?auto_897872 ) ) ( not ( = ?auto_897864 ?auto_897873 ) ) ( not ( = ?auto_897864 ?auto_897874 ) ) ( not ( = ?auto_897864 ?auto_897875 ) ) ( not ( = ?auto_897864 ?auto_897876 ) ) ( not ( = ?auto_897864 ?auto_897877 ) ) ( not ( = ?auto_897864 ?auto_897878 ) ) ( not ( = ?auto_897864 ?auto_897879 ) ) ( not ( = ?auto_897865 ?auto_897866 ) ) ( not ( = ?auto_897865 ?auto_897867 ) ) ( not ( = ?auto_897865 ?auto_897868 ) ) ( not ( = ?auto_897865 ?auto_897869 ) ) ( not ( = ?auto_897865 ?auto_897870 ) ) ( not ( = ?auto_897865 ?auto_897871 ) ) ( not ( = ?auto_897865 ?auto_897872 ) ) ( not ( = ?auto_897865 ?auto_897873 ) ) ( not ( = ?auto_897865 ?auto_897874 ) ) ( not ( = ?auto_897865 ?auto_897875 ) ) ( not ( = ?auto_897865 ?auto_897876 ) ) ( not ( = ?auto_897865 ?auto_897877 ) ) ( not ( = ?auto_897865 ?auto_897878 ) ) ( not ( = ?auto_897865 ?auto_897879 ) ) ( not ( = ?auto_897866 ?auto_897867 ) ) ( not ( = ?auto_897866 ?auto_897868 ) ) ( not ( = ?auto_897866 ?auto_897869 ) ) ( not ( = ?auto_897866 ?auto_897870 ) ) ( not ( = ?auto_897866 ?auto_897871 ) ) ( not ( = ?auto_897866 ?auto_897872 ) ) ( not ( = ?auto_897866 ?auto_897873 ) ) ( not ( = ?auto_897866 ?auto_897874 ) ) ( not ( = ?auto_897866 ?auto_897875 ) ) ( not ( = ?auto_897866 ?auto_897876 ) ) ( not ( = ?auto_897866 ?auto_897877 ) ) ( not ( = ?auto_897866 ?auto_897878 ) ) ( not ( = ?auto_897866 ?auto_897879 ) ) ( not ( = ?auto_897867 ?auto_897868 ) ) ( not ( = ?auto_897867 ?auto_897869 ) ) ( not ( = ?auto_897867 ?auto_897870 ) ) ( not ( = ?auto_897867 ?auto_897871 ) ) ( not ( = ?auto_897867 ?auto_897872 ) ) ( not ( = ?auto_897867 ?auto_897873 ) ) ( not ( = ?auto_897867 ?auto_897874 ) ) ( not ( = ?auto_897867 ?auto_897875 ) ) ( not ( = ?auto_897867 ?auto_897876 ) ) ( not ( = ?auto_897867 ?auto_897877 ) ) ( not ( = ?auto_897867 ?auto_897878 ) ) ( not ( = ?auto_897867 ?auto_897879 ) ) ( not ( = ?auto_897868 ?auto_897869 ) ) ( not ( = ?auto_897868 ?auto_897870 ) ) ( not ( = ?auto_897868 ?auto_897871 ) ) ( not ( = ?auto_897868 ?auto_897872 ) ) ( not ( = ?auto_897868 ?auto_897873 ) ) ( not ( = ?auto_897868 ?auto_897874 ) ) ( not ( = ?auto_897868 ?auto_897875 ) ) ( not ( = ?auto_897868 ?auto_897876 ) ) ( not ( = ?auto_897868 ?auto_897877 ) ) ( not ( = ?auto_897868 ?auto_897878 ) ) ( not ( = ?auto_897868 ?auto_897879 ) ) ( not ( = ?auto_897869 ?auto_897870 ) ) ( not ( = ?auto_897869 ?auto_897871 ) ) ( not ( = ?auto_897869 ?auto_897872 ) ) ( not ( = ?auto_897869 ?auto_897873 ) ) ( not ( = ?auto_897869 ?auto_897874 ) ) ( not ( = ?auto_897869 ?auto_897875 ) ) ( not ( = ?auto_897869 ?auto_897876 ) ) ( not ( = ?auto_897869 ?auto_897877 ) ) ( not ( = ?auto_897869 ?auto_897878 ) ) ( not ( = ?auto_897869 ?auto_897879 ) ) ( not ( = ?auto_897870 ?auto_897871 ) ) ( not ( = ?auto_897870 ?auto_897872 ) ) ( not ( = ?auto_897870 ?auto_897873 ) ) ( not ( = ?auto_897870 ?auto_897874 ) ) ( not ( = ?auto_897870 ?auto_897875 ) ) ( not ( = ?auto_897870 ?auto_897876 ) ) ( not ( = ?auto_897870 ?auto_897877 ) ) ( not ( = ?auto_897870 ?auto_897878 ) ) ( not ( = ?auto_897870 ?auto_897879 ) ) ( not ( = ?auto_897871 ?auto_897872 ) ) ( not ( = ?auto_897871 ?auto_897873 ) ) ( not ( = ?auto_897871 ?auto_897874 ) ) ( not ( = ?auto_897871 ?auto_897875 ) ) ( not ( = ?auto_897871 ?auto_897876 ) ) ( not ( = ?auto_897871 ?auto_897877 ) ) ( not ( = ?auto_897871 ?auto_897878 ) ) ( not ( = ?auto_897871 ?auto_897879 ) ) ( not ( = ?auto_897872 ?auto_897873 ) ) ( not ( = ?auto_897872 ?auto_897874 ) ) ( not ( = ?auto_897872 ?auto_897875 ) ) ( not ( = ?auto_897872 ?auto_897876 ) ) ( not ( = ?auto_897872 ?auto_897877 ) ) ( not ( = ?auto_897872 ?auto_897878 ) ) ( not ( = ?auto_897872 ?auto_897879 ) ) ( not ( = ?auto_897873 ?auto_897874 ) ) ( not ( = ?auto_897873 ?auto_897875 ) ) ( not ( = ?auto_897873 ?auto_897876 ) ) ( not ( = ?auto_897873 ?auto_897877 ) ) ( not ( = ?auto_897873 ?auto_897878 ) ) ( not ( = ?auto_897873 ?auto_897879 ) ) ( not ( = ?auto_897874 ?auto_897875 ) ) ( not ( = ?auto_897874 ?auto_897876 ) ) ( not ( = ?auto_897874 ?auto_897877 ) ) ( not ( = ?auto_897874 ?auto_897878 ) ) ( not ( = ?auto_897874 ?auto_897879 ) ) ( not ( = ?auto_897875 ?auto_897876 ) ) ( not ( = ?auto_897875 ?auto_897877 ) ) ( not ( = ?auto_897875 ?auto_897878 ) ) ( not ( = ?auto_897875 ?auto_897879 ) ) ( not ( = ?auto_897876 ?auto_897877 ) ) ( not ( = ?auto_897876 ?auto_897878 ) ) ( not ( = ?auto_897876 ?auto_897879 ) ) ( not ( = ?auto_897877 ?auto_897878 ) ) ( not ( = ?auto_897877 ?auto_897879 ) ) ( not ( = ?auto_897878 ?auto_897879 ) ) ( ON ?auto_897877 ?auto_897878 ) ( ON ?auto_897876 ?auto_897877 ) ( ON ?auto_897875 ?auto_897876 ) ( ON ?auto_897874 ?auto_897875 ) ( ON ?auto_897873 ?auto_897874 ) ( ON ?auto_897872 ?auto_897873 ) ( ON ?auto_897871 ?auto_897872 ) ( ON ?auto_897870 ?auto_897871 ) ( ON ?auto_897869 ?auto_897870 ) ( ON ?auto_897868 ?auto_897869 ) ( ON ?auto_897867 ?auto_897868 ) ( ON ?auto_897866 ?auto_897867 ) ( ON ?auto_897865 ?auto_897866 ) ( ON ?auto_897864 ?auto_897865 ) ( ON ?auto_897863 ?auto_897864 ) ( CLEAR ?auto_897861 ) ( ON ?auto_897862 ?auto_897863 ) ( CLEAR ?auto_897862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_897861 ?auto_897862 )
      ( MAKE-18PILE ?auto_897861 ?auto_897862 ?auto_897863 ?auto_897864 ?auto_897865 ?auto_897866 ?auto_897867 ?auto_897868 ?auto_897869 ?auto_897870 ?auto_897871 ?auto_897872 ?auto_897873 ?auto_897874 ?auto_897875 ?auto_897876 ?auto_897877 ?auto_897878 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897898 - BLOCK
      ?auto_897899 - BLOCK
      ?auto_897900 - BLOCK
      ?auto_897901 - BLOCK
      ?auto_897902 - BLOCK
      ?auto_897903 - BLOCK
      ?auto_897904 - BLOCK
      ?auto_897905 - BLOCK
      ?auto_897906 - BLOCK
      ?auto_897907 - BLOCK
      ?auto_897908 - BLOCK
      ?auto_897909 - BLOCK
      ?auto_897910 - BLOCK
      ?auto_897911 - BLOCK
      ?auto_897912 - BLOCK
      ?auto_897913 - BLOCK
      ?auto_897914 - BLOCK
      ?auto_897915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897915 ) ( ON-TABLE ?auto_897898 ) ( not ( = ?auto_897898 ?auto_897899 ) ) ( not ( = ?auto_897898 ?auto_897900 ) ) ( not ( = ?auto_897898 ?auto_897901 ) ) ( not ( = ?auto_897898 ?auto_897902 ) ) ( not ( = ?auto_897898 ?auto_897903 ) ) ( not ( = ?auto_897898 ?auto_897904 ) ) ( not ( = ?auto_897898 ?auto_897905 ) ) ( not ( = ?auto_897898 ?auto_897906 ) ) ( not ( = ?auto_897898 ?auto_897907 ) ) ( not ( = ?auto_897898 ?auto_897908 ) ) ( not ( = ?auto_897898 ?auto_897909 ) ) ( not ( = ?auto_897898 ?auto_897910 ) ) ( not ( = ?auto_897898 ?auto_897911 ) ) ( not ( = ?auto_897898 ?auto_897912 ) ) ( not ( = ?auto_897898 ?auto_897913 ) ) ( not ( = ?auto_897898 ?auto_897914 ) ) ( not ( = ?auto_897898 ?auto_897915 ) ) ( not ( = ?auto_897899 ?auto_897900 ) ) ( not ( = ?auto_897899 ?auto_897901 ) ) ( not ( = ?auto_897899 ?auto_897902 ) ) ( not ( = ?auto_897899 ?auto_897903 ) ) ( not ( = ?auto_897899 ?auto_897904 ) ) ( not ( = ?auto_897899 ?auto_897905 ) ) ( not ( = ?auto_897899 ?auto_897906 ) ) ( not ( = ?auto_897899 ?auto_897907 ) ) ( not ( = ?auto_897899 ?auto_897908 ) ) ( not ( = ?auto_897899 ?auto_897909 ) ) ( not ( = ?auto_897899 ?auto_897910 ) ) ( not ( = ?auto_897899 ?auto_897911 ) ) ( not ( = ?auto_897899 ?auto_897912 ) ) ( not ( = ?auto_897899 ?auto_897913 ) ) ( not ( = ?auto_897899 ?auto_897914 ) ) ( not ( = ?auto_897899 ?auto_897915 ) ) ( not ( = ?auto_897900 ?auto_897901 ) ) ( not ( = ?auto_897900 ?auto_897902 ) ) ( not ( = ?auto_897900 ?auto_897903 ) ) ( not ( = ?auto_897900 ?auto_897904 ) ) ( not ( = ?auto_897900 ?auto_897905 ) ) ( not ( = ?auto_897900 ?auto_897906 ) ) ( not ( = ?auto_897900 ?auto_897907 ) ) ( not ( = ?auto_897900 ?auto_897908 ) ) ( not ( = ?auto_897900 ?auto_897909 ) ) ( not ( = ?auto_897900 ?auto_897910 ) ) ( not ( = ?auto_897900 ?auto_897911 ) ) ( not ( = ?auto_897900 ?auto_897912 ) ) ( not ( = ?auto_897900 ?auto_897913 ) ) ( not ( = ?auto_897900 ?auto_897914 ) ) ( not ( = ?auto_897900 ?auto_897915 ) ) ( not ( = ?auto_897901 ?auto_897902 ) ) ( not ( = ?auto_897901 ?auto_897903 ) ) ( not ( = ?auto_897901 ?auto_897904 ) ) ( not ( = ?auto_897901 ?auto_897905 ) ) ( not ( = ?auto_897901 ?auto_897906 ) ) ( not ( = ?auto_897901 ?auto_897907 ) ) ( not ( = ?auto_897901 ?auto_897908 ) ) ( not ( = ?auto_897901 ?auto_897909 ) ) ( not ( = ?auto_897901 ?auto_897910 ) ) ( not ( = ?auto_897901 ?auto_897911 ) ) ( not ( = ?auto_897901 ?auto_897912 ) ) ( not ( = ?auto_897901 ?auto_897913 ) ) ( not ( = ?auto_897901 ?auto_897914 ) ) ( not ( = ?auto_897901 ?auto_897915 ) ) ( not ( = ?auto_897902 ?auto_897903 ) ) ( not ( = ?auto_897902 ?auto_897904 ) ) ( not ( = ?auto_897902 ?auto_897905 ) ) ( not ( = ?auto_897902 ?auto_897906 ) ) ( not ( = ?auto_897902 ?auto_897907 ) ) ( not ( = ?auto_897902 ?auto_897908 ) ) ( not ( = ?auto_897902 ?auto_897909 ) ) ( not ( = ?auto_897902 ?auto_897910 ) ) ( not ( = ?auto_897902 ?auto_897911 ) ) ( not ( = ?auto_897902 ?auto_897912 ) ) ( not ( = ?auto_897902 ?auto_897913 ) ) ( not ( = ?auto_897902 ?auto_897914 ) ) ( not ( = ?auto_897902 ?auto_897915 ) ) ( not ( = ?auto_897903 ?auto_897904 ) ) ( not ( = ?auto_897903 ?auto_897905 ) ) ( not ( = ?auto_897903 ?auto_897906 ) ) ( not ( = ?auto_897903 ?auto_897907 ) ) ( not ( = ?auto_897903 ?auto_897908 ) ) ( not ( = ?auto_897903 ?auto_897909 ) ) ( not ( = ?auto_897903 ?auto_897910 ) ) ( not ( = ?auto_897903 ?auto_897911 ) ) ( not ( = ?auto_897903 ?auto_897912 ) ) ( not ( = ?auto_897903 ?auto_897913 ) ) ( not ( = ?auto_897903 ?auto_897914 ) ) ( not ( = ?auto_897903 ?auto_897915 ) ) ( not ( = ?auto_897904 ?auto_897905 ) ) ( not ( = ?auto_897904 ?auto_897906 ) ) ( not ( = ?auto_897904 ?auto_897907 ) ) ( not ( = ?auto_897904 ?auto_897908 ) ) ( not ( = ?auto_897904 ?auto_897909 ) ) ( not ( = ?auto_897904 ?auto_897910 ) ) ( not ( = ?auto_897904 ?auto_897911 ) ) ( not ( = ?auto_897904 ?auto_897912 ) ) ( not ( = ?auto_897904 ?auto_897913 ) ) ( not ( = ?auto_897904 ?auto_897914 ) ) ( not ( = ?auto_897904 ?auto_897915 ) ) ( not ( = ?auto_897905 ?auto_897906 ) ) ( not ( = ?auto_897905 ?auto_897907 ) ) ( not ( = ?auto_897905 ?auto_897908 ) ) ( not ( = ?auto_897905 ?auto_897909 ) ) ( not ( = ?auto_897905 ?auto_897910 ) ) ( not ( = ?auto_897905 ?auto_897911 ) ) ( not ( = ?auto_897905 ?auto_897912 ) ) ( not ( = ?auto_897905 ?auto_897913 ) ) ( not ( = ?auto_897905 ?auto_897914 ) ) ( not ( = ?auto_897905 ?auto_897915 ) ) ( not ( = ?auto_897906 ?auto_897907 ) ) ( not ( = ?auto_897906 ?auto_897908 ) ) ( not ( = ?auto_897906 ?auto_897909 ) ) ( not ( = ?auto_897906 ?auto_897910 ) ) ( not ( = ?auto_897906 ?auto_897911 ) ) ( not ( = ?auto_897906 ?auto_897912 ) ) ( not ( = ?auto_897906 ?auto_897913 ) ) ( not ( = ?auto_897906 ?auto_897914 ) ) ( not ( = ?auto_897906 ?auto_897915 ) ) ( not ( = ?auto_897907 ?auto_897908 ) ) ( not ( = ?auto_897907 ?auto_897909 ) ) ( not ( = ?auto_897907 ?auto_897910 ) ) ( not ( = ?auto_897907 ?auto_897911 ) ) ( not ( = ?auto_897907 ?auto_897912 ) ) ( not ( = ?auto_897907 ?auto_897913 ) ) ( not ( = ?auto_897907 ?auto_897914 ) ) ( not ( = ?auto_897907 ?auto_897915 ) ) ( not ( = ?auto_897908 ?auto_897909 ) ) ( not ( = ?auto_897908 ?auto_897910 ) ) ( not ( = ?auto_897908 ?auto_897911 ) ) ( not ( = ?auto_897908 ?auto_897912 ) ) ( not ( = ?auto_897908 ?auto_897913 ) ) ( not ( = ?auto_897908 ?auto_897914 ) ) ( not ( = ?auto_897908 ?auto_897915 ) ) ( not ( = ?auto_897909 ?auto_897910 ) ) ( not ( = ?auto_897909 ?auto_897911 ) ) ( not ( = ?auto_897909 ?auto_897912 ) ) ( not ( = ?auto_897909 ?auto_897913 ) ) ( not ( = ?auto_897909 ?auto_897914 ) ) ( not ( = ?auto_897909 ?auto_897915 ) ) ( not ( = ?auto_897910 ?auto_897911 ) ) ( not ( = ?auto_897910 ?auto_897912 ) ) ( not ( = ?auto_897910 ?auto_897913 ) ) ( not ( = ?auto_897910 ?auto_897914 ) ) ( not ( = ?auto_897910 ?auto_897915 ) ) ( not ( = ?auto_897911 ?auto_897912 ) ) ( not ( = ?auto_897911 ?auto_897913 ) ) ( not ( = ?auto_897911 ?auto_897914 ) ) ( not ( = ?auto_897911 ?auto_897915 ) ) ( not ( = ?auto_897912 ?auto_897913 ) ) ( not ( = ?auto_897912 ?auto_897914 ) ) ( not ( = ?auto_897912 ?auto_897915 ) ) ( not ( = ?auto_897913 ?auto_897914 ) ) ( not ( = ?auto_897913 ?auto_897915 ) ) ( not ( = ?auto_897914 ?auto_897915 ) ) ( ON ?auto_897914 ?auto_897915 ) ( ON ?auto_897913 ?auto_897914 ) ( ON ?auto_897912 ?auto_897913 ) ( ON ?auto_897911 ?auto_897912 ) ( ON ?auto_897910 ?auto_897911 ) ( ON ?auto_897909 ?auto_897910 ) ( ON ?auto_897908 ?auto_897909 ) ( ON ?auto_897907 ?auto_897908 ) ( ON ?auto_897906 ?auto_897907 ) ( ON ?auto_897905 ?auto_897906 ) ( ON ?auto_897904 ?auto_897905 ) ( ON ?auto_897903 ?auto_897904 ) ( ON ?auto_897902 ?auto_897903 ) ( ON ?auto_897901 ?auto_897902 ) ( ON ?auto_897900 ?auto_897901 ) ( CLEAR ?auto_897898 ) ( ON ?auto_897899 ?auto_897900 ) ( CLEAR ?auto_897899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_897898 ?auto_897899 )
      ( MAKE-18PILE ?auto_897898 ?auto_897899 ?auto_897900 ?auto_897901 ?auto_897902 ?auto_897903 ?auto_897904 ?auto_897905 ?auto_897906 ?auto_897907 ?auto_897908 ?auto_897909 ?auto_897910 ?auto_897911 ?auto_897912 ?auto_897913 ?auto_897914 ?auto_897915 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897934 - BLOCK
      ?auto_897935 - BLOCK
      ?auto_897936 - BLOCK
      ?auto_897937 - BLOCK
      ?auto_897938 - BLOCK
      ?auto_897939 - BLOCK
      ?auto_897940 - BLOCK
      ?auto_897941 - BLOCK
      ?auto_897942 - BLOCK
      ?auto_897943 - BLOCK
      ?auto_897944 - BLOCK
      ?auto_897945 - BLOCK
      ?auto_897946 - BLOCK
      ?auto_897947 - BLOCK
      ?auto_897948 - BLOCK
      ?auto_897949 - BLOCK
      ?auto_897950 - BLOCK
      ?auto_897951 - BLOCK
    )
    :vars
    (
      ?auto_897952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_897951 ?auto_897952 ) ( not ( = ?auto_897934 ?auto_897935 ) ) ( not ( = ?auto_897934 ?auto_897936 ) ) ( not ( = ?auto_897934 ?auto_897937 ) ) ( not ( = ?auto_897934 ?auto_897938 ) ) ( not ( = ?auto_897934 ?auto_897939 ) ) ( not ( = ?auto_897934 ?auto_897940 ) ) ( not ( = ?auto_897934 ?auto_897941 ) ) ( not ( = ?auto_897934 ?auto_897942 ) ) ( not ( = ?auto_897934 ?auto_897943 ) ) ( not ( = ?auto_897934 ?auto_897944 ) ) ( not ( = ?auto_897934 ?auto_897945 ) ) ( not ( = ?auto_897934 ?auto_897946 ) ) ( not ( = ?auto_897934 ?auto_897947 ) ) ( not ( = ?auto_897934 ?auto_897948 ) ) ( not ( = ?auto_897934 ?auto_897949 ) ) ( not ( = ?auto_897934 ?auto_897950 ) ) ( not ( = ?auto_897934 ?auto_897951 ) ) ( not ( = ?auto_897934 ?auto_897952 ) ) ( not ( = ?auto_897935 ?auto_897936 ) ) ( not ( = ?auto_897935 ?auto_897937 ) ) ( not ( = ?auto_897935 ?auto_897938 ) ) ( not ( = ?auto_897935 ?auto_897939 ) ) ( not ( = ?auto_897935 ?auto_897940 ) ) ( not ( = ?auto_897935 ?auto_897941 ) ) ( not ( = ?auto_897935 ?auto_897942 ) ) ( not ( = ?auto_897935 ?auto_897943 ) ) ( not ( = ?auto_897935 ?auto_897944 ) ) ( not ( = ?auto_897935 ?auto_897945 ) ) ( not ( = ?auto_897935 ?auto_897946 ) ) ( not ( = ?auto_897935 ?auto_897947 ) ) ( not ( = ?auto_897935 ?auto_897948 ) ) ( not ( = ?auto_897935 ?auto_897949 ) ) ( not ( = ?auto_897935 ?auto_897950 ) ) ( not ( = ?auto_897935 ?auto_897951 ) ) ( not ( = ?auto_897935 ?auto_897952 ) ) ( not ( = ?auto_897936 ?auto_897937 ) ) ( not ( = ?auto_897936 ?auto_897938 ) ) ( not ( = ?auto_897936 ?auto_897939 ) ) ( not ( = ?auto_897936 ?auto_897940 ) ) ( not ( = ?auto_897936 ?auto_897941 ) ) ( not ( = ?auto_897936 ?auto_897942 ) ) ( not ( = ?auto_897936 ?auto_897943 ) ) ( not ( = ?auto_897936 ?auto_897944 ) ) ( not ( = ?auto_897936 ?auto_897945 ) ) ( not ( = ?auto_897936 ?auto_897946 ) ) ( not ( = ?auto_897936 ?auto_897947 ) ) ( not ( = ?auto_897936 ?auto_897948 ) ) ( not ( = ?auto_897936 ?auto_897949 ) ) ( not ( = ?auto_897936 ?auto_897950 ) ) ( not ( = ?auto_897936 ?auto_897951 ) ) ( not ( = ?auto_897936 ?auto_897952 ) ) ( not ( = ?auto_897937 ?auto_897938 ) ) ( not ( = ?auto_897937 ?auto_897939 ) ) ( not ( = ?auto_897937 ?auto_897940 ) ) ( not ( = ?auto_897937 ?auto_897941 ) ) ( not ( = ?auto_897937 ?auto_897942 ) ) ( not ( = ?auto_897937 ?auto_897943 ) ) ( not ( = ?auto_897937 ?auto_897944 ) ) ( not ( = ?auto_897937 ?auto_897945 ) ) ( not ( = ?auto_897937 ?auto_897946 ) ) ( not ( = ?auto_897937 ?auto_897947 ) ) ( not ( = ?auto_897937 ?auto_897948 ) ) ( not ( = ?auto_897937 ?auto_897949 ) ) ( not ( = ?auto_897937 ?auto_897950 ) ) ( not ( = ?auto_897937 ?auto_897951 ) ) ( not ( = ?auto_897937 ?auto_897952 ) ) ( not ( = ?auto_897938 ?auto_897939 ) ) ( not ( = ?auto_897938 ?auto_897940 ) ) ( not ( = ?auto_897938 ?auto_897941 ) ) ( not ( = ?auto_897938 ?auto_897942 ) ) ( not ( = ?auto_897938 ?auto_897943 ) ) ( not ( = ?auto_897938 ?auto_897944 ) ) ( not ( = ?auto_897938 ?auto_897945 ) ) ( not ( = ?auto_897938 ?auto_897946 ) ) ( not ( = ?auto_897938 ?auto_897947 ) ) ( not ( = ?auto_897938 ?auto_897948 ) ) ( not ( = ?auto_897938 ?auto_897949 ) ) ( not ( = ?auto_897938 ?auto_897950 ) ) ( not ( = ?auto_897938 ?auto_897951 ) ) ( not ( = ?auto_897938 ?auto_897952 ) ) ( not ( = ?auto_897939 ?auto_897940 ) ) ( not ( = ?auto_897939 ?auto_897941 ) ) ( not ( = ?auto_897939 ?auto_897942 ) ) ( not ( = ?auto_897939 ?auto_897943 ) ) ( not ( = ?auto_897939 ?auto_897944 ) ) ( not ( = ?auto_897939 ?auto_897945 ) ) ( not ( = ?auto_897939 ?auto_897946 ) ) ( not ( = ?auto_897939 ?auto_897947 ) ) ( not ( = ?auto_897939 ?auto_897948 ) ) ( not ( = ?auto_897939 ?auto_897949 ) ) ( not ( = ?auto_897939 ?auto_897950 ) ) ( not ( = ?auto_897939 ?auto_897951 ) ) ( not ( = ?auto_897939 ?auto_897952 ) ) ( not ( = ?auto_897940 ?auto_897941 ) ) ( not ( = ?auto_897940 ?auto_897942 ) ) ( not ( = ?auto_897940 ?auto_897943 ) ) ( not ( = ?auto_897940 ?auto_897944 ) ) ( not ( = ?auto_897940 ?auto_897945 ) ) ( not ( = ?auto_897940 ?auto_897946 ) ) ( not ( = ?auto_897940 ?auto_897947 ) ) ( not ( = ?auto_897940 ?auto_897948 ) ) ( not ( = ?auto_897940 ?auto_897949 ) ) ( not ( = ?auto_897940 ?auto_897950 ) ) ( not ( = ?auto_897940 ?auto_897951 ) ) ( not ( = ?auto_897940 ?auto_897952 ) ) ( not ( = ?auto_897941 ?auto_897942 ) ) ( not ( = ?auto_897941 ?auto_897943 ) ) ( not ( = ?auto_897941 ?auto_897944 ) ) ( not ( = ?auto_897941 ?auto_897945 ) ) ( not ( = ?auto_897941 ?auto_897946 ) ) ( not ( = ?auto_897941 ?auto_897947 ) ) ( not ( = ?auto_897941 ?auto_897948 ) ) ( not ( = ?auto_897941 ?auto_897949 ) ) ( not ( = ?auto_897941 ?auto_897950 ) ) ( not ( = ?auto_897941 ?auto_897951 ) ) ( not ( = ?auto_897941 ?auto_897952 ) ) ( not ( = ?auto_897942 ?auto_897943 ) ) ( not ( = ?auto_897942 ?auto_897944 ) ) ( not ( = ?auto_897942 ?auto_897945 ) ) ( not ( = ?auto_897942 ?auto_897946 ) ) ( not ( = ?auto_897942 ?auto_897947 ) ) ( not ( = ?auto_897942 ?auto_897948 ) ) ( not ( = ?auto_897942 ?auto_897949 ) ) ( not ( = ?auto_897942 ?auto_897950 ) ) ( not ( = ?auto_897942 ?auto_897951 ) ) ( not ( = ?auto_897942 ?auto_897952 ) ) ( not ( = ?auto_897943 ?auto_897944 ) ) ( not ( = ?auto_897943 ?auto_897945 ) ) ( not ( = ?auto_897943 ?auto_897946 ) ) ( not ( = ?auto_897943 ?auto_897947 ) ) ( not ( = ?auto_897943 ?auto_897948 ) ) ( not ( = ?auto_897943 ?auto_897949 ) ) ( not ( = ?auto_897943 ?auto_897950 ) ) ( not ( = ?auto_897943 ?auto_897951 ) ) ( not ( = ?auto_897943 ?auto_897952 ) ) ( not ( = ?auto_897944 ?auto_897945 ) ) ( not ( = ?auto_897944 ?auto_897946 ) ) ( not ( = ?auto_897944 ?auto_897947 ) ) ( not ( = ?auto_897944 ?auto_897948 ) ) ( not ( = ?auto_897944 ?auto_897949 ) ) ( not ( = ?auto_897944 ?auto_897950 ) ) ( not ( = ?auto_897944 ?auto_897951 ) ) ( not ( = ?auto_897944 ?auto_897952 ) ) ( not ( = ?auto_897945 ?auto_897946 ) ) ( not ( = ?auto_897945 ?auto_897947 ) ) ( not ( = ?auto_897945 ?auto_897948 ) ) ( not ( = ?auto_897945 ?auto_897949 ) ) ( not ( = ?auto_897945 ?auto_897950 ) ) ( not ( = ?auto_897945 ?auto_897951 ) ) ( not ( = ?auto_897945 ?auto_897952 ) ) ( not ( = ?auto_897946 ?auto_897947 ) ) ( not ( = ?auto_897946 ?auto_897948 ) ) ( not ( = ?auto_897946 ?auto_897949 ) ) ( not ( = ?auto_897946 ?auto_897950 ) ) ( not ( = ?auto_897946 ?auto_897951 ) ) ( not ( = ?auto_897946 ?auto_897952 ) ) ( not ( = ?auto_897947 ?auto_897948 ) ) ( not ( = ?auto_897947 ?auto_897949 ) ) ( not ( = ?auto_897947 ?auto_897950 ) ) ( not ( = ?auto_897947 ?auto_897951 ) ) ( not ( = ?auto_897947 ?auto_897952 ) ) ( not ( = ?auto_897948 ?auto_897949 ) ) ( not ( = ?auto_897948 ?auto_897950 ) ) ( not ( = ?auto_897948 ?auto_897951 ) ) ( not ( = ?auto_897948 ?auto_897952 ) ) ( not ( = ?auto_897949 ?auto_897950 ) ) ( not ( = ?auto_897949 ?auto_897951 ) ) ( not ( = ?auto_897949 ?auto_897952 ) ) ( not ( = ?auto_897950 ?auto_897951 ) ) ( not ( = ?auto_897950 ?auto_897952 ) ) ( not ( = ?auto_897951 ?auto_897952 ) ) ( ON ?auto_897950 ?auto_897951 ) ( ON ?auto_897949 ?auto_897950 ) ( ON ?auto_897948 ?auto_897949 ) ( ON ?auto_897947 ?auto_897948 ) ( ON ?auto_897946 ?auto_897947 ) ( ON ?auto_897945 ?auto_897946 ) ( ON ?auto_897944 ?auto_897945 ) ( ON ?auto_897943 ?auto_897944 ) ( ON ?auto_897942 ?auto_897943 ) ( ON ?auto_897941 ?auto_897942 ) ( ON ?auto_897940 ?auto_897941 ) ( ON ?auto_897939 ?auto_897940 ) ( ON ?auto_897938 ?auto_897939 ) ( ON ?auto_897937 ?auto_897938 ) ( ON ?auto_897936 ?auto_897937 ) ( ON ?auto_897935 ?auto_897936 ) ( ON ?auto_897934 ?auto_897935 ) ( CLEAR ?auto_897934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_897934 )
      ( MAKE-18PILE ?auto_897934 ?auto_897935 ?auto_897936 ?auto_897937 ?auto_897938 ?auto_897939 ?auto_897940 ?auto_897941 ?auto_897942 ?auto_897943 ?auto_897944 ?auto_897945 ?auto_897946 ?auto_897947 ?auto_897948 ?auto_897949 ?auto_897950 ?auto_897951 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_897971 - BLOCK
      ?auto_897972 - BLOCK
      ?auto_897973 - BLOCK
      ?auto_897974 - BLOCK
      ?auto_897975 - BLOCK
      ?auto_897976 - BLOCK
      ?auto_897977 - BLOCK
      ?auto_897978 - BLOCK
      ?auto_897979 - BLOCK
      ?auto_897980 - BLOCK
      ?auto_897981 - BLOCK
      ?auto_897982 - BLOCK
      ?auto_897983 - BLOCK
      ?auto_897984 - BLOCK
      ?auto_897985 - BLOCK
      ?auto_897986 - BLOCK
      ?auto_897987 - BLOCK
      ?auto_897988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_897988 ) ( not ( = ?auto_897971 ?auto_897972 ) ) ( not ( = ?auto_897971 ?auto_897973 ) ) ( not ( = ?auto_897971 ?auto_897974 ) ) ( not ( = ?auto_897971 ?auto_897975 ) ) ( not ( = ?auto_897971 ?auto_897976 ) ) ( not ( = ?auto_897971 ?auto_897977 ) ) ( not ( = ?auto_897971 ?auto_897978 ) ) ( not ( = ?auto_897971 ?auto_897979 ) ) ( not ( = ?auto_897971 ?auto_897980 ) ) ( not ( = ?auto_897971 ?auto_897981 ) ) ( not ( = ?auto_897971 ?auto_897982 ) ) ( not ( = ?auto_897971 ?auto_897983 ) ) ( not ( = ?auto_897971 ?auto_897984 ) ) ( not ( = ?auto_897971 ?auto_897985 ) ) ( not ( = ?auto_897971 ?auto_897986 ) ) ( not ( = ?auto_897971 ?auto_897987 ) ) ( not ( = ?auto_897971 ?auto_897988 ) ) ( not ( = ?auto_897972 ?auto_897973 ) ) ( not ( = ?auto_897972 ?auto_897974 ) ) ( not ( = ?auto_897972 ?auto_897975 ) ) ( not ( = ?auto_897972 ?auto_897976 ) ) ( not ( = ?auto_897972 ?auto_897977 ) ) ( not ( = ?auto_897972 ?auto_897978 ) ) ( not ( = ?auto_897972 ?auto_897979 ) ) ( not ( = ?auto_897972 ?auto_897980 ) ) ( not ( = ?auto_897972 ?auto_897981 ) ) ( not ( = ?auto_897972 ?auto_897982 ) ) ( not ( = ?auto_897972 ?auto_897983 ) ) ( not ( = ?auto_897972 ?auto_897984 ) ) ( not ( = ?auto_897972 ?auto_897985 ) ) ( not ( = ?auto_897972 ?auto_897986 ) ) ( not ( = ?auto_897972 ?auto_897987 ) ) ( not ( = ?auto_897972 ?auto_897988 ) ) ( not ( = ?auto_897973 ?auto_897974 ) ) ( not ( = ?auto_897973 ?auto_897975 ) ) ( not ( = ?auto_897973 ?auto_897976 ) ) ( not ( = ?auto_897973 ?auto_897977 ) ) ( not ( = ?auto_897973 ?auto_897978 ) ) ( not ( = ?auto_897973 ?auto_897979 ) ) ( not ( = ?auto_897973 ?auto_897980 ) ) ( not ( = ?auto_897973 ?auto_897981 ) ) ( not ( = ?auto_897973 ?auto_897982 ) ) ( not ( = ?auto_897973 ?auto_897983 ) ) ( not ( = ?auto_897973 ?auto_897984 ) ) ( not ( = ?auto_897973 ?auto_897985 ) ) ( not ( = ?auto_897973 ?auto_897986 ) ) ( not ( = ?auto_897973 ?auto_897987 ) ) ( not ( = ?auto_897973 ?auto_897988 ) ) ( not ( = ?auto_897974 ?auto_897975 ) ) ( not ( = ?auto_897974 ?auto_897976 ) ) ( not ( = ?auto_897974 ?auto_897977 ) ) ( not ( = ?auto_897974 ?auto_897978 ) ) ( not ( = ?auto_897974 ?auto_897979 ) ) ( not ( = ?auto_897974 ?auto_897980 ) ) ( not ( = ?auto_897974 ?auto_897981 ) ) ( not ( = ?auto_897974 ?auto_897982 ) ) ( not ( = ?auto_897974 ?auto_897983 ) ) ( not ( = ?auto_897974 ?auto_897984 ) ) ( not ( = ?auto_897974 ?auto_897985 ) ) ( not ( = ?auto_897974 ?auto_897986 ) ) ( not ( = ?auto_897974 ?auto_897987 ) ) ( not ( = ?auto_897974 ?auto_897988 ) ) ( not ( = ?auto_897975 ?auto_897976 ) ) ( not ( = ?auto_897975 ?auto_897977 ) ) ( not ( = ?auto_897975 ?auto_897978 ) ) ( not ( = ?auto_897975 ?auto_897979 ) ) ( not ( = ?auto_897975 ?auto_897980 ) ) ( not ( = ?auto_897975 ?auto_897981 ) ) ( not ( = ?auto_897975 ?auto_897982 ) ) ( not ( = ?auto_897975 ?auto_897983 ) ) ( not ( = ?auto_897975 ?auto_897984 ) ) ( not ( = ?auto_897975 ?auto_897985 ) ) ( not ( = ?auto_897975 ?auto_897986 ) ) ( not ( = ?auto_897975 ?auto_897987 ) ) ( not ( = ?auto_897975 ?auto_897988 ) ) ( not ( = ?auto_897976 ?auto_897977 ) ) ( not ( = ?auto_897976 ?auto_897978 ) ) ( not ( = ?auto_897976 ?auto_897979 ) ) ( not ( = ?auto_897976 ?auto_897980 ) ) ( not ( = ?auto_897976 ?auto_897981 ) ) ( not ( = ?auto_897976 ?auto_897982 ) ) ( not ( = ?auto_897976 ?auto_897983 ) ) ( not ( = ?auto_897976 ?auto_897984 ) ) ( not ( = ?auto_897976 ?auto_897985 ) ) ( not ( = ?auto_897976 ?auto_897986 ) ) ( not ( = ?auto_897976 ?auto_897987 ) ) ( not ( = ?auto_897976 ?auto_897988 ) ) ( not ( = ?auto_897977 ?auto_897978 ) ) ( not ( = ?auto_897977 ?auto_897979 ) ) ( not ( = ?auto_897977 ?auto_897980 ) ) ( not ( = ?auto_897977 ?auto_897981 ) ) ( not ( = ?auto_897977 ?auto_897982 ) ) ( not ( = ?auto_897977 ?auto_897983 ) ) ( not ( = ?auto_897977 ?auto_897984 ) ) ( not ( = ?auto_897977 ?auto_897985 ) ) ( not ( = ?auto_897977 ?auto_897986 ) ) ( not ( = ?auto_897977 ?auto_897987 ) ) ( not ( = ?auto_897977 ?auto_897988 ) ) ( not ( = ?auto_897978 ?auto_897979 ) ) ( not ( = ?auto_897978 ?auto_897980 ) ) ( not ( = ?auto_897978 ?auto_897981 ) ) ( not ( = ?auto_897978 ?auto_897982 ) ) ( not ( = ?auto_897978 ?auto_897983 ) ) ( not ( = ?auto_897978 ?auto_897984 ) ) ( not ( = ?auto_897978 ?auto_897985 ) ) ( not ( = ?auto_897978 ?auto_897986 ) ) ( not ( = ?auto_897978 ?auto_897987 ) ) ( not ( = ?auto_897978 ?auto_897988 ) ) ( not ( = ?auto_897979 ?auto_897980 ) ) ( not ( = ?auto_897979 ?auto_897981 ) ) ( not ( = ?auto_897979 ?auto_897982 ) ) ( not ( = ?auto_897979 ?auto_897983 ) ) ( not ( = ?auto_897979 ?auto_897984 ) ) ( not ( = ?auto_897979 ?auto_897985 ) ) ( not ( = ?auto_897979 ?auto_897986 ) ) ( not ( = ?auto_897979 ?auto_897987 ) ) ( not ( = ?auto_897979 ?auto_897988 ) ) ( not ( = ?auto_897980 ?auto_897981 ) ) ( not ( = ?auto_897980 ?auto_897982 ) ) ( not ( = ?auto_897980 ?auto_897983 ) ) ( not ( = ?auto_897980 ?auto_897984 ) ) ( not ( = ?auto_897980 ?auto_897985 ) ) ( not ( = ?auto_897980 ?auto_897986 ) ) ( not ( = ?auto_897980 ?auto_897987 ) ) ( not ( = ?auto_897980 ?auto_897988 ) ) ( not ( = ?auto_897981 ?auto_897982 ) ) ( not ( = ?auto_897981 ?auto_897983 ) ) ( not ( = ?auto_897981 ?auto_897984 ) ) ( not ( = ?auto_897981 ?auto_897985 ) ) ( not ( = ?auto_897981 ?auto_897986 ) ) ( not ( = ?auto_897981 ?auto_897987 ) ) ( not ( = ?auto_897981 ?auto_897988 ) ) ( not ( = ?auto_897982 ?auto_897983 ) ) ( not ( = ?auto_897982 ?auto_897984 ) ) ( not ( = ?auto_897982 ?auto_897985 ) ) ( not ( = ?auto_897982 ?auto_897986 ) ) ( not ( = ?auto_897982 ?auto_897987 ) ) ( not ( = ?auto_897982 ?auto_897988 ) ) ( not ( = ?auto_897983 ?auto_897984 ) ) ( not ( = ?auto_897983 ?auto_897985 ) ) ( not ( = ?auto_897983 ?auto_897986 ) ) ( not ( = ?auto_897983 ?auto_897987 ) ) ( not ( = ?auto_897983 ?auto_897988 ) ) ( not ( = ?auto_897984 ?auto_897985 ) ) ( not ( = ?auto_897984 ?auto_897986 ) ) ( not ( = ?auto_897984 ?auto_897987 ) ) ( not ( = ?auto_897984 ?auto_897988 ) ) ( not ( = ?auto_897985 ?auto_897986 ) ) ( not ( = ?auto_897985 ?auto_897987 ) ) ( not ( = ?auto_897985 ?auto_897988 ) ) ( not ( = ?auto_897986 ?auto_897987 ) ) ( not ( = ?auto_897986 ?auto_897988 ) ) ( not ( = ?auto_897987 ?auto_897988 ) ) ( ON ?auto_897987 ?auto_897988 ) ( ON ?auto_897986 ?auto_897987 ) ( ON ?auto_897985 ?auto_897986 ) ( ON ?auto_897984 ?auto_897985 ) ( ON ?auto_897983 ?auto_897984 ) ( ON ?auto_897982 ?auto_897983 ) ( ON ?auto_897981 ?auto_897982 ) ( ON ?auto_897980 ?auto_897981 ) ( ON ?auto_897979 ?auto_897980 ) ( ON ?auto_897978 ?auto_897979 ) ( ON ?auto_897977 ?auto_897978 ) ( ON ?auto_897976 ?auto_897977 ) ( ON ?auto_897975 ?auto_897976 ) ( ON ?auto_897974 ?auto_897975 ) ( ON ?auto_897973 ?auto_897974 ) ( ON ?auto_897972 ?auto_897973 ) ( ON ?auto_897971 ?auto_897972 ) ( CLEAR ?auto_897971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_897971 )
      ( MAKE-18PILE ?auto_897971 ?auto_897972 ?auto_897973 ?auto_897974 ?auto_897975 ?auto_897976 ?auto_897977 ?auto_897978 ?auto_897979 ?auto_897980 ?auto_897981 ?auto_897982 ?auto_897983 ?auto_897984 ?auto_897985 ?auto_897986 ?auto_897987 ?auto_897988 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_898007 - BLOCK
      ?auto_898008 - BLOCK
      ?auto_898009 - BLOCK
      ?auto_898010 - BLOCK
      ?auto_898011 - BLOCK
      ?auto_898012 - BLOCK
      ?auto_898013 - BLOCK
      ?auto_898014 - BLOCK
      ?auto_898015 - BLOCK
      ?auto_898016 - BLOCK
      ?auto_898017 - BLOCK
      ?auto_898018 - BLOCK
      ?auto_898019 - BLOCK
      ?auto_898020 - BLOCK
      ?auto_898021 - BLOCK
      ?auto_898022 - BLOCK
      ?auto_898023 - BLOCK
      ?auto_898024 - BLOCK
    )
    :vars
    (
      ?auto_898025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_898007 ?auto_898008 ) ) ( not ( = ?auto_898007 ?auto_898009 ) ) ( not ( = ?auto_898007 ?auto_898010 ) ) ( not ( = ?auto_898007 ?auto_898011 ) ) ( not ( = ?auto_898007 ?auto_898012 ) ) ( not ( = ?auto_898007 ?auto_898013 ) ) ( not ( = ?auto_898007 ?auto_898014 ) ) ( not ( = ?auto_898007 ?auto_898015 ) ) ( not ( = ?auto_898007 ?auto_898016 ) ) ( not ( = ?auto_898007 ?auto_898017 ) ) ( not ( = ?auto_898007 ?auto_898018 ) ) ( not ( = ?auto_898007 ?auto_898019 ) ) ( not ( = ?auto_898007 ?auto_898020 ) ) ( not ( = ?auto_898007 ?auto_898021 ) ) ( not ( = ?auto_898007 ?auto_898022 ) ) ( not ( = ?auto_898007 ?auto_898023 ) ) ( not ( = ?auto_898007 ?auto_898024 ) ) ( not ( = ?auto_898008 ?auto_898009 ) ) ( not ( = ?auto_898008 ?auto_898010 ) ) ( not ( = ?auto_898008 ?auto_898011 ) ) ( not ( = ?auto_898008 ?auto_898012 ) ) ( not ( = ?auto_898008 ?auto_898013 ) ) ( not ( = ?auto_898008 ?auto_898014 ) ) ( not ( = ?auto_898008 ?auto_898015 ) ) ( not ( = ?auto_898008 ?auto_898016 ) ) ( not ( = ?auto_898008 ?auto_898017 ) ) ( not ( = ?auto_898008 ?auto_898018 ) ) ( not ( = ?auto_898008 ?auto_898019 ) ) ( not ( = ?auto_898008 ?auto_898020 ) ) ( not ( = ?auto_898008 ?auto_898021 ) ) ( not ( = ?auto_898008 ?auto_898022 ) ) ( not ( = ?auto_898008 ?auto_898023 ) ) ( not ( = ?auto_898008 ?auto_898024 ) ) ( not ( = ?auto_898009 ?auto_898010 ) ) ( not ( = ?auto_898009 ?auto_898011 ) ) ( not ( = ?auto_898009 ?auto_898012 ) ) ( not ( = ?auto_898009 ?auto_898013 ) ) ( not ( = ?auto_898009 ?auto_898014 ) ) ( not ( = ?auto_898009 ?auto_898015 ) ) ( not ( = ?auto_898009 ?auto_898016 ) ) ( not ( = ?auto_898009 ?auto_898017 ) ) ( not ( = ?auto_898009 ?auto_898018 ) ) ( not ( = ?auto_898009 ?auto_898019 ) ) ( not ( = ?auto_898009 ?auto_898020 ) ) ( not ( = ?auto_898009 ?auto_898021 ) ) ( not ( = ?auto_898009 ?auto_898022 ) ) ( not ( = ?auto_898009 ?auto_898023 ) ) ( not ( = ?auto_898009 ?auto_898024 ) ) ( not ( = ?auto_898010 ?auto_898011 ) ) ( not ( = ?auto_898010 ?auto_898012 ) ) ( not ( = ?auto_898010 ?auto_898013 ) ) ( not ( = ?auto_898010 ?auto_898014 ) ) ( not ( = ?auto_898010 ?auto_898015 ) ) ( not ( = ?auto_898010 ?auto_898016 ) ) ( not ( = ?auto_898010 ?auto_898017 ) ) ( not ( = ?auto_898010 ?auto_898018 ) ) ( not ( = ?auto_898010 ?auto_898019 ) ) ( not ( = ?auto_898010 ?auto_898020 ) ) ( not ( = ?auto_898010 ?auto_898021 ) ) ( not ( = ?auto_898010 ?auto_898022 ) ) ( not ( = ?auto_898010 ?auto_898023 ) ) ( not ( = ?auto_898010 ?auto_898024 ) ) ( not ( = ?auto_898011 ?auto_898012 ) ) ( not ( = ?auto_898011 ?auto_898013 ) ) ( not ( = ?auto_898011 ?auto_898014 ) ) ( not ( = ?auto_898011 ?auto_898015 ) ) ( not ( = ?auto_898011 ?auto_898016 ) ) ( not ( = ?auto_898011 ?auto_898017 ) ) ( not ( = ?auto_898011 ?auto_898018 ) ) ( not ( = ?auto_898011 ?auto_898019 ) ) ( not ( = ?auto_898011 ?auto_898020 ) ) ( not ( = ?auto_898011 ?auto_898021 ) ) ( not ( = ?auto_898011 ?auto_898022 ) ) ( not ( = ?auto_898011 ?auto_898023 ) ) ( not ( = ?auto_898011 ?auto_898024 ) ) ( not ( = ?auto_898012 ?auto_898013 ) ) ( not ( = ?auto_898012 ?auto_898014 ) ) ( not ( = ?auto_898012 ?auto_898015 ) ) ( not ( = ?auto_898012 ?auto_898016 ) ) ( not ( = ?auto_898012 ?auto_898017 ) ) ( not ( = ?auto_898012 ?auto_898018 ) ) ( not ( = ?auto_898012 ?auto_898019 ) ) ( not ( = ?auto_898012 ?auto_898020 ) ) ( not ( = ?auto_898012 ?auto_898021 ) ) ( not ( = ?auto_898012 ?auto_898022 ) ) ( not ( = ?auto_898012 ?auto_898023 ) ) ( not ( = ?auto_898012 ?auto_898024 ) ) ( not ( = ?auto_898013 ?auto_898014 ) ) ( not ( = ?auto_898013 ?auto_898015 ) ) ( not ( = ?auto_898013 ?auto_898016 ) ) ( not ( = ?auto_898013 ?auto_898017 ) ) ( not ( = ?auto_898013 ?auto_898018 ) ) ( not ( = ?auto_898013 ?auto_898019 ) ) ( not ( = ?auto_898013 ?auto_898020 ) ) ( not ( = ?auto_898013 ?auto_898021 ) ) ( not ( = ?auto_898013 ?auto_898022 ) ) ( not ( = ?auto_898013 ?auto_898023 ) ) ( not ( = ?auto_898013 ?auto_898024 ) ) ( not ( = ?auto_898014 ?auto_898015 ) ) ( not ( = ?auto_898014 ?auto_898016 ) ) ( not ( = ?auto_898014 ?auto_898017 ) ) ( not ( = ?auto_898014 ?auto_898018 ) ) ( not ( = ?auto_898014 ?auto_898019 ) ) ( not ( = ?auto_898014 ?auto_898020 ) ) ( not ( = ?auto_898014 ?auto_898021 ) ) ( not ( = ?auto_898014 ?auto_898022 ) ) ( not ( = ?auto_898014 ?auto_898023 ) ) ( not ( = ?auto_898014 ?auto_898024 ) ) ( not ( = ?auto_898015 ?auto_898016 ) ) ( not ( = ?auto_898015 ?auto_898017 ) ) ( not ( = ?auto_898015 ?auto_898018 ) ) ( not ( = ?auto_898015 ?auto_898019 ) ) ( not ( = ?auto_898015 ?auto_898020 ) ) ( not ( = ?auto_898015 ?auto_898021 ) ) ( not ( = ?auto_898015 ?auto_898022 ) ) ( not ( = ?auto_898015 ?auto_898023 ) ) ( not ( = ?auto_898015 ?auto_898024 ) ) ( not ( = ?auto_898016 ?auto_898017 ) ) ( not ( = ?auto_898016 ?auto_898018 ) ) ( not ( = ?auto_898016 ?auto_898019 ) ) ( not ( = ?auto_898016 ?auto_898020 ) ) ( not ( = ?auto_898016 ?auto_898021 ) ) ( not ( = ?auto_898016 ?auto_898022 ) ) ( not ( = ?auto_898016 ?auto_898023 ) ) ( not ( = ?auto_898016 ?auto_898024 ) ) ( not ( = ?auto_898017 ?auto_898018 ) ) ( not ( = ?auto_898017 ?auto_898019 ) ) ( not ( = ?auto_898017 ?auto_898020 ) ) ( not ( = ?auto_898017 ?auto_898021 ) ) ( not ( = ?auto_898017 ?auto_898022 ) ) ( not ( = ?auto_898017 ?auto_898023 ) ) ( not ( = ?auto_898017 ?auto_898024 ) ) ( not ( = ?auto_898018 ?auto_898019 ) ) ( not ( = ?auto_898018 ?auto_898020 ) ) ( not ( = ?auto_898018 ?auto_898021 ) ) ( not ( = ?auto_898018 ?auto_898022 ) ) ( not ( = ?auto_898018 ?auto_898023 ) ) ( not ( = ?auto_898018 ?auto_898024 ) ) ( not ( = ?auto_898019 ?auto_898020 ) ) ( not ( = ?auto_898019 ?auto_898021 ) ) ( not ( = ?auto_898019 ?auto_898022 ) ) ( not ( = ?auto_898019 ?auto_898023 ) ) ( not ( = ?auto_898019 ?auto_898024 ) ) ( not ( = ?auto_898020 ?auto_898021 ) ) ( not ( = ?auto_898020 ?auto_898022 ) ) ( not ( = ?auto_898020 ?auto_898023 ) ) ( not ( = ?auto_898020 ?auto_898024 ) ) ( not ( = ?auto_898021 ?auto_898022 ) ) ( not ( = ?auto_898021 ?auto_898023 ) ) ( not ( = ?auto_898021 ?auto_898024 ) ) ( not ( = ?auto_898022 ?auto_898023 ) ) ( not ( = ?auto_898022 ?auto_898024 ) ) ( not ( = ?auto_898023 ?auto_898024 ) ) ( ON ?auto_898007 ?auto_898025 ) ( not ( = ?auto_898024 ?auto_898025 ) ) ( not ( = ?auto_898023 ?auto_898025 ) ) ( not ( = ?auto_898022 ?auto_898025 ) ) ( not ( = ?auto_898021 ?auto_898025 ) ) ( not ( = ?auto_898020 ?auto_898025 ) ) ( not ( = ?auto_898019 ?auto_898025 ) ) ( not ( = ?auto_898018 ?auto_898025 ) ) ( not ( = ?auto_898017 ?auto_898025 ) ) ( not ( = ?auto_898016 ?auto_898025 ) ) ( not ( = ?auto_898015 ?auto_898025 ) ) ( not ( = ?auto_898014 ?auto_898025 ) ) ( not ( = ?auto_898013 ?auto_898025 ) ) ( not ( = ?auto_898012 ?auto_898025 ) ) ( not ( = ?auto_898011 ?auto_898025 ) ) ( not ( = ?auto_898010 ?auto_898025 ) ) ( not ( = ?auto_898009 ?auto_898025 ) ) ( not ( = ?auto_898008 ?auto_898025 ) ) ( not ( = ?auto_898007 ?auto_898025 ) ) ( ON ?auto_898008 ?auto_898007 ) ( ON ?auto_898009 ?auto_898008 ) ( ON ?auto_898010 ?auto_898009 ) ( ON ?auto_898011 ?auto_898010 ) ( ON ?auto_898012 ?auto_898011 ) ( ON ?auto_898013 ?auto_898012 ) ( ON ?auto_898014 ?auto_898013 ) ( ON ?auto_898015 ?auto_898014 ) ( ON ?auto_898016 ?auto_898015 ) ( ON ?auto_898017 ?auto_898016 ) ( ON ?auto_898018 ?auto_898017 ) ( ON ?auto_898019 ?auto_898018 ) ( ON ?auto_898020 ?auto_898019 ) ( ON ?auto_898021 ?auto_898020 ) ( ON ?auto_898022 ?auto_898021 ) ( ON ?auto_898023 ?auto_898022 ) ( ON ?auto_898024 ?auto_898023 ) ( CLEAR ?auto_898024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_898024 ?auto_898023 ?auto_898022 ?auto_898021 ?auto_898020 ?auto_898019 ?auto_898018 ?auto_898017 ?auto_898016 ?auto_898015 ?auto_898014 ?auto_898013 ?auto_898012 ?auto_898011 ?auto_898010 ?auto_898009 ?auto_898008 ?auto_898007 )
      ( MAKE-18PILE ?auto_898007 ?auto_898008 ?auto_898009 ?auto_898010 ?auto_898011 ?auto_898012 ?auto_898013 ?auto_898014 ?auto_898015 ?auto_898016 ?auto_898017 ?auto_898018 ?auto_898019 ?auto_898020 ?auto_898021 ?auto_898022 ?auto_898023 ?auto_898024 ) )
  )

)

