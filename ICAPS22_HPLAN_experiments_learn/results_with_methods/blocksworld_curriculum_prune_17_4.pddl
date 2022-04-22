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
      ?auto_620257 - BLOCK
    )
    :vars
    (
      ?auto_620258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620257 ?auto_620258 ) ( CLEAR ?auto_620257 ) ( HAND-EMPTY ) ( not ( = ?auto_620257 ?auto_620258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620257 ?auto_620258 )
      ( !PUTDOWN ?auto_620257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_620264 - BLOCK
      ?auto_620265 - BLOCK
    )
    :vars
    (
      ?auto_620266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_620264 ) ( ON ?auto_620265 ?auto_620266 ) ( CLEAR ?auto_620265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_620264 ) ( not ( = ?auto_620264 ?auto_620265 ) ) ( not ( = ?auto_620264 ?auto_620266 ) ) ( not ( = ?auto_620265 ?auto_620266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620265 ?auto_620266 )
      ( !STACK ?auto_620265 ?auto_620264 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_620274 - BLOCK
      ?auto_620275 - BLOCK
    )
    :vars
    (
      ?auto_620276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620275 ?auto_620276 ) ( not ( = ?auto_620274 ?auto_620275 ) ) ( not ( = ?auto_620274 ?auto_620276 ) ) ( not ( = ?auto_620275 ?auto_620276 ) ) ( ON ?auto_620274 ?auto_620275 ) ( CLEAR ?auto_620274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620274 )
      ( MAKE-2PILE ?auto_620274 ?auto_620275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_620285 - BLOCK
      ?auto_620286 - BLOCK
      ?auto_620287 - BLOCK
    )
    :vars
    (
      ?auto_620288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_620286 ) ( ON ?auto_620287 ?auto_620288 ) ( CLEAR ?auto_620287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_620285 ) ( ON ?auto_620286 ?auto_620285 ) ( not ( = ?auto_620285 ?auto_620286 ) ) ( not ( = ?auto_620285 ?auto_620287 ) ) ( not ( = ?auto_620285 ?auto_620288 ) ) ( not ( = ?auto_620286 ?auto_620287 ) ) ( not ( = ?auto_620286 ?auto_620288 ) ) ( not ( = ?auto_620287 ?auto_620288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620287 ?auto_620288 )
      ( !STACK ?auto_620287 ?auto_620286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_620299 - BLOCK
      ?auto_620300 - BLOCK
      ?auto_620301 - BLOCK
    )
    :vars
    (
      ?auto_620302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620301 ?auto_620302 ) ( ON-TABLE ?auto_620299 ) ( not ( = ?auto_620299 ?auto_620300 ) ) ( not ( = ?auto_620299 ?auto_620301 ) ) ( not ( = ?auto_620299 ?auto_620302 ) ) ( not ( = ?auto_620300 ?auto_620301 ) ) ( not ( = ?auto_620300 ?auto_620302 ) ) ( not ( = ?auto_620301 ?auto_620302 ) ) ( CLEAR ?auto_620299 ) ( ON ?auto_620300 ?auto_620301 ) ( CLEAR ?auto_620300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_620299 ?auto_620300 )
      ( MAKE-3PILE ?auto_620299 ?auto_620300 ?auto_620301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_620313 - BLOCK
      ?auto_620314 - BLOCK
      ?auto_620315 - BLOCK
    )
    :vars
    (
      ?auto_620316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620315 ?auto_620316 ) ( not ( = ?auto_620313 ?auto_620314 ) ) ( not ( = ?auto_620313 ?auto_620315 ) ) ( not ( = ?auto_620313 ?auto_620316 ) ) ( not ( = ?auto_620314 ?auto_620315 ) ) ( not ( = ?auto_620314 ?auto_620316 ) ) ( not ( = ?auto_620315 ?auto_620316 ) ) ( ON ?auto_620314 ?auto_620315 ) ( ON ?auto_620313 ?auto_620314 ) ( CLEAR ?auto_620313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620313 )
      ( MAKE-3PILE ?auto_620313 ?auto_620314 ?auto_620315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_620328 - BLOCK
      ?auto_620329 - BLOCK
      ?auto_620330 - BLOCK
      ?auto_620331 - BLOCK
    )
    :vars
    (
      ?auto_620332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_620330 ) ( ON ?auto_620331 ?auto_620332 ) ( CLEAR ?auto_620331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_620328 ) ( ON ?auto_620329 ?auto_620328 ) ( ON ?auto_620330 ?auto_620329 ) ( not ( = ?auto_620328 ?auto_620329 ) ) ( not ( = ?auto_620328 ?auto_620330 ) ) ( not ( = ?auto_620328 ?auto_620331 ) ) ( not ( = ?auto_620328 ?auto_620332 ) ) ( not ( = ?auto_620329 ?auto_620330 ) ) ( not ( = ?auto_620329 ?auto_620331 ) ) ( not ( = ?auto_620329 ?auto_620332 ) ) ( not ( = ?auto_620330 ?auto_620331 ) ) ( not ( = ?auto_620330 ?auto_620332 ) ) ( not ( = ?auto_620331 ?auto_620332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620331 ?auto_620332 )
      ( !STACK ?auto_620331 ?auto_620330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_620346 - BLOCK
      ?auto_620347 - BLOCK
      ?auto_620348 - BLOCK
      ?auto_620349 - BLOCK
    )
    :vars
    (
      ?auto_620350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620349 ?auto_620350 ) ( ON-TABLE ?auto_620346 ) ( ON ?auto_620347 ?auto_620346 ) ( not ( = ?auto_620346 ?auto_620347 ) ) ( not ( = ?auto_620346 ?auto_620348 ) ) ( not ( = ?auto_620346 ?auto_620349 ) ) ( not ( = ?auto_620346 ?auto_620350 ) ) ( not ( = ?auto_620347 ?auto_620348 ) ) ( not ( = ?auto_620347 ?auto_620349 ) ) ( not ( = ?auto_620347 ?auto_620350 ) ) ( not ( = ?auto_620348 ?auto_620349 ) ) ( not ( = ?auto_620348 ?auto_620350 ) ) ( not ( = ?auto_620349 ?auto_620350 ) ) ( CLEAR ?auto_620347 ) ( ON ?auto_620348 ?auto_620349 ) ( CLEAR ?auto_620348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_620346 ?auto_620347 ?auto_620348 )
      ( MAKE-4PILE ?auto_620346 ?auto_620347 ?auto_620348 ?auto_620349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_620364 - BLOCK
      ?auto_620365 - BLOCK
      ?auto_620366 - BLOCK
      ?auto_620367 - BLOCK
    )
    :vars
    (
      ?auto_620368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620367 ?auto_620368 ) ( ON-TABLE ?auto_620364 ) ( not ( = ?auto_620364 ?auto_620365 ) ) ( not ( = ?auto_620364 ?auto_620366 ) ) ( not ( = ?auto_620364 ?auto_620367 ) ) ( not ( = ?auto_620364 ?auto_620368 ) ) ( not ( = ?auto_620365 ?auto_620366 ) ) ( not ( = ?auto_620365 ?auto_620367 ) ) ( not ( = ?auto_620365 ?auto_620368 ) ) ( not ( = ?auto_620366 ?auto_620367 ) ) ( not ( = ?auto_620366 ?auto_620368 ) ) ( not ( = ?auto_620367 ?auto_620368 ) ) ( ON ?auto_620366 ?auto_620367 ) ( CLEAR ?auto_620364 ) ( ON ?auto_620365 ?auto_620366 ) ( CLEAR ?auto_620365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_620364 ?auto_620365 )
      ( MAKE-4PILE ?auto_620364 ?auto_620365 ?auto_620366 ?auto_620367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_620382 - BLOCK
      ?auto_620383 - BLOCK
      ?auto_620384 - BLOCK
      ?auto_620385 - BLOCK
    )
    :vars
    (
      ?auto_620386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620385 ?auto_620386 ) ( not ( = ?auto_620382 ?auto_620383 ) ) ( not ( = ?auto_620382 ?auto_620384 ) ) ( not ( = ?auto_620382 ?auto_620385 ) ) ( not ( = ?auto_620382 ?auto_620386 ) ) ( not ( = ?auto_620383 ?auto_620384 ) ) ( not ( = ?auto_620383 ?auto_620385 ) ) ( not ( = ?auto_620383 ?auto_620386 ) ) ( not ( = ?auto_620384 ?auto_620385 ) ) ( not ( = ?auto_620384 ?auto_620386 ) ) ( not ( = ?auto_620385 ?auto_620386 ) ) ( ON ?auto_620384 ?auto_620385 ) ( ON ?auto_620383 ?auto_620384 ) ( ON ?auto_620382 ?auto_620383 ) ( CLEAR ?auto_620382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620382 )
      ( MAKE-4PILE ?auto_620382 ?auto_620383 ?auto_620384 ?auto_620385 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_620401 - BLOCK
      ?auto_620402 - BLOCK
      ?auto_620403 - BLOCK
      ?auto_620404 - BLOCK
      ?auto_620405 - BLOCK
    )
    :vars
    (
      ?auto_620406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_620404 ) ( ON ?auto_620405 ?auto_620406 ) ( CLEAR ?auto_620405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_620401 ) ( ON ?auto_620402 ?auto_620401 ) ( ON ?auto_620403 ?auto_620402 ) ( ON ?auto_620404 ?auto_620403 ) ( not ( = ?auto_620401 ?auto_620402 ) ) ( not ( = ?auto_620401 ?auto_620403 ) ) ( not ( = ?auto_620401 ?auto_620404 ) ) ( not ( = ?auto_620401 ?auto_620405 ) ) ( not ( = ?auto_620401 ?auto_620406 ) ) ( not ( = ?auto_620402 ?auto_620403 ) ) ( not ( = ?auto_620402 ?auto_620404 ) ) ( not ( = ?auto_620402 ?auto_620405 ) ) ( not ( = ?auto_620402 ?auto_620406 ) ) ( not ( = ?auto_620403 ?auto_620404 ) ) ( not ( = ?auto_620403 ?auto_620405 ) ) ( not ( = ?auto_620403 ?auto_620406 ) ) ( not ( = ?auto_620404 ?auto_620405 ) ) ( not ( = ?auto_620404 ?auto_620406 ) ) ( not ( = ?auto_620405 ?auto_620406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620405 ?auto_620406 )
      ( !STACK ?auto_620405 ?auto_620404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_620423 - BLOCK
      ?auto_620424 - BLOCK
      ?auto_620425 - BLOCK
      ?auto_620426 - BLOCK
      ?auto_620427 - BLOCK
    )
    :vars
    (
      ?auto_620428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620427 ?auto_620428 ) ( ON-TABLE ?auto_620423 ) ( ON ?auto_620424 ?auto_620423 ) ( ON ?auto_620425 ?auto_620424 ) ( not ( = ?auto_620423 ?auto_620424 ) ) ( not ( = ?auto_620423 ?auto_620425 ) ) ( not ( = ?auto_620423 ?auto_620426 ) ) ( not ( = ?auto_620423 ?auto_620427 ) ) ( not ( = ?auto_620423 ?auto_620428 ) ) ( not ( = ?auto_620424 ?auto_620425 ) ) ( not ( = ?auto_620424 ?auto_620426 ) ) ( not ( = ?auto_620424 ?auto_620427 ) ) ( not ( = ?auto_620424 ?auto_620428 ) ) ( not ( = ?auto_620425 ?auto_620426 ) ) ( not ( = ?auto_620425 ?auto_620427 ) ) ( not ( = ?auto_620425 ?auto_620428 ) ) ( not ( = ?auto_620426 ?auto_620427 ) ) ( not ( = ?auto_620426 ?auto_620428 ) ) ( not ( = ?auto_620427 ?auto_620428 ) ) ( CLEAR ?auto_620425 ) ( ON ?auto_620426 ?auto_620427 ) ( CLEAR ?auto_620426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_620423 ?auto_620424 ?auto_620425 ?auto_620426 )
      ( MAKE-5PILE ?auto_620423 ?auto_620424 ?auto_620425 ?auto_620426 ?auto_620427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_620445 - BLOCK
      ?auto_620446 - BLOCK
      ?auto_620447 - BLOCK
      ?auto_620448 - BLOCK
      ?auto_620449 - BLOCK
    )
    :vars
    (
      ?auto_620450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620449 ?auto_620450 ) ( ON-TABLE ?auto_620445 ) ( ON ?auto_620446 ?auto_620445 ) ( not ( = ?auto_620445 ?auto_620446 ) ) ( not ( = ?auto_620445 ?auto_620447 ) ) ( not ( = ?auto_620445 ?auto_620448 ) ) ( not ( = ?auto_620445 ?auto_620449 ) ) ( not ( = ?auto_620445 ?auto_620450 ) ) ( not ( = ?auto_620446 ?auto_620447 ) ) ( not ( = ?auto_620446 ?auto_620448 ) ) ( not ( = ?auto_620446 ?auto_620449 ) ) ( not ( = ?auto_620446 ?auto_620450 ) ) ( not ( = ?auto_620447 ?auto_620448 ) ) ( not ( = ?auto_620447 ?auto_620449 ) ) ( not ( = ?auto_620447 ?auto_620450 ) ) ( not ( = ?auto_620448 ?auto_620449 ) ) ( not ( = ?auto_620448 ?auto_620450 ) ) ( not ( = ?auto_620449 ?auto_620450 ) ) ( ON ?auto_620448 ?auto_620449 ) ( CLEAR ?auto_620446 ) ( ON ?auto_620447 ?auto_620448 ) ( CLEAR ?auto_620447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_620445 ?auto_620446 ?auto_620447 )
      ( MAKE-5PILE ?auto_620445 ?auto_620446 ?auto_620447 ?auto_620448 ?auto_620449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_620467 - BLOCK
      ?auto_620468 - BLOCK
      ?auto_620469 - BLOCK
      ?auto_620470 - BLOCK
      ?auto_620471 - BLOCK
    )
    :vars
    (
      ?auto_620472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620471 ?auto_620472 ) ( ON-TABLE ?auto_620467 ) ( not ( = ?auto_620467 ?auto_620468 ) ) ( not ( = ?auto_620467 ?auto_620469 ) ) ( not ( = ?auto_620467 ?auto_620470 ) ) ( not ( = ?auto_620467 ?auto_620471 ) ) ( not ( = ?auto_620467 ?auto_620472 ) ) ( not ( = ?auto_620468 ?auto_620469 ) ) ( not ( = ?auto_620468 ?auto_620470 ) ) ( not ( = ?auto_620468 ?auto_620471 ) ) ( not ( = ?auto_620468 ?auto_620472 ) ) ( not ( = ?auto_620469 ?auto_620470 ) ) ( not ( = ?auto_620469 ?auto_620471 ) ) ( not ( = ?auto_620469 ?auto_620472 ) ) ( not ( = ?auto_620470 ?auto_620471 ) ) ( not ( = ?auto_620470 ?auto_620472 ) ) ( not ( = ?auto_620471 ?auto_620472 ) ) ( ON ?auto_620470 ?auto_620471 ) ( ON ?auto_620469 ?auto_620470 ) ( CLEAR ?auto_620467 ) ( ON ?auto_620468 ?auto_620469 ) ( CLEAR ?auto_620468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_620467 ?auto_620468 )
      ( MAKE-5PILE ?auto_620467 ?auto_620468 ?auto_620469 ?auto_620470 ?auto_620471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_620489 - BLOCK
      ?auto_620490 - BLOCK
      ?auto_620491 - BLOCK
      ?auto_620492 - BLOCK
      ?auto_620493 - BLOCK
    )
    :vars
    (
      ?auto_620494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620493 ?auto_620494 ) ( not ( = ?auto_620489 ?auto_620490 ) ) ( not ( = ?auto_620489 ?auto_620491 ) ) ( not ( = ?auto_620489 ?auto_620492 ) ) ( not ( = ?auto_620489 ?auto_620493 ) ) ( not ( = ?auto_620489 ?auto_620494 ) ) ( not ( = ?auto_620490 ?auto_620491 ) ) ( not ( = ?auto_620490 ?auto_620492 ) ) ( not ( = ?auto_620490 ?auto_620493 ) ) ( not ( = ?auto_620490 ?auto_620494 ) ) ( not ( = ?auto_620491 ?auto_620492 ) ) ( not ( = ?auto_620491 ?auto_620493 ) ) ( not ( = ?auto_620491 ?auto_620494 ) ) ( not ( = ?auto_620492 ?auto_620493 ) ) ( not ( = ?auto_620492 ?auto_620494 ) ) ( not ( = ?auto_620493 ?auto_620494 ) ) ( ON ?auto_620492 ?auto_620493 ) ( ON ?auto_620491 ?auto_620492 ) ( ON ?auto_620490 ?auto_620491 ) ( ON ?auto_620489 ?auto_620490 ) ( CLEAR ?auto_620489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620489 )
      ( MAKE-5PILE ?auto_620489 ?auto_620490 ?auto_620491 ?auto_620492 ?auto_620493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_620512 - BLOCK
      ?auto_620513 - BLOCK
      ?auto_620514 - BLOCK
      ?auto_620515 - BLOCK
      ?auto_620516 - BLOCK
      ?auto_620517 - BLOCK
    )
    :vars
    (
      ?auto_620518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_620516 ) ( ON ?auto_620517 ?auto_620518 ) ( CLEAR ?auto_620517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_620512 ) ( ON ?auto_620513 ?auto_620512 ) ( ON ?auto_620514 ?auto_620513 ) ( ON ?auto_620515 ?auto_620514 ) ( ON ?auto_620516 ?auto_620515 ) ( not ( = ?auto_620512 ?auto_620513 ) ) ( not ( = ?auto_620512 ?auto_620514 ) ) ( not ( = ?auto_620512 ?auto_620515 ) ) ( not ( = ?auto_620512 ?auto_620516 ) ) ( not ( = ?auto_620512 ?auto_620517 ) ) ( not ( = ?auto_620512 ?auto_620518 ) ) ( not ( = ?auto_620513 ?auto_620514 ) ) ( not ( = ?auto_620513 ?auto_620515 ) ) ( not ( = ?auto_620513 ?auto_620516 ) ) ( not ( = ?auto_620513 ?auto_620517 ) ) ( not ( = ?auto_620513 ?auto_620518 ) ) ( not ( = ?auto_620514 ?auto_620515 ) ) ( not ( = ?auto_620514 ?auto_620516 ) ) ( not ( = ?auto_620514 ?auto_620517 ) ) ( not ( = ?auto_620514 ?auto_620518 ) ) ( not ( = ?auto_620515 ?auto_620516 ) ) ( not ( = ?auto_620515 ?auto_620517 ) ) ( not ( = ?auto_620515 ?auto_620518 ) ) ( not ( = ?auto_620516 ?auto_620517 ) ) ( not ( = ?auto_620516 ?auto_620518 ) ) ( not ( = ?auto_620517 ?auto_620518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620517 ?auto_620518 )
      ( !STACK ?auto_620517 ?auto_620516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_620538 - BLOCK
      ?auto_620539 - BLOCK
      ?auto_620540 - BLOCK
      ?auto_620541 - BLOCK
      ?auto_620542 - BLOCK
      ?auto_620543 - BLOCK
    )
    :vars
    (
      ?auto_620544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620543 ?auto_620544 ) ( ON-TABLE ?auto_620538 ) ( ON ?auto_620539 ?auto_620538 ) ( ON ?auto_620540 ?auto_620539 ) ( ON ?auto_620541 ?auto_620540 ) ( not ( = ?auto_620538 ?auto_620539 ) ) ( not ( = ?auto_620538 ?auto_620540 ) ) ( not ( = ?auto_620538 ?auto_620541 ) ) ( not ( = ?auto_620538 ?auto_620542 ) ) ( not ( = ?auto_620538 ?auto_620543 ) ) ( not ( = ?auto_620538 ?auto_620544 ) ) ( not ( = ?auto_620539 ?auto_620540 ) ) ( not ( = ?auto_620539 ?auto_620541 ) ) ( not ( = ?auto_620539 ?auto_620542 ) ) ( not ( = ?auto_620539 ?auto_620543 ) ) ( not ( = ?auto_620539 ?auto_620544 ) ) ( not ( = ?auto_620540 ?auto_620541 ) ) ( not ( = ?auto_620540 ?auto_620542 ) ) ( not ( = ?auto_620540 ?auto_620543 ) ) ( not ( = ?auto_620540 ?auto_620544 ) ) ( not ( = ?auto_620541 ?auto_620542 ) ) ( not ( = ?auto_620541 ?auto_620543 ) ) ( not ( = ?auto_620541 ?auto_620544 ) ) ( not ( = ?auto_620542 ?auto_620543 ) ) ( not ( = ?auto_620542 ?auto_620544 ) ) ( not ( = ?auto_620543 ?auto_620544 ) ) ( CLEAR ?auto_620541 ) ( ON ?auto_620542 ?auto_620543 ) ( CLEAR ?auto_620542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_620538 ?auto_620539 ?auto_620540 ?auto_620541 ?auto_620542 )
      ( MAKE-6PILE ?auto_620538 ?auto_620539 ?auto_620540 ?auto_620541 ?auto_620542 ?auto_620543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_620564 - BLOCK
      ?auto_620565 - BLOCK
      ?auto_620566 - BLOCK
      ?auto_620567 - BLOCK
      ?auto_620568 - BLOCK
      ?auto_620569 - BLOCK
    )
    :vars
    (
      ?auto_620570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620569 ?auto_620570 ) ( ON-TABLE ?auto_620564 ) ( ON ?auto_620565 ?auto_620564 ) ( ON ?auto_620566 ?auto_620565 ) ( not ( = ?auto_620564 ?auto_620565 ) ) ( not ( = ?auto_620564 ?auto_620566 ) ) ( not ( = ?auto_620564 ?auto_620567 ) ) ( not ( = ?auto_620564 ?auto_620568 ) ) ( not ( = ?auto_620564 ?auto_620569 ) ) ( not ( = ?auto_620564 ?auto_620570 ) ) ( not ( = ?auto_620565 ?auto_620566 ) ) ( not ( = ?auto_620565 ?auto_620567 ) ) ( not ( = ?auto_620565 ?auto_620568 ) ) ( not ( = ?auto_620565 ?auto_620569 ) ) ( not ( = ?auto_620565 ?auto_620570 ) ) ( not ( = ?auto_620566 ?auto_620567 ) ) ( not ( = ?auto_620566 ?auto_620568 ) ) ( not ( = ?auto_620566 ?auto_620569 ) ) ( not ( = ?auto_620566 ?auto_620570 ) ) ( not ( = ?auto_620567 ?auto_620568 ) ) ( not ( = ?auto_620567 ?auto_620569 ) ) ( not ( = ?auto_620567 ?auto_620570 ) ) ( not ( = ?auto_620568 ?auto_620569 ) ) ( not ( = ?auto_620568 ?auto_620570 ) ) ( not ( = ?auto_620569 ?auto_620570 ) ) ( ON ?auto_620568 ?auto_620569 ) ( CLEAR ?auto_620566 ) ( ON ?auto_620567 ?auto_620568 ) ( CLEAR ?auto_620567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_620564 ?auto_620565 ?auto_620566 ?auto_620567 )
      ( MAKE-6PILE ?auto_620564 ?auto_620565 ?auto_620566 ?auto_620567 ?auto_620568 ?auto_620569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_620590 - BLOCK
      ?auto_620591 - BLOCK
      ?auto_620592 - BLOCK
      ?auto_620593 - BLOCK
      ?auto_620594 - BLOCK
      ?auto_620595 - BLOCK
    )
    :vars
    (
      ?auto_620596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620595 ?auto_620596 ) ( ON-TABLE ?auto_620590 ) ( ON ?auto_620591 ?auto_620590 ) ( not ( = ?auto_620590 ?auto_620591 ) ) ( not ( = ?auto_620590 ?auto_620592 ) ) ( not ( = ?auto_620590 ?auto_620593 ) ) ( not ( = ?auto_620590 ?auto_620594 ) ) ( not ( = ?auto_620590 ?auto_620595 ) ) ( not ( = ?auto_620590 ?auto_620596 ) ) ( not ( = ?auto_620591 ?auto_620592 ) ) ( not ( = ?auto_620591 ?auto_620593 ) ) ( not ( = ?auto_620591 ?auto_620594 ) ) ( not ( = ?auto_620591 ?auto_620595 ) ) ( not ( = ?auto_620591 ?auto_620596 ) ) ( not ( = ?auto_620592 ?auto_620593 ) ) ( not ( = ?auto_620592 ?auto_620594 ) ) ( not ( = ?auto_620592 ?auto_620595 ) ) ( not ( = ?auto_620592 ?auto_620596 ) ) ( not ( = ?auto_620593 ?auto_620594 ) ) ( not ( = ?auto_620593 ?auto_620595 ) ) ( not ( = ?auto_620593 ?auto_620596 ) ) ( not ( = ?auto_620594 ?auto_620595 ) ) ( not ( = ?auto_620594 ?auto_620596 ) ) ( not ( = ?auto_620595 ?auto_620596 ) ) ( ON ?auto_620594 ?auto_620595 ) ( ON ?auto_620593 ?auto_620594 ) ( CLEAR ?auto_620591 ) ( ON ?auto_620592 ?auto_620593 ) ( CLEAR ?auto_620592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_620590 ?auto_620591 ?auto_620592 )
      ( MAKE-6PILE ?auto_620590 ?auto_620591 ?auto_620592 ?auto_620593 ?auto_620594 ?auto_620595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_620616 - BLOCK
      ?auto_620617 - BLOCK
      ?auto_620618 - BLOCK
      ?auto_620619 - BLOCK
      ?auto_620620 - BLOCK
      ?auto_620621 - BLOCK
    )
    :vars
    (
      ?auto_620622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620621 ?auto_620622 ) ( ON-TABLE ?auto_620616 ) ( not ( = ?auto_620616 ?auto_620617 ) ) ( not ( = ?auto_620616 ?auto_620618 ) ) ( not ( = ?auto_620616 ?auto_620619 ) ) ( not ( = ?auto_620616 ?auto_620620 ) ) ( not ( = ?auto_620616 ?auto_620621 ) ) ( not ( = ?auto_620616 ?auto_620622 ) ) ( not ( = ?auto_620617 ?auto_620618 ) ) ( not ( = ?auto_620617 ?auto_620619 ) ) ( not ( = ?auto_620617 ?auto_620620 ) ) ( not ( = ?auto_620617 ?auto_620621 ) ) ( not ( = ?auto_620617 ?auto_620622 ) ) ( not ( = ?auto_620618 ?auto_620619 ) ) ( not ( = ?auto_620618 ?auto_620620 ) ) ( not ( = ?auto_620618 ?auto_620621 ) ) ( not ( = ?auto_620618 ?auto_620622 ) ) ( not ( = ?auto_620619 ?auto_620620 ) ) ( not ( = ?auto_620619 ?auto_620621 ) ) ( not ( = ?auto_620619 ?auto_620622 ) ) ( not ( = ?auto_620620 ?auto_620621 ) ) ( not ( = ?auto_620620 ?auto_620622 ) ) ( not ( = ?auto_620621 ?auto_620622 ) ) ( ON ?auto_620620 ?auto_620621 ) ( ON ?auto_620619 ?auto_620620 ) ( ON ?auto_620618 ?auto_620619 ) ( CLEAR ?auto_620616 ) ( ON ?auto_620617 ?auto_620618 ) ( CLEAR ?auto_620617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_620616 ?auto_620617 )
      ( MAKE-6PILE ?auto_620616 ?auto_620617 ?auto_620618 ?auto_620619 ?auto_620620 ?auto_620621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_620642 - BLOCK
      ?auto_620643 - BLOCK
      ?auto_620644 - BLOCK
      ?auto_620645 - BLOCK
      ?auto_620646 - BLOCK
      ?auto_620647 - BLOCK
    )
    :vars
    (
      ?auto_620648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620647 ?auto_620648 ) ( not ( = ?auto_620642 ?auto_620643 ) ) ( not ( = ?auto_620642 ?auto_620644 ) ) ( not ( = ?auto_620642 ?auto_620645 ) ) ( not ( = ?auto_620642 ?auto_620646 ) ) ( not ( = ?auto_620642 ?auto_620647 ) ) ( not ( = ?auto_620642 ?auto_620648 ) ) ( not ( = ?auto_620643 ?auto_620644 ) ) ( not ( = ?auto_620643 ?auto_620645 ) ) ( not ( = ?auto_620643 ?auto_620646 ) ) ( not ( = ?auto_620643 ?auto_620647 ) ) ( not ( = ?auto_620643 ?auto_620648 ) ) ( not ( = ?auto_620644 ?auto_620645 ) ) ( not ( = ?auto_620644 ?auto_620646 ) ) ( not ( = ?auto_620644 ?auto_620647 ) ) ( not ( = ?auto_620644 ?auto_620648 ) ) ( not ( = ?auto_620645 ?auto_620646 ) ) ( not ( = ?auto_620645 ?auto_620647 ) ) ( not ( = ?auto_620645 ?auto_620648 ) ) ( not ( = ?auto_620646 ?auto_620647 ) ) ( not ( = ?auto_620646 ?auto_620648 ) ) ( not ( = ?auto_620647 ?auto_620648 ) ) ( ON ?auto_620646 ?auto_620647 ) ( ON ?auto_620645 ?auto_620646 ) ( ON ?auto_620644 ?auto_620645 ) ( ON ?auto_620643 ?auto_620644 ) ( ON ?auto_620642 ?auto_620643 ) ( CLEAR ?auto_620642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620642 )
      ( MAKE-6PILE ?auto_620642 ?auto_620643 ?auto_620644 ?auto_620645 ?auto_620646 ?auto_620647 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_620669 - BLOCK
      ?auto_620670 - BLOCK
      ?auto_620671 - BLOCK
      ?auto_620672 - BLOCK
      ?auto_620673 - BLOCK
      ?auto_620674 - BLOCK
      ?auto_620675 - BLOCK
    )
    :vars
    (
      ?auto_620676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_620674 ) ( ON ?auto_620675 ?auto_620676 ) ( CLEAR ?auto_620675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_620669 ) ( ON ?auto_620670 ?auto_620669 ) ( ON ?auto_620671 ?auto_620670 ) ( ON ?auto_620672 ?auto_620671 ) ( ON ?auto_620673 ?auto_620672 ) ( ON ?auto_620674 ?auto_620673 ) ( not ( = ?auto_620669 ?auto_620670 ) ) ( not ( = ?auto_620669 ?auto_620671 ) ) ( not ( = ?auto_620669 ?auto_620672 ) ) ( not ( = ?auto_620669 ?auto_620673 ) ) ( not ( = ?auto_620669 ?auto_620674 ) ) ( not ( = ?auto_620669 ?auto_620675 ) ) ( not ( = ?auto_620669 ?auto_620676 ) ) ( not ( = ?auto_620670 ?auto_620671 ) ) ( not ( = ?auto_620670 ?auto_620672 ) ) ( not ( = ?auto_620670 ?auto_620673 ) ) ( not ( = ?auto_620670 ?auto_620674 ) ) ( not ( = ?auto_620670 ?auto_620675 ) ) ( not ( = ?auto_620670 ?auto_620676 ) ) ( not ( = ?auto_620671 ?auto_620672 ) ) ( not ( = ?auto_620671 ?auto_620673 ) ) ( not ( = ?auto_620671 ?auto_620674 ) ) ( not ( = ?auto_620671 ?auto_620675 ) ) ( not ( = ?auto_620671 ?auto_620676 ) ) ( not ( = ?auto_620672 ?auto_620673 ) ) ( not ( = ?auto_620672 ?auto_620674 ) ) ( not ( = ?auto_620672 ?auto_620675 ) ) ( not ( = ?auto_620672 ?auto_620676 ) ) ( not ( = ?auto_620673 ?auto_620674 ) ) ( not ( = ?auto_620673 ?auto_620675 ) ) ( not ( = ?auto_620673 ?auto_620676 ) ) ( not ( = ?auto_620674 ?auto_620675 ) ) ( not ( = ?auto_620674 ?auto_620676 ) ) ( not ( = ?auto_620675 ?auto_620676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620675 ?auto_620676 )
      ( !STACK ?auto_620675 ?auto_620674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_620699 - BLOCK
      ?auto_620700 - BLOCK
      ?auto_620701 - BLOCK
      ?auto_620702 - BLOCK
      ?auto_620703 - BLOCK
      ?auto_620704 - BLOCK
      ?auto_620705 - BLOCK
    )
    :vars
    (
      ?auto_620706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620705 ?auto_620706 ) ( ON-TABLE ?auto_620699 ) ( ON ?auto_620700 ?auto_620699 ) ( ON ?auto_620701 ?auto_620700 ) ( ON ?auto_620702 ?auto_620701 ) ( ON ?auto_620703 ?auto_620702 ) ( not ( = ?auto_620699 ?auto_620700 ) ) ( not ( = ?auto_620699 ?auto_620701 ) ) ( not ( = ?auto_620699 ?auto_620702 ) ) ( not ( = ?auto_620699 ?auto_620703 ) ) ( not ( = ?auto_620699 ?auto_620704 ) ) ( not ( = ?auto_620699 ?auto_620705 ) ) ( not ( = ?auto_620699 ?auto_620706 ) ) ( not ( = ?auto_620700 ?auto_620701 ) ) ( not ( = ?auto_620700 ?auto_620702 ) ) ( not ( = ?auto_620700 ?auto_620703 ) ) ( not ( = ?auto_620700 ?auto_620704 ) ) ( not ( = ?auto_620700 ?auto_620705 ) ) ( not ( = ?auto_620700 ?auto_620706 ) ) ( not ( = ?auto_620701 ?auto_620702 ) ) ( not ( = ?auto_620701 ?auto_620703 ) ) ( not ( = ?auto_620701 ?auto_620704 ) ) ( not ( = ?auto_620701 ?auto_620705 ) ) ( not ( = ?auto_620701 ?auto_620706 ) ) ( not ( = ?auto_620702 ?auto_620703 ) ) ( not ( = ?auto_620702 ?auto_620704 ) ) ( not ( = ?auto_620702 ?auto_620705 ) ) ( not ( = ?auto_620702 ?auto_620706 ) ) ( not ( = ?auto_620703 ?auto_620704 ) ) ( not ( = ?auto_620703 ?auto_620705 ) ) ( not ( = ?auto_620703 ?auto_620706 ) ) ( not ( = ?auto_620704 ?auto_620705 ) ) ( not ( = ?auto_620704 ?auto_620706 ) ) ( not ( = ?auto_620705 ?auto_620706 ) ) ( CLEAR ?auto_620703 ) ( ON ?auto_620704 ?auto_620705 ) ( CLEAR ?auto_620704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_620699 ?auto_620700 ?auto_620701 ?auto_620702 ?auto_620703 ?auto_620704 )
      ( MAKE-7PILE ?auto_620699 ?auto_620700 ?auto_620701 ?auto_620702 ?auto_620703 ?auto_620704 ?auto_620705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_620729 - BLOCK
      ?auto_620730 - BLOCK
      ?auto_620731 - BLOCK
      ?auto_620732 - BLOCK
      ?auto_620733 - BLOCK
      ?auto_620734 - BLOCK
      ?auto_620735 - BLOCK
    )
    :vars
    (
      ?auto_620736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620735 ?auto_620736 ) ( ON-TABLE ?auto_620729 ) ( ON ?auto_620730 ?auto_620729 ) ( ON ?auto_620731 ?auto_620730 ) ( ON ?auto_620732 ?auto_620731 ) ( not ( = ?auto_620729 ?auto_620730 ) ) ( not ( = ?auto_620729 ?auto_620731 ) ) ( not ( = ?auto_620729 ?auto_620732 ) ) ( not ( = ?auto_620729 ?auto_620733 ) ) ( not ( = ?auto_620729 ?auto_620734 ) ) ( not ( = ?auto_620729 ?auto_620735 ) ) ( not ( = ?auto_620729 ?auto_620736 ) ) ( not ( = ?auto_620730 ?auto_620731 ) ) ( not ( = ?auto_620730 ?auto_620732 ) ) ( not ( = ?auto_620730 ?auto_620733 ) ) ( not ( = ?auto_620730 ?auto_620734 ) ) ( not ( = ?auto_620730 ?auto_620735 ) ) ( not ( = ?auto_620730 ?auto_620736 ) ) ( not ( = ?auto_620731 ?auto_620732 ) ) ( not ( = ?auto_620731 ?auto_620733 ) ) ( not ( = ?auto_620731 ?auto_620734 ) ) ( not ( = ?auto_620731 ?auto_620735 ) ) ( not ( = ?auto_620731 ?auto_620736 ) ) ( not ( = ?auto_620732 ?auto_620733 ) ) ( not ( = ?auto_620732 ?auto_620734 ) ) ( not ( = ?auto_620732 ?auto_620735 ) ) ( not ( = ?auto_620732 ?auto_620736 ) ) ( not ( = ?auto_620733 ?auto_620734 ) ) ( not ( = ?auto_620733 ?auto_620735 ) ) ( not ( = ?auto_620733 ?auto_620736 ) ) ( not ( = ?auto_620734 ?auto_620735 ) ) ( not ( = ?auto_620734 ?auto_620736 ) ) ( not ( = ?auto_620735 ?auto_620736 ) ) ( ON ?auto_620734 ?auto_620735 ) ( CLEAR ?auto_620732 ) ( ON ?auto_620733 ?auto_620734 ) ( CLEAR ?auto_620733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_620729 ?auto_620730 ?auto_620731 ?auto_620732 ?auto_620733 )
      ( MAKE-7PILE ?auto_620729 ?auto_620730 ?auto_620731 ?auto_620732 ?auto_620733 ?auto_620734 ?auto_620735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_620759 - BLOCK
      ?auto_620760 - BLOCK
      ?auto_620761 - BLOCK
      ?auto_620762 - BLOCK
      ?auto_620763 - BLOCK
      ?auto_620764 - BLOCK
      ?auto_620765 - BLOCK
    )
    :vars
    (
      ?auto_620766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620765 ?auto_620766 ) ( ON-TABLE ?auto_620759 ) ( ON ?auto_620760 ?auto_620759 ) ( ON ?auto_620761 ?auto_620760 ) ( not ( = ?auto_620759 ?auto_620760 ) ) ( not ( = ?auto_620759 ?auto_620761 ) ) ( not ( = ?auto_620759 ?auto_620762 ) ) ( not ( = ?auto_620759 ?auto_620763 ) ) ( not ( = ?auto_620759 ?auto_620764 ) ) ( not ( = ?auto_620759 ?auto_620765 ) ) ( not ( = ?auto_620759 ?auto_620766 ) ) ( not ( = ?auto_620760 ?auto_620761 ) ) ( not ( = ?auto_620760 ?auto_620762 ) ) ( not ( = ?auto_620760 ?auto_620763 ) ) ( not ( = ?auto_620760 ?auto_620764 ) ) ( not ( = ?auto_620760 ?auto_620765 ) ) ( not ( = ?auto_620760 ?auto_620766 ) ) ( not ( = ?auto_620761 ?auto_620762 ) ) ( not ( = ?auto_620761 ?auto_620763 ) ) ( not ( = ?auto_620761 ?auto_620764 ) ) ( not ( = ?auto_620761 ?auto_620765 ) ) ( not ( = ?auto_620761 ?auto_620766 ) ) ( not ( = ?auto_620762 ?auto_620763 ) ) ( not ( = ?auto_620762 ?auto_620764 ) ) ( not ( = ?auto_620762 ?auto_620765 ) ) ( not ( = ?auto_620762 ?auto_620766 ) ) ( not ( = ?auto_620763 ?auto_620764 ) ) ( not ( = ?auto_620763 ?auto_620765 ) ) ( not ( = ?auto_620763 ?auto_620766 ) ) ( not ( = ?auto_620764 ?auto_620765 ) ) ( not ( = ?auto_620764 ?auto_620766 ) ) ( not ( = ?auto_620765 ?auto_620766 ) ) ( ON ?auto_620764 ?auto_620765 ) ( ON ?auto_620763 ?auto_620764 ) ( CLEAR ?auto_620761 ) ( ON ?auto_620762 ?auto_620763 ) ( CLEAR ?auto_620762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_620759 ?auto_620760 ?auto_620761 ?auto_620762 )
      ( MAKE-7PILE ?auto_620759 ?auto_620760 ?auto_620761 ?auto_620762 ?auto_620763 ?auto_620764 ?auto_620765 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_620789 - BLOCK
      ?auto_620790 - BLOCK
      ?auto_620791 - BLOCK
      ?auto_620792 - BLOCK
      ?auto_620793 - BLOCK
      ?auto_620794 - BLOCK
      ?auto_620795 - BLOCK
    )
    :vars
    (
      ?auto_620796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620795 ?auto_620796 ) ( ON-TABLE ?auto_620789 ) ( ON ?auto_620790 ?auto_620789 ) ( not ( = ?auto_620789 ?auto_620790 ) ) ( not ( = ?auto_620789 ?auto_620791 ) ) ( not ( = ?auto_620789 ?auto_620792 ) ) ( not ( = ?auto_620789 ?auto_620793 ) ) ( not ( = ?auto_620789 ?auto_620794 ) ) ( not ( = ?auto_620789 ?auto_620795 ) ) ( not ( = ?auto_620789 ?auto_620796 ) ) ( not ( = ?auto_620790 ?auto_620791 ) ) ( not ( = ?auto_620790 ?auto_620792 ) ) ( not ( = ?auto_620790 ?auto_620793 ) ) ( not ( = ?auto_620790 ?auto_620794 ) ) ( not ( = ?auto_620790 ?auto_620795 ) ) ( not ( = ?auto_620790 ?auto_620796 ) ) ( not ( = ?auto_620791 ?auto_620792 ) ) ( not ( = ?auto_620791 ?auto_620793 ) ) ( not ( = ?auto_620791 ?auto_620794 ) ) ( not ( = ?auto_620791 ?auto_620795 ) ) ( not ( = ?auto_620791 ?auto_620796 ) ) ( not ( = ?auto_620792 ?auto_620793 ) ) ( not ( = ?auto_620792 ?auto_620794 ) ) ( not ( = ?auto_620792 ?auto_620795 ) ) ( not ( = ?auto_620792 ?auto_620796 ) ) ( not ( = ?auto_620793 ?auto_620794 ) ) ( not ( = ?auto_620793 ?auto_620795 ) ) ( not ( = ?auto_620793 ?auto_620796 ) ) ( not ( = ?auto_620794 ?auto_620795 ) ) ( not ( = ?auto_620794 ?auto_620796 ) ) ( not ( = ?auto_620795 ?auto_620796 ) ) ( ON ?auto_620794 ?auto_620795 ) ( ON ?auto_620793 ?auto_620794 ) ( ON ?auto_620792 ?auto_620793 ) ( CLEAR ?auto_620790 ) ( ON ?auto_620791 ?auto_620792 ) ( CLEAR ?auto_620791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_620789 ?auto_620790 ?auto_620791 )
      ( MAKE-7PILE ?auto_620789 ?auto_620790 ?auto_620791 ?auto_620792 ?auto_620793 ?auto_620794 ?auto_620795 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_620819 - BLOCK
      ?auto_620820 - BLOCK
      ?auto_620821 - BLOCK
      ?auto_620822 - BLOCK
      ?auto_620823 - BLOCK
      ?auto_620824 - BLOCK
      ?auto_620825 - BLOCK
    )
    :vars
    (
      ?auto_620826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620825 ?auto_620826 ) ( ON-TABLE ?auto_620819 ) ( not ( = ?auto_620819 ?auto_620820 ) ) ( not ( = ?auto_620819 ?auto_620821 ) ) ( not ( = ?auto_620819 ?auto_620822 ) ) ( not ( = ?auto_620819 ?auto_620823 ) ) ( not ( = ?auto_620819 ?auto_620824 ) ) ( not ( = ?auto_620819 ?auto_620825 ) ) ( not ( = ?auto_620819 ?auto_620826 ) ) ( not ( = ?auto_620820 ?auto_620821 ) ) ( not ( = ?auto_620820 ?auto_620822 ) ) ( not ( = ?auto_620820 ?auto_620823 ) ) ( not ( = ?auto_620820 ?auto_620824 ) ) ( not ( = ?auto_620820 ?auto_620825 ) ) ( not ( = ?auto_620820 ?auto_620826 ) ) ( not ( = ?auto_620821 ?auto_620822 ) ) ( not ( = ?auto_620821 ?auto_620823 ) ) ( not ( = ?auto_620821 ?auto_620824 ) ) ( not ( = ?auto_620821 ?auto_620825 ) ) ( not ( = ?auto_620821 ?auto_620826 ) ) ( not ( = ?auto_620822 ?auto_620823 ) ) ( not ( = ?auto_620822 ?auto_620824 ) ) ( not ( = ?auto_620822 ?auto_620825 ) ) ( not ( = ?auto_620822 ?auto_620826 ) ) ( not ( = ?auto_620823 ?auto_620824 ) ) ( not ( = ?auto_620823 ?auto_620825 ) ) ( not ( = ?auto_620823 ?auto_620826 ) ) ( not ( = ?auto_620824 ?auto_620825 ) ) ( not ( = ?auto_620824 ?auto_620826 ) ) ( not ( = ?auto_620825 ?auto_620826 ) ) ( ON ?auto_620824 ?auto_620825 ) ( ON ?auto_620823 ?auto_620824 ) ( ON ?auto_620822 ?auto_620823 ) ( ON ?auto_620821 ?auto_620822 ) ( CLEAR ?auto_620819 ) ( ON ?auto_620820 ?auto_620821 ) ( CLEAR ?auto_620820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_620819 ?auto_620820 )
      ( MAKE-7PILE ?auto_620819 ?auto_620820 ?auto_620821 ?auto_620822 ?auto_620823 ?auto_620824 ?auto_620825 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_620849 - BLOCK
      ?auto_620850 - BLOCK
      ?auto_620851 - BLOCK
      ?auto_620852 - BLOCK
      ?auto_620853 - BLOCK
      ?auto_620854 - BLOCK
      ?auto_620855 - BLOCK
    )
    :vars
    (
      ?auto_620856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620855 ?auto_620856 ) ( not ( = ?auto_620849 ?auto_620850 ) ) ( not ( = ?auto_620849 ?auto_620851 ) ) ( not ( = ?auto_620849 ?auto_620852 ) ) ( not ( = ?auto_620849 ?auto_620853 ) ) ( not ( = ?auto_620849 ?auto_620854 ) ) ( not ( = ?auto_620849 ?auto_620855 ) ) ( not ( = ?auto_620849 ?auto_620856 ) ) ( not ( = ?auto_620850 ?auto_620851 ) ) ( not ( = ?auto_620850 ?auto_620852 ) ) ( not ( = ?auto_620850 ?auto_620853 ) ) ( not ( = ?auto_620850 ?auto_620854 ) ) ( not ( = ?auto_620850 ?auto_620855 ) ) ( not ( = ?auto_620850 ?auto_620856 ) ) ( not ( = ?auto_620851 ?auto_620852 ) ) ( not ( = ?auto_620851 ?auto_620853 ) ) ( not ( = ?auto_620851 ?auto_620854 ) ) ( not ( = ?auto_620851 ?auto_620855 ) ) ( not ( = ?auto_620851 ?auto_620856 ) ) ( not ( = ?auto_620852 ?auto_620853 ) ) ( not ( = ?auto_620852 ?auto_620854 ) ) ( not ( = ?auto_620852 ?auto_620855 ) ) ( not ( = ?auto_620852 ?auto_620856 ) ) ( not ( = ?auto_620853 ?auto_620854 ) ) ( not ( = ?auto_620853 ?auto_620855 ) ) ( not ( = ?auto_620853 ?auto_620856 ) ) ( not ( = ?auto_620854 ?auto_620855 ) ) ( not ( = ?auto_620854 ?auto_620856 ) ) ( not ( = ?auto_620855 ?auto_620856 ) ) ( ON ?auto_620854 ?auto_620855 ) ( ON ?auto_620853 ?auto_620854 ) ( ON ?auto_620852 ?auto_620853 ) ( ON ?auto_620851 ?auto_620852 ) ( ON ?auto_620850 ?auto_620851 ) ( ON ?auto_620849 ?auto_620850 ) ( CLEAR ?auto_620849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_620849 )
      ( MAKE-7PILE ?auto_620849 ?auto_620850 ?auto_620851 ?auto_620852 ?auto_620853 ?auto_620854 ?auto_620855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_620880 - BLOCK
      ?auto_620881 - BLOCK
      ?auto_620882 - BLOCK
      ?auto_620883 - BLOCK
      ?auto_620884 - BLOCK
      ?auto_620885 - BLOCK
      ?auto_620886 - BLOCK
      ?auto_620887 - BLOCK
    )
    :vars
    (
      ?auto_620888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_620886 ) ( ON ?auto_620887 ?auto_620888 ) ( CLEAR ?auto_620887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_620880 ) ( ON ?auto_620881 ?auto_620880 ) ( ON ?auto_620882 ?auto_620881 ) ( ON ?auto_620883 ?auto_620882 ) ( ON ?auto_620884 ?auto_620883 ) ( ON ?auto_620885 ?auto_620884 ) ( ON ?auto_620886 ?auto_620885 ) ( not ( = ?auto_620880 ?auto_620881 ) ) ( not ( = ?auto_620880 ?auto_620882 ) ) ( not ( = ?auto_620880 ?auto_620883 ) ) ( not ( = ?auto_620880 ?auto_620884 ) ) ( not ( = ?auto_620880 ?auto_620885 ) ) ( not ( = ?auto_620880 ?auto_620886 ) ) ( not ( = ?auto_620880 ?auto_620887 ) ) ( not ( = ?auto_620880 ?auto_620888 ) ) ( not ( = ?auto_620881 ?auto_620882 ) ) ( not ( = ?auto_620881 ?auto_620883 ) ) ( not ( = ?auto_620881 ?auto_620884 ) ) ( not ( = ?auto_620881 ?auto_620885 ) ) ( not ( = ?auto_620881 ?auto_620886 ) ) ( not ( = ?auto_620881 ?auto_620887 ) ) ( not ( = ?auto_620881 ?auto_620888 ) ) ( not ( = ?auto_620882 ?auto_620883 ) ) ( not ( = ?auto_620882 ?auto_620884 ) ) ( not ( = ?auto_620882 ?auto_620885 ) ) ( not ( = ?auto_620882 ?auto_620886 ) ) ( not ( = ?auto_620882 ?auto_620887 ) ) ( not ( = ?auto_620882 ?auto_620888 ) ) ( not ( = ?auto_620883 ?auto_620884 ) ) ( not ( = ?auto_620883 ?auto_620885 ) ) ( not ( = ?auto_620883 ?auto_620886 ) ) ( not ( = ?auto_620883 ?auto_620887 ) ) ( not ( = ?auto_620883 ?auto_620888 ) ) ( not ( = ?auto_620884 ?auto_620885 ) ) ( not ( = ?auto_620884 ?auto_620886 ) ) ( not ( = ?auto_620884 ?auto_620887 ) ) ( not ( = ?auto_620884 ?auto_620888 ) ) ( not ( = ?auto_620885 ?auto_620886 ) ) ( not ( = ?auto_620885 ?auto_620887 ) ) ( not ( = ?auto_620885 ?auto_620888 ) ) ( not ( = ?auto_620886 ?auto_620887 ) ) ( not ( = ?auto_620886 ?auto_620888 ) ) ( not ( = ?auto_620887 ?auto_620888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_620887 ?auto_620888 )
      ( !STACK ?auto_620887 ?auto_620886 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_620914 - BLOCK
      ?auto_620915 - BLOCK
      ?auto_620916 - BLOCK
      ?auto_620917 - BLOCK
      ?auto_620918 - BLOCK
      ?auto_620919 - BLOCK
      ?auto_620920 - BLOCK
      ?auto_620921 - BLOCK
    )
    :vars
    (
      ?auto_620922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620921 ?auto_620922 ) ( ON-TABLE ?auto_620914 ) ( ON ?auto_620915 ?auto_620914 ) ( ON ?auto_620916 ?auto_620915 ) ( ON ?auto_620917 ?auto_620916 ) ( ON ?auto_620918 ?auto_620917 ) ( ON ?auto_620919 ?auto_620918 ) ( not ( = ?auto_620914 ?auto_620915 ) ) ( not ( = ?auto_620914 ?auto_620916 ) ) ( not ( = ?auto_620914 ?auto_620917 ) ) ( not ( = ?auto_620914 ?auto_620918 ) ) ( not ( = ?auto_620914 ?auto_620919 ) ) ( not ( = ?auto_620914 ?auto_620920 ) ) ( not ( = ?auto_620914 ?auto_620921 ) ) ( not ( = ?auto_620914 ?auto_620922 ) ) ( not ( = ?auto_620915 ?auto_620916 ) ) ( not ( = ?auto_620915 ?auto_620917 ) ) ( not ( = ?auto_620915 ?auto_620918 ) ) ( not ( = ?auto_620915 ?auto_620919 ) ) ( not ( = ?auto_620915 ?auto_620920 ) ) ( not ( = ?auto_620915 ?auto_620921 ) ) ( not ( = ?auto_620915 ?auto_620922 ) ) ( not ( = ?auto_620916 ?auto_620917 ) ) ( not ( = ?auto_620916 ?auto_620918 ) ) ( not ( = ?auto_620916 ?auto_620919 ) ) ( not ( = ?auto_620916 ?auto_620920 ) ) ( not ( = ?auto_620916 ?auto_620921 ) ) ( not ( = ?auto_620916 ?auto_620922 ) ) ( not ( = ?auto_620917 ?auto_620918 ) ) ( not ( = ?auto_620917 ?auto_620919 ) ) ( not ( = ?auto_620917 ?auto_620920 ) ) ( not ( = ?auto_620917 ?auto_620921 ) ) ( not ( = ?auto_620917 ?auto_620922 ) ) ( not ( = ?auto_620918 ?auto_620919 ) ) ( not ( = ?auto_620918 ?auto_620920 ) ) ( not ( = ?auto_620918 ?auto_620921 ) ) ( not ( = ?auto_620918 ?auto_620922 ) ) ( not ( = ?auto_620919 ?auto_620920 ) ) ( not ( = ?auto_620919 ?auto_620921 ) ) ( not ( = ?auto_620919 ?auto_620922 ) ) ( not ( = ?auto_620920 ?auto_620921 ) ) ( not ( = ?auto_620920 ?auto_620922 ) ) ( not ( = ?auto_620921 ?auto_620922 ) ) ( CLEAR ?auto_620919 ) ( ON ?auto_620920 ?auto_620921 ) ( CLEAR ?auto_620920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_620914 ?auto_620915 ?auto_620916 ?auto_620917 ?auto_620918 ?auto_620919 ?auto_620920 )
      ( MAKE-8PILE ?auto_620914 ?auto_620915 ?auto_620916 ?auto_620917 ?auto_620918 ?auto_620919 ?auto_620920 ?auto_620921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_620948 - BLOCK
      ?auto_620949 - BLOCK
      ?auto_620950 - BLOCK
      ?auto_620951 - BLOCK
      ?auto_620952 - BLOCK
      ?auto_620953 - BLOCK
      ?auto_620954 - BLOCK
      ?auto_620955 - BLOCK
    )
    :vars
    (
      ?auto_620956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620955 ?auto_620956 ) ( ON-TABLE ?auto_620948 ) ( ON ?auto_620949 ?auto_620948 ) ( ON ?auto_620950 ?auto_620949 ) ( ON ?auto_620951 ?auto_620950 ) ( ON ?auto_620952 ?auto_620951 ) ( not ( = ?auto_620948 ?auto_620949 ) ) ( not ( = ?auto_620948 ?auto_620950 ) ) ( not ( = ?auto_620948 ?auto_620951 ) ) ( not ( = ?auto_620948 ?auto_620952 ) ) ( not ( = ?auto_620948 ?auto_620953 ) ) ( not ( = ?auto_620948 ?auto_620954 ) ) ( not ( = ?auto_620948 ?auto_620955 ) ) ( not ( = ?auto_620948 ?auto_620956 ) ) ( not ( = ?auto_620949 ?auto_620950 ) ) ( not ( = ?auto_620949 ?auto_620951 ) ) ( not ( = ?auto_620949 ?auto_620952 ) ) ( not ( = ?auto_620949 ?auto_620953 ) ) ( not ( = ?auto_620949 ?auto_620954 ) ) ( not ( = ?auto_620949 ?auto_620955 ) ) ( not ( = ?auto_620949 ?auto_620956 ) ) ( not ( = ?auto_620950 ?auto_620951 ) ) ( not ( = ?auto_620950 ?auto_620952 ) ) ( not ( = ?auto_620950 ?auto_620953 ) ) ( not ( = ?auto_620950 ?auto_620954 ) ) ( not ( = ?auto_620950 ?auto_620955 ) ) ( not ( = ?auto_620950 ?auto_620956 ) ) ( not ( = ?auto_620951 ?auto_620952 ) ) ( not ( = ?auto_620951 ?auto_620953 ) ) ( not ( = ?auto_620951 ?auto_620954 ) ) ( not ( = ?auto_620951 ?auto_620955 ) ) ( not ( = ?auto_620951 ?auto_620956 ) ) ( not ( = ?auto_620952 ?auto_620953 ) ) ( not ( = ?auto_620952 ?auto_620954 ) ) ( not ( = ?auto_620952 ?auto_620955 ) ) ( not ( = ?auto_620952 ?auto_620956 ) ) ( not ( = ?auto_620953 ?auto_620954 ) ) ( not ( = ?auto_620953 ?auto_620955 ) ) ( not ( = ?auto_620953 ?auto_620956 ) ) ( not ( = ?auto_620954 ?auto_620955 ) ) ( not ( = ?auto_620954 ?auto_620956 ) ) ( not ( = ?auto_620955 ?auto_620956 ) ) ( ON ?auto_620954 ?auto_620955 ) ( CLEAR ?auto_620952 ) ( ON ?auto_620953 ?auto_620954 ) ( CLEAR ?auto_620953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_620948 ?auto_620949 ?auto_620950 ?auto_620951 ?auto_620952 ?auto_620953 )
      ( MAKE-8PILE ?auto_620948 ?auto_620949 ?auto_620950 ?auto_620951 ?auto_620952 ?auto_620953 ?auto_620954 ?auto_620955 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_620982 - BLOCK
      ?auto_620983 - BLOCK
      ?auto_620984 - BLOCK
      ?auto_620985 - BLOCK
      ?auto_620986 - BLOCK
      ?auto_620987 - BLOCK
      ?auto_620988 - BLOCK
      ?auto_620989 - BLOCK
    )
    :vars
    (
      ?auto_620990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_620989 ?auto_620990 ) ( ON-TABLE ?auto_620982 ) ( ON ?auto_620983 ?auto_620982 ) ( ON ?auto_620984 ?auto_620983 ) ( ON ?auto_620985 ?auto_620984 ) ( not ( = ?auto_620982 ?auto_620983 ) ) ( not ( = ?auto_620982 ?auto_620984 ) ) ( not ( = ?auto_620982 ?auto_620985 ) ) ( not ( = ?auto_620982 ?auto_620986 ) ) ( not ( = ?auto_620982 ?auto_620987 ) ) ( not ( = ?auto_620982 ?auto_620988 ) ) ( not ( = ?auto_620982 ?auto_620989 ) ) ( not ( = ?auto_620982 ?auto_620990 ) ) ( not ( = ?auto_620983 ?auto_620984 ) ) ( not ( = ?auto_620983 ?auto_620985 ) ) ( not ( = ?auto_620983 ?auto_620986 ) ) ( not ( = ?auto_620983 ?auto_620987 ) ) ( not ( = ?auto_620983 ?auto_620988 ) ) ( not ( = ?auto_620983 ?auto_620989 ) ) ( not ( = ?auto_620983 ?auto_620990 ) ) ( not ( = ?auto_620984 ?auto_620985 ) ) ( not ( = ?auto_620984 ?auto_620986 ) ) ( not ( = ?auto_620984 ?auto_620987 ) ) ( not ( = ?auto_620984 ?auto_620988 ) ) ( not ( = ?auto_620984 ?auto_620989 ) ) ( not ( = ?auto_620984 ?auto_620990 ) ) ( not ( = ?auto_620985 ?auto_620986 ) ) ( not ( = ?auto_620985 ?auto_620987 ) ) ( not ( = ?auto_620985 ?auto_620988 ) ) ( not ( = ?auto_620985 ?auto_620989 ) ) ( not ( = ?auto_620985 ?auto_620990 ) ) ( not ( = ?auto_620986 ?auto_620987 ) ) ( not ( = ?auto_620986 ?auto_620988 ) ) ( not ( = ?auto_620986 ?auto_620989 ) ) ( not ( = ?auto_620986 ?auto_620990 ) ) ( not ( = ?auto_620987 ?auto_620988 ) ) ( not ( = ?auto_620987 ?auto_620989 ) ) ( not ( = ?auto_620987 ?auto_620990 ) ) ( not ( = ?auto_620988 ?auto_620989 ) ) ( not ( = ?auto_620988 ?auto_620990 ) ) ( not ( = ?auto_620989 ?auto_620990 ) ) ( ON ?auto_620988 ?auto_620989 ) ( ON ?auto_620987 ?auto_620988 ) ( CLEAR ?auto_620985 ) ( ON ?auto_620986 ?auto_620987 ) ( CLEAR ?auto_620986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_620982 ?auto_620983 ?auto_620984 ?auto_620985 ?auto_620986 )
      ( MAKE-8PILE ?auto_620982 ?auto_620983 ?auto_620984 ?auto_620985 ?auto_620986 ?auto_620987 ?auto_620988 ?auto_620989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_621016 - BLOCK
      ?auto_621017 - BLOCK
      ?auto_621018 - BLOCK
      ?auto_621019 - BLOCK
      ?auto_621020 - BLOCK
      ?auto_621021 - BLOCK
      ?auto_621022 - BLOCK
      ?auto_621023 - BLOCK
    )
    :vars
    (
      ?auto_621024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621023 ?auto_621024 ) ( ON-TABLE ?auto_621016 ) ( ON ?auto_621017 ?auto_621016 ) ( ON ?auto_621018 ?auto_621017 ) ( not ( = ?auto_621016 ?auto_621017 ) ) ( not ( = ?auto_621016 ?auto_621018 ) ) ( not ( = ?auto_621016 ?auto_621019 ) ) ( not ( = ?auto_621016 ?auto_621020 ) ) ( not ( = ?auto_621016 ?auto_621021 ) ) ( not ( = ?auto_621016 ?auto_621022 ) ) ( not ( = ?auto_621016 ?auto_621023 ) ) ( not ( = ?auto_621016 ?auto_621024 ) ) ( not ( = ?auto_621017 ?auto_621018 ) ) ( not ( = ?auto_621017 ?auto_621019 ) ) ( not ( = ?auto_621017 ?auto_621020 ) ) ( not ( = ?auto_621017 ?auto_621021 ) ) ( not ( = ?auto_621017 ?auto_621022 ) ) ( not ( = ?auto_621017 ?auto_621023 ) ) ( not ( = ?auto_621017 ?auto_621024 ) ) ( not ( = ?auto_621018 ?auto_621019 ) ) ( not ( = ?auto_621018 ?auto_621020 ) ) ( not ( = ?auto_621018 ?auto_621021 ) ) ( not ( = ?auto_621018 ?auto_621022 ) ) ( not ( = ?auto_621018 ?auto_621023 ) ) ( not ( = ?auto_621018 ?auto_621024 ) ) ( not ( = ?auto_621019 ?auto_621020 ) ) ( not ( = ?auto_621019 ?auto_621021 ) ) ( not ( = ?auto_621019 ?auto_621022 ) ) ( not ( = ?auto_621019 ?auto_621023 ) ) ( not ( = ?auto_621019 ?auto_621024 ) ) ( not ( = ?auto_621020 ?auto_621021 ) ) ( not ( = ?auto_621020 ?auto_621022 ) ) ( not ( = ?auto_621020 ?auto_621023 ) ) ( not ( = ?auto_621020 ?auto_621024 ) ) ( not ( = ?auto_621021 ?auto_621022 ) ) ( not ( = ?auto_621021 ?auto_621023 ) ) ( not ( = ?auto_621021 ?auto_621024 ) ) ( not ( = ?auto_621022 ?auto_621023 ) ) ( not ( = ?auto_621022 ?auto_621024 ) ) ( not ( = ?auto_621023 ?auto_621024 ) ) ( ON ?auto_621022 ?auto_621023 ) ( ON ?auto_621021 ?auto_621022 ) ( ON ?auto_621020 ?auto_621021 ) ( CLEAR ?auto_621018 ) ( ON ?auto_621019 ?auto_621020 ) ( CLEAR ?auto_621019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_621016 ?auto_621017 ?auto_621018 ?auto_621019 )
      ( MAKE-8PILE ?auto_621016 ?auto_621017 ?auto_621018 ?auto_621019 ?auto_621020 ?auto_621021 ?auto_621022 ?auto_621023 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_621050 - BLOCK
      ?auto_621051 - BLOCK
      ?auto_621052 - BLOCK
      ?auto_621053 - BLOCK
      ?auto_621054 - BLOCK
      ?auto_621055 - BLOCK
      ?auto_621056 - BLOCK
      ?auto_621057 - BLOCK
    )
    :vars
    (
      ?auto_621058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621057 ?auto_621058 ) ( ON-TABLE ?auto_621050 ) ( ON ?auto_621051 ?auto_621050 ) ( not ( = ?auto_621050 ?auto_621051 ) ) ( not ( = ?auto_621050 ?auto_621052 ) ) ( not ( = ?auto_621050 ?auto_621053 ) ) ( not ( = ?auto_621050 ?auto_621054 ) ) ( not ( = ?auto_621050 ?auto_621055 ) ) ( not ( = ?auto_621050 ?auto_621056 ) ) ( not ( = ?auto_621050 ?auto_621057 ) ) ( not ( = ?auto_621050 ?auto_621058 ) ) ( not ( = ?auto_621051 ?auto_621052 ) ) ( not ( = ?auto_621051 ?auto_621053 ) ) ( not ( = ?auto_621051 ?auto_621054 ) ) ( not ( = ?auto_621051 ?auto_621055 ) ) ( not ( = ?auto_621051 ?auto_621056 ) ) ( not ( = ?auto_621051 ?auto_621057 ) ) ( not ( = ?auto_621051 ?auto_621058 ) ) ( not ( = ?auto_621052 ?auto_621053 ) ) ( not ( = ?auto_621052 ?auto_621054 ) ) ( not ( = ?auto_621052 ?auto_621055 ) ) ( not ( = ?auto_621052 ?auto_621056 ) ) ( not ( = ?auto_621052 ?auto_621057 ) ) ( not ( = ?auto_621052 ?auto_621058 ) ) ( not ( = ?auto_621053 ?auto_621054 ) ) ( not ( = ?auto_621053 ?auto_621055 ) ) ( not ( = ?auto_621053 ?auto_621056 ) ) ( not ( = ?auto_621053 ?auto_621057 ) ) ( not ( = ?auto_621053 ?auto_621058 ) ) ( not ( = ?auto_621054 ?auto_621055 ) ) ( not ( = ?auto_621054 ?auto_621056 ) ) ( not ( = ?auto_621054 ?auto_621057 ) ) ( not ( = ?auto_621054 ?auto_621058 ) ) ( not ( = ?auto_621055 ?auto_621056 ) ) ( not ( = ?auto_621055 ?auto_621057 ) ) ( not ( = ?auto_621055 ?auto_621058 ) ) ( not ( = ?auto_621056 ?auto_621057 ) ) ( not ( = ?auto_621056 ?auto_621058 ) ) ( not ( = ?auto_621057 ?auto_621058 ) ) ( ON ?auto_621056 ?auto_621057 ) ( ON ?auto_621055 ?auto_621056 ) ( ON ?auto_621054 ?auto_621055 ) ( ON ?auto_621053 ?auto_621054 ) ( CLEAR ?auto_621051 ) ( ON ?auto_621052 ?auto_621053 ) ( CLEAR ?auto_621052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_621050 ?auto_621051 ?auto_621052 )
      ( MAKE-8PILE ?auto_621050 ?auto_621051 ?auto_621052 ?auto_621053 ?auto_621054 ?auto_621055 ?auto_621056 ?auto_621057 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_621084 - BLOCK
      ?auto_621085 - BLOCK
      ?auto_621086 - BLOCK
      ?auto_621087 - BLOCK
      ?auto_621088 - BLOCK
      ?auto_621089 - BLOCK
      ?auto_621090 - BLOCK
      ?auto_621091 - BLOCK
    )
    :vars
    (
      ?auto_621092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621091 ?auto_621092 ) ( ON-TABLE ?auto_621084 ) ( not ( = ?auto_621084 ?auto_621085 ) ) ( not ( = ?auto_621084 ?auto_621086 ) ) ( not ( = ?auto_621084 ?auto_621087 ) ) ( not ( = ?auto_621084 ?auto_621088 ) ) ( not ( = ?auto_621084 ?auto_621089 ) ) ( not ( = ?auto_621084 ?auto_621090 ) ) ( not ( = ?auto_621084 ?auto_621091 ) ) ( not ( = ?auto_621084 ?auto_621092 ) ) ( not ( = ?auto_621085 ?auto_621086 ) ) ( not ( = ?auto_621085 ?auto_621087 ) ) ( not ( = ?auto_621085 ?auto_621088 ) ) ( not ( = ?auto_621085 ?auto_621089 ) ) ( not ( = ?auto_621085 ?auto_621090 ) ) ( not ( = ?auto_621085 ?auto_621091 ) ) ( not ( = ?auto_621085 ?auto_621092 ) ) ( not ( = ?auto_621086 ?auto_621087 ) ) ( not ( = ?auto_621086 ?auto_621088 ) ) ( not ( = ?auto_621086 ?auto_621089 ) ) ( not ( = ?auto_621086 ?auto_621090 ) ) ( not ( = ?auto_621086 ?auto_621091 ) ) ( not ( = ?auto_621086 ?auto_621092 ) ) ( not ( = ?auto_621087 ?auto_621088 ) ) ( not ( = ?auto_621087 ?auto_621089 ) ) ( not ( = ?auto_621087 ?auto_621090 ) ) ( not ( = ?auto_621087 ?auto_621091 ) ) ( not ( = ?auto_621087 ?auto_621092 ) ) ( not ( = ?auto_621088 ?auto_621089 ) ) ( not ( = ?auto_621088 ?auto_621090 ) ) ( not ( = ?auto_621088 ?auto_621091 ) ) ( not ( = ?auto_621088 ?auto_621092 ) ) ( not ( = ?auto_621089 ?auto_621090 ) ) ( not ( = ?auto_621089 ?auto_621091 ) ) ( not ( = ?auto_621089 ?auto_621092 ) ) ( not ( = ?auto_621090 ?auto_621091 ) ) ( not ( = ?auto_621090 ?auto_621092 ) ) ( not ( = ?auto_621091 ?auto_621092 ) ) ( ON ?auto_621090 ?auto_621091 ) ( ON ?auto_621089 ?auto_621090 ) ( ON ?auto_621088 ?auto_621089 ) ( ON ?auto_621087 ?auto_621088 ) ( ON ?auto_621086 ?auto_621087 ) ( CLEAR ?auto_621084 ) ( ON ?auto_621085 ?auto_621086 ) ( CLEAR ?auto_621085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_621084 ?auto_621085 )
      ( MAKE-8PILE ?auto_621084 ?auto_621085 ?auto_621086 ?auto_621087 ?auto_621088 ?auto_621089 ?auto_621090 ?auto_621091 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_621118 - BLOCK
      ?auto_621119 - BLOCK
      ?auto_621120 - BLOCK
      ?auto_621121 - BLOCK
      ?auto_621122 - BLOCK
      ?auto_621123 - BLOCK
      ?auto_621124 - BLOCK
      ?auto_621125 - BLOCK
    )
    :vars
    (
      ?auto_621126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621125 ?auto_621126 ) ( not ( = ?auto_621118 ?auto_621119 ) ) ( not ( = ?auto_621118 ?auto_621120 ) ) ( not ( = ?auto_621118 ?auto_621121 ) ) ( not ( = ?auto_621118 ?auto_621122 ) ) ( not ( = ?auto_621118 ?auto_621123 ) ) ( not ( = ?auto_621118 ?auto_621124 ) ) ( not ( = ?auto_621118 ?auto_621125 ) ) ( not ( = ?auto_621118 ?auto_621126 ) ) ( not ( = ?auto_621119 ?auto_621120 ) ) ( not ( = ?auto_621119 ?auto_621121 ) ) ( not ( = ?auto_621119 ?auto_621122 ) ) ( not ( = ?auto_621119 ?auto_621123 ) ) ( not ( = ?auto_621119 ?auto_621124 ) ) ( not ( = ?auto_621119 ?auto_621125 ) ) ( not ( = ?auto_621119 ?auto_621126 ) ) ( not ( = ?auto_621120 ?auto_621121 ) ) ( not ( = ?auto_621120 ?auto_621122 ) ) ( not ( = ?auto_621120 ?auto_621123 ) ) ( not ( = ?auto_621120 ?auto_621124 ) ) ( not ( = ?auto_621120 ?auto_621125 ) ) ( not ( = ?auto_621120 ?auto_621126 ) ) ( not ( = ?auto_621121 ?auto_621122 ) ) ( not ( = ?auto_621121 ?auto_621123 ) ) ( not ( = ?auto_621121 ?auto_621124 ) ) ( not ( = ?auto_621121 ?auto_621125 ) ) ( not ( = ?auto_621121 ?auto_621126 ) ) ( not ( = ?auto_621122 ?auto_621123 ) ) ( not ( = ?auto_621122 ?auto_621124 ) ) ( not ( = ?auto_621122 ?auto_621125 ) ) ( not ( = ?auto_621122 ?auto_621126 ) ) ( not ( = ?auto_621123 ?auto_621124 ) ) ( not ( = ?auto_621123 ?auto_621125 ) ) ( not ( = ?auto_621123 ?auto_621126 ) ) ( not ( = ?auto_621124 ?auto_621125 ) ) ( not ( = ?auto_621124 ?auto_621126 ) ) ( not ( = ?auto_621125 ?auto_621126 ) ) ( ON ?auto_621124 ?auto_621125 ) ( ON ?auto_621123 ?auto_621124 ) ( ON ?auto_621122 ?auto_621123 ) ( ON ?auto_621121 ?auto_621122 ) ( ON ?auto_621120 ?auto_621121 ) ( ON ?auto_621119 ?auto_621120 ) ( ON ?auto_621118 ?auto_621119 ) ( CLEAR ?auto_621118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_621118 )
      ( MAKE-8PILE ?auto_621118 ?auto_621119 ?auto_621120 ?auto_621121 ?auto_621122 ?auto_621123 ?auto_621124 ?auto_621125 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621153 - BLOCK
      ?auto_621154 - BLOCK
      ?auto_621155 - BLOCK
      ?auto_621156 - BLOCK
      ?auto_621157 - BLOCK
      ?auto_621158 - BLOCK
      ?auto_621159 - BLOCK
      ?auto_621160 - BLOCK
      ?auto_621161 - BLOCK
    )
    :vars
    (
      ?auto_621162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_621160 ) ( ON ?auto_621161 ?auto_621162 ) ( CLEAR ?auto_621161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_621153 ) ( ON ?auto_621154 ?auto_621153 ) ( ON ?auto_621155 ?auto_621154 ) ( ON ?auto_621156 ?auto_621155 ) ( ON ?auto_621157 ?auto_621156 ) ( ON ?auto_621158 ?auto_621157 ) ( ON ?auto_621159 ?auto_621158 ) ( ON ?auto_621160 ?auto_621159 ) ( not ( = ?auto_621153 ?auto_621154 ) ) ( not ( = ?auto_621153 ?auto_621155 ) ) ( not ( = ?auto_621153 ?auto_621156 ) ) ( not ( = ?auto_621153 ?auto_621157 ) ) ( not ( = ?auto_621153 ?auto_621158 ) ) ( not ( = ?auto_621153 ?auto_621159 ) ) ( not ( = ?auto_621153 ?auto_621160 ) ) ( not ( = ?auto_621153 ?auto_621161 ) ) ( not ( = ?auto_621153 ?auto_621162 ) ) ( not ( = ?auto_621154 ?auto_621155 ) ) ( not ( = ?auto_621154 ?auto_621156 ) ) ( not ( = ?auto_621154 ?auto_621157 ) ) ( not ( = ?auto_621154 ?auto_621158 ) ) ( not ( = ?auto_621154 ?auto_621159 ) ) ( not ( = ?auto_621154 ?auto_621160 ) ) ( not ( = ?auto_621154 ?auto_621161 ) ) ( not ( = ?auto_621154 ?auto_621162 ) ) ( not ( = ?auto_621155 ?auto_621156 ) ) ( not ( = ?auto_621155 ?auto_621157 ) ) ( not ( = ?auto_621155 ?auto_621158 ) ) ( not ( = ?auto_621155 ?auto_621159 ) ) ( not ( = ?auto_621155 ?auto_621160 ) ) ( not ( = ?auto_621155 ?auto_621161 ) ) ( not ( = ?auto_621155 ?auto_621162 ) ) ( not ( = ?auto_621156 ?auto_621157 ) ) ( not ( = ?auto_621156 ?auto_621158 ) ) ( not ( = ?auto_621156 ?auto_621159 ) ) ( not ( = ?auto_621156 ?auto_621160 ) ) ( not ( = ?auto_621156 ?auto_621161 ) ) ( not ( = ?auto_621156 ?auto_621162 ) ) ( not ( = ?auto_621157 ?auto_621158 ) ) ( not ( = ?auto_621157 ?auto_621159 ) ) ( not ( = ?auto_621157 ?auto_621160 ) ) ( not ( = ?auto_621157 ?auto_621161 ) ) ( not ( = ?auto_621157 ?auto_621162 ) ) ( not ( = ?auto_621158 ?auto_621159 ) ) ( not ( = ?auto_621158 ?auto_621160 ) ) ( not ( = ?auto_621158 ?auto_621161 ) ) ( not ( = ?auto_621158 ?auto_621162 ) ) ( not ( = ?auto_621159 ?auto_621160 ) ) ( not ( = ?auto_621159 ?auto_621161 ) ) ( not ( = ?auto_621159 ?auto_621162 ) ) ( not ( = ?auto_621160 ?auto_621161 ) ) ( not ( = ?auto_621160 ?auto_621162 ) ) ( not ( = ?auto_621161 ?auto_621162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_621161 ?auto_621162 )
      ( !STACK ?auto_621161 ?auto_621160 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621191 - BLOCK
      ?auto_621192 - BLOCK
      ?auto_621193 - BLOCK
      ?auto_621194 - BLOCK
      ?auto_621195 - BLOCK
      ?auto_621196 - BLOCK
      ?auto_621197 - BLOCK
      ?auto_621198 - BLOCK
      ?auto_621199 - BLOCK
    )
    :vars
    (
      ?auto_621200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621199 ?auto_621200 ) ( ON-TABLE ?auto_621191 ) ( ON ?auto_621192 ?auto_621191 ) ( ON ?auto_621193 ?auto_621192 ) ( ON ?auto_621194 ?auto_621193 ) ( ON ?auto_621195 ?auto_621194 ) ( ON ?auto_621196 ?auto_621195 ) ( ON ?auto_621197 ?auto_621196 ) ( not ( = ?auto_621191 ?auto_621192 ) ) ( not ( = ?auto_621191 ?auto_621193 ) ) ( not ( = ?auto_621191 ?auto_621194 ) ) ( not ( = ?auto_621191 ?auto_621195 ) ) ( not ( = ?auto_621191 ?auto_621196 ) ) ( not ( = ?auto_621191 ?auto_621197 ) ) ( not ( = ?auto_621191 ?auto_621198 ) ) ( not ( = ?auto_621191 ?auto_621199 ) ) ( not ( = ?auto_621191 ?auto_621200 ) ) ( not ( = ?auto_621192 ?auto_621193 ) ) ( not ( = ?auto_621192 ?auto_621194 ) ) ( not ( = ?auto_621192 ?auto_621195 ) ) ( not ( = ?auto_621192 ?auto_621196 ) ) ( not ( = ?auto_621192 ?auto_621197 ) ) ( not ( = ?auto_621192 ?auto_621198 ) ) ( not ( = ?auto_621192 ?auto_621199 ) ) ( not ( = ?auto_621192 ?auto_621200 ) ) ( not ( = ?auto_621193 ?auto_621194 ) ) ( not ( = ?auto_621193 ?auto_621195 ) ) ( not ( = ?auto_621193 ?auto_621196 ) ) ( not ( = ?auto_621193 ?auto_621197 ) ) ( not ( = ?auto_621193 ?auto_621198 ) ) ( not ( = ?auto_621193 ?auto_621199 ) ) ( not ( = ?auto_621193 ?auto_621200 ) ) ( not ( = ?auto_621194 ?auto_621195 ) ) ( not ( = ?auto_621194 ?auto_621196 ) ) ( not ( = ?auto_621194 ?auto_621197 ) ) ( not ( = ?auto_621194 ?auto_621198 ) ) ( not ( = ?auto_621194 ?auto_621199 ) ) ( not ( = ?auto_621194 ?auto_621200 ) ) ( not ( = ?auto_621195 ?auto_621196 ) ) ( not ( = ?auto_621195 ?auto_621197 ) ) ( not ( = ?auto_621195 ?auto_621198 ) ) ( not ( = ?auto_621195 ?auto_621199 ) ) ( not ( = ?auto_621195 ?auto_621200 ) ) ( not ( = ?auto_621196 ?auto_621197 ) ) ( not ( = ?auto_621196 ?auto_621198 ) ) ( not ( = ?auto_621196 ?auto_621199 ) ) ( not ( = ?auto_621196 ?auto_621200 ) ) ( not ( = ?auto_621197 ?auto_621198 ) ) ( not ( = ?auto_621197 ?auto_621199 ) ) ( not ( = ?auto_621197 ?auto_621200 ) ) ( not ( = ?auto_621198 ?auto_621199 ) ) ( not ( = ?auto_621198 ?auto_621200 ) ) ( not ( = ?auto_621199 ?auto_621200 ) ) ( CLEAR ?auto_621197 ) ( ON ?auto_621198 ?auto_621199 ) ( CLEAR ?auto_621198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_621191 ?auto_621192 ?auto_621193 ?auto_621194 ?auto_621195 ?auto_621196 ?auto_621197 ?auto_621198 )
      ( MAKE-9PILE ?auto_621191 ?auto_621192 ?auto_621193 ?auto_621194 ?auto_621195 ?auto_621196 ?auto_621197 ?auto_621198 ?auto_621199 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621229 - BLOCK
      ?auto_621230 - BLOCK
      ?auto_621231 - BLOCK
      ?auto_621232 - BLOCK
      ?auto_621233 - BLOCK
      ?auto_621234 - BLOCK
      ?auto_621235 - BLOCK
      ?auto_621236 - BLOCK
      ?auto_621237 - BLOCK
    )
    :vars
    (
      ?auto_621238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621237 ?auto_621238 ) ( ON-TABLE ?auto_621229 ) ( ON ?auto_621230 ?auto_621229 ) ( ON ?auto_621231 ?auto_621230 ) ( ON ?auto_621232 ?auto_621231 ) ( ON ?auto_621233 ?auto_621232 ) ( ON ?auto_621234 ?auto_621233 ) ( not ( = ?auto_621229 ?auto_621230 ) ) ( not ( = ?auto_621229 ?auto_621231 ) ) ( not ( = ?auto_621229 ?auto_621232 ) ) ( not ( = ?auto_621229 ?auto_621233 ) ) ( not ( = ?auto_621229 ?auto_621234 ) ) ( not ( = ?auto_621229 ?auto_621235 ) ) ( not ( = ?auto_621229 ?auto_621236 ) ) ( not ( = ?auto_621229 ?auto_621237 ) ) ( not ( = ?auto_621229 ?auto_621238 ) ) ( not ( = ?auto_621230 ?auto_621231 ) ) ( not ( = ?auto_621230 ?auto_621232 ) ) ( not ( = ?auto_621230 ?auto_621233 ) ) ( not ( = ?auto_621230 ?auto_621234 ) ) ( not ( = ?auto_621230 ?auto_621235 ) ) ( not ( = ?auto_621230 ?auto_621236 ) ) ( not ( = ?auto_621230 ?auto_621237 ) ) ( not ( = ?auto_621230 ?auto_621238 ) ) ( not ( = ?auto_621231 ?auto_621232 ) ) ( not ( = ?auto_621231 ?auto_621233 ) ) ( not ( = ?auto_621231 ?auto_621234 ) ) ( not ( = ?auto_621231 ?auto_621235 ) ) ( not ( = ?auto_621231 ?auto_621236 ) ) ( not ( = ?auto_621231 ?auto_621237 ) ) ( not ( = ?auto_621231 ?auto_621238 ) ) ( not ( = ?auto_621232 ?auto_621233 ) ) ( not ( = ?auto_621232 ?auto_621234 ) ) ( not ( = ?auto_621232 ?auto_621235 ) ) ( not ( = ?auto_621232 ?auto_621236 ) ) ( not ( = ?auto_621232 ?auto_621237 ) ) ( not ( = ?auto_621232 ?auto_621238 ) ) ( not ( = ?auto_621233 ?auto_621234 ) ) ( not ( = ?auto_621233 ?auto_621235 ) ) ( not ( = ?auto_621233 ?auto_621236 ) ) ( not ( = ?auto_621233 ?auto_621237 ) ) ( not ( = ?auto_621233 ?auto_621238 ) ) ( not ( = ?auto_621234 ?auto_621235 ) ) ( not ( = ?auto_621234 ?auto_621236 ) ) ( not ( = ?auto_621234 ?auto_621237 ) ) ( not ( = ?auto_621234 ?auto_621238 ) ) ( not ( = ?auto_621235 ?auto_621236 ) ) ( not ( = ?auto_621235 ?auto_621237 ) ) ( not ( = ?auto_621235 ?auto_621238 ) ) ( not ( = ?auto_621236 ?auto_621237 ) ) ( not ( = ?auto_621236 ?auto_621238 ) ) ( not ( = ?auto_621237 ?auto_621238 ) ) ( ON ?auto_621236 ?auto_621237 ) ( CLEAR ?auto_621234 ) ( ON ?auto_621235 ?auto_621236 ) ( CLEAR ?auto_621235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_621229 ?auto_621230 ?auto_621231 ?auto_621232 ?auto_621233 ?auto_621234 ?auto_621235 )
      ( MAKE-9PILE ?auto_621229 ?auto_621230 ?auto_621231 ?auto_621232 ?auto_621233 ?auto_621234 ?auto_621235 ?auto_621236 ?auto_621237 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621267 - BLOCK
      ?auto_621268 - BLOCK
      ?auto_621269 - BLOCK
      ?auto_621270 - BLOCK
      ?auto_621271 - BLOCK
      ?auto_621272 - BLOCK
      ?auto_621273 - BLOCK
      ?auto_621274 - BLOCK
      ?auto_621275 - BLOCK
    )
    :vars
    (
      ?auto_621276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621275 ?auto_621276 ) ( ON-TABLE ?auto_621267 ) ( ON ?auto_621268 ?auto_621267 ) ( ON ?auto_621269 ?auto_621268 ) ( ON ?auto_621270 ?auto_621269 ) ( ON ?auto_621271 ?auto_621270 ) ( not ( = ?auto_621267 ?auto_621268 ) ) ( not ( = ?auto_621267 ?auto_621269 ) ) ( not ( = ?auto_621267 ?auto_621270 ) ) ( not ( = ?auto_621267 ?auto_621271 ) ) ( not ( = ?auto_621267 ?auto_621272 ) ) ( not ( = ?auto_621267 ?auto_621273 ) ) ( not ( = ?auto_621267 ?auto_621274 ) ) ( not ( = ?auto_621267 ?auto_621275 ) ) ( not ( = ?auto_621267 ?auto_621276 ) ) ( not ( = ?auto_621268 ?auto_621269 ) ) ( not ( = ?auto_621268 ?auto_621270 ) ) ( not ( = ?auto_621268 ?auto_621271 ) ) ( not ( = ?auto_621268 ?auto_621272 ) ) ( not ( = ?auto_621268 ?auto_621273 ) ) ( not ( = ?auto_621268 ?auto_621274 ) ) ( not ( = ?auto_621268 ?auto_621275 ) ) ( not ( = ?auto_621268 ?auto_621276 ) ) ( not ( = ?auto_621269 ?auto_621270 ) ) ( not ( = ?auto_621269 ?auto_621271 ) ) ( not ( = ?auto_621269 ?auto_621272 ) ) ( not ( = ?auto_621269 ?auto_621273 ) ) ( not ( = ?auto_621269 ?auto_621274 ) ) ( not ( = ?auto_621269 ?auto_621275 ) ) ( not ( = ?auto_621269 ?auto_621276 ) ) ( not ( = ?auto_621270 ?auto_621271 ) ) ( not ( = ?auto_621270 ?auto_621272 ) ) ( not ( = ?auto_621270 ?auto_621273 ) ) ( not ( = ?auto_621270 ?auto_621274 ) ) ( not ( = ?auto_621270 ?auto_621275 ) ) ( not ( = ?auto_621270 ?auto_621276 ) ) ( not ( = ?auto_621271 ?auto_621272 ) ) ( not ( = ?auto_621271 ?auto_621273 ) ) ( not ( = ?auto_621271 ?auto_621274 ) ) ( not ( = ?auto_621271 ?auto_621275 ) ) ( not ( = ?auto_621271 ?auto_621276 ) ) ( not ( = ?auto_621272 ?auto_621273 ) ) ( not ( = ?auto_621272 ?auto_621274 ) ) ( not ( = ?auto_621272 ?auto_621275 ) ) ( not ( = ?auto_621272 ?auto_621276 ) ) ( not ( = ?auto_621273 ?auto_621274 ) ) ( not ( = ?auto_621273 ?auto_621275 ) ) ( not ( = ?auto_621273 ?auto_621276 ) ) ( not ( = ?auto_621274 ?auto_621275 ) ) ( not ( = ?auto_621274 ?auto_621276 ) ) ( not ( = ?auto_621275 ?auto_621276 ) ) ( ON ?auto_621274 ?auto_621275 ) ( ON ?auto_621273 ?auto_621274 ) ( CLEAR ?auto_621271 ) ( ON ?auto_621272 ?auto_621273 ) ( CLEAR ?auto_621272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_621267 ?auto_621268 ?auto_621269 ?auto_621270 ?auto_621271 ?auto_621272 )
      ( MAKE-9PILE ?auto_621267 ?auto_621268 ?auto_621269 ?auto_621270 ?auto_621271 ?auto_621272 ?auto_621273 ?auto_621274 ?auto_621275 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621305 - BLOCK
      ?auto_621306 - BLOCK
      ?auto_621307 - BLOCK
      ?auto_621308 - BLOCK
      ?auto_621309 - BLOCK
      ?auto_621310 - BLOCK
      ?auto_621311 - BLOCK
      ?auto_621312 - BLOCK
      ?auto_621313 - BLOCK
    )
    :vars
    (
      ?auto_621314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621313 ?auto_621314 ) ( ON-TABLE ?auto_621305 ) ( ON ?auto_621306 ?auto_621305 ) ( ON ?auto_621307 ?auto_621306 ) ( ON ?auto_621308 ?auto_621307 ) ( not ( = ?auto_621305 ?auto_621306 ) ) ( not ( = ?auto_621305 ?auto_621307 ) ) ( not ( = ?auto_621305 ?auto_621308 ) ) ( not ( = ?auto_621305 ?auto_621309 ) ) ( not ( = ?auto_621305 ?auto_621310 ) ) ( not ( = ?auto_621305 ?auto_621311 ) ) ( not ( = ?auto_621305 ?auto_621312 ) ) ( not ( = ?auto_621305 ?auto_621313 ) ) ( not ( = ?auto_621305 ?auto_621314 ) ) ( not ( = ?auto_621306 ?auto_621307 ) ) ( not ( = ?auto_621306 ?auto_621308 ) ) ( not ( = ?auto_621306 ?auto_621309 ) ) ( not ( = ?auto_621306 ?auto_621310 ) ) ( not ( = ?auto_621306 ?auto_621311 ) ) ( not ( = ?auto_621306 ?auto_621312 ) ) ( not ( = ?auto_621306 ?auto_621313 ) ) ( not ( = ?auto_621306 ?auto_621314 ) ) ( not ( = ?auto_621307 ?auto_621308 ) ) ( not ( = ?auto_621307 ?auto_621309 ) ) ( not ( = ?auto_621307 ?auto_621310 ) ) ( not ( = ?auto_621307 ?auto_621311 ) ) ( not ( = ?auto_621307 ?auto_621312 ) ) ( not ( = ?auto_621307 ?auto_621313 ) ) ( not ( = ?auto_621307 ?auto_621314 ) ) ( not ( = ?auto_621308 ?auto_621309 ) ) ( not ( = ?auto_621308 ?auto_621310 ) ) ( not ( = ?auto_621308 ?auto_621311 ) ) ( not ( = ?auto_621308 ?auto_621312 ) ) ( not ( = ?auto_621308 ?auto_621313 ) ) ( not ( = ?auto_621308 ?auto_621314 ) ) ( not ( = ?auto_621309 ?auto_621310 ) ) ( not ( = ?auto_621309 ?auto_621311 ) ) ( not ( = ?auto_621309 ?auto_621312 ) ) ( not ( = ?auto_621309 ?auto_621313 ) ) ( not ( = ?auto_621309 ?auto_621314 ) ) ( not ( = ?auto_621310 ?auto_621311 ) ) ( not ( = ?auto_621310 ?auto_621312 ) ) ( not ( = ?auto_621310 ?auto_621313 ) ) ( not ( = ?auto_621310 ?auto_621314 ) ) ( not ( = ?auto_621311 ?auto_621312 ) ) ( not ( = ?auto_621311 ?auto_621313 ) ) ( not ( = ?auto_621311 ?auto_621314 ) ) ( not ( = ?auto_621312 ?auto_621313 ) ) ( not ( = ?auto_621312 ?auto_621314 ) ) ( not ( = ?auto_621313 ?auto_621314 ) ) ( ON ?auto_621312 ?auto_621313 ) ( ON ?auto_621311 ?auto_621312 ) ( ON ?auto_621310 ?auto_621311 ) ( CLEAR ?auto_621308 ) ( ON ?auto_621309 ?auto_621310 ) ( CLEAR ?auto_621309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_621305 ?auto_621306 ?auto_621307 ?auto_621308 ?auto_621309 )
      ( MAKE-9PILE ?auto_621305 ?auto_621306 ?auto_621307 ?auto_621308 ?auto_621309 ?auto_621310 ?auto_621311 ?auto_621312 ?auto_621313 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621343 - BLOCK
      ?auto_621344 - BLOCK
      ?auto_621345 - BLOCK
      ?auto_621346 - BLOCK
      ?auto_621347 - BLOCK
      ?auto_621348 - BLOCK
      ?auto_621349 - BLOCK
      ?auto_621350 - BLOCK
      ?auto_621351 - BLOCK
    )
    :vars
    (
      ?auto_621352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621351 ?auto_621352 ) ( ON-TABLE ?auto_621343 ) ( ON ?auto_621344 ?auto_621343 ) ( ON ?auto_621345 ?auto_621344 ) ( not ( = ?auto_621343 ?auto_621344 ) ) ( not ( = ?auto_621343 ?auto_621345 ) ) ( not ( = ?auto_621343 ?auto_621346 ) ) ( not ( = ?auto_621343 ?auto_621347 ) ) ( not ( = ?auto_621343 ?auto_621348 ) ) ( not ( = ?auto_621343 ?auto_621349 ) ) ( not ( = ?auto_621343 ?auto_621350 ) ) ( not ( = ?auto_621343 ?auto_621351 ) ) ( not ( = ?auto_621343 ?auto_621352 ) ) ( not ( = ?auto_621344 ?auto_621345 ) ) ( not ( = ?auto_621344 ?auto_621346 ) ) ( not ( = ?auto_621344 ?auto_621347 ) ) ( not ( = ?auto_621344 ?auto_621348 ) ) ( not ( = ?auto_621344 ?auto_621349 ) ) ( not ( = ?auto_621344 ?auto_621350 ) ) ( not ( = ?auto_621344 ?auto_621351 ) ) ( not ( = ?auto_621344 ?auto_621352 ) ) ( not ( = ?auto_621345 ?auto_621346 ) ) ( not ( = ?auto_621345 ?auto_621347 ) ) ( not ( = ?auto_621345 ?auto_621348 ) ) ( not ( = ?auto_621345 ?auto_621349 ) ) ( not ( = ?auto_621345 ?auto_621350 ) ) ( not ( = ?auto_621345 ?auto_621351 ) ) ( not ( = ?auto_621345 ?auto_621352 ) ) ( not ( = ?auto_621346 ?auto_621347 ) ) ( not ( = ?auto_621346 ?auto_621348 ) ) ( not ( = ?auto_621346 ?auto_621349 ) ) ( not ( = ?auto_621346 ?auto_621350 ) ) ( not ( = ?auto_621346 ?auto_621351 ) ) ( not ( = ?auto_621346 ?auto_621352 ) ) ( not ( = ?auto_621347 ?auto_621348 ) ) ( not ( = ?auto_621347 ?auto_621349 ) ) ( not ( = ?auto_621347 ?auto_621350 ) ) ( not ( = ?auto_621347 ?auto_621351 ) ) ( not ( = ?auto_621347 ?auto_621352 ) ) ( not ( = ?auto_621348 ?auto_621349 ) ) ( not ( = ?auto_621348 ?auto_621350 ) ) ( not ( = ?auto_621348 ?auto_621351 ) ) ( not ( = ?auto_621348 ?auto_621352 ) ) ( not ( = ?auto_621349 ?auto_621350 ) ) ( not ( = ?auto_621349 ?auto_621351 ) ) ( not ( = ?auto_621349 ?auto_621352 ) ) ( not ( = ?auto_621350 ?auto_621351 ) ) ( not ( = ?auto_621350 ?auto_621352 ) ) ( not ( = ?auto_621351 ?auto_621352 ) ) ( ON ?auto_621350 ?auto_621351 ) ( ON ?auto_621349 ?auto_621350 ) ( ON ?auto_621348 ?auto_621349 ) ( ON ?auto_621347 ?auto_621348 ) ( CLEAR ?auto_621345 ) ( ON ?auto_621346 ?auto_621347 ) ( CLEAR ?auto_621346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_621343 ?auto_621344 ?auto_621345 ?auto_621346 )
      ( MAKE-9PILE ?auto_621343 ?auto_621344 ?auto_621345 ?auto_621346 ?auto_621347 ?auto_621348 ?auto_621349 ?auto_621350 ?auto_621351 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621381 - BLOCK
      ?auto_621382 - BLOCK
      ?auto_621383 - BLOCK
      ?auto_621384 - BLOCK
      ?auto_621385 - BLOCK
      ?auto_621386 - BLOCK
      ?auto_621387 - BLOCK
      ?auto_621388 - BLOCK
      ?auto_621389 - BLOCK
    )
    :vars
    (
      ?auto_621390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621389 ?auto_621390 ) ( ON-TABLE ?auto_621381 ) ( ON ?auto_621382 ?auto_621381 ) ( not ( = ?auto_621381 ?auto_621382 ) ) ( not ( = ?auto_621381 ?auto_621383 ) ) ( not ( = ?auto_621381 ?auto_621384 ) ) ( not ( = ?auto_621381 ?auto_621385 ) ) ( not ( = ?auto_621381 ?auto_621386 ) ) ( not ( = ?auto_621381 ?auto_621387 ) ) ( not ( = ?auto_621381 ?auto_621388 ) ) ( not ( = ?auto_621381 ?auto_621389 ) ) ( not ( = ?auto_621381 ?auto_621390 ) ) ( not ( = ?auto_621382 ?auto_621383 ) ) ( not ( = ?auto_621382 ?auto_621384 ) ) ( not ( = ?auto_621382 ?auto_621385 ) ) ( not ( = ?auto_621382 ?auto_621386 ) ) ( not ( = ?auto_621382 ?auto_621387 ) ) ( not ( = ?auto_621382 ?auto_621388 ) ) ( not ( = ?auto_621382 ?auto_621389 ) ) ( not ( = ?auto_621382 ?auto_621390 ) ) ( not ( = ?auto_621383 ?auto_621384 ) ) ( not ( = ?auto_621383 ?auto_621385 ) ) ( not ( = ?auto_621383 ?auto_621386 ) ) ( not ( = ?auto_621383 ?auto_621387 ) ) ( not ( = ?auto_621383 ?auto_621388 ) ) ( not ( = ?auto_621383 ?auto_621389 ) ) ( not ( = ?auto_621383 ?auto_621390 ) ) ( not ( = ?auto_621384 ?auto_621385 ) ) ( not ( = ?auto_621384 ?auto_621386 ) ) ( not ( = ?auto_621384 ?auto_621387 ) ) ( not ( = ?auto_621384 ?auto_621388 ) ) ( not ( = ?auto_621384 ?auto_621389 ) ) ( not ( = ?auto_621384 ?auto_621390 ) ) ( not ( = ?auto_621385 ?auto_621386 ) ) ( not ( = ?auto_621385 ?auto_621387 ) ) ( not ( = ?auto_621385 ?auto_621388 ) ) ( not ( = ?auto_621385 ?auto_621389 ) ) ( not ( = ?auto_621385 ?auto_621390 ) ) ( not ( = ?auto_621386 ?auto_621387 ) ) ( not ( = ?auto_621386 ?auto_621388 ) ) ( not ( = ?auto_621386 ?auto_621389 ) ) ( not ( = ?auto_621386 ?auto_621390 ) ) ( not ( = ?auto_621387 ?auto_621388 ) ) ( not ( = ?auto_621387 ?auto_621389 ) ) ( not ( = ?auto_621387 ?auto_621390 ) ) ( not ( = ?auto_621388 ?auto_621389 ) ) ( not ( = ?auto_621388 ?auto_621390 ) ) ( not ( = ?auto_621389 ?auto_621390 ) ) ( ON ?auto_621388 ?auto_621389 ) ( ON ?auto_621387 ?auto_621388 ) ( ON ?auto_621386 ?auto_621387 ) ( ON ?auto_621385 ?auto_621386 ) ( ON ?auto_621384 ?auto_621385 ) ( CLEAR ?auto_621382 ) ( ON ?auto_621383 ?auto_621384 ) ( CLEAR ?auto_621383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_621381 ?auto_621382 ?auto_621383 )
      ( MAKE-9PILE ?auto_621381 ?auto_621382 ?auto_621383 ?auto_621384 ?auto_621385 ?auto_621386 ?auto_621387 ?auto_621388 ?auto_621389 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621419 - BLOCK
      ?auto_621420 - BLOCK
      ?auto_621421 - BLOCK
      ?auto_621422 - BLOCK
      ?auto_621423 - BLOCK
      ?auto_621424 - BLOCK
      ?auto_621425 - BLOCK
      ?auto_621426 - BLOCK
      ?auto_621427 - BLOCK
    )
    :vars
    (
      ?auto_621428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621427 ?auto_621428 ) ( ON-TABLE ?auto_621419 ) ( not ( = ?auto_621419 ?auto_621420 ) ) ( not ( = ?auto_621419 ?auto_621421 ) ) ( not ( = ?auto_621419 ?auto_621422 ) ) ( not ( = ?auto_621419 ?auto_621423 ) ) ( not ( = ?auto_621419 ?auto_621424 ) ) ( not ( = ?auto_621419 ?auto_621425 ) ) ( not ( = ?auto_621419 ?auto_621426 ) ) ( not ( = ?auto_621419 ?auto_621427 ) ) ( not ( = ?auto_621419 ?auto_621428 ) ) ( not ( = ?auto_621420 ?auto_621421 ) ) ( not ( = ?auto_621420 ?auto_621422 ) ) ( not ( = ?auto_621420 ?auto_621423 ) ) ( not ( = ?auto_621420 ?auto_621424 ) ) ( not ( = ?auto_621420 ?auto_621425 ) ) ( not ( = ?auto_621420 ?auto_621426 ) ) ( not ( = ?auto_621420 ?auto_621427 ) ) ( not ( = ?auto_621420 ?auto_621428 ) ) ( not ( = ?auto_621421 ?auto_621422 ) ) ( not ( = ?auto_621421 ?auto_621423 ) ) ( not ( = ?auto_621421 ?auto_621424 ) ) ( not ( = ?auto_621421 ?auto_621425 ) ) ( not ( = ?auto_621421 ?auto_621426 ) ) ( not ( = ?auto_621421 ?auto_621427 ) ) ( not ( = ?auto_621421 ?auto_621428 ) ) ( not ( = ?auto_621422 ?auto_621423 ) ) ( not ( = ?auto_621422 ?auto_621424 ) ) ( not ( = ?auto_621422 ?auto_621425 ) ) ( not ( = ?auto_621422 ?auto_621426 ) ) ( not ( = ?auto_621422 ?auto_621427 ) ) ( not ( = ?auto_621422 ?auto_621428 ) ) ( not ( = ?auto_621423 ?auto_621424 ) ) ( not ( = ?auto_621423 ?auto_621425 ) ) ( not ( = ?auto_621423 ?auto_621426 ) ) ( not ( = ?auto_621423 ?auto_621427 ) ) ( not ( = ?auto_621423 ?auto_621428 ) ) ( not ( = ?auto_621424 ?auto_621425 ) ) ( not ( = ?auto_621424 ?auto_621426 ) ) ( not ( = ?auto_621424 ?auto_621427 ) ) ( not ( = ?auto_621424 ?auto_621428 ) ) ( not ( = ?auto_621425 ?auto_621426 ) ) ( not ( = ?auto_621425 ?auto_621427 ) ) ( not ( = ?auto_621425 ?auto_621428 ) ) ( not ( = ?auto_621426 ?auto_621427 ) ) ( not ( = ?auto_621426 ?auto_621428 ) ) ( not ( = ?auto_621427 ?auto_621428 ) ) ( ON ?auto_621426 ?auto_621427 ) ( ON ?auto_621425 ?auto_621426 ) ( ON ?auto_621424 ?auto_621425 ) ( ON ?auto_621423 ?auto_621424 ) ( ON ?auto_621422 ?auto_621423 ) ( ON ?auto_621421 ?auto_621422 ) ( CLEAR ?auto_621419 ) ( ON ?auto_621420 ?auto_621421 ) ( CLEAR ?auto_621420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_621419 ?auto_621420 )
      ( MAKE-9PILE ?auto_621419 ?auto_621420 ?auto_621421 ?auto_621422 ?auto_621423 ?auto_621424 ?auto_621425 ?auto_621426 ?auto_621427 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_621457 - BLOCK
      ?auto_621458 - BLOCK
      ?auto_621459 - BLOCK
      ?auto_621460 - BLOCK
      ?auto_621461 - BLOCK
      ?auto_621462 - BLOCK
      ?auto_621463 - BLOCK
      ?auto_621464 - BLOCK
      ?auto_621465 - BLOCK
    )
    :vars
    (
      ?auto_621466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621465 ?auto_621466 ) ( not ( = ?auto_621457 ?auto_621458 ) ) ( not ( = ?auto_621457 ?auto_621459 ) ) ( not ( = ?auto_621457 ?auto_621460 ) ) ( not ( = ?auto_621457 ?auto_621461 ) ) ( not ( = ?auto_621457 ?auto_621462 ) ) ( not ( = ?auto_621457 ?auto_621463 ) ) ( not ( = ?auto_621457 ?auto_621464 ) ) ( not ( = ?auto_621457 ?auto_621465 ) ) ( not ( = ?auto_621457 ?auto_621466 ) ) ( not ( = ?auto_621458 ?auto_621459 ) ) ( not ( = ?auto_621458 ?auto_621460 ) ) ( not ( = ?auto_621458 ?auto_621461 ) ) ( not ( = ?auto_621458 ?auto_621462 ) ) ( not ( = ?auto_621458 ?auto_621463 ) ) ( not ( = ?auto_621458 ?auto_621464 ) ) ( not ( = ?auto_621458 ?auto_621465 ) ) ( not ( = ?auto_621458 ?auto_621466 ) ) ( not ( = ?auto_621459 ?auto_621460 ) ) ( not ( = ?auto_621459 ?auto_621461 ) ) ( not ( = ?auto_621459 ?auto_621462 ) ) ( not ( = ?auto_621459 ?auto_621463 ) ) ( not ( = ?auto_621459 ?auto_621464 ) ) ( not ( = ?auto_621459 ?auto_621465 ) ) ( not ( = ?auto_621459 ?auto_621466 ) ) ( not ( = ?auto_621460 ?auto_621461 ) ) ( not ( = ?auto_621460 ?auto_621462 ) ) ( not ( = ?auto_621460 ?auto_621463 ) ) ( not ( = ?auto_621460 ?auto_621464 ) ) ( not ( = ?auto_621460 ?auto_621465 ) ) ( not ( = ?auto_621460 ?auto_621466 ) ) ( not ( = ?auto_621461 ?auto_621462 ) ) ( not ( = ?auto_621461 ?auto_621463 ) ) ( not ( = ?auto_621461 ?auto_621464 ) ) ( not ( = ?auto_621461 ?auto_621465 ) ) ( not ( = ?auto_621461 ?auto_621466 ) ) ( not ( = ?auto_621462 ?auto_621463 ) ) ( not ( = ?auto_621462 ?auto_621464 ) ) ( not ( = ?auto_621462 ?auto_621465 ) ) ( not ( = ?auto_621462 ?auto_621466 ) ) ( not ( = ?auto_621463 ?auto_621464 ) ) ( not ( = ?auto_621463 ?auto_621465 ) ) ( not ( = ?auto_621463 ?auto_621466 ) ) ( not ( = ?auto_621464 ?auto_621465 ) ) ( not ( = ?auto_621464 ?auto_621466 ) ) ( not ( = ?auto_621465 ?auto_621466 ) ) ( ON ?auto_621464 ?auto_621465 ) ( ON ?auto_621463 ?auto_621464 ) ( ON ?auto_621462 ?auto_621463 ) ( ON ?auto_621461 ?auto_621462 ) ( ON ?auto_621460 ?auto_621461 ) ( ON ?auto_621459 ?auto_621460 ) ( ON ?auto_621458 ?auto_621459 ) ( ON ?auto_621457 ?auto_621458 ) ( CLEAR ?auto_621457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_621457 )
      ( MAKE-9PILE ?auto_621457 ?auto_621458 ?auto_621459 ?auto_621460 ?auto_621461 ?auto_621462 ?auto_621463 ?auto_621464 ?auto_621465 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621496 - BLOCK
      ?auto_621497 - BLOCK
      ?auto_621498 - BLOCK
      ?auto_621499 - BLOCK
      ?auto_621500 - BLOCK
      ?auto_621501 - BLOCK
      ?auto_621502 - BLOCK
      ?auto_621503 - BLOCK
      ?auto_621504 - BLOCK
      ?auto_621505 - BLOCK
    )
    :vars
    (
      ?auto_621506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_621504 ) ( ON ?auto_621505 ?auto_621506 ) ( CLEAR ?auto_621505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_621496 ) ( ON ?auto_621497 ?auto_621496 ) ( ON ?auto_621498 ?auto_621497 ) ( ON ?auto_621499 ?auto_621498 ) ( ON ?auto_621500 ?auto_621499 ) ( ON ?auto_621501 ?auto_621500 ) ( ON ?auto_621502 ?auto_621501 ) ( ON ?auto_621503 ?auto_621502 ) ( ON ?auto_621504 ?auto_621503 ) ( not ( = ?auto_621496 ?auto_621497 ) ) ( not ( = ?auto_621496 ?auto_621498 ) ) ( not ( = ?auto_621496 ?auto_621499 ) ) ( not ( = ?auto_621496 ?auto_621500 ) ) ( not ( = ?auto_621496 ?auto_621501 ) ) ( not ( = ?auto_621496 ?auto_621502 ) ) ( not ( = ?auto_621496 ?auto_621503 ) ) ( not ( = ?auto_621496 ?auto_621504 ) ) ( not ( = ?auto_621496 ?auto_621505 ) ) ( not ( = ?auto_621496 ?auto_621506 ) ) ( not ( = ?auto_621497 ?auto_621498 ) ) ( not ( = ?auto_621497 ?auto_621499 ) ) ( not ( = ?auto_621497 ?auto_621500 ) ) ( not ( = ?auto_621497 ?auto_621501 ) ) ( not ( = ?auto_621497 ?auto_621502 ) ) ( not ( = ?auto_621497 ?auto_621503 ) ) ( not ( = ?auto_621497 ?auto_621504 ) ) ( not ( = ?auto_621497 ?auto_621505 ) ) ( not ( = ?auto_621497 ?auto_621506 ) ) ( not ( = ?auto_621498 ?auto_621499 ) ) ( not ( = ?auto_621498 ?auto_621500 ) ) ( not ( = ?auto_621498 ?auto_621501 ) ) ( not ( = ?auto_621498 ?auto_621502 ) ) ( not ( = ?auto_621498 ?auto_621503 ) ) ( not ( = ?auto_621498 ?auto_621504 ) ) ( not ( = ?auto_621498 ?auto_621505 ) ) ( not ( = ?auto_621498 ?auto_621506 ) ) ( not ( = ?auto_621499 ?auto_621500 ) ) ( not ( = ?auto_621499 ?auto_621501 ) ) ( not ( = ?auto_621499 ?auto_621502 ) ) ( not ( = ?auto_621499 ?auto_621503 ) ) ( not ( = ?auto_621499 ?auto_621504 ) ) ( not ( = ?auto_621499 ?auto_621505 ) ) ( not ( = ?auto_621499 ?auto_621506 ) ) ( not ( = ?auto_621500 ?auto_621501 ) ) ( not ( = ?auto_621500 ?auto_621502 ) ) ( not ( = ?auto_621500 ?auto_621503 ) ) ( not ( = ?auto_621500 ?auto_621504 ) ) ( not ( = ?auto_621500 ?auto_621505 ) ) ( not ( = ?auto_621500 ?auto_621506 ) ) ( not ( = ?auto_621501 ?auto_621502 ) ) ( not ( = ?auto_621501 ?auto_621503 ) ) ( not ( = ?auto_621501 ?auto_621504 ) ) ( not ( = ?auto_621501 ?auto_621505 ) ) ( not ( = ?auto_621501 ?auto_621506 ) ) ( not ( = ?auto_621502 ?auto_621503 ) ) ( not ( = ?auto_621502 ?auto_621504 ) ) ( not ( = ?auto_621502 ?auto_621505 ) ) ( not ( = ?auto_621502 ?auto_621506 ) ) ( not ( = ?auto_621503 ?auto_621504 ) ) ( not ( = ?auto_621503 ?auto_621505 ) ) ( not ( = ?auto_621503 ?auto_621506 ) ) ( not ( = ?auto_621504 ?auto_621505 ) ) ( not ( = ?auto_621504 ?auto_621506 ) ) ( not ( = ?auto_621505 ?auto_621506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_621505 ?auto_621506 )
      ( !STACK ?auto_621505 ?auto_621504 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621538 - BLOCK
      ?auto_621539 - BLOCK
      ?auto_621540 - BLOCK
      ?auto_621541 - BLOCK
      ?auto_621542 - BLOCK
      ?auto_621543 - BLOCK
      ?auto_621544 - BLOCK
      ?auto_621545 - BLOCK
      ?auto_621546 - BLOCK
      ?auto_621547 - BLOCK
    )
    :vars
    (
      ?auto_621548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621547 ?auto_621548 ) ( ON-TABLE ?auto_621538 ) ( ON ?auto_621539 ?auto_621538 ) ( ON ?auto_621540 ?auto_621539 ) ( ON ?auto_621541 ?auto_621540 ) ( ON ?auto_621542 ?auto_621541 ) ( ON ?auto_621543 ?auto_621542 ) ( ON ?auto_621544 ?auto_621543 ) ( ON ?auto_621545 ?auto_621544 ) ( not ( = ?auto_621538 ?auto_621539 ) ) ( not ( = ?auto_621538 ?auto_621540 ) ) ( not ( = ?auto_621538 ?auto_621541 ) ) ( not ( = ?auto_621538 ?auto_621542 ) ) ( not ( = ?auto_621538 ?auto_621543 ) ) ( not ( = ?auto_621538 ?auto_621544 ) ) ( not ( = ?auto_621538 ?auto_621545 ) ) ( not ( = ?auto_621538 ?auto_621546 ) ) ( not ( = ?auto_621538 ?auto_621547 ) ) ( not ( = ?auto_621538 ?auto_621548 ) ) ( not ( = ?auto_621539 ?auto_621540 ) ) ( not ( = ?auto_621539 ?auto_621541 ) ) ( not ( = ?auto_621539 ?auto_621542 ) ) ( not ( = ?auto_621539 ?auto_621543 ) ) ( not ( = ?auto_621539 ?auto_621544 ) ) ( not ( = ?auto_621539 ?auto_621545 ) ) ( not ( = ?auto_621539 ?auto_621546 ) ) ( not ( = ?auto_621539 ?auto_621547 ) ) ( not ( = ?auto_621539 ?auto_621548 ) ) ( not ( = ?auto_621540 ?auto_621541 ) ) ( not ( = ?auto_621540 ?auto_621542 ) ) ( not ( = ?auto_621540 ?auto_621543 ) ) ( not ( = ?auto_621540 ?auto_621544 ) ) ( not ( = ?auto_621540 ?auto_621545 ) ) ( not ( = ?auto_621540 ?auto_621546 ) ) ( not ( = ?auto_621540 ?auto_621547 ) ) ( not ( = ?auto_621540 ?auto_621548 ) ) ( not ( = ?auto_621541 ?auto_621542 ) ) ( not ( = ?auto_621541 ?auto_621543 ) ) ( not ( = ?auto_621541 ?auto_621544 ) ) ( not ( = ?auto_621541 ?auto_621545 ) ) ( not ( = ?auto_621541 ?auto_621546 ) ) ( not ( = ?auto_621541 ?auto_621547 ) ) ( not ( = ?auto_621541 ?auto_621548 ) ) ( not ( = ?auto_621542 ?auto_621543 ) ) ( not ( = ?auto_621542 ?auto_621544 ) ) ( not ( = ?auto_621542 ?auto_621545 ) ) ( not ( = ?auto_621542 ?auto_621546 ) ) ( not ( = ?auto_621542 ?auto_621547 ) ) ( not ( = ?auto_621542 ?auto_621548 ) ) ( not ( = ?auto_621543 ?auto_621544 ) ) ( not ( = ?auto_621543 ?auto_621545 ) ) ( not ( = ?auto_621543 ?auto_621546 ) ) ( not ( = ?auto_621543 ?auto_621547 ) ) ( not ( = ?auto_621543 ?auto_621548 ) ) ( not ( = ?auto_621544 ?auto_621545 ) ) ( not ( = ?auto_621544 ?auto_621546 ) ) ( not ( = ?auto_621544 ?auto_621547 ) ) ( not ( = ?auto_621544 ?auto_621548 ) ) ( not ( = ?auto_621545 ?auto_621546 ) ) ( not ( = ?auto_621545 ?auto_621547 ) ) ( not ( = ?auto_621545 ?auto_621548 ) ) ( not ( = ?auto_621546 ?auto_621547 ) ) ( not ( = ?auto_621546 ?auto_621548 ) ) ( not ( = ?auto_621547 ?auto_621548 ) ) ( CLEAR ?auto_621545 ) ( ON ?auto_621546 ?auto_621547 ) ( CLEAR ?auto_621546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_621538 ?auto_621539 ?auto_621540 ?auto_621541 ?auto_621542 ?auto_621543 ?auto_621544 ?auto_621545 ?auto_621546 )
      ( MAKE-10PILE ?auto_621538 ?auto_621539 ?auto_621540 ?auto_621541 ?auto_621542 ?auto_621543 ?auto_621544 ?auto_621545 ?auto_621546 ?auto_621547 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621580 - BLOCK
      ?auto_621581 - BLOCK
      ?auto_621582 - BLOCK
      ?auto_621583 - BLOCK
      ?auto_621584 - BLOCK
      ?auto_621585 - BLOCK
      ?auto_621586 - BLOCK
      ?auto_621587 - BLOCK
      ?auto_621588 - BLOCK
      ?auto_621589 - BLOCK
    )
    :vars
    (
      ?auto_621590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621589 ?auto_621590 ) ( ON-TABLE ?auto_621580 ) ( ON ?auto_621581 ?auto_621580 ) ( ON ?auto_621582 ?auto_621581 ) ( ON ?auto_621583 ?auto_621582 ) ( ON ?auto_621584 ?auto_621583 ) ( ON ?auto_621585 ?auto_621584 ) ( ON ?auto_621586 ?auto_621585 ) ( not ( = ?auto_621580 ?auto_621581 ) ) ( not ( = ?auto_621580 ?auto_621582 ) ) ( not ( = ?auto_621580 ?auto_621583 ) ) ( not ( = ?auto_621580 ?auto_621584 ) ) ( not ( = ?auto_621580 ?auto_621585 ) ) ( not ( = ?auto_621580 ?auto_621586 ) ) ( not ( = ?auto_621580 ?auto_621587 ) ) ( not ( = ?auto_621580 ?auto_621588 ) ) ( not ( = ?auto_621580 ?auto_621589 ) ) ( not ( = ?auto_621580 ?auto_621590 ) ) ( not ( = ?auto_621581 ?auto_621582 ) ) ( not ( = ?auto_621581 ?auto_621583 ) ) ( not ( = ?auto_621581 ?auto_621584 ) ) ( not ( = ?auto_621581 ?auto_621585 ) ) ( not ( = ?auto_621581 ?auto_621586 ) ) ( not ( = ?auto_621581 ?auto_621587 ) ) ( not ( = ?auto_621581 ?auto_621588 ) ) ( not ( = ?auto_621581 ?auto_621589 ) ) ( not ( = ?auto_621581 ?auto_621590 ) ) ( not ( = ?auto_621582 ?auto_621583 ) ) ( not ( = ?auto_621582 ?auto_621584 ) ) ( not ( = ?auto_621582 ?auto_621585 ) ) ( not ( = ?auto_621582 ?auto_621586 ) ) ( not ( = ?auto_621582 ?auto_621587 ) ) ( not ( = ?auto_621582 ?auto_621588 ) ) ( not ( = ?auto_621582 ?auto_621589 ) ) ( not ( = ?auto_621582 ?auto_621590 ) ) ( not ( = ?auto_621583 ?auto_621584 ) ) ( not ( = ?auto_621583 ?auto_621585 ) ) ( not ( = ?auto_621583 ?auto_621586 ) ) ( not ( = ?auto_621583 ?auto_621587 ) ) ( not ( = ?auto_621583 ?auto_621588 ) ) ( not ( = ?auto_621583 ?auto_621589 ) ) ( not ( = ?auto_621583 ?auto_621590 ) ) ( not ( = ?auto_621584 ?auto_621585 ) ) ( not ( = ?auto_621584 ?auto_621586 ) ) ( not ( = ?auto_621584 ?auto_621587 ) ) ( not ( = ?auto_621584 ?auto_621588 ) ) ( not ( = ?auto_621584 ?auto_621589 ) ) ( not ( = ?auto_621584 ?auto_621590 ) ) ( not ( = ?auto_621585 ?auto_621586 ) ) ( not ( = ?auto_621585 ?auto_621587 ) ) ( not ( = ?auto_621585 ?auto_621588 ) ) ( not ( = ?auto_621585 ?auto_621589 ) ) ( not ( = ?auto_621585 ?auto_621590 ) ) ( not ( = ?auto_621586 ?auto_621587 ) ) ( not ( = ?auto_621586 ?auto_621588 ) ) ( not ( = ?auto_621586 ?auto_621589 ) ) ( not ( = ?auto_621586 ?auto_621590 ) ) ( not ( = ?auto_621587 ?auto_621588 ) ) ( not ( = ?auto_621587 ?auto_621589 ) ) ( not ( = ?auto_621587 ?auto_621590 ) ) ( not ( = ?auto_621588 ?auto_621589 ) ) ( not ( = ?auto_621588 ?auto_621590 ) ) ( not ( = ?auto_621589 ?auto_621590 ) ) ( ON ?auto_621588 ?auto_621589 ) ( CLEAR ?auto_621586 ) ( ON ?auto_621587 ?auto_621588 ) ( CLEAR ?auto_621587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_621580 ?auto_621581 ?auto_621582 ?auto_621583 ?auto_621584 ?auto_621585 ?auto_621586 ?auto_621587 )
      ( MAKE-10PILE ?auto_621580 ?auto_621581 ?auto_621582 ?auto_621583 ?auto_621584 ?auto_621585 ?auto_621586 ?auto_621587 ?auto_621588 ?auto_621589 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621622 - BLOCK
      ?auto_621623 - BLOCK
      ?auto_621624 - BLOCK
      ?auto_621625 - BLOCK
      ?auto_621626 - BLOCK
      ?auto_621627 - BLOCK
      ?auto_621628 - BLOCK
      ?auto_621629 - BLOCK
      ?auto_621630 - BLOCK
      ?auto_621631 - BLOCK
    )
    :vars
    (
      ?auto_621632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621631 ?auto_621632 ) ( ON-TABLE ?auto_621622 ) ( ON ?auto_621623 ?auto_621622 ) ( ON ?auto_621624 ?auto_621623 ) ( ON ?auto_621625 ?auto_621624 ) ( ON ?auto_621626 ?auto_621625 ) ( ON ?auto_621627 ?auto_621626 ) ( not ( = ?auto_621622 ?auto_621623 ) ) ( not ( = ?auto_621622 ?auto_621624 ) ) ( not ( = ?auto_621622 ?auto_621625 ) ) ( not ( = ?auto_621622 ?auto_621626 ) ) ( not ( = ?auto_621622 ?auto_621627 ) ) ( not ( = ?auto_621622 ?auto_621628 ) ) ( not ( = ?auto_621622 ?auto_621629 ) ) ( not ( = ?auto_621622 ?auto_621630 ) ) ( not ( = ?auto_621622 ?auto_621631 ) ) ( not ( = ?auto_621622 ?auto_621632 ) ) ( not ( = ?auto_621623 ?auto_621624 ) ) ( not ( = ?auto_621623 ?auto_621625 ) ) ( not ( = ?auto_621623 ?auto_621626 ) ) ( not ( = ?auto_621623 ?auto_621627 ) ) ( not ( = ?auto_621623 ?auto_621628 ) ) ( not ( = ?auto_621623 ?auto_621629 ) ) ( not ( = ?auto_621623 ?auto_621630 ) ) ( not ( = ?auto_621623 ?auto_621631 ) ) ( not ( = ?auto_621623 ?auto_621632 ) ) ( not ( = ?auto_621624 ?auto_621625 ) ) ( not ( = ?auto_621624 ?auto_621626 ) ) ( not ( = ?auto_621624 ?auto_621627 ) ) ( not ( = ?auto_621624 ?auto_621628 ) ) ( not ( = ?auto_621624 ?auto_621629 ) ) ( not ( = ?auto_621624 ?auto_621630 ) ) ( not ( = ?auto_621624 ?auto_621631 ) ) ( not ( = ?auto_621624 ?auto_621632 ) ) ( not ( = ?auto_621625 ?auto_621626 ) ) ( not ( = ?auto_621625 ?auto_621627 ) ) ( not ( = ?auto_621625 ?auto_621628 ) ) ( not ( = ?auto_621625 ?auto_621629 ) ) ( not ( = ?auto_621625 ?auto_621630 ) ) ( not ( = ?auto_621625 ?auto_621631 ) ) ( not ( = ?auto_621625 ?auto_621632 ) ) ( not ( = ?auto_621626 ?auto_621627 ) ) ( not ( = ?auto_621626 ?auto_621628 ) ) ( not ( = ?auto_621626 ?auto_621629 ) ) ( not ( = ?auto_621626 ?auto_621630 ) ) ( not ( = ?auto_621626 ?auto_621631 ) ) ( not ( = ?auto_621626 ?auto_621632 ) ) ( not ( = ?auto_621627 ?auto_621628 ) ) ( not ( = ?auto_621627 ?auto_621629 ) ) ( not ( = ?auto_621627 ?auto_621630 ) ) ( not ( = ?auto_621627 ?auto_621631 ) ) ( not ( = ?auto_621627 ?auto_621632 ) ) ( not ( = ?auto_621628 ?auto_621629 ) ) ( not ( = ?auto_621628 ?auto_621630 ) ) ( not ( = ?auto_621628 ?auto_621631 ) ) ( not ( = ?auto_621628 ?auto_621632 ) ) ( not ( = ?auto_621629 ?auto_621630 ) ) ( not ( = ?auto_621629 ?auto_621631 ) ) ( not ( = ?auto_621629 ?auto_621632 ) ) ( not ( = ?auto_621630 ?auto_621631 ) ) ( not ( = ?auto_621630 ?auto_621632 ) ) ( not ( = ?auto_621631 ?auto_621632 ) ) ( ON ?auto_621630 ?auto_621631 ) ( ON ?auto_621629 ?auto_621630 ) ( CLEAR ?auto_621627 ) ( ON ?auto_621628 ?auto_621629 ) ( CLEAR ?auto_621628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_621622 ?auto_621623 ?auto_621624 ?auto_621625 ?auto_621626 ?auto_621627 ?auto_621628 )
      ( MAKE-10PILE ?auto_621622 ?auto_621623 ?auto_621624 ?auto_621625 ?auto_621626 ?auto_621627 ?auto_621628 ?auto_621629 ?auto_621630 ?auto_621631 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621664 - BLOCK
      ?auto_621665 - BLOCK
      ?auto_621666 - BLOCK
      ?auto_621667 - BLOCK
      ?auto_621668 - BLOCK
      ?auto_621669 - BLOCK
      ?auto_621670 - BLOCK
      ?auto_621671 - BLOCK
      ?auto_621672 - BLOCK
      ?auto_621673 - BLOCK
    )
    :vars
    (
      ?auto_621674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621673 ?auto_621674 ) ( ON-TABLE ?auto_621664 ) ( ON ?auto_621665 ?auto_621664 ) ( ON ?auto_621666 ?auto_621665 ) ( ON ?auto_621667 ?auto_621666 ) ( ON ?auto_621668 ?auto_621667 ) ( not ( = ?auto_621664 ?auto_621665 ) ) ( not ( = ?auto_621664 ?auto_621666 ) ) ( not ( = ?auto_621664 ?auto_621667 ) ) ( not ( = ?auto_621664 ?auto_621668 ) ) ( not ( = ?auto_621664 ?auto_621669 ) ) ( not ( = ?auto_621664 ?auto_621670 ) ) ( not ( = ?auto_621664 ?auto_621671 ) ) ( not ( = ?auto_621664 ?auto_621672 ) ) ( not ( = ?auto_621664 ?auto_621673 ) ) ( not ( = ?auto_621664 ?auto_621674 ) ) ( not ( = ?auto_621665 ?auto_621666 ) ) ( not ( = ?auto_621665 ?auto_621667 ) ) ( not ( = ?auto_621665 ?auto_621668 ) ) ( not ( = ?auto_621665 ?auto_621669 ) ) ( not ( = ?auto_621665 ?auto_621670 ) ) ( not ( = ?auto_621665 ?auto_621671 ) ) ( not ( = ?auto_621665 ?auto_621672 ) ) ( not ( = ?auto_621665 ?auto_621673 ) ) ( not ( = ?auto_621665 ?auto_621674 ) ) ( not ( = ?auto_621666 ?auto_621667 ) ) ( not ( = ?auto_621666 ?auto_621668 ) ) ( not ( = ?auto_621666 ?auto_621669 ) ) ( not ( = ?auto_621666 ?auto_621670 ) ) ( not ( = ?auto_621666 ?auto_621671 ) ) ( not ( = ?auto_621666 ?auto_621672 ) ) ( not ( = ?auto_621666 ?auto_621673 ) ) ( not ( = ?auto_621666 ?auto_621674 ) ) ( not ( = ?auto_621667 ?auto_621668 ) ) ( not ( = ?auto_621667 ?auto_621669 ) ) ( not ( = ?auto_621667 ?auto_621670 ) ) ( not ( = ?auto_621667 ?auto_621671 ) ) ( not ( = ?auto_621667 ?auto_621672 ) ) ( not ( = ?auto_621667 ?auto_621673 ) ) ( not ( = ?auto_621667 ?auto_621674 ) ) ( not ( = ?auto_621668 ?auto_621669 ) ) ( not ( = ?auto_621668 ?auto_621670 ) ) ( not ( = ?auto_621668 ?auto_621671 ) ) ( not ( = ?auto_621668 ?auto_621672 ) ) ( not ( = ?auto_621668 ?auto_621673 ) ) ( not ( = ?auto_621668 ?auto_621674 ) ) ( not ( = ?auto_621669 ?auto_621670 ) ) ( not ( = ?auto_621669 ?auto_621671 ) ) ( not ( = ?auto_621669 ?auto_621672 ) ) ( not ( = ?auto_621669 ?auto_621673 ) ) ( not ( = ?auto_621669 ?auto_621674 ) ) ( not ( = ?auto_621670 ?auto_621671 ) ) ( not ( = ?auto_621670 ?auto_621672 ) ) ( not ( = ?auto_621670 ?auto_621673 ) ) ( not ( = ?auto_621670 ?auto_621674 ) ) ( not ( = ?auto_621671 ?auto_621672 ) ) ( not ( = ?auto_621671 ?auto_621673 ) ) ( not ( = ?auto_621671 ?auto_621674 ) ) ( not ( = ?auto_621672 ?auto_621673 ) ) ( not ( = ?auto_621672 ?auto_621674 ) ) ( not ( = ?auto_621673 ?auto_621674 ) ) ( ON ?auto_621672 ?auto_621673 ) ( ON ?auto_621671 ?auto_621672 ) ( ON ?auto_621670 ?auto_621671 ) ( CLEAR ?auto_621668 ) ( ON ?auto_621669 ?auto_621670 ) ( CLEAR ?auto_621669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_621664 ?auto_621665 ?auto_621666 ?auto_621667 ?auto_621668 ?auto_621669 )
      ( MAKE-10PILE ?auto_621664 ?auto_621665 ?auto_621666 ?auto_621667 ?auto_621668 ?auto_621669 ?auto_621670 ?auto_621671 ?auto_621672 ?auto_621673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621706 - BLOCK
      ?auto_621707 - BLOCK
      ?auto_621708 - BLOCK
      ?auto_621709 - BLOCK
      ?auto_621710 - BLOCK
      ?auto_621711 - BLOCK
      ?auto_621712 - BLOCK
      ?auto_621713 - BLOCK
      ?auto_621714 - BLOCK
      ?auto_621715 - BLOCK
    )
    :vars
    (
      ?auto_621716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621715 ?auto_621716 ) ( ON-TABLE ?auto_621706 ) ( ON ?auto_621707 ?auto_621706 ) ( ON ?auto_621708 ?auto_621707 ) ( ON ?auto_621709 ?auto_621708 ) ( not ( = ?auto_621706 ?auto_621707 ) ) ( not ( = ?auto_621706 ?auto_621708 ) ) ( not ( = ?auto_621706 ?auto_621709 ) ) ( not ( = ?auto_621706 ?auto_621710 ) ) ( not ( = ?auto_621706 ?auto_621711 ) ) ( not ( = ?auto_621706 ?auto_621712 ) ) ( not ( = ?auto_621706 ?auto_621713 ) ) ( not ( = ?auto_621706 ?auto_621714 ) ) ( not ( = ?auto_621706 ?auto_621715 ) ) ( not ( = ?auto_621706 ?auto_621716 ) ) ( not ( = ?auto_621707 ?auto_621708 ) ) ( not ( = ?auto_621707 ?auto_621709 ) ) ( not ( = ?auto_621707 ?auto_621710 ) ) ( not ( = ?auto_621707 ?auto_621711 ) ) ( not ( = ?auto_621707 ?auto_621712 ) ) ( not ( = ?auto_621707 ?auto_621713 ) ) ( not ( = ?auto_621707 ?auto_621714 ) ) ( not ( = ?auto_621707 ?auto_621715 ) ) ( not ( = ?auto_621707 ?auto_621716 ) ) ( not ( = ?auto_621708 ?auto_621709 ) ) ( not ( = ?auto_621708 ?auto_621710 ) ) ( not ( = ?auto_621708 ?auto_621711 ) ) ( not ( = ?auto_621708 ?auto_621712 ) ) ( not ( = ?auto_621708 ?auto_621713 ) ) ( not ( = ?auto_621708 ?auto_621714 ) ) ( not ( = ?auto_621708 ?auto_621715 ) ) ( not ( = ?auto_621708 ?auto_621716 ) ) ( not ( = ?auto_621709 ?auto_621710 ) ) ( not ( = ?auto_621709 ?auto_621711 ) ) ( not ( = ?auto_621709 ?auto_621712 ) ) ( not ( = ?auto_621709 ?auto_621713 ) ) ( not ( = ?auto_621709 ?auto_621714 ) ) ( not ( = ?auto_621709 ?auto_621715 ) ) ( not ( = ?auto_621709 ?auto_621716 ) ) ( not ( = ?auto_621710 ?auto_621711 ) ) ( not ( = ?auto_621710 ?auto_621712 ) ) ( not ( = ?auto_621710 ?auto_621713 ) ) ( not ( = ?auto_621710 ?auto_621714 ) ) ( not ( = ?auto_621710 ?auto_621715 ) ) ( not ( = ?auto_621710 ?auto_621716 ) ) ( not ( = ?auto_621711 ?auto_621712 ) ) ( not ( = ?auto_621711 ?auto_621713 ) ) ( not ( = ?auto_621711 ?auto_621714 ) ) ( not ( = ?auto_621711 ?auto_621715 ) ) ( not ( = ?auto_621711 ?auto_621716 ) ) ( not ( = ?auto_621712 ?auto_621713 ) ) ( not ( = ?auto_621712 ?auto_621714 ) ) ( not ( = ?auto_621712 ?auto_621715 ) ) ( not ( = ?auto_621712 ?auto_621716 ) ) ( not ( = ?auto_621713 ?auto_621714 ) ) ( not ( = ?auto_621713 ?auto_621715 ) ) ( not ( = ?auto_621713 ?auto_621716 ) ) ( not ( = ?auto_621714 ?auto_621715 ) ) ( not ( = ?auto_621714 ?auto_621716 ) ) ( not ( = ?auto_621715 ?auto_621716 ) ) ( ON ?auto_621714 ?auto_621715 ) ( ON ?auto_621713 ?auto_621714 ) ( ON ?auto_621712 ?auto_621713 ) ( ON ?auto_621711 ?auto_621712 ) ( CLEAR ?auto_621709 ) ( ON ?auto_621710 ?auto_621711 ) ( CLEAR ?auto_621710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_621706 ?auto_621707 ?auto_621708 ?auto_621709 ?auto_621710 )
      ( MAKE-10PILE ?auto_621706 ?auto_621707 ?auto_621708 ?auto_621709 ?auto_621710 ?auto_621711 ?auto_621712 ?auto_621713 ?auto_621714 ?auto_621715 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621748 - BLOCK
      ?auto_621749 - BLOCK
      ?auto_621750 - BLOCK
      ?auto_621751 - BLOCK
      ?auto_621752 - BLOCK
      ?auto_621753 - BLOCK
      ?auto_621754 - BLOCK
      ?auto_621755 - BLOCK
      ?auto_621756 - BLOCK
      ?auto_621757 - BLOCK
    )
    :vars
    (
      ?auto_621758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621757 ?auto_621758 ) ( ON-TABLE ?auto_621748 ) ( ON ?auto_621749 ?auto_621748 ) ( ON ?auto_621750 ?auto_621749 ) ( not ( = ?auto_621748 ?auto_621749 ) ) ( not ( = ?auto_621748 ?auto_621750 ) ) ( not ( = ?auto_621748 ?auto_621751 ) ) ( not ( = ?auto_621748 ?auto_621752 ) ) ( not ( = ?auto_621748 ?auto_621753 ) ) ( not ( = ?auto_621748 ?auto_621754 ) ) ( not ( = ?auto_621748 ?auto_621755 ) ) ( not ( = ?auto_621748 ?auto_621756 ) ) ( not ( = ?auto_621748 ?auto_621757 ) ) ( not ( = ?auto_621748 ?auto_621758 ) ) ( not ( = ?auto_621749 ?auto_621750 ) ) ( not ( = ?auto_621749 ?auto_621751 ) ) ( not ( = ?auto_621749 ?auto_621752 ) ) ( not ( = ?auto_621749 ?auto_621753 ) ) ( not ( = ?auto_621749 ?auto_621754 ) ) ( not ( = ?auto_621749 ?auto_621755 ) ) ( not ( = ?auto_621749 ?auto_621756 ) ) ( not ( = ?auto_621749 ?auto_621757 ) ) ( not ( = ?auto_621749 ?auto_621758 ) ) ( not ( = ?auto_621750 ?auto_621751 ) ) ( not ( = ?auto_621750 ?auto_621752 ) ) ( not ( = ?auto_621750 ?auto_621753 ) ) ( not ( = ?auto_621750 ?auto_621754 ) ) ( not ( = ?auto_621750 ?auto_621755 ) ) ( not ( = ?auto_621750 ?auto_621756 ) ) ( not ( = ?auto_621750 ?auto_621757 ) ) ( not ( = ?auto_621750 ?auto_621758 ) ) ( not ( = ?auto_621751 ?auto_621752 ) ) ( not ( = ?auto_621751 ?auto_621753 ) ) ( not ( = ?auto_621751 ?auto_621754 ) ) ( not ( = ?auto_621751 ?auto_621755 ) ) ( not ( = ?auto_621751 ?auto_621756 ) ) ( not ( = ?auto_621751 ?auto_621757 ) ) ( not ( = ?auto_621751 ?auto_621758 ) ) ( not ( = ?auto_621752 ?auto_621753 ) ) ( not ( = ?auto_621752 ?auto_621754 ) ) ( not ( = ?auto_621752 ?auto_621755 ) ) ( not ( = ?auto_621752 ?auto_621756 ) ) ( not ( = ?auto_621752 ?auto_621757 ) ) ( not ( = ?auto_621752 ?auto_621758 ) ) ( not ( = ?auto_621753 ?auto_621754 ) ) ( not ( = ?auto_621753 ?auto_621755 ) ) ( not ( = ?auto_621753 ?auto_621756 ) ) ( not ( = ?auto_621753 ?auto_621757 ) ) ( not ( = ?auto_621753 ?auto_621758 ) ) ( not ( = ?auto_621754 ?auto_621755 ) ) ( not ( = ?auto_621754 ?auto_621756 ) ) ( not ( = ?auto_621754 ?auto_621757 ) ) ( not ( = ?auto_621754 ?auto_621758 ) ) ( not ( = ?auto_621755 ?auto_621756 ) ) ( not ( = ?auto_621755 ?auto_621757 ) ) ( not ( = ?auto_621755 ?auto_621758 ) ) ( not ( = ?auto_621756 ?auto_621757 ) ) ( not ( = ?auto_621756 ?auto_621758 ) ) ( not ( = ?auto_621757 ?auto_621758 ) ) ( ON ?auto_621756 ?auto_621757 ) ( ON ?auto_621755 ?auto_621756 ) ( ON ?auto_621754 ?auto_621755 ) ( ON ?auto_621753 ?auto_621754 ) ( ON ?auto_621752 ?auto_621753 ) ( CLEAR ?auto_621750 ) ( ON ?auto_621751 ?auto_621752 ) ( CLEAR ?auto_621751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_621748 ?auto_621749 ?auto_621750 ?auto_621751 )
      ( MAKE-10PILE ?auto_621748 ?auto_621749 ?auto_621750 ?auto_621751 ?auto_621752 ?auto_621753 ?auto_621754 ?auto_621755 ?auto_621756 ?auto_621757 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621790 - BLOCK
      ?auto_621791 - BLOCK
      ?auto_621792 - BLOCK
      ?auto_621793 - BLOCK
      ?auto_621794 - BLOCK
      ?auto_621795 - BLOCK
      ?auto_621796 - BLOCK
      ?auto_621797 - BLOCK
      ?auto_621798 - BLOCK
      ?auto_621799 - BLOCK
    )
    :vars
    (
      ?auto_621800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621799 ?auto_621800 ) ( ON-TABLE ?auto_621790 ) ( ON ?auto_621791 ?auto_621790 ) ( not ( = ?auto_621790 ?auto_621791 ) ) ( not ( = ?auto_621790 ?auto_621792 ) ) ( not ( = ?auto_621790 ?auto_621793 ) ) ( not ( = ?auto_621790 ?auto_621794 ) ) ( not ( = ?auto_621790 ?auto_621795 ) ) ( not ( = ?auto_621790 ?auto_621796 ) ) ( not ( = ?auto_621790 ?auto_621797 ) ) ( not ( = ?auto_621790 ?auto_621798 ) ) ( not ( = ?auto_621790 ?auto_621799 ) ) ( not ( = ?auto_621790 ?auto_621800 ) ) ( not ( = ?auto_621791 ?auto_621792 ) ) ( not ( = ?auto_621791 ?auto_621793 ) ) ( not ( = ?auto_621791 ?auto_621794 ) ) ( not ( = ?auto_621791 ?auto_621795 ) ) ( not ( = ?auto_621791 ?auto_621796 ) ) ( not ( = ?auto_621791 ?auto_621797 ) ) ( not ( = ?auto_621791 ?auto_621798 ) ) ( not ( = ?auto_621791 ?auto_621799 ) ) ( not ( = ?auto_621791 ?auto_621800 ) ) ( not ( = ?auto_621792 ?auto_621793 ) ) ( not ( = ?auto_621792 ?auto_621794 ) ) ( not ( = ?auto_621792 ?auto_621795 ) ) ( not ( = ?auto_621792 ?auto_621796 ) ) ( not ( = ?auto_621792 ?auto_621797 ) ) ( not ( = ?auto_621792 ?auto_621798 ) ) ( not ( = ?auto_621792 ?auto_621799 ) ) ( not ( = ?auto_621792 ?auto_621800 ) ) ( not ( = ?auto_621793 ?auto_621794 ) ) ( not ( = ?auto_621793 ?auto_621795 ) ) ( not ( = ?auto_621793 ?auto_621796 ) ) ( not ( = ?auto_621793 ?auto_621797 ) ) ( not ( = ?auto_621793 ?auto_621798 ) ) ( not ( = ?auto_621793 ?auto_621799 ) ) ( not ( = ?auto_621793 ?auto_621800 ) ) ( not ( = ?auto_621794 ?auto_621795 ) ) ( not ( = ?auto_621794 ?auto_621796 ) ) ( not ( = ?auto_621794 ?auto_621797 ) ) ( not ( = ?auto_621794 ?auto_621798 ) ) ( not ( = ?auto_621794 ?auto_621799 ) ) ( not ( = ?auto_621794 ?auto_621800 ) ) ( not ( = ?auto_621795 ?auto_621796 ) ) ( not ( = ?auto_621795 ?auto_621797 ) ) ( not ( = ?auto_621795 ?auto_621798 ) ) ( not ( = ?auto_621795 ?auto_621799 ) ) ( not ( = ?auto_621795 ?auto_621800 ) ) ( not ( = ?auto_621796 ?auto_621797 ) ) ( not ( = ?auto_621796 ?auto_621798 ) ) ( not ( = ?auto_621796 ?auto_621799 ) ) ( not ( = ?auto_621796 ?auto_621800 ) ) ( not ( = ?auto_621797 ?auto_621798 ) ) ( not ( = ?auto_621797 ?auto_621799 ) ) ( not ( = ?auto_621797 ?auto_621800 ) ) ( not ( = ?auto_621798 ?auto_621799 ) ) ( not ( = ?auto_621798 ?auto_621800 ) ) ( not ( = ?auto_621799 ?auto_621800 ) ) ( ON ?auto_621798 ?auto_621799 ) ( ON ?auto_621797 ?auto_621798 ) ( ON ?auto_621796 ?auto_621797 ) ( ON ?auto_621795 ?auto_621796 ) ( ON ?auto_621794 ?auto_621795 ) ( ON ?auto_621793 ?auto_621794 ) ( CLEAR ?auto_621791 ) ( ON ?auto_621792 ?auto_621793 ) ( CLEAR ?auto_621792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_621790 ?auto_621791 ?auto_621792 )
      ( MAKE-10PILE ?auto_621790 ?auto_621791 ?auto_621792 ?auto_621793 ?auto_621794 ?auto_621795 ?auto_621796 ?auto_621797 ?auto_621798 ?auto_621799 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621832 - BLOCK
      ?auto_621833 - BLOCK
      ?auto_621834 - BLOCK
      ?auto_621835 - BLOCK
      ?auto_621836 - BLOCK
      ?auto_621837 - BLOCK
      ?auto_621838 - BLOCK
      ?auto_621839 - BLOCK
      ?auto_621840 - BLOCK
      ?auto_621841 - BLOCK
    )
    :vars
    (
      ?auto_621842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621841 ?auto_621842 ) ( ON-TABLE ?auto_621832 ) ( not ( = ?auto_621832 ?auto_621833 ) ) ( not ( = ?auto_621832 ?auto_621834 ) ) ( not ( = ?auto_621832 ?auto_621835 ) ) ( not ( = ?auto_621832 ?auto_621836 ) ) ( not ( = ?auto_621832 ?auto_621837 ) ) ( not ( = ?auto_621832 ?auto_621838 ) ) ( not ( = ?auto_621832 ?auto_621839 ) ) ( not ( = ?auto_621832 ?auto_621840 ) ) ( not ( = ?auto_621832 ?auto_621841 ) ) ( not ( = ?auto_621832 ?auto_621842 ) ) ( not ( = ?auto_621833 ?auto_621834 ) ) ( not ( = ?auto_621833 ?auto_621835 ) ) ( not ( = ?auto_621833 ?auto_621836 ) ) ( not ( = ?auto_621833 ?auto_621837 ) ) ( not ( = ?auto_621833 ?auto_621838 ) ) ( not ( = ?auto_621833 ?auto_621839 ) ) ( not ( = ?auto_621833 ?auto_621840 ) ) ( not ( = ?auto_621833 ?auto_621841 ) ) ( not ( = ?auto_621833 ?auto_621842 ) ) ( not ( = ?auto_621834 ?auto_621835 ) ) ( not ( = ?auto_621834 ?auto_621836 ) ) ( not ( = ?auto_621834 ?auto_621837 ) ) ( not ( = ?auto_621834 ?auto_621838 ) ) ( not ( = ?auto_621834 ?auto_621839 ) ) ( not ( = ?auto_621834 ?auto_621840 ) ) ( not ( = ?auto_621834 ?auto_621841 ) ) ( not ( = ?auto_621834 ?auto_621842 ) ) ( not ( = ?auto_621835 ?auto_621836 ) ) ( not ( = ?auto_621835 ?auto_621837 ) ) ( not ( = ?auto_621835 ?auto_621838 ) ) ( not ( = ?auto_621835 ?auto_621839 ) ) ( not ( = ?auto_621835 ?auto_621840 ) ) ( not ( = ?auto_621835 ?auto_621841 ) ) ( not ( = ?auto_621835 ?auto_621842 ) ) ( not ( = ?auto_621836 ?auto_621837 ) ) ( not ( = ?auto_621836 ?auto_621838 ) ) ( not ( = ?auto_621836 ?auto_621839 ) ) ( not ( = ?auto_621836 ?auto_621840 ) ) ( not ( = ?auto_621836 ?auto_621841 ) ) ( not ( = ?auto_621836 ?auto_621842 ) ) ( not ( = ?auto_621837 ?auto_621838 ) ) ( not ( = ?auto_621837 ?auto_621839 ) ) ( not ( = ?auto_621837 ?auto_621840 ) ) ( not ( = ?auto_621837 ?auto_621841 ) ) ( not ( = ?auto_621837 ?auto_621842 ) ) ( not ( = ?auto_621838 ?auto_621839 ) ) ( not ( = ?auto_621838 ?auto_621840 ) ) ( not ( = ?auto_621838 ?auto_621841 ) ) ( not ( = ?auto_621838 ?auto_621842 ) ) ( not ( = ?auto_621839 ?auto_621840 ) ) ( not ( = ?auto_621839 ?auto_621841 ) ) ( not ( = ?auto_621839 ?auto_621842 ) ) ( not ( = ?auto_621840 ?auto_621841 ) ) ( not ( = ?auto_621840 ?auto_621842 ) ) ( not ( = ?auto_621841 ?auto_621842 ) ) ( ON ?auto_621840 ?auto_621841 ) ( ON ?auto_621839 ?auto_621840 ) ( ON ?auto_621838 ?auto_621839 ) ( ON ?auto_621837 ?auto_621838 ) ( ON ?auto_621836 ?auto_621837 ) ( ON ?auto_621835 ?auto_621836 ) ( ON ?auto_621834 ?auto_621835 ) ( CLEAR ?auto_621832 ) ( ON ?auto_621833 ?auto_621834 ) ( CLEAR ?auto_621833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_621832 ?auto_621833 )
      ( MAKE-10PILE ?auto_621832 ?auto_621833 ?auto_621834 ?auto_621835 ?auto_621836 ?auto_621837 ?auto_621838 ?auto_621839 ?auto_621840 ?auto_621841 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_621874 - BLOCK
      ?auto_621875 - BLOCK
      ?auto_621876 - BLOCK
      ?auto_621877 - BLOCK
      ?auto_621878 - BLOCK
      ?auto_621879 - BLOCK
      ?auto_621880 - BLOCK
      ?auto_621881 - BLOCK
      ?auto_621882 - BLOCK
      ?auto_621883 - BLOCK
    )
    :vars
    (
      ?auto_621884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621883 ?auto_621884 ) ( not ( = ?auto_621874 ?auto_621875 ) ) ( not ( = ?auto_621874 ?auto_621876 ) ) ( not ( = ?auto_621874 ?auto_621877 ) ) ( not ( = ?auto_621874 ?auto_621878 ) ) ( not ( = ?auto_621874 ?auto_621879 ) ) ( not ( = ?auto_621874 ?auto_621880 ) ) ( not ( = ?auto_621874 ?auto_621881 ) ) ( not ( = ?auto_621874 ?auto_621882 ) ) ( not ( = ?auto_621874 ?auto_621883 ) ) ( not ( = ?auto_621874 ?auto_621884 ) ) ( not ( = ?auto_621875 ?auto_621876 ) ) ( not ( = ?auto_621875 ?auto_621877 ) ) ( not ( = ?auto_621875 ?auto_621878 ) ) ( not ( = ?auto_621875 ?auto_621879 ) ) ( not ( = ?auto_621875 ?auto_621880 ) ) ( not ( = ?auto_621875 ?auto_621881 ) ) ( not ( = ?auto_621875 ?auto_621882 ) ) ( not ( = ?auto_621875 ?auto_621883 ) ) ( not ( = ?auto_621875 ?auto_621884 ) ) ( not ( = ?auto_621876 ?auto_621877 ) ) ( not ( = ?auto_621876 ?auto_621878 ) ) ( not ( = ?auto_621876 ?auto_621879 ) ) ( not ( = ?auto_621876 ?auto_621880 ) ) ( not ( = ?auto_621876 ?auto_621881 ) ) ( not ( = ?auto_621876 ?auto_621882 ) ) ( not ( = ?auto_621876 ?auto_621883 ) ) ( not ( = ?auto_621876 ?auto_621884 ) ) ( not ( = ?auto_621877 ?auto_621878 ) ) ( not ( = ?auto_621877 ?auto_621879 ) ) ( not ( = ?auto_621877 ?auto_621880 ) ) ( not ( = ?auto_621877 ?auto_621881 ) ) ( not ( = ?auto_621877 ?auto_621882 ) ) ( not ( = ?auto_621877 ?auto_621883 ) ) ( not ( = ?auto_621877 ?auto_621884 ) ) ( not ( = ?auto_621878 ?auto_621879 ) ) ( not ( = ?auto_621878 ?auto_621880 ) ) ( not ( = ?auto_621878 ?auto_621881 ) ) ( not ( = ?auto_621878 ?auto_621882 ) ) ( not ( = ?auto_621878 ?auto_621883 ) ) ( not ( = ?auto_621878 ?auto_621884 ) ) ( not ( = ?auto_621879 ?auto_621880 ) ) ( not ( = ?auto_621879 ?auto_621881 ) ) ( not ( = ?auto_621879 ?auto_621882 ) ) ( not ( = ?auto_621879 ?auto_621883 ) ) ( not ( = ?auto_621879 ?auto_621884 ) ) ( not ( = ?auto_621880 ?auto_621881 ) ) ( not ( = ?auto_621880 ?auto_621882 ) ) ( not ( = ?auto_621880 ?auto_621883 ) ) ( not ( = ?auto_621880 ?auto_621884 ) ) ( not ( = ?auto_621881 ?auto_621882 ) ) ( not ( = ?auto_621881 ?auto_621883 ) ) ( not ( = ?auto_621881 ?auto_621884 ) ) ( not ( = ?auto_621882 ?auto_621883 ) ) ( not ( = ?auto_621882 ?auto_621884 ) ) ( not ( = ?auto_621883 ?auto_621884 ) ) ( ON ?auto_621882 ?auto_621883 ) ( ON ?auto_621881 ?auto_621882 ) ( ON ?auto_621880 ?auto_621881 ) ( ON ?auto_621879 ?auto_621880 ) ( ON ?auto_621878 ?auto_621879 ) ( ON ?auto_621877 ?auto_621878 ) ( ON ?auto_621876 ?auto_621877 ) ( ON ?auto_621875 ?auto_621876 ) ( ON ?auto_621874 ?auto_621875 ) ( CLEAR ?auto_621874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_621874 )
      ( MAKE-10PILE ?auto_621874 ?auto_621875 ?auto_621876 ?auto_621877 ?auto_621878 ?auto_621879 ?auto_621880 ?auto_621881 ?auto_621882 ?auto_621883 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_621917 - BLOCK
      ?auto_621918 - BLOCK
      ?auto_621919 - BLOCK
      ?auto_621920 - BLOCK
      ?auto_621921 - BLOCK
      ?auto_621922 - BLOCK
      ?auto_621923 - BLOCK
      ?auto_621924 - BLOCK
      ?auto_621925 - BLOCK
      ?auto_621926 - BLOCK
      ?auto_621927 - BLOCK
    )
    :vars
    (
      ?auto_621928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_621926 ) ( ON ?auto_621927 ?auto_621928 ) ( CLEAR ?auto_621927 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_621917 ) ( ON ?auto_621918 ?auto_621917 ) ( ON ?auto_621919 ?auto_621918 ) ( ON ?auto_621920 ?auto_621919 ) ( ON ?auto_621921 ?auto_621920 ) ( ON ?auto_621922 ?auto_621921 ) ( ON ?auto_621923 ?auto_621922 ) ( ON ?auto_621924 ?auto_621923 ) ( ON ?auto_621925 ?auto_621924 ) ( ON ?auto_621926 ?auto_621925 ) ( not ( = ?auto_621917 ?auto_621918 ) ) ( not ( = ?auto_621917 ?auto_621919 ) ) ( not ( = ?auto_621917 ?auto_621920 ) ) ( not ( = ?auto_621917 ?auto_621921 ) ) ( not ( = ?auto_621917 ?auto_621922 ) ) ( not ( = ?auto_621917 ?auto_621923 ) ) ( not ( = ?auto_621917 ?auto_621924 ) ) ( not ( = ?auto_621917 ?auto_621925 ) ) ( not ( = ?auto_621917 ?auto_621926 ) ) ( not ( = ?auto_621917 ?auto_621927 ) ) ( not ( = ?auto_621917 ?auto_621928 ) ) ( not ( = ?auto_621918 ?auto_621919 ) ) ( not ( = ?auto_621918 ?auto_621920 ) ) ( not ( = ?auto_621918 ?auto_621921 ) ) ( not ( = ?auto_621918 ?auto_621922 ) ) ( not ( = ?auto_621918 ?auto_621923 ) ) ( not ( = ?auto_621918 ?auto_621924 ) ) ( not ( = ?auto_621918 ?auto_621925 ) ) ( not ( = ?auto_621918 ?auto_621926 ) ) ( not ( = ?auto_621918 ?auto_621927 ) ) ( not ( = ?auto_621918 ?auto_621928 ) ) ( not ( = ?auto_621919 ?auto_621920 ) ) ( not ( = ?auto_621919 ?auto_621921 ) ) ( not ( = ?auto_621919 ?auto_621922 ) ) ( not ( = ?auto_621919 ?auto_621923 ) ) ( not ( = ?auto_621919 ?auto_621924 ) ) ( not ( = ?auto_621919 ?auto_621925 ) ) ( not ( = ?auto_621919 ?auto_621926 ) ) ( not ( = ?auto_621919 ?auto_621927 ) ) ( not ( = ?auto_621919 ?auto_621928 ) ) ( not ( = ?auto_621920 ?auto_621921 ) ) ( not ( = ?auto_621920 ?auto_621922 ) ) ( not ( = ?auto_621920 ?auto_621923 ) ) ( not ( = ?auto_621920 ?auto_621924 ) ) ( not ( = ?auto_621920 ?auto_621925 ) ) ( not ( = ?auto_621920 ?auto_621926 ) ) ( not ( = ?auto_621920 ?auto_621927 ) ) ( not ( = ?auto_621920 ?auto_621928 ) ) ( not ( = ?auto_621921 ?auto_621922 ) ) ( not ( = ?auto_621921 ?auto_621923 ) ) ( not ( = ?auto_621921 ?auto_621924 ) ) ( not ( = ?auto_621921 ?auto_621925 ) ) ( not ( = ?auto_621921 ?auto_621926 ) ) ( not ( = ?auto_621921 ?auto_621927 ) ) ( not ( = ?auto_621921 ?auto_621928 ) ) ( not ( = ?auto_621922 ?auto_621923 ) ) ( not ( = ?auto_621922 ?auto_621924 ) ) ( not ( = ?auto_621922 ?auto_621925 ) ) ( not ( = ?auto_621922 ?auto_621926 ) ) ( not ( = ?auto_621922 ?auto_621927 ) ) ( not ( = ?auto_621922 ?auto_621928 ) ) ( not ( = ?auto_621923 ?auto_621924 ) ) ( not ( = ?auto_621923 ?auto_621925 ) ) ( not ( = ?auto_621923 ?auto_621926 ) ) ( not ( = ?auto_621923 ?auto_621927 ) ) ( not ( = ?auto_621923 ?auto_621928 ) ) ( not ( = ?auto_621924 ?auto_621925 ) ) ( not ( = ?auto_621924 ?auto_621926 ) ) ( not ( = ?auto_621924 ?auto_621927 ) ) ( not ( = ?auto_621924 ?auto_621928 ) ) ( not ( = ?auto_621925 ?auto_621926 ) ) ( not ( = ?auto_621925 ?auto_621927 ) ) ( not ( = ?auto_621925 ?auto_621928 ) ) ( not ( = ?auto_621926 ?auto_621927 ) ) ( not ( = ?auto_621926 ?auto_621928 ) ) ( not ( = ?auto_621927 ?auto_621928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_621927 ?auto_621928 )
      ( !STACK ?auto_621927 ?auto_621926 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_621963 - BLOCK
      ?auto_621964 - BLOCK
      ?auto_621965 - BLOCK
      ?auto_621966 - BLOCK
      ?auto_621967 - BLOCK
      ?auto_621968 - BLOCK
      ?auto_621969 - BLOCK
      ?auto_621970 - BLOCK
      ?auto_621971 - BLOCK
      ?auto_621972 - BLOCK
      ?auto_621973 - BLOCK
    )
    :vars
    (
      ?auto_621974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_621973 ?auto_621974 ) ( ON-TABLE ?auto_621963 ) ( ON ?auto_621964 ?auto_621963 ) ( ON ?auto_621965 ?auto_621964 ) ( ON ?auto_621966 ?auto_621965 ) ( ON ?auto_621967 ?auto_621966 ) ( ON ?auto_621968 ?auto_621967 ) ( ON ?auto_621969 ?auto_621968 ) ( ON ?auto_621970 ?auto_621969 ) ( ON ?auto_621971 ?auto_621970 ) ( not ( = ?auto_621963 ?auto_621964 ) ) ( not ( = ?auto_621963 ?auto_621965 ) ) ( not ( = ?auto_621963 ?auto_621966 ) ) ( not ( = ?auto_621963 ?auto_621967 ) ) ( not ( = ?auto_621963 ?auto_621968 ) ) ( not ( = ?auto_621963 ?auto_621969 ) ) ( not ( = ?auto_621963 ?auto_621970 ) ) ( not ( = ?auto_621963 ?auto_621971 ) ) ( not ( = ?auto_621963 ?auto_621972 ) ) ( not ( = ?auto_621963 ?auto_621973 ) ) ( not ( = ?auto_621963 ?auto_621974 ) ) ( not ( = ?auto_621964 ?auto_621965 ) ) ( not ( = ?auto_621964 ?auto_621966 ) ) ( not ( = ?auto_621964 ?auto_621967 ) ) ( not ( = ?auto_621964 ?auto_621968 ) ) ( not ( = ?auto_621964 ?auto_621969 ) ) ( not ( = ?auto_621964 ?auto_621970 ) ) ( not ( = ?auto_621964 ?auto_621971 ) ) ( not ( = ?auto_621964 ?auto_621972 ) ) ( not ( = ?auto_621964 ?auto_621973 ) ) ( not ( = ?auto_621964 ?auto_621974 ) ) ( not ( = ?auto_621965 ?auto_621966 ) ) ( not ( = ?auto_621965 ?auto_621967 ) ) ( not ( = ?auto_621965 ?auto_621968 ) ) ( not ( = ?auto_621965 ?auto_621969 ) ) ( not ( = ?auto_621965 ?auto_621970 ) ) ( not ( = ?auto_621965 ?auto_621971 ) ) ( not ( = ?auto_621965 ?auto_621972 ) ) ( not ( = ?auto_621965 ?auto_621973 ) ) ( not ( = ?auto_621965 ?auto_621974 ) ) ( not ( = ?auto_621966 ?auto_621967 ) ) ( not ( = ?auto_621966 ?auto_621968 ) ) ( not ( = ?auto_621966 ?auto_621969 ) ) ( not ( = ?auto_621966 ?auto_621970 ) ) ( not ( = ?auto_621966 ?auto_621971 ) ) ( not ( = ?auto_621966 ?auto_621972 ) ) ( not ( = ?auto_621966 ?auto_621973 ) ) ( not ( = ?auto_621966 ?auto_621974 ) ) ( not ( = ?auto_621967 ?auto_621968 ) ) ( not ( = ?auto_621967 ?auto_621969 ) ) ( not ( = ?auto_621967 ?auto_621970 ) ) ( not ( = ?auto_621967 ?auto_621971 ) ) ( not ( = ?auto_621967 ?auto_621972 ) ) ( not ( = ?auto_621967 ?auto_621973 ) ) ( not ( = ?auto_621967 ?auto_621974 ) ) ( not ( = ?auto_621968 ?auto_621969 ) ) ( not ( = ?auto_621968 ?auto_621970 ) ) ( not ( = ?auto_621968 ?auto_621971 ) ) ( not ( = ?auto_621968 ?auto_621972 ) ) ( not ( = ?auto_621968 ?auto_621973 ) ) ( not ( = ?auto_621968 ?auto_621974 ) ) ( not ( = ?auto_621969 ?auto_621970 ) ) ( not ( = ?auto_621969 ?auto_621971 ) ) ( not ( = ?auto_621969 ?auto_621972 ) ) ( not ( = ?auto_621969 ?auto_621973 ) ) ( not ( = ?auto_621969 ?auto_621974 ) ) ( not ( = ?auto_621970 ?auto_621971 ) ) ( not ( = ?auto_621970 ?auto_621972 ) ) ( not ( = ?auto_621970 ?auto_621973 ) ) ( not ( = ?auto_621970 ?auto_621974 ) ) ( not ( = ?auto_621971 ?auto_621972 ) ) ( not ( = ?auto_621971 ?auto_621973 ) ) ( not ( = ?auto_621971 ?auto_621974 ) ) ( not ( = ?auto_621972 ?auto_621973 ) ) ( not ( = ?auto_621972 ?auto_621974 ) ) ( not ( = ?auto_621973 ?auto_621974 ) ) ( CLEAR ?auto_621971 ) ( ON ?auto_621972 ?auto_621973 ) ( CLEAR ?auto_621972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_621963 ?auto_621964 ?auto_621965 ?auto_621966 ?auto_621967 ?auto_621968 ?auto_621969 ?auto_621970 ?auto_621971 ?auto_621972 )
      ( MAKE-11PILE ?auto_621963 ?auto_621964 ?auto_621965 ?auto_621966 ?auto_621967 ?auto_621968 ?auto_621969 ?auto_621970 ?auto_621971 ?auto_621972 ?auto_621973 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622009 - BLOCK
      ?auto_622010 - BLOCK
      ?auto_622011 - BLOCK
      ?auto_622012 - BLOCK
      ?auto_622013 - BLOCK
      ?auto_622014 - BLOCK
      ?auto_622015 - BLOCK
      ?auto_622016 - BLOCK
      ?auto_622017 - BLOCK
      ?auto_622018 - BLOCK
      ?auto_622019 - BLOCK
    )
    :vars
    (
      ?auto_622020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622019 ?auto_622020 ) ( ON-TABLE ?auto_622009 ) ( ON ?auto_622010 ?auto_622009 ) ( ON ?auto_622011 ?auto_622010 ) ( ON ?auto_622012 ?auto_622011 ) ( ON ?auto_622013 ?auto_622012 ) ( ON ?auto_622014 ?auto_622013 ) ( ON ?auto_622015 ?auto_622014 ) ( ON ?auto_622016 ?auto_622015 ) ( not ( = ?auto_622009 ?auto_622010 ) ) ( not ( = ?auto_622009 ?auto_622011 ) ) ( not ( = ?auto_622009 ?auto_622012 ) ) ( not ( = ?auto_622009 ?auto_622013 ) ) ( not ( = ?auto_622009 ?auto_622014 ) ) ( not ( = ?auto_622009 ?auto_622015 ) ) ( not ( = ?auto_622009 ?auto_622016 ) ) ( not ( = ?auto_622009 ?auto_622017 ) ) ( not ( = ?auto_622009 ?auto_622018 ) ) ( not ( = ?auto_622009 ?auto_622019 ) ) ( not ( = ?auto_622009 ?auto_622020 ) ) ( not ( = ?auto_622010 ?auto_622011 ) ) ( not ( = ?auto_622010 ?auto_622012 ) ) ( not ( = ?auto_622010 ?auto_622013 ) ) ( not ( = ?auto_622010 ?auto_622014 ) ) ( not ( = ?auto_622010 ?auto_622015 ) ) ( not ( = ?auto_622010 ?auto_622016 ) ) ( not ( = ?auto_622010 ?auto_622017 ) ) ( not ( = ?auto_622010 ?auto_622018 ) ) ( not ( = ?auto_622010 ?auto_622019 ) ) ( not ( = ?auto_622010 ?auto_622020 ) ) ( not ( = ?auto_622011 ?auto_622012 ) ) ( not ( = ?auto_622011 ?auto_622013 ) ) ( not ( = ?auto_622011 ?auto_622014 ) ) ( not ( = ?auto_622011 ?auto_622015 ) ) ( not ( = ?auto_622011 ?auto_622016 ) ) ( not ( = ?auto_622011 ?auto_622017 ) ) ( not ( = ?auto_622011 ?auto_622018 ) ) ( not ( = ?auto_622011 ?auto_622019 ) ) ( not ( = ?auto_622011 ?auto_622020 ) ) ( not ( = ?auto_622012 ?auto_622013 ) ) ( not ( = ?auto_622012 ?auto_622014 ) ) ( not ( = ?auto_622012 ?auto_622015 ) ) ( not ( = ?auto_622012 ?auto_622016 ) ) ( not ( = ?auto_622012 ?auto_622017 ) ) ( not ( = ?auto_622012 ?auto_622018 ) ) ( not ( = ?auto_622012 ?auto_622019 ) ) ( not ( = ?auto_622012 ?auto_622020 ) ) ( not ( = ?auto_622013 ?auto_622014 ) ) ( not ( = ?auto_622013 ?auto_622015 ) ) ( not ( = ?auto_622013 ?auto_622016 ) ) ( not ( = ?auto_622013 ?auto_622017 ) ) ( not ( = ?auto_622013 ?auto_622018 ) ) ( not ( = ?auto_622013 ?auto_622019 ) ) ( not ( = ?auto_622013 ?auto_622020 ) ) ( not ( = ?auto_622014 ?auto_622015 ) ) ( not ( = ?auto_622014 ?auto_622016 ) ) ( not ( = ?auto_622014 ?auto_622017 ) ) ( not ( = ?auto_622014 ?auto_622018 ) ) ( not ( = ?auto_622014 ?auto_622019 ) ) ( not ( = ?auto_622014 ?auto_622020 ) ) ( not ( = ?auto_622015 ?auto_622016 ) ) ( not ( = ?auto_622015 ?auto_622017 ) ) ( not ( = ?auto_622015 ?auto_622018 ) ) ( not ( = ?auto_622015 ?auto_622019 ) ) ( not ( = ?auto_622015 ?auto_622020 ) ) ( not ( = ?auto_622016 ?auto_622017 ) ) ( not ( = ?auto_622016 ?auto_622018 ) ) ( not ( = ?auto_622016 ?auto_622019 ) ) ( not ( = ?auto_622016 ?auto_622020 ) ) ( not ( = ?auto_622017 ?auto_622018 ) ) ( not ( = ?auto_622017 ?auto_622019 ) ) ( not ( = ?auto_622017 ?auto_622020 ) ) ( not ( = ?auto_622018 ?auto_622019 ) ) ( not ( = ?auto_622018 ?auto_622020 ) ) ( not ( = ?auto_622019 ?auto_622020 ) ) ( ON ?auto_622018 ?auto_622019 ) ( CLEAR ?auto_622016 ) ( ON ?auto_622017 ?auto_622018 ) ( CLEAR ?auto_622017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_622009 ?auto_622010 ?auto_622011 ?auto_622012 ?auto_622013 ?auto_622014 ?auto_622015 ?auto_622016 ?auto_622017 )
      ( MAKE-11PILE ?auto_622009 ?auto_622010 ?auto_622011 ?auto_622012 ?auto_622013 ?auto_622014 ?auto_622015 ?auto_622016 ?auto_622017 ?auto_622018 ?auto_622019 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622055 - BLOCK
      ?auto_622056 - BLOCK
      ?auto_622057 - BLOCK
      ?auto_622058 - BLOCK
      ?auto_622059 - BLOCK
      ?auto_622060 - BLOCK
      ?auto_622061 - BLOCK
      ?auto_622062 - BLOCK
      ?auto_622063 - BLOCK
      ?auto_622064 - BLOCK
      ?auto_622065 - BLOCK
    )
    :vars
    (
      ?auto_622066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622065 ?auto_622066 ) ( ON-TABLE ?auto_622055 ) ( ON ?auto_622056 ?auto_622055 ) ( ON ?auto_622057 ?auto_622056 ) ( ON ?auto_622058 ?auto_622057 ) ( ON ?auto_622059 ?auto_622058 ) ( ON ?auto_622060 ?auto_622059 ) ( ON ?auto_622061 ?auto_622060 ) ( not ( = ?auto_622055 ?auto_622056 ) ) ( not ( = ?auto_622055 ?auto_622057 ) ) ( not ( = ?auto_622055 ?auto_622058 ) ) ( not ( = ?auto_622055 ?auto_622059 ) ) ( not ( = ?auto_622055 ?auto_622060 ) ) ( not ( = ?auto_622055 ?auto_622061 ) ) ( not ( = ?auto_622055 ?auto_622062 ) ) ( not ( = ?auto_622055 ?auto_622063 ) ) ( not ( = ?auto_622055 ?auto_622064 ) ) ( not ( = ?auto_622055 ?auto_622065 ) ) ( not ( = ?auto_622055 ?auto_622066 ) ) ( not ( = ?auto_622056 ?auto_622057 ) ) ( not ( = ?auto_622056 ?auto_622058 ) ) ( not ( = ?auto_622056 ?auto_622059 ) ) ( not ( = ?auto_622056 ?auto_622060 ) ) ( not ( = ?auto_622056 ?auto_622061 ) ) ( not ( = ?auto_622056 ?auto_622062 ) ) ( not ( = ?auto_622056 ?auto_622063 ) ) ( not ( = ?auto_622056 ?auto_622064 ) ) ( not ( = ?auto_622056 ?auto_622065 ) ) ( not ( = ?auto_622056 ?auto_622066 ) ) ( not ( = ?auto_622057 ?auto_622058 ) ) ( not ( = ?auto_622057 ?auto_622059 ) ) ( not ( = ?auto_622057 ?auto_622060 ) ) ( not ( = ?auto_622057 ?auto_622061 ) ) ( not ( = ?auto_622057 ?auto_622062 ) ) ( not ( = ?auto_622057 ?auto_622063 ) ) ( not ( = ?auto_622057 ?auto_622064 ) ) ( not ( = ?auto_622057 ?auto_622065 ) ) ( not ( = ?auto_622057 ?auto_622066 ) ) ( not ( = ?auto_622058 ?auto_622059 ) ) ( not ( = ?auto_622058 ?auto_622060 ) ) ( not ( = ?auto_622058 ?auto_622061 ) ) ( not ( = ?auto_622058 ?auto_622062 ) ) ( not ( = ?auto_622058 ?auto_622063 ) ) ( not ( = ?auto_622058 ?auto_622064 ) ) ( not ( = ?auto_622058 ?auto_622065 ) ) ( not ( = ?auto_622058 ?auto_622066 ) ) ( not ( = ?auto_622059 ?auto_622060 ) ) ( not ( = ?auto_622059 ?auto_622061 ) ) ( not ( = ?auto_622059 ?auto_622062 ) ) ( not ( = ?auto_622059 ?auto_622063 ) ) ( not ( = ?auto_622059 ?auto_622064 ) ) ( not ( = ?auto_622059 ?auto_622065 ) ) ( not ( = ?auto_622059 ?auto_622066 ) ) ( not ( = ?auto_622060 ?auto_622061 ) ) ( not ( = ?auto_622060 ?auto_622062 ) ) ( not ( = ?auto_622060 ?auto_622063 ) ) ( not ( = ?auto_622060 ?auto_622064 ) ) ( not ( = ?auto_622060 ?auto_622065 ) ) ( not ( = ?auto_622060 ?auto_622066 ) ) ( not ( = ?auto_622061 ?auto_622062 ) ) ( not ( = ?auto_622061 ?auto_622063 ) ) ( not ( = ?auto_622061 ?auto_622064 ) ) ( not ( = ?auto_622061 ?auto_622065 ) ) ( not ( = ?auto_622061 ?auto_622066 ) ) ( not ( = ?auto_622062 ?auto_622063 ) ) ( not ( = ?auto_622062 ?auto_622064 ) ) ( not ( = ?auto_622062 ?auto_622065 ) ) ( not ( = ?auto_622062 ?auto_622066 ) ) ( not ( = ?auto_622063 ?auto_622064 ) ) ( not ( = ?auto_622063 ?auto_622065 ) ) ( not ( = ?auto_622063 ?auto_622066 ) ) ( not ( = ?auto_622064 ?auto_622065 ) ) ( not ( = ?auto_622064 ?auto_622066 ) ) ( not ( = ?auto_622065 ?auto_622066 ) ) ( ON ?auto_622064 ?auto_622065 ) ( ON ?auto_622063 ?auto_622064 ) ( CLEAR ?auto_622061 ) ( ON ?auto_622062 ?auto_622063 ) ( CLEAR ?auto_622062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_622055 ?auto_622056 ?auto_622057 ?auto_622058 ?auto_622059 ?auto_622060 ?auto_622061 ?auto_622062 )
      ( MAKE-11PILE ?auto_622055 ?auto_622056 ?auto_622057 ?auto_622058 ?auto_622059 ?auto_622060 ?auto_622061 ?auto_622062 ?auto_622063 ?auto_622064 ?auto_622065 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622101 - BLOCK
      ?auto_622102 - BLOCK
      ?auto_622103 - BLOCK
      ?auto_622104 - BLOCK
      ?auto_622105 - BLOCK
      ?auto_622106 - BLOCK
      ?auto_622107 - BLOCK
      ?auto_622108 - BLOCK
      ?auto_622109 - BLOCK
      ?auto_622110 - BLOCK
      ?auto_622111 - BLOCK
    )
    :vars
    (
      ?auto_622112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622111 ?auto_622112 ) ( ON-TABLE ?auto_622101 ) ( ON ?auto_622102 ?auto_622101 ) ( ON ?auto_622103 ?auto_622102 ) ( ON ?auto_622104 ?auto_622103 ) ( ON ?auto_622105 ?auto_622104 ) ( ON ?auto_622106 ?auto_622105 ) ( not ( = ?auto_622101 ?auto_622102 ) ) ( not ( = ?auto_622101 ?auto_622103 ) ) ( not ( = ?auto_622101 ?auto_622104 ) ) ( not ( = ?auto_622101 ?auto_622105 ) ) ( not ( = ?auto_622101 ?auto_622106 ) ) ( not ( = ?auto_622101 ?auto_622107 ) ) ( not ( = ?auto_622101 ?auto_622108 ) ) ( not ( = ?auto_622101 ?auto_622109 ) ) ( not ( = ?auto_622101 ?auto_622110 ) ) ( not ( = ?auto_622101 ?auto_622111 ) ) ( not ( = ?auto_622101 ?auto_622112 ) ) ( not ( = ?auto_622102 ?auto_622103 ) ) ( not ( = ?auto_622102 ?auto_622104 ) ) ( not ( = ?auto_622102 ?auto_622105 ) ) ( not ( = ?auto_622102 ?auto_622106 ) ) ( not ( = ?auto_622102 ?auto_622107 ) ) ( not ( = ?auto_622102 ?auto_622108 ) ) ( not ( = ?auto_622102 ?auto_622109 ) ) ( not ( = ?auto_622102 ?auto_622110 ) ) ( not ( = ?auto_622102 ?auto_622111 ) ) ( not ( = ?auto_622102 ?auto_622112 ) ) ( not ( = ?auto_622103 ?auto_622104 ) ) ( not ( = ?auto_622103 ?auto_622105 ) ) ( not ( = ?auto_622103 ?auto_622106 ) ) ( not ( = ?auto_622103 ?auto_622107 ) ) ( not ( = ?auto_622103 ?auto_622108 ) ) ( not ( = ?auto_622103 ?auto_622109 ) ) ( not ( = ?auto_622103 ?auto_622110 ) ) ( not ( = ?auto_622103 ?auto_622111 ) ) ( not ( = ?auto_622103 ?auto_622112 ) ) ( not ( = ?auto_622104 ?auto_622105 ) ) ( not ( = ?auto_622104 ?auto_622106 ) ) ( not ( = ?auto_622104 ?auto_622107 ) ) ( not ( = ?auto_622104 ?auto_622108 ) ) ( not ( = ?auto_622104 ?auto_622109 ) ) ( not ( = ?auto_622104 ?auto_622110 ) ) ( not ( = ?auto_622104 ?auto_622111 ) ) ( not ( = ?auto_622104 ?auto_622112 ) ) ( not ( = ?auto_622105 ?auto_622106 ) ) ( not ( = ?auto_622105 ?auto_622107 ) ) ( not ( = ?auto_622105 ?auto_622108 ) ) ( not ( = ?auto_622105 ?auto_622109 ) ) ( not ( = ?auto_622105 ?auto_622110 ) ) ( not ( = ?auto_622105 ?auto_622111 ) ) ( not ( = ?auto_622105 ?auto_622112 ) ) ( not ( = ?auto_622106 ?auto_622107 ) ) ( not ( = ?auto_622106 ?auto_622108 ) ) ( not ( = ?auto_622106 ?auto_622109 ) ) ( not ( = ?auto_622106 ?auto_622110 ) ) ( not ( = ?auto_622106 ?auto_622111 ) ) ( not ( = ?auto_622106 ?auto_622112 ) ) ( not ( = ?auto_622107 ?auto_622108 ) ) ( not ( = ?auto_622107 ?auto_622109 ) ) ( not ( = ?auto_622107 ?auto_622110 ) ) ( not ( = ?auto_622107 ?auto_622111 ) ) ( not ( = ?auto_622107 ?auto_622112 ) ) ( not ( = ?auto_622108 ?auto_622109 ) ) ( not ( = ?auto_622108 ?auto_622110 ) ) ( not ( = ?auto_622108 ?auto_622111 ) ) ( not ( = ?auto_622108 ?auto_622112 ) ) ( not ( = ?auto_622109 ?auto_622110 ) ) ( not ( = ?auto_622109 ?auto_622111 ) ) ( not ( = ?auto_622109 ?auto_622112 ) ) ( not ( = ?auto_622110 ?auto_622111 ) ) ( not ( = ?auto_622110 ?auto_622112 ) ) ( not ( = ?auto_622111 ?auto_622112 ) ) ( ON ?auto_622110 ?auto_622111 ) ( ON ?auto_622109 ?auto_622110 ) ( ON ?auto_622108 ?auto_622109 ) ( CLEAR ?auto_622106 ) ( ON ?auto_622107 ?auto_622108 ) ( CLEAR ?auto_622107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_622101 ?auto_622102 ?auto_622103 ?auto_622104 ?auto_622105 ?auto_622106 ?auto_622107 )
      ( MAKE-11PILE ?auto_622101 ?auto_622102 ?auto_622103 ?auto_622104 ?auto_622105 ?auto_622106 ?auto_622107 ?auto_622108 ?auto_622109 ?auto_622110 ?auto_622111 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622147 - BLOCK
      ?auto_622148 - BLOCK
      ?auto_622149 - BLOCK
      ?auto_622150 - BLOCK
      ?auto_622151 - BLOCK
      ?auto_622152 - BLOCK
      ?auto_622153 - BLOCK
      ?auto_622154 - BLOCK
      ?auto_622155 - BLOCK
      ?auto_622156 - BLOCK
      ?auto_622157 - BLOCK
    )
    :vars
    (
      ?auto_622158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622157 ?auto_622158 ) ( ON-TABLE ?auto_622147 ) ( ON ?auto_622148 ?auto_622147 ) ( ON ?auto_622149 ?auto_622148 ) ( ON ?auto_622150 ?auto_622149 ) ( ON ?auto_622151 ?auto_622150 ) ( not ( = ?auto_622147 ?auto_622148 ) ) ( not ( = ?auto_622147 ?auto_622149 ) ) ( not ( = ?auto_622147 ?auto_622150 ) ) ( not ( = ?auto_622147 ?auto_622151 ) ) ( not ( = ?auto_622147 ?auto_622152 ) ) ( not ( = ?auto_622147 ?auto_622153 ) ) ( not ( = ?auto_622147 ?auto_622154 ) ) ( not ( = ?auto_622147 ?auto_622155 ) ) ( not ( = ?auto_622147 ?auto_622156 ) ) ( not ( = ?auto_622147 ?auto_622157 ) ) ( not ( = ?auto_622147 ?auto_622158 ) ) ( not ( = ?auto_622148 ?auto_622149 ) ) ( not ( = ?auto_622148 ?auto_622150 ) ) ( not ( = ?auto_622148 ?auto_622151 ) ) ( not ( = ?auto_622148 ?auto_622152 ) ) ( not ( = ?auto_622148 ?auto_622153 ) ) ( not ( = ?auto_622148 ?auto_622154 ) ) ( not ( = ?auto_622148 ?auto_622155 ) ) ( not ( = ?auto_622148 ?auto_622156 ) ) ( not ( = ?auto_622148 ?auto_622157 ) ) ( not ( = ?auto_622148 ?auto_622158 ) ) ( not ( = ?auto_622149 ?auto_622150 ) ) ( not ( = ?auto_622149 ?auto_622151 ) ) ( not ( = ?auto_622149 ?auto_622152 ) ) ( not ( = ?auto_622149 ?auto_622153 ) ) ( not ( = ?auto_622149 ?auto_622154 ) ) ( not ( = ?auto_622149 ?auto_622155 ) ) ( not ( = ?auto_622149 ?auto_622156 ) ) ( not ( = ?auto_622149 ?auto_622157 ) ) ( not ( = ?auto_622149 ?auto_622158 ) ) ( not ( = ?auto_622150 ?auto_622151 ) ) ( not ( = ?auto_622150 ?auto_622152 ) ) ( not ( = ?auto_622150 ?auto_622153 ) ) ( not ( = ?auto_622150 ?auto_622154 ) ) ( not ( = ?auto_622150 ?auto_622155 ) ) ( not ( = ?auto_622150 ?auto_622156 ) ) ( not ( = ?auto_622150 ?auto_622157 ) ) ( not ( = ?auto_622150 ?auto_622158 ) ) ( not ( = ?auto_622151 ?auto_622152 ) ) ( not ( = ?auto_622151 ?auto_622153 ) ) ( not ( = ?auto_622151 ?auto_622154 ) ) ( not ( = ?auto_622151 ?auto_622155 ) ) ( not ( = ?auto_622151 ?auto_622156 ) ) ( not ( = ?auto_622151 ?auto_622157 ) ) ( not ( = ?auto_622151 ?auto_622158 ) ) ( not ( = ?auto_622152 ?auto_622153 ) ) ( not ( = ?auto_622152 ?auto_622154 ) ) ( not ( = ?auto_622152 ?auto_622155 ) ) ( not ( = ?auto_622152 ?auto_622156 ) ) ( not ( = ?auto_622152 ?auto_622157 ) ) ( not ( = ?auto_622152 ?auto_622158 ) ) ( not ( = ?auto_622153 ?auto_622154 ) ) ( not ( = ?auto_622153 ?auto_622155 ) ) ( not ( = ?auto_622153 ?auto_622156 ) ) ( not ( = ?auto_622153 ?auto_622157 ) ) ( not ( = ?auto_622153 ?auto_622158 ) ) ( not ( = ?auto_622154 ?auto_622155 ) ) ( not ( = ?auto_622154 ?auto_622156 ) ) ( not ( = ?auto_622154 ?auto_622157 ) ) ( not ( = ?auto_622154 ?auto_622158 ) ) ( not ( = ?auto_622155 ?auto_622156 ) ) ( not ( = ?auto_622155 ?auto_622157 ) ) ( not ( = ?auto_622155 ?auto_622158 ) ) ( not ( = ?auto_622156 ?auto_622157 ) ) ( not ( = ?auto_622156 ?auto_622158 ) ) ( not ( = ?auto_622157 ?auto_622158 ) ) ( ON ?auto_622156 ?auto_622157 ) ( ON ?auto_622155 ?auto_622156 ) ( ON ?auto_622154 ?auto_622155 ) ( ON ?auto_622153 ?auto_622154 ) ( CLEAR ?auto_622151 ) ( ON ?auto_622152 ?auto_622153 ) ( CLEAR ?auto_622152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_622147 ?auto_622148 ?auto_622149 ?auto_622150 ?auto_622151 ?auto_622152 )
      ( MAKE-11PILE ?auto_622147 ?auto_622148 ?auto_622149 ?auto_622150 ?auto_622151 ?auto_622152 ?auto_622153 ?auto_622154 ?auto_622155 ?auto_622156 ?auto_622157 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622193 - BLOCK
      ?auto_622194 - BLOCK
      ?auto_622195 - BLOCK
      ?auto_622196 - BLOCK
      ?auto_622197 - BLOCK
      ?auto_622198 - BLOCK
      ?auto_622199 - BLOCK
      ?auto_622200 - BLOCK
      ?auto_622201 - BLOCK
      ?auto_622202 - BLOCK
      ?auto_622203 - BLOCK
    )
    :vars
    (
      ?auto_622204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622203 ?auto_622204 ) ( ON-TABLE ?auto_622193 ) ( ON ?auto_622194 ?auto_622193 ) ( ON ?auto_622195 ?auto_622194 ) ( ON ?auto_622196 ?auto_622195 ) ( not ( = ?auto_622193 ?auto_622194 ) ) ( not ( = ?auto_622193 ?auto_622195 ) ) ( not ( = ?auto_622193 ?auto_622196 ) ) ( not ( = ?auto_622193 ?auto_622197 ) ) ( not ( = ?auto_622193 ?auto_622198 ) ) ( not ( = ?auto_622193 ?auto_622199 ) ) ( not ( = ?auto_622193 ?auto_622200 ) ) ( not ( = ?auto_622193 ?auto_622201 ) ) ( not ( = ?auto_622193 ?auto_622202 ) ) ( not ( = ?auto_622193 ?auto_622203 ) ) ( not ( = ?auto_622193 ?auto_622204 ) ) ( not ( = ?auto_622194 ?auto_622195 ) ) ( not ( = ?auto_622194 ?auto_622196 ) ) ( not ( = ?auto_622194 ?auto_622197 ) ) ( not ( = ?auto_622194 ?auto_622198 ) ) ( not ( = ?auto_622194 ?auto_622199 ) ) ( not ( = ?auto_622194 ?auto_622200 ) ) ( not ( = ?auto_622194 ?auto_622201 ) ) ( not ( = ?auto_622194 ?auto_622202 ) ) ( not ( = ?auto_622194 ?auto_622203 ) ) ( not ( = ?auto_622194 ?auto_622204 ) ) ( not ( = ?auto_622195 ?auto_622196 ) ) ( not ( = ?auto_622195 ?auto_622197 ) ) ( not ( = ?auto_622195 ?auto_622198 ) ) ( not ( = ?auto_622195 ?auto_622199 ) ) ( not ( = ?auto_622195 ?auto_622200 ) ) ( not ( = ?auto_622195 ?auto_622201 ) ) ( not ( = ?auto_622195 ?auto_622202 ) ) ( not ( = ?auto_622195 ?auto_622203 ) ) ( not ( = ?auto_622195 ?auto_622204 ) ) ( not ( = ?auto_622196 ?auto_622197 ) ) ( not ( = ?auto_622196 ?auto_622198 ) ) ( not ( = ?auto_622196 ?auto_622199 ) ) ( not ( = ?auto_622196 ?auto_622200 ) ) ( not ( = ?auto_622196 ?auto_622201 ) ) ( not ( = ?auto_622196 ?auto_622202 ) ) ( not ( = ?auto_622196 ?auto_622203 ) ) ( not ( = ?auto_622196 ?auto_622204 ) ) ( not ( = ?auto_622197 ?auto_622198 ) ) ( not ( = ?auto_622197 ?auto_622199 ) ) ( not ( = ?auto_622197 ?auto_622200 ) ) ( not ( = ?auto_622197 ?auto_622201 ) ) ( not ( = ?auto_622197 ?auto_622202 ) ) ( not ( = ?auto_622197 ?auto_622203 ) ) ( not ( = ?auto_622197 ?auto_622204 ) ) ( not ( = ?auto_622198 ?auto_622199 ) ) ( not ( = ?auto_622198 ?auto_622200 ) ) ( not ( = ?auto_622198 ?auto_622201 ) ) ( not ( = ?auto_622198 ?auto_622202 ) ) ( not ( = ?auto_622198 ?auto_622203 ) ) ( not ( = ?auto_622198 ?auto_622204 ) ) ( not ( = ?auto_622199 ?auto_622200 ) ) ( not ( = ?auto_622199 ?auto_622201 ) ) ( not ( = ?auto_622199 ?auto_622202 ) ) ( not ( = ?auto_622199 ?auto_622203 ) ) ( not ( = ?auto_622199 ?auto_622204 ) ) ( not ( = ?auto_622200 ?auto_622201 ) ) ( not ( = ?auto_622200 ?auto_622202 ) ) ( not ( = ?auto_622200 ?auto_622203 ) ) ( not ( = ?auto_622200 ?auto_622204 ) ) ( not ( = ?auto_622201 ?auto_622202 ) ) ( not ( = ?auto_622201 ?auto_622203 ) ) ( not ( = ?auto_622201 ?auto_622204 ) ) ( not ( = ?auto_622202 ?auto_622203 ) ) ( not ( = ?auto_622202 ?auto_622204 ) ) ( not ( = ?auto_622203 ?auto_622204 ) ) ( ON ?auto_622202 ?auto_622203 ) ( ON ?auto_622201 ?auto_622202 ) ( ON ?auto_622200 ?auto_622201 ) ( ON ?auto_622199 ?auto_622200 ) ( ON ?auto_622198 ?auto_622199 ) ( CLEAR ?auto_622196 ) ( ON ?auto_622197 ?auto_622198 ) ( CLEAR ?auto_622197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_622193 ?auto_622194 ?auto_622195 ?auto_622196 ?auto_622197 )
      ( MAKE-11PILE ?auto_622193 ?auto_622194 ?auto_622195 ?auto_622196 ?auto_622197 ?auto_622198 ?auto_622199 ?auto_622200 ?auto_622201 ?auto_622202 ?auto_622203 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622239 - BLOCK
      ?auto_622240 - BLOCK
      ?auto_622241 - BLOCK
      ?auto_622242 - BLOCK
      ?auto_622243 - BLOCK
      ?auto_622244 - BLOCK
      ?auto_622245 - BLOCK
      ?auto_622246 - BLOCK
      ?auto_622247 - BLOCK
      ?auto_622248 - BLOCK
      ?auto_622249 - BLOCK
    )
    :vars
    (
      ?auto_622250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622249 ?auto_622250 ) ( ON-TABLE ?auto_622239 ) ( ON ?auto_622240 ?auto_622239 ) ( ON ?auto_622241 ?auto_622240 ) ( not ( = ?auto_622239 ?auto_622240 ) ) ( not ( = ?auto_622239 ?auto_622241 ) ) ( not ( = ?auto_622239 ?auto_622242 ) ) ( not ( = ?auto_622239 ?auto_622243 ) ) ( not ( = ?auto_622239 ?auto_622244 ) ) ( not ( = ?auto_622239 ?auto_622245 ) ) ( not ( = ?auto_622239 ?auto_622246 ) ) ( not ( = ?auto_622239 ?auto_622247 ) ) ( not ( = ?auto_622239 ?auto_622248 ) ) ( not ( = ?auto_622239 ?auto_622249 ) ) ( not ( = ?auto_622239 ?auto_622250 ) ) ( not ( = ?auto_622240 ?auto_622241 ) ) ( not ( = ?auto_622240 ?auto_622242 ) ) ( not ( = ?auto_622240 ?auto_622243 ) ) ( not ( = ?auto_622240 ?auto_622244 ) ) ( not ( = ?auto_622240 ?auto_622245 ) ) ( not ( = ?auto_622240 ?auto_622246 ) ) ( not ( = ?auto_622240 ?auto_622247 ) ) ( not ( = ?auto_622240 ?auto_622248 ) ) ( not ( = ?auto_622240 ?auto_622249 ) ) ( not ( = ?auto_622240 ?auto_622250 ) ) ( not ( = ?auto_622241 ?auto_622242 ) ) ( not ( = ?auto_622241 ?auto_622243 ) ) ( not ( = ?auto_622241 ?auto_622244 ) ) ( not ( = ?auto_622241 ?auto_622245 ) ) ( not ( = ?auto_622241 ?auto_622246 ) ) ( not ( = ?auto_622241 ?auto_622247 ) ) ( not ( = ?auto_622241 ?auto_622248 ) ) ( not ( = ?auto_622241 ?auto_622249 ) ) ( not ( = ?auto_622241 ?auto_622250 ) ) ( not ( = ?auto_622242 ?auto_622243 ) ) ( not ( = ?auto_622242 ?auto_622244 ) ) ( not ( = ?auto_622242 ?auto_622245 ) ) ( not ( = ?auto_622242 ?auto_622246 ) ) ( not ( = ?auto_622242 ?auto_622247 ) ) ( not ( = ?auto_622242 ?auto_622248 ) ) ( not ( = ?auto_622242 ?auto_622249 ) ) ( not ( = ?auto_622242 ?auto_622250 ) ) ( not ( = ?auto_622243 ?auto_622244 ) ) ( not ( = ?auto_622243 ?auto_622245 ) ) ( not ( = ?auto_622243 ?auto_622246 ) ) ( not ( = ?auto_622243 ?auto_622247 ) ) ( not ( = ?auto_622243 ?auto_622248 ) ) ( not ( = ?auto_622243 ?auto_622249 ) ) ( not ( = ?auto_622243 ?auto_622250 ) ) ( not ( = ?auto_622244 ?auto_622245 ) ) ( not ( = ?auto_622244 ?auto_622246 ) ) ( not ( = ?auto_622244 ?auto_622247 ) ) ( not ( = ?auto_622244 ?auto_622248 ) ) ( not ( = ?auto_622244 ?auto_622249 ) ) ( not ( = ?auto_622244 ?auto_622250 ) ) ( not ( = ?auto_622245 ?auto_622246 ) ) ( not ( = ?auto_622245 ?auto_622247 ) ) ( not ( = ?auto_622245 ?auto_622248 ) ) ( not ( = ?auto_622245 ?auto_622249 ) ) ( not ( = ?auto_622245 ?auto_622250 ) ) ( not ( = ?auto_622246 ?auto_622247 ) ) ( not ( = ?auto_622246 ?auto_622248 ) ) ( not ( = ?auto_622246 ?auto_622249 ) ) ( not ( = ?auto_622246 ?auto_622250 ) ) ( not ( = ?auto_622247 ?auto_622248 ) ) ( not ( = ?auto_622247 ?auto_622249 ) ) ( not ( = ?auto_622247 ?auto_622250 ) ) ( not ( = ?auto_622248 ?auto_622249 ) ) ( not ( = ?auto_622248 ?auto_622250 ) ) ( not ( = ?auto_622249 ?auto_622250 ) ) ( ON ?auto_622248 ?auto_622249 ) ( ON ?auto_622247 ?auto_622248 ) ( ON ?auto_622246 ?auto_622247 ) ( ON ?auto_622245 ?auto_622246 ) ( ON ?auto_622244 ?auto_622245 ) ( ON ?auto_622243 ?auto_622244 ) ( CLEAR ?auto_622241 ) ( ON ?auto_622242 ?auto_622243 ) ( CLEAR ?auto_622242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_622239 ?auto_622240 ?auto_622241 ?auto_622242 )
      ( MAKE-11PILE ?auto_622239 ?auto_622240 ?auto_622241 ?auto_622242 ?auto_622243 ?auto_622244 ?auto_622245 ?auto_622246 ?auto_622247 ?auto_622248 ?auto_622249 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622285 - BLOCK
      ?auto_622286 - BLOCK
      ?auto_622287 - BLOCK
      ?auto_622288 - BLOCK
      ?auto_622289 - BLOCK
      ?auto_622290 - BLOCK
      ?auto_622291 - BLOCK
      ?auto_622292 - BLOCK
      ?auto_622293 - BLOCK
      ?auto_622294 - BLOCK
      ?auto_622295 - BLOCK
    )
    :vars
    (
      ?auto_622296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622295 ?auto_622296 ) ( ON-TABLE ?auto_622285 ) ( ON ?auto_622286 ?auto_622285 ) ( not ( = ?auto_622285 ?auto_622286 ) ) ( not ( = ?auto_622285 ?auto_622287 ) ) ( not ( = ?auto_622285 ?auto_622288 ) ) ( not ( = ?auto_622285 ?auto_622289 ) ) ( not ( = ?auto_622285 ?auto_622290 ) ) ( not ( = ?auto_622285 ?auto_622291 ) ) ( not ( = ?auto_622285 ?auto_622292 ) ) ( not ( = ?auto_622285 ?auto_622293 ) ) ( not ( = ?auto_622285 ?auto_622294 ) ) ( not ( = ?auto_622285 ?auto_622295 ) ) ( not ( = ?auto_622285 ?auto_622296 ) ) ( not ( = ?auto_622286 ?auto_622287 ) ) ( not ( = ?auto_622286 ?auto_622288 ) ) ( not ( = ?auto_622286 ?auto_622289 ) ) ( not ( = ?auto_622286 ?auto_622290 ) ) ( not ( = ?auto_622286 ?auto_622291 ) ) ( not ( = ?auto_622286 ?auto_622292 ) ) ( not ( = ?auto_622286 ?auto_622293 ) ) ( not ( = ?auto_622286 ?auto_622294 ) ) ( not ( = ?auto_622286 ?auto_622295 ) ) ( not ( = ?auto_622286 ?auto_622296 ) ) ( not ( = ?auto_622287 ?auto_622288 ) ) ( not ( = ?auto_622287 ?auto_622289 ) ) ( not ( = ?auto_622287 ?auto_622290 ) ) ( not ( = ?auto_622287 ?auto_622291 ) ) ( not ( = ?auto_622287 ?auto_622292 ) ) ( not ( = ?auto_622287 ?auto_622293 ) ) ( not ( = ?auto_622287 ?auto_622294 ) ) ( not ( = ?auto_622287 ?auto_622295 ) ) ( not ( = ?auto_622287 ?auto_622296 ) ) ( not ( = ?auto_622288 ?auto_622289 ) ) ( not ( = ?auto_622288 ?auto_622290 ) ) ( not ( = ?auto_622288 ?auto_622291 ) ) ( not ( = ?auto_622288 ?auto_622292 ) ) ( not ( = ?auto_622288 ?auto_622293 ) ) ( not ( = ?auto_622288 ?auto_622294 ) ) ( not ( = ?auto_622288 ?auto_622295 ) ) ( not ( = ?auto_622288 ?auto_622296 ) ) ( not ( = ?auto_622289 ?auto_622290 ) ) ( not ( = ?auto_622289 ?auto_622291 ) ) ( not ( = ?auto_622289 ?auto_622292 ) ) ( not ( = ?auto_622289 ?auto_622293 ) ) ( not ( = ?auto_622289 ?auto_622294 ) ) ( not ( = ?auto_622289 ?auto_622295 ) ) ( not ( = ?auto_622289 ?auto_622296 ) ) ( not ( = ?auto_622290 ?auto_622291 ) ) ( not ( = ?auto_622290 ?auto_622292 ) ) ( not ( = ?auto_622290 ?auto_622293 ) ) ( not ( = ?auto_622290 ?auto_622294 ) ) ( not ( = ?auto_622290 ?auto_622295 ) ) ( not ( = ?auto_622290 ?auto_622296 ) ) ( not ( = ?auto_622291 ?auto_622292 ) ) ( not ( = ?auto_622291 ?auto_622293 ) ) ( not ( = ?auto_622291 ?auto_622294 ) ) ( not ( = ?auto_622291 ?auto_622295 ) ) ( not ( = ?auto_622291 ?auto_622296 ) ) ( not ( = ?auto_622292 ?auto_622293 ) ) ( not ( = ?auto_622292 ?auto_622294 ) ) ( not ( = ?auto_622292 ?auto_622295 ) ) ( not ( = ?auto_622292 ?auto_622296 ) ) ( not ( = ?auto_622293 ?auto_622294 ) ) ( not ( = ?auto_622293 ?auto_622295 ) ) ( not ( = ?auto_622293 ?auto_622296 ) ) ( not ( = ?auto_622294 ?auto_622295 ) ) ( not ( = ?auto_622294 ?auto_622296 ) ) ( not ( = ?auto_622295 ?auto_622296 ) ) ( ON ?auto_622294 ?auto_622295 ) ( ON ?auto_622293 ?auto_622294 ) ( ON ?auto_622292 ?auto_622293 ) ( ON ?auto_622291 ?auto_622292 ) ( ON ?auto_622290 ?auto_622291 ) ( ON ?auto_622289 ?auto_622290 ) ( ON ?auto_622288 ?auto_622289 ) ( CLEAR ?auto_622286 ) ( ON ?auto_622287 ?auto_622288 ) ( CLEAR ?auto_622287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_622285 ?auto_622286 ?auto_622287 )
      ( MAKE-11PILE ?auto_622285 ?auto_622286 ?auto_622287 ?auto_622288 ?auto_622289 ?auto_622290 ?auto_622291 ?auto_622292 ?auto_622293 ?auto_622294 ?auto_622295 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622331 - BLOCK
      ?auto_622332 - BLOCK
      ?auto_622333 - BLOCK
      ?auto_622334 - BLOCK
      ?auto_622335 - BLOCK
      ?auto_622336 - BLOCK
      ?auto_622337 - BLOCK
      ?auto_622338 - BLOCK
      ?auto_622339 - BLOCK
      ?auto_622340 - BLOCK
      ?auto_622341 - BLOCK
    )
    :vars
    (
      ?auto_622342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622341 ?auto_622342 ) ( ON-TABLE ?auto_622331 ) ( not ( = ?auto_622331 ?auto_622332 ) ) ( not ( = ?auto_622331 ?auto_622333 ) ) ( not ( = ?auto_622331 ?auto_622334 ) ) ( not ( = ?auto_622331 ?auto_622335 ) ) ( not ( = ?auto_622331 ?auto_622336 ) ) ( not ( = ?auto_622331 ?auto_622337 ) ) ( not ( = ?auto_622331 ?auto_622338 ) ) ( not ( = ?auto_622331 ?auto_622339 ) ) ( not ( = ?auto_622331 ?auto_622340 ) ) ( not ( = ?auto_622331 ?auto_622341 ) ) ( not ( = ?auto_622331 ?auto_622342 ) ) ( not ( = ?auto_622332 ?auto_622333 ) ) ( not ( = ?auto_622332 ?auto_622334 ) ) ( not ( = ?auto_622332 ?auto_622335 ) ) ( not ( = ?auto_622332 ?auto_622336 ) ) ( not ( = ?auto_622332 ?auto_622337 ) ) ( not ( = ?auto_622332 ?auto_622338 ) ) ( not ( = ?auto_622332 ?auto_622339 ) ) ( not ( = ?auto_622332 ?auto_622340 ) ) ( not ( = ?auto_622332 ?auto_622341 ) ) ( not ( = ?auto_622332 ?auto_622342 ) ) ( not ( = ?auto_622333 ?auto_622334 ) ) ( not ( = ?auto_622333 ?auto_622335 ) ) ( not ( = ?auto_622333 ?auto_622336 ) ) ( not ( = ?auto_622333 ?auto_622337 ) ) ( not ( = ?auto_622333 ?auto_622338 ) ) ( not ( = ?auto_622333 ?auto_622339 ) ) ( not ( = ?auto_622333 ?auto_622340 ) ) ( not ( = ?auto_622333 ?auto_622341 ) ) ( not ( = ?auto_622333 ?auto_622342 ) ) ( not ( = ?auto_622334 ?auto_622335 ) ) ( not ( = ?auto_622334 ?auto_622336 ) ) ( not ( = ?auto_622334 ?auto_622337 ) ) ( not ( = ?auto_622334 ?auto_622338 ) ) ( not ( = ?auto_622334 ?auto_622339 ) ) ( not ( = ?auto_622334 ?auto_622340 ) ) ( not ( = ?auto_622334 ?auto_622341 ) ) ( not ( = ?auto_622334 ?auto_622342 ) ) ( not ( = ?auto_622335 ?auto_622336 ) ) ( not ( = ?auto_622335 ?auto_622337 ) ) ( not ( = ?auto_622335 ?auto_622338 ) ) ( not ( = ?auto_622335 ?auto_622339 ) ) ( not ( = ?auto_622335 ?auto_622340 ) ) ( not ( = ?auto_622335 ?auto_622341 ) ) ( not ( = ?auto_622335 ?auto_622342 ) ) ( not ( = ?auto_622336 ?auto_622337 ) ) ( not ( = ?auto_622336 ?auto_622338 ) ) ( not ( = ?auto_622336 ?auto_622339 ) ) ( not ( = ?auto_622336 ?auto_622340 ) ) ( not ( = ?auto_622336 ?auto_622341 ) ) ( not ( = ?auto_622336 ?auto_622342 ) ) ( not ( = ?auto_622337 ?auto_622338 ) ) ( not ( = ?auto_622337 ?auto_622339 ) ) ( not ( = ?auto_622337 ?auto_622340 ) ) ( not ( = ?auto_622337 ?auto_622341 ) ) ( not ( = ?auto_622337 ?auto_622342 ) ) ( not ( = ?auto_622338 ?auto_622339 ) ) ( not ( = ?auto_622338 ?auto_622340 ) ) ( not ( = ?auto_622338 ?auto_622341 ) ) ( not ( = ?auto_622338 ?auto_622342 ) ) ( not ( = ?auto_622339 ?auto_622340 ) ) ( not ( = ?auto_622339 ?auto_622341 ) ) ( not ( = ?auto_622339 ?auto_622342 ) ) ( not ( = ?auto_622340 ?auto_622341 ) ) ( not ( = ?auto_622340 ?auto_622342 ) ) ( not ( = ?auto_622341 ?auto_622342 ) ) ( ON ?auto_622340 ?auto_622341 ) ( ON ?auto_622339 ?auto_622340 ) ( ON ?auto_622338 ?auto_622339 ) ( ON ?auto_622337 ?auto_622338 ) ( ON ?auto_622336 ?auto_622337 ) ( ON ?auto_622335 ?auto_622336 ) ( ON ?auto_622334 ?auto_622335 ) ( ON ?auto_622333 ?auto_622334 ) ( CLEAR ?auto_622331 ) ( ON ?auto_622332 ?auto_622333 ) ( CLEAR ?auto_622332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_622331 ?auto_622332 )
      ( MAKE-11PILE ?auto_622331 ?auto_622332 ?auto_622333 ?auto_622334 ?auto_622335 ?auto_622336 ?auto_622337 ?auto_622338 ?auto_622339 ?auto_622340 ?auto_622341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_622377 - BLOCK
      ?auto_622378 - BLOCK
      ?auto_622379 - BLOCK
      ?auto_622380 - BLOCK
      ?auto_622381 - BLOCK
      ?auto_622382 - BLOCK
      ?auto_622383 - BLOCK
      ?auto_622384 - BLOCK
      ?auto_622385 - BLOCK
      ?auto_622386 - BLOCK
      ?auto_622387 - BLOCK
    )
    :vars
    (
      ?auto_622388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622387 ?auto_622388 ) ( not ( = ?auto_622377 ?auto_622378 ) ) ( not ( = ?auto_622377 ?auto_622379 ) ) ( not ( = ?auto_622377 ?auto_622380 ) ) ( not ( = ?auto_622377 ?auto_622381 ) ) ( not ( = ?auto_622377 ?auto_622382 ) ) ( not ( = ?auto_622377 ?auto_622383 ) ) ( not ( = ?auto_622377 ?auto_622384 ) ) ( not ( = ?auto_622377 ?auto_622385 ) ) ( not ( = ?auto_622377 ?auto_622386 ) ) ( not ( = ?auto_622377 ?auto_622387 ) ) ( not ( = ?auto_622377 ?auto_622388 ) ) ( not ( = ?auto_622378 ?auto_622379 ) ) ( not ( = ?auto_622378 ?auto_622380 ) ) ( not ( = ?auto_622378 ?auto_622381 ) ) ( not ( = ?auto_622378 ?auto_622382 ) ) ( not ( = ?auto_622378 ?auto_622383 ) ) ( not ( = ?auto_622378 ?auto_622384 ) ) ( not ( = ?auto_622378 ?auto_622385 ) ) ( not ( = ?auto_622378 ?auto_622386 ) ) ( not ( = ?auto_622378 ?auto_622387 ) ) ( not ( = ?auto_622378 ?auto_622388 ) ) ( not ( = ?auto_622379 ?auto_622380 ) ) ( not ( = ?auto_622379 ?auto_622381 ) ) ( not ( = ?auto_622379 ?auto_622382 ) ) ( not ( = ?auto_622379 ?auto_622383 ) ) ( not ( = ?auto_622379 ?auto_622384 ) ) ( not ( = ?auto_622379 ?auto_622385 ) ) ( not ( = ?auto_622379 ?auto_622386 ) ) ( not ( = ?auto_622379 ?auto_622387 ) ) ( not ( = ?auto_622379 ?auto_622388 ) ) ( not ( = ?auto_622380 ?auto_622381 ) ) ( not ( = ?auto_622380 ?auto_622382 ) ) ( not ( = ?auto_622380 ?auto_622383 ) ) ( not ( = ?auto_622380 ?auto_622384 ) ) ( not ( = ?auto_622380 ?auto_622385 ) ) ( not ( = ?auto_622380 ?auto_622386 ) ) ( not ( = ?auto_622380 ?auto_622387 ) ) ( not ( = ?auto_622380 ?auto_622388 ) ) ( not ( = ?auto_622381 ?auto_622382 ) ) ( not ( = ?auto_622381 ?auto_622383 ) ) ( not ( = ?auto_622381 ?auto_622384 ) ) ( not ( = ?auto_622381 ?auto_622385 ) ) ( not ( = ?auto_622381 ?auto_622386 ) ) ( not ( = ?auto_622381 ?auto_622387 ) ) ( not ( = ?auto_622381 ?auto_622388 ) ) ( not ( = ?auto_622382 ?auto_622383 ) ) ( not ( = ?auto_622382 ?auto_622384 ) ) ( not ( = ?auto_622382 ?auto_622385 ) ) ( not ( = ?auto_622382 ?auto_622386 ) ) ( not ( = ?auto_622382 ?auto_622387 ) ) ( not ( = ?auto_622382 ?auto_622388 ) ) ( not ( = ?auto_622383 ?auto_622384 ) ) ( not ( = ?auto_622383 ?auto_622385 ) ) ( not ( = ?auto_622383 ?auto_622386 ) ) ( not ( = ?auto_622383 ?auto_622387 ) ) ( not ( = ?auto_622383 ?auto_622388 ) ) ( not ( = ?auto_622384 ?auto_622385 ) ) ( not ( = ?auto_622384 ?auto_622386 ) ) ( not ( = ?auto_622384 ?auto_622387 ) ) ( not ( = ?auto_622384 ?auto_622388 ) ) ( not ( = ?auto_622385 ?auto_622386 ) ) ( not ( = ?auto_622385 ?auto_622387 ) ) ( not ( = ?auto_622385 ?auto_622388 ) ) ( not ( = ?auto_622386 ?auto_622387 ) ) ( not ( = ?auto_622386 ?auto_622388 ) ) ( not ( = ?auto_622387 ?auto_622388 ) ) ( ON ?auto_622386 ?auto_622387 ) ( ON ?auto_622385 ?auto_622386 ) ( ON ?auto_622384 ?auto_622385 ) ( ON ?auto_622383 ?auto_622384 ) ( ON ?auto_622382 ?auto_622383 ) ( ON ?auto_622381 ?auto_622382 ) ( ON ?auto_622380 ?auto_622381 ) ( ON ?auto_622379 ?auto_622380 ) ( ON ?auto_622378 ?auto_622379 ) ( ON ?auto_622377 ?auto_622378 ) ( CLEAR ?auto_622377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_622377 )
      ( MAKE-11PILE ?auto_622377 ?auto_622378 ?auto_622379 ?auto_622380 ?auto_622381 ?auto_622382 ?auto_622383 ?auto_622384 ?auto_622385 ?auto_622386 ?auto_622387 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622424 - BLOCK
      ?auto_622425 - BLOCK
      ?auto_622426 - BLOCK
      ?auto_622427 - BLOCK
      ?auto_622428 - BLOCK
      ?auto_622429 - BLOCK
      ?auto_622430 - BLOCK
      ?auto_622431 - BLOCK
      ?auto_622432 - BLOCK
      ?auto_622433 - BLOCK
      ?auto_622434 - BLOCK
      ?auto_622435 - BLOCK
    )
    :vars
    (
      ?auto_622436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_622434 ) ( ON ?auto_622435 ?auto_622436 ) ( CLEAR ?auto_622435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_622424 ) ( ON ?auto_622425 ?auto_622424 ) ( ON ?auto_622426 ?auto_622425 ) ( ON ?auto_622427 ?auto_622426 ) ( ON ?auto_622428 ?auto_622427 ) ( ON ?auto_622429 ?auto_622428 ) ( ON ?auto_622430 ?auto_622429 ) ( ON ?auto_622431 ?auto_622430 ) ( ON ?auto_622432 ?auto_622431 ) ( ON ?auto_622433 ?auto_622432 ) ( ON ?auto_622434 ?auto_622433 ) ( not ( = ?auto_622424 ?auto_622425 ) ) ( not ( = ?auto_622424 ?auto_622426 ) ) ( not ( = ?auto_622424 ?auto_622427 ) ) ( not ( = ?auto_622424 ?auto_622428 ) ) ( not ( = ?auto_622424 ?auto_622429 ) ) ( not ( = ?auto_622424 ?auto_622430 ) ) ( not ( = ?auto_622424 ?auto_622431 ) ) ( not ( = ?auto_622424 ?auto_622432 ) ) ( not ( = ?auto_622424 ?auto_622433 ) ) ( not ( = ?auto_622424 ?auto_622434 ) ) ( not ( = ?auto_622424 ?auto_622435 ) ) ( not ( = ?auto_622424 ?auto_622436 ) ) ( not ( = ?auto_622425 ?auto_622426 ) ) ( not ( = ?auto_622425 ?auto_622427 ) ) ( not ( = ?auto_622425 ?auto_622428 ) ) ( not ( = ?auto_622425 ?auto_622429 ) ) ( not ( = ?auto_622425 ?auto_622430 ) ) ( not ( = ?auto_622425 ?auto_622431 ) ) ( not ( = ?auto_622425 ?auto_622432 ) ) ( not ( = ?auto_622425 ?auto_622433 ) ) ( not ( = ?auto_622425 ?auto_622434 ) ) ( not ( = ?auto_622425 ?auto_622435 ) ) ( not ( = ?auto_622425 ?auto_622436 ) ) ( not ( = ?auto_622426 ?auto_622427 ) ) ( not ( = ?auto_622426 ?auto_622428 ) ) ( not ( = ?auto_622426 ?auto_622429 ) ) ( not ( = ?auto_622426 ?auto_622430 ) ) ( not ( = ?auto_622426 ?auto_622431 ) ) ( not ( = ?auto_622426 ?auto_622432 ) ) ( not ( = ?auto_622426 ?auto_622433 ) ) ( not ( = ?auto_622426 ?auto_622434 ) ) ( not ( = ?auto_622426 ?auto_622435 ) ) ( not ( = ?auto_622426 ?auto_622436 ) ) ( not ( = ?auto_622427 ?auto_622428 ) ) ( not ( = ?auto_622427 ?auto_622429 ) ) ( not ( = ?auto_622427 ?auto_622430 ) ) ( not ( = ?auto_622427 ?auto_622431 ) ) ( not ( = ?auto_622427 ?auto_622432 ) ) ( not ( = ?auto_622427 ?auto_622433 ) ) ( not ( = ?auto_622427 ?auto_622434 ) ) ( not ( = ?auto_622427 ?auto_622435 ) ) ( not ( = ?auto_622427 ?auto_622436 ) ) ( not ( = ?auto_622428 ?auto_622429 ) ) ( not ( = ?auto_622428 ?auto_622430 ) ) ( not ( = ?auto_622428 ?auto_622431 ) ) ( not ( = ?auto_622428 ?auto_622432 ) ) ( not ( = ?auto_622428 ?auto_622433 ) ) ( not ( = ?auto_622428 ?auto_622434 ) ) ( not ( = ?auto_622428 ?auto_622435 ) ) ( not ( = ?auto_622428 ?auto_622436 ) ) ( not ( = ?auto_622429 ?auto_622430 ) ) ( not ( = ?auto_622429 ?auto_622431 ) ) ( not ( = ?auto_622429 ?auto_622432 ) ) ( not ( = ?auto_622429 ?auto_622433 ) ) ( not ( = ?auto_622429 ?auto_622434 ) ) ( not ( = ?auto_622429 ?auto_622435 ) ) ( not ( = ?auto_622429 ?auto_622436 ) ) ( not ( = ?auto_622430 ?auto_622431 ) ) ( not ( = ?auto_622430 ?auto_622432 ) ) ( not ( = ?auto_622430 ?auto_622433 ) ) ( not ( = ?auto_622430 ?auto_622434 ) ) ( not ( = ?auto_622430 ?auto_622435 ) ) ( not ( = ?auto_622430 ?auto_622436 ) ) ( not ( = ?auto_622431 ?auto_622432 ) ) ( not ( = ?auto_622431 ?auto_622433 ) ) ( not ( = ?auto_622431 ?auto_622434 ) ) ( not ( = ?auto_622431 ?auto_622435 ) ) ( not ( = ?auto_622431 ?auto_622436 ) ) ( not ( = ?auto_622432 ?auto_622433 ) ) ( not ( = ?auto_622432 ?auto_622434 ) ) ( not ( = ?auto_622432 ?auto_622435 ) ) ( not ( = ?auto_622432 ?auto_622436 ) ) ( not ( = ?auto_622433 ?auto_622434 ) ) ( not ( = ?auto_622433 ?auto_622435 ) ) ( not ( = ?auto_622433 ?auto_622436 ) ) ( not ( = ?auto_622434 ?auto_622435 ) ) ( not ( = ?auto_622434 ?auto_622436 ) ) ( not ( = ?auto_622435 ?auto_622436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_622435 ?auto_622436 )
      ( !STACK ?auto_622435 ?auto_622434 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622474 - BLOCK
      ?auto_622475 - BLOCK
      ?auto_622476 - BLOCK
      ?auto_622477 - BLOCK
      ?auto_622478 - BLOCK
      ?auto_622479 - BLOCK
      ?auto_622480 - BLOCK
      ?auto_622481 - BLOCK
      ?auto_622482 - BLOCK
      ?auto_622483 - BLOCK
      ?auto_622484 - BLOCK
      ?auto_622485 - BLOCK
    )
    :vars
    (
      ?auto_622486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622485 ?auto_622486 ) ( ON-TABLE ?auto_622474 ) ( ON ?auto_622475 ?auto_622474 ) ( ON ?auto_622476 ?auto_622475 ) ( ON ?auto_622477 ?auto_622476 ) ( ON ?auto_622478 ?auto_622477 ) ( ON ?auto_622479 ?auto_622478 ) ( ON ?auto_622480 ?auto_622479 ) ( ON ?auto_622481 ?auto_622480 ) ( ON ?auto_622482 ?auto_622481 ) ( ON ?auto_622483 ?auto_622482 ) ( not ( = ?auto_622474 ?auto_622475 ) ) ( not ( = ?auto_622474 ?auto_622476 ) ) ( not ( = ?auto_622474 ?auto_622477 ) ) ( not ( = ?auto_622474 ?auto_622478 ) ) ( not ( = ?auto_622474 ?auto_622479 ) ) ( not ( = ?auto_622474 ?auto_622480 ) ) ( not ( = ?auto_622474 ?auto_622481 ) ) ( not ( = ?auto_622474 ?auto_622482 ) ) ( not ( = ?auto_622474 ?auto_622483 ) ) ( not ( = ?auto_622474 ?auto_622484 ) ) ( not ( = ?auto_622474 ?auto_622485 ) ) ( not ( = ?auto_622474 ?auto_622486 ) ) ( not ( = ?auto_622475 ?auto_622476 ) ) ( not ( = ?auto_622475 ?auto_622477 ) ) ( not ( = ?auto_622475 ?auto_622478 ) ) ( not ( = ?auto_622475 ?auto_622479 ) ) ( not ( = ?auto_622475 ?auto_622480 ) ) ( not ( = ?auto_622475 ?auto_622481 ) ) ( not ( = ?auto_622475 ?auto_622482 ) ) ( not ( = ?auto_622475 ?auto_622483 ) ) ( not ( = ?auto_622475 ?auto_622484 ) ) ( not ( = ?auto_622475 ?auto_622485 ) ) ( not ( = ?auto_622475 ?auto_622486 ) ) ( not ( = ?auto_622476 ?auto_622477 ) ) ( not ( = ?auto_622476 ?auto_622478 ) ) ( not ( = ?auto_622476 ?auto_622479 ) ) ( not ( = ?auto_622476 ?auto_622480 ) ) ( not ( = ?auto_622476 ?auto_622481 ) ) ( not ( = ?auto_622476 ?auto_622482 ) ) ( not ( = ?auto_622476 ?auto_622483 ) ) ( not ( = ?auto_622476 ?auto_622484 ) ) ( not ( = ?auto_622476 ?auto_622485 ) ) ( not ( = ?auto_622476 ?auto_622486 ) ) ( not ( = ?auto_622477 ?auto_622478 ) ) ( not ( = ?auto_622477 ?auto_622479 ) ) ( not ( = ?auto_622477 ?auto_622480 ) ) ( not ( = ?auto_622477 ?auto_622481 ) ) ( not ( = ?auto_622477 ?auto_622482 ) ) ( not ( = ?auto_622477 ?auto_622483 ) ) ( not ( = ?auto_622477 ?auto_622484 ) ) ( not ( = ?auto_622477 ?auto_622485 ) ) ( not ( = ?auto_622477 ?auto_622486 ) ) ( not ( = ?auto_622478 ?auto_622479 ) ) ( not ( = ?auto_622478 ?auto_622480 ) ) ( not ( = ?auto_622478 ?auto_622481 ) ) ( not ( = ?auto_622478 ?auto_622482 ) ) ( not ( = ?auto_622478 ?auto_622483 ) ) ( not ( = ?auto_622478 ?auto_622484 ) ) ( not ( = ?auto_622478 ?auto_622485 ) ) ( not ( = ?auto_622478 ?auto_622486 ) ) ( not ( = ?auto_622479 ?auto_622480 ) ) ( not ( = ?auto_622479 ?auto_622481 ) ) ( not ( = ?auto_622479 ?auto_622482 ) ) ( not ( = ?auto_622479 ?auto_622483 ) ) ( not ( = ?auto_622479 ?auto_622484 ) ) ( not ( = ?auto_622479 ?auto_622485 ) ) ( not ( = ?auto_622479 ?auto_622486 ) ) ( not ( = ?auto_622480 ?auto_622481 ) ) ( not ( = ?auto_622480 ?auto_622482 ) ) ( not ( = ?auto_622480 ?auto_622483 ) ) ( not ( = ?auto_622480 ?auto_622484 ) ) ( not ( = ?auto_622480 ?auto_622485 ) ) ( not ( = ?auto_622480 ?auto_622486 ) ) ( not ( = ?auto_622481 ?auto_622482 ) ) ( not ( = ?auto_622481 ?auto_622483 ) ) ( not ( = ?auto_622481 ?auto_622484 ) ) ( not ( = ?auto_622481 ?auto_622485 ) ) ( not ( = ?auto_622481 ?auto_622486 ) ) ( not ( = ?auto_622482 ?auto_622483 ) ) ( not ( = ?auto_622482 ?auto_622484 ) ) ( not ( = ?auto_622482 ?auto_622485 ) ) ( not ( = ?auto_622482 ?auto_622486 ) ) ( not ( = ?auto_622483 ?auto_622484 ) ) ( not ( = ?auto_622483 ?auto_622485 ) ) ( not ( = ?auto_622483 ?auto_622486 ) ) ( not ( = ?auto_622484 ?auto_622485 ) ) ( not ( = ?auto_622484 ?auto_622486 ) ) ( not ( = ?auto_622485 ?auto_622486 ) ) ( CLEAR ?auto_622483 ) ( ON ?auto_622484 ?auto_622485 ) ( CLEAR ?auto_622484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_622474 ?auto_622475 ?auto_622476 ?auto_622477 ?auto_622478 ?auto_622479 ?auto_622480 ?auto_622481 ?auto_622482 ?auto_622483 ?auto_622484 )
      ( MAKE-12PILE ?auto_622474 ?auto_622475 ?auto_622476 ?auto_622477 ?auto_622478 ?auto_622479 ?auto_622480 ?auto_622481 ?auto_622482 ?auto_622483 ?auto_622484 ?auto_622485 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622524 - BLOCK
      ?auto_622525 - BLOCK
      ?auto_622526 - BLOCK
      ?auto_622527 - BLOCK
      ?auto_622528 - BLOCK
      ?auto_622529 - BLOCK
      ?auto_622530 - BLOCK
      ?auto_622531 - BLOCK
      ?auto_622532 - BLOCK
      ?auto_622533 - BLOCK
      ?auto_622534 - BLOCK
      ?auto_622535 - BLOCK
    )
    :vars
    (
      ?auto_622536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622535 ?auto_622536 ) ( ON-TABLE ?auto_622524 ) ( ON ?auto_622525 ?auto_622524 ) ( ON ?auto_622526 ?auto_622525 ) ( ON ?auto_622527 ?auto_622526 ) ( ON ?auto_622528 ?auto_622527 ) ( ON ?auto_622529 ?auto_622528 ) ( ON ?auto_622530 ?auto_622529 ) ( ON ?auto_622531 ?auto_622530 ) ( ON ?auto_622532 ?auto_622531 ) ( not ( = ?auto_622524 ?auto_622525 ) ) ( not ( = ?auto_622524 ?auto_622526 ) ) ( not ( = ?auto_622524 ?auto_622527 ) ) ( not ( = ?auto_622524 ?auto_622528 ) ) ( not ( = ?auto_622524 ?auto_622529 ) ) ( not ( = ?auto_622524 ?auto_622530 ) ) ( not ( = ?auto_622524 ?auto_622531 ) ) ( not ( = ?auto_622524 ?auto_622532 ) ) ( not ( = ?auto_622524 ?auto_622533 ) ) ( not ( = ?auto_622524 ?auto_622534 ) ) ( not ( = ?auto_622524 ?auto_622535 ) ) ( not ( = ?auto_622524 ?auto_622536 ) ) ( not ( = ?auto_622525 ?auto_622526 ) ) ( not ( = ?auto_622525 ?auto_622527 ) ) ( not ( = ?auto_622525 ?auto_622528 ) ) ( not ( = ?auto_622525 ?auto_622529 ) ) ( not ( = ?auto_622525 ?auto_622530 ) ) ( not ( = ?auto_622525 ?auto_622531 ) ) ( not ( = ?auto_622525 ?auto_622532 ) ) ( not ( = ?auto_622525 ?auto_622533 ) ) ( not ( = ?auto_622525 ?auto_622534 ) ) ( not ( = ?auto_622525 ?auto_622535 ) ) ( not ( = ?auto_622525 ?auto_622536 ) ) ( not ( = ?auto_622526 ?auto_622527 ) ) ( not ( = ?auto_622526 ?auto_622528 ) ) ( not ( = ?auto_622526 ?auto_622529 ) ) ( not ( = ?auto_622526 ?auto_622530 ) ) ( not ( = ?auto_622526 ?auto_622531 ) ) ( not ( = ?auto_622526 ?auto_622532 ) ) ( not ( = ?auto_622526 ?auto_622533 ) ) ( not ( = ?auto_622526 ?auto_622534 ) ) ( not ( = ?auto_622526 ?auto_622535 ) ) ( not ( = ?auto_622526 ?auto_622536 ) ) ( not ( = ?auto_622527 ?auto_622528 ) ) ( not ( = ?auto_622527 ?auto_622529 ) ) ( not ( = ?auto_622527 ?auto_622530 ) ) ( not ( = ?auto_622527 ?auto_622531 ) ) ( not ( = ?auto_622527 ?auto_622532 ) ) ( not ( = ?auto_622527 ?auto_622533 ) ) ( not ( = ?auto_622527 ?auto_622534 ) ) ( not ( = ?auto_622527 ?auto_622535 ) ) ( not ( = ?auto_622527 ?auto_622536 ) ) ( not ( = ?auto_622528 ?auto_622529 ) ) ( not ( = ?auto_622528 ?auto_622530 ) ) ( not ( = ?auto_622528 ?auto_622531 ) ) ( not ( = ?auto_622528 ?auto_622532 ) ) ( not ( = ?auto_622528 ?auto_622533 ) ) ( not ( = ?auto_622528 ?auto_622534 ) ) ( not ( = ?auto_622528 ?auto_622535 ) ) ( not ( = ?auto_622528 ?auto_622536 ) ) ( not ( = ?auto_622529 ?auto_622530 ) ) ( not ( = ?auto_622529 ?auto_622531 ) ) ( not ( = ?auto_622529 ?auto_622532 ) ) ( not ( = ?auto_622529 ?auto_622533 ) ) ( not ( = ?auto_622529 ?auto_622534 ) ) ( not ( = ?auto_622529 ?auto_622535 ) ) ( not ( = ?auto_622529 ?auto_622536 ) ) ( not ( = ?auto_622530 ?auto_622531 ) ) ( not ( = ?auto_622530 ?auto_622532 ) ) ( not ( = ?auto_622530 ?auto_622533 ) ) ( not ( = ?auto_622530 ?auto_622534 ) ) ( not ( = ?auto_622530 ?auto_622535 ) ) ( not ( = ?auto_622530 ?auto_622536 ) ) ( not ( = ?auto_622531 ?auto_622532 ) ) ( not ( = ?auto_622531 ?auto_622533 ) ) ( not ( = ?auto_622531 ?auto_622534 ) ) ( not ( = ?auto_622531 ?auto_622535 ) ) ( not ( = ?auto_622531 ?auto_622536 ) ) ( not ( = ?auto_622532 ?auto_622533 ) ) ( not ( = ?auto_622532 ?auto_622534 ) ) ( not ( = ?auto_622532 ?auto_622535 ) ) ( not ( = ?auto_622532 ?auto_622536 ) ) ( not ( = ?auto_622533 ?auto_622534 ) ) ( not ( = ?auto_622533 ?auto_622535 ) ) ( not ( = ?auto_622533 ?auto_622536 ) ) ( not ( = ?auto_622534 ?auto_622535 ) ) ( not ( = ?auto_622534 ?auto_622536 ) ) ( not ( = ?auto_622535 ?auto_622536 ) ) ( ON ?auto_622534 ?auto_622535 ) ( CLEAR ?auto_622532 ) ( ON ?auto_622533 ?auto_622534 ) ( CLEAR ?auto_622533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_622524 ?auto_622525 ?auto_622526 ?auto_622527 ?auto_622528 ?auto_622529 ?auto_622530 ?auto_622531 ?auto_622532 ?auto_622533 )
      ( MAKE-12PILE ?auto_622524 ?auto_622525 ?auto_622526 ?auto_622527 ?auto_622528 ?auto_622529 ?auto_622530 ?auto_622531 ?auto_622532 ?auto_622533 ?auto_622534 ?auto_622535 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622574 - BLOCK
      ?auto_622575 - BLOCK
      ?auto_622576 - BLOCK
      ?auto_622577 - BLOCK
      ?auto_622578 - BLOCK
      ?auto_622579 - BLOCK
      ?auto_622580 - BLOCK
      ?auto_622581 - BLOCK
      ?auto_622582 - BLOCK
      ?auto_622583 - BLOCK
      ?auto_622584 - BLOCK
      ?auto_622585 - BLOCK
    )
    :vars
    (
      ?auto_622586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622585 ?auto_622586 ) ( ON-TABLE ?auto_622574 ) ( ON ?auto_622575 ?auto_622574 ) ( ON ?auto_622576 ?auto_622575 ) ( ON ?auto_622577 ?auto_622576 ) ( ON ?auto_622578 ?auto_622577 ) ( ON ?auto_622579 ?auto_622578 ) ( ON ?auto_622580 ?auto_622579 ) ( ON ?auto_622581 ?auto_622580 ) ( not ( = ?auto_622574 ?auto_622575 ) ) ( not ( = ?auto_622574 ?auto_622576 ) ) ( not ( = ?auto_622574 ?auto_622577 ) ) ( not ( = ?auto_622574 ?auto_622578 ) ) ( not ( = ?auto_622574 ?auto_622579 ) ) ( not ( = ?auto_622574 ?auto_622580 ) ) ( not ( = ?auto_622574 ?auto_622581 ) ) ( not ( = ?auto_622574 ?auto_622582 ) ) ( not ( = ?auto_622574 ?auto_622583 ) ) ( not ( = ?auto_622574 ?auto_622584 ) ) ( not ( = ?auto_622574 ?auto_622585 ) ) ( not ( = ?auto_622574 ?auto_622586 ) ) ( not ( = ?auto_622575 ?auto_622576 ) ) ( not ( = ?auto_622575 ?auto_622577 ) ) ( not ( = ?auto_622575 ?auto_622578 ) ) ( not ( = ?auto_622575 ?auto_622579 ) ) ( not ( = ?auto_622575 ?auto_622580 ) ) ( not ( = ?auto_622575 ?auto_622581 ) ) ( not ( = ?auto_622575 ?auto_622582 ) ) ( not ( = ?auto_622575 ?auto_622583 ) ) ( not ( = ?auto_622575 ?auto_622584 ) ) ( not ( = ?auto_622575 ?auto_622585 ) ) ( not ( = ?auto_622575 ?auto_622586 ) ) ( not ( = ?auto_622576 ?auto_622577 ) ) ( not ( = ?auto_622576 ?auto_622578 ) ) ( not ( = ?auto_622576 ?auto_622579 ) ) ( not ( = ?auto_622576 ?auto_622580 ) ) ( not ( = ?auto_622576 ?auto_622581 ) ) ( not ( = ?auto_622576 ?auto_622582 ) ) ( not ( = ?auto_622576 ?auto_622583 ) ) ( not ( = ?auto_622576 ?auto_622584 ) ) ( not ( = ?auto_622576 ?auto_622585 ) ) ( not ( = ?auto_622576 ?auto_622586 ) ) ( not ( = ?auto_622577 ?auto_622578 ) ) ( not ( = ?auto_622577 ?auto_622579 ) ) ( not ( = ?auto_622577 ?auto_622580 ) ) ( not ( = ?auto_622577 ?auto_622581 ) ) ( not ( = ?auto_622577 ?auto_622582 ) ) ( not ( = ?auto_622577 ?auto_622583 ) ) ( not ( = ?auto_622577 ?auto_622584 ) ) ( not ( = ?auto_622577 ?auto_622585 ) ) ( not ( = ?auto_622577 ?auto_622586 ) ) ( not ( = ?auto_622578 ?auto_622579 ) ) ( not ( = ?auto_622578 ?auto_622580 ) ) ( not ( = ?auto_622578 ?auto_622581 ) ) ( not ( = ?auto_622578 ?auto_622582 ) ) ( not ( = ?auto_622578 ?auto_622583 ) ) ( not ( = ?auto_622578 ?auto_622584 ) ) ( not ( = ?auto_622578 ?auto_622585 ) ) ( not ( = ?auto_622578 ?auto_622586 ) ) ( not ( = ?auto_622579 ?auto_622580 ) ) ( not ( = ?auto_622579 ?auto_622581 ) ) ( not ( = ?auto_622579 ?auto_622582 ) ) ( not ( = ?auto_622579 ?auto_622583 ) ) ( not ( = ?auto_622579 ?auto_622584 ) ) ( not ( = ?auto_622579 ?auto_622585 ) ) ( not ( = ?auto_622579 ?auto_622586 ) ) ( not ( = ?auto_622580 ?auto_622581 ) ) ( not ( = ?auto_622580 ?auto_622582 ) ) ( not ( = ?auto_622580 ?auto_622583 ) ) ( not ( = ?auto_622580 ?auto_622584 ) ) ( not ( = ?auto_622580 ?auto_622585 ) ) ( not ( = ?auto_622580 ?auto_622586 ) ) ( not ( = ?auto_622581 ?auto_622582 ) ) ( not ( = ?auto_622581 ?auto_622583 ) ) ( not ( = ?auto_622581 ?auto_622584 ) ) ( not ( = ?auto_622581 ?auto_622585 ) ) ( not ( = ?auto_622581 ?auto_622586 ) ) ( not ( = ?auto_622582 ?auto_622583 ) ) ( not ( = ?auto_622582 ?auto_622584 ) ) ( not ( = ?auto_622582 ?auto_622585 ) ) ( not ( = ?auto_622582 ?auto_622586 ) ) ( not ( = ?auto_622583 ?auto_622584 ) ) ( not ( = ?auto_622583 ?auto_622585 ) ) ( not ( = ?auto_622583 ?auto_622586 ) ) ( not ( = ?auto_622584 ?auto_622585 ) ) ( not ( = ?auto_622584 ?auto_622586 ) ) ( not ( = ?auto_622585 ?auto_622586 ) ) ( ON ?auto_622584 ?auto_622585 ) ( ON ?auto_622583 ?auto_622584 ) ( CLEAR ?auto_622581 ) ( ON ?auto_622582 ?auto_622583 ) ( CLEAR ?auto_622582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_622574 ?auto_622575 ?auto_622576 ?auto_622577 ?auto_622578 ?auto_622579 ?auto_622580 ?auto_622581 ?auto_622582 )
      ( MAKE-12PILE ?auto_622574 ?auto_622575 ?auto_622576 ?auto_622577 ?auto_622578 ?auto_622579 ?auto_622580 ?auto_622581 ?auto_622582 ?auto_622583 ?auto_622584 ?auto_622585 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622624 - BLOCK
      ?auto_622625 - BLOCK
      ?auto_622626 - BLOCK
      ?auto_622627 - BLOCK
      ?auto_622628 - BLOCK
      ?auto_622629 - BLOCK
      ?auto_622630 - BLOCK
      ?auto_622631 - BLOCK
      ?auto_622632 - BLOCK
      ?auto_622633 - BLOCK
      ?auto_622634 - BLOCK
      ?auto_622635 - BLOCK
    )
    :vars
    (
      ?auto_622636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622635 ?auto_622636 ) ( ON-TABLE ?auto_622624 ) ( ON ?auto_622625 ?auto_622624 ) ( ON ?auto_622626 ?auto_622625 ) ( ON ?auto_622627 ?auto_622626 ) ( ON ?auto_622628 ?auto_622627 ) ( ON ?auto_622629 ?auto_622628 ) ( ON ?auto_622630 ?auto_622629 ) ( not ( = ?auto_622624 ?auto_622625 ) ) ( not ( = ?auto_622624 ?auto_622626 ) ) ( not ( = ?auto_622624 ?auto_622627 ) ) ( not ( = ?auto_622624 ?auto_622628 ) ) ( not ( = ?auto_622624 ?auto_622629 ) ) ( not ( = ?auto_622624 ?auto_622630 ) ) ( not ( = ?auto_622624 ?auto_622631 ) ) ( not ( = ?auto_622624 ?auto_622632 ) ) ( not ( = ?auto_622624 ?auto_622633 ) ) ( not ( = ?auto_622624 ?auto_622634 ) ) ( not ( = ?auto_622624 ?auto_622635 ) ) ( not ( = ?auto_622624 ?auto_622636 ) ) ( not ( = ?auto_622625 ?auto_622626 ) ) ( not ( = ?auto_622625 ?auto_622627 ) ) ( not ( = ?auto_622625 ?auto_622628 ) ) ( not ( = ?auto_622625 ?auto_622629 ) ) ( not ( = ?auto_622625 ?auto_622630 ) ) ( not ( = ?auto_622625 ?auto_622631 ) ) ( not ( = ?auto_622625 ?auto_622632 ) ) ( not ( = ?auto_622625 ?auto_622633 ) ) ( not ( = ?auto_622625 ?auto_622634 ) ) ( not ( = ?auto_622625 ?auto_622635 ) ) ( not ( = ?auto_622625 ?auto_622636 ) ) ( not ( = ?auto_622626 ?auto_622627 ) ) ( not ( = ?auto_622626 ?auto_622628 ) ) ( not ( = ?auto_622626 ?auto_622629 ) ) ( not ( = ?auto_622626 ?auto_622630 ) ) ( not ( = ?auto_622626 ?auto_622631 ) ) ( not ( = ?auto_622626 ?auto_622632 ) ) ( not ( = ?auto_622626 ?auto_622633 ) ) ( not ( = ?auto_622626 ?auto_622634 ) ) ( not ( = ?auto_622626 ?auto_622635 ) ) ( not ( = ?auto_622626 ?auto_622636 ) ) ( not ( = ?auto_622627 ?auto_622628 ) ) ( not ( = ?auto_622627 ?auto_622629 ) ) ( not ( = ?auto_622627 ?auto_622630 ) ) ( not ( = ?auto_622627 ?auto_622631 ) ) ( not ( = ?auto_622627 ?auto_622632 ) ) ( not ( = ?auto_622627 ?auto_622633 ) ) ( not ( = ?auto_622627 ?auto_622634 ) ) ( not ( = ?auto_622627 ?auto_622635 ) ) ( not ( = ?auto_622627 ?auto_622636 ) ) ( not ( = ?auto_622628 ?auto_622629 ) ) ( not ( = ?auto_622628 ?auto_622630 ) ) ( not ( = ?auto_622628 ?auto_622631 ) ) ( not ( = ?auto_622628 ?auto_622632 ) ) ( not ( = ?auto_622628 ?auto_622633 ) ) ( not ( = ?auto_622628 ?auto_622634 ) ) ( not ( = ?auto_622628 ?auto_622635 ) ) ( not ( = ?auto_622628 ?auto_622636 ) ) ( not ( = ?auto_622629 ?auto_622630 ) ) ( not ( = ?auto_622629 ?auto_622631 ) ) ( not ( = ?auto_622629 ?auto_622632 ) ) ( not ( = ?auto_622629 ?auto_622633 ) ) ( not ( = ?auto_622629 ?auto_622634 ) ) ( not ( = ?auto_622629 ?auto_622635 ) ) ( not ( = ?auto_622629 ?auto_622636 ) ) ( not ( = ?auto_622630 ?auto_622631 ) ) ( not ( = ?auto_622630 ?auto_622632 ) ) ( not ( = ?auto_622630 ?auto_622633 ) ) ( not ( = ?auto_622630 ?auto_622634 ) ) ( not ( = ?auto_622630 ?auto_622635 ) ) ( not ( = ?auto_622630 ?auto_622636 ) ) ( not ( = ?auto_622631 ?auto_622632 ) ) ( not ( = ?auto_622631 ?auto_622633 ) ) ( not ( = ?auto_622631 ?auto_622634 ) ) ( not ( = ?auto_622631 ?auto_622635 ) ) ( not ( = ?auto_622631 ?auto_622636 ) ) ( not ( = ?auto_622632 ?auto_622633 ) ) ( not ( = ?auto_622632 ?auto_622634 ) ) ( not ( = ?auto_622632 ?auto_622635 ) ) ( not ( = ?auto_622632 ?auto_622636 ) ) ( not ( = ?auto_622633 ?auto_622634 ) ) ( not ( = ?auto_622633 ?auto_622635 ) ) ( not ( = ?auto_622633 ?auto_622636 ) ) ( not ( = ?auto_622634 ?auto_622635 ) ) ( not ( = ?auto_622634 ?auto_622636 ) ) ( not ( = ?auto_622635 ?auto_622636 ) ) ( ON ?auto_622634 ?auto_622635 ) ( ON ?auto_622633 ?auto_622634 ) ( ON ?auto_622632 ?auto_622633 ) ( CLEAR ?auto_622630 ) ( ON ?auto_622631 ?auto_622632 ) ( CLEAR ?auto_622631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_622624 ?auto_622625 ?auto_622626 ?auto_622627 ?auto_622628 ?auto_622629 ?auto_622630 ?auto_622631 )
      ( MAKE-12PILE ?auto_622624 ?auto_622625 ?auto_622626 ?auto_622627 ?auto_622628 ?auto_622629 ?auto_622630 ?auto_622631 ?auto_622632 ?auto_622633 ?auto_622634 ?auto_622635 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622674 - BLOCK
      ?auto_622675 - BLOCK
      ?auto_622676 - BLOCK
      ?auto_622677 - BLOCK
      ?auto_622678 - BLOCK
      ?auto_622679 - BLOCK
      ?auto_622680 - BLOCK
      ?auto_622681 - BLOCK
      ?auto_622682 - BLOCK
      ?auto_622683 - BLOCK
      ?auto_622684 - BLOCK
      ?auto_622685 - BLOCK
    )
    :vars
    (
      ?auto_622686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622685 ?auto_622686 ) ( ON-TABLE ?auto_622674 ) ( ON ?auto_622675 ?auto_622674 ) ( ON ?auto_622676 ?auto_622675 ) ( ON ?auto_622677 ?auto_622676 ) ( ON ?auto_622678 ?auto_622677 ) ( ON ?auto_622679 ?auto_622678 ) ( not ( = ?auto_622674 ?auto_622675 ) ) ( not ( = ?auto_622674 ?auto_622676 ) ) ( not ( = ?auto_622674 ?auto_622677 ) ) ( not ( = ?auto_622674 ?auto_622678 ) ) ( not ( = ?auto_622674 ?auto_622679 ) ) ( not ( = ?auto_622674 ?auto_622680 ) ) ( not ( = ?auto_622674 ?auto_622681 ) ) ( not ( = ?auto_622674 ?auto_622682 ) ) ( not ( = ?auto_622674 ?auto_622683 ) ) ( not ( = ?auto_622674 ?auto_622684 ) ) ( not ( = ?auto_622674 ?auto_622685 ) ) ( not ( = ?auto_622674 ?auto_622686 ) ) ( not ( = ?auto_622675 ?auto_622676 ) ) ( not ( = ?auto_622675 ?auto_622677 ) ) ( not ( = ?auto_622675 ?auto_622678 ) ) ( not ( = ?auto_622675 ?auto_622679 ) ) ( not ( = ?auto_622675 ?auto_622680 ) ) ( not ( = ?auto_622675 ?auto_622681 ) ) ( not ( = ?auto_622675 ?auto_622682 ) ) ( not ( = ?auto_622675 ?auto_622683 ) ) ( not ( = ?auto_622675 ?auto_622684 ) ) ( not ( = ?auto_622675 ?auto_622685 ) ) ( not ( = ?auto_622675 ?auto_622686 ) ) ( not ( = ?auto_622676 ?auto_622677 ) ) ( not ( = ?auto_622676 ?auto_622678 ) ) ( not ( = ?auto_622676 ?auto_622679 ) ) ( not ( = ?auto_622676 ?auto_622680 ) ) ( not ( = ?auto_622676 ?auto_622681 ) ) ( not ( = ?auto_622676 ?auto_622682 ) ) ( not ( = ?auto_622676 ?auto_622683 ) ) ( not ( = ?auto_622676 ?auto_622684 ) ) ( not ( = ?auto_622676 ?auto_622685 ) ) ( not ( = ?auto_622676 ?auto_622686 ) ) ( not ( = ?auto_622677 ?auto_622678 ) ) ( not ( = ?auto_622677 ?auto_622679 ) ) ( not ( = ?auto_622677 ?auto_622680 ) ) ( not ( = ?auto_622677 ?auto_622681 ) ) ( not ( = ?auto_622677 ?auto_622682 ) ) ( not ( = ?auto_622677 ?auto_622683 ) ) ( not ( = ?auto_622677 ?auto_622684 ) ) ( not ( = ?auto_622677 ?auto_622685 ) ) ( not ( = ?auto_622677 ?auto_622686 ) ) ( not ( = ?auto_622678 ?auto_622679 ) ) ( not ( = ?auto_622678 ?auto_622680 ) ) ( not ( = ?auto_622678 ?auto_622681 ) ) ( not ( = ?auto_622678 ?auto_622682 ) ) ( not ( = ?auto_622678 ?auto_622683 ) ) ( not ( = ?auto_622678 ?auto_622684 ) ) ( not ( = ?auto_622678 ?auto_622685 ) ) ( not ( = ?auto_622678 ?auto_622686 ) ) ( not ( = ?auto_622679 ?auto_622680 ) ) ( not ( = ?auto_622679 ?auto_622681 ) ) ( not ( = ?auto_622679 ?auto_622682 ) ) ( not ( = ?auto_622679 ?auto_622683 ) ) ( not ( = ?auto_622679 ?auto_622684 ) ) ( not ( = ?auto_622679 ?auto_622685 ) ) ( not ( = ?auto_622679 ?auto_622686 ) ) ( not ( = ?auto_622680 ?auto_622681 ) ) ( not ( = ?auto_622680 ?auto_622682 ) ) ( not ( = ?auto_622680 ?auto_622683 ) ) ( not ( = ?auto_622680 ?auto_622684 ) ) ( not ( = ?auto_622680 ?auto_622685 ) ) ( not ( = ?auto_622680 ?auto_622686 ) ) ( not ( = ?auto_622681 ?auto_622682 ) ) ( not ( = ?auto_622681 ?auto_622683 ) ) ( not ( = ?auto_622681 ?auto_622684 ) ) ( not ( = ?auto_622681 ?auto_622685 ) ) ( not ( = ?auto_622681 ?auto_622686 ) ) ( not ( = ?auto_622682 ?auto_622683 ) ) ( not ( = ?auto_622682 ?auto_622684 ) ) ( not ( = ?auto_622682 ?auto_622685 ) ) ( not ( = ?auto_622682 ?auto_622686 ) ) ( not ( = ?auto_622683 ?auto_622684 ) ) ( not ( = ?auto_622683 ?auto_622685 ) ) ( not ( = ?auto_622683 ?auto_622686 ) ) ( not ( = ?auto_622684 ?auto_622685 ) ) ( not ( = ?auto_622684 ?auto_622686 ) ) ( not ( = ?auto_622685 ?auto_622686 ) ) ( ON ?auto_622684 ?auto_622685 ) ( ON ?auto_622683 ?auto_622684 ) ( ON ?auto_622682 ?auto_622683 ) ( ON ?auto_622681 ?auto_622682 ) ( CLEAR ?auto_622679 ) ( ON ?auto_622680 ?auto_622681 ) ( CLEAR ?auto_622680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_622674 ?auto_622675 ?auto_622676 ?auto_622677 ?auto_622678 ?auto_622679 ?auto_622680 )
      ( MAKE-12PILE ?auto_622674 ?auto_622675 ?auto_622676 ?auto_622677 ?auto_622678 ?auto_622679 ?auto_622680 ?auto_622681 ?auto_622682 ?auto_622683 ?auto_622684 ?auto_622685 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622724 - BLOCK
      ?auto_622725 - BLOCK
      ?auto_622726 - BLOCK
      ?auto_622727 - BLOCK
      ?auto_622728 - BLOCK
      ?auto_622729 - BLOCK
      ?auto_622730 - BLOCK
      ?auto_622731 - BLOCK
      ?auto_622732 - BLOCK
      ?auto_622733 - BLOCK
      ?auto_622734 - BLOCK
      ?auto_622735 - BLOCK
    )
    :vars
    (
      ?auto_622736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622735 ?auto_622736 ) ( ON-TABLE ?auto_622724 ) ( ON ?auto_622725 ?auto_622724 ) ( ON ?auto_622726 ?auto_622725 ) ( ON ?auto_622727 ?auto_622726 ) ( ON ?auto_622728 ?auto_622727 ) ( not ( = ?auto_622724 ?auto_622725 ) ) ( not ( = ?auto_622724 ?auto_622726 ) ) ( not ( = ?auto_622724 ?auto_622727 ) ) ( not ( = ?auto_622724 ?auto_622728 ) ) ( not ( = ?auto_622724 ?auto_622729 ) ) ( not ( = ?auto_622724 ?auto_622730 ) ) ( not ( = ?auto_622724 ?auto_622731 ) ) ( not ( = ?auto_622724 ?auto_622732 ) ) ( not ( = ?auto_622724 ?auto_622733 ) ) ( not ( = ?auto_622724 ?auto_622734 ) ) ( not ( = ?auto_622724 ?auto_622735 ) ) ( not ( = ?auto_622724 ?auto_622736 ) ) ( not ( = ?auto_622725 ?auto_622726 ) ) ( not ( = ?auto_622725 ?auto_622727 ) ) ( not ( = ?auto_622725 ?auto_622728 ) ) ( not ( = ?auto_622725 ?auto_622729 ) ) ( not ( = ?auto_622725 ?auto_622730 ) ) ( not ( = ?auto_622725 ?auto_622731 ) ) ( not ( = ?auto_622725 ?auto_622732 ) ) ( not ( = ?auto_622725 ?auto_622733 ) ) ( not ( = ?auto_622725 ?auto_622734 ) ) ( not ( = ?auto_622725 ?auto_622735 ) ) ( not ( = ?auto_622725 ?auto_622736 ) ) ( not ( = ?auto_622726 ?auto_622727 ) ) ( not ( = ?auto_622726 ?auto_622728 ) ) ( not ( = ?auto_622726 ?auto_622729 ) ) ( not ( = ?auto_622726 ?auto_622730 ) ) ( not ( = ?auto_622726 ?auto_622731 ) ) ( not ( = ?auto_622726 ?auto_622732 ) ) ( not ( = ?auto_622726 ?auto_622733 ) ) ( not ( = ?auto_622726 ?auto_622734 ) ) ( not ( = ?auto_622726 ?auto_622735 ) ) ( not ( = ?auto_622726 ?auto_622736 ) ) ( not ( = ?auto_622727 ?auto_622728 ) ) ( not ( = ?auto_622727 ?auto_622729 ) ) ( not ( = ?auto_622727 ?auto_622730 ) ) ( not ( = ?auto_622727 ?auto_622731 ) ) ( not ( = ?auto_622727 ?auto_622732 ) ) ( not ( = ?auto_622727 ?auto_622733 ) ) ( not ( = ?auto_622727 ?auto_622734 ) ) ( not ( = ?auto_622727 ?auto_622735 ) ) ( not ( = ?auto_622727 ?auto_622736 ) ) ( not ( = ?auto_622728 ?auto_622729 ) ) ( not ( = ?auto_622728 ?auto_622730 ) ) ( not ( = ?auto_622728 ?auto_622731 ) ) ( not ( = ?auto_622728 ?auto_622732 ) ) ( not ( = ?auto_622728 ?auto_622733 ) ) ( not ( = ?auto_622728 ?auto_622734 ) ) ( not ( = ?auto_622728 ?auto_622735 ) ) ( not ( = ?auto_622728 ?auto_622736 ) ) ( not ( = ?auto_622729 ?auto_622730 ) ) ( not ( = ?auto_622729 ?auto_622731 ) ) ( not ( = ?auto_622729 ?auto_622732 ) ) ( not ( = ?auto_622729 ?auto_622733 ) ) ( not ( = ?auto_622729 ?auto_622734 ) ) ( not ( = ?auto_622729 ?auto_622735 ) ) ( not ( = ?auto_622729 ?auto_622736 ) ) ( not ( = ?auto_622730 ?auto_622731 ) ) ( not ( = ?auto_622730 ?auto_622732 ) ) ( not ( = ?auto_622730 ?auto_622733 ) ) ( not ( = ?auto_622730 ?auto_622734 ) ) ( not ( = ?auto_622730 ?auto_622735 ) ) ( not ( = ?auto_622730 ?auto_622736 ) ) ( not ( = ?auto_622731 ?auto_622732 ) ) ( not ( = ?auto_622731 ?auto_622733 ) ) ( not ( = ?auto_622731 ?auto_622734 ) ) ( not ( = ?auto_622731 ?auto_622735 ) ) ( not ( = ?auto_622731 ?auto_622736 ) ) ( not ( = ?auto_622732 ?auto_622733 ) ) ( not ( = ?auto_622732 ?auto_622734 ) ) ( not ( = ?auto_622732 ?auto_622735 ) ) ( not ( = ?auto_622732 ?auto_622736 ) ) ( not ( = ?auto_622733 ?auto_622734 ) ) ( not ( = ?auto_622733 ?auto_622735 ) ) ( not ( = ?auto_622733 ?auto_622736 ) ) ( not ( = ?auto_622734 ?auto_622735 ) ) ( not ( = ?auto_622734 ?auto_622736 ) ) ( not ( = ?auto_622735 ?auto_622736 ) ) ( ON ?auto_622734 ?auto_622735 ) ( ON ?auto_622733 ?auto_622734 ) ( ON ?auto_622732 ?auto_622733 ) ( ON ?auto_622731 ?auto_622732 ) ( ON ?auto_622730 ?auto_622731 ) ( CLEAR ?auto_622728 ) ( ON ?auto_622729 ?auto_622730 ) ( CLEAR ?auto_622729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_622724 ?auto_622725 ?auto_622726 ?auto_622727 ?auto_622728 ?auto_622729 )
      ( MAKE-12PILE ?auto_622724 ?auto_622725 ?auto_622726 ?auto_622727 ?auto_622728 ?auto_622729 ?auto_622730 ?auto_622731 ?auto_622732 ?auto_622733 ?auto_622734 ?auto_622735 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622774 - BLOCK
      ?auto_622775 - BLOCK
      ?auto_622776 - BLOCK
      ?auto_622777 - BLOCK
      ?auto_622778 - BLOCK
      ?auto_622779 - BLOCK
      ?auto_622780 - BLOCK
      ?auto_622781 - BLOCK
      ?auto_622782 - BLOCK
      ?auto_622783 - BLOCK
      ?auto_622784 - BLOCK
      ?auto_622785 - BLOCK
    )
    :vars
    (
      ?auto_622786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622785 ?auto_622786 ) ( ON-TABLE ?auto_622774 ) ( ON ?auto_622775 ?auto_622774 ) ( ON ?auto_622776 ?auto_622775 ) ( ON ?auto_622777 ?auto_622776 ) ( not ( = ?auto_622774 ?auto_622775 ) ) ( not ( = ?auto_622774 ?auto_622776 ) ) ( not ( = ?auto_622774 ?auto_622777 ) ) ( not ( = ?auto_622774 ?auto_622778 ) ) ( not ( = ?auto_622774 ?auto_622779 ) ) ( not ( = ?auto_622774 ?auto_622780 ) ) ( not ( = ?auto_622774 ?auto_622781 ) ) ( not ( = ?auto_622774 ?auto_622782 ) ) ( not ( = ?auto_622774 ?auto_622783 ) ) ( not ( = ?auto_622774 ?auto_622784 ) ) ( not ( = ?auto_622774 ?auto_622785 ) ) ( not ( = ?auto_622774 ?auto_622786 ) ) ( not ( = ?auto_622775 ?auto_622776 ) ) ( not ( = ?auto_622775 ?auto_622777 ) ) ( not ( = ?auto_622775 ?auto_622778 ) ) ( not ( = ?auto_622775 ?auto_622779 ) ) ( not ( = ?auto_622775 ?auto_622780 ) ) ( not ( = ?auto_622775 ?auto_622781 ) ) ( not ( = ?auto_622775 ?auto_622782 ) ) ( not ( = ?auto_622775 ?auto_622783 ) ) ( not ( = ?auto_622775 ?auto_622784 ) ) ( not ( = ?auto_622775 ?auto_622785 ) ) ( not ( = ?auto_622775 ?auto_622786 ) ) ( not ( = ?auto_622776 ?auto_622777 ) ) ( not ( = ?auto_622776 ?auto_622778 ) ) ( not ( = ?auto_622776 ?auto_622779 ) ) ( not ( = ?auto_622776 ?auto_622780 ) ) ( not ( = ?auto_622776 ?auto_622781 ) ) ( not ( = ?auto_622776 ?auto_622782 ) ) ( not ( = ?auto_622776 ?auto_622783 ) ) ( not ( = ?auto_622776 ?auto_622784 ) ) ( not ( = ?auto_622776 ?auto_622785 ) ) ( not ( = ?auto_622776 ?auto_622786 ) ) ( not ( = ?auto_622777 ?auto_622778 ) ) ( not ( = ?auto_622777 ?auto_622779 ) ) ( not ( = ?auto_622777 ?auto_622780 ) ) ( not ( = ?auto_622777 ?auto_622781 ) ) ( not ( = ?auto_622777 ?auto_622782 ) ) ( not ( = ?auto_622777 ?auto_622783 ) ) ( not ( = ?auto_622777 ?auto_622784 ) ) ( not ( = ?auto_622777 ?auto_622785 ) ) ( not ( = ?auto_622777 ?auto_622786 ) ) ( not ( = ?auto_622778 ?auto_622779 ) ) ( not ( = ?auto_622778 ?auto_622780 ) ) ( not ( = ?auto_622778 ?auto_622781 ) ) ( not ( = ?auto_622778 ?auto_622782 ) ) ( not ( = ?auto_622778 ?auto_622783 ) ) ( not ( = ?auto_622778 ?auto_622784 ) ) ( not ( = ?auto_622778 ?auto_622785 ) ) ( not ( = ?auto_622778 ?auto_622786 ) ) ( not ( = ?auto_622779 ?auto_622780 ) ) ( not ( = ?auto_622779 ?auto_622781 ) ) ( not ( = ?auto_622779 ?auto_622782 ) ) ( not ( = ?auto_622779 ?auto_622783 ) ) ( not ( = ?auto_622779 ?auto_622784 ) ) ( not ( = ?auto_622779 ?auto_622785 ) ) ( not ( = ?auto_622779 ?auto_622786 ) ) ( not ( = ?auto_622780 ?auto_622781 ) ) ( not ( = ?auto_622780 ?auto_622782 ) ) ( not ( = ?auto_622780 ?auto_622783 ) ) ( not ( = ?auto_622780 ?auto_622784 ) ) ( not ( = ?auto_622780 ?auto_622785 ) ) ( not ( = ?auto_622780 ?auto_622786 ) ) ( not ( = ?auto_622781 ?auto_622782 ) ) ( not ( = ?auto_622781 ?auto_622783 ) ) ( not ( = ?auto_622781 ?auto_622784 ) ) ( not ( = ?auto_622781 ?auto_622785 ) ) ( not ( = ?auto_622781 ?auto_622786 ) ) ( not ( = ?auto_622782 ?auto_622783 ) ) ( not ( = ?auto_622782 ?auto_622784 ) ) ( not ( = ?auto_622782 ?auto_622785 ) ) ( not ( = ?auto_622782 ?auto_622786 ) ) ( not ( = ?auto_622783 ?auto_622784 ) ) ( not ( = ?auto_622783 ?auto_622785 ) ) ( not ( = ?auto_622783 ?auto_622786 ) ) ( not ( = ?auto_622784 ?auto_622785 ) ) ( not ( = ?auto_622784 ?auto_622786 ) ) ( not ( = ?auto_622785 ?auto_622786 ) ) ( ON ?auto_622784 ?auto_622785 ) ( ON ?auto_622783 ?auto_622784 ) ( ON ?auto_622782 ?auto_622783 ) ( ON ?auto_622781 ?auto_622782 ) ( ON ?auto_622780 ?auto_622781 ) ( ON ?auto_622779 ?auto_622780 ) ( CLEAR ?auto_622777 ) ( ON ?auto_622778 ?auto_622779 ) ( CLEAR ?auto_622778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_622774 ?auto_622775 ?auto_622776 ?auto_622777 ?auto_622778 )
      ( MAKE-12PILE ?auto_622774 ?auto_622775 ?auto_622776 ?auto_622777 ?auto_622778 ?auto_622779 ?auto_622780 ?auto_622781 ?auto_622782 ?auto_622783 ?auto_622784 ?auto_622785 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622824 - BLOCK
      ?auto_622825 - BLOCK
      ?auto_622826 - BLOCK
      ?auto_622827 - BLOCK
      ?auto_622828 - BLOCK
      ?auto_622829 - BLOCK
      ?auto_622830 - BLOCK
      ?auto_622831 - BLOCK
      ?auto_622832 - BLOCK
      ?auto_622833 - BLOCK
      ?auto_622834 - BLOCK
      ?auto_622835 - BLOCK
    )
    :vars
    (
      ?auto_622836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622835 ?auto_622836 ) ( ON-TABLE ?auto_622824 ) ( ON ?auto_622825 ?auto_622824 ) ( ON ?auto_622826 ?auto_622825 ) ( not ( = ?auto_622824 ?auto_622825 ) ) ( not ( = ?auto_622824 ?auto_622826 ) ) ( not ( = ?auto_622824 ?auto_622827 ) ) ( not ( = ?auto_622824 ?auto_622828 ) ) ( not ( = ?auto_622824 ?auto_622829 ) ) ( not ( = ?auto_622824 ?auto_622830 ) ) ( not ( = ?auto_622824 ?auto_622831 ) ) ( not ( = ?auto_622824 ?auto_622832 ) ) ( not ( = ?auto_622824 ?auto_622833 ) ) ( not ( = ?auto_622824 ?auto_622834 ) ) ( not ( = ?auto_622824 ?auto_622835 ) ) ( not ( = ?auto_622824 ?auto_622836 ) ) ( not ( = ?auto_622825 ?auto_622826 ) ) ( not ( = ?auto_622825 ?auto_622827 ) ) ( not ( = ?auto_622825 ?auto_622828 ) ) ( not ( = ?auto_622825 ?auto_622829 ) ) ( not ( = ?auto_622825 ?auto_622830 ) ) ( not ( = ?auto_622825 ?auto_622831 ) ) ( not ( = ?auto_622825 ?auto_622832 ) ) ( not ( = ?auto_622825 ?auto_622833 ) ) ( not ( = ?auto_622825 ?auto_622834 ) ) ( not ( = ?auto_622825 ?auto_622835 ) ) ( not ( = ?auto_622825 ?auto_622836 ) ) ( not ( = ?auto_622826 ?auto_622827 ) ) ( not ( = ?auto_622826 ?auto_622828 ) ) ( not ( = ?auto_622826 ?auto_622829 ) ) ( not ( = ?auto_622826 ?auto_622830 ) ) ( not ( = ?auto_622826 ?auto_622831 ) ) ( not ( = ?auto_622826 ?auto_622832 ) ) ( not ( = ?auto_622826 ?auto_622833 ) ) ( not ( = ?auto_622826 ?auto_622834 ) ) ( not ( = ?auto_622826 ?auto_622835 ) ) ( not ( = ?auto_622826 ?auto_622836 ) ) ( not ( = ?auto_622827 ?auto_622828 ) ) ( not ( = ?auto_622827 ?auto_622829 ) ) ( not ( = ?auto_622827 ?auto_622830 ) ) ( not ( = ?auto_622827 ?auto_622831 ) ) ( not ( = ?auto_622827 ?auto_622832 ) ) ( not ( = ?auto_622827 ?auto_622833 ) ) ( not ( = ?auto_622827 ?auto_622834 ) ) ( not ( = ?auto_622827 ?auto_622835 ) ) ( not ( = ?auto_622827 ?auto_622836 ) ) ( not ( = ?auto_622828 ?auto_622829 ) ) ( not ( = ?auto_622828 ?auto_622830 ) ) ( not ( = ?auto_622828 ?auto_622831 ) ) ( not ( = ?auto_622828 ?auto_622832 ) ) ( not ( = ?auto_622828 ?auto_622833 ) ) ( not ( = ?auto_622828 ?auto_622834 ) ) ( not ( = ?auto_622828 ?auto_622835 ) ) ( not ( = ?auto_622828 ?auto_622836 ) ) ( not ( = ?auto_622829 ?auto_622830 ) ) ( not ( = ?auto_622829 ?auto_622831 ) ) ( not ( = ?auto_622829 ?auto_622832 ) ) ( not ( = ?auto_622829 ?auto_622833 ) ) ( not ( = ?auto_622829 ?auto_622834 ) ) ( not ( = ?auto_622829 ?auto_622835 ) ) ( not ( = ?auto_622829 ?auto_622836 ) ) ( not ( = ?auto_622830 ?auto_622831 ) ) ( not ( = ?auto_622830 ?auto_622832 ) ) ( not ( = ?auto_622830 ?auto_622833 ) ) ( not ( = ?auto_622830 ?auto_622834 ) ) ( not ( = ?auto_622830 ?auto_622835 ) ) ( not ( = ?auto_622830 ?auto_622836 ) ) ( not ( = ?auto_622831 ?auto_622832 ) ) ( not ( = ?auto_622831 ?auto_622833 ) ) ( not ( = ?auto_622831 ?auto_622834 ) ) ( not ( = ?auto_622831 ?auto_622835 ) ) ( not ( = ?auto_622831 ?auto_622836 ) ) ( not ( = ?auto_622832 ?auto_622833 ) ) ( not ( = ?auto_622832 ?auto_622834 ) ) ( not ( = ?auto_622832 ?auto_622835 ) ) ( not ( = ?auto_622832 ?auto_622836 ) ) ( not ( = ?auto_622833 ?auto_622834 ) ) ( not ( = ?auto_622833 ?auto_622835 ) ) ( not ( = ?auto_622833 ?auto_622836 ) ) ( not ( = ?auto_622834 ?auto_622835 ) ) ( not ( = ?auto_622834 ?auto_622836 ) ) ( not ( = ?auto_622835 ?auto_622836 ) ) ( ON ?auto_622834 ?auto_622835 ) ( ON ?auto_622833 ?auto_622834 ) ( ON ?auto_622832 ?auto_622833 ) ( ON ?auto_622831 ?auto_622832 ) ( ON ?auto_622830 ?auto_622831 ) ( ON ?auto_622829 ?auto_622830 ) ( ON ?auto_622828 ?auto_622829 ) ( CLEAR ?auto_622826 ) ( ON ?auto_622827 ?auto_622828 ) ( CLEAR ?auto_622827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_622824 ?auto_622825 ?auto_622826 ?auto_622827 )
      ( MAKE-12PILE ?auto_622824 ?auto_622825 ?auto_622826 ?auto_622827 ?auto_622828 ?auto_622829 ?auto_622830 ?auto_622831 ?auto_622832 ?auto_622833 ?auto_622834 ?auto_622835 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622874 - BLOCK
      ?auto_622875 - BLOCK
      ?auto_622876 - BLOCK
      ?auto_622877 - BLOCK
      ?auto_622878 - BLOCK
      ?auto_622879 - BLOCK
      ?auto_622880 - BLOCK
      ?auto_622881 - BLOCK
      ?auto_622882 - BLOCK
      ?auto_622883 - BLOCK
      ?auto_622884 - BLOCK
      ?auto_622885 - BLOCK
    )
    :vars
    (
      ?auto_622886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622885 ?auto_622886 ) ( ON-TABLE ?auto_622874 ) ( ON ?auto_622875 ?auto_622874 ) ( not ( = ?auto_622874 ?auto_622875 ) ) ( not ( = ?auto_622874 ?auto_622876 ) ) ( not ( = ?auto_622874 ?auto_622877 ) ) ( not ( = ?auto_622874 ?auto_622878 ) ) ( not ( = ?auto_622874 ?auto_622879 ) ) ( not ( = ?auto_622874 ?auto_622880 ) ) ( not ( = ?auto_622874 ?auto_622881 ) ) ( not ( = ?auto_622874 ?auto_622882 ) ) ( not ( = ?auto_622874 ?auto_622883 ) ) ( not ( = ?auto_622874 ?auto_622884 ) ) ( not ( = ?auto_622874 ?auto_622885 ) ) ( not ( = ?auto_622874 ?auto_622886 ) ) ( not ( = ?auto_622875 ?auto_622876 ) ) ( not ( = ?auto_622875 ?auto_622877 ) ) ( not ( = ?auto_622875 ?auto_622878 ) ) ( not ( = ?auto_622875 ?auto_622879 ) ) ( not ( = ?auto_622875 ?auto_622880 ) ) ( not ( = ?auto_622875 ?auto_622881 ) ) ( not ( = ?auto_622875 ?auto_622882 ) ) ( not ( = ?auto_622875 ?auto_622883 ) ) ( not ( = ?auto_622875 ?auto_622884 ) ) ( not ( = ?auto_622875 ?auto_622885 ) ) ( not ( = ?auto_622875 ?auto_622886 ) ) ( not ( = ?auto_622876 ?auto_622877 ) ) ( not ( = ?auto_622876 ?auto_622878 ) ) ( not ( = ?auto_622876 ?auto_622879 ) ) ( not ( = ?auto_622876 ?auto_622880 ) ) ( not ( = ?auto_622876 ?auto_622881 ) ) ( not ( = ?auto_622876 ?auto_622882 ) ) ( not ( = ?auto_622876 ?auto_622883 ) ) ( not ( = ?auto_622876 ?auto_622884 ) ) ( not ( = ?auto_622876 ?auto_622885 ) ) ( not ( = ?auto_622876 ?auto_622886 ) ) ( not ( = ?auto_622877 ?auto_622878 ) ) ( not ( = ?auto_622877 ?auto_622879 ) ) ( not ( = ?auto_622877 ?auto_622880 ) ) ( not ( = ?auto_622877 ?auto_622881 ) ) ( not ( = ?auto_622877 ?auto_622882 ) ) ( not ( = ?auto_622877 ?auto_622883 ) ) ( not ( = ?auto_622877 ?auto_622884 ) ) ( not ( = ?auto_622877 ?auto_622885 ) ) ( not ( = ?auto_622877 ?auto_622886 ) ) ( not ( = ?auto_622878 ?auto_622879 ) ) ( not ( = ?auto_622878 ?auto_622880 ) ) ( not ( = ?auto_622878 ?auto_622881 ) ) ( not ( = ?auto_622878 ?auto_622882 ) ) ( not ( = ?auto_622878 ?auto_622883 ) ) ( not ( = ?auto_622878 ?auto_622884 ) ) ( not ( = ?auto_622878 ?auto_622885 ) ) ( not ( = ?auto_622878 ?auto_622886 ) ) ( not ( = ?auto_622879 ?auto_622880 ) ) ( not ( = ?auto_622879 ?auto_622881 ) ) ( not ( = ?auto_622879 ?auto_622882 ) ) ( not ( = ?auto_622879 ?auto_622883 ) ) ( not ( = ?auto_622879 ?auto_622884 ) ) ( not ( = ?auto_622879 ?auto_622885 ) ) ( not ( = ?auto_622879 ?auto_622886 ) ) ( not ( = ?auto_622880 ?auto_622881 ) ) ( not ( = ?auto_622880 ?auto_622882 ) ) ( not ( = ?auto_622880 ?auto_622883 ) ) ( not ( = ?auto_622880 ?auto_622884 ) ) ( not ( = ?auto_622880 ?auto_622885 ) ) ( not ( = ?auto_622880 ?auto_622886 ) ) ( not ( = ?auto_622881 ?auto_622882 ) ) ( not ( = ?auto_622881 ?auto_622883 ) ) ( not ( = ?auto_622881 ?auto_622884 ) ) ( not ( = ?auto_622881 ?auto_622885 ) ) ( not ( = ?auto_622881 ?auto_622886 ) ) ( not ( = ?auto_622882 ?auto_622883 ) ) ( not ( = ?auto_622882 ?auto_622884 ) ) ( not ( = ?auto_622882 ?auto_622885 ) ) ( not ( = ?auto_622882 ?auto_622886 ) ) ( not ( = ?auto_622883 ?auto_622884 ) ) ( not ( = ?auto_622883 ?auto_622885 ) ) ( not ( = ?auto_622883 ?auto_622886 ) ) ( not ( = ?auto_622884 ?auto_622885 ) ) ( not ( = ?auto_622884 ?auto_622886 ) ) ( not ( = ?auto_622885 ?auto_622886 ) ) ( ON ?auto_622884 ?auto_622885 ) ( ON ?auto_622883 ?auto_622884 ) ( ON ?auto_622882 ?auto_622883 ) ( ON ?auto_622881 ?auto_622882 ) ( ON ?auto_622880 ?auto_622881 ) ( ON ?auto_622879 ?auto_622880 ) ( ON ?auto_622878 ?auto_622879 ) ( ON ?auto_622877 ?auto_622878 ) ( CLEAR ?auto_622875 ) ( ON ?auto_622876 ?auto_622877 ) ( CLEAR ?auto_622876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_622874 ?auto_622875 ?auto_622876 )
      ( MAKE-12PILE ?auto_622874 ?auto_622875 ?auto_622876 ?auto_622877 ?auto_622878 ?auto_622879 ?auto_622880 ?auto_622881 ?auto_622882 ?auto_622883 ?auto_622884 ?auto_622885 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622924 - BLOCK
      ?auto_622925 - BLOCK
      ?auto_622926 - BLOCK
      ?auto_622927 - BLOCK
      ?auto_622928 - BLOCK
      ?auto_622929 - BLOCK
      ?auto_622930 - BLOCK
      ?auto_622931 - BLOCK
      ?auto_622932 - BLOCK
      ?auto_622933 - BLOCK
      ?auto_622934 - BLOCK
      ?auto_622935 - BLOCK
    )
    :vars
    (
      ?auto_622936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622935 ?auto_622936 ) ( ON-TABLE ?auto_622924 ) ( not ( = ?auto_622924 ?auto_622925 ) ) ( not ( = ?auto_622924 ?auto_622926 ) ) ( not ( = ?auto_622924 ?auto_622927 ) ) ( not ( = ?auto_622924 ?auto_622928 ) ) ( not ( = ?auto_622924 ?auto_622929 ) ) ( not ( = ?auto_622924 ?auto_622930 ) ) ( not ( = ?auto_622924 ?auto_622931 ) ) ( not ( = ?auto_622924 ?auto_622932 ) ) ( not ( = ?auto_622924 ?auto_622933 ) ) ( not ( = ?auto_622924 ?auto_622934 ) ) ( not ( = ?auto_622924 ?auto_622935 ) ) ( not ( = ?auto_622924 ?auto_622936 ) ) ( not ( = ?auto_622925 ?auto_622926 ) ) ( not ( = ?auto_622925 ?auto_622927 ) ) ( not ( = ?auto_622925 ?auto_622928 ) ) ( not ( = ?auto_622925 ?auto_622929 ) ) ( not ( = ?auto_622925 ?auto_622930 ) ) ( not ( = ?auto_622925 ?auto_622931 ) ) ( not ( = ?auto_622925 ?auto_622932 ) ) ( not ( = ?auto_622925 ?auto_622933 ) ) ( not ( = ?auto_622925 ?auto_622934 ) ) ( not ( = ?auto_622925 ?auto_622935 ) ) ( not ( = ?auto_622925 ?auto_622936 ) ) ( not ( = ?auto_622926 ?auto_622927 ) ) ( not ( = ?auto_622926 ?auto_622928 ) ) ( not ( = ?auto_622926 ?auto_622929 ) ) ( not ( = ?auto_622926 ?auto_622930 ) ) ( not ( = ?auto_622926 ?auto_622931 ) ) ( not ( = ?auto_622926 ?auto_622932 ) ) ( not ( = ?auto_622926 ?auto_622933 ) ) ( not ( = ?auto_622926 ?auto_622934 ) ) ( not ( = ?auto_622926 ?auto_622935 ) ) ( not ( = ?auto_622926 ?auto_622936 ) ) ( not ( = ?auto_622927 ?auto_622928 ) ) ( not ( = ?auto_622927 ?auto_622929 ) ) ( not ( = ?auto_622927 ?auto_622930 ) ) ( not ( = ?auto_622927 ?auto_622931 ) ) ( not ( = ?auto_622927 ?auto_622932 ) ) ( not ( = ?auto_622927 ?auto_622933 ) ) ( not ( = ?auto_622927 ?auto_622934 ) ) ( not ( = ?auto_622927 ?auto_622935 ) ) ( not ( = ?auto_622927 ?auto_622936 ) ) ( not ( = ?auto_622928 ?auto_622929 ) ) ( not ( = ?auto_622928 ?auto_622930 ) ) ( not ( = ?auto_622928 ?auto_622931 ) ) ( not ( = ?auto_622928 ?auto_622932 ) ) ( not ( = ?auto_622928 ?auto_622933 ) ) ( not ( = ?auto_622928 ?auto_622934 ) ) ( not ( = ?auto_622928 ?auto_622935 ) ) ( not ( = ?auto_622928 ?auto_622936 ) ) ( not ( = ?auto_622929 ?auto_622930 ) ) ( not ( = ?auto_622929 ?auto_622931 ) ) ( not ( = ?auto_622929 ?auto_622932 ) ) ( not ( = ?auto_622929 ?auto_622933 ) ) ( not ( = ?auto_622929 ?auto_622934 ) ) ( not ( = ?auto_622929 ?auto_622935 ) ) ( not ( = ?auto_622929 ?auto_622936 ) ) ( not ( = ?auto_622930 ?auto_622931 ) ) ( not ( = ?auto_622930 ?auto_622932 ) ) ( not ( = ?auto_622930 ?auto_622933 ) ) ( not ( = ?auto_622930 ?auto_622934 ) ) ( not ( = ?auto_622930 ?auto_622935 ) ) ( not ( = ?auto_622930 ?auto_622936 ) ) ( not ( = ?auto_622931 ?auto_622932 ) ) ( not ( = ?auto_622931 ?auto_622933 ) ) ( not ( = ?auto_622931 ?auto_622934 ) ) ( not ( = ?auto_622931 ?auto_622935 ) ) ( not ( = ?auto_622931 ?auto_622936 ) ) ( not ( = ?auto_622932 ?auto_622933 ) ) ( not ( = ?auto_622932 ?auto_622934 ) ) ( not ( = ?auto_622932 ?auto_622935 ) ) ( not ( = ?auto_622932 ?auto_622936 ) ) ( not ( = ?auto_622933 ?auto_622934 ) ) ( not ( = ?auto_622933 ?auto_622935 ) ) ( not ( = ?auto_622933 ?auto_622936 ) ) ( not ( = ?auto_622934 ?auto_622935 ) ) ( not ( = ?auto_622934 ?auto_622936 ) ) ( not ( = ?auto_622935 ?auto_622936 ) ) ( ON ?auto_622934 ?auto_622935 ) ( ON ?auto_622933 ?auto_622934 ) ( ON ?auto_622932 ?auto_622933 ) ( ON ?auto_622931 ?auto_622932 ) ( ON ?auto_622930 ?auto_622931 ) ( ON ?auto_622929 ?auto_622930 ) ( ON ?auto_622928 ?auto_622929 ) ( ON ?auto_622927 ?auto_622928 ) ( ON ?auto_622926 ?auto_622927 ) ( CLEAR ?auto_622924 ) ( ON ?auto_622925 ?auto_622926 ) ( CLEAR ?auto_622925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_622924 ?auto_622925 )
      ( MAKE-12PILE ?auto_622924 ?auto_622925 ?auto_622926 ?auto_622927 ?auto_622928 ?auto_622929 ?auto_622930 ?auto_622931 ?auto_622932 ?auto_622933 ?auto_622934 ?auto_622935 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_622974 - BLOCK
      ?auto_622975 - BLOCK
      ?auto_622976 - BLOCK
      ?auto_622977 - BLOCK
      ?auto_622978 - BLOCK
      ?auto_622979 - BLOCK
      ?auto_622980 - BLOCK
      ?auto_622981 - BLOCK
      ?auto_622982 - BLOCK
      ?auto_622983 - BLOCK
      ?auto_622984 - BLOCK
      ?auto_622985 - BLOCK
    )
    :vars
    (
      ?auto_622986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_622985 ?auto_622986 ) ( not ( = ?auto_622974 ?auto_622975 ) ) ( not ( = ?auto_622974 ?auto_622976 ) ) ( not ( = ?auto_622974 ?auto_622977 ) ) ( not ( = ?auto_622974 ?auto_622978 ) ) ( not ( = ?auto_622974 ?auto_622979 ) ) ( not ( = ?auto_622974 ?auto_622980 ) ) ( not ( = ?auto_622974 ?auto_622981 ) ) ( not ( = ?auto_622974 ?auto_622982 ) ) ( not ( = ?auto_622974 ?auto_622983 ) ) ( not ( = ?auto_622974 ?auto_622984 ) ) ( not ( = ?auto_622974 ?auto_622985 ) ) ( not ( = ?auto_622974 ?auto_622986 ) ) ( not ( = ?auto_622975 ?auto_622976 ) ) ( not ( = ?auto_622975 ?auto_622977 ) ) ( not ( = ?auto_622975 ?auto_622978 ) ) ( not ( = ?auto_622975 ?auto_622979 ) ) ( not ( = ?auto_622975 ?auto_622980 ) ) ( not ( = ?auto_622975 ?auto_622981 ) ) ( not ( = ?auto_622975 ?auto_622982 ) ) ( not ( = ?auto_622975 ?auto_622983 ) ) ( not ( = ?auto_622975 ?auto_622984 ) ) ( not ( = ?auto_622975 ?auto_622985 ) ) ( not ( = ?auto_622975 ?auto_622986 ) ) ( not ( = ?auto_622976 ?auto_622977 ) ) ( not ( = ?auto_622976 ?auto_622978 ) ) ( not ( = ?auto_622976 ?auto_622979 ) ) ( not ( = ?auto_622976 ?auto_622980 ) ) ( not ( = ?auto_622976 ?auto_622981 ) ) ( not ( = ?auto_622976 ?auto_622982 ) ) ( not ( = ?auto_622976 ?auto_622983 ) ) ( not ( = ?auto_622976 ?auto_622984 ) ) ( not ( = ?auto_622976 ?auto_622985 ) ) ( not ( = ?auto_622976 ?auto_622986 ) ) ( not ( = ?auto_622977 ?auto_622978 ) ) ( not ( = ?auto_622977 ?auto_622979 ) ) ( not ( = ?auto_622977 ?auto_622980 ) ) ( not ( = ?auto_622977 ?auto_622981 ) ) ( not ( = ?auto_622977 ?auto_622982 ) ) ( not ( = ?auto_622977 ?auto_622983 ) ) ( not ( = ?auto_622977 ?auto_622984 ) ) ( not ( = ?auto_622977 ?auto_622985 ) ) ( not ( = ?auto_622977 ?auto_622986 ) ) ( not ( = ?auto_622978 ?auto_622979 ) ) ( not ( = ?auto_622978 ?auto_622980 ) ) ( not ( = ?auto_622978 ?auto_622981 ) ) ( not ( = ?auto_622978 ?auto_622982 ) ) ( not ( = ?auto_622978 ?auto_622983 ) ) ( not ( = ?auto_622978 ?auto_622984 ) ) ( not ( = ?auto_622978 ?auto_622985 ) ) ( not ( = ?auto_622978 ?auto_622986 ) ) ( not ( = ?auto_622979 ?auto_622980 ) ) ( not ( = ?auto_622979 ?auto_622981 ) ) ( not ( = ?auto_622979 ?auto_622982 ) ) ( not ( = ?auto_622979 ?auto_622983 ) ) ( not ( = ?auto_622979 ?auto_622984 ) ) ( not ( = ?auto_622979 ?auto_622985 ) ) ( not ( = ?auto_622979 ?auto_622986 ) ) ( not ( = ?auto_622980 ?auto_622981 ) ) ( not ( = ?auto_622980 ?auto_622982 ) ) ( not ( = ?auto_622980 ?auto_622983 ) ) ( not ( = ?auto_622980 ?auto_622984 ) ) ( not ( = ?auto_622980 ?auto_622985 ) ) ( not ( = ?auto_622980 ?auto_622986 ) ) ( not ( = ?auto_622981 ?auto_622982 ) ) ( not ( = ?auto_622981 ?auto_622983 ) ) ( not ( = ?auto_622981 ?auto_622984 ) ) ( not ( = ?auto_622981 ?auto_622985 ) ) ( not ( = ?auto_622981 ?auto_622986 ) ) ( not ( = ?auto_622982 ?auto_622983 ) ) ( not ( = ?auto_622982 ?auto_622984 ) ) ( not ( = ?auto_622982 ?auto_622985 ) ) ( not ( = ?auto_622982 ?auto_622986 ) ) ( not ( = ?auto_622983 ?auto_622984 ) ) ( not ( = ?auto_622983 ?auto_622985 ) ) ( not ( = ?auto_622983 ?auto_622986 ) ) ( not ( = ?auto_622984 ?auto_622985 ) ) ( not ( = ?auto_622984 ?auto_622986 ) ) ( not ( = ?auto_622985 ?auto_622986 ) ) ( ON ?auto_622984 ?auto_622985 ) ( ON ?auto_622983 ?auto_622984 ) ( ON ?auto_622982 ?auto_622983 ) ( ON ?auto_622981 ?auto_622982 ) ( ON ?auto_622980 ?auto_622981 ) ( ON ?auto_622979 ?auto_622980 ) ( ON ?auto_622978 ?auto_622979 ) ( ON ?auto_622977 ?auto_622978 ) ( ON ?auto_622976 ?auto_622977 ) ( ON ?auto_622975 ?auto_622976 ) ( ON ?auto_622974 ?auto_622975 ) ( CLEAR ?auto_622974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_622974 )
      ( MAKE-12PILE ?auto_622974 ?auto_622975 ?auto_622976 ?auto_622977 ?auto_622978 ?auto_622979 ?auto_622980 ?auto_622981 ?auto_622982 ?auto_622983 ?auto_622984 ?auto_622985 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623025 - BLOCK
      ?auto_623026 - BLOCK
      ?auto_623027 - BLOCK
      ?auto_623028 - BLOCK
      ?auto_623029 - BLOCK
      ?auto_623030 - BLOCK
      ?auto_623031 - BLOCK
      ?auto_623032 - BLOCK
      ?auto_623033 - BLOCK
      ?auto_623034 - BLOCK
      ?auto_623035 - BLOCK
      ?auto_623036 - BLOCK
      ?auto_623037 - BLOCK
    )
    :vars
    (
      ?auto_623038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_623036 ) ( ON ?auto_623037 ?auto_623038 ) ( CLEAR ?auto_623037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_623025 ) ( ON ?auto_623026 ?auto_623025 ) ( ON ?auto_623027 ?auto_623026 ) ( ON ?auto_623028 ?auto_623027 ) ( ON ?auto_623029 ?auto_623028 ) ( ON ?auto_623030 ?auto_623029 ) ( ON ?auto_623031 ?auto_623030 ) ( ON ?auto_623032 ?auto_623031 ) ( ON ?auto_623033 ?auto_623032 ) ( ON ?auto_623034 ?auto_623033 ) ( ON ?auto_623035 ?auto_623034 ) ( ON ?auto_623036 ?auto_623035 ) ( not ( = ?auto_623025 ?auto_623026 ) ) ( not ( = ?auto_623025 ?auto_623027 ) ) ( not ( = ?auto_623025 ?auto_623028 ) ) ( not ( = ?auto_623025 ?auto_623029 ) ) ( not ( = ?auto_623025 ?auto_623030 ) ) ( not ( = ?auto_623025 ?auto_623031 ) ) ( not ( = ?auto_623025 ?auto_623032 ) ) ( not ( = ?auto_623025 ?auto_623033 ) ) ( not ( = ?auto_623025 ?auto_623034 ) ) ( not ( = ?auto_623025 ?auto_623035 ) ) ( not ( = ?auto_623025 ?auto_623036 ) ) ( not ( = ?auto_623025 ?auto_623037 ) ) ( not ( = ?auto_623025 ?auto_623038 ) ) ( not ( = ?auto_623026 ?auto_623027 ) ) ( not ( = ?auto_623026 ?auto_623028 ) ) ( not ( = ?auto_623026 ?auto_623029 ) ) ( not ( = ?auto_623026 ?auto_623030 ) ) ( not ( = ?auto_623026 ?auto_623031 ) ) ( not ( = ?auto_623026 ?auto_623032 ) ) ( not ( = ?auto_623026 ?auto_623033 ) ) ( not ( = ?auto_623026 ?auto_623034 ) ) ( not ( = ?auto_623026 ?auto_623035 ) ) ( not ( = ?auto_623026 ?auto_623036 ) ) ( not ( = ?auto_623026 ?auto_623037 ) ) ( not ( = ?auto_623026 ?auto_623038 ) ) ( not ( = ?auto_623027 ?auto_623028 ) ) ( not ( = ?auto_623027 ?auto_623029 ) ) ( not ( = ?auto_623027 ?auto_623030 ) ) ( not ( = ?auto_623027 ?auto_623031 ) ) ( not ( = ?auto_623027 ?auto_623032 ) ) ( not ( = ?auto_623027 ?auto_623033 ) ) ( not ( = ?auto_623027 ?auto_623034 ) ) ( not ( = ?auto_623027 ?auto_623035 ) ) ( not ( = ?auto_623027 ?auto_623036 ) ) ( not ( = ?auto_623027 ?auto_623037 ) ) ( not ( = ?auto_623027 ?auto_623038 ) ) ( not ( = ?auto_623028 ?auto_623029 ) ) ( not ( = ?auto_623028 ?auto_623030 ) ) ( not ( = ?auto_623028 ?auto_623031 ) ) ( not ( = ?auto_623028 ?auto_623032 ) ) ( not ( = ?auto_623028 ?auto_623033 ) ) ( not ( = ?auto_623028 ?auto_623034 ) ) ( not ( = ?auto_623028 ?auto_623035 ) ) ( not ( = ?auto_623028 ?auto_623036 ) ) ( not ( = ?auto_623028 ?auto_623037 ) ) ( not ( = ?auto_623028 ?auto_623038 ) ) ( not ( = ?auto_623029 ?auto_623030 ) ) ( not ( = ?auto_623029 ?auto_623031 ) ) ( not ( = ?auto_623029 ?auto_623032 ) ) ( not ( = ?auto_623029 ?auto_623033 ) ) ( not ( = ?auto_623029 ?auto_623034 ) ) ( not ( = ?auto_623029 ?auto_623035 ) ) ( not ( = ?auto_623029 ?auto_623036 ) ) ( not ( = ?auto_623029 ?auto_623037 ) ) ( not ( = ?auto_623029 ?auto_623038 ) ) ( not ( = ?auto_623030 ?auto_623031 ) ) ( not ( = ?auto_623030 ?auto_623032 ) ) ( not ( = ?auto_623030 ?auto_623033 ) ) ( not ( = ?auto_623030 ?auto_623034 ) ) ( not ( = ?auto_623030 ?auto_623035 ) ) ( not ( = ?auto_623030 ?auto_623036 ) ) ( not ( = ?auto_623030 ?auto_623037 ) ) ( not ( = ?auto_623030 ?auto_623038 ) ) ( not ( = ?auto_623031 ?auto_623032 ) ) ( not ( = ?auto_623031 ?auto_623033 ) ) ( not ( = ?auto_623031 ?auto_623034 ) ) ( not ( = ?auto_623031 ?auto_623035 ) ) ( not ( = ?auto_623031 ?auto_623036 ) ) ( not ( = ?auto_623031 ?auto_623037 ) ) ( not ( = ?auto_623031 ?auto_623038 ) ) ( not ( = ?auto_623032 ?auto_623033 ) ) ( not ( = ?auto_623032 ?auto_623034 ) ) ( not ( = ?auto_623032 ?auto_623035 ) ) ( not ( = ?auto_623032 ?auto_623036 ) ) ( not ( = ?auto_623032 ?auto_623037 ) ) ( not ( = ?auto_623032 ?auto_623038 ) ) ( not ( = ?auto_623033 ?auto_623034 ) ) ( not ( = ?auto_623033 ?auto_623035 ) ) ( not ( = ?auto_623033 ?auto_623036 ) ) ( not ( = ?auto_623033 ?auto_623037 ) ) ( not ( = ?auto_623033 ?auto_623038 ) ) ( not ( = ?auto_623034 ?auto_623035 ) ) ( not ( = ?auto_623034 ?auto_623036 ) ) ( not ( = ?auto_623034 ?auto_623037 ) ) ( not ( = ?auto_623034 ?auto_623038 ) ) ( not ( = ?auto_623035 ?auto_623036 ) ) ( not ( = ?auto_623035 ?auto_623037 ) ) ( not ( = ?auto_623035 ?auto_623038 ) ) ( not ( = ?auto_623036 ?auto_623037 ) ) ( not ( = ?auto_623036 ?auto_623038 ) ) ( not ( = ?auto_623037 ?auto_623038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_623037 ?auto_623038 )
      ( !STACK ?auto_623037 ?auto_623036 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623079 - BLOCK
      ?auto_623080 - BLOCK
      ?auto_623081 - BLOCK
      ?auto_623082 - BLOCK
      ?auto_623083 - BLOCK
      ?auto_623084 - BLOCK
      ?auto_623085 - BLOCK
      ?auto_623086 - BLOCK
      ?auto_623087 - BLOCK
      ?auto_623088 - BLOCK
      ?auto_623089 - BLOCK
      ?auto_623090 - BLOCK
      ?auto_623091 - BLOCK
    )
    :vars
    (
      ?auto_623092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623091 ?auto_623092 ) ( ON-TABLE ?auto_623079 ) ( ON ?auto_623080 ?auto_623079 ) ( ON ?auto_623081 ?auto_623080 ) ( ON ?auto_623082 ?auto_623081 ) ( ON ?auto_623083 ?auto_623082 ) ( ON ?auto_623084 ?auto_623083 ) ( ON ?auto_623085 ?auto_623084 ) ( ON ?auto_623086 ?auto_623085 ) ( ON ?auto_623087 ?auto_623086 ) ( ON ?auto_623088 ?auto_623087 ) ( ON ?auto_623089 ?auto_623088 ) ( not ( = ?auto_623079 ?auto_623080 ) ) ( not ( = ?auto_623079 ?auto_623081 ) ) ( not ( = ?auto_623079 ?auto_623082 ) ) ( not ( = ?auto_623079 ?auto_623083 ) ) ( not ( = ?auto_623079 ?auto_623084 ) ) ( not ( = ?auto_623079 ?auto_623085 ) ) ( not ( = ?auto_623079 ?auto_623086 ) ) ( not ( = ?auto_623079 ?auto_623087 ) ) ( not ( = ?auto_623079 ?auto_623088 ) ) ( not ( = ?auto_623079 ?auto_623089 ) ) ( not ( = ?auto_623079 ?auto_623090 ) ) ( not ( = ?auto_623079 ?auto_623091 ) ) ( not ( = ?auto_623079 ?auto_623092 ) ) ( not ( = ?auto_623080 ?auto_623081 ) ) ( not ( = ?auto_623080 ?auto_623082 ) ) ( not ( = ?auto_623080 ?auto_623083 ) ) ( not ( = ?auto_623080 ?auto_623084 ) ) ( not ( = ?auto_623080 ?auto_623085 ) ) ( not ( = ?auto_623080 ?auto_623086 ) ) ( not ( = ?auto_623080 ?auto_623087 ) ) ( not ( = ?auto_623080 ?auto_623088 ) ) ( not ( = ?auto_623080 ?auto_623089 ) ) ( not ( = ?auto_623080 ?auto_623090 ) ) ( not ( = ?auto_623080 ?auto_623091 ) ) ( not ( = ?auto_623080 ?auto_623092 ) ) ( not ( = ?auto_623081 ?auto_623082 ) ) ( not ( = ?auto_623081 ?auto_623083 ) ) ( not ( = ?auto_623081 ?auto_623084 ) ) ( not ( = ?auto_623081 ?auto_623085 ) ) ( not ( = ?auto_623081 ?auto_623086 ) ) ( not ( = ?auto_623081 ?auto_623087 ) ) ( not ( = ?auto_623081 ?auto_623088 ) ) ( not ( = ?auto_623081 ?auto_623089 ) ) ( not ( = ?auto_623081 ?auto_623090 ) ) ( not ( = ?auto_623081 ?auto_623091 ) ) ( not ( = ?auto_623081 ?auto_623092 ) ) ( not ( = ?auto_623082 ?auto_623083 ) ) ( not ( = ?auto_623082 ?auto_623084 ) ) ( not ( = ?auto_623082 ?auto_623085 ) ) ( not ( = ?auto_623082 ?auto_623086 ) ) ( not ( = ?auto_623082 ?auto_623087 ) ) ( not ( = ?auto_623082 ?auto_623088 ) ) ( not ( = ?auto_623082 ?auto_623089 ) ) ( not ( = ?auto_623082 ?auto_623090 ) ) ( not ( = ?auto_623082 ?auto_623091 ) ) ( not ( = ?auto_623082 ?auto_623092 ) ) ( not ( = ?auto_623083 ?auto_623084 ) ) ( not ( = ?auto_623083 ?auto_623085 ) ) ( not ( = ?auto_623083 ?auto_623086 ) ) ( not ( = ?auto_623083 ?auto_623087 ) ) ( not ( = ?auto_623083 ?auto_623088 ) ) ( not ( = ?auto_623083 ?auto_623089 ) ) ( not ( = ?auto_623083 ?auto_623090 ) ) ( not ( = ?auto_623083 ?auto_623091 ) ) ( not ( = ?auto_623083 ?auto_623092 ) ) ( not ( = ?auto_623084 ?auto_623085 ) ) ( not ( = ?auto_623084 ?auto_623086 ) ) ( not ( = ?auto_623084 ?auto_623087 ) ) ( not ( = ?auto_623084 ?auto_623088 ) ) ( not ( = ?auto_623084 ?auto_623089 ) ) ( not ( = ?auto_623084 ?auto_623090 ) ) ( not ( = ?auto_623084 ?auto_623091 ) ) ( not ( = ?auto_623084 ?auto_623092 ) ) ( not ( = ?auto_623085 ?auto_623086 ) ) ( not ( = ?auto_623085 ?auto_623087 ) ) ( not ( = ?auto_623085 ?auto_623088 ) ) ( not ( = ?auto_623085 ?auto_623089 ) ) ( not ( = ?auto_623085 ?auto_623090 ) ) ( not ( = ?auto_623085 ?auto_623091 ) ) ( not ( = ?auto_623085 ?auto_623092 ) ) ( not ( = ?auto_623086 ?auto_623087 ) ) ( not ( = ?auto_623086 ?auto_623088 ) ) ( not ( = ?auto_623086 ?auto_623089 ) ) ( not ( = ?auto_623086 ?auto_623090 ) ) ( not ( = ?auto_623086 ?auto_623091 ) ) ( not ( = ?auto_623086 ?auto_623092 ) ) ( not ( = ?auto_623087 ?auto_623088 ) ) ( not ( = ?auto_623087 ?auto_623089 ) ) ( not ( = ?auto_623087 ?auto_623090 ) ) ( not ( = ?auto_623087 ?auto_623091 ) ) ( not ( = ?auto_623087 ?auto_623092 ) ) ( not ( = ?auto_623088 ?auto_623089 ) ) ( not ( = ?auto_623088 ?auto_623090 ) ) ( not ( = ?auto_623088 ?auto_623091 ) ) ( not ( = ?auto_623088 ?auto_623092 ) ) ( not ( = ?auto_623089 ?auto_623090 ) ) ( not ( = ?auto_623089 ?auto_623091 ) ) ( not ( = ?auto_623089 ?auto_623092 ) ) ( not ( = ?auto_623090 ?auto_623091 ) ) ( not ( = ?auto_623090 ?auto_623092 ) ) ( not ( = ?auto_623091 ?auto_623092 ) ) ( CLEAR ?auto_623089 ) ( ON ?auto_623090 ?auto_623091 ) ( CLEAR ?auto_623090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_623079 ?auto_623080 ?auto_623081 ?auto_623082 ?auto_623083 ?auto_623084 ?auto_623085 ?auto_623086 ?auto_623087 ?auto_623088 ?auto_623089 ?auto_623090 )
      ( MAKE-13PILE ?auto_623079 ?auto_623080 ?auto_623081 ?auto_623082 ?auto_623083 ?auto_623084 ?auto_623085 ?auto_623086 ?auto_623087 ?auto_623088 ?auto_623089 ?auto_623090 ?auto_623091 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623133 - BLOCK
      ?auto_623134 - BLOCK
      ?auto_623135 - BLOCK
      ?auto_623136 - BLOCK
      ?auto_623137 - BLOCK
      ?auto_623138 - BLOCK
      ?auto_623139 - BLOCK
      ?auto_623140 - BLOCK
      ?auto_623141 - BLOCK
      ?auto_623142 - BLOCK
      ?auto_623143 - BLOCK
      ?auto_623144 - BLOCK
      ?auto_623145 - BLOCK
    )
    :vars
    (
      ?auto_623146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623145 ?auto_623146 ) ( ON-TABLE ?auto_623133 ) ( ON ?auto_623134 ?auto_623133 ) ( ON ?auto_623135 ?auto_623134 ) ( ON ?auto_623136 ?auto_623135 ) ( ON ?auto_623137 ?auto_623136 ) ( ON ?auto_623138 ?auto_623137 ) ( ON ?auto_623139 ?auto_623138 ) ( ON ?auto_623140 ?auto_623139 ) ( ON ?auto_623141 ?auto_623140 ) ( ON ?auto_623142 ?auto_623141 ) ( not ( = ?auto_623133 ?auto_623134 ) ) ( not ( = ?auto_623133 ?auto_623135 ) ) ( not ( = ?auto_623133 ?auto_623136 ) ) ( not ( = ?auto_623133 ?auto_623137 ) ) ( not ( = ?auto_623133 ?auto_623138 ) ) ( not ( = ?auto_623133 ?auto_623139 ) ) ( not ( = ?auto_623133 ?auto_623140 ) ) ( not ( = ?auto_623133 ?auto_623141 ) ) ( not ( = ?auto_623133 ?auto_623142 ) ) ( not ( = ?auto_623133 ?auto_623143 ) ) ( not ( = ?auto_623133 ?auto_623144 ) ) ( not ( = ?auto_623133 ?auto_623145 ) ) ( not ( = ?auto_623133 ?auto_623146 ) ) ( not ( = ?auto_623134 ?auto_623135 ) ) ( not ( = ?auto_623134 ?auto_623136 ) ) ( not ( = ?auto_623134 ?auto_623137 ) ) ( not ( = ?auto_623134 ?auto_623138 ) ) ( not ( = ?auto_623134 ?auto_623139 ) ) ( not ( = ?auto_623134 ?auto_623140 ) ) ( not ( = ?auto_623134 ?auto_623141 ) ) ( not ( = ?auto_623134 ?auto_623142 ) ) ( not ( = ?auto_623134 ?auto_623143 ) ) ( not ( = ?auto_623134 ?auto_623144 ) ) ( not ( = ?auto_623134 ?auto_623145 ) ) ( not ( = ?auto_623134 ?auto_623146 ) ) ( not ( = ?auto_623135 ?auto_623136 ) ) ( not ( = ?auto_623135 ?auto_623137 ) ) ( not ( = ?auto_623135 ?auto_623138 ) ) ( not ( = ?auto_623135 ?auto_623139 ) ) ( not ( = ?auto_623135 ?auto_623140 ) ) ( not ( = ?auto_623135 ?auto_623141 ) ) ( not ( = ?auto_623135 ?auto_623142 ) ) ( not ( = ?auto_623135 ?auto_623143 ) ) ( not ( = ?auto_623135 ?auto_623144 ) ) ( not ( = ?auto_623135 ?auto_623145 ) ) ( not ( = ?auto_623135 ?auto_623146 ) ) ( not ( = ?auto_623136 ?auto_623137 ) ) ( not ( = ?auto_623136 ?auto_623138 ) ) ( not ( = ?auto_623136 ?auto_623139 ) ) ( not ( = ?auto_623136 ?auto_623140 ) ) ( not ( = ?auto_623136 ?auto_623141 ) ) ( not ( = ?auto_623136 ?auto_623142 ) ) ( not ( = ?auto_623136 ?auto_623143 ) ) ( not ( = ?auto_623136 ?auto_623144 ) ) ( not ( = ?auto_623136 ?auto_623145 ) ) ( not ( = ?auto_623136 ?auto_623146 ) ) ( not ( = ?auto_623137 ?auto_623138 ) ) ( not ( = ?auto_623137 ?auto_623139 ) ) ( not ( = ?auto_623137 ?auto_623140 ) ) ( not ( = ?auto_623137 ?auto_623141 ) ) ( not ( = ?auto_623137 ?auto_623142 ) ) ( not ( = ?auto_623137 ?auto_623143 ) ) ( not ( = ?auto_623137 ?auto_623144 ) ) ( not ( = ?auto_623137 ?auto_623145 ) ) ( not ( = ?auto_623137 ?auto_623146 ) ) ( not ( = ?auto_623138 ?auto_623139 ) ) ( not ( = ?auto_623138 ?auto_623140 ) ) ( not ( = ?auto_623138 ?auto_623141 ) ) ( not ( = ?auto_623138 ?auto_623142 ) ) ( not ( = ?auto_623138 ?auto_623143 ) ) ( not ( = ?auto_623138 ?auto_623144 ) ) ( not ( = ?auto_623138 ?auto_623145 ) ) ( not ( = ?auto_623138 ?auto_623146 ) ) ( not ( = ?auto_623139 ?auto_623140 ) ) ( not ( = ?auto_623139 ?auto_623141 ) ) ( not ( = ?auto_623139 ?auto_623142 ) ) ( not ( = ?auto_623139 ?auto_623143 ) ) ( not ( = ?auto_623139 ?auto_623144 ) ) ( not ( = ?auto_623139 ?auto_623145 ) ) ( not ( = ?auto_623139 ?auto_623146 ) ) ( not ( = ?auto_623140 ?auto_623141 ) ) ( not ( = ?auto_623140 ?auto_623142 ) ) ( not ( = ?auto_623140 ?auto_623143 ) ) ( not ( = ?auto_623140 ?auto_623144 ) ) ( not ( = ?auto_623140 ?auto_623145 ) ) ( not ( = ?auto_623140 ?auto_623146 ) ) ( not ( = ?auto_623141 ?auto_623142 ) ) ( not ( = ?auto_623141 ?auto_623143 ) ) ( not ( = ?auto_623141 ?auto_623144 ) ) ( not ( = ?auto_623141 ?auto_623145 ) ) ( not ( = ?auto_623141 ?auto_623146 ) ) ( not ( = ?auto_623142 ?auto_623143 ) ) ( not ( = ?auto_623142 ?auto_623144 ) ) ( not ( = ?auto_623142 ?auto_623145 ) ) ( not ( = ?auto_623142 ?auto_623146 ) ) ( not ( = ?auto_623143 ?auto_623144 ) ) ( not ( = ?auto_623143 ?auto_623145 ) ) ( not ( = ?auto_623143 ?auto_623146 ) ) ( not ( = ?auto_623144 ?auto_623145 ) ) ( not ( = ?auto_623144 ?auto_623146 ) ) ( not ( = ?auto_623145 ?auto_623146 ) ) ( ON ?auto_623144 ?auto_623145 ) ( CLEAR ?auto_623142 ) ( ON ?auto_623143 ?auto_623144 ) ( CLEAR ?auto_623143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_623133 ?auto_623134 ?auto_623135 ?auto_623136 ?auto_623137 ?auto_623138 ?auto_623139 ?auto_623140 ?auto_623141 ?auto_623142 ?auto_623143 )
      ( MAKE-13PILE ?auto_623133 ?auto_623134 ?auto_623135 ?auto_623136 ?auto_623137 ?auto_623138 ?auto_623139 ?auto_623140 ?auto_623141 ?auto_623142 ?auto_623143 ?auto_623144 ?auto_623145 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623187 - BLOCK
      ?auto_623188 - BLOCK
      ?auto_623189 - BLOCK
      ?auto_623190 - BLOCK
      ?auto_623191 - BLOCK
      ?auto_623192 - BLOCK
      ?auto_623193 - BLOCK
      ?auto_623194 - BLOCK
      ?auto_623195 - BLOCK
      ?auto_623196 - BLOCK
      ?auto_623197 - BLOCK
      ?auto_623198 - BLOCK
      ?auto_623199 - BLOCK
    )
    :vars
    (
      ?auto_623200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623199 ?auto_623200 ) ( ON-TABLE ?auto_623187 ) ( ON ?auto_623188 ?auto_623187 ) ( ON ?auto_623189 ?auto_623188 ) ( ON ?auto_623190 ?auto_623189 ) ( ON ?auto_623191 ?auto_623190 ) ( ON ?auto_623192 ?auto_623191 ) ( ON ?auto_623193 ?auto_623192 ) ( ON ?auto_623194 ?auto_623193 ) ( ON ?auto_623195 ?auto_623194 ) ( not ( = ?auto_623187 ?auto_623188 ) ) ( not ( = ?auto_623187 ?auto_623189 ) ) ( not ( = ?auto_623187 ?auto_623190 ) ) ( not ( = ?auto_623187 ?auto_623191 ) ) ( not ( = ?auto_623187 ?auto_623192 ) ) ( not ( = ?auto_623187 ?auto_623193 ) ) ( not ( = ?auto_623187 ?auto_623194 ) ) ( not ( = ?auto_623187 ?auto_623195 ) ) ( not ( = ?auto_623187 ?auto_623196 ) ) ( not ( = ?auto_623187 ?auto_623197 ) ) ( not ( = ?auto_623187 ?auto_623198 ) ) ( not ( = ?auto_623187 ?auto_623199 ) ) ( not ( = ?auto_623187 ?auto_623200 ) ) ( not ( = ?auto_623188 ?auto_623189 ) ) ( not ( = ?auto_623188 ?auto_623190 ) ) ( not ( = ?auto_623188 ?auto_623191 ) ) ( not ( = ?auto_623188 ?auto_623192 ) ) ( not ( = ?auto_623188 ?auto_623193 ) ) ( not ( = ?auto_623188 ?auto_623194 ) ) ( not ( = ?auto_623188 ?auto_623195 ) ) ( not ( = ?auto_623188 ?auto_623196 ) ) ( not ( = ?auto_623188 ?auto_623197 ) ) ( not ( = ?auto_623188 ?auto_623198 ) ) ( not ( = ?auto_623188 ?auto_623199 ) ) ( not ( = ?auto_623188 ?auto_623200 ) ) ( not ( = ?auto_623189 ?auto_623190 ) ) ( not ( = ?auto_623189 ?auto_623191 ) ) ( not ( = ?auto_623189 ?auto_623192 ) ) ( not ( = ?auto_623189 ?auto_623193 ) ) ( not ( = ?auto_623189 ?auto_623194 ) ) ( not ( = ?auto_623189 ?auto_623195 ) ) ( not ( = ?auto_623189 ?auto_623196 ) ) ( not ( = ?auto_623189 ?auto_623197 ) ) ( not ( = ?auto_623189 ?auto_623198 ) ) ( not ( = ?auto_623189 ?auto_623199 ) ) ( not ( = ?auto_623189 ?auto_623200 ) ) ( not ( = ?auto_623190 ?auto_623191 ) ) ( not ( = ?auto_623190 ?auto_623192 ) ) ( not ( = ?auto_623190 ?auto_623193 ) ) ( not ( = ?auto_623190 ?auto_623194 ) ) ( not ( = ?auto_623190 ?auto_623195 ) ) ( not ( = ?auto_623190 ?auto_623196 ) ) ( not ( = ?auto_623190 ?auto_623197 ) ) ( not ( = ?auto_623190 ?auto_623198 ) ) ( not ( = ?auto_623190 ?auto_623199 ) ) ( not ( = ?auto_623190 ?auto_623200 ) ) ( not ( = ?auto_623191 ?auto_623192 ) ) ( not ( = ?auto_623191 ?auto_623193 ) ) ( not ( = ?auto_623191 ?auto_623194 ) ) ( not ( = ?auto_623191 ?auto_623195 ) ) ( not ( = ?auto_623191 ?auto_623196 ) ) ( not ( = ?auto_623191 ?auto_623197 ) ) ( not ( = ?auto_623191 ?auto_623198 ) ) ( not ( = ?auto_623191 ?auto_623199 ) ) ( not ( = ?auto_623191 ?auto_623200 ) ) ( not ( = ?auto_623192 ?auto_623193 ) ) ( not ( = ?auto_623192 ?auto_623194 ) ) ( not ( = ?auto_623192 ?auto_623195 ) ) ( not ( = ?auto_623192 ?auto_623196 ) ) ( not ( = ?auto_623192 ?auto_623197 ) ) ( not ( = ?auto_623192 ?auto_623198 ) ) ( not ( = ?auto_623192 ?auto_623199 ) ) ( not ( = ?auto_623192 ?auto_623200 ) ) ( not ( = ?auto_623193 ?auto_623194 ) ) ( not ( = ?auto_623193 ?auto_623195 ) ) ( not ( = ?auto_623193 ?auto_623196 ) ) ( not ( = ?auto_623193 ?auto_623197 ) ) ( not ( = ?auto_623193 ?auto_623198 ) ) ( not ( = ?auto_623193 ?auto_623199 ) ) ( not ( = ?auto_623193 ?auto_623200 ) ) ( not ( = ?auto_623194 ?auto_623195 ) ) ( not ( = ?auto_623194 ?auto_623196 ) ) ( not ( = ?auto_623194 ?auto_623197 ) ) ( not ( = ?auto_623194 ?auto_623198 ) ) ( not ( = ?auto_623194 ?auto_623199 ) ) ( not ( = ?auto_623194 ?auto_623200 ) ) ( not ( = ?auto_623195 ?auto_623196 ) ) ( not ( = ?auto_623195 ?auto_623197 ) ) ( not ( = ?auto_623195 ?auto_623198 ) ) ( not ( = ?auto_623195 ?auto_623199 ) ) ( not ( = ?auto_623195 ?auto_623200 ) ) ( not ( = ?auto_623196 ?auto_623197 ) ) ( not ( = ?auto_623196 ?auto_623198 ) ) ( not ( = ?auto_623196 ?auto_623199 ) ) ( not ( = ?auto_623196 ?auto_623200 ) ) ( not ( = ?auto_623197 ?auto_623198 ) ) ( not ( = ?auto_623197 ?auto_623199 ) ) ( not ( = ?auto_623197 ?auto_623200 ) ) ( not ( = ?auto_623198 ?auto_623199 ) ) ( not ( = ?auto_623198 ?auto_623200 ) ) ( not ( = ?auto_623199 ?auto_623200 ) ) ( ON ?auto_623198 ?auto_623199 ) ( ON ?auto_623197 ?auto_623198 ) ( CLEAR ?auto_623195 ) ( ON ?auto_623196 ?auto_623197 ) ( CLEAR ?auto_623196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_623187 ?auto_623188 ?auto_623189 ?auto_623190 ?auto_623191 ?auto_623192 ?auto_623193 ?auto_623194 ?auto_623195 ?auto_623196 )
      ( MAKE-13PILE ?auto_623187 ?auto_623188 ?auto_623189 ?auto_623190 ?auto_623191 ?auto_623192 ?auto_623193 ?auto_623194 ?auto_623195 ?auto_623196 ?auto_623197 ?auto_623198 ?auto_623199 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623241 - BLOCK
      ?auto_623242 - BLOCK
      ?auto_623243 - BLOCK
      ?auto_623244 - BLOCK
      ?auto_623245 - BLOCK
      ?auto_623246 - BLOCK
      ?auto_623247 - BLOCK
      ?auto_623248 - BLOCK
      ?auto_623249 - BLOCK
      ?auto_623250 - BLOCK
      ?auto_623251 - BLOCK
      ?auto_623252 - BLOCK
      ?auto_623253 - BLOCK
    )
    :vars
    (
      ?auto_623254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623253 ?auto_623254 ) ( ON-TABLE ?auto_623241 ) ( ON ?auto_623242 ?auto_623241 ) ( ON ?auto_623243 ?auto_623242 ) ( ON ?auto_623244 ?auto_623243 ) ( ON ?auto_623245 ?auto_623244 ) ( ON ?auto_623246 ?auto_623245 ) ( ON ?auto_623247 ?auto_623246 ) ( ON ?auto_623248 ?auto_623247 ) ( not ( = ?auto_623241 ?auto_623242 ) ) ( not ( = ?auto_623241 ?auto_623243 ) ) ( not ( = ?auto_623241 ?auto_623244 ) ) ( not ( = ?auto_623241 ?auto_623245 ) ) ( not ( = ?auto_623241 ?auto_623246 ) ) ( not ( = ?auto_623241 ?auto_623247 ) ) ( not ( = ?auto_623241 ?auto_623248 ) ) ( not ( = ?auto_623241 ?auto_623249 ) ) ( not ( = ?auto_623241 ?auto_623250 ) ) ( not ( = ?auto_623241 ?auto_623251 ) ) ( not ( = ?auto_623241 ?auto_623252 ) ) ( not ( = ?auto_623241 ?auto_623253 ) ) ( not ( = ?auto_623241 ?auto_623254 ) ) ( not ( = ?auto_623242 ?auto_623243 ) ) ( not ( = ?auto_623242 ?auto_623244 ) ) ( not ( = ?auto_623242 ?auto_623245 ) ) ( not ( = ?auto_623242 ?auto_623246 ) ) ( not ( = ?auto_623242 ?auto_623247 ) ) ( not ( = ?auto_623242 ?auto_623248 ) ) ( not ( = ?auto_623242 ?auto_623249 ) ) ( not ( = ?auto_623242 ?auto_623250 ) ) ( not ( = ?auto_623242 ?auto_623251 ) ) ( not ( = ?auto_623242 ?auto_623252 ) ) ( not ( = ?auto_623242 ?auto_623253 ) ) ( not ( = ?auto_623242 ?auto_623254 ) ) ( not ( = ?auto_623243 ?auto_623244 ) ) ( not ( = ?auto_623243 ?auto_623245 ) ) ( not ( = ?auto_623243 ?auto_623246 ) ) ( not ( = ?auto_623243 ?auto_623247 ) ) ( not ( = ?auto_623243 ?auto_623248 ) ) ( not ( = ?auto_623243 ?auto_623249 ) ) ( not ( = ?auto_623243 ?auto_623250 ) ) ( not ( = ?auto_623243 ?auto_623251 ) ) ( not ( = ?auto_623243 ?auto_623252 ) ) ( not ( = ?auto_623243 ?auto_623253 ) ) ( not ( = ?auto_623243 ?auto_623254 ) ) ( not ( = ?auto_623244 ?auto_623245 ) ) ( not ( = ?auto_623244 ?auto_623246 ) ) ( not ( = ?auto_623244 ?auto_623247 ) ) ( not ( = ?auto_623244 ?auto_623248 ) ) ( not ( = ?auto_623244 ?auto_623249 ) ) ( not ( = ?auto_623244 ?auto_623250 ) ) ( not ( = ?auto_623244 ?auto_623251 ) ) ( not ( = ?auto_623244 ?auto_623252 ) ) ( not ( = ?auto_623244 ?auto_623253 ) ) ( not ( = ?auto_623244 ?auto_623254 ) ) ( not ( = ?auto_623245 ?auto_623246 ) ) ( not ( = ?auto_623245 ?auto_623247 ) ) ( not ( = ?auto_623245 ?auto_623248 ) ) ( not ( = ?auto_623245 ?auto_623249 ) ) ( not ( = ?auto_623245 ?auto_623250 ) ) ( not ( = ?auto_623245 ?auto_623251 ) ) ( not ( = ?auto_623245 ?auto_623252 ) ) ( not ( = ?auto_623245 ?auto_623253 ) ) ( not ( = ?auto_623245 ?auto_623254 ) ) ( not ( = ?auto_623246 ?auto_623247 ) ) ( not ( = ?auto_623246 ?auto_623248 ) ) ( not ( = ?auto_623246 ?auto_623249 ) ) ( not ( = ?auto_623246 ?auto_623250 ) ) ( not ( = ?auto_623246 ?auto_623251 ) ) ( not ( = ?auto_623246 ?auto_623252 ) ) ( not ( = ?auto_623246 ?auto_623253 ) ) ( not ( = ?auto_623246 ?auto_623254 ) ) ( not ( = ?auto_623247 ?auto_623248 ) ) ( not ( = ?auto_623247 ?auto_623249 ) ) ( not ( = ?auto_623247 ?auto_623250 ) ) ( not ( = ?auto_623247 ?auto_623251 ) ) ( not ( = ?auto_623247 ?auto_623252 ) ) ( not ( = ?auto_623247 ?auto_623253 ) ) ( not ( = ?auto_623247 ?auto_623254 ) ) ( not ( = ?auto_623248 ?auto_623249 ) ) ( not ( = ?auto_623248 ?auto_623250 ) ) ( not ( = ?auto_623248 ?auto_623251 ) ) ( not ( = ?auto_623248 ?auto_623252 ) ) ( not ( = ?auto_623248 ?auto_623253 ) ) ( not ( = ?auto_623248 ?auto_623254 ) ) ( not ( = ?auto_623249 ?auto_623250 ) ) ( not ( = ?auto_623249 ?auto_623251 ) ) ( not ( = ?auto_623249 ?auto_623252 ) ) ( not ( = ?auto_623249 ?auto_623253 ) ) ( not ( = ?auto_623249 ?auto_623254 ) ) ( not ( = ?auto_623250 ?auto_623251 ) ) ( not ( = ?auto_623250 ?auto_623252 ) ) ( not ( = ?auto_623250 ?auto_623253 ) ) ( not ( = ?auto_623250 ?auto_623254 ) ) ( not ( = ?auto_623251 ?auto_623252 ) ) ( not ( = ?auto_623251 ?auto_623253 ) ) ( not ( = ?auto_623251 ?auto_623254 ) ) ( not ( = ?auto_623252 ?auto_623253 ) ) ( not ( = ?auto_623252 ?auto_623254 ) ) ( not ( = ?auto_623253 ?auto_623254 ) ) ( ON ?auto_623252 ?auto_623253 ) ( ON ?auto_623251 ?auto_623252 ) ( ON ?auto_623250 ?auto_623251 ) ( CLEAR ?auto_623248 ) ( ON ?auto_623249 ?auto_623250 ) ( CLEAR ?auto_623249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_623241 ?auto_623242 ?auto_623243 ?auto_623244 ?auto_623245 ?auto_623246 ?auto_623247 ?auto_623248 ?auto_623249 )
      ( MAKE-13PILE ?auto_623241 ?auto_623242 ?auto_623243 ?auto_623244 ?auto_623245 ?auto_623246 ?auto_623247 ?auto_623248 ?auto_623249 ?auto_623250 ?auto_623251 ?auto_623252 ?auto_623253 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623295 - BLOCK
      ?auto_623296 - BLOCK
      ?auto_623297 - BLOCK
      ?auto_623298 - BLOCK
      ?auto_623299 - BLOCK
      ?auto_623300 - BLOCK
      ?auto_623301 - BLOCK
      ?auto_623302 - BLOCK
      ?auto_623303 - BLOCK
      ?auto_623304 - BLOCK
      ?auto_623305 - BLOCK
      ?auto_623306 - BLOCK
      ?auto_623307 - BLOCK
    )
    :vars
    (
      ?auto_623308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623307 ?auto_623308 ) ( ON-TABLE ?auto_623295 ) ( ON ?auto_623296 ?auto_623295 ) ( ON ?auto_623297 ?auto_623296 ) ( ON ?auto_623298 ?auto_623297 ) ( ON ?auto_623299 ?auto_623298 ) ( ON ?auto_623300 ?auto_623299 ) ( ON ?auto_623301 ?auto_623300 ) ( not ( = ?auto_623295 ?auto_623296 ) ) ( not ( = ?auto_623295 ?auto_623297 ) ) ( not ( = ?auto_623295 ?auto_623298 ) ) ( not ( = ?auto_623295 ?auto_623299 ) ) ( not ( = ?auto_623295 ?auto_623300 ) ) ( not ( = ?auto_623295 ?auto_623301 ) ) ( not ( = ?auto_623295 ?auto_623302 ) ) ( not ( = ?auto_623295 ?auto_623303 ) ) ( not ( = ?auto_623295 ?auto_623304 ) ) ( not ( = ?auto_623295 ?auto_623305 ) ) ( not ( = ?auto_623295 ?auto_623306 ) ) ( not ( = ?auto_623295 ?auto_623307 ) ) ( not ( = ?auto_623295 ?auto_623308 ) ) ( not ( = ?auto_623296 ?auto_623297 ) ) ( not ( = ?auto_623296 ?auto_623298 ) ) ( not ( = ?auto_623296 ?auto_623299 ) ) ( not ( = ?auto_623296 ?auto_623300 ) ) ( not ( = ?auto_623296 ?auto_623301 ) ) ( not ( = ?auto_623296 ?auto_623302 ) ) ( not ( = ?auto_623296 ?auto_623303 ) ) ( not ( = ?auto_623296 ?auto_623304 ) ) ( not ( = ?auto_623296 ?auto_623305 ) ) ( not ( = ?auto_623296 ?auto_623306 ) ) ( not ( = ?auto_623296 ?auto_623307 ) ) ( not ( = ?auto_623296 ?auto_623308 ) ) ( not ( = ?auto_623297 ?auto_623298 ) ) ( not ( = ?auto_623297 ?auto_623299 ) ) ( not ( = ?auto_623297 ?auto_623300 ) ) ( not ( = ?auto_623297 ?auto_623301 ) ) ( not ( = ?auto_623297 ?auto_623302 ) ) ( not ( = ?auto_623297 ?auto_623303 ) ) ( not ( = ?auto_623297 ?auto_623304 ) ) ( not ( = ?auto_623297 ?auto_623305 ) ) ( not ( = ?auto_623297 ?auto_623306 ) ) ( not ( = ?auto_623297 ?auto_623307 ) ) ( not ( = ?auto_623297 ?auto_623308 ) ) ( not ( = ?auto_623298 ?auto_623299 ) ) ( not ( = ?auto_623298 ?auto_623300 ) ) ( not ( = ?auto_623298 ?auto_623301 ) ) ( not ( = ?auto_623298 ?auto_623302 ) ) ( not ( = ?auto_623298 ?auto_623303 ) ) ( not ( = ?auto_623298 ?auto_623304 ) ) ( not ( = ?auto_623298 ?auto_623305 ) ) ( not ( = ?auto_623298 ?auto_623306 ) ) ( not ( = ?auto_623298 ?auto_623307 ) ) ( not ( = ?auto_623298 ?auto_623308 ) ) ( not ( = ?auto_623299 ?auto_623300 ) ) ( not ( = ?auto_623299 ?auto_623301 ) ) ( not ( = ?auto_623299 ?auto_623302 ) ) ( not ( = ?auto_623299 ?auto_623303 ) ) ( not ( = ?auto_623299 ?auto_623304 ) ) ( not ( = ?auto_623299 ?auto_623305 ) ) ( not ( = ?auto_623299 ?auto_623306 ) ) ( not ( = ?auto_623299 ?auto_623307 ) ) ( not ( = ?auto_623299 ?auto_623308 ) ) ( not ( = ?auto_623300 ?auto_623301 ) ) ( not ( = ?auto_623300 ?auto_623302 ) ) ( not ( = ?auto_623300 ?auto_623303 ) ) ( not ( = ?auto_623300 ?auto_623304 ) ) ( not ( = ?auto_623300 ?auto_623305 ) ) ( not ( = ?auto_623300 ?auto_623306 ) ) ( not ( = ?auto_623300 ?auto_623307 ) ) ( not ( = ?auto_623300 ?auto_623308 ) ) ( not ( = ?auto_623301 ?auto_623302 ) ) ( not ( = ?auto_623301 ?auto_623303 ) ) ( not ( = ?auto_623301 ?auto_623304 ) ) ( not ( = ?auto_623301 ?auto_623305 ) ) ( not ( = ?auto_623301 ?auto_623306 ) ) ( not ( = ?auto_623301 ?auto_623307 ) ) ( not ( = ?auto_623301 ?auto_623308 ) ) ( not ( = ?auto_623302 ?auto_623303 ) ) ( not ( = ?auto_623302 ?auto_623304 ) ) ( not ( = ?auto_623302 ?auto_623305 ) ) ( not ( = ?auto_623302 ?auto_623306 ) ) ( not ( = ?auto_623302 ?auto_623307 ) ) ( not ( = ?auto_623302 ?auto_623308 ) ) ( not ( = ?auto_623303 ?auto_623304 ) ) ( not ( = ?auto_623303 ?auto_623305 ) ) ( not ( = ?auto_623303 ?auto_623306 ) ) ( not ( = ?auto_623303 ?auto_623307 ) ) ( not ( = ?auto_623303 ?auto_623308 ) ) ( not ( = ?auto_623304 ?auto_623305 ) ) ( not ( = ?auto_623304 ?auto_623306 ) ) ( not ( = ?auto_623304 ?auto_623307 ) ) ( not ( = ?auto_623304 ?auto_623308 ) ) ( not ( = ?auto_623305 ?auto_623306 ) ) ( not ( = ?auto_623305 ?auto_623307 ) ) ( not ( = ?auto_623305 ?auto_623308 ) ) ( not ( = ?auto_623306 ?auto_623307 ) ) ( not ( = ?auto_623306 ?auto_623308 ) ) ( not ( = ?auto_623307 ?auto_623308 ) ) ( ON ?auto_623306 ?auto_623307 ) ( ON ?auto_623305 ?auto_623306 ) ( ON ?auto_623304 ?auto_623305 ) ( ON ?auto_623303 ?auto_623304 ) ( CLEAR ?auto_623301 ) ( ON ?auto_623302 ?auto_623303 ) ( CLEAR ?auto_623302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_623295 ?auto_623296 ?auto_623297 ?auto_623298 ?auto_623299 ?auto_623300 ?auto_623301 ?auto_623302 )
      ( MAKE-13PILE ?auto_623295 ?auto_623296 ?auto_623297 ?auto_623298 ?auto_623299 ?auto_623300 ?auto_623301 ?auto_623302 ?auto_623303 ?auto_623304 ?auto_623305 ?auto_623306 ?auto_623307 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623349 - BLOCK
      ?auto_623350 - BLOCK
      ?auto_623351 - BLOCK
      ?auto_623352 - BLOCK
      ?auto_623353 - BLOCK
      ?auto_623354 - BLOCK
      ?auto_623355 - BLOCK
      ?auto_623356 - BLOCK
      ?auto_623357 - BLOCK
      ?auto_623358 - BLOCK
      ?auto_623359 - BLOCK
      ?auto_623360 - BLOCK
      ?auto_623361 - BLOCK
    )
    :vars
    (
      ?auto_623362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623361 ?auto_623362 ) ( ON-TABLE ?auto_623349 ) ( ON ?auto_623350 ?auto_623349 ) ( ON ?auto_623351 ?auto_623350 ) ( ON ?auto_623352 ?auto_623351 ) ( ON ?auto_623353 ?auto_623352 ) ( ON ?auto_623354 ?auto_623353 ) ( not ( = ?auto_623349 ?auto_623350 ) ) ( not ( = ?auto_623349 ?auto_623351 ) ) ( not ( = ?auto_623349 ?auto_623352 ) ) ( not ( = ?auto_623349 ?auto_623353 ) ) ( not ( = ?auto_623349 ?auto_623354 ) ) ( not ( = ?auto_623349 ?auto_623355 ) ) ( not ( = ?auto_623349 ?auto_623356 ) ) ( not ( = ?auto_623349 ?auto_623357 ) ) ( not ( = ?auto_623349 ?auto_623358 ) ) ( not ( = ?auto_623349 ?auto_623359 ) ) ( not ( = ?auto_623349 ?auto_623360 ) ) ( not ( = ?auto_623349 ?auto_623361 ) ) ( not ( = ?auto_623349 ?auto_623362 ) ) ( not ( = ?auto_623350 ?auto_623351 ) ) ( not ( = ?auto_623350 ?auto_623352 ) ) ( not ( = ?auto_623350 ?auto_623353 ) ) ( not ( = ?auto_623350 ?auto_623354 ) ) ( not ( = ?auto_623350 ?auto_623355 ) ) ( not ( = ?auto_623350 ?auto_623356 ) ) ( not ( = ?auto_623350 ?auto_623357 ) ) ( not ( = ?auto_623350 ?auto_623358 ) ) ( not ( = ?auto_623350 ?auto_623359 ) ) ( not ( = ?auto_623350 ?auto_623360 ) ) ( not ( = ?auto_623350 ?auto_623361 ) ) ( not ( = ?auto_623350 ?auto_623362 ) ) ( not ( = ?auto_623351 ?auto_623352 ) ) ( not ( = ?auto_623351 ?auto_623353 ) ) ( not ( = ?auto_623351 ?auto_623354 ) ) ( not ( = ?auto_623351 ?auto_623355 ) ) ( not ( = ?auto_623351 ?auto_623356 ) ) ( not ( = ?auto_623351 ?auto_623357 ) ) ( not ( = ?auto_623351 ?auto_623358 ) ) ( not ( = ?auto_623351 ?auto_623359 ) ) ( not ( = ?auto_623351 ?auto_623360 ) ) ( not ( = ?auto_623351 ?auto_623361 ) ) ( not ( = ?auto_623351 ?auto_623362 ) ) ( not ( = ?auto_623352 ?auto_623353 ) ) ( not ( = ?auto_623352 ?auto_623354 ) ) ( not ( = ?auto_623352 ?auto_623355 ) ) ( not ( = ?auto_623352 ?auto_623356 ) ) ( not ( = ?auto_623352 ?auto_623357 ) ) ( not ( = ?auto_623352 ?auto_623358 ) ) ( not ( = ?auto_623352 ?auto_623359 ) ) ( not ( = ?auto_623352 ?auto_623360 ) ) ( not ( = ?auto_623352 ?auto_623361 ) ) ( not ( = ?auto_623352 ?auto_623362 ) ) ( not ( = ?auto_623353 ?auto_623354 ) ) ( not ( = ?auto_623353 ?auto_623355 ) ) ( not ( = ?auto_623353 ?auto_623356 ) ) ( not ( = ?auto_623353 ?auto_623357 ) ) ( not ( = ?auto_623353 ?auto_623358 ) ) ( not ( = ?auto_623353 ?auto_623359 ) ) ( not ( = ?auto_623353 ?auto_623360 ) ) ( not ( = ?auto_623353 ?auto_623361 ) ) ( not ( = ?auto_623353 ?auto_623362 ) ) ( not ( = ?auto_623354 ?auto_623355 ) ) ( not ( = ?auto_623354 ?auto_623356 ) ) ( not ( = ?auto_623354 ?auto_623357 ) ) ( not ( = ?auto_623354 ?auto_623358 ) ) ( not ( = ?auto_623354 ?auto_623359 ) ) ( not ( = ?auto_623354 ?auto_623360 ) ) ( not ( = ?auto_623354 ?auto_623361 ) ) ( not ( = ?auto_623354 ?auto_623362 ) ) ( not ( = ?auto_623355 ?auto_623356 ) ) ( not ( = ?auto_623355 ?auto_623357 ) ) ( not ( = ?auto_623355 ?auto_623358 ) ) ( not ( = ?auto_623355 ?auto_623359 ) ) ( not ( = ?auto_623355 ?auto_623360 ) ) ( not ( = ?auto_623355 ?auto_623361 ) ) ( not ( = ?auto_623355 ?auto_623362 ) ) ( not ( = ?auto_623356 ?auto_623357 ) ) ( not ( = ?auto_623356 ?auto_623358 ) ) ( not ( = ?auto_623356 ?auto_623359 ) ) ( not ( = ?auto_623356 ?auto_623360 ) ) ( not ( = ?auto_623356 ?auto_623361 ) ) ( not ( = ?auto_623356 ?auto_623362 ) ) ( not ( = ?auto_623357 ?auto_623358 ) ) ( not ( = ?auto_623357 ?auto_623359 ) ) ( not ( = ?auto_623357 ?auto_623360 ) ) ( not ( = ?auto_623357 ?auto_623361 ) ) ( not ( = ?auto_623357 ?auto_623362 ) ) ( not ( = ?auto_623358 ?auto_623359 ) ) ( not ( = ?auto_623358 ?auto_623360 ) ) ( not ( = ?auto_623358 ?auto_623361 ) ) ( not ( = ?auto_623358 ?auto_623362 ) ) ( not ( = ?auto_623359 ?auto_623360 ) ) ( not ( = ?auto_623359 ?auto_623361 ) ) ( not ( = ?auto_623359 ?auto_623362 ) ) ( not ( = ?auto_623360 ?auto_623361 ) ) ( not ( = ?auto_623360 ?auto_623362 ) ) ( not ( = ?auto_623361 ?auto_623362 ) ) ( ON ?auto_623360 ?auto_623361 ) ( ON ?auto_623359 ?auto_623360 ) ( ON ?auto_623358 ?auto_623359 ) ( ON ?auto_623357 ?auto_623358 ) ( ON ?auto_623356 ?auto_623357 ) ( CLEAR ?auto_623354 ) ( ON ?auto_623355 ?auto_623356 ) ( CLEAR ?auto_623355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_623349 ?auto_623350 ?auto_623351 ?auto_623352 ?auto_623353 ?auto_623354 ?auto_623355 )
      ( MAKE-13PILE ?auto_623349 ?auto_623350 ?auto_623351 ?auto_623352 ?auto_623353 ?auto_623354 ?auto_623355 ?auto_623356 ?auto_623357 ?auto_623358 ?auto_623359 ?auto_623360 ?auto_623361 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623403 - BLOCK
      ?auto_623404 - BLOCK
      ?auto_623405 - BLOCK
      ?auto_623406 - BLOCK
      ?auto_623407 - BLOCK
      ?auto_623408 - BLOCK
      ?auto_623409 - BLOCK
      ?auto_623410 - BLOCK
      ?auto_623411 - BLOCK
      ?auto_623412 - BLOCK
      ?auto_623413 - BLOCK
      ?auto_623414 - BLOCK
      ?auto_623415 - BLOCK
    )
    :vars
    (
      ?auto_623416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623415 ?auto_623416 ) ( ON-TABLE ?auto_623403 ) ( ON ?auto_623404 ?auto_623403 ) ( ON ?auto_623405 ?auto_623404 ) ( ON ?auto_623406 ?auto_623405 ) ( ON ?auto_623407 ?auto_623406 ) ( not ( = ?auto_623403 ?auto_623404 ) ) ( not ( = ?auto_623403 ?auto_623405 ) ) ( not ( = ?auto_623403 ?auto_623406 ) ) ( not ( = ?auto_623403 ?auto_623407 ) ) ( not ( = ?auto_623403 ?auto_623408 ) ) ( not ( = ?auto_623403 ?auto_623409 ) ) ( not ( = ?auto_623403 ?auto_623410 ) ) ( not ( = ?auto_623403 ?auto_623411 ) ) ( not ( = ?auto_623403 ?auto_623412 ) ) ( not ( = ?auto_623403 ?auto_623413 ) ) ( not ( = ?auto_623403 ?auto_623414 ) ) ( not ( = ?auto_623403 ?auto_623415 ) ) ( not ( = ?auto_623403 ?auto_623416 ) ) ( not ( = ?auto_623404 ?auto_623405 ) ) ( not ( = ?auto_623404 ?auto_623406 ) ) ( not ( = ?auto_623404 ?auto_623407 ) ) ( not ( = ?auto_623404 ?auto_623408 ) ) ( not ( = ?auto_623404 ?auto_623409 ) ) ( not ( = ?auto_623404 ?auto_623410 ) ) ( not ( = ?auto_623404 ?auto_623411 ) ) ( not ( = ?auto_623404 ?auto_623412 ) ) ( not ( = ?auto_623404 ?auto_623413 ) ) ( not ( = ?auto_623404 ?auto_623414 ) ) ( not ( = ?auto_623404 ?auto_623415 ) ) ( not ( = ?auto_623404 ?auto_623416 ) ) ( not ( = ?auto_623405 ?auto_623406 ) ) ( not ( = ?auto_623405 ?auto_623407 ) ) ( not ( = ?auto_623405 ?auto_623408 ) ) ( not ( = ?auto_623405 ?auto_623409 ) ) ( not ( = ?auto_623405 ?auto_623410 ) ) ( not ( = ?auto_623405 ?auto_623411 ) ) ( not ( = ?auto_623405 ?auto_623412 ) ) ( not ( = ?auto_623405 ?auto_623413 ) ) ( not ( = ?auto_623405 ?auto_623414 ) ) ( not ( = ?auto_623405 ?auto_623415 ) ) ( not ( = ?auto_623405 ?auto_623416 ) ) ( not ( = ?auto_623406 ?auto_623407 ) ) ( not ( = ?auto_623406 ?auto_623408 ) ) ( not ( = ?auto_623406 ?auto_623409 ) ) ( not ( = ?auto_623406 ?auto_623410 ) ) ( not ( = ?auto_623406 ?auto_623411 ) ) ( not ( = ?auto_623406 ?auto_623412 ) ) ( not ( = ?auto_623406 ?auto_623413 ) ) ( not ( = ?auto_623406 ?auto_623414 ) ) ( not ( = ?auto_623406 ?auto_623415 ) ) ( not ( = ?auto_623406 ?auto_623416 ) ) ( not ( = ?auto_623407 ?auto_623408 ) ) ( not ( = ?auto_623407 ?auto_623409 ) ) ( not ( = ?auto_623407 ?auto_623410 ) ) ( not ( = ?auto_623407 ?auto_623411 ) ) ( not ( = ?auto_623407 ?auto_623412 ) ) ( not ( = ?auto_623407 ?auto_623413 ) ) ( not ( = ?auto_623407 ?auto_623414 ) ) ( not ( = ?auto_623407 ?auto_623415 ) ) ( not ( = ?auto_623407 ?auto_623416 ) ) ( not ( = ?auto_623408 ?auto_623409 ) ) ( not ( = ?auto_623408 ?auto_623410 ) ) ( not ( = ?auto_623408 ?auto_623411 ) ) ( not ( = ?auto_623408 ?auto_623412 ) ) ( not ( = ?auto_623408 ?auto_623413 ) ) ( not ( = ?auto_623408 ?auto_623414 ) ) ( not ( = ?auto_623408 ?auto_623415 ) ) ( not ( = ?auto_623408 ?auto_623416 ) ) ( not ( = ?auto_623409 ?auto_623410 ) ) ( not ( = ?auto_623409 ?auto_623411 ) ) ( not ( = ?auto_623409 ?auto_623412 ) ) ( not ( = ?auto_623409 ?auto_623413 ) ) ( not ( = ?auto_623409 ?auto_623414 ) ) ( not ( = ?auto_623409 ?auto_623415 ) ) ( not ( = ?auto_623409 ?auto_623416 ) ) ( not ( = ?auto_623410 ?auto_623411 ) ) ( not ( = ?auto_623410 ?auto_623412 ) ) ( not ( = ?auto_623410 ?auto_623413 ) ) ( not ( = ?auto_623410 ?auto_623414 ) ) ( not ( = ?auto_623410 ?auto_623415 ) ) ( not ( = ?auto_623410 ?auto_623416 ) ) ( not ( = ?auto_623411 ?auto_623412 ) ) ( not ( = ?auto_623411 ?auto_623413 ) ) ( not ( = ?auto_623411 ?auto_623414 ) ) ( not ( = ?auto_623411 ?auto_623415 ) ) ( not ( = ?auto_623411 ?auto_623416 ) ) ( not ( = ?auto_623412 ?auto_623413 ) ) ( not ( = ?auto_623412 ?auto_623414 ) ) ( not ( = ?auto_623412 ?auto_623415 ) ) ( not ( = ?auto_623412 ?auto_623416 ) ) ( not ( = ?auto_623413 ?auto_623414 ) ) ( not ( = ?auto_623413 ?auto_623415 ) ) ( not ( = ?auto_623413 ?auto_623416 ) ) ( not ( = ?auto_623414 ?auto_623415 ) ) ( not ( = ?auto_623414 ?auto_623416 ) ) ( not ( = ?auto_623415 ?auto_623416 ) ) ( ON ?auto_623414 ?auto_623415 ) ( ON ?auto_623413 ?auto_623414 ) ( ON ?auto_623412 ?auto_623413 ) ( ON ?auto_623411 ?auto_623412 ) ( ON ?auto_623410 ?auto_623411 ) ( ON ?auto_623409 ?auto_623410 ) ( CLEAR ?auto_623407 ) ( ON ?auto_623408 ?auto_623409 ) ( CLEAR ?auto_623408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_623403 ?auto_623404 ?auto_623405 ?auto_623406 ?auto_623407 ?auto_623408 )
      ( MAKE-13PILE ?auto_623403 ?auto_623404 ?auto_623405 ?auto_623406 ?auto_623407 ?auto_623408 ?auto_623409 ?auto_623410 ?auto_623411 ?auto_623412 ?auto_623413 ?auto_623414 ?auto_623415 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623457 - BLOCK
      ?auto_623458 - BLOCK
      ?auto_623459 - BLOCK
      ?auto_623460 - BLOCK
      ?auto_623461 - BLOCK
      ?auto_623462 - BLOCK
      ?auto_623463 - BLOCK
      ?auto_623464 - BLOCK
      ?auto_623465 - BLOCK
      ?auto_623466 - BLOCK
      ?auto_623467 - BLOCK
      ?auto_623468 - BLOCK
      ?auto_623469 - BLOCK
    )
    :vars
    (
      ?auto_623470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623469 ?auto_623470 ) ( ON-TABLE ?auto_623457 ) ( ON ?auto_623458 ?auto_623457 ) ( ON ?auto_623459 ?auto_623458 ) ( ON ?auto_623460 ?auto_623459 ) ( not ( = ?auto_623457 ?auto_623458 ) ) ( not ( = ?auto_623457 ?auto_623459 ) ) ( not ( = ?auto_623457 ?auto_623460 ) ) ( not ( = ?auto_623457 ?auto_623461 ) ) ( not ( = ?auto_623457 ?auto_623462 ) ) ( not ( = ?auto_623457 ?auto_623463 ) ) ( not ( = ?auto_623457 ?auto_623464 ) ) ( not ( = ?auto_623457 ?auto_623465 ) ) ( not ( = ?auto_623457 ?auto_623466 ) ) ( not ( = ?auto_623457 ?auto_623467 ) ) ( not ( = ?auto_623457 ?auto_623468 ) ) ( not ( = ?auto_623457 ?auto_623469 ) ) ( not ( = ?auto_623457 ?auto_623470 ) ) ( not ( = ?auto_623458 ?auto_623459 ) ) ( not ( = ?auto_623458 ?auto_623460 ) ) ( not ( = ?auto_623458 ?auto_623461 ) ) ( not ( = ?auto_623458 ?auto_623462 ) ) ( not ( = ?auto_623458 ?auto_623463 ) ) ( not ( = ?auto_623458 ?auto_623464 ) ) ( not ( = ?auto_623458 ?auto_623465 ) ) ( not ( = ?auto_623458 ?auto_623466 ) ) ( not ( = ?auto_623458 ?auto_623467 ) ) ( not ( = ?auto_623458 ?auto_623468 ) ) ( not ( = ?auto_623458 ?auto_623469 ) ) ( not ( = ?auto_623458 ?auto_623470 ) ) ( not ( = ?auto_623459 ?auto_623460 ) ) ( not ( = ?auto_623459 ?auto_623461 ) ) ( not ( = ?auto_623459 ?auto_623462 ) ) ( not ( = ?auto_623459 ?auto_623463 ) ) ( not ( = ?auto_623459 ?auto_623464 ) ) ( not ( = ?auto_623459 ?auto_623465 ) ) ( not ( = ?auto_623459 ?auto_623466 ) ) ( not ( = ?auto_623459 ?auto_623467 ) ) ( not ( = ?auto_623459 ?auto_623468 ) ) ( not ( = ?auto_623459 ?auto_623469 ) ) ( not ( = ?auto_623459 ?auto_623470 ) ) ( not ( = ?auto_623460 ?auto_623461 ) ) ( not ( = ?auto_623460 ?auto_623462 ) ) ( not ( = ?auto_623460 ?auto_623463 ) ) ( not ( = ?auto_623460 ?auto_623464 ) ) ( not ( = ?auto_623460 ?auto_623465 ) ) ( not ( = ?auto_623460 ?auto_623466 ) ) ( not ( = ?auto_623460 ?auto_623467 ) ) ( not ( = ?auto_623460 ?auto_623468 ) ) ( not ( = ?auto_623460 ?auto_623469 ) ) ( not ( = ?auto_623460 ?auto_623470 ) ) ( not ( = ?auto_623461 ?auto_623462 ) ) ( not ( = ?auto_623461 ?auto_623463 ) ) ( not ( = ?auto_623461 ?auto_623464 ) ) ( not ( = ?auto_623461 ?auto_623465 ) ) ( not ( = ?auto_623461 ?auto_623466 ) ) ( not ( = ?auto_623461 ?auto_623467 ) ) ( not ( = ?auto_623461 ?auto_623468 ) ) ( not ( = ?auto_623461 ?auto_623469 ) ) ( not ( = ?auto_623461 ?auto_623470 ) ) ( not ( = ?auto_623462 ?auto_623463 ) ) ( not ( = ?auto_623462 ?auto_623464 ) ) ( not ( = ?auto_623462 ?auto_623465 ) ) ( not ( = ?auto_623462 ?auto_623466 ) ) ( not ( = ?auto_623462 ?auto_623467 ) ) ( not ( = ?auto_623462 ?auto_623468 ) ) ( not ( = ?auto_623462 ?auto_623469 ) ) ( not ( = ?auto_623462 ?auto_623470 ) ) ( not ( = ?auto_623463 ?auto_623464 ) ) ( not ( = ?auto_623463 ?auto_623465 ) ) ( not ( = ?auto_623463 ?auto_623466 ) ) ( not ( = ?auto_623463 ?auto_623467 ) ) ( not ( = ?auto_623463 ?auto_623468 ) ) ( not ( = ?auto_623463 ?auto_623469 ) ) ( not ( = ?auto_623463 ?auto_623470 ) ) ( not ( = ?auto_623464 ?auto_623465 ) ) ( not ( = ?auto_623464 ?auto_623466 ) ) ( not ( = ?auto_623464 ?auto_623467 ) ) ( not ( = ?auto_623464 ?auto_623468 ) ) ( not ( = ?auto_623464 ?auto_623469 ) ) ( not ( = ?auto_623464 ?auto_623470 ) ) ( not ( = ?auto_623465 ?auto_623466 ) ) ( not ( = ?auto_623465 ?auto_623467 ) ) ( not ( = ?auto_623465 ?auto_623468 ) ) ( not ( = ?auto_623465 ?auto_623469 ) ) ( not ( = ?auto_623465 ?auto_623470 ) ) ( not ( = ?auto_623466 ?auto_623467 ) ) ( not ( = ?auto_623466 ?auto_623468 ) ) ( not ( = ?auto_623466 ?auto_623469 ) ) ( not ( = ?auto_623466 ?auto_623470 ) ) ( not ( = ?auto_623467 ?auto_623468 ) ) ( not ( = ?auto_623467 ?auto_623469 ) ) ( not ( = ?auto_623467 ?auto_623470 ) ) ( not ( = ?auto_623468 ?auto_623469 ) ) ( not ( = ?auto_623468 ?auto_623470 ) ) ( not ( = ?auto_623469 ?auto_623470 ) ) ( ON ?auto_623468 ?auto_623469 ) ( ON ?auto_623467 ?auto_623468 ) ( ON ?auto_623466 ?auto_623467 ) ( ON ?auto_623465 ?auto_623466 ) ( ON ?auto_623464 ?auto_623465 ) ( ON ?auto_623463 ?auto_623464 ) ( ON ?auto_623462 ?auto_623463 ) ( CLEAR ?auto_623460 ) ( ON ?auto_623461 ?auto_623462 ) ( CLEAR ?auto_623461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_623457 ?auto_623458 ?auto_623459 ?auto_623460 ?auto_623461 )
      ( MAKE-13PILE ?auto_623457 ?auto_623458 ?auto_623459 ?auto_623460 ?auto_623461 ?auto_623462 ?auto_623463 ?auto_623464 ?auto_623465 ?auto_623466 ?auto_623467 ?auto_623468 ?auto_623469 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623511 - BLOCK
      ?auto_623512 - BLOCK
      ?auto_623513 - BLOCK
      ?auto_623514 - BLOCK
      ?auto_623515 - BLOCK
      ?auto_623516 - BLOCK
      ?auto_623517 - BLOCK
      ?auto_623518 - BLOCK
      ?auto_623519 - BLOCK
      ?auto_623520 - BLOCK
      ?auto_623521 - BLOCK
      ?auto_623522 - BLOCK
      ?auto_623523 - BLOCK
    )
    :vars
    (
      ?auto_623524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623523 ?auto_623524 ) ( ON-TABLE ?auto_623511 ) ( ON ?auto_623512 ?auto_623511 ) ( ON ?auto_623513 ?auto_623512 ) ( not ( = ?auto_623511 ?auto_623512 ) ) ( not ( = ?auto_623511 ?auto_623513 ) ) ( not ( = ?auto_623511 ?auto_623514 ) ) ( not ( = ?auto_623511 ?auto_623515 ) ) ( not ( = ?auto_623511 ?auto_623516 ) ) ( not ( = ?auto_623511 ?auto_623517 ) ) ( not ( = ?auto_623511 ?auto_623518 ) ) ( not ( = ?auto_623511 ?auto_623519 ) ) ( not ( = ?auto_623511 ?auto_623520 ) ) ( not ( = ?auto_623511 ?auto_623521 ) ) ( not ( = ?auto_623511 ?auto_623522 ) ) ( not ( = ?auto_623511 ?auto_623523 ) ) ( not ( = ?auto_623511 ?auto_623524 ) ) ( not ( = ?auto_623512 ?auto_623513 ) ) ( not ( = ?auto_623512 ?auto_623514 ) ) ( not ( = ?auto_623512 ?auto_623515 ) ) ( not ( = ?auto_623512 ?auto_623516 ) ) ( not ( = ?auto_623512 ?auto_623517 ) ) ( not ( = ?auto_623512 ?auto_623518 ) ) ( not ( = ?auto_623512 ?auto_623519 ) ) ( not ( = ?auto_623512 ?auto_623520 ) ) ( not ( = ?auto_623512 ?auto_623521 ) ) ( not ( = ?auto_623512 ?auto_623522 ) ) ( not ( = ?auto_623512 ?auto_623523 ) ) ( not ( = ?auto_623512 ?auto_623524 ) ) ( not ( = ?auto_623513 ?auto_623514 ) ) ( not ( = ?auto_623513 ?auto_623515 ) ) ( not ( = ?auto_623513 ?auto_623516 ) ) ( not ( = ?auto_623513 ?auto_623517 ) ) ( not ( = ?auto_623513 ?auto_623518 ) ) ( not ( = ?auto_623513 ?auto_623519 ) ) ( not ( = ?auto_623513 ?auto_623520 ) ) ( not ( = ?auto_623513 ?auto_623521 ) ) ( not ( = ?auto_623513 ?auto_623522 ) ) ( not ( = ?auto_623513 ?auto_623523 ) ) ( not ( = ?auto_623513 ?auto_623524 ) ) ( not ( = ?auto_623514 ?auto_623515 ) ) ( not ( = ?auto_623514 ?auto_623516 ) ) ( not ( = ?auto_623514 ?auto_623517 ) ) ( not ( = ?auto_623514 ?auto_623518 ) ) ( not ( = ?auto_623514 ?auto_623519 ) ) ( not ( = ?auto_623514 ?auto_623520 ) ) ( not ( = ?auto_623514 ?auto_623521 ) ) ( not ( = ?auto_623514 ?auto_623522 ) ) ( not ( = ?auto_623514 ?auto_623523 ) ) ( not ( = ?auto_623514 ?auto_623524 ) ) ( not ( = ?auto_623515 ?auto_623516 ) ) ( not ( = ?auto_623515 ?auto_623517 ) ) ( not ( = ?auto_623515 ?auto_623518 ) ) ( not ( = ?auto_623515 ?auto_623519 ) ) ( not ( = ?auto_623515 ?auto_623520 ) ) ( not ( = ?auto_623515 ?auto_623521 ) ) ( not ( = ?auto_623515 ?auto_623522 ) ) ( not ( = ?auto_623515 ?auto_623523 ) ) ( not ( = ?auto_623515 ?auto_623524 ) ) ( not ( = ?auto_623516 ?auto_623517 ) ) ( not ( = ?auto_623516 ?auto_623518 ) ) ( not ( = ?auto_623516 ?auto_623519 ) ) ( not ( = ?auto_623516 ?auto_623520 ) ) ( not ( = ?auto_623516 ?auto_623521 ) ) ( not ( = ?auto_623516 ?auto_623522 ) ) ( not ( = ?auto_623516 ?auto_623523 ) ) ( not ( = ?auto_623516 ?auto_623524 ) ) ( not ( = ?auto_623517 ?auto_623518 ) ) ( not ( = ?auto_623517 ?auto_623519 ) ) ( not ( = ?auto_623517 ?auto_623520 ) ) ( not ( = ?auto_623517 ?auto_623521 ) ) ( not ( = ?auto_623517 ?auto_623522 ) ) ( not ( = ?auto_623517 ?auto_623523 ) ) ( not ( = ?auto_623517 ?auto_623524 ) ) ( not ( = ?auto_623518 ?auto_623519 ) ) ( not ( = ?auto_623518 ?auto_623520 ) ) ( not ( = ?auto_623518 ?auto_623521 ) ) ( not ( = ?auto_623518 ?auto_623522 ) ) ( not ( = ?auto_623518 ?auto_623523 ) ) ( not ( = ?auto_623518 ?auto_623524 ) ) ( not ( = ?auto_623519 ?auto_623520 ) ) ( not ( = ?auto_623519 ?auto_623521 ) ) ( not ( = ?auto_623519 ?auto_623522 ) ) ( not ( = ?auto_623519 ?auto_623523 ) ) ( not ( = ?auto_623519 ?auto_623524 ) ) ( not ( = ?auto_623520 ?auto_623521 ) ) ( not ( = ?auto_623520 ?auto_623522 ) ) ( not ( = ?auto_623520 ?auto_623523 ) ) ( not ( = ?auto_623520 ?auto_623524 ) ) ( not ( = ?auto_623521 ?auto_623522 ) ) ( not ( = ?auto_623521 ?auto_623523 ) ) ( not ( = ?auto_623521 ?auto_623524 ) ) ( not ( = ?auto_623522 ?auto_623523 ) ) ( not ( = ?auto_623522 ?auto_623524 ) ) ( not ( = ?auto_623523 ?auto_623524 ) ) ( ON ?auto_623522 ?auto_623523 ) ( ON ?auto_623521 ?auto_623522 ) ( ON ?auto_623520 ?auto_623521 ) ( ON ?auto_623519 ?auto_623520 ) ( ON ?auto_623518 ?auto_623519 ) ( ON ?auto_623517 ?auto_623518 ) ( ON ?auto_623516 ?auto_623517 ) ( ON ?auto_623515 ?auto_623516 ) ( CLEAR ?auto_623513 ) ( ON ?auto_623514 ?auto_623515 ) ( CLEAR ?auto_623514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_623511 ?auto_623512 ?auto_623513 ?auto_623514 )
      ( MAKE-13PILE ?auto_623511 ?auto_623512 ?auto_623513 ?auto_623514 ?auto_623515 ?auto_623516 ?auto_623517 ?auto_623518 ?auto_623519 ?auto_623520 ?auto_623521 ?auto_623522 ?auto_623523 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623565 - BLOCK
      ?auto_623566 - BLOCK
      ?auto_623567 - BLOCK
      ?auto_623568 - BLOCK
      ?auto_623569 - BLOCK
      ?auto_623570 - BLOCK
      ?auto_623571 - BLOCK
      ?auto_623572 - BLOCK
      ?auto_623573 - BLOCK
      ?auto_623574 - BLOCK
      ?auto_623575 - BLOCK
      ?auto_623576 - BLOCK
      ?auto_623577 - BLOCK
    )
    :vars
    (
      ?auto_623578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623577 ?auto_623578 ) ( ON-TABLE ?auto_623565 ) ( ON ?auto_623566 ?auto_623565 ) ( not ( = ?auto_623565 ?auto_623566 ) ) ( not ( = ?auto_623565 ?auto_623567 ) ) ( not ( = ?auto_623565 ?auto_623568 ) ) ( not ( = ?auto_623565 ?auto_623569 ) ) ( not ( = ?auto_623565 ?auto_623570 ) ) ( not ( = ?auto_623565 ?auto_623571 ) ) ( not ( = ?auto_623565 ?auto_623572 ) ) ( not ( = ?auto_623565 ?auto_623573 ) ) ( not ( = ?auto_623565 ?auto_623574 ) ) ( not ( = ?auto_623565 ?auto_623575 ) ) ( not ( = ?auto_623565 ?auto_623576 ) ) ( not ( = ?auto_623565 ?auto_623577 ) ) ( not ( = ?auto_623565 ?auto_623578 ) ) ( not ( = ?auto_623566 ?auto_623567 ) ) ( not ( = ?auto_623566 ?auto_623568 ) ) ( not ( = ?auto_623566 ?auto_623569 ) ) ( not ( = ?auto_623566 ?auto_623570 ) ) ( not ( = ?auto_623566 ?auto_623571 ) ) ( not ( = ?auto_623566 ?auto_623572 ) ) ( not ( = ?auto_623566 ?auto_623573 ) ) ( not ( = ?auto_623566 ?auto_623574 ) ) ( not ( = ?auto_623566 ?auto_623575 ) ) ( not ( = ?auto_623566 ?auto_623576 ) ) ( not ( = ?auto_623566 ?auto_623577 ) ) ( not ( = ?auto_623566 ?auto_623578 ) ) ( not ( = ?auto_623567 ?auto_623568 ) ) ( not ( = ?auto_623567 ?auto_623569 ) ) ( not ( = ?auto_623567 ?auto_623570 ) ) ( not ( = ?auto_623567 ?auto_623571 ) ) ( not ( = ?auto_623567 ?auto_623572 ) ) ( not ( = ?auto_623567 ?auto_623573 ) ) ( not ( = ?auto_623567 ?auto_623574 ) ) ( not ( = ?auto_623567 ?auto_623575 ) ) ( not ( = ?auto_623567 ?auto_623576 ) ) ( not ( = ?auto_623567 ?auto_623577 ) ) ( not ( = ?auto_623567 ?auto_623578 ) ) ( not ( = ?auto_623568 ?auto_623569 ) ) ( not ( = ?auto_623568 ?auto_623570 ) ) ( not ( = ?auto_623568 ?auto_623571 ) ) ( not ( = ?auto_623568 ?auto_623572 ) ) ( not ( = ?auto_623568 ?auto_623573 ) ) ( not ( = ?auto_623568 ?auto_623574 ) ) ( not ( = ?auto_623568 ?auto_623575 ) ) ( not ( = ?auto_623568 ?auto_623576 ) ) ( not ( = ?auto_623568 ?auto_623577 ) ) ( not ( = ?auto_623568 ?auto_623578 ) ) ( not ( = ?auto_623569 ?auto_623570 ) ) ( not ( = ?auto_623569 ?auto_623571 ) ) ( not ( = ?auto_623569 ?auto_623572 ) ) ( not ( = ?auto_623569 ?auto_623573 ) ) ( not ( = ?auto_623569 ?auto_623574 ) ) ( not ( = ?auto_623569 ?auto_623575 ) ) ( not ( = ?auto_623569 ?auto_623576 ) ) ( not ( = ?auto_623569 ?auto_623577 ) ) ( not ( = ?auto_623569 ?auto_623578 ) ) ( not ( = ?auto_623570 ?auto_623571 ) ) ( not ( = ?auto_623570 ?auto_623572 ) ) ( not ( = ?auto_623570 ?auto_623573 ) ) ( not ( = ?auto_623570 ?auto_623574 ) ) ( not ( = ?auto_623570 ?auto_623575 ) ) ( not ( = ?auto_623570 ?auto_623576 ) ) ( not ( = ?auto_623570 ?auto_623577 ) ) ( not ( = ?auto_623570 ?auto_623578 ) ) ( not ( = ?auto_623571 ?auto_623572 ) ) ( not ( = ?auto_623571 ?auto_623573 ) ) ( not ( = ?auto_623571 ?auto_623574 ) ) ( not ( = ?auto_623571 ?auto_623575 ) ) ( not ( = ?auto_623571 ?auto_623576 ) ) ( not ( = ?auto_623571 ?auto_623577 ) ) ( not ( = ?auto_623571 ?auto_623578 ) ) ( not ( = ?auto_623572 ?auto_623573 ) ) ( not ( = ?auto_623572 ?auto_623574 ) ) ( not ( = ?auto_623572 ?auto_623575 ) ) ( not ( = ?auto_623572 ?auto_623576 ) ) ( not ( = ?auto_623572 ?auto_623577 ) ) ( not ( = ?auto_623572 ?auto_623578 ) ) ( not ( = ?auto_623573 ?auto_623574 ) ) ( not ( = ?auto_623573 ?auto_623575 ) ) ( not ( = ?auto_623573 ?auto_623576 ) ) ( not ( = ?auto_623573 ?auto_623577 ) ) ( not ( = ?auto_623573 ?auto_623578 ) ) ( not ( = ?auto_623574 ?auto_623575 ) ) ( not ( = ?auto_623574 ?auto_623576 ) ) ( not ( = ?auto_623574 ?auto_623577 ) ) ( not ( = ?auto_623574 ?auto_623578 ) ) ( not ( = ?auto_623575 ?auto_623576 ) ) ( not ( = ?auto_623575 ?auto_623577 ) ) ( not ( = ?auto_623575 ?auto_623578 ) ) ( not ( = ?auto_623576 ?auto_623577 ) ) ( not ( = ?auto_623576 ?auto_623578 ) ) ( not ( = ?auto_623577 ?auto_623578 ) ) ( ON ?auto_623576 ?auto_623577 ) ( ON ?auto_623575 ?auto_623576 ) ( ON ?auto_623574 ?auto_623575 ) ( ON ?auto_623573 ?auto_623574 ) ( ON ?auto_623572 ?auto_623573 ) ( ON ?auto_623571 ?auto_623572 ) ( ON ?auto_623570 ?auto_623571 ) ( ON ?auto_623569 ?auto_623570 ) ( ON ?auto_623568 ?auto_623569 ) ( CLEAR ?auto_623566 ) ( ON ?auto_623567 ?auto_623568 ) ( CLEAR ?auto_623567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_623565 ?auto_623566 ?auto_623567 )
      ( MAKE-13PILE ?auto_623565 ?auto_623566 ?auto_623567 ?auto_623568 ?auto_623569 ?auto_623570 ?auto_623571 ?auto_623572 ?auto_623573 ?auto_623574 ?auto_623575 ?auto_623576 ?auto_623577 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623619 - BLOCK
      ?auto_623620 - BLOCK
      ?auto_623621 - BLOCK
      ?auto_623622 - BLOCK
      ?auto_623623 - BLOCK
      ?auto_623624 - BLOCK
      ?auto_623625 - BLOCK
      ?auto_623626 - BLOCK
      ?auto_623627 - BLOCK
      ?auto_623628 - BLOCK
      ?auto_623629 - BLOCK
      ?auto_623630 - BLOCK
      ?auto_623631 - BLOCK
    )
    :vars
    (
      ?auto_623632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623631 ?auto_623632 ) ( ON-TABLE ?auto_623619 ) ( not ( = ?auto_623619 ?auto_623620 ) ) ( not ( = ?auto_623619 ?auto_623621 ) ) ( not ( = ?auto_623619 ?auto_623622 ) ) ( not ( = ?auto_623619 ?auto_623623 ) ) ( not ( = ?auto_623619 ?auto_623624 ) ) ( not ( = ?auto_623619 ?auto_623625 ) ) ( not ( = ?auto_623619 ?auto_623626 ) ) ( not ( = ?auto_623619 ?auto_623627 ) ) ( not ( = ?auto_623619 ?auto_623628 ) ) ( not ( = ?auto_623619 ?auto_623629 ) ) ( not ( = ?auto_623619 ?auto_623630 ) ) ( not ( = ?auto_623619 ?auto_623631 ) ) ( not ( = ?auto_623619 ?auto_623632 ) ) ( not ( = ?auto_623620 ?auto_623621 ) ) ( not ( = ?auto_623620 ?auto_623622 ) ) ( not ( = ?auto_623620 ?auto_623623 ) ) ( not ( = ?auto_623620 ?auto_623624 ) ) ( not ( = ?auto_623620 ?auto_623625 ) ) ( not ( = ?auto_623620 ?auto_623626 ) ) ( not ( = ?auto_623620 ?auto_623627 ) ) ( not ( = ?auto_623620 ?auto_623628 ) ) ( not ( = ?auto_623620 ?auto_623629 ) ) ( not ( = ?auto_623620 ?auto_623630 ) ) ( not ( = ?auto_623620 ?auto_623631 ) ) ( not ( = ?auto_623620 ?auto_623632 ) ) ( not ( = ?auto_623621 ?auto_623622 ) ) ( not ( = ?auto_623621 ?auto_623623 ) ) ( not ( = ?auto_623621 ?auto_623624 ) ) ( not ( = ?auto_623621 ?auto_623625 ) ) ( not ( = ?auto_623621 ?auto_623626 ) ) ( not ( = ?auto_623621 ?auto_623627 ) ) ( not ( = ?auto_623621 ?auto_623628 ) ) ( not ( = ?auto_623621 ?auto_623629 ) ) ( not ( = ?auto_623621 ?auto_623630 ) ) ( not ( = ?auto_623621 ?auto_623631 ) ) ( not ( = ?auto_623621 ?auto_623632 ) ) ( not ( = ?auto_623622 ?auto_623623 ) ) ( not ( = ?auto_623622 ?auto_623624 ) ) ( not ( = ?auto_623622 ?auto_623625 ) ) ( not ( = ?auto_623622 ?auto_623626 ) ) ( not ( = ?auto_623622 ?auto_623627 ) ) ( not ( = ?auto_623622 ?auto_623628 ) ) ( not ( = ?auto_623622 ?auto_623629 ) ) ( not ( = ?auto_623622 ?auto_623630 ) ) ( not ( = ?auto_623622 ?auto_623631 ) ) ( not ( = ?auto_623622 ?auto_623632 ) ) ( not ( = ?auto_623623 ?auto_623624 ) ) ( not ( = ?auto_623623 ?auto_623625 ) ) ( not ( = ?auto_623623 ?auto_623626 ) ) ( not ( = ?auto_623623 ?auto_623627 ) ) ( not ( = ?auto_623623 ?auto_623628 ) ) ( not ( = ?auto_623623 ?auto_623629 ) ) ( not ( = ?auto_623623 ?auto_623630 ) ) ( not ( = ?auto_623623 ?auto_623631 ) ) ( not ( = ?auto_623623 ?auto_623632 ) ) ( not ( = ?auto_623624 ?auto_623625 ) ) ( not ( = ?auto_623624 ?auto_623626 ) ) ( not ( = ?auto_623624 ?auto_623627 ) ) ( not ( = ?auto_623624 ?auto_623628 ) ) ( not ( = ?auto_623624 ?auto_623629 ) ) ( not ( = ?auto_623624 ?auto_623630 ) ) ( not ( = ?auto_623624 ?auto_623631 ) ) ( not ( = ?auto_623624 ?auto_623632 ) ) ( not ( = ?auto_623625 ?auto_623626 ) ) ( not ( = ?auto_623625 ?auto_623627 ) ) ( not ( = ?auto_623625 ?auto_623628 ) ) ( not ( = ?auto_623625 ?auto_623629 ) ) ( not ( = ?auto_623625 ?auto_623630 ) ) ( not ( = ?auto_623625 ?auto_623631 ) ) ( not ( = ?auto_623625 ?auto_623632 ) ) ( not ( = ?auto_623626 ?auto_623627 ) ) ( not ( = ?auto_623626 ?auto_623628 ) ) ( not ( = ?auto_623626 ?auto_623629 ) ) ( not ( = ?auto_623626 ?auto_623630 ) ) ( not ( = ?auto_623626 ?auto_623631 ) ) ( not ( = ?auto_623626 ?auto_623632 ) ) ( not ( = ?auto_623627 ?auto_623628 ) ) ( not ( = ?auto_623627 ?auto_623629 ) ) ( not ( = ?auto_623627 ?auto_623630 ) ) ( not ( = ?auto_623627 ?auto_623631 ) ) ( not ( = ?auto_623627 ?auto_623632 ) ) ( not ( = ?auto_623628 ?auto_623629 ) ) ( not ( = ?auto_623628 ?auto_623630 ) ) ( not ( = ?auto_623628 ?auto_623631 ) ) ( not ( = ?auto_623628 ?auto_623632 ) ) ( not ( = ?auto_623629 ?auto_623630 ) ) ( not ( = ?auto_623629 ?auto_623631 ) ) ( not ( = ?auto_623629 ?auto_623632 ) ) ( not ( = ?auto_623630 ?auto_623631 ) ) ( not ( = ?auto_623630 ?auto_623632 ) ) ( not ( = ?auto_623631 ?auto_623632 ) ) ( ON ?auto_623630 ?auto_623631 ) ( ON ?auto_623629 ?auto_623630 ) ( ON ?auto_623628 ?auto_623629 ) ( ON ?auto_623627 ?auto_623628 ) ( ON ?auto_623626 ?auto_623627 ) ( ON ?auto_623625 ?auto_623626 ) ( ON ?auto_623624 ?auto_623625 ) ( ON ?auto_623623 ?auto_623624 ) ( ON ?auto_623622 ?auto_623623 ) ( ON ?auto_623621 ?auto_623622 ) ( CLEAR ?auto_623619 ) ( ON ?auto_623620 ?auto_623621 ) ( CLEAR ?auto_623620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_623619 ?auto_623620 )
      ( MAKE-13PILE ?auto_623619 ?auto_623620 ?auto_623621 ?auto_623622 ?auto_623623 ?auto_623624 ?auto_623625 ?auto_623626 ?auto_623627 ?auto_623628 ?auto_623629 ?auto_623630 ?auto_623631 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_623673 - BLOCK
      ?auto_623674 - BLOCK
      ?auto_623675 - BLOCK
      ?auto_623676 - BLOCK
      ?auto_623677 - BLOCK
      ?auto_623678 - BLOCK
      ?auto_623679 - BLOCK
      ?auto_623680 - BLOCK
      ?auto_623681 - BLOCK
      ?auto_623682 - BLOCK
      ?auto_623683 - BLOCK
      ?auto_623684 - BLOCK
      ?auto_623685 - BLOCK
    )
    :vars
    (
      ?auto_623686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623685 ?auto_623686 ) ( not ( = ?auto_623673 ?auto_623674 ) ) ( not ( = ?auto_623673 ?auto_623675 ) ) ( not ( = ?auto_623673 ?auto_623676 ) ) ( not ( = ?auto_623673 ?auto_623677 ) ) ( not ( = ?auto_623673 ?auto_623678 ) ) ( not ( = ?auto_623673 ?auto_623679 ) ) ( not ( = ?auto_623673 ?auto_623680 ) ) ( not ( = ?auto_623673 ?auto_623681 ) ) ( not ( = ?auto_623673 ?auto_623682 ) ) ( not ( = ?auto_623673 ?auto_623683 ) ) ( not ( = ?auto_623673 ?auto_623684 ) ) ( not ( = ?auto_623673 ?auto_623685 ) ) ( not ( = ?auto_623673 ?auto_623686 ) ) ( not ( = ?auto_623674 ?auto_623675 ) ) ( not ( = ?auto_623674 ?auto_623676 ) ) ( not ( = ?auto_623674 ?auto_623677 ) ) ( not ( = ?auto_623674 ?auto_623678 ) ) ( not ( = ?auto_623674 ?auto_623679 ) ) ( not ( = ?auto_623674 ?auto_623680 ) ) ( not ( = ?auto_623674 ?auto_623681 ) ) ( not ( = ?auto_623674 ?auto_623682 ) ) ( not ( = ?auto_623674 ?auto_623683 ) ) ( not ( = ?auto_623674 ?auto_623684 ) ) ( not ( = ?auto_623674 ?auto_623685 ) ) ( not ( = ?auto_623674 ?auto_623686 ) ) ( not ( = ?auto_623675 ?auto_623676 ) ) ( not ( = ?auto_623675 ?auto_623677 ) ) ( not ( = ?auto_623675 ?auto_623678 ) ) ( not ( = ?auto_623675 ?auto_623679 ) ) ( not ( = ?auto_623675 ?auto_623680 ) ) ( not ( = ?auto_623675 ?auto_623681 ) ) ( not ( = ?auto_623675 ?auto_623682 ) ) ( not ( = ?auto_623675 ?auto_623683 ) ) ( not ( = ?auto_623675 ?auto_623684 ) ) ( not ( = ?auto_623675 ?auto_623685 ) ) ( not ( = ?auto_623675 ?auto_623686 ) ) ( not ( = ?auto_623676 ?auto_623677 ) ) ( not ( = ?auto_623676 ?auto_623678 ) ) ( not ( = ?auto_623676 ?auto_623679 ) ) ( not ( = ?auto_623676 ?auto_623680 ) ) ( not ( = ?auto_623676 ?auto_623681 ) ) ( not ( = ?auto_623676 ?auto_623682 ) ) ( not ( = ?auto_623676 ?auto_623683 ) ) ( not ( = ?auto_623676 ?auto_623684 ) ) ( not ( = ?auto_623676 ?auto_623685 ) ) ( not ( = ?auto_623676 ?auto_623686 ) ) ( not ( = ?auto_623677 ?auto_623678 ) ) ( not ( = ?auto_623677 ?auto_623679 ) ) ( not ( = ?auto_623677 ?auto_623680 ) ) ( not ( = ?auto_623677 ?auto_623681 ) ) ( not ( = ?auto_623677 ?auto_623682 ) ) ( not ( = ?auto_623677 ?auto_623683 ) ) ( not ( = ?auto_623677 ?auto_623684 ) ) ( not ( = ?auto_623677 ?auto_623685 ) ) ( not ( = ?auto_623677 ?auto_623686 ) ) ( not ( = ?auto_623678 ?auto_623679 ) ) ( not ( = ?auto_623678 ?auto_623680 ) ) ( not ( = ?auto_623678 ?auto_623681 ) ) ( not ( = ?auto_623678 ?auto_623682 ) ) ( not ( = ?auto_623678 ?auto_623683 ) ) ( not ( = ?auto_623678 ?auto_623684 ) ) ( not ( = ?auto_623678 ?auto_623685 ) ) ( not ( = ?auto_623678 ?auto_623686 ) ) ( not ( = ?auto_623679 ?auto_623680 ) ) ( not ( = ?auto_623679 ?auto_623681 ) ) ( not ( = ?auto_623679 ?auto_623682 ) ) ( not ( = ?auto_623679 ?auto_623683 ) ) ( not ( = ?auto_623679 ?auto_623684 ) ) ( not ( = ?auto_623679 ?auto_623685 ) ) ( not ( = ?auto_623679 ?auto_623686 ) ) ( not ( = ?auto_623680 ?auto_623681 ) ) ( not ( = ?auto_623680 ?auto_623682 ) ) ( not ( = ?auto_623680 ?auto_623683 ) ) ( not ( = ?auto_623680 ?auto_623684 ) ) ( not ( = ?auto_623680 ?auto_623685 ) ) ( not ( = ?auto_623680 ?auto_623686 ) ) ( not ( = ?auto_623681 ?auto_623682 ) ) ( not ( = ?auto_623681 ?auto_623683 ) ) ( not ( = ?auto_623681 ?auto_623684 ) ) ( not ( = ?auto_623681 ?auto_623685 ) ) ( not ( = ?auto_623681 ?auto_623686 ) ) ( not ( = ?auto_623682 ?auto_623683 ) ) ( not ( = ?auto_623682 ?auto_623684 ) ) ( not ( = ?auto_623682 ?auto_623685 ) ) ( not ( = ?auto_623682 ?auto_623686 ) ) ( not ( = ?auto_623683 ?auto_623684 ) ) ( not ( = ?auto_623683 ?auto_623685 ) ) ( not ( = ?auto_623683 ?auto_623686 ) ) ( not ( = ?auto_623684 ?auto_623685 ) ) ( not ( = ?auto_623684 ?auto_623686 ) ) ( not ( = ?auto_623685 ?auto_623686 ) ) ( ON ?auto_623684 ?auto_623685 ) ( ON ?auto_623683 ?auto_623684 ) ( ON ?auto_623682 ?auto_623683 ) ( ON ?auto_623681 ?auto_623682 ) ( ON ?auto_623680 ?auto_623681 ) ( ON ?auto_623679 ?auto_623680 ) ( ON ?auto_623678 ?auto_623679 ) ( ON ?auto_623677 ?auto_623678 ) ( ON ?auto_623676 ?auto_623677 ) ( ON ?auto_623675 ?auto_623676 ) ( ON ?auto_623674 ?auto_623675 ) ( ON ?auto_623673 ?auto_623674 ) ( CLEAR ?auto_623673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_623673 )
      ( MAKE-13PILE ?auto_623673 ?auto_623674 ?auto_623675 ?auto_623676 ?auto_623677 ?auto_623678 ?auto_623679 ?auto_623680 ?auto_623681 ?auto_623682 ?auto_623683 ?auto_623684 ?auto_623685 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_623728 - BLOCK
      ?auto_623729 - BLOCK
      ?auto_623730 - BLOCK
      ?auto_623731 - BLOCK
      ?auto_623732 - BLOCK
      ?auto_623733 - BLOCK
      ?auto_623734 - BLOCK
      ?auto_623735 - BLOCK
      ?auto_623736 - BLOCK
      ?auto_623737 - BLOCK
      ?auto_623738 - BLOCK
      ?auto_623739 - BLOCK
      ?auto_623740 - BLOCK
      ?auto_623741 - BLOCK
    )
    :vars
    (
      ?auto_623742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_623740 ) ( ON ?auto_623741 ?auto_623742 ) ( CLEAR ?auto_623741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_623728 ) ( ON ?auto_623729 ?auto_623728 ) ( ON ?auto_623730 ?auto_623729 ) ( ON ?auto_623731 ?auto_623730 ) ( ON ?auto_623732 ?auto_623731 ) ( ON ?auto_623733 ?auto_623732 ) ( ON ?auto_623734 ?auto_623733 ) ( ON ?auto_623735 ?auto_623734 ) ( ON ?auto_623736 ?auto_623735 ) ( ON ?auto_623737 ?auto_623736 ) ( ON ?auto_623738 ?auto_623737 ) ( ON ?auto_623739 ?auto_623738 ) ( ON ?auto_623740 ?auto_623739 ) ( not ( = ?auto_623728 ?auto_623729 ) ) ( not ( = ?auto_623728 ?auto_623730 ) ) ( not ( = ?auto_623728 ?auto_623731 ) ) ( not ( = ?auto_623728 ?auto_623732 ) ) ( not ( = ?auto_623728 ?auto_623733 ) ) ( not ( = ?auto_623728 ?auto_623734 ) ) ( not ( = ?auto_623728 ?auto_623735 ) ) ( not ( = ?auto_623728 ?auto_623736 ) ) ( not ( = ?auto_623728 ?auto_623737 ) ) ( not ( = ?auto_623728 ?auto_623738 ) ) ( not ( = ?auto_623728 ?auto_623739 ) ) ( not ( = ?auto_623728 ?auto_623740 ) ) ( not ( = ?auto_623728 ?auto_623741 ) ) ( not ( = ?auto_623728 ?auto_623742 ) ) ( not ( = ?auto_623729 ?auto_623730 ) ) ( not ( = ?auto_623729 ?auto_623731 ) ) ( not ( = ?auto_623729 ?auto_623732 ) ) ( not ( = ?auto_623729 ?auto_623733 ) ) ( not ( = ?auto_623729 ?auto_623734 ) ) ( not ( = ?auto_623729 ?auto_623735 ) ) ( not ( = ?auto_623729 ?auto_623736 ) ) ( not ( = ?auto_623729 ?auto_623737 ) ) ( not ( = ?auto_623729 ?auto_623738 ) ) ( not ( = ?auto_623729 ?auto_623739 ) ) ( not ( = ?auto_623729 ?auto_623740 ) ) ( not ( = ?auto_623729 ?auto_623741 ) ) ( not ( = ?auto_623729 ?auto_623742 ) ) ( not ( = ?auto_623730 ?auto_623731 ) ) ( not ( = ?auto_623730 ?auto_623732 ) ) ( not ( = ?auto_623730 ?auto_623733 ) ) ( not ( = ?auto_623730 ?auto_623734 ) ) ( not ( = ?auto_623730 ?auto_623735 ) ) ( not ( = ?auto_623730 ?auto_623736 ) ) ( not ( = ?auto_623730 ?auto_623737 ) ) ( not ( = ?auto_623730 ?auto_623738 ) ) ( not ( = ?auto_623730 ?auto_623739 ) ) ( not ( = ?auto_623730 ?auto_623740 ) ) ( not ( = ?auto_623730 ?auto_623741 ) ) ( not ( = ?auto_623730 ?auto_623742 ) ) ( not ( = ?auto_623731 ?auto_623732 ) ) ( not ( = ?auto_623731 ?auto_623733 ) ) ( not ( = ?auto_623731 ?auto_623734 ) ) ( not ( = ?auto_623731 ?auto_623735 ) ) ( not ( = ?auto_623731 ?auto_623736 ) ) ( not ( = ?auto_623731 ?auto_623737 ) ) ( not ( = ?auto_623731 ?auto_623738 ) ) ( not ( = ?auto_623731 ?auto_623739 ) ) ( not ( = ?auto_623731 ?auto_623740 ) ) ( not ( = ?auto_623731 ?auto_623741 ) ) ( not ( = ?auto_623731 ?auto_623742 ) ) ( not ( = ?auto_623732 ?auto_623733 ) ) ( not ( = ?auto_623732 ?auto_623734 ) ) ( not ( = ?auto_623732 ?auto_623735 ) ) ( not ( = ?auto_623732 ?auto_623736 ) ) ( not ( = ?auto_623732 ?auto_623737 ) ) ( not ( = ?auto_623732 ?auto_623738 ) ) ( not ( = ?auto_623732 ?auto_623739 ) ) ( not ( = ?auto_623732 ?auto_623740 ) ) ( not ( = ?auto_623732 ?auto_623741 ) ) ( not ( = ?auto_623732 ?auto_623742 ) ) ( not ( = ?auto_623733 ?auto_623734 ) ) ( not ( = ?auto_623733 ?auto_623735 ) ) ( not ( = ?auto_623733 ?auto_623736 ) ) ( not ( = ?auto_623733 ?auto_623737 ) ) ( not ( = ?auto_623733 ?auto_623738 ) ) ( not ( = ?auto_623733 ?auto_623739 ) ) ( not ( = ?auto_623733 ?auto_623740 ) ) ( not ( = ?auto_623733 ?auto_623741 ) ) ( not ( = ?auto_623733 ?auto_623742 ) ) ( not ( = ?auto_623734 ?auto_623735 ) ) ( not ( = ?auto_623734 ?auto_623736 ) ) ( not ( = ?auto_623734 ?auto_623737 ) ) ( not ( = ?auto_623734 ?auto_623738 ) ) ( not ( = ?auto_623734 ?auto_623739 ) ) ( not ( = ?auto_623734 ?auto_623740 ) ) ( not ( = ?auto_623734 ?auto_623741 ) ) ( not ( = ?auto_623734 ?auto_623742 ) ) ( not ( = ?auto_623735 ?auto_623736 ) ) ( not ( = ?auto_623735 ?auto_623737 ) ) ( not ( = ?auto_623735 ?auto_623738 ) ) ( not ( = ?auto_623735 ?auto_623739 ) ) ( not ( = ?auto_623735 ?auto_623740 ) ) ( not ( = ?auto_623735 ?auto_623741 ) ) ( not ( = ?auto_623735 ?auto_623742 ) ) ( not ( = ?auto_623736 ?auto_623737 ) ) ( not ( = ?auto_623736 ?auto_623738 ) ) ( not ( = ?auto_623736 ?auto_623739 ) ) ( not ( = ?auto_623736 ?auto_623740 ) ) ( not ( = ?auto_623736 ?auto_623741 ) ) ( not ( = ?auto_623736 ?auto_623742 ) ) ( not ( = ?auto_623737 ?auto_623738 ) ) ( not ( = ?auto_623737 ?auto_623739 ) ) ( not ( = ?auto_623737 ?auto_623740 ) ) ( not ( = ?auto_623737 ?auto_623741 ) ) ( not ( = ?auto_623737 ?auto_623742 ) ) ( not ( = ?auto_623738 ?auto_623739 ) ) ( not ( = ?auto_623738 ?auto_623740 ) ) ( not ( = ?auto_623738 ?auto_623741 ) ) ( not ( = ?auto_623738 ?auto_623742 ) ) ( not ( = ?auto_623739 ?auto_623740 ) ) ( not ( = ?auto_623739 ?auto_623741 ) ) ( not ( = ?auto_623739 ?auto_623742 ) ) ( not ( = ?auto_623740 ?auto_623741 ) ) ( not ( = ?auto_623740 ?auto_623742 ) ) ( not ( = ?auto_623741 ?auto_623742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_623741 ?auto_623742 )
      ( !STACK ?auto_623741 ?auto_623740 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_623786 - BLOCK
      ?auto_623787 - BLOCK
      ?auto_623788 - BLOCK
      ?auto_623789 - BLOCK
      ?auto_623790 - BLOCK
      ?auto_623791 - BLOCK
      ?auto_623792 - BLOCK
      ?auto_623793 - BLOCK
      ?auto_623794 - BLOCK
      ?auto_623795 - BLOCK
      ?auto_623796 - BLOCK
      ?auto_623797 - BLOCK
      ?auto_623798 - BLOCK
      ?auto_623799 - BLOCK
    )
    :vars
    (
      ?auto_623800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623799 ?auto_623800 ) ( ON-TABLE ?auto_623786 ) ( ON ?auto_623787 ?auto_623786 ) ( ON ?auto_623788 ?auto_623787 ) ( ON ?auto_623789 ?auto_623788 ) ( ON ?auto_623790 ?auto_623789 ) ( ON ?auto_623791 ?auto_623790 ) ( ON ?auto_623792 ?auto_623791 ) ( ON ?auto_623793 ?auto_623792 ) ( ON ?auto_623794 ?auto_623793 ) ( ON ?auto_623795 ?auto_623794 ) ( ON ?auto_623796 ?auto_623795 ) ( ON ?auto_623797 ?auto_623796 ) ( not ( = ?auto_623786 ?auto_623787 ) ) ( not ( = ?auto_623786 ?auto_623788 ) ) ( not ( = ?auto_623786 ?auto_623789 ) ) ( not ( = ?auto_623786 ?auto_623790 ) ) ( not ( = ?auto_623786 ?auto_623791 ) ) ( not ( = ?auto_623786 ?auto_623792 ) ) ( not ( = ?auto_623786 ?auto_623793 ) ) ( not ( = ?auto_623786 ?auto_623794 ) ) ( not ( = ?auto_623786 ?auto_623795 ) ) ( not ( = ?auto_623786 ?auto_623796 ) ) ( not ( = ?auto_623786 ?auto_623797 ) ) ( not ( = ?auto_623786 ?auto_623798 ) ) ( not ( = ?auto_623786 ?auto_623799 ) ) ( not ( = ?auto_623786 ?auto_623800 ) ) ( not ( = ?auto_623787 ?auto_623788 ) ) ( not ( = ?auto_623787 ?auto_623789 ) ) ( not ( = ?auto_623787 ?auto_623790 ) ) ( not ( = ?auto_623787 ?auto_623791 ) ) ( not ( = ?auto_623787 ?auto_623792 ) ) ( not ( = ?auto_623787 ?auto_623793 ) ) ( not ( = ?auto_623787 ?auto_623794 ) ) ( not ( = ?auto_623787 ?auto_623795 ) ) ( not ( = ?auto_623787 ?auto_623796 ) ) ( not ( = ?auto_623787 ?auto_623797 ) ) ( not ( = ?auto_623787 ?auto_623798 ) ) ( not ( = ?auto_623787 ?auto_623799 ) ) ( not ( = ?auto_623787 ?auto_623800 ) ) ( not ( = ?auto_623788 ?auto_623789 ) ) ( not ( = ?auto_623788 ?auto_623790 ) ) ( not ( = ?auto_623788 ?auto_623791 ) ) ( not ( = ?auto_623788 ?auto_623792 ) ) ( not ( = ?auto_623788 ?auto_623793 ) ) ( not ( = ?auto_623788 ?auto_623794 ) ) ( not ( = ?auto_623788 ?auto_623795 ) ) ( not ( = ?auto_623788 ?auto_623796 ) ) ( not ( = ?auto_623788 ?auto_623797 ) ) ( not ( = ?auto_623788 ?auto_623798 ) ) ( not ( = ?auto_623788 ?auto_623799 ) ) ( not ( = ?auto_623788 ?auto_623800 ) ) ( not ( = ?auto_623789 ?auto_623790 ) ) ( not ( = ?auto_623789 ?auto_623791 ) ) ( not ( = ?auto_623789 ?auto_623792 ) ) ( not ( = ?auto_623789 ?auto_623793 ) ) ( not ( = ?auto_623789 ?auto_623794 ) ) ( not ( = ?auto_623789 ?auto_623795 ) ) ( not ( = ?auto_623789 ?auto_623796 ) ) ( not ( = ?auto_623789 ?auto_623797 ) ) ( not ( = ?auto_623789 ?auto_623798 ) ) ( not ( = ?auto_623789 ?auto_623799 ) ) ( not ( = ?auto_623789 ?auto_623800 ) ) ( not ( = ?auto_623790 ?auto_623791 ) ) ( not ( = ?auto_623790 ?auto_623792 ) ) ( not ( = ?auto_623790 ?auto_623793 ) ) ( not ( = ?auto_623790 ?auto_623794 ) ) ( not ( = ?auto_623790 ?auto_623795 ) ) ( not ( = ?auto_623790 ?auto_623796 ) ) ( not ( = ?auto_623790 ?auto_623797 ) ) ( not ( = ?auto_623790 ?auto_623798 ) ) ( not ( = ?auto_623790 ?auto_623799 ) ) ( not ( = ?auto_623790 ?auto_623800 ) ) ( not ( = ?auto_623791 ?auto_623792 ) ) ( not ( = ?auto_623791 ?auto_623793 ) ) ( not ( = ?auto_623791 ?auto_623794 ) ) ( not ( = ?auto_623791 ?auto_623795 ) ) ( not ( = ?auto_623791 ?auto_623796 ) ) ( not ( = ?auto_623791 ?auto_623797 ) ) ( not ( = ?auto_623791 ?auto_623798 ) ) ( not ( = ?auto_623791 ?auto_623799 ) ) ( not ( = ?auto_623791 ?auto_623800 ) ) ( not ( = ?auto_623792 ?auto_623793 ) ) ( not ( = ?auto_623792 ?auto_623794 ) ) ( not ( = ?auto_623792 ?auto_623795 ) ) ( not ( = ?auto_623792 ?auto_623796 ) ) ( not ( = ?auto_623792 ?auto_623797 ) ) ( not ( = ?auto_623792 ?auto_623798 ) ) ( not ( = ?auto_623792 ?auto_623799 ) ) ( not ( = ?auto_623792 ?auto_623800 ) ) ( not ( = ?auto_623793 ?auto_623794 ) ) ( not ( = ?auto_623793 ?auto_623795 ) ) ( not ( = ?auto_623793 ?auto_623796 ) ) ( not ( = ?auto_623793 ?auto_623797 ) ) ( not ( = ?auto_623793 ?auto_623798 ) ) ( not ( = ?auto_623793 ?auto_623799 ) ) ( not ( = ?auto_623793 ?auto_623800 ) ) ( not ( = ?auto_623794 ?auto_623795 ) ) ( not ( = ?auto_623794 ?auto_623796 ) ) ( not ( = ?auto_623794 ?auto_623797 ) ) ( not ( = ?auto_623794 ?auto_623798 ) ) ( not ( = ?auto_623794 ?auto_623799 ) ) ( not ( = ?auto_623794 ?auto_623800 ) ) ( not ( = ?auto_623795 ?auto_623796 ) ) ( not ( = ?auto_623795 ?auto_623797 ) ) ( not ( = ?auto_623795 ?auto_623798 ) ) ( not ( = ?auto_623795 ?auto_623799 ) ) ( not ( = ?auto_623795 ?auto_623800 ) ) ( not ( = ?auto_623796 ?auto_623797 ) ) ( not ( = ?auto_623796 ?auto_623798 ) ) ( not ( = ?auto_623796 ?auto_623799 ) ) ( not ( = ?auto_623796 ?auto_623800 ) ) ( not ( = ?auto_623797 ?auto_623798 ) ) ( not ( = ?auto_623797 ?auto_623799 ) ) ( not ( = ?auto_623797 ?auto_623800 ) ) ( not ( = ?auto_623798 ?auto_623799 ) ) ( not ( = ?auto_623798 ?auto_623800 ) ) ( not ( = ?auto_623799 ?auto_623800 ) ) ( CLEAR ?auto_623797 ) ( ON ?auto_623798 ?auto_623799 ) ( CLEAR ?auto_623798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_623786 ?auto_623787 ?auto_623788 ?auto_623789 ?auto_623790 ?auto_623791 ?auto_623792 ?auto_623793 ?auto_623794 ?auto_623795 ?auto_623796 ?auto_623797 ?auto_623798 )
      ( MAKE-14PILE ?auto_623786 ?auto_623787 ?auto_623788 ?auto_623789 ?auto_623790 ?auto_623791 ?auto_623792 ?auto_623793 ?auto_623794 ?auto_623795 ?auto_623796 ?auto_623797 ?auto_623798 ?auto_623799 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_623844 - BLOCK
      ?auto_623845 - BLOCK
      ?auto_623846 - BLOCK
      ?auto_623847 - BLOCK
      ?auto_623848 - BLOCK
      ?auto_623849 - BLOCK
      ?auto_623850 - BLOCK
      ?auto_623851 - BLOCK
      ?auto_623852 - BLOCK
      ?auto_623853 - BLOCK
      ?auto_623854 - BLOCK
      ?auto_623855 - BLOCK
      ?auto_623856 - BLOCK
      ?auto_623857 - BLOCK
    )
    :vars
    (
      ?auto_623858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623857 ?auto_623858 ) ( ON-TABLE ?auto_623844 ) ( ON ?auto_623845 ?auto_623844 ) ( ON ?auto_623846 ?auto_623845 ) ( ON ?auto_623847 ?auto_623846 ) ( ON ?auto_623848 ?auto_623847 ) ( ON ?auto_623849 ?auto_623848 ) ( ON ?auto_623850 ?auto_623849 ) ( ON ?auto_623851 ?auto_623850 ) ( ON ?auto_623852 ?auto_623851 ) ( ON ?auto_623853 ?auto_623852 ) ( ON ?auto_623854 ?auto_623853 ) ( not ( = ?auto_623844 ?auto_623845 ) ) ( not ( = ?auto_623844 ?auto_623846 ) ) ( not ( = ?auto_623844 ?auto_623847 ) ) ( not ( = ?auto_623844 ?auto_623848 ) ) ( not ( = ?auto_623844 ?auto_623849 ) ) ( not ( = ?auto_623844 ?auto_623850 ) ) ( not ( = ?auto_623844 ?auto_623851 ) ) ( not ( = ?auto_623844 ?auto_623852 ) ) ( not ( = ?auto_623844 ?auto_623853 ) ) ( not ( = ?auto_623844 ?auto_623854 ) ) ( not ( = ?auto_623844 ?auto_623855 ) ) ( not ( = ?auto_623844 ?auto_623856 ) ) ( not ( = ?auto_623844 ?auto_623857 ) ) ( not ( = ?auto_623844 ?auto_623858 ) ) ( not ( = ?auto_623845 ?auto_623846 ) ) ( not ( = ?auto_623845 ?auto_623847 ) ) ( not ( = ?auto_623845 ?auto_623848 ) ) ( not ( = ?auto_623845 ?auto_623849 ) ) ( not ( = ?auto_623845 ?auto_623850 ) ) ( not ( = ?auto_623845 ?auto_623851 ) ) ( not ( = ?auto_623845 ?auto_623852 ) ) ( not ( = ?auto_623845 ?auto_623853 ) ) ( not ( = ?auto_623845 ?auto_623854 ) ) ( not ( = ?auto_623845 ?auto_623855 ) ) ( not ( = ?auto_623845 ?auto_623856 ) ) ( not ( = ?auto_623845 ?auto_623857 ) ) ( not ( = ?auto_623845 ?auto_623858 ) ) ( not ( = ?auto_623846 ?auto_623847 ) ) ( not ( = ?auto_623846 ?auto_623848 ) ) ( not ( = ?auto_623846 ?auto_623849 ) ) ( not ( = ?auto_623846 ?auto_623850 ) ) ( not ( = ?auto_623846 ?auto_623851 ) ) ( not ( = ?auto_623846 ?auto_623852 ) ) ( not ( = ?auto_623846 ?auto_623853 ) ) ( not ( = ?auto_623846 ?auto_623854 ) ) ( not ( = ?auto_623846 ?auto_623855 ) ) ( not ( = ?auto_623846 ?auto_623856 ) ) ( not ( = ?auto_623846 ?auto_623857 ) ) ( not ( = ?auto_623846 ?auto_623858 ) ) ( not ( = ?auto_623847 ?auto_623848 ) ) ( not ( = ?auto_623847 ?auto_623849 ) ) ( not ( = ?auto_623847 ?auto_623850 ) ) ( not ( = ?auto_623847 ?auto_623851 ) ) ( not ( = ?auto_623847 ?auto_623852 ) ) ( not ( = ?auto_623847 ?auto_623853 ) ) ( not ( = ?auto_623847 ?auto_623854 ) ) ( not ( = ?auto_623847 ?auto_623855 ) ) ( not ( = ?auto_623847 ?auto_623856 ) ) ( not ( = ?auto_623847 ?auto_623857 ) ) ( not ( = ?auto_623847 ?auto_623858 ) ) ( not ( = ?auto_623848 ?auto_623849 ) ) ( not ( = ?auto_623848 ?auto_623850 ) ) ( not ( = ?auto_623848 ?auto_623851 ) ) ( not ( = ?auto_623848 ?auto_623852 ) ) ( not ( = ?auto_623848 ?auto_623853 ) ) ( not ( = ?auto_623848 ?auto_623854 ) ) ( not ( = ?auto_623848 ?auto_623855 ) ) ( not ( = ?auto_623848 ?auto_623856 ) ) ( not ( = ?auto_623848 ?auto_623857 ) ) ( not ( = ?auto_623848 ?auto_623858 ) ) ( not ( = ?auto_623849 ?auto_623850 ) ) ( not ( = ?auto_623849 ?auto_623851 ) ) ( not ( = ?auto_623849 ?auto_623852 ) ) ( not ( = ?auto_623849 ?auto_623853 ) ) ( not ( = ?auto_623849 ?auto_623854 ) ) ( not ( = ?auto_623849 ?auto_623855 ) ) ( not ( = ?auto_623849 ?auto_623856 ) ) ( not ( = ?auto_623849 ?auto_623857 ) ) ( not ( = ?auto_623849 ?auto_623858 ) ) ( not ( = ?auto_623850 ?auto_623851 ) ) ( not ( = ?auto_623850 ?auto_623852 ) ) ( not ( = ?auto_623850 ?auto_623853 ) ) ( not ( = ?auto_623850 ?auto_623854 ) ) ( not ( = ?auto_623850 ?auto_623855 ) ) ( not ( = ?auto_623850 ?auto_623856 ) ) ( not ( = ?auto_623850 ?auto_623857 ) ) ( not ( = ?auto_623850 ?auto_623858 ) ) ( not ( = ?auto_623851 ?auto_623852 ) ) ( not ( = ?auto_623851 ?auto_623853 ) ) ( not ( = ?auto_623851 ?auto_623854 ) ) ( not ( = ?auto_623851 ?auto_623855 ) ) ( not ( = ?auto_623851 ?auto_623856 ) ) ( not ( = ?auto_623851 ?auto_623857 ) ) ( not ( = ?auto_623851 ?auto_623858 ) ) ( not ( = ?auto_623852 ?auto_623853 ) ) ( not ( = ?auto_623852 ?auto_623854 ) ) ( not ( = ?auto_623852 ?auto_623855 ) ) ( not ( = ?auto_623852 ?auto_623856 ) ) ( not ( = ?auto_623852 ?auto_623857 ) ) ( not ( = ?auto_623852 ?auto_623858 ) ) ( not ( = ?auto_623853 ?auto_623854 ) ) ( not ( = ?auto_623853 ?auto_623855 ) ) ( not ( = ?auto_623853 ?auto_623856 ) ) ( not ( = ?auto_623853 ?auto_623857 ) ) ( not ( = ?auto_623853 ?auto_623858 ) ) ( not ( = ?auto_623854 ?auto_623855 ) ) ( not ( = ?auto_623854 ?auto_623856 ) ) ( not ( = ?auto_623854 ?auto_623857 ) ) ( not ( = ?auto_623854 ?auto_623858 ) ) ( not ( = ?auto_623855 ?auto_623856 ) ) ( not ( = ?auto_623855 ?auto_623857 ) ) ( not ( = ?auto_623855 ?auto_623858 ) ) ( not ( = ?auto_623856 ?auto_623857 ) ) ( not ( = ?auto_623856 ?auto_623858 ) ) ( not ( = ?auto_623857 ?auto_623858 ) ) ( ON ?auto_623856 ?auto_623857 ) ( CLEAR ?auto_623854 ) ( ON ?auto_623855 ?auto_623856 ) ( CLEAR ?auto_623855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_623844 ?auto_623845 ?auto_623846 ?auto_623847 ?auto_623848 ?auto_623849 ?auto_623850 ?auto_623851 ?auto_623852 ?auto_623853 ?auto_623854 ?auto_623855 )
      ( MAKE-14PILE ?auto_623844 ?auto_623845 ?auto_623846 ?auto_623847 ?auto_623848 ?auto_623849 ?auto_623850 ?auto_623851 ?auto_623852 ?auto_623853 ?auto_623854 ?auto_623855 ?auto_623856 ?auto_623857 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_623902 - BLOCK
      ?auto_623903 - BLOCK
      ?auto_623904 - BLOCK
      ?auto_623905 - BLOCK
      ?auto_623906 - BLOCK
      ?auto_623907 - BLOCK
      ?auto_623908 - BLOCK
      ?auto_623909 - BLOCK
      ?auto_623910 - BLOCK
      ?auto_623911 - BLOCK
      ?auto_623912 - BLOCK
      ?auto_623913 - BLOCK
      ?auto_623914 - BLOCK
      ?auto_623915 - BLOCK
    )
    :vars
    (
      ?auto_623916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623915 ?auto_623916 ) ( ON-TABLE ?auto_623902 ) ( ON ?auto_623903 ?auto_623902 ) ( ON ?auto_623904 ?auto_623903 ) ( ON ?auto_623905 ?auto_623904 ) ( ON ?auto_623906 ?auto_623905 ) ( ON ?auto_623907 ?auto_623906 ) ( ON ?auto_623908 ?auto_623907 ) ( ON ?auto_623909 ?auto_623908 ) ( ON ?auto_623910 ?auto_623909 ) ( ON ?auto_623911 ?auto_623910 ) ( not ( = ?auto_623902 ?auto_623903 ) ) ( not ( = ?auto_623902 ?auto_623904 ) ) ( not ( = ?auto_623902 ?auto_623905 ) ) ( not ( = ?auto_623902 ?auto_623906 ) ) ( not ( = ?auto_623902 ?auto_623907 ) ) ( not ( = ?auto_623902 ?auto_623908 ) ) ( not ( = ?auto_623902 ?auto_623909 ) ) ( not ( = ?auto_623902 ?auto_623910 ) ) ( not ( = ?auto_623902 ?auto_623911 ) ) ( not ( = ?auto_623902 ?auto_623912 ) ) ( not ( = ?auto_623902 ?auto_623913 ) ) ( not ( = ?auto_623902 ?auto_623914 ) ) ( not ( = ?auto_623902 ?auto_623915 ) ) ( not ( = ?auto_623902 ?auto_623916 ) ) ( not ( = ?auto_623903 ?auto_623904 ) ) ( not ( = ?auto_623903 ?auto_623905 ) ) ( not ( = ?auto_623903 ?auto_623906 ) ) ( not ( = ?auto_623903 ?auto_623907 ) ) ( not ( = ?auto_623903 ?auto_623908 ) ) ( not ( = ?auto_623903 ?auto_623909 ) ) ( not ( = ?auto_623903 ?auto_623910 ) ) ( not ( = ?auto_623903 ?auto_623911 ) ) ( not ( = ?auto_623903 ?auto_623912 ) ) ( not ( = ?auto_623903 ?auto_623913 ) ) ( not ( = ?auto_623903 ?auto_623914 ) ) ( not ( = ?auto_623903 ?auto_623915 ) ) ( not ( = ?auto_623903 ?auto_623916 ) ) ( not ( = ?auto_623904 ?auto_623905 ) ) ( not ( = ?auto_623904 ?auto_623906 ) ) ( not ( = ?auto_623904 ?auto_623907 ) ) ( not ( = ?auto_623904 ?auto_623908 ) ) ( not ( = ?auto_623904 ?auto_623909 ) ) ( not ( = ?auto_623904 ?auto_623910 ) ) ( not ( = ?auto_623904 ?auto_623911 ) ) ( not ( = ?auto_623904 ?auto_623912 ) ) ( not ( = ?auto_623904 ?auto_623913 ) ) ( not ( = ?auto_623904 ?auto_623914 ) ) ( not ( = ?auto_623904 ?auto_623915 ) ) ( not ( = ?auto_623904 ?auto_623916 ) ) ( not ( = ?auto_623905 ?auto_623906 ) ) ( not ( = ?auto_623905 ?auto_623907 ) ) ( not ( = ?auto_623905 ?auto_623908 ) ) ( not ( = ?auto_623905 ?auto_623909 ) ) ( not ( = ?auto_623905 ?auto_623910 ) ) ( not ( = ?auto_623905 ?auto_623911 ) ) ( not ( = ?auto_623905 ?auto_623912 ) ) ( not ( = ?auto_623905 ?auto_623913 ) ) ( not ( = ?auto_623905 ?auto_623914 ) ) ( not ( = ?auto_623905 ?auto_623915 ) ) ( not ( = ?auto_623905 ?auto_623916 ) ) ( not ( = ?auto_623906 ?auto_623907 ) ) ( not ( = ?auto_623906 ?auto_623908 ) ) ( not ( = ?auto_623906 ?auto_623909 ) ) ( not ( = ?auto_623906 ?auto_623910 ) ) ( not ( = ?auto_623906 ?auto_623911 ) ) ( not ( = ?auto_623906 ?auto_623912 ) ) ( not ( = ?auto_623906 ?auto_623913 ) ) ( not ( = ?auto_623906 ?auto_623914 ) ) ( not ( = ?auto_623906 ?auto_623915 ) ) ( not ( = ?auto_623906 ?auto_623916 ) ) ( not ( = ?auto_623907 ?auto_623908 ) ) ( not ( = ?auto_623907 ?auto_623909 ) ) ( not ( = ?auto_623907 ?auto_623910 ) ) ( not ( = ?auto_623907 ?auto_623911 ) ) ( not ( = ?auto_623907 ?auto_623912 ) ) ( not ( = ?auto_623907 ?auto_623913 ) ) ( not ( = ?auto_623907 ?auto_623914 ) ) ( not ( = ?auto_623907 ?auto_623915 ) ) ( not ( = ?auto_623907 ?auto_623916 ) ) ( not ( = ?auto_623908 ?auto_623909 ) ) ( not ( = ?auto_623908 ?auto_623910 ) ) ( not ( = ?auto_623908 ?auto_623911 ) ) ( not ( = ?auto_623908 ?auto_623912 ) ) ( not ( = ?auto_623908 ?auto_623913 ) ) ( not ( = ?auto_623908 ?auto_623914 ) ) ( not ( = ?auto_623908 ?auto_623915 ) ) ( not ( = ?auto_623908 ?auto_623916 ) ) ( not ( = ?auto_623909 ?auto_623910 ) ) ( not ( = ?auto_623909 ?auto_623911 ) ) ( not ( = ?auto_623909 ?auto_623912 ) ) ( not ( = ?auto_623909 ?auto_623913 ) ) ( not ( = ?auto_623909 ?auto_623914 ) ) ( not ( = ?auto_623909 ?auto_623915 ) ) ( not ( = ?auto_623909 ?auto_623916 ) ) ( not ( = ?auto_623910 ?auto_623911 ) ) ( not ( = ?auto_623910 ?auto_623912 ) ) ( not ( = ?auto_623910 ?auto_623913 ) ) ( not ( = ?auto_623910 ?auto_623914 ) ) ( not ( = ?auto_623910 ?auto_623915 ) ) ( not ( = ?auto_623910 ?auto_623916 ) ) ( not ( = ?auto_623911 ?auto_623912 ) ) ( not ( = ?auto_623911 ?auto_623913 ) ) ( not ( = ?auto_623911 ?auto_623914 ) ) ( not ( = ?auto_623911 ?auto_623915 ) ) ( not ( = ?auto_623911 ?auto_623916 ) ) ( not ( = ?auto_623912 ?auto_623913 ) ) ( not ( = ?auto_623912 ?auto_623914 ) ) ( not ( = ?auto_623912 ?auto_623915 ) ) ( not ( = ?auto_623912 ?auto_623916 ) ) ( not ( = ?auto_623913 ?auto_623914 ) ) ( not ( = ?auto_623913 ?auto_623915 ) ) ( not ( = ?auto_623913 ?auto_623916 ) ) ( not ( = ?auto_623914 ?auto_623915 ) ) ( not ( = ?auto_623914 ?auto_623916 ) ) ( not ( = ?auto_623915 ?auto_623916 ) ) ( ON ?auto_623914 ?auto_623915 ) ( ON ?auto_623913 ?auto_623914 ) ( CLEAR ?auto_623911 ) ( ON ?auto_623912 ?auto_623913 ) ( CLEAR ?auto_623912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_623902 ?auto_623903 ?auto_623904 ?auto_623905 ?auto_623906 ?auto_623907 ?auto_623908 ?auto_623909 ?auto_623910 ?auto_623911 ?auto_623912 )
      ( MAKE-14PILE ?auto_623902 ?auto_623903 ?auto_623904 ?auto_623905 ?auto_623906 ?auto_623907 ?auto_623908 ?auto_623909 ?auto_623910 ?auto_623911 ?auto_623912 ?auto_623913 ?auto_623914 ?auto_623915 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_623960 - BLOCK
      ?auto_623961 - BLOCK
      ?auto_623962 - BLOCK
      ?auto_623963 - BLOCK
      ?auto_623964 - BLOCK
      ?auto_623965 - BLOCK
      ?auto_623966 - BLOCK
      ?auto_623967 - BLOCK
      ?auto_623968 - BLOCK
      ?auto_623969 - BLOCK
      ?auto_623970 - BLOCK
      ?auto_623971 - BLOCK
      ?auto_623972 - BLOCK
      ?auto_623973 - BLOCK
    )
    :vars
    (
      ?auto_623974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_623973 ?auto_623974 ) ( ON-TABLE ?auto_623960 ) ( ON ?auto_623961 ?auto_623960 ) ( ON ?auto_623962 ?auto_623961 ) ( ON ?auto_623963 ?auto_623962 ) ( ON ?auto_623964 ?auto_623963 ) ( ON ?auto_623965 ?auto_623964 ) ( ON ?auto_623966 ?auto_623965 ) ( ON ?auto_623967 ?auto_623966 ) ( ON ?auto_623968 ?auto_623967 ) ( not ( = ?auto_623960 ?auto_623961 ) ) ( not ( = ?auto_623960 ?auto_623962 ) ) ( not ( = ?auto_623960 ?auto_623963 ) ) ( not ( = ?auto_623960 ?auto_623964 ) ) ( not ( = ?auto_623960 ?auto_623965 ) ) ( not ( = ?auto_623960 ?auto_623966 ) ) ( not ( = ?auto_623960 ?auto_623967 ) ) ( not ( = ?auto_623960 ?auto_623968 ) ) ( not ( = ?auto_623960 ?auto_623969 ) ) ( not ( = ?auto_623960 ?auto_623970 ) ) ( not ( = ?auto_623960 ?auto_623971 ) ) ( not ( = ?auto_623960 ?auto_623972 ) ) ( not ( = ?auto_623960 ?auto_623973 ) ) ( not ( = ?auto_623960 ?auto_623974 ) ) ( not ( = ?auto_623961 ?auto_623962 ) ) ( not ( = ?auto_623961 ?auto_623963 ) ) ( not ( = ?auto_623961 ?auto_623964 ) ) ( not ( = ?auto_623961 ?auto_623965 ) ) ( not ( = ?auto_623961 ?auto_623966 ) ) ( not ( = ?auto_623961 ?auto_623967 ) ) ( not ( = ?auto_623961 ?auto_623968 ) ) ( not ( = ?auto_623961 ?auto_623969 ) ) ( not ( = ?auto_623961 ?auto_623970 ) ) ( not ( = ?auto_623961 ?auto_623971 ) ) ( not ( = ?auto_623961 ?auto_623972 ) ) ( not ( = ?auto_623961 ?auto_623973 ) ) ( not ( = ?auto_623961 ?auto_623974 ) ) ( not ( = ?auto_623962 ?auto_623963 ) ) ( not ( = ?auto_623962 ?auto_623964 ) ) ( not ( = ?auto_623962 ?auto_623965 ) ) ( not ( = ?auto_623962 ?auto_623966 ) ) ( not ( = ?auto_623962 ?auto_623967 ) ) ( not ( = ?auto_623962 ?auto_623968 ) ) ( not ( = ?auto_623962 ?auto_623969 ) ) ( not ( = ?auto_623962 ?auto_623970 ) ) ( not ( = ?auto_623962 ?auto_623971 ) ) ( not ( = ?auto_623962 ?auto_623972 ) ) ( not ( = ?auto_623962 ?auto_623973 ) ) ( not ( = ?auto_623962 ?auto_623974 ) ) ( not ( = ?auto_623963 ?auto_623964 ) ) ( not ( = ?auto_623963 ?auto_623965 ) ) ( not ( = ?auto_623963 ?auto_623966 ) ) ( not ( = ?auto_623963 ?auto_623967 ) ) ( not ( = ?auto_623963 ?auto_623968 ) ) ( not ( = ?auto_623963 ?auto_623969 ) ) ( not ( = ?auto_623963 ?auto_623970 ) ) ( not ( = ?auto_623963 ?auto_623971 ) ) ( not ( = ?auto_623963 ?auto_623972 ) ) ( not ( = ?auto_623963 ?auto_623973 ) ) ( not ( = ?auto_623963 ?auto_623974 ) ) ( not ( = ?auto_623964 ?auto_623965 ) ) ( not ( = ?auto_623964 ?auto_623966 ) ) ( not ( = ?auto_623964 ?auto_623967 ) ) ( not ( = ?auto_623964 ?auto_623968 ) ) ( not ( = ?auto_623964 ?auto_623969 ) ) ( not ( = ?auto_623964 ?auto_623970 ) ) ( not ( = ?auto_623964 ?auto_623971 ) ) ( not ( = ?auto_623964 ?auto_623972 ) ) ( not ( = ?auto_623964 ?auto_623973 ) ) ( not ( = ?auto_623964 ?auto_623974 ) ) ( not ( = ?auto_623965 ?auto_623966 ) ) ( not ( = ?auto_623965 ?auto_623967 ) ) ( not ( = ?auto_623965 ?auto_623968 ) ) ( not ( = ?auto_623965 ?auto_623969 ) ) ( not ( = ?auto_623965 ?auto_623970 ) ) ( not ( = ?auto_623965 ?auto_623971 ) ) ( not ( = ?auto_623965 ?auto_623972 ) ) ( not ( = ?auto_623965 ?auto_623973 ) ) ( not ( = ?auto_623965 ?auto_623974 ) ) ( not ( = ?auto_623966 ?auto_623967 ) ) ( not ( = ?auto_623966 ?auto_623968 ) ) ( not ( = ?auto_623966 ?auto_623969 ) ) ( not ( = ?auto_623966 ?auto_623970 ) ) ( not ( = ?auto_623966 ?auto_623971 ) ) ( not ( = ?auto_623966 ?auto_623972 ) ) ( not ( = ?auto_623966 ?auto_623973 ) ) ( not ( = ?auto_623966 ?auto_623974 ) ) ( not ( = ?auto_623967 ?auto_623968 ) ) ( not ( = ?auto_623967 ?auto_623969 ) ) ( not ( = ?auto_623967 ?auto_623970 ) ) ( not ( = ?auto_623967 ?auto_623971 ) ) ( not ( = ?auto_623967 ?auto_623972 ) ) ( not ( = ?auto_623967 ?auto_623973 ) ) ( not ( = ?auto_623967 ?auto_623974 ) ) ( not ( = ?auto_623968 ?auto_623969 ) ) ( not ( = ?auto_623968 ?auto_623970 ) ) ( not ( = ?auto_623968 ?auto_623971 ) ) ( not ( = ?auto_623968 ?auto_623972 ) ) ( not ( = ?auto_623968 ?auto_623973 ) ) ( not ( = ?auto_623968 ?auto_623974 ) ) ( not ( = ?auto_623969 ?auto_623970 ) ) ( not ( = ?auto_623969 ?auto_623971 ) ) ( not ( = ?auto_623969 ?auto_623972 ) ) ( not ( = ?auto_623969 ?auto_623973 ) ) ( not ( = ?auto_623969 ?auto_623974 ) ) ( not ( = ?auto_623970 ?auto_623971 ) ) ( not ( = ?auto_623970 ?auto_623972 ) ) ( not ( = ?auto_623970 ?auto_623973 ) ) ( not ( = ?auto_623970 ?auto_623974 ) ) ( not ( = ?auto_623971 ?auto_623972 ) ) ( not ( = ?auto_623971 ?auto_623973 ) ) ( not ( = ?auto_623971 ?auto_623974 ) ) ( not ( = ?auto_623972 ?auto_623973 ) ) ( not ( = ?auto_623972 ?auto_623974 ) ) ( not ( = ?auto_623973 ?auto_623974 ) ) ( ON ?auto_623972 ?auto_623973 ) ( ON ?auto_623971 ?auto_623972 ) ( ON ?auto_623970 ?auto_623971 ) ( CLEAR ?auto_623968 ) ( ON ?auto_623969 ?auto_623970 ) ( CLEAR ?auto_623969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_623960 ?auto_623961 ?auto_623962 ?auto_623963 ?auto_623964 ?auto_623965 ?auto_623966 ?auto_623967 ?auto_623968 ?auto_623969 )
      ( MAKE-14PILE ?auto_623960 ?auto_623961 ?auto_623962 ?auto_623963 ?auto_623964 ?auto_623965 ?auto_623966 ?auto_623967 ?auto_623968 ?auto_623969 ?auto_623970 ?auto_623971 ?auto_623972 ?auto_623973 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624018 - BLOCK
      ?auto_624019 - BLOCK
      ?auto_624020 - BLOCK
      ?auto_624021 - BLOCK
      ?auto_624022 - BLOCK
      ?auto_624023 - BLOCK
      ?auto_624024 - BLOCK
      ?auto_624025 - BLOCK
      ?auto_624026 - BLOCK
      ?auto_624027 - BLOCK
      ?auto_624028 - BLOCK
      ?auto_624029 - BLOCK
      ?auto_624030 - BLOCK
      ?auto_624031 - BLOCK
    )
    :vars
    (
      ?auto_624032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624031 ?auto_624032 ) ( ON-TABLE ?auto_624018 ) ( ON ?auto_624019 ?auto_624018 ) ( ON ?auto_624020 ?auto_624019 ) ( ON ?auto_624021 ?auto_624020 ) ( ON ?auto_624022 ?auto_624021 ) ( ON ?auto_624023 ?auto_624022 ) ( ON ?auto_624024 ?auto_624023 ) ( ON ?auto_624025 ?auto_624024 ) ( not ( = ?auto_624018 ?auto_624019 ) ) ( not ( = ?auto_624018 ?auto_624020 ) ) ( not ( = ?auto_624018 ?auto_624021 ) ) ( not ( = ?auto_624018 ?auto_624022 ) ) ( not ( = ?auto_624018 ?auto_624023 ) ) ( not ( = ?auto_624018 ?auto_624024 ) ) ( not ( = ?auto_624018 ?auto_624025 ) ) ( not ( = ?auto_624018 ?auto_624026 ) ) ( not ( = ?auto_624018 ?auto_624027 ) ) ( not ( = ?auto_624018 ?auto_624028 ) ) ( not ( = ?auto_624018 ?auto_624029 ) ) ( not ( = ?auto_624018 ?auto_624030 ) ) ( not ( = ?auto_624018 ?auto_624031 ) ) ( not ( = ?auto_624018 ?auto_624032 ) ) ( not ( = ?auto_624019 ?auto_624020 ) ) ( not ( = ?auto_624019 ?auto_624021 ) ) ( not ( = ?auto_624019 ?auto_624022 ) ) ( not ( = ?auto_624019 ?auto_624023 ) ) ( not ( = ?auto_624019 ?auto_624024 ) ) ( not ( = ?auto_624019 ?auto_624025 ) ) ( not ( = ?auto_624019 ?auto_624026 ) ) ( not ( = ?auto_624019 ?auto_624027 ) ) ( not ( = ?auto_624019 ?auto_624028 ) ) ( not ( = ?auto_624019 ?auto_624029 ) ) ( not ( = ?auto_624019 ?auto_624030 ) ) ( not ( = ?auto_624019 ?auto_624031 ) ) ( not ( = ?auto_624019 ?auto_624032 ) ) ( not ( = ?auto_624020 ?auto_624021 ) ) ( not ( = ?auto_624020 ?auto_624022 ) ) ( not ( = ?auto_624020 ?auto_624023 ) ) ( not ( = ?auto_624020 ?auto_624024 ) ) ( not ( = ?auto_624020 ?auto_624025 ) ) ( not ( = ?auto_624020 ?auto_624026 ) ) ( not ( = ?auto_624020 ?auto_624027 ) ) ( not ( = ?auto_624020 ?auto_624028 ) ) ( not ( = ?auto_624020 ?auto_624029 ) ) ( not ( = ?auto_624020 ?auto_624030 ) ) ( not ( = ?auto_624020 ?auto_624031 ) ) ( not ( = ?auto_624020 ?auto_624032 ) ) ( not ( = ?auto_624021 ?auto_624022 ) ) ( not ( = ?auto_624021 ?auto_624023 ) ) ( not ( = ?auto_624021 ?auto_624024 ) ) ( not ( = ?auto_624021 ?auto_624025 ) ) ( not ( = ?auto_624021 ?auto_624026 ) ) ( not ( = ?auto_624021 ?auto_624027 ) ) ( not ( = ?auto_624021 ?auto_624028 ) ) ( not ( = ?auto_624021 ?auto_624029 ) ) ( not ( = ?auto_624021 ?auto_624030 ) ) ( not ( = ?auto_624021 ?auto_624031 ) ) ( not ( = ?auto_624021 ?auto_624032 ) ) ( not ( = ?auto_624022 ?auto_624023 ) ) ( not ( = ?auto_624022 ?auto_624024 ) ) ( not ( = ?auto_624022 ?auto_624025 ) ) ( not ( = ?auto_624022 ?auto_624026 ) ) ( not ( = ?auto_624022 ?auto_624027 ) ) ( not ( = ?auto_624022 ?auto_624028 ) ) ( not ( = ?auto_624022 ?auto_624029 ) ) ( not ( = ?auto_624022 ?auto_624030 ) ) ( not ( = ?auto_624022 ?auto_624031 ) ) ( not ( = ?auto_624022 ?auto_624032 ) ) ( not ( = ?auto_624023 ?auto_624024 ) ) ( not ( = ?auto_624023 ?auto_624025 ) ) ( not ( = ?auto_624023 ?auto_624026 ) ) ( not ( = ?auto_624023 ?auto_624027 ) ) ( not ( = ?auto_624023 ?auto_624028 ) ) ( not ( = ?auto_624023 ?auto_624029 ) ) ( not ( = ?auto_624023 ?auto_624030 ) ) ( not ( = ?auto_624023 ?auto_624031 ) ) ( not ( = ?auto_624023 ?auto_624032 ) ) ( not ( = ?auto_624024 ?auto_624025 ) ) ( not ( = ?auto_624024 ?auto_624026 ) ) ( not ( = ?auto_624024 ?auto_624027 ) ) ( not ( = ?auto_624024 ?auto_624028 ) ) ( not ( = ?auto_624024 ?auto_624029 ) ) ( not ( = ?auto_624024 ?auto_624030 ) ) ( not ( = ?auto_624024 ?auto_624031 ) ) ( not ( = ?auto_624024 ?auto_624032 ) ) ( not ( = ?auto_624025 ?auto_624026 ) ) ( not ( = ?auto_624025 ?auto_624027 ) ) ( not ( = ?auto_624025 ?auto_624028 ) ) ( not ( = ?auto_624025 ?auto_624029 ) ) ( not ( = ?auto_624025 ?auto_624030 ) ) ( not ( = ?auto_624025 ?auto_624031 ) ) ( not ( = ?auto_624025 ?auto_624032 ) ) ( not ( = ?auto_624026 ?auto_624027 ) ) ( not ( = ?auto_624026 ?auto_624028 ) ) ( not ( = ?auto_624026 ?auto_624029 ) ) ( not ( = ?auto_624026 ?auto_624030 ) ) ( not ( = ?auto_624026 ?auto_624031 ) ) ( not ( = ?auto_624026 ?auto_624032 ) ) ( not ( = ?auto_624027 ?auto_624028 ) ) ( not ( = ?auto_624027 ?auto_624029 ) ) ( not ( = ?auto_624027 ?auto_624030 ) ) ( not ( = ?auto_624027 ?auto_624031 ) ) ( not ( = ?auto_624027 ?auto_624032 ) ) ( not ( = ?auto_624028 ?auto_624029 ) ) ( not ( = ?auto_624028 ?auto_624030 ) ) ( not ( = ?auto_624028 ?auto_624031 ) ) ( not ( = ?auto_624028 ?auto_624032 ) ) ( not ( = ?auto_624029 ?auto_624030 ) ) ( not ( = ?auto_624029 ?auto_624031 ) ) ( not ( = ?auto_624029 ?auto_624032 ) ) ( not ( = ?auto_624030 ?auto_624031 ) ) ( not ( = ?auto_624030 ?auto_624032 ) ) ( not ( = ?auto_624031 ?auto_624032 ) ) ( ON ?auto_624030 ?auto_624031 ) ( ON ?auto_624029 ?auto_624030 ) ( ON ?auto_624028 ?auto_624029 ) ( ON ?auto_624027 ?auto_624028 ) ( CLEAR ?auto_624025 ) ( ON ?auto_624026 ?auto_624027 ) ( CLEAR ?auto_624026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_624018 ?auto_624019 ?auto_624020 ?auto_624021 ?auto_624022 ?auto_624023 ?auto_624024 ?auto_624025 ?auto_624026 )
      ( MAKE-14PILE ?auto_624018 ?auto_624019 ?auto_624020 ?auto_624021 ?auto_624022 ?auto_624023 ?auto_624024 ?auto_624025 ?auto_624026 ?auto_624027 ?auto_624028 ?auto_624029 ?auto_624030 ?auto_624031 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624076 - BLOCK
      ?auto_624077 - BLOCK
      ?auto_624078 - BLOCK
      ?auto_624079 - BLOCK
      ?auto_624080 - BLOCK
      ?auto_624081 - BLOCK
      ?auto_624082 - BLOCK
      ?auto_624083 - BLOCK
      ?auto_624084 - BLOCK
      ?auto_624085 - BLOCK
      ?auto_624086 - BLOCK
      ?auto_624087 - BLOCK
      ?auto_624088 - BLOCK
      ?auto_624089 - BLOCK
    )
    :vars
    (
      ?auto_624090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624089 ?auto_624090 ) ( ON-TABLE ?auto_624076 ) ( ON ?auto_624077 ?auto_624076 ) ( ON ?auto_624078 ?auto_624077 ) ( ON ?auto_624079 ?auto_624078 ) ( ON ?auto_624080 ?auto_624079 ) ( ON ?auto_624081 ?auto_624080 ) ( ON ?auto_624082 ?auto_624081 ) ( not ( = ?auto_624076 ?auto_624077 ) ) ( not ( = ?auto_624076 ?auto_624078 ) ) ( not ( = ?auto_624076 ?auto_624079 ) ) ( not ( = ?auto_624076 ?auto_624080 ) ) ( not ( = ?auto_624076 ?auto_624081 ) ) ( not ( = ?auto_624076 ?auto_624082 ) ) ( not ( = ?auto_624076 ?auto_624083 ) ) ( not ( = ?auto_624076 ?auto_624084 ) ) ( not ( = ?auto_624076 ?auto_624085 ) ) ( not ( = ?auto_624076 ?auto_624086 ) ) ( not ( = ?auto_624076 ?auto_624087 ) ) ( not ( = ?auto_624076 ?auto_624088 ) ) ( not ( = ?auto_624076 ?auto_624089 ) ) ( not ( = ?auto_624076 ?auto_624090 ) ) ( not ( = ?auto_624077 ?auto_624078 ) ) ( not ( = ?auto_624077 ?auto_624079 ) ) ( not ( = ?auto_624077 ?auto_624080 ) ) ( not ( = ?auto_624077 ?auto_624081 ) ) ( not ( = ?auto_624077 ?auto_624082 ) ) ( not ( = ?auto_624077 ?auto_624083 ) ) ( not ( = ?auto_624077 ?auto_624084 ) ) ( not ( = ?auto_624077 ?auto_624085 ) ) ( not ( = ?auto_624077 ?auto_624086 ) ) ( not ( = ?auto_624077 ?auto_624087 ) ) ( not ( = ?auto_624077 ?auto_624088 ) ) ( not ( = ?auto_624077 ?auto_624089 ) ) ( not ( = ?auto_624077 ?auto_624090 ) ) ( not ( = ?auto_624078 ?auto_624079 ) ) ( not ( = ?auto_624078 ?auto_624080 ) ) ( not ( = ?auto_624078 ?auto_624081 ) ) ( not ( = ?auto_624078 ?auto_624082 ) ) ( not ( = ?auto_624078 ?auto_624083 ) ) ( not ( = ?auto_624078 ?auto_624084 ) ) ( not ( = ?auto_624078 ?auto_624085 ) ) ( not ( = ?auto_624078 ?auto_624086 ) ) ( not ( = ?auto_624078 ?auto_624087 ) ) ( not ( = ?auto_624078 ?auto_624088 ) ) ( not ( = ?auto_624078 ?auto_624089 ) ) ( not ( = ?auto_624078 ?auto_624090 ) ) ( not ( = ?auto_624079 ?auto_624080 ) ) ( not ( = ?auto_624079 ?auto_624081 ) ) ( not ( = ?auto_624079 ?auto_624082 ) ) ( not ( = ?auto_624079 ?auto_624083 ) ) ( not ( = ?auto_624079 ?auto_624084 ) ) ( not ( = ?auto_624079 ?auto_624085 ) ) ( not ( = ?auto_624079 ?auto_624086 ) ) ( not ( = ?auto_624079 ?auto_624087 ) ) ( not ( = ?auto_624079 ?auto_624088 ) ) ( not ( = ?auto_624079 ?auto_624089 ) ) ( not ( = ?auto_624079 ?auto_624090 ) ) ( not ( = ?auto_624080 ?auto_624081 ) ) ( not ( = ?auto_624080 ?auto_624082 ) ) ( not ( = ?auto_624080 ?auto_624083 ) ) ( not ( = ?auto_624080 ?auto_624084 ) ) ( not ( = ?auto_624080 ?auto_624085 ) ) ( not ( = ?auto_624080 ?auto_624086 ) ) ( not ( = ?auto_624080 ?auto_624087 ) ) ( not ( = ?auto_624080 ?auto_624088 ) ) ( not ( = ?auto_624080 ?auto_624089 ) ) ( not ( = ?auto_624080 ?auto_624090 ) ) ( not ( = ?auto_624081 ?auto_624082 ) ) ( not ( = ?auto_624081 ?auto_624083 ) ) ( not ( = ?auto_624081 ?auto_624084 ) ) ( not ( = ?auto_624081 ?auto_624085 ) ) ( not ( = ?auto_624081 ?auto_624086 ) ) ( not ( = ?auto_624081 ?auto_624087 ) ) ( not ( = ?auto_624081 ?auto_624088 ) ) ( not ( = ?auto_624081 ?auto_624089 ) ) ( not ( = ?auto_624081 ?auto_624090 ) ) ( not ( = ?auto_624082 ?auto_624083 ) ) ( not ( = ?auto_624082 ?auto_624084 ) ) ( not ( = ?auto_624082 ?auto_624085 ) ) ( not ( = ?auto_624082 ?auto_624086 ) ) ( not ( = ?auto_624082 ?auto_624087 ) ) ( not ( = ?auto_624082 ?auto_624088 ) ) ( not ( = ?auto_624082 ?auto_624089 ) ) ( not ( = ?auto_624082 ?auto_624090 ) ) ( not ( = ?auto_624083 ?auto_624084 ) ) ( not ( = ?auto_624083 ?auto_624085 ) ) ( not ( = ?auto_624083 ?auto_624086 ) ) ( not ( = ?auto_624083 ?auto_624087 ) ) ( not ( = ?auto_624083 ?auto_624088 ) ) ( not ( = ?auto_624083 ?auto_624089 ) ) ( not ( = ?auto_624083 ?auto_624090 ) ) ( not ( = ?auto_624084 ?auto_624085 ) ) ( not ( = ?auto_624084 ?auto_624086 ) ) ( not ( = ?auto_624084 ?auto_624087 ) ) ( not ( = ?auto_624084 ?auto_624088 ) ) ( not ( = ?auto_624084 ?auto_624089 ) ) ( not ( = ?auto_624084 ?auto_624090 ) ) ( not ( = ?auto_624085 ?auto_624086 ) ) ( not ( = ?auto_624085 ?auto_624087 ) ) ( not ( = ?auto_624085 ?auto_624088 ) ) ( not ( = ?auto_624085 ?auto_624089 ) ) ( not ( = ?auto_624085 ?auto_624090 ) ) ( not ( = ?auto_624086 ?auto_624087 ) ) ( not ( = ?auto_624086 ?auto_624088 ) ) ( not ( = ?auto_624086 ?auto_624089 ) ) ( not ( = ?auto_624086 ?auto_624090 ) ) ( not ( = ?auto_624087 ?auto_624088 ) ) ( not ( = ?auto_624087 ?auto_624089 ) ) ( not ( = ?auto_624087 ?auto_624090 ) ) ( not ( = ?auto_624088 ?auto_624089 ) ) ( not ( = ?auto_624088 ?auto_624090 ) ) ( not ( = ?auto_624089 ?auto_624090 ) ) ( ON ?auto_624088 ?auto_624089 ) ( ON ?auto_624087 ?auto_624088 ) ( ON ?auto_624086 ?auto_624087 ) ( ON ?auto_624085 ?auto_624086 ) ( ON ?auto_624084 ?auto_624085 ) ( CLEAR ?auto_624082 ) ( ON ?auto_624083 ?auto_624084 ) ( CLEAR ?auto_624083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_624076 ?auto_624077 ?auto_624078 ?auto_624079 ?auto_624080 ?auto_624081 ?auto_624082 ?auto_624083 )
      ( MAKE-14PILE ?auto_624076 ?auto_624077 ?auto_624078 ?auto_624079 ?auto_624080 ?auto_624081 ?auto_624082 ?auto_624083 ?auto_624084 ?auto_624085 ?auto_624086 ?auto_624087 ?auto_624088 ?auto_624089 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624134 - BLOCK
      ?auto_624135 - BLOCK
      ?auto_624136 - BLOCK
      ?auto_624137 - BLOCK
      ?auto_624138 - BLOCK
      ?auto_624139 - BLOCK
      ?auto_624140 - BLOCK
      ?auto_624141 - BLOCK
      ?auto_624142 - BLOCK
      ?auto_624143 - BLOCK
      ?auto_624144 - BLOCK
      ?auto_624145 - BLOCK
      ?auto_624146 - BLOCK
      ?auto_624147 - BLOCK
    )
    :vars
    (
      ?auto_624148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624147 ?auto_624148 ) ( ON-TABLE ?auto_624134 ) ( ON ?auto_624135 ?auto_624134 ) ( ON ?auto_624136 ?auto_624135 ) ( ON ?auto_624137 ?auto_624136 ) ( ON ?auto_624138 ?auto_624137 ) ( ON ?auto_624139 ?auto_624138 ) ( not ( = ?auto_624134 ?auto_624135 ) ) ( not ( = ?auto_624134 ?auto_624136 ) ) ( not ( = ?auto_624134 ?auto_624137 ) ) ( not ( = ?auto_624134 ?auto_624138 ) ) ( not ( = ?auto_624134 ?auto_624139 ) ) ( not ( = ?auto_624134 ?auto_624140 ) ) ( not ( = ?auto_624134 ?auto_624141 ) ) ( not ( = ?auto_624134 ?auto_624142 ) ) ( not ( = ?auto_624134 ?auto_624143 ) ) ( not ( = ?auto_624134 ?auto_624144 ) ) ( not ( = ?auto_624134 ?auto_624145 ) ) ( not ( = ?auto_624134 ?auto_624146 ) ) ( not ( = ?auto_624134 ?auto_624147 ) ) ( not ( = ?auto_624134 ?auto_624148 ) ) ( not ( = ?auto_624135 ?auto_624136 ) ) ( not ( = ?auto_624135 ?auto_624137 ) ) ( not ( = ?auto_624135 ?auto_624138 ) ) ( not ( = ?auto_624135 ?auto_624139 ) ) ( not ( = ?auto_624135 ?auto_624140 ) ) ( not ( = ?auto_624135 ?auto_624141 ) ) ( not ( = ?auto_624135 ?auto_624142 ) ) ( not ( = ?auto_624135 ?auto_624143 ) ) ( not ( = ?auto_624135 ?auto_624144 ) ) ( not ( = ?auto_624135 ?auto_624145 ) ) ( not ( = ?auto_624135 ?auto_624146 ) ) ( not ( = ?auto_624135 ?auto_624147 ) ) ( not ( = ?auto_624135 ?auto_624148 ) ) ( not ( = ?auto_624136 ?auto_624137 ) ) ( not ( = ?auto_624136 ?auto_624138 ) ) ( not ( = ?auto_624136 ?auto_624139 ) ) ( not ( = ?auto_624136 ?auto_624140 ) ) ( not ( = ?auto_624136 ?auto_624141 ) ) ( not ( = ?auto_624136 ?auto_624142 ) ) ( not ( = ?auto_624136 ?auto_624143 ) ) ( not ( = ?auto_624136 ?auto_624144 ) ) ( not ( = ?auto_624136 ?auto_624145 ) ) ( not ( = ?auto_624136 ?auto_624146 ) ) ( not ( = ?auto_624136 ?auto_624147 ) ) ( not ( = ?auto_624136 ?auto_624148 ) ) ( not ( = ?auto_624137 ?auto_624138 ) ) ( not ( = ?auto_624137 ?auto_624139 ) ) ( not ( = ?auto_624137 ?auto_624140 ) ) ( not ( = ?auto_624137 ?auto_624141 ) ) ( not ( = ?auto_624137 ?auto_624142 ) ) ( not ( = ?auto_624137 ?auto_624143 ) ) ( not ( = ?auto_624137 ?auto_624144 ) ) ( not ( = ?auto_624137 ?auto_624145 ) ) ( not ( = ?auto_624137 ?auto_624146 ) ) ( not ( = ?auto_624137 ?auto_624147 ) ) ( not ( = ?auto_624137 ?auto_624148 ) ) ( not ( = ?auto_624138 ?auto_624139 ) ) ( not ( = ?auto_624138 ?auto_624140 ) ) ( not ( = ?auto_624138 ?auto_624141 ) ) ( not ( = ?auto_624138 ?auto_624142 ) ) ( not ( = ?auto_624138 ?auto_624143 ) ) ( not ( = ?auto_624138 ?auto_624144 ) ) ( not ( = ?auto_624138 ?auto_624145 ) ) ( not ( = ?auto_624138 ?auto_624146 ) ) ( not ( = ?auto_624138 ?auto_624147 ) ) ( not ( = ?auto_624138 ?auto_624148 ) ) ( not ( = ?auto_624139 ?auto_624140 ) ) ( not ( = ?auto_624139 ?auto_624141 ) ) ( not ( = ?auto_624139 ?auto_624142 ) ) ( not ( = ?auto_624139 ?auto_624143 ) ) ( not ( = ?auto_624139 ?auto_624144 ) ) ( not ( = ?auto_624139 ?auto_624145 ) ) ( not ( = ?auto_624139 ?auto_624146 ) ) ( not ( = ?auto_624139 ?auto_624147 ) ) ( not ( = ?auto_624139 ?auto_624148 ) ) ( not ( = ?auto_624140 ?auto_624141 ) ) ( not ( = ?auto_624140 ?auto_624142 ) ) ( not ( = ?auto_624140 ?auto_624143 ) ) ( not ( = ?auto_624140 ?auto_624144 ) ) ( not ( = ?auto_624140 ?auto_624145 ) ) ( not ( = ?auto_624140 ?auto_624146 ) ) ( not ( = ?auto_624140 ?auto_624147 ) ) ( not ( = ?auto_624140 ?auto_624148 ) ) ( not ( = ?auto_624141 ?auto_624142 ) ) ( not ( = ?auto_624141 ?auto_624143 ) ) ( not ( = ?auto_624141 ?auto_624144 ) ) ( not ( = ?auto_624141 ?auto_624145 ) ) ( not ( = ?auto_624141 ?auto_624146 ) ) ( not ( = ?auto_624141 ?auto_624147 ) ) ( not ( = ?auto_624141 ?auto_624148 ) ) ( not ( = ?auto_624142 ?auto_624143 ) ) ( not ( = ?auto_624142 ?auto_624144 ) ) ( not ( = ?auto_624142 ?auto_624145 ) ) ( not ( = ?auto_624142 ?auto_624146 ) ) ( not ( = ?auto_624142 ?auto_624147 ) ) ( not ( = ?auto_624142 ?auto_624148 ) ) ( not ( = ?auto_624143 ?auto_624144 ) ) ( not ( = ?auto_624143 ?auto_624145 ) ) ( not ( = ?auto_624143 ?auto_624146 ) ) ( not ( = ?auto_624143 ?auto_624147 ) ) ( not ( = ?auto_624143 ?auto_624148 ) ) ( not ( = ?auto_624144 ?auto_624145 ) ) ( not ( = ?auto_624144 ?auto_624146 ) ) ( not ( = ?auto_624144 ?auto_624147 ) ) ( not ( = ?auto_624144 ?auto_624148 ) ) ( not ( = ?auto_624145 ?auto_624146 ) ) ( not ( = ?auto_624145 ?auto_624147 ) ) ( not ( = ?auto_624145 ?auto_624148 ) ) ( not ( = ?auto_624146 ?auto_624147 ) ) ( not ( = ?auto_624146 ?auto_624148 ) ) ( not ( = ?auto_624147 ?auto_624148 ) ) ( ON ?auto_624146 ?auto_624147 ) ( ON ?auto_624145 ?auto_624146 ) ( ON ?auto_624144 ?auto_624145 ) ( ON ?auto_624143 ?auto_624144 ) ( ON ?auto_624142 ?auto_624143 ) ( ON ?auto_624141 ?auto_624142 ) ( CLEAR ?auto_624139 ) ( ON ?auto_624140 ?auto_624141 ) ( CLEAR ?auto_624140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_624134 ?auto_624135 ?auto_624136 ?auto_624137 ?auto_624138 ?auto_624139 ?auto_624140 )
      ( MAKE-14PILE ?auto_624134 ?auto_624135 ?auto_624136 ?auto_624137 ?auto_624138 ?auto_624139 ?auto_624140 ?auto_624141 ?auto_624142 ?auto_624143 ?auto_624144 ?auto_624145 ?auto_624146 ?auto_624147 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624192 - BLOCK
      ?auto_624193 - BLOCK
      ?auto_624194 - BLOCK
      ?auto_624195 - BLOCK
      ?auto_624196 - BLOCK
      ?auto_624197 - BLOCK
      ?auto_624198 - BLOCK
      ?auto_624199 - BLOCK
      ?auto_624200 - BLOCK
      ?auto_624201 - BLOCK
      ?auto_624202 - BLOCK
      ?auto_624203 - BLOCK
      ?auto_624204 - BLOCK
      ?auto_624205 - BLOCK
    )
    :vars
    (
      ?auto_624206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624205 ?auto_624206 ) ( ON-TABLE ?auto_624192 ) ( ON ?auto_624193 ?auto_624192 ) ( ON ?auto_624194 ?auto_624193 ) ( ON ?auto_624195 ?auto_624194 ) ( ON ?auto_624196 ?auto_624195 ) ( not ( = ?auto_624192 ?auto_624193 ) ) ( not ( = ?auto_624192 ?auto_624194 ) ) ( not ( = ?auto_624192 ?auto_624195 ) ) ( not ( = ?auto_624192 ?auto_624196 ) ) ( not ( = ?auto_624192 ?auto_624197 ) ) ( not ( = ?auto_624192 ?auto_624198 ) ) ( not ( = ?auto_624192 ?auto_624199 ) ) ( not ( = ?auto_624192 ?auto_624200 ) ) ( not ( = ?auto_624192 ?auto_624201 ) ) ( not ( = ?auto_624192 ?auto_624202 ) ) ( not ( = ?auto_624192 ?auto_624203 ) ) ( not ( = ?auto_624192 ?auto_624204 ) ) ( not ( = ?auto_624192 ?auto_624205 ) ) ( not ( = ?auto_624192 ?auto_624206 ) ) ( not ( = ?auto_624193 ?auto_624194 ) ) ( not ( = ?auto_624193 ?auto_624195 ) ) ( not ( = ?auto_624193 ?auto_624196 ) ) ( not ( = ?auto_624193 ?auto_624197 ) ) ( not ( = ?auto_624193 ?auto_624198 ) ) ( not ( = ?auto_624193 ?auto_624199 ) ) ( not ( = ?auto_624193 ?auto_624200 ) ) ( not ( = ?auto_624193 ?auto_624201 ) ) ( not ( = ?auto_624193 ?auto_624202 ) ) ( not ( = ?auto_624193 ?auto_624203 ) ) ( not ( = ?auto_624193 ?auto_624204 ) ) ( not ( = ?auto_624193 ?auto_624205 ) ) ( not ( = ?auto_624193 ?auto_624206 ) ) ( not ( = ?auto_624194 ?auto_624195 ) ) ( not ( = ?auto_624194 ?auto_624196 ) ) ( not ( = ?auto_624194 ?auto_624197 ) ) ( not ( = ?auto_624194 ?auto_624198 ) ) ( not ( = ?auto_624194 ?auto_624199 ) ) ( not ( = ?auto_624194 ?auto_624200 ) ) ( not ( = ?auto_624194 ?auto_624201 ) ) ( not ( = ?auto_624194 ?auto_624202 ) ) ( not ( = ?auto_624194 ?auto_624203 ) ) ( not ( = ?auto_624194 ?auto_624204 ) ) ( not ( = ?auto_624194 ?auto_624205 ) ) ( not ( = ?auto_624194 ?auto_624206 ) ) ( not ( = ?auto_624195 ?auto_624196 ) ) ( not ( = ?auto_624195 ?auto_624197 ) ) ( not ( = ?auto_624195 ?auto_624198 ) ) ( not ( = ?auto_624195 ?auto_624199 ) ) ( not ( = ?auto_624195 ?auto_624200 ) ) ( not ( = ?auto_624195 ?auto_624201 ) ) ( not ( = ?auto_624195 ?auto_624202 ) ) ( not ( = ?auto_624195 ?auto_624203 ) ) ( not ( = ?auto_624195 ?auto_624204 ) ) ( not ( = ?auto_624195 ?auto_624205 ) ) ( not ( = ?auto_624195 ?auto_624206 ) ) ( not ( = ?auto_624196 ?auto_624197 ) ) ( not ( = ?auto_624196 ?auto_624198 ) ) ( not ( = ?auto_624196 ?auto_624199 ) ) ( not ( = ?auto_624196 ?auto_624200 ) ) ( not ( = ?auto_624196 ?auto_624201 ) ) ( not ( = ?auto_624196 ?auto_624202 ) ) ( not ( = ?auto_624196 ?auto_624203 ) ) ( not ( = ?auto_624196 ?auto_624204 ) ) ( not ( = ?auto_624196 ?auto_624205 ) ) ( not ( = ?auto_624196 ?auto_624206 ) ) ( not ( = ?auto_624197 ?auto_624198 ) ) ( not ( = ?auto_624197 ?auto_624199 ) ) ( not ( = ?auto_624197 ?auto_624200 ) ) ( not ( = ?auto_624197 ?auto_624201 ) ) ( not ( = ?auto_624197 ?auto_624202 ) ) ( not ( = ?auto_624197 ?auto_624203 ) ) ( not ( = ?auto_624197 ?auto_624204 ) ) ( not ( = ?auto_624197 ?auto_624205 ) ) ( not ( = ?auto_624197 ?auto_624206 ) ) ( not ( = ?auto_624198 ?auto_624199 ) ) ( not ( = ?auto_624198 ?auto_624200 ) ) ( not ( = ?auto_624198 ?auto_624201 ) ) ( not ( = ?auto_624198 ?auto_624202 ) ) ( not ( = ?auto_624198 ?auto_624203 ) ) ( not ( = ?auto_624198 ?auto_624204 ) ) ( not ( = ?auto_624198 ?auto_624205 ) ) ( not ( = ?auto_624198 ?auto_624206 ) ) ( not ( = ?auto_624199 ?auto_624200 ) ) ( not ( = ?auto_624199 ?auto_624201 ) ) ( not ( = ?auto_624199 ?auto_624202 ) ) ( not ( = ?auto_624199 ?auto_624203 ) ) ( not ( = ?auto_624199 ?auto_624204 ) ) ( not ( = ?auto_624199 ?auto_624205 ) ) ( not ( = ?auto_624199 ?auto_624206 ) ) ( not ( = ?auto_624200 ?auto_624201 ) ) ( not ( = ?auto_624200 ?auto_624202 ) ) ( not ( = ?auto_624200 ?auto_624203 ) ) ( not ( = ?auto_624200 ?auto_624204 ) ) ( not ( = ?auto_624200 ?auto_624205 ) ) ( not ( = ?auto_624200 ?auto_624206 ) ) ( not ( = ?auto_624201 ?auto_624202 ) ) ( not ( = ?auto_624201 ?auto_624203 ) ) ( not ( = ?auto_624201 ?auto_624204 ) ) ( not ( = ?auto_624201 ?auto_624205 ) ) ( not ( = ?auto_624201 ?auto_624206 ) ) ( not ( = ?auto_624202 ?auto_624203 ) ) ( not ( = ?auto_624202 ?auto_624204 ) ) ( not ( = ?auto_624202 ?auto_624205 ) ) ( not ( = ?auto_624202 ?auto_624206 ) ) ( not ( = ?auto_624203 ?auto_624204 ) ) ( not ( = ?auto_624203 ?auto_624205 ) ) ( not ( = ?auto_624203 ?auto_624206 ) ) ( not ( = ?auto_624204 ?auto_624205 ) ) ( not ( = ?auto_624204 ?auto_624206 ) ) ( not ( = ?auto_624205 ?auto_624206 ) ) ( ON ?auto_624204 ?auto_624205 ) ( ON ?auto_624203 ?auto_624204 ) ( ON ?auto_624202 ?auto_624203 ) ( ON ?auto_624201 ?auto_624202 ) ( ON ?auto_624200 ?auto_624201 ) ( ON ?auto_624199 ?auto_624200 ) ( ON ?auto_624198 ?auto_624199 ) ( CLEAR ?auto_624196 ) ( ON ?auto_624197 ?auto_624198 ) ( CLEAR ?auto_624197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_624192 ?auto_624193 ?auto_624194 ?auto_624195 ?auto_624196 ?auto_624197 )
      ( MAKE-14PILE ?auto_624192 ?auto_624193 ?auto_624194 ?auto_624195 ?auto_624196 ?auto_624197 ?auto_624198 ?auto_624199 ?auto_624200 ?auto_624201 ?auto_624202 ?auto_624203 ?auto_624204 ?auto_624205 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624250 - BLOCK
      ?auto_624251 - BLOCK
      ?auto_624252 - BLOCK
      ?auto_624253 - BLOCK
      ?auto_624254 - BLOCK
      ?auto_624255 - BLOCK
      ?auto_624256 - BLOCK
      ?auto_624257 - BLOCK
      ?auto_624258 - BLOCK
      ?auto_624259 - BLOCK
      ?auto_624260 - BLOCK
      ?auto_624261 - BLOCK
      ?auto_624262 - BLOCK
      ?auto_624263 - BLOCK
    )
    :vars
    (
      ?auto_624264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624263 ?auto_624264 ) ( ON-TABLE ?auto_624250 ) ( ON ?auto_624251 ?auto_624250 ) ( ON ?auto_624252 ?auto_624251 ) ( ON ?auto_624253 ?auto_624252 ) ( not ( = ?auto_624250 ?auto_624251 ) ) ( not ( = ?auto_624250 ?auto_624252 ) ) ( not ( = ?auto_624250 ?auto_624253 ) ) ( not ( = ?auto_624250 ?auto_624254 ) ) ( not ( = ?auto_624250 ?auto_624255 ) ) ( not ( = ?auto_624250 ?auto_624256 ) ) ( not ( = ?auto_624250 ?auto_624257 ) ) ( not ( = ?auto_624250 ?auto_624258 ) ) ( not ( = ?auto_624250 ?auto_624259 ) ) ( not ( = ?auto_624250 ?auto_624260 ) ) ( not ( = ?auto_624250 ?auto_624261 ) ) ( not ( = ?auto_624250 ?auto_624262 ) ) ( not ( = ?auto_624250 ?auto_624263 ) ) ( not ( = ?auto_624250 ?auto_624264 ) ) ( not ( = ?auto_624251 ?auto_624252 ) ) ( not ( = ?auto_624251 ?auto_624253 ) ) ( not ( = ?auto_624251 ?auto_624254 ) ) ( not ( = ?auto_624251 ?auto_624255 ) ) ( not ( = ?auto_624251 ?auto_624256 ) ) ( not ( = ?auto_624251 ?auto_624257 ) ) ( not ( = ?auto_624251 ?auto_624258 ) ) ( not ( = ?auto_624251 ?auto_624259 ) ) ( not ( = ?auto_624251 ?auto_624260 ) ) ( not ( = ?auto_624251 ?auto_624261 ) ) ( not ( = ?auto_624251 ?auto_624262 ) ) ( not ( = ?auto_624251 ?auto_624263 ) ) ( not ( = ?auto_624251 ?auto_624264 ) ) ( not ( = ?auto_624252 ?auto_624253 ) ) ( not ( = ?auto_624252 ?auto_624254 ) ) ( not ( = ?auto_624252 ?auto_624255 ) ) ( not ( = ?auto_624252 ?auto_624256 ) ) ( not ( = ?auto_624252 ?auto_624257 ) ) ( not ( = ?auto_624252 ?auto_624258 ) ) ( not ( = ?auto_624252 ?auto_624259 ) ) ( not ( = ?auto_624252 ?auto_624260 ) ) ( not ( = ?auto_624252 ?auto_624261 ) ) ( not ( = ?auto_624252 ?auto_624262 ) ) ( not ( = ?auto_624252 ?auto_624263 ) ) ( not ( = ?auto_624252 ?auto_624264 ) ) ( not ( = ?auto_624253 ?auto_624254 ) ) ( not ( = ?auto_624253 ?auto_624255 ) ) ( not ( = ?auto_624253 ?auto_624256 ) ) ( not ( = ?auto_624253 ?auto_624257 ) ) ( not ( = ?auto_624253 ?auto_624258 ) ) ( not ( = ?auto_624253 ?auto_624259 ) ) ( not ( = ?auto_624253 ?auto_624260 ) ) ( not ( = ?auto_624253 ?auto_624261 ) ) ( not ( = ?auto_624253 ?auto_624262 ) ) ( not ( = ?auto_624253 ?auto_624263 ) ) ( not ( = ?auto_624253 ?auto_624264 ) ) ( not ( = ?auto_624254 ?auto_624255 ) ) ( not ( = ?auto_624254 ?auto_624256 ) ) ( not ( = ?auto_624254 ?auto_624257 ) ) ( not ( = ?auto_624254 ?auto_624258 ) ) ( not ( = ?auto_624254 ?auto_624259 ) ) ( not ( = ?auto_624254 ?auto_624260 ) ) ( not ( = ?auto_624254 ?auto_624261 ) ) ( not ( = ?auto_624254 ?auto_624262 ) ) ( not ( = ?auto_624254 ?auto_624263 ) ) ( not ( = ?auto_624254 ?auto_624264 ) ) ( not ( = ?auto_624255 ?auto_624256 ) ) ( not ( = ?auto_624255 ?auto_624257 ) ) ( not ( = ?auto_624255 ?auto_624258 ) ) ( not ( = ?auto_624255 ?auto_624259 ) ) ( not ( = ?auto_624255 ?auto_624260 ) ) ( not ( = ?auto_624255 ?auto_624261 ) ) ( not ( = ?auto_624255 ?auto_624262 ) ) ( not ( = ?auto_624255 ?auto_624263 ) ) ( not ( = ?auto_624255 ?auto_624264 ) ) ( not ( = ?auto_624256 ?auto_624257 ) ) ( not ( = ?auto_624256 ?auto_624258 ) ) ( not ( = ?auto_624256 ?auto_624259 ) ) ( not ( = ?auto_624256 ?auto_624260 ) ) ( not ( = ?auto_624256 ?auto_624261 ) ) ( not ( = ?auto_624256 ?auto_624262 ) ) ( not ( = ?auto_624256 ?auto_624263 ) ) ( not ( = ?auto_624256 ?auto_624264 ) ) ( not ( = ?auto_624257 ?auto_624258 ) ) ( not ( = ?auto_624257 ?auto_624259 ) ) ( not ( = ?auto_624257 ?auto_624260 ) ) ( not ( = ?auto_624257 ?auto_624261 ) ) ( not ( = ?auto_624257 ?auto_624262 ) ) ( not ( = ?auto_624257 ?auto_624263 ) ) ( not ( = ?auto_624257 ?auto_624264 ) ) ( not ( = ?auto_624258 ?auto_624259 ) ) ( not ( = ?auto_624258 ?auto_624260 ) ) ( not ( = ?auto_624258 ?auto_624261 ) ) ( not ( = ?auto_624258 ?auto_624262 ) ) ( not ( = ?auto_624258 ?auto_624263 ) ) ( not ( = ?auto_624258 ?auto_624264 ) ) ( not ( = ?auto_624259 ?auto_624260 ) ) ( not ( = ?auto_624259 ?auto_624261 ) ) ( not ( = ?auto_624259 ?auto_624262 ) ) ( not ( = ?auto_624259 ?auto_624263 ) ) ( not ( = ?auto_624259 ?auto_624264 ) ) ( not ( = ?auto_624260 ?auto_624261 ) ) ( not ( = ?auto_624260 ?auto_624262 ) ) ( not ( = ?auto_624260 ?auto_624263 ) ) ( not ( = ?auto_624260 ?auto_624264 ) ) ( not ( = ?auto_624261 ?auto_624262 ) ) ( not ( = ?auto_624261 ?auto_624263 ) ) ( not ( = ?auto_624261 ?auto_624264 ) ) ( not ( = ?auto_624262 ?auto_624263 ) ) ( not ( = ?auto_624262 ?auto_624264 ) ) ( not ( = ?auto_624263 ?auto_624264 ) ) ( ON ?auto_624262 ?auto_624263 ) ( ON ?auto_624261 ?auto_624262 ) ( ON ?auto_624260 ?auto_624261 ) ( ON ?auto_624259 ?auto_624260 ) ( ON ?auto_624258 ?auto_624259 ) ( ON ?auto_624257 ?auto_624258 ) ( ON ?auto_624256 ?auto_624257 ) ( ON ?auto_624255 ?auto_624256 ) ( CLEAR ?auto_624253 ) ( ON ?auto_624254 ?auto_624255 ) ( CLEAR ?auto_624254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_624250 ?auto_624251 ?auto_624252 ?auto_624253 ?auto_624254 )
      ( MAKE-14PILE ?auto_624250 ?auto_624251 ?auto_624252 ?auto_624253 ?auto_624254 ?auto_624255 ?auto_624256 ?auto_624257 ?auto_624258 ?auto_624259 ?auto_624260 ?auto_624261 ?auto_624262 ?auto_624263 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624308 - BLOCK
      ?auto_624309 - BLOCK
      ?auto_624310 - BLOCK
      ?auto_624311 - BLOCK
      ?auto_624312 - BLOCK
      ?auto_624313 - BLOCK
      ?auto_624314 - BLOCK
      ?auto_624315 - BLOCK
      ?auto_624316 - BLOCK
      ?auto_624317 - BLOCK
      ?auto_624318 - BLOCK
      ?auto_624319 - BLOCK
      ?auto_624320 - BLOCK
      ?auto_624321 - BLOCK
    )
    :vars
    (
      ?auto_624322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624321 ?auto_624322 ) ( ON-TABLE ?auto_624308 ) ( ON ?auto_624309 ?auto_624308 ) ( ON ?auto_624310 ?auto_624309 ) ( not ( = ?auto_624308 ?auto_624309 ) ) ( not ( = ?auto_624308 ?auto_624310 ) ) ( not ( = ?auto_624308 ?auto_624311 ) ) ( not ( = ?auto_624308 ?auto_624312 ) ) ( not ( = ?auto_624308 ?auto_624313 ) ) ( not ( = ?auto_624308 ?auto_624314 ) ) ( not ( = ?auto_624308 ?auto_624315 ) ) ( not ( = ?auto_624308 ?auto_624316 ) ) ( not ( = ?auto_624308 ?auto_624317 ) ) ( not ( = ?auto_624308 ?auto_624318 ) ) ( not ( = ?auto_624308 ?auto_624319 ) ) ( not ( = ?auto_624308 ?auto_624320 ) ) ( not ( = ?auto_624308 ?auto_624321 ) ) ( not ( = ?auto_624308 ?auto_624322 ) ) ( not ( = ?auto_624309 ?auto_624310 ) ) ( not ( = ?auto_624309 ?auto_624311 ) ) ( not ( = ?auto_624309 ?auto_624312 ) ) ( not ( = ?auto_624309 ?auto_624313 ) ) ( not ( = ?auto_624309 ?auto_624314 ) ) ( not ( = ?auto_624309 ?auto_624315 ) ) ( not ( = ?auto_624309 ?auto_624316 ) ) ( not ( = ?auto_624309 ?auto_624317 ) ) ( not ( = ?auto_624309 ?auto_624318 ) ) ( not ( = ?auto_624309 ?auto_624319 ) ) ( not ( = ?auto_624309 ?auto_624320 ) ) ( not ( = ?auto_624309 ?auto_624321 ) ) ( not ( = ?auto_624309 ?auto_624322 ) ) ( not ( = ?auto_624310 ?auto_624311 ) ) ( not ( = ?auto_624310 ?auto_624312 ) ) ( not ( = ?auto_624310 ?auto_624313 ) ) ( not ( = ?auto_624310 ?auto_624314 ) ) ( not ( = ?auto_624310 ?auto_624315 ) ) ( not ( = ?auto_624310 ?auto_624316 ) ) ( not ( = ?auto_624310 ?auto_624317 ) ) ( not ( = ?auto_624310 ?auto_624318 ) ) ( not ( = ?auto_624310 ?auto_624319 ) ) ( not ( = ?auto_624310 ?auto_624320 ) ) ( not ( = ?auto_624310 ?auto_624321 ) ) ( not ( = ?auto_624310 ?auto_624322 ) ) ( not ( = ?auto_624311 ?auto_624312 ) ) ( not ( = ?auto_624311 ?auto_624313 ) ) ( not ( = ?auto_624311 ?auto_624314 ) ) ( not ( = ?auto_624311 ?auto_624315 ) ) ( not ( = ?auto_624311 ?auto_624316 ) ) ( not ( = ?auto_624311 ?auto_624317 ) ) ( not ( = ?auto_624311 ?auto_624318 ) ) ( not ( = ?auto_624311 ?auto_624319 ) ) ( not ( = ?auto_624311 ?auto_624320 ) ) ( not ( = ?auto_624311 ?auto_624321 ) ) ( not ( = ?auto_624311 ?auto_624322 ) ) ( not ( = ?auto_624312 ?auto_624313 ) ) ( not ( = ?auto_624312 ?auto_624314 ) ) ( not ( = ?auto_624312 ?auto_624315 ) ) ( not ( = ?auto_624312 ?auto_624316 ) ) ( not ( = ?auto_624312 ?auto_624317 ) ) ( not ( = ?auto_624312 ?auto_624318 ) ) ( not ( = ?auto_624312 ?auto_624319 ) ) ( not ( = ?auto_624312 ?auto_624320 ) ) ( not ( = ?auto_624312 ?auto_624321 ) ) ( not ( = ?auto_624312 ?auto_624322 ) ) ( not ( = ?auto_624313 ?auto_624314 ) ) ( not ( = ?auto_624313 ?auto_624315 ) ) ( not ( = ?auto_624313 ?auto_624316 ) ) ( not ( = ?auto_624313 ?auto_624317 ) ) ( not ( = ?auto_624313 ?auto_624318 ) ) ( not ( = ?auto_624313 ?auto_624319 ) ) ( not ( = ?auto_624313 ?auto_624320 ) ) ( not ( = ?auto_624313 ?auto_624321 ) ) ( not ( = ?auto_624313 ?auto_624322 ) ) ( not ( = ?auto_624314 ?auto_624315 ) ) ( not ( = ?auto_624314 ?auto_624316 ) ) ( not ( = ?auto_624314 ?auto_624317 ) ) ( not ( = ?auto_624314 ?auto_624318 ) ) ( not ( = ?auto_624314 ?auto_624319 ) ) ( not ( = ?auto_624314 ?auto_624320 ) ) ( not ( = ?auto_624314 ?auto_624321 ) ) ( not ( = ?auto_624314 ?auto_624322 ) ) ( not ( = ?auto_624315 ?auto_624316 ) ) ( not ( = ?auto_624315 ?auto_624317 ) ) ( not ( = ?auto_624315 ?auto_624318 ) ) ( not ( = ?auto_624315 ?auto_624319 ) ) ( not ( = ?auto_624315 ?auto_624320 ) ) ( not ( = ?auto_624315 ?auto_624321 ) ) ( not ( = ?auto_624315 ?auto_624322 ) ) ( not ( = ?auto_624316 ?auto_624317 ) ) ( not ( = ?auto_624316 ?auto_624318 ) ) ( not ( = ?auto_624316 ?auto_624319 ) ) ( not ( = ?auto_624316 ?auto_624320 ) ) ( not ( = ?auto_624316 ?auto_624321 ) ) ( not ( = ?auto_624316 ?auto_624322 ) ) ( not ( = ?auto_624317 ?auto_624318 ) ) ( not ( = ?auto_624317 ?auto_624319 ) ) ( not ( = ?auto_624317 ?auto_624320 ) ) ( not ( = ?auto_624317 ?auto_624321 ) ) ( not ( = ?auto_624317 ?auto_624322 ) ) ( not ( = ?auto_624318 ?auto_624319 ) ) ( not ( = ?auto_624318 ?auto_624320 ) ) ( not ( = ?auto_624318 ?auto_624321 ) ) ( not ( = ?auto_624318 ?auto_624322 ) ) ( not ( = ?auto_624319 ?auto_624320 ) ) ( not ( = ?auto_624319 ?auto_624321 ) ) ( not ( = ?auto_624319 ?auto_624322 ) ) ( not ( = ?auto_624320 ?auto_624321 ) ) ( not ( = ?auto_624320 ?auto_624322 ) ) ( not ( = ?auto_624321 ?auto_624322 ) ) ( ON ?auto_624320 ?auto_624321 ) ( ON ?auto_624319 ?auto_624320 ) ( ON ?auto_624318 ?auto_624319 ) ( ON ?auto_624317 ?auto_624318 ) ( ON ?auto_624316 ?auto_624317 ) ( ON ?auto_624315 ?auto_624316 ) ( ON ?auto_624314 ?auto_624315 ) ( ON ?auto_624313 ?auto_624314 ) ( ON ?auto_624312 ?auto_624313 ) ( CLEAR ?auto_624310 ) ( ON ?auto_624311 ?auto_624312 ) ( CLEAR ?auto_624311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_624308 ?auto_624309 ?auto_624310 ?auto_624311 )
      ( MAKE-14PILE ?auto_624308 ?auto_624309 ?auto_624310 ?auto_624311 ?auto_624312 ?auto_624313 ?auto_624314 ?auto_624315 ?auto_624316 ?auto_624317 ?auto_624318 ?auto_624319 ?auto_624320 ?auto_624321 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624366 - BLOCK
      ?auto_624367 - BLOCK
      ?auto_624368 - BLOCK
      ?auto_624369 - BLOCK
      ?auto_624370 - BLOCK
      ?auto_624371 - BLOCK
      ?auto_624372 - BLOCK
      ?auto_624373 - BLOCK
      ?auto_624374 - BLOCK
      ?auto_624375 - BLOCK
      ?auto_624376 - BLOCK
      ?auto_624377 - BLOCK
      ?auto_624378 - BLOCK
      ?auto_624379 - BLOCK
    )
    :vars
    (
      ?auto_624380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624379 ?auto_624380 ) ( ON-TABLE ?auto_624366 ) ( ON ?auto_624367 ?auto_624366 ) ( not ( = ?auto_624366 ?auto_624367 ) ) ( not ( = ?auto_624366 ?auto_624368 ) ) ( not ( = ?auto_624366 ?auto_624369 ) ) ( not ( = ?auto_624366 ?auto_624370 ) ) ( not ( = ?auto_624366 ?auto_624371 ) ) ( not ( = ?auto_624366 ?auto_624372 ) ) ( not ( = ?auto_624366 ?auto_624373 ) ) ( not ( = ?auto_624366 ?auto_624374 ) ) ( not ( = ?auto_624366 ?auto_624375 ) ) ( not ( = ?auto_624366 ?auto_624376 ) ) ( not ( = ?auto_624366 ?auto_624377 ) ) ( not ( = ?auto_624366 ?auto_624378 ) ) ( not ( = ?auto_624366 ?auto_624379 ) ) ( not ( = ?auto_624366 ?auto_624380 ) ) ( not ( = ?auto_624367 ?auto_624368 ) ) ( not ( = ?auto_624367 ?auto_624369 ) ) ( not ( = ?auto_624367 ?auto_624370 ) ) ( not ( = ?auto_624367 ?auto_624371 ) ) ( not ( = ?auto_624367 ?auto_624372 ) ) ( not ( = ?auto_624367 ?auto_624373 ) ) ( not ( = ?auto_624367 ?auto_624374 ) ) ( not ( = ?auto_624367 ?auto_624375 ) ) ( not ( = ?auto_624367 ?auto_624376 ) ) ( not ( = ?auto_624367 ?auto_624377 ) ) ( not ( = ?auto_624367 ?auto_624378 ) ) ( not ( = ?auto_624367 ?auto_624379 ) ) ( not ( = ?auto_624367 ?auto_624380 ) ) ( not ( = ?auto_624368 ?auto_624369 ) ) ( not ( = ?auto_624368 ?auto_624370 ) ) ( not ( = ?auto_624368 ?auto_624371 ) ) ( not ( = ?auto_624368 ?auto_624372 ) ) ( not ( = ?auto_624368 ?auto_624373 ) ) ( not ( = ?auto_624368 ?auto_624374 ) ) ( not ( = ?auto_624368 ?auto_624375 ) ) ( not ( = ?auto_624368 ?auto_624376 ) ) ( not ( = ?auto_624368 ?auto_624377 ) ) ( not ( = ?auto_624368 ?auto_624378 ) ) ( not ( = ?auto_624368 ?auto_624379 ) ) ( not ( = ?auto_624368 ?auto_624380 ) ) ( not ( = ?auto_624369 ?auto_624370 ) ) ( not ( = ?auto_624369 ?auto_624371 ) ) ( not ( = ?auto_624369 ?auto_624372 ) ) ( not ( = ?auto_624369 ?auto_624373 ) ) ( not ( = ?auto_624369 ?auto_624374 ) ) ( not ( = ?auto_624369 ?auto_624375 ) ) ( not ( = ?auto_624369 ?auto_624376 ) ) ( not ( = ?auto_624369 ?auto_624377 ) ) ( not ( = ?auto_624369 ?auto_624378 ) ) ( not ( = ?auto_624369 ?auto_624379 ) ) ( not ( = ?auto_624369 ?auto_624380 ) ) ( not ( = ?auto_624370 ?auto_624371 ) ) ( not ( = ?auto_624370 ?auto_624372 ) ) ( not ( = ?auto_624370 ?auto_624373 ) ) ( not ( = ?auto_624370 ?auto_624374 ) ) ( not ( = ?auto_624370 ?auto_624375 ) ) ( not ( = ?auto_624370 ?auto_624376 ) ) ( not ( = ?auto_624370 ?auto_624377 ) ) ( not ( = ?auto_624370 ?auto_624378 ) ) ( not ( = ?auto_624370 ?auto_624379 ) ) ( not ( = ?auto_624370 ?auto_624380 ) ) ( not ( = ?auto_624371 ?auto_624372 ) ) ( not ( = ?auto_624371 ?auto_624373 ) ) ( not ( = ?auto_624371 ?auto_624374 ) ) ( not ( = ?auto_624371 ?auto_624375 ) ) ( not ( = ?auto_624371 ?auto_624376 ) ) ( not ( = ?auto_624371 ?auto_624377 ) ) ( not ( = ?auto_624371 ?auto_624378 ) ) ( not ( = ?auto_624371 ?auto_624379 ) ) ( not ( = ?auto_624371 ?auto_624380 ) ) ( not ( = ?auto_624372 ?auto_624373 ) ) ( not ( = ?auto_624372 ?auto_624374 ) ) ( not ( = ?auto_624372 ?auto_624375 ) ) ( not ( = ?auto_624372 ?auto_624376 ) ) ( not ( = ?auto_624372 ?auto_624377 ) ) ( not ( = ?auto_624372 ?auto_624378 ) ) ( not ( = ?auto_624372 ?auto_624379 ) ) ( not ( = ?auto_624372 ?auto_624380 ) ) ( not ( = ?auto_624373 ?auto_624374 ) ) ( not ( = ?auto_624373 ?auto_624375 ) ) ( not ( = ?auto_624373 ?auto_624376 ) ) ( not ( = ?auto_624373 ?auto_624377 ) ) ( not ( = ?auto_624373 ?auto_624378 ) ) ( not ( = ?auto_624373 ?auto_624379 ) ) ( not ( = ?auto_624373 ?auto_624380 ) ) ( not ( = ?auto_624374 ?auto_624375 ) ) ( not ( = ?auto_624374 ?auto_624376 ) ) ( not ( = ?auto_624374 ?auto_624377 ) ) ( not ( = ?auto_624374 ?auto_624378 ) ) ( not ( = ?auto_624374 ?auto_624379 ) ) ( not ( = ?auto_624374 ?auto_624380 ) ) ( not ( = ?auto_624375 ?auto_624376 ) ) ( not ( = ?auto_624375 ?auto_624377 ) ) ( not ( = ?auto_624375 ?auto_624378 ) ) ( not ( = ?auto_624375 ?auto_624379 ) ) ( not ( = ?auto_624375 ?auto_624380 ) ) ( not ( = ?auto_624376 ?auto_624377 ) ) ( not ( = ?auto_624376 ?auto_624378 ) ) ( not ( = ?auto_624376 ?auto_624379 ) ) ( not ( = ?auto_624376 ?auto_624380 ) ) ( not ( = ?auto_624377 ?auto_624378 ) ) ( not ( = ?auto_624377 ?auto_624379 ) ) ( not ( = ?auto_624377 ?auto_624380 ) ) ( not ( = ?auto_624378 ?auto_624379 ) ) ( not ( = ?auto_624378 ?auto_624380 ) ) ( not ( = ?auto_624379 ?auto_624380 ) ) ( ON ?auto_624378 ?auto_624379 ) ( ON ?auto_624377 ?auto_624378 ) ( ON ?auto_624376 ?auto_624377 ) ( ON ?auto_624375 ?auto_624376 ) ( ON ?auto_624374 ?auto_624375 ) ( ON ?auto_624373 ?auto_624374 ) ( ON ?auto_624372 ?auto_624373 ) ( ON ?auto_624371 ?auto_624372 ) ( ON ?auto_624370 ?auto_624371 ) ( ON ?auto_624369 ?auto_624370 ) ( CLEAR ?auto_624367 ) ( ON ?auto_624368 ?auto_624369 ) ( CLEAR ?auto_624368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_624366 ?auto_624367 ?auto_624368 )
      ( MAKE-14PILE ?auto_624366 ?auto_624367 ?auto_624368 ?auto_624369 ?auto_624370 ?auto_624371 ?auto_624372 ?auto_624373 ?auto_624374 ?auto_624375 ?auto_624376 ?auto_624377 ?auto_624378 ?auto_624379 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624424 - BLOCK
      ?auto_624425 - BLOCK
      ?auto_624426 - BLOCK
      ?auto_624427 - BLOCK
      ?auto_624428 - BLOCK
      ?auto_624429 - BLOCK
      ?auto_624430 - BLOCK
      ?auto_624431 - BLOCK
      ?auto_624432 - BLOCK
      ?auto_624433 - BLOCK
      ?auto_624434 - BLOCK
      ?auto_624435 - BLOCK
      ?auto_624436 - BLOCK
      ?auto_624437 - BLOCK
    )
    :vars
    (
      ?auto_624438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624437 ?auto_624438 ) ( ON-TABLE ?auto_624424 ) ( not ( = ?auto_624424 ?auto_624425 ) ) ( not ( = ?auto_624424 ?auto_624426 ) ) ( not ( = ?auto_624424 ?auto_624427 ) ) ( not ( = ?auto_624424 ?auto_624428 ) ) ( not ( = ?auto_624424 ?auto_624429 ) ) ( not ( = ?auto_624424 ?auto_624430 ) ) ( not ( = ?auto_624424 ?auto_624431 ) ) ( not ( = ?auto_624424 ?auto_624432 ) ) ( not ( = ?auto_624424 ?auto_624433 ) ) ( not ( = ?auto_624424 ?auto_624434 ) ) ( not ( = ?auto_624424 ?auto_624435 ) ) ( not ( = ?auto_624424 ?auto_624436 ) ) ( not ( = ?auto_624424 ?auto_624437 ) ) ( not ( = ?auto_624424 ?auto_624438 ) ) ( not ( = ?auto_624425 ?auto_624426 ) ) ( not ( = ?auto_624425 ?auto_624427 ) ) ( not ( = ?auto_624425 ?auto_624428 ) ) ( not ( = ?auto_624425 ?auto_624429 ) ) ( not ( = ?auto_624425 ?auto_624430 ) ) ( not ( = ?auto_624425 ?auto_624431 ) ) ( not ( = ?auto_624425 ?auto_624432 ) ) ( not ( = ?auto_624425 ?auto_624433 ) ) ( not ( = ?auto_624425 ?auto_624434 ) ) ( not ( = ?auto_624425 ?auto_624435 ) ) ( not ( = ?auto_624425 ?auto_624436 ) ) ( not ( = ?auto_624425 ?auto_624437 ) ) ( not ( = ?auto_624425 ?auto_624438 ) ) ( not ( = ?auto_624426 ?auto_624427 ) ) ( not ( = ?auto_624426 ?auto_624428 ) ) ( not ( = ?auto_624426 ?auto_624429 ) ) ( not ( = ?auto_624426 ?auto_624430 ) ) ( not ( = ?auto_624426 ?auto_624431 ) ) ( not ( = ?auto_624426 ?auto_624432 ) ) ( not ( = ?auto_624426 ?auto_624433 ) ) ( not ( = ?auto_624426 ?auto_624434 ) ) ( not ( = ?auto_624426 ?auto_624435 ) ) ( not ( = ?auto_624426 ?auto_624436 ) ) ( not ( = ?auto_624426 ?auto_624437 ) ) ( not ( = ?auto_624426 ?auto_624438 ) ) ( not ( = ?auto_624427 ?auto_624428 ) ) ( not ( = ?auto_624427 ?auto_624429 ) ) ( not ( = ?auto_624427 ?auto_624430 ) ) ( not ( = ?auto_624427 ?auto_624431 ) ) ( not ( = ?auto_624427 ?auto_624432 ) ) ( not ( = ?auto_624427 ?auto_624433 ) ) ( not ( = ?auto_624427 ?auto_624434 ) ) ( not ( = ?auto_624427 ?auto_624435 ) ) ( not ( = ?auto_624427 ?auto_624436 ) ) ( not ( = ?auto_624427 ?auto_624437 ) ) ( not ( = ?auto_624427 ?auto_624438 ) ) ( not ( = ?auto_624428 ?auto_624429 ) ) ( not ( = ?auto_624428 ?auto_624430 ) ) ( not ( = ?auto_624428 ?auto_624431 ) ) ( not ( = ?auto_624428 ?auto_624432 ) ) ( not ( = ?auto_624428 ?auto_624433 ) ) ( not ( = ?auto_624428 ?auto_624434 ) ) ( not ( = ?auto_624428 ?auto_624435 ) ) ( not ( = ?auto_624428 ?auto_624436 ) ) ( not ( = ?auto_624428 ?auto_624437 ) ) ( not ( = ?auto_624428 ?auto_624438 ) ) ( not ( = ?auto_624429 ?auto_624430 ) ) ( not ( = ?auto_624429 ?auto_624431 ) ) ( not ( = ?auto_624429 ?auto_624432 ) ) ( not ( = ?auto_624429 ?auto_624433 ) ) ( not ( = ?auto_624429 ?auto_624434 ) ) ( not ( = ?auto_624429 ?auto_624435 ) ) ( not ( = ?auto_624429 ?auto_624436 ) ) ( not ( = ?auto_624429 ?auto_624437 ) ) ( not ( = ?auto_624429 ?auto_624438 ) ) ( not ( = ?auto_624430 ?auto_624431 ) ) ( not ( = ?auto_624430 ?auto_624432 ) ) ( not ( = ?auto_624430 ?auto_624433 ) ) ( not ( = ?auto_624430 ?auto_624434 ) ) ( not ( = ?auto_624430 ?auto_624435 ) ) ( not ( = ?auto_624430 ?auto_624436 ) ) ( not ( = ?auto_624430 ?auto_624437 ) ) ( not ( = ?auto_624430 ?auto_624438 ) ) ( not ( = ?auto_624431 ?auto_624432 ) ) ( not ( = ?auto_624431 ?auto_624433 ) ) ( not ( = ?auto_624431 ?auto_624434 ) ) ( not ( = ?auto_624431 ?auto_624435 ) ) ( not ( = ?auto_624431 ?auto_624436 ) ) ( not ( = ?auto_624431 ?auto_624437 ) ) ( not ( = ?auto_624431 ?auto_624438 ) ) ( not ( = ?auto_624432 ?auto_624433 ) ) ( not ( = ?auto_624432 ?auto_624434 ) ) ( not ( = ?auto_624432 ?auto_624435 ) ) ( not ( = ?auto_624432 ?auto_624436 ) ) ( not ( = ?auto_624432 ?auto_624437 ) ) ( not ( = ?auto_624432 ?auto_624438 ) ) ( not ( = ?auto_624433 ?auto_624434 ) ) ( not ( = ?auto_624433 ?auto_624435 ) ) ( not ( = ?auto_624433 ?auto_624436 ) ) ( not ( = ?auto_624433 ?auto_624437 ) ) ( not ( = ?auto_624433 ?auto_624438 ) ) ( not ( = ?auto_624434 ?auto_624435 ) ) ( not ( = ?auto_624434 ?auto_624436 ) ) ( not ( = ?auto_624434 ?auto_624437 ) ) ( not ( = ?auto_624434 ?auto_624438 ) ) ( not ( = ?auto_624435 ?auto_624436 ) ) ( not ( = ?auto_624435 ?auto_624437 ) ) ( not ( = ?auto_624435 ?auto_624438 ) ) ( not ( = ?auto_624436 ?auto_624437 ) ) ( not ( = ?auto_624436 ?auto_624438 ) ) ( not ( = ?auto_624437 ?auto_624438 ) ) ( ON ?auto_624436 ?auto_624437 ) ( ON ?auto_624435 ?auto_624436 ) ( ON ?auto_624434 ?auto_624435 ) ( ON ?auto_624433 ?auto_624434 ) ( ON ?auto_624432 ?auto_624433 ) ( ON ?auto_624431 ?auto_624432 ) ( ON ?auto_624430 ?auto_624431 ) ( ON ?auto_624429 ?auto_624430 ) ( ON ?auto_624428 ?auto_624429 ) ( ON ?auto_624427 ?auto_624428 ) ( ON ?auto_624426 ?auto_624427 ) ( CLEAR ?auto_624424 ) ( ON ?auto_624425 ?auto_624426 ) ( CLEAR ?auto_624425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_624424 ?auto_624425 )
      ( MAKE-14PILE ?auto_624424 ?auto_624425 ?auto_624426 ?auto_624427 ?auto_624428 ?auto_624429 ?auto_624430 ?auto_624431 ?auto_624432 ?auto_624433 ?auto_624434 ?auto_624435 ?auto_624436 ?auto_624437 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_624482 - BLOCK
      ?auto_624483 - BLOCK
      ?auto_624484 - BLOCK
      ?auto_624485 - BLOCK
      ?auto_624486 - BLOCK
      ?auto_624487 - BLOCK
      ?auto_624488 - BLOCK
      ?auto_624489 - BLOCK
      ?auto_624490 - BLOCK
      ?auto_624491 - BLOCK
      ?auto_624492 - BLOCK
      ?auto_624493 - BLOCK
      ?auto_624494 - BLOCK
      ?auto_624495 - BLOCK
    )
    :vars
    (
      ?auto_624496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624495 ?auto_624496 ) ( not ( = ?auto_624482 ?auto_624483 ) ) ( not ( = ?auto_624482 ?auto_624484 ) ) ( not ( = ?auto_624482 ?auto_624485 ) ) ( not ( = ?auto_624482 ?auto_624486 ) ) ( not ( = ?auto_624482 ?auto_624487 ) ) ( not ( = ?auto_624482 ?auto_624488 ) ) ( not ( = ?auto_624482 ?auto_624489 ) ) ( not ( = ?auto_624482 ?auto_624490 ) ) ( not ( = ?auto_624482 ?auto_624491 ) ) ( not ( = ?auto_624482 ?auto_624492 ) ) ( not ( = ?auto_624482 ?auto_624493 ) ) ( not ( = ?auto_624482 ?auto_624494 ) ) ( not ( = ?auto_624482 ?auto_624495 ) ) ( not ( = ?auto_624482 ?auto_624496 ) ) ( not ( = ?auto_624483 ?auto_624484 ) ) ( not ( = ?auto_624483 ?auto_624485 ) ) ( not ( = ?auto_624483 ?auto_624486 ) ) ( not ( = ?auto_624483 ?auto_624487 ) ) ( not ( = ?auto_624483 ?auto_624488 ) ) ( not ( = ?auto_624483 ?auto_624489 ) ) ( not ( = ?auto_624483 ?auto_624490 ) ) ( not ( = ?auto_624483 ?auto_624491 ) ) ( not ( = ?auto_624483 ?auto_624492 ) ) ( not ( = ?auto_624483 ?auto_624493 ) ) ( not ( = ?auto_624483 ?auto_624494 ) ) ( not ( = ?auto_624483 ?auto_624495 ) ) ( not ( = ?auto_624483 ?auto_624496 ) ) ( not ( = ?auto_624484 ?auto_624485 ) ) ( not ( = ?auto_624484 ?auto_624486 ) ) ( not ( = ?auto_624484 ?auto_624487 ) ) ( not ( = ?auto_624484 ?auto_624488 ) ) ( not ( = ?auto_624484 ?auto_624489 ) ) ( not ( = ?auto_624484 ?auto_624490 ) ) ( not ( = ?auto_624484 ?auto_624491 ) ) ( not ( = ?auto_624484 ?auto_624492 ) ) ( not ( = ?auto_624484 ?auto_624493 ) ) ( not ( = ?auto_624484 ?auto_624494 ) ) ( not ( = ?auto_624484 ?auto_624495 ) ) ( not ( = ?auto_624484 ?auto_624496 ) ) ( not ( = ?auto_624485 ?auto_624486 ) ) ( not ( = ?auto_624485 ?auto_624487 ) ) ( not ( = ?auto_624485 ?auto_624488 ) ) ( not ( = ?auto_624485 ?auto_624489 ) ) ( not ( = ?auto_624485 ?auto_624490 ) ) ( not ( = ?auto_624485 ?auto_624491 ) ) ( not ( = ?auto_624485 ?auto_624492 ) ) ( not ( = ?auto_624485 ?auto_624493 ) ) ( not ( = ?auto_624485 ?auto_624494 ) ) ( not ( = ?auto_624485 ?auto_624495 ) ) ( not ( = ?auto_624485 ?auto_624496 ) ) ( not ( = ?auto_624486 ?auto_624487 ) ) ( not ( = ?auto_624486 ?auto_624488 ) ) ( not ( = ?auto_624486 ?auto_624489 ) ) ( not ( = ?auto_624486 ?auto_624490 ) ) ( not ( = ?auto_624486 ?auto_624491 ) ) ( not ( = ?auto_624486 ?auto_624492 ) ) ( not ( = ?auto_624486 ?auto_624493 ) ) ( not ( = ?auto_624486 ?auto_624494 ) ) ( not ( = ?auto_624486 ?auto_624495 ) ) ( not ( = ?auto_624486 ?auto_624496 ) ) ( not ( = ?auto_624487 ?auto_624488 ) ) ( not ( = ?auto_624487 ?auto_624489 ) ) ( not ( = ?auto_624487 ?auto_624490 ) ) ( not ( = ?auto_624487 ?auto_624491 ) ) ( not ( = ?auto_624487 ?auto_624492 ) ) ( not ( = ?auto_624487 ?auto_624493 ) ) ( not ( = ?auto_624487 ?auto_624494 ) ) ( not ( = ?auto_624487 ?auto_624495 ) ) ( not ( = ?auto_624487 ?auto_624496 ) ) ( not ( = ?auto_624488 ?auto_624489 ) ) ( not ( = ?auto_624488 ?auto_624490 ) ) ( not ( = ?auto_624488 ?auto_624491 ) ) ( not ( = ?auto_624488 ?auto_624492 ) ) ( not ( = ?auto_624488 ?auto_624493 ) ) ( not ( = ?auto_624488 ?auto_624494 ) ) ( not ( = ?auto_624488 ?auto_624495 ) ) ( not ( = ?auto_624488 ?auto_624496 ) ) ( not ( = ?auto_624489 ?auto_624490 ) ) ( not ( = ?auto_624489 ?auto_624491 ) ) ( not ( = ?auto_624489 ?auto_624492 ) ) ( not ( = ?auto_624489 ?auto_624493 ) ) ( not ( = ?auto_624489 ?auto_624494 ) ) ( not ( = ?auto_624489 ?auto_624495 ) ) ( not ( = ?auto_624489 ?auto_624496 ) ) ( not ( = ?auto_624490 ?auto_624491 ) ) ( not ( = ?auto_624490 ?auto_624492 ) ) ( not ( = ?auto_624490 ?auto_624493 ) ) ( not ( = ?auto_624490 ?auto_624494 ) ) ( not ( = ?auto_624490 ?auto_624495 ) ) ( not ( = ?auto_624490 ?auto_624496 ) ) ( not ( = ?auto_624491 ?auto_624492 ) ) ( not ( = ?auto_624491 ?auto_624493 ) ) ( not ( = ?auto_624491 ?auto_624494 ) ) ( not ( = ?auto_624491 ?auto_624495 ) ) ( not ( = ?auto_624491 ?auto_624496 ) ) ( not ( = ?auto_624492 ?auto_624493 ) ) ( not ( = ?auto_624492 ?auto_624494 ) ) ( not ( = ?auto_624492 ?auto_624495 ) ) ( not ( = ?auto_624492 ?auto_624496 ) ) ( not ( = ?auto_624493 ?auto_624494 ) ) ( not ( = ?auto_624493 ?auto_624495 ) ) ( not ( = ?auto_624493 ?auto_624496 ) ) ( not ( = ?auto_624494 ?auto_624495 ) ) ( not ( = ?auto_624494 ?auto_624496 ) ) ( not ( = ?auto_624495 ?auto_624496 ) ) ( ON ?auto_624494 ?auto_624495 ) ( ON ?auto_624493 ?auto_624494 ) ( ON ?auto_624492 ?auto_624493 ) ( ON ?auto_624491 ?auto_624492 ) ( ON ?auto_624490 ?auto_624491 ) ( ON ?auto_624489 ?auto_624490 ) ( ON ?auto_624488 ?auto_624489 ) ( ON ?auto_624487 ?auto_624488 ) ( ON ?auto_624486 ?auto_624487 ) ( ON ?auto_624485 ?auto_624486 ) ( ON ?auto_624484 ?auto_624485 ) ( ON ?auto_624483 ?auto_624484 ) ( ON ?auto_624482 ?auto_624483 ) ( CLEAR ?auto_624482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_624482 )
      ( MAKE-14PILE ?auto_624482 ?auto_624483 ?auto_624484 ?auto_624485 ?auto_624486 ?auto_624487 ?auto_624488 ?auto_624489 ?auto_624490 ?auto_624491 ?auto_624492 ?auto_624493 ?auto_624494 ?auto_624495 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624541 - BLOCK
      ?auto_624542 - BLOCK
      ?auto_624543 - BLOCK
      ?auto_624544 - BLOCK
      ?auto_624545 - BLOCK
      ?auto_624546 - BLOCK
      ?auto_624547 - BLOCK
      ?auto_624548 - BLOCK
      ?auto_624549 - BLOCK
      ?auto_624550 - BLOCK
      ?auto_624551 - BLOCK
      ?auto_624552 - BLOCK
      ?auto_624553 - BLOCK
      ?auto_624554 - BLOCK
      ?auto_624555 - BLOCK
    )
    :vars
    (
      ?auto_624556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_624554 ) ( ON ?auto_624555 ?auto_624556 ) ( CLEAR ?auto_624555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_624541 ) ( ON ?auto_624542 ?auto_624541 ) ( ON ?auto_624543 ?auto_624542 ) ( ON ?auto_624544 ?auto_624543 ) ( ON ?auto_624545 ?auto_624544 ) ( ON ?auto_624546 ?auto_624545 ) ( ON ?auto_624547 ?auto_624546 ) ( ON ?auto_624548 ?auto_624547 ) ( ON ?auto_624549 ?auto_624548 ) ( ON ?auto_624550 ?auto_624549 ) ( ON ?auto_624551 ?auto_624550 ) ( ON ?auto_624552 ?auto_624551 ) ( ON ?auto_624553 ?auto_624552 ) ( ON ?auto_624554 ?auto_624553 ) ( not ( = ?auto_624541 ?auto_624542 ) ) ( not ( = ?auto_624541 ?auto_624543 ) ) ( not ( = ?auto_624541 ?auto_624544 ) ) ( not ( = ?auto_624541 ?auto_624545 ) ) ( not ( = ?auto_624541 ?auto_624546 ) ) ( not ( = ?auto_624541 ?auto_624547 ) ) ( not ( = ?auto_624541 ?auto_624548 ) ) ( not ( = ?auto_624541 ?auto_624549 ) ) ( not ( = ?auto_624541 ?auto_624550 ) ) ( not ( = ?auto_624541 ?auto_624551 ) ) ( not ( = ?auto_624541 ?auto_624552 ) ) ( not ( = ?auto_624541 ?auto_624553 ) ) ( not ( = ?auto_624541 ?auto_624554 ) ) ( not ( = ?auto_624541 ?auto_624555 ) ) ( not ( = ?auto_624541 ?auto_624556 ) ) ( not ( = ?auto_624542 ?auto_624543 ) ) ( not ( = ?auto_624542 ?auto_624544 ) ) ( not ( = ?auto_624542 ?auto_624545 ) ) ( not ( = ?auto_624542 ?auto_624546 ) ) ( not ( = ?auto_624542 ?auto_624547 ) ) ( not ( = ?auto_624542 ?auto_624548 ) ) ( not ( = ?auto_624542 ?auto_624549 ) ) ( not ( = ?auto_624542 ?auto_624550 ) ) ( not ( = ?auto_624542 ?auto_624551 ) ) ( not ( = ?auto_624542 ?auto_624552 ) ) ( not ( = ?auto_624542 ?auto_624553 ) ) ( not ( = ?auto_624542 ?auto_624554 ) ) ( not ( = ?auto_624542 ?auto_624555 ) ) ( not ( = ?auto_624542 ?auto_624556 ) ) ( not ( = ?auto_624543 ?auto_624544 ) ) ( not ( = ?auto_624543 ?auto_624545 ) ) ( not ( = ?auto_624543 ?auto_624546 ) ) ( not ( = ?auto_624543 ?auto_624547 ) ) ( not ( = ?auto_624543 ?auto_624548 ) ) ( not ( = ?auto_624543 ?auto_624549 ) ) ( not ( = ?auto_624543 ?auto_624550 ) ) ( not ( = ?auto_624543 ?auto_624551 ) ) ( not ( = ?auto_624543 ?auto_624552 ) ) ( not ( = ?auto_624543 ?auto_624553 ) ) ( not ( = ?auto_624543 ?auto_624554 ) ) ( not ( = ?auto_624543 ?auto_624555 ) ) ( not ( = ?auto_624543 ?auto_624556 ) ) ( not ( = ?auto_624544 ?auto_624545 ) ) ( not ( = ?auto_624544 ?auto_624546 ) ) ( not ( = ?auto_624544 ?auto_624547 ) ) ( not ( = ?auto_624544 ?auto_624548 ) ) ( not ( = ?auto_624544 ?auto_624549 ) ) ( not ( = ?auto_624544 ?auto_624550 ) ) ( not ( = ?auto_624544 ?auto_624551 ) ) ( not ( = ?auto_624544 ?auto_624552 ) ) ( not ( = ?auto_624544 ?auto_624553 ) ) ( not ( = ?auto_624544 ?auto_624554 ) ) ( not ( = ?auto_624544 ?auto_624555 ) ) ( not ( = ?auto_624544 ?auto_624556 ) ) ( not ( = ?auto_624545 ?auto_624546 ) ) ( not ( = ?auto_624545 ?auto_624547 ) ) ( not ( = ?auto_624545 ?auto_624548 ) ) ( not ( = ?auto_624545 ?auto_624549 ) ) ( not ( = ?auto_624545 ?auto_624550 ) ) ( not ( = ?auto_624545 ?auto_624551 ) ) ( not ( = ?auto_624545 ?auto_624552 ) ) ( not ( = ?auto_624545 ?auto_624553 ) ) ( not ( = ?auto_624545 ?auto_624554 ) ) ( not ( = ?auto_624545 ?auto_624555 ) ) ( not ( = ?auto_624545 ?auto_624556 ) ) ( not ( = ?auto_624546 ?auto_624547 ) ) ( not ( = ?auto_624546 ?auto_624548 ) ) ( not ( = ?auto_624546 ?auto_624549 ) ) ( not ( = ?auto_624546 ?auto_624550 ) ) ( not ( = ?auto_624546 ?auto_624551 ) ) ( not ( = ?auto_624546 ?auto_624552 ) ) ( not ( = ?auto_624546 ?auto_624553 ) ) ( not ( = ?auto_624546 ?auto_624554 ) ) ( not ( = ?auto_624546 ?auto_624555 ) ) ( not ( = ?auto_624546 ?auto_624556 ) ) ( not ( = ?auto_624547 ?auto_624548 ) ) ( not ( = ?auto_624547 ?auto_624549 ) ) ( not ( = ?auto_624547 ?auto_624550 ) ) ( not ( = ?auto_624547 ?auto_624551 ) ) ( not ( = ?auto_624547 ?auto_624552 ) ) ( not ( = ?auto_624547 ?auto_624553 ) ) ( not ( = ?auto_624547 ?auto_624554 ) ) ( not ( = ?auto_624547 ?auto_624555 ) ) ( not ( = ?auto_624547 ?auto_624556 ) ) ( not ( = ?auto_624548 ?auto_624549 ) ) ( not ( = ?auto_624548 ?auto_624550 ) ) ( not ( = ?auto_624548 ?auto_624551 ) ) ( not ( = ?auto_624548 ?auto_624552 ) ) ( not ( = ?auto_624548 ?auto_624553 ) ) ( not ( = ?auto_624548 ?auto_624554 ) ) ( not ( = ?auto_624548 ?auto_624555 ) ) ( not ( = ?auto_624548 ?auto_624556 ) ) ( not ( = ?auto_624549 ?auto_624550 ) ) ( not ( = ?auto_624549 ?auto_624551 ) ) ( not ( = ?auto_624549 ?auto_624552 ) ) ( not ( = ?auto_624549 ?auto_624553 ) ) ( not ( = ?auto_624549 ?auto_624554 ) ) ( not ( = ?auto_624549 ?auto_624555 ) ) ( not ( = ?auto_624549 ?auto_624556 ) ) ( not ( = ?auto_624550 ?auto_624551 ) ) ( not ( = ?auto_624550 ?auto_624552 ) ) ( not ( = ?auto_624550 ?auto_624553 ) ) ( not ( = ?auto_624550 ?auto_624554 ) ) ( not ( = ?auto_624550 ?auto_624555 ) ) ( not ( = ?auto_624550 ?auto_624556 ) ) ( not ( = ?auto_624551 ?auto_624552 ) ) ( not ( = ?auto_624551 ?auto_624553 ) ) ( not ( = ?auto_624551 ?auto_624554 ) ) ( not ( = ?auto_624551 ?auto_624555 ) ) ( not ( = ?auto_624551 ?auto_624556 ) ) ( not ( = ?auto_624552 ?auto_624553 ) ) ( not ( = ?auto_624552 ?auto_624554 ) ) ( not ( = ?auto_624552 ?auto_624555 ) ) ( not ( = ?auto_624552 ?auto_624556 ) ) ( not ( = ?auto_624553 ?auto_624554 ) ) ( not ( = ?auto_624553 ?auto_624555 ) ) ( not ( = ?auto_624553 ?auto_624556 ) ) ( not ( = ?auto_624554 ?auto_624555 ) ) ( not ( = ?auto_624554 ?auto_624556 ) ) ( not ( = ?auto_624555 ?auto_624556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_624555 ?auto_624556 )
      ( !STACK ?auto_624555 ?auto_624554 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624603 - BLOCK
      ?auto_624604 - BLOCK
      ?auto_624605 - BLOCK
      ?auto_624606 - BLOCK
      ?auto_624607 - BLOCK
      ?auto_624608 - BLOCK
      ?auto_624609 - BLOCK
      ?auto_624610 - BLOCK
      ?auto_624611 - BLOCK
      ?auto_624612 - BLOCK
      ?auto_624613 - BLOCK
      ?auto_624614 - BLOCK
      ?auto_624615 - BLOCK
      ?auto_624616 - BLOCK
      ?auto_624617 - BLOCK
    )
    :vars
    (
      ?auto_624618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624617 ?auto_624618 ) ( ON-TABLE ?auto_624603 ) ( ON ?auto_624604 ?auto_624603 ) ( ON ?auto_624605 ?auto_624604 ) ( ON ?auto_624606 ?auto_624605 ) ( ON ?auto_624607 ?auto_624606 ) ( ON ?auto_624608 ?auto_624607 ) ( ON ?auto_624609 ?auto_624608 ) ( ON ?auto_624610 ?auto_624609 ) ( ON ?auto_624611 ?auto_624610 ) ( ON ?auto_624612 ?auto_624611 ) ( ON ?auto_624613 ?auto_624612 ) ( ON ?auto_624614 ?auto_624613 ) ( ON ?auto_624615 ?auto_624614 ) ( not ( = ?auto_624603 ?auto_624604 ) ) ( not ( = ?auto_624603 ?auto_624605 ) ) ( not ( = ?auto_624603 ?auto_624606 ) ) ( not ( = ?auto_624603 ?auto_624607 ) ) ( not ( = ?auto_624603 ?auto_624608 ) ) ( not ( = ?auto_624603 ?auto_624609 ) ) ( not ( = ?auto_624603 ?auto_624610 ) ) ( not ( = ?auto_624603 ?auto_624611 ) ) ( not ( = ?auto_624603 ?auto_624612 ) ) ( not ( = ?auto_624603 ?auto_624613 ) ) ( not ( = ?auto_624603 ?auto_624614 ) ) ( not ( = ?auto_624603 ?auto_624615 ) ) ( not ( = ?auto_624603 ?auto_624616 ) ) ( not ( = ?auto_624603 ?auto_624617 ) ) ( not ( = ?auto_624603 ?auto_624618 ) ) ( not ( = ?auto_624604 ?auto_624605 ) ) ( not ( = ?auto_624604 ?auto_624606 ) ) ( not ( = ?auto_624604 ?auto_624607 ) ) ( not ( = ?auto_624604 ?auto_624608 ) ) ( not ( = ?auto_624604 ?auto_624609 ) ) ( not ( = ?auto_624604 ?auto_624610 ) ) ( not ( = ?auto_624604 ?auto_624611 ) ) ( not ( = ?auto_624604 ?auto_624612 ) ) ( not ( = ?auto_624604 ?auto_624613 ) ) ( not ( = ?auto_624604 ?auto_624614 ) ) ( not ( = ?auto_624604 ?auto_624615 ) ) ( not ( = ?auto_624604 ?auto_624616 ) ) ( not ( = ?auto_624604 ?auto_624617 ) ) ( not ( = ?auto_624604 ?auto_624618 ) ) ( not ( = ?auto_624605 ?auto_624606 ) ) ( not ( = ?auto_624605 ?auto_624607 ) ) ( not ( = ?auto_624605 ?auto_624608 ) ) ( not ( = ?auto_624605 ?auto_624609 ) ) ( not ( = ?auto_624605 ?auto_624610 ) ) ( not ( = ?auto_624605 ?auto_624611 ) ) ( not ( = ?auto_624605 ?auto_624612 ) ) ( not ( = ?auto_624605 ?auto_624613 ) ) ( not ( = ?auto_624605 ?auto_624614 ) ) ( not ( = ?auto_624605 ?auto_624615 ) ) ( not ( = ?auto_624605 ?auto_624616 ) ) ( not ( = ?auto_624605 ?auto_624617 ) ) ( not ( = ?auto_624605 ?auto_624618 ) ) ( not ( = ?auto_624606 ?auto_624607 ) ) ( not ( = ?auto_624606 ?auto_624608 ) ) ( not ( = ?auto_624606 ?auto_624609 ) ) ( not ( = ?auto_624606 ?auto_624610 ) ) ( not ( = ?auto_624606 ?auto_624611 ) ) ( not ( = ?auto_624606 ?auto_624612 ) ) ( not ( = ?auto_624606 ?auto_624613 ) ) ( not ( = ?auto_624606 ?auto_624614 ) ) ( not ( = ?auto_624606 ?auto_624615 ) ) ( not ( = ?auto_624606 ?auto_624616 ) ) ( not ( = ?auto_624606 ?auto_624617 ) ) ( not ( = ?auto_624606 ?auto_624618 ) ) ( not ( = ?auto_624607 ?auto_624608 ) ) ( not ( = ?auto_624607 ?auto_624609 ) ) ( not ( = ?auto_624607 ?auto_624610 ) ) ( not ( = ?auto_624607 ?auto_624611 ) ) ( not ( = ?auto_624607 ?auto_624612 ) ) ( not ( = ?auto_624607 ?auto_624613 ) ) ( not ( = ?auto_624607 ?auto_624614 ) ) ( not ( = ?auto_624607 ?auto_624615 ) ) ( not ( = ?auto_624607 ?auto_624616 ) ) ( not ( = ?auto_624607 ?auto_624617 ) ) ( not ( = ?auto_624607 ?auto_624618 ) ) ( not ( = ?auto_624608 ?auto_624609 ) ) ( not ( = ?auto_624608 ?auto_624610 ) ) ( not ( = ?auto_624608 ?auto_624611 ) ) ( not ( = ?auto_624608 ?auto_624612 ) ) ( not ( = ?auto_624608 ?auto_624613 ) ) ( not ( = ?auto_624608 ?auto_624614 ) ) ( not ( = ?auto_624608 ?auto_624615 ) ) ( not ( = ?auto_624608 ?auto_624616 ) ) ( not ( = ?auto_624608 ?auto_624617 ) ) ( not ( = ?auto_624608 ?auto_624618 ) ) ( not ( = ?auto_624609 ?auto_624610 ) ) ( not ( = ?auto_624609 ?auto_624611 ) ) ( not ( = ?auto_624609 ?auto_624612 ) ) ( not ( = ?auto_624609 ?auto_624613 ) ) ( not ( = ?auto_624609 ?auto_624614 ) ) ( not ( = ?auto_624609 ?auto_624615 ) ) ( not ( = ?auto_624609 ?auto_624616 ) ) ( not ( = ?auto_624609 ?auto_624617 ) ) ( not ( = ?auto_624609 ?auto_624618 ) ) ( not ( = ?auto_624610 ?auto_624611 ) ) ( not ( = ?auto_624610 ?auto_624612 ) ) ( not ( = ?auto_624610 ?auto_624613 ) ) ( not ( = ?auto_624610 ?auto_624614 ) ) ( not ( = ?auto_624610 ?auto_624615 ) ) ( not ( = ?auto_624610 ?auto_624616 ) ) ( not ( = ?auto_624610 ?auto_624617 ) ) ( not ( = ?auto_624610 ?auto_624618 ) ) ( not ( = ?auto_624611 ?auto_624612 ) ) ( not ( = ?auto_624611 ?auto_624613 ) ) ( not ( = ?auto_624611 ?auto_624614 ) ) ( not ( = ?auto_624611 ?auto_624615 ) ) ( not ( = ?auto_624611 ?auto_624616 ) ) ( not ( = ?auto_624611 ?auto_624617 ) ) ( not ( = ?auto_624611 ?auto_624618 ) ) ( not ( = ?auto_624612 ?auto_624613 ) ) ( not ( = ?auto_624612 ?auto_624614 ) ) ( not ( = ?auto_624612 ?auto_624615 ) ) ( not ( = ?auto_624612 ?auto_624616 ) ) ( not ( = ?auto_624612 ?auto_624617 ) ) ( not ( = ?auto_624612 ?auto_624618 ) ) ( not ( = ?auto_624613 ?auto_624614 ) ) ( not ( = ?auto_624613 ?auto_624615 ) ) ( not ( = ?auto_624613 ?auto_624616 ) ) ( not ( = ?auto_624613 ?auto_624617 ) ) ( not ( = ?auto_624613 ?auto_624618 ) ) ( not ( = ?auto_624614 ?auto_624615 ) ) ( not ( = ?auto_624614 ?auto_624616 ) ) ( not ( = ?auto_624614 ?auto_624617 ) ) ( not ( = ?auto_624614 ?auto_624618 ) ) ( not ( = ?auto_624615 ?auto_624616 ) ) ( not ( = ?auto_624615 ?auto_624617 ) ) ( not ( = ?auto_624615 ?auto_624618 ) ) ( not ( = ?auto_624616 ?auto_624617 ) ) ( not ( = ?auto_624616 ?auto_624618 ) ) ( not ( = ?auto_624617 ?auto_624618 ) ) ( CLEAR ?auto_624615 ) ( ON ?auto_624616 ?auto_624617 ) ( CLEAR ?auto_624616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_624603 ?auto_624604 ?auto_624605 ?auto_624606 ?auto_624607 ?auto_624608 ?auto_624609 ?auto_624610 ?auto_624611 ?auto_624612 ?auto_624613 ?auto_624614 ?auto_624615 ?auto_624616 )
      ( MAKE-15PILE ?auto_624603 ?auto_624604 ?auto_624605 ?auto_624606 ?auto_624607 ?auto_624608 ?auto_624609 ?auto_624610 ?auto_624611 ?auto_624612 ?auto_624613 ?auto_624614 ?auto_624615 ?auto_624616 ?auto_624617 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624665 - BLOCK
      ?auto_624666 - BLOCK
      ?auto_624667 - BLOCK
      ?auto_624668 - BLOCK
      ?auto_624669 - BLOCK
      ?auto_624670 - BLOCK
      ?auto_624671 - BLOCK
      ?auto_624672 - BLOCK
      ?auto_624673 - BLOCK
      ?auto_624674 - BLOCK
      ?auto_624675 - BLOCK
      ?auto_624676 - BLOCK
      ?auto_624677 - BLOCK
      ?auto_624678 - BLOCK
      ?auto_624679 - BLOCK
    )
    :vars
    (
      ?auto_624680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624679 ?auto_624680 ) ( ON-TABLE ?auto_624665 ) ( ON ?auto_624666 ?auto_624665 ) ( ON ?auto_624667 ?auto_624666 ) ( ON ?auto_624668 ?auto_624667 ) ( ON ?auto_624669 ?auto_624668 ) ( ON ?auto_624670 ?auto_624669 ) ( ON ?auto_624671 ?auto_624670 ) ( ON ?auto_624672 ?auto_624671 ) ( ON ?auto_624673 ?auto_624672 ) ( ON ?auto_624674 ?auto_624673 ) ( ON ?auto_624675 ?auto_624674 ) ( ON ?auto_624676 ?auto_624675 ) ( not ( = ?auto_624665 ?auto_624666 ) ) ( not ( = ?auto_624665 ?auto_624667 ) ) ( not ( = ?auto_624665 ?auto_624668 ) ) ( not ( = ?auto_624665 ?auto_624669 ) ) ( not ( = ?auto_624665 ?auto_624670 ) ) ( not ( = ?auto_624665 ?auto_624671 ) ) ( not ( = ?auto_624665 ?auto_624672 ) ) ( not ( = ?auto_624665 ?auto_624673 ) ) ( not ( = ?auto_624665 ?auto_624674 ) ) ( not ( = ?auto_624665 ?auto_624675 ) ) ( not ( = ?auto_624665 ?auto_624676 ) ) ( not ( = ?auto_624665 ?auto_624677 ) ) ( not ( = ?auto_624665 ?auto_624678 ) ) ( not ( = ?auto_624665 ?auto_624679 ) ) ( not ( = ?auto_624665 ?auto_624680 ) ) ( not ( = ?auto_624666 ?auto_624667 ) ) ( not ( = ?auto_624666 ?auto_624668 ) ) ( not ( = ?auto_624666 ?auto_624669 ) ) ( not ( = ?auto_624666 ?auto_624670 ) ) ( not ( = ?auto_624666 ?auto_624671 ) ) ( not ( = ?auto_624666 ?auto_624672 ) ) ( not ( = ?auto_624666 ?auto_624673 ) ) ( not ( = ?auto_624666 ?auto_624674 ) ) ( not ( = ?auto_624666 ?auto_624675 ) ) ( not ( = ?auto_624666 ?auto_624676 ) ) ( not ( = ?auto_624666 ?auto_624677 ) ) ( not ( = ?auto_624666 ?auto_624678 ) ) ( not ( = ?auto_624666 ?auto_624679 ) ) ( not ( = ?auto_624666 ?auto_624680 ) ) ( not ( = ?auto_624667 ?auto_624668 ) ) ( not ( = ?auto_624667 ?auto_624669 ) ) ( not ( = ?auto_624667 ?auto_624670 ) ) ( not ( = ?auto_624667 ?auto_624671 ) ) ( not ( = ?auto_624667 ?auto_624672 ) ) ( not ( = ?auto_624667 ?auto_624673 ) ) ( not ( = ?auto_624667 ?auto_624674 ) ) ( not ( = ?auto_624667 ?auto_624675 ) ) ( not ( = ?auto_624667 ?auto_624676 ) ) ( not ( = ?auto_624667 ?auto_624677 ) ) ( not ( = ?auto_624667 ?auto_624678 ) ) ( not ( = ?auto_624667 ?auto_624679 ) ) ( not ( = ?auto_624667 ?auto_624680 ) ) ( not ( = ?auto_624668 ?auto_624669 ) ) ( not ( = ?auto_624668 ?auto_624670 ) ) ( not ( = ?auto_624668 ?auto_624671 ) ) ( not ( = ?auto_624668 ?auto_624672 ) ) ( not ( = ?auto_624668 ?auto_624673 ) ) ( not ( = ?auto_624668 ?auto_624674 ) ) ( not ( = ?auto_624668 ?auto_624675 ) ) ( not ( = ?auto_624668 ?auto_624676 ) ) ( not ( = ?auto_624668 ?auto_624677 ) ) ( not ( = ?auto_624668 ?auto_624678 ) ) ( not ( = ?auto_624668 ?auto_624679 ) ) ( not ( = ?auto_624668 ?auto_624680 ) ) ( not ( = ?auto_624669 ?auto_624670 ) ) ( not ( = ?auto_624669 ?auto_624671 ) ) ( not ( = ?auto_624669 ?auto_624672 ) ) ( not ( = ?auto_624669 ?auto_624673 ) ) ( not ( = ?auto_624669 ?auto_624674 ) ) ( not ( = ?auto_624669 ?auto_624675 ) ) ( not ( = ?auto_624669 ?auto_624676 ) ) ( not ( = ?auto_624669 ?auto_624677 ) ) ( not ( = ?auto_624669 ?auto_624678 ) ) ( not ( = ?auto_624669 ?auto_624679 ) ) ( not ( = ?auto_624669 ?auto_624680 ) ) ( not ( = ?auto_624670 ?auto_624671 ) ) ( not ( = ?auto_624670 ?auto_624672 ) ) ( not ( = ?auto_624670 ?auto_624673 ) ) ( not ( = ?auto_624670 ?auto_624674 ) ) ( not ( = ?auto_624670 ?auto_624675 ) ) ( not ( = ?auto_624670 ?auto_624676 ) ) ( not ( = ?auto_624670 ?auto_624677 ) ) ( not ( = ?auto_624670 ?auto_624678 ) ) ( not ( = ?auto_624670 ?auto_624679 ) ) ( not ( = ?auto_624670 ?auto_624680 ) ) ( not ( = ?auto_624671 ?auto_624672 ) ) ( not ( = ?auto_624671 ?auto_624673 ) ) ( not ( = ?auto_624671 ?auto_624674 ) ) ( not ( = ?auto_624671 ?auto_624675 ) ) ( not ( = ?auto_624671 ?auto_624676 ) ) ( not ( = ?auto_624671 ?auto_624677 ) ) ( not ( = ?auto_624671 ?auto_624678 ) ) ( not ( = ?auto_624671 ?auto_624679 ) ) ( not ( = ?auto_624671 ?auto_624680 ) ) ( not ( = ?auto_624672 ?auto_624673 ) ) ( not ( = ?auto_624672 ?auto_624674 ) ) ( not ( = ?auto_624672 ?auto_624675 ) ) ( not ( = ?auto_624672 ?auto_624676 ) ) ( not ( = ?auto_624672 ?auto_624677 ) ) ( not ( = ?auto_624672 ?auto_624678 ) ) ( not ( = ?auto_624672 ?auto_624679 ) ) ( not ( = ?auto_624672 ?auto_624680 ) ) ( not ( = ?auto_624673 ?auto_624674 ) ) ( not ( = ?auto_624673 ?auto_624675 ) ) ( not ( = ?auto_624673 ?auto_624676 ) ) ( not ( = ?auto_624673 ?auto_624677 ) ) ( not ( = ?auto_624673 ?auto_624678 ) ) ( not ( = ?auto_624673 ?auto_624679 ) ) ( not ( = ?auto_624673 ?auto_624680 ) ) ( not ( = ?auto_624674 ?auto_624675 ) ) ( not ( = ?auto_624674 ?auto_624676 ) ) ( not ( = ?auto_624674 ?auto_624677 ) ) ( not ( = ?auto_624674 ?auto_624678 ) ) ( not ( = ?auto_624674 ?auto_624679 ) ) ( not ( = ?auto_624674 ?auto_624680 ) ) ( not ( = ?auto_624675 ?auto_624676 ) ) ( not ( = ?auto_624675 ?auto_624677 ) ) ( not ( = ?auto_624675 ?auto_624678 ) ) ( not ( = ?auto_624675 ?auto_624679 ) ) ( not ( = ?auto_624675 ?auto_624680 ) ) ( not ( = ?auto_624676 ?auto_624677 ) ) ( not ( = ?auto_624676 ?auto_624678 ) ) ( not ( = ?auto_624676 ?auto_624679 ) ) ( not ( = ?auto_624676 ?auto_624680 ) ) ( not ( = ?auto_624677 ?auto_624678 ) ) ( not ( = ?auto_624677 ?auto_624679 ) ) ( not ( = ?auto_624677 ?auto_624680 ) ) ( not ( = ?auto_624678 ?auto_624679 ) ) ( not ( = ?auto_624678 ?auto_624680 ) ) ( not ( = ?auto_624679 ?auto_624680 ) ) ( ON ?auto_624678 ?auto_624679 ) ( CLEAR ?auto_624676 ) ( ON ?auto_624677 ?auto_624678 ) ( CLEAR ?auto_624677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_624665 ?auto_624666 ?auto_624667 ?auto_624668 ?auto_624669 ?auto_624670 ?auto_624671 ?auto_624672 ?auto_624673 ?auto_624674 ?auto_624675 ?auto_624676 ?auto_624677 )
      ( MAKE-15PILE ?auto_624665 ?auto_624666 ?auto_624667 ?auto_624668 ?auto_624669 ?auto_624670 ?auto_624671 ?auto_624672 ?auto_624673 ?auto_624674 ?auto_624675 ?auto_624676 ?auto_624677 ?auto_624678 ?auto_624679 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624727 - BLOCK
      ?auto_624728 - BLOCK
      ?auto_624729 - BLOCK
      ?auto_624730 - BLOCK
      ?auto_624731 - BLOCK
      ?auto_624732 - BLOCK
      ?auto_624733 - BLOCK
      ?auto_624734 - BLOCK
      ?auto_624735 - BLOCK
      ?auto_624736 - BLOCK
      ?auto_624737 - BLOCK
      ?auto_624738 - BLOCK
      ?auto_624739 - BLOCK
      ?auto_624740 - BLOCK
      ?auto_624741 - BLOCK
    )
    :vars
    (
      ?auto_624742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624741 ?auto_624742 ) ( ON-TABLE ?auto_624727 ) ( ON ?auto_624728 ?auto_624727 ) ( ON ?auto_624729 ?auto_624728 ) ( ON ?auto_624730 ?auto_624729 ) ( ON ?auto_624731 ?auto_624730 ) ( ON ?auto_624732 ?auto_624731 ) ( ON ?auto_624733 ?auto_624732 ) ( ON ?auto_624734 ?auto_624733 ) ( ON ?auto_624735 ?auto_624734 ) ( ON ?auto_624736 ?auto_624735 ) ( ON ?auto_624737 ?auto_624736 ) ( not ( = ?auto_624727 ?auto_624728 ) ) ( not ( = ?auto_624727 ?auto_624729 ) ) ( not ( = ?auto_624727 ?auto_624730 ) ) ( not ( = ?auto_624727 ?auto_624731 ) ) ( not ( = ?auto_624727 ?auto_624732 ) ) ( not ( = ?auto_624727 ?auto_624733 ) ) ( not ( = ?auto_624727 ?auto_624734 ) ) ( not ( = ?auto_624727 ?auto_624735 ) ) ( not ( = ?auto_624727 ?auto_624736 ) ) ( not ( = ?auto_624727 ?auto_624737 ) ) ( not ( = ?auto_624727 ?auto_624738 ) ) ( not ( = ?auto_624727 ?auto_624739 ) ) ( not ( = ?auto_624727 ?auto_624740 ) ) ( not ( = ?auto_624727 ?auto_624741 ) ) ( not ( = ?auto_624727 ?auto_624742 ) ) ( not ( = ?auto_624728 ?auto_624729 ) ) ( not ( = ?auto_624728 ?auto_624730 ) ) ( not ( = ?auto_624728 ?auto_624731 ) ) ( not ( = ?auto_624728 ?auto_624732 ) ) ( not ( = ?auto_624728 ?auto_624733 ) ) ( not ( = ?auto_624728 ?auto_624734 ) ) ( not ( = ?auto_624728 ?auto_624735 ) ) ( not ( = ?auto_624728 ?auto_624736 ) ) ( not ( = ?auto_624728 ?auto_624737 ) ) ( not ( = ?auto_624728 ?auto_624738 ) ) ( not ( = ?auto_624728 ?auto_624739 ) ) ( not ( = ?auto_624728 ?auto_624740 ) ) ( not ( = ?auto_624728 ?auto_624741 ) ) ( not ( = ?auto_624728 ?auto_624742 ) ) ( not ( = ?auto_624729 ?auto_624730 ) ) ( not ( = ?auto_624729 ?auto_624731 ) ) ( not ( = ?auto_624729 ?auto_624732 ) ) ( not ( = ?auto_624729 ?auto_624733 ) ) ( not ( = ?auto_624729 ?auto_624734 ) ) ( not ( = ?auto_624729 ?auto_624735 ) ) ( not ( = ?auto_624729 ?auto_624736 ) ) ( not ( = ?auto_624729 ?auto_624737 ) ) ( not ( = ?auto_624729 ?auto_624738 ) ) ( not ( = ?auto_624729 ?auto_624739 ) ) ( not ( = ?auto_624729 ?auto_624740 ) ) ( not ( = ?auto_624729 ?auto_624741 ) ) ( not ( = ?auto_624729 ?auto_624742 ) ) ( not ( = ?auto_624730 ?auto_624731 ) ) ( not ( = ?auto_624730 ?auto_624732 ) ) ( not ( = ?auto_624730 ?auto_624733 ) ) ( not ( = ?auto_624730 ?auto_624734 ) ) ( not ( = ?auto_624730 ?auto_624735 ) ) ( not ( = ?auto_624730 ?auto_624736 ) ) ( not ( = ?auto_624730 ?auto_624737 ) ) ( not ( = ?auto_624730 ?auto_624738 ) ) ( not ( = ?auto_624730 ?auto_624739 ) ) ( not ( = ?auto_624730 ?auto_624740 ) ) ( not ( = ?auto_624730 ?auto_624741 ) ) ( not ( = ?auto_624730 ?auto_624742 ) ) ( not ( = ?auto_624731 ?auto_624732 ) ) ( not ( = ?auto_624731 ?auto_624733 ) ) ( not ( = ?auto_624731 ?auto_624734 ) ) ( not ( = ?auto_624731 ?auto_624735 ) ) ( not ( = ?auto_624731 ?auto_624736 ) ) ( not ( = ?auto_624731 ?auto_624737 ) ) ( not ( = ?auto_624731 ?auto_624738 ) ) ( not ( = ?auto_624731 ?auto_624739 ) ) ( not ( = ?auto_624731 ?auto_624740 ) ) ( not ( = ?auto_624731 ?auto_624741 ) ) ( not ( = ?auto_624731 ?auto_624742 ) ) ( not ( = ?auto_624732 ?auto_624733 ) ) ( not ( = ?auto_624732 ?auto_624734 ) ) ( not ( = ?auto_624732 ?auto_624735 ) ) ( not ( = ?auto_624732 ?auto_624736 ) ) ( not ( = ?auto_624732 ?auto_624737 ) ) ( not ( = ?auto_624732 ?auto_624738 ) ) ( not ( = ?auto_624732 ?auto_624739 ) ) ( not ( = ?auto_624732 ?auto_624740 ) ) ( not ( = ?auto_624732 ?auto_624741 ) ) ( not ( = ?auto_624732 ?auto_624742 ) ) ( not ( = ?auto_624733 ?auto_624734 ) ) ( not ( = ?auto_624733 ?auto_624735 ) ) ( not ( = ?auto_624733 ?auto_624736 ) ) ( not ( = ?auto_624733 ?auto_624737 ) ) ( not ( = ?auto_624733 ?auto_624738 ) ) ( not ( = ?auto_624733 ?auto_624739 ) ) ( not ( = ?auto_624733 ?auto_624740 ) ) ( not ( = ?auto_624733 ?auto_624741 ) ) ( not ( = ?auto_624733 ?auto_624742 ) ) ( not ( = ?auto_624734 ?auto_624735 ) ) ( not ( = ?auto_624734 ?auto_624736 ) ) ( not ( = ?auto_624734 ?auto_624737 ) ) ( not ( = ?auto_624734 ?auto_624738 ) ) ( not ( = ?auto_624734 ?auto_624739 ) ) ( not ( = ?auto_624734 ?auto_624740 ) ) ( not ( = ?auto_624734 ?auto_624741 ) ) ( not ( = ?auto_624734 ?auto_624742 ) ) ( not ( = ?auto_624735 ?auto_624736 ) ) ( not ( = ?auto_624735 ?auto_624737 ) ) ( not ( = ?auto_624735 ?auto_624738 ) ) ( not ( = ?auto_624735 ?auto_624739 ) ) ( not ( = ?auto_624735 ?auto_624740 ) ) ( not ( = ?auto_624735 ?auto_624741 ) ) ( not ( = ?auto_624735 ?auto_624742 ) ) ( not ( = ?auto_624736 ?auto_624737 ) ) ( not ( = ?auto_624736 ?auto_624738 ) ) ( not ( = ?auto_624736 ?auto_624739 ) ) ( not ( = ?auto_624736 ?auto_624740 ) ) ( not ( = ?auto_624736 ?auto_624741 ) ) ( not ( = ?auto_624736 ?auto_624742 ) ) ( not ( = ?auto_624737 ?auto_624738 ) ) ( not ( = ?auto_624737 ?auto_624739 ) ) ( not ( = ?auto_624737 ?auto_624740 ) ) ( not ( = ?auto_624737 ?auto_624741 ) ) ( not ( = ?auto_624737 ?auto_624742 ) ) ( not ( = ?auto_624738 ?auto_624739 ) ) ( not ( = ?auto_624738 ?auto_624740 ) ) ( not ( = ?auto_624738 ?auto_624741 ) ) ( not ( = ?auto_624738 ?auto_624742 ) ) ( not ( = ?auto_624739 ?auto_624740 ) ) ( not ( = ?auto_624739 ?auto_624741 ) ) ( not ( = ?auto_624739 ?auto_624742 ) ) ( not ( = ?auto_624740 ?auto_624741 ) ) ( not ( = ?auto_624740 ?auto_624742 ) ) ( not ( = ?auto_624741 ?auto_624742 ) ) ( ON ?auto_624740 ?auto_624741 ) ( ON ?auto_624739 ?auto_624740 ) ( CLEAR ?auto_624737 ) ( ON ?auto_624738 ?auto_624739 ) ( CLEAR ?auto_624738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_624727 ?auto_624728 ?auto_624729 ?auto_624730 ?auto_624731 ?auto_624732 ?auto_624733 ?auto_624734 ?auto_624735 ?auto_624736 ?auto_624737 ?auto_624738 )
      ( MAKE-15PILE ?auto_624727 ?auto_624728 ?auto_624729 ?auto_624730 ?auto_624731 ?auto_624732 ?auto_624733 ?auto_624734 ?auto_624735 ?auto_624736 ?auto_624737 ?auto_624738 ?auto_624739 ?auto_624740 ?auto_624741 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624789 - BLOCK
      ?auto_624790 - BLOCK
      ?auto_624791 - BLOCK
      ?auto_624792 - BLOCK
      ?auto_624793 - BLOCK
      ?auto_624794 - BLOCK
      ?auto_624795 - BLOCK
      ?auto_624796 - BLOCK
      ?auto_624797 - BLOCK
      ?auto_624798 - BLOCK
      ?auto_624799 - BLOCK
      ?auto_624800 - BLOCK
      ?auto_624801 - BLOCK
      ?auto_624802 - BLOCK
      ?auto_624803 - BLOCK
    )
    :vars
    (
      ?auto_624804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624803 ?auto_624804 ) ( ON-TABLE ?auto_624789 ) ( ON ?auto_624790 ?auto_624789 ) ( ON ?auto_624791 ?auto_624790 ) ( ON ?auto_624792 ?auto_624791 ) ( ON ?auto_624793 ?auto_624792 ) ( ON ?auto_624794 ?auto_624793 ) ( ON ?auto_624795 ?auto_624794 ) ( ON ?auto_624796 ?auto_624795 ) ( ON ?auto_624797 ?auto_624796 ) ( ON ?auto_624798 ?auto_624797 ) ( not ( = ?auto_624789 ?auto_624790 ) ) ( not ( = ?auto_624789 ?auto_624791 ) ) ( not ( = ?auto_624789 ?auto_624792 ) ) ( not ( = ?auto_624789 ?auto_624793 ) ) ( not ( = ?auto_624789 ?auto_624794 ) ) ( not ( = ?auto_624789 ?auto_624795 ) ) ( not ( = ?auto_624789 ?auto_624796 ) ) ( not ( = ?auto_624789 ?auto_624797 ) ) ( not ( = ?auto_624789 ?auto_624798 ) ) ( not ( = ?auto_624789 ?auto_624799 ) ) ( not ( = ?auto_624789 ?auto_624800 ) ) ( not ( = ?auto_624789 ?auto_624801 ) ) ( not ( = ?auto_624789 ?auto_624802 ) ) ( not ( = ?auto_624789 ?auto_624803 ) ) ( not ( = ?auto_624789 ?auto_624804 ) ) ( not ( = ?auto_624790 ?auto_624791 ) ) ( not ( = ?auto_624790 ?auto_624792 ) ) ( not ( = ?auto_624790 ?auto_624793 ) ) ( not ( = ?auto_624790 ?auto_624794 ) ) ( not ( = ?auto_624790 ?auto_624795 ) ) ( not ( = ?auto_624790 ?auto_624796 ) ) ( not ( = ?auto_624790 ?auto_624797 ) ) ( not ( = ?auto_624790 ?auto_624798 ) ) ( not ( = ?auto_624790 ?auto_624799 ) ) ( not ( = ?auto_624790 ?auto_624800 ) ) ( not ( = ?auto_624790 ?auto_624801 ) ) ( not ( = ?auto_624790 ?auto_624802 ) ) ( not ( = ?auto_624790 ?auto_624803 ) ) ( not ( = ?auto_624790 ?auto_624804 ) ) ( not ( = ?auto_624791 ?auto_624792 ) ) ( not ( = ?auto_624791 ?auto_624793 ) ) ( not ( = ?auto_624791 ?auto_624794 ) ) ( not ( = ?auto_624791 ?auto_624795 ) ) ( not ( = ?auto_624791 ?auto_624796 ) ) ( not ( = ?auto_624791 ?auto_624797 ) ) ( not ( = ?auto_624791 ?auto_624798 ) ) ( not ( = ?auto_624791 ?auto_624799 ) ) ( not ( = ?auto_624791 ?auto_624800 ) ) ( not ( = ?auto_624791 ?auto_624801 ) ) ( not ( = ?auto_624791 ?auto_624802 ) ) ( not ( = ?auto_624791 ?auto_624803 ) ) ( not ( = ?auto_624791 ?auto_624804 ) ) ( not ( = ?auto_624792 ?auto_624793 ) ) ( not ( = ?auto_624792 ?auto_624794 ) ) ( not ( = ?auto_624792 ?auto_624795 ) ) ( not ( = ?auto_624792 ?auto_624796 ) ) ( not ( = ?auto_624792 ?auto_624797 ) ) ( not ( = ?auto_624792 ?auto_624798 ) ) ( not ( = ?auto_624792 ?auto_624799 ) ) ( not ( = ?auto_624792 ?auto_624800 ) ) ( not ( = ?auto_624792 ?auto_624801 ) ) ( not ( = ?auto_624792 ?auto_624802 ) ) ( not ( = ?auto_624792 ?auto_624803 ) ) ( not ( = ?auto_624792 ?auto_624804 ) ) ( not ( = ?auto_624793 ?auto_624794 ) ) ( not ( = ?auto_624793 ?auto_624795 ) ) ( not ( = ?auto_624793 ?auto_624796 ) ) ( not ( = ?auto_624793 ?auto_624797 ) ) ( not ( = ?auto_624793 ?auto_624798 ) ) ( not ( = ?auto_624793 ?auto_624799 ) ) ( not ( = ?auto_624793 ?auto_624800 ) ) ( not ( = ?auto_624793 ?auto_624801 ) ) ( not ( = ?auto_624793 ?auto_624802 ) ) ( not ( = ?auto_624793 ?auto_624803 ) ) ( not ( = ?auto_624793 ?auto_624804 ) ) ( not ( = ?auto_624794 ?auto_624795 ) ) ( not ( = ?auto_624794 ?auto_624796 ) ) ( not ( = ?auto_624794 ?auto_624797 ) ) ( not ( = ?auto_624794 ?auto_624798 ) ) ( not ( = ?auto_624794 ?auto_624799 ) ) ( not ( = ?auto_624794 ?auto_624800 ) ) ( not ( = ?auto_624794 ?auto_624801 ) ) ( not ( = ?auto_624794 ?auto_624802 ) ) ( not ( = ?auto_624794 ?auto_624803 ) ) ( not ( = ?auto_624794 ?auto_624804 ) ) ( not ( = ?auto_624795 ?auto_624796 ) ) ( not ( = ?auto_624795 ?auto_624797 ) ) ( not ( = ?auto_624795 ?auto_624798 ) ) ( not ( = ?auto_624795 ?auto_624799 ) ) ( not ( = ?auto_624795 ?auto_624800 ) ) ( not ( = ?auto_624795 ?auto_624801 ) ) ( not ( = ?auto_624795 ?auto_624802 ) ) ( not ( = ?auto_624795 ?auto_624803 ) ) ( not ( = ?auto_624795 ?auto_624804 ) ) ( not ( = ?auto_624796 ?auto_624797 ) ) ( not ( = ?auto_624796 ?auto_624798 ) ) ( not ( = ?auto_624796 ?auto_624799 ) ) ( not ( = ?auto_624796 ?auto_624800 ) ) ( not ( = ?auto_624796 ?auto_624801 ) ) ( not ( = ?auto_624796 ?auto_624802 ) ) ( not ( = ?auto_624796 ?auto_624803 ) ) ( not ( = ?auto_624796 ?auto_624804 ) ) ( not ( = ?auto_624797 ?auto_624798 ) ) ( not ( = ?auto_624797 ?auto_624799 ) ) ( not ( = ?auto_624797 ?auto_624800 ) ) ( not ( = ?auto_624797 ?auto_624801 ) ) ( not ( = ?auto_624797 ?auto_624802 ) ) ( not ( = ?auto_624797 ?auto_624803 ) ) ( not ( = ?auto_624797 ?auto_624804 ) ) ( not ( = ?auto_624798 ?auto_624799 ) ) ( not ( = ?auto_624798 ?auto_624800 ) ) ( not ( = ?auto_624798 ?auto_624801 ) ) ( not ( = ?auto_624798 ?auto_624802 ) ) ( not ( = ?auto_624798 ?auto_624803 ) ) ( not ( = ?auto_624798 ?auto_624804 ) ) ( not ( = ?auto_624799 ?auto_624800 ) ) ( not ( = ?auto_624799 ?auto_624801 ) ) ( not ( = ?auto_624799 ?auto_624802 ) ) ( not ( = ?auto_624799 ?auto_624803 ) ) ( not ( = ?auto_624799 ?auto_624804 ) ) ( not ( = ?auto_624800 ?auto_624801 ) ) ( not ( = ?auto_624800 ?auto_624802 ) ) ( not ( = ?auto_624800 ?auto_624803 ) ) ( not ( = ?auto_624800 ?auto_624804 ) ) ( not ( = ?auto_624801 ?auto_624802 ) ) ( not ( = ?auto_624801 ?auto_624803 ) ) ( not ( = ?auto_624801 ?auto_624804 ) ) ( not ( = ?auto_624802 ?auto_624803 ) ) ( not ( = ?auto_624802 ?auto_624804 ) ) ( not ( = ?auto_624803 ?auto_624804 ) ) ( ON ?auto_624802 ?auto_624803 ) ( ON ?auto_624801 ?auto_624802 ) ( ON ?auto_624800 ?auto_624801 ) ( CLEAR ?auto_624798 ) ( ON ?auto_624799 ?auto_624800 ) ( CLEAR ?auto_624799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_624789 ?auto_624790 ?auto_624791 ?auto_624792 ?auto_624793 ?auto_624794 ?auto_624795 ?auto_624796 ?auto_624797 ?auto_624798 ?auto_624799 )
      ( MAKE-15PILE ?auto_624789 ?auto_624790 ?auto_624791 ?auto_624792 ?auto_624793 ?auto_624794 ?auto_624795 ?auto_624796 ?auto_624797 ?auto_624798 ?auto_624799 ?auto_624800 ?auto_624801 ?auto_624802 ?auto_624803 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624851 - BLOCK
      ?auto_624852 - BLOCK
      ?auto_624853 - BLOCK
      ?auto_624854 - BLOCK
      ?auto_624855 - BLOCK
      ?auto_624856 - BLOCK
      ?auto_624857 - BLOCK
      ?auto_624858 - BLOCK
      ?auto_624859 - BLOCK
      ?auto_624860 - BLOCK
      ?auto_624861 - BLOCK
      ?auto_624862 - BLOCK
      ?auto_624863 - BLOCK
      ?auto_624864 - BLOCK
      ?auto_624865 - BLOCK
    )
    :vars
    (
      ?auto_624866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624865 ?auto_624866 ) ( ON-TABLE ?auto_624851 ) ( ON ?auto_624852 ?auto_624851 ) ( ON ?auto_624853 ?auto_624852 ) ( ON ?auto_624854 ?auto_624853 ) ( ON ?auto_624855 ?auto_624854 ) ( ON ?auto_624856 ?auto_624855 ) ( ON ?auto_624857 ?auto_624856 ) ( ON ?auto_624858 ?auto_624857 ) ( ON ?auto_624859 ?auto_624858 ) ( not ( = ?auto_624851 ?auto_624852 ) ) ( not ( = ?auto_624851 ?auto_624853 ) ) ( not ( = ?auto_624851 ?auto_624854 ) ) ( not ( = ?auto_624851 ?auto_624855 ) ) ( not ( = ?auto_624851 ?auto_624856 ) ) ( not ( = ?auto_624851 ?auto_624857 ) ) ( not ( = ?auto_624851 ?auto_624858 ) ) ( not ( = ?auto_624851 ?auto_624859 ) ) ( not ( = ?auto_624851 ?auto_624860 ) ) ( not ( = ?auto_624851 ?auto_624861 ) ) ( not ( = ?auto_624851 ?auto_624862 ) ) ( not ( = ?auto_624851 ?auto_624863 ) ) ( not ( = ?auto_624851 ?auto_624864 ) ) ( not ( = ?auto_624851 ?auto_624865 ) ) ( not ( = ?auto_624851 ?auto_624866 ) ) ( not ( = ?auto_624852 ?auto_624853 ) ) ( not ( = ?auto_624852 ?auto_624854 ) ) ( not ( = ?auto_624852 ?auto_624855 ) ) ( not ( = ?auto_624852 ?auto_624856 ) ) ( not ( = ?auto_624852 ?auto_624857 ) ) ( not ( = ?auto_624852 ?auto_624858 ) ) ( not ( = ?auto_624852 ?auto_624859 ) ) ( not ( = ?auto_624852 ?auto_624860 ) ) ( not ( = ?auto_624852 ?auto_624861 ) ) ( not ( = ?auto_624852 ?auto_624862 ) ) ( not ( = ?auto_624852 ?auto_624863 ) ) ( not ( = ?auto_624852 ?auto_624864 ) ) ( not ( = ?auto_624852 ?auto_624865 ) ) ( not ( = ?auto_624852 ?auto_624866 ) ) ( not ( = ?auto_624853 ?auto_624854 ) ) ( not ( = ?auto_624853 ?auto_624855 ) ) ( not ( = ?auto_624853 ?auto_624856 ) ) ( not ( = ?auto_624853 ?auto_624857 ) ) ( not ( = ?auto_624853 ?auto_624858 ) ) ( not ( = ?auto_624853 ?auto_624859 ) ) ( not ( = ?auto_624853 ?auto_624860 ) ) ( not ( = ?auto_624853 ?auto_624861 ) ) ( not ( = ?auto_624853 ?auto_624862 ) ) ( not ( = ?auto_624853 ?auto_624863 ) ) ( not ( = ?auto_624853 ?auto_624864 ) ) ( not ( = ?auto_624853 ?auto_624865 ) ) ( not ( = ?auto_624853 ?auto_624866 ) ) ( not ( = ?auto_624854 ?auto_624855 ) ) ( not ( = ?auto_624854 ?auto_624856 ) ) ( not ( = ?auto_624854 ?auto_624857 ) ) ( not ( = ?auto_624854 ?auto_624858 ) ) ( not ( = ?auto_624854 ?auto_624859 ) ) ( not ( = ?auto_624854 ?auto_624860 ) ) ( not ( = ?auto_624854 ?auto_624861 ) ) ( not ( = ?auto_624854 ?auto_624862 ) ) ( not ( = ?auto_624854 ?auto_624863 ) ) ( not ( = ?auto_624854 ?auto_624864 ) ) ( not ( = ?auto_624854 ?auto_624865 ) ) ( not ( = ?auto_624854 ?auto_624866 ) ) ( not ( = ?auto_624855 ?auto_624856 ) ) ( not ( = ?auto_624855 ?auto_624857 ) ) ( not ( = ?auto_624855 ?auto_624858 ) ) ( not ( = ?auto_624855 ?auto_624859 ) ) ( not ( = ?auto_624855 ?auto_624860 ) ) ( not ( = ?auto_624855 ?auto_624861 ) ) ( not ( = ?auto_624855 ?auto_624862 ) ) ( not ( = ?auto_624855 ?auto_624863 ) ) ( not ( = ?auto_624855 ?auto_624864 ) ) ( not ( = ?auto_624855 ?auto_624865 ) ) ( not ( = ?auto_624855 ?auto_624866 ) ) ( not ( = ?auto_624856 ?auto_624857 ) ) ( not ( = ?auto_624856 ?auto_624858 ) ) ( not ( = ?auto_624856 ?auto_624859 ) ) ( not ( = ?auto_624856 ?auto_624860 ) ) ( not ( = ?auto_624856 ?auto_624861 ) ) ( not ( = ?auto_624856 ?auto_624862 ) ) ( not ( = ?auto_624856 ?auto_624863 ) ) ( not ( = ?auto_624856 ?auto_624864 ) ) ( not ( = ?auto_624856 ?auto_624865 ) ) ( not ( = ?auto_624856 ?auto_624866 ) ) ( not ( = ?auto_624857 ?auto_624858 ) ) ( not ( = ?auto_624857 ?auto_624859 ) ) ( not ( = ?auto_624857 ?auto_624860 ) ) ( not ( = ?auto_624857 ?auto_624861 ) ) ( not ( = ?auto_624857 ?auto_624862 ) ) ( not ( = ?auto_624857 ?auto_624863 ) ) ( not ( = ?auto_624857 ?auto_624864 ) ) ( not ( = ?auto_624857 ?auto_624865 ) ) ( not ( = ?auto_624857 ?auto_624866 ) ) ( not ( = ?auto_624858 ?auto_624859 ) ) ( not ( = ?auto_624858 ?auto_624860 ) ) ( not ( = ?auto_624858 ?auto_624861 ) ) ( not ( = ?auto_624858 ?auto_624862 ) ) ( not ( = ?auto_624858 ?auto_624863 ) ) ( not ( = ?auto_624858 ?auto_624864 ) ) ( not ( = ?auto_624858 ?auto_624865 ) ) ( not ( = ?auto_624858 ?auto_624866 ) ) ( not ( = ?auto_624859 ?auto_624860 ) ) ( not ( = ?auto_624859 ?auto_624861 ) ) ( not ( = ?auto_624859 ?auto_624862 ) ) ( not ( = ?auto_624859 ?auto_624863 ) ) ( not ( = ?auto_624859 ?auto_624864 ) ) ( not ( = ?auto_624859 ?auto_624865 ) ) ( not ( = ?auto_624859 ?auto_624866 ) ) ( not ( = ?auto_624860 ?auto_624861 ) ) ( not ( = ?auto_624860 ?auto_624862 ) ) ( not ( = ?auto_624860 ?auto_624863 ) ) ( not ( = ?auto_624860 ?auto_624864 ) ) ( not ( = ?auto_624860 ?auto_624865 ) ) ( not ( = ?auto_624860 ?auto_624866 ) ) ( not ( = ?auto_624861 ?auto_624862 ) ) ( not ( = ?auto_624861 ?auto_624863 ) ) ( not ( = ?auto_624861 ?auto_624864 ) ) ( not ( = ?auto_624861 ?auto_624865 ) ) ( not ( = ?auto_624861 ?auto_624866 ) ) ( not ( = ?auto_624862 ?auto_624863 ) ) ( not ( = ?auto_624862 ?auto_624864 ) ) ( not ( = ?auto_624862 ?auto_624865 ) ) ( not ( = ?auto_624862 ?auto_624866 ) ) ( not ( = ?auto_624863 ?auto_624864 ) ) ( not ( = ?auto_624863 ?auto_624865 ) ) ( not ( = ?auto_624863 ?auto_624866 ) ) ( not ( = ?auto_624864 ?auto_624865 ) ) ( not ( = ?auto_624864 ?auto_624866 ) ) ( not ( = ?auto_624865 ?auto_624866 ) ) ( ON ?auto_624864 ?auto_624865 ) ( ON ?auto_624863 ?auto_624864 ) ( ON ?auto_624862 ?auto_624863 ) ( ON ?auto_624861 ?auto_624862 ) ( CLEAR ?auto_624859 ) ( ON ?auto_624860 ?auto_624861 ) ( CLEAR ?auto_624860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_624851 ?auto_624852 ?auto_624853 ?auto_624854 ?auto_624855 ?auto_624856 ?auto_624857 ?auto_624858 ?auto_624859 ?auto_624860 )
      ( MAKE-15PILE ?auto_624851 ?auto_624852 ?auto_624853 ?auto_624854 ?auto_624855 ?auto_624856 ?auto_624857 ?auto_624858 ?auto_624859 ?auto_624860 ?auto_624861 ?auto_624862 ?auto_624863 ?auto_624864 ?auto_624865 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624913 - BLOCK
      ?auto_624914 - BLOCK
      ?auto_624915 - BLOCK
      ?auto_624916 - BLOCK
      ?auto_624917 - BLOCK
      ?auto_624918 - BLOCK
      ?auto_624919 - BLOCK
      ?auto_624920 - BLOCK
      ?auto_624921 - BLOCK
      ?auto_624922 - BLOCK
      ?auto_624923 - BLOCK
      ?auto_624924 - BLOCK
      ?auto_624925 - BLOCK
      ?auto_624926 - BLOCK
      ?auto_624927 - BLOCK
    )
    :vars
    (
      ?auto_624928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624927 ?auto_624928 ) ( ON-TABLE ?auto_624913 ) ( ON ?auto_624914 ?auto_624913 ) ( ON ?auto_624915 ?auto_624914 ) ( ON ?auto_624916 ?auto_624915 ) ( ON ?auto_624917 ?auto_624916 ) ( ON ?auto_624918 ?auto_624917 ) ( ON ?auto_624919 ?auto_624918 ) ( ON ?auto_624920 ?auto_624919 ) ( not ( = ?auto_624913 ?auto_624914 ) ) ( not ( = ?auto_624913 ?auto_624915 ) ) ( not ( = ?auto_624913 ?auto_624916 ) ) ( not ( = ?auto_624913 ?auto_624917 ) ) ( not ( = ?auto_624913 ?auto_624918 ) ) ( not ( = ?auto_624913 ?auto_624919 ) ) ( not ( = ?auto_624913 ?auto_624920 ) ) ( not ( = ?auto_624913 ?auto_624921 ) ) ( not ( = ?auto_624913 ?auto_624922 ) ) ( not ( = ?auto_624913 ?auto_624923 ) ) ( not ( = ?auto_624913 ?auto_624924 ) ) ( not ( = ?auto_624913 ?auto_624925 ) ) ( not ( = ?auto_624913 ?auto_624926 ) ) ( not ( = ?auto_624913 ?auto_624927 ) ) ( not ( = ?auto_624913 ?auto_624928 ) ) ( not ( = ?auto_624914 ?auto_624915 ) ) ( not ( = ?auto_624914 ?auto_624916 ) ) ( not ( = ?auto_624914 ?auto_624917 ) ) ( not ( = ?auto_624914 ?auto_624918 ) ) ( not ( = ?auto_624914 ?auto_624919 ) ) ( not ( = ?auto_624914 ?auto_624920 ) ) ( not ( = ?auto_624914 ?auto_624921 ) ) ( not ( = ?auto_624914 ?auto_624922 ) ) ( not ( = ?auto_624914 ?auto_624923 ) ) ( not ( = ?auto_624914 ?auto_624924 ) ) ( not ( = ?auto_624914 ?auto_624925 ) ) ( not ( = ?auto_624914 ?auto_624926 ) ) ( not ( = ?auto_624914 ?auto_624927 ) ) ( not ( = ?auto_624914 ?auto_624928 ) ) ( not ( = ?auto_624915 ?auto_624916 ) ) ( not ( = ?auto_624915 ?auto_624917 ) ) ( not ( = ?auto_624915 ?auto_624918 ) ) ( not ( = ?auto_624915 ?auto_624919 ) ) ( not ( = ?auto_624915 ?auto_624920 ) ) ( not ( = ?auto_624915 ?auto_624921 ) ) ( not ( = ?auto_624915 ?auto_624922 ) ) ( not ( = ?auto_624915 ?auto_624923 ) ) ( not ( = ?auto_624915 ?auto_624924 ) ) ( not ( = ?auto_624915 ?auto_624925 ) ) ( not ( = ?auto_624915 ?auto_624926 ) ) ( not ( = ?auto_624915 ?auto_624927 ) ) ( not ( = ?auto_624915 ?auto_624928 ) ) ( not ( = ?auto_624916 ?auto_624917 ) ) ( not ( = ?auto_624916 ?auto_624918 ) ) ( not ( = ?auto_624916 ?auto_624919 ) ) ( not ( = ?auto_624916 ?auto_624920 ) ) ( not ( = ?auto_624916 ?auto_624921 ) ) ( not ( = ?auto_624916 ?auto_624922 ) ) ( not ( = ?auto_624916 ?auto_624923 ) ) ( not ( = ?auto_624916 ?auto_624924 ) ) ( not ( = ?auto_624916 ?auto_624925 ) ) ( not ( = ?auto_624916 ?auto_624926 ) ) ( not ( = ?auto_624916 ?auto_624927 ) ) ( not ( = ?auto_624916 ?auto_624928 ) ) ( not ( = ?auto_624917 ?auto_624918 ) ) ( not ( = ?auto_624917 ?auto_624919 ) ) ( not ( = ?auto_624917 ?auto_624920 ) ) ( not ( = ?auto_624917 ?auto_624921 ) ) ( not ( = ?auto_624917 ?auto_624922 ) ) ( not ( = ?auto_624917 ?auto_624923 ) ) ( not ( = ?auto_624917 ?auto_624924 ) ) ( not ( = ?auto_624917 ?auto_624925 ) ) ( not ( = ?auto_624917 ?auto_624926 ) ) ( not ( = ?auto_624917 ?auto_624927 ) ) ( not ( = ?auto_624917 ?auto_624928 ) ) ( not ( = ?auto_624918 ?auto_624919 ) ) ( not ( = ?auto_624918 ?auto_624920 ) ) ( not ( = ?auto_624918 ?auto_624921 ) ) ( not ( = ?auto_624918 ?auto_624922 ) ) ( not ( = ?auto_624918 ?auto_624923 ) ) ( not ( = ?auto_624918 ?auto_624924 ) ) ( not ( = ?auto_624918 ?auto_624925 ) ) ( not ( = ?auto_624918 ?auto_624926 ) ) ( not ( = ?auto_624918 ?auto_624927 ) ) ( not ( = ?auto_624918 ?auto_624928 ) ) ( not ( = ?auto_624919 ?auto_624920 ) ) ( not ( = ?auto_624919 ?auto_624921 ) ) ( not ( = ?auto_624919 ?auto_624922 ) ) ( not ( = ?auto_624919 ?auto_624923 ) ) ( not ( = ?auto_624919 ?auto_624924 ) ) ( not ( = ?auto_624919 ?auto_624925 ) ) ( not ( = ?auto_624919 ?auto_624926 ) ) ( not ( = ?auto_624919 ?auto_624927 ) ) ( not ( = ?auto_624919 ?auto_624928 ) ) ( not ( = ?auto_624920 ?auto_624921 ) ) ( not ( = ?auto_624920 ?auto_624922 ) ) ( not ( = ?auto_624920 ?auto_624923 ) ) ( not ( = ?auto_624920 ?auto_624924 ) ) ( not ( = ?auto_624920 ?auto_624925 ) ) ( not ( = ?auto_624920 ?auto_624926 ) ) ( not ( = ?auto_624920 ?auto_624927 ) ) ( not ( = ?auto_624920 ?auto_624928 ) ) ( not ( = ?auto_624921 ?auto_624922 ) ) ( not ( = ?auto_624921 ?auto_624923 ) ) ( not ( = ?auto_624921 ?auto_624924 ) ) ( not ( = ?auto_624921 ?auto_624925 ) ) ( not ( = ?auto_624921 ?auto_624926 ) ) ( not ( = ?auto_624921 ?auto_624927 ) ) ( not ( = ?auto_624921 ?auto_624928 ) ) ( not ( = ?auto_624922 ?auto_624923 ) ) ( not ( = ?auto_624922 ?auto_624924 ) ) ( not ( = ?auto_624922 ?auto_624925 ) ) ( not ( = ?auto_624922 ?auto_624926 ) ) ( not ( = ?auto_624922 ?auto_624927 ) ) ( not ( = ?auto_624922 ?auto_624928 ) ) ( not ( = ?auto_624923 ?auto_624924 ) ) ( not ( = ?auto_624923 ?auto_624925 ) ) ( not ( = ?auto_624923 ?auto_624926 ) ) ( not ( = ?auto_624923 ?auto_624927 ) ) ( not ( = ?auto_624923 ?auto_624928 ) ) ( not ( = ?auto_624924 ?auto_624925 ) ) ( not ( = ?auto_624924 ?auto_624926 ) ) ( not ( = ?auto_624924 ?auto_624927 ) ) ( not ( = ?auto_624924 ?auto_624928 ) ) ( not ( = ?auto_624925 ?auto_624926 ) ) ( not ( = ?auto_624925 ?auto_624927 ) ) ( not ( = ?auto_624925 ?auto_624928 ) ) ( not ( = ?auto_624926 ?auto_624927 ) ) ( not ( = ?auto_624926 ?auto_624928 ) ) ( not ( = ?auto_624927 ?auto_624928 ) ) ( ON ?auto_624926 ?auto_624927 ) ( ON ?auto_624925 ?auto_624926 ) ( ON ?auto_624924 ?auto_624925 ) ( ON ?auto_624923 ?auto_624924 ) ( ON ?auto_624922 ?auto_624923 ) ( CLEAR ?auto_624920 ) ( ON ?auto_624921 ?auto_624922 ) ( CLEAR ?auto_624921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_624913 ?auto_624914 ?auto_624915 ?auto_624916 ?auto_624917 ?auto_624918 ?auto_624919 ?auto_624920 ?auto_624921 )
      ( MAKE-15PILE ?auto_624913 ?auto_624914 ?auto_624915 ?auto_624916 ?auto_624917 ?auto_624918 ?auto_624919 ?auto_624920 ?auto_624921 ?auto_624922 ?auto_624923 ?auto_624924 ?auto_624925 ?auto_624926 ?auto_624927 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_624975 - BLOCK
      ?auto_624976 - BLOCK
      ?auto_624977 - BLOCK
      ?auto_624978 - BLOCK
      ?auto_624979 - BLOCK
      ?auto_624980 - BLOCK
      ?auto_624981 - BLOCK
      ?auto_624982 - BLOCK
      ?auto_624983 - BLOCK
      ?auto_624984 - BLOCK
      ?auto_624985 - BLOCK
      ?auto_624986 - BLOCK
      ?auto_624987 - BLOCK
      ?auto_624988 - BLOCK
      ?auto_624989 - BLOCK
    )
    :vars
    (
      ?auto_624990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_624989 ?auto_624990 ) ( ON-TABLE ?auto_624975 ) ( ON ?auto_624976 ?auto_624975 ) ( ON ?auto_624977 ?auto_624976 ) ( ON ?auto_624978 ?auto_624977 ) ( ON ?auto_624979 ?auto_624978 ) ( ON ?auto_624980 ?auto_624979 ) ( ON ?auto_624981 ?auto_624980 ) ( not ( = ?auto_624975 ?auto_624976 ) ) ( not ( = ?auto_624975 ?auto_624977 ) ) ( not ( = ?auto_624975 ?auto_624978 ) ) ( not ( = ?auto_624975 ?auto_624979 ) ) ( not ( = ?auto_624975 ?auto_624980 ) ) ( not ( = ?auto_624975 ?auto_624981 ) ) ( not ( = ?auto_624975 ?auto_624982 ) ) ( not ( = ?auto_624975 ?auto_624983 ) ) ( not ( = ?auto_624975 ?auto_624984 ) ) ( not ( = ?auto_624975 ?auto_624985 ) ) ( not ( = ?auto_624975 ?auto_624986 ) ) ( not ( = ?auto_624975 ?auto_624987 ) ) ( not ( = ?auto_624975 ?auto_624988 ) ) ( not ( = ?auto_624975 ?auto_624989 ) ) ( not ( = ?auto_624975 ?auto_624990 ) ) ( not ( = ?auto_624976 ?auto_624977 ) ) ( not ( = ?auto_624976 ?auto_624978 ) ) ( not ( = ?auto_624976 ?auto_624979 ) ) ( not ( = ?auto_624976 ?auto_624980 ) ) ( not ( = ?auto_624976 ?auto_624981 ) ) ( not ( = ?auto_624976 ?auto_624982 ) ) ( not ( = ?auto_624976 ?auto_624983 ) ) ( not ( = ?auto_624976 ?auto_624984 ) ) ( not ( = ?auto_624976 ?auto_624985 ) ) ( not ( = ?auto_624976 ?auto_624986 ) ) ( not ( = ?auto_624976 ?auto_624987 ) ) ( not ( = ?auto_624976 ?auto_624988 ) ) ( not ( = ?auto_624976 ?auto_624989 ) ) ( not ( = ?auto_624976 ?auto_624990 ) ) ( not ( = ?auto_624977 ?auto_624978 ) ) ( not ( = ?auto_624977 ?auto_624979 ) ) ( not ( = ?auto_624977 ?auto_624980 ) ) ( not ( = ?auto_624977 ?auto_624981 ) ) ( not ( = ?auto_624977 ?auto_624982 ) ) ( not ( = ?auto_624977 ?auto_624983 ) ) ( not ( = ?auto_624977 ?auto_624984 ) ) ( not ( = ?auto_624977 ?auto_624985 ) ) ( not ( = ?auto_624977 ?auto_624986 ) ) ( not ( = ?auto_624977 ?auto_624987 ) ) ( not ( = ?auto_624977 ?auto_624988 ) ) ( not ( = ?auto_624977 ?auto_624989 ) ) ( not ( = ?auto_624977 ?auto_624990 ) ) ( not ( = ?auto_624978 ?auto_624979 ) ) ( not ( = ?auto_624978 ?auto_624980 ) ) ( not ( = ?auto_624978 ?auto_624981 ) ) ( not ( = ?auto_624978 ?auto_624982 ) ) ( not ( = ?auto_624978 ?auto_624983 ) ) ( not ( = ?auto_624978 ?auto_624984 ) ) ( not ( = ?auto_624978 ?auto_624985 ) ) ( not ( = ?auto_624978 ?auto_624986 ) ) ( not ( = ?auto_624978 ?auto_624987 ) ) ( not ( = ?auto_624978 ?auto_624988 ) ) ( not ( = ?auto_624978 ?auto_624989 ) ) ( not ( = ?auto_624978 ?auto_624990 ) ) ( not ( = ?auto_624979 ?auto_624980 ) ) ( not ( = ?auto_624979 ?auto_624981 ) ) ( not ( = ?auto_624979 ?auto_624982 ) ) ( not ( = ?auto_624979 ?auto_624983 ) ) ( not ( = ?auto_624979 ?auto_624984 ) ) ( not ( = ?auto_624979 ?auto_624985 ) ) ( not ( = ?auto_624979 ?auto_624986 ) ) ( not ( = ?auto_624979 ?auto_624987 ) ) ( not ( = ?auto_624979 ?auto_624988 ) ) ( not ( = ?auto_624979 ?auto_624989 ) ) ( not ( = ?auto_624979 ?auto_624990 ) ) ( not ( = ?auto_624980 ?auto_624981 ) ) ( not ( = ?auto_624980 ?auto_624982 ) ) ( not ( = ?auto_624980 ?auto_624983 ) ) ( not ( = ?auto_624980 ?auto_624984 ) ) ( not ( = ?auto_624980 ?auto_624985 ) ) ( not ( = ?auto_624980 ?auto_624986 ) ) ( not ( = ?auto_624980 ?auto_624987 ) ) ( not ( = ?auto_624980 ?auto_624988 ) ) ( not ( = ?auto_624980 ?auto_624989 ) ) ( not ( = ?auto_624980 ?auto_624990 ) ) ( not ( = ?auto_624981 ?auto_624982 ) ) ( not ( = ?auto_624981 ?auto_624983 ) ) ( not ( = ?auto_624981 ?auto_624984 ) ) ( not ( = ?auto_624981 ?auto_624985 ) ) ( not ( = ?auto_624981 ?auto_624986 ) ) ( not ( = ?auto_624981 ?auto_624987 ) ) ( not ( = ?auto_624981 ?auto_624988 ) ) ( not ( = ?auto_624981 ?auto_624989 ) ) ( not ( = ?auto_624981 ?auto_624990 ) ) ( not ( = ?auto_624982 ?auto_624983 ) ) ( not ( = ?auto_624982 ?auto_624984 ) ) ( not ( = ?auto_624982 ?auto_624985 ) ) ( not ( = ?auto_624982 ?auto_624986 ) ) ( not ( = ?auto_624982 ?auto_624987 ) ) ( not ( = ?auto_624982 ?auto_624988 ) ) ( not ( = ?auto_624982 ?auto_624989 ) ) ( not ( = ?auto_624982 ?auto_624990 ) ) ( not ( = ?auto_624983 ?auto_624984 ) ) ( not ( = ?auto_624983 ?auto_624985 ) ) ( not ( = ?auto_624983 ?auto_624986 ) ) ( not ( = ?auto_624983 ?auto_624987 ) ) ( not ( = ?auto_624983 ?auto_624988 ) ) ( not ( = ?auto_624983 ?auto_624989 ) ) ( not ( = ?auto_624983 ?auto_624990 ) ) ( not ( = ?auto_624984 ?auto_624985 ) ) ( not ( = ?auto_624984 ?auto_624986 ) ) ( not ( = ?auto_624984 ?auto_624987 ) ) ( not ( = ?auto_624984 ?auto_624988 ) ) ( not ( = ?auto_624984 ?auto_624989 ) ) ( not ( = ?auto_624984 ?auto_624990 ) ) ( not ( = ?auto_624985 ?auto_624986 ) ) ( not ( = ?auto_624985 ?auto_624987 ) ) ( not ( = ?auto_624985 ?auto_624988 ) ) ( not ( = ?auto_624985 ?auto_624989 ) ) ( not ( = ?auto_624985 ?auto_624990 ) ) ( not ( = ?auto_624986 ?auto_624987 ) ) ( not ( = ?auto_624986 ?auto_624988 ) ) ( not ( = ?auto_624986 ?auto_624989 ) ) ( not ( = ?auto_624986 ?auto_624990 ) ) ( not ( = ?auto_624987 ?auto_624988 ) ) ( not ( = ?auto_624987 ?auto_624989 ) ) ( not ( = ?auto_624987 ?auto_624990 ) ) ( not ( = ?auto_624988 ?auto_624989 ) ) ( not ( = ?auto_624988 ?auto_624990 ) ) ( not ( = ?auto_624989 ?auto_624990 ) ) ( ON ?auto_624988 ?auto_624989 ) ( ON ?auto_624987 ?auto_624988 ) ( ON ?auto_624986 ?auto_624987 ) ( ON ?auto_624985 ?auto_624986 ) ( ON ?auto_624984 ?auto_624985 ) ( ON ?auto_624983 ?auto_624984 ) ( CLEAR ?auto_624981 ) ( ON ?auto_624982 ?auto_624983 ) ( CLEAR ?auto_624982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_624975 ?auto_624976 ?auto_624977 ?auto_624978 ?auto_624979 ?auto_624980 ?auto_624981 ?auto_624982 )
      ( MAKE-15PILE ?auto_624975 ?auto_624976 ?auto_624977 ?auto_624978 ?auto_624979 ?auto_624980 ?auto_624981 ?auto_624982 ?auto_624983 ?auto_624984 ?auto_624985 ?auto_624986 ?auto_624987 ?auto_624988 ?auto_624989 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_625037 - BLOCK
      ?auto_625038 - BLOCK
      ?auto_625039 - BLOCK
      ?auto_625040 - BLOCK
      ?auto_625041 - BLOCK
      ?auto_625042 - BLOCK
      ?auto_625043 - BLOCK
      ?auto_625044 - BLOCK
      ?auto_625045 - BLOCK
      ?auto_625046 - BLOCK
      ?auto_625047 - BLOCK
      ?auto_625048 - BLOCK
      ?auto_625049 - BLOCK
      ?auto_625050 - BLOCK
      ?auto_625051 - BLOCK
    )
    :vars
    (
      ?auto_625052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625051 ?auto_625052 ) ( ON-TABLE ?auto_625037 ) ( ON ?auto_625038 ?auto_625037 ) ( ON ?auto_625039 ?auto_625038 ) ( ON ?auto_625040 ?auto_625039 ) ( ON ?auto_625041 ?auto_625040 ) ( ON ?auto_625042 ?auto_625041 ) ( not ( = ?auto_625037 ?auto_625038 ) ) ( not ( = ?auto_625037 ?auto_625039 ) ) ( not ( = ?auto_625037 ?auto_625040 ) ) ( not ( = ?auto_625037 ?auto_625041 ) ) ( not ( = ?auto_625037 ?auto_625042 ) ) ( not ( = ?auto_625037 ?auto_625043 ) ) ( not ( = ?auto_625037 ?auto_625044 ) ) ( not ( = ?auto_625037 ?auto_625045 ) ) ( not ( = ?auto_625037 ?auto_625046 ) ) ( not ( = ?auto_625037 ?auto_625047 ) ) ( not ( = ?auto_625037 ?auto_625048 ) ) ( not ( = ?auto_625037 ?auto_625049 ) ) ( not ( = ?auto_625037 ?auto_625050 ) ) ( not ( = ?auto_625037 ?auto_625051 ) ) ( not ( = ?auto_625037 ?auto_625052 ) ) ( not ( = ?auto_625038 ?auto_625039 ) ) ( not ( = ?auto_625038 ?auto_625040 ) ) ( not ( = ?auto_625038 ?auto_625041 ) ) ( not ( = ?auto_625038 ?auto_625042 ) ) ( not ( = ?auto_625038 ?auto_625043 ) ) ( not ( = ?auto_625038 ?auto_625044 ) ) ( not ( = ?auto_625038 ?auto_625045 ) ) ( not ( = ?auto_625038 ?auto_625046 ) ) ( not ( = ?auto_625038 ?auto_625047 ) ) ( not ( = ?auto_625038 ?auto_625048 ) ) ( not ( = ?auto_625038 ?auto_625049 ) ) ( not ( = ?auto_625038 ?auto_625050 ) ) ( not ( = ?auto_625038 ?auto_625051 ) ) ( not ( = ?auto_625038 ?auto_625052 ) ) ( not ( = ?auto_625039 ?auto_625040 ) ) ( not ( = ?auto_625039 ?auto_625041 ) ) ( not ( = ?auto_625039 ?auto_625042 ) ) ( not ( = ?auto_625039 ?auto_625043 ) ) ( not ( = ?auto_625039 ?auto_625044 ) ) ( not ( = ?auto_625039 ?auto_625045 ) ) ( not ( = ?auto_625039 ?auto_625046 ) ) ( not ( = ?auto_625039 ?auto_625047 ) ) ( not ( = ?auto_625039 ?auto_625048 ) ) ( not ( = ?auto_625039 ?auto_625049 ) ) ( not ( = ?auto_625039 ?auto_625050 ) ) ( not ( = ?auto_625039 ?auto_625051 ) ) ( not ( = ?auto_625039 ?auto_625052 ) ) ( not ( = ?auto_625040 ?auto_625041 ) ) ( not ( = ?auto_625040 ?auto_625042 ) ) ( not ( = ?auto_625040 ?auto_625043 ) ) ( not ( = ?auto_625040 ?auto_625044 ) ) ( not ( = ?auto_625040 ?auto_625045 ) ) ( not ( = ?auto_625040 ?auto_625046 ) ) ( not ( = ?auto_625040 ?auto_625047 ) ) ( not ( = ?auto_625040 ?auto_625048 ) ) ( not ( = ?auto_625040 ?auto_625049 ) ) ( not ( = ?auto_625040 ?auto_625050 ) ) ( not ( = ?auto_625040 ?auto_625051 ) ) ( not ( = ?auto_625040 ?auto_625052 ) ) ( not ( = ?auto_625041 ?auto_625042 ) ) ( not ( = ?auto_625041 ?auto_625043 ) ) ( not ( = ?auto_625041 ?auto_625044 ) ) ( not ( = ?auto_625041 ?auto_625045 ) ) ( not ( = ?auto_625041 ?auto_625046 ) ) ( not ( = ?auto_625041 ?auto_625047 ) ) ( not ( = ?auto_625041 ?auto_625048 ) ) ( not ( = ?auto_625041 ?auto_625049 ) ) ( not ( = ?auto_625041 ?auto_625050 ) ) ( not ( = ?auto_625041 ?auto_625051 ) ) ( not ( = ?auto_625041 ?auto_625052 ) ) ( not ( = ?auto_625042 ?auto_625043 ) ) ( not ( = ?auto_625042 ?auto_625044 ) ) ( not ( = ?auto_625042 ?auto_625045 ) ) ( not ( = ?auto_625042 ?auto_625046 ) ) ( not ( = ?auto_625042 ?auto_625047 ) ) ( not ( = ?auto_625042 ?auto_625048 ) ) ( not ( = ?auto_625042 ?auto_625049 ) ) ( not ( = ?auto_625042 ?auto_625050 ) ) ( not ( = ?auto_625042 ?auto_625051 ) ) ( not ( = ?auto_625042 ?auto_625052 ) ) ( not ( = ?auto_625043 ?auto_625044 ) ) ( not ( = ?auto_625043 ?auto_625045 ) ) ( not ( = ?auto_625043 ?auto_625046 ) ) ( not ( = ?auto_625043 ?auto_625047 ) ) ( not ( = ?auto_625043 ?auto_625048 ) ) ( not ( = ?auto_625043 ?auto_625049 ) ) ( not ( = ?auto_625043 ?auto_625050 ) ) ( not ( = ?auto_625043 ?auto_625051 ) ) ( not ( = ?auto_625043 ?auto_625052 ) ) ( not ( = ?auto_625044 ?auto_625045 ) ) ( not ( = ?auto_625044 ?auto_625046 ) ) ( not ( = ?auto_625044 ?auto_625047 ) ) ( not ( = ?auto_625044 ?auto_625048 ) ) ( not ( = ?auto_625044 ?auto_625049 ) ) ( not ( = ?auto_625044 ?auto_625050 ) ) ( not ( = ?auto_625044 ?auto_625051 ) ) ( not ( = ?auto_625044 ?auto_625052 ) ) ( not ( = ?auto_625045 ?auto_625046 ) ) ( not ( = ?auto_625045 ?auto_625047 ) ) ( not ( = ?auto_625045 ?auto_625048 ) ) ( not ( = ?auto_625045 ?auto_625049 ) ) ( not ( = ?auto_625045 ?auto_625050 ) ) ( not ( = ?auto_625045 ?auto_625051 ) ) ( not ( = ?auto_625045 ?auto_625052 ) ) ( not ( = ?auto_625046 ?auto_625047 ) ) ( not ( = ?auto_625046 ?auto_625048 ) ) ( not ( = ?auto_625046 ?auto_625049 ) ) ( not ( = ?auto_625046 ?auto_625050 ) ) ( not ( = ?auto_625046 ?auto_625051 ) ) ( not ( = ?auto_625046 ?auto_625052 ) ) ( not ( = ?auto_625047 ?auto_625048 ) ) ( not ( = ?auto_625047 ?auto_625049 ) ) ( not ( = ?auto_625047 ?auto_625050 ) ) ( not ( = ?auto_625047 ?auto_625051 ) ) ( not ( = ?auto_625047 ?auto_625052 ) ) ( not ( = ?auto_625048 ?auto_625049 ) ) ( not ( = ?auto_625048 ?auto_625050 ) ) ( not ( = ?auto_625048 ?auto_625051 ) ) ( not ( = ?auto_625048 ?auto_625052 ) ) ( not ( = ?auto_625049 ?auto_625050 ) ) ( not ( = ?auto_625049 ?auto_625051 ) ) ( not ( = ?auto_625049 ?auto_625052 ) ) ( not ( = ?auto_625050 ?auto_625051 ) ) ( not ( = ?auto_625050 ?auto_625052 ) ) ( not ( = ?auto_625051 ?auto_625052 ) ) ( ON ?auto_625050 ?auto_625051 ) ( ON ?auto_625049 ?auto_625050 ) ( ON ?auto_625048 ?auto_625049 ) ( ON ?auto_625047 ?auto_625048 ) ( ON ?auto_625046 ?auto_625047 ) ( ON ?auto_625045 ?auto_625046 ) ( ON ?auto_625044 ?auto_625045 ) ( CLEAR ?auto_625042 ) ( ON ?auto_625043 ?auto_625044 ) ( CLEAR ?auto_625043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_625037 ?auto_625038 ?auto_625039 ?auto_625040 ?auto_625041 ?auto_625042 ?auto_625043 )
      ( MAKE-15PILE ?auto_625037 ?auto_625038 ?auto_625039 ?auto_625040 ?auto_625041 ?auto_625042 ?auto_625043 ?auto_625044 ?auto_625045 ?auto_625046 ?auto_625047 ?auto_625048 ?auto_625049 ?auto_625050 ?auto_625051 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_625099 - BLOCK
      ?auto_625100 - BLOCK
      ?auto_625101 - BLOCK
      ?auto_625102 - BLOCK
      ?auto_625103 - BLOCK
      ?auto_625104 - BLOCK
      ?auto_625105 - BLOCK
      ?auto_625106 - BLOCK
      ?auto_625107 - BLOCK
      ?auto_625108 - BLOCK
      ?auto_625109 - BLOCK
      ?auto_625110 - BLOCK
      ?auto_625111 - BLOCK
      ?auto_625112 - BLOCK
      ?auto_625113 - BLOCK
    )
    :vars
    (
      ?auto_625114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625113 ?auto_625114 ) ( ON-TABLE ?auto_625099 ) ( ON ?auto_625100 ?auto_625099 ) ( ON ?auto_625101 ?auto_625100 ) ( ON ?auto_625102 ?auto_625101 ) ( ON ?auto_625103 ?auto_625102 ) ( not ( = ?auto_625099 ?auto_625100 ) ) ( not ( = ?auto_625099 ?auto_625101 ) ) ( not ( = ?auto_625099 ?auto_625102 ) ) ( not ( = ?auto_625099 ?auto_625103 ) ) ( not ( = ?auto_625099 ?auto_625104 ) ) ( not ( = ?auto_625099 ?auto_625105 ) ) ( not ( = ?auto_625099 ?auto_625106 ) ) ( not ( = ?auto_625099 ?auto_625107 ) ) ( not ( = ?auto_625099 ?auto_625108 ) ) ( not ( = ?auto_625099 ?auto_625109 ) ) ( not ( = ?auto_625099 ?auto_625110 ) ) ( not ( = ?auto_625099 ?auto_625111 ) ) ( not ( = ?auto_625099 ?auto_625112 ) ) ( not ( = ?auto_625099 ?auto_625113 ) ) ( not ( = ?auto_625099 ?auto_625114 ) ) ( not ( = ?auto_625100 ?auto_625101 ) ) ( not ( = ?auto_625100 ?auto_625102 ) ) ( not ( = ?auto_625100 ?auto_625103 ) ) ( not ( = ?auto_625100 ?auto_625104 ) ) ( not ( = ?auto_625100 ?auto_625105 ) ) ( not ( = ?auto_625100 ?auto_625106 ) ) ( not ( = ?auto_625100 ?auto_625107 ) ) ( not ( = ?auto_625100 ?auto_625108 ) ) ( not ( = ?auto_625100 ?auto_625109 ) ) ( not ( = ?auto_625100 ?auto_625110 ) ) ( not ( = ?auto_625100 ?auto_625111 ) ) ( not ( = ?auto_625100 ?auto_625112 ) ) ( not ( = ?auto_625100 ?auto_625113 ) ) ( not ( = ?auto_625100 ?auto_625114 ) ) ( not ( = ?auto_625101 ?auto_625102 ) ) ( not ( = ?auto_625101 ?auto_625103 ) ) ( not ( = ?auto_625101 ?auto_625104 ) ) ( not ( = ?auto_625101 ?auto_625105 ) ) ( not ( = ?auto_625101 ?auto_625106 ) ) ( not ( = ?auto_625101 ?auto_625107 ) ) ( not ( = ?auto_625101 ?auto_625108 ) ) ( not ( = ?auto_625101 ?auto_625109 ) ) ( not ( = ?auto_625101 ?auto_625110 ) ) ( not ( = ?auto_625101 ?auto_625111 ) ) ( not ( = ?auto_625101 ?auto_625112 ) ) ( not ( = ?auto_625101 ?auto_625113 ) ) ( not ( = ?auto_625101 ?auto_625114 ) ) ( not ( = ?auto_625102 ?auto_625103 ) ) ( not ( = ?auto_625102 ?auto_625104 ) ) ( not ( = ?auto_625102 ?auto_625105 ) ) ( not ( = ?auto_625102 ?auto_625106 ) ) ( not ( = ?auto_625102 ?auto_625107 ) ) ( not ( = ?auto_625102 ?auto_625108 ) ) ( not ( = ?auto_625102 ?auto_625109 ) ) ( not ( = ?auto_625102 ?auto_625110 ) ) ( not ( = ?auto_625102 ?auto_625111 ) ) ( not ( = ?auto_625102 ?auto_625112 ) ) ( not ( = ?auto_625102 ?auto_625113 ) ) ( not ( = ?auto_625102 ?auto_625114 ) ) ( not ( = ?auto_625103 ?auto_625104 ) ) ( not ( = ?auto_625103 ?auto_625105 ) ) ( not ( = ?auto_625103 ?auto_625106 ) ) ( not ( = ?auto_625103 ?auto_625107 ) ) ( not ( = ?auto_625103 ?auto_625108 ) ) ( not ( = ?auto_625103 ?auto_625109 ) ) ( not ( = ?auto_625103 ?auto_625110 ) ) ( not ( = ?auto_625103 ?auto_625111 ) ) ( not ( = ?auto_625103 ?auto_625112 ) ) ( not ( = ?auto_625103 ?auto_625113 ) ) ( not ( = ?auto_625103 ?auto_625114 ) ) ( not ( = ?auto_625104 ?auto_625105 ) ) ( not ( = ?auto_625104 ?auto_625106 ) ) ( not ( = ?auto_625104 ?auto_625107 ) ) ( not ( = ?auto_625104 ?auto_625108 ) ) ( not ( = ?auto_625104 ?auto_625109 ) ) ( not ( = ?auto_625104 ?auto_625110 ) ) ( not ( = ?auto_625104 ?auto_625111 ) ) ( not ( = ?auto_625104 ?auto_625112 ) ) ( not ( = ?auto_625104 ?auto_625113 ) ) ( not ( = ?auto_625104 ?auto_625114 ) ) ( not ( = ?auto_625105 ?auto_625106 ) ) ( not ( = ?auto_625105 ?auto_625107 ) ) ( not ( = ?auto_625105 ?auto_625108 ) ) ( not ( = ?auto_625105 ?auto_625109 ) ) ( not ( = ?auto_625105 ?auto_625110 ) ) ( not ( = ?auto_625105 ?auto_625111 ) ) ( not ( = ?auto_625105 ?auto_625112 ) ) ( not ( = ?auto_625105 ?auto_625113 ) ) ( not ( = ?auto_625105 ?auto_625114 ) ) ( not ( = ?auto_625106 ?auto_625107 ) ) ( not ( = ?auto_625106 ?auto_625108 ) ) ( not ( = ?auto_625106 ?auto_625109 ) ) ( not ( = ?auto_625106 ?auto_625110 ) ) ( not ( = ?auto_625106 ?auto_625111 ) ) ( not ( = ?auto_625106 ?auto_625112 ) ) ( not ( = ?auto_625106 ?auto_625113 ) ) ( not ( = ?auto_625106 ?auto_625114 ) ) ( not ( = ?auto_625107 ?auto_625108 ) ) ( not ( = ?auto_625107 ?auto_625109 ) ) ( not ( = ?auto_625107 ?auto_625110 ) ) ( not ( = ?auto_625107 ?auto_625111 ) ) ( not ( = ?auto_625107 ?auto_625112 ) ) ( not ( = ?auto_625107 ?auto_625113 ) ) ( not ( = ?auto_625107 ?auto_625114 ) ) ( not ( = ?auto_625108 ?auto_625109 ) ) ( not ( = ?auto_625108 ?auto_625110 ) ) ( not ( = ?auto_625108 ?auto_625111 ) ) ( not ( = ?auto_625108 ?auto_625112 ) ) ( not ( = ?auto_625108 ?auto_625113 ) ) ( not ( = ?auto_625108 ?auto_625114 ) ) ( not ( = ?auto_625109 ?auto_625110 ) ) ( not ( = ?auto_625109 ?auto_625111 ) ) ( not ( = ?auto_625109 ?auto_625112 ) ) ( not ( = ?auto_625109 ?auto_625113 ) ) ( not ( = ?auto_625109 ?auto_625114 ) ) ( not ( = ?auto_625110 ?auto_625111 ) ) ( not ( = ?auto_625110 ?auto_625112 ) ) ( not ( = ?auto_625110 ?auto_625113 ) ) ( not ( = ?auto_625110 ?auto_625114 ) ) ( not ( = ?auto_625111 ?auto_625112 ) ) ( not ( = ?auto_625111 ?auto_625113 ) ) ( not ( = ?auto_625111 ?auto_625114 ) ) ( not ( = ?auto_625112 ?auto_625113 ) ) ( not ( = ?auto_625112 ?auto_625114 ) ) ( not ( = ?auto_625113 ?auto_625114 ) ) ( ON ?auto_625112 ?auto_625113 ) ( ON ?auto_625111 ?auto_625112 ) ( ON ?auto_625110 ?auto_625111 ) ( ON ?auto_625109 ?auto_625110 ) ( ON ?auto_625108 ?auto_625109 ) ( ON ?auto_625107 ?auto_625108 ) ( ON ?auto_625106 ?auto_625107 ) ( ON ?auto_625105 ?auto_625106 ) ( CLEAR ?auto_625103 ) ( ON ?auto_625104 ?auto_625105 ) ( CLEAR ?auto_625104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_625099 ?auto_625100 ?auto_625101 ?auto_625102 ?auto_625103 ?auto_625104 )
      ( MAKE-15PILE ?auto_625099 ?auto_625100 ?auto_625101 ?auto_625102 ?auto_625103 ?auto_625104 ?auto_625105 ?auto_625106 ?auto_625107 ?auto_625108 ?auto_625109 ?auto_625110 ?auto_625111 ?auto_625112 ?auto_625113 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_625161 - BLOCK
      ?auto_625162 - BLOCK
      ?auto_625163 - BLOCK
      ?auto_625164 - BLOCK
      ?auto_625165 - BLOCK
      ?auto_625166 - BLOCK
      ?auto_625167 - BLOCK
      ?auto_625168 - BLOCK
      ?auto_625169 - BLOCK
      ?auto_625170 - BLOCK
      ?auto_625171 - BLOCK
      ?auto_625172 - BLOCK
      ?auto_625173 - BLOCK
      ?auto_625174 - BLOCK
      ?auto_625175 - BLOCK
    )
    :vars
    (
      ?auto_625176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625175 ?auto_625176 ) ( ON-TABLE ?auto_625161 ) ( ON ?auto_625162 ?auto_625161 ) ( ON ?auto_625163 ?auto_625162 ) ( ON ?auto_625164 ?auto_625163 ) ( not ( = ?auto_625161 ?auto_625162 ) ) ( not ( = ?auto_625161 ?auto_625163 ) ) ( not ( = ?auto_625161 ?auto_625164 ) ) ( not ( = ?auto_625161 ?auto_625165 ) ) ( not ( = ?auto_625161 ?auto_625166 ) ) ( not ( = ?auto_625161 ?auto_625167 ) ) ( not ( = ?auto_625161 ?auto_625168 ) ) ( not ( = ?auto_625161 ?auto_625169 ) ) ( not ( = ?auto_625161 ?auto_625170 ) ) ( not ( = ?auto_625161 ?auto_625171 ) ) ( not ( = ?auto_625161 ?auto_625172 ) ) ( not ( = ?auto_625161 ?auto_625173 ) ) ( not ( = ?auto_625161 ?auto_625174 ) ) ( not ( = ?auto_625161 ?auto_625175 ) ) ( not ( = ?auto_625161 ?auto_625176 ) ) ( not ( = ?auto_625162 ?auto_625163 ) ) ( not ( = ?auto_625162 ?auto_625164 ) ) ( not ( = ?auto_625162 ?auto_625165 ) ) ( not ( = ?auto_625162 ?auto_625166 ) ) ( not ( = ?auto_625162 ?auto_625167 ) ) ( not ( = ?auto_625162 ?auto_625168 ) ) ( not ( = ?auto_625162 ?auto_625169 ) ) ( not ( = ?auto_625162 ?auto_625170 ) ) ( not ( = ?auto_625162 ?auto_625171 ) ) ( not ( = ?auto_625162 ?auto_625172 ) ) ( not ( = ?auto_625162 ?auto_625173 ) ) ( not ( = ?auto_625162 ?auto_625174 ) ) ( not ( = ?auto_625162 ?auto_625175 ) ) ( not ( = ?auto_625162 ?auto_625176 ) ) ( not ( = ?auto_625163 ?auto_625164 ) ) ( not ( = ?auto_625163 ?auto_625165 ) ) ( not ( = ?auto_625163 ?auto_625166 ) ) ( not ( = ?auto_625163 ?auto_625167 ) ) ( not ( = ?auto_625163 ?auto_625168 ) ) ( not ( = ?auto_625163 ?auto_625169 ) ) ( not ( = ?auto_625163 ?auto_625170 ) ) ( not ( = ?auto_625163 ?auto_625171 ) ) ( not ( = ?auto_625163 ?auto_625172 ) ) ( not ( = ?auto_625163 ?auto_625173 ) ) ( not ( = ?auto_625163 ?auto_625174 ) ) ( not ( = ?auto_625163 ?auto_625175 ) ) ( not ( = ?auto_625163 ?auto_625176 ) ) ( not ( = ?auto_625164 ?auto_625165 ) ) ( not ( = ?auto_625164 ?auto_625166 ) ) ( not ( = ?auto_625164 ?auto_625167 ) ) ( not ( = ?auto_625164 ?auto_625168 ) ) ( not ( = ?auto_625164 ?auto_625169 ) ) ( not ( = ?auto_625164 ?auto_625170 ) ) ( not ( = ?auto_625164 ?auto_625171 ) ) ( not ( = ?auto_625164 ?auto_625172 ) ) ( not ( = ?auto_625164 ?auto_625173 ) ) ( not ( = ?auto_625164 ?auto_625174 ) ) ( not ( = ?auto_625164 ?auto_625175 ) ) ( not ( = ?auto_625164 ?auto_625176 ) ) ( not ( = ?auto_625165 ?auto_625166 ) ) ( not ( = ?auto_625165 ?auto_625167 ) ) ( not ( = ?auto_625165 ?auto_625168 ) ) ( not ( = ?auto_625165 ?auto_625169 ) ) ( not ( = ?auto_625165 ?auto_625170 ) ) ( not ( = ?auto_625165 ?auto_625171 ) ) ( not ( = ?auto_625165 ?auto_625172 ) ) ( not ( = ?auto_625165 ?auto_625173 ) ) ( not ( = ?auto_625165 ?auto_625174 ) ) ( not ( = ?auto_625165 ?auto_625175 ) ) ( not ( = ?auto_625165 ?auto_625176 ) ) ( not ( = ?auto_625166 ?auto_625167 ) ) ( not ( = ?auto_625166 ?auto_625168 ) ) ( not ( = ?auto_625166 ?auto_625169 ) ) ( not ( = ?auto_625166 ?auto_625170 ) ) ( not ( = ?auto_625166 ?auto_625171 ) ) ( not ( = ?auto_625166 ?auto_625172 ) ) ( not ( = ?auto_625166 ?auto_625173 ) ) ( not ( = ?auto_625166 ?auto_625174 ) ) ( not ( = ?auto_625166 ?auto_625175 ) ) ( not ( = ?auto_625166 ?auto_625176 ) ) ( not ( = ?auto_625167 ?auto_625168 ) ) ( not ( = ?auto_625167 ?auto_625169 ) ) ( not ( = ?auto_625167 ?auto_625170 ) ) ( not ( = ?auto_625167 ?auto_625171 ) ) ( not ( = ?auto_625167 ?auto_625172 ) ) ( not ( = ?auto_625167 ?auto_625173 ) ) ( not ( = ?auto_625167 ?auto_625174 ) ) ( not ( = ?auto_625167 ?auto_625175 ) ) ( not ( = ?auto_625167 ?auto_625176 ) ) ( not ( = ?auto_625168 ?auto_625169 ) ) ( not ( = ?auto_625168 ?auto_625170 ) ) ( not ( = ?auto_625168 ?auto_625171 ) ) ( not ( = ?auto_625168 ?auto_625172 ) ) ( not ( = ?auto_625168 ?auto_625173 ) ) ( not ( = ?auto_625168 ?auto_625174 ) ) ( not ( = ?auto_625168 ?auto_625175 ) ) ( not ( = ?auto_625168 ?auto_625176 ) ) ( not ( = ?auto_625169 ?auto_625170 ) ) ( not ( = ?auto_625169 ?auto_625171 ) ) ( not ( = ?auto_625169 ?auto_625172 ) ) ( not ( = ?auto_625169 ?auto_625173 ) ) ( not ( = ?auto_625169 ?auto_625174 ) ) ( not ( = ?auto_625169 ?auto_625175 ) ) ( not ( = ?auto_625169 ?auto_625176 ) ) ( not ( = ?auto_625170 ?auto_625171 ) ) ( not ( = ?auto_625170 ?auto_625172 ) ) ( not ( = ?auto_625170 ?auto_625173 ) ) ( not ( = ?auto_625170 ?auto_625174 ) ) ( not ( = ?auto_625170 ?auto_625175 ) ) ( not ( = ?auto_625170 ?auto_625176 ) ) ( not ( = ?auto_625171 ?auto_625172 ) ) ( not ( = ?auto_625171 ?auto_625173 ) ) ( not ( = ?auto_625171 ?auto_625174 ) ) ( not ( = ?auto_625171 ?auto_625175 ) ) ( not ( = ?auto_625171 ?auto_625176 ) ) ( not ( = ?auto_625172 ?auto_625173 ) ) ( not ( = ?auto_625172 ?auto_625174 ) ) ( not ( = ?auto_625172 ?auto_625175 ) ) ( not ( = ?auto_625172 ?auto_625176 ) ) ( not ( = ?auto_625173 ?auto_625174 ) ) ( not ( = ?auto_625173 ?auto_625175 ) ) ( not ( = ?auto_625173 ?auto_625176 ) ) ( not ( = ?auto_625174 ?auto_625175 ) ) ( not ( = ?auto_625174 ?auto_625176 ) ) ( not ( = ?auto_625175 ?auto_625176 ) ) ( ON ?auto_625174 ?auto_625175 ) ( ON ?auto_625173 ?auto_625174 ) ( ON ?auto_625172 ?auto_625173 ) ( ON ?auto_625171 ?auto_625172 ) ( ON ?auto_625170 ?auto_625171 ) ( ON ?auto_625169 ?auto_625170 ) ( ON ?auto_625168 ?auto_625169 ) ( ON ?auto_625167 ?auto_625168 ) ( ON ?auto_625166 ?auto_625167 ) ( CLEAR ?auto_625164 ) ( ON ?auto_625165 ?auto_625166 ) ( CLEAR ?auto_625165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_625161 ?auto_625162 ?auto_625163 ?auto_625164 ?auto_625165 )
      ( MAKE-15PILE ?auto_625161 ?auto_625162 ?auto_625163 ?auto_625164 ?auto_625165 ?auto_625166 ?auto_625167 ?auto_625168 ?auto_625169 ?auto_625170 ?auto_625171 ?auto_625172 ?auto_625173 ?auto_625174 ?auto_625175 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_625223 - BLOCK
      ?auto_625224 - BLOCK
      ?auto_625225 - BLOCK
      ?auto_625226 - BLOCK
      ?auto_625227 - BLOCK
      ?auto_625228 - BLOCK
      ?auto_625229 - BLOCK
      ?auto_625230 - BLOCK
      ?auto_625231 - BLOCK
      ?auto_625232 - BLOCK
      ?auto_625233 - BLOCK
      ?auto_625234 - BLOCK
      ?auto_625235 - BLOCK
      ?auto_625236 - BLOCK
      ?auto_625237 - BLOCK
    )
    :vars
    (
      ?auto_625238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625237 ?auto_625238 ) ( ON-TABLE ?auto_625223 ) ( ON ?auto_625224 ?auto_625223 ) ( ON ?auto_625225 ?auto_625224 ) ( not ( = ?auto_625223 ?auto_625224 ) ) ( not ( = ?auto_625223 ?auto_625225 ) ) ( not ( = ?auto_625223 ?auto_625226 ) ) ( not ( = ?auto_625223 ?auto_625227 ) ) ( not ( = ?auto_625223 ?auto_625228 ) ) ( not ( = ?auto_625223 ?auto_625229 ) ) ( not ( = ?auto_625223 ?auto_625230 ) ) ( not ( = ?auto_625223 ?auto_625231 ) ) ( not ( = ?auto_625223 ?auto_625232 ) ) ( not ( = ?auto_625223 ?auto_625233 ) ) ( not ( = ?auto_625223 ?auto_625234 ) ) ( not ( = ?auto_625223 ?auto_625235 ) ) ( not ( = ?auto_625223 ?auto_625236 ) ) ( not ( = ?auto_625223 ?auto_625237 ) ) ( not ( = ?auto_625223 ?auto_625238 ) ) ( not ( = ?auto_625224 ?auto_625225 ) ) ( not ( = ?auto_625224 ?auto_625226 ) ) ( not ( = ?auto_625224 ?auto_625227 ) ) ( not ( = ?auto_625224 ?auto_625228 ) ) ( not ( = ?auto_625224 ?auto_625229 ) ) ( not ( = ?auto_625224 ?auto_625230 ) ) ( not ( = ?auto_625224 ?auto_625231 ) ) ( not ( = ?auto_625224 ?auto_625232 ) ) ( not ( = ?auto_625224 ?auto_625233 ) ) ( not ( = ?auto_625224 ?auto_625234 ) ) ( not ( = ?auto_625224 ?auto_625235 ) ) ( not ( = ?auto_625224 ?auto_625236 ) ) ( not ( = ?auto_625224 ?auto_625237 ) ) ( not ( = ?auto_625224 ?auto_625238 ) ) ( not ( = ?auto_625225 ?auto_625226 ) ) ( not ( = ?auto_625225 ?auto_625227 ) ) ( not ( = ?auto_625225 ?auto_625228 ) ) ( not ( = ?auto_625225 ?auto_625229 ) ) ( not ( = ?auto_625225 ?auto_625230 ) ) ( not ( = ?auto_625225 ?auto_625231 ) ) ( not ( = ?auto_625225 ?auto_625232 ) ) ( not ( = ?auto_625225 ?auto_625233 ) ) ( not ( = ?auto_625225 ?auto_625234 ) ) ( not ( = ?auto_625225 ?auto_625235 ) ) ( not ( = ?auto_625225 ?auto_625236 ) ) ( not ( = ?auto_625225 ?auto_625237 ) ) ( not ( = ?auto_625225 ?auto_625238 ) ) ( not ( = ?auto_625226 ?auto_625227 ) ) ( not ( = ?auto_625226 ?auto_625228 ) ) ( not ( = ?auto_625226 ?auto_625229 ) ) ( not ( = ?auto_625226 ?auto_625230 ) ) ( not ( = ?auto_625226 ?auto_625231 ) ) ( not ( = ?auto_625226 ?auto_625232 ) ) ( not ( = ?auto_625226 ?auto_625233 ) ) ( not ( = ?auto_625226 ?auto_625234 ) ) ( not ( = ?auto_625226 ?auto_625235 ) ) ( not ( = ?auto_625226 ?auto_625236 ) ) ( not ( = ?auto_625226 ?auto_625237 ) ) ( not ( = ?auto_625226 ?auto_625238 ) ) ( not ( = ?auto_625227 ?auto_625228 ) ) ( not ( = ?auto_625227 ?auto_625229 ) ) ( not ( = ?auto_625227 ?auto_625230 ) ) ( not ( = ?auto_625227 ?auto_625231 ) ) ( not ( = ?auto_625227 ?auto_625232 ) ) ( not ( = ?auto_625227 ?auto_625233 ) ) ( not ( = ?auto_625227 ?auto_625234 ) ) ( not ( = ?auto_625227 ?auto_625235 ) ) ( not ( = ?auto_625227 ?auto_625236 ) ) ( not ( = ?auto_625227 ?auto_625237 ) ) ( not ( = ?auto_625227 ?auto_625238 ) ) ( not ( = ?auto_625228 ?auto_625229 ) ) ( not ( = ?auto_625228 ?auto_625230 ) ) ( not ( = ?auto_625228 ?auto_625231 ) ) ( not ( = ?auto_625228 ?auto_625232 ) ) ( not ( = ?auto_625228 ?auto_625233 ) ) ( not ( = ?auto_625228 ?auto_625234 ) ) ( not ( = ?auto_625228 ?auto_625235 ) ) ( not ( = ?auto_625228 ?auto_625236 ) ) ( not ( = ?auto_625228 ?auto_625237 ) ) ( not ( = ?auto_625228 ?auto_625238 ) ) ( not ( = ?auto_625229 ?auto_625230 ) ) ( not ( = ?auto_625229 ?auto_625231 ) ) ( not ( = ?auto_625229 ?auto_625232 ) ) ( not ( = ?auto_625229 ?auto_625233 ) ) ( not ( = ?auto_625229 ?auto_625234 ) ) ( not ( = ?auto_625229 ?auto_625235 ) ) ( not ( = ?auto_625229 ?auto_625236 ) ) ( not ( = ?auto_625229 ?auto_625237 ) ) ( not ( = ?auto_625229 ?auto_625238 ) ) ( not ( = ?auto_625230 ?auto_625231 ) ) ( not ( = ?auto_625230 ?auto_625232 ) ) ( not ( = ?auto_625230 ?auto_625233 ) ) ( not ( = ?auto_625230 ?auto_625234 ) ) ( not ( = ?auto_625230 ?auto_625235 ) ) ( not ( = ?auto_625230 ?auto_625236 ) ) ( not ( = ?auto_625230 ?auto_625237 ) ) ( not ( = ?auto_625230 ?auto_625238 ) ) ( not ( = ?auto_625231 ?auto_625232 ) ) ( not ( = ?auto_625231 ?auto_625233 ) ) ( not ( = ?auto_625231 ?auto_625234 ) ) ( not ( = ?auto_625231 ?auto_625235 ) ) ( not ( = ?auto_625231 ?auto_625236 ) ) ( not ( = ?auto_625231 ?auto_625237 ) ) ( not ( = ?auto_625231 ?auto_625238 ) ) ( not ( = ?auto_625232 ?auto_625233 ) ) ( not ( = ?auto_625232 ?auto_625234 ) ) ( not ( = ?auto_625232 ?auto_625235 ) ) ( not ( = ?auto_625232 ?auto_625236 ) ) ( not ( = ?auto_625232 ?auto_625237 ) ) ( not ( = ?auto_625232 ?auto_625238 ) ) ( not ( = ?auto_625233 ?auto_625234 ) ) ( not ( = ?auto_625233 ?auto_625235 ) ) ( not ( = ?auto_625233 ?auto_625236 ) ) ( not ( = ?auto_625233 ?auto_625237 ) ) ( not ( = ?auto_625233 ?auto_625238 ) ) ( not ( = ?auto_625234 ?auto_625235 ) ) ( not ( = ?auto_625234 ?auto_625236 ) ) ( not ( = ?auto_625234 ?auto_625237 ) ) ( not ( = ?auto_625234 ?auto_625238 ) ) ( not ( = ?auto_625235 ?auto_625236 ) ) ( not ( = ?auto_625235 ?auto_625237 ) ) ( not ( = ?auto_625235 ?auto_625238 ) ) ( not ( = ?auto_625236 ?auto_625237 ) ) ( not ( = ?auto_625236 ?auto_625238 ) ) ( not ( = ?auto_625237 ?auto_625238 ) ) ( ON ?auto_625236 ?auto_625237 ) ( ON ?auto_625235 ?auto_625236 ) ( ON ?auto_625234 ?auto_625235 ) ( ON ?auto_625233 ?auto_625234 ) ( ON ?auto_625232 ?auto_625233 ) ( ON ?auto_625231 ?auto_625232 ) ( ON ?auto_625230 ?auto_625231 ) ( ON ?auto_625229 ?auto_625230 ) ( ON ?auto_625228 ?auto_625229 ) ( ON ?auto_625227 ?auto_625228 ) ( CLEAR ?auto_625225 ) ( ON ?auto_625226 ?auto_625227 ) ( CLEAR ?auto_625226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_625223 ?auto_625224 ?auto_625225 ?auto_625226 )
      ( MAKE-15PILE ?auto_625223 ?auto_625224 ?auto_625225 ?auto_625226 ?auto_625227 ?auto_625228 ?auto_625229 ?auto_625230 ?auto_625231 ?auto_625232 ?auto_625233 ?auto_625234 ?auto_625235 ?auto_625236 ?auto_625237 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_625285 - BLOCK
      ?auto_625286 - BLOCK
      ?auto_625287 - BLOCK
      ?auto_625288 - BLOCK
      ?auto_625289 - BLOCK
      ?auto_625290 - BLOCK
      ?auto_625291 - BLOCK
      ?auto_625292 - BLOCK
      ?auto_625293 - BLOCK
      ?auto_625294 - BLOCK
      ?auto_625295 - BLOCK
      ?auto_625296 - BLOCK
      ?auto_625297 - BLOCK
      ?auto_625298 - BLOCK
      ?auto_625299 - BLOCK
    )
    :vars
    (
      ?auto_625300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625299 ?auto_625300 ) ( ON-TABLE ?auto_625285 ) ( ON ?auto_625286 ?auto_625285 ) ( not ( = ?auto_625285 ?auto_625286 ) ) ( not ( = ?auto_625285 ?auto_625287 ) ) ( not ( = ?auto_625285 ?auto_625288 ) ) ( not ( = ?auto_625285 ?auto_625289 ) ) ( not ( = ?auto_625285 ?auto_625290 ) ) ( not ( = ?auto_625285 ?auto_625291 ) ) ( not ( = ?auto_625285 ?auto_625292 ) ) ( not ( = ?auto_625285 ?auto_625293 ) ) ( not ( = ?auto_625285 ?auto_625294 ) ) ( not ( = ?auto_625285 ?auto_625295 ) ) ( not ( = ?auto_625285 ?auto_625296 ) ) ( not ( = ?auto_625285 ?auto_625297 ) ) ( not ( = ?auto_625285 ?auto_625298 ) ) ( not ( = ?auto_625285 ?auto_625299 ) ) ( not ( = ?auto_625285 ?auto_625300 ) ) ( not ( = ?auto_625286 ?auto_625287 ) ) ( not ( = ?auto_625286 ?auto_625288 ) ) ( not ( = ?auto_625286 ?auto_625289 ) ) ( not ( = ?auto_625286 ?auto_625290 ) ) ( not ( = ?auto_625286 ?auto_625291 ) ) ( not ( = ?auto_625286 ?auto_625292 ) ) ( not ( = ?auto_625286 ?auto_625293 ) ) ( not ( = ?auto_625286 ?auto_625294 ) ) ( not ( = ?auto_625286 ?auto_625295 ) ) ( not ( = ?auto_625286 ?auto_625296 ) ) ( not ( = ?auto_625286 ?auto_625297 ) ) ( not ( = ?auto_625286 ?auto_625298 ) ) ( not ( = ?auto_625286 ?auto_625299 ) ) ( not ( = ?auto_625286 ?auto_625300 ) ) ( not ( = ?auto_625287 ?auto_625288 ) ) ( not ( = ?auto_625287 ?auto_625289 ) ) ( not ( = ?auto_625287 ?auto_625290 ) ) ( not ( = ?auto_625287 ?auto_625291 ) ) ( not ( = ?auto_625287 ?auto_625292 ) ) ( not ( = ?auto_625287 ?auto_625293 ) ) ( not ( = ?auto_625287 ?auto_625294 ) ) ( not ( = ?auto_625287 ?auto_625295 ) ) ( not ( = ?auto_625287 ?auto_625296 ) ) ( not ( = ?auto_625287 ?auto_625297 ) ) ( not ( = ?auto_625287 ?auto_625298 ) ) ( not ( = ?auto_625287 ?auto_625299 ) ) ( not ( = ?auto_625287 ?auto_625300 ) ) ( not ( = ?auto_625288 ?auto_625289 ) ) ( not ( = ?auto_625288 ?auto_625290 ) ) ( not ( = ?auto_625288 ?auto_625291 ) ) ( not ( = ?auto_625288 ?auto_625292 ) ) ( not ( = ?auto_625288 ?auto_625293 ) ) ( not ( = ?auto_625288 ?auto_625294 ) ) ( not ( = ?auto_625288 ?auto_625295 ) ) ( not ( = ?auto_625288 ?auto_625296 ) ) ( not ( = ?auto_625288 ?auto_625297 ) ) ( not ( = ?auto_625288 ?auto_625298 ) ) ( not ( = ?auto_625288 ?auto_625299 ) ) ( not ( = ?auto_625288 ?auto_625300 ) ) ( not ( = ?auto_625289 ?auto_625290 ) ) ( not ( = ?auto_625289 ?auto_625291 ) ) ( not ( = ?auto_625289 ?auto_625292 ) ) ( not ( = ?auto_625289 ?auto_625293 ) ) ( not ( = ?auto_625289 ?auto_625294 ) ) ( not ( = ?auto_625289 ?auto_625295 ) ) ( not ( = ?auto_625289 ?auto_625296 ) ) ( not ( = ?auto_625289 ?auto_625297 ) ) ( not ( = ?auto_625289 ?auto_625298 ) ) ( not ( = ?auto_625289 ?auto_625299 ) ) ( not ( = ?auto_625289 ?auto_625300 ) ) ( not ( = ?auto_625290 ?auto_625291 ) ) ( not ( = ?auto_625290 ?auto_625292 ) ) ( not ( = ?auto_625290 ?auto_625293 ) ) ( not ( = ?auto_625290 ?auto_625294 ) ) ( not ( = ?auto_625290 ?auto_625295 ) ) ( not ( = ?auto_625290 ?auto_625296 ) ) ( not ( = ?auto_625290 ?auto_625297 ) ) ( not ( = ?auto_625290 ?auto_625298 ) ) ( not ( = ?auto_625290 ?auto_625299 ) ) ( not ( = ?auto_625290 ?auto_625300 ) ) ( not ( = ?auto_625291 ?auto_625292 ) ) ( not ( = ?auto_625291 ?auto_625293 ) ) ( not ( = ?auto_625291 ?auto_625294 ) ) ( not ( = ?auto_625291 ?auto_625295 ) ) ( not ( = ?auto_625291 ?auto_625296 ) ) ( not ( = ?auto_625291 ?auto_625297 ) ) ( not ( = ?auto_625291 ?auto_625298 ) ) ( not ( = ?auto_625291 ?auto_625299 ) ) ( not ( = ?auto_625291 ?auto_625300 ) ) ( not ( = ?auto_625292 ?auto_625293 ) ) ( not ( = ?auto_625292 ?auto_625294 ) ) ( not ( = ?auto_625292 ?auto_625295 ) ) ( not ( = ?auto_625292 ?auto_625296 ) ) ( not ( = ?auto_625292 ?auto_625297 ) ) ( not ( = ?auto_625292 ?auto_625298 ) ) ( not ( = ?auto_625292 ?auto_625299 ) ) ( not ( = ?auto_625292 ?auto_625300 ) ) ( not ( = ?auto_625293 ?auto_625294 ) ) ( not ( = ?auto_625293 ?auto_625295 ) ) ( not ( = ?auto_625293 ?auto_625296 ) ) ( not ( = ?auto_625293 ?auto_625297 ) ) ( not ( = ?auto_625293 ?auto_625298 ) ) ( not ( = ?auto_625293 ?auto_625299 ) ) ( not ( = ?auto_625293 ?auto_625300 ) ) ( not ( = ?auto_625294 ?auto_625295 ) ) ( not ( = ?auto_625294 ?auto_625296 ) ) ( not ( = ?auto_625294 ?auto_625297 ) ) ( not ( = ?auto_625294 ?auto_625298 ) ) ( not ( = ?auto_625294 ?auto_625299 ) ) ( not ( = ?auto_625294 ?auto_625300 ) ) ( not ( = ?auto_625295 ?auto_625296 ) ) ( not ( = ?auto_625295 ?auto_625297 ) ) ( not ( = ?auto_625295 ?auto_625298 ) ) ( not ( = ?auto_625295 ?auto_625299 ) ) ( not ( = ?auto_625295 ?auto_625300 ) ) ( not ( = ?auto_625296 ?auto_625297 ) ) ( not ( = ?auto_625296 ?auto_625298 ) ) ( not ( = ?auto_625296 ?auto_625299 ) ) ( not ( = ?auto_625296 ?auto_625300 ) ) ( not ( = ?auto_625297 ?auto_625298 ) ) ( not ( = ?auto_625297 ?auto_625299 ) ) ( not ( = ?auto_625297 ?auto_625300 ) ) ( not ( = ?auto_625298 ?auto_625299 ) ) ( not ( = ?auto_625298 ?auto_625300 ) ) ( not ( = ?auto_625299 ?auto_625300 ) ) ( ON ?auto_625298 ?auto_625299 ) ( ON ?auto_625297 ?auto_625298 ) ( ON ?auto_625296 ?auto_625297 ) ( ON ?auto_625295 ?auto_625296 ) ( ON ?auto_625294 ?auto_625295 ) ( ON ?auto_625293 ?auto_625294 ) ( ON ?auto_625292 ?auto_625293 ) ( ON ?auto_625291 ?auto_625292 ) ( ON ?auto_625290 ?auto_625291 ) ( ON ?auto_625289 ?auto_625290 ) ( ON ?auto_625288 ?auto_625289 ) ( CLEAR ?auto_625286 ) ( ON ?auto_625287 ?auto_625288 ) ( CLEAR ?auto_625287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_625285 ?auto_625286 ?auto_625287 )
      ( MAKE-15PILE ?auto_625285 ?auto_625286 ?auto_625287 ?auto_625288 ?auto_625289 ?auto_625290 ?auto_625291 ?auto_625292 ?auto_625293 ?auto_625294 ?auto_625295 ?auto_625296 ?auto_625297 ?auto_625298 ?auto_625299 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_625347 - BLOCK
      ?auto_625348 - BLOCK
      ?auto_625349 - BLOCK
      ?auto_625350 - BLOCK
      ?auto_625351 - BLOCK
      ?auto_625352 - BLOCK
      ?auto_625353 - BLOCK
      ?auto_625354 - BLOCK
      ?auto_625355 - BLOCK
      ?auto_625356 - BLOCK
      ?auto_625357 - BLOCK
      ?auto_625358 - BLOCK
      ?auto_625359 - BLOCK
      ?auto_625360 - BLOCK
      ?auto_625361 - BLOCK
    )
    :vars
    (
      ?auto_625362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625361 ?auto_625362 ) ( ON-TABLE ?auto_625347 ) ( not ( = ?auto_625347 ?auto_625348 ) ) ( not ( = ?auto_625347 ?auto_625349 ) ) ( not ( = ?auto_625347 ?auto_625350 ) ) ( not ( = ?auto_625347 ?auto_625351 ) ) ( not ( = ?auto_625347 ?auto_625352 ) ) ( not ( = ?auto_625347 ?auto_625353 ) ) ( not ( = ?auto_625347 ?auto_625354 ) ) ( not ( = ?auto_625347 ?auto_625355 ) ) ( not ( = ?auto_625347 ?auto_625356 ) ) ( not ( = ?auto_625347 ?auto_625357 ) ) ( not ( = ?auto_625347 ?auto_625358 ) ) ( not ( = ?auto_625347 ?auto_625359 ) ) ( not ( = ?auto_625347 ?auto_625360 ) ) ( not ( = ?auto_625347 ?auto_625361 ) ) ( not ( = ?auto_625347 ?auto_625362 ) ) ( not ( = ?auto_625348 ?auto_625349 ) ) ( not ( = ?auto_625348 ?auto_625350 ) ) ( not ( = ?auto_625348 ?auto_625351 ) ) ( not ( = ?auto_625348 ?auto_625352 ) ) ( not ( = ?auto_625348 ?auto_625353 ) ) ( not ( = ?auto_625348 ?auto_625354 ) ) ( not ( = ?auto_625348 ?auto_625355 ) ) ( not ( = ?auto_625348 ?auto_625356 ) ) ( not ( = ?auto_625348 ?auto_625357 ) ) ( not ( = ?auto_625348 ?auto_625358 ) ) ( not ( = ?auto_625348 ?auto_625359 ) ) ( not ( = ?auto_625348 ?auto_625360 ) ) ( not ( = ?auto_625348 ?auto_625361 ) ) ( not ( = ?auto_625348 ?auto_625362 ) ) ( not ( = ?auto_625349 ?auto_625350 ) ) ( not ( = ?auto_625349 ?auto_625351 ) ) ( not ( = ?auto_625349 ?auto_625352 ) ) ( not ( = ?auto_625349 ?auto_625353 ) ) ( not ( = ?auto_625349 ?auto_625354 ) ) ( not ( = ?auto_625349 ?auto_625355 ) ) ( not ( = ?auto_625349 ?auto_625356 ) ) ( not ( = ?auto_625349 ?auto_625357 ) ) ( not ( = ?auto_625349 ?auto_625358 ) ) ( not ( = ?auto_625349 ?auto_625359 ) ) ( not ( = ?auto_625349 ?auto_625360 ) ) ( not ( = ?auto_625349 ?auto_625361 ) ) ( not ( = ?auto_625349 ?auto_625362 ) ) ( not ( = ?auto_625350 ?auto_625351 ) ) ( not ( = ?auto_625350 ?auto_625352 ) ) ( not ( = ?auto_625350 ?auto_625353 ) ) ( not ( = ?auto_625350 ?auto_625354 ) ) ( not ( = ?auto_625350 ?auto_625355 ) ) ( not ( = ?auto_625350 ?auto_625356 ) ) ( not ( = ?auto_625350 ?auto_625357 ) ) ( not ( = ?auto_625350 ?auto_625358 ) ) ( not ( = ?auto_625350 ?auto_625359 ) ) ( not ( = ?auto_625350 ?auto_625360 ) ) ( not ( = ?auto_625350 ?auto_625361 ) ) ( not ( = ?auto_625350 ?auto_625362 ) ) ( not ( = ?auto_625351 ?auto_625352 ) ) ( not ( = ?auto_625351 ?auto_625353 ) ) ( not ( = ?auto_625351 ?auto_625354 ) ) ( not ( = ?auto_625351 ?auto_625355 ) ) ( not ( = ?auto_625351 ?auto_625356 ) ) ( not ( = ?auto_625351 ?auto_625357 ) ) ( not ( = ?auto_625351 ?auto_625358 ) ) ( not ( = ?auto_625351 ?auto_625359 ) ) ( not ( = ?auto_625351 ?auto_625360 ) ) ( not ( = ?auto_625351 ?auto_625361 ) ) ( not ( = ?auto_625351 ?auto_625362 ) ) ( not ( = ?auto_625352 ?auto_625353 ) ) ( not ( = ?auto_625352 ?auto_625354 ) ) ( not ( = ?auto_625352 ?auto_625355 ) ) ( not ( = ?auto_625352 ?auto_625356 ) ) ( not ( = ?auto_625352 ?auto_625357 ) ) ( not ( = ?auto_625352 ?auto_625358 ) ) ( not ( = ?auto_625352 ?auto_625359 ) ) ( not ( = ?auto_625352 ?auto_625360 ) ) ( not ( = ?auto_625352 ?auto_625361 ) ) ( not ( = ?auto_625352 ?auto_625362 ) ) ( not ( = ?auto_625353 ?auto_625354 ) ) ( not ( = ?auto_625353 ?auto_625355 ) ) ( not ( = ?auto_625353 ?auto_625356 ) ) ( not ( = ?auto_625353 ?auto_625357 ) ) ( not ( = ?auto_625353 ?auto_625358 ) ) ( not ( = ?auto_625353 ?auto_625359 ) ) ( not ( = ?auto_625353 ?auto_625360 ) ) ( not ( = ?auto_625353 ?auto_625361 ) ) ( not ( = ?auto_625353 ?auto_625362 ) ) ( not ( = ?auto_625354 ?auto_625355 ) ) ( not ( = ?auto_625354 ?auto_625356 ) ) ( not ( = ?auto_625354 ?auto_625357 ) ) ( not ( = ?auto_625354 ?auto_625358 ) ) ( not ( = ?auto_625354 ?auto_625359 ) ) ( not ( = ?auto_625354 ?auto_625360 ) ) ( not ( = ?auto_625354 ?auto_625361 ) ) ( not ( = ?auto_625354 ?auto_625362 ) ) ( not ( = ?auto_625355 ?auto_625356 ) ) ( not ( = ?auto_625355 ?auto_625357 ) ) ( not ( = ?auto_625355 ?auto_625358 ) ) ( not ( = ?auto_625355 ?auto_625359 ) ) ( not ( = ?auto_625355 ?auto_625360 ) ) ( not ( = ?auto_625355 ?auto_625361 ) ) ( not ( = ?auto_625355 ?auto_625362 ) ) ( not ( = ?auto_625356 ?auto_625357 ) ) ( not ( = ?auto_625356 ?auto_625358 ) ) ( not ( = ?auto_625356 ?auto_625359 ) ) ( not ( = ?auto_625356 ?auto_625360 ) ) ( not ( = ?auto_625356 ?auto_625361 ) ) ( not ( = ?auto_625356 ?auto_625362 ) ) ( not ( = ?auto_625357 ?auto_625358 ) ) ( not ( = ?auto_625357 ?auto_625359 ) ) ( not ( = ?auto_625357 ?auto_625360 ) ) ( not ( = ?auto_625357 ?auto_625361 ) ) ( not ( = ?auto_625357 ?auto_625362 ) ) ( not ( = ?auto_625358 ?auto_625359 ) ) ( not ( = ?auto_625358 ?auto_625360 ) ) ( not ( = ?auto_625358 ?auto_625361 ) ) ( not ( = ?auto_625358 ?auto_625362 ) ) ( not ( = ?auto_625359 ?auto_625360 ) ) ( not ( = ?auto_625359 ?auto_625361 ) ) ( not ( = ?auto_625359 ?auto_625362 ) ) ( not ( = ?auto_625360 ?auto_625361 ) ) ( not ( = ?auto_625360 ?auto_625362 ) ) ( not ( = ?auto_625361 ?auto_625362 ) ) ( ON ?auto_625360 ?auto_625361 ) ( ON ?auto_625359 ?auto_625360 ) ( ON ?auto_625358 ?auto_625359 ) ( ON ?auto_625357 ?auto_625358 ) ( ON ?auto_625356 ?auto_625357 ) ( ON ?auto_625355 ?auto_625356 ) ( ON ?auto_625354 ?auto_625355 ) ( ON ?auto_625353 ?auto_625354 ) ( ON ?auto_625352 ?auto_625353 ) ( ON ?auto_625351 ?auto_625352 ) ( ON ?auto_625350 ?auto_625351 ) ( ON ?auto_625349 ?auto_625350 ) ( CLEAR ?auto_625347 ) ( ON ?auto_625348 ?auto_625349 ) ( CLEAR ?auto_625348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_625347 ?auto_625348 )
      ( MAKE-15PILE ?auto_625347 ?auto_625348 ?auto_625349 ?auto_625350 ?auto_625351 ?auto_625352 ?auto_625353 ?auto_625354 ?auto_625355 ?auto_625356 ?auto_625357 ?auto_625358 ?auto_625359 ?auto_625360 ?auto_625361 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_625409 - BLOCK
      ?auto_625410 - BLOCK
      ?auto_625411 - BLOCK
      ?auto_625412 - BLOCK
      ?auto_625413 - BLOCK
      ?auto_625414 - BLOCK
      ?auto_625415 - BLOCK
      ?auto_625416 - BLOCK
      ?auto_625417 - BLOCK
      ?auto_625418 - BLOCK
      ?auto_625419 - BLOCK
      ?auto_625420 - BLOCK
      ?auto_625421 - BLOCK
      ?auto_625422 - BLOCK
      ?auto_625423 - BLOCK
    )
    :vars
    (
      ?auto_625424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625423 ?auto_625424 ) ( not ( = ?auto_625409 ?auto_625410 ) ) ( not ( = ?auto_625409 ?auto_625411 ) ) ( not ( = ?auto_625409 ?auto_625412 ) ) ( not ( = ?auto_625409 ?auto_625413 ) ) ( not ( = ?auto_625409 ?auto_625414 ) ) ( not ( = ?auto_625409 ?auto_625415 ) ) ( not ( = ?auto_625409 ?auto_625416 ) ) ( not ( = ?auto_625409 ?auto_625417 ) ) ( not ( = ?auto_625409 ?auto_625418 ) ) ( not ( = ?auto_625409 ?auto_625419 ) ) ( not ( = ?auto_625409 ?auto_625420 ) ) ( not ( = ?auto_625409 ?auto_625421 ) ) ( not ( = ?auto_625409 ?auto_625422 ) ) ( not ( = ?auto_625409 ?auto_625423 ) ) ( not ( = ?auto_625409 ?auto_625424 ) ) ( not ( = ?auto_625410 ?auto_625411 ) ) ( not ( = ?auto_625410 ?auto_625412 ) ) ( not ( = ?auto_625410 ?auto_625413 ) ) ( not ( = ?auto_625410 ?auto_625414 ) ) ( not ( = ?auto_625410 ?auto_625415 ) ) ( not ( = ?auto_625410 ?auto_625416 ) ) ( not ( = ?auto_625410 ?auto_625417 ) ) ( not ( = ?auto_625410 ?auto_625418 ) ) ( not ( = ?auto_625410 ?auto_625419 ) ) ( not ( = ?auto_625410 ?auto_625420 ) ) ( not ( = ?auto_625410 ?auto_625421 ) ) ( not ( = ?auto_625410 ?auto_625422 ) ) ( not ( = ?auto_625410 ?auto_625423 ) ) ( not ( = ?auto_625410 ?auto_625424 ) ) ( not ( = ?auto_625411 ?auto_625412 ) ) ( not ( = ?auto_625411 ?auto_625413 ) ) ( not ( = ?auto_625411 ?auto_625414 ) ) ( not ( = ?auto_625411 ?auto_625415 ) ) ( not ( = ?auto_625411 ?auto_625416 ) ) ( not ( = ?auto_625411 ?auto_625417 ) ) ( not ( = ?auto_625411 ?auto_625418 ) ) ( not ( = ?auto_625411 ?auto_625419 ) ) ( not ( = ?auto_625411 ?auto_625420 ) ) ( not ( = ?auto_625411 ?auto_625421 ) ) ( not ( = ?auto_625411 ?auto_625422 ) ) ( not ( = ?auto_625411 ?auto_625423 ) ) ( not ( = ?auto_625411 ?auto_625424 ) ) ( not ( = ?auto_625412 ?auto_625413 ) ) ( not ( = ?auto_625412 ?auto_625414 ) ) ( not ( = ?auto_625412 ?auto_625415 ) ) ( not ( = ?auto_625412 ?auto_625416 ) ) ( not ( = ?auto_625412 ?auto_625417 ) ) ( not ( = ?auto_625412 ?auto_625418 ) ) ( not ( = ?auto_625412 ?auto_625419 ) ) ( not ( = ?auto_625412 ?auto_625420 ) ) ( not ( = ?auto_625412 ?auto_625421 ) ) ( not ( = ?auto_625412 ?auto_625422 ) ) ( not ( = ?auto_625412 ?auto_625423 ) ) ( not ( = ?auto_625412 ?auto_625424 ) ) ( not ( = ?auto_625413 ?auto_625414 ) ) ( not ( = ?auto_625413 ?auto_625415 ) ) ( not ( = ?auto_625413 ?auto_625416 ) ) ( not ( = ?auto_625413 ?auto_625417 ) ) ( not ( = ?auto_625413 ?auto_625418 ) ) ( not ( = ?auto_625413 ?auto_625419 ) ) ( not ( = ?auto_625413 ?auto_625420 ) ) ( not ( = ?auto_625413 ?auto_625421 ) ) ( not ( = ?auto_625413 ?auto_625422 ) ) ( not ( = ?auto_625413 ?auto_625423 ) ) ( not ( = ?auto_625413 ?auto_625424 ) ) ( not ( = ?auto_625414 ?auto_625415 ) ) ( not ( = ?auto_625414 ?auto_625416 ) ) ( not ( = ?auto_625414 ?auto_625417 ) ) ( not ( = ?auto_625414 ?auto_625418 ) ) ( not ( = ?auto_625414 ?auto_625419 ) ) ( not ( = ?auto_625414 ?auto_625420 ) ) ( not ( = ?auto_625414 ?auto_625421 ) ) ( not ( = ?auto_625414 ?auto_625422 ) ) ( not ( = ?auto_625414 ?auto_625423 ) ) ( not ( = ?auto_625414 ?auto_625424 ) ) ( not ( = ?auto_625415 ?auto_625416 ) ) ( not ( = ?auto_625415 ?auto_625417 ) ) ( not ( = ?auto_625415 ?auto_625418 ) ) ( not ( = ?auto_625415 ?auto_625419 ) ) ( not ( = ?auto_625415 ?auto_625420 ) ) ( not ( = ?auto_625415 ?auto_625421 ) ) ( not ( = ?auto_625415 ?auto_625422 ) ) ( not ( = ?auto_625415 ?auto_625423 ) ) ( not ( = ?auto_625415 ?auto_625424 ) ) ( not ( = ?auto_625416 ?auto_625417 ) ) ( not ( = ?auto_625416 ?auto_625418 ) ) ( not ( = ?auto_625416 ?auto_625419 ) ) ( not ( = ?auto_625416 ?auto_625420 ) ) ( not ( = ?auto_625416 ?auto_625421 ) ) ( not ( = ?auto_625416 ?auto_625422 ) ) ( not ( = ?auto_625416 ?auto_625423 ) ) ( not ( = ?auto_625416 ?auto_625424 ) ) ( not ( = ?auto_625417 ?auto_625418 ) ) ( not ( = ?auto_625417 ?auto_625419 ) ) ( not ( = ?auto_625417 ?auto_625420 ) ) ( not ( = ?auto_625417 ?auto_625421 ) ) ( not ( = ?auto_625417 ?auto_625422 ) ) ( not ( = ?auto_625417 ?auto_625423 ) ) ( not ( = ?auto_625417 ?auto_625424 ) ) ( not ( = ?auto_625418 ?auto_625419 ) ) ( not ( = ?auto_625418 ?auto_625420 ) ) ( not ( = ?auto_625418 ?auto_625421 ) ) ( not ( = ?auto_625418 ?auto_625422 ) ) ( not ( = ?auto_625418 ?auto_625423 ) ) ( not ( = ?auto_625418 ?auto_625424 ) ) ( not ( = ?auto_625419 ?auto_625420 ) ) ( not ( = ?auto_625419 ?auto_625421 ) ) ( not ( = ?auto_625419 ?auto_625422 ) ) ( not ( = ?auto_625419 ?auto_625423 ) ) ( not ( = ?auto_625419 ?auto_625424 ) ) ( not ( = ?auto_625420 ?auto_625421 ) ) ( not ( = ?auto_625420 ?auto_625422 ) ) ( not ( = ?auto_625420 ?auto_625423 ) ) ( not ( = ?auto_625420 ?auto_625424 ) ) ( not ( = ?auto_625421 ?auto_625422 ) ) ( not ( = ?auto_625421 ?auto_625423 ) ) ( not ( = ?auto_625421 ?auto_625424 ) ) ( not ( = ?auto_625422 ?auto_625423 ) ) ( not ( = ?auto_625422 ?auto_625424 ) ) ( not ( = ?auto_625423 ?auto_625424 ) ) ( ON ?auto_625422 ?auto_625423 ) ( ON ?auto_625421 ?auto_625422 ) ( ON ?auto_625420 ?auto_625421 ) ( ON ?auto_625419 ?auto_625420 ) ( ON ?auto_625418 ?auto_625419 ) ( ON ?auto_625417 ?auto_625418 ) ( ON ?auto_625416 ?auto_625417 ) ( ON ?auto_625415 ?auto_625416 ) ( ON ?auto_625414 ?auto_625415 ) ( ON ?auto_625413 ?auto_625414 ) ( ON ?auto_625412 ?auto_625413 ) ( ON ?auto_625411 ?auto_625412 ) ( ON ?auto_625410 ?auto_625411 ) ( ON ?auto_625409 ?auto_625410 ) ( CLEAR ?auto_625409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_625409 )
      ( MAKE-15PILE ?auto_625409 ?auto_625410 ?auto_625411 ?auto_625412 ?auto_625413 ?auto_625414 ?auto_625415 ?auto_625416 ?auto_625417 ?auto_625418 ?auto_625419 ?auto_625420 ?auto_625421 ?auto_625422 ?auto_625423 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625472 - BLOCK
      ?auto_625473 - BLOCK
      ?auto_625474 - BLOCK
      ?auto_625475 - BLOCK
      ?auto_625476 - BLOCK
      ?auto_625477 - BLOCK
      ?auto_625478 - BLOCK
      ?auto_625479 - BLOCK
      ?auto_625480 - BLOCK
      ?auto_625481 - BLOCK
      ?auto_625482 - BLOCK
      ?auto_625483 - BLOCK
      ?auto_625484 - BLOCK
      ?auto_625485 - BLOCK
      ?auto_625486 - BLOCK
      ?auto_625487 - BLOCK
    )
    :vars
    (
      ?auto_625488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_625486 ) ( ON ?auto_625487 ?auto_625488 ) ( CLEAR ?auto_625487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_625472 ) ( ON ?auto_625473 ?auto_625472 ) ( ON ?auto_625474 ?auto_625473 ) ( ON ?auto_625475 ?auto_625474 ) ( ON ?auto_625476 ?auto_625475 ) ( ON ?auto_625477 ?auto_625476 ) ( ON ?auto_625478 ?auto_625477 ) ( ON ?auto_625479 ?auto_625478 ) ( ON ?auto_625480 ?auto_625479 ) ( ON ?auto_625481 ?auto_625480 ) ( ON ?auto_625482 ?auto_625481 ) ( ON ?auto_625483 ?auto_625482 ) ( ON ?auto_625484 ?auto_625483 ) ( ON ?auto_625485 ?auto_625484 ) ( ON ?auto_625486 ?auto_625485 ) ( not ( = ?auto_625472 ?auto_625473 ) ) ( not ( = ?auto_625472 ?auto_625474 ) ) ( not ( = ?auto_625472 ?auto_625475 ) ) ( not ( = ?auto_625472 ?auto_625476 ) ) ( not ( = ?auto_625472 ?auto_625477 ) ) ( not ( = ?auto_625472 ?auto_625478 ) ) ( not ( = ?auto_625472 ?auto_625479 ) ) ( not ( = ?auto_625472 ?auto_625480 ) ) ( not ( = ?auto_625472 ?auto_625481 ) ) ( not ( = ?auto_625472 ?auto_625482 ) ) ( not ( = ?auto_625472 ?auto_625483 ) ) ( not ( = ?auto_625472 ?auto_625484 ) ) ( not ( = ?auto_625472 ?auto_625485 ) ) ( not ( = ?auto_625472 ?auto_625486 ) ) ( not ( = ?auto_625472 ?auto_625487 ) ) ( not ( = ?auto_625472 ?auto_625488 ) ) ( not ( = ?auto_625473 ?auto_625474 ) ) ( not ( = ?auto_625473 ?auto_625475 ) ) ( not ( = ?auto_625473 ?auto_625476 ) ) ( not ( = ?auto_625473 ?auto_625477 ) ) ( not ( = ?auto_625473 ?auto_625478 ) ) ( not ( = ?auto_625473 ?auto_625479 ) ) ( not ( = ?auto_625473 ?auto_625480 ) ) ( not ( = ?auto_625473 ?auto_625481 ) ) ( not ( = ?auto_625473 ?auto_625482 ) ) ( not ( = ?auto_625473 ?auto_625483 ) ) ( not ( = ?auto_625473 ?auto_625484 ) ) ( not ( = ?auto_625473 ?auto_625485 ) ) ( not ( = ?auto_625473 ?auto_625486 ) ) ( not ( = ?auto_625473 ?auto_625487 ) ) ( not ( = ?auto_625473 ?auto_625488 ) ) ( not ( = ?auto_625474 ?auto_625475 ) ) ( not ( = ?auto_625474 ?auto_625476 ) ) ( not ( = ?auto_625474 ?auto_625477 ) ) ( not ( = ?auto_625474 ?auto_625478 ) ) ( not ( = ?auto_625474 ?auto_625479 ) ) ( not ( = ?auto_625474 ?auto_625480 ) ) ( not ( = ?auto_625474 ?auto_625481 ) ) ( not ( = ?auto_625474 ?auto_625482 ) ) ( not ( = ?auto_625474 ?auto_625483 ) ) ( not ( = ?auto_625474 ?auto_625484 ) ) ( not ( = ?auto_625474 ?auto_625485 ) ) ( not ( = ?auto_625474 ?auto_625486 ) ) ( not ( = ?auto_625474 ?auto_625487 ) ) ( not ( = ?auto_625474 ?auto_625488 ) ) ( not ( = ?auto_625475 ?auto_625476 ) ) ( not ( = ?auto_625475 ?auto_625477 ) ) ( not ( = ?auto_625475 ?auto_625478 ) ) ( not ( = ?auto_625475 ?auto_625479 ) ) ( not ( = ?auto_625475 ?auto_625480 ) ) ( not ( = ?auto_625475 ?auto_625481 ) ) ( not ( = ?auto_625475 ?auto_625482 ) ) ( not ( = ?auto_625475 ?auto_625483 ) ) ( not ( = ?auto_625475 ?auto_625484 ) ) ( not ( = ?auto_625475 ?auto_625485 ) ) ( not ( = ?auto_625475 ?auto_625486 ) ) ( not ( = ?auto_625475 ?auto_625487 ) ) ( not ( = ?auto_625475 ?auto_625488 ) ) ( not ( = ?auto_625476 ?auto_625477 ) ) ( not ( = ?auto_625476 ?auto_625478 ) ) ( not ( = ?auto_625476 ?auto_625479 ) ) ( not ( = ?auto_625476 ?auto_625480 ) ) ( not ( = ?auto_625476 ?auto_625481 ) ) ( not ( = ?auto_625476 ?auto_625482 ) ) ( not ( = ?auto_625476 ?auto_625483 ) ) ( not ( = ?auto_625476 ?auto_625484 ) ) ( not ( = ?auto_625476 ?auto_625485 ) ) ( not ( = ?auto_625476 ?auto_625486 ) ) ( not ( = ?auto_625476 ?auto_625487 ) ) ( not ( = ?auto_625476 ?auto_625488 ) ) ( not ( = ?auto_625477 ?auto_625478 ) ) ( not ( = ?auto_625477 ?auto_625479 ) ) ( not ( = ?auto_625477 ?auto_625480 ) ) ( not ( = ?auto_625477 ?auto_625481 ) ) ( not ( = ?auto_625477 ?auto_625482 ) ) ( not ( = ?auto_625477 ?auto_625483 ) ) ( not ( = ?auto_625477 ?auto_625484 ) ) ( not ( = ?auto_625477 ?auto_625485 ) ) ( not ( = ?auto_625477 ?auto_625486 ) ) ( not ( = ?auto_625477 ?auto_625487 ) ) ( not ( = ?auto_625477 ?auto_625488 ) ) ( not ( = ?auto_625478 ?auto_625479 ) ) ( not ( = ?auto_625478 ?auto_625480 ) ) ( not ( = ?auto_625478 ?auto_625481 ) ) ( not ( = ?auto_625478 ?auto_625482 ) ) ( not ( = ?auto_625478 ?auto_625483 ) ) ( not ( = ?auto_625478 ?auto_625484 ) ) ( not ( = ?auto_625478 ?auto_625485 ) ) ( not ( = ?auto_625478 ?auto_625486 ) ) ( not ( = ?auto_625478 ?auto_625487 ) ) ( not ( = ?auto_625478 ?auto_625488 ) ) ( not ( = ?auto_625479 ?auto_625480 ) ) ( not ( = ?auto_625479 ?auto_625481 ) ) ( not ( = ?auto_625479 ?auto_625482 ) ) ( not ( = ?auto_625479 ?auto_625483 ) ) ( not ( = ?auto_625479 ?auto_625484 ) ) ( not ( = ?auto_625479 ?auto_625485 ) ) ( not ( = ?auto_625479 ?auto_625486 ) ) ( not ( = ?auto_625479 ?auto_625487 ) ) ( not ( = ?auto_625479 ?auto_625488 ) ) ( not ( = ?auto_625480 ?auto_625481 ) ) ( not ( = ?auto_625480 ?auto_625482 ) ) ( not ( = ?auto_625480 ?auto_625483 ) ) ( not ( = ?auto_625480 ?auto_625484 ) ) ( not ( = ?auto_625480 ?auto_625485 ) ) ( not ( = ?auto_625480 ?auto_625486 ) ) ( not ( = ?auto_625480 ?auto_625487 ) ) ( not ( = ?auto_625480 ?auto_625488 ) ) ( not ( = ?auto_625481 ?auto_625482 ) ) ( not ( = ?auto_625481 ?auto_625483 ) ) ( not ( = ?auto_625481 ?auto_625484 ) ) ( not ( = ?auto_625481 ?auto_625485 ) ) ( not ( = ?auto_625481 ?auto_625486 ) ) ( not ( = ?auto_625481 ?auto_625487 ) ) ( not ( = ?auto_625481 ?auto_625488 ) ) ( not ( = ?auto_625482 ?auto_625483 ) ) ( not ( = ?auto_625482 ?auto_625484 ) ) ( not ( = ?auto_625482 ?auto_625485 ) ) ( not ( = ?auto_625482 ?auto_625486 ) ) ( not ( = ?auto_625482 ?auto_625487 ) ) ( not ( = ?auto_625482 ?auto_625488 ) ) ( not ( = ?auto_625483 ?auto_625484 ) ) ( not ( = ?auto_625483 ?auto_625485 ) ) ( not ( = ?auto_625483 ?auto_625486 ) ) ( not ( = ?auto_625483 ?auto_625487 ) ) ( not ( = ?auto_625483 ?auto_625488 ) ) ( not ( = ?auto_625484 ?auto_625485 ) ) ( not ( = ?auto_625484 ?auto_625486 ) ) ( not ( = ?auto_625484 ?auto_625487 ) ) ( not ( = ?auto_625484 ?auto_625488 ) ) ( not ( = ?auto_625485 ?auto_625486 ) ) ( not ( = ?auto_625485 ?auto_625487 ) ) ( not ( = ?auto_625485 ?auto_625488 ) ) ( not ( = ?auto_625486 ?auto_625487 ) ) ( not ( = ?auto_625486 ?auto_625488 ) ) ( not ( = ?auto_625487 ?auto_625488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_625487 ?auto_625488 )
      ( !STACK ?auto_625487 ?auto_625486 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625538 - BLOCK
      ?auto_625539 - BLOCK
      ?auto_625540 - BLOCK
      ?auto_625541 - BLOCK
      ?auto_625542 - BLOCK
      ?auto_625543 - BLOCK
      ?auto_625544 - BLOCK
      ?auto_625545 - BLOCK
      ?auto_625546 - BLOCK
      ?auto_625547 - BLOCK
      ?auto_625548 - BLOCK
      ?auto_625549 - BLOCK
      ?auto_625550 - BLOCK
      ?auto_625551 - BLOCK
      ?auto_625552 - BLOCK
      ?auto_625553 - BLOCK
    )
    :vars
    (
      ?auto_625554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625553 ?auto_625554 ) ( ON-TABLE ?auto_625538 ) ( ON ?auto_625539 ?auto_625538 ) ( ON ?auto_625540 ?auto_625539 ) ( ON ?auto_625541 ?auto_625540 ) ( ON ?auto_625542 ?auto_625541 ) ( ON ?auto_625543 ?auto_625542 ) ( ON ?auto_625544 ?auto_625543 ) ( ON ?auto_625545 ?auto_625544 ) ( ON ?auto_625546 ?auto_625545 ) ( ON ?auto_625547 ?auto_625546 ) ( ON ?auto_625548 ?auto_625547 ) ( ON ?auto_625549 ?auto_625548 ) ( ON ?auto_625550 ?auto_625549 ) ( ON ?auto_625551 ?auto_625550 ) ( not ( = ?auto_625538 ?auto_625539 ) ) ( not ( = ?auto_625538 ?auto_625540 ) ) ( not ( = ?auto_625538 ?auto_625541 ) ) ( not ( = ?auto_625538 ?auto_625542 ) ) ( not ( = ?auto_625538 ?auto_625543 ) ) ( not ( = ?auto_625538 ?auto_625544 ) ) ( not ( = ?auto_625538 ?auto_625545 ) ) ( not ( = ?auto_625538 ?auto_625546 ) ) ( not ( = ?auto_625538 ?auto_625547 ) ) ( not ( = ?auto_625538 ?auto_625548 ) ) ( not ( = ?auto_625538 ?auto_625549 ) ) ( not ( = ?auto_625538 ?auto_625550 ) ) ( not ( = ?auto_625538 ?auto_625551 ) ) ( not ( = ?auto_625538 ?auto_625552 ) ) ( not ( = ?auto_625538 ?auto_625553 ) ) ( not ( = ?auto_625538 ?auto_625554 ) ) ( not ( = ?auto_625539 ?auto_625540 ) ) ( not ( = ?auto_625539 ?auto_625541 ) ) ( not ( = ?auto_625539 ?auto_625542 ) ) ( not ( = ?auto_625539 ?auto_625543 ) ) ( not ( = ?auto_625539 ?auto_625544 ) ) ( not ( = ?auto_625539 ?auto_625545 ) ) ( not ( = ?auto_625539 ?auto_625546 ) ) ( not ( = ?auto_625539 ?auto_625547 ) ) ( not ( = ?auto_625539 ?auto_625548 ) ) ( not ( = ?auto_625539 ?auto_625549 ) ) ( not ( = ?auto_625539 ?auto_625550 ) ) ( not ( = ?auto_625539 ?auto_625551 ) ) ( not ( = ?auto_625539 ?auto_625552 ) ) ( not ( = ?auto_625539 ?auto_625553 ) ) ( not ( = ?auto_625539 ?auto_625554 ) ) ( not ( = ?auto_625540 ?auto_625541 ) ) ( not ( = ?auto_625540 ?auto_625542 ) ) ( not ( = ?auto_625540 ?auto_625543 ) ) ( not ( = ?auto_625540 ?auto_625544 ) ) ( not ( = ?auto_625540 ?auto_625545 ) ) ( not ( = ?auto_625540 ?auto_625546 ) ) ( not ( = ?auto_625540 ?auto_625547 ) ) ( not ( = ?auto_625540 ?auto_625548 ) ) ( not ( = ?auto_625540 ?auto_625549 ) ) ( not ( = ?auto_625540 ?auto_625550 ) ) ( not ( = ?auto_625540 ?auto_625551 ) ) ( not ( = ?auto_625540 ?auto_625552 ) ) ( not ( = ?auto_625540 ?auto_625553 ) ) ( not ( = ?auto_625540 ?auto_625554 ) ) ( not ( = ?auto_625541 ?auto_625542 ) ) ( not ( = ?auto_625541 ?auto_625543 ) ) ( not ( = ?auto_625541 ?auto_625544 ) ) ( not ( = ?auto_625541 ?auto_625545 ) ) ( not ( = ?auto_625541 ?auto_625546 ) ) ( not ( = ?auto_625541 ?auto_625547 ) ) ( not ( = ?auto_625541 ?auto_625548 ) ) ( not ( = ?auto_625541 ?auto_625549 ) ) ( not ( = ?auto_625541 ?auto_625550 ) ) ( not ( = ?auto_625541 ?auto_625551 ) ) ( not ( = ?auto_625541 ?auto_625552 ) ) ( not ( = ?auto_625541 ?auto_625553 ) ) ( not ( = ?auto_625541 ?auto_625554 ) ) ( not ( = ?auto_625542 ?auto_625543 ) ) ( not ( = ?auto_625542 ?auto_625544 ) ) ( not ( = ?auto_625542 ?auto_625545 ) ) ( not ( = ?auto_625542 ?auto_625546 ) ) ( not ( = ?auto_625542 ?auto_625547 ) ) ( not ( = ?auto_625542 ?auto_625548 ) ) ( not ( = ?auto_625542 ?auto_625549 ) ) ( not ( = ?auto_625542 ?auto_625550 ) ) ( not ( = ?auto_625542 ?auto_625551 ) ) ( not ( = ?auto_625542 ?auto_625552 ) ) ( not ( = ?auto_625542 ?auto_625553 ) ) ( not ( = ?auto_625542 ?auto_625554 ) ) ( not ( = ?auto_625543 ?auto_625544 ) ) ( not ( = ?auto_625543 ?auto_625545 ) ) ( not ( = ?auto_625543 ?auto_625546 ) ) ( not ( = ?auto_625543 ?auto_625547 ) ) ( not ( = ?auto_625543 ?auto_625548 ) ) ( not ( = ?auto_625543 ?auto_625549 ) ) ( not ( = ?auto_625543 ?auto_625550 ) ) ( not ( = ?auto_625543 ?auto_625551 ) ) ( not ( = ?auto_625543 ?auto_625552 ) ) ( not ( = ?auto_625543 ?auto_625553 ) ) ( not ( = ?auto_625543 ?auto_625554 ) ) ( not ( = ?auto_625544 ?auto_625545 ) ) ( not ( = ?auto_625544 ?auto_625546 ) ) ( not ( = ?auto_625544 ?auto_625547 ) ) ( not ( = ?auto_625544 ?auto_625548 ) ) ( not ( = ?auto_625544 ?auto_625549 ) ) ( not ( = ?auto_625544 ?auto_625550 ) ) ( not ( = ?auto_625544 ?auto_625551 ) ) ( not ( = ?auto_625544 ?auto_625552 ) ) ( not ( = ?auto_625544 ?auto_625553 ) ) ( not ( = ?auto_625544 ?auto_625554 ) ) ( not ( = ?auto_625545 ?auto_625546 ) ) ( not ( = ?auto_625545 ?auto_625547 ) ) ( not ( = ?auto_625545 ?auto_625548 ) ) ( not ( = ?auto_625545 ?auto_625549 ) ) ( not ( = ?auto_625545 ?auto_625550 ) ) ( not ( = ?auto_625545 ?auto_625551 ) ) ( not ( = ?auto_625545 ?auto_625552 ) ) ( not ( = ?auto_625545 ?auto_625553 ) ) ( not ( = ?auto_625545 ?auto_625554 ) ) ( not ( = ?auto_625546 ?auto_625547 ) ) ( not ( = ?auto_625546 ?auto_625548 ) ) ( not ( = ?auto_625546 ?auto_625549 ) ) ( not ( = ?auto_625546 ?auto_625550 ) ) ( not ( = ?auto_625546 ?auto_625551 ) ) ( not ( = ?auto_625546 ?auto_625552 ) ) ( not ( = ?auto_625546 ?auto_625553 ) ) ( not ( = ?auto_625546 ?auto_625554 ) ) ( not ( = ?auto_625547 ?auto_625548 ) ) ( not ( = ?auto_625547 ?auto_625549 ) ) ( not ( = ?auto_625547 ?auto_625550 ) ) ( not ( = ?auto_625547 ?auto_625551 ) ) ( not ( = ?auto_625547 ?auto_625552 ) ) ( not ( = ?auto_625547 ?auto_625553 ) ) ( not ( = ?auto_625547 ?auto_625554 ) ) ( not ( = ?auto_625548 ?auto_625549 ) ) ( not ( = ?auto_625548 ?auto_625550 ) ) ( not ( = ?auto_625548 ?auto_625551 ) ) ( not ( = ?auto_625548 ?auto_625552 ) ) ( not ( = ?auto_625548 ?auto_625553 ) ) ( not ( = ?auto_625548 ?auto_625554 ) ) ( not ( = ?auto_625549 ?auto_625550 ) ) ( not ( = ?auto_625549 ?auto_625551 ) ) ( not ( = ?auto_625549 ?auto_625552 ) ) ( not ( = ?auto_625549 ?auto_625553 ) ) ( not ( = ?auto_625549 ?auto_625554 ) ) ( not ( = ?auto_625550 ?auto_625551 ) ) ( not ( = ?auto_625550 ?auto_625552 ) ) ( not ( = ?auto_625550 ?auto_625553 ) ) ( not ( = ?auto_625550 ?auto_625554 ) ) ( not ( = ?auto_625551 ?auto_625552 ) ) ( not ( = ?auto_625551 ?auto_625553 ) ) ( not ( = ?auto_625551 ?auto_625554 ) ) ( not ( = ?auto_625552 ?auto_625553 ) ) ( not ( = ?auto_625552 ?auto_625554 ) ) ( not ( = ?auto_625553 ?auto_625554 ) ) ( CLEAR ?auto_625551 ) ( ON ?auto_625552 ?auto_625553 ) ( CLEAR ?auto_625552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_625538 ?auto_625539 ?auto_625540 ?auto_625541 ?auto_625542 ?auto_625543 ?auto_625544 ?auto_625545 ?auto_625546 ?auto_625547 ?auto_625548 ?auto_625549 ?auto_625550 ?auto_625551 ?auto_625552 )
      ( MAKE-16PILE ?auto_625538 ?auto_625539 ?auto_625540 ?auto_625541 ?auto_625542 ?auto_625543 ?auto_625544 ?auto_625545 ?auto_625546 ?auto_625547 ?auto_625548 ?auto_625549 ?auto_625550 ?auto_625551 ?auto_625552 ?auto_625553 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625604 - BLOCK
      ?auto_625605 - BLOCK
      ?auto_625606 - BLOCK
      ?auto_625607 - BLOCK
      ?auto_625608 - BLOCK
      ?auto_625609 - BLOCK
      ?auto_625610 - BLOCK
      ?auto_625611 - BLOCK
      ?auto_625612 - BLOCK
      ?auto_625613 - BLOCK
      ?auto_625614 - BLOCK
      ?auto_625615 - BLOCK
      ?auto_625616 - BLOCK
      ?auto_625617 - BLOCK
      ?auto_625618 - BLOCK
      ?auto_625619 - BLOCK
    )
    :vars
    (
      ?auto_625620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625619 ?auto_625620 ) ( ON-TABLE ?auto_625604 ) ( ON ?auto_625605 ?auto_625604 ) ( ON ?auto_625606 ?auto_625605 ) ( ON ?auto_625607 ?auto_625606 ) ( ON ?auto_625608 ?auto_625607 ) ( ON ?auto_625609 ?auto_625608 ) ( ON ?auto_625610 ?auto_625609 ) ( ON ?auto_625611 ?auto_625610 ) ( ON ?auto_625612 ?auto_625611 ) ( ON ?auto_625613 ?auto_625612 ) ( ON ?auto_625614 ?auto_625613 ) ( ON ?auto_625615 ?auto_625614 ) ( ON ?auto_625616 ?auto_625615 ) ( not ( = ?auto_625604 ?auto_625605 ) ) ( not ( = ?auto_625604 ?auto_625606 ) ) ( not ( = ?auto_625604 ?auto_625607 ) ) ( not ( = ?auto_625604 ?auto_625608 ) ) ( not ( = ?auto_625604 ?auto_625609 ) ) ( not ( = ?auto_625604 ?auto_625610 ) ) ( not ( = ?auto_625604 ?auto_625611 ) ) ( not ( = ?auto_625604 ?auto_625612 ) ) ( not ( = ?auto_625604 ?auto_625613 ) ) ( not ( = ?auto_625604 ?auto_625614 ) ) ( not ( = ?auto_625604 ?auto_625615 ) ) ( not ( = ?auto_625604 ?auto_625616 ) ) ( not ( = ?auto_625604 ?auto_625617 ) ) ( not ( = ?auto_625604 ?auto_625618 ) ) ( not ( = ?auto_625604 ?auto_625619 ) ) ( not ( = ?auto_625604 ?auto_625620 ) ) ( not ( = ?auto_625605 ?auto_625606 ) ) ( not ( = ?auto_625605 ?auto_625607 ) ) ( not ( = ?auto_625605 ?auto_625608 ) ) ( not ( = ?auto_625605 ?auto_625609 ) ) ( not ( = ?auto_625605 ?auto_625610 ) ) ( not ( = ?auto_625605 ?auto_625611 ) ) ( not ( = ?auto_625605 ?auto_625612 ) ) ( not ( = ?auto_625605 ?auto_625613 ) ) ( not ( = ?auto_625605 ?auto_625614 ) ) ( not ( = ?auto_625605 ?auto_625615 ) ) ( not ( = ?auto_625605 ?auto_625616 ) ) ( not ( = ?auto_625605 ?auto_625617 ) ) ( not ( = ?auto_625605 ?auto_625618 ) ) ( not ( = ?auto_625605 ?auto_625619 ) ) ( not ( = ?auto_625605 ?auto_625620 ) ) ( not ( = ?auto_625606 ?auto_625607 ) ) ( not ( = ?auto_625606 ?auto_625608 ) ) ( not ( = ?auto_625606 ?auto_625609 ) ) ( not ( = ?auto_625606 ?auto_625610 ) ) ( not ( = ?auto_625606 ?auto_625611 ) ) ( not ( = ?auto_625606 ?auto_625612 ) ) ( not ( = ?auto_625606 ?auto_625613 ) ) ( not ( = ?auto_625606 ?auto_625614 ) ) ( not ( = ?auto_625606 ?auto_625615 ) ) ( not ( = ?auto_625606 ?auto_625616 ) ) ( not ( = ?auto_625606 ?auto_625617 ) ) ( not ( = ?auto_625606 ?auto_625618 ) ) ( not ( = ?auto_625606 ?auto_625619 ) ) ( not ( = ?auto_625606 ?auto_625620 ) ) ( not ( = ?auto_625607 ?auto_625608 ) ) ( not ( = ?auto_625607 ?auto_625609 ) ) ( not ( = ?auto_625607 ?auto_625610 ) ) ( not ( = ?auto_625607 ?auto_625611 ) ) ( not ( = ?auto_625607 ?auto_625612 ) ) ( not ( = ?auto_625607 ?auto_625613 ) ) ( not ( = ?auto_625607 ?auto_625614 ) ) ( not ( = ?auto_625607 ?auto_625615 ) ) ( not ( = ?auto_625607 ?auto_625616 ) ) ( not ( = ?auto_625607 ?auto_625617 ) ) ( not ( = ?auto_625607 ?auto_625618 ) ) ( not ( = ?auto_625607 ?auto_625619 ) ) ( not ( = ?auto_625607 ?auto_625620 ) ) ( not ( = ?auto_625608 ?auto_625609 ) ) ( not ( = ?auto_625608 ?auto_625610 ) ) ( not ( = ?auto_625608 ?auto_625611 ) ) ( not ( = ?auto_625608 ?auto_625612 ) ) ( not ( = ?auto_625608 ?auto_625613 ) ) ( not ( = ?auto_625608 ?auto_625614 ) ) ( not ( = ?auto_625608 ?auto_625615 ) ) ( not ( = ?auto_625608 ?auto_625616 ) ) ( not ( = ?auto_625608 ?auto_625617 ) ) ( not ( = ?auto_625608 ?auto_625618 ) ) ( not ( = ?auto_625608 ?auto_625619 ) ) ( not ( = ?auto_625608 ?auto_625620 ) ) ( not ( = ?auto_625609 ?auto_625610 ) ) ( not ( = ?auto_625609 ?auto_625611 ) ) ( not ( = ?auto_625609 ?auto_625612 ) ) ( not ( = ?auto_625609 ?auto_625613 ) ) ( not ( = ?auto_625609 ?auto_625614 ) ) ( not ( = ?auto_625609 ?auto_625615 ) ) ( not ( = ?auto_625609 ?auto_625616 ) ) ( not ( = ?auto_625609 ?auto_625617 ) ) ( not ( = ?auto_625609 ?auto_625618 ) ) ( not ( = ?auto_625609 ?auto_625619 ) ) ( not ( = ?auto_625609 ?auto_625620 ) ) ( not ( = ?auto_625610 ?auto_625611 ) ) ( not ( = ?auto_625610 ?auto_625612 ) ) ( not ( = ?auto_625610 ?auto_625613 ) ) ( not ( = ?auto_625610 ?auto_625614 ) ) ( not ( = ?auto_625610 ?auto_625615 ) ) ( not ( = ?auto_625610 ?auto_625616 ) ) ( not ( = ?auto_625610 ?auto_625617 ) ) ( not ( = ?auto_625610 ?auto_625618 ) ) ( not ( = ?auto_625610 ?auto_625619 ) ) ( not ( = ?auto_625610 ?auto_625620 ) ) ( not ( = ?auto_625611 ?auto_625612 ) ) ( not ( = ?auto_625611 ?auto_625613 ) ) ( not ( = ?auto_625611 ?auto_625614 ) ) ( not ( = ?auto_625611 ?auto_625615 ) ) ( not ( = ?auto_625611 ?auto_625616 ) ) ( not ( = ?auto_625611 ?auto_625617 ) ) ( not ( = ?auto_625611 ?auto_625618 ) ) ( not ( = ?auto_625611 ?auto_625619 ) ) ( not ( = ?auto_625611 ?auto_625620 ) ) ( not ( = ?auto_625612 ?auto_625613 ) ) ( not ( = ?auto_625612 ?auto_625614 ) ) ( not ( = ?auto_625612 ?auto_625615 ) ) ( not ( = ?auto_625612 ?auto_625616 ) ) ( not ( = ?auto_625612 ?auto_625617 ) ) ( not ( = ?auto_625612 ?auto_625618 ) ) ( not ( = ?auto_625612 ?auto_625619 ) ) ( not ( = ?auto_625612 ?auto_625620 ) ) ( not ( = ?auto_625613 ?auto_625614 ) ) ( not ( = ?auto_625613 ?auto_625615 ) ) ( not ( = ?auto_625613 ?auto_625616 ) ) ( not ( = ?auto_625613 ?auto_625617 ) ) ( not ( = ?auto_625613 ?auto_625618 ) ) ( not ( = ?auto_625613 ?auto_625619 ) ) ( not ( = ?auto_625613 ?auto_625620 ) ) ( not ( = ?auto_625614 ?auto_625615 ) ) ( not ( = ?auto_625614 ?auto_625616 ) ) ( not ( = ?auto_625614 ?auto_625617 ) ) ( not ( = ?auto_625614 ?auto_625618 ) ) ( not ( = ?auto_625614 ?auto_625619 ) ) ( not ( = ?auto_625614 ?auto_625620 ) ) ( not ( = ?auto_625615 ?auto_625616 ) ) ( not ( = ?auto_625615 ?auto_625617 ) ) ( not ( = ?auto_625615 ?auto_625618 ) ) ( not ( = ?auto_625615 ?auto_625619 ) ) ( not ( = ?auto_625615 ?auto_625620 ) ) ( not ( = ?auto_625616 ?auto_625617 ) ) ( not ( = ?auto_625616 ?auto_625618 ) ) ( not ( = ?auto_625616 ?auto_625619 ) ) ( not ( = ?auto_625616 ?auto_625620 ) ) ( not ( = ?auto_625617 ?auto_625618 ) ) ( not ( = ?auto_625617 ?auto_625619 ) ) ( not ( = ?auto_625617 ?auto_625620 ) ) ( not ( = ?auto_625618 ?auto_625619 ) ) ( not ( = ?auto_625618 ?auto_625620 ) ) ( not ( = ?auto_625619 ?auto_625620 ) ) ( ON ?auto_625618 ?auto_625619 ) ( CLEAR ?auto_625616 ) ( ON ?auto_625617 ?auto_625618 ) ( CLEAR ?auto_625617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_625604 ?auto_625605 ?auto_625606 ?auto_625607 ?auto_625608 ?auto_625609 ?auto_625610 ?auto_625611 ?auto_625612 ?auto_625613 ?auto_625614 ?auto_625615 ?auto_625616 ?auto_625617 )
      ( MAKE-16PILE ?auto_625604 ?auto_625605 ?auto_625606 ?auto_625607 ?auto_625608 ?auto_625609 ?auto_625610 ?auto_625611 ?auto_625612 ?auto_625613 ?auto_625614 ?auto_625615 ?auto_625616 ?auto_625617 ?auto_625618 ?auto_625619 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625670 - BLOCK
      ?auto_625671 - BLOCK
      ?auto_625672 - BLOCK
      ?auto_625673 - BLOCK
      ?auto_625674 - BLOCK
      ?auto_625675 - BLOCK
      ?auto_625676 - BLOCK
      ?auto_625677 - BLOCK
      ?auto_625678 - BLOCK
      ?auto_625679 - BLOCK
      ?auto_625680 - BLOCK
      ?auto_625681 - BLOCK
      ?auto_625682 - BLOCK
      ?auto_625683 - BLOCK
      ?auto_625684 - BLOCK
      ?auto_625685 - BLOCK
    )
    :vars
    (
      ?auto_625686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625685 ?auto_625686 ) ( ON-TABLE ?auto_625670 ) ( ON ?auto_625671 ?auto_625670 ) ( ON ?auto_625672 ?auto_625671 ) ( ON ?auto_625673 ?auto_625672 ) ( ON ?auto_625674 ?auto_625673 ) ( ON ?auto_625675 ?auto_625674 ) ( ON ?auto_625676 ?auto_625675 ) ( ON ?auto_625677 ?auto_625676 ) ( ON ?auto_625678 ?auto_625677 ) ( ON ?auto_625679 ?auto_625678 ) ( ON ?auto_625680 ?auto_625679 ) ( ON ?auto_625681 ?auto_625680 ) ( not ( = ?auto_625670 ?auto_625671 ) ) ( not ( = ?auto_625670 ?auto_625672 ) ) ( not ( = ?auto_625670 ?auto_625673 ) ) ( not ( = ?auto_625670 ?auto_625674 ) ) ( not ( = ?auto_625670 ?auto_625675 ) ) ( not ( = ?auto_625670 ?auto_625676 ) ) ( not ( = ?auto_625670 ?auto_625677 ) ) ( not ( = ?auto_625670 ?auto_625678 ) ) ( not ( = ?auto_625670 ?auto_625679 ) ) ( not ( = ?auto_625670 ?auto_625680 ) ) ( not ( = ?auto_625670 ?auto_625681 ) ) ( not ( = ?auto_625670 ?auto_625682 ) ) ( not ( = ?auto_625670 ?auto_625683 ) ) ( not ( = ?auto_625670 ?auto_625684 ) ) ( not ( = ?auto_625670 ?auto_625685 ) ) ( not ( = ?auto_625670 ?auto_625686 ) ) ( not ( = ?auto_625671 ?auto_625672 ) ) ( not ( = ?auto_625671 ?auto_625673 ) ) ( not ( = ?auto_625671 ?auto_625674 ) ) ( not ( = ?auto_625671 ?auto_625675 ) ) ( not ( = ?auto_625671 ?auto_625676 ) ) ( not ( = ?auto_625671 ?auto_625677 ) ) ( not ( = ?auto_625671 ?auto_625678 ) ) ( not ( = ?auto_625671 ?auto_625679 ) ) ( not ( = ?auto_625671 ?auto_625680 ) ) ( not ( = ?auto_625671 ?auto_625681 ) ) ( not ( = ?auto_625671 ?auto_625682 ) ) ( not ( = ?auto_625671 ?auto_625683 ) ) ( not ( = ?auto_625671 ?auto_625684 ) ) ( not ( = ?auto_625671 ?auto_625685 ) ) ( not ( = ?auto_625671 ?auto_625686 ) ) ( not ( = ?auto_625672 ?auto_625673 ) ) ( not ( = ?auto_625672 ?auto_625674 ) ) ( not ( = ?auto_625672 ?auto_625675 ) ) ( not ( = ?auto_625672 ?auto_625676 ) ) ( not ( = ?auto_625672 ?auto_625677 ) ) ( not ( = ?auto_625672 ?auto_625678 ) ) ( not ( = ?auto_625672 ?auto_625679 ) ) ( not ( = ?auto_625672 ?auto_625680 ) ) ( not ( = ?auto_625672 ?auto_625681 ) ) ( not ( = ?auto_625672 ?auto_625682 ) ) ( not ( = ?auto_625672 ?auto_625683 ) ) ( not ( = ?auto_625672 ?auto_625684 ) ) ( not ( = ?auto_625672 ?auto_625685 ) ) ( not ( = ?auto_625672 ?auto_625686 ) ) ( not ( = ?auto_625673 ?auto_625674 ) ) ( not ( = ?auto_625673 ?auto_625675 ) ) ( not ( = ?auto_625673 ?auto_625676 ) ) ( not ( = ?auto_625673 ?auto_625677 ) ) ( not ( = ?auto_625673 ?auto_625678 ) ) ( not ( = ?auto_625673 ?auto_625679 ) ) ( not ( = ?auto_625673 ?auto_625680 ) ) ( not ( = ?auto_625673 ?auto_625681 ) ) ( not ( = ?auto_625673 ?auto_625682 ) ) ( not ( = ?auto_625673 ?auto_625683 ) ) ( not ( = ?auto_625673 ?auto_625684 ) ) ( not ( = ?auto_625673 ?auto_625685 ) ) ( not ( = ?auto_625673 ?auto_625686 ) ) ( not ( = ?auto_625674 ?auto_625675 ) ) ( not ( = ?auto_625674 ?auto_625676 ) ) ( not ( = ?auto_625674 ?auto_625677 ) ) ( not ( = ?auto_625674 ?auto_625678 ) ) ( not ( = ?auto_625674 ?auto_625679 ) ) ( not ( = ?auto_625674 ?auto_625680 ) ) ( not ( = ?auto_625674 ?auto_625681 ) ) ( not ( = ?auto_625674 ?auto_625682 ) ) ( not ( = ?auto_625674 ?auto_625683 ) ) ( not ( = ?auto_625674 ?auto_625684 ) ) ( not ( = ?auto_625674 ?auto_625685 ) ) ( not ( = ?auto_625674 ?auto_625686 ) ) ( not ( = ?auto_625675 ?auto_625676 ) ) ( not ( = ?auto_625675 ?auto_625677 ) ) ( not ( = ?auto_625675 ?auto_625678 ) ) ( not ( = ?auto_625675 ?auto_625679 ) ) ( not ( = ?auto_625675 ?auto_625680 ) ) ( not ( = ?auto_625675 ?auto_625681 ) ) ( not ( = ?auto_625675 ?auto_625682 ) ) ( not ( = ?auto_625675 ?auto_625683 ) ) ( not ( = ?auto_625675 ?auto_625684 ) ) ( not ( = ?auto_625675 ?auto_625685 ) ) ( not ( = ?auto_625675 ?auto_625686 ) ) ( not ( = ?auto_625676 ?auto_625677 ) ) ( not ( = ?auto_625676 ?auto_625678 ) ) ( not ( = ?auto_625676 ?auto_625679 ) ) ( not ( = ?auto_625676 ?auto_625680 ) ) ( not ( = ?auto_625676 ?auto_625681 ) ) ( not ( = ?auto_625676 ?auto_625682 ) ) ( not ( = ?auto_625676 ?auto_625683 ) ) ( not ( = ?auto_625676 ?auto_625684 ) ) ( not ( = ?auto_625676 ?auto_625685 ) ) ( not ( = ?auto_625676 ?auto_625686 ) ) ( not ( = ?auto_625677 ?auto_625678 ) ) ( not ( = ?auto_625677 ?auto_625679 ) ) ( not ( = ?auto_625677 ?auto_625680 ) ) ( not ( = ?auto_625677 ?auto_625681 ) ) ( not ( = ?auto_625677 ?auto_625682 ) ) ( not ( = ?auto_625677 ?auto_625683 ) ) ( not ( = ?auto_625677 ?auto_625684 ) ) ( not ( = ?auto_625677 ?auto_625685 ) ) ( not ( = ?auto_625677 ?auto_625686 ) ) ( not ( = ?auto_625678 ?auto_625679 ) ) ( not ( = ?auto_625678 ?auto_625680 ) ) ( not ( = ?auto_625678 ?auto_625681 ) ) ( not ( = ?auto_625678 ?auto_625682 ) ) ( not ( = ?auto_625678 ?auto_625683 ) ) ( not ( = ?auto_625678 ?auto_625684 ) ) ( not ( = ?auto_625678 ?auto_625685 ) ) ( not ( = ?auto_625678 ?auto_625686 ) ) ( not ( = ?auto_625679 ?auto_625680 ) ) ( not ( = ?auto_625679 ?auto_625681 ) ) ( not ( = ?auto_625679 ?auto_625682 ) ) ( not ( = ?auto_625679 ?auto_625683 ) ) ( not ( = ?auto_625679 ?auto_625684 ) ) ( not ( = ?auto_625679 ?auto_625685 ) ) ( not ( = ?auto_625679 ?auto_625686 ) ) ( not ( = ?auto_625680 ?auto_625681 ) ) ( not ( = ?auto_625680 ?auto_625682 ) ) ( not ( = ?auto_625680 ?auto_625683 ) ) ( not ( = ?auto_625680 ?auto_625684 ) ) ( not ( = ?auto_625680 ?auto_625685 ) ) ( not ( = ?auto_625680 ?auto_625686 ) ) ( not ( = ?auto_625681 ?auto_625682 ) ) ( not ( = ?auto_625681 ?auto_625683 ) ) ( not ( = ?auto_625681 ?auto_625684 ) ) ( not ( = ?auto_625681 ?auto_625685 ) ) ( not ( = ?auto_625681 ?auto_625686 ) ) ( not ( = ?auto_625682 ?auto_625683 ) ) ( not ( = ?auto_625682 ?auto_625684 ) ) ( not ( = ?auto_625682 ?auto_625685 ) ) ( not ( = ?auto_625682 ?auto_625686 ) ) ( not ( = ?auto_625683 ?auto_625684 ) ) ( not ( = ?auto_625683 ?auto_625685 ) ) ( not ( = ?auto_625683 ?auto_625686 ) ) ( not ( = ?auto_625684 ?auto_625685 ) ) ( not ( = ?auto_625684 ?auto_625686 ) ) ( not ( = ?auto_625685 ?auto_625686 ) ) ( ON ?auto_625684 ?auto_625685 ) ( ON ?auto_625683 ?auto_625684 ) ( CLEAR ?auto_625681 ) ( ON ?auto_625682 ?auto_625683 ) ( CLEAR ?auto_625682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_625670 ?auto_625671 ?auto_625672 ?auto_625673 ?auto_625674 ?auto_625675 ?auto_625676 ?auto_625677 ?auto_625678 ?auto_625679 ?auto_625680 ?auto_625681 ?auto_625682 )
      ( MAKE-16PILE ?auto_625670 ?auto_625671 ?auto_625672 ?auto_625673 ?auto_625674 ?auto_625675 ?auto_625676 ?auto_625677 ?auto_625678 ?auto_625679 ?auto_625680 ?auto_625681 ?auto_625682 ?auto_625683 ?auto_625684 ?auto_625685 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625736 - BLOCK
      ?auto_625737 - BLOCK
      ?auto_625738 - BLOCK
      ?auto_625739 - BLOCK
      ?auto_625740 - BLOCK
      ?auto_625741 - BLOCK
      ?auto_625742 - BLOCK
      ?auto_625743 - BLOCK
      ?auto_625744 - BLOCK
      ?auto_625745 - BLOCK
      ?auto_625746 - BLOCK
      ?auto_625747 - BLOCK
      ?auto_625748 - BLOCK
      ?auto_625749 - BLOCK
      ?auto_625750 - BLOCK
      ?auto_625751 - BLOCK
    )
    :vars
    (
      ?auto_625752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625751 ?auto_625752 ) ( ON-TABLE ?auto_625736 ) ( ON ?auto_625737 ?auto_625736 ) ( ON ?auto_625738 ?auto_625737 ) ( ON ?auto_625739 ?auto_625738 ) ( ON ?auto_625740 ?auto_625739 ) ( ON ?auto_625741 ?auto_625740 ) ( ON ?auto_625742 ?auto_625741 ) ( ON ?auto_625743 ?auto_625742 ) ( ON ?auto_625744 ?auto_625743 ) ( ON ?auto_625745 ?auto_625744 ) ( ON ?auto_625746 ?auto_625745 ) ( not ( = ?auto_625736 ?auto_625737 ) ) ( not ( = ?auto_625736 ?auto_625738 ) ) ( not ( = ?auto_625736 ?auto_625739 ) ) ( not ( = ?auto_625736 ?auto_625740 ) ) ( not ( = ?auto_625736 ?auto_625741 ) ) ( not ( = ?auto_625736 ?auto_625742 ) ) ( not ( = ?auto_625736 ?auto_625743 ) ) ( not ( = ?auto_625736 ?auto_625744 ) ) ( not ( = ?auto_625736 ?auto_625745 ) ) ( not ( = ?auto_625736 ?auto_625746 ) ) ( not ( = ?auto_625736 ?auto_625747 ) ) ( not ( = ?auto_625736 ?auto_625748 ) ) ( not ( = ?auto_625736 ?auto_625749 ) ) ( not ( = ?auto_625736 ?auto_625750 ) ) ( not ( = ?auto_625736 ?auto_625751 ) ) ( not ( = ?auto_625736 ?auto_625752 ) ) ( not ( = ?auto_625737 ?auto_625738 ) ) ( not ( = ?auto_625737 ?auto_625739 ) ) ( not ( = ?auto_625737 ?auto_625740 ) ) ( not ( = ?auto_625737 ?auto_625741 ) ) ( not ( = ?auto_625737 ?auto_625742 ) ) ( not ( = ?auto_625737 ?auto_625743 ) ) ( not ( = ?auto_625737 ?auto_625744 ) ) ( not ( = ?auto_625737 ?auto_625745 ) ) ( not ( = ?auto_625737 ?auto_625746 ) ) ( not ( = ?auto_625737 ?auto_625747 ) ) ( not ( = ?auto_625737 ?auto_625748 ) ) ( not ( = ?auto_625737 ?auto_625749 ) ) ( not ( = ?auto_625737 ?auto_625750 ) ) ( not ( = ?auto_625737 ?auto_625751 ) ) ( not ( = ?auto_625737 ?auto_625752 ) ) ( not ( = ?auto_625738 ?auto_625739 ) ) ( not ( = ?auto_625738 ?auto_625740 ) ) ( not ( = ?auto_625738 ?auto_625741 ) ) ( not ( = ?auto_625738 ?auto_625742 ) ) ( not ( = ?auto_625738 ?auto_625743 ) ) ( not ( = ?auto_625738 ?auto_625744 ) ) ( not ( = ?auto_625738 ?auto_625745 ) ) ( not ( = ?auto_625738 ?auto_625746 ) ) ( not ( = ?auto_625738 ?auto_625747 ) ) ( not ( = ?auto_625738 ?auto_625748 ) ) ( not ( = ?auto_625738 ?auto_625749 ) ) ( not ( = ?auto_625738 ?auto_625750 ) ) ( not ( = ?auto_625738 ?auto_625751 ) ) ( not ( = ?auto_625738 ?auto_625752 ) ) ( not ( = ?auto_625739 ?auto_625740 ) ) ( not ( = ?auto_625739 ?auto_625741 ) ) ( not ( = ?auto_625739 ?auto_625742 ) ) ( not ( = ?auto_625739 ?auto_625743 ) ) ( not ( = ?auto_625739 ?auto_625744 ) ) ( not ( = ?auto_625739 ?auto_625745 ) ) ( not ( = ?auto_625739 ?auto_625746 ) ) ( not ( = ?auto_625739 ?auto_625747 ) ) ( not ( = ?auto_625739 ?auto_625748 ) ) ( not ( = ?auto_625739 ?auto_625749 ) ) ( not ( = ?auto_625739 ?auto_625750 ) ) ( not ( = ?auto_625739 ?auto_625751 ) ) ( not ( = ?auto_625739 ?auto_625752 ) ) ( not ( = ?auto_625740 ?auto_625741 ) ) ( not ( = ?auto_625740 ?auto_625742 ) ) ( not ( = ?auto_625740 ?auto_625743 ) ) ( not ( = ?auto_625740 ?auto_625744 ) ) ( not ( = ?auto_625740 ?auto_625745 ) ) ( not ( = ?auto_625740 ?auto_625746 ) ) ( not ( = ?auto_625740 ?auto_625747 ) ) ( not ( = ?auto_625740 ?auto_625748 ) ) ( not ( = ?auto_625740 ?auto_625749 ) ) ( not ( = ?auto_625740 ?auto_625750 ) ) ( not ( = ?auto_625740 ?auto_625751 ) ) ( not ( = ?auto_625740 ?auto_625752 ) ) ( not ( = ?auto_625741 ?auto_625742 ) ) ( not ( = ?auto_625741 ?auto_625743 ) ) ( not ( = ?auto_625741 ?auto_625744 ) ) ( not ( = ?auto_625741 ?auto_625745 ) ) ( not ( = ?auto_625741 ?auto_625746 ) ) ( not ( = ?auto_625741 ?auto_625747 ) ) ( not ( = ?auto_625741 ?auto_625748 ) ) ( not ( = ?auto_625741 ?auto_625749 ) ) ( not ( = ?auto_625741 ?auto_625750 ) ) ( not ( = ?auto_625741 ?auto_625751 ) ) ( not ( = ?auto_625741 ?auto_625752 ) ) ( not ( = ?auto_625742 ?auto_625743 ) ) ( not ( = ?auto_625742 ?auto_625744 ) ) ( not ( = ?auto_625742 ?auto_625745 ) ) ( not ( = ?auto_625742 ?auto_625746 ) ) ( not ( = ?auto_625742 ?auto_625747 ) ) ( not ( = ?auto_625742 ?auto_625748 ) ) ( not ( = ?auto_625742 ?auto_625749 ) ) ( not ( = ?auto_625742 ?auto_625750 ) ) ( not ( = ?auto_625742 ?auto_625751 ) ) ( not ( = ?auto_625742 ?auto_625752 ) ) ( not ( = ?auto_625743 ?auto_625744 ) ) ( not ( = ?auto_625743 ?auto_625745 ) ) ( not ( = ?auto_625743 ?auto_625746 ) ) ( not ( = ?auto_625743 ?auto_625747 ) ) ( not ( = ?auto_625743 ?auto_625748 ) ) ( not ( = ?auto_625743 ?auto_625749 ) ) ( not ( = ?auto_625743 ?auto_625750 ) ) ( not ( = ?auto_625743 ?auto_625751 ) ) ( not ( = ?auto_625743 ?auto_625752 ) ) ( not ( = ?auto_625744 ?auto_625745 ) ) ( not ( = ?auto_625744 ?auto_625746 ) ) ( not ( = ?auto_625744 ?auto_625747 ) ) ( not ( = ?auto_625744 ?auto_625748 ) ) ( not ( = ?auto_625744 ?auto_625749 ) ) ( not ( = ?auto_625744 ?auto_625750 ) ) ( not ( = ?auto_625744 ?auto_625751 ) ) ( not ( = ?auto_625744 ?auto_625752 ) ) ( not ( = ?auto_625745 ?auto_625746 ) ) ( not ( = ?auto_625745 ?auto_625747 ) ) ( not ( = ?auto_625745 ?auto_625748 ) ) ( not ( = ?auto_625745 ?auto_625749 ) ) ( not ( = ?auto_625745 ?auto_625750 ) ) ( not ( = ?auto_625745 ?auto_625751 ) ) ( not ( = ?auto_625745 ?auto_625752 ) ) ( not ( = ?auto_625746 ?auto_625747 ) ) ( not ( = ?auto_625746 ?auto_625748 ) ) ( not ( = ?auto_625746 ?auto_625749 ) ) ( not ( = ?auto_625746 ?auto_625750 ) ) ( not ( = ?auto_625746 ?auto_625751 ) ) ( not ( = ?auto_625746 ?auto_625752 ) ) ( not ( = ?auto_625747 ?auto_625748 ) ) ( not ( = ?auto_625747 ?auto_625749 ) ) ( not ( = ?auto_625747 ?auto_625750 ) ) ( not ( = ?auto_625747 ?auto_625751 ) ) ( not ( = ?auto_625747 ?auto_625752 ) ) ( not ( = ?auto_625748 ?auto_625749 ) ) ( not ( = ?auto_625748 ?auto_625750 ) ) ( not ( = ?auto_625748 ?auto_625751 ) ) ( not ( = ?auto_625748 ?auto_625752 ) ) ( not ( = ?auto_625749 ?auto_625750 ) ) ( not ( = ?auto_625749 ?auto_625751 ) ) ( not ( = ?auto_625749 ?auto_625752 ) ) ( not ( = ?auto_625750 ?auto_625751 ) ) ( not ( = ?auto_625750 ?auto_625752 ) ) ( not ( = ?auto_625751 ?auto_625752 ) ) ( ON ?auto_625750 ?auto_625751 ) ( ON ?auto_625749 ?auto_625750 ) ( ON ?auto_625748 ?auto_625749 ) ( CLEAR ?auto_625746 ) ( ON ?auto_625747 ?auto_625748 ) ( CLEAR ?auto_625747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_625736 ?auto_625737 ?auto_625738 ?auto_625739 ?auto_625740 ?auto_625741 ?auto_625742 ?auto_625743 ?auto_625744 ?auto_625745 ?auto_625746 ?auto_625747 )
      ( MAKE-16PILE ?auto_625736 ?auto_625737 ?auto_625738 ?auto_625739 ?auto_625740 ?auto_625741 ?auto_625742 ?auto_625743 ?auto_625744 ?auto_625745 ?auto_625746 ?auto_625747 ?auto_625748 ?auto_625749 ?auto_625750 ?auto_625751 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625802 - BLOCK
      ?auto_625803 - BLOCK
      ?auto_625804 - BLOCK
      ?auto_625805 - BLOCK
      ?auto_625806 - BLOCK
      ?auto_625807 - BLOCK
      ?auto_625808 - BLOCK
      ?auto_625809 - BLOCK
      ?auto_625810 - BLOCK
      ?auto_625811 - BLOCK
      ?auto_625812 - BLOCK
      ?auto_625813 - BLOCK
      ?auto_625814 - BLOCK
      ?auto_625815 - BLOCK
      ?auto_625816 - BLOCK
      ?auto_625817 - BLOCK
    )
    :vars
    (
      ?auto_625818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625817 ?auto_625818 ) ( ON-TABLE ?auto_625802 ) ( ON ?auto_625803 ?auto_625802 ) ( ON ?auto_625804 ?auto_625803 ) ( ON ?auto_625805 ?auto_625804 ) ( ON ?auto_625806 ?auto_625805 ) ( ON ?auto_625807 ?auto_625806 ) ( ON ?auto_625808 ?auto_625807 ) ( ON ?auto_625809 ?auto_625808 ) ( ON ?auto_625810 ?auto_625809 ) ( ON ?auto_625811 ?auto_625810 ) ( not ( = ?auto_625802 ?auto_625803 ) ) ( not ( = ?auto_625802 ?auto_625804 ) ) ( not ( = ?auto_625802 ?auto_625805 ) ) ( not ( = ?auto_625802 ?auto_625806 ) ) ( not ( = ?auto_625802 ?auto_625807 ) ) ( not ( = ?auto_625802 ?auto_625808 ) ) ( not ( = ?auto_625802 ?auto_625809 ) ) ( not ( = ?auto_625802 ?auto_625810 ) ) ( not ( = ?auto_625802 ?auto_625811 ) ) ( not ( = ?auto_625802 ?auto_625812 ) ) ( not ( = ?auto_625802 ?auto_625813 ) ) ( not ( = ?auto_625802 ?auto_625814 ) ) ( not ( = ?auto_625802 ?auto_625815 ) ) ( not ( = ?auto_625802 ?auto_625816 ) ) ( not ( = ?auto_625802 ?auto_625817 ) ) ( not ( = ?auto_625802 ?auto_625818 ) ) ( not ( = ?auto_625803 ?auto_625804 ) ) ( not ( = ?auto_625803 ?auto_625805 ) ) ( not ( = ?auto_625803 ?auto_625806 ) ) ( not ( = ?auto_625803 ?auto_625807 ) ) ( not ( = ?auto_625803 ?auto_625808 ) ) ( not ( = ?auto_625803 ?auto_625809 ) ) ( not ( = ?auto_625803 ?auto_625810 ) ) ( not ( = ?auto_625803 ?auto_625811 ) ) ( not ( = ?auto_625803 ?auto_625812 ) ) ( not ( = ?auto_625803 ?auto_625813 ) ) ( not ( = ?auto_625803 ?auto_625814 ) ) ( not ( = ?auto_625803 ?auto_625815 ) ) ( not ( = ?auto_625803 ?auto_625816 ) ) ( not ( = ?auto_625803 ?auto_625817 ) ) ( not ( = ?auto_625803 ?auto_625818 ) ) ( not ( = ?auto_625804 ?auto_625805 ) ) ( not ( = ?auto_625804 ?auto_625806 ) ) ( not ( = ?auto_625804 ?auto_625807 ) ) ( not ( = ?auto_625804 ?auto_625808 ) ) ( not ( = ?auto_625804 ?auto_625809 ) ) ( not ( = ?auto_625804 ?auto_625810 ) ) ( not ( = ?auto_625804 ?auto_625811 ) ) ( not ( = ?auto_625804 ?auto_625812 ) ) ( not ( = ?auto_625804 ?auto_625813 ) ) ( not ( = ?auto_625804 ?auto_625814 ) ) ( not ( = ?auto_625804 ?auto_625815 ) ) ( not ( = ?auto_625804 ?auto_625816 ) ) ( not ( = ?auto_625804 ?auto_625817 ) ) ( not ( = ?auto_625804 ?auto_625818 ) ) ( not ( = ?auto_625805 ?auto_625806 ) ) ( not ( = ?auto_625805 ?auto_625807 ) ) ( not ( = ?auto_625805 ?auto_625808 ) ) ( not ( = ?auto_625805 ?auto_625809 ) ) ( not ( = ?auto_625805 ?auto_625810 ) ) ( not ( = ?auto_625805 ?auto_625811 ) ) ( not ( = ?auto_625805 ?auto_625812 ) ) ( not ( = ?auto_625805 ?auto_625813 ) ) ( not ( = ?auto_625805 ?auto_625814 ) ) ( not ( = ?auto_625805 ?auto_625815 ) ) ( not ( = ?auto_625805 ?auto_625816 ) ) ( not ( = ?auto_625805 ?auto_625817 ) ) ( not ( = ?auto_625805 ?auto_625818 ) ) ( not ( = ?auto_625806 ?auto_625807 ) ) ( not ( = ?auto_625806 ?auto_625808 ) ) ( not ( = ?auto_625806 ?auto_625809 ) ) ( not ( = ?auto_625806 ?auto_625810 ) ) ( not ( = ?auto_625806 ?auto_625811 ) ) ( not ( = ?auto_625806 ?auto_625812 ) ) ( not ( = ?auto_625806 ?auto_625813 ) ) ( not ( = ?auto_625806 ?auto_625814 ) ) ( not ( = ?auto_625806 ?auto_625815 ) ) ( not ( = ?auto_625806 ?auto_625816 ) ) ( not ( = ?auto_625806 ?auto_625817 ) ) ( not ( = ?auto_625806 ?auto_625818 ) ) ( not ( = ?auto_625807 ?auto_625808 ) ) ( not ( = ?auto_625807 ?auto_625809 ) ) ( not ( = ?auto_625807 ?auto_625810 ) ) ( not ( = ?auto_625807 ?auto_625811 ) ) ( not ( = ?auto_625807 ?auto_625812 ) ) ( not ( = ?auto_625807 ?auto_625813 ) ) ( not ( = ?auto_625807 ?auto_625814 ) ) ( not ( = ?auto_625807 ?auto_625815 ) ) ( not ( = ?auto_625807 ?auto_625816 ) ) ( not ( = ?auto_625807 ?auto_625817 ) ) ( not ( = ?auto_625807 ?auto_625818 ) ) ( not ( = ?auto_625808 ?auto_625809 ) ) ( not ( = ?auto_625808 ?auto_625810 ) ) ( not ( = ?auto_625808 ?auto_625811 ) ) ( not ( = ?auto_625808 ?auto_625812 ) ) ( not ( = ?auto_625808 ?auto_625813 ) ) ( not ( = ?auto_625808 ?auto_625814 ) ) ( not ( = ?auto_625808 ?auto_625815 ) ) ( not ( = ?auto_625808 ?auto_625816 ) ) ( not ( = ?auto_625808 ?auto_625817 ) ) ( not ( = ?auto_625808 ?auto_625818 ) ) ( not ( = ?auto_625809 ?auto_625810 ) ) ( not ( = ?auto_625809 ?auto_625811 ) ) ( not ( = ?auto_625809 ?auto_625812 ) ) ( not ( = ?auto_625809 ?auto_625813 ) ) ( not ( = ?auto_625809 ?auto_625814 ) ) ( not ( = ?auto_625809 ?auto_625815 ) ) ( not ( = ?auto_625809 ?auto_625816 ) ) ( not ( = ?auto_625809 ?auto_625817 ) ) ( not ( = ?auto_625809 ?auto_625818 ) ) ( not ( = ?auto_625810 ?auto_625811 ) ) ( not ( = ?auto_625810 ?auto_625812 ) ) ( not ( = ?auto_625810 ?auto_625813 ) ) ( not ( = ?auto_625810 ?auto_625814 ) ) ( not ( = ?auto_625810 ?auto_625815 ) ) ( not ( = ?auto_625810 ?auto_625816 ) ) ( not ( = ?auto_625810 ?auto_625817 ) ) ( not ( = ?auto_625810 ?auto_625818 ) ) ( not ( = ?auto_625811 ?auto_625812 ) ) ( not ( = ?auto_625811 ?auto_625813 ) ) ( not ( = ?auto_625811 ?auto_625814 ) ) ( not ( = ?auto_625811 ?auto_625815 ) ) ( not ( = ?auto_625811 ?auto_625816 ) ) ( not ( = ?auto_625811 ?auto_625817 ) ) ( not ( = ?auto_625811 ?auto_625818 ) ) ( not ( = ?auto_625812 ?auto_625813 ) ) ( not ( = ?auto_625812 ?auto_625814 ) ) ( not ( = ?auto_625812 ?auto_625815 ) ) ( not ( = ?auto_625812 ?auto_625816 ) ) ( not ( = ?auto_625812 ?auto_625817 ) ) ( not ( = ?auto_625812 ?auto_625818 ) ) ( not ( = ?auto_625813 ?auto_625814 ) ) ( not ( = ?auto_625813 ?auto_625815 ) ) ( not ( = ?auto_625813 ?auto_625816 ) ) ( not ( = ?auto_625813 ?auto_625817 ) ) ( not ( = ?auto_625813 ?auto_625818 ) ) ( not ( = ?auto_625814 ?auto_625815 ) ) ( not ( = ?auto_625814 ?auto_625816 ) ) ( not ( = ?auto_625814 ?auto_625817 ) ) ( not ( = ?auto_625814 ?auto_625818 ) ) ( not ( = ?auto_625815 ?auto_625816 ) ) ( not ( = ?auto_625815 ?auto_625817 ) ) ( not ( = ?auto_625815 ?auto_625818 ) ) ( not ( = ?auto_625816 ?auto_625817 ) ) ( not ( = ?auto_625816 ?auto_625818 ) ) ( not ( = ?auto_625817 ?auto_625818 ) ) ( ON ?auto_625816 ?auto_625817 ) ( ON ?auto_625815 ?auto_625816 ) ( ON ?auto_625814 ?auto_625815 ) ( ON ?auto_625813 ?auto_625814 ) ( CLEAR ?auto_625811 ) ( ON ?auto_625812 ?auto_625813 ) ( CLEAR ?auto_625812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_625802 ?auto_625803 ?auto_625804 ?auto_625805 ?auto_625806 ?auto_625807 ?auto_625808 ?auto_625809 ?auto_625810 ?auto_625811 ?auto_625812 )
      ( MAKE-16PILE ?auto_625802 ?auto_625803 ?auto_625804 ?auto_625805 ?auto_625806 ?auto_625807 ?auto_625808 ?auto_625809 ?auto_625810 ?auto_625811 ?auto_625812 ?auto_625813 ?auto_625814 ?auto_625815 ?auto_625816 ?auto_625817 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625868 - BLOCK
      ?auto_625869 - BLOCK
      ?auto_625870 - BLOCK
      ?auto_625871 - BLOCK
      ?auto_625872 - BLOCK
      ?auto_625873 - BLOCK
      ?auto_625874 - BLOCK
      ?auto_625875 - BLOCK
      ?auto_625876 - BLOCK
      ?auto_625877 - BLOCK
      ?auto_625878 - BLOCK
      ?auto_625879 - BLOCK
      ?auto_625880 - BLOCK
      ?auto_625881 - BLOCK
      ?auto_625882 - BLOCK
      ?auto_625883 - BLOCK
    )
    :vars
    (
      ?auto_625884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625883 ?auto_625884 ) ( ON-TABLE ?auto_625868 ) ( ON ?auto_625869 ?auto_625868 ) ( ON ?auto_625870 ?auto_625869 ) ( ON ?auto_625871 ?auto_625870 ) ( ON ?auto_625872 ?auto_625871 ) ( ON ?auto_625873 ?auto_625872 ) ( ON ?auto_625874 ?auto_625873 ) ( ON ?auto_625875 ?auto_625874 ) ( ON ?auto_625876 ?auto_625875 ) ( not ( = ?auto_625868 ?auto_625869 ) ) ( not ( = ?auto_625868 ?auto_625870 ) ) ( not ( = ?auto_625868 ?auto_625871 ) ) ( not ( = ?auto_625868 ?auto_625872 ) ) ( not ( = ?auto_625868 ?auto_625873 ) ) ( not ( = ?auto_625868 ?auto_625874 ) ) ( not ( = ?auto_625868 ?auto_625875 ) ) ( not ( = ?auto_625868 ?auto_625876 ) ) ( not ( = ?auto_625868 ?auto_625877 ) ) ( not ( = ?auto_625868 ?auto_625878 ) ) ( not ( = ?auto_625868 ?auto_625879 ) ) ( not ( = ?auto_625868 ?auto_625880 ) ) ( not ( = ?auto_625868 ?auto_625881 ) ) ( not ( = ?auto_625868 ?auto_625882 ) ) ( not ( = ?auto_625868 ?auto_625883 ) ) ( not ( = ?auto_625868 ?auto_625884 ) ) ( not ( = ?auto_625869 ?auto_625870 ) ) ( not ( = ?auto_625869 ?auto_625871 ) ) ( not ( = ?auto_625869 ?auto_625872 ) ) ( not ( = ?auto_625869 ?auto_625873 ) ) ( not ( = ?auto_625869 ?auto_625874 ) ) ( not ( = ?auto_625869 ?auto_625875 ) ) ( not ( = ?auto_625869 ?auto_625876 ) ) ( not ( = ?auto_625869 ?auto_625877 ) ) ( not ( = ?auto_625869 ?auto_625878 ) ) ( not ( = ?auto_625869 ?auto_625879 ) ) ( not ( = ?auto_625869 ?auto_625880 ) ) ( not ( = ?auto_625869 ?auto_625881 ) ) ( not ( = ?auto_625869 ?auto_625882 ) ) ( not ( = ?auto_625869 ?auto_625883 ) ) ( not ( = ?auto_625869 ?auto_625884 ) ) ( not ( = ?auto_625870 ?auto_625871 ) ) ( not ( = ?auto_625870 ?auto_625872 ) ) ( not ( = ?auto_625870 ?auto_625873 ) ) ( not ( = ?auto_625870 ?auto_625874 ) ) ( not ( = ?auto_625870 ?auto_625875 ) ) ( not ( = ?auto_625870 ?auto_625876 ) ) ( not ( = ?auto_625870 ?auto_625877 ) ) ( not ( = ?auto_625870 ?auto_625878 ) ) ( not ( = ?auto_625870 ?auto_625879 ) ) ( not ( = ?auto_625870 ?auto_625880 ) ) ( not ( = ?auto_625870 ?auto_625881 ) ) ( not ( = ?auto_625870 ?auto_625882 ) ) ( not ( = ?auto_625870 ?auto_625883 ) ) ( not ( = ?auto_625870 ?auto_625884 ) ) ( not ( = ?auto_625871 ?auto_625872 ) ) ( not ( = ?auto_625871 ?auto_625873 ) ) ( not ( = ?auto_625871 ?auto_625874 ) ) ( not ( = ?auto_625871 ?auto_625875 ) ) ( not ( = ?auto_625871 ?auto_625876 ) ) ( not ( = ?auto_625871 ?auto_625877 ) ) ( not ( = ?auto_625871 ?auto_625878 ) ) ( not ( = ?auto_625871 ?auto_625879 ) ) ( not ( = ?auto_625871 ?auto_625880 ) ) ( not ( = ?auto_625871 ?auto_625881 ) ) ( not ( = ?auto_625871 ?auto_625882 ) ) ( not ( = ?auto_625871 ?auto_625883 ) ) ( not ( = ?auto_625871 ?auto_625884 ) ) ( not ( = ?auto_625872 ?auto_625873 ) ) ( not ( = ?auto_625872 ?auto_625874 ) ) ( not ( = ?auto_625872 ?auto_625875 ) ) ( not ( = ?auto_625872 ?auto_625876 ) ) ( not ( = ?auto_625872 ?auto_625877 ) ) ( not ( = ?auto_625872 ?auto_625878 ) ) ( not ( = ?auto_625872 ?auto_625879 ) ) ( not ( = ?auto_625872 ?auto_625880 ) ) ( not ( = ?auto_625872 ?auto_625881 ) ) ( not ( = ?auto_625872 ?auto_625882 ) ) ( not ( = ?auto_625872 ?auto_625883 ) ) ( not ( = ?auto_625872 ?auto_625884 ) ) ( not ( = ?auto_625873 ?auto_625874 ) ) ( not ( = ?auto_625873 ?auto_625875 ) ) ( not ( = ?auto_625873 ?auto_625876 ) ) ( not ( = ?auto_625873 ?auto_625877 ) ) ( not ( = ?auto_625873 ?auto_625878 ) ) ( not ( = ?auto_625873 ?auto_625879 ) ) ( not ( = ?auto_625873 ?auto_625880 ) ) ( not ( = ?auto_625873 ?auto_625881 ) ) ( not ( = ?auto_625873 ?auto_625882 ) ) ( not ( = ?auto_625873 ?auto_625883 ) ) ( not ( = ?auto_625873 ?auto_625884 ) ) ( not ( = ?auto_625874 ?auto_625875 ) ) ( not ( = ?auto_625874 ?auto_625876 ) ) ( not ( = ?auto_625874 ?auto_625877 ) ) ( not ( = ?auto_625874 ?auto_625878 ) ) ( not ( = ?auto_625874 ?auto_625879 ) ) ( not ( = ?auto_625874 ?auto_625880 ) ) ( not ( = ?auto_625874 ?auto_625881 ) ) ( not ( = ?auto_625874 ?auto_625882 ) ) ( not ( = ?auto_625874 ?auto_625883 ) ) ( not ( = ?auto_625874 ?auto_625884 ) ) ( not ( = ?auto_625875 ?auto_625876 ) ) ( not ( = ?auto_625875 ?auto_625877 ) ) ( not ( = ?auto_625875 ?auto_625878 ) ) ( not ( = ?auto_625875 ?auto_625879 ) ) ( not ( = ?auto_625875 ?auto_625880 ) ) ( not ( = ?auto_625875 ?auto_625881 ) ) ( not ( = ?auto_625875 ?auto_625882 ) ) ( not ( = ?auto_625875 ?auto_625883 ) ) ( not ( = ?auto_625875 ?auto_625884 ) ) ( not ( = ?auto_625876 ?auto_625877 ) ) ( not ( = ?auto_625876 ?auto_625878 ) ) ( not ( = ?auto_625876 ?auto_625879 ) ) ( not ( = ?auto_625876 ?auto_625880 ) ) ( not ( = ?auto_625876 ?auto_625881 ) ) ( not ( = ?auto_625876 ?auto_625882 ) ) ( not ( = ?auto_625876 ?auto_625883 ) ) ( not ( = ?auto_625876 ?auto_625884 ) ) ( not ( = ?auto_625877 ?auto_625878 ) ) ( not ( = ?auto_625877 ?auto_625879 ) ) ( not ( = ?auto_625877 ?auto_625880 ) ) ( not ( = ?auto_625877 ?auto_625881 ) ) ( not ( = ?auto_625877 ?auto_625882 ) ) ( not ( = ?auto_625877 ?auto_625883 ) ) ( not ( = ?auto_625877 ?auto_625884 ) ) ( not ( = ?auto_625878 ?auto_625879 ) ) ( not ( = ?auto_625878 ?auto_625880 ) ) ( not ( = ?auto_625878 ?auto_625881 ) ) ( not ( = ?auto_625878 ?auto_625882 ) ) ( not ( = ?auto_625878 ?auto_625883 ) ) ( not ( = ?auto_625878 ?auto_625884 ) ) ( not ( = ?auto_625879 ?auto_625880 ) ) ( not ( = ?auto_625879 ?auto_625881 ) ) ( not ( = ?auto_625879 ?auto_625882 ) ) ( not ( = ?auto_625879 ?auto_625883 ) ) ( not ( = ?auto_625879 ?auto_625884 ) ) ( not ( = ?auto_625880 ?auto_625881 ) ) ( not ( = ?auto_625880 ?auto_625882 ) ) ( not ( = ?auto_625880 ?auto_625883 ) ) ( not ( = ?auto_625880 ?auto_625884 ) ) ( not ( = ?auto_625881 ?auto_625882 ) ) ( not ( = ?auto_625881 ?auto_625883 ) ) ( not ( = ?auto_625881 ?auto_625884 ) ) ( not ( = ?auto_625882 ?auto_625883 ) ) ( not ( = ?auto_625882 ?auto_625884 ) ) ( not ( = ?auto_625883 ?auto_625884 ) ) ( ON ?auto_625882 ?auto_625883 ) ( ON ?auto_625881 ?auto_625882 ) ( ON ?auto_625880 ?auto_625881 ) ( ON ?auto_625879 ?auto_625880 ) ( ON ?auto_625878 ?auto_625879 ) ( CLEAR ?auto_625876 ) ( ON ?auto_625877 ?auto_625878 ) ( CLEAR ?auto_625877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_625868 ?auto_625869 ?auto_625870 ?auto_625871 ?auto_625872 ?auto_625873 ?auto_625874 ?auto_625875 ?auto_625876 ?auto_625877 )
      ( MAKE-16PILE ?auto_625868 ?auto_625869 ?auto_625870 ?auto_625871 ?auto_625872 ?auto_625873 ?auto_625874 ?auto_625875 ?auto_625876 ?auto_625877 ?auto_625878 ?auto_625879 ?auto_625880 ?auto_625881 ?auto_625882 ?auto_625883 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_625934 - BLOCK
      ?auto_625935 - BLOCK
      ?auto_625936 - BLOCK
      ?auto_625937 - BLOCK
      ?auto_625938 - BLOCK
      ?auto_625939 - BLOCK
      ?auto_625940 - BLOCK
      ?auto_625941 - BLOCK
      ?auto_625942 - BLOCK
      ?auto_625943 - BLOCK
      ?auto_625944 - BLOCK
      ?auto_625945 - BLOCK
      ?auto_625946 - BLOCK
      ?auto_625947 - BLOCK
      ?auto_625948 - BLOCK
      ?auto_625949 - BLOCK
    )
    :vars
    (
      ?auto_625950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_625949 ?auto_625950 ) ( ON-TABLE ?auto_625934 ) ( ON ?auto_625935 ?auto_625934 ) ( ON ?auto_625936 ?auto_625935 ) ( ON ?auto_625937 ?auto_625936 ) ( ON ?auto_625938 ?auto_625937 ) ( ON ?auto_625939 ?auto_625938 ) ( ON ?auto_625940 ?auto_625939 ) ( ON ?auto_625941 ?auto_625940 ) ( not ( = ?auto_625934 ?auto_625935 ) ) ( not ( = ?auto_625934 ?auto_625936 ) ) ( not ( = ?auto_625934 ?auto_625937 ) ) ( not ( = ?auto_625934 ?auto_625938 ) ) ( not ( = ?auto_625934 ?auto_625939 ) ) ( not ( = ?auto_625934 ?auto_625940 ) ) ( not ( = ?auto_625934 ?auto_625941 ) ) ( not ( = ?auto_625934 ?auto_625942 ) ) ( not ( = ?auto_625934 ?auto_625943 ) ) ( not ( = ?auto_625934 ?auto_625944 ) ) ( not ( = ?auto_625934 ?auto_625945 ) ) ( not ( = ?auto_625934 ?auto_625946 ) ) ( not ( = ?auto_625934 ?auto_625947 ) ) ( not ( = ?auto_625934 ?auto_625948 ) ) ( not ( = ?auto_625934 ?auto_625949 ) ) ( not ( = ?auto_625934 ?auto_625950 ) ) ( not ( = ?auto_625935 ?auto_625936 ) ) ( not ( = ?auto_625935 ?auto_625937 ) ) ( not ( = ?auto_625935 ?auto_625938 ) ) ( not ( = ?auto_625935 ?auto_625939 ) ) ( not ( = ?auto_625935 ?auto_625940 ) ) ( not ( = ?auto_625935 ?auto_625941 ) ) ( not ( = ?auto_625935 ?auto_625942 ) ) ( not ( = ?auto_625935 ?auto_625943 ) ) ( not ( = ?auto_625935 ?auto_625944 ) ) ( not ( = ?auto_625935 ?auto_625945 ) ) ( not ( = ?auto_625935 ?auto_625946 ) ) ( not ( = ?auto_625935 ?auto_625947 ) ) ( not ( = ?auto_625935 ?auto_625948 ) ) ( not ( = ?auto_625935 ?auto_625949 ) ) ( not ( = ?auto_625935 ?auto_625950 ) ) ( not ( = ?auto_625936 ?auto_625937 ) ) ( not ( = ?auto_625936 ?auto_625938 ) ) ( not ( = ?auto_625936 ?auto_625939 ) ) ( not ( = ?auto_625936 ?auto_625940 ) ) ( not ( = ?auto_625936 ?auto_625941 ) ) ( not ( = ?auto_625936 ?auto_625942 ) ) ( not ( = ?auto_625936 ?auto_625943 ) ) ( not ( = ?auto_625936 ?auto_625944 ) ) ( not ( = ?auto_625936 ?auto_625945 ) ) ( not ( = ?auto_625936 ?auto_625946 ) ) ( not ( = ?auto_625936 ?auto_625947 ) ) ( not ( = ?auto_625936 ?auto_625948 ) ) ( not ( = ?auto_625936 ?auto_625949 ) ) ( not ( = ?auto_625936 ?auto_625950 ) ) ( not ( = ?auto_625937 ?auto_625938 ) ) ( not ( = ?auto_625937 ?auto_625939 ) ) ( not ( = ?auto_625937 ?auto_625940 ) ) ( not ( = ?auto_625937 ?auto_625941 ) ) ( not ( = ?auto_625937 ?auto_625942 ) ) ( not ( = ?auto_625937 ?auto_625943 ) ) ( not ( = ?auto_625937 ?auto_625944 ) ) ( not ( = ?auto_625937 ?auto_625945 ) ) ( not ( = ?auto_625937 ?auto_625946 ) ) ( not ( = ?auto_625937 ?auto_625947 ) ) ( not ( = ?auto_625937 ?auto_625948 ) ) ( not ( = ?auto_625937 ?auto_625949 ) ) ( not ( = ?auto_625937 ?auto_625950 ) ) ( not ( = ?auto_625938 ?auto_625939 ) ) ( not ( = ?auto_625938 ?auto_625940 ) ) ( not ( = ?auto_625938 ?auto_625941 ) ) ( not ( = ?auto_625938 ?auto_625942 ) ) ( not ( = ?auto_625938 ?auto_625943 ) ) ( not ( = ?auto_625938 ?auto_625944 ) ) ( not ( = ?auto_625938 ?auto_625945 ) ) ( not ( = ?auto_625938 ?auto_625946 ) ) ( not ( = ?auto_625938 ?auto_625947 ) ) ( not ( = ?auto_625938 ?auto_625948 ) ) ( not ( = ?auto_625938 ?auto_625949 ) ) ( not ( = ?auto_625938 ?auto_625950 ) ) ( not ( = ?auto_625939 ?auto_625940 ) ) ( not ( = ?auto_625939 ?auto_625941 ) ) ( not ( = ?auto_625939 ?auto_625942 ) ) ( not ( = ?auto_625939 ?auto_625943 ) ) ( not ( = ?auto_625939 ?auto_625944 ) ) ( not ( = ?auto_625939 ?auto_625945 ) ) ( not ( = ?auto_625939 ?auto_625946 ) ) ( not ( = ?auto_625939 ?auto_625947 ) ) ( not ( = ?auto_625939 ?auto_625948 ) ) ( not ( = ?auto_625939 ?auto_625949 ) ) ( not ( = ?auto_625939 ?auto_625950 ) ) ( not ( = ?auto_625940 ?auto_625941 ) ) ( not ( = ?auto_625940 ?auto_625942 ) ) ( not ( = ?auto_625940 ?auto_625943 ) ) ( not ( = ?auto_625940 ?auto_625944 ) ) ( not ( = ?auto_625940 ?auto_625945 ) ) ( not ( = ?auto_625940 ?auto_625946 ) ) ( not ( = ?auto_625940 ?auto_625947 ) ) ( not ( = ?auto_625940 ?auto_625948 ) ) ( not ( = ?auto_625940 ?auto_625949 ) ) ( not ( = ?auto_625940 ?auto_625950 ) ) ( not ( = ?auto_625941 ?auto_625942 ) ) ( not ( = ?auto_625941 ?auto_625943 ) ) ( not ( = ?auto_625941 ?auto_625944 ) ) ( not ( = ?auto_625941 ?auto_625945 ) ) ( not ( = ?auto_625941 ?auto_625946 ) ) ( not ( = ?auto_625941 ?auto_625947 ) ) ( not ( = ?auto_625941 ?auto_625948 ) ) ( not ( = ?auto_625941 ?auto_625949 ) ) ( not ( = ?auto_625941 ?auto_625950 ) ) ( not ( = ?auto_625942 ?auto_625943 ) ) ( not ( = ?auto_625942 ?auto_625944 ) ) ( not ( = ?auto_625942 ?auto_625945 ) ) ( not ( = ?auto_625942 ?auto_625946 ) ) ( not ( = ?auto_625942 ?auto_625947 ) ) ( not ( = ?auto_625942 ?auto_625948 ) ) ( not ( = ?auto_625942 ?auto_625949 ) ) ( not ( = ?auto_625942 ?auto_625950 ) ) ( not ( = ?auto_625943 ?auto_625944 ) ) ( not ( = ?auto_625943 ?auto_625945 ) ) ( not ( = ?auto_625943 ?auto_625946 ) ) ( not ( = ?auto_625943 ?auto_625947 ) ) ( not ( = ?auto_625943 ?auto_625948 ) ) ( not ( = ?auto_625943 ?auto_625949 ) ) ( not ( = ?auto_625943 ?auto_625950 ) ) ( not ( = ?auto_625944 ?auto_625945 ) ) ( not ( = ?auto_625944 ?auto_625946 ) ) ( not ( = ?auto_625944 ?auto_625947 ) ) ( not ( = ?auto_625944 ?auto_625948 ) ) ( not ( = ?auto_625944 ?auto_625949 ) ) ( not ( = ?auto_625944 ?auto_625950 ) ) ( not ( = ?auto_625945 ?auto_625946 ) ) ( not ( = ?auto_625945 ?auto_625947 ) ) ( not ( = ?auto_625945 ?auto_625948 ) ) ( not ( = ?auto_625945 ?auto_625949 ) ) ( not ( = ?auto_625945 ?auto_625950 ) ) ( not ( = ?auto_625946 ?auto_625947 ) ) ( not ( = ?auto_625946 ?auto_625948 ) ) ( not ( = ?auto_625946 ?auto_625949 ) ) ( not ( = ?auto_625946 ?auto_625950 ) ) ( not ( = ?auto_625947 ?auto_625948 ) ) ( not ( = ?auto_625947 ?auto_625949 ) ) ( not ( = ?auto_625947 ?auto_625950 ) ) ( not ( = ?auto_625948 ?auto_625949 ) ) ( not ( = ?auto_625948 ?auto_625950 ) ) ( not ( = ?auto_625949 ?auto_625950 ) ) ( ON ?auto_625948 ?auto_625949 ) ( ON ?auto_625947 ?auto_625948 ) ( ON ?auto_625946 ?auto_625947 ) ( ON ?auto_625945 ?auto_625946 ) ( ON ?auto_625944 ?auto_625945 ) ( ON ?auto_625943 ?auto_625944 ) ( CLEAR ?auto_625941 ) ( ON ?auto_625942 ?auto_625943 ) ( CLEAR ?auto_625942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_625934 ?auto_625935 ?auto_625936 ?auto_625937 ?auto_625938 ?auto_625939 ?auto_625940 ?auto_625941 ?auto_625942 )
      ( MAKE-16PILE ?auto_625934 ?auto_625935 ?auto_625936 ?auto_625937 ?auto_625938 ?auto_625939 ?auto_625940 ?auto_625941 ?auto_625942 ?auto_625943 ?auto_625944 ?auto_625945 ?auto_625946 ?auto_625947 ?auto_625948 ?auto_625949 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626000 - BLOCK
      ?auto_626001 - BLOCK
      ?auto_626002 - BLOCK
      ?auto_626003 - BLOCK
      ?auto_626004 - BLOCK
      ?auto_626005 - BLOCK
      ?auto_626006 - BLOCK
      ?auto_626007 - BLOCK
      ?auto_626008 - BLOCK
      ?auto_626009 - BLOCK
      ?auto_626010 - BLOCK
      ?auto_626011 - BLOCK
      ?auto_626012 - BLOCK
      ?auto_626013 - BLOCK
      ?auto_626014 - BLOCK
      ?auto_626015 - BLOCK
    )
    :vars
    (
      ?auto_626016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626015 ?auto_626016 ) ( ON-TABLE ?auto_626000 ) ( ON ?auto_626001 ?auto_626000 ) ( ON ?auto_626002 ?auto_626001 ) ( ON ?auto_626003 ?auto_626002 ) ( ON ?auto_626004 ?auto_626003 ) ( ON ?auto_626005 ?auto_626004 ) ( ON ?auto_626006 ?auto_626005 ) ( not ( = ?auto_626000 ?auto_626001 ) ) ( not ( = ?auto_626000 ?auto_626002 ) ) ( not ( = ?auto_626000 ?auto_626003 ) ) ( not ( = ?auto_626000 ?auto_626004 ) ) ( not ( = ?auto_626000 ?auto_626005 ) ) ( not ( = ?auto_626000 ?auto_626006 ) ) ( not ( = ?auto_626000 ?auto_626007 ) ) ( not ( = ?auto_626000 ?auto_626008 ) ) ( not ( = ?auto_626000 ?auto_626009 ) ) ( not ( = ?auto_626000 ?auto_626010 ) ) ( not ( = ?auto_626000 ?auto_626011 ) ) ( not ( = ?auto_626000 ?auto_626012 ) ) ( not ( = ?auto_626000 ?auto_626013 ) ) ( not ( = ?auto_626000 ?auto_626014 ) ) ( not ( = ?auto_626000 ?auto_626015 ) ) ( not ( = ?auto_626000 ?auto_626016 ) ) ( not ( = ?auto_626001 ?auto_626002 ) ) ( not ( = ?auto_626001 ?auto_626003 ) ) ( not ( = ?auto_626001 ?auto_626004 ) ) ( not ( = ?auto_626001 ?auto_626005 ) ) ( not ( = ?auto_626001 ?auto_626006 ) ) ( not ( = ?auto_626001 ?auto_626007 ) ) ( not ( = ?auto_626001 ?auto_626008 ) ) ( not ( = ?auto_626001 ?auto_626009 ) ) ( not ( = ?auto_626001 ?auto_626010 ) ) ( not ( = ?auto_626001 ?auto_626011 ) ) ( not ( = ?auto_626001 ?auto_626012 ) ) ( not ( = ?auto_626001 ?auto_626013 ) ) ( not ( = ?auto_626001 ?auto_626014 ) ) ( not ( = ?auto_626001 ?auto_626015 ) ) ( not ( = ?auto_626001 ?auto_626016 ) ) ( not ( = ?auto_626002 ?auto_626003 ) ) ( not ( = ?auto_626002 ?auto_626004 ) ) ( not ( = ?auto_626002 ?auto_626005 ) ) ( not ( = ?auto_626002 ?auto_626006 ) ) ( not ( = ?auto_626002 ?auto_626007 ) ) ( not ( = ?auto_626002 ?auto_626008 ) ) ( not ( = ?auto_626002 ?auto_626009 ) ) ( not ( = ?auto_626002 ?auto_626010 ) ) ( not ( = ?auto_626002 ?auto_626011 ) ) ( not ( = ?auto_626002 ?auto_626012 ) ) ( not ( = ?auto_626002 ?auto_626013 ) ) ( not ( = ?auto_626002 ?auto_626014 ) ) ( not ( = ?auto_626002 ?auto_626015 ) ) ( not ( = ?auto_626002 ?auto_626016 ) ) ( not ( = ?auto_626003 ?auto_626004 ) ) ( not ( = ?auto_626003 ?auto_626005 ) ) ( not ( = ?auto_626003 ?auto_626006 ) ) ( not ( = ?auto_626003 ?auto_626007 ) ) ( not ( = ?auto_626003 ?auto_626008 ) ) ( not ( = ?auto_626003 ?auto_626009 ) ) ( not ( = ?auto_626003 ?auto_626010 ) ) ( not ( = ?auto_626003 ?auto_626011 ) ) ( not ( = ?auto_626003 ?auto_626012 ) ) ( not ( = ?auto_626003 ?auto_626013 ) ) ( not ( = ?auto_626003 ?auto_626014 ) ) ( not ( = ?auto_626003 ?auto_626015 ) ) ( not ( = ?auto_626003 ?auto_626016 ) ) ( not ( = ?auto_626004 ?auto_626005 ) ) ( not ( = ?auto_626004 ?auto_626006 ) ) ( not ( = ?auto_626004 ?auto_626007 ) ) ( not ( = ?auto_626004 ?auto_626008 ) ) ( not ( = ?auto_626004 ?auto_626009 ) ) ( not ( = ?auto_626004 ?auto_626010 ) ) ( not ( = ?auto_626004 ?auto_626011 ) ) ( not ( = ?auto_626004 ?auto_626012 ) ) ( not ( = ?auto_626004 ?auto_626013 ) ) ( not ( = ?auto_626004 ?auto_626014 ) ) ( not ( = ?auto_626004 ?auto_626015 ) ) ( not ( = ?auto_626004 ?auto_626016 ) ) ( not ( = ?auto_626005 ?auto_626006 ) ) ( not ( = ?auto_626005 ?auto_626007 ) ) ( not ( = ?auto_626005 ?auto_626008 ) ) ( not ( = ?auto_626005 ?auto_626009 ) ) ( not ( = ?auto_626005 ?auto_626010 ) ) ( not ( = ?auto_626005 ?auto_626011 ) ) ( not ( = ?auto_626005 ?auto_626012 ) ) ( not ( = ?auto_626005 ?auto_626013 ) ) ( not ( = ?auto_626005 ?auto_626014 ) ) ( not ( = ?auto_626005 ?auto_626015 ) ) ( not ( = ?auto_626005 ?auto_626016 ) ) ( not ( = ?auto_626006 ?auto_626007 ) ) ( not ( = ?auto_626006 ?auto_626008 ) ) ( not ( = ?auto_626006 ?auto_626009 ) ) ( not ( = ?auto_626006 ?auto_626010 ) ) ( not ( = ?auto_626006 ?auto_626011 ) ) ( not ( = ?auto_626006 ?auto_626012 ) ) ( not ( = ?auto_626006 ?auto_626013 ) ) ( not ( = ?auto_626006 ?auto_626014 ) ) ( not ( = ?auto_626006 ?auto_626015 ) ) ( not ( = ?auto_626006 ?auto_626016 ) ) ( not ( = ?auto_626007 ?auto_626008 ) ) ( not ( = ?auto_626007 ?auto_626009 ) ) ( not ( = ?auto_626007 ?auto_626010 ) ) ( not ( = ?auto_626007 ?auto_626011 ) ) ( not ( = ?auto_626007 ?auto_626012 ) ) ( not ( = ?auto_626007 ?auto_626013 ) ) ( not ( = ?auto_626007 ?auto_626014 ) ) ( not ( = ?auto_626007 ?auto_626015 ) ) ( not ( = ?auto_626007 ?auto_626016 ) ) ( not ( = ?auto_626008 ?auto_626009 ) ) ( not ( = ?auto_626008 ?auto_626010 ) ) ( not ( = ?auto_626008 ?auto_626011 ) ) ( not ( = ?auto_626008 ?auto_626012 ) ) ( not ( = ?auto_626008 ?auto_626013 ) ) ( not ( = ?auto_626008 ?auto_626014 ) ) ( not ( = ?auto_626008 ?auto_626015 ) ) ( not ( = ?auto_626008 ?auto_626016 ) ) ( not ( = ?auto_626009 ?auto_626010 ) ) ( not ( = ?auto_626009 ?auto_626011 ) ) ( not ( = ?auto_626009 ?auto_626012 ) ) ( not ( = ?auto_626009 ?auto_626013 ) ) ( not ( = ?auto_626009 ?auto_626014 ) ) ( not ( = ?auto_626009 ?auto_626015 ) ) ( not ( = ?auto_626009 ?auto_626016 ) ) ( not ( = ?auto_626010 ?auto_626011 ) ) ( not ( = ?auto_626010 ?auto_626012 ) ) ( not ( = ?auto_626010 ?auto_626013 ) ) ( not ( = ?auto_626010 ?auto_626014 ) ) ( not ( = ?auto_626010 ?auto_626015 ) ) ( not ( = ?auto_626010 ?auto_626016 ) ) ( not ( = ?auto_626011 ?auto_626012 ) ) ( not ( = ?auto_626011 ?auto_626013 ) ) ( not ( = ?auto_626011 ?auto_626014 ) ) ( not ( = ?auto_626011 ?auto_626015 ) ) ( not ( = ?auto_626011 ?auto_626016 ) ) ( not ( = ?auto_626012 ?auto_626013 ) ) ( not ( = ?auto_626012 ?auto_626014 ) ) ( not ( = ?auto_626012 ?auto_626015 ) ) ( not ( = ?auto_626012 ?auto_626016 ) ) ( not ( = ?auto_626013 ?auto_626014 ) ) ( not ( = ?auto_626013 ?auto_626015 ) ) ( not ( = ?auto_626013 ?auto_626016 ) ) ( not ( = ?auto_626014 ?auto_626015 ) ) ( not ( = ?auto_626014 ?auto_626016 ) ) ( not ( = ?auto_626015 ?auto_626016 ) ) ( ON ?auto_626014 ?auto_626015 ) ( ON ?auto_626013 ?auto_626014 ) ( ON ?auto_626012 ?auto_626013 ) ( ON ?auto_626011 ?auto_626012 ) ( ON ?auto_626010 ?auto_626011 ) ( ON ?auto_626009 ?auto_626010 ) ( ON ?auto_626008 ?auto_626009 ) ( CLEAR ?auto_626006 ) ( ON ?auto_626007 ?auto_626008 ) ( CLEAR ?auto_626007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_626000 ?auto_626001 ?auto_626002 ?auto_626003 ?auto_626004 ?auto_626005 ?auto_626006 ?auto_626007 )
      ( MAKE-16PILE ?auto_626000 ?auto_626001 ?auto_626002 ?auto_626003 ?auto_626004 ?auto_626005 ?auto_626006 ?auto_626007 ?auto_626008 ?auto_626009 ?auto_626010 ?auto_626011 ?auto_626012 ?auto_626013 ?auto_626014 ?auto_626015 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626066 - BLOCK
      ?auto_626067 - BLOCK
      ?auto_626068 - BLOCK
      ?auto_626069 - BLOCK
      ?auto_626070 - BLOCK
      ?auto_626071 - BLOCK
      ?auto_626072 - BLOCK
      ?auto_626073 - BLOCK
      ?auto_626074 - BLOCK
      ?auto_626075 - BLOCK
      ?auto_626076 - BLOCK
      ?auto_626077 - BLOCK
      ?auto_626078 - BLOCK
      ?auto_626079 - BLOCK
      ?auto_626080 - BLOCK
      ?auto_626081 - BLOCK
    )
    :vars
    (
      ?auto_626082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626081 ?auto_626082 ) ( ON-TABLE ?auto_626066 ) ( ON ?auto_626067 ?auto_626066 ) ( ON ?auto_626068 ?auto_626067 ) ( ON ?auto_626069 ?auto_626068 ) ( ON ?auto_626070 ?auto_626069 ) ( ON ?auto_626071 ?auto_626070 ) ( not ( = ?auto_626066 ?auto_626067 ) ) ( not ( = ?auto_626066 ?auto_626068 ) ) ( not ( = ?auto_626066 ?auto_626069 ) ) ( not ( = ?auto_626066 ?auto_626070 ) ) ( not ( = ?auto_626066 ?auto_626071 ) ) ( not ( = ?auto_626066 ?auto_626072 ) ) ( not ( = ?auto_626066 ?auto_626073 ) ) ( not ( = ?auto_626066 ?auto_626074 ) ) ( not ( = ?auto_626066 ?auto_626075 ) ) ( not ( = ?auto_626066 ?auto_626076 ) ) ( not ( = ?auto_626066 ?auto_626077 ) ) ( not ( = ?auto_626066 ?auto_626078 ) ) ( not ( = ?auto_626066 ?auto_626079 ) ) ( not ( = ?auto_626066 ?auto_626080 ) ) ( not ( = ?auto_626066 ?auto_626081 ) ) ( not ( = ?auto_626066 ?auto_626082 ) ) ( not ( = ?auto_626067 ?auto_626068 ) ) ( not ( = ?auto_626067 ?auto_626069 ) ) ( not ( = ?auto_626067 ?auto_626070 ) ) ( not ( = ?auto_626067 ?auto_626071 ) ) ( not ( = ?auto_626067 ?auto_626072 ) ) ( not ( = ?auto_626067 ?auto_626073 ) ) ( not ( = ?auto_626067 ?auto_626074 ) ) ( not ( = ?auto_626067 ?auto_626075 ) ) ( not ( = ?auto_626067 ?auto_626076 ) ) ( not ( = ?auto_626067 ?auto_626077 ) ) ( not ( = ?auto_626067 ?auto_626078 ) ) ( not ( = ?auto_626067 ?auto_626079 ) ) ( not ( = ?auto_626067 ?auto_626080 ) ) ( not ( = ?auto_626067 ?auto_626081 ) ) ( not ( = ?auto_626067 ?auto_626082 ) ) ( not ( = ?auto_626068 ?auto_626069 ) ) ( not ( = ?auto_626068 ?auto_626070 ) ) ( not ( = ?auto_626068 ?auto_626071 ) ) ( not ( = ?auto_626068 ?auto_626072 ) ) ( not ( = ?auto_626068 ?auto_626073 ) ) ( not ( = ?auto_626068 ?auto_626074 ) ) ( not ( = ?auto_626068 ?auto_626075 ) ) ( not ( = ?auto_626068 ?auto_626076 ) ) ( not ( = ?auto_626068 ?auto_626077 ) ) ( not ( = ?auto_626068 ?auto_626078 ) ) ( not ( = ?auto_626068 ?auto_626079 ) ) ( not ( = ?auto_626068 ?auto_626080 ) ) ( not ( = ?auto_626068 ?auto_626081 ) ) ( not ( = ?auto_626068 ?auto_626082 ) ) ( not ( = ?auto_626069 ?auto_626070 ) ) ( not ( = ?auto_626069 ?auto_626071 ) ) ( not ( = ?auto_626069 ?auto_626072 ) ) ( not ( = ?auto_626069 ?auto_626073 ) ) ( not ( = ?auto_626069 ?auto_626074 ) ) ( not ( = ?auto_626069 ?auto_626075 ) ) ( not ( = ?auto_626069 ?auto_626076 ) ) ( not ( = ?auto_626069 ?auto_626077 ) ) ( not ( = ?auto_626069 ?auto_626078 ) ) ( not ( = ?auto_626069 ?auto_626079 ) ) ( not ( = ?auto_626069 ?auto_626080 ) ) ( not ( = ?auto_626069 ?auto_626081 ) ) ( not ( = ?auto_626069 ?auto_626082 ) ) ( not ( = ?auto_626070 ?auto_626071 ) ) ( not ( = ?auto_626070 ?auto_626072 ) ) ( not ( = ?auto_626070 ?auto_626073 ) ) ( not ( = ?auto_626070 ?auto_626074 ) ) ( not ( = ?auto_626070 ?auto_626075 ) ) ( not ( = ?auto_626070 ?auto_626076 ) ) ( not ( = ?auto_626070 ?auto_626077 ) ) ( not ( = ?auto_626070 ?auto_626078 ) ) ( not ( = ?auto_626070 ?auto_626079 ) ) ( not ( = ?auto_626070 ?auto_626080 ) ) ( not ( = ?auto_626070 ?auto_626081 ) ) ( not ( = ?auto_626070 ?auto_626082 ) ) ( not ( = ?auto_626071 ?auto_626072 ) ) ( not ( = ?auto_626071 ?auto_626073 ) ) ( not ( = ?auto_626071 ?auto_626074 ) ) ( not ( = ?auto_626071 ?auto_626075 ) ) ( not ( = ?auto_626071 ?auto_626076 ) ) ( not ( = ?auto_626071 ?auto_626077 ) ) ( not ( = ?auto_626071 ?auto_626078 ) ) ( not ( = ?auto_626071 ?auto_626079 ) ) ( not ( = ?auto_626071 ?auto_626080 ) ) ( not ( = ?auto_626071 ?auto_626081 ) ) ( not ( = ?auto_626071 ?auto_626082 ) ) ( not ( = ?auto_626072 ?auto_626073 ) ) ( not ( = ?auto_626072 ?auto_626074 ) ) ( not ( = ?auto_626072 ?auto_626075 ) ) ( not ( = ?auto_626072 ?auto_626076 ) ) ( not ( = ?auto_626072 ?auto_626077 ) ) ( not ( = ?auto_626072 ?auto_626078 ) ) ( not ( = ?auto_626072 ?auto_626079 ) ) ( not ( = ?auto_626072 ?auto_626080 ) ) ( not ( = ?auto_626072 ?auto_626081 ) ) ( not ( = ?auto_626072 ?auto_626082 ) ) ( not ( = ?auto_626073 ?auto_626074 ) ) ( not ( = ?auto_626073 ?auto_626075 ) ) ( not ( = ?auto_626073 ?auto_626076 ) ) ( not ( = ?auto_626073 ?auto_626077 ) ) ( not ( = ?auto_626073 ?auto_626078 ) ) ( not ( = ?auto_626073 ?auto_626079 ) ) ( not ( = ?auto_626073 ?auto_626080 ) ) ( not ( = ?auto_626073 ?auto_626081 ) ) ( not ( = ?auto_626073 ?auto_626082 ) ) ( not ( = ?auto_626074 ?auto_626075 ) ) ( not ( = ?auto_626074 ?auto_626076 ) ) ( not ( = ?auto_626074 ?auto_626077 ) ) ( not ( = ?auto_626074 ?auto_626078 ) ) ( not ( = ?auto_626074 ?auto_626079 ) ) ( not ( = ?auto_626074 ?auto_626080 ) ) ( not ( = ?auto_626074 ?auto_626081 ) ) ( not ( = ?auto_626074 ?auto_626082 ) ) ( not ( = ?auto_626075 ?auto_626076 ) ) ( not ( = ?auto_626075 ?auto_626077 ) ) ( not ( = ?auto_626075 ?auto_626078 ) ) ( not ( = ?auto_626075 ?auto_626079 ) ) ( not ( = ?auto_626075 ?auto_626080 ) ) ( not ( = ?auto_626075 ?auto_626081 ) ) ( not ( = ?auto_626075 ?auto_626082 ) ) ( not ( = ?auto_626076 ?auto_626077 ) ) ( not ( = ?auto_626076 ?auto_626078 ) ) ( not ( = ?auto_626076 ?auto_626079 ) ) ( not ( = ?auto_626076 ?auto_626080 ) ) ( not ( = ?auto_626076 ?auto_626081 ) ) ( not ( = ?auto_626076 ?auto_626082 ) ) ( not ( = ?auto_626077 ?auto_626078 ) ) ( not ( = ?auto_626077 ?auto_626079 ) ) ( not ( = ?auto_626077 ?auto_626080 ) ) ( not ( = ?auto_626077 ?auto_626081 ) ) ( not ( = ?auto_626077 ?auto_626082 ) ) ( not ( = ?auto_626078 ?auto_626079 ) ) ( not ( = ?auto_626078 ?auto_626080 ) ) ( not ( = ?auto_626078 ?auto_626081 ) ) ( not ( = ?auto_626078 ?auto_626082 ) ) ( not ( = ?auto_626079 ?auto_626080 ) ) ( not ( = ?auto_626079 ?auto_626081 ) ) ( not ( = ?auto_626079 ?auto_626082 ) ) ( not ( = ?auto_626080 ?auto_626081 ) ) ( not ( = ?auto_626080 ?auto_626082 ) ) ( not ( = ?auto_626081 ?auto_626082 ) ) ( ON ?auto_626080 ?auto_626081 ) ( ON ?auto_626079 ?auto_626080 ) ( ON ?auto_626078 ?auto_626079 ) ( ON ?auto_626077 ?auto_626078 ) ( ON ?auto_626076 ?auto_626077 ) ( ON ?auto_626075 ?auto_626076 ) ( ON ?auto_626074 ?auto_626075 ) ( ON ?auto_626073 ?auto_626074 ) ( CLEAR ?auto_626071 ) ( ON ?auto_626072 ?auto_626073 ) ( CLEAR ?auto_626072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_626066 ?auto_626067 ?auto_626068 ?auto_626069 ?auto_626070 ?auto_626071 ?auto_626072 )
      ( MAKE-16PILE ?auto_626066 ?auto_626067 ?auto_626068 ?auto_626069 ?auto_626070 ?auto_626071 ?auto_626072 ?auto_626073 ?auto_626074 ?auto_626075 ?auto_626076 ?auto_626077 ?auto_626078 ?auto_626079 ?auto_626080 ?auto_626081 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626132 - BLOCK
      ?auto_626133 - BLOCK
      ?auto_626134 - BLOCK
      ?auto_626135 - BLOCK
      ?auto_626136 - BLOCK
      ?auto_626137 - BLOCK
      ?auto_626138 - BLOCK
      ?auto_626139 - BLOCK
      ?auto_626140 - BLOCK
      ?auto_626141 - BLOCK
      ?auto_626142 - BLOCK
      ?auto_626143 - BLOCK
      ?auto_626144 - BLOCK
      ?auto_626145 - BLOCK
      ?auto_626146 - BLOCK
      ?auto_626147 - BLOCK
    )
    :vars
    (
      ?auto_626148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626147 ?auto_626148 ) ( ON-TABLE ?auto_626132 ) ( ON ?auto_626133 ?auto_626132 ) ( ON ?auto_626134 ?auto_626133 ) ( ON ?auto_626135 ?auto_626134 ) ( ON ?auto_626136 ?auto_626135 ) ( not ( = ?auto_626132 ?auto_626133 ) ) ( not ( = ?auto_626132 ?auto_626134 ) ) ( not ( = ?auto_626132 ?auto_626135 ) ) ( not ( = ?auto_626132 ?auto_626136 ) ) ( not ( = ?auto_626132 ?auto_626137 ) ) ( not ( = ?auto_626132 ?auto_626138 ) ) ( not ( = ?auto_626132 ?auto_626139 ) ) ( not ( = ?auto_626132 ?auto_626140 ) ) ( not ( = ?auto_626132 ?auto_626141 ) ) ( not ( = ?auto_626132 ?auto_626142 ) ) ( not ( = ?auto_626132 ?auto_626143 ) ) ( not ( = ?auto_626132 ?auto_626144 ) ) ( not ( = ?auto_626132 ?auto_626145 ) ) ( not ( = ?auto_626132 ?auto_626146 ) ) ( not ( = ?auto_626132 ?auto_626147 ) ) ( not ( = ?auto_626132 ?auto_626148 ) ) ( not ( = ?auto_626133 ?auto_626134 ) ) ( not ( = ?auto_626133 ?auto_626135 ) ) ( not ( = ?auto_626133 ?auto_626136 ) ) ( not ( = ?auto_626133 ?auto_626137 ) ) ( not ( = ?auto_626133 ?auto_626138 ) ) ( not ( = ?auto_626133 ?auto_626139 ) ) ( not ( = ?auto_626133 ?auto_626140 ) ) ( not ( = ?auto_626133 ?auto_626141 ) ) ( not ( = ?auto_626133 ?auto_626142 ) ) ( not ( = ?auto_626133 ?auto_626143 ) ) ( not ( = ?auto_626133 ?auto_626144 ) ) ( not ( = ?auto_626133 ?auto_626145 ) ) ( not ( = ?auto_626133 ?auto_626146 ) ) ( not ( = ?auto_626133 ?auto_626147 ) ) ( not ( = ?auto_626133 ?auto_626148 ) ) ( not ( = ?auto_626134 ?auto_626135 ) ) ( not ( = ?auto_626134 ?auto_626136 ) ) ( not ( = ?auto_626134 ?auto_626137 ) ) ( not ( = ?auto_626134 ?auto_626138 ) ) ( not ( = ?auto_626134 ?auto_626139 ) ) ( not ( = ?auto_626134 ?auto_626140 ) ) ( not ( = ?auto_626134 ?auto_626141 ) ) ( not ( = ?auto_626134 ?auto_626142 ) ) ( not ( = ?auto_626134 ?auto_626143 ) ) ( not ( = ?auto_626134 ?auto_626144 ) ) ( not ( = ?auto_626134 ?auto_626145 ) ) ( not ( = ?auto_626134 ?auto_626146 ) ) ( not ( = ?auto_626134 ?auto_626147 ) ) ( not ( = ?auto_626134 ?auto_626148 ) ) ( not ( = ?auto_626135 ?auto_626136 ) ) ( not ( = ?auto_626135 ?auto_626137 ) ) ( not ( = ?auto_626135 ?auto_626138 ) ) ( not ( = ?auto_626135 ?auto_626139 ) ) ( not ( = ?auto_626135 ?auto_626140 ) ) ( not ( = ?auto_626135 ?auto_626141 ) ) ( not ( = ?auto_626135 ?auto_626142 ) ) ( not ( = ?auto_626135 ?auto_626143 ) ) ( not ( = ?auto_626135 ?auto_626144 ) ) ( not ( = ?auto_626135 ?auto_626145 ) ) ( not ( = ?auto_626135 ?auto_626146 ) ) ( not ( = ?auto_626135 ?auto_626147 ) ) ( not ( = ?auto_626135 ?auto_626148 ) ) ( not ( = ?auto_626136 ?auto_626137 ) ) ( not ( = ?auto_626136 ?auto_626138 ) ) ( not ( = ?auto_626136 ?auto_626139 ) ) ( not ( = ?auto_626136 ?auto_626140 ) ) ( not ( = ?auto_626136 ?auto_626141 ) ) ( not ( = ?auto_626136 ?auto_626142 ) ) ( not ( = ?auto_626136 ?auto_626143 ) ) ( not ( = ?auto_626136 ?auto_626144 ) ) ( not ( = ?auto_626136 ?auto_626145 ) ) ( not ( = ?auto_626136 ?auto_626146 ) ) ( not ( = ?auto_626136 ?auto_626147 ) ) ( not ( = ?auto_626136 ?auto_626148 ) ) ( not ( = ?auto_626137 ?auto_626138 ) ) ( not ( = ?auto_626137 ?auto_626139 ) ) ( not ( = ?auto_626137 ?auto_626140 ) ) ( not ( = ?auto_626137 ?auto_626141 ) ) ( not ( = ?auto_626137 ?auto_626142 ) ) ( not ( = ?auto_626137 ?auto_626143 ) ) ( not ( = ?auto_626137 ?auto_626144 ) ) ( not ( = ?auto_626137 ?auto_626145 ) ) ( not ( = ?auto_626137 ?auto_626146 ) ) ( not ( = ?auto_626137 ?auto_626147 ) ) ( not ( = ?auto_626137 ?auto_626148 ) ) ( not ( = ?auto_626138 ?auto_626139 ) ) ( not ( = ?auto_626138 ?auto_626140 ) ) ( not ( = ?auto_626138 ?auto_626141 ) ) ( not ( = ?auto_626138 ?auto_626142 ) ) ( not ( = ?auto_626138 ?auto_626143 ) ) ( not ( = ?auto_626138 ?auto_626144 ) ) ( not ( = ?auto_626138 ?auto_626145 ) ) ( not ( = ?auto_626138 ?auto_626146 ) ) ( not ( = ?auto_626138 ?auto_626147 ) ) ( not ( = ?auto_626138 ?auto_626148 ) ) ( not ( = ?auto_626139 ?auto_626140 ) ) ( not ( = ?auto_626139 ?auto_626141 ) ) ( not ( = ?auto_626139 ?auto_626142 ) ) ( not ( = ?auto_626139 ?auto_626143 ) ) ( not ( = ?auto_626139 ?auto_626144 ) ) ( not ( = ?auto_626139 ?auto_626145 ) ) ( not ( = ?auto_626139 ?auto_626146 ) ) ( not ( = ?auto_626139 ?auto_626147 ) ) ( not ( = ?auto_626139 ?auto_626148 ) ) ( not ( = ?auto_626140 ?auto_626141 ) ) ( not ( = ?auto_626140 ?auto_626142 ) ) ( not ( = ?auto_626140 ?auto_626143 ) ) ( not ( = ?auto_626140 ?auto_626144 ) ) ( not ( = ?auto_626140 ?auto_626145 ) ) ( not ( = ?auto_626140 ?auto_626146 ) ) ( not ( = ?auto_626140 ?auto_626147 ) ) ( not ( = ?auto_626140 ?auto_626148 ) ) ( not ( = ?auto_626141 ?auto_626142 ) ) ( not ( = ?auto_626141 ?auto_626143 ) ) ( not ( = ?auto_626141 ?auto_626144 ) ) ( not ( = ?auto_626141 ?auto_626145 ) ) ( not ( = ?auto_626141 ?auto_626146 ) ) ( not ( = ?auto_626141 ?auto_626147 ) ) ( not ( = ?auto_626141 ?auto_626148 ) ) ( not ( = ?auto_626142 ?auto_626143 ) ) ( not ( = ?auto_626142 ?auto_626144 ) ) ( not ( = ?auto_626142 ?auto_626145 ) ) ( not ( = ?auto_626142 ?auto_626146 ) ) ( not ( = ?auto_626142 ?auto_626147 ) ) ( not ( = ?auto_626142 ?auto_626148 ) ) ( not ( = ?auto_626143 ?auto_626144 ) ) ( not ( = ?auto_626143 ?auto_626145 ) ) ( not ( = ?auto_626143 ?auto_626146 ) ) ( not ( = ?auto_626143 ?auto_626147 ) ) ( not ( = ?auto_626143 ?auto_626148 ) ) ( not ( = ?auto_626144 ?auto_626145 ) ) ( not ( = ?auto_626144 ?auto_626146 ) ) ( not ( = ?auto_626144 ?auto_626147 ) ) ( not ( = ?auto_626144 ?auto_626148 ) ) ( not ( = ?auto_626145 ?auto_626146 ) ) ( not ( = ?auto_626145 ?auto_626147 ) ) ( not ( = ?auto_626145 ?auto_626148 ) ) ( not ( = ?auto_626146 ?auto_626147 ) ) ( not ( = ?auto_626146 ?auto_626148 ) ) ( not ( = ?auto_626147 ?auto_626148 ) ) ( ON ?auto_626146 ?auto_626147 ) ( ON ?auto_626145 ?auto_626146 ) ( ON ?auto_626144 ?auto_626145 ) ( ON ?auto_626143 ?auto_626144 ) ( ON ?auto_626142 ?auto_626143 ) ( ON ?auto_626141 ?auto_626142 ) ( ON ?auto_626140 ?auto_626141 ) ( ON ?auto_626139 ?auto_626140 ) ( ON ?auto_626138 ?auto_626139 ) ( CLEAR ?auto_626136 ) ( ON ?auto_626137 ?auto_626138 ) ( CLEAR ?auto_626137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_626132 ?auto_626133 ?auto_626134 ?auto_626135 ?auto_626136 ?auto_626137 )
      ( MAKE-16PILE ?auto_626132 ?auto_626133 ?auto_626134 ?auto_626135 ?auto_626136 ?auto_626137 ?auto_626138 ?auto_626139 ?auto_626140 ?auto_626141 ?auto_626142 ?auto_626143 ?auto_626144 ?auto_626145 ?auto_626146 ?auto_626147 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626198 - BLOCK
      ?auto_626199 - BLOCK
      ?auto_626200 - BLOCK
      ?auto_626201 - BLOCK
      ?auto_626202 - BLOCK
      ?auto_626203 - BLOCK
      ?auto_626204 - BLOCK
      ?auto_626205 - BLOCK
      ?auto_626206 - BLOCK
      ?auto_626207 - BLOCK
      ?auto_626208 - BLOCK
      ?auto_626209 - BLOCK
      ?auto_626210 - BLOCK
      ?auto_626211 - BLOCK
      ?auto_626212 - BLOCK
      ?auto_626213 - BLOCK
    )
    :vars
    (
      ?auto_626214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626213 ?auto_626214 ) ( ON-TABLE ?auto_626198 ) ( ON ?auto_626199 ?auto_626198 ) ( ON ?auto_626200 ?auto_626199 ) ( ON ?auto_626201 ?auto_626200 ) ( not ( = ?auto_626198 ?auto_626199 ) ) ( not ( = ?auto_626198 ?auto_626200 ) ) ( not ( = ?auto_626198 ?auto_626201 ) ) ( not ( = ?auto_626198 ?auto_626202 ) ) ( not ( = ?auto_626198 ?auto_626203 ) ) ( not ( = ?auto_626198 ?auto_626204 ) ) ( not ( = ?auto_626198 ?auto_626205 ) ) ( not ( = ?auto_626198 ?auto_626206 ) ) ( not ( = ?auto_626198 ?auto_626207 ) ) ( not ( = ?auto_626198 ?auto_626208 ) ) ( not ( = ?auto_626198 ?auto_626209 ) ) ( not ( = ?auto_626198 ?auto_626210 ) ) ( not ( = ?auto_626198 ?auto_626211 ) ) ( not ( = ?auto_626198 ?auto_626212 ) ) ( not ( = ?auto_626198 ?auto_626213 ) ) ( not ( = ?auto_626198 ?auto_626214 ) ) ( not ( = ?auto_626199 ?auto_626200 ) ) ( not ( = ?auto_626199 ?auto_626201 ) ) ( not ( = ?auto_626199 ?auto_626202 ) ) ( not ( = ?auto_626199 ?auto_626203 ) ) ( not ( = ?auto_626199 ?auto_626204 ) ) ( not ( = ?auto_626199 ?auto_626205 ) ) ( not ( = ?auto_626199 ?auto_626206 ) ) ( not ( = ?auto_626199 ?auto_626207 ) ) ( not ( = ?auto_626199 ?auto_626208 ) ) ( not ( = ?auto_626199 ?auto_626209 ) ) ( not ( = ?auto_626199 ?auto_626210 ) ) ( not ( = ?auto_626199 ?auto_626211 ) ) ( not ( = ?auto_626199 ?auto_626212 ) ) ( not ( = ?auto_626199 ?auto_626213 ) ) ( not ( = ?auto_626199 ?auto_626214 ) ) ( not ( = ?auto_626200 ?auto_626201 ) ) ( not ( = ?auto_626200 ?auto_626202 ) ) ( not ( = ?auto_626200 ?auto_626203 ) ) ( not ( = ?auto_626200 ?auto_626204 ) ) ( not ( = ?auto_626200 ?auto_626205 ) ) ( not ( = ?auto_626200 ?auto_626206 ) ) ( not ( = ?auto_626200 ?auto_626207 ) ) ( not ( = ?auto_626200 ?auto_626208 ) ) ( not ( = ?auto_626200 ?auto_626209 ) ) ( not ( = ?auto_626200 ?auto_626210 ) ) ( not ( = ?auto_626200 ?auto_626211 ) ) ( not ( = ?auto_626200 ?auto_626212 ) ) ( not ( = ?auto_626200 ?auto_626213 ) ) ( not ( = ?auto_626200 ?auto_626214 ) ) ( not ( = ?auto_626201 ?auto_626202 ) ) ( not ( = ?auto_626201 ?auto_626203 ) ) ( not ( = ?auto_626201 ?auto_626204 ) ) ( not ( = ?auto_626201 ?auto_626205 ) ) ( not ( = ?auto_626201 ?auto_626206 ) ) ( not ( = ?auto_626201 ?auto_626207 ) ) ( not ( = ?auto_626201 ?auto_626208 ) ) ( not ( = ?auto_626201 ?auto_626209 ) ) ( not ( = ?auto_626201 ?auto_626210 ) ) ( not ( = ?auto_626201 ?auto_626211 ) ) ( not ( = ?auto_626201 ?auto_626212 ) ) ( not ( = ?auto_626201 ?auto_626213 ) ) ( not ( = ?auto_626201 ?auto_626214 ) ) ( not ( = ?auto_626202 ?auto_626203 ) ) ( not ( = ?auto_626202 ?auto_626204 ) ) ( not ( = ?auto_626202 ?auto_626205 ) ) ( not ( = ?auto_626202 ?auto_626206 ) ) ( not ( = ?auto_626202 ?auto_626207 ) ) ( not ( = ?auto_626202 ?auto_626208 ) ) ( not ( = ?auto_626202 ?auto_626209 ) ) ( not ( = ?auto_626202 ?auto_626210 ) ) ( not ( = ?auto_626202 ?auto_626211 ) ) ( not ( = ?auto_626202 ?auto_626212 ) ) ( not ( = ?auto_626202 ?auto_626213 ) ) ( not ( = ?auto_626202 ?auto_626214 ) ) ( not ( = ?auto_626203 ?auto_626204 ) ) ( not ( = ?auto_626203 ?auto_626205 ) ) ( not ( = ?auto_626203 ?auto_626206 ) ) ( not ( = ?auto_626203 ?auto_626207 ) ) ( not ( = ?auto_626203 ?auto_626208 ) ) ( not ( = ?auto_626203 ?auto_626209 ) ) ( not ( = ?auto_626203 ?auto_626210 ) ) ( not ( = ?auto_626203 ?auto_626211 ) ) ( not ( = ?auto_626203 ?auto_626212 ) ) ( not ( = ?auto_626203 ?auto_626213 ) ) ( not ( = ?auto_626203 ?auto_626214 ) ) ( not ( = ?auto_626204 ?auto_626205 ) ) ( not ( = ?auto_626204 ?auto_626206 ) ) ( not ( = ?auto_626204 ?auto_626207 ) ) ( not ( = ?auto_626204 ?auto_626208 ) ) ( not ( = ?auto_626204 ?auto_626209 ) ) ( not ( = ?auto_626204 ?auto_626210 ) ) ( not ( = ?auto_626204 ?auto_626211 ) ) ( not ( = ?auto_626204 ?auto_626212 ) ) ( not ( = ?auto_626204 ?auto_626213 ) ) ( not ( = ?auto_626204 ?auto_626214 ) ) ( not ( = ?auto_626205 ?auto_626206 ) ) ( not ( = ?auto_626205 ?auto_626207 ) ) ( not ( = ?auto_626205 ?auto_626208 ) ) ( not ( = ?auto_626205 ?auto_626209 ) ) ( not ( = ?auto_626205 ?auto_626210 ) ) ( not ( = ?auto_626205 ?auto_626211 ) ) ( not ( = ?auto_626205 ?auto_626212 ) ) ( not ( = ?auto_626205 ?auto_626213 ) ) ( not ( = ?auto_626205 ?auto_626214 ) ) ( not ( = ?auto_626206 ?auto_626207 ) ) ( not ( = ?auto_626206 ?auto_626208 ) ) ( not ( = ?auto_626206 ?auto_626209 ) ) ( not ( = ?auto_626206 ?auto_626210 ) ) ( not ( = ?auto_626206 ?auto_626211 ) ) ( not ( = ?auto_626206 ?auto_626212 ) ) ( not ( = ?auto_626206 ?auto_626213 ) ) ( not ( = ?auto_626206 ?auto_626214 ) ) ( not ( = ?auto_626207 ?auto_626208 ) ) ( not ( = ?auto_626207 ?auto_626209 ) ) ( not ( = ?auto_626207 ?auto_626210 ) ) ( not ( = ?auto_626207 ?auto_626211 ) ) ( not ( = ?auto_626207 ?auto_626212 ) ) ( not ( = ?auto_626207 ?auto_626213 ) ) ( not ( = ?auto_626207 ?auto_626214 ) ) ( not ( = ?auto_626208 ?auto_626209 ) ) ( not ( = ?auto_626208 ?auto_626210 ) ) ( not ( = ?auto_626208 ?auto_626211 ) ) ( not ( = ?auto_626208 ?auto_626212 ) ) ( not ( = ?auto_626208 ?auto_626213 ) ) ( not ( = ?auto_626208 ?auto_626214 ) ) ( not ( = ?auto_626209 ?auto_626210 ) ) ( not ( = ?auto_626209 ?auto_626211 ) ) ( not ( = ?auto_626209 ?auto_626212 ) ) ( not ( = ?auto_626209 ?auto_626213 ) ) ( not ( = ?auto_626209 ?auto_626214 ) ) ( not ( = ?auto_626210 ?auto_626211 ) ) ( not ( = ?auto_626210 ?auto_626212 ) ) ( not ( = ?auto_626210 ?auto_626213 ) ) ( not ( = ?auto_626210 ?auto_626214 ) ) ( not ( = ?auto_626211 ?auto_626212 ) ) ( not ( = ?auto_626211 ?auto_626213 ) ) ( not ( = ?auto_626211 ?auto_626214 ) ) ( not ( = ?auto_626212 ?auto_626213 ) ) ( not ( = ?auto_626212 ?auto_626214 ) ) ( not ( = ?auto_626213 ?auto_626214 ) ) ( ON ?auto_626212 ?auto_626213 ) ( ON ?auto_626211 ?auto_626212 ) ( ON ?auto_626210 ?auto_626211 ) ( ON ?auto_626209 ?auto_626210 ) ( ON ?auto_626208 ?auto_626209 ) ( ON ?auto_626207 ?auto_626208 ) ( ON ?auto_626206 ?auto_626207 ) ( ON ?auto_626205 ?auto_626206 ) ( ON ?auto_626204 ?auto_626205 ) ( ON ?auto_626203 ?auto_626204 ) ( CLEAR ?auto_626201 ) ( ON ?auto_626202 ?auto_626203 ) ( CLEAR ?auto_626202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_626198 ?auto_626199 ?auto_626200 ?auto_626201 ?auto_626202 )
      ( MAKE-16PILE ?auto_626198 ?auto_626199 ?auto_626200 ?auto_626201 ?auto_626202 ?auto_626203 ?auto_626204 ?auto_626205 ?auto_626206 ?auto_626207 ?auto_626208 ?auto_626209 ?auto_626210 ?auto_626211 ?auto_626212 ?auto_626213 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626264 - BLOCK
      ?auto_626265 - BLOCK
      ?auto_626266 - BLOCK
      ?auto_626267 - BLOCK
      ?auto_626268 - BLOCK
      ?auto_626269 - BLOCK
      ?auto_626270 - BLOCK
      ?auto_626271 - BLOCK
      ?auto_626272 - BLOCK
      ?auto_626273 - BLOCK
      ?auto_626274 - BLOCK
      ?auto_626275 - BLOCK
      ?auto_626276 - BLOCK
      ?auto_626277 - BLOCK
      ?auto_626278 - BLOCK
      ?auto_626279 - BLOCK
    )
    :vars
    (
      ?auto_626280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626279 ?auto_626280 ) ( ON-TABLE ?auto_626264 ) ( ON ?auto_626265 ?auto_626264 ) ( ON ?auto_626266 ?auto_626265 ) ( not ( = ?auto_626264 ?auto_626265 ) ) ( not ( = ?auto_626264 ?auto_626266 ) ) ( not ( = ?auto_626264 ?auto_626267 ) ) ( not ( = ?auto_626264 ?auto_626268 ) ) ( not ( = ?auto_626264 ?auto_626269 ) ) ( not ( = ?auto_626264 ?auto_626270 ) ) ( not ( = ?auto_626264 ?auto_626271 ) ) ( not ( = ?auto_626264 ?auto_626272 ) ) ( not ( = ?auto_626264 ?auto_626273 ) ) ( not ( = ?auto_626264 ?auto_626274 ) ) ( not ( = ?auto_626264 ?auto_626275 ) ) ( not ( = ?auto_626264 ?auto_626276 ) ) ( not ( = ?auto_626264 ?auto_626277 ) ) ( not ( = ?auto_626264 ?auto_626278 ) ) ( not ( = ?auto_626264 ?auto_626279 ) ) ( not ( = ?auto_626264 ?auto_626280 ) ) ( not ( = ?auto_626265 ?auto_626266 ) ) ( not ( = ?auto_626265 ?auto_626267 ) ) ( not ( = ?auto_626265 ?auto_626268 ) ) ( not ( = ?auto_626265 ?auto_626269 ) ) ( not ( = ?auto_626265 ?auto_626270 ) ) ( not ( = ?auto_626265 ?auto_626271 ) ) ( not ( = ?auto_626265 ?auto_626272 ) ) ( not ( = ?auto_626265 ?auto_626273 ) ) ( not ( = ?auto_626265 ?auto_626274 ) ) ( not ( = ?auto_626265 ?auto_626275 ) ) ( not ( = ?auto_626265 ?auto_626276 ) ) ( not ( = ?auto_626265 ?auto_626277 ) ) ( not ( = ?auto_626265 ?auto_626278 ) ) ( not ( = ?auto_626265 ?auto_626279 ) ) ( not ( = ?auto_626265 ?auto_626280 ) ) ( not ( = ?auto_626266 ?auto_626267 ) ) ( not ( = ?auto_626266 ?auto_626268 ) ) ( not ( = ?auto_626266 ?auto_626269 ) ) ( not ( = ?auto_626266 ?auto_626270 ) ) ( not ( = ?auto_626266 ?auto_626271 ) ) ( not ( = ?auto_626266 ?auto_626272 ) ) ( not ( = ?auto_626266 ?auto_626273 ) ) ( not ( = ?auto_626266 ?auto_626274 ) ) ( not ( = ?auto_626266 ?auto_626275 ) ) ( not ( = ?auto_626266 ?auto_626276 ) ) ( not ( = ?auto_626266 ?auto_626277 ) ) ( not ( = ?auto_626266 ?auto_626278 ) ) ( not ( = ?auto_626266 ?auto_626279 ) ) ( not ( = ?auto_626266 ?auto_626280 ) ) ( not ( = ?auto_626267 ?auto_626268 ) ) ( not ( = ?auto_626267 ?auto_626269 ) ) ( not ( = ?auto_626267 ?auto_626270 ) ) ( not ( = ?auto_626267 ?auto_626271 ) ) ( not ( = ?auto_626267 ?auto_626272 ) ) ( not ( = ?auto_626267 ?auto_626273 ) ) ( not ( = ?auto_626267 ?auto_626274 ) ) ( not ( = ?auto_626267 ?auto_626275 ) ) ( not ( = ?auto_626267 ?auto_626276 ) ) ( not ( = ?auto_626267 ?auto_626277 ) ) ( not ( = ?auto_626267 ?auto_626278 ) ) ( not ( = ?auto_626267 ?auto_626279 ) ) ( not ( = ?auto_626267 ?auto_626280 ) ) ( not ( = ?auto_626268 ?auto_626269 ) ) ( not ( = ?auto_626268 ?auto_626270 ) ) ( not ( = ?auto_626268 ?auto_626271 ) ) ( not ( = ?auto_626268 ?auto_626272 ) ) ( not ( = ?auto_626268 ?auto_626273 ) ) ( not ( = ?auto_626268 ?auto_626274 ) ) ( not ( = ?auto_626268 ?auto_626275 ) ) ( not ( = ?auto_626268 ?auto_626276 ) ) ( not ( = ?auto_626268 ?auto_626277 ) ) ( not ( = ?auto_626268 ?auto_626278 ) ) ( not ( = ?auto_626268 ?auto_626279 ) ) ( not ( = ?auto_626268 ?auto_626280 ) ) ( not ( = ?auto_626269 ?auto_626270 ) ) ( not ( = ?auto_626269 ?auto_626271 ) ) ( not ( = ?auto_626269 ?auto_626272 ) ) ( not ( = ?auto_626269 ?auto_626273 ) ) ( not ( = ?auto_626269 ?auto_626274 ) ) ( not ( = ?auto_626269 ?auto_626275 ) ) ( not ( = ?auto_626269 ?auto_626276 ) ) ( not ( = ?auto_626269 ?auto_626277 ) ) ( not ( = ?auto_626269 ?auto_626278 ) ) ( not ( = ?auto_626269 ?auto_626279 ) ) ( not ( = ?auto_626269 ?auto_626280 ) ) ( not ( = ?auto_626270 ?auto_626271 ) ) ( not ( = ?auto_626270 ?auto_626272 ) ) ( not ( = ?auto_626270 ?auto_626273 ) ) ( not ( = ?auto_626270 ?auto_626274 ) ) ( not ( = ?auto_626270 ?auto_626275 ) ) ( not ( = ?auto_626270 ?auto_626276 ) ) ( not ( = ?auto_626270 ?auto_626277 ) ) ( not ( = ?auto_626270 ?auto_626278 ) ) ( not ( = ?auto_626270 ?auto_626279 ) ) ( not ( = ?auto_626270 ?auto_626280 ) ) ( not ( = ?auto_626271 ?auto_626272 ) ) ( not ( = ?auto_626271 ?auto_626273 ) ) ( not ( = ?auto_626271 ?auto_626274 ) ) ( not ( = ?auto_626271 ?auto_626275 ) ) ( not ( = ?auto_626271 ?auto_626276 ) ) ( not ( = ?auto_626271 ?auto_626277 ) ) ( not ( = ?auto_626271 ?auto_626278 ) ) ( not ( = ?auto_626271 ?auto_626279 ) ) ( not ( = ?auto_626271 ?auto_626280 ) ) ( not ( = ?auto_626272 ?auto_626273 ) ) ( not ( = ?auto_626272 ?auto_626274 ) ) ( not ( = ?auto_626272 ?auto_626275 ) ) ( not ( = ?auto_626272 ?auto_626276 ) ) ( not ( = ?auto_626272 ?auto_626277 ) ) ( not ( = ?auto_626272 ?auto_626278 ) ) ( not ( = ?auto_626272 ?auto_626279 ) ) ( not ( = ?auto_626272 ?auto_626280 ) ) ( not ( = ?auto_626273 ?auto_626274 ) ) ( not ( = ?auto_626273 ?auto_626275 ) ) ( not ( = ?auto_626273 ?auto_626276 ) ) ( not ( = ?auto_626273 ?auto_626277 ) ) ( not ( = ?auto_626273 ?auto_626278 ) ) ( not ( = ?auto_626273 ?auto_626279 ) ) ( not ( = ?auto_626273 ?auto_626280 ) ) ( not ( = ?auto_626274 ?auto_626275 ) ) ( not ( = ?auto_626274 ?auto_626276 ) ) ( not ( = ?auto_626274 ?auto_626277 ) ) ( not ( = ?auto_626274 ?auto_626278 ) ) ( not ( = ?auto_626274 ?auto_626279 ) ) ( not ( = ?auto_626274 ?auto_626280 ) ) ( not ( = ?auto_626275 ?auto_626276 ) ) ( not ( = ?auto_626275 ?auto_626277 ) ) ( not ( = ?auto_626275 ?auto_626278 ) ) ( not ( = ?auto_626275 ?auto_626279 ) ) ( not ( = ?auto_626275 ?auto_626280 ) ) ( not ( = ?auto_626276 ?auto_626277 ) ) ( not ( = ?auto_626276 ?auto_626278 ) ) ( not ( = ?auto_626276 ?auto_626279 ) ) ( not ( = ?auto_626276 ?auto_626280 ) ) ( not ( = ?auto_626277 ?auto_626278 ) ) ( not ( = ?auto_626277 ?auto_626279 ) ) ( not ( = ?auto_626277 ?auto_626280 ) ) ( not ( = ?auto_626278 ?auto_626279 ) ) ( not ( = ?auto_626278 ?auto_626280 ) ) ( not ( = ?auto_626279 ?auto_626280 ) ) ( ON ?auto_626278 ?auto_626279 ) ( ON ?auto_626277 ?auto_626278 ) ( ON ?auto_626276 ?auto_626277 ) ( ON ?auto_626275 ?auto_626276 ) ( ON ?auto_626274 ?auto_626275 ) ( ON ?auto_626273 ?auto_626274 ) ( ON ?auto_626272 ?auto_626273 ) ( ON ?auto_626271 ?auto_626272 ) ( ON ?auto_626270 ?auto_626271 ) ( ON ?auto_626269 ?auto_626270 ) ( ON ?auto_626268 ?auto_626269 ) ( CLEAR ?auto_626266 ) ( ON ?auto_626267 ?auto_626268 ) ( CLEAR ?auto_626267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_626264 ?auto_626265 ?auto_626266 ?auto_626267 )
      ( MAKE-16PILE ?auto_626264 ?auto_626265 ?auto_626266 ?auto_626267 ?auto_626268 ?auto_626269 ?auto_626270 ?auto_626271 ?auto_626272 ?auto_626273 ?auto_626274 ?auto_626275 ?auto_626276 ?auto_626277 ?auto_626278 ?auto_626279 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626330 - BLOCK
      ?auto_626331 - BLOCK
      ?auto_626332 - BLOCK
      ?auto_626333 - BLOCK
      ?auto_626334 - BLOCK
      ?auto_626335 - BLOCK
      ?auto_626336 - BLOCK
      ?auto_626337 - BLOCK
      ?auto_626338 - BLOCK
      ?auto_626339 - BLOCK
      ?auto_626340 - BLOCK
      ?auto_626341 - BLOCK
      ?auto_626342 - BLOCK
      ?auto_626343 - BLOCK
      ?auto_626344 - BLOCK
      ?auto_626345 - BLOCK
    )
    :vars
    (
      ?auto_626346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626345 ?auto_626346 ) ( ON-TABLE ?auto_626330 ) ( ON ?auto_626331 ?auto_626330 ) ( not ( = ?auto_626330 ?auto_626331 ) ) ( not ( = ?auto_626330 ?auto_626332 ) ) ( not ( = ?auto_626330 ?auto_626333 ) ) ( not ( = ?auto_626330 ?auto_626334 ) ) ( not ( = ?auto_626330 ?auto_626335 ) ) ( not ( = ?auto_626330 ?auto_626336 ) ) ( not ( = ?auto_626330 ?auto_626337 ) ) ( not ( = ?auto_626330 ?auto_626338 ) ) ( not ( = ?auto_626330 ?auto_626339 ) ) ( not ( = ?auto_626330 ?auto_626340 ) ) ( not ( = ?auto_626330 ?auto_626341 ) ) ( not ( = ?auto_626330 ?auto_626342 ) ) ( not ( = ?auto_626330 ?auto_626343 ) ) ( not ( = ?auto_626330 ?auto_626344 ) ) ( not ( = ?auto_626330 ?auto_626345 ) ) ( not ( = ?auto_626330 ?auto_626346 ) ) ( not ( = ?auto_626331 ?auto_626332 ) ) ( not ( = ?auto_626331 ?auto_626333 ) ) ( not ( = ?auto_626331 ?auto_626334 ) ) ( not ( = ?auto_626331 ?auto_626335 ) ) ( not ( = ?auto_626331 ?auto_626336 ) ) ( not ( = ?auto_626331 ?auto_626337 ) ) ( not ( = ?auto_626331 ?auto_626338 ) ) ( not ( = ?auto_626331 ?auto_626339 ) ) ( not ( = ?auto_626331 ?auto_626340 ) ) ( not ( = ?auto_626331 ?auto_626341 ) ) ( not ( = ?auto_626331 ?auto_626342 ) ) ( not ( = ?auto_626331 ?auto_626343 ) ) ( not ( = ?auto_626331 ?auto_626344 ) ) ( not ( = ?auto_626331 ?auto_626345 ) ) ( not ( = ?auto_626331 ?auto_626346 ) ) ( not ( = ?auto_626332 ?auto_626333 ) ) ( not ( = ?auto_626332 ?auto_626334 ) ) ( not ( = ?auto_626332 ?auto_626335 ) ) ( not ( = ?auto_626332 ?auto_626336 ) ) ( not ( = ?auto_626332 ?auto_626337 ) ) ( not ( = ?auto_626332 ?auto_626338 ) ) ( not ( = ?auto_626332 ?auto_626339 ) ) ( not ( = ?auto_626332 ?auto_626340 ) ) ( not ( = ?auto_626332 ?auto_626341 ) ) ( not ( = ?auto_626332 ?auto_626342 ) ) ( not ( = ?auto_626332 ?auto_626343 ) ) ( not ( = ?auto_626332 ?auto_626344 ) ) ( not ( = ?auto_626332 ?auto_626345 ) ) ( not ( = ?auto_626332 ?auto_626346 ) ) ( not ( = ?auto_626333 ?auto_626334 ) ) ( not ( = ?auto_626333 ?auto_626335 ) ) ( not ( = ?auto_626333 ?auto_626336 ) ) ( not ( = ?auto_626333 ?auto_626337 ) ) ( not ( = ?auto_626333 ?auto_626338 ) ) ( not ( = ?auto_626333 ?auto_626339 ) ) ( not ( = ?auto_626333 ?auto_626340 ) ) ( not ( = ?auto_626333 ?auto_626341 ) ) ( not ( = ?auto_626333 ?auto_626342 ) ) ( not ( = ?auto_626333 ?auto_626343 ) ) ( not ( = ?auto_626333 ?auto_626344 ) ) ( not ( = ?auto_626333 ?auto_626345 ) ) ( not ( = ?auto_626333 ?auto_626346 ) ) ( not ( = ?auto_626334 ?auto_626335 ) ) ( not ( = ?auto_626334 ?auto_626336 ) ) ( not ( = ?auto_626334 ?auto_626337 ) ) ( not ( = ?auto_626334 ?auto_626338 ) ) ( not ( = ?auto_626334 ?auto_626339 ) ) ( not ( = ?auto_626334 ?auto_626340 ) ) ( not ( = ?auto_626334 ?auto_626341 ) ) ( not ( = ?auto_626334 ?auto_626342 ) ) ( not ( = ?auto_626334 ?auto_626343 ) ) ( not ( = ?auto_626334 ?auto_626344 ) ) ( not ( = ?auto_626334 ?auto_626345 ) ) ( not ( = ?auto_626334 ?auto_626346 ) ) ( not ( = ?auto_626335 ?auto_626336 ) ) ( not ( = ?auto_626335 ?auto_626337 ) ) ( not ( = ?auto_626335 ?auto_626338 ) ) ( not ( = ?auto_626335 ?auto_626339 ) ) ( not ( = ?auto_626335 ?auto_626340 ) ) ( not ( = ?auto_626335 ?auto_626341 ) ) ( not ( = ?auto_626335 ?auto_626342 ) ) ( not ( = ?auto_626335 ?auto_626343 ) ) ( not ( = ?auto_626335 ?auto_626344 ) ) ( not ( = ?auto_626335 ?auto_626345 ) ) ( not ( = ?auto_626335 ?auto_626346 ) ) ( not ( = ?auto_626336 ?auto_626337 ) ) ( not ( = ?auto_626336 ?auto_626338 ) ) ( not ( = ?auto_626336 ?auto_626339 ) ) ( not ( = ?auto_626336 ?auto_626340 ) ) ( not ( = ?auto_626336 ?auto_626341 ) ) ( not ( = ?auto_626336 ?auto_626342 ) ) ( not ( = ?auto_626336 ?auto_626343 ) ) ( not ( = ?auto_626336 ?auto_626344 ) ) ( not ( = ?auto_626336 ?auto_626345 ) ) ( not ( = ?auto_626336 ?auto_626346 ) ) ( not ( = ?auto_626337 ?auto_626338 ) ) ( not ( = ?auto_626337 ?auto_626339 ) ) ( not ( = ?auto_626337 ?auto_626340 ) ) ( not ( = ?auto_626337 ?auto_626341 ) ) ( not ( = ?auto_626337 ?auto_626342 ) ) ( not ( = ?auto_626337 ?auto_626343 ) ) ( not ( = ?auto_626337 ?auto_626344 ) ) ( not ( = ?auto_626337 ?auto_626345 ) ) ( not ( = ?auto_626337 ?auto_626346 ) ) ( not ( = ?auto_626338 ?auto_626339 ) ) ( not ( = ?auto_626338 ?auto_626340 ) ) ( not ( = ?auto_626338 ?auto_626341 ) ) ( not ( = ?auto_626338 ?auto_626342 ) ) ( not ( = ?auto_626338 ?auto_626343 ) ) ( not ( = ?auto_626338 ?auto_626344 ) ) ( not ( = ?auto_626338 ?auto_626345 ) ) ( not ( = ?auto_626338 ?auto_626346 ) ) ( not ( = ?auto_626339 ?auto_626340 ) ) ( not ( = ?auto_626339 ?auto_626341 ) ) ( not ( = ?auto_626339 ?auto_626342 ) ) ( not ( = ?auto_626339 ?auto_626343 ) ) ( not ( = ?auto_626339 ?auto_626344 ) ) ( not ( = ?auto_626339 ?auto_626345 ) ) ( not ( = ?auto_626339 ?auto_626346 ) ) ( not ( = ?auto_626340 ?auto_626341 ) ) ( not ( = ?auto_626340 ?auto_626342 ) ) ( not ( = ?auto_626340 ?auto_626343 ) ) ( not ( = ?auto_626340 ?auto_626344 ) ) ( not ( = ?auto_626340 ?auto_626345 ) ) ( not ( = ?auto_626340 ?auto_626346 ) ) ( not ( = ?auto_626341 ?auto_626342 ) ) ( not ( = ?auto_626341 ?auto_626343 ) ) ( not ( = ?auto_626341 ?auto_626344 ) ) ( not ( = ?auto_626341 ?auto_626345 ) ) ( not ( = ?auto_626341 ?auto_626346 ) ) ( not ( = ?auto_626342 ?auto_626343 ) ) ( not ( = ?auto_626342 ?auto_626344 ) ) ( not ( = ?auto_626342 ?auto_626345 ) ) ( not ( = ?auto_626342 ?auto_626346 ) ) ( not ( = ?auto_626343 ?auto_626344 ) ) ( not ( = ?auto_626343 ?auto_626345 ) ) ( not ( = ?auto_626343 ?auto_626346 ) ) ( not ( = ?auto_626344 ?auto_626345 ) ) ( not ( = ?auto_626344 ?auto_626346 ) ) ( not ( = ?auto_626345 ?auto_626346 ) ) ( ON ?auto_626344 ?auto_626345 ) ( ON ?auto_626343 ?auto_626344 ) ( ON ?auto_626342 ?auto_626343 ) ( ON ?auto_626341 ?auto_626342 ) ( ON ?auto_626340 ?auto_626341 ) ( ON ?auto_626339 ?auto_626340 ) ( ON ?auto_626338 ?auto_626339 ) ( ON ?auto_626337 ?auto_626338 ) ( ON ?auto_626336 ?auto_626337 ) ( ON ?auto_626335 ?auto_626336 ) ( ON ?auto_626334 ?auto_626335 ) ( ON ?auto_626333 ?auto_626334 ) ( CLEAR ?auto_626331 ) ( ON ?auto_626332 ?auto_626333 ) ( CLEAR ?auto_626332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_626330 ?auto_626331 ?auto_626332 )
      ( MAKE-16PILE ?auto_626330 ?auto_626331 ?auto_626332 ?auto_626333 ?auto_626334 ?auto_626335 ?auto_626336 ?auto_626337 ?auto_626338 ?auto_626339 ?auto_626340 ?auto_626341 ?auto_626342 ?auto_626343 ?auto_626344 ?auto_626345 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626396 - BLOCK
      ?auto_626397 - BLOCK
      ?auto_626398 - BLOCK
      ?auto_626399 - BLOCK
      ?auto_626400 - BLOCK
      ?auto_626401 - BLOCK
      ?auto_626402 - BLOCK
      ?auto_626403 - BLOCK
      ?auto_626404 - BLOCK
      ?auto_626405 - BLOCK
      ?auto_626406 - BLOCK
      ?auto_626407 - BLOCK
      ?auto_626408 - BLOCK
      ?auto_626409 - BLOCK
      ?auto_626410 - BLOCK
      ?auto_626411 - BLOCK
    )
    :vars
    (
      ?auto_626412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626411 ?auto_626412 ) ( ON-TABLE ?auto_626396 ) ( not ( = ?auto_626396 ?auto_626397 ) ) ( not ( = ?auto_626396 ?auto_626398 ) ) ( not ( = ?auto_626396 ?auto_626399 ) ) ( not ( = ?auto_626396 ?auto_626400 ) ) ( not ( = ?auto_626396 ?auto_626401 ) ) ( not ( = ?auto_626396 ?auto_626402 ) ) ( not ( = ?auto_626396 ?auto_626403 ) ) ( not ( = ?auto_626396 ?auto_626404 ) ) ( not ( = ?auto_626396 ?auto_626405 ) ) ( not ( = ?auto_626396 ?auto_626406 ) ) ( not ( = ?auto_626396 ?auto_626407 ) ) ( not ( = ?auto_626396 ?auto_626408 ) ) ( not ( = ?auto_626396 ?auto_626409 ) ) ( not ( = ?auto_626396 ?auto_626410 ) ) ( not ( = ?auto_626396 ?auto_626411 ) ) ( not ( = ?auto_626396 ?auto_626412 ) ) ( not ( = ?auto_626397 ?auto_626398 ) ) ( not ( = ?auto_626397 ?auto_626399 ) ) ( not ( = ?auto_626397 ?auto_626400 ) ) ( not ( = ?auto_626397 ?auto_626401 ) ) ( not ( = ?auto_626397 ?auto_626402 ) ) ( not ( = ?auto_626397 ?auto_626403 ) ) ( not ( = ?auto_626397 ?auto_626404 ) ) ( not ( = ?auto_626397 ?auto_626405 ) ) ( not ( = ?auto_626397 ?auto_626406 ) ) ( not ( = ?auto_626397 ?auto_626407 ) ) ( not ( = ?auto_626397 ?auto_626408 ) ) ( not ( = ?auto_626397 ?auto_626409 ) ) ( not ( = ?auto_626397 ?auto_626410 ) ) ( not ( = ?auto_626397 ?auto_626411 ) ) ( not ( = ?auto_626397 ?auto_626412 ) ) ( not ( = ?auto_626398 ?auto_626399 ) ) ( not ( = ?auto_626398 ?auto_626400 ) ) ( not ( = ?auto_626398 ?auto_626401 ) ) ( not ( = ?auto_626398 ?auto_626402 ) ) ( not ( = ?auto_626398 ?auto_626403 ) ) ( not ( = ?auto_626398 ?auto_626404 ) ) ( not ( = ?auto_626398 ?auto_626405 ) ) ( not ( = ?auto_626398 ?auto_626406 ) ) ( not ( = ?auto_626398 ?auto_626407 ) ) ( not ( = ?auto_626398 ?auto_626408 ) ) ( not ( = ?auto_626398 ?auto_626409 ) ) ( not ( = ?auto_626398 ?auto_626410 ) ) ( not ( = ?auto_626398 ?auto_626411 ) ) ( not ( = ?auto_626398 ?auto_626412 ) ) ( not ( = ?auto_626399 ?auto_626400 ) ) ( not ( = ?auto_626399 ?auto_626401 ) ) ( not ( = ?auto_626399 ?auto_626402 ) ) ( not ( = ?auto_626399 ?auto_626403 ) ) ( not ( = ?auto_626399 ?auto_626404 ) ) ( not ( = ?auto_626399 ?auto_626405 ) ) ( not ( = ?auto_626399 ?auto_626406 ) ) ( not ( = ?auto_626399 ?auto_626407 ) ) ( not ( = ?auto_626399 ?auto_626408 ) ) ( not ( = ?auto_626399 ?auto_626409 ) ) ( not ( = ?auto_626399 ?auto_626410 ) ) ( not ( = ?auto_626399 ?auto_626411 ) ) ( not ( = ?auto_626399 ?auto_626412 ) ) ( not ( = ?auto_626400 ?auto_626401 ) ) ( not ( = ?auto_626400 ?auto_626402 ) ) ( not ( = ?auto_626400 ?auto_626403 ) ) ( not ( = ?auto_626400 ?auto_626404 ) ) ( not ( = ?auto_626400 ?auto_626405 ) ) ( not ( = ?auto_626400 ?auto_626406 ) ) ( not ( = ?auto_626400 ?auto_626407 ) ) ( not ( = ?auto_626400 ?auto_626408 ) ) ( not ( = ?auto_626400 ?auto_626409 ) ) ( not ( = ?auto_626400 ?auto_626410 ) ) ( not ( = ?auto_626400 ?auto_626411 ) ) ( not ( = ?auto_626400 ?auto_626412 ) ) ( not ( = ?auto_626401 ?auto_626402 ) ) ( not ( = ?auto_626401 ?auto_626403 ) ) ( not ( = ?auto_626401 ?auto_626404 ) ) ( not ( = ?auto_626401 ?auto_626405 ) ) ( not ( = ?auto_626401 ?auto_626406 ) ) ( not ( = ?auto_626401 ?auto_626407 ) ) ( not ( = ?auto_626401 ?auto_626408 ) ) ( not ( = ?auto_626401 ?auto_626409 ) ) ( not ( = ?auto_626401 ?auto_626410 ) ) ( not ( = ?auto_626401 ?auto_626411 ) ) ( not ( = ?auto_626401 ?auto_626412 ) ) ( not ( = ?auto_626402 ?auto_626403 ) ) ( not ( = ?auto_626402 ?auto_626404 ) ) ( not ( = ?auto_626402 ?auto_626405 ) ) ( not ( = ?auto_626402 ?auto_626406 ) ) ( not ( = ?auto_626402 ?auto_626407 ) ) ( not ( = ?auto_626402 ?auto_626408 ) ) ( not ( = ?auto_626402 ?auto_626409 ) ) ( not ( = ?auto_626402 ?auto_626410 ) ) ( not ( = ?auto_626402 ?auto_626411 ) ) ( not ( = ?auto_626402 ?auto_626412 ) ) ( not ( = ?auto_626403 ?auto_626404 ) ) ( not ( = ?auto_626403 ?auto_626405 ) ) ( not ( = ?auto_626403 ?auto_626406 ) ) ( not ( = ?auto_626403 ?auto_626407 ) ) ( not ( = ?auto_626403 ?auto_626408 ) ) ( not ( = ?auto_626403 ?auto_626409 ) ) ( not ( = ?auto_626403 ?auto_626410 ) ) ( not ( = ?auto_626403 ?auto_626411 ) ) ( not ( = ?auto_626403 ?auto_626412 ) ) ( not ( = ?auto_626404 ?auto_626405 ) ) ( not ( = ?auto_626404 ?auto_626406 ) ) ( not ( = ?auto_626404 ?auto_626407 ) ) ( not ( = ?auto_626404 ?auto_626408 ) ) ( not ( = ?auto_626404 ?auto_626409 ) ) ( not ( = ?auto_626404 ?auto_626410 ) ) ( not ( = ?auto_626404 ?auto_626411 ) ) ( not ( = ?auto_626404 ?auto_626412 ) ) ( not ( = ?auto_626405 ?auto_626406 ) ) ( not ( = ?auto_626405 ?auto_626407 ) ) ( not ( = ?auto_626405 ?auto_626408 ) ) ( not ( = ?auto_626405 ?auto_626409 ) ) ( not ( = ?auto_626405 ?auto_626410 ) ) ( not ( = ?auto_626405 ?auto_626411 ) ) ( not ( = ?auto_626405 ?auto_626412 ) ) ( not ( = ?auto_626406 ?auto_626407 ) ) ( not ( = ?auto_626406 ?auto_626408 ) ) ( not ( = ?auto_626406 ?auto_626409 ) ) ( not ( = ?auto_626406 ?auto_626410 ) ) ( not ( = ?auto_626406 ?auto_626411 ) ) ( not ( = ?auto_626406 ?auto_626412 ) ) ( not ( = ?auto_626407 ?auto_626408 ) ) ( not ( = ?auto_626407 ?auto_626409 ) ) ( not ( = ?auto_626407 ?auto_626410 ) ) ( not ( = ?auto_626407 ?auto_626411 ) ) ( not ( = ?auto_626407 ?auto_626412 ) ) ( not ( = ?auto_626408 ?auto_626409 ) ) ( not ( = ?auto_626408 ?auto_626410 ) ) ( not ( = ?auto_626408 ?auto_626411 ) ) ( not ( = ?auto_626408 ?auto_626412 ) ) ( not ( = ?auto_626409 ?auto_626410 ) ) ( not ( = ?auto_626409 ?auto_626411 ) ) ( not ( = ?auto_626409 ?auto_626412 ) ) ( not ( = ?auto_626410 ?auto_626411 ) ) ( not ( = ?auto_626410 ?auto_626412 ) ) ( not ( = ?auto_626411 ?auto_626412 ) ) ( ON ?auto_626410 ?auto_626411 ) ( ON ?auto_626409 ?auto_626410 ) ( ON ?auto_626408 ?auto_626409 ) ( ON ?auto_626407 ?auto_626408 ) ( ON ?auto_626406 ?auto_626407 ) ( ON ?auto_626405 ?auto_626406 ) ( ON ?auto_626404 ?auto_626405 ) ( ON ?auto_626403 ?auto_626404 ) ( ON ?auto_626402 ?auto_626403 ) ( ON ?auto_626401 ?auto_626402 ) ( ON ?auto_626400 ?auto_626401 ) ( ON ?auto_626399 ?auto_626400 ) ( ON ?auto_626398 ?auto_626399 ) ( CLEAR ?auto_626396 ) ( ON ?auto_626397 ?auto_626398 ) ( CLEAR ?auto_626397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_626396 ?auto_626397 )
      ( MAKE-16PILE ?auto_626396 ?auto_626397 ?auto_626398 ?auto_626399 ?auto_626400 ?auto_626401 ?auto_626402 ?auto_626403 ?auto_626404 ?auto_626405 ?auto_626406 ?auto_626407 ?auto_626408 ?auto_626409 ?auto_626410 ?auto_626411 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_626462 - BLOCK
      ?auto_626463 - BLOCK
      ?auto_626464 - BLOCK
      ?auto_626465 - BLOCK
      ?auto_626466 - BLOCK
      ?auto_626467 - BLOCK
      ?auto_626468 - BLOCK
      ?auto_626469 - BLOCK
      ?auto_626470 - BLOCK
      ?auto_626471 - BLOCK
      ?auto_626472 - BLOCK
      ?auto_626473 - BLOCK
      ?auto_626474 - BLOCK
      ?auto_626475 - BLOCK
      ?auto_626476 - BLOCK
      ?auto_626477 - BLOCK
    )
    :vars
    (
      ?auto_626478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626477 ?auto_626478 ) ( not ( = ?auto_626462 ?auto_626463 ) ) ( not ( = ?auto_626462 ?auto_626464 ) ) ( not ( = ?auto_626462 ?auto_626465 ) ) ( not ( = ?auto_626462 ?auto_626466 ) ) ( not ( = ?auto_626462 ?auto_626467 ) ) ( not ( = ?auto_626462 ?auto_626468 ) ) ( not ( = ?auto_626462 ?auto_626469 ) ) ( not ( = ?auto_626462 ?auto_626470 ) ) ( not ( = ?auto_626462 ?auto_626471 ) ) ( not ( = ?auto_626462 ?auto_626472 ) ) ( not ( = ?auto_626462 ?auto_626473 ) ) ( not ( = ?auto_626462 ?auto_626474 ) ) ( not ( = ?auto_626462 ?auto_626475 ) ) ( not ( = ?auto_626462 ?auto_626476 ) ) ( not ( = ?auto_626462 ?auto_626477 ) ) ( not ( = ?auto_626462 ?auto_626478 ) ) ( not ( = ?auto_626463 ?auto_626464 ) ) ( not ( = ?auto_626463 ?auto_626465 ) ) ( not ( = ?auto_626463 ?auto_626466 ) ) ( not ( = ?auto_626463 ?auto_626467 ) ) ( not ( = ?auto_626463 ?auto_626468 ) ) ( not ( = ?auto_626463 ?auto_626469 ) ) ( not ( = ?auto_626463 ?auto_626470 ) ) ( not ( = ?auto_626463 ?auto_626471 ) ) ( not ( = ?auto_626463 ?auto_626472 ) ) ( not ( = ?auto_626463 ?auto_626473 ) ) ( not ( = ?auto_626463 ?auto_626474 ) ) ( not ( = ?auto_626463 ?auto_626475 ) ) ( not ( = ?auto_626463 ?auto_626476 ) ) ( not ( = ?auto_626463 ?auto_626477 ) ) ( not ( = ?auto_626463 ?auto_626478 ) ) ( not ( = ?auto_626464 ?auto_626465 ) ) ( not ( = ?auto_626464 ?auto_626466 ) ) ( not ( = ?auto_626464 ?auto_626467 ) ) ( not ( = ?auto_626464 ?auto_626468 ) ) ( not ( = ?auto_626464 ?auto_626469 ) ) ( not ( = ?auto_626464 ?auto_626470 ) ) ( not ( = ?auto_626464 ?auto_626471 ) ) ( not ( = ?auto_626464 ?auto_626472 ) ) ( not ( = ?auto_626464 ?auto_626473 ) ) ( not ( = ?auto_626464 ?auto_626474 ) ) ( not ( = ?auto_626464 ?auto_626475 ) ) ( not ( = ?auto_626464 ?auto_626476 ) ) ( not ( = ?auto_626464 ?auto_626477 ) ) ( not ( = ?auto_626464 ?auto_626478 ) ) ( not ( = ?auto_626465 ?auto_626466 ) ) ( not ( = ?auto_626465 ?auto_626467 ) ) ( not ( = ?auto_626465 ?auto_626468 ) ) ( not ( = ?auto_626465 ?auto_626469 ) ) ( not ( = ?auto_626465 ?auto_626470 ) ) ( not ( = ?auto_626465 ?auto_626471 ) ) ( not ( = ?auto_626465 ?auto_626472 ) ) ( not ( = ?auto_626465 ?auto_626473 ) ) ( not ( = ?auto_626465 ?auto_626474 ) ) ( not ( = ?auto_626465 ?auto_626475 ) ) ( not ( = ?auto_626465 ?auto_626476 ) ) ( not ( = ?auto_626465 ?auto_626477 ) ) ( not ( = ?auto_626465 ?auto_626478 ) ) ( not ( = ?auto_626466 ?auto_626467 ) ) ( not ( = ?auto_626466 ?auto_626468 ) ) ( not ( = ?auto_626466 ?auto_626469 ) ) ( not ( = ?auto_626466 ?auto_626470 ) ) ( not ( = ?auto_626466 ?auto_626471 ) ) ( not ( = ?auto_626466 ?auto_626472 ) ) ( not ( = ?auto_626466 ?auto_626473 ) ) ( not ( = ?auto_626466 ?auto_626474 ) ) ( not ( = ?auto_626466 ?auto_626475 ) ) ( not ( = ?auto_626466 ?auto_626476 ) ) ( not ( = ?auto_626466 ?auto_626477 ) ) ( not ( = ?auto_626466 ?auto_626478 ) ) ( not ( = ?auto_626467 ?auto_626468 ) ) ( not ( = ?auto_626467 ?auto_626469 ) ) ( not ( = ?auto_626467 ?auto_626470 ) ) ( not ( = ?auto_626467 ?auto_626471 ) ) ( not ( = ?auto_626467 ?auto_626472 ) ) ( not ( = ?auto_626467 ?auto_626473 ) ) ( not ( = ?auto_626467 ?auto_626474 ) ) ( not ( = ?auto_626467 ?auto_626475 ) ) ( not ( = ?auto_626467 ?auto_626476 ) ) ( not ( = ?auto_626467 ?auto_626477 ) ) ( not ( = ?auto_626467 ?auto_626478 ) ) ( not ( = ?auto_626468 ?auto_626469 ) ) ( not ( = ?auto_626468 ?auto_626470 ) ) ( not ( = ?auto_626468 ?auto_626471 ) ) ( not ( = ?auto_626468 ?auto_626472 ) ) ( not ( = ?auto_626468 ?auto_626473 ) ) ( not ( = ?auto_626468 ?auto_626474 ) ) ( not ( = ?auto_626468 ?auto_626475 ) ) ( not ( = ?auto_626468 ?auto_626476 ) ) ( not ( = ?auto_626468 ?auto_626477 ) ) ( not ( = ?auto_626468 ?auto_626478 ) ) ( not ( = ?auto_626469 ?auto_626470 ) ) ( not ( = ?auto_626469 ?auto_626471 ) ) ( not ( = ?auto_626469 ?auto_626472 ) ) ( not ( = ?auto_626469 ?auto_626473 ) ) ( not ( = ?auto_626469 ?auto_626474 ) ) ( not ( = ?auto_626469 ?auto_626475 ) ) ( not ( = ?auto_626469 ?auto_626476 ) ) ( not ( = ?auto_626469 ?auto_626477 ) ) ( not ( = ?auto_626469 ?auto_626478 ) ) ( not ( = ?auto_626470 ?auto_626471 ) ) ( not ( = ?auto_626470 ?auto_626472 ) ) ( not ( = ?auto_626470 ?auto_626473 ) ) ( not ( = ?auto_626470 ?auto_626474 ) ) ( not ( = ?auto_626470 ?auto_626475 ) ) ( not ( = ?auto_626470 ?auto_626476 ) ) ( not ( = ?auto_626470 ?auto_626477 ) ) ( not ( = ?auto_626470 ?auto_626478 ) ) ( not ( = ?auto_626471 ?auto_626472 ) ) ( not ( = ?auto_626471 ?auto_626473 ) ) ( not ( = ?auto_626471 ?auto_626474 ) ) ( not ( = ?auto_626471 ?auto_626475 ) ) ( not ( = ?auto_626471 ?auto_626476 ) ) ( not ( = ?auto_626471 ?auto_626477 ) ) ( not ( = ?auto_626471 ?auto_626478 ) ) ( not ( = ?auto_626472 ?auto_626473 ) ) ( not ( = ?auto_626472 ?auto_626474 ) ) ( not ( = ?auto_626472 ?auto_626475 ) ) ( not ( = ?auto_626472 ?auto_626476 ) ) ( not ( = ?auto_626472 ?auto_626477 ) ) ( not ( = ?auto_626472 ?auto_626478 ) ) ( not ( = ?auto_626473 ?auto_626474 ) ) ( not ( = ?auto_626473 ?auto_626475 ) ) ( not ( = ?auto_626473 ?auto_626476 ) ) ( not ( = ?auto_626473 ?auto_626477 ) ) ( not ( = ?auto_626473 ?auto_626478 ) ) ( not ( = ?auto_626474 ?auto_626475 ) ) ( not ( = ?auto_626474 ?auto_626476 ) ) ( not ( = ?auto_626474 ?auto_626477 ) ) ( not ( = ?auto_626474 ?auto_626478 ) ) ( not ( = ?auto_626475 ?auto_626476 ) ) ( not ( = ?auto_626475 ?auto_626477 ) ) ( not ( = ?auto_626475 ?auto_626478 ) ) ( not ( = ?auto_626476 ?auto_626477 ) ) ( not ( = ?auto_626476 ?auto_626478 ) ) ( not ( = ?auto_626477 ?auto_626478 ) ) ( ON ?auto_626476 ?auto_626477 ) ( ON ?auto_626475 ?auto_626476 ) ( ON ?auto_626474 ?auto_626475 ) ( ON ?auto_626473 ?auto_626474 ) ( ON ?auto_626472 ?auto_626473 ) ( ON ?auto_626471 ?auto_626472 ) ( ON ?auto_626470 ?auto_626471 ) ( ON ?auto_626469 ?auto_626470 ) ( ON ?auto_626468 ?auto_626469 ) ( ON ?auto_626467 ?auto_626468 ) ( ON ?auto_626466 ?auto_626467 ) ( ON ?auto_626465 ?auto_626466 ) ( ON ?auto_626464 ?auto_626465 ) ( ON ?auto_626463 ?auto_626464 ) ( ON ?auto_626462 ?auto_626463 ) ( CLEAR ?auto_626462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_626462 )
      ( MAKE-16PILE ?auto_626462 ?auto_626463 ?auto_626464 ?auto_626465 ?auto_626466 ?auto_626467 ?auto_626468 ?auto_626469 ?auto_626470 ?auto_626471 ?auto_626472 ?auto_626473 ?auto_626474 ?auto_626475 ?auto_626476 ?auto_626477 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626529 - BLOCK
      ?auto_626530 - BLOCK
      ?auto_626531 - BLOCK
      ?auto_626532 - BLOCK
      ?auto_626533 - BLOCK
      ?auto_626534 - BLOCK
      ?auto_626535 - BLOCK
      ?auto_626536 - BLOCK
      ?auto_626537 - BLOCK
      ?auto_626538 - BLOCK
      ?auto_626539 - BLOCK
      ?auto_626540 - BLOCK
      ?auto_626541 - BLOCK
      ?auto_626542 - BLOCK
      ?auto_626543 - BLOCK
      ?auto_626544 - BLOCK
      ?auto_626545 - BLOCK
    )
    :vars
    (
      ?auto_626546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_626544 ) ( ON ?auto_626545 ?auto_626546 ) ( CLEAR ?auto_626545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_626529 ) ( ON ?auto_626530 ?auto_626529 ) ( ON ?auto_626531 ?auto_626530 ) ( ON ?auto_626532 ?auto_626531 ) ( ON ?auto_626533 ?auto_626532 ) ( ON ?auto_626534 ?auto_626533 ) ( ON ?auto_626535 ?auto_626534 ) ( ON ?auto_626536 ?auto_626535 ) ( ON ?auto_626537 ?auto_626536 ) ( ON ?auto_626538 ?auto_626537 ) ( ON ?auto_626539 ?auto_626538 ) ( ON ?auto_626540 ?auto_626539 ) ( ON ?auto_626541 ?auto_626540 ) ( ON ?auto_626542 ?auto_626541 ) ( ON ?auto_626543 ?auto_626542 ) ( ON ?auto_626544 ?auto_626543 ) ( not ( = ?auto_626529 ?auto_626530 ) ) ( not ( = ?auto_626529 ?auto_626531 ) ) ( not ( = ?auto_626529 ?auto_626532 ) ) ( not ( = ?auto_626529 ?auto_626533 ) ) ( not ( = ?auto_626529 ?auto_626534 ) ) ( not ( = ?auto_626529 ?auto_626535 ) ) ( not ( = ?auto_626529 ?auto_626536 ) ) ( not ( = ?auto_626529 ?auto_626537 ) ) ( not ( = ?auto_626529 ?auto_626538 ) ) ( not ( = ?auto_626529 ?auto_626539 ) ) ( not ( = ?auto_626529 ?auto_626540 ) ) ( not ( = ?auto_626529 ?auto_626541 ) ) ( not ( = ?auto_626529 ?auto_626542 ) ) ( not ( = ?auto_626529 ?auto_626543 ) ) ( not ( = ?auto_626529 ?auto_626544 ) ) ( not ( = ?auto_626529 ?auto_626545 ) ) ( not ( = ?auto_626529 ?auto_626546 ) ) ( not ( = ?auto_626530 ?auto_626531 ) ) ( not ( = ?auto_626530 ?auto_626532 ) ) ( not ( = ?auto_626530 ?auto_626533 ) ) ( not ( = ?auto_626530 ?auto_626534 ) ) ( not ( = ?auto_626530 ?auto_626535 ) ) ( not ( = ?auto_626530 ?auto_626536 ) ) ( not ( = ?auto_626530 ?auto_626537 ) ) ( not ( = ?auto_626530 ?auto_626538 ) ) ( not ( = ?auto_626530 ?auto_626539 ) ) ( not ( = ?auto_626530 ?auto_626540 ) ) ( not ( = ?auto_626530 ?auto_626541 ) ) ( not ( = ?auto_626530 ?auto_626542 ) ) ( not ( = ?auto_626530 ?auto_626543 ) ) ( not ( = ?auto_626530 ?auto_626544 ) ) ( not ( = ?auto_626530 ?auto_626545 ) ) ( not ( = ?auto_626530 ?auto_626546 ) ) ( not ( = ?auto_626531 ?auto_626532 ) ) ( not ( = ?auto_626531 ?auto_626533 ) ) ( not ( = ?auto_626531 ?auto_626534 ) ) ( not ( = ?auto_626531 ?auto_626535 ) ) ( not ( = ?auto_626531 ?auto_626536 ) ) ( not ( = ?auto_626531 ?auto_626537 ) ) ( not ( = ?auto_626531 ?auto_626538 ) ) ( not ( = ?auto_626531 ?auto_626539 ) ) ( not ( = ?auto_626531 ?auto_626540 ) ) ( not ( = ?auto_626531 ?auto_626541 ) ) ( not ( = ?auto_626531 ?auto_626542 ) ) ( not ( = ?auto_626531 ?auto_626543 ) ) ( not ( = ?auto_626531 ?auto_626544 ) ) ( not ( = ?auto_626531 ?auto_626545 ) ) ( not ( = ?auto_626531 ?auto_626546 ) ) ( not ( = ?auto_626532 ?auto_626533 ) ) ( not ( = ?auto_626532 ?auto_626534 ) ) ( not ( = ?auto_626532 ?auto_626535 ) ) ( not ( = ?auto_626532 ?auto_626536 ) ) ( not ( = ?auto_626532 ?auto_626537 ) ) ( not ( = ?auto_626532 ?auto_626538 ) ) ( not ( = ?auto_626532 ?auto_626539 ) ) ( not ( = ?auto_626532 ?auto_626540 ) ) ( not ( = ?auto_626532 ?auto_626541 ) ) ( not ( = ?auto_626532 ?auto_626542 ) ) ( not ( = ?auto_626532 ?auto_626543 ) ) ( not ( = ?auto_626532 ?auto_626544 ) ) ( not ( = ?auto_626532 ?auto_626545 ) ) ( not ( = ?auto_626532 ?auto_626546 ) ) ( not ( = ?auto_626533 ?auto_626534 ) ) ( not ( = ?auto_626533 ?auto_626535 ) ) ( not ( = ?auto_626533 ?auto_626536 ) ) ( not ( = ?auto_626533 ?auto_626537 ) ) ( not ( = ?auto_626533 ?auto_626538 ) ) ( not ( = ?auto_626533 ?auto_626539 ) ) ( not ( = ?auto_626533 ?auto_626540 ) ) ( not ( = ?auto_626533 ?auto_626541 ) ) ( not ( = ?auto_626533 ?auto_626542 ) ) ( not ( = ?auto_626533 ?auto_626543 ) ) ( not ( = ?auto_626533 ?auto_626544 ) ) ( not ( = ?auto_626533 ?auto_626545 ) ) ( not ( = ?auto_626533 ?auto_626546 ) ) ( not ( = ?auto_626534 ?auto_626535 ) ) ( not ( = ?auto_626534 ?auto_626536 ) ) ( not ( = ?auto_626534 ?auto_626537 ) ) ( not ( = ?auto_626534 ?auto_626538 ) ) ( not ( = ?auto_626534 ?auto_626539 ) ) ( not ( = ?auto_626534 ?auto_626540 ) ) ( not ( = ?auto_626534 ?auto_626541 ) ) ( not ( = ?auto_626534 ?auto_626542 ) ) ( not ( = ?auto_626534 ?auto_626543 ) ) ( not ( = ?auto_626534 ?auto_626544 ) ) ( not ( = ?auto_626534 ?auto_626545 ) ) ( not ( = ?auto_626534 ?auto_626546 ) ) ( not ( = ?auto_626535 ?auto_626536 ) ) ( not ( = ?auto_626535 ?auto_626537 ) ) ( not ( = ?auto_626535 ?auto_626538 ) ) ( not ( = ?auto_626535 ?auto_626539 ) ) ( not ( = ?auto_626535 ?auto_626540 ) ) ( not ( = ?auto_626535 ?auto_626541 ) ) ( not ( = ?auto_626535 ?auto_626542 ) ) ( not ( = ?auto_626535 ?auto_626543 ) ) ( not ( = ?auto_626535 ?auto_626544 ) ) ( not ( = ?auto_626535 ?auto_626545 ) ) ( not ( = ?auto_626535 ?auto_626546 ) ) ( not ( = ?auto_626536 ?auto_626537 ) ) ( not ( = ?auto_626536 ?auto_626538 ) ) ( not ( = ?auto_626536 ?auto_626539 ) ) ( not ( = ?auto_626536 ?auto_626540 ) ) ( not ( = ?auto_626536 ?auto_626541 ) ) ( not ( = ?auto_626536 ?auto_626542 ) ) ( not ( = ?auto_626536 ?auto_626543 ) ) ( not ( = ?auto_626536 ?auto_626544 ) ) ( not ( = ?auto_626536 ?auto_626545 ) ) ( not ( = ?auto_626536 ?auto_626546 ) ) ( not ( = ?auto_626537 ?auto_626538 ) ) ( not ( = ?auto_626537 ?auto_626539 ) ) ( not ( = ?auto_626537 ?auto_626540 ) ) ( not ( = ?auto_626537 ?auto_626541 ) ) ( not ( = ?auto_626537 ?auto_626542 ) ) ( not ( = ?auto_626537 ?auto_626543 ) ) ( not ( = ?auto_626537 ?auto_626544 ) ) ( not ( = ?auto_626537 ?auto_626545 ) ) ( not ( = ?auto_626537 ?auto_626546 ) ) ( not ( = ?auto_626538 ?auto_626539 ) ) ( not ( = ?auto_626538 ?auto_626540 ) ) ( not ( = ?auto_626538 ?auto_626541 ) ) ( not ( = ?auto_626538 ?auto_626542 ) ) ( not ( = ?auto_626538 ?auto_626543 ) ) ( not ( = ?auto_626538 ?auto_626544 ) ) ( not ( = ?auto_626538 ?auto_626545 ) ) ( not ( = ?auto_626538 ?auto_626546 ) ) ( not ( = ?auto_626539 ?auto_626540 ) ) ( not ( = ?auto_626539 ?auto_626541 ) ) ( not ( = ?auto_626539 ?auto_626542 ) ) ( not ( = ?auto_626539 ?auto_626543 ) ) ( not ( = ?auto_626539 ?auto_626544 ) ) ( not ( = ?auto_626539 ?auto_626545 ) ) ( not ( = ?auto_626539 ?auto_626546 ) ) ( not ( = ?auto_626540 ?auto_626541 ) ) ( not ( = ?auto_626540 ?auto_626542 ) ) ( not ( = ?auto_626540 ?auto_626543 ) ) ( not ( = ?auto_626540 ?auto_626544 ) ) ( not ( = ?auto_626540 ?auto_626545 ) ) ( not ( = ?auto_626540 ?auto_626546 ) ) ( not ( = ?auto_626541 ?auto_626542 ) ) ( not ( = ?auto_626541 ?auto_626543 ) ) ( not ( = ?auto_626541 ?auto_626544 ) ) ( not ( = ?auto_626541 ?auto_626545 ) ) ( not ( = ?auto_626541 ?auto_626546 ) ) ( not ( = ?auto_626542 ?auto_626543 ) ) ( not ( = ?auto_626542 ?auto_626544 ) ) ( not ( = ?auto_626542 ?auto_626545 ) ) ( not ( = ?auto_626542 ?auto_626546 ) ) ( not ( = ?auto_626543 ?auto_626544 ) ) ( not ( = ?auto_626543 ?auto_626545 ) ) ( not ( = ?auto_626543 ?auto_626546 ) ) ( not ( = ?auto_626544 ?auto_626545 ) ) ( not ( = ?auto_626544 ?auto_626546 ) ) ( not ( = ?auto_626545 ?auto_626546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_626545 ?auto_626546 )
      ( !STACK ?auto_626545 ?auto_626544 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626564 - BLOCK
      ?auto_626565 - BLOCK
      ?auto_626566 - BLOCK
      ?auto_626567 - BLOCK
      ?auto_626568 - BLOCK
      ?auto_626569 - BLOCK
      ?auto_626570 - BLOCK
      ?auto_626571 - BLOCK
      ?auto_626572 - BLOCK
      ?auto_626573 - BLOCK
      ?auto_626574 - BLOCK
      ?auto_626575 - BLOCK
      ?auto_626576 - BLOCK
      ?auto_626577 - BLOCK
      ?auto_626578 - BLOCK
      ?auto_626579 - BLOCK
      ?auto_626580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_626579 ) ( ON-TABLE ?auto_626580 ) ( CLEAR ?auto_626580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_626564 ) ( ON ?auto_626565 ?auto_626564 ) ( ON ?auto_626566 ?auto_626565 ) ( ON ?auto_626567 ?auto_626566 ) ( ON ?auto_626568 ?auto_626567 ) ( ON ?auto_626569 ?auto_626568 ) ( ON ?auto_626570 ?auto_626569 ) ( ON ?auto_626571 ?auto_626570 ) ( ON ?auto_626572 ?auto_626571 ) ( ON ?auto_626573 ?auto_626572 ) ( ON ?auto_626574 ?auto_626573 ) ( ON ?auto_626575 ?auto_626574 ) ( ON ?auto_626576 ?auto_626575 ) ( ON ?auto_626577 ?auto_626576 ) ( ON ?auto_626578 ?auto_626577 ) ( ON ?auto_626579 ?auto_626578 ) ( not ( = ?auto_626564 ?auto_626565 ) ) ( not ( = ?auto_626564 ?auto_626566 ) ) ( not ( = ?auto_626564 ?auto_626567 ) ) ( not ( = ?auto_626564 ?auto_626568 ) ) ( not ( = ?auto_626564 ?auto_626569 ) ) ( not ( = ?auto_626564 ?auto_626570 ) ) ( not ( = ?auto_626564 ?auto_626571 ) ) ( not ( = ?auto_626564 ?auto_626572 ) ) ( not ( = ?auto_626564 ?auto_626573 ) ) ( not ( = ?auto_626564 ?auto_626574 ) ) ( not ( = ?auto_626564 ?auto_626575 ) ) ( not ( = ?auto_626564 ?auto_626576 ) ) ( not ( = ?auto_626564 ?auto_626577 ) ) ( not ( = ?auto_626564 ?auto_626578 ) ) ( not ( = ?auto_626564 ?auto_626579 ) ) ( not ( = ?auto_626564 ?auto_626580 ) ) ( not ( = ?auto_626565 ?auto_626566 ) ) ( not ( = ?auto_626565 ?auto_626567 ) ) ( not ( = ?auto_626565 ?auto_626568 ) ) ( not ( = ?auto_626565 ?auto_626569 ) ) ( not ( = ?auto_626565 ?auto_626570 ) ) ( not ( = ?auto_626565 ?auto_626571 ) ) ( not ( = ?auto_626565 ?auto_626572 ) ) ( not ( = ?auto_626565 ?auto_626573 ) ) ( not ( = ?auto_626565 ?auto_626574 ) ) ( not ( = ?auto_626565 ?auto_626575 ) ) ( not ( = ?auto_626565 ?auto_626576 ) ) ( not ( = ?auto_626565 ?auto_626577 ) ) ( not ( = ?auto_626565 ?auto_626578 ) ) ( not ( = ?auto_626565 ?auto_626579 ) ) ( not ( = ?auto_626565 ?auto_626580 ) ) ( not ( = ?auto_626566 ?auto_626567 ) ) ( not ( = ?auto_626566 ?auto_626568 ) ) ( not ( = ?auto_626566 ?auto_626569 ) ) ( not ( = ?auto_626566 ?auto_626570 ) ) ( not ( = ?auto_626566 ?auto_626571 ) ) ( not ( = ?auto_626566 ?auto_626572 ) ) ( not ( = ?auto_626566 ?auto_626573 ) ) ( not ( = ?auto_626566 ?auto_626574 ) ) ( not ( = ?auto_626566 ?auto_626575 ) ) ( not ( = ?auto_626566 ?auto_626576 ) ) ( not ( = ?auto_626566 ?auto_626577 ) ) ( not ( = ?auto_626566 ?auto_626578 ) ) ( not ( = ?auto_626566 ?auto_626579 ) ) ( not ( = ?auto_626566 ?auto_626580 ) ) ( not ( = ?auto_626567 ?auto_626568 ) ) ( not ( = ?auto_626567 ?auto_626569 ) ) ( not ( = ?auto_626567 ?auto_626570 ) ) ( not ( = ?auto_626567 ?auto_626571 ) ) ( not ( = ?auto_626567 ?auto_626572 ) ) ( not ( = ?auto_626567 ?auto_626573 ) ) ( not ( = ?auto_626567 ?auto_626574 ) ) ( not ( = ?auto_626567 ?auto_626575 ) ) ( not ( = ?auto_626567 ?auto_626576 ) ) ( not ( = ?auto_626567 ?auto_626577 ) ) ( not ( = ?auto_626567 ?auto_626578 ) ) ( not ( = ?auto_626567 ?auto_626579 ) ) ( not ( = ?auto_626567 ?auto_626580 ) ) ( not ( = ?auto_626568 ?auto_626569 ) ) ( not ( = ?auto_626568 ?auto_626570 ) ) ( not ( = ?auto_626568 ?auto_626571 ) ) ( not ( = ?auto_626568 ?auto_626572 ) ) ( not ( = ?auto_626568 ?auto_626573 ) ) ( not ( = ?auto_626568 ?auto_626574 ) ) ( not ( = ?auto_626568 ?auto_626575 ) ) ( not ( = ?auto_626568 ?auto_626576 ) ) ( not ( = ?auto_626568 ?auto_626577 ) ) ( not ( = ?auto_626568 ?auto_626578 ) ) ( not ( = ?auto_626568 ?auto_626579 ) ) ( not ( = ?auto_626568 ?auto_626580 ) ) ( not ( = ?auto_626569 ?auto_626570 ) ) ( not ( = ?auto_626569 ?auto_626571 ) ) ( not ( = ?auto_626569 ?auto_626572 ) ) ( not ( = ?auto_626569 ?auto_626573 ) ) ( not ( = ?auto_626569 ?auto_626574 ) ) ( not ( = ?auto_626569 ?auto_626575 ) ) ( not ( = ?auto_626569 ?auto_626576 ) ) ( not ( = ?auto_626569 ?auto_626577 ) ) ( not ( = ?auto_626569 ?auto_626578 ) ) ( not ( = ?auto_626569 ?auto_626579 ) ) ( not ( = ?auto_626569 ?auto_626580 ) ) ( not ( = ?auto_626570 ?auto_626571 ) ) ( not ( = ?auto_626570 ?auto_626572 ) ) ( not ( = ?auto_626570 ?auto_626573 ) ) ( not ( = ?auto_626570 ?auto_626574 ) ) ( not ( = ?auto_626570 ?auto_626575 ) ) ( not ( = ?auto_626570 ?auto_626576 ) ) ( not ( = ?auto_626570 ?auto_626577 ) ) ( not ( = ?auto_626570 ?auto_626578 ) ) ( not ( = ?auto_626570 ?auto_626579 ) ) ( not ( = ?auto_626570 ?auto_626580 ) ) ( not ( = ?auto_626571 ?auto_626572 ) ) ( not ( = ?auto_626571 ?auto_626573 ) ) ( not ( = ?auto_626571 ?auto_626574 ) ) ( not ( = ?auto_626571 ?auto_626575 ) ) ( not ( = ?auto_626571 ?auto_626576 ) ) ( not ( = ?auto_626571 ?auto_626577 ) ) ( not ( = ?auto_626571 ?auto_626578 ) ) ( not ( = ?auto_626571 ?auto_626579 ) ) ( not ( = ?auto_626571 ?auto_626580 ) ) ( not ( = ?auto_626572 ?auto_626573 ) ) ( not ( = ?auto_626572 ?auto_626574 ) ) ( not ( = ?auto_626572 ?auto_626575 ) ) ( not ( = ?auto_626572 ?auto_626576 ) ) ( not ( = ?auto_626572 ?auto_626577 ) ) ( not ( = ?auto_626572 ?auto_626578 ) ) ( not ( = ?auto_626572 ?auto_626579 ) ) ( not ( = ?auto_626572 ?auto_626580 ) ) ( not ( = ?auto_626573 ?auto_626574 ) ) ( not ( = ?auto_626573 ?auto_626575 ) ) ( not ( = ?auto_626573 ?auto_626576 ) ) ( not ( = ?auto_626573 ?auto_626577 ) ) ( not ( = ?auto_626573 ?auto_626578 ) ) ( not ( = ?auto_626573 ?auto_626579 ) ) ( not ( = ?auto_626573 ?auto_626580 ) ) ( not ( = ?auto_626574 ?auto_626575 ) ) ( not ( = ?auto_626574 ?auto_626576 ) ) ( not ( = ?auto_626574 ?auto_626577 ) ) ( not ( = ?auto_626574 ?auto_626578 ) ) ( not ( = ?auto_626574 ?auto_626579 ) ) ( not ( = ?auto_626574 ?auto_626580 ) ) ( not ( = ?auto_626575 ?auto_626576 ) ) ( not ( = ?auto_626575 ?auto_626577 ) ) ( not ( = ?auto_626575 ?auto_626578 ) ) ( not ( = ?auto_626575 ?auto_626579 ) ) ( not ( = ?auto_626575 ?auto_626580 ) ) ( not ( = ?auto_626576 ?auto_626577 ) ) ( not ( = ?auto_626576 ?auto_626578 ) ) ( not ( = ?auto_626576 ?auto_626579 ) ) ( not ( = ?auto_626576 ?auto_626580 ) ) ( not ( = ?auto_626577 ?auto_626578 ) ) ( not ( = ?auto_626577 ?auto_626579 ) ) ( not ( = ?auto_626577 ?auto_626580 ) ) ( not ( = ?auto_626578 ?auto_626579 ) ) ( not ( = ?auto_626578 ?auto_626580 ) ) ( not ( = ?auto_626579 ?auto_626580 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_626580 )
      ( !STACK ?auto_626580 ?auto_626579 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626598 - BLOCK
      ?auto_626599 - BLOCK
      ?auto_626600 - BLOCK
      ?auto_626601 - BLOCK
      ?auto_626602 - BLOCK
      ?auto_626603 - BLOCK
      ?auto_626604 - BLOCK
      ?auto_626605 - BLOCK
      ?auto_626606 - BLOCK
      ?auto_626607 - BLOCK
      ?auto_626608 - BLOCK
      ?auto_626609 - BLOCK
      ?auto_626610 - BLOCK
      ?auto_626611 - BLOCK
      ?auto_626612 - BLOCK
      ?auto_626613 - BLOCK
      ?auto_626614 - BLOCK
    )
    :vars
    (
      ?auto_626615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626614 ?auto_626615 ) ( ON-TABLE ?auto_626598 ) ( ON ?auto_626599 ?auto_626598 ) ( ON ?auto_626600 ?auto_626599 ) ( ON ?auto_626601 ?auto_626600 ) ( ON ?auto_626602 ?auto_626601 ) ( ON ?auto_626603 ?auto_626602 ) ( ON ?auto_626604 ?auto_626603 ) ( ON ?auto_626605 ?auto_626604 ) ( ON ?auto_626606 ?auto_626605 ) ( ON ?auto_626607 ?auto_626606 ) ( ON ?auto_626608 ?auto_626607 ) ( ON ?auto_626609 ?auto_626608 ) ( ON ?auto_626610 ?auto_626609 ) ( ON ?auto_626611 ?auto_626610 ) ( ON ?auto_626612 ?auto_626611 ) ( not ( = ?auto_626598 ?auto_626599 ) ) ( not ( = ?auto_626598 ?auto_626600 ) ) ( not ( = ?auto_626598 ?auto_626601 ) ) ( not ( = ?auto_626598 ?auto_626602 ) ) ( not ( = ?auto_626598 ?auto_626603 ) ) ( not ( = ?auto_626598 ?auto_626604 ) ) ( not ( = ?auto_626598 ?auto_626605 ) ) ( not ( = ?auto_626598 ?auto_626606 ) ) ( not ( = ?auto_626598 ?auto_626607 ) ) ( not ( = ?auto_626598 ?auto_626608 ) ) ( not ( = ?auto_626598 ?auto_626609 ) ) ( not ( = ?auto_626598 ?auto_626610 ) ) ( not ( = ?auto_626598 ?auto_626611 ) ) ( not ( = ?auto_626598 ?auto_626612 ) ) ( not ( = ?auto_626598 ?auto_626613 ) ) ( not ( = ?auto_626598 ?auto_626614 ) ) ( not ( = ?auto_626598 ?auto_626615 ) ) ( not ( = ?auto_626599 ?auto_626600 ) ) ( not ( = ?auto_626599 ?auto_626601 ) ) ( not ( = ?auto_626599 ?auto_626602 ) ) ( not ( = ?auto_626599 ?auto_626603 ) ) ( not ( = ?auto_626599 ?auto_626604 ) ) ( not ( = ?auto_626599 ?auto_626605 ) ) ( not ( = ?auto_626599 ?auto_626606 ) ) ( not ( = ?auto_626599 ?auto_626607 ) ) ( not ( = ?auto_626599 ?auto_626608 ) ) ( not ( = ?auto_626599 ?auto_626609 ) ) ( not ( = ?auto_626599 ?auto_626610 ) ) ( not ( = ?auto_626599 ?auto_626611 ) ) ( not ( = ?auto_626599 ?auto_626612 ) ) ( not ( = ?auto_626599 ?auto_626613 ) ) ( not ( = ?auto_626599 ?auto_626614 ) ) ( not ( = ?auto_626599 ?auto_626615 ) ) ( not ( = ?auto_626600 ?auto_626601 ) ) ( not ( = ?auto_626600 ?auto_626602 ) ) ( not ( = ?auto_626600 ?auto_626603 ) ) ( not ( = ?auto_626600 ?auto_626604 ) ) ( not ( = ?auto_626600 ?auto_626605 ) ) ( not ( = ?auto_626600 ?auto_626606 ) ) ( not ( = ?auto_626600 ?auto_626607 ) ) ( not ( = ?auto_626600 ?auto_626608 ) ) ( not ( = ?auto_626600 ?auto_626609 ) ) ( not ( = ?auto_626600 ?auto_626610 ) ) ( not ( = ?auto_626600 ?auto_626611 ) ) ( not ( = ?auto_626600 ?auto_626612 ) ) ( not ( = ?auto_626600 ?auto_626613 ) ) ( not ( = ?auto_626600 ?auto_626614 ) ) ( not ( = ?auto_626600 ?auto_626615 ) ) ( not ( = ?auto_626601 ?auto_626602 ) ) ( not ( = ?auto_626601 ?auto_626603 ) ) ( not ( = ?auto_626601 ?auto_626604 ) ) ( not ( = ?auto_626601 ?auto_626605 ) ) ( not ( = ?auto_626601 ?auto_626606 ) ) ( not ( = ?auto_626601 ?auto_626607 ) ) ( not ( = ?auto_626601 ?auto_626608 ) ) ( not ( = ?auto_626601 ?auto_626609 ) ) ( not ( = ?auto_626601 ?auto_626610 ) ) ( not ( = ?auto_626601 ?auto_626611 ) ) ( not ( = ?auto_626601 ?auto_626612 ) ) ( not ( = ?auto_626601 ?auto_626613 ) ) ( not ( = ?auto_626601 ?auto_626614 ) ) ( not ( = ?auto_626601 ?auto_626615 ) ) ( not ( = ?auto_626602 ?auto_626603 ) ) ( not ( = ?auto_626602 ?auto_626604 ) ) ( not ( = ?auto_626602 ?auto_626605 ) ) ( not ( = ?auto_626602 ?auto_626606 ) ) ( not ( = ?auto_626602 ?auto_626607 ) ) ( not ( = ?auto_626602 ?auto_626608 ) ) ( not ( = ?auto_626602 ?auto_626609 ) ) ( not ( = ?auto_626602 ?auto_626610 ) ) ( not ( = ?auto_626602 ?auto_626611 ) ) ( not ( = ?auto_626602 ?auto_626612 ) ) ( not ( = ?auto_626602 ?auto_626613 ) ) ( not ( = ?auto_626602 ?auto_626614 ) ) ( not ( = ?auto_626602 ?auto_626615 ) ) ( not ( = ?auto_626603 ?auto_626604 ) ) ( not ( = ?auto_626603 ?auto_626605 ) ) ( not ( = ?auto_626603 ?auto_626606 ) ) ( not ( = ?auto_626603 ?auto_626607 ) ) ( not ( = ?auto_626603 ?auto_626608 ) ) ( not ( = ?auto_626603 ?auto_626609 ) ) ( not ( = ?auto_626603 ?auto_626610 ) ) ( not ( = ?auto_626603 ?auto_626611 ) ) ( not ( = ?auto_626603 ?auto_626612 ) ) ( not ( = ?auto_626603 ?auto_626613 ) ) ( not ( = ?auto_626603 ?auto_626614 ) ) ( not ( = ?auto_626603 ?auto_626615 ) ) ( not ( = ?auto_626604 ?auto_626605 ) ) ( not ( = ?auto_626604 ?auto_626606 ) ) ( not ( = ?auto_626604 ?auto_626607 ) ) ( not ( = ?auto_626604 ?auto_626608 ) ) ( not ( = ?auto_626604 ?auto_626609 ) ) ( not ( = ?auto_626604 ?auto_626610 ) ) ( not ( = ?auto_626604 ?auto_626611 ) ) ( not ( = ?auto_626604 ?auto_626612 ) ) ( not ( = ?auto_626604 ?auto_626613 ) ) ( not ( = ?auto_626604 ?auto_626614 ) ) ( not ( = ?auto_626604 ?auto_626615 ) ) ( not ( = ?auto_626605 ?auto_626606 ) ) ( not ( = ?auto_626605 ?auto_626607 ) ) ( not ( = ?auto_626605 ?auto_626608 ) ) ( not ( = ?auto_626605 ?auto_626609 ) ) ( not ( = ?auto_626605 ?auto_626610 ) ) ( not ( = ?auto_626605 ?auto_626611 ) ) ( not ( = ?auto_626605 ?auto_626612 ) ) ( not ( = ?auto_626605 ?auto_626613 ) ) ( not ( = ?auto_626605 ?auto_626614 ) ) ( not ( = ?auto_626605 ?auto_626615 ) ) ( not ( = ?auto_626606 ?auto_626607 ) ) ( not ( = ?auto_626606 ?auto_626608 ) ) ( not ( = ?auto_626606 ?auto_626609 ) ) ( not ( = ?auto_626606 ?auto_626610 ) ) ( not ( = ?auto_626606 ?auto_626611 ) ) ( not ( = ?auto_626606 ?auto_626612 ) ) ( not ( = ?auto_626606 ?auto_626613 ) ) ( not ( = ?auto_626606 ?auto_626614 ) ) ( not ( = ?auto_626606 ?auto_626615 ) ) ( not ( = ?auto_626607 ?auto_626608 ) ) ( not ( = ?auto_626607 ?auto_626609 ) ) ( not ( = ?auto_626607 ?auto_626610 ) ) ( not ( = ?auto_626607 ?auto_626611 ) ) ( not ( = ?auto_626607 ?auto_626612 ) ) ( not ( = ?auto_626607 ?auto_626613 ) ) ( not ( = ?auto_626607 ?auto_626614 ) ) ( not ( = ?auto_626607 ?auto_626615 ) ) ( not ( = ?auto_626608 ?auto_626609 ) ) ( not ( = ?auto_626608 ?auto_626610 ) ) ( not ( = ?auto_626608 ?auto_626611 ) ) ( not ( = ?auto_626608 ?auto_626612 ) ) ( not ( = ?auto_626608 ?auto_626613 ) ) ( not ( = ?auto_626608 ?auto_626614 ) ) ( not ( = ?auto_626608 ?auto_626615 ) ) ( not ( = ?auto_626609 ?auto_626610 ) ) ( not ( = ?auto_626609 ?auto_626611 ) ) ( not ( = ?auto_626609 ?auto_626612 ) ) ( not ( = ?auto_626609 ?auto_626613 ) ) ( not ( = ?auto_626609 ?auto_626614 ) ) ( not ( = ?auto_626609 ?auto_626615 ) ) ( not ( = ?auto_626610 ?auto_626611 ) ) ( not ( = ?auto_626610 ?auto_626612 ) ) ( not ( = ?auto_626610 ?auto_626613 ) ) ( not ( = ?auto_626610 ?auto_626614 ) ) ( not ( = ?auto_626610 ?auto_626615 ) ) ( not ( = ?auto_626611 ?auto_626612 ) ) ( not ( = ?auto_626611 ?auto_626613 ) ) ( not ( = ?auto_626611 ?auto_626614 ) ) ( not ( = ?auto_626611 ?auto_626615 ) ) ( not ( = ?auto_626612 ?auto_626613 ) ) ( not ( = ?auto_626612 ?auto_626614 ) ) ( not ( = ?auto_626612 ?auto_626615 ) ) ( not ( = ?auto_626613 ?auto_626614 ) ) ( not ( = ?auto_626613 ?auto_626615 ) ) ( not ( = ?auto_626614 ?auto_626615 ) ) ( CLEAR ?auto_626612 ) ( ON ?auto_626613 ?auto_626614 ) ( CLEAR ?auto_626613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_626598 ?auto_626599 ?auto_626600 ?auto_626601 ?auto_626602 ?auto_626603 ?auto_626604 ?auto_626605 ?auto_626606 ?auto_626607 ?auto_626608 ?auto_626609 ?auto_626610 ?auto_626611 ?auto_626612 ?auto_626613 )
      ( MAKE-17PILE ?auto_626598 ?auto_626599 ?auto_626600 ?auto_626601 ?auto_626602 ?auto_626603 ?auto_626604 ?auto_626605 ?auto_626606 ?auto_626607 ?auto_626608 ?auto_626609 ?auto_626610 ?auto_626611 ?auto_626612 ?auto_626613 ?auto_626614 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626633 - BLOCK
      ?auto_626634 - BLOCK
      ?auto_626635 - BLOCK
      ?auto_626636 - BLOCK
      ?auto_626637 - BLOCK
      ?auto_626638 - BLOCK
      ?auto_626639 - BLOCK
      ?auto_626640 - BLOCK
      ?auto_626641 - BLOCK
      ?auto_626642 - BLOCK
      ?auto_626643 - BLOCK
      ?auto_626644 - BLOCK
      ?auto_626645 - BLOCK
      ?auto_626646 - BLOCK
      ?auto_626647 - BLOCK
      ?auto_626648 - BLOCK
      ?auto_626649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_626649 ) ( ON-TABLE ?auto_626633 ) ( ON ?auto_626634 ?auto_626633 ) ( ON ?auto_626635 ?auto_626634 ) ( ON ?auto_626636 ?auto_626635 ) ( ON ?auto_626637 ?auto_626636 ) ( ON ?auto_626638 ?auto_626637 ) ( ON ?auto_626639 ?auto_626638 ) ( ON ?auto_626640 ?auto_626639 ) ( ON ?auto_626641 ?auto_626640 ) ( ON ?auto_626642 ?auto_626641 ) ( ON ?auto_626643 ?auto_626642 ) ( ON ?auto_626644 ?auto_626643 ) ( ON ?auto_626645 ?auto_626644 ) ( ON ?auto_626646 ?auto_626645 ) ( ON ?auto_626647 ?auto_626646 ) ( not ( = ?auto_626633 ?auto_626634 ) ) ( not ( = ?auto_626633 ?auto_626635 ) ) ( not ( = ?auto_626633 ?auto_626636 ) ) ( not ( = ?auto_626633 ?auto_626637 ) ) ( not ( = ?auto_626633 ?auto_626638 ) ) ( not ( = ?auto_626633 ?auto_626639 ) ) ( not ( = ?auto_626633 ?auto_626640 ) ) ( not ( = ?auto_626633 ?auto_626641 ) ) ( not ( = ?auto_626633 ?auto_626642 ) ) ( not ( = ?auto_626633 ?auto_626643 ) ) ( not ( = ?auto_626633 ?auto_626644 ) ) ( not ( = ?auto_626633 ?auto_626645 ) ) ( not ( = ?auto_626633 ?auto_626646 ) ) ( not ( = ?auto_626633 ?auto_626647 ) ) ( not ( = ?auto_626633 ?auto_626648 ) ) ( not ( = ?auto_626633 ?auto_626649 ) ) ( not ( = ?auto_626634 ?auto_626635 ) ) ( not ( = ?auto_626634 ?auto_626636 ) ) ( not ( = ?auto_626634 ?auto_626637 ) ) ( not ( = ?auto_626634 ?auto_626638 ) ) ( not ( = ?auto_626634 ?auto_626639 ) ) ( not ( = ?auto_626634 ?auto_626640 ) ) ( not ( = ?auto_626634 ?auto_626641 ) ) ( not ( = ?auto_626634 ?auto_626642 ) ) ( not ( = ?auto_626634 ?auto_626643 ) ) ( not ( = ?auto_626634 ?auto_626644 ) ) ( not ( = ?auto_626634 ?auto_626645 ) ) ( not ( = ?auto_626634 ?auto_626646 ) ) ( not ( = ?auto_626634 ?auto_626647 ) ) ( not ( = ?auto_626634 ?auto_626648 ) ) ( not ( = ?auto_626634 ?auto_626649 ) ) ( not ( = ?auto_626635 ?auto_626636 ) ) ( not ( = ?auto_626635 ?auto_626637 ) ) ( not ( = ?auto_626635 ?auto_626638 ) ) ( not ( = ?auto_626635 ?auto_626639 ) ) ( not ( = ?auto_626635 ?auto_626640 ) ) ( not ( = ?auto_626635 ?auto_626641 ) ) ( not ( = ?auto_626635 ?auto_626642 ) ) ( not ( = ?auto_626635 ?auto_626643 ) ) ( not ( = ?auto_626635 ?auto_626644 ) ) ( not ( = ?auto_626635 ?auto_626645 ) ) ( not ( = ?auto_626635 ?auto_626646 ) ) ( not ( = ?auto_626635 ?auto_626647 ) ) ( not ( = ?auto_626635 ?auto_626648 ) ) ( not ( = ?auto_626635 ?auto_626649 ) ) ( not ( = ?auto_626636 ?auto_626637 ) ) ( not ( = ?auto_626636 ?auto_626638 ) ) ( not ( = ?auto_626636 ?auto_626639 ) ) ( not ( = ?auto_626636 ?auto_626640 ) ) ( not ( = ?auto_626636 ?auto_626641 ) ) ( not ( = ?auto_626636 ?auto_626642 ) ) ( not ( = ?auto_626636 ?auto_626643 ) ) ( not ( = ?auto_626636 ?auto_626644 ) ) ( not ( = ?auto_626636 ?auto_626645 ) ) ( not ( = ?auto_626636 ?auto_626646 ) ) ( not ( = ?auto_626636 ?auto_626647 ) ) ( not ( = ?auto_626636 ?auto_626648 ) ) ( not ( = ?auto_626636 ?auto_626649 ) ) ( not ( = ?auto_626637 ?auto_626638 ) ) ( not ( = ?auto_626637 ?auto_626639 ) ) ( not ( = ?auto_626637 ?auto_626640 ) ) ( not ( = ?auto_626637 ?auto_626641 ) ) ( not ( = ?auto_626637 ?auto_626642 ) ) ( not ( = ?auto_626637 ?auto_626643 ) ) ( not ( = ?auto_626637 ?auto_626644 ) ) ( not ( = ?auto_626637 ?auto_626645 ) ) ( not ( = ?auto_626637 ?auto_626646 ) ) ( not ( = ?auto_626637 ?auto_626647 ) ) ( not ( = ?auto_626637 ?auto_626648 ) ) ( not ( = ?auto_626637 ?auto_626649 ) ) ( not ( = ?auto_626638 ?auto_626639 ) ) ( not ( = ?auto_626638 ?auto_626640 ) ) ( not ( = ?auto_626638 ?auto_626641 ) ) ( not ( = ?auto_626638 ?auto_626642 ) ) ( not ( = ?auto_626638 ?auto_626643 ) ) ( not ( = ?auto_626638 ?auto_626644 ) ) ( not ( = ?auto_626638 ?auto_626645 ) ) ( not ( = ?auto_626638 ?auto_626646 ) ) ( not ( = ?auto_626638 ?auto_626647 ) ) ( not ( = ?auto_626638 ?auto_626648 ) ) ( not ( = ?auto_626638 ?auto_626649 ) ) ( not ( = ?auto_626639 ?auto_626640 ) ) ( not ( = ?auto_626639 ?auto_626641 ) ) ( not ( = ?auto_626639 ?auto_626642 ) ) ( not ( = ?auto_626639 ?auto_626643 ) ) ( not ( = ?auto_626639 ?auto_626644 ) ) ( not ( = ?auto_626639 ?auto_626645 ) ) ( not ( = ?auto_626639 ?auto_626646 ) ) ( not ( = ?auto_626639 ?auto_626647 ) ) ( not ( = ?auto_626639 ?auto_626648 ) ) ( not ( = ?auto_626639 ?auto_626649 ) ) ( not ( = ?auto_626640 ?auto_626641 ) ) ( not ( = ?auto_626640 ?auto_626642 ) ) ( not ( = ?auto_626640 ?auto_626643 ) ) ( not ( = ?auto_626640 ?auto_626644 ) ) ( not ( = ?auto_626640 ?auto_626645 ) ) ( not ( = ?auto_626640 ?auto_626646 ) ) ( not ( = ?auto_626640 ?auto_626647 ) ) ( not ( = ?auto_626640 ?auto_626648 ) ) ( not ( = ?auto_626640 ?auto_626649 ) ) ( not ( = ?auto_626641 ?auto_626642 ) ) ( not ( = ?auto_626641 ?auto_626643 ) ) ( not ( = ?auto_626641 ?auto_626644 ) ) ( not ( = ?auto_626641 ?auto_626645 ) ) ( not ( = ?auto_626641 ?auto_626646 ) ) ( not ( = ?auto_626641 ?auto_626647 ) ) ( not ( = ?auto_626641 ?auto_626648 ) ) ( not ( = ?auto_626641 ?auto_626649 ) ) ( not ( = ?auto_626642 ?auto_626643 ) ) ( not ( = ?auto_626642 ?auto_626644 ) ) ( not ( = ?auto_626642 ?auto_626645 ) ) ( not ( = ?auto_626642 ?auto_626646 ) ) ( not ( = ?auto_626642 ?auto_626647 ) ) ( not ( = ?auto_626642 ?auto_626648 ) ) ( not ( = ?auto_626642 ?auto_626649 ) ) ( not ( = ?auto_626643 ?auto_626644 ) ) ( not ( = ?auto_626643 ?auto_626645 ) ) ( not ( = ?auto_626643 ?auto_626646 ) ) ( not ( = ?auto_626643 ?auto_626647 ) ) ( not ( = ?auto_626643 ?auto_626648 ) ) ( not ( = ?auto_626643 ?auto_626649 ) ) ( not ( = ?auto_626644 ?auto_626645 ) ) ( not ( = ?auto_626644 ?auto_626646 ) ) ( not ( = ?auto_626644 ?auto_626647 ) ) ( not ( = ?auto_626644 ?auto_626648 ) ) ( not ( = ?auto_626644 ?auto_626649 ) ) ( not ( = ?auto_626645 ?auto_626646 ) ) ( not ( = ?auto_626645 ?auto_626647 ) ) ( not ( = ?auto_626645 ?auto_626648 ) ) ( not ( = ?auto_626645 ?auto_626649 ) ) ( not ( = ?auto_626646 ?auto_626647 ) ) ( not ( = ?auto_626646 ?auto_626648 ) ) ( not ( = ?auto_626646 ?auto_626649 ) ) ( not ( = ?auto_626647 ?auto_626648 ) ) ( not ( = ?auto_626647 ?auto_626649 ) ) ( not ( = ?auto_626648 ?auto_626649 ) ) ( CLEAR ?auto_626647 ) ( ON ?auto_626648 ?auto_626649 ) ( CLEAR ?auto_626648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_626633 ?auto_626634 ?auto_626635 ?auto_626636 ?auto_626637 ?auto_626638 ?auto_626639 ?auto_626640 ?auto_626641 ?auto_626642 ?auto_626643 ?auto_626644 ?auto_626645 ?auto_626646 ?auto_626647 ?auto_626648 )
      ( MAKE-17PILE ?auto_626633 ?auto_626634 ?auto_626635 ?auto_626636 ?auto_626637 ?auto_626638 ?auto_626639 ?auto_626640 ?auto_626641 ?auto_626642 ?auto_626643 ?auto_626644 ?auto_626645 ?auto_626646 ?auto_626647 ?auto_626648 ?auto_626649 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626667 - BLOCK
      ?auto_626668 - BLOCK
      ?auto_626669 - BLOCK
      ?auto_626670 - BLOCK
      ?auto_626671 - BLOCK
      ?auto_626672 - BLOCK
      ?auto_626673 - BLOCK
      ?auto_626674 - BLOCK
      ?auto_626675 - BLOCK
      ?auto_626676 - BLOCK
      ?auto_626677 - BLOCK
      ?auto_626678 - BLOCK
      ?auto_626679 - BLOCK
      ?auto_626680 - BLOCK
      ?auto_626681 - BLOCK
      ?auto_626682 - BLOCK
      ?auto_626683 - BLOCK
    )
    :vars
    (
      ?auto_626684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626683 ?auto_626684 ) ( ON-TABLE ?auto_626667 ) ( ON ?auto_626668 ?auto_626667 ) ( ON ?auto_626669 ?auto_626668 ) ( ON ?auto_626670 ?auto_626669 ) ( ON ?auto_626671 ?auto_626670 ) ( ON ?auto_626672 ?auto_626671 ) ( ON ?auto_626673 ?auto_626672 ) ( ON ?auto_626674 ?auto_626673 ) ( ON ?auto_626675 ?auto_626674 ) ( ON ?auto_626676 ?auto_626675 ) ( ON ?auto_626677 ?auto_626676 ) ( ON ?auto_626678 ?auto_626677 ) ( ON ?auto_626679 ?auto_626678 ) ( ON ?auto_626680 ?auto_626679 ) ( not ( = ?auto_626667 ?auto_626668 ) ) ( not ( = ?auto_626667 ?auto_626669 ) ) ( not ( = ?auto_626667 ?auto_626670 ) ) ( not ( = ?auto_626667 ?auto_626671 ) ) ( not ( = ?auto_626667 ?auto_626672 ) ) ( not ( = ?auto_626667 ?auto_626673 ) ) ( not ( = ?auto_626667 ?auto_626674 ) ) ( not ( = ?auto_626667 ?auto_626675 ) ) ( not ( = ?auto_626667 ?auto_626676 ) ) ( not ( = ?auto_626667 ?auto_626677 ) ) ( not ( = ?auto_626667 ?auto_626678 ) ) ( not ( = ?auto_626667 ?auto_626679 ) ) ( not ( = ?auto_626667 ?auto_626680 ) ) ( not ( = ?auto_626667 ?auto_626681 ) ) ( not ( = ?auto_626667 ?auto_626682 ) ) ( not ( = ?auto_626667 ?auto_626683 ) ) ( not ( = ?auto_626667 ?auto_626684 ) ) ( not ( = ?auto_626668 ?auto_626669 ) ) ( not ( = ?auto_626668 ?auto_626670 ) ) ( not ( = ?auto_626668 ?auto_626671 ) ) ( not ( = ?auto_626668 ?auto_626672 ) ) ( not ( = ?auto_626668 ?auto_626673 ) ) ( not ( = ?auto_626668 ?auto_626674 ) ) ( not ( = ?auto_626668 ?auto_626675 ) ) ( not ( = ?auto_626668 ?auto_626676 ) ) ( not ( = ?auto_626668 ?auto_626677 ) ) ( not ( = ?auto_626668 ?auto_626678 ) ) ( not ( = ?auto_626668 ?auto_626679 ) ) ( not ( = ?auto_626668 ?auto_626680 ) ) ( not ( = ?auto_626668 ?auto_626681 ) ) ( not ( = ?auto_626668 ?auto_626682 ) ) ( not ( = ?auto_626668 ?auto_626683 ) ) ( not ( = ?auto_626668 ?auto_626684 ) ) ( not ( = ?auto_626669 ?auto_626670 ) ) ( not ( = ?auto_626669 ?auto_626671 ) ) ( not ( = ?auto_626669 ?auto_626672 ) ) ( not ( = ?auto_626669 ?auto_626673 ) ) ( not ( = ?auto_626669 ?auto_626674 ) ) ( not ( = ?auto_626669 ?auto_626675 ) ) ( not ( = ?auto_626669 ?auto_626676 ) ) ( not ( = ?auto_626669 ?auto_626677 ) ) ( not ( = ?auto_626669 ?auto_626678 ) ) ( not ( = ?auto_626669 ?auto_626679 ) ) ( not ( = ?auto_626669 ?auto_626680 ) ) ( not ( = ?auto_626669 ?auto_626681 ) ) ( not ( = ?auto_626669 ?auto_626682 ) ) ( not ( = ?auto_626669 ?auto_626683 ) ) ( not ( = ?auto_626669 ?auto_626684 ) ) ( not ( = ?auto_626670 ?auto_626671 ) ) ( not ( = ?auto_626670 ?auto_626672 ) ) ( not ( = ?auto_626670 ?auto_626673 ) ) ( not ( = ?auto_626670 ?auto_626674 ) ) ( not ( = ?auto_626670 ?auto_626675 ) ) ( not ( = ?auto_626670 ?auto_626676 ) ) ( not ( = ?auto_626670 ?auto_626677 ) ) ( not ( = ?auto_626670 ?auto_626678 ) ) ( not ( = ?auto_626670 ?auto_626679 ) ) ( not ( = ?auto_626670 ?auto_626680 ) ) ( not ( = ?auto_626670 ?auto_626681 ) ) ( not ( = ?auto_626670 ?auto_626682 ) ) ( not ( = ?auto_626670 ?auto_626683 ) ) ( not ( = ?auto_626670 ?auto_626684 ) ) ( not ( = ?auto_626671 ?auto_626672 ) ) ( not ( = ?auto_626671 ?auto_626673 ) ) ( not ( = ?auto_626671 ?auto_626674 ) ) ( not ( = ?auto_626671 ?auto_626675 ) ) ( not ( = ?auto_626671 ?auto_626676 ) ) ( not ( = ?auto_626671 ?auto_626677 ) ) ( not ( = ?auto_626671 ?auto_626678 ) ) ( not ( = ?auto_626671 ?auto_626679 ) ) ( not ( = ?auto_626671 ?auto_626680 ) ) ( not ( = ?auto_626671 ?auto_626681 ) ) ( not ( = ?auto_626671 ?auto_626682 ) ) ( not ( = ?auto_626671 ?auto_626683 ) ) ( not ( = ?auto_626671 ?auto_626684 ) ) ( not ( = ?auto_626672 ?auto_626673 ) ) ( not ( = ?auto_626672 ?auto_626674 ) ) ( not ( = ?auto_626672 ?auto_626675 ) ) ( not ( = ?auto_626672 ?auto_626676 ) ) ( not ( = ?auto_626672 ?auto_626677 ) ) ( not ( = ?auto_626672 ?auto_626678 ) ) ( not ( = ?auto_626672 ?auto_626679 ) ) ( not ( = ?auto_626672 ?auto_626680 ) ) ( not ( = ?auto_626672 ?auto_626681 ) ) ( not ( = ?auto_626672 ?auto_626682 ) ) ( not ( = ?auto_626672 ?auto_626683 ) ) ( not ( = ?auto_626672 ?auto_626684 ) ) ( not ( = ?auto_626673 ?auto_626674 ) ) ( not ( = ?auto_626673 ?auto_626675 ) ) ( not ( = ?auto_626673 ?auto_626676 ) ) ( not ( = ?auto_626673 ?auto_626677 ) ) ( not ( = ?auto_626673 ?auto_626678 ) ) ( not ( = ?auto_626673 ?auto_626679 ) ) ( not ( = ?auto_626673 ?auto_626680 ) ) ( not ( = ?auto_626673 ?auto_626681 ) ) ( not ( = ?auto_626673 ?auto_626682 ) ) ( not ( = ?auto_626673 ?auto_626683 ) ) ( not ( = ?auto_626673 ?auto_626684 ) ) ( not ( = ?auto_626674 ?auto_626675 ) ) ( not ( = ?auto_626674 ?auto_626676 ) ) ( not ( = ?auto_626674 ?auto_626677 ) ) ( not ( = ?auto_626674 ?auto_626678 ) ) ( not ( = ?auto_626674 ?auto_626679 ) ) ( not ( = ?auto_626674 ?auto_626680 ) ) ( not ( = ?auto_626674 ?auto_626681 ) ) ( not ( = ?auto_626674 ?auto_626682 ) ) ( not ( = ?auto_626674 ?auto_626683 ) ) ( not ( = ?auto_626674 ?auto_626684 ) ) ( not ( = ?auto_626675 ?auto_626676 ) ) ( not ( = ?auto_626675 ?auto_626677 ) ) ( not ( = ?auto_626675 ?auto_626678 ) ) ( not ( = ?auto_626675 ?auto_626679 ) ) ( not ( = ?auto_626675 ?auto_626680 ) ) ( not ( = ?auto_626675 ?auto_626681 ) ) ( not ( = ?auto_626675 ?auto_626682 ) ) ( not ( = ?auto_626675 ?auto_626683 ) ) ( not ( = ?auto_626675 ?auto_626684 ) ) ( not ( = ?auto_626676 ?auto_626677 ) ) ( not ( = ?auto_626676 ?auto_626678 ) ) ( not ( = ?auto_626676 ?auto_626679 ) ) ( not ( = ?auto_626676 ?auto_626680 ) ) ( not ( = ?auto_626676 ?auto_626681 ) ) ( not ( = ?auto_626676 ?auto_626682 ) ) ( not ( = ?auto_626676 ?auto_626683 ) ) ( not ( = ?auto_626676 ?auto_626684 ) ) ( not ( = ?auto_626677 ?auto_626678 ) ) ( not ( = ?auto_626677 ?auto_626679 ) ) ( not ( = ?auto_626677 ?auto_626680 ) ) ( not ( = ?auto_626677 ?auto_626681 ) ) ( not ( = ?auto_626677 ?auto_626682 ) ) ( not ( = ?auto_626677 ?auto_626683 ) ) ( not ( = ?auto_626677 ?auto_626684 ) ) ( not ( = ?auto_626678 ?auto_626679 ) ) ( not ( = ?auto_626678 ?auto_626680 ) ) ( not ( = ?auto_626678 ?auto_626681 ) ) ( not ( = ?auto_626678 ?auto_626682 ) ) ( not ( = ?auto_626678 ?auto_626683 ) ) ( not ( = ?auto_626678 ?auto_626684 ) ) ( not ( = ?auto_626679 ?auto_626680 ) ) ( not ( = ?auto_626679 ?auto_626681 ) ) ( not ( = ?auto_626679 ?auto_626682 ) ) ( not ( = ?auto_626679 ?auto_626683 ) ) ( not ( = ?auto_626679 ?auto_626684 ) ) ( not ( = ?auto_626680 ?auto_626681 ) ) ( not ( = ?auto_626680 ?auto_626682 ) ) ( not ( = ?auto_626680 ?auto_626683 ) ) ( not ( = ?auto_626680 ?auto_626684 ) ) ( not ( = ?auto_626681 ?auto_626682 ) ) ( not ( = ?auto_626681 ?auto_626683 ) ) ( not ( = ?auto_626681 ?auto_626684 ) ) ( not ( = ?auto_626682 ?auto_626683 ) ) ( not ( = ?auto_626682 ?auto_626684 ) ) ( not ( = ?auto_626683 ?auto_626684 ) ) ( ON ?auto_626682 ?auto_626683 ) ( CLEAR ?auto_626680 ) ( ON ?auto_626681 ?auto_626682 ) ( CLEAR ?auto_626681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_626667 ?auto_626668 ?auto_626669 ?auto_626670 ?auto_626671 ?auto_626672 ?auto_626673 ?auto_626674 ?auto_626675 ?auto_626676 ?auto_626677 ?auto_626678 ?auto_626679 ?auto_626680 ?auto_626681 )
      ( MAKE-17PILE ?auto_626667 ?auto_626668 ?auto_626669 ?auto_626670 ?auto_626671 ?auto_626672 ?auto_626673 ?auto_626674 ?auto_626675 ?auto_626676 ?auto_626677 ?auto_626678 ?auto_626679 ?auto_626680 ?auto_626681 ?auto_626682 ?auto_626683 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626702 - BLOCK
      ?auto_626703 - BLOCK
      ?auto_626704 - BLOCK
      ?auto_626705 - BLOCK
      ?auto_626706 - BLOCK
      ?auto_626707 - BLOCK
      ?auto_626708 - BLOCK
      ?auto_626709 - BLOCK
      ?auto_626710 - BLOCK
      ?auto_626711 - BLOCK
      ?auto_626712 - BLOCK
      ?auto_626713 - BLOCK
      ?auto_626714 - BLOCK
      ?auto_626715 - BLOCK
      ?auto_626716 - BLOCK
      ?auto_626717 - BLOCK
      ?auto_626718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_626718 ) ( ON-TABLE ?auto_626702 ) ( ON ?auto_626703 ?auto_626702 ) ( ON ?auto_626704 ?auto_626703 ) ( ON ?auto_626705 ?auto_626704 ) ( ON ?auto_626706 ?auto_626705 ) ( ON ?auto_626707 ?auto_626706 ) ( ON ?auto_626708 ?auto_626707 ) ( ON ?auto_626709 ?auto_626708 ) ( ON ?auto_626710 ?auto_626709 ) ( ON ?auto_626711 ?auto_626710 ) ( ON ?auto_626712 ?auto_626711 ) ( ON ?auto_626713 ?auto_626712 ) ( ON ?auto_626714 ?auto_626713 ) ( ON ?auto_626715 ?auto_626714 ) ( not ( = ?auto_626702 ?auto_626703 ) ) ( not ( = ?auto_626702 ?auto_626704 ) ) ( not ( = ?auto_626702 ?auto_626705 ) ) ( not ( = ?auto_626702 ?auto_626706 ) ) ( not ( = ?auto_626702 ?auto_626707 ) ) ( not ( = ?auto_626702 ?auto_626708 ) ) ( not ( = ?auto_626702 ?auto_626709 ) ) ( not ( = ?auto_626702 ?auto_626710 ) ) ( not ( = ?auto_626702 ?auto_626711 ) ) ( not ( = ?auto_626702 ?auto_626712 ) ) ( not ( = ?auto_626702 ?auto_626713 ) ) ( not ( = ?auto_626702 ?auto_626714 ) ) ( not ( = ?auto_626702 ?auto_626715 ) ) ( not ( = ?auto_626702 ?auto_626716 ) ) ( not ( = ?auto_626702 ?auto_626717 ) ) ( not ( = ?auto_626702 ?auto_626718 ) ) ( not ( = ?auto_626703 ?auto_626704 ) ) ( not ( = ?auto_626703 ?auto_626705 ) ) ( not ( = ?auto_626703 ?auto_626706 ) ) ( not ( = ?auto_626703 ?auto_626707 ) ) ( not ( = ?auto_626703 ?auto_626708 ) ) ( not ( = ?auto_626703 ?auto_626709 ) ) ( not ( = ?auto_626703 ?auto_626710 ) ) ( not ( = ?auto_626703 ?auto_626711 ) ) ( not ( = ?auto_626703 ?auto_626712 ) ) ( not ( = ?auto_626703 ?auto_626713 ) ) ( not ( = ?auto_626703 ?auto_626714 ) ) ( not ( = ?auto_626703 ?auto_626715 ) ) ( not ( = ?auto_626703 ?auto_626716 ) ) ( not ( = ?auto_626703 ?auto_626717 ) ) ( not ( = ?auto_626703 ?auto_626718 ) ) ( not ( = ?auto_626704 ?auto_626705 ) ) ( not ( = ?auto_626704 ?auto_626706 ) ) ( not ( = ?auto_626704 ?auto_626707 ) ) ( not ( = ?auto_626704 ?auto_626708 ) ) ( not ( = ?auto_626704 ?auto_626709 ) ) ( not ( = ?auto_626704 ?auto_626710 ) ) ( not ( = ?auto_626704 ?auto_626711 ) ) ( not ( = ?auto_626704 ?auto_626712 ) ) ( not ( = ?auto_626704 ?auto_626713 ) ) ( not ( = ?auto_626704 ?auto_626714 ) ) ( not ( = ?auto_626704 ?auto_626715 ) ) ( not ( = ?auto_626704 ?auto_626716 ) ) ( not ( = ?auto_626704 ?auto_626717 ) ) ( not ( = ?auto_626704 ?auto_626718 ) ) ( not ( = ?auto_626705 ?auto_626706 ) ) ( not ( = ?auto_626705 ?auto_626707 ) ) ( not ( = ?auto_626705 ?auto_626708 ) ) ( not ( = ?auto_626705 ?auto_626709 ) ) ( not ( = ?auto_626705 ?auto_626710 ) ) ( not ( = ?auto_626705 ?auto_626711 ) ) ( not ( = ?auto_626705 ?auto_626712 ) ) ( not ( = ?auto_626705 ?auto_626713 ) ) ( not ( = ?auto_626705 ?auto_626714 ) ) ( not ( = ?auto_626705 ?auto_626715 ) ) ( not ( = ?auto_626705 ?auto_626716 ) ) ( not ( = ?auto_626705 ?auto_626717 ) ) ( not ( = ?auto_626705 ?auto_626718 ) ) ( not ( = ?auto_626706 ?auto_626707 ) ) ( not ( = ?auto_626706 ?auto_626708 ) ) ( not ( = ?auto_626706 ?auto_626709 ) ) ( not ( = ?auto_626706 ?auto_626710 ) ) ( not ( = ?auto_626706 ?auto_626711 ) ) ( not ( = ?auto_626706 ?auto_626712 ) ) ( not ( = ?auto_626706 ?auto_626713 ) ) ( not ( = ?auto_626706 ?auto_626714 ) ) ( not ( = ?auto_626706 ?auto_626715 ) ) ( not ( = ?auto_626706 ?auto_626716 ) ) ( not ( = ?auto_626706 ?auto_626717 ) ) ( not ( = ?auto_626706 ?auto_626718 ) ) ( not ( = ?auto_626707 ?auto_626708 ) ) ( not ( = ?auto_626707 ?auto_626709 ) ) ( not ( = ?auto_626707 ?auto_626710 ) ) ( not ( = ?auto_626707 ?auto_626711 ) ) ( not ( = ?auto_626707 ?auto_626712 ) ) ( not ( = ?auto_626707 ?auto_626713 ) ) ( not ( = ?auto_626707 ?auto_626714 ) ) ( not ( = ?auto_626707 ?auto_626715 ) ) ( not ( = ?auto_626707 ?auto_626716 ) ) ( not ( = ?auto_626707 ?auto_626717 ) ) ( not ( = ?auto_626707 ?auto_626718 ) ) ( not ( = ?auto_626708 ?auto_626709 ) ) ( not ( = ?auto_626708 ?auto_626710 ) ) ( not ( = ?auto_626708 ?auto_626711 ) ) ( not ( = ?auto_626708 ?auto_626712 ) ) ( not ( = ?auto_626708 ?auto_626713 ) ) ( not ( = ?auto_626708 ?auto_626714 ) ) ( not ( = ?auto_626708 ?auto_626715 ) ) ( not ( = ?auto_626708 ?auto_626716 ) ) ( not ( = ?auto_626708 ?auto_626717 ) ) ( not ( = ?auto_626708 ?auto_626718 ) ) ( not ( = ?auto_626709 ?auto_626710 ) ) ( not ( = ?auto_626709 ?auto_626711 ) ) ( not ( = ?auto_626709 ?auto_626712 ) ) ( not ( = ?auto_626709 ?auto_626713 ) ) ( not ( = ?auto_626709 ?auto_626714 ) ) ( not ( = ?auto_626709 ?auto_626715 ) ) ( not ( = ?auto_626709 ?auto_626716 ) ) ( not ( = ?auto_626709 ?auto_626717 ) ) ( not ( = ?auto_626709 ?auto_626718 ) ) ( not ( = ?auto_626710 ?auto_626711 ) ) ( not ( = ?auto_626710 ?auto_626712 ) ) ( not ( = ?auto_626710 ?auto_626713 ) ) ( not ( = ?auto_626710 ?auto_626714 ) ) ( not ( = ?auto_626710 ?auto_626715 ) ) ( not ( = ?auto_626710 ?auto_626716 ) ) ( not ( = ?auto_626710 ?auto_626717 ) ) ( not ( = ?auto_626710 ?auto_626718 ) ) ( not ( = ?auto_626711 ?auto_626712 ) ) ( not ( = ?auto_626711 ?auto_626713 ) ) ( not ( = ?auto_626711 ?auto_626714 ) ) ( not ( = ?auto_626711 ?auto_626715 ) ) ( not ( = ?auto_626711 ?auto_626716 ) ) ( not ( = ?auto_626711 ?auto_626717 ) ) ( not ( = ?auto_626711 ?auto_626718 ) ) ( not ( = ?auto_626712 ?auto_626713 ) ) ( not ( = ?auto_626712 ?auto_626714 ) ) ( not ( = ?auto_626712 ?auto_626715 ) ) ( not ( = ?auto_626712 ?auto_626716 ) ) ( not ( = ?auto_626712 ?auto_626717 ) ) ( not ( = ?auto_626712 ?auto_626718 ) ) ( not ( = ?auto_626713 ?auto_626714 ) ) ( not ( = ?auto_626713 ?auto_626715 ) ) ( not ( = ?auto_626713 ?auto_626716 ) ) ( not ( = ?auto_626713 ?auto_626717 ) ) ( not ( = ?auto_626713 ?auto_626718 ) ) ( not ( = ?auto_626714 ?auto_626715 ) ) ( not ( = ?auto_626714 ?auto_626716 ) ) ( not ( = ?auto_626714 ?auto_626717 ) ) ( not ( = ?auto_626714 ?auto_626718 ) ) ( not ( = ?auto_626715 ?auto_626716 ) ) ( not ( = ?auto_626715 ?auto_626717 ) ) ( not ( = ?auto_626715 ?auto_626718 ) ) ( not ( = ?auto_626716 ?auto_626717 ) ) ( not ( = ?auto_626716 ?auto_626718 ) ) ( not ( = ?auto_626717 ?auto_626718 ) ) ( ON ?auto_626717 ?auto_626718 ) ( CLEAR ?auto_626715 ) ( ON ?auto_626716 ?auto_626717 ) ( CLEAR ?auto_626716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_626702 ?auto_626703 ?auto_626704 ?auto_626705 ?auto_626706 ?auto_626707 ?auto_626708 ?auto_626709 ?auto_626710 ?auto_626711 ?auto_626712 ?auto_626713 ?auto_626714 ?auto_626715 ?auto_626716 )
      ( MAKE-17PILE ?auto_626702 ?auto_626703 ?auto_626704 ?auto_626705 ?auto_626706 ?auto_626707 ?auto_626708 ?auto_626709 ?auto_626710 ?auto_626711 ?auto_626712 ?auto_626713 ?auto_626714 ?auto_626715 ?auto_626716 ?auto_626717 ?auto_626718 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626736 - BLOCK
      ?auto_626737 - BLOCK
      ?auto_626738 - BLOCK
      ?auto_626739 - BLOCK
      ?auto_626740 - BLOCK
      ?auto_626741 - BLOCK
      ?auto_626742 - BLOCK
      ?auto_626743 - BLOCK
      ?auto_626744 - BLOCK
      ?auto_626745 - BLOCK
      ?auto_626746 - BLOCK
      ?auto_626747 - BLOCK
      ?auto_626748 - BLOCK
      ?auto_626749 - BLOCK
      ?auto_626750 - BLOCK
      ?auto_626751 - BLOCK
      ?auto_626752 - BLOCK
    )
    :vars
    (
      ?auto_626753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626752 ?auto_626753 ) ( ON-TABLE ?auto_626736 ) ( ON ?auto_626737 ?auto_626736 ) ( ON ?auto_626738 ?auto_626737 ) ( ON ?auto_626739 ?auto_626738 ) ( ON ?auto_626740 ?auto_626739 ) ( ON ?auto_626741 ?auto_626740 ) ( ON ?auto_626742 ?auto_626741 ) ( ON ?auto_626743 ?auto_626742 ) ( ON ?auto_626744 ?auto_626743 ) ( ON ?auto_626745 ?auto_626744 ) ( ON ?auto_626746 ?auto_626745 ) ( ON ?auto_626747 ?auto_626746 ) ( ON ?auto_626748 ?auto_626747 ) ( not ( = ?auto_626736 ?auto_626737 ) ) ( not ( = ?auto_626736 ?auto_626738 ) ) ( not ( = ?auto_626736 ?auto_626739 ) ) ( not ( = ?auto_626736 ?auto_626740 ) ) ( not ( = ?auto_626736 ?auto_626741 ) ) ( not ( = ?auto_626736 ?auto_626742 ) ) ( not ( = ?auto_626736 ?auto_626743 ) ) ( not ( = ?auto_626736 ?auto_626744 ) ) ( not ( = ?auto_626736 ?auto_626745 ) ) ( not ( = ?auto_626736 ?auto_626746 ) ) ( not ( = ?auto_626736 ?auto_626747 ) ) ( not ( = ?auto_626736 ?auto_626748 ) ) ( not ( = ?auto_626736 ?auto_626749 ) ) ( not ( = ?auto_626736 ?auto_626750 ) ) ( not ( = ?auto_626736 ?auto_626751 ) ) ( not ( = ?auto_626736 ?auto_626752 ) ) ( not ( = ?auto_626736 ?auto_626753 ) ) ( not ( = ?auto_626737 ?auto_626738 ) ) ( not ( = ?auto_626737 ?auto_626739 ) ) ( not ( = ?auto_626737 ?auto_626740 ) ) ( not ( = ?auto_626737 ?auto_626741 ) ) ( not ( = ?auto_626737 ?auto_626742 ) ) ( not ( = ?auto_626737 ?auto_626743 ) ) ( not ( = ?auto_626737 ?auto_626744 ) ) ( not ( = ?auto_626737 ?auto_626745 ) ) ( not ( = ?auto_626737 ?auto_626746 ) ) ( not ( = ?auto_626737 ?auto_626747 ) ) ( not ( = ?auto_626737 ?auto_626748 ) ) ( not ( = ?auto_626737 ?auto_626749 ) ) ( not ( = ?auto_626737 ?auto_626750 ) ) ( not ( = ?auto_626737 ?auto_626751 ) ) ( not ( = ?auto_626737 ?auto_626752 ) ) ( not ( = ?auto_626737 ?auto_626753 ) ) ( not ( = ?auto_626738 ?auto_626739 ) ) ( not ( = ?auto_626738 ?auto_626740 ) ) ( not ( = ?auto_626738 ?auto_626741 ) ) ( not ( = ?auto_626738 ?auto_626742 ) ) ( not ( = ?auto_626738 ?auto_626743 ) ) ( not ( = ?auto_626738 ?auto_626744 ) ) ( not ( = ?auto_626738 ?auto_626745 ) ) ( not ( = ?auto_626738 ?auto_626746 ) ) ( not ( = ?auto_626738 ?auto_626747 ) ) ( not ( = ?auto_626738 ?auto_626748 ) ) ( not ( = ?auto_626738 ?auto_626749 ) ) ( not ( = ?auto_626738 ?auto_626750 ) ) ( not ( = ?auto_626738 ?auto_626751 ) ) ( not ( = ?auto_626738 ?auto_626752 ) ) ( not ( = ?auto_626738 ?auto_626753 ) ) ( not ( = ?auto_626739 ?auto_626740 ) ) ( not ( = ?auto_626739 ?auto_626741 ) ) ( not ( = ?auto_626739 ?auto_626742 ) ) ( not ( = ?auto_626739 ?auto_626743 ) ) ( not ( = ?auto_626739 ?auto_626744 ) ) ( not ( = ?auto_626739 ?auto_626745 ) ) ( not ( = ?auto_626739 ?auto_626746 ) ) ( not ( = ?auto_626739 ?auto_626747 ) ) ( not ( = ?auto_626739 ?auto_626748 ) ) ( not ( = ?auto_626739 ?auto_626749 ) ) ( not ( = ?auto_626739 ?auto_626750 ) ) ( not ( = ?auto_626739 ?auto_626751 ) ) ( not ( = ?auto_626739 ?auto_626752 ) ) ( not ( = ?auto_626739 ?auto_626753 ) ) ( not ( = ?auto_626740 ?auto_626741 ) ) ( not ( = ?auto_626740 ?auto_626742 ) ) ( not ( = ?auto_626740 ?auto_626743 ) ) ( not ( = ?auto_626740 ?auto_626744 ) ) ( not ( = ?auto_626740 ?auto_626745 ) ) ( not ( = ?auto_626740 ?auto_626746 ) ) ( not ( = ?auto_626740 ?auto_626747 ) ) ( not ( = ?auto_626740 ?auto_626748 ) ) ( not ( = ?auto_626740 ?auto_626749 ) ) ( not ( = ?auto_626740 ?auto_626750 ) ) ( not ( = ?auto_626740 ?auto_626751 ) ) ( not ( = ?auto_626740 ?auto_626752 ) ) ( not ( = ?auto_626740 ?auto_626753 ) ) ( not ( = ?auto_626741 ?auto_626742 ) ) ( not ( = ?auto_626741 ?auto_626743 ) ) ( not ( = ?auto_626741 ?auto_626744 ) ) ( not ( = ?auto_626741 ?auto_626745 ) ) ( not ( = ?auto_626741 ?auto_626746 ) ) ( not ( = ?auto_626741 ?auto_626747 ) ) ( not ( = ?auto_626741 ?auto_626748 ) ) ( not ( = ?auto_626741 ?auto_626749 ) ) ( not ( = ?auto_626741 ?auto_626750 ) ) ( not ( = ?auto_626741 ?auto_626751 ) ) ( not ( = ?auto_626741 ?auto_626752 ) ) ( not ( = ?auto_626741 ?auto_626753 ) ) ( not ( = ?auto_626742 ?auto_626743 ) ) ( not ( = ?auto_626742 ?auto_626744 ) ) ( not ( = ?auto_626742 ?auto_626745 ) ) ( not ( = ?auto_626742 ?auto_626746 ) ) ( not ( = ?auto_626742 ?auto_626747 ) ) ( not ( = ?auto_626742 ?auto_626748 ) ) ( not ( = ?auto_626742 ?auto_626749 ) ) ( not ( = ?auto_626742 ?auto_626750 ) ) ( not ( = ?auto_626742 ?auto_626751 ) ) ( not ( = ?auto_626742 ?auto_626752 ) ) ( not ( = ?auto_626742 ?auto_626753 ) ) ( not ( = ?auto_626743 ?auto_626744 ) ) ( not ( = ?auto_626743 ?auto_626745 ) ) ( not ( = ?auto_626743 ?auto_626746 ) ) ( not ( = ?auto_626743 ?auto_626747 ) ) ( not ( = ?auto_626743 ?auto_626748 ) ) ( not ( = ?auto_626743 ?auto_626749 ) ) ( not ( = ?auto_626743 ?auto_626750 ) ) ( not ( = ?auto_626743 ?auto_626751 ) ) ( not ( = ?auto_626743 ?auto_626752 ) ) ( not ( = ?auto_626743 ?auto_626753 ) ) ( not ( = ?auto_626744 ?auto_626745 ) ) ( not ( = ?auto_626744 ?auto_626746 ) ) ( not ( = ?auto_626744 ?auto_626747 ) ) ( not ( = ?auto_626744 ?auto_626748 ) ) ( not ( = ?auto_626744 ?auto_626749 ) ) ( not ( = ?auto_626744 ?auto_626750 ) ) ( not ( = ?auto_626744 ?auto_626751 ) ) ( not ( = ?auto_626744 ?auto_626752 ) ) ( not ( = ?auto_626744 ?auto_626753 ) ) ( not ( = ?auto_626745 ?auto_626746 ) ) ( not ( = ?auto_626745 ?auto_626747 ) ) ( not ( = ?auto_626745 ?auto_626748 ) ) ( not ( = ?auto_626745 ?auto_626749 ) ) ( not ( = ?auto_626745 ?auto_626750 ) ) ( not ( = ?auto_626745 ?auto_626751 ) ) ( not ( = ?auto_626745 ?auto_626752 ) ) ( not ( = ?auto_626745 ?auto_626753 ) ) ( not ( = ?auto_626746 ?auto_626747 ) ) ( not ( = ?auto_626746 ?auto_626748 ) ) ( not ( = ?auto_626746 ?auto_626749 ) ) ( not ( = ?auto_626746 ?auto_626750 ) ) ( not ( = ?auto_626746 ?auto_626751 ) ) ( not ( = ?auto_626746 ?auto_626752 ) ) ( not ( = ?auto_626746 ?auto_626753 ) ) ( not ( = ?auto_626747 ?auto_626748 ) ) ( not ( = ?auto_626747 ?auto_626749 ) ) ( not ( = ?auto_626747 ?auto_626750 ) ) ( not ( = ?auto_626747 ?auto_626751 ) ) ( not ( = ?auto_626747 ?auto_626752 ) ) ( not ( = ?auto_626747 ?auto_626753 ) ) ( not ( = ?auto_626748 ?auto_626749 ) ) ( not ( = ?auto_626748 ?auto_626750 ) ) ( not ( = ?auto_626748 ?auto_626751 ) ) ( not ( = ?auto_626748 ?auto_626752 ) ) ( not ( = ?auto_626748 ?auto_626753 ) ) ( not ( = ?auto_626749 ?auto_626750 ) ) ( not ( = ?auto_626749 ?auto_626751 ) ) ( not ( = ?auto_626749 ?auto_626752 ) ) ( not ( = ?auto_626749 ?auto_626753 ) ) ( not ( = ?auto_626750 ?auto_626751 ) ) ( not ( = ?auto_626750 ?auto_626752 ) ) ( not ( = ?auto_626750 ?auto_626753 ) ) ( not ( = ?auto_626751 ?auto_626752 ) ) ( not ( = ?auto_626751 ?auto_626753 ) ) ( not ( = ?auto_626752 ?auto_626753 ) ) ( ON ?auto_626751 ?auto_626752 ) ( ON ?auto_626750 ?auto_626751 ) ( CLEAR ?auto_626748 ) ( ON ?auto_626749 ?auto_626750 ) ( CLEAR ?auto_626749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_626736 ?auto_626737 ?auto_626738 ?auto_626739 ?auto_626740 ?auto_626741 ?auto_626742 ?auto_626743 ?auto_626744 ?auto_626745 ?auto_626746 ?auto_626747 ?auto_626748 ?auto_626749 )
      ( MAKE-17PILE ?auto_626736 ?auto_626737 ?auto_626738 ?auto_626739 ?auto_626740 ?auto_626741 ?auto_626742 ?auto_626743 ?auto_626744 ?auto_626745 ?auto_626746 ?auto_626747 ?auto_626748 ?auto_626749 ?auto_626750 ?auto_626751 ?auto_626752 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626771 - BLOCK
      ?auto_626772 - BLOCK
      ?auto_626773 - BLOCK
      ?auto_626774 - BLOCK
      ?auto_626775 - BLOCK
      ?auto_626776 - BLOCK
      ?auto_626777 - BLOCK
      ?auto_626778 - BLOCK
      ?auto_626779 - BLOCK
      ?auto_626780 - BLOCK
      ?auto_626781 - BLOCK
      ?auto_626782 - BLOCK
      ?auto_626783 - BLOCK
      ?auto_626784 - BLOCK
      ?auto_626785 - BLOCK
      ?auto_626786 - BLOCK
      ?auto_626787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_626787 ) ( ON-TABLE ?auto_626771 ) ( ON ?auto_626772 ?auto_626771 ) ( ON ?auto_626773 ?auto_626772 ) ( ON ?auto_626774 ?auto_626773 ) ( ON ?auto_626775 ?auto_626774 ) ( ON ?auto_626776 ?auto_626775 ) ( ON ?auto_626777 ?auto_626776 ) ( ON ?auto_626778 ?auto_626777 ) ( ON ?auto_626779 ?auto_626778 ) ( ON ?auto_626780 ?auto_626779 ) ( ON ?auto_626781 ?auto_626780 ) ( ON ?auto_626782 ?auto_626781 ) ( ON ?auto_626783 ?auto_626782 ) ( not ( = ?auto_626771 ?auto_626772 ) ) ( not ( = ?auto_626771 ?auto_626773 ) ) ( not ( = ?auto_626771 ?auto_626774 ) ) ( not ( = ?auto_626771 ?auto_626775 ) ) ( not ( = ?auto_626771 ?auto_626776 ) ) ( not ( = ?auto_626771 ?auto_626777 ) ) ( not ( = ?auto_626771 ?auto_626778 ) ) ( not ( = ?auto_626771 ?auto_626779 ) ) ( not ( = ?auto_626771 ?auto_626780 ) ) ( not ( = ?auto_626771 ?auto_626781 ) ) ( not ( = ?auto_626771 ?auto_626782 ) ) ( not ( = ?auto_626771 ?auto_626783 ) ) ( not ( = ?auto_626771 ?auto_626784 ) ) ( not ( = ?auto_626771 ?auto_626785 ) ) ( not ( = ?auto_626771 ?auto_626786 ) ) ( not ( = ?auto_626771 ?auto_626787 ) ) ( not ( = ?auto_626772 ?auto_626773 ) ) ( not ( = ?auto_626772 ?auto_626774 ) ) ( not ( = ?auto_626772 ?auto_626775 ) ) ( not ( = ?auto_626772 ?auto_626776 ) ) ( not ( = ?auto_626772 ?auto_626777 ) ) ( not ( = ?auto_626772 ?auto_626778 ) ) ( not ( = ?auto_626772 ?auto_626779 ) ) ( not ( = ?auto_626772 ?auto_626780 ) ) ( not ( = ?auto_626772 ?auto_626781 ) ) ( not ( = ?auto_626772 ?auto_626782 ) ) ( not ( = ?auto_626772 ?auto_626783 ) ) ( not ( = ?auto_626772 ?auto_626784 ) ) ( not ( = ?auto_626772 ?auto_626785 ) ) ( not ( = ?auto_626772 ?auto_626786 ) ) ( not ( = ?auto_626772 ?auto_626787 ) ) ( not ( = ?auto_626773 ?auto_626774 ) ) ( not ( = ?auto_626773 ?auto_626775 ) ) ( not ( = ?auto_626773 ?auto_626776 ) ) ( not ( = ?auto_626773 ?auto_626777 ) ) ( not ( = ?auto_626773 ?auto_626778 ) ) ( not ( = ?auto_626773 ?auto_626779 ) ) ( not ( = ?auto_626773 ?auto_626780 ) ) ( not ( = ?auto_626773 ?auto_626781 ) ) ( not ( = ?auto_626773 ?auto_626782 ) ) ( not ( = ?auto_626773 ?auto_626783 ) ) ( not ( = ?auto_626773 ?auto_626784 ) ) ( not ( = ?auto_626773 ?auto_626785 ) ) ( not ( = ?auto_626773 ?auto_626786 ) ) ( not ( = ?auto_626773 ?auto_626787 ) ) ( not ( = ?auto_626774 ?auto_626775 ) ) ( not ( = ?auto_626774 ?auto_626776 ) ) ( not ( = ?auto_626774 ?auto_626777 ) ) ( not ( = ?auto_626774 ?auto_626778 ) ) ( not ( = ?auto_626774 ?auto_626779 ) ) ( not ( = ?auto_626774 ?auto_626780 ) ) ( not ( = ?auto_626774 ?auto_626781 ) ) ( not ( = ?auto_626774 ?auto_626782 ) ) ( not ( = ?auto_626774 ?auto_626783 ) ) ( not ( = ?auto_626774 ?auto_626784 ) ) ( not ( = ?auto_626774 ?auto_626785 ) ) ( not ( = ?auto_626774 ?auto_626786 ) ) ( not ( = ?auto_626774 ?auto_626787 ) ) ( not ( = ?auto_626775 ?auto_626776 ) ) ( not ( = ?auto_626775 ?auto_626777 ) ) ( not ( = ?auto_626775 ?auto_626778 ) ) ( not ( = ?auto_626775 ?auto_626779 ) ) ( not ( = ?auto_626775 ?auto_626780 ) ) ( not ( = ?auto_626775 ?auto_626781 ) ) ( not ( = ?auto_626775 ?auto_626782 ) ) ( not ( = ?auto_626775 ?auto_626783 ) ) ( not ( = ?auto_626775 ?auto_626784 ) ) ( not ( = ?auto_626775 ?auto_626785 ) ) ( not ( = ?auto_626775 ?auto_626786 ) ) ( not ( = ?auto_626775 ?auto_626787 ) ) ( not ( = ?auto_626776 ?auto_626777 ) ) ( not ( = ?auto_626776 ?auto_626778 ) ) ( not ( = ?auto_626776 ?auto_626779 ) ) ( not ( = ?auto_626776 ?auto_626780 ) ) ( not ( = ?auto_626776 ?auto_626781 ) ) ( not ( = ?auto_626776 ?auto_626782 ) ) ( not ( = ?auto_626776 ?auto_626783 ) ) ( not ( = ?auto_626776 ?auto_626784 ) ) ( not ( = ?auto_626776 ?auto_626785 ) ) ( not ( = ?auto_626776 ?auto_626786 ) ) ( not ( = ?auto_626776 ?auto_626787 ) ) ( not ( = ?auto_626777 ?auto_626778 ) ) ( not ( = ?auto_626777 ?auto_626779 ) ) ( not ( = ?auto_626777 ?auto_626780 ) ) ( not ( = ?auto_626777 ?auto_626781 ) ) ( not ( = ?auto_626777 ?auto_626782 ) ) ( not ( = ?auto_626777 ?auto_626783 ) ) ( not ( = ?auto_626777 ?auto_626784 ) ) ( not ( = ?auto_626777 ?auto_626785 ) ) ( not ( = ?auto_626777 ?auto_626786 ) ) ( not ( = ?auto_626777 ?auto_626787 ) ) ( not ( = ?auto_626778 ?auto_626779 ) ) ( not ( = ?auto_626778 ?auto_626780 ) ) ( not ( = ?auto_626778 ?auto_626781 ) ) ( not ( = ?auto_626778 ?auto_626782 ) ) ( not ( = ?auto_626778 ?auto_626783 ) ) ( not ( = ?auto_626778 ?auto_626784 ) ) ( not ( = ?auto_626778 ?auto_626785 ) ) ( not ( = ?auto_626778 ?auto_626786 ) ) ( not ( = ?auto_626778 ?auto_626787 ) ) ( not ( = ?auto_626779 ?auto_626780 ) ) ( not ( = ?auto_626779 ?auto_626781 ) ) ( not ( = ?auto_626779 ?auto_626782 ) ) ( not ( = ?auto_626779 ?auto_626783 ) ) ( not ( = ?auto_626779 ?auto_626784 ) ) ( not ( = ?auto_626779 ?auto_626785 ) ) ( not ( = ?auto_626779 ?auto_626786 ) ) ( not ( = ?auto_626779 ?auto_626787 ) ) ( not ( = ?auto_626780 ?auto_626781 ) ) ( not ( = ?auto_626780 ?auto_626782 ) ) ( not ( = ?auto_626780 ?auto_626783 ) ) ( not ( = ?auto_626780 ?auto_626784 ) ) ( not ( = ?auto_626780 ?auto_626785 ) ) ( not ( = ?auto_626780 ?auto_626786 ) ) ( not ( = ?auto_626780 ?auto_626787 ) ) ( not ( = ?auto_626781 ?auto_626782 ) ) ( not ( = ?auto_626781 ?auto_626783 ) ) ( not ( = ?auto_626781 ?auto_626784 ) ) ( not ( = ?auto_626781 ?auto_626785 ) ) ( not ( = ?auto_626781 ?auto_626786 ) ) ( not ( = ?auto_626781 ?auto_626787 ) ) ( not ( = ?auto_626782 ?auto_626783 ) ) ( not ( = ?auto_626782 ?auto_626784 ) ) ( not ( = ?auto_626782 ?auto_626785 ) ) ( not ( = ?auto_626782 ?auto_626786 ) ) ( not ( = ?auto_626782 ?auto_626787 ) ) ( not ( = ?auto_626783 ?auto_626784 ) ) ( not ( = ?auto_626783 ?auto_626785 ) ) ( not ( = ?auto_626783 ?auto_626786 ) ) ( not ( = ?auto_626783 ?auto_626787 ) ) ( not ( = ?auto_626784 ?auto_626785 ) ) ( not ( = ?auto_626784 ?auto_626786 ) ) ( not ( = ?auto_626784 ?auto_626787 ) ) ( not ( = ?auto_626785 ?auto_626786 ) ) ( not ( = ?auto_626785 ?auto_626787 ) ) ( not ( = ?auto_626786 ?auto_626787 ) ) ( ON ?auto_626786 ?auto_626787 ) ( ON ?auto_626785 ?auto_626786 ) ( CLEAR ?auto_626783 ) ( ON ?auto_626784 ?auto_626785 ) ( CLEAR ?auto_626784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_626771 ?auto_626772 ?auto_626773 ?auto_626774 ?auto_626775 ?auto_626776 ?auto_626777 ?auto_626778 ?auto_626779 ?auto_626780 ?auto_626781 ?auto_626782 ?auto_626783 ?auto_626784 )
      ( MAKE-17PILE ?auto_626771 ?auto_626772 ?auto_626773 ?auto_626774 ?auto_626775 ?auto_626776 ?auto_626777 ?auto_626778 ?auto_626779 ?auto_626780 ?auto_626781 ?auto_626782 ?auto_626783 ?auto_626784 ?auto_626785 ?auto_626786 ?auto_626787 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626805 - BLOCK
      ?auto_626806 - BLOCK
      ?auto_626807 - BLOCK
      ?auto_626808 - BLOCK
      ?auto_626809 - BLOCK
      ?auto_626810 - BLOCK
      ?auto_626811 - BLOCK
      ?auto_626812 - BLOCK
      ?auto_626813 - BLOCK
      ?auto_626814 - BLOCK
      ?auto_626815 - BLOCK
      ?auto_626816 - BLOCK
      ?auto_626817 - BLOCK
      ?auto_626818 - BLOCK
      ?auto_626819 - BLOCK
      ?auto_626820 - BLOCK
      ?auto_626821 - BLOCK
    )
    :vars
    (
      ?auto_626822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626821 ?auto_626822 ) ( ON-TABLE ?auto_626805 ) ( ON ?auto_626806 ?auto_626805 ) ( ON ?auto_626807 ?auto_626806 ) ( ON ?auto_626808 ?auto_626807 ) ( ON ?auto_626809 ?auto_626808 ) ( ON ?auto_626810 ?auto_626809 ) ( ON ?auto_626811 ?auto_626810 ) ( ON ?auto_626812 ?auto_626811 ) ( ON ?auto_626813 ?auto_626812 ) ( ON ?auto_626814 ?auto_626813 ) ( ON ?auto_626815 ?auto_626814 ) ( ON ?auto_626816 ?auto_626815 ) ( not ( = ?auto_626805 ?auto_626806 ) ) ( not ( = ?auto_626805 ?auto_626807 ) ) ( not ( = ?auto_626805 ?auto_626808 ) ) ( not ( = ?auto_626805 ?auto_626809 ) ) ( not ( = ?auto_626805 ?auto_626810 ) ) ( not ( = ?auto_626805 ?auto_626811 ) ) ( not ( = ?auto_626805 ?auto_626812 ) ) ( not ( = ?auto_626805 ?auto_626813 ) ) ( not ( = ?auto_626805 ?auto_626814 ) ) ( not ( = ?auto_626805 ?auto_626815 ) ) ( not ( = ?auto_626805 ?auto_626816 ) ) ( not ( = ?auto_626805 ?auto_626817 ) ) ( not ( = ?auto_626805 ?auto_626818 ) ) ( not ( = ?auto_626805 ?auto_626819 ) ) ( not ( = ?auto_626805 ?auto_626820 ) ) ( not ( = ?auto_626805 ?auto_626821 ) ) ( not ( = ?auto_626805 ?auto_626822 ) ) ( not ( = ?auto_626806 ?auto_626807 ) ) ( not ( = ?auto_626806 ?auto_626808 ) ) ( not ( = ?auto_626806 ?auto_626809 ) ) ( not ( = ?auto_626806 ?auto_626810 ) ) ( not ( = ?auto_626806 ?auto_626811 ) ) ( not ( = ?auto_626806 ?auto_626812 ) ) ( not ( = ?auto_626806 ?auto_626813 ) ) ( not ( = ?auto_626806 ?auto_626814 ) ) ( not ( = ?auto_626806 ?auto_626815 ) ) ( not ( = ?auto_626806 ?auto_626816 ) ) ( not ( = ?auto_626806 ?auto_626817 ) ) ( not ( = ?auto_626806 ?auto_626818 ) ) ( not ( = ?auto_626806 ?auto_626819 ) ) ( not ( = ?auto_626806 ?auto_626820 ) ) ( not ( = ?auto_626806 ?auto_626821 ) ) ( not ( = ?auto_626806 ?auto_626822 ) ) ( not ( = ?auto_626807 ?auto_626808 ) ) ( not ( = ?auto_626807 ?auto_626809 ) ) ( not ( = ?auto_626807 ?auto_626810 ) ) ( not ( = ?auto_626807 ?auto_626811 ) ) ( not ( = ?auto_626807 ?auto_626812 ) ) ( not ( = ?auto_626807 ?auto_626813 ) ) ( not ( = ?auto_626807 ?auto_626814 ) ) ( not ( = ?auto_626807 ?auto_626815 ) ) ( not ( = ?auto_626807 ?auto_626816 ) ) ( not ( = ?auto_626807 ?auto_626817 ) ) ( not ( = ?auto_626807 ?auto_626818 ) ) ( not ( = ?auto_626807 ?auto_626819 ) ) ( not ( = ?auto_626807 ?auto_626820 ) ) ( not ( = ?auto_626807 ?auto_626821 ) ) ( not ( = ?auto_626807 ?auto_626822 ) ) ( not ( = ?auto_626808 ?auto_626809 ) ) ( not ( = ?auto_626808 ?auto_626810 ) ) ( not ( = ?auto_626808 ?auto_626811 ) ) ( not ( = ?auto_626808 ?auto_626812 ) ) ( not ( = ?auto_626808 ?auto_626813 ) ) ( not ( = ?auto_626808 ?auto_626814 ) ) ( not ( = ?auto_626808 ?auto_626815 ) ) ( not ( = ?auto_626808 ?auto_626816 ) ) ( not ( = ?auto_626808 ?auto_626817 ) ) ( not ( = ?auto_626808 ?auto_626818 ) ) ( not ( = ?auto_626808 ?auto_626819 ) ) ( not ( = ?auto_626808 ?auto_626820 ) ) ( not ( = ?auto_626808 ?auto_626821 ) ) ( not ( = ?auto_626808 ?auto_626822 ) ) ( not ( = ?auto_626809 ?auto_626810 ) ) ( not ( = ?auto_626809 ?auto_626811 ) ) ( not ( = ?auto_626809 ?auto_626812 ) ) ( not ( = ?auto_626809 ?auto_626813 ) ) ( not ( = ?auto_626809 ?auto_626814 ) ) ( not ( = ?auto_626809 ?auto_626815 ) ) ( not ( = ?auto_626809 ?auto_626816 ) ) ( not ( = ?auto_626809 ?auto_626817 ) ) ( not ( = ?auto_626809 ?auto_626818 ) ) ( not ( = ?auto_626809 ?auto_626819 ) ) ( not ( = ?auto_626809 ?auto_626820 ) ) ( not ( = ?auto_626809 ?auto_626821 ) ) ( not ( = ?auto_626809 ?auto_626822 ) ) ( not ( = ?auto_626810 ?auto_626811 ) ) ( not ( = ?auto_626810 ?auto_626812 ) ) ( not ( = ?auto_626810 ?auto_626813 ) ) ( not ( = ?auto_626810 ?auto_626814 ) ) ( not ( = ?auto_626810 ?auto_626815 ) ) ( not ( = ?auto_626810 ?auto_626816 ) ) ( not ( = ?auto_626810 ?auto_626817 ) ) ( not ( = ?auto_626810 ?auto_626818 ) ) ( not ( = ?auto_626810 ?auto_626819 ) ) ( not ( = ?auto_626810 ?auto_626820 ) ) ( not ( = ?auto_626810 ?auto_626821 ) ) ( not ( = ?auto_626810 ?auto_626822 ) ) ( not ( = ?auto_626811 ?auto_626812 ) ) ( not ( = ?auto_626811 ?auto_626813 ) ) ( not ( = ?auto_626811 ?auto_626814 ) ) ( not ( = ?auto_626811 ?auto_626815 ) ) ( not ( = ?auto_626811 ?auto_626816 ) ) ( not ( = ?auto_626811 ?auto_626817 ) ) ( not ( = ?auto_626811 ?auto_626818 ) ) ( not ( = ?auto_626811 ?auto_626819 ) ) ( not ( = ?auto_626811 ?auto_626820 ) ) ( not ( = ?auto_626811 ?auto_626821 ) ) ( not ( = ?auto_626811 ?auto_626822 ) ) ( not ( = ?auto_626812 ?auto_626813 ) ) ( not ( = ?auto_626812 ?auto_626814 ) ) ( not ( = ?auto_626812 ?auto_626815 ) ) ( not ( = ?auto_626812 ?auto_626816 ) ) ( not ( = ?auto_626812 ?auto_626817 ) ) ( not ( = ?auto_626812 ?auto_626818 ) ) ( not ( = ?auto_626812 ?auto_626819 ) ) ( not ( = ?auto_626812 ?auto_626820 ) ) ( not ( = ?auto_626812 ?auto_626821 ) ) ( not ( = ?auto_626812 ?auto_626822 ) ) ( not ( = ?auto_626813 ?auto_626814 ) ) ( not ( = ?auto_626813 ?auto_626815 ) ) ( not ( = ?auto_626813 ?auto_626816 ) ) ( not ( = ?auto_626813 ?auto_626817 ) ) ( not ( = ?auto_626813 ?auto_626818 ) ) ( not ( = ?auto_626813 ?auto_626819 ) ) ( not ( = ?auto_626813 ?auto_626820 ) ) ( not ( = ?auto_626813 ?auto_626821 ) ) ( not ( = ?auto_626813 ?auto_626822 ) ) ( not ( = ?auto_626814 ?auto_626815 ) ) ( not ( = ?auto_626814 ?auto_626816 ) ) ( not ( = ?auto_626814 ?auto_626817 ) ) ( not ( = ?auto_626814 ?auto_626818 ) ) ( not ( = ?auto_626814 ?auto_626819 ) ) ( not ( = ?auto_626814 ?auto_626820 ) ) ( not ( = ?auto_626814 ?auto_626821 ) ) ( not ( = ?auto_626814 ?auto_626822 ) ) ( not ( = ?auto_626815 ?auto_626816 ) ) ( not ( = ?auto_626815 ?auto_626817 ) ) ( not ( = ?auto_626815 ?auto_626818 ) ) ( not ( = ?auto_626815 ?auto_626819 ) ) ( not ( = ?auto_626815 ?auto_626820 ) ) ( not ( = ?auto_626815 ?auto_626821 ) ) ( not ( = ?auto_626815 ?auto_626822 ) ) ( not ( = ?auto_626816 ?auto_626817 ) ) ( not ( = ?auto_626816 ?auto_626818 ) ) ( not ( = ?auto_626816 ?auto_626819 ) ) ( not ( = ?auto_626816 ?auto_626820 ) ) ( not ( = ?auto_626816 ?auto_626821 ) ) ( not ( = ?auto_626816 ?auto_626822 ) ) ( not ( = ?auto_626817 ?auto_626818 ) ) ( not ( = ?auto_626817 ?auto_626819 ) ) ( not ( = ?auto_626817 ?auto_626820 ) ) ( not ( = ?auto_626817 ?auto_626821 ) ) ( not ( = ?auto_626817 ?auto_626822 ) ) ( not ( = ?auto_626818 ?auto_626819 ) ) ( not ( = ?auto_626818 ?auto_626820 ) ) ( not ( = ?auto_626818 ?auto_626821 ) ) ( not ( = ?auto_626818 ?auto_626822 ) ) ( not ( = ?auto_626819 ?auto_626820 ) ) ( not ( = ?auto_626819 ?auto_626821 ) ) ( not ( = ?auto_626819 ?auto_626822 ) ) ( not ( = ?auto_626820 ?auto_626821 ) ) ( not ( = ?auto_626820 ?auto_626822 ) ) ( not ( = ?auto_626821 ?auto_626822 ) ) ( ON ?auto_626820 ?auto_626821 ) ( ON ?auto_626819 ?auto_626820 ) ( ON ?auto_626818 ?auto_626819 ) ( CLEAR ?auto_626816 ) ( ON ?auto_626817 ?auto_626818 ) ( CLEAR ?auto_626817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_626805 ?auto_626806 ?auto_626807 ?auto_626808 ?auto_626809 ?auto_626810 ?auto_626811 ?auto_626812 ?auto_626813 ?auto_626814 ?auto_626815 ?auto_626816 ?auto_626817 )
      ( MAKE-17PILE ?auto_626805 ?auto_626806 ?auto_626807 ?auto_626808 ?auto_626809 ?auto_626810 ?auto_626811 ?auto_626812 ?auto_626813 ?auto_626814 ?auto_626815 ?auto_626816 ?auto_626817 ?auto_626818 ?auto_626819 ?auto_626820 ?auto_626821 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626840 - BLOCK
      ?auto_626841 - BLOCK
      ?auto_626842 - BLOCK
      ?auto_626843 - BLOCK
      ?auto_626844 - BLOCK
      ?auto_626845 - BLOCK
      ?auto_626846 - BLOCK
      ?auto_626847 - BLOCK
      ?auto_626848 - BLOCK
      ?auto_626849 - BLOCK
      ?auto_626850 - BLOCK
      ?auto_626851 - BLOCK
      ?auto_626852 - BLOCK
      ?auto_626853 - BLOCK
      ?auto_626854 - BLOCK
      ?auto_626855 - BLOCK
      ?auto_626856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_626856 ) ( ON-TABLE ?auto_626840 ) ( ON ?auto_626841 ?auto_626840 ) ( ON ?auto_626842 ?auto_626841 ) ( ON ?auto_626843 ?auto_626842 ) ( ON ?auto_626844 ?auto_626843 ) ( ON ?auto_626845 ?auto_626844 ) ( ON ?auto_626846 ?auto_626845 ) ( ON ?auto_626847 ?auto_626846 ) ( ON ?auto_626848 ?auto_626847 ) ( ON ?auto_626849 ?auto_626848 ) ( ON ?auto_626850 ?auto_626849 ) ( ON ?auto_626851 ?auto_626850 ) ( not ( = ?auto_626840 ?auto_626841 ) ) ( not ( = ?auto_626840 ?auto_626842 ) ) ( not ( = ?auto_626840 ?auto_626843 ) ) ( not ( = ?auto_626840 ?auto_626844 ) ) ( not ( = ?auto_626840 ?auto_626845 ) ) ( not ( = ?auto_626840 ?auto_626846 ) ) ( not ( = ?auto_626840 ?auto_626847 ) ) ( not ( = ?auto_626840 ?auto_626848 ) ) ( not ( = ?auto_626840 ?auto_626849 ) ) ( not ( = ?auto_626840 ?auto_626850 ) ) ( not ( = ?auto_626840 ?auto_626851 ) ) ( not ( = ?auto_626840 ?auto_626852 ) ) ( not ( = ?auto_626840 ?auto_626853 ) ) ( not ( = ?auto_626840 ?auto_626854 ) ) ( not ( = ?auto_626840 ?auto_626855 ) ) ( not ( = ?auto_626840 ?auto_626856 ) ) ( not ( = ?auto_626841 ?auto_626842 ) ) ( not ( = ?auto_626841 ?auto_626843 ) ) ( not ( = ?auto_626841 ?auto_626844 ) ) ( not ( = ?auto_626841 ?auto_626845 ) ) ( not ( = ?auto_626841 ?auto_626846 ) ) ( not ( = ?auto_626841 ?auto_626847 ) ) ( not ( = ?auto_626841 ?auto_626848 ) ) ( not ( = ?auto_626841 ?auto_626849 ) ) ( not ( = ?auto_626841 ?auto_626850 ) ) ( not ( = ?auto_626841 ?auto_626851 ) ) ( not ( = ?auto_626841 ?auto_626852 ) ) ( not ( = ?auto_626841 ?auto_626853 ) ) ( not ( = ?auto_626841 ?auto_626854 ) ) ( not ( = ?auto_626841 ?auto_626855 ) ) ( not ( = ?auto_626841 ?auto_626856 ) ) ( not ( = ?auto_626842 ?auto_626843 ) ) ( not ( = ?auto_626842 ?auto_626844 ) ) ( not ( = ?auto_626842 ?auto_626845 ) ) ( not ( = ?auto_626842 ?auto_626846 ) ) ( not ( = ?auto_626842 ?auto_626847 ) ) ( not ( = ?auto_626842 ?auto_626848 ) ) ( not ( = ?auto_626842 ?auto_626849 ) ) ( not ( = ?auto_626842 ?auto_626850 ) ) ( not ( = ?auto_626842 ?auto_626851 ) ) ( not ( = ?auto_626842 ?auto_626852 ) ) ( not ( = ?auto_626842 ?auto_626853 ) ) ( not ( = ?auto_626842 ?auto_626854 ) ) ( not ( = ?auto_626842 ?auto_626855 ) ) ( not ( = ?auto_626842 ?auto_626856 ) ) ( not ( = ?auto_626843 ?auto_626844 ) ) ( not ( = ?auto_626843 ?auto_626845 ) ) ( not ( = ?auto_626843 ?auto_626846 ) ) ( not ( = ?auto_626843 ?auto_626847 ) ) ( not ( = ?auto_626843 ?auto_626848 ) ) ( not ( = ?auto_626843 ?auto_626849 ) ) ( not ( = ?auto_626843 ?auto_626850 ) ) ( not ( = ?auto_626843 ?auto_626851 ) ) ( not ( = ?auto_626843 ?auto_626852 ) ) ( not ( = ?auto_626843 ?auto_626853 ) ) ( not ( = ?auto_626843 ?auto_626854 ) ) ( not ( = ?auto_626843 ?auto_626855 ) ) ( not ( = ?auto_626843 ?auto_626856 ) ) ( not ( = ?auto_626844 ?auto_626845 ) ) ( not ( = ?auto_626844 ?auto_626846 ) ) ( not ( = ?auto_626844 ?auto_626847 ) ) ( not ( = ?auto_626844 ?auto_626848 ) ) ( not ( = ?auto_626844 ?auto_626849 ) ) ( not ( = ?auto_626844 ?auto_626850 ) ) ( not ( = ?auto_626844 ?auto_626851 ) ) ( not ( = ?auto_626844 ?auto_626852 ) ) ( not ( = ?auto_626844 ?auto_626853 ) ) ( not ( = ?auto_626844 ?auto_626854 ) ) ( not ( = ?auto_626844 ?auto_626855 ) ) ( not ( = ?auto_626844 ?auto_626856 ) ) ( not ( = ?auto_626845 ?auto_626846 ) ) ( not ( = ?auto_626845 ?auto_626847 ) ) ( not ( = ?auto_626845 ?auto_626848 ) ) ( not ( = ?auto_626845 ?auto_626849 ) ) ( not ( = ?auto_626845 ?auto_626850 ) ) ( not ( = ?auto_626845 ?auto_626851 ) ) ( not ( = ?auto_626845 ?auto_626852 ) ) ( not ( = ?auto_626845 ?auto_626853 ) ) ( not ( = ?auto_626845 ?auto_626854 ) ) ( not ( = ?auto_626845 ?auto_626855 ) ) ( not ( = ?auto_626845 ?auto_626856 ) ) ( not ( = ?auto_626846 ?auto_626847 ) ) ( not ( = ?auto_626846 ?auto_626848 ) ) ( not ( = ?auto_626846 ?auto_626849 ) ) ( not ( = ?auto_626846 ?auto_626850 ) ) ( not ( = ?auto_626846 ?auto_626851 ) ) ( not ( = ?auto_626846 ?auto_626852 ) ) ( not ( = ?auto_626846 ?auto_626853 ) ) ( not ( = ?auto_626846 ?auto_626854 ) ) ( not ( = ?auto_626846 ?auto_626855 ) ) ( not ( = ?auto_626846 ?auto_626856 ) ) ( not ( = ?auto_626847 ?auto_626848 ) ) ( not ( = ?auto_626847 ?auto_626849 ) ) ( not ( = ?auto_626847 ?auto_626850 ) ) ( not ( = ?auto_626847 ?auto_626851 ) ) ( not ( = ?auto_626847 ?auto_626852 ) ) ( not ( = ?auto_626847 ?auto_626853 ) ) ( not ( = ?auto_626847 ?auto_626854 ) ) ( not ( = ?auto_626847 ?auto_626855 ) ) ( not ( = ?auto_626847 ?auto_626856 ) ) ( not ( = ?auto_626848 ?auto_626849 ) ) ( not ( = ?auto_626848 ?auto_626850 ) ) ( not ( = ?auto_626848 ?auto_626851 ) ) ( not ( = ?auto_626848 ?auto_626852 ) ) ( not ( = ?auto_626848 ?auto_626853 ) ) ( not ( = ?auto_626848 ?auto_626854 ) ) ( not ( = ?auto_626848 ?auto_626855 ) ) ( not ( = ?auto_626848 ?auto_626856 ) ) ( not ( = ?auto_626849 ?auto_626850 ) ) ( not ( = ?auto_626849 ?auto_626851 ) ) ( not ( = ?auto_626849 ?auto_626852 ) ) ( not ( = ?auto_626849 ?auto_626853 ) ) ( not ( = ?auto_626849 ?auto_626854 ) ) ( not ( = ?auto_626849 ?auto_626855 ) ) ( not ( = ?auto_626849 ?auto_626856 ) ) ( not ( = ?auto_626850 ?auto_626851 ) ) ( not ( = ?auto_626850 ?auto_626852 ) ) ( not ( = ?auto_626850 ?auto_626853 ) ) ( not ( = ?auto_626850 ?auto_626854 ) ) ( not ( = ?auto_626850 ?auto_626855 ) ) ( not ( = ?auto_626850 ?auto_626856 ) ) ( not ( = ?auto_626851 ?auto_626852 ) ) ( not ( = ?auto_626851 ?auto_626853 ) ) ( not ( = ?auto_626851 ?auto_626854 ) ) ( not ( = ?auto_626851 ?auto_626855 ) ) ( not ( = ?auto_626851 ?auto_626856 ) ) ( not ( = ?auto_626852 ?auto_626853 ) ) ( not ( = ?auto_626852 ?auto_626854 ) ) ( not ( = ?auto_626852 ?auto_626855 ) ) ( not ( = ?auto_626852 ?auto_626856 ) ) ( not ( = ?auto_626853 ?auto_626854 ) ) ( not ( = ?auto_626853 ?auto_626855 ) ) ( not ( = ?auto_626853 ?auto_626856 ) ) ( not ( = ?auto_626854 ?auto_626855 ) ) ( not ( = ?auto_626854 ?auto_626856 ) ) ( not ( = ?auto_626855 ?auto_626856 ) ) ( ON ?auto_626855 ?auto_626856 ) ( ON ?auto_626854 ?auto_626855 ) ( ON ?auto_626853 ?auto_626854 ) ( CLEAR ?auto_626851 ) ( ON ?auto_626852 ?auto_626853 ) ( CLEAR ?auto_626852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_626840 ?auto_626841 ?auto_626842 ?auto_626843 ?auto_626844 ?auto_626845 ?auto_626846 ?auto_626847 ?auto_626848 ?auto_626849 ?auto_626850 ?auto_626851 ?auto_626852 )
      ( MAKE-17PILE ?auto_626840 ?auto_626841 ?auto_626842 ?auto_626843 ?auto_626844 ?auto_626845 ?auto_626846 ?auto_626847 ?auto_626848 ?auto_626849 ?auto_626850 ?auto_626851 ?auto_626852 ?auto_626853 ?auto_626854 ?auto_626855 ?auto_626856 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626874 - BLOCK
      ?auto_626875 - BLOCK
      ?auto_626876 - BLOCK
      ?auto_626877 - BLOCK
      ?auto_626878 - BLOCK
      ?auto_626879 - BLOCK
      ?auto_626880 - BLOCK
      ?auto_626881 - BLOCK
      ?auto_626882 - BLOCK
      ?auto_626883 - BLOCK
      ?auto_626884 - BLOCK
      ?auto_626885 - BLOCK
      ?auto_626886 - BLOCK
      ?auto_626887 - BLOCK
      ?auto_626888 - BLOCK
      ?auto_626889 - BLOCK
      ?auto_626890 - BLOCK
    )
    :vars
    (
      ?auto_626891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626890 ?auto_626891 ) ( ON-TABLE ?auto_626874 ) ( ON ?auto_626875 ?auto_626874 ) ( ON ?auto_626876 ?auto_626875 ) ( ON ?auto_626877 ?auto_626876 ) ( ON ?auto_626878 ?auto_626877 ) ( ON ?auto_626879 ?auto_626878 ) ( ON ?auto_626880 ?auto_626879 ) ( ON ?auto_626881 ?auto_626880 ) ( ON ?auto_626882 ?auto_626881 ) ( ON ?auto_626883 ?auto_626882 ) ( ON ?auto_626884 ?auto_626883 ) ( not ( = ?auto_626874 ?auto_626875 ) ) ( not ( = ?auto_626874 ?auto_626876 ) ) ( not ( = ?auto_626874 ?auto_626877 ) ) ( not ( = ?auto_626874 ?auto_626878 ) ) ( not ( = ?auto_626874 ?auto_626879 ) ) ( not ( = ?auto_626874 ?auto_626880 ) ) ( not ( = ?auto_626874 ?auto_626881 ) ) ( not ( = ?auto_626874 ?auto_626882 ) ) ( not ( = ?auto_626874 ?auto_626883 ) ) ( not ( = ?auto_626874 ?auto_626884 ) ) ( not ( = ?auto_626874 ?auto_626885 ) ) ( not ( = ?auto_626874 ?auto_626886 ) ) ( not ( = ?auto_626874 ?auto_626887 ) ) ( not ( = ?auto_626874 ?auto_626888 ) ) ( not ( = ?auto_626874 ?auto_626889 ) ) ( not ( = ?auto_626874 ?auto_626890 ) ) ( not ( = ?auto_626874 ?auto_626891 ) ) ( not ( = ?auto_626875 ?auto_626876 ) ) ( not ( = ?auto_626875 ?auto_626877 ) ) ( not ( = ?auto_626875 ?auto_626878 ) ) ( not ( = ?auto_626875 ?auto_626879 ) ) ( not ( = ?auto_626875 ?auto_626880 ) ) ( not ( = ?auto_626875 ?auto_626881 ) ) ( not ( = ?auto_626875 ?auto_626882 ) ) ( not ( = ?auto_626875 ?auto_626883 ) ) ( not ( = ?auto_626875 ?auto_626884 ) ) ( not ( = ?auto_626875 ?auto_626885 ) ) ( not ( = ?auto_626875 ?auto_626886 ) ) ( not ( = ?auto_626875 ?auto_626887 ) ) ( not ( = ?auto_626875 ?auto_626888 ) ) ( not ( = ?auto_626875 ?auto_626889 ) ) ( not ( = ?auto_626875 ?auto_626890 ) ) ( not ( = ?auto_626875 ?auto_626891 ) ) ( not ( = ?auto_626876 ?auto_626877 ) ) ( not ( = ?auto_626876 ?auto_626878 ) ) ( not ( = ?auto_626876 ?auto_626879 ) ) ( not ( = ?auto_626876 ?auto_626880 ) ) ( not ( = ?auto_626876 ?auto_626881 ) ) ( not ( = ?auto_626876 ?auto_626882 ) ) ( not ( = ?auto_626876 ?auto_626883 ) ) ( not ( = ?auto_626876 ?auto_626884 ) ) ( not ( = ?auto_626876 ?auto_626885 ) ) ( not ( = ?auto_626876 ?auto_626886 ) ) ( not ( = ?auto_626876 ?auto_626887 ) ) ( not ( = ?auto_626876 ?auto_626888 ) ) ( not ( = ?auto_626876 ?auto_626889 ) ) ( not ( = ?auto_626876 ?auto_626890 ) ) ( not ( = ?auto_626876 ?auto_626891 ) ) ( not ( = ?auto_626877 ?auto_626878 ) ) ( not ( = ?auto_626877 ?auto_626879 ) ) ( not ( = ?auto_626877 ?auto_626880 ) ) ( not ( = ?auto_626877 ?auto_626881 ) ) ( not ( = ?auto_626877 ?auto_626882 ) ) ( not ( = ?auto_626877 ?auto_626883 ) ) ( not ( = ?auto_626877 ?auto_626884 ) ) ( not ( = ?auto_626877 ?auto_626885 ) ) ( not ( = ?auto_626877 ?auto_626886 ) ) ( not ( = ?auto_626877 ?auto_626887 ) ) ( not ( = ?auto_626877 ?auto_626888 ) ) ( not ( = ?auto_626877 ?auto_626889 ) ) ( not ( = ?auto_626877 ?auto_626890 ) ) ( not ( = ?auto_626877 ?auto_626891 ) ) ( not ( = ?auto_626878 ?auto_626879 ) ) ( not ( = ?auto_626878 ?auto_626880 ) ) ( not ( = ?auto_626878 ?auto_626881 ) ) ( not ( = ?auto_626878 ?auto_626882 ) ) ( not ( = ?auto_626878 ?auto_626883 ) ) ( not ( = ?auto_626878 ?auto_626884 ) ) ( not ( = ?auto_626878 ?auto_626885 ) ) ( not ( = ?auto_626878 ?auto_626886 ) ) ( not ( = ?auto_626878 ?auto_626887 ) ) ( not ( = ?auto_626878 ?auto_626888 ) ) ( not ( = ?auto_626878 ?auto_626889 ) ) ( not ( = ?auto_626878 ?auto_626890 ) ) ( not ( = ?auto_626878 ?auto_626891 ) ) ( not ( = ?auto_626879 ?auto_626880 ) ) ( not ( = ?auto_626879 ?auto_626881 ) ) ( not ( = ?auto_626879 ?auto_626882 ) ) ( not ( = ?auto_626879 ?auto_626883 ) ) ( not ( = ?auto_626879 ?auto_626884 ) ) ( not ( = ?auto_626879 ?auto_626885 ) ) ( not ( = ?auto_626879 ?auto_626886 ) ) ( not ( = ?auto_626879 ?auto_626887 ) ) ( not ( = ?auto_626879 ?auto_626888 ) ) ( not ( = ?auto_626879 ?auto_626889 ) ) ( not ( = ?auto_626879 ?auto_626890 ) ) ( not ( = ?auto_626879 ?auto_626891 ) ) ( not ( = ?auto_626880 ?auto_626881 ) ) ( not ( = ?auto_626880 ?auto_626882 ) ) ( not ( = ?auto_626880 ?auto_626883 ) ) ( not ( = ?auto_626880 ?auto_626884 ) ) ( not ( = ?auto_626880 ?auto_626885 ) ) ( not ( = ?auto_626880 ?auto_626886 ) ) ( not ( = ?auto_626880 ?auto_626887 ) ) ( not ( = ?auto_626880 ?auto_626888 ) ) ( not ( = ?auto_626880 ?auto_626889 ) ) ( not ( = ?auto_626880 ?auto_626890 ) ) ( not ( = ?auto_626880 ?auto_626891 ) ) ( not ( = ?auto_626881 ?auto_626882 ) ) ( not ( = ?auto_626881 ?auto_626883 ) ) ( not ( = ?auto_626881 ?auto_626884 ) ) ( not ( = ?auto_626881 ?auto_626885 ) ) ( not ( = ?auto_626881 ?auto_626886 ) ) ( not ( = ?auto_626881 ?auto_626887 ) ) ( not ( = ?auto_626881 ?auto_626888 ) ) ( not ( = ?auto_626881 ?auto_626889 ) ) ( not ( = ?auto_626881 ?auto_626890 ) ) ( not ( = ?auto_626881 ?auto_626891 ) ) ( not ( = ?auto_626882 ?auto_626883 ) ) ( not ( = ?auto_626882 ?auto_626884 ) ) ( not ( = ?auto_626882 ?auto_626885 ) ) ( not ( = ?auto_626882 ?auto_626886 ) ) ( not ( = ?auto_626882 ?auto_626887 ) ) ( not ( = ?auto_626882 ?auto_626888 ) ) ( not ( = ?auto_626882 ?auto_626889 ) ) ( not ( = ?auto_626882 ?auto_626890 ) ) ( not ( = ?auto_626882 ?auto_626891 ) ) ( not ( = ?auto_626883 ?auto_626884 ) ) ( not ( = ?auto_626883 ?auto_626885 ) ) ( not ( = ?auto_626883 ?auto_626886 ) ) ( not ( = ?auto_626883 ?auto_626887 ) ) ( not ( = ?auto_626883 ?auto_626888 ) ) ( not ( = ?auto_626883 ?auto_626889 ) ) ( not ( = ?auto_626883 ?auto_626890 ) ) ( not ( = ?auto_626883 ?auto_626891 ) ) ( not ( = ?auto_626884 ?auto_626885 ) ) ( not ( = ?auto_626884 ?auto_626886 ) ) ( not ( = ?auto_626884 ?auto_626887 ) ) ( not ( = ?auto_626884 ?auto_626888 ) ) ( not ( = ?auto_626884 ?auto_626889 ) ) ( not ( = ?auto_626884 ?auto_626890 ) ) ( not ( = ?auto_626884 ?auto_626891 ) ) ( not ( = ?auto_626885 ?auto_626886 ) ) ( not ( = ?auto_626885 ?auto_626887 ) ) ( not ( = ?auto_626885 ?auto_626888 ) ) ( not ( = ?auto_626885 ?auto_626889 ) ) ( not ( = ?auto_626885 ?auto_626890 ) ) ( not ( = ?auto_626885 ?auto_626891 ) ) ( not ( = ?auto_626886 ?auto_626887 ) ) ( not ( = ?auto_626886 ?auto_626888 ) ) ( not ( = ?auto_626886 ?auto_626889 ) ) ( not ( = ?auto_626886 ?auto_626890 ) ) ( not ( = ?auto_626886 ?auto_626891 ) ) ( not ( = ?auto_626887 ?auto_626888 ) ) ( not ( = ?auto_626887 ?auto_626889 ) ) ( not ( = ?auto_626887 ?auto_626890 ) ) ( not ( = ?auto_626887 ?auto_626891 ) ) ( not ( = ?auto_626888 ?auto_626889 ) ) ( not ( = ?auto_626888 ?auto_626890 ) ) ( not ( = ?auto_626888 ?auto_626891 ) ) ( not ( = ?auto_626889 ?auto_626890 ) ) ( not ( = ?auto_626889 ?auto_626891 ) ) ( not ( = ?auto_626890 ?auto_626891 ) ) ( ON ?auto_626889 ?auto_626890 ) ( ON ?auto_626888 ?auto_626889 ) ( ON ?auto_626887 ?auto_626888 ) ( ON ?auto_626886 ?auto_626887 ) ( CLEAR ?auto_626884 ) ( ON ?auto_626885 ?auto_626886 ) ( CLEAR ?auto_626885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_626874 ?auto_626875 ?auto_626876 ?auto_626877 ?auto_626878 ?auto_626879 ?auto_626880 ?auto_626881 ?auto_626882 ?auto_626883 ?auto_626884 ?auto_626885 )
      ( MAKE-17PILE ?auto_626874 ?auto_626875 ?auto_626876 ?auto_626877 ?auto_626878 ?auto_626879 ?auto_626880 ?auto_626881 ?auto_626882 ?auto_626883 ?auto_626884 ?auto_626885 ?auto_626886 ?auto_626887 ?auto_626888 ?auto_626889 ?auto_626890 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626909 - BLOCK
      ?auto_626910 - BLOCK
      ?auto_626911 - BLOCK
      ?auto_626912 - BLOCK
      ?auto_626913 - BLOCK
      ?auto_626914 - BLOCK
      ?auto_626915 - BLOCK
      ?auto_626916 - BLOCK
      ?auto_626917 - BLOCK
      ?auto_626918 - BLOCK
      ?auto_626919 - BLOCK
      ?auto_626920 - BLOCK
      ?auto_626921 - BLOCK
      ?auto_626922 - BLOCK
      ?auto_626923 - BLOCK
      ?auto_626924 - BLOCK
      ?auto_626925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_626925 ) ( ON-TABLE ?auto_626909 ) ( ON ?auto_626910 ?auto_626909 ) ( ON ?auto_626911 ?auto_626910 ) ( ON ?auto_626912 ?auto_626911 ) ( ON ?auto_626913 ?auto_626912 ) ( ON ?auto_626914 ?auto_626913 ) ( ON ?auto_626915 ?auto_626914 ) ( ON ?auto_626916 ?auto_626915 ) ( ON ?auto_626917 ?auto_626916 ) ( ON ?auto_626918 ?auto_626917 ) ( ON ?auto_626919 ?auto_626918 ) ( not ( = ?auto_626909 ?auto_626910 ) ) ( not ( = ?auto_626909 ?auto_626911 ) ) ( not ( = ?auto_626909 ?auto_626912 ) ) ( not ( = ?auto_626909 ?auto_626913 ) ) ( not ( = ?auto_626909 ?auto_626914 ) ) ( not ( = ?auto_626909 ?auto_626915 ) ) ( not ( = ?auto_626909 ?auto_626916 ) ) ( not ( = ?auto_626909 ?auto_626917 ) ) ( not ( = ?auto_626909 ?auto_626918 ) ) ( not ( = ?auto_626909 ?auto_626919 ) ) ( not ( = ?auto_626909 ?auto_626920 ) ) ( not ( = ?auto_626909 ?auto_626921 ) ) ( not ( = ?auto_626909 ?auto_626922 ) ) ( not ( = ?auto_626909 ?auto_626923 ) ) ( not ( = ?auto_626909 ?auto_626924 ) ) ( not ( = ?auto_626909 ?auto_626925 ) ) ( not ( = ?auto_626910 ?auto_626911 ) ) ( not ( = ?auto_626910 ?auto_626912 ) ) ( not ( = ?auto_626910 ?auto_626913 ) ) ( not ( = ?auto_626910 ?auto_626914 ) ) ( not ( = ?auto_626910 ?auto_626915 ) ) ( not ( = ?auto_626910 ?auto_626916 ) ) ( not ( = ?auto_626910 ?auto_626917 ) ) ( not ( = ?auto_626910 ?auto_626918 ) ) ( not ( = ?auto_626910 ?auto_626919 ) ) ( not ( = ?auto_626910 ?auto_626920 ) ) ( not ( = ?auto_626910 ?auto_626921 ) ) ( not ( = ?auto_626910 ?auto_626922 ) ) ( not ( = ?auto_626910 ?auto_626923 ) ) ( not ( = ?auto_626910 ?auto_626924 ) ) ( not ( = ?auto_626910 ?auto_626925 ) ) ( not ( = ?auto_626911 ?auto_626912 ) ) ( not ( = ?auto_626911 ?auto_626913 ) ) ( not ( = ?auto_626911 ?auto_626914 ) ) ( not ( = ?auto_626911 ?auto_626915 ) ) ( not ( = ?auto_626911 ?auto_626916 ) ) ( not ( = ?auto_626911 ?auto_626917 ) ) ( not ( = ?auto_626911 ?auto_626918 ) ) ( not ( = ?auto_626911 ?auto_626919 ) ) ( not ( = ?auto_626911 ?auto_626920 ) ) ( not ( = ?auto_626911 ?auto_626921 ) ) ( not ( = ?auto_626911 ?auto_626922 ) ) ( not ( = ?auto_626911 ?auto_626923 ) ) ( not ( = ?auto_626911 ?auto_626924 ) ) ( not ( = ?auto_626911 ?auto_626925 ) ) ( not ( = ?auto_626912 ?auto_626913 ) ) ( not ( = ?auto_626912 ?auto_626914 ) ) ( not ( = ?auto_626912 ?auto_626915 ) ) ( not ( = ?auto_626912 ?auto_626916 ) ) ( not ( = ?auto_626912 ?auto_626917 ) ) ( not ( = ?auto_626912 ?auto_626918 ) ) ( not ( = ?auto_626912 ?auto_626919 ) ) ( not ( = ?auto_626912 ?auto_626920 ) ) ( not ( = ?auto_626912 ?auto_626921 ) ) ( not ( = ?auto_626912 ?auto_626922 ) ) ( not ( = ?auto_626912 ?auto_626923 ) ) ( not ( = ?auto_626912 ?auto_626924 ) ) ( not ( = ?auto_626912 ?auto_626925 ) ) ( not ( = ?auto_626913 ?auto_626914 ) ) ( not ( = ?auto_626913 ?auto_626915 ) ) ( not ( = ?auto_626913 ?auto_626916 ) ) ( not ( = ?auto_626913 ?auto_626917 ) ) ( not ( = ?auto_626913 ?auto_626918 ) ) ( not ( = ?auto_626913 ?auto_626919 ) ) ( not ( = ?auto_626913 ?auto_626920 ) ) ( not ( = ?auto_626913 ?auto_626921 ) ) ( not ( = ?auto_626913 ?auto_626922 ) ) ( not ( = ?auto_626913 ?auto_626923 ) ) ( not ( = ?auto_626913 ?auto_626924 ) ) ( not ( = ?auto_626913 ?auto_626925 ) ) ( not ( = ?auto_626914 ?auto_626915 ) ) ( not ( = ?auto_626914 ?auto_626916 ) ) ( not ( = ?auto_626914 ?auto_626917 ) ) ( not ( = ?auto_626914 ?auto_626918 ) ) ( not ( = ?auto_626914 ?auto_626919 ) ) ( not ( = ?auto_626914 ?auto_626920 ) ) ( not ( = ?auto_626914 ?auto_626921 ) ) ( not ( = ?auto_626914 ?auto_626922 ) ) ( not ( = ?auto_626914 ?auto_626923 ) ) ( not ( = ?auto_626914 ?auto_626924 ) ) ( not ( = ?auto_626914 ?auto_626925 ) ) ( not ( = ?auto_626915 ?auto_626916 ) ) ( not ( = ?auto_626915 ?auto_626917 ) ) ( not ( = ?auto_626915 ?auto_626918 ) ) ( not ( = ?auto_626915 ?auto_626919 ) ) ( not ( = ?auto_626915 ?auto_626920 ) ) ( not ( = ?auto_626915 ?auto_626921 ) ) ( not ( = ?auto_626915 ?auto_626922 ) ) ( not ( = ?auto_626915 ?auto_626923 ) ) ( not ( = ?auto_626915 ?auto_626924 ) ) ( not ( = ?auto_626915 ?auto_626925 ) ) ( not ( = ?auto_626916 ?auto_626917 ) ) ( not ( = ?auto_626916 ?auto_626918 ) ) ( not ( = ?auto_626916 ?auto_626919 ) ) ( not ( = ?auto_626916 ?auto_626920 ) ) ( not ( = ?auto_626916 ?auto_626921 ) ) ( not ( = ?auto_626916 ?auto_626922 ) ) ( not ( = ?auto_626916 ?auto_626923 ) ) ( not ( = ?auto_626916 ?auto_626924 ) ) ( not ( = ?auto_626916 ?auto_626925 ) ) ( not ( = ?auto_626917 ?auto_626918 ) ) ( not ( = ?auto_626917 ?auto_626919 ) ) ( not ( = ?auto_626917 ?auto_626920 ) ) ( not ( = ?auto_626917 ?auto_626921 ) ) ( not ( = ?auto_626917 ?auto_626922 ) ) ( not ( = ?auto_626917 ?auto_626923 ) ) ( not ( = ?auto_626917 ?auto_626924 ) ) ( not ( = ?auto_626917 ?auto_626925 ) ) ( not ( = ?auto_626918 ?auto_626919 ) ) ( not ( = ?auto_626918 ?auto_626920 ) ) ( not ( = ?auto_626918 ?auto_626921 ) ) ( not ( = ?auto_626918 ?auto_626922 ) ) ( not ( = ?auto_626918 ?auto_626923 ) ) ( not ( = ?auto_626918 ?auto_626924 ) ) ( not ( = ?auto_626918 ?auto_626925 ) ) ( not ( = ?auto_626919 ?auto_626920 ) ) ( not ( = ?auto_626919 ?auto_626921 ) ) ( not ( = ?auto_626919 ?auto_626922 ) ) ( not ( = ?auto_626919 ?auto_626923 ) ) ( not ( = ?auto_626919 ?auto_626924 ) ) ( not ( = ?auto_626919 ?auto_626925 ) ) ( not ( = ?auto_626920 ?auto_626921 ) ) ( not ( = ?auto_626920 ?auto_626922 ) ) ( not ( = ?auto_626920 ?auto_626923 ) ) ( not ( = ?auto_626920 ?auto_626924 ) ) ( not ( = ?auto_626920 ?auto_626925 ) ) ( not ( = ?auto_626921 ?auto_626922 ) ) ( not ( = ?auto_626921 ?auto_626923 ) ) ( not ( = ?auto_626921 ?auto_626924 ) ) ( not ( = ?auto_626921 ?auto_626925 ) ) ( not ( = ?auto_626922 ?auto_626923 ) ) ( not ( = ?auto_626922 ?auto_626924 ) ) ( not ( = ?auto_626922 ?auto_626925 ) ) ( not ( = ?auto_626923 ?auto_626924 ) ) ( not ( = ?auto_626923 ?auto_626925 ) ) ( not ( = ?auto_626924 ?auto_626925 ) ) ( ON ?auto_626924 ?auto_626925 ) ( ON ?auto_626923 ?auto_626924 ) ( ON ?auto_626922 ?auto_626923 ) ( ON ?auto_626921 ?auto_626922 ) ( CLEAR ?auto_626919 ) ( ON ?auto_626920 ?auto_626921 ) ( CLEAR ?auto_626920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_626909 ?auto_626910 ?auto_626911 ?auto_626912 ?auto_626913 ?auto_626914 ?auto_626915 ?auto_626916 ?auto_626917 ?auto_626918 ?auto_626919 ?auto_626920 )
      ( MAKE-17PILE ?auto_626909 ?auto_626910 ?auto_626911 ?auto_626912 ?auto_626913 ?auto_626914 ?auto_626915 ?auto_626916 ?auto_626917 ?auto_626918 ?auto_626919 ?auto_626920 ?auto_626921 ?auto_626922 ?auto_626923 ?auto_626924 ?auto_626925 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626943 - BLOCK
      ?auto_626944 - BLOCK
      ?auto_626945 - BLOCK
      ?auto_626946 - BLOCK
      ?auto_626947 - BLOCK
      ?auto_626948 - BLOCK
      ?auto_626949 - BLOCK
      ?auto_626950 - BLOCK
      ?auto_626951 - BLOCK
      ?auto_626952 - BLOCK
      ?auto_626953 - BLOCK
      ?auto_626954 - BLOCK
      ?auto_626955 - BLOCK
      ?auto_626956 - BLOCK
      ?auto_626957 - BLOCK
      ?auto_626958 - BLOCK
      ?auto_626959 - BLOCK
    )
    :vars
    (
      ?auto_626960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_626959 ?auto_626960 ) ( ON-TABLE ?auto_626943 ) ( ON ?auto_626944 ?auto_626943 ) ( ON ?auto_626945 ?auto_626944 ) ( ON ?auto_626946 ?auto_626945 ) ( ON ?auto_626947 ?auto_626946 ) ( ON ?auto_626948 ?auto_626947 ) ( ON ?auto_626949 ?auto_626948 ) ( ON ?auto_626950 ?auto_626949 ) ( ON ?auto_626951 ?auto_626950 ) ( ON ?auto_626952 ?auto_626951 ) ( not ( = ?auto_626943 ?auto_626944 ) ) ( not ( = ?auto_626943 ?auto_626945 ) ) ( not ( = ?auto_626943 ?auto_626946 ) ) ( not ( = ?auto_626943 ?auto_626947 ) ) ( not ( = ?auto_626943 ?auto_626948 ) ) ( not ( = ?auto_626943 ?auto_626949 ) ) ( not ( = ?auto_626943 ?auto_626950 ) ) ( not ( = ?auto_626943 ?auto_626951 ) ) ( not ( = ?auto_626943 ?auto_626952 ) ) ( not ( = ?auto_626943 ?auto_626953 ) ) ( not ( = ?auto_626943 ?auto_626954 ) ) ( not ( = ?auto_626943 ?auto_626955 ) ) ( not ( = ?auto_626943 ?auto_626956 ) ) ( not ( = ?auto_626943 ?auto_626957 ) ) ( not ( = ?auto_626943 ?auto_626958 ) ) ( not ( = ?auto_626943 ?auto_626959 ) ) ( not ( = ?auto_626943 ?auto_626960 ) ) ( not ( = ?auto_626944 ?auto_626945 ) ) ( not ( = ?auto_626944 ?auto_626946 ) ) ( not ( = ?auto_626944 ?auto_626947 ) ) ( not ( = ?auto_626944 ?auto_626948 ) ) ( not ( = ?auto_626944 ?auto_626949 ) ) ( not ( = ?auto_626944 ?auto_626950 ) ) ( not ( = ?auto_626944 ?auto_626951 ) ) ( not ( = ?auto_626944 ?auto_626952 ) ) ( not ( = ?auto_626944 ?auto_626953 ) ) ( not ( = ?auto_626944 ?auto_626954 ) ) ( not ( = ?auto_626944 ?auto_626955 ) ) ( not ( = ?auto_626944 ?auto_626956 ) ) ( not ( = ?auto_626944 ?auto_626957 ) ) ( not ( = ?auto_626944 ?auto_626958 ) ) ( not ( = ?auto_626944 ?auto_626959 ) ) ( not ( = ?auto_626944 ?auto_626960 ) ) ( not ( = ?auto_626945 ?auto_626946 ) ) ( not ( = ?auto_626945 ?auto_626947 ) ) ( not ( = ?auto_626945 ?auto_626948 ) ) ( not ( = ?auto_626945 ?auto_626949 ) ) ( not ( = ?auto_626945 ?auto_626950 ) ) ( not ( = ?auto_626945 ?auto_626951 ) ) ( not ( = ?auto_626945 ?auto_626952 ) ) ( not ( = ?auto_626945 ?auto_626953 ) ) ( not ( = ?auto_626945 ?auto_626954 ) ) ( not ( = ?auto_626945 ?auto_626955 ) ) ( not ( = ?auto_626945 ?auto_626956 ) ) ( not ( = ?auto_626945 ?auto_626957 ) ) ( not ( = ?auto_626945 ?auto_626958 ) ) ( not ( = ?auto_626945 ?auto_626959 ) ) ( not ( = ?auto_626945 ?auto_626960 ) ) ( not ( = ?auto_626946 ?auto_626947 ) ) ( not ( = ?auto_626946 ?auto_626948 ) ) ( not ( = ?auto_626946 ?auto_626949 ) ) ( not ( = ?auto_626946 ?auto_626950 ) ) ( not ( = ?auto_626946 ?auto_626951 ) ) ( not ( = ?auto_626946 ?auto_626952 ) ) ( not ( = ?auto_626946 ?auto_626953 ) ) ( not ( = ?auto_626946 ?auto_626954 ) ) ( not ( = ?auto_626946 ?auto_626955 ) ) ( not ( = ?auto_626946 ?auto_626956 ) ) ( not ( = ?auto_626946 ?auto_626957 ) ) ( not ( = ?auto_626946 ?auto_626958 ) ) ( not ( = ?auto_626946 ?auto_626959 ) ) ( not ( = ?auto_626946 ?auto_626960 ) ) ( not ( = ?auto_626947 ?auto_626948 ) ) ( not ( = ?auto_626947 ?auto_626949 ) ) ( not ( = ?auto_626947 ?auto_626950 ) ) ( not ( = ?auto_626947 ?auto_626951 ) ) ( not ( = ?auto_626947 ?auto_626952 ) ) ( not ( = ?auto_626947 ?auto_626953 ) ) ( not ( = ?auto_626947 ?auto_626954 ) ) ( not ( = ?auto_626947 ?auto_626955 ) ) ( not ( = ?auto_626947 ?auto_626956 ) ) ( not ( = ?auto_626947 ?auto_626957 ) ) ( not ( = ?auto_626947 ?auto_626958 ) ) ( not ( = ?auto_626947 ?auto_626959 ) ) ( not ( = ?auto_626947 ?auto_626960 ) ) ( not ( = ?auto_626948 ?auto_626949 ) ) ( not ( = ?auto_626948 ?auto_626950 ) ) ( not ( = ?auto_626948 ?auto_626951 ) ) ( not ( = ?auto_626948 ?auto_626952 ) ) ( not ( = ?auto_626948 ?auto_626953 ) ) ( not ( = ?auto_626948 ?auto_626954 ) ) ( not ( = ?auto_626948 ?auto_626955 ) ) ( not ( = ?auto_626948 ?auto_626956 ) ) ( not ( = ?auto_626948 ?auto_626957 ) ) ( not ( = ?auto_626948 ?auto_626958 ) ) ( not ( = ?auto_626948 ?auto_626959 ) ) ( not ( = ?auto_626948 ?auto_626960 ) ) ( not ( = ?auto_626949 ?auto_626950 ) ) ( not ( = ?auto_626949 ?auto_626951 ) ) ( not ( = ?auto_626949 ?auto_626952 ) ) ( not ( = ?auto_626949 ?auto_626953 ) ) ( not ( = ?auto_626949 ?auto_626954 ) ) ( not ( = ?auto_626949 ?auto_626955 ) ) ( not ( = ?auto_626949 ?auto_626956 ) ) ( not ( = ?auto_626949 ?auto_626957 ) ) ( not ( = ?auto_626949 ?auto_626958 ) ) ( not ( = ?auto_626949 ?auto_626959 ) ) ( not ( = ?auto_626949 ?auto_626960 ) ) ( not ( = ?auto_626950 ?auto_626951 ) ) ( not ( = ?auto_626950 ?auto_626952 ) ) ( not ( = ?auto_626950 ?auto_626953 ) ) ( not ( = ?auto_626950 ?auto_626954 ) ) ( not ( = ?auto_626950 ?auto_626955 ) ) ( not ( = ?auto_626950 ?auto_626956 ) ) ( not ( = ?auto_626950 ?auto_626957 ) ) ( not ( = ?auto_626950 ?auto_626958 ) ) ( not ( = ?auto_626950 ?auto_626959 ) ) ( not ( = ?auto_626950 ?auto_626960 ) ) ( not ( = ?auto_626951 ?auto_626952 ) ) ( not ( = ?auto_626951 ?auto_626953 ) ) ( not ( = ?auto_626951 ?auto_626954 ) ) ( not ( = ?auto_626951 ?auto_626955 ) ) ( not ( = ?auto_626951 ?auto_626956 ) ) ( not ( = ?auto_626951 ?auto_626957 ) ) ( not ( = ?auto_626951 ?auto_626958 ) ) ( not ( = ?auto_626951 ?auto_626959 ) ) ( not ( = ?auto_626951 ?auto_626960 ) ) ( not ( = ?auto_626952 ?auto_626953 ) ) ( not ( = ?auto_626952 ?auto_626954 ) ) ( not ( = ?auto_626952 ?auto_626955 ) ) ( not ( = ?auto_626952 ?auto_626956 ) ) ( not ( = ?auto_626952 ?auto_626957 ) ) ( not ( = ?auto_626952 ?auto_626958 ) ) ( not ( = ?auto_626952 ?auto_626959 ) ) ( not ( = ?auto_626952 ?auto_626960 ) ) ( not ( = ?auto_626953 ?auto_626954 ) ) ( not ( = ?auto_626953 ?auto_626955 ) ) ( not ( = ?auto_626953 ?auto_626956 ) ) ( not ( = ?auto_626953 ?auto_626957 ) ) ( not ( = ?auto_626953 ?auto_626958 ) ) ( not ( = ?auto_626953 ?auto_626959 ) ) ( not ( = ?auto_626953 ?auto_626960 ) ) ( not ( = ?auto_626954 ?auto_626955 ) ) ( not ( = ?auto_626954 ?auto_626956 ) ) ( not ( = ?auto_626954 ?auto_626957 ) ) ( not ( = ?auto_626954 ?auto_626958 ) ) ( not ( = ?auto_626954 ?auto_626959 ) ) ( not ( = ?auto_626954 ?auto_626960 ) ) ( not ( = ?auto_626955 ?auto_626956 ) ) ( not ( = ?auto_626955 ?auto_626957 ) ) ( not ( = ?auto_626955 ?auto_626958 ) ) ( not ( = ?auto_626955 ?auto_626959 ) ) ( not ( = ?auto_626955 ?auto_626960 ) ) ( not ( = ?auto_626956 ?auto_626957 ) ) ( not ( = ?auto_626956 ?auto_626958 ) ) ( not ( = ?auto_626956 ?auto_626959 ) ) ( not ( = ?auto_626956 ?auto_626960 ) ) ( not ( = ?auto_626957 ?auto_626958 ) ) ( not ( = ?auto_626957 ?auto_626959 ) ) ( not ( = ?auto_626957 ?auto_626960 ) ) ( not ( = ?auto_626958 ?auto_626959 ) ) ( not ( = ?auto_626958 ?auto_626960 ) ) ( not ( = ?auto_626959 ?auto_626960 ) ) ( ON ?auto_626958 ?auto_626959 ) ( ON ?auto_626957 ?auto_626958 ) ( ON ?auto_626956 ?auto_626957 ) ( ON ?auto_626955 ?auto_626956 ) ( ON ?auto_626954 ?auto_626955 ) ( CLEAR ?auto_626952 ) ( ON ?auto_626953 ?auto_626954 ) ( CLEAR ?auto_626953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_626943 ?auto_626944 ?auto_626945 ?auto_626946 ?auto_626947 ?auto_626948 ?auto_626949 ?auto_626950 ?auto_626951 ?auto_626952 ?auto_626953 )
      ( MAKE-17PILE ?auto_626943 ?auto_626944 ?auto_626945 ?auto_626946 ?auto_626947 ?auto_626948 ?auto_626949 ?auto_626950 ?auto_626951 ?auto_626952 ?auto_626953 ?auto_626954 ?auto_626955 ?auto_626956 ?auto_626957 ?auto_626958 ?auto_626959 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_626978 - BLOCK
      ?auto_626979 - BLOCK
      ?auto_626980 - BLOCK
      ?auto_626981 - BLOCK
      ?auto_626982 - BLOCK
      ?auto_626983 - BLOCK
      ?auto_626984 - BLOCK
      ?auto_626985 - BLOCK
      ?auto_626986 - BLOCK
      ?auto_626987 - BLOCK
      ?auto_626988 - BLOCK
      ?auto_626989 - BLOCK
      ?auto_626990 - BLOCK
      ?auto_626991 - BLOCK
      ?auto_626992 - BLOCK
      ?auto_626993 - BLOCK
      ?auto_626994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_626994 ) ( ON-TABLE ?auto_626978 ) ( ON ?auto_626979 ?auto_626978 ) ( ON ?auto_626980 ?auto_626979 ) ( ON ?auto_626981 ?auto_626980 ) ( ON ?auto_626982 ?auto_626981 ) ( ON ?auto_626983 ?auto_626982 ) ( ON ?auto_626984 ?auto_626983 ) ( ON ?auto_626985 ?auto_626984 ) ( ON ?auto_626986 ?auto_626985 ) ( ON ?auto_626987 ?auto_626986 ) ( not ( = ?auto_626978 ?auto_626979 ) ) ( not ( = ?auto_626978 ?auto_626980 ) ) ( not ( = ?auto_626978 ?auto_626981 ) ) ( not ( = ?auto_626978 ?auto_626982 ) ) ( not ( = ?auto_626978 ?auto_626983 ) ) ( not ( = ?auto_626978 ?auto_626984 ) ) ( not ( = ?auto_626978 ?auto_626985 ) ) ( not ( = ?auto_626978 ?auto_626986 ) ) ( not ( = ?auto_626978 ?auto_626987 ) ) ( not ( = ?auto_626978 ?auto_626988 ) ) ( not ( = ?auto_626978 ?auto_626989 ) ) ( not ( = ?auto_626978 ?auto_626990 ) ) ( not ( = ?auto_626978 ?auto_626991 ) ) ( not ( = ?auto_626978 ?auto_626992 ) ) ( not ( = ?auto_626978 ?auto_626993 ) ) ( not ( = ?auto_626978 ?auto_626994 ) ) ( not ( = ?auto_626979 ?auto_626980 ) ) ( not ( = ?auto_626979 ?auto_626981 ) ) ( not ( = ?auto_626979 ?auto_626982 ) ) ( not ( = ?auto_626979 ?auto_626983 ) ) ( not ( = ?auto_626979 ?auto_626984 ) ) ( not ( = ?auto_626979 ?auto_626985 ) ) ( not ( = ?auto_626979 ?auto_626986 ) ) ( not ( = ?auto_626979 ?auto_626987 ) ) ( not ( = ?auto_626979 ?auto_626988 ) ) ( not ( = ?auto_626979 ?auto_626989 ) ) ( not ( = ?auto_626979 ?auto_626990 ) ) ( not ( = ?auto_626979 ?auto_626991 ) ) ( not ( = ?auto_626979 ?auto_626992 ) ) ( not ( = ?auto_626979 ?auto_626993 ) ) ( not ( = ?auto_626979 ?auto_626994 ) ) ( not ( = ?auto_626980 ?auto_626981 ) ) ( not ( = ?auto_626980 ?auto_626982 ) ) ( not ( = ?auto_626980 ?auto_626983 ) ) ( not ( = ?auto_626980 ?auto_626984 ) ) ( not ( = ?auto_626980 ?auto_626985 ) ) ( not ( = ?auto_626980 ?auto_626986 ) ) ( not ( = ?auto_626980 ?auto_626987 ) ) ( not ( = ?auto_626980 ?auto_626988 ) ) ( not ( = ?auto_626980 ?auto_626989 ) ) ( not ( = ?auto_626980 ?auto_626990 ) ) ( not ( = ?auto_626980 ?auto_626991 ) ) ( not ( = ?auto_626980 ?auto_626992 ) ) ( not ( = ?auto_626980 ?auto_626993 ) ) ( not ( = ?auto_626980 ?auto_626994 ) ) ( not ( = ?auto_626981 ?auto_626982 ) ) ( not ( = ?auto_626981 ?auto_626983 ) ) ( not ( = ?auto_626981 ?auto_626984 ) ) ( not ( = ?auto_626981 ?auto_626985 ) ) ( not ( = ?auto_626981 ?auto_626986 ) ) ( not ( = ?auto_626981 ?auto_626987 ) ) ( not ( = ?auto_626981 ?auto_626988 ) ) ( not ( = ?auto_626981 ?auto_626989 ) ) ( not ( = ?auto_626981 ?auto_626990 ) ) ( not ( = ?auto_626981 ?auto_626991 ) ) ( not ( = ?auto_626981 ?auto_626992 ) ) ( not ( = ?auto_626981 ?auto_626993 ) ) ( not ( = ?auto_626981 ?auto_626994 ) ) ( not ( = ?auto_626982 ?auto_626983 ) ) ( not ( = ?auto_626982 ?auto_626984 ) ) ( not ( = ?auto_626982 ?auto_626985 ) ) ( not ( = ?auto_626982 ?auto_626986 ) ) ( not ( = ?auto_626982 ?auto_626987 ) ) ( not ( = ?auto_626982 ?auto_626988 ) ) ( not ( = ?auto_626982 ?auto_626989 ) ) ( not ( = ?auto_626982 ?auto_626990 ) ) ( not ( = ?auto_626982 ?auto_626991 ) ) ( not ( = ?auto_626982 ?auto_626992 ) ) ( not ( = ?auto_626982 ?auto_626993 ) ) ( not ( = ?auto_626982 ?auto_626994 ) ) ( not ( = ?auto_626983 ?auto_626984 ) ) ( not ( = ?auto_626983 ?auto_626985 ) ) ( not ( = ?auto_626983 ?auto_626986 ) ) ( not ( = ?auto_626983 ?auto_626987 ) ) ( not ( = ?auto_626983 ?auto_626988 ) ) ( not ( = ?auto_626983 ?auto_626989 ) ) ( not ( = ?auto_626983 ?auto_626990 ) ) ( not ( = ?auto_626983 ?auto_626991 ) ) ( not ( = ?auto_626983 ?auto_626992 ) ) ( not ( = ?auto_626983 ?auto_626993 ) ) ( not ( = ?auto_626983 ?auto_626994 ) ) ( not ( = ?auto_626984 ?auto_626985 ) ) ( not ( = ?auto_626984 ?auto_626986 ) ) ( not ( = ?auto_626984 ?auto_626987 ) ) ( not ( = ?auto_626984 ?auto_626988 ) ) ( not ( = ?auto_626984 ?auto_626989 ) ) ( not ( = ?auto_626984 ?auto_626990 ) ) ( not ( = ?auto_626984 ?auto_626991 ) ) ( not ( = ?auto_626984 ?auto_626992 ) ) ( not ( = ?auto_626984 ?auto_626993 ) ) ( not ( = ?auto_626984 ?auto_626994 ) ) ( not ( = ?auto_626985 ?auto_626986 ) ) ( not ( = ?auto_626985 ?auto_626987 ) ) ( not ( = ?auto_626985 ?auto_626988 ) ) ( not ( = ?auto_626985 ?auto_626989 ) ) ( not ( = ?auto_626985 ?auto_626990 ) ) ( not ( = ?auto_626985 ?auto_626991 ) ) ( not ( = ?auto_626985 ?auto_626992 ) ) ( not ( = ?auto_626985 ?auto_626993 ) ) ( not ( = ?auto_626985 ?auto_626994 ) ) ( not ( = ?auto_626986 ?auto_626987 ) ) ( not ( = ?auto_626986 ?auto_626988 ) ) ( not ( = ?auto_626986 ?auto_626989 ) ) ( not ( = ?auto_626986 ?auto_626990 ) ) ( not ( = ?auto_626986 ?auto_626991 ) ) ( not ( = ?auto_626986 ?auto_626992 ) ) ( not ( = ?auto_626986 ?auto_626993 ) ) ( not ( = ?auto_626986 ?auto_626994 ) ) ( not ( = ?auto_626987 ?auto_626988 ) ) ( not ( = ?auto_626987 ?auto_626989 ) ) ( not ( = ?auto_626987 ?auto_626990 ) ) ( not ( = ?auto_626987 ?auto_626991 ) ) ( not ( = ?auto_626987 ?auto_626992 ) ) ( not ( = ?auto_626987 ?auto_626993 ) ) ( not ( = ?auto_626987 ?auto_626994 ) ) ( not ( = ?auto_626988 ?auto_626989 ) ) ( not ( = ?auto_626988 ?auto_626990 ) ) ( not ( = ?auto_626988 ?auto_626991 ) ) ( not ( = ?auto_626988 ?auto_626992 ) ) ( not ( = ?auto_626988 ?auto_626993 ) ) ( not ( = ?auto_626988 ?auto_626994 ) ) ( not ( = ?auto_626989 ?auto_626990 ) ) ( not ( = ?auto_626989 ?auto_626991 ) ) ( not ( = ?auto_626989 ?auto_626992 ) ) ( not ( = ?auto_626989 ?auto_626993 ) ) ( not ( = ?auto_626989 ?auto_626994 ) ) ( not ( = ?auto_626990 ?auto_626991 ) ) ( not ( = ?auto_626990 ?auto_626992 ) ) ( not ( = ?auto_626990 ?auto_626993 ) ) ( not ( = ?auto_626990 ?auto_626994 ) ) ( not ( = ?auto_626991 ?auto_626992 ) ) ( not ( = ?auto_626991 ?auto_626993 ) ) ( not ( = ?auto_626991 ?auto_626994 ) ) ( not ( = ?auto_626992 ?auto_626993 ) ) ( not ( = ?auto_626992 ?auto_626994 ) ) ( not ( = ?auto_626993 ?auto_626994 ) ) ( ON ?auto_626993 ?auto_626994 ) ( ON ?auto_626992 ?auto_626993 ) ( ON ?auto_626991 ?auto_626992 ) ( ON ?auto_626990 ?auto_626991 ) ( ON ?auto_626989 ?auto_626990 ) ( CLEAR ?auto_626987 ) ( ON ?auto_626988 ?auto_626989 ) ( CLEAR ?auto_626988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_626978 ?auto_626979 ?auto_626980 ?auto_626981 ?auto_626982 ?auto_626983 ?auto_626984 ?auto_626985 ?auto_626986 ?auto_626987 ?auto_626988 )
      ( MAKE-17PILE ?auto_626978 ?auto_626979 ?auto_626980 ?auto_626981 ?auto_626982 ?auto_626983 ?auto_626984 ?auto_626985 ?auto_626986 ?auto_626987 ?auto_626988 ?auto_626989 ?auto_626990 ?auto_626991 ?auto_626992 ?auto_626993 ?auto_626994 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627012 - BLOCK
      ?auto_627013 - BLOCK
      ?auto_627014 - BLOCK
      ?auto_627015 - BLOCK
      ?auto_627016 - BLOCK
      ?auto_627017 - BLOCK
      ?auto_627018 - BLOCK
      ?auto_627019 - BLOCK
      ?auto_627020 - BLOCK
      ?auto_627021 - BLOCK
      ?auto_627022 - BLOCK
      ?auto_627023 - BLOCK
      ?auto_627024 - BLOCK
      ?auto_627025 - BLOCK
      ?auto_627026 - BLOCK
      ?auto_627027 - BLOCK
      ?auto_627028 - BLOCK
    )
    :vars
    (
      ?auto_627029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627028 ?auto_627029 ) ( ON-TABLE ?auto_627012 ) ( ON ?auto_627013 ?auto_627012 ) ( ON ?auto_627014 ?auto_627013 ) ( ON ?auto_627015 ?auto_627014 ) ( ON ?auto_627016 ?auto_627015 ) ( ON ?auto_627017 ?auto_627016 ) ( ON ?auto_627018 ?auto_627017 ) ( ON ?auto_627019 ?auto_627018 ) ( ON ?auto_627020 ?auto_627019 ) ( not ( = ?auto_627012 ?auto_627013 ) ) ( not ( = ?auto_627012 ?auto_627014 ) ) ( not ( = ?auto_627012 ?auto_627015 ) ) ( not ( = ?auto_627012 ?auto_627016 ) ) ( not ( = ?auto_627012 ?auto_627017 ) ) ( not ( = ?auto_627012 ?auto_627018 ) ) ( not ( = ?auto_627012 ?auto_627019 ) ) ( not ( = ?auto_627012 ?auto_627020 ) ) ( not ( = ?auto_627012 ?auto_627021 ) ) ( not ( = ?auto_627012 ?auto_627022 ) ) ( not ( = ?auto_627012 ?auto_627023 ) ) ( not ( = ?auto_627012 ?auto_627024 ) ) ( not ( = ?auto_627012 ?auto_627025 ) ) ( not ( = ?auto_627012 ?auto_627026 ) ) ( not ( = ?auto_627012 ?auto_627027 ) ) ( not ( = ?auto_627012 ?auto_627028 ) ) ( not ( = ?auto_627012 ?auto_627029 ) ) ( not ( = ?auto_627013 ?auto_627014 ) ) ( not ( = ?auto_627013 ?auto_627015 ) ) ( not ( = ?auto_627013 ?auto_627016 ) ) ( not ( = ?auto_627013 ?auto_627017 ) ) ( not ( = ?auto_627013 ?auto_627018 ) ) ( not ( = ?auto_627013 ?auto_627019 ) ) ( not ( = ?auto_627013 ?auto_627020 ) ) ( not ( = ?auto_627013 ?auto_627021 ) ) ( not ( = ?auto_627013 ?auto_627022 ) ) ( not ( = ?auto_627013 ?auto_627023 ) ) ( not ( = ?auto_627013 ?auto_627024 ) ) ( not ( = ?auto_627013 ?auto_627025 ) ) ( not ( = ?auto_627013 ?auto_627026 ) ) ( not ( = ?auto_627013 ?auto_627027 ) ) ( not ( = ?auto_627013 ?auto_627028 ) ) ( not ( = ?auto_627013 ?auto_627029 ) ) ( not ( = ?auto_627014 ?auto_627015 ) ) ( not ( = ?auto_627014 ?auto_627016 ) ) ( not ( = ?auto_627014 ?auto_627017 ) ) ( not ( = ?auto_627014 ?auto_627018 ) ) ( not ( = ?auto_627014 ?auto_627019 ) ) ( not ( = ?auto_627014 ?auto_627020 ) ) ( not ( = ?auto_627014 ?auto_627021 ) ) ( not ( = ?auto_627014 ?auto_627022 ) ) ( not ( = ?auto_627014 ?auto_627023 ) ) ( not ( = ?auto_627014 ?auto_627024 ) ) ( not ( = ?auto_627014 ?auto_627025 ) ) ( not ( = ?auto_627014 ?auto_627026 ) ) ( not ( = ?auto_627014 ?auto_627027 ) ) ( not ( = ?auto_627014 ?auto_627028 ) ) ( not ( = ?auto_627014 ?auto_627029 ) ) ( not ( = ?auto_627015 ?auto_627016 ) ) ( not ( = ?auto_627015 ?auto_627017 ) ) ( not ( = ?auto_627015 ?auto_627018 ) ) ( not ( = ?auto_627015 ?auto_627019 ) ) ( not ( = ?auto_627015 ?auto_627020 ) ) ( not ( = ?auto_627015 ?auto_627021 ) ) ( not ( = ?auto_627015 ?auto_627022 ) ) ( not ( = ?auto_627015 ?auto_627023 ) ) ( not ( = ?auto_627015 ?auto_627024 ) ) ( not ( = ?auto_627015 ?auto_627025 ) ) ( not ( = ?auto_627015 ?auto_627026 ) ) ( not ( = ?auto_627015 ?auto_627027 ) ) ( not ( = ?auto_627015 ?auto_627028 ) ) ( not ( = ?auto_627015 ?auto_627029 ) ) ( not ( = ?auto_627016 ?auto_627017 ) ) ( not ( = ?auto_627016 ?auto_627018 ) ) ( not ( = ?auto_627016 ?auto_627019 ) ) ( not ( = ?auto_627016 ?auto_627020 ) ) ( not ( = ?auto_627016 ?auto_627021 ) ) ( not ( = ?auto_627016 ?auto_627022 ) ) ( not ( = ?auto_627016 ?auto_627023 ) ) ( not ( = ?auto_627016 ?auto_627024 ) ) ( not ( = ?auto_627016 ?auto_627025 ) ) ( not ( = ?auto_627016 ?auto_627026 ) ) ( not ( = ?auto_627016 ?auto_627027 ) ) ( not ( = ?auto_627016 ?auto_627028 ) ) ( not ( = ?auto_627016 ?auto_627029 ) ) ( not ( = ?auto_627017 ?auto_627018 ) ) ( not ( = ?auto_627017 ?auto_627019 ) ) ( not ( = ?auto_627017 ?auto_627020 ) ) ( not ( = ?auto_627017 ?auto_627021 ) ) ( not ( = ?auto_627017 ?auto_627022 ) ) ( not ( = ?auto_627017 ?auto_627023 ) ) ( not ( = ?auto_627017 ?auto_627024 ) ) ( not ( = ?auto_627017 ?auto_627025 ) ) ( not ( = ?auto_627017 ?auto_627026 ) ) ( not ( = ?auto_627017 ?auto_627027 ) ) ( not ( = ?auto_627017 ?auto_627028 ) ) ( not ( = ?auto_627017 ?auto_627029 ) ) ( not ( = ?auto_627018 ?auto_627019 ) ) ( not ( = ?auto_627018 ?auto_627020 ) ) ( not ( = ?auto_627018 ?auto_627021 ) ) ( not ( = ?auto_627018 ?auto_627022 ) ) ( not ( = ?auto_627018 ?auto_627023 ) ) ( not ( = ?auto_627018 ?auto_627024 ) ) ( not ( = ?auto_627018 ?auto_627025 ) ) ( not ( = ?auto_627018 ?auto_627026 ) ) ( not ( = ?auto_627018 ?auto_627027 ) ) ( not ( = ?auto_627018 ?auto_627028 ) ) ( not ( = ?auto_627018 ?auto_627029 ) ) ( not ( = ?auto_627019 ?auto_627020 ) ) ( not ( = ?auto_627019 ?auto_627021 ) ) ( not ( = ?auto_627019 ?auto_627022 ) ) ( not ( = ?auto_627019 ?auto_627023 ) ) ( not ( = ?auto_627019 ?auto_627024 ) ) ( not ( = ?auto_627019 ?auto_627025 ) ) ( not ( = ?auto_627019 ?auto_627026 ) ) ( not ( = ?auto_627019 ?auto_627027 ) ) ( not ( = ?auto_627019 ?auto_627028 ) ) ( not ( = ?auto_627019 ?auto_627029 ) ) ( not ( = ?auto_627020 ?auto_627021 ) ) ( not ( = ?auto_627020 ?auto_627022 ) ) ( not ( = ?auto_627020 ?auto_627023 ) ) ( not ( = ?auto_627020 ?auto_627024 ) ) ( not ( = ?auto_627020 ?auto_627025 ) ) ( not ( = ?auto_627020 ?auto_627026 ) ) ( not ( = ?auto_627020 ?auto_627027 ) ) ( not ( = ?auto_627020 ?auto_627028 ) ) ( not ( = ?auto_627020 ?auto_627029 ) ) ( not ( = ?auto_627021 ?auto_627022 ) ) ( not ( = ?auto_627021 ?auto_627023 ) ) ( not ( = ?auto_627021 ?auto_627024 ) ) ( not ( = ?auto_627021 ?auto_627025 ) ) ( not ( = ?auto_627021 ?auto_627026 ) ) ( not ( = ?auto_627021 ?auto_627027 ) ) ( not ( = ?auto_627021 ?auto_627028 ) ) ( not ( = ?auto_627021 ?auto_627029 ) ) ( not ( = ?auto_627022 ?auto_627023 ) ) ( not ( = ?auto_627022 ?auto_627024 ) ) ( not ( = ?auto_627022 ?auto_627025 ) ) ( not ( = ?auto_627022 ?auto_627026 ) ) ( not ( = ?auto_627022 ?auto_627027 ) ) ( not ( = ?auto_627022 ?auto_627028 ) ) ( not ( = ?auto_627022 ?auto_627029 ) ) ( not ( = ?auto_627023 ?auto_627024 ) ) ( not ( = ?auto_627023 ?auto_627025 ) ) ( not ( = ?auto_627023 ?auto_627026 ) ) ( not ( = ?auto_627023 ?auto_627027 ) ) ( not ( = ?auto_627023 ?auto_627028 ) ) ( not ( = ?auto_627023 ?auto_627029 ) ) ( not ( = ?auto_627024 ?auto_627025 ) ) ( not ( = ?auto_627024 ?auto_627026 ) ) ( not ( = ?auto_627024 ?auto_627027 ) ) ( not ( = ?auto_627024 ?auto_627028 ) ) ( not ( = ?auto_627024 ?auto_627029 ) ) ( not ( = ?auto_627025 ?auto_627026 ) ) ( not ( = ?auto_627025 ?auto_627027 ) ) ( not ( = ?auto_627025 ?auto_627028 ) ) ( not ( = ?auto_627025 ?auto_627029 ) ) ( not ( = ?auto_627026 ?auto_627027 ) ) ( not ( = ?auto_627026 ?auto_627028 ) ) ( not ( = ?auto_627026 ?auto_627029 ) ) ( not ( = ?auto_627027 ?auto_627028 ) ) ( not ( = ?auto_627027 ?auto_627029 ) ) ( not ( = ?auto_627028 ?auto_627029 ) ) ( ON ?auto_627027 ?auto_627028 ) ( ON ?auto_627026 ?auto_627027 ) ( ON ?auto_627025 ?auto_627026 ) ( ON ?auto_627024 ?auto_627025 ) ( ON ?auto_627023 ?auto_627024 ) ( ON ?auto_627022 ?auto_627023 ) ( CLEAR ?auto_627020 ) ( ON ?auto_627021 ?auto_627022 ) ( CLEAR ?auto_627021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_627012 ?auto_627013 ?auto_627014 ?auto_627015 ?auto_627016 ?auto_627017 ?auto_627018 ?auto_627019 ?auto_627020 ?auto_627021 )
      ( MAKE-17PILE ?auto_627012 ?auto_627013 ?auto_627014 ?auto_627015 ?auto_627016 ?auto_627017 ?auto_627018 ?auto_627019 ?auto_627020 ?auto_627021 ?auto_627022 ?auto_627023 ?auto_627024 ?auto_627025 ?auto_627026 ?auto_627027 ?auto_627028 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627047 - BLOCK
      ?auto_627048 - BLOCK
      ?auto_627049 - BLOCK
      ?auto_627050 - BLOCK
      ?auto_627051 - BLOCK
      ?auto_627052 - BLOCK
      ?auto_627053 - BLOCK
      ?auto_627054 - BLOCK
      ?auto_627055 - BLOCK
      ?auto_627056 - BLOCK
      ?auto_627057 - BLOCK
      ?auto_627058 - BLOCK
      ?auto_627059 - BLOCK
      ?auto_627060 - BLOCK
      ?auto_627061 - BLOCK
      ?auto_627062 - BLOCK
      ?auto_627063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627063 ) ( ON-TABLE ?auto_627047 ) ( ON ?auto_627048 ?auto_627047 ) ( ON ?auto_627049 ?auto_627048 ) ( ON ?auto_627050 ?auto_627049 ) ( ON ?auto_627051 ?auto_627050 ) ( ON ?auto_627052 ?auto_627051 ) ( ON ?auto_627053 ?auto_627052 ) ( ON ?auto_627054 ?auto_627053 ) ( ON ?auto_627055 ?auto_627054 ) ( not ( = ?auto_627047 ?auto_627048 ) ) ( not ( = ?auto_627047 ?auto_627049 ) ) ( not ( = ?auto_627047 ?auto_627050 ) ) ( not ( = ?auto_627047 ?auto_627051 ) ) ( not ( = ?auto_627047 ?auto_627052 ) ) ( not ( = ?auto_627047 ?auto_627053 ) ) ( not ( = ?auto_627047 ?auto_627054 ) ) ( not ( = ?auto_627047 ?auto_627055 ) ) ( not ( = ?auto_627047 ?auto_627056 ) ) ( not ( = ?auto_627047 ?auto_627057 ) ) ( not ( = ?auto_627047 ?auto_627058 ) ) ( not ( = ?auto_627047 ?auto_627059 ) ) ( not ( = ?auto_627047 ?auto_627060 ) ) ( not ( = ?auto_627047 ?auto_627061 ) ) ( not ( = ?auto_627047 ?auto_627062 ) ) ( not ( = ?auto_627047 ?auto_627063 ) ) ( not ( = ?auto_627048 ?auto_627049 ) ) ( not ( = ?auto_627048 ?auto_627050 ) ) ( not ( = ?auto_627048 ?auto_627051 ) ) ( not ( = ?auto_627048 ?auto_627052 ) ) ( not ( = ?auto_627048 ?auto_627053 ) ) ( not ( = ?auto_627048 ?auto_627054 ) ) ( not ( = ?auto_627048 ?auto_627055 ) ) ( not ( = ?auto_627048 ?auto_627056 ) ) ( not ( = ?auto_627048 ?auto_627057 ) ) ( not ( = ?auto_627048 ?auto_627058 ) ) ( not ( = ?auto_627048 ?auto_627059 ) ) ( not ( = ?auto_627048 ?auto_627060 ) ) ( not ( = ?auto_627048 ?auto_627061 ) ) ( not ( = ?auto_627048 ?auto_627062 ) ) ( not ( = ?auto_627048 ?auto_627063 ) ) ( not ( = ?auto_627049 ?auto_627050 ) ) ( not ( = ?auto_627049 ?auto_627051 ) ) ( not ( = ?auto_627049 ?auto_627052 ) ) ( not ( = ?auto_627049 ?auto_627053 ) ) ( not ( = ?auto_627049 ?auto_627054 ) ) ( not ( = ?auto_627049 ?auto_627055 ) ) ( not ( = ?auto_627049 ?auto_627056 ) ) ( not ( = ?auto_627049 ?auto_627057 ) ) ( not ( = ?auto_627049 ?auto_627058 ) ) ( not ( = ?auto_627049 ?auto_627059 ) ) ( not ( = ?auto_627049 ?auto_627060 ) ) ( not ( = ?auto_627049 ?auto_627061 ) ) ( not ( = ?auto_627049 ?auto_627062 ) ) ( not ( = ?auto_627049 ?auto_627063 ) ) ( not ( = ?auto_627050 ?auto_627051 ) ) ( not ( = ?auto_627050 ?auto_627052 ) ) ( not ( = ?auto_627050 ?auto_627053 ) ) ( not ( = ?auto_627050 ?auto_627054 ) ) ( not ( = ?auto_627050 ?auto_627055 ) ) ( not ( = ?auto_627050 ?auto_627056 ) ) ( not ( = ?auto_627050 ?auto_627057 ) ) ( not ( = ?auto_627050 ?auto_627058 ) ) ( not ( = ?auto_627050 ?auto_627059 ) ) ( not ( = ?auto_627050 ?auto_627060 ) ) ( not ( = ?auto_627050 ?auto_627061 ) ) ( not ( = ?auto_627050 ?auto_627062 ) ) ( not ( = ?auto_627050 ?auto_627063 ) ) ( not ( = ?auto_627051 ?auto_627052 ) ) ( not ( = ?auto_627051 ?auto_627053 ) ) ( not ( = ?auto_627051 ?auto_627054 ) ) ( not ( = ?auto_627051 ?auto_627055 ) ) ( not ( = ?auto_627051 ?auto_627056 ) ) ( not ( = ?auto_627051 ?auto_627057 ) ) ( not ( = ?auto_627051 ?auto_627058 ) ) ( not ( = ?auto_627051 ?auto_627059 ) ) ( not ( = ?auto_627051 ?auto_627060 ) ) ( not ( = ?auto_627051 ?auto_627061 ) ) ( not ( = ?auto_627051 ?auto_627062 ) ) ( not ( = ?auto_627051 ?auto_627063 ) ) ( not ( = ?auto_627052 ?auto_627053 ) ) ( not ( = ?auto_627052 ?auto_627054 ) ) ( not ( = ?auto_627052 ?auto_627055 ) ) ( not ( = ?auto_627052 ?auto_627056 ) ) ( not ( = ?auto_627052 ?auto_627057 ) ) ( not ( = ?auto_627052 ?auto_627058 ) ) ( not ( = ?auto_627052 ?auto_627059 ) ) ( not ( = ?auto_627052 ?auto_627060 ) ) ( not ( = ?auto_627052 ?auto_627061 ) ) ( not ( = ?auto_627052 ?auto_627062 ) ) ( not ( = ?auto_627052 ?auto_627063 ) ) ( not ( = ?auto_627053 ?auto_627054 ) ) ( not ( = ?auto_627053 ?auto_627055 ) ) ( not ( = ?auto_627053 ?auto_627056 ) ) ( not ( = ?auto_627053 ?auto_627057 ) ) ( not ( = ?auto_627053 ?auto_627058 ) ) ( not ( = ?auto_627053 ?auto_627059 ) ) ( not ( = ?auto_627053 ?auto_627060 ) ) ( not ( = ?auto_627053 ?auto_627061 ) ) ( not ( = ?auto_627053 ?auto_627062 ) ) ( not ( = ?auto_627053 ?auto_627063 ) ) ( not ( = ?auto_627054 ?auto_627055 ) ) ( not ( = ?auto_627054 ?auto_627056 ) ) ( not ( = ?auto_627054 ?auto_627057 ) ) ( not ( = ?auto_627054 ?auto_627058 ) ) ( not ( = ?auto_627054 ?auto_627059 ) ) ( not ( = ?auto_627054 ?auto_627060 ) ) ( not ( = ?auto_627054 ?auto_627061 ) ) ( not ( = ?auto_627054 ?auto_627062 ) ) ( not ( = ?auto_627054 ?auto_627063 ) ) ( not ( = ?auto_627055 ?auto_627056 ) ) ( not ( = ?auto_627055 ?auto_627057 ) ) ( not ( = ?auto_627055 ?auto_627058 ) ) ( not ( = ?auto_627055 ?auto_627059 ) ) ( not ( = ?auto_627055 ?auto_627060 ) ) ( not ( = ?auto_627055 ?auto_627061 ) ) ( not ( = ?auto_627055 ?auto_627062 ) ) ( not ( = ?auto_627055 ?auto_627063 ) ) ( not ( = ?auto_627056 ?auto_627057 ) ) ( not ( = ?auto_627056 ?auto_627058 ) ) ( not ( = ?auto_627056 ?auto_627059 ) ) ( not ( = ?auto_627056 ?auto_627060 ) ) ( not ( = ?auto_627056 ?auto_627061 ) ) ( not ( = ?auto_627056 ?auto_627062 ) ) ( not ( = ?auto_627056 ?auto_627063 ) ) ( not ( = ?auto_627057 ?auto_627058 ) ) ( not ( = ?auto_627057 ?auto_627059 ) ) ( not ( = ?auto_627057 ?auto_627060 ) ) ( not ( = ?auto_627057 ?auto_627061 ) ) ( not ( = ?auto_627057 ?auto_627062 ) ) ( not ( = ?auto_627057 ?auto_627063 ) ) ( not ( = ?auto_627058 ?auto_627059 ) ) ( not ( = ?auto_627058 ?auto_627060 ) ) ( not ( = ?auto_627058 ?auto_627061 ) ) ( not ( = ?auto_627058 ?auto_627062 ) ) ( not ( = ?auto_627058 ?auto_627063 ) ) ( not ( = ?auto_627059 ?auto_627060 ) ) ( not ( = ?auto_627059 ?auto_627061 ) ) ( not ( = ?auto_627059 ?auto_627062 ) ) ( not ( = ?auto_627059 ?auto_627063 ) ) ( not ( = ?auto_627060 ?auto_627061 ) ) ( not ( = ?auto_627060 ?auto_627062 ) ) ( not ( = ?auto_627060 ?auto_627063 ) ) ( not ( = ?auto_627061 ?auto_627062 ) ) ( not ( = ?auto_627061 ?auto_627063 ) ) ( not ( = ?auto_627062 ?auto_627063 ) ) ( ON ?auto_627062 ?auto_627063 ) ( ON ?auto_627061 ?auto_627062 ) ( ON ?auto_627060 ?auto_627061 ) ( ON ?auto_627059 ?auto_627060 ) ( ON ?auto_627058 ?auto_627059 ) ( ON ?auto_627057 ?auto_627058 ) ( CLEAR ?auto_627055 ) ( ON ?auto_627056 ?auto_627057 ) ( CLEAR ?auto_627056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_627047 ?auto_627048 ?auto_627049 ?auto_627050 ?auto_627051 ?auto_627052 ?auto_627053 ?auto_627054 ?auto_627055 ?auto_627056 )
      ( MAKE-17PILE ?auto_627047 ?auto_627048 ?auto_627049 ?auto_627050 ?auto_627051 ?auto_627052 ?auto_627053 ?auto_627054 ?auto_627055 ?auto_627056 ?auto_627057 ?auto_627058 ?auto_627059 ?auto_627060 ?auto_627061 ?auto_627062 ?auto_627063 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627081 - BLOCK
      ?auto_627082 - BLOCK
      ?auto_627083 - BLOCK
      ?auto_627084 - BLOCK
      ?auto_627085 - BLOCK
      ?auto_627086 - BLOCK
      ?auto_627087 - BLOCK
      ?auto_627088 - BLOCK
      ?auto_627089 - BLOCK
      ?auto_627090 - BLOCK
      ?auto_627091 - BLOCK
      ?auto_627092 - BLOCK
      ?auto_627093 - BLOCK
      ?auto_627094 - BLOCK
      ?auto_627095 - BLOCK
      ?auto_627096 - BLOCK
      ?auto_627097 - BLOCK
    )
    :vars
    (
      ?auto_627098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627097 ?auto_627098 ) ( ON-TABLE ?auto_627081 ) ( ON ?auto_627082 ?auto_627081 ) ( ON ?auto_627083 ?auto_627082 ) ( ON ?auto_627084 ?auto_627083 ) ( ON ?auto_627085 ?auto_627084 ) ( ON ?auto_627086 ?auto_627085 ) ( ON ?auto_627087 ?auto_627086 ) ( ON ?auto_627088 ?auto_627087 ) ( not ( = ?auto_627081 ?auto_627082 ) ) ( not ( = ?auto_627081 ?auto_627083 ) ) ( not ( = ?auto_627081 ?auto_627084 ) ) ( not ( = ?auto_627081 ?auto_627085 ) ) ( not ( = ?auto_627081 ?auto_627086 ) ) ( not ( = ?auto_627081 ?auto_627087 ) ) ( not ( = ?auto_627081 ?auto_627088 ) ) ( not ( = ?auto_627081 ?auto_627089 ) ) ( not ( = ?auto_627081 ?auto_627090 ) ) ( not ( = ?auto_627081 ?auto_627091 ) ) ( not ( = ?auto_627081 ?auto_627092 ) ) ( not ( = ?auto_627081 ?auto_627093 ) ) ( not ( = ?auto_627081 ?auto_627094 ) ) ( not ( = ?auto_627081 ?auto_627095 ) ) ( not ( = ?auto_627081 ?auto_627096 ) ) ( not ( = ?auto_627081 ?auto_627097 ) ) ( not ( = ?auto_627081 ?auto_627098 ) ) ( not ( = ?auto_627082 ?auto_627083 ) ) ( not ( = ?auto_627082 ?auto_627084 ) ) ( not ( = ?auto_627082 ?auto_627085 ) ) ( not ( = ?auto_627082 ?auto_627086 ) ) ( not ( = ?auto_627082 ?auto_627087 ) ) ( not ( = ?auto_627082 ?auto_627088 ) ) ( not ( = ?auto_627082 ?auto_627089 ) ) ( not ( = ?auto_627082 ?auto_627090 ) ) ( not ( = ?auto_627082 ?auto_627091 ) ) ( not ( = ?auto_627082 ?auto_627092 ) ) ( not ( = ?auto_627082 ?auto_627093 ) ) ( not ( = ?auto_627082 ?auto_627094 ) ) ( not ( = ?auto_627082 ?auto_627095 ) ) ( not ( = ?auto_627082 ?auto_627096 ) ) ( not ( = ?auto_627082 ?auto_627097 ) ) ( not ( = ?auto_627082 ?auto_627098 ) ) ( not ( = ?auto_627083 ?auto_627084 ) ) ( not ( = ?auto_627083 ?auto_627085 ) ) ( not ( = ?auto_627083 ?auto_627086 ) ) ( not ( = ?auto_627083 ?auto_627087 ) ) ( not ( = ?auto_627083 ?auto_627088 ) ) ( not ( = ?auto_627083 ?auto_627089 ) ) ( not ( = ?auto_627083 ?auto_627090 ) ) ( not ( = ?auto_627083 ?auto_627091 ) ) ( not ( = ?auto_627083 ?auto_627092 ) ) ( not ( = ?auto_627083 ?auto_627093 ) ) ( not ( = ?auto_627083 ?auto_627094 ) ) ( not ( = ?auto_627083 ?auto_627095 ) ) ( not ( = ?auto_627083 ?auto_627096 ) ) ( not ( = ?auto_627083 ?auto_627097 ) ) ( not ( = ?auto_627083 ?auto_627098 ) ) ( not ( = ?auto_627084 ?auto_627085 ) ) ( not ( = ?auto_627084 ?auto_627086 ) ) ( not ( = ?auto_627084 ?auto_627087 ) ) ( not ( = ?auto_627084 ?auto_627088 ) ) ( not ( = ?auto_627084 ?auto_627089 ) ) ( not ( = ?auto_627084 ?auto_627090 ) ) ( not ( = ?auto_627084 ?auto_627091 ) ) ( not ( = ?auto_627084 ?auto_627092 ) ) ( not ( = ?auto_627084 ?auto_627093 ) ) ( not ( = ?auto_627084 ?auto_627094 ) ) ( not ( = ?auto_627084 ?auto_627095 ) ) ( not ( = ?auto_627084 ?auto_627096 ) ) ( not ( = ?auto_627084 ?auto_627097 ) ) ( not ( = ?auto_627084 ?auto_627098 ) ) ( not ( = ?auto_627085 ?auto_627086 ) ) ( not ( = ?auto_627085 ?auto_627087 ) ) ( not ( = ?auto_627085 ?auto_627088 ) ) ( not ( = ?auto_627085 ?auto_627089 ) ) ( not ( = ?auto_627085 ?auto_627090 ) ) ( not ( = ?auto_627085 ?auto_627091 ) ) ( not ( = ?auto_627085 ?auto_627092 ) ) ( not ( = ?auto_627085 ?auto_627093 ) ) ( not ( = ?auto_627085 ?auto_627094 ) ) ( not ( = ?auto_627085 ?auto_627095 ) ) ( not ( = ?auto_627085 ?auto_627096 ) ) ( not ( = ?auto_627085 ?auto_627097 ) ) ( not ( = ?auto_627085 ?auto_627098 ) ) ( not ( = ?auto_627086 ?auto_627087 ) ) ( not ( = ?auto_627086 ?auto_627088 ) ) ( not ( = ?auto_627086 ?auto_627089 ) ) ( not ( = ?auto_627086 ?auto_627090 ) ) ( not ( = ?auto_627086 ?auto_627091 ) ) ( not ( = ?auto_627086 ?auto_627092 ) ) ( not ( = ?auto_627086 ?auto_627093 ) ) ( not ( = ?auto_627086 ?auto_627094 ) ) ( not ( = ?auto_627086 ?auto_627095 ) ) ( not ( = ?auto_627086 ?auto_627096 ) ) ( not ( = ?auto_627086 ?auto_627097 ) ) ( not ( = ?auto_627086 ?auto_627098 ) ) ( not ( = ?auto_627087 ?auto_627088 ) ) ( not ( = ?auto_627087 ?auto_627089 ) ) ( not ( = ?auto_627087 ?auto_627090 ) ) ( not ( = ?auto_627087 ?auto_627091 ) ) ( not ( = ?auto_627087 ?auto_627092 ) ) ( not ( = ?auto_627087 ?auto_627093 ) ) ( not ( = ?auto_627087 ?auto_627094 ) ) ( not ( = ?auto_627087 ?auto_627095 ) ) ( not ( = ?auto_627087 ?auto_627096 ) ) ( not ( = ?auto_627087 ?auto_627097 ) ) ( not ( = ?auto_627087 ?auto_627098 ) ) ( not ( = ?auto_627088 ?auto_627089 ) ) ( not ( = ?auto_627088 ?auto_627090 ) ) ( not ( = ?auto_627088 ?auto_627091 ) ) ( not ( = ?auto_627088 ?auto_627092 ) ) ( not ( = ?auto_627088 ?auto_627093 ) ) ( not ( = ?auto_627088 ?auto_627094 ) ) ( not ( = ?auto_627088 ?auto_627095 ) ) ( not ( = ?auto_627088 ?auto_627096 ) ) ( not ( = ?auto_627088 ?auto_627097 ) ) ( not ( = ?auto_627088 ?auto_627098 ) ) ( not ( = ?auto_627089 ?auto_627090 ) ) ( not ( = ?auto_627089 ?auto_627091 ) ) ( not ( = ?auto_627089 ?auto_627092 ) ) ( not ( = ?auto_627089 ?auto_627093 ) ) ( not ( = ?auto_627089 ?auto_627094 ) ) ( not ( = ?auto_627089 ?auto_627095 ) ) ( not ( = ?auto_627089 ?auto_627096 ) ) ( not ( = ?auto_627089 ?auto_627097 ) ) ( not ( = ?auto_627089 ?auto_627098 ) ) ( not ( = ?auto_627090 ?auto_627091 ) ) ( not ( = ?auto_627090 ?auto_627092 ) ) ( not ( = ?auto_627090 ?auto_627093 ) ) ( not ( = ?auto_627090 ?auto_627094 ) ) ( not ( = ?auto_627090 ?auto_627095 ) ) ( not ( = ?auto_627090 ?auto_627096 ) ) ( not ( = ?auto_627090 ?auto_627097 ) ) ( not ( = ?auto_627090 ?auto_627098 ) ) ( not ( = ?auto_627091 ?auto_627092 ) ) ( not ( = ?auto_627091 ?auto_627093 ) ) ( not ( = ?auto_627091 ?auto_627094 ) ) ( not ( = ?auto_627091 ?auto_627095 ) ) ( not ( = ?auto_627091 ?auto_627096 ) ) ( not ( = ?auto_627091 ?auto_627097 ) ) ( not ( = ?auto_627091 ?auto_627098 ) ) ( not ( = ?auto_627092 ?auto_627093 ) ) ( not ( = ?auto_627092 ?auto_627094 ) ) ( not ( = ?auto_627092 ?auto_627095 ) ) ( not ( = ?auto_627092 ?auto_627096 ) ) ( not ( = ?auto_627092 ?auto_627097 ) ) ( not ( = ?auto_627092 ?auto_627098 ) ) ( not ( = ?auto_627093 ?auto_627094 ) ) ( not ( = ?auto_627093 ?auto_627095 ) ) ( not ( = ?auto_627093 ?auto_627096 ) ) ( not ( = ?auto_627093 ?auto_627097 ) ) ( not ( = ?auto_627093 ?auto_627098 ) ) ( not ( = ?auto_627094 ?auto_627095 ) ) ( not ( = ?auto_627094 ?auto_627096 ) ) ( not ( = ?auto_627094 ?auto_627097 ) ) ( not ( = ?auto_627094 ?auto_627098 ) ) ( not ( = ?auto_627095 ?auto_627096 ) ) ( not ( = ?auto_627095 ?auto_627097 ) ) ( not ( = ?auto_627095 ?auto_627098 ) ) ( not ( = ?auto_627096 ?auto_627097 ) ) ( not ( = ?auto_627096 ?auto_627098 ) ) ( not ( = ?auto_627097 ?auto_627098 ) ) ( ON ?auto_627096 ?auto_627097 ) ( ON ?auto_627095 ?auto_627096 ) ( ON ?auto_627094 ?auto_627095 ) ( ON ?auto_627093 ?auto_627094 ) ( ON ?auto_627092 ?auto_627093 ) ( ON ?auto_627091 ?auto_627092 ) ( ON ?auto_627090 ?auto_627091 ) ( CLEAR ?auto_627088 ) ( ON ?auto_627089 ?auto_627090 ) ( CLEAR ?auto_627089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_627081 ?auto_627082 ?auto_627083 ?auto_627084 ?auto_627085 ?auto_627086 ?auto_627087 ?auto_627088 ?auto_627089 )
      ( MAKE-17PILE ?auto_627081 ?auto_627082 ?auto_627083 ?auto_627084 ?auto_627085 ?auto_627086 ?auto_627087 ?auto_627088 ?auto_627089 ?auto_627090 ?auto_627091 ?auto_627092 ?auto_627093 ?auto_627094 ?auto_627095 ?auto_627096 ?auto_627097 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627116 - BLOCK
      ?auto_627117 - BLOCK
      ?auto_627118 - BLOCK
      ?auto_627119 - BLOCK
      ?auto_627120 - BLOCK
      ?auto_627121 - BLOCK
      ?auto_627122 - BLOCK
      ?auto_627123 - BLOCK
      ?auto_627124 - BLOCK
      ?auto_627125 - BLOCK
      ?auto_627126 - BLOCK
      ?auto_627127 - BLOCK
      ?auto_627128 - BLOCK
      ?auto_627129 - BLOCK
      ?auto_627130 - BLOCK
      ?auto_627131 - BLOCK
      ?auto_627132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627132 ) ( ON-TABLE ?auto_627116 ) ( ON ?auto_627117 ?auto_627116 ) ( ON ?auto_627118 ?auto_627117 ) ( ON ?auto_627119 ?auto_627118 ) ( ON ?auto_627120 ?auto_627119 ) ( ON ?auto_627121 ?auto_627120 ) ( ON ?auto_627122 ?auto_627121 ) ( ON ?auto_627123 ?auto_627122 ) ( not ( = ?auto_627116 ?auto_627117 ) ) ( not ( = ?auto_627116 ?auto_627118 ) ) ( not ( = ?auto_627116 ?auto_627119 ) ) ( not ( = ?auto_627116 ?auto_627120 ) ) ( not ( = ?auto_627116 ?auto_627121 ) ) ( not ( = ?auto_627116 ?auto_627122 ) ) ( not ( = ?auto_627116 ?auto_627123 ) ) ( not ( = ?auto_627116 ?auto_627124 ) ) ( not ( = ?auto_627116 ?auto_627125 ) ) ( not ( = ?auto_627116 ?auto_627126 ) ) ( not ( = ?auto_627116 ?auto_627127 ) ) ( not ( = ?auto_627116 ?auto_627128 ) ) ( not ( = ?auto_627116 ?auto_627129 ) ) ( not ( = ?auto_627116 ?auto_627130 ) ) ( not ( = ?auto_627116 ?auto_627131 ) ) ( not ( = ?auto_627116 ?auto_627132 ) ) ( not ( = ?auto_627117 ?auto_627118 ) ) ( not ( = ?auto_627117 ?auto_627119 ) ) ( not ( = ?auto_627117 ?auto_627120 ) ) ( not ( = ?auto_627117 ?auto_627121 ) ) ( not ( = ?auto_627117 ?auto_627122 ) ) ( not ( = ?auto_627117 ?auto_627123 ) ) ( not ( = ?auto_627117 ?auto_627124 ) ) ( not ( = ?auto_627117 ?auto_627125 ) ) ( not ( = ?auto_627117 ?auto_627126 ) ) ( not ( = ?auto_627117 ?auto_627127 ) ) ( not ( = ?auto_627117 ?auto_627128 ) ) ( not ( = ?auto_627117 ?auto_627129 ) ) ( not ( = ?auto_627117 ?auto_627130 ) ) ( not ( = ?auto_627117 ?auto_627131 ) ) ( not ( = ?auto_627117 ?auto_627132 ) ) ( not ( = ?auto_627118 ?auto_627119 ) ) ( not ( = ?auto_627118 ?auto_627120 ) ) ( not ( = ?auto_627118 ?auto_627121 ) ) ( not ( = ?auto_627118 ?auto_627122 ) ) ( not ( = ?auto_627118 ?auto_627123 ) ) ( not ( = ?auto_627118 ?auto_627124 ) ) ( not ( = ?auto_627118 ?auto_627125 ) ) ( not ( = ?auto_627118 ?auto_627126 ) ) ( not ( = ?auto_627118 ?auto_627127 ) ) ( not ( = ?auto_627118 ?auto_627128 ) ) ( not ( = ?auto_627118 ?auto_627129 ) ) ( not ( = ?auto_627118 ?auto_627130 ) ) ( not ( = ?auto_627118 ?auto_627131 ) ) ( not ( = ?auto_627118 ?auto_627132 ) ) ( not ( = ?auto_627119 ?auto_627120 ) ) ( not ( = ?auto_627119 ?auto_627121 ) ) ( not ( = ?auto_627119 ?auto_627122 ) ) ( not ( = ?auto_627119 ?auto_627123 ) ) ( not ( = ?auto_627119 ?auto_627124 ) ) ( not ( = ?auto_627119 ?auto_627125 ) ) ( not ( = ?auto_627119 ?auto_627126 ) ) ( not ( = ?auto_627119 ?auto_627127 ) ) ( not ( = ?auto_627119 ?auto_627128 ) ) ( not ( = ?auto_627119 ?auto_627129 ) ) ( not ( = ?auto_627119 ?auto_627130 ) ) ( not ( = ?auto_627119 ?auto_627131 ) ) ( not ( = ?auto_627119 ?auto_627132 ) ) ( not ( = ?auto_627120 ?auto_627121 ) ) ( not ( = ?auto_627120 ?auto_627122 ) ) ( not ( = ?auto_627120 ?auto_627123 ) ) ( not ( = ?auto_627120 ?auto_627124 ) ) ( not ( = ?auto_627120 ?auto_627125 ) ) ( not ( = ?auto_627120 ?auto_627126 ) ) ( not ( = ?auto_627120 ?auto_627127 ) ) ( not ( = ?auto_627120 ?auto_627128 ) ) ( not ( = ?auto_627120 ?auto_627129 ) ) ( not ( = ?auto_627120 ?auto_627130 ) ) ( not ( = ?auto_627120 ?auto_627131 ) ) ( not ( = ?auto_627120 ?auto_627132 ) ) ( not ( = ?auto_627121 ?auto_627122 ) ) ( not ( = ?auto_627121 ?auto_627123 ) ) ( not ( = ?auto_627121 ?auto_627124 ) ) ( not ( = ?auto_627121 ?auto_627125 ) ) ( not ( = ?auto_627121 ?auto_627126 ) ) ( not ( = ?auto_627121 ?auto_627127 ) ) ( not ( = ?auto_627121 ?auto_627128 ) ) ( not ( = ?auto_627121 ?auto_627129 ) ) ( not ( = ?auto_627121 ?auto_627130 ) ) ( not ( = ?auto_627121 ?auto_627131 ) ) ( not ( = ?auto_627121 ?auto_627132 ) ) ( not ( = ?auto_627122 ?auto_627123 ) ) ( not ( = ?auto_627122 ?auto_627124 ) ) ( not ( = ?auto_627122 ?auto_627125 ) ) ( not ( = ?auto_627122 ?auto_627126 ) ) ( not ( = ?auto_627122 ?auto_627127 ) ) ( not ( = ?auto_627122 ?auto_627128 ) ) ( not ( = ?auto_627122 ?auto_627129 ) ) ( not ( = ?auto_627122 ?auto_627130 ) ) ( not ( = ?auto_627122 ?auto_627131 ) ) ( not ( = ?auto_627122 ?auto_627132 ) ) ( not ( = ?auto_627123 ?auto_627124 ) ) ( not ( = ?auto_627123 ?auto_627125 ) ) ( not ( = ?auto_627123 ?auto_627126 ) ) ( not ( = ?auto_627123 ?auto_627127 ) ) ( not ( = ?auto_627123 ?auto_627128 ) ) ( not ( = ?auto_627123 ?auto_627129 ) ) ( not ( = ?auto_627123 ?auto_627130 ) ) ( not ( = ?auto_627123 ?auto_627131 ) ) ( not ( = ?auto_627123 ?auto_627132 ) ) ( not ( = ?auto_627124 ?auto_627125 ) ) ( not ( = ?auto_627124 ?auto_627126 ) ) ( not ( = ?auto_627124 ?auto_627127 ) ) ( not ( = ?auto_627124 ?auto_627128 ) ) ( not ( = ?auto_627124 ?auto_627129 ) ) ( not ( = ?auto_627124 ?auto_627130 ) ) ( not ( = ?auto_627124 ?auto_627131 ) ) ( not ( = ?auto_627124 ?auto_627132 ) ) ( not ( = ?auto_627125 ?auto_627126 ) ) ( not ( = ?auto_627125 ?auto_627127 ) ) ( not ( = ?auto_627125 ?auto_627128 ) ) ( not ( = ?auto_627125 ?auto_627129 ) ) ( not ( = ?auto_627125 ?auto_627130 ) ) ( not ( = ?auto_627125 ?auto_627131 ) ) ( not ( = ?auto_627125 ?auto_627132 ) ) ( not ( = ?auto_627126 ?auto_627127 ) ) ( not ( = ?auto_627126 ?auto_627128 ) ) ( not ( = ?auto_627126 ?auto_627129 ) ) ( not ( = ?auto_627126 ?auto_627130 ) ) ( not ( = ?auto_627126 ?auto_627131 ) ) ( not ( = ?auto_627126 ?auto_627132 ) ) ( not ( = ?auto_627127 ?auto_627128 ) ) ( not ( = ?auto_627127 ?auto_627129 ) ) ( not ( = ?auto_627127 ?auto_627130 ) ) ( not ( = ?auto_627127 ?auto_627131 ) ) ( not ( = ?auto_627127 ?auto_627132 ) ) ( not ( = ?auto_627128 ?auto_627129 ) ) ( not ( = ?auto_627128 ?auto_627130 ) ) ( not ( = ?auto_627128 ?auto_627131 ) ) ( not ( = ?auto_627128 ?auto_627132 ) ) ( not ( = ?auto_627129 ?auto_627130 ) ) ( not ( = ?auto_627129 ?auto_627131 ) ) ( not ( = ?auto_627129 ?auto_627132 ) ) ( not ( = ?auto_627130 ?auto_627131 ) ) ( not ( = ?auto_627130 ?auto_627132 ) ) ( not ( = ?auto_627131 ?auto_627132 ) ) ( ON ?auto_627131 ?auto_627132 ) ( ON ?auto_627130 ?auto_627131 ) ( ON ?auto_627129 ?auto_627130 ) ( ON ?auto_627128 ?auto_627129 ) ( ON ?auto_627127 ?auto_627128 ) ( ON ?auto_627126 ?auto_627127 ) ( ON ?auto_627125 ?auto_627126 ) ( CLEAR ?auto_627123 ) ( ON ?auto_627124 ?auto_627125 ) ( CLEAR ?auto_627124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_627116 ?auto_627117 ?auto_627118 ?auto_627119 ?auto_627120 ?auto_627121 ?auto_627122 ?auto_627123 ?auto_627124 )
      ( MAKE-17PILE ?auto_627116 ?auto_627117 ?auto_627118 ?auto_627119 ?auto_627120 ?auto_627121 ?auto_627122 ?auto_627123 ?auto_627124 ?auto_627125 ?auto_627126 ?auto_627127 ?auto_627128 ?auto_627129 ?auto_627130 ?auto_627131 ?auto_627132 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627150 - BLOCK
      ?auto_627151 - BLOCK
      ?auto_627152 - BLOCK
      ?auto_627153 - BLOCK
      ?auto_627154 - BLOCK
      ?auto_627155 - BLOCK
      ?auto_627156 - BLOCK
      ?auto_627157 - BLOCK
      ?auto_627158 - BLOCK
      ?auto_627159 - BLOCK
      ?auto_627160 - BLOCK
      ?auto_627161 - BLOCK
      ?auto_627162 - BLOCK
      ?auto_627163 - BLOCK
      ?auto_627164 - BLOCK
      ?auto_627165 - BLOCK
      ?auto_627166 - BLOCK
    )
    :vars
    (
      ?auto_627167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627166 ?auto_627167 ) ( ON-TABLE ?auto_627150 ) ( ON ?auto_627151 ?auto_627150 ) ( ON ?auto_627152 ?auto_627151 ) ( ON ?auto_627153 ?auto_627152 ) ( ON ?auto_627154 ?auto_627153 ) ( ON ?auto_627155 ?auto_627154 ) ( ON ?auto_627156 ?auto_627155 ) ( not ( = ?auto_627150 ?auto_627151 ) ) ( not ( = ?auto_627150 ?auto_627152 ) ) ( not ( = ?auto_627150 ?auto_627153 ) ) ( not ( = ?auto_627150 ?auto_627154 ) ) ( not ( = ?auto_627150 ?auto_627155 ) ) ( not ( = ?auto_627150 ?auto_627156 ) ) ( not ( = ?auto_627150 ?auto_627157 ) ) ( not ( = ?auto_627150 ?auto_627158 ) ) ( not ( = ?auto_627150 ?auto_627159 ) ) ( not ( = ?auto_627150 ?auto_627160 ) ) ( not ( = ?auto_627150 ?auto_627161 ) ) ( not ( = ?auto_627150 ?auto_627162 ) ) ( not ( = ?auto_627150 ?auto_627163 ) ) ( not ( = ?auto_627150 ?auto_627164 ) ) ( not ( = ?auto_627150 ?auto_627165 ) ) ( not ( = ?auto_627150 ?auto_627166 ) ) ( not ( = ?auto_627150 ?auto_627167 ) ) ( not ( = ?auto_627151 ?auto_627152 ) ) ( not ( = ?auto_627151 ?auto_627153 ) ) ( not ( = ?auto_627151 ?auto_627154 ) ) ( not ( = ?auto_627151 ?auto_627155 ) ) ( not ( = ?auto_627151 ?auto_627156 ) ) ( not ( = ?auto_627151 ?auto_627157 ) ) ( not ( = ?auto_627151 ?auto_627158 ) ) ( not ( = ?auto_627151 ?auto_627159 ) ) ( not ( = ?auto_627151 ?auto_627160 ) ) ( not ( = ?auto_627151 ?auto_627161 ) ) ( not ( = ?auto_627151 ?auto_627162 ) ) ( not ( = ?auto_627151 ?auto_627163 ) ) ( not ( = ?auto_627151 ?auto_627164 ) ) ( not ( = ?auto_627151 ?auto_627165 ) ) ( not ( = ?auto_627151 ?auto_627166 ) ) ( not ( = ?auto_627151 ?auto_627167 ) ) ( not ( = ?auto_627152 ?auto_627153 ) ) ( not ( = ?auto_627152 ?auto_627154 ) ) ( not ( = ?auto_627152 ?auto_627155 ) ) ( not ( = ?auto_627152 ?auto_627156 ) ) ( not ( = ?auto_627152 ?auto_627157 ) ) ( not ( = ?auto_627152 ?auto_627158 ) ) ( not ( = ?auto_627152 ?auto_627159 ) ) ( not ( = ?auto_627152 ?auto_627160 ) ) ( not ( = ?auto_627152 ?auto_627161 ) ) ( not ( = ?auto_627152 ?auto_627162 ) ) ( not ( = ?auto_627152 ?auto_627163 ) ) ( not ( = ?auto_627152 ?auto_627164 ) ) ( not ( = ?auto_627152 ?auto_627165 ) ) ( not ( = ?auto_627152 ?auto_627166 ) ) ( not ( = ?auto_627152 ?auto_627167 ) ) ( not ( = ?auto_627153 ?auto_627154 ) ) ( not ( = ?auto_627153 ?auto_627155 ) ) ( not ( = ?auto_627153 ?auto_627156 ) ) ( not ( = ?auto_627153 ?auto_627157 ) ) ( not ( = ?auto_627153 ?auto_627158 ) ) ( not ( = ?auto_627153 ?auto_627159 ) ) ( not ( = ?auto_627153 ?auto_627160 ) ) ( not ( = ?auto_627153 ?auto_627161 ) ) ( not ( = ?auto_627153 ?auto_627162 ) ) ( not ( = ?auto_627153 ?auto_627163 ) ) ( not ( = ?auto_627153 ?auto_627164 ) ) ( not ( = ?auto_627153 ?auto_627165 ) ) ( not ( = ?auto_627153 ?auto_627166 ) ) ( not ( = ?auto_627153 ?auto_627167 ) ) ( not ( = ?auto_627154 ?auto_627155 ) ) ( not ( = ?auto_627154 ?auto_627156 ) ) ( not ( = ?auto_627154 ?auto_627157 ) ) ( not ( = ?auto_627154 ?auto_627158 ) ) ( not ( = ?auto_627154 ?auto_627159 ) ) ( not ( = ?auto_627154 ?auto_627160 ) ) ( not ( = ?auto_627154 ?auto_627161 ) ) ( not ( = ?auto_627154 ?auto_627162 ) ) ( not ( = ?auto_627154 ?auto_627163 ) ) ( not ( = ?auto_627154 ?auto_627164 ) ) ( not ( = ?auto_627154 ?auto_627165 ) ) ( not ( = ?auto_627154 ?auto_627166 ) ) ( not ( = ?auto_627154 ?auto_627167 ) ) ( not ( = ?auto_627155 ?auto_627156 ) ) ( not ( = ?auto_627155 ?auto_627157 ) ) ( not ( = ?auto_627155 ?auto_627158 ) ) ( not ( = ?auto_627155 ?auto_627159 ) ) ( not ( = ?auto_627155 ?auto_627160 ) ) ( not ( = ?auto_627155 ?auto_627161 ) ) ( not ( = ?auto_627155 ?auto_627162 ) ) ( not ( = ?auto_627155 ?auto_627163 ) ) ( not ( = ?auto_627155 ?auto_627164 ) ) ( not ( = ?auto_627155 ?auto_627165 ) ) ( not ( = ?auto_627155 ?auto_627166 ) ) ( not ( = ?auto_627155 ?auto_627167 ) ) ( not ( = ?auto_627156 ?auto_627157 ) ) ( not ( = ?auto_627156 ?auto_627158 ) ) ( not ( = ?auto_627156 ?auto_627159 ) ) ( not ( = ?auto_627156 ?auto_627160 ) ) ( not ( = ?auto_627156 ?auto_627161 ) ) ( not ( = ?auto_627156 ?auto_627162 ) ) ( not ( = ?auto_627156 ?auto_627163 ) ) ( not ( = ?auto_627156 ?auto_627164 ) ) ( not ( = ?auto_627156 ?auto_627165 ) ) ( not ( = ?auto_627156 ?auto_627166 ) ) ( not ( = ?auto_627156 ?auto_627167 ) ) ( not ( = ?auto_627157 ?auto_627158 ) ) ( not ( = ?auto_627157 ?auto_627159 ) ) ( not ( = ?auto_627157 ?auto_627160 ) ) ( not ( = ?auto_627157 ?auto_627161 ) ) ( not ( = ?auto_627157 ?auto_627162 ) ) ( not ( = ?auto_627157 ?auto_627163 ) ) ( not ( = ?auto_627157 ?auto_627164 ) ) ( not ( = ?auto_627157 ?auto_627165 ) ) ( not ( = ?auto_627157 ?auto_627166 ) ) ( not ( = ?auto_627157 ?auto_627167 ) ) ( not ( = ?auto_627158 ?auto_627159 ) ) ( not ( = ?auto_627158 ?auto_627160 ) ) ( not ( = ?auto_627158 ?auto_627161 ) ) ( not ( = ?auto_627158 ?auto_627162 ) ) ( not ( = ?auto_627158 ?auto_627163 ) ) ( not ( = ?auto_627158 ?auto_627164 ) ) ( not ( = ?auto_627158 ?auto_627165 ) ) ( not ( = ?auto_627158 ?auto_627166 ) ) ( not ( = ?auto_627158 ?auto_627167 ) ) ( not ( = ?auto_627159 ?auto_627160 ) ) ( not ( = ?auto_627159 ?auto_627161 ) ) ( not ( = ?auto_627159 ?auto_627162 ) ) ( not ( = ?auto_627159 ?auto_627163 ) ) ( not ( = ?auto_627159 ?auto_627164 ) ) ( not ( = ?auto_627159 ?auto_627165 ) ) ( not ( = ?auto_627159 ?auto_627166 ) ) ( not ( = ?auto_627159 ?auto_627167 ) ) ( not ( = ?auto_627160 ?auto_627161 ) ) ( not ( = ?auto_627160 ?auto_627162 ) ) ( not ( = ?auto_627160 ?auto_627163 ) ) ( not ( = ?auto_627160 ?auto_627164 ) ) ( not ( = ?auto_627160 ?auto_627165 ) ) ( not ( = ?auto_627160 ?auto_627166 ) ) ( not ( = ?auto_627160 ?auto_627167 ) ) ( not ( = ?auto_627161 ?auto_627162 ) ) ( not ( = ?auto_627161 ?auto_627163 ) ) ( not ( = ?auto_627161 ?auto_627164 ) ) ( not ( = ?auto_627161 ?auto_627165 ) ) ( not ( = ?auto_627161 ?auto_627166 ) ) ( not ( = ?auto_627161 ?auto_627167 ) ) ( not ( = ?auto_627162 ?auto_627163 ) ) ( not ( = ?auto_627162 ?auto_627164 ) ) ( not ( = ?auto_627162 ?auto_627165 ) ) ( not ( = ?auto_627162 ?auto_627166 ) ) ( not ( = ?auto_627162 ?auto_627167 ) ) ( not ( = ?auto_627163 ?auto_627164 ) ) ( not ( = ?auto_627163 ?auto_627165 ) ) ( not ( = ?auto_627163 ?auto_627166 ) ) ( not ( = ?auto_627163 ?auto_627167 ) ) ( not ( = ?auto_627164 ?auto_627165 ) ) ( not ( = ?auto_627164 ?auto_627166 ) ) ( not ( = ?auto_627164 ?auto_627167 ) ) ( not ( = ?auto_627165 ?auto_627166 ) ) ( not ( = ?auto_627165 ?auto_627167 ) ) ( not ( = ?auto_627166 ?auto_627167 ) ) ( ON ?auto_627165 ?auto_627166 ) ( ON ?auto_627164 ?auto_627165 ) ( ON ?auto_627163 ?auto_627164 ) ( ON ?auto_627162 ?auto_627163 ) ( ON ?auto_627161 ?auto_627162 ) ( ON ?auto_627160 ?auto_627161 ) ( ON ?auto_627159 ?auto_627160 ) ( ON ?auto_627158 ?auto_627159 ) ( CLEAR ?auto_627156 ) ( ON ?auto_627157 ?auto_627158 ) ( CLEAR ?auto_627157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_627150 ?auto_627151 ?auto_627152 ?auto_627153 ?auto_627154 ?auto_627155 ?auto_627156 ?auto_627157 )
      ( MAKE-17PILE ?auto_627150 ?auto_627151 ?auto_627152 ?auto_627153 ?auto_627154 ?auto_627155 ?auto_627156 ?auto_627157 ?auto_627158 ?auto_627159 ?auto_627160 ?auto_627161 ?auto_627162 ?auto_627163 ?auto_627164 ?auto_627165 ?auto_627166 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627185 - BLOCK
      ?auto_627186 - BLOCK
      ?auto_627187 - BLOCK
      ?auto_627188 - BLOCK
      ?auto_627189 - BLOCK
      ?auto_627190 - BLOCK
      ?auto_627191 - BLOCK
      ?auto_627192 - BLOCK
      ?auto_627193 - BLOCK
      ?auto_627194 - BLOCK
      ?auto_627195 - BLOCK
      ?auto_627196 - BLOCK
      ?auto_627197 - BLOCK
      ?auto_627198 - BLOCK
      ?auto_627199 - BLOCK
      ?auto_627200 - BLOCK
      ?auto_627201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627201 ) ( ON-TABLE ?auto_627185 ) ( ON ?auto_627186 ?auto_627185 ) ( ON ?auto_627187 ?auto_627186 ) ( ON ?auto_627188 ?auto_627187 ) ( ON ?auto_627189 ?auto_627188 ) ( ON ?auto_627190 ?auto_627189 ) ( ON ?auto_627191 ?auto_627190 ) ( not ( = ?auto_627185 ?auto_627186 ) ) ( not ( = ?auto_627185 ?auto_627187 ) ) ( not ( = ?auto_627185 ?auto_627188 ) ) ( not ( = ?auto_627185 ?auto_627189 ) ) ( not ( = ?auto_627185 ?auto_627190 ) ) ( not ( = ?auto_627185 ?auto_627191 ) ) ( not ( = ?auto_627185 ?auto_627192 ) ) ( not ( = ?auto_627185 ?auto_627193 ) ) ( not ( = ?auto_627185 ?auto_627194 ) ) ( not ( = ?auto_627185 ?auto_627195 ) ) ( not ( = ?auto_627185 ?auto_627196 ) ) ( not ( = ?auto_627185 ?auto_627197 ) ) ( not ( = ?auto_627185 ?auto_627198 ) ) ( not ( = ?auto_627185 ?auto_627199 ) ) ( not ( = ?auto_627185 ?auto_627200 ) ) ( not ( = ?auto_627185 ?auto_627201 ) ) ( not ( = ?auto_627186 ?auto_627187 ) ) ( not ( = ?auto_627186 ?auto_627188 ) ) ( not ( = ?auto_627186 ?auto_627189 ) ) ( not ( = ?auto_627186 ?auto_627190 ) ) ( not ( = ?auto_627186 ?auto_627191 ) ) ( not ( = ?auto_627186 ?auto_627192 ) ) ( not ( = ?auto_627186 ?auto_627193 ) ) ( not ( = ?auto_627186 ?auto_627194 ) ) ( not ( = ?auto_627186 ?auto_627195 ) ) ( not ( = ?auto_627186 ?auto_627196 ) ) ( not ( = ?auto_627186 ?auto_627197 ) ) ( not ( = ?auto_627186 ?auto_627198 ) ) ( not ( = ?auto_627186 ?auto_627199 ) ) ( not ( = ?auto_627186 ?auto_627200 ) ) ( not ( = ?auto_627186 ?auto_627201 ) ) ( not ( = ?auto_627187 ?auto_627188 ) ) ( not ( = ?auto_627187 ?auto_627189 ) ) ( not ( = ?auto_627187 ?auto_627190 ) ) ( not ( = ?auto_627187 ?auto_627191 ) ) ( not ( = ?auto_627187 ?auto_627192 ) ) ( not ( = ?auto_627187 ?auto_627193 ) ) ( not ( = ?auto_627187 ?auto_627194 ) ) ( not ( = ?auto_627187 ?auto_627195 ) ) ( not ( = ?auto_627187 ?auto_627196 ) ) ( not ( = ?auto_627187 ?auto_627197 ) ) ( not ( = ?auto_627187 ?auto_627198 ) ) ( not ( = ?auto_627187 ?auto_627199 ) ) ( not ( = ?auto_627187 ?auto_627200 ) ) ( not ( = ?auto_627187 ?auto_627201 ) ) ( not ( = ?auto_627188 ?auto_627189 ) ) ( not ( = ?auto_627188 ?auto_627190 ) ) ( not ( = ?auto_627188 ?auto_627191 ) ) ( not ( = ?auto_627188 ?auto_627192 ) ) ( not ( = ?auto_627188 ?auto_627193 ) ) ( not ( = ?auto_627188 ?auto_627194 ) ) ( not ( = ?auto_627188 ?auto_627195 ) ) ( not ( = ?auto_627188 ?auto_627196 ) ) ( not ( = ?auto_627188 ?auto_627197 ) ) ( not ( = ?auto_627188 ?auto_627198 ) ) ( not ( = ?auto_627188 ?auto_627199 ) ) ( not ( = ?auto_627188 ?auto_627200 ) ) ( not ( = ?auto_627188 ?auto_627201 ) ) ( not ( = ?auto_627189 ?auto_627190 ) ) ( not ( = ?auto_627189 ?auto_627191 ) ) ( not ( = ?auto_627189 ?auto_627192 ) ) ( not ( = ?auto_627189 ?auto_627193 ) ) ( not ( = ?auto_627189 ?auto_627194 ) ) ( not ( = ?auto_627189 ?auto_627195 ) ) ( not ( = ?auto_627189 ?auto_627196 ) ) ( not ( = ?auto_627189 ?auto_627197 ) ) ( not ( = ?auto_627189 ?auto_627198 ) ) ( not ( = ?auto_627189 ?auto_627199 ) ) ( not ( = ?auto_627189 ?auto_627200 ) ) ( not ( = ?auto_627189 ?auto_627201 ) ) ( not ( = ?auto_627190 ?auto_627191 ) ) ( not ( = ?auto_627190 ?auto_627192 ) ) ( not ( = ?auto_627190 ?auto_627193 ) ) ( not ( = ?auto_627190 ?auto_627194 ) ) ( not ( = ?auto_627190 ?auto_627195 ) ) ( not ( = ?auto_627190 ?auto_627196 ) ) ( not ( = ?auto_627190 ?auto_627197 ) ) ( not ( = ?auto_627190 ?auto_627198 ) ) ( not ( = ?auto_627190 ?auto_627199 ) ) ( not ( = ?auto_627190 ?auto_627200 ) ) ( not ( = ?auto_627190 ?auto_627201 ) ) ( not ( = ?auto_627191 ?auto_627192 ) ) ( not ( = ?auto_627191 ?auto_627193 ) ) ( not ( = ?auto_627191 ?auto_627194 ) ) ( not ( = ?auto_627191 ?auto_627195 ) ) ( not ( = ?auto_627191 ?auto_627196 ) ) ( not ( = ?auto_627191 ?auto_627197 ) ) ( not ( = ?auto_627191 ?auto_627198 ) ) ( not ( = ?auto_627191 ?auto_627199 ) ) ( not ( = ?auto_627191 ?auto_627200 ) ) ( not ( = ?auto_627191 ?auto_627201 ) ) ( not ( = ?auto_627192 ?auto_627193 ) ) ( not ( = ?auto_627192 ?auto_627194 ) ) ( not ( = ?auto_627192 ?auto_627195 ) ) ( not ( = ?auto_627192 ?auto_627196 ) ) ( not ( = ?auto_627192 ?auto_627197 ) ) ( not ( = ?auto_627192 ?auto_627198 ) ) ( not ( = ?auto_627192 ?auto_627199 ) ) ( not ( = ?auto_627192 ?auto_627200 ) ) ( not ( = ?auto_627192 ?auto_627201 ) ) ( not ( = ?auto_627193 ?auto_627194 ) ) ( not ( = ?auto_627193 ?auto_627195 ) ) ( not ( = ?auto_627193 ?auto_627196 ) ) ( not ( = ?auto_627193 ?auto_627197 ) ) ( not ( = ?auto_627193 ?auto_627198 ) ) ( not ( = ?auto_627193 ?auto_627199 ) ) ( not ( = ?auto_627193 ?auto_627200 ) ) ( not ( = ?auto_627193 ?auto_627201 ) ) ( not ( = ?auto_627194 ?auto_627195 ) ) ( not ( = ?auto_627194 ?auto_627196 ) ) ( not ( = ?auto_627194 ?auto_627197 ) ) ( not ( = ?auto_627194 ?auto_627198 ) ) ( not ( = ?auto_627194 ?auto_627199 ) ) ( not ( = ?auto_627194 ?auto_627200 ) ) ( not ( = ?auto_627194 ?auto_627201 ) ) ( not ( = ?auto_627195 ?auto_627196 ) ) ( not ( = ?auto_627195 ?auto_627197 ) ) ( not ( = ?auto_627195 ?auto_627198 ) ) ( not ( = ?auto_627195 ?auto_627199 ) ) ( not ( = ?auto_627195 ?auto_627200 ) ) ( not ( = ?auto_627195 ?auto_627201 ) ) ( not ( = ?auto_627196 ?auto_627197 ) ) ( not ( = ?auto_627196 ?auto_627198 ) ) ( not ( = ?auto_627196 ?auto_627199 ) ) ( not ( = ?auto_627196 ?auto_627200 ) ) ( not ( = ?auto_627196 ?auto_627201 ) ) ( not ( = ?auto_627197 ?auto_627198 ) ) ( not ( = ?auto_627197 ?auto_627199 ) ) ( not ( = ?auto_627197 ?auto_627200 ) ) ( not ( = ?auto_627197 ?auto_627201 ) ) ( not ( = ?auto_627198 ?auto_627199 ) ) ( not ( = ?auto_627198 ?auto_627200 ) ) ( not ( = ?auto_627198 ?auto_627201 ) ) ( not ( = ?auto_627199 ?auto_627200 ) ) ( not ( = ?auto_627199 ?auto_627201 ) ) ( not ( = ?auto_627200 ?auto_627201 ) ) ( ON ?auto_627200 ?auto_627201 ) ( ON ?auto_627199 ?auto_627200 ) ( ON ?auto_627198 ?auto_627199 ) ( ON ?auto_627197 ?auto_627198 ) ( ON ?auto_627196 ?auto_627197 ) ( ON ?auto_627195 ?auto_627196 ) ( ON ?auto_627194 ?auto_627195 ) ( ON ?auto_627193 ?auto_627194 ) ( CLEAR ?auto_627191 ) ( ON ?auto_627192 ?auto_627193 ) ( CLEAR ?auto_627192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_627185 ?auto_627186 ?auto_627187 ?auto_627188 ?auto_627189 ?auto_627190 ?auto_627191 ?auto_627192 )
      ( MAKE-17PILE ?auto_627185 ?auto_627186 ?auto_627187 ?auto_627188 ?auto_627189 ?auto_627190 ?auto_627191 ?auto_627192 ?auto_627193 ?auto_627194 ?auto_627195 ?auto_627196 ?auto_627197 ?auto_627198 ?auto_627199 ?auto_627200 ?auto_627201 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627219 - BLOCK
      ?auto_627220 - BLOCK
      ?auto_627221 - BLOCK
      ?auto_627222 - BLOCK
      ?auto_627223 - BLOCK
      ?auto_627224 - BLOCK
      ?auto_627225 - BLOCK
      ?auto_627226 - BLOCK
      ?auto_627227 - BLOCK
      ?auto_627228 - BLOCK
      ?auto_627229 - BLOCK
      ?auto_627230 - BLOCK
      ?auto_627231 - BLOCK
      ?auto_627232 - BLOCK
      ?auto_627233 - BLOCK
      ?auto_627234 - BLOCK
      ?auto_627235 - BLOCK
    )
    :vars
    (
      ?auto_627236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627235 ?auto_627236 ) ( ON-TABLE ?auto_627219 ) ( ON ?auto_627220 ?auto_627219 ) ( ON ?auto_627221 ?auto_627220 ) ( ON ?auto_627222 ?auto_627221 ) ( ON ?auto_627223 ?auto_627222 ) ( ON ?auto_627224 ?auto_627223 ) ( not ( = ?auto_627219 ?auto_627220 ) ) ( not ( = ?auto_627219 ?auto_627221 ) ) ( not ( = ?auto_627219 ?auto_627222 ) ) ( not ( = ?auto_627219 ?auto_627223 ) ) ( not ( = ?auto_627219 ?auto_627224 ) ) ( not ( = ?auto_627219 ?auto_627225 ) ) ( not ( = ?auto_627219 ?auto_627226 ) ) ( not ( = ?auto_627219 ?auto_627227 ) ) ( not ( = ?auto_627219 ?auto_627228 ) ) ( not ( = ?auto_627219 ?auto_627229 ) ) ( not ( = ?auto_627219 ?auto_627230 ) ) ( not ( = ?auto_627219 ?auto_627231 ) ) ( not ( = ?auto_627219 ?auto_627232 ) ) ( not ( = ?auto_627219 ?auto_627233 ) ) ( not ( = ?auto_627219 ?auto_627234 ) ) ( not ( = ?auto_627219 ?auto_627235 ) ) ( not ( = ?auto_627219 ?auto_627236 ) ) ( not ( = ?auto_627220 ?auto_627221 ) ) ( not ( = ?auto_627220 ?auto_627222 ) ) ( not ( = ?auto_627220 ?auto_627223 ) ) ( not ( = ?auto_627220 ?auto_627224 ) ) ( not ( = ?auto_627220 ?auto_627225 ) ) ( not ( = ?auto_627220 ?auto_627226 ) ) ( not ( = ?auto_627220 ?auto_627227 ) ) ( not ( = ?auto_627220 ?auto_627228 ) ) ( not ( = ?auto_627220 ?auto_627229 ) ) ( not ( = ?auto_627220 ?auto_627230 ) ) ( not ( = ?auto_627220 ?auto_627231 ) ) ( not ( = ?auto_627220 ?auto_627232 ) ) ( not ( = ?auto_627220 ?auto_627233 ) ) ( not ( = ?auto_627220 ?auto_627234 ) ) ( not ( = ?auto_627220 ?auto_627235 ) ) ( not ( = ?auto_627220 ?auto_627236 ) ) ( not ( = ?auto_627221 ?auto_627222 ) ) ( not ( = ?auto_627221 ?auto_627223 ) ) ( not ( = ?auto_627221 ?auto_627224 ) ) ( not ( = ?auto_627221 ?auto_627225 ) ) ( not ( = ?auto_627221 ?auto_627226 ) ) ( not ( = ?auto_627221 ?auto_627227 ) ) ( not ( = ?auto_627221 ?auto_627228 ) ) ( not ( = ?auto_627221 ?auto_627229 ) ) ( not ( = ?auto_627221 ?auto_627230 ) ) ( not ( = ?auto_627221 ?auto_627231 ) ) ( not ( = ?auto_627221 ?auto_627232 ) ) ( not ( = ?auto_627221 ?auto_627233 ) ) ( not ( = ?auto_627221 ?auto_627234 ) ) ( not ( = ?auto_627221 ?auto_627235 ) ) ( not ( = ?auto_627221 ?auto_627236 ) ) ( not ( = ?auto_627222 ?auto_627223 ) ) ( not ( = ?auto_627222 ?auto_627224 ) ) ( not ( = ?auto_627222 ?auto_627225 ) ) ( not ( = ?auto_627222 ?auto_627226 ) ) ( not ( = ?auto_627222 ?auto_627227 ) ) ( not ( = ?auto_627222 ?auto_627228 ) ) ( not ( = ?auto_627222 ?auto_627229 ) ) ( not ( = ?auto_627222 ?auto_627230 ) ) ( not ( = ?auto_627222 ?auto_627231 ) ) ( not ( = ?auto_627222 ?auto_627232 ) ) ( not ( = ?auto_627222 ?auto_627233 ) ) ( not ( = ?auto_627222 ?auto_627234 ) ) ( not ( = ?auto_627222 ?auto_627235 ) ) ( not ( = ?auto_627222 ?auto_627236 ) ) ( not ( = ?auto_627223 ?auto_627224 ) ) ( not ( = ?auto_627223 ?auto_627225 ) ) ( not ( = ?auto_627223 ?auto_627226 ) ) ( not ( = ?auto_627223 ?auto_627227 ) ) ( not ( = ?auto_627223 ?auto_627228 ) ) ( not ( = ?auto_627223 ?auto_627229 ) ) ( not ( = ?auto_627223 ?auto_627230 ) ) ( not ( = ?auto_627223 ?auto_627231 ) ) ( not ( = ?auto_627223 ?auto_627232 ) ) ( not ( = ?auto_627223 ?auto_627233 ) ) ( not ( = ?auto_627223 ?auto_627234 ) ) ( not ( = ?auto_627223 ?auto_627235 ) ) ( not ( = ?auto_627223 ?auto_627236 ) ) ( not ( = ?auto_627224 ?auto_627225 ) ) ( not ( = ?auto_627224 ?auto_627226 ) ) ( not ( = ?auto_627224 ?auto_627227 ) ) ( not ( = ?auto_627224 ?auto_627228 ) ) ( not ( = ?auto_627224 ?auto_627229 ) ) ( not ( = ?auto_627224 ?auto_627230 ) ) ( not ( = ?auto_627224 ?auto_627231 ) ) ( not ( = ?auto_627224 ?auto_627232 ) ) ( not ( = ?auto_627224 ?auto_627233 ) ) ( not ( = ?auto_627224 ?auto_627234 ) ) ( not ( = ?auto_627224 ?auto_627235 ) ) ( not ( = ?auto_627224 ?auto_627236 ) ) ( not ( = ?auto_627225 ?auto_627226 ) ) ( not ( = ?auto_627225 ?auto_627227 ) ) ( not ( = ?auto_627225 ?auto_627228 ) ) ( not ( = ?auto_627225 ?auto_627229 ) ) ( not ( = ?auto_627225 ?auto_627230 ) ) ( not ( = ?auto_627225 ?auto_627231 ) ) ( not ( = ?auto_627225 ?auto_627232 ) ) ( not ( = ?auto_627225 ?auto_627233 ) ) ( not ( = ?auto_627225 ?auto_627234 ) ) ( not ( = ?auto_627225 ?auto_627235 ) ) ( not ( = ?auto_627225 ?auto_627236 ) ) ( not ( = ?auto_627226 ?auto_627227 ) ) ( not ( = ?auto_627226 ?auto_627228 ) ) ( not ( = ?auto_627226 ?auto_627229 ) ) ( not ( = ?auto_627226 ?auto_627230 ) ) ( not ( = ?auto_627226 ?auto_627231 ) ) ( not ( = ?auto_627226 ?auto_627232 ) ) ( not ( = ?auto_627226 ?auto_627233 ) ) ( not ( = ?auto_627226 ?auto_627234 ) ) ( not ( = ?auto_627226 ?auto_627235 ) ) ( not ( = ?auto_627226 ?auto_627236 ) ) ( not ( = ?auto_627227 ?auto_627228 ) ) ( not ( = ?auto_627227 ?auto_627229 ) ) ( not ( = ?auto_627227 ?auto_627230 ) ) ( not ( = ?auto_627227 ?auto_627231 ) ) ( not ( = ?auto_627227 ?auto_627232 ) ) ( not ( = ?auto_627227 ?auto_627233 ) ) ( not ( = ?auto_627227 ?auto_627234 ) ) ( not ( = ?auto_627227 ?auto_627235 ) ) ( not ( = ?auto_627227 ?auto_627236 ) ) ( not ( = ?auto_627228 ?auto_627229 ) ) ( not ( = ?auto_627228 ?auto_627230 ) ) ( not ( = ?auto_627228 ?auto_627231 ) ) ( not ( = ?auto_627228 ?auto_627232 ) ) ( not ( = ?auto_627228 ?auto_627233 ) ) ( not ( = ?auto_627228 ?auto_627234 ) ) ( not ( = ?auto_627228 ?auto_627235 ) ) ( not ( = ?auto_627228 ?auto_627236 ) ) ( not ( = ?auto_627229 ?auto_627230 ) ) ( not ( = ?auto_627229 ?auto_627231 ) ) ( not ( = ?auto_627229 ?auto_627232 ) ) ( not ( = ?auto_627229 ?auto_627233 ) ) ( not ( = ?auto_627229 ?auto_627234 ) ) ( not ( = ?auto_627229 ?auto_627235 ) ) ( not ( = ?auto_627229 ?auto_627236 ) ) ( not ( = ?auto_627230 ?auto_627231 ) ) ( not ( = ?auto_627230 ?auto_627232 ) ) ( not ( = ?auto_627230 ?auto_627233 ) ) ( not ( = ?auto_627230 ?auto_627234 ) ) ( not ( = ?auto_627230 ?auto_627235 ) ) ( not ( = ?auto_627230 ?auto_627236 ) ) ( not ( = ?auto_627231 ?auto_627232 ) ) ( not ( = ?auto_627231 ?auto_627233 ) ) ( not ( = ?auto_627231 ?auto_627234 ) ) ( not ( = ?auto_627231 ?auto_627235 ) ) ( not ( = ?auto_627231 ?auto_627236 ) ) ( not ( = ?auto_627232 ?auto_627233 ) ) ( not ( = ?auto_627232 ?auto_627234 ) ) ( not ( = ?auto_627232 ?auto_627235 ) ) ( not ( = ?auto_627232 ?auto_627236 ) ) ( not ( = ?auto_627233 ?auto_627234 ) ) ( not ( = ?auto_627233 ?auto_627235 ) ) ( not ( = ?auto_627233 ?auto_627236 ) ) ( not ( = ?auto_627234 ?auto_627235 ) ) ( not ( = ?auto_627234 ?auto_627236 ) ) ( not ( = ?auto_627235 ?auto_627236 ) ) ( ON ?auto_627234 ?auto_627235 ) ( ON ?auto_627233 ?auto_627234 ) ( ON ?auto_627232 ?auto_627233 ) ( ON ?auto_627231 ?auto_627232 ) ( ON ?auto_627230 ?auto_627231 ) ( ON ?auto_627229 ?auto_627230 ) ( ON ?auto_627228 ?auto_627229 ) ( ON ?auto_627227 ?auto_627228 ) ( ON ?auto_627226 ?auto_627227 ) ( CLEAR ?auto_627224 ) ( ON ?auto_627225 ?auto_627226 ) ( CLEAR ?auto_627225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_627219 ?auto_627220 ?auto_627221 ?auto_627222 ?auto_627223 ?auto_627224 ?auto_627225 )
      ( MAKE-17PILE ?auto_627219 ?auto_627220 ?auto_627221 ?auto_627222 ?auto_627223 ?auto_627224 ?auto_627225 ?auto_627226 ?auto_627227 ?auto_627228 ?auto_627229 ?auto_627230 ?auto_627231 ?auto_627232 ?auto_627233 ?auto_627234 ?auto_627235 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627254 - BLOCK
      ?auto_627255 - BLOCK
      ?auto_627256 - BLOCK
      ?auto_627257 - BLOCK
      ?auto_627258 - BLOCK
      ?auto_627259 - BLOCK
      ?auto_627260 - BLOCK
      ?auto_627261 - BLOCK
      ?auto_627262 - BLOCK
      ?auto_627263 - BLOCK
      ?auto_627264 - BLOCK
      ?auto_627265 - BLOCK
      ?auto_627266 - BLOCK
      ?auto_627267 - BLOCK
      ?auto_627268 - BLOCK
      ?auto_627269 - BLOCK
      ?auto_627270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627270 ) ( ON-TABLE ?auto_627254 ) ( ON ?auto_627255 ?auto_627254 ) ( ON ?auto_627256 ?auto_627255 ) ( ON ?auto_627257 ?auto_627256 ) ( ON ?auto_627258 ?auto_627257 ) ( ON ?auto_627259 ?auto_627258 ) ( not ( = ?auto_627254 ?auto_627255 ) ) ( not ( = ?auto_627254 ?auto_627256 ) ) ( not ( = ?auto_627254 ?auto_627257 ) ) ( not ( = ?auto_627254 ?auto_627258 ) ) ( not ( = ?auto_627254 ?auto_627259 ) ) ( not ( = ?auto_627254 ?auto_627260 ) ) ( not ( = ?auto_627254 ?auto_627261 ) ) ( not ( = ?auto_627254 ?auto_627262 ) ) ( not ( = ?auto_627254 ?auto_627263 ) ) ( not ( = ?auto_627254 ?auto_627264 ) ) ( not ( = ?auto_627254 ?auto_627265 ) ) ( not ( = ?auto_627254 ?auto_627266 ) ) ( not ( = ?auto_627254 ?auto_627267 ) ) ( not ( = ?auto_627254 ?auto_627268 ) ) ( not ( = ?auto_627254 ?auto_627269 ) ) ( not ( = ?auto_627254 ?auto_627270 ) ) ( not ( = ?auto_627255 ?auto_627256 ) ) ( not ( = ?auto_627255 ?auto_627257 ) ) ( not ( = ?auto_627255 ?auto_627258 ) ) ( not ( = ?auto_627255 ?auto_627259 ) ) ( not ( = ?auto_627255 ?auto_627260 ) ) ( not ( = ?auto_627255 ?auto_627261 ) ) ( not ( = ?auto_627255 ?auto_627262 ) ) ( not ( = ?auto_627255 ?auto_627263 ) ) ( not ( = ?auto_627255 ?auto_627264 ) ) ( not ( = ?auto_627255 ?auto_627265 ) ) ( not ( = ?auto_627255 ?auto_627266 ) ) ( not ( = ?auto_627255 ?auto_627267 ) ) ( not ( = ?auto_627255 ?auto_627268 ) ) ( not ( = ?auto_627255 ?auto_627269 ) ) ( not ( = ?auto_627255 ?auto_627270 ) ) ( not ( = ?auto_627256 ?auto_627257 ) ) ( not ( = ?auto_627256 ?auto_627258 ) ) ( not ( = ?auto_627256 ?auto_627259 ) ) ( not ( = ?auto_627256 ?auto_627260 ) ) ( not ( = ?auto_627256 ?auto_627261 ) ) ( not ( = ?auto_627256 ?auto_627262 ) ) ( not ( = ?auto_627256 ?auto_627263 ) ) ( not ( = ?auto_627256 ?auto_627264 ) ) ( not ( = ?auto_627256 ?auto_627265 ) ) ( not ( = ?auto_627256 ?auto_627266 ) ) ( not ( = ?auto_627256 ?auto_627267 ) ) ( not ( = ?auto_627256 ?auto_627268 ) ) ( not ( = ?auto_627256 ?auto_627269 ) ) ( not ( = ?auto_627256 ?auto_627270 ) ) ( not ( = ?auto_627257 ?auto_627258 ) ) ( not ( = ?auto_627257 ?auto_627259 ) ) ( not ( = ?auto_627257 ?auto_627260 ) ) ( not ( = ?auto_627257 ?auto_627261 ) ) ( not ( = ?auto_627257 ?auto_627262 ) ) ( not ( = ?auto_627257 ?auto_627263 ) ) ( not ( = ?auto_627257 ?auto_627264 ) ) ( not ( = ?auto_627257 ?auto_627265 ) ) ( not ( = ?auto_627257 ?auto_627266 ) ) ( not ( = ?auto_627257 ?auto_627267 ) ) ( not ( = ?auto_627257 ?auto_627268 ) ) ( not ( = ?auto_627257 ?auto_627269 ) ) ( not ( = ?auto_627257 ?auto_627270 ) ) ( not ( = ?auto_627258 ?auto_627259 ) ) ( not ( = ?auto_627258 ?auto_627260 ) ) ( not ( = ?auto_627258 ?auto_627261 ) ) ( not ( = ?auto_627258 ?auto_627262 ) ) ( not ( = ?auto_627258 ?auto_627263 ) ) ( not ( = ?auto_627258 ?auto_627264 ) ) ( not ( = ?auto_627258 ?auto_627265 ) ) ( not ( = ?auto_627258 ?auto_627266 ) ) ( not ( = ?auto_627258 ?auto_627267 ) ) ( not ( = ?auto_627258 ?auto_627268 ) ) ( not ( = ?auto_627258 ?auto_627269 ) ) ( not ( = ?auto_627258 ?auto_627270 ) ) ( not ( = ?auto_627259 ?auto_627260 ) ) ( not ( = ?auto_627259 ?auto_627261 ) ) ( not ( = ?auto_627259 ?auto_627262 ) ) ( not ( = ?auto_627259 ?auto_627263 ) ) ( not ( = ?auto_627259 ?auto_627264 ) ) ( not ( = ?auto_627259 ?auto_627265 ) ) ( not ( = ?auto_627259 ?auto_627266 ) ) ( not ( = ?auto_627259 ?auto_627267 ) ) ( not ( = ?auto_627259 ?auto_627268 ) ) ( not ( = ?auto_627259 ?auto_627269 ) ) ( not ( = ?auto_627259 ?auto_627270 ) ) ( not ( = ?auto_627260 ?auto_627261 ) ) ( not ( = ?auto_627260 ?auto_627262 ) ) ( not ( = ?auto_627260 ?auto_627263 ) ) ( not ( = ?auto_627260 ?auto_627264 ) ) ( not ( = ?auto_627260 ?auto_627265 ) ) ( not ( = ?auto_627260 ?auto_627266 ) ) ( not ( = ?auto_627260 ?auto_627267 ) ) ( not ( = ?auto_627260 ?auto_627268 ) ) ( not ( = ?auto_627260 ?auto_627269 ) ) ( not ( = ?auto_627260 ?auto_627270 ) ) ( not ( = ?auto_627261 ?auto_627262 ) ) ( not ( = ?auto_627261 ?auto_627263 ) ) ( not ( = ?auto_627261 ?auto_627264 ) ) ( not ( = ?auto_627261 ?auto_627265 ) ) ( not ( = ?auto_627261 ?auto_627266 ) ) ( not ( = ?auto_627261 ?auto_627267 ) ) ( not ( = ?auto_627261 ?auto_627268 ) ) ( not ( = ?auto_627261 ?auto_627269 ) ) ( not ( = ?auto_627261 ?auto_627270 ) ) ( not ( = ?auto_627262 ?auto_627263 ) ) ( not ( = ?auto_627262 ?auto_627264 ) ) ( not ( = ?auto_627262 ?auto_627265 ) ) ( not ( = ?auto_627262 ?auto_627266 ) ) ( not ( = ?auto_627262 ?auto_627267 ) ) ( not ( = ?auto_627262 ?auto_627268 ) ) ( not ( = ?auto_627262 ?auto_627269 ) ) ( not ( = ?auto_627262 ?auto_627270 ) ) ( not ( = ?auto_627263 ?auto_627264 ) ) ( not ( = ?auto_627263 ?auto_627265 ) ) ( not ( = ?auto_627263 ?auto_627266 ) ) ( not ( = ?auto_627263 ?auto_627267 ) ) ( not ( = ?auto_627263 ?auto_627268 ) ) ( not ( = ?auto_627263 ?auto_627269 ) ) ( not ( = ?auto_627263 ?auto_627270 ) ) ( not ( = ?auto_627264 ?auto_627265 ) ) ( not ( = ?auto_627264 ?auto_627266 ) ) ( not ( = ?auto_627264 ?auto_627267 ) ) ( not ( = ?auto_627264 ?auto_627268 ) ) ( not ( = ?auto_627264 ?auto_627269 ) ) ( not ( = ?auto_627264 ?auto_627270 ) ) ( not ( = ?auto_627265 ?auto_627266 ) ) ( not ( = ?auto_627265 ?auto_627267 ) ) ( not ( = ?auto_627265 ?auto_627268 ) ) ( not ( = ?auto_627265 ?auto_627269 ) ) ( not ( = ?auto_627265 ?auto_627270 ) ) ( not ( = ?auto_627266 ?auto_627267 ) ) ( not ( = ?auto_627266 ?auto_627268 ) ) ( not ( = ?auto_627266 ?auto_627269 ) ) ( not ( = ?auto_627266 ?auto_627270 ) ) ( not ( = ?auto_627267 ?auto_627268 ) ) ( not ( = ?auto_627267 ?auto_627269 ) ) ( not ( = ?auto_627267 ?auto_627270 ) ) ( not ( = ?auto_627268 ?auto_627269 ) ) ( not ( = ?auto_627268 ?auto_627270 ) ) ( not ( = ?auto_627269 ?auto_627270 ) ) ( ON ?auto_627269 ?auto_627270 ) ( ON ?auto_627268 ?auto_627269 ) ( ON ?auto_627267 ?auto_627268 ) ( ON ?auto_627266 ?auto_627267 ) ( ON ?auto_627265 ?auto_627266 ) ( ON ?auto_627264 ?auto_627265 ) ( ON ?auto_627263 ?auto_627264 ) ( ON ?auto_627262 ?auto_627263 ) ( ON ?auto_627261 ?auto_627262 ) ( CLEAR ?auto_627259 ) ( ON ?auto_627260 ?auto_627261 ) ( CLEAR ?auto_627260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_627254 ?auto_627255 ?auto_627256 ?auto_627257 ?auto_627258 ?auto_627259 ?auto_627260 )
      ( MAKE-17PILE ?auto_627254 ?auto_627255 ?auto_627256 ?auto_627257 ?auto_627258 ?auto_627259 ?auto_627260 ?auto_627261 ?auto_627262 ?auto_627263 ?auto_627264 ?auto_627265 ?auto_627266 ?auto_627267 ?auto_627268 ?auto_627269 ?auto_627270 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627288 - BLOCK
      ?auto_627289 - BLOCK
      ?auto_627290 - BLOCK
      ?auto_627291 - BLOCK
      ?auto_627292 - BLOCK
      ?auto_627293 - BLOCK
      ?auto_627294 - BLOCK
      ?auto_627295 - BLOCK
      ?auto_627296 - BLOCK
      ?auto_627297 - BLOCK
      ?auto_627298 - BLOCK
      ?auto_627299 - BLOCK
      ?auto_627300 - BLOCK
      ?auto_627301 - BLOCK
      ?auto_627302 - BLOCK
      ?auto_627303 - BLOCK
      ?auto_627304 - BLOCK
    )
    :vars
    (
      ?auto_627305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627304 ?auto_627305 ) ( ON-TABLE ?auto_627288 ) ( ON ?auto_627289 ?auto_627288 ) ( ON ?auto_627290 ?auto_627289 ) ( ON ?auto_627291 ?auto_627290 ) ( ON ?auto_627292 ?auto_627291 ) ( not ( = ?auto_627288 ?auto_627289 ) ) ( not ( = ?auto_627288 ?auto_627290 ) ) ( not ( = ?auto_627288 ?auto_627291 ) ) ( not ( = ?auto_627288 ?auto_627292 ) ) ( not ( = ?auto_627288 ?auto_627293 ) ) ( not ( = ?auto_627288 ?auto_627294 ) ) ( not ( = ?auto_627288 ?auto_627295 ) ) ( not ( = ?auto_627288 ?auto_627296 ) ) ( not ( = ?auto_627288 ?auto_627297 ) ) ( not ( = ?auto_627288 ?auto_627298 ) ) ( not ( = ?auto_627288 ?auto_627299 ) ) ( not ( = ?auto_627288 ?auto_627300 ) ) ( not ( = ?auto_627288 ?auto_627301 ) ) ( not ( = ?auto_627288 ?auto_627302 ) ) ( not ( = ?auto_627288 ?auto_627303 ) ) ( not ( = ?auto_627288 ?auto_627304 ) ) ( not ( = ?auto_627288 ?auto_627305 ) ) ( not ( = ?auto_627289 ?auto_627290 ) ) ( not ( = ?auto_627289 ?auto_627291 ) ) ( not ( = ?auto_627289 ?auto_627292 ) ) ( not ( = ?auto_627289 ?auto_627293 ) ) ( not ( = ?auto_627289 ?auto_627294 ) ) ( not ( = ?auto_627289 ?auto_627295 ) ) ( not ( = ?auto_627289 ?auto_627296 ) ) ( not ( = ?auto_627289 ?auto_627297 ) ) ( not ( = ?auto_627289 ?auto_627298 ) ) ( not ( = ?auto_627289 ?auto_627299 ) ) ( not ( = ?auto_627289 ?auto_627300 ) ) ( not ( = ?auto_627289 ?auto_627301 ) ) ( not ( = ?auto_627289 ?auto_627302 ) ) ( not ( = ?auto_627289 ?auto_627303 ) ) ( not ( = ?auto_627289 ?auto_627304 ) ) ( not ( = ?auto_627289 ?auto_627305 ) ) ( not ( = ?auto_627290 ?auto_627291 ) ) ( not ( = ?auto_627290 ?auto_627292 ) ) ( not ( = ?auto_627290 ?auto_627293 ) ) ( not ( = ?auto_627290 ?auto_627294 ) ) ( not ( = ?auto_627290 ?auto_627295 ) ) ( not ( = ?auto_627290 ?auto_627296 ) ) ( not ( = ?auto_627290 ?auto_627297 ) ) ( not ( = ?auto_627290 ?auto_627298 ) ) ( not ( = ?auto_627290 ?auto_627299 ) ) ( not ( = ?auto_627290 ?auto_627300 ) ) ( not ( = ?auto_627290 ?auto_627301 ) ) ( not ( = ?auto_627290 ?auto_627302 ) ) ( not ( = ?auto_627290 ?auto_627303 ) ) ( not ( = ?auto_627290 ?auto_627304 ) ) ( not ( = ?auto_627290 ?auto_627305 ) ) ( not ( = ?auto_627291 ?auto_627292 ) ) ( not ( = ?auto_627291 ?auto_627293 ) ) ( not ( = ?auto_627291 ?auto_627294 ) ) ( not ( = ?auto_627291 ?auto_627295 ) ) ( not ( = ?auto_627291 ?auto_627296 ) ) ( not ( = ?auto_627291 ?auto_627297 ) ) ( not ( = ?auto_627291 ?auto_627298 ) ) ( not ( = ?auto_627291 ?auto_627299 ) ) ( not ( = ?auto_627291 ?auto_627300 ) ) ( not ( = ?auto_627291 ?auto_627301 ) ) ( not ( = ?auto_627291 ?auto_627302 ) ) ( not ( = ?auto_627291 ?auto_627303 ) ) ( not ( = ?auto_627291 ?auto_627304 ) ) ( not ( = ?auto_627291 ?auto_627305 ) ) ( not ( = ?auto_627292 ?auto_627293 ) ) ( not ( = ?auto_627292 ?auto_627294 ) ) ( not ( = ?auto_627292 ?auto_627295 ) ) ( not ( = ?auto_627292 ?auto_627296 ) ) ( not ( = ?auto_627292 ?auto_627297 ) ) ( not ( = ?auto_627292 ?auto_627298 ) ) ( not ( = ?auto_627292 ?auto_627299 ) ) ( not ( = ?auto_627292 ?auto_627300 ) ) ( not ( = ?auto_627292 ?auto_627301 ) ) ( not ( = ?auto_627292 ?auto_627302 ) ) ( not ( = ?auto_627292 ?auto_627303 ) ) ( not ( = ?auto_627292 ?auto_627304 ) ) ( not ( = ?auto_627292 ?auto_627305 ) ) ( not ( = ?auto_627293 ?auto_627294 ) ) ( not ( = ?auto_627293 ?auto_627295 ) ) ( not ( = ?auto_627293 ?auto_627296 ) ) ( not ( = ?auto_627293 ?auto_627297 ) ) ( not ( = ?auto_627293 ?auto_627298 ) ) ( not ( = ?auto_627293 ?auto_627299 ) ) ( not ( = ?auto_627293 ?auto_627300 ) ) ( not ( = ?auto_627293 ?auto_627301 ) ) ( not ( = ?auto_627293 ?auto_627302 ) ) ( not ( = ?auto_627293 ?auto_627303 ) ) ( not ( = ?auto_627293 ?auto_627304 ) ) ( not ( = ?auto_627293 ?auto_627305 ) ) ( not ( = ?auto_627294 ?auto_627295 ) ) ( not ( = ?auto_627294 ?auto_627296 ) ) ( not ( = ?auto_627294 ?auto_627297 ) ) ( not ( = ?auto_627294 ?auto_627298 ) ) ( not ( = ?auto_627294 ?auto_627299 ) ) ( not ( = ?auto_627294 ?auto_627300 ) ) ( not ( = ?auto_627294 ?auto_627301 ) ) ( not ( = ?auto_627294 ?auto_627302 ) ) ( not ( = ?auto_627294 ?auto_627303 ) ) ( not ( = ?auto_627294 ?auto_627304 ) ) ( not ( = ?auto_627294 ?auto_627305 ) ) ( not ( = ?auto_627295 ?auto_627296 ) ) ( not ( = ?auto_627295 ?auto_627297 ) ) ( not ( = ?auto_627295 ?auto_627298 ) ) ( not ( = ?auto_627295 ?auto_627299 ) ) ( not ( = ?auto_627295 ?auto_627300 ) ) ( not ( = ?auto_627295 ?auto_627301 ) ) ( not ( = ?auto_627295 ?auto_627302 ) ) ( not ( = ?auto_627295 ?auto_627303 ) ) ( not ( = ?auto_627295 ?auto_627304 ) ) ( not ( = ?auto_627295 ?auto_627305 ) ) ( not ( = ?auto_627296 ?auto_627297 ) ) ( not ( = ?auto_627296 ?auto_627298 ) ) ( not ( = ?auto_627296 ?auto_627299 ) ) ( not ( = ?auto_627296 ?auto_627300 ) ) ( not ( = ?auto_627296 ?auto_627301 ) ) ( not ( = ?auto_627296 ?auto_627302 ) ) ( not ( = ?auto_627296 ?auto_627303 ) ) ( not ( = ?auto_627296 ?auto_627304 ) ) ( not ( = ?auto_627296 ?auto_627305 ) ) ( not ( = ?auto_627297 ?auto_627298 ) ) ( not ( = ?auto_627297 ?auto_627299 ) ) ( not ( = ?auto_627297 ?auto_627300 ) ) ( not ( = ?auto_627297 ?auto_627301 ) ) ( not ( = ?auto_627297 ?auto_627302 ) ) ( not ( = ?auto_627297 ?auto_627303 ) ) ( not ( = ?auto_627297 ?auto_627304 ) ) ( not ( = ?auto_627297 ?auto_627305 ) ) ( not ( = ?auto_627298 ?auto_627299 ) ) ( not ( = ?auto_627298 ?auto_627300 ) ) ( not ( = ?auto_627298 ?auto_627301 ) ) ( not ( = ?auto_627298 ?auto_627302 ) ) ( not ( = ?auto_627298 ?auto_627303 ) ) ( not ( = ?auto_627298 ?auto_627304 ) ) ( not ( = ?auto_627298 ?auto_627305 ) ) ( not ( = ?auto_627299 ?auto_627300 ) ) ( not ( = ?auto_627299 ?auto_627301 ) ) ( not ( = ?auto_627299 ?auto_627302 ) ) ( not ( = ?auto_627299 ?auto_627303 ) ) ( not ( = ?auto_627299 ?auto_627304 ) ) ( not ( = ?auto_627299 ?auto_627305 ) ) ( not ( = ?auto_627300 ?auto_627301 ) ) ( not ( = ?auto_627300 ?auto_627302 ) ) ( not ( = ?auto_627300 ?auto_627303 ) ) ( not ( = ?auto_627300 ?auto_627304 ) ) ( not ( = ?auto_627300 ?auto_627305 ) ) ( not ( = ?auto_627301 ?auto_627302 ) ) ( not ( = ?auto_627301 ?auto_627303 ) ) ( not ( = ?auto_627301 ?auto_627304 ) ) ( not ( = ?auto_627301 ?auto_627305 ) ) ( not ( = ?auto_627302 ?auto_627303 ) ) ( not ( = ?auto_627302 ?auto_627304 ) ) ( not ( = ?auto_627302 ?auto_627305 ) ) ( not ( = ?auto_627303 ?auto_627304 ) ) ( not ( = ?auto_627303 ?auto_627305 ) ) ( not ( = ?auto_627304 ?auto_627305 ) ) ( ON ?auto_627303 ?auto_627304 ) ( ON ?auto_627302 ?auto_627303 ) ( ON ?auto_627301 ?auto_627302 ) ( ON ?auto_627300 ?auto_627301 ) ( ON ?auto_627299 ?auto_627300 ) ( ON ?auto_627298 ?auto_627299 ) ( ON ?auto_627297 ?auto_627298 ) ( ON ?auto_627296 ?auto_627297 ) ( ON ?auto_627295 ?auto_627296 ) ( ON ?auto_627294 ?auto_627295 ) ( CLEAR ?auto_627292 ) ( ON ?auto_627293 ?auto_627294 ) ( CLEAR ?auto_627293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_627288 ?auto_627289 ?auto_627290 ?auto_627291 ?auto_627292 ?auto_627293 )
      ( MAKE-17PILE ?auto_627288 ?auto_627289 ?auto_627290 ?auto_627291 ?auto_627292 ?auto_627293 ?auto_627294 ?auto_627295 ?auto_627296 ?auto_627297 ?auto_627298 ?auto_627299 ?auto_627300 ?auto_627301 ?auto_627302 ?auto_627303 ?auto_627304 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627323 - BLOCK
      ?auto_627324 - BLOCK
      ?auto_627325 - BLOCK
      ?auto_627326 - BLOCK
      ?auto_627327 - BLOCK
      ?auto_627328 - BLOCK
      ?auto_627329 - BLOCK
      ?auto_627330 - BLOCK
      ?auto_627331 - BLOCK
      ?auto_627332 - BLOCK
      ?auto_627333 - BLOCK
      ?auto_627334 - BLOCK
      ?auto_627335 - BLOCK
      ?auto_627336 - BLOCK
      ?auto_627337 - BLOCK
      ?auto_627338 - BLOCK
      ?auto_627339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627339 ) ( ON-TABLE ?auto_627323 ) ( ON ?auto_627324 ?auto_627323 ) ( ON ?auto_627325 ?auto_627324 ) ( ON ?auto_627326 ?auto_627325 ) ( ON ?auto_627327 ?auto_627326 ) ( not ( = ?auto_627323 ?auto_627324 ) ) ( not ( = ?auto_627323 ?auto_627325 ) ) ( not ( = ?auto_627323 ?auto_627326 ) ) ( not ( = ?auto_627323 ?auto_627327 ) ) ( not ( = ?auto_627323 ?auto_627328 ) ) ( not ( = ?auto_627323 ?auto_627329 ) ) ( not ( = ?auto_627323 ?auto_627330 ) ) ( not ( = ?auto_627323 ?auto_627331 ) ) ( not ( = ?auto_627323 ?auto_627332 ) ) ( not ( = ?auto_627323 ?auto_627333 ) ) ( not ( = ?auto_627323 ?auto_627334 ) ) ( not ( = ?auto_627323 ?auto_627335 ) ) ( not ( = ?auto_627323 ?auto_627336 ) ) ( not ( = ?auto_627323 ?auto_627337 ) ) ( not ( = ?auto_627323 ?auto_627338 ) ) ( not ( = ?auto_627323 ?auto_627339 ) ) ( not ( = ?auto_627324 ?auto_627325 ) ) ( not ( = ?auto_627324 ?auto_627326 ) ) ( not ( = ?auto_627324 ?auto_627327 ) ) ( not ( = ?auto_627324 ?auto_627328 ) ) ( not ( = ?auto_627324 ?auto_627329 ) ) ( not ( = ?auto_627324 ?auto_627330 ) ) ( not ( = ?auto_627324 ?auto_627331 ) ) ( not ( = ?auto_627324 ?auto_627332 ) ) ( not ( = ?auto_627324 ?auto_627333 ) ) ( not ( = ?auto_627324 ?auto_627334 ) ) ( not ( = ?auto_627324 ?auto_627335 ) ) ( not ( = ?auto_627324 ?auto_627336 ) ) ( not ( = ?auto_627324 ?auto_627337 ) ) ( not ( = ?auto_627324 ?auto_627338 ) ) ( not ( = ?auto_627324 ?auto_627339 ) ) ( not ( = ?auto_627325 ?auto_627326 ) ) ( not ( = ?auto_627325 ?auto_627327 ) ) ( not ( = ?auto_627325 ?auto_627328 ) ) ( not ( = ?auto_627325 ?auto_627329 ) ) ( not ( = ?auto_627325 ?auto_627330 ) ) ( not ( = ?auto_627325 ?auto_627331 ) ) ( not ( = ?auto_627325 ?auto_627332 ) ) ( not ( = ?auto_627325 ?auto_627333 ) ) ( not ( = ?auto_627325 ?auto_627334 ) ) ( not ( = ?auto_627325 ?auto_627335 ) ) ( not ( = ?auto_627325 ?auto_627336 ) ) ( not ( = ?auto_627325 ?auto_627337 ) ) ( not ( = ?auto_627325 ?auto_627338 ) ) ( not ( = ?auto_627325 ?auto_627339 ) ) ( not ( = ?auto_627326 ?auto_627327 ) ) ( not ( = ?auto_627326 ?auto_627328 ) ) ( not ( = ?auto_627326 ?auto_627329 ) ) ( not ( = ?auto_627326 ?auto_627330 ) ) ( not ( = ?auto_627326 ?auto_627331 ) ) ( not ( = ?auto_627326 ?auto_627332 ) ) ( not ( = ?auto_627326 ?auto_627333 ) ) ( not ( = ?auto_627326 ?auto_627334 ) ) ( not ( = ?auto_627326 ?auto_627335 ) ) ( not ( = ?auto_627326 ?auto_627336 ) ) ( not ( = ?auto_627326 ?auto_627337 ) ) ( not ( = ?auto_627326 ?auto_627338 ) ) ( not ( = ?auto_627326 ?auto_627339 ) ) ( not ( = ?auto_627327 ?auto_627328 ) ) ( not ( = ?auto_627327 ?auto_627329 ) ) ( not ( = ?auto_627327 ?auto_627330 ) ) ( not ( = ?auto_627327 ?auto_627331 ) ) ( not ( = ?auto_627327 ?auto_627332 ) ) ( not ( = ?auto_627327 ?auto_627333 ) ) ( not ( = ?auto_627327 ?auto_627334 ) ) ( not ( = ?auto_627327 ?auto_627335 ) ) ( not ( = ?auto_627327 ?auto_627336 ) ) ( not ( = ?auto_627327 ?auto_627337 ) ) ( not ( = ?auto_627327 ?auto_627338 ) ) ( not ( = ?auto_627327 ?auto_627339 ) ) ( not ( = ?auto_627328 ?auto_627329 ) ) ( not ( = ?auto_627328 ?auto_627330 ) ) ( not ( = ?auto_627328 ?auto_627331 ) ) ( not ( = ?auto_627328 ?auto_627332 ) ) ( not ( = ?auto_627328 ?auto_627333 ) ) ( not ( = ?auto_627328 ?auto_627334 ) ) ( not ( = ?auto_627328 ?auto_627335 ) ) ( not ( = ?auto_627328 ?auto_627336 ) ) ( not ( = ?auto_627328 ?auto_627337 ) ) ( not ( = ?auto_627328 ?auto_627338 ) ) ( not ( = ?auto_627328 ?auto_627339 ) ) ( not ( = ?auto_627329 ?auto_627330 ) ) ( not ( = ?auto_627329 ?auto_627331 ) ) ( not ( = ?auto_627329 ?auto_627332 ) ) ( not ( = ?auto_627329 ?auto_627333 ) ) ( not ( = ?auto_627329 ?auto_627334 ) ) ( not ( = ?auto_627329 ?auto_627335 ) ) ( not ( = ?auto_627329 ?auto_627336 ) ) ( not ( = ?auto_627329 ?auto_627337 ) ) ( not ( = ?auto_627329 ?auto_627338 ) ) ( not ( = ?auto_627329 ?auto_627339 ) ) ( not ( = ?auto_627330 ?auto_627331 ) ) ( not ( = ?auto_627330 ?auto_627332 ) ) ( not ( = ?auto_627330 ?auto_627333 ) ) ( not ( = ?auto_627330 ?auto_627334 ) ) ( not ( = ?auto_627330 ?auto_627335 ) ) ( not ( = ?auto_627330 ?auto_627336 ) ) ( not ( = ?auto_627330 ?auto_627337 ) ) ( not ( = ?auto_627330 ?auto_627338 ) ) ( not ( = ?auto_627330 ?auto_627339 ) ) ( not ( = ?auto_627331 ?auto_627332 ) ) ( not ( = ?auto_627331 ?auto_627333 ) ) ( not ( = ?auto_627331 ?auto_627334 ) ) ( not ( = ?auto_627331 ?auto_627335 ) ) ( not ( = ?auto_627331 ?auto_627336 ) ) ( not ( = ?auto_627331 ?auto_627337 ) ) ( not ( = ?auto_627331 ?auto_627338 ) ) ( not ( = ?auto_627331 ?auto_627339 ) ) ( not ( = ?auto_627332 ?auto_627333 ) ) ( not ( = ?auto_627332 ?auto_627334 ) ) ( not ( = ?auto_627332 ?auto_627335 ) ) ( not ( = ?auto_627332 ?auto_627336 ) ) ( not ( = ?auto_627332 ?auto_627337 ) ) ( not ( = ?auto_627332 ?auto_627338 ) ) ( not ( = ?auto_627332 ?auto_627339 ) ) ( not ( = ?auto_627333 ?auto_627334 ) ) ( not ( = ?auto_627333 ?auto_627335 ) ) ( not ( = ?auto_627333 ?auto_627336 ) ) ( not ( = ?auto_627333 ?auto_627337 ) ) ( not ( = ?auto_627333 ?auto_627338 ) ) ( not ( = ?auto_627333 ?auto_627339 ) ) ( not ( = ?auto_627334 ?auto_627335 ) ) ( not ( = ?auto_627334 ?auto_627336 ) ) ( not ( = ?auto_627334 ?auto_627337 ) ) ( not ( = ?auto_627334 ?auto_627338 ) ) ( not ( = ?auto_627334 ?auto_627339 ) ) ( not ( = ?auto_627335 ?auto_627336 ) ) ( not ( = ?auto_627335 ?auto_627337 ) ) ( not ( = ?auto_627335 ?auto_627338 ) ) ( not ( = ?auto_627335 ?auto_627339 ) ) ( not ( = ?auto_627336 ?auto_627337 ) ) ( not ( = ?auto_627336 ?auto_627338 ) ) ( not ( = ?auto_627336 ?auto_627339 ) ) ( not ( = ?auto_627337 ?auto_627338 ) ) ( not ( = ?auto_627337 ?auto_627339 ) ) ( not ( = ?auto_627338 ?auto_627339 ) ) ( ON ?auto_627338 ?auto_627339 ) ( ON ?auto_627337 ?auto_627338 ) ( ON ?auto_627336 ?auto_627337 ) ( ON ?auto_627335 ?auto_627336 ) ( ON ?auto_627334 ?auto_627335 ) ( ON ?auto_627333 ?auto_627334 ) ( ON ?auto_627332 ?auto_627333 ) ( ON ?auto_627331 ?auto_627332 ) ( ON ?auto_627330 ?auto_627331 ) ( ON ?auto_627329 ?auto_627330 ) ( CLEAR ?auto_627327 ) ( ON ?auto_627328 ?auto_627329 ) ( CLEAR ?auto_627328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_627323 ?auto_627324 ?auto_627325 ?auto_627326 ?auto_627327 ?auto_627328 )
      ( MAKE-17PILE ?auto_627323 ?auto_627324 ?auto_627325 ?auto_627326 ?auto_627327 ?auto_627328 ?auto_627329 ?auto_627330 ?auto_627331 ?auto_627332 ?auto_627333 ?auto_627334 ?auto_627335 ?auto_627336 ?auto_627337 ?auto_627338 ?auto_627339 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627357 - BLOCK
      ?auto_627358 - BLOCK
      ?auto_627359 - BLOCK
      ?auto_627360 - BLOCK
      ?auto_627361 - BLOCK
      ?auto_627362 - BLOCK
      ?auto_627363 - BLOCK
      ?auto_627364 - BLOCK
      ?auto_627365 - BLOCK
      ?auto_627366 - BLOCK
      ?auto_627367 - BLOCK
      ?auto_627368 - BLOCK
      ?auto_627369 - BLOCK
      ?auto_627370 - BLOCK
      ?auto_627371 - BLOCK
      ?auto_627372 - BLOCK
      ?auto_627373 - BLOCK
    )
    :vars
    (
      ?auto_627374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627373 ?auto_627374 ) ( ON-TABLE ?auto_627357 ) ( ON ?auto_627358 ?auto_627357 ) ( ON ?auto_627359 ?auto_627358 ) ( ON ?auto_627360 ?auto_627359 ) ( not ( = ?auto_627357 ?auto_627358 ) ) ( not ( = ?auto_627357 ?auto_627359 ) ) ( not ( = ?auto_627357 ?auto_627360 ) ) ( not ( = ?auto_627357 ?auto_627361 ) ) ( not ( = ?auto_627357 ?auto_627362 ) ) ( not ( = ?auto_627357 ?auto_627363 ) ) ( not ( = ?auto_627357 ?auto_627364 ) ) ( not ( = ?auto_627357 ?auto_627365 ) ) ( not ( = ?auto_627357 ?auto_627366 ) ) ( not ( = ?auto_627357 ?auto_627367 ) ) ( not ( = ?auto_627357 ?auto_627368 ) ) ( not ( = ?auto_627357 ?auto_627369 ) ) ( not ( = ?auto_627357 ?auto_627370 ) ) ( not ( = ?auto_627357 ?auto_627371 ) ) ( not ( = ?auto_627357 ?auto_627372 ) ) ( not ( = ?auto_627357 ?auto_627373 ) ) ( not ( = ?auto_627357 ?auto_627374 ) ) ( not ( = ?auto_627358 ?auto_627359 ) ) ( not ( = ?auto_627358 ?auto_627360 ) ) ( not ( = ?auto_627358 ?auto_627361 ) ) ( not ( = ?auto_627358 ?auto_627362 ) ) ( not ( = ?auto_627358 ?auto_627363 ) ) ( not ( = ?auto_627358 ?auto_627364 ) ) ( not ( = ?auto_627358 ?auto_627365 ) ) ( not ( = ?auto_627358 ?auto_627366 ) ) ( not ( = ?auto_627358 ?auto_627367 ) ) ( not ( = ?auto_627358 ?auto_627368 ) ) ( not ( = ?auto_627358 ?auto_627369 ) ) ( not ( = ?auto_627358 ?auto_627370 ) ) ( not ( = ?auto_627358 ?auto_627371 ) ) ( not ( = ?auto_627358 ?auto_627372 ) ) ( not ( = ?auto_627358 ?auto_627373 ) ) ( not ( = ?auto_627358 ?auto_627374 ) ) ( not ( = ?auto_627359 ?auto_627360 ) ) ( not ( = ?auto_627359 ?auto_627361 ) ) ( not ( = ?auto_627359 ?auto_627362 ) ) ( not ( = ?auto_627359 ?auto_627363 ) ) ( not ( = ?auto_627359 ?auto_627364 ) ) ( not ( = ?auto_627359 ?auto_627365 ) ) ( not ( = ?auto_627359 ?auto_627366 ) ) ( not ( = ?auto_627359 ?auto_627367 ) ) ( not ( = ?auto_627359 ?auto_627368 ) ) ( not ( = ?auto_627359 ?auto_627369 ) ) ( not ( = ?auto_627359 ?auto_627370 ) ) ( not ( = ?auto_627359 ?auto_627371 ) ) ( not ( = ?auto_627359 ?auto_627372 ) ) ( not ( = ?auto_627359 ?auto_627373 ) ) ( not ( = ?auto_627359 ?auto_627374 ) ) ( not ( = ?auto_627360 ?auto_627361 ) ) ( not ( = ?auto_627360 ?auto_627362 ) ) ( not ( = ?auto_627360 ?auto_627363 ) ) ( not ( = ?auto_627360 ?auto_627364 ) ) ( not ( = ?auto_627360 ?auto_627365 ) ) ( not ( = ?auto_627360 ?auto_627366 ) ) ( not ( = ?auto_627360 ?auto_627367 ) ) ( not ( = ?auto_627360 ?auto_627368 ) ) ( not ( = ?auto_627360 ?auto_627369 ) ) ( not ( = ?auto_627360 ?auto_627370 ) ) ( not ( = ?auto_627360 ?auto_627371 ) ) ( not ( = ?auto_627360 ?auto_627372 ) ) ( not ( = ?auto_627360 ?auto_627373 ) ) ( not ( = ?auto_627360 ?auto_627374 ) ) ( not ( = ?auto_627361 ?auto_627362 ) ) ( not ( = ?auto_627361 ?auto_627363 ) ) ( not ( = ?auto_627361 ?auto_627364 ) ) ( not ( = ?auto_627361 ?auto_627365 ) ) ( not ( = ?auto_627361 ?auto_627366 ) ) ( not ( = ?auto_627361 ?auto_627367 ) ) ( not ( = ?auto_627361 ?auto_627368 ) ) ( not ( = ?auto_627361 ?auto_627369 ) ) ( not ( = ?auto_627361 ?auto_627370 ) ) ( not ( = ?auto_627361 ?auto_627371 ) ) ( not ( = ?auto_627361 ?auto_627372 ) ) ( not ( = ?auto_627361 ?auto_627373 ) ) ( not ( = ?auto_627361 ?auto_627374 ) ) ( not ( = ?auto_627362 ?auto_627363 ) ) ( not ( = ?auto_627362 ?auto_627364 ) ) ( not ( = ?auto_627362 ?auto_627365 ) ) ( not ( = ?auto_627362 ?auto_627366 ) ) ( not ( = ?auto_627362 ?auto_627367 ) ) ( not ( = ?auto_627362 ?auto_627368 ) ) ( not ( = ?auto_627362 ?auto_627369 ) ) ( not ( = ?auto_627362 ?auto_627370 ) ) ( not ( = ?auto_627362 ?auto_627371 ) ) ( not ( = ?auto_627362 ?auto_627372 ) ) ( not ( = ?auto_627362 ?auto_627373 ) ) ( not ( = ?auto_627362 ?auto_627374 ) ) ( not ( = ?auto_627363 ?auto_627364 ) ) ( not ( = ?auto_627363 ?auto_627365 ) ) ( not ( = ?auto_627363 ?auto_627366 ) ) ( not ( = ?auto_627363 ?auto_627367 ) ) ( not ( = ?auto_627363 ?auto_627368 ) ) ( not ( = ?auto_627363 ?auto_627369 ) ) ( not ( = ?auto_627363 ?auto_627370 ) ) ( not ( = ?auto_627363 ?auto_627371 ) ) ( not ( = ?auto_627363 ?auto_627372 ) ) ( not ( = ?auto_627363 ?auto_627373 ) ) ( not ( = ?auto_627363 ?auto_627374 ) ) ( not ( = ?auto_627364 ?auto_627365 ) ) ( not ( = ?auto_627364 ?auto_627366 ) ) ( not ( = ?auto_627364 ?auto_627367 ) ) ( not ( = ?auto_627364 ?auto_627368 ) ) ( not ( = ?auto_627364 ?auto_627369 ) ) ( not ( = ?auto_627364 ?auto_627370 ) ) ( not ( = ?auto_627364 ?auto_627371 ) ) ( not ( = ?auto_627364 ?auto_627372 ) ) ( not ( = ?auto_627364 ?auto_627373 ) ) ( not ( = ?auto_627364 ?auto_627374 ) ) ( not ( = ?auto_627365 ?auto_627366 ) ) ( not ( = ?auto_627365 ?auto_627367 ) ) ( not ( = ?auto_627365 ?auto_627368 ) ) ( not ( = ?auto_627365 ?auto_627369 ) ) ( not ( = ?auto_627365 ?auto_627370 ) ) ( not ( = ?auto_627365 ?auto_627371 ) ) ( not ( = ?auto_627365 ?auto_627372 ) ) ( not ( = ?auto_627365 ?auto_627373 ) ) ( not ( = ?auto_627365 ?auto_627374 ) ) ( not ( = ?auto_627366 ?auto_627367 ) ) ( not ( = ?auto_627366 ?auto_627368 ) ) ( not ( = ?auto_627366 ?auto_627369 ) ) ( not ( = ?auto_627366 ?auto_627370 ) ) ( not ( = ?auto_627366 ?auto_627371 ) ) ( not ( = ?auto_627366 ?auto_627372 ) ) ( not ( = ?auto_627366 ?auto_627373 ) ) ( not ( = ?auto_627366 ?auto_627374 ) ) ( not ( = ?auto_627367 ?auto_627368 ) ) ( not ( = ?auto_627367 ?auto_627369 ) ) ( not ( = ?auto_627367 ?auto_627370 ) ) ( not ( = ?auto_627367 ?auto_627371 ) ) ( not ( = ?auto_627367 ?auto_627372 ) ) ( not ( = ?auto_627367 ?auto_627373 ) ) ( not ( = ?auto_627367 ?auto_627374 ) ) ( not ( = ?auto_627368 ?auto_627369 ) ) ( not ( = ?auto_627368 ?auto_627370 ) ) ( not ( = ?auto_627368 ?auto_627371 ) ) ( not ( = ?auto_627368 ?auto_627372 ) ) ( not ( = ?auto_627368 ?auto_627373 ) ) ( not ( = ?auto_627368 ?auto_627374 ) ) ( not ( = ?auto_627369 ?auto_627370 ) ) ( not ( = ?auto_627369 ?auto_627371 ) ) ( not ( = ?auto_627369 ?auto_627372 ) ) ( not ( = ?auto_627369 ?auto_627373 ) ) ( not ( = ?auto_627369 ?auto_627374 ) ) ( not ( = ?auto_627370 ?auto_627371 ) ) ( not ( = ?auto_627370 ?auto_627372 ) ) ( not ( = ?auto_627370 ?auto_627373 ) ) ( not ( = ?auto_627370 ?auto_627374 ) ) ( not ( = ?auto_627371 ?auto_627372 ) ) ( not ( = ?auto_627371 ?auto_627373 ) ) ( not ( = ?auto_627371 ?auto_627374 ) ) ( not ( = ?auto_627372 ?auto_627373 ) ) ( not ( = ?auto_627372 ?auto_627374 ) ) ( not ( = ?auto_627373 ?auto_627374 ) ) ( ON ?auto_627372 ?auto_627373 ) ( ON ?auto_627371 ?auto_627372 ) ( ON ?auto_627370 ?auto_627371 ) ( ON ?auto_627369 ?auto_627370 ) ( ON ?auto_627368 ?auto_627369 ) ( ON ?auto_627367 ?auto_627368 ) ( ON ?auto_627366 ?auto_627367 ) ( ON ?auto_627365 ?auto_627366 ) ( ON ?auto_627364 ?auto_627365 ) ( ON ?auto_627363 ?auto_627364 ) ( ON ?auto_627362 ?auto_627363 ) ( CLEAR ?auto_627360 ) ( ON ?auto_627361 ?auto_627362 ) ( CLEAR ?auto_627361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_627357 ?auto_627358 ?auto_627359 ?auto_627360 ?auto_627361 )
      ( MAKE-17PILE ?auto_627357 ?auto_627358 ?auto_627359 ?auto_627360 ?auto_627361 ?auto_627362 ?auto_627363 ?auto_627364 ?auto_627365 ?auto_627366 ?auto_627367 ?auto_627368 ?auto_627369 ?auto_627370 ?auto_627371 ?auto_627372 ?auto_627373 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627392 - BLOCK
      ?auto_627393 - BLOCK
      ?auto_627394 - BLOCK
      ?auto_627395 - BLOCK
      ?auto_627396 - BLOCK
      ?auto_627397 - BLOCK
      ?auto_627398 - BLOCK
      ?auto_627399 - BLOCK
      ?auto_627400 - BLOCK
      ?auto_627401 - BLOCK
      ?auto_627402 - BLOCK
      ?auto_627403 - BLOCK
      ?auto_627404 - BLOCK
      ?auto_627405 - BLOCK
      ?auto_627406 - BLOCK
      ?auto_627407 - BLOCK
      ?auto_627408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627408 ) ( ON-TABLE ?auto_627392 ) ( ON ?auto_627393 ?auto_627392 ) ( ON ?auto_627394 ?auto_627393 ) ( ON ?auto_627395 ?auto_627394 ) ( not ( = ?auto_627392 ?auto_627393 ) ) ( not ( = ?auto_627392 ?auto_627394 ) ) ( not ( = ?auto_627392 ?auto_627395 ) ) ( not ( = ?auto_627392 ?auto_627396 ) ) ( not ( = ?auto_627392 ?auto_627397 ) ) ( not ( = ?auto_627392 ?auto_627398 ) ) ( not ( = ?auto_627392 ?auto_627399 ) ) ( not ( = ?auto_627392 ?auto_627400 ) ) ( not ( = ?auto_627392 ?auto_627401 ) ) ( not ( = ?auto_627392 ?auto_627402 ) ) ( not ( = ?auto_627392 ?auto_627403 ) ) ( not ( = ?auto_627392 ?auto_627404 ) ) ( not ( = ?auto_627392 ?auto_627405 ) ) ( not ( = ?auto_627392 ?auto_627406 ) ) ( not ( = ?auto_627392 ?auto_627407 ) ) ( not ( = ?auto_627392 ?auto_627408 ) ) ( not ( = ?auto_627393 ?auto_627394 ) ) ( not ( = ?auto_627393 ?auto_627395 ) ) ( not ( = ?auto_627393 ?auto_627396 ) ) ( not ( = ?auto_627393 ?auto_627397 ) ) ( not ( = ?auto_627393 ?auto_627398 ) ) ( not ( = ?auto_627393 ?auto_627399 ) ) ( not ( = ?auto_627393 ?auto_627400 ) ) ( not ( = ?auto_627393 ?auto_627401 ) ) ( not ( = ?auto_627393 ?auto_627402 ) ) ( not ( = ?auto_627393 ?auto_627403 ) ) ( not ( = ?auto_627393 ?auto_627404 ) ) ( not ( = ?auto_627393 ?auto_627405 ) ) ( not ( = ?auto_627393 ?auto_627406 ) ) ( not ( = ?auto_627393 ?auto_627407 ) ) ( not ( = ?auto_627393 ?auto_627408 ) ) ( not ( = ?auto_627394 ?auto_627395 ) ) ( not ( = ?auto_627394 ?auto_627396 ) ) ( not ( = ?auto_627394 ?auto_627397 ) ) ( not ( = ?auto_627394 ?auto_627398 ) ) ( not ( = ?auto_627394 ?auto_627399 ) ) ( not ( = ?auto_627394 ?auto_627400 ) ) ( not ( = ?auto_627394 ?auto_627401 ) ) ( not ( = ?auto_627394 ?auto_627402 ) ) ( not ( = ?auto_627394 ?auto_627403 ) ) ( not ( = ?auto_627394 ?auto_627404 ) ) ( not ( = ?auto_627394 ?auto_627405 ) ) ( not ( = ?auto_627394 ?auto_627406 ) ) ( not ( = ?auto_627394 ?auto_627407 ) ) ( not ( = ?auto_627394 ?auto_627408 ) ) ( not ( = ?auto_627395 ?auto_627396 ) ) ( not ( = ?auto_627395 ?auto_627397 ) ) ( not ( = ?auto_627395 ?auto_627398 ) ) ( not ( = ?auto_627395 ?auto_627399 ) ) ( not ( = ?auto_627395 ?auto_627400 ) ) ( not ( = ?auto_627395 ?auto_627401 ) ) ( not ( = ?auto_627395 ?auto_627402 ) ) ( not ( = ?auto_627395 ?auto_627403 ) ) ( not ( = ?auto_627395 ?auto_627404 ) ) ( not ( = ?auto_627395 ?auto_627405 ) ) ( not ( = ?auto_627395 ?auto_627406 ) ) ( not ( = ?auto_627395 ?auto_627407 ) ) ( not ( = ?auto_627395 ?auto_627408 ) ) ( not ( = ?auto_627396 ?auto_627397 ) ) ( not ( = ?auto_627396 ?auto_627398 ) ) ( not ( = ?auto_627396 ?auto_627399 ) ) ( not ( = ?auto_627396 ?auto_627400 ) ) ( not ( = ?auto_627396 ?auto_627401 ) ) ( not ( = ?auto_627396 ?auto_627402 ) ) ( not ( = ?auto_627396 ?auto_627403 ) ) ( not ( = ?auto_627396 ?auto_627404 ) ) ( not ( = ?auto_627396 ?auto_627405 ) ) ( not ( = ?auto_627396 ?auto_627406 ) ) ( not ( = ?auto_627396 ?auto_627407 ) ) ( not ( = ?auto_627396 ?auto_627408 ) ) ( not ( = ?auto_627397 ?auto_627398 ) ) ( not ( = ?auto_627397 ?auto_627399 ) ) ( not ( = ?auto_627397 ?auto_627400 ) ) ( not ( = ?auto_627397 ?auto_627401 ) ) ( not ( = ?auto_627397 ?auto_627402 ) ) ( not ( = ?auto_627397 ?auto_627403 ) ) ( not ( = ?auto_627397 ?auto_627404 ) ) ( not ( = ?auto_627397 ?auto_627405 ) ) ( not ( = ?auto_627397 ?auto_627406 ) ) ( not ( = ?auto_627397 ?auto_627407 ) ) ( not ( = ?auto_627397 ?auto_627408 ) ) ( not ( = ?auto_627398 ?auto_627399 ) ) ( not ( = ?auto_627398 ?auto_627400 ) ) ( not ( = ?auto_627398 ?auto_627401 ) ) ( not ( = ?auto_627398 ?auto_627402 ) ) ( not ( = ?auto_627398 ?auto_627403 ) ) ( not ( = ?auto_627398 ?auto_627404 ) ) ( not ( = ?auto_627398 ?auto_627405 ) ) ( not ( = ?auto_627398 ?auto_627406 ) ) ( not ( = ?auto_627398 ?auto_627407 ) ) ( not ( = ?auto_627398 ?auto_627408 ) ) ( not ( = ?auto_627399 ?auto_627400 ) ) ( not ( = ?auto_627399 ?auto_627401 ) ) ( not ( = ?auto_627399 ?auto_627402 ) ) ( not ( = ?auto_627399 ?auto_627403 ) ) ( not ( = ?auto_627399 ?auto_627404 ) ) ( not ( = ?auto_627399 ?auto_627405 ) ) ( not ( = ?auto_627399 ?auto_627406 ) ) ( not ( = ?auto_627399 ?auto_627407 ) ) ( not ( = ?auto_627399 ?auto_627408 ) ) ( not ( = ?auto_627400 ?auto_627401 ) ) ( not ( = ?auto_627400 ?auto_627402 ) ) ( not ( = ?auto_627400 ?auto_627403 ) ) ( not ( = ?auto_627400 ?auto_627404 ) ) ( not ( = ?auto_627400 ?auto_627405 ) ) ( not ( = ?auto_627400 ?auto_627406 ) ) ( not ( = ?auto_627400 ?auto_627407 ) ) ( not ( = ?auto_627400 ?auto_627408 ) ) ( not ( = ?auto_627401 ?auto_627402 ) ) ( not ( = ?auto_627401 ?auto_627403 ) ) ( not ( = ?auto_627401 ?auto_627404 ) ) ( not ( = ?auto_627401 ?auto_627405 ) ) ( not ( = ?auto_627401 ?auto_627406 ) ) ( not ( = ?auto_627401 ?auto_627407 ) ) ( not ( = ?auto_627401 ?auto_627408 ) ) ( not ( = ?auto_627402 ?auto_627403 ) ) ( not ( = ?auto_627402 ?auto_627404 ) ) ( not ( = ?auto_627402 ?auto_627405 ) ) ( not ( = ?auto_627402 ?auto_627406 ) ) ( not ( = ?auto_627402 ?auto_627407 ) ) ( not ( = ?auto_627402 ?auto_627408 ) ) ( not ( = ?auto_627403 ?auto_627404 ) ) ( not ( = ?auto_627403 ?auto_627405 ) ) ( not ( = ?auto_627403 ?auto_627406 ) ) ( not ( = ?auto_627403 ?auto_627407 ) ) ( not ( = ?auto_627403 ?auto_627408 ) ) ( not ( = ?auto_627404 ?auto_627405 ) ) ( not ( = ?auto_627404 ?auto_627406 ) ) ( not ( = ?auto_627404 ?auto_627407 ) ) ( not ( = ?auto_627404 ?auto_627408 ) ) ( not ( = ?auto_627405 ?auto_627406 ) ) ( not ( = ?auto_627405 ?auto_627407 ) ) ( not ( = ?auto_627405 ?auto_627408 ) ) ( not ( = ?auto_627406 ?auto_627407 ) ) ( not ( = ?auto_627406 ?auto_627408 ) ) ( not ( = ?auto_627407 ?auto_627408 ) ) ( ON ?auto_627407 ?auto_627408 ) ( ON ?auto_627406 ?auto_627407 ) ( ON ?auto_627405 ?auto_627406 ) ( ON ?auto_627404 ?auto_627405 ) ( ON ?auto_627403 ?auto_627404 ) ( ON ?auto_627402 ?auto_627403 ) ( ON ?auto_627401 ?auto_627402 ) ( ON ?auto_627400 ?auto_627401 ) ( ON ?auto_627399 ?auto_627400 ) ( ON ?auto_627398 ?auto_627399 ) ( ON ?auto_627397 ?auto_627398 ) ( CLEAR ?auto_627395 ) ( ON ?auto_627396 ?auto_627397 ) ( CLEAR ?auto_627396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_627392 ?auto_627393 ?auto_627394 ?auto_627395 ?auto_627396 )
      ( MAKE-17PILE ?auto_627392 ?auto_627393 ?auto_627394 ?auto_627395 ?auto_627396 ?auto_627397 ?auto_627398 ?auto_627399 ?auto_627400 ?auto_627401 ?auto_627402 ?auto_627403 ?auto_627404 ?auto_627405 ?auto_627406 ?auto_627407 ?auto_627408 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627426 - BLOCK
      ?auto_627427 - BLOCK
      ?auto_627428 - BLOCK
      ?auto_627429 - BLOCK
      ?auto_627430 - BLOCK
      ?auto_627431 - BLOCK
      ?auto_627432 - BLOCK
      ?auto_627433 - BLOCK
      ?auto_627434 - BLOCK
      ?auto_627435 - BLOCK
      ?auto_627436 - BLOCK
      ?auto_627437 - BLOCK
      ?auto_627438 - BLOCK
      ?auto_627439 - BLOCK
      ?auto_627440 - BLOCK
      ?auto_627441 - BLOCK
      ?auto_627442 - BLOCK
    )
    :vars
    (
      ?auto_627443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627442 ?auto_627443 ) ( ON-TABLE ?auto_627426 ) ( ON ?auto_627427 ?auto_627426 ) ( ON ?auto_627428 ?auto_627427 ) ( not ( = ?auto_627426 ?auto_627427 ) ) ( not ( = ?auto_627426 ?auto_627428 ) ) ( not ( = ?auto_627426 ?auto_627429 ) ) ( not ( = ?auto_627426 ?auto_627430 ) ) ( not ( = ?auto_627426 ?auto_627431 ) ) ( not ( = ?auto_627426 ?auto_627432 ) ) ( not ( = ?auto_627426 ?auto_627433 ) ) ( not ( = ?auto_627426 ?auto_627434 ) ) ( not ( = ?auto_627426 ?auto_627435 ) ) ( not ( = ?auto_627426 ?auto_627436 ) ) ( not ( = ?auto_627426 ?auto_627437 ) ) ( not ( = ?auto_627426 ?auto_627438 ) ) ( not ( = ?auto_627426 ?auto_627439 ) ) ( not ( = ?auto_627426 ?auto_627440 ) ) ( not ( = ?auto_627426 ?auto_627441 ) ) ( not ( = ?auto_627426 ?auto_627442 ) ) ( not ( = ?auto_627426 ?auto_627443 ) ) ( not ( = ?auto_627427 ?auto_627428 ) ) ( not ( = ?auto_627427 ?auto_627429 ) ) ( not ( = ?auto_627427 ?auto_627430 ) ) ( not ( = ?auto_627427 ?auto_627431 ) ) ( not ( = ?auto_627427 ?auto_627432 ) ) ( not ( = ?auto_627427 ?auto_627433 ) ) ( not ( = ?auto_627427 ?auto_627434 ) ) ( not ( = ?auto_627427 ?auto_627435 ) ) ( not ( = ?auto_627427 ?auto_627436 ) ) ( not ( = ?auto_627427 ?auto_627437 ) ) ( not ( = ?auto_627427 ?auto_627438 ) ) ( not ( = ?auto_627427 ?auto_627439 ) ) ( not ( = ?auto_627427 ?auto_627440 ) ) ( not ( = ?auto_627427 ?auto_627441 ) ) ( not ( = ?auto_627427 ?auto_627442 ) ) ( not ( = ?auto_627427 ?auto_627443 ) ) ( not ( = ?auto_627428 ?auto_627429 ) ) ( not ( = ?auto_627428 ?auto_627430 ) ) ( not ( = ?auto_627428 ?auto_627431 ) ) ( not ( = ?auto_627428 ?auto_627432 ) ) ( not ( = ?auto_627428 ?auto_627433 ) ) ( not ( = ?auto_627428 ?auto_627434 ) ) ( not ( = ?auto_627428 ?auto_627435 ) ) ( not ( = ?auto_627428 ?auto_627436 ) ) ( not ( = ?auto_627428 ?auto_627437 ) ) ( not ( = ?auto_627428 ?auto_627438 ) ) ( not ( = ?auto_627428 ?auto_627439 ) ) ( not ( = ?auto_627428 ?auto_627440 ) ) ( not ( = ?auto_627428 ?auto_627441 ) ) ( not ( = ?auto_627428 ?auto_627442 ) ) ( not ( = ?auto_627428 ?auto_627443 ) ) ( not ( = ?auto_627429 ?auto_627430 ) ) ( not ( = ?auto_627429 ?auto_627431 ) ) ( not ( = ?auto_627429 ?auto_627432 ) ) ( not ( = ?auto_627429 ?auto_627433 ) ) ( not ( = ?auto_627429 ?auto_627434 ) ) ( not ( = ?auto_627429 ?auto_627435 ) ) ( not ( = ?auto_627429 ?auto_627436 ) ) ( not ( = ?auto_627429 ?auto_627437 ) ) ( not ( = ?auto_627429 ?auto_627438 ) ) ( not ( = ?auto_627429 ?auto_627439 ) ) ( not ( = ?auto_627429 ?auto_627440 ) ) ( not ( = ?auto_627429 ?auto_627441 ) ) ( not ( = ?auto_627429 ?auto_627442 ) ) ( not ( = ?auto_627429 ?auto_627443 ) ) ( not ( = ?auto_627430 ?auto_627431 ) ) ( not ( = ?auto_627430 ?auto_627432 ) ) ( not ( = ?auto_627430 ?auto_627433 ) ) ( not ( = ?auto_627430 ?auto_627434 ) ) ( not ( = ?auto_627430 ?auto_627435 ) ) ( not ( = ?auto_627430 ?auto_627436 ) ) ( not ( = ?auto_627430 ?auto_627437 ) ) ( not ( = ?auto_627430 ?auto_627438 ) ) ( not ( = ?auto_627430 ?auto_627439 ) ) ( not ( = ?auto_627430 ?auto_627440 ) ) ( not ( = ?auto_627430 ?auto_627441 ) ) ( not ( = ?auto_627430 ?auto_627442 ) ) ( not ( = ?auto_627430 ?auto_627443 ) ) ( not ( = ?auto_627431 ?auto_627432 ) ) ( not ( = ?auto_627431 ?auto_627433 ) ) ( not ( = ?auto_627431 ?auto_627434 ) ) ( not ( = ?auto_627431 ?auto_627435 ) ) ( not ( = ?auto_627431 ?auto_627436 ) ) ( not ( = ?auto_627431 ?auto_627437 ) ) ( not ( = ?auto_627431 ?auto_627438 ) ) ( not ( = ?auto_627431 ?auto_627439 ) ) ( not ( = ?auto_627431 ?auto_627440 ) ) ( not ( = ?auto_627431 ?auto_627441 ) ) ( not ( = ?auto_627431 ?auto_627442 ) ) ( not ( = ?auto_627431 ?auto_627443 ) ) ( not ( = ?auto_627432 ?auto_627433 ) ) ( not ( = ?auto_627432 ?auto_627434 ) ) ( not ( = ?auto_627432 ?auto_627435 ) ) ( not ( = ?auto_627432 ?auto_627436 ) ) ( not ( = ?auto_627432 ?auto_627437 ) ) ( not ( = ?auto_627432 ?auto_627438 ) ) ( not ( = ?auto_627432 ?auto_627439 ) ) ( not ( = ?auto_627432 ?auto_627440 ) ) ( not ( = ?auto_627432 ?auto_627441 ) ) ( not ( = ?auto_627432 ?auto_627442 ) ) ( not ( = ?auto_627432 ?auto_627443 ) ) ( not ( = ?auto_627433 ?auto_627434 ) ) ( not ( = ?auto_627433 ?auto_627435 ) ) ( not ( = ?auto_627433 ?auto_627436 ) ) ( not ( = ?auto_627433 ?auto_627437 ) ) ( not ( = ?auto_627433 ?auto_627438 ) ) ( not ( = ?auto_627433 ?auto_627439 ) ) ( not ( = ?auto_627433 ?auto_627440 ) ) ( not ( = ?auto_627433 ?auto_627441 ) ) ( not ( = ?auto_627433 ?auto_627442 ) ) ( not ( = ?auto_627433 ?auto_627443 ) ) ( not ( = ?auto_627434 ?auto_627435 ) ) ( not ( = ?auto_627434 ?auto_627436 ) ) ( not ( = ?auto_627434 ?auto_627437 ) ) ( not ( = ?auto_627434 ?auto_627438 ) ) ( not ( = ?auto_627434 ?auto_627439 ) ) ( not ( = ?auto_627434 ?auto_627440 ) ) ( not ( = ?auto_627434 ?auto_627441 ) ) ( not ( = ?auto_627434 ?auto_627442 ) ) ( not ( = ?auto_627434 ?auto_627443 ) ) ( not ( = ?auto_627435 ?auto_627436 ) ) ( not ( = ?auto_627435 ?auto_627437 ) ) ( not ( = ?auto_627435 ?auto_627438 ) ) ( not ( = ?auto_627435 ?auto_627439 ) ) ( not ( = ?auto_627435 ?auto_627440 ) ) ( not ( = ?auto_627435 ?auto_627441 ) ) ( not ( = ?auto_627435 ?auto_627442 ) ) ( not ( = ?auto_627435 ?auto_627443 ) ) ( not ( = ?auto_627436 ?auto_627437 ) ) ( not ( = ?auto_627436 ?auto_627438 ) ) ( not ( = ?auto_627436 ?auto_627439 ) ) ( not ( = ?auto_627436 ?auto_627440 ) ) ( not ( = ?auto_627436 ?auto_627441 ) ) ( not ( = ?auto_627436 ?auto_627442 ) ) ( not ( = ?auto_627436 ?auto_627443 ) ) ( not ( = ?auto_627437 ?auto_627438 ) ) ( not ( = ?auto_627437 ?auto_627439 ) ) ( not ( = ?auto_627437 ?auto_627440 ) ) ( not ( = ?auto_627437 ?auto_627441 ) ) ( not ( = ?auto_627437 ?auto_627442 ) ) ( not ( = ?auto_627437 ?auto_627443 ) ) ( not ( = ?auto_627438 ?auto_627439 ) ) ( not ( = ?auto_627438 ?auto_627440 ) ) ( not ( = ?auto_627438 ?auto_627441 ) ) ( not ( = ?auto_627438 ?auto_627442 ) ) ( not ( = ?auto_627438 ?auto_627443 ) ) ( not ( = ?auto_627439 ?auto_627440 ) ) ( not ( = ?auto_627439 ?auto_627441 ) ) ( not ( = ?auto_627439 ?auto_627442 ) ) ( not ( = ?auto_627439 ?auto_627443 ) ) ( not ( = ?auto_627440 ?auto_627441 ) ) ( not ( = ?auto_627440 ?auto_627442 ) ) ( not ( = ?auto_627440 ?auto_627443 ) ) ( not ( = ?auto_627441 ?auto_627442 ) ) ( not ( = ?auto_627441 ?auto_627443 ) ) ( not ( = ?auto_627442 ?auto_627443 ) ) ( ON ?auto_627441 ?auto_627442 ) ( ON ?auto_627440 ?auto_627441 ) ( ON ?auto_627439 ?auto_627440 ) ( ON ?auto_627438 ?auto_627439 ) ( ON ?auto_627437 ?auto_627438 ) ( ON ?auto_627436 ?auto_627437 ) ( ON ?auto_627435 ?auto_627436 ) ( ON ?auto_627434 ?auto_627435 ) ( ON ?auto_627433 ?auto_627434 ) ( ON ?auto_627432 ?auto_627433 ) ( ON ?auto_627431 ?auto_627432 ) ( ON ?auto_627430 ?auto_627431 ) ( CLEAR ?auto_627428 ) ( ON ?auto_627429 ?auto_627430 ) ( CLEAR ?auto_627429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_627426 ?auto_627427 ?auto_627428 ?auto_627429 )
      ( MAKE-17PILE ?auto_627426 ?auto_627427 ?auto_627428 ?auto_627429 ?auto_627430 ?auto_627431 ?auto_627432 ?auto_627433 ?auto_627434 ?auto_627435 ?auto_627436 ?auto_627437 ?auto_627438 ?auto_627439 ?auto_627440 ?auto_627441 ?auto_627442 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627461 - BLOCK
      ?auto_627462 - BLOCK
      ?auto_627463 - BLOCK
      ?auto_627464 - BLOCK
      ?auto_627465 - BLOCK
      ?auto_627466 - BLOCK
      ?auto_627467 - BLOCK
      ?auto_627468 - BLOCK
      ?auto_627469 - BLOCK
      ?auto_627470 - BLOCK
      ?auto_627471 - BLOCK
      ?auto_627472 - BLOCK
      ?auto_627473 - BLOCK
      ?auto_627474 - BLOCK
      ?auto_627475 - BLOCK
      ?auto_627476 - BLOCK
      ?auto_627477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627477 ) ( ON-TABLE ?auto_627461 ) ( ON ?auto_627462 ?auto_627461 ) ( ON ?auto_627463 ?auto_627462 ) ( not ( = ?auto_627461 ?auto_627462 ) ) ( not ( = ?auto_627461 ?auto_627463 ) ) ( not ( = ?auto_627461 ?auto_627464 ) ) ( not ( = ?auto_627461 ?auto_627465 ) ) ( not ( = ?auto_627461 ?auto_627466 ) ) ( not ( = ?auto_627461 ?auto_627467 ) ) ( not ( = ?auto_627461 ?auto_627468 ) ) ( not ( = ?auto_627461 ?auto_627469 ) ) ( not ( = ?auto_627461 ?auto_627470 ) ) ( not ( = ?auto_627461 ?auto_627471 ) ) ( not ( = ?auto_627461 ?auto_627472 ) ) ( not ( = ?auto_627461 ?auto_627473 ) ) ( not ( = ?auto_627461 ?auto_627474 ) ) ( not ( = ?auto_627461 ?auto_627475 ) ) ( not ( = ?auto_627461 ?auto_627476 ) ) ( not ( = ?auto_627461 ?auto_627477 ) ) ( not ( = ?auto_627462 ?auto_627463 ) ) ( not ( = ?auto_627462 ?auto_627464 ) ) ( not ( = ?auto_627462 ?auto_627465 ) ) ( not ( = ?auto_627462 ?auto_627466 ) ) ( not ( = ?auto_627462 ?auto_627467 ) ) ( not ( = ?auto_627462 ?auto_627468 ) ) ( not ( = ?auto_627462 ?auto_627469 ) ) ( not ( = ?auto_627462 ?auto_627470 ) ) ( not ( = ?auto_627462 ?auto_627471 ) ) ( not ( = ?auto_627462 ?auto_627472 ) ) ( not ( = ?auto_627462 ?auto_627473 ) ) ( not ( = ?auto_627462 ?auto_627474 ) ) ( not ( = ?auto_627462 ?auto_627475 ) ) ( not ( = ?auto_627462 ?auto_627476 ) ) ( not ( = ?auto_627462 ?auto_627477 ) ) ( not ( = ?auto_627463 ?auto_627464 ) ) ( not ( = ?auto_627463 ?auto_627465 ) ) ( not ( = ?auto_627463 ?auto_627466 ) ) ( not ( = ?auto_627463 ?auto_627467 ) ) ( not ( = ?auto_627463 ?auto_627468 ) ) ( not ( = ?auto_627463 ?auto_627469 ) ) ( not ( = ?auto_627463 ?auto_627470 ) ) ( not ( = ?auto_627463 ?auto_627471 ) ) ( not ( = ?auto_627463 ?auto_627472 ) ) ( not ( = ?auto_627463 ?auto_627473 ) ) ( not ( = ?auto_627463 ?auto_627474 ) ) ( not ( = ?auto_627463 ?auto_627475 ) ) ( not ( = ?auto_627463 ?auto_627476 ) ) ( not ( = ?auto_627463 ?auto_627477 ) ) ( not ( = ?auto_627464 ?auto_627465 ) ) ( not ( = ?auto_627464 ?auto_627466 ) ) ( not ( = ?auto_627464 ?auto_627467 ) ) ( not ( = ?auto_627464 ?auto_627468 ) ) ( not ( = ?auto_627464 ?auto_627469 ) ) ( not ( = ?auto_627464 ?auto_627470 ) ) ( not ( = ?auto_627464 ?auto_627471 ) ) ( not ( = ?auto_627464 ?auto_627472 ) ) ( not ( = ?auto_627464 ?auto_627473 ) ) ( not ( = ?auto_627464 ?auto_627474 ) ) ( not ( = ?auto_627464 ?auto_627475 ) ) ( not ( = ?auto_627464 ?auto_627476 ) ) ( not ( = ?auto_627464 ?auto_627477 ) ) ( not ( = ?auto_627465 ?auto_627466 ) ) ( not ( = ?auto_627465 ?auto_627467 ) ) ( not ( = ?auto_627465 ?auto_627468 ) ) ( not ( = ?auto_627465 ?auto_627469 ) ) ( not ( = ?auto_627465 ?auto_627470 ) ) ( not ( = ?auto_627465 ?auto_627471 ) ) ( not ( = ?auto_627465 ?auto_627472 ) ) ( not ( = ?auto_627465 ?auto_627473 ) ) ( not ( = ?auto_627465 ?auto_627474 ) ) ( not ( = ?auto_627465 ?auto_627475 ) ) ( not ( = ?auto_627465 ?auto_627476 ) ) ( not ( = ?auto_627465 ?auto_627477 ) ) ( not ( = ?auto_627466 ?auto_627467 ) ) ( not ( = ?auto_627466 ?auto_627468 ) ) ( not ( = ?auto_627466 ?auto_627469 ) ) ( not ( = ?auto_627466 ?auto_627470 ) ) ( not ( = ?auto_627466 ?auto_627471 ) ) ( not ( = ?auto_627466 ?auto_627472 ) ) ( not ( = ?auto_627466 ?auto_627473 ) ) ( not ( = ?auto_627466 ?auto_627474 ) ) ( not ( = ?auto_627466 ?auto_627475 ) ) ( not ( = ?auto_627466 ?auto_627476 ) ) ( not ( = ?auto_627466 ?auto_627477 ) ) ( not ( = ?auto_627467 ?auto_627468 ) ) ( not ( = ?auto_627467 ?auto_627469 ) ) ( not ( = ?auto_627467 ?auto_627470 ) ) ( not ( = ?auto_627467 ?auto_627471 ) ) ( not ( = ?auto_627467 ?auto_627472 ) ) ( not ( = ?auto_627467 ?auto_627473 ) ) ( not ( = ?auto_627467 ?auto_627474 ) ) ( not ( = ?auto_627467 ?auto_627475 ) ) ( not ( = ?auto_627467 ?auto_627476 ) ) ( not ( = ?auto_627467 ?auto_627477 ) ) ( not ( = ?auto_627468 ?auto_627469 ) ) ( not ( = ?auto_627468 ?auto_627470 ) ) ( not ( = ?auto_627468 ?auto_627471 ) ) ( not ( = ?auto_627468 ?auto_627472 ) ) ( not ( = ?auto_627468 ?auto_627473 ) ) ( not ( = ?auto_627468 ?auto_627474 ) ) ( not ( = ?auto_627468 ?auto_627475 ) ) ( not ( = ?auto_627468 ?auto_627476 ) ) ( not ( = ?auto_627468 ?auto_627477 ) ) ( not ( = ?auto_627469 ?auto_627470 ) ) ( not ( = ?auto_627469 ?auto_627471 ) ) ( not ( = ?auto_627469 ?auto_627472 ) ) ( not ( = ?auto_627469 ?auto_627473 ) ) ( not ( = ?auto_627469 ?auto_627474 ) ) ( not ( = ?auto_627469 ?auto_627475 ) ) ( not ( = ?auto_627469 ?auto_627476 ) ) ( not ( = ?auto_627469 ?auto_627477 ) ) ( not ( = ?auto_627470 ?auto_627471 ) ) ( not ( = ?auto_627470 ?auto_627472 ) ) ( not ( = ?auto_627470 ?auto_627473 ) ) ( not ( = ?auto_627470 ?auto_627474 ) ) ( not ( = ?auto_627470 ?auto_627475 ) ) ( not ( = ?auto_627470 ?auto_627476 ) ) ( not ( = ?auto_627470 ?auto_627477 ) ) ( not ( = ?auto_627471 ?auto_627472 ) ) ( not ( = ?auto_627471 ?auto_627473 ) ) ( not ( = ?auto_627471 ?auto_627474 ) ) ( not ( = ?auto_627471 ?auto_627475 ) ) ( not ( = ?auto_627471 ?auto_627476 ) ) ( not ( = ?auto_627471 ?auto_627477 ) ) ( not ( = ?auto_627472 ?auto_627473 ) ) ( not ( = ?auto_627472 ?auto_627474 ) ) ( not ( = ?auto_627472 ?auto_627475 ) ) ( not ( = ?auto_627472 ?auto_627476 ) ) ( not ( = ?auto_627472 ?auto_627477 ) ) ( not ( = ?auto_627473 ?auto_627474 ) ) ( not ( = ?auto_627473 ?auto_627475 ) ) ( not ( = ?auto_627473 ?auto_627476 ) ) ( not ( = ?auto_627473 ?auto_627477 ) ) ( not ( = ?auto_627474 ?auto_627475 ) ) ( not ( = ?auto_627474 ?auto_627476 ) ) ( not ( = ?auto_627474 ?auto_627477 ) ) ( not ( = ?auto_627475 ?auto_627476 ) ) ( not ( = ?auto_627475 ?auto_627477 ) ) ( not ( = ?auto_627476 ?auto_627477 ) ) ( ON ?auto_627476 ?auto_627477 ) ( ON ?auto_627475 ?auto_627476 ) ( ON ?auto_627474 ?auto_627475 ) ( ON ?auto_627473 ?auto_627474 ) ( ON ?auto_627472 ?auto_627473 ) ( ON ?auto_627471 ?auto_627472 ) ( ON ?auto_627470 ?auto_627471 ) ( ON ?auto_627469 ?auto_627470 ) ( ON ?auto_627468 ?auto_627469 ) ( ON ?auto_627467 ?auto_627468 ) ( ON ?auto_627466 ?auto_627467 ) ( ON ?auto_627465 ?auto_627466 ) ( CLEAR ?auto_627463 ) ( ON ?auto_627464 ?auto_627465 ) ( CLEAR ?auto_627464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_627461 ?auto_627462 ?auto_627463 ?auto_627464 )
      ( MAKE-17PILE ?auto_627461 ?auto_627462 ?auto_627463 ?auto_627464 ?auto_627465 ?auto_627466 ?auto_627467 ?auto_627468 ?auto_627469 ?auto_627470 ?auto_627471 ?auto_627472 ?auto_627473 ?auto_627474 ?auto_627475 ?auto_627476 ?auto_627477 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627495 - BLOCK
      ?auto_627496 - BLOCK
      ?auto_627497 - BLOCK
      ?auto_627498 - BLOCK
      ?auto_627499 - BLOCK
      ?auto_627500 - BLOCK
      ?auto_627501 - BLOCK
      ?auto_627502 - BLOCK
      ?auto_627503 - BLOCK
      ?auto_627504 - BLOCK
      ?auto_627505 - BLOCK
      ?auto_627506 - BLOCK
      ?auto_627507 - BLOCK
      ?auto_627508 - BLOCK
      ?auto_627509 - BLOCK
      ?auto_627510 - BLOCK
      ?auto_627511 - BLOCK
    )
    :vars
    (
      ?auto_627512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627511 ?auto_627512 ) ( ON-TABLE ?auto_627495 ) ( ON ?auto_627496 ?auto_627495 ) ( not ( = ?auto_627495 ?auto_627496 ) ) ( not ( = ?auto_627495 ?auto_627497 ) ) ( not ( = ?auto_627495 ?auto_627498 ) ) ( not ( = ?auto_627495 ?auto_627499 ) ) ( not ( = ?auto_627495 ?auto_627500 ) ) ( not ( = ?auto_627495 ?auto_627501 ) ) ( not ( = ?auto_627495 ?auto_627502 ) ) ( not ( = ?auto_627495 ?auto_627503 ) ) ( not ( = ?auto_627495 ?auto_627504 ) ) ( not ( = ?auto_627495 ?auto_627505 ) ) ( not ( = ?auto_627495 ?auto_627506 ) ) ( not ( = ?auto_627495 ?auto_627507 ) ) ( not ( = ?auto_627495 ?auto_627508 ) ) ( not ( = ?auto_627495 ?auto_627509 ) ) ( not ( = ?auto_627495 ?auto_627510 ) ) ( not ( = ?auto_627495 ?auto_627511 ) ) ( not ( = ?auto_627495 ?auto_627512 ) ) ( not ( = ?auto_627496 ?auto_627497 ) ) ( not ( = ?auto_627496 ?auto_627498 ) ) ( not ( = ?auto_627496 ?auto_627499 ) ) ( not ( = ?auto_627496 ?auto_627500 ) ) ( not ( = ?auto_627496 ?auto_627501 ) ) ( not ( = ?auto_627496 ?auto_627502 ) ) ( not ( = ?auto_627496 ?auto_627503 ) ) ( not ( = ?auto_627496 ?auto_627504 ) ) ( not ( = ?auto_627496 ?auto_627505 ) ) ( not ( = ?auto_627496 ?auto_627506 ) ) ( not ( = ?auto_627496 ?auto_627507 ) ) ( not ( = ?auto_627496 ?auto_627508 ) ) ( not ( = ?auto_627496 ?auto_627509 ) ) ( not ( = ?auto_627496 ?auto_627510 ) ) ( not ( = ?auto_627496 ?auto_627511 ) ) ( not ( = ?auto_627496 ?auto_627512 ) ) ( not ( = ?auto_627497 ?auto_627498 ) ) ( not ( = ?auto_627497 ?auto_627499 ) ) ( not ( = ?auto_627497 ?auto_627500 ) ) ( not ( = ?auto_627497 ?auto_627501 ) ) ( not ( = ?auto_627497 ?auto_627502 ) ) ( not ( = ?auto_627497 ?auto_627503 ) ) ( not ( = ?auto_627497 ?auto_627504 ) ) ( not ( = ?auto_627497 ?auto_627505 ) ) ( not ( = ?auto_627497 ?auto_627506 ) ) ( not ( = ?auto_627497 ?auto_627507 ) ) ( not ( = ?auto_627497 ?auto_627508 ) ) ( not ( = ?auto_627497 ?auto_627509 ) ) ( not ( = ?auto_627497 ?auto_627510 ) ) ( not ( = ?auto_627497 ?auto_627511 ) ) ( not ( = ?auto_627497 ?auto_627512 ) ) ( not ( = ?auto_627498 ?auto_627499 ) ) ( not ( = ?auto_627498 ?auto_627500 ) ) ( not ( = ?auto_627498 ?auto_627501 ) ) ( not ( = ?auto_627498 ?auto_627502 ) ) ( not ( = ?auto_627498 ?auto_627503 ) ) ( not ( = ?auto_627498 ?auto_627504 ) ) ( not ( = ?auto_627498 ?auto_627505 ) ) ( not ( = ?auto_627498 ?auto_627506 ) ) ( not ( = ?auto_627498 ?auto_627507 ) ) ( not ( = ?auto_627498 ?auto_627508 ) ) ( not ( = ?auto_627498 ?auto_627509 ) ) ( not ( = ?auto_627498 ?auto_627510 ) ) ( not ( = ?auto_627498 ?auto_627511 ) ) ( not ( = ?auto_627498 ?auto_627512 ) ) ( not ( = ?auto_627499 ?auto_627500 ) ) ( not ( = ?auto_627499 ?auto_627501 ) ) ( not ( = ?auto_627499 ?auto_627502 ) ) ( not ( = ?auto_627499 ?auto_627503 ) ) ( not ( = ?auto_627499 ?auto_627504 ) ) ( not ( = ?auto_627499 ?auto_627505 ) ) ( not ( = ?auto_627499 ?auto_627506 ) ) ( not ( = ?auto_627499 ?auto_627507 ) ) ( not ( = ?auto_627499 ?auto_627508 ) ) ( not ( = ?auto_627499 ?auto_627509 ) ) ( not ( = ?auto_627499 ?auto_627510 ) ) ( not ( = ?auto_627499 ?auto_627511 ) ) ( not ( = ?auto_627499 ?auto_627512 ) ) ( not ( = ?auto_627500 ?auto_627501 ) ) ( not ( = ?auto_627500 ?auto_627502 ) ) ( not ( = ?auto_627500 ?auto_627503 ) ) ( not ( = ?auto_627500 ?auto_627504 ) ) ( not ( = ?auto_627500 ?auto_627505 ) ) ( not ( = ?auto_627500 ?auto_627506 ) ) ( not ( = ?auto_627500 ?auto_627507 ) ) ( not ( = ?auto_627500 ?auto_627508 ) ) ( not ( = ?auto_627500 ?auto_627509 ) ) ( not ( = ?auto_627500 ?auto_627510 ) ) ( not ( = ?auto_627500 ?auto_627511 ) ) ( not ( = ?auto_627500 ?auto_627512 ) ) ( not ( = ?auto_627501 ?auto_627502 ) ) ( not ( = ?auto_627501 ?auto_627503 ) ) ( not ( = ?auto_627501 ?auto_627504 ) ) ( not ( = ?auto_627501 ?auto_627505 ) ) ( not ( = ?auto_627501 ?auto_627506 ) ) ( not ( = ?auto_627501 ?auto_627507 ) ) ( not ( = ?auto_627501 ?auto_627508 ) ) ( not ( = ?auto_627501 ?auto_627509 ) ) ( not ( = ?auto_627501 ?auto_627510 ) ) ( not ( = ?auto_627501 ?auto_627511 ) ) ( not ( = ?auto_627501 ?auto_627512 ) ) ( not ( = ?auto_627502 ?auto_627503 ) ) ( not ( = ?auto_627502 ?auto_627504 ) ) ( not ( = ?auto_627502 ?auto_627505 ) ) ( not ( = ?auto_627502 ?auto_627506 ) ) ( not ( = ?auto_627502 ?auto_627507 ) ) ( not ( = ?auto_627502 ?auto_627508 ) ) ( not ( = ?auto_627502 ?auto_627509 ) ) ( not ( = ?auto_627502 ?auto_627510 ) ) ( not ( = ?auto_627502 ?auto_627511 ) ) ( not ( = ?auto_627502 ?auto_627512 ) ) ( not ( = ?auto_627503 ?auto_627504 ) ) ( not ( = ?auto_627503 ?auto_627505 ) ) ( not ( = ?auto_627503 ?auto_627506 ) ) ( not ( = ?auto_627503 ?auto_627507 ) ) ( not ( = ?auto_627503 ?auto_627508 ) ) ( not ( = ?auto_627503 ?auto_627509 ) ) ( not ( = ?auto_627503 ?auto_627510 ) ) ( not ( = ?auto_627503 ?auto_627511 ) ) ( not ( = ?auto_627503 ?auto_627512 ) ) ( not ( = ?auto_627504 ?auto_627505 ) ) ( not ( = ?auto_627504 ?auto_627506 ) ) ( not ( = ?auto_627504 ?auto_627507 ) ) ( not ( = ?auto_627504 ?auto_627508 ) ) ( not ( = ?auto_627504 ?auto_627509 ) ) ( not ( = ?auto_627504 ?auto_627510 ) ) ( not ( = ?auto_627504 ?auto_627511 ) ) ( not ( = ?auto_627504 ?auto_627512 ) ) ( not ( = ?auto_627505 ?auto_627506 ) ) ( not ( = ?auto_627505 ?auto_627507 ) ) ( not ( = ?auto_627505 ?auto_627508 ) ) ( not ( = ?auto_627505 ?auto_627509 ) ) ( not ( = ?auto_627505 ?auto_627510 ) ) ( not ( = ?auto_627505 ?auto_627511 ) ) ( not ( = ?auto_627505 ?auto_627512 ) ) ( not ( = ?auto_627506 ?auto_627507 ) ) ( not ( = ?auto_627506 ?auto_627508 ) ) ( not ( = ?auto_627506 ?auto_627509 ) ) ( not ( = ?auto_627506 ?auto_627510 ) ) ( not ( = ?auto_627506 ?auto_627511 ) ) ( not ( = ?auto_627506 ?auto_627512 ) ) ( not ( = ?auto_627507 ?auto_627508 ) ) ( not ( = ?auto_627507 ?auto_627509 ) ) ( not ( = ?auto_627507 ?auto_627510 ) ) ( not ( = ?auto_627507 ?auto_627511 ) ) ( not ( = ?auto_627507 ?auto_627512 ) ) ( not ( = ?auto_627508 ?auto_627509 ) ) ( not ( = ?auto_627508 ?auto_627510 ) ) ( not ( = ?auto_627508 ?auto_627511 ) ) ( not ( = ?auto_627508 ?auto_627512 ) ) ( not ( = ?auto_627509 ?auto_627510 ) ) ( not ( = ?auto_627509 ?auto_627511 ) ) ( not ( = ?auto_627509 ?auto_627512 ) ) ( not ( = ?auto_627510 ?auto_627511 ) ) ( not ( = ?auto_627510 ?auto_627512 ) ) ( not ( = ?auto_627511 ?auto_627512 ) ) ( ON ?auto_627510 ?auto_627511 ) ( ON ?auto_627509 ?auto_627510 ) ( ON ?auto_627508 ?auto_627509 ) ( ON ?auto_627507 ?auto_627508 ) ( ON ?auto_627506 ?auto_627507 ) ( ON ?auto_627505 ?auto_627506 ) ( ON ?auto_627504 ?auto_627505 ) ( ON ?auto_627503 ?auto_627504 ) ( ON ?auto_627502 ?auto_627503 ) ( ON ?auto_627501 ?auto_627502 ) ( ON ?auto_627500 ?auto_627501 ) ( ON ?auto_627499 ?auto_627500 ) ( ON ?auto_627498 ?auto_627499 ) ( CLEAR ?auto_627496 ) ( ON ?auto_627497 ?auto_627498 ) ( CLEAR ?auto_627497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_627495 ?auto_627496 ?auto_627497 )
      ( MAKE-17PILE ?auto_627495 ?auto_627496 ?auto_627497 ?auto_627498 ?auto_627499 ?auto_627500 ?auto_627501 ?auto_627502 ?auto_627503 ?auto_627504 ?auto_627505 ?auto_627506 ?auto_627507 ?auto_627508 ?auto_627509 ?auto_627510 ?auto_627511 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627530 - BLOCK
      ?auto_627531 - BLOCK
      ?auto_627532 - BLOCK
      ?auto_627533 - BLOCK
      ?auto_627534 - BLOCK
      ?auto_627535 - BLOCK
      ?auto_627536 - BLOCK
      ?auto_627537 - BLOCK
      ?auto_627538 - BLOCK
      ?auto_627539 - BLOCK
      ?auto_627540 - BLOCK
      ?auto_627541 - BLOCK
      ?auto_627542 - BLOCK
      ?auto_627543 - BLOCK
      ?auto_627544 - BLOCK
      ?auto_627545 - BLOCK
      ?auto_627546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627546 ) ( ON-TABLE ?auto_627530 ) ( ON ?auto_627531 ?auto_627530 ) ( not ( = ?auto_627530 ?auto_627531 ) ) ( not ( = ?auto_627530 ?auto_627532 ) ) ( not ( = ?auto_627530 ?auto_627533 ) ) ( not ( = ?auto_627530 ?auto_627534 ) ) ( not ( = ?auto_627530 ?auto_627535 ) ) ( not ( = ?auto_627530 ?auto_627536 ) ) ( not ( = ?auto_627530 ?auto_627537 ) ) ( not ( = ?auto_627530 ?auto_627538 ) ) ( not ( = ?auto_627530 ?auto_627539 ) ) ( not ( = ?auto_627530 ?auto_627540 ) ) ( not ( = ?auto_627530 ?auto_627541 ) ) ( not ( = ?auto_627530 ?auto_627542 ) ) ( not ( = ?auto_627530 ?auto_627543 ) ) ( not ( = ?auto_627530 ?auto_627544 ) ) ( not ( = ?auto_627530 ?auto_627545 ) ) ( not ( = ?auto_627530 ?auto_627546 ) ) ( not ( = ?auto_627531 ?auto_627532 ) ) ( not ( = ?auto_627531 ?auto_627533 ) ) ( not ( = ?auto_627531 ?auto_627534 ) ) ( not ( = ?auto_627531 ?auto_627535 ) ) ( not ( = ?auto_627531 ?auto_627536 ) ) ( not ( = ?auto_627531 ?auto_627537 ) ) ( not ( = ?auto_627531 ?auto_627538 ) ) ( not ( = ?auto_627531 ?auto_627539 ) ) ( not ( = ?auto_627531 ?auto_627540 ) ) ( not ( = ?auto_627531 ?auto_627541 ) ) ( not ( = ?auto_627531 ?auto_627542 ) ) ( not ( = ?auto_627531 ?auto_627543 ) ) ( not ( = ?auto_627531 ?auto_627544 ) ) ( not ( = ?auto_627531 ?auto_627545 ) ) ( not ( = ?auto_627531 ?auto_627546 ) ) ( not ( = ?auto_627532 ?auto_627533 ) ) ( not ( = ?auto_627532 ?auto_627534 ) ) ( not ( = ?auto_627532 ?auto_627535 ) ) ( not ( = ?auto_627532 ?auto_627536 ) ) ( not ( = ?auto_627532 ?auto_627537 ) ) ( not ( = ?auto_627532 ?auto_627538 ) ) ( not ( = ?auto_627532 ?auto_627539 ) ) ( not ( = ?auto_627532 ?auto_627540 ) ) ( not ( = ?auto_627532 ?auto_627541 ) ) ( not ( = ?auto_627532 ?auto_627542 ) ) ( not ( = ?auto_627532 ?auto_627543 ) ) ( not ( = ?auto_627532 ?auto_627544 ) ) ( not ( = ?auto_627532 ?auto_627545 ) ) ( not ( = ?auto_627532 ?auto_627546 ) ) ( not ( = ?auto_627533 ?auto_627534 ) ) ( not ( = ?auto_627533 ?auto_627535 ) ) ( not ( = ?auto_627533 ?auto_627536 ) ) ( not ( = ?auto_627533 ?auto_627537 ) ) ( not ( = ?auto_627533 ?auto_627538 ) ) ( not ( = ?auto_627533 ?auto_627539 ) ) ( not ( = ?auto_627533 ?auto_627540 ) ) ( not ( = ?auto_627533 ?auto_627541 ) ) ( not ( = ?auto_627533 ?auto_627542 ) ) ( not ( = ?auto_627533 ?auto_627543 ) ) ( not ( = ?auto_627533 ?auto_627544 ) ) ( not ( = ?auto_627533 ?auto_627545 ) ) ( not ( = ?auto_627533 ?auto_627546 ) ) ( not ( = ?auto_627534 ?auto_627535 ) ) ( not ( = ?auto_627534 ?auto_627536 ) ) ( not ( = ?auto_627534 ?auto_627537 ) ) ( not ( = ?auto_627534 ?auto_627538 ) ) ( not ( = ?auto_627534 ?auto_627539 ) ) ( not ( = ?auto_627534 ?auto_627540 ) ) ( not ( = ?auto_627534 ?auto_627541 ) ) ( not ( = ?auto_627534 ?auto_627542 ) ) ( not ( = ?auto_627534 ?auto_627543 ) ) ( not ( = ?auto_627534 ?auto_627544 ) ) ( not ( = ?auto_627534 ?auto_627545 ) ) ( not ( = ?auto_627534 ?auto_627546 ) ) ( not ( = ?auto_627535 ?auto_627536 ) ) ( not ( = ?auto_627535 ?auto_627537 ) ) ( not ( = ?auto_627535 ?auto_627538 ) ) ( not ( = ?auto_627535 ?auto_627539 ) ) ( not ( = ?auto_627535 ?auto_627540 ) ) ( not ( = ?auto_627535 ?auto_627541 ) ) ( not ( = ?auto_627535 ?auto_627542 ) ) ( not ( = ?auto_627535 ?auto_627543 ) ) ( not ( = ?auto_627535 ?auto_627544 ) ) ( not ( = ?auto_627535 ?auto_627545 ) ) ( not ( = ?auto_627535 ?auto_627546 ) ) ( not ( = ?auto_627536 ?auto_627537 ) ) ( not ( = ?auto_627536 ?auto_627538 ) ) ( not ( = ?auto_627536 ?auto_627539 ) ) ( not ( = ?auto_627536 ?auto_627540 ) ) ( not ( = ?auto_627536 ?auto_627541 ) ) ( not ( = ?auto_627536 ?auto_627542 ) ) ( not ( = ?auto_627536 ?auto_627543 ) ) ( not ( = ?auto_627536 ?auto_627544 ) ) ( not ( = ?auto_627536 ?auto_627545 ) ) ( not ( = ?auto_627536 ?auto_627546 ) ) ( not ( = ?auto_627537 ?auto_627538 ) ) ( not ( = ?auto_627537 ?auto_627539 ) ) ( not ( = ?auto_627537 ?auto_627540 ) ) ( not ( = ?auto_627537 ?auto_627541 ) ) ( not ( = ?auto_627537 ?auto_627542 ) ) ( not ( = ?auto_627537 ?auto_627543 ) ) ( not ( = ?auto_627537 ?auto_627544 ) ) ( not ( = ?auto_627537 ?auto_627545 ) ) ( not ( = ?auto_627537 ?auto_627546 ) ) ( not ( = ?auto_627538 ?auto_627539 ) ) ( not ( = ?auto_627538 ?auto_627540 ) ) ( not ( = ?auto_627538 ?auto_627541 ) ) ( not ( = ?auto_627538 ?auto_627542 ) ) ( not ( = ?auto_627538 ?auto_627543 ) ) ( not ( = ?auto_627538 ?auto_627544 ) ) ( not ( = ?auto_627538 ?auto_627545 ) ) ( not ( = ?auto_627538 ?auto_627546 ) ) ( not ( = ?auto_627539 ?auto_627540 ) ) ( not ( = ?auto_627539 ?auto_627541 ) ) ( not ( = ?auto_627539 ?auto_627542 ) ) ( not ( = ?auto_627539 ?auto_627543 ) ) ( not ( = ?auto_627539 ?auto_627544 ) ) ( not ( = ?auto_627539 ?auto_627545 ) ) ( not ( = ?auto_627539 ?auto_627546 ) ) ( not ( = ?auto_627540 ?auto_627541 ) ) ( not ( = ?auto_627540 ?auto_627542 ) ) ( not ( = ?auto_627540 ?auto_627543 ) ) ( not ( = ?auto_627540 ?auto_627544 ) ) ( not ( = ?auto_627540 ?auto_627545 ) ) ( not ( = ?auto_627540 ?auto_627546 ) ) ( not ( = ?auto_627541 ?auto_627542 ) ) ( not ( = ?auto_627541 ?auto_627543 ) ) ( not ( = ?auto_627541 ?auto_627544 ) ) ( not ( = ?auto_627541 ?auto_627545 ) ) ( not ( = ?auto_627541 ?auto_627546 ) ) ( not ( = ?auto_627542 ?auto_627543 ) ) ( not ( = ?auto_627542 ?auto_627544 ) ) ( not ( = ?auto_627542 ?auto_627545 ) ) ( not ( = ?auto_627542 ?auto_627546 ) ) ( not ( = ?auto_627543 ?auto_627544 ) ) ( not ( = ?auto_627543 ?auto_627545 ) ) ( not ( = ?auto_627543 ?auto_627546 ) ) ( not ( = ?auto_627544 ?auto_627545 ) ) ( not ( = ?auto_627544 ?auto_627546 ) ) ( not ( = ?auto_627545 ?auto_627546 ) ) ( ON ?auto_627545 ?auto_627546 ) ( ON ?auto_627544 ?auto_627545 ) ( ON ?auto_627543 ?auto_627544 ) ( ON ?auto_627542 ?auto_627543 ) ( ON ?auto_627541 ?auto_627542 ) ( ON ?auto_627540 ?auto_627541 ) ( ON ?auto_627539 ?auto_627540 ) ( ON ?auto_627538 ?auto_627539 ) ( ON ?auto_627537 ?auto_627538 ) ( ON ?auto_627536 ?auto_627537 ) ( ON ?auto_627535 ?auto_627536 ) ( ON ?auto_627534 ?auto_627535 ) ( ON ?auto_627533 ?auto_627534 ) ( CLEAR ?auto_627531 ) ( ON ?auto_627532 ?auto_627533 ) ( CLEAR ?auto_627532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_627530 ?auto_627531 ?auto_627532 )
      ( MAKE-17PILE ?auto_627530 ?auto_627531 ?auto_627532 ?auto_627533 ?auto_627534 ?auto_627535 ?auto_627536 ?auto_627537 ?auto_627538 ?auto_627539 ?auto_627540 ?auto_627541 ?auto_627542 ?auto_627543 ?auto_627544 ?auto_627545 ?auto_627546 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627564 - BLOCK
      ?auto_627565 - BLOCK
      ?auto_627566 - BLOCK
      ?auto_627567 - BLOCK
      ?auto_627568 - BLOCK
      ?auto_627569 - BLOCK
      ?auto_627570 - BLOCK
      ?auto_627571 - BLOCK
      ?auto_627572 - BLOCK
      ?auto_627573 - BLOCK
      ?auto_627574 - BLOCK
      ?auto_627575 - BLOCK
      ?auto_627576 - BLOCK
      ?auto_627577 - BLOCK
      ?auto_627578 - BLOCK
      ?auto_627579 - BLOCK
      ?auto_627580 - BLOCK
    )
    :vars
    (
      ?auto_627581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627580 ?auto_627581 ) ( ON-TABLE ?auto_627564 ) ( not ( = ?auto_627564 ?auto_627565 ) ) ( not ( = ?auto_627564 ?auto_627566 ) ) ( not ( = ?auto_627564 ?auto_627567 ) ) ( not ( = ?auto_627564 ?auto_627568 ) ) ( not ( = ?auto_627564 ?auto_627569 ) ) ( not ( = ?auto_627564 ?auto_627570 ) ) ( not ( = ?auto_627564 ?auto_627571 ) ) ( not ( = ?auto_627564 ?auto_627572 ) ) ( not ( = ?auto_627564 ?auto_627573 ) ) ( not ( = ?auto_627564 ?auto_627574 ) ) ( not ( = ?auto_627564 ?auto_627575 ) ) ( not ( = ?auto_627564 ?auto_627576 ) ) ( not ( = ?auto_627564 ?auto_627577 ) ) ( not ( = ?auto_627564 ?auto_627578 ) ) ( not ( = ?auto_627564 ?auto_627579 ) ) ( not ( = ?auto_627564 ?auto_627580 ) ) ( not ( = ?auto_627564 ?auto_627581 ) ) ( not ( = ?auto_627565 ?auto_627566 ) ) ( not ( = ?auto_627565 ?auto_627567 ) ) ( not ( = ?auto_627565 ?auto_627568 ) ) ( not ( = ?auto_627565 ?auto_627569 ) ) ( not ( = ?auto_627565 ?auto_627570 ) ) ( not ( = ?auto_627565 ?auto_627571 ) ) ( not ( = ?auto_627565 ?auto_627572 ) ) ( not ( = ?auto_627565 ?auto_627573 ) ) ( not ( = ?auto_627565 ?auto_627574 ) ) ( not ( = ?auto_627565 ?auto_627575 ) ) ( not ( = ?auto_627565 ?auto_627576 ) ) ( not ( = ?auto_627565 ?auto_627577 ) ) ( not ( = ?auto_627565 ?auto_627578 ) ) ( not ( = ?auto_627565 ?auto_627579 ) ) ( not ( = ?auto_627565 ?auto_627580 ) ) ( not ( = ?auto_627565 ?auto_627581 ) ) ( not ( = ?auto_627566 ?auto_627567 ) ) ( not ( = ?auto_627566 ?auto_627568 ) ) ( not ( = ?auto_627566 ?auto_627569 ) ) ( not ( = ?auto_627566 ?auto_627570 ) ) ( not ( = ?auto_627566 ?auto_627571 ) ) ( not ( = ?auto_627566 ?auto_627572 ) ) ( not ( = ?auto_627566 ?auto_627573 ) ) ( not ( = ?auto_627566 ?auto_627574 ) ) ( not ( = ?auto_627566 ?auto_627575 ) ) ( not ( = ?auto_627566 ?auto_627576 ) ) ( not ( = ?auto_627566 ?auto_627577 ) ) ( not ( = ?auto_627566 ?auto_627578 ) ) ( not ( = ?auto_627566 ?auto_627579 ) ) ( not ( = ?auto_627566 ?auto_627580 ) ) ( not ( = ?auto_627566 ?auto_627581 ) ) ( not ( = ?auto_627567 ?auto_627568 ) ) ( not ( = ?auto_627567 ?auto_627569 ) ) ( not ( = ?auto_627567 ?auto_627570 ) ) ( not ( = ?auto_627567 ?auto_627571 ) ) ( not ( = ?auto_627567 ?auto_627572 ) ) ( not ( = ?auto_627567 ?auto_627573 ) ) ( not ( = ?auto_627567 ?auto_627574 ) ) ( not ( = ?auto_627567 ?auto_627575 ) ) ( not ( = ?auto_627567 ?auto_627576 ) ) ( not ( = ?auto_627567 ?auto_627577 ) ) ( not ( = ?auto_627567 ?auto_627578 ) ) ( not ( = ?auto_627567 ?auto_627579 ) ) ( not ( = ?auto_627567 ?auto_627580 ) ) ( not ( = ?auto_627567 ?auto_627581 ) ) ( not ( = ?auto_627568 ?auto_627569 ) ) ( not ( = ?auto_627568 ?auto_627570 ) ) ( not ( = ?auto_627568 ?auto_627571 ) ) ( not ( = ?auto_627568 ?auto_627572 ) ) ( not ( = ?auto_627568 ?auto_627573 ) ) ( not ( = ?auto_627568 ?auto_627574 ) ) ( not ( = ?auto_627568 ?auto_627575 ) ) ( not ( = ?auto_627568 ?auto_627576 ) ) ( not ( = ?auto_627568 ?auto_627577 ) ) ( not ( = ?auto_627568 ?auto_627578 ) ) ( not ( = ?auto_627568 ?auto_627579 ) ) ( not ( = ?auto_627568 ?auto_627580 ) ) ( not ( = ?auto_627568 ?auto_627581 ) ) ( not ( = ?auto_627569 ?auto_627570 ) ) ( not ( = ?auto_627569 ?auto_627571 ) ) ( not ( = ?auto_627569 ?auto_627572 ) ) ( not ( = ?auto_627569 ?auto_627573 ) ) ( not ( = ?auto_627569 ?auto_627574 ) ) ( not ( = ?auto_627569 ?auto_627575 ) ) ( not ( = ?auto_627569 ?auto_627576 ) ) ( not ( = ?auto_627569 ?auto_627577 ) ) ( not ( = ?auto_627569 ?auto_627578 ) ) ( not ( = ?auto_627569 ?auto_627579 ) ) ( not ( = ?auto_627569 ?auto_627580 ) ) ( not ( = ?auto_627569 ?auto_627581 ) ) ( not ( = ?auto_627570 ?auto_627571 ) ) ( not ( = ?auto_627570 ?auto_627572 ) ) ( not ( = ?auto_627570 ?auto_627573 ) ) ( not ( = ?auto_627570 ?auto_627574 ) ) ( not ( = ?auto_627570 ?auto_627575 ) ) ( not ( = ?auto_627570 ?auto_627576 ) ) ( not ( = ?auto_627570 ?auto_627577 ) ) ( not ( = ?auto_627570 ?auto_627578 ) ) ( not ( = ?auto_627570 ?auto_627579 ) ) ( not ( = ?auto_627570 ?auto_627580 ) ) ( not ( = ?auto_627570 ?auto_627581 ) ) ( not ( = ?auto_627571 ?auto_627572 ) ) ( not ( = ?auto_627571 ?auto_627573 ) ) ( not ( = ?auto_627571 ?auto_627574 ) ) ( not ( = ?auto_627571 ?auto_627575 ) ) ( not ( = ?auto_627571 ?auto_627576 ) ) ( not ( = ?auto_627571 ?auto_627577 ) ) ( not ( = ?auto_627571 ?auto_627578 ) ) ( not ( = ?auto_627571 ?auto_627579 ) ) ( not ( = ?auto_627571 ?auto_627580 ) ) ( not ( = ?auto_627571 ?auto_627581 ) ) ( not ( = ?auto_627572 ?auto_627573 ) ) ( not ( = ?auto_627572 ?auto_627574 ) ) ( not ( = ?auto_627572 ?auto_627575 ) ) ( not ( = ?auto_627572 ?auto_627576 ) ) ( not ( = ?auto_627572 ?auto_627577 ) ) ( not ( = ?auto_627572 ?auto_627578 ) ) ( not ( = ?auto_627572 ?auto_627579 ) ) ( not ( = ?auto_627572 ?auto_627580 ) ) ( not ( = ?auto_627572 ?auto_627581 ) ) ( not ( = ?auto_627573 ?auto_627574 ) ) ( not ( = ?auto_627573 ?auto_627575 ) ) ( not ( = ?auto_627573 ?auto_627576 ) ) ( not ( = ?auto_627573 ?auto_627577 ) ) ( not ( = ?auto_627573 ?auto_627578 ) ) ( not ( = ?auto_627573 ?auto_627579 ) ) ( not ( = ?auto_627573 ?auto_627580 ) ) ( not ( = ?auto_627573 ?auto_627581 ) ) ( not ( = ?auto_627574 ?auto_627575 ) ) ( not ( = ?auto_627574 ?auto_627576 ) ) ( not ( = ?auto_627574 ?auto_627577 ) ) ( not ( = ?auto_627574 ?auto_627578 ) ) ( not ( = ?auto_627574 ?auto_627579 ) ) ( not ( = ?auto_627574 ?auto_627580 ) ) ( not ( = ?auto_627574 ?auto_627581 ) ) ( not ( = ?auto_627575 ?auto_627576 ) ) ( not ( = ?auto_627575 ?auto_627577 ) ) ( not ( = ?auto_627575 ?auto_627578 ) ) ( not ( = ?auto_627575 ?auto_627579 ) ) ( not ( = ?auto_627575 ?auto_627580 ) ) ( not ( = ?auto_627575 ?auto_627581 ) ) ( not ( = ?auto_627576 ?auto_627577 ) ) ( not ( = ?auto_627576 ?auto_627578 ) ) ( not ( = ?auto_627576 ?auto_627579 ) ) ( not ( = ?auto_627576 ?auto_627580 ) ) ( not ( = ?auto_627576 ?auto_627581 ) ) ( not ( = ?auto_627577 ?auto_627578 ) ) ( not ( = ?auto_627577 ?auto_627579 ) ) ( not ( = ?auto_627577 ?auto_627580 ) ) ( not ( = ?auto_627577 ?auto_627581 ) ) ( not ( = ?auto_627578 ?auto_627579 ) ) ( not ( = ?auto_627578 ?auto_627580 ) ) ( not ( = ?auto_627578 ?auto_627581 ) ) ( not ( = ?auto_627579 ?auto_627580 ) ) ( not ( = ?auto_627579 ?auto_627581 ) ) ( not ( = ?auto_627580 ?auto_627581 ) ) ( ON ?auto_627579 ?auto_627580 ) ( ON ?auto_627578 ?auto_627579 ) ( ON ?auto_627577 ?auto_627578 ) ( ON ?auto_627576 ?auto_627577 ) ( ON ?auto_627575 ?auto_627576 ) ( ON ?auto_627574 ?auto_627575 ) ( ON ?auto_627573 ?auto_627574 ) ( ON ?auto_627572 ?auto_627573 ) ( ON ?auto_627571 ?auto_627572 ) ( ON ?auto_627570 ?auto_627571 ) ( ON ?auto_627569 ?auto_627570 ) ( ON ?auto_627568 ?auto_627569 ) ( ON ?auto_627567 ?auto_627568 ) ( ON ?auto_627566 ?auto_627567 ) ( CLEAR ?auto_627564 ) ( ON ?auto_627565 ?auto_627566 ) ( CLEAR ?auto_627565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_627564 ?auto_627565 )
      ( MAKE-17PILE ?auto_627564 ?auto_627565 ?auto_627566 ?auto_627567 ?auto_627568 ?auto_627569 ?auto_627570 ?auto_627571 ?auto_627572 ?auto_627573 ?auto_627574 ?auto_627575 ?auto_627576 ?auto_627577 ?auto_627578 ?auto_627579 ?auto_627580 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627599 - BLOCK
      ?auto_627600 - BLOCK
      ?auto_627601 - BLOCK
      ?auto_627602 - BLOCK
      ?auto_627603 - BLOCK
      ?auto_627604 - BLOCK
      ?auto_627605 - BLOCK
      ?auto_627606 - BLOCK
      ?auto_627607 - BLOCK
      ?auto_627608 - BLOCK
      ?auto_627609 - BLOCK
      ?auto_627610 - BLOCK
      ?auto_627611 - BLOCK
      ?auto_627612 - BLOCK
      ?auto_627613 - BLOCK
      ?auto_627614 - BLOCK
      ?auto_627615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627615 ) ( ON-TABLE ?auto_627599 ) ( not ( = ?auto_627599 ?auto_627600 ) ) ( not ( = ?auto_627599 ?auto_627601 ) ) ( not ( = ?auto_627599 ?auto_627602 ) ) ( not ( = ?auto_627599 ?auto_627603 ) ) ( not ( = ?auto_627599 ?auto_627604 ) ) ( not ( = ?auto_627599 ?auto_627605 ) ) ( not ( = ?auto_627599 ?auto_627606 ) ) ( not ( = ?auto_627599 ?auto_627607 ) ) ( not ( = ?auto_627599 ?auto_627608 ) ) ( not ( = ?auto_627599 ?auto_627609 ) ) ( not ( = ?auto_627599 ?auto_627610 ) ) ( not ( = ?auto_627599 ?auto_627611 ) ) ( not ( = ?auto_627599 ?auto_627612 ) ) ( not ( = ?auto_627599 ?auto_627613 ) ) ( not ( = ?auto_627599 ?auto_627614 ) ) ( not ( = ?auto_627599 ?auto_627615 ) ) ( not ( = ?auto_627600 ?auto_627601 ) ) ( not ( = ?auto_627600 ?auto_627602 ) ) ( not ( = ?auto_627600 ?auto_627603 ) ) ( not ( = ?auto_627600 ?auto_627604 ) ) ( not ( = ?auto_627600 ?auto_627605 ) ) ( not ( = ?auto_627600 ?auto_627606 ) ) ( not ( = ?auto_627600 ?auto_627607 ) ) ( not ( = ?auto_627600 ?auto_627608 ) ) ( not ( = ?auto_627600 ?auto_627609 ) ) ( not ( = ?auto_627600 ?auto_627610 ) ) ( not ( = ?auto_627600 ?auto_627611 ) ) ( not ( = ?auto_627600 ?auto_627612 ) ) ( not ( = ?auto_627600 ?auto_627613 ) ) ( not ( = ?auto_627600 ?auto_627614 ) ) ( not ( = ?auto_627600 ?auto_627615 ) ) ( not ( = ?auto_627601 ?auto_627602 ) ) ( not ( = ?auto_627601 ?auto_627603 ) ) ( not ( = ?auto_627601 ?auto_627604 ) ) ( not ( = ?auto_627601 ?auto_627605 ) ) ( not ( = ?auto_627601 ?auto_627606 ) ) ( not ( = ?auto_627601 ?auto_627607 ) ) ( not ( = ?auto_627601 ?auto_627608 ) ) ( not ( = ?auto_627601 ?auto_627609 ) ) ( not ( = ?auto_627601 ?auto_627610 ) ) ( not ( = ?auto_627601 ?auto_627611 ) ) ( not ( = ?auto_627601 ?auto_627612 ) ) ( not ( = ?auto_627601 ?auto_627613 ) ) ( not ( = ?auto_627601 ?auto_627614 ) ) ( not ( = ?auto_627601 ?auto_627615 ) ) ( not ( = ?auto_627602 ?auto_627603 ) ) ( not ( = ?auto_627602 ?auto_627604 ) ) ( not ( = ?auto_627602 ?auto_627605 ) ) ( not ( = ?auto_627602 ?auto_627606 ) ) ( not ( = ?auto_627602 ?auto_627607 ) ) ( not ( = ?auto_627602 ?auto_627608 ) ) ( not ( = ?auto_627602 ?auto_627609 ) ) ( not ( = ?auto_627602 ?auto_627610 ) ) ( not ( = ?auto_627602 ?auto_627611 ) ) ( not ( = ?auto_627602 ?auto_627612 ) ) ( not ( = ?auto_627602 ?auto_627613 ) ) ( not ( = ?auto_627602 ?auto_627614 ) ) ( not ( = ?auto_627602 ?auto_627615 ) ) ( not ( = ?auto_627603 ?auto_627604 ) ) ( not ( = ?auto_627603 ?auto_627605 ) ) ( not ( = ?auto_627603 ?auto_627606 ) ) ( not ( = ?auto_627603 ?auto_627607 ) ) ( not ( = ?auto_627603 ?auto_627608 ) ) ( not ( = ?auto_627603 ?auto_627609 ) ) ( not ( = ?auto_627603 ?auto_627610 ) ) ( not ( = ?auto_627603 ?auto_627611 ) ) ( not ( = ?auto_627603 ?auto_627612 ) ) ( not ( = ?auto_627603 ?auto_627613 ) ) ( not ( = ?auto_627603 ?auto_627614 ) ) ( not ( = ?auto_627603 ?auto_627615 ) ) ( not ( = ?auto_627604 ?auto_627605 ) ) ( not ( = ?auto_627604 ?auto_627606 ) ) ( not ( = ?auto_627604 ?auto_627607 ) ) ( not ( = ?auto_627604 ?auto_627608 ) ) ( not ( = ?auto_627604 ?auto_627609 ) ) ( not ( = ?auto_627604 ?auto_627610 ) ) ( not ( = ?auto_627604 ?auto_627611 ) ) ( not ( = ?auto_627604 ?auto_627612 ) ) ( not ( = ?auto_627604 ?auto_627613 ) ) ( not ( = ?auto_627604 ?auto_627614 ) ) ( not ( = ?auto_627604 ?auto_627615 ) ) ( not ( = ?auto_627605 ?auto_627606 ) ) ( not ( = ?auto_627605 ?auto_627607 ) ) ( not ( = ?auto_627605 ?auto_627608 ) ) ( not ( = ?auto_627605 ?auto_627609 ) ) ( not ( = ?auto_627605 ?auto_627610 ) ) ( not ( = ?auto_627605 ?auto_627611 ) ) ( not ( = ?auto_627605 ?auto_627612 ) ) ( not ( = ?auto_627605 ?auto_627613 ) ) ( not ( = ?auto_627605 ?auto_627614 ) ) ( not ( = ?auto_627605 ?auto_627615 ) ) ( not ( = ?auto_627606 ?auto_627607 ) ) ( not ( = ?auto_627606 ?auto_627608 ) ) ( not ( = ?auto_627606 ?auto_627609 ) ) ( not ( = ?auto_627606 ?auto_627610 ) ) ( not ( = ?auto_627606 ?auto_627611 ) ) ( not ( = ?auto_627606 ?auto_627612 ) ) ( not ( = ?auto_627606 ?auto_627613 ) ) ( not ( = ?auto_627606 ?auto_627614 ) ) ( not ( = ?auto_627606 ?auto_627615 ) ) ( not ( = ?auto_627607 ?auto_627608 ) ) ( not ( = ?auto_627607 ?auto_627609 ) ) ( not ( = ?auto_627607 ?auto_627610 ) ) ( not ( = ?auto_627607 ?auto_627611 ) ) ( not ( = ?auto_627607 ?auto_627612 ) ) ( not ( = ?auto_627607 ?auto_627613 ) ) ( not ( = ?auto_627607 ?auto_627614 ) ) ( not ( = ?auto_627607 ?auto_627615 ) ) ( not ( = ?auto_627608 ?auto_627609 ) ) ( not ( = ?auto_627608 ?auto_627610 ) ) ( not ( = ?auto_627608 ?auto_627611 ) ) ( not ( = ?auto_627608 ?auto_627612 ) ) ( not ( = ?auto_627608 ?auto_627613 ) ) ( not ( = ?auto_627608 ?auto_627614 ) ) ( not ( = ?auto_627608 ?auto_627615 ) ) ( not ( = ?auto_627609 ?auto_627610 ) ) ( not ( = ?auto_627609 ?auto_627611 ) ) ( not ( = ?auto_627609 ?auto_627612 ) ) ( not ( = ?auto_627609 ?auto_627613 ) ) ( not ( = ?auto_627609 ?auto_627614 ) ) ( not ( = ?auto_627609 ?auto_627615 ) ) ( not ( = ?auto_627610 ?auto_627611 ) ) ( not ( = ?auto_627610 ?auto_627612 ) ) ( not ( = ?auto_627610 ?auto_627613 ) ) ( not ( = ?auto_627610 ?auto_627614 ) ) ( not ( = ?auto_627610 ?auto_627615 ) ) ( not ( = ?auto_627611 ?auto_627612 ) ) ( not ( = ?auto_627611 ?auto_627613 ) ) ( not ( = ?auto_627611 ?auto_627614 ) ) ( not ( = ?auto_627611 ?auto_627615 ) ) ( not ( = ?auto_627612 ?auto_627613 ) ) ( not ( = ?auto_627612 ?auto_627614 ) ) ( not ( = ?auto_627612 ?auto_627615 ) ) ( not ( = ?auto_627613 ?auto_627614 ) ) ( not ( = ?auto_627613 ?auto_627615 ) ) ( not ( = ?auto_627614 ?auto_627615 ) ) ( ON ?auto_627614 ?auto_627615 ) ( ON ?auto_627613 ?auto_627614 ) ( ON ?auto_627612 ?auto_627613 ) ( ON ?auto_627611 ?auto_627612 ) ( ON ?auto_627610 ?auto_627611 ) ( ON ?auto_627609 ?auto_627610 ) ( ON ?auto_627608 ?auto_627609 ) ( ON ?auto_627607 ?auto_627608 ) ( ON ?auto_627606 ?auto_627607 ) ( ON ?auto_627605 ?auto_627606 ) ( ON ?auto_627604 ?auto_627605 ) ( ON ?auto_627603 ?auto_627604 ) ( ON ?auto_627602 ?auto_627603 ) ( ON ?auto_627601 ?auto_627602 ) ( CLEAR ?auto_627599 ) ( ON ?auto_627600 ?auto_627601 ) ( CLEAR ?auto_627600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_627599 ?auto_627600 )
      ( MAKE-17PILE ?auto_627599 ?auto_627600 ?auto_627601 ?auto_627602 ?auto_627603 ?auto_627604 ?auto_627605 ?auto_627606 ?auto_627607 ?auto_627608 ?auto_627609 ?auto_627610 ?auto_627611 ?auto_627612 ?auto_627613 ?auto_627614 ?auto_627615 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627633 - BLOCK
      ?auto_627634 - BLOCK
      ?auto_627635 - BLOCK
      ?auto_627636 - BLOCK
      ?auto_627637 - BLOCK
      ?auto_627638 - BLOCK
      ?auto_627639 - BLOCK
      ?auto_627640 - BLOCK
      ?auto_627641 - BLOCK
      ?auto_627642 - BLOCK
      ?auto_627643 - BLOCK
      ?auto_627644 - BLOCK
      ?auto_627645 - BLOCK
      ?auto_627646 - BLOCK
      ?auto_627647 - BLOCK
      ?auto_627648 - BLOCK
      ?auto_627649 - BLOCK
    )
    :vars
    (
      ?auto_627650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627649 ?auto_627650 ) ( not ( = ?auto_627633 ?auto_627634 ) ) ( not ( = ?auto_627633 ?auto_627635 ) ) ( not ( = ?auto_627633 ?auto_627636 ) ) ( not ( = ?auto_627633 ?auto_627637 ) ) ( not ( = ?auto_627633 ?auto_627638 ) ) ( not ( = ?auto_627633 ?auto_627639 ) ) ( not ( = ?auto_627633 ?auto_627640 ) ) ( not ( = ?auto_627633 ?auto_627641 ) ) ( not ( = ?auto_627633 ?auto_627642 ) ) ( not ( = ?auto_627633 ?auto_627643 ) ) ( not ( = ?auto_627633 ?auto_627644 ) ) ( not ( = ?auto_627633 ?auto_627645 ) ) ( not ( = ?auto_627633 ?auto_627646 ) ) ( not ( = ?auto_627633 ?auto_627647 ) ) ( not ( = ?auto_627633 ?auto_627648 ) ) ( not ( = ?auto_627633 ?auto_627649 ) ) ( not ( = ?auto_627633 ?auto_627650 ) ) ( not ( = ?auto_627634 ?auto_627635 ) ) ( not ( = ?auto_627634 ?auto_627636 ) ) ( not ( = ?auto_627634 ?auto_627637 ) ) ( not ( = ?auto_627634 ?auto_627638 ) ) ( not ( = ?auto_627634 ?auto_627639 ) ) ( not ( = ?auto_627634 ?auto_627640 ) ) ( not ( = ?auto_627634 ?auto_627641 ) ) ( not ( = ?auto_627634 ?auto_627642 ) ) ( not ( = ?auto_627634 ?auto_627643 ) ) ( not ( = ?auto_627634 ?auto_627644 ) ) ( not ( = ?auto_627634 ?auto_627645 ) ) ( not ( = ?auto_627634 ?auto_627646 ) ) ( not ( = ?auto_627634 ?auto_627647 ) ) ( not ( = ?auto_627634 ?auto_627648 ) ) ( not ( = ?auto_627634 ?auto_627649 ) ) ( not ( = ?auto_627634 ?auto_627650 ) ) ( not ( = ?auto_627635 ?auto_627636 ) ) ( not ( = ?auto_627635 ?auto_627637 ) ) ( not ( = ?auto_627635 ?auto_627638 ) ) ( not ( = ?auto_627635 ?auto_627639 ) ) ( not ( = ?auto_627635 ?auto_627640 ) ) ( not ( = ?auto_627635 ?auto_627641 ) ) ( not ( = ?auto_627635 ?auto_627642 ) ) ( not ( = ?auto_627635 ?auto_627643 ) ) ( not ( = ?auto_627635 ?auto_627644 ) ) ( not ( = ?auto_627635 ?auto_627645 ) ) ( not ( = ?auto_627635 ?auto_627646 ) ) ( not ( = ?auto_627635 ?auto_627647 ) ) ( not ( = ?auto_627635 ?auto_627648 ) ) ( not ( = ?auto_627635 ?auto_627649 ) ) ( not ( = ?auto_627635 ?auto_627650 ) ) ( not ( = ?auto_627636 ?auto_627637 ) ) ( not ( = ?auto_627636 ?auto_627638 ) ) ( not ( = ?auto_627636 ?auto_627639 ) ) ( not ( = ?auto_627636 ?auto_627640 ) ) ( not ( = ?auto_627636 ?auto_627641 ) ) ( not ( = ?auto_627636 ?auto_627642 ) ) ( not ( = ?auto_627636 ?auto_627643 ) ) ( not ( = ?auto_627636 ?auto_627644 ) ) ( not ( = ?auto_627636 ?auto_627645 ) ) ( not ( = ?auto_627636 ?auto_627646 ) ) ( not ( = ?auto_627636 ?auto_627647 ) ) ( not ( = ?auto_627636 ?auto_627648 ) ) ( not ( = ?auto_627636 ?auto_627649 ) ) ( not ( = ?auto_627636 ?auto_627650 ) ) ( not ( = ?auto_627637 ?auto_627638 ) ) ( not ( = ?auto_627637 ?auto_627639 ) ) ( not ( = ?auto_627637 ?auto_627640 ) ) ( not ( = ?auto_627637 ?auto_627641 ) ) ( not ( = ?auto_627637 ?auto_627642 ) ) ( not ( = ?auto_627637 ?auto_627643 ) ) ( not ( = ?auto_627637 ?auto_627644 ) ) ( not ( = ?auto_627637 ?auto_627645 ) ) ( not ( = ?auto_627637 ?auto_627646 ) ) ( not ( = ?auto_627637 ?auto_627647 ) ) ( not ( = ?auto_627637 ?auto_627648 ) ) ( not ( = ?auto_627637 ?auto_627649 ) ) ( not ( = ?auto_627637 ?auto_627650 ) ) ( not ( = ?auto_627638 ?auto_627639 ) ) ( not ( = ?auto_627638 ?auto_627640 ) ) ( not ( = ?auto_627638 ?auto_627641 ) ) ( not ( = ?auto_627638 ?auto_627642 ) ) ( not ( = ?auto_627638 ?auto_627643 ) ) ( not ( = ?auto_627638 ?auto_627644 ) ) ( not ( = ?auto_627638 ?auto_627645 ) ) ( not ( = ?auto_627638 ?auto_627646 ) ) ( not ( = ?auto_627638 ?auto_627647 ) ) ( not ( = ?auto_627638 ?auto_627648 ) ) ( not ( = ?auto_627638 ?auto_627649 ) ) ( not ( = ?auto_627638 ?auto_627650 ) ) ( not ( = ?auto_627639 ?auto_627640 ) ) ( not ( = ?auto_627639 ?auto_627641 ) ) ( not ( = ?auto_627639 ?auto_627642 ) ) ( not ( = ?auto_627639 ?auto_627643 ) ) ( not ( = ?auto_627639 ?auto_627644 ) ) ( not ( = ?auto_627639 ?auto_627645 ) ) ( not ( = ?auto_627639 ?auto_627646 ) ) ( not ( = ?auto_627639 ?auto_627647 ) ) ( not ( = ?auto_627639 ?auto_627648 ) ) ( not ( = ?auto_627639 ?auto_627649 ) ) ( not ( = ?auto_627639 ?auto_627650 ) ) ( not ( = ?auto_627640 ?auto_627641 ) ) ( not ( = ?auto_627640 ?auto_627642 ) ) ( not ( = ?auto_627640 ?auto_627643 ) ) ( not ( = ?auto_627640 ?auto_627644 ) ) ( not ( = ?auto_627640 ?auto_627645 ) ) ( not ( = ?auto_627640 ?auto_627646 ) ) ( not ( = ?auto_627640 ?auto_627647 ) ) ( not ( = ?auto_627640 ?auto_627648 ) ) ( not ( = ?auto_627640 ?auto_627649 ) ) ( not ( = ?auto_627640 ?auto_627650 ) ) ( not ( = ?auto_627641 ?auto_627642 ) ) ( not ( = ?auto_627641 ?auto_627643 ) ) ( not ( = ?auto_627641 ?auto_627644 ) ) ( not ( = ?auto_627641 ?auto_627645 ) ) ( not ( = ?auto_627641 ?auto_627646 ) ) ( not ( = ?auto_627641 ?auto_627647 ) ) ( not ( = ?auto_627641 ?auto_627648 ) ) ( not ( = ?auto_627641 ?auto_627649 ) ) ( not ( = ?auto_627641 ?auto_627650 ) ) ( not ( = ?auto_627642 ?auto_627643 ) ) ( not ( = ?auto_627642 ?auto_627644 ) ) ( not ( = ?auto_627642 ?auto_627645 ) ) ( not ( = ?auto_627642 ?auto_627646 ) ) ( not ( = ?auto_627642 ?auto_627647 ) ) ( not ( = ?auto_627642 ?auto_627648 ) ) ( not ( = ?auto_627642 ?auto_627649 ) ) ( not ( = ?auto_627642 ?auto_627650 ) ) ( not ( = ?auto_627643 ?auto_627644 ) ) ( not ( = ?auto_627643 ?auto_627645 ) ) ( not ( = ?auto_627643 ?auto_627646 ) ) ( not ( = ?auto_627643 ?auto_627647 ) ) ( not ( = ?auto_627643 ?auto_627648 ) ) ( not ( = ?auto_627643 ?auto_627649 ) ) ( not ( = ?auto_627643 ?auto_627650 ) ) ( not ( = ?auto_627644 ?auto_627645 ) ) ( not ( = ?auto_627644 ?auto_627646 ) ) ( not ( = ?auto_627644 ?auto_627647 ) ) ( not ( = ?auto_627644 ?auto_627648 ) ) ( not ( = ?auto_627644 ?auto_627649 ) ) ( not ( = ?auto_627644 ?auto_627650 ) ) ( not ( = ?auto_627645 ?auto_627646 ) ) ( not ( = ?auto_627645 ?auto_627647 ) ) ( not ( = ?auto_627645 ?auto_627648 ) ) ( not ( = ?auto_627645 ?auto_627649 ) ) ( not ( = ?auto_627645 ?auto_627650 ) ) ( not ( = ?auto_627646 ?auto_627647 ) ) ( not ( = ?auto_627646 ?auto_627648 ) ) ( not ( = ?auto_627646 ?auto_627649 ) ) ( not ( = ?auto_627646 ?auto_627650 ) ) ( not ( = ?auto_627647 ?auto_627648 ) ) ( not ( = ?auto_627647 ?auto_627649 ) ) ( not ( = ?auto_627647 ?auto_627650 ) ) ( not ( = ?auto_627648 ?auto_627649 ) ) ( not ( = ?auto_627648 ?auto_627650 ) ) ( not ( = ?auto_627649 ?auto_627650 ) ) ( ON ?auto_627648 ?auto_627649 ) ( ON ?auto_627647 ?auto_627648 ) ( ON ?auto_627646 ?auto_627647 ) ( ON ?auto_627645 ?auto_627646 ) ( ON ?auto_627644 ?auto_627645 ) ( ON ?auto_627643 ?auto_627644 ) ( ON ?auto_627642 ?auto_627643 ) ( ON ?auto_627641 ?auto_627642 ) ( ON ?auto_627640 ?auto_627641 ) ( ON ?auto_627639 ?auto_627640 ) ( ON ?auto_627638 ?auto_627639 ) ( ON ?auto_627637 ?auto_627638 ) ( ON ?auto_627636 ?auto_627637 ) ( ON ?auto_627635 ?auto_627636 ) ( ON ?auto_627634 ?auto_627635 ) ( ON ?auto_627633 ?auto_627634 ) ( CLEAR ?auto_627633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_627633 )
      ( MAKE-17PILE ?auto_627633 ?auto_627634 ?auto_627635 ?auto_627636 ?auto_627637 ?auto_627638 ?auto_627639 ?auto_627640 ?auto_627641 ?auto_627642 ?auto_627643 ?auto_627644 ?auto_627645 ?auto_627646 ?auto_627647 ?auto_627648 ?auto_627649 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627668 - BLOCK
      ?auto_627669 - BLOCK
      ?auto_627670 - BLOCK
      ?auto_627671 - BLOCK
      ?auto_627672 - BLOCK
      ?auto_627673 - BLOCK
      ?auto_627674 - BLOCK
      ?auto_627675 - BLOCK
      ?auto_627676 - BLOCK
      ?auto_627677 - BLOCK
      ?auto_627678 - BLOCK
      ?auto_627679 - BLOCK
      ?auto_627680 - BLOCK
      ?auto_627681 - BLOCK
      ?auto_627682 - BLOCK
      ?auto_627683 - BLOCK
      ?auto_627684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_627684 ) ( not ( = ?auto_627668 ?auto_627669 ) ) ( not ( = ?auto_627668 ?auto_627670 ) ) ( not ( = ?auto_627668 ?auto_627671 ) ) ( not ( = ?auto_627668 ?auto_627672 ) ) ( not ( = ?auto_627668 ?auto_627673 ) ) ( not ( = ?auto_627668 ?auto_627674 ) ) ( not ( = ?auto_627668 ?auto_627675 ) ) ( not ( = ?auto_627668 ?auto_627676 ) ) ( not ( = ?auto_627668 ?auto_627677 ) ) ( not ( = ?auto_627668 ?auto_627678 ) ) ( not ( = ?auto_627668 ?auto_627679 ) ) ( not ( = ?auto_627668 ?auto_627680 ) ) ( not ( = ?auto_627668 ?auto_627681 ) ) ( not ( = ?auto_627668 ?auto_627682 ) ) ( not ( = ?auto_627668 ?auto_627683 ) ) ( not ( = ?auto_627668 ?auto_627684 ) ) ( not ( = ?auto_627669 ?auto_627670 ) ) ( not ( = ?auto_627669 ?auto_627671 ) ) ( not ( = ?auto_627669 ?auto_627672 ) ) ( not ( = ?auto_627669 ?auto_627673 ) ) ( not ( = ?auto_627669 ?auto_627674 ) ) ( not ( = ?auto_627669 ?auto_627675 ) ) ( not ( = ?auto_627669 ?auto_627676 ) ) ( not ( = ?auto_627669 ?auto_627677 ) ) ( not ( = ?auto_627669 ?auto_627678 ) ) ( not ( = ?auto_627669 ?auto_627679 ) ) ( not ( = ?auto_627669 ?auto_627680 ) ) ( not ( = ?auto_627669 ?auto_627681 ) ) ( not ( = ?auto_627669 ?auto_627682 ) ) ( not ( = ?auto_627669 ?auto_627683 ) ) ( not ( = ?auto_627669 ?auto_627684 ) ) ( not ( = ?auto_627670 ?auto_627671 ) ) ( not ( = ?auto_627670 ?auto_627672 ) ) ( not ( = ?auto_627670 ?auto_627673 ) ) ( not ( = ?auto_627670 ?auto_627674 ) ) ( not ( = ?auto_627670 ?auto_627675 ) ) ( not ( = ?auto_627670 ?auto_627676 ) ) ( not ( = ?auto_627670 ?auto_627677 ) ) ( not ( = ?auto_627670 ?auto_627678 ) ) ( not ( = ?auto_627670 ?auto_627679 ) ) ( not ( = ?auto_627670 ?auto_627680 ) ) ( not ( = ?auto_627670 ?auto_627681 ) ) ( not ( = ?auto_627670 ?auto_627682 ) ) ( not ( = ?auto_627670 ?auto_627683 ) ) ( not ( = ?auto_627670 ?auto_627684 ) ) ( not ( = ?auto_627671 ?auto_627672 ) ) ( not ( = ?auto_627671 ?auto_627673 ) ) ( not ( = ?auto_627671 ?auto_627674 ) ) ( not ( = ?auto_627671 ?auto_627675 ) ) ( not ( = ?auto_627671 ?auto_627676 ) ) ( not ( = ?auto_627671 ?auto_627677 ) ) ( not ( = ?auto_627671 ?auto_627678 ) ) ( not ( = ?auto_627671 ?auto_627679 ) ) ( not ( = ?auto_627671 ?auto_627680 ) ) ( not ( = ?auto_627671 ?auto_627681 ) ) ( not ( = ?auto_627671 ?auto_627682 ) ) ( not ( = ?auto_627671 ?auto_627683 ) ) ( not ( = ?auto_627671 ?auto_627684 ) ) ( not ( = ?auto_627672 ?auto_627673 ) ) ( not ( = ?auto_627672 ?auto_627674 ) ) ( not ( = ?auto_627672 ?auto_627675 ) ) ( not ( = ?auto_627672 ?auto_627676 ) ) ( not ( = ?auto_627672 ?auto_627677 ) ) ( not ( = ?auto_627672 ?auto_627678 ) ) ( not ( = ?auto_627672 ?auto_627679 ) ) ( not ( = ?auto_627672 ?auto_627680 ) ) ( not ( = ?auto_627672 ?auto_627681 ) ) ( not ( = ?auto_627672 ?auto_627682 ) ) ( not ( = ?auto_627672 ?auto_627683 ) ) ( not ( = ?auto_627672 ?auto_627684 ) ) ( not ( = ?auto_627673 ?auto_627674 ) ) ( not ( = ?auto_627673 ?auto_627675 ) ) ( not ( = ?auto_627673 ?auto_627676 ) ) ( not ( = ?auto_627673 ?auto_627677 ) ) ( not ( = ?auto_627673 ?auto_627678 ) ) ( not ( = ?auto_627673 ?auto_627679 ) ) ( not ( = ?auto_627673 ?auto_627680 ) ) ( not ( = ?auto_627673 ?auto_627681 ) ) ( not ( = ?auto_627673 ?auto_627682 ) ) ( not ( = ?auto_627673 ?auto_627683 ) ) ( not ( = ?auto_627673 ?auto_627684 ) ) ( not ( = ?auto_627674 ?auto_627675 ) ) ( not ( = ?auto_627674 ?auto_627676 ) ) ( not ( = ?auto_627674 ?auto_627677 ) ) ( not ( = ?auto_627674 ?auto_627678 ) ) ( not ( = ?auto_627674 ?auto_627679 ) ) ( not ( = ?auto_627674 ?auto_627680 ) ) ( not ( = ?auto_627674 ?auto_627681 ) ) ( not ( = ?auto_627674 ?auto_627682 ) ) ( not ( = ?auto_627674 ?auto_627683 ) ) ( not ( = ?auto_627674 ?auto_627684 ) ) ( not ( = ?auto_627675 ?auto_627676 ) ) ( not ( = ?auto_627675 ?auto_627677 ) ) ( not ( = ?auto_627675 ?auto_627678 ) ) ( not ( = ?auto_627675 ?auto_627679 ) ) ( not ( = ?auto_627675 ?auto_627680 ) ) ( not ( = ?auto_627675 ?auto_627681 ) ) ( not ( = ?auto_627675 ?auto_627682 ) ) ( not ( = ?auto_627675 ?auto_627683 ) ) ( not ( = ?auto_627675 ?auto_627684 ) ) ( not ( = ?auto_627676 ?auto_627677 ) ) ( not ( = ?auto_627676 ?auto_627678 ) ) ( not ( = ?auto_627676 ?auto_627679 ) ) ( not ( = ?auto_627676 ?auto_627680 ) ) ( not ( = ?auto_627676 ?auto_627681 ) ) ( not ( = ?auto_627676 ?auto_627682 ) ) ( not ( = ?auto_627676 ?auto_627683 ) ) ( not ( = ?auto_627676 ?auto_627684 ) ) ( not ( = ?auto_627677 ?auto_627678 ) ) ( not ( = ?auto_627677 ?auto_627679 ) ) ( not ( = ?auto_627677 ?auto_627680 ) ) ( not ( = ?auto_627677 ?auto_627681 ) ) ( not ( = ?auto_627677 ?auto_627682 ) ) ( not ( = ?auto_627677 ?auto_627683 ) ) ( not ( = ?auto_627677 ?auto_627684 ) ) ( not ( = ?auto_627678 ?auto_627679 ) ) ( not ( = ?auto_627678 ?auto_627680 ) ) ( not ( = ?auto_627678 ?auto_627681 ) ) ( not ( = ?auto_627678 ?auto_627682 ) ) ( not ( = ?auto_627678 ?auto_627683 ) ) ( not ( = ?auto_627678 ?auto_627684 ) ) ( not ( = ?auto_627679 ?auto_627680 ) ) ( not ( = ?auto_627679 ?auto_627681 ) ) ( not ( = ?auto_627679 ?auto_627682 ) ) ( not ( = ?auto_627679 ?auto_627683 ) ) ( not ( = ?auto_627679 ?auto_627684 ) ) ( not ( = ?auto_627680 ?auto_627681 ) ) ( not ( = ?auto_627680 ?auto_627682 ) ) ( not ( = ?auto_627680 ?auto_627683 ) ) ( not ( = ?auto_627680 ?auto_627684 ) ) ( not ( = ?auto_627681 ?auto_627682 ) ) ( not ( = ?auto_627681 ?auto_627683 ) ) ( not ( = ?auto_627681 ?auto_627684 ) ) ( not ( = ?auto_627682 ?auto_627683 ) ) ( not ( = ?auto_627682 ?auto_627684 ) ) ( not ( = ?auto_627683 ?auto_627684 ) ) ( ON ?auto_627683 ?auto_627684 ) ( ON ?auto_627682 ?auto_627683 ) ( ON ?auto_627681 ?auto_627682 ) ( ON ?auto_627680 ?auto_627681 ) ( ON ?auto_627679 ?auto_627680 ) ( ON ?auto_627678 ?auto_627679 ) ( ON ?auto_627677 ?auto_627678 ) ( ON ?auto_627676 ?auto_627677 ) ( ON ?auto_627675 ?auto_627676 ) ( ON ?auto_627674 ?auto_627675 ) ( ON ?auto_627673 ?auto_627674 ) ( ON ?auto_627672 ?auto_627673 ) ( ON ?auto_627671 ?auto_627672 ) ( ON ?auto_627670 ?auto_627671 ) ( ON ?auto_627669 ?auto_627670 ) ( ON ?auto_627668 ?auto_627669 ) ( CLEAR ?auto_627668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_627668 )
      ( MAKE-17PILE ?auto_627668 ?auto_627669 ?auto_627670 ?auto_627671 ?auto_627672 ?auto_627673 ?auto_627674 ?auto_627675 ?auto_627676 ?auto_627677 ?auto_627678 ?auto_627679 ?auto_627680 ?auto_627681 ?auto_627682 ?auto_627683 ?auto_627684 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_627702 - BLOCK
      ?auto_627703 - BLOCK
      ?auto_627704 - BLOCK
      ?auto_627705 - BLOCK
      ?auto_627706 - BLOCK
      ?auto_627707 - BLOCK
      ?auto_627708 - BLOCK
      ?auto_627709 - BLOCK
      ?auto_627710 - BLOCK
      ?auto_627711 - BLOCK
      ?auto_627712 - BLOCK
      ?auto_627713 - BLOCK
      ?auto_627714 - BLOCK
      ?auto_627715 - BLOCK
      ?auto_627716 - BLOCK
      ?auto_627717 - BLOCK
      ?auto_627718 - BLOCK
    )
    :vars
    (
      ?auto_627719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_627702 ?auto_627703 ) ) ( not ( = ?auto_627702 ?auto_627704 ) ) ( not ( = ?auto_627702 ?auto_627705 ) ) ( not ( = ?auto_627702 ?auto_627706 ) ) ( not ( = ?auto_627702 ?auto_627707 ) ) ( not ( = ?auto_627702 ?auto_627708 ) ) ( not ( = ?auto_627702 ?auto_627709 ) ) ( not ( = ?auto_627702 ?auto_627710 ) ) ( not ( = ?auto_627702 ?auto_627711 ) ) ( not ( = ?auto_627702 ?auto_627712 ) ) ( not ( = ?auto_627702 ?auto_627713 ) ) ( not ( = ?auto_627702 ?auto_627714 ) ) ( not ( = ?auto_627702 ?auto_627715 ) ) ( not ( = ?auto_627702 ?auto_627716 ) ) ( not ( = ?auto_627702 ?auto_627717 ) ) ( not ( = ?auto_627702 ?auto_627718 ) ) ( not ( = ?auto_627703 ?auto_627704 ) ) ( not ( = ?auto_627703 ?auto_627705 ) ) ( not ( = ?auto_627703 ?auto_627706 ) ) ( not ( = ?auto_627703 ?auto_627707 ) ) ( not ( = ?auto_627703 ?auto_627708 ) ) ( not ( = ?auto_627703 ?auto_627709 ) ) ( not ( = ?auto_627703 ?auto_627710 ) ) ( not ( = ?auto_627703 ?auto_627711 ) ) ( not ( = ?auto_627703 ?auto_627712 ) ) ( not ( = ?auto_627703 ?auto_627713 ) ) ( not ( = ?auto_627703 ?auto_627714 ) ) ( not ( = ?auto_627703 ?auto_627715 ) ) ( not ( = ?auto_627703 ?auto_627716 ) ) ( not ( = ?auto_627703 ?auto_627717 ) ) ( not ( = ?auto_627703 ?auto_627718 ) ) ( not ( = ?auto_627704 ?auto_627705 ) ) ( not ( = ?auto_627704 ?auto_627706 ) ) ( not ( = ?auto_627704 ?auto_627707 ) ) ( not ( = ?auto_627704 ?auto_627708 ) ) ( not ( = ?auto_627704 ?auto_627709 ) ) ( not ( = ?auto_627704 ?auto_627710 ) ) ( not ( = ?auto_627704 ?auto_627711 ) ) ( not ( = ?auto_627704 ?auto_627712 ) ) ( not ( = ?auto_627704 ?auto_627713 ) ) ( not ( = ?auto_627704 ?auto_627714 ) ) ( not ( = ?auto_627704 ?auto_627715 ) ) ( not ( = ?auto_627704 ?auto_627716 ) ) ( not ( = ?auto_627704 ?auto_627717 ) ) ( not ( = ?auto_627704 ?auto_627718 ) ) ( not ( = ?auto_627705 ?auto_627706 ) ) ( not ( = ?auto_627705 ?auto_627707 ) ) ( not ( = ?auto_627705 ?auto_627708 ) ) ( not ( = ?auto_627705 ?auto_627709 ) ) ( not ( = ?auto_627705 ?auto_627710 ) ) ( not ( = ?auto_627705 ?auto_627711 ) ) ( not ( = ?auto_627705 ?auto_627712 ) ) ( not ( = ?auto_627705 ?auto_627713 ) ) ( not ( = ?auto_627705 ?auto_627714 ) ) ( not ( = ?auto_627705 ?auto_627715 ) ) ( not ( = ?auto_627705 ?auto_627716 ) ) ( not ( = ?auto_627705 ?auto_627717 ) ) ( not ( = ?auto_627705 ?auto_627718 ) ) ( not ( = ?auto_627706 ?auto_627707 ) ) ( not ( = ?auto_627706 ?auto_627708 ) ) ( not ( = ?auto_627706 ?auto_627709 ) ) ( not ( = ?auto_627706 ?auto_627710 ) ) ( not ( = ?auto_627706 ?auto_627711 ) ) ( not ( = ?auto_627706 ?auto_627712 ) ) ( not ( = ?auto_627706 ?auto_627713 ) ) ( not ( = ?auto_627706 ?auto_627714 ) ) ( not ( = ?auto_627706 ?auto_627715 ) ) ( not ( = ?auto_627706 ?auto_627716 ) ) ( not ( = ?auto_627706 ?auto_627717 ) ) ( not ( = ?auto_627706 ?auto_627718 ) ) ( not ( = ?auto_627707 ?auto_627708 ) ) ( not ( = ?auto_627707 ?auto_627709 ) ) ( not ( = ?auto_627707 ?auto_627710 ) ) ( not ( = ?auto_627707 ?auto_627711 ) ) ( not ( = ?auto_627707 ?auto_627712 ) ) ( not ( = ?auto_627707 ?auto_627713 ) ) ( not ( = ?auto_627707 ?auto_627714 ) ) ( not ( = ?auto_627707 ?auto_627715 ) ) ( not ( = ?auto_627707 ?auto_627716 ) ) ( not ( = ?auto_627707 ?auto_627717 ) ) ( not ( = ?auto_627707 ?auto_627718 ) ) ( not ( = ?auto_627708 ?auto_627709 ) ) ( not ( = ?auto_627708 ?auto_627710 ) ) ( not ( = ?auto_627708 ?auto_627711 ) ) ( not ( = ?auto_627708 ?auto_627712 ) ) ( not ( = ?auto_627708 ?auto_627713 ) ) ( not ( = ?auto_627708 ?auto_627714 ) ) ( not ( = ?auto_627708 ?auto_627715 ) ) ( not ( = ?auto_627708 ?auto_627716 ) ) ( not ( = ?auto_627708 ?auto_627717 ) ) ( not ( = ?auto_627708 ?auto_627718 ) ) ( not ( = ?auto_627709 ?auto_627710 ) ) ( not ( = ?auto_627709 ?auto_627711 ) ) ( not ( = ?auto_627709 ?auto_627712 ) ) ( not ( = ?auto_627709 ?auto_627713 ) ) ( not ( = ?auto_627709 ?auto_627714 ) ) ( not ( = ?auto_627709 ?auto_627715 ) ) ( not ( = ?auto_627709 ?auto_627716 ) ) ( not ( = ?auto_627709 ?auto_627717 ) ) ( not ( = ?auto_627709 ?auto_627718 ) ) ( not ( = ?auto_627710 ?auto_627711 ) ) ( not ( = ?auto_627710 ?auto_627712 ) ) ( not ( = ?auto_627710 ?auto_627713 ) ) ( not ( = ?auto_627710 ?auto_627714 ) ) ( not ( = ?auto_627710 ?auto_627715 ) ) ( not ( = ?auto_627710 ?auto_627716 ) ) ( not ( = ?auto_627710 ?auto_627717 ) ) ( not ( = ?auto_627710 ?auto_627718 ) ) ( not ( = ?auto_627711 ?auto_627712 ) ) ( not ( = ?auto_627711 ?auto_627713 ) ) ( not ( = ?auto_627711 ?auto_627714 ) ) ( not ( = ?auto_627711 ?auto_627715 ) ) ( not ( = ?auto_627711 ?auto_627716 ) ) ( not ( = ?auto_627711 ?auto_627717 ) ) ( not ( = ?auto_627711 ?auto_627718 ) ) ( not ( = ?auto_627712 ?auto_627713 ) ) ( not ( = ?auto_627712 ?auto_627714 ) ) ( not ( = ?auto_627712 ?auto_627715 ) ) ( not ( = ?auto_627712 ?auto_627716 ) ) ( not ( = ?auto_627712 ?auto_627717 ) ) ( not ( = ?auto_627712 ?auto_627718 ) ) ( not ( = ?auto_627713 ?auto_627714 ) ) ( not ( = ?auto_627713 ?auto_627715 ) ) ( not ( = ?auto_627713 ?auto_627716 ) ) ( not ( = ?auto_627713 ?auto_627717 ) ) ( not ( = ?auto_627713 ?auto_627718 ) ) ( not ( = ?auto_627714 ?auto_627715 ) ) ( not ( = ?auto_627714 ?auto_627716 ) ) ( not ( = ?auto_627714 ?auto_627717 ) ) ( not ( = ?auto_627714 ?auto_627718 ) ) ( not ( = ?auto_627715 ?auto_627716 ) ) ( not ( = ?auto_627715 ?auto_627717 ) ) ( not ( = ?auto_627715 ?auto_627718 ) ) ( not ( = ?auto_627716 ?auto_627717 ) ) ( not ( = ?auto_627716 ?auto_627718 ) ) ( not ( = ?auto_627717 ?auto_627718 ) ) ( ON ?auto_627702 ?auto_627719 ) ( not ( = ?auto_627718 ?auto_627719 ) ) ( not ( = ?auto_627717 ?auto_627719 ) ) ( not ( = ?auto_627716 ?auto_627719 ) ) ( not ( = ?auto_627715 ?auto_627719 ) ) ( not ( = ?auto_627714 ?auto_627719 ) ) ( not ( = ?auto_627713 ?auto_627719 ) ) ( not ( = ?auto_627712 ?auto_627719 ) ) ( not ( = ?auto_627711 ?auto_627719 ) ) ( not ( = ?auto_627710 ?auto_627719 ) ) ( not ( = ?auto_627709 ?auto_627719 ) ) ( not ( = ?auto_627708 ?auto_627719 ) ) ( not ( = ?auto_627707 ?auto_627719 ) ) ( not ( = ?auto_627706 ?auto_627719 ) ) ( not ( = ?auto_627705 ?auto_627719 ) ) ( not ( = ?auto_627704 ?auto_627719 ) ) ( not ( = ?auto_627703 ?auto_627719 ) ) ( not ( = ?auto_627702 ?auto_627719 ) ) ( ON ?auto_627703 ?auto_627702 ) ( ON ?auto_627704 ?auto_627703 ) ( ON ?auto_627705 ?auto_627704 ) ( ON ?auto_627706 ?auto_627705 ) ( ON ?auto_627707 ?auto_627706 ) ( ON ?auto_627708 ?auto_627707 ) ( ON ?auto_627709 ?auto_627708 ) ( ON ?auto_627710 ?auto_627709 ) ( ON ?auto_627711 ?auto_627710 ) ( ON ?auto_627712 ?auto_627711 ) ( ON ?auto_627713 ?auto_627712 ) ( ON ?auto_627714 ?auto_627713 ) ( ON ?auto_627715 ?auto_627714 ) ( ON ?auto_627716 ?auto_627715 ) ( ON ?auto_627717 ?auto_627716 ) ( ON ?auto_627718 ?auto_627717 ) ( CLEAR ?auto_627718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_627718 ?auto_627717 ?auto_627716 ?auto_627715 ?auto_627714 ?auto_627713 ?auto_627712 ?auto_627711 ?auto_627710 ?auto_627709 ?auto_627708 ?auto_627707 ?auto_627706 ?auto_627705 ?auto_627704 ?auto_627703 ?auto_627702 )
      ( MAKE-17PILE ?auto_627702 ?auto_627703 ?auto_627704 ?auto_627705 ?auto_627706 ?auto_627707 ?auto_627708 ?auto_627709 ?auto_627710 ?auto_627711 ?auto_627712 ?auto_627713 ?auto_627714 ?auto_627715 ?auto_627716 ?auto_627717 ?auto_627718 ) )
  )

)

