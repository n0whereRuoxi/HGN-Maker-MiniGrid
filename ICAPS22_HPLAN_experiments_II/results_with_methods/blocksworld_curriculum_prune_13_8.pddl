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
      ?auto_233257 - BLOCK
    )
    :vars
    (
      ?auto_233258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233257 ?auto_233258 ) ( CLEAR ?auto_233257 ) ( HAND-EMPTY ) ( not ( = ?auto_233257 ?auto_233258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233257 ?auto_233258 )
      ( !PUTDOWN ?auto_233257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_233264 - BLOCK
      ?auto_233265 - BLOCK
    )
    :vars
    (
      ?auto_233266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233264 ) ( ON ?auto_233265 ?auto_233266 ) ( CLEAR ?auto_233265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233264 ) ( not ( = ?auto_233264 ?auto_233265 ) ) ( not ( = ?auto_233264 ?auto_233266 ) ) ( not ( = ?auto_233265 ?auto_233266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233265 ?auto_233266 )
      ( !STACK ?auto_233265 ?auto_233264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_233274 - BLOCK
      ?auto_233275 - BLOCK
    )
    :vars
    (
      ?auto_233276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233275 ?auto_233276 ) ( not ( = ?auto_233274 ?auto_233275 ) ) ( not ( = ?auto_233274 ?auto_233276 ) ) ( not ( = ?auto_233275 ?auto_233276 ) ) ( ON ?auto_233274 ?auto_233275 ) ( CLEAR ?auto_233274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233274 )
      ( MAKE-2PILE ?auto_233274 ?auto_233275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233285 - BLOCK
      ?auto_233286 - BLOCK
      ?auto_233287 - BLOCK
    )
    :vars
    (
      ?auto_233288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233286 ) ( ON ?auto_233287 ?auto_233288 ) ( CLEAR ?auto_233287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233285 ) ( ON ?auto_233286 ?auto_233285 ) ( not ( = ?auto_233285 ?auto_233286 ) ) ( not ( = ?auto_233285 ?auto_233287 ) ) ( not ( = ?auto_233285 ?auto_233288 ) ) ( not ( = ?auto_233286 ?auto_233287 ) ) ( not ( = ?auto_233286 ?auto_233288 ) ) ( not ( = ?auto_233287 ?auto_233288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233287 ?auto_233288 )
      ( !STACK ?auto_233287 ?auto_233286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233299 - BLOCK
      ?auto_233300 - BLOCK
      ?auto_233301 - BLOCK
    )
    :vars
    (
      ?auto_233302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233301 ?auto_233302 ) ( ON-TABLE ?auto_233299 ) ( not ( = ?auto_233299 ?auto_233300 ) ) ( not ( = ?auto_233299 ?auto_233301 ) ) ( not ( = ?auto_233299 ?auto_233302 ) ) ( not ( = ?auto_233300 ?auto_233301 ) ) ( not ( = ?auto_233300 ?auto_233302 ) ) ( not ( = ?auto_233301 ?auto_233302 ) ) ( CLEAR ?auto_233299 ) ( ON ?auto_233300 ?auto_233301 ) ( CLEAR ?auto_233300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233299 ?auto_233300 )
      ( MAKE-3PILE ?auto_233299 ?auto_233300 ?auto_233301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_233313 - BLOCK
      ?auto_233314 - BLOCK
      ?auto_233315 - BLOCK
    )
    :vars
    (
      ?auto_233316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233315 ?auto_233316 ) ( not ( = ?auto_233313 ?auto_233314 ) ) ( not ( = ?auto_233313 ?auto_233315 ) ) ( not ( = ?auto_233313 ?auto_233316 ) ) ( not ( = ?auto_233314 ?auto_233315 ) ) ( not ( = ?auto_233314 ?auto_233316 ) ) ( not ( = ?auto_233315 ?auto_233316 ) ) ( ON ?auto_233314 ?auto_233315 ) ( ON ?auto_233313 ?auto_233314 ) ( CLEAR ?auto_233313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233313 )
      ( MAKE-3PILE ?auto_233313 ?auto_233314 ?auto_233315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233328 - BLOCK
      ?auto_233329 - BLOCK
      ?auto_233330 - BLOCK
      ?auto_233331 - BLOCK
    )
    :vars
    (
      ?auto_233332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233330 ) ( ON ?auto_233331 ?auto_233332 ) ( CLEAR ?auto_233331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233328 ) ( ON ?auto_233329 ?auto_233328 ) ( ON ?auto_233330 ?auto_233329 ) ( not ( = ?auto_233328 ?auto_233329 ) ) ( not ( = ?auto_233328 ?auto_233330 ) ) ( not ( = ?auto_233328 ?auto_233331 ) ) ( not ( = ?auto_233328 ?auto_233332 ) ) ( not ( = ?auto_233329 ?auto_233330 ) ) ( not ( = ?auto_233329 ?auto_233331 ) ) ( not ( = ?auto_233329 ?auto_233332 ) ) ( not ( = ?auto_233330 ?auto_233331 ) ) ( not ( = ?auto_233330 ?auto_233332 ) ) ( not ( = ?auto_233331 ?auto_233332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233331 ?auto_233332 )
      ( !STACK ?auto_233331 ?auto_233330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233346 - BLOCK
      ?auto_233347 - BLOCK
      ?auto_233348 - BLOCK
      ?auto_233349 - BLOCK
    )
    :vars
    (
      ?auto_233350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233349 ?auto_233350 ) ( ON-TABLE ?auto_233346 ) ( ON ?auto_233347 ?auto_233346 ) ( not ( = ?auto_233346 ?auto_233347 ) ) ( not ( = ?auto_233346 ?auto_233348 ) ) ( not ( = ?auto_233346 ?auto_233349 ) ) ( not ( = ?auto_233346 ?auto_233350 ) ) ( not ( = ?auto_233347 ?auto_233348 ) ) ( not ( = ?auto_233347 ?auto_233349 ) ) ( not ( = ?auto_233347 ?auto_233350 ) ) ( not ( = ?auto_233348 ?auto_233349 ) ) ( not ( = ?auto_233348 ?auto_233350 ) ) ( not ( = ?auto_233349 ?auto_233350 ) ) ( CLEAR ?auto_233347 ) ( ON ?auto_233348 ?auto_233349 ) ( CLEAR ?auto_233348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233346 ?auto_233347 ?auto_233348 )
      ( MAKE-4PILE ?auto_233346 ?auto_233347 ?auto_233348 ?auto_233349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233364 - BLOCK
      ?auto_233365 - BLOCK
      ?auto_233366 - BLOCK
      ?auto_233367 - BLOCK
    )
    :vars
    (
      ?auto_233368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233367 ?auto_233368 ) ( ON-TABLE ?auto_233364 ) ( not ( = ?auto_233364 ?auto_233365 ) ) ( not ( = ?auto_233364 ?auto_233366 ) ) ( not ( = ?auto_233364 ?auto_233367 ) ) ( not ( = ?auto_233364 ?auto_233368 ) ) ( not ( = ?auto_233365 ?auto_233366 ) ) ( not ( = ?auto_233365 ?auto_233367 ) ) ( not ( = ?auto_233365 ?auto_233368 ) ) ( not ( = ?auto_233366 ?auto_233367 ) ) ( not ( = ?auto_233366 ?auto_233368 ) ) ( not ( = ?auto_233367 ?auto_233368 ) ) ( ON ?auto_233366 ?auto_233367 ) ( CLEAR ?auto_233364 ) ( ON ?auto_233365 ?auto_233366 ) ( CLEAR ?auto_233365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233364 ?auto_233365 )
      ( MAKE-4PILE ?auto_233364 ?auto_233365 ?auto_233366 ?auto_233367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_233382 - BLOCK
      ?auto_233383 - BLOCK
      ?auto_233384 - BLOCK
      ?auto_233385 - BLOCK
    )
    :vars
    (
      ?auto_233386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233385 ?auto_233386 ) ( not ( = ?auto_233382 ?auto_233383 ) ) ( not ( = ?auto_233382 ?auto_233384 ) ) ( not ( = ?auto_233382 ?auto_233385 ) ) ( not ( = ?auto_233382 ?auto_233386 ) ) ( not ( = ?auto_233383 ?auto_233384 ) ) ( not ( = ?auto_233383 ?auto_233385 ) ) ( not ( = ?auto_233383 ?auto_233386 ) ) ( not ( = ?auto_233384 ?auto_233385 ) ) ( not ( = ?auto_233384 ?auto_233386 ) ) ( not ( = ?auto_233385 ?auto_233386 ) ) ( ON ?auto_233384 ?auto_233385 ) ( ON ?auto_233383 ?auto_233384 ) ( ON ?auto_233382 ?auto_233383 ) ( CLEAR ?auto_233382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233382 )
      ( MAKE-4PILE ?auto_233382 ?auto_233383 ?auto_233384 ?auto_233385 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233401 - BLOCK
      ?auto_233402 - BLOCK
      ?auto_233403 - BLOCK
      ?auto_233404 - BLOCK
      ?auto_233405 - BLOCK
    )
    :vars
    (
      ?auto_233406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233404 ) ( ON ?auto_233405 ?auto_233406 ) ( CLEAR ?auto_233405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233401 ) ( ON ?auto_233402 ?auto_233401 ) ( ON ?auto_233403 ?auto_233402 ) ( ON ?auto_233404 ?auto_233403 ) ( not ( = ?auto_233401 ?auto_233402 ) ) ( not ( = ?auto_233401 ?auto_233403 ) ) ( not ( = ?auto_233401 ?auto_233404 ) ) ( not ( = ?auto_233401 ?auto_233405 ) ) ( not ( = ?auto_233401 ?auto_233406 ) ) ( not ( = ?auto_233402 ?auto_233403 ) ) ( not ( = ?auto_233402 ?auto_233404 ) ) ( not ( = ?auto_233402 ?auto_233405 ) ) ( not ( = ?auto_233402 ?auto_233406 ) ) ( not ( = ?auto_233403 ?auto_233404 ) ) ( not ( = ?auto_233403 ?auto_233405 ) ) ( not ( = ?auto_233403 ?auto_233406 ) ) ( not ( = ?auto_233404 ?auto_233405 ) ) ( not ( = ?auto_233404 ?auto_233406 ) ) ( not ( = ?auto_233405 ?auto_233406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233405 ?auto_233406 )
      ( !STACK ?auto_233405 ?auto_233404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233423 - BLOCK
      ?auto_233424 - BLOCK
      ?auto_233425 - BLOCK
      ?auto_233426 - BLOCK
      ?auto_233427 - BLOCK
    )
    :vars
    (
      ?auto_233428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233427 ?auto_233428 ) ( ON-TABLE ?auto_233423 ) ( ON ?auto_233424 ?auto_233423 ) ( ON ?auto_233425 ?auto_233424 ) ( not ( = ?auto_233423 ?auto_233424 ) ) ( not ( = ?auto_233423 ?auto_233425 ) ) ( not ( = ?auto_233423 ?auto_233426 ) ) ( not ( = ?auto_233423 ?auto_233427 ) ) ( not ( = ?auto_233423 ?auto_233428 ) ) ( not ( = ?auto_233424 ?auto_233425 ) ) ( not ( = ?auto_233424 ?auto_233426 ) ) ( not ( = ?auto_233424 ?auto_233427 ) ) ( not ( = ?auto_233424 ?auto_233428 ) ) ( not ( = ?auto_233425 ?auto_233426 ) ) ( not ( = ?auto_233425 ?auto_233427 ) ) ( not ( = ?auto_233425 ?auto_233428 ) ) ( not ( = ?auto_233426 ?auto_233427 ) ) ( not ( = ?auto_233426 ?auto_233428 ) ) ( not ( = ?auto_233427 ?auto_233428 ) ) ( CLEAR ?auto_233425 ) ( ON ?auto_233426 ?auto_233427 ) ( CLEAR ?auto_233426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233423 ?auto_233424 ?auto_233425 ?auto_233426 )
      ( MAKE-5PILE ?auto_233423 ?auto_233424 ?auto_233425 ?auto_233426 ?auto_233427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233445 - BLOCK
      ?auto_233446 - BLOCK
      ?auto_233447 - BLOCK
      ?auto_233448 - BLOCK
      ?auto_233449 - BLOCK
    )
    :vars
    (
      ?auto_233450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233449 ?auto_233450 ) ( ON-TABLE ?auto_233445 ) ( ON ?auto_233446 ?auto_233445 ) ( not ( = ?auto_233445 ?auto_233446 ) ) ( not ( = ?auto_233445 ?auto_233447 ) ) ( not ( = ?auto_233445 ?auto_233448 ) ) ( not ( = ?auto_233445 ?auto_233449 ) ) ( not ( = ?auto_233445 ?auto_233450 ) ) ( not ( = ?auto_233446 ?auto_233447 ) ) ( not ( = ?auto_233446 ?auto_233448 ) ) ( not ( = ?auto_233446 ?auto_233449 ) ) ( not ( = ?auto_233446 ?auto_233450 ) ) ( not ( = ?auto_233447 ?auto_233448 ) ) ( not ( = ?auto_233447 ?auto_233449 ) ) ( not ( = ?auto_233447 ?auto_233450 ) ) ( not ( = ?auto_233448 ?auto_233449 ) ) ( not ( = ?auto_233448 ?auto_233450 ) ) ( not ( = ?auto_233449 ?auto_233450 ) ) ( ON ?auto_233448 ?auto_233449 ) ( CLEAR ?auto_233446 ) ( ON ?auto_233447 ?auto_233448 ) ( CLEAR ?auto_233447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233445 ?auto_233446 ?auto_233447 )
      ( MAKE-5PILE ?auto_233445 ?auto_233446 ?auto_233447 ?auto_233448 ?auto_233449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233467 - BLOCK
      ?auto_233468 - BLOCK
      ?auto_233469 - BLOCK
      ?auto_233470 - BLOCK
      ?auto_233471 - BLOCK
    )
    :vars
    (
      ?auto_233472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233471 ?auto_233472 ) ( ON-TABLE ?auto_233467 ) ( not ( = ?auto_233467 ?auto_233468 ) ) ( not ( = ?auto_233467 ?auto_233469 ) ) ( not ( = ?auto_233467 ?auto_233470 ) ) ( not ( = ?auto_233467 ?auto_233471 ) ) ( not ( = ?auto_233467 ?auto_233472 ) ) ( not ( = ?auto_233468 ?auto_233469 ) ) ( not ( = ?auto_233468 ?auto_233470 ) ) ( not ( = ?auto_233468 ?auto_233471 ) ) ( not ( = ?auto_233468 ?auto_233472 ) ) ( not ( = ?auto_233469 ?auto_233470 ) ) ( not ( = ?auto_233469 ?auto_233471 ) ) ( not ( = ?auto_233469 ?auto_233472 ) ) ( not ( = ?auto_233470 ?auto_233471 ) ) ( not ( = ?auto_233470 ?auto_233472 ) ) ( not ( = ?auto_233471 ?auto_233472 ) ) ( ON ?auto_233470 ?auto_233471 ) ( ON ?auto_233469 ?auto_233470 ) ( CLEAR ?auto_233467 ) ( ON ?auto_233468 ?auto_233469 ) ( CLEAR ?auto_233468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233467 ?auto_233468 )
      ( MAKE-5PILE ?auto_233467 ?auto_233468 ?auto_233469 ?auto_233470 ?auto_233471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_233489 - BLOCK
      ?auto_233490 - BLOCK
      ?auto_233491 - BLOCK
      ?auto_233492 - BLOCK
      ?auto_233493 - BLOCK
    )
    :vars
    (
      ?auto_233494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233493 ?auto_233494 ) ( not ( = ?auto_233489 ?auto_233490 ) ) ( not ( = ?auto_233489 ?auto_233491 ) ) ( not ( = ?auto_233489 ?auto_233492 ) ) ( not ( = ?auto_233489 ?auto_233493 ) ) ( not ( = ?auto_233489 ?auto_233494 ) ) ( not ( = ?auto_233490 ?auto_233491 ) ) ( not ( = ?auto_233490 ?auto_233492 ) ) ( not ( = ?auto_233490 ?auto_233493 ) ) ( not ( = ?auto_233490 ?auto_233494 ) ) ( not ( = ?auto_233491 ?auto_233492 ) ) ( not ( = ?auto_233491 ?auto_233493 ) ) ( not ( = ?auto_233491 ?auto_233494 ) ) ( not ( = ?auto_233492 ?auto_233493 ) ) ( not ( = ?auto_233492 ?auto_233494 ) ) ( not ( = ?auto_233493 ?auto_233494 ) ) ( ON ?auto_233492 ?auto_233493 ) ( ON ?auto_233491 ?auto_233492 ) ( ON ?auto_233490 ?auto_233491 ) ( ON ?auto_233489 ?auto_233490 ) ( CLEAR ?auto_233489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233489 )
      ( MAKE-5PILE ?auto_233489 ?auto_233490 ?auto_233491 ?auto_233492 ?auto_233493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233512 - BLOCK
      ?auto_233513 - BLOCK
      ?auto_233514 - BLOCK
      ?auto_233515 - BLOCK
      ?auto_233516 - BLOCK
      ?auto_233517 - BLOCK
    )
    :vars
    (
      ?auto_233518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233516 ) ( ON ?auto_233517 ?auto_233518 ) ( CLEAR ?auto_233517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233512 ) ( ON ?auto_233513 ?auto_233512 ) ( ON ?auto_233514 ?auto_233513 ) ( ON ?auto_233515 ?auto_233514 ) ( ON ?auto_233516 ?auto_233515 ) ( not ( = ?auto_233512 ?auto_233513 ) ) ( not ( = ?auto_233512 ?auto_233514 ) ) ( not ( = ?auto_233512 ?auto_233515 ) ) ( not ( = ?auto_233512 ?auto_233516 ) ) ( not ( = ?auto_233512 ?auto_233517 ) ) ( not ( = ?auto_233512 ?auto_233518 ) ) ( not ( = ?auto_233513 ?auto_233514 ) ) ( not ( = ?auto_233513 ?auto_233515 ) ) ( not ( = ?auto_233513 ?auto_233516 ) ) ( not ( = ?auto_233513 ?auto_233517 ) ) ( not ( = ?auto_233513 ?auto_233518 ) ) ( not ( = ?auto_233514 ?auto_233515 ) ) ( not ( = ?auto_233514 ?auto_233516 ) ) ( not ( = ?auto_233514 ?auto_233517 ) ) ( not ( = ?auto_233514 ?auto_233518 ) ) ( not ( = ?auto_233515 ?auto_233516 ) ) ( not ( = ?auto_233515 ?auto_233517 ) ) ( not ( = ?auto_233515 ?auto_233518 ) ) ( not ( = ?auto_233516 ?auto_233517 ) ) ( not ( = ?auto_233516 ?auto_233518 ) ) ( not ( = ?auto_233517 ?auto_233518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233517 ?auto_233518 )
      ( !STACK ?auto_233517 ?auto_233516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233538 - BLOCK
      ?auto_233539 - BLOCK
      ?auto_233540 - BLOCK
      ?auto_233541 - BLOCK
      ?auto_233542 - BLOCK
      ?auto_233543 - BLOCK
    )
    :vars
    (
      ?auto_233544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233543 ?auto_233544 ) ( ON-TABLE ?auto_233538 ) ( ON ?auto_233539 ?auto_233538 ) ( ON ?auto_233540 ?auto_233539 ) ( ON ?auto_233541 ?auto_233540 ) ( not ( = ?auto_233538 ?auto_233539 ) ) ( not ( = ?auto_233538 ?auto_233540 ) ) ( not ( = ?auto_233538 ?auto_233541 ) ) ( not ( = ?auto_233538 ?auto_233542 ) ) ( not ( = ?auto_233538 ?auto_233543 ) ) ( not ( = ?auto_233538 ?auto_233544 ) ) ( not ( = ?auto_233539 ?auto_233540 ) ) ( not ( = ?auto_233539 ?auto_233541 ) ) ( not ( = ?auto_233539 ?auto_233542 ) ) ( not ( = ?auto_233539 ?auto_233543 ) ) ( not ( = ?auto_233539 ?auto_233544 ) ) ( not ( = ?auto_233540 ?auto_233541 ) ) ( not ( = ?auto_233540 ?auto_233542 ) ) ( not ( = ?auto_233540 ?auto_233543 ) ) ( not ( = ?auto_233540 ?auto_233544 ) ) ( not ( = ?auto_233541 ?auto_233542 ) ) ( not ( = ?auto_233541 ?auto_233543 ) ) ( not ( = ?auto_233541 ?auto_233544 ) ) ( not ( = ?auto_233542 ?auto_233543 ) ) ( not ( = ?auto_233542 ?auto_233544 ) ) ( not ( = ?auto_233543 ?auto_233544 ) ) ( CLEAR ?auto_233541 ) ( ON ?auto_233542 ?auto_233543 ) ( CLEAR ?auto_233542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233538 ?auto_233539 ?auto_233540 ?auto_233541 ?auto_233542 )
      ( MAKE-6PILE ?auto_233538 ?auto_233539 ?auto_233540 ?auto_233541 ?auto_233542 ?auto_233543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233564 - BLOCK
      ?auto_233565 - BLOCK
      ?auto_233566 - BLOCK
      ?auto_233567 - BLOCK
      ?auto_233568 - BLOCK
      ?auto_233569 - BLOCK
    )
    :vars
    (
      ?auto_233570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233569 ?auto_233570 ) ( ON-TABLE ?auto_233564 ) ( ON ?auto_233565 ?auto_233564 ) ( ON ?auto_233566 ?auto_233565 ) ( not ( = ?auto_233564 ?auto_233565 ) ) ( not ( = ?auto_233564 ?auto_233566 ) ) ( not ( = ?auto_233564 ?auto_233567 ) ) ( not ( = ?auto_233564 ?auto_233568 ) ) ( not ( = ?auto_233564 ?auto_233569 ) ) ( not ( = ?auto_233564 ?auto_233570 ) ) ( not ( = ?auto_233565 ?auto_233566 ) ) ( not ( = ?auto_233565 ?auto_233567 ) ) ( not ( = ?auto_233565 ?auto_233568 ) ) ( not ( = ?auto_233565 ?auto_233569 ) ) ( not ( = ?auto_233565 ?auto_233570 ) ) ( not ( = ?auto_233566 ?auto_233567 ) ) ( not ( = ?auto_233566 ?auto_233568 ) ) ( not ( = ?auto_233566 ?auto_233569 ) ) ( not ( = ?auto_233566 ?auto_233570 ) ) ( not ( = ?auto_233567 ?auto_233568 ) ) ( not ( = ?auto_233567 ?auto_233569 ) ) ( not ( = ?auto_233567 ?auto_233570 ) ) ( not ( = ?auto_233568 ?auto_233569 ) ) ( not ( = ?auto_233568 ?auto_233570 ) ) ( not ( = ?auto_233569 ?auto_233570 ) ) ( ON ?auto_233568 ?auto_233569 ) ( CLEAR ?auto_233566 ) ( ON ?auto_233567 ?auto_233568 ) ( CLEAR ?auto_233567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233564 ?auto_233565 ?auto_233566 ?auto_233567 )
      ( MAKE-6PILE ?auto_233564 ?auto_233565 ?auto_233566 ?auto_233567 ?auto_233568 ?auto_233569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233590 - BLOCK
      ?auto_233591 - BLOCK
      ?auto_233592 - BLOCK
      ?auto_233593 - BLOCK
      ?auto_233594 - BLOCK
      ?auto_233595 - BLOCK
    )
    :vars
    (
      ?auto_233596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233595 ?auto_233596 ) ( ON-TABLE ?auto_233590 ) ( ON ?auto_233591 ?auto_233590 ) ( not ( = ?auto_233590 ?auto_233591 ) ) ( not ( = ?auto_233590 ?auto_233592 ) ) ( not ( = ?auto_233590 ?auto_233593 ) ) ( not ( = ?auto_233590 ?auto_233594 ) ) ( not ( = ?auto_233590 ?auto_233595 ) ) ( not ( = ?auto_233590 ?auto_233596 ) ) ( not ( = ?auto_233591 ?auto_233592 ) ) ( not ( = ?auto_233591 ?auto_233593 ) ) ( not ( = ?auto_233591 ?auto_233594 ) ) ( not ( = ?auto_233591 ?auto_233595 ) ) ( not ( = ?auto_233591 ?auto_233596 ) ) ( not ( = ?auto_233592 ?auto_233593 ) ) ( not ( = ?auto_233592 ?auto_233594 ) ) ( not ( = ?auto_233592 ?auto_233595 ) ) ( not ( = ?auto_233592 ?auto_233596 ) ) ( not ( = ?auto_233593 ?auto_233594 ) ) ( not ( = ?auto_233593 ?auto_233595 ) ) ( not ( = ?auto_233593 ?auto_233596 ) ) ( not ( = ?auto_233594 ?auto_233595 ) ) ( not ( = ?auto_233594 ?auto_233596 ) ) ( not ( = ?auto_233595 ?auto_233596 ) ) ( ON ?auto_233594 ?auto_233595 ) ( ON ?auto_233593 ?auto_233594 ) ( CLEAR ?auto_233591 ) ( ON ?auto_233592 ?auto_233593 ) ( CLEAR ?auto_233592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233590 ?auto_233591 ?auto_233592 )
      ( MAKE-6PILE ?auto_233590 ?auto_233591 ?auto_233592 ?auto_233593 ?auto_233594 ?auto_233595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233616 - BLOCK
      ?auto_233617 - BLOCK
      ?auto_233618 - BLOCK
      ?auto_233619 - BLOCK
      ?auto_233620 - BLOCK
      ?auto_233621 - BLOCK
    )
    :vars
    (
      ?auto_233622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233621 ?auto_233622 ) ( ON-TABLE ?auto_233616 ) ( not ( = ?auto_233616 ?auto_233617 ) ) ( not ( = ?auto_233616 ?auto_233618 ) ) ( not ( = ?auto_233616 ?auto_233619 ) ) ( not ( = ?auto_233616 ?auto_233620 ) ) ( not ( = ?auto_233616 ?auto_233621 ) ) ( not ( = ?auto_233616 ?auto_233622 ) ) ( not ( = ?auto_233617 ?auto_233618 ) ) ( not ( = ?auto_233617 ?auto_233619 ) ) ( not ( = ?auto_233617 ?auto_233620 ) ) ( not ( = ?auto_233617 ?auto_233621 ) ) ( not ( = ?auto_233617 ?auto_233622 ) ) ( not ( = ?auto_233618 ?auto_233619 ) ) ( not ( = ?auto_233618 ?auto_233620 ) ) ( not ( = ?auto_233618 ?auto_233621 ) ) ( not ( = ?auto_233618 ?auto_233622 ) ) ( not ( = ?auto_233619 ?auto_233620 ) ) ( not ( = ?auto_233619 ?auto_233621 ) ) ( not ( = ?auto_233619 ?auto_233622 ) ) ( not ( = ?auto_233620 ?auto_233621 ) ) ( not ( = ?auto_233620 ?auto_233622 ) ) ( not ( = ?auto_233621 ?auto_233622 ) ) ( ON ?auto_233620 ?auto_233621 ) ( ON ?auto_233619 ?auto_233620 ) ( ON ?auto_233618 ?auto_233619 ) ( CLEAR ?auto_233616 ) ( ON ?auto_233617 ?auto_233618 ) ( CLEAR ?auto_233617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233616 ?auto_233617 )
      ( MAKE-6PILE ?auto_233616 ?auto_233617 ?auto_233618 ?auto_233619 ?auto_233620 ?auto_233621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_233642 - BLOCK
      ?auto_233643 - BLOCK
      ?auto_233644 - BLOCK
      ?auto_233645 - BLOCK
      ?auto_233646 - BLOCK
      ?auto_233647 - BLOCK
    )
    :vars
    (
      ?auto_233648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233647 ?auto_233648 ) ( not ( = ?auto_233642 ?auto_233643 ) ) ( not ( = ?auto_233642 ?auto_233644 ) ) ( not ( = ?auto_233642 ?auto_233645 ) ) ( not ( = ?auto_233642 ?auto_233646 ) ) ( not ( = ?auto_233642 ?auto_233647 ) ) ( not ( = ?auto_233642 ?auto_233648 ) ) ( not ( = ?auto_233643 ?auto_233644 ) ) ( not ( = ?auto_233643 ?auto_233645 ) ) ( not ( = ?auto_233643 ?auto_233646 ) ) ( not ( = ?auto_233643 ?auto_233647 ) ) ( not ( = ?auto_233643 ?auto_233648 ) ) ( not ( = ?auto_233644 ?auto_233645 ) ) ( not ( = ?auto_233644 ?auto_233646 ) ) ( not ( = ?auto_233644 ?auto_233647 ) ) ( not ( = ?auto_233644 ?auto_233648 ) ) ( not ( = ?auto_233645 ?auto_233646 ) ) ( not ( = ?auto_233645 ?auto_233647 ) ) ( not ( = ?auto_233645 ?auto_233648 ) ) ( not ( = ?auto_233646 ?auto_233647 ) ) ( not ( = ?auto_233646 ?auto_233648 ) ) ( not ( = ?auto_233647 ?auto_233648 ) ) ( ON ?auto_233646 ?auto_233647 ) ( ON ?auto_233645 ?auto_233646 ) ( ON ?auto_233644 ?auto_233645 ) ( ON ?auto_233643 ?auto_233644 ) ( ON ?auto_233642 ?auto_233643 ) ( CLEAR ?auto_233642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233642 )
      ( MAKE-6PILE ?auto_233642 ?auto_233643 ?auto_233644 ?auto_233645 ?auto_233646 ?auto_233647 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233669 - BLOCK
      ?auto_233670 - BLOCK
      ?auto_233671 - BLOCK
      ?auto_233672 - BLOCK
      ?auto_233673 - BLOCK
      ?auto_233674 - BLOCK
      ?auto_233675 - BLOCK
    )
    :vars
    (
      ?auto_233676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233674 ) ( ON ?auto_233675 ?auto_233676 ) ( CLEAR ?auto_233675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233669 ) ( ON ?auto_233670 ?auto_233669 ) ( ON ?auto_233671 ?auto_233670 ) ( ON ?auto_233672 ?auto_233671 ) ( ON ?auto_233673 ?auto_233672 ) ( ON ?auto_233674 ?auto_233673 ) ( not ( = ?auto_233669 ?auto_233670 ) ) ( not ( = ?auto_233669 ?auto_233671 ) ) ( not ( = ?auto_233669 ?auto_233672 ) ) ( not ( = ?auto_233669 ?auto_233673 ) ) ( not ( = ?auto_233669 ?auto_233674 ) ) ( not ( = ?auto_233669 ?auto_233675 ) ) ( not ( = ?auto_233669 ?auto_233676 ) ) ( not ( = ?auto_233670 ?auto_233671 ) ) ( not ( = ?auto_233670 ?auto_233672 ) ) ( not ( = ?auto_233670 ?auto_233673 ) ) ( not ( = ?auto_233670 ?auto_233674 ) ) ( not ( = ?auto_233670 ?auto_233675 ) ) ( not ( = ?auto_233670 ?auto_233676 ) ) ( not ( = ?auto_233671 ?auto_233672 ) ) ( not ( = ?auto_233671 ?auto_233673 ) ) ( not ( = ?auto_233671 ?auto_233674 ) ) ( not ( = ?auto_233671 ?auto_233675 ) ) ( not ( = ?auto_233671 ?auto_233676 ) ) ( not ( = ?auto_233672 ?auto_233673 ) ) ( not ( = ?auto_233672 ?auto_233674 ) ) ( not ( = ?auto_233672 ?auto_233675 ) ) ( not ( = ?auto_233672 ?auto_233676 ) ) ( not ( = ?auto_233673 ?auto_233674 ) ) ( not ( = ?auto_233673 ?auto_233675 ) ) ( not ( = ?auto_233673 ?auto_233676 ) ) ( not ( = ?auto_233674 ?auto_233675 ) ) ( not ( = ?auto_233674 ?auto_233676 ) ) ( not ( = ?auto_233675 ?auto_233676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233675 ?auto_233676 )
      ( !STACK ?auto_233675 ?auto_233674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233699 - BLOCK
      ?auto_233700 - BLOCK
      ?auto_233701 - BLOCK
      ?auto_233702 - BLOCK
      ?auto_233703 - BLOCK
      ?auto_233704 - BLOCK
      ?auto_233705 - BLOCK
    )
    :vars
    (
      ?auto_233706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233705 ?auto_233706 ) ( ON-TABLE ?auto_233699 ) ( ON ?auto_233700 ?auto_233699 ) ( ON ?auto_233701 ?auto_233700 ) ( ON ?auto_233702 ?auto_233701 ) ( ON ?auto_233703 ?auto_233702 ) ( not ( = ?auto_233699 ?auto_233700 ) ) ( not ( = ?auto_233699 ?auto_233701 ) ) ( not ( = ?auto_233699 ?auto_233702 ) ) ( not ( = ?auto_233699 ?auto_233703 ) ) ( not ( = ?auto_233699 ?auto_233704 ) ) ( not ( = ?auto_233699 ?auto_233705 ) ) ( not ( = ?auto_233699 ?auto_233706 ) ) ( not ( = ?auto_233700 ?auto_233701 ) ) ( not ( = ?auto_233700 ?auto_233702 ) ) ( not ( = ?auto_233700 ?auto_233703 ) ) ( not ( = ?auto_233700 ?auto_233704 ) ) ( not ( = ?auto_233700 ?auto_233705 ) ) ( not ( = ?auto_233700 ?auto_233706 ) ) ( not ( = ?auto_233701 ?auto_233702 ) ) ( not ( = ?auto_233701 ?auto_233703 ) ) ( not ( = ?auto_233701 ?auto_233704 ) ) ( not ( = ?auto_233701 ?auto_233705 ) ) ( not ( = ?auto_233701 ?auto_233706 ) ) ( not ( = ?auto_233702 ?auto_233703 ) ) ( not ( = ?auto_233702 ?auto_233704 ) ) ( not ( = ?auto_233702 ?auto_233705 ) ) ( not ( = ?auto_233702 ?auto_233706 ) ) ( not ( = ?auto_233703 ?auto_233704 ) ) ( not ( = ?auto_233703 ?auto_233705 ) ) ( not ( = ?auto_233703 ?auto_233706 ) ) ( not ( = ?auto_233704 ?auto_233705 ) ) ( not ( = ?auto_233704 ?auto_233706 ) ) ( not ( = ?auto_233705 ?auto_233706 ) ) ( CLEAR ?auto_233703 ) ( ON ?auto_233704 ?auto_233705 ) ( CLEAR ?auto_233704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_233699 ?auto_233700 ?auto_233701 ?auto_233702 ?auto_233703 ?auto_233704 )
      ( MAKE-7PILE ?auto_233699 ?auto_233700 ?auto_233701 ?auto_233702 ?auto_233703 ?auto_233704 ?auto_233705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233729 - BLOCK
      ?auto_233730 - BLOCK
      ?auto_233731 - BLOCK
      ?auto_233732 - BLOCK
      ?auto_233733 - BLOCK
      ?auto_233734 - BLOCK
      ?auto_233735 - BLOCK
    )
    :vars
    (
      ?auto_233736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233735 ?auto_233736 ) ( ON-TABLE ?auto_233729 ) ( ON ?auto_233730 ?auto_233729 ) ( ON ?auto_233731 ?auto_233730 ) ( ON ?auto_233732 ?auto_233731 ) ( not ( = ?auto_233729 ?auto_233730 ) ) ( not ( = ?auto_233729 ?auto_233731 ) ) ( not ( = ?auto_233729 ?auto_233732 ) ) ( not ( = ?auto_233729 ?auto_233733 ) ) ( not ( = ?auto_233729 ?auto_233734 ) ) ( not ( = ?auto_233729 ?auto_233735 ) ) ( not ( = ?auto_233729 ?auto_233736 ) ) ( not ( = ?auto_233730 ?auto_233731 ) ) ( not ( = ?auto_233730 ?auto_233732 ) ) ( not ( = ?auto_233730 ?auto_233733 ) ) ( not ( = ?auto_233730 ?auto_233734 ) ) ( not ( = ?auto_233730 ?auto_233735 ) ) ( not ( = ?auto_233730 ?auto_233736 ) ) ( not ( = ?auto_233731 ?auto_233732 ) ) ( not ( = ?auto_233731 ?auto_233733 ) ) ( not ( = ?auto_233731 ?auto_233734 ) ) ( not ( = ?auto_233731 ?auto_233735 ) ) ( not ( = ?auto_233731 ?auto_233736 ) ) ( not ( = ?auto_233732 ?auto_233733 ) ) ( not ( = ?auto_233732 ?auto_233734 ) ) ( not ( = ?auto_233732 ?auto_233735 ) ) ( not ( = ?auto_233732 ?auto_233736 ) ) ( not ( = ?auto_233733 ?auto_233734 ) ) ( not ( = ?auto_233733 ?auto_233735 ) ) ( not ( = ?auto_233733 ?auto_233736 ) ) ( not ( = ?auto_233734 ?auto_233735 ) ) ( not ( = ?auto_233734 ?auto_233736 ) ) ( not ( = ?auto_233735 ?auto_233736 ) ) ( ON ?auto_233734 ?auto_233735 ) ( CLEAR ?auto_233732 ) ( ON ?auto_233733 ?auto_233734 ) ( CLEAR ?auto_233733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233729 ?auto_233730 ?auto_233731 ?auto_233732 ?auto_233733 )
      ( MAKE-7PILE ?auto_233729 ?auto_233730 ?auto_233731 ?auto_233732 ?auto_233733 ?auto_233734 ?auto_233735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233759 - BLOCK
      ?auto_233760 - BLOCK
      ?auto_233761 - BLOCK
      ?auto_233762 - BLOCK
      ?auto_233763 - BLOCK
      ?auto_233764 - BLOCK
      ?auto_233765 - BLOCK
    )
    :vars
    (
      ?auto_233766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233765 ?auto_233766 ) ( ON-TABLE ?auto_233759 ) ( ON ?auto_233760 ?auto_233759 ) ( ON ?auto_233761 ?auto_233760 ) ( not ( = ?auto_233759 ?auto_233760 ) ) ( not ( = ?auto_233759 ?auto_233761 ) ) ( not ( = ?auto_233759 ?auto_233762 ) ) ( not ( = ?auto_233759 ?auto_233763 ) ) ( not ( = ?auto_233759 ?auto_233764 ) ) ( not ( = ?auto_233759 ?auto_233765 ) ) ( not ( = ?auto_233759 ?auto_233766 ) ) ( not ( = ?auto_233760 ?auto_233761 ) ) ( not ( = ?auto_233760 ?auto_233762 ) ) ( not ( = ?auto_233760 ?auto_233763 ) ) ( not ( = ?auto_233760 ?auto_233764 ) ) ( not ( = ?auto_233760 ?auto_233765 ) ) ( not ( = ?auto_233760 ?auto_233766 ) ) ( not ( = ?auto_233761 ?auto_233762 ) ) ( not ( = ?auto_233761 ?auto_233763 ) ) ( not ( = ?auto_233761 ?auto_233764 ) ) ( not ( = ?auto_233761 ?auto_233765 ) ) ( not ( = ?auto_233761 ?auto_233766 ) ) ( not ( = ?auto_233762 ?auto_233763 ) ) ( not ( = ?auto_233762 ?auto_233764 ) ) ( not ( = ?auto_233762 ?auto_233765 ) ) ( not ( = ?auto_233762 ?auto_233766 ) ) ( not ( = ?auto_233763 ?auto_233764 ) ) ( not ( = ?auto_233763 ?auto_233765 ) ) ( not ( = ?auto_233763 ?auto_233766 ) ) ( not ( = ?auto_233764 ?auto_233765 ) ) ( not ( = ?auto_233764 ?auto_233766 ) ) ( not ( = ?auto_233765 ?auto_233766 ) ) ( ON ?auto_233764 ?auto_233765 ) ( ON ?auto_233763 ?auto_233764 ) ( CLEAR ?auto_233761 ) ( ON ?auto_233762 ?auto_233763 ) ( CLEAR ?auto_233762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233759 ?auto_233760 ?auto_233761 ?auto_233762 )
      ( MAKE-7PILE ?auto_233759 ?auto_233760 ?auto_233761 ?auto_233762 ?auto_233763 ?auto_233764 ?auto_233765 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233789 - BLOCK
      ?auto_233790 - BLOCK
      ?auto_233791 - BLOCK
      ?auto_233792 - BLOCK
      ?auto_233793 - BLOCK
      ?auto_233794 - BLOCK
      ?auto_233795 - BLOCK
    )
    :vars
    (
      ?auto_233796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233795 ?auto_233796 ) ( ON-TABLE ?auto_233789 ) ( ON ?auto_233790 ?auto_233789 ) ( not ( = ?auto_233789 ?auto_233790 ) ) ( not ( = ?auto_233789 ?auto_233791 ) ) ( not ( = ?auto_233789 ?auto_233792 ) ) ( not ( = ?auto_233789 ?auto_233793 ) ) ( not ( = ?auto_233789 ?auto_233794 ) ) ( not ( = ?auto_233789 ?auto_233795 ) ) ( not ( = ?auto_233789 ?auto_233796 ) ) ( not ( = ?auto_233790 ?auto_233791 ) ) ( not ( = ?auto_233790 ?auto_233792 ) ) ( not ( = ?auto_233790 ?auto_233793 ) ) ( not ( = ?auto_233790 ?auto_233794 ) ) ( not ( = ?auto_233790 ?auto_233795 ) ) ( not ( = ?auto_233790 ?auto_233796 ) ) ( not ( = ?auto_233791 ?auto_233792 ) ) ( not ( = ?auto_233791 ?auto_233793 ) ) ( not ( = ?auto_233791 ?auto_233794 ) ) ( not ( = ?auto_233791 ?auto_233795 ) ) ( not ( = ?auto_233791 ?auto_233796 ) ) ( not ( = ?auto_233792 ?auto_233793 ) ) ( not ( = ?auto_233792 ?auto_233794 ) ) ( not ( = ?auto_233792 ?auto_233795 ) ) ( not ( = ?auto_233792 ?auto_233796 ) ) ( not ( = ?auto_233793 ?auto_233794 ) ) ( not ( = ?auto_233793 ?auto_233795 ) ) ( not ( = ?auto_233793 ?auto_233796 ) ) ( not ( = ?auto_233794 ?auto_233795 ) ) ( not ( = ?auto_233794 ?auto_233796 ) ) ( not ( = ?auto_233795 ?auto_233796 ) ) ( ON ?auto_233794 ?auto_233795 ) ( ON ?auto_233793 ?auto_233794 ) ( ON ?auto_233792 ?auto_233793 ) ( CLEAR ?auto_233790 ) ( ON ?auto_233791 ?auto_233792 ) ( CLEAR ?auto_233791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233789 ?auto_233790 ?auto_233791 )
      ( MAKE-7PILE ?auto_233789 ?auto_233790 ?auto_233791 ?auto_233792 ?auto_233793 ?auto_233794 ?auto_233795 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233819 - BLOCK
      ?auto_233820 - BLOCK
      ?auto_233821 - BLOCK
      ?auto_233822 - BLOCK
      ?auto_233823 - BLOCK
      ?auto_233824 - BLOCK
      ?auto_233825 - BLOCK
    )
    :vars
    (
      ?auto_233826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233825 ?auto_233826 ) ( ON-TABLE ?auto_233819 ) ( not ( = ?auto_233819 ?auto_233820 ) ) ( not ( = ?auto_233819 ?auto_233821 ) ) ( not ( = ?auto_233819 ?auto_233822 ) ) ( not ( = ?auto_233819 ?auto_233823 ) ) ( not ( = ?auto_233819 ?auto_233824 ) ) ( not ( = ?auto_233819 ?auto_233825 ) ) ( not ( = ?auto_233819 ?auto_233826 ) ) ( not ( = ?auto_233820 ?auto_233821 ) ) ( not ( = ?auto_233820 ?auto_233822 ) ) ( not ( = ?auto_233820 ?auto_233823 ) ) ( not ( = ?auto_233820 ?auto_233824 ) ) ( not ( = ?auto_233820 ?auto_233825 ) ) ( not ( = ?auto_233820 ?auto_233826 ) ) ( not ( = ?auto_233821 ?auto_233822 ) ) ( not ( = ?auto_233821 ?auto_233823 ) ) ( not ( = ?auto_233821 ?auto_233824 ) ) ( not ( = ?auto_233821 ?auto_233825 ) ) ( not ( = ?auto_233821 ?auto_233826 ) ) ( not ( = ?auto_233822 ?auto_233823 ) ) ( not ( = ?auto_233822 ?auto_233824 ) ) ( not ( = ?auto_233822 ?auto_233825 ) ) ( not ( = ?auto_233822 ?auto_233826 ) ) ( not ( = ?auto_233823 ?auto_233824 ) ) ( not ( = ?auto_233823 ?auto_233825 ) ) ( not ( = ?auto_233823 ?auto_233826 ) ) ( not ( = ?auto_233824 ?auto_233825 ) ) ( not ( = ?auto_233824 ?auto_233826 ) ) ( not ( = ?auto_233825 ?auto_233826 ) ) ( ON ?auto_233824 ?auto_233825 ) ( ON ?auto_233823 ?auto_233824 ) ( ON ?auto_233822 ?auto_233823 ) ( ON ?auto_233821 ?auto_233822 ) ( CLEAR ?auto_233819 ) ( ON ?auto_233820 ?auto_233821 ) ( CLEAR ?auto_233820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233819 ?auto_233820 )
      ( MAKE-7PILE ?auto_233819 ?auto_233820 ?auto_233821 ?auto_233822 ?auto_233823 ?auto_233824 ?auto_233825 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_233849 - BLOCK
      ?auto_233850 - BLOCK
      ?auto_233851 - BLOCK
      ?auto_233852 - BLOCK
      ?auto_233853 - BLOCK
      ?auto_233854 - BLOCK
      ?auto_233855 - BLOCK
    )
    :vars
    (
      ?auto_233856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233855 ?auto_233856 ) ( not ( = ?auto_233849 ?auto_233850 ) ) ( not ( = ?auto_233849 ?auto_233851 ) ) ( not ( = ?auto_233849 ?auto_233852 ) ) ( not ( = ?auto_233849 ?auto_233853 ) ) ( not ( = ?auto_233849 ?auto_233854 ) ) ( not ( = ?auto_233849 ?auto_233855 ) ) ( not ( = ?auto_233849 ?auto_233856 ) ) ( not ( = ?auto_233850 ?auto_233851 ) ) ( not ( = ?auto_233850 ?auto_233852 ) ) ( not ( = ?auto_233850 ?auto_233853 ) ) ( not ( = ?auto_233850 ?auto_233854 ) ) ( not ( = ?auto_233850 ?auto_233855 ) ) ( not ( = ?auto_233850 ?auto_233856 ) ) ( not ( = ?auto_233851 ?auto_233852 ) ) ( not ( = ?auto_233851 ?auto_233853 ) ) ( not ( = ?auto_233851 ?auto_233854 ) ) ( not ( = ?auto_233851 ?auto_233855 ) ) ( not ( = ?auto_233851 ?auto_233856 ) ) ( not ( = ?auto_233852 ?auto_233853 ) ) ( not ( = ?auto_233852 ?auto_233854 ) ) ( not ( = ?auto_233852 ?auto_233855 ) ) ( not ( = ?auto_233852 ?auto_233856 ) ) ( not ( = ?auto_233853 ?auto_233854 ) ) ( not ( = ?auto_233853 ?auto_233855 ) ) ( not ( = ?auto_233853 ?auto_233856 ) ) ( not ( = ?auto_233854 ?auto_233855 ) ) ( not ( = ?auto_233854 ?auto_233856 ) ) ( not ( = ?auto_233855 ?auto_233856 ) ) ( ON ?auto_233854 ?auto_233855 ) ( ON ?auto_233853 ?auto_233854 ) ( ON ?auto_233852 ?auto_233853 ) ( ON ?auto_233851 ?auto_233852 ) ( ON ?auto_233850 ?auto_233851 ) ( ON ?auto_233849 ?auto_233850 ) ( CLEAR ?auto_233849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233849 )
      ( MAKE-7PILE ?auto_233849 ?auto_233850 ?auto_233851 ?auto_233852 ?auto_233853 ?auto_233854 ?auto_233855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233880 - BLOCK
      ?auto_233881 - BLOCK
      ?auto_233882 - BLOCK
      ?auto_233883 - BLOCK
      ?auto_233884 - BLOCK
      ?auto_233885 - BLOCK
      ?auto_233886 - BLOCK
      ?auto_233887 - BLOCK
    )
    :vars
    (
      ?auto_233888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_233886 ) ( ON ?auto_233887 ?auto_233888 ) ( CLEAR ?auto_233887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_233880 ) ( ON ?auto_233881 ?auto_233880 ) ( ON ?auto_233882 ?auto_233881 ) ( ON ?auto_233883 ?auto_233882 ) ( ON ?auto_233884 ?auto_233883 ) ( ON ?auto_233885 ?auto_233884 ) ( ON ?auto_233886 ?auto_233885 ) ( not ( = ?auto_233880 ?auto_233881 ) ) ( not ( = ?auto_233880 ?auto_233882 ) ) ( not ( = ?auto_233880 ?auto_233883 ) ) ( not ( = ?auto_233880 ?auto_233884 ) ) ( not ( = ?auto_233880 ?auto_233885 ) ) ( not ( = ?auto_233880 ?auto_233886 ) ) ( not ( = ?auto_233880 ?auto_233887 ) ) ( not ( = ?auto_233880 ?auto_233888 ) ) ( not ( = ?auto_233881 ?auto_233882 ) ) ( not ( = ?auto_233881 ?auto_233883 ) ) ( not ( = ?auto_233881 ?auto_233884 ) ) ( not ( = ?auto_233881 ?auto_233885 ) ) ( not ( = ?auto_233881 ?auto_233886 ) ) ( not ( = ?auto_233881 ?auto_233887 ) ) ( not ( = ?auto_233881 ?auto_233888 ) ) ( not ( = ?auto_233882 ?auto_233883 ) ) ( not ( = ?auto_233882 ?auto_233884 ) ) ( not ( = ?auto_233882 ?auto_233885 ) ) ( not ( = ?auto_233882 ?auto_233886 ) ) ( not ( = ?auto_233882 ?auto_233887 ) ) ( not ( = ?auto_233882 ?auto_233888 ) ) ( not ( = ?auto_233883 ?auto_233884 ) ) ( not ( = ?auto_233883 ?auto_233885 ) ) ( not ( = ?auto_233883 ?auto_233886 ) ) ( not ( = ?auto_233883 ?auto_233887 ) ) ( not ( = ?auto_233883 ?auto_233888 ) ) ( not ( = ?auto_233884 ?auto_233885 ) ) ( not ( = ?auto_233884 ?auto_233886 ) ) ( not ( = ?auto_233884 ?auto_233887 ) ) ( not ( = ?auto_233884 ?auto_233888 ) ) ( not ( = ?auto_233885 ?auto_233886 ) ) ( not ( = ?auto_233885 ?auto_233887 ) ) ( not ( = ?auto_233885 ?auto_233888 ) ) ( not ( = ?auto_233886 ?auto_233887 ) ) ( not ( = ?auto_233886 ?auto_233888 ) ) ( not ( = ?auto_233887 ?auto_233888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233887 ?auto_233888 )
      ( !STACK ?auto_233887 ?auto_233886 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233914 - BLOCK
      ?auto_233915 - BLOCK
      ?auto_233916 - BLOCK
      ?auto_233917 - BLOCK
      ?auto_233918 - BLOCK
      ?auto_233919 - BLOCK
      ?auto_233920 - BLOCK
      ?auto_233921 - BLOCK
    )
    :vars
    (
      ?auto_233922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233921 ?auto_233922 ) ( ON-TABLE ?auto_233914 ) ( ON ?auto_233915 ?auto_233914 ) ( ON ?auto_233916 ?auto_233915 ) ( ON ?auto_233917 ?auto_233916 ) ( ON ?auto_233918 ?auto_233917 ) ( ON ?auto_233919 ?auto_233918 ) ( not ( = ?auto_233914 ?auto_233915 ) ) ( not ( = ?auto_233914 ?auto_233916 ) ) ( not ( = ?auto_233914 ?auto_233917 ) ) ( not ( = ?auto_233914 ?auto_233918 ) ) ( not ( = ?auto_233914 ?auto_233919 ) ) ( not ( = ?auto_233914 ?auto_233920 ) ) ( not ( = ?auto_233914 ?auto_233921 ) ) ( not ( = ?auto_233914 ?auto_233922 ) ) ( not ( = ?auto_233915 ?auto_233916 ) ) ( not ( = ?auto_233915 ?auto_233917 ) ) ( not ( = ?auto_233915 ?auto_233918 ) ) ( not ( = ?auto_233915 ?auto_233919 ) ) ( not ( = ?auto_233915 ?auto_233920 ) ) ( not ( = ?auto_233915 ?auto_233921 ) ) ( not ( = ?auto_233915 ?auto_233922 ) ) ( not ( = ?auto_233916 ?auto_233917 ) ) ( not ( = ?auto_233916 ?auto_233918 ) ) ( not ( = ?auto_233916 ?auto_233919 ) ) ( not ( = ?auto_233916 ?auto_233920 ) ) ( not ( = ?auto_233916 ?auto_233921 ) ) ( not ( = ?auto_233916 ?auto_233922 ) ) ( not ( = ?auto_233917 ?auto_233918 ) ) ( not ( = ?auto_233917 ?auto_233919 ) ) ( not ( = ?auto_233917 ?auto_233920 ) ) ( not ( = ?auto_233917 ?auto_233921 ) ) ( not ( = ?auto_233917 ?auto_233922 ) ) ( not ( = ?auto_233918 ?auto_233919 ) ) ( not ( = ?auto_233918 ?auto_233920 ) ) ( not ( = ?auto_233918 ?auto_233921 ) ) ( not ( = ?auto_233918 ?auto_233922 ) ) ( not ( = ?auto_233919 ?auto_233920 ) ) ( not ( = ?auto_233919 ?auto_233921 ) ) ( not ( = ?auto_233919 ?auto_233922 ) ) ( not ( = ?auto_233920 ?auto_233921 ) ) ( not ( = ?auto_233920 ?auto_233922 ) ) ( not ( = ?auto_233921 ?auto_233922 ) ) ( CLEAR ?auto_233919 ) ( ON ?auto_233920 ?auto_233921 ) ( CLEAR ?auto_233920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_233914 ?auto_233915 ?auto_233916 ?auto_233917 ?auto_233918 ?auto_233919 ?auto_233920 )
      ( MAKE-8PILE ?auto_233914 ?auto_233915 ?auto_233916 ?auto_233917 ?auto_233918 ?auto_233919 ?auto_233920 ?auto_233921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233948 - BLOCK
      ?auto_233949 - BLOCK
      ?auto_233950 - BLOCK
      ?auto_233951 - BLOCK
      ?auto_233952 - BLOCK
      ?auto_233953 - BLOCK
      ?auto_233954 - BLOCK
      ?auto_233955 - BLOCK
    )
    :vars
    (
      ?auto_233956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233955 ?auto_233956 ) ( ON-TABLE ?auto_233948 ) ( ON ?auto_233949 ?auto_233948 ) ( ON ?auto_233950 ?auto_233949 ) ( ON ?auto_233951 ?auto_233950 ) ( ON ?auto_233952 ?auto_233951 ) ( not ( = ?auto_233948 ?auto_233949 ) ) ( not ( = ?auto_233948 ?auto_233950 ) ) ( not ( = ?auto_233948 ?auto_233951 ) ) ( not ( = ?auto_233948 ?auto_233952 ) ) ( not ( = ?auto_233948 ?auto_233953 ) ) ( not ( = ?auto_233948 ?auto_233954 ) ) ( not ( = ?auto_233948 ?auto_233955 ) ) ( not ( = ?auto_233948 ?auto_233956 ) ) ( not ( = ?auto_233949 ?auto_233950 ) ) ( not ( = ?auto_233949 ?auto_233951 ) ) ( not ( = ?auto_233949 ?auto_233952 ) ) ( not ( = ?auto_233949 ?auto_233953 ) ) ( not ( = ?auto_233949 ?auto_233954 ) ) ( not ( = ?auto_233949 ?auto_233955 ) ) ( not ( = ?auto_233949 ?auto_233956 ) ) ( not ( = ?auto_233950 ?auto_233951 ) ) ( not ( = ?auto_233950 ?auto_233952 ) ) ( not ( = ?auto_233950 ?auto_233953 ) ) ( not ( = ?auto_233950 ?auto_233954 ) ) ( not ( = ?auto_233950 ?auto_233955 ) ) ( not ( = ?auto_233950 ?auto_233956 ) ) ( not ( = ?auto_233951 ?auto_233952 ) ) ( not ( = ?auto_233951 ?auto_233953 ) ) ( not ( = ?auto_233951 ?auto_233954 ) ) ( not ( = ?auto_233951 ?auto_233955 ) ) ( not ( = ?auto_233951 ?auto_233956 ) ) ( not ( = ?auto_233952 ?auto_233953 ) ) ( not ( = ?auto_233952 ?auto_233954 ) ) ( not ( = ?auto_233952 ?auto_233955 ) ) ( not ( = ?auto_233952 ?auto_233956 ) ) ( not ( = ?auto_233953 ?auto_233954 ) ) ( not ( = ?auto_233953 ?auto_233955 ) ) ( not ( = ?auto_233953 ?auto_233956 ) ) ( not ( = ?auto_233954 ?auto_233955 ) ) ( not ( = ?auto_233954 ?auto_233956 ) ) ( not ( = ?auto_233955 ?auto_233956 ) ) ( ON ?auto_233954 ?auto_233955 ) ( CLEAR ?auto_233952 ) ( ON ?auto_233953 ?auto_233954 ) ( CLEAR ?auto_233953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_233948 ?auto_233949 ?auto_233950 ?auto_233951 ?auto_233952 ?auto_233953 )
      ( MAKE-8PILE ?auto_233948 ?auto_233949 ?auto_233950 ?auto_233951 ?auto_233952 ?auto_233953 ?auto_233954 ?auto_233955 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_233982 - BLOCK
      ?auto_233983 - BLOCK
      ?auto_233984 - BLOCK
      ?auto_233985 - BLOCK
      ?auto_233986 - BLOCK
      ?auto_233987 - BLOCK
      ?auto_233988 - BLOCK
      ?auto_233989 - BLOCK
    )
    :vars
    (
      ?auto_233990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233989 ?auto_233990 ) ( ON-TABLE ?auto_233982 ) ( ON ?auto_233983 ?auto_233982 ) ( ON ?auto_233984 ?auto_233983 ) ( ON ?auto_233985 ?auto_233984 ) ( not ( = ?auto_233982 ?auto_233983 ) ) ( not ( = ?auto_233982 ?auto_233984 ) ) ( not ( = ?auto_233982 ?auto_233985 ) ) ( not ( = ?auto_233982 ?auto_233986 ) ) ( not ( = ?auto_233982 ?auto_233987 ) ) ( not ( = ?auto_233982 ?auto_233988 ) ) ( not ( = ?auto_233982 ?auto_233989 ) ) ( not ( = ?auto_233982 ?auto_233990 ) ) ( not ( = ?auto_233983 ?auto_233984 ) ) ( not ( = ?auto_233983 ?auto_233985 ) ) ( not ( = ?auto_233983 ?auto_233986 ) ) ( not ( = ?auto_233983 ?auto_233987 ) ) ( not ( = ?auto_233983 ?auto_233988 ) ) ( not ( = ?auto_233983 ?auto_233989 ) ) ( not ( = ?auto_233983 ?auto_233990 ) ) ( not ( = ?auto_233984 ?auto_233985 ) ) ( not ( = ?auto_233984 ?auto_233986 ) ) ( not ( = ?auto_233984 ?auto_233987 ) ) ( not ( = ?auto_233984 ?auto_233988 ) ) ( not ( = ?auto_233984 ?auto_233989 ) ) ( not ( = ?auto_233984 ?auto_233990 ) ) ( not ( = ?auto_233985 ?auto_233986 ) ) ( not ( = ?auto_233985 ?auto_233987 ) ) ( not ( = ?auto_233985 ?auto_233988 ) ) ( not ( = ?auto_233985 ?auto_233989 ) ) ( not ( = ?auto_233985 ?auto_233990 ) ) ( not ( = ?auto_233986 ?auto_233987 ) ) ( not ( = ?auto_233986 ?auto_233988 ) ) ( not ( = ?auto_233986 ?auto_233989 ) ) ( not ( = ?auto_233986 ?auto_233990 ) ) ( not ( = ?auto_233987 ?auto_233988 ) ) ( not ( = ?auto_233987 ?auto_233989 ) ) ( not ( = ?auto_233987 ?auto_233990 ) ) ( not ( = ?auto_233988 ?auto_233989 ) ) ( not ( = ?auto_233988 ?auto_233990 ) ) ( not ( = ?auto_233989 ?auto_233990 ) ) ( ON ?auto_233988 ?auto_233989 ) ( ON ?auto_233987 ?auto_233988 ) ( CLEAR ?auto_233985 ) ( ON ?auto_233986 ?auto_233987 ) ( CLEAR ?auto_233986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233982 ?auto_233983 ?auto_233984 ?auto_233985 ?auto_233986 )
      ( MAKE-8PILE ?auto_233982 ?auto_233983 ?auto_233984 ?auto_233985 ?auto_233986 ?auto_233987 ?auto_233988 ?auto_233989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234016 - BLOCK
      ?auto_234017 - BLOCK
      ?auto_234018 - BLOCK
      ?auto_234019 - BLOCK
      ?auto_234020 - BLOCK
      ?auto_234021 - BLOCK
      ?auto_234022 - BLOCK
      ?auto_234023 - BLOCK
    )
    :vars
    (
      ?auto_234024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234023 ?auto_234024 ) ( ON-TABLE ?auto_234016 ) ( ON ?auto_234017 ?auto_234016 ) ( ON ?auto_234018 ?auto_234017 ) ( not ( = ?auto_234016 ?auto_234017 ) ) ( not ( = ?auto_234016 ?auto_234018 ) ) ( not ( = ?auto_234016 ?auto_234019 ) ) ( not ( = ?auto_234016 ?auto_234020 ) ) ( not ( = ?auto_234016 ?auto_234021 ) ) ( not ( = ?auto_234016 ?auto_234022 ) ) ( not ( = ?auto_234016 ?auto_234023 ) ) ( not ( = ?auto_234016 ?auto_234024 ) ) ( not ( = ?auto_234017 ?auto_234018 ) ) ( not ( = ?auto_234017 ?auto_234019 ) ) ( not ( = ?auto_234017 ?auto_234020 ) ) ( not ( = ?auto_234017 ?auto_234021 ) ) ( not ( = ?auto_234017 ?auto_234022 ) ) ( not ( = ?auto_234017 ?auto_234023 ) ) ( not ( = ?auto_234017 ?auto_234024 ) ) ( not ( = ?auto_234018 ?auto_234019 ) ) ( not ( = ?auto_234018 ?auto_234020 ) ) ( not ( = ?auto_234018 ?auto_234021 ) ) ( not ( = ?auto_234018 ?auto_234022 ) ) ( not ( = ?auto_234018 ?auto_234023 ) ) ( not ( = ?auto_234018 ?auto_234024 ) ) ( not ( = ?auto_234019 ?auto_234020 ) ) ( not ( = ?auto_234019 ?auto_234021 ) ) ( not ( = ?auto_234019 ?auto_234022 ) ) ( not ( = ?auto_234019 ?auto_234023 ) ) ( not ( = ?auto_234019 ?auto_234024 ) ) ( not ( = ?auto_234020 ?auto_234021 ) ) ( not ( = ?auto_234020 ?auto_234022 ) ) ( not ( = ?auto_234020 ?auto_234023 ) ) ( not ( = ?auto_234020 ?auto_234024 ) ) ( not ( = ?auto_234021 ?auto_234022 ) ) ( not ( = ?auto_234021 ?auto_234023 ) ) ( not ( = ?auto_234021 ?auto_234024 ) ) ( not ( = ?auto_234022 ?auto_234023 ) ) ( not ( = ?auto_234022 ?auto_234024 ) ) ( not ( = ?auto_234023 ?auto_234024 ) ) ( ON ?auto_234022 ?auto_234023 ) ( ON ?auto_234021 ?auto_234022 ) ( ON ?auto_234020 ?auto_234021 ) ( CLEAR ?auto_234018 ) ( ON ?auto_234019 ?auto_234020 ) ( CLEAR ?auto_234019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234016 ?auto_234017 ?auto_234018 ?auto_234019 )
      ( MAKE-8PILE ?auto_234016 ?auto_234017 ?auto_234018 ?auto_234019 ?auto_234020 ?auto_234021 ?auto_234022 ?auto_234023 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234050 - BLOCK
      ?auto_234051 - BLOCK
      ?auto_234052 - BLOCK
      ?auto_234053 - BLOCK
      ?auto_234054 - BLOCK
      ?auto_234055 - BLOCK
      ?auto_234056 - BLOCK
      ?auto_234057 - BLOCK
    )
    :vars
    (
      ?auto_234058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234057 ?auto_234058 ) ( ON-TABLE ?auto_234050 ) ( ON ?auto_234051 ?auto_234050 ) ( not ( = ?auto_234050 ?auto_234051 ) ) ( not ( = ?auto_234050 ?auto_234052 ) ) ( not ( = ?auto_234050 ?auto_234053 ) ) ( not ( = ?auto_234050 ?auto_234054 ) ) ( not ( = ?auto_234050 ?auto_234055 ) ) ( not ( = ?auto_234050 ?auto_234056 ) ) ( not ( = ?auto_234050 ?auto_234057 ) ) ( not ( = ?auto_234050 ?auto_234058 ) ) ( not ( = ?auto_234051 ?auto_234052 ) ) ( not ( = ?auto_234051 ?auto_234053 ) ) ( not ( = ?auto_234051 ?auto_234054 ) ) ( not ( = ?auto_234051 ?auto_234055 ) ) ( not ( = ?auto_234051 ?auto_234056 ) ) ( not ( = ?auto_234051 ?auto_234057 ) ) ( not ( = ?auto_234051 ?auto_234058 ) ) ( not ( = ?auto_234052 ?auto_234053 ) ) ( not ( = ?auto_234052 ?auto_234054 ) ) ( not ( = ?auto_234052 ?auto_234055 ) ) ( not ( = ?auto_234052 ?auto_234056 ) ) ( not ( = ?auto_234052 ?auto_234057 ) ) ( not ( = ?auto_234052 ?auto_234058 ) ) ( not ( = ?auto_234053 ?auto_234054 ) ) ( not ( = ?auto_234053 ?auto_234055 ) ) ( not ( = ?auto_234053 ?auto_234056 ) ) ( not ( = ?auto_234053 ?auto_234057 ) ) ( not ( = ?auto_234053 ?auto_234058 ) ) ( not ( = ?auto_234054 ?auto_234055 ) ) ( not ( = ?auto_234054 ?auto_234056 ) ) ( not ( = ?auto_234054 ?auto_234057 ) ) ( not ( = ?auto_234054 ?auto_234058 ) ) ( not ( = ?auto_234055 ?auto_234056 ) ) ( not ( = ?auto_234055 ?auto_234057 ) ) ( not ( = ?auto_234055 ?auto_234058 ) ) ( not ( = ?auto_234056 ?auto_234057 ) ) ( not ( = ?auto_234056 ?auto_234058 ) ) ( not ( = ?auto_234057 ?auto_234058 ) ) ( ON ?auto_234056 ?auto_234057 ) ( ON ?auto_234055 ?auto_234056 ) ( ON ?auto_234054 ?auto_234055 ) ( ON ?auto_234053 ?auto_234054 ) ( CLEAR ?auto_234051 ) ( ON ?auto_234052 ?auto_234053 ) ( CLEAR ?auto_234052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234050 ?auto_234051 ?auto_234052 )
      ( MAKE-8PILE ?auto_234050 ?auto_234051 ?auto_234052 ?auto_234053 ?auto_234054 ?auto_234055 ?auto_234056 ?auto_234057 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234084 - BLOCK
      ?auto_234085 - BLOCK
      ?auto_234086 - BLOCK
      ?auto_234087 - BLOCK
      ?auto_234088 - BLOCK
      ?auto_234089 - BLOCK
      ?auto_234090 - BLOCK
      ?auto_234091 - BLOCK
    )
    :vars
    (
      ?auto_234092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234091 ?auto_234092 ) ( ON-TABLE ?auto_234084 ) ( not ( = ?auto_234084 ?auto_234085 ) ) ( not ( = ?auto_234084 ?auto_234086 ) ) ( not ( = ?auto_234084 ?auto_234087 ) ) ( not ( = ?auto_234084 ?auto_234088 ) ) ( not ( = ?auto_234084 ?auto_234089 ) ) ( not ( = ?auto_234084 ?auto_234090 ) ) ( not ( = ?auto_234084 ?auto_234091 ) ) ( not ( = ?auto_234084 ?auto_234092 ) ) ( not ( = ?auto_234085 ?auto_234086 ) ) ( not ( = ?auto_234085 ?auto_234087 ) ) ( not ( = ?auto_234085 ?auto_234088 ) ) ( not ( = ?auto_234085 ?auto_234089 ) ) ( not ( = ?auto_234085 ?auto_234090 ) ) ( not ( = ?auto_234085 ?auto_234091 ) ) ( not ( = ?auto_234085 ?auto_234092 ) ) ( not ( = ?auto_234086 ?auto_234087 ) ) ( not ( = ?auto_234086 ?auto_234088 ) ) ( not ( = ?auto_234086 ?auto_234089 ) ) ( not ( = ?auto_234086 ?auto_234090 ) ) ( not ( = ?auto_234086 ?auto_234091 ) ) ( not ( = ?auto_234086 ?auto_234092 ) ) ( not ( = ?auto_234087 ?auto_234088 ) ) ( not ( = ?auto_234087 ?auto_234089 ) ) ( not ( = ?auto_234087 ?auto_234090 ) ) ( not ( = ?auto_234087 ?auto_234091 ) ) ( not ( = ?auto_234087 ?auto_234092 ) ) ( not ( = ?auto_234088 ?auto_234089 ) ) ( not ( = ?auto_234088 ?auto_234090 ) ) ( not ( = ?auto_234088 ?auto_234091 ) ) ( not ( = ?auto_234088 ?auto_234092 ) ) ( not ( = ?auto_234089 ?auto_234090 ) ) ( not ( = ?auto_234089 ?auto_234091 ) ) ( not ( = ?auto_234089 ?auto_234092 ) ) ( not ( = ?auto_234090 ?auto_234091 ) ) ( not ( = ?auto_234090 ?auto_234092 ) ) ( not ( = ?auto_234091 ?auto_234092 ) ) ( ON ?auto_234090 ?auto_234091 ) ( ON ?auto_234089 ?auto_234090 ) ( ON ?auto_234088 ?auto_234089 ) ( ON ?auto_234087 ?auto_234088 ) ( ON ?auto_234086 ?auto_234087 ) ( CLEAR ?auto_234084 ) ( ON ?auto_234085 ?auto_234086 ) ( CLEAR ?auto_234085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234084 ?auto_234085 )
      ( MAKE-8PILE ?auto_234084 ?auto_234085 ?auto_234086 ?auto_234087 ?auto_234088 ?auto_234089 ?auto_234090 ?auto_234091 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_234118 - BLOCK
      ?auto_234119 - BLOCK
      ?auto_234120 - BLOCK
      ?auto_234121 - BLOCK
      ?auto_234122 - BLOCK
      ?auto_234123 - BLOCK
      ?auto_234124 - BLOCK
      ?auto_234125 - BLOCK
    )
    :vars
    (
      ?auto_234126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234125 ?auto_234126 ) ( not ( = ?auto_234118 ?auto_234119 ) ) ( not ( = ?auto_234118 ?auto_234120 ) ) ( not ( = ?auto_234118 ?auto_234121 ) ) ( not ( = ?auto_234118 ?auto_234122 ) ) ( not ( = ?auto_234118 ?auto_234123 ) ) ( not ( = ?auto_234118 ?auto_234124 ) ) ( not ( = ?auto_234118 ?auto_234125 ) ) ( not ( = ?auto_234118 ?auto_234126 ) ) ( not ( = ?auto_234119 ?auto_234120 ) ) ( not ( = ?auto_234119 ?auto_234121 ) ) ( not ( = ?auto_234119 ?auto_234122 ) ) ( not ( = ?auto_234119 ?auto_234123 ) ) ( not ( = ?auto_234119 ?auto_234124 ) ) ( not ( = ?auto_234119 ?auto_234125 ) ) ( not ( = ?auto_234119 ?auto_234126 ) ) ( not ( = ?auto_234120 ?auto_234121 ) ) ( not ( = ?auto_234120 ?auto_234122 ) ) ( not ( = ?auto_234120 ?auto_234123 ) ) ( not ( = ?auto_234120 ?auto_234124 ) ) ( not ( = ?auto_234120 ?auto_234125 ) ) ( not ( = ?auto_234120 ?auto_234126 ) ) ( not ( = ?auto_234121 ?auto_234122 ) ) ( not ( = ?auto_234121 ?auto_234123 ) ) ( not ( = ?auto_234121 ?auto_234124 ) ) ( not ( = ?auto_234121 ?auto_234125 ) ) ( not ( = ?auto_234121 ?auto_234126 ) ) ( not ( = ?auto_234122 ?auto_234123 ) ) ( not ( = ?auto_234122 ?auto_234124 ) ) ( not ( = ?auto_234122 ?auto_234125 ) ) ( not ( = ?auto_234122 ?auto_234126 ) ) ( not ( = ?auto_234123 ?auto_234124 ) ) ( not ( = ?auto_234123 ?auto_234125 ) ) ( not ( = ?auto_234123 ?auto_234126 ) ) ( not ( = ?auto_234124 ?auto_234125 ) ) ( not ( = ?auto_234124 ?auto_234126 ) ) ( not ( = ?auto_234125 ?auto_234126 ) ) ( ON ?auto_234124 ?auto_234125 ) ( ON ?auto_234123 ?auto_234124 ) ( ON ?auto_234122 ?auto_234123 ) ( ON ?auto_234121 ?auto_234122 ) ( ON ?auto_234120 ?auto_234121 ) ( ON ?auto_234119 ?auto_234120 ) ( ON ?auto_234118 ?auto_234119 ) ( CLEAR ?auto_234118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234118 )
      ( MAKE-8PILE ?auto_234118 ?auto_234119 ?auto_234120 ?auto_234121 ?auto_234122 ?auto_234123 ?auto_234124 ?auto_234125 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234153 - BLOCK
      ?auto_234154 - BLOCK
      ?auto_234155 - BLOCK
      ?auto_234156 - BLOCK
      ?auto_234157 - BLOCK
      ?auto_234158 - BLOCK
      ?auto_234159 - BLOCK
      ?auto_234160 - BLOCK
      ?auto_234161 - BLOCK
    )
    :vars
    (
      ?auto_234162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234160 ) ( ON ?auto_234161 ?auto_234162 ) ( CLEAR ?auto_234161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234153 ) ( ON ?auto_234154 ?auto_234153 ) ( ON ?auto_234155 ?auto_234154 ) ( ON ?auto_234156 ?auto_234155 ) ( ON ?auto_234157 ?auto_234156 ) ( ON ?auto_234158 ?auto_234157 ) ( ON ?auto_234159 ?auto_234158 ) ( ON ?auto_234160 ?auto_234159 ) ( not ( = ?auto_234153 ?auto_234154 ) ) ( not ( = ?auto_234153 ?auto_234155 ) ) ( not ( = ?auto_234153 ?auto_234156 ) ) ( not ( = ?auto_234153 ?auto_234157 ) ) ( not ( = ?auto_234153 ?auto_234158 ) ) ( not ( = ?auto_234153 ?auto_234159 ) ) ( not ( = ?auto_234153 ?auto_234160 ) ) ( not ( = ?auto_234153 ?auto_234161 ) ) ( not ( = ?auto_234153 ?auto_234162 ) ) ( not ( = ?auto_234154 ?auto_234155 ) ) ( not ( = ?auto_234154 ?auto_234156 ) ) ( not ( = ?auto_234154 ?auto_234157 ) ) ( not ( = ?auto_234154 ?auto_234158 ) ) ( not ( = ?auto_234154 ?auto_234159 ) ) ( not ( = ?auto_234154 ?auto_234160 ) ) ( not ( = ?auto_234154 ?auto_234161 ) ) ( not ( = ?auto_234154 ?auto_234162 ) ) ( not ( = ?auto_234155 ?auto_234156 ) ) ( not ( = ?auto_234155 ?auto_234157 ) ) ( not ( = ?auto_234155 ?auto_234158 ) ) ( not ( = ?auto_234155 ?auto_234159 ) ) ( not ( = ?auto_234155 ?auto_234160 ) ) ( not ( = ?auto_234155 ?auto_234161 ) ) ( not ( = ?auto_234155 ?auto_234162 ) ) ( not ( = ?auto_234156 ?auto_234157 ) ) ( not ( = ?auto_234156 ?auto_234158 ) ) ( not ( = ?auto_234156 ?auto_234159 ) ) ( not ( = ?auto_234156 ?auto_234160 ) ) ( not ( = ?auto_234156 ?auto_234161 ) ) ( not ( = ?auto_234156 ?auto_234162 ) ) ( not ( = ?auto_234157 ?auto_234158 ) ) ( not ( = ?auto_234157 ?auto_234159 ) ) ( not ( = ?auto_234157 ?auto_234160 ) ) ( not ( = ?auto_234157 ?auto_234161 ) ) ( not ( = ?auto_234157 ?auto_234162 ) ) ( not ( = ?auto_234158 ?auto_234159 ) ) ( not ( = ?auto_234158 ?auto_234160 ) ) ( not ( = ?auto_234158 ?auto_234161 ) ) ( not ( = ?auto_234158 ?auto_234162 ) ) ( not ( = ?auto_234159 ?auto_234160 ) ) ( not ( = ?auto_234159 ?auto_234161 ) ) ( not ( = ?auto_234159 ?auto_234162 ) ) ( not ( = ?auto_234160 ?auto_234161 ) ) ( not ( = ?auto_234160 ?auto_234162 ) ) ( not ( = ?auto_234161 ?auto_234162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234161 ?auto_234162 )
      ( !STACK ?auto_234161 ?auto_234160 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234191 - BLOCK
      ?auto_234192 - BLOCK
      ?auto_234193 - BLOCK
      ?auto_234194 - BLOCK
      ?auto_234195 - BLOCK
      ?auto_234196 - BLOCK
      ?auto_234197 - BLOCK
      ?auto_234198 - BLOCK
      ?auto_234199 - BLOCK
    )
    :vars
    (
      ?auto_234200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234199 ?auto_234200 ) ( ON-TABLE ?auto_234191 ) ( ON ?auto_234192 ?auto_234191 ) ( ON ?auto_234193 ?auto_234192 ) ( ON ?auto_234194 ?auto_234193 ) ( ON ?auto_234195 ?auto_234194 ) ( ON ?auto_234196 ?auto_234195 ) ( ON ?auto_234197 ?auto_234196 ) ( not ( = ?auto_234191 ?auto_234192 ) ) ( not ( = ?auto_234191 ?auto_234193 ) ) ( not ( = ?auto_234191 ?auto_234194 ) ) ( not ( = ?auto_234191 ?auto_234195 ) ) ( not ( = ?auto_234191 ?auto_234196 ) ) ( not ( = ?auto_234191 ?auto_234197 ) ) ( not ( = ?auto_234191 ?auto_234198 ) ) ( not ( = ?auto_234191 ?auto_234199 ) ) ( not ( = ?auto_234191 ?auto_234200 ) ) ( not ( = ?auto_234192 ?auto_234193 ) ) ( not ( = ?auto_234192 ?auto_234194 ) ) ( not ( = ?auto_234192 ?auto_234195 ) ) ( not ( = ?auto_234192 ?auto_234196 ) ) ( not ( = ?auto_234192 ?auto_234197 ) ) ( not ( = ?auto_234192 ?auto_234198 ) ) ( not ( = ?auto_234192 ?auto_234199 ) ) ( not ( = ?auto_234192 ?auto_234200 ) ) ( not ( = ?auto_234193 ?auto_234194 ) ) ( not ( = ?auto_234193 ?auto_234195 ) ) ( not ( = ?auto_234193 ?auto_234196 ) ) ( not ( = ?auto_234193 ?auto_234197 ) ) ( not ( = ?auto_234193 ?auto_234198 ) ) ( not ( = ?auto_234193 ?auto_234199 ) ) ( not ( = ?auto_234193 ?auto_234200 ) ) ( not ( = ?auto_234194 ?auto_234195 ) ) ( not ( = ?auto_234194 ?auto_234196 ) ) ( not ( = ?auto_234194 ?auto_234197 ) ) ( not ( = ?auto_234194 ?auto_234198 ) ) ( not ( = ?auto_234194 ?auto_234199 ) ) ( not ( = ?auto_234194 ?auto_234200 ) ) ( not ( = ?auto_234195 ?auto_234196 ) ) ( not ( = ?auto_234195 ?auto_234197 ) ) ( not ( = ?auto_234195 ?auto_234198 ) ) ( not ( = ?auto_234195 ?auto_234199 ) ) ( not ( = ?auto_234195 ?auto_234200 ) ) ( not ( = ?auto_234196 ?auto_234197 ) ) ( not ( = ?auto_234196 ?auto_234198 ) ) ( not ( = ?auto_234196 ?auto_234199 ) ) ( not ( = ?auto_234196 ?auto_234200 ) ) ( not ( = ?auto_234197 ?auto_234198 ) ) ( not ( = ?auto_234197 ?auto_234199 ) ) ( not ( = ?auto_234197 ?auto_234200 ) ) ( not ( = ?auto_234198 ?auto_234199 ) ) ( not ( = ?auto_234198 ?auto_234200 ) ) ( not ( = ?auto_234199 ?auto_234200 ) ) ( CLEAR ?auto_234197 ) ( ON ?auto_234198 ?auto_234199 ) ( CLEAR ?auto_234198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_234191 ?auto_234192 ?auto_234193 ?auto_234194 ?auto_234195 ?auto_234196 ?auto_234197 ?auto_234198 )
      ( MAKE-9PILE ?auto_234191 ?auto_234192 ?auto_234193 ?auto_234194 ?auto_234195 ?auto_234196 ?auto_234197 ?auto_234198 ?auto_234199 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234229 - BLOCK
      ?auto_234230 - BLOCK
      ?auto_234231 - BLOCK
      ?auto_234232 - BLOCK
      ?auto_234233 - BLOCK
      ?auto_234234 - BLOCK
      ?auto_234235 - BLOCK
      ?auto_234236 - BLOCK
      ?auto_234237 - BLOCK
    )
    :vars
    (
      ?auto_234238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234237 ?auto_234238 ) ( ON-TABLE ?auto_234229 ) ( ON ?auto_234230 ?auto_234229 ) ( ON ?auto_234231 ?auto_234230 ) ( ON ?auto_234232 ?auto_234231 ) ( ON ?auto_234233 ?auto_234232 ) ( ON ?auto_234234 ?auto_234233 ) ( not ( = ?auto_234229 ?auto_234230 ) ) ( not ( = ?auto_234229 ?auto_234231 ) ) ( not ( = ?auto_234229 ?auto_234232 ) ) ( not ( = ?auto_234229 ?auto_234233 ) ) ( not ( = ?auto_234229 ?auto_234234 ) ) ( not ( = ?auto_234229 ?auto_234235 ) ) ( not ( = ?auto_234229 ?auto_234236 ) ) ( not ( = ?auto_234229 ?auto_234237 ) ) ( not ( = ?auto_234229 ?auto_234238 ) ) ( not ( = ?auto_234230 ?auto_234231 ) ) ( not ( = ?auto_234230 ?auto_234232 ) ) ( not ( = ?auto_234230 ?auto_234233 ) ) ( not ( = ?auto_234230 ?auto_234234 ) ) ( not ( = ?auto_234230 ?auto_234235 ) ) ( not ( = ?auto_234230 ?auto_234236 ) ) ( not ( = ?auto_234230 ?auto_234237 ) ) ( not ( = ?auto_234230 ?auto_234238 ) ) ( not ( = ?auto_234231 ?auto_234232 ) ) ( not ( = ?auto_234231 ?auto_234233 ) ) ( not ( = ?auto_234231 ?auto_234234 ) ) ( not ( = ?auto_234231 ?auto_234235 ) ) ( not ( = ?auto_234231 ?auto_234236 ) ) ( not ( = ?auto_234231 ?auto_234237 ) ) ( not ( = ?auto_234231 ?auto_234238 ) ) ( not ( = ?auto_234232 ?auto_234233 ) ) ( not ( = ?auto_234232 ?auto_234234 ) ) ( not ( = ?auto_234232 ?auto_234235 ) ) ( not ( = ?auto_234232 ?auto_234236 ) ) ( not ( = ?auto_234232 ?auto_234237 ) ) ( not ( = ?auto_234232 ?auto_234238 ) ) ( not ( = ?auto_234233 ?auto_234234 ) ) ( not ( = ?auto_234233 ?auto_234235 ) ) ( not ( = ?auto_234233 ?auto_234236 ) ) ( not ( = ?auto_234233 ?auto_234237 ) ) ( not ( = ?auto_234233 ?auto_234238 ) ) ( not ( = ?auto_234234 ?auto_234235 ) ) ( not ( = ?auto_234234 ?auto_234236 ) ) ( not ( = ?auto_234234 ?auto_234237 ) ) ( not ( = ?auto_234234 ?auto_234238 ) ) ( not ( = ?auto_234235 ?auto_234236 ) ) ( not ( = ?auto_234235 ?auto_234237 ) ) ( not ( = ?auto_234235 ?auto_234238 ) ) ( not ( = ?auto_234236 ?auto_234237 ) ) ( not ( = ?auto_234236 ?auto_234238 ) ) ( not ( = ?auto_234237 ?auto_234238 ) ) ( ON ?auto_234236 ?auto_234237 ) ( CLEAR ?auto_234234 ) ( ON ?auto_234235 ?auto_234236 ) ( CLEAR ?auto_234235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_234229 ?auto_234230 ?auto_234231 ?auto_234232 ?auto_234233 ?auto_234234 ?auto_234235 )
      ( MAKE-9PILE ?auto_234229 ?auto_234230 ?auto_234231 ?auto_234232 ?auto_234233 ?auto_234234 ?auto_234235 ?auto_234236 ?auto_234237 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234267 - BLOCK
      ?auto_234268 - BLOCK
      ?auto_234269 - BLOCK
      ?auto_234270 - BLOCK
      ?auto_234271 - BLOCK
      ?auto_234272 - BLOCK
      ?auto_234273 - BLOCK
      ?auto_234274 - BLOCK
      ?auto_234275 - BLOCK
    )
    :vars
    (
      ?auto_234276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234275 ?auto_234276 ) ( ON-TABLE ?auto_234267 ) ( ON ?auto_234268 ?auto_234267 ) ( ON ?auto_234269 ?auto_234268 ) ( ON ?auto_234270 ?auto_234269 ) ( ON ?auto_234271 ?auto_234270 ) ( not ( = ?auto_234267 ?auto_234268 ) ) ( not ( = ?auto_234267 ?auto_234269 ) ) ( not ( = ?auto_234267 ?auto_234270 ) ) ( not ( = ?auto_234267 ?auto_234271 ) ) ( not ( = ?auto_234267 ?auto_234272 ) ) ( not ( = ?auto_234267 ?auto_234273 ) ) ( not ( = ?auto_234267 ?auto_234274 ) ) ( not ( = ?auto_234267 ?auto_234275 ) ) ( not ( = ?auto_234267 ?auto_234276 ) ) ( not ( = ?auto_234268 ?auto_234269 ) ) ( not ( = ?auto_234268 ?auto_234270 ) ) ( not ( = ?auto_234268 ?auto_234271 ) ) ( not ( = ?auto_234268 ?auto_234272 ) ) ( not ( = ?auto_234268 ?auto_234273 ) ) ( not ( = ?auto_234268 ?auto_234274 ) ) ( not ( = ?auto_234268 ?auto_234275 ) ) ( not ( = ?auto_234268 ?auto_234276 ) ) ( not ( = ?auto_234269 ?auto_234270 ) ) ( not ( = ?auto_234269 ?auto_234271 ) ) ( not ( = ?auto_234269 ?auto_234272 ) ) ( not ( = ?auto_234269 ?auto_234273 ) ) ( not ( = ?auto_234269 ?auto_234274 ) ) ( not ( = ?auto_234269 ?auto_234275 ) ) ( not ( = ?auto_234269 ?auto_234276 ) ) ( not ( = ?auto_234270 ?auto_234271 ) ) ( not ( = ?auto_234270 ?auto_234272 ) ) ( not ( = ?auto_234270 ?auto_234273 ) ) ( not ( = ?auto_234270 ?auto_234274 ) ) ( not ( = ?auto_234270 ?auto_234275 ) ) ( not ( = ?auto_234270 ?auto_234276 ) ) ( not ( = ?auto_234271 ?auto_234272 ) ) ( not ( = ?auto_234271 ?auto_234273 ) ) ( not ( = ?auto_234271 ?auto_234274 ) ) ( not ( = ?auto_234271 ?auto_234275 ) ) ( not ( = ?auto_234271 ?auto_234276 ) ) ( not ( = ?auto_234272 ?auto_234273 ) ) ( not ( = ?auto_234272 ?auto_234274 ) ) ( not ( = ?auto_234272 ?auto_234275 ) ) ( not ( = ?auto_234272 ?auto_234276 ) ) ( not ( = ?auto_234273 ?auto_234274 ) ) ( not ( = ?auto_234273 ?auto_234275 ) ) ( not ( = ?auto_234273 ?auto_234276 ) ) ( not ( = ?auto_234274 ?auto_234275 ) ) ( not ( = ?auto_234274 ?auto_234276 ) ) ( not ( = ?auto_234275 ?auto_234276 ) ) ( ON ?auto_234274 ?auto_234275 ) ( ON ?auto_234273 ?auto_234274 ) ( CLEAR ?auto_234271 ) ( ON ?auto_234272 ?auto_234273 ) ( CLEAR ?auto_234272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_234267 ?auto_234268 ?auto_234269 ?auto_234270 ?auto_234271 ?auto_234272 )
      ( MAKE-9PILE ?auto_234267 ?auto_234268 ?auto_234269 ?auto_234270 ?auto_234271 ?auto_234272 ?auto_234273 ?auto_234274 ?auto_234275 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234305 - BLOCK
      ?auto_234306 - BLOCK
      ?auto_234307 - BLOCK
      ?auto_234308 - BLOCK
      ?auto_234309 - BLOCK
      ?auto_234310 - BLOCK
      ?auto_234311 - BLOCK
      ?auto_234312 - BLOCK
      ?auto_234313 - BLOCK
    )
    :vars
    (
      ?auto_234314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234313 ?auto_234314 ) ( ON-TABLE ?auto_234305 ) ( ON ?auto_234306 ?auto_234305 ) ( ON ?auto_234307 ?auto_234306 ) ( ON ?auto_234308 ?auto_234307 ) ( not ( = ?auto_234305 ?auto_234306 ) ) ( not ( = ?auto_234305 ?auto_234307 ) ) ( not ( = ?auto_234305 ?auto_234308 ) ) ( not ( = ?auto_234305 ?auto_234309 ) ) ( not ( = ?auto_234305 ?auto_234310 ) ) ( not ( = ?auto_234305 ?auto_234311 ) ) ( not ( = ?auto_234305 ?auto_234312 ) ) ( not ( = ?auto_234305 ?auto_234313 ) ) ( not ( = ?auto_234305 ?auto_234314 ) ) ( not ( = ?auto_234306 ?auto_234307 ) ) ( not ( = ?auto_234306 ?auto_234308 ) ) ( not ( = ?auto_234306 ?auto_234309 ) ) ( not ( = ?auto_234306 ?auto_234310 ) ) ( not ( = ?auto_234306 ?auto_234311 ) ) ( not ( = ?auto_234306 ?auto_234312 ) ) ( not ( = ?auto_234306 ?auto_234313 ) ) ( not ( = ?auto_234306 ?auto_234314 ) ) ( not ( = ?auto_234307 ?auto_234308 ) ) ( not ( = ?auto_234307 ?auto_234309 ) ) ( not ( = ?auto_234307 ?auto_234310 ) ) ( not ( = ?auto_234307 ?auto_234311 ) ) ( not ( = ?auto_234307 ?auto_234312 ) ) ( not ( = ?auto_234307 ?auto_234313 ) ) ( not ( = ?auto_234307 ?auto_234314 ) ) ( not ( = ?auto_234308 ?auto_234309 ) ) ( not ( = ?auto_234308 ?auto_234310 ) ) ( not ( = ?auto_234308 ?auto_234311 ) ) ( not ( = ?auto_234308 ?auto_234312 ) ) ( not ( = ?auto_234308 ?auto_234313 ) ) ( not ( = ?auto_234308 ?auto_234314 ) ) ( not ( = ?auto_234309 ?auto_234310 ) ) ( not ( = ?auto_234309 ?auto_234311 ) ) ( not ( = ?auto_234309 ?auto_234312 ) ) ( not ( = ?auto_234309 ?auto_234313 ) ) ( not ( = ?auto_234309 ?auto_234314 ) ) ( not ( = ?auto_234310 ?auto_234311 ) ) ( not ( = ?auto_234310 ?auto_234312 ) ) ( not ( = ?auto_234310 ?auto_234313 ) ) ( not ( = ?auto_234310 ?auto_234314 ) ) ( not ( = ?auto_234311 ?auto_234312 ) ) ( not ( = ?auto_234311 ?auto_234313 ) ) ( not ( = ?auto_234311 ?auto_234314 ) ) ( not ( = ?auto_234312 ?auto_234313 ) ) ( not ( = ?auto_234312 ?auto_234314 ) ) ( not ( = ?auto_234313 ?auto_234314 ) ) ( ON ?auto_234312 ?auto_234313 ) ( ON ?auto_234311 ?auto_234312 ) ( ON ?auto_234310 ?auto_234311 ) ( CLEAR ?auto_234308 ) ( ON ?auto_234309 ?auto_234310 ) ( CLEAR ?auto_234309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_234305 ?auto_234306 ?auto_234307 ?auto_234308 ?auto_234309 )
      ( MAKE-9PILE ?auto_234305 ?auto_234306 ?auto_234307 ?auto_234308 ?auto_234309 ?auto_234310 ?auto_234311 ?auto_234312 ?auto_234313 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234343 - BLOCK
      ?auto_234344 - BLOCK
      ?auto_234345 - BLOCK
      ?auto_234346 - BLOCK
      ?auto_234347 - BLOCK
      ?auto_234348 - BLOCK
      ?auto_234349 - BLOCK
      ?auto_234350 - BLOCK
      ?auto_234351 - BLOCK
    )
    :vars
    (
      ?auto_234352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234351 ?auto_234352 ) ( ON-TABLE ?auto_234343 ) ( ON ?auto_234344 ?auto_234343 ) ( ON ?auto_234345 ?auto_234344 ) ( not ( = ?auto_234343 ?auto_234344 ) ) ( not ( = ?auto_234343 ?auto_234345 ) ) ( not ( = ?auto_234343 ?auto_234346 ) ) ( not ( = ?auto_234343 ?auto_234347 ) ) ( not ( = ?auto_234343 ?auto_234348 ) ) ( not ( = ?auto_234343 ?auto_234349 ) ) ( not ( = ?auto_234343 ?auto_234350 ) ) ( not ( = ?auto_234343 ?auto_234351 ) ) ( not ( = ?auto_234343 ?auto_234352 ) ) ( not ( = ?auto_234344 ?auto_234345 ) ) ( not ( = ?auto_234344 ?auto_234346 ) ) ( not ( = ?auto_234344 ?auto_234347 ) ) ( not ( = ?auto_234344 ?auto_234348 ) ) ( not ( = ?auto_234344 ?auto_234349 ) ) ( not ( = ?auto_234344 ?auto_234350 ) ) ( not ( = ?auto_234344 ?auto_234351 ) ) ( not ( = ?auto_234344 ?auto_234352 ) ) ( not ( = ?auto_234345 ?auto_234346 ) ) ( not ( = ?auto_234345 ?auto_234347 ) ) ( not ( = ?auto_234345 ?auto_234348 ) ) ( not ( = ?auto_234345 ?auto_234349 ) ) ( not ( = ?auto_234345 ?auto_234350 ) ) ( not ( = ?auto_234345 ?auto_234351 ) ) ( not ( = ?auto_234345 ?auto_234352 ) ) ( not ( = ?auto_234346 ?auto_234347 ) ) ( not ( = ?auto_234346 ?auto_234348 ) ) ( not ( = ?auto_234346 ?auto_234349 ) ) ( not ( = ?auto_234346 ?auto_234350 ) ) ( not ( = ?auto_234346 ?auto_234351 ) ) ( not ( = ?auto_234346 ?auto_234352 ) ) ( not ( = ?auto_234347 ?auto_234348 ) ) ( not ( = ?auto_234347 ?auto_234349 ) ) ( not ( = ?auto_234347 ?auto_234350 ) ) ( not ( = ?auto_234347 ?auto_234351 ) ) ( not ( = ?auto_234347 ?auto_234352 ) ) ( not ( = ?auto_234348 ?auto_234349 ) ) ( not ( = ?auto_234348 ?auto_234350 ) ) ( not ( = ?auto_234348 ?auto_234351 ) ) ( not ( = ?auto_234348 ?auto_234352 ) ) ( not ( = ?auto_234349 ?auto_234350 ) ) ( not ( = ?auto_234349 ?auto_234351 ) ) ( not ( = ?auto_234349 ?auto_234352 ) ) ( not ( = ?auto_234350 ?auto_234351 ) ) ( not ( = ?auto_234350 ?auto_234352 ) ) ( not ( = ?auto_234351 ?auto_234352 ) ) ( ON ?auto_234350 ?auto_234351 ) ( ON ?auto_234349 ?auto_234350 ) ( ON ?auto_234348 ?auto_234349 ) ( ON ?auto_234347 ?auto_234348 ) ( CLEAR ?auto_234345 ) ( ON ?auto_234346 ?auto_234347 ) ( CLEAR ?auto_234346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234343 ?auto_234344 ?auto_234345 ?auto_234346 )
      ( MAKE-9PILE ?auto_234343 ?auto_234344 ?auto_234345 ?auto_234346 ?auto_234347 ?auto_234348 ?auto_234349 ?auto_234350 ?auto_234351 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234381 - BLOCK
      ?auto_234382 - BLOCK
      ?auto_234383 - BLOCK
      ?auto_234384 - BLOCK
      ?auto_234385 - BLOCK
      ?auto_234386 - BLOCK
      ?auto_234387 - BLOCK
      ?auto_234388 - BLOCK
      ?auto_234389 - BLOCK
    )
    :vars
    (
      ?auto_234390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234389 ?auto_234390 ) ( ON-TABLE ?auto_234381 ) ( ON ?auto_234382 ?auto_234381 ) ( not ( = ?auto_234381 ?auto_234382 ) ) ( not ( = ?auto_234381 ?auto_234383 ) ) ( not ( = ?auto_234381 ?auto_234384 ) ) ( not ( = ?auto_234381 ?auto_234385 ) ) ( not ( = ?auto_234381 ?auto_234386 ) ) ( not ( = ?auto_234381 ?auto_234387 ) ) ( not ( = ?auto_234381 ?auto_234388 ) ) ( not ( = ?auto_234381 ?auto_234389 ) ) ( not ( = ?auto_234381 ?auto_234390 ) ) ( not ( = ?auto_234382 ?auto_234383 ) ) ( not ( = ?auto_234382 ?auto_234384 ) ) ( not ( = ?auto_234382 ?auto_234385 ) ) ( not ( = ?auto_234382 ?auto_234386 ) ) ( not ( = ?auto_234382 ?auto_234387 ) ) ( not ( = ?auto_234382 ?auto_234388 ) ) ( not ( = ?auto_234382 ?auto_234389 ) ) ( not ( = ?auto_234382 ?auto_234390 ) ) ( not ( = ?auto_234383 ?auto_234384 ) ) ( not ( = ?auto_234383 ?auto_234385 ) ) ( not ( = ?auto_234383 ?auto_234386 ) ) ( not ( = ?auto_234383 ?auto_234387 ) ) ( not ( = ?auto_234383 ?auto_234388 ) ) ( not ( = ?auto_234383 ?auto_234389 ) ) ( not ( = ?auto_234383 ?auto_234390 ) ) ( not ( = ?auto_234384 ?auto_234385 ) ) ( not ( = ?auto_234384 ?auto_234386 ) ) ( not ( = ?auto_234384 ?auto_234387 ) ) ( not ( = ?auto_234384 ?auto_234388 ) ) ( not ( = ?auto_234384 ?auto_234389 ) ) ( not ( = ?auto_234384 ?auto_234390 ) ) ( not ( = ?auto_234385 ?auto_234386 ) ) ( not ( = ?auto_234385 ?auto_234387 ) ) ( not ( = ?auto_234385 ?auto_234388 ) ) ( not ( = ?auto_234385 ?auto_234389 ) ) ( not ( = ?auto_234385 ?auto_234390 ) ) ( not ( = ?auto_234386 ?auto_234387 ) ) ( not ( = ?auto_234386 ?auto_234388 ) ) ( not ( = ?auto_234386 ?auto_234389 ) ) ( not ( = ?auto_234386 ?auto_234390 ) ) ( not ( = ?auto_234387 ?auto_234388 ) ) ( not ( = ?auto_234387 ?auto_234389 ) ) ( not ( = ?auto_234387 ?auto_234390 ) ) ( not ( = ?auto_234388 ?auto_234389 ) ) ( not ( = ?auto_234388 ?auto_234390 ) ) ( not ( = ?auto_234389 ?auto_234390 ) ) ( ON ?auto_234388 ?auto_234389 ) ( ON ?auto_234387 ?auto_234388 ) ( ON ?auto_234386 ?auto_234387 ) ( ON ?auto_234385 ?auto_234386 ) ( ON ?auto_234384 ?auto_234385 ) ( CLEAR ?auto_234382 ) ( ON ?auto_234383 ?auto_234384 ) ( CLEAR ?auto_234383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234381 ?auto_234382 ?auto_234383 )
      ( MAKE-9PILE ?auto_234381 ?auto_234382 ?auto_234383 ?auto_234384 ?auto_234385 ?auto_234386 ?auto_234387 ?auto_234388 ?auto_234389 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234419 - BLOCK
      ?auto_234420 - BLOCK
      ?auto_234421 - BLOCK
      ?auto_234422 - BLOCK
      ?auto_234423 - BLOCK
      ?auto_234424 - BLOCK
      ?auto_234425 - BLOCK
      ?auto_234426 - BLOCK
      ?auto_234427 - BLOCK
    )
    :vars
    (
      ?auto_234428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234427 ?auto_234428 ) ( ON-TABLE ?auto_234419 ) ( not ( = ?auto_234419 ?auto_234420 ) ) ( not ( = ?auto_234419 ?auto_234421 ) ) ( not ( = ?auto_234419 ?auto_234422 ) ) ( not ( = ?auto_234419 ?auto_234423 ) ) ( not ( = ?auto_234419 ?auto_234424 ) ) ( not ( = ?auto_234419 ?auto_234425 ) ) ( not ( = ?auto_234419 ?auto_234426 ) ) ( not ( = ?auto_234419 ?auto_234427 ) ) ( not ( = ?auto_234419 ?auto_234428 ) ) ( not ( = ?auto_234420 ?auto_234421 ) ) ( not ( = ?auto_234420 ?auto_234422 ) ) ( not ( = ?auto_234420 ?auto_234423 ) ) ( not ( = ?auto_234420 ?auto_234424 ) ) ( not ( = ?auto_234420 ?auto_234425 ) ) ( not ( = ?auto_234420 ?auto_234426 ) ) ( not ( = ?auto_234420 ?auto_234427 ) ) ( not ( = ?auto_234420 ?auto_234428 ) ) ( not ( = ?auto_234421 ?auto_234422 ) ) ( not ( = ?auto_234421 ?auto_234423 ) ) ( not ( = ?auto_234421 ?auto_234424 ) ) ( not ( = ?auto_234421 ?auto_234425 ) ) ( not ( = ?auto_234421 ?auto_234426 ) ) ( not ( = ?auto_234421 ?auto_234427 ) ) ( not ( = ?auto_234421 ?auto_234428 ) ) ( not ( = ?auto_234422 ?auto_234423 ) ) ( not ( = ?auto_234422 ?auto_234424 ) ) ( not ( = ?auto_234422 ?auto_234425 ) ) ( not ( = ?auto_234422 ?auto_234426 ) ) ( not ( = ?auto_234422 ?auto_234427 ) ) ( not ( = ?auto_234422 ?auto_234428 ) ) ( not ( = ?auto_234423 ?auto_234424 ) ) ( not ( = ?auto_234423 ?auto_234425 ) ) ( not ( = ?auto_234423 ?auto_234426 ) ) ( not ( = ?auto_234423 ?auto_234427 ) ) ( not ( = ?auto_234423 ?auto_234428 ) ) ( not ( = ?auto_234424 ?auto_234425 ) ) ( not ( = ?auto_234424 ?auto_234426 ) ) ( not ( = ?auto_234424 ?auto_234427 ) ) ( not ( = ?auto_234424 ?auto_234428 ) ) ( not ( = ?auto_234425 ?auto_234426 ) ) ( not ( = ?auto_234425 ?auto_234427 ) ) ( not ( = ?auto_234425 ?auto_234428 ) ) ( not ( = ?auto_234426 ?auto_234427 ) ) ( not ( = ?auto_234426 ?auto_234428 ) ) ( not ( = ?auto_234427 ?auto_234428 ) ) ( ON ?auto_234426 ?auto_234427 ) ( ON ?auto_234425 ?auto_234426 ) ( ON ?auto_234424 ?auto_234425 ) ( ON ?auto_234423 ?auto_234424 ) ( ON ?auto_234422 ?auto_234423 ) ( ON ?auto_234421 ?auto_234422 ) ( CLEAR ?auto_234419 ) ( ON ?auto_234420 ?auto_234421 ) ( CLEAR ?auto_234420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234419 ?auto_234420 )
      ( MAKE-9PILE ?auto_234419 ?auto_234420 ?auto_234421 ?auto_234422 ?auto_234423 ?auto_234424 ?auto_234425 ?auto_234426 ?auto_234427 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_234457 - BLOCK
      ?auto_234458 - BLOCK
      ?auto_234459 - BLOCK
      ?auto_234460 - BLOCK
      ?auto_234461 - BLOCK
      ?auto_234462 - BLOCK
      ?auto_234463 - BLOCK
      ?auto_234464 - BLOCK
      ?auto_234465 - BLOCK
    )
    :vars
    (
      ?auto_234466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234465 ?auto_234466 ) ( not ( = ?auto_234457 ?auto_234458 ) ) ( not ( = ?auto_234457 ?auto_234459 ) ) ( not ( = ?auto_234457 ?auto_234460 ) ) ( not ( = ?auto_234457 ?auto_234461 ) ) ( not ( = ?auto_234457 ?auto_234462 ) ) ( not ( = ?auto_234457 ?auto_234463 ) ) ( not ( = ?auto_234457 ?auto_234464 ) ) ( not ( = ?auto_234457 ?auto_234465 ) ) ( not ( = ?auto_234457 ?auto_234466 ) ) ( not ( = ?auto_234458 ?auto_234459 ) ) ( not ( = ?auto_234458 ?auto_234460 ) ) ( not ( = ?auto_234458 ?auto_234461 ) ) ( not ( = ?auto_234458 ?auto_234462 ) ) ( not ( = ?auto_234458 ?auto_234463 ) ) ( not ( = ?auto_234458 ?auto_234464 ) ) ( not ( = ?auto_234458 ?auto_234465 ) ) ( not ( = ?auto_234458 ?auto_234466 ) ) ( not ( = ?auto_234459 ?auto_234460 ) ) ( not ( = ?auto_234459 ?auto_234461 ) ) ( not ( = ?auto_234459 ?auto_234462 ) ) ( not ( = ?auto_234459 ?auto_234463 ) ) ( not ( = ?auto_234459 ?auto_234464 ) ) ( not ( = ?auto_234459 ?auto_234465 ) ) ( not ( = ?auto_234459 ?auto_234466 ) ) ( not ( = ?auto_234460 ?auto_234461 ) ) ( not ( = ?auto_234460 ?auto_234462 ) ) ( not ( = ?auto_234460 ?auto_234463 ) ) ( not ( = ?auto_234460 ?auto_234464 ) ) ( not ( = ?auto_234460 ?auto_234465 ) ) ( not ( = ?auto_234460 ?auto_234466 ) ) ( not ( = ?auto_234461 ?auto_234462 ) ) ( not ( = ?auto_234461 ?auto_234463 ) ) ( not ( = ?auto_234461 ?auto_234464 ) ) ( not ( = ?auto_234461 ?auto_234465 ) ) ( not ( = ?auto_234461 ?auto_234466 ) ) ( not ( = ?auto_234462 ?auto_234463 ) ) ( not ( = ?auto_234462 ?auto_234464 ) ) ( not ( = ?auto_234462 ?auto_234465 ) ) ( not ( = ?auto_234462 ?auto_234466 ) ) ( not ( = ?auto_234463 ?auto_234464 ) ) ( not ( = ?auto_234463 ?auto_234465 ) ) ( not ( = ?auto_234463 ?auto_234466 ) ) ( not ( = ?auto_234464 ?auto_234465 ) ) ( not ( = ?auto_234464 ?auto_234466 ) ) ( not ( = ?auto_234465 ?auto_234466 ) ) ( ON ?auto_234464 ?auto_234465 ) ( ON ?auto_234463 ?auto_234464 ) ( ON ?auto_234462 ?auto_234463 ) ( ON ?auto_234461 ?auto_234462 ) ( ON ?auto_234460 ?auto_234461 ) ( ON ?auto_234459 ?auto_234460 ) ( ON ?auto_234458 ?auto_234459 ) ( ON ?auto_234457 ?auto_234458 ) ( CLEAR ?auto_234457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234457 )
      ( MAKE-9PILE ?auto_234457 ?auto_234458 ?auto_234459 ?auto_234460 ?auto_234461 ?auto_234462 ?auto_234463 ?auto_234464 ?auto_234465 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234496 - BLOCK
      ?auto_234497 - BLOCK
      ?auto_234498 - BLOCK
      ?auto_234499 - BLOCK
      ?auto_234500 - BLOCK
      ?auto_234501 - BLOCK
      ?auto_234502 - BLOCK
      ?auto_234503 - BLOCK
      ?auto_234504 - BLOCK
      ?auto_234505 - BLOCK
    )
    :vars
    (
      ?auto_234506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234504 ) ( ON ?auto_234505 ?auto_234506 ) ( CLEAR ?auto_234505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234496 ) ( ON ?auto_234497 ?auto_234496 ) ( ON ?auto_234498 ?auto_234497 ) ( ON ?auto_234499 ?auto_234498 ) ( ON ?auto_234500 ?auto_234499 ) ( ON ?auto_234501 ?auto_234500 ) ( ON ?auto_234502 ?auto_234501 ) ( ON ?auto_234503 ?auto_234502 ) ( ON ?auto_234504 ?auto_234503 ) ( not ( = ?auto_234496 ?auto_234497 ) ) ( not ( = ?auto_234496 ?auto_234498 ) ) ( not ( = ?auto_234496 ?auto_234499 ) ) ( not ( = ?auto_234496 ?auto_234500 ) ) ( not ( = ?auto_234496 ?auto_234501 ) ) ( not ( = ?auto_234496 ?auto_234502 ) ) ( not ( = ?auto_234496 ?auto_234503 ) ) ( not ( = ?auto_234496 ?auto_234504 ) ) ( not ( = ?auto_234496 ?auto_234505 ) ) ( not ( = ?auto_234496 ?auto_234506 ) ) ( not ( = ?auto_234497 ?auto_234498 ) ) ( not ( = ?auto_234497 ?auto_234499 ) ) ( not ( = ?auto_234497 ?auto_234500 ) ) ( not ( = ?auto_234497 ?auto_234501 ) ) ( not ( = ?auto_234497 ?auto_234502 ) ) ( not ( = ?auto_234497 ?auto_234503 ) ) ( not ( = ?auto_234497 ?auto_234504 ) ) ( not ( = ?auto_234497 ?auto_234505 ) ) ( not ( = ?auto_234497 ?auto_234506 ) ) ( not ( = ?auto_234498 ?auto_234499 ) ) ( not ( = ?auto_234498 ?auto_234500 ) ) ( not ( = ?auto_234498 ?auto_234501 ) ) ( not ( = ?auto_234498 ?auto_234502 ) ) ( not ( = ?auto_234498 ?auto_234503 ) ) ( not ( = ?auto_234498 ?auto_234504 ) ) ( not ( = ?auto_234498 ?auto_234505 ) ) ( not ( = ?auto_234498 ?auto_234506 ) ) ( not ( = ?auto_234499 ?auto_234500 ) ) ( not ( = ?auto_234499 ?auto_234501 ) ) ( not ( = ?auto_234499 ?auto_234502 ) ) ( not ( = ?auto_234499 ?auto_234503 ) ) ( not ( = ?auto_234499 ?auto_234504 ) ) ( not ( = ?auto_234499 ?auto_234505 ) ) ( not ( = ?auto_234499 ?auto_234506 ) ) ( not ( = ?auto_234500 ?auto_234501 ) ) ( not ( = ?auto_234500 ?auto_234502 ) ) ( not ( = ?auto_234500 ?auto_234503 ) ) ( not ( = ?auto_234500 ?auto_234504 ) ) ( not ( = ?auto_234500 ?auto_234505 ) ) ( not ( = ?auto_234500 ?auto_234506 ) ) ( not ( = ?auto_234501 ?auto_234502 ) ) ( not ( = ?auto_234501 ?auto_234503 ) ) ( not ( = ?auto_234501 ?auto_234504 ) ) ( not ( = ?auto_234501 ?auto_234505 ) ) ( not ( = ?auto_234501 ?auto_234506 ) ) ( not ( = ?auto_234502 ?auto_234503 ) ) ( not ( = ?auto_234502 ?auto_234504 ) ) ( not ( = ?auto_234502 ?auto_234505 ) ) ( not ( = ?auto_234502 ?auto_234506 ) ) ( not ( = ?auto_234503 ?auto_234504 ) ) ( not ( = ?auto_234503 ?auto_234505 ) ) ( not ( = ?auto_234503 ?auto_234506 ) ) ( not ( = ?auto_234504 ?auto_234505 ) ) ( not ( = ?auto_234504 ?auto_234506 ) ) ( not ( = ?auto_234505 ?auto_234506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234505 ?auto_234506 )
      ( !STACK ?auto_234505 ?auto_234504 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234538 - BLOCK
      ?auto_234539 - BLOCK
      ?auto_234540 - BLOCK
      ?auto_234541 - BLOCK
      ?auto_234542 - BLOCK
      ?auto_234543 - BLOCK
      ?auto_234544 - BLOCK
      ?auto_234545 - BLOCK
      ?auto_234546 - BLOCK
      ?auto_234547 - BLOCK
    )
    :vars
    (
      ?auto_234548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234547 ?auto_234548 ) ( ON-TABLE ?auto_234538 ) ( ON ?auto_234539 ?auto_234538 ) ( ON ?auto_234540 ?auto_234539 ) ( ON ?auto_234541 ?auto_234540 ) ( ON ?auto_234542 ?auto_234541 ) ( ON ?auto_234543 ?auto_234542 ) ( ON ?auto_234544 ?auto_234543 ) ( ON ?auto_234545 ?auto_234544 ) ( not ( = ?auto_234538 ?auto_234539 ) ) ( not ( = ?auto_234538 ?auto_234540 ) ) ( not ( = ?auto_234538 ?auto_234541 ) ) ( not ( = ?auto_234538 ?auto_234542 ) ) ( not ( = ?auto_234538 ?auto_234543 ) ) ( not ( = ?auto_234538 ?auto_234544 ) ) ( not ( = ?auto_234538 ?auto_234545 ) ) ( not ( = ?auto_234538 ?auto_234546 ) ) ( not ( = ?auto_234538 ?auto_234547 ) ) ( not ( = ?auto_234538 ?auto_234548 ) ) ( not ( = ?auto_234539 ?auto_234540 ) ) ( not ( = ?auto_234539 ?auto_234541 ) ) ( not ( = ?auto_234539 ?auto_234542 ) ) ( not ( = ?auto_234539 ?auto_234543 ) ) ( not ( = ?auto_234539 ?auto_234544 ) ) ( not ( = ?auto_234539 ?auto_234545 ) ) ( not ( = ?auto_234539 ?auto_234546 ) ) ( not ( = ?auto_234539 ?auto_234547 ) ) ( not ( = ?auto_234539 ?auto_234548 ) ) ( not ( = ?auto_234540 ?auto_234541 ) ) ( not ( = ?auto_234540 ?auto_234542 ) ) ( not ( = ?auto_234540 ?auto_234543 ) ) ( not ( = ?auto_234540 ?auto_234544 ) ) ( not ( = ?auto_234540 ?auto_234545 ) ) ( not ( = ?auto_234540 ?auto_234546 ) ) ( not ( = ?auto_234540 ?auto_234547 ) ) ( not ( = ?auto_234540 ?auto_234548 ) ) ( not ( = ?auto_234541 ?auto_234542 ) ) ( not ( = ?auto_234541 ?auto_234543 ) ) ( not ( = ?auto_234541 ?auto_234544 ) ) ( not ( = ?auto_234541 ?auto_234545 ) ) ( not ( = ?auto_234541 ?auto_234546 ) ) ( not ( = ?auto_234541 ?auto_234547 ) ) ( not ( = ?auto_234541 ?auto_234548 ) ) ( not ( = ?auto_234542 ?auto_234543 ) ) ( not ( = ?auto_234542 ?auto_234544 ) ) ( not ( = ?auto_234542 ?auto_234545 ) ) ( not ( = ?auto_234542 ?auto_234546 ) ) ( not ( = ?auto_234542 ?auto_234547 ) ) ( not ( = ?auto_234542 ?auto_234548 ) ) ( not ( = ?auto_234543 ?auto_234544 ) ) ( not ( = ?auto_234543 ?auto_234545 ) ) ( not ( = ?auto_234543 ?auto_234546 ) ) ( not ( = ?auto_234543 ?auto_234547 ) ) ( not ( = ?auto_234543 ?auto_234548 ) ) ( not ( = ?auto_234544 ?auto_234545 ) ) ( not ( = ?auto_234544 ?auto_234546 ) ) ( not ( = ?auto_234544 ?auto_234547 ) ) ( not ( = ?auto_234544 ?auto_234548 ) ) ( not ( = ?auto_234545 ?auto_234546 ) ) ( not ( = ?auto_234545 ?auto_234547 ) ) ( not ( = ?auto_234545 ?auto_234548 ) ) ( not ( = ?auto_234546 ?auto_234547 ) ) ( not ( = ?auto_234546 ?auto_234548 ) ) ( not ( = ?auto_234547 ?auto_234548 ) ) ( CLEAR ?auto_234545 ) ( ON ?auto_234546 ?auto_234547 ) ( CLEAR ?auto_234546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_234538 ?auto_234539 ?auto_234540 ?auto_234541 ?auto_234542 ?auto_234543 ?auto_234544 ?auto_234545 ?auto_234546 )
      ( MAKE-10PILE ?auto_234538 ?auto_234539 ?auto_234540 ?auto_234541 ?auto_234542 ?auto_234543 ?auto_234544 ?auto_234545 ?auto_234546 ?auto_234547 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234580 - BLOCK
      ?auto_234581 - BLOCK
      ?auto_234582 - BLOCK
      ?auto_234583 - BLOCK
      ?auto_234584 - BLOCK
      ?auto_234585 - BLOCK
      ?auto_234586 - BLOCK
      ?auto_234587 - BLOCK
      ?auto_234588 - BLOCK
      ?auto_234589 - BLOCK
    )
    :vars
    (
      ?auto_234590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234589 ?auto_234590 ) ( ON-TABLE ?auto_234580 ) ( ON ?auto_234581 ?auto_234580 ) ( ON ?auto_234582 ?auto_234581 ) ( ON ?auto_234583 ?auto_234582 ) ( ON ?auto_234584 ?auto_234583 ) ( ON ?auto_234585 ?auto_234584 ) ( ON ?auto_234586 ?auto_234585 ) ( not ( = ?auto_234580 ?auto_234581 ) ) ( not ( = ?auto_234580 ?auto_234582 ) ) ( not ( = ?auto_234580 ?auto_234583 ) ) ( not ( = ?auto_234580 ?auto_234584 ) ) ( not ( = ?auto_234580 ?auto_234585 ) ) ( not ( = ?auto_234580 ?auto_234586 ) ) ( not ( = ?auto_234580 ?auto_234587 ) ) ( not ( = ?auto_234580 ?auto_234588 ) ) ( not ( = ?auto_234580 ?auto_234589 ) ) ( not ( = ?auto_234580 ?auto_234590 ) ) ( not ( = ?auto_234581 ?auto_234582 ) ) ( not ( = ?auto_234581 ?auto_234583 ) ) ( not ( = ?auto_234581 ?auto_234584 ) ) ( not ( = ?auto_234581 ?auto_234585 ) ) ( not ( = ?auto_234581 ?auto_234586 ) ) ( not ( = ?auto_234581 ?auto_234587 ) ) ( not ( = ?auto_234581 ?auto_234588 ) ) ( not ( = ?auto_234581 ?auto_234589 ) ) ( not ( = ?auto_234581 ?auto_234590 ) ) ( not ( = ?auto_234582 ?auto_234583 ) ) ( not ( = ?auto_234582 ?auto_234584 ) ) ( not ( = ?auto_234582 ?auto_234585 ) ) ( not ( = ?auto_234582 ?auto_234586 ) ) ( not ( = ?auto_234582 ?auto_234587 ) ) ( not ( = ?auto_234582 ?auto_234588 ) ) ( not ( = ?auto_234582 ?auto_234589 ) ) ( not ( = ?auto_234582 ?auto_234590 ) ) ( not ( = ?auto_234583 ?auto_234584 ) ) ( not ( = ?auto_234583 ?auto_234585 ) ) ( not ( = ?auto_234583 ?auto_234586 ) ) ( not ( = ?auto_234583 ?auto_234587 ) ) ( not ( = ?auto_234583 ?auto_234588 ) ) ( not ( = ?auto_234583 ?auto_234589 ) ) ( not ( = ?auto_234583 ?auto_234590 ) ) ( not ( = ?auto_234584 ?auto_234585 ) ) ( not ( = ?auto_234584 ?auto_234586 ) ) ( not ( = ?auto_234584 ?auto_234587 ) ) ( not ( = ?auto_234584 ?auto_234588 ) ) ( not ( = ?auto_234584 ?auto_234589 ) ) ( not ( = ?auto_234584 ?auto_234590 ) ) ( not ( = ?auto_234585 ?auto_234586 ) ) ( not ( = ?auto_234585 ?auto_234587 ) ) ( not ( = ?auto_234585 ?auto_234588 ) ) ( not ( = ?auto_234585 ?auto_234589 ) ) ( not ( = ?auto_234585 ?auto_234590 ) ) ( not ( = ?auto_234586 ?auto_234587 ) ) ( not ( = ?auto_234586 ?auto_234588 ) ) ( not ( = ?auto_234586 ?auto_234589 ) ) ( not ( = ?auto_234586 ?auto_234590 ) ) ( not ( = ?auto_234587 ?auto_234588 ) ) ( not ( = ?auto_234587 ?auto_234589 ) ) ( not ( = ?auto_234587 ?auto_234590 ) ) ( not ( = ?auto_234588 ?auto_234589 ) ) ( not ( = ?auto_234588 ?auto_234590 ) ) ( not ( = ?auto_234589 ?auto_234590 ) ) ( ON ?auto_234588 ?auto_234589 ) ( CLEAR ?auto_234586 ) ( ON ?auto_234587 ?auto_234588 ) ( CLEAR ?auto_234587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_234580 ?auto_234581 ?auto_234582 ?auto_234583 ?auto_234584 ?auto_234585 ?auto_234586 ?auto_234587 )
      ( MAKE-10PILE ?auto_234580 ?auto_234581 ?auto_234582 ?auto_234583 ?auto_234584 ?auto_234585 ?auto_234586 ?auto_234587 ?auto_234588 ?auto_234589 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234622 - BLOCK
      ?auto_234623 - BLOCK
      ?auto_234624 - BLOCK
      ?auto_234625 - BLOCK
      ?auto_234626 - BLOCK
      ?auto_234627 - BLOCK
      ?auto_234628 - BLOCK
      ?auto_234629 - BLOCK
      ?auto_234630 - BLOCK
      ?auto_234631 - BLOCK
    )
    :vars
    (
      ?auto_234632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234631 ?auto_234632 ) ( ON-TABLE ?auto_234622 ) ( ON ?auto_234623 ?auto_234622 ) ( ON ?auto_234624 ?auto_234623 ) ( ON ?auto_234625 ?auto_234624 ) ( ON ?auto_234626 ?auto_234625 ) ( ON ?auto_234627 ?auto_234626 ) ( not ( = ?auto_234622 ?auto_234623 ) ) ( not ( = ?auto_234622 ?auto_234624 ) ) ( not ( = ?auto_234622 ?auto_234625 ) ) ( not ( = ?auto_234622 ?auto_234626 ) ) ( not ( = ?auto_234622 ?auto_234627 ) ) ( not ( = ?auto_234622 ?auto_234628 ) ) ( not ( = ?auto_234622 ?auto_234629 ) ) ( not ( = ?auto_234622 ?auto_234630 ) ) ( not ( = ?auto_234622 ?auto_234631 ) ) ( not ( = ?auto_234622 ?auto_234632 ) ) ( not ( = ?auto_234623 ?auto_234624 ) ) ( not ( = ?auto_234623 ?auto_234625 ) ) ( not ( = ?auto_234623 ?auto_234626 ) ) ( not ( = ?auto_234623 ?auto_234627 ) ) ( not ( = ?auto_234623 ?auto_234628 ) ) ( not ( = ?auto_234623 ?auto_234629 ) ) ( not ( = ?auto_234623 ?auto_234630 ) ) ( not ( = ?auto_234623 ?auto_234631 ) ) ( not ( = ?auto_234623 ?auto_234632 ) ) ( not ( = ?auto_234624 ?auto_234625 ) ) ( not ( = ?auto_234624 ?auto_234626 ) ) ( not ( = ?auto_234624 ?auto_234627 ) ) ( not ( = ?auto_234624 ?auto_234628 ) ) ( not ( = ?auto_234624 ?auto_234629 ) ) ( not ( = ?auto_234624 ?auto_234630 ) ) ( not ( = ?auto_234624 ?auto_234631 ) ) ( not ( = ?auto_234624 ?auto_234632 ) ) ( not ( = ?auto_234625 ?auto_234626 ) ) ( not ( = ?auto_234625 ?auto_234627 ) ) ( not ( = ?auto_234625 ?auto_234628 ) ) ( not ( = ?auto_234625 ?auto_234629 ) ) ( not ( = ?auto_234625 ?auto_234630 ) ) ( not ( = ?auto_234625 ?auto_234631 ) ) ( not ( = ?auto_234625 ?auto_234632 ) ) ( not ( = ?auto_234626 ?auto_234627 ) ) ( not ( = ?auto_234626 ?auto_234628 ) ) ( not ( = ?auto_234626 ?auto_234629 ) ) ( not ( = ?auto_234626 ?auto_234630 ) ) ( not ( = ?auto_234626 ?auto_234631 ) ) ( not ( = ?auto_234626 ?auto_234632 ) ) ( not ( = ?auto_234627 ?auto_234628 ) ) ( not ( = ?auto_234627 ?auto_234629 ) ) ( not ( = ?auto_234627 ?auto_234630 ) ) ( not ( = ?auto_234627 ?auto_234631 ) ) ( not ( = ?auto_234627 ?auto_234632 ) ) ( not ( = ?auto_234628 ?auto_234629 ) ) ( not ( = ?auto_234628 ?auto_234630 ) ) ( not ( = ?auto_234628 ?auto_234631 ) ) ( not ( = ?auto_234628 ?auto_234632 ) ) ( not ( = ?auto_234629 ?auto_234630 ) ) ( not ( = ?auto_234629 ?auto_234631 ) ) ( not ( = ?auto_234629 ?auto_234632 ) ) ( not ( = ?auto_234630 ?auto_234631 ) ) ( not ( = ?auto_234630 ?auto_234632 ) ) ( not ( = ?auto_234631 ?auto_234632 ) ) ( ON ?auto_234630 ?auto_234631 ) ( ON ?auto_234629 ?auto_234630 ) ( CLEAR ?auto_234627 ) ( ON ?auto_234628 ?auto_234629 ) ( CLEAR ?auto_234628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_234622 ?auto_234623 ?auto_234624 ?auto_234625 ?auto_234626 ?auto_234627 ?auto_234628 )
      ( MAKE-10PILE ?auto_234622 ?auto_234623 ?auto_234624 ?auto_234625 ?auto_234626 ?auto_234627 ?auto_234628 ?auto_234629 ?auto_234630 ?auto_234631 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234664 - BLOCK
      ?auto_234665 - BLOCK
      ?auto_234666 - BLOCK
      ?auto_234667 - BLOCK
      ?auto_234668 - BLOCK
      ?auto_234669 - BLOCK
      ?auto_234670 - BLOCK
      ?auto_234671 - BLOCK
      ?auto_234672 - BLOCK
      ?auto_234673 - BLOCK
    )
    :vars
    (
      ?auto_234674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234673 ?auto_234674 ) ( ON-TABLE ?auto_234664 ) ( ON ?auto_234665 ?auto_234664 ) ( ON ?auto_234666 ?auto_234665 ) ( ON ?auto_234667 ?auto_234666 ) ( ON ?auto_234668 ?auto_234667 ) ( not ( = ?auto_234664 ?auto_234665 ) ) ( not ( = ?auto_234664 ?auto_234666 ) ) ( not ( = ?auto_234664 ?auto_234667 ) ) ( not ( = ?auto_234664 ?auto_234668 ) ) ( not ( = ?auto_234664 ?auto_234669 ) ) ( not ( = ?auto_234664 ?auto_234670 ) ) ( not ( = ?auto_234664 ?auto_234671 ) ) ( not ( = ?auto_234664 ?auto_234672 ) ) ( not ( = ?auto_234664 ?auto_234673 ) ) ( not ( = ?auto_234664 ?auto_234674 ) ) ( not ( = ?auto_234665 ?auto_234666 ) ) ( not ( = ?auto_234665 ?auto_234667 ) ) ( not ( = ?auto_234665 ?auto_234668 ) ) ( not ( = ?auto_234665 ?auto_234669 ) ) ( not ( = ?auto_234665 ?auto_234670 ) ) ( not ( = ?auto_234665 ?auto_234671 ) ) ( not ( = ?auto_234665 ?auto_234672 ) ) ( not ( = ?auto_234665 ?auto_234673 ) ) ( not ( = ?auto_234665 ?auto_234674 ) ) ( not ( = ?auto_234666 ?auto_234667 ) ) ( not ( = ?auto_234666 ?auto_234668 ) ) ( not ( = ?auto_234666 ?auto_234669 ) ) ( not ( = ?auto_234666 ?auto_234670 ) ) ( not ( = ?auto_234666 ?auto_234671 ) ) ( not ( = ?auto_234666 ?auto_234672 ) ) ( not ( = ?auto_234666 ?auto_234673 ) ) ( not ( = ?auto_234666 ?auto_234674 ) ) ( not ( = ?auto_234667 ?auto_234668 ) ) ( not ( = ?auto_234667 ?auto_234669 ) ) ( not ( = ?auto_234667 ?auto_234670 ) ) ( not ( = ?auto_234667 ?auto_234671 ) ) ( not ( = ?auto_234667 ?auto_234672 ) ) ( not ( = ?auto_234667 ?auto_234673 ) ) ( not ( = ?auto_234667 ?auto_234674 ) ) ( not ( = ?auto_234668 ?auto_234669 ) ) ( not ( = ?auto_234668 ?auto_234670 ) ) ( not ( = ?auto_234668 ?auto_234671 ) ) ( not ( = ?auto_234668 ?auto_234672 ) ) ( not ( = ?auto_234668 ?auto_234673 ) ) ( not ( = ?auto_234668 ?auto_234674 ) ) ( not ( = ?auto_234669 ?auto_234670 ) ) ( not ( = ?auto_234669 ?auto_234671 ) ) ( not ( = ?auto_234669 ?auto_234672 ) ) ( not ( = ?auto_234669 ?auto_234673 ) ) ( not ( = ?auto_234669 ?auto_234674 ) ) ( not ( = ?auto_234670 ?auto_234671 ) ) ( not ( = ?auto_234670 ?auto_234672 ) ) ( not ( = ?auto_234670 ?auto_234673 ) ) ( not ( = ?auto_234670 ?auto_234674 ) ) ( not ( = ?auto_234671 ?auto_234672 ) ) ( not ( = ?auto_234671 ?auto_234673 ) ) ( not ( = ?auto_234671 ?auto_234674 ) ) ( not ( = ?auto_234672 ?auto_234673 ) ) ( not ( = ?auto_234672 ?auto_234674 ) ) ( not ( = ?auto_234673 ?auto_234674 ) ) ( ON ?auto_234672 ?auto_234673 ) ( ON ?auto_234671 ?auto_234672 ) ( ON ?auto_234670 ?auto_234671 ) ( CLEAR ?auto_234668 ) ( ON ?auto_234669 ?auto_234670 ) ( CLEAR ?auto_234669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_234664 ?auto_234665 ?auto_234666 ?auto_234667 ?auto_234668 ?auto_234669 )
      ( MAKE-10PILE ?auto_234664 ?auto_234665 ?auto_234666 ?auto_234667 ?auto_234668 ?auto_234669 ?auto_234670 ?auto_234671 ?auto_234672 ?auto_234673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234706 - BLOCK
      ?auto_234707 - BLOCK
      ?auto_234708 - BLOCK
      ?auto_234709 - BLOCK
      ?auto_234710 - BLOCK
      ?auto_234711 - BLOCK
      ?auto_234712 - BLOCK
      ?auto_234713 - BLOCK
      ?auto_234714 - BLOCK
      ?auto_234715 - BLOCK
    )
    :vars
    (
      ?auto_234716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234715 ?auto_234716 ) ( ON-TABLE ?auto_234706 ) ( ON ?auto_234707 ?auto_234706 ) ( ON ?auto_234708 ?auto_234707 ) ( ON ?auto_234709 ?auto_234708 ) ( not ( = ?auto_234706 ?auto_234707 ) ) ( not ( = ?auto_234706 ?auto_234708 ) ) ( not ( = ?auto_234706 ?auto_234709 ) ) ( not ( = ?auto_234706 ?auto_234710 ) ) ( not ( = ?auto_234706 ?auto_234711 ) ) ( not ( = ?auto_234706 ?auto_234712 ) ) ( not ( = ?auto_234706 ?auto_234713 ) ) ( not ( = ?auto_234706 ?auto_234714 ) ) ( not ( = ?auto_234706 ?auto_234715 ) ) ( not ( = ?auto_234706 ?auto_234716 ) ) ( not ( = ?auto_234707 ?auto_234708 ) ) ( not ( = ?auto_234707 ?auto_234709 ) ) ( not ( = ?auto_234707 ?auto_234710 ) ) ( not ( = ?auto_234707 ?auto_234711 ) ) ( not ( = ?auto_234707 ?auto_234712 ) ) ( not ( = ?auto_234707 ?auto_234713 ) ) ( not ( = ?auto_234707 ?auto_234714 ) ) ( not ( = ?auto_234707 ?auto_234715 ) ) ( not ( = ?auto_234707 ?auto_234716 ) ) ( not ( = ?auto_234708 ?auto_234709 ) ) ( not ( = ?auto_234708 ?auto_234710 ) ) ( not ( = ?auto_234708 ?auto_234711 ) ) ( not ( = ?auto_234708 ?auto_234712 ) ) ( not ( = ?auto_234708 ?auto_234713 ) ) ( not ( = ?auto_234708 ?auto_234714 ) ) ( not ( = ?auto_234708 ?auto_234715 ) ) ( not ( = ?auto_234708 ?auto_234716 ) ) ( not ( = ?auto_234709 ?auto_234710 ) ) ( not ( = ?auto_234709 ?auto_234711 ) ) ( not ( = ?auto_234709 ?auto_234712 ) ) ( not ( = ?auto_234709 ?auto_234713 ) ) ( not ( = ?auto_234709 ?auto_234714 ) ) ( not ( = ?auto_234709 ?auto_234715 ) ) ( not ( = ?auto_234709 ?auto_234716 ) ) ( not ( = ?auto_234710 ?auto_234711 ) ) ( not ( = ?auto_234710 ?auto_234712 ) ) ( not ( = ?auto_234710 ?auto_234713 ) ) ( not ( = ?auto_234710 ?auto_234714 ) ) ( not ( = ?auto_234710 ?auto_234715 ) ) ( not ( = ?auto_234710 ?auto_234716 ) ) ( not ( = ?auto_234711 ?auto_234712 ) ) ( not ( = ?auto_234711 ?auto_234713 ) ) ( not ( = ?auto_234711 ?auto_234714 ) ) ( not ( = ?auto_234711 ?auto_234715 ) ) ( not ( = ?auto_234711 ?auto_234716 ) ) ( not ( = ?auto_234712 ?auto_234713 ) ) ( not ( = ?auto_234712 ?auto_234714 ) ) ( not ( = ?auto_234712 ?auto_234715 ) ) ( not ( = ?auto_234712 ?auto_234716 ) ) ( not ( = ?auto_234713 ?auto_234714 ) ) ( not ( = ?auto_234713 ?auto_234715 ) ) ( not ( = ?auto_234713 ?auto_234716 ) ) ( not ( = ?auto_234714 ?auto_234715 ) ) ( not ( = ?auto_234714 ?auto_234716 ) ) ( not ( = ?auto_234715 ?auto_234716 ) ) ( ON ?auto_234714 ?auto_234715 ) ( ON ?auto_234713 ?auto_234714 ) ( ON ?auto_234712 ?auto_234713 ) ( ON ?auto_234711 ?auto_234712 ) ( CLEAR ?auto_234709 ) ( ON ?auto_234710 ?auto_234711 ) ( CLEAR ?auto_234710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_234706 ?auto_234707 ?auto_234708 ?auto_234709 ?auto_234710 )
      ( MAKE-10PILE ?auto_234706 ?auto_234707 ?auto_234708 ?auto_234709 ?auto_234710 ?auto_234711 ?auto_234712 ?auto_234713 ?auto_234714 ?auto_234715 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234748 - BLOCK
      ?auto_234749 - BLOCK
      ?auto_234750 - BLOCK
      ?auto_234751 - BLOCK
      ?auto_234752 - BLOCK
      ?auto_234753 - BLOCK
      ?auto_234754 - BLOCK
      ?auto_234755 - BLOCK
      ?auto_234756 - BLOCK
      ?auto_234757 - BLOCK
    )
    :vars
    (
      ?auto_234758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234757 ?auto_234758 ) ( ON-TABLE ?auto_234748 ) ( ON ?auto_234749 ?auto_234748 ) ( ON ?auto_234750 ?auto_234749 ) ( not ( = ?auto_234748 ?auto_234749 ) ) ( not ( = ?auto_234748 ?auto_234750 ) ) ( not ( = ?auto_234748 ?auto_234751 ) ) ( not ( = ?auto_234748 ?auto_234752 ) ) ( not ( = ?auto_234748 ?auto_234753 ) ) ( not ( = ?auto_234748 ?auto_234754 ) ) ( not ( = ?auto_234748 ?auto_234755 ) ) ( not ( = ?auto_234748 ?auto_234756 ) ) ( not ( = ?auto_234748 ?auto_234757 ) ) ( not ( = ?auto_234748 ?auto_234758 ) ) ( not ( = ?auto_234749 ?auto_234750 ) ) ( not ( = ?auto_234749 ?auto_234751 ) ) ( not ( = ?auto_234749 ?auto_234752 ) ) ( not ( = ?auto_234749 ?auto_234753 ) ) ( not ( = ?auto_234749 ?auto_234754 ) ) ( not ( = ?auto_234749 ?auto_234755 ) ) ( not ( = ?auto_234749 ?auto_234756 ) ) ( not ( = ?auto_234749 ?auto_234757 ) ) ( not ( = ?auto_234749 ?auto_234758 ) ) ( not ( = ?auto_234750 ?auto_234751 ) ) ( not ( = ?auto_234750 ?auto_234752 ) ) ( not ( = ?auto_234750 ?auto_234753 ) ) ( not ( = ?auto_234750 ?auto_234754 ) ) ( not ( = ?auto_234750 ?auto_234755 ) ) ( not ( = ?auto_234750 ?auto_234756 ) ) ( not ( = ?auto_234750 ?auto_234757 ) ) ( not ( = ?auto_234750 ?auto_234758 ) ) ( not ( = ?auto_234751 ?auto_234752 ) ) ( not ( = ?auto_234751 ?auto_234753 ) ) ( not ( = ?auto_234751 ?auto_234754 ) ) ( not ( = ?auto_234751 ?auto_234755 ) ) ( not ( = ?auto_234751 ?auto_234756 ) ) ( not ( = ?auto_234751 ?auto_234757 ) ) ( not ( = ?auto_234751 ?auto_234758 ) ) ( not ( = ?auto_234752 ?auto_234753 ) ) ( not ( = ?auto_234752 ?auto_234754 ) ) ( not ( = ?auto_234752 ?auto_234755 ) ) ( not ( = ?auto_234752 ?auto_234756 ) ) ( not ( = ?auto_234752 ?auto_234757 ) ) ( not ( = ?auto_234752 ?auto_234758 ) ) ( not ( = ?auto_234753 ?auto_234754 ) ) ( not ( = ?auto_234753 ?auto_234755 ) ) ( not ( = ?auto_234753 ?auto_234756 ) ) ( not ( = ?auto_234753 ?auto_234757 ) ) ( not ( = ?auto_234753 ?auto_234758 ) ) ( not ( = ?auto_234754 ?auto_234755 ) ) ( not ( = ?auto_234754 ?auto_234756 ) ) ( not ( = ?auto_234754 ?auto_234757 ) ) ( not ( = ?auto_234754 ?auto_234758 ) ) ( not ( = ?auto_234755 ?auto_234756 ) ) ( not ( = ?auto_234755 ?auto_234757 ) ) ( not ( = ?auto_234755 ?auto_234758 ) ) ( not ( = ?auto_234756 ?auto_234757 ) ) ( not ( = ?auto_234756 ?auto_234758 ) ) ( not ( = ?auto_234757 ?auto_234758 ) ) ( ON ?auto_234756 ?auto_234757 ) ( ON ?auto_234755 ?auto_234756 ) ( ON ?auto_234754 ?auto_234755 ) ( ON ?auto_234753 ?auto_234754 ) ( ON ?auto_234752 ?auto_234753 ) ( CLEAR ?auto_234750 ) ( ON ?auto_234751 ?auto_234752 ) ( CLEAR ?auto_234751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_234748 ?auto_234749 ?auto_234750 ?auto_234751 )
      ( MAKE-10PILE ?auto_234748 ?auto_234749 ?auto_234750 ?auto_234751 ?auto_234752 ?auto_234753 ?auto_234754 ?auto_234755 ?auto_234756 ?auto_234757 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234790 - BLOCK
      ?auto_234791 - BLOCK
      ?auto_234792 - BLOCK
      ?auto_234793 - BLOCK
      ?auto_234794 - BLOCK
      ?auto_234795 - BLOCK
      ?auto_234796 - BLOCK
      ?auto_234797 - BLOCK
      ?auto_234798 - BLOCK
      ?auto_234799 - BLOCK
    )
    :vars
    (
      ?auto_234800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234799 ?auto_234800 ) ( ON-TABLE ?auto_234790 ) ( ON ?auto_234791 ?auto_234790 ) ( not ( = ?auto_234790 ?auto_234791 ) ) ( not ( = ?auto_234790 ?auto_234792 ) ) ( not ( = ?auto_234790 ?auto_234793 ) ) ( not ( = ?auto_234790 ?auto_234794 ) ) ( not ( = ?auto_234790 ?auto_234795 ) ) ( not ( = ?auto_234790 ?auto_234796 ) ) ( not ( = ?auto_234790 ?auto_234797 ) ) ( not ( = ?auto_234790 ?auto_234798 ) ) ( not ( = ?auto_234790 ?auto_234799 ) ) ( not ( = ?auto_234790 ?auto_234800 ) ) ( not ( = ?auto_234791 ?auto_234792 ) ) ( not ( = ?auto_234791 ?auto_234793 ) ) ( not ( = ?auto_234791 ?auto_234794 ) ) ( not ( = ?auto_234791 ?auto_234795 ) ) ( not ( = ?auto_234791 ?auto_234796 ) ) ( not ( = ?auto_234791 ?auto_234797 ) ) ( not ( = ?auto_234791 ?auto_234798 ) ) ( not ( = ?auto_234791 ?auto_234799 ) ) ( not ( = ?auto_234791 ?auto_234800 ) ) ( not ( = ?auto_234792 ?auto_234793 ) ) ( not ( = ?auto_234792 ?auto_234794 ) ) ( not ( = ?auto_234792 ?auto_234795 ) ) ( not ( = ?auto_234792 ?auto_234796 ) ) ( not ( = ?auto_234792 ?auto_234797 ) ) ( not ( = ?auto_234792 ?auto_234798 ) ) ( not ( = ?auto_234792 ?auto_234799 ) ) ( not ( = ?auto_234792 ?auto_234800 ) ) ( not ( = ?auto_234793 ?auto_234794 ) ) ( not ( = ?auto_234793 ?auto_234795 ) ) ( not ( = ?auto_234793 ?auto_234796 ) ) ( not ( = ?auto_234793 ?auto_234797 ) ) ( not ( = ?auto_234793 ?auto_234798 ) ) ( not ( = ?auto_234793 ?auto_234799 ) ) ( not ( = ?auto_234793 ?auto_234800 ) ) ( not ( = ?auto_234794 ?auto_234795 ) ) ( not ( = ?auto_234794 ?auto_234796 ) ) ( not ( = ?auto_234794 ?auto_234797 ) ) ( not ( = ?auto_234794 ?auto_234798 ) ) ( not ( = ?auto_234794 ?auto_234799 ) ) ( not ( = ?auto_234794 ?auto_234800 ) ) ( not ( = ?auto_234795 ?auto_234796 ) ) ( not ( = ?auto_234795 ?auto_234797 ) ) ( not ( = ?auto_234795 ?auto_234798 ) ) ( not ( = ?auto_234795 ?auto_234799 ) ) ( not ( = ?auto_234795 ?auto_234800 ) ) ( not ( = ?auto_234796 ?auto_234797 ) ) ( not ( = ?auto_234796 ?auto_234798 ) ) ( not ( = ?auto_234796 ?auto_234799 ) ) ( not ( = ?auto_234796 ?auto_234800 ) ) ( not ( = ?auto_234797 ?auto_234798 ) ) ( not ( = ?auto_234797 ?auto_234799 ) ) ( not ( = ?auto_234797 ?auto_234800 ) ) ( not ( = ?auto_234798 ?auto_234799 ) ) ( not ( = ?auto_234798 ?auto_234800 ) ) ( not ( = ?auto_234799 ?auto_234800 ) ) ( ON ?auto_234798 ?auto_234799 ) ( ON ?auto_234797 ?auto_234798 ) ( ON ?auto_234796 ?auto_234797 ) ( ON ?auto_234795 ?auto_234796 ) ( ON ?auto_234794 ?auto_234795 ) ( ON ?auto_234793 ?auto_234794 ) ( CLEAR ?auto_234791 ) ( ON ?auto_234792 ?auto_234793 ) ( CLEAR ?auto_234792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_234790 ?auto_234791 ?auto_234792 )
      ( MAKE-10PILE ?auto_234790 ?auto_234791 ?auto_234792 ?auto_234793 ?auto_234794 ?auto_234795 ?auto_234796 ?auto_234797 ?auto_234798 ?auto_234799 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234832 - BLOCK
      ?auto_234833 - BLOCK
      ?auto_234834 - BLOCK
      ?auto_234835 - BLOCK
      ?auto_234836 - BLOCK
      ?auto_234837 - BLOCK
      ?auto_234838 - BLOCK
      ?auto_234839 - BLOCK
      ?auto_234840 - BLOCK
      ?auto_234841 - BLOCK
    )
    :vars
    (
      ?auto_234842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234841 ?auto_234842 ) ( ON-TABLE ?auto_234832 ) ( not ( = ?auto_234832 ?auto_234833 ) ) ( not ( = ?auto_234832 ?auto_234834 ) ) ( not ( = ?auto_234832 ?auto_234835 ) ) ( not ( = ?auto_234832 ?auto_234836 ) ) ( not ( = ?auto_234832 ?auto_234837 ) ) ( not ( = ?auto_234832 ?auto_234838 ) ) ( not ( = ?auto_234832 ?auto_234839 ) ) ( not ( = ?auto_234832 ?auto_234840 ) ) ( not ( = ?auto_234832 ?auto_234841 ) ) ( not ( = ?auto_234832 ?auto_234842 ) ) ( not ( = ?auto_234833 ?auto_234834 ) ) ( not ( = ?auto_234833 ?auto_234835 ) ) ( not ( = ?auto_234833 ?auto_234836 ) ) ( not ( = ?auto_234833 ?auto_234837 ) ) ( not ( = ?auto_234833 ?auto_234838 ) ) ( not ( = ?auto_234833 ?auto_234839 ) ) ( not ( = ?auto_234833 ?auto_234840 ) ) ( not ( = ?auto_234833 ?auto_234841 ) ) ( not ( = ?auto_234833 ?auto_234842 ) ) ( not ( = ?auto_234834 ?auto_234835 ) ) ( not ( = ?auto_234834 ?auto_234836 ) ) ( not ( = ?auto_234834 ?auto_234837 ) ) ( not ( = ?auto_234834 ?auto_234838 ) ) ( not ( = ?auto_234834 ?auto_234839 ) ) ( not ( = ?auto_234834 ?auto_234840 ) ) ( not ( = ?auto_234834 ?auto_234841 ) ) ( not ( = ?auto_234834 ?auto_234842 ) ) ( not ( = ?auto_234835 ?auto_234836 ) ) ( not ( = ?auto_234835 ?auto_234837 ) ) ( not ( = ?auto_234835 ?auto_234838 ) ) ( not ( = ?auto_234835 ?auto_234839 ) ) ( not ( = ?auto_234835 ?auto_234840 ) ) ( not ( = ?auto_234835 ?auto_234841 ) ) ( not ( = ?auto_234835 ?auto_234842 ) ) ( not ( = ?auto_234836 ?auto_234837 ) ) ( not ( = ?auto_234836 ?auto_234838 ) ) ( not ( = ?auto_234836 ?auto_234839 ) ) ( not ( = ?auto_234836 ?auto_234840 ) ) ( not ( = ?auto_234836 ?auto_234841 ) ) ( not ( = ?auto_234836 ?auto_234842 ) ) ( not ( = ?auto_234837 ?auto_234838 ) ) ( not ( = ?auto_234837 ?auto_234839 ) ) ( not ( = ?auto_234837 ?auto_234840 ) ) ( not ( = ?auto_234837 ?auto_234841 ) ) ( not ( = ?auto_234837 ?auto_234842 ) ) ( not ( = ?auto_234838 ?auto_234839 ) ) ( not ( = ?auto_234838 ?auto_234840 ) ) ( not ( = ?auto_234838 ?auto_234841 ) ) ( not ( = ?auto_234838 ?auto_234842 ) ) ( not ( = ?auto_234839 ?auto_234840 ) ) ( not ( = ?auto_234839 ?auto_234841 ) ) ( not ( = ?auto_234839 ?auto_234842 ) ) ( not ( = ?auto_234840 ?auto_234841 ) ) ( not ( = ?auto_234840 ?auto_234842 ) ) ( not ( = ?auto_234841 ?auto_234842 ) ) ( ON ?auto_234840 ?auto_234841 ) ( ON ?auto_234839 ?auto_234840 ) ( ON ?auto_234838 ?auto_234839 ) ( ON ?auto_234837 ?auto_234838 ) ( ON ?auto_234836 ?auto_234837 ) ( ON ?auto_234835 ?auto_234836 ) ( ON ?auto_234834 ?auto_234835 ) ( CLEAR ?auto_234832 ) ( ON ?auto_234833 ?auto_234834 ) ( CLEAR ?auto_234833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_234832 ?auto_234833 )
      ( MAKE-10PILE ?auto_234832 ?auto_234833 ?auto_234834 ?auto_234835 ?auto_234836 ?auto_234837 ?auto_234838 ?auto_234839 ?auto_234840 ?auto_234841 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_234874 - BLOCK
      ?auto_234875 - BLOCK
      ?auto_234876 - BLOCK
      ?auto_234877 - BLOCK
      ?auto_234878 - BLOCK
      ?auto_234879 - BLOCK
      ?auto_234880 - BLOCK
      ?auto_234881 - BLOCK
      ?auto_234882 - BLOCK
      ?auto_234883 - BLOCK
    )
    :vars
    (
      ?auto_234884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234883 ?auto_234884 ) ( not ( = ?auto_234874 ?auto_234875 ) ) ( not ( = ?auto_234874 ?auto_234876 ) ) ( not ( = ?auto_234874 ?auto_234877 ) ) ( not ( = ?auto_234874 ?auto_234878 ) ) ( not ( = ?auto_234874 ?auto_234879 ) ) ( not ( = ?auto_234874 ?auto_234880 ) ) ( not ( = ?auto_234874 ?auto_234881 ) ) ( not ( = ?auto_234874 ?auto_234882 ) ) ( not ( = ?auto_234874 ?auto_234883 ) ) ( not ( = ?auto_234874 ?auto_234884 ) ) ( not ( = ?auto_234875 ?auto_234876 ) ) ( not ( = ?auto_234875 ?auto_234877 ) ) ( not ( = ?auto_234875 ?auto_234878 ) ) ( not ( = ?auto_234875 ?auto_234879 ) ) ( not ( = ?auto_234875 ?auto_234880 ) ) ( not ( = ?auto_234875 ?auto_234881 ) ) ( not ( = ?auto_234875 ?auto_234882 ) ) ( not ( = ?auto_234875 ?auto_234883 ) ) ( not ( = ?auto_234875 ?auto_234884 ) ) ( not ( = ?auto_234876 ?auto_234877 ) ) ( not ( = ?auto_234876 ?auto_234878 ) ) ( not ( = ?auto_234876 ?auto_234879 ) ) ( not ( = ?auto_234876 ?auto_234880 ) ) ( not ( = ?auto_234876 ?auto_234881 ) ) ( not ( = ?auto_234876 ?auto_234882 ) ) ( not ( = ?auto_234876 ?auto_234883 ) ) ( not ( = ?auto_234876 ?auto_234884 ) ) ( not ( = ?auto_234877 ?auto_234878 ) ) ( not ( = ?auto_234877 ?auto_234879 ) ) ( not ( = ?auto_234877 ?auto_234880 ) ) ( not ( = ?auto_234877 ?auto_234881 ) ) ( not ( = ?auto_234877 ?auto_234882 ) ) ( not ( = ?auto_234877 ?auto_234883 ) ) ( not ( = ?auto_234877 ?auto_234884 ) ) ( not ( = ?auto_234878 ?auto_234879 ) ) ( not ( = ?auto_234878 ?auto_234880 ) ) ( not ( = ?auto_234878 ?auto_234881 ) ) ( not ( = ?auto_234878 ?auto_234882 ) ) ( not ( = ?auto_234878 ?auto_234883 ) ) ( not ( = ?auto_234878 ?auto_234884 ) ) ( not ( = ?auto_234879 ?auto_234880 ) ) ( not ( = ?auto_234879 ?auto_234881 ) ) ( not ( = ?auto_234879 ?auto_234882 ) ) ( not ( = ?auto_234879 ?auto_234883 ) ) ( not ( = ?auto_234879 ?auto_234884 ) ) ( not ( = ?auto_234880 ?auto_234881 ) ) ( not ( = ?auto_234880 ?auto_234882 ) ) ( not ( = ?auto_234880 ?auto_234883 ) ) ( not ( = ?auto_234880 ?auto_234884 ) ) ( not ( = ?auto_234881 ?auto_234882 ) ) ( not ( = ?auto_234881 ?auto_234883 ) ) ( not ( = ?auto_234881 ?auto_234884 ) ) ( not ( = ?auto_234882 ?auto_234883 ) ) ( not ( = ?auto_234882 ?auto_234884 ) ) ( not ( = ?auto_234883 ?auto_234884 ) ) ( ON ?auto_234882 ?auto_234883 ) ( ON ?auto_234881 ?auto_234882 ) ( ON ?auto_234880 ?auto_234881 ) ( ON ?auto_234879 ?auto_234880 ) ( ON ?auto_234878 ?auto_234879 ) ( ON ?auto_234877 ?auto_234878 ) ( ON ?auto_234876 ?auto_234877 ) ( ON ?auto_234875 ?auto_234876 ) ( ON ?auto_234874 ?auto_234875 ) ( CLEAR ?auto_234874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_234874 )
      ( MAKE-10PILE ?auto_234874 ?auto_234875 ?auto_234876 ?auto_234877 ?auto_234878 ?auto_234879 ?auto_234880 ?auto_234881 ?auto_234882 ?auto_234883 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_234917 - BLOCK
      ?auto_234918 - BLOCK
      ?auto_234919 - BLOCK
      ?auto_234920 - BLOCK
      ?auto_234921 - BLOCK
      ?auto_234922 - BLOCK
      ?auto_234923 - BLOCK
      ?auto_234924 - BLOCK
      ?auto_234925 - BLOCK
      ?auto_234926 - BLOCK
      ?auto_234927 - BLOCK
    )
    :vars
    (
      ?auto_234928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_234926 ) ( ON ?auto_234927 ?auto_234928 ) ( CLEAR ?auto_234927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_234917 ) ( ON ?auto_234918 ?auto_234917 ) ( ON ?auto_234919 ?auto_234918 ) ( ON ?auto_234920 ?auto_234919 ) ( ON ?auto_234921 ?auto_234920 ) ( ON ?auto_234922 ?auto_234921 ) ( ON ?auto_234923 ?auto_234922 ) ( ON ?auto_234924 ?auto_234923 ) ( ON ?auto_234925 ?auto_234924 ) ( ON ?auto_234926 ?auto_234925 ) ( not ( = ?auto_234917 ?auto_234918 ) ) ( not ( = ?auto_234917 ?auto_234919 ) ) ( not ( = ?auto_234917 ?auto_234920 ) ) ( not ( = ?auto_234917 ?auto_234921 ) ) ( not ( = ?auto_234917 ?auto_234922 ) ) ( not ( = ?auto_234917 ?auto_234923 ) ) ( not ( = ?auto_234917 ?auto_234924 ) ) ( not ( = ?auto_234917 ?auto_234925 ) ) ( not ( = ?auto_234917 ?auto_234926 ) ) ( not ( = ?auto_234917 ?auto_234927 ) ) ( not ( = ?auto_234917 ?auto_234928 ) ) ( not ( = ?auto_234918 ?auto_234919 ) ) ( not ( = ?auto_234918 ?auto_234920 ) ) ( not ( = ?auto_234918 ?auto_234921 ) ) ( not ( = ?auto_234918 ?auto_234922 ) ) ( not ( = ?auto_234918 ?auto_234923 ) ) ( not ( = ?auto_234918 ?auto_234924 ) ) ( not ( = ?auto_234918 ?auto_234925 ) ) ( not ( = ?auto_234918 ?auto_234926 ) ) ( not ( = ?auto_234918 ?auto_234927 ) ) ( not ( = ?auto_234918 ?auto_234928 ) ) ( not ( = ?auto_234919 ?auto_234920 ) ) ( not ( = ?auto_234919 ?auto_234921 ) ) ( not ( = ?auto_234919 ?auto_234922 ) ) ( not ( = ?auto_234919 ?auto_234923 ) ) ( not ( = ?auto_234919 ?auto_234924 ) ) ( not ( = ?auto_234919 ?auto_234925 ) ) ( not ( = ?auto_234919 ?auto_234926 ) ) ( not ( = ?auto_234919 ?auto_234927 ) ) ( not ( = ?auto_234919 ?auto_234928 ) ) ( not ( = ?auto_234920 ?auto_234921 ) ) ( not ( = ?auto_234920 ?auto_234922 ) ) ( not ( = ?auto_234920 ?auto_234923 ) ) ( not ( = ?auto_234920 ?auto_234924 ) ) ( not ( = ?auto_234920 ?auto_234925 ) ) ( not ( = ?auto_234920 ?auto_234926 ) ) ( not ( = ?auto_234920 ?auto_234927 ) ) ( not ( = ?auto_234920 ?auto_234928 ) ) ( not ( = ?auto_234921 ?auto_234922 ) ) ( not ( = ?auto_234921 ?auto_234923 ) ) ( not ( = ?auto_234921 ?auto_234924 ) ) ( not ( = ?auto_234921 ?auto_234925 ) ) ( not ( = ?auto_234921 ?auto_234926 ) ) ( not ( = ?auto_234921 ?auto_234927 ) ) ( not ( = ?auto_234921 ?auto_234928 ) ) ( not ( = ?auto_234922 ?auto_234923 ) ) ( not ( = ?auto_234922 ?auto_234924 ) ) ( not ( = ?auto_234922 ?auto_234925 ) ) ( not ( = ?auto_234922 ?auto_234926 ) ) ( not ( = ?auto_234922 ?auto_234927 ) ) ( not ( = ?auto_234922 ?auto_234928 ) ) ( not ( = ?auto_234923 ?auto_234924 ) ) ( not ( = ?auto_234923 ?auto_234925 ) ) ( not ( = ?auto_234923 ?auto_234926 ) ) ( not ( = ?auto_234923 ?auto_234927 ) ) ( not ( = ?auto_234923 ?auto_234928 ) ) ( not ( = ?auto_234924 ?auto_234925 ) ) ( not ( = ?auto_234924 ?auto_234926 ) ) ( not ( = ?auto_234924 ?auto_234927 ) ) ( not ( = ?auto_234924 ?auto_234928 ) ) ( not ( = ?auto_234925 ?auto_234926 ) ) ( not ( = ?auto_234925 ?auto_234927 ) ) ( not ( = ?auto_234925 ?auto_234928 ) ) ( not ( = ?auto_234926 ?auto_234927 ) ) ( not ( = ?auto_234926 ?auto_234928 ) ) ( not ( = ?auto_234927 ?auto_234928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234927 ?auto_234928 )
      ( !STACK ?auto_234927 ?auto_234926 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_234963 - BLOCK
      ?auto_234964 - BLOCK
      ?auto_234965 - BLOCK
      ?auto_234966 - BLOCK
      ?auto_234967 - BLOCK
      ?auto_234968 - BLOCK
      ?auto_234969 - BLOCK
      ?auto_234970 - BLOCK
      ?auto_234971 - BLOCK
      ?auto_234972 - BLOCK
      ?auto_234973 - BLOCK
    )
    :vars
    (
      ?auto_234974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_234973 ?auto_234974 ) ( ON-TABLE ?auto_234963 ) ( ON ?auto_234964 ?auto_234963 ) ( ON ?auto_234965 ?auto_234964 ) ( ON ?auto_234966 ?auto_234965 ) ( ON ?auto_234967 ?auto_234966 ) ( ON ?auto_234968 ?auto_234967 ) ( ON ?auto_234969 ?auto_234968 ) ( ON ?auto_234970 ?auto_234969 ) ( ON ?auto_234971 ?auto_234970 ) ( not ( = ?auto_234963 ?auto_234964 ) ) ( not ( = ?auto_234963 ?auto_234965 ) ) ( not ( = ?auto_234963 ?auto_234966 ) ) ( not ( = ?auto_234963 ?auto_234967 ) ) ( not ( = ?auto_234963 ?auto_234968 ) ) ( not ( = ?auto_234963 ?auto_234969 ) ) ( not ( = ?auto_234963 ?auto_234970 ) ) ( not ( = ?auto_234963 ?auto_234971 ) ) ( not ( = ?auto_234963 ?auto_234972 ) ) ( not ( = ?auto_234963 ?auto_234973 ) ) ( not ( = ?auto_234963 ?auto_234974 ) ) ( not ( = ?auto_234964 ?auto_234965 ) ) ( not ( = ?auto_234964 ?auto_234966 ) ) ( not ( = ?auto_234964 ?auto_234967 ) ) ( not ( = ?auto_234964 ?auto_234968 ) ) ( not ( = ?auto_234964 ?auto_234969 ) ) ( not ( = ?auto_234964 ?auto_234970 ) ) ( not ( = ?auto_234964 ?auto_234971 ) ) ( not ( = ?auto_234964 ?auto_234972 ) ) ( not ( = ?auto_234964 ?auto_234973 ) ) ( not ( = ?auto_234964 ?auto_234974 ) ) ( not ( = ?auto_234965 ?auto_234966 ) ) ( not ( = ?auto_234965 ?auto_234967 ) ) ( not ( = ?auto_234965 ?auto_234968 ) ) ( not ( = ?auto_234965 ?auto_234969 ) ) ( not ( = ?auto_234965 ?auto_234970 ) ) ( not ( = ?auto_234965 ?auto_234971 ) ) ( not ( = ?auto_234965 ?auto_234972 ) ) ( not ( = ?auto_234965 ?auto_234973 ) ) ( not ( = ?auto_234965 ?auto_234974 ) ) ( not ( = ?auto_234966 ?auto_234967 ) ) ( not ( = ?auto_234966 ?auto_234968 ) ) ( not ( = ?auto_234966 ?auto_234969 ) ) ( not ( = ?auto_234966 ?auto_234970 ) ) ( not ( = ?auto_234966 ?auto_234971 ) ) ( not ( = ?auto_234966 ?auto_234972 ) ) ( not ( = ?auto_234966 ?auto_234973 ) ) ( not ( = ?auto_234966 ?auto_234974 ) ) ( not ( = ?auto_234967 ?auto_234968 ) ) ( not ( = ?auto_234967 ?auto_234969 ) ) ( not ( = ?auto_234967 ?auto_234970 ) ) ( not ( = ?auto_234967 ?auto_234971 ) ) ( not ( = ?auto_234967 ?auto_234972 ) ) ( not ( = ?auto_234967 ?auto_234973 ) ) ( not ( = ?auto_234967 ?auto_234974 ) ) ( not ( = ?auto_234968 ?auto_234969 ) ) ( not ( = ?auto_234968 ?auto_234970 ) ) ( not ( = ?auto_234968 ?auto_234971 ) ) ( not ( = ?auto_234968 ?auto_234972 ) ) ( not ( = ?auto_234968 ?auto_234973 ) ) ( not ( = ?auto_234968 ?auto_234974 ) ) ( not ( = ?auto_234969 ?auto_234970 ) ) ( not ( = ?auto_234969 ?auto_234971 ) ) ( not ( = ?auto_234969 ?auto_234972 ) ) ( not ( = ?auto_234969 ?auto_234973 ) ) ( not ( = ?auto_234969 ?auto_234974 ) ) ( not ( = ?auto_234970 ?auto_234971 ) ) ( not ( = ?auto_234970 ?auto_234972 ) ) ( not ( = ?auto_234970 ?auto_234973 ) ) ( not ( = ?auto_234970 ?auto_234974 ) ) ( not ( = ?auto_234971 ?auto_234972 ) ) ( not ( = ?auto_234971 ?auto_234973 ) ) ( not ( = ?auto_234971 ?auto_234974 ) ) ( not ( = ?auto_234972 ?auto_234973 ) ) ( not ( = ?auto_234972 ?auto_234974 ) ) ( not ( = ?auto_234973 ?auto_234974 ) ) ( CLEAR ?auto_234971 ) ( ON ?auto_234972 ?auto_234973 ) ( CLEAR ?auto_234972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_234963 ?auto_234964 ?auto_234965 ?auto_234966 ?auto_234967 ?auto_234968 ?auto_234969 ?auto_234970 ?auto_234971 ?auto_234972 )
      ( MAKE-11PILE ?auto_234963 ?auto_234964 ?auto_234965 ?auto_234966 ?auto_234967 ?auto_234968 ?auto_234969 ?auto_234970 ?auto_234971 ?auto_234972 ?auto_234973 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235009 - BLOCK
      ?auto_235010 - BLOCK
      ?auto_235011 - BLOCK
      ?auto_235012 - BLOCK
      ?auto_235013 - BLOCK
      ?auto_235014 - BLOCK
      ?auto_235015 - BLOCK
      ?auto_235016 - BLOCK
      ?auto_235017 - BLOCK
      ?auto_235018 - BLOCK
      ?auto_235019 - BLOCK
    )
    :vars
    (
      ?auto_235020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235019 ?auto_235020 ) ( ON-TABLE ?auto_235009 ) ( ON ?auto_235010 ?auto_235009 ) ( ON ?auto_235011 ?auto_235010 ) ( ON ?auto_235012 ?auto_235011 ) ( ON ?auto_235013 ?auto_235012 ) ( ON ?auto_235014 ?auto_235013 ) ( ON ?auto_235015 ?auto_235014 ) ( ON ?auto_235016 ?auto_235015 ) ( not ( = ?auto_235009 ?auto_235010 ) ) ( not ( = ?auto_235009 ?auto_235011 ) ) ( not ( = ?auto_235009 ?auto_235012 ) ) ( not ( = ?auto_235009 ?auto_235013 ) ) ( not ( = ?auto_235009 ?auto_235014 ) ) ( not ( = ?auto_235009 ?auto_235015 ) ) ( not ( = ?auto_235009 ?auto_235016 ) ) ( not ( = ?auto_235009 ?auto_235017 ) ) ( not ( = ?auto_235009 ?auto_235018 ) ) ( not ( = ?auto_235009 ?auto_235019 ) ) ( not ( = ?auto_235009 ?auto_235020 ) ) ( not ( = ?auto_235010 ?auto_235011 ) ) ( not ( = ?auto_235010 ?auto_235012 ) ) ( not ( = ?auto_235010 ?auto_235013 ) ) ( not ( = ?auto_235010 ?auto_235014 ) ) ( not ( = ?auto_235010 ?auto_235015 ) ) ( not ( = ?auto_235010 ?auto_235016 ) ) ( not ( = ?auto_235010 ?auto_235017 ) ) ( not ( = ?auto_235010 ?auto_235018 ) ) ( not ( = ?auto_235010 ?auto_235019 ) ) ( not ( = ?auto_235010 ?auto_235020 ) ) ( not ( = ?auto_235011 ?auto_235012 ) ) ( not ( = ?auto_235011 ?auto_235013 ) ) ( not ( = ?auto_235011 ?auto_235014 ) ) ( not ( = ?auto_235011 ?auto_235015 ) ) ( not ( = ?auto_235011 ?auto_235016 ) ) ( not ( = ?auto_235011 ?auto_235017 ) ) ( not ( = ?auto_235011 ?auto_235018 ) ) ( not ( = ?auto_235011 ?auto_235019 ) ) ( not ( = ?auto_235011 ?auto_235020 ) ) ( not ( = ?auto_235012 ?auto_235013 ) ) ( not ( = ?auto_235012 ?auto_235014 ) ) ( not ( = ?auto_235012 ?auto_235015 ) ) ( not ( = ?auto_235012 ?auto_235016 ) ) ( not ( = ?auto_235012 ?auto_235017 ) ) ( not ( = ?auto_235012 ?auto_235018 ) ) ( not ( = ?auto_235012 ?auto_235019 ) ) ( not ( = ?auto_235012 ?auto_235020 ) ) ( not ( = ?auto_235013 ?auto_235014 ) ) ( not ( = ?auto_235013 ?auto_235015 ) ) ( not ( = ?auto_235013 ?auto_235016 ) ) ( not ( = ?auto_235013 ?auto_235017 ) ) ( not ( = ?auto_235013 ?auto_235018 ) ) ( not ( = ?auto_235013 ?auto_235019 ) ) ( not ( = ?auto_235013 ?auto_235020 ) ) ( not ( = ?auto_235014 ?auto_235015 ) ) ( not ( = ?auto_235014 ?auto_235016 ) ) ( not ( = ?auto_235014 ?auto_235017 ) ) ( not ( = ?auto_235014 ?auto_235018 ) ) ( not ( = ?auto_235014 ?auto_235019 ) ) ( not ( = ?auto_235014 ?auto_235020 ) ) ( not ( = ?auto_235015 ?auto_235016 ) ) ( not ( = ?auto_235015 ?auto_235017 ) ) ( not ( = ?auto_235015 ?auto_235018 ) ) ( not ( = ?auto_235015 ?auto_235019 ) ) ( not ( = ?auto_235015 ?auto_235020 ) ) ( not ( = ?auto_235016 ?auto_235017 ) ) ( not ( = ?auto_235016 ?auto_235018 ) ) ( not ( = ?auto_235016 ?auto_235019 ) ) ( not ( = ?auto_235016 ?auto_235020 ) ) ( not ( = ?auto_235017 ?auto_235018 ) ) ( not ( = ?auto_235017 ?auto_235019 ) ) ( not ( = ?auto_235017 ?auto_235020 ) ) ( not ( = ?auto_235018 ?auto_235019 ) ) ( not ( = ?auto_235018 ?auto_235020 ) ) ( not ( = ?auto_235019 ?auto_235020 ) ) ( ON ?auto_235018 ?auto_235019 ) ( CLEAR ?auto_235016 ) ( ON ?auto_235017 ?auto_235018 ) ( CLEAR ?auto_235017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_235009 ?auto_235010 ?auto_235011 ?auto_235012 ?auto_235013 ?auto_235014 ?auto_235015 ?auto_235016 ?auto_235017 )
      ( MAKE-11PILE ?auto_235009 ?auto_235010 ?auto_235011 ?auto_235012 ?auto_235013 ?auto_235014 ?auto_235015 ?auto_235016 ?auto_235017 ?auto_235018 ?auto_235019 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235055 - BLOCK
      ?auto_235056 - BLOCK
      ?auto_235057 - BLOCK
      ?auto_235058 - BLOCK
      ?auto_235059 - BLOCK
      ?auto_235060 - BLOCK
      ?auto_235061 - BLOCK
      ?auto_235062 - BLOCK
      ?auto_235063 - BLOCK
      ?auto_235064 - BLOCK
      ?auto_235065 - BLOCK
    )
    :vars
    (
      ?auto_235066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235065 ?auto_235066 ) ( ON-TABLE ?auto_235055 ) ( ON ?auto_235056 ?auto_235055 ) ( ON ?auto_235057 ?auto_235056 ) ( ON ?auto_235058 ?auto_235057 ) ( ON ?auto_235059 ?auto_235058 ) ( ON ?auto_235060 ?auto_235059 ) ( ON ?auto_235061 ?auto_235060 ) ( not ( = ?auto_235055 ?auto_235056 ) ) ( not ( = ?auto_235055 ?auto_235057 ) ) ( not ( = ?auto_235055 ?auto_235058 ) ) ( not ( = ?auto_235055 ?auto_235059 ) ) ( not ( = ?auto_235055 ?auto_235060 ) ) ( not ( = ?auto_235055 ?auto_235061 ) ) ( not ( = ?auto_235055 ?auto_235062 ) ) ( not ( = ?auto_235055 ?auto_235063 ) ) ( not ( = ?auto_235055 ?auto_235064 ) ) ( not ( = ?auto_235055 ?auto_235065 ) ) ( not ( = ?auto_235055 ?auto_235066 ) ) ( not ( = ?auto_235056 ?auto_235057 ) ) ( not ( = ?auto_235056 ?auto_235058 ) ) ( not ( = ?auto_235056 ?auto_235059 ) ) ( not ( = ?auto_235056 ?auto_235060 ) ) ( not ( = ?auto_235056 ?auto_235061 ) ) ( not ( = ?auto_235056 ?auto_235062 ) ) ( not ( = ?auto_235056 ?auto_235063 ) ) ( not ( = ?auto_235056 ?auto_235064 ) ) ( not ( = ?auto_235056 ?auto_235065 ) ) ( not ( = ?auto_235056 ?auto_235066 ) ) ( not ( = ?auto_235057 ?auto_235058 ) ) ( not ( = ?auto_235057 ?auto_235059 ) ) ( not ( = ?auto_235057 ?auto_235060 ) ) ( not ( = ?auto_235057 ?auto_235061 ) ) ( not ( = ?auto_235057 ?auto_235062 ) ) ( not ( = ?auto_235057 ?auto_235063 ) ) ( not ( = ?auto_235057 ?auto_235064 ) ) ( not ( = ?auto_235057 ?auto_235065 ) ) ( not ( = ?auto_235057 ?auto_235066 ) ) ( not ( = ?auto_235058 ?auto_235059 ) ) ( not ( = ?auto_235058 ?auto_235060 ) ) ( not ( = ?auto_235058 ?auto_235061 ) ) ( not ( = ?auto_235058 ?auto_235062 ) ) ( not ( = ?auto_235058 ?auto_235063 ) ) ( not ( = ?auto_235058 ?auto_235064 ) ) ( not ( = ?auto_235058 ?auto_235065 ) ) ( not ( = ?auto_235058 ?auto_235066 ) ) ( not ( = ?auto_235059 ?auto_235060 ) ) ( not ( = ?auto_235059 ?auto_235061 ) ) ( not ( = ?auto_235059 ?auto_235062 ) ) ( not ( = ?auto_235059 ?auto_235063 ) ) ( not ( = ?auto_235059 ?auto_235064 ) ) ( not ( = ?auto_235059 ?auto_235065 ) ) ( not ( = ?auto_235059 ?auto_235066 ) ) ( not ( = ?auto_235060 ?auto_235061 ) ) ( not ( = ?auto_235060 ?auto_235062 ) ) ( not ( = ?auto_235060 ?auto_235063 ) ) ( not ( = ?auto_235060 ?auto_235064 ) ) ( not ( = ?auto_235060 ?auto_235065 ) ) ( not ( = ?auto_235060 ?auto_235066 ) ) ( not ( = ?auto_235061 ?auto_235062 ) ) ( not ( = ?auto_235061 ?auto_235063 ) ) ( not ( = ?auto_235061 ?auto_235064 ) ) ( not ( = ?auto_235061 ?auto_235065 ) ) ( not ( = ?auto_235061 ?auto_235066 ) ) ( not ( = ?auto_235062 ?auto_235063 ) ) ( not ( = ?auto_235062 ?auto_235064 ) ) ( not ( = ?auto_235062 ?auto_235065 ) ) ( not ( = ?auto_235062 ?auto_235066 ) ) ( not ( = ?auto_235063 ?auto_235064 ) ) ( not ( = ?auto_235063 ?auto_235065 ) ) ( not ( = ?auto_235063 ?auto_235066 ) ) ( not ( = ?auto_235064 ?auto_235065 ) ) ( not ( = ?auto_235064 ?auto_235066 ) ) ( not ( = ?auto_235065 ?auto_235066 ) ) ( ON ?auto_235064 ?auto_235065 ) ( ON ?auto_235063 ?auto_235064 ) ( CLEAR ?auto_235061 ) ( ON ?auto_235062 ?auto_235063 ) ( CLEAR ?auto_235062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_235055 ?auto_235056 ?auto_235057 ?auto_235058 ?auto_235059 ?auto_235060 ?auto_235061 ?auto_235062 )
      ( MAKE-11PILE ?auto_235055 ?auto_235056 ?auto_235057 ?auto_235058 ?auto_235059 ?auto_235060 ?auto_235061 ?auto_235062 ?auto_235063 ?auto_235064 ?auto_235065 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235101 - BLOCK
      ?auto_235102 - BLOCK
      ?auto_235103 - BLOCK
      ?auto_235104 - BLOCK
      ?auto_235105 - BLOCK
      ?auto_235106 - BLOCK
      ?auto_235107 - BLOCK
      ?auto_235108 - BLOCK
      ?auto_235109 - BLOCK
      ?auto_235110 - BLOCK
      ?auto_235111 - BLOCK
    )
    :vars
    (
      ?auto_235112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235111 ?auto_235112 ) ( ON-TABLE ?auto_235101 ) ( ON ?auto_235102 ?auto_235101 ) ( ON ?auto_235103 ?auto_235102 ) ( ON ?auto_235104 ?auto_235103 ) ( ON ?auto_235105 ?auto_235104 ) ( ON ?auto_235106 ?auto_235105 ) ( not ( = ?auto_235101 ?auto_235102 ) ) ( not ( = ?auto_235101 ?auto_235103 ) ) ( not ( = ?auto_235101 ?auto_235104 ) ) ( not ( = ?auto_235101 ?auto_235105 ) ) ( not ( = ?auto_235101 ?auto_235106 ) ) ( not ( = ?auto_235101 ?auto_235107 ) ) ( not ( = ?auto_235101 ?auto_235108 ) ) ( not ( = ?auto_235101 ?auto_235109 ) ) ( not ( = ?auto_235101 ?auto_235110 ) ) ( not ( = ?auto_235101 ?auto_235111 ) ) ( not ( = ?auto_235101 ?auto_235112 ) ) ( not ( = ?auto_235102 ?auto_235103 ) ) ( not ( = ?auto_235102 ?auto_235104 ) ) ( not ( = ?auto_235102 ?auto_235105 ) ) ( not ( = ?auto_235102 ?auto_235106 ) ) ( not ( = ?auto_235102 ?auto_235107 ) ) ( not ( = ?auto_235102 ?auto_235108 ) ) ( not ( = ?auto_235102 ?auto_235109 ) ) ( not ( = ?auto_235102 ?auto_235110 ) ) ( not ( = ?auto_235102 ?auto_235111 ) ) ( not ( = ?auto_235102 ?auto_235112 ) ) ( not ( = ?auto_235103 ?auto_235104 ) ) ( not ( = ?auto_235103 ?auto_235105 ) ) ( not ( = ?auto_235103 ?auto_235106 ) ) ( not ( = ?auto_235103 ?auto_235107 ) ) ( not ( = ?auto_235103 ?auto_235108 ) ) ( not ( = ?auto_235103 ?auto_235109 ) ) ( not ( = ?auto_235103 ?auto_235110 ) ) ( not ( = ?auto_235103 ?auto_235111 ) ) ( not ( = ?auto_235103 ?auto_235112 ) ) ( not ( = ?auto_235104 ?auto_235105 ) ) ( not ( = ?auto_235104 ?auto_235106 ) ) ( not ( = ?auto_235104 ?auto_235107 ) ) ( not ( = ?auto_235104 ?auto_235108 ) ) ( not ( = ?auto_235104 ?auto_235109 ) ) ( not ( = ?auto_235104 ?auto_235110 ) ) ( not ( = ?auto_235104 ?auto_235111 ) ) ( not ( = ?auto_235104 ?auto_235112 ) ) ( not ( = ?auto_235105 ?auto_235106 ) ) ( not ( = ?auto_235105 ?auto_235107 ) ) ( not ( = ?auto_235105 ?auto_235108 ) ) ( not ( = ?auto_235105 ?auto_235109 ) ) ( not ( = ?auto_235105 ?auto_235110 ) ) ( not ( = ?auto_235105 ?auto_235111 ) ) ( not ( = ?auto_235105 ?auto_235112 ) ) ( not ( = ?auto_235106 ?auto_235107 ) ) ( not ( = ?auto_235106 ?auto_235108 ) ) ( not ( = ?auto_235106 ?auto_235109 ) ) ( not ( = ?auto_235106 ?auto_235110 ) ) ( not ( = ?auto_235106 ?auto_235111 ) ) ( not ( = ?auto_235106 ?auto_235112 ) ) ( not ( = ?auto_235107 ?auto_235108 ) ) ( not ( = ?auto_235107 ?auto_235109 ) ) ( not ( = ?auto_235107 ?auto_235110 ) ) ( not ( = ?auto_235107 ?auto_235111 ) ) ( not ( = ?auto_235107 ?auto_235112 ) ) ( not ( = ?auto_235108 ?auto_235109 ) ) ( not ( = ?auto_235108 ?auto_235110 ) ) ( not ( = ?auto_235108 ?auto_235111 ) ) ( not ( = ?auto_235108 ?auto_235112 ) ) ( not ( = ?auto_235109 ?auto_235110 ) ) ( not ( = ?auto_235109 ?auto_235111 ) ) ( not ( = ?auto_235109 ?auto_235112 ) ) ( not ( = ?auto_235110 ?auto_235111 ) ) ( not ( = ?auto_235110 ?auto_235112 ) ) ( not ( = ?auto_235111 ?auto_235112 ) ) ( ON ?auto_235110 ?auto_235111 ) ( ON ?auto_235109 ?auto_235110 ) ( ON ?auto_235108 ?auto_235109 ) ( CLEAR ?auto_235106 ) ( ON ?auto_235107 ?auto_235108 ) ( CLEAR ?auto_235107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_235101 ?auto_235102 ?auto_235103 ?auto_235104 ?auto_235105 ?auto_235106 ?auto_235107 )
      ( MAKE-11PILE ?auto_235101 ?auto_235102 ?auto_235103 ?auto_235104 ?auto_235105 ?auto_235106 ?auto_235107 ?auto_235108 ?auto_235109 ?auto_235110 ?auto_235111 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235147 - BLOCK
      ?auto_235148 - BLOCK
      ?auto_235149 - BLOCK
      ?auto_235150 - BLOCK
      ?auto_235151 - BLOCK
      ?auto_235152 - BLOCK
      ?auto_235153 - BLOCK
      ?auto_235154 - BLOCK
      ?auto_235155 - BLOCK
      ?auto_235156 - BLOCK
      ?auto_235157 - BLOCK
    )
    :vars
    (
      ?auto_235158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235157 ?auto_235158 ) ( ON-TABLE ?auto_235147 ) ( ON ?auto_235148 ?auto_235147 ) ( ON ?auto_235149 ?auto_235148 ) ( ON ?auto_235150 ?auto_235149 ) ( ON ?auto_235151 ?auto_235150 ) ( not ( = ?auto_235147 ?auto_235148 ) ) ( not ( = ?auto_235147 ?auto_235149 ) ) ( not ( = ?auto_235147 ?auto_235150 ) ) ( not ( = ?auto_235147 ?auto_235151 ) ) ( not ( = ?auto_235147 ?auto_235152 ) ) ( not ( = ?auto_235147 ?auto_235153 ) ) ( not ( = ?auto_235147 ?auto_235154 ) ) ( not ( = ?auto_235147 ?auto_235155 ) ) ( not ( = ?auto_235147 ?auto_235156 ) ) ( not ( = ?auto_235147 ?auto_235157 ) ) ( not ( = ?auto_235147 ?auto_235158 ) ) ( not ( = ?auto_235148 ?auto_235149 ) ) ( not ( = ?auto_235148 ?auto_235150 ) ) ( not ( = ?auto_235148 ?auto_235151 ) ) ( not ( = ?auto_235148 ?auto_235152 ) ) ( not ( = ?auto_235148 ?auto_235153 ) ) ( not ( = ?auto_235148 ?auto_235154 ) ) ( not ( = ?auto_235148 ?auto_235155 ) ) ( not ( = ?auto_235148 ?auto_235156 ) ) ( not ( = ?auto_235148 ?auto_235157 ) ) ( not ( = ?auto_235148 ?auto_235158 ) ) ( not ( = ?auto_235149 ?auto_235150 ) ) ( not ( = ?auto_235149 ?auto_235151 ) ) ( not ( = ?auto_235149 ?auto_235152 ) ) ( not ( = ?auto_235149 ?auto_235153 ) ) ( not ( = ?auto_235149 ?auto_235154 ) ) ( not ( = ?auto_235149 ?auto_235155 ) ) ( not ( = ?auto_235149 ?auto_235156 ) ) ( not ( = ?auto_235149 ?auto_235157 ) ) ( not ( = ?auto_235149 ?auto_235158 ) ) ( not ( = ?auto_235150 ?auto_235151 ) ) ( not ( = ?auto_235150 ?auto_235152 ) ) ( not ( = ?auto_235150 ?auto_235153 ) ) ( not ( = ?auto_235150 ?auto_235154 ) ) ( not ( = ?auto_235150 ?auto_235155 ) ) ( not ( = ?auto_235150 ?auto_235156 ) ) ( not ( = ?auto_235150 ?auto_235157 ) ) ( not ( = ?auto_235150 ?auto_235158 ) ) ( not ( = ?auto_235151 ?auto_235152 ) ) ( not ( = ?auto_235151 ?auto_235153 ) ) ( not ( = ?auto_235151 ?auto_235154 ) ) ( not ( = ?auto_235151 ?auto_235155 ) ) ( not ( = ?auto_235151 ?auto_235156 ) ) ( not ( = ?auto_235151 ?auto_235157 ) ) ( not ( = ?auto_235151 ?auto_235158 ) ) ( not ( = ?auto_235152 ?auto_235153 ) ) ( not ( = ?auto_235152 ?auto_235154 ) ) ( not ( = ?auto_235152 ?auto_235155 ) ) ( not ( = ?auto_235152 ?auto_235156 ) ) ( not ( = ?auto_235152 ?auto_235157 ) ) ( not ( = ?auto_235152 ?auto_235158 ) ) ( not ( = ?auto_235153 ?auto_235154 ) ) ( not ( = ?auto_235153 ?auto_235155 ) ) ( not ( = ?auto_235153 ?auto_235156 ) ) ( not ( = ?auto_235153 ?auto_235157 ) ) ( not ( = ?auto_235153 ?auto_235158 ) ) ( not ( = ?auto_235154 ?auto_235155 ) ) ( not ( = ?auto_235154 ?auto_235156 ) ) ( not ( = ?auto_235154 ?auto_235157 ) ) ( not ( = ?auto_235154 ?auto_235158 ) ) ( not ( = ?auto_235155 ?auto_235156 ) ) ( not ( = ?auto_235155 ?auto_235157 ) ) ( not ( = ?auto_235155 ?auto_235158 ) ) ( not ( = ?auto_235156 ?auto_235157 ) ) ( not ( = ?auto_235156 ?auto_235158 ) ) ( not ( = ?auto_235157 ?auto_235158 ) ) ( ON ?auto_235156 ?auto_235157 ) ( ON ?auto_235155 ?auto_235156 ) ( ON ?auto_235154 ?auto_235155 ) ( ON ?auto_235153 ?auto_235154 ) ( CLEAR ?auto_235151 ) ( ON ?auto_235152 ?auto_235153 ) ( CLEAR ?auto_235152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_235147 ?auto_235148 ?auto_235149 ?auto_235150 ?auto_235151 ?auto_235152 )
      ( MAKE-11PILE ?auto_235147 ?auto_235148 ?auto_235149 ?auto_235150 ?auto_235151 ?auto_235152 ?auto_235153 ?auto_235154 ?auto_235155 ?auto_235156 ?auto_235157 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235193 - BLOCK
      ?auto_235194 - BLOCK
      ?auto_235195 - BLOCK
      ?auto_235196 - BLOCK
      ?auto_235197 - BLOCK
      ?auto_235198 - BLOCK
      ?auto_235199 - BLOCK
      ?auto_235200 - BLOCK
      ?auto_235201 - BLOCK
      ?auto_235202 - BLOCK
      ?auto_235203 - BLOCK
    )
    :vars
    (
      ?auto_235204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235203 ?auto_235204 ) ( ON-TABLE ?auto_235193 ) ( ON ?auto_235194 ?auto_235193 ) ( ON ?auto_235195 ?auto_235194 ) ( ON ?auto_235196 ?auto_235195 ) ( not ( = ?auto_235193 ?auto_235194 ) ) ( not ( = ?auto_235193 ?auto_235195 ) ) ( not ( = ?auto_235193 ?auto_235196 ) ) ( not ( = ?auto_235193 ?auto_235197 ) ) ( not ( = ?auto_235193 ?auto_235198 ) ) ( not ( = ?auto_235193 ?auto_235199 ) ) ( not ( = ?auto_235193 ?auto_235200 ) ) ( not ( = ?auto_235193 ?auto_235201 ) ) ( not ( = ?auto_235193 ?auto_235202 ) ) ( not ( = ?auto_235193 ?auto_235203 ) ) ( not ( = ?auto_235193 ?auto_235204 ) ) ( not ( = ?auto_235194 ?auto_235195 ) ) ( not ( = ?auto_235194 ?auto_235196 ) ) ( not ( = ?auto_235194 ?auto_235197 ) ) ( not ( = ?auto_235194 ?auto_235198 ) ) ( not ( = ?auto_235194 ?auto_235199 ) ) ( not ( = ?auto_235194 ?auto_235200 ) ) ( not ( = ?auto_235194 ?auto_235201 ) ) ( not ( = ?auto_235194 ?auto_235202 ) ) ( not ( = ?auto_235194 ?auto_235203 ) ) ( not ( = ?auto_235194 ?auto_235204 ) ) ( not ( = ?auto_235195 ?auto_235196 ) ) ( not ( = ?auto_235195 ?auto_235197 ) ) ( not ( = ?auto_235195 ?auto_235198 ) ) ( not ( = ?auto_235195 ?auto_235199 ) ) ( not ( = ?auto_235195 ?auto_235200 ) ) ( not ( = ?auto_235195 ?auto_235201 ) ) ( not ( = ?auto_235195 ?auto_235202 ) ) ( not ( = ?auto_235195 ?auto_235203 ) ) ( not ( = ?auto_235195 ?auto_235204 ) ) ( not ( = ?auto_235196 ?auto_235197 ) ) ( not ( = ?auto_235196 ?auto_235198 ) ) ( not ( = ?auto_235196 ?auto_235199 ) ) ( not ( = ?auto_235196 ?auto_235200 ) ) ( not ( = ?auto_235196 ?auto_235201 ) ) ( not ( = ?auto_235196 ?auto_235202 ) ) ( not ( = ?auto_235196 ?auto_235203 ) ) ( not ( = ?auto_235196 ?auto_235204 ) ) ( not ( = ?auto_235197 ?auto_235198 ) ) ( not ( = ?auto_235197 ?auto_235199 ) ) ( not ( = ?auto_235197 ?auto_235200 ) ) ( not ( = ?auto_235197 ?auto_235201 ) ) ( not ( = ?auto_235197 ?auto_235202 ) ) ( not ( = ?auto_235197 ?auto_235203 ) ) ( not ( = ?auto_235197 ?auto_235204 ) ) ( not ( = ?auto_235198 ?auto_235199 ) ) ( not ( = ?auto_235198 ?auto_235200 ) ) ( not ( = ?auto_235198 ?auto_235201 ) ) ( not ( = ?auto_235198 ?auto_235202 ) ) ( not ( = ?auto_235198 ?auto_235203 ) ) ( not ( = ?auto_235198 ?auto_235204 ) ) ( not ( = ?auto_235199 ?auto_235200 ) ) ( not ( = ?auto_235199 ?auto_235201 ) ) ( not ( = ?auto_235199 ?auto_235202 ) ) ( not ( = ?auto_235199 ?auto_235203 ) ) ( not ( = ?auto_235199 ?auto_235204 ) ) ( not ( = ?auto_235200 ?auto_235201 ) ) ( not ( = ?auto_235200 ?auto_235202 ) ) ( not ( = ?auto_235200 ?auto_235203 ) ) ( not ( = ?auto_235200 ?auto_235204 ) ) ( not ( = ?auto_235201 ?auto_235202 ) ) ( not ( = ?auto_235201 ?auto_235203 ) ) ( not ( = ?auto_235201 ?auto_235204 ) ) ( not ( = ?auto_235202 ?auto_235203 ) ) ( not ( = ?auto_235202 ?auto_235204 ) ) ( not ( = ?auto_235203 ?auto_235204 ) ) ( ON ?auto_235202 ?auto_235203 ) ( ON ?auto_235201 ?auto_235202 ) ( ON ?auto_235200 ?auto_235201 ) ( ON ?auto_235199 ?auto_235200 ) ( ON ?auto_235198 ?auto_235199 ) ( CLEAR ?auto_235196 ) ( ON ?auto_235197 ?auto_235198 ) ( CLEAR ?auto_235197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_235193 ?auto_235194 ?auto_235195 ?auto_235196 ?auto_235197 )
      ( MAKE-11PILE ?auto_235193 ?auto_235194 ?auto_235195 ?auto_235196 ?auto_235197 ?auto_235198 ?auto_235199 ?auto_235200 ?auto_235201 ?auto_235202 ?auto_235203 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235239 - BLOCK
      ?auto_235240 - BLOCK
      ?auto_235241 - BLOCK
      ?auto_235242 - BLOCK
      ?auto_235243 - BLOCK
      ?auto_235244 - BLOCK
      ?auto_235245 - BLOCK
      ?auto_235246 - BLOCK
      ?auto_235247 - BLOCK
      ?auto_235248 - BLOCK
      ?auto_235249 - BLOCK
    )
    :vars
    (
      ?auto_235250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235249 ?auto_235250 ) ( ON-TABLE ?auto_235239 ) ( ON ?auto_235240 ?auto_235239 ) ( ON ?auto_235241 ?auto_235240 ) ( not ( = ?auto_235239 ?auto_235240 ) ) ( not ( = ?auto_235239 ?auto_235241 ) ) ( not ( = ?auto_235239 ?auto_235242 ) ) ( not ( = ?auto_235239 ?auto_235243 ) ) ( not ( = ?auto_235239 ?auto_235244 ) ) ( not ( = ?auto_235239 ?auto_235245 ) ) ( not ( = ?auto_235239 ?auto_235246 ) ) ( not ( = ?auto_235239 ?auto_235247 ) ) ( not ( = ?auto_235239 ?auto_235248 ) ) ( not ( = ?auto_235239 ?auto_235249 ) ) ( not ( = ?auto_235239 ?auto_235250 ) ) ( not ( = ?auto_235240 ?auto_235241 ) ) ( not ( = ?auto_235240 ?auto_235242 ) ) ( not ( = ?auto_235240 ?auto_235243 ) ) ( not ( = ?auto_235240 ?auto_235244 ) ) ( not ( = ?auto_235240 ?auto_235245 ) ) ( not ( = ?auto_235240 ?auto_235246 ) ) ( not ( = ?auto_235240 ?auto_235247 ) ) ( not ( = ?auto_235240 ?auto_235248 ) ) ( not ( = ?auto_235240 ?auto_235249 ) ) ( not ( = ?auto_235240 ?auto_235250 ) ) ( not ( = ?auto_235241 ?auto_235242 ) ) ( not ( = ?auto_235241 ?auto_235243 ) ) ( not ( = ?auto_235241 ?auto_235244 ) ) ( not ( = ?auto_235241 ?auto_235245 ) ) ( not ( = ?auto_235241 ?auto_235246 ) ) ( not ( = ?auto_235241 ?auto_235247 ) ) ( not ( = ?auto_235241 ?auto_235248 ) ) ( not ( = ?auto_235241 ?auto_235249 ) ) ( not ( = ?auto_235241 ?auto_235250 ) ) ( not ( = ?auto_235242 ?auto_235243 ) ) ( not ( = ?auto_235242 ?auto_235244 ) ) ( not ( = ?auto_235242 ?auto_235245 ) ) ( not ( = ?auto_235242 ?auto_235246 ) ) ( not ( = ?auto_235242 ?auto_235247 ) ) ( not ( = ?auto_235242 ?auto_235248 ) ) ( not ( = ?auto_235242 ?auto_235249 ) ) ( not ( = ?auto_235242 ?auto_235250 ) ) ( not ( = ?auto_235243 ?auto_235244 ) ) ( not ( = ?auto_235243 ?auto_235245 ) ) ( not ( = ?auto_235243 ?auto_235246 ) ) ( not ( = ?auto_235243 ?auto_235247 ) ) ( not ( = ?auto_235243 ?auto_235248 ) ) ( not ( = ?auto_235243 ?auto_235249 ) ) ( not ( = ?auto_235243 ?auto_235250 ) ) ( not ( = ?auto_235244 ?auto_235245 ) ) ( not ( = ?auto_235244 ?auto_235246 ) ) ( not ( = ?auto_235244 ?auto_235247 ) ) ( not ( = ?auto_235244 ?auto_235248 ) ) ( not ( = ?auto_235244 ?auto_235249 ) ) ( not ( = ?auto_235244 ?auto_235250 ) ) ( not ( = ?auto_235245 ?auto_235246 ) ) ( not ( = ?auto_235245 ?auto_235247 ) ) ( not ( = ?auto_235245 ?auto_235248 ) ) ( not ( = ?auto_235245 ?auto_235249 ) ) ( not ( = ?auto_235245 ?auto_235250 ) ) ( not ( = ?auto_235246 ?auto_235247 ) ) ( not ( = ?auto_235246 ?auto_235248 ) ) ( not ( = ?auto_235246 ?auto_235249 ) ) ( not ( = ?auto_235246 ?auto_235250 ) ) ( not ( = ?auto_235247 ?auto_235248 ) ) ( not ( = ?auto_235247 ?auto_235249 ) ) ( not ( = ?auto_235247 ?auto_235250 ) ) ( not ( = ?auto_235248 ?auto_235249 ) ) ( not ( = ?auto_235248 ?auto_235250 ) ) ( not ( = ?auto_235249 ?auto_235250 ) ) ( ON ?auto_235248 ?auto_235249 ) ( ON ?auto_235247 ?auto_235248 ) ( ON ?auto_235246 ?auto_235247 ) ( ON ?auto_235245 ?auto_235246 ) ( ON ?auto_235244 ?auto_235245 ) ( ON ?auto_235243 ?auto_235244 ) ( CLEAR ?auto_235241 ) ( ON ?auto_235242 ?auto_235243 ) ( CLEAR ?auto_235242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_235239 ?auto_235240 ?auto_235241 ?auto_235242 )
      ( MAKE-11PILE ?auto_235239 ?auto_235240 ?auto_235241 ?auto_235242 ?auto_235243 ?auto_235244 ?auto_235245 ?auto_235246 ?auto_235247 ?auto_235248 ?auto_235249 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235285 - BLOCK
      ?auto_235286 - BLOCK
      ?auto_235287 - BLOCK
      ?auto_235288 - BLOCK
      ?auto_235289 - BLOCK
      ?auto_235290 - BLOCK
      ?auto_235291 - BLOCK
      ?auto_235292 - BLOCK
      ?auto_235293 - BLOCK
      ?auto_235294 - BLOCK
      ?auto_235295 - BLOCK
    )
    :vars
    (
      ?auto_235296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235295 ?auto_235296 ) ( ON-TABLE ?auto_235285 ) ( ON ?auto_235286 ?auto_235285 ) ( not ( = ?auto_235285 ?auto_235286 ) ) ( not ( = ?auto_235285 ?auto_235287 ) ) ( not ( = ?auto_235285 ?auto_235288 ) ) ( not ( = ?auto_235285 ?auto_235289 ) ) ( not ( = ?auto_235285 ?auto_235290 ) ) ( not ( = ?auto_235285 ?auto_235291 ) ) ( not ( = ?auto_235285 ?auto_235292 ) ) ( not ( = ?auto_235285 ?auto_235293 ) ) ( not ( = ?auto_235285 ?auto_235294 ) ) ( not ( = ?auto_235285 ?auto_235295 ) ) ( not ( = ?auto_235285 ?auto_235296 ) ) ( not ( = ?auto_235286 ?auto_235287 ) ) ( not ( = ?auto_235286 ?auto_235288 ) ) ( not ( = ?auto_235286 ?auto_235289 ) ) ( not ( = ?auto_235286 ?auto_235290 ) ) ( not ( = ?auto_235286 ?auto_235291 ) ) ( not ( = ?auto_235286 ?auto_235292 ) ) ( not ( = ?auto_235286 ?auto_235293 ) ) ( not ( = ?auto_235286 ?auto_235294 ) ) ( not ( = ?auto_235286 ?auto_235295 ) ) ( not ( = ?auto_235286 ?auto_235296 ) ) ( not ( = ?auto_235287 ?auto_235288 ) ) ( not ( = ?auto_235287 ?auto_235289 ) ) ( not ( = ?auto_235287 ?auto_235290 ) ) ( not ( = ?auto_235287 ?auto_235291 ) ) ( not ( = ?auto_235287 ?auto_235292 ) ) ( not ( = ?auto_235287 ?auto_235293 ) ) ( not ( = ?auto_235287 ?auto_235294 ) ) ( not ( = ?auto_235287 ?auto_235295 ) ) ( not ( = ?auto_235287 ?auto_235296 ) ) ( not ( = ?auto_235288 ?auto_235289 ) ) ( not ( = ?auto_235288 ?auto_235290 ) ) ( not ( = ?auto_235288 ?auto_235291 ) ) ( not ( = ?auto_235288 ?auto_235292 ) ) ( not ( = ?auto_235288 ?auto_235293 ) ) ( not ( = ?auto_235288 ?auto_235294 ) ) ( not ( = ?auto_235288 ?auto_235295 ) ) ( not ( = ?auto_235288 ?auto_235296 ) ) ( not ( = ?auto_235289 ?auto_235290 ) ) ( not ( = ?auto_235289 ?auto_235291 ) ) ( not ( = ?auto_235289 ?auto_235292 ) ) ( not ( = ?auto_235289 ?auto_235293 ) ) ( not ( = ?auto_235289 ?auto_235294 ) ) ( not ( = ?auto_235289 ?auto_235295 ) ) ( not ( = ?auto_235289 ?auto_235296 ) ) ( not ( = ?auto_235290 ?auto_235291 ) ) ( not ( = ?auto_235290 ?auto_235292 ) ) ( not ( = ?auto_235290 ?auto_235293 ) ) ( not ( = ?auto_235290 ?auto_235294 ) ) ( not ( = ?auto_235290 ?auto_235295 ) ) ( not ( = ?auto_235290 ?auto_235296 ) ) ( not ( = ?auto_235291 ?auto_235292 ) ) ( not ( = ?auto_235291 ?auto_235293 ) ) ( not ( = ?auto_235291 ?auto_235294 ) ) ( not ( = ?auto_235291 ?auto_235295 ) ) ( not ( = ?auto_235291 ?auto_235296 ) ) ( not ( = ?auto_235292 ?auto_235293 ) ) ( not ( = ?auto_235292 ?auto_235294 ) ) ( not ( = ?auto_235292 ?auto_235295 ) ) ( not ( = ?auto_235292 ?auto_235296 ) ) ( not ( = ?auto_235293 ?auto_235294 ) ) ( not ( = ?auto_235293 ?auto_235295 ) ) ( not ( = ?auto_235293 ?auto_235296 ) ) ( not ( = ?auto_235294 ?auto_235295 ) ) ( not ( = ?auto_235294 ?auto_235296 ) ) ( not ( = ?auto_235295 ?auto_235296 ) ) ( ON ?auto_235294 ?auto_235295 ) ( ON ?auto_235293 ?auto_235294 ) ( ON ?auto_235292 ?auto_235293 ) ( ON ?auto_235291 ?auto_235292 ) ( ON ?auto_235290 ?auto_235291 ) ( ON ?auto_235289 ?auto_235290 ) ( ON ?auto_235288 ?auto_235289 ) ( CLEAR ?auto_235286 ) ( ON ?auto_235287 ?auto_235288 ) ( CLEAR ?auto_235287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_235285 ?auto_235286 ?auto_235287 )
      ( MAKE-11PILE ?auto_235285 ?auto_235286 ?auto_235287 ?auto_235288 ?auto_235289 ?auto_235290 ?auto_235291 ?auto_235292 ?auto_235293 ?auto_235294 ?auto_235295 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235331 - BLOCK
      ?auto_235332 - BLOCK
      ?auto_235333 - BLOCK
      ?auto_235334 - BLOCK
      ?auto_235335 - BLOCK
      ?auto_235336 - BLOCK
      ?auto_235337 - BLOCK
      ?auto_235338 - BLOCK
      ?auto_235339 - BLOCK
      ?auto_235340 - BLOCK
      ?auto_235341 - BLOCK
    )
    :vars
    (
      ?auto_235342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235341 ?auto_235342 ) ( ON-TABLE ?auto_235331 ) ( not ( = ?auto_235331 ?auto_235332 ) ) ( not ( = ?auto_235331 ?auto_235333 ) ) ( not ( = ?auto_235331 ?auto_235334 ) ) ( not ( = ?auto_235331 ?auto_235335 ) ) ( not ( = ?auto_235331 ?auto_235336 ) ) ( not ( = ?auto_235331 ?auto_235337 ) ) ( not ( = ?auto_235331 ?auto_235338 ) ) ( not ( = ?auto_235331 ?auto_235339 ) ) ( not ( = ?auto_235331 ?auto_235340 ) ) ( not ( = ?auto_235331 ?auto_235341 ) ) ( not ( = ?auto_235331 ?auto_235342 ) ) ( not ( = ?auto_235332 ?auto_235333 ) ) ( not ( = ?auto_235332 ?auto_235334 ) ) ( not ( = ?auto_235332 ?auto_235335 ) ) ( not ( = ?auto_235332 ?auto_235336 ) ) ( not ( = ?auto_235332 ?auto_235337 ) ) ( not ( = ?auto_235332 ?auto_235338 ) ) ( not ( = ?auto_235332 ?auto_235339 ) ) ( not ( = ?auto_235332 ?auto_235340 ) ) ( not ( = ?auto_235332 ?auto_235341 ) ) ( not ( = ?auto_235332 ?auto_235342 ) ) ( not ( = ?auto_235333 ?auto_235334 ) ) ( not ( = ?auto_235333 ?auto_235335 ) ) ( not ( = ?auto_235333 ?auto_235336 ) ) ( not ( = ?auto_235333 ?auto_235337 ) ) ( not ( = ?auto_235333 ?auto_235338 ) ) ( not ( = ?auto_235333 ?auto_235339 ) ) ( not ( = ?auto_235333 ?auto_235340 ) ) ( not ( = ?auto_235333 ?auto_235341 ) ) ( not ( = ?auto_235333 ?auto_235342 ) ) ( not ( = ?auto_235334 ?auto_235335 ) ) ( not ( = ?auto_235334 ?auto_235336 ) ) ( not ( = ?auto_235334 ?auto_235337 ) ) ( not ( = ?auto_235334 ?auto_235338 ) ) ( not ( = ?auto_235334 ?auto_235339 ) ) ( not ( = ?auto_235334 ?auto_235340 ) ) ( not ( = ?auto_235334 ?auto_235341 ) ) ( not ( = ?auto_235334 ?auto_235342 ) ) ( not ( = ?auto_235335 ?auto_235336 ) ) ( not ( = ?auto_235335 ?auto_235337 ) ) ( not ( = ?auto_235335 ?auto_235338 ) ) ( not ( = ?auto_235335 ?auto_235339 ) ) ( not ( = ?auto_235335 ?auto_235340 ) ) ( not ( = ?auto_235335 ?auto_235341 ) ) ( not ( = ?auto_235335 ?auto_235342 ) ) ( not ( = ?auto_235336 ?auto_235337 ) ) ( not ( = ?auto_235336 ?auto_235338 ) ) ( not ( = ?auto_235336 ?auto_235339 ) ) ( not ( = ?auto_235336 ?auto_235340 ) ) ( not ( = ?auto_235336 ?auto_235341 ) ) ( not ( = ?auto_235336 ?auto_235342 ) ) ( not ( = ?auto_235337 ?auto_235338 ) ) ( not ( = ?auto_235337 ?auto_235339 ) ) ( not ( = ?auto_235337 ?auto_235340 ) ) ( not ( = ?auto_235337 ?auto_235341 ) ) ( not ( = ?auto_235337 ?auto_235342 ) ) ( not ( = ?auto_235338 ?auto_235339 ) ) ( not ( = ?auto_235338 ?auto_235340 ) ) ( not ( = ?auto_235338 ?auto_235341 ) ) ( not ( = ?auto_235338 ?auto_235342 ) ) ( not ( = ?auto_235339 ?auto_235340 ) ) ( not ( = ?auto_235339 ?auto_235341 ) ) ( not ( = ?auto_235339 ?auto_235342 ) ) ( not ( = ?auto_235340 ?auto_235341 ) ) ( not ( = ?auto_235340 ?auto_235342 ) ) ( not ( = ?auto_235341 ?auto_235342 ) ) ( ON ?auto_235340 ?auto_235341 ) ( ON ?auto_235339 ?auto_235340 ) ( ON ?auto_235338 ?auto_235339 ) ( ON ?auto_235337 ?auto_235338 ) ( ON ?auto_235336 ?auto_235337 ) ( ON ?auto_235335 ?auto_235336 ) ( ON ?auto_235334 ?auto_235335 ) ( ON ?auto_235333 ?auto_235334 ) ( CLEAR ?auto_235331 ) ( ON ?auto_235332 ?auto_235333 ) ( CLEAR ?auto_235332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_235331 ?auto_235332 )
      ( MAKE-11PILE ?auto_235331 ?auto_235332 ?auto_235333 ?auto_235334 ?auto_235335 ?auto_235336 ?auto_235337 ?auto_235338 ?auto_235339 ?auto_235340 ?auto_235341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_235377 - BLOCK
      ?auto_235378 - BLOCK
      ?auto_235379 - BLOCK
      ?auto_235380 - BLOCK
      ?auto_235381 - BLOCK
      ?auto_235382 - BLOCK
      ?auto_235383 - BLOCK
      ?auto_235384 - BLOCK
      ?auto_235385 - BLOCK
      ?auto_235386 - BLOCK
      ?auto_235387 - BLOCK
    )
    :vars
    (
      ?auto_235388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235387 ?auto_235388 ) ( not ( = ?auto_235377 ?auto_235378 ) ) ( not ( = ?auto_235377 ?auto_235379 ) ) ( not ( = ?auto_235377 ?auto_235380 ) ) ( not ( = ?auto_235377 ?auto_235381 ) ) ( not ( = ?auto_235377 ?auto_235382 ) ) ( not ( = ?auto_235377 ?auto_235383 ) ) ( not ( = ?auto_235377 ?auto_235384 ) ) ( not ( = ?auto_235377 ?auto_235385 ) ) ( not ( = ?auto_235377 ?auto_235386 ) ) ( not ( = ?auto_235377 ?auto_235387 ) ) ( not ( = ?auto_235377 ?auto_235388 ) ) ( not ( = ?auto_235378 ?auto_235379 ) ) ( not ( = ?auto_235378 ?auto_235380 ) ) ( not ( = ?auto_235378 ?auto_235381 ) ) ( not ( = ?auto_235378 ?auto_235382 ) ) ( not ( = ?auto_235378 ?auto_235383 ) ) ( not ( = ?auto_235378 ?auto_235384 ) ) ( not ( = ?auto_235378 ?auto_235385 ) ) ( not ( = ?auto_235378 ?auto_235386 ) ) ( not ( = ?auto_235378 ?auto_235387 ) ) ( not ( = ?auto_235378 ?auto_235388 ) ) ( not ( = ?auto_235379 ?auto_235380 ) ) ( not ( = ?auto_235379 ?auto_235381 ) ) ( not ( = ?auto_235379 ?auto_235382 ) ) ( not ( = ?auto_235379 ?auto_235383 ) ) ( not ( = ?auto_235379 ?auto_235384 ) ) ( not ( = ?auto_235379 ?auto_235385 ) ) ( not ( = ?auto_235379 ?auto_235386 ) ) ( not ( = ?auto_235379 ?auto_235387 ) ) ( not ( = ?auto_235379 ?auto_235388 ) ) ( not ( = ?auto_235380 ?auto_235381 ) ) ( not ( = ?auto_235380 ?auto_235382 ) ) ( not ( = ?auto_235380 ?auto_235383 ) ) ( not ( = ?auto_235380 ?auto_235384 ) ) ( not ( = ?auto_235380 ?auto_235385 ) ) ( not ( = ?auto_235380 ?auto_235386 ) ) ( not ( = ?auto_235380 ?auto_235387 ) ) ( not ( = ?auto_235380 ?auto_235388 ) ) ( not ( = ?auto_235381 ?auto_235382 ) ) ( not ( = ?auto_235381 ?auto_235383 ) ) ( not ( = ?auto_235381 ?auto_235384 ) ) ( not ( = ?auto_235381 ?auto_235385 ) ) ( not ( = ?auto_235381 ?auto_235386 ) ) ( not ( = ?auto_235381 ?auto_235387 ) ) ( not ( = ?auto_235381 ?auto_235388 ) ) ( not ( = ?auto_235382 ?auto_235383 ) ) ( not ( = ?auto_235382 ?auto_235384 ) ) ( not ( = ?auto_235382 ?auto_235385 ) ) ( not ( = ?auto_235382 ?auto_235386 ) ) ( not ( = ?auto_235382 ?auto_235387 ) ) ( not ( = ?auto_235382 ?auto_235388 ) ) ( not ( = ?auto_235383 ?auto_235384 ) ) ( not ( = ?auto_235383 ?auto_235385 ) ) ( not ( = ?auto_235383 ?auto_235386 ) ) ( not ( = ?auto_235383 ?auto_235387 ) ) ( not ( = ?auto_235383 ?auto_235388 ) ) ( not ( = ?auto_235384 ?auto_235385 ) ) ( not ( = ?auto_235384 ?auto_235386 ) ) ( not ( = ?auto_235384 ?auto_235387 ) ) ( not ( = ?auto_235384 ?auto_235388 ) ) ( not ( = ?auto_235385 ?auto_235386 ) ) ( not ( = ?auto_235385 ?auto_235387 ) ) ( not ( = ?auto_235385 ?auto_235388 ) ) ( not ( = ?auto_235386 ?auto_235387 ) ) ( not ( = ?auto_235386 ?auto_235388 ) ) ( not ( = ?auto_235387 ?auto_235388 ) ) ( ON ?auto_235386 ?auto_235387 ) ( ON ?auto_235385 ?auto_235386 ) ( ON ?auto_235384 ?auto_235385 ) ( ON ?auto_235383 ?auto_235384 ) ( ON ?auto_235382 ?auto_235383 ) ( ON ?auto_235381 ?auto_235382 ) ( ON ?auto_235380 ?auto_235381 ) ( ON ?auto_235379 ?auto_235380 ) ( ON ?auto_235378 ?auto_235379 ) ( ON ?auto_235377 ?auto_235378 ) ( CLEAR ?auto_235377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_235377 )
      ( MAKE-11PILE ?auto_235377 ?auto_235378 ?auto_235379 ?auto_235380 ?auto_235381 ?auto_235382 ?auto_235383 ?auto_235384 ?auto_235385 ?auto_235386 ?auto_235387 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235424 - BLOCK
      ?auto_235425 - BLOCK
      ?auto_235426 - BLOCK
      ?auto_235427 - BLOCK
      ?auto_235428 - BLOCK
      ?auto_235429 - BLOCK
      ?auto_235430 - BLOCK
      ?auto_235431 - BLOCK
      ?auto_235432 - BLOCK
      ?auto_235433 - BLOCK
      ?auto_235434 - BLOCK
      ?auto_235435 - BLOCK
    )
    :vars
    (
      ?auto_235436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_235434 ) ( ON ?auto_235435 ?auto_235436 ) ( CLEAR ?auto_235435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_235424 ) ( ON ?auto_235425 ?auto_235424 ) ( ON ?auto_235426 ?auto_235425 ) ( ON ?auto_235427 ?auto_235426 ) ( ON ?auto_235428 ?auto_235427 ) ( ON ?auto_235429 ?auto_235428 ) ( ON ?auto_235430 ?auto_235429 ) ( ON ?auto_235431 ?auto_235430 ) ( ON ?auto_235432 ?auto_235431 ) ( ON ?auto_235433 ?auto_235432 ) ( ON ?auto_235434 ?auto_235433 ) ( not ( = ?auto_235424 ?auto_235425 ) ) ( not ( = ?auto_235424 ?auto_235426 ) ) ( not ( = ?auto_235424 ?auto_235427 ) ) ( not ( = ?auto_235424 ?auto_235428 ) ) ( not ( = ?auto_235424 ?auto_235429 ) ) ( not ( = ?auto_235424 ?auto_235430 ) ) ( not ( = ?auto_235424 ?auto_235431 ) ) ( not ( = ?auto_235424 ?auto_235432 ) ) ( not ( = ?auto_235424 ?auto_235433 ) ) ( not ( = ?auto_235424 ?auto_235434 ) ) ( not ( = ?auto_235424 ?auto_235435 ) ) ( not ( = ?auto_235424 ?auto_235436 ) ) ( not ( = ?auto_235425 ?auto_235426 ) ) ( not ( = ?auto_235425 ?auto_235427 ) ) ( not ( = ?auto_235425 ?auto_235428 ) ) ( not ( = ?auto_235425 ?auto_235429 ) ) ( not ( = ?auto_235425 ?auto_235430 ) ) ( not ( = ?auto_235425 ?auto_235431 ) ) ( not ( = ?auto_235425 ?auto_235432 ) ) ( not ( = ?auto_235425 ?auto_235433 ) ) ( not ( = ?auto_235425 ?auto_235434 ) ) ( not ( = ?auto_235425 ?auto_235435 ) ) ( not ( = ?auto_235425 ?auto_235436 ) ) ( not ( = ?auto_235426 ?auto_235427 ) ) ( not ( = ?auto_235426 ?auto_235428 ) ) ( not ( = ?auto_235426 ?auto_235429 ) ) ( not ( = ?auto_235426 ?auto_235430 ) ) ( not ( = ?auto_235426 ?auto_235431 ) ) ( not ( = ?auto_235426 ?auto_235432 ) ) ( not ( = ?auto_235426 ?auto_235433 ) ) ( not ( = ?auto_235426 ?auto_235434 ) ) ( not ( = ?auto_235426 ?auto_235435 ) ) ( not ( = ?auto_235426 ?auto_235436 ) ) ( not ( = ?auto_235427 ?auto_235428 ) ) ( not ( = ?auto_235427 ?auto_235429 ) ) ( not ( = ?auto_235427 ?auto_235430 ) ) ( not ( = ?auto_235427 ?auto_235431 ) ) ( not ( = ?auto_235427 ?auto_235432 ) ) ( not ( = ?auto_235427 ?auto_235433 ) ) ( not ( = ?auto_235427 ?auto_235434 ) ) ( not ( = ?auto_235427 ?auto_235435 ) ) ( not ( = ?auto_235427 ?auto_235436 ) ) ( not ( = ?auto_235428 ?auto_235429 ) ) ( not ( = ?auto_235428 ?auto_235430 ) ) ( not ( = ?auto_235428 ?auto_235431 ) ) ( not ( = ?auto_235428 ?auto_235432 ) ) ( not ( = ?auto_235428 ?auto_235433 ) ) ( not ( = ?auto_235428 ?auto_235434 ) ) ( not ( = ?auto_235428 ?auto_235435 ) ) ( not ( = ?auto_235428 ?auto_235436 ) ) ( not ( = ?auto_235429 ?auto_235430 ) ) ( not ( = ?auto_235429 ?auto_235431 ) ) ( not ( = ?auto_235429 ?auto_235432 ) ) ( not ( = ?auto_235429 ?auto_235433 ) ) ( not ( = ?auto_235429 ?auto_235434 ) ) ( not ( = ?auto_235429 ?auto_235435 ) ) ( not ( = ?auto_235429 ?auto_235436 ) ) ( not ( = ?auto_235430 ?auto_235431 ) ) ( not ( = ?auto_235430 ?auto_235432 ) ) ( not ( = ?auto_235430 ?auto_235433 ) ) ( not ( = ?auto_235430 ?auto_235434 ) ) ( not ( = ?auto_235430 ?auto_235435 ) ) ( not ( = ?auto_235430 ?auto_235436 ) ) ( not ( = ?auto_235431 ?auto_235432 ) ) ( not ( = ?auto_235431 ?auto_235433 ) ) ( not ( = ?auto_235431 ?auto_235434 ) ) ( not ( = ?auto_235431 ?auto_235435 ) ) ( not ( = ?auto_235431 ?auto_235436 ) ) ( not ( = ?auto_235432 ?auto_235433 ) ) ( not ( = ?auto_235432 ?auto_235434 ) ) ( not ( = ?auto_235432 ?auto_235435 ) ) ( not ( = ?auto_235432 ?auto_235436 ) ) ( not ( = ?auto_235433 ?auto_235434 ) ) ( not ( = ?auto_235433 ?auto_235435 ) ) ( not ( = ?auto_235433 ?auto_235436 ) ) ( not ( = ?auto_235434 ?auto_235435 ) ) ( not ( = ?auto_235434 ?auto_235436 ) ) ( not ( = ?auto_235435 ?auto_235436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_235435 ?auto_235436 )
      ( !STACK ?auto_235435 ?auto_235434 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235474 - BLOCK
      ?auto_235475 - BLOCK
      ?auto_235476 - BLOCK
      ?auto_235477 - BLOCK
      ?auto_235478 - BLOCK
      ?auto_235479 - BLOCK
      ?auto_235480 - BLOCK
      ?auto_235481 - BLOCK
      ?auto_235482 - BLOCK
      ?auto_235483 - BLOCK
      ?auto_235484 - BLOCK
      ?auto_235485 - BLOCK
    )
    :vars
    (
      ?auto_235486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235485 ?auto_235486 ) ( ON-TABLE ?auto_235474 ) ( ON ?auto_235475 ?auto_235474 ) ( ON ?auto_235476 ?auto_235475 ) ( ON ?auto_235477 ?auto_235476 ) ( ON ?auto_235478 ?auto_235477 ) ( ON ?auto_235479 ?auto_235478 ) ( ON ?auto_235480 ?auto_235479 ) ( ON ?auto_235481 ?auto_235480 ) ( ON ?auto_235482 ?auto_235481 ) ( ON ?auto_235483 ?auto_235482 ) ( not ( = ?auto_235474 ?auto_235475 ) ) ( not ( = ?auto_235474 ?auto_235476 ) ) ( not ( = ?auto_235474 ?auto_235477 ) ) ( not ( = ?auto_235474 ?auto_235478 ) ) ( not ( = ?auto_235474 ?auto_235479 ) ) ( not ( = ?auto_235474 ?auto_235480 ) ) ( not ( = ?auto_235474 ?auto_235481 ) ) ( not ( = ?auto_235474 ?auto_235482 ) ) ( not ( = ?auto_235474 ?auto_235483 ) ) ( not ( = ?auto_235474 ?auto_235484 ) ) ( not ( = ?auto_235474 ?auto_235485 ) ) ( not ( = ?auto_235474 ?auto_235486 ) ) ( not ( = ?auto_235475 ?auto_235476 ) ) ( not ( = ?auto_235475 ?auto_235477 ) ) ( not ( = ?auto_235475 ?auto_235478 ) ) ( not ( = ?auto_235475 ?auto_235479 ) ) ( not ( = ?auto_235475 ?auto_235480 ) ) ( not ( = ?auto_235475 ?auto_235481 ) ) ( not ( = ?auto_235475 ?auto_235482 ) ) ( not ( = ?auto_235475 ?auto_235483 ) ) ( not ( = ?auto_235475 ?auto_235484 ) ) ( not ( = ?auto_235475 ?auto_235485 ) ) ( not ( = ?auto_235475 ?auto_235486 ) ) ( not ( = ?auto_235476 ?auto_235477 ) ) ( not ( = ?auto_235476 ?auto_235478 ) ) ( not ( = ?auto_235476 ?auto_235479 ) ) ( not ( = ?auto_235476 ?auto_235480 ) ) ( not ( = ?auto_235476 ?auto_235481 ) ) ( not ( = ?auto_235476 ?auto_235482 ) ) ( not ( = ?auto_235476 ?auto_235483 ) ) ( not ( = ?auto_235476 ?auto_235484 ) ) ( not ( = ?auto_235476 ?auto_235485 ) ) ( not ( = ?auto_235476 ?auto_235486 ) ) ( not ( = ?auto_235477 ?auto_235478 ) ) ( not ( = ?auto_235477 ?auto_235479 ) ) ( not ( = ?auto_235477 ?auto_235480 ) ) ( not ( = ?auto_235477 ?auto_235481 ) ) ( not ( = ?auto_235477 ?auto_235482 ) ) ( not ( = ?auto_235477 ?auto_235483 ) ) ( not ( = ?auto_235477 ?auto_235484 ) ) ( not ( = ?auto_235477 ?auto_235485 ) ) ( not ( = ?auto_235477 ?auto_235486 ) ) ( not ( = ?auto_235478 ?auto_235479 ) ) ( not ( = ?auto_235478 ?auto_235480 ) ) ( not ( = ?auto_235478 ?auto_235481 ) ) ( not ( = ?auto_235478 ?auto_235482 ) ) ( not ( = ?auto_235478 ?auto_235483 ) ) ( not ( = ?auto_235478 ?auto_235484 ) ) ( not ( = ?auto_235478 ?auto_235485 ) ) ( not ( = ?auto_235478 ?auto_235486 ) ) ( not ( = ?auto_235479 ?auto_235480 ) ) ( not ( = ?auto_235479 ?auto_235481 ) ) ( not ( = ?auto_235479 ?auto_235482 ) ) ( not ( = ?auto_235479 ?auto_235483 ) ) ( not ( = ?auto_235479 ?auto_235484 ) ) ( not ( = ?auto_235479 ?auto_235485 ) ) ( not ( = ?auto_235479 ?auto_235486 ) ) ( not ( = ?auto_235480 ?auto_235481 ) ) ( not ( = ?auto_235480 ?auto_235482 ) ) ( not ( = ?auto_235480 ?auto_235483 ) ) ( not ( = ?auto_235480 ?auto_235484 ) ) ( not ( = ?auto_235480 ?auto_235485 ) ) ( not ( = ?auto_235480 ?auto_235486 ) ) ( not ( = ?auto_235481 ?auto_235482 ) ) ( not ( = ?auto_235481 ?auto_235483 ) ) ( not ( = ?auto_235481 ?auto_235484 ) ) ( not ( = ?auto_235481 ?auto_235485 ) ) ( not ( = ?auto_235481 ?auto_235486 ) ) ( not ( = ?auto_235482 ?auto_235483 ) ) ( not ( = ?auto_235482 ?auto_235484 ) ) ( not ( = ?auto_235482 ?auto_235485 ) ) ( not ( = ?auto_235482 ?auto_235486 ) ) ( not ( = ?auto_235483 ?auto_235484 ) ) ( not ( = ?auto_235483 ?auto_235485 ) ) ( not ( = ?auto_235483 ?auto_235486 ) ) ( not ( = ?auto_235484 ?auto_235485 ) ) ( not ( = ?auto_235484 ?auto_235486 ) ) ( not ( = ?auto_235485 ?auto_235486 ) ) ( CLEAR ?auto_235483 ) ( ON ?auto_235484 ?auto_235485 ) ( CLEAR ?auto_235484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_235474 ?auto_235475 ?auto_235476 ?auto_235477 ?auto_235478 ?auto_235479 ?auto_235480 ?auto_235481 ?auto_235482 ?auto_235483 ?auto_235484 )
      ( MAKE-12PILE ?auto_235474 ?auto_235475 ?auto_235476 ?auto_235477 ?auto_235478 ?auto_235479 ?auto_235480 ?auto_235481 ?auto_235482 ?auto_235483 ?auto_235484 ?auto_235485 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235524 - BLOCK
      ?auto_235525 - BLOCK
      ?auto_235526 - BLOCK
      ?auto_235527 - BLOCK
      ?auto_235528 - BLOCK
      ?auto_235529 - BLOCK
      ?auto_235530 - BLOCK
      ?auto_235531 - BLOCK
      ?auto_235532 - BLOCK
      ?auto_235533 - BLOCK
      ?auto_235534 - BLOCK
      ?auto_235535 - BLOCK
    )
    :vars
    (
      ?auto_235536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235535 ?auto_235536 ) ( ON-TABLE ?auto_235524 ) ( ON ?auto_235525 ?auto_235524 ) ( ON ?auto_235526 ?auto_235525 ) ( ON ?auto_235527 ?auto_235526 ) ( ON ?auto_235528 ?auto_235527 ) ( ON ?auto_235529 ?auto_235528 ) ( ON ?auto_235530 ?auto_235529 ) ( ON ?auto_235531 ?auto_235530 ) ( ON ?auto_235532 ?auto_235531 ) ( not ( = ?auto_235524 ?auto_235525 ) ) ( not ( = ?auto_235524 ?auto_235526 ) ) ( not ( = ?auto_235524 ?auto_235527 ) ) ( not ( = ?auto_235524 ?auto_235528 ) ) ( not ( = ?auto_235524 ?auto_235529 ) ) ( not ( = ?auto_235524 ?auto_235530 ) ) ( not ( = ?auto_235524 ?auto_235531 ) ) ( not ( = ?auto_235524 ?auto_235532 ) ) ( not ( = ?auto_235524 ?auto_235533 ) ) ( not ( = ?auto_235524 ?auto_235534 ) ) ( not ( = ?auto_235524 ?auto_235535 ) ) ( not ( = ?auto_235524 ?auto_235536 ) ) ( not ( = ?auto_235525 ?auto_235526 ) ) ( not ( = ?auto_235525 ?auto_235527 ) ) ( not ( = ?auto_235525 ?auto_235528 ) ) ( not ( = ?auto_235525 ?auto_235529 ) ) ( not ( = ?auto_235525 ?auto_235530 ) ) ( not ( = ?auto_235525 ?auto_235531 ) ) ( not ( = ?auto_235525 ?auto_235532 ) ) ( not ( = ?auto_235525 ?auto_235533 ) ) ( not ( = ?auto_235525 ?auto_235534 ) ) ( not ( = ?auto_235525 ?auto_235535 ) ) ( not ( = ?auto_235525 ?auto_235536 ) ) ( not ( = ?auto_235526 ?auto_235527 ) ) ( not ( = ?auto_235526 ?auto_235528 ) ) ( not ( = ?auto_235526 ?auto_235529 ) ) ( not ( = ?auto_235526 ?auto_235530 ) ) ( not ( = ?auto_235526 ?auto_235531 ) ) ( not ( = ?auto_235526 ?auto_235532 ) ) ( not ( = ?auto_235526 ?auto_235533 ) ) ( not ( = ?auto_235526 ?auto_235534 ) ) ( not ( = ?auto_235526 ?auto_235535 ) ) ( not ( = ?auto_235526 ?auto_235536 ) ) ( not ( = ?auto_235527 ?auto_235528 ) ) ( not ( = ?auto_235527 ?auto_235529 ) ) ( not ( = ?auto_235527 ?auto_235530 ) ) ( not ( = ?auto_235527 ?auto_235531 ) ) ( not ( = ?auto_235527 ?auto_235532 ) ) ( not ( = ?auto_235527 ?auto_235533 ) ) ( not ( = ?auto_235527 ?auto_235534 ) ) ( not ( = ?auto_235527 ?auto_235535 ) ) ( not ( = ?auto_235527 ?auto_235536 ) ) ( not ( = ?auto_235528 ?auto_235529 ) ) ( not ( = ?auto_235528 ?auto_235530 ) ) ( not ( = ?auto_235528 ?auto_235531 ) ) ( not ( = ?auto_235528 ?auto_235532 ) ) ( not ( = ?auto_235528 ?auto_235533 ) ) ( not ( = ?auto_235528 ?auto_235534 ) ) ( not ( = ?auto_235528 ?auto_235535 ) ) ( not ( = ?auto_235528 ?auto_235536 ) ) ( not ( = ?auto_235529 ?auto_235530 ) ) ( not ( = ?auto_235529 ?auto_235531 ) ) ( not ( = ?auto_235529 ?auto_235532 ) ) ( not ( = ?auto_235529 ?auto_235533 ) ) ( not ( = ?auto_235529 ?auto_235534 ) ) ( not ( = ?auto_235529 ?auto_235535 ) ) ( not ( = ?auto_235529 ?auto_235536 ) ) ( not ( = ?auto_235530 ?auto_235531 ) ) ( not ( = ?auto_235530 ?auto_235532 ) ) ( not ( = ?auto_235530 ?auto_235533 ) ) ( not ( = ?auto_235530 ?auto_235534 ) ) ( not ( = ?auto_235530 ?auto_235535 ) ) ( not ( = ?auto_235530 ?auto_235536 ) ) ( not ( = ?auto_235531 ?auto_235532 ) ) ( not ( = ?auto_235531 ?auto_235533 ) ) ( not ( = ?auto_235531 ?auto_235534 ) ) ( not ( = ?auto_235531 ?auto_235535 ) ) ( not ( = ?auto_235531 ?auto_235536 ) ) ( not ( = ?auto_235532 ?auto_235533 ) ) ( not ( = ?auto_235532 ?auto_235534 ) ) ( not ( = ?auto_235532 ?auto_235535 ) ) ( not ( = ?auto_235532 ?auto_235536 ) ) ( not ( = ?auto_235533 ?auto_235534 ) ) ( not ( = ?auto_235533 ?auto_235535 ) ) ( not ( = ?auto_235533 ?auto_235536 ) ) ( not ( = ?auto_235534 ?auto_235535 ) ) ( not ( = ?auto_235534 ?auto_235536 ) ) ( not ( = ?auto_235535 ?auto_235536 ) ) ( ON ?auto_235534 ?auto_235535 ) ( CLEAR ?auto_235532 ) ( ON ?auto_235533 ?auto_235534 ) ( CLEAR ?auto_235533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_235524 ?auto_235525 ?auto_235526 ?auto_235527 ?auto_235528 ?auto_235529 ?auto_235530 ?auto_235531 ?auto_235532 ?auto_235533 )
      ( MAKE-12PILE ?auto_235524 ?auto_235525 ?auto_235526 ?auto_235527 ?auto_235528 ?auto_235529 ?auto_235530 ?auto_235531 ?auto_235532 ?auto_235533 ?auto_235534 ?auto_235535 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235574 - BLOCK
      ?auto_235575 - BLOCK
      ?auto_235576 - BLOCK
      ?auto_235577 - BLOCK
      ?auto_235578 - BLOCK
      ?auto_235579 - BLOCK
      ?auto_235580 - BLOCK
      ?auto_235581 - BLOCK
      ?auto_235582 - BLOCK
      ?auto_235583 - BLOCK
      ?auto_235584 - BLOCK
      ?auto_235585 - BLOCK
    )
    :vars
    (
      ?auto_235586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235585 ?auto_235586 ) ( ON-TABLE ?auto_235574 ) ( ON ?auto_235575 ?auto_235574 ) ( ON ?auto_235576 ?auto_235575 ) ( ON ?auto_235577 ?auto_235576 ) ( ON ?auto_235578 ?auto_235577 ) ( ON ?auto_235579 ?auto_235578 ) ( ON ?auto_235580 ?auto_235579 ) ( ON ?auto_235581 ?auto_235580 ) ( not ( = ?auto_235574 ?auto_235575 ) ) ( not ( = ?auto_235574 ?auto_235576 ) ) ( not ( = ?auto_235574 ?auto_235577 ) ) ( not ( = ?auto_235574 ?auto_235578 ) ) ( not ( = ?auto_235574 ?auto_235579 ) ) ( not ( = ?auto_235574 ?auto_235580 ) ) ( not ( = ?auto_235574 ?auto_235581 ) ) ( not ( = ?auto_235574 ?auto_235582 ) ) ( not ( = ?auto_235574 ?auto_235583 ) ) ( not ( = ?auto_235574 ?auto_235584 ) ) ( not ( = ?auto_235574 ?auto_235585 ) ) ( not ( = ?auto_235574 ?auto_235586 ) ) ( not ( = ?auto_235575 ?auto_235576 ) ) ( not ( = ?auto_235575 ?auto_235577 ) ) ( not ( = ?auto_235575 ?auto_235578 ) ) ( not ( = ?auto_235575 ?auto_235579 ) ) ( not ( = ?auto_235575 ?auto_235580 ) ) ( not ( = ?auto_235575 ?auto_235581 ) ) ( not ( = ?auto_235575 ?auto_235582 ) ) ( not ( = ?auto_235575 ?auto_235583 ) ) ( not ( = ?auto_235575 ?auto_235584 ) ) ( not ( = ?auto_235575 ?auto_235585 ) ) ( not ( = ?auto_235575 ?auto_235586 ) ) ( not ( = ?auto_235576 ?auto_235577 ) ) ( not ( = ?auto_235576 ?auto_235578 ) ) ( not ( = ?auto_235576 ?auto_235579 ) ) ( not ( = ?auto_235576 ?auto_235580 ) ) ( not ( = ?auto_235576 ?auto_235581 ) ) ( not ( = ?auto_235576 ?auto_235582 ) ) ( not ( = ?auto_235576 ?auto_235583 ) ) ( not ( = ?auto_235576 ?auto_235584 ) ) ( not ( = ?auto_235576 ?auto_235585 ) ) ( not ( = ?auto_235576 ?auto_235586 ) ) ( not ( = ?auto_235577 ?auto_235578 ) ) ( not ( = ?auto_235577 ?auto_235579 ) ) ( not ( = ?auto_235577 ?auto_235580 ) ) ( not ( = ?auto_235577 ?auto_235581 ) ) ( not ( = ?auto_235577 ?auto_235582 ) ) ( not ( = ?auto_235577 ?auto_235583 ) ) ( not ( = ?auto_235577 ?auto_235584 ) ) ( not ( = ?auto_235577 ?auto_235585 ) ) ( not ( = ?auto_235577 ?auto_235586 ) ) ( not ( = ?auto_235578 ?auto_235579 ) ) ( not ( = ?auto_235578 ?auto_235580 ) ) ( not ( = ?auto_235578 ?auto_235581 ) ) ( not ( = ?auto_235578 ?auto_235582 ) ) ( not ( = ?auto_235578 ?auto_235583 ) ) ( not ( = ?auto_235578 ?auto_235584 ) ) ( not ( = ?auto_235578 ?auto_235585 ) ) ( not ( = ?auto_235578 ?auto_235586 ) ) ( not ( = ?auto_235579 ?auto_235580 ) ) ( not ( = ?auto_235579 ?auto_235581 ) ) ( not ( = ?auto_235579 ?auto_235582 ) ) ( not ( = ?auto_235579 ?auto_235583 ) ) ( not ( = ?auto_235579 ?auto_235584 ) ) ( not ( = ?auto_235579 ?auto_235585 ) ) ( not ( = ?auto_235579 ?auto_235586 ) ) ( not ( = ?auto_235580 ?auto_235581 ) ) ( not ( = ?auto_235580 ?auto_235582 ) ) ( not ( = ?auto_235580 ?auto_235583 ) ) ( not ( = ?auto_235580 ?auto_235584 ) ) ( not ( = ?auto_235580 ?auto_235585 ) ) ( not ( = ?auto_235580 ?auto_235586 ) ) ( not ( = ?auto_235581 ?auto_235582 ) ) ( not ( = ?auto_235581 ?auto_235583 ) ) ( not ( = ?auto_235581 ?auto_235584 ) ) ( not ( = ?auto_235581 ?auto_235585 ) ) ( not ( = ?auto_235581 ?auto_235586 ) ) ( not ( = ?auto_235582 ?auto_235583 ) ) ( not ( = ?auto_235582 ?auto_235584 ) ) ( not ( = ?auto_235582 ?auto_235585 ) ) ( not ( = ?auto_235582 ?auto_235586 ) ) ( not ( = ?auto_235583 ?auto_235584 ) ) ( not ( = ?auto_235583 ?auto_235585 ) ) ( not ( = ?auto_235583 ?auto_235586 ) ) ( not ( = ?auto_235584 ?auto_235585 ) ) ( not ( = ?auto_235584 ?auto_235586 ) ) ( not ( = ?auto_235585 ?auto_235586 ) ) ( ON ?auto_235584 ?auto_235585 ) ( ON ?auto_235583 ?auto_235584 ) ( CLEAR ?auto_235581 ) ( ON ?auto_235582 ?auto_235583 ) ( CLEAR ?auto_235582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_235574 ?auto_235575 ?auto_235576 ?auto_235577 ?auto_235578 ?auto_235579 ?auto_235580 ?auto_235581 ?auto_235582 )
      ( MAKE-12PILE ?auto_235574 ?auto_235575 ?auto_235576 ?auto_235577 ?auto_235578 ?auto_235579 ?auto_235580 ?auto_235581 ?auto_235582 ?auto_235583 ?auto_235584 ?auto_235585 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235624 - BLOCK
      ?auto_235625 - BLOCK
      ?auto_235626 - BLOCK
      ?auto_235627 - BLOCK
      ?auto_235628 - BLOCK
      ?auto_235629 - BLOCK
      ?auto_235630 - BLOCK
      ?auto_235631 - BLOCK
      ?auto_235632 - BLOCK
      ?auto_235633 - BLOCK
      ?auto_235634 - BLOCK
      ?auto_235635 - BLOCK
    )
    :vars
    (
      ?auto_235636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235635 ?auto_235636 ) ( ON-TABLE ?auto_235624 ) ( ON ?auto_235625 ?auto_235624 ) ( ON ?auto_235626 ?auto_235625 ) ( ON ?auto_235627 ?auto_235626 ) ( ON ?auto_235628 ?auto_235627 ) ( ON ?auto_235629 ?auto_235628 ) ( ON ?auto_235630 ?auto_235629 ) ( not ( = ?auto_235624 ?auto_235625 ) ) ( not ( = ?auto_235624 ?auto_235626 ) ) ( not ( = ?auto_235624 ?auto_235627 ) ) ( not ( = ?auto_235624 ?auto_235628 ) ) ( not ( = ?auto_235624 ?auto_235629 ) ) ( not ( = ?auto_235624 ?auto_235630 ) ) ( not ( = ?auto_235624 ?auto_235631 ) ) ( not ( = ?auto_235624 ?auto_235632 ) ) ( not ( = ?auto_235624 ?auto_235633 ) ) ( not ( = ?auto_235624 ?auto_235634 ) ) ( not ( = ?auto_235624 ?auto_235635 ) ) ( not ( = ?auto_235624 ?auto_235636 ) ) ( not ( = ?auto_235625 ?auto_235626 ) ) ( not ( = ?auto_235625 ?auto_235627 ) ) ( not ( = ?auto_235625 ?auto_235628 ) ) ( not ( = ?auto_235625 ?auto_235629 ) ) ( not ( = ?auto_235625 ?auto_235630 ) ) ( not ( = ?auto_235625 ?auto_235631 ) ) ( not ( = ?auto_235625 ?auto_235632 ) ) ( not ( = ?auto_235625 ?auto_235633 ) ) ( not ( = ?auto_235625 ?auto_235634 ) ) ( not ( = ?auto_235625 ?auto_235635 ) ) ( not ( = ?auto_235625 ?auto_235636 ) ) ( not ( = ?auto_235626 ?auto_235627 ) ) ( not ( = ?auto_235626 ?auto_235628 ) ) ( not ( = ?auto_235626 ?auto_235629 ) ) ( not ( = ?auto_235626 ?auto_235630 ) ) ( not ( = ?auto_235626 ?auto_235631 ) ) ( not ( = ?auto_235626 ?auto_235632 ) ) ( not ( = ?auto_235626 ?auto_235633 ) ) ( not ( = ?auto_235626 ?auto_235634 ) ) ( not ( = ?auto_235626 ?auto_235635 ) ) ( not ( = ?auto_235626 ?auto_235636 ) ) ( not ( = ?auto_235627 ?auto_235628 ) ) ( not ( = ?auto_235627 ?auto_235629 ) ) ( not ( = ?auto_235627 ?auto_235630 ) ) ( not ( = ?auto_235627 ?auto_235631 ) ) ( not ( = ?auto_235627 ?auto_235632 ) ) ( not ( = ?auto_235627 ?auto_235633 ) ) ( not ( = ?auto_235627 ?auto_235634 ) ) ( not ( = ?auto_235627 ?auto_235635 ) ) ( not ( = ?auto_235627 ?auto_235636 ) ) ( not ( = ?auto_235628 ?auto_235629 ) ) ( not ( = ?auto_235628 ?auto_235630 ) ) ( not ( = ?auto_235628 ?auto_235631 ) ) ( not ( = ?auto_235628 ?auto_235632 ) ) ( not ( = ?auto_235628 ?auto_235633 ) ) ( not ( = ?auto_235628 ?auto_235634 ) ) ( not ( = ?auto_235628 ?auto_235635 ) ) ( not ( = ?auto_235628 ?auto_235636 ) ) ( not ( = ?auto_235629 ?auto_235630 ) ) ( not ( = ?auto_235629 ?auto_235631 ) ) ( not ( = ?auto_235629 ?auto_235632 ) ) ( not ( = ?auto_235629 ?auto_235633 ) ) ( not ( = ?auto_235629 ?auto_235634 ) ) ( not ( = ?auto_235629 ?auto_235635 ) ) ( not ( = ?auto_235629 ?auto_235636 ) ) ( not ( = ?auto_235630 ?auto_235631 ) ) ( not ( = ?auto_235630 ?auto_235632 ) ) ( not ( = ?auto_235630 ?auto_235633 ) ) ( not ( = ?auto_235630 ?auto_235634 ) ) ( not ( = ?auto_235630 ?auto_235635 ) ) ( not ( = ?auto_235630 ?auto_235636 ) ) ( not ( = ?auto_235631 ?auto_235632 ) ) ( not ( = ?auto_235631 ?auto_235633 ) ) ( not ( = ?auto_235631 ?auto_235634 ) ) ( not ( = ?auto_235631 ?auto_235635 ) ) ( not ( = ?auto_235631 ?auto_235636 ) ) ( not ( = ?auto_235632 ?auto_235633 ) ) ( not ( = ?auto_235632 ?auto_235634 ) ) ( not ( = ?auto_235632 ?auto_235635 ) ) ( not ( = ?auto_235632 ?auto_235636 ) ) ( not ( = ?auto_235633 ?auto_235634 ) ) ( not ( = ?auto_235633 ?auto_235635 ) ) ( not ( = ?auto_235633 ?auto_235636 ) ) ( not ( = ?auto_235634 ?auto_235635 ) ) ( not ( = ?auto_235634 ?auto_235636 ) ) ( not ( = ?auto_235635 ?auto_235636 ) ) ( ON ?auto_235634 ?auto_235635 ) ( ON ?auto_235633 ?auto_235634 ) ( ON ?auto_235632 ?auto_235633 ) ( CLEAR ?auto_235630 ) ( ON ?auto_235631 ?auto_235632 ) ( CLEAR ?auto_235631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_235624 ?auto_235625 ?auto_235626 ?auto_235627 ?auto_235628 ?auto_235629 ?auto_235630 ?auto_235631 )
      ( MAKE-12PILE ?auto_235624 ?auto_235625 ?auto_235626 ?auto_235627 ?auto_235628 ?auto_235629 ?auto_235630 ?auto_235631 ?auto_235632 ?auto_235633 ?auto_235634 ?auto_235635 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235674 - BLOCK
      ?auto_235675 - BLOCK
      ?auto_235676 - BLOCK
      ?auto_235677 - BLOCK
      ?auto_235678 - BLOCK
      ?auto_235679 - BLOCK
      ?auto_235680 - BLOCK
      ?auto_235681 - BLOCK
      ?auto_235682 - BLOCK
      ?auto_235683 - BLOCK
      ?auto_235684 - BLOCK
      ?auto_235685 - BLOCK
    )
    :vars
    (
      ?auto_235686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235685 ?auto_235686 ) ( ON-TABLE ?auto_235674 ) ( ON ?auto_235675 ?auto_235674 ) ( ON ?auto_235676 ?auto_235675 ) ( ON ?auto_235677 ?auto_235676 ) ( ON ?auto_235678 ?auto_235677 ) ( ON ?auto_235679 ?auto_235678 ) ( not ( = ?auto_235674 ?auto_235675 ) ) ( not ( = ?auto_235674 ?auto_235676 ) ) ( not ( = ?auto_235674 ?auto_235677 ) ) ( not ( = ?auto_235674 ?auto_235678 ) ) ( not ( = ?auto_235674 ?auto_235679 ) ) ( not ( = ?auto_235674 ?auto_235680 ) ) ( not ( = ?auto_235674 ?auto_235681 ) ) ( not ( = ?auto_235674 ?auto_235682 ) ) ( not ( = ?auto_235674 ?auto_235683 ) ) ( not ( = ?auto_235674 ?auto_235684 ) ) ( not ( = ?auto_235674 ?auto_235685 ) ) ( not ( = ?auto_235674 ?auto_235686 ) ) ( not ( = ?auto_235675 ?auto_235676 ) ) ( not ( = ?auto_235675 ?auto_235677 ) ) ( not ( = ?auto_235675 ?auto_235678 ) ) ( not ( = ?auto_235675 ?auto_235679 ) ) ( not ( = ?auto_235675 ?auto_235680 ) ) ( not ( = ?auto_235675 ?auto_235681 ) ) ( not ( = ?auto_235675 ?auto_235682 ) ) ( not ( = ?auto_235675 ?auto_235683 ) ) ( not ( = ?auto_235675 ?auto_235684 ) ) ( not ( = ?auto_235675 ?auto_235685 ) ) ( not ( = ?auto_235675 ?auto_235686 ) ) ( not ( = ?auto_235676 ?auto_235677 ) ) ( not ( = ?auto_235676 ?auto_235678 ) ) ( not ( = ?auto_235676 ?auto_235679 ) ) ( not ( = ?auto_235676 ?auto_235680 ) ) ( not ( = ?auto_235676 ?auto_235681 ) ) ( not ( = ?auto_235676 ?auto_235682 ) ) ( not ( = ?auto_235676 ?auto_235683 ) ) ( not ( = ?auto_235676 ?auto_235684 ) ) ( not ( = ?auto_235676 ?auto_235685 ) ) ( not ( = ?auto_235676 ?auto_235686 ) ) ( not ( = ?auto_235677 ?auto_235678 ) ) ( not ( = ?auto_235677 ?auto_235679 ) ) ( not ( = ?auto_235677 ?auto_235680 ) ) ( not ( = ?auto_235677 ?auto_235681 ) ) ( not ( = ?auto_235677 ?auto_235682 ) ) ( not ( = ?auto_235677 ?auto_235683 ) ) ( not ( = ?auto_235677 ?auto_235684 ) ) ( not ( = ?auto_235677 ?auto_235685 ) ) ( not ( = ?auto_235677 ?auto_235686 ) ) ( not ( = ?auto_235678 ?auto_235679 ) ) ( not ( = ?auto_235678 ?auto_235680 ) ) ( not ( = ?auto_235678 ?auto_235681 ) ) ( not ( = ?auto_235678 ?auto_235682 ) ) ( not ( = ?auto_235678 ?auto_235683 ) ) ( not ( = ?auto_235678 ?auto_235684 ) ) ( not ( = ?auto_235678 ?auto_235685 ) ) ( not ( = ?auto_235678 ?auto_235686 ) ) ( not ( = ?auto_235679 ?auto_235680 ) ) ( not ( = ?auto_235679 ?auto_235681 ) ) ( not ( = ?auto_235679 ?auto_235682 ) ) ( not ( = ?auto_235679 ?auto_235683 ) ) ( not ( = ?auto_235679 ?auto_235684 ) ) ( not ( = ?auto_235679 ?auto_235685 ) ) ( not ( = ?auto_235679 ?auto_235686 ) ) ( not ( = ?auto_235680 ?auto_235681 ) ) ( not ( = ?auto_235680 ?auto_235682 ) ) ( not ( = ?auto_235680 ?auto_235683 ) ) ( not ( = ?auto_235680 ?auto_235684 ) ) ( not ( = ?auto_235680 ?auto_235685 ) ) ( not ( = ?auto_235680 ?auto_235686 ) ) ( not ( = ?auto_235681 ?auto_235682 ) ) ( not ( = ?auto_235681 ?auto_235683 ) ) ( not ( = ?auto_235681 ?auto_235684 ) ) ( not ( = ?auto_235681 ?auto_235685 ) ) ( not ( = ?auto_235681 ?auto_235686 ) ) ( not ( = ?auto_235682 ?auto_235683 ) ) ( not ( = ?auto_235682 ?auto_235684 ) ) ( not ( = ?auto_235682 ?auto_235685 ) ) ( not ( = ?auto_235682 ?auto_235686 ) ) ( not ( = ?auto_235683 ?auto_235684 ) ) ( not ( = ?auto_235683 ?auto_235685 ) ) ( not ( = ?auto_235683 ?auto_235686 ) ) ( not ( = ?auto_235684 ?auto_235685 ) ) ( not ( = ?auto_235684 ?auto_235686 ) ) ( not ( = ?auto_235685 ?auto_235686 ) ) ( ON ?auto_235684 ?auto_235685 ) ( ON ?auto_235683 ?auto_235684 ) ( ON ?auto_235682 ?auto_235683 ) ( ON ?auto_235681 ?auto_235682 ) ( CLEAR ?auto_235679 ) ( ON ?auto_235680 ?auto_235681 ) ( CLEAR ?auto_235680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_235674 ?auto_235675 ?auto_235676 ?auto_235677 ?auto_235678 ?auto_235679 ?auto_235680 )
      ( MAKE-12PILE ?auto_235674 ?auto_235675 ?auto_235676 ?auto_235677 ?auto_235678 ?auto_235679 ?auto_235680 ?auto_235681 ?auto_235682 ?auto_235683 ?auto_235684 ?auto_235685 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235724 - BLOCK
      ?auto_235725 - BLOCK
      ?auto_235726 - BLOCK
      ?auto_235727 - BLOCK
      ?auto_235728 - BLOCK
      ?auto_235729 - BLOCK
      ?auto_235730 - BLOCK
      ?auto_235731 - BLOCK
      ?auto_235732 - BLOCK
      ?auto_235733 - BLOCK
      ?auto_235734 - BLOCK
      ?auto_235735 - BLOCK
    )
    :vars
    (
      ?auto_235736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235735 ?auto_235736 ) ( ON-TABLE ?auto_235724 ) ( ON ?auto_235725 ?auto_235724 ) ( ON ?auto_235726 ?auto_235725 ) ( ON ?auto_235727 ?auto_235726 ) ( ON ?auto_235728 ?auto_235727 ) ( not ( = ?auto_235724 ?auto_235725 ) ) ( not ( = ?auto_235724 ?auto_235726 ) ) ( not ( = ?auto_235724 ?auto_235727 ) ) ( not ( = ?auto_235724 ?auto_235728 ) ) ( not ( = ?auto_235724 ?auto_235729 ) ) ( not ( = ?auto_235724 ?auto_235730 ) ) ( not ( = ?auto_235724 ?auto_235731 ) ) ( not ( = ?auto_235724 ?auto_235732 ) ) ( not ( = ?auto_235724 ?auto_235733 ) ) ( not ( = ?auto_235724 ?auto_235734 ) ) ( not ( = ?auto_235724 ?auto_235735 ) ) ( not ( = ?auto_235724 ?auto_235736 ) ) ( not ( = ?auto_235725 ?auto_235726 ) ) ( not ( = ?auto_235725 ?auto_235727 ) ) ( not ( = ?auto_235725 ?auto_235728 ) ) ( not ( = ?auto_235725 ?auto_235729 ) ) ( not ( = ?auto_235725 ?auto_235730 ) ) ( not ( = ?auto_235725 ?auto_235731 ) ) ( not ( = ?auto_235725 ?auto_235732 ) ) ( not ( = ?auto_235725 ?auto_235733 ) ) ( not ( = ?auto_235725 ?auto_235734 ) ) ( not ( = ?auto_235725 ?auto_235735 ) ) ( not ( = ?auto_235725 ?auto_235736 ) ) ( not ( = ?auto_235726 ?auto_235727 ) ) ( not ( = ?auto_235726 ?auto_235728 ) ) ( not ( = ?auto_235726 ?auto_235729 ) ) ( not ( = ?auto_235726 ?auto_235730 ) ) ( not ( = ?auto_235726 ?auto_235731 ) ) ( not ( = ?auto_235726 ?auto_235732 ) ) ( not ( = ?auto_235726 ?auto_235733 ) ) ( not ( = ?auto_235726 ?auto_235734 ) ) ( not ( = ?auto_235726 ?auto_235735 ) ) ( not ( = ?auto_235726 ?auto_235736 ) ) ( not ( = ?auto_235727 ?auto_235728 ) ) ( not ( = ?auto_235727 ?auto_235729 ) ) ( not ( = ?auto_235727 ?auto_235730 ) ) ( not ( = ?auto_235727 ?auto_235731 ) ) ( not ( = ?auto_235727 ?auto_235732 ) ) ( not ( = ?auto_235727 ?auto_235733 ) ) ( not ( = ?auto_235727 ?auto_235734 ) ) ( not ( = ?auto_235727 ?auto_235735 ) ) ( not ( = ?auto_235727 ?auto_235736 ) ) ( not ( = ?auto_235728 ?auto_235729 ) ) ( not ( = ?auto_235728 ?auto_235730 ) ) ( not ( = ?auto_235728 ?auto_235731 ) ) ( not ( = ?auto_235728 ?auto_235732 ) ) ( not ( = ?auto_235728 ?auto_235733 ) ) ( not ( = ?auto_235728 ?auto_235734 ) ) ( not ( = ?auto_235728 ?auto_235735 ) ) ( not ( = ?auto_235728 ?auto_235736 ) ) ( not ( = ?auto_235729 ?auto_235730 ) ) ( not ( = ?auto_235729 ?auto_235731 ) ) ( not ( = ?auto_235729 ?auto_235732 ) ) ( not ( = ?auto_235729 ?auto_235733 ) ) ( not ( = ?auto_235729 ?auto_235734 ) ) ( not ( = ?auto_235729 ?auto_235735 ) ) ( not ( = ?auto_235729 ?auto_235736 ) ) ( not ( = ?auto_235730 ?auto_235731 ) ) ( not ( = ?auto_235730 ?auto_235732 ) ) ( not ( = ?auto_235730 ?auto_235733 ) ) ( not ( = ?auto_235730 ?auto_235734 ) ) ( not ( = ?auto_235730 ?auto_235735 ) ) ( not ( = ?auto_235730 ?auto_235736 ) ) ( not ( = ?auto_235731 ?auto_235732 ) ) ( not ( = ?auto_235731 ?auto_235733 ) ) ( not ( = ?auto_235731 ?auto_235734 ) ) ( not ( = ?auto_235731 ?auto_235735 ) ) ( not ( = ?auto_235731 ?auto_235736 ) ) ( not ( = ?auto_235732 ?auto_235733 ) ) ( not ( = ?auto_235732 ?auto_235734 ) ) ( not ( = ?auto_235732 ?auto_235735 ) ) ( not ( = ?auto_235732 ?auto_235736 ) ) ( not ( = ?auto_235733 ?auto_235734 ) ) ( not ( = ?auto_235733 ?auto_235735 ) ) ( not ( = ?auto_235733 ?auto_235736 ) ) ( not ( = ?auto_235734 ?auto_235735 ) ) ( not ( = ?auto_235734 ?auto_235736 ) ) ( not ( = ?auto_235735 ?auto_235736 ) ) ( ON ?auto_235734 ?auto_235735 ) ( ON ?auto_235733 ?auto_235734 ) ( ON ?auto_235732 ?auto_235733 ) ( ON ?auto_235731 ?auto_235732 ) ( ON ?auto_235730 ?auto_235731 ) ( CLEAR ?auto_235728 ) ( ON ?auto_235729 ?auto_235730 ) ( CLEAR ?auto_235729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_235724 ?auto_235725 ?auto_235726 ?auto_235727 ?auto_235728 ?auto_235729 )
      ( MAKE-12PILE ?auto_235724 ?auto_235725 ?auto_235726 ?auto_235727 ?auto_235728 ?auto_235729 ?auto_235730 ?auto_235731 ?auto_235732 ?auto_235733 ?auto_235734 ?auto_235735 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235774 - BLOCK
      ?auto_235775 - BLOCK
      ?auto_235776 - BLOCK
      ?auto_235777 - BLOCK
      ?auto_235778 - BLOCK
      ?auto_235779 - BLOCK
      ?auto_235780 - BLOCK
      ?auto_235781 - BLOCK
      ?auto_235782 - BLOCK
      ?auto_235783 - BLOCK
      ?auto_235784 - BLOCK
      ?auto_235785 - BLOCK
    )
    :vars
    (
      ?auto_235786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235785 ?auto_235786 ) ( ON-TABLE ?auto_235774 ) ( ON ?auto_235775 ?auto_235774 ) ( ON ?auto_235776 ?auto_235775 ) ( ON ?auto_235777 ?auto_235776 ) ( not ( = ?auto_235774 ?auto_235775 ) ) ( not ( = ?auto_235774 ?auto_235776 ) ) ( not ( = ?auto_235774 ?auto_235777 ) ) ( not ( = ?auto_235774 ?auto_235778 ) ) ( not ( = ?auto_235774 ?auto_235779 ) ) ( not ( = ?auto_235774 ?auto_235780 ) ) ( not ( = ?auto_235774 ?auto_235781 ) ) ( not ( = ?auto_235774 ?auto_235782 ) ) ( not ( = ?auto_235774 ?auto_235783 ) ) ( not ( = ?auto_235774 ?auto_235784 ) ) ( not ( = ?auto_235774 ?auto_235785 ) ) ( not ( = ?auto_235774 ?auto_235786 ) ) ( not ( = ?auto_235775 ?auto_235776 ) ) ( not ( = ?auto_235775 ?auto_235777 ) ) ( not ( = ?auto_235775 ?auto_235778 ) ) ( not ( = ?auto_235775 ?auto_235779 ) ) ( not ( = ?auto_235775 ?auto_235780 ) ) ( not ( = ?auto_235775 ?auto_235781 ) ) ( not ( = ?auto_235775 ?auto_235782 ) ) ( not ( = ?auto_235775 ?auto_235783 ) ) ( not ( = ?auto_235775 ?auto_235784 ) ) ( not ( = ?auto_235775 ?auto_235785 ) ) ( not ( = ?auto_235775 ?auto_235786 ) ) ( not ( = ?auto_235776 ?auto_235777 ) ) ( not ( = ?auto_235776 ?auto_235778 ) ) ( not ( = ?auto_235776 ?auto_235779 ) ) ( not ( = ?auto_235776 ?auto_235780 ) ) ( not ( = ?auto_235776 ?auto_235781 ) ) ( not ( = ?auto_235776 ?auto_235782 ) ) ( not ( = ?auto_235776 ?auto_235783 ) ) ( not ( = ?auto_235776 ?auto_235784 ) ) ( not ( = ?auto_235776 ?auto_235785 ) ) ( not ( = ?auto_235776 ?auto_235786 ) ) ( not ( = ?auto_235777 ?auto_235778 ) ) ( not ( = ?auto_235777 ?auto_235779 ) ) ( not ( = ?auto_235777 ?auto_235780 ) ) ( not ( = ?auto_235777 ?auto_235781 ) ) ( not ( = ?auto_235777 ?auto_235782 ) ) ( not ( = ?auto_235777 ?auto_235783 ) ) ( not ( = ?auto_235777 ?auto_235784 ) ) ( not ( = ?auto_235777 ?auto_235785 ) ) ( not ( = ?auto_235777 ?auto_235786 ) ) ( not ( = ?auto_235778 ?auto_235779 ) ) ( not ( = ?auto_235778 ?auto_235780 ) ) ( not ( = ?auto_235778 ?auto_235781 ) ) ( not ( = ?auto_235778 ?auto_235782 ) ) ( not ( = ?auto_235778 ?auto_235783 ) ) ( not ( = ?auto_235778 ?auto_235784 ) ) ( not ( = ?auto_235778 ?auto_235785 ) ) ( not ( = ?auto_235778 ?auto_235786 ) ) ( not ( = ?auto_235779 ?auto_235780 ) ) ( not ( = ?auto_235779 ?auto_235781 ) ) ( not ( = ?auto_235779 ?auto_235782 ) ) ( not ( = ?auto_235779 ?auto_235783 ) ) ( not ( = ?auto_235779 ?auto_235784 ) ) ( not ( = ?auto_235779 ?auto_235785 ) ) ( not ( = ?auto_235779 ?auto_235786 ) ) ( not ( = ?auto_235780 ?auto_235781 ) ) ( not ( = ?auto_235780 ?auto_235782 ) ) ( not ( = ?auto_235780 ?auto_235783 ) ) ( not ( = ?auto_235780 ?auto_235784 ) ) ( not ( = ?auto_235780 ?auto_235785 ) ) ( not ( = ?auto_235780 ?auto_235786 ) ) ( not ( = ?auto_235781 ?auto_235782 ) ) ( not ( = ?auto_235781 ?auto_235783 ) ) ( not ( = ?auto_235781 ?auto_235784 ) ) ( not ( = ?auto_235781 ?auto_235785 ) ) ( not ( = ?auto_235781 ?auto_235786 ) ) ( not ( = ?auto_235782 ?auto_235783 ) ) ( not ( = ?auto_235782 ?auto_235784 ) ) ( not ( = ?auto_235782 ?auto_235785 ) ) ( not ( = ?auto_235782 ?auto_235786 ) ) ( not ( = ?auto_235783 ?auto_235784 ) ) ( not ( = ?auto_235783 ?auto_235785 ) ) ( not ( = ?auto_235783 ?auto_235786 ) ) ( not ( = ?auto_235784 ?auto_235785 ) ) ( not ( = ?auto_235784 ?auto_235786 ) ) ( not ( = ?auto_235785 ?auto_235786 ) ) ( ON ?auto_235784 ?auto_235785 ) ( ON ?auto_235783 ?auto_235784 ) ( ON ?auto_235782 ?auto_235783 ) ( ON ?auto_235781 ?auto_235782 ) ( ON ?auto_235780 ?auto_235781 ) ( ON ?auto_235779 ?auto_235780 ) ( CLEAR ?auto_235777 ) ( ON ?auto_235778 ?auto_235779 ) ( CLEAR ?auto_235778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_235774 ?auto_235775 ?auto_235776 ?auto_235777 ?auto_235778 )
      ( MAKE-12PILE ?auto_235774 ?auto_235775 ?auto_235776 ?auto_235777 ?auto_235778 ?auto_235779 ?auto_235780 ?auto_235781 ?auto_235782 ?auto_235783 ?auto_235784 ?auto_235785 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235824 - BLOCK
      ?auto_235825 - BLOCK
      ?auto_235826 - BLOCK
      ?auto_235827 - BLOCK
      ?auto_235828 - BLOCK
      ?auto_235829 - BLOCK
      ?auto_235830 - BLOCK
      ?auto_235831 - BLOCK
      ?auto_235832 - BLOCK
      ?auto_235833 - BLOCK
      ?auto_235834 - BLOCK
      ?auto_235835 - BLOCK
    )
    :vars
    (
      ?auto_235836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235835 ?auto_235836 ) ( ON-TABLE ?auto_235824 ) ( ON ?auto_235825 ?auto_235824 ) ( ON ?auto_235826 ?auto_235825 ) ( not ( = ?auto_235824 ?auto_235825 ) ) ( not ( = ?auto_235824 ?auto_235826 ) ) ( not ( = ?auto_235824 ?auto_235827 ) ) ( not ( = ?auto_235824 ?auto_235828 ) ) ( not ( = ?auto_235824 ?auto_235829 ) ) ( not ( = ?auto_235824 ?auto_235830 ) ) ( not ( = ?auto_235824 ?auto_235831 ) ) ( not ( = ?auto_235824 ?auto_235832 ) ) ( not ( = ?auto_235824 ?auto_235833 ) ) ( not ( = ?auto_235824 ?auto_235834 ) ) ( not ( = ?auto_235824 ?auto_235835 ) ) ( not ( = ?auto_235824 ?auto_235836 ) ) ( not ( = ?auto_235825 ?auto_235826 ) ) ( not ( = ?auto_235825 ?auto_235827 ) ) ( not ( = ?auto_235825 ?auto_235828 ) ) ( not ( = ?auto_235825 ?auto_235829 ) ) ( not ( = ?auto_235825 ?auto_235830 ) ) ( not ( = ?auto_235825 ?auto_235831 ) ) ( not ( = ?auto_235825 ?auto_235832 ) ) ( not ( = ?auto_235825 ?auto_235833 ) ) ( not ( = ?auto_235825 ?auto_235834 ) ) ( not ( = ?auto_235825 ?auto_235835 ) ) ( not ( = ?auto_235825 ?auto_235836 ) ) ( not ( = ?auto_235826 ?auto_235827 ) ) ( not ( = ?auto_235826 ?auto_235828 ) ) ( not ( = ?auto_235826 ?auto_235829 ) ) ( not ( = ?auto_235826 ?auto_235830 ) ) ( not ( = ?auto_235826 ?auto_235831 ) ) ( not ( = ?auto_235826 ?auto_235832 ) ) ( not ( = ?auto_235826 ?auto_235833 ) ) ( not ( = ?auto_235826 ?auto_235834 ) ) ( not ( = ?auto_235826 ?auto_235835 ) ) ( not ( = ?auto_235826 ?auto_235836 ) ) ( not ( = ?auto_235827 ?auto_235828 ) ) ( not ( = ?auto_235827 ?auto_235829 ) ) ( not ( = ?auto_235827 ?auto_235830 ) ) ( not ( = ?auto_235827 ?auto_235831 ) ) ( not ( = ?auto_235827 ?auto_235832 ) ) ( not ( = ?auto_235827 ?auto_235833 ) ) ( not ( = ?auto_235827 ?auto_235834 ) ) ( not ( = ?auto_235827 ?auto_235835 ) ) ( not ( = ?auto_235827 ?auto_235836 ) ) ( not ( = ?auto_235828 ?auto_235829 ) ) ( not ( = ?auto_235828 ?auto_235830 ) ) ( not ( = ?auto_235828 ?auto_235831 ) ) ( not ( = ?auto_235828 ?auto_235832 ) ) ( not ( = ?auto_235828 ?auto_235833 ) ) ( not ( = ?auto_235828 ?auto_235834 ) ) ( not ( = ?auto_235828 ?auto_235835 ) ) ( not ( = ?auto_235828 ?auto_235836 ) ) ( not ( = ?auto_235829 ?auto_235830 ) ) ( not ( = ?auto_235829 ?auto_235831 ) ) ( not ( = ?auto_235829 ?auto_235832 ) ) ( not ( = ?auto_235829 ?auto_235833 ) ) ( not ( = ?auto_235829 ?auto_235834 ) ) ( not ( = ?auto_235829 ?auto_235835 ) ) ( not ( = ?auto_235829 ?auto_235836 ) ) ( not ( = ?auto_235830 ?auto_235831 ) ) ( not ( = ?auto_235830 ?auto_235832 ) ) ( not ( = ?auto_235830 ?auto_235833 ) ) ( not ( = ?auto_235830 ?auto_235834 ) ) ( not ( = ?auto_235830 ?auto_235835 ) ) ( not ( = ?auto_235830 ?auto_235836 ) ) ( not ( = ?auto_235831 ?auto_235832 ) ) ( not ( = ?auto_235831 ?auto_235833 ) ) ( not ( = ?auto_235831 ?auto_235834 ) ) ( not ( = ?auto_235831 ?auto_235835 ) ) ( not ( = ?auto_235831 ?auto_235836 ) ) ( not ( = ?auto_235832 ?auto_235833 ) ) ( not ( = ?auto_235832 ?auto_235834 ) ) ( not ( = ?auto_235832 ?auto_235835 ) ) ( not ( = ?auto_235832 ?auto_235836 ) ) ( not ( = ?auto_235833 ?auto_235834 ) ) ( not ( = ?auto_235833 ?auto_235835 ) ) ( not ( = ?auto_235833 ?auto_235836 ) ) ( not ( = ?auto_235834 ?auto_235835 ) ) ( not ( = ?auto_235834 ?auto_235836 ) ) ( not ( = ?auto_235835 ?auto_235836 ) ) ( ON ?auto_235834 ?auto_235835 ) ( ON ?auto_235833 ?auto_235834 ) ( ON ?auto_235832 ?auto_235833 ) ( ON ?auto_235831 ?auto_235832 ) ( ON ?auto_235830 ?auto_235831 ) ( ON ?auto_235829 ?auto_235830 ) ( ON ?auto_235828 ?auto_235829 ) ( CLEAR ?auto_235826 ) ( ON ?auto_235827 ?auto_235828 ) ( CLEAR ?auto_235827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_235824 ?auto_235825 ?auto_235826 ?auto_235827 )
      ( MAKE-12PILE ?auto_235824 ?auto_235825 ?auto_235826 ?auto_235827 ?auto_235828 ?auto_235829 ?auto_235830 ?auto_235831 ?auto_235832 ?auto_235833 ?auto_235834 ?auto_235835 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235874 - BLOCK
      ?auto_235875 - BLOCK
      ?auto_235876 - BLOCK
      ?auto_235877 - BLOCK
      ?auto_235878 - BLOCK
      ?auto_235879 - BLOCK
      ?auto_235880 - BLOCK
      ?auto_235881 - BLOCK
      ?auto_235882 - BLOCK
      ?auto_235883 - BLOCK
      ?auto_235884 - BLOCK
      ?auto_235885 - BLOCK
    )
    :vars
    (
      ?auto_235886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235885 ?auto_235886 ) ( ON-TABLE ?auto_235874 ) ( ON ?auto_235875 ?auto_235874 ) ( not ( = ?auto_235874 ?auto_235875 ) ) ( not ( = ?auto_235874 ?auto_235876 ) ) ( not ( = ?auto_235874 ?auto_235877 ) ) ( not ( = ?auto_235874 ?auto_235878 ) ) ( not ( = ?auto_235874 ?auto_235879 ) ) ( not ( = ?auto_235874 ?auto_235880 ) ) ( not ( = ?auto_235874 ?auto_235881 ) ) ( not ( = ?auto_235874 ?auto_235882 ) ) ( not ( = ?auto_235874 ?auto_235883 ) ) ( not ( = ?auto_235874 ?auto_235884 ) ) ( not ( = ?auto_235874 ?auto_235885 ) ) ( not ( = ?auto_235874 ?auto_235886 ) ) ( not ( = ?auto_235875 ?auto_235876 ) ) ( not ( = ?auto_235875 ?auto_235877 ) ) ( not ( = ?auto_235875 ?auto_235878 ) ) ( not ( = ?auto_235875 ?auto_235879 ) ) ( not ( = ?auto_235875 ?auto_235880 ) ) ( not ( = ?auto_235875 ?auto_235881 ) ) ( not ( = ?auto_235875 ?auto_235882 ) ) ( not ( = ?auto_235875 ?auto_235883 ) ) ( not ( = ?auto_235875 ?auto_235884 ) ) ( not ( = ?auto_235875 ?auto_235885 ) ) ( not ( = ?auto_235875 ?auto_235886 ) ) ( not ( = ?auto_235876 ?auto_235877 ) ) ( not ( = ?auto_235876 ?auto_235878 ) ) ( not ( = ?auto_235876 ?auto_235879 ) ) ( not ( = ?auto_235876 ?auto_235880 ) ) ( not ( = ?auto_235876 ?auto_235881 ) ) ( not ( = ?auto_235876 ?auto_235882 ) ) ( not ( = ?auto_235876 ?auto_235883 ) ) ( not ( = ?auto_235876 ?auto_235884 ) ) ( not ( = ?auto_235876 ?auto_235885 ) ) ( not ( = ?auto_235876 ?auto_235886 ) ) ( not ( = ?auto_235877 ?auto_235878 ) ) ( not ( = ?auto_235877 ?auto_235879 ) ) ( not ( = ?auto_235877 ?auto_235880 ) ) ( not ( = ?auto_235877 ?auto_235881 ) ) ( not ( = ?auto_235877 ?auto_235882 ) ) ( not ( = ?auto_235877 ?auto_235883 ) ) ( not ( = ?auto_235877 ?auto_235884 ) ) ( not ( = ?auto_235877 ?auto_235885 ) ) ( not ( = ?auto_235877 ?auto_235886 ) ) ( not ( = ?auto_235878 ?auto_235879 ) ) ( not ( = ?auto_235878 ?auto_235880 ) ) ( not ( = ?auto_235878 ?auto_235881 ) ) ( not ( = ?auto_235878 ?auto_235882 ) ) ( not ( = ?auto_235878 ?auto_235883 ) ) ( not ( = ?auto_235878 ?auto_235884 ) ) ( not ( = ?auto_235878 ?auto_235885 ) ) ( not ( = ?auto_235878 ?auto_235886 ) ) ( not ( = ?auto_235879 ?auto_235880 ) ) ( not ( = ?auto_235879 ?auto_235881 ) ) ( not ( = ?auto_235879 ?auto_235882 ) ) ( not ( = ?auto_235879 ?auto_235883 ) ) ( not ( = ?auto_235879 ?auto_235884 ) ) ( not ( = ?auto_235879 ?auto_235885 ) ) ( not ( = ?auto_235879 ?auto_235886 ) ) ( not ( = ?auto_235880 ?auto_235881 ) ) ( not ( = ?auto_235880 ?auto_235882 ) ) ( not ( = ?auto_235880 ?auto_235883 ) ) ( not ( = ?auto_235880 ?auto_235884 ) ) ( not ( = ?auto_235880 ?auto_235885 ) ) ( not ( = ?auto_235880 ?auto_235886 ) ) ( not ( = ?auto_235881 ?auto_235882 ) ) ( not ( = ?auto_235881 ?auto_235883 ) ) ( not ( = ?auto_235881 ?auto_235884 ) ) ( not ( = ?auto_235881 ?auto_235885 ) ) ( not ( = ?auto_235881 ?auto_235886 ) ) ( not ( = ?auto_235882 ?auto_235883 ) ) ( not ( = ?auto_235882 ?auto_235884 ) ) ( not ( = ?auto_235882 ?auto_235885 ) ) ( not ( = ?auto_235882 ?auto_235886 ) ) ( not ( = ?auto_235883 ?auto_235884 ) ) ( not ( = ?auto_235883 ?auto_235885 ) ) ( not ( = ?auto_235883 ?auto_235886 ) ) ( not ( = ?auto_235884 ?auto_235885 ) ) ( not ( = ?auto_235884 ?auto_235886 ) ) ( not ( = ?auto_235885 ?auto_235886 ) ) ( ON ?auto_235884 ?auto_235885 ) ( ON ?auto_235883 ?auto_235884 ) ( ON ?auto_235882 ?auto_235883 ) ( ON ?auto_235881 ?auto_235882 ) ( ON ?auto_235880 ?auto_235881 ) ( ON ?auto_235879 ?auto_235880 ) ( ON ?auto_235878 ?auto_235879 ) ( ON ?auto_235877 ?auto_235878 ) ( CLEAR ?auto_235875 ) ( ON ?auto_235876 ?auto_235877 ) ( CLEAR ?auto_235876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_235874 ?auto_235875 ?auto_235876 )
      ( MAKE-12PILE ?auto_235874 ?auto_235875 ?auto_235876 ?auto_235877 ?auto_235878 ?auto_235879 ?auto_235880 ?auto_235881 ?auto_235882 ?auto_235883 ?auto_235884 ?auto_235885 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235924 - BLOCK
      ?auto_235925 - BLOCK
      ?auto_235926 - BLOCK
      ?auto_235927 - BLOCK
      ?auto_235928 - BLOCK
      ?auto_235929 - BLOCK
      ?auto_235930 - BLOCK
      ?auto_235931 - BLOCK
      ?auto_235932 - BLOCK
      ?auto_235933 - BLOCK
      ?auto_235934 - BLOCK
      ?auto_235935 - BLOCK
    )
    :vars
    (
      ?auto_235936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235935 ?auto_235936 ) ( ON-TABLE ?auto_235924 ) ( not ( = ?auto_235924 ?auto_235925 ) ) ( not ( = ?auto_235924 ?auto_235926 ) ) ( not ( = ?auto_235924 ?auto_235927 ) ) ( not ( = ?auto_235924 ?auto_235928 ) ) ( not ( = ?auto_235924 ?auto_235929 ) ) ( not ( = ?auto_235924 ?auto_235930 ) ) ( not ( = ?auto_235924 ?auto_235931 ) ) ( not ( = ?auto_235924 ?auto_235932 ) ) ( not ( = ?auto_235924 ?auto_235933 ) ) ( not ( = ?auto_235924 ?auto_235934 ) ) ( not ( = ?auto_235924 ?auto_235935 ) ) ( not ( = ?auto_235924 ?auto_235936 ) ) ( not ( = ?auto_235925 ?auto_235926 ) ) ( not ( = ?auto_235925 ?auto_235927 ) ) ( not ( = ?auto_235925 ?auto_235928 ) ) ( not ( = ?auto_235925 ?auto_235929 ) ) ( not ( = ?auto_235925 ?auto_235930 ) ) ( not ( = ?auto_235925 ?auto_235931 ) ) ( not ( = ?auto_235925 ?auto_235932 ) ) ( not ( = ?auto_235925 ?auto_235933 ) ) ( not ( = ?auto_235925 ?auto_235934 ) ) ( not ( = ?auto_235925 ?auto_235935 ) ) ( not ( = ?auto_235925 ?auto_235936 ) ) ( not ( = ?auto_235926 ?auto_235927 ) ) ( not ( = ?auto_235926 ?auto_235928 ) ) ( not ( = ?auto_235926 ?auto_235929 ) ) ( not ( = ?auto_235926 ?auto_235930 ) ) ( not ( = ?auto_235926 ?auto_235931 ) ) ( not ( = ?auto_235926 ?auto_235932 ) ) ( not ( = ?auto_235926 ?auto_235933 ) ) ( not ( = ?auto_235926 ?auto_235934 ) ) ( not ( = ?auto_235926 ?auto_235935 ) ) ( not ( = ?auto_235926 ?auto_235936 ) ) ( not ( = ?auto_235927 ?auto_235928 ) ) ( not ( = ?auto_235927 ?auto_235929 ) ) ( not ( = ?auto_235927 ?auto_235930 ) ) ( not ( = ?auto_235927 ?auto_235931 ) ) ( not ( = ?auto_235927 ?auto_235932 ) ) ( not ( = ?auto_235927 ?auto_235933 ) ) ( not ( = ?auto_235927 ?auto_235934 ) ) ( not ( = ?auto_235927 ?auto_235935 ) ) ( not ( = ?auto_235927 ?auto_235936 ) ) ( not ( = ?auto_235928 ?auto_235929 ) ) ( not ( = ?auto_235928 ?auto_235930 ) ) ( not ( = ?auto_235928 ?auto_235931 ) ) ( not ( = ?auto_235928 ?auto_235932 ) ) ( not ( = ?auto_235928 ?auto_235933 ) ) ( not ( = ?auto_235928 ?auto_235934 ) ) ( not ( = ?auto_235928 ?auto_235935 ) ) ( not ( = ?auto_235928 ?auto_235936 ) ) ( not ( = ?auto_235929 ?auto_235930 ) ) ( not ( = ?auto_235929 ?auto_235931 ) ) ( not ( = ?auto_235929 ?auto_235932 ) ) ( not ( = ?auto_235929 ?auto_235933 ) ) ( not ( = ?auto_235929 ?auto_235934 ) ) ( not ( = ?auto_235929 ?auto_235935 ) ) ( not ( = ?auto_235929 ?auto_235936 ) ) ( not ( = ?auto_235930 ?auto_235931 ) ) ( not ( = ?auto_235930 ?auto_235932 ) ) ( not ( = ?auto_235930 ?auto_235933 ) ) ( not ( = ?auto_235930 ?auto_235934 ) ) ( not ( = ?auto_235930 ?auto_235935 ) ) ( not ( = ?auto_235930 ?auto_235936 ) ) ( not ( = ?auto_235931 ?auto_235932 ) ) ( not ( = ?auto_235931 ?auto_235933 ) ) ( not ( = ?auto_235931 ?auto_235934 ) ) ( not ( = ?auto_235931 ?auto_235935 ) ) ( not ( = ?auto_235931 ?auto_235936 ) ) ( not ( = ?auto_235932 ?auto_235933 ) ) ( not ( = ?auto_235932 ?auto_235934 ) ) ( not ( = ?auto_235932 ?auto_235935 ) ) ( not ( = ?auto_235932 ?auto_235936 ) ) ( not ( = ?auto_235933 ?auto_235934 ) ) ( not ( = ?auto_235933 ?auto_235935 ) ) ( not ( = ?auto_235933 ?auto_235936 ) ) ( not ( = ?auto_235934 ?auto_235935 ) ) ( not ( = ?auto_235934 ?auto_235936 ) ) ( not ( = ?auto_235935 ?auto_235936 ) ) ( ON ?auto_235934 ?auto_235935 ) ( ON ?auto_235933 ?auto_235934 ) ( ON ?auto_235932 ?auto_235933 ) ( ON ?auto_235931 ?auto_235932 ) ( ON ?auto_235930 ?auto_235931 ) ( ON ?auto_235929 ?auto_235930 ) ( ON ?auto_235928 ?auto_235929 ) ( ON ?auto_235927 ?auto_235928 ) ( ON ?auto_235926 ?auto_235927 ) ( CLEAR ?auto_235924 ) ( ON ?auto_235925 ?auto_235926 ) ( CLEAR ?auto_235925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_235924 ?auto_235925 )
      ( MAKE-12PILE ?auto_235924 ?auto_235925 ?auto_235926 ?auto_235927 ?auto_235928 ?auto_235929 ?auto_235930 ?auto_235931 ?auto_235932 ?auto_235933 ?auto_235934 ?auto_235935 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_235974 - BLOCK
      ?auto_235975 - BLOCK
      ?auto_235976 - BLOCK
      ?auto_235977 - BLOCK
      ?auto_235978 - BLOCK
      ?auto_235979 - BLOCK
      ?auto_235980 - BLOCK
      ?auto_235981 - BLOCK
      ?auto_235982 - BLOCK
      ?auto_235983 - BLOCK
      ?auto_235984 - BLOCK
      ?auto_235985 - BLOCK
    )
    :vars
    (
      ?auto_235986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235985 ?auto_235986 ) ( not ( = ?auto_235974 ?auto_235975 ) ) ( not ( = ?auto_235974 ?auto_235976 ) ) ( not ( = ?auto_235974 ?auto_235977 ) ) ( not ( = ?auto_235974 ?auto_235978 ) ) ( not ( = ?auto_235974 ?auto_235979 ) ) ( not ( = ?auto_235974 ?auto_235980 ) ) ( not ( = ?auto_235974 ?auto_235981 ) ) ( not ( = ?auto_235974 ?auto_235982 ) ) ( not ( = ?auto_235974 ?auto_235983 ) ) ( not ( = ?auto_235974 ?auto_235984 ) ) ( not ( = ?auto_235974 ?auto_235985 ) ) ( not ( = ?auto_235974 ?auto_235986 ) ) ( not ( = ?auto_235975 ?auto_235976 ) ) ( not ( = ?auto_235975 ?auto_235977 ) ) ( not ( = ?auto_235975 ?auto_235978 ) ) ( not ( = ?auto_235975 ?auto_235979 ) ) ( not ( = ?auto_235975 ?auto_235980 ) ) ( not ( = ?auto_235975 ?auto_235981 ) ) ( not ( = ?auto_235975 ?auto_235982 ) ) ( not ( = ?auto_235975 ?auto_235983 ) ) ( not ( = ?auto_235975 ?auto_235984 ) ) ( not ( = ?auto_235975 ?auto_235985 ) ) ( not ( = ?auto_235975 ?auto_235986 ) ) ( not ( = ?auto_235976 ?auto_235977 ) ) ( not ( = ?auto_235976 ?auto_235978 ) ) ( not ( = ?auto_235976 ?auto_235979 ) ) ( not ( = ?auto_235976 ?auto_235980 ) ) ( not ( = ?auto_235976 ?auto_235981 ) ) ( not ( = ?auto_235976 ?auto_235982 ) ) ( not ( = ?auto_235976 ?auto_235983 ) ) ( not ( = ?auto_235976 ?auto_235984 ) ) ( not ( = ?auto_235976 ?auto_235985 ) ) ( not ( = ?auto_235976 ?auto_235986 ) ) ( not ( = ?auto_235977 ?auto_235978 ) ) ( not ( = ?auto_235977 ?auto_235979 ) ) ( not ( = ?auto_235977 ?auto_235980 ) ) ( not ( = ?auto_235977 ?auto_235981 ) ) ( not ( = ?auto_235977 ?auto_235982 ) ) ( not ( = ?auto_235977 ?auto_235983 ) ) ( not ( = ?auto_235977 ?auto_235984 ) ) ( not ( = ?auto_235977 ?auto_235985 ) ) ( not ( = ?auto_235977 ?auto_235986 ) ) ( not ( = ?auto_235978 ?auto_235979 ) ) ( not ( = ?auto_235978 ?auto_235980 ) ) ( not ( = ?auto_235978 ?auto_235981 ) ) ( not ( = ?auto_235978 ?auto_235982 ) ) ( not ( = ?auto_235978 ?auto_235983 ) ) ( not ( = ?auto_235978 ?auto_235984 ) ) ( not ( = ?auto_235978 ?auto_235985 ) ) ( not ( = ?auto_235978 ?auto_235986 ) ) ( not ( = ?auto_235979 ?auto_235980 ) ) ( not ( = ?auto_235979 ?auto_235981 ) ) ( not ( = ?auto_235979 ?auto_235982 ) ) ( not ( = ?auto_235979 ?auto_235983 ) ) ( not ( = ?auto_235979 ?auto_235984 ) ) ( not ( = ?auto_235979 ?auto_235985 ) ) ( not ( = ?auto_235979 ?auto_235986 ) ) ( not ( = ?auto_235980 ?auto_235981 ) ) ( not ( = ?auto_235980 ?auto_235982 ) ) ( not ( = ?auto_235980 ?auto_235983 ) ) ( not ( = ?auto_235980 ?auto_235984 ) ) ( not ( = ?auto_235980 ?auto_235985 ) ) ( not ( = ?auto_235980 ?auto_235986 ) ) ( not ( = ?auto_235981 ?auto_235982 ) ) ( not ( = ?auto_235981 ?auto_235983 ) ) ( not ( = ?auto_235981 ?auto_235984 ) ) ( not ( = ?auto_235981 ?auto_235985 ) ) ( not ( = ?auto_235981 ?auto_235986 ) ) ( not ( = ?auto_235982 ?auto_235983 ) ) ( not ( = ?auto_235982 ?auto_235984 ) ) ( not ( = ?auto_235982 ?auto_235985 ) ) ( not ( = ?auto_235982 ?auto_235986 ) ) ( not ( = ?auto_235983 ?auto_235984 ) ) ( not ( = ?auto_235983 ?auto_235985 ) ) ( not ( = ?auto_235983 ?auto_235986 ) ) ( not ( = ?auto_235984 ?auto_235985 ) ) ( not ( = ?auto_235984 ?auto_235986 ) ) ( not ( = ?auto_235985 ?auto_235986 ) ) ( ON ?auto_235984 ?auto_235985 ) ( ON ?auto_235983 ?auto_235984 ) ( ON ?auto_235982 ?auto_235983 ) ( ON ?auto_235981 ?auto_235982 ) ( ON ?auto_235980 ?auto_235981 ) ( ON ?auto_235979 ?auto_235980 ) ( ON ?auto_235978 ?auto_235979 ) ( ON ?auto_235977 ?auto_235978 ) ( ON ?auto_235976 ?auto_235977 ) ( ON ?auto_235975 ?auto_235976 ) ( ON ?auto_235974 ?auto_235975 ) ( CLEAR ?auto_235974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_235974 )
      ( MAKE-12PILE ?auto_235974 ?auto_235975 ?auto_235976 ?auto_235977 ?auto_235978 ?auto_235979 ?auto_235980 ?auto_235981 ?auto_235982 ?auto_235983 ?auto_235984 ?auto_235985 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236025 - BLOCK
      ?auto_236026 - BLOCK
      ?auto_236027 - BLOCK
      ?auto_236028 - BLOCK
      ?auto_236029 - BLOCK
      ?auto_236030 - BLOCK
      ?auto_236031 - BLOCK
      ?auto_236032 - BLOCK
      ?auto_236033 - BLOCK
      ?auto_236034 - BLOCK
      ?auto_236035 - BLOCK
      ?auto_236036 - BLOCK
      ?auto_236037 - BLOCK
    )
    :vars
    (
      ?auto_236038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236036 ) ( ON ?auto_236037 ?auto_236038 ) ( CLEAR ?auto_236037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236025 ) ( ON ?auto_236026 ?auto_236025 ) ( ON ?auto_236027 ?auto_236026 ) ( ON ?auto_236028 ?auto_236027 ) ( ON ?auto_236029 ?auto_236028 ) ( ON ?auto_236030 ?auto_236029 ) ( ON ?auto_236031 ?auto_236030 ) ( ON ?auto_236032 ?auto_236031 ) ( ON ?auto_236033 ?auto_236032 ) ( ON ?auto_236034 ?auto_236033 ) ( ON ?auto_236035 ?auto_236034 ) ( ON ?auto_236036 ?auto_236035 ) ( not ( = ?auto_236025 ?auto_236026 ) ) ( not ( = ?auto_236025 ?auto_236027 ) ) ( not ( = ?auto_236025 ?auto_236028 ) ) ( not ( = ?auto_236025 ?auto_236029 ) ) ( not ( = ?auto_236025 ?auto_236030 ) ) ( not ( = ?auto_236025 ?auto_236031 ) ) ( not ( = ?auto_236025 ?auto_236032 ) ) ( not ( = ?auto_236025 ?auto_236033 ) ) ( not ( = ?auto_236025 ?auto_236034 ) ) ( not ( = ?auto_236025 ?auto_236035 ) ) ( not ( = ?auto_236025 ?auto_236036 ) ) ( not ( = ?auto_236025 ?auto_236037 ) ) ( not ( = ?auto_236025 ?auto_236038 ) ) ( not ( = ?auto_236026 ?auto_236027 ) ) ( not ( = ?auto_236026 ?auto_236028 ) ) ( not ( = ?auto_236026 ?auto_236029 ) ) ( not ( = ?auto_236026 ?auto_236030 ) ) ( not ( = ?auto_236026 ?auto_236031 ) ) ( not ( = ?auto_236026 ?auto_236032 ) ) ( not ( = ?auto_236026 ?auto_236033 ) ) ( not ( = ?auto_236026 ?auto_236034 ) ) ( not ( = ?auto_236026 ?auto_236035 ) ) ( not ( = ?auto_236026 ?auto_236036 ) ) ( not ( = ?auto_236026 ?auto_236037 ) ) ( not ( = ?auto_236026 ?auto_236038 ) ) ( not ( = ?auto_236027 ?auto_236028 ) ) ( not ( = ?auto_236027 ?auto_236029 ) ) ( not ( = ?auto_236027 ?auto_236030 ) ) ( not ( = ?auto_236027 ?auto_236031 ) ) ( not ( = ?auto_236027 ?auto_236032 ) ) ( not ( = ?auto_236027 ?auto_236033 ) ) ( not ( = ?auto_236027 ?auto_236034 ) ) ( not ( = ?auto_236027 ?auto_236035 ) ) ( not ( = ?auto_236027 ?auto_236036 ) ) ( not ( = ?auto_236027 ?auto_236037 ) ) ( not ( = ?auto_236027 ?auto_236038 ) ) ( not ( = ?auto_236028 ?auto_236029 ) ) ( not ( = ?auto_236028 ?auto_236030 ) ) ( not ( = ?auto_236028 ?auto_236031 ) ) ( not ( = ?auto_236028 ?auto_236032 ) ) ( not ( = ?auto_236028 ?auto_236033 ) ) ( not ( = ?auto_236028 ?auto_236034 ) ) ( not ( = ?auto_236028 ?auto_236035 ) ) ( not ( = ?auto_236028 ?auto_236036 ) ) ( not ( = ?auto_236028 ?auto_236037 ) ) ( not ( = ?auto_236028 ?auto_236038 ) ) ( not ( = ?auto_236029 ?auto_236030 ) ) ( not ( = ?auto_236029 ?auto_236031 ) ) ( not ( = ?auto_236029 ?auto_236032 ) ) ( not ( = ?auto_236029 ?auto_236033 ) ) ( not ( = ?auto_236029 ?auto_236034 ) ) ( not ( = ?auto_236029 ?auto_236035 ) ) ( not ( = ?auto_236029 ?auto_236036 ) ) ( not ( = ?auto_236029 ?auto_236037 ) ) ( not ( = ?auto_236029 ?auto_236038 ) ) ( not ( = ?auto_236030 ?auto_236031 ) ) ( not ( = ?auto_236030 ?auto_236032 ) ) ( not ( = ?auto_236030 ?auto_236033 ) ) ( not ( = ?auto_236030 ?auto_236034 ) ) ( not ( = ?auto_236030 ?auto_236035 ) ) ( not ( = ?auto_236030 ?auto_236036 ) ) ( not ( = ?auto_236030 ?auto_236037 ) ) ( not ( = ?auto_236030 ?auto_236038 ) ) ( not ( = ?auto_236031 ?auto_236032 ) ) ( not ( = ?auto_236031 ?auto_236033 ) ) ( not ( = ?auto_236031 ?auto_236034 ) ) ( not ( = ?auto_236031 ?auto_236035 ) ) ( not ( = ?auto_236031 ?auto_236036 ) ) ( not ( = ?auto_236031 ?auto_236037 ) ) ( not ( = ?auto_236031 ?auto_236038 ) ) ( not ( = ?auto_236032 ?auto_236033 ) ) ( not ( = ?auto_236032 ?auto_236034 ) ) ( not ( = ?auto_236032 ?auto_236035 ) ) ( not ( = ?auto_236032 ?auto_236036 ) ) ( not ( = ?auto_236032 ?auto_236037 ) ) ( not ( = ?auto_236032 ?auto_236038 ) ) ( not ( = ?auto_236033 ?auto_236034 ) ) ( not ( = ?auto_236033 ?auto_236035 ) ) ( not ( = ?auto_236033 ?auto_236036 ) ) ( not ( = ?auto_236033 ?auto_236037 ) ) ( not ( = ?auto_236033 ?auto_236038 ) ) ( not ( = ?auto_236034 ?auto_236035 ) ) ( not ( = ?auto_236034 ?auto_236036 ) ) ( not ( = ?auto_236034 ?auto_236037 ) ) ( not ( = ?auto_236034 ?auto_236038 ) ) ( not ( = ?auto_236035 ?auto_236036 ) ) ( not ( = ?auto_236035 ?auto_236037 ) ) ( not ( = ?auto_236035 ?auto_236038 ) ) ( not ( = ?auto_236036 ?auto_236037 ) ) ( not ( = ?auto_236036 ?auto_236038 ) ) ( not ( = ?auto_236037 ?auto_236038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236037 ?auto_236038 )
      ( !STACK ?auto_236037 ?auto_236036 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236052 - BLOCK
      ?auto_236053 - BLOCK
      ?auto_236054 - BLOCK
      ?auto_236055 - BLOCK
      ?auto_236056 - BLOCK
      ?auto_236057 - BLOCK
      ?auto_236058 - BLOCK
      ?auto_236059 - BLOCK
      ?auto_236060 - BLOCK
      ?auto_236061 - BLOCK
      ?auto_236062 - BLOCK
      ?auto_236063 - BLOCK
      ?auto_236064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236063 ) ( ON-TABLE ?auto_236064 ) ( CLEAR ?auto_236064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236052 ) ( ON ?auto_236053 ?auto_236052 ) ( ON ?auto_236054 ?auto_236053 ) ( ON ?auto_236055 ?auto_236054 ) ( ON ?auto_236056 ?auto_236055 ) ( ON ?auto_236057 ?auto_236056 ) ( ON ?auto_236058 ?auto_236057 ) ( ON ?auto_236059 ?auto_236058 ) ( ON ?auto_236060 ?auto_236059 ) ( ON ?auto_236061 ?auto_236060 ) ( ON ?auto_236062 ?auto_236061 ) ( ON ?auto_236063 ?auto_236062 ) ( not ( = ?auto_236052 ?auto_236053 ) ) ( not ( = ?auto_236052 ?auto_236054 ) ) ( not ( = ?auto_236052 ?auto_236055 ) ) ( not ( = ?auto_236052 ?auto_236056 ) ) ( not ( = ?auto_236052 ?auto_236057 ) ) ( not ( = ?auto_236052 ?auto_236058 ) ) ( not ( = ?auto_236052 ?auto_236059 ) ) ( not ( = ?auto_236052 ?auto_236060 ) ) ( not ( = ?auto_236052 ?auto_236061 ) ) ( not ( = ?auto_236052 ?auto_236062 ) ) ( not ( = ?auto_236052 ?auto_236063 ) ) ( not ( = ?auto_236052 ?auto_236064 ) ) ( not ( = ?auto_236053 ?auto_236054 ) ) ( not ( = ?auto_236053 ?auto_236055 ) ) ( not ( = ?auto_236053 ?auto_236056 ) ) ( not ( = ?auto_236053 ?auto_236057 ) ) ( not ( = ?auto_236053 ?auto_236058 ) ) ( not ( = ?auto_236053 ?auto_236059 ) ) ( not ( = ?auto_236053 ?auto_236060 ) ) ( not ( = ?auto_236053 ?auto_236061 ) ) ( not ( = ?auto_236053 ?auto_236062 ) ) ( not ( = ?auto_236053 ?auto_236063 ) ) ( not ( = ?auto_236053 ?auto_236064 ) ) ( not ( = ?auto_236054 ?auto_236055 ) ) ( not ( = ?auto_236054 ?auto_236056 ) ) ( not ( = ?auto_236054 ?auto_236057 ) ) ( not ( = ?auto_236054 ?auto_236058 ) ) ( not ( = ?auto_236054 ?auto_236059 ) ) ( not ( = ?auto_236054 ?auto_236060 ) ) ( not ( = ?auto_236054 ?auto_236061 ) ) ( not ( = ?auto_236054 ?auto_236062 ) ) ( not ( = ?auto_236054 ?auto_236063 ) ) ( not ( = ?auto_236054 ?auto_236064 ) ) ( not ( = ?auto_236055 ?auto_236056 ) ) ( not ( = ?auto_236055 ?auto_236057 ) ) ( not ( = ?auto_236055 ?auto_236058 ) ) ( not ( = ?auto_236055 ?auto_236059 ) ) ( not ( = ?auto_236055 ?auto_236060 ) ) ( not ( = ?auto_236055 ?auto_236061 ) ) ( not ( = ?auto_236055 ?auto_236062 ) ) ( not ( = ?auto_236055 ?auto_236063 ) ) ( not ( = ?auto_236055 ?auto_236064 ) ) ( not ( = ?auto_236056 ?auto_236057 ) ) ( not ( = ?auto_236056 ?auto_236058 ) ) ( not ( = ?auto_236056 ?auto_236059 ) ) ( not ( = ?auto_236056 ?auto_236060 ) ) ( not ( = ?auto_236056 ?auto_236061 ) ) ( not ( = ?auto_236056 ?auto_236062 ) ) ( not ( = ?auto_236056 ?auto_236063 ) ) ( not ( = ?auto_236056 ?auto_236064 ) ) ( not ( = ?auto_236057 ?auto_236058 ) ) ( not ( = ?auto_236057 ?auto_236059 ) ) ( not ( = ?auto_236057 ?auto_236060 ) ) ( not ( = ?auto_236057 ?auto_236061 ) ) ( not ( = ?auto_236057 ?auto_236062 ) ) ( not ( = ?auto_236057 ?auto_236063 ) ) ( not ( = ?auto_236057 ?auto_236064 ) ) ( not ( = ?auto_236058 ?auto_236059 ) ) ( not ( = ?auto_236058 ?auto_236060 ) ) ( not ( = ?auto_236058 ?auto_236061 ) ) ( not ( = ?auto_236058 ?auto_236062 ) ) ( not ( = ?auto_236058 ?auto_236063 ) ) ( not ( = ?auto_236058 ?auto_236064 ) ) ( not ( = ?auto_236059 ?auto_236060 ) ) ( not ( = ?auto_236059 ?auto_236061 ) ) ( not ( = ?auto_236059 ?auto_236062 ) ) ( not ( = ?auto_236059 ?auto_236063 ) ) ( not ( = ?auto_236059 ?auto_236064 ) ) ( not ( = ?auto_236060 ?auto_236061 ) ) ( not ( = ?auto_236060 ?auto_236062 ) ) ( not ( = ?auto_236060 ?auto_236063 ) ) ( not ( = ?auto_236060 ?auto_236064 ) ) ( not ( = ?auto_236061 ?auto_236062 ) ) ( not ( = ?auto_236061 ?auto_236063 ) ) ( not ( = ?auto_236061 ?auto_236064 ) ) ( not ( = ?auto_236062 ?auto_236063 ) ) ( not ( = ?auto_236062 ?auto_236064 ) ) ( not ( = ?auto_236063 ?auto_236064 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_236064 )
      ( !STACK ?auto_236064 ?auto_236063 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236078 - BLOCK
      ?auto_236079 - BLOCK
      ?auto_236080 - BLOCK
      ?auto_236081 - BLOCK
      ?auto_236082 - BLOCK
      ?auto_236083 - BLOCK
      ?auto_236084 - BLOCK
      ?auto_236085 - BLOCK
      ?auto_236086 - BLOCK
      ?auto_236087 - BLOCK
      ?auto_236088 - BLOCK
      ?auto_236089 - BLOCK
      ?auto_236090 - BLOCK
    )
    :vars
    (
      ?auto_236091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236090 ?auto_236091 ) ( ON-TABLE ?auto_236078 ) ( ON ?auto_236079 ?auto_236078 ) ( ON ?auto_236080 ?auto_236079 ) ( ON ?auto_236081 ?auto_236080 ) ( ON ?auto_236082 ?auto_236081 ) ( ON ?auto_236083 ?auto_236082 ) ( ON ?auto_236084 ?auto_236083 ) ( ON ?auto_236085 ?auto_236084 ) ( ON ?auto_236086 ?auto_236085 ) ( ON ?auto_236087 ?auto_236086 ) ( ON ?auto_236088 ?auto_236087 ) ( not ( = ?auto_236078 ?auto_236079 ) ) ( not ( = ?auto_236078 ?auto_236080 ) ) ( not ( = ?auto_236078 ?auto_236081 ) ) ( not ( = ?auto_236078 ?auto_236082 ) ) ( not ( = ?auto_236078 ?auto_236083 ) ) ( not ( = ?auto_236078 ?auto_236084 ) ) ( not ( = ?auto_236078 ?auto_236085 ) ) ( not ( = ?auto_236078 ?auto_236086 ) ) ( not ( = ?auto_236078 ?auto_236087 ) ) ( not ( = ?auto_236078 ?auto_236088 ) ) ( not ( = ?auto_236078 ?auto_236089 ) ) ( not ( = ?auto_236078 ?auto_236090 ) ) ( not ( = ?auto_236078 ?auto_236091 ) ) ( not ( = ?auto_236079 ?auto_236080 ) ) ( not ( = ?auto_236079 ?auto_236081 ) ) ( not ( = ?auto_236079 ?auto_236082 ) ) ( not ( = ?auto_236079 ?auto_236083 ) ) ( not ( = ?auto_236079 ?auto_236084 ) ) ( not ( = ?auto_236079 ?auto_236085 ) ) ( not ( = ?auto_236079 ?auto_236086 ) ) ( not ( = ?auto_236079 ?auto_236087 ) ) ( not ( = ?auto_236079 ?auto_236088 ) ) ( not ( = ?auto_236079 ?auto_236089 ) ) ( not ( = ?auto_236079 ?auto_236090 ) ) ( not ( = ?auto_236079 ?auto_236091 ) ) ( not ( = ?auto_236080 ?auto_236081 ) ) ( not ( = ?auto_236080 ?auto_236082 ) ) ( not ( = ?auto_236080 ?auto_236083 ) ) ( not ( = ?auto_236080 ?auto_236084 ) ) ( not ( = ?auto_236080 ?auto_236085 ) ) ( not ( = ?auto_236080 ?auto_236086 ) ) ( not ( = ?auto_236080 ?auto_236087 ) ) ( not ( = ?auto_236080 ?auto_236088 ) ) ( not ( = ?auto_236080 ?auto_236089 ) ) ( not ( = ?auto_236080 ?auto_236090 ) ) ( not ( = ?auto_236080 ?auto_236091 ) ) ( not ( = ?auto_236081 ?auto_236082 ) ) ( not ( = ?auto_236081 ?auto_236083 ) ) ( not ( = ?auto_236081 ?auto_236084 ) ) ( not ( = ?auto_236081 ?auto_236085 ) ) ( not ( = ?auto_236081 ?auto_236086 ) ) ( not ( = ?auto_236081 ?auto_236087 ) ) ( not ( = ?auto_236081 ?auto_236088 ) ) ( not ( = ?auto_236081 ?auto_236089 ) ) ( not ( = ?auto_236081 ?auto_236090 ) ) ( not ( = ?auto_236081 ?auto_236091 ) ) ( not ( = ?auto_236082 ?auto_236083 ) ) ( not ( = ?auto_236082 ?auto_236084 ) ) ( not ( = ?auto_236082 ?auto_236085 ) ) ( not ( = ?auto_236082 ?auto_236086 ) ) ( not ( = ?auto_236082 ?auto_236087 ) ) ( not ( = ?auto_236082 ?auto_236088 ) ) ( not ( = ?auto_236082 ?auto_236089 ) ) ( not ( = ?auto_236082 ?auto_236090 ) ) ( not ( = ?auto_236082 ?auto_236091 ) ) ( not ( = ?auto_236083 ?auto_236084 ) ) ( not ( = ?auto_236083 ?auto_236085 ) ) ( not ( = ?auto_236083 ?auto_236086 ) ) ( not ( = ?auto_236083 ?auto_236087 ) ) ( not ( = ?auto_236083 ?auto_236088 ) ) ( not ( = ?auto_236083 ?auto_236089 ) ) ( not ( = ?auto_236083 ?auto_236090 ) ) ( not ( = ?auto_236083 ?auto_236091 ) ) ( not ( = ?auto_236084 ?auto_236085 ) ) ( not ( = ?auto_236084 ?auto_236086 ) ) ( not ( = ?auto_236084 ?auto_236087 ) ) ( not ( = ?auto_236084 ?auto_236088 ) ) ( not ( = ?auto_236084 ?auto_236089 ) ) ( not ( = ?auto_236084 ?auto_236090 ) ) ( not ( = ?auto_236084 ?auto_236091 ) ) ( not ( = ?auto_236085 ?auto_236086 ) ) ( not ( = ?auto_236085 ?auto_236087 ) ) ( not ( = ?auto_236085 ?auto_236088 ) ) ( not ( = ?auto_236085 ?auto_236089 ) ) ( not ( = ?auto_236085 ?auto_236090 ) ) ( not ( = ?auto_236085 ?auto_236091 ) ) ( not ( = ?auto_236086 ?auto_236087 ) ) ( not ( = ?auto_236086 ?auto_236088 ) ) ( not ( = ?auto_236086 ?auto_236089 ) ) ( not ( = ?auto_236086 ?auto_236090 ) ) ( not ( = ?auto_236086 ?auto_236091 ) ) ( not ( = ?auto_236087 ?auto_236088 ) ) ( not ( = ?auto_236087 ?auto_236089 ) ) ( not ( = ?auto_236087 ?auto_236090 ) ) ( not ( = ?auto_236087 ?auto_236091 ) ) ( not ( = ?auto_236088 ?auto_236089 ) ) ( not ( = ?auto_236088 ?auto_236090 ) ) ( not ( = ?auto_236088 ?auto_236091 ) ) ( not ( = ?auto_236089 ?auto_236090 ) ) ( not ( = ?auto_236089 ?auto_236091 ) ) ( not ( = ?auto_236090 ?auto_236091 ) ) ( CLEAR ?auto_236088 ) ( ON ?auto_236089 ?auto_236090 ) ( CLEAR ?auto_236089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_236078 ?auto_236079 ?auto_236080 ?auto_236081 ?auto_236082 ?auto_236083 ?auto_236084 ?auto_236085 ?auto_236086 ?auto_236087 ?auto_236088 ?auto_236089 )
      ( MAKE-13PILE ?auto_236078 ?auto_236079 ?auto_236080 ?auto_236081 ?auto_236082 ?auto_236083 ?auto_236084 ?auto_236085 ?auto_236086 ?auto_236087 ?auto_236088 ?auto_236089 ?auto_236090 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236105 - BLOCK
      ?auto_236106 - BLOCK
      ?auto_236107 - BLOCK
      ?auto_236108 - BLOCK
      ?auto_236109 - BLOCK
      ?auto_236110 - BLOCK
      ?auto_236111 - BLOCK
      ?auto_236112 - BLOCK
      ?auto_236113 - BLOCK
      ?auto_236114 - BLOCK
      ?auto_236115 - BLOCK
      ?auto_236116 - BLOCK
      ?auto_236117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236117 ) ( ON-TABLE ?auto_236105 ) ( ON ?auto_236106 ?auto_236105 ) ( ON ?auto_236107 ?auto_236106 ) ( ON ?auto_236108 ?auto_236107 ) ( ON ?auto_236109 ?auto_236108 ) ( ON ?auto_236110 ?auto_236109 ) ( ON ?auto_236111 ?auto_236110 ) ( ON ?auto_236112 ?auto_236111 ) ( ON ?auto_236113 ?auto_236112 ) ( ON ?auto_236114 ?auto_236113 ) ( ON ?auto_236115 ?auto_236114 ) ( not ( = ?auto_236105 ?auto_236106 ) ) ( not ( = ?auto_236105 ?auto_236107 ) ) ( not ( = ?auto_236105 ?auto_236108 ) ) ( not ( = ?auto_236105 ?auto_236109 ) ) ( not ( = ?auto_236105 ?auto_236110 ) ) ( not ( = ?auto_236105 ?auto_236111 ) ) ( not ( = ?auto_236105 ?auto_236112 ) ) ( not ( = ?auto_236105 ?auto_236113 ) ) ( not ( = ?auto_236105 ?auto_236114 ) ) ( not ( = ?auto_236105 ?auto_236115 ) ) ( not ( = ?auto_236105 ?auto_236116 ) ) ( not ( = ?auto_236105 ?auto_236117 ) ) ( not ( = ?auto_236106 ?auto_236107 ) ) ( not ( = ?auto_236106 ?auto_236108 ) ) ( not ( = ?auto_236106 ?auto_236109 ) ) ( not ( = ?auto_236106 ?auto_236110 ) ) ( not ( = ?auto_236106 ?auto_236111 ) ) ( not ( = ?auto_236106 ?auto_236112 ) ) ( not ( = ?auto_236106 ?auto_236113 ) ) ( not ( = ?auto_236106 ?auto_236114 ) ) ( not ( = ?auto_236106 ?auto_236115 ) ) ( not ( = ?auto_236106 ?auto_236116 ) ) ( not ( = ?auto_236106 ?auto_236117 ) ) ( not ( = ?auto_236107 ?auto_236108 ) ) ( not ( = ?auto_236107 ?auto_236109 ) ) ( not ( = ?auto_236107 ?auto_236110 ) ) ( not ( = ?auto_236107 ?auto_236111 ) ) ( not ( = ?auto_236107 ?auto_236112 ) ) ( not ( = ?auto_236107 ?auto_236113 ) ) ( not ( = ?auto_236107 ?auto_236114 ) ) ( not ( = ?auto_236107 ?auto_236115 ) ) ( not ( = ?auto_236107 ?auto_236116 ) ) ( not ( = ?auto_236107 ?auto_236117 ) ) ( not ( = ?auto_236108 ?auto_236109 ) ) ( not ( = ?auto_236108 ?auto_236110 ) ) ( not ( = ?auto_236108 ?auto_236111 ) ) ( not ( = ?auto_236108 ?auto_236112 ) ) ( not ( = ?auto_236108 ?auto_236113 ) ) ( not ( = ?auto_236108 ?auto_236114 ) ) ( not ( = ?auto_236108 ?auto_236115 ) ) ( not ( = ?auto_236108 ?auto_236116 ) ) ( not ( = ?auto_236108 ?auto_236117 ) ) ( not ( = ?auto_236109 ?auto_236110 ) ) ( not ( = ?auto_236109 ?auto_236111 ) ) ( not ( = ?auto_236109 ?auto_236112 ) ) ( not ( = ?auto_236109 ?auto_236113 ) ) ( not ( = ?auto_236109 ?auto_236114 ) ) ( not ( = ?auto_236109 ?auto_236115 ) ) ( not ( = ?auto_236109 ?auto_236116 ) ) ( not ( = ?auto_236109 ?auto_236117 ) ) ( not ( = ?auto_236110 ?auto_236111 ) ) ( not ( = ?auto_236110 ?auto_236112 ) ) ( not ( = ?auto_236110 ?auto_236113 ) ) ( not ( = ?auto_236110 ?auto_236114 ) ) ( not ( = ?auto_236110 ?auto_236115 ) ) ( not ( = ?auto_236110 ?auto_236116 ) ) ( not ( = ?auto_236110 ?auto_236117 ) ) ( not ( = ?auto_236111 ?auto_236112 ) ) ( not ( = ?auto_236111 ?auto_236113 ) ) ( not ( = ?auto_236111 ?auto_236114 ) ) ( not ( = ?auto_236111 ?auto_236115 ) ) ( not ( = ?auto_236111 ?auto_236116 ) ) ( not ( = ?auto_236111 ?auto_236117 ) ) ( not ( = ?auto_236112 ?auto_236113 ) ) ( not ( = ?auto_236112 ?auto_236114 ) ) ( not ( = ?auto_236112 ?auto_236115 ) ) ( not ( = ?auto_236112 ?auto_236116 ) ) ( not ( = ?auto_236112 ?auto_236117 ) ) ( not ( = ?auto_236113 ?auto_236114 ) ) ( not ( = ?auto_236113 ?auto_236115 ) ) ( not ( = ?auto_236113 ?auto_236116 ) ) ( not ( = ?auto_236113 ?auto_236117 ) ) ( not ( = ?auto_236114 ?auto_236115 ) ) ( not ( = ?auto_236114 ?auto_236116 ) ) ( not ( = ?auto_236114 ?auto_236117 ) ) ( not ( = ?auto_236115 ?auto_236116 ) ) ( not ( = ?auto_236115 ?auto_236117 ) ) ( not ( = ?auto_236116 ?auto_236117 ) ) ( CLEAR ?auto_236115 ) ( ON ?auto_236116 ?auto_236117 ) ( CLEAR ?auto_236116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_236105 ?auto_236106 ?auto_236107 ?auto_236108 ?auto_236109 ?auto_236110 ?auto_236111 ?auto_236112 ?auto_236113 ?auto_236114 ?auto_236115 ?auto_236116 )
      ( MAKE-13PILE ?auto_236105 ?auto_236106 ?auto_236107 ?auto_236108 ?auto_236109 ?auto_236110 ?auto_236111 ?auto_236112 ?auto_236113 ?auto_236114 ?auto_236115 ?auto_236116 ?auto_236117 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236131 - BLOCK
      ?auto_236132 - BLOCK
      ?auto_236133 - BLOCK
      ?auto_236134 - BLOCK
      ?auto_236135 - BLOCK
      ?auto_236136 - BLOCK
      ?auto_236137 - BLOCK
      ?auto_236138 - BLOCK
      ?auto_236139 - BLOCK
      ?auto_236140 - BLOCK
      ?auto_236141 - BLOCK
      ?auto_236142 - BLOCK
      ?auto_236143 - BLOCK
    )
    :vars
    (
      ?auto_236144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236143 ?auto_236144 ) ( ON-TABLE ?auto_236131 ) ( ON ?auto_236132 ?auto_236131 ) ( ON ?auto_236133 ?auto_236132 ) ( ON ?auto_236134 ?auto_236133 ) ( ON ?auto_236135 ?auto_236134 ) ( ON ?auto_236136 ?auto_236135 ) ( ON ?auto_236137 ?auto_236136 ) ( ON ?auto_236138 ?auto_236137 ) ( ON ?auto_236139 ?auto_236138 ) ( ON ?auto_236140 ?auto_236139 ) ( not ( = ?auto_236131 ?auto_236132 ) ) ( not ( = ?auto_236131 ?auto_236133 ) ) ( not ( = ?auto_236131 ?auto_236134 ) ) ( not ( = ?auto_236131 ?auto_236135 ) ) ( not ( = ?auto_236131 ?auto_236136 ) ) ( not ( = ?auto_236131 ?auto_236137 ) ) ( not ( = ?auto_236131 ?auto_236138 ) ) ( not ( = ?auto_236131 ?auto_236139 ) ) ( not ( = ?auto_236131 ?auto_236140 ) ) ( not ( = ?auto_236131 ?auto_236141 ) ) ( not ( = ?auto_236131 ?auto_236142 ) ) ( not ( = ?auto_236131 ?auto_236143 ) ) ( not ( = ?auto_236131 ?auto_236144 ) ) ( not ( = ?auto_236132 ?auto_236133 ) ) ( not ( = ?auto_236132 ?auto_236134 ) ) ( not ( = ?auto_236132 ?auto_236135 ) ) ( not ( = ?auto_236132 ?auto_236136 ) ) ( not ( = ?auto_236132 ?auto_236137 ) ) ( not ( = ?auto_236132 ?auto_236138 ) ) ( not ( = ?auto_236132 ?auto_236139 ) ) ( not ( = ?auto_236132 ?auto_236140 ) ) ( not ( = ?auto_236132 ?auto_236141 ) ) ( not ( = ?auto_236132 ?auto_236142 ) ) ( not ( = ?auto_236132 ?auto_236143 ) ) ( not ( = ?auto_236132 ?auto_236144 ) ) ( not ( = ?auto_236133 ?auto_236134 ) ) ( not ( = ?auto_236133 ?auto_236135 ) ) ( not ( = ?auto_236133 ?auto_236136 ) ) ( not ( = ?auto_236133 ?auto_236137 ) ) ( not ( = ?auto_236133 ?auto_236138 ) ) ( not ( = ?auto_236133 ?auto_236139 ) ) ( not ( = ?auto_236133 ?auto_236140 ) ) ( not ( = ?auto_236133 ?auto_236141 ) ) ( not ( = ?auto_236133 ?auto_236142 ) ) ( not ( = ?auto_236133 ?auto_236143 ) ) ( not ( = ?auto_236133 ?auto_236144 ) ) ( not ( = ?auto_236134 ?auto_236135 ) ) ( not ( = ?auto_236134 ?auto_236136 ) ) ( not ( = ?auto_236134 ?auto_236137 ) ) ( not ( = ?auto_236134 ?auto_236138 ) ) ( not ( = ?auto_236134 ?auto_236139 ) ) ( not ( = ?auto_236134 ?auto_236140 ) ) ( not ( = ?auto_236134 ?auto_236141 ) ) ( not ( = ?auto_236134 ?auto_236142 ) ) ( not ( = ?auto_236134 ?auto_236143 ) ) ( not ( = ?auto_236134 ?auto_236144 ) ) ( not ( = ?auto_236135 ?auto_236136 ) ) ( not ( = ?auto_236135 ?auto_236137 ) ) ( not ( = ?auto_236135 ?auto_236138 ) ) ( not ( = ?auto_236135 ?auto_236139 ) ) ( not ( = ?auto_236135 ?auto_236140 ) ) ( not ( = ?auto_236135 ?auto_236141 ) ) ( not ( = ?auto_236135 ?auto_236142 ) ) ( not ( = ?auto_236135 ?auto_236143 ) ) ( not ( = ?auto_236135 ?auto_236144 ) ) ( not ( = ?auto_236136 ?auto_236137 ) ) ( not ( = ?auto_236136 ?auto_236138 ) ) ( not ( = ?auto_236136 ?auto_236139 ) ) ( not ( = ?auto_236136 ?auto_236140 ) ) ( not ( = ?auto_236136 ?auto_236141 ) ) ( not ( = ?auto_236136 ?auto_236142 ) ) ( not ( = ?auto_236136 ?auto_236143 ) ) ( not ( = ?auto_236136 ?auto_236144 ) ) ( not ( = ?auto_236137 ?auto_236138 ) ) ( not ( = ?auto_236137 ?auto_236139 ) ) ( not ( = ?auto_236137 ?auto_236140 ) ) ( not ( = ?auto_236137 ?auto_236141 ) ) ( not ( = ?auto_236137 ?auto_236142 ) ) ( not ( = ?auto_236137 ?auto_236143 ) ) ( not ( = ?auto_236137 ?auto_236144 ) ) ( not ( = ?auto_236138 ?auto_236139 ) ) ( not ( = ?auto_236138 ?auto_236140 ) ) ( not ( = ?auto_236138 ?auto_236141 ) ) ( not ( = ?auto_236138 ?auto_236142 ) ) ( not ( = ?auto_236138 ?auto_236143 ) ) ( not ( = ?auto_236138 ?auto_236144 ) ) ( not ( = ?auto_236139 ?auto_236140 ) ) ( not ( = ?auto_236139 ?auto_236141 ) ) ( not ( = ?auto_236139 ?auto_236142 ) ) ( not ( = ?auto_236139 ?auto_236143 ) ) ( not ( = ?auto_236139 ?auto_236144 ) ) ( not ( = ?auto_236140 ?auto_236141 ) ) ( not ( = ?auto_236140 ?auto_236142 ) ) ( not ( = ?auto_236140 ?auto_236143 ) ) ( not ( = ?auto_236140 ?auto_236144 ) ) ( not ( = ?auto_236141 ?auto_236142 ) ) ( not ( = ?auto_236141 ?auto_236143 ) ) ( not ( = ?auto_236141 ?auto_236144 ) ) ( not ( = ?auto_236142 ?auto_236143 ) ) ( not ( = ?auto_236142 ?auto_236144 ) ) ( not ( = ?auto_236143 ?auto_236144 ) ) ( ON ?auto_236142 ?auto_236143 ) ( CLEAR ?auto_236140 ) ( ON ?auto_236141 ?auto_236142 ) ( CLEAR ?auto_236141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_236131 ?auto_236132 ?auto_236133 ?auto_236134 ?auto_236135 ?auto_236136 ?auto_236137 ?auto_236138 ?auto_236139 ?auto_236140 ?auto_236141 )
      ( MAKE-13PILE ?auto_236131 ?auto_236132 ?auto_236133 ?auto_236134 ?auto_236135 ?auto_236136 ?auto_236137 ?auto_236138 ?auto_236139 ?auto_236140 ?auto_236141 ?auto_236142 ?auto_236143 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236158 - BLOCK
      ?auto_236159 - BLOCK
      ?auto_236160 - BLOCK
      ?auto_236161 - BLOCK
      ?auto_236162 - BLOCK
      ?auto_236163 - BLOCK
      ?auto_236164 - BLOCK
      ?auto_236165 - BLOCK
      ?auto_236166 - BLOCK
      ?auto_236167 - BLOCK
      ?auto_236168 - BLOCK
      ?auto_236169 - BLOCK
      ?auto_236170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236170 ) ( ON-TABLE ?auto_236158 ) ( ON ?auto_236159 ?auto_236158 ) ( ON ?auto_236160 ?auto_236159 ) ( ON ?auto_236161 ?auto_236160 ) ( ON ?auto_236162 ?auto_236161 ) ( ON ?auto_236163 ?auto_236162 ) ( ON ?auto_236164 ?auto_236163 ) ( ON ?auto_236165 ?auto_236164 ) ( ON ?auto_236166 ?auto_236165 ) ( ON ?auto_236167 ?auto_236166 ) ( not ( = ?auto_236158 ?auto_236159 ) ) ( not ( = ?auto_236158 ?auto_236160 ) ) ( not ( = ?auto_236158 ?auto_236161 ) ) ( not ( = ?auto_236158 ?auto_236162 ) ) ( not ( = ?auto_236158 ?auto_236163 ) ) ( not ( = ?auto_236158 ?auto_236164 ) ) ( not ( = ?auto_236158 ?auto_236165 ) ) ( not ( = ?auto_236158 ?auto_236166 ) ) ( not ( = ?auto_236158 ?auto_236167 ) ) ( not ( = ?auto_236158 ?auto_236168 ) ) ( not ( = ?auto_236158 ?auto_236169 ) ) ( not ( = ?auto_236158 ?auto_236170 ) ) ( not ( = ?auto_236159 ?auto_236160 ) ) ( not ( = ?auto_236159 ?auto_236161 ) ) ( not ( = ?auto_236159 ?auto_236162 ) ) ( not ( = ?auto_236159 ?auto_236163 ) ) ( not ( = ?auto_236159 ?auto_236164 ) ) ( not ( = ?auto_236159 ?auto_236165 ) ) ( not ( = ?auto_236159 ?auto_236166 ) ) ( not ( = ?auto_236159 ?auto_236167 ) ) ( not ( = ?auto_236159 ?auto_236168 ) ) ( not ( = ?auto_236159 ?auto_236169 ) ) ( not ( = ?auto_236159 ?auto_236170 ) ) ( not ( = ?auto_236160 ?auto_236161 ) ) ( not ( = ?auto_236160 ?auto_236162 ) ) ( not ( = ?auto_236160 ?auto_236163 ) ) ( not ( = ?auto_236160 ?auto_236164 ) ) ( not ( = ?auto_236160 ?auto_236165 ) ) ( not ( = ?auto_236160 ?auto_236166 ) ) ( not ( = ?auto_236160 ?auto_236167 ) ) ( not ( = ?auto_236160 ?auto_236168 ) ) ( not ( = ?auto_236160 ?auto_236169 ) ) ( not ( = ?auto_236160 ?auto_236170 ) ) ( not ( = ?auto_236161 ?auto_236162 ) ) ( not ( = ?auto_236161 ?auto_236163 ) ) ( not ( = ?auto_236161 ?auto_236164 ) ) ( not ( = ?auto_236161 ?auto_236165 ) ) ( not ( = ?auto_236161 ?auto_236166 ) ) ( not ( = ?auto_236161 ?auto_236167 ) ) ( not ( = ?auto_236161 ?auto_236168 ) ) ( not ( = ?auto_236161 ?auto_236169 ) ) ( not ( = ?auto_236161 ?auto_236170 ) ) ( not ( = ?auto_236162 ?auto_236163 ) ) ( not ( = ?auto_236162 ?auto_236164 ) ) ( not ( = ?auto_236162 ?auto_236165 ) ) ( not ( = ?auto_236162 ?auto_236166 ) ) ( not ( = ?auto_236162 ?auto_236167 ) ) ( not ( = ?auto_236162 ?auto_236168 ) ) ( not ( = ?auto_236162 ?auto_236169 ) ) ( not ( = ?auto_236162 ?auto_236170 ) ) ( not ( = ?auto_236163 ?auto_236164 ) ) ( not ( = ?auto_236163 ?auto_236165 ) ) ( not ( = ?auto_236163 ?auto_236166 ) ) ( not ( = ?auto_236163 ?auto_236167 ) ) ( not ( = ?auto_236163 ?auto_236168 ) ) ( not ( = ?auto_236163 ?auto_236169 ) ) ( not ( = ?auto_236163 ?auto_236170 ) ) ( not ( = ?auto_236164 ?auto_236165 ) ) ( not ( = ?auto_236164 ?auto_236166 ) ) ( not ( = ?auto_236164 ?auto_236167 ) ) ( not ( = ?auto_236164 ?auto_236168 ) ) ( not ( = ?auto_236164 ?auto_236169 ) ) ( not ( = ?auto_236164 ?auto_236170 ) ) ( not ( = ?auto_236165 ?auto_236166 ) ) ( not ( = ?auto_236165 ?auto_236167 ) ) ( not ( = ?auto_236165 ?auto_236168 ) ) ( not ( = ?auto_236165 ?auto_236169 ) ) ( not ( = ?auto_236165 ?auto_236170 ) ) ( not ( = ?auto_236166 ?auto_236167 ) ) ( not ( = ?auto_236166 ?auto_236168 ) ) ( not ( = ?auto_236166 ?auto_236169 ) ) ( not ( = ?auto_236166 ?auto_236170 ) ) ( not ( = ?auto_236167 ?auto_236168 ) ) ( not ( = ?auto_236167 ?auto_236169 ) ) ( not ( = ?auto_236167 ?auto_236170 ) ) ( not ( = ?auto_236168 ?auto_236169 ) ) ( not ( = ?auto_236168 ?auto_236170 ) ) ( not ( = ?auto_236169 ?auto_236170 ) ) ( ON ?auto_236169 ?auto_236170 ) ( CLEAR ?auto_236167 ) ( ON ?auto_236168 ?auto_236169 ) ( CLEAR ?auto_236168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_236158 ?auto_236159 ?auto_236160 ?auto_236161 ?auto_236162 ?auto_236163 ?auto_236164 ?auto_236165 ?auto_236166 ?auto_236167 ?auto_236168 )
      ( MAKE-13PILE ?auto_236158 ?auto_236159 ?auto_236160 ?auto_236161 ?auto_236162 ?auto_236163 ?auto_236164 ?auto_236165 ?auto_236166 ?auto_236167 ?auto_236168 ?auto_236169 ?auto_236170 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236184 - BLOCK
      ?auto_236185 - BLOCK
      ?auto_236186 - BLOCK
      ?auto_236187 - BLOCK
      ?auto_236188 - BLOCK
      ?auto_236189 - BLOCK
      ?auto_236190 - BLOCK
      ?auto_236191 - BLOCK
      ?auto_236192 - BLOCK
      ?auto_236193 - BLOCK
      ?auto_236194 - BLOCK
      ?auto_236195 - BLOCK
      ?auto_236196 - BLOCK
    )
    :vars
    (
      ?auto_236197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236196 ?auto_236197 ) ( ON-TABLE ?auto_236184 ) ( ON ?auto_236185 ?auto_236184 ) ( ON ?auto_236186 ?auto_236185 ) ( ON ?auto_236187 ?auto_236186 ) ( ON ?auto_236188 ?auto_236187 ) ( ON ?auto_236189 ?auto_236188 ) ( ON ?auto_236190 ?auto_236189 ) ( ON ?auto_236191 ?auto_236190 ) ( ON ?auto_236192 ?auto_236191 ) ( not ( = ?auto_236184 ?auto_236185 ) ) ( not ( = ?auto_236184 ?auto_236186 ) ) ( not ( = ?auto_236184 ?auto_236187 ) ) ( not ( = ?auto_236184 ?auto_236188 ) ) ( not ( = ?auto_236184 ?auto_236189 ) ) ( not ( = ?auto_236184 ?auto_236190 ) ) ( not ( = ?auto_236184 ?auto_236191 ) ) ( not ( = ?auto_236184 ?auto_236192 ) ) ( not ( = ?auto_236184 ?auto_236193 ) ) ( not ( = ?auto_236184 ?auto_236194 ) ) ( not ( = ?auto_236184 ?auto_236195 ) ) ( not ( = ?auto_236184 ?auto_236196 ) ) ( not ( = ?auto_236184 ?auto_236197 ) ) ( not ( = ?auto_236185 ?auto_236186 ) ) ( not ( = ?auto_236185 ?auto_236187 ) ) ( not ( = ?auto_236185 ?auto_236188 ) ) ( not ( = ?auto_236185 ?auto_236189 ) ) ( not ( = ?auto_236185 ?auto_236190 ) ) ( not ( = ?auto_236185 ?auto_236191 ) ) ( not ( = ?auto_236185 ?auto_236192 ) ) ( not ( = ?auto_236185 ?auto_236193 ) ) ( not ( = ?auto_236185 ?auto_236194 ) ) ( not ( = ?auto_236185 ?auto_236195 ) ) ( not ( = ?auto_236185 ?auto_236196 ) ) ( not ( = ?auto_236185 ?auto_236197 ) ) ( not ( = ?auto_236186 ?auto_236187 ) ) ( not ( = ?auto_236186 ?auto_236188 ) ) ( not ( = ?auto_236186 ?auto_236189 ) ) ( not ( = ?auto_236186 ?auto_236190 ) ) ( not ( = ?auto_236186 ?auto_236191 ) ) ( not ( = ?auto_236186 ?auto_236192 ) ) ( not ( = ?auto_236186 ?auto_236193 ) ) ( not ( = ?auto_236186 ?auto_236194 ) ) ( not ( = ?auto_236186 ?auto_236195 ) ) ( not ( = ?auto_236186 ?auto_236196 ) ) ( not ( = ?auto_236186 ?auto_236197 ) ) ( not ( = ?auto_236187 ?auto_236188 ) ) ( not ( = ?auto_236187 ?auto_236189 ) ) ( not ( = ?auto_236187 ?auto_236190 ) ) ( not ( = ?auto_236187 ?auto_236191 ) ) ( not ( = ?auto_236187 ?auto_236192 ) ) ( not ( = ?auto_236187 ?auto_236193 ) ) ( not ( = ?auto_236187 ?auto_236194 ) ) ( not ( = ?auto_236187 ?auto_236195 ) ) ( not ( = ?auto_236187 ?auto_236196 ) ) ( not ( = ?auto_236187 ?auto_236197 ) ) ( not ( = ?auto_236188 ?auto_236189 ) ) ( not ( = ?auto_236188 ?auto_236190 ) ) ( not ( = ?auto_236188 ?auto_236191 ) ) ( not ( = ?auto_236188 ?auto_236192 ) ) ( not ( = ?auto_236188 ?auto_236193 ) ) ( not ( = ?auto_236188 ?auto_236194 ) ) ( not ( = ?auto_236188 ?auto_236195 ) ) ( not ( = ?auto_236188 ?auto_236196 ) ) ( not ( = ?auto_236188 ?auto_236197 ) ) ( not ( = ?auto_236189 ?auto_236190 ) ) ( not ( = ?auto_236189 ?auto_236191 ) ) ( not ( = ?auto_236189 ?auto_236192 ) ) ( not ( = ?auto_236189 ?auto_236193 ) ) ( not ( = ?auto_236189 ?auto_236194 ) ) ( not ( = ?auto_236189 ?auto_236195 ) ) ( not ( = ?auto_236189 ?auto_236196 ) ) ( not ( = ?auto_236189 ?auto_236197 ) ) ( not ( = ?auto_236190 ?auto_236191 ) ) ( not ( = ?auto_236190 ?auto_236192 ) ) ( not ( = ?auto_236190 ?auto_236193 ) ) ( not ( = ?auto_236190 ?auto_236194 ) ) ( not ( = ?auto_236190 ?auto_236195 ) ) ( not ( = ?auto_236190 ?auto_236196 ) ) ( not ( = ?auto_236190 ?auto_236197 ) ) ( not ( = ?auto_236191 ?auto_236192 ) ) ( not ( = ?auto_236191 ?auto_236193 ) ) ( not ( = ?auto_236191 ?auto_236194 ) ) ( not ( = ?auto_236191 ?auto_236195 ) ) ( not ( = ?auto_236191 ?auto_236196 ) ) ( not ( = ?auto_236191 ?auto_236197 ) ) ( not ( = ?auto_236192 ?auto_236193 ) ) ( not ( = ?auto_236192 ?auto_236194 ) ) ( not ( = ?auto_236192 ?auto_236195 ) ) ( not ( = ?auto_236192 ?auto_236196 ) ) ( not ( = ?auto_236192 ?auto_236197 ) ) ( not ( = ?auto_236193 ?auto_236194 ) ) ( not ( = ?auto_236193 ?auto_236195 ) ) ( not ( = ?auto_236193 ?auto_236196 ) ) ( not ( = ?auto_236193 ?auto_236197 ) ) ( not ( = ?auto_236194 ?auto_236195 ) ) ( not ( = ?auto_236194 ?auto_236196 ) ) ( not ( = ?auto_236194 ?auto_236197 ) ) ( not ( = ?auto_236195 ?auto_236196 ) ) ( not ( = ?auto_236195 ?auto_236197 ) ) ( not ( = ?auto_236196 ?auto_236197 ) ) ( ON ?auto_236195 ?auto_236196 ) ( ON ?auto_236194 ?auto_236195 ) ( CLEAR ?auto_236192 ) ( ON ?auto_236193 ?auto_236194 ) ( CLEAR ?auto_236193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_236184 ?auto_236185 ?auto_236186 ?auto_236187 ?auto_236188 ?auto_236189 ?auto_236190 ?auto_236191 ?auto_236192 ?auto_236193 )
      ( MAKE-13PILE ?auto_236184 ?auto_236185 ?auto_236186 ?auto_236187 ?auto_236188 ?auto_236189 ?auto_236190 ?auto_236191 ?auto_236192 ?auto_236193 ?auto_236194 ?auto_236195 ?auto_236196 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236211 - BLOCK
      ?auto_236212 - BLOCK
      ?auto_236213 - BLOCK
      ?auto_236214 - BLOCK
      ?auto_236215 - BLOCK
      ?auto_236216 - BLOCK
      ?auto_236217 - BLOCK
      ?auto_236218 - BLOCK
      ?auto_236219 - BLOCK
      ?auto_236220 - BLOCK
      ?auto_236221 - BLOCK
      ?auto_236222 - BLOCK
      ?auto_236223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236223 ) ( ON-TABLE ?auto_236211 ) ( ON ?auto_236212 ?auto_236211 ) ( ON ?auto_236213 ?auto_236212 ) ( ON ?auto_236214 ?auto_236213 ) ( ON ?auto_236215 ?auto_236214 ) ( ON ?auto_236216 ?auto_236215 ) ( ON ?auto_236217 ?auto_236216 ) ( ON ?auto_236218 ?auto_236217 ) ( ON ?auto_236219 ?auto_236218 ) ( not ( = ?auto_236211 ?auto_236212 ) ) ( not ( = ?auto_236211 ?auto_236213 ) ) ( not ( = ?auto_236211 ?auto_236214 ) ) ( not ( = ?auto_236211 ?auto_236215 ) ) ( not ( = ?auto_236211 ?auto_236216 ) ) ( not ( = ?auto_236211 ?auto_236217 ) ) ( not ( = ?auto_236211 ?auto_236218 ) ) ( not ( = ?auto_236211 ?auto_236219 ) ) ( not ( = ?auto_236211 ?auto_236220 ) ) ( not ( = ?auto_236211 ?auto_236221 ) ) ( not ( = ?auto_236211 ?auto_236222 ) ) ( not ( = ?auto_236211 ?auto_236223 ) ) ( not ( = ?auto_236212 ?auto_236213 ) ) ( not ( = ?auto_236212 ?auto_236214 ) ) ( not ( = ?auto_236212 ?auto_236215 ) ) ( not ( = ?auto_236212 ?auto_236216 ) ) ( not ( = ?auto_236212 ?auto_236217 ) ) ( not ( = ?auto_236212 ?auto_236218 ) ) ( not ( = ?auto_236212 ?auto_236219 ) ) ( not ( = ?auto_236212 ?auto_236220 ) ) ( not ( = ?auto_236212 ?auto_236221 ) ) ( not ( = ?auto_236212 ?auto_236222 ) ) ( not ( = ?auto_236212 ?auto_236223 ) ) ( not ( = ?auto_236213 ?auto_236214 ) ) ( not ( = ?auto_236213 ?auto_236215 ) ) ( not ( = ?auto_236213 ?auto_236216 ) ) ( not ( = ?auto_236213 ?auto_236217 ) ) ( not ( = ?auto_236213 ?auto_236218 ) ) ( not ( = ?auto_236213 ?auto_236219 ) ) ( not ( = ?auto_236213 ?auto_236220 ) ) ( not ( = ?auto_236213 ?auto_236221 ) ) ( not ( = ?auto_236213 ?auto_236222 ) ) ( not ( = ?auto_236213 ?auto_236223 ) ) ( not ( = ?auto_236214 ?auto_236215 ) ) ( not ( = ?auto_236214 ?auto_236216 ) ) ( not ( = ?auto_236214 ?auto_236217 ) ) ( not ( = ?auto_236214 ?auto_236218 ) ) ( not ( = ?auto_236214 ?auto_236219 ) ) ( not ( = ?auto_236214 ?auto_236220 ) ) ( not ( = ?auto_236214 ?auto_236221 ) ) ( not ( = ?auto_236214 ?auto_236222 ) ) ( not ( = ?auto_236214 ?auto_236223 ) ) ( not ( = ?auto_236215 ?auto_236216 ) ) ( not ( = ?auto_236215 ?auto_236217 ) ) ( not ( = ?auto_236215 ?auto_236218 ) ) ( not ( = ?auto_236215 ?auto_236219 ) ) ( not ( = ?auto_236215 ?auto_236220 ) ) ( not ( = ?auto_236215 ?auto_236221 ) ) ( not ( = ?auto_236215 ?auto_236222 ) ) ( not ( = ?auto_236215 ?auto_236223 ) ) ( not ( = ?auto_236216 ?auto_236217 ) ) ( not ( = ?auto_236216 ?auto_236218 ) ) ( not ( = ?auto_236216 ?auto_236219 ) ) ( not ( = ?auto_236216 ?auto_236220 ) ) ( not ( = ?auto_236216 ?auto_236221 ) ) ( not ( = ?auto_236216 ?auto_236222 ) ) ( not ( = ?auto_236216 ?auto_236223 ) ) ( not ( = ?auto_236217 ?auto_236218 ) ) ( not ( = ?auto_236217 ?auto_236219 ) ) ( not ( = ?auto_236217 ?auto_236220 ) ) ( not ( = ?auto_236217 ?auto_236221 ) ) ( not ( = ?auto_236217 ?auto_236222 ) ) ( not ( = ?auto_236217 ?auto_236223 ) ) ( not ( = ?auto_236218 ?auto_236219 ) ) ( not ( = ?auto_236218 ?auto_236220 ) ) ( not ( = ?auto_236218 ?auto_236221 ) ) ( not ( = ?auto_236218 ?auto_236222 ) ) ( not ( = ?auto_236218 ?auto_236223 ) ) ( not ( = ?auto_236219 ?auto_236220 ) ) ( not ( = ?auto_236219 ?auto_236221 ) ) ( not ( = ?auto_236219 ?auto_236222 ) ) ( not ( = ?auto_236219 ?auto_236223 ) ) ( not ( = ?auto_236220 ?auto_236221 ) ) ( not ( = ?auto_236220 ?auto_236222 ) ) ( not ( = ?auto_236220 ?auto_236223 ) ) ( not ( = ?auto_236221 ?auto_236222 ) ) ( not ( = ?auto_236221 ?auto_236223 ) ) ( not ( = ?auto_236222 ?auto_236223 ) ) ( ON ?auto_236222 ?auto_236223 ) ( ON ?auto_236221 ?auto_236222 ) ( CLEAR ?auto_236219 ) ( ON ?auto_236220 ?auto_236221 ) ( CLEAR ?auto_236220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_236211 ?auto_236212 ?auto_236213 ?auto_236214 ?auto_236215 ?auto_236216 ?auto_236217 ?auto_236218 ?auto_236219 ?auto_236220 )
      ( MAKE-13PILE ?auto_236211 ?auto_236212 ?auto_236213 ?auto_236214 ?auto_236215 ?auto_236216 ?auto_236217 ?auto_236218 ?auto_236219 ?auto_236220 ?auto_236221 ?auto_236222 ?auto_236223 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236237 - BLOCK
      ?auto_236238 - BLOCK
      ?auto_236239 - BLOCK
      ?auto_236240 - BLOCK
      ?auto_236241 - BLOCK
      ?auto_236242 - BLOCK
      ?auto_236243 - BLOCK
      ?auto_236244 - BLOCK
      ?auto_236245 - BLOCK
      ?auto_236246 - BLOCK
      ?auto_236247 - BLOCK
      ?auto_236248 - BLOCK
      ?auto_236249 - BLOCK
    )
    :vars
    (
      ?auto_236250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236249 ?auto_236250 ) ( ON-TABLE ?auto_236237 ) ( ON ?auto_236238 ?auto_236237 ) ( ON ?auto_236239 ?auto_236238 ) ( ON ?auto_236240 ?auto_236239 ) ( ON ?auto_236241 ?auto_236240 ) ( ON ?auto_236242 ?auto_236241 ) ( ON ?auto_236243 ?auto_236242 ) ( ON ?auto_236244 ?auto_236243 ) ( not ( = ?auto_236237 ?auto_236238 ) ) ( not ( = ?auto_236237 ?auto_236239 ) ) ( not ( = ?auto_236237 ?auto_236240 ) ) ( not ( = ?auto_236237 ?auto_236241 ) ) ( not ( = ?auto_236237 ?auto_236242 ) ) ( not ( = ?auto_236237 ?auto_236243 ) ) ( not ( = ?auto_236237 ?auto_236244 ) ) ( not ( = ?auto_236237 ?auto_236245 ) ) ( not ( = ?auto_236237 ?auto_236246 ) ) ( not ( = ?auto_236237 ?auto_236247 ) ) ( not ( = ?auto_236237 ?auto_236248 ) ) ( not ( = ?auto_236237 ?auto_236249 ) ) ( not ( = ?auto_236237 ?auto_236250 ) ) ( not ( = ?auto_236238 ?auto_236239 ) ) ( not ( = ?auto_236238 ?auto_236240 ) ) ( not ( = ?auto_236238 ?auto_236241 ) ) ( not ( = ?auto_236238 ?auto_236242 ) ) ( not ( = ?auto_236238 ?auto_236243 ) ) ( not ( = ?auto_236238 ?auto_236244 ) ) ( not ( = ?auto_236238 ?auto_236245 ) ) ( not ( = ?auto_236238 ?auto_236246 ) ) ( not ( = ?auto_236238 ?auto_236247 ) ) ( not ( = ?auto_236238 ?auto_236248 ) ) ( not ( = ?auto_236238 ?auto_236249 ) ) ( not ( = ?auto_236238 ?auto_236250 ) ) ( not ( = ?auto_236239 ?auto_236240 ) ) ( not ( = ?auto_236239 ?auto_236241 ) ) ( not ( = ?auto_236239 ?auto_236242 ) ) ( not ( = ?auto_236239 ?auto_236243 ) ) ( not ( = ?auto_236239 ?auto_236244 ) ) ( not ( = ?auto_236239 ?auto_236245 ) ) ( not ( = ?auto_236239 ?auto_236246 ) ) ( not ( = ?auto_236239 ?auto_236247 ) ) ( not ( = ?auto_236239 ?auto_236248 ) ) ( not ( = ?auto_236239 ?auto_236249 ) ) ( not ( = ?auto_236239 ?auto_236250 ) ) ( not ( = ?auto_236240 ?auto_236241 ) ) ( not ( = ?auto_236240 ?auto_236242 ) ) ( not ( = ?auto_236240 ?auto_236243 ) ) ( not ( = ?auto_236240 ?auto_236244 ) ) ( not ( = ?auto_236240 ?auto_236245 ) ) ( not ( = ?auto_236240 ?auto_236246 ) ) ( not ( = ?auto_236240 ?auto_236247 ) ) ( not ( = ?auto_236240 ?auto_236248 ) ) ( not ( = ?auto_236240 ?auto_236249 ) ) ( not ( = ?auto_236240 ?auto_236250 ) ) ( not ( = ?auto_236241 ?auto_236242 ) ) ( not ( = ?auto_236241 ?auto_236243 ) ) ( not ( = ?auto_236241 ?auto_236244 ) ) ( not ( = ?auto_236241 ?auto_236245 ) ) ( not ( = ?auto_236241 ?auto_236246 ) ) ( not ( = ?auto_236241 ?auto_236247 ) ) ( not ( = ?auto_236241 ?auto_236248 ) ) ( not ( = ?auto_236241 ?auto_236249 ) ) ( not ( = ?auto_236241 ?auto_236250 ) ) ( not ( = ?auto_236242 ?auto_236243 ) ) ( not ( = ?auto_236242 ?auto_236244 ) ) ( not ( = ?auto_236242 ?auto_236245 ) ) ( not ( = ?auto_236242 ?auto_236246 ) ) ( not ( = ?auto_236242 ?auto_236247 ) ) ( not ( = ?auto_236242 ?auto_236248 ) ) ( not ( = ?auto_236242 ?auto_236249 ) ) ( not ( = ?auto_236242 ?auto_236250 ) ) ( not ( = ?auto_236243 ?auto_236244 ) ) ( not ( = ?auto_236243 ?auto_236245 ) ) ( not ( = ?auto_236243 ?auto_236246 ) ) ( not ( = ?auto_236243 ?auto_236247 ) ) ( not ( = ?auto_236243 ?auto_236248 ) ) ( not ( = ?auto_236243 ?auto_236249 ) ) ( not ( = ?auto_236243 ?auto_236250 ) ) ( not ( = ?auto_236244 ?auto_236245 ) ) ( not ( = ?auto_236244 ?auto_236246 ) ) ( not ( = ?auto_236244 ?auto_236247 ) ) ( not ( = ?auto_236244 ?auto_236248 ) ) ( not ( = ?auto_236244 ?auto_236249 ) ) ( not ( = ?auto_236244 ?auto_236250 ) ) ( not ( = ?auto_236245 ?auto_236246 ) ) ( not ( = ?auto_236245 ?auto_236247 ) ) ( not ( = ?auto_236245 ?auto_236248 ) ) ( not ( = ?auto_236245 ?auto_236249 ) ) ( not ( = ?auto_236245 ?auto_236250 ) ) ( not ( = ?auto_236246 ?auto_236247 ) ) ( not ( = ?auto_236246 ?auto_236248 ) ) ( not ( = ?auto_236246 ?auto_236249 ) ) ( not ( = ?auto_236246 ?auto_236250 ) ) ( not ( = ?auto_236247 ?auto_236248 ) ) ( not ( = ?auto_236247 ?auto_236249 ) ) ( not ( = ?auto_236247 ?auto_236250 ) ) ( not ( = ?auto_236248 ?auto_236249 ) ) ( not ( = ?auto_236248 ?auto_236250 ) ) ( not ( = ?auto_236249 ?auto_236250 ) ) ( ON ?auto_236248 ?auto_236249 ) ( ON ?auto_236247 ?auto_236248 ) ( ON ?auto_236246 ?auto_236247 ) ( CLEAR ?auto_236244 ) ( ON ?auto_236245 ?auto_236246 ) ( CLEAR ?auto_236245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_236237 ?auto_236238 ?auto_236239 ?auto_236240 ?auto_236241 ?auto_236242 ?auto_236243 ?auto_236244 ?auto_236245 )
      ( MAKE-13PILE ?auto_236237 ?auto_236238 ?auto_236239 ?auto_236240 ?auto_236241 ?auto_236242 ?auto_236243 ?auto_236244 ?auto_236245 ?auto_236246 ?auto_236247 ?auto_236248 ?auto_236249 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236264 - BLOCK
      ?auto_236265 - BLOCK
      ?auto_236266 - BLOCK
      ?auto_236267 - BLOCK
      ?auto_236268 - BLOCK
      ?auto_236269 - BLOCK
      ?auto_236270 - BLOCK
      ?auto_236271 - BLOCK
      ?auto_236272 - BLOCK
      ?auto_236273 - BLOCK
      ?auto_236274 - BLOCK
      ?auto_236275 - BLOCK
      ?auto_236276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236276 ) ( ON-TABLE ?auto_236264 ) ( ON ?auto_236265 ?auto_236264 ) ( ON ?auto_236266 ?auto_236265 ) ( ON ?auto_236267 ?auto_236266 ) ( ON ?auto_236268 ?auto_236267 ) ( ON ?auto_236269 ?auto_236268 ) ( ON ?auto_236270 ?auto_236269 ) ( ON ?auto_236271 ?auto_236270 ) ( not ( = ?auto_236264 ?auto_236265 ) ) ( not ( = ?auto_236264 ?auto_236266 ) ) ( not ( = ?auto_236264 ?auto_236267 ) ) ( not ( = ?auto_236264 ?auto_236268 ) ) ( not ( = ?auto_236264 ?auto_236269 ) ) ( not ( = ?auto_236264 ?auto_236270 ) ) ( not ( = ?auto_236264 ?auto_236271 ) ) ( not ( = ?auto_236264 ?auto_236272 ) ) ( not ( = ?auto_236264 ?auto_236273 ) ) ( not ( = ?auto_236264 ?auto_236274 ) ) ( not ( = ?auto_236264 ?auto_236275 ) ) ( not ( = ?auto_236264 ?auto_236276 ) ) ( not ( = ?auto_236265 ?auto_236266 ) ) ( not ( = ?auto_236265 ?auto_236267 ) ) ( not ( = ?auto_236265 ?auto_236268 ) ) ( not ( = ?auto_236265 ?auto_236269 ) ) ( not ( = ?auto_236265 ?auto_236270 ) ) ( not ( = ?auto_236265 ?auto_236271 ) ) ( not ( = ?auto_236265 ?auto_236272 ) ) ( not ( = ?auto_236265 ?auto_236273 ) ) ( not ( = ?auto_236265 ?auto_236274 ) ) ( not ( = ?auto_236265 ?auto_236275 ) ) ( not ( = ?auto_236265 ?auto_236276 ) ) ( not ( = ?auto_236266 ?auto_236267 ) ) ( not ( = ?auto_236266 ?auto_236268 ) ) ( not ( = ?auto_236266 ?auto_236269 ) ) ( not ( = ?auto_236266 ?auto_236270 ) ) ( not ( = ?auto_236266 ?auto_236271 ) ) ( not ( = ?auto_236266 ?auto_236272 ) ) ( not ( = ?auto_236266 ?auto_236273 ) ) ( not ( = ?auto_236266 ?auto_236274 ) ) ( not ( = ?auto_236266 ?auto_236275 ) ) ( not ( = ?auto_236266 ?auto_236276 ) ) ( not ( = ?auto_236267 ?auto_236268 ) ) ( not ( = ?auto_236267 ?auto_236269 ) ) ( not ( = ?auto_236267 ?auto_236270 ) ) ( not ( = ?auto_236267 ?auto_236271 ) ) ( not ( = ?auto_236267 ?auto_236272 ) ) ( not ( = ?auto_236267 ?auto_236273 ) ) ( not ( = ?auto_236267 ?auto_236274 ) ) ( not ( = ?auto_236267 ?auto_236275 ) ) ( not ( = ?auto_236267 ?auto_236276 ) ) ( not ( = ?auto_236268 ?auto_236269 ) ) ( not ( = ?auto_236268 ?auto_236270 ) ) ( not ( = ?auto_236268 ?auto_236271 ) ) ( not ( = ?auto_236268 ?auto_236272 ) ) ( not ( = ?auto_236268 ?auto_236273 ) ) ( not ( = ?auto_236268 ?auto_236274 ) ) ( not ( = ?auto_236268 ?auto_236275 ) ) ( not ( = ?auto_236268 ?auto_236276 ) ) ( not ( = ?auto_236269 ?auto_236270 ) ) ( not ( = ?auto_236269 ?auto_236271 ) ) ( not ( = ?auto_236269 ?auto_236272 ) ) ( not ( = ?auto_236269 ?auto_236273 ) ) ( not ( = ?auto_236269 ?auto_236274 ) ) ( not ( = ?auto_236269 ?auto_236275 ) ) ( not ( = ?auto_236269 ?auto_236276 ) ) ( not ( = ?auto_236270 ?auto_236271 ) ) ( not ( = ?auto_236270 ?auto_236272 ) ) ( not ( = ?auto_236270 ?auto_236273 ) ) ( not ( = ?auto_236270 ?auto_236274 ) ) ( not ( = ?auto_236270 ?auto_236275 ) ) ( not ( = ?auto_236270 ?auto_236276 ) ) ( not ( = ?auto_236271 ?auto_236272 ) ) ( not ( = ?auto_236271 ?auto_236273 ) ) ( not ( = ?auto_236271 ?auto_236274 ) ) ( not ( = ?auto_236271 ?auto_236275 ) ) ( not ( = ?auto_236271 ?auto_236276 ) ) ( not ( = ?auto_236272 ?auto_236273 ) ) ( not ( = ?auto_236272 ?auto_236274 ) ) ( not ( = ?auto_236272 ?auto_236275 ) ) ( not ( = ?auto_236272 ?auto_236276 ) ) ( not ( = ?auto_236273 ?auto_236274 ) ) ( not ( = ?auto_236273 ?auto_236275 ) ) ( not ( = ?auto_236273 ?auto_236276 ) ) ( not ( = ?auto_236274 ?auto_236275 ) ) ( not ( = ?auto_236274 ?auto_236276 ) ) ( not ( = ?auto_236275 ?auto_236276 ) ) ( ON ?auto_236275 ?auto_236276 ) ( ON ?auto_236274 ?auto_236275 ) ( ON ?auto_236273 ?auto_236274 ) ( CLEAR ?auto_236271 ) ( ON ?auto_236272 ?auto_236273 ) ( CLEAR ?auto_236272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_236264 ?auto_236265 ?auto_236266 ?auto_236267 ?auto_236268 ?auto_236269 ?auto_236270 ?auto_236271 ?auto_236272 )
      ( MAKE-13PILE ?auto_236264 ?auto_236265 ?auto_236266 ?auto_236267 ?auto_236268 ?auto_236269 ?auto_236270 ?auto_236271 ?auto_236272 ?auto_236273 ?auto_236274 ?auto_236275 ?auto_236276 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236290 - BLOCK
      ?auto_236291 - BLOCK
      ?auto_236292 - BLOCK
      ?auto_236293 - BLOCK
      ?auto_236294 - BLOCK
      ?auto_236295 - BLOCK
      ?auto_236296 - BLOCK
      ?auto_236297 - BLOCK
      ?auto_236298 - BLOCK
      ?auto_236299 - BLOCK
      ?auto_236300 - BLOCK
      ?auto_236301 - BLOCK
      ?auto_236302 - BLOCK
    )
    :vars
    (
      ?auto_236303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236302 ?auto_236303 ) ( ON-TABLE ?auto_236290 ) ( ON ?auto_236291 ?auto_236290 ) ( ON ?auto_236292 ?auto_236291 ) ( ON ?auto_236293 ?auto_236292 ) ( ON ?auto_236294 ?auto_236293 ) ( ON ?auto_236295 ?auto_236294 ) ( ON ?auto_236296 ?auto_236295 ) ( not ( = ?auto_236290 ?auto_236291 ) ) ( not ( = ?auto_236290 ?auto_236292 ) ) ( not ( = ?auto_236290 ?auto_236293 ) ) ( not ( = ?auto_236290 ?auto_236294 ) ) ( not ( = ?auto_236290 ?auto_236295 ) ) ( not ( = ?auto_236290 ?auto_236296 ) ) ( not ( = ?auto_236290 ?auto_236297 ) ) ( not ( = ?auto_236290 ?auto_236298 ) ) ( not ( = ?auto_236290 ?auto_236299 ) ) ( not ( = ?auto_236290 ?auto_236300 ) ) ( not ( = ?auto_236290 ?auto_236301 ) ) ( not ( = ?auto_236290 ?auto_236302 ) ) ( not ( = ?auto_236290 ?auto_236303 ) ) ( not ( = ?auto_236291 ?auto_236292 ) ) ( not ( = ?auto_236291 ?auto_236293 ) ) ( not ( = ?auto_236291 ?auto_236294 ) ) ( not ( = ?auto_236291 ?auto_236295 ) ) ( not ( = ?auto_236291 ?auto_236296 ) ) ( not ( = ?auto_236291 ?auto_236297 ) ) ( not ( = ?auto_236291 ?auto_236298 ) ) ( not ( = ?auto_236291 ?auto_236299 ) ) ( not ( = ?auto_236291 ?auto_236300 ) ) ( not ( = ?auto_236291 ?auto_236301 ) ) ( not ( = ?auto_236291 ?auto_236302 ) ) ( not ( = ?auto_236291 ?auto_236303 ) ) ( not ( = ?auto_236292 ?auto_236293 ) ) ( not ( = ?auto_236292 ?auto_236294 ) ) ( not ( = ?auto_236292 ?auto_236295 ) ) ( not ( = ?auto_236292 ?auto_236296 ) ) ( not ( = ?auto_236292 ?auto_236297 ) ) ( not ( = ?auto_236292 ?auto_236298 ) ) ( not ( = ?auto_236292 ?auto_236299 ) ) ( not ( = ?auto_236292 ?auto_236300 ) ) ( not ( = ?auto_236292 ?auto_236301 ) ) ( not ( = ?auto_236292 ?auto_236302 ) ) ( not ( = ?auto_236292 ?auto_236303 ) ) ( not ( = ?auto_236293 ?auto_236294 ) ) ( not ( = ?auto_236293 ?auto_236295 ) ) ( not ( = ?auto_236293 ?auto_236296 ) ) ( not ( = ?auto_236293 ?auto_236297 ) ) ( not ( = ?auto_236293 ?auto_236298 ) ) ( not ( = ?auto_236293 ?auto_236299 ) ) ( not ( = ?auto_236293 ?auto_236300 ) ) ( not ( = ?auto_236293 ?auto_236301 ) ) ( not ( = ?auto_236293 ?auto_236302 ) ) ( not ( = ?auto_236293 ?auto_236303 ) ) ( not ( = ?auto_236294 ?auto_236295 ) ) ( not ( = ?auto_236294 ?auto_236296 ) ) ( not ( = ?auto_236294 ?auto_236297 ) ) ( not ( = ?auto_236294 ?auto_236298 ) ) ( not ( = ?auto_236294 ?auto_236299 ) ) ( not ( = ?auto_236294 ?auto_236300 ) ) ( not ( = ?auto_236294 ?auto_236301 ) ) ( not ( = ?auto_236294 ?auto_236302 ) ) ( not ( = ?auto_236294 ?auto_236303 ) ) ( not ( = ?auto_236295 ?auto_236296 ) ) ( not ( = ?auto_236295 ?auto_236297 ) ) ( not ( = ?auto_236295 ?auto_236298 ) ) ( not ( = ?auto_236295 ?auto_236299 ) ) ( not ( = ?auto_236295 ?auto_236300 ) ) ( not ( = ?auto_236295 ?auto_236301 ) ) ( not ( = ?auto_236295 ?auto_236302 ) ) ( not ( = ?auto_236295 ?auto_236303 ) ) ( not ( = ?auto_236296 ?auto_236297 ) ) ( not ( = ?auto_236296 ?auto_236298 ) ) ( not ( = ?auto_236296 ?auto_236299 ) ) ( not ( = ?auto_236296 ?auto_236300 ) ) ( not ( = ?auto_236296 ?auto_236301 ) ) ( not ( = ?auto_236296 ?auto_236302 ) ) ( not ( = ?auto_236296 ?auto_236303 ) ) ( not ( = ?auto_236297 ?auto_236298 ) ) ( not ( = ?auto_236297 ?auto_236299 ) ) ( not ( = ?auto_236297 ?auto_236300 ) ) ( not ( = ?auto_236297 ?auto_236301 ) ) ( not ( = ?auto_236297 ?auto_236302 ) ) ( not ( = ?auto_236297 ?auto_236303 ) ) ( not ( = ?auto_236298 ?auto_236299 ) ) ( not ( = ?auto_236298 ?auto_236300 ) ) ( not ( = ?auto_236298 ?auto_236301 ) ) ( not ( = ?auto_236298 ?auto_236302 ) ) ( not ( = ?auto_236298 ?auto_236303 ) ) ( not ( = ?auto_236299 ?auto_236300 ) ) ( not ( = ?auto_236299 ?auto_236301 ) ) ( not ( = ?auto_236299 ?auto_236302 ) ) ( not ( = ?auto_236299 ?auto_236303 ) ) ( not ( = ?auto_236300 ?auto_236301 ) ) ( not ( = ?auto_236300 ?auto_236302 ) ) ( not ( = ?auto_236300 ?auto_236303 ) ) ( not ( = ?auto_236301 ?auto_236302 ) ) ( not ( = ?auto_236301 ?auto_236303 ) ) ( not ( = ?auto_236302 ?auto_236303 ) ) ( ON ?auto_236301 ?auto_236302 ) ( ON ?auto_236300 ?auto_236301 ) ( ON ?auto_236299 ?auto_236300 ) ( ON ?auto_236298 ?auto_236299 ) ( CLEAR ?auto_236296 ) ( ON ?auto_236297 ?auto_236298 ) ( CLEAR ?auto_236297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_236290 ?auto_236291 ?auto_236292 ?auto_236293 ?auto_236294 ?auto_236295 ?auto_236296 ?auto_236297 )
      ( MAKE-13PILE ?auto_236290 ?auto_236291 ?auto_236292 ?auto_236293 ?auto_236294 ?auto_236295 ?auto_236296 ?auto_236297 ?auto_236298 ?auto_236299 ?auto_236300 ?auto_236301 ?auto_236302 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236317 - BLOCK
      ?auto_236318 - BLOCK
      ?auto_236319 - BLOCK
      ?auto_236320 - BLOCK
      ?auto_236321 - BLOCK
      ?auto_236322 - BLOCK
      ?auto_236323 - BLOCK
      ?auto_236324 - BLOCK
      ?auto_236325 - BLOCK
      ?auto_236326 - BLOCK
      ?auto_236327 - BLOCK
      ?auto_236328 - BLOCK
      ?auto_236329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236329 ) ( ON-TABLE ?auto_236317 ) ( ON ?auto_236318 ?auto_236317 ) ( ON ?auto_236319 ?auto_236318 ) ( ON ?auto_236320 ?auto_236319 ) ( ON ?auto_236321 ?auto_236320 ) ( ON ?auto_236322 ?auto_236321 ) ( ON ?auto_236323 ?auto_236322 ) ( not ( = ?auto_236317 ?auto_236318 ) ) ( not ( = ?auto_236317 ?auto_236319 ) ) ( not ( = ?auto_236317 ?auto_236320 ) ) ( not ( = ?auto_236317 ?auto_236321 ) ) ( not ( = ?auto_236317 ?auto_236322 ) ) ( not ( = ?auto_236317 ?auto_236323 ) ) ( not ( = ?auto_236317 ?auto_236324 ) ) ( not ( = ?auto_236317 ?auto_236325 ) ) ( not ( = ?auto_236317 ?auto_236326 ) ) ( not ( = ?auto_236317 ?auto_236327 ) ) ( not ( = ?auto_236317 ?auto_236328 ) ) ( not ( = ?auto_236317 ?auto_236329 ) ) ( not ( = ?auto_236318 ?auto_236319 ) ) ( not ( = ?auto_236318 ?auto_236320 ) ) ( not ( = ?auto_236318 ?auto_236321 ) ) ( not ( = ?auto_236318 ?auto_236322 ) ) ( not ( = ?auto_236318 ?auto_236323 ) ) ( not ( = ?auto_236318 ?auto_236324 ) ) ( not ( = ?auto_236318 ?auto_236325 ) ) ( not ( = ?auto_236318 ?auto_236326 ) ) ( not ( = ?auto_236318 ?auto_236327 ) ) ( not ( = ?auto_236318 ?auto_236328 ) ) ( not ( = ?auto_236318 ?auto_236329 ) ) ( not ( = ?auto_236319 ?auto_236320 ) ) ( not ( = ?auto_236319 ?auto_236321 ) ) ( not ( = ?auto_236319 ?auto_236322 ) ) ( not ( = ?auto_236319 ?auto_236323 ) ) ( not ( = ?auto_236319 ?auto_236324 ) ) ( not ( = ?auto_236319 ?auto_236325 ) ) ( not ( = ?auto_236319 ?auto_236326 ) ) ( not ( = ?auto_236319 ?auto_236327 ) ) ( not ( = ?auto_236319 ?auto_236328 ) ) ( not ( = ?auto_236319 ?auto_236329 ) ) ( not ( = ?auto_236320 ?auto_236321 ) ) ( not ( = ?auto_236320 ?auto_236322 ) ) ( not ( = ?auto_236320 ?auto_236323 ) ) ( not ( = ?auto_236320 ?auto_236324 ) ) ( not ( = ?auto_236320 ?auto_236325 ) ) ( not ( = ?auto_236320 ?auto_236326 ) ) ( not ( = ?auto_236320 ?auto_236327 ) ) ( not ( = ?auto_236320 ?auto_236328 ) ) ( not ( = ?auto_236320 ?auto_236329 ) ) ( not ( = ?auto_236321 ?auto_236322 ) ) ( not ( = ?auto_236321 ?auto_236323 ) ) ( not ( = ?auto_236321 ?auto_236324 ) ) ( not ( = ?auto_236321 ?auto_236325 ) ) ( not ( = ?auto_236321 ?auto_236326 ) ) ( not ( = ?auto_236321 ?auto_236327 ) ) ( not ( = ?auto_236321 ?auto_236328 ) ) ( not ( = ?auto_236321 ?auto_236329 ) ) ( not ( = ?auto_236322 ?auto_236323 ) ) ( not ( = ?auto_236322 ?auto_236324 ) ) ( not ( = ?auto_236322 ?auto_236325 ) ) ( not ( = ?auto_236322 ?auto_236326 ) ) ( not ( = ?auto_236322 ?auto_236327 ) ) ( not ( = ?auto_236322 ?auto_236328 ) ) ( not ( = ?auto_236322 ?auto_236329 ) ) ( not ( = ?auto_236323 ?auto_236324 ) ) ( not ( = ?auto_236323 ?auto_236325 ) ) ( not ( = ?auto_236323 ?auto_236326 ) ) ( not ( = ?auto_236323 ?auto_236327 ) ) ( not ( = ?auto_236323 ?auto_236328 ) ) ( not ( = ?auto_236323 ?auto_236329 ) ) ( not ( = ?auto_236324 ?auto_236325 ) ) ( not ( = ?auto_236324 ?auto_236326 ) ) ( not ( = ?auto_236324 ?auto_236327 ) ) ( not ( = ?auto_236324 ?auto_236328 ) ) ( not ( = ?auto_236324 ?auto_236329 ) ) ( not ( = ?auto_236325 ?auto_236326 ) ) ( not ( = ?auto_236325 ?auto_236327 ) ) ( not ( = ?auto_236325 ?auto_236328 ) ) ( not ( = ?auto_236325 ?auto_236329 ) ) ( not ( = ?auto_236326 ?auto_236327 ) ) ( not ( = ?auto_236326 ?auto_236328 ) ) ( not ( = ?auto_236326 ?auto_236329 ) ) ( not ( = ?auto_236327 ?auto_236328 ) ) ( not ( = ?auto_236327 ?auto_236329 ) ) ( not ( = ?auto_236328 ?auto_236329 ) ) ( ON ?auto_236328 ?auto_236329 ) ( ON ?auto_236327 ?auto_236328 ) ( ON ?auto_236326 ?auto_236327 ) ( ON ?auto_236325 ?auto_236326 ) ( CLEAR ?auto_236323 ) ( ON ?auto_236324 ?auto_236325 ) ( CLEAR ?auto_236324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_236317 ?auto_236318 ?auto_236319 ?auto_236320 ?auto_236321 ?auto_236322 ?auto_236323 ?auto_236324 )
      ( MAKE-13PILE ?auto_236317 ?auto_236318 ?auto_236319 ?auto_236320 ?auto_236321 ?auto_236322 ?auto_236323 ?auto_236324 ?auto_236325 ?auto_236326 ?auto_236327 ?auto_236328 ?auto_236329 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236343 - BLOCK
      ?auto_236344 - BLOCK
      ?auto_236345 - BLOCK
      ?auto_236346 - BLOCK
      ?auto_236347 - BLOCK
      ?auto_236348 - BLOCK
      ?auto_236349 - BLOCK
      ?auto_236350 - BLOCK
      ?auto_236351 - BLOCK
      ?auto_236352 - BLOCK
      ?auto_236353 - BLOCK
      ?auto_236354 - BLOCK
      ?auto_236355 - BLOCK
    )
    :vars
    (
      ?auto_236356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236355 ?auto_236356 ) ( ON-TABLE ?auto_236343 ) ( ON ?auto_236344 ?auto_236343 ) ( ON ?auto_236345 ?auto_236344 ) ( ON ?auto_236346 ?auto_236345 ) ( ON ?auto_236347 ?auto_236346 ) ( ON ?auto_236348 ?auto_236347 ) ( not ( = ?auto_236343 ?auto_236344 ) ) ( not ( = ?auto_236343 ?auto_236345 ) ) ( not ( = ?auto_236343 ?auto_236346 ) ) ( not ( = ?auto_236343 ?auto_236347 ) ) ( not ( = ?auto_236343 ?auto_236348 ) ) ( not ( = ?auto_236343 ?auto_236349 ) ) ( not ( = ?auto_236343 ?auto_236350 ) ) ( not ( = ?auto_236343 ?auto_236351 ) ) ( not ( = ?auto_236343 ?auto_236352 ) ) ( not ( = ?auto_236343 ?auto_236353 ) ) ( not ( = ?auto_236343 ?auto_236354 ) ) ( not ( = ?auto_236343 ?auto_236355 ) ) ( not ( = ?auto_236343 ?auto_236356 ) ) ( not ( = ?auto_236344 ?auto_236345 ) ) ( not ( = ?auto_236344 ?auto_236346 ) ) ( not ( = ?auto_236344 ?auto_236347 ) ) ( not ( = ?auto_236344 ?auto_236348 ) ) ( not ( = ?auto_236344 ?auto_236349 ) ) ( not ( = ?auto_236344 ?auto_236350 ) ) ( not ( = ?auto_236344 ?auto_236351 ) ) ( not ( = ?auto_236344 ?auto_236352 ) ) ( not ( = ?auto_236344 ?auto_236353 ) ) ( not ( = ?auto_236344 ?auto_236354 ) ) ( not ( = ?auto_236344 ?auto_236355 ) ) ( not ( = ?auto_236344 ?auto_236356 ) ) ( not ( = ?auto_236345 ?auto_236346 ) ) ( not ( = ?auto_236345 ?auto_236347 ) ) ( not ( = ?auto_236345 ?auto_236348 ) ) ( not ( = ?auto_236345 ?auto_236349 ) ) ( not ( = ?auto_236345 ?auto_236350 ) ) ( not ( = ?auto_236345 ?auto_236351 ) ) ( not ( = ?auto_236345 ?auto_236352 ) ) ( not ( = ?auto_236345 ?auto_236353 ) ) ( not ( = ?auto_236345 ?auto_236354 ) ) ( not ( = ?auto_236345 ?auto_236355 ) ) ( not ( = ?auto_236345 ?auto_236356 ) ) ( not ( = ?auto_236346 ?auto_236347 ) ) ( not ( = ?auto_236346 ?auto_236348 ) ) ( not ( = ?auto_236346 ?auto_236349 ) ) ( not ( = ?auto_236346 ?auto_236350 ) ) ( not ( = ?auto_236346 ?auto_236351 ) ) ( not ( = ?auto_236346 ?auto_236352 ) ) ( not ( = ?auto_236346 ?auto_236353 ) ) ( not ( = ?auto_236346 ?auto_236354 ) ) ( not ( = ?auto_236346 ?auto_236355 ) ) ( not ( = ?auto_236346 ?auto_236356 ) ) ( not ( = ?auto_236347 ?auto_236348 ) ) ( not ( = ?auto_236347 ?auto_236349 ) ) ( not ( = ?auto_236347 ?auto_236350 ) ) ( not ( = ?auto_236347 ?auto_236351 ) ) ( not ( = ?auto_236347 ?auto_236352 ) ) ( not ( = ?auto_236347 ?auto_236353 ) ) ( not ( = ?auto_236347 ?auto_236354 ) ) ( not ( = ?auto_236347 ?auto_236355 ) ) ( not ( = ?auto_236347 ?auto_236356 ) ) ( not ( = ?auto_236348 ?auto_236349 ) ) ( not ( = ?auto_236348 ?auto_236350 ) ) ( not ( = ?auto_236348 ?auto_236351 ) ) ( not ( = ?auto_236348 ?auto_236352 ) ) ( not ( = ?auto_236348 ?auto_236353 ) ) ( not ( = ?auto_236348 ?auto_236354 ) ) ( not ( = ?auto_236348 ?auto_236355 ) ) ( not ( = ?auto_236348 ?auto_236356 ) ) ( not ( = ?auto_236349 ?auto_236350 ) ) ( not ( = ?auto_236349 ?auto_236351 ) ) ( not ( = ?auto_236349 ?auto_236352 ) ) ( not ( = ?auto_236349 ?auto_236353 ) ) ( not ( = ?auto_236349 ?auto_236354 ) ) ( not ( = ?auto_236349 ?auto_236355 ) ) ( not ( = ?auto_236349 ?auto_236356 ) ) ( not ( = ?auto_236350 ?auto_236351 ) ) ( not ( = ?auto_236350 ?auto_236352 ) ) ( not ( = ?auto_236350 ?auto_236353 ) ) ( not ( = ?auto_236350 ?auto_236354 ) ) ( not ( = ?auto_236350 ?auto_236355 ) ) ( not ( = ?auto_236350 ?auto_236356 ) ) ( not ( = ?auto_236351 ?auto_236352 ) ) ( not ( = ?auto_236351 ?auto_236353 ) ) ( not ( = ?auto_236351 ?auto_236354 ) ) ( not ( = ?auto_236351 ?auto_236355 ) ) ( not ( = ?auto_236351 ?auto_236356 ) ) ( not ( = ?auto_236352 ?auto_236353 ) ) ( not ( = ?auto_236352 ?auto_236354 ) ) ( not ( = ?auto_236352 ?auto_236355 ) ) ( not ( = ?auto_236352 ?auto_236356 ) ) ( not ( = ?auto_236353 ?auto_236354 ) ) ( not ( = ?auto_236353 ?auto_236355 ) ) ( not ( = ?auto_236353 ?auto_236356 ) ) ( not ( = ?auto_236354 ?auto_236355 ) ) ( not ( = ?auto_236354 ?auto_236356 ) ) ( not ( = ?auto_236355 ?auto_236356 ) ) ( ON ?auto_236354 ?auto_236355 ) ( ON ?auto_236353 ?auto_236354 ) ( ON ?auto_236352 ?auto_236353 ) ( ON ?auto_236351 ?auto_236352 ) ( ON ?auto_236350 ?auto_236351 ) ( CLEAR ?auto_236348 ) ( ON ?auto_236349 ?auto_236350 ) ( CLEAR ?auto_236349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_236343 ?auto_236344 ?auto_236345 ?auto_236346 ?auto_236347 ?auto_236348 ?auto_236349 )
      ( MAKE-13PILE ?auto_236343 ?auto_236344 ?auto_236345 ?auto_236346 ?auto_236347 ?auto_236348 ?auto_236349 ?auto_236350 ?auto_236351 ?auto_236352 ?auto_236353 ?auto_236354 ?auto_236355 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236370 - BLOCK
      ?auto_236371 - BLOCK
      ?auto_236372 - BLOCK
      ?auto_236373 - BLOCK
      ?auto_236374 - BLOCK
      ?auto_236375 - BLOCK
      ?auto_236376 - BLOCK
      ?auto_236377 - BLOCK
      ?auto_236378 - BLOCK
      ?auto_236379 - BLOCK
      ?auto_236380 - BLOCK
      ?auto_236381 - BLOCK
      ?auto_236382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236382 ) ( ON-TABLE ?auto_236370 ) ( ON ?auto_236371 ?auto_236370 ) ( ON ?auto_236372 ?auto_236371 ) ( ON ?auto_236373 ?auto_236372 ) ( ON ?auto_236374 ?auto_236373 ) ( ON ?auto_236375 ?auto_236374 ) ( not ( = ?auto_236370 ?auto_236371 ) ) ( not ( = ?auto_236370 ?auto_236372 ) ) ( not ( = ?auto_236370 ?auto_236373 ) ) ( not ( = ?auto_236370 ?auto_236374 ) ) ( not ( = ?auto_236370 ?auto_236375 ) ) ( not ( = ?auto_236370 ?auto_236376 ) ) ( not ( = ?auto_236370 ?auto_236377 ) ) ( not ( = ?auto_236370 ?auto_236378 ) ) ( not ( = ?auto_236370 ?auto_236379 ) ) ( not ( = ?auto_236370 ?auto_236380 ) ) ( not ( = ?auto_236370 ?auto_236381 ) ) ( not ( = ?auto_236370 ?auto_236382 ) ) ( not ( = ?auto_236371 ?auto_236372 ) ) ( not ( = ?auto_236371 ?auto_236373 ) ) ( not ( = ?auto_236371 ?auto_236374 ) ) ( not ( = ?auto_236371 ?auto_236375 ) ) ( not ( = ?auto_236371 ?auto_236376 ) ) ( not ( = ?auto_236371 ?auto_236377 ) ) ( not ( = ?auto_236371 ?auto_236378 ) ) ( not ( = ?auto_236371 ?auto_236379 ) ) ( not ( = ?auto_236371 ?auto_236380 ) ) ( not ( = ?auto_236371 ?auto_236381 ) ) ( not ( = ?auto_236371 ?auto_236382 ) ) ( not ( = ?auto_236372 ?auto_236373 ) ) ( not ( = ?auto_236372 ?auto_236374 ) ) ( not ( = ?auto_236372 ?auto_236375 ) ) ( not ( = ?auto_236372 ?auto_236376 ) ) ( not ( = ?auto_236372 ?auto_236377 ) ) ( not ( = ?auto_236372 ?auto_236378 ) ) ( not ( = ?auto_236372 ?auto_236379 ) ) ( not ( = ?auto_236372 ?auto_236380 ) ) ( not ( = ?auto_236372 ?auto_236381 ) ) ( not ( = ?auto_236372 ?auto_236382 ) ) ( not ( = ?auto_236373 ?auto_236374 ) ) ( not ( = ?auto_236373 ?auto_236375 ) ) ( not ( = ?auto_236373 ?auto_236376 ) ) ( not ( = ?auto_236373 ?auto_236377 ) ) ( not ( = ?auto_236373 ?auto_236378 ) ) ( not ( = ?auto_236373 ?auto_236379 ) ) ( not ( = ?auto_236373 ?auto_236380 ) ) ( not ( = ?auto_236373 ?auto_236381 ) ) ( not ( = ?auto_236373 ?auto_236382 ) ) ( not ( = ?auto_236374 ?auto_236375 ) ) ( not ( = ?auto_236374 ?auto_236376 ) ) ( not ( = ?auto_236374 ?auto_236377 ) ) ( not ( = ?auto_236374 ?auto_236378 ) ) ( not ( = ?auto_236374 ?auto_236379 ) ) ( not ( = ?auto_236374 ?auto_236380 ) ) ( not ( = ?auto_236374 ?auto_236381 ) ) ( not ( = ?auto_236374 ?auto_236382 ) ) ( not ( = ?auto_236375 ?auto_236376 ) ) ( not ( = ?auto_236375 ?auto_236377 ) ) ( not ( = ?auto_236375 ?auto_236378 ) ) ( not ( = ?auto_236375 ?auto_236379 ) ) ( not ( = ?auto_236375 ?auto_236380 ) ) ( not ( = ?auto_236375 ?auto_236381 ) ) ( not ( = ?auto_236375 ?auto_236382 ) ) ( not ( = ?auto_236376 ?auto_236377 ) ) ( not ( = ?auto_236376 ?auto_236378 ) ) ( not ( = ?auto_236376 ?auto_236379 ) ) ( not ( = ?auto_236376 ?auto_236380 ) ) ( not ( = ?auto_236376 ?auto_236381 ) ) ( not ( = ?auto_236376 ?auto_236382 ) ) ( not ( = ?auto_236377 ?auto_236378 ) ) ( not ( = ?auto_236377 ?auto_236379 ) ) ( not ( = ?auto_236377 ?auto_236380 ) ) ( not ( = ?auto_236377 ?auto_236381 ) ) ( not ( = ?auto_236377 ?auto_236382 ) ) ( not ( = ?auto_236378 ?auto_236379 ) ) ( not ( = ?auto_236378 ?auto_236380 ) ) ( not ( = ?auto_236378 ?auto_236381 ) ) ( not ( = ?auto_236378 ?auto_236382 ) ) ( not ( = ?auto_236379 ?auto_236380 ) ) ( not ( = ?auto_236379 ?auto_236381 ) ) ( not ( = ?auto_236379 ?auto_236382 ) ) ( not ( = ?auto_236380 ?auto_236381 ) ) ( not ( = ?auto_236380 ?auto_236382 ) ) ( not ( = ?auto_236381 ?auto_236382 ) ) ( ON ?auto_236381 ?auto_236382 ) ( ON ?auto_236380 ?auto_236381 ) ( ON ?auto_236379 ?auto_236380 ) ( ON ?auto_236378 ?auto_236379 ) ( ON ?auto_236377 ?auto_236378 ) ( CLEAR ?auto_236375 ) ( ON ?auto_236376 ?auto_236377 ) ( CLEAR ?auto_236376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_236370 ?auto_236371 ?auto_236372 ?auto_236373 ?auto_236374 ?auto_236375 ?auto_236376 )
      ( MAKE-13PILE ?auto_236370 ?auto_236371 ?auto_236372 ?auto_236373 ?auto_236374 ?auto_236375 ?auto_236376 ?auto_236377 ?auto_236378 ?auto_236379 ?auto_236380 ?auto_236381 ?auto_236382 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236396 - BLOCK
      ?auto_236397 - BLOCK
      ?auto_236398 - BLOCK
      ?auto_236399 - BLOCK
      ?auto_236400 - BLOCK
      ?auto_236401 - BLOCK
      ?auto_236402 - BLOCK
      ?auto_236403 - BLOCK
      ?auto_236404 - BLOCK
      ?auto_236405 - BLOCK
      ?auto_236406 - BLOCK
      ?auto_236407 - BLOCK
      ?auto_236408 - BLOCK
    )
    :vars
    (
      ?auto_236409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236408 ?auto_236409 ) ( ON-TABLE ?auto_236396 ) ( ON ?auto_236397 ?auto_236396 ) ( ON ?auto_236398 ?auto_236397 ) ( ON ?auto_236399 ?auto_236398 ) ( ON ?auto_236400 ?auto_236399 ) ( not ( = ?auto_236396 ?auto_236397 ) ) ( not ( = ?auto_236396 ?auto_236398 ) ) ( not ( = ?auto_236396 ?auto_236399 ) ) ( not ( = ?auto_236396 ?auto_236400 ) ) ( not ( = ?auto_236396 ?auto_236401 ) ) ( not ( = ?auto_236396 ?auto_236402 ) ) ( not ( = ?auto_236396 ?auto_236403 ) ) ( not ( = ?auto_236396 ?auto_236404 ) ) ( not ( = ?auto_236396 ?auto_236405 ) ) ( not ( = ?auto_236396 ?auto_236406 ) ) ( not ( = ?auto_236396 ?auto_236407 ) ) ( not ( = ?auto_236396 ?auto_236408 ) ) ( not ( = ?auto_236396 ?auto_236409 ) ) ( not ( = ?auto_236397 ?auto_236398 ) ) ( not ( = ?auto_236397 ?auto_236399 ) ) ( not ( = ?auto_236397 ?auto_236400 ) ) ( not ( = ?auto_236397 ?auto_236401 ) ) ( not ( = ?auto_236397 ?auto_236402 ) ) ( not ( = ?auto_236397 ?auto_236403 ) ) ( not ( = ?auto_236397 ?auto_236404 ) ) ( not ( = ?auto_236397 ?auto_236405 ) ) ( not ( = ?auto_236397 ?auto_236406 ) ) ( not ( = ?auto_236397 ?auto_236407 ) ) ( not ( = ?auto_236397 ?auto_236408 ) ) ( not ( = ?auto_236397 ?auto_236409 ) ) ( not ( = ?auto_236398 ?auto_236399 ) ) ( not ( = ?auto_236398 ?auto_236400 ) ) ( not ( = ?auto_236398 ?auto_236401 ) ) ( not ( = ?auto_236398 ?auto_236402 ) ) ( not ( = ?auto_236398 ?auto_236403 ) ) ( not ( = ?auto_236398 ?auto_236404 ) ) ( not ( = ?auto_236398 ?auto_236405 ) ) ( not ( = ?auto_236398 ?auto_236406 ) ) ( not ( = ?auto_236398 ?auto_236407 ) ) ( not ( = ?auto_236398 ?auto_236408 ) ) ( not ( = ?auto_236398 ?auto_236409 ) ) ( not ( = ?auto_236399 ?auto_236400 ) ) ( not ( = ?auto_236399 ?auto_236401 ) ) ( not ( = ?auto_236399 ?auto_236402 ) ) ( not ( = ?auto_236399 ?auto_236403 ) ) ( not ( = ?auto_236399 ?auto_236404 ) ) ( not ( = ?auto_236399 ?auto_236405 ) ) ( not ( = ?auto_236399 ?auto_236406 ) ) ( not ( = ?auto_236399 ?auto_236407 ) ) ( not ( = ?auto_236399 ?auto_236408 ) ) ( not ( = ?auto_236399 ?auto_236409 ) ) ( not ( = ?auto_236400 ?auto_236401 ) ) ( not ( = ?auto_236400 ?auto_236402 ) ) ( not ( = ?auto_236400 ?auto_236403 ) ) ( not ( = ?auto_236400 ?auto_236404 ) ) ( not ( = ?auto_236400 ?auto_236405 ) ) ( not ( = ?auto_236400 ?auto_236406 ) ) ( not ( = ?auto_236400 ?auto_236407 ) ) ( not ( = ?auto_236400 ?auto_236408 ) ) ( not ( = ?auto_236400 ?auto_236409 ) ) ( not ( = ?auto_236401 ?auto_236402 ) ) ( not ( = ?auto_236401 ?auto_236403 ) ) ( not ( = ?auto_236401 ?auto_236404 ) ) ( not ( = ?auto_236401 ?auto_236405 ) ) ( not ( = ?auto_236401 ?auto_236406 ) ) ( not ( = ?auto_236401 ?auto_236407 ) ) ( not ( = ?auto_236401 ?auto_236408 ) ) ( not ( = ?auto_236401 ?auto_236409 ) ) ( not ( = ?auto_236402 ?auto_236403 ) ) ( not ( = ?auto_236402 ?auto_236404 ) ) ( not ( = ?auto_236402 ?auto_236405 ) ) ( not ( = ?auto_236402 ?auto_236406 ) ) ( not ( = ?auto_236402 ?auto_236407 ) ) ( not ( = ?auto_236402 ?auto_236408 ) ) ( not ( = ?auto_236402 ?auto_236409 ) ) ( not ( = ?auto_236403 ?auto_236404 ) ) ( not ( = ?auto_236403 ?auto_236405 ) ) ( not ( = ?auto_236403 ?auto_236406 ) ) ( not ( = ?auto_236403 ?auto_236407 ) ) ( not ( = ?auto_236403 ?auto_236408 ) ) ( not ( = ?auto_236403 ?auto_236409 ) ) ( not ( = ?auto_236404 ?auto_236405 ) ) ( not ( = ?auto_236404 ?auto_236406 ) ) ( not ( = ?auto_236404 ?auto_236407 ) ) ( not ( = ?auto_236404 ?auto_236408 ) ) ( not ( = ?auto_236404 ?auto_236409 ) ) ( not ( = ?auto_236405 ?auto_236406 ) ) ( not ( = ?auto_236405 ?auto_236407 ) ) ( not ( = ?auto_236405 ?auto_236408 ) ) ( not ( = ?auto_236405 ?auto_236409 ) ) ( not ( = ?auto_236406 ?auto_236407 ) ) ( not ( = ?auto_236406 ?auto_236408 ) ) ( not ( = ?auto_236406 ?auto_236409 ) ) ( not ( = ?auto_236407 ?auto_236408 ) ) ( not ( = ?auto_236407 ?auto_236409 ) ) ( not ( = ?auto_236408 ?auto_236409 ) ) ( ON ?auto_236407 ?auto_236408 ) ( ON ?auto_236406 ?auto_236407 ) ( ON ?auto_236405 ?auto_236406 ) ( ON ?auto_236404 ?auto_236405 ) ( ON ?auto_236403 ?auto_236404 ) ( ON ?auto_236402 ?auto_236403 ) ( CLEAR ?auto_236400 ) ( ON ?auto_236401 ?auto_236402 ) ( CLEAR ?auto_236401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_236396 ?auto_236397 ?auto_236398 ?auto_236399 ?auto_236400 ?auto_236401 )
      ( MAKE-13PILE ?auto_236396 ?auto_236397 ?auto_236398 ?auto_236399 ?auto_236400 ?auto_236401 ?auto_236402 ?auto_236403 ?auto_236404 ?auto_236405 ?auto_236406 ?auto_236407 ?auto_236408 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236423 - BLOCK
      ?auto_236424 - BLOCK
      ?auto_236425 - BLOCK
      ?auto_236426 - BLOCK
      ?auto_236427 - BLOCK
      ?auto_236428 - BLOCK
      ?auto_236429 - BLOCK
      ?auto_236430 - BLOCK
      ?auto_236431 - BLOCK
      ?auto_236432 - BLOCK
      ?auto_236433 - BLOCK
      ?auto_236434 - BLOCK
      ?auto_236435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236435 ) ( ON-TABLE ?auto_236423 ) ( ON ?auto_236424 ?auto_236423 ) ( ON ?auto_236425 ?auto_236424 ) ( ON ?auto_236426 ?auto_236425 ) ( ON ?auto_236427 ?auto_236426 ) ( not ( = ?auto_236423 ?auto_236424 ) ) ( not ( = ?auto_236423 ?auto_236425 ) ) ( not ( = ?auto_236423 ?auto_236426 ) ) ( not ( = ?auto_236423 ?auto_236427 ) ) ( not ( = ?auto_236423 ?auto_236428 ) ) ( not ( = ?auto_236423 ?auto_236429 ) ) ( not ( = ?auto_236423 ?auto_236430 ) ) ( not ( = ?auto_236423 ?auto_236431 ) ) ( not ( = ?auto_236423 ?auto_236432 ) ) ( not ( = ?auto_236423 ?auto_236433 ) ) ( not ( = ?auto_236423 ?auto_236434 ) ) ( not ( = ?auto_236423 ?auto_236435 ) ) ( not ( = ?auto_236424 ?auto_236425 ) ) ( not ( = ?auto_236424 ?auto_236426 ) ) ( not ( = ?auto_236424 ?auto_236427 ) ) ( not ( = ?auto_236424 ?auto_236428 ) ) ( not ( = ?auto_236424 ?auto_236429 ) ) ( not ( = ?auto_236424 ?auto_236430 ) ) ( not ( = ?auto_236424 ?auto_236431 ) ) ( not ( = ?auto_236424 ?auto_236432 ) ) ( not ( = ?auto_236424 ?auto_236433 ) ) ( not ( = ?auto_236424 ?auto_236434 ) ) ( not ( = ?auto_236424 ?auto_236435 ) ) ( not ( = ?auto_236425 ?auto_236426 ) ) ( not ( = ?auto_236425 ?auto_236427 ) ) ( not ( = ?auto_236425 ?auto_236428 ) ) ( not ( = ?auto_236425 ?auto_236429 ) ) ( not ( = ?auto_236425 ?auto_236430 ) ) ( not ( = ?auto_236425 ?auto_236431 ) ) ( not ( = ?auto_236425 ?auto_236432 ) ) ( not ( = ?auto_236425 ?auto_236433 ) ) ( not ( = ?auto_236425 ?auto_236434 ) ) ( not ( = ?auto_236425 ?auto_236435 ) ) ( not ( = ?auto_236426 ?auto_236427 ) ) ( not ( = ?auto_236426 ?auto_236428 ) ) ( not ( = ?auto_236426 ?auto_236429 ) ) ( not ( = ?auto_236426 ?auto_236430 ) ) ( not ( = ?auto_236426 ?auto_236431 ) ) ( not ( = ?auto_236426 ?auto_236432 ) ) ( not ( = ?auto_236426 ?auto_236433 ) ) ( not ( = ?auto_236426 ?auto_236434 ) ) ( not ( = ?auto_236426 ?auto_236435 ) ) ( not ( = ?auto_236427 ?auto_236428 ) ) ( not ( = ?auto_236427 ?auto_236429 ) ) ( not ( = ?auto_236427 ?auto_236430 ) ) ( not ( = ?auto_236427 ?auto_236431 ) ) ( not ( = ?auto_236427 ?auto_236432 ) ) ( not ( = ?auto_236427 ?auto_236433 ) ) ( not ( = ?auto_236427 ?auto_236434 ) ) ( not ( = ?auto_236427 ?auto_236435 ) ) ( not ( = ?auto_236428 ?auto_236429 ) ) ( not ( = ?auto_236428 ?auto_236430 ) ) ( not ( = ?auto_236428 ?auto_236431 ) ) ( not ( = ?auto_236428 ?auto_236432 ) ) ( not ( = ?auto_236428 ?auto_236433 ) ) ( not ( = ?auto_236428 ?auto_236434 ) ) ( not ( = ?auto_236428 ?auto_236435 ) ) ( not ( = ?auto_236429 ?auto_236430 ) ) ( not ( = ?auto_236429 ?auto_236431 ) ) ( not ( = ?auto_236429 ?auto_236432 ) ) ( not ( = ?auto_236429 ?auto_236433 ) ) ( not ( = ?auto_236429 ?auto_236434 ) ) ( not ( = ?auto_236429 ?auto_236435 ) ) ( not ( = ?auto_236430 ?auto_236431 ) ) ( not ( = ?auto_236430 ?auto_236432 ) ) ( not ( = ?auto_236430 ?auto_236433 ) ) ( not ( = ?auto_236430 ?auto_236434 ) ) ( not ( = ?auto_236430 ?auto_236435 ) ) ( not ( = ?auto_236431 ?auto_236432 ) ) ( not ( = ?auto_236431 ?auto_236433 ) ) ( not ( = ?auto_236431 ?auto_236434 ) ) ( not ( = ?auto_236431 ?auto_236435 ) ) ( not ( = ?auto_236432 ?auto_236433 ) ) ( not ( = ?auto_236432 ?auto_236434 ) ) ( not ( = ?auto_236432 ?auto_236435 ) ) ( not ( = ?auto_236433 ?auto_236434 ) ) ( not ( = ?auto_236433 ?auto_236435 ) ) ( not ( = ?auto_236434 ?auto_236435 ) ) ( ON ?auto_236434 ?auto_236435 ) ( ON ?auto_236433 ?auto_236434 ) ( ON ?auto_236432 ?auto_236433 ) ( ON ?auto_236431 ?auto_236432 ) ( ON ?auto_236430 ?auto_236431 ) ( ON ?auto_236429 ?auto_236430 ) ( CLEAR ?auto_236427 ) ( ON ?auto_236428 ?auto_236429 ) ( CLEAR ?auto_236428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_236423 ?auto_236424 ?auto_236425 ?auto_236426 ?auto_236427 ?auto_236428 )
      ( MAKE-13PILE ?auto_236423 ?auto_236424 ?auto_236425 ?auto_236426 ?auto_236427 ?auto_236428 ?auto_236429 ?auto_236430 ?auto_236431 ?auto_236432 ?auto_236433 ?auto_236434 ?auto_236435 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236449 - BLOCK
      ?auto_236450 - BLOCK
      ?auto_236451 - BLOCK
      ?auto_236452 - BLOCK
      ?auto_236453 - BLOCK
      ?auto_236454 - BLOCK
      ?auto_236455 - BLOCK
      ?auto_236456 - BLOCK
      ?auto_236457 - BLOCK
      ?auto_236458 - BLOCK
      ?auto_236459 - BLOCK
      ?auto_236460 - BLOCK
      ?auto_236461 - BLOCK
    )
    :vars
    (
      ?auto_236462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236461 ?auto_236462 ) ( ON-TABLE ?auto_236449 ) ( ON ?auto_236450 ?auto_236449 ) ( ON ?auto_236451 ?auto_236450 ) ( ON ?auto_236452 ?auto_236451 ) ( not ( = ?auto_236449 ?auto_236450 ) ) ( not ( = ?auto_236449 ?auto_236451 ) ) ( not ( = ?auto_236449 ?auto_236452 ) ) ( not ( = ?auto_236449 ?auto_236453 ) ) ( not ( = ?auto_236449 ?auto_236454 ) ) ( not ( = ?auto_236449 ?auto_236455 ) ) ( not ( = ?auto_236449 ?auto_236456 ) ) ( not ( = ?auto_236449 ?auto_236457 ) ) ( not ( = ?auto_236449 ?auto_236458 ) ) ( not ( = ?auto_236449 ?auto_236459 ) ) ( not ( = ?auto_236449 ?auto_236460 ) ) ( not ( = ?auto_236449 ?auto_236461 ) ) ( not ( = ?auto_236449 ?auto_236462 ) ) ( not ( = ?auto_236450 ?auto_236451 ) ) ( not ( = ?auto_236450 ?auto_236452 ) ) ( not ( = ?auto_236450 ?auto_236453 ) ) ( not ( = ?auto_236450 ?auto_236454 ) ) ( not ( = ?auto_236450 ?auto_236455 ) ) ( not ( = ?auto_236450 ?auto_236456 ) ) ( not ( = ?auto_236450 ?auto_236457 ) ) ( not ( = ?auto_236450 ?auto_236458 ) ) ( not ( = ?auto_236450 ?auto_236459 ) ) ( not ( = ?auto_236450 ?auto_236460 ) ) ( not ( = ?auto_236450 ?auto_236461 ) ) ( not ( = ?auto_236450 ?auto_236462 ) ) ( not ( = ?auto_236451 ?auto_236452 ) ) ( not ( = ?auto_236451 ?auto_236453 ) ) ( not ( = ?auto_236451 ?auto_236454 ) ) ( not ( = ?auto_236451 ?auto_236455 ) ) ( not ( = ?auto_236451 ?auto_236456 ) ) ( not ( = ?auto_236451 ?auto_236457 ) ) ( not ( = ?auto_236451 ?auto_236458 ) ) ( not ( = ?auto_236451 ?auto_236459 ) ) ( not ( = ?auto_236451 ?auto_236460 ) ) ( not ( = ?auto_236451 ?auto_236461 ) ) ( not ( = ?auto_236451 ?auto_236462 ) ) ( not ( = ?auto_236452 ?auto_236453 ) ) ( not ( = ?auto_236452 ?auto_236454 ) ) ( not ( = ?auto_236452 ?auto_236455 ) ) ( not ( = ?auto_236452 ?auto_236456 ) ) ( not ( = ?auto_236452 ?auto_236457 ) ) ( not ( = ?auto_236452 ?auto_236458 ) ) ( not ( = ?auto_236452 ?auto_236459 ) ) ( not ( = ?auto_236452 ?auto_236460 ) ) ( not ( = ?auto_236452 ?auto_236461 ) ) ( not ( = ?auto_236452 ?auto_236462 ) ) ( not ( = ?auto_236453 ?auto_236454 ) ) ( not ( = ?auto_236453 ?auto_236455 ) ) ( not ( = ?auto_236453 ?auto_236456 ) ) ( not ( = ?auto_236453 ?auto_236457 ) ) ( not ( = ?auto_236453 ?auto_236458 ) ) ( not ( = ?auto_236453 ?auto_236459 ) ) ( not ( = ?auto_236453 ?auto_236460 ) ) ( not ( = ?auto_236453 ?auto_236461 ) ) ( not ( = ?auto_236453 ?auto_236462 ) ) ( not ( = ?auto_236454 ?auto_236455 ) ) ( not ( = ?auto_236454 ?auto_236456 ) ) ( not ( = ?auto_236454 ?auto_236457 ) ) ( not ( = ?auto_236454 ?auto_236458 ) ) ( not ( = ?auto_236454 ?auto_236459 ) ) ( not ( = ?auto_236454 ?auto_236460 ) ) ( not ( = ?auto_236454 ?auto_236461 ) ) ( not ( = ?auto_236454 ?auto_236462 ) ) ( not ( = ?auto_236455 ?auto_236456 ) ) ( not ( = ?auto_236455 ?auto_236457 ) ) ( not ( = ?auto_236455 ?auto_236458 ) ) ( not ( = ?auto_236455 ?auto_236459 ) ) ( not ( = ?auto_236455 ?auto_236460 ) ) ( not ( = ?auto_236455 ?auto_236461 ) ) ( not ( = ?auto_236455 ?auto_236462 ) ) ( not ( = ?auto_236456 ?auto_236457 ) ) ( not ( = ?auto_236456 ?auto_236458 ) ) ( not ( = ?auto_236456 ?auto_236459 ) ) ( not ( = ?auto_236456 ?auto_236460 ) ) ( not ( = ?auto_236456 ?auto_236461 ) ) ( not ( = ?auto_236456 ?auto_236462 ) ) ( not ( = ?auto_236457 ?auto_236458 ) ) ( not ( = ?auto_236457 ?auto_236459 ) ) ( not ( = ?auto_236457 ?auto_236460 ) ) ( not ( = ?auto_236457 ?auto_236461 ) ) ( not ( = ?auto_236457 ?auto_236462 ) ) ( not ( = ?auto_236458 ?auto_236459 ) ) ( not ( = ?auto_236458 ?auto_236460 ) ) ( not ( = ?auto_236458 ?auto_236461 ) ) ( not ( = ?auto_236458 ?auto_236462 ) ) ( not ( = ?auto_236459 ?auto_236460 ) ) ( not ( = ?auto_236459 ?auto_236461 ) ) ( not ( = ?auto_236459 ?auto_236462 ) ) ( not ( = ?auto_236460 ?auto_236461 ) ) ( not ( = ?auto_236460 ?auto_236462 ) ) ( not ( = ?auto_236461 ?auto_236462 ) ) ( ON ?auto_236460 ?auto_236461 ) ( ON ?auto_236459 ?auto_236460 ) ( ON ?auto_236458 ?auto_236459 ) ( ON ?auto_236457 ?auto_236458 ) ( ON ?auto_236456 ?auto_236457 ) ( ON ?auto_236455 ?auto_236456 ) ( ON ?auto_236454 ?auto_236455 ) ( CLEAR ?auto_236452 ) ( ON ?auto_236453 ?auto_236454 ) ( CLEAR ?auto_236453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_236449 ?auto_236450 ?auto_236451 ?auto_236452 ?auto_236453 )
      ( MAKE-13PILE ?auto_236449 ?auto_236450 ?auto_236451 ?auto_236452 ?auto_236453 ?auto_236454 ?auto_236455 ?auto_236456 ?auto_236457 ?auto_236458 ?auto_236459 ?auto_236460 ?auto_236461 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236476 - BLOCK
      ?auto_236477 - BLOCK
      ?auto_236478 - BLOCK
      ?auto_236479 - BLOCK
      ?auto_236480 - BLOCK
      ?auto_236481 - BLOCK
      ?auto_236482 - BLOCK
      ?auto_236483 - BLOCK
      ?auto_236484 - BLOCK
      ?auto_236485 - BLOCK
      ?auto_236486 - BLOCK
      ?auto_236487 - BLOCK
      ?auto_236488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236488 ) ( ON-TABLE ?auto_236476 ) ( ON ?auto_236477 ?auto_236476 ) ( ON ?auto_236478 ?auto_236477 ) ( ON ?auto_236479 ?auto_236478 ) ( not ( = ?auto_236476 ?auto_236477 ) ) ( not ( = ?auto_236476 ?auto_236478 ) ) ( not ( = ?auto_236476 ?auto_236479 ) ) ( not ( = ?auto_236476 ?auto_236480 ) ) ( not ( = ?auto_236476 ?auto_236481 ) ) ( not ( = ?auto_236476 ?auto_236482 ) ) ( not ( = ?auto_236476 ?auto_236483 ) ) ( not ( = ?auto_236476 ?auto_236484 ) ) ( not ( = ?auto_236476 ?auto_236485 ) ) ( not ( = ?auto_236476 ?auto_236486 ) ) ( not ( = ?auto_236476 ?auto_236487 ) ) ( not ( = ?auto_236476 ?auto_236488 ) ) ( not ( = ?auto_236477 ?auto_236478 ) ) ( not ( = ?auto_236477 ?auto_236479 ) ) ( not ( = ?auto_236477 ?auto_236480 ) ) ( not ( = ?auto_236477 ?auto_236481 ) ) ( not ( = ?auto_236477 ?auto_236482 ) ) ( not ( = ?auto_236477 ?auto_236483 ) ) ( not ( = ?auto_236477 ?auto_236484 ) ) ( not ( = ?auto_236477 ?auto_236485 ) ) ( not ( = ?auto_236477 ?auto_236486 ) ) ( not ( = ?auto_236477 ?auto_236487 ) ) ( not ( = ?auto_236477 ?auto_236488 ) ) ( not ( = ?auto_236478 ?auto_236479 ) ) ( not ( = ?auto_236478 ?auto_236480 ) ) ( not ( = ?auto_236478 ?auto_236481 ) ) ( not ( = ?auto_236478 ?auto_236482 ) ) ( not ( = ?auto_236478 ?auto_236483 ) ) ( not ( = ?auto_236478 ?auto_236484 ) ) ( not ( = ?auto_236478 ?auto_236485 ) ) ( not ( = ?auto_236478 ?auto_236486 ) ) ( not ( = ?auto_236478 ?auto_236487 ) ) ( not ( = ?auto_236478 ?auto_236488 ) ) ( not ( = ?auto_236479 ?auto_236480 ) ) ( not ( = ?auto_236479 ?auto_236481 ) ) ( not ( = ?auto_236479 ?auto_236482 ) ) ( not ( = ?auto_236479 ?auto_236483 ) ) ( not ( = ?auto_236479 ?auto_236484 ) ) ( not ( = ?auto_236479 ?auto_236485 ) ) ( not ( = ?auto_236479 ?auto_236486 ) ) ( not ( = ?auto_236479 ?auto_236487 ) ) ( not ( = ?auto_236479 ?auto_236488 ) ) ( not ( = ?auto_236480 ?auto_236481 ) ) ( not ( = ?auto_236480 ?auto_236482 ) ) ( not ( = ?auto_236480 ?auto_236483 ) ) ( not ( = ?auto_236480 ?auto_236484 ) ) ( not ( = ?auto_236480 ?auto_236485 ) ) ( not ( = ?auto_236480 ?auto_236486 ) ) ( not ( = ?auto_236480 ?auto_236487 ) ) ( not ( = ?auto_236480 ?auto_236488 ) ) ( not ( = ?auto_236481 ?auto_236482 ) ) ( not ( = ?auto_236481 ?auto_236483 ) ) ( not ( = ?auto_236481 ?auto_236484 ) ) ( not ( = ?auto_236481 ?auto_236485 ) ) ( not ( = ?auto_236481 ?auto_236486 ) ) ( not ( = ?auto_236481 ?auto_236487 ) ) ( not ( = ?auto_236481 ?auto_236488 ) ) ( not ( = ?auto_236482 ?auto_236483 ) ) ( not ( = ?auto_236482 ?auto_236484 ) ) ( not ( = ?auto_236482 ?auto_236485 ) ) ( not ( = ?auto_236482 ?auto_236486 ) ) ( not ( = ?auto_236482 ?auto_236487 ) ) ( not ( = ?auto_236482 ?auto_236488 ) ) ( not ( = ?auto_236483 ?auto_236484 ) ) ( not ( = ?auto_236483 ?auto_236485 ) ) ( not ( = ?auto_236483 ?auto_236486 ) ) ( not ( = ?auto_236483 ?auto_236487 ) ) ( not ( = ?auto_236483 ?auto_236488 ) ) ( not ( = ?auto_236484 ?auto_236485 ) ) ( not ( = ?auto_236484 ?auto_236486 ) ) ( not ( = ?auto_236484 ?auto_236487 ) ) ( not ( = ?auto_236484 ?auto_236488 ) ) ( not ( = ?auto_236485 ?auto_236486 ) ) ( not ( = ?auto_236485 ?auto_236487 ) ) ( not ( = ?auto_236485 ?auto_236488 ) ) ( not ( = ?auto_236486 ?auto_236487 ) ) ( not ( = ?auto_236486 ?auto_236488 ) ) ( not ( = ?auto_236487 ?auto_236488 ) ) ( ON ?auto_236487 ?auto_236488 ) ( ON ?auto_236486 ?auto_236487 ) ( ON ?auto_236485 ?auto_236486 ) ( ON ?auto_236484 ?auto_236485 ) ( ON ?auto_236483 ?auto_236484 ) ( ON ?auto_236482 ?auto_236483 ) ( ON ?auto_236481 ?auto_236482 ) ( CLEAR ?auto_236479 ) ( ON ?auto_236480 ?auto_236481 ) ( CLEAR ?auto_236480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_236476 ?auto_236477 ?auto_236478 ?auto_236479 ?auto_236480 )
      ( MAKE-13PILE ?auto_236476 ?auto_236477 ?auto_236478 ?auto_236479 ?auto_236480 ?auto_236481 ?auto_236482 ?auto_236483 ?auto_236484 ?auto_236485 ?auto_236486 ?auto_236487 ?auto_236488 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236502 - BLOCK
      ?auto_236503 - BLOCK
      ?auto_236504 - BLOCK
      ?auto_236505 - BLOCK
      ?auto_236506 - BLOCK
      ?auto_236507 - BLOCK
      ?auto_236508 - BLOCK
      ?auto_236509 - BLOCK
      ?auto_236510 - BLOCK
      ?auto_236511 - BLOCK
      ?auto_236512 - BLOCK
      ?auto_236513 - BLOCK
      ?auto_236514 - BLOCK
    )
    :vars
    (
      ?auto_236515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236514 ?auto_236515 ) ( ON-TABLE ?auto_236502 ) ( ON ?auto_236503 ?auto_236502 ) ( ON ?auto_236504 ?auto_236503 ) ( not ( = ?auto_236502 ?auto_236503 ) ) ( not ( = ?auto_236502 ?auto_236504 ) ) ( not ( = ?auto_236502 ?auto_236505 ) ) ( not ( = ?auto_236502 ?auto_236506 ) ) ( not ( = ?auto_236502 ?auto_236507 ) ) ( not ( = ?auto_236502 ?auto_236508 ) ) ( not ( = ?auto_236502 ?auto_236509 ) ) ( not ( = ?auto_236502 ?auto_236510 ) ) ( not ( = ?auto_236502 ?auto_236511 ) ) ( not ( = ?auto_236502 ?auto_236512 ) ) ( not ( = ?auto_236502 ?auto_236513 ) ) ( not ( = ?auto_236502 ?auto_236514 ) ) ( not ( = ?auto_236502 ?auto_236515 ) ) ( not ( = ?auto_236503 ?auto_236504 ) ) ( not ( = ?auto_236503 ?auto_236505 ) ) ( not ( = ?auto_236503 ?auto_236506 ) ) ( not ( = ?auto_236503 ?auto_236507 ) ) ( not ( = ?auto_236503 ?auto_236508 ) ) ( not ( = ?auto_236503 ?auto_236509 ) ) ( not ( = ?auto_236503 ?auto_236510 ) ) ( not ( = ?auto_236503 ?auto_236511 ) ) ( not ( = ?auto_236503 ?auto_236512 ) ) ( not ( = ?auto_236503 ?auto_236513 ) ) ( not ( = ?auto_236503 ?auto_236514 ) ) ( not ( = ?auto_236503 ?auto_236515 ) ) ( not ( = ?auto_236504 ?auto_236505 ) ) ( not ( = ?auto_236504 ?auto_236506 ) ) ( not ( = ?auto_236504 ?auto_236507 ) ) ( not ( = ?auto_236504 ?auto_236508 ) ) ( not ( = ?auto_236504 ?auto_236509 ) ) ( not ( = ?auto_236504 ?auto_236510 ) ) ( not ( = ?auto_236504 ?auto_236511 ) ) ( not ( = ?auto_236504 ?auto_236512 ) ) ( not ( = ?auto_236504 ?auto_236513 ) ) ( not ( = ?auto_236504 ?auto_236514 ) ) ( not ( = ?auto_236504 ?auto_236515 ) ) ( not ( = ?auto_236505 ?auto_236506 ) ) ( not ( = ?auto_236505 ?auto_236507 ) ) ( not ( = ?auto_236505 ?auto_236508 ) ) ( not ( = ?auto_236505 ?auto_236509 ) ) ( not ( = ?auto_236505 ?auto_236510 ) ) ( not ( = ?auto_236505 ?auto_236511 ) ) ( not ( = ?auto_236505 ?auto_236512 ) ) ( not ( = ?auto_236505 ?auto_236513 ) ) ( not ( = ?auto_236505 ?auto_236514 ) ) ( not ( = ?auto_236505 ?auto_236515 ) ) ( not ( = ?auto_236506 ?auto_236507 ) ) ( not ( = ?auto_236506 ?auto_236508 ) ) ( not ( = ?auto_236506 ?auto_236509 ) ) ( not ( = ?auto_236506 ?auto_236510 ) ) ( not ( = ?auto_236506 ?auto_236511 ) ) ( not ( = ?auto_236506 ?auto_236512 ) ) ( not ( = ?auto_236506 ?auto_236513 ) ) ( not ( = ?auto_236506 ?auto_236514 ) ) ( not ( = ?auto_236506 ?auto_236515 ) ) ( not ( = ?auto_236507 ?auto_236508 ) ) ( not ( = ?auto_236507 ?auto_236509 ) ) ( not ( = ?auto_236507 ?auto_236510 ) ) ( not ( = ?auto_236507 ?auto_236511 ) ) ( not ( = ?auto_236507 ?auto_236512 ) ) ( not ( = ?auto_236507 ?auto_236513 ) ) ( not ( = ?auto_236507 ?auto_236514 ) ) ( not ( = ?auto_236507 ?auto_236515 ) ) ( not ( = ?auto_236508 ?auto_236509 ) ) ( not ( = ?auto_236508 ?auto_236510 ) ) ( not ( = ?auto_236508 ?auto_236511 ) ) ( not ( = ?auto_236508 ?auto_236512 ) ) ( not ( = ?auto_236508 ?auto_236513 ) ) ( not ( = ?auto_236508 ?auto_236514 ) ) ( not ( = ?auto_236508 ?auto_236515 ) ) ( not ( = ?auto_236509 ?auto_236510 ) ) ( not ( = ?auto_236509 ?auto_236511 ) ) ( not ( = ?auto_236509 ?auto_236512 ) ) ( not ( = ?auto_236509 ?auto_236513 ) ) ( not ( = ?auto_236509 ?auto_236514 ) ) ( not ( = ?auto_236509 ?auto_236515 ) ) ( not ( = ?auto_236510 ?auto_236511 ) ) ( not ( = ?auto_236510 ?auto_236512 ) ) ( not ( = ?auto_236510 ?auto_236513 ) ) ( not ( = ?auto_236510 ?auto_236514 ) ) ( not ( = ?auto_236510 ?auto_236515 ) ) ( not ( = ?auto_236511 ?auto_236512 ) ) ( not ( = ?auto_236511 ?auto_236513 ) ) ( not ( = ?auto_236511 ?auto_236514 ) ) ( not ( = ?auto_236511 ?auto_236515 ) ) ( not ( = ?auto_236512 ?auto_236513 ) ) ( not ( = ?auto_236512 ?auto_236514 ) ) ( not ( = ?auto_236512 ?auto_236515 ) ) ( not ( = ?auto_236513 ?auto_236514 ) ) ( not ( = ?auto_236513 ?auto_236515 ) ) ( not ( = ?auto_236514 ?auto_236515 ) ) ( ON ?auto_236513 ?auto_236514 ) ( ON ?auto_236512 ?auto_236513 ) ( ON ?auto_236511 ?auto_236512 ) ( ON ?auto_236510 ?auto_236511 ) ( ON ?auto_236509 ?auto_236510 ) ( ON ?auto_236508 ?auto_236509 ) ( ON ?auto_236507 ?auto_236508 ) ( ON ?auto_236506 ?auto_236507 ) ( CLEAR ?auto_236504 ) ( ON ?auto_236505 ?auto_236506 ) ( CLEAR ?auto_236505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_236502 ?auto_236503 ?auto_236504 ?auto_236505 )
      ( MAKE-13PILE ?auto_236502 ?auto_236503 ?auto_236504 ?auto_236505 ?auto_236506 ?auto_236507 ?auto_236508 ?auto_236509 ?auto_236510 ?auto_236511 ?auto_236512 ?auto_236513 ?auto_236514 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236529 - BLOCK
      ?auto_236530 - BLOCK
      ?auto_236531 - BLOCK
      ?auto_236532 - BLOCK
      ?auto_236533 - BLOCK
      ?auto_236534 - BLOCK
      ?auto_236535 - BLOCK
      ?auto_236536 - BLOCK
      ?auto_236537 - BLOCK
      ?auto_236538 - BLOCK
      ?auto_236539 - BLOCK
      ?auto_236540 - BLOCK
      ?auto_236541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236541 ) ( ON-TABLE ?auto_236529 ) ( ON ?auto_236530 ?auto_236529 ) ( ON ?auto_236531 ?auto_236530 ) ( not ( = ?auto_236529 ?auto_236530 ) ) ( not ( = ?auto_236529 ?auto_236531 ) ) ( not ( = ?auto_236529 ?auto_236532 ) ) ( not ( = ?auto_236529 ?auto_236533 ) ) ( not ( = ?auto_236529 ?auto_236534 ) ) ( not ( = ?auto_236529 ?auto_236535 ) ) ( not ( = ?auto_236529 ?auto_236536 ) ) ( not ( = ?auto_236529 ?auto_236537 ) ) ( not ( = ?auto_236529 ?auto_236538 ) ) ( not ( = ?auto_236529 ?auto_236539 ) ) ( not ( = ?auto_236529 ?auto_236540 ) ) ( not ( = ?auto_236529 ?auto_236541 ) ) ( not ( = ?auto_236530 ?auto_236531 ) ) ( not ( = ?auto_236530 ?auto_236532 ) ) ( not ( = ?auto_236530 ?auto_236533 ) ) ( not ( = ?auto_236530 ?auto_236534 ) ) ( not ( = ?auto_236530 ?auto_236535 ) ) ( not ( = ?auto_236530 ?auto_236536 ) ) ( not ( = ?auto_236530 ?auto_236537 ) ) ( not ( = ?auto_236530 ?auto_236538 ) ) ( not ( = ?auto_236530 ?auto_236539 ) ) ( not ( = ?auto_236530 ?auto_236540 ) ) ( not ( = ?auto_236530 ?auto_236541 ) ) ( not ( = ?auto_236531 ?auto_236532 ) ) ( not ( = ?auto_236531 ?auto_236533 ) ) ( not ( = ?auto_236531 ?auto_236534 ) ) ( not ( = ?auto_236531 ?auto_236535 ) ) ( not ( = ?auto_236531 ?auto_236536 ) ) ( not ( = ?auto_236531 ?auto_236537 ) ) ( not ( = ?auto_236531 ?auto_236538 ) ) ( not ( = ?auto_236531 ?auto_236539 ) ) ( not ( = ?auto_236531 ?auto_236540 ) ) ( not ( = ?auto_236531 ?auto_236541 ) ) ( not ( = ?auto_236532 ?auto_236533 ) ) ( not ( = ?auto_236532 ?auto_236534 ) ) ( not ( = ?auto_236532 ?auto_236535 ) ) ( not ( = ?auto_236532 ?auto_236536 ) ) ( not ( = ?auto_236532 ?auto_236537 ) ) ( not ( = ?auto_236532 ?auto_236538 ) ) ( not ( = ?auto_236532 ?auto_236539 ) ) ( not ( = ?auto_236532 ?auto_236540 ) ) ( not ( = ?auto_236532 ?auto_236541 ) ) ( not ( = ?auto_236533 ?auto_236534 ) ) ( not ( = ?auto_236533 ?auto_236535 ) ) ( not ( = ?auto_236533 ?auto_236536 ) ) ( not ( = ?auto_236533 ?auto_236537 ) ) ( not ( = ?auto_236533 ?auto_236538 ) ) ( not ( = ?auto_236533 ?auto_236539 ) ) ( not ( = ?auto_236533 ?auto_236540 ) ) ( not ( = ?auto_236533 ?auto_236541 ) ) ( not ( = ?auto_236534 ?auto_236535 ) ) ( not ( = ?auto_236534 ?auto_236536 ) ) ( not ( = ?auto_236534 ?auto_236537 ) ) ( not ( = ?auto_236534 ?auto_236538 ) ) ( not ( = ?auto_236534 ?auto_236539 ) ) ( not ( = ?auto_236534 ?auto_236540 ) ) ( not ( = ?auto_236534 ?auto_236541 ) ) ( not ( = ?auto_236535 ?auto_236536 ) ) ( not ( = ?auto_236535 ?auto_236537 ) ) ( not ( = ?auto_236535 ?auto_236538 ) ) ( not ( = ?auto_236535 ?auto_236539 ) ) ( not ( = ?auto_236535 ?auto_236540 ) ) ( not ( = ?auto_236535 ?auto_236541 ) ) ( not ( = ?auto_236536 ?auto_236537 ) ) ( not ( = ?auto_236536 ?auto_236538 ) ) ( not ( = ?auto_236536 ?auto_236539 ) ) ( not ( = ?auto_236536 ?auto_236540 ) ) ( not ( = ?auto_236536 ?auto_236541 ) ) ( not ( = ?auto_236537 ?auto_236538 ) ) ( not ( = ?auto_236537 ?auto_236539 ) ) ( not ( = ?auto_236537 ?auto_236540 ) ) ( not ( = ?auto_236537 ?auto_236541 ) ) ( not ( = ?auto_236538 ?auto_236539 ) ) ( not ( = ?auto_236538 ?auto_236540 ) ) ( not ( = ?auto_236538 ?auto_236541 ) ) ( not ( = ?auto_236539 ?auto_236540 ) ) ( not ( = ?auto_236539 ?auto_236541 ) ) ( not ( = ?auto_236540 ?auto_236541 ) ) ( ON ?auto_236540 ?auto_236541 ) ( ON ?auto_236539 ?auto_236540 ) ( ON ?auto_236538 ?auto_236539 ) ( ON ?auto_236537 ?auto_236538 ) ( ON ?auto_236536 ?auto_236537 ) ( ON ?auto_236535 ?auto_236536 ) ( ON ?auto_236534 ?auto_236535 ) ( ON ?auto_236533 ?auto_236534 ) ( CLEAR ?auto_236531 ) ( ON ?auto_236532 ?auto_236533 ) ( CLEAR ?auto_236532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_236529 ?auto_236530 ?auto_236531 ?auto_236532 )
      ( MAKE-13PILE ?auto_236529 ?auto_236530 ?auto_236531 ?auto_236532 ?auto_236533 ?auto_236534 ?auto_236535 ?auto_236536 ?auto_236537 ?auto_236538 ?auto_236539 ?auto_236540 ?auto_236541 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236555 - BLOCK
      ?auto_236556 - BLOCK
      ?auto_236557 - BLOCK
      ?auto_236558 - BLOCK
      ?auto_236559 - BLOCK
      ?auto_236560 - BLOCK
      ?auto_236561 - BLOCK
      ?auto_236562 - BLOCK
      ?auto_236563 - BLOCK
      ?auto_236564 - BLOCK
      ?auto_236565 - BLOCK
      ?auto_236566 - BLOCK
      ?auto_236567 - BLOCK
    )
    :vars
    (
      ?auto_236568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236567 ?auto_236568 ) ( ON-TABLE ?auto_236555 ) ( ON ?auto_236556 ?auto_236555 ) ( not ( = ?auto_236555 ?auto_236556 ) ) ( not ( = ?auto_236555 ?auto_236557 ) ) ( not ( = ?auto_236555 ?auto_236558 ) ) ( not ( = ?auto_236555 ?auto_236559 ) ) ( not ( = ?auto_236555 ?auto_236560 ) ) ( not ( = ?auto_236555 ?auto_236561 ) ) ( not ( = ?auto_236555 ?auto_236562 ) ) ( not ( = ?auto_236555 ?auto_236563 ) ) ( not ( = ?auto_236555 ?auto_236564 ) ) ( not ( = ?auto_236555 ?auto_236565 ) ) ( not ( = ?auto_236555 ?auto_236566 ) ) ( not ( = ?auto_236555 ?auto_236567 ) ) ( not ( = ?auto_236555 ?auto_236568 ) ) ( not ( = ?auto_236556 ?auto_236557 ) ) ( not ( = ?auto_236556 ?auto_236558 ) ) ( not ( = ?auto_236556 ?auto_236559 ) ) ( not ( = ?auto_236556 ?auto_236560 ) ) ( not ( = ?auto_236556 ?auto_236561 ) ) ( not ( = ?auto_236556 ?auto_236562 ) ) ( not ( = ?auto_236556 ?auto_236563 ) ) ( not ( = ?auto_236556 ?auto_236564 ) ) ( not ( = ?auto_236556 ?auto_236565 ) ) ( not ( = ?auto_236556 ?auto_236566 ) ) ( not ( = ?auto_236556 ?auto_236567 ) ) ( not ( = ?auto_236556 ?auto_236568 ) ) ( not ( = ?auto_236557 ?auto_236558 ) ) ( not ( = ?auto_236557 ?auto_236559 ) ) ( not ( = ?auto_236557 ?auto_236560 ) ) ( not ( = ?auto_236557 ?auto_236561 ) ) ( not ( = ?auto_236557 ?auto_236562 ) ) ( not ( = ?auto_236557 ?auto_236563 ) ) ( not ( = ?auto_236557 ?auto_236564 ) ) ( not ( = ?auto_236557 ?auto_236565 ) ) ( not ( = ?auto_236557 ?auto_236566 ) ) ( not ( = ?auto_236557 ?auto_236567 ) ) ( not ( = ?auto_236557 ?auto_236568 ) ) ( not ( = ?auto_236558 ?auto_236559 ) ) ( not ( = ?auto_236558 ?auto_236560 ) ) ( not ( = ?auto_236558 ?auto_236561 ) ) ( not ( = ?auto_236558 ?auto_236562 ) ) ( not ( = ?auto_236558 ?auto_236563 ) ) ( not ( = ?auto_236558 ?auto_236564 ) ) ( not ( = ?auto_236558 ?auto_236565 ) ) ( not ( = ?auto_236558 ?auto_236566 ) ) ( not ( = ?auto_236558 ?auto_236567 ) ) ( not ( = ?auto_236558 ?auto_236568 ) ) ( not ( = ?auto_236559 ?auto_236560 ) ) ( not ( = ?auto_236559 ?auto_236561 ) ) ( not ( = ?auto_236559 ?auto_236562 ) ) ( not ( = ?auto_236559 ?auto_236563 ) ) ( not ( = ?auto_236559 ?auto_236564 ) ) ( not ( = ?auto_236559 ?auto_236565 ) ) ( not ( = ?auto_236559 ?auto_236566 ) ) ( not ( = ?auto_236559 ?auto_236567 ) ) ( not ( = ?auto_236559 ?auto_236568 ) ) ( not ( = ?auto_236560 ?auto_236561 ) ) ( not ( = ?auto_236560 ?auto_236562 ) ) ( not ( = ?auto_236560 ?auto_236563 ) ) ( not ( = ?auto_236560 ?auto_236564 ) ) ( not ( = ?auto_236560 ?auto_236565 ) ) ( not ( = ?auto_236560 ?auto_236566 ) ) ( not ( = ?auto_236560 ?auto_236567 ) ) ( not ( = ?auto_236560 ?auto_236568 ) ) ( not ( = ?auto_236561 ?auto_236562 ) ) ( not ( = ?auto_236561 ?auto_236563 ) ) ( not ( = ?auto_236561 ?auto_236564 ) ) ( not ( = ?auto_236561 ?auto_236565 ) ) ( not ( = ?auto_236561 ?auto_236566 ) ) ( not ( = ?auto_236561 ?auto_236567 ) ) ( not ( = ?auto_236561 ?auto_236568 ) ) ( not ( = ?auto_236562 ?auto_236563 ) ) ( not ( = ?auto_236562 ?auto_236564 ) ) ( not ( = ?auto_236562 ?auto_236565 ) ) ( not ( = ?auto_236562 ?auto_236566 ) ) ( not ( = ?auto_236562 ?auto_236567 ) ) ( not ( = ?auto_236562 ?auto_236568 ) ) ( not ( = ?auto_236563 ?auto_236564 ) ) ( not ( = ?auto_236563 ?auto_236565 ) ) ( not ( = ?auto_236563 ?auto_236566 ) ) ( not ( = ?auto_236563 ?auto_236567 ) ) ( not ( = ?auto_236563 ?auto_236568 ) ) ( not ( = ?auto_236564 ?auto_236565 ) ) ( not ( = ?auto_236564 ?auto_236566 ) ) ( not ( = ?auto_236564 ?auto_236567 ) ) ( not ( = ?auto_236564 ?auto_236568 ) ) ( not ( = ?auto_236565 ?auto_236566 ) ) ( not ( = ?auto_236565 ?auto_236567 ) ) ( not ( = ?auto_236565 ?auto_236568 ) ) ( not ( = ?auto_236566 ?auto_236567 ) ) ( not ( = ?auto_236566 ?auto_236568 ) ) ( not ( = ?auto_236567 ?auto_236568 ) ) ( ON ?auto_236566 ?auto_236567 ) ( ON ?auto_236565 ?auto_236566 ) ( ON ?auto_236564 ?auto_236565 ) ( ON ?auto_236563 ?auto_236564 ) ( ON ?auto_236562 ?auto_236563 ) ( ON ?auto_236561 ?auto_236562 ) ( ON ?auto_236560 ?auto_236561 ) ( ON ?auto_236559 ?auto_236560 ) ( ON ?auto_236558 ?auto_236559 ) ( CLEAR ?auto_236556 ) ( ON ?auto_236557 ?auto_236558 ) ( CLEAR ?auto_236557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236555 ?auto_236556 ?auto_236557 )
      ( MAKE-13PILE ?auto_236555 ?auto_236556 ?auto_236557 ?auto_236558 ?auto_236559 ?auto_236560 ?auto_236561 ?auto_236562 ?auto_236563 ?auto_236564 ?auto_236565 ?auto_236566 ?auto_236567 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236582 - BLOCK
      ?auto_236583 - BLOCK
      ?auto_236584 - BLOCK
      ?auto_236585 - BLOCK
      ?auto_236586 - BLOCK
      ?auto_236587 - BLOCK
      ?auto_236588 - BLOCK
      ?auto_236589 - BLOCK
      ?auto_236590 - BLOCK
      ?auto_236591 - BLOCK
      ?auto_236592 - BLOCK
      ?auto_236593 - BLOCK
      ?auto_236594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236594 ) ( ON-TABLE ?auto_236582 ) ( ON ?auto_236583 ?auto_236582 ) ( not ( = ?auto_236582 ?auto_236583 ) ) ( not ( = ?auto_236582 ?auto_236584 ) ) ( not ( = ?auto_236582 ?auto_236585 ) ) ( not ( = ?auto_236582 ?auto_236586 ) ) ( not ( = ?auto_236582 ?auto_236587 ) ) ( not ( = ?auto_236582 ?auto_236588 ) ) ( not ( = ?auto_236582 ?auto_236589 ) ) ( not ( = ?auto_236582 ?auto_236590 ) ) ( not ( = ?auto_236582 ?auto_236591 ) ) ( not ( = ?auto_236582 ?auto_236592 ) ) ( not ( = ?auto_236582 ?auto_236593 ) ) ( not ( = ?auto_236582 ?auto_236594 ) ) ( not ( = ?auto_236583 ?auto_236584 ) ) ( not ( = ?auto_236583 ?auto_236585 ) ) ( not ( = ?auto_236583 ?auto_236586 ) ) ( not ( = ?auto_236583 ?auto_236587 ) ) ( not ( = ?auto_236583 ?auto_236588 ) ) ( not ( = ?auto_236583 ?auto_236589 ) ) ( not ( = ?auto_236583 ?auto_236590 ) ) ( not ( = ?auto_236583 ?auto_236591 ) ) ( not ( = ?auto_236583 ?auto_236592 ) ) ( not ( = ?auto_236583 ?auto_236593 ) ) ( not ( = ?auto_236583 ?auto_236594 ) ) ( not ( = ?auto_236584 ?auto_236585 ) ) ( not ( = ?auto_236584 ?auto_236586 ) ) ( not ( = ?auto_236584 ?auto_236587 ) ) ( not ( = ?auto_236584 ?auto_236588 ) ) ( not ( = ?auto_236584 ?auto_236589 ) ) ( not ( = ?auto_236584 ?auto_236590 ) ) ( not ( = ?auto_236584 ?auto_236591 ) ) ( not ( = ?auto_236584 ?auto_236592 ) ) ( not ( = ?auto_236584 ?auto_236593 ) ) ( not ( = ?auto_236584 ?auto_236594 ) ) ( not ( = ?auto_236585 ?auto_236586 ) ) ( not ( = ?auto_236585 ?auto_236587 ) ) ( not ( = ?auto_236585 ?auto_236588 ) ) ( not ( = ?auto_236585 ?auto_236589 ) ) ( not ( = ?auto_236585 ?auto_236590 ) ) ( not ( = ?auto_236585 ?auto_236591 ) ) ( not ( = ?auto_236585 ?auto_236592 ) ) ( not ( = ?auto_236585 ?auto_236593 ) ) ( not ( = ?auto_236585 ?auto_236594 ) ) ( not ( = ?auto_236586 ?auto_236587 ) ) ( not ( = ?auto_236586 ?auto_236588 ) ) ( not ( = ?auto_236586 ?auto_236589 ) ) ( not ( = ?auto_236586 ?auto_236590 ) ) ( not ( = ?auto_236586 ?auto_236591 ) ) ( not ( = ?auto_236586 ?auto_236592 ) ) ( not ( = ?auto_236586 ?auto_236593 ) ) ( not ( = ?auto_236586 ?auto_236594 ) ) ( not ( = ?auto_236587 ?auto_236588 ) ) ( not ( = ?auto_236587 ?auto_236589 ) ) ( not ( = ?auto_236587 ?auto_236590 ) ) ( not ( = ?auto_236587 ?auto_236591 ) ) ( not ( = ?auto_236587 ?auto_236592 ) ) ( not ( = ?auto_236587 ?auto_236593 ) ) ( not ( = ?auto_236587 ?auto_236594 ) ) ( not ( = ?auto_236588 ?auto_236589 ) ) ( not ( = ?auto_236588 ?auto_236590 ) ) ( not ( = ?auto_236588 ?auto_236591 ) ) ( not ( = ?auto_236588 ?auto_236592 ) ) ( not ( = ?auto_236588 ?auto_236593 ) ) ( not ( = ?auto_236588 ?auto_236594 ) ) ( not ( = ?auto_236589 ?auto_236590 ) ) ( not ( = ?auto_236589 ?auto_236591 ) ) ( not ( = ?auto_236589 ?auto_236592 ) ) ( not ( = ?auto_236589 ?auto_236593 ) ) ( not ( = ?auto_236589 ?auto_236594 ) ) ( not ( = ?auto_236590 ?auto_236591 ) ) ( not ( = ?auto_236590 ?auto_236592 ) ) ( not ( = ?auto_236590 ?auto_236593 ) ) ( not ( = ?auto_236590 ?auto_236594 ) ) ( not ( = ?auto_236591 ?auto_236592 ) ) ( not ( = ?auto_236591 ?auto_236593 ) ) ( not ( = ?auto_236591 ?auto_236594 ) ) ( not ( = ?auto_236592 ?auto_236593 ) ) ( not ( = ?auto_236592 ?auto_236594 ) ) ( not ( = ?auto_236593 ?auto_236594 ) ) ( ON ?auto_236593 ?auto_236594 ) ( ON ?auto_236592 ?auto_236593 ) ( ON ?auto_236591 ?auto_236592 ) ( ON ?auto_236590 ?auto_236591 ) ( ON ?auto_236589 ?auto_236590 ) ( ON ?auto_236588 ?auto_236589 ) ( ON ?auto_236587 ?auto_236588 ) ( ON ?auto_236586 ?auto_236587 ) ( ON ?auto_236585 ?auto_236586 ) ( CLEAR ?auto_236583 ) ( ON ?auto_236584 ?auto_236585 ) ( CLEAR ?auto_236584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236582 ?auto_236583 ?auto_236584 )
      ( MAKE-13PILE ?auto_236582 ?auto_236583 ?auto_236584 ?auto_236585 ?auto_236586 ?auto_236587 ?auto_236588 ?auto_236589 ?auto_236590 ?auto_236591 ?auto_236592 ?auto_236593 ?auto_236594 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236608 - BLOCK
      ?auto_236609 - BLOCK
      ?auto_236610 - BLOCK
      ?auto_236611 - BLOCK
      ?auto_236612 - BLOCK
      ?auto_236613 - BLOCK
      ?auto_236614 - BLOCK
      ?auto_236615 - BLOCK
      ?auto_236616 - BLOCK
      ?auto_236617 - BLOCK
      ?auto_236618 - BLOCK
      ?auto_236619 - BLOCK
      ?auto_236620 - BLOCK
    )
    :vars
    (
      ?auto_236621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236620 ?auto_236621 ) ( ON-TABLE ?auto_236608 ) ( not ( = ?auto_236608 ?auto_236609 ) ) ( not ( = ?auto_236608 ?auto_236610 ) ) ( not ( = ?auto_236608 ?auto_236611 ) ) ( not ( = ?auto_236608 ?auto_236612 ) ) ( not ( = ?auto_236608 ?auto_236613 ) ) ( not ( = ?auto_236608 ?auto_236614 ) ) ( not ( = ?auto_236608 ?auto_236615 ) ) ( not ( = ?auto_236608 ?auto_236616 ) ) ( not ( = ?auto_236608 ?auto_236617 ) ) ( not ( = ?auto_236608 ?auto_236618 ) ) ( not ( = ?auto_236608 ?auto_236619 ) ) ( not ( = ?auto_236608 ?auto_236620 ) ) ( not ( = ?auto_236608 ?auto_236621 ) ) ( not ( = ?auto_236609 ?auto_236610 ) ) ( not ( = ?auto_236609 ?auto_236611 ) ) ( not ( = ?auto_236609 ?auto_236612 ) ) ( not ( = ?auto_236609 ?auto_236613 ) ) ( not ( = ?auto_236609 ?auto_236614 ) ) ( not ( = ?auto_236609 ?auto_236615 ) ) ( not ( = ?auto_236609 ?auto_236616 ) ) ( not ( = ?auto_236609 ?auto_236617 ) ) ( not ( = ?auto_236609 ?auto_236618 ) ) ( not ( = ?auto_236609 ?auto_236619 ) ) ( not ( = ?auto_236609 ?auto_236620 ) ) ( not ( = ?auto_236609 ?auto_236621 ) ) ( not ( = ?auto_236610 ?auto_236611 ) ) ( not ( = ?auto_236610 ?auto_236612 ) ) ( not ( = ?auto_236610 ?auto_236613 ) ) ( not ( = ?auto_236610 ?auto_236614 ) ) ( not ( = ?auto_236610 ?auto_236615 ) ) ( not ( = ?auto_236610 ?auto_236616 ) ) ( not ( = ?auto_236610 ?auto_236617 ) ) ( not ( = ?auto_236610 ?auto_236618 ) ) ( not ( = ?auto_236610 ?auto_236619 ) ) ( not ( = ?auto_236610 ?auto_236620 ) ) ( not ( = ?auto_236610 ?auto_236621 ) ) ( not ( = ?auto_236611 ?auto_236612 ) ) ( not ( = ?auto_236611 ?auto_236613 ) ) ( not ( = ?auto_236611 ?auto_236614 ) ) ( not ( = ?auto_236611 ?auto_236615 ) ) ( not ( = ?auto_236611 ?auto_236616 ) ) ( not ( = ?auto_236611 ?auto_236617 ) ) ( not ( = ?auto_236611 ?auto_236618 ) ) ( not ( = ?auto_236611 ?auto_236619 ) ) ( not ( = ?auto_236611 ?auto_236620 ) ) ( not ( = ?auto_236611 ?auto_236621 ) ) ( not ( = ?auto_236612 ?auto_236613 ) ) ( not ( = ?auto_236612 ?auto_236614 ) ) ( not ( = ?auto_236612 ?auto_236615 ) ) ( not ( = ?auto_236612 ?auto_236616 ) ) ( not ( = ?auto_236612 ?auto_236617 ) ) ( not ( = ?auto_236612 ?auto_236618 ) ) ( not ( = ?auto_236612 ?auto_236619 ) ) ( not ( = ?auto_236612 ?auto_236620 ) ) ( not ( = ?auto_236612 ?auto_236621 ) ) ( not ( = ?auto_236613 ?auto_236614 ) ) ( not ( = ?auto_236613 ?auto_236615 ) ) ( not ( = ?auto_236613 ?auto_236616 ) ) ( not ( = ?auto_236613 ?auto_236617 ) ) ( not ( = ?auto_236613 ?auto_236618 ) ) ( not ( = ?auto_236613 ?auto_236619 ) ) ( not ( = ?auto_236613 ?auto_236620 ) ) ( not ( = ?auto_236613 ?auto_236621 ) ) ( not ( = ?auto_236614 ?auto_236615 ) ) ( not ( = ?auto_236614 ?auto_236616 ) ) ( not ( = ?auto_236614 ?auto_236617 ) ) ( not ( = ?auto_236614 ?auto_236618 ) ) ( not ( = ?auto_236614 ?auto_236619 ) ) ( not ( = ?auto_236614 ?auto_236620 ) ) ( not ( = ?auto_236614 ?auto_236621 ) ) ( not ( = ?auto_236615 ?auto_236616 ) ) ( not ( = ?auto_236615 ?auto_236617 ) ) ( not ( = ?auto_236615 ?auto_236618 ) ) ( not ( = ?auto_236615 ?auto_236619 ) ) ( not ( = ?auto_236615 ?auto_236620 ) ) ( not ( = ?auto_236615 ?auto_236621 ) ) ( not ( = ?auto_236616 ?auto_236617 ) ) ( not ( = ?auto_236616 ?auto_236618 ) ) ( not ( = ?auto_236616 ?auto_236619 ) ) ( not ( = ?auto_236616 ?auto_236620 ) ) ( not ( = ?auto_236616 ?auto_236621 ) ) ( not ( = ?auto_236617 ?auto_236618 ) ) ( not ( = ?auto_236617 ?auto_236619 ) ) ( not ( = ?auto_236617 ?auto_236620 ) ) ( not ( = ?auto_236617 ?auto_236621 ) ) ( not ( = ?auto_236618 ?auto_236619 ) ) ( not ( = ?auto_236618 ?auto_236620 ) ) ( not ( = ?auto_236618 ?auto_236621 ) ) ( not ( = ?auto_236619 ?auto_236620 ) ) ( not ( = ?auto_236619 ?auto_236621 ) ) ( not ( = ?auto_236620 ?auto_236621 ) ) ( ON ?auto_236619 ?auto_236620 ) ( ON ?auto_236618 ?auto_236619 ) ( ON ?auto_236617 ?auto_236618 ) ( ON ?auto_236616 ?auto_236617 ) ( ON ?auto_236615 ?auto_236616 ) ( ON ?auto_236614 ?auto_236615 ) ( ON ?auto_236613 ?auto_236614 ) ( ON ?auto_236612 ?auto_236613 ) ( ON ?auto_236611 ?auto_236612 ) ( ON ?auto_236610 ?auto_236611 ) ( CLEAR ?auto_236608 ) ( ON ?auto_236609 ?auto_236610 ) ( CLEAR ?auto_236609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236608 ?auto_236609 )
      ( MAKE-13PILE ?auto_236608 ?auto_236609 ?auto_236610 ?auto_236611 ?auto_236612 ?auto_236613 ?auto_236614 ?auto_236615 ?auto_236616 ?auto_236617 ?auto_236618 ?auto_236619 ?auto_236620 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236635 - BLOCK
      ?auto_236636 - BLOCK
      ?auto_236637 - BLOCK
      ?auto_236638 - BLOCK
      ?auto_236639 - BLOCK
      ?auto_236640 - BLOCK
      ?auto_236641 - BLOCK
      ?auto_236642 - BLOCK
      ?auto_236643 - BLOCK
      ?auto_236644 - BLOCK
      ?auto_236645 - BLOCK
      ?auto_236646 - BLOCK
      ?auto_236647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236647 ) ( ON-TABLE ?auto_236635 ) ( not ( = ?auto_236635 ?auto_236636 ) ) ( not ( = ?auto_236635 ?auto_236637 ) ) ( not ( = ?auto_236635 ?auto_236638 ) ) ( not ( = ?auto_236635 ?auto_236639 ) ) ( not ( = ?auto_236635 ?auto_236640 ) ) ( not ( = ?auto_236635 ?auto_236641 ) ) ( not ( = ?auto_236635 ?auto_236642 ) ) ( not ( = ?auto_236635 ?auto_236643 ) ) ( not ( = ?auto_236635 ?auto_236644 ) ) ( not ( = ?auto_236635 ?auto_236645 ) ) ( not ( = ?auto_236635 ?auto_236646 ) ) ( not ( = ?auto_236635 ?auto_236647 ) ) ( not ( = ?auto_236636 ?auto_236637 ) ) ( not ( = ?auto_236636 ?auto_236638 ) ) ( not ( = ?auto_236636 ?auto_236639 ) ) ( not ( = ?auto_236636 ?auto_236640 ) ) ( not ( = ?auto_236636 ?auto_236641 ) ) ( not ( = ?auto_236636 ?auto_236642 ) ) ( not ( = ?auto_236636 ?auto_236643 ) ) ( not ( = ?auto_236636 ?auto_236644 ) ) ( not ( = ?auto_236636 ?auto_236645 ) ) ( not ( = ?auto_236636 ?auto_236646 ) ) ( not ( = ?auto_236636 ?auto_236647 ) ) ( not ( = ?auto_236637 ?auto_236638 ) ) ( not ( = ?auto_236637 ?auto_236639 ) ) ( not ( = ?auto_236637 ?auto_236640 ) ) ( not ( = ?auto_236637 ?auto_236641 ) ) ( not ( = ?auto_236637 ?auto_236642 ) ) ( not ( = ?auto_236637 ?auto_236643 ) ) ( not ( = ?auto_236637 ?auto_236644 ) ) ( not ( = ?auto_236637 ?auto_236645 ) ) ( not ( = ?auto_236637 ?auto_236646 ) ) ( not ( = ?auto_236637 ?auto_236647 ) ) ( not ( = ?auto_236638 ?auto_236639 ) ) ( not ( = ?auto_236638 ?auto_236640 ) ) ( not ( = ?auto_236638 ?auto_236641 ) ) ( not ( = ?auto_236638 ?auto_236642 ) ) ( not ( = ?auto_236638 ?auto_236643 ) ) ( not ( = ?auto_236638 ?auto_236644 ) ) ( not ( = ?auto_236638 ?auto_236645 ) ) ( not ( = ?auto_236638 ?auto_236646 ) ) ( not ( = ?auto_236638 ?auto_236647 ) ) ( not ( = ?auto_236639 ?auto_236640 ) ) ( not ( = ?auto_236639 ?auto_236641 ) ) ( not ( = ?auto_236639 ?auto_236642 ) ) ( not ( = ?auto_236639 ?auto_236643 ) ) ( not ( = ?auto_236639 ?auto_236644 ) ) ( not ( = ?auto_236639 ?auto_236645 ) ) ( not ( = ?auto_236639 ?auto_236646 ) ) ( not ( = ?auto_236639 ?auto_236647 ) ) ( not ( = ?auto_236640 ?auto_236641 ) ) ( not ( = ?auto_236640 ?auto_236642 ) ) ( not ( = ?auto_236640 ?auto_236643 ) ) ( not ( = ?auto_236640 ?auto_236644 ) ) ( not ( = ?auto_236640 ?auto_236645 ) ) ( not ( = ?auto_236640 ?auto_236646 ) ) ( not ( = ?auto_236640 ?auto_236647 ) ) ( not ( = ?auto_236641 ?auto_236642 ) ) ( not ( = ?auto_236641 ?auto_236643 ) ) ( not ( = ?auto_236641 ?auto_236644 ) ) ( not ( = ?auto_236641 ?auto_236645 ) ) ( not ( = ?auto_236641 ?auto_236646 ) ) ( not ( = ?auto_236641 ?auto_236647 ) ) ( not ( = ?auto_236642 ?auto_236643 ) ) ( not ( = ?auto_236642 ?auto_236644 ) ) ( not ( = ?auto_236642 ?auto_236645 ) ) ( not ( = ?auto_236642 ?auto_236646 ) ) ( not ( = ?auto_236642 ?auto_236647 ) ) ( not ( = ?auto_236643 ?auto_236644 ) ) ( not ( = ?auto_236643 ?auto_236645 ) ) ( not ( = ?auto_236643 ?auto_236646 ) ) ( not ( = ?auto_236643 ?auto_236647 ) ) ( not ( = ?auto_236644 ?auto_236645 ) ) ( not ( = ?auto_236644 ?auto_236646 ) ) ( not ( = ?auto_236644 ?auto_236647 ) ) ( not ( = ?auto_236645 ?auto_236646 ) ) ( not ( = ?auto_236645 ?auto_236647 ) ) ( not ( = ?auto_236646 ?auto_236647 ) ) ( ON ?auto_236646 ?auto_236647 ) ( ON ?auto_236645 ?auto_236646 ) ( ON ?auto_236644 ?auto_236645 ) ( ON ?auto_236643 ?auto_236644 ) ( ON ?auto_236642 ?auto_236643 ) ( ON ?auto_236641 ?auto_236642 ) ( ON ?auto_236640 ?auto_236641 ) ( ON ?auto_236639 ?auto_236640 ) ( ON ?auto_236638 ?auto_236639 ) ( ON ?auto_236637 ?auto_236638 ) ( CLEAR ?auto_236635 ) ( ON ?auto_236636 ?auto_236637 ) ( CLEAR ?auto_236636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236635 ?auto_236636 )
      ( MAKE-13PILE ?auto_236635 ?auto_236636 ?auto_236637 ?auto_236638 ?auto_236639 ?auto_236640 ?auto_236641 ?auto_236642 ?auto_236643 ?auto_236644 ?auto_236645 ?auto_236646 ?auto_236647 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236661 - BLOCK
      ?auto_236662 - BLOCK
      ?auto_236663 - BLOCK
      ?auto_236664 - BLOCK
      ?auto_236665 - BLOCK
      ?auto_236666 - BLOCK
      ?auto_236667 - BLOCK
      ?auto_236668 - BLOCK
      ?auto_236669 - BLOCK
      ?auto_236670 - BLOCK
      ?auto_236671 - BLOCK
      ?auto_236672 - BLOCK
      ?auto_236673 - BLOCK
    )
    :vars
    (
      ?auto_236674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236673 ?auto_236674 ) ( not ( = ?auto_236661 ?auto_236662 ) ) ( not ( = ?auto_236661 ?auto_236663 ) ) ( not ( = ?auto_236661 ?auto_236664 ) ) ( not ( = ?auto_236661 ?auto_236665 ) ) ( not ( = ?auto_236661 ?auto_236666 ) ) ( not ( = ?auto_236661 ?auto_236667 ) ) ( not ( = ?auto_236661 ?auto_236668 ) ) ( not ( = ?auto_236661 ?auto_236669 ) ) ( not ( = ?auto_236661 ?auto_236670 ) ) ( not ( = ?auto_236661 ?auto_236671 ) ) ( not ( = ?auto_236661 ?auto_236672 ) ) ( not ( = ?auto_236661 ?auto_236673 ) ) ( not ( = ?auto_236661 ?auto_236674 ) ) ( not ( = ?auto_236662 ?auto_236663 ) ) ( not ( = ?auto_236662 ?auto_236664 ) ) ( not ( = ?auto_236662 ?auto_236665 ) ) ( not ( = ?auto_236662 ?auto_236666 ) ) ( not ( = ?auto_236662 ?auto_236667 ) ) ( not ( = ?auto_236662 ?auto_236668 ) ) ( not ( = ?auto_236662 ?auto_236669 ) ) ( not ( = ?auto_236662 ?auto_236670 ) ) ( not ( = ?auto_236662 ?auto_236671 ) ) ( not ( = ?auto_236662 ?auto_236672 ) ) ( not ( = ?auto_236662 ?auto_236673 ) ) ( not ( = ?auto_236662 ?auto_236674 ) ) ( not ( = ?auto_236663 ?auto_236664 ) ) ( not ( = ?auto_236663 ?auto_236665 ) ) ( not ( = ?auto_236663 ?auto_236666 ) ) ( not ( = ?auto_236663 ?auto_236667 ) ) ( not ( = ?auto_236663 ?auto_236668 ) ) ( not ( = ?auto_236663 ?auto_236669 ) ) ( not ( = ?auto_236663 ?auto_236670 ) ) ( not ( = ?auto_236663 ?auto_236671 ) ) ( not ( = ?auto_236663 ?auto_236672 ) ) ( not ( = ?auto_236663 ?auto_236673 ) ) ( not ( = ?auto_236663 ?auto_236674 ) ) ( not ( = ?auto_236664 ?auto_236665 ) ) ( not ( = ?auto_236664 ?auto_236666 ) ) ( not ( = ?auto_236664 ?auto_236667 ) ) ( not ( = ?auto_236664 ?auto_236668 ) ) ( not ( = ?auto_236664 ?auto_236669 ) ) ( not ( = ?auto_236664 ?auto_236670 ) ) ( not ( = ?auto_236664 ?auto_236671 ) ) ( not ( = ?auto_236664 ?auto_236672 ) ) ( not ( = ?auto_236664 ?auto_236673 ) ) ( not ( = ?auto_236664 ?auto_236674 ) ) ( not ( = ?auto_236665 ?auto_236666 ) ) ( not ( = ?auto_236665 ?auto_236667 ) ) ( not ( = ?auto_236665 ?auto_236668 ) ) ( not ( = ?auto_236665 ?auto_236669 ) ) ( not ( = ?auto_236665 ?auto_236670 ) ) ( not ( = ?auto_236665 ?auto_236671 ) ) ( not ( = ?auto_236665 ?auto_236672 ) ) ( not ( = ?auto_236665 ?auto_236673 ) ) ( not ( = ?auto_236665 ?auto_236674 ) ) ( not ( = ?auto_236666 ?auto_236667 ) ) ( not ( = ?auto_236666 ?auto_236668 ) ) ( not ( = ?auto_236666 ?auto_236669 ) ) ( not ( = ?auto_236666 ?auto_236670 ) ) ( not ( = ?auto_236666 ?auto_236671 ) ) ( not ( = ?auto_236666 ?auto_236672 ) ) ( not ( = ?auto_236666 ?auto_236673 ) ) ( not ( = ?auto_236666 ?auto_236674 ) ) ( not ( = ?auto_236667 ?auto_236668 ) ) ( not ( = ?auto_236667 ?auto_236669 ) ) ( not ( = ?auto_236667 ?auto_236670 ) ) ( not ( = ?auto_236667 ?auto_236671 ) ) ( not ( = ?auto_236667 ?auto_236672 ) ) ( not ( = ?auto_236667 ?auto_236673 ) ) ( not ( = ?auto_236667 ?auto_236674 ) ) ( not ( = ?auto_236668 ?auto_236669 ) ) ( not ( = ?auto_236668 ?auto_236670 ) ) ( not ( = ?auto_236668 ?auto_236671 ) ) ( not ( = ?auto_236668 ?auto_236672 ) ) ( not ( = ?auto_236668 ?auto_236673 ) ) ( not ( = ?auto_236668 ?auto_236674 ) ) ( not ( = ?auto_236669 ?auto_236670 ) ) ( not ( = ?auto_236669 ?auto_236671 ) ) ( not ( = ?auto_236669 ?auto_236672 ) ) ( not ( = ?auto_236669 ?auto_236673 ) ) ( not ( = ?auto_236669 ?auto_236674 ) ) ( not ( = ?auto_236670 ?auto_236671 ) ) ( not ( = ?auto_236670 ?auto_236672 ) ) ( not ( = ?auto_236670 ?auto_236673 ) ) ( not ( = ?auto_236670 ?auto_236674 ) ) ( not ( = ?auto_236671 ?auto_236672 ) ) ( not ( = ?auto_236671 ?auto_236673 ) ) ( not ( = ?auto_236671 ?auto_236674 ) ) ( not ( = ?auto_236672 ?auto_236673 ) ) ( not ( = ?auto_236672 ?auto_236674 ) ) ( not ( = ?auto_236673 ?auto_236674 ) ) ( ON ?auto_236672 ?auto_236673 ) ( ON ?auto_236671 ?auto_236672 ) ( ON ?auto_236670 ?auto_236671 ) ( ON ?auto_236669 ?auto_236670 ) ( ON ?auto_236668 ?auto_236669 ) ( ON ?auto_236667 ?auto_236668 ) ( ON ?auto_236666 ?auto_236667 ) ( ON ?auto_236665 ?auto_236666 ) ( ON ?auto_236664 ?auto_236665 ) ( ON ?auto_236663 ?auto_236664 ) ( ON ?auto_236662 ?auto_236663 ) ( ON ?auto_236661 ?auto_236662 ) ( CLEAR ?auto_236661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236661 )
      ( MAKE-13PILE ?auto_236661 ?auto_236662 ?auto_236663 ?auto_236664 ?auto_236665 ?auto_236666 ?auto_236667 ?auto_236668 ?auto_236669 ?auto_236670 ?auto_236671 ?auto_236672 ?auto_236673 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236688 - BLOCK
      ?auto_236689 - BLOCK
      ?auto_236690 - BLOCK
      ?auto_236691 - BLOCK
      ?auto_236692 - BLOCK
      ?auto_236693 - BLOCK
      ?auto_236694 - BLOCK
      ?auto_236695 - BLOCK
      ?auto_236696 - BLOCK
      ?auto_236697 - BLOCK
      ?auto_236698 - BLOCK
      ?auto_236699 - BLOCK
      ?auto_236700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_236700 ) ( not ( = ?auto_236688 ?auto_236689 ) ) ( not ( = ?auto_236688 ?auto_236690 ) ) ( not ( = ?auto_236688 ?auto_236691 ) ) ( not ( = ?auto_236688 ?auto_236692 ) ) ( not ( = ?auto_236688 ?auto_236693 ) ) ( not ( = ?auto_236688 ?auto_236694 ) ) ( not ( = ?auto_236688 ?auto_236695 ) ) ( not ( = ?auto_236688 ?auto_236696 ) ) ( not ( = ?auto_236688 ?auto_236697 ) ) ( not ( = ?auto_236688 ?auto_236698 ) ) ( not ( = ?auto_236688 ?auto_236699 ) ) ( not ( = ?auto_236688 ?auto_236700 ) ) ( not ( = ?auto_236689 ?auto_236690 ) ) ( not ( = ?auto_236689 ?auto_236691 ) ) ( not ( = ?auto_236689 ?auto_236692 ) ) ( not ( = ?auto_236689 ?auto_236693 ) ) ( not ( = ?auto_236689 ?auto_236694 ) ) ( not ( = ?auto_236689 ?auto_236695 ) ) ( not ( = ?auto_236689 ?auto_236696 ) ) ( not ( = ?auto_236689 ?auto_236697 ) ) ( not ( = ?auto_236689 ?auto_236698 ) ) ( not ( = ?auto_236689 ?auto_236699 ) ) ( not ( = ?auto_236689 ?auto_236700 ) ) ( not ( = ?auto_236690 ?auto_236691 ) ) ( not ( = ?auto_236690 ?auto_236692 ) ) ( not ( = ?auto_236690 ?auto_236693 ) ) ( not ( = ?auto_236690 ?auto_236694 ) ) ( not ( = ?auto_236690 ?auto_236695 ) ) ( not ( = ?auto_236690 ?auto_236696 ) ) ( not ( = ?auto_236690 ?auto_236697 ) ) ( not ( = ?auto_236690 ?auto_236698 ) ) ( not ( = ?auto_236690 ?auto_236699 ) ) ( not ( = ?auto_236690 ?auto_236700 ) ) ( not ( = ?auto_236691 ?auto_236692 ) ) ( not ( = ?auto_236691 ?auto_236693 ) ) ( not ( = ?auto_236691 ?auto_236694 ) ) ( not ( = ?auto_236691 ?auto_236695 ) ) ( not ( = ?auto_236691 ?auto_236696 ) ) ( not ( = ?auto_236691 ?auto_236697 ) ) ( not ( = ?auto_236691 ?auto_236698 ) ) ( not ( = ?auto_236691 ?auto_236699 ) ) ( not ( = ?auto_236691 ?auto_236700 ) ) ( not ( = ?auto_236692 ?auto_236693 ) ) ( not ( = ?auto_236692 ?auto_236694 ) ) ( not ( = ?auto_236692 ?auto_236695 ) ) ( not ( = ?auto_236692 ?auto_236696 ) ) ( not ( = ?auto_236692 ?auto_236697 ) ) ( not ( = ?auto_236692 ?auto_236698 ) ) ( not ( = ?auto_236692 ?auto_236699 ) ) ( not ( = ?auto_236692 ?auto_236700 ) ) ( not ( = ?auto_236693 ?auto_236694 ) ) ( not ( = ?auto_236693 ?auto_236695 ) ) ( not ( = ?auto_236693 ?auto_236696 ) ) ( not ( = ?auto_236693 ?auto_236697 ) ) ( not ( = ?auto_236693 ?auto_236698 ) ) ( not ( = ?auto_236693 ?auto_236699 ) ) ( not ( = ?auto_236693 ?auto_236700 ) ) ( not ( = ?auto_236694 ?auto_236695 ) ) ( not ( = ?auto_236694 ?auto_236696 ) ) ( not ( = ?auto_236694 ?auto_236697 ) ) ( not ( = ?auto_236694 ?auto_236698 ) ) ( not ( = ?auto_236694 ?auto_236699 ) ) ( not ( = ?auto_236694 ?auto_236700 ) ) ( not ( = ?auto_236695 ?auto_236696 ) ) ( not ( = ?auto_236695 ?auto_236697 ) ) ( not ( = ?auto_236695 ?auto_236698 ) ) ( not ( = ?auto_236695 ?auto_236699 ) ) ( not ( = ?auto_236695 ?auto_236700 ) ) ( not ( = ?auto_236696 ?auto_236697 ) ) ( not ( = ?auto_236696 ?auto_236698 ) ) ( not ( = ?auto_236696 ?auto_236699 ) ) ( not ( = ?auto_236696 ?auto_236700 ) ) ( not ( = ?auto_236697 ?auto_236698 ) ) ( not ( = ?auto_236697 ?auto_236699 ) ) ( not ( = ?auto_236697 ?auto_236700 ) ) ( not ( = ?auto_236698 ?auto_236699 ) ) ( not ( = ?auto_236698 ?auto_236700 ) ) ( not ( = ?auto_236699 ?auto_236700 ) ) ( ON ?auto_236699 ?auto_236700 ) ( ON ?auto_236698 ?auto_236699 ) ( ON ?auto_236697 ?auto_236698 ) ( ON ?auto_236696 ?auto_236697 ) ( ON ?auto_236695 ?auto_236696 ) ( ON ?auto_236694 ?auto_236695 ) ( ON ?auto_236693 ?auto_236694 ) ( ON ?auto_236692 ?auto_236693 ) ( ON ?auto_236691 ?auto_236692 ) ( ON ?auto_236690 ?auto_236691 ) ( ON ?auto_236689 ?auto_236690 ) ( ON ?auto_236688 ?auto_236689 ) ( CLEAR ?auto_236688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236688 )
      ( MAKE-13PILE ?auto_236688 ?auto_236689 ?auto_236690 ?auto_236691 ?auto_236692 ?auto_236693 ?auto_236694 ?auto_236695 ?auto_236696 ?auto_236697 ?auto_236698 ?auto_236699 ?auto_236700 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_236714 - BLOCK
      ?auto_236715 - BLOCK
      ?auto_236716 - BLOCK
      ?auto_236717 - BLOCK
      ?auto_236718 - BLOCK
      ?auto_236719 - BLOCK
      ?auto_236720 - BLOCK
      ?auto_236721 - BLOCK
      ?auto_236722 - BLOCK
      ?auto_236723 - BLOCK
      ?auto_236724 - BLOCK
      ?auto_236725 - BLOCK
      ?auto_236726 - BLOCK
    )
    :vars
    (
      ?auto_236727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_236714 ?auto_236715 ) ) ( not ( = ?auto_236714 ?auto_236716 ) ) ( not ( = ?auto_236714 ?auto_236717 ) ) ( not ( = ?auto_236714 ?auto_236718 ) ) ( not ( = ?auto_236714 ?auto_236719 ) ) ( not ( = ?auto_236714 ?auto_236720 ) ) ( not ( = ?auto_236714 ?auto_236721 ) ) ( not ( = ?auto_236714 ?auto_236722 ) ) ( not ( = ?auto_236714 ?auto_236723 ) ) ( not ( = ?auto_236714 ?auto_236724 ) ) ( not ( = ?auto_236714 ?auto_236725 ) ) ( not ( = ?auto_236714 ?auto_236726 ) ) ( not ( = ?auto_236715 ?auto_236716 ) ) ( not ( = ?auto_236715 ?auto_236717 ) ) ( not ( = ?auto_236715 ?auto_236718 ) ) ( not ( = ?auto_236715 ?auto_236719 ) ) ( not ( = ?auto_236715 ?auto_236720 ) ) ( not ( = ?auto_236715 ?auto_236721 ) ) ( not ( = ?auto_236715 ?auto_236722 ) ) ( not ( = ?auto_236715 ?auto_236723 ) ) ( not ( = ?auto_236715 ?auto_236724 ) ) ( not ( = ?auto_236715 ?auto_236725 ) ) ( not ( = ?auto_236715 ?auto_236726 ) ) ( not ( = ?auto_236716 ?auto_236717 ) ) ( not ( = ?auto_236716 ?auto_236718 ) ) ( not ( = ?auto_236716 ?auto_236719 ) ) ( not ( = ?auto_236716 ?auto_236720 ) ) ( not ( = ?auto_236716 ?auto_236721 ) ) ( not ( = ?auto_236716 ?auto_236722 ) ) ( not ( = ?auto_236716 ?auto_236723 ) ) ( not ( = ?auto_236716 ?auto_236724 ) ) ( not ( = ?auto_236716 ?auto_236725 ) ) ( not ( = ?auto_236716 ?auto_236726 ) ) ( not ( = ?auto_236717 ?auto_236718 ) ) ( not ( = ?auto_236717 ?auto_236719 ) ) ( not ( = ?auto_236717 ?auto_236720 ) ) ( not ( = ?auto_236717 ?auto_236721 ) ) ( not ( = ?auto_236717 ?auto_236722 ) ) ( not ( = ?auto_236717 ?auto_236723 ) ) ( not ( = ?auto_236717 ?auto_236724 ) ) ( not ( = ?auto_236717 ?auto_236725 ) ) ( not ( = ?auto_236717 ?auto_236726 ) ) ( not ( = ?auto_236718 ?auto_236719 ) ) ( not ( = ?auto_236718 ?auto_236720 ) ) ( not ( = ?auto_236718 ?auto_236721 ) ) ( not ( = ?auto_236718 ?auto_236722 ) ) ( not ( = ?auto_236718 ?auto_236723 ) ) ( not ( = ?auto_236718 ?auto_236724 ) ) ( not ( = ?auto_236718 ?auto_236725 ) ) ( not ( = ?auto_236718 ?auto_236726 ) ) ( not ( = ?auto_236719 ?auto_236720 ) ) ( not ( = ?auto_236719 ?auto_236721 ) ) ( not ( = ?auto_236719 ?auto_236722 ) ) ( not ( = ?auto_236719 ?auto_236723 ) ) ( not ( = ?auto_236719 ?auto_236724 ) ) ( not ( = ?auto_236719 ?auto_236725 ) ) ( not ( = ?auto_236719 ?auto_236726 ) ) ( not ( = ?auto_236720 ?auto_236721 ) ) ( not ( = ?auto_236720 ?auto_236722 ) ) ( not ( = ?auto_236720 ?auto_236723 ) ) ( not ( = ?auto_236720 ?auto_236724 ) ) ( not ( = ?auto_236720 ?auto_236725 ) ) ( not ( = ?auto_236720 ?auto_236726 ) ) ( not ( = ?auto_236721 ?auto_236722 ) ) ( not ( = ?auto_236721 ?auto_236723 ) ) ( not ( = ?auto_236721 ?auto_236724 ) ) ( not ( = ?auto_236721 ?auto_236725 ) ) ( not ( = ?auto_236721 ?auto_236726 ) ) ( not ( = ?auto_236722 ?auto_236723 ) ) ( not ( = ?auto_236722 ?auto_236724 ) ) ( not ( = ?auto_236722 ?auto_236725 ) ) ( not ( = ?auto_236722 ?auto_236726 ) ) ( not ( = ?auto_236723 ?auto_236724 ) ) ( not ( = ?auto_236723 ?auto_236725 ) ) ( not ( = ?auto_236723 ?auto_236726 ) ) ( not ( = ?auto_236724 ?auto_236725 ) ) ( not ( = ?auto_236724 ?auto_236726 ) ) ( not ( = ?auto_236725 ?auto_236726 ) ) ( ON ?auto_236714 ?auto_236727 ) ( not ( = ?auto_236726 ?auto_236727 ) ) ( not ( = ?auto_236725 ?auto_236727 ) ) ( not ( = ?auto_236724 ?auto_236727 ) ) ( not ( = ?auto_236723 ?auto_236727 ) ) ( not ( = ?auto_236722 ?auto_236727 ) ) ( not ( = ?auto_236721 ?auto_236727 ) ) ( not ( = ?auto_236720 ?auto_236727 ) ) ( not ( = ?auto_236719 ?auto_236727 ) ) ( not ( = ?auto_236718 ?auto_236727 ) ) ( not ( = ?auto_236717 ?auto_236727 ) ) ( not ( = ?auto_236716 ?auto_236727 ) ) ( not ( = ?auto_236715 ?auto_236727 ) ) ( not ( = ?auto_236714 ?auto_236727 ) ) ( ON ?auto_236715 ?auto_236714 ) ( ON ?auto_236716 ?auto_236715 ) ( ON ?auto_236717 ?auto_236716 ) ( ON ?auto_236718 ?auto_236717 ) ( ON ?auto_236719 ?auto_236718 ) ( ON ?auto_236720 ?auto_236719 ) ( ON ?auto_236721 ?auto_236720 ) ( ON ?auto_236722 ?auto_236721 ) ( ON ?auto_236723 ?auto_236722 ) ( ON ?auto_236724 ?auto_236723 ) ( ON ?auto_236725 ?auto_236724 ) ( ON ?auto_236726 ?auto_236725 ) ( CLEAR ?auto_236726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_236726 ?auto_236725 ?auto_236724 ?auto_236723 ?auto_236722 ?auto_236721 ?auto_236720 ?auto_236719 ?auto_236718 ?auto_236717 ?auto_236716 ?auto_236715 ?auto_236714 )
      ( MAKE-13PILE ?auto_236714 ?auto_236715 ?auto_236716 ?auto_236717 ?auto_236718 ?auto_236719 ?auto_236720 ?auto_236721 ?auto_236722 ?auto_236723 ?auto_236724 ?auto_236725 ?auto_236726 ) )
  )

)

